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
-3.034689, 1.180038, -2.094579, 1, 0, 0, 1,
-2.710903, 0.1226767, -0.5507293, 1, 0.007843138, 0, 1,
-2.613547, 0.4350636, -0.1149292, 1, 0.01176471, 0, 1,
-2.592324, 0.4994828, -1.577465, 1, 0.01960784, 0, 1,
-2.496873, 0.707171, -2.573772, 1, 0.02352941, 0, 1,
-2.449193, -0.4380265, -3.240724, 1, 0.03137255, 0, 1,
-2.417121, -1.289528, -3.416642, 1, 0.03529412, 0, 1,
-2.399895, 0.1427891, -1.860034, 1, 0.04313726, 0, 1,
-2.343714, 0.4507984, 0.5147908, 1, 0.04705882, 0, 1,
-2.33028, 0.2568212, -1.715552, 1, 0.05490196, 0, 1,
-2.256551, -0.06209699, -0.5376534, 1, 0.05882353, 0, 1,
-2.217245, 1.72563, -0.6374484, 1, 0.06666667, 0, 1,
-2.188927, 0.4445955, -2.001656, 1, 0.07058824, 0, 1,
-2.158359, 0.9593408, -0.7151497, 1, 0.07843138, 0, 1,
-2.156021, -0.1245935, 0.884165, 1, 0.08235294, 0, 1,
-2.130193, 0.5018746, -1.972821, 1, 0.09019608, 0, 1,
-2.125048, -0.4464483, -1.372723, 1, 0.09411765, 0, 1,
-2.120416, -1.114025, 0.7527159, 1, 0.1019608, 0, 1,
-2.120009, 0.9435932, -1.573309, 1, 0.1098039, 0, 1,
-2.108398, 0.6246315, -0.7570002, 1, 0.1137255, 0, 1,
-2.105882, -0.9353506, -0.7114509, 1, 0.1215686, 0, 1,
-2.073673, -0.2380416, -2.729892, 1, 0.1254902, 0, 1,
-2.068336, -1.297865, -2.955958, 1, 0.1333333, 0, 1,
-2.05905, 1.013108, -0.7667719, 1, 0.1372549, 0, 1,
-2.055957, 0.09473296, -1.137271, 1, 0.145098, 0, 1,
-2.025941, 0.8417456, -0.8444851, 1, 0.1490196, 0, 1,
-1.987455, -1.429324, -3.632948, 1, 0.1568628, 0, 1,
-1.974766, -0.8185463, -2.501577, 1, 0.1607843, 0, 1,
-1.935365, -0.3203866, -1.765897, 1, 0.1686275, 0, 1,
-1.91982, -0.2876354, -2.043782, 1, 0.172549, 0, 1,
-1.890472, -0.07249748, -1.207408, 1, 0.1803922, 0, 1,
-1.884249, 0.5848186, -1.509546, 1, 0.1843137, 0, 1,
-1.882218, -0.7223731, -1.89428, 1, 0.1921569, 0, 1,
-1.862658, 0.7040828, -1.809041, 1, 0.1960784, 0, 1,
-1.854424, 0.115465, 0.1992677, 1, 0.2039216, 0, 1,
-1.838064, -0.3650448, -0.3836981, 1, 0.2117647, 0, 1,
-1.787145, -0.2682416, -1.482534, 1, 0.2156863, 0, 1,
-1.776155, 0.3725334, -1.985414, 1, 0.2235294, 0, 1,
-1.768584, -0.5605734, -1.163423, 1, 0.227451, 0, 1,
-1.755028, -0.4717876, -3.288604, 1, 0.2352941, 0, 1,
-1.728262, 1.785842, -1.554523, 1, 0.2392157, 0, 1,
-1.726457, -0.1724915, -0.2936065, 1, 0.2470588, 0, 1,
-1.710834, -0.04166324, -2.587015, 1, 0.2509804, 0, 1,
-1.704935, -0.9160002, -2.335488, 1, 0.2588235, 0, 1,
-1.697389, -0.2043188, -1.916308, 1, 0.2627451, 0, 1,
-1.693152, -0.2540708, -0.3843677, 1, 0.2705882, 0, 1,
-1.692847, -1.415629, -2.206232, 1, 0.2745098, 0, 1,
-1.66864, 0.679173, 0.05390338, 1, 0.282353, 0, 1,
-1.652993, 1.503448, -2.240621, 1, 0.2862745, 0, 1,
-1.64554, 2.127076, -1.314137, 1, 0.2941177, 0, 1,
-1.643649, 1.112129, -1.067094, 1, 0.3019608, 0, 1,
-1.635294, -0.3156984, -1.720669, 1, 0.3058824, 0, 1,
-1.613206, -0.9109784, -3.498319, 1, 0.3137255, 0, 1,
-1.597967, 0.87292, -0.2535339, 1, 0.3176471, 0, 1,
-1.59493, 0.2965039, -2.021777, 1, 0.3254902, 0, 1,
-1.580657, 1.063557, -1.429699, 1, 0.3294118, 0, 1,
-1.571878, 0.3373122, -0.3510898, 1, 0.3372549, 0, 1,
-1.566283, 0.6424623, -2.368152, 1, 0.3411765, 0, 1,
-1.561208, -0.0317604, -0.9907504, 1, 0.3490196, 0, 1,
-1.551224, -0.7867998, -3.227147, 1, 0.3529412, 0, 1,
-1.545248, -0.9422345, -1.684683, 1, 0.3607843, 0, 1,
-1.532954, -1.31562, -2.465094, 1, 0.3647059, 0, 1,
-1.528641, -0.5973671, -2.579559, 1, 0.372549, 0, 1,
-1.526458, -0.4883722, -2.364814, 1, 0.3764706, 0, 1,
-1.521301, -0.02362206, -2.433649, 1, 0.3843137, 0, 1,
-1.520502, 1.009634, -1.270055, 1, 0.3882353, 0, 1,
-1.509414, 0.9622791, -0.7599641, 1, 0.3960784, 0, 1,
-1.489813, 1.873309, -0.6447428, 1, 0.4039216, 0, 1,
-1.486316, 1.883298, -1.414406, 1, 0.4078431, 0, 1,
-1.464901, 0.9225357, -0.915364, 1, 0.4156863, 0, 1,
-1.451998, -0.597376, -3.396554, 1, 0.4196078, 0, 1,
-1.446335, 0.1578571, -2.472173, 1, 0.427451, 0, 1,
-1.441188, 0.1650777, -1.247558, 1, 0.4313726, 0, 1,
-1.432112, -0.437392, -1.549611, 1, 0.4392157, 0, 1,
-1.430896, 0.5266126, -1.750508, 1, 0.4431373, 0, 1,
-1.430183, 0.9739983, -0.1096357, 1, 0.4509804, 0, 1,
-1.426718, -0.005257613, -0.03623052, 1, 0.454902, 0, 1,
-1.424813, 0.2429588, 0.1890509, 1, 0.4627451, 0, 1,
-1.411417, 0.02615562, -1.688131, 1, 0.4666667, 0, 1,
-1.408508, 1.835157, -0.7287364, 1, 0.4745098, 0, 1,
-1.403421, -0.4838232, -1.603547, 1, 0.4784314, 0, 1,
-1.39525, 0.04922061, -3.412104, 1, 0.4862745, 0, 1,
-1.378689, -0.07960911, -2.151044, 1, 0.4901961, 0, 1,
-1.377772, -2.191459, -4.014638, 1, 0.4980392, 0, 1,
-1.356651, -0.1835347, -0.6821663, 1, 0.5058824, 0, 1,
-1.338119, -0.5010167, -2.51523, 1, 0.509804, 0, 1,
-1.335676, -0.1065278, -1.253052, 1, 0.5176471, 0, 1,
-1.313856, 0.1939792, 0.2113507, 1, 0.5215687, 0, 1,
-1.31343, -0.637031, -0.452477, 1, 0.5294118, 0, 1,
-1.309104, 0.02952288, -0.6066293, 1, 0.5333334, 0, 1,
-1.30223, 0.1936559, -0.3977983, 1, 0.5411765, 0, 1,
-1.288257, 1.164327, -0.1511705, 1, 0.5450981, 0, 1,
-1.287824, -0.6224701, -2.40062, 1, 0.5529412, 0, 1,
-1.286634, -1.918166, -4.359524, 1, 0.5568628, 0, 1,
-1.285843, 1.079224, -0.04211725, 1, 0.5647059, 0, 1,
-1.278324, -1.726384, -2.63157, 1, 0.5686275, 0, 1,
-1.276626, 0.2872922, 0.9899799, 1, 0.5764706, 0, 1,
-1.266763, -0.8179722, -1.693662, 1, 0.5803922, 0, 1,
-1.25401, -1.071334, -1.579006, 1, 0.5882353, 0, 1,
-1.24877, 1.030986, -3.045918, 1, 0.5921569, 0, 1,
-1.246299, 2.207884, -0.117499, 1, 0.6, 0, 1,
-1.226765, 2.548081, 0.5739202, 1, 0.6078432, 0, 1,
-1.223494, 0.3290231, -0.7215862, 1, 0.6117647, 0, 1,
-1.203879, 1.483893, -0.1336844, 1, 0.6196079, 0, 1,
-1.200294, -0.1164542, -0.2214522, 1, 0.6235294, 0, 1,
-1.196778, -1.646122, -1.981055, 1, 0.6313726, 0, 1,
-1.19609, 1.167461, -0.4856513, 1, 0.6352941, 0, 1,
-1.18407, -0.4630636, -2.529919, 1, 0.6431373, 0, 1,
-1.169981, 0.276594, -1.518899, 1, 0.6470588, 0, 1,
-1.166711, -0.376251, -1.651792, 1, 0.654902, 0, 1,
-1.162789, -0.536739, -1.744082, 1, 0.6588235, 0, 1,
-1.158803, -1.239307, -1.470681, 1, 0.6666667, 0, 1,
-1.153649, 1.16091, -3.135532, 1, 0.6705883, 0, 1,
-1.137153, -0.3591194, -2.952058, 1, 0.6784314, 0, 1,
-1.129256, 0.8378946, -1.833426, 1, 0.682353, 0, 1,
-1.12842, -0.9615545, -2.232762, 1, 0.6901961, 0, 1,
-1.122218, -1.453999, -1.780065, 1, 0.6941177, 0, 1,
-1.118357, 1.004526, -2.646401, 1, 0.7019608, 0, 1,
-1.11166, -1.780588, -2.437045, 1, 0.7098039, 0, 1,
-1.109156, 1.897711, -0.5297727, 1, 0.7137255, 0, 1,
-1.105316, 0.1951241, -1.872257, 1, 0.7215686, 0, 1,
-1.100937, 1.04086, -1.49878, 1, 0.7254902, 0, 1,
-1.097966, -1.48473, -2.83232, 1, 0.7333333, 0, 1,
-1.095148, -0.8924165, -1.668412, 1, 0.7372549, 0, 1,
-1.094918, -0.2737353, -1.331889, 1, 0.7450981, 0, 1,
-1.093034, -0.7161139, -2.623931, 1, 0.7490196, 0, 1,
-1.086589, -0.5984689, -3.692384, 1, 0.7568628, 0, 1,
-1.085136, -0.6548004, -2.183148, 1, 0.7607843, 0, 1,
-1.073722, 2.080374, -0.6966602, 1, 0.7686275, 0, 1,
-1.061944, 0.4598625, -0.4092546, 1, 0.772549, 0, 1,
-1.051152, -0.1355581, -1.691589, 1, 0.7803922, 0, 1,
-1.050317, -0.2884401, -2.279194, 1, 0.7843137, 0, 1,
-1.04818, 0.4865484, -0.8656463, 1, 0.7921569, 0, 1,
-1.043938, -0.6387047, 0.3452395, 1, 0.7960784, 0, 1,
-1.041809, -0.6114936, -2.440246, 1, 0.8039216, 0, 1,
-1.041693, -1.427378, -1.701603, 1, 0.8117647, 0, 1,
-1.039885, -0.2907737, -1.711633, 1, 0.8156863, 0, 1,
-1.03824, -0.8377003, -2.505333, 1, 0.8235294, 0, 1,
-1.037822, 1.023284, -1.445365, 1, 0.827451, 0, 1,
-1.025792, -0.6943486, -4.052813, 1, 0.8352941, 0, 1,
-1.025763, 1.295833, -1.078807, 1, 0.8392157, 0, 1,
-1.01133, 2.685747, -0.6742529, 1, 0.8470588, 0, 1,
-1.010216, 0.5097082, -2.419811, 1, 0.8509804, 0, 1,
-1.008243, 2.219687, -1.699311, 1, 0.8588235, 0, 1,
-1.00727, 0.0002834721, -0.3833544, 1, 0.8627451, 0, 1,
-0.9989442, 1.031076, -1.215765, 1, 0.8705882, 0, 1,
-0.998175, -1.435425, -2.389087, 1, 0.8745098, 0, 1,
-0.9881216, 0.7037364, 0.1620029, 1, 0.8823529, 0, 1,
-0.9863609, 0.7447618, 0.342422, 1, 0.8862745, 0, 1,
-0.9811185, 1.454486, -0.8447195, 1, 0.8941177, 0, 1,
-0.97972, 0.9901799, -0.03292464, 1, 0.8980392, 0, 1,
-0.9740558, 0.2120727, -1.887634, 1, 0.9058824, 0, 1,
-0.9723345, -1.56328, -1.209981, 1, 0.9137255, 0, 1,
-0.9703616, 0.4263983, -2.641298, 1, 0.9176471, 0, 1,
-0.9684597, 0.5831943, -2.136505, 1, 0.9254902, 0, 1,
-0.9655918, 0.3149276, -2.576269, 1, 0.9294118, 0, 1,
-0.964567, 0.4082557, -1.821716, 1, 0.9372549, 0, 1,
-0.964503, 0.6901381, 0.2771683, 1, 0.9411765, 0, 1,
-0.959231, -0.2393978, -1.138207, 1, 0.9490196, 0, 1,
-0.9585065, 0.7875921, -0.4717668, 1, 0.9529412, 0, 1,
-0.9444484, -0.1854324, -2.576244, 1, 0.9607843, 0, 1,
-0.9437309, 0.6562542, -1.88416, 1, 0.9647059, 0, 1,
-0.9405996, -0.3224598, 0.2044517, 1, 0.972549, 0, 1,
-0.9401894, 0.553831, -0.5258135, 1, 0.9764706, 0, 1,
-0.9297901, -0.375699, -1.65422, 1, 0.9843137, 0, 1,
-0.9263017, -0.2951765, -2.402052, 1, 0.9882353, 0, 1,
-0.9251556, 0.1363385, -0.9784855, 1, 0.9960784, 0, 1,
-0.919551, 0.2568694, -0.6751211, 0.9960784, 1, 0, 1,
-0.9159617, 0.7986535, -0.5402671, 0.9921569, 1, 0, 1,
-0.9135552, 0.6023881, -0.417714, 0.9843137, 1, 0, 1,
-0.9035074, 0.4842471, -0.3436024, 0.9803922, 1, 0, 1,
-0.899387, -0.8138325, -0.5867484, 0.972549, 1, 0, 1,
-0.8960564, 0.08740219, -1.486532, 0.9686275, 1, 0, 1,
-0.8955169, 0.08277339, -2.714044, 0.9607843, 1, 0, 1,
-0.8901992, 0.6759021, -1.082099, 0.9568627, 1, 0, 1,
-0.8758948, 0.2596694, -3.11326, 0.9490196, 1, 0, 1,
-0.8704889, 0.4871671, -0.08785666, 0.945098, 1, 0, 1,
-0.8628605, 0.07797863, -2.605139, 0.9372549, 1, 0, 1,
-0.8608, 0.8912587, -0.2271233, 0.9333333, 1, 0, 1,
-0.8607646, -1.007125, -2.944301, 0.9254902, 1, 0, 1,
-0.8597451, -0.1672075, -0.9313925, 0.9215686, 1, 0, 1,
-0.8585749, 0.09954928, -0.9721929, 0.9137255, 1, 0, 1,
-0.857046, -1.00036, -1.042889, 0.9098039, 1, 0, 1,
-0.8556752, -0.8178497, -1.245086, 0.9019608, 1, 0, 1,
-0.8519608, 1.082733, -1.109037, 0.8941177, 1, 0, 1,
-0.8480795, 1.084887, -0.7565507, 0.8901961, 1, 0, 1,
-0.8394969, -0.4113738, -1.872506, 0.8823529, 1, 0, 1,
-0.8377076, -0.05824772, -2.531292, 0.8784314, 1, 0, 1,
-0.8374596, -1.594743, -1.38019, 0.8705882, 1, 0, 1,
-0.836853, -0.09763106, -1.062396, 0.8666667, 1, 0, 1,
-0.8323696, -0.5636669, -1.333586, 0.8588235, 1, 0, 1,
-0.824982, 0.6031578, 0.1244267, 0.854902, 1, 0, 1,
-0.8228056, 0.8736515, -2.553196, 0.8470588, 1, 0, 1,
-0.8149676, -0.8589348, -2.018294, 0.8431373, 1, 0, 1,
-0.8126362, -0.973515, -2.232835, 0.8352941, 1, 0, 1,
-0.810125, 0.1508227, -2.73637, 0.8313726, 1, 0, 1,
-0.8090667, 0.4259257, -2.386835, 0.8235294, 1, 0, 1,
-0.8083698, 0.6396683, -1.261559, 0.8196079, 1, 0, 1,
-0.804542, -1.552134, -2.897316, 0.8117647, 1, 0, 1,
-0.8018678, 1.668773, -0.1221219, 0.8078431, 1, 0, 1,
-0.7993646, 0.7027583, 1.21539, 0.8, 1, 0, 1,
-0.7902561, 2.592194, 0.2291096, 0.7921569, 1, 0, 1,
-0.7849815, -0.2574807, -1.599024, 0.7882353, 1, 0, 1,
-0.7847766, 0.09331408, -2.644004, 0.7803922, 1, 0, 1,
-0.7819802, 1.556482, -0.2192539, 0.7764706, 1, 0, 1,
-0.780681, 1.318813, -0.5184694, 0.7686275, 1, 0, 1,
-0.7802315, 0.7280966, -1.492728, 0.7647059, 1, 0, 1,
-0.7777843, 0.1896364, -1.951928, 0.7568628, 1, 0, 1,
-0.7762382, 1.25273, -0.006977032, 0.7529412, 1, 0, 1,
-0.7757692, 1.136876, 0.01491426, 0.7450981, 1, 0, 1,
-0.7741359, -0.1623068, -4.243781, 0.7411765, 1, 0, 1,
-0.7695094, 0.7721918, 0.394162, 0.7333333, 1, 0, 1,
-0.7675427, 2.245904, -0.577539, 0.7294118, 1, 0, 1,
-0.7647457, 0.7497858, -1.323051, 0.7215686, 1, 0, 1,
-0.7644494, 1.466751, -1.391005, 0.7176471, 1, 0, 1,
-0.764012, 0.1393955, -0.02308739, 0.7098039, 1, 0, 1,
-0.7637961, -2.38268, -2.772429, 0.7058824, 1, 0, 1,
-0.7633651, -0.6594054, -1.630954, 0.6980392, 1, 0, 1,
-0.7630356, -1.171968, -2.302646, 0.6901961, 1, 0, 1,
-0.7569809, 0.23262, -2.499638, 0.6862745, 1, 0, 1,
-0.7517948, 0.6115404, -3.155874, 0.6784314, 1, 0, 1,
-0.7480716, -0.0737529, -1.591257, 0.6745098, 1, 0, 1,
-0.7417349, -1.065548, -1.58538, 0.6666667, 1, 0, 1,
-0.7388893, -0.1475595, -3.941365, 0.6627451, 1, 0, 1,
-0.7334322, -0.2783766, -3.554779, 0.654902, 1, 0, 1,
-0.7333227, -1.447794, -2.427103, 0.6509804, 1, 0, 1,
-0.7325043, 1.297674, -1.281392, 0.6431373, 1, 0, 1,
-0.730884, 0.6499832, -0.7918265, 0.6392157, 1, 0, 1,
-0.7260947, 0.9136384, -0.09180894, 0.6313726, 1, 0, 1,
-0.7253514, 0.4849377, -0.07297155, 0.627451, 1, 0, 1,
-0.7253386, -1.911579, -1.63558, 0.6196079, 1, 0, 1,
-0.7207839, 1.477855, -1.109604, 0.6156863, 1, 0, 1,
-0.7149568, 0.3250875, -2.579722, 0.6078432, 1, 0, 1,
-0.7141744, 0.08121744, -2.086247, 0.6039216, 1, 0, 1,
-0.7064377, -1.032899, -3.460418, 0.5960785, 1, 0, 1,
-0.7052165, -0.361823, -2.530516, 0.5882353, 1, 0, 1,
-0.7006027, 0.1225521, -0.1482584, 0.5843138, 1, 0, 1,
-0.6999762, -0.3614157, -0.6085721, 0.5764706, 1, 0, 1,
-0.6952705, -1.874619, -1.411503, 0.572549, 1, 0, 1,
-0.6904607, 0.4913779, -1.466074, 0.5647059, 1, 0, 1,
-0.6887282, 0.107648, -1.326382, 0.5607843, 1, 0, 1,
-0.6867821, -0.7258953, -2.477682, 0.5529412, 1, 0, 1,
-0.6855046, 0.437958, -1.798152, 0.5490196, 1, 0, 1,
-0.6815892, 1.846471, -1.207459, 0.5411765, 1, 0, 1,
-0.6810729, 2.297173, -2.054836, 0.5372549, 1, 0, 1,
-0.6809217, -0.315505, -1.509107, 0.5294118, 1, 0, 1,
-0.680193, 0.5232037, -0.05098037, 0.5254902, 1, 0, 1,
-0.6798933, -0.6191587, -2.523323, 0.5176471, 1, 0, 1,
-0.6772175, -0.00488343, -1.758808, 0.5137255, 1, 0, 1,
-0.6766921, 0.5271831, -1.359626, 0.5058824, 1, 0, 1,
-0.6723025, 1.283818, 0.3187789, 0.5019608, 1, 0, 1,
-0.6694608, -1.295832, -0.02653207, 0.4941176, 1, 0, 1,
-0.6694171, 0.07417862, -1.551195, 0.4862745, 1, 0, 1,
-0.6682547, -0.1966973, -1.131695, 0.4823529, 1, 0, 1,
-0.6673606, 0.6203685, -0.1132242, 0.4745098, 1, 0, 1,
-0.6642644, 0.2095017, -3.120099, 0.4705882, 1, 0, 1,
-0.6588345, 0.7312667, 0.8151113, 0.4627451, 1, 0, 1,
-0.6544386, 1.617436, 1.103066, 0.4588235, 1, 0, 1,
-0.6538746, -1.737511, -1.760652, 0.4509804, 1, 0, 1,
-0.6515827, 0.3250609, -1.426496, 0.4470588, 1, 0, 1,
-0.6512763, -1.114764, -5.144217, 0.4392157, 1, 0, 1,
-0.6435282, 1.427096, 1.28707, 0.4352941, 1, 0, 1,
-0.6383434, -1.355899, -4.068477, 0.427451, 1, 0, 1,
-0.6334967, -0.668389, -2.135966, 0.4235294, 1, 0, 1,
-0.6274186, -1.480688, -2.28279, 0.4156863, 1, 0, 1,
-0.6258728, -0.1784617, -2.187024, 0.4117647, 1, 0, 1,
-0.6257033, -0.5943654, -0.2298455, 0.4039216, 1, 0, 1,
-0.6254247, -0.5199685, -1.293697, 0.3960784, 1, 0, 1,
-0.6169186, 1.076401, 0.09238142, 0.3921569, 1, 0, 1,
-0.6156772, -1.01885, -2.239755, 0.3843137, 1, 0, 1,
-0.6149863, 0.1487279, -3.286103, 0.3803922, 1, 0, 1,
-0.6131334, -0.8320656, -1.819741, 0.372549, 1, 0, 1,
-0.6126493, -0.8628162, -2.302207, 0.3686275, 1, 0, 1,
-0.6112818, -1.303816, -2.033688, 0.3607843, 1, 0, 1,
-0.6091641, -0.1249318, -2.223982, 0.3568628, 1, 0, 1,
-0.6086908, -2.022668, -1.748691, 0.3490196, 1, 0, 1,
-0.6070787, 0.32664, -3.165752, 0.345098, 1, 0, 1,
-0.6057525, -1.317988, -2.415416, 0.3372549, 1, 0, 1,
-0.6044859, -1.033655, -2.071602, 0.3333333, 1, 0, 1,
-0.6012707, 0.4141421, -1.089147, 0.3254902, 1, 0, 1,
-0.5973067, 1.84496, 0.3680723, 0.3215686, 1, 0, 1,
-0.5958055, 0.6052856, -0.3257684, 0.3137255, 1, 0, 1,
-0.5923465, 1.207896, -1.119094, 0.3098039, 1, 0, 1,
-0.5911655, 1.390345, -2.255462, 0.3019608, 1, 0, 1,
-0.5814233, -0.8676979, -3.743974, 0.2941177, 1, 0, 1,
-0.5748879, -0.3890133, -2.990801, 0.2901961, 1, 0, 1,
-0.5731744, 0.9343044, -0.7173429, 0.282353, 1, 0, 1,
-0.5690631, -0.3842855, -2.166901, 0.2784314, 1, 0, 1,
-0.5619276, -0.09177838, -1.922654, 0.2705882, 1, 0, 1,
-0.5594961, 1.010735, -0.1793503, 0.2666667, 1, 0, 1,
-0.5593981, 0.4906221, -1.88133, 0.2588235, 1, 0, 1,
-0.5519378, -0.3602799, -1.330284, 0.254902, 1, 0, 1,
-0.551779, -0.161712, -2.405352, 0.2470588, 1, 0, 1,
-0.5483642, -0.4999089, -1.78105, 0.2431373, 1, 0, 1,
-0.5332799, 0.5860252, 0.9723008, 0.2352941, 1, 0, 1,
-0.5332065, -0.4642318, -2.984798, 0.2313726, 1, 0, 1,
-0.5272455, 0.6235964, -0.5843194, 0.2235294, 1, 0, 1,
-0.5263246, -0.8492169, -2.772236, 0.2196078, 1, 0, 1,
-0.524368, -1.959055, -1.37824, 0.2117647, 1, 0, 1,
-0.5151821, 0.01884715, -0.7149118, 0.2078431, 1, 0, 1,
-0.5135652, -0.334543, -1.332585, 0.2, 1, 0, 1,
-0.5084361, 1.031117, 0.4741351, 0.1921569, 1, 0, 1,
-0.5076882, -0.1794868, -1.558514, 0.1882353, 1, 0, 1,
-0.5059789, -0.07430783, -0.500815, 0.1803922, 1, 0, 1,
-0.5047148, 0.7085246, -1.921792, 0.1764706, 1, 0, 1,
-0.4930599, -0.1085823, -1.75476, 0.1686275, 1, 0, 1,
-0.4920231, -0.7466639, -2.866651, 0.1647059, 1, 0, 1,
-0.4877343, -0.6379967, -3.617715, 0.1568628, 1, 0, 1,
-0.4841844, -0.3611295, 0.3424061, 0.1529412, 1, 0, 1,
-0.4836357, -1.938618, -2.438724, 0.145098, 1, 0, 1,
-0.4720411, -1.211745, -1.218839, 0.1411765, 1, 0, 1,
-0.4713655, 0.1804837, 0.3010838, 0.1333333, 1, 0, 1,
-0.46755, 0.9472372, 0.1477327, 0.1294118, 1, 0, 1,
-0.4631082, 1.675595, -1.662494, 0.1215686, 1, 0, 1,
-0.4621915, -1.311439, -2.615578, 0.1176471, 1, 0, 1,
-0.4603806, 0.3232104, -0.1174814, 0.1098039, 1, 0, 1,
-0.4581312, 1.516193, 0.4936882, 0.1058824, 1, 0, 1,
-0.4486462, -1.532225, -4.005812, 0.09803922, 1, 0, 1,
-0.4378035, -0.8872267, -2.80029, 0.09019608, 1, 0, 1,
-0.425738, -0.7262803, -1.804572, 0.08627451, 1, 0, 1,
-0.4253521, -1.910575, -4.66306, 0.07843138, 1, 0, 1,
-0.4217139, -1.774194, -1.640555, 0.07450981, 1, 0, 1,
-0.4192639, 1.14688, -1.531519, 0.06666667, 1, 0, 1,
-0.4107253, -0.3636525, -2.085824, 0.0627451, 1, 0, 1,
-0.4087241, -0.8875958, -0.2974097, 0.05490196, 1, 0, 1,
-0.4086956, 0.5950518, -0.3645765, 0.05098039, 1, 0, 1,
-0.4061804, -0.3979014, -1.203337, 0.04313726, 1, 0, 1,
-0.4048398, -0.03131159, -1.126812, 0.03921569, 1, 0, 1,
-0.4039764, 0.2537316, -2.035968, 0.03137255, 1, 0, 1,
-0.402171, 0.310163, -1.513773, 0.02745098, 1, 0, 1,
-0.3970809, -1.311567, -2.133954, 0.01960784, 1, 0, 1,
-0.3918146, 0.02080143, -3.068928, 0.01568628, 1, 0, 1,
-0.3900495, 0.1276202, -1.263815, 0.007843138, 1, 0, 1,
-0.3870546, 2.196689, 0.3875762, 0.003921569, 1, 0, 1,
-0.3861828, 0.5398941, -1.644174, 0, 1, 0.003921569, 1,
-0.3847869, -0.7767534, -1.00154, 0, 1, 0.01176471, 1,
-0.3829536, 0.02274125, -2.755951, 0, 1, 0.01568628, 1,
-0.377111, 0.01703281, -0.8047209, 0, 1, 0.02352941, 1,
-0.3766616, -0.1088842, -1.237699, 0, 1, 0.02745098, 1,
-0.3756522, -1.131402, -2.36806, 0, 1, 0.03529412, 1,
-0.3688298, 1.216697, 1.310689, 0, 1, 0.03921569, 1,
-0.3667737, 0.05565057, -1.514492, 0, 1, 0.04705882, 1,
-0.3599673, -0.1782234, -3.957614, 0, 1, 0.05098039, 1,
-0.3577887, 0.3587725, -0.7427789, 0, 1, 0.05882353, 1,
-0.3567402, -0.9344471, -0.5722595, 0, 1, 0.0627451, 1,
-0.3545258, 0.5835568, -0.3806638, 0, 1, 0.07058824, 1,
-0.3514654, -0.04363138, -2.13203, 0, 1, 0.07450981, 1,
-0.3496321, 0.5261806, 0.6927847, 0, 1, 0.08235294, 1,
-0.3455081, -0.1952204, -2.70723, 0, 1, 0.08627451, 1,
-0.3435899, 0.2477493, -1.48755, 0, 1, 0.09411765, 1,
-0.3394304, 2.41949, -0.6492768, 0, 1, 0.1019608, 1,
-0.3389803, -0.8960231, -3.256092, 0, 1, 0.1058824, 1,
-0.3389708, 0.3232815, 0.03583018, 0, 1, 0.1137255, 1,
-0.330827, -0.4406593, -1.675816, 0, 1, 0.1176471, 1,
-0.329311, -1.064337, -2.240423, 0, 1, 0.1254902, 1,
-0.3264245, -1.112754, -2.615599, 0, 1, 0.1294118, 1,
-0.3252967, -0.616587, -2.941579, 0, 1, 0.1372549, 1,
-0.3226208, -0.4653529, -1.86396, 0, 1, 0.1411765, 1,
-0.3138111, -0.3346344, -1.934255, 0, 1, 0.1490196, 1,
-0.3137344, 0.2694265, -2.235476, 0, 1, 0.1529412, 1,
-0.3120721, 0.5649559, 1.315025, 0, 1, 0.1607843, 1,
-0.3106697, -1.140047, -5.78172, 0, 1, 0.1647059, 1,
-0.3103382, 1.926938, 0.3831496, 0, 1, 0.172549, 1,
-0.3081532, -0.804368, -2.667446, 0, 1, 0.1764706, 1,
-0.3049164, 0.2887006, -0.729377, 0, 1, 0.1843137, 1,
-0.3021707, -1.205369, -1.480628, 0, 1, 0.1882353, 1,
-0.2976441, -1.344779, -2.662648, 0, 1, 0.1960784, 1,
-0.2961968, 1.374177, 0.2105291, 0, 1, 0.2039216, 1,
-0.296167, 1.011199, -1.193845, 0, 1, 0.2078431, 1,
-0.2951328, -0.1459948, -2.21608, 0, 1, 0.2156863, 1,
-0.2910965, -0.2164737, -3.543763, 0, 1, 0.2196078, 1,
-0.288588, 1.055423, -0.54609, 0, 1, 0.227451, 1,
-0.2865179, -1.302786, -2.581892, 0, 1, 0.2313726, 1,
-0.282905, -0.6432794, -3.403383, 0, 1, 0.2392157, 1,
-0.2817717, 1.043032, 1.956801, 0, 1, 0.2431373, 1,
-0.2791039, -1.55511, -3.887628, 0, 1, 0.2509804, 1,
-0.2770982, -0.8792329, -3.423691, 0, 1, 0.254902, 1,
-0.2745528, 0.2950687, -0.09994337, 0, 1, 0.2627451, 1,
-0.274261, 0.1321265, -1.333423, 0, 1, 0.2666667, 1,
-0.2589086, -0.5295463, -2.211507, 0, 1, 0.2745098, 1,
-0.2573628, 1.492139, 0.4746871, 0, 1, 0.2784314, 1,
-0.2573411, 0.5274311, -0.1645982, 0, 1, 0.2862745, 1,
-0.2556443, 1.033545, -0.7785309, 0, 1, 0.2901961, 1,
-0.2506004, 0.02993077, -3.752858, 0, 1, 0.2980392, 1,
-0.2502363, -0.1208891, -1.450933, 0, 1, 0.3058824, 1,
-0.2414588, -0.05145669, -2.259909, 0, 1, 0.3098039, 1,
-0.2383669, -0.4414273, -3.198488, 0, 1, 0.3176471, 1,
-0.237082, 0.6148467, 0.589494, 0, 1, 0.3215686, 1,
-0.2310714, 0.2262826, 0.2937645, 0, 1, 0.3294118, 1,
-0.2238396, -0.4222568, -5.246687, 0, 1, 0.3333333, 1,
-0.2215575, 0.5473441, -0.5802693, 0, 1, 0.3411765, 1,
-0.2145485, -1.350142, -3.68469, 0, 1, 0.345098, 1,
-0.2135287, -0.06659074, -1.099569, 0, 1, 0.3529412, 1,
-0.2127804, 0.2017192, -0.1646366, 0, 1, 0.3568628, 1,
-0.2103395, 1.79314, 0.03450234, 0, 1, 0.3647059, 1,
-0.210262, -0.9007197, -4.084375, 0, 1, 0.3686275, 1,
-0.209064, -1.200907, -1.872971, 0, 1, 0.3764706, 1,
-0.201039, -0.0898729, -1.414084, 0, 1, 0.3803922, 1,
-0.1903977, -1.569625, -3.85899, 0, 1, 0.3882353, 1,
-0.1900319, -0.5543609, -3.498798, 0, 1, 0.3921569, 1,
-0.1865876, -3.093666, -3.292432, 0, 1, 0.4, 1,
-0.1833312, 1.005112, 0.3974898, 0, 1, 0.4078431, 1,
-0.17804, -0.1036874, -3.900859, 0, 1, 0.4117647, 1,
-0.1776152, 0.0686603, 0.8086033, 0, 1, 0.4196078, 1,
-0.1766596, -0.7427799, -3.406995, 0, 1, 0.4235294, 1,
-0.1762151, -0.392536, -2.305357, 0, 1, 0.4313726, 1,
-0.1760091, 0.9603523, 0.4811333, 0, 1, 0.4352941, 1,
-0.1710113, 1.648026, -0.5500857, 0, 1, 0.4431373, 1,
-0.1691606, -0.129366, -2.685687, 0, 1, 0.4470588, 1,
-0.1672775, -0.3210653, -2.013635, 0, 1, 0.454902, 1,
-0.164435, 0.902865, -1.684825, 0, 1, 0.4588235, 1,
-0.1642929, 1.215071, -0.6383747, 0, 1, 0.4666667, 1,
-0.1627804, -0.4441029, -3.061717, 0, 1, 0.4705882, 1,
-0.160986, -1.263215, -3.885896, 0, 1, 0.4784314, 1,
-0.1562536, 0.2445162, -1.484343, 0, 1, 0.4823529, 1,
-0.153945, 0.913888, 1.275643, 0, 1, 0.4901961, 1,
-0.1520399, -1.025493, -5.227245, 0, 1, 0.4941176, 1,
-0.1511349, -0.7809661, -0.179151, 0, 1, 0.5019608, 1,
-0.1476789, -1.103792, -2.431847, 0, 1, 0.509804, 1,
-0.1422302, -0.3152908, -3.662305, 0, 1, 0.5137255, 1,
-0.1384477, 0.2679979, -1.206508, 0, 1, 0.5215687, 1,
-0.1319353, 0.3195599, -0.554707, 0, 1, 0.5254902, 1,
-0.131206, -0.01025715, -2.444312, 0, 1, 0.5333334, 1,
-0.1289528, -1.159907, -3.169588, 0, 1, 0.5372549, 1,
-0.1270239, -3.250019, -2.459724, 0, 1, 0.5450981, 1,
-0.1262932, 1.19458, 0.2498478, 0, 1, 0.5490196, 1,
-0.1246563, -0.7131649, -4.064771, 0, 1, 0.5568628, 1,
-0.1240585, 0.5528598, 0.9279014, 0, 1, 0.5607843, 1,
-0.1227897, 0.526703, -1.165112, 0, 1, 0.5686275, 1,
-0.1218249, -0.1561465, -2.247443, 0, 1, 0.572549, 1,
-0.1212407, -1.02906, -1.247563, 0, 1, 0.5803922, 1,
-0.1195419, 0.05000173, -1.369132, 0, 1, 0.5843138, 1,
-0.114596, -0.2876655, -3.853577, 0, 1, 0.5921569, 1,
-0.1010589, -0.001470747, -0.305211, 0, 1, 0.5960785, 1,
-0.1004168, 0.8378709, -0.7271971, 0, 1, 0.6039216, 1,
-0.100209, 0.9119743, 0.6038764, 0, 1, 0.6117647, 1,
-0.09851547, -0.5523787, -3.401292, 0, 1, 0.6156863, 1,
-0.09755562, 1.732456, -1.137786, 0, 1, 0.6235294, 1,
-0.09296557, 0.6515762, -0.1593914, 0, 1, 0.627451, 1,
-0.08846813, -0.1450027, -2.773865, 0, 1, 0.6352941, 1,
-0.08400803, 0.756125, 0.6770266, 0, 1, 0.6392157, 1,
-0.08330943, 0.7673187, 0.5909581, 0, 1, 0.6470588, 1,
-0.07584466, 1.234122, -1.912664, 0, 1, 0.6509804, 1,
-0.07522727, -0.8415754, -2.187211, 0, 1, 0.6588235, 1,
-0.07383013, -0.3665098, -2.745308, 0, 1, 0.6627451, 1,
-0.06741552, -0.5834551, -3.886736, 0, 1, 0.6705883, 1,
-0.06340723, 1.681886, -0.537142, 0, 1, 0.6745098, 1,
-0.06213789, -1.040127, -4.124846, 0, 1, 0.682353, 1,
-0.05713296, -0.896696, -3.5961, 0, 1, 0.6862745, 1,
-0.04823368, -1.19263, -5.080425, 0, 1, 0.6941177, 1,
-0.04333674, 0.5828959, 0.4465852, 0, 1, 0.7019608, 1,
-0.0403566, -1.286092, -4.361786, 0, 1, 0.7058824, 1,
-0.03763228, 0.3860107, 0.7381094, 0, 1, 0.7137255, 1,
-0.03722012, -0.3093862, -1.879445, 0, 1, 0.7176471, 1,
-0.03707367, -0.3237536, -2.665979, 0, 1, 0.7254902, 1,
-0.03705367, 2.882574, 0.3193224, 0, 1, 0.7294118, 1,
-0.03038255, 0.7605315, 1.476709, 0, 1, 0.7372549, 1,
-0.02915847, -0.6304415, -2.51111, 0, 1, 0.7411765, 1,
-0.02457315, -0.09525348, -2.995396, 0, 1, 0.7490196, 1,
-0.02157965, -0.5007564, -3.250385, 0, 1, 0.7529412, 1,
-0.02153322, 0.3185197, -0.05663409, 0, 1, 0.7607843, 1,
-0.02102298, -1.2733, -1.841985, 0, 1, 0.7647059, 1,
-0.01945546, 0.4948671, 0.5330648, 0, 1, 0.772549, 1,
-0.01944038, -0.05048402, -2.977398, 0, 1, 0.7764706, 1,
-0.0163347, 0.9296863, 1.144502, 0, 1, 0.7843137, 1,
-0.01420813, -2.029246, -3.817394, 0, 1, 0.7882353, 1,
-0.01375498, 1.490381, -0.3554813, 0, 1, 0.7960784, 1,
-0.0132045, -0.4036393, -3.305745, 0, 1, 0.8039216, 1,
-0.01274103, 0.02101169, -1.224403, 0, 1, 0.8078431, 1,
-0.01045014, -0.0564843, -1.741878, 0, 1, 0.8156863, 1,
-0.00389468, -0.9587492, -2.785144, 0, 1, 0.8196079, 1,
-0.003453568, 0.4060992, 1.530329, 0, 1, 0.827451, 1,
-0.00319202, 0.4447704, 0.08582342, 0, 1, 0.8313726, 1,
-0.0016821, 0.1022691, -0.6532745, 0, 1, 0.8392157, 1,
-0.0005000018, -0.2881309, -1.709046, 0, 1, 0.8431373, 1,
0.0002742406, -0.09300704, 2.531228, 0, 1, 0.8509804, 1,
0.002489297, -0.8645375, 2.805831, 0, 1, 0.854902, 1,
0.005172744, 0.3964155, -0.6842918, 0, 1, 0.8627451, 1,
0.005696811, 0.1577048, 1.61154, 0, 1, 0.8666667, 1,
0.007431593, 0.1285228, 1.231895, 0, 1, 0.8745098, 1,
0.009854103, -0.7008359, 1.642898, 0, 1, 0.8784314, 1,
0.01346371, 0.3950307, 1.833864, 0, 1, 0.8862745, 1,
0.01372006, 1.331209, -0.8247275, 0, 1, 0.8901961, 1,
0.01442094, 1.60254, -0.2590134, 0, 1, 0.8980392, 1,
0.01633225, -0.070332, 4.240183, 0, 1, 0.9058824, 1,
0.02210739, -1.390748, 3.69308, 0, 1, 0.9098039, 1,
0.03032634, -0.414515, 1.140334, 0, 1, 0.9176471, 1,
0.03476322, -0.0365084, 2.523271, 0, 1, 0.9215686, 1,
0.0347744, -1.801856, 2.494343, 0, 1, 0.9294118, 1,
0.03521667, -1.025358, 0.5944431, 0, 1, 0.9333333, 1,
0.03588844, 0.02708966, 0.9969082, 0, 1, 0.9411765, 1,
0.03635611, 0.01698947, 1.040769, 0, 1, 0.945098, 1,
0.03797487, -0.09102822, 2.29862, 0, 1, 0.9529412, 1,
0.03984252, -0.3029981, 3.00255, 0, 1, 0.9568627, 1,
0.04291235, 0.03304498, 0.3079829, 0, 1, 0.9647059, 1,
0.0434721, -0.1445222, 1.684227, 0, 1, 0.9686275, 1,
0.04694644, 0.3903188, -0.1827788, 0, 1, 0.9764706, 1,
0.04700276, 0.04339872, -0.7628922, 0, 1, 0.9803922, 1,
0.04784071, 0.4404674, -0.4179715, 0, 1, 0.9882353, 1,
0.04812633, 1.492864, 1.919223, 0, 1, 0.9921569, 1,
0.0538165, 0.4532959, 0.2279084, 0, 1, 1, 1,
0.0552675, 1.261429, -0.1050671, 0, 0.9921569, 1, 1,
0.05681848, 0.130944, 0.6734318, 0, 0.9882353, 1, 1,
0.06005912, -0.07715172, 4.239139, 0, 0.9803922, 1, 1,
0.06586132, 0.4262742, -2.006291, 0, 0.9764706, 1, 1,
0.06611363, -0.6200274, 2.328112, 0, 0.9686275, 1, 1,
0.06898596, 0.5336978, -2.527613, 0, 0.9647059, 1, 1,
0.06913345, -0.02740766, 1.799505, 0, 0.9568627, 1, 1,
0.07121564, -0.1616666, 2.727696, 0, 0.9529412, 1, 1,
0.07335091, -0.3009022, 2.241848, 0, 0.945098, 1, 1,
0.07842983, -1.044032, 2.033055, 0, 0.9411765, 1, 1,
0.07849562, -0.8975823, 4.458531, 0, 0.9333333, 1, 1,
0.08151501, -0.3898807, 3.172831, 0, 0.9294118, 1, 1,
0.08284405, 1.144056, -2.281183, 0, 0.9215686, 1, 1,
0.0841434, 0.593743, 1.434282, 0, 0.9176471, 1, 1,
0.08561746, -0.02972883, 1.266635, 0, 0.9098039, 1, 1,
0.09326738, -1.060121, 3.258798, 0, 0.9058824, 1, 1,
0.1056206, -0.07096395, 0.3848821, 0, 0.8980392, 1, 1,
0.1072396, 1.020263, -1.043021, 0, 0.8901961, 1, 1,
0.1105518, -0.2057118, 2.122767, 0, 0.8862745, 1, 1,
0.1130543, 0.161391, -0.1049529, 0, 0.8784314, 1, 1,
0.1210995, -1.152669, 4.189006, 0, 0.8745098, 1, 1,
0.1213214, -0.1771844, 3.526704, 0, 0.8666667, 1, 1,
0.1231609, -0.001373781, 0.7480736, 0, 0.8627451, 1, 1,
0.1234546, -0.6452971, 1.082485, 0, 0.854902, 1, 1,
0.1269702, 1.099279, -0.3545355, 0, 0.8509804, 1, 1,
0.1324198, -0.09746693, 2.72212, 0, 0.8431373, 1, 1,
0.133942, 1.080659, -1.055784, 0, 0.8392157, 1, 1,
0.1412945, 1.537223, -0.5673231, 0, 0.8313726, 1, 1,
0.1414526, -1.114041, 3.016496, 0, 0.827451, 1, 1,
0.1437099, -0.7597348, 3.493569, 0, 0.8196079, 1, 1,
0.1502158, 1.997122, 0.8229752, 0, 0.8156863, 1, 1,
0.1511303, -0.6123133, 2.826923, 0, 0.8078431, 1, 1,
0.1516779, 0.8451894, 0.5169398, 0, 0.8039216, 1, 1,
0.1521541, -1.562593, 4.047868, 0, 0.7960784, 1, 1,
0.1599983, -0.626771, 3.661501, 0, 0.7882353, 1, 1,
0.1601447, 2.541959, -1.227002, 0, 0.7843137, 1, 1,
0.1615019, -0.3993941, 2.98504, 0, 0.7764706, 1, 1,
0.1661344, 0.8656762, 1.640826, 0, 0.772549, 1, 1,
0.1679917, 1.452891, -0.2896832, 0, 0.7647059, 1, 1,
0.1709116, 2.296934, 0.06601533, 0, 0.7607843, 1, 1,
0.1721879, -0.4991919, 1.596607, 0, 0.7529412, 1, 1,
0.1724392, 0.6202238, 0.640001, 0, 0.7490196, 1, 1,
0.1732454, -1.084722, 2.754254, 0, 0.7411765, 1, 1,
0.173448, 0.6946008, -0.6212661, 0, 0.7372549, 1, 1,
0.177319, -0.2718323, 1.908504, 0, 0.7294118, 1, 1,
0.1783035, 1.651598, 0.5245757, 0, 0.7254902, 1, 1,
0.1785279, 6.518199e-06, 1.186772, 0, 0.7176471, 1, 1,
0.1788978, -0.6522586, 1.994784, 0, 0.7137255, 1, 1,
0.1798937, 0.2932061, 2.314962, 0, 0.7058824, 1, 1,
0.1831173, 0.5828242, 0.9733493, 0, 0.6980392, 1, 1,
0.1831969, -0.2117405, 3.625818, 0, 0.6941177, 1, 1,
0.1861953, -0.8802352, 2.409239, 0, 0.6862745, 1, 1,
0.1862148, 0.8784522, 0.1919185, 0, 0.682353, 1, 1,
0.1870216, -0.2775275, 2.980199, 0, 0.6745098, 1, 1,
0.1911574, -1.019629, 3.913527, 0, 0.6705883, 1, 1,
0.1924573, 0.3916482, -0.4448908, 0, 0.6627451, 1, 1,
0.1929373, -0.372839, 2.082447, 0, 0.6588235, 1, 1,
0.1935202, -0.4466611, 1.821313, 0, 0.6509804, 1, 1,
0.1970912, -0.7530948, 2.916065, 0, 0.6470588, 1, 1,
0.2053237, -1.260134, 1.868665, 0, 0.6392157, 1, 1,
0.2073509, -0.5666242, 3.167127, 0, 0.6352941, 1, 1,
0.2076839, 0.1730736, -1.123356, 0, 0.627451, 1, 1,
0.2084156, -0.9479961, 4.178038, 0, 0.6235294, 1, 1,
0.2105057, -0.4137202, 1.221368, 0, 0.6156863, 1, 1,
0.2126555, -0.6080899, 2.798578, 0, 0.6117647, 1, 1,
0.2143241, -0.74971, 3.41644, 0, 0.6039216, 1, 1,
0.2176, -0.3060548, 0.8307599, 0, 0.5960785, 1, 1,
0.2184969, -0.9763739, 3.14848, 0, 0.5921569, 1, 1,
0.2271844, -0.01466822, 0.1700569, 0, 0.5843138, 1, 1,
0.2272936, -0.4591127, 1.516769, 0, 0.5803922, 1, 1,
0.237744, -0.7077304, 2.638666, 0, 0.572549, 1, 1,
0.2379652, -1.246055, 3.516479, 0, 0.5686275, 1, 1,
0.239539, -1.102316, 2.000821, 0, 0.5607843, 1, 1,
0.2418501, 0.5000651, -0.1348455, 0, 0.5568628, 1, 1,
0.2418895, -0.4998222, 2.314888, 0, 0.5490196, 1, 1,
0.243046, 0.7147099, 0.07918038, 0, 0.5450981, 1, 1,
0.2432132, 0.06959175, 2.259028, 0, 0.5372549, 1, 1,
0.2433999, 0.007183826, 2.050946, 0, 0.5333334, 1, 1,
0.2452023, -0.2431577, 2.609962, 0, 0.5254902, 1, 1,
0.2476338, 1.957007, -1.211613, 0, 0.5215687, 1, 1,
0.2518525, -1.363639, 2.393359, 0, 0.5137255, 1, 1,
0.2576395, 0.9596542, -0.9689709, 0, 0.509804, 1, 1,
0.2643312, 0.6278568, 0.5450011, 0, 0.5019608, 1, 1,
0.2662362, -1.87707, 4.016707, 0, 0.4941176, 1, 1,
0.266556, -2.052416, 2.135526, 0, 0.4901961, 1, 1,
0.2669003, -0.6184972, 1.788113, 0, 0.4823529, 1, 1,
0.2680848, -0.8641927, 4.042391, 0, 0.4784314, 1, 1,
0.2690532, 0.01213574, 2.272295, 0, 0.4705882, 1, 1,
0.2702749, -1.505647, 2.130251, 0, 0.4666667, 1, 1,
0.2728555, 0.9598275, 0.02138122, 0, 0.4588235, 1, 1,
0.278508, 1.770662, -1.0956, 0, 0.454902, 1, 1,
0.2796283, 0.5750511, -0.3081984, 0, 0.4470588, 1, 1,
0.2799986, 0.196735, 0.4221757, 0, 0.4431373, 1, 1,
0.2841044, 0.5383319, 0.4545053, 0, 0.4352941, 1, 1,
0.2851624, -0.01598785, 1.089611, 0, 0.4313726, 1, 1,
0.2855608, -3.516646, 1.615764, 0, 0.4235294, 1, 1,
0.2872088, -1.20756, 2.509381, 0, 0.4196078, 1, 1,
0.2896008, 1.486275, 1.753516, 0, 0.4117647, 1, 1,
0.2966987, 0.7717482, 0.4686055, 0, 0.4078431, 1, 1,
0.297792, 1.408749, 0.6800917, 0, 0.4, 1, 1,
0.3003368, 0.2757497, 0.9471799, 0, 0.3921569, 1, 1,
0.3029522, 0.5645294, 0.1082541, 0, 0.3882353, 1, 1,
0.3036901, -1.760424, 1.833991, 0, 0.3803922, 1, 1,
0.3102855, 0.5135333, 1.158007, 0, 0.3764706, 1, 1,
0.314962, -0.9763149, 2.436999, 0, 0.3686275, 1, 1,
0.3170008, 0.2736211, 0.3022288, 0, 0.3647059, 1, 1,
0.3216765, 0.895483, 0.422192, 0, 0.3568628, 1, 1,
0.3239996, 0.2646439, 1.101554, 0, 0.3529412, 1, 1,
0.3254382, -1.793041, 3.477091, 0, 0.345098, 1, 1,
0.3331132, -1.319448, 1.709027, 0, 0.3411765, 1, 1,
0.334786, -0.44893, 1.531107, 0, 0.3333333, 1, 1,
0.336399, -0.5445394, 4.874414, 0, 0.3294118, 1, 1,
0.340136, 0.03193378, 1.172665, 0, 0.3215686, 1, 1,
0.3407354, -1.428767, 1.939922, 0, 0.3176471, 1, 1,
0.3512425, -0.5169199, 2.544278, 0, 0.3098039, 1, 1,
0.3568213, -0.1995652, 2.895012, 0, 0.3058824, 1, 1,
0.3589493, -0.002268748, 4.474272, 0, 0.2980392, 1, 1,
0.3597675, 0.7364626, 0.5851275, 0, 0.2901961, 1, 1,
0.3604289, 0.0537811, 0.8613487, 0, 0.2862745, 1, 1,
0.3618751, 0.2315954, 1.32829, 0, 0.2784314, 1, 1,
0.3631455, -0.2400772, 2.081535, 0, 0.2745098, 1, 1,
0.3645577, -0.3922376, 1.623343, 0, 0.2666667, 1, 1,
0.3695567, -1.495068, 4.556708, 0, 0.2627451, 1, 1,
0.3769591, 0.4144758, 2.422707, 0, 0.254902, 1, 1,
0.3770625, 0.6064013, 1.887769, 0, 0.2509804, 1, 1,
0.3805582, 0.4945533, 1.289842, 0, 0.2431373, 1, 1,
0.3852372, 1.843974, -1.490906, 0, 0.2392157, 1, 1,
0.3852834, -0.3718398, 1.810155, 0, 0.2313726, 1, 1,
0.3854938, -1.978091, 2.985368, 0, 0.227451, 1, 1,
0.3858019, 0.7701976, 1.525814, 0, 0.2196078, 1, 1,
0.3872066, -0.3160926, 2.45211, 0, 0.2156863, 1, 1,
0.387487, -0.9308828, 3.260157, 0, 0.2078431, 1, 1,
0.3899285, -0.3126616, 1.192171, 0, 0.2039216, 1, 1,
0.3923781, 1.226112, 1.194126, 0, 0.1960784, 1, 1,
0.3925605, 1.902986, 1.744256, 0, 0.1882353, 1, 1,
0.3978245, 0.1154381, 0.02104446, 0, 0.1843137, 1, 1,
0.3988863, -1.410071, 3.378657, 0, 0.1764706, 1, 1,
0.4010826, 0.524947, 1.550257, 0, 0.172549, 1, 1,
0.4016217, 0.2052912, 3.074982, 0, 0.1647059, 1, 1,
0.4026909, 0.5295789, -0.0527119, 0, 0.1607843, 1, 1,
0.40563, -1.151144, 2.770108, 0, 0.1529412, 1, 1,
0.4076822, -1.104114, 3.099895, 0, 0.1490196, 1, 1,
0.4121149, -0.2780306, 2.256822, 0, 0.1411765, 1, 1,
0.4162579, -0.1644311, 1.761071, 0, 0.1372549, 1, 1,
0.4194255, 0.8027858, 0.5822678, 0, 0.1294118, 1, 1,
0.4198046, 0.6701892, 0.06943338, 0, 0.1254902, 1, 1,
0.4202731, 0.5009791, 1.861802, 0, 0.1176471, 1, 1,
0.4220373, 0.08718392, 0.6857761, 0, 0.1137255, 1, 1,
0.4223343, -0.935531, 1.715881, 0, 0.1058824, 1, 1,
0.4238152, 0.5793136, 0.9219847, 0, 0.09803922, 1, 1,
0.4241498, 0.3909265, -0.8315335, 0, 0.09411765, 1, 1,
0.4258415, 0.1451661, 1.508262, 0, 0.08627451, 1, 1,
0.4280047, 1.227467, 0.9007293, 0, 0.08235294, 1, 1,
0.4288944, -0.9804756, 2.354496, 0, 0.07450981, 1, 1,
0.4334537, 0.8658993, 0.5948478, 0, 0.07058824, 1, 1,
0.4334872, 2.085294, 0.8850113, 0, 0.0627451, 1, 1,
0.4360846, 0.3610637, -0.07565036, 0, 0.05882353, 1, 1,
0.4371442, -0.4565809, 2.29373, 0, 0.05098039, 1, 1,
0.438774, -0.2389052, 0.8653911, 0, 0.04705882, 1, 1,
0.4436262, -0.7192739, 2.869794, 0, 0.03921569, 1, 1,
0.4472497, 0.6372001, 0.6564422, 0, 0.03529412, 1, 1,
0.4489463, -1.503546, 2.329733, 0, 0.02745098, 1, 1,
0.4548339, 0.4912873, 0.5531216, 0, 0.02352941, 1, 1,
0.4615808, -1.11023, 2.188882, 0, 0.01568628, 1, 1,
0.4670965, 0.9996132, 0.6989295, 0, 0.01176471, 1, 1,
0.4709654, -0.9567935, 3.244063, 0, 0.003921569, 1, 1,
0.4738335, -1.45883, 1.491143, 0.003921569, 0, 1, 1,
0.4796134, -0.2052772, 2.241153, 0.007843138, 0, 1, 1,
0.4821585, -0.1144034, 0.309512, 0.01568628, 0, 1, 1,
0.4835981, 0.598416, 0.317165, 0.01960784, 0, 1, 1,
0.4863568, 0.6350505, 1.028657, 0.02745098, 0, 1, 1,
0.487323, -0.5290027, 2.085578, 0.03137255, 0, 1, 1,
0.4903083, -0.3029813, 3.183647, 0.03921569, 0, 1, 1,
0.49584, -0.5655018, 0.4847105, 0.04313726, 0, 1, 1,
0.496102, -0.2617515, 2.187353, 0.05098039, 0, 1, 1,
0.5000933, -1.547641, 3.00609, 0.05490196, 0, 1, 1,
0.5042445, -0.519563, 1.535758, 0.0627451, 0, 1, 1,
0.5065746, 0.8555109, -0.1466024, 0.06666667, 0, 1, 1,
0.5126567, -1.03264, 2.780973, 0.07450981, 0, 1, 1,
0.512895, -0.230698, 2.102451, 0.07843138, 0, 1, 1,
0.5133699, 0.8045389, 0.03798312, 0.08627451, 0, 1, 1,
0.5135212, 0.5996637, -2.17624, 0.09019608, 0, 1, 1,
0.5179286, 1.145698, -1.918692, 0.09803922, 0, 1, 1,
0.5179583, 0.2381224, 2.922381, 0.1058824, 0, 1, 1,
0.5199264, -0.8791681, 1.768595, 0.1098039, 0, 1, 1,
0.5203932, 0.1427727, 1.61632, 0.1176471, 0, 1, 1,
0.5226919, -0.5444463, 3.211952, 0.1215686, 0, 1, 1,
0.5287437, 1.369074, 0.1301044, 0.1294118, 0, 1, 1,
0.5293515, -0.60084, 2.325166, 0.1333333, 0, 1, 1,
0.5342375, -0.8691546, 1.31727, 0.1411765, 0, 1, 1,
0.5350006, -0.8432819, 3.224087, 0.145098, 0, 1, 1,
0.539353, 0.2989454, 1.382931, 0.1529412, 0, 1, 1,
0.5444652, 1.671099, -0.1119838, 0.1568628, 0, 1, 1,
0.545783, 0.2140011, -0.09302757, 0.1647059, 0, 1, 1,
0.5459833, 0.2236231, 0.2988712, 0.1686275, 0, 1, 1,
0.5475758, 1.055526, -0.2925589, 0.1764706, 0, 1, 1,
0.5475774, 0.4687263, -0.1022566, 0.1803922, 0, 1, 1,
0.5484385, 0.3156771, -0.5587187, 0.1882353, 0, 1, 1,
0.5554464, 1.604491, 0.2782054, 0.1921569, 0, 1, 1,
0.5578628, -0.8121405, 1.967664, 0.2, 0, 1, 1,
0.5598893, -0.3364855, 1.251365, 0.2078431, 0, 1, 1,
0.5618269, 0.01799681, 2.284199, 0.2117647, 0, 1, 1,
0.5627673, -1.26397, 3.219004, 0.2196078, 0, 1, 1,
0.5687301, -1.082718, 2.23377, 0.2235294, 0, 1, 1,
0.571639, -0.7765954, 0.8996143, 0.2313726, 0, 1, 1,
0.5717081, 0.2022802, 1.565521, 0.2352941, 0, 1, 1,
0.5770748, 0.02353654, 3.121818, 0.2431373, 0, 1, 1,
0.5785996, -0.9597391, 3.383499, 0.2470588, 0, 1, 1,
0.578941, 0.2720623, 1.617867, 0.254902, 0, 1, 1,
0.5814007, -2.22881, 1.999373, 0.2588235, 0, 1, 1,
0.5819978, 1.662385, 0.06896394, 0.2666667, 0, 1, 1,
0.5837032, 1.804605, -0.4452617, 0.2705882, 0, 1, 1,
0.5844679, 0.3393086, 1.809981, 0.2784314, 0, 1, 1,
0.5897302, -0.4338917, 3.274211, 0.282353, 0, 1, 1,
0.6014977, 1.244745, 0.6481579, 0.2901961, 0, 1, 1,
0.6040554, 0.2514451, 1.885358, 0.2941177, 0, 1, 1,
0.6045889, -2.614958, 2.374846, 0.3019608, 0, 1, 1,
0.6101112, 0.3542816, 1.972061, 0.3098039, 0, 1, 1,
0.6121489, 0.6684701, 1.307296, 0.3137255, 0, 1, 1,
0.6155589, 1.162106, 0.6969195, 0.3215686, 0, 1, 1,
0.6167125, -0.2225199, 2.361568, 0.3254902, 0, 1, 1,
0.6177642, -0.7684676, 3.229432, 0.3333333, 0, 1, 1,
0.6188635, 0.6120728, 2.126247, 0.3372549, 0, 1, 1,
0.6196491, -0.3544755, 1.486516, 0.345098, 0, 1, 1,
0.6223125, 1.199103, -0.8599247, 0.3490196, 0, 1, 1,
0.6257021, -0.4015801, 1.467545, 0.3568628, 0, 1, 1,
0.6268569, -0.3537911, 2.639696, 0.3607843, 0, 1, 1,
0.6328261, -0.7772189, 2.095243, 0.3686275, 0, 1, 1,
0.6344534, 0.4674924, 0.3551729, 0.372549, 0, 1, 1,
0.6355158, 0.6549016, 0.1108896, 0.3803922, 0, 1, 1,
0.6426373, 0.05017037, 0.1908021, 0.3843137, 0, 1, 1,
0.6431592, 0.9286505, 0.3232132, 0.3921569, 0, 1, 1,
0.6449286, -1.180054, 3.43279, 0.3960784, 0, 1, 1,
0.6459382, -0.006619712, 2.175147, 0.4039216, 0, 1, 1,
0.6468527, 0.9687987, 1.012783, 0.4117647, 0, 1, 1,
0.6486494, -0.9196611, 2.267318, 0.4156863, 0, 1, 1,
0.6496233, 0.5108871, 1.790664, 0.4235294, 0, 1, 1,
0.650303, 0.202627, 2.960662, 0.427451, 0, 1, 1,
0.658276, 0.5347673, 0.3354589, 0.4352941, 0, 1, 1,
0.6590191, -1.250549, 1.754337, 0.4392157, 0, 1, 1,
0.6667758, -0.7244335, 1.182315, 0.4470588, 0, 1, 1,
0.6685097, -0.6775059, 3.150605, 0.4509804, 0, 1, 1,
0.6709487, 2.216405, -0.03291719, 0.4588235, 0, 1, 1,
0.6763222, 0.1868558, 0.9067258, 0.4627451, 0, 1, 1,
0.6850606, 0.2003355, 0.4982699, 0.4705882, 0, 1, 1,
0.685647, 0.1884179, 1.673375, 0.4745098, 0, 1, 1,
0.6870383, -0.1082206, 1.823283, 0.4823529, 0, 1, 1,
0.6908439, 1.434021, 1.255919, 0.4862745, 0, 1, 1,
0.6955037, -1.728451, 3.835157, 0.4941176, 0, 1, 1,
0.6962624, 0.1004773, 2.144009, 0.5019608, 0, 1, 1,
0.6970822, -0.9255074, 1.405985, 0.5058824, 0, 1, 1,
0.6989573, 0.7693689, 1.730105, 0.5137255, 0, 1, 1,
0.7025006, 0.5603127, 2.410179, 0.5176471, 0, 1, 1,
0.7056426, 0.9023355, 1.43345, 0.5254902, 0, 1, 1,
0.7069293, 1.5513, -0.4043162, 0.5294118, 0, 1, 1,
0.7101105, -1.10924, 2.862154, 0.5372549, 0, 1, 1,
0.7136695, -1.130247, 1.74082, 0.5411765, 0, 1, 1,
0.7142305, 1.820309, -0.5818369, 0.5490196, 0, 1, 1,
0.7145176, -0.1034618, 1.423163, 0.5529412, 0, 1, 1,
0.717608, -0.2570463, 3.62409, 0.5607843, 0, 1, 1,
0.723798, 1.061894, 1.396713, 0.5647059, 0, 1, 1,
0.7238529, -1.620634, 2.146199, 0.572549, 0, 1, 1,
0.7276044, 0.1969355, 1.150689, 0.5764706, 0, 1, 1,
0.7387955, 0.6408591, -0.6857568, 0.5843138, 0, 1, 1,
0.7523589, 0.2648492, 3.057256, 0.5882353, 0, 1, 1,
0.7546557, -0.234989, 1.909791, 0.5960785, 0, 1, 1,
0.7553108, -0.7846531, 0.6120762, 0.6039216, 0, 1, 1,
0.7556928, -0.2574503, 2.71522, 0.6078432, 0, 1, 1,
0.7614486, -0.6598088, 2.461769, 0.6156863, 0, 1, 1,
0.7628003, -0.8589162, 2.729661, 0.6196079, 0, 1, 1,
0.7642809, -0.3531376, 1.044515, 0.627451, 0, 1, 1,
0.7681587, 0.7715881, 1.689041, 0.6313726, 0, 1, 1,
0.7714003, 1.011056, 0.1520687, 0.6392157, 0, 1, 1,
0.7726892, 1.12413, -1.06931, 0.6431373, 0, 1, 1,
0.773388, -0.04632578, 2.637718, 0.6509804, 0, 1, 1,
0.7735692, 1.334852, -0.319984, 0.654902, 0, 1, 1,
0.7764044, 0.8289722, 2.193373, 0.6627451, 0, 1, 1,
0.7774884, 1.408279, 0.1427797, 0.6666667, 0, 1, 1,
0.7793559, 0.4219069, 0.8822654, 0.6745098, 0, 1, 1,
0.7803091, 0.156208, 0.684599, 0.6784314, 0, 1, 1,
0.7975701, -0.4574699, 2.735481, 0.6862745, 0, 1, 1,
0.7998208, -0.913424, 3.01652, 0.6901961, 0, 1, 1,
0.8009319, -0.2951872, 1.990407, 0.6980392, 0, 1, 1,
0.8107495, -0.8010916, 2.814951, 0.7058824, 0, 1, 1,
0.8151, -0.954339, 1.417926, 0.7098039, 0, 1, 1,
0.8164828, 0.5479589, 1.765279, 0.7176471, 0, 1, 1,
0.8165488, 0.669627, 0.6328436, 0.7215686, 0, 1, 1,
0.8265787, -1.012375, 1.597352, 0.7294118, 0, 1, 1,
0.827012, -1.006952, 3.03844, 0.7333333, 0, 1, 1,
0.8276761, 1.010195, 1.337461, 0.7411765, 0, 1, 1,
0.8306146, 0.5041655, 0.9621214, 0.7450981, 0, 1, 1,
0.8308225, 0.1504191, 2.910392, 0.7529412, 0, 1, 1,
0.8384101, 0.2147676, -0.3100947, 0.7568628, 0, 1, 1,
0.8439768, -0.5311854, 3.629803, 0.7647059, 0, 1, 1,
0.848493, 0.006292298, 3.157167, 0.7686275, 0, 1, 1,
0.8537511, 0.6735315, 0.5515395, 0.7764706, 0, 1, 1,
0.8566665, -2.007535, 1.900575, 0.7803922, 0, 1, 1,
0.859073, 0.0566683, 0.3396736, 0.7882353, 0, 1, 1,
0.8662573, 0.3614024, 3.277433, 0.7921569, 0, 1, 1,
0.8706973, -0.01196137, -0.0847472, 0.8, 0, 1, 1,
0.872619, 0.4339083, -1.16982, 0.8078431, 0, 1, 1,
0.874064, 0.9229266, 0.3552934, 0.8117647, 0, 1, 1,
0.8830817, 0.7776033, 2.140689, 0.8196079, 0, 1, 1,
0.883505, -0.4645266, 1.110768, 0.8235294, 0, 1, 1,
0.8930501, 0.171159, 1.043744, 0.8313726, 0, 1, 1,
0.8965256, 2.197574, -0.06237704, 0.8352941, 0, 1, 1,
0.9027105, 0.199425, 2.787839, 0.8431373, 0, 1, 1,
0.9029228, 0.1631356, 1.352687, 0.8470588, 0, 1, 1,
0.9051488, 0.3257978, 0.4658497, 0.854902, 0, 1, 1,
0.9127415, 0.6201259, 0.5091735, 0.8588235, 0, 1, 1,
0.9157909, -0.1980149, 1.304583, 0.8666667, 0, 1, 1,
0.9214168, 1.164291, -0.9556885, 0.8705882, 0, 1, 1,
0.9232961, 0.3188201, 0.9349985, 0.8784314, 0, 1, 1,
0.9244434, -0.02998969, 1.988128, 0.8823529, 0, 1, 1,
0.9244651, -0.6246666, 0.6207994, 0.8901961, 0, 1, 1,
0.9301179, -0.5556377, 2.374832, 0.8941177, 0, 1, 1,
0.9302534, 0.06616418, 0.6664168, 0.9019608, 0, 1, 1,
0.9303457, 0.7869585, 0.5850329, 0.9098039, 0, 1, 1,
0.9418582, -0.956023, 2.413526, 0.9137255, 0, 1, 1,
0.9419182, -0.5533442, 1.310168, 0.9215686, 0, 1, 1,
0.945644, 0.4168847, 1.716935, 0.9254902, 0, 1, 1,
0.9520425, -0.9240071, 3.056521, 0.9333333, 0, 1, 1,
0.9606467, -0.4141281, 1.819558, 0.9372549, 0, 1, 1,
0.9648731, 0.3830991, 0.84094, 0.945098, 0, 1, 1,
0.9665937, -0.2402412, 2.44846, 0.9490196, 0, 1, 1,
0.9782798, 1.055054, -0.00804074, 0.9568627, 0, 1, 1,
0.981325, 0.9490469, -0.7311066, 0.9607843, 0, 1, 1,
0.9835092, 0.3411085, 1.544289, 0.9686275, 0, 1, 1,
0.9844045, 1.060308, 0.828739, 0.972549, 0, 1, 1,
0.9875218, -0.7258785, 3.97776, 0.9803922, 0, 1, 1,
0.9922032, -0.01256061, 1.733118, 0.9843137, 0, 1, 1,
0.9975168, -0.1839826, 0.6737208, 0.9921569, 0, 1, 1,
1.000904, -1.06746, 1.112122, 0.9960784, 0, 1, 1,
1.008316, -0.8664203, 2.891168, 1, 0, 0.9960784, 1,
1.011399, -0.4442693, 0.6809372, 1, 0, 0.9882353, 1,
1.011908, -0.07908892, 1.944894, 1, 0, 0.9843137, 1,
1.013789, -0.943473, 2.899199, 1, 0, 0.9764706, 1,
1.015518, 0.54672, 2.193966, 1, 0, 0.972549, 1,
1.015966, 0.3112111, 1.430173, 1, 0, 0.9647059, 1,
1.016237, -0.6047313, 1.187219, 1, 0, 0.9607843, 1,
1.023413, -1.406009, 2.410568, 1, 0, 0.9529412, 1,
1.026243, -1.987397, 1.093374, 1, 0, 0.9490196, 1,
1.027535, 0.02219843, 0.5802327, 1, 0, 0.9411765, 1,
1.027643, 0.5892046, 1.484837, 1, 0, 0.9372549, 1,
1.029902, 0.3113393, 0.7724984, 1, 0, 0.9294118, 1,
1.03719, 0.4247423, 1.495769, 1, 0, 0.9254902, 1,
1.03933, -0.9244331, 1.532304, 1, 0, 0.9176471, 1,
1.04342, 2.197758, 0.2451259, 1, 0, 0.9137255, 1,
1.044068, 1.988795, 0.2908881, 1, 0, 0.9058824, 1,
1.046355, -0.5972131, 2.517732, 1, 0, 0.9019608, 1,
1.046534, -1.349182, 0.4008946, 1, 0, 0.8941177, 1,
1.059586, 0.1906467, 0.180722, 1, 0, 0.8862745, 1,
1.063068, 0.4260422, 2.943311, 1, 0, 0.8823529, 1,
1.065596, -0.9445864, 2.389914, 1, 0, 0.8745098, 1,
1.074929, 0.526537, -0.1690357, 1, 0, 0.8705882, 1,
1.083706, -2.069708, 3.92607, 1, 0, 0.8627451, 1,
1.094202, 1.073167, -0.2302896, 1, 0, 0.8588235, 1,
1.095164, -0.0315139, 0.7755985, 1, 0, 0.8509804, 1,
1.099741, -0.08459955, 3.343792, 1, 0, 0.8470588, 1,
1.106844, -1.360774, 2.678643, 1, 0, 0.8392157, 1,
1.108343, -1.599134, 2.440317, 1, 0, 0.8352941, 1,
1.112771, -1.600188, 1.885171, 1, 0, 0.827451, 1,
1.117996, 0.05329388, 1.052348, 1, 0, 0.8235294, 1,
1.121519, -0.5065031, 3.894603, 1, 0, 0.8156863, 1,
1.122868, -2.347725, 2.612225, 1, 0, 0.8117647, 1,
1.127157, 0.5404942, 0.5385904, 1, 0, 0.8039216, 1,
1.129689, 0.05375478, 1.352248, 1, 0, 0.7960784, 1,
1.142054, 1.060686, 2.524199, 1, 0, 0.7921569, 1,
1.143365, -2.077865, 3.740334, 1, 0, 0.7843137, 1,
1.148762, -0.4645042, 2.931148, 1, 0, 0.7803922, 1,
1.15409, -1.52126, 2.329224, 1, 0, 0.772549, 1,
1.159401, 1.257944, 0.9337502, 1, 0, 0.7686275, 1,
1.163887, 0.8564578, 1.530874, 1, 0, 0.7607843, 1,
1.166351, -0.5192289, 3.164774, 1, 0, 0.7568628, 1,
1.166474, -0.3442861, 1.119119, 1, 0, 0.7490196, 1,
1.167021, 0.2612352, -0.5369329, 1, 0, 0.7450981, 1,
1.167417, 1.406392, 0.4444716, 1, 0, 0.7372549, 1,
1.167591, -1.189358, 3.34622, 1, 0, 0.7333333, 1,
1.167667, -0.6687921, 2.944534, 1, 0, 0.7254902, 1,
1.174208, 0.1070769, 2.271787, 1, 0, 0.7215686, 1,
1.174959, -0.8970289, 0.5795568, 1, 0, 0.7137255, 1,
1.181882, 0.2860546, 1.939391, 1, 0, 0.7098039, 1,
1.182345, -1.006387, 2.620195, 1, 0, 0.7019608, 1,
1.183732, 0.4432763, 0.2996795, 1, 0, 0.6941177, 1,
1.186849, 0.548923, 0.3109104, 1, 0, 0.6901961, 1,
1.190903, 0.0242627, 0.5510107, 1, 0, 0.682353, 1,
1.193386, -0.531749, 3.73104, 1, 0, 0.6784314, 1,
1.202201, 0.8848726, -0.5327515, 1, 0, 0.6705883, 1,
1.209796, -0.1979892, 1.510603, 1, 0, 0.6666667, 1,
1.214987, 0.3260829, 1.458005, 1, 0, 0.6588235, 1,
1.218005, -0.0542546, 1.0351, 1, 0, 0.654902, 1,
1.220632, -0.03733263, 1.273528, 1, 0, 0.6470588, 1,
1.256894, -0.004013656, 1.514281, 1, 0, 0.6431373, 1,
1.261775, -0.7955273, 2.046945, 1, 0, 0.6352941, 1,
1.264739, -0.947524, 2.34487, 1, 0, 0.6313726, 1,
1.267847, 1.193, -1.174473, 1, 0, 0.6235294, 1,
1.287585, 0.2396571, 1.636938, 1, 0, 0.6196079, 1,
1.288314, -0.3421863, 2.834631, 1, 0, 0.6117647, 1,
1.289334, 0.873849, 0.6499742, 1, 0, 0.6078432, 1,
1.289371, 0.9628146, 0.05529772, 1, 0, 0.6, 1,
1.294379, 0.9300497, 2.230414, 1, 0, 0.5921569, 1,
1.294425, 0.9003021, 0.5415915, 1, 0, 0.5882353, 1,
1.301386, -0.3076591, 1.411843, 1, 0, 0.5803922, 1,
1.306642, 0.8925856, 1.499191, 1, 0, 0.5764706, 1,
1.307654, 0.172464, 0.3534653, 1, 0, 0.5686275, 1,
1.3175, 0.1803104, 1.311065, 1, 0, 0.5647059, 1,
1.322777, -2.021579, 2.853322, 1, 0, 0.5568628, 1,
1.329198, -0.4775475, 2.381079, 1, 0, 0.5529412, 1,
1.345433, 1.755865, 1.396847, 1, 0, 0.5450981, 1,
1.352169, 1.684041, -0.7923669, 1, 0, 0.5411765, 1,
1.373459, -1.058287, 0.515396, 1, 0, 0.5333334, 1,
1.378898, -0.3130202, 0.3235117, 1, 0, 0.5294118, 1,
1.38188, 0.7059467, 1.888371, 1, 0, 0.5215687, 1,
1.38543, -0.3950677, 1.591457, 1, 0, 0.5176471, 1,
1.38896, 0.04529842, 2.570836, 1, 0, 0.509804, 1,
1.414739, 0.04096154, 1.435963, 1, 0, 0.5058824, 1,
1.416747, -1.181831, 2.921132, 1, 0, 0.4980392, 1,
1.417284, 0.8174254, -1.402459, 1, 0, 0.4901961, 1,
1.419215, 0.7543057, 2.602795, 1, 0, 0.4862745, 1,
1.422721, 0.6263246, 2.377909, 1, 0, 0.4784314, 1,
1.424026, 0.09946573, 1.05681, 1, 0, 0.4745098, 1,
1.425132, 0.9471105, 0.7769676, 1, 0, 0.4666667, 1,
1.438496, 0.7874867, 1.729538, 1, 0, 0.4627451, 1,
1.442113, 0.1672135, 1.520461, 1, 0, 0.454902, 1,
1.444466, 0.008045514, 1.092433, 1, 0, 0.4509804, 1,
1.481435, -0.4071556, 2.813756, 1, 0, 0.4431373, 1,
1.483124, 0.5473891, 0.734396, 1, 0, 0.4392157, 1,
1.489438, 0.1449045, 0.2071065, 1, 0, 0.4313726, 1,
1.495191, 0.5252087, 1.853369, 1, 0, 0.427451, 1,
1.496565, 1.7666, 0.1496808, 1, 0, 0.4196078, 1,
1.498258, 1.107156, -0.3173924, 1, 0, 0.4156863, 1,
1.515922, 0.8259677, 1.448883, 1, 0, 0.4078431, 1,
1.521202, 0.2826613, 3.924045, 1, 0, 0.4039216, 1,
1.522493, 1.053633, 1.304816, 1, 0, 0.3960784, 1,
1.526319, 0.9951256, 1.192263, 1, 0, 0.3882353, 1,
1.529106, 0.2115753, 1.082631, 1, 0, 0.3843137, 1,
1.541187, -0.1088659, 2.249603, 1, 0, 0.3764706, 1,
1.542089, -0.1671741, 1.669294, 1, 0, 0.372549, 1,
1.553534, -1.373603, 2.245932, 1, 0, 0.3647059, 1,
1.565663, 0.7161936, 1.589714, 1, 0, 0.3607843, 1,
1.566509, -1.418946, 2.686625, 1, 0, 0.3529412, 1,
1.60368, -0.3043712, 1.736769, 1, 0, 0.3490196, 1,
1.612505, 0.7019005, 3.312729, 1, 0, 0.3411765, 1,
1.61731, 1.165249, 0.3639404, 1, 0, 0.3372549, 1,
1.646998, -0.2705725, 2.629343, 1, 0, 0.3294118, 1,
1.647461, 0.2355735, 1.384697, 1, 0, 0.3254902, 1,
1.655526, 0.4366883, 1.199808, 1, 0, 0.3176471, 1,
1.684255, 0.9424939, 0.1173097, 1, 0, 0.3137255, 1,
1.699577, -1.873907, 2.598399, 1, 0, 0.3058824, 1,
1.709106, -2.355666, 3.369448, 1, 0, 0.2980392, 1,
1.716005, 0.4170179, 0.4806668, 1, 0, 0.2941177, 1,
1.724068, 1.211779, 0.772956, 1, 0, 0.2862745, 1,
1.729, -1.465964, 2.31353, 1, 0, 0.282353, 1,
1.732422, 0.8790488, 1.529734, 1, 0, 0.2745098, 1,
1.737166, -0.6368653, 2.308423, 1, 0, 0.2705882, 1,
1.74358, -1.283846, 3.611896, 1, 0, 0.2627451, 1,
1.753078, -0.6199345, 2.621271, 1, 0, 0.2588235, 1,
1.760049, -1.215311, 2.478615, 1, 0, 0.2509804, 1,
1.76227, 1.735039, 2.295952, 1, 0, 0.2470588, 1,
1.766842, 1.08779, -0.9334092, 1, 0, 0.2392157, 1,
1.77168, -1.071224, 2.042076, 1, 0, 0.2352941, 1,
1.77669, -0.03647942, 2.36334, 1, 0, 0.227451, 1,
1.789012, -0.7170051, 3.903549, 1, 0, 0.2235294, 1,
1.801617, -1.89322, 3.188382, 1, 0, 0.2156863, 1,
1.809073, -0.3692767, 2.05818, 1, 0, 0.2117647, 1,
1.827322, 0.4907031, 0.8495392, 1, 0, 0.2039216, 1,
1.852704, -0.2480716, 1.288136, 1, 0, 0.1960784, 1,
1.907177, 1.400905, 0.07191994, 1, 0, 0.1921569, 1,
1.918998, 0.8739339, 1.526318, 1, 0, 0.1843137, 1,
1.925079, 1.297565, 3.278628, 1, 0, 0.1803922, 1,
1.932876, 1.62992, 1.265126, 1, 0, 0.172549, 1,
1.936166, 0.2044111, 2.551553, 1, 0, 0.1686275, 1,
1.972524, -0.3522752, 1.136286, 1, 0, 0.1607843, 1,
1.976215, -0.7779473, 0.133373, 1, 0, 0.1568628, 1,
1.983035, -0.5909878, 2.197895, 1, 0, 0.1490196, 1,
2.011507, -0.3917297, 1.536155, 1, 0, 0.145098, 1,
2.018565, -0.3522289, 2.466631, 1, 0, 0.1372549, 1,
2.029179, -0.08449762, 0.5861896, 1, 0, 0.1333333, 1,
2.073777, 1.439735, 1.81966, 1, 0, 0.1254902, 1,
2.097263, 2.318214, 1.354649, 1, 0, 0.1215686, 1,
2.122346, -0.1064415, 2.002374, 1, 0, 0.1137255, 1,
2.188267, -1.37452, 0.879648, 1, 0, 0.1098039, 1,
2.196339, 0.4488146, 1.997347, 1, 0, 0.1019608, 1,
2.292756, -1.20177, 3.402173, 1, 0, 0.09411765, 1,
2.307034, 0.9153801, 1.331656, 1, 0, 0.09019608, 1,
2.342921, 1.119595, 2.875588, 1, 0, 0.08235294, 1,
2.350526, -1.002344, 3.168019, 1, 0, 0.07843138, 1,
2.370521, -1.819171, 2.593884, 1, 0, 0.07058824, 1,
2.371768, 1.011891, 1.491523, 1, 0, 0.06666667, 1,
2.393581, 0.3907857, -0.03757535, 1, 0, 0.05882353, 1,
2.417502, -1.538862, 1.947421, 1, 0, 0.05490196, 1,
2.432506, 0.7744169, 1.048204, 1, 0, 0.04705882, 1,
2.441512, 1.939019, 1.132003, 1, 0, 0.04313726, 1,
2.464924, 1.047369, 1.247881, 1, 0, 0.03529412, 1,
2.511077, 0.244972, 0.09090827, 1, 0, 0.03137255, 1,
2.575274, -0.1400786, 1.240932, 1, 0, 0.02352941, 1,
2.769336, -0.3153027, 2.028367, 1, 0, 0.01960784, 1,
3.051561, 0.2095301, 1.954728, 1, 0, 0.01176471, 1,
3.877147, 1.893252, 0.9606489, 1, 0, 0.007843138, 1
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
0.4212289, -4.601314, -7.587935, 0, -0.5, 0.5, 0.5,
0.4212289, -4.601314, -7.587935, 1, -0.5, 0.5, 0.5,
0.4212289, -4.601314, -7.587935, 1, 1.5, 0.5, 0.5,
0.4212289, -4.601314, -7.587935, 0, 1.5, 0.5, 0.5
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
-4.206245, -0.3170359, -7.587935, 0, -0.5, 0.5, 0.5,
-4.206245, -0.3170359, -7.587935, 1, -0.5, 0.5, 0.5,
-4.206245, -0.3170359, -7.587935, 1, 1.5, 0.5, 0.5,
-4.206245, -0.3170359, -7.587935, 0, 1.5, 0.5, 0.5
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
-4.206245, -4.601314, -0.4536531, 0, -0.5, 0.5, 0.5,
-4.206245, -4.601314, -0.4536531, 1, -0.5, 0.5, 0.5,
-4.206245, -4.601314, -0.4536531, 1, 1.5, 0.5, 0.5,
-4.206245, -4.601314, -0.4536531, 0, 1.5, 0.5, 0.5
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
-3, -3.612634, -5.941562,
3, -3.612634, -5.941562,
-3, -3.612634, -5.941562,
-3, -3.777414, -6.215958,
-2, -3.612634, -5.941562,
-2, -3.777414, -6.215958,
-1, -3.612634, -5.941562,
-1, -3.777414, -6.215958,
0, -3.612634, -5.941562,
0, -3.777414, -6.215958,
1, -3.612634, -5.941562,
1, -3.777414, -6.215958,
2, -3.612634, -5.941562,
2, -3.777414, -6.215958,
3, -3.612634, -5.941562,
3, -3.777414, -6.215958
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
-3, -4.106974, -6.764749, 0, -0.5, 0.5, 0.5,
-3, -4.106974, -6.764749, 1, -0.5, 0.5, 0.5,
-3, -4.106974, -6.764749, 1, 1.5, 0.5, 0.5,
-3, -4.106974, -6.764749, 0, 1.5, 0.5, 0.5,
-2, -4.106974, -6.764749, 0, -0.5, 0.5, 0.5,
-2, -4.106974, -6.764749, 1, -0.5, 0.5, 0.5,
-2, -4.106974, -6.764749, 1, 1.5, 0.5, 0.5,
-2, -4.106974, -6.764749, 0, 1.5, 0.5, 0.5,
-1, -4.106974, -6.764749, 0, -0.5, 0.5, 0.5,
-1, -4.106974, -6.764749, 1, -0.5, 0.5, 0.5,
-1, -4.106974, -6.764749, 1, 1.5, 0.5, 0.5,
-1, -4.106974, -6.764749, 0, 1.5, 0.5, 0.5,
0, -4.106974, -6.764749, 0, -0.5, 0.5, 0.5,
0, -4.106974, -6.764749, 1, -0.5, 0.5, 0.5,
0, -4.106974, -6.764749, 1, 1.5, 0.5, 0.5,
0, -4.106974, -6.764749, 0, 1.5, 0.5, 0.5,
1, -4.106974, -6.764749, 0, -0.5, 0.5, 0.5,
1, -4.106974, -6.764749, 1, -0.5, 0.5, 0.5,
1, -4.106974, -6.764749, 1, 1.5, 0.5, 0.5,
1, -4.106974, -6.764749, 0, 1.5, 0.5, 0.5,
2, -4.106974, -6.764749, 0, -0.5, 0.5, 0.5,
2, -4.106974, -6.764749, 1, -0.5, 0.5, 0.5,
2, -4.106974, -6.764749, 1, 1.5, 0.5, 0.5,
2, -4.106974, -6.764749, 0, 1.5, 0.5, 0.5,
3, -4.106974, -6.764749, 0, -0.5, 0.5, 0.5,
3, -4.106974, -6.764749, 1, -0.5, 0.5, 0.5,
3, -4.106974, -6.764749, 1, 1.5, 0.5, 0.5,
3, -4.106974, -6.764749, 0, 1.5, 0.5, 0.5
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
-3.138367, -3, -5.941562,
-3.138367, 2, -5.941562,
-3.138367, -3, -5.941562,
-3.316346, -3, -6.215958,
-3.138367, -2, -5.941562,
-3.316346, -2, -6.215958,
-3.138367, -1, -5.941562,
-3.316346, -1, -6.215958,
-3.138367, 0, -5.941562,
-3.316346, 0, -6.215958,
-3.138367, 1, -5.941562,
-3.316346, 1, -6.215958,
-3.138367, 2, -5.941562,
-3.316346, 2, -6.215958
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
-3.672306, -3, -6.764749, 0, -0.5, 0.5, 0.5,
-3.672306, -3, -6.764749, 1, -0.5, 0.5, 0.5,
-3.672306, -3, -6.764749, 1, 1.5, 0.5, 0.5,
-3.672306, -3, -6.764749, 0, 1.5, 0.5, 0.5,
-3.672306, -2, -6.764749, 0, -0.5, 0.5, 0.5,
-3.672306, -2, -6.764749, 1, -0.5, 0.5, 0.5,
-3.672306, -2, -6.764749, 1, 1.5, 0.5, 0.5,
-3.672306, -2, -6.764749, 0, 1.5, 0.5, 0.5,
-3.672306, -1, -6.764749, 0, -0.5, 0.5, 0.5,
-3.672306, -1, -6.764749, 1, -0.5, 0.5, 0.5,
-3.672306, -1, -6.764749, 1, 1.5, 0.5, 0.5,
-3.672306, -1, -6.764749, 0, 1.5, 0.5, 0.5,
-3.672306, 0, -6.764749, 0, -0.5, 0.5, 0.5,
-3.672306, 0, -6.764749, 1, -0.5, 0.5, 0.5,
-3.672306, 0, -6.764749, 1, 1.5, 0.5, 0.5,
-3.672306, 0, -6.764749, 0, 1.5, 0.5, 0.5,
-3.672306, 1, -6.764749, 0, -0.5, 0.5, 0.5,
-3.672306, 1, -6.764749, 1, -0.5, 0.5, 0.5,
-3.672306, 1, -6.764749, 1, 1.5, 0.5, 0.5,
-3.672306, 1, -6.764749, 0, 1.5, 0.5, 0.5,
-3.672306, 2, -6.764749, 0, -0.5, 0.5, 0.5,
-3.672306, 2, -6.764749, 1, -0.5, 0.5, 0.5,
-3.672306, 2, -6.764749, 1, 1.5, 0.5, 0.5,
-3.672306, 2, -6.764749, 0, 1.5, 0.5, 0.5
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
-3.138367, -3.612634, -4,
-3.138367, -3.612634, 4,
-3.138367, -3.612634, -4,
-3.316346, -3.777414, -4,
-3.138367, -3.612634, -2,
-3.316346, -3.777414, -2,
-3.138367, -3.612634, 0,
-3.316346, -3.777414, 0,
-3.138367, -3.612634, 2,
-3.316346, -3.777414, 2,
-3.138367, -3.612634, 4,
-3.316346, -3.777414, 4
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
-3.672306, -4.106974, -4, 0, -0.5, 0.5, 0.5,
-3.672306, -4.106974, -4, 1, -0.5, 0.5, 0.5,
-3.672306, -4.106974, -4, 1, 1.5, 0.5, 0.5,
-3.672306, -4.106974, -4, 0, 1.5, 0.5, 0.5,
-3.672306, -4.106974, -2, 0, -0.5, 0.5, 0.5,
-3.672306, -4.106974, -2, 1, -0.5, 0.5, 0.5,
-3.672306, -4.106974, -2, 1, 1.5, 0.5, 0.5,
-3.672306, -4.106974, -2, 0, 1.5, 0.5, 0.5,
-3.672306, -4.106974, 0, 0, -0.5, 0.5, 0.5,
-3.672306, -4.106974, 0, 1, -0.5, 0.5, 0.5,
-3.672306, -4.106974, 0, 1, 1.5, 0.5, 0.5,
-3.672306, -4.106974, 0, 0, 1.5, 0.5, 0.5,
-3.672306, -4.106974, 2, 0, -0.5, 0.5, 0.5,
-3.672306, -4.106974, 2, 1, -0.5, 0.5, 0.5,
-3.672306, -4.106974, 2, 1, 1.5, 0.5, 0.5,
-3.672306, -4.106974, 2, 0, 1.5, 0.5, 0.5,
-3.672306, -4.106974, 4, 0, -0.5, 0.5, 0.5,
-3.672306, -4.106974, 4, 1, -0.5, 0.5, 0.5,
-3.672306, -4.106974, 4, 1, 1.5, 0.5, 0.5,
-3.672306, -4.106974, 4, 0, 1.5, 0.5, 0.5
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
-3.138367, -3.612634, -5.941562,
-3.138367, 2.978562, -5.941562,
-3.138367, -3.612634, 5.034256,
-3.138367, 2.978562, 5.034256,
-3.138367, -3.612634, -5.941562,
-3.138367, -3.612634, 5.034256,
-3.138367, 2.978562, -5.941562,
-3.138367, 2.978562, 5.034256,
-3.138367, -3.612634, -5.941562,
3.980824, -3.612634, -5.941562,
-3.138367, -3.612634, 5.034256,
3.980824, -3.612634, 5.034256,
-3.138367, 2.978562, -5.941562,
3.980824, 2.978562, -5.941562,
-3.138367, 2.978562, 5.034256,
3.980824, 2.978562, 5.034256,
3.980824, -3.612634, -5.941562,
3.980824, 2.978562, -5.941562,
3.980824, -3.612634, 5.034256,
3.980824, 2.978562, 5.034256,
3.980824, -3.612634, -5.941562,
3.980824, -3.612634, 5.034256,
3.980824, 2.978562, -5.941562,
3.980824, 2.978562, 5.034256
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
var radius = 7.822321;
var distance = 34.80239;
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
mvMatrix.translate( -0.4212289, 0.3170359, 0.4536531 );
mvMatrix.scale( 1.188007, 1.283173, 0.7705709 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.80239);
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
Cupric_sulfate<-read.table("Cupric_sulfate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cupric_sulfate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cupric_sulfate' not found
```

```r
y<-Cupric_sulfate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cupric_sulfate' not found
```

```r
z<-Cupric_sulfate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cupric_sulfate' not found
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
-3.034689, 1.180038, -2.094579, 0, 0, 1, 1, 1,
-2.710903, 0.1226767, -0.5507293, 1, 0, 0, 1, 1,
-2.613547, 0.4350636, -0.1149292, 1, 0, 0, 1, 1,
-2.592324, 0.4994828, -1.577465, 1, 0, 0, 1, 1,
-2.496873, 0.707171, -2.573772, 1, 0, 0, 1, 1,
-2.449193, -0.4380265, -3.240724, 1, 0, 0, 1, 1,
-2.417121, -1.289528, -3.416642, 0, 0, 0, 1, 1,
-2.399895, 0.1427891, -1.860034, 0, 0, 0, 1, 1,
-2.343714, 0.4507984, 0.5147908, 0, 0, 0, 1, 1,
-2.33028, 0.2568212, -1.715552, 0, 0, 0, 1, 1,
-2.256551, -0.06209699, -0.5376534, 0, 0, 0, 1, 1,
-2.217245, 1.72563, -0.6374484, 0, 0, 0, 1, 1,
-2.188927, 0.4445955, -2.001656, 0, 0, 0, 1, 1,
-2.158359, 0.9593408, -0.7151497, 1, 1, 1, 1, 1,
-2.156021, -0.1245935, 0.884165, 1, 1, 1, 1, 1,
-2.130193, 0.5018746, -1.972821, 1, 1, 1, 1, 1,
-2.125048, -0.4464483, -1.372723, 1, 1, 1, 1, 1,
-2.120416, -1.114025, 0.7527159, 1, 1, 1, 1, 1,
-2.120009, 0.9435932, -1.573309, 1, 1, 1, 1, 1,
-2.108398, 0.6246315, -0.7570002, 1, 1, 1, 1, 1,
-2.105882, -0.9353506, -0.7114509, 1, 1, 1, 1, 1,
-2.073673, -0.2380416, -2.729892, 1, 1, 1, 1, 1,
-2.068336, -1.297865, -2.955958, 1, 1, 1, 1, 1,
-2.05905, 1.013108, -0.7667719, 1, 1, 1, 1, 1,
-2.055957, 0.09473296, -1.137271, 1, 1, 1, 1, 1,
-2.025941, 0.8417456, -0.8444851, 1, 1, 1, 1, 1,
-1.987455, -1.429324, -3.632948, 1, 1, 1, 1, 1,
-1.974766, -0.8185463, -2.501577, 1, 1, 1, 1, 1,
-1.935365, -0.3203866, -1.765897, 0, 0, 1, 1, 1,
-1.91982, -0.2876354, -2.043782, 1, 0, 0, 1, 1,
-1.890472, -0.07249748, -1.207408, 1, 0, 0, 1, 1,
-1.884249, 0.5848186, -1.509546, 1, 0, 0, 1, 1,
-1.882218, -0.7223731, -1.89428, 1, 0, 0, 1, 1,
-1.862658, 0.7040828, -1.809041, 1, 0, 0, 1, 1,
-1.854424, 0.115465, 0.1992677, 0, 0, 0, 1, 1,
-1.838064, -0.3650448, -0.3836981, 0, 0, 0, 1, 1,
-1.787145, -0.2682416, -1.482534, 0, 0, 0, 1, 1,
-1.776155, 0.3725334, -1.985414, 0, 0, 0, 1, 1,
-1.768584, -0.5605734, -1.163423, 0, 0, 0, 1, 1,
-1.755028, -0.4717876, -3.288604, 0, 0, 0, 1, 1,
-1.728262, 1.785842, -1.554523, 0, 0, 0, 1, 1,
-1.726457, -0.1724915, -0.2936065, 1, 1, 1, 1, 1,
-1.710834, -0.04166324, -2.587015, 1, 1, 1, 1, 1,
-1.704935, -0.9160002, -2.335488, 1, 1, 1, 1, 1,
-1.697389, -0.2043188, -1.916308, 1, 1, 1, 1, 1,
-1.693152, -0.2540708, -0.3843677, 1, 1, 1, 1, 1,
-1.692847, -1.415629, -2.206232, 1, 1, 1, 1, 1,
-1.66864, 0.679173, 0.05390338, 1, 1, 1, 1, 1,
-1.652993, 1.503448, -2.240621, 1, 1, 1, 1, 1,
-1.64554, 2.127076, -1.314137, 1, 1, 1, 1, 1,
-1.643649, 1.112129, -1.067094, 1, 1, 1, 1, 1,
-1.635294, -0.3156984, -1.720669, 1, 1, 1, 1, 1,
-1.613206, -0.9109784, -3.498319, 1, 1, 1, 1, 1,
-1.597967, 0.87292, -0.2535339, 1, 1, 1, 1, 1,
-1.59493, 0.2965039, -2.021777, 1, 1, 1, 1, 1,
-1.580657, 1.063557, -1.429699, 1, 1, 1, 1, 1,
-1.571878, 0.3373122, -0.3510898, 0, 0, 1, 1, 1,
-1.566283, 0.6424623, -2.368152, 1, 0, 0, 1, 1,
-1.561208, -0.0317604, -0.9907504, 1, 0, 0, 1, 1,
-1.551224, -0.7867998, -3.227147, 1, 0, 0, 1, 1,
-1.545248, -0.9422345, -1.684683, 1, 0, 0, 1, 1,
-1.532954, -1.31562, -2.465094, 1, 0, 0, 1, 1,
-1.528641, -0.5973671, -2.579559, 0, 0, 0, 1, 1,
-1.526458, -0.4883722, -2.364814, 0, 0, 0, 1, 1,
-1.521301, -0.02362206, -2.433649, 0, 0, 0, 1, 1,
-1.520502, 1.009634, -1.270055, 0, 0, 0, 1, 1,
-1.509414, 0.9622791, -0.7599641, 0, 0, 0, 1, 1,
-1.489813, 1.873309, -0.6447428, 0, 0, 0, 1, 1,
-1.486316, 1.883298, -1.414406, 0, 0, 0, 1, 1,
-1.464901, 0.9225357, -0.915364, 1, 1, 1, 1, 1,
-1.451998, -0.597376, -3.396554, 1, 1, 1, 1, 1,
-1.446335, 0.1578571, -2.472173, 1, 1, 1, 1, 1,
-1.441188, 0.1650777, -1.247558, 1, 1, 1, 1, 1,
-1.432112, -0.437392, -1.549611, 1, 1, 1, 1, 1,
-1.430896, 0.5266126, -1.750508, 1, 1, 1, 1, 1,
-1.430183, 0.9739983, -0.1096357, 1, 1, 1, 1, 1,
-1.426718, -0.005257613, -0.03623052, 1, 1, 1, 1, 1,
-1.424813, 0.2429588, 0.1890509, 1, 1, 1, 1, 1,
-1.411417, 0.02615562, -1.688131, 1, 1, 1, 1, 1,
-1.408508, 1.835157, -0.7287364, 1, 1, 1, 1, 1,
-1.403421, -0.4838232, -1.603547, 1, 1, 1, 1, 1,
-1.39525, 0.04922061, -3.412104, 1, 1, 1, 1, 1,
-1.378689, -0.07960911, -2.151044, 1, 1, 1, 1, 1,
-1.377772, -2.191459, -4.014638, 1, 1, 1, 1, 1,
-1.356651, -0.1835347, -0.6821663, 0, 0, 1, 1, 1,
-1.338119, -0.5010167, -2.51523, 1, 0, 0, 1, 1,
-1.335676, -0.1065278, -1.253052, 1, 0, 0, 1, 1,
-1.313856, 0.1939792, 0.2113507, 1, 0, 0, 1, 1,
-1.31343, -0.637031, -0.452477, 1, 0, 0, 1, 1,
-1.309104, 0.02952288, -0.6066293, 1, 0, 0, 1, 1,
-1.30223, 0.1936559, -0.3977983, 0, 0, 0, 1, 1,
-1.288257, 1.164327, -0.1511705, 0, 0, 0, 1, 1,
-1.287824, -0.6224701, -2.40062, 0, 0, 0, 1, 1,
-1.286634, -1.918166, -4.359524, 0, 0, 0, 1, 1,
-1.285843, 1.079224, -0.04211725, 0, 0, 0, 1, 1,
-1.278324, -1.726384, -2.63157, 0, 0, 0, 1, 1,
-1.276626, 0.2872922, 0.9899799, 0, 0, 0, 1, 1,
-1.266763, -0.8179722, -1.693662, 1, 1, 1, 1, 1,
-1.25401, -1.071334, -1.579006, 1, 1, 1, 1, 1,
-1.24877, 1.030986, -3.045918, 1, 1, 1, 1, 1,
-1.246299, 2.207884, -0.117499, 1, 1, 1, 1, 1,
-1.226765, 2.548081, 0.5739202, 1, 1, 1, 1, 1,
-1.223494, 0.3290231, -0.7215862, 1, 1, 1, 1, 1,
-1.203879, 1.483893, -0.1336844, 1, 1, 1, 1, 1,
-1.200294, -0.1164542, -0.2214522, 1, 1, 1, 1, 1,
-1.196778, -1.646122, -1.981055, 1, 1, 1, 1, 1,
-1.19609, 1.167461, -0.4856513, 1, 1, 1, 1, 1,
-1.18407, -0.4630636, -2.529919, 1, 1, 1, 1, 1,
-1.169981, 0.276594, -1.518899, 1, 1, 1, 1, 1,
-1.166711, -0.376251, -1.651792, 1, 1, 1, 1, 1,
-1.162789, -0.536739, -1.744082, 1, 1, 1, 1, 1,
-1.158803, -1.239307, -1.470681, 1, 1, 1, 1, 1,
-1.153649, 1.16091, -3.135532, 0, 0, 1, 1, 1,
-1.137153, -0.3591194, -2.952058, 1, 0, 0, 1, 1,
-1.129256, 0.8378946, -1.833426, 1, 0, 0, 1, 1,
-1.12842, -0.9615545, -2.232762, 1, 0, 0, 1, 1,
-1.122218, -1.453999, -1.780065, 1, 0, 0, 1, 1,
-1.118357, 1.004526, -2.646401, 1, 0, 0, 1, 1,
-1.11166, -1.780588, -2.437045, 0, 0, 0, 1, 1,
-1.109156, 1.897711, -0.5297727, 0, 0, 0, 1, 1,
-1.105316, 0.1951241, -1.872257, 0, 0, 0, 1, 1,
-1.100937, 1.04086, -1.49878, 0, 0, 0, 1, 1,
-1.097966, -1.48473, -2.83232, 0, 0, 0, 1, 1,
-1.095148, -0.8924165, -1.668412, 0, 0, 0, 1, 1,
-1.094918, -0.2737353, -1.331889, 0, 0, 0, 1, 1,
-1.093034, -0.7161139, -2.623931, 1, 1, 1, 1, 1,
-1.086589, -0.5984689, -3.692384, 1, 1, 1, 1, 1,
-1.085136, -0.6548004, -2.183148, 1, 1, 1, 1, 1,
-1.073722, 2.080374, -0.6966602, 1, 1, 1, 1, 1,
-1.061944, 0.4598625, -0.4092546, 1, 1, 1, 1, 1,
-1.051152, -0.1355581, -1.691589, 1, 1, 1, 1, 1,
-1.050317, -0.2884401, -2.279194, 1, 1, 1, 1, 1,
-1.04818, 0.4865484, -0.8656463, 1, 1, 1, 1, 1,
-1.043938, -0.6387047, 0.3452395, 1, 1, 1, 1, 1,
-1.041809, -0.6114936, -2.440246, 1, 1, 1, 1, 1,
-1.041693, -1.427378, -1.701603, 1, 1, 1, 1, 1,
-1.039885, -0.2907737, -1.711633, 1, 1, 1, 1, 1,
-1.03824, -0.8377003, -2.505333, 1, 1, 1, 1, 1,
-1.037822, 1.023284, -1.445365, 1, 1, 1, 1, 1,
-1.025792, -0.6943486, -4.052813, 1, 1, 1, 1, 1,
-1.025763, 1.295833, -1.078807, 0, 0, 1, 1, 1,
-1.01133, 2.685747, -0.6742529, 1, 0, 0, 1, 1,
-1.010216, 0.5097082, -2.419811, 1, 0, 0, 1, 1,
-1.008243, 2.219687, -1.699311, 1, 0, 0, 1, 1,
-1.00727, 0.0002834721, -0.3833544, 1, 0, 0, 1, 1,
-0.9989442, 1.031076, -1.215765, 1, 0, 0, 1, 1,
-0.998175, -1.435425, -2.389087, 0, 0, 0, 1, 1,
-0.9881216, 0.7037364, 0.1620029, 0, 0, 0, 1, 1,
-0.9863609, 0.7447618, 0.342422, 0, 0, 0, 1, 1,
-0.9811185, 1.454486, -0.8447195, 0, 0, 0, 1, 1,
-0.97972, 0.9901799, -0.03292464, 0, 0, 0, 1, 1,
-0.9740558, 0.2120727, -1.887634, 0, 0, 0, 1, 1,
-0.9723345, -1.56328, -1.209981, 0, 0, 0, 1, 1,
-0.9703616, 0.4263983, -2.641298, 1, 1, 1, 1, 1,
-0.9684597, 0.5831943, -2.136505, 1, 1, 1, 1, 1,
-0.9655918, 0.3149276, -2.576269, 1, 1, 1, 1, 1,
-0.964567, 0.4082557, -1.821716, 1, 1, 1, 1, 1,
-0.964503, 0.6901381, 0.2771683, 1, 1, 1, 1, 1,
-0.959231, -0.2393978, -1.138207, 1, 1, 1, 1, 1,
-0.9585065, 0.7875921, -0.4717668, 1, 1, 1, 1, 1,
-0.9444484, -0.1854324, -2.576244, 1, 1, 1, 1, 1,
-0.9437309, 0.6562542, -1.88416, 1, 1, 1, 1, 1,
-0.9405996, -0.3224598, 0.2044517, 1, 1, 1, 1, 1,
-0.9401894, 0.553831, -0.5258135, 1, 1, 1, 1, 1,
-0.9297901, -0.375699, -1.65422, 1, 1, 1, 1, 1,
-0.9263017, -0.2951765, -2.402052, 1, 1, 1, 1, 1,
-0.9251556, 0.1363385, -0.9784855, 1, 1, 1, 1, 1,
-0.919551, 0.2568694, -0.6751211, 1, 1, 1, 1, 1,
-0.9159617, 0.7986535, -0.5402671, 0, 0, 1, 1, 1,
-0.9135552, 0.6023881, -0.417714, 1, 0, 0, 1, 1,
-0.9035074, 0.4842471, -0.3436024, 1, 0, 0, 1, 1,
-0.899387, -0.8138325, -0.5867484, 1, 0, 0, 1, 1,
-0.8960564, 0.08740219, -1.486532, 1, 0, 0, 1, 1,
-0.8955169, 0.08277339, -2.714044, 1, 0, 0, 1, 1,
-0.8901992, 0.6759021, -1.082099, 0, 0, 0, 1, 1,
-0.8758948, 0.2596694, -3.11326, 0, 0, 0, 1, 1,
-0.8704889, 0.4871671, -0.08785666, 0, 0, 0, 1, 1,
-0.8628605, 0.07797863, -2.605139, 0, 0, 0, 1, 1,
-0.8608, 0.8912587, -0.2271233, 0, 0, 0, 1, 1,
-0.8607646, -1.007125, -2.944301, 0, 0, 0, 1, 1,
-0.8597451, -0.1672075, -0.9313925, 0, 0, 0, 1, 1,
-0.8585749, 0.09954928, -0.9721929, 1, 1, 1, 1, 1,
-0.857046, -1.00036, -1.042889, 1, 1, 1, 1, 1,
-0.8556752, -0.8178497, -1.245086, 1, 1, 1, 1, 1,
-0.8519608, 1.082733, -1.109037, 1, 1, 1, 1, 1,
-0.8480795, 1.084887, -0.7565507, 1, 1, 1, 1, 1,
-0.8394969, -0.4113738, -1.872506, 1, 1, 1, 1, 1,
-0.8377076, -0.05824772, -2.531292, 1, 1, 1, 1, 1,
-0.8374596, -1.594743, -1.38019, 1, 1, 1, 1, 1,
-0.836853, -0.09763106, -1.062396, 1, 1, 1, 1, 1,
-0.8323696, -0.5636669, -1.333586, 1, 1, 1, 1, 1,
-0.824982, 0.6031578, 0.1244267, 1, 1, 1, 1, 1,
-0.8228056, 0.8736515, -2.553196, 1, 1, 1, 1, 1,
-0.8149676, -0.8589348, -2.018294, 1, 1, 1, 1, 1,
-0.8126362, -0.973515, -2.232835, 1, 1, 1, 1, 1,
-0.810125, 0.1508227, -2.73637, 1, 1, 1, 1, 1,
-0.8090667, 0.4259257, -2.386835, 0, 0, 1, 1, 1,
-0.8083698, 0.6396683, -1.261559, 1, 0, 0, 1, 1,
-0.804542, -1.552134, -2.897316, 1, 0, 0, 1, 1,
-0.8018678, 1.668773, -0.1221219, 1, 0, 0, 1, 1,
-0.7993646, 0.7027583, 1.21539, 1, 0, 0, 1, 1,
-0.7902561, 2.592194, 0.2291096, 1, 0, 0, 1, 1,
-0.7849815, -0.2574807, -1.599024, 0, 0, 0, 1, 1,
-0.7847766, 0.09331408, -2.644004, 0, 0, 0, 1, 1,
-0.7819802, 1.556482, -0.2192539, 0, 0, 0, 1, 1,
-0.780681, 1.318813, -0.5184694, 0, 0, 0, 1, 1,
-0.7802315, 0.7280966, -1.492728, 0, 0, 0, 1, 1,
-0.7777843, 0.1896364, -1.951928, 0, 0, 0, 1, 1,
-0.7762382, 1.25273, -0.006977032, 0, 0, 0, 1, 1,
-0.7757692, 1.136876, 0.01491426, 1, 1, 1, 1, 1,
-0.7741359, -0.1623068, -4.243781, 1, 1, 1, 1, 1,
-0.7695094, 0.7721918, 0.394162, 1, 1, 1, 1, 1,
-0.7675427, 2.245904, -0.577539, 1, 1, 1, 1, 1,
-0.7647457, 0.7497858, -1.323051, 1, 1, 1, 1, 1,
-0.7644494, 1.466751, -1.391005, 1, 1, 1, 1, 1,
-0.764012, 0.1393955, -0.02308739, 1, 1, 1, 1, 1,
-0.7637961, -2.38268, -2.772429, 1, 1, 1, 1, 1,
-0.7633651, -0.6594054, -1.630954, 1, 1, 1, 1, 1,
-0.7630356, -1.171968, -2.302646, 1, 1, 1, 1, 1,
-0.7569809, 0.23262, -2.499638, 1, 1, 1, 1, 1,
-0.7517948, 0.6115404, -3.155874, 1, 1, 1, 1, 1,
-0.7480716, -0.0737529, -1.591257, 1, 1, 1, 1, 1,
-0.7417349, -1.065548, -1.58538, 1, 1, 1, 1, 1,
-0.7388893, -0.1475595, -3.941365, 1, 1, 1, 1, 1,
-0.7334322, -0.2783766, -3.554779, 0, 0, 1, 1, 1,
-0.7333227, -1.447794, -2.427103, 1, 0, 0, 1, 1,
-0.7325043, 1.297674, -1.281392, 1, 0, 0, 1, 1,
-0.730884, 0.6499832, -0.7918265, 1, 0, 0, 1, 1,
-0.7260947, 0.9136384, -0.09180894, 1, 0, 0, 1, 1,
-0.7253514, 0.4849377, -0.07297155, 1, 0, 0, 1, 1,
-0.7253386, -1.911579, -1.63558, 0, 0, 0, 1, 1,
-0.7207839, 1.477855, -1.109604, 0, 0, 0, 1, 1,
-0.7149568, 0.3250875, -2.579722, 0, 0, 0, 1, 1,
-0.7141744, 0.08121744, -2.086247, 0, 0, 0, 1, 1,
-0.7064377, -1.032899, -3.460418, 0, 0, 0, 1, 1,
-0.7052165, -0.361823, -2.530516, 0, 0, 0, 1, 1,
-0.7006027, 0.1225521, -0.1482584, 0, 0, 0, 1, 1,
-0.6999762, -0.3614157, -0.6085721, 1, 1, 1, 1, 1,
-0.6952705, -1.874619, -1.411503, 1, 1, 1, 1, 1,
-0.6904607, 0.4913779, -1.466074, 1, 1, 1, 1, 1,
-0.6887282, 0.107648, -1.326382, 1, 1, 1, 1, 1,
-0.6867821, -0.7258953, -2.477682, 1, 1, 1, 1, 1,
-0.6855046, 0.437958, -1.798152, 1, 1, 1, 1, 1,
-0.6815892, 1.846471, -1.207459, 1, 1, 1, 1, 1,
-0.6810729, 2.297173, -2.054836, 1, 1, 1, 1, 1,
-0.6809217, -0.315505, -1.509107, 1, 1, 1, 1, 1,
-0.680193, 0.5232037, -0.05098037, 1, 1, 1, 1, 1,
-0.6798933, -0.6191587, -2.523323, 1, 1, 1, 1, 1,
-0.6772175, -0.00488343, -1.758808, 1, 1, 1, 1, 1,
-0.6766921, 0.5271831, -1.359626, 1, 1, 1, 1, 1,
-0.6723025, 1.283818, 0.3187789, 1, 1, 1, 1, 1,
-0.6694608, -1.295832, -0.02653207, 1, 1, 1, 1, 1,
-0.6694171, 0.07417862, -1.551195, 0, 0, 1, 1, 1,
-0.6682547, -0.1966973, -1.131695, 1, 0, 0, 1, 1,
-0.6673606, 0.6203685, -0.1132242, 1, 0, 0, 1, 1,
-0.6642644, 0.2095017, -3.120099, 1, 0, 0, 1, 1,
-0.6588345, 0.7312667, 0.8151113, 1, 0, 0, 1, 1,
-0.6544386, 1.617436, 1.103066, 1, 0, 0, 1, 1,
-0.6538746, -1.737511, -1.760652, 0, 0, 0, 1, 1,
-0.6515827, 0.3250609, -1.426496, 0, 0, 0, 1, 1,
-0.6512763, -1.114764, -5.144217, 0, 0, 0, 1, 1,
-0.6435282, 1.427096, 1.28707, 0, 0, 0, 1, 1,
-0.6383434, -1.355899, -4.068477, 0, 0, 0, 1, 1,
-0.6334967, -0.668389, -2.135966, 0, 0, 0, 1, 1,
-0.6274186, -1.480688, -2.28279, 0, 0, 0, 1, 1,
-0.6258728, -0.1784617, -2.187024, 1, 1, 1, 1, 1,
-0.6257033, -0.5943654, -0.2298455, 1, 1, 1, 1, 1,
-0.6254247, -0.5199685, -1.293697, 1, 1, 1, 1, 1,
-0.6169186, 1.076401, 0.09238142, 1, 1, 1, 1, 1,
-0.6156772, -1.01885, -2.239755, 1, 1, 1, 1, 1,
-0.6149863, 0.1487279, -3.286103, 1, 1, 1, 1, 1,
-0.6131334, -0.8320656, -1.819741, 1, 1, 1, 1, 1,
-0.6126493, -0.8628162, -2.302207, 1, 1, 1, 1, 1,
-0.6112818, -1.303816, -2.033688, 1, 1, 1, 1, 1,
-0.6091641, -0.1249318, -2.223982, 1, 1, 1, 1, 1,
-0.6086908, -2.022668, -1.748691, 1, 1, 1, 1, 1,
-0.6070787, 0.32664, -3.165752, 1, 1, 1, 1, 1,
-0.6057525, -1.317988, -2.415416, 1, 1, 1, 1, 1,
-0.6044859, -1.033655, -2.071602, 1, 1, 1, 1, 1,
-0.6012707, 0.4141421, -1.089147, 1, 1, 1, 1, 1,
-0.5973067, 1.84496, 0.3680723, 0, 0, 1, 1, 1,
-0.5958055, 0.6052856, -0.3257684, 1, 0, 0, 1, 1,
-0.5923465, 1.207896, -1.119094, 1, 0, 0, 1, 1,
-0.5911655, 1.390345, -2.255462, 1, 0, 0, 1, 1,
-0.5814233, -0.8676979, -3.743974, 1, 0, 0, 1, 1,
-0.5748879, -0.3890133, -2.990801, 1, 0, 0, 1, 1,
-0.5731744, 0.9343044, -0.7173429, 0, 0, 0, 1, 1,
-0.5690631, -0.3842855, -2.166901, 0, 0, 0, 1, 1,
-0.5619276, -0.09177838, -1.922654, 0, 0, 0, 1, 1,
-0.5594961, 1.010735, -0.1793503, 0, 0, 0, 1, 1,
-0.5593981, 0.4906221, -1.88133, 0, 0, 0, 1, 1,
-0.5519378, -0.3602799, -1.330284, 0, 0, 0, 1, 1,
-0.551779, -0.161712, -2.405352, 0, 0, 0, 1, 1,
-0.5483642, -0.4999089, -1.78105, 1, 1, 1, 1, 1,
-0.5332799, 0.5860252, 0.9723008, 1, 1, 1, 1, 1,
-0.5332065, -0.4642318, -2.984798, 1, 1, 1, 1, 1,
-0.5272455, 0.6235964, -0.5843194, 1, 1, 1, 1, 1,
-0.5263246, -0.8492169, -2.772236, 1, 1, 1, 1, 1,
-0.524368, -1.959055, -1.37824, 1, 1, 1, 1, 1,
-0.5151821, 0.01884715, -0.7149118, 1, 1, 1, 1, 1,
-0.5135652, -0.334543, -1.332585, 1, 1, 1, 1, 1,
-0.5084361, 1.031117, 0.4741351, 1, 1, 1, 1, 1,
-0.5076882, -0.1794868, -1.558514, 1, 1, 1, 1, 1,
-0.5059789, -0.07430783, -0.500815, 1, 1, 1, 1, 1,
-0.5047148, 0.7085246, -1.921792, 1, 1, 1, 1, 1,
-0.4930599, -0.1085823, -1.75476, 1, 1, 1, 1, 1,
-0.4920231, -0.7466639, -2.866651, 1, 1, 1, 1, 1,
-0.4877343, -0.6379967, -3.617715, 1, 1, 1, 1, 1,
-0.4841844, -0.3611295, 0.3424061, 0, 0, 1, 1, 1,
-0.4836357, -1.938618, -2.438724, 1, 0, 0, 1, 1,
-0.4720411, -1.211745, -1.218839, 1, 0, 0, 1, 1,
-0.4713655, 0.1804837, 0.3010838, 1, 0, 0, 1, 1,
-0.46755, 0.9472372, 0.1477327, 1, 0, 0, 1, 1,
-0.4631082, 1.675595, -1.662494, 1, 0, 0, 1, 1,
-0.4621915, -1.311439, -2.615578, 0, 0, 0, 1, 1,
-0.4603806, 0.3232104, -0.1174814, 0, 0, 0, 1, 1,
-0.4581312, 1.516193, 0.4936882, 0, 0, 0, 1, 1,
-0.4486462, -1.532225, -4.005812, 0, 0, 0, 1, 1,
-0.4378035, -0.8872267, -2.80029, 0, 0, 0, 1, 1,
-0.425738, -0.7262803, -1.804572, 0, 0, 0, 1, 1,
-0.4253521, -1.910575, -4.66306, 0, 0, 0, 1, 1,
-0.4217139, -1.774194, -1.640555, 1, 1, 1, 1, 1,
-0.4192639, 1.14688, -1.531519, 1, 1, 1, 1, 1,
-0.4107253, -0.3636525, -2.085824, 1, 1, 1, 1, 1,
-0.4087241, -0.8875958, -0.2974097, 1, 1, 1, 1, 1,
-0.4086956, 0.5950518, -0.3645765, 1, 1, 1, 1, 1,
-0.4061804, -0.3979014, -1.203337, 1, 1, 1, 1, 1,
-0.4048398, -0.03131159, -1.126812, 1, 1, 1, 1, 1,
-0.4039764, 0.2537316, -2.035968, 1, 1, 1, 1, 1,
-0.402171, 0.310163, -1.513773, 1, 1, 1, 1, 1,
-0.3970809, -1.311567, -2.133954, 1, 1, 1, 1, 1,
-0.3918146, 0.02080143, -3.068928, 1, 1, 1, 1, 1,
-0.3900495, 0.1276202, -1.263815, 1, 1, 1, 1, 1,
-0.3870546, 2.196689, 0.3875762, 1, 1, 1, 1, 1,
-0.3861828, 0.5398941, -1.644174, 1, 1, 1, 1, 1,
-0.3847869, -0.7767534, -1.00154, 1, 1, 1, 1, 1,
-0.3829536, 0.02274125, -2.755951, 0, 0, 1, 1, 1,
-0.377111, 0.01703281, -0.8047209, 1, 0, 0, 1, 1,
-0.3766616, -0.1088842, -1.237699, 1, 0, 0, 1, 1,
-0.3756522, -1.131402, -2.36806, 1, 0, 0, 1, 1,
-0.3688298, 1.216697, 1.310689, 1, 0, 0, 1, 1,
-0.3667737, 0.05565057, -1.514492, 1, 0, 0, 1, 1,
-0.3599673, -0.1782234, -3.957614, 0, 0, 0, 1, 1,
-0.3577887, 0.3587725, -0.7427789, 0, 0, 0, 1, 1,
-0.3567402, -0.9344471, -0.5722595, 0, 0, 0, 1, 1,
-0.3545258, 0.5835568, -0.3806638, 0, 0, 0, 1, 1,
-0.3514654, -0.04363138, -2.13203, 0, 0, 0, 1, 1,
-0.3496321, 0.5261806, 0.6927847, 0, 0, 0, 1, 1,
-0.3455081, -0.1952204, -2.70723, 0, 0, 0, 1, 1,
-0.3435899, 0.2477493, -1.48755, 1, 1, 1, 1, 1,
-0.3394304, 2.41949, -0.6492768, 1, 1, 1, 1, 1,
-0.3389803, -0.8960231, -3.256092, 1, 1, 1, 1, 1,
-0.3389708, 0.3232815, 0.03583018, 1, 1, 1, 1, 1,
-0.330827, -0.4406593, -1.675816, 1, 1, 1, 1, 1,
-0.329311, -1.064337, -2.240423, 1, 1, 1, 1, 1,
-0.3264245, -1.112754, -2.615599, 1, 1, 1, 1, 1,
-0.3252967, -0.616587, -2.941579, 1, 1, 1, 1, 1,
-0.3226208, -0.4653529, -1.86396, 1, 1, 1, 1, 1,
-0.3138111, -0.3346344, -1.934255, 1, 1, 1, 1, 1,
-0.3137344, 0.2694265, -2.235476, 1, 1, 1, 1, 1,
-0.3120721, 0.5649559, 1.315025, 1, 1, 1, 1, 1,
-0.3106697, -1.140047, -5.78172, 1, 1, 1, 1, 1,
-0.3103382, 1.926938, 0.3831496, 1, 1, 1, 1, 1,
-0.3081532, -0.804368, -2.667446, 1, 1, 1, 1, 1,
-0.3049164, 0.2887006, -0.729377, 0, 0, 1, 1, 1,
-0.3021707, -1.205369, -1.480628, 1, 0, 0, 1, 1,
-0.2976441, -1.344779, -2.662648, 1, 0, 0, 1, 1,
-0.2961968, 1.374177, 0.2105291, 1, 0, 0, 1, 1,
-0.296167, 1.011199, -1.193845, 1, 0, 0, 1, 1,
-0.2951328, -0.1459948, -2.21608, 1, 0, 0, 1, 1,
-0.2910965, -0.2164737, -3.543763, 0, 0, 0, 1, 1,
-0.288588, 1.055423, -0.54609, 0, 0, 0, 1, 1,
-0.2865179, -1.302786, -2.581892, 0, 0, 0, 1, 1,
-0.282905, -0.6432794, -3.403383, 0, 0, 0, 1, 1,
-0.2817717, 1.043032, 1.956801, 0, 0, 0, 1, 1,
-0.2791039, -1.55511, -3.887628, 0, 0, 0, 1, 1,
-0.2770982, -0.8792329, -3.423691, 0, 0, 0, 1, 1,
-0.2745528, 0.2950687, -0.09994337, 1, 1, 1, 1, 1,
-0.274261, 0.1321265, -1.333423, 1, 1, 1, 1, 1,
-0.2589086, -0.5295463, -2.211507, 1, 1, 1, 1, 1,
-0.2573628, 1.492139, 0.4746871, 1, 1, 1, 1, 1,
-0.2573411, 0.5274311, -0.1645982, 1, 1, 1, 1, 1,
-0.2556443, 1.033545, -0.7785309, 1, 1, 1, 1, 1,
-0.2506004, 0.02993077, -3.752858, 1, 1, 1, 1, 1,
-0.2502363, -0.1208891, -1.450933, 1, 1, 1, 1, 1,
-0.2414588, -0.05145669, -2.259909, 1, 1, 1, 1, 1,
-0.2383669, -0.4414273, -3.198488, 1, 1, 1, 1, 1,
-0.237082, 0.6148467, 0.589494, 1, 1, 1, 1, 1,
-0.2310714, 0.2262826, 0.2937645, 1, 1, 1, 1, 1,
-0.2238396, -0.4222568, -5.246687, 1, 1, 1, 1, 1,
-0.2215575, 0.5473441, -0.5802693, 1, 1, 1, 1, 1,
-0.2145485, -1.350142, -3.68469, 1, 1, 1, 1, 1,
-0.2135287, -0.06659074, -1.099569, 0, 0, 1, 1, 1,
-0.2127804, 0.2017192, -0.1646366, 1, 0, 0, 1, 1,
-0.2103395, 1.79314, 0.03450234, 1, 0, 0, 1, 1,
-0.210262, -0.9007197, -4.084375, 1, 0, 0, 1, 1,
-0.209064, -1.200907, -1.872971, 1, 0, 0, 1, 1,
-0.201039, -0.0898729, -1.414084, 1, 0, 0, 1, 1,
-0.1903977, -1.569625, -3.85899, 0, 0, 0, 1, 1,
-0.1900319, -0.5543609, -3.498798, 0, 0, 0, 1, 1,
-0.1865876, -3.093666, -3.292432, 0, 0, 0, 1, 1,
-0.1833312, 1.005112, 0.3974898, 0, 0, 0, 1, 1,
-0.17804, -0.1036874, -3.900859, 0, 0, 0, 1, 1,
-0.1776152, 0.0686603, 0.8086033, 0, 0, 0, 1, 1,
-0.1766596, -0.7427799, -3.406995, 0, 0, 0, 1, 1,
-0.1762151, -0.392536, -2.305357, 1, 1, 1, 1, 1,
-0.1760091, 0.9603523, 0.4811333, 1, 1, 1, 1, 1,
-0.1710113, 1.648026, -0.5500857, 1, 1, 1, 1, 1,
-0.1691606, -0.129366, -2.685687, 1, 1, 1, 1, 1,
-0.1672775, -0.3210653, -2.013635, 1, 1, 1, 1, 1,
-0.164435, 0.902865, -1.684825, 1, 1, 1, 1, 1,
-0.1642929, 1.215071, -0.6383747, 1, 1, 1, 1, 1,
-0.1627804, -0.4441029, -3.061717, 1, 1, 1, 1, 1,
-0.160986, -1.263215, -3.885896, 1, 1, 1, 1, 1,
-0.1562536, 0.2445162, -1.484343, 1, 1, 1, 1, 1,
-0.153945, 0.913888, 1.275643, 1, 1, 1, 1, 1,
-0.1520399, -1.025493, -5.227245, 1, 1, 1, 1, 1,
-0.1511349, -0.7809661, -0.179151, 1, 1, 1, 1, 1,
-0.1476789, -1.103792, -2.431847, 1, 1, 1, 1, 1,
-0.1422302, -0.3152908, -3.662305, 1, 1, 1, 1, 1,
-0.1384477, 0.2679979, -1.206508, 0, 0, 1, 1, 1,
-0.1319353, 0.3195599, -0.554707, 1, 0, 0, 1, 1,
-0.131206, -0.01025715, -2.444312, 1, 0, 0, 1, 1,
-0.1289528, -1.159907, -3.169588, 1, 0, 0, 1, 1,
-0.1270239, -3.250019, -2.459724, 1, 0, 0, 1, 1,
-0.1262932, 1.19458, 0.2498478, 1, 0, 0, 1, 1,
-0.1246563, -0.7131649, -4.064771, 0, 0, 0, 1, 1,
-0.1240585, 0.5528598, 0.9279014, 0, 0, 0, 1, 1,
-0.1227897, 0.526703, -1.165112, 0, 0, 0, 1, 1,
-0.1218249, -0.1561465, -2.247443, 0, 0, 0, 1, 1,
-0.1212407, -1.02906, -1.247563, 0, 0, 0, 1, 1,
-0.1195419, 0.05000173, -1.369132, 0, 0, 0, 1, 1,
-0.114596, -0.2876655, -3.853577, 0, 0, 0, 1, 1,
-0.1010589, -0.001470747, -0.305211, 1, 1, 1, 1, 1,
-0.1004168, 0.8378709, -0.7271971, 1, 1, 1, 1, 1,
-0.100209, 0.9119743, 0.6038764, 1, 1, 1, 1, 1,
-0.09851547, -0.5523787, -3.401292, 1, 1, 1, 1, 1,
-0.09755562, 1.732456, -1.137786, 1, 1, 1, 1, 1,
-0.09296557, 0.6515762, -0.1593914, 1, 1, 1, 1, 1,
-0.08846813, -0.1450027, -2.773865, 1, 1, 1, 1, 1,
-0.08400803, 0.756125, 0.6770266, 1, 1, 1, 1, 1,
-0.08330943, 0.7673187, 0.5909581, 1, 1, 1, 1, 1,
-0.07584466, 1.234122, -1.912664, 1, 1, 1, 1, 1,
-0.07522727, -0.8415754, -2.187211, 1, 1, 1, 1, 1,
-0.07383013, -0.3665098, -2.745308, 1, 1, 1, 1, 1,
-0.06741552, -0.5834551, -3.886736, 1, 1, 1, 1, 1,
-0.06340723, 1.681886, -0.537142, 1, 1, 1, 1, 1,
-0.06213789, -1.040127, -4.124846, 1, 1, 1, 1, 1,
-0.05713296, -0.896696, -3.5961, 0, 0, 1, 1, 1,
-0.04823368, -1.19263, -5.080425, 1, 0, 0, 1, 1,
-0.04333674, 0.5828959, 0.4465852, 1, 0, 0, 1, 1,
-0.0403566, -1.286092, -4.361786, 1, 0, 0, 1, 1,
-0.03763228, 0.3860107, 0.7381094, 1, 0, 0, 1, 1,
-0.03722012, -0.3093862, -1.879445, 1, 0, 0, 1, 1,
-0.03707367, -0.3237536, -2.665979, 0, 0, 0, 1, 1,
-0.03705367, 2.882574, 0.3193224, 0, 0, 0, 1, 1,
-0.03038255, 0.7605315, 1.476709, 0, 0, 0, 1, 1,
-0.02915847, -0.6304415, -2.51111, 0, 0, 0, 1, 1,
-0.02457315, -0.09525348, -2.995396, 0, 0, 0, 1, 1,
-0.02157965, -0.5007564, -3.250385, 0, 0, 0, 1, 1,
-0.02153322, 0.3185197, -0.05663409, 0, 0, 0, 1, 1,
-0.02102298, -1.2733, -1.841985, 1, 1, 1, 1, 1,
-0.01945546, 0.4948671, 0.5330648, 1, 1, 1, 1, 1,
-0.01944038, -0.05048402, -2.977398, 1, 1, 1, 1, 1,
-0.0163347, 0.9296863, 1.144502, 1, 1, 1, 1, 1,
-0.01420813, -2.029246, -3.817394, 1, 1, 1, 1, 1,
-0.01375498, 1.490381, -0.3554813, 1, 1, 1, 1, 1,
-0.0132045, -0.4036393, -3.305745, 1, 1, 1, 1, 1,
-0.01274103, 0.02101169, -1.224403, 1, 1, 1, 1, 1,
-0.01045014, -0.0564843, -1.741878, 1, 1, 1, 1, 1,
-0.00389468, -0.9587492, -2.785144, 1, 1, 1, 1, 1,
-0.003453568, 0.4060992, 1.530329, 1, 1, 1, 1, 1,
-0.00319202, 0.4447704, 0.08582342, 1, 1, 1, 1, 1,
-0.0016821, 0.1022691, -0.6532745, 1, 1, 1, 1, 1,
-0.0005000018, -0.2881309, -1.709046, 1, 1, 1, 1, 1,
0.0002742406, -0.09300704, 2.531228, 1, 1, 1, 1, 1,
0.002489297, -0.8645375, 2.805831, 0, 0, 1, 1, 1,
0.005172744, 0.3964155, -0.6842918, 1, 0, 0, 1, 1,
0.005696811, 0.1577048, 1.61154, 1, 0, 0, 1, 1,
0.007431593, 0.1285228, 1.231895, 1, 0, 0, 1, 1,
0.009854103, -0.7008359, 1.642898, 1, 0, 0, 1, 1,
0.01346371, 0.3950307, 1.833864, 1, 0, 0, 1, 1,
0.01372006, 1.331209, -0.8247275, 0, 0, 0, 1, 1,
0.01442094, 1.60254, -0.2590134, 0, 0, 0, 1, 1,
0.01633225, -0.070332, 4.240183, 0, 0, 0, 1, 1,
0.02210739, -1.390748, 3.69308, 0, 0, 0, 1, 1,
0.03032634, -0.414515, 1.140334, 0, 0, 0, 1, 1,
0.03476322, -0.0365084, 2.523271, 0, 0, 0, 1, 1,
0.0347744, -1.801856, 2.494343, 0, 0, 0, 1, 1,
0.03521667, -1.025358, 0.5944431, 1, 1, 1, 1, 1,
0.03588844, 0.02708966, 0.9969082, 1, 1, 1, 1, 1,
0.03635611, 0.01698947, 1.040769, 1, 1, 1, 1, 1,
0.03797487, -0.09102822, 2.29862, 1, 1, 1, 1, 1,
0.03984252, -0.3029981, 3.00255, 1, 1, 1, 1, 1,
0.04291235, 0.03304498, 0.3079829, 1, 1, 1, 1, 1,
0.0434721, -0.1445222, 1.684227, 1, 1, 1, 1, 1,
0.04694644, 0.3903188, -0.1827788, 1, 1, 1, 1, 1,
0.04700276, 0.04339872, -0.7628922, 1, 1, 1, 1, 1,
0.04784071, 0.4404674, -0.4179715, 1, 1, 1, 1, 1,
0.04812633, 1.492864, 1.919223, 1, 1, 1, 1, 1,
0.0538165, 0.4532959, 0.2279084, 1, 1, 1, 1, 1,
0.0552675, 1.261429, -0.1050671, 1, 1, 1, 1, 1,
0.05681848, 0.130944, 0.6734318, 1, 1, 1, 1, 1,
0.06005912, -0.07715172, 4.239139, 1, 1, 1, 1, 1,
0.06586132, 0.4262742, -2.006291, 0, 0, 1, 1, 1,
0.06611363, -0.6200274, 2.328112, 1, 0, 0, 1, 1,
0.06898596, 0.5336978, -2.527613, 1, 0, 0, 1, 1,
0.06913345, -0.02740766, 1.799505, 1, 0, 0, 1, 1,
0.07121564, -0.1616666, 2.727696, 1, 0, 0, 1, 1,
0.07335091, -0.3009022, 2.241848, 1, 0, 0, 1, 1,
0.07842983, -1.044032, 2.033055, 0, 0, 0, 1, 1,
0.07849562, -0.8975823, 4.458531, 0, 0, 0, 1, 1,
0.08151501, -0.3898807, 3.172831, 0, 0, 0, 1, 1,
0.08284405, 1.144056, -2.281183, 0, 0, 0, 1, 1,
0.0841434, 0.593743, 1.434282, 0, 0, 0, 1, 1,
0.08561746, -0.02972883, 1.266635, 0, 0, 0, 1, 1,
0.09326738, -1.060121, 3.258798, 0, 0, 0, 1, 1,
0.1056206, -0.07096395, 0.3848821, 1, 1, 1, 1, 1,
0.1072396, 1.020263, -1.043021, 1, 1, 1, 1, 1,
0.1105518, -0.2057118, 2.122767, 1, 1, 1, 1, 1,
0.1130543, 0.161391, -0.1049529, 1, 1, 1, 1, 1,
0.1210995, -1.152669, 4.189006, 1, 1, 1, 1, 1,
0.1213214, -0.1771844, 3.526704, 1, 1, 1, 1, 1,
0.1231609, -0.001373781, 0.7480736, 1, 1, 1, 1, 1,
0.1234546, -0.6452971, 1.082485, 1, 1, 1, 1, 1,
0.1269702, 1.099279, -0.3545355, 1, 1, 1, 1, 1,
0.1324198, -0.09746693, 2.72212, 1, 1, 1, 1, 1,
0.133942, 1.080659, -1.055784, 1, 1, 1, 1, 1,
0.1412945, 1.537223, -0.5673231, 1, 1, 1, 1, 1,
0.1414526, -1.114041, 3.016496, 1, 1, 1, 1, 1,
0.1437099, -0.7597348, 3.493569, 1, 1, 1, 1, 1,
0.1502158, 1.997122, 0.8229752, 1, 1, 1, 1, 1,
0.1511303, -0.6123133, 2.826923, 0, 0, 1, 1, 1,
0.1516779, 0.8451894, 0.5169398, 1, 0, 0, 1, 1,
0.1521541, -1.562593, 4.047868, 1, 0, 0, 1, 1,
0.1599983, -0.626771, 3.661501, 1, 0, 0, 1, 1,
0.1601447, 2.541959, -1.227002, 1, 0, 0, 1, 1,
0.1615019, -0.3993941, 2.98504, 1, 0, 0, 1, 1,
0.1661344, 0.8656762, 1.640826, 0, 0, 0, 1, 1,
0.1679917, 1.452891, -0.2896832, 0, 0, 0, 1, 1,
0.1709116, 2.296934, 0.06601533, 0, 0, 0, 1, 1,
0.1721879, -0.4991919, 1.596607, 0, 0, 0, 1, 1,
0.1724392, 0.6202238, 0.640001, 0, 0, 0, 1, 1,
0.1732454, -1.084722, 2.754254, 0, 0, 0, 1, 1,
0.173448, 0.6946008, -0.6212661, 0, 0, 0, 1, 1,
0.177319, -0.2718323, 1.908504, 1, 1, 1, 1, 1,
0.1783035, 1.651598, 0.5245757, 1, 1, 1, 1, 1,
0.1785279, 6.518199e-06, 1.186772, 1, 1, 1, 1, 1,
0.1788978, -0.6522586, 1.994784, 1, 1, 1, 1, 1,
0.1798937, 0.2932061, 2.314962, 1, 1, 1, 1, 1,
0.1831173, 0.5828242, 0.9733493, 1, 1, 1, 1, 1,
0.1831969, -0.2117405, 3.625818, 1, 1, 1, 1, 1,
0.1861953, -0.8802352, 2.409239, 1, 1, 1, 1, 1,
0.1862148, 0.8784522, 0.1919185, 1, 1, 1, 1, 1,
0.1870216, -0.2775275, 2.980199, 1, 1, 1, 1, 1,
0.1911574, -1.019629, 3.913527, 1, 1, 1, 1, 1,
0.1924573, 0.3916482, -0.4448908, 1, 1, 1, 1, 1,
0.1929373, -0.372839, 2.082447, 1, 1, 1, 1, 1,
0.1935202, -0.4466611, 1.821313, 1, 1, 1, 1, 1,
0.1970912, -0.7530948, 2.916065, 1, 1, 1, 1, 1,
0.2053237, -1.260134, 1.868665, 0, 0, 1, 1, 1,
0.2073509, -0.5666242, 3.167127, 1, 0, 0, 1, 1,
0.2076839, 0.1730736, -1.123356, 1, 0, 0, 1, 1,
0.2084156, -0.9479961, 4.178038, 1, 0, 0, 1, 1,
0.2105057, -0.4137202, 1.221368, 1, 0, 0, 1, 1,
0.2126555, -0.6080899, 2.798578, 1, 0, 0, 1, 1,
0.2143241, -0.74971, 3.41644, 0, 0, 0, 1, 1,
0.2176, -0.3060548, 0.8307599, 0, 0, 0, 1, 1,
0.2184969, -0.9763739, 3.14848, 0, 0, 0, 1, 1,
0.2271844, -0.01466822, 0.1700569, 0, 0, 0, 1, 1,
0.2272936, -0.4591127, 1.516769, 0, 0, 0, 1, 1,
0.237744, -0.7077304, 2.638666, 0, 0, 0, 1, 1,
0.2379652, -1.246055, 3.516479, 0, 0, 0, 1, 1,
0.239539, -1.102316, 2.000821, 1, 1, 1, 1, 1,
0.2418501, 0.5000651, -0.1348455, 1, 1, 1, 1, 1,
0.2418895, -0.4998222, 2.314888, 1, 1, 1, 1, 1,
0.243046, 0.7147099, 0.07918038, 1, 1, 1, 1, 1,
0.2432132, 0.06959175, 2.259028, 1, 1, 1, 1, 1,
0.2433999, 0.007183826, 2.050946, 1, 1, 1, 1, 1,
0.2452023, -0.2431577, 2.609962, 1, 1, 1, 1, 1,
0.2476338, 1.957007, -1.211613, 1, 1, 1, 1, 1,
0.2518525, -1.363639, 2.393359, 1, 1, 1, 1, 1,
0.2576395, 0.9596542, -0.9689709, 1, 1, 1, 1, 1,
0.2643312, 0.6278568, 0.5450011, 1, 1, 1, 1, 1,
0.2662362, -1.87707, 4.016707, 1, 1, 1, 1, 1,
0.266556, -2.052416, 2.135526, 1, 1, 1, 1, 1,
0.2669003, -0.6184972, 1.788113, 1, 1, 1, 1, 1,
0.2680848, -0.8641927, 4.042391, 1, 1, 1, 1, 1,
0.2690532, 0.01213574, 2.272295, 0, 0, 1, 1, 1,
0.2702749, -1.505647, 2.130251, 1, 0, 0, 1, 1,
0.2728555, 0.9598275, 0.02138122, 1, 0, 0, 1, 1,
0.278508, 1.770662, -1.0956, 1, 0, 0, 1, 1,
0.2796283, 0.5750511, -0.3081984, 1, 0, 0, 1, 1,
0.2799986, 0.196735, 0.4221757, 1, 0, 0, 1, 1,
0.2841044, 0.5383319, 0.4545053, 0, 0, 0, 1, 1,
0.2851624, -0.01598785, 1.089611, 0, 0, 0, 1, 1,
0.2855608, -3.516646, 1.615764, 0, 0, 0, 1, 1,
0.2872088, -1.20756, 2.509381, 0, 0, 0, 1, 1,
0.2896008, 1.486275, 1.753516, 0, 0, 0, 1, 1,
0.2966987, 0.7717482, 0.4686055, 0, 0, 0, 1, 1,
0.297792, 1.408749, 0.6800917, 0, 0, 0, 1, 1,
0.3003368, 0.2757497, 0.9471799, 1, 1, 1, 1, 1,
0.3029522, 0.5645294, 0.1082541, 1, 1, 1, 1, 1,
0.3036901, -1.760424, 1.833991, 1, 1, 1, 1, 1,
0.3102855, 0.5135333, 1.158007, 1, 1, 1, 1, 1,
0.314962, -0.9763149, 2.436999, 1, 1, 1, 1, 1,
0.3170008, 0.2736211, 0.3022288, 1, 1, 1, 1, 1,
0.3216765, 0.895483, 0.422192, 1, 1, 1, 1, 1,
0.3239996, 0.2646439, 1.101554, 1, 1, 1, 1, 1,
0.3254382, -1.793041, 3.477091, 1, 1, 1, 1, 1,
0.3331132, -1.319448, 1.709027, 1, 1, 1, 1, 1,
0.334786, -0.44893, 1.531107, 1, 1, 1, 1, 1,
0.336399, -0.5445394, 4.874414, 1, 1, 1, 1, 1,
0.340136, 0.03193378, 1.172665, 1, 1, 1, 1, 1,
0.3407354, -1.428767, 1.939922, 1, 1, 1, 1, 1,
0.3512425, -0.5169199, 2.544278, 1, 1, 1, 1, 1,
0.3568213, -0.1995652, 2.895012, 0, 0, 1, 1, 1,
0.3589493, -0.002268748, 4.474272, 1, 0, 0, 1, 1,
0.3597675, 0.7364626, 0.5851275, 1, 0, 0, 1, 1,
0.3604289, 0.0537811, 0.8613487, 1, 0, 0, 1, 1,
0.3618751, 0.2315954, 1.32829, 1, 0, 0, 1, 1,
0.3631455, -0.2400772, 2.081535, 1, 0, 0, 1, 1,
0.3645577, -0.3922376, 1.623343, 0, 0, 0, 1, 1,
0.3695567, -1.495068, 4.556708, 0, 0, 0, 1, 1,
0.3769591, 0.4144758, 2.422707, 0, 0, 0, 1, 1,
0.3770625, 0.6064013, 1.887769, 0, 0, 0, 1, 1,
0.3805582, 0.4945533, 1.289842, 0, 0, 0, 1, 1,
0.3852372, 1.843974, -1.490906, 0, 0, 0, 1, 1,
0.3852834, -0.3718398, 1.810155, 0, 0, 0, 1, 1,
0.3854938, -1.978091, 2.985368, 1, 1, 1, 1, 1,
0.3858019, 0.7701976, 1.525814, 1, 1, 1, 1, 1,
0.3872066, -0.3160926, 2.45211, 1, 1, 1, 1, 1,
0.387487, -0.9308828, 3.260157, 1, 1, 1, 1, 1,
0.3899285, -0.3126616, 1.192171, 1, 1, 1, 1, 1,
0.3923781, 1.226112, 1.194126, 1, 1, 1, 1, 1,
0.3925605, 1.902986, 1.744256, 1, 1, 1, 1, 1,
0.3978245, 0.1154381, 0.02104446, 1, 1, 1, 1, 1,
0.3988863, -1.410071, 3.378657, 1, 1, 1, 1, 1,
0.4010826, 0.524947, 1.550257, 1, 1, 1, 1, 1,
0.4016217, 0.2052912, 3.074982, 1, 1, 1, 1, 1,
0.4026909, 0.5295789, -0.0527119, 1, 1, 1, 1, 1,
0.40563, -1.151144, 2.770108, 1, 1, 1, 1, 1,
0.4076822, -1.104114, 3.099895, 1, 1, 1, 1, 1,
0.4121149, -0.2780306, 2.256822, 1, 1, 1, 1, 1,
0.4162579, -0.1644311, 1.761071, 0, 0, 1, 1, 1,
0.4194255, 0.8027858, 0.5822678, 1, 0, 0, 1, 1,
0.4198046, 0.6701892, 0.06943338, 1, 0, 0, 1, 1,
0.4202731, 0.5009791, 1.861802, 1, 0, 0, 1, 1,
0.4220373, 0.08718392, 0.6857761, 1, 0, 0, 1, 1,
0.4223343, -0.935531, 1.715881, 1, 0, 0, 1, 1,
0.4238152, 0.5793136, 0.9219847, 0, 0, 0, 1, 1,
0.4241498, 0.3909265, -0.8315335, 0, 0, 0, 1, 1,
0.4258415, 0.1451661, 1.508262, 0, 0, 0, 1, 1,
0.4280047, 1.227467, 0.9007293, 0, 0, 0, 1, 1,
0.4288944, -0.9804756, 2.354496, 0, 0, 0, 1, 1,
0.4334537, 0.8658993, 0.5948478, 0, 0, 0, 1, 1,
0.4334872, 2.085294, 0.8850113, 0, 0, 0, 1, 1,
0.4360846, 0.3610637, -0.07565036, 1, 1, 1, 1, 1,
0.4371442, -0.4565809, 2.29373, 1, 1, 1, 1, 1,
0.438774, -0.2389052, 0.8653911, 1, 1, 1, 1, 1,
0.4436262, -0.7192739, 2.869794, 1, 1, 1, 1, 1,
0.4472497, 0.6372001, 0.6564422, 1, 1, 1, 1, 1,
0.4489463, -1.503546, 2.329733, 1, 1, 1, 1, 1,
0.4548339, 0.4912873, 0.5531216, 1, 1, 1, 1, 1,
0.4615808, -1.11023, 2.188882, 1, 1, 1, 1, 1,
0.4670965, 0.9996132, 0.6989295, 1, 1, 1, 1, 1,
0.4709654, -0.9567935, 3.244063, 1, 1, 1, 1, 1,
0.4738335, -1.45883, 1.491143, 1, 1, 1, 1, 1,
0.4796134, -0.2052772, 2.241153, 1, 1, 1, 1, 1,
0.4821585, -0.1144034, 0.309512, 1, 1, 1, 1, 1,
0.4835981, 0.598416, 0.317165, 1, 1, 1, 1, 1,
0.4863568, 0.6350505, 1.028657, 1, 1, 1, 1, 1,
0.487323, -0.5290027, 2.085578, 0, 0, 1, 1, 1,
0.4903083, -0.3029813, 3.183647, 1, 0, 0, 1, 1,
0.49584, -0.5655018, 0.4847105, 1, 0, 0, 1, 1,
0.496102, -0.2617515, 2.187353, 1, 0, 0, 1, 1,
0.5000933, -1.547641, 3.00609, 1, 0, 0, 1, 1,
0.5042445, -0.519563, 1.535758, 1, 0, 0, 1, 1,
0.5065746, 0.8555109, -0.1466024, 0, 0, 0, 1, 1,
0.5126567, -1.03264, 2.780973, 0, 0, 0, 1, 1,
0.512895, -0.230698, 2.102451, 0, 0, 0, 1, 1,
0.5133699, 0.8045389, 0.03798312, 0, 0, 0, 1, 1,
0.5135212, 0.5996637, -2.17624, 0, 0, 0, 1, 1,
0.5179286, 1.145698, -1.918692, 0, 0, 0, 1, 1,
0.5179583, 0.2381224, 2.922381, 0, 0, 0, 1, 1,
0.5199264, -0.8791681, 1.768595, 1, 1, 1, 1, 1,
0.5203932, 0.1427727, 1.61632, 1, 1, 1, 1, 1,
0.5226919, -0.5444463, 3.211952, 1, 1, 1, 1, 1,
0.5287437, 1.369074, 0.1301044, 1, 1, 1, 1, 1,
0.5293515, -0.60084, 2.325166, 1, 1, 1, 1, 1,
0.5342375, -0.8691546, 1.31727, 1, 1, 1, 1, 1,
0.5350006, -0.8432819, 3.224087, 1, 1, 1, 1, 1,
0.539353, 0.2989454, 1.382931, 1, 1, 1, 1, 1,
0.5444652, 1.671099, -0.1119838, 1, 1, 1, 1, 1,
0.545783, 0.2140011, -0.09302757, 1, 1, 1, 1, 1,
0.5459833, 0.2236231, 0.2988712, 1, 1, 1, 1, 1,
0.5475758, 1.055526, -0.2925589, 1, 1, 1, 1, 1,
0.5475774, 0.4687263, -0.1022566, 1, 1, 1, 1, 1,
0.5484385, 0.3156771, -0.5587187, 1, 1, 1, 1, 1,
0.5554464, 1.604491, 0.2782054, 1, 1, 1, 1, 1,
0.5578628, -0.8121405, 1.967664, 0, 0, 1, 1, 1,
0.5598893, -0.3364855, 1.251365, 1, 0, 0, 1, 1,
0.5618269, 0.01799681, 2.284199, 1, 0, 0, 1, 1,
0.5627673, -1.26397, 3.219004, 1, 0, 0, 1, 1,
0.5687301, -1.082718, 2.23377, 1, 0, 0, 1, 1,
0.571639, -0.7765954, 0.8996143, 1, 0, 0, 1, 1,
0.5717081, 0.2022802, 1.565521, 0, 0, 0, 1, 1,
0.5770748, 0.02353654, 3.121818, 0, 0, 0, 1, 1,
0.5785996, -0.9597391, 3.383499, 0, 0, 0, 1, 1,
0.578941, 0.2720623, 1.617867, 0, 0, 0, 1, 1,
0.5814007, -2.22881, 1.999373, 0, 0, 0, 1, 1,
0.5819978, 1.662385, 0.06896394, 0, 0, 0, 1, 1,
0.5837032, 1.804605, -0.4452617, 0, 0, 0, 1, 1,
0.5844679, 0.3393086, 1.809981, 1, 1, 1, 1, 1,
0.5897302, -0.4338917, 3.274211, 1, 1, 1, 1, 1,
0.6014977, 1.244745, 0.6481579, 1, 1, 1, 1, 1,
0.6040554, 0.2514451, 1.885358, 1, 1, 1, 1, 1,
0.6045889, -2.614958, 2.374846, 1, 1, 1, 1, 1,
0.6101112, 0.3542816, 1.972061, 1, 1, 1, 1, 1,
0.6121489, 0.6684701, 1.307296, 1, 1, 1, 1, 1,
0.6155589, 1.162106, 0.6969195, 1, 1, 1, 1, 1,
0.6167125, -0.2225199, 2.361568, 1, 1, 1, 1, 1,
0.6177642, -0.7684676, 3.229432, 1, 1, 1, 1, 1,
0.6188635, 0.6120728, 2.126247, 1, 1, 1, 1, 1,
0.6196491, -0.3544755, 1.486516, 1, 1, 1, 1, 1,
0.6223125, 1.199103, -0.8599247, 1, 1, 1, 1, 1,
0.6257021, -0.4015801, 1.467545, 1, 1, 1, 1, 1,
0.6268569, -0.3537911, 2.639696, 1, 1, 1, 1, 1,
0.6328261, -0.7772189, 2.095243, 0, 0, 1, 1, 1,
0.6344534, 0.4674924, 0.3551729, 1, 0, 0, 1, 1,
0.6355158, 0.6549016, 0.1108896, 1, 0, 0, 1, 1,
0.6426373, 0.05017037, 0.1908021, 1, 0, 0, 1, 1,
0.6431592, 0.9286505, 0.3232132, 1, 0, 0, 1, 1,
0.6449286, -1.180054, 3.43279, 1, 0, 0, 1, 1,
0.6459382, -0.006619712, 2.175147, 0, 0, 0, 1, 1,
0.6468527, 0.9687987, 1.012783, 0, 0, 0, 1, 1,
0.6486494, -0.9196611, 2.267318, 0, 0, 0, 1, 1,
0.6496233, 0.5108871, 1.790664, 0, 0, 0, 1, 1,
0.650303, 0.202627, 2.960662, 0, 0, 0, 1, 1,
0.658276, 0.5347673, 0.3354589, 0, 0, 0, 1, 1,
0.6590191, -1.250549, 1.754337, 0, 0, 0, 1, 1,
0.6667758, -0.7244335, 1.182315, 1, 1, 1, 1, 1,
0.6685097, -0.6775059, 3.150605, 1, 1, 1, 1, 1,
0.6709487, 2.216405, -0.03291719, 1, 1, 1, 1, 1,
0.6763222, 0.1868558, 0.9067258, 1, 1, 1, 1, 1,
0.6850606, 0.2003355, 0.4982699, 1, 1, 1, 1, 1,
0.685647, 0.1884179, 1.673375, 1, 1, 1, 1, 1,
0.6870383, -0.1082206, 1.823283, 1, 1, 1, 1, 1,
0.6908439, 1.434021, 1.255919, 1, 1, 1, 1, 1,
0.6955037, -1.728451, 3.835157, 1, 1, 1, 1, 1,
0.6962624, 0.1004773, 2.144009, 1, 1, 1, 1, 1,
0.6970822, -0.9255074, 1.405985, 1, 1, 1, 1, 1,
0.6989573, 0.7693689, 1.730105, 1, 1, 1, 1, 1,
0.7025006, 0.5603127, 2.410179, 1, 1, 1, 1, 1,
0.7056426, 0.9023355, 1.43345, 1, 1, 1, 1, 1,
0.7069293, 1.5513, -0.4043162, 1, 1, 1, 1, 1,
0.7101105, -1.10924, 2.862154, 0, 0, 1, 1, 1,
0.7136695, -1.130247, 1.74082, 1, 0, 0, 1, 1,
0.7142305, 1.820309, -0.5818369, 1, 0, 0, 1, 1,
0.7145176, -0.1034618, 1.423163, 1, 0, 0, 1, 1,
0.717608, -0.2570463, 3.62409, 1, 0, 0, 1, 1,
0.723798, 1.061894, 1.396713, 1, 0, 0, 1, 1,
0.7238529, -1.620634, 2.146199, 0, 0, 0, 1, 1,
0.7276044, 0.1969355, 1.150689, 0, 0, 0, 1, 1,
0.7387955, 0.6408591, -0.6857568, 0, 0, 0, 1, 1,
0.7523589, 0.2648492, 3.057256, 0, 0, 0, 1, 1,
0.7546557, -0.234989, 1.909791, 0, 0, 0, 1, 1,
0.7553108, -0.7846531, 0.6120762, 0, 0, 0, 1, 1,
0.7556928, -0.2574503, 2.71522, 0, 0, 0, 1, 1,
0.7614486, -0.6598088, 2.461769, 1, 1, 1, 1, 1,
0.7628003, -0.8589162, 2.729661, 1, 1, 1, 1, 1,
0.7642809, -0.3531376, 1.044515, 1, 1, 1, 1, 1,
0.7681587, 0.7715881, 1.689041, 1, 1, 1, 1, 1,
0.7714003, 1.011056, 0.1520687, 1, 1, 1, 1, 1,
0.7726892, 1.12413, -1.06931, 1, 1, 1, 1, 1,
0.773388, -0.04632578, 2.637718, 1, 1, 1, 1, 1,
0.7735692, 1.334852, -0.319984, 1, 1, 1, 1, 1,
0.7764044, 0.8289722, 2.193373, 1, 1, 1, 1, 1,
0.7774884, 1.408279, 0.1427797, 1, 1, 1, 1, 1,
0.7793559, 0.4219069, 0.8822654, 1, 1, 1, 1, 1,
0.7803091, 0.156208, 0.684599, 1, 1, 1, 1, 1,
0.7975701, -0.4574699, 2.735481, 1, 1, 1, 1, 1,
0.7998208, -0.913424, 3.01652, 1, 1, 1, 1, 1,
0.8009319, -0.2951872, 1.990407, 1, 1, 1, 1, 1,
0.8107495, -0.8010916, 2.814951, 0, 0, 1, 1, 1,
0.8151, -0.954339, 1.417926, 1, 0, 0, 1, 1,
0.8164828, 0.5479589, 1.765279, 1, 0, 0, 1, 1,
0.8165488, 0.669627, 0.6328436, 1, 0, 0, 1, 1,
0.8265787, -1.012375, 1.597352, 1, 0, 0, 1, 1,
0.827012, -1.006952, 3.03844, 1, 0, 0, 1, 1,
0.8276761, 1.010195, 1.337461, 0, 0, 0, 1, 1,
0.8306146, 0.5041655, 0.9621214, 0, 0, 0, 1, 1,
0.8308225, 0.1504191, 2.910392, 0, 0, 0, 1, 1,
0.8384101, 0.2147676, -0.3100947, 0, 0, 0, 1, 1,
0.8439768, -0.5311854, 3.629803, 0, 0, 0, 1, 1,
0.848493, 0.006292298, 3.157167, 0, 0, 0, 1, 1,
0.8537511, 0.6735315, 0.5515395, 0, 0, 0, 1, 1,
0.8566665, -2.007535, 1.900575, 1, 1, 1, 1, 1,
0.859073, 0.0566683, 0.3396736, 1, 1, 1, 1, 1,
0.8662573, 0.3614024, 3.277433, 1, 1, 1, 1, 1,
0.8706973, -0.01196137, -0.0847472, 1, 1, 1, 1, 1,
0.872619, 0.4339083, -1.16982, 1, 1, 1, 1, 1,
0.874064, 0.9229266, 0.3552934, 1, 1, 1, 1, 1,
0.8830817, 0.7776033, 2.140689, 1, 1, 1, 1, 1,
0.883505, -0.4645266, 1.110768, 1, 1, 1, 1, 1,
0.8930501, 0.171159, 1.043744, 1, 1, 1, 1, 1,
0.8965256, 2.197574, -0.06237704, 1, 1, 1, 1, 1,
0.9027105, 0.199425, 2.787839, 1, 1, 1, 1, 1,
0.9029228, 0.1631356, 1.352687, 1, 1, 1, 1, 1,
0.9051488, 0.3257978, 0.4658497, 1, 1, 1, 1, 1,
0.9127415, 0.6201259, 0.5091735, 1, 1, 1, 1, 1,
0.9157909, -0.1980149, 1.304583, 1, 1, 1, 1, 1,
0.9214168, 1.164291, -0.9556885, 0, 0, 1, 1, 1,
0.9232961, 0.3188201, 0.9349985, 1, 0, 0, 1, 1,
0.9244434, -0.02998969, 1.988128, 1, 0, 0, 1, 1,
0.9244651, -0.6246666, 0.6207994, 1, 0, 0, 1, 1,
0.9301179, -0.5556377, 2.374832, 1, 0, 0, 1, 1,
0.9302534, 0.06616418, 0.6664168, 1, 0, 0, 1, 1,
0.9303457, 0.7869585, 0.5850329, 0, 0, 0, 1, 1,
0.9418582, -0.956023, 2.413526, 0, 0, 0, 1, 1,
0.9419182, -0.5533442, 1.310168, 0, 0, 0, 1, 1,
0.945644, 0.4168847, 1.716935, 0, 0, 0, 1, 1,
0.9520425, -0.9240071, 3.056521, 0, 0, 0, 1, 1,
0.9606467, -0.4141281, 1.819558, 0, 0, 0, 1, 1,
0.9648731, 0.3830991, 0.84094, 0, 0, 0, 1, 1,
0.9665937, -0.2402412, 2.44846, 1, 1, 1, 1, 1,
0.9782798, 1.055054, -0.00804074, 1, 1, 1, 1, 1,
0.981325, 0.9490469, -0.7311066, 1, 1, 1, 1, 1,
0.9835092, 0.3411085, 1.544289, 1, 1, 1, 1, 1,
0.9844045, 1.060308, 0.828739, 1, 1, 1, 1, 1,
0.9875218, -0.7258785, 3.97776, 1, 1, 1, 1, 1,
0.9922032, -0.01256061, 1.733118, 1, 1, 1, 1, 1,
0.9975168, -0.1839826, 0.6737208, 1, 1, 1, 1, 1,
1.000904, -1.06746, 1.112122, 1, 1, 1, 1, 1,
1.008316, -0.8664203, 2.891168, 1, 1, 1, 1, 1,
1.011399, -0.4442693, 0.6809372, 1, 1, 1, 1, 1,
1.011908, -0.07908892, 1.944894, 1, 1, 1, 1, 1,
1.013789, -0.943473, 2.899199, 1, 1, 1, 1, 1,
1.015518, 0.54672, 2.193966, 1, 1, 1, 1, 1,
1.015966, 0.3112111, 1.430173, 1, 1, 1, 1, 1,
1.016237, -0.6047313, 1.187219, 0, 0, 1, 1, 1,
1.023413, -1.406009, 2.410568, 1, 0, 0, 1, 1,
1.026243, -1.987397, 1.093374, 1, 0, 0, 1, 1,
1.027535, 0.02219843, 0.5802327, 1, 0, 0, 1, 1,
1.027643, 0.5892046, 1.484837, 1, 0, 0, 1, 1,
1.029902, 0.3113393, 0.7724984, 1, 0, 0, 1, 1,
1.03719, 0.4247423, 1.495769, 0, 0, 0, 1, 1,
1.03933, -0.9244331, 1.532304, 0, 0, 0, 1, 1,
1.04342, 2.197758, 0.2451259, 0, 0, 0, 1, 1,
1.044068, 1.988795, 0.2908881, 0, 0, 0, 1, 1,
1.046355, -0.5972131, 2.517732, 0, 0, 0, 1, 1,
1.046534, -1.349182, 0.4008946, 0, 0, 0, 1, 1,
1.059586, 0.1906467, 0.180722, 0, 0, 0, 1, 1,
1.063068, 0.4260422, 2.943311, 1, 1, 1, 1, 1,
1.065596, -0.9445864, 2.389914, 1, 1, 1, 1, 1,
1.074929, 0.526537, -0.1690357, 1, 1, 1, 1, 1,
1.083706, -2.069708, 3.92607, 1, 1, 1, 1, 1,
1.094202, 1.073167, -0.2302896, 1, 1, 1, 1, 1,
1.095164, -0.0315139, 0.7755985, 1, 1, 1, 1, 1,
1.099741, -0.08459955, 3.343792, 1, 1, 1, 1, 1,
1.106844, -1.360774, 2.678643, 1, 1, 1, 1, 1,
1.108343, -1.599134, 2.440317, 1, 1, 1, 1, 1,
1.112771, -1.600188, 1.885171, 1, 1, 1, 1, 1,
1.117996, 0.05329388, 1.052348, 1, 1, 1, 1, 1,
1.121519, -0.5065031, 3.894603, 1, 1, 1, 1, 1,
1.122868, -2.347725, 2.612225, 1, 1, 1, 1, 1,
1.127157, 0.5404942, 0.5385904, 1, 1, 1, 1, 1,
1.129689, 0.05375478, 1.352248, 1, 1, 1, 1, 1,
1.142054, 1.060686, 2.524199, 0, 0, 1, 1, 1,
1.143365, -2.077865, 3.740334, 1, 0, 0, 1, 1,
1.148762, -0.4645042, 2.931148, 1, 0, 0, 1, 1,
1.15409, -1.52126, 2.329224, 1, 0, 0, 1, 1,
1.159401, 1.257944, 0.9337502, 1, 0, 0, 1, 1,
1.163887, 0.8564578, 1.530874, 1, 0, 0, 1, 1,
1.166351, -0.5192289, 3.164774, 0, 0, 0, 1, 1,
1.166474, -0.3442861, 1.119119, 0, 0, 0, 1, 1,
1.167021, 0.2612352, -0.5369329, 0, 0, 0, 1, 1,
1.167417, 1.406392, 0.4444716, 0, 0, 0, 1, 1,
1.167591, -1.189358, 3.34622, 0, 0, 0, 1, 1,
1.167667, -0.6687921, 2.944534, 0, 0, 0, 1, 1,
1.174208, 0.1070769, 2.271787, 0, 0, 0, 1, 1,
1.174959, -0.8970289, 0.5795568, 1, 1, 1, 1, 1,
1.181882, 0.2860546, 1.939391, 1, 1, 1, 1, 1,
1.182345, -1.006387, 2.620195, 1, 1, 1, 1, 1,
1.183732, 0.4432763, 0.2996795, 1, 1, 1, 1, 1,
1.186849, 0.548923, 0.3109104, 1, 1, 1, 1, 1,
1.190903, 0.0242627, 0.5510107, 1, 1, 1, 1, 1,
1.193386, -0.531749, 3.73104, 1, 1, 1, 1, 1,
1.202201, 0.8848726, -0.5327515, 1, 1, 1, 1, 1,
1.209796, -0.1979892, 1.510603, 1, 1, 1, 1, 1,
1.214987, 0.3260829, 1.458005, 1, 1, 1, 1, 1,
1.218005, -0.0542546, 1.0351, 1, 1, 1, 1, 1,
1.220632, -0.03733263, 1.273528, 1, 1, 1, 1, 1,
1.256894, -0.004013656, 1.514281, 1, 1, 1, 1, 1,
1.261775, -0.7955273, 2.046945, 1, 1, 1, 1, 1,
1.264739, -0.947524, 2.34487, 1, 1, 1, 1, 1,
1.267847, 1.193, -1.174473, 0, 0, 1, 1, 1,
1.287585, 0.2396571, 1.636938, 1, 0, 0, 1, 1,
1.288314, -0.3421863, 2.834631, 1, 0, 0, 1, 1,
1.289334, 0.873849, 0.6499742, 1, 0, 0, 1, 1,
1.289371, 0.9628146, 0.05529772, 1, 0, 0, 1, 1,
1.294379, 0.9300497, 2.230414, 1, 0, 0, 1, 1,
1.294425, 0.9003021, 0.5415915, 0, 0, 0, 1, 1,
1.301386, -0.3076591, 1.411843, 0, 0, 0, 1, 1,
1.306642, 0.8925856, 1.499191, 0, 0, 0, 1, 1,
1.307654, 0.172464, 0.3534653, 0, 0, 0, 1, 1,
1.3175, 0.1803104, 1.311065, 0, 0, 0, 1, 1,
1.322777, -2.021579, 2.853322, 0, 0, 0, 1, 1,
1.329198, -0.4775475, 2.381079, 0, 0, 0, 1, 1,
1.345433, 1.755865, 1.396847, 1, 1, 1, 1, 1,
1.352169, 1.684041, -0.7923669, 1, 1, 1, 1, 1,
1.373459, -1.058287, 0.515396, 1, 1, 1, 1, 1,
1.378898, -0.3130202, 0.3235117, 1, 1, 1, 1, 1,
1.38188, 0.7059467, 1.888371, 1, 1, 1, 1, 1,
1.38543, -0.3950677, 1.591457, 1, 1, 1, 1, 1,
1.38896, 0.04529842, 2.570836, 1, 1, 1, 1, 1,
1.414739, 0.04096154, 1.435963, 1, 1, 1, 1, 1,
1.416747, -1.181831, 2.921132, 1, 1, 1, 1, 1,
1.417284, 0.8174254, -1.402459, 1, 1, 1, 1, 1,
1.419215, 0.7543057, 2.602795, 1, 1, 1, 1, 1,
1.422721, 0.6263246, 2.377909, 1, 1, 1, 1, 1,
1.424026, 0.09946573, 1.05681, 1, 1, 1, 1, 1,
1.425132, 0.9471105, 0.7769676, 1, 1, 1, 1, 1,
1.438496, 0.7874867, 1.729538, 1, 1, 1, 1, 1,
1.442113, 0.1672135, 1.520461, 0, 0, 1, 1, 1,
1.444466, 0.008045514, 1.092433, 1, 0, 0, 1, 1,
1.481435, -0.4071556, 2.813756, 1, 0, 0, 1, 1,
1.483124, 0.5473891, 0.734396, 1, 0, 0, 1, 1,
1.489438, 0.1449045, 0.2071065, 1, 0, 0, 1, 1,
1.495191, 0.5252087, 1.853369, 1, 0, 0, 1, 1,
1.496565, 1.7666, 0.1496808, 0, 0, 0, 1, 1,
1.498258, 1.107156, -0.3173924, 0, 0, 0, 1, 1,
1.515922, 0.8259677, 1.448883, 0, 0, 0, 1, 1,
1.521202, 0.2826613, 3.924045, 0, 0, 0, 1, 1,
1.522493, 1.053633, 1.304816, 0, 0, 0, 1, 1,
1.526319, 0.9951256, 1.192263, 0, 0, 0, 1, 1,
1.529106, 0.2115753, 1.082631, 0, 0, 0, 1, 1,
1.541187, -0.1088659, 2.249603, 1, 1, 1, 1, 1,
1.542089, -0.1671741, 1.669294, 1, 1, 1, 1, 1,
1.553534, -1.373603, 2.245932, 1, 1, 1, 1, 1,
1.565663, 0.7161936, 1.589714, 1, 1, 1, 1, 1,
1.566509, -1.418946, 2.686625, 1, 1, 1, 1, 1,
1.60368, -0.3043712, 1.736769, 1, 1, 1, 1, 1,
1.612505, 0.7019005, 3.312729, 1, 1, 1, 1, 1,
1.61731, 1.165249, 0.3639404, 1, 1, 1, 1, 1,
1.646998, -0.2705725, 2.629343, 1, 1, 1, 1, 1,
1.647461, 0.2355735, 1.384697, 1, 1, 1, 1, 1,
1.655526, 0.4366883, 1.199808, 1, 1, 1, 1, 1,
1.684255, 0.9424939, 0.1173097, 1, 1, 1, 1, 1,
1.699577, -1.873907, 2.598399, 1, 1, 1, 1, 1,
1.709106, -2.355666, 3.369448, 1, 1, 1, 1, 1,
1.716005, 0.4170179, 0.4806668, 1, 1, 1, 1, 1,
1.724068, 1.211779, 0.772956, 0, 0, 1, 1, 1,
1.729, -1.465964, 2.31353, 1, 0, 0, 1, 1,
1.732422, 0.8790488, 1.529734, 1, 0, 0, 1, 1,
1.737166, -0.6368653, 2.308423, 1, 0, 0, 1, 1,
1.74358, -1.283846, 3.611896, 1, 0, 0, 1, 1,
1.753078, -0.6199345, 2.621271, 1, 0, 0, 1, 1,
1.760049, -1.215311, 2.478615, 0, 0, 0, 1, 1,
1.76227, 1.735039, 2.295952, 0, 0, 0, 1, 1,
1.766842, 1.08779, -0.9334092, 0, 0, 0, 1, 1,
1.77168, -1.071224, 2.042076, 0, 0, 0, 1, 1,
1.77669, -0.03647942, 2.36334, 0, 0, 0, 1, 1,
1.789012, -0.7170051, 3.903549, 0, 0, 0, 1, 1,
1.801617, -1.89322, 3.188382, 0, 0, 0, 1, 1,
1.809073, -0.3692767, 2.05818, 1, 1, 1, 1, 1,
1.827322, 0.4907031, 0.8495392, 1, 1, 1, 1, 1,
1.852704, -0.2480716, 1.288136, 1, 1, 1, 1, 1,
1.907177, 1.400905, 0.07191994, 1, 1, 1, 1, 1,
1.918998, 0.8739339, 1.526318, 1, 1, 1, 1, 1,
1.925079, 1.297565, 3.278628, 1, 1, 1, 1, 1,
1.932876, 1.62992, 1.265126, 1, 1, 1, 1, 1,
1.936166, 0.2044111, 2.551553, 1, 1, 1, 1, 1,
1.972524, -0.3522752, 1.136286, 1, 1, 1, 1, 1,
1.976215, -0.7779473, 0.133373, 1, 1, 1, 1, 1,
1.983035, -0.5909878, 2.197895, 1, 1, 1, 1, 1,
2.011507, -0.3917297, 1.536155, 1, 1, 1, 1, 1,
2.018565, -0.3522289, 2.466631, 1, 1, 1, 1, 1,
2.029179, -0.08449762, 0.5861896, 1, 1, 1, 1, 1,
2.073777, 1.439735, 1.81966, 1, 1, 1, 1, 1,
2.097263, 2.318214, 1.354649, 0, 0, 1, 1, 1,
2.122346, -0.1064415, 2.002374, 1, 0, 0, 1, 1,
2.188267, -1.37452, 0.879648, 1, 0, 0, 1, 1,
2.196339, 0.4488146, 1.997347, 1, 0, 0, 1, 1,
2.292756, -1.20177, 3.402173, 1, 0, 0, 1, 1,
2.307034, 0.9153801, 1.331656, 1, 0, 0, 1, 1,
2.342921, 1.119595, 2.875588, 0, 0, 0, 1, 1,
2.350526, -1.002344, 3.168019, 0, 0, 0, 1, 1,
2.370521, -1.819171, 2.593884, 0, 0, 0, 1, 1,
2.371768, 1.011891, 1.491523, 0, 0, 0, 1, 1,
2.393581, 0.3907857, -0.03757535, 0, 0, 0, 1, 1,
2.417502, -1.538862, 1.947421, 0, 0, 0, 1, 1,
2.432506, 0.7744169, 1.048204, 0, 0, 0, 1, 1,
2.441512, 1.939019, 1.132003, 1, 1, 1, 1, 1,
2.464924, 1.047369, 1.247881, 1, 1, 1, 1, 1,
2.511077, 0.244972, 0.09090827, 1, 1, 1, 1, 1,
2.575274, -0.1400786, 1.240932, 1, 1, 1, 1, 1,
2.769336, -0.3153027, 2.028367, 1, 1, 1, 1, 1,
3.051561, 0.2095301, 1.954728, 1, 1, 1, 1, 1,
3.877147, 1.893252, 0.9606489, 1, 1, 1, 1, 1
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
var radius = 9.686021;
var distance = 34.02174;
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
mvMatrix.translate( -0.4212289, 0.3170359, 0.4536531 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.02174);
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