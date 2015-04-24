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
-2.633554, 0.6016999, -2.67856, 1, 0, 0, 1,
-2.622804, -0.6945999, -0.6872311, 1, 0.007843138, 0, 1,
-2.5497, -1.462106, -1.130087, 1, 0.01176471, 0, 1,
-2.53811, 0.1531473, -1.332971, 1, 0.01960784, 0, 1,
-2.483486, -0.9926724, -0.4130804, 1, 0.02352941, 0, 1,
-2.449212, 0.5902128, -0.5451142, 1, 0.03137255, 0, 1,
-2.401917, 0.5216497, -1.503909, 1, 0.03529412, 0, 1,
-2.292884, -0.7449235, -0.7827038, 1, 0.04313726, 0, 1,
-2.292282, 0.3868144, -0.1606009, 1, 0.04705882, 0, 1,
-2.258516, -0.2809621, -0.5228047, 1, 0.05490196, 0, 1,
-2.236911, -1.294224, -2.833016, 1, 0.05882353, 0, 1,
-2.223483, -0.1190787, -2.081969, 1, 0.06666667, 0, 1,
-2.176616, -0.02445563, -0.1155856, 1, 0.07058824, 0, 1,
-2.140478, 1.349782, -1.636052, 1, 0.07843138, 0, 1,
-2.101759, -0.09515363, -1.505581, 1, 0.08235294, 0, 1,
-2.089024, 0.0527599, -3.14319, 1, 0.09019608, 0, 1,
-2.082601, -0.7498186, -1.277008, 1, 0.09411765, 0, 1,
-2.054555, 1.753114, -0.4053228, 1, 0.1019608, 0, 1,
-2.041712, 1.05852, -2.052842, 1, 0.1098039, 0, 1,
-2.020489, 0.6908352, -2.003195, 1, 0.1137255, 0, 1,
-2.003682, -0.4510018, 0.1211952, 1, 0.1215686, 0, 1,
-1.971409, -0.3789092, -1.989022, 1, 0.1254902, 0, 1,
-1.942924, -0.9493571, -1.595741, 1, 0.1333333, 0, 1,
-1.917092, 1.164147, -2.417995, 1, 0.1372549, 0, 1,
-1.900154, 0.1519979, -2.816191, 1, 0.145098, 0, 1,
-1.891997, -0.5725133, -2.862168, 1, 0.1490196, 0, 1,
-1.887011, 0.7724841, -0.4013936, 1, 0.1568628, 0, 1,
-1.881228, -0.1273994, -1.305668, 1, 0.1607843, 0, 1,
-1.862678, 0.2464474, -1.441626, 1, 0.1686275, 0, 1,
-1.852325, 0.1402043, -0.7384664, 1, 0.172549, 0, 1,
-1.844012, 0.4424099, -0.4989037, 1, 0.1803922, 0, 1,
-1.84296, 0.9289799, -1.347911, 1, 0.1843137, 0, 1,
-1.826294, -1.284073, -2.165097, 1, 0.1921569, 0, 1,
-1.824464, 0.2517717, -1.903772, 1, 0.1960784, 0, 1,
-1.82164, -1.513728, -2.902659, 1, 0.2039216, 0, 1,
-1.821101, 1.589303, -2.499397, 1, 0.2117647, 0, 1,
-1.817094, 2.927436, -0.8990501, 1, 0.2156863, 0, 1,
-1.806585, -0.2641903, -1.613493, 1, 0.2235294, 0, 1,
-1.800702, 0.4244759, -0.5459436, 1, 0.227451, 0, 1,
-1.784001, 0.24817, -1.340785, 1, 0.2352941, 0, 1,
-1.762479, 1.274586, -1.393185, 1, 0.2392157, 0, 1,
-1.751018, 0.1029292, -1.592771, 1, 0.2470588, 0, 1,
-1.750322, -3.022332, -3.768716, 1, 0.2509804, 0, 1,
-1.739635, -1.019257, -1.402658, 1, 0.2588235, 0, 1,
-1.735822, 0.957815, -0.5828474, 1, 0.2627451, 0, 1,
-1.72985, -1.253559, -2.913421, 1, 0.2705882, 0, 1,
-1.724164, 0.5799789, -0.1677853, 1, 0.2745098, 0, 1,
-1.711906, -0.3605347, -1.361418, 1, 0.282353, 0, 1,
-1.707453, 1.17412, -2.13384, 1, 0.2862745, 0, 1,
-1.706377, -1.108337, -2.784763, 1, 0.2941177, 0, 1,
-1.697289, -0.7872583, -3.004656, 1, 0.3019608, 0, 1,
-1.683223, -0.2123972, -1.697623, 1, 0.3058824, 0, 1,
-1.681027, 0.5821949, -1.3237, 1, 0.3137255, 0, 1,
-1.670472, 0.4124202, -1.322201, 1, 0.3176471, 0, 1,
-1.651103, 0.6065736, -1.906567, 1, 0.3254902, 0, 1,
-1.64845, -1.960309, -2.627281, 1, 0.3294118, 0, 1,
-1.641317, 0.898138, -0.219987, 1, 0.3372549, 0, 1,
-1.632193, -1.030503, -0.7790904, 1, 0.3411765, 0, 1,
-1.629175, 1.660146, -1.873211, 1, 0.3490196, 0, 1,
-1.627236, -0.1151867, -4.273897, 1, 0.3529412, 0, 1,
-1.621026, -0.5182787, -1.836639, 1, 0.3607843, 0, 1,
-1.616736, 1.313676, -0.4926583, 1, 0.3647059, 0, 1,
-1.616538, 0.5063583, -0.2610427, 1, 0.372549, 0, 1,
-1.612566, 0.965021, -2.068485, 1, 0.3764706, 0, 1,
-1.588962, 0.1684254, -0.07027788, 1, 0.3843137, 0, 1,
-1.560128, 0.003227595, -2.538664, 1, 0.3882353, 0, 1,
-1.558094, 0.6264706, -1.042798, 1, 0.3960784, 0, 1,
-1.555162, -0.3383504, -1.646607, 1, 0.4039216, 0, 1,
-1.550628, 0.9606934, -0.895848, 1, 0.4078431, 0, 1,
-1.52474, -0.02553729, -2.05081, 1, 0.4156863, 0, 1,
-1.524731, 2.713829, -1.010184, 1, 0.4196078, 0, 1,
-1.518437, -2.393644, -3.396376, 1, 0.427451, 0, 1,
-1.513352, -0.5977421, -1.312818, 1, 0.4313726, 0, 1,
-1.512033, -0.438989, -3.278895, 1, 0.4392157, 0, 1,
-1.510219, -0.4647636, -2.887073, 1, 0.4431373, 0, 1,
-1.5095, 0.5119074, -1.536004, 1, 0.4509804, 0, 1,
-1.507348, 0.8967046, 0.2187279, 1, 0.454902, 0, 1,
-1.505632, 1.267287, -0.7516607, 1, 0.4627451, 0, 1,
-1.503778, 0.2862533, -2.430542, 1, 0.4666667, 0, 1,
-1.492664, 0.121025, -1.937157, 1, 0.4745098, 0, 1,
-1.490214, -0.3351913, -1.826377, 1, 0.4784314, 0, 1,
-1.484988, 0.05864999, -1.842625, 1, 0.4862745, 0, 1,
-1.484678, -1.057578, -2.569971, 1, 0.4901961, 0, 1,
-1.480948, -1.35126, -2.657051, 1, 0.4980392, 0, 1,
-1.480454, 0.08194411, -0.3290072, 1, 0.5058824, 0, 1,
-1.472055, -0.4965437, -1.008312, 1, 0.509804, 0, 1,
-1.468125, -0.289662, -1.51112, 1, 0.5176471, 0, 1,
-1.466191, 1.443902, -0.1194915, 1, 0.5215687, 0, 1,
-1.462811, 0.2542987, -1.562954, 1, 0.5294118, 0, 1,
-1.458822, 1.1138, -1.644884, 1, 0.5333334, 0, 1,
-1.458131, -0.0990655, 0.2276655, 1, 0.5411765, 0, 1,
-1.45373, 1.200737, 0.1403281, 1, 0.5450981, 0, 1,
-1.442955, 0.4190538, -2.632254, 1, 0.5529412, 0, 1,
-1.442805, -1.664641, -3.436467, 1, 0.5568628, 0, 1,
-1.431416, 0.3316368, -2.012875, 1, 0.5647059, 0, 1,
-1.427784, 1.444929, -0.773601, 1, 0.5686275, 0, 1,
-1.425962, 0.555325, 0.3003974, 1, 0.5764706, 0, 1,
-1.414613, 0.9965133, -2.065588, 1, 0.5803922, 0, 1,
-1.401983, 0.6087433, -1.030728, 1, 0.5882353, 0, 1,
-1.387664, -0.3216953, -2.65917, 1, 0.5921569, 0, 1,
-1.37913, 0.3083642, -1.734195, 1, 0.6, 0, 1,
-1.367112, 0.1471941, -0.3552019, 1, 0.6078432, 0, 1,
-1.365133, -0.536503, -2.085642, 1, 0.6117647, 0, 1,
-1.359683, -0.5462261, -0.8081918, 1, 0.6196079, 0, 1,
-1.333124, -1.07423, -3.380633, 1, 0.6235294, 0, 1,
-1.329619, 1.44906, -0.3613367, 1, 0.6313726, 0, 1,
-1.325113, -0.2755952, -0.5186586, 1, 0.6352941, 0, 1,
-1.319576, -1.286842, -1.906291, 1, 0.6431373, 0, 1,
-1.31768, 2.23913, 1.135977, 1, 0.6470588, 0, 1,
-1.317667, 1.730322, -0.03921998, 1, 0.654902, 0, 1,
-1.314159, -0.1643048, -1.393827, 1, 0.6588235, 0, 1,
-1.309329, 0.6816985, -0.6205093, 1, 0.6666667, 0, 1,
-1.300721, -0.1089398, -1.176117, 1, 0.6705883, 0, 1,
-1.29682, -1.093766, -1.97103, 1, 0.6784314, 0, 1,
-1.285616, -0.01050274, -0.237774, 1, 0.682353, 0, 1,
-1.271364, 0.2531399, -0.342109, 1, 0.6901961, 0, 1,
-1.267171, -0.1071739, -1.406992, 1, 0.6941177, 0, 1,
-1.264223, -0.4745744, -1.985107, 1, 0.7019608, 0, 1,
-1.262848, 0.3013399, -1.751922, 1, 0.7098039, 0, 1,
-1.261994, -0.8459424, -2.900664, 1, 0.7137255, 0, 1,
-1.252772, 0.2088262, -0.155683, 1, 0.7215686, 0, 1,
-1.240782, -1.461357, -1.680997, 1, 0.7254902, 0, 1,
-1.224905, 0.7021795, -1.897167, 1, 0.7333333, 0, 1,
-1.218236, -0.2376456, -1.092275, 1, 0.7372549, 0, 1,
-1.213246, -0.5988116, -0.9162766, 1, 0.7450981, 0, 1,
-1.206098, -2.017172, -1.717233, 1, 0.7490196, 0, 1,
-1.204999, 0.2399117, -1.823286, 1, 0.7568628, 0, 1,
-1.204782, -0.4322948, -0.4915473, 1, 0.7607843, 0, 1,
-1.200263, -1.57958, -2.110037, 1, 0.7686275, 0, 1,
-1.197889, 0.1026735, -1.845038, 1, 0.772549, 0, 1,
-1.192401, -1.942754, -3.774391, 1, 0.7803922, 0, 1,
-1.184623, -1.580575, -3.123706, 1, 0.7843137, 0, 1,
-1.182976, -1.607381, -2.47632, 1, 0.7921569, 0, 1,
-1.167096, -0.1113598, -1.441999, 1, 0.7960784, 0, 1,
-1.16271, -0.6925162, -1.791448, 1, 0.8039216, 0, 1,
-1.158648, -0.2105152, -3.484545, 1, 0.8117647, 0, 1,
-1.145335, -1.629508, -1.955465, 1, 0.8156863, 0, 1,
-1.139955, -0.02457385, -1.961414, 1, 0.8235294, 0, 1,
-1.129792, 0.7624046, -0.4177155, 1, 0.827451, 0, 1,
-1.126209, 0.3943389, -0.4489738, 1, 0.8352941, 0, 1,
-1.120646, 0.5747999, -1.900602, 1, 0.8392157, 0, 1,
-1.120286, 2.011853, -0.4234685, 1, 0.8470588, 0, 1,
-1.111491, -0.09908569, 0.88925, 1, 0.8509804, 0, 1,
-1.106615, 0.8250524, -0.9054367, 1, 0.8588235, 0, 1,
-1.106192, -1.327062, -3.399768, 1, 0.8627451, 0, 1,
-1.105111, -0.8860227, -1.323236, 1, 0.8705882, 0, 1,
-1.088886, -1.606245, -1.46181, 1, 0.8745098, 0, 1,
-1.087216, -0.9079068, -2.128895, 1, 0.8823529, 0, 1,
-1.084039, -0.8288872, -2.757864, 1, 0.8862745, 0, 1,
-1.083369, -1.033641, -1.609965, 1, 0.8941177, 0, 1,
-1.078799, 0.2763614, 1.00429, 1, 0.8980392, 0, 1,
-1.074619, -1.018523, -2.039232, 1, 0.9058824, 0, 1,
-1.073832, 0.2158409, -2.924963, 1, 0.9137255, 0, 1,
-1.070623, -0.1494274, -1.860014, 1, 0.9176471, 0, 1,
-1.069661, -0.09751172, -2.846126, 1, 0.9254902, 0, 1,
-1.0686, 0.9998009, -1.425509, 1, 0.9294118, 0, 1,
-1.062556, 0.7587515, -2.338595, 1, 0.9372549, 0, 1,
-1.061704, -0.9329235, -2.783737, 1, 0.9411765, 0, 1,
-1.05177, -0.5995426, -4.295806, 1, 0.9490196, 0, 1,
-1.049851, 0.008960149, -0.500601, 1, 0.9529412, 0, 1,
-1.046795, -1.782613, -2.320727, 1, 0.9607843, 0, 1,
-1.043712, 0.5333475, -0.952976, 1, 0.9647059, 0, 1,
-1.039652, -0.8947305, -3.322885, 1, 0.972549, 0, 1,
-1.029782, -0.6139896, -1.470362, 1, 0.9764706, 0, 1,
-1.028594, 0.6063322, -0.9486686, 1, 0.9843137, 0, 1,
-1.024974, 0.2517076, 0.1115302, 1, 0.9882353, 0, 1,
-1.016316, 0.2239511, -2.324309, 1, 0.9960784, 0, 1,
-1.015634, -1.242327, -2.424083, 0.9960784, 1, 0, 1,
-1.013615, 0.3376849, -8.792688e-05, 0.9921569, 1, 0, 1,
-1.012491, -0.6790313, -2.201667, 0.9843137, 1, 0, 1,
-1.012485, 1.506419, 1.110675, 0.9803922, 1, 0, 1,
-1.009772, 0.1963621, -2.053129, 0.972549, 1, 0, 1,
-1.005705, 0.2349281, -1.293368, 0.9686275, 1, 0, 1,
-0.9926963, 0.3911332, -1.558604, 0.9607843, 1, 0, 1,
-0.9891759, -0.9236836, -0.7995395, 0.9568627, 1, 0, 1,
-0.9891312, -1.235344, -1.323952, 0.9490196, 1, 0, 1,
-0.9875582, 1.162982, -0.7582332, 0.945098, 1, 0, 1,
-0.9843271, -0.7129991, -0.5974374, 0.9372549, 1, 0, 1,
-0.9842644, 0.3040981, -0.9410354, 0.9333333, 1, 0, 1,
-0.9803032, 0.78243, -3.610715, 0.9254902, 1, 0, 1,
-0.9755197, 0.5584834, -0.2292783, 0.9215686, 1, 0, 1,
-0.9751687, 0.7094674, -1.272532, 0.9137255, 1, 0, 1,
-0.9698025, 2.418224, 0.583889, 0.9098039, 1, 0, 1,
-0.9675077, 1.34194, -1.009692, 0.9019608, 1, 0, 1,
-0.961612, 1.366991, -0.9005065, 0.8941177, 1, 0, 1,
-0.9607692, -0.2024636, -1.22086, 0.8901961, 1, 0, 1,
-0.95887, 0.9486592, -1.62079, 0.8823529, 1, 0, 1,
-0.9583352, 0.9254872, -0.1372507, 0.8784314, 1, 0, 1,
-0.9561691, -1.380637, -2.298496, 0.8705882, 1, 0, 1,
-0.9521462, -0.1283435, -1.710926, 0.8666667, 1, 0, 1,
-0.9518815, -1.340772, -2.183368, 0.8588235, 1, 0, 1,
-0.9517807, 0.3865335, -1.264406, 0.854902, 1, 0, 1,
-0.9490848, -0.3011482, -3.294446, 0.8470588, 1, 0, 1,
-0.9427326, 0.7407123, -0.6316364, 0.8431373, 1, 0, 1,
-0.9421196, 0.566771, 0.7536999, 0.8352941, 1, 0, 1,
-0.9397481, 0.7417607, -1.053726, 0.8313726, 1, 0, 1,
-0.9384187, -0.5053558, -3.277873, 0.8235294, 1, 0, 1,
-0.9337284, -0.2171198, -0.9675144, 0.8196079, 1, 0, 1,
-0.9314333, 0.9627606, 0.9215856, 0.8117647, 1, 0, 1,
-0.930389, 1.320357, -0.9683247, 0.8078431, 1, 0, 1,
-0.9259319, -0.9247825, -2.224032, 0.8, 1, 0, 1,
-0.9234849, -1.058996, -2.922469, 0.7921569, 1, 0, 1,
-0.9223968, 0.5642002, -2.115064, 0.7882353, 1, 0, 1,
-0.9132048, 0.6513745, -0.236442, 0.7803922, 1, 0, 1,
-0.902522, -0.6046168, -1.66418, 0.7764706, 1, 0, 1,
-0.9024423, 0.7564011, 0.7769055, 0.7686275, 1, 0, 1,
-0.8965692, -2.185237, -2.868876, 0.7647059, 1, 0, 1,
-0.8826795, 1.99975, -1.535903, 0.7568628, 1, 0, 1,
-0.8808013, -0.4212533, -1.036473, 0.7529412, 1, 0, 1,
-0.8736378, -0.5283601, -2.708395, 0.7450981, 1, 0, 1,
-0.8733783, 0.0274483, -0.7739826, 0.7411765, 1, 0, 1,
-0.8696284, -0.1746589, -0.596862, 0.7333333, 1, 0, 1,
-0.8692599, -0.07055803, -0.252803, 0.7294118, 1, 0, 1,
-0.8642061, -1.521439, -0.1221503, 0.7215686, 1, 0, 1,
-0.8595361, -0.6098103, -2.158803, 0.7176471, 1, 0, 1,
-0.8589283, 1.06935, -1.469198, 0.7098039, 1, 0, 1,
-0.8588111, 0.4529237, -1.697518, 0.7058824, 1, 0, 1,
-0.8552778, -2.194191, -1.397378, 0.6980392, 1, 0, 1,
-0.8546629, 0.2419873, 0.04381724, 0.6901961, 1, 0, 1,
-0.849053, -0.4996648, -2.714095, 0.6862745, 1, 0, 1,
-0.8454498, 0.1617973, -1.602831, 0.6784314, 1, 0, 1,
-0.84439, 0.920685, -0.4271522, 0.6745098, 1, 0, 1,
-0.8443556, 1.053936, 0.4704342, 0.6666667, 1, 0, 1,
-0.8435469, -0.1818056, -1.320332, 0.6627451, 1, 0, 1,
-0.8429459, -0.1168025, -1.332877, 0.654902, 1, 0, 1,
-0.8388534, -1.203908, -3.156264, 0.6509804, 1, 0, 1,
-0.8378267, -0.0615126, -1.126268, 0.6431373, 1, 0, 1,
-0.8354734, 0.1230004, -2.277031, 0.6392157, 1, 0, 1,
-0.8243821, -0.5311714, -1.842936, 0.6313726, 1, 0, 1,
-0.8159862, 1.256862, 0.4939444, 0.627451, 1, 0, 1,
-0.8153579, 0.6878305, -1.258376, 0.6196079, 1, 0, 1,
-0.8135968, -0.4676014, -2.402189, 0.6156863, 1, 0, 1,
-0.8130166, -0.7902995, -1.950071, 0.6078432, 1, 0, 1,
-0.8121573, 0.4014503, -1.233464, 0.6039216, 1, 0, 1,
-0.8092371, -0.9081327, -3.296718, 0.5960785, 1, 0, 1,
-0.8061256, -0.4174084, -0.0911989, 0.5882353, 1, 0, 1,
-0.8051502, -0.5859956, -1.777374, 0.5843138, 1, 0, 1,
-0.8050023, -0.7911538, -1.678826, 0.5764706, 1, 0, 1,
-0.8016292, 0.7773466, -0.3747388, 0.572549, 1, 0, 1,
-0.7997862, 0.3639033, -0.9557399, 0.5647059, 1, 0, 1,
-0.7849318, -1.42364, -2.964618, 0.5607843, 1, 0, 1,
-0.7826134, -1.720417, -3.146609, 0.5529412, 1, 0, 1,
-0.7738378, -0.06677481, -3.194786, 0.5490196, 1, 0, 1,
-0.7700644, 0.1466708, -0.7173591, 0.5411765, 1, 0, 1,
-0.769505, -1.207352, -1.334533, 0.5372549, 1, 0, 1,
-0.7642391, 1.508621, -0.5778233, 0.5294118, 1, 0, 1,
-0.7625532, -1.014932, -3.990194, 0.5254902, 1, 0, 1,
-0.7612797, -1.337405, -1.349981, 0.5176471, 1, 0, 1,
-0.7610812, -0.6551222, -2.314133, 0.5137255, 1, 0, 1,
-0.7549581, -0.5335071, -0.2800667, 0.5058824, 1, 0, 1,
-0.7533035, 0.1843792, -2.714713, 0.5019608, 1, 0, 1,
-0.7469223, 0.7997437, -0.5752741, 0.4941176, 1, 0, 1,
-0.7407681, -0.07032111, -1.67383, 0.4862745, 1, 0, 1,
-0.7290231, -1.799356, -1.748686, 0.4823529, 1, 0, 1,
-0.7263773, 1.664714, 0.2330213, 0.4745098, 1, 0, 1,
-0.7254037, -0.3880776, -3.873679, 0.4705882, 1, 0, 1,
-0.7163515, -1.277003, -3.972395, 0.4627451, 1, 0, 1,
-0.7089821, 0.001429081, -0.8161979, 0.4588235, 1, 0, 1,
-0.7082166, -0.1893392, -3.251098, 0.4509804, 1, 0, 1,
-0.7064303, -2.642947, -3.660694, 0.4470588, 1, 0, 1,
-0.7059354, -0.34392, -1.170648, 0.4392157, 1, 0, 1,
-0.7017897, 0.6159003, -2.115065, 0.4352941, 1, 0, 1,
-0.7011767, 0.6555391, 0.2427953, 0.427451, 1, 0, 1,
-0.7010216, 2.419209, 1.020225, 0.4235294, 1, 0, 1,
-0.7002888, -0.3957458, -0.6671361, 0.4156863, 1, 0, 1,
-0.6990045, 0.1010732, 0.2164088, 0.4117647, 1, 0, 1,
-0.6967536, 0.5283339, 0.2448319, 0.4039216, 1, 0, 1,
-0.696665, 1.725249, -0.4479541, 0.3960784, 1, 0, 1,
-0.6960081, -0.9681354, -2.201802, 0.3921569, 1, 0, 1,
-0.6924549, 0.3194714, -0.5800391, 0.3843137, 1, 0, 1,
-0.6915366, -0.3644979, -1.699095, 0.3803922, 1, 0, 1,
-0.6914749, -0.8343248, -2.543863, 0.372549, 1, 0, 1,
-0.6893727, 1.084602, 1.394915, 0.3686275, 1, 0, 1,
-0.6884318, 1.240932, 0.6349367, 0.3607843, 1, 0, 1,
-0.6871777, -0.002197837, -1.984532, 0.3568628, 1, 0, 1,
-0.6770748, 0.07259402, -1.632747, 0.3490196, 1, 0, 1,
-0.6751975, -0.2422972, -2.159832, 0.345098, 1, 0, 1,
-0.6743482, 0.2715429, 0.4381515, 0.3372549, 1, 0, 1,
-0.6736012, -0.04364458, -0.8751338, 0.3333333, 1, 0, 1,
-0.672165, 0.08690555, 0.4949025, 0.3254902, 1, 0, 1,
-0.6707544, -1.327603, -1.424065, 0.3215686, 1, 0, 1,
-0.6704941, 0.2670703, -0.2075498, 0.3137255, 1, 0, 1,
-0.6674089, 0.07360486, -1.354426, 0.3098039, 1, 0, 1,
-0.6616505, -0.05395767, -2.019899, 0.3019608, 1, 0, 1,
-0.657631, -0.2221838, -4.403603, 0.2941177, 1, 0, 1,
-0.6567363, 0.7316978, -0.3829193, 0.2901961, 1, 0, 1,
-0.6517546, 0.7074487, 0.2405018, 0.282353, 1, 0, 1,
-0.6500791, -0.8337733, -2.605968, 0.2784314, 1, 0, 1,
-0.6464499, 2.082676, -0.137895, 0.2705882, 1, 0, 1,
-0.6457504, 0.01608874, -3.366731, 0.2666667, 1, 0, 1,
-0.644932, -0.8952894, -3.898641, 0.2588235, 1, 0, 1,
-0.6407622, 0.9426413, -1.551239, 0.254902, 1, 0, 1,
-0.6322544, 1.124298, -0.1289889, 0.2470588, 1, 0, 1,
-0.6315711, 1.373166, -1.050764, 0.2431373, 1, 0, 1,
-0.6313073, -0.01326013, -0.1507432, 0.2352941, 1, 0, 1,
-0.6276593, 0.4926284, 0.07468191, 0.2313726, 1, 0, 1,
-0.6232918, -0.4001017, -2.79441, 0.2235294, 1, 0, 1,
-0.617732, 0.6827084, -0.3723881, 0.2196078, 1, 0, 1,
-0.6124619, -2.074618, -3.61056, 0.2117647, 1, 0, 1,
-0.6121124, 0.2290539, -2.004749, 0.2078431, 1, 0, 1,
-0.6058887, 1.417836, 2.857418, 0.2, 1, 0, 1,
-0.6030388, -0.4130463, -4.379286, 0.1921569, 1, 0, 1,
-0.6012048, -0.8906433, -2.090354, 0.1882353, 1, 0, 1,
-0.5888646, 0.7007858, 0.5292642, 0.1803922, 1, 0, 1,
-0.5857035, 0.4662754, -0.4076918, 0.1764706, 1, 0, 1,
-0.5846535, -1.025194, -1.558891, 0.1686275, 1, 0, 1,
-0.5839422, 0.6137526, -0.2346206, 0.1647059, 1, 0, 1,
-0.5819876, -0.05318597, -1.606547, 0.1568628, 1, 0, 1,
-0.5786018, 0.7401, 0.3739271, 0.1529412, 1, 0, 1,
-0.5729921, 0.3099465, -0.9205981, 0.145098, 1, 0, 1,
-0.5727996, -2.067244, -4.221437, 0.1411765, 1, 0, 1,
-0.5727802, 0.5272292, -1.505721, 0.1333333, 1, 0, 1,
-0.5698615, 0.5512477, -0.0001874604, 0.1294118, 1, 0, 1,
-0.5675737, 1.420837, 1.360208, 0.1215686, 1, 0, 1,
-0.5580063, -0.8347159, -2.682154, 0.1176471, 1, 0, 1,
-0.557597, -1.33996, -2.858946, 0.1098039, 1, 0, 1,
-0.5575876, -0.6963282, 0.05690555, 0.1058824, 1, 0, 1,
-0.556684, 0.5439038, -0.6952374, 0.09803922, 1, 0, 1,
-0.5510846, -1.675935, -4.403105, 0.09019608, 1, 0, 1,
-0.5494862, 0.03918401, -1.80891, 0.08627451, 1, 0, 1,
-0.5486316, 1.015988, 0.1304034, 0.07843138, 1, 0, 1,
-0.547736, 0.2780891, -1.504678, 0.07450981, 1, 0, 1,
-0.5471377, -0.3207983, -3.044956, 0.06666667, 1, 0, 1,
-0.543864, -0.04113032, -1.236498, 0.0627451, 1, 0, 1,
-0.5438182, 0.6150676, -0.5087239, 0.05490196, 1, 0, 1,
-0.5430755, 2.090995, -1.670385, 0.05098039, 1, 0, 1,
-0.5427248, 1.532472, 1.286242, 0.04313726, 1, 0, 1,
-0.5384943, 0.849902, -0.8632584, 0.03921569, 1, 0, 1,
-0.5309734, -0.2400219, -2.205121, 0.03137255, 1, 0, 1,
-0.5245449, -0.1530124, -0.9004179, 0.02745098, 1, 0, 1,
-0.5194089, -0.1980813, -0.3827199, 0.01960784, 1, 0, 1,
-0.5190738, 0.7804572, -1.419361, 0.01568628, 1, 0, 1,
-0.5140497, 1.000931, -1.78838, 0.007843138, 1, 0, 1,
-0.5116859, 0.3215048, -1.945459, 0.003921569, 1, 0, 1,
-0.5107254, -1.195115, -1.669616, 0, 1, 0.003921569, 1,
-0.5105959, -0.2515495, -1.582338, 0, 1, 0.01176471, 1,
-0.505471, -1.761822, -2.964335, 0, 1, 0.01568628, 1,
-0.5041125, 0.6075745, 1.069947, 0, 1, 0.02352941, 1,
-0.5027727, 0.141726, -1.127683, 0, 1, 0.02745098, 1,
-0.4980056, 1.019758, 0.09300899, 0, 1, 0.03529412, 1,
-0.4965336, 0.1167062, -1.486997, 0, 1, 0.03921569, 1,
-0.4956786, 1.436124, -1.494653, 0, 1, 0.04705882, 1,
-0.4920773, 0.2131398, -1.516249, 0, 1, 0.05098039, 1,
-0.4918534, 1.37251, -1.89693, 0, 1, 0.05882353, 1,
-0.4903347, 1.453363, 0.1679519, 0, 1, 0.0627451, 1,
-0.4882778, -0.06454164, -1.938227, 0, 1, 0.07058824, 1,
-0.486209, -0.1655503, -1.532669, 0, 1, 0.07450981, 1,
-0.4861871, -0.3430297, -2.779697, 0, 1, 0.08235294, 1,
-0.4858355, -0.4899953, -1.212117, 0, 1, 0.08627451, 1,
-0.4821691, -1.666735, -2.297886, 0, 1, 0.09411765, 1,
-0.4792093, -0.6162449, -1.704679, 0, 1, 0.1019608, 1,
-0.4778027, 1.207299, -0.5623643, 0, 1, 0.1058824, 1,
-0.4754207, -0.2138106, -2.59326, 0, 1, 0.1137255, 1,
-0.4736159, 1.218253, -1.04337, 0, 1, 0.1176471, 1,
-0.472789, 0.1814714, -0.6153454, 0, 1, 0.1254902, 1,
-0.4602501, -0.5719711, -2.020708, 0, 1, 0.1294118, 1,
-0.4590088, 0.8742422, -1.07162, 0, 1, 0.1372549, 1,
-0.4577729, -1.136062, -3.223288, 0, 1, 0.1411765, 1,
-0.4556589, 1.025024, -0.4645646, 0, 1, 0.1490196, 1,
-0.4553256, 1.147057, -1.776284, 0, 1, 0.1529412, 1,
-0.451404, -1.276827, -3.034086, 0, 1, 0.1607843, 1,
-0.4479301, -0.7940487, -3.341593, 0, 1, 0.1647059, 1,
-0.4461705, 1.216074, -0.8927425, 0, 1, 0.172549, 1,
-0.4435528, 0.08581246, -3.09033, 0, 1, 0.1764706, 1,
-0.442402, -1.742462, -2.876333, 0, 1, 0.1843137, 1,
-0.440701, -0.5329918, -1.396966, 0, 1, 0.1882353, 1,
-0.4358334, 0.3876491, -0.3053728, 0, 1, 0.1960784, 1,
-0.4358325, 0.8707974, 0.5893513, 0, 1, 0.2039216, 1,
-0.4355131, 0.3676314, 0.1709758, 0, 1, 0.2078431, 1,
-0.4328954, 0.7116435, 0.328818, 0, 1, 0.2156863, 1,
-0.4302391, 0.1729771, -1.511133, 0, 1, 0.2196078, 1,
-0.430007, 0.3405883, -0.7794175, 0, 1, 0.227451, 1,
-0.4295147, -1.029798, -3.126391, 0, 1, 0.2313726, 1,
-0.4243579, -0.7870829, -1.347018, 0, 1, 0.2392157, 1,
-0.4227754, -0.6077532, -1.713356, 0, 1, 0.2431373, 1,
-0.4113616, -3.815744, -2.241348, 0, 1, 0.2509804, 1,
-0.4018138, 1.226695, 0.7504829, 0, 1, 0.254902, 1,
-0.3977245, 0.4869608, -0.35971, 0, 1, 0.2627451, 1,
-0.3970219, -0.8368357, -2.089587, 0, 1, 0.2666667, 1,
-0.393774, -0.5418446, -2.775842, 0, 1, 0.2745098, 1,
-0.3900636, 0.8681343, 0.5731468, 0, 1, 0.2784314, 1,
-0.3898812, -0.4078752, -2.632113, 0, 1, 0.2862745, 1,
-0.3886367, -0.4995529, -3.219633, 0, 1, 0.2901961, 1,
-0.3885884, -0.9902778, -1.409732, 0, 1, 0.2980392, 1,
-0.3854109, 1.823548, 0.2137668, 0, 1, 0.3058824, 1,
-0.3844883, -0.9404665, -2.280738, 0, 1, 0.3098039, 1,
-0.3837426, -0.732589, -1.869648, 0, 1, 0.3176471, 1,
-0.3824403, -0.7739037, -3.316841, 0, 1, 0.3215686, 1,
-0.3821479, 0.7436289, -0.1492023, 0, 1, 0.3294118, 1,
-0.3810832, -0.6658939, -3.44445, 0, 1, 0.3333333, 1,
-0.3748661, 0.3418481, -1.064706, 0, 1, 0.3411765, 1,
-0.3747801, 0.1132105, -1.090739, 0, 1, 0.345098, 1,
-0.3614158, 2.191472, -1.211898, 0, 1, 0.3529412, 1,
-0.3607531, -0.6972624, -1.704476, 0, 1, 0.3568628, 1,
-0.3583258, 0.1811479, -1.697214, 0, 1, 0.3647059, 1,
-0.3557028, 0.9830642, -0.4206322, 0, 1, 0.3686275, 1,
-0.3541736, 0.4901855, 0.2554002, 0, 1, 0.3764706, 1,
-0.3482223, -0.6848717, -0.917783, 0, 1, 0.3803922, 1,
-0.3477948, -0.2578471, -1.670762, 0, 1, 0.3882353, 1,
-0.3440831, -1.363654, -2.245976, 0, 1, 0.3921569, 1,
-0.3435037, -0.700829, -2.93637, 0, 1, 0.4, 1,
-0.3417915, -0.2465595, -2.404573, 0, 1, 0.4078431, 1,
-0.3402353, 0.05613106, -1.125187, 0, 1, 0.4117647, 1,
-0.3351797, -0.7791644, -2.573734, 0, 1, 0.4196078, 1,
-0.3339024, 0.8599757, 0.4626528, 0, 1, 0.4235294, 1,
-0.3296867, -0.4756525, -2.213254, 0, 1, 0.4313726, 1,
-0.3272536, 0.01619197, -2.340619, 0, 1, 0.4352941, 1,
-0.321226, 0.07577227, -1.915166, 0, 1, 0.4431373, 1,
-0.3206991, -0.4130279, -1.735508, 0, 1, 0.4470588, 1,
-0.3182636, 1.621501, 0.2263182, 0, 1, 0.454902, 1,
-0.3143089, -0.9304518, -5.242349, 0, 1, 0.4588235, 1,
-0.3133982, 0.8586496, -1.893363, 0, 1, 0.4666667, 1,
-0.3112947, 1.048912, 0.4340802, 0, 1, 0.4705882, 1,
-0.31095, 0.8188443, 0.498385, 0, 1, 0.4784314, 1,
-0.3068994, -2.001084, -3.896021, 0, 1, 0.4823529, 1,
-0.3033019, 0.4791934, -1.968864, 0, 1, 0.4901961, 1,
-0.2981764, 0.3603544, -1.254194, 0, 1, 0.4941176, 1,
-0.2979007, -1.537278, -1.969545, 0, 1, 0.5019608, 1,
-0.2928912, -0.3826242, -4.018744, 0, 1, 0.509804, 1,
-0.2881382, -1.17824, -3.031211, 0, 1, 0.5137255, 1,
-0.2880635, 0.4584349, -1.411769, 0, 1, 0.5215687, 1,
-0.2832044, -1.89594, -3.689783, 0, 1, 0.5254902, 1,
-0.2826777, -1.440212, -4.094452, 0, 1, 0.5333334, 1,
-0.2746917, -2.178985, -4.171595, 0, 1, 0.5372549, 1,
-0.274624, 1.166241, 0.03912679, 0, 1, 0.5450981, 1,
-0.2658995, 0.05735488, -0.183225, 0, 1, 0.5490196, 1,
-0.2614599, -0.2047831, -2.993671, 0, 1, 0.5568628, 1,
-0.255027, 0.4796952, -0.3597881, 0, 1, 0.5607843, 1,
-0.2508439, -0.8511122, -1.581269, 0, 1, 0.5686275, 1,
-0.2500578, -0.8215999, 0.02037623, 0, 1, 0.572549, 1,
-0.2489071, 0.2750341, -1.446677, 0, 1, 0.5803922, 1,
-0.243177, 0.5082501, -1.193534, 0, 1, 0.5843138, 1,
-0.2402094, 1.02141, -0.8126099, 0, 1, 0.5921569, 1,
-0.2384851, 0.4937988, -0.3315797, 0, 1, 0.5960785, 1,
-0.232891, -0.01352531, -2.160195, 0, 1, 0.6039216, 1,
-0.2290306, 0.5480857, -0.7199369, 0, 1, 0.6117647, 1,
-0.2286906, -0.2572002, -2.467165, 0, 1, 0.6156863, 1,
-0.2199239, -1.793684, -2.929131, 0, 1, 0.6235294, 1,
-0.2184649, -0.1790001, -3.187007, 0, 1, 0.627451, 1,
-0.2168173, -1.034813, -2.246725, 0, 1, 0.6352941, 1,
-0.21622, 2.125493, -0.9151842, 0, 1, 0.6392157, 1,
-0.2151008, 0.3871085, 0.6069449, 0, 1, 0.6470588, 1,
-0.2146353, 1.24596, 1.658603, 0, 1, 0.6509804, 1,
-0.2127841, -1.65104, -2.915382, 0, 1, 0.6588235, 1,
-0.2075144, -0.5707687, -1.864218, 0, 1, 0.6627451, 1,
-0.2026372, -0.5620907, -3.085092, 0, 1, 0.6705883, 1,
-0.1970675, 0.3276166, -0.2071849, 0, 1, 0.6745098, 1,
-0.1967797, 1.207241, -0.7753064, 0, 1, 0.682353, 1,
-0.1886632, 0.07659922, -1.982857, 0, 1, 0.6862745, 1,
-0.1882822, -0.8760129, -3.420237, 0, 1, 0.6941177, 1,
-0.1840757, -0.338147, -2.18993, 0, 1, 0.7019608, 1,
-0.1830906, -1.67338, -2.357308, 0, 1, 0.7058824, 1,
-0.1796481, -1.307133, -3.780831, 0, 1, 0.7137255, 1,
-0.1794857, -1.22609, -2.322843, 0, 1, 0.7176471, 1,
-0.1746173, -1.506873, -0.5889372, 0, 1, 0.7254902, 1,
-0.1710988, -0.06072075, -1.440391, 0, 1, 0.7294118, 1,
-0.1707917, 1.079363, 1.24964, 0, 1, 0.7372549, 1,
-0.1689972, 0.5935442, 0.2965227, 0, 1, 0.7411765, 1,
-0.1677241, 0.5815558, 1.039596, 0, 1, 0.7490196, 1,
-0.1672343, 1.689722, 0.2596694, 0, 1, 0.7529412, 1,
-0.1645413, 0.7881567, 0.2142288, 0, 1, 0.7607843, 1,
-0.1604848, -0.2432559, -2.005242, 0, 1, 0.7647059, 1,
-0.156496, -0.2465962, -1.604233, 0, 1, 0.772549, 1,
-0.1539401, -1.514338, -3.258907, 0, 1, 0.7764706, 1,
-0.1530462, 0.7749037, 0.3920318, 0, 1, 0.7843137, 1,
-0.1506223, -1.073892, -1.683346, 0, 1, 0.7882353, 1,
-0.1466451, -0.1728401, -3.323759, 0, 1, 0.7960784, 1,
-0.1445875, 0.8960153, 0.6813937, 0, 1, 0.8039216, 1,
-0.1442014, -1.317006, -2.359592, 0, 1, 0.8078431, 1,
-0.138862, 0.8336899, -0.1337715, 0, 1, 0.8156863, 1,
-0.1276518, 0.2796213, 1.099437, 0, 1, 0.8196079, 1,
-0.1272012, 0.8253343, -0.09120286, 0, 1, 0.827451, 1,
-0.1205604, -0.5359932, -2.16861, 0, 1, 0.8313726, 1,
-0.1188201, 1.247154, 2.769355, 0, 1, 0.8392157, 1,
-0.1184999, -0.5255579, -3.827337, 0, 1, 0.8431373, 1,
-0.1118697, 0.7857579, -0.2366515, 0, 1, 0.8509804, 1,
-0.1083304, 0.770695, -0.5509114, 0, 1, 0.854902, 1,
-0.1075412, -0.7475957, -3.098897, 0, 1, 0.8627451, 1,
-0.1026474, 1.017787, 0.9559975, 0, 1, 0.8666667, 1,
-0.1008915, 0.3132529, -0.07201578, 0, 1, 0.8745098, 1,
-0.1007018, 0.1789216, -1.856002, 0, 1, 0.8784314, 1,
-0.100307, -1.221113, -4.026344, 0, 1, 0.8862745, 1,
-0.09635998, 0.6963285, 2.201207, 0, 1, 0.8901961, 1,
-0.09391838, 0.4181931, -1.676232, 0, 1, 0.8980392, 1,
-0.09196328, -0.4200501, -1.995761, 0, 1, 0.9058824, 1,
-0.09053282, -0.5486569, -3.760558, 0, 1, 0.9098039, 1,
-0.08421402, -1.084406, -2.231847, 0, 1, 0.9176471, 1,
-0.0808451, 0.7348492, -0.7045841, 0, 1, 0.9215686, 1,
-0.075578, 1.358531, -1.053781, 0, 1, 0.9294118, 1,
-0.07514385, 0.6200843, 0.3438002, 0, 1, 0.9333333, 1,
-0.07347663, -0.33354, -3.683566, 0, 1, 0.9411765, 1,
-0.07292292, -1.501083, -3.602693, 0, 1, 0.945098, 1,
-0.06955907, 0.3659489, 0.7236546, 0, 1, 0.9529412, 1,
-0.06594551, -0.05704407, -2.810512, 0, 1, 0.9568627, 1,
-0.06431603, 0.2808571, -1.081483, 0, 1, 0.9647059, 1,
-0.06353636, 2.528713, 0.9266468, 0, 1, 0.9686275, 1,
-0.05215819, 2.191103, -0.1998144, 0, 1, 0.9764706, 1,
-0.04770983, -0.8734244, -1.139581, 0, 1, 0.9803922, 1,
-0.04661639, -0.5254264, -3.005863, 0, 1, 0.9882353, 1,
-0.04584428, -0.4042633, -2.054621, 0, 1, 0.9921569, 1,
-0.04574373, -0.4422239, -3.428809, 0, 1, 1, 1,
-0.04249374, -1.290982, -2.564976, 0, 0.9921569, 1, 1,
-0.0387332, -1.246896, -4.404622, 0, 0.9882353, 1, 1,
-0.03864029, -1.199189, -1.19228, 0, 0.9803922, 1, 1,
-0.03718345, -0.6090053, -3.915109, 0, 0.9764706, 1, 1,
-0.03506748, -0.9058405, -1.812344, 0, 0.9686275, 1, 1,
-0.03502024, -0.3169491, -2.913258, 0, 0.9647059, 1, 1,
-0.03420009, -1.546617, -3.172574, 0, 0.9568627, 1, 1,
-0.03199258, -0.6212131, -4.518456, 0, 0.9529412, 1, 1,
-0.03133241, 0.2075492, 1.819668, 0, 0.945098, 1, 1,
-0.02676362, -0.02575432, -3.566733, 0, 0.9411765, 1, 1,
-0.02618143, -1.684475, -2.020542, 0, 0.9333333, 1, 1,
-0.02310138, 1.559486, -1.078369, 0, 0.9294118, 1, 1,
-0.02257813, 1.036651, 2.036256, 0, 0.9215686, 1, 1,
-0.02009034, 0.8472846, 0.5342305, 0, 0.9176471, 1, 1,
-0.01926447, 0.7810954, -0.9873695, 0, 0.9098039, 1, 1,
-0.01845525, -1.770211, -4.441204, 0, 0.9058824, 1, 1,
-0.01584823, -1.109916, -3.590732, 0, 0.8980392, 1, 1,
-0.01491866, -1.173674, -3.484288, 0, 0.8901961, 1, 1,
-0.01406139, -0.4473468, -2.810417, 0, 0.8862745, 1, 1,
-0.01027994, 1.909592, 0.4667701, 0, 0.8784314, 1, 1,
-0.009293744, -1.052357, -2.228827, 0, 0.8745098, 1, 1,
-0.008305675, 0.9496702, 0.1282531, 0, 0.8666667, 1, 1,
-0.00723922, 0.709648, -0.4887759, 0, 0.8627451, 1, 1,
-0.002631437, 0.6377923, -0.3337128, 0, 0.854902, 1, 1,
-0.001987871, -0.5685927, -2.664866, 0, 0.8509804, 1, 1,
-0.0007190183, -1.637898, -3.139771, 0, 0.8431373, 1, 1,
0.0009245377, 0.905411, -0.9195876, 0, 0.8392157, 1, 1,
0.00277846, -0.4749789, 0.8140236, 0, 0.8313726, 1, 1,
0.002909307, -0.1357812, 3.236042, 0, 0.827451, 1, 1,
0.00355427, -0.05684124, 2.269632, 0, 0.8196079, 1, 1,
0.01016208, 1.48779, -2.251922, 0, 0.8156863, 1, 1,
0.01073525, 0.05974244, 0.8655293, 0, 0.8078431, 1, 1,
0.0154905, -1.073993, 2.8377, 0, 0.8039216, 1, 1,
0.01739207, 1.012066, -1.005082, 0, 0.7960784, 1, 1,
0.02058523, -0.141528, 2.725141, 0, 0.7882353, 1, 1,
0.02179663, 0.6124132, 1.602651, 0, 0.7843137, 1, 1,
0.02557432, 0.9671394, -1.013181, 0, 0.7764706, 1, 1,
0.025724, -0.4516466, 3.841571, 0, 0.772549, 1, 1,
0.02634005, 0.4809816, -0.1864654, 0, 0.7647059, 1, 1,
0.02808004, 1.921193, 0.3365849, 0, 0.7607843, 1, 1,
0.03226462, 1.642951, 0.1968593, 0, 0.7529412, 1, 1,
0.03595522, 1.569441, -0.1317831, 0, 0.7490196, 1, 1,
0.03800955, -0.5536609, 3.840895, 0, 0.7411765, 1, 1,
0.04195902, 0.5618308, -0.06614398, 0, 0.7372549, 1, 1,
0.050876, -0.2247129, 4.854178, 0, 0.7294118, 1, 1,
0.05320815, 0.8960101, -0.1108246, 0, 0.7254902, 1, 1,
0.05855735, 1.13282, 0.5059144, 0, 0.7176471, 1, 1,
0.06123379, 0.8049433, 0.6243758, 0, 0.7137255, 1, 1,
0.06763364, 0.2041741, 0.2923386, 0, 0.7058824, 1, 1,
0.06832661, 0.8334692, 0.3594321, 0, 0.6980392, 1, 1,
0.07251253, -0.08208515, 1.040623, 0, 0.6941177, 1, 1,
0.07474564, -0.05481011, 2.806614, 0, 0.6862745, 1, 1,
0.07774481, 0.2462876, 0.889901, 0, 0.682353, 1, 1,
0.081664, -0.1697011, 1.680655, 0, 0.6745098, 1, 1,
0.0834061, -0.1959395, 2.425979, 0, 0.6705883, 1, 1,
0.08804617, 0.1085127, 0.6247472, 0, 0.6627451, 1, 1,
0.09386738, 1.461242, 0.7167605, 0, 0.6588235, 1, 1,
0.09857011, -0.6980726, 2.201557, 0, 0.6509804, 1, 1,
0.09892482, 2.861148, 1.704428, 0, 0.6470588, 1, 1,
0.09931169, 1.457886, -0.8958865, 0, 0.6392157, 1, 1,
0.1010761, 0.02672707, 0.9570611, 0, 0.6352941, 1, 1,
0.102356, -0.8257475, 3.47074, 0, 0.627451, 1, 1,
0.1070265, -0.6909331, 3.941218, 0, 0.6235294, 1, 1,
0.1136928, 2.268015, -0.4020429, 0, 0.6156863, 1, 1,
0.1202579, -0.1921917, 2.338017, 0, 0.6117647, 1, 1,
0.1209296, -0.7089584, 3.266509, 0, 0.6039216, 1, 1,
0.1221747, -0.1902119, 2.25814, 0, 0.5960785, 1, 1,
0.123562, -1.970168, 2.296596, 0, 0.5921569, 1, 1,
0.1253496, -0.0007471587, 1.003704, 0, 0.5843138, 1, 1,
0.129429, 2.307521, -0.02419276, 0, 0.5803922, 1, 1,
0.1308722, -1.626418, 4.154726, 0, 0.572549, 1, 1,
0.1341672, 0.8235855, 1.314389, 0, 0.5686275, 1, 1,
0.1464016, 0.4814951, -0.159408, 0, 0.5607843, 1, 1,
0.148652, 0.04266763, 1.700833, 0, 0.5568628, 1, 1,
0.1492464, 1.295987, 0.6080753, 0, 0.5490196, 1, 1,
0.1495968, -1.831699, 1.554033, 0, 0.5450981, 1, 1,
0.1499766, -0.463135, 2.863359, 0, 0.5372549, 1, 1,
0.1504759, 1.276199, 0.2224644, 0, 0.5333334, 1, 1,
0.1522923, 0.5786261, -0.8410009, 0, 0.5254902, 1, 1,
0.1549575, 1.190077, -1.91368, 0, 0.5215687, 1, 1,
0.1593381, -0.4552737, 3.464474, 0, 0.5137255, 1, 1,
0.1607186, 0.3437385, -0.3550616, 0, 0.509804, 1, 1,
0.1625729, 0.1586382, 0.6656059, 0, 0.5019608, 1, 1,
0.1628532, -1.285003, 2.13869, 0, 0.4941176, 1, 1,
0.1634634, 2.465143, 0.8004403, 0, 0.4901961, 1, 1,
0.1664188, -0.06014231, 2.110873, 0, 0.4823529, 1, 1,
0.1725552, 0.513667, -1.341124, 0, 0.4784314, 1, 1,
0.1727736, -0.4100775, 3.010875, 0, 0.4705882, 1, 1,
0.1938076, -0.7339612, 5.143607, 0, 0.4666667, 1, 1,
0.2000072, -0.3225849, 3.489714, 0, 0.4588235, 1, 1,
0.2022133, 1.212004, -1.097914, 0, 0.454902, 1, 1,
0.2028729, 0.376577, 0.2526625, 0, 0.4470588, 1, 1,
0.2040759, -0.6972749, 3.536549, 0, 0.4431373, 1, 1,
0.2080642, -1.910384, 3.805701, 0, 0.4352941, 1, 1,
0.2089998, 0.5226077, 1.046195, 0, 0.4313726, 1, 1,
0.2116216, 0.8065569, 0.7425441, 0, 0.4235294, 1, 1,
0.2119912, 1.678422, -0.9307376, 0, 0.4196078, 1, 1,
0.2199565, 0.8854505, 1.794721, 0, 0.4117647, 1, 1,
0.220053, 1.269868, -0.2653501, 0, 0.4078431, 1, 1,
0.2209381, -0.6793727, 3.554968, 0, 0.4, 1, 1,
0.2296373, -0.3254792, 3.152495, 0, 0.3921569, 1, 1,
0.2371113, 1.533782, -1.391692, 0, 0.3882353, 1, 1,
0.2401584, 0.4360279, 0.5526946, 0, 0.3803922, 1, 1,
0.2439014, -1.725824, 2.471262, 0, 0.3764706, 1, 1,
0.2461399, -0.6346942, 4.052092, 0, 0.3686275, 1, 1,
0.2476338, 0.3008539, -0.7829461, 0, 0.3647059, 1, 1,
0.2504491, -1.176947, 4.161206, 0, 0.3568628, 1, 1,
0.2509665, -0.4867823, 2.866098, 0, 0.3529412, 1, 1,
0.2525696, -0.6213492, 2.949666, 0, 0.345098, 1, 1,
0.2568753, 0.474429, -0.3244812, 0, 0.3411765, 1, 1,
0.2577853, 1.652288, -0.3982869, 0, 0.3333333, 1, 1,
0.2647875, -1.009168, 3.179827, 0, 0.3294118, 1, 1,
0.2674008, -0.4378473, 3.607346, 0, 0.3215686, 1, 1,
0.2685308, 2.193044, -1.466407, 0, 0.3176471, 1, 1,
0.2757556, -0.1700522, 1.822086, 0, 0.3098039, 1, 1,
0.2775452, -0.4871462, 2.247598, 0, 0.3058824, 1, 1,
0.2775509, -0.01978127, 2.398619, 0, 0.2980392, 1, 1,
0.2802179, -1.70883, 4.146054, 0, 0.2901961, 1, 1,
0.2814056, 0.6272967, 0.9690367, 0, 0.2862745, 1, 1,
0.2870376, -1.363753, 1.462844, 0, 0.2784314, 1, 1,
0.2891379, -0.5189633, 4.422477, 0, 0.2745098, 1, 1,
0.2899214, -0.5293587, 1.960497, 0, 0.2666667, 1, 1,
0.2942634, 1.159612, 0.9161413, 0, 0.2627451, 1, 1,
0.296345, -0.255998, 3.853047, 0, 0.254902, 1, 1,
0.2998971, -0.4039475, 2.215642, 0, 0.2509804, 1, 1,
0.3042278, 1.216139, 0.6003792, 0, 0.2431373, 1, 1,
0.3067254, -0.8335733, 2.452652, 0, 0.2392157, 1, 1,
0.3069615, 1.53274, -0.5980508, 0, 0.2313726, 1, 1,
0.310701, -1.730248, 1.330642, 0, 0.227451, 1, 1,
0.3110769, 0.07881598, 0.04863752, 0, 0.2196078, 1, 1,
0.3155404, 0.1094079, 2.188599, 0, 0.2156863, 1, 1,
0.3171866, 0.3474543, 1.762104, 0, 0.2078431, 1, 1,
0.3198067, -0.7981009, 1.636866, 0, 0.2039216, 1, 1,
0.3203598, 0.3539219, 0.5498216, 0, 0.1960784, 1, 1,
0.3206523, -0.4527283, 0.609871, 0, 0.1882353, 1, 1,
0.3227623, 0.4448549, 1.314423, 0, 0.1843137, 1, 1,
0.3230467, -0.3705055, 3.198634, 0, 0.1764706, 1, 1,
0.3240002, -1.137258, 3.67169, 0, 0.172549, 1, 1,
0.331545, -0.931158, 1.389055, 0, 0.1647059, 1, 1,
0.3318044, -0.7173221, 2.574356, 0, 0.1607843, 1, 1,
0.3341482, 0.5906022, 0.4997466, 0, 0.1529412, 1, 1,
0.3352399, 1.279741, -1.695207, 0, 0.1490196, 1, 1,
0.3396988, -0.2096968, 2.712894, 0, 0.1411765, 1, 1,
0.3446201, -0.49244, 2.862495, 0, 0.1372549, 1, 1,
0.3478056, 0.5644432, 1.045549, 0, 0.1294118, 1, 1,
0.3549826, -0.5859069, 3.584468, 0, 0.1254902, 1, 1,
0.3581357, 0.1135643, 1.765333, 0, 0.1176471, 1, 1,
0.3583432, 0.5919464, 0.01562474, 0, 0.1137255, 1, 1,
0.3611425, -1.433426, 1.469447, 0, 0.1058824, 1, 1,
0.3631009, 0.7743303, 1.438037, 0, 0.09803922, 1, 1,
0.3653217, -0.3834524, 2.923884, 0, 0.09411765, 1, 1,
0.37369, 0.6989591, 0.8568195, 0, 0.08627451, 1, 1,
0.3739444, -0.5557521, 3.512344, 0, 0.08235294, 1, 1,
0.3862508, 0.781931, 0.2780176, 0, 0.07450981, 1, 1,
0.3872851, 0.2801381, 1.022173, 0, 0.07058824, 1, 1,
0.3884133, -0.6228175, 1.036178, 0, 0.0627451, 1, 1,
0.3891811, -0.1900585, 1.447499, 0, 0.05882353, 1, 1,
0.3896486, -0.1553518, 1.135932, 0, 0.05098039, 1, 1,
0.3921541, 1.005184, -1.700659, 0, 0.04705882, 1, 1,
0.393574, -0.3564141, 3.195232, 0, 0.03921569, 1, 1,
0.3948139, -0.2853988, 1.834606, 0, 0.03529412, 1, 1,
0.3965345, -1.867372, 3.042557, 0, 0.02745098, 1, 1,
0.3967729, -1.536168, 3.668845, 0, 0.02352941, 1, 1,
0.3975205, -0.3536473, 2.554612, 0, 0.01568628, 1, 1,
0.4030504, -0.2660324, 1.836096, 0, 0.01176471, 1, 1,
0.4033599, -0.0915615, 3.096894, 0, 0.003921569, 1, 1,
0.4084329, 0.3936017, 0.01634705, 0.003921569, 0, 1, 1,
0.4104016, 0.2970244, 0.5592521, 0.007843138, 0, 1, 1,
0.4127044, 0.1269734, -0.5588283, 0.01568628, 0, 1, 1,
0.4140936, -2.057473, 1.980948, 0.01960784, 0, 1, 1,
0.4152552, 0.1070089, 0.8671227, 0.02745098, 0, 1, 1,
0.4171003, 0.4955596, 2.066259, 0.03137255, 0, 1, 1,
0.4202744, 1.712918, 0.08662859, 0.03921569, 0, 1, 1,
0.4243937, 2.551098, 0.9359875, 0.04313726, 0, 1, 1,
0.4255839, 0.3539441, 1.462579, 0.05098039, 0, 1, 1,
0.427435, 0.7547735, 1.783486, 0.05490196, 0, 1, 1,
0.4351224, -0.7610825, 1.132265, 0.0627451, 0, 1, 1,
0.4404207, -1.024058, 2.850421, 0.06666667, 0, 1, 1,
0.4432288, -2.080842, 2.661455, 0.07450981, 0, 1, 1,
0.4470046, 1.444307, -1.043611, 0.07843138, 0, 1, 1,
0.4477894, 0.3263187, 2.032085, 0.08627451, 0, 1, 1,
0.4534389, 0.5885831, -0.7655019, 0.09019608, 0, 1, 1,
0.4571972, 1.172092, -0.972351, 0.09803922, 0, 1, 1,
0.4591529, 0.237638, 0.9240091, 0.1058824, 0, 1, 1,
0.46319, 1.048431, 0.3044398, 0.1098039, 0, 1, 1,
0.4683699, -0.5120573, 2.706021, 0.1176471, 0, 1, 1,
0.4695268, -0.2385301, 3.815692, 0.1215686, 0, 1, 1,
0.4703975, -2.150806, 2.884214, 0.1294118, 0, 1, 1,
0.4729367, -0.854177, 4.591907, 0.1333333, 0, 1, 1,
0.4751309, 0.001297679, 1.034292, 0.1411765, 0, 1, 1,
0.4780366, 0.5521418, -0.2752811, 0.145098, 0, 1, 1,
0.4791291, -2.602374, 1.583724, 0.1529412, 0, 1, 1,
0.4802484, -1.110501, 3.441672, 0.1568628, 0, 1, 1,
0.4860389, -0.7764967, 1.953565, 0.1647059, 0, 1, 1,
0.4881525, 0.7228781, 1.650122, 0.1686275, 0, 1, 1,
0.5038262, 0.1199422, 1.744651, 0.1764706, 0, 1, 1,
0.5067946, 1.810832, -1.473047, 0.1803922, 0, 1, 1,
0.5080648, 1.239537, 1.096997, 0.1882353, 0, 1, 1,
0.5093777, -0.8470346, 4.31423, 0.1921569, 0, 1, 1,
0.5127827, 1.693166, 0.2646234, 0.2, 0, 1, 1,
0.5165246, 0.5676146, 0.46547, 0.2078431, 0, 1, 1,
0.5258216, -0.8013741, 1.954342, 0.2117647, 0, 1, 1,
0.5322339, -2.057891, 5.157214, 0.2196078, 0, 1, 1,
0.5361304, -0.3828414, 3.079309, 0.2235294, 0, 1, 1,
0.5430591, -0.3453898, 3.07435, 0.2313726, 0, 1, 1,
0.5461301, 0.6978853, 2.019698, 0.2352941, 0, 1, 1,
0.5513659, -0.006282496, 0.9482391, 0.2431373, 0, 1, 1,
0.554291, -0.754862, 1.381573, 0.2470588, 0, 1, 1,
0.55653, 0.731903, 1.029398, 0.254902, 0, 1, 1,
0.5603791, 0.009350698, 0.2030536, 0.2588235, 0, 1, 1,
0.5626888, -0.2529385, 2.350567, 0.2666667, 0, 1, 1,
0.5640128, 0.218016, 3.01026, 0.2705882, 0, 1, 1,
0.5647184, 0.8896844, 0.9131622, 0.2784314, 0, 1, 1,
0.5688907, 0.8237028, 2.338307, 0.282353, 0, 1, 1,
0.5696639, 0.5145897, 1.038257, 0.2901961, 0, 1, 1,
0.5706964, 0.9055612, 0.2884882, 0.2941177, 0, 1, 1,
0.5723149, 0.1939483, 1.694358, 0.3019608, 0, 1, 1,
0.5902901, -1.517043, 3.090443, 0.3098039, 0, 1, 1,
0.5928433, 1.075379, -1.403719, 0.3137255, 0, 1, 1,
0.5967522, 1.439551, 2.02526, 0.3215686, 0, 1, 1,
0.5971631, -1.882363, 2.510221, 0.3254902, 0, 1, 1,
0.5973527, 0.257685, 1.666763, 0.3333333, 0, 1, 1,
0.5984243, -1.00481, 2.463233, 0.3372549, 0, 1, 1,
0.6026909, 0.4293405, 1.596552, 0.345098, 0, 1, 1,
0.6026938, -2.39384, 1.542134, 0.3490196, 0, 1, 1,
0.6078881, -0.2825174, 1.915488, 0.3568628, 0, 1, 1,
0.6106483, -0.675962, 2.268296, 0.3607843, 0, 1, 1,
0.6143882, -0.04531504, -0.4093727, 0.3686275, 0, 1, 1,
0.6171026, 0.1195532, 0.3949386, 0.372549, 0, 1, 1,
0.6174595, -0.3549746, 0.8046677, 0.3803922, 0, 1, 1,
0.6251372, 0.2746143, 1.712011, 0.3843137, 0, 1, 1,
0.6266702, 0.492401, 0.1962856, 0.3921569, 0, 1, 1,
0.6305695, -1.946452, 2.423215, 0.3960784, 0, 1, 1,
0.6340247, -1.355767, 3.263094, 0.4039216, 0, 1, 1,
0.6361454, -0.4004399, 2.781067, 0.4117647, 0, 1, 1,
0.6415557, 0.3354099, -0.6201302, 0.4156863, 0, 1, 1,
0.6446759, -1.582661, 2.021884, 0.4235294, 0, 1, 1,
0.6448207, 1.846024, -1.03218, 0.427451, 0, 1, 1,
0.6451087, -1.318304, -0.1068865, 0.4352941, 0, 1, 1,
0.6468784, -0.9111325, 4.167137, 0.4392157, 0, 1, 1,
0.6476864, 1.112751, -1.298326, 0.4470588, 0, 1, 1,
0.6487002, 0.2245978, -0.02932921, 0.4509804, 0, 1, 1,
0.6507664, 0.8229986, -0.5622144, 0.4588235, 0, 1, 1,
0.6598939, -1.119291, 2.28377, 0.4627451, 0, 1, 1,
0.6603988, -1.148268, 4.246704, 0.4705882, 0, 1, 1,
0.6620232, 0.3261595, 0.5214593, 0.4745098, 0, 1, 1,
0.6621557, 0.02425769, 3.141218, 0.4823529, 0, 1, 1,
0.6630417, -0.7086284, 0.3863467, 0.4862745, 0, 1, 1,
0.6694993, -0.6772813, 2.662283, 0.4941176, 0, 1, 1,
0.6698534, 0.5319898, 3.536234, 0.5019608, 0, 1, 1,
0.672357, 0.05035461, 2.997089, 0.5058824, 0, 1, 1,
0.673259, -0.1671346, 2.977386, 0.5137255, 0, 1, 1,
0.6747717, -1.32946, 2.713641, 0.5176471, 0, 1, 1,
0.6860139, 0.4017495, 0.8287206, 0.5254902, 0, 1, 1,
0.693417, -0.2800333, 1.709638, 0.5294118, 0, 1, 1,
0.6944602, 0.07444744, 1.701228, 0.5372549, 0, 1, 1,
0.696197, -0.05824248, 1.800355, 0.5411765, 0, 1, 1,
0.7054642, -0.3662749, 1.982074, 0.5490196, 0, 1, 1,
0.7074304, -0.7920778, 2.171901, 0.5529412, 0, 1, 1,
0.7074758, -0.9076975, 2.45913, 0.5607843, 0, 1, 1,
0.7146158, -1.234682, 3.093381, 0.5647059, 0, 1, 1,
0.7172727, -0.4626928, 3.049461, 0.572549, 0, 1, 1,
0.7189193, 0.2917328, 1.246364, 0.5764706, 0, 1, 1,
0.7207891, -0.2237384, 0.3151371, 0.5843138, 0, 1, 1,
0.7237314, -1.080188, 2.10171, 0.5882353, 0, 1, 1,
0.7249711, -0.425438, 2.016531, 0.5960785, 0, 1, 1,
0.7265004, 0.08446719, 3.06618, 0.6039216, 0, 1, 1,
0.7281133, 0.7647839, 1.880246, 0.6078432, 0, 1, 1,
0.7326046, -2.171347, 1.865248, 0.6156863, 0, 1, 1,
0.7351413, -0.6957859, 3.542479, 0.6196079, 0, 1, 1,
0.7443268, -0.3683081, 1.218878, 0.627451, 0, 1, 1,
0.7469381, 0.3740344, 2.40478, 0.6313726, 0, 1, 1,
0.7510275, -0.01427053, 1.010869, 0.6392157, 0, 1, 1,
0.7528107, -0.2256989, 1.986702, 0.6431373, 0, 1, 1,
0.7604262, 0.1992612, 0.01478372, 0.6509804, 0, 1, 1,
0.7632466, -0.505597, 4.231045, 0.654902, 0, 1, 1,
0.7671273, -1.431519, 1.367602, 0.6627451, 0, 1, 1,
0.7746435, -0.1703316, 2.414575, 0.6666667, 0, 1, 1,
0.7805482, 0.3857859, 2.19223, 0.6745098, 0, 1, 1,
0.7871153, -0.3437739, 1.134276, 0.6784314, 0, 1, 1,
0.7886441, -0.5049598, 2.526069, 0.6862745, 0, 1, 1,
0.7919157, 0.2506391, 2.573635, 0.6901961, 0, 1, 1,
0.7919617, 1.07129, 0.882452, 0.6980392, 0, 1, 1,
0.7962763, 1.428082, -0.04511671, 0.7058824, 0, 1, 1,
0.7992395, -1.324035, 3.211874, 0.7098039, 0, 1, 1,
0.8023296, 0.2520972, 1.286365, 0.7176471, 0, 1, 1,
0.805087, 0.7786552, 1.303273, 0.7215686, 0, 1, 1,
0.8105594, 0.8643557, -0.1700475, 0.7294118, 0, 1, 1,
0.8112187, 0.4578332, 0.1525347, 0.7333333, 0, 1, 1,
0.8133203, -1.860149, 3.503233, 0.7411765, 0, 1, 1,
0.814633, 0.739095, 1.163285, 0.7450981, 0, 1, 1,
0.8199388, -2.087814, 2.56157, 0.7529412, 0, 1, 1,
0.8226877, 0.6717571, 2.27872, 0.7568628, 0, 1, 1,
0.8237671, 1.119045, -0.4954986, 0.7647059, 0, 1, 1,
0.8238025, 1.240212, 1.278419, 0.7686275, 0, 1, 1,
0.8266318, -0.7341361, 1.995708, 0.7764706, 0, 1, 1,
0.8276927, -0.0795823, 0.2569735, 0.7803922, 0, 1, 1,
0.8287935, 1.213384, 1.975206, 0.7882353, 0, 1, 1,
0.8295389, -0.5640199, 3.404546, 0.7921569, 0, 1, 1,
0.8308944, -0.2437267, 2.585605, 0.8, 0, 1, 1,
0.8346775, 1.338812, 0.4314814, 0.8078431, 0, 1, 1,
0.8355576, -0.1234167, 2.960989, 0.8117647, 0, 1, 1,
0.8440093, -0.3088166, 1.687624, 0.8196079, 0, 1, 1,
0.8466492, 0.6686095, 1.400344, 0.8235294, 0, 1, 1,
0.8506038, 0.332558, 0.5530926, 0.8313726, 0, 1, 1,
0.852405, -0.0820885, 0.4376825, 0.8352941, 0, 1, 1,
0.8727106, -1.715367, 1.420672, 0.8431373, 0, 1, 1,
0.878488, -0.07555724, 2.669658, 0.8470588, 0, 1, 1,
0.8817588, 1.905599, -0.09289444, 0.854902, 0, 1, 1,
0.88208, -0.4216087, 1.762489, 0.8588235, 0, 1, 1,
0.8825526, 0.8184282, 0.8241225, 0.8666667, 0, 1, 1,
0.8826173, 0.006867241, 1.55014, 0.8705882, 0, 1, 1,
0.8847794, -1.529698, 1.56637, 0.8784314, 0, 1, 1,
0.8868393, 0.1122679, 1.52915, 0.8823529, 0, 1, 1,
0.8899711, -2.251921, 2.874949, 0.8901961, 0, 1, 1,
0.891967, -1.771902, 0.9885718, 0.8941177, 0, 1, 1,
0.893993, 0.8482087, 1.549146, 0.9019608, 0, 1, 1,
0.9075025, 0.9706196, -0.370237, 0.9098039, 0, 1, 1,
0.9084467, -0.628274, 1.372131, 0.9137255, 0, 1, 1,
0.9088265, 0.8949537, -0.004369863, 0.9215686, 0, 1, 1,
0.9117782, 0.6314712, 1.317745, 0.9254902, 0, 1, 1,
0.912041, -0.1018941, 2.232195, 0.9333333, 0, 1, 1,
0.9129478, -0.9511494, 2.287517, 0.9372549, 0, 1, 1,
0.9139737, -0.5744601, 2.447282, 0.945098, 0, 1, 1,
0.9248264, -0.2762219, 3.501421, 0.9490196, 0, 1, 1,
0.926517, 1.437288, -0.9037154, 0.9568627, 0, 1, 1,
0.9314822, 0.3644354, 0.7371838, 0.9607843, 0, 1, 1,
0.9319877, 0.9808263, 1.635859, 0.9686275, 0, 1, 1,
0.9324481, 0.2263311, 1.038608, 0.972549, 0, 1, 1,
0.9335477, 1.046328, 1.32283, 0.9803922, 0, 1, 1,
0.9349308, 0.9234715, 3.460708, 0.9843137, 0, 1, 1,
0.9356861, 1.367982, -1.208979, 0.9921569, 0, 1, 1,
0.9360426, 0.3610981, 1.940981, 0.9960784, 0, 1, 1,
0.9378964, 0.07218827, 2.130381, 1, 0, 0.9960784, 1,
0.9440972, -0.1425551, 1.212475, 1, 0, 0.9882353, 1,
0.950547, 1.539084, 2.497922, 1, 0, 0.9843137, 1,
0.9505817, -0.6408974, 2.615921, 1, 0, 0.9764706, 1,
0.9560177, -0.7187212, 1.819476, 1, 0, 0.972549, 1,
0.9560307, -0.4083155, 3.216745, 1, 0, 0.9647059, 1,
0.9577614, -0.1776605, 1.616589, 1, 0, 0.9607843, 1,
0.9769197, 0.2846715, 1.566685, 1, 0, 0.9529412, 1,
0.9779512, 1.347166, 2.120633, 1, 0, 0.9490196, 1,
0.9820446, -0.5168155, 2.210478, 1, 0, 0.9411765, 1,
0.9828835, -0.710454, 2.246629, 1, 0, 0.9372549, 1,
0.9878969, -0.6931941, 1.629585, 1, 0, 0.9294118, 1,
0.9895626, 0.198341, 1.407584, 1, 0, 0.9254902, 1,
0.9946032, -0.0334296, -0.5601511, 1, 0, 0.9176471, 1,
1.003751, 2.406059, 0.2321339, 1, 0, 0.9137255, 1,
1.005727, -0.2575788, 3.615703, 1, 0, 0.9058824, 1,
1.006404, 0.4521351, 0.7435001, 1, 0, 0.9019608, 1,
1.006859, 0.5238359, 1.165614, 1, 0, 0.8941177, 1,
1.024936, 0.5778031, -0.9851969, 1, 0, 0.8862745, 1,
1.027095, -0.5997164, 2.534393, 1, 0, 0.8823529, 1,
1.035479, 0.2760856, 2.591572, 1, 0, 0.8745098, 1,
1.038117, -0.08113836, 2.603241, 1, 0, 0.8705882, 1,
1.049445, 0.5333978, 1.187762, 1, 0, 0.8627451, 1,
1.049673, 0.9645714, 0.2578589, 1, 0, 0.8588235, 1,
1.052658, 0.6520137, -1.548129, 1, 0, 0.8509804, 1,
1.056091, -0.9040424, 3.025229, 1, 0, 0.8470588, 1,
1.058608, -0.1022985, 0.9791296, 1, 0, 0.8392157, 1,
1.061333, 0.7912861, 0.4397529, 1, 0, 0.8352941, 1,
1.073835, 1.234202, 0.09289689, 1, 0, 0.827451, 1,
1.074611, 1.07241, 0.1286764, 1, 0, 0.8235294, 1,
1.081643, -0.1006458, 0.8096831, 1, 0, 0.8156863, 1,
1.083013, -0.4086167, 2.221414, 1, 0, 0.8117647, 1,
1.088108, -0.1669762, 3.56533, 1, 0, 0.8039216, 1,
1.092206, -0.2497111, 0.8929356, 1, 0, 0.7960784, 1,
1.097408, -0.1955755, 3.62531, 1, 0, 0.7921569, 1,
1.103092, 0.963007, 0.7843566, 1, 0, 0.7843137, 1,
1.111317, -0.06029288, 3.030992, 1, 0, 0.7803922, 1,
1.120261, -1.800598, 2.584573, 1, 0, 0.772549, 1,
1.12448, -0.6456715, 1.856307, 1, 0, 0.7686275, 1,
1.129861, 1.465937, 1.596871, 1, 0, 0.7607843, 1,
1.132089, 0.6244656, -0.8236529, 1, 0, 0.7568628, 1,
1.134185, -0.2279007, 2.235678, 1, 0, 0.7490196, 1,
1.142499, -0.446247, 1.562209, 1, 0, 0.7450981, 1,
1.145383, -1.163045, 3.631484, 1, 0, 0.7372549, 1,
1.145469, 2.121248, 1.0447, 1, 0, 0.7333333, 1,
1.147378, -0.8416054, 3.352827, 1, 0, 0.7254902, 1,
1.151603, -1.053891, 1.755516, 1, 0, 0.7215686, 1,
1.15446, -0.4773244, 1.263977, 1, 0, 0.7137255, 1,
1.155396, 0.07599682, 2.014654, 1, 0, 0.7098039, 1,
1.159798, -1.563108, 2.778262, 1, 0, 0.7019608, 1,
1.192981, -0.2216147, 0.4539214, 1, 0, 0.6941177, 1,
1.193764, 1.191651, 0.8002853, 1, 0, 0.6901961, 1,
1.196736, 1.018168, 0.6314962, 1, 0, 0.682353, 1,
1.205234, -0.5212886, 2.184935, 1, 0, 0.6784314, 1,
1.219295, -1.640277, 1.222962, 1, 0, 0.6705883, 1,
1.23086, -1.901079, 0.6677134, 1, 0, 0.6666667, 1,
1.236241, 0.08061249, 2.014292, 1, 0, 0.6588235, 1,
1.240229, -0.9295439, 1.848721, 1, 0, 0.654902, 1,
1.241735, 0.4645183, 2.016382, 1, 0, 0.6470588, 1,
1.248181, -0.7738816, -0.3640948, 1, 0, 0.6431373, 1,
1.256778, -1.800776, 1.024052, 1, 0, 0.6352941, 1,
1.265645, -1.138755, 1.189552, 1, 0, 0.6313726, 1,
1.275978, 0.7266274, 3.055395, 1, 0, 0.6235294, 1,
1.27839, 0.1897982, 4.053912, 1, 0, 0.6196079, 1,
1.299181, -1.940073, 2.819554, 1, 0, 0.6117647, 1,
1.30274, 0.8059018, 1.36271, 1, 0, 0.6078432, 1,
1.324267, 0.790603, 2.389166, 1, 0, 0.6, 1,
1.32597, -0.4527236, 3.179799, 1, 0, 0.5921569, 1,
1.334949, 2.293092, -0.2101302, 1, 0, 0.5882353, 1,
1.345494, -0.92725, 2.549526, 1, 0, 0.5803922, 1,
1.347336, 0.6897424, -0.5478499, 1, 0, 0.5764706, 1,
1.347443, 0.9554241, 1.016798, 1, 0, 0.5686275, 1,
1.362216, 0.3012044, 0.2459961, 1, 0, 0.5647059, 1,
1.365257, -2.154843, 2.253794, 1, 0, 0.5568628, 1,
1.366264, -1.765169, 0.3199325, 1, 0, 0.5529412, 1,
1.37939, -0.2163484, 3.33568, 1, 0, 0.5450981, 1,
1.380157, 0.2680264, 0.7495006, 1, 0, 0.5411765, 1,
1.396497, 0.6842374, 1.223401, 1, 0, 0.5333334, 1,
1.399738, -0.7747129, 0.8346766, 1, 0, 0.5294118, 1,
1.408778, -1.98329, 4.397366, 1, 0, 0.5215687, 1,
1.408781, -0.8608327, 1.364529, 1, 0, 0.5176471, 1,
1.411698, 0.5252501, 1.539227, 1, 0, 0.509804, 1,
1.413489, -0.4538125, 0.8008232, 1, 0, 0.5058824, 1,
1.415333, 0.3380007, 1.337552, 1, 0, 0.4980392, 1,
1.418307, 0.8642037, -0.9583106, 1, 0, 0.4901961, 1,
1.421894, -0.2378949, 1.435906, 1, 0, 0.4862745, 1,
1.428468, -1.517784, 2.041437, 1, 0, 0.4784314, 1,
1.428582, -0.0353237, 0.858268, 1, 0, 0.4745098, 1,
1.428971, 0.6488621, 1.324398, 1, 0, 0.4666667, 1,
1.429125, 1.134368, 0.1858699, 1, 0, 0.4627451, 1,
1.442186, 0.9150451, 0.2123476, 1, 0, 0.454902, 1,
1.442799, 0.2122088, 0.07432265, 1, 0, 0.4509804, 1,
1.444809, 0.8039161, -0.2619047, 1, 0, 0.4431373, 1,
1.449118, 0.2031734, 2.327691, 1, 0, 0.4392157, 1,
1.45268, -0.08493011, 1.58884, 1, 0, 0.4313726, 1,
1.460848, 2.975916, 2.253768, 1, 0, 0.427451, 1,
1.480171, -1.359364, 0.6670088, 1, 0, 0.4196078, 1,
1.487513, 0.9921898, 0.2635927, 1, 0, 0.4156863, 1,
1.488433, 1.108689, 0.9966585, 1, 0, 0.4078431, 1,
1.488671, 0.3575602, -0.1738991, 1, 0, 0.4039216, 1,
1.491048, 0.3413549, 1.01364, 1, 0, 0.3960784, 1,
1.496262, -0.9801509, 2.823285, 1, 0, 0.3882353, 1,
1.504079, -0.5279565, 2.103241, 1, 0, 0.3843137, 1,
1.504655, -0.1053347, 1.421861, 1, 0, 0.3764706, 1,
1.510293, -0.5643098, 2.038357, 1, 0, 0.372549, 1,
1.511056, -0.07509458, 2.800835, 1, 0, 0.3647059, 1,
1.511602, 0.3376682, 2.812121, 1, 0, 0.3607843, 1,
1.513054, -0.873388, 2.016948, 1, 0, 0.3529412, 1,
1.515966, -0.7815525, 1.660436, 1, 0, 0.3490196, 1,
1.520991, 0.5152212, 0.5516912, 1, 0, 0.3411765, 1,
1.522699, 1.580506, 1.630562, 1, 0, 0.3372549, 1,
1.544907, -1.925853, 2.21928, 1, 0, 0.3294118, 1,
1.551197, 1.662851, 0.8877545, 1, 0, 0.3254902, 1,
1.551456, -1.775589, 1.037059, 1, 0, 0.3176471, 1,
1.563197, 1.839532, 1.035123, 1, 0, 0.3137255, 1,
1.582462, -0.6480368, 2.353601, 1, 0, 0.3058824, 1,
1.587066, -2.808567, 2.414337, 1, 0, 0.2980392, 1,
1.605817, 0.4450122, 1.886393, 1, 0, 0.2941177, 1,
1.605823, -0.2922665, 1.635573, 1, 0, 0.2862745, 1,
1.607348, -1.442619, 3.620712, 1, 0, 0.282353, 1,
1.640484, -0.5318803, 3.704391, 1, 0, 0.2745098, 1,
1.65477, -0.7411677, 2.433149, 1, 0, 0.2705882, 1,
1.661071, 0.2505924, 1.724446, 1, 0, 0.2627451, 1,
1.662294, -2.011606, 2.418604, 1, 0, 0.2588235, 1,
1.685095, 0.4616279, 3.188449, 1, 0, 0.2509804, 1,
1.691252, -1.489205, 2.437183, 1, 0, 0.2470588, 1,
1.693742, 2.125584, 0.8307009, 1, 0, 0.2392157, 1,
1.711556, 0.03832318, -1.114313, 1, 0, 0.2352941, 1,
1.717982, -0.05375976, 1.492753, 1, 0, 0.227451, 1,
1.721044, 0.2778855, 0.1528125, 1, 0, 0.2235294, 1,
1.724816, -1.011251, 0.7723695, 1, 0, 0.2156863, 1,
1.732642, 0.6607893, -0.9943911, 1, 0, 0.2117647, 1,
1.739486, -1.592565, 4.768454, 1, 0, 0.2039216, 1,
1.741332, -1.467768, 1.201544, 1, 0, 0.1960784, 1,
1.748387, -0.4439026, 1.594981, 1, 0, 0.1921569, 1,
1.756646, -1.047361, 1.80531, 1, 0, 0.1843137, 1,
1.792753, -0.2134957, 2.705607, 1, 0, 0.1803922, 1,
1.804571, -0.170098, 0.4519915, 1, 0, 0.172549, 1,
1.823708, -0.1479106, 1.920099, 1, 0, 0.1686275, 1,
1.826251, 0.4173871, 1.949381, 1, 0, 0.1607843, 1,
1.835121, 2.434916, 0.2338301, 1, 0, 0.1568628, 1,
1.869705, -0.8014681, 3.001218, 1, 0, 0.1490196, 1,
1.89574, -0.4122621, 1.396705, 1, 0, 0.145098, 1,
1.924262, -0.01953614, 1.768391, 1, 0, 0.1372549, 1,
1.925456, -0.509988, 2.007063, 1, 0, 0.1333333, 1,
1.964215, -0.7372404, 2.226181, 1, 0, 0.1254902, 1,
1.980194, -0.8534213, 0.01145473, 1, 0, 0.1215686, 1,
2.037726, -0.01655024, 4.00136, 1, 0, 0.1137255, 1,
2.074174, 0.9474403, 2.613688, 1, 0, 0.1098039, 1,
2.088825, 0.115831, 0.7311957, 1, 0, 0.1019608, 1,
2.093047, -1.493899, 2.209728, 1, 0, 0.09411765, 1,
2.10124, 1.396435, 1.146864, 1, 0, 0.09019608, 1,
2.112262, 1.755096, 0.005505559, 1, 0, 0.08235294, 1,
2.27382, 0.2309474, 1.171023, 1, 0, 0.07843138, 1,
2.329947, -0.969679, 3.736963, 1, 0, 0.07058824, 1,
2.372725, 0.9388619, 0.8931784, 1, 0, 0.06666667, 1,
2.399126, -0.4358428, 0.777037, 1, 0, 0.05882353, 1,
2.408586, -0.2267246, 2.058745, 1, 0, 0.05490196, 1,
2.457768, 0.4209832, -0.8673169, 1, 0, 0.04705882, 1,
2.720949, -0.2463836, 3.456974, 1, 0, 0.04313726, 1,
2.828016, -0.4965875, 1.559832, 1, 0, 0.03529412, 1,
2.941553, 0.0738089, 2.004122, 1, 0, 0.03137255, 1,
3.024314, 1.374509, 1.677324, 1, 0, 0.02352941, 1,
3.071394, -0.3569275, 4.513567, 1, 0, 0.01960784, 1,
3.186699, 1.349365, 2.039288, 1, 0, 0.01176471, 1,
3.392112, 1.117741, 0.2245499, 1, 0, 0.007843138, 1
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
0.3792791, -4.96693, -7.005075, 0, -0.5, 0.5, 0.5,
0.3792791, -4.96693, -7.005075, 1, -0.5, 0.5, 0.5,
0.3792791, -4.96693, -7.005075, 1, 1.5, 0.5, 0.5,
0.3792791, -4.96693, -7.005075, 0, 1.5, 0.5, 0.5
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
-3.654905, -0.4199138, -7.005075, 0, -0.5, 0.5, 0.5,
-3.654905, -0.4199138, -7.005075, 1, -0.5, 0.5, 0.5,
-3.654905, -0.4199138, -7.005075, 1, 1.5, 0.5, 0.5,
-3.654905, -0.4199138, -7.005075, 0, 1.5, 0.5, 0.5
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
-3.654905, -4.96693, -0.04256773, 0, -0.5, 0.5, 0.5,
-3.654905, -4.96693, -0.04256773, 1, -0.5, 0.5, 0.5,
-3.654905, -4.96693, -0.04256773, 1, 1.5, 0.5, 0.5,
-3.654905, -4.96693, -0.04256773, 0, 1.5, 0.5, 0.5
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
-2, -3.917619, -5.398343,
3, -3.917619, -5.398343,
-2, -3.917619, -5.398343,
-2, -4.092504, -5.666131,
-1, -3.917619, -5.398343,
-1, -4.092504, -5.666131,
0, -3.917619, -5.398343,
0, -4.092504, -5.666131,
1, -3.917619, -5.398343,
1, -4.092504, -5.666131,
2, -3.917619, -5.398343,
2, -4.092504, -5.666131,
3, -3.917619, -5.398343,
3, -4.092504, -5.666131
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
-2, -4.442274, -6.201709, 0, -0.5, 0.5, 0.5,
-2, -4.442274, -6.201709, 1, -0.5, 0.5, 0.5,
-2, -4.442274, -6.201709, 1, 1.5, 0.5, 0.5,
-2, -4.442274, -6.201709, 0, 1.5, 0.5, 0.5,
-1, -4.442274, -6.201709, 0, -0.5, 0.5, 0.5,
-1, -4.442274, -6.201709, 1, -0.5, 0.5, 0.5,
-1, -4.442274, -6.201709, 1, 1.5, 0.5, 0.5,
-1, -4.442274, -6.201709, 0, 1.5, 0.5, 0.5,
0, -4.442274, -6.201709, 0, -0.5, 0.5, 0.5,
0, -4.442274, -6.201709, 1, -0.5, 0.5, 0.5,
0, -4.442274, -6.201709, 1, 1.5, 0.5, 0.5,
0, -4.442274, -6.201709, 0, 1.5, 0.5, 0.5,
1, -4.442274, -6.201709, 0, -0.5, 0.5, 0.5,
1, -4.442274, -6.201709, 1, -0.5, 0.5, 0.5,
1, -4.442274, -6.201709, 1, 1.5, 0.5, 0.5,
1, -4.442274, -6.201709, 0, 1.5, 0.5, 0.5,
2, -4.442274, -6.201709, 0, -0.5, 0.5, 0.5,
2, -4.442274, -6.201709, 1, -0.5, 0.5, 0.5,
2, -4.442274, -6.201709, 1, 1.5, 0.5, 0.5,
2, -4.442274, -6.201709, 0, 1.5, 0.5, 0.5,
3, -4.442274, -6.201709, 0, -0.5, 0.5, 0.5,
3, -4.442274, -6.201709, 1, -0.5, 0.5, 0.5,
3, -4.442274, -6.201709, 1, 1.5, 0.5, 0.5,
3, -4.442274, -6.201709, 0, 1.5, 0.5, 0.5
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
-2.723939, -3, -5.398343,
-2.723939, 2, -5.398343,
-2.723939, -3, -5.398343,
-2.8791, -3, -5.666131,
-2.723939, -2, -5.398343,
-2.8791, -2, -5.666131,
-2.723939, -1, -5.398343,
-2.8791, -1, -5.666131,
-2.723939, 0, -5.398343,
-2.8791, 0, -5.666131,
-2.723939, 1, -5.398343,
-2.8791, 1, -5.666131,
-2.723939, 2, -5.398343,
-2.8791, 2, -5.666131
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
-3.189422, -3, -6.201709, 0, -0.5, 0.5, 0.5,
-3.189422, -3, -6.201709, 1, -0.5, 0.5, 0.5,
-3.189422, -3, -6.201709, 1, 1.5, 0.5, 0.5,
-3.189422, -3, -6.201709, 0, 1.5, 0.5, 0.5,
-3.189422, -2, -6.201709, 0, -0.5, 0.5, 0.5,
-3.189422, -2, -6.201709, 1, -0.5, 0.5, 0.5,
-3.189422, -2, -6.201709, 1, 1.5, 0.5, 0.5,
-3.189422, -2, -6.201709, 0, 1.5, 0.5, 0.5,
-3.189422, -1, -6.201709, 0, -0.5, 0.5, 0.5,
-3.189422, -1, -6.201709, 1, -0.5, 0.5, 0.5,
-3.189422, -1, -6.201709, 1, 1.5, 0.5, 0.5,
-3.189422, -1, -6.201709, 0, 1.5, 0.5, 0.5,
-3.189422, 0, -6.201709, 0, -0.5, 0.5, 0.5,
-3.189422, 0, -6.201709, 1, -0.5, 0.5, 0.5,
-3.189422, 0, -6.201709, 1, 1.5, 0.5, 0.5,
-3.189422, 0, -6.201709, 0, 1.5, 0.5, 0.5,
-3.189422, 1, -6.201709, 0, -0.5, 0.5, 0.5,
-3.189422, 1, -6.201709, 1, -0.5, 0.5, 0.5,
-3.189422, 1, -6.201709, 1, 1.5, 0.5, 0.5,
-3.189422, 1, -6.201709, 0, 1.5, 0.5, 0.5,
-3.189422, 2, -6.201709, 0, -0.5, 0.5, 0.5,
-3.189422, 2, -6.201709, 1, -0.5, 0.5, 0.5,
-3.189422, 2, -6.201709, 1, 1.5, 0.5, 0.5,
-3.189422, 2, -6.201709, 0, 1.5, 0.5, 0.5
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
-2.723939, -3.917619, -4,
-2.723939, -3.917619, 4,
-2.723939, -3.917619, -4,
-2.8791, -4.092504, -4,
-2.723939, -3.917619, -2,
-2.8791, -4.092504, -2,
-2.723939, -3.917619, 0,
-2.8791, -4.092504, 0,
-2.723939, -3.917619, 2,
-2.8791, -4.092504, 2,
-2.723939, -3.917619, 4,
-2.8791, -4.092504, 4
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
-3.189422, -4.442274, -4, 0, -0.5, 0.5, 0.5,
-3.189422, -4.442274, -4, 1, -0.5, 0.5, 0.5,
-3.189422, -4.442274, -4, 1, 1.5, 0.5, 0.5,
-3.189422, -4.442274, -4, 0, 1.5, 0.5, 0.5,
-3.189422, -4.442274, -2, 0, -0.5, 0.5, 0.5,
-3.189422, -4.442274, -2, 1, -0.5, 0.5, 0.5,
-3.189422, -4.442274, -2, 1, 1.5, 0.5, 0.5,
-3.189422, -4.442274, -2, 0, 1.5, 0.5, 0.5,
-3.189422, -4.442274, 0, 0, -0.5, 0.5, 0.5,
-3.189422, -4.442274, 0, 1, -0.5, 0.5, 0.5,
-3.189422, -4.442274, 0, 1, 1.5, 0.5, 0.5,
-3.189422, -4.442274, 0, 0, 1.5, 0.5, 0.5,
-3.189422, -4.442274, 2, 0, -0.5, 0.5, 0.5,
-3.189422, -4.442274, 2, 1, -0.5, 0.5, 0.5,
-3.189422, -4.442274, 2, 1, 1.5, 0.5, 0.5,
-3.189422, -4.442274, 2, 0, 1.5, 0.5, 0.5,
-3.189422, -4.442274, 4, 0, -0.5, 0.5, 0.5,
-3.189422, -4.442274, 4, 1, -0.5, 0.5, 0.5,
-3.189422, -4.442274, 4, 1, 1.5, 0.5, 0.5,
-3.189422, -4.442274, 4, 0, 1.5, 0.5, 0.5
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
-2.723939, -3.917619, -5.398343,
-2.723939, 3.077791, -5.398343,
-2.723939, -3.917619, 5.313207,
-2.723939, 3.077791, 5.313207,
-2.723939, -3.917619, -5.398343,
-2.723939, -3.917619, 5.313207,
-2.723939, 3.077791, -5.398343,
-2.723939, 3.077791, 5.313207,
-2.723939, -3.917619, -5.398343,
3.482497, -3.917619, -5.398343,
-2.723939, -3.917619, 5.313207,
3.482497, -3.917619, 5.313207,
-2.723939, 3.077791, -5.398343,
3.482497, 3.077791, -5.398343,
-2.723939, 3.077791, 5.313207,
3.482497, 3.077791, 5.313207,
3.482497, -3.917619, -5.398343,
3.482497, 3.077791, -5.398343,
3.482497, -3.917619, 5.313207,
3.482497, 3.077791, 5.313207,
3.482497, -3.917619, -5.398343,
3.482497, -3.917619, 5.313207,
3.482497, 3.077791, -5.398343,
3.482497, 3.077791, 5.313207
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
var radius = 7.592913;
var distance = 33.78173;
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
mvMatrix.translate( -0.3792791, 0.4199138, 0.04256773 );
mvMatrix.scale( 1.322757, 1.173571, 0.7664257 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.78173);
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
Crotoxyphos<-read.table("Crotoxyphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Crotoxyphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Crotoxyphos' not found
```

```r
y<-Crotoxyphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Crotoxyphos' not found
```

```r
z<-Crotoxyphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Crotoxyphos' not found
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
-2.633554, 0.6016999, -2.67856, 0, 0, 1, 1, 1,
-2.622804, -0.6945999, -0.6872311, 1, 0, 0, 1, 1,
-2.5497, -1.462106, -1.130087, 1, 0, 0, 1, 1,
-2.53811, 0.1531473, -1.332971, 1, 0, 0, 1, 1,
-2.483486, -0.9926724, -0.4130804, 1, 0, 0, 1, 1,
-2.449212, 0.5902128, -0.5451142, 1, 0, 0, 1, 1,
-2.401917, 0.5216497, -1.503909, 0, 0, 0, 1, 1,
-2.292884, -0.7449235, -0.7827038, 0, 0, 0, 1, 1,
-2.292282, 0.3868144, -0.1606009, 0, 0, 0, 1, 1,
-2.258516, -0.2809621, -0.5228047, 0, 0, 0, 1, 1,
-2.236911, -1.294224, -2.833016, 0, 0, 0, 1, 1,
-2.223483, -0.1190787, -2.081969, 0, 0, 0, 1, 1,
-2.176616, -0.02445563, -0.1155856, 0, 0, 0, 1, 1,
-2.140478, 1.349782, -1.636052, 1, 1, 1, 1, 1,
-2.101759, -0.09515363, -1.505581, 1, 1, 1, 1, 1,
-2.089024, 0.0527599, -3.14319, 1, 1, 1, 1, 1,
-2.082601, -0.7498186, -1.277008, 1, 1, 1, 1, 1,
-2.054555, 1.753114, -0.4053228, 1, 1, 1, 1, 1,
-2.041712, 1.05852, -2.052842, 1, 1, 1, 1, 1,
-2.020489, 0.6908352, -2.003195, 1, 1, 1, 1, 1,
-2.003682, -0.4510018, 0.1211952, 1, 1, 1, 1, 1,
-1.971409, -0.3789092, -1.989022, 1, 1, 1, 1, 1,
-1.942924, -0.9493571, -1.595741, 1, 1, 1, 1, 1,
-1.917092, 1.164147, -2.417995, 1, 1, 1, 1, 1,
-1.900154, 0.1519979, -2.816191, 1, 1, 1, 1, 1,
-1.891997, -0.5725133, -2.862168, 1, 1, 1, 1, 1,
-1.887011, 0.7724841, -0.4013936, 1, 1, 1, 1, 1,
-1.881228, -0.1273994, -1.305668, 1, 1, 1, 1, 1,
-1.862678, 0.2464474, -1.441626, 0, 0, 1, 1, 1,
-1.852325, 0.1402043, -0.7384664, 1, 0, 0, 1, 1,
-1.844012, 0.4424099, -0.4989037, 1, 0, 0, 1, 1,
-1.84296, 0.9289799, -1.347911, 1, 0, 0, 1, 1,
-1.826294, -1.284073, -2.165097, 1, 0, 0, 1, 1,
-1.824464, 0.2517717, -1.903772, 1, 0, 0, 1, 1,
-1.82164, -1.513728, -2.902659, 0, 0, 0, 1, 1,
-1.821101, 1.589303, -2.499397, 0, 0, 0, 1, 1,
-1.817094, 2.927436, -0.8990501, 0, 0, 0, 1, 1,
-1.806585, -0.2641903, -1.613493, 0, 0, 0, 1, 1,
-1.800702, 0.4244759, -0.5459436, 0, 0, 0, 1, 1,
-1.784001, 0.24817, -1.340785, 0, 0, 0, 1, 1,
-1.762479, 1.274586, -1.393185, 0, 0, 0, 1, 1,
-1.751018, 0.1029292, -1.592771, 1, 1, 1, 1, 1,
-1.750322, -3.022332, -3.768716, 1, 1, 1, 1, 1,
-1.739635, -1.019257, -1.402658, 1, 1, 1, 1, 1,
-1.735822, 0.957815, -0.5828474, 1, 1, 1, 1, 1,
-1.72985, -1.253559, -2.913421, 1, 1, 1, 1, 1,
-1.724164, 0.5799789, -0.1677853, 1, 1, 1, 1, 1,
-1.711906, -0.3605347, -1.361418, 1, 1, 1, 1, 1,
-1.707453, 1.17412, -2.13384, 1, 1, 1, 1, 1,
-1.706377, -1.108337, -2.784763, 1, 1, 1, 1, 1,
-1.697289, -0.7872583, -3.004656, 1, 1, 1, 1, 1,
-1.683223, -0.2123972, -1.697623, 1, 1, 1, 1, 1,
-1.681027, 0.5821949, -1.3237, 1, 1, 1, 1, 1,
-1.670472, 0.4124202, -1.322201, 1, 1, 1, 1, 1,
-1.651103, 0.6065736, -1.906567, 1, 1, 1, 1, 1,
-1.64845, -1.960309, -2.627281, 1, 1, 1, 1, 1,
-1.641317, 0.898138, -0.219987, 0, 0, 1, 1, 1,
-1.632193, -1.030503, -0.7790904, 1, 0, 0, 1, 1,
-1.629175, 1.660146, -1.873211, 1, 0, 0, 1, 1,
-1.627236, -0.1151867, -4.273897, 1, 0, 0, 1, 1,
-1.621026, -0.5182787, -1.836639, 1, 0, 0, 1, 1,
-1.616736, 1.313676, -0.4926583, 1, 0, 0, 1, 1,
-1.616538, 0.5063583, -0.2610427, 0, 0, 0, 1, 1,
-1.612566, 0.965021, -2.068485, 0, 0, 0, 1, 1,
-1.588962, 0.1684254, -0.07027788, 0, 0, 0, 1, 1,
-1.560128, 0.003227595, -2.538664, 0, 0, 0, 1, 1,
-1.558094, 0.6264706, -1.042798, 0, 0, 0, 1, 1,
-1.555162, -0.3383504, -1.646607, 0, 0, 0, 1, 1,
-1.550628, 0.9606934, -0.895848, 0, 0, 0, 1, 1,
-1.52474, -0.02553729, -2.05081, 1, 1, 1, 1, 1,
-1.524731, 2.713829, -1.010184, 1, 1, 1, 1, 1,
-1.518437, -2.393644, -3.396376, 1, 1, 1, 1, 1,
-1.513352, -0.5977421, -1.312818, 1, 1, 1, 1, 1,
-1.512033, -0.438989, -3.278895, 1, 1, 1, 1, 1,
-1.510219, -0.4647636, -2.887073, 1, 1, 1, 1, 1,
-1.5095, 0.5119074, -1.536004, 1, 1, 1, 1, 1,
-1.507348, 0.8967046, 0.2187279, 1, 1, 1, 1, 1,
-1.505632, 1.267287, -0.7516607, 1, 1, 1, 1, 1,
-1.503778, 0.2862533, -2.430542, 1, 1, 1, 1, 1,
-1.492664, 0.121025, -1.937157, 1, 1, 1, 1, 1,
-1.490214, -0.3351913, -1.826377, 1, 1, 1, 1, 1,
-1.484988, 0.05864999, -1.842625, 1, 1, 1, 1, 1,
-1.484678, -1.057578, -2.569971, 1, 1, 1, 1, 1,
-1.480948, -1.35126, -2.657051, 1, 1, 1, 1, 1,
-1.480454, 0.08194411, -0.3290072, 0, 0, 1, 1, 1,
-1.472055, -0.4965437, -1.008312, 1, 0, 0, 1, 1,
-1.468125, -0.289662, -1.51112, 1, 0, 0, 1, 1,
-1.466191, 1.443902, -0.1194915, 1, 0, 0, 1, 1,
-1.462811, 0.2542987, -1.562954, 1, 0, 0, 1, 1,
-1.458822, 1.1138, -1.644884, 1, 0, 0, 1, 1,
-1.458131, -0.0990655, 0.2276655, 0, 0, 0, 1, 1,
-1.45373, 1.200737, 0.1403281, 0, 0, 0, 1, 1,
-1.442955, 0.4190538, -2.632254, 0, 0, 0, 1, 1,
-1.442805, -1.664641, -3.436467, 0, 0, 0, 1, 1,
-1.431416, 0.3316368, -2.012875, 0, 0, 0, 1, 1,
-1.427784, 1.444929, -0.773601, 0, 0, 0, 1, 1,
-1.425962, 0.555325, 0.3003974, 0, 0, 0, 1, 1,
-1.414613, 0.9965133, -2.065588, 1, 1, 1, 1, 1,
-1.401983, 0.6087433, -1.030728, 1, 1, 1, 1, 1,
-1.387664, -0.3216953, -2.65917, 1, 1, 1, 1, 1,
-1.37913, 0.3083642, -1.734195, 1, 1, 1, 1, 1,
-1.367112, 0.1471941, -0.3552019, 1, 1, 1, 1, 1,
-1.365133, -0.536503, -2.085642, 1, 1, 1, 1, 1,
-1.359683, -0.5462261, -0.8081918, 1, 1, 1, 1, 1,
-1.333124, -1.07423, -3.380633, 1, 1, 1, 1, 1,
-1.329619, 1.44906, -0.3613367, 1, 1, 1, 1, 1,
-1.325113, -0.2755952, -0.5186586, 1, 1, 1, 1, 1,
-1.319576, -1.286842, -1.906291, 1, 1, 1, 1, 1,
-1.31768, 2.23913, 1.135977, 1, 1, 1, 1, 1,
-1.317667, 1.730322, -0.03921998, 1, 1, 1, 1, 1,
-1.314159, -0.1643048, -1.393827, 1, 1, 1, 1, 1,
-1.309329, 0.6816985, -0.6205093, 1, 1, 1, 1, 1,
-1.300721, -0.1089398, -1.176117, 0, 0, 1, 1, 1,
-1.29682, -1.093766, -1.97103, 1, 0, 0, 1, 1,
-1.285616, -0.01050274, -0.237774, 1, 0, 0, 1, 1,
-1.271364, 0.2531399, -0.342109, 1, 0, 0, 1, 1,
-1.267171, -0.1071739, -1.406992, 1, 0, 0, 1, 1,
-1.264223, -0.4745744, -1.985107, 1, 0, 0, 1, 1,
-1.262848, 0.3013399, -1.751922, 0, 0, 0, 1, 1,
-1.261994, -0.8459424, -2.900664, 0, 0, 0, 1, 1,
-1.252772, 0.2088262, -0.155683, 0, 0, 0, 1, 1,
-1.240782, -1.461357, -1.680997, 0, 0, 0, 1, 1,
-1.224905, 0.7021795, -1.897167, 0, 0, 0, 1, 1,
-1.218236, -0.2376456, -1.092275, 0, 0, 0, 1, 1,
-1.213246, -0.5988116, -0.9162766, 0, 0, 0, 1, 1,
-1.206098, -2.017172, -1.717233, 1, 1, 1, 1, 1,
-1.204999, 0.2399117, -1.823286, 1, 1, 1, 1, 1,
-1.204782, -0.4322948, -0.4915473, 1, 1, 1, 1, 1,
-1.200263, -1.57958, -2.110037, 1, 1, 1, 1, 1,
-1.197889, 0.1026735, -1.845038, 1, 1, 1, 1, 1,
-1.192401, -1.942754, -3.774391, 1, 1, 1, 1, 1,
-1.184623, -1.580575, -3.123706, 1, 1, 1, 1, 1,
-1.182976, -1.607381, -2.47632, 1, 1, 1, 1, 1,
-1.167096, -0.1113598, -1.441999, 1, 1, 1, 1, 1,
-1.16271, -0.6925162, -1.791448, 1, 1, 1, 1, 1,
-1.158648, -0.2105152, -3.484545, 1, 1, 1, 1, 1,
-1.145335, -1.629508, -1.955465, 1, 1, 1, 1, 1,
-1.139955, -0.02457385, -1.961414, 1, 1, 1, 1, 1,
-1.129792, 0.7624046, -0.4177155, 1, 1, 1, 1, 1,
-1.126209, 0.3943389, -0.4489738, 1, 1, 1, 1, 1,
-1.120646, 0.5747999, -1.900602, 0, 0, 1, 1, 1,
-1.120286, 2.011853, -0.4234685, 1, 0, 0, 1, 1,
-1.111491, -0.09908569, 0.88925, 1, 0, 0, 1, 1,
-1.106615, 0.8250524, -0.9054367, 1, 0, 0, 1, 1,
-1.106192, -1.327062, -3.399768, 1, 0, 0, 1, 1,
-1.105111, -0.8860227, -1.323236, 1, 0, 0, 1, 1,
-1.088886, -1.606245, -1.46181, 0, 0, 0, 1, 1,
-1.087216, -0.9079068, -2.128895, 0, 0, 0, 1, 1,
-1.084039, -0.8288872, -2.757864, 0, 0, 0, 1, 1,
-1.083369, -1.033641, -1.609965, 0, 0, 0, 1, 1,
-1.078799, 0.2763614, 1.00429, 0, 0, 0, 1, 1,
-1.074619, -1.018523, -2.039232, 0, 0, 0, 1, 1,
-1.073832, 0.2158409, -2.924963, 0, 0, 0, 1, 1,
-1.070623, -0.1494274, -1.860014, 1, 1, 1, 1, 1,
-1.069661, -0.09751172, -2.846126, 1, 1, 1, 1, 1,
-1.0686, 0.9998009, -1.425509, 1, 1, 1, 1, 1,
-1.062556, 0.7587515, -2.338595, 1, 1, 1, 1, 1,
-1.061704, -0.9329235, -2.783737, 1, 1, 1, 1, 1,
-1.05177, -0.5995426, -4.295806, 1, 1, 1, 1, 1,
-1.049851, 0.008960149, -0.500601, 1, 1, 1, 1, 1,
-1.046795, -1.782613, -2.320727, 1, 1, 1, 1, 1,
-1.043712, 0.5333475, -0.952976, 1, 1, 1, 1, 1,
-1.039652, -0.8947305, -3.322885, 1, 1, 1, 1, 1,
-1.029782, -0.6139896, -1.470362, 1, 1, 1, 1, 1,
-1.028594, 0.6063322, -0.9486686, 1, 1, 1, 1, 1,
-1.024974, 0.2517076, 0.1115302, 1, 1, 1, 1, 1,
-1.016316, 0.2239511, -2.324309, 1, 1, 1, 1, 1,
-1.015634, -1.242327, -2.424083, 1, 1, 1, 1, 1,
-1.013615, 0.3376849, -8.792688e-05, 0, 0, 1, 1, 1,
-1.012491, -0.6790313, -2.201667, 1, 0, 0, 1, 1,
-1.012485, 1.506419, 1.110675, 1, 0, 0, 1, 1,
-1.009772, 0.1963621, -2.053129, 1, 0, 0, 1, 1,
-1.005705, 0.2349281, -1.293368, 1, 0, 0, 1, 1,
-0.9926963, 0.3911332, -1.558604, 1, 0, 0, 1, 1,
-0.9891759, -0.9236836, -0.7995395, 0, 0, 0, 1, 1,
-0.9891312, -1.235344, -1.323952, 0, 0, 0, 1, 1,
-0.9875582, 1.162982, -0.7582332, 0, 0, 0, 1, 1,
-0.9843271, -0.7129991, -0.5974374, 0, 0, 0, 1, 1,
-0.9842644, 0.3040981, -0.9410354, 0, 0, 0, 1, 1,
-0.9803032, 0.78243, -3.610715, 0, 0, 0, 1, 1,
-0.9755197, 0.5584834, -0.2292783, 0, 0, 0, 1, 1,
-0.9751687, 0.7094674, -1.272532, 1, 1, 1, 1, 1,
-0.9698025, 2.418224, 0.583889, 1, 1, 1, 1, 1,
-0.9675077, 1.34194, -1.009692, 1, 1, 1, 1, 1,
-0.961612, 1.366991, -0.9005065, 1, 1, 1, 1, 1,
-0.9607692, -0.2024636, -1.22086, 1, 1, 1, 1, 1,
-0.95887, 0.9486592, -1.62079, 1, 1, 1, 1, 1,
-0.9583352, 0.9254872, -0.1372507, 1, 1, 1, 1, 1,
-0.9561691, -1.380637, -2.298496, 1, 1, 1, 1, 1,
-0.9521462, -0.1283435, -1.710926, 1, 1, 1, 1, 1,
-0.9518815, -1.340772, -2.183368, 1, 1, 1, 1, 1,
-0.9517807, 0.3865335, -1.264406, 1, 1, 1, 1, 1,
-0.9490848, -0.3011482, -3.294446, 1, 1, 1, 1, 1,
-0.9427326, 0.7407123, -0.6316364, 1, 1, 1, 1, 1,
-0.9421196, 0.566771, 0.7536999, 1, 1, 1, 1, 1,
-0.9397481, 0.7417607, -1.053726, 1, 1, 1, 1, 1,
-0.9384187, -0.5053558, -3.277873, 0, 0, 1, 1, 1,
-0.9337284, -0.2171198, -0.9675144, 1, 0, 0, 1, 1,
-0.9314333, 0.9627606, 0.9215856, 1, 0, 0, 1, 1,
-0.930389, 1.320357, -0.9683247, 1, 0, 0, 1, 1,
-0.9259319, -0.9247825, -2.224032, 1, 0, 0, 1, 1,
-0.9234849, -1.058996, -2.922469, 1, 0, 0, 1, 1,
-0.9223968, 0.5642002, -2.115064, 0, 0, 0, 1, 1,
-0.9132048, 0.6513745, -0.236442, 0, 0, 0, 1, 1,
-0.902522, -0.6046168, -1.66418, 0, 0, 0, 1, 1,
-0.9024423, 0.7564011, 0.7769055, 0, 0, 0, 1, 1,
-0.8965692, -2.185237, -2.868876, 0, 0, 0, 1, 1,
-0.8826795, 1.99975, -1.535903, 0, 0, 0, 1, 1,
-0.8808013, -0.4212533, -1.036473, 0, 0, 0, 1, 1,
-0.8736378, -0.5283601, -2.708395, 1, 1, 1, 1, 1,
-0.8733783, 0.0274483, -0.7739826, 1, 1, 1, 1, 1,
-0.8696284, -0.1746589, -0.596862, 1, 1, 1, 1, 1,
-0.8692599, -0.07055803, -0.252803, 1, 1, 1, 1, 1,
-0.8642061, -1.521439, -0.1221503, 1, 1, 1, 1, 1,
-0.8595361, -0.6098103, -2.158803, 1, 1, 1, 1, 1,
-0.8589283, 1.06935, -1.469198, 1, 1, 1, 1, 1,
-0.8588111, 0.4529237, -1.697518, 1, 1, 1, 1, 1,
-0.8552778, -2.194191, -1.397378, 1, 1, 1, 1, 1,
-0.8546629, 0.2419873, 0.04381724, 1, 1, 1, 1, 1,
-0.849053, -0.4996648, -2.714095, 1, 1, 1, 1, 1,
-0.8454498, 0.1617973, -1.602831, 1, 1, 1, 1, 1,
-0.84439, 0.920685, -0.4271522, 1, 1, 1, 1, 1,
-0.8443556, 1.053936, 0.4704342, 1, 1, 1, 1, 1,
-0.8435469, -0.1818056, -1.320332, 1, 1, 1, 1, 1,
-0.8429459, -0.1168025, -1.332877, 0, 0, 1, 1, 1,
-0.8388534, -1.203908, -3.156264, 1, 0, 0, 1, 1,
-0.8378267, -0.0615126, -1.126268, 1, 0, 0, 1, 1,
-0.8354734, 0.1230004, -2.277031, 1, 0, 0, 1, 1,
-0.8243821, -0.5311714, -1.842936, 1, 0, 0, 1, 1,
-0.8159862, 1.256862, 0.4939444, 1, 0, 0, 1, 1,
-0.8153579, 0.6878305, -1.258376, 0, 0, 0, 1, 1,
-0.8135968, -0.4676014, -2.402189, 0, 0, 0, 1, 1,
-0.8130166, -0.7902995, -1.950071, 0, 0, 0, 1, 1,
-0.8121573, 0.4014503, -1.233464, 0, 0, 0, 1, 1,
-0.8092371, -0.9081327, -3.296718, 0, 0, 0, 1, 1,
-0.8061256, -0.4174084, -0.0911989, 0, 0, 0, 1, 1,
-0.8051502, -0.5859956, -1.777374, 0, 0, 0, 1, 1,
-0.8050023, -0.7911538, -1.678826, 1, 1, 1, 1, 1,
-0.8016292, 0.7773466, -0.3747388, 1, 1, 1, 1, 1,
-0.7997862, 0.3639033, -0.9557399, 1, 1, 1, 1, 1,
-0.7849318, -1.42364, -2.964618, 1, 1, 1, 1, 1,
-0.7826134, -1.720417, -3.146609, 1, 1, 1, 1, 1,
-0.7738378, -0.06677481, -3.194786, 1, 1, 1, 1, 1,
-0.7700644, 0.1466708, -0.7173591, 1, 1, 1, 1, 1,
-0.769505, -1.207352, -1.334533, 1, 1, 1, 1, 1,
-0.7642391, 1.508621, -0.5778233, 1, 1, 1, 1, 1,
-0.7625532, -1.014932, -3.990194, 1, 1, 1, 1, 1,
-0.7612797, -1.337405, -1.349981, 1, 1, 1, 1, 1,
-0.7610812, -0.6551222, -2.314133, 1, 1, 1, 1, 1,
-0.7549581, -0.5335071, -0.2800667, 1, 1, 1, 1, 1,
-0.7533035, 0.1843792, -2.714713, 1, 1, 1, 1, 1,
-0.7469223, 0.7997437, -0.5752741, 1, 1, 1, 1, 1,
-0.7407681, -0.07032111, -1.67383, 0, 0, 1, 1, 1,
-0.7290231, -1.799356, -1.748686, 1, 0, 0, 1, 1,
-0.7263773, 1.664714, 0.2330213, 1, 0, 0, 1, 1,
-0.7254037, -0.3880776, -3.873679, 1, 0, 0, 1, 1,
-0.7163515, -1.277003, -3.972395, 1, 0, 0, 1, 1,
-0.7089821, 0.001429081, -0.8161979, 1, 0, 0, 1, 1,
-0.7082166, -0.1893392, -3.251098, 0, 0, 0, 1, 1,
-0.7064303, -2.642947, -3.660694, 0, 0, 0, 1, 1,
-0.7059354, -0.34392, -1.170648, 0, 0, 0, 1, 1,
-0.7017897, 0.6159003, -2.115065, 0, 0, 0, 1, 1,
-0.7011767, 0.6555391, 0.2427953, 0, 0, 0, 1, 1,
-0.7010216, 2.419209, 1.020225, 0, 0, 0, 1, 1,
-0.7002888, -0.3957458, -0.6671361, 0, 0, 0, 1, 1,
-0.6990045, 0.1010732, 0.2164088, 1, 1, 1, 1, 1,
-0.6967536, 0.5283339, 0.2448319, 1, 1, 1, 1, 1,
-0.696665, 1.725249, -0.4479541, 1, 1, 1, 1, 1,
-0.6960081, -0.9681354, -2.201802, 1, 1, 1, 1, 1,
-0.6924549, 0.3194714, -0.5800391, 1, 1, 1, 1, 1,
-0.6915366, -0.3644979, -1.699095, 1, 1, 1, 1, 1,
-0.6914749, -0.8343248, -2.543863, 1, 1, 1, 1, 1,
-0.6893727, 1.084602, 1.394915, 1, 1, 1, 1, 1,
-0.6884318, 1.240932, 0.6349367, 1, 1, 1, 1, 1,
-0.6871777, -0.002197837, -1.984532, 1, 1, 1, 1, 1,
-0.6770748, 0.07259402, -1.632747, 1, 1, 1, 1, 1,
-0.6751975, -0.2422972, -2.159832, 1, 1, 1, 1, 1,
-0.6743482, 0.2715429, 0.4381515, 1, 1, 1, 1, 1,
-0.6736012, -0.04364458, -0.8751338, 1, 1, 1, 1, 1,
-0.672165, 0.08690555, 0.4949025, 1, 1, 1, 1, 1,
-0.6707544, -1.327603, -1.424065, 0, 0, 1, 1, 1,
-0.6704941, 0.2670703, -0.2075498, 1, 0, 0, 1, 1,
-0.6674089, 0.07360486, -1.354426, 1, 0, 0, 1, 1,
-0.6616505, -0.05395767, -2.019899, 1, 0, 0, 1, 1,
-0.657631, -0.2221838, -4.403603, 1, 0, 0, 1, 1,
-0.6567363, 0.7316978, -0.3829193, 1, 0, 0, 1, 1,
-0.6517546, 0.7074487, 0.2405018, 0, 0, 0, 1, 1,
-0.6500791, -0.8337733, -2.605968, 0, 0, 0, 1, 1,
-0.6464499, 2.082676, -0.137895, 0, 0, 0, 1, 1,
-0.6457504, 0.01608874, -3.366731, 0, 0, 0, 1, 1,
-0.644932, -0.8952894, -3.898641, 0, 0, 0, 1, 1,
-0.6407622, 0.9426413, -1.551239, 0, 0, 0, 1, 1,
-0.6322544, 1.124298, -0.1289889, 0, 0, 0, 1, 1,
-0.6315711, 1.373166, -1.050764, 1, 1, 1, 1, 1,
-0.6313073, -0.01326013, -0.1507432, 1, 1, 1, 1, 1,
-0.6276593, 0.4926284, 0.07468191, 1, 1, 1, 1, 1,
-0.6232918, -0.4001017, -2.79441, 1, 1, 1, 1, 1,
-0.617732, 0.6827084, -0.3723881, 1, 1, 1, 1, 1,
-0.6124619, -2.074618, -3.61056, 1, 1, 1, 1, 1,
-0.6121124, 0.2290539, -2.004749, 1, 1, 1, 1, 1,
-0.6058887, 1.417836, 2.857418, 1, 1, 1, 1, 1,
-0.6030388, -0.4130463, -4.379286, 1, 1, 1, 1, 1,
-0.6012048, -0.8906433, -2.090354, 1, 1, 1, 1, 1,
-0.5888646, 0.7007858, 0.5292642, 1, 1, 1, 1, 1,
-0.5857035, 0.4662754, -0.4076918, 1, 1, 1, 1, 1,
-0.5846535, -1.025194, -1.558891, 1, 1, 1, 1, 1,
-0.5839422, 0.6137526, -0.2346206, 1, 1, 1, 1, 1,
-0.5819876, -0.05318597, -1.606547, 1, 1, 1, 1, 1,
-0.5786018, 0.7401, 0.3739271, 0, 0, 1, 1, 1,
-0.5729921, 0.3099465, -0.9205981, 1, 0, 0, 1, 1,
-0.5727996, -2.067244, -4.221437, 1, 0, 0, 1, 1,
-0.5727802, 0.5272292, -1.505721, 1, 0, 0, 1, 1,
-0.5698615, 0.5512477, -0.0001874604, 1, 0, 0, 1, 1,
-0.5675737, 1.420837, 1.360208, 1, 0, 0, 1, 1,
-0.5580063, -0.8347159, -2.682154, 0, 0, 0, 1, 1,
-0.557597, -1.33996, -2.858946, 0, 0, 0, 1, 1,
-0.5575876, -0.6963282, 0.05690555, 0, 0, 0, 1, 1,
-0.556684, 0.5439038, -0.6952374, 0, 0, 0, 1, 1,
-0.5510846, -1.675935, -4.403105, 0, 0, 0, 1, 1,
-0.5494862, 0.03918401, -1.80891, 0, 0, 0, 1, 1,
-0.5486316, 1.015988, 0.1304034, 0, 0, 0, 1, 1,
-0.547736, 0.2780891, -1.504678, 1, 1, 1, 1, 1,
-0.5471377, -0.3207983, -3.044956, 1, 1, 1, 1, 1,
-0.543864, -0.04113032, -1.236498, 1, 1, 1, 1, 1,
-0.5438182, 0.6150676, -0.5087239, 1, 1, 1, 1, 1,
-0.5430755, 2.090995, -1.670385, 1, 1, 1, 1, 1,
-0.5427248, 1.532472, 1.286242, 1, 1, 1, 1, 1,
-0.5384943, 0.849902, -0.8632584, 1, 1, 1, 1, 1,
-0.5309734, -0.2400219, -2.205121, 1, 1, 1, 1, 1,
-0.5245449, -0.1530124, -0.9004179, 1, 1, 1, 1, 1,
-0.5194089, -0.1980813, -0.3827199, 1, 1, 1, 1, 1,
-0.5190738, 0.7804572, -1.419361, 1, 1, 1, 1, 1,
-0.5140497, 1.000931, -1.78838, 1, 1, 1, 1, 1,
-0.5116859, 0.3215048, -1.945459, 1, 1, 1, 1, 1,
-0.5107254, -1.195115, -1.669616, 1, 1, 1, 1, 1,
-0.5105959, -0.2515495, -1.582338, 1, 1, 1, 1, 1,
-0.505471, -1.761822, -2.964335, 0, 0, 1, 1, 1,
-0.5041125, 0.6075745, 1.069947, 1, 0, 0, 1, 1,
-0.5027727, 0.141726, -1.127683, 1, 0, 0, 1, 1,
-0.4980056, 1.019758, 0.09300899, 1, 0, 0, 1, 1,
-0.4965336, 0.1167062, -1.486997, 1, 0, 0, 1, 1,
-0.4956786, 1.436124, -1.494653, 1, 0, 0, 1, 1,
-0.4920773, 0.2131398, -1.516249, 0, 0, 0, 1, 1,
-0.4918534, 1.37251, -1.89693, 0, 0, 0, 1, 1,
-0.4903347, 1.453363, 0.1679519, 0, 0, 0, 1, 1,
-0.4882778, -0.06454164, -1.938227, 0, 0, 0, 1, 1,
-0.486209, -0.1655503, -1.532669, 0, 0, 0, 1, 1,
-0.4861871, -0.3430297, -2.779697, 0, 0, 0, 1, 1,
-0.4858355, -0.4899953, -1.212117, 0, 0, 0, 1, 1,
-0.4821691, -1.666735, -2.297886, 1, 1, 1, 1, 1,
-0.4792093, -0.6162449, -1.704679, 1, 1, 1, 1, 1,
-0.4778027, 1.207299, -0.5623643, 1, 1, 1, 1, 1,
-0.4754207, -0.2138106, -2.59326, 1, 1, 1, 1, 1,
-0.4736159, 1.218253, -1.04337, 1, 1, 1, 1, 1,
-0.472789, 0.1814714, -0.6153454, 1, 1, 1, 1, 1,
-0.4602501, -0.5719711, -2.020708, 1, 1, 1, 1, 1,
-0.4590088, 0.8742422, -1.07162, 1, 1, 1, 1, 1,
-0.4577729, -1.136062, -3.223288, 1, 1, 1, 1, 1,
-0.4556589, 1.025024, -0.4645646, 1, 1, 1, 1, 1,
-0.4553256, 1.147057, -1.776284, 1, 1, 1, 1, 1,
-0.451404, -1.276827, -3.034086, 1, 1, 1, 1, 1,
-0.4479301, -0.7940487, -3.341593, 1, 1, 1, 1, 1,
-0.4461705, 1.216074, -0.8927425, 1, 1, 1, 1, 1,
-0.4435528, 0.08581246, -3.09033, 1, 1, 1, 1, 1,
-0.442402, -1.742462, -2.876333, 0, 0, 1, 1, 1,
-0.440701, -0.5329918, -1.396966, 1, 0, 0, 1, 1,
-0.4358334, 0.3876491, -0.3053728, 1, 0, 0, 1, 1,
-0.4358325, 0.8707974, 0.5893513, 1, 0, 0, 1, 1,
-0.4355131, 0.3676314, 0.1709758, 1, 0, 0, 1, 1,
-0.4328954, 0.7116435, 0.328818, 1, 0, 0, 1, 1,
-0.4302391, 0.1729771, -1.511133, 0, 0, 0, 1, 1,
-0.430007, 0.3405883, -0.7794175, 0, 0, 0, 1, 1,
-0.4295147, -1.029798, -3.126391, 0, 0, 0, 1, 1,
-0.4243579, -0.7870829, -1.347018, 0, 0, 0, 1, 1,
-0.4227754, -0.6077532, -1.713356, 0, 0, 0, 1, 1,
-0.4113616, -3.815744, -2.241348, 0, 0, 0, 1, 1,
-0.4018138, 1.226695, 0.7504829, 0, 0, 0, 1, 1,
-0.3977245, 0.4869608, -0.35971, 1, 1, 1, 1, 1,
-0.3970219, -0.8368357, -2.089587, 1, 1, 1, 1, 1,
-0.393774, -0.5418446, -2.775842, 1, 1, 1, 1, 1,
-0.3900636, 0.8681343, 0.5731468, 1, 1, 1, 1, 1,
-0.3898812, -0.4078752, -2.632113, 1, 1, 1, 1, 1,
-0.3886367, -0.4995529, -3.219633, 1, 1, 1, 1, 1,
-0.3885884, -0.9902778, -1.409732, 1, 1, 1, 1, 1,
-0.3854109, 1.823548, 0.2137668, 1, 1, 1, 1, 1,
-0.3844883, -0.9404665, -2.280738, 1, 1, 1, 1, 1,
-0.3837426, -0.732589, -1.869648, 1, 1, 1, 1, 1,
-0.3824403, -0.7739037, -3.316841, 1, 1, 1, 1, 1,
-0.3821479, 0.7436289, -0.1492023, 1, 1, 1, 1, 1,
-0.3810832, -0.6658939, -3.44445, 1, 1, 1, 1, 1,
-0.3748661, 0.3418481, -1.064706, 1, 1, 1, 1, 1,
-0.3747801, 0.1132105, -1.090739, 1, 1, 1, 1, 1,
-0.3614158, 2.191472, -1.211898, 0, 0, 1, 1, 1,
-0.3607531, -0.6972624, -1.704476, 1, 0, 0, 1, 1,
-0.3583258, 0.1811479, -1.697214, 1, 0, 0, 1, 1,
-0.3557028, 0.9830642, -0.4206322, 1, 0, 0, 1, 1,
-0.3541736, 0.4901855, 0.2554002, 1, 0, 0, 1, 1,
-0.3482223, -0.6848717, -0.917783, 1, 0, 0, 1, 1,
-0.3477948, -0.2578471, -1.670762, 0, 0, 0, 1, 1,
-0.3440831, -1.363654, -2.245976, 0, 0, 0, 1, 1,
-0.3435037, -0.700829, -2.93637, 0, 0, 0, 1, 1,
-0.3417915, -0.2465595, -2.404573, 0, 0, 0, 1, 1,
-0.3402353, 0.05613106, -1.125187, 0, 0, 0, 1, 1,
-0.3351797, -0.7791644, -2.573734, 0, 0, 0, 1, 1,
-0.3339024, 0.8599757, 0.4626528, 0, 0, 0, 1, 1,
-0.3296867, -0.4756525, -2.213254, 1, 1, 1, 1, 1,
-0.3272536, 0.01619197, -2.340619, 1, 1, 1, 1, 1,
-0.321226, 0.07577227, -1.915166, 1, 1, 1, 1, 1,
-0.3206991, -0.4130279, -1.735508, 1, 1, 1, 1, 1,
-0.3182636, 1.621501, 0.2263182, 1, 1, 1, 1, 1,
-0.3143089, -0.9304518, -5.242349, 1, 1, 1, 1, 1,
-0.3133982, 0.8586496, -1.893363, 1, 1, 1, 1, 1,
-0.3112947, 1.048912, 0.4340802, 1, 1, 1, 1, 1,
-0.31095, 0.8188443, 0.498385, 1, 1, 1, 1, 1,
-0.3068994, -2.001084, -3.896021, 1, 1, 1, 1, 1,
-0.3033019, 0.4791934, -1.968864, 1, 1, 1, 1, 1,
-0.2981764, 0.3603544, -1.254194, 1, 1, 1, 1, 1,
-0.2979007, -1.537278, -1.969545, 1, 1, 1, 1, 1,
-0.2928912, -0.3826242, -4.018744, 1, 1, 1, 1, 1,
-0.2881382, -1.17824, -3.031211, 1, 1, 1, 1, 1,
-0.2880635, 0.4584349, -1.411769, 0, 0, 1, 1, 1,
-0.2832044, -1.89594, -3.689783, 1, 0, 0, 1, 1,
-0.2826777, -1.440212, -4.094452, 1, 0, 0, 1, 1,
-0.2746917, -2.178985, -4.171595, 1, 0, 0, 1, 1,
-0.274624, 1.166241, 0.03912679, 1, 0, 0, 1, 1,
-0.2658995, 0.05735488, -0.183225, 1, 0, 0, 1, 1,
-0.2614599, -0.2047831, -2.993671, 0, 0, 0, 1, 1,
-0.255027, 0.4796952, -0.3597881, 0, 0, 0, 1, 1,
-0.2508439, -0.8511122, -1.581269, 0, 0, 0, 1, 1,
-0.2500578, -0.8215999, 0.02037623, 0, 0, 0, 1, 1,
-0.2489071, 0.2750341, -1.446677, 0, 0, 0, 1, 1,
-0.243177, 0.5082501, -1.193534, 0, 0, 0, 1, 1,
-0.2402094, 1.02141, -0.8126099, 0, 0, 0, 1, 1,
-0.2384851, 0.4937988, -0.3315797, 1, 1, 1, 1, 1,
-0.232891, -0.01352531, -2.160195, 1, 1, 1, 1, 1,
-0.2290306, 0.5480857, -0.7199369, 1, 1, 1, 1, 1,
-0.2286906, -0.2572002, -2.467165, 1, 1, 1, 1, 1,
-0.2199239, -1.793684, -2.929131, 1, 1, 1, 1, 1,
-0.2184649, -0.1790001, -3.187007, 1, 1, 1, 1, 1,
-0.2168173, -1.034813, -2.246725, 1, 1, 1, 1, 1,
-0.21622, 2.125493, -0.9151842, 1, 1, 1, 1, 1,
-0.2151008, 0.3871085, 0.6069449, 1, 1, 1, 1, 1,
-0.2146353, 1.24596, 1.658603, 1, 1, 1, 1, 1,
-0.2127841, -1.65104, -2.915382, 1, 1, 1, 1, 1,
-0.2075144, -0.5707687, -1.864218, 1, 1, 1, 1, 1,
-0.2026372, -0.5620907, -3.085092, 1, 1, 1, 1, 1,
-0.1970675, 0.3276166, -0.2071849, 1, 1, 1, 1, 1,
-0.1967797, 1.207241, -0.7753064, 1, 1, 1, 1, 1,
-0.1886632, 0.07659922, -1.982857, 0, 0, 1, 1, 1,
-0.1882822, -0.8760129, -3.420237, 1, 0, 0, 1, 1,
-0.1840757, -0.338147, -2.18993, 1, 0, 0, 1, 1,
-0.1830906, -1.67338, -2.357308, 1, 0, 0, 1, 1,
-0.1796481, -1.307133, -3.780831, 1, 0, 0, 1, 1,
-0.1794857, -1.22609, -2.322843, 1, 0, 0, 1, 1,
-0.1746173, -1.506873, -0.5889372, 0, 0, 0, 1, 1,
-0.1710988, -0.06072075, -1.440391, 0, 0, 0, 1, 1,
-0.1707917, 1.079363, 1.24964, 0, 0, 0, 1, 1,
-0.1689972, 0.5935442, 0.2965227, 0, 0, 0, 1, 1,
-0.1677241, 0.5815558, 1.039596, 0, 0, 0, 1, 1,
-0.1672343, 1.689722, 0.2596694, 0, 0, 0, 1, 1,
-0.1645413, 0.7881567, 0.2142288, 0, 0, 0, 1, 1,
-0.1604848, -0.2432559, -2.005242, 1, 1, 1, 1, 1,
-0.156496, -0.2465962, -1.604233, 1, 1, 1, 1, 1,
-0.1539401, -1.514338, -3.258907, 1, 1, 1, 1, 1,
-0.1530462, 0.7749037, 0.3920318, 1, 1, 1, 1, 1,
-0.1506223, -1.073892, -1.683346, 1, 1, 1, 1, 1,
-0.1466451, -0.1728401, -3.323759, 1, 1, 1, 1, 1,
-0.1445875, 0.8960153, 0.6813937, 1, 1, 1, 1, 1,
-0.1442014, -1.317006, -2.359592, 1, 1, 1, 1, 1,
-0.138862, 0.8336899, -0.1337715, 1, 1, 1, 1, 1,
-0.1276518, 0.2796213, 1.099437, 1, 1, 1, 1, 1,
-0.1272012, 0.8253343, -0.09120286, 1, 1, 1, 1, 1,
-0.1205604, -0.5359932, -2.16861, 1, 1, 1, 1, 1,
-0.1188201, 1.247154, 2.769355, 1, 1, 1, 1, 1,
-0.1184999, -0.5255579, -3.827337, 1, 1, 1, 1, 1,
-0.1118697, 0.7857579, -0.2366515, 1, 1, 1, 1, 1,
-0.1083304, 0.770695, -0.5509114, 0, 0, 1, 1, 1,
-0.1075412, -0.7475957, -3.098897, 1, 0, 0, 1, 1,
-0.1026474, 1.017787, 0.9559975, 1, 0, 0, 1, 1,
-0.1008915, 0.3132529, -0.07201578, 1, 0, 0, 1, 1,
-0.1007018, 0.1789216, -1.856002, 1, 0, 0, 1, 1,
-0.100307, -1.221113, -4.026344, 1, 0, 0, 1, 1,
-0.09635998, 0.6963285, 2.201207, 0, 0, 0, 1, 1,
-0.09391838, 0.4181931, -1.676232, 0, 0, 0, 1, 1,
-0.09196328, -0.4200501, -1.995761, 0, 0, 0, 1, 1,
-0.09053282, -0.5486569, -3.760558, 0, 0, 0, 1, 1,
-0.08421402, -1.084406, -2.231847, 0, 0, 0, 1, 1,
-0.0808451, 0.7348492, -0.7045841, 0, 0, 0, 1, 1,
-0.075578, 1.358531, -1.053781, 0, 0, 0, 1, 1,
-0.07514385, 0.6200843, 0.3438002, 1, 1, 1, 1, 1,
-0.07347663, -0.33354, -3.683566, 1, 1, 1, 1, 1,
-0.07292292, -1.501083, -3.602693, 1, 1, 1, 1, 1,
-0.06955907, 0.3659489, 0.7236546, 1, 1, 1, 1, 1,
-0.06594551, -0.05704407, -2.810512, 1, 1, 1, 1, 1,
-0.06431603, 0.2808571, -1.081483, 1, 1, 1, 1, 1,
-0.06353636, 2.528713, 0.9266468, 1, 1, 1, 1, 1,
-0.05215819, 2.191103, -0.1998144, 1, 1, 1, 1, 1,
-0.04770983, -0.8734244, -1.139581, 1, 1, 1, 1, 1,
-0.04661639, -0.5254264, -3.005863, 1, 1, 1, 1, 1,
-0.04584428, -0.4042633, -2.054621, 1, 1, 1, 1, 1,
-0.04574373, -0.4422239, -3.428809, 1, 1, 1, 1, 1,
-0.04249374, -1.290982, -2.564976, 1, 1, 1, 1, 1,
-0.0387332, -1.246896, -4.404622, 1, 1, 1, 1, 1,
-0.03864029, -1.199189, -1.19228, 1, 1, 1, 1, 1,
-0.03718345, -0.6090053, -3.915109, 0, 0, 1, 1, 1,
-0.03506748, -0.9058405, -1.812344, 1, 0, 0, 1, 1,
-0.03502024, -0.3169491, -2.913258, 1, 0, 0, 1, 1,
-0.03420009, -1.546617, -3.172574, 1, 0, 0, 1, 1,
-0.03199258, -0.6212131, -4.518456, 1, 0, 0, 1, 1,
-0.03133241, 0.2075492, 1.819668, 1, 0, 0, 1, 1,
-0.02676362, -0.02575432, -3.566733, 0, 0, 0, 1, 1,
-0.02618143, -1.684475, -2.020542, 0, 0, 0, 1, 1,
-0.02310138, 1.559486, -1.078369, 0, 0, 0, 1, 1,
-0.02257813, 1.036651, 2.036256, 0, 0, 0, 1, 1,
-0.02009034, 0.8472846, 0.5342305, 0, 0, 0, 1, 1,
-0.01926447, 0.7810954, -0.9873695, 0, 0, 0, 1, 1,
-0.01845525, -1.770211, -4.441204, 0, 0, 0, 1, 1,
-0.01584823, -1.109916, -3.590732, 1, 1, 1, 1, 1,
-0.01491866, -1.173674, -3.484288, 1, 1, 1, 1, 1,
-0.01406139, -0.4473468, -2.810417, 1, 1, 1, 1, 1,
-0.01027994, 1.909592, 0.4667701, 1, 1, 1, 1, 1,
-0.009293744, -1.052357, -2.228827, 1, 1, 1, 1, 1,
-0.008305675, 0.9496702, 0.1282531, 1, 1, 1, 1, 1,
-0.00723922, 0.709648, -0.4887759, 1, 1, 1, 1, 1,
-0.002631437, 0.6377923, -0.3337128, 1, 1, 1, 1, 1,
-0.001987871, -0.5685927, -2.664866, 1, 1, 1, 1, 1,
-0.0007190183, -1.637898, -3.139771, 1, 1, 1, 1, 1,
0.0009245377, 0.905411, -0.9195876, 1, 1, 1, 1, 1,
0.00277846, -0.4749789, 0.8140236, 1, 1, 1, 1, 1,
0.002909307, -0.1357812, 3.236042, 1, 1, 1, 1, 1,
0.00355427, -0.05684124, 2.269632, 1, 1, 1, 1, 1,
0.01016208, 1.48779, -2.251922, 1, 1, 1, 1, 1,
0.01073525, 0.05974244, 0.8655293, 0, 0, 1, 1, 1,
0.0154905, -1.073993, 2.8377, 1, 0, 0, 1, 1,
0.01739207, 1.012066, -1.005082, 1, 0, 0, 1, 1,
0.02058523, -0.141528, 2.725141, 1, 0, 0, 1, 1,
0.02179663, 0.6124132, 1.602651, 1, 0, 0, 1, 1,
0.02557432, 0.9671394, -1.013181, 1, 0, 0, 1, 1,
0.025724, -0.4516466, 3.841571, 0, 0, 0, 1, 1,
0.02634005, 0.4809816, -0.1864654, 0, 0, 0, 1, 1,
0.02808004, 1.921193, 0.3365849, 0, 0, 0, 1, 1,
0.03226462, 1.642951, 0.1968593, 0, 0, 0, 1, 1,
0.03595522, 1.569441, -0.1317831, 0, 0, 0, 1, 1,
0.03800955, -0.5536609, 3.840895, 0, 0, 0, 1, 1,
0.04195902, 0.5618308, -0.06614398, 0, 0, 0, 1, 1,
0.050876, -0.2247129, 4.854178, 1, 1, 1, 1, 1,
0.05320815, 0.8960101, -0.1108246, 1, 1, 1, 1, 1,
0.05855735, 1.13282, 0.5059144, 1, 1, 1, 1, 1,
0.06123379, 0.8049433, 0.6243758, 1, 1, 1, 1, 1,
0.06763364, 0.2041741, 0.2923386, 1, 1, 1, 1, 1,
0.06832661, 0.8334692, 0.3594321, 1, 1, 1, 1, 1,
0.07251253, -0.08208515, 1.040623, 1, 1, 1, 1, 1,
0.07474564, -0.05481011, 2.806614, 1, 1, 1, 1, 1,
0.07774481, 0.2462876, 0.889901, 1, 1, 1, 1, 1,
0.081664, -0.1697011, 1.680655, 1, 1, 1, 1, 1,
0.0834061, -0.1959395, 2.425979, 1, 1, 1, 1, 1,
0.08804617, 0.1085127, 0.6247472, 1, 1, 1, 1, 1,
0.09386738, 1.461242, 0.7167605, 1, 1, 1, 1, 1,
0.09857011, -0.6980726, 2.201557, 1, 1, 1, 1, 1,
0.09892482, 2.861148, 1.704428, 1, 1, 1, 1, 1,
0.09931169, 1.457886, -0.8958865, 0, 0, 1, 1, 1,
0.1010761, 0.02672707, 0.9570611, 1, 0, 0, 1, 1,
0.102356, -0.8257475, 3.47074, 1, 0, 0, 1, 1,
0.1070265, -0.6909331, 3.941218, 1, 0, 0, 1, 1,
0.1136928, 2.268015, -0.4020429, 1, 0, 0, 1, 1,
0.1202579, -0.1921917, 2.338017, 1, 0, 0, 1, 1,
0.1209296, -0.7089584, 3.266509, 0, 0, 0, 1, 1,
0.1221747, -0.1902119, 2.25814, 0, 0, 0, 1, 1,
0.123562, -1.970168, 2.296596, 0, 0, 0, 1, 1,
0.1253496, -0.0007471587, 1.003704, 0, 0, 0, 1, 1,
0.129429, 2.307521, -0.02419276, 0, 0, 0, 1, 1,
0.1308722, -1.626418, 4.154726, 0, 0, 0, 1, 1,
0.1341672, 0.8235855, 1.314389, 0, 0, 0, 1, 1,
0.1464016, 0.4814951, -0.159408, 1, 1, 1, 1, 1,
0.148652, 0.04266763, 1.700833, 1, 1, 1, 1, 1,
0.1492464, 1.295987, 0.6080753, 1, 1, 1, 1, 1,
0.1495968, -1.831699, 1.554033, 1, 1, 1, 1, 1,
0.1499766, -0.463135, 2.863359, 1, 1, 1, 1, 1,
0.1504759, 1.276199, 0.2224644, 1, 1, 1, 1, 1,
0.1522923, 0.5786261, -0.8410009, 1, 1, 1, 1, 1,
0.1549575, 1.190077, -1.91368, 1, 1, 1, 1, 1,
0.1593381, -0.4552737, 3.464474, 1, 1, 1, 1, 1,
0.1607186, 0.3437385, -0.3550616, 1, 1, 1, 1, 1,
0.1625729, 0.1586382, 0.6656059, 1, 1, 1, 1, 1,
0.1628532, -1.285003, 2.13869, 1, 1, 1, 1, 1,
0.1634634, 2.465143, 0.8004403, 1, 1, 1, 1, 1,
0.1664188, -0.06014231, 2.110873, 1, 1, 1, 1, 1,
0.1725552, 0.513667, -1.341124, 1, 1, 1, 1, 1,
0.1727736, -0.4100775, 3.010875, 0, 0, 1, 1, 1,
0.1938076, -0.7339612, 5.143607, 1, 0, 0, 1, 1,
0.2000072, -0.3225849, 3.489714, 1, 0, 0, 1, 1,
0.2022133, 1.212004, -1.097914, 1, 0, 0, 1, 1,
0.2028729, 0.376577, 0.2526625, 1, 0, 0, 1, 1,
0.2040759, -0.6972749, 3.536549, 1, 0, 0, 1, 1,
0.2080642, -1.910384, 3.805701, 0, 0, 0, 1, 1,
0.2089998, 0.5226077, 1.046195, 0, 0, 0, 1, 1,
0.2116216, 0.8065569, 0.7425441, 0, 0, 0, 1, 1,
0.2119912, 1.678422, -0.9307376, 0, 0, 0, 1, 1,
0.2199565, 0.8854505, 1.794721, 0, 0, 0, 1, 1,
0.220053, 1.269868, -0.2653501, 0, 0, 0, 1, 1,
0.2209381, -0.6793727, 3.554968, 0, 0, 0, 1, 1,
0.2296373, -0.3254792, 3.152495, 1, 1, 1, 1, 1,
0.2371113, 1.533782, -1.391692, 1, 1, 1, 1, 1,
0.2401584, 0.4360279, 0.5526946, 1, 1, 1, 1, 1,
0.2439014, -1.725824, 2.471262, 1, 1, 1, 1, 1,
0.2461399, -0.6346942, 4.052092, 1, 1, 1, 1, 1,
0.2476338, 0.3008539, -0.7829461, 1, 1, 1, 1, 1,
0.2504491, -1.176947, 4.161206, 1, 1, 1, 1, 1,
0.2509665, -0.4867823, 2.866098, 1, 1, 1, 1, 1,
0.2525696, -0.6213492, 2.949666, 1, 1, 1, 1, 1,
0.2568753, 0.474429, -0.3244812, 1, 1, 1, 1, 1,
0.2577853, 1.652288, -0.3982869, 1, 1, 1, 1, 1,
0.2647875, -1.009168, 3.179827, 1, 1, 1, 1, 1,
0.2674008, -0.4378473, 3.607346, 1, 1, 1, 1, 1,
0.2685308, 2.193044, -1.466407, 1, 1, 1, 1, 1,
0.2757556, -0.1700522, 1.822086, 1, 1, 1, 1, 1,
0.2775452, -0.4871462, 2.247598, 0, 0, 1, 1, 1,
0.2775509, -0.01978127, 2.398619, 1, 0, 0, 1, 1,
0.2802179, -1.70883, 4.146054, 1, 0, 0, 1, 1,
0.2814056, 0.6272967, 0.9690367, 1, 0, 0, 1, 1,
0.2870376, -1.363753, 1.462844, 1, 0, 0, 1, 1,
0.2891379, -0.5189633, 4.422477, 1, 0, 0, 1, 1,
0.2899214, -0.5293587, 1.960497, 0, 0, 0, 1, 1,
0.2942634, 1.159612, 0.9161413, 0, 0, 0, 1, 1,
0.296345, -0.255998, 3.853047, 0, 0, 0, 1, 1,
0.2998971, -0.4039475, 2.215642, 0, 0, 0, 1, 1,
0.3042278, 1.216139, 0.6003792, 0, 0, 0, 1, 1,
0.3067254, -0.8335733, 2.452652, 0, 0, 0, 1, 1,
0.3069615, 1.53274, -0.5980508, 0, 0, 0, 1, 1,
0.310701, -1.730248, 1.330642, 1, 1, 1, 1, 1,
0.3110769, 0.07881598, 0.04863752, 1, 1, 1, 1, 1,
0.3155404, 0.1094079, 2.188599, 1, 1, 1, 1, 1,
0.3171866, 0.3474543, 1.762104, 1, 1, 1, 1, 1,
0.3198067, -0.7981009, 1.636866, 1, 1, 1, 1, 1,
0.3203598, 0.3539219, 0.5498216, 1, 1, 1, 1, 1,
0.3206523, -0.4527283, 0.609871, 1, 1, 1, 1, 1,
0.3227623, 0.4448549, 1.314423, 1, 1, 1, 1, 1,
0.3230467, -0.3705055, 3.198634, 1, 1, 1, 1, 1,
0.3240002, -1.137258, 3.67169, 1, 1, 1, 1, 1,
0.331545, -0.931158, 1.389055, 1, 1, 1, 1, 1,
0.3318044, -0.7173221, 2.574356, 1, 1, 1, 1, 1,
0.3341482, 0.5906022, 0.4997466, 1, 1, 1, 1, 1,
0.3352399, 1.279741, -1.695207, 1, 1, 1, 1, 1,
0.3396988, -0.2096968, 2.712894, 1, 1, 1, 1, 1,
0.3446201, -0.49244, 2.862495, 0, 0, 1, 1, 1,
0.3478056, 0.5644432, 1.045549, 1, 0, 0, 1, 1,
0.3549826, -0.5859069, 3.584468, 1, 0, 0, 1, 1,
0.3581357, 0.1135643, 1.765333, 1, 0, 0, 1, 1,
0.3583432, 0.5919464, 0.01562474, 1, 0, 0, 1, 1,
0.3611425, -1.433426, 1.469447, 1, 0, 0, 1, 1,
0.3631009, 0.7743303, 1.438037, 0, 0, 0, 1, 1,
0.3653217, -0.3834524, 2.923884, 0, 0, 0, 1, 1,
0.37369, 0.6989591, 0.8568195, 0, 0, 0, 1, 1,
0.3739444, -0.5557521, 3.512344, 0, 0, 0, 1, 1,
0.3862508, 0.781931, 0.2780176, 0, 0, 0, 1, 1,
0.3872851, 0.2801381, 1.022173, 0, 0, 0, 1, 1,
0.3884133, -0.6228175, 1.036178, 0, 0, 0, 1, 1,
0.3891811, -0.1900585, 1.447499, 1, 1, 1, 1, 1,
0.3896486, -0.1553518, 1.135932, 1, 1, 1, 1, 1,
0.3921541, 1.005184, -1.700659, 1, 1, 1, 1, 1,
0.393574, -0.3564141, 3.195232, 1, 1, 1, 1, 1,
0.3948139, -0.2853988, 1.834606, 1, 1, 1, 1, 1,
0.3965345, -1.867372, 3.042557, 1, 1, 1, 1, 1,
0.3967729, -1.536168, 3.668845, 1, 1, 1, 1, 1,
0.3975205, -0.3536473, 2.554612, 1, 1, 1, 1, 1,
0.4030504, -0.2660324, 1.836096, 1, 1, 1, 1, 1,
0.4033599, -0.0915615, 3.096894, 1, 1, 1, 1, 1,
0.4084329, 0.3936017, 0.01634705, 1, 1, 1, 1, 1,
0.4104016, 0.2970244, 0.5592521, 1, 1, 1, 1, 1,
0.4127044, 0.1269734, -0.5588283, 1, 1, 1, 1, 1,
0.4140936, -2.057473, 1.980948, 1, 1, 1, 1, 1,
0.4152552, 0.1070089, 0.8671227, 1, 1, 1, 1, 1,
0.4171003, 0.4955596, 2.066259, 0, 0, 1, 1, 1,
0.4202744, 1.712918, 0.08662859, 1, 0, 0, 1, 1,
0.4243937, 2.551098, 0.9359875, 1, 0, 0, 1, 1,
0.4255839, 0.3539441, 1.462579, 1, 0, 0, 1, 1,
0.427435, 0.7547735, 1.783486, 1, 0, 0, 1, 1,
0.4351224, -0.7610825, 1.132265, 1, 0, 0, 1, 1,
0.4404207, -1.024058, 2.850421, 0, 0, 0, 1, 1,
0.4432288, -2.080842, 2.661455, 0, 0, 0, 1, 1,
0.4470046, 1.444307, -1.043611, 0, 0, 0, 1, 1,
0.4477894, 0.3263187, 2.032085, 0, 0, 0, 1, 1,
0.4534389, 0.5885831, -0.7655019, 0, 0, 0, 1, 1,
0.4571972, 1.172092, -0.972351, 0, 0, 0, 1, 1,
0.4591529, 0.237638, 0.9240091, 0, 0, 0, 1, 1,
0.46319, 1.048431, 0.3044398, 1, 1, 1, 1, 1,
0.4683699, -0.5120573, 2.706021, 1, 1, 1, 1, 1,
0.4695268, -0.2385301, 3.815692, 1, 1, 1, 1, 1,
0.4703975, -2.150806, 2.884214, 1, 1, 1, 1, 1,
0.4729367, -0.854177, 4.591907, 1, 1, 1, 1, 1,
0.4751309, 0.001297679, 1.034292, 1, 1, 1, 1, 1,
0.4780366, 0.5521418, -0.2752811, 1, 1, 1, 1, 1,
0.4791291, -2.602374, 1.583724, 1, 1, 1, 1, 1,
0.4802484, -1.110501, 3.441672, 1, 1, 1, 1, 1,
0.4860389, -0.7764967, 1.953565, 1, 1, 1, 1, 1,
0.4881525, 0.7228781, 1.650122, 1, 1, 1, 1, 1,
0.5038262, 0.1199422, 1.744651, 1, 1, 1, 1, 1,
0.5067946, 1.810832, -1.473047, 1, 1, 1, 1, 1,
0.5080648, 1.239537, 1.096997, 1, 1, 1, 1, 1,
0.5093777, -0.8470346, 4.31423, 1, 1, 1, 1, 1,
0.5127827, 1.693166, 0.2646234, 0, 0, 1, 1, 1,
0.5165246, 0.5676146, 0.46547, 1, 0, 0, 1, 1,
0.5258216, -0.8013741, 1.954342, 1, 0, 0, 1, 1,
0.5322339, -2.057891, 5.157214, 1, 0, 0, 1, 1,
0.5361304, -0.3828414, 3.079309, 1, 0, 0, 1, 1,
0.5430591, -0.3453898, 3.07435, 1, 0, 0, 1, 1,
0.5461301, 0.6978853, 2.019698, 0, 0, 0, 1, 1,
0.5513659, -0.006282496, 0.9482391, 0, 0, 0, 1, 1,
0.554291, -0.754862, 1.381573, 0, 0, 0, 1, 1,
0.55653, 0.731903, 1.029398, 0, 0, 0, 1, 1,
0.5603791, 0.009350698, 0.2030536, 0, 0, 0, 1, 1,
0.5626888, -0.2529385, 2.350567, 0, 0, 0, 1, 1,
0.5640128, 0.218016, 3.01026, 0, 0, 0, 1, 1,
0.5647184, 0.8896844, 0.9131622, 1, 1, 1, 1, 1,
0.5688907, 0.8237028, 2.338307, 1, 1, 1, 1, 1,
0.5696639, 0.5145897, 1.038257, 1, 1, 1, 1, 1,
0.5706964, 0.9055612, 0.2884882, 1, 1, 1, 1, 1,
0.5723149, 0.1939483, 1.694358, 1, 1, 1, 1, 1,
0.5902901, -1.517043, 3.090443, 1, 1, 1, 1, 1,
0.5928433, 1.075379, -1.403719, 1, 1, 1, 1, 1,
0.5967522, 1.439551, 2.02526, 1, 1, 1, 1, 1,
0.5971631, -1.882363, 2.510221, 1, 1, 1, 1, 1,
0.5973527, 0.257685, 1.666763, 1, 1, 1, 1, 1,
0.5984243, -1.00481, 2.463233, 1, 1, 1, 1, 1,
0.6026909, 0.4293405, 1.596552, 1, 1, 1, 1, 1,
0.6026938, -2.39384, 1.542134, 1, 1, 1, 1, 1,
0.6078881, -0.2825174, 1.915488, 1, 1, 1, 1, 1,
0.6106483, -0.675962, 2.268296, 1, 1, 1, 1, 1,
0.6143882, -0.04531504, -0.4093727, 0, 0, 1, 1, 1,
0.6171026, 0.1195532, 0.3949386, 1, 0, 0, 1, 1,
0.6174595, -0.3549746, 0.8046677, 1, 0, 0, 1, 1,
0.6251372, 0.2746143, 1.712011, 1, 0, 0, 1, 1,
0.6266702, 0.492401, 0.1962856, 1, 0, 0, 1, 1,
0.6305695, -1.946452, 2.423215, 1, 0, 0, 1, 1,
0.6340247, -1.355767, 3.263094, 0, 0, 0, 1, 1,
0.6361454, -0.4004399, 2.781067, 0, 0, 0, 1, 1,
0.6415557, 0.3354099, -0.6201302, 0, 0, 0, 1, 1,
0.6446759, -1.582661, 2.021884, 0, 0, 0, 1, 1,
0.6448207, 1.846024, -1.03218, 0, 0, 0, 1, 1,
0.6451087, -1.318304, -0.1068865, 0, 0, 0, 1, 1,
0.6468784, -0.9111325, 4.167137, 0, 0, 0, 1, 1,
0.6476864, 1.112751, -1.298326, 1, 1, 1, 1, 1,
0.6487002, 0.2245978, -0.02932921, 1, 1, 1, 1, 1,
0.6507664, 0.8229986, -0.5622144, 1, 1, 1, 1, 1,
0.6598939, -1.119291, 2.28377, 1, 1, 1, 1, 1,
0.6603988, -1.148268, 4.246704, 1, 1, 1, 1, 1,
0.6620232, 0.3261595, 0.5214593, 1, 1, 1, 1, 1,
0.6621557, 0.02425769, 3.141218, 1, 1, 1, 1, 1,
0.6630417, -0.7086284, 0.3863467, 1, 1, 1, 1, 1,
0.6694993, -0.6772813, 2.662283, 1, 1, 1, 1, 1,
0.6698534, 0.5319898, 3.536234, 1, 1, 1, 1, 1,
0.672357, 0.05035461, 2.997089, 1, 1, 1, 1, 1,
0.673259, -0.1671346, 2.977386, 1, 1, 1, 1, 1,
0.6747717, -1.32946, 2.713641, 1, 1, 1, 1, 1,
0.6860139, 0.4017495, 0.8287206, 1, 1, 1, 1, 1,
0.693417, -0.2800333, 1.709638, 1, 1, 1, 1, 1,
0.6944602, 0.07444744, 1.701228, 0, 0, 1, 1, 1,
0.696197, -0.05824248, 1.800355, 1, 0, 0, 1, 1,
0.7054642, -0.3662749, 1.982074, 1, 0, 0, 1, 1,
0.7074304, -0.7920778, 2.171901, 1, 0, 0, 1, 1,
0.7074758, -0.9076975, 2.45913, 1, 0, 0, 1, 1,
0.7146158, -1.234682, 3.093381, 1, 0, 0, 1, 1,
0.7172727, -0.4626928, 3.049461, 0, 0, 0, 1, 1,
0.7189193, 0.2917328, 1.246364, 0, 0, 0, 1, 1,
0.7207891, -0.2237384, 0.3151371, 0, 0, 0, 1, 1,
0.7237314, -1.080188, 2.10171, 0, 0, 0, 1, 1,
0.7249711, -0.425438, 2.016531, 0, 0, 0, 1, 1,
0.7265004, 0.08446719, 3.06618, 0, 0, 0, 1, 1,
0.7281133, 0.7647839, 1.880246, 0, 0, 0, 1, 1,
0.7326046, -2.171347, 1.865248, 1, 1, 1, 1, 1,
0.7351413, -0.6957859, 3.542479, 1, 1, 1, 1, 1,
0.7443268, -0.3683081, 1.218878, 1, 1, 1, 1, 1,
0.7469381, 0.3740344, 2.40478, 1, 1, 1, 1, 1,
0.7510275, -0.01427053, 1.010869, 1, 1, 1, 1, 1,
0.7528107, -0.2256989, 1.986702, 1, 1, 1, 1, 1,
0.7604262, 0.1992612, 0.01478372, 1, 1, 1, 1, 1,
0.7632466, -0.505597, 4.231045, 1, 1, 1, 1, 1,
0.7671273, -1.431519, 1.367602, 1, 1, 1, 1, 1,
0.7746435, -0.1703316, 2.414575, 1, 1, 1, 1, 1,
0.7805482, 0.3857859, 2.19223, 1, 1, 1, 1, 1,
0.7871153, -0.3437739, 1.134276, 1, 1, 1, 1, 1,
0.7886441, -0.5049598, 2.526069, 1, 1, 1, 1, 1,
0.7919157, 0.2506391, 2.573635, 1, 1, 1, 1, 1,
0.7919617, 1.07129, 0.882452, 1, 1, 1, 1, 1,
0.7962763, 1.428082, -0.04511671, 0, 0, 1, 1, 1,
0.7992395, -1.324035, 3.211874, 1, 0, 0, 1, 1,
0.8023296, 0.2520972, 1.286365, 1, 0, 0, 1, 1,
0.805087, 0.7786552, 1.303273, 1, 0, 0, 1, 1,
0.8105594, 0.8643557, -0.1700475, 1, 0, 0, 1, 1,
0.8112187, 0.4578332, 0.1525347, 1, 0, 0, 1, 1,
0.8133203, -1.860149, 3.503233, 0, 0, 0, 1, 1,
0.814633, 0.739095, 1.163285, 0, 0, 0, 1, 1,
0.8199388, -2.087814, 2.56157, 0, 0, 0, 1, 1,
0.8226877, 0.6717571, 2.27872, 0, 0, 0, 1, 1,
0.8237671, 1.119045, -0.4954986, 0, 0, 0, 1, 1,
0.8238025, 1.240212, 1.278419, 0, 0, 0, 1, 1,
0.8266318, -0.7341361, 1.995708, 0, 0, 0, 1, 1,
0.8276927, -0.0795823, 0.2569735, 1, 1, 1, 1, 1,
0.8287935, 1.213384, 1.975206, 1, 1, 1, 1, 1,
0.8295389, -0.5640199, 3.404546, 1, 1, 1, 1, 1,
0.8308944, -0.2437267, 2.585605, 1, 1, 1, 1, 1,
0.8346775, 1.338812, 0.4314814, 1, 1, 1, 1, 1,
0.8355576, -0.1234167, 2.960989, 1, 1, 1, 1, 1,
0.8440093, -0.3088166, 1.687624, 1, 1, 1, 1, 1,
0.8466492, 0.6686095, 1.400344, 1, 1, 1, 1, 1,
0.8506038, 0.332558, 0.5530926, 1, 1, 1, 1, 1,
0.852405, -0.0820885, 0.4376825, 1, 1, 1, 1, 1,
0.8727106, -1.715367, 1.420672, 1, 1, 1, 1, 1,
0.878488, -0.07555724, 2.669658, 1, 1, 1, 1, 1,
0.8817588, 1.905599, -0.09289444, 1, 1, 1, 1, 1,
0.88208, -0.4216087, 1.762489, 1, 1, 1, 1, 1,
0.8825526, 0.8184282, 0.8241225, 1, 1, 1, 1, 1,
0.8826173, 0.006867241, 1.55014, 0, 0, 1, 1, 1,
0.8847794, -1.529698, 1.56637, 1, 0, 0, 1, 1,
0.8868393, 0.1122679, 1.52915, 1, 0, 0, 1, 1,
0.8899711, -2.251921, 2.874949, 1, 0, 0, 1, 1,
0.891967, -1.771902, 0.9885718, 1, 0, 0, 1, 1,
0.893993, 0.8482087, 1.549146, 1, 0, 0, 1, 1,
0.9075025, 0.9706196, -0.370237, 0, 0, 0, 1, 1,
0.9084467, -0.628274, 1.372131, 0, 0, 0, 1, 1,
0.9088265, 0.8949537, -0.004369863, 0, 0, 0, 1, 1,
0.9117782, 0.6314712, 1.317745, 0, 0, 0, 1, 1,
0.912041, -0.1018941, 2.232195, 0, 0, 0, 1, 1,
0.9129478, -0.9511494, 2.287517, 0, 0, 0, 1, 1,
0.9139737, -0.5744601, 2.447282, 0, 0, 0, 1, 1,
0.9248264, -0.2762219, 3.501421, 1, 1, 1, 1, 1,
0.926517, 1.437288, -0.9037154, 1, 1, 1, 1, 1,
0.9314822, 0.3644354, 0.7371838, 1, 1, 1, 1, 1,
0.9319877, 0.9808263, 1.635859, 1, 1, 1, 1, 1,
0.9324481, 0.2263311, 1.038608, 1, 1, 1, 1, 1,
0.9335477, 1.046328, 1.32283, 1, 1, 1, 1, 1,
0.9349308, 0.9234715, 3.460708, 1, 1, 1, 1, 1,
0.9356861, 1.367982, -1.208979, 1, 1, 1, 1, 1,
0.9360426, 0.3610981, 1.940981, 1, 1, 1, 1, 1,
0.9378964, 0.07218827, 2.130381, 1, 1, 1, 1, 1,
0.9440972, -0.1425551, 1.212475, 1, 1, 1, 1, 1,
0.950547, 1.539084, 2.497922, 1, 1, 1, 1, 1,
0.9505817, -0.6408974, 2.615921, 1, 1, 1, 1, 1,
0.9560177, -0.7187212, 1.819476, 1, 1, 1, 1, 1,
0.9560307, -0.4083155, 3.216745, 1, 1, 1, 1, 1,
0.9577614, -0.1776605, 1.616589, 0, 0, 1, 1, 1,
0.9769197, 0.2846715, 1.566685, 1, 0, 0, 1, 1,
0.9779512, 1.347166, 2.120633, 1, 0, 0, 1, 1,
0.9820446, -0.5168155, 2.210478, 1, 0, 0, 1, 1,
0.9828835, -0.710454, 2.246629, 1, 0, 0, 1, 1,
0.9878969, -0.6931941, 1.629585, 1, 0, 0, 1, 1,
0.9895626, 0.198341, 1.407584, 0, 0, 0, 1, 1,
0.9946032, -0.0334296, -0.5601511, 0, 0, 0, 1, 1,
1.003751, 2.406059, 0.2321339, 0, 0, 0, 1, 1,
1.005727, -0.2575788, 3.615703, 0, 0, 0, 1, 1,
1.006404, 0.4521351, 0.7435001, 0, 0, 0, 1, 1,
1.006859, 0.5238359, 1.165614, 0, 0, 0, 1, 1,
1.024936, 0.5778031, -0.9851969, 0, 0, 0, 1, 1,
1.027095, -0.5997164, 2.534393, 1, 1, 1, 1, 1,
1.035479, 0.2760856, 2.591572, 1, 1, 1, 1, 1,
1.038117, -0.08113836, 2.603241, 1, 1, 1, 1, 1,
1.049445, 0.5333978, 1.187762, 1, 1, 1, 1, 1,
1.049673, 0.9645714, 0.2578589, 1, 1, 1, 1, 1,
1.052658, 0.6520137, -1.548129, 1, 1, 1, 1, 1,
1.056091, -0.9040424, 3.025229, 1, 1, 1, 1, 1,
1.058608, -0.1022985, 0.9791296, 1, 1, 1, 1, 1,
1.061333, 0.7912861, 0.4397529, 1, 1, 1, 1, 1,
1.073835, 1.234202, 0.09289689, 1, 1, 1, 1, 1,
1.074611, 1.07241, 0.1286764, 1, 1, 1, 1, 1,
1.081643, -0.1006458, 0.8096831, 1, 1, 1, 1, 1,
1.083013, -0.4086167, 2.221414, 1, 1, 1, 1, 1,
1.088108, -0.1669762, 3.56533, 1, 1, 1, 1, 1,
1.092206, -0.2497111, 0.8929356, 1, 1, 1, 1, 1,
1.097408, -0.1955755, 3.62531, 0, 0, 1, 1, 1,
1.103092, 0.963007, 0.7843566, 1, 0, 0, 1, 1,
1.111317, -0.06029288, 3.030992, 1, 0, 0, 1, 1,
1.120261, -1.800598, 2.584573, 1, 0, 0, 1, 1,
1.12448, -0.6456715, 1.856307, 1, 0, 0, 1, 1,
1.129861, 1.465937, 1.596871, 1, 0, 0, 1, 1,
1.132089, 0.6244656, -0.8236529, 0, 0, 0, 1, 1,
1.134185, -0.2279007, 2.235678, 0, 0, 0, 1, 1,
1.142499, -0.446247, 1.562209, 0, 0, 0, 1, 1,
1.145383, -1.163045, 3.631484, 0, 0, 0, 1, 1,
1.145469, 2.121248, 1.0447, 0, 0, 0, 1, 1,
1.147378, -0.8416054, 3.352827, 0, 0, 0, 1, 1,
1.151603, -1.053891, 1.755516, 0, 0, 0, 1, 1,
1.15446, -0.4773244, 1.263977, 1, 1, 1, 1, 1,
1.155396, 0.07599682, 2.014654, 1, 1, 1, 1, 1,
1.159798, -1.563108, 2.778262, 1, 1, 1, 1, 1,
1.192981, -0.2216147, 0.4539214, 1, 1, 1, 1, 1,
1.193764, 1.191651, 0.8002853, 1, 1, 1, 1, 1,
1.196736, 1.018168, 0.6314962, 1, 1, 1, 1, 1,
1.205234, -0.5212886, 2.184935, 1, 1, 1, 1, 1,
1.219295, -1.640277, 1.222962, 1, 1, 1, 1, 1,
1.23086, -1.901079, 0.6677134, 1, 1, 1, 1, 1,
1.236241, 0.08061249, 2.014292, 1, 1, 1, 1, 1,
1.240229, -0.9295439, 1.848721, 1, 1, 1, 1, 1,
1.241735, 0.4645183, 2.016382, 1, 1, 1, 1, 1,
1.248181, -0.7738816, -0.3640948, 1, 1, 1, 1, 1,
1.256778, -1.800776, 1.024052, 1, 1, 1, 1, 1,
1.265645, -1.138755, 1.189552, 1, 1, 1, 1, 1,
1.275978, 0.7266274, 3.055395, 0, 0, 1, 1, 1,
1.27839, 0.1897982, 4.053912, 1, 0, 0, 1, 1,
1.299181, -1.940073, 2.819554, 1, 0, 0, 1, 1,
1.30274, 0.8059018, 1.36271, 1, 0, 0, 1, 1,
1.324267, 0.790603, 2.389166, 1, 0, 0, 1, 1,
1.32597, -0.4527236, 3.179799, 1, 0, 0, 1, 1,
1.334949, 2.293092, -0.2101302, 0, 0, 0, 1, 1,
1.345494, -0.92725, 2.549526, 0, 0, 0, 1, 1,
1.347336, 0.6897424, -0.5478499, 0, 0, 0, 1, 1,
1.347443, 0.9554241, 1.016798, 0, 0, 0, 1, 1,
1.362216, 0.3012044, 0.2459961, 0, 0, 0, 1, 1,
1.365257, -2.154843, 2.253794, 0, 0, 0, 1, 1,
1.366264, -1.765169, 0.3199325, 0, 0, 0, 1, 1,
1.37939, -0.2163484, 3.33568, 1, 1, 1, 1, 1,
1.380157, 0.2680264, 0.7495006, 1, 1, 1, 1, 1,
1.396497, 0.6842374, 1.223401, 1, 1, 1, 1, 1,
1.399738, -0.7747129, 0.8346766, 1, 1, 1, 1, 1,
1.408778, -1.98329, 4.397366, 1, 1, 1, 1, 1,
1.408781, -0.8608327, 1.364529, 1, 1, 1, 1, 1,
1.411698, 0.5252501, 1.539227, 1, 1, 1, 1, 1,
1.413489, -0.4538125, 0.8008232, 1, 1, 1, 1, 1,
1.415333, 0.3380007, 1.337552, 1, 1, 1, 1, 1,
1.418307, 0.8642037, -0.9583106, 1, 1, 1, 1, 1,
1.421894, -0.2378949, 1.435906, 1, 1, 1, 1, 1,
1.428468, -1.517784, 2.041437, 1, 1, 1, 1, 1,
1.428582, -0.0353237, 0.858268, 1, 1, 1, 1, 1,
1.428971, 0.6488621, 1.324398, 1, 1, 1, 1, 1,
1.429125, 1.134368, 0.1858699, 1, 1, 1, 1, 1,
1.442186, 0.9150451, 0.2123476, 0, 0, 1, 1, 1,
1.442799, 0.2122088, 0.07432265, 1, 0, 0, 1, 1,
1.444809, 0.8039161, -0.2619047, 1, 0, 0, 1, 1,
1.449118, 0.2031734, 2.327691, 1, 0, 0, 1, 1,
1.45268, -0.08493011, 1.58884, 1, 0, 0, 1, 1,
1.460848, 2.975916, 2.253768, 1, 0, 0, 1, 1,
1.480171, -1.359364, 0.6670088, 0, 0, 0, 1, 1,
1.487513, 0.9921898, 0.2635927, 0, 0, 0, 1, 1,
1.488433, 1.108689, 0.9966585, 0, 0, 0, 1, 1,
1.488671, 0.3575602, -0.1738991, 0, 0, 0, 1, 1,
1.491048, 0.3413549, 1.01364, 0, 0, 0, 1, 1,
1.496262, -0.9801509, 2.823285, 0, 0, 0, 1, 1,
1.504079, -0.5279565, 2.103241, 0, 0, 0, 1, 1,
1.504655, -0.1053347, 1.421861, 1, 1, 1, 1, 1,
1.510293, -0.5643098, 2.038357, 1, 1, 1, 1, 1,
1.511056, -0.07509458, 2.800835, 1, 1, 1, 1, 1,
1.511602, 0.3376682, 2.812121, 1, 1, 1, 1, 1,
1.513054, -0.873388, 2.016948, 1, 1, 1, 1, 1,
1.515966, -0.7815525, 1.660436, 1, 1, 1, 1, 1,
1.520991, 0.5152212, 0.5516912, 1, 1, 1, 1, 1,
1.522699, 1.580506, 1.630562, 1, 1, 1, 1, 1,
1.544907, -1.925853, 2.21928, 1, 1, 1, 1, 1,
1.551197, 1.662851, 0.8877545, 1, 1, 1, 1, 1,
1.551456, -1.775589, 1.037059, 1, 1, 1, 1, 1,
1.563197, 1.839532, 1.035123, 1, 1, 1, 1, 1,
1.582462, -0.6480368, 2.353601, 1, 1, 1, 1, 1,
1.587066, -2.808567, 2.414337, 1, 1, 1, 1, 1,
1.605817, 0.4450122, 1.886393, 1, 1, 1, 1, 1,
1.605823, -0.2922665, 1.635573, 0, 0, 1, 1, 1,
1.607348, -1.442619, 3.620712, 1, 0, 0, 1, 1,
1.640484, -0.5318803, 3.704391, 1, 0, 0, 1, 1,
1.65477, -0.7411677, 2.433149, 1, 0, 0, 1, 1,
1.661071, 0.2505924, 1.724446, 1, 0, 0, 1, 1,
1.662294, -2.011606, 2.418604, 1, 0, 0, 1, 1,
1.685095, 0.4616279, 3.188449, 0, 0, 0, 1, 1,
1.691252, -1.489205, 2.437183, 0, 0, 0, 1, 1,
1.693742, 2.125584, 0.8307009, 0, 0, 0, 1, 1,
1.711556, 0.03832318, -1.114313, 0, 0, 0, 1, 1,
1.717982, -0.05375976, 1.492753, 0, 0, 0, 1, 1,
1.721044, 0.2778855, 0.1528125, 0, 0, 0, 1, 1,
1.724816, -1.011251, 0.7723695, 0, 0, 0, 1, 1,
1.732642, 0.6607893, -0.9943911, 1, 1, 1, 1, 1,
1.739486, -1.592565, 4.768454, 1, 1, 1, 1, 1,
1.741332, -1.467768, 1.201544, 1, 1, 1, 1, 1,
1.748387, -0.4439026, 1.594981, 1, 1, 1, 1, 1,
1.756646, -1.047361, 1.80531, 1, 1, 1, 1, 1,
1.792753, -0.2134957, 2.705607, 1, 1, 1, 1, 1,
1.804571, -0.170098, 0.4519915, 1, 1, 1, 1, 1,
1.823708, -0.1479106, 1.920099, 1, 1, 1, 1, 1,
1.826251, 0.4173871, 1.949381, 1, 1, 1, 1, 1,
1.835121, 2.434916, 0.2338301, 1, 1, 1, 1, 1,
1.869705, -0.8014681, 3.001218, 1, 1, 1, 1, 1,
1.89574, -0.4122621, 1.396705, 1, 1, 1, 1, 1,
1.924262, -0.01953614, 1.768391, 1, 1, 1, 1, 1,
1.925456, -0.509988, 2.007063, 1, 1, 1, 1, 1,
1.964215, -0.7372404, 2.226181, 1, 1, 1, 1, 1,
1.980194, -0.8534213, 0.01145473, 0, 0, 1, 1, 1,
2.037726, -0.01655024, 4.00136, 1, 0, 0, 1, 1,
2.074174, 0.9474403, 2.613688, 1, 0, 0, 1, 1,
2.088825, 0.115831, 0.7311957, 1, 0, 0, 1, 1,
2.093047, -1.493899, 2.209728, 1, 0, 0, 1, 1,
2.10124, 1.396435, 1.146864, 1, 0, 0, 1, 1,
2.112262, 1.755096, 0.005505559, 0, 0, 0, 1, 1,
2.27382, 0.2309474, 1.171023, 0, 0, 0, 1, 1,
2.329947, -0.969679, 3.736963, 0, 0, 0, 1, 1,
2.372725, 0.9388619, 0.8931784, 0, 0, 0, 1, 1,
2.399126, -0.4358428, 0.777037, 0, 0, 0, 1, 1,
2.408586, -0.2267246, 2.058745, 0, 0, 0, 1, 1,
2.457768, 0.4209832, -0.8673169, 0, 0, 0, 1, 1,
2.720949, -0.2463836, 3.456974, 1, 1, 1, 1, 1,
2.828016, -0.4965875, 1.559832, 1, 1, 1, 1, 1,
2.941553, 0.0738089, 2.004122, 1, 1, 1, 1, 1,
3.024314, 1.374509, 1.677324, 1, 1, 1, 1, 1,
3.071394, -0.3569275, 4.513567, 1, 1, 1, 1, 1,
3.186699, 1.349365, 2.039288, 1, 1, 1, 1, 1,
3.392112, 1.117741, 0.2245499, 1, 1, 1, 1, 1
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
var radius = 9.453823;
var distance = 33.20615;
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
mvMatrix.translate( -0.3792793, 0.4199136, 0.04256773 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.20615);
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