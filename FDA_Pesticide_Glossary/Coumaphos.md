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
-3.159849, -0.1361949, -2.131858, 1, 0, 0, 1,
-3.068427, 1.268416, -1.393219, 1, 0.007843138, 0, 1,
-2.760843, -1.20172, -3.587997, 1, 0.01176471, 0, 1,
-2.7035, -0.4121805, -1.446948, 1, 0.01960784, 0, 1,
-2.688717, -0.8808946, -1.380447, 1, 0.02352941, 0, 1,
-2.612476, -0.5757133, -1.553089, 1, 0.03137255, 0, 1,
-2.508669, -1.698532, -2.805275, 1, 0.03529412, 0, 1,
-2.392762, 1.31733, -0.1970353, 1, 0.04313726, 0, 1,
-2.384562, -0.1799404, -0.9007438, 1, 0.04705882, 0, 1,
-2.291247, -0.08075468, -0.9760115, 1, 0.05490196, 0, 1,
-2.288945, -0.2382563, 0.05273018, 1, 0.05882353, 0, 1,
-2.277714, -0.3896053, -0.8449384, 1, 0.06666667, 0, 1,
-2.262522, 0.9753219, -0.5070575, 1, 0.07058824, 0, 1,
-2.22617, 0.7388011, -0.4158142, 1, 0.07843138, 0, 1,
-2.207758, -0.4488883, -0.9902115, 1, 0.08235294, 0, 1,
-2.151037, -0.2068324, -3.437244, 1, 0.09019608, 0, 1,
-2.121269, 1.094876, -2.636436, 1, 0.09411765, 0, 1,
-2.115051, 0.8565744, -1.70664, 1, 0.1019608, 0, 1,
-1.983512, 3.215083, -1.131556, 1, 0.1098039, 0, 1,
-1.97906, -1.224164, -1.337155, 1, 0.1137255, 0, 1,
-1.971811, -0.6113397, -0.57851, 1, 0.1215686, 0, 1,
-1.938983, -1.78922, -2.439813, 1, 0.1254902, 0, 1,
-1.937772, 1.763369, -0.944232, 1, 0.1333333, 0, 1,
-1.906283, -1.058355, -0.6334552, 1, 0.1372549, 0, 1,
-1.891203, 0.06710829, -0.7359554, 1, 0.145098, 0, 1,
-1.883858, -0.4022722, -2.270734, 1, 0.1490196, 0, 1,
-1.879213, -0.6918262, -1.49034, 1, 0.1568628, 0, 1,
-1.875451, 0.6007009, -1.955958, 1, 0.1607843, 0, 1,
-1.874172, -0.3270192, -1.440816, 1, 0.1686275, 0, 1,
-1.855213, -1.77406, -1.327857, 1, 0.172549, 0, 1,
-1.831326, 1.505894, -0.03091611, 1, 0.1803922, 0, 1,
-1.823831, -0.0650356, -2.807741, 1, 0.1843137, 0, 1,
-1.80618, -0.01604235, -0.3405509, 1, 0.1921569, 0, 1,
-1.801201, 0.525435, -2.97094, 1, 0.1960784, 0, 1,
-1.793533, -0.8810415, -1.116272, 1, 0.2039216, 0, 1,
-1.743892, -0.5910713, -1.44784, 1, 0.2117647, 0, 1,
-1.729909, -1.176623, -3.101637, 1, 0.2156863, 0, 1,
-1.725202, 1.702204, -0.6403583, 1, 0.2235294, 0, 1,
-1.719809, -0.6195835, -1.521698, 1, 0.227451, 0, 1,
-1.710343, 1.136226, -0.5550801, 1, 0.2352941, 0, 1,
-1.710148, -0.5966386, -3.769612, 1, 0.2392157, 0, 1,
-1.709785, -0.179618, -2.286688, 1, 0.2470588, 0, 1,
-1.706774, -0.07210264, -2.608875, 1, 0.2509804, 0, 1,
-1.70674, -0.1261037, -3.762737, 1, 0.2588235, 0, 1,
-1.689585, 1.826995, -0.1293678, 1, 0.2627451, 0, 1,
-1.681043, -0.04105468, -1.882535, 1, 0.2705882, 0, 1,
-1.680631, 0.2488815, -1.041193, 1, 0.2745098, 0, 1,
-1.674567, 0.1817887, -1.27044, 1, 0.282353, 0, 1,
-1.665165, -0.9719908, -2.83384, 1, 0.2862745, 0, 1,
-1.66216, -1.541957, -2.064632, 1, 0.2941177, 0, 1,
-1.648734, 1.572757, -0.3839137, 1, 0.3019608, 0, 1,
-1.646363, -0.2723904, -1.815945, 1, 0.3058824, 0, 1,
-1.634655, 1.256025, -1.384829, 1, 0.3137255, 0, 1,
-1.621523, 0.3241417, -0.9305231, 1, 0.3176471, 0, 1,
-1.614384, 0.6438841, -1.655093, 1, 0.3254902, 0, 1,
-1.611601, 1.540223, -1.378435, 1, 0.3294118, 0, 1,
-1.590125, -0.1365035, -3.381115, 1, 0.3372549, 0, 1,
-1.576304, 0.4955553, -0.03945529, 1, 0.3411765, 0, 1,
-1.549289, 0.672216, 2.048706, 1, 0.3490196, 0, 1,
-1.546788, -1.328455, -1.990998, 1, 0.3529412, 0, 1,
-1.517847, -0.9875074, -1.390152, 1, 0.3607843, 0, 1,
-1.512441, 0.368115, -2.157116, 1, 0.3647059, 0, 1,
-1.5052, -0.2689119, -0.4966477, 1, 0.372549, 0, 1,
-1.502547, 0.01435671, -0.4621921, 1, 0.3764706, 0, 1,
-1.494078, 0.65041, -0.2196424, 1, 0.3843137, 0, 1,
-1.488322, 0.7474078, -1.348018, 1, 0.3882353, 0, 1,
-1.486791, -0.5557974, -3.134289, 1, 0.3960784, 0, 1,
-1.483805, -0.1359759, -0.8839865, 1, 0.4039216, 0, 1,
-1.483737, 0.1083158, -1.198433, 1, 0.4078431, 0, 1,
-1.476708, 1.658794, -0.7904372, 1, 0.4156863, 0, 1,
-1.45944, 1.051418, 0.7714095, 1, 0.4196078, 0, 1,
-1.451347, 0.1448448, -2.679358, 1, 0.427451, 0, 1,
-1.446629, -0.5373975, -2.859244, 1, 0.4313726, 0, 1,
-1.439199, 1.090004, -0.6659682, 1, 0.4392157, 0, 1,
-1.438756, -0.02042315, 0.1083254, 1, 0.4431373, 0, 1,
-1.43409, 0.7373887, -1.316797, 1, 0.4509804, 0, 1,
-1.432875, -0.9781535, -3.27998, 1, 0.454902, 0, 1,
-1.42858, -0.8116583, -0.9039609, 1, 0.4627451, 0, 1,
-1.42754, 0.1882038, -1.785899, 1, 0.4666667, 0, 1,
-1.422002, 0.1981839, -0.4427728, 1, 0.4745098, 0, 1,
-1.401975, 1.216227, -0.5527734, 1, 0.4784314, 0, 1,
-1.401389, 0.77123, -1.717596, 1, 0.4862745, 0, 1,
-1.381097, 0.1492227, -0.1093175, 1, 0.4901961, 0, 1,
-1.378477, 0.7214826, -0.6401225, 1, 0.4980392, 0, 1,
-1.365175, 0.1791968, -1.246339, 1, 0.5058824, 0, 1,
-1.361107, 1.097919, -0.3856627, 1, 0.509804, 0, 1,
-1.360723, -0.2921637, -0.7801728, 1, 0.5176471, 0, 1,
-1.358787, -0.4154231, -2.416533, 1, 0.5215687, 0, 1,
-1.357716, -0.1117949, -1.913372, 1, 0.5294118, 0, 1,
-1.357557, -0.557234, -1.876766, 1, 0.5333334, 0, 1,
-1.35408, -0.4828061, -1.572202, 1, 0.5411765, 0, 1,
-1.340165, -1.157203, -2.802376, 1, 0.5450981, 0, 1,
-1.336827, -0.1773608, -2.282912, 1, 0.5529412, 0, 1,
-1.317411, -1.569662, -0.1247152, 1, 0.5568628, 0, 1,
-1.300153, -0.2735148, -1.786006, 1, 0.5647059, 0, 1,
-1.298867, -0.7555764, -2.728891, 1, 0.5686275, 0, 1,
-1.290933, -0.2868005, 0.5008138, 1, 0.5764706, 0, 1,
-1.289305, 0.3801028, -0.6293154, 1, 0.5803922, 0, 1,
-1.288699, 2.299012, -0.3389641, 1, 0.5882353, 0, 1,
-1.285197, -1.001328, -2.456572, 1, 0.5921569, 0, 1,
-1.28409, -2.028679, -1.538527, 1, 0.6, 0, 1,
-1.276102, 0.9758457, 0.7412793, 1, 0.6078432, 0, 1,
-1.272235, -0.2453306, -1.338736, 1, 0.6117647, 0, 1,
-1.271555, 1.489868, -2.523644, 1, 0.6196079, 0, 1,
-1.267692, -1.715893, -2.114798, 1, 0.6235294, 0, 1,
-1.257061, 1.419461, 0.05809477, 1, 0.6313726, 0, 1,
-1.25421, 0.1438614, -0.3934153, 1, 0.6352941, 0, 1,
-1.253788, 0.3463602, -0.2533582, 1, 0.6431373, 0, 1,
-1.246061, 0.5371751, -1.454813, 1, 0.6470588, 0, 1,
-1.236394, -0.4554945, -2.715125, 1, 0.654902, 0, 1,
-1.222477, -1.18914, -2.016588, 1, 0.6588235, 0, 1,
-1.222035, 1.886577, 0.3862832, 1, 0.6666667, 0, 1,
-1.215005, 1.421408, 0.6392035, 1, 0.6705883, 0, 1,
-1.200942, 0.04101257, -1.629058, 1, 0.6784314, 0, 1,
-1.19453, -0.5111834, -1.173632, 1, 0.682353, 0, 1,
-1.194079, -0.4289294, -3.183852, 1, 0.6901961, 0, 1,
-1.19313, 0.9448001, -1.184846, 1, 0.6941177, 0, 1,
-1.190818, -0.1130196, 0.8095002, 1, 0.7019608, 0, 1,
-1.189854, 0.6915794, -2.038978, 1, 0.7098039, 0, 1,
-1.186188, -1.50746, -2.637315, 1, 0.7137255, 0, 1,
-1.17943, -0.7859528, -2.157283, 1, 0.7215686, 0, 1,
-1.169357, 0.4154197, 0.3087584, 1, 0.7254902, 0, 1,
-1.169023, -3.32357, -0.3195877, 1, 0.7333333, 0, 1,
-1.150426, 0.8134599, -0.6363866, 1, 0.7372549, 0, 1,
-1.143501, -0.2832683, -1.285742, 1, 0.7450981, 0, 1,
-1.143001, 0.5553328, -1.969333, 1, 0.7490196, 0, 1,
-1.14015, 0.559575, -1.257374, 1, 0.7568628, 0, 1,
-1.133362, 0.5015956, -2.525163, 1, 0.7607843, 0, 1,
-1.130708, -0.8070527, -2.978306, 1, 0.7686275, 0, 1,
-1.126081, -1.580097, -2.822999, 1, 0.772549, 0, 1,
-1.121256, -0.2569521, -2.024186, 1, 0.7803922, 0, 1,
-1.113172, 0.914309, -0.293543, 1, 0.7843137, 0, 1,
-1.111591, -1.133403, -3.341872, 1, 0.7921569, 0, 1,
-1.110024, -0.4026709, -1.992405, 1, 0.7960784, 0, 1,
-1.108413, 0.3301003, -2.435071, 1, 0.8039216, 0, 1,
-1.099831, 0.261351, -2.001736, 1, 0.8117647, 0, 1,
-1.099423, -0.09254187, -2.857413, 1, 0.8156863, 0, 1,
-1.09581, 0.4999026, -1.086357, 1, 0.8235294, 0, 1,
-1.091662, 1.64963, -1.18215, 1, 0.827451, 0, 1,
-1.089342, 0.2645348, -1.474559, 1, 0.8352941, 0, 1,
-1.089008, 0.02922855, -1.308812, 1, 0.8392157, 0, 1,
-1.086903, -0.8917983, -3.288825, 1, 0.8470588, 0, 1,
-1.083371, 0.4824844, -0.08131251, 1, 0.8509804, 0, 1,
-1.079604, 0.5387614, -2.07899, 1, 0.8588235, 0, 1,
-1.072583, -0.7515003, -2.077917, 1, 0.8627451, 0, 1,
-1.071198, -0.7904639, -1.833594, 1, 0.8705882, 0, 1,
-1.070852, -2.168164, -1.539942, 1, 0.8745098, 0, 1,
-1.062758, -2.020801, -3.134979, 1, 0.8823529, 0, 1,
-1.057492, -0.896614, -3.790486, 1, 0.8862745, 0, 1,
-1.057141, 1.462504, -0.2637299, 1, 0.8941177, 0, 1,
-1.05512, 0.8039494, -1.05373, 1, 0.8980392, 0, 1,
-1.052834, 0.3058817, -0.2312981, 1, 0.9058824, 0, 1,
-1.052576, -0.5809577, -2.676418, 1, 0.9137255, 0, 1,
-1.048776, 0.7534521, -0.5531369, 1, 0.9176471, 0, 1,
-1.047412, 1.235016, -0.4541056, 1, 0.9254902, 0, 1,
-1.047345, -0.8615881, -1.853302, 1, 0.9294118, 0, 1,
-1.041961, -0.5461597, -1.337812, 1, 0.9372549, 0, 1,
-1.036996, 0.2177099, -0.9736981, 1, 0.9411765, 0, 1,
-1.033033, -0.3618241, -0.514723, 1, 0.9490196, 0, 1,
-1.029974, 1.06597, -0.4887599, 1, 0.9529412, 0, 1,
-1.025342, -1.120578, -3.010404, 1, 0.9607843, 0, 1,
-1.013314, -2.295812, -1.765864, 1, 0.9647059, 0, 1,
-1.009915, 0.9894617, -1.163601, 1, 0.972549, 0, 1,
-0.9967642, 1.158852, -0.7063201, 1, 0.9764706, 0, 1,
-0.985983, 2.294625, -1.1974, 1, 0.9843137, 0, 1,
-0.974086, 1.198194, -1.691413, 1, 0.9882353, 0, 1,
-0.9716802, -0.3543658, -2.69139, 1, 0.9960784, 0, 1,
-0.9687097, 0.7669621, -1.212198, 0.9960784, 1, 0, 1,
-0.964178, 1.536983, -0.3425499, 0.9921569, 1, 0, 1,
-0.9606957, -0.6130001, -2.204145, 0.9843137, 1, 0, 1,
-0.9579343, -1.853083, -1.945611, 0.9803922, 1, 0, 1,
-0.954686, -0.5147228, -2.426595, 0.972549, 1, 0, 1,
-0.9473126, 0.9956307, -1.345075, 0.9686275, 1, 0, 1,
-0.9462357, -2.427372, -3.459049, 0.9607843, 1, 0, 1,
-0.9407117, -0.3938021, -0.9343867, 0.9568627, 1, 0, 1,
-0.9399764, -1.569032, -1.972324, 0.9490196, 1, 0, 1,
-0.9262945, -0.2121853, -1.088567, 0.945098, 1, 0, 1,
-0.9247532, -1.392531, -1.978283, 0.9372549, 1, 0, 1,
-0.9224821, 0.4737873, -1.758066, 0.9333333, 1, 0, 1,
-0.9129658, 0.03983871, 0.3981235, 0.9254902, 1, 0, 1,
-0.9117579, 0.4586986, -1.29489, 0.9215686, 1, 0, 1,
-0.905423, 0.7120676, 0.3518849, 0.9137255, 1, 0, 1,
-0.8992246, 0.7511226, -0.8309231, 0.9098039, 1, 0, 1,
-0.8942953, -0.5482127, -1.441684, 0.9019608, 1, 0, 1,
-0.8941299, 0.80132, -0.2226148, 0.8941177, 1, 0, 1,
-0.8933876, -0.2485221, -2.964527, 0.8901961, 1, 0, 1,
-0.8924408, 1.546376, -0.7280746, 0.8823529, 1, 0, 1,
-0.8895405, -0.5863146, -0.4414409, 0.8784314, 1, 0, 1,
-0.8894057, 1.787136, -0.1892556, 0.8705882, 1, 0, 1,
-0.8893839, -0.5748966, -2.636278, 0.8666667, 1, 0, 1,
-0.8804137, 0.7818501, -0.7758158, 0.8588235, 1, 0, 1,
-0.8797695, 1.266167, -0.3250796, 0.854902, 1, 0, 1,
-0.8784909, 0.9853117, 0.569295, 0.8470588, 1, 0, 1,
-0.8708111, -0.02765706, 0.419723, 0.8431373, 1, 0, 1,
-0.8707644, -0.5856418, -3.241094, 0.8352941, 1, 0, 1,
-0.870688, 0.5596791, 1.545364, 0.8313726, 1, 0, 1,
-0.8658978, 0.05470955, -0.05653563, 0.8235294, 1, 0, 1,
-0.8635864, 0.142147, -2.059459, 0.8196079, 1, 0, 1,
-0.8624714, -0.6782174, -0.6351961, 0.8117647, 1, 0, 1,
-0.855376, 1.609003, -0.4170954, 0.8078431, 1, 0, 1,
-0.8511865, 0.1010213, -2.344322, 0.8, 1, 0, 1,
-0.8459677, -0.6685778, -3.580895, 0.7921569, 1, 0, 1,
-0.8430957, 1.921439, -0.300869, 0.7882353, 1, 0, 1,
-0.8414394, 0.6984316, 0.6805487, 0.7803922, 1, 0, 1,
-0.8386681, -1.924799, -3.44982, 0.7764706, 1, 0, 1,
-0.8313268, 0.472292, -2.063343, 0.7686275, 1, 0, 1,
-0.8285449, 2.055012, -2.748614, 0.7647059, 1, 0, 1,
-0.8277322, 0.2098512, -1.086819, 0.7568628, 1, 0, 1,
-0.8273533, 0.8272092, 0.2952025, 0.7529412, 1, 0, 1,
-0.8256575, -0.8337079, -1.881169, 0.7450981, 1, 0, 1,
-0.8249411, 0.6119646, -0.4412568, 0.7411765, 1, 0, 1,
-0.8220039, -2.317177, -2.245667, 0.7333333, 1, 0, 1,
-0.8210731, -0.8365024, -2.214358, 0.7294118, 1, 0, 1,
-0.820588, 0.254144, -0.7478278, 0.7215686, 1, 0, 1,
-0.8196475, 0.1811458, -2.430493, 0.7176471, 1, 0, 1,
-0.8188344, 1.021516, -3.174133, 0.7098039, 1, 0, 1,
-0.8176343, -0.174722, -1.073502, 0.7058824, 1, 0, 1,
-0.8140644, 0.2912316, -0.06940173, 0.6980392, 1, 0, 1,
-0.8134649, 1.16498, -1.395699, 0.6901961, 1, 0, 1,
-0.8130081, -1.510332, -2.019794, 0.6862745, 1, 0, 1,
-0.8114208, 0.242635, -3.336065, 0.6784314, 1, 0, 1,
-0.809942, -0.9392575, -2.045134, 0.6745098, 1, 0, 1,
-0.8083032, -0.9388372, -2.927845, 0.6666667, 1, 0, 1,
-0.8051959, 1.460188, 0.651455, 0.6627451, 1, 0, 1,
-0.8023036, 0.05665511, -1.868726, 0.654902, 1, 0, 1,
-0.8006127, 0.1749413, -1.397507, 0.6509804, 1, 0, 1,
-0.7999632, -0.9692996, -2.213295, 0.6431373, 1, 0, 1,
-0.793961, -0.8162249, -3.584588, 0.6392157, 1, 0, 1,
-0.7866728, 0.6666902, 0.09538549, 0.6313726, 1, 0, 1,
-0.7845367, 1.28886, 1.038915, 0.627451, 1, 0, 1,
-0.7798764, -1.205506, -2.903281, 0.6196079, 1, 0, 1,
-0.7779765, 0.8936232, -0.7853996, 0.6156863, 1, 0, 1,
-0.7756295, -0.2607786, 0.4144057, 0.6078432, 1, 0, 1,
-0.77436, 0.6589843, -0.8708617, 0.6039216, 1, 0, 1,
-0.7669062, -1.786311, -2.49518, 0.5960785, 1, 0, 1,
-0.7604514, -1.393973, -1.870627, 0.5882353, 1, 0, 1,
-0.7573684, 2.258374, -1.935741, 0.5843138, 1, 0, 1,
-0.7565029, 0.887684, -0.5645327, 0.5764706, 1, 0, 1,
-0.749744, -0.5558591, -2.224246, 0.572549, 1, 0, 1,
-0.7453756, 1.379735, -0.3560146, 0.5647059, 1, 0, 1,
-0.7447512, -0.9464427, -2.439461, 0.5607843, 1, 0, 1,
-0.7435964, 0.7851493, -1.190766, 0.5529412, 1, 0, 1,
-0.742859, -2.576202, -0.6455399, 0.5490196, 1, 0, 1,
-0.7408684, -0.8533667, -2.467751, 0.5411765, 1, 0, 1,
-0.7364851, 1.398256, -0.07596985, 0.5372549, 1, 0, 1,
-0.7214642, 0.8647096, 0.7950979, 0.5294118, 1, 0, 1,
-0.7148624, -1.348461, -2.905447, 0.5254902, 1, 0, 1,
-0.7110552, 0.553839, -1.074925, 0.5176471, 1, 0, 1,
-0.7011536, 0.1049831, -2.813453, 0.5137255, 1, 0, 1,
-0.7011185, -0.8471197, -1.561165, 0.5058824, 1, 0, 1,
-0.697072, 0.9564489, -0.5567967, 0.5019608, 1, 0, 1,
-0.69424, 0.5540692, -0.09394328, 0.4941176, 1, 0, 1,
-0.6942117, 0.4568901, -0.9962541, 0.4862745, 1, 0, 1,
-0.6888947, -0.2280992, -2.164898, 0.4823529, 1, 0, 1,
-0.6884341, -0.2844824, -1.968847, 0.4745098, 1, 0, 1,
-0.6837238, 0.4133095, -1.467963, 0.4705882, 1, 0, 1,
-0.6830036, -0.8032004, -1.630353, 0.4627451, 1, 0, 1,
-0.6825121, 1.2624, -2.324279, 0.4588235, 1, 0, 1,
-0.6801865, -2.187414, -3.153932, 0.4509804, 1, 0, 1,
-0.678864, -1.111006, -3.369381, 0.4470588, 1, 0, 1,
-0.6736317, 0.1024853, -1.533914, 0.4392157, 1, 0, 1,
-0.6702844, -0.1540938, -3.523545, 0.4352941, 1, 0, 1,
-0.6647676, -0.121389, 0.4895705, 0.427451, 1, 0, 1,
-0.6568802, 0.6734289, 0.7722528, 0.4235294, 1, 0, 1,
-0.65195, -0.7061459, -2.170224, 0.4156863, 1, 0, 1,
-0.6488963, -0.7403859, -2.985289, 0.4117647, 1, 0, 1,
-0.6479416, -0.4170077, -2.047908, 0.4039216, 1, 0, 1,
-0.6452948, 1.424135, 1.585585, 0.3960784, 1, 0, 1,
-0.6408516, 1.252288, -1.79222, 0.3921569, 1, 0, 1,
-0.6407018, 1.572373, -1.033601, 0.3843137, 1, 0, 1,
-0.6358554, -0.5419216, -0.7914871, 0.3803922, 1, 0, 1,
-0.6349481, -0.7380269, -3.562574, 0.372549, 1, 0, 1,
-0.6340088, -2.674288, -3.576524, 0.3686275, 1, 0, 1,
-0.6339289, -0.4705604, -4.217687, 0.3607843, 1, 0, 1,
-0.6323366, 0.06702524, 0.09053558, 0.3568628, 1, 0, 1,
-0.6285201, 0.223375, -2.40357, 0.3490196, 1, 0, 1,
-0.6265494, 0.6200918, -0.474289, 0.345098, 1, 0, 1,
-0.6265122, 1.272518, -0.3501489, 0.3372549, 1, 0, 1,
-0.6133914, 0.5256456, -0.7781649, 0.3333333, 1, 0, 1,
-0.6085086, -0.4943165, -1.384703, 0.3254902, 1, 0, 1,
-0.6084338, -0.3500175, -2.945064, 0.3215686, 1, 0, 1,
-0.6061758, -0.5203826, -1.233009, 0.3137255, 1, 0, 1,
-0.6060318, 0.5968205, -0.5357999, 0.3098039, 1, 0, 1,
-0.6032241, 0.6131259, -0.2403262, 0.3019608, 1, 0, 1,
-0.5933121, -0.1426221, -2.787237, 0.2941177, 1, 0, 1,
-0.5874875, -1.867142, -3.267477, 0.2901961, 1, 0, 1,
-0.5854937, 1.18056, 0.2061032, 0.282353, 1, 0, 1,
-0.5787991, 0.2153238, -2.398891, 0.2784314, 1, 0, 1,
-0.5787187, -1.029101, -3.032933, 0.2705882, 1, 0, 1,
-0.578174, -2.331216, -3.510379, 0.2666667, 1, 0, 1,
-0.5770243, 0.09352338, -3.835434, 0.2588235, 1, 0, 1,
-0.5757318, -0.4271861, -1.903443, 0.254902, 1, 0, 1,
-0.5688925, 0.4915113, -0.406852, 0.2470588, 1, 0, 1,
-0.5669615, 0.334399, -0.6406648, 0.2431373, 1, 0, 1,
-0.5658919, -0.544384, -3.124685, 0.2352941, 1, 0, 1,
-0.5648208, -0.7511377, -2.472259, 0.2313726, 1, 0, 1,
-0.5632075, 1.107543, 2.013946, 0.2235294, 1, 0, 1,
-0.5626984, -1.047067, -3.447017, 0.2196078, 1, 0, 1,
-0.5613744, 0.0837134, -1.878715, 0.2117647, 1, 0, 1,
-0.5586121, 0.4002513, 0.06036923, 0.2078431, 1, 0, 1,
-0.5522222, 0.5213227, -1.175198, 0.2, 1, 0, 1,
-0.5507213, -1.218968, -3.379713, 0.1921569, 1, 0, 1,
-0.5466103, -1.995409, -4.581833, 0.1882353, 1, 0, 1,
-0.5452064, 0.6397423, -1.615713, 0.1803922, 1, 0, 1,
-0.5382479, 0.009154771, -2.511161, 0.1764706, 1, 0, 1,
-0.5372736, -0.7164366, -1.912179, 0.1686275, 1, 0, 1,
-0.531469, 0.2896358, -1.651034, 0.1647059, 1, 0, 1,
-0.5302939, 0.6217317, 0.06779601, 0.1568628, 1, 0, 1,
-0.5231351, -1.626519, -2.967822, 0.1529412, 1, 0, 1,
-0.5219995, 0.5094436, -2.101224, 0.145098, 1, 0, 1,
-0.5165703, 1.157473, -0.2015705, 0.1411765, 1, 0, 1,
-0.5164564, -0.4441542, -1.887821, 0.1333333, 1, 0, 1,
-0.5104054, -0.8286948, -4.339046, 0.1294118, 1, 0, 1,
-0.5050907, 0.9968802, -0.4317155, 0.1215686, 1, 0, 1,
-0.5050198, -0.7890136, -2.819332, 0.1176471, 1, 0, 1,
-0.5036476, -1.231527, -3.031083, 0.1098039, 1, 0, 1,
-0.500429, 1.440903, -1.023648, 0.1058824, 1, 0, 1,
-0.4984034, 1.175458, -0.259202, 0.09803922, 1, 0, 1,
-0.4908256, 1.379577, 0.7402077, 0.09019608, 1, 0, 1,
-0.4857123, 1.482838, 0.09416139, 0.08627451, 1, 0, 1,
-0.4815474, 0.2494081, -2.212544, 0.07843138, 1, 0, 1,
-0.4787742, -0.3253575, -1.94673, 0.07450981, 1, 0, 1,
-0.4695772, 0.5732437, 0.7685088, 0.06666667, 1, 0, 1,
-0.4667981, -1.187611, -1.232381, 0.0627451, 1, 0, 1,
-0.4628386, -0.4415029, -2.071805, 0.05490196, 1, 0, 1,
-0.4627681, -0.8593426, -3.849492, 0.05098039, 1, 0, 1,
-0.4576892, -2.239513, -3.561144, 0.04313726, 1, 0, 1,
-0.4567076, -0.2925961, -3.064308, 0.03921569, 1, 0, 1,
-0.4542483, 0.4050525, -1.449912, 0.03137255, 1, 0, 1,
-0.4521694, 0.6541684, -1.724337, 0.02745098, 1, 0, 1,
-0.4499467, 0.1797686, -2.5127, 0.01960784, 1, 0, 1,
-0.439803, -1.182704, -2.368156, 0.01568628, 1, 0, 1,
-0.4383926, 1.073346, 0.01527789, 0.007843138, 1, 0, 1,
-0.4383203, -1.087743, -2.363538, 0.003921569, 1, 0, 1,
-0.4368088, -1.135762, -1.37186, 0, 1, 0.003921569, 1,
-0.4345421, -0.4288904, -2.96382, 0, 1, 0.01176471, 1,
-0.4312239, -0.3676034, -1.733122, 0, 1, 0.01568628, 1,
-0.4274741, 0.03474801, -0.7947558, 0, 1, 0.02352941, 1,
-0.4234906, -0.803186, -0.5794776, 0, 1, 0.02745098, 1,
-0.4214942, 0.01480054, -0.5083653, 0, 1, 0.03529412, 1,
-0.4201014, -1.329246, -1.654369, 0, 1, 0.03921569, 1,
-0.4195695, 0.6687046, 0.05023897, 0, 1, 0.04705882, 1,
-0.4182701, 0.3769906, -2.07326, 0, 1, 0.05098039, 1,
-0.4174218, 0.01274746, -1.539059, 0, 1, 0.05882353, 1,
-0.40543, -0.03186077, -1.828651, 0, 1, 0.0627451, 1,
-0.3998464, 1.027874, -1.516657, 0, 1, 0.07058824, 1,
-0.3948275, -0.7226047, -3.212085, 0, 1, 0.07450981, 1,
-0.3902699, -0.4271875, -2.996418, 0, 1, 0.08235294, 1,
-0.3898169, -0.5265133, -4.223386, 0, 1, 0.08627451, 1,
-0.3898168, 0.5353495, 0.2278542, 0, 1, 0.09411765, 1,
-0.3894496, -3.355744, -2.159509, 0, 1, 0.1019608, 1,
-0.3890615, -0.8220593, -1.95244, 0, 1, 0.1058824, 1,
-0.3888364, 1.304414, -0.216137, 0, 1, 0.1137255, 1,
-0.3871357, 1.67504, -0.0940602, 0, 1, 0.1176471, 1,
-0.3796388, -0.9654094, -3.315456, 0, 1, 0.1254902, 1,
-0.3781389, 0.5803537, -1.187394, 0, 1, 0.1294118, 1,
-0.3776507, -0.4218825, -3.510174, 0, 1, 0.1372549, 1,
-0.3775546, 0.1291409, -2.278155, 0, 1, 0.1411765, 1,
-0.3768848, 1.076171, 0.2977725, 0, 1, 0.1490196, 1,
-0.3682031, 0.7680302, -0.6542153, 0, 1, 0.1529412, 1,
-0.3636768, -1.083607, -3.639952, 0, 1, 0.1607843, 1,
-0.3617077, -0.5487415, -2.231559, 0, 1, 0.1647059, 1,
-0.3599753, 0.3216637, -0.04489885, 0, 1, 0.172549, 1,
-0.3583286, 0.1846675, -0.6148458, 0, 1, 0.1764706, 1,
-0.3582217, -0.9956789, -3.797666, 0, 1, 0.1843137, 1,
-0.3579449, 0.6949507, -0.3639228, 0, 1, 0.1882353, 1,
-0.3569368, -0.4726788, -3.289363, 0, 1, 0.1960784, 1,
-0.3561682, -0.1742931, -1.318854, 0, 1, 0.2039216, 1,
-0.3548962, 0.7903874, 0.3056721, 0, 1, 0.2078431, 1,
-0.3539072, -1.093337, -3.31415, 0, 1, 0.2156863, 1,
-0.3523545, -0.6138925, -1.340721, 0, 1, 0.2196078, 1,
-0.3516879, -0.3088866, -0.9177929, 0, 1, 0.227451, 1,
-0.3479515, -0.4794696, -3.762698, 0, 1, 0.2313726, 1,
-0.3450564, 0.9070064, -0.8307195, 0, 1, 0.2392157, 1,
-0.343149, -0.4759889, -0.3419658, 0, 1, 0.2431373, 1,
-0.342989, 1.25372, 0.1276693, 0, 1, 0.2509804, 1,
-0.3336835, 0.2702378, 0.7030162, 0, 1, 0.254902, 1,
-0.3327989, -0.5195287, -4.264581, 0, 1, 0.2627451, 1,
-0.3302996, 1.350827, 0.7537673, 0, 1, 0.2666667, 1,
-0.3295234, -0.2075078, -1.560849, 0, 1, 0.2745098, 1,
-0.3292021, 0.04671803, 0.5613501, 0, 1, 0.2784314, 1,
-0.3269647, 0.9500631, -0.1187329, 0, 1, 0.2862745, 1,
-0.3260971, 1.571532, 1.52626, 0, 1, 0.2901961, 1,
-0.3225786, -0.3519702, -1.895471, 0, 1, 0.2980392, 1,
-0.3217869, 0.8207994, 0.7847884, 0, 1, 0.3058824, 1,
-0.3208339, 1.433346, -0.1870541, 0, 1, 0.3098039, 1,
-0.320507, -1.560053, -3.223892, 0, 1, 0.3176471, 1,
-0.3194208, 0.172264, -0.6609867, 0, 1, 0.3215686, 1,
-0.3175654, 0.1452096, -2.078108, 0, 1, 0.3294118, 1,
-0.3169921, -0.8634368, -2.778115, 0, 1, 0.3333333, 1,
-0.3161871, 0.4483551, -0.9127375, 0, 1, 0.3411765, 1,
-0.3097405, 0.03442227, -2.053435, 0, 1, 0.345098, 1,
-0.309354, -0.4250557, -4.675084, 0, 1, 0.3529412, 1,
-0.302945, -0.1834307, -2.255679, 0, 1, 0.3568628, 1,
-0.3022286, 0.5817046, -2.007933, 0, 1, 0.3647059, 1,
-0.3009814, -0.8797309, -3.709037, 0, 1, 0.3686275, 1,
-0.2967462, -0.9416136, -1.371734, 0, 1, 0.3764706, 1,
-0.2899491, -1.135728, -3.533999, 0, 1, 0.3803922, 1,
-0.283213, 0.1528167, -1.586329, 0, 1, 0.3882353, 1,
-0.2828518, 0.2137162, 0.4273634, 0, 1, 0.3921569, 1,
-0.2824541, 1.018716, 0.6583258, 0, 1, 0.4, 1,
-0.2775822, -0.3371301, -3.470869, 0, 1, 0.4078431, 1,
-0.276272, -1.356, -2.321855, 0, 1, 0.4117647, 1,
-0.2738423, 0.05185643, -0.9048496, 0, 1, 0.4196078, 1,
-0.2687975, -2.164152, -1.996713, 0, 1, 0.4235294, 1,
-0.2686665, 0.04618658, -1.889944, 0, 1, 0.4313726, 1,
-0.2613114, -0.9635173, -2.675033, 0, 1, 0.4352941, 1,
-0.2599927, -1.032107, -2.514196, 0, 1, 0.4431373, 1,
-0.2574331, 1.480653, 1.002477, 0, 1, 0.4470588, 1,
-0.2556681, 0.2420946, -1.262858, 0, 1, 0.454902, 1,
-0.2544797, 0.6015049, -1.400446, 0, 1, 0.4588235, 1,
-0.2540358, -1.20151, -4.17802, 0, 1, 0.4666667, 1,
-0.2498216, 1.291988, -0.08699005, 0, 1, 0.4705882, 1,
-0.2493752, -1.761644, -2.131487, 0, 1, 0.4784314, 1,
-0.2364149, 1.131052, -1.520006, 0, 1, 0.4823529, 1,
-0.2257672, 0.2450432, -0.9195641, 0, 1, 0.4901961, 1,
-0.2236164, -1.331631, -3.627837, 0, 1, 0.4941176, 1,
-0.2195893, -0.6497786, -1.47779, 0, 1, 0.5019608, 1,
-0.2191039, -1.279664, -2.364643, 0, 1, 0.509804, 1,
-0.2184311, -1.258757, -2.173674, 0, 1, 0.5137255, 1,
-0.2145269, -0.800706, -3.200059, 0, 1, 0.5215687, 1,
-0.2144361, 1.514463, -0.1877118, 0, 1, 0.5254902, 1,
-0.2133326, -0.9019544, -4.394742, 0, 1, 0.5333334, 1,
-0.2125927, 0.4577255, -0.4848832, 0, 1, 0.5372549, 1,
-0.2097364, 0.9755291, -0.01933556, 0, 1, 0.5450981, 1,
-0.2005539, -0.02742526, -1.783735, 0, 1, 0.5490196, 1,
-0.1962557, -0.5450348, -3.629859, 0, 1, 0.5568628, 1,
-0.1959428, -0.1015826, -2.617013, 0, 1, 0.5607843, 1,
-0.1948301, -0.1339608, -3.257801, 0, 1, 0.5686275, 1,
-0.1910002, 1.188855, -0.189838, 0, 1, 0.572549, 1,
-0.1906725, 0.3124054, -0.109548, 0, 1, 0.5803922, 1,
-0.1891363, -0.9326133, -2.48621, 0, 1, 0.5843138, 1,
-0.1869651, -0.7454656, -3.406714, 0, 1, 0.5921569, 1,
-0.1856042, -1.234251, -1.849303, 0, 1, 0.5960785, 1,
-0.1797974, 0.200799, -1.537469, 0, 1, 0.6039216, 1,
-0.1797237, 1.094157, 1.436936, 0, 1, 0.6117647, 1,
-0.1739161, -0.08084409, -1.824963, 0, 1, 0.6156863, 1,
-0.1739137, 1.263146, 0.2715217, 0, 1, 0.6235294, 1,
-0.1730367, -0.8643783, -1.879663, 0, 1, 0.627451, 1,
-0.1705726, 0.428905, -0.01545374, 0, 1, 0.6352941, 1,
-0.1700663, 0.3177032, -0.3331361, 0, 1, 0.6392157, 1,
-0.1684117, 0.172225, -1.136715, 0, 1, 0.6470588, 1,
-0.1669613, 1.503731, 0.8172076, 0, 1, 0.6509804, 1,
-0.1652558, 0.5361559, -0.7615221, 0, 1, 0.6588235, 1,
-0.1649392, -0.7328733, -1.686895, 0, 1, 0.6627451, 1,
-0.157625, -1.566411, -2.457974, 0, 1, 0.6705883, 1,
-0.1574453, 1.588048, -1.070813, 0, 1, 0.6745098, 1,
-0.1569464, 0.9302663, -1.003264, 0, 1, 0.682353, 1,
-0.1562129, 0.8462934, -0.1586891, 0, 1, 0.6862745, 1,
-0.1551487, 1.322685, 0.4999196, 0, 1, 0.6941177, 1,
-0.1535249, 0.8292137, 0.3603695, 0, 1, 0.7019608, 1,
-0.1532826, 0.6184812, -0.4500134, 0, 1, 0.7058824, 1,
-0.1493246, -0.958768, -2.184662, 0, 1, 0.7137255, 1,
-0.1482811, 0.7935575, 0.8158878, 0, 1, 0.7176471, 1,
-0.146897, -0.7559463, -1.145237, 0, 1, 0.7254902, 1,
-0.1456575, 0.1784336, -0.3174487, 0, 1, 0.7294118, 1,
-0.1430573, -0.9269444, -4.884516, 0, 1, 0.7372549, 1,
-0.1381087, -0.1676943, -2.677596, 0, 1, 0.7411765, 1,
-0.1365546, -0.3550666, -2.673805, 0, 1, 0.7490196, 1,
-0.1290572, 1.828621, 0.1944213, 0, 1, 0.7529412, 1,
-0.1286236, 1.290837, 0.7402688, 0, 1, 0.7607843, 1,
-0.1284833, 0.5925266, -1.792589, 0, 1, 0.7647059, 1,
-0.1223876, 1.021979, 0.476334, 0, 1, 0.772549, 1,
-0.1221597, -0.9890027, -4.408302, 0, 1, 0.7764706, 1,
-0.121107, -1.686252, -3.939395, 0, 1, 0.7843137, 1,
-0.1175922, 0.671912, 0.9046488, 0, 1, 0.7882353, 1,
-0.1164002, 0.8551689, 0.4713982, 0, 1, 0.7960784, 1,
-0.1124304, -0.04582301, -2.578155, 0, 1, 0.8039216, 1,
-0.1078726, -0.4647502, -1.161694, 0, 1, 0.8078431, 1,
-0.1052969, 0.06621417, -1.164557, 0, 1, 0.8156863, 1,
-0.09602331, 0.6019276, -1.411261, 0, 1, 0.8196079, 1,
-0.09564614, -0.5908718, -2.134553, 0, 1, 0.827451, 1,
-0.09438986, 0.9074981, 0.5553859, 0, 1, 0.8313726, 1,
-0.08842558, 0.06415127, -1.975869, 0, 1, 0.8392157, 1,
-0.07627253, -0.4054026, -3.238138, 0, 1, 0.8431373, 1,
-0.07112771, -0.838501, -2.390929, 0, 1, 0.8509804, 1,
-0.07028329, 0.4200993, 0.8054768, 0, 1, 0.854902, 1,
-0.06958605, 0.2153509, 0.1655978, 0, 1, 0.8627451, 1,
-0.06920164, -0.438194, -3.411945, 0, 1, 0.8666667, 1,
-0.0672782, 0.01265723, -1.496996, 0, 1, 0.8745098, 1,
-0.06665867, -0.3255929, -2.665635, 0, 1, 0.8784314, 1,
-0.0626968, -0.2959776, -1.326894, 0, 1, 0.8862745, 1,
-0.06254642, 0.8638052, -1.525929, 0, 1, 0.8901961, 1,
-0.06153005, -0.5271698, -1.900505, 0, 1, 0.8980392, 1,
-0.06124518, 1.307078, 0.4743613, 0, 1, 0.9058824, 1,
-0.05999289, -0.5367685, -2.769288, 0, 1, 0.9098039, 1,
-0.05707773, 0.5814351, 0.2033341, 0, 1, 0.9176471, 1,
-0.0449932, -0.309143, -3.771708, 0, 1, 0.9215686, 1,
-0.0424076, 0.3640095, -0.3216015, 0, 1, 0.9294118, 1,
-0.03887454, -1.888337, -2.380826, 0, 1, 0.9333333, 1,
-0.03246818, -1.436275, -4.533256, 0, 1, 0.9411765, 1,
-0.03220353, -1.490578, -2.58762, 0, 1, 0.945098, 1,
-0.03029819, -0.4708667, -3.090809, 0, 1, 0.9529412, 1,
-0.03008776, 0.156949, 1.426556, 0, 1, 0.9568627, 1,
-0.02690491, -0.6099861, -3.472767, 0, 1, 0.9647059, 1,
-0.02537397, -0.03687651, -1.465027, 0, 1, 0.9686275, 1,
-0.02442831, -0.774545, -2.199606, 0, 1, 0.9764706, 1,
-0.02184928, -0.02091122, -2.243678, 0, 1, 0.9803922, 1,
-0.01687655, 1.46312, -0.02181997, 0, 1, 0.9882353, 1,
-0.01655158, -0.8310823, -2.892866, 0, 1, 0.9921569, 1,
-0.01351989, 1.323299, 1.021094, 0, 1, 1, 1,
-0.01175045, -0.7003059, -2.47644, 0, 0.9921569, 1, 1,
-0.01009562, -0.2083335, -3.360354, 0, 0.9882353, 1, 1,
-0.01000961, -0.2824239, -2.88489, 0, 0.9803922, 1, 1,
-0.009935849, 0.8735046, -0.7948958, 0, 0.9764706, 1, 1,
-0.009526555, 0.02773583, -1.449497, 0, 0.9686275, 1, 1,
-0.007734993, 0.8555527, -0.05165042, 0, 0.9647059, 1, 1,
-0.007469681, -2.272855, -2.58312, 0, 0.9568627, 1, 1,
-0.005783134, -0.8162423, -2.589019, 0, 0.9529412, 1, 1,
-0.00312281, 0.005519993, -0.3690929, 0, 0.945098, 1, 1,
-0.001246168, -2.761531, -3.741635, 0, 0.9411765, 1, 1,
-9.258763e-05, 1.700579, -1.265651, 0, 0.9333333, 1, 1,
0.001648979, -1.131923, 4.005158, 0, 0.9294118, 1, 1,
0.002538166, 0.5122713, -1.125269, 0, 0.9215686, 1, 1,
0.004019284, 0.2547652, -0.4145765, 0, 0.9176471, 1, 1,
0.01134423, 0.8480813, -0.08406067, 0, 0.9098039, 1, 1,
0.01172908, 0.4618922, 1.149191, 0, 0.9058824, 1, 1,
0.0133439, 0.3588208, -1.432747, 0, 0.8980392, 1, 1,
0.01530658, 1.626453, -1.691097, 0, 0.8901961, 1, 1,
0.01583565, 0.001978255, 3.496478, 0, 0.8862745, 1, 1,
0.0160646, 0.2848723, 0.3789481, 0, 0.8784314, 1, 1,
0.0209764, -0.5607492, 2.681209, 0, 0.8745098, 1, 1,
0.02199614, 0.07917944, 0.2807084, 0, 0.8666667, 1, 1,
0.02434501, 0.1648082, 0.5344042, 0, 0.8627451, 1, 1,
0.02575067, 0.1634007, -0.9754422, 0, 0.854902, 1, 1,
0.02963226, 1.312312, 1.405909, 0, 0.8509804, 1, 1,
0.03075138, 0.5231738, -1.833066, 0, 0.8431373, 1, 1,
0.03303329, 0.2862049, 1.780487, 0, 0.8392157, 1, 1,
0.03452592, 1.02222, -0.4128022, 0, 0.8313726, 1, 1,
0.03883637, -0.3955081, 3.404997, 0, 0.827451, 1, 1,
0.03957165, -1.813907, 3.807009, 0, 0.8196079, 1, 1,
0.04151116, -0.8698298, 4.548747, 0, 0.8156863, 1, 1,
0.04370508, -1.811235, 1.681839, 0, 0.8078431, 1, 1,
0.04588983, 0.2373688, 0.8164433, 0, 0.8039216, 1, 1,
0.04711504, -1.179515, 4.247995, 0, 0.7960784, 1, 1,
0.05021845, 0.967651, 1.216438, 0, 0.7882353, 1, 1,
0.05905336, 0.01711794, 0.9064598, 0, 0.7843137, 1, 1,
0.0594833, 1.085993, 1.298355, 0, 0.7764706, 1, 1,
0.05986988, 0.5785645, 0.3926448, 0, 0.772549, 1, 1,
0.06132362, 0.5945926, 0.202228, 0, 0.7647059, 1, 1,
0.06574766, 0.16607, 0.07259137, 0, 0.7607843, 1, 1,
0.06849565, 0.455249, 0.4880093, 0, 0.7529412, 1, 1,
0.07122592, 1.314034, 0.1913967, 0, 0.7490196, 1, 1,
0.07155012, 0.2056422, 1.492318, 0, 0.7411765, 1, 1,
0.07580661, 0.06764923, 1.176819, 0, 0.7372549, 1, 1,
0.08176859, 1.495113, 1.181528, 0, 0.7294118, 1, 1,
0.09331669, -1.034079, 2.064429, 0, 0.7254902, 1, 1,
0.1032325, -1.480214, 4.734578, 0, 0.7176471, 1, 1,
0.104807, -0.8309671, 3.864703, 0, 0.7137255, 1, 1,
0.1071382, 0.2736796, -0.5599205, 0, 0.7058824, 1, 1,
0.1072708, -0.9177195, 2.89227, 0, 0.6980392, 1, 1,
0.1092202, -0.3548415, 3.835318, 0, 0.6941177, 1, 1,
0.1121836, -0.4580342, 3.116064, 0, 0.6862745, 1, 1,
0.1156235, 1.211939, -2.044335, 0, 0.682353, 1, 1,
0.1163807, 1.470018, 0.1004671, 0, 0.6745098, 1, 1,
0.1196773, 0.501482, -0.8874684, 0, 0.6705883, 1, 1,
0.1233617, -1.059472, 2.014709, 0, 0.6627451, 1, 1,
0.125847, -2.412067, 2.119165, 0, 0.6588235, 1, 1,
0.128713, 1.189457, -2.175536, 0, 0.6509804, 1, 1,
0.1304157, -0.09743454, 1.596303, 0, 0.6470588, 1, 1,
0.1324227, -0.04616371, 2.71898, 0, 0.6392157, 1, 1,
0.133574, 0.3383913, 0.5094463, 0, 0.6352941, 1, 1,
0.1350611, -0.2055488, 4.453708, 0, 0.627451, 1, 1,
0.1430997, 2.148799, -0.4251052, 0, 0.6235294, 1, 1,
0.1443021, -1.143288, 4.458025, 0, 0.6156863, 1, 1,
0.1455428, -1.130015, 5.303411, 0, 0.6117647, 1, 1,
0.1500944, -0.01171821, 0.3148772, 0, 0.6039216, 1, 1,
0.1521023, 1.584884, 0.7657492, 0, 0.5960785, 1, 1,
0.1532961, 0.2355471, 0.4672586, 0, 0.5921569, 1, 1,
0.1533587, -0.7570661, 4.21298, 0, 0.5843138, 1, 1,
0.1580404, 0.5902308, 0.1069311, 0, 0.5803922, 1, 1,
0.1645374, 0.1121148, 0.4242148, 0, 0.572549, 1, 1,
0.1646451, -0.334408, 3.351779, 0, 0.5686275, 1, 1,
0.1665042, -1.451822, 3.789585, 0, 0.5607843, 1, 1,
0.1672502, 0.3477781, -0.7253428, 0, 0.5568628, 1, 1,
0.1703157, -1.544951, 2.154491, 0, 0.5490196, 1, 1,
0.1706693, 0.03997953, 1.753529, 0, 0.5450981, 1, 1,
0.1717308, -1.089708, 4.058438, 0, 0.5372549, 1, 1,
0.1747988, -1.819466, 1.873633, 0, 0.5333334, 1, 1,
0.177048, -0.4475993, 2.228987, 0, 0.5254902, 1, 1,
0.180896, 0.3083341, 0.9852408, 0, 0.5215687, 1, 1,
0.1827044, 2.771002, -0.09051956, 0, 0.5137255, 1, 1,
0.1832921, -1.415667, 6.262719, 0, 0.509804, 1, 1,
0.1905417, 0.1815051, 2.205853, 0, 0.5019608, 1, 1,
0.1942786, -1.062852, 6.028751, 0, 0.4941176, 1, 1,
0.1955072, 0.5943854, -0.1038064, 0, 0.4901961, 1, 1,
0.1985824, 0.5774483, 0.8403955, 0, 0.4823529, 1, 1,
0.1991522, 1.522862, -0.2388662, 0, 0.4784314, 1, 1,
0.2008605, -1.505445, 3.194552, 0, 0.4705882, 1, 1,
0.2066079, -0.06966498, 0.1901096, 0, 0.4666667, 1, 1,
0.2095629, -0.2129111, 1.529515, 0, 0.4588235, 1, 1,
0.2120245, -0.9000153, 4.132166, 0, 0.454902, 1, 1,
0.2141506, -2.056437, 4.37718, 0, 0.4470588, 1, 1,
0.2188302, 1.706756, 0.5164701, 0, 0.4431373, 1, 1,
0.2194583, 0.01841498, 1.165535, 0, 0.4352941, 1, 1,
0.2255999, -0.850782, 3.669708, 0, 0.4313726, 1, 1,
0.2277278, 0.7279877, 1.197866, 0, 0.4235294, 1, 1,
0.2323138, -0.4047665, 2.596928, 0, 0.4196078, 1, 1,
0.2332158, -0.8531165, 5.015879, 0, 0.4117647, 1, 1,
0.2334872, -0.4036467, 2.758295, 0, 0.4078431, 1, 1,
0.2338612, -0.04729046, 3.535108, 0, 0.4, 1, 1,
0.2352746, 0.6253033, 0.8472747, 0, 0.3921569, 1, 1,
0.2390945, 0.7053682, 0.06174767, 0, 0.3882353, 1, 1,
0.2411762, 2.832984, -0.2174692, 0, 0.3803922, 1, 1,
0.2416686, -1.283843, 2.877159, 0, 0.3764706, 1, 1,
0.2430488, 0.6264415, 1.088399, 0, 0.3686275, 1, 1,
0.2436349, -0.6180151, 2.581302, 0, 0.3647059, 1, 1,
0.2463844, 0.01945981, 2.463324, 0, 0.3568628, 1, 1,
0.2469585, 0.06952602, 3.523355, 0, 0.3529412, 1, 1,
0.2520296, -0.02476757, 3.089901, 0, 0.345098, 1, 1,
0.2524581, -0.6669269, 2.249543, 0, 0.3411765, 1, 1,
0.2540978, -0.439205, 4.296445, 0, 0.3333333, 1, 1,
0.2560864, -2.475749, 2.068095, 0, 0.3294118, 1, 1,
0.2579954, -0.1348864, 1.010577, 0, 0.3215686, 1, 1,
0.2581003, -2.010421, 3.064626, 0, 0.3176471, 1, 1,
0.2607578, 0.4714577, -2.13864, 0, 0.3098039, 1, 1,
0.2608445, -0.491775, 3.135243, 0, 0.3058824, 1, 1,
0.2647835, 1.027794, 1.35459, 0, 0.2980392, 1, 1,
0.2684463, 0.8746882, 0.167929, 0, 0.2901961, 1, 1,
0.2687819, 0.5057468, 2.743987, 0, 0.2862745, 1, 1,
0.2736051, -1.109247, 4.438829, 0, 0.2784314, 1, 1,
0.2782057, -0.002244082, -0.2033067, 0, 0.2745098, 1, 1,
0.2835198, 0.602766, 1.822637, 0, 0.2666667, 1, 1,
0.2866398, -0.9124681, 2.657306, 0, 0.2627451, 1, 1,
0.2868343, -1.131766, 1.894369, 0, 0.254902, 1, 1,
0.2869461, 0.2981514, -0.5026259, 0, 0.2509804, 1, 1,
0.292737, 0.4382406, 0.004791131, 0, 0.2431373, 1, 1,
0.2934715, 1.433681, -0.2756702, 0, 0.2392157, 1, 1,
0.2946263, -1.126785, 2.613674, 0, 0.2313726, 1, 1,
0.2952251, -0.3053639, 1.8739, 0, 0.227451, 1, 1,
0.3002034, -1.171156, 2.13841, 0, 0.2196078, 1, 1,
0.3006682, -0.365333, 1.819611, 0, 0.2156863, 1, 1,
0.3068239, 0.09544577, 1.907726, 0, 0.2078431, 1, 1,
0.3073756, -2.049432, 3.717634, 0, 0.2039216, 1, 1,
0.3102817, 0.9629938, 0.8030112, 0, 0.1960784, 1, 1,
0.3110329, -1.469355, 3.894856, 0, 0.1882353, 1, 1,
0.3116229, 0.2458353, -0.2143168, 0, 0.1843137, 1, 1,
0.314458, 0.1708682, 0.2939107, 0, 0.1764706, 1, 1,
0.3149422, 0.419461, 2.710344, 0, 0.172549, 1, 1,
0.3150316, -1.274904, 1.78693, 0, 0.1647059, 1, 1,
0.3161036, -0.01172483, 1.725782, 0, 0.1607843, 1, 1,
0.3162824, -0.9598714, 3.449691, 0, 0.1529412, 1, 1,
0.3175704, 0.9994238, -1.7212, 0, 0.1490196, 1, 1,
0.3206063, -1.323447, 3.275345, 0, 0.1411765, 1, 1,
0.3210253, -0.2406298, 2.210531, 0, 0.1372549, 1, 1,
0.3219468, -0.1520753, 0.749013, 0, 0.1294118, 1, 1,
0.3240739, -0.423124, 3.052427, 0, 0.1254902, 1, 1,
0.3253881, 0.1115611, 1.728627, 0, 0.1176471, 1, 1,
0.3297939, 0.7879893, 0.3926279, 0, 0.1137255, 1, 1,
0.3317067, -0.3688321, 2.131775, 0, 0.1058824, 1, 1,
0.3338041, -0.1985846, 2.007505, 0, 0.09803922, 1, 1,
0.3365718, -0.4290126, 2.267659, 0, 0.09411765, 1, 1,
0.3372645, -1.105442, 2.038067, 0, 0.08627451, 1, 1,
0.3410757, -0.4669833, 3.612098, 0, 0.08235294, 1, 1,
0.3426269, 1.415546, -0.8687982, 0, 0.07450981, 1, 1,
0.348256, 0.3538141, -0.3188443, 0, 0.07058824, 1, 1,
0.3495258, 1.069952, 2.633784, 0, 0.0627451, 1, 1,
0.3512788, -1.469803, 2.85127, 0, 0.05882353, 1, 1,
0.35503, 0.1866377, 0.9479058, 0, 0.05098039, 1, 1,
0.356047, 1.866254, -0.1434071, 0, 0.04705882, 1, 1,
0.3577546, 0.09519568, 0.3498689, 0, 0.03921569, 1, 1,
0.358502, 0.673062, 0.6265321, 0, 0.03529412, 1, 1,
0.3589584, 1.323818, 1.529921, 0, 0.02745098, 1, 1,
0.3635835, 1.329265, 0.2842842, 0, 0.02352941, 1, 1,
0.3653178, -2.060237, 3.436819, 0, 0.01568628, 1, 1,
0.3805119, 1.301988, 0.5384418, 0, 0.01176471, 1, 1,
0.3848144, 0.995656, -0.4488401, 0, 0.003921569, 1, 1,
0.3952058, 0.5325083, -0.4403856, 0.003921569, 0, 1, 1,
0.3952218, 0.483612, 0.4458112, 0.007843138, 0, 1, 1,
0.3956441, -1.127329, 3.444714, 0.01568628, 0, 1, 1,
0.4073544, -0.8804513, 4.584626, 0.01960784, 0, 1, 1,
0.4078141, 0.4563088, -0.2381822, 0.02745098, 0, 1, 1,
0.4090532, -0.1044756, -0.008424484, 0.03137255, 0, 1, 1,
0.4098308, -1.15398, 2.741065, 0.03921569, 0, 1, 1,
0.412805, 1.988195, 0.8843113, 0.04313726, 0, 1, 1,
0.4156321, 0.1334684, 0.9361022, 0.05098039, 0, 1, 1,
0.4160922, -0.6563652, 0.8500335, 0.05490196, 0, 1, 1,
0.4161995, -1.353687, 2.031964, 0.0627451, 0, 1, 1,
0.4319681, -0.3085997, 2.882375, 0.06666667, 0, 1, 1,
0.4330951, -2.307837, 3.552356, 0.07450981, 0, 1, 1,
0.4387043, -1.320378, 1.851673, 0.07843138, 0, 1, 1,
0.4391632, -0.6854146, 3.712929, 0.08627451, 0, 1, 1,
0.4441122, -1.490046, 4.314502, 0.09019608, 0, 1, 1,
0.4448444, 0.9564657, 0.8853738, 0.09803922, 0, 1, 1,
0.4523072, -2.132566, 2.845244, 0.1058824, 0, 1, 1,
0.4608664, 0.9537211, 0.1730616, 0.1098039, 0, 1, 1,
0.4617981, -1.226307, 3.165197, 0.1176471, 0, 1, 1,
0.4620855, -0.6764885, 4.698658, 0.1215686, 0, 1, 1,
0.462589, 0.2918549, 0.621045, 0.1294118, 0, 1, 1,
0.465817, 0.02240922, 2.709376, 0.1333333, 0, 1, 1,
0.4658259, 1.080883, 0.1069814, 0.1411765, 0, 1, 1,
0.4660101, -1.888641, 4.028956, 0.145098, 0, 1, 1,
0.4660198, -0.5435382, 2.6567, 0.1529412, 0, 1, 1,
0.4663841, -0.4358692, 2.687632, 0.1568628, 0, 1, 1,
0.4685178, 2.001578, 1.406751, 0.1647059, 0, 1, 1,
0.4690285, 0.2935653, 0.4120224, 0.1686275, 0, 1, 1,
0.4705721, 0.5750419, 0.7158937, 0.1764706, 0, 1, 1,
0.4767643, 1.923357, 0.3109037, 0.1803922, 0, 1, 1,
0.4817793, 0.08856562, 0.243994, 0.1882353, 0, 1, 1,
0.4844811, -0.948662, 2.07545, 0.1921569, 0, 1, 1,
0.498237, -0.2253868, 2.823922, 0.2, 0, 1, 1,
0.4997023, 0.5008177, -0.8675752, 0.2078431, 0, 1, 1,
0.5032839, -0.2164461, -0.7482712, 0.2117647, 0, 1, 1,
0.5142047, 0.04313084, 1.455355, 0.2196078, 0, 1, 1,
0.5208591, -0.1265157, 2.277748, 0.2235294, 0, 1, 1,
0.5231992, -0.5031585, 1.612228, 0.2313726, 0, 1, 1,
0.5247407, -0.294108, 2.071361, 0.2352941, 0, 1, 1,
0.5249031, -0.03964531, 1.428381, 0.2431373, 0, 1, 1,
0.5297685, -0.7113522, 1.065699, 0.2470588, 0, 1, 1,
0.5298045, 1.09739, 0.2377377, 0.254902, 0, 1, 1,
0.5336946, -1.75966, 3.387079, 0.2588235, 0, 1, 1,
0.5388991, -0.4722995, 3.283967, 0.2666667, 0, 1, 1,
0.5397316, 0.3672022, 0.8995498, 0.2705882, 0, 1, 1,
0.5408317, 0.9227371, -0.7427518, 0.2784314, 0, 1, 1,
0.5455317, 0.6698555, 0.05866491, 0.282353, 0, 1, 1,
0.5474235, 1.332431, -1.151721, 0.2901961, 0, 1, 1,
0.5481492, 0.3321108, 1.403569, 0.2941177, 0, 1, 1,
0.5517537, 0.9396527, 1.295305, 0.3019608, 0, 1, 1,
0.5536855, -0.912284, 4.293192, 0.3098039, 0, 1, 1,
0.5549807, 1.031491, 0.6090361, 0.3137255, 0, 1, 1,
0.5560973, -0.6942884, 0.2839152, 0.3215686, 0, 1, 1,
0.5621042, -0.5961868, 2.681765, 0.3254902, 0, 1, 1,
0.5638885, -0.228037, 2.061477, 0.3333333, 0, 1, 1,
0.5643942, -0.6411174, 2.211492, 0.3372549, 0, 1, 1,
0.5655362, 0.1128341, 1.256759, 0.345098, 0, 1, 1,
0.5663675, 0.8970296, -0.5078952, 0.3490196, 0, 1, 1,
0.5738338, 1.253804, 1.230258, 0.3568628, 0, 1, 1,
0.5755292, 0.1517597, 0.3401251, 0.3607843, 0, 1, 1,
0.5769589, 0.7587871, 1.800571, 0.3686275, 0, 1, 1,
0.5774935, 1.09144, -0.9167689, 0.372549, 0, 1, 1,
0.5799505, -1.19086, 2.50591, 0.3803922, 0, 1, 1,
0.5825886, -1.0137, 3.453612, 0.3843137, 0, 1, 1,
0.5880238, -0.8291811, 3.416114, 0.3921569, 0, 1, 1,
0.5894207, -1.317842, 2.996125, 0.3960784, 0, 1, 1,
0.590902, -1.505518, 5.616285, 0.4039216, 0, 1, 1,
0.5914783, 2.077864, 1.070073, 0.4117647, 0, 1, 1,
0.5933912, 1.073298, 0.338239, 0.4156863, 0, 1, 1,
0.6076037, -0.7384038, 3.907739, 0.4235294, 0, 1, 1,
0.6094465, -0.8821937, 1.935242, 0.427451, 0, 1, 1,
0.6152545, -0.39946, 2.590962, 0.4352941, 0, 1, 1,
0.6189823, -2.433271, 2.888812, 0.4392157, 0, 1, 1,
0.6251692, -0.2036581, 1.343128, 0.4470588, 0, 1, 1,
0.6259527, -0.7420326, 3.168572, 0.4509804, 0, 1, 1,
0.6261023, -0.6214058, 2.613601, 0.4588235, 0, 1, 1,
0.6285344, 1.240772, -0.1778843, 0.4627451, 0, 1, 1,
0.6289221, 1.164016, 1.777575, 0.4705882, 0, 1, 1,
0.6351607, 0.1281068, 2.327469, 0.4745098, 0, 1, 1,
0.6358374, -2.627054, 1.767085, 0.4823529, 0, 1, 1,
0.6384844, 0.6443247, 1.295841, 0.4862745, 0, 1, 1,
0.6403187, -0.2859664, 1.650002, 0.4941176, 0, 1, 1,
0.6451003, 2.819009, -0.2158436, 0.5019608, 0, 1, 1,
0.6463455, -2.736161, 1.852046, 0.5058824, 0, 1, 1,
0.6464731, -0.8690493, 1.659819, 0.5137255, 0, 1, 1,
0.6537406, 0.5197759, 1.93509, 0.5176471, 0, 1, 1,
0.6573378, 2.314627, 0.9101607, 0.5254902, 0, 1, 1,
0.6585156, 0.1995538, 0.9799312, 0.5294118, 0, 1, 1,
0.6603827, 1.18403, -0.8268378, 0.5372549, 0, 1, 1,
0.6628964, -1.108418, 2.211634, 0.5411765, 0, 1, 1,
0.6670489, -1.709499, 3.533012, 0.5490196, 0, 1, 1,
0.6707708, 0.6016012, -0.3336152, 0.5529412, 0, 1, 1,
0.6710805, -1.356109, 2.865531, 0.5607843, 0, 1, 1,
0.6792772, -0.8323834, 1.411222, 0.5647059, 0, 1, 1,
0.6851817, 0.3521048, 1.808476, 0.572549, 0, 1, 1,
0.6864365, -0.2739202, 1.697675, 0.5764706, 0, 1, 1,
0.6900644, 2.157639, 0.8441917, 0.5843138, 0, 1, 1,
0.6909051, 1.363086, 1.210769, 0.5882353, 0, 1, 1,
0.6949442, -0.7965825, 3.87517, 0.5960785, 0, 1, 1,
0.6966186, 0.5671281, 2.030131, 0.6039216, 0, 1, 1,
0.7044385, 1.559354, -0.5763673, 0.6078432, 0, 1, 1,
0.7047956, -0.4633173, 2.511506, 0.6156863, 0, 1, 1,
0.7069278, -0.3365196, 0.7319096, 0.6196079, 0, 1, 1,
0.711592, -1.052408, 1.769369, 0.627451, 0, 1, 1,
0.7126479, 0.2283508, 1.383812, 0.6313726, 0, 1, 1,
0.713697, -0.6209985, 2.585674, 0.6392157, 0, 1, 1,
0.7153801, -1.18464, 2.02752, 0.6431373, 0, 1, 1,
0.7188277, 0.09607733, 0.3575642, 0.6509804, 0, 1, 1,
0.7206616, -0.001286595, 1.620882, 0.654902, 0, 1, 1,
0.7215812, 1.443878, 0.1780611, 0.6627451, 0, 1, 1,
0.7232689, -0.1789628, 3.016909, 0.6666667, 0, 1, 1,
0.733444, 0.3182582, -0.2526607, 0.6745098, 0, 1, 1,
0.7382491, 0.7106671, 1.348706, 0.6784314, 0, 1, 1,
0.740257, -0.8260102, 2.397393, 0.6862745, 0, 1, 1,
0.7435864, 0.2621432, 2.452414, 0.6901961, 0, 1, 1,
0.7437796, 1.596217, -0.7989931, 0.6980392, 0, 1, 1,
0.7451406, 1.550214, 1.042866, 0.7058824, 0, 1, 1,
0.7456241, -1.057907, 1.65411, 0.7098039, 0, 1, 1,
0.7581393, 1.678385, -0.7030004, 0.7176471, 0, 1, 1,
0.7583401, -0.7137956, 2.994365, 0.7215686, 0, 1, 1,
0.759465, -0.4505925, 1.265149, 0.7294118, 0, 1, 1,
0.7610639, 0.4834054, -0.1598882, 0.7333333, 0, 1, 1,
0.7636522, -0.1062597, 2.100642, 0.7411765, 0, 1, 1,
0.7649082, -0.2684724, 2.009127, 0.7450981, 0, 1, 1,
0.7697035, -0.4107052, 1.848459, 0.7529412, 0, 1, 1,
0.770723, -1.334221, 2.425798, 0.7568628, 0, 1, 1,
0.7740777, 0.3092688, -0.6491443, 0.7647059, 0, 1, 1,
0.7751439, -0.7853466, 1.898335, 0.7686275, 0, 1, 1,
0.7803307, 1.264818, 1.155398, 0.7764706, 0, 1, 1,
0.7818691, 0.04204853, 2.097386, 0.7803922, 0, 1, 1,
0.7834129, 0.4374876, 1.948331, 0.7882353, 0, 1, 1,
0.7921484, -1.063103, 2.627176, 0.7921569, 0, 1, 1,
0.8015125, -1.088039, 2.875679, 0.8, 0, 1, 1,
0.8049862, 1.80599, 1.831548, 0.8078431, 0, 1, 1,
0.8056751, 2.530358, 0.2777384, 0.8117647, 0, 1, 1,
0.8085378, 0.2797036, 1.703242, 0.8196079, 0, 1, 1,
0.8110867, -1.195148, 1.060948, 0.8235294, 0, 1, 1,
0.8125398, -0.02156765, -0.4941104, 0.8313726, 0, 1, 1,
0.814378, 2.513916, 1.227219, 0.8352941, 0, 1, 1,
0.8149563, 0.6463553, 1.43125, 0.8431373, 0, 1, 1,
0.8185587, -0.1661386, 1.281877, 0.8470588, 0, 1, 1,
0.8232896, 1.147202, -0.8748974, 0.854902, 0, 1, 1,
0.8345127, 1.048793, 0.1114877, 0.8588235, 0, 1, 1,
0.8346058, -0.6555564, 1.408283, 0.8666667, 0, 1, 1,
0.8382638, 0.7972367, -0.01933855, 0.8705882, 0, 1, 1,
0.8427935, -0.4080082, 3.341091, 0.8784314, 0, 1, 1,
0.8469418, 1.257573, 0.6850877, 0.8823529, 0, 1, 1,
0.8507437, -1.222674, 1.972732, 0.8901961, 0, 1, 1,
0.8508013, -0.9490596, 1.384537, 0.8941177, 0, 1, 1,
0.8518446, 0.6117509, 1.739277, 0.9019608, 0, 1, 1,
0.8549162, 1.963964, 2.06813, 0.9098039, 0, 1, 1,
0.8587604, 0.9312902, -0.8748008, 0.9137255, 0, 1, 1,
0.8666333, 0.9246605, 0.894455, 0.9215686, 0, 1, 1,
0.8811969, 0.9068722, -1.200459, 0.9254902, 0, 1, 1,
0.8911833, 0.004593144, 1.735358, 0.9333333, 0, 1, 1,
0.8921615, 0.1446006, 1.190958, 0.9372549, 0, 1, 1,
0.8961046, 0.8775346, 2.230045, 0.945098, 0, 1, 1,
0.8963602, -0.8906653, 2.126904, 0.9490196, 0, 1, 1,
0.9348182, -1.411997, 3.258903, 0.9568627, 0, 1, 1,
0.9417534, 0.1170414, 2.830942, 0.9607843, 0, 1, 1,
0.9428432, 0.4488971, 0.1047632, 0.9686275, 0, 1, 1,
0.9429561, -1.238278, 2.331381, 0.972549, 0, 1, 1,
0.9472978, 0.9975596, 1.630932, 0.9803922, 0, 1, 1,
0.9481109, 0.1601793, 2.773968, 0.9843137, 0, 1, 1,
0.9500707, -1.350776, 2.38352, 0.9921569, 0, 1, 1,
0.9536319, -0.4825017, 2.384763, 0.9960784, 0, 1, 1,
0.9569082, -1.226551, 1.985901, 1, 0, 0.9960784, 1,
0.9601287, -0.9729335, 1.902486, 1, 0, 0.9882353, 1,
0.9714209, -1.320554, 3.363074, 1, 0, 0.9843137, 1,
0.9761007, 0.327112, 0.7413903, 1, 0, 0.9764706, 1,
0.9781868, -0.7826909, 1.222641, 1, 0, 0.972549, 1,
0.9782606, 0.3627984, -0.6359584, 1, 0, 0.9647059, 1,
0.9794517, 0.6902763, -0.9475835, 1, 0, 0.9607843, 1,
0.9836528, -0.447936, 3.985632, 1, 0, 0.9529412, 1,
0.988681, 0.1654367, 0.7890984, 1, 0, 0.9490196, 1,
0.9924229, 1.448478, 0.8170615, 1, 0, 0.9411765, 1,
1.010316, -1.655509, 1.852491, 1, 0, 0.9372549, 1,
1.013022, -0.3695841, 0.8881282, 1, 0, 0.9294118, 1,
1.020203, 1.178833, 0.5507942, 1, 0, 0.9254902, 1,
1.02868, 0.7853864, 2.260118, 1, 0, 0.9176471, 1,
1.031303, 1.52731, 0.6850379, 1, 0, 0.9137255, 1,
1.032802, -0.3685308, 1.313884, 1, 0, 0.9058824, 1,
1.03345, -0.4841251, 3.779022, 1, 0, 0.9019608, 1,
1.043232, -0.02456947, 0.8431309, 1, 0, 0.8941177, 1,
1.061112, 0.5182561, 0.7868894, 1, 0, 0.8862745, 1,
1.073325, -0.8233987, 0.9859617, 1, 0, 0.8823529, 1,
1.075928, -1.676637, 0.5989074, 1, 0, 0.8745098, 1,
1.088546, -0.94438, 2.37519, 1, 0, 0.8705882, 1,
1.091899, -0.2526511, 1.158683, 1, 0, 0.8627451, 1,
1.093005, -1.480819, 1.735204, 1, 0, 0.8588235, 1,
1.094622, -1.321458, 0.5465285, 1, 0, 0.8509804, 1,
1.104041, -0.959549, 2.785802, 1, 0, 0.8470588, 1,
1.111772, 1.494736, 1.63334, 1, 0, 0.8392157, 1,
1.114311, -0.02081175, 0.678373, 1, 0, 0.8352941, 1,
1.118907, 0.4851468, 1.361085, 1, 0, 0.827451, 1,
1.119569, 0.1582932, 2.489934, 1, 0, 0.8235294, 1,
1.140432, -0.3363628, 1.761359, 1, 0, 0.8156863, 1,
1.145454, -0.3957004, 1.872694, 1, 0, 0.8117647, 1,
1.150001, 1.017581, 0.6372449, 1, 0, 0.8039216, 1,
1.161632, 1.976481, 0.08392059, 1, 0, 0.7960784, 1,
1.176584, -0.832917, 3.241962, 1, 0, 0.7921569, 1,
1.188969, -0.6105192, 2.486241, 1, 0, 0.7843137, 1,
1.203875, -1.052236, 3.468625, 1, 0, 0.7803922, 1,
1.21734, -0.1323568, 1.942872, 1, 0, 0.772549, 1,
1.22515, -1.55679, 2.231609, 1, 0, 0.7686275, 1,
1.232833, -0.9436579, 2.474183, 1, 0, 0.7607843, 1,
1.233258, -0.04843521, 3.746029, 1, 0, 0.7568628, 1,
1.241771, -1.759651, 1.872004, 1, 0, 0.7490196, 1,
1.251768, -0.4972527, 0.5501584, 1, 0, 0.7450981, 1,
1.258227, -1.336077, 1.3151, 1, 0, 0.7372549, 1,
1.264744, 1.139876, 0.6358225, 1, 0, 0.7333333, 1,
1.270312, 0.5487372, 1.414341, 1, 0, 0.7254902, 1,
1.278885, 0.5679931, 2.671097, 1, 0, 0.7215686, 1,
1.279872, 0.6443321, 1.455311, 1, 0, 0.7137255, 1,
1.282503, -0.7818573, 3.424283, 1, 0, 0.7098039, 1,
1.282946, 1.326593, 1.526176, 1, 0, 0.7019608, 1,
1.283677, 1.294855, -0.8654231, 1, 0, 0.6941177, 1,
1.284927, 1.201994, 0.7183458, 1, 0, 0.6901961, 1,
1.286065, 1.035611, 1.008532, 1, 0, 0.682353, 1,
1.288849, 0.6926202, 1.674161, 1, 0, 0.6784314, 1,
1.295366, -0.5311691, 1.459961, 1, 0, 0.6705883, 1,
1.296325, -0.312014, 2.897644, 1, 0, 0.6666667, 1,
1.296573, 1.789373, 0.4239263, 1, 0, 0.6588235, 1,
1.297913, -1.07102, 1.628677, 1, 0, 0.654902, 1,
1.310316, 0.7644022, 0.2062287, 1, 0, 0.6470588, 1,
1.311845, 1.524242, -0.6135271, 1, 0, 0.6431373, 1,
1.31943, 0.6925165, 1.896292, 1, 0, 0.6352941, 1,
1.332703, -0.03262408, 2.022415, 1, 0, 0.6313726, 1,
1.348443, 0.05960877, -0.08350631, 1, 0, 0.6235294, 1,
1.34895, -0.4839251, 1.189703, 1, 0, 0.6196079, 1,
1.352497, 0.03533563, -0.2380536, 1, 0, 0.6117647, 1,
1.35557, -0.0763381, -0.03925707, 1, 0, 0.6078432, 1,
1.356004, -0.4827774, 1.44198, 1, 0, 0.6, 1,
1.360592, 0.745656, 1.841452, 1, 0, 0.5921569, 1,
1.361655, 0.1447503, 1.814723, 1, 0, 0.5882353, 1,
1.363769, 1.089169, 1.203874, 1, 0, 0.5803922, 1,
1.363793, -1.215555, 1.875245, 1, 0, 0.5764706, 1,
1.365048, -0.6558591, 0.0461362, 1, 0, 0.5686275, 1,
1.369938, -0.8370119, 3.267982, 1, 0, 0.5647059, 1,
1.373153, 0.9757274, 1.982681, 1, 0, 0.5568628, 1,
1.373764, 0.1535377, 1.985417, 1, 0, 0.5529412, 1,
1.384557, 0.4781217, -0.2328979, 1, 0, 0.5450981, 1,
1.391374, -0.8356889, 1.190811, 1, 0, 0.5411765, 1,
1.391408, -1.251684, 1.686135, 1, 0, 0.5333334, 1,
1.3953, -0.2754117, 1.580697, 1, 0, 0.5294118, 1,
1.397545, 0.5953211, 1.389456, 1, 0, 0.5215687, 1,
1.39832, 1.215615, 1.603115, 1, 0, 0.5176471, 1,
1.402629, 2.608018, 0.9607382, 1, 0, 0.509804, 1,
1.407002, 0.03158714, 1.344723, 1, 0, 0.5058824, 1,
1.41784, 0.0287299, 0.9497173, 1, 0, 0.4980392, 1,
1.421019, 1.318359, 0.4979895, 1, 0, 0.4901961, 1,
1.421514, -0.0905946, 2.940524, 1, 0, 0.4862745, 1,
1.423063, -0.3419256, 2.560269, 1, 0, 0.4784314, 1,
1.435544, -0.9467824, 2.940662, 1, 0, 0.4745098, 1,
1.437575, 1.656339, 0.6538647, 1, 0, 0.4666667, 1,
1.442776, -0.3258294, 1.318869, 1, 0, 0.4627451, 1,
1.446152, -1.224333, 3.084771, 1, 0, 0.454902, 1,
1.446601, -0.8660882, 1.929131, 1, 0, 0.4509804, 1,
1.462804, -0.891273, 1.066842, 1, 0, 0.4431373, 1,
1.471132, -1.129344, 2.11584, 1, 0, 0.4392157, 1,
1.477754, -0.6404468, 0.7859316, 1, 0, 0.4313726, 1,
1.486194, 0.2762696, 0.133507, 1, 0, 0.427451, 1,
1.490589, -0.3965028, 1.780966, 1, 0, 0.4196078, 1,
1.492408, 0.7871822, 2.086016, 1, 0, 0.4156863, 1,
1.518955, -0.1500067, 2.843588, 1, 0, 0.4078431, 1,
1.521986, 0.4090707, 1.077209, 1, 0, 0.4039216, 1,
1.524046, 2.805275, 1.631413, 1, 0, 0.3960784, 1,
1.526584, -1.836067, 1.309014, 1, 0, 0.3882353, 1,
1.537333, -0.7309471, 0.7962869, 1, 0, 0.3843137, 1,
1.539465, 1.410896, 1.322186, 1, 0, 0.3764706, 1,
1.553979, 1.594813, 0.08997741, 1, 0, 0.372549, 1,
1.56337, 0.5796356, 0.009775392, 1, 0, 0.3647059, 1,
1.56982, 0.9956288, 2.025815, 1, 0, 0.3607843, 1,
1.570508, -0.03908461, 2.409338, 1, 0, 0.3529412, 1,
1.581921, -0.3963876, 0.8554153, 1, 0, 0.3490196, 1,
1.599578, 0.7235321, 3.343278, 1, 0, 0.3411765, 1,
1.607683, -2.486508, 1.980529, 1, 0, 0.3372549, 1,
1.616918, 1.163235, 1.44241, 1, 0, 0.3294118, 1,
1.625689, 0.9618575, 2.53116, 1, 0, 0.3254902, 1,
1.639478, 1.766767, 0.4459355, 1, 0, 0.3176471, 1,
1.639913, -1.5822, 2.625033, 1, 0, 0.3137255, 1,
1.644119, -0.2232834, 0.8302439, 1, 0, 0.3058824, 1,
1.65454, -0.4949419, 1.997344, 1, 0, 0.2980392, 1,
1.665962, -0.0813075, 3.310486, 1, 0, 0.2941177, 1,
1.66631, 0.2807986, 2.485667, 1, 0, 0.2862745, 1,
1.668717, 2.700872, 0.7584885, 1, 0, 0.282353, 1,
1.673354, -0.1225739, 1.907814, 1, 0, 0.2745098, 1,
1.675484, 1.085891, -0.2795267, 1, 0, 0.2705882, 1,
1.676465, -0.2046792, 2.627519, 1, 0, 0.2627451, 1,
1.684731, 0.8350149, 2.621926, 1, 0, 0.2588235, 1,
1.697904, 0.04801558, 2.735016, 1, 0, 0.2509804, 1,
1.701237, -0.09000666, 1.302786, 1, 0, 0.2470588, 1,
1.703889, -0.1243939, 1.401718, 1, 0, 0.2392157, 1,
1.715119, -0.1388744, 2.163729, 1, 0, 0.2352941, 1,
1.726977, -3.456302, 2.412574, 1, 0, 0.227451, 1,
1.774641, 0.4316981, -0.06780872, 1, 0, 0.2235294, 1,
1.780883, -1.331498, 2.225688, 1, 0, 0.2156863, 1,
1.788717, 0.1300003, -0.1777881, 1, 0, 0.2117647, 1,
1.819102, -0.4268716, 1.206946, 1, 0, 0.2039216, 1,
1.828511, -0.2220926, 1.460873, 1, 0, 0.1960784, 1,
1.855727, -0.6239986, 2.388092, 1, 0, 0.1921569, 1,
1.867616, 0.0005929534, 1.692836, 1, 0, 0.1843137, 1,
1.874784, -0.8971404, 2.794938, 1, 0, 0.1803922, 1,
1.881361, 1.455021, 1.069219, 1, 0, 0.172549, 1,
1.905929, 0.1736691, 2.117391, 1, 0, 0.1686275, 1,
1.918965, 0.7528175, 1.257707, 1, 0, 0.1607843, 1,
1.952869, 0.4459319, 2.407334, 1, 0, 0.1568628, 1,
1.961972, -0.09519093, 0.9812093, 1, 0, 0.1490196, 1,
1.978785, 1.070737, 1.393207, 1, 0, 0.145098, 1,
1.992961, -0.4636417, 1.629191, 1, 0, 0.1372549, 1,
2.003267, -0.7836744, 1.352104, 1, 0, 0.1333333, 1,
2.01866, 1.729039, 1.831688, 1, 0, 0.1254902, 1,
2.046565, -0.8286304, 1.833594, 1, 0, 0.1215686, 1,
2.053611, -0.03805466, 2.014881, 1, 0, 0.1137255, 1,
2.056366, 1.973334, 0.1243445, 1, 0, 0.1098039, 1,
2.069879, -1.611648, 2.802355, 1, 0, 0.1019608, 1,
2.084629, -0.3537062, 2.064689, 1, 0, 0.09411765, 1,
2.090897, -0.7157223, 3.13162, 1, 0, 0.09019608, 1,
2.109284, -0.2910236, -0.6254475, 1, 0, 0.08235294, 1,
2.200471, 0.554157, 0.8650767, 1, 0, 0.07843138, 1,
2.242878, -0.7307261, -0.3410818, 1, 0, 0.07058824, 1,
2.285391, 0.9045683, 3.033442, 1, 0, 0.06666667, 1,
2.320531, 1.656666, 1.027542, 1, 0, 0.05882353, 1,
2.348766, 0.761492, -0.4858919, 1, 0, 0.05490196, 1,
2.389513, -1.151945, 1.949163, 1, 0, 0.04705882, 1,
2.408526, -1.78934, 3.452102, 1, 0, 0.04313726, 1,
2.474745, -1.672799, 2.7442, 1, 0, 0.03529412, 1,
2.528726, -0.4855955, 1.471616, 1, 0, 0.03137255, 1,
2.560162, 1.841199, -0.5244641, 1, 0, 0.02352941, 1,
2.732824, -1.104611, 2.822174, 1, 0, 0.01960784, 1,
2.82207, 1.018041, 1.622359, 1, 0, 0.01176471, 1,
2.86746, 1.819584, 1.963959, 1, 0, 0.007843138, 1
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
-0.1461948, -4.587101, -6.773972, 0, -0.5, 0.5, 0.5,
-0.1461948, -4.587101, -6.773972, 1, -0.5, 0.5, 0.5,
-0.1461948, -4.587101, -6.773972, 1, 1.5, 0.5, 0.5,
-0.1461948, -4.587101, -6.773972, 0, 1.5, 0.5, 0.5
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
-4.181479, -0.1206095, -6.773972, 0, -0.5, 0.5, 0.5,
-4.181479, -0.1206095, -6.773972, 1, -0.5, 0.5, 0.5,
-4.181479, -0.1206095, -6.773972, 1, 1.5, 0.5, 0.5,
-4.181479, -0.1206095, -6.773972, 0, 1.5, 0.5, 0.5
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
-4.181479, -4.587101, 0.6891015, 0, -0.5, 0.5, 0.5,
-4.181479, -4.587101, 0.6891015, 1, -0.5, 0.5, 0.5,
-4.181479, -4.587101, 0.6891015, 1, 1.5, 0.5, 0.5,
-4.181479, -4.587101, 0.6891015, 0, 1.5, 0.5, 0.5
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
-3, -3.556373, -5.051724,
2, -3.556373, -5.051724,
-3, -3.556373, -5.051724,
-3, -3.728161, -5.338766,
-2, -3.556373, -5.051724,
-2, -3.728161, -5.338766,
-1, -3.556373, -5.051724,
-1, -3.728161, -5.338766,
0, -3.556373, -5.051724,
0, -3.728161, -5.338766,
1, -3.556373, -5.051724,
1, -3.728161, -5.338766,
2, -3.556373, -5.051724,
2, -3.728161, -5.338766
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
-3, -4.071737, -5.912848, 0, -0.5, 0.5, 0.5,
-3, -4.071737, -5.912848, 1, -0.5, 0.5, 0.5,
-3, -4.071737, -5.912848, 1, 1.5, 0.5, 0.5,
-3, -4.071737, -5.912848, 0, 1.5, 0.5, 0.5,
-2, -4.071737, -5.912848, 0, -0.5, 0.5, 0.5,
-2, -4.071737, -5.912848, 1, -0.5, 0.5, 0.5,
-2, -4.071737, -5.912848, 1, 1.5, 0.5, 0.5,
-2, -4.071737, -5.912848, 0, 1.5, 0.5, 0.5,
-1, -4.071737, -5.912848, 0, -0.5, 0.5, 0.5,
-1, -4.071737, -5.912848, 1, -0.5, 0.5, 0.5,
-1, -4.071737, -5.912848, 1, 1.5, 0.5, 0.5,
-1, -4.071737, -5.912848, 0, 1.5, 0.5, 0.5,
0, -4.071737, -5.912848, 0, -0.5, 0.5, 0.5,
0, -4.071737, -5.912848, 1, -0.5, 0.5, 0.5,
0, -4.071737, -5.912848, 1, 1.5, 0.5, 0.5,
0, -4.071737, -5.912848, 0, 1.5, 0.5, 0.5,
1, -4.071737, -5.912848, 0, -0.5, 0.5, 0.5,
1, -4.071737, -5.912848, 1, -0.5, 0.5, 0.5,
1, -4.071737, -5.912848, 1, 1.5, 0.5, 0.5,
1, -4.071737, -5.912848, 0, 1.5, 0.5, 0.5,
2, -4.071737, -5.912848, 0, -0.5, 0.5, 0.5,
2, -4.071737, -5.912848, 1, -0.5, 0.5, 0.5,
2, -4.071737, -5.912848, 1, 1.5, 0.5, 0.5,
2, -4.071737, -5.912848, 0, 1.5, 0.5, 0.5
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
-3.250259, -3, -5.051724,
-3.250259, 3, -5.051724,
-3.250259, -3, -5.051724,
-3.405462, -3, -5.338766,
-3.250259, -2, -5.051724,
-3.405462, -2, -5.338766,
-3.250259, -1, -5.051724,
-3.405462, -1, -5.338766,
-3.250259, 0, -5.051724,
-3.405462, 0, -5.338766,
-3.250259, 1, -5.051724,
-3.405462, 1, -5.338766,
-3.250259, 2, -5.051724,
-3.405462, 2, -5.338766,
-3.250259, 3, -5.051724,
-3.405462, 3, -5.338766
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
-3.715869, -3, -5.912848, 0, -0.5, 0.5, 0.5,
-3.715869, -3, -5.912848, 1, -0.5, 0.5, 0.5,
-3.715869, -3, -5.912848, 1, 1.5, 0.5, 0.5,
-3.715869, -3, -5.912848, 0, 1.5, 0.5, 0.5,
-3.715869, -2, -5.912848, 0, -0.5, 0.5, 0.5,
-3.715869, -2, -5.912848, 1, -0.5, 0.5, 0.5,
-3.715869, -2, -5.912848, 1, 1.5, 0.5, 0.5,
-3.715869, -2, -5.912848, 0, 1.5, 0.5, 0.5,
-3.715869, -1, -5.912848, 0, -0.5, 0.5, 0.5,
-3.715869, -1, -5.912848, 1, -0.5, 0.5, 0.5,
-3.715869, -1, -5.912848, 1, 1.5, 0.5, 0.5,
-3.715869, -1, -5.912848, 0, 1.5, 0.5, 0.5,
-3.715869, 0, -5.912848, 0, -0.5, 0.5, 0.5,
-3.715869, 0, -5.912848, 1, -0.5, 0.5, 0.5,
-3.715869, 0, -5.912848, 1, 1.5, 0.5, 0.5,
-3.715869, 0, -5.912848, 0, 1.5, 0.5, 0.5,
-3.715869, 1, -5.912848, 0, -0.5, 0.5, 0.5,
-3.715869, 1, -5.912848, 1, -0.5, 0.5, 0.5,
-3.715869, 1, -5.912848, 1, 1.5, 0.5, 0.5,
-3.715869, 1, -5.912848, 0, 1.5, 0.5, 0.5,
-3.715869, 2, -5.912848, 0, -0.5, 0.5, 0.5,
-3.715869, 2, -5.912848, 1, -0.5, 0.5, 0.5,
-3.715869, 2, -5.912848, 1, 1.5, 0.5, 0.5,
-3.715869, 2, -5.912848, 0, 1.5, 0.5, 0.5,
-3.715869, 3, -5.912848, 0, -0.5, 0.5, 0.5,
-3.715869, 3, -5.912848, 1, -0.5, 0.5, 0.5,
-3.715869, 3, -5.912848, 1, 1.5, 0.5, 0.5,
-3.715869, 3, -5.912848, 0, 1.5, 0.5, 0.5
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
-3.250259, -3.556373, -4,
-3.250259, -3.556373, 6,
-3.250259, -3.556373, -4,
-3.405462, -3.728161, -4,
-3.250259, -3.556373, -2,
-3.405462, -3.728161, -2,
-3.250259, -3.556373, 0,
-3.405462, -3.728161, 0,
-3.250259, -3.556373, 2,
-3.405462, -3.728161, 2,
-3.250259, -3.556373, 4,
-3.405462, -3.728161, 4,
-3.250259, -3.556373, 6,
-3.405462, -3.728161, 6
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
"4",
"6"
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
-3.715869, -4.071737, -4, 0, -0.5, 0.5, 0.5,
-3.715869, -4.071737, -4, 1, -0.5, 0.5, 0.5,
-3.715869, -4.071737, -4, 1, 1.5, 0.5, 0.5,
-3.715869, -4.071737, -4, 0, 1.5, 0.5, 0.5,
-3.715869, -4.071737, -2, 0, -0.5, 0.5, 0.5,
-3.715869, -4.071737, -2, 1, -0.5, 0.5, 0.5,
-3.715869, -4.071737, -2, 1, 1.5, 0.5, 0.5,
-3.715869, -4.071737, -2, 0, 1.5, 0.5, 0.5,
-3.715869, -4.071737, 0, 0, -0.5, 0.5, 0.5,
-3.715869, -4.071737, 0, 1, -0.5, 0.5, 0.5,
-3.715869, -4.071737, 0, 1, 1.5, 0.5, 0.5,
-3.715869, -4.071737, 0, 0, 1.5, 0.5, 0.5,
-3.715869, -4.071737, 2, 0, -0.5, 0.5, 0.5,
-3.715869, -4.071737, 2, 1, -0.5, 0.5, 0.5,
-3.715869, -4.071737, 2, 1, 1.5, 0.5, 0.5,
-3.715869, -4.071737, 2, 0, 1.5, 0.5, 0.5,
-3.715869, -4.071737, 4, 0, -0.5, 0.5, 0.5,
-3.715869, -4.071737, 4, 1, -0.5, 0.5, 0.5,
-3.715869, -4.071737, 4, 1, 1.5, 0.5, 0.5,
-3.715869, -4.071737, 4, 0, 1.5, 0.5, 0.5,
-3.715869, -4.071737, 6, 0, -0.5, 0.5, 0.5,
-3.715869, -4.071737, 6, 1, -0.5, 0.5, 0.5,
-3.715869, -4.071737, 6, 1, 1.5, 0.5, 0.5,
-3.715869, -4.071737, 6, 0, 1.5, 0.5, 0.5
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
-3.250259, -3.556373, -5.051724,
-3.250259, 3.315154, -5.051724,
-3.250259, -3.556373, 6.429927,
-3.250259, 3.315154, 6.429927,
-3.250259, -3.556373, -5.051724,
-3.250259, -3.556373, 6.429927,
-3.250259, 3.315154, -5.051724,
-3.250259, 3.315154, 6.429927,
-3.250259, -3.556373, -5.051724,
2.95787, -3.556373, -5.051724,
-3.250259, -3.556373, 6.429927,
2.95787, -3.556373, 6.429927,
-3.250259, 3.315154, -5.051724,
2.95787, 3.315154, -5.051724,
-3.250259, 3.315154, 6.429927,
2.95787, 3.315154, 6.429927,
2.95787, -3.556373, -5.051724,
2.95787, 3.315154, -5.051724,
2.95787, -3.556373, 6.429927,
2.95787, 3.315154, 6.429927,
2.95787, -3.556373, -5.051724,
2.95787, -3.556373, 6.429927,
2.95787, 3.315154, -5.051724,
2.95787, 3.315154, 6.429927
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
var radius = 7.876658;
var distance = 35.04414;
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
mvMatrix.translate( 0.1461948, 0.1206095, -0.6891015 );
mvMatrix.scale( 1.371814, 1.239375, 0.7417397 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.04414);
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
Coumaphos<-read.table("Coumaphos.xyz", skip=1)
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
-3.159849, -0.1361949, -2.131858, 0, 0, 1, 1, 1,
-3.068427, 1.268416, -1.393219, 1, 0, 0, 1, 1,
-2.760843, -1.20172, -3.587997, 1, 0, 0, 1, 1,
-2.7035, -0.4121805, -1.446948, 1, 0, 0, 1, 1,
-2.688717, -0.8808946, -1.380447, 1, 0, 0, 1, 1,
-2.612476, -0.5757133, -1.553089, 1, 0, 0, 1, 1,
-2.508669, -1.698532, -2.805275, 0, 0, 0, 1, 1,
-2.392762, 1.31733, -0.1970353, 0, 0, 0, 1, 1,
-2.384562, -0.1799404, -0.9007438, 0, 0, 0, 1, 1,
-2.291247, -0.08075468, -0.9760115, 0, 0, 0, 1, 1,
-2.288945, -0.2382563, 0.05273018, 0, 0, 0, 1, 1,
-2.277714, -0.3896053, -0.8449384, 0, 0, 0, 1, 1,
-2.262522, 0.9753219, -0.5070575, 0, 0, 0, 1, 1,
-2.22617, 0.7388011, -0.4158142, 1, 1, 1, 1, 1,
-2.207758, -0.4488883, -0.9902115, 1, 1, 1, 1, 1,
-2.151037, -0.2068324, -3.437244, 1, 1, 1, 1, 1,
-2.121269, 1.094876, -2.636436, 1, 1, 1, 1, 1,
-2.115051, 0.8565744, -1.70664, 1, 1, 1, 1, 1,
-1.983512, 3.215083, -1.131556, 1, 1, 1, 1, 1,
-1.97906, -1.224164, -1.337155, 1, 1, 1, 1, 1,
-1.971811, -0.6113397, -0.57851, 1, 1, 1, 1, 1,
-1.938983, -1.78922, -2.439813, 1, 1, 1, 1, 1,
-1.937772, 1.763369, -0.944232, 1, 1, 1, 1, 1,
-1.906283, -1.058355, -0.6334552, 1, 1, 1, 1, 1,
-1.891203, 0.06710829, -0.7359554, 1, 1, 1, 1, 1,
-1.883858, -0.4022722, -2.270734, 1, 1, 1, 1, 1,
-1.879213, -0.6918262, -1.49034, 1, 1, 1, 1, 1,
-1.875451, 0.6007009, -1.955958, 1, 1, 1, 1, 1,
-1.874172, -0.3270192, -1.440816, 0, 0, 1, 1, 1,
-1.855213, -1.77406, -1.327857, 1, 0, 0, 1, 1,
-1.831326, 1.505894, -0.03091611, 1, 0, 0, 1, 1,
-1.823831, -0.0650356, -2.807741, 1, 0, 0, 1, 1,
-1.80618, -0.01604235, -0.3405509, 1, 0, 0, 1, 1,
-1.801201, 0.525435, -2.97094, 1, 0, 0, 1, 1,
-1.793533, -0.8810415, -1.116272, 0, 0, 0, 1, 1,
-1.743892, -0.5910713, -1.44784, 0, 0, 0, 1, 1,
-1.729909, -1.176623, -3.101637, 0, 0, 0, 1, 1,
-1.725202, 1.702204, -0.6403583, 0, 0, 0, 1, 1,
-1.719809, -0.6195835, -1.521698, 0, 0, 0, 1, 1,
-1.710343, 1.136226, -0.5550801, 0, 0, 0, 1, 1,
-1.710148, -0.5966386, -3.769612, 0, 0, 0, 1, 1,
-1.709785, -0.179618, -2.286688, 1, 1, 1, 1, 1,
-1.706774, -0.07210264, -2.608875, 1, 1, 1, 1, 1,
-1.70674, -0.1261037, -3.762737, 1, 1, 1, 1, 1,
-1.689585, 1.826995, -0.1293678, 1, 1, 1, 1, 1,
-1.681043, -0.04105468, -1.882535, 1, 1, 1, 1, 1,
-1.680631, 0.2488815, -1.041193, 1, 1, 1, 1, 1,
-1.674567, 0.1817887, -1.27044, 1, 1, 1, 1, 1,
-1.665165, -0.9719908, -2.83384, 1, 1, 1, 1, 1,
-1.66216, -1.541957, -2.064632, 1, 1, 1, 1, 1,
-1.648734, 1.572757, -0.3839137, 1, 1, 1, 1, 1,
-1.646363, -0.2723904, -1.815945, 1, 1, 1, 1, 1,
-1.634655, 1.256025, -1.384829, 1, 1, 1, 1, 1,
-1.621523, 0.3241417, -0.9305231, 1, 1, 1, 1, 1,
-1.614384, 0.6438841, -1.655093, 1, 1, 1, 1, 1,
-1.611601, 1.540223, -1.378435, 1, 1, 1, 1, 1,
-1.590125, -0.1365035, -3.381115, 0, 0, 1, 1, 1,
-1.576304, 0.4955553, -0.03945529, 1, 0, 0, 1, 1,
-1.549289, 0.672216, 2.048706, 1, 0, 0, 1, 1,
-1.546788, -1.328455, -1.990998, 1, 0, 0, 1, 1,
-1.517847, -0.9875074, -1.390152, 1, 0, 0, 1, 1,
-1.512441, 0.368115, -2.157116, 1, 0, 0, 1, 1,
-1.5052, -0.2689119, -0.4966477, 0, 0, 0, 1, 1,
-1.502547, 0.01435671, -0.4621921, 0, 0, 0, 1, 1,
-1.494078, 0.65041, -0.2196424, 0, 0, 0, 1, 1,
-1.488322, 0.7474078, -1.348018, 0, 0, 0, 1, 1,
-1.486791, -0.5557974, -3.134289, 0, 0, 0, 1, 1,
-1.483805, -0.1359759, -0.8839865, 0, 0, 0, 1, 1,
-1.483737, 0.1083158, -1.198433, 0, 0, 0, 1, 1,
-1.476708, 1.658794, -0.7904372, 1, 1, 1, 1, 1,
-1.45944, 1.051418, 0.7714095, 1, 1, 1, 1, 1,
-1.451347, 0.1448448, -2.679358, 1, 1, 1, 1, 1,
-1.446629, -0.5373975, -2.859244, 1, 1, 1, 1, 1,
-1.439199, 1.090004, -0.6659682, 1, 1, 1, 1, 1,
-1.438756, -0.02042315, 0.1083254, 1, 1, 1, 1, 1,
-1.43409, 0.7373887, -1.316797, 1, 1, 1, 1, 1,
-1.432875, -0.9781535, -3.27998, 1, 1, 1, 1, 1,
-1.42858, -0.8116583, -0.9039609, 1, 1, 1, 1, 1,
-1.42754, 0.1882038, -1.785899, 1, 1, 1, 1, 1,
-1.422002, 0.1981839, -0.4427728, 1, 1, 1, 1, 1,
-1.401975, 1.216227, -0.5527734, 1, 1, 1, 1, 1,
-1.401389, 0.77123, -1.717596, 1, 1, 1, 1, 1,
-1.381097, 0.1492227, -0.1093175, 1, 1, 1, 1, 1,
-1.378477, 0.7214826, -0.6401225, 1, 1, 1, 1, 1,
-1.365175, 0.1791968, -1.246339, 0, 0, 1, 1, 1,
-1.361107, 1.097919, -0.3856627, 1, 0, 0, 1, 1,
-1.360723, -0.2921637, -0.7801728, 1, 0, 0, 1, 1,
-1.358787, -0.4154231, -2.416533, 1, 0, 0, 1, 1,
-1.357716, -0.1117949, -1.913372, 1, 0, 0, 1, 1,
-1.357557, -0.557234, -1.876766, 1, 0, 0, 1, 1,
-1.35408, -0.4828061, -1.572202, 0, 0, 0, 1, 1,
-1.340165, -1.157203, -2.802376, 0, 0, 0, 1, 1,
-1.336827, -0.1773608, -2.282912, 0, 0, 0, 1, 1,
-1.317411, -1.569662, -0.1247152, 0, 0, 0, 1, 1,
-1.300153, -0.2735148, -1.786006, 0, 0, 0, 1, 1,
-1.298867, -0.7555764, -2.728891, 0, 0, 0, 1, 1,
-1.290933, -0.2868005, 0.5008138, 0, 0, 0, 1, 1,
-1.289305, 0.3801028, -0.6293154, 1, 1, 1, 1, 1,
-1.288699, 2.299012, -0.3389641, 1, 1, 1, 1, 1,
-1.285197, -1.001328, -2.456572, 1, 1, 1, 1, 1,
-1.28409, -2.028679, -1.538527, 1, 1, 1, 1, 1,
-1.276102, 0.9758457, 0.7412793, 1, 1, 1, 1, 1,
-1.272235, -0.2453306, -1.338736, 1, 1, 1, 1, 1,
-1.271555, 1.489868, -2.523644, 1, 1, 1, 1, 1,
-1.267692, -1.715893, -2.114798, 1, 1, 1, 1, 1,
-1.257061, 1.419461, 0.05809477, 1, 1, 1, 1, 1,
-1.25421, 0.1438614, -0.3934153, 1, 1, 1, 1, 1,
-1.253788, 0.3463602, -0.2533582, 1, 1, 1, 1, 1,
-1.246061, 0.5371751, -1.454813, 1, 1, 1, 1, 1,
-1.236394, -0.4554945, -2.715125, 1, 1, 1, 1, 1,
-1.222477, -1.18914, -2.016588, 1, 1, 1, 1, 1,
-1.222035, 1.886577, 0.3862832, 1, 1, 1, 1, 1,
-1.215005, 1.421408, 0.6392035, 0, 0, 1, 1, 1,
-1.200942, 0.04101257, -1.629058, 1, 0, 0, 1, 1,
-1.19453, -0.5111834, -1.173632, 1, 0, 0, 1, 1,
-1.194079, -0.4289294, -3.183852, 1, 0, 0, 1, 1,
-1.19313, 0.9448001, -1.184846, 1, 0, 0, 1, 1,
-1.190818, -0.1130196, 0.8095002, 1, 0, 0, 1, 1,
-1.189854, 0.6915794, -2.038978, 0, 0, 0, 1, 1,
-1.186188, -1.50746, -2.637315, 0, 0, 0, 1, 1,
-1.17943, -0.7859528, -2.157283, 0, 0, 0, 1, 1,
-1.169357, 0.4154197, 0.3087584, 0, 0, 0, 1, 1,
-1.169023, -3.32357, -0.3195877, 0, 0, 0, 1, 1,
-1.150426, 0.8134599, -0.6363866, 0, 0, 0, 1, 1,
-1.143501, -0.2832683, -1.285742, 0, 0, 0, 1, 1,
-1.143001, 0.5553328, -1.969333, 1, 1, 1, 1, 1,
-1.14015, 0.559575, -1.257374, 1, 1, 1, 1, 1,
-1.133362, 0.5015956, -2.525163, 1, 1, 1, 1, 1,
-1.130708, -0.8070527, -2.978306, 1, 1, 1, 1, 1,
-1.126081, -1.580097, -2.822999, 1, 1, 1, 1, 1,
-1.121256, -0.2569521, -2.024186, 1, 1, 1, 1, 1,
-1.113172, 0.914309, -0.293543, 1, 1, 1, 1, 1,
-1.111591, -1.133403, -3.341872, 1, 1, 1, 1, 1,
-1.110024, -0.4026709, -1.992405, 1, 1, 1, 1, 1,
-1.108413, 0.3301003, -2.435071, 1, 1, 1, 1, 1,
-1.099831, 0.261351, -2.001736, 1, 1, 1, 1, 1,
-1.099423, -0.09254187, -2.857413, 1, 1, 1, 1, 1,
-1.09581, 0.4999026, -1.086357, 1, 1, 1, 1, 1,
-1.091662, 1.64963, -1.18215, 1, 1, 1, 1, 1,
-1.089342, 0.2645348, -1.474559, 1, 1, 1, 1, 1,
-1.089008, 0.02922855, -1.308812, 0, 0, 1, 1, 1,
-1.086903, -0.8917983, -3.288825, 1, 0, 0, 1, 1,
-1.083371, 0.4824844, -0.08131251, 1, 0, 0, 1, 1,
-1.079604, 0.5387614, -2.07899, 1, 0, 0, 1, 1,
-1.072583, -0.7515003, -2.077917, 1, 0, 0, 1, 1,
-1.071198, -0.7904639, -1.833594, 1, 0, 0, 1, 1,
-1.070852, -2.168164, -1.539942, 0, 0, 0, 1, 1,
-1.062758, -2.020801, -3.134979, 0, 0, 0, 1, 1,
-1.057492, -0.896614, -3.790486, 0, 0, 0, 1, 1,
-1.057141, 1.462504, -0.2637299, 0, 0, 0, 1, 1,
-1.05512, 0.8039494, -1.05373, 0, 0, 0, 1, 1,
-1.052834, 0.3058817, -0.2312981, 0, 0, 0, 1, 1,
-1.052576, -0.5809577, -2.676418, 0, 0, 0, 1, 1,
-1.048776, 0.7534521, -0.5531369, 1, 1, 1, 1, 1,
-1.047412, 1.235016, -0.4541056, 1, 1, 1, 1, 1,
-1.047345, -0.8615881, -1.853302, 1, 1, 1, 1, 1,
-1.041961, -0.5461597, -1.337812, 1, 1, 1, 1, 1,
-1.036996, 0.2177099, -0.9736981, 1, 1, 1, 1, 1,
-1.033033, -0.3618241, -0.514723, 1, 1, 1, 1, 1,
-1.029974, 1.06597, -0.4887599, 1, 1, 1, 1, 1,
-1.025342, -1.120578, -3.010404, 1, 1, 1, 1, 1,
-1.013314, -2.295812, -1.765864, 1, 1, 1, 1, 1,
-1.009915, 0.9894617, -1.163601, 1, 1, 1, 1, 1,
-0.9967642, 1.158852, -0.7063201, 1, 1, 1, 1, 1,
-0.985983, 2.294625, -1.1974, 1, 1, 1, 1, 1,
-0.974086, 1.198194, -1.691413, 1, 1, 1, 1, 1,
-0.9716802, -0.3543658, -2.69139, 1, 1, 1, 1, 1,
-0.9687097, 0.7669621, -1.212198, 1, 1, 1, 1, 1,
-0.964178, 1.536983, -0.3425499, 0, 0, 1, 1, 1,
-0.9606957, -0.6130001, -2.204145, 1, 0, 0, 1, 1,
-0.9579343, -1.853083, -1.945611, 1, 0, 0, 1, 1,
-0.954686, -0.5147228, -2.426595, 1, 0, 0, 1, 1,
-0.9473126, 0.9956307, -1.345075, 1, 0, 0, 1, 1,
-0.9462357, -2.427372, -3.459049, 1, 0, 0, 1, 1,
-0.9407117, -0.3938021, -0.9343867, 0, 0, 0, 1, 1,
-0.9399764, -1.569032, -1.972324, 0, 0, 0, 1, 1,
-0.9262945, -0.2121853, -1.088567, 0, 0, 0, 1, 1,
-0.9247532, -1.392531, -1.978283, 0, 0, 0, 1, 1,
-0.9224821, 0.4737873, -1.758066, 0, 0, 0, 1, 1,
-0.9129658, 0.03983871, 0.3981235, 0, 0, 0, 1, 1,
-0.9117579, 0.4586986, -1.29489, 0, 0, 0, 1, 1,
-0.905423, 0.7120676, 0.3518849, 1, 1, 1, 1, 1,
-0.8992246, 0.7511226, -0.8309231, 1, 1, 1, 1, 1,
-0.8942953, -0.5482127, -1.441684, 1, 1, 1, 1, 1,
-0.8941299, 0.80132, -0.2226148, 1, 1, 1, 1, 1,
-0.8933876, -0.2485221, -2.964527, 1, 1, 1, 1, 1,
-0.8924408, 1.546376, -0.7280746, 1, 1, 1, 1, 1,
-0.8895405, -0.5863146, -0.4414409, 1, 1, 1, 1, 1,
-0.8894057, 1.787136, -0.1892556, 1, 1, 1, 1, 1,
-0.8893839, -0.5748966, -2.636278, 1, 1, 1, 1, 1,
-0.8804137, 0.7818501, -0.7758158, 1, 1, 1, 1, 1,
-0.8797695, 1.266167, -0.3250796, 1, 1, 1, 1, 1,
-0.8784909, 0.9853117, 0.569295, 1, 1, 1, 1, 1,
-0.8708111, -0.02765706, 0.419723, 1, 1, 1, 1, 1,
-0.8707644, -0.5856418, -3.241094, 1, 1, 1, 1, 1,
-0.870688, 0.5596791, 1.545364, 1, 1, 1, 1, 1,
-0.8658978, 0.05470955, -0.05653563, 0, 0, 1, 1, 1,
-0.8635864, 0.142147, -2.059459, 1, 0, 0, 1, 1,
-0.8624714, -0.6782174, -0.6351961, 1, 0, 0, 1, 1,
-0.855376, 1.609003, -0.4170954, 1, 0, 0, 1, 1,
-0.8511865, 0.1010213, -2.344322, 1, 0, 0, 1, 1,
-0.8459677, -0.6685778, -3.580895, 1, 0, 0, 1, 1,
-0.8430957, 1.921439, -0.300869, 0, 0, 0, 1, 1,
-0.8414394, 0.6984316, 0.6805487, 0, 0, 0, 1, 1,
-0.8386681, -1.924799, -3.44982, 0, 0, 0, 1, 1,
-0.8313268, 0.472292, -2.063343, 0, 0, 0, 1, 1,
-0.8285449, 2.055012, -2.748614, 0, 0, 0, 1, 1,
-0.8277322, 0.2098512, -1.086819, 0, 0, 0, 1, 1,
-0.8273533, 0.8272092, 0.2952025, 0, 0, 0, 1, 1,
-0.8256575, -0.8337079, -1.881169, 1, 1, 1, 1, 1,
-0.8249411, 0.6119646, -0.4412568, 1, 1, 1, 1, 1,
-0.8220039, -2.317177, -2.245667, 1, 1, 1, 1, 1,
-0.8210731, -0.8365024, -2.214358, 1, 1, 1, 1, 1,
-0.820588, 0.254144, -0.7478278, 1, 1, 1, 1, 1,
-0.8196475, 0.1811458, -2.430493, 1, 1, 1, 1, 1,
-0.8188344, 1.021516, -3.174133, 1, 1, 1, 1, 1,
-0.8176343, -0.174722, -1.073502, 1, 1, 1, 1, 1,
-0.8140644, 0.2912316, -0.06940173, 1, 1, 1, 1, 1,
-0.8134649, 1.16498, -1.395699, 1, 1, 1, 1, 1,
-0.8130081, -1.510332, -2.019794, 1, 1, 1, 1, 1,
-0.8114208, 0.242635, -3.336065, 1, 1, 1, 1, 1,
-0.809942, -0.9392575, -2.045134, 1, 1, 1, 1, 1,
-0.8083032, -0.9388372, -2.927845, 1, 1, 1, 1, 1,
-0.8051959, 1.460188, 0.651455, 1, 1, 1, 1, 1,
-0.8023036, 0.05665511, -1.868726, 0, 0, 1, 1, 1,
-0.8006127, 0.1749413, -1.397507, 1, 0, 0, 1, 1,
-0.7999632, -0.9692996, -2.213295, 1, 0, 0, 1, 1,
-0.793961, -0.8162249, -3.584588, 1, 0, 0, 1, 1,
-0.7866728, 0.6666902, 0.09538549, 1, 0, 0, 1, 1,
-0.7845367, 1.28886, 1.038915, 1, 0, 0, 1, 1,
-0.7798764, -1.205506, -2.903281, 0, 0, 0, 1, 1,
-0.7779765, 0.8936232, -0.7853996, 0, 0, 0, 1, 1,
-0.7756295, -0.2607786, 0.4144057, 0, 0, 0, 1, 1,
-0.77436, 0.6589843, -0.8708617, 0, 0, 0, 1, 1,
-0.7669062, -1.786311, -2.49518, 0, 0, 0, 1, 1,
-0.7604514, -1.393973, -1.870627, 0, 0, 0, 1, 1,
-0.7573684, 2.258374, -1.935741, 0, 0, 0, 1, 1,
-0.7565029, 0.887684, -0.5645327, 1, 1, 1, 1, 1,
-0.749744, -0.5558591, -2.224246, 1, 1, 1, 1, 1,
-0.7453756, 1.379735, -0.3560146, 1, 1, 1, 1, 1,
-0.7447512, -0.9464427, -2.439461, 1, 1, 1, 1, 1,
-0.7435964, 0.7851493, -1.190766, 1, 1, 1, 1, 1,
-0.742859, -2.576202, -0.6455399, 1, 1, 1, 1, 1,
-0.7408684, -0.8533667, -2.467751, 1, 1, 1, 1, 1,
-0.7364851, 1.398256, -0.07596985, 1, 1, 1, 1, 1,
-0.7214642, 0.8647096, 0.7950979, 1, 1, 1, 1, 1,
-0.7148624, -1.348461, -2.905447, 1, 1, 1, 1, 1,
-0.7110552, 0.553839, -1.074925, 1, 1, 1, 1, 1,
-0.7011536, 0.1049831, -2.813453, 1, 1, 1, 1, 1,
-0.7011185, -0.8471197, -1.561165, 1, 1, 1, 1, 1,
-0.697072, 0.9564489, -0.5567967, 1, 1, 1, 1, 1,
-0.69424, 0.5540692, -0.09394328, 1, 1, 1, 1, 1,
-0.6942117, 0.4568901, -0.9962541, 0, 0, 1, 1, 1,
-0.6888947, -0.2280992, -2.164898, 1, 0, 0, 1, 1,
-0.6884341, -0.2844824, -1.968847, 1, 0, 0, 1, 1,
-0.6837238, 0.4133095, -1.467963, 1, 0, 0, 1, 1,
-0.6830036, -0.8032004, -1.630353, 1, 0, 0, 1, 1,
-0.6825121, 1.2624, -2.324279, 1, 0, 0, 1, 1,
-0.6801865, -2.187414, -3.153932, 0, 0, 0, 1, 1,
-0.678864, -1.111006, -3.369381, 0, 0, 0, 1, 1,
-0.6736317, 0.1024853, -1.533914, 0, 0, 0, 1, 1,
-0.6702844, -0.1540938, -3.523545, 0, 0, 0, 1, 1,
-0.6647676, -0.121389, 0.4895705, 0, 0, 0, 1, 1,
-0.6568802, 0.6734289, 0.7722528, 0, 0, 0, 1, 1,
-0.65195, -0.7061459, -2.170224, 0, 0, 0, 1, 1,
-0.6488963, -0.7403859, -2.985289, 1, 1, 1, 1, 1,
-0.6479416, -0.4170077, -2.047908, 1, 1, 1, 1, 1,
-0.6452948, 1.424135, 1.585585, 1, 1, 1, 1, 1,
-0.6408516, 1.252288, -1.79222, 1, 1, 1, 1, 1,
-0.6407018, 1.572373, -1.033601, 1, 1, 1, 1, 1,
-0.6358554, -0.5419216, -0.7914871, 1, 1, 1, 1, 1,
-0.6349481, -0.7380269, -3.562574, 1, 1, 1, 1, 1,
-0.6340088, -2.674288, -3.576524, 1, 1, 1, 1, 1,
-0.6339289, -0.4705604, -4.217687, 1, 1, 1, 1, 1,
-0.6323366, 0.06702524, 0.09053558, 1, 1, 1, 1, 1,
-0.6285201, 0.223375, -2.40357, 1, 1, 1, 1, 1,
-0.6265494, 0.6200918, -0.474289, 1, 1, 1, 1, 1,
-0.6265122, 1.272518, -0.3501489, 1, 1, 1, 1, 1,
-0.6133914, 0.5256456, -0.7781649, 1, 1, 1, 1, 1,
-0.6085086, -0.4943165, -1.384703, 1, 1, 1, 1, 1,
-0.6084338, -0.3500175, -2.945064, 0, 0, 1, 1, 1,
-0.6061758, -0.5203826, -1.233009, 1, 0, 0, 1, 1,
-0.6060318, 0.5968205, -0.5357999, 1, 0, 0, 1, 1,
-0.6032241, 0.6131259, -0.2403262, 1, 0, 0, 1, 1,
-0.5933121, -0.1426221, -2.787237, 1, 0, 0, 1, 1,
-0.5874875, -1.867142, -3.267477, 1, 0, 0, 1, 1,
-0.5854937, 1.18056, 0.2061032, 0, 0, 0, 1, 1,
-0.5787991, 0.2153238, -2.398891, 0, 0, 0, 1, 1,
-0.5787187, -1.029101, -3.032933, 0, 0, 0, 1, 1,
-0.578174, -2.331216, -3.510379, 0, 0, 0, 1, 1,
-0.5770243, 0.09352338, -3.835434, 0, 0, 0, 1, 1,
-0.5757318, -0.4271861, -1.903443, 0, 0, 0, 1, 1,
-0.5688925, 0.4915113, -0.406852, 0, 0, 0, 1, 1,
-0.5669615, 0.334399, -0.6406648, 1, 1, 1, 1, 1,
-0.5658919, -0.544384, -3.124685, 1, 1, 1, 1, 1,
-0.5648208, -0.7511377, -2.472259, 1, 1, 1, 1, 1,
-0.5632075, 1.107543, 2.013946, 1, 1, 1, 1, 1,
-0.5626984, -1.047067, -3.447017, 1, 1, 1, 1, 1,
-0.5613744, 0.0837134, -1.878715, 1, 1, 1, 1, 1,
-0.5586121, 0.4002513, 0.06036923, 1, 1, 1, 1, 1,
-0.5522222, 0.5213227, -1.175198, 1, 1, 1, 1, 1,
-0.5507213, -1.218968, -3.379713, 1, 1, 1, 1, 1,
-0.5466103, -1.995409, -4.581833, 1, 1, 1, 1, 1,
-0.5452064, 0.6397423, -1.615713, 1, 1, 1, 1, 1,
-0.5382479, 0.009154771, -2.511161, 1, 1, 1, 1, 1,
-0.5372736, -0.7164366, -1.912179, 1, 1, 1, 1, 1,
-0.531469, 0.2896358, -1.651034, 1, 1, 1, 1, 1,
-0.5302939, 0.6217317, 0.06779601, 1, 1, 1, 1, 1,
-0.5231351, -1.626519, -2.967822, 0, 0, 1, 1, 1,
-0.5219995, 0.5094436, -2.101224, 1, 0, 0, 1, 1,
-0.5165703, 1.157473, -0.2015705, 1, 0, 0, 1, 1,
-0.5164564, -0.4441542, -1.887821, 1, 0, 0, 1, 1,
-0.5104054, -0.8286948, -4.339046, 1, 0, 0, 1, 1,
-0.5050907, 0.9968802, -0.4317155, 1, 0, 0, 1, 1,
-0.5050198, -0.7890136, -2.819332, 0, 0, 0, 1, 1,
-0.5036476, -1.231527, -3.031083, 0, 0, 0, 1, 1,
-0.500429, 1.440903, -1.023648, 0, 0, 0, 1, 1,
-0.4984034, 1.175458, -0.259202, 0, 0, 0, 1, 1,
-0.4908256, 1.379577, 0.7402077, 0, 0, 0, 1, 1,
-0.4857123, 1.482838, 0.09416139, 0, 0, 0, 1, 1,
-0.4815474, 0.2494081, -2.212544, 0, 0, 0, 1, 1,
-0.4787742, -0.3253575, -1.94673, 1, 1, 1, 1, 1,
-0.4695772, 0.5732437, 0.7685088, 1, 1, 1, 1, 1,
-0.4667981, -1.187611, -1.232381, 1, 1, 1, 1, 1,
-0.4628386, -0.4415029, -2.071805, 1, 1, 1, 1, 1,
-0.4627681, -0.8593426, -3.849492, 1, 1, 1, 1, 1,
-0.4576892, -2.239513, -3.561144, 1, 1, 1, 1, 1,
-0.4567076, -0.2925961, -3.064308, 1, 1, 1, 1, 1,
-0.4542483, 0.4050525, -1.449912, 1, 1, 1, 1, 1,
-0.4521694, 0.6541684, -1.724337, 1, 1, 1, 1, 1,
-0.4499467, 0.1797686, -2.5127, 1, 1, 1, 1, 1,
-0.439803, -1.182704, -2.368156, 1, 1, 1, 1, 1,
-0.4383926, 1.073346, 0.01527789, 1, 1, 1, 1, 1,
-0.4383203, -1.087743, -2.363538, 1, 1, 1, 1, 1,
-0.4368088, -1.135762, -1.37186, 1, 1, 1, 1, 1,
-0.4345421, -0.4288904, -2.96382, 1, 1, 1, 1, 1,
-0.4312239, -0.3676034, -1.733122, 0, 0, 1, 1, 1,
-0.4274741, 0.03474801, -0.7947558, 1, 0, 0, 1, 1,
-0.4234906, -0.803186, -0.5794776, 1, 0, 0, 1, 1,
-0.4214942, 0.01480054, -0.5083653, 1, 0, 0, 1, 1,
-0.4201014, -1.329246, -1.654369, 1, 0, 0, 1, 1,
-0.4195695, 0.6687046, 0.05023897, 1, 0, 0, 1, 1,
-0.4182701, 0.3769906, -2.07326, 0, 0, 0, 1, 1,
-0.4174218, 0.01274746, -1.539059, 0, 0, 0, 1, 1,
-0.40543, -0.03186077, -1.828651, 0, 0, 0, 1, 1,
-0.3998464, 1.027874, -1.516657, 0, 0, 0, 1, 1,
-0.3948275, -0.7226047, -3.212085, 0, 0, 0, 1, 1,
-0.3902699, -0.4271875, -2.996418, 0, 0, 0, 1, 1,
-0.3898169, -0.5265133, -4.223386, 0, 0, 0, 1, 1,
-0.3898168, 0.5353495, 0.2278542, 1, 1, 1, 1, 1,
-0.3894496, -3.355744, -2.159509, 1, 1, 1, 1, 1,
-0.3890615, -0.8220593, -1.95244, 1, 1, 1, 1, 1,
-0.3888364, 1.304414, -0.216137, 1, 1, 1, 1, 1,
-0.3871357, 1.67504, -0.0940602, 1, 1, 1, 1, 1,
-0.3796388, -0.9654094, -3.315456, 1, 1, 1, 1, 1,
-0.3781389, 0.5803537, -1.187394, 1, 1, 1, 1, 1,
-0.3776507, -0.4218825, -3.510174, 1, 1, 1, 1, 1,
-0.3775546, 0.1291409, -2.278155, 1, 1, 1, 1, 1,
-0.3768848, 1.076171, 0.2977725, 1, 1, 1, 1, 1,
-0.3682031, 0.7680302, -0.6542153, 1, 1, 1, 1, 1,
-0.3636768, -1.083607, -3.639952, 1, 1, 1, 1, 1,
-0.3617077, -0.5487415, -2.231559, 1, 1, 1, 1, 1,
-0.3599753, 0.3216637, -0.04489885, 1, 1, 1, 1, 1,
-0.3583286, 0.1846675, -0.6148458, 1, 1, 1, 1, 1,
-0.3582217, -0.9956789, -3.797666, 0, 0, 1, 1, 1,
-0.3579449, 0.6949507, -0.3639228, 1, 0, 0, 1, 1,
-0.3569368, -0.4726788, -3.289363, 1, 0, 0, 1, 1,
-0.3561682, -0.1742931, -1.318854, 1, 0, 0, 1, 1,
-0.3548962, 0.7903874, 0.3056721, 1, 0, 0, 1, 1,
-0.3539072, -1.093337, -3.31415, 1, 0, 0, 1, 1,
-0.3523545, -0.6138925, -1.340721, 0, 0, 0, 1, 1,
-0.3516879, -0.3088866, -0.9177929, 0, 0, 0, 1, 1,
-0.3479515, -0.4794696, -3.762698, 0, 0, 0, 1, 1,
-0.3450564, 0.9070064, -0.8307195, 0, 0, 0, 1, 1,
-0.343149, -0.4759889, -0.3419658, 0, 0, 0, 1, 1,
-0.342989, 1.25372, 0.1276693, 0, 0, 0, 1, 1,
-0.3336835, 0.2702378, 0.7030162, 0, 0, 0, 1, 1,
-0.3327989, -0.5195287, -4.264581, 1, 1, 1, 1, 1,
-0.3302996, 1.350827, 0.7537673, 1, 1, 1, 1, 1,
-0.3295234, -0.2075078, -1.560849, 1, 1, 1, 1, 1,
-0.3292021, 0.04671803, 0.5613501, 1, 1, 1, 1, 1,
-0.3269647, 0.9500631, -0.1187329, 1, 1, 1, 1, 1,
-0.3260971, 1.571532, 1.52626, 1, 1, 1, 1, 1,
-0.3225786, -0.3519702, -1.895471, 1, 1, 1, 1, 1,
-0.3217869, 0.8207994, 0.7847884, 1, 1, 1, 1, 1,
-0.3208339, 1.433346, -0.1870541, 1, 1, 1, 1, 1,
-0.320507, -1.560053, -3.223892, 1, 1, 1, 1, 1,
-0.3194208, 0.172264, -0.6609867, 1, 1, 1, 1, 1,
-0.3175654, 0.1452096, -2.078108, 1, 1, 1, 1, 1,
-0.3169921, -0.8634368, -2.778115, 1, 1, 1, 1, 1,
-0.3161871, 0.4483551, -0.9127375, 1, 1, 1, 1, 1,
-0.3097405, 0.03442227, -2.053435, 1, 1, 1, 1, 1,
-0.309354, -0.4250557, -4.675084, 0, 0, 1, 1, 1,
-0.302945, -0.1834307, -2.255679, 1, 0, 0, 1, 1,
-0.3022286, 0.5817046, -2.007933, 1, 0, 0, 1, 1,
-0.3009814, -0.8797309, -3.709037, 1, 0, 0, 1, 1,
-0.2967462, -0.9416136, -1.371734, 1, 0, 0, 1, 1,
-0.2899491, -1.135728, -3.533999, 1, 0, 0, 1, 1,
-0.283213, 0.1528167, -1.586329, 0, 0, 0, 1, 1,
-0.2828518, 0.2137162, 0.4273634, 0, 0, 0, 1, 1,
-0.2824541, 1.018716, 0.6583258, 0, 0, 0, 1, 1,
-0.2775822, -0.3371301, -3.470869, 0, 0, 0, 1, 1,
-0.276272, -1.356, -2.321855, 0, 0, 0, 1, 1,
-0.2738423, 0.05185643, -0.9048496, 0, 0, 0, 1, 1,
-0.2687975, -2.164152, -1.996713, 0, 0, 0, 1, 1,
-0.2686665, 0.04618658, -1.889944, 1, 1, 1, 1, 1,
-0.2613114, -0.9635173, -2.675033, 1, 1, 1, 1, 1,
-0.2599927, -1.032107, -2.514196, 1, 1, 1, 1, 1,
-0.2574331, 1.480653, 1.002477, 1, 1, 1, 1, 1,
-0.2556681, 0.2420946, -1.262858, 1, 1, 1, 1, 1,
-0.2544797, 0.6015049, -1.400446, 1, 1, 1, 1, 1,
-0.2540358, -1.20151, -4.17802, 1, 1, 1, 1, 1,
-0.2498216, 1.291988, -0.08699005, 1, 1, 1, 1, 1,
-0.2493752, -1.761644, -2.131487, 1, 1, 1, 1, 1,
-0.2364149, 1.131052, -1.520006, 1, 1, 1, 1, 1,
-0.2257672, 0.2450432, -0.9195641, 1, 1, 1, 1, 1,
-0.2236164, -1.331631, -3.627837, 1, 1, 1, 1, 1,
-0.2195893, -0.6497786, -1.47779, 1, 1, 1, 1, 1,
-0.2191039, -1.279664, -2.364643, 1, 1, 1, 1, 1,
-0.2184311, -1.258757, -2.173674, 1, 1, 1, 1, 1,
-0.2145269, -0.800706, -3.200059, 0, 0, 1, 1, 1,
-0.2144361, 1.514463, -0.1877118, 1, 0, 0, 1, 1,
-0.2133326, -0.9019544, -4.394742, 1, 0, 0, 1, 1,
-0.2125927, 0.4577255, -0.4848832, 1, 0, 0, 1, 1,
-0.2097364, 0.9755291, -0.01933556, 1, 0, 0, 1, 1,
-0.2005539, -0.02742526, -1.783735, 1, 0, 0, 1, 1,
-0.1962557, -0.5450348, -3.629859, 0, 0, 0, 1, 1,
-0.1959428, -0.1015826, -2.617013, 0, 0, 0, 1, 1,
-0.1948301, -0.1339608, -3.257801, 0, 0, 0, 1, 1,
-0.1910002, 1.188855, -0.189838, 0, 0, 0, 1, 1,
-0.1906725, 0.3124054, -0.109548, 0, 0, 0, 1, 1,
-0.1891363, -0.9326133, -2.48621, 0, 0, 0, 1, 1,
-0.1869651, -0.7454656, -3.406714, 0, 0, 0, 1, 1,
-0.1856042, -1.234251, -1.849303, 1, 1, 1, 1, 1,
-0.1797974, 0.200799, -1.537469, 1, 1, 1, 1, 1,
-0.1797237, 1.094157, 1.436936, 1, 1, 1, 1, 1,
-0.1739161, -0.08084409, -1.824963, 1, 1, 1, 1, 1,
-0.1739137, 1.263146, 0.2715217, 1, 1, 1, 1, 1,
-0.1730367, -0.8643783, -1.879663, 1, 1, 1, 1, 1,
-0.1705726, 0.428905, -0.01545374, 1, 1, 1, 1, 1,
-0.1700663, 0.3177032, -0.3331361, 1, 1, 1, 1, 1,
-0.1684117, 0.172225, -1.136715, 1, 1, 1, 1, 1,
-0.1669613, 1.503731, 0.8172076, 1, 1, 1, 1, 1,
-0.1652558, 0.5361559, -0.7615221, 1, 1, 1, 1, 1,
-0.1649392, -0.7328733, -1.686895, 1, 1, 1, 1, 1,
-0.157625, -1.566411, -2.457974, 1, 1, 1, 1, 1,
-0.1574453, 1.588048, -1.070813, 1, 1, 1, 1, 1,
-0.1569464, 0.9302663, -1.003264, 1, 1, 1, 1, 1,
-0.1562129, 0.8462934, -0.1586891, 0, 0, 1, 1, 1,
-0.1551487, 1.322685, 0.4999196, 1, 0, 0, 1, 1,
-0.1535249, 0.8292137, 0.3603695, 1, 0, 0, 1, 1,
-0.1532826, 0.6184812, -0.4500134, 1, 0, 0, 1, 1,
-0.1493246, -0.958768, -2.184662, 1, 0, 0, 1, 1,
-0.1482811, 0.7935575, 0.8158878, 1, 0, 0, 1, 1,
-0.146897, -0.7559463, -1.145237, 0, 0, 0, 1, 1,
-0.1456575, 0.1784336, -0.3174487, 0, 0, 0, 1, 1,
-0.1430573, -0.9269444, -4.884516, 0, 0, 0, 1, 1,
-0.1381087, -0.1676943, -2.677596, 0, 0, 0, 1, 1,
-0.1365546, -0.3550666, -2.673805, 0, 0, 0, 1, 1,
-0.1290572, 1.828621, 0.1944213, 0, 0, 0, 1, 1,
-0.1286236, 1.290837, 0.7402688, 0, 0, 0, 1, 1,
-0.1284833, 0.5925266, -1.792589, 1, 1, 1, 1, 1,
-0.1223876, 1.021979, 0.476334, 1, 1, 1, 1, 1,
-0.1221597, -0.9890027, -4.408302, 1, 1, 1, 1, 1,
-0.121107, -1.686252, -3.939395, 1, 1, 1, 1, 1,
-0.1175922, 0.671912, 0.9046488, 1, 1, 1, 1, 1,
-0.1164002, 0.8551689, 0.4713982, 1, 1, 1, 1, 1,
-0.1124304, -0.04582301, -2.578155, 1, 1, 1, 1, 1,
-0.1078726, -0.4647502, -1.161694, 1, 1, 1, 1, 1,
-0.1052969, 0.06621417, -1.164557, 1, 1, 1, 1, 1,
-0.09602331, 0.6019276, -1.411261, 1, 1, 1, 1, 1,
-0.09564614, -0.5908718, -2.134553, 1, 1, 1, 1, 1,
-0.09438986, 0.9074981, 0.5553859, 1, 1, 1, 1, 1,
-0.08842558, 0.06415127, -1.975869, 1, 1, 1, 1, 1,
-0.07627253, -0.4054026, -3.238138, 1, 1, 1, 1, 1,
-0.07112771, -0.838501, -2.390929, 1, 1, 1, 1, 1,
-0.07028329, 0.4200993, 0.8054768, 0, 0, 1, 1, 1,
-0.06958605, 0.2153509, 0.1655978, 1, 0, 0, 1, 1,
-0.06920164, -0.438194, -3.411945, 1, 0, 0, 1, 1,
-0.0672782, 0.01265723, -1.496996, 1, 0, 0, 1, 1,
-0.06665867, -0.3255929, -2.665635, 1, 0, 0, 1, 1,
-0.0626968, -0.2959776, -1.326894, 1, 0, 0, 1, 1,
-0.06254642, 0.8638052, -1.525929, 0, 0, 0, 1, 1,
-0.06153005, -0.5271698, -1.900505, 0, 0, 0, 1, 1,
-0.06124518, 1.307078, 0.4743613, 0, 0, 0, 1, 1,
-0.05999289, -0.5367685, -2.769288, 0, 0, 0, 1, 1,
-0.05707773, 0.5814351, 0.2033341, 0, 0, 0, 1, 1,
-0.0449932, -0.309143, -3.771708, 0, 0, 0, 1, 1,
-0.0424076, 0.3640095, -0.3216015, 0, 0, 0, 1, 1,
-0.03887454, -1.888337, -2.380826, 1, 1, 1, 1, 1,
-0.03246818, -1.436275, -4.533256, 1, 1, 1, 1, 1,
-0.03220353, -1.490578, -2.58762, 1, 1, 1, 1, 1,
-0.03029819, -0.4708667, -3.090809, 1, 1, 1, 1, 1,
-0.03008776, 0.156949, 1.426556, 1, 1, 1, 1, 1,
-0.02690491, -0.6099861, -3.472767, 1, 1, 1, 1, 1,
-0.02537397, -0.03687651, -1.465027, 1, 1, 1, 1, 1,
-0.02442831, -0.774545, -2.199606, 1, 1, 1, 1, 1,
-0.02184928, -0.02091122, -2.243678, 1, 1, 1, 1, 1,
-0.01687655, 1.46312, -0.02181997, 1, 1, 1, 1, 1,
-0.01655158, -0.8310823, -2.892866, 1, 1, 1, 1, 1,
-0.01351989, 1.323299, 1.021094, 1, 1, 1, 1, 1,
-0.01175045, -0.7003059, -2.47644, 1, 1, 1, 1, 1,
-0.01009562, -0.2083335, -3.360354, 1, 1, 1, 1, 1,
-0.01000961, -0.2824239, -2.88489, 1, 1, 1, 1, 1,
-0.009935849, 0.8735046, -0.7948958, 0, 0, 1, 1, 1,
-0.009526555, 0.02773583, -1.449497, 1, 0, 0, 1, 1,
-0.007734993, 0.8555527, -0.05165042, 1, 0, 0, 1, 1,
-0.007469681, -2.272855, -2.58312, 1, 0, 0, 1, 1,
-0.005783134, -0.8162423, -2.589019, 1, 0, 0, 1, 1,
-0.00312281, 0.005519993, -0.3690929, 1, 0, 0, 1, 1,
-0.001246168, -2.761531, -3.741635, 0, 0, 0, 1, 1,
-9.258763e-05, 1.700579, -1.265651, 0, 0, 0, 1, 1,
0.001648979, -1.131923, 4.005158, 0, 0, 0, 1, 1,
0.002538166, 0.5122713, -1.125269, 0, 0, 0, 1, 1,
0.004019284, 0.2547652, -0.4145765, 0, 0, 0, 1, 1,
0.01134423, 0.8480813, -0.08406067, 0, 0, 0, 1, 1,
0.01172908, 0.4618922, 1.149191, 0, 0, 0, 1, 1,
0.0133439, 0.3588208, -1.432747, 1, 1, 1, 1, 1,
0.01530658, 1.626453, -1.691097, 1, 1, 1, 1, 1,
0.01583565, 0.001978255, 3.496478, 1, 1, 1, 1, 1,
0.0160646, 0.2848723, 0.3789481, 1, 1, 1, 1, 1,
0.0209764, -0.5607492, 2.681209, 1, 1, 1, 1, 1,
0.02199614, 0.07917944, 0.2807084, 1, 1, 1, 1, 1,
0.02434501, 0.1648082, 0.5344042, 1, 1, 1, 1, 1,
0.02575067, 0.1634007, -0.9754422, 1, 1, 1, 1, 1,
0.02963226, 1.312312, 1.405909, 1, 1, 1, 1, 1,
0.03075138, 0.5231738, -1.833066, 1, 1, 1, 1, 1,
0.03303329, 0.2862049, 1.780487, 1, 1, 1, 1, 1,
0.03452592, 1.02222, -0.4128022, 1, 1, 1, 1, 1,
0.03883637, -0.3955081, 3.404997, 1, 1, 1, 1, 1,
0.03957165, -1.813907, 3.807009, 1, 1, 1, 1, 1,
0.04151116, -0.8698298, 4.548747, 1, 1, 1, 1, 1,
0.04370508, -1.811235, 1.681839, 0, 0, 1, 1, 1,
0.04588983, 0.2373688, 0.8164433, 1, 0, 0, 1, 1,
0.04711504, -1.179515, 4.247995, 1, 0, 0, 1, 1,
0.05021845, 0.967651, 1.216438, 1, 0, 0, 1, 1,
0.05905336, 0.01711794, 0.9064598, 1, 0, 0, 1, 1,
0.0594833, 1.085993, 1.298355, 1, 0, 0, 1, 1,
0.05986988, 0.5785645, 0.3926448, 0, 0, 0, 1, 1,
0.06132362, 0.5945926, 0.202228, 0, 0, 0, 1, 1,
0.06574766, 0.16607, 0.07259137, 0, 0, 0, 1, 1,
0.06849565, 0.455249, 0.4880093, 0, 0, 0, 1, 1,
0.07122592, 1.314034, 0.1913967, 0, 0, 0, 1, 1,
0.07155012, 0.2056422, 1.492318, 0, 0, 0, 1, 1,
0.07580661, 0.06764923, 1.176819, 0, 0, 0, 1, 1,
0.08176859, 1.495113, 1.181528, 1, 1, 1, 1, 1,
0.09331669, -1.034079, 2.064429, 1, 1, 1, 1, 1,
0.1032325, -1.480214, 4.734578, 1, 1, 1, 1, 1,
0.104807, -0.8309671, 3.864703, 1, 1, 1, 1, 1,
0.1071382, 0.2736796, -0.5599205, 1, 1, 1, 1, 1,
0.1072708, -0.9177195, 2.89227, 1, 1, 1, 1, 1,
0.1092202, -0.3548415, 3.835318, 1, 1, 1, 1, 1,
0.1121836, -0.4580342, 3.116064, 1, 1, 1, 1, 1,
0.1156235, 1.211939, -2.044335, 1, 1, 1, 1, 1,
0.1163807, 1.470018, 0.1004671, 1, 1, 1, 1, 1,
0.1196773, 0.501482, -0.8874684, 1, 1, 1, 1, 1,
0.1233617, -1.059472, 2.014709, 1, 1, 1, 1, 1,
0.125847, -2.412067, 2.119165, 1, 1, 1, 1, 1,
0.128713, 1.189457, -2.175536, 1, 1, 1, 1, 1,
0.1304157, -0.09743454, 1.596303, 1, 1, 1, 1, 1,
0.1324227, -0.04616371, 2.71898, 0, 0, 1, 1, 1,
0.133574, 0.3383913, 0.5094463, 1, 0, 0, 1, 1,
0.1350611, -0.2055488, 4.453708, 1, 0, 0, 1, 1,
0.1430997, 2.148799, -0.4251052, 1, 0, 0, 1, 1,
0.1443021, -1.143288, 4.458025, 1, 0, 0, 1, 1,
0.1455428, -1.130015, 5.303411, 1, 0, 0, 1, 1,
0.1500944, -0.01171821, 0.3148772, 0, 0, 0, 1, 1,
0.1521023, 1.584884, 0.7657492, 0, 0, 0, 1, 1,
0.1532961, 0.2355471, 0.4672586, 0, 0, 0, 1, 1,
0.1533587, -0.7570661, 4.21298, 0, 0, 0, 1, 1,
0.1580404, 0.5902308, 0.1069311, 0, 0, 0, 1, 1,
0.1645374, 0.1121148, 0.4242148, 0, 0, 0, 1, 1,
0.1646451, -0.334408, 3.351779, 0, 0, 0, 1, 1,
0.1665042, -1.451822, 3.789585, 1, 1, 1, 1, 1,
0.1672502, 0.3477781, -0.7253428, 1, 1, 1, 1, 1,
0.1703157, -1.544951, 2.154491, 1, 1, 1, 1, 1,
0.1706693, 0.03997953, 1.753529, 1, 1, 1, 1, 1,
0.1717308, -1.089708, 4.058438, 1, 1, 1, 1, 1,
0.1747988, -1.819466, 1.873633, 1, 1, 1, 1, 1,
0.177048, -0.4475993, 2.228987, 1, 1, 1, 1, 1,
0.180896, 0.3083341, 0.9852408, 1, 1, 1, 1, 1,
0.1827044, 2.771002, -0.09051956, 1, 1, 1, 1, 1,
0.1832921, -1.415667, 6.262719, 1, 1, 1, 1, 1,
0.1905417, 0.1815051, 2.205853, 1, 1, 1, 1, 1,
0.1942786, -1.062852, 6.028751, 1, 1, 1, 1, 1,
0.1955072, 0.5943854, -0.1038064, 1, 1, 1, 1, 1,
0.1985824, 0.5774483, 0.8403955, 1, 1, 1, 1, 1,
0.1991522, 1.522862, -0.2388662, 1, 1, 1, 1, 1,
0.2008605, -1.505445, 3.194552, 0, 0, 1, 1, 1,
0.2066079, -0.06966498, 0.1901096, 1, 0, 0, 1, 1,
0.2095629, -0.2129111, 1.529515, 1, 0, 0, 1, 1,
0.2120245, -0.9000153, 4.132166, 1, 0, 0, 1, 1,
0.2141506, -2.056437, 4.37718, 1, 0, 0, 1, 1,
0.2188302, 1.706756, 0.5164701, 1, 0, 0, 1, 1,
0.2194583, 0.01841498, 1.165535, 0, 0, 0, 1, 1,
0.2255999, -0.850782, 3.669708, 0, 0, 0, 1, 1,
0.2277278, 0.7279877, 1.197866, 0, 0, 0, 1, 1,
0.2323138, -0.4047665, 2.596928, 0, 0, 0, 1, 1,
0.2332158, -0.8531165, 5.015879, 0, 0, 0, 1, 1,
0.2334872, -0.4036467, 2.758295, 0, 0, 0, 1, 1,
0.2338612, -0.04729046, 3.535108, 0, 0, 0, 1, 1,
0.2352746, 0.6253033, 0.8472747, 1, 1, 1, 1, 1,
0.2390945, 0.7053682, 0.06174767, 1, 1, 1, 1, 1,
0.2411762, 2.832984, -0.2174692, 1, 1, 1, 1, 1,
0.2416686, -1.283843, 2.877159, 1, 1, 1, 1, 1,
0.2430488, 0.6264415, 1.088399, 1, 1, 1, 1, 1,
0.2436349, -0.6180151, 2.581302, 1, 1, 1, 1, 1,
0.2463844, 0.01945981, 2.463324, 1, 1, 1, 1, 1,
0.2469585, 0.06952602, 3.523355, 1, 1, 1, 1, 1,
0.2520296, -0.02476757, 3.089901, 1, 1, 1, 1, 1,
0.2524581, -0.6669269, 2.249543, 1, 1, 1, 1, 1,
0.2540978, -0.439205, 4.296445, 1, 1, 1, 1, 1,
0.2560864, -2.475749, 2.068095, 1, 1, 1, 1, 1,
0.2579954, -0.1348864, 1.010577, 1, 1, 1, 1, 1,
0.2581003, -2.010421, 3.064626, 1, 1, 1, 1, 1,
0.2607578, 0.4714577, -2.13864, 1, 1, 1, 1, 1,
0.2608445, -0.491775, 3.135243, 0, 0, 1, 1, 1,
0.2647835, 1.027794, 1.35459, 1, 0, 0, 1, 1,
0.2684463, 0.8746882, 0.167929, 1, 0, 0, 1, 1,
0.2687819, 0.5057468, 2.743987, 1, 0, 0, 1, 1,
0.2736051, -1.109247, 4.438829, 1, 0, 0, 1, 1,
0.2782057, -0.002244082, -0.2033067, 1, 0, 0, 1, 1,
0.2835198, 0.602766, 1.822637, 0, 0, 0, 1, 1,
0.2866398, -0.9124681, 2.657306, 0, 0, 0, 1, 1,
0.2868343, -1.131766, 1.894369, 0, 0, 0, 1, 1,
0.2869461, 0.2981514, -0.5026259, 0, 0, 0, 1, 1,
0.292737, 0.4382406, 0.004791131, 0, 0, 0, 1, 1,
0.2934715, 1.433681, -0.2756702, 0, 0, 0, 1, 1,
0.2946263, -1.126785, 2.613674, 0, 0, 0, 1, 1,
0.2952251, -0.3053639, 1.8739, 1, 1, 1, 1, 1,
0.3002034, -1.171156, 2.13841, 1, 1, 1, 1, 1,
0.3006682, -0.365333, 1.819611, 1, 1, 1, 1, 1,
0.3068239, 0.09544577, 1.907726, 1, 1, 1, 1, 1,
0.3073756, -2.049432, 3.717634, 1, 1, 1, 1, 1,
0.3102817, 0.9629938, 0.8030112, 1, 1, 1, 1, 1,
0.3110329, -1.469355, 3.894856, 1, 1, 1, 1, 1,
0.3116229, 0.2458353, -0.2143168, 1, 1, 1, 1, 1,
0.314458, 0.1708682, 0.2939107, 1, 1, 1, 1, 1,
0.3149422, 0.419461, 2.710344, 1, 1, 1, 1, 1,
0.3150316, -1.274904, 1.78693, 1, 1, 1, 1, 1,
0.3161036, -0.01172483, 1.725782, 1, 1, 1, 1, 1,
0.3162824, -0.9598714, 3.449691, 1, 1, 1, 1, 1,
0.3175704, 0.9994238, -1.7212, 1, 1, 1, 1, 1,
0.3206063, -1.323447, 3.275345, 1, 1, 1, 1, 1,
0.3210253, -0.2406298, 2.210531, 0, 0, 1, 1, 1,
0.3219468, -0.1520753, 0.749013, 1, 0, 0, 1, 1,
0.3240739, -0.423124, 3.052427, 1, 0, 0, 1, 1,
0.3253881, 0.1115611, 1.728627, 1, 0, 0, 1, 1,
0.3297939, 0.7879893, 0.3926279, 1, 0, 0, 1, 1,
0.3317067, -0.3688321, 2.131775, 1, 0, 0, 1, 1,
0.3338041, -0.1985846, 2.007505, 0, 0, 0, 1, 1,
0.3365718, -0.4290126, 2.267659, 0, 0, 0, 1, 1,
0.3372645, -1.105442, 2.038067, 0, 0, 0, 1, 1,
0.3410757, -0.4669833, 3.612098, 0, 0, 0, 1, 1,
0.3426269, 1.415546, -0.8687982, 0, 0, 0, 1, 1,
0.348256, 0.3538141, -0.3188443, 0, 0, 0, 1, 1,
0.3495258, 1.069952, 2.633784, 0, 0, 0, 1, 1,
0.3512788, -1.469803, 2.85127, 1, 1, 1, 1, 1,
0.35503, 0.1866377, 0.9479058, 1, 1, 1, 1, 1,
0.356047, 1.866254, -0.1434071, 1, 1, 1, 1, 1,
0.3577546, 0.09519568, 0.3498689, 1, 1, 1, 1, 1,
0.358502, 0.673062, 0.6265321, 1, 1, 1, 1, 1,
0.3589584, 1.323818, 1.529921, 1, 1, 1, 1, 1,
0.3635835, 1.329265, 0.2842842, 1, 1, 1, 1, 1,
0.3653178, -2.060237, 3.436819, 1, 1, 1, 1, 1,
0.3805119, 1.301988, 0.5384418, 1, 1, 1, 1, 1,
0.3848144, 0.995656, -0.4488401, 1, 1, 1, 1, 1,
0.3952058, 0.5325083, -0.4403856, 1, 1, 1, 1, 1,
0.3952218, 0.483612, 0.4458112, 1, 1, 1, 1, 1,
0.3956441, -1.127329, 3.444714, 1, 1, 1, 1, 1,
0.4073544, -0.8804513, 4.584626, 1, 1, 1, 1, 1,
0.4078141, 0.4563088, -0.2381822, 1, 1, 1, 1, 1,
0.4090532, -0.1044756, -0.008424484, 0, 0, 1, 1, 1,
0.4098308, -1.15398, 2.741065, 1, 0, 0, 1, 1,
0.412805, 1.988195, 0.8843113, 1, 0, 0, 1, 1,
0.4156321, 0.1334684, 0.9361022, 1, 0, 0, 1, 1,
0.4160922, -0.6563652, 0.8500335, 1, 0, 0, 1, 1,
0.4161995, -1.353687, 2.031964, 1, 0, 0, 1, 1,
0.4319681, -0.3085997, 2.882375, 0, 0, 0, 1, 1,
0.4330951, -2.307837, 3.552356, 0, 0, 0, 1, 1,
0.4387043, -1.320378, 1.851673, 0, 0, 0, 1, 1,
0.4391632, -0.6854146, 3.712929, 0, 0, 0, 1, 1,
0.4441122, -1.490046, 4.314502, 0, 0, 0, 1, 1,
0.4448444, 0.9564657, 0.8853738, 0, 0, 0, 1, 1,
0.4523072, -2.132566, 2.845244, 0, 0, 0, 1, 1,
0.4608664, 0.9537211, 0.1730616, 1, 1, 1, 1, 1,
0.4617981, -1.226307, 3.165197, 1, 1, 1, 1, 1,
0.4620855, -0.6764885, 4.698658, 1, 1, 1, 1, 1,
0.462589, 0.2918549, 0.621045, 1, 1, 1, 1, 1,
0.465817, 0.02240922, 2.709376, 1, 1, 1, 1, 1,
0.4658259, 1.080883, 0.1069814, 1, 1, 1, 1, 1,
0.4660101, -1.888641, 4.028956, 1, 1, 1, 1, 1,
0.4660198, -0.5435382, 2.6567, 1, 1, 1, 1, 1,
0.4663841, -0.4358692, 2.687632, 1, 1, 1, 1, 1,
0.4685178, 2.001578, 1.406751, 1, 1, 1, 1, 1,
0.4690285, 0.2935653, 0.4120224, 1, 1, 1, 1, 1,
0.4705721, 0.5750419, 0.7158937, 1, 1, 1, 1, 1,
0.4767643, 1.923357, 0.3109037, 1, 1, 1, 1, 1,
0.4817793, 0.08856562, 0.243994, 1, 1, 1, 1, 1,
0.4844811, -0.948662, 2.07545, 1, 1, 1, 1, 1,
0.498237, -0.2253868, 2.823922, 0, 0, 1, 1, 1,
0.4997023, 0.5008177, -0.8675752, 1, 0, 0, 1, 1,
0.5032839, -0.2164461, -0.7482712, 1, 0, 0, 1, 1,
0.5142047, 0.04313084, 1.455355, 1, 0, 0, 1, 1,
0.5208591, -0.1265157, 2.277748, 1, 0, 0, 1, 1,
0.5231992, -0.5031585, 1.612228, 1, 0, 0, 1, 1,
0.5247407, -0.294108, 2.071361, 0, 0, 0, 1, 1,
0.5249031, -0.03964531, 1.428381, 0, 0, 0, 1, 1,
0.5297685, -0.7113522, 1.065699, 0, 0, 0, 1, 1,
0.5298045, 1.09739, 0.2377377, 0, 0, 0, 1, 1,
0.5336946, -1.75966, 3.387079, 0, 0, 0, 1, 1,
0.5388991, -0.4722995, 3.283967, 0, 0, 0, 1, 1,
0.5397316, 0.3672022, 0.8995498, 0, 0, 0, 1, 1,
0.5408317, 0.9227371, -0.7427518, 1, 1, 1, 1, 1,
0.5455317, 0.6698555, 0.05866491, 1, 1, 1, 1, 1,
0.5474235, 1.332431, -1.151721, 1, 1, 1, 1, 1,
0.5481492, 0.3321108, 1.403569, 1, 1, 1, 1, 1,
0.5517537, 0.9396527, 1.295305, 1, 1, 1, 1, 1,
0.5536855, -0.912284, 4.293192, 1, 1, 1, 1, 1,
0.5549807, 1.031491, 0.6090361, 1, 1, 1, 1, 1,
0.5560973, -0.6942884, 0.2839152, 1, 1, 1, 1, 1,
0.5621042, -0.5961868, 2.681765, 1, 1, 1, 1, 1,
0.5638885, -0.228037, 2.061477, 1, 1, 1, 1, 1,
0.5643942, -0.6411174, 2.211492, 1, 1, 1, 1, 1,
0.5655362, 0.1128341, 1.256759, 1, 1, 1, 1, 1,
0.5663675, 0.8970296, -0.5078952, 1, 1, 1, 1, 1,
0.5738338, 1.253804, 1.230258, 1, 1, 1, 1, 1,
0.5755292, 0.1517597, 0.3401251, 1, 1, 1, 1, 1,
0.5769589, 0.7587871, 1.800571, 0, 0, 1, 1, 1,
0.5774935, 1.09144, -0.9167689, 1, 0, 0, 1, 1,
0.5799505, -1.19086, 2.50591, 1, 0, 0, 1, 1,
0.5825886, -1.0137, 3.453612, 1, 0, 0, 1, 1,
0.5880238, -0.8291811, 3.416114, 1, 0, 0, 1, 1,
0.5894207, -1.317842, 2.996125, 1, 0, 0, 1, 1,
0.590902, -1.505518, 5.616285, 0, 0, 0, 1, 1,
0.5914783, 2.077864, 1.070073, 0, 0, 0, 1, 1,
0.5933912, 1.073298, 0.338239, 0, 0, 0, 1, 1,
0.6076037, -0.7384038, 3.907739, 0, 0, 0, 1, 1,
0.6094465, -0.8821937, 1.935242, 0, 0, 0, 1, 1,
0.6152545, -0.39946, 2.590962, 0, 0, 0, 1, 1,
0.6189823, -2.433271, 2.888812, 0, 0, 0, 1, 1,
0.6251692, -0.2036581, 1.343128, 1, 1, 1, 1, 1,
0.6259527, -0.7420326, 3.168572, 1, 1, 1, 1, 1,
0.6261023, -0.6214058, 2.613601, 1, 1, 1, 1, 1,
0.6285344, 1.240772, -0.1778843, 1, 1, 1, 1, 1,
0.6289221, 1.164016, 1.777575, 1, 1, 1, 1, 1,
0.6351607, 0.1281068, 2.327469, 1, 1, 1, 1, 1,
0.6358374, -2.627054, 1.767085, 1, 1, 1, 1, 1,
0.6384844, 0.6443247, 1.295841, 1, 1, 1, 1, 1,
0.6403187, -0.2859664, 1.650002, 1, 1, 1, 1, 1,
0.6451003, 2.819009, -0.2158436, 1, 1, 1, 1, 1,
0.6463455, -2.736161, 1.852046, 1, 1, 1, 1, 1,
0.6464731, -0.8690493, 1.659819, 1, 1, 1, 1, 1,
0.6537406, 0.5197759, 1.93509, 1, 1, 1, 1, 1,
0.6573378, 2.314627, 0.9101607, 1, 1, 1, 1, 1,
0.6585156, 0.1995538, 0.9799312, 1, 1, 1, 1, 1,
0.6603827, 1.18403, -0.8268378, 0, 0, 1, 1, 1,
0.6628964, -1.108418, 2.211634, 1, 0, 0, 1, 1,
0.6670489, -1.709499, 3.533012, 1, 0, 0, 1, 1,
0.6707708, 0.6016012, -0.3336152, 1, 0, 0, 1, 1,
0.6710805, -1.356109, 2.865531, 1, 0, 0, 1, 1,
0.6792772, -0.8323834, 1.411222, 1, 0, 0, 1, 1,
0.6851817, 0.3521048, 1.808476, 0, 0, 0, 1, 1,
0.6864365, -0.2739202, 1.697675, 0, 0, 0, 1, 1,
0.6900644, 2.157639, 0.8441917, 0, 0, 0, 1, 1,
0.6909051, 1.363086, 1.210769, 0, 0, 0, 1, 1,
0.6949442, -0.7965825, 3.87517, 0, 0, 0, 1, 1,
0.6966186, 0.5671281, 2.030131, 0, 0, 0, 1, 1,
0.7044385, 1.559354, -0.5763673, 0, 0, 0, 1, 1,
0.7047956, -0.4633173, 2.511506, 1, 1, 1, 1, 1,
0.7069278, -0.3365196, 0.7319096, 1, 1, 1, 1, 1,
0.711592, -1.052408, 1.769369, 1, 1, 1, 1, 1,
0.7126479, 0.2283508, 1.383812, 1, 1, 1, 1, 1,
0.713697, -0.6209985, 2.585674, 1, 1, 1, 1, 1,
0.7153801, -1.18464, 2.02752, 1, 1, 1, 1, 1,
0.7188277, 0.09607733, 0.3575642, 1, 1, 1, 1, 1,
0.7206616, -0.001286595, 1.620882, 1, 1, 1, 1, 1,
0.7215812, 1.443878, 0.1780611, 1, 1, 1, 1, 1,
0.7232689, -0.1789628, 3.016909, 1, 1, 1, 1, 1,
0.733444, 0.3182582, -0.2526607, 1, 1, 1, 1, 1,
0.7382491, 0.7106671, 1.348706, 1, 1, 1, 1, 1,
0.740257, -0.8260102, 2.397393, 1, 1, 1, 1, 1,
0.7435864, 0.2621432, 2.452414, 1, 1, 1, 1, 1,
0.7437796, 1.596217, -0.7989931, 1, 1, 1, 1, 1,
0.7451406, 1.550214, 1.042866, 0, 0, 1, 1, 1,
0.7456241, -1.057907, 1.65411, 1, 0, 0, 1, 1,
0.7581393, 1.678385, -0.7030004, 1, 0, 0, 1, 1,
0.7583401, -0.7137956, 2.994365, 1, 0, 0, 1, 1,
0.759465, -0.4505925, 1.265149, 1, 0, 0, 1, 1,
0.7610639, 0.4834054, -0.1598882, 1, 0, 0, 1, 1,
0.7636522, -0.1062597, 2.100642, 0, 0, 0, 1, 1,
0.7649082, -0.2684724, 2.009127, 0, 0, 0, 1, 1,
0.7697035, -0.4107052, 1.848459, 0, 0, 0, 1, 1,
0.770723, -1.334221, 2.425798, 0, 0, 0, 1, 1,
0.7740777, 0.3092688, -0.6491443, 0, 0, 0, 1, 1,
0.7751439, -0.7853466, 1.898335, 0, 0, 0, 1, 1,
0.7803307, 1.264818, 1.155398, 0, 0, 0, 1, 1,
0.7818691, 0.04204853, 2.097386, 1, 1, 1, 1, 1,
0.7834129, 0.4374876, 1.948331, 1, 1, 1, 1, 1,
0.7921484, -1.063103, 2.627176, 1, 1, 1, 1, 1,
0.8015125, -1.088039, 2.875679, 1, 1, 1, 1, 1,
0.8049862, 1.80599, 1.831548, 1, 1, 1, 1, 1,
0.8056751, 2.530358, 0.2777384, 1, 1, 1, 1, 1,
0.8085378, 0.2797036, 1.703242, 1, 1, 1, 1, 1,
0.8110867, -1.195148, 1.060948, 1, 1, 1, 1, 1,
0.8125398, -0.02156765, -0.4941104, 1, 1, 1, 1, 1,
0.814378, 2.513916, 1.227219, 1, 1, 1, 1, 1,
0.8149563, 0.6463553, 1.43125, 1, 1, 1, 1, 1,
0.8185587, -0.1661386, 1.281877, 1, 1, 1, 1, 1,
0.8232896, 1.147202, -0.8748974, 1, 1, 1, 1, 1,
0.8345127, 1.048793, 0.1114877, 1, 1, 1, 1, 1,
0.8346058, -0.6555564, 1.408283, 1, 1, 1, 1, 1,
0.8382638, 0.7972367, -0.01933855, 0, 0, 1, 1, 1,
0.8427935, -0.4080082, 3.341091, 1, 0, 0, 1, 1,
0.8469418, 1.257573, 0.6850877, 1, 0, 0, 1, 1,
0.8507437, -1.222674, 1.972732, 1, 0, 0, 1, 1,
0.8508013, -0.9490596, 1.384537, 1, 0, 0, 1, 1,
0.8518446, 0.6117509, 1.739277, 1, 0, 0, 1, 1,
0.8549162, 1.963964, 2.06813, 0, 0, 0, 1, 1,
0.8587604, 0.9312902, -0.8748008, 0, 0, 0, 1, 1,
0.8666333, 0.9246605, 0.894455, 0, 0, 0, 1, 1,
0.8811969, 0.9068722, -1.200459, 0, 0, 0, 1, 1,
0.8911833, 0.004593144, 1.735358, 0, 0, 0, 1, 1,
0.8921615, 0.1446006, 1.190958, 0, 0, 0, 1, 1,
0.8961046, 0.8775346, 2.230045, 0, 0, 0, 1, 1,
0.8963602, -0.8906653, 2.126904, 1, 1, 1, 1, 1,
0.9348182, -1.411997, 3.258903, 1, 1, 1, 1, 1,
0.9417534, 0.1170414, 2.830942, 1, 1, 1, 1, 1,
0.9428432, 0.4488971, 0.1047632, 1, 1, 1, 1, 1,
0.9429561, -1.238278, 2.331381, 1, 1, 1, 1, 1,
0.9472978, 0.9975596, 1.630932, 1, 1, 1, 1, 1,
0.9481109, 0.1601793, 2.773968, 1, 1, 1, 1, 1,
0.9500707, -1.350776, 2.38352, 1, 1, 1, 1, 1,
0.9536319, -0.4825017, 2.384763, 1, 1, 1, 1, 1,
0.9569082, -1.226551, 1.985901, 1, 1, 1, 1, 1,
0.9601287, -0.9729335, 1.902486, 1, 1, 1, 1, 1,
0.9714209, -1.320554, 3.363074, 1, 1, 1, 1, 1,
0.9761007, 0.327112, 0.7413903, 1, 1, 1, 1, 1,
0.9781868, -0.7826909, 1.222641, 1, 1, 1, 1, 1,
0.9782606, 0.3627984, -0.6359584, 1, 1, 1, 1, 1,
0.9794517, 0.6902763, -0.9475835, 0, 0, 1, 1, 1,
0.9836528, -0.447936, 3.985632, 1, 0, 0, 1, 1,
0.988681, 0.1654367, 0.7890984, 1, 0, 0, 1, 1,
0.9924229, 1.448478, 0.8170615, 1, 0, 0, 1, 1,
1.010316, -1.655509, 1.852491, 1, 0, 0, 1, 1,
1.013022, -0.3695841, 0.8881282, 1, 0, 0, 1, 1,
1.020203, 1.178833, 0.5507942, 0, 0, 0, 1, 1,
1.02868, 0.7853864, 2.260118, 0, 0, 0, 1, 1,
1.031303, 1.52731, 0.6850379, 0, 0, 0, 1, 1,
1.032802, -0.3685308, 1.313884, 0, 0, 0, 1, 1,
1.03345, -0.4841251, 3.779022, 0, 0, 0, 1, 1,
1.043232, -0.02456947, 0.8431309, 0, 0, 0, 1, 1,
1.061112, 0.5182561, 0.7868894, 0, 0, 0, 1, 1,
1.073325, -0.8233987, 0.9859617, 1, 1, 1, 1, 1,
1.075928, -1.676637, 0.5989074, 1, 1, 1, 1, 1,
1.088546, -0.94438, 2.37519, 1, 1, 1, 1, 1,
1.091899, -0.2526511, 1.158683, 1, 1, 1, 1, 1,
1.093005, -1.480819, 1.735204, 1, 1, 1, 1, 1,
1.094622, -1.321458, 0.5465285, 1, 1, 1, 1, 1,
1.104041, -0.959549, 2.785802, 1, 1, 1, 1, 1,
1.111772, 1.494736, 1.63334, 1, 1, 1, 1, 1,
1.114311, -0.02081175, 0.678373, 1, 1, 1, 1, 1,
1.118907, 0.4851468, 1.361085, 1, 1, 1, 1, 1,
1.119569, 0.1582932, 2.489934, 1, 1, 1, 1, 1,
1.140432, -0.3363628, 1.761359, 1, 1, 1, 1, 1,
1.145454, -0.3957004, 1.872694, 1, 1, 1, 1, 1,
1.150001, 1.017581, 0.6372449, 1, 1, 1, 1, 1,
1.161632, 1.976481, 0.08392059, 1, 1, 1, 1, 1,
1.176584, -0.832917, 3.241962, 0, 0, 1, 1, 1,
1.188969, -0.6105192, 2.486241, 1, 0, 0, 1, 1,
1.203875, -1.052236, 3.468625, 1, 0, 0, 1, 1,
1.21734, -0.1323568, 1.942872, 1, 0, 0, 1, 1,
1.22515, -1.55679, 2.231609, 1, 0, 0, 1, 1,
1.232833, -0.9436579, 2.474183, 1, 0, 0, 1, 1,
1.233258, -0.04843521, 3.746029, 0, 0, 0, 1, 1,
1.241771, -1.759651, 1.872004, 0, 0, 0, 1, 1,
1.251768, -0.4972527, 0.5501584, 0, 0, 0, 1, 1,
1.258227, -1.336077, 1.3151, 0, 0, 0, 1, 1,
1.264744, 1.139876, 0.6358225, 0, 0, 0, 1, 1,
1.270312, 0.5487372, 1.414341, 0, 0, 0, 1, 1,
1.278885, 0.5679931, 2.671097, 0, 0, 0, 1, 1,
1.279872, 0.6443321, 1.455311, 1, 1, 1, 1, 1,
1.282503, -0.7818573, 3.424283, 1, 1, 1, 1, 1,
1.282946, 1.326593, 1.526176, 1, 1, 1, 1, 1,
1.283677, 1.294855, -0.8654231, 1, 1, 1, 1, 1,
1.284927, 1.201994, 0.7183458, 1, 1, 1, 1, 1,
1.286065, 1.035611, 1.008532, 1, 1, 1, 1, 1,
1.288849, 0.6926202, 1.674161, 1, 1, 1, 1, 1,
1.295366, -0.5311691, 1.459961, 1, 1, 1, 1, 1,
1.296325, -0.312014, 2.897644, 1, 1, 1, 1, 1,
1.296573, 1.789373, 0.4239263, 1, 1, 1, 1, 1,
1.297913, -1.07102, 1.628677, 1, 1, 1, 1, 1,
1.310316, 0.7644022, 0.2062287, 1, 1, 1, 1, 1,
1.311845, 1.524242, -0.6135271, 1, 1, 1, 1, 1,
1.31943, 0.6925165, 1.896292, 1, 1, 1, 1, 1,
1.332703, -0.03262408, 2.022415, 1, 1, 1, 1, 1,
1.348443, 0.05960877, -0.08350631, 0, 0, 1, 1, 1,
1.34895, -0.4839251, 1.189703, 1, 0, 0, 1, 1,
1.352497, 0.03533563, -0.2380536, 1, 0, 0, 1, 1,
1.35557, -0.0763381, -0.03925707, 1, 0, 0, 1, 1,
1.356004, -0.4827774, 1.44198, 1, 0, 0, 1, 1,
1.360592, 0.745656, 1.841452, 1, 0, 0, 1, 1,
1.361655, 0.1447503, 1.814723, 0, 0, 0, 1, 1,
1.363769, 1.089169, 1.203874, 0, 0, 0, 1, 1,
1.363793, -1.215555, 1.875245, 0, 0, 0, 1, 1,
1.365048, -0.6558591, 0.0461362, 0, 0, 0, 1, 1,
1.369938, -0.8370119, 3.267982, 0, 0, 0, 1, 1,
1.373153, 0.9757274, 1.982681, 0, 0, 0, 1, 1,
1.373764, 0.1535377, 1.985417, 0, 0, 0, 1, 1,
1.384557, 0.4781217, -0.2328979, 1, 1, 1, 1, 1,
1.391374, -0.8356889, 1.190811, 1, 1, 1, 1, 1,
1.391408, -1.251684, 1.686135, 1, 1, 1, 1, 1,
1.3953, -0.2754117, 1.580697, 1, 1, 1, 1, 1,
1.397545, 0.5953211, 1.389456, 1, 1, 1, 1, 1,
1.39832, 1.215615, 1.603115, 1, 1, 1, 1, 1,
1.402629, 2.608018, 0.9607382, 1, 1, 1, 1, 1,
1.407002, 0.03158714, 1.344723, 1, 1, 1, 1, 1,
1.41784, 0.0287299, 0.9497173, 1, 1, 1, 1, 1,
1.421019, 1.318359, 0.4979895, 1, 1, 1, 1, 1,
1.421514, -0.0905946, 2.940524, 1, 1, 1, 1, 1,
1.423063, -0.3419256, 2.560269, 1, 1, 1, 1, 1,
1.435544, -0.9467824, 2.940662, 1, 1, 1, 1, 1,
1.437575, 1.656339, 0.6538647, 1, 1, 1, 1, 1,
1.442776, -0.3258294, 1.318869, 1, 1, 1, 1, 1,
1.446152, -1.224333, 3.084771, 0, 0, 1, 1, 1,
1.446601, -0.8660882, 1.929131, 1, 0, 0, 1, 1,
1.462804, -0.891273, 1.066842, 1, 0, 0, 1, 1,
1.471132, -1.129344, 2.11584, 1, 0, 0, 1, 1,
1.477754, -0.6404468, 0.7859316, 1, 0, 0, 1, 1,
1.486194, 0.2762696, 0.133507, 1, 0, 0, 1, 1,
1.490589, -0.3965028, 1.780966, 0, 0, 0, 1, 1,
1.492408, 0.7871822, 2.086016, 0, 0, 0, 1, 1,
1.518955, -0.1500067, 2.843588, 0, 0, 0, 1, 1,
1.521986, 0.4090707, 1.077209, 0, 0, 0, 1, 1,
1.524046, 2.805275, 1.631413, 0, 0, 0, 1, 1,
1.526584, -1.836067, 1.309014, 0, 0, 0, 1, 1,
1.537333, -0.7309471, 0.7962869, 0, 0, 0, 1, 1,
1.539465, 1.410896, 1.322186, 1, 1, 1, 1, 1,
1.553979, 1.594813, 0.08997741, 1, 1, 1, 1, 1,
1.56337, 0.5796356, 0.009775392, 1, 1, 1, 1, 1,
1.56982, 0.9956288, 2.025815, 1, 1, 1, 1, 1,
1.570508, -0.03908461, 2.409338, 1, 1, 1, 1, 1,
1.581921, -0.3963876, 0.8554153, 1, 1, 1, 1, 1,
1.599578, 0.7235321, 3.343278, 1, 1, 1, 1, 1,
1.607683, -2.486508, 1.980529, 1, 1, 1, 1, 1,
1.616918, 1.163235, 1.44241, 1, 1, 1, 1, 1,
1.625689, 0.9618575, 2.53116, 1, 1, 1, 1, 1,
1.639478, 1.766767, 0.4459355, 1, 1, 1, 1, 1,
1.639913, -1.5822, 2.625033, 1, 1, 1, 1, 1,
1.644119, -0.2232834, 0.8302439, 1, 1, 1, 1, 1,
1.65454, -0.4949419, 1.997344, 1, 1, 1, 1, 1,
1.665962, -0.0813075, 3.310486, 1, 1, 1, 1, 1,
1.66631, 0.2807986, 2.485667, 0, 0, 1, 1, 1,
1.668717, 2.700872, 0.7584885, 1, 0, 0, 1, 1,
1.673354, -0.1225739, 1.907814, 1, 0, 0, 1, 1,
1.675484, 1.085891, -0.2795267, 1, 0, 0, 1, 1,
1.676465, -0.2046792, 2.627519, 1, 0, 0, 1, 1,
1.684731, 0.8350149, 2.621926, 1, 0, 0, 1, 1,
1.697904, 0.04801558, 2.735016, 0, 0, 0, 1, 1,
1.701237, -0.09000666, 1.302786, 0, 0, 0, 1, 1,
1.703889, -0.1243939, 1.401718, 0, 0, 0, 1, 1,
1.715119, -0.1388744, 2.163729, 0, 0, 0, 1, 1,
1.726977, -3.456302, 2.412574, 0, 0, 0, 1, 1,
1.774641, 0.4316981, -0.06780872, 0, 0, 0, 1, 1,
1.780883, -1.331498, 2.225688, 0, 0, 0, 1, 1,
1.788717, 0.1300003, -0.1777881, 1, 1, 1, 1, 1,
1.819102, -0.4268716, 1.206946, 1, 1, 1, 1, 1,
1.828511, -0.2220926, 1.460873, 1, 1, 1, 1, 1,
1.855727, -0.6239986, 2.388092, 1, 1, 1, 1, 1,
1.867616, 0.0005929534, 1.692836, 1, 1, 1, 1, 1,
1.874784, -0.8971404, 2.794938, 1, 1, 1, 1, 1,
1.881361, 1.455021, 1.069219, 1, 1, 1, 1, 1,
1.905929, 0.1736691, 2.117391, 1, 1, 1, 1, 1,
1.918965, 0.7528175, 1.257707, 1, 1, 1, 1, 1,
1.952869, 0.4459319, 2.407334, 1, 1, 1, 1, 1,
1.961972, -0.09519093, 0.9812093, 1, 1, 1, 1, 1,
1.978785, 1.070737, 1.393207, 1, 1, 1, 1, 1,
1.992961, -0.4636417, 1.629191, 1, 1, 1, 1, 1,
2.003267, -0.7836744, 1.352104, 1, 1, 1, 1, 1,
2.01866, 1.729039, 1.831688, 1, 1, 1, 1, 1,
2.046565, -0.8286304, 1.833594, 0, 0, 1, 1, 1,
2.053611, -0.03805466, 2.014881, 1, 0, 0, 1, 1,
2.056366, 1.973334, 0.1243445, 1, 0, 0, 1, 1,
2.069879, -1.611648, 2.802355, 1, 0, 0, 1, 1,
2.084629, -0.3537062, 2.064689, 1, 0, 0, 1, 1,
2.090897, -0.7157223, 3.13162, 1, 0, 0, 1, 1,
2.109284, -0.2910236, -0.6254475, 0, 0, 0, 1, 1,
2.200471, 0.554157, 0.8650767, 0, 0, 0, 1, 1,
2.242878, -0.7307261, -0.3410818, 0, 0, 0, 1, 1,
2.285391, 0.9045683, 3.033442, 0, 0, 0, 1, 1,
2.320531, 1.656666, 1.027542, 0, 0, 0, 1, 1,
2.348766, 0.761492, -0.4858919, 0, 0, 0, 1, 1,
2.389513, -1.151945, 1.949163, 0, 0, 0, 1, 1,
2.408526, -1.78934, 3.452102, 1, 1, 1, 1, 1,
2.474745, -1.672799, 2.7442, 1, 1, 1, 1, 1,
2.528726, -0.4855955, 1.471616, 1, 1, 1, 1, 1,
2.560162, 1.841199, -0.5244641, 1, 1, 1, 1, 1,
2.732824, -1.104611, 2.822174, 1, 1, 1, 1, 1,
2.82207, 1.018041, 1.622359, 1, 1, 1, 1, 1,
2.86746, 1.819584, 1.963959, 1, 1, 1, 1, 1
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
var radius = 9.722413;
var distance = 34.14956;
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
mvMatrix.translate( 0.1461947, 0.1206093, -0.6891015 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.14956);
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
