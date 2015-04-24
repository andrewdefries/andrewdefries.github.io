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
-3.046089, -0.2457688, -2.085857, 1, 0, 0, 1,
-2.945773, 1.696562, -0.3089342, 1, 0.007843138, 0, 1,
-2.918198, 0.7780807, -0.7735705, 1, 0.01176471, 0, 1,
-2.824217, 0.9710577, -0.7114823, 1, 0.01960784, 0, 1,
-2.442729, 1.526001, -1.112513, 1, 0.02352941, 0, 1,
-2.408986, -1.53572, -2.392014, 1, 0.03137255, 0, 1,
-2.359946, -0.9736831, -1.735469, 1, 0.03529412, 0, 1,
-2.264459, 0.3476222, -1.438673, 1, 0.04313726, 0, 1,
-2.26329, -0.7003987, -3.271971, 1, 0.04705882, 0, 1,
-2.225036, -0.3079144, -3.083762, 1, 0.05490196, 0, 1,
-2.219106, 0.3805317, -1.600182, 1, 0.05882353, 0, 1,
-2.215394, -1.706856, -3.143726, 1, 0.06666667, 0, 1,
-2.192449, -1.013947, -0.7826381, 1, 0.07058824, 0, 1,
-2.147694, 0.001573306, -2.375724, 1, 0.07843138, 0, 1,
-2.072882, -1.646424, -3.045232, 1, 0.08235294, 0, 1,
-2.063414, -0.5834122, -1.546813, 1, 0.09019608, 0, 1,
-2.028028, 1.787429, -0.7095219, 1, 0.09411765, 0, 1,
-2.024761, -0.3031246, -2.156744, 1, 0.1019608, 0, 1,
-2.011483, -0.7441044, -1.300673, 1, 0.1098039, 0, 1,
-2.009835, -0.988072, -2.055825, 1, 0.1137255, 0, 1,
-2.009595, -1.363897, -0.6459589, 1, 0.1215686, 0, 1,
-2.005594, 0.1063702, -3.303984, 1, 0.1254902, 0, 1,
-1.96697, 0.2997878, -3.179077, 1, 0.1333333, 0, 1,
-1.956311, -1.761445, -0.9365248, 1, 0.1372549, 0, 1,
-1.948318, 0.5660969, -1.807186, 1, 0.145098, 0, 1,
-1.94527, 0.7907843, -1.673483, 1, 0.1490196, 0, 1,
-1.937562, 0.03457624, -2.416397, 1, 0.1568628, 0, 1,
-1.914344, -0.2950937, -1.798248, 1, 0.1607843, 0, 1,
-1.903592, -0.1386839, -2.135023, 1, 0.1686275, 0, 1,
-1.89224, -0.2360194, 0.4368477, 1, 0.172549, 0, 1,
-1.858731, -1.3111, -2.082904, 1, 0.1803922, 0, 1,
-1.854876, 0.5659848, -2.170214, 1, 0.1843137, 0, 1,
-1.835214, -0.02401315, -1.859824, 1, 0.1921569, 0, 1,
-1.833548, 0.3596728, -1.902876, 1, 0.1960784, 0, 1,
-1.825791, 1.226972, -2.436293, 1, 0.2039216, 0, 1,
-1.82359, 0.7338251, -0.4831701, 1, 0.2117647, 0, 1,
-1.810962, 1.425853, 0.09914681, 1, 0.2156863, 0, 1,
-1.797455, -0.1736809, -2.687935, 1, 0.2235294, 0, 1,
-1.783126, -0.4697041, -0.9170216, 1, 0.227451, 0, 1,
-1.760786, 0.03585724, -1.344269, 1, 0.2352941, 0, 1,
-1.755371, -0.04070527, -0.5685346, 1, 0.2392157, 0, 1,
-1.723856, -1.774508, -1.639173, 1, 0.2470588, 0, 1,
-1.716127, 1.129779, -2.365285, 1, 0.2509804, 0, 1,
-1.685784, -0.5252939, -2.70688, 1, 0.2588235, 0, 1,
-1.68433, 0.2927215, -1.548336, 1, 0.2627451, 0, 1,
-1.672, -1.121114, -1.754172, 1, 0.2705882, 0, 1,
-1.645763, -0.9411669, -1.75935, 1, 0.2745098, 0, 1,
-1.644263, -1.916589, -2.933329, 1, 0.282353, 0, 1,
-1.637854, -0.6832497, -3.65135, 1, 0.2862745, 0, 1,
-1.624982, -1.661037, -2.59761, 1, 0.2941177, 0, 1,
-1.624802, 0.5730532, -0.880425, 1, 0.3019608, 0, 1,
-1.596887, 0.3650388, -2.052936, 1, 0.3058824, 0, 1,
-1.588943, -2.129837, -4.572154, 1, 0.3137255, 0, 1,
-1.588394, -0.1831116, -1.023685, 1, 0.3176471, 0, 1,
-1.583807, -0.7960368, -0.9556365, 1, 0.3254902, 0, 1,
-1.554203, -0.5792397, -2.275052, 1, 0.3294118, 0, 1,
-1.551869, -0.3924466, -0.8929875, 1, 0.3372549, 0, 1,
-1.549774, 2.130005, -0.4413024, 1, 0.3411765, 0, 1,
-1.544179, -0.525569, -0.01916639, 1, 0.3490196, 0, 1,
-1.541531, -0.1039016, -2.748842, 1, 0.3529412, 0, 1,
-1.535698, 0.2409976, -1.71259, 1, 0.3607843, 0, 1,
-1.523166, 0.6250656, -0.3809672, 1, 0.3647059, 0, 1,
-1.518413, -1.066178, -3.065463, 1, 0.372549, 0, 1,
-1.505893, 0.7542066, -0.09045716, 1, 0.3764706, 0, 1,
-1.503283, -1.939842, -2.163335, 1, 0.3843137, 0, 1,
-1.481805, 0.8486156, -1.48024, 1, 0.3882353, 0, 1,
-1.474809, 0.5629997, -0.6309075, 1, 0.3960784, 0, 1,
-1.470587, -1.55334, -2.601759, 1, 0.4039216, 0, 1,
-1.466505, -0.2302833, -3.333682, 1, 0.4078431, 0, 1,
-1.458121, -0.05403834, -1.554539, 1, 0.4156863, 0, 1,
-1.456261, 0.07077298, -2.093737, 1, 0.4196078, 0, 1,
-1.453686, 0.4970011, -2.360034, 1, 0.427451, 0, 1,
-1.452647, -0.1030514, -0.634994, 1, 0.4313726, 0, 1,
-1.446977, -0.7854975, -0.0207875, 1, 0.4392157, 0, 1,
-1.444833, -1.433239, -1.949891, 1, 0.4431373, 0, 1,
-1.43722, -0.1461754, -2.01757, 1, 0.4509804, 0, 1,
-1.43645, 2.353903, -0.3360189, 1, 0.454902, 0, 1,
-1.42537, -0.4301619, -1.151917, 1, 0.4627451, 0, 1,
-1.412018, 1.018288, 0.09609498, 1, 0.4666667, 0, 1,
-1.395655, -0.9545742, -3.396192, 1, 0.4745098, 0, 1,
-1.393324, 0.4067399, -1.94596, 1, 0.4784314, 0, 1,
-1.387254, -0.4245066, -2.523353, 1, 0.4862745, 0, 1,
-1.350719, -0.3703821, 0.3044688, 1, 0.4901961, 0, 1,
-1.349396, 0.9340804, -0.5215503, 1, 0.4980392, 0, 1,
-1.349043, -0.1971967, 0.7016948, 1, 0.5058824, 0, 1,
-1.346208, 0.5448155, -2.788171, 1, 0.509804, 0, 1,
-1.339675, -0.2413085, -1.04645, 1, 0.5176471, 0, 1,
-1.334256, 0.3922722, -1.281501, 1, 0.5215687, 0, 1,
-1.32597, -1.907296, -5.546244, 1, 0.5294118, 0, 1,
-1.322415, 0.04054321, -1.060342, 1, 0.5333334, 0, 1,
-1.31679, -3.020854, -3.151485, 1, 0.5411765, 0, 1,
-1.311708, 1.9865, -2.091763, 1, 0.5450981, 0, 1,
-1.304811, -0.506844, -0.4814894, 1, 0.5529412, 0, 1,
-1.304036, 0.5716561, -1.06824, 1, 0.5568628, 0, 1,
-1.300169, 0.6380854, 0.3198256, 1, 0.5647059, 0, 1,
-1.290643, -0.7595152, -2.450506, 1, 0.5686275, 0, 1,
-1.289307, 0.7353444, -0.1005626, 1, 0.5764706, 0, 1,
-1.289268, -1.750263, -2.197738, 1, 0.5803922, 0, 1,
-1.287329, 0.6603258, -0.83484, 1, 0.5882353, 0, 1,
-1.283507, -0.09764769, -1.227967, 1, 0.5921569, 0, 1,
-1.282631, -1.224797, -2.331235, 1, 0.6, 0, 1,
-1.264845, 1.181233, -2.258486, 1, 0.6078432, 0, 1,
-1.256209, 0.6254328, -1.373342, 1, 0.6117647, 0, 1,
-1.251844, 1.265244, -1.955195, 1, 0.6196079, 0, 1,
-1.242742, -0.7578341, -2.635334, 1, 0.6235294, 0, 1,
-1.232987, 0.7471645, 0.2830626, 1, 0.6313726, 0, 1,
-1.226095, -0.7832142, -2.337619, 1, 0.6352941, 0, 1,
-1.223193, 0.01184295, -1.189867, 1, 0.6431373, 0, 1,
-1.219052, -1.240893, -2.778792, 1, 0.6470588, 0, 1,
-1.210208, 0.2181542, -1.078501, 1, 0.654902, 0, 1,
-1.203327, 1.505192, -0.6417385, 1, 0.6588235, 0, 1,
-1.201808, 1.356604, 0.9044898, 1, 0.6666667, 0, 1,
-1.198879, 0.4450393, -1.525881, 1, 0.6705883, 0, 1,
-1.195771, 1.710065, -1.091853, 1, 0.6784314, 0, 1,
-1.195699, 0.3722222, -2.677257, 1, 0.682353, 0, 1,
-1.191428, 0.7358594, -3.995791, 1, 0.6901961, 0, 1,
-1.187973, -0.1046302, -2.283128, 1, 0.6941177, 0, 1,
-1.184142, 1.694729, 0.06957878, 1, 0.7019608, 0, 1,
-1.183443, -0.4818113, -0.06144568, 1, 0.7098039, 0, 1,
-1.160676, -0.3547884, -0.6789451, 1, 0.7137255, 0, 1,
-1.157968, 0.2232099, -1.298606, 1, 0.7215686, 0, 1,
-1.157963, 0.006329151, -2.892001, 1, 0.7254902, 0, 1,
-1.157879, 0.01718926, -2.730787, 1, 0.7333333, 0, 1,
-1.151506, 0.3957783, -1.30829, 1, 0.7372549, 0, 1,
-1.1512, -0.08690815, -0.3801697, 1, 0.7450981, 0, 1,
-1.142116, -0.7759922, -2.429872, 1, 0.7490196, 0, 1,
-1.134871, 0.5598391, -0.3936355, 1, 0.7568628, 0, 1,
-1.13239, 0.1933155, -0.2104222, 1, 0.7607843, 0, 1,
-1.128489, -1.861074, -1.896832, 1, 0.7686275, 0, 1,
-1.125063, 0.02818586, -0.8391489, 1, 0.772549, 0, 1,
-1.121872, 1.180497, -2.239293, 1, 0.7803922, 0, 1,
-1.118758, 0.6980242, 0.05390073, 1, 0.7843137, 0, 1,
-1.106043, -0.4299279, -2.378671, 1, 0.7921569, 0, 1,
-1.097721, 0.69783, -1.516747, 1, 0.7960784, 0, 1,
-1.084286, -1.694115, -3.586641, 1, 0.8039216, 0, 1,
-1.081778, 0.2260713, -2.362288, 1, 0.8117647, 0, 1,
-1.080015, -1.004946, -3.638205, 1, 0.8156863, 0, 1,
-1.076877, 0.2435925, -0.5504931, 1, 0.8235294, 0, 1,
-1.072971, 0.3468259, -2.017954, 1, 0.827451, 0, 1,
-1.070315, 1.443329, -1.264488, 1, 0.8352941, 0, 1,
-1.066177, 0.7989403, -1.586424, 1, 0.8392157, 0, 1,
-1.06373, -0.0425988, -4.089336, 1, 0.8470588, 0, 1,
-1.060042, 0.2327826, -1.665837, 1, 0.8509804, 0, 1,
-1.059753, 0.4589794, -2.250702, 1, 0.8588235, 0, 1,
-1.050494, 0.3456847, 0.1588066, 1, 0.8627451, 0, 1,
-1.044624, 0.5986083, -0.9207042, 1, 0.8705882, 0, 1,
-1.041389, 0.08807253, -2.9123, 1, 0.8745098, 0, 1,
-1.03713, -2.29646, -0.440184, 1, 0.8823529, 0, 1,
-1.0363, 0.8737889, -0.4887734, 1, 0.8862745, 0, 1,
-1.02212, -0.5969019, -0.7174436, 1, 0.8941177, 0, 1,
-1.001739, 0.3430977, -0.5173201, 1, 0.8980392, 0, 1,
-0.9904194, -1.646848, -3.246485, 1, 0.9058824, 0, 1,
-0.9843043, -0.584489, -4.451748, 1, 0.9137255, 0, 1,
-0.9832827, 1.428896, -1.655887, 1, 0.9176471, 0, 1,
-0.9832786, 0.8955972, -0.362367, 1, 0.9254902, 0, 1,
-0.9822611, 0.04074139, -1.669443, 1, 0.9294118, 0, 1,
-0.966692, 0.5396028, -0.952738, 1, 0.9372549, 0, 1,
-0.9666399, 0.2256421, -2.106283, 1, 0.9411765, 0, 1,
-0.9497831, 0.4707237, -0.722859, 1, 0.9490196, 0, 1,
-0.9492915, 0.1609878, -3.201015, 1, 0.9529412, 0, 1,
-0.9421222, 0.9417072, -0.8834326, 1, 0.9607843, 0, 1,
-0.9350969, 1.189096, 0.2051982, 1, 0.9647059, 0, 1,
-0.9347454, -0.5657694, -1.672379, 1, 0.972549, 0, 1,
-0.9265821, -0.9550147, -3.933557, 1, 0.9764706, 0, 1,
-0.9265307, 0.3047949, -1.146711, 1, 0.9843137, 0, 1,
-0.923435, -0.1244031, -2.021143, 1, 0.9882353, 0, 1,
-0.914698, 0.7943098, -0.5424046, 1, 0.9960784, 0, 1,
-0.9142972, 0.3274354, -1.994055, 0.9960784, 1, 0, 1,
-0.9083706, 0.005297906, -1.373102, 0.9921569, 1, 0, 1,
-0.9014774, 0.8852144, -1.569326, 0.9843137, 1, 0, 1,
-0.8905641, 0.2932266, -1.465392, 0.9803922, 1, 0, 1,
-0.8898456, -0.7225245, -3.316575, 0.972549, 1, 0, 1,
-0.8892949, -0.9034175, -1.805822, 0.9686275, 1, 0, 1,
-0.8887966, 0.6998662, -1.754226, 0.9607843, 1, 0, 1,
-0.8862182, -0.5288411, -0.6135663, 0.9568627, 1, 0, 1,
-0.8848968, 1.191221, -1.010511, 0.9490196, 1, 0, 1,
-0.8831413, -0.8054135, -1.910849, 0.945098, 1, 0, 1,
-0.8692637, -0.3117261, -1.19643, 0.9372549, 1, 0, 1,
-0.8680662, 0.6121486, -1.022386, 0.9333333, 1, 0, 1,
-0.8659809, 0.8655416, -2.770351, 0.9254902, 1, 0, 1,
-0.8634018, -0.835926, -0.740997, 0.9215686, 1, 0, 1,
-0.8569427, 1.260112, -0.2260986, 0.9137255, 1, 0, 1,
-0.8473883, -0.5994748, -1.984367, 0.9098039, 1, 0, 1,
-0.8374401, -0.09294539, -4.442354, 0.9019608, 1, 0, 1,
-0.8273022, 0.1471328, -0.6692436, 0.8941177, 1, 0, 1,
-0.8240152, -1.318289, -2.74007, 0.8901961, 1, 0, 1,
-0.8216457, -1.277321, -1.878472, 0.8823529, 1, 0, 1,
-0.8207473, 0.530488, -2.290019, 0.8784314, 1, 0, 1,
-0.8182801, -1.317925, -3.548341, 0.8705882, 1, 0, 1,
-0.8164303, -0.6152096, -1.985751, 0.8666667, 1, 0, 1,
-0.8152087, 0.9967627, 0.819757, 0.8588235, 1, 0, 1,
-0.813441, 0.2113349, -0.3016298, 0.854902, 1, 0, 1,
-0.8130749, 0.8263689, 0.2898812, 0.8470588, 1, 0, 1,
-0.8102982, -0.08958697, -0.6992625, 0.8431373, 1, 0, 1,
-0.8080463, 1.702727, 0.7215283, 0.8352941, 1, 0, 1,
-0.8037415, 0.9429336, -0.3169967, 0.8313726, 1, 0, 1,
-0.8029801, 0.8505487, -1.38279, 0.8235294, 1, 0, 1,
-0.802363, 0.4150608, -1.38651, 0.8196079, 1, 0, 1,
-0.7998846, -0.6802027, -0.5015065, 0.8117647, 1, 0, 1,
-0.7917982, -1.190074, -2.279102, 0.8078431, 1, 0, 1,
-0.7848392, 1.006882, -1.232683, 0.8, 1, 0, 1,
-0.7837593, -2.664759, -2.128099, 0.7921569, 1, 0, 1,
-0.7805802, 1.632091, 0.7604302, 0.7882353, 1, 0, 1,
-0.7800741, 1.08067, -0.868682, 0.7803922, 1, 0, 1,
-0.779594, 0.2399765, -0.8843533, 0.7764706, 1, 0, 1,
-0.7791628, -0.3027377, -0.9130599, 0.7686275, 1, 0, 1,
-0.7762207, 0.6368999, -1.76765, 0.7647059, 1, 0, 1,
-0.7676799, -1.225018, -3.72756, 0.7568628, 1, 0, 1,
-0.766856, -0.322966, -1.667695, 0.7529412, 1, 0, 1,
-0.7559531, -1.205684, -2.612496, 0.7450981, 1, 0, 1,
-0.7461451, -1.029673, -1.932327, 0.7411765, 1, 0, 1,
-0.7401469, 1.878552, -1.643691, 0.7333333, 1, 0, 1,
-0.7360577, -0.8666747, -2.477072, 0.7294118, 1, 0, 1,
-0.7352752, -0.9770067, -2.153667, 0.7215686, 1, 0, 1,
-0.734532, -0.3806147, -1.397586, 0.7176471, 1, 0, 1,
-0.7251676, -0.1796399, -1.198008, 0.7098039, 1, 0, 1,
-0.7182272, -0.1374397, -1.425738, 0.7058824, 1, 0, 1,
-0.7172241, 0.6046358, -1.978247, 0.6980392, 1, 0, 1,
-0.7166274, -1.04365, -2.355151, 0.6901961, 1, 0, 1,
-0.7143383, 0.1042788, -2.375964, 0.6862745, 1, 0, 1,
-0.7082039, 0.4739429, -1.237623, 0.6784314, 1, 0, 1,
-0.7067616, 1.341356, -0.7170996, 0.6745098, 1, 0, 1,
-0.7065771, 0.5504951, -0.9318823, 0.6666667, 1, 0, 1,
-0.7049782, -0.02129234, -2.130765, 0.6627451, 1, 0, 1,
-0.7038762, -0.7779118, -2.683471, 0.654902, 1, 0, 1,
-0.6987307, -0.9713658, -1.928692, 0.6509804, 1, 0, 1,
-0.6985741, -2.474859, -2.031017, 0.6431373, 1, 0, 1,
-0.6975134, -2.444494, -2.999286, 0.6392157, 1, 0, 1,
-0.6936086, 0.6864328, 0.8526744, 0.6313726, 1, 0, 1,
-0.6928939, -0.2559617, -0.7398867, 0.627451, 1, 0, 1,
-0.690116, 0.7144668, -0.2927299, 0.6196079, 1, 0, 1,
-0.6751068, -0.01227401, -1.78242, 0.6156863, 1, 0, 1,
-0.6742038, 0.61975, -0.7013391, 0.6078432, 1, 0, 1,
-0.6736621, -0.1650997, -2.54235, 0.6039216, 1, 0, 1,
-0.6714798, -1.072562, -2.689482, 0.5960785, 1, 0, 1,
-0.6708372, 2.878564, -0.7954547, 0.5882353, 1, 0, 1,
-0.6700746, 0.781768, -2.042033, 0.5843138, 1, 0, 1,
-0.6599059, 1.143059, -1.849126, 0.5764706, 1, 0, 1,
-0.6588224, -0.3763029, -0.5381265, 0.572549, 1, 0, 1,
-0.655566, -0.0512278, -0.8779342, 0.5647059, 1, 0, 1,
-0.653107, -0.4081413, -1.331695, 0.5607843, 1, 0, 1,
-0.6507676, -0.03592057, -0.6564482, 0.5529412, 1, 0, 1,
-0.6500118, -1.011514, -1.176122, 0.5490196, 1, 0, 1,
-0.6468794, 2.133922, -1.676793, 0.5411765, 1, 0, 1,
-0.6398411, -1.264518, -2.914762, 0.5372549, 1, 0, 1,
-0.6226851, 0.8278219, -1.794015, 0.5294118, 1, 0, 1,
-0.6107764, 0.1232172, -3.731575, 0.5254902, 1, 0, 1,
-0.6083955, -1.12885, -2.63214, 0.5176471, 1, 0, 1,
-0.6078466, 0.1509209, -1.404021, 0.5137255, 1, 0, 1,
-0.60633, -0.8437238, -1.510721, 0.5058824, 1, 0, 1,
-0.6036078, -0.1558543, -0.2367121, 0.5019608, 1, 0, 1,
-0.5995419, -1.524189, -2.358965, 0.4941176, 1, 0, 1,
-0.5994527, 0.1955226, 1.159377, 0.4862745, 1, 0, 1,
-0.5978327, -2.32974, -1.547522, 0.4823529, 1, 0, 1,
-0.5914345, -0.7266744, -2.479692, 0.4745098, 1, 0, 1,
-0.5873047, 0.9572843, -1.281668, 0.4705882, 1, 0, 1,
-0.5843351, 0.9003125, -1.689348, 0.4627451, 1, 0, 1,
-0.5838295, -1.558928, -3.062518, 0.4588235, 1, 0, 1,
-0.5834562, 0.988054, 1.432161, 0.4509804, 1, 0, 1,
-0.5819079, -1.040845, -1.695919, 0.4470588, 1, 0, 1,
-0.5762923, -0.4850545, -2.592653, 0.4392157, 1, 0, 1,
-0.5692147, 2.103898, 0.3230072, 0.4352941, 1, 0, 1,
-0.5640835, -1.285888, -3.33825, 0.427451, 1, 0, 1,
-0.5612996, 0.6331207, -0.02506383, 0.4235294, 1, 0, 1,
-0.5552687, 0.2814873, -3.022618, 0.4156863, 1, 0, 1,
-0.5536103, 0.6205384, -0.1352496, 0.4117647, 1, 0, 1,
-0.5527282, 0.05036281, -2.421309, 0.4039216, 1, 0, 1,
-0.5521762, -0.7748258, 0.5671583, 0.3960784, 1, 0, 1,
-0.5508519, 0.7280908, -0.00185087, 0.3921569, 1, 0, 1,
-0.5503503, 0.5862517, -1.494856, 0.3843137, 1, 0, 1,
-0.5494584, -0.4380673, -2.27573, 0.3803922, 1, 0, 1,
-0.5325232, -1.349373, -1.41562, 0.372549, 1, 0, 1,
-0.5274315, 1.496745, -1.844128, 0.3686275, 1, 0, 1,
-0.5256735, -1.440831, -2.499876, 0.3607843, 1, 0, 1,
-0.5191272, 2.374391, -0.549402, 0.3568628, 1, 0, 1,
-0.5153956, 0.03901485, 0.9529666, 0.3490196, 1, 0, 1,
-0.5125132, -0.1043696, -3.463055, 0.345098, 1, 0, 1,
-0.5084168, 0.003347828, -2.140761, 0.3372549, 1, 0, 1,
-0.5075959, 0.4178261, -1.229835, 0.3333333, 1, 0, 1,
-0.5054923, 1.74816, 0.9241056, 0.3254902, 1, 0, 1,
-0.5013411, 0.8511622, -1.466961, 0.3215686, 1, 0, 1,
-0.5008949, -0.04146908, -3.530792, 0.3137255, 1, 0, 1,
-0.4984467, -0.6330924, -1.73457, 0.3098039, 1, 0, 1,
-0.4956953, -0.6251746, -1.190913, 0.3019608, 1, 0, 1,
-0.4933915, 0.5822335, 0.9443602, 0.2941177, 1, 0, 1,
-0.4930356, -0.8959203, -2.567406, 0.2901961, 1, 0, 1,
-0.4897979, 1.481158, -1.665417, 0.282353, 1, 0, 1,
-0.4886914, -0.0901842, -3.126224, 0.2784314, 1, 0, 1,
-0.4873441, 0.4302965, -1.18172, 0.2705882, 1, 0, 1,
-0.4790353, 0.3336401, -1.092653, 0.2666667, 1, 0, 1,
-0.4766275, 1.594649, -1.77628, 0.2588235, 1, 0, 1,
-0.4751193, 0.9254781, -0.4915549, 0.254902, 1, 0, 1,
-0.4749857, 0.2811641, 0.9188435, 0.2470588, 1, 0, 1,
-0.4707054, -1.173336, -2.985595, 0.2431373, 1, 0, 1,
-0.4705533, -1.572002, -2.654667, 0.2352941, 1, 0, 1,
-0.4676419, -0.6715792, -1.323627, 0.2313726, 1, 0, 1,
-0.4597391, -2.899093, -1.25807, 0.2235294, 1, 0, 1,
-0.4581188, 0.594087, -0.5796, 0.2196078, 1, 0, 1,
-0.4548305, 1.167824, -0.08206801, 0.2117647, 1, 0, 1,
-0.4414733, 1.167698, 0.6473238, 0.2078431, 1, 0, 1,
-0.4340625, -0.4340068, -0.5413127, 0.2, 1, 0, 1,
-0.4339476, -0.7153711, -4.652809, 0.1921569, 1, 0, 1,
-0.432103, -0.2642833, -2.35748, 0.1882353, 1, 0, 1,
-0.4308313, 0.7709181, 1.255656, 0.1803922, 1, 0, 1,
-0.4306539, -2.03865, -2.407716, 0.1764706, 1, 0, 1,
-0.4276391, -0.8461733, -0.8065561, 0.1686275, 1, 0, 1,
-0.4226123, 0.1222195, -1.252711, 0.1647059, 1, 0, 1,
-0.4168566, 0.776244, 0.7709175, 0.1568628, 1, 0, 1,
-0.4138235, -0.438126, -1.511883, 0.1529412, 1, 0, 1,
-0.4060116, -0.295324, -3.133596, 0.145098, 1, 0, 1,
-0.4031744, 1.432368, -1.23463, 0.1411765, 1, 0, 1,
-0.4005029, 0.4355921, -1.177752, 0.1333333, 1, 0, 1,
-0.3990419, 1.251534, -0.789216, 0.1294118, 1, 0, 1,
-0.398779, -1.739535, -2.659802, 0.1215686, 1, 0, 1,
-0.3962754, -1.052375, -4.468686, 0.1176471, 1, 0, 1,
-0.3955854, 1.321184, 1.03304, 0.1098039, 1, 0, 1,
-0.3878759, -0.03479611, -2.03999, 0.1058824, 1, 0, 1,
-0.3851596, 0.4534749, -1.37921, 0.09803922, 1, 0, 1,
-0.3825403, -0.5003412, -1.722481, 0.09019608, 1, 0, 1,
-0.3814999, 0.2160803, -0.4830411, 0.08627451, 1, 0, 1,
-0.3760744, 0.5070259, -0.1451112, 0.07843138, 1, 0, 1,
-0.3758439, 0.2827537, -1.931655, 0.07450981, 1, 0, 1,
-0.3723242, 0.37449, 0.7583049, 0.06666667, 1, 0, 1,
-0.3701048, 1.202767, 2.558602, 0.0627451, 1, 0, 1,
-0.3680204, 0.4398765, -1.718158, 0.05490196, 1, 0, 1,
-0.3675172, 1.312512, -1.206425, 0.05098039, 1, 0, 1,
-0.3654518, -1.711716, -2.171404, 0.04313726, 1, 0, 1,
-0.3650585, 1.463108, -1.226518, 0.03921569, 1, 0, 1,
-0.3646393, 1.178404, -2.166908, 0.03137255, 1, 0, 1,
-0.3644781, 0.2935478, -0.7826418, 0.02745098, 1, 0, 1,
-0.3610591, 0.1624577, -1.470835, 0.01960784, 1, 0, 1,
-0.3598047, -0.1934101, -3.400504, 0.01568628, 1, 0, 1,
-0.3572046, 0.0519655, 0.08810454, 0.007843138, 1, 0, 1,
-0.351929, -0.3455364, -1.858557, 0.003921569, 1, 0, 1,
-0.351795, -0.09499921, -0.99906, 0, 1, 0.003921569, 1,
-0.3493217, 0.2252272, -2.026235, 0, 1, 0.01176471, 1,
-0.3480848, 0.08332406, -4.535588, 0, 1, 0.01568628, 1,
-0.3459709, -1.068978, -2.842366, 0, 1, 0.02352941, 1,
-0.3454858, 0.6632116, 0.1725961, 0, 1, 0.02745098, 1,
-0.3431972, -0.8861145, -2.937251, 0, 1, 0.03529412, 1,
-0.3409374, 0.8360589, -0.4860227, 0, 1, 0.03921569, 1,
-0.3365814, -0.6152954, -1.795954, 0, 1, 0.04705882, 1,
-0.3328163, 0.4508688, 0.4674831, 0, 1, 0.05098039, 1,
-0.332132, -1.142945, -3.495087, 0, 1, 0.05882353, 1,
-0.329731, -0.4960994, -1.064348, 0, 1, 0.0627451, 1,
-0.3231198, 1.595138, -0.6620758, 0, 1, 0.07058824, 1,
-0.3230081, 0.8119907, 1.877479, 0, 1, 0.07450981, 1,
-0.3164411, 0.07769933, -1.072876, 0, 1, 0.08235294, 1,
-0.3087585, 0.2025821, -1.256541, 0, 1, 0.08627451, 1,
-0.3065276, 0.08120672, -0.09754223, 0, 1, 0.09411765, 1,
-0.2993174, -1.854016, -2.86145, 0, 1, 0.1019608, 1,
-0.2955731, -0.2502705, -2.200059, 0, 1, 0.1058824, 1,
-0.2954958, -0.2918549, -2.20296, 0, 1, 0.1137255, 1,
-0.2954361, 0.7991605, -1.737154, 0, 1, 0.1176471, 1,
-0.293586, -0.8427877, -3.663619, 0, 1, 0.1254902, 1,
-0.2932632, 0.3718965, 1.014088, 0, 1, 0.1294118, 1,
-0.2925053, 0.8905604, 0.9949631, 0, 1, 0.1372549, 1,
-0.2893555, 1.707006, 0.981071, 0, 1, 0.1411765, 1,
-0.2870645, 0.003163236, -1.404473, 0, 1, 0.1490196, 1,
-0.2798418, -1.301515, -1.942835, 0, 1, 0.1529412, 1,
-0.2770798, 1.442999, 0.1881633, 0, 1, 0.1607843, 1,
-0.2758774, -0.6307925, -3.527425, 0, 1, 0.1647059, 1,
-0.2748591, -0.9246092, -3.16574, 0, 1, 0.172549, 1,
-0.2735917, -1.50206, -3.521454, 0, 1, 0.1764706, 1,
-0.2717285, 0.2228757, -1.355407, 0, 1, 0.1843137, 1,
-0.2701458, 0.2201448, -0.7266539, 0, 1, 0.1882353, 1,
-0.2685004, -0.7079515, -1.942323, 0, 1, 0.1960784, 1,
-0.2657422, 0.01730969, -2.601976, 0, 1, 0.2039216, 1,
-0.2636362, -0.0141933, -2.320866, 0, 1, 0.2078431, 1,
-0.2632633, 2.332115, -0.1919952, 0, 1, 0.2156863, 1,
-0.2616232, 2.037179, -0.9710991, 0, 1, 0.2196078, 1,
-0.2575566, 0.1207116, 0.05636581, 0, 1, 0.227451, 1,
-0.2567576, 0.7033731, 0.6011706, 0, 1, 0.2313726, 1,
-0.2546918, 0.2861501, -0.8398901, 0, 1, 0.2392157, 1,
-0.2534151, -0.8747622, -3.902342, 0, 1, 0.2431373, 1,
-0.2520628, -0.7373174, -3.446533, 0, 1, 0.2509804, 1,
-0.2514822, 0.5578819, -2.14461, 0, 1, 0.254902, 1,
-0.2510413, -0.4290032, -2.409911, 0, 1, 0.2627451, 1,
-0.2494701, 1.248327, 1.896544, 0, 1, 0.2666667, 1,
-0.2476639, -0.4186261, -1.660829, 0, 1, 0.2745098, 1,
-0.2462439, -0.3956074, -1.959581, 0, 1, 0.2784314, 1,
-0.2430738, -0.4368525, -3.349265, 0, 1, 0.2862745, 1,
-0.2419203, 1.236311, 0.3150599, 0, 1, 0.2901961, 1,
-0.2415233, 0.06703167, -1.899598, 0, 1, 0.2980392, 1,
-0.2409462, 0.5880603, 1.232557, 0, 1, 0.3058824, 1,
-0.2397497, -0.2504471, -0.6548188, 0, 1, 0.3098039, 1,
-0.2390707, -0.5085239, -3.961656, 0, 1, 0.3176471, 1,
-0.2341436, -1.562626, -3.661598, 0, 1, 0.3215686, 1,
-0.231514, -0.6442918, -3.293449, 0, 1, 0.3294118, 1,
-0.2293573, -0.5111045, -5.158226, 0, 1, 0.3333333, 1,
-0.2242226, 0.2903027, -1.967689, 0, 1, 0.3411765, 1,
-0.2233758, -1.346236, -4.343642, 0, 1, 0.345098, 1,
-0.2213798, -0.02939346, -2.432549, 0, 1, 0.3529412, 1,
-0.2197556, -0.9594219, -3.994747, 0, 1, 0.3568628, 1,
-0.2183462, -1.203441, -2.740285, 0, 1, 0.3647059, 1,
-0.2175135, -0.2045254, -2.252218, 0, 1, 0.3686275, 1,
-0.2168489, 0.5115185, -0.4003613, 0, 1, 0.3764706, 1,
-0.2154845, -1.71049, -0.918927, 0, 1, 0.3803922, 1,
-0.2149674, -0.1272149, -0.8116614, 0, 1, 0.3882353, 1,
-0.2136285, 1.723687, 0.4021776, 0, 1, 0.3921569, 1,
-0.2128971, -0.6188458, -3.204927, 0, 1, 0.4, 1,
-0.2078954, 1.245518, 1.278635, 0, 1, 0.4078431, 1,
-0.2065789, -0.9301153, -3.305596, 0, 1, 0.4117647, 1,
-0.2061887, -0.7253821, -1.98624, 0, 1, 0.4196078, 1,
-0.2029446, 0.2360385, -1.348265, 0, 1, 0.4235294, 1,
-0.2027194, 0.2182124, 0.06235594, 0, 1, 0.4313726, 1,
-0.1961785, 1.061655, 0.4427906, 0, 1, 0.4352941, 1,
-0.1954392, -0.03669016, -1.241565, 0, 1, 0.4431373, 1,
-0.1921, 0.6858917, 1.22823, 0, 1, 0.4470588, 1,
-0.1884855, -1.288637, -2.770509, 0, 1, 0.454902, 1,
-0.1883514, 0.2061939, -0.902015, 0, 1, 0.4588235, 1,
-0.1874362, 0.08570746, -1.17621, 0, 1, 0.4666667, 1,
-0.1836895, -0.4146507, -2.981355, 0, 1, 0.4705882, 1,
-0.1832256, -0.4470342, -2.140872, 0, 1, 0.4784314, 1,
-0.1782601, 0.8073086, -0.7052072, 0, 1, 0.4823529, 1,
-0.1765954, -0.3874907, -4.686781, 0, 1, 0.4901961, 1,
-0.1752909, -0.0762981, -1.232414, 0, 1, 0.4941176, 1,
-0.1732008, -1.483367, -4.444374, 0, 1, 0.5019608, 1,
-0.169522, -0.702679, -3.324867, 0, 1, 0.509804, 1,
-0.169005, 1.273575, -0.8145128, 0, 1, 0.5137255, 1,
-0.1673275, 0.8008856, -0.2671089, 0, 1, 0.5215687, 1,
-0.1641159, 0.379195, -1.099611, 0, 1, 0.5254902, 1,
-0.1605599, 0.5948001, 0.01504205, 0, 1, 0.5333334, 1,
-0.1583237, 2.264081, 0.05952712, 0, 1, 0.5372549, 1,
-0.1537569, 1.253723, 1.520795, 0, 1, 0.5450981, 1,
-0.149322, -0.9633758, -3.364622, 0, 1, 0.5490196, 1,
-0.1453477, -0.819172, -3.639556, 0, 1, 0.5568628, 1,
-0.1450197, 0.7678529, 0.563618, 0, 1, 0.5607843, 1,
-0.1428851, -0.3047541, -2.898845, 0, 1, 0.5686275, 1,
-0.1413021, -0.5282714, -2.987292, 0, 1, 0.572549, 1,
-0.1359573, -1.202658, -1.789687, 0, 1, 0.5803922, 1,
-0.1353837, 1.668936, 0.1246448, 0, 1, 0.5843138, 1,
-0.1342376, -0.04603745, -1.204037, 0, 1, 0.5921569, 1,
-0.1310131, 0.6449102, -1.068852, 0, 1, 0.5960785, 1,
-0.1294115, 0.1765658, -1.58922, 0, 1, 0.6039216, 1,
-0.1290927, -1.340344, -2.221493, 0, 1, 0.6117647, 1,
-0.1277381, -0.3827924, -3.226364, 0, 1, 0.6156863, 1,
-0.127548, 1.14788, 0.1389828, 0, 1, 0.6235294, 1,
-0.1274775, 0.07531496, -1.975846, 0, 1, 0.627451, 1,
-0.1221292, -1.347994, -3.901887, 0, 1, 0.6352941, 1,
-0.1166139, -0.5050194, -3.280171, 0, 1, 0.6392157, 1,
-0.1144275, 1.774718, 0.3114714, 0, 1, 0.6470588, 1,
-0.1030069, 1.543239, -1.542405, 0, 1, 0.6509804, 1,
-0.1014569, 3.288209, 0.8278371, 0, 1, 0.6588235, 1,
-0.1005598, 0.859895, 0.4006943, 0, 1, 0.6627451, 1,
-0.09809632, -1.248353, -3.401554, 0, 1, 0.6705883, 1,
-0.0947155, -1.333114, -2.814904, 0, 1, 0.6745098, 1,
-0.09441248, 0.2413594, 0.07121475, 0, 1, 0.682353, 1,
-0.09392601, 1.525535, 0.165225, 0, 1, 0.6862745, 1,
-0.09373527, -0.5426889, -2.040431, 0, 1, 0.6941177, 1,
-0.09362121, -0.5707747, -2.687048, 0, 1, 0.7019608, 1,
-0.09267682, -0.6258854, -1.090524, 0, 1, 0.7058824, 1,
-0.09086735, -1.071215, -1.559502, 0, 1, 0.7137255, 1,
-0.09048112, -0.1538548, -0.04050059, 0, 1, 0.7176471, 1,
-0.08864406, -0.1776266, -2.530026, 0, 1, 0.7254902, 1,
-0.08423822, 0.03019342, -1.072822, 0, 1, 0.7294118, 1,
-0.07912888, -0.1953007, -3.459818, 0, 1, 0.7372549, 1,
-0.07512984, -0.6147261, -2.091349, 0, 1, 0.7411765, 1,
-0.07324567, -0.948141, -3.460272, 0, 1, 0.7490196, 1,
-0.0728118, -0.09182673, -2.143751, 0, 1, 0.7529412, 1,
-0.07207245, -0.2455072, -2.599124, 0, 1, 0.7607843, 1,
-0.06573805, -1.529074, -3.83641, 0, 1, 0.7647059, 1,
-0.06485899, -0.5679485, -1.094983, 0, 1, 0.772549, 1,
-0.06096356, 1.012571, -0.3996813, 0, 1, 0.7764706, 1,
-0.05845206, 0.04031043, 0.3032922, 0, 1, 0.7843137, 1,
-0.05738803, -0.3565007, -2.714684, 0, 1, 0.7882353, 1,
-0.04821713, -0.6795986, -2.920355, 0, 1, 0.7960784, 1,
-0.04775723, -2.261456, -2.331334, 0, 1, 0.8039216, 1,
-0.04680153, -1.661294, -3.152497, 0, 1, 0.8078431, 1,
-0.0467043, 0.0959966, -2.523622, 0, 1, 0.8156863, 1,
-0.04464411, -0.216168, -4.670169, 0, 1, 0.8196079, 1,
-0.0411846, -1.644337, -3.306994, 0, 1, 0.827451, 1,
-0.03667939, 1.448237, 0.9647533, 0, 1, 0.8313726, 1,
-0.03503223, 0.5695853, 1.521715, 0, 1, 0.8392157, 1,
-0.02862038, -0.3629276, -2.920064, 0, 1, 0.8431373, 1,
-0.02557822, -0.3307932, -3.365607, 0, 1, 0.8509804, 1,
-0.02489136, -0.3998028, -4.588613, 0, 1, 0.854902, 1,
-0.02157262, 1.142283, 0.7952828, 0, 1, 0.8627451, 1,
-0.01789318, -0.4826284, -4.322012, 0, 1, 0.8666667, 1,
-0.01131935, 0.3316615, -0.2453672, 0, 1, 0.8745098, 1,
-0.009340919, 0.9199659, -1.169345, 0, 1, 0.8784314, 1,
-0.00401078, -0.6369209, -3.543902, 0, 1, 0.8862745, 1,
0.002327499, 0.9219794, 0.583694, 0, 1, 0.8901961, 1,
0.005706377, -0.6307966, 2.892375, 0, 1, 0.8980392, 1,
0.007942828, 0.6501427, 0.3291534, 0, 1, 0.9058824, 1,
0.01022309, 0.6783271, -0.4119598, 0, 1, 0.9098039, 1,
0.01179186, -0.5368608, 3.146505, 0, 1, 0.9176471, 1,
0.01432277, 0.1776498, -0.2901566, 0, 1, 0.9215686, 1,
0.01612399, -1.758814, 3.488314, 0, 1, 0.9294118, 1,
0.02396479, -1.018716, 1.472354, 0, 1, 0.9333333, 1,
0.02524839, 2.336708, -0.2361068, 0, 1, 0.9411765, 1,
0.02549344, 1.068144, 1.127945, 0, 1, 0.945098, 1,
0.02688722, -0.01980715, 3.52897, 0, 1, 0.9529412, 1,
0.0272757, 0.2007095, 0.4085003, 0, 1, 0.9568627, 1,
0.0306302, 0.9190344, -1.103202, 0, 1, 0.9647059, 1,
0.03507029, -0.5438417, 1.403833, 0, 1, 0.9686275, 1,
0.03858258, 0.306434, 1.151885, 0, 1, 0.9764706, 1,
0.04035244, -0.03383504, 2.03294, 0, 1, 0.9803922, 1,
0.04448602, 2.787281, 0.9505887, 0, 1, 0.9882353, 1,
0.04464902, 0.7315669, 0.05085612, 0, 1, 0.9921569, 1,
0.04511334, 0.8796742, 0.5789424, 0, 1, 1, 1,
0.04567666, -0.4531368, 3.598515, 0, 0.9921569, 1, 1,
0.04616536, -0.7586672, 2.882576, 0, 0.9882353, 1, 1,
0.05025056, -0.09198701, 1.024303, 0, 0.9803922, 1, 1,
0.0506076, 1.722691, -0.190366, 0, 0.9764706, 1, 1,
0.05281625, 0.5056692, 0.9838108, 0, 0.9686275, 1, 1,
0.05502374, 0.05552294, 1.289416, 0, 0.9647059, 1, 1,
0.05739523, -0.5290749, 2.675744, 0, 0.9568627, 1, 1,
0.06099688, -0.1424639, 4.409944, 0, 0.9529412, 1, 1,
0.06192205, -1.064934, 1.34684, 0, 0.945098, 1, 1,
0.06589834, -0.3528558, 2.112534, 0, 0.9411765, 1, 1,
0.06718569, -1.895777, 2.335687, 0, 0.9333333, 1, 1,
0.06797045, 1.066827, -1.079369, 0, 0.9294118, 1, 1,
0.06850436, -0.630513, 3.107895, 0, 0.9215686, 1, 1,
0.0691862, -0.5294275, 1.890628, 0, 0.9176471, 1, 1,
0.07129858, -1.212523, 1.996053, 0, 0.9098039, 1, 1,
0.07563762, -1.257287, 1.907295, 0, 0.9058824, 1, 1,
0.07670802, 0.3499923, -0.9896183, 0, 0.8980392, 1, 1,
0.07886411, -0.2476186, 2.442753, 0, 0.8901961, 1, 1,
0.08052818, 1.470443, -0.3342499, 0, 0.8862745, 1, 1,
0.08817906, 0.7057157, 1.30395, 0, 0.8784314, 1, 1,
0.08909696, 0.1975254, 0.2064553, 0, 0.8745098, 1, 1,
0.09257954, -0.6021416, 1.881004, 0, 0.8666667, 1, 1,
0.09832237, -2.212688, 3.89359, 0, 0.8627451, 1, 1,
0.1001017, -0.6895188, 2.732402, 0, 0.854902, 1, 1,
0.1028148, 0.1164139, -1.459614, 0, 0.8509804, 1, 1,
0.1033666, -1.243207, 2.433126, 0, 0.8431373, 1, 1,
0.1033719, 1.036981, 0.5157012, 0, 0.8392157, 1, 1,
0.1061745, -0.1531374, 3.717884, 0, 0.8313726, 1, 1,
0.1097917, -0.6511906, 3.474685, 0, 0.827451, 1, 1,
0.1149264, -0.1366616, 3.298602, 0, 0.8196079, 1, 1,
0.1186392, -0.3141901, 2.387627, 0, 0.8156863, 1, 1,
0.1220536, -0.4874407, 4.156318, 0, 0.8078431, 1, 1,
0.130833, -0.2242643, 2.883979, 0, 0.8039216, 1, 1,
0.1332897, 1.029978, -0.9501129, 0, 0.7960784, 1, 1,
0.1334536, -0.4184092, 4.174004, 0, 0.7882353, 1, 1,
0.1336209, -0.8370227, 2.843785, 0, 0.7843137, 1, 1,
0.1367142, -0.1820284, 1.80677, 0, 0.7764706, 1, 1,
0.1452023, 1.049004, 0.7704314, 0, 0.772549, 1, 1,
0.1454262, 0.005972142, 1.535128, 0, 0.7647059, 1, 1,
0.148509, -0.2439826, 3.98372, 0, 0.7607843, 1, 1,
0.1492147, 0.5407118, -0.1987314, 0, 0.7529412, 1, 1,
0.1500126, 0.3412392, -0.06095012, 0, 0.7490196, 1, 1,
0.1525642, -0.8633569, 3.890162, 0, 0.7411765, 1, 1,
0.155406, -0.2173947, 2.018364, 0, 0.7372549, 1, 1,
0.1562909, 0.9893799, 2.109972, 0, 0.7294118, 1, 1,
0.1576823, 0.4311978, 0.4984048, 0, 0.7254902, 1, 1,
0.1582995, 0.4440522, -0.0284615, 0, 0.7176471, 1, 1,
0.1604679, -1.580603, 0.5600179, 0, 0.7137255, 1, 1,
0.1625448, 0.6988642, 0.4637815, 0, 0.7058824, 1, 1,
0.1634684, -1.359519, 1.408207, 0, 0.6980392, 1, 1,
0.1637827, -0.5619212, 4.23991, 0, 0.6941177, 1, 1,
0.1641687, 0.3527743, 1.10173, 0, 0.6862745, 1, 1,
0.1746651, 0.2300203, 0.3176139, 0, 0.682353, 1, 1,
0.1789177, 0.5666937, -0.5869403, 0, 0.6745098, 1, 1,
0.1796128, 0.9212177, 1.120446, 0, 0.6705883, 1, 1,
0.1797548, 1.317001, 1.205439, 0, 0.6627451, 1, 1,
0.1833453, -0.5391159, 1.44595, 0, 0.6588235, 1, 1,
0.1848233, 1.136292, -0.324675, 0, 0.6509804, 1, 1,
0.1969285, -0.5709515, 2.22014, 0, 0.6470588, 1, 1,
0.1974894, -1.508543, 2.704475, 0, 0.6392157, 1, 1,
0.2023189, 1.299517, 0.6901907, 0, 0.6352941, 1, 1,
0.2029749, -1.420244, 3.496162, 0, 0.627451, 1, 1,
0.2052464, -0.3802925, 3.271559, 0, 0.6235294, 1, 1,
0.2095691, 0.1130265, 2.545668, 0, 0.6156863, 1, 1,
0.2148166, -0.8128513, 3.516311, 0, 0.6117647, 1, 1,
0.2155517, 0.1660765, 2.298585, 0, 0.6039216, 1, 1,
0.2161826, 0.3154383, 0.9196238, 0, 0.5960785, 1, 1,
0.2196417, -0.6568758, 2.002825, 0, 0.5921569, 1, 1,
0.2206795, -0.5839077, 2.162471, 0, 0.5843138, 1, 1,
0.2228569, 0.2510039, 0.08758965, 0, 0.5803922, 1, 1,
0.2232051, 0.8337454, -0.246609, 0, 0.572549, 1, 1,
0.2275066, -0.4516853, 1.47826, 0, 0.5686275, 1, 1,
0.2291383, -0.2697328, 2.204587, 0, 0.5607843, 1, 1,
0.2357404, -0.2001561, 2.952674, 0, 0.5568628, 1, 1,
0.236184, -1.205917, 2.573243, 0, 0.5490196, 1, 1,
0.2391287, -1.688547, 1.946061, 0, 0.5450981, 1, 1,
0.2408352, 0.2162379, -0.8023662, 0, 0.5372549, 1, 1,
0.2415126, -0.2339773, 0.9469491, 0, 0.5333334, 1, 1,
0.2423186, 1.153099, -0.6194127, 0, 0.5254902, 1, 1,
0.2442781, 0.5261329, -0.6790474, 0, 0.5215687, 1, 1,
0.2447637, 0.2655965, 0.9912558, 0, 0.5137255, 1, 1,
0.2485926, -0.3288175, 5.064078, 0, 0.509804, 1, 1,
0.2498577, -0.8635966, 3.267314, 0, 0.5019608, 1, 1,
0.2524358, -0.9093272, 1.480838, 0, 0.4941176, 1, 1,
0.2533087, -1.075955, 3.772942, 0, 0.4901961, 1, 1,
0.2542116, -1.596769, 2.56653, 0, 0.4823529, 1, 1,
0.2605379, 0.2663111, 1.420647, 0, 0.4784314, 1, 1,
0.2620667, -0.07394236, 0.9833536, 0, 0.4705882, 1, 1,
0.264027, -0.2937977, 2.80865, 0, 0.4666667, 1, 1,
0.2689349, -0.2384174, 2.140987, 0, 0.4588235, 1, 1,
0.2694753, -0.6801305, 4.123963, 0, 0.454902, 1, 1,
0.2742118, -0.08320411, 1.513134, 0, 0.4470588, 1, 1,
0.2746709, -0.9314705, 3.88938, 0, 0.4431373, 1, 1,
0.2803048, 0.09104583, 0.1832982, 0, 0.4352941, 1, 1,
0.2818239, -0.2593978, 1.638293, 0, 0.4313726, 1, 1,
0.286537, -0.5321308, 2.630732, 0, 0.4235294, 1, 1,
0.2880407, 0.04313973, -0.1876036, 0, 0.4196078, 1, 1,
0.2891667, -1.039498, 2.68566, 0, 0.4117647, 1, 1,
0.2905322, -0.553901, 3.507319, 0, 0.4078431, 1, 1,
0.2912265, 0.2140457, 0.4384306, 0, 0.4, 1, 1,
0.2935984, -1.020023, 3.116833, 0, 0.3921569, 1, 1,
0.2992427, 0.1393438, -0.3977579, 0, 0.3882353, 1, 1,
0.2998357, -0.5916905, 1.085102, 0, 0.3803922, 1, 1,
0.3003586, 1.06693, -0.2848405, 0, 0.3764706, 1, 1,
0.3062437, -1.793456, 3.273222, 0, 0.3686275, 1, 1,
0.3073846, -1.273493, 1.007349, 0, 0.3647059, 1, 1,
0.3083467, 1.222543, -1.68017, 0, 0.3568628, 1, 1,
0.3083863, -0.5804915, 2.971447, 0, 0.3529412, 1, 1,
0.3090726, 0.3863151, 0.7213281, 0, 0.345098, 1, 1,
0.310351, 1.482105, 1.259133, 0, 0.3411765, 1, 1,
0.3105488, 0.07174391, 2.41837, 0, 0.3333333, 1, 1,
0.3176843, -0.5236669, 3.338891, 0, 0.3294118, 1, 1,
0.3179738, -0.2061801, 0.3881582, 0, 0.3215686, 1, 1,
0.3197602, -0.7222372, 4.262333, 0, 0.3176471, 1, 1,
0.3207541, 1.471439, -0.2296909, 0, 0.3098039, 1, 1,
0.3237748, -0.4858667, 2.802751, 0, 0.3058824, 1, 1,
0.3247956, -0.7020493, 1.553297, 0, 0.2980392, 1, 1,
0.3287952, -2.501243, 1.621421, 0, 0.2901961, 1, 1,
0.331009, 1.173108, 2.801727, 0, 0.2862745, 1, 1,
0.3321021, -0.4653917, 3.009729, 0, 0.2784314, 1, 1,
0.3329164, -1.24248, 4.569526, 0, 0.2745098, 1, 1,
0.333737, 0.5227807, 0.06026326, 0, 0.2666667, 1, 1,
0.3341306, -0.5398775, 2.187442, 0, 0.2627451, 1, 1,
0.336692, -1.637388, 0.5570925, 0, 0.254902, 1, 1,
0.3384022, 1.353483, 0.7920798, 0, 0.2509804, 1, 1,
0.3444989, -1.165551, 2.174022, 0, 0.2431373, 1, 1,
0.3450341, 0.03308219, 2.991466, 0, 0.2392157, 1, 1,
0.3493329, -2.769886, 4.434709, 0, 0.2313726, 1, 1,
0.3522556, -1.330758, 5.030746, 0, 0.227451, 1, 1,
0.3538182, -0.1761501, 3.943271, 0, 0.2196078, 1, 1,
0.3548934, -0.8272176, 2.333639, 0, 0.2156863, 1, 1,
0.35605, 1.220604, 1.899523, 0, 0.2078431, 1, 1,
0.3565807, 0.8884788, 0.141496, 0, 0.2039216, 1, 1,
0.3609968, -1.506979, 3.216775, 0, 0.1960784, 1, 1,
0.3683715, 0.2515181, 0.8915744, 0, 0.1882353, 1, 1,
0.3806816, 0.2794637, 1.385029, 0, 0.1843137, 1, 1,
0.386677, -1.476405, 3.836533, 0, 0.1764706, 1, 1,
0.3940194, 0.4908289, 2.768416, 0, 0.172549, 1, 1,
0.3945498, 0.2496343, 1.31481, 0, 0.1647059, 1, 1,
0.3960758, -0.5754521, 0.6587793, 0, 0.1607843, 1, 1,
0.4022186, 1.752807, 0.4566012, 0, 0.1529412, 1, 1,
0.4041281, -0.584341, 2.085008, 0, 0.1490196, 1, 1,
0.4063879, -1.222305, 2.918743, 0, 0.1411765, 1, 1,
0.4124108, -0.3854974, 1.856507, 0, 0.1372549, 1, 1,
0.413491, 0.4609894, 0.2844109, 0, 0.1294118, 1, 1,
0.4137266, 1.514138, -0.8927307, 0, 0.1254902, 1, 1,
0.4139271, 1.627192, -0.7672732, 0, 0.1176471, 1, 1,
0.4178016, -1.22946, 1.928443, 0, 0.1137255, 1, 1,
0.4195628, 0.1187996, 2.926354, 0, 0.1058824, 1, 1,
0.4259814, 0.1918924, 0.4606145, 0, 0.09803922, 1, 1,
0.4279093, 0.4470501, -0.5380762, 0, 0.09411765, 1, 1,
0.4282568, 1.021747, -1.427573, 0, 0.08627451, 1, 1,
0.4346419, 0.5007343, -0.2943791, 0, 0.08235294, 1, 1,
0.4434664, -0.6140897, 1.281945, 0, 0.07450981, 1, 1,
0.4463407, 0.6710345, 0.5016968, 0, 0.07058824, 1, 1,
0.4490491, -0.8154648, 3.324892, 0, 0.0627451, 1, 1,
0.4501133, 0.5302132, 0.6785617, 0, 0.05882353, 1, 1,
0.45034, 1.690915, 0.510672, 0, 0.05098039, 1, 1,
0.4507248, 2.21406, 0.4953321, 0, 0.04705882, 1, 1,
0.4577707, -0.5389239, 2.391386, 0, 0.03921569, 1, 1,
0.4589757, -2.421744, 1.360258, 0, 0.03529412, 1, 1,
0.4605426, 1.384235, 0.6248481, 0, 0.02745098, 1, 1,
0.4613739, -0.689271, 2.163218, 0, 0.02352941, 1, 1,
0.4624554, 0.7185385, 0.9530135, 0, 0.01568628, 1, 1,
0.465398, 0.369841, 0.4795235, 0, 0.01176471, 1, 1,
0.4695038, 0.2527762, 1.024577, 0, 0.003921569, 1, 1,
0.4719421, 0.4576984, 1.209699, 0.003921569, 0, 1, 1,
0.4732725, -0.4118569, 2.944687, 0.007843138, 0, 1, 1,
0.4783379, 0.29174, 0.1907989, 0.01568628, 0, 1, 1,
0.4823318, 1.417333, -0.8684064, 0.01960784, 0, 1, 1,
0.488626, -0.8485036, 5.073492, 0.02745098, 0, 1, 1,
0.4902951, -1.95981, 2.685687, 0.03137255, 0, 1, 1,
0.4929427, 0.7994573, 1.228111, 0.03921569, 0, 1, 1,
0.5057367, 1.643091, 0.3477249, 0.04313726, 0, 1, 1,
0.5065033, 0.05893072, 1.66038, 0.05098039, 0, 1, 1,
0.5071085, -0.6439242, 2.941773, 0.05490196, 0, 1, 1,
0.5074592, -0.5052751, 0.2454898, 0.0627451, 0, 1, 1,
0.508736, -1.231084, 2.864455, 0.06666667, 0, 1, 1,
0.514196, -0.5712227, 3.893106, 0.07450981, 0, 1, 1,
0.5154978, -1.951959, 2.652107, 0.07843138, 0, 1, 1,
0.516916, 0.436428, 1.724198, 0.08627451, 0, 1, 1,
0.5184685, 0.2352498, 1.804813, 0.09019608, 0, 1, 1,
0.5219315, 1.221203, 0.7779892, 0.09803922, 0, 1, 1,
0.5239813, -0.8964855, 3.348536, 0.1058824, 0, 1, 1,
0.525028, 0.5929497, 0.7105423, 0.1098039, 0, 1, 1,
0.5318774, 1.629206, -0.4815182, 0.1176471, 0, 1, 1,
0.5323239, -0.535346, 3.13498, 0.1215686, 0, 1, 1,
0.5352851, 1.224708, 0.3612463, 0.1294118, 0, 1, 1,
0.5353791, -0.0267414, -0.09840172, 0.1333333, 0, 1, 1,
0.5438071, -0.1616944, 1.175108, 0.1411765, 0, 1, 1,
0.5450856, -0.9880456, 1.377653, 0.145098, 0, 1, 1,
0.5456401, -1.622061, 3.472663, 0.1529412, 0, 1, 1,
0.5462388, 0.87954, -0.1589075, 0.1568628, 0, 1, 1,
0.5478116, 1.965572, -0.5767739, 0.1647059, 0, 1, 1,
0.5504776, -2.085233, 0.7362815, 0.1686275, 0, 1, 1,
0.5561514, 1.189705, 0.2416664, 0.1764706, 0, 1, 1,
0.5634564, 0.09800015, 4.013266, 0.1803922, 0, 1, 1,
0.5653977, 0.5499874, 0.6796212, 0.1882353, 0, 1, 1,
0.565832, -0.3454154, 3.00847, 0.1921569, 0, 1, 1,
0.5685483, -1.106321, 3.094742, 0.2, 0, 1, 1,
0.5687253, -0.7978463, 1.909407, 0.2078431, 0, 1, 1,
0.5689358, -0.05617528, -0.3769648, 0.2117647, 0, 1, 1,
0.569533, 1.06021, 1.132253, 0.2196078, 0, 1, 1,
0.570973, -0.7182046, 2.634425, 0.2235294, 0, 1, 1,
0.5715681, 1.191894, -0.2122256, 0.2313726, 0, 1, 1,
0.574821, -1.566986, 2.314392, 0.2352941, 0, 1, 1,
0.5798339, -0.6316093, 2.903257, 0.2431373, 0, 1, 1,
0.5923041, 1.942347, 1.528463, 0.2470588, 0, 1, 1,
0.5932403, 0.3463414, 2.6468, 0.254902, 0, 1, 1,
0.5933294, -0.3882394, 1.781553, 0.2588235, 0, 1, 1,
0.5950804, 0.7881415, 0.8155497, 0.2666667, 0, 1, 1,
0.6017391, 0.1103658, -0.2278247, 0.2705882, 0, 1, 1,
0.6020211, -0.06767477, 2.378752, 0.2784314, 0, 1, 1,
0.6048188, 1.770905, -0.1484427, 0.282353, 0, 1, 1,
0.6064838, 0.8120545, 0.940755, 0.2901961, 0, 1, 1,
0.6067225, 0.3093235, 1.568998, 0.2941177, 0, 1, 1,
0.6087753, -0.6259701, 2.468315, 0.3019608, 0, 1, 1,
0.6109675, 0.1704779, 1.289641, 0.3098039, 0, 1, 1,
0.6151633, -1.135084, 0.9368759, 0.3137255, 0, 1, 1,
0.6169551, -1.802058, 4.016014, 0.3215686, 0, 1, 1,
0.6193162, 0.7305316, 0.7078407, 0.3254902, 0, 1, 1,
0.6198192, -0.3726135, 3.002769, 0.3333333, 0, 1, 1,
0.6247342, -1.329524, 1.787827, 0.3372549, 0, 1, 1,
0.6268963, -1.191804, 2.939176, 0.345098, 0, 1, 1,
0.6311865, 0.4792679, 0.5371236, 0.3490196, 0, 1, 1,
0.6315224, 0.5825289, 2.043694, 0.3568628, 0, 1, 1,
0.6329623, 2.498982, -0.05308945, 0.3607843, 0, 1, 1,
0.6341292, 0.8706813, 0.1503775, 0.3686275, 0, 1, 1,
0.6384031, 0.07332177, 0.6650546, 0.372549, 0, 1, 1,
0.6396207, -0.1793709, 1.997663, 0.3803922, 0, 1, 1,
0.6482954, -0.3840933, 1.789921, 0.3843137, 0, 1, 1,
0.6518207, -0.4418461, 3.301903, 0.3921569, 0, 1, 1,
0.6518208, 0.5631753, 1.966802, 0.3960784, 0, 1, 1,
0.6542026, -0.2568076, 2.724646, 0.4039216, 0, 1, 1,
0.6560263, 0.9902853, -0.4584889, 0.4117647, 0, 1, 1,
0.6602728, 1.020145, -0.6066108, 0.4156863, 0, 1, 1,
0.6613458, -1.974072, 4.029381, 0.4235294, 0, 1, 1,
0.6635177, -0.6242187, 3.274955, 0.427451, 0, 1, 1,
0.6724663, -0.9433267, 1.779939, 0.4352941, 0, 1, 1,
0.6875912, 0.6801555, 1.405431, 0.4392157, 0, 1, 1,
0.6903428, 2.141196, 0.3660094, 0.4470588, 0, 1, 1,
0.6964683, -0.7110399, 3.922605, 0.4509804, 0, 1, 1,
0.7072201, 0.3868516, 1.84119, 0.4588235, 0, 1, 1,
0.7086708, -0.1663361, 2.358029, 0.4627451, 0, 1, 1,
0.7150471, 0.6046028, 0.7351497, 0.4705882, 0, 1, 1,
0.7155241, 0.3290018, 1.263319, 0.4745098, 0, 1, 1,
0.7173014, -1.164537, 1.671593, 0.4823529, 0, 1, 1,
0.7178184, 0.8090036, -0.2191096, 0.4862745, 0, 1, 1,
0.7207736, -1.183396, 2.442685, 0.4941176, 0, 1, 1,
0.7232199, -0.8276832, 1.844785, 0.5019608, 0, 1, 1,
0.7239468, 0.7563748, -1.32611, 0.5058824, 0, 1, 1,
0.7352604, 1.023792, 0.8600799, 0.5137255, 0, 1, 1,
0.7488855, -0.01832267, 0.8044004, 0.5176471, 0, 1, 1,
0.753344, 0.05227007, 0.01736635, 0.5254902, 0, 1, 1,
0.7555187, 0.9110332, 1.178218, 0.5294118, 0, 1, 1,
0.75879, 1.179766, -0.1046616, 0.5372549, 0, 1, 1,
0.7595096, 1.906645, -0.3856919, 0.5411765, 0, 1, 1,
0.7636953, 1.533558, -0.1606055, 0.5490196, 0, 1, 1,
0.7667434, -0.1164556, 0.5582945, 0.5529412, 0, 1, 1,
0.7687578, -0.05951897, 2.477568, 0.5607843, 0, 1, 1,
0.7693818, 0.2291031, 0.5730687, 0.5647059, 0, 1, 1,
0.7724187, -0.5425657, 2.890279, 0.572549, 0, 1, 1,
0.77395, -1.286943, 1.701653, 0.5764706, 0, 1, 1,
0.7838165, 2.012612, 0.1191386, 0.5843138, 0, 1, 1,
0.7861867, 0.9842012, 2.653228, 0.5882353, 0, 1, 1,
0.7872926, -0.1589287, 1.517083, 0.5960785, 0, 1, 1,
0.7902066, 1.487243, 1.282728, 0.6039216, 0, 1, 1,
0.7912734, 1.500184, -0.6140766, 0.6078432, 0, 1, 1,
0.7931135, 0.3510809, 1.328495, 0.6156863, 0, 1, 1,
0.7933373, 1.220277, -0.08239769, 0.6196079, 0, 1, 1,
0.7940945, -0.04808234, 1.63798, 0.627451, 0, 1, 1,
0.8024681, 0.1194772, 1.956145, 0.6313726, 0, 1, 1,
0.8038765, -0.3287421, 2.582418, 0.6392157, 0, 1, 1,
0.8039027, -0.7384862, 3.193676, 0.6431373, 0, 1, 1,
0.8125916, -1.589181, 2.184617, 0.6509804, 0, 1, 1,
0.8165634, -1.430392, 1.166277, 0.654902, 0, 1, 1,
0.817492, -0.05895996, 2.810564, 0.6627451, 0, 1, 1,
0.8193125, 0.2210614, 0.6417332, 0.6666667, 0, 1, 1,
0.8195962, 0.3505562, 0.9853672, 0.6745098, 0, 1, 1,
0.8202662, 0.02340632, 1.250336, 0.6784314, 0, 1, 1,
0.820289, 1.480909, 0.3593235, 0.6862745, 0, 1, 1,
0.8251411, -0.1727647, 0.8545657, 0.6901961, 0, 1, 1,
0.8278468, -0.4737664, 1.850943, 0.6980392, 0, 1, 1,
0.8283873, -1.354481, 5.539537, 0.7058824, 0, 1, 1,
0.8352671, -0.328792, 3.705762, 0.7098039, 0, 1, 1,
0.8356028, 0.3569955, -0.4282787, 0.7176471, 0, 1, 1,
0.8361155, -1.26946, 0.9879156, 0.7215686, 0, 1, 1,
0.8395434, 1.949429, 2.030221, 0.7294118, 0, 1, 1,
0.8412918, 0.7754523, 0.1695161, 0.7333333, 0, 1, 1,
0.843555, 1.50839, 1.280402, 0.7411765, 0, 1, 1,
0.8500516, 0.3337108, 1.549185, 0.7450981, 0, 1, 1,
0.8580354, 1.319945, 0.9587705, 0.7529412, 0, 1, 1,
0.870989, 1.657873, 1.489542, 0.7568628, 0, 1, 1,
0.8743286, -0.8767484, 3.015676, 0.7647059, 0, 1, 1,
0.8747273, -2.12397, 1.829233, 0.7686275, 0, 1, 1,
0.8748619, 1.219258, 0.8960114, 0.7764706, 0, 1, 1,
0.8761119, -0.3282008, 2.222188, 0.7803922, 0, 1, 1,
0.8783355, -1.272469, 1.168312, 0.7882353, 0, 1, 1,
0.8802685, -0.003266973, 1.377985, 0.7921569, 0, 1, 1,
0.8861607, 0.2057792, 1.496587, 0.8, 0, 1, 1,
0.8888735, -0.1278926, 3.199794, 0.8078431, 0, 1, 1,
0.8891125, -0.7548108, 2.70623, 0.8117647, 0, 1, 1,
0.890154, -1.47963, 2.179818, 0.8196079, 0, 1, 1,
0.8906396, -1.840387, 3.781209, 0.8235294, 0, 1, 1,
0.891053, 0.2797085, 3.654534, 0.8313726, 0, 1, 1,
0.8950451, -0.4600558, 2.470207, 0.8352941, 0, 1, 1,
0.9041584, -0.9486469, 2.806857, 0.8431373, 0, 1, 1,
0.9091308, 0.4875336, 1.358813, 0.8470588, 0, 1, 1,
0.9106507, -1.131994, 4.424621, 0.854902, 0, 1, 1,
0.9114903, 0.6099055, 0.1137357, 0.8588235, 0, 1, 1,
0.9123873, -0.8419771, 3.101265, 0.8666667, 0, 1, 1,
0.9184846, -0.7599583, 2.080448, 0.8705882, 0, 1, 1,
0.9209968, -1.099517, 1.053378, 0.8784314, 0, 1, 1,
0.9275106, -0.1479438, 1.197624, 0.8823529, 0, 1, 1,
0.9283649, -0.8529344, 4.312074, 0.8901961, 0, 1, 1,
0.9323088, -0.3249604, 0.8364357, 0.8941177, 0, 1, 1,
0.9337867, 1.398951, 0.5095056, 0.9019608, 0, 1, 1,
0.9385669, -1.31418, 2.954606, 0.9098039, 0, 1, 1,
0.9401821, -0.5863489, 1.408739, 0.9137255, 0, 1, 1,
0.9410089, 0.4512495, 2.310136, 0.9215686, 0, 1, 1,
0.9419167, 1.110238, 1.670474, 0.9254902, 0, 1, 1,
0.9425178, 1.053626, 1.725992, 0.9333333, 0, 1, 1,
0.9426916, -0.269461, 2.724148, 0.9372549, 0, 1, 1,
0.9482827, 0.227234, 2.63777, 0.945098, 0, 1, 1,
0.9587785, -0.6663649, -0.3703681, 0.9490196, 0, 1, 1,
0.9624097, 0.4270464, 1.564046, 0.9568627, 0, 1, 1,
0.9723176, 1.55306, 1.95864, 0.9607843, 0, 1, 1,
0.9734841, -0.5344781, 1.395329, 0.9686275, 0, 1, 1,
0.9747768, -1.144471, 2.895035, 0.972549, 0, 1, 1,
0.9759244, 0.9133925, -1.056761, 0.9803922, 0, 1, 1,
0.9773147, -1.553776, 2.487106, 0.9843137, 0, 1, 1,
0.9840763, 1.756979, 1.252782, 0.9921569, 0, 1, 1,
0.9857968, -1.504344, 2.273283, 0.9960784, 0, 1, 1,
0.9913483, -0.107046, 0.4964941, 1, 0, 0.9960784, 1,
1.003787, 0.05329804, 3.83523, 1, 0, 0.9882353, 1,
1.005927, 0.6253557, 2.592635, 1, 0, 0.9843137, 1,
1.007877, -0.4092546, 2.400333, 1, 0, 0.9764706, 1,
1.008668, 2.176691, 1.637455, 1, 0, 0.972549, 1,
1.010391, -0.2587911, 2.605029, 1, 0, 0.9647059, 1,
1.01325, -0.871693, 1.701657, 1, 0, 0.9607843, 1,
1.034445, -1.347125, 0.379782, 1, 0, 0.9529412, 1,
1.034956, 0.8260665, 0.05185445, 1, 0, 0.9490196, 1,
1.035257, -1.522665, 2.729253, 1, 0, 0.9411765, 1,
1.042531, 0.1273698, 1.119631, 1, 0, 0.9372549, 1,
1.044017, 0.726209, -0.3411773, 1, 0, 0.9294118, 1,
1.045194, -0.5555378, 0.3705846, 1, 0, 0.9254902, 1,
1.051965, 0.08336049, 2.204097, 1, 0, 0.9176471, 1,
1.054276, -1.969878, 1.788805, 1, 0, 0.9137255, 1,
1.066223, 0.3527834, 1.107565, 1, 0, 0.9058824, 1,
1.083149, 0.3035609, 1.901801, 1, 0, 0.9019608, 1,
1.086196, 1.648361, 0.9721041, 1, 0, 0.8941177, 1,
1.093612, -1.31107, 1.595372, 1, 0, 0.8862745, 1,
1.106109, -0.304308, 0.8309237, 1, 0, 0.8823529, 1,
1.106962, -1.318583, 2.258482, 1, 0, 0.8745098, 1,
1.107316, -0.2100374, 2.176906, 1, 0, 0.8705882, 1,
1.108043, 0.07597758, 2.188969, 1, 0, 0.8627451, 1,
1.110132, -0.5776485, 0.69919, 1, 0, 0.8588235, 1,
1.113285, -0.6453951, 2.287673, 1, 0, 0.8509804, 1,
1.114695, 0.3826381, 0.9162191, 1, 0, 0.8470588, 1,
1.116709, -0.6371036, 2.335881, 1, 0, 0.8392157, 1,
1.118528, -0.1554273, 2.447344, 1, 0, 0.8352941, 1,
1.119093, 1.289915, -0.714738, 1, 0, 0.827451, 1,
1.120336, -0.1592572, 0.4677124, 1, 0, 0.8235294, 1,
1.123412, 0.5482923, 0.1867906, 1, 0, 0.8156863, 1,
1.128244, -0.1792033, 0.5320654, 1, 0, 0.8117647, 1,
1.131534, 0.1331112, 2.812325, 1, 0, 0.8039216, 1,
1.133193, 0.6317926, 0.7431253, 1, 0, 0.7960784, 1,
1.137642, -0.4853422, 1.564638, 1, 0, 0.7921569, 1,
1.138259, 0.03592001, 1.842273, 1, 0, 0.7843137, 1,
1.148495, -1.931599, 1.030309, 1, 0, 0.7803922, 1,
1.155126, 1.465561, 0.9002477, 1, 0, 0.772549, 1,
1.158226, 1.221371, 0.9433061, 1, 0, 0.7686275, 1,
1.160895, 0.5775051, -0.4719003, 1, 0, 0.7607843, 1,
1.172934, 0.4161699, 1.449891, 1, 0, 0.7568628, 1,
1.173247, -0.07084219, 0.4208557, 1, 0, 0.7490196, 1,
1.175341, 0.7827042, 1.918875, 1, 0, 0.7450981, 1,
1.183663, 1.000765, 2.125234, 1, 0, 0.7372549, 1,
1.188764, 1.715662, 0.1968119, 1, 0, 0.7333333, 1,
1.188927, 0.8475373, 0.1430132, 1, 0, 0.7254902, 1,
1.189653, -0.13668, 4.384688, 1, 0, 0.7215686, 1,
1.201786, 0.07247921, 1.786407, 1, 0, 0.7137255, 1,
1.204962, -1.394783, 3.017777, 1, 0, 0.7098039, 1,
1.216214, 0.479498, 3.073239, 1, 0, 0.7019608, 1,
1.22173, 0.3629047, -0.2576742, 1, 0, 0.6941177, 1,
1.22576, -0.2356115, 1.6947, 1, 0, 0.6901961, 1,
1.246508, 0.1253105, 2.485634, 1, 0, 0.682353, 1,
1.249597, -2.500007, 3.082019, 1, 0, 0.6784314, 1,
1.252963, 0.297835, 2.085877, 1, 0, 0.6705883, 1,
1.253331, -0.4165643, 0.9157261, 1, 0, 0.6666667, 1,
1.25687, -0.4855893, 2.346447, 1, 0, 0.6588235, 1,
1.262299, -0.3578004, 1.757287, 1, 0, 0.654902, 1,
1.264101, 2.525823, -0.1109497, 1, 0, 0.6470588, 1,
1.267144, -1.736468, 3.037765, 1, 0, 0.6431373, 1,
1.275789, 1.938092, 1.151435, 1, 0, 0.6352941, 1,
1.280034, -0.56622, 0.6512637, 1, 0, 0.6313726, 1,
1.285849, -0.3753003, 0.9776849, 1, 0, 0.6235294, 1,
1.28952, 0.6505298, 1.363935, 1, 0, 0.6196079, 1,
1.297137, 0.1895425, 1.860447, 1, 0, 0.6117647, 1,
1.297915, -0.3311503, 2.54286, 1, 0, 0.6078432, 1,
1.29847, -0.257015, 2.471608, 1, 0, 0.6, 1,
1.306598, -0.8772035, 1.473174, 1, 0, 0.5921569, 1,
1.321038, 0.8312159, 1.197986, 1, 0, 0.5882353, 1,
1.338556, 0.1102486, 0.6602743, 1, 0, 0.5803922, 1,
1.339803, -0.1124449, 0.858952, 1, 0, 0.5764706, 1,
1.347179, -0.8576574, 3.599913, 1, 0, 0.5686275, 1,
1.350453, -0.8066291, 1.240052, 1, 0, 0.5647059, 1,
1.353659, 0.3440257, 0.9099153, 1, 0, 0.5568628, 1,
1.356249, 0.9195395, 1.558068, 1, 0, 0.5529412, 1,
1.356852, 0.06599279, 2.359443, 1, 0, 0.5450981, 1,
1.360469, 0.07598525, 1.317158, 1, 0, 0.5411765, 1,
1.36084, 0.5969722, 2.176995, 1, 0, 0.5333334, 1,
1.371818, 0.3819163, 2.631095, 1, 0, 0.5294118, 1,
1.374196, -0.5489629, 2.988333, 1, 0, 0.5215687, 1,
1.379706, -0.2339191, 1.335689, 1, 0, 0.5176471, 1,
1.381601, -0.3435318, 1.230777, 1, 0, 0.509804, 1,
1.387914, -1.014953, 2.858429, 1, 0, 0.5058824, 1,
1.389376, -0.4399683, 2.776517, 1, 0, 0.4980392, 1,
1.391534, -0.5337084, 3.617423, 1, 0, 0.4901961, 1,
1.392519, 0.1708537, 0.5807698, 1, 0, 0.4862745, 1,
1.414312, -0.3194769, 3.260226, 1, 0, 0.4784314, 1,
1.423188, 1.902705, 1.798869, 1, 0, 0.4745098, 1,
1.447554, 0.3654285, 1.131859, 1, 0, 0.4666667, 1,
1.460125, 0.6622429, 1.5236, 1, 0, 0.4627451, 1,
1.497496, 0.01427601, 1.069153, 1, 0, 0.454902, 1,
1.499794, -1.05329, 1.550992, 1, 0, 0.4509804, 1,
1.502187, 0.5740747, 1.196321, 1, 0, 0.4431373, 1,
1.507724, -0.9433821, 2.071752, 1, 0, 0.4392157, 1,
1.523174, 0.8122508, 1.723138, 1, 0, 0.4313726, 1,
1.524861, 1.470058, 0.6820359, 1, 0, 0.427451, 1,
1.5528, -0.7445538, 3.124638, 1, 0, 0.4196078, 1,
1.55885, -0.5221888, 3.246084, 1, 0, 0.4156863, 1,
1.562157, 0.1816339, 1.041341, 1, 0, 0.4078431, 1,
1.57057, 1.280562, 0.7915944, 1, 0, 0.4039216, 1,
1.573446, 0.2474013, 2.201154, 1, 0, 0.3960784, 1,
1.583378, 2.242197, 1.506329, 1, 0, 0.3882353, 1,
1.589732, 1.593925, 1.574496, 1, 0, 0.3843137, 1,
1.591156, -0.6203083, 1.98767, 1, 0, 0.3764706, 1,
1.597284, -0.9261361, 4.570614, 1, 0, 0.372549, 1,
1.607849, 0.4546155, 0.2258895, 1, 0, 0.3647059, 1,
1.608974, 1.20627, 3.161101, 1, 0, 0.3607843, 1,
1.609408, -1.790446, 2.204214, 1, 0, 0.3529412, 1,
1.613196, 0.1461947, 3.075634, 1, 0, 0.3490196, 1,
1.637416, 0.1730921, -1.18335, 1, 0, 0.3411765, 1,
1.645329, 0.2443661, 0.4010633, 1, 0, 0.3372549, 1,
1.650562, 0.5005016, -0.3451386, 1, 0, 0.3294118, 1,
1.651575, -0.08389262, 1.204553, 1, 0, 0.3254902, 1,
1.664182, 0.6619721, -0.0370162, 1, 0, 0.3176471, 1,
1.664215, -0.5087766, 1.83157, 1, 0, 0.3137255, 1,
1.675434, 0.2574776, 1.822111, 1, 0, 0.3058824, 1,
1.688787, -1.296632, 2.51821, 1, 0, 0.2980392, 1,
1.694375, 0.09081977, 0.1632632, 1, 0, 0.2941177, 1,
1.695578, 0.6099402, 1.962997, 1, 0, 0.2862745, 1,
1.703451, -0.2374835, 0.8550271, 1, 0, 0.282353, 1,
1.707666, -0.7141064, 3.405033, 1, 0, 0.2745098, 1,
1.712303, 0.4743548, 2.268543, 1, 0, 0.2705882, 1,
1.738936, 0.9639555, 1.599007, 1, 0, 0.2627451, 1,
1.751803, -0.500019, 2.226265, 1, 0, 0.2588235, 1,
1.76529, -0.1016773, 3.036695, 1, 0, 0.2509804, 1,
1.770407, 0.01760922, 1.867869, 1, 0, 0.2470588, 1,
1.797797, 0.3028844, 2.205715, 1, 0, 0.2392157, 1,
1.800219, 1.727468, 0.8234032, 1, 0, 0.2352941, 1,
1.838683, -1.727598, 2.364371, 1, 0, 0.227451, 1,
1.849811, -1.443497, 3.827774, 1, 0, 0.2235294, 1,
1.873786, -1.80248, 3.144065, 1, 0, 0.2156863, 1,
1.913884, 0.7083231, 2.024466, 1, 0, 0.2117647, 1,
1.933145, -1.005224, 1.239354, 1, 0, 0.2039216, 1,
1.935855, 0.226859, 1.757255, 1, 0, 0.1960784, 1,
1.938688, -0.9693977, 0.5278789, 1, 0, 0.1921569, 1,
1.941443, 1.27897, 0.6504515, 1, 0, 0.1843137, 1,
1.944596, -2.809219, 3.122568, 1, 0, 0.1803922, 1,
1.944714, -1.691814, 0.8509007, 1, 0, 0.172549, 1,
1.975871, 0.1439767, 0.9434577, 1, 0, 0.1686275, 1,
1.993396, 0.5068256, 0.6052262, 1, 0, 0.1607843, 1,
1.99405, -1.472208, 3.759588, 1, 0, 0.1568628, 1,
2.011228, -2.173425, 0.7824118, 1, 0, 0.1490196, 1,
2.027236, -0.385014, 0.7195323, 1, 0, 0.145098, 1,
2.027765, -1.597084, 1.22024, 1, 0, 0.1372549, 1,
2.047682, 0.2698934, 1.995911, 1, 0, 0.1333333, 1,
2.049881, -1.207907, 1.520257, 1, 0, 0.1254902, 1,
2.054945, 0.2965764, 1.126015, 1, 0, 0.1215686, 1,
2.089469, 0.07187358, 0.8525694, 1, 0, 0.1137255, 1,
2.129987, -0.7396685, 1.626192, 1, 0, 0.1098039, 1,
2.23812, -0.7224452, 2.224856, 1, 0, 0.1019608, 1,
2.288182, -0.2372862, 0.8073188, 1, 0, 0.09411765, 1,
2.294241, -1.518783, 2.654806, 1, 0, 0.09019608, 1,
2.297452, 0.1777286, 2.385262, 1, 0, 0.08235294, 1,
2.332355, 0.5147174, 0.6196551, 1, 0, 0.07843138, 1,
2.333045, 0.6639895, 1.309134, 1, 0, 0.07058824, 1,
2.350531, -0.6309533, 1.341385, 1, 0, 0.06666667, 1,
2.362129, -0.5378138, -0.0517466, 1, 0, 0.05882353, 1,
2.433595, 0.09349562, 0.5251179, 1, 0, 0.05490196, 1,
2.476064, 1.129782, 1.490104, 1, 0, 0.04705882, 1,
2.488776, -0.2869118, 1.870545, 1, 0, 0.04313726, 1,
2.548832, -0.1300434, 0.2910641, 1, 0, 0.03529412, 1,
2.57229, -0.5413296, 1.161049, 1, 0, 0.03137255, 1,
2.695668, 1.563643, 0.588087, 1, 0, 0.02352941, 1,
2.727057, -1.474132, 0.6962892, 1, 0, 0.01960784, 1,
2.993073, -0.6428378, 2.532881, 1, 0, 0.01176471, 1,
3.067566, -2.150994, 2.017873, 1, 0, 0.007843138, 1
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
0.01073861, -4.09024, -7.425284, 0, -0.5, 0.5, 0.5,
0.01073861, -4.09024, -7.425284, 1, -0.5, 0.5, 0.5,
0.01073861, -4.09024, -7.425284, 1, 1.5, 0.5, 0.5,
0.01073861, -4.09024, -7.425284, 0, 1.5, 0.5, 0.5
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
-4.082354, 0.1336775, -7.425284, 0, -0.5, 0.5, 0.5,
-4.082354, 0.1336775, -7.425284, 1, -0.5, 0.5, 0.5,
-4.082354, 0.1336775, -7.425284, 1, 1.5, 0.5, 0.5,
-4.082354, 0.1336775, -7.425284, 0, 1.5, 0.5, 0.5
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
-4.082354, -4.09024, -0.003353357, 0, -0.5, 0.5, 0.5,
-4.082354, -4.09024, -0.003353357, 1, -0.5, 0.5, 0.5,
-4.082354, -4.09024, -0.003353357, 1, 1.5, 0.5, 0.5,
-4.082354, -4.09024, -0.003353357, 0, 1.5, 0.5, 0.5
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
-3, -3.11549, -5.712531,
3, -3.11549, -5.712531,
-3, -3.11549, -5.712531,
-3, -3.277949, -5.99799,
-2, -3.11549, -5.712531,
-2, -3.277949, -5.99799,
-1, -3.11549, -5.712531,
-1, -3.277949, -5.99799,
0, -3.11549, -5.712531,
0, -3.277949, -5.99799,
1, -3.11549, -5.712531,
1, -3.277949, -5.99799,
2, -3.11549, -5.712531,
2, -3.277949, -5.99799,
3, -3.11549, -5.712531,
3, -3.277949, -5.99799
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
-3, -3.602865, -6.568907, 0, -0.5, 0.5, 0.5,
-3, -3.602865, -6.568907, 1, -0.5, 0.5, 0.5,
-3, -3.602865, -6.568907, 1, 1.5, 0.5, 0.5,
-3, -3.602865, -6.568907, 0, 1.5, 0.5, 0.5,
-2, -3.602865, -6.568907, 0, -0.5, 0.5, 0.5,
-2, -3.602865, -6.568907, 1, -0.5, 0.5, 0.5,
-2, -3.602865, -6.568907, 1, 1.5, 0.5, 0.5,
-2, -3.602865, -6.568907, 0, 1.5, 0.5, 0.5,
-1, -3.602865, -6.568907, 0, -0.5, 0.5, 0.5,
-1, -3.602865, -6.568907, 1, -0.5, 0.5, 0.5,
-1, -3.602865, -6.568907, 1, 1.5, 0.5, 0.5,
-1, -3.602865, -6.568907, 0, 1.5, 0.5, 0.5,
0, -3.602865, -6.568907, 0, -0.5, 0.5, 0.5,
0, -3.602865, -6.568907, 1, -0.5, 0.5, 0.5,
0, -3.602865, -6.568907, 1, 1.5, 0.5, 0.5,
0, -3.602865, -6.568907, 0, 1.5, 0.5, 0.5,
1, -3.602865, -6.568907, 0, -0.5, 0.5, 0.5,
1, -3.602865, -6.568907, 1, -0.5, 0.5, 0.5,
1, -3.602865, -6.568907, 1, 1.5, 0.5, 0.5,
1, -3.602865, -6.568907, 0, 1.5, 0.5, 0.5,
2, -3.602865, -6.568907, 0, -0.5, 0.5, 0.5,
2, -3.602865, -6.568907, 1, -0.5, 0.5, 0.5,
2, -3.602865, -6.568907, 1, 1.5, 0.5, 0.5,
2, -3.602865, -6.568907, 0, 1.5, 0.5, 0.5,
3, -3.602865, -6.568907, 0, -0.5, 0.5, 0.5,
3, -3.602865, -6.568907, 1, -0.5, 0.5, 0.5,
3, -3.602865, -6.568907, 1, 1.5, 0.5, 0.5,
3, -3.602865, -6.568907, 0, 1.5, 0.5, 0.5
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
-3.137794, -3, -5.712531,
-3.137794, 3, -5.712531,
-3.137794, -3, -5.712531,
-3.295221, -3, -5.99799,
-3.137794, -2, -5.712531,
-3.295221, -2, -5.99799,
-3.137794, -1, -5.712531,
-3.295221, -1, -5.99799,
-3.137794, 0, -5.712531,
-3.295221, 0, -5.99799,
-3.137794, 1, -5.712531,
-3.295221, 1, -5.99799,
-3.137794, 2, -5.712531,
-3.295221, 2, -5.99799,
-3.137794, 3, -5.712531,
-3.295221, 3, -5.99799
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
-3.610074, -3, -6.568907, 0, -0.5, 0.5, 0.5,
-3.610074, -3, -6.568907, 1, -0.5, 0.5, 0.5,
-3.610074, -3, -6.568907, 1, 1.5, 0.5, 0.5,
-3.610074, -3, -6.568907, 0, 1.5, 0.5, 0.5,
-3.610074, -2, -6.568907, 0, -0.5, 0.5, 0.5,
-3.610074, -2, -6.568907, 1, -0.5, 0.5, 0.5,
-3.610074, -2, -6.568907, 1, 1.5, 0.5, 0.5,
-3.610074, -2, -6.568907, 0, 1.5, 0.5, 0.5,
-3.610074, -1, -6.568907, 0, -0.5, 0.5, 0.5,
-3.610074, -1, -6.568907, 1, -0.5, 0.5, 0.5,
-3.610074, -1, -6.568907, 1, 1.5, 0.5, 0.5,
-3.610074, -1, -6.568907, 0, 1.5, 0.5, 0.5,
-3.610074, 0, -6.568907, 0, -0.5, 0.5, 0.5,
-3.610074, 0, -6.568907, 1, -0.5, 0.5, 0.5,
-3.610074, 0, -6.568907, 1, 1.5, 0.5, 0.5,
-3.610074, 0, -6.568907, 0, 1.5, 0.5, 0.5,
-3.610074, 1, -6.568907, 0, -0.5, 0.5, 0.5,
-3.610074, 1, -6.568907, 1, -0.5, 0.5, 0.5,
-3.610074, 1, -6.568907, 1, 1.5, 0.5, 0.5,
-3.610074, 1, -6.568907, 0, 1.5, 0.5, 0.5,
-3.610074, 2, -6.568907, 0, -0.5, 0.5, 0.5,
-3.610074, 2, -6.568907, 1, -0.5, 0.5, 0.5,
-3.610074, 2, -6.568907, 1, 1.5, 0.5, 0.5,
-3.610074, 2, -6.568907, 0, 1.5, 0.5, 0.5,
-3.610074, 3, -6.568907, 0, -0.5, 0.5, 0.5,
-3.610074, 3, -6.568907, 1, -0.5, 0.5, 0.5,
-3.610074, 3, -6.568907, 1, 1.5, 0.5, 0.5,
-3.610074, 3, -6.568907, 0, 1.5, 0.5, 0.5
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
-3.137794, -3.11549, -4,
-3.137794, -3.11549, 4,
-3.137794, -3.11549, -4,
-3.295221, -3.277949, -4,
-3.137794, -3.11549, -2,
-3.295221, -3.277949, -2,
-3.137794, -3.11549, 0,
-3.295221, -3.277949, 0,
-3.137794, -3.11549, 2,
-3.295221, -3.277949, 2,
-3.137794, -3.11549, 4,
-3.295221, -3.277949, 4
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
-3.610074, -3.602865, -4, 0, -0.5, 0.5, 0.5,
-3.610074, -3.602865, -4, 1, -0.5, 0.5, 0.5,
-3.610074, -3.602865, -4, 1, 1.5, 0.5, 0.5,
-3.610074, -3.602865, -4, 0, 1.5, 0.5, 0.5,
-3.610074, -3.602865, -2, 0, -0.5, 0.5, 0.5,
-3.610074, -3.602865, -2, 1, -0.5, 0.5, 0.5,
-3.610074, -3.602865, -2, 1, 1.5, 0.5, 0.5,
-3.610074, -3.602865, -2, 0, 1.5, 0.5, 0.5,
-3.610074, -3.602865, 0, 0, -0.5, 0.5, 0.5,
-3.610074, -3.602865, 0, 1, -0.5, 0.5, 0.5,
-3.610074, -3.602865, 0, 1, 1.5, 0.5, 0.5,
-3.610074, -3.602865, 0, 0, 1.5, 0.5, 0.5,
-3.610074, -3.602865, 2, 0, -0.5, 0.5, 0.5,
-3.610074, -3.602865, 2, 1, -0.5, 0.5, 0.5,
-3.610074, -3.602865, 2, 1, 1.5, 0.5, 0.5,
-3.610074, -3.602865, 2, 0, 1.5, 0.5, 0.5,
-3.610074, -3.602865, 4, 0, -0.5, 0.5, 0.5,
-3.610074, -3.602865, 4, 1, -0.5, 0.5, 0.5,
-3.610074, -3.602865, 4, 1, 1.5, 0.5, 0.5,
-3.610074, -3.602865, 4, 0, 1.5, 0.5, 0.5
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
-3.137794, -3.11549, -5.712531,
-3.137794, 3.382845, -5.712531,
-3.137794, -3.11549, 5.705824,
-3.137794, 3.382845, 5.705824,
-3.137794, -3.11549, -5.712531,
-3.137794, -3.11549, 5.705824,
-3.137794, 3.382845, -5.712531,
-3.137794, 3.382845, 5.705824,
-3.137794, -3.11549, -5.712531,
3.159271, -3.11549, -5.712531,
-3.137794, -3.11549, 5.705824,
3.159271, -3.11549, 5.705824,
-3.137794, 3.382845, -5.712531,
3.159271, 3.382845, -5.712531,
-3.137794, 3.382845, 5.705824,
3.159271, 3.382845, 5.705824,
3.159271, -3.11549, -5.712531,
3.159271, 3.382845, -5.712531,
3.159271, -3.11549, 5.705824,
3.159271, 3.382845, 5.705824,
3.159271, -3.11549, -5.712531,
3.159271, -3.11549, 5.705824,
3.159271, 3.382845, -5.712531,
3.159271, 3.382845, 5.705824
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
var radius = 7.779645;
var distance = 34.61252;
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
mvMatrix.translate( -0.01073861, -0.1336775, 0.003353357 );
mvMatrix.scale( 1.335782, 1.294409, 0.7366652 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.61252);
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
Cyanophos<-read.table("Cyanophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cyanophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cyanophos' not found
```

```r
y<-Cyanophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cyanophos' not found
```

```r
z<-Cyanophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cyanophos' not found
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
-3.046089, -0.2457688, -2.085857, 0, 0, 1, 1, 1,
-2.945773, 1.696562, -0.3089342, 1, 0, 0, 1, 1,
-2.918198, 0.7780807, -0.7735705, 1, 0, 0, 1, 1,
-2.824217, 0.9710577, -0.7114823, 1, 0, 0, 1, 1,
-2.442729, 1.526001, -1.112513, 1, 0, 0, 1, 1,
-2.408986, -1.53572, -2.392014, 1, 0, 0, 1, 1,
-2.359946, -0.9736831, -1.735469, 0, 0, 0, 1, 1,
-2.264459, 0.3476222, -1.438673, 0, 0, 0, 1, 1,
-2.26329, -0.7003987, -3.271971, 0, 0, 0, 1, 1,
-2.225036, -0.3079144, -3.083762, 0, 0, 0, 1, 1,
-2.219106, 0.3805317, -1.600182, 0, 0, 0, 1, 1,
-2.215394, -1.706856, -3.143726, 0, 0, 0, 1, 1,
-2.192449, -1.013947, -0.7826381, 0, 0, 0, 1, 1,
-2.147694, 0.001573306, -2.375724, 1, 1, 1, 1, 1,
-2.072882, -1.646424, -3.045232, 1, 1, 1, 1, 1,
-2.063414, -0.5834122, -1.546813, 1, 1, 1, 1, 1,
-2.028028, 1.787429, -0.7095219, 1, 1, 1, 1, 1,
-2.024761, -0.3031246, -2.156744, 1, 1, 1, 1, 1,
-2.011483, -0.7441044, -1.300673, 1, 1, 1, 1, 1,
-2.009835, -0.988072, -2.055825, 1, 1, 1, 1, 1,
-2.009595, -1.363897, -0.6459589, 1, 1, 1, 1, 1,
-2.005594, 0.1063702, -3.303984, 1, 1, 1, 1, 1,
-1.96697, 0.2997878, -3.179077, 1, 1, 1, 1, 1,
-1.956311, -1.761445, -0.9365248, 1, 1, 1, 1, 1,
-1.948318, 0.5660969, -1.807186, 1, 1, 1, 1, 1,
-1.94527, 0.7907843, -1.673483, 1, 1, 1, 1, 1,
-1.937562, 0.03457624, -2.416397, 1, 1, 1, 1, 1,
-1.914344, -0.2950937, -1.798248, 1, 1, 1, 1, 1,
-1.903592, -0.1386839, -2.135023, 0, 0, 1, 1, 1,
-1.89224, -0.2360194, 0.4368477, 1, 0, 0, 1, 1,
-1.858731, -1.3111, -2.082904, 1, 0, 0, 1, 1,
-1.854876, 0.5659848, -2.170214, 1, 0, 0, 1, 1,
-1.835214, -0.02401315, -1.859824, 1, 0, 0, 1, 1,
-1.833548, 0.3596728, -1.902876, 1, 0, 0, 1, 1,
-1.825791, 1.226972, -2.436293, 0, 0, 0, 1, 1,
-1.82359, 0.7338251, -0.4831701, 0, 0, 0, 1, 1,
-1.810962, 1.425853, 0.09914681, 0, 0, 0, 1, 1,
-1.797455, -0.1736809, -2.687935, 0, 0, 0, 1, 1,
-1.783126, -0.4697041, -0.9170216, 0, 0, 0, 1, 1,
-1.760786, 0.03585724, -1.344269, 0, 0, 0, 1, 1,
-1.755371, -0.04070527, -0.5685346, 0, 0, 0, 1, 1,
-1.723856, -1.774508, -1.639173, 1, 1, 1, 1, 1,
-1.716127, 1.129779, -2.365285, 1, 1, 1, 1, 1,
-1.685784, -0.5252939, -2.70688, 1, 1, 1, 1, 1,
-1.68433, 0.2927215, -1.548336, 1, 1, 1, 1, 1,
-1.672, -1.121114, -1.754172, 1, 1, 1, 1, 1,
-1.645763, -0.9411669, -1.75935, 1, 1, 1, 1, 1,
-1.644263, -1.916589, -2.933329, 1, 1, 1, 1, 1,
-1.637854, -0.6832497, -3.65135, 1, 1, 1, 1, 1,
-1.624982, -1.661037, -2.59761, 1, 1, 1, 1, 1,
-1.624802, 0.5730532, -0.880425, 1, 1, 1, 1, 1,
-1.596887, 0.3650388, -2.052936, 1, 1, 1, 1, 1,
-1.588943, -2.129837, -4.572154, 1, 1, 1, 1, 1,
-1.588394, -0.1831116, -1.023685, 1, 1, 1, 1, 1,
-1.583807, -0.7960368, -0.9556365, 1, 1, 1, 1, 1,
-1.554203, -0.5792397, -2.275052, 1, 1, 1, 1, 1,
-1.551869, -0.3924466, -0.8929875, 0, 0, 1, 1, 1,
-1.549774, 2.130005, -0.4413024, 1, 0, 0, 1, 1,
-1.544179, -0.525569, -0.01916639, 1, 0, 0, 1, 1,
-1.541531, -0.1039016, -2.748842, 1, 0, 0, 1, 1,
-1.535698, 0.2409976, -1.71259, 1, 0, 0, 1, 1,
-1.523166, 0.6250656, -0.3809672, 1, 0, 0, 1, 1,
-1.518413, -1.066178, -3.065463, 0, 0, 0, 1, 1,
-1.505893, 0.7542066, -0.09045716, 0, 0, 0, 1, 1,
-1.503283, -1.939842, -2.163335, 0, 0, 0, 1, 1,
-1.481805, 0.8486156, -1.48024, 0, 0, 0, 1, 1,
-1.474809, 0.5629997, -0.6309075, 0, 0, 0, 1, 1,
-1.470587, -1.55334, -2.601759, 0, 0, 0, 1, 1,
-1.466505, -0.2302833, -3.333682, 0, 0, 0, 1, 1,
-1.458121, -0.05403834, -1.554539, 1, 1, 1, 1, 1,
-1.456261, 0.07077298, -2.093737, 1, 1, 1, 1, 1,
-1.453686, 0.4970011, -2.360034, 1, 1, 1, 1, 1,
-1.452647, -0.1030514, -0.634994, 1, 1, 1, 1, 1,
-1.446977, -0.7854975, -0.0207875, 1, 1, 1, 1, 1,
-1.444833, -1.433239, -1.949891, 1, 1, 1, 1, 1,
-1.43722, -0.1461754, -2.01757, 1, 1, 1, 1, 1,
-1.43645, 2.353903, -0.3360189, 1, 1, 1, 1, 1,
-1.42537, -0.4301619, -1.151917, 1, 1, 1, 1, 1,
-1.412018, 1.018288, 0.09609498, 1, 1, 1, 1, 1,
-1.395655, -0.9545742, -3.396192, 1, 1, 1, 1, 1,
-1.393324, 0.4067399, -1.94596, 1, 1, 1, 1, 1,
-1.387254, -0.4245066, -2.523353, 1, 1, 1, 1, 1,
-1.350719, -0.3703821, 0.3044688, 1, 1, 1, 1, 1,
-1.349396, 0.9340804, -0.5215503, 1, 1, 1, 1, 1,
-1.349043, -0.1971967, 0.7016948, 0, 0, 1, 1, 1,
-1.346208, 0.5448155, -2.788171, 1, 0, 0, 1, 1,
-1.339675, -0.2413085, -1.04645, 1, 0, 0, 1, 1,
-1.334256, 0.3922722, -1.281501, 1, 0, 0, 1, 1,
-1.32597, -1.907296, -5.546244, 1, 0, 0, 1, 1,
-1.322415, 0.04054321, -1.060342, 1, 0, 0, 1, 1,
-1.31679, -3.020854, -3.151485, 0, 0, 0, 1, 1,
-1.311708, 1.9865, -2.091763, 0, 0, 0, 1, 1,
-1.304811, -0.506844, -0.4814894, 0, 0, 0, 1, 1,
-1.304036, 0.5716561, -1.06824, 0, 0, 0, 1, 1,
-1.300169, 0.6380854, 0.3198256, 0, 0, 0, 1, 1,
-1.290643, -0.7595152, -2.450506, 0, 0, 0, 1, 1,
-1.289307, 0.7353444, -0.1005626, 0, 0, 0, 1, 1,
-1.289268, -1.750263, -2.197738, 1, 1, 1, 1, 1,
-1.287329, 0.6603258, -0.83484, 1, 1, 1, 1, 1,
-1.283507, -0.09764769, -1.227967, 1, 1, 1, 1, 1,
-1.282631, -1.224797, -2.331235, 1, 1, 1, 1, 1,
-1.264845, 1.181233, -2.258486, 1, 1, 1, 1, 1,
-1.256209, 0.6254328, -1.373342, 1, 1, 1, 1, 1,
-1.251844, 1.265244, -1.955195, 1, 1, 1, 1, 1,
-1.242742, -0.7578341, -2.635334, 1, 1, 1, 1, 1,
-1.232987, 0.7471645, 0.2830626, 1, 1, 1, 1, 1,
-1.226095, -0.7832142, -2.337619, 1, 1, 1, 1, 1,
-1.223193, 0.01184295, -1.189867, 1, 1, 1, 1, 1,
-1.219052, -1.240893, -2.778792, 1, 1, 1, 1, 1,
-1.210208, 0.2181542, -1.078501, 1, 1, 1, 1, 1,
-1.203327, 1.505192, -0.6417385, 1, 1, 1, 1, 1,
-1.201808, 1.356604, 0.9044898, 1, 1, 1, 1, 1,
-1.198879, 0.4450393, -1.525881, 0, 0, 1, 1, 1,
-1.195771, 1.710065, -1.091853, 1, 0, 0, 1, 1,
-1.195699, 0.3722222, -2.677257, 1, 0, 0, 1, 1,
-1.191428, 0.7358594, -3.995791, 1, 0, 0, 1, 1,
-1.187973, -0.1046302, -2.283128, 1, 0, 0, 1, 1,
-1.184142, 1.694729, 0.06957878, 1, 0, 0, 1, 1,
-1.183443, -0.4818113, -0.06144568, 0, 0, 0, 1, 1,
-1.160676, -0.3547884, -0.6789451, 0, 0, 0, 1, 1,
-1.157968, 0.2232099, -1.298606, 0, 0, 0, 1, 1,
-1.157963, 0.006329151, -2.892001, 0, 0, 0, 1, 1,
-1.157879, 0.01718926, -2.730787, 0, 0, 0, 1, 1,
-1.151506, 0.3957783, -1.30829, 0, 0, 0, 1, 1,
-1.1512, -0.08690815, -0.3801697, 0, 0, 0, 1, 1,
-1.142116, -0.7759922, -2.429872, 1, 1, 1, 1, 1,
-1.134871, 0.5598391, -0.3936355, 1, 1, 1, 1, 1,
-1.13239, 0.1933155, -0.2104222, 1, 1, 1, 1, 1,
-1.128489, -1.861074, -1.896832, 1, 1, 1, 1, 1,
-1.125063, 0.02818586, -0.8391489, 1, 1, 1, 1, 1,
-1.121872, 1.180497, -2.239293, 1, 1, 1, 1, 1,
-1.118758, 0.6980242, 0.05390073, 1, 1, 1, 1, 1,
-1.106043, -0.4299279, -2.378671, 1, 1, 1, 1, 1,
-1.097721, 0.69783, -1.516747, 1, 1, 1, 1, 1,
-1.084286, -1.694115, -3.586641, 1, 1, 1, 1, 1,
-1.081778, 0.2260713, -2.362288, 1, 1, 1, 1, 1,
-1.080015, -1.004946, -3.638205, 1, 1, 1, 1, 1,
-1.076877, 0.2435925, -0.5504931, 1, 1, 1, 1, 1,
-1.072971, 0.3468259, -2.017954, 1, 1, 1, 1, 1,
-1.070315, 1.443329, -1.264488, 1, 1, 1, 1, 1,
-1.066177, 0.7989403, -1.586424, 0, 0, 1, 1, 1,
-1.06373, -0.0425988, -4.089336, 1, 0, 0, 1, 1,
-1.060042, 0.2327826, -1.665837, 1, 0, 0, 1, 1,
-1.059753, 0.4589794, -2.250702, 1, 0, 0, 1, 1,
-1.050494, 0.3456847, 0.1588066, 1, 0, 0, 1, 1,
-1.044624, 0.5986083, -0.9207042, 1, 0, 0, 1, 1,
-1.041389, 0.08807253, -2.9123, 0, 0, 0, 1, 1,
-1.03713, -2.29646, -0.440184, 0, 0, 0, 1, 1,
-1.0363, 0.8737889, -0.4887734, 0, 0, 0, 1, 1,
-1.02212, -0.5969019, -0.7174436, 0, 0, 0, 1, 1,
-1.001739, 0.3430977, -0.5173201, 0, 0, 0, 1, 1,
-0.9904194, -1.646848, -3.246485, 0, 0, 0, 1, 1,
-0.9843043, -0.584489, -4.451748, 0, 0, 0, 1, 1,
-0.9832827, 1.428896, -1.655887, 1, 1, 1, 1, 1,
-0.9832786, 0.8955972, -0.362367, 1, 1, 1, 1, 1,
-0.9822611, 0.04074139, -1.669443, 1, 1, 1, 1, 1,
-0.966692, 0.5396028, -0.952738, 1, 1, 1, 1, 1,
-0.9666399, 0.2256421, -2.106283, 1, 1, 1, 1, 1,
-0.9497831, 0.4707237, -0.722859, 1, 1, 1, 1, 1,
-0.9492915, 0.1609878, -3.201015, 1, 1, 1, 1, 1,
-0.9421222, 0.9417072, -0.8834326, 1, 1, 1, 1, 1,
-0.9350969, 1.189096, 0.2051982, 1, 1, 1, 1, 1,
-0.9347454, -0.5657694, -1.672379, 1, 1, 1, 1, 1,
-0.9265821, -0.9550147, -3.933557, 1, 1, 1, 1, 1,
-0.9265307, 0.3047949, -1.146711, 1, 1, 1, 1, 1,
-0.923435, -0.1244031, -2.021143, 1, 1, 1, 1, 1,
-0.914698, 0.7943098, -0.5424046, 1, 1, 1, 1, 1,
-0.9142972, 0.3274354, -1.994055, 1, 1, 1, 1, 1,
-0.9083706, 0.005297906, -1.373102, 0, 0, 1, 1, 1,
-0.9014774, 0.8852144, -1.569326, 1, 0, 0, 1, 1,
-0.8905641, 0.2932266, -1.465392, 1, 0, 0, 1, 1,
-0.8898456, -0.7225245, -3.316575, 1, 0, 0, 1, 1,
-0.8892949, -0.9034175, -1.805822, 1, 0, 0, 1, 1,
-0.8887966, 0.6998662, -1.754226, 1, 0, 0, 1, 1,
-0.8862182, -0.5288411, -0.6135663, 0, 0, 0, 1, 1,
-0.8848968, 1.191221, -1.010511, 0, 0, 0, 1, 1,
-0.8831413, -0.8054135, -1.910849, 0, 0, 0, 1, 1,
-0.8692637, -0.3117261, -1.19643, 0, 0, 0, 1, 1,
-0.8680662, 0.6121486, -1.022386, 0, 0, 0, 1, 1,
-0.8659809, 0.8655416, -2.770351, 0, 0, 0, 1, 1,
-0.8634018, -0.835926, -0.740997, 0, 0, 0, 1, 1,
-0.8569427, 1.260112, -0.2260986, 1, 1, 1, 1, 1,
-0.8473883, -0.5994748, -1.984367, 1, 1, 1, 1, 1,
-0.8374401, -0.09294539, -4.442354, 1, 1, 1, 1, 1,
-0.8273022, 0.1471328, -0.6692436, 1, 1, 1, 1, 1,
-0.8240152, -1.318289, -2.74007, 1, 1, 1, 1, 1,
-0.8216457, -1.277321, -1.878472, 1, 1, 1, 1, 1,
-0.8207473, 0.530488, -2.290019, 1, 1, 1, 1, 1,
-0.8182801, -1.317925, -3.548341, 1, 1, 1, 1, 1,
-0.8164303, -0.6152096, -1.985751, 1, 1, 1, 1, 1,
-0.8152087, 0.9967627, 0.819757, 1, 1, 1, 1, 1,
-0.813441, 0.2113349, -0.3016298, 1, 1, 1, 1, 1,
-0.8130749, 0.8263689, 0.2898812, 1, 1, 1, 1, 1,
-0.8102982, -0.08958697, -0.6992625, 1, 1, 1, 1, 1,
-0.8080463, 1.702727, 0.7215283, 1, 1, 1, 1, 1,
-0.8037415, 0.9429336, -0.3169967, 1, 1, 1, 1, 1,
-0.8029801, 0.8505487, -1.38279, 0, 0, 1, 1, 1,
-0.802363, 0.4150608, -1.38651, 1, 0, 0, 1, 1,
-0.7998846, -0.6802027, -0.5015065, 1, 0, 0, 1, 1,
-0.7917982, -1.190074, -2.279102, 1, 0, 0, 1, 1,
-0.7848392, 1.006882, -1.232683, 1, 0, 0, 1, 1,
-0.7837593, -2.664759, -2.128099, 1, 0, 0, 1, 1,
-0.7805802, 1.632091, 0.7604302, 0, 0, 0, 1, 1,
-0.7800741, 1.08067, -0.868682, 0, 0, 0, 1, 1,
-0.779594, 0.2399765, -0.8843533, 0, 0, 0, 1, 1,
-0.7791628, -0.3027377, -0.9130599, 0, 0, 0, 1, 1,
-0.7762207, 0.6368999, -1.76765, 0, 0, 0, 1, 1,
-0.7676799, -1.225018, -3.72756, 0, 0, 0, 1, 1,
-0.766856, -0.322966, -1.667695, 0, 0, 0, 1, 1,
-0.7559531, -1.205684, -2.612496, 1, 1, 1, 1, 1,
-0.7461451, -1.029673, -1.932327, 1, 1, 1, 1, 1,
-0.7401469, 1.878552, -1.643691, 1, 1, 1, 1, 1,
-0.7360577, -0.8666747, -2.477072, 1, 1, 1, 1, 1,
-0.7352752, -0.9770067, -2.153667, 1, 1, 1, 1, 1,
-0.734532, -0.3806147, -1.397586, 1, 1, 1, 1, 1,
-0.7251676, -0.1796399, -1.198008, 1, 1, 1, 1, 1,
-0.7182272, -0.1374397, -1.425738, 1, 1, 1, 1, 1,
-0.7172241, 0.6046358, -1.978247, 1, 1, 1, 1, 1,
-0.7166274, -1.04365, -2.355151, 1, 1, 1, 1, 1,
-0.7143383, 0.1042788, -2.375964, 1, 1, 1, 1, 1,
-0.7082039, 0.4739429, -1.237623, 1, 1, 1, 1, 1,
-0.7067616, 1.341356, -0.7170996, 1, 1, 1, 1, 1,
-0.7065771, 0.5504951, -0.9318823, 1, 1, 1, 1, 1,
-0.7049782, -0.02129234, -2.130765, 1, 1, 1, 1, 1,
-0.7038762, -0.7779118, -2.683471, 0, 0, 1, 1, 1,
-0.6987307, -0.9713658, -1.928692, 1, 0, 0, 1, 1,
-0.6985741, -2.474859, -2.031017, 1, 0, 0, 1, 1,
-0.6975134, -2.444494, -2.999286, 1, 0, 0, 1, 1,
-0.6936086, 0.6864328, 0.8526744, 1, 0, 0, 1, 1,
-0.6928939, -0.2559617, -0.7398867, 1, 0, 0, 1, 1,
-0.690116, 0.7144668, -0.2927299, 0, 0, 0, 1, 1,
-0.6751068, -0.01227401, -1.78242, 0, 0, 0, 1, 1,
-0.6742038, 0.61975, -0.7013391, 0, 0, 0, 1, 1,
-0.6736621, -0.1650997, -2.54235, 0, 0, 0, 1, 1,
-0.6714798, -1.072562, -2.689482, 0, 0, 0, 1, 1,
-0.6708372, 2.878564, -0.7954547, 0, 0, 0, 1, 1,
-0.6700746, 0.781768, -2.042033, 0, 0, 0, 1, 1,
-0.6599059, 1.143059, -1.849126, 1, 1, 1, 1, 1,
-0.6588224, -0.3763029, -0.5381265, 1, 1, 1, 1, 1,
-0.655566, -0.0512278, -0.8779342, 1, 1, 1, 1, 1,
-0.653107, -0.4081413, -1.331695, 1, 1, 1, 1, 1,
-0.6507676, -0.03592057, -0.6564482, 1, 1, 1, 1, 1,
-0.6500118, -1.011514, -1.176122, 1, 1, 1, 1, 1,
-0.6468794, 2.133922, -1.676793, 1, 1, 1, 1, 1,
-0.6398411, -1.264518, -2.914762, 1, 1, 1, 1, 1,
-0.6226851, 0.8278219, -1.794015, 1, 1, 1, 1, 1,
-0.6107764, 0.1232172, -3.731575, 1, 1, 1, 1, 1,
-0.6083955, -1.12885, -2.63214, 1, 1, 1, 1, 1,
-0.6078466, 0.1509209, -1.404021, 1, 1, 1, 1, 1,
-0.60633, -0.8437238, -1.510721, 1, 1, 1, 1, 1,
-0.6036078, -0.1558543, -0.2367121, 1, 1, 1, 1, 1,
-0.5995419, -1.524189, -2.358965, 1, 1, 1, 1, 1,
-0.5994527, 0.1955226, 1.159377, 0, 0, 1, 1, 1,
-0.5978327, -2.32974, -1.547522, 1, 0, 0, 1, 1,
-0.5914345, -0.7266744, -2.479692, 1, 0, 0, 1, 1,
-0.5873047, 0.9572843, -1.281668, 1, 0, 0, 1, 1,
-0.5843351, 0.9003125, -1.689348, 1, 0, 0, 1, 1,
-0.5838295, -1.558928, -3.062518, 1, 0, 0, 1, 1,
-0.5834562, 0.988054, 1.432161, 0, 0, 0, 1, 1,
-0.5819079, -1.040845, -1.695919, 0, 0, 0, 1, 1,
-0.5762923, -0.4850545, -2.592653, 0, 0, 0, 1, 1,
-0.5692147, 2.103898, 0.3230072, 0, 0, 0, 1, 1,
-0.5640835, -1.285888, -3.33825, 0, 0, 0, 1, 1,
-0.5612996, 0.6331207, -0.02506383, 0, 0, 0, 1, 1,
-0.5552687, 0.2814873, -3.022618, 0, 0, 0, 1, 1,
-0.5536103, 0.6205384, -0.1352496, 1, 1, 1, 1, 1,
-0.5527282, 0.05036281, -2.421309, 1, 1, 1, 1, 1,
-0.5521762, -0.7748258, 0.5671583, 1, 1, 1, 1, 1,
-0.5508519, 0.7280908, -0.00185087, 1, 1, 1, 1, 1,
-0.5503503, 0.5862517, -1.494856, 1, 1, 1, 1, 1,
-0.5494584, -0.4380673, -2.27573, 1, 1, 1, 1, 1,
-0.5325232, -1.349373, -1.41562, 1, 1, 1, 1, 1,
-0.5274315, 1.496745, -1.844128, 1, 1, 1, 1, 1,
-0.5256735, -1.440831, -2.499876, 1, 1, 1, 1, 1,
-0.5191272, 2.374391, -0.549402, 1, 1, 1, 1, 1,
-0.5153956, 0.03901485, 0.9529666, 1, 1, 1, 1, 1,
-0.5125132, -0.1043696, -3.463055, 1, 1, 1, 1, 1,
-0.5084168, 0.003347828, -2.140761, 1, 1, 1, 1, 1,
-0.5075959, 0.4178261, -1.229835, 1, 1, 1, 1, 1,
-0.5054923, 1.74816, 0.9241056, 1, 1, 1, 1, 1,
-0.5013411, 0.8511622, -1.466961, 0, 0, 1, 1, 1,
-0.5008949, -0.04146908, -3.530792, 1, 0, 0, 1, 1,
-0.4984467, -0.6330924, -1.73457, 1, 0, 0, 1, 1,
-0.4956953, -0.6251746, -1.190913, 1, 0, 0, 1, 1,
-0.4933915, 0.5822335, 0.9443602, 1, 0, 0, 1, 1,
-0.4930356, -0.8959203, -2.567406, 1, 0, 0, 1, 1,
-0.4897979, 1.481158, -1.665417, 0, 0, 0, 1, 1,
-0.4886914, -0.0901842, -3.126224, 0, 0, 0, 1, 1,
-0.4873441, 0.4302965, -1.18172, 0, 0, 0, 1, 1,
-0.4790353, 0.3336401, -1.092653, 0, 0, 0, 1, 1,
-0.4766275, 1.594649, -1.77628, 0, 0, 0, 1, 1,
-0.4751193, 0.9254781, -0.4915549, 0, 0, 0, 1, 1,
-0.4749857, 0.2811641, 0.9188435, 0, 0, 0, 1, 1,
-0.4707054, -1.173336, -2.985595, 1, 1, 1, 1, 1,
-0.4705533, -1.572002, -2.654667, 1, 1, 1, 1, 1,
-0.4676419, -0.6715792, -1.323627, 1, 1, 1, 1, 1,
-0.4597391, -2.899093, -1.25807, 1, 1, 1, 1, 1,
-0.4581188, 0.594087, -0.5796, 1, 1, 1, 1, 1,
-0.4548305, 1.167824, -0.08206801, 1, 1, 1, 1, 1,
-0.4414733, 1.167698, 0.6473238, 1, 1, 1, 1, 1,
-0.4340625, -0.4340068, -0.5413127, 1, 1, 1, 1, 1,
-0.4339476, -0.7153711, -4.652809, 1, 1, 1, 1, 1,
-0.432103, -0.2642833, -2.35748, 1, 1, 1, 1, 1,
-0.4308313, 0.7709181, 1.255656, 1, 1, 1, 1, 1,
-0.4306539, -2.03865, -2.407716, 1, 1, 1, 1, 1,
-0.4276391, -0.8461733, -0.8065561, 1, 1, 1, 1, 1,
-0.4226123, 0.1222195, -1.252711, 1, 1, 1, 1, 1,
-0.4168566, 0.776244, 0.7709175, 1, 1, 1, 1, 1,
-0.4138235, -0.438126, -1.511883, 0, 0, 1, 1, 1,
-0.4060116, -0.295324, -3.133596, 1, 0, 0, 1, 1,
-0.4031744, 1.432368, -1.23463, 1, 0, 0, 1, 1,
-0.4005029, 0.4355921, -1.177752, 1, 0, 0, 1, 1,
-0.3990419, 1.251534, -0.789216, 1, 0, 0, 1, 1,
-0.398779, -1.739535, -2.659802, 1, 0, 0, 1, 1,
-0.3962754, -1.052375, -4.468686, 0, 0, 0, 1, 1,
-0.3955854, 1.321184, 1.03304, 0, 0, 0, 1, 1,
-0.3878759, -0.03479611, -2.03999, 0, 0, 0, 1, 1,
-0.3851596, 0.4534749, -1.37921, 0, 0, 0, 1, 1,
-0.3825403, -0.5003412, -1.722481, 0, 0, 0, 1, 1,
-0.3814999, 0.2160803, -0.4830411, 0, 0, 0, 1, 1,
-0.3760744, 0.5070259, -0.1451112, 0, 0, 0, 1, 1,
-0.3758439, 0.2827537, -1.931655, 1, 1, 1, 1, 1,
-0.3723242, 0.37449, 0.7583049, 1, 1, 1, 1, 1,
-0.3701048, 1.202767, 2.558602, 1, 1, 1, 1, 1,
-0.3680204, 0.4398765, -1.718158, 1, 1, 1, 1, 1,
-0.3675172, 1.312512, -1.206425, 1, 1, 1, 1, 1,
-0.3654518, -1.711716, -2.171404, 1, 1, 1, 1, 1,
-0.3650585, 1.463108, -1.226518, 1, 1, 1, 1, 1,
-0.3646393, 1.178404, -2.166908, 1, 1, 1, 1, 1,
-0.3644781, 0.2935478, -0.7826418, 1, 1, 1, 1, 1,
-0.3610591, 0.1624577, -1.470835, 1, 1, 1, 1, 1,
-0.3598047, -0.1934101, -3.400504, 1, 1, 1, 1, 1,
-0.3572046, 0.0519655, 0.08810454, 1, 1, 1, 1, 1,
-0.351929, -0.3455364, -1.858557, 1, 1, 1, 1, 1,
-0.351795, -0.09499921, -0.99906, 1, 1, 1, 1, 1,
-0.3493217, 0.2252272, -2.026235, 1, 1, 1, 1, 1,
-0.3480848, 0.08332406, -4.535588, 0, 0, 1, 1, 1,
-0.3459709, -1.068978, -2.842366, 1, 0, 0, 1, 1,
-0.3454858, 0.6632116, 0.1725961, 1, 0, 0, 1, 1,
-0.3431972, -0.8861145, -2.937251, 1, 0, 0, 1, 1,
-0.3409374, 0.8360589, -0.4860227, 1, 0, 0, 1, 1,
-0.3365814, -0.6152954, -1.795954, 1, 0, 0, 1, 1,
-0.3328163, 0.4508688, 0.4674831, 0, 0, 0, 1, 1,
-0.332132, -1.142945, -3.495087, 0, 0, 0, 1, 1,
-0.329731, -0.4960994, -1.064348, 0, 0, 0, 1, 1,
-0.3231198, 1.595138, -0.6620758, 0, 0, 0, 1, 1,
-0.3230081, 0.8119907, 1.877479, 0, 0, 0, 1, 1,
-0.3164411, 0.07769933, -1.072876, 0, 0, 0, 1, 1,
-0.3087585, 0.2025821, -1.256541, 0, 0, 0, 1, 1,
-0.3065276, 0.08120672, -0.09754223, 1, 1, 1, 1, 1,
-0.2993174, -1.854016, -2.86145, 1, 1, 1, 1, 1,
-0.2955731, -0.2502705, -2.200059, 1, 1, 1, 1, 1,
-0.2954958, -0.2918549, -2.20296, 1, 1, 1, 1, 1,
-0.2954361, 0.7991605, -1.737154, 1, 1, 1, 1, 1,
-0.293586, -0.8427877, -3.663619, 1, 1, 1, 1, 1,
-0.2932632, 0.3718965, 1.014088, 1, 1, 1, 1, 1,
-0.2925053, 0.8905604, 0.9949631, 1, 1, 1, 1, 1,
-0.2893555, 1.707006, 0.981071, 1, 1, 1, 1, 1,
-0.2870645, 0.003163236, -1.404473, 1, 1, 1, 1, 1,
-0.2798418, -1.301515, -1.942835, 1, 1, 1, 1, 1,
-0.2770798, 1.442999, 0.1881633, 1, 1, 1, 1, 1,
-0.2758774, -0.6307925, -3.527425, 1, 1, 1, 1, 1,
-0.2748591, -0.9246092, -3.16574, 1, 1, 1, 1, 1,
-0.2735917, -1.50206, -3.521454, 1, 1, 1, 1, 1,
-0.2717285, 0.2228757, -1.355407, 0, 0, 1, 1, 1,
-0.2701458, 0.2201448, -0.7266539, 1, 0, 0, 1, 1,
-0.2685004, -0.7079515, -1.942323, 1, 0, 0, 1, 1,
-0.2657422, 0.01730969, -2.601976, 1, 0, 0, 1, 1,
-0.2636362, -0.0141933, -2.320866, 1, 0, 0, 1, 1,
-0.2632633, 2.332115, -0.1919952, 1, 0, 0, 1, 1,
-0.2616232, 2.037179, -0.9710991, 0, 0, 0, 1, 1,
-0.2575566, 0.1207116, 0.05636581, 0, 0, 0, 1, 1,
-0.2567576, 0.7033731, 0.6011706, 0, 0, 0, 1, 1,
-0.2546918, 0.2861501, -0.8398901, 0, 0, 0, 1, 1,
-0.2534151, -0.8747622, -3.902342, 0, 0, 0, 1, 1,
-0.2520628, -0.7373174, -3.446533, 0, 0, 0, 1, 1,
-0.2514822, 0.5578819, -2.14461, 0, 0, 0, 1, 1,
-0.2510413, -0.4290032, -2.409911, 1, 1, 1, 1, 1,
-0.2494701, 1.248327, 1.896544, 1, 1, 1, 1, 1,
-0.2476639, -0.4186261, -1.660829, 1, 1, 1, 1, 1,
-0.2462439, -0.3956074, -1.959581, 1, 1, 1, 1, 1,
-0.2430738, -0.4368525, -3.349265, 1, 1, 1, 1, 1,
-0.2419203, 1.236311, 0.3150599, 1, 1, 1, 1, 1,
-0.2415233, 0.06703167, -1.899598, 1, 1, 1, 1, 1,
-0.2409462, 0.5880603, 1.232557, 1, 1, 1, 1, 1,
-0.2397497, -0.2504471, -0.6548188, 1, 1, 1, 1, 1,
-0.2390707, -0.5085239, -3.961656, 1, 1, 1, 1, 1,
-0.2341436, -1.562626, -3.661598, 1, 1, 1, 1, 1,
-0.231514, -0.6442918, -3.293449, 1, 1, 1, 1, 1,
-0.2293573, -0.5111045, -5.158226, 1, 1, 1, 1, 1,
-0.2242226, 0.2903027, -1.967689, 1, 1, 1, 1, 1,
-0.2233758, -1.346236, -4.343642, 1, 1, 1, 1, 1,
-0.2213798, -0.02939346, -2.432549, 0, 0, 1, 1, 1,
-0.2197556, -0.9594219, -3.994747, 1, 0, 0, 1, 1,
-0.2183462, -1.203441, -2.740285, 1, 0, 0, 1, 1,
-0.2175135, -0.2045254, -2.252218, 1, 0, 0, 1, 1,
-0.2168489, 0.5115185, -0.4003613, 1, 0, 0, 1, 1,
-0.2154845, -1.71049, -0.918927, 1, 0, 0, 1, 1,
-0.2149674, -0.1272149, -0.8116614, 0, 0, 0, 1, 1,
-0.2136285, 1.723687, 0.4021776, 0, 0, 0, 1, 1,
-0.2128971, -0.6188458, -3.204927, 0, 0, 0, 1, 1,
-0.2078954, 1.245518, 1.278635, 0, 0, 0, 1, 1,
-0.2065789, -0.9301153, -3.305596, 0, 0, 0, 1, 1,
-0.2061887, -0.7253821, -1.98624, 0, 0, 0, 1, 1,
-0.2029446, 0.2360385, -1.348265, 0, 0, 0, 1, 1,
-0.2027194, 0.2182124, 0.06235594, 1, 1, 1, 1, 1,
-0.1961785, 1.061655, 0.4427906, 1, 1, 1, 1, 1,
-0.1954392, -0.03669016, -1.241565, 1, 1, 1, 1, 1,
-0.1921, 0.6858917, 1.22823, 1, 1, 1, 1, 1,
-0.1884855, -1.288637, -2.770509, 1, 1, 1, 1, 1,
-0.1883514, 0.2061939, -0.902015, 1, 1, 1, 1, 1,
-0.1874362, 0.08570746, -1.17621, 1, 1, 1, 1, 1,
-0.1836895, -0.4146507, -2.981355, 1, 1, 1, 1, 1,
-0.1832256, -0.4470342, -2.140872, 1, 1, 1, 1, 1,
-0.1782601, 0.8073086, -0.7052072, 1, 1, 1, 1, 1,
-0.1765954, -0.3874907, -4.686781, 1, 1, 1, 1, 1,
-0.1752909, -0.0762981, -1.232414, 1, 1, 1, 1, 1,
-0.1732008, -1.483367, -4.444374, 1, 1, 1, 1, 1,
-0.169522, -0.702679, -3.324867, 1, 1, 1, 1, 1,
-0.169005, 1.273575, -0.8145128, 1, 1, 1, 1, 1,
-0.1673275, 0.8008856, -0.2671089, 0, 0, 1, 1, 1,
-0.1641159, 0.379195, -1.099611, 1, 0, 0, 1, 1,
-0.1605599, 0.5948001, 0.01504205, 1, 0, 0, 1, 1,
-0.1583237, 2.264081, 0.05952712, 1, 0, 0, 1, 1,
-0.1537569, 1.253723, 1.520795, 1, 0, 0, 1, 1,
-0.149322, -0.9633758, -3.364622, 1, 0, 0, 1, 1,
-0.1453477, -0.819172, -3.639556, 0, 0, 0, 1, 1,
-0.1450197, 0.7678529, 0.563618, 0, 0, 0, 1, 1,
-0.1428851, -0.3047541, -2.898845, 0, 0, 0, 1, 1,
-0.1413021, -0.5282714, -2.987292, 0, 0, 0, 1, 1,
-0.1359573, -1.202658, -1.789687, 0, 0, 0, 1, 1,
-0.1353837, 1.668936, 0.1246448, 0, 0, 0, 1, 1,
-0.1342376, -0.04603745, -1.204037, 0, 0, 0, 1, 1,
-0.1310131, 0.6449102, -1.068852, 1, 1, 1, 1, 1,
-0.1294115, 0.1765658, -1.58922, 1, 1, 1, 1, 1,
-0.1290927, -1.340344, -2.221493, 1, 1, 1, 1, 1,
-0.1277381, -0.3827924, -3.226364, 1, 1, 1, 1, 1,
-0.127548, 1.14788, 0.1389828, 1, 1, 1, 1, 1,
-0.1274775, 0.07531496, -1.975846, 1, 1, 1, 1, 1,
-0.1221292, -1.347994, -3.901887, 1, 1, 1, 1, 1,
-0.1166139, -0.5050194, -3.280171, 1, 1, 1, 1, 1,
-0.1144275, 1.774718, 0.3114714, 1, 1, 1, 1, 1,
-0.1030069, 1.543239, -1.542405, 1, 1, 1, 1, 1,
-0.1014569, 3.288209, 0.8278371, 1, 1, 1, 1, 1,
-0.1005598, 0.859895, 0.4006943, 1, 1, 1, 1, 1,
-0.09809632, -1.248353, -3.401554, 1, 1, 1, 1, 1,
-0.0947155, -1.333114, -2.814904, 1, 1, 1, 1, 1,
-0.09441248, 0.2413594, 0.07121475, 1, 1, 1, 1, 1,
-0.09392601, 1.525535, 0.165225, 0, 0, 1, 1, 1,
-0.09373527, -0.5426889, -2.040431, 1, 0, 0, 1, 1,
-0.09362121, -0.5707747, -2.687048, 1, 0, 0, 1, 1,
-0.09267682, -0.6258854, -1.090524, 1, 0, 0, 1, 1,
-0.09086735, -1.071215, -1.559502, 1, 0, 0, 1, 1,
-0.09048112, -0.1538548, -0.04050059, 1, 0, 0, 1, 1,
-0.08864406, -0.1776266, -2.530026, 0, 0, 0, 1, 1,
-0.08423822, 0.03019342, -1.072822, 0, 0, 0, 1, 1,
-0.07912888, -0.1953007, -3.459818, 0, 0, 0, 1, 1,
-0.07512984, -0.6147261, -2.091349, 0, 0, 0, 1, 1,
-0.07324567, -0.948141, -3.460272, 0, 0, 0, 1, 1,
-0.0728118, -0.09182673, -2.143751, 0, 0, 0, 1, 1,
-0.07207245, -0.2455072, -2.599124, 0, 0, 0, 1, 1,
-0.06573805, -1.529074, -3.83641, 1, 1, 1, 1, 1,
-0.06485899, -0.5679485, -1.094983, 1, 1, 1, 1, 1,
-0.06096356, 1.012571, -0.3996813, 1, 1, 1, 1, 1,
-0.05845206, 0.04031043, 0.3032922, 1, 1, 1, 1, 1,
-0.05738803, -0.3565007, -2.714684, 1, 1, 1, 1, 1,
-0.04821713, -0.6795986, -2.920355, 1, 1, 1, 1, 1,
-0.04775723, -2.261456, -2.331334, 1, 1, 1, 1, 1,
-0.04680153, -1.661294, -3.152497, 1, 1, 1, 1, 1,
-0.0467043, 0.0959966, -2.523622, 1, 1, 1, 1, 1,
-0.04464411, -0.216168, -4.670169, 1, 1, 1, 1, 1,
-0.0411846, -1.644337, -3.306994, 1, 1, 1, 1, 1,
-0.03667939, 1.448237, 0.9647533, 1, 1, 1, 1, 1,
-0.03503223, 0.5695853, 1.521715, 1, 1, 1, 1, 1,
-0.02862038, -0.3629276, -2.920064, 1, 1, 1, 1, 1,
-0.02557822, -0.3307932, -3.365607, 1, 1, 1, 1, 1,
-0.02489136, -0.3998028, -4.588613, 0, 0, 1, 1, 1,
-0.02157262, 1.142283, 0.7952828, 1, 0, 0, 1, 1,
-0.01789318, -0.4826284, -4.322012, 1, 0, 0, 1, 1,
-0.01131935, 0.3316615, -0.2453672, 1, 0, 0, 1, 1,
-0.009340919, 0.9199659, -1.169345, 1, 0, 0, 1, 1,
-0.00401078, -0.6369209, -3.543902, 1, 0, 0, 1, 1,
0.002327499, 0.9219794, 0.583694, 0, 0, 0, 1, 1,
0.005706377, -0.6307966, 2.892375, 0, 0, 0, 1, 1,
0.007942828, 0.6501427, 0.3291534, 0, 0, 0, 1, 1,
0.01022309, 0.6783271, -0.4119598, 0, 0, 0, 1, 1,
0.01179186, -0.5368608, 3.146505, 0, 0, 0, 1, 1,
0.01432277, 0.1776498, -0.2901566, 0, 0, 0, 1, 1,
0.01612399, -1.758814, 3.488314, 0, 0, 0, 1, 1,
0.02396479, -1.018716, 1.472354, 1, 1, 1, 1, 1,
0.02524839, 2.336708, -0.2361068, 1, 1, 1, 1, 1,
0.02549344, 1.068144, 1.127945, 1, 1, 1, 1, 1,
0.02688722, -0.01980715, 3.52897, 1, 1, 1, 1, 1,
0.0272757, 0.2007095, 0.4085003, 1, 1, 1, 1, 1,
0.0306302, 0.9190344, -1.103202, 1, 1, 1, 1, 1,
0.03507029, -0.5438417, 1.403833, 1, 1, 1, 1, 1,
0.03858258, 0.306434, 1.151885, 1, 1, 1, 1, 1,
0.04035244, -0.03383504, 2.03294, 1, 1, 1, 1, 1,
0.04448602, 2.787281, 0.9505887, 1, 1, 1, 1, 1,
0.04464902, 0.7315669, 0.05085612, 1, 1, 1, 1, 1,
0.04511334, 0.8796742, 0.5789424, 1, 1, 1, 1, 1,
0.04567666, -0.4531368, 3.598515, 1, 1, 1, 1, 1,
0.04616536, -0.7586672, 2.882576, 1, 1, 1, 1, 1,
0.05025056, -0.09198701, 1.024303, 1, 1, 1, 1, 1,
0.0506076, 1.722691, -0.190366, 0, 0, 1, 1, 1,
0.05281625, 0.5056692, 0.9838108, 1, 0, 0, 1, 1,
0.05502374, 0.05552294, 1.289416, 1, 0, 0, 1, 1,
0.05739523, -0.5290749, 2.675744, 1, 0, 0, 1, 1,
0.06099688, -0.1424639, 4.409944, 1, 0, 0, 1, 1,
0.06192205, -1.064934, 1.34684, 1, 0, 0, 1, 1,
0.06589834, -0.3528558, 2.112534, 0, 0, 0, 1, 1,
0.06718569, -1.895777, 2.335687, 0, 0, 0, 1, 1,
0.06797045, 1.066827, -1.079369, 0, 0, 0, 1, 1,
0.06850436, -0.630513, 3.107895, 0, 0, 0, 1, 1,
0.0691862, -0.5294275, 1.890628, 0, 0, 0, 1, 1,
0.07129858, -1.212523, 1.996053, 0, 0, 0, 1, 1,
0.07563762, -1.257287, 1.907295, 0, 0, 0, 1, 1,
0.07670802, 0.3499923, -0.9896183, 1, 1, 1, 1, 1,
0.07886411, -0.2476186, 2.442753, 1, 1, 1, 1, 1,
0.08052818, 1.470443, -0.3342499, 1, 1, 1, 1, 1,
0.08817906, 0.7057157, 1.30395, 1, 1, 1, 1, 1,
0.08909696, 0.1975254, 0.2064553, 1, 1, 1, 1, 1,
0.09257954, -0.6021416, 1.881004, 1, 1, 1, 1, 1,
0.09832237, -2.212688, 3.89359, 1, 1, 1, 1, 1,
0.1001017, -0.6895188, 2.732402, 1, 1, 1, 1, 1,
0.1028148, 0.1164139, -1.459614, 1, 1, 1, 1, 1,
0.1033666, -1.243207, 2.433126, 1, 1, 1, 1, 1,
0.1033719, 1.036981, 0.5157012, 1, 1, 1, 1, 1,
0.1061745, -0.1531374, 3.717884, 1, 1, 1, 1, 1,
0.1097917, -0.6511906, 3.474685, 1, 1, 1, 1, 1,
0.1149264, -0.1366616, 3.298602, 1, 1, 1, 1, 1,
0.1186392, -0.3141901, 2.387627, 1, 1, 1, 1, 1,
0.1220536, -0.4874407, 4.156318, 0, 0, 1, 1, 1,
0.130833, -0.2242643, 2.883979, 1, 0, 0, 1, 1,
0.1332897, 1.029978, -0.9501129, 1, 0, 0, 1, 1,
0.1334536, -0.4184092, 4.174004, 1, 0, 0, 1, 1,
0.1336209, -0.8370227, 2.843785, 1, 0, 0, 1, 1,
0.1367142, -0.1820284, 1.80677, 1, 0, 0, 1, 1,
0.1452023, 1.049004, 0.7704314, 0, 0, 0, 1, 1,
0.1454262, 0.005972142, 1.535128, 0, 0, 0, 1, 1,
0.148509, -0.2439826, 3.98372, 0, 0, 0, 1, 1,
0.1492147, 0.5407118, -0.1987314, 0, 0, 0, 1, 1,
0.1500126, 0.3412392, -0.06095012, 0, 0, 0, 1, 1,
0.1525642, -0.8633569, 3.890162, 0, 0, 0, 1, 1,
0.155406, -0.2173947, 2.018364, 0, 0, 0, 1, 1,
0.1562909, 0.9893799, 2.109972, 1, 1, 1, 1, 1,
0.1576823, 0.4311978, 0.4984048, 1, 1, 1, 1, 1,
0.1582995, 0.4440522, -0.0284615, 1, 1, 1, 1, 1,
0.1604679, -1.580603, 0.5600179, 1, 1, 1, 1, 1,
0.1625448, 0.6988642, 0.4637815, 1, 1, 1, 1, 1,
0.1634684, -1.359519, 1.408207, 1, 1, 1, 1, 1,
0.1637827, -0.5619212, 4.23991, 1, 1, 1, 1, 1,
0.1641687, 0.3527743, 1.10173, 1, 1, 1, 1, 1,
0.1746651, 0.2300203, 0.3176139, 1, 1, 1, 1, 1,
0.1789177, 0.5666937, -0.5869403, 1, 1, 1, 1, 1,
0.1796128, 0.9212177, 1.120446, 1, 1, 1, 1, 1,
0.1797548, 1.317001, 1.205439, 1, 1, 1, 1, 1,
0.1833453, -0.5391159, 1.44595, 1, 1, 1, 1, 1,
0.1848233, 1.136292, -0.324675, 1, 1, 1, 1, 1,
0.1969285, -0.5709515, 2.22014, 1, 1, 1, 1, 1,
0.1974894, -1.508543, 2.704475, 0, 0, 1, 1, 1,
0.2023189, 1.299517, 0.6901907, 1, 0, 0, 1, 1,
0.2029749, -1.420244, 3.496162, 1, 0, 0, 1, 1,
0.2052464, -0.3802925, 3.271559, 1, 0, 0, 1, 1,
0.2095691, 0.1130265, 2.545668, 1, 0, 0, 1, 1,
0.2148166, -0.8128513, 3.516311, 1, 0, 0, 1, 1,
0.2155517, 0.1660765, 2.298585, 0, 0, 0, 1, 1,
0.2161826, 0.3154383, 0.9196238, 0, 0, 0, 1, 1,
0.2196417, -0.6568758, 2.002825, 0, 0, 0, 1, 1,
0.2206795, -0.5839077, 2.162471, 0, 0, 0, 1, 1,
0.2228569, 0.2510039, 0.08758965, 0, 0, 0, 1, 1,
0.2232051, 0.8337454, -0.246609, 0, 0, 0, 1, 1,
0.2275066, -0.4516853, 1.47826, 0, 0, 0, 1, 1,
0.2291383, -0.2697328, 2.204587, 1, 1, 1, 1, 1,
0.2357404, -0.2001561, 2.952674, 1, 1, 1, 1, 1,
0.236184, -1.205917, 2.573243, 1, 1, 1, 1, 1,
0.2391287, -1.688547, 1.946061, 1, 1, 1, 1, 1,
0.2408352, 0.2162379, -0.8023662, 1, 1, 1, 1, 1,
0.2415126, -0.2339773, 0.9469491, 1, 1, 1, 1, 1,
0.2423186, 1.153099, -0.6194127, 1, 1, 1, 1, 1,
0.2442781, 0.5261329, -0.6790474, 1, 1, 1, 1, 1,
0.2447637, 0.2655965, 0.9912558, 1, 1, 1, 1, 1,
0.2485926, -0.3288175, 5.064078, 1, 1, 1, 1, 1,
0.2498577, -0.8635966, 3.267314, 1, 1, 1, 1, 1,
0.2524358, -0.9093272, 1.480838, 1, 1, 1, 1, 1,
0.2533087, -1.075955, 3.772942, 1, 1, 1, 1, 1,
0.2542116, -1.596769, 2.56653, 1, 1, 1, 1, 1,
0.2605379, 0.2663111, 1.420647, 1, 1, 1, 1, 1,
0.2620667, -0.07394236, 0.9833536, 0, 0, 1, 1, 1,
0.264027, -0.2937977, 2.80865, 1, 0, 0, 1, 1,
0.2689349, -0.2384174, 2.140987, 1, 0, 0, 1, 1,
0.2694753, -0.6801305, 4.123963, 1, 0, 0, 1, 1,
0.2742118, -0.08320411, 1.513134, 1, 0, 0, 1, 1,
0.2746709, -0.9314705, 3.88938, 1, 0, 0, 1, 1,
0.2803048, 0.09104583, 0.1832982, 0, 0, 0, 1, 1,
0.2818239, -0.2593978, 1.638293, 0, 0, 0, 1, 1,
0.286537, -0.5321308, 2.630732, 0, 0, 0, 1, 1,
0.2880407, 0.04313973, -0.1876036, 0, 0, 0, 1, 1,
0.2891667, -1.039498, 2.68566, 0, 0, 0, 1, 1,
0.2905322, -0.553901, 3.507319, 0, 0, 0, 1, 1,
0.2912265, 0.2140457, 0.4384306, 0, 0, 0, 1, 1,
0.2935984, -1.020023, 3.116833, 1, 1, 1, 1, 1,
0.2992427, 0.1393438, -0.3977579, 1, 1, 1, 1, 1,
0.2998357, -0.5916905, 1.085102, 1, 1, 1, 1, 1,
0.3003586, 1.06693, -0.2848405, 1, 1, 1, 1, 1,
0.3062437, -1.793456, 3.273222, 1, 1, 1, 1, 1,
0.3073846, -1.273493, 1.007349, 1, 1, 1, 1, 1,
0.3083467, 1.222543, -1.68017, 1, 1, 1, 1, 1,
0.3083863, -0.5804915, 2.971447, 1, 1, 1, 1, 1,
0.3090726, 0.3863151, 0.7213281, 1, 1, 1, 1, 1,
0.310351, 1.482105, 1.259133, 1, 1, 1, 1, 1,
0.3105488, 0.07174391, 2.41837, 1, 1, 1, 1, 1,
0.3176843, -0.5236669, 3.338891, 1, 1, 1, 1, 1,
0.3179738, -0.2061801, 0.3881582, 1, 1, 1, 1, 1,
0.3197602, -0.7222372, 4.262333, 1, 1, 1, 1, 1,
0.3207541, 1.471439, -0.2296909, 1, 1, 1, 1, 1,
0.3237748, -0.4858667, 2.802751, 0, 0, 1, 1, 1,
0.3247956, -0.7020493, 1.553297, 1, 0, 0, 1, 1,
0.3287952, -2.501243, 1.621421, 1, 0, 0, 1, 1,
0.331009, 1.173108, 2.801727, 1, 0, 0, 1, 1,
0.3321021, -0.4653917, 3.009729, 1, 0, 0, 1, 1,
0.3329164, -1.24248, 4.569526, 1, 0, 0, 1, 1,
0.333737, 0.5227807, 0.06026326, 0, 0, 0, 1, 1,
0.3341306, -0.5398775, 2.187442, 0, 0, 0, 1, 1,
0.336692, -1.637388, 0.5570925, 0, 0, 0, 1, 1,
0.3384022, 1.353483, 0.7920798, 0, 0, 0, 1, 1,
0.3444989, -1.165551, 2.174022, 0, 0, 0, 1, 1,
0.3450341, 0.03308219, 2.991466, 0, 0, 0, 1, 1,
0.3493329, -2.769886, 4.434709, 0, 0, 0, 1, 1,
0.3522556, -1.330758, 5.030746, 1, 1, 1, 1, 1,
0.3538182, -0.1761501, 3.943271, 1, 1, 1, 1, 1,
0.3548934, -0.8272176, 2.333639, 1, 1, 1, 1, 1,
0.35605, 1.220604, 1.899523, 1, 1, 1, 1, 1,
0.3565807, 0.8884788, 0.141496, 1, 1, 1, 1, 1,
0.3609968, -1.506979, 3.216775, 1, 1, 1, 1, 1,
0.3683715, 0.2515181, 0.8915744, 1, 1, 1, 1, 1,
0.3806816, 0.2794637, 1.385029, 1, 1, 1, 1, 1,
0.386677, -1.476405, 3.836533, 1, 1, 1, 1, 1,
0.3940194, 0.4908289, 2.768416, 1, 1, 1, 1, 1,
0.3945498, 0.2496343, 1.31481, 1, 1, 1, 1, 1,
0.3960758, -0.5754521, 0.6587793, 1, 1, 1, 1, 1,
0.4022186, 1.752807, 0.4566012, 1, 1, 1, 1, 1,
0.4041281, -0.584341, 2.085008, 1, 1, 1, 1, 1,
0.4063879, -1.222305, 2.918743, 1, 1, 1, 1, 1,
0.4124108, -0.3854974, 1.856507, 0, 0, 1, 1, 1,
0.413491, 0.4609894, 0.2844109, 1, 0, 0, 1, 1,
0.4137266, 1.514138, -0.8927307, 1, 0, 0, 1, 1,
0.4139271, 1.627192, -0.7672732, 1, 0, 0, 1, 1,
0.4178016, -1.22946, 1.928443, 1, 0, 0, 1, 1,
0.4195628, 0.1187996, 2.926354, 1, 0, 0, 1, 1,
0.4259814, 0.1918924, 0.4606145, 0, 0, 0, 1, 1,
0.4279093, 0.4470501, -0.5380762, 0, 0, 0, 1, 1,
0.4282568, 1.021747, -1.427573, 0, 0, 0, 1, 1,
0.4346419, 0.5007343, -0.2943791, 0, 0, 0, 1, 1,
0.4434664, -0.6140897, 1.281945, 0, 0, 0, 1, 1,
0.4463407, 0.6710345, 0.5016968, 0, 0, 0, 1, 1,
0.4490491, -0.8154648, 3.324892, 0, 0, 0, 1, 1,
0.4501133, 0.5302132, 0.6785617, 1, 1, 1, 1, 1,
0.45034, 1.690915, 0.510672, 1, 1, 1, 1, 1,
0.4507248, 2.21406, 0.4953321, 1, 1, 1, 1, 1,
0.4577707, -0.5389239, 2.391386, 1, 1, 1, 1, 1,
0.4589757, -2.421744, 1.360258, 1, 1, 1, 1, 1,
0.4605426, 1.384235, 0.6248481, 1, 1, 1, 1, 1,
0.4613739, -0.689271, 2.163218, 1, 1, 1, 1, 1,
0.4624554, 0.7185385, 0.9530135, 1, 1, 1, 1, 1,
0.465398, 0.369841, 0.4795235, 1, 1, 1, 1, 1,
0.4695038, 0.2527762, 1.024577, 1, 1, 1, 1, 1,
0.4719421, 0.4576984, 1.209699, 1, 1, 1, 1, 1,
0.4732725, -0.4118569, 2.944687, 1, 1, 1, 1, 1,
0.4783379, 0.29174, 0.1907989, 1, 1, 1, 1, 1,
0.4823318, 1.417333, -0.8684064, 1, 1, 1, 1, 1,
0.488626, -0.8485036, 5.073492, 1, 1, 1, 1, 1,
0.4902951, -1.95981, 2.685687, 0, 0, 1, 1, 1,
0.4929427, 0.7994573, 1.228111, 1, 0, 0, 1, 1,
0.5057367, 1.643091, 0.3477249, 1, 0, 0, 1, 1,
0.5065033, 0.05893072, 1.66038, 1, 0, 0, 1, 1,
0.5071085, -0.6439242, 2.941773, 1, 0, 0, 1, 1,
0.5074592, -0.5052751, 0.2454898, 1, 0, 0, 1, 1,
0.508736, -1.231084, 2.864455, 0, 0, 0, 1, 1,
0.514196, -0.5712227, 3.893106, 0, 0, 0, 1, 1,
0.5154978, -1.951959, 2.652107, 0, 0, 0, 1, 1,
0.516916, 0.436428, 1.724198, 0, 0, 0, 1, 1,
0.5184685, 0.2352498, 1.804813, 0, 0, 0, 1, 1,
0.5219315, 1.221203, 0.7779892, 0, 0, 0, 1, 1,
0.5239813, -0.8964855, 3.348536, 0, 0, 0, 1, 1,
0.525028, 0.5929497, 0.7105423, 1, 1, 1, 1, 1,
0.5318774, 1.629206, -0.4815182, 1, 1, 1, 1, 1,
0.5323239, -0.535346, 3.13498, 1, 1, 1, 1, 1,
0.5352851, 1.224708, 0.3612463, 1, 1, 1, 1, 1,
0.5353791, -0.0267414, -0.09840172, 1, 1, 1, 1, 1,
0.5438071, -0.1616944, 1.175108, 1, 1, 1, 1, 1,
0.5450856, -0.9880456, 1.377653, 1, 1, 1, 1, 1,
0.5456401, -1.622061, 3.472663, 1, 1, 1, 1, 1,
0.5462388, 0.87954, -0.1589075, 1, 1, 1, 1, 1,
0.5478116, 1.965572, -0.5767739, 1, 1, 1, 1, 1,
0.5504776, -2.085233, 0.7362815, 1, 1, 1, 1, 1,
0.5561514, 1.189705, 0.2416664, 1, 1, 1, 1, 1,
0.5634564, 0.09800015, 4.013266, 1, 1, 1, 1, 1,
0.5653977, 0.5499874, 0.6796212, 1, 1, 1, 1, 1,
0.565832, -0.3454154, 3.00847, 1, 1, 1, 1, 1,
0.5685483, -1.106321, 3.094742, 0, 0, 1, 1, 1,
0.5687253, -0.7978463, 1.909407, 1, 0, 0, 1, 1,
0.5689358, -0.05617528, -0.3769648, 1, 0, 0, 1, 1,
0.569533, 1.06021, 1.132253, 1, 0, 0, 1, 1,
0.570973, -0.7182046, 2.634425, 1, 0, 0, 1, 1,
0.5715681, 1.191894, -0.2122256, 1, 0, 0, 1, 1,
0.574821, -1.566986, 2.314392, 0, 0, 0, 1, 1,
0.5798339, -0.6316093, 2.903257, 0, 0, 0, 1, 1,
0.5923041, 1.942347, 1.528463, 0, 0, 0, 1, 1,
0.5932403, 0.3463414, 2.6468, 0, 0, 0, 1, 1,
0.5933294, -0.3882394, 1.781553, 0, 0, 0, 1, 1,
0.5950804, 0.7881415, 0.8155497, 0, 0, 0, 1, 1,
0.6017391, 0.1103658, -0.2278247, 0, 0, 0, 1, 1,
0.6020211, -0.06767477, 2.378752, 1, 1, 1, 1, 1,
0.6048188, 1.770905, -0.1484427, 1, 1, 1, 1, 1,
0.6064838, 0.8120545, 0.940755, 1, 1, 1, 1, 1,
0.6067225, 0.3093235, 1.568998, 1, 1, 1, 1, 1,
0.6087753, -0.6259701, 2.468315, 1, 1, 1, 1, 1,
0.6109675, 0.1704779, 1.289641, 1, 1, 1, 1, 1,
0.6151633, -1.135084, 0.9368759, 1, 1, 1, 1, 1,
0.6169551, -1.802058, 4.016014, 1, 1, 1, 1, 1,
0.6193162, 0.7305316, 0.7078407, 1, 1, 1, 1, 1,
0.6198192, -0.3726135, 3.002769, 1, 1, 1, 1, 1,
0.6247342, -1.329524, 1.787827, 1, 1, 1, 1, 1,
0.6268963, -1.191804, 2.939176, 1, 1, 1, 1, 1,
0.6311865, 0.4792679, 0.5371236, 1, 1, 1, 1, 1,
0.6315224, 0.5825289, 2.043694, 1, 1, 1, 1, 1,
0.6329623, 2.498982, -0.05308945, 1, 1, 1, 1, 1,
0.6341292, 0.8706813, 0.1503775, 0, 0, 1, 1, 1,
0.6384031, 0.07332177, 0.6650546, 1, 0, 0, 1, 1,
0.6396207, -0.1793709, 1.997663, 1, 0, 0, 1, 1,
0.6482954, -0.3840933, 1.789921, 1, 0, 0, 1, 1,
0.6518207, -0.4418461, 3.301903, 1, 0, 0, 1, 1,
0.6518208, 0.5631753, 1.966802, 1, 0, 0, 1, 1,
0.6542026, -0.2568076, 2.724646, 0, 0, 0, 1, 1,
0.6560263, 0.9902853, -0.4584889, 0, 0, 0, 1, 1,
0.6602728, 1.020145, -0.6066108, 0, 0, 0, 1, 1,
0.6613458, -1.974072, 4.029381, 0, 0, 0, 1, 1,
0.6635177, -0.6242187, 3.274955, 0, 0, 0, 1, 1,
0.6724663, -0.9433267, 1.779939, 0, 0, 0, 1, 1,
0.6875912, 0.6801555, 1.405431, 0, 0, 0, 1, 1,
0.6903428, 2.141196, 0.3660094, 1, 1, 1, 1, 1,
0.6964683, -0.7110399, 3.922605, 1, 1, 1, 1, 1,
0.7072201, 0.3868516, 1.84119, 1, 1, 1, 1, 1,
0.7086708, -0.1663361, 2.358029, 1, 1, 1, 1, 1,
0.7150471, 0.6046028, 0.7351497, 1, 1, 1, 1, 1,
0.7155241, 0.3290018, 1.263319, 1, 1, 1, 1, 1,
0.7173014, -1.164537, 1.671593, 1, 1, 1, 1, 1,
0.7178184, 0.8090036, -0.2191096, 1, 1, 1, 1, 1,
0.7207736, -1.183396, 2.442685, 1, 1, 1, 1, 1,
0.7232199, -0.8276832, 1.844785, 1, 1, 1, 1, 1,
0.7239468, 0.7563748, -1.32611, 1, 1, 1, 1, 1,
0.7352604, 1.023792, 0.8600799, 1, 1, 1, 1, 1,
0.7488855, -0.01832267, 0.8044004, 1, 1, 1, 1, 1,
0.753344, 0.05227007, 0.01736635, 1, 1, 1, 1, 1,
0.7555187, 0.9110332, 1.178218, 1, 1, 1, 1, 1,
0.75879, 1.179766, -0.1046616, 0, 0, 1, 1, 1,
0.7595096, 1.906645, -0.3856919, 1, 0, 0, 1, 1,
0.7636953, 1.533558, -0.1606055, 1, 0, 0, 1, 1,
0.7667434, -0.1164556, 0.5582945, 1, 0, 0, 1, 1,
0.7687578, -0.05951897, 2.477568, 1, 0, 0, 1, 1,
0.7693818, 0.2291031, 0.5730687, 1, 0, 0, 1, 1,
0.7724187, -0.5425657, 2.890279, 0, 0, 0, 1, 1,
0.77395, -1.286943, 1.701653, 0, 0, 0, 1, 1,
0.7838165, 2.012612, 0.1191386, 0, 0, 0, 1, 1,
0.7861867, 0.9842012, 2.653228, 0, 0, 0, 1, 1,
0.7872926, -0.1589287, 1.517083, 0, 0, 0, 1, 1,
0.7902066, 1.487243, 1.282728, 0, 0, 0, 1, 1,
0.7912734, 1.500184, -0.6140766, 0, 0, 0, 1, 1,
0.7931135, 0.3510809, 1.328495, 1, 1, 1, 1, 1,
0.7933373, 1.220277, -0.08239769, 1, 1, 1, 1, 1,
0.7940945, -0.04808234, 1.63798, 1, 1, 1, 1, 1,
0.8024681, 0.1194772, 1.956145, 1, 1, 1, 1, 1,
0.8038765, -0.3287421, 2.582418, 1, 1, 1, 1, 1,
0.8039027, -0.7384862, 3.193676, 1, 1, 1, 1, 1,
0.8125916, -1.589181, 2.184617, 1, 1, 1, 1, 1,
0.8165634, -1.430392, 1.166277, 1, 1, 1, 1, 1,
0.817492, -0.05895996, 2.810564, 1, 1, 1, 1, 1,
0.8193125, 0.2210614, 0.6417332, 1, 1, 1, 1, 1,
0.8195962, 0.3505562, 0.9853672, 1, 1, 1, 1, 1,
0.8202662, 0.02340632, 1.250336, 1, 1, 1, 1, 1,
0.820289, 1.480909, 0.3593235, 1, 1, 1, 1, 1,
0.8251411, -0.1727647, 0.8545657, 1, 1, 1, 1, 1,
0.8278468, -0.4737664, 1.850943, 1, 1, 1, 1, 1,
0.8283873, -1.354481, 5.539537, 0, 0, 1, 1, 1,
0.8352671, -0.328792, 3.705762, 1, 0, 0, 1, 1,
0.8356028, 0.3569955, -0.4282787, 1, 0, 0, 1, 1,
0.8361155, -1.26946, 0.9879156, 1, 0, 0, 1, 1,
0.8395434, 1.949429, 2.030221, 1, 0, 0, 1, 1,
0.8412918, 0.7754523, 0.1695161, 1, 0, 0, 1, 1,
0.843555, 1.50839, 1.280402, 0, 0, 0, 1, 1,
0.8500516, 0.3337108, 1.549185, 0, 0, 0, 1, 1,
0.8580354, 1.319945, 0.9587705, 0, 0, 0, 1, 1,
0.870989, 1.657873, 1.489542, 0, 0, 0, 1, 1,
0.8743286, -0.8767484, 3.015676, 0, 0, 0, 1, 1,
0.8747273, -2.12397, 1.829233, 0, 0, 0, 1, 1,
0.8748619, 1.219258, 0.8960114, 0, 0, 0, 1, 1,
0.8761119, -0.3282008, 2.222188, 1, 1, 1, 1, 1,
0.8783355, -1.272469, 1.168312, 1, 1, 1, 1, 1,
0.8802685, -0.003266973, 1.377985, 1, 1, 1, 1, 1,
0.8861607, 0.2057792, 1.496587, 1, 1, 1, 1, 1,
0.8888735, -0.1278926, 3.199794, 1, 1, 1, 1, 1,
0.8891125, -0.7548108, 2.70623, 1, 1, 1, 1, 1,
0.890154, -1.47963, 2.179818, 1, 1, 1, 1, 1,
0.8906396, -1.840387, 3.781209, 1, 1, 1, 1, 1,
0.891053, 0.2797085, 3.654534, 1, 1, 1, 1, 1,
0.8950451, -0.4600558, 2.470207, 1, 1, 1, 1, 1,
0.9041584, -0.9486469, 2.806857, 1, 1, 1, 1, 1,
0.9091308, 0.4875336, 1.358813, 1, 1, 1, 1, 1,
0.9106507, -1.131994, 4.424621, 1, 1, 1, 1, 1,
0.9114903, 0.6099055, 0.1137357, 1, 1, 1, 1, 1,
0.9123873, -0.8419771, 3.101265, 1, 1, 1, 1, 1,
0.9184846, -0.7599583, 2.080448, 0, 0, 1, 1, 1,
0.9209968, -1.099517, 1.053378, 1, 0, 0, 1, 1,
0.9275106, -0.1479438, 1.197624, 1, 0, 0, 1, 1,
0.9283649, -0.8529344, 4.312074, 1, 0, 0, 1, 1,
0.9323088, -0.3249604, 0.8364357, 1, 0, 0, 1, 1,
0.9337867, 1.398951, 0.5095056, 1, 0, 0, 1, 1,
0.9385669, -1.31418, 2.954606, 0, 0, 0, 1, 1,
0.9401821, -0.5863489, 1.408739, 0, 0, 0, 1, 1,
0.9410089, 0.4512495, 2.310136, 0, 0, 0, 1, 1,
0.9419167, 1.110238, 1.670474, 0, 0, 0, 1, 1,
0.9425178, 1.053626, 1.725992, 0, 0, 0, 1, 1,
0.9426916, -0.269461, 2.724148, 0, 0, 0, 1, 1,
0.9482827, 0.227234, 2.63777, 0, 0, 0, 1, 1,
0.9587785, -0.6663649, -0.3703681, 1, 1, 1, 1, 1,
0.9624097, 0.4270464, 1.564046, 1, 1, 1, 1, 1,
0.9723176, 1.55306, 1.95864, 1, 1, 1, 1, 1,
0.9734841, -0.5344781, 1.395329, 1, 1, 1, 1, 1,
0.9747768, -1.144471, 2.895035, 1, 1, 1, 1, 1,
0.9759244, 0.9133925, -1.056761, 1, 1, 1, 1, 1,
0.9773147, -1.553776, 2.487106, 1, 1, 1, 1, 1,
0.9840763, 1.756979, 1.252782, 1, 1, 1, 1, 1,
0.9857968, -1.504344, 2.273283, 1, 1, 1, 1, 1,
0.9913483, -0.107046, 0.4964941, 1, 1, 1, 1, 1,
1.003787, 0.05329804, 3.83523, 1, 1, 1, 1, 1,
1.005927, 0.6253557, 2.592635, 1, 1, 1, 1, 1,
1.007877, -0.4092546, 2.400333, 1, 1, 1, 1, 1,
1.008668, 2.176691, 1.637455, 1, 1, 1, 1, 1,
1.010391, -0.2587911, 2.605029, 1, 1, 1, 1, 1,
1.01325, -0.871693, 1.701657, 0, 0, 1, 1, 1,
1.034445, -1.347125, 0.379782, 1, 0, 0, 1, 1,
1.034956, 0.8260665, 0.05185445, 1, 0, 0, 1, 1,
1.035257, -1.522665, 2.729253, 1, 0, 0, 1, 1,
1.042531, 0.1273698, 1.119631, 1, 0, 0, 1, 1,
1.044017, 0.726209, -0.3411773, 1, 0, 0, 1, 1,
1.045194, -0.5555378, 0.3705846, 0, 0, 0, 1, 1,
1.051965, 0.08336049, 2.204097, 0, 0, 0, 1, 1,
1.054276, -1.969878, 1.788805, 0, 0, 0, 1, 1,
1.066223, 0.3527834, 1.107565, 0, 0, 0, 1, 1,
1.083149, 0.3035609, 1.901801, 0, 0, 0, 1, 1,
1.086196, 1.648361, 0.9721041, 0, 0, 0, 1, 1,
1.093612, -1.31107, 1.595372, 0, 0, 0, 1, 1,
1.106109, -0.304308, 0.8309237, 1, 1, 1, 1, 1,
1.106962, -1.318583, 2.258482, 1, 1, 1, 1, 1,
1.107316, -0.2100374, 2.176906, 1, 1, 1, 1, 1,
1.108043, 0.07597758, 2.188969, 1, 1, 1, 1, 1,
1.110132, -0.5776485, 0.69919, 1, 1, 1, 1, 1,
1.113285, -0.6453951, 2.287673, 1, 1, 1, 1, 1,
1.114695, 0.3826381, 0.9162191, 1, 1, 1, 1, 1,
1.116709, -0.6371036, 2.335881, 1, 1, 1, 1, 1,
1.118528, -0.1554273, 2.447344, 1, 1, 1, 1, 1,
1.119093, 1.289915, -0.714738, 1, 1, 1, 1, 1,
1.120336, -0.1592572, 0.4677124, 1, 1, 1, 1, 1,
1.123412, 0.5482923, 0.1867906, 1, 1, 1, 1, 1,
1.128244, -0.1792033, 0.5320654, 1, 1, 1, 1, 1,
1.131534, 0.1331112, 2.812325, 1, 1, 1, 1, 1,
1.133193, 0.6317926, 0.7431253, 1, 1, 1, 1, 1,
1.137642, -0.4853422, 1.564638, 0, 0, 1, 1, 1,
1.138259, 0.03592001, 1.842273, 1, 0, 0, 1, 1,
1.148495, -1.931599, 1.030309, 1, 0, 0, 1, 1,
1.155126, 1.465561, 0.9002477, 1, 0, 0, 1, 1,
1.158226, 1.221371, 0.9433061, 1, 0, 0, 1, 1,
1.160895, 0.5775051, -0.4719003, 1, 0, 0, 1, 1,
1.172934, 0.4161699, 1.449891, 0, 0, 0, 1, 1,
1.173247, -0.07084219, 0.4208557, 0, 0, 0, 1, 1,
1.175341, 0.7827042, 1.918875, 0, 0, 0, 1, 1,
1.183663, 1.000765, 2.125234, 0, 0, 0, 1, 1,
1.188764, 1.715662, 0.1968119, 0, 0, 0, 1, 1,
1.188927, 0.8475373, 0.1430132, 0, 0, 0, 1, 1,
1.189653, -0.13668, 4.384688, 0, 0, 0, 1, 1,
1.201786, 0.07247921, 1.786407, 1, 1, 1, 1, 1,
1.204962, -1.394783, 3.017777, 1, 1, 1, 1, 1,
1.216214, 0.479498, 3.073239, 1, 1, 1, 1, 1,
1.22173, 0.3629047, -0.2576742, 1, 1, 1, 1, 1,
1.22576, -0.2356115, 1.6947, 1, 1, 1, 1, 1,
1.246508, 0.1253105, 2.485634, 1, 1, 1, 1, 1,
1.249597, -2.500007, 3.082019, 1, 1, 1, 1, 1,
1.252963, 0.297835, 2.085877, 1, 1, 1, 1, 1,
1.253331, -0.4165643, 0.9157261, 1, 1, 1, 1, 1,
1.25687, -0.4855893, 2.346447, 1, 1, 1, 1, 1,
1.262299, -0.3578004, 1.757287, 1, 1, 1, 1, 1,
1.264101, 2.525823, -0.1109497, 1, 1, 1, 1, 1,
1.267144, -1.736468, 3.037765, 1, 1, 1, 1, 1,
1.275789, 1.938092, 1.151435, 1, 1, 1, 1, 1,
1.280034, -0.56622, 0.6512637, 1, 1, 1, 1, 1,
1.285849, -0.3753003, 0.9776849, 0, 0, 1, 1, 1,
1.28952, 0.6505298, 1.363935, 1, 0, 0, 1, 1,
1.297137, 0.1895425, 1.860447, 1, 0, 0, 1, 1,
1.297915, -0.3311503, 2.54286, 1, 0, 0, 1, 1,
1.29847, -0.257015, 2.471608, 1, 0, 0, 1, 1,
1.306598, -0.8772035, 1.473174, 1, 0, 0, 1, 1,
1.321038, 0.8312159, 1.197986, 0, 0, 0, 1, 1,
1.338556, 0.1102486, 0.6602743, 0, 0, 0, 1, 1,
1.339803, -0.1124449, 0.858952, 0, 0, 0, 1, 1,
1.347179, -0.8576574, 3.599913, 0, 0, 0, 1, 1,
1.350453, -0.8066291, 1.240052, 0, 0, 0, 1, 1,
1.353659, 0.3440257, 0.9099153, 0, 0, 0, 1, 1,
1.356249, 0.9195395, 1.558068, 0, 0, 0, 1, 1,
1.356852, 0.06599279, 2.359443, 1, 1, 1, 1, 1,
1.360469, 0.07598525, 1.317158, 1, 1, 1, 1, 1,
1.36084, 0.5969722, 2.176995, 1, 1, 1, 1, 1,
1.371818, 0.3819163, 2.631095, 1, 1, 1, 1, 1,
1.374196, -0.5489629, 2.988333, 1, 1, 1, 1, 1,
1.379706, -0.2339191, 1.335689, 1, 1, 1, 1, 1,
1.381601, -0.3435318, 1.230777, 1, 1, 1, 1, 1,
1.387914, -1.014953, 2.858429, 1, 1, 1, 1, 1,
1.389376, -0.4399683, 2.776517, 1, 1, 1, 1, 1,
1.391534, -0.5337084, 3.617423, 1, 1, 1, 1, 1,
1.392519, 0.1708537, 0.5807698, 1, 1, 1, 1, 1,
1.414312, -0.3194769, 3.260226, 1, 1, 1, 1, 1,
1.423188, 1.902705, 1.798869, 1, 1, 1, 1, 1,
1.447554, 0.3654285, 1.131859, 1, 1, 1, 1, 1,
1.460125, 0.6622429, 1.5236, 1, 1, 1, 1, 1,
1.497496, 0.01427601, 1.069153, 0, 0, 1, 1, 1,
1.499794, -1.05329, 1.550992, 1, 0, 0, 1, 1,
1.502187, 0.5740747, 1.196321, 1, 0, 0, 1, 1,
1.507724, -0.9433821, 2.071752, 1, 0, 0, 1, 1,
1.523174, 0.8122508, 1.723138, 1, 0, 0, 1, 1,
1.524861, 1.470058, 0.6820359, 1, 0, 0, 1, 1,
1.5528, -0.7445538, 3.124638, 0, 0, 0, 1, 1,
1.55885, -0.5221888, 3.246084, 0, 0, 0, 1, 1,
1.562157, 0.1816339, 1.041341, 0, 0, 0, 1, 1,
1.57057, 1.280562, 0.7915944, 0, 0, 0, 1, 1,
1.573446, 0.2474013, 2.201154, 0, 0, 0, 1, 1,
1.583378, 2.242197, 1.506329, 0, 0, 0, 1, 1,
1.589732, 1.593925, 1.574496, 0, 0, 0, 1, 1,
1.591156, -0.6203083, 1.98767, 1, 1, 1, 1, 1,
1.597284, -0.9261361, 4.570614, 1, 1, 1, 1, 1,
1.607849, 0.4546155, 0.2258895, 1, 1, 1, 1, 1,
1.608974, 1.20627, 3.161101, 1, 1, 1, 1, 1,
1.609408, -1.790446, 2.204214, 1, 1, 1, 1, 1,
1.613196, 0.1461947, 3.075634, 1, 1, 1, 1, 1,
1.637416, 0.1730921, -1.18335, 1, 1, 1, 1, 1,
1.645329, 0.2443661, 0.4010633, 1, 1, 1, 1, 1,
1.650562, 0.5005016, -0.3451386, 1, 1, 1, 1, 1,
1.651575, -0.08389262, 1.204553, 1, 1, 1, 1, 1,
1.664182, 0.6619721, -0.0370162, 1, 1, 1, 1, 1,
1.664215, -0.5087766, 1.83157, 1, 1, 1, 1, 1,
1.675434, 0.2574776, 1.822111, 1, 1, 1, 1, 1,
1.688787, -1.296632, 2.51821, 1, 1, 1, 1, 1,
1.694375, 0.09081977, 0.1632632, 1, 1, 1, 1, 1,
1.695578, 0.6099402, 1.962997, 0, 0, 1, 1, 1,
1.703451, -0.2374835, 0.8550271, 1, 0, 0, 1, 1,
1.707666, -0.7141064, 3.405033, 1, 0, 0, 1, 1,
1.712303, 0.4743548, 2.268543, 1, 0, 0, 1, 1,
1.738936, 0.9639555, 1.599007, 1, 0, 0, 1, 1,
1.751803, -0.500019, 2.226265, 1, 0, 0, 1, 1,
1.76529, -0.1016773, 3.036695, 0, 0, 0, 1, 1,
1.770407, 0.01760922, 1.867869, 0, 0, 0, 1, 1,
1.797797, 0.3028844, 2.205715, 0, 0, 0, 1, 1,
1.800219, 1.727468, 0.8234032, 0, 0, 0, 1, 1,
1.838683, -1.727598, 2.364371, 0, 0, 0, 1, 1,
1.849811, -1.443497, 3.827774, 0, 0, 0, 1, 1,
1.873786, -1.80248, 3.144065, 0, 0, 0, 1, 1,
1.913884, 0.7083231, 2.024466, 1, 1, 1, 1, 1,
1.933145, -1.005224, 1.239354, 1, 1, 1, 1, 1,
1.935855, 0.226859, 1.757255, 1, 1, 1, 1, 1,
1.938688, -0.9693977, 0.5278789, 1, 1, 1, 1, 1,
1.941443, 1.27897, 0.6504515, 1, 1, 1, 1, 1,
1.944596, -2.809219, 3.122568, 1, 1, 1, 1, 1,
1.944714, -1.691814, 0.8509007, 1, 1, 1, 1, 1,
1.975871, 0.1439767, 0.9434577, 1, 1, 1, 1, 1,
1.993396, 0.5068256, 0.6052262, 1, 1, 1, 1, 1,
1.99405, -1.472208, 3.759588, 1, 1, 1, 1, 1,
2.011228, -2.173425, 0.7824118, 1, 1, 1, 1, 1,
2.027236, -0.385014, 0.7195323, 1, 1, 1, 1, 1,
2.027765, -1.597084, 1.22024, 1, 1, 1, 1, 1,
2.047682, 0.2698934, 1.995911, 1, 1, 1, 1, 1,
2.049881, -1.207907, 1.520257, 1, 1, 1, 1, 1,
2.054945, 0.2965764, 1.126015, 0, 0, 1, 1, 1,
2.089469, 0.07187358, 0.8525694, 1, 0, 0, 1, 1,
2.129987, -0.7396685, 1.626192, 1, 0, 0, 1, 1,
2.23812, -0.7224452, 2.224856, 1, 0, 0, 1, 1,
2.288182, -0.2372862, 0.8073188, 1, 0, 0, 1, 1,
2.294241, -1.518783, 2.654806, 1, 0, 0, 1, 1,
2.297452, 0.1777286, 2.385262, 0, 0, 0, 1, 1,
2.332355, 0.5147174, 0.6196551, 0, 0, 0, 1, 1,
2.333045, 0.6639895, 1.309134, 0, 0, 0, 1, 1,
2.350531, -0.6309533, 1.341385, 0, 0, 0, 1, 1,
2.362129, -0.5378138, -0.0517466, 0, 0, 0, 1, 1,
2.433595, 0.09349562, 0.5251179, 0, 0, 0, 1, 1,
2.476064, 1.129782, 1.490104, 0, 0, 0, 1, 1,
2.488776, -0.2869118, 1.870545, 1, 1, 1, 1, 1,
2.548832, -0.1300434, 0.2910641, 1, 1, 1, 1, 1,
2.57229, -0.5413296, 1.161049, 1, 1, 1, 1, 1,
2.695668, 1.563643, 0.588087, 1, 1, 1, 1, 1,
2.727057, -1.474132, 0.6962892, 1, 1, 1, 1, 1,
2.993073, -0.6428378, 2.532881, 1, 1, 1, 1, 1,
3.067566, -2.150994, 2.017873, 1, 1, 1, 1, 1
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
var radius = 9.622794;
var distance = 33.79965;
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
mvMatrix.translate( -0.01073861, -0.1336775, 0.003353357 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79965);
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