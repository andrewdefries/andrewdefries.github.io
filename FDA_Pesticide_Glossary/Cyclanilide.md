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
-4.006295, -0.5311258, -0.7658532, 1, 0, 0, 1,
-2.468216, -0.6490161, -1.40597, 1, 0.007843138, 0, 1,
-2.427797, 1.033691, 0.1266155, 1, 0.01176471, 0, 1,
-2.421096, -0.3825167, -1.953584, 1, 0.01960784, 0, 1,
-2.364741, -1.870853, -2.828484, 1, 0.02352941, 0, 1,
-2.30602, -0.6676883, -2.110182, 1, 0.03137255, 0, 1,
-2.298538, 1.869631, -0.6201771, 1, 0.03529412, 0, 1,
-2.287389, -1.018586, -2.713306, 1, 0.04313726, 0, 1,
-2.271424, 0.4842996, -1.635356, 1, 0.04705882, 0, 1,
-2.262646, -2.428189, -1.895705, 1, 0.05490196, 0, 1,
-2.235386, 0.5769588, -1.118735, 1, 0.05882353, 0, 1,
-2.234222, -0.3689104, -1.23235, 1, 0.06666667, 0, 1,
-2.221972, 0.8153165, -0.9157335, 1, 0.07058824, 0, 1,
-2.196728, 1.319947, -0.565804, 1, 0.07843138, 0, 1,
-2.185263, -0.2001764, -1.845687, 1, 0.08235294, 0, 1,
-2.126864, -0.2502665, -1.010968, 1, 0.09019608, 0, 1,
-2.114934, -0.1458271, -0.1692471, 1, 0.09411765, 0, 1,
-2.082673, 1.827062, -1.036556, 1, 0.1019608, 0, 1,
-2.068995, 0.5166272, -0.3794578, 1, 0.1098039, 0, 1,
-2.06167, -1.024621, -2.772413, 1, 0.1137255, 0, 1,
-2.031289, -1.096164, -1.955875, 1, 0.1215686, 0, 1,
-2.009886, -0.7342187, -0.5870435, 1, 0.1254902, 0, 1,
-1.986526, -1.581581, -2.531543, 1, 0.1333333, 0, 1,
-1.979878, -2.789227, -4.117912, 1, 0.1372549, 0, 1,
-1.978534, 0.2469628, -0.9802516, 1, 0.145098, 0, 1,
-1.940176, -0.7110074, -1.875343, 1, 0.1490196, 0, 1,
-1.93918, 0.1317389, -2.394157, 1, 0.1568628, 0, 1,
-1.914565, -0.4496234, -2.447544, 1, 0.1607843, 0, 1,
-1.86809, 0.7065447, -2.469986, 1, 0.1686275, 0, 1,
-1.849951, 0.4415564, -1.035383, 1, 0.172549, 0, 1,
-1.848305, -0.06980685, -2.081627, 1, 0.1803922, 0, 1,
-1.836923, -0.8277838, -1.556621, 1, 0.1843137, 0, 1,
-1.826313, -1.343514, -2.573162, 1, 0.1921569, 0, 1,
-1.82377, 0.5633055, -1.717886, 1, 0.1960784, 0, 1,
-1.822948, 0.04140886, -1.520554, 1, 0.2039216, 0, 1,
-1.813655, -1.603537, -1.01589, 1, 0.2117647, 0, 1,
-1.811514, -0.09609284, -0.0357025, 1, 0.2156863, 0, 1,
-1.811406, 0.7044269, -0.8244094, 1, 0.2235294, 0, 1,
-1.801013, 0.01781992, -1.599468, 1, 0.227451, 0, 1,
-1.784684, 0.641373, -2.676149, 1, 0.2352941, 0, 1,
-1.780483, 1.818934, -0.5468243, 1, 0.2392157, 0, 1,
-1.724166, 0.2200264, 0.001540019, 1, 0.2470588, 0, 1,
-1.723807, -0.191608, -2.465734, 1, 0.2509804, 0, 1,
-1.699114, -0.2701245, -2.172822, 1, 0.2588235, 0, 1,
-1.687127, -0.615475, -3.253807, 1, 0.2627451, 0, 1,
-1.680621, -1.000226, -2.452827, 1, 0.2705882, 0, 1,
-1.659406, 0.8347524, -0.1257638, 1, 0.2745098, 0, 1,
-1.650517, -0.2075913, -1.637948, 1, 0.282353, 0, 1,
-1.646331, -0.4011462, -1.726401, 1, 0.2862745, 0, 1,
-1.620468, 0.1954539, -1.033451, 1, 0.2941177, 0, 1,
-1.614547, -2.087111, -2.493723, 1, 0.3019608, 0, 1,
-1.61393, 0.36143, -1.449614, 1, 0.3058824, 0, 1,
-1.604129, 1.383208, -1.924106, 1, 0.3137255, 0, 1,
-1.602819, 0.4152489, -1.173125, 1, 0.3176471, 0, 1,
-1.598343, 0.2032527, -0.7127982, 1, 0.3254902, 0, 1,
-1.580202, 0.1563246, -2.886289, 1, 0.3294118, 0, 1,
-1.576563, -1.416522, -2.506849, 1, 0.3372549, 0, 1,
-1.572945, 2.36581, -2.09661, 1, 0.3411765, 0, 1,
-1.555393, 0.03676772, -3.373017, 1, 0.3490196, 0, 1,
-1.544389, -0.7545588, -2.610347, 1, 0.3529412, 0, 1,
-1.534144, -0.6562378, -1.692756, 1, 0.3607843, 0, 1,
-1.530993, 0.3338332, -1.723959, 1, 0.3647059, 0, 1,
-1.528859, -0.2686169, -0.9197517, 1, 0.372549, 0, 1,
-1.526876, 0.5786924, -1.556795, 1, 0.3764706, 0, 1,
-1.526443, -0.6068298, -0.9097522, 1, 0.3843137, 0, 1,
-1.522664, -0.3365549, -4.23417, 1, 0.3882353, 0, 1,
-1.514658, 0.5685068, -1.496976, 1, 0.3960784, 0, 1,
-1.495241, 0.4227297, -0.1802765, 1, 0.4039216, 0, 1,
-1.482807, 3.993391, -2.335869, 1, 0.4078431, 0, 1,
-1.465519, 1.821875, 0.1022323, 1, 0.4156863, 0, 1,
-1.451997, 0.9892945, -0.4640833, 1, 0.4196078, 0, 1,
-1.449218, 0.04209071, -2.740514, 1, 0.427451, 0, 1,
-1.446209, 0.1947252, -1.616506, 1, 0.4313726, 0, 1,
-1.443139, 0.1140186, -2.512659, 1, 0.4392157, 0, 1,
-1.443005, -0.243339, -1.197353, 1, 0.4431373, 0, 1,
-1.438926, 0.0900962, -1.014554, 1, 0.4509804, 0, 1,
-1.421109, 1.153841, -1.760756, 1, 0.454902, 0, 1,
-1.418945, -1.561034, -1.15774, 1, 0.4627451, 0, 1,
-1.415786, -0.2243532, -1.721217, 1, 0.4666667, 0, 1,
-1.41395, -0.4230108, -1.261267, 1, 0.4745098, 0, 1,
-1.408214, 2.005224, 0.9711438, 1, 0.4784314, 0, 1,
-1.406175, 0.2711118, -1.176589, 1, 0.4862745, 0, 1,
-1.401325, -0.02451974, -0.7828245, 1, 0.4901961, 0, 1,
-1.396231, -0.1233408, -3.597811, 1, 0.4980392, 0, 1,
-1.393881, -0.06979662, -1.197141, 1, 0.5058824, 0, 1,
-1.388084, 0.3116239, 0.4359265, 1, 0.509804, 0, 1,
-1.387153, -0.6108724, -0.4497112, 1, 0.5176471, 0, 1,
-1.382082, 2.115668, -2.709073, 1, 0.5215687, 0, 1,
-1.373595, 0.2575095, -2.588702, 1, 0.5294118, 0, 1,
-1.359349, -1.444558, -3.019933, 1, 0.5333334, 0, 1,
-1.358327, 1.650438, -0.1519118, 1, 0.5411765, 0, 1,
-1.354882, 0.6775894, -0.8379814, 1, 0.5450981, 0, 1,
-1.349628, -0.7812377, -1.572774, 1, 0.5529412, 0, 1,
-1.346474, -0.06338223, -0.6918586, 1, 0.5568628, 0, 1,
-1.33369, 0.1958081, -2.295332, 1, 0.5647059, 0, 1,
-1.330229, -0.2335013, -1.391758, 1, 0.5686275, 0, 1,
-1.329751, -0.5828458, -2.702935, 1, 0.5764706, 0, 1,
-1.326366, 0.4498653, -1.616496, 1, 0.5803922, 0, 1,
-1.317789, -2.264708, -3.343008, 1, 0.5882353, 0, 1,
-1.309915, -0.7125721, -1.995949, 1, 0.5921569, 0, 1,
-1.30863, -0.09612174, -1.410621, 1, 0.6, 0, 1,
-1.304363, -1.852182, -2.972846, 1, 0.6078432, 0, 1,
-1.303287, -0.5219054, -0.8774211, 1, 0.6117647, 0, 1,
-1.298668, -0.2869648, -0.8714435, 1, 0.6196079, 0, 1,
-1.288177, 0.9576935, -1.615333, 1, 0.6235294, 0, 1,
-1.277125, 0.17657, -2.096663, 1, 0.6313726, 0, 1,
-1.267299, 0.01330008, -1.534525, 1, 0.6352941, 0, 1,
-1.239262, 0.5771425, -0.0940161, 1, 0.6431373, 0, 1,
-1.222871, -0.9863979, -1.207216, 1, 0.6470588, 0, 1,
-1.221947, -0.9056153, -2.871549, 1, 0.654902, 0, 1,
-1.221946, -0.1622913, -1.686842, 1, 0.6588235, 0, 1,
-1.216715, -0.0830929, -0.1721455, 1, 0.6666667, 0, 1,
-1.211747, 2.048066, -1.226343, 1, 0.6705883, 0, 1,
-1.207765, -0.1741477, -2.096937, 1, 0.6784314, 0, 1,
-1.195912, 0.1301904, -1.86163, 1, 0.682353, 0, 1,
-1.191348, -1.08166, -4.224503, 1, 0.6901961, 0, 1,
-1.179937, 0.3788512, -2.193126, 1, 0.6941177, 0, 1,
-1.179804, 1.331085, 1.890975, 1, 0.7019608, 0, 1,
-1.170737, -1.619495, -2.483017, 1, 0.7098039, 0, 1,
-1.165818, 0.3258587, -1.70049, 1, 0.7137255, 0, 1,
-1.148223, 0.002263535, -1.810714, 1, 0.7215686, 0, 1,
-1.143743, -0.3739874, -1.537227, 1, 0.7254902, 0, 1,
-1.138589, -0.3723843, -0.981874, 1, 0.7333333, 0, 1,
-1.128715, 0.1732422, -1.034496, 1, 0.7372549, 0, 1,
-1.128637, 0.4686378, -2.874319, 1, 0.7450981, 0, 1,
-1.12603, 0.3810882, -2.822954, 1, 0.7490196, 0, 1,
-1.123845, -0.06841115, -1.226788, 1, 0.7568628, 0, 1,
-1.123677, 1.549863, -0.3620012, 1, 0.7607843, 0, 1,
-1.117024, 0.8194087, -0.01551044, 1, 0.7686275, 0, 1,
-1.115899, 0.2018443, -0.1634073, 1, 0.772549, 0, 1,
-1.112206, 0.2115174, -1.887441, 1, 0.7803922, 0, 1,
-1.111905, 0.2286168, 0.9000694, 1, 0.7843137, 0, 1,
-1.100098, 1.187984, -0.5430077, 1, 0.7921569, 0, 1,
-1.098996, 0.505614, 1.898385, 1, 0.7960784, 0, 1,
-1.090907, -1.069631, -0.6638218, 1, 0.8039216, 0, 1,
-1.09056, 0.3339688, -0.9296254, 1, 0.8117647, 0, 1,
-1.08986, -0.7870829, -1.830113, 1, 0.8156863, 0, 1,
-1.089363, -0.8837646, -1.50642, 1, 0.8235294, 0, 1,
-1.088622, 0.4220804, 0.08877631, 1, 0.827451, 0, 1,
-1.08704, -0.7875466, -1.593934, 1, 0.8352941, 0, 1,
-1.086457, -0.2008659, -1.378882, 1, 0.8392157, 0, 1,
-1.082412, 0.9605266, -3.825162, 1, 0.8470588, 0, 1,
-1.076691, -0.5272399, -0.8013949, 1, 0.8509804, 0, 1,
-1.076322, 0.21316, -0.9897434, 1, 0.8588235, 0, 1,
-1.066194, 1.974077, -1.465042, 1, 0.8627451, 0, 1,
-1.065015, -0.907804, -2.645437, 1, 0.8705882, 0, 1,
-1.064333, -1.554594, -1.003672, 1, 0.8745098, 0, 1,
-1.063704, 1.446517, 0.05633074, 1, 0.8823529, 0, 1,
-1.061789, -0.3204144, -1.33177, 1, 0.8862745, 0, 1,
-1.057846, 1.191884, -0.4503362, 1, 0.8941177, 0, 1,
-1.055381, -0.4641249, -2.129432, 1, 0.8980392, 0, 1,
-1.055341, -0.7921589, 0.04925601, 1, 0.9058824, 0, 1,
-1.047451, -0.4352305, -0.8972566, 1, 0.9137255, 0, 1,
-1.046693, 1.583697, -0.9026839, 1, 0.9176471, 0, 1,
-1.045588, 0.2835831, -1.231649, 1, 0.9254902, 0, 1,
-1.044878, -0.8068939, -1.391524, 1, 0.9294118, 0, 1,
-1.03798, -0.704783, -3.862892, 1, 0.9372549, 0, 1,
-1.024775, -0.5575971, -1.187143, 1, 0.9411765, 0, 1,
-1.018766, 0.619247, -0.8499627, 1, 0.9490196, 0, 1,
-1.013884, 1.116426, -2.311897, 1, 0.9529412, 0, 1,
-1.011461, 0.1937139, -0.8076016, 1, 0.9607843, 0, 1,
-1.006811, 0.5374728, 0.6729656, 1, 0.9647059, 0, 1,
-1.006743, -0.09044784, -0.6034514, 1, 0.972549, 0, 1,
-1.005305, -1.575677, -1.387219, 1, 0.9764706, 0, 1,
-1.003653, -0.328183, -3.378843, 1, 0.9843137, 0, 1,
-1.002693, -0.5768287, -2.254948, 1, 0.9882353, 0, 1,
-1.002097, 0.3868296, -1.602138, 1, 0.9960784, 0, 1,
-0.9987627, 0.5162807, -1.276262, 0.9960784, 1, 0, 1,
-0.9980378, 0.5586092, -1.399651, 0.9921569, 1, 0, 1,
-0.9920539, 0.6872198, -0.008445419, 0.9843137, 1, 0, 1,
-0.9868924, 0.4119042, 0.07565495, 0.9803922, 1, 0, 1,
-0.9840954, -1.553641, -1.431641, 0.972549, 1, 0, 1,
-0.9806618, 2.293547, -1.667927, 0.9686275, 1, 0, 1,
-0.9690229, 0.2849672, -2.4127, 0.9607843, 1, 0, 1,
-0.966603, -0.1170233, -0.7607805, 0.9568627, 1, 0, 1,
-0.965897, -1.747486, -0.5548086, 0.9490196, 1, 0, 1,
-0.9530114, 0.3901461, -0.6274815, 0.945098, 1, 0, 1,
-0.9517711, -0.1070864, -2.095281, 0.9372549, 1, 0, 1,
-0.9510187, -1.873149, -3.033603, 0.9333333, 1, 0, 1,
-0.9496971, -0.3666371, -1.94786, 0.9254902, 1, 0, 1,
-0.9394535, 0.5345099, 0.877623, 0.9215686, 1, 0, 1,
-0.9378361, -0.7327895, -1.834652, 0.9137255, 1, 0, 1,
-0.9378043, 0.3576243, -0.5192831, 0.9098039, 1, 0, 1,
-0.9342881, -0.8912933, -4.137383, 0.9019608, 1, 0, 1,
-0.9293567, 0.6210271, -2.145694, 0.8941177, 1, 0, 1,
-0.9254677, -0.5563022, -3.323603, 0.8901961, 1, 0, 1,
-0.9206064, -0.06524062, -2.000934, 0.8823529, 1, 0, 1,
-0.9184121, 0.9475073, -1.375931, 0.8784314, 1, 0, 1,
-0.9068192, 0.1078653, -1.922743, 0.8705882, 1, 0, 1,
-0.9066367, -0.1158205, -0.3420942, 0.8666667, 1, 0, 1,
-0.9048439, -0.1705512, -2.125293, 0.8588235, 1, 0, 1,
-0.9035951, -1.711352, -2.375991, 0.854902, 1, 0, 1,
-0.9022758, 0.6259781, -3.708885, 0.8470588, 1, 0, 1,
-0.9008844, 0.6777534, -0.7571858, 0.8431373, 1, 0, 1,
-0.8931494, -0.2137873, -2.326171, 0.8352941, 1, 0, 1,
-0.8904872, -0.3715154, -1.434952, 0.8313726, 1, 0, 1,
-0.8890331, 1.153305, -0.8215508, 0.8235294, 1, 0, 1,
-0.8859076, -0.5588453, -3.10235, 0.8196079, 1, 0, 1,
-0.8825587, -1.180591, -2.783689, 0.8117647, 1, 0, 1,
-0.8818335, -0.6227604, -1.491537, 0.8078431, 1, 0, 1,
-0.8792152, 0.6037632, -1.144007, 0.8, 1, 0, 1,
-0.8771572, -1.751888, -2.708799, 0.7921569, 1, 0, 1,
-0.861621, -0.06430572, -1.740012, 0.7882353, 1, 0, 1,
-0.860894, -1.02526, -2.034512, 0.7803922, 1, 0, 1,
-0.860849, -1.351251, -2.503503, 0.7764706, 1, 0, 1,
-0.8607625, 1.465928, 1.546205, 0.7686275, 1, 0, 1,
-0.8593325, 1.208329, -0.1621042, 0.7647059, 1, 0, 1,
-0.8587986, -0.01340791, -1.134637, 0.7568628, 1, 0, 1,
-0.8562534, 0.7589557, -1.861954, 0.7529412, 1, 0, 1,
-0.8562072, -0.3242722, -2.335477, 0.7450981, 1, 0, 1,
-0.8517598, 0.8257313, -0.05921048, 0.7411765, 1, 0, 1,
-0.8517103, 0.1976852, -1.953699, 0.7333333, 1, 0, 1,
-0.8458179, -0.4515489, -1.803818, 0.7294118, 1, 0, 1,
-0.8452168, -1.226705, -2.744437, 0.7215686, 1, 0, 1,
-0.8449782, 0.4357255, -0.8077661, 0.7176471, 1, 0, 1,
-0.8445309, -0.3295601, -0.4092735, 0.7098039, 1, 0, 1,
-0.8414184, -0.9413856, -2.071016, 0.7058824, 1, 0, 1,
-0.8384972, -0.07955973, -1.834618, 0.6980392, 1, 0, 1,
-0.8360936, 0.4366946, -0.3411733, 0.6901961, 1, 0, 1,
-0.8309559, -1.374977, -3.041689, 0.6862745, 1, 0, 1,
-0.8304662, -0.4348992, -0.06125922, 0.6784314, 1, 0, 1,
-0.826342, -0.3018136, -1.651539, 0.6745098, 1, 0, 1,
-0.8210756, -1.109976, -2.887857, 0.6666667, 1, 0, 1,
-0.8208964, -0.4044385, -1.610911, 0.6627451, 1, 0, 1,
-0.8191327, 1.415505, -1.635168, 0.654902, 1, 0, 1,
-0.8182584, -0.7622191, -2.588225, 0.6509804, 1, 0, 1,
-0.8180601, -0.958845, -2.983223, 0.6431373, 1, 0, 1,
-0.8143433, 0.9424147, -0.676662, 0.6392157, 1, 0, 1,
-0.8089374, 0.6797453, -1.3067, 0.6313726, 1, 0, 1,
-0.8056669, -0.732329, -2.056962, 0.627451, 1, 0, 1,
-0.804714, -0.6138516, -2.587634, 0.6196079, 1, 0, 1,
-0.8035712, -1.511108, -3.856279, 0.6156863, 1, 0, 1,
-0.8025409, 0.1965603, -1.441252, 0.6078432, 1, 0, 1,
-0.7942598, 1.0477, -0.8035653, 0.6039216, 1, 0, 1,
-0.7898976, -0.06779634, -2.467644, 0.5960785, 1, 0, 1,
-0.7888731, 1.720374, -0.3678367, 0.5882353, 1, 0, 1,
-0.7803969, 0.6237838, -1.813873, 0.5843138, 1, 0, 1,
-0.7765144, -0.2692269, -2.590532, 0.5764706, 1, 0, 1,
-0.7664542, 2.329879, -0.2484246, 0.572549, 1, 0, 1,
-0.7650293, 1.988181, -1.259365, 0.5647059, 1, 0, 1,
-0.7600843, -0.2256523, -2.909548, 0.5607843, 1, 0, 1,
-0.7571584, 1.830535, -3.3451, 0.5529412, 1, 0, 1,
-0.7563758, 1.621712, -2.543439, 0.5490196, 1, 0, 1,
-0.7531049, -0.1494931, -1.643706, 0.5411765, 1, 0, 1,
-0.7485502, 0.3731065, -1.763772, 0.5372549, 1, 0, 1,
-0.7478519, 0.6005264, 0.2099407, 0.5294118, 1, 0, 1,
-0.7454022, 2.109141, -0.3187952, 0.5254902, 1, 0, 1,
-0.7398997, -1.703475, -2.626709, 0.5176471, 1, 0, 1,
-0.7347558, -1.343594, -2.13603, 0.5137255, 1, 0, 1,
-0.7315238, -0.5984901, -1.217028, 0.5058824, 1, 0, 1,
-0.7307414, 0.6585771, -1.950728, 0.5019608, 1, 0, 1,
-0.7289715, -0.1712338, -1.370996, 0.4941176, 1, 0, 1,
-0.7279872, 0.982088, -0.5317453, 0.4862745, 1, 0, 1,
-0.7266915, -0.2705691, -2.71351, 0.4823529, 1, 0, 1,
-0.725437, -1.000934, -1.861522, 0.4745098, 1, 0, 1,
-0.7225136, -1.681252, -4.160306, 0.4705882, 1, 0, 1,
-0.7179416, -3.228696, -4.584338, 0.4627451, 1, 0, 1,
-0.7177116, -0.6672103, -2.569363, 0.4588235, 1, 0, 1,
-0.7175728, 0.4492567, -1.594747, 0.4509804, 1, 0, 1,
-0.71145, -1.207931, -2.194495, 0.4470588, 1, 0, 1,
-0.7071238, -0.0158223, -0.6701697, 0.4392157, 1, 0, 1,
-0.7026739, -0.02969893, -3.167773, 0.4352941, 1, 0, 1,
-0.6999694, -0.5485047, -1.538306, 0.427451, 1, 0, 1,
-0.6914921, 0.6382877, -0.5490488, 0.4235294, 1, 0, 1,
-0.6910089, 0.4837215, -1.965753, 0.4156863, 1, 0, 1,
-0.6904213, 0.1231561, -1.49843, 0.4117647, 1, 0, 1,
-0.6892821, -0.9289325, -3.548613, 0.4039216, 1, 0, 1,
-0.6868947, -0.07140774, -3.696764, 0.3960784, 1, 0, 1,
-0.6838776, 0.3955441, -2.999406, 0.3921569, 1, 0, 1,
-0.6802497, -0.2474984, -1.485706, 0.3843137, 1, 0, 1,
-0.6782765, -0.009189477, -1.487109, 0.3803922, 1, 0, 1,
-0.677152, -0.0933726, -1.78794, 0.372549, 1, 0, 1,
-0.6649309, 0.3146786, -0.2605859, 0.3686275, 1, 0, 1,
-0.65391, 0.6939933, -0.3324644, 0.3607843, 1, 0, 1,
-0.6512946, 1.742899, -0.344041, 0.3568628, 1, 0, 1,
-0.65083, -0.235582, -1.979315, 0.3490196, 1, 0, 1,
-0.6387351, -0.5193809, -2.604581, 0.345098, 1, 0, 1,
-0.6354174, 0.8514163, -0.3289211, 0.3372549, 1, 0, 1,
-0.6310128, 0.1843119, -1.872086, 0.3333333, 1, 0, 1,
-0.6247329, 0.1061624, -0.6141151, 0.3254902, 1, 0, 1,
-0.6247056, 0.1650655, -3.643873, 0.3215686, 1, 0, 1,
-0.624167, 0.001634676, -1.31502, 0.3137255, 1, 0, 1,
-0.6204578, -0.4115039, -1.865201, 0.3098039, 1, 0, 1,
-0.6170506, 1.20817, -0.2932752, 0.3019608, 1, 0, 1,
-0.6137922, 1.636913, 0.6671978, 0.2941177, 1, 0, 1,
-0.6100955, 1.116579, -0.3159795, 0.2901961, 1, 0, 1,
-0.6094506, 0.6475489, -0.9107445, 0.282353, 1, 0, 1,
-0.6042445, -0.5443926, -2.252681, 0.2784314, 1, 0, 1,
-0.6031278, -0.3353139, -3.037975, 0.2705882, 1, 0, 1,
-0.5988518, -0.6900576, -3.191211, 0.2666667, 1, 0, 1,
-0.5983163, -1.2626, -3.617377, 0.2588235, 1, 0, 1,
-0.5879503, 0.8200079, -1.715289, 0.254902, 1, 0, 1,
-0.5843687, -1.154388, -2.469009, 0.2470588, 1, 0, 1,
-0.5825685, 0.819267, -0.6057753, 0.2431373, 1, 0, 1,
-0.5812426, 0.8106312, -1.416094, 0.2352941, 1, 0, 1,
-0.5763686, 1.107843, -0.8755015, 0.2313726, 1, 0, 1,
-0.5757305, 1.654037, -0.1991388, 0.2235294, 1, 0, 1,
-0.5685033, 1.281479, -0.2899637, 0.2196078, 1, 0, 1,
-0.564872, -0.1980962, -3.238526, 0.2117647, 1, 0, 1,
-0.5630839, -0.5295953, -1.492151, 0.2078431, 1, 0, 1,
-0.5597621, 2.268222, -0.5758786, 0.2, 1, 0, 1,
-0.5592946, -1.251801, -1.30545, 0.1921569, 1, 0, 1,
-0.5566008, 0.4466907, -1.758069, 0.1882353, 1, 0, 1,
-0.5558664, -0.2978928, -2.542043, 0.1803922, 1, 0, 1,
-0.5527019, -0.3947474, -2.141007, 0.1764706, 1, 0, 1,
-0.5522391, 0.6623523, -1.038306, 0.1686275, 1, 0, 1,
-0.5520437, -0.6617105, -2.823396, 0.1647059, 1, 0, 1,
-0.5494853, 0.3606384, 0.8547376, 0.1568628, 1, 0, 1,
-0.5416078, -1.357002, -1.93775, 0.1529412, 1, 0, 1,
-0.5401188, -0.4276812, -3.013083, 0.145098, 1, 0, 1,
-0.5379232, 0.6076507, -0.1588183, 0.1411765, 1, 0, 1,
-0.5364688, 0.0278174, -2.289763, 0.1333333, 1, 0, 1,
-0.5344504, -0.7239608, -2.866956, 0.1294118, 1, 0, 1,
-0.534316, -1.535971, -3.163947, 0.1215686, 1, 0, 1,
-0.5324531, -0.5177004, -2.398103, 0.1176471, 1, 0, 1,
-0.5294505, 0.9142187, 0.5435398, 0.1098039, 1, 0, 1,
-0.5258834, 0.888117, 2.551913, 0.1058824, 1, 0, 1,
-0.515624, -0.3289659, -2.114803, 0.09803922, 1, 0, 1,
-0.5118557, 2.227068, -1.056945, 0.09019608, 1, 0, 1,
-0.5064414, -0.7232286, -3.634588, 0.08627451, 1, 0, 1,
-0.5047218, 0.3107038, 0.1702482, 0.07843138, 1, 0, 1,
-0.5023113, 0.1494223, -3.113109, 0.07450981, 1, 0, 1,
-0.5013315, 0.2341587, -2.678204, 0.06666667, 1, 0, 1,
-0.5008148, -0.9671518, -2.616208, 0.0627451, 1, 0, 1,
-0.4994381, -0.8554363, -2.014666, 0.05490196, 1, 0, 1,
-0.4978034, -0.6123447, -2.431877, 0.05098039, 1, 0, 1,
-0.4953885, 0.4794904, -2.119582, 0.04313726, 1, 0, 1,
-0.476956, 1.202447, -0.3532445, 0.03921569, 1, 0, 1,
-0.4759488, 0.6613823, -0.186443, 0.03137255, 1, 0, 1,
-0.468744, -0.3473707, -0.3408089, 0.02745098, 1, 0, 1,
-0.4676842, -0.3796705, -1.828829, 0.01960784, 1, 0, 1,
-0.4660873, -1.077357, -2.653824, 0.01568628, 1, 0, 1,
-0.4650028, -0.4633141, -3.001135, 0.007843138, 1, 0, 1,
-0.4645914, -1.269284, -3.955131, 0.003921569, 1, 0, 1,
-0.45582, 0.4818748, -1.197853, 0, 1, 0.003921569, 1,
-0.4531882, -0.6201389, -1.490191, 0, 1, 0.01176471, 1,
-0.4520291, 0.1758847, -1.899807, 0, 1, 0.01568628, 1,
-0.4518377, 0.1293136, 0.04003731, 0, 1, 0.02352941, 1,
-0.4421381, -0.7706379, -1.63315, 0, 1, 0.02745098, 1,
-0.4417344, 0.6609508, 0.2281057, 0, 1, 0.03529412, 1,
-0.4380328, 1.96015, -0.331178, 0, 1, 0.03921569, 1,
-0.4360317, 0.7251719, -1.512081, 0, 1, 0.04705882, 1,
-0.4346133, -1.362944, -1.661074, 0, 1, 0.05098039, 1,
-0.4298379, 1.536786, -0.652389, 0, 1, 0.05882353, 1,
-0.4287107, -3.487554, -3.689153, 0, 1, 0.0627451, 1,
-0.4166653, 0.1774634, -0.3186019, 0, 1, 0.07058824, 1,
-0.4141583, -0.3368083, -2.312799, 0, 1, 0.07450981, 1,
-0.4114706, 0.791703, -0.3313761, 0, 1, 0.08235294, 1,
-0.4094228, -0.2387457, -3.376191, 0, 1, 0.08627451, 1,
-0.4090283, -0.641844, -2.993923, 0, 1, 0.09411765, 1,
-0.4086291, 0.8044971, -0.00136915, 0, 1, 0.1019608, 1,
-0.407183, 0.2952907, -0.9841995, 0, 1, 0.1058824, 1,
-0.4058644, -0.5803493, -2.664452, 0, 1, 0.1137255, 1,
-0.4055825, 1.438358, -0.2339037, 0, 1, 0.1176471, 1,
-0.391816, -0.1655556, -2.094233, 0, 1, 0.1254902, 1,
-0.3915599, 0.9516723, 0.08555211, 0, 1, 0.1294118, 1,
-0.3842747, 1.282549, -1.767819, 0, 1, 0.1372549, 1,
-0.3816715, -0.6553742, -2.362062, 0, 1, 0.1411765, 1,
-0.3814773, -0.05982581, -0.710541, 0, 1, 0.1490196, 1,
-0.3808244, -1.441138, -4.224583, 0, 1, 0.1529412, 1,
-0.3801907, -2.095991, -2.843554, 0, 1, 0.1607843, 1,
-0.3789171, 0.6234638, 0.8227382, 0, 1, 0.1647059, 1,
-0.3785373, -0.5552188, -1.926986, 0, 1, 0.172549, 1,
-0.3777787, 0.8793889, -0.9927931, 0, 1, 0.1764706, 1,
-0.3728435, -0.150859, -2.131551, 0, 1, 0.1843137, 1,
-0.3712857, 0.7262561, -1.5199, 0, 1, 0.1882353, 1,
-0.3693664, -1.969116, -3.699059, 0, 1, 0.1960784, 1,
-0.3629405, -1.894775, -3.4427, 0, 1, 0.2039216, 1,
-0.3600733, -0.8060483, -2.654944, 0, 1, 0.2078431, 1,
-0.3551186, -1.139375, -1.536329, 0, 1, 0.2156863, 1,
-0.3522599, -0.9136328, -4.227006, 0, 1, 0.2196078, 1,
-0.3521757, 1.65089, -0.113493, 0, 1, 0.227451, 1,
-0.3521605, -0.710263, -0.3571831, 0, 1, 0.2313726, 1,
-0.3504388, 1.372727, -0.8579862, 0, 1, 0.2392157, 1,
-0.3500582, 0.5636778, 0.06896892, 0, 1, 0.2431373, 1,
-0.345985, 1.645818, 0.2654593, 0, 1, 0.2509804, 1,
-0.3446254, -2.170244, -3.478568, 0, 1, 0.254902, 1,
-0.3427651, -0.8823411, -3.264378, 0, 1, 0.2627451, 1,
-0.3392712, -0.3699883, -1.842263, 0, 1, 0.2666667, 1,
-0.3386196, 0.2791542, -1.200309, 0, 1, 0.2745098, 1,
-0.3383652, 0.784968, 0.6119969, 0, 1, 0.2784314, 1,
-0.336426, -0.7324843, -2.666967, 0, 1, 0.2862745, 1,
-0.3362257, -1.483985, -2.827221, 0, 1, 0.2901961, 1,
-0.3353682, -0.1135961, -3.889528, 0, 1, 0.2980392, 1,
-0.3342954, -0.5881519, -2.896287, 0, 1, 0.3058824, 1,
-0.3258829, -0.8614575, -3.291114, 0, 1, 0.3098039, 1,
-0.321972, 1.134711, 0.6620399, 0, 1, 0.3176471, 1,
-0.3184719, 1.431768, 0.001993579, 0, 1, 0.3215686, 1,
-0.3115429, 0.4941083, -1.245194, 0, 1, 0.3294118, 1,
-0.3099548, -1.440046, -1.469601, 0, 1, 0.3333333, 1,
-0.3040931, 0.2898521, -1.722549, 0, 1, 0.3411765, 1,
-0.302527, -0.04110224, -0.4922543, 0, 1, 0.345098, 1,
-0.2955331, 1.628102, -0.789532, 0, 1, 0.3529412, 1,
-0.2895254, 0.7330669, -0.8676543, 0, 1, 0.3568628, 1,
-0.2882833, -0.07138868, -0.9237347, 0, 1, 0.3647059, 1,
-0.2860123, 1.571269, 0.4654903, 0, 1, 0.3686275, 1,
-0.2838671, 0.303908, -0.7767659, 0, 1, 0.3764706, 1,
-0.2838302, -3.001652, -2.248043, 0, 1, 0.3803922, 1,
-0.2804845, -0.09456608, -0.4234112, 0, 1, 0.3882353, 1,
-0.2795008, -0.3245081, -1.751313, 0, 1, 0.3921569, 1,
-0.2770081, -1.704575, -2.580206, 0, 1, 0.4, 1,
-0.2692435, -0.7337001, -1.99148, 0, 1, 0.4078431, 1,
-0.2666638, -1.23635, -2.982956, 0, 1, 0.4117647, 1,
-0.2592568, -0.292204, -3.691411, 0, 1, 0.4196078, 1,
-0.258922, -0.5798811, -3.077313, 0, 1, 0.4235294, 1,
-0.2540756, 0.434434, -1.243163, 0, 1, 0.4313726, 1,
-0.2383316, 0.2927281, -0.786809, 0, 1, 0.4352941, 1,
-0.2316222, 0.3090399, -1.572662, 0, 1, 0.4431373, 1,
-0.2313551, -0.4967259, -2.237169, 0, 1, 0.4470588, 1,
-0.2255006, 1.393701, -0.0006772349, 0, 1, 0.454902, 1,
-0.2209828, -0.1531009, -1.904056, 0, 1, 0.4588235, 1,
-0.2195005, 1.048038, -0.5303389, 0, 1, 0.4666667, 1,
-0.2191285, -0.09257223, -2.175528, 0, 1, 0.4705882, 1,
-0.2159957, 0.3771936, -1.138948, 0, 1, 0.4784314, 1,
-0.2156648, 0.2805803, -1.67922, 0, 1, 0.4823529, 1,
-0.2117791, 0.08791801, -0.2459064, 0, 1, 0.4901961, 1,
-0.2104827, 0.8847044, -0.1870433, 0, 1, 0.4941176, 1,
-0.20684, 1.99362, -0.818724, 0, 1, 0.5019608, 1,
-0.2044935, -0.04131732, -3.593315, 0, 1, 0.509804, 1,
-0.2026074, 0.3526872, -0.4779058, 0, 1, 0.5137255, 1,
-0.2023597, -0.2212129, -1.248845, 0, 1, 0.5215687, 1,
-0.2011401, 0.8064576, -1.983663, 0, 1, 0.5254902, 1,
-0.2002143, 0.554575, 0.06486447, 0, 1, 0.5333334, 1,
-0.1988375, -1.083333, -3.07662, 0, 1, 0.5372549, 1,
-0.1931156, -1.170629, -3.509896, 0, 1, 0.5450981, 1,
-0.1923534, -0.8182489, -2.438989, 0, 1, 0.5490196, 1,
-0.1844665, -1.15945, -3.644747, 0, 1, 0.5568628, 1,
-0.1829902, 1.109734, -0.4235159, 0, 1, 0.5607843, 1,
-0.1734752, 1.10586, 0.6711614, 0, 1, 0.5686275, 1,
-0.1713047, -0.4013017, -4.352535, 0, 1, 0.572549, 1,
-0.1691178, -1.059515, -3.810436, 0, 1, 0.5803922, 1,
-0.1682875, 0.3647765, 0.5311798, 0, 1, 0.5843138, 1,
-0.1668664, -0.2427104, -3.373961, 0, 1, 0.5921569, 1,
-0.1656981, -0.2301339, -3.073773, 0, 1, 0.5960785, 1,
-0.1603421, 0.443706, -0.8412779, 0, 1, 0.6039216, 1,
-0.1580619, -1.1183, -3.131145, 0, 1, 0.6117647, 1,
-0.1565779, 1.258372, 0.9546105, 0, 1, 0.6156863, 1,
-0.1529999, -1.401133, -2.190148, 0, 1, 0.6235294, 1,
-0.1479711, -0.3064742, -2.868355, 0, 1, 0.627451, 1,
-0.1419682, -0.3453895, -2.562804, 0, 1, 0.6352941, 1,
-0.1395166, -1.250233, -3.762796, 0, 1, 0.6392157, 1,
-0.1358271, -0.2112421, -4.066152, 0, 1, 0.6470588, 1,
-0.1309513, 0.5822078, 0.8791761, 0, 1, 0.6509804, 1,
-0.1305284, -1.286452, -3.617182, 0, 1, 0.6588235, 1,
-0.1300968, -0.3368468, -2.82653, 0, 1, 0.6627451, 1,
-0.1288171, 1.00792, -0.01941126, 0, 1, 0.6705883, 1,
-0.1250677, 0.402574, -0.837258, 0, 1, 0.6745098, 1,
-0.1230266, -0.8078185, -2.86966, 0, 1, 0.682353, 1,
-0.1216709, 1.389217, -0.8236361, 0, 1, 0.6862745, 1,
-0.1216077, -1.65304, -1.24325, 0, 1, 0.6941177, 1,
-0.1207167, -0.3080196, -2.52512, 0, 1, 0.7019608, 1,
-0.1205312, -0.06748422, -2.760162, 0, 1, 0.7058824, 1,
-0.117108, 0.000910475, -0.8389557, 0, 1, 0.7137255, 1,
-0.114599, -0.7136306, -2.227923, 0, 1, 0.7176471, 1,
-0.1144008, 0.178894, 1.201652, 0, 1, 0.7254902, 1,
-0.1120787, 0.0319736, -2.576029, 0, 1, 0.7294118, 1,
-0.1099328, 0.6367455, 0.4910185, 0, 1, 0.7372549, 1,
-0.1083928, -1.470258, -3.97683, 0, 1, 0.7411765, 1,
-0.1078466, -0.7274632, -3.037378, 0, 1, 0.7490196, 1,
-0.103718, -1.294214, -3.254066, 0, 1, 0.7529412, 1,
-0.1035788, -0.3397005, -1.879276, 0, 1, 0.7607843, 1,
-0.102253, -1.350916, -3.010117, 0, 1, 0.7647059, 1,
-0.1015957, -0.6479385, -2.831048, 0, 1, 0.772549, 1,
-0.1010892, -1.596827, -4.48384, 0, 1, 0.7764706, 1,
-0.09217058, 0.3827087, 1.677118, 0, 1, 0.7843137, 1,
-0.0826345, 0.8513032, -0.4942425, 0, 1, 0.7882353, 1,
-0.08096629, -2.985705, -2.814034, 0, 1, 0.7960784, 1,
-0.0800577, 0.8997132, -0.6524587, 0, 1, 0.8039216, 1,
-0.0796167, -0.9858858, -1.511416, 0, 1, 0.8078431, 1,
-0.07792506, -0.8745447, -3.270538, 0, 1, 0.8156863, 1,
-0.07746252, 1.08676, -0.2169996, 0, 1, 0.8196079, 1,
-0.07687959, -0.3267436, -3.814417, 0, 1, 0.827451, 1,
-0.07566385, -0.0616997, -3.317659, 0, 1, 0.8313726, 1,
-0.06540541, -0.7400389, -3.190798, 0, 1, 0.8392157, 1,
-0.06489719, -1.227347, -4.145574, 0, 1, 0.8431373, 1,
-0.05835401, -0.8230017, -2.473038, 0, 1, 0.8509804, 1,
-0.0546813, 0.1974153, -0.428328, 0, 1, 0.854902, 1,
-0.05393899, -0.2219708, -2.589737, 0, 1, 0.8627451, 1,
-0.04788455, -1.055288, -3.3869, 0, 1, 0.8666667, 1,
-0.04573064, 0.4847446, -0.6958767, 0, 1, 0.8745098, 1,
-0.04399539, 1.14914, 0.5362064, 0, 1, 0.8784314, 1,
-0.04331489, -0.8065295, -2.457186, 0, 1, 0.8862745, 1,
-0.04243798, 0.2987368, -1.298126, 0, 1, 0.8901961, 1,
-0.03190771, 0.5525357, -2.249758, 0, 1, 0.8980392, 1,
-0.02943243, 1.015075, 2.636499, 0, 1, 0.9058824, 1,
-0.02806487, -0.9126921, -4.398371, 0, 1, 0.9098039, 1,
-0.02559208, 2.186974, 0.7734181, 0, 1, 0.9176471, 1,
-0.02546195, 0.7967874, 0.3520411, 0, 1, 0.9215686, 1,
-0.02098996, -0.4244896, -3.781727, 0, 1, 0.9294118, 1,
-0.01736465, 1.50671, 1.050014, 0, 1, 0.9333333, 1,
-0.0138342, 1.371053, 0.008452816, 0, 1, 0.9411765, 1,
-0.005279332, -0.3631901, -3.108699, 0, 1, 0.945098, 1,
-0.003471375, -0.8311272, -3.248449, 0, 1, 0.9529412, 1,
-0.002722715, -0.5536497, -2.628758, 0, 1, 0.9568627, 1,
-0.001518956, 0.428433, -2.617019, 0, 1, 0.9647059, 1,
-0.0007711938, 0.8418214, 0.01598234, 0, 1, 0.9686275, 1,
0.01101002, -0.1187366, 5.391764, 0, 1, 0.9764706, 1,
0.01719184, -0.002321691, -0.7971838, 0, 1, 0.9803922, 1,
0.02241, 2.06721, -0.4802973, 0, 1, 0.9882353, 1,
0.02388653, -1.496891, 4.120687, 0, 1, 0.9921569, 1,
0.02464141, 1.91727, -0.4514814, 0, 1, 1, 1,
0.02683468, 1.178841, -1.549295, 0, 0.9921569, 1, 1,
0.02913112, 0.6746833, 1.204978, 0, 0.9882353, 1, 1,
0.02959438, 0.4357901, -0.0334351, 0, 0.9803922, 1, 1,
0.03387446, 0.2375594, 0.05861953, 0, 0.9764706, 1, 1,
0.03843702, 1.553248, 0.3027927, 0, 0.9686275, 1, 1,
0.03961456, 0.788752, 0.306035, 0, 0.9647059, 1, 1,
0.04261141, 1.619974, 1.711412, 0, 0.9568627, 1, 1,
0.04858469, 0.5901737, -0.4311, 0, 0.9529412, 1, 1,
0.04916847, -0.6986056, 3.550725, 0, 0.945098, 1, 1,
0.05170429, -2.565573, 3.684985, 0, 0.9411765, 1, 1,
0.05384405, -1.234665, 1.478992, 0, 0.9333333, 1, 1,
0.05451072, -0.7034713, 1.598355, 0, 0.9294118, 1, 1,
0.0551211, -1.08127, 2.22875, 0, 0.9215686, 1, 1,
0.06162904, 0.5591247, 1.099494, 0, 0.9176471, 1, 1,
0.06830291, -1.503166, 3.175847, 0, 0.9098039, 1, 1,
0.0688849, -1.0641, 3.819185, 0, 0.9058824, 1, 1,
0.07199465, 0.02468628, 0.5358887, 0, 0.8980392, 1, 1,
0.07396448, -0.002447269, 0.8219287, 0, 0.8901961, 1, 1,
0.07746046, 2.620707, -2.06142, 0, 0.8862745, 1, 1,
0.07900748, 1.324298, -1.100976, 0, 0.8784314, 1, 1,
0.08132625, -0.5382466, 3.228586, 0, 0.8745098, 1, 1,
0.08181156, -1.239372, 3.42581, 0, 0.8666667, 1, 1,
0.08407229, 1.545402, -0.1992187, 0, 0.8627451, 1, 1,
0.08827478, 1.142077, -1.090755, 0, 0.854902, 1, 1,
0.08947866, 1.1404, 0.9650789, 0, 0.8509804, 1, 1,
0.09036104, 1.326611, -0.3585715, 0, 0.8431373, 1, 1,
0.09592679, -1.445446, 4.301716, 0, 0.8392157, 1, 1,
0.1025435, -0.441393, 2.38293, 0, 0.8313726, 1, 1,
0.1057819, -0.5413399, 0.2341652, 0, 0.827451, 1, 1,
0.1072628, -0.4272051, 3.149381, 0, 0.8196079, 1, 1,
0.1077721, 0.7019392, -0.1491182, 0, 0.8156863, 1, 1,
0.1081768, -0.4901115, 4.328813, 0, 0.8078431, 1, 1,
0.108954, 1.892479, -0.01692784, 0, 0.8039216, 1, 1,
0.1098369, 1.872978, 0.2394809, 0, 0.7960784, 1, 1,
0.1117633, -1.626588, 2.585248, 0, 0.7882353, 1, 1,
0.1147703, -1.670968, 1.93301, 0, 0.7843137, 1, 1,
0.1193293, -1.136195, 4.891637, 0, 0.7764706, 1, 1,
0.1259542, -1.04134, 2.808178, 0, 0.772549, 1, 1,
0.1275001, -0.3365822, 2.593899, 0, 0.7647059, 1, 1,
0.1292587, -0.4644805, 4.168869, 0, 0.7607843, 1, 1,
0.1315209, -0.587455, 3.28321, 0, 0.7529412, 1, 1,
0.1319462, 0.245998, 0.6122308, 0, 0.7490196, 1, 1,
0.1332211, -0.1101108, 3.356231, 0, 0.7411765, 1, 1,
0.133912, -0.2300081, 1.505165, 0, 0.7372549, 1, 1,
0.1368315, 0.4853097, 0.1511541, 0, 0.7294118, 1, 1,
0.1397733, -0.4247743, 1.953999, 0, 0.7254902, 1, 1,
0.1398309, 1.999936, 0.1686848, 0, 0.7176471, 1, 1,
0.1419508, -0.517495, 2.038101, 0, 0.7137255, 1, 1,
0.1421951, -0.3389049, 3.480068, 0, 0.7058824, 1, 1,
0.1440473, -0.7389227, 4.339824, 0, 0.6980392, 1, 1,
0.1457764, 0.234936, 2.29952, 0, 0.6941177, 1, 1,
0.1532821, -1.664139, 3.429915, 0, 0.6862745, 1, 1,
0.1544928, -1.215099, 3.29753, 0, 0.682353, 1, 1,
0.1561767, -0.4139677, 3.442181, 0, 0.6745098, 1, 1,
0.1566418, 0.02846656, 3.079109, 0, 0.6705883, 1, 1,
0.1568022, -0.1213336, 1.789164, 0, 0.6627451, 1, 1,
0.1585885, 0.3556237, 0.4818478, 0, 0.6588235, 1, 1,
0.1588259, -0.1165076, 3.884913, 0, 0.6509804, 1, 1,
0.1596988, 1.601059, 1.363421, 0, 0.6470588, 1, 1,
0.1636672, 0.7366428, -0.07766093, 0, 0.6392157, 1, 1,
0.1637603, 0.1283724, 1.698649, 0, 0.6352941, 1, 1,
0.1661544, 1.844945, 1.126999, 0, 0.627451, 1, 1,
0.1690503, 0.02268148, 2.221289, 0, 0.6235294, 1, 1,
0.1709606, 0.002065353, 0.8411672, 0, 0.6156863, 1, 1,
0.1718964, -0.60726, 2.825891, 0, 0.6117647, 1, 1,
0.1736696, -1.802887, 2.676036, 0, 0.6039216, 1, 1,
0.1743235, 0.560581, -1.289699, 0, 0.5960785, 1, 1,
0.1761859, -0.05667453, 2.021597, 0, 0.5921569, 1, 1,
0.1774704, -2.260795, 5.231983, 0, 0.5843138, 1, 1,
0.1780064, 1.728497, 1.291104, 0, 0.5803922, 1, 1,
0.1825655, -1.562994, 3.048695, 0, 0.572549, 1, 1,
0.1826483, -1.712127, 2.534988, 0, 0.5686275, 1, 1,
0.1835738, 0.01967638, 1.816084, 0, 0.5607843, 1, 1,
0.1840683, 0.1399709, 0.1660347, 0, 0.5568628, 1, 1,
0.189065, 0.6520923, 0.435763, 0, 0.5490196, 1, 1,
0.1892951, 0.2626504, -0.4714721, 0, 0.5450981, 1, 1,
0.1893014, 2.186251, -0.4954294, 0, 0.5372549, 1, 1,
0.1904539, -0.2890714, 2.372018, 0, 0.5333334, 1, 1,
0.1922324, 0.2727578, 1.117661, 0, 0.5254902, 1, 1,
0.197594, -0.3086226, 4.017689, 0, 0.5215687, 1, 1,
0.1977963, 0.1734164, 1.306968, 0, 0.5137255, 1, 1,
0.2011688, 1.060129, -0.02643746, 0, 0.509804, 1, 1,
0.2046562, 0.8844225, 0.1796733, 0, 0.5019608, 1, 1,
0.2103074, -1.591213, 1.863348, 0, 0.4941176, 1, 1,
0.2145942, -0.2641061, 2.114978, 0, 0.4901961, 1, 1,
0.2192826, 0.3504556, 0.7865054, 0, 0.4823529, 1, 1,
0.2236042, -0.01108289, 1.700408, 0, 0.4784314, 1, 1,
0.224694, -0.4704379, 2.592118, 0, 0.4705882, 1, 1,
0.2247754, 0.8809292, -1.564921, 0, 0.4666667, 1, 1,
0.2312046, 0.168585, 0.9011526, 0, 0.4588235, 1, 1,
0.2392972, -0.4420325, 2.836886, 0, 0.454902, 1, 1,
0.2439071, 0.7849892, -0.6428984, 0, 0.4470588, 1, 1,
0.2440896, -1.273582, 2.112437, 0, 0.4431373, 1, 1,
0.2517532, -0.8541229, 4.40103, 0, 0.4352941, 1, 1,
0.2517859, 0.1527927, 2.342301, 0, 0.4313726, 1, 1,
0.2529559, -1.657244, 1.891762, 0, 0.4235294, 1, 1,
0.2558158, -0.4919071, 1.245526, 0, 0.4196078, 1, 1,
0.262251, 0.5351123, -0.7349916, 0, 0.4117647, 1, 1,
0.2631054, 1.492999, -0.8204079, 0, 0.4078431, 1, 1,
0.2638755, 0.5300165, -0.001650286, 0, 0.4, 1, 1,
0.264215, 0.9079361, -0.7361075, 0, 0.3921569, 1, 1,
0.267271, 2.495423, 0.8471912, 0, 0.3882353, 1, 1,
0.269047, 0.2937317, 0.9802021, 0, 0.3803922, 1, 1,
0.2696486, 0.4575507, -2.427422e-06, 0, 0.3764706, 1, 1,
0.2720106, 1.59716, 2.452649, 0, 0.3686275, 1, 1,
0.2837398, 0.08153672, 0.4386187, 0, 0.3647059, 1, 1,
0.283822, -0.01363858, 2.711226, 0, 0.3568628, 1, 1,
0.2841297, -1.910868, 4.254704, 0, 0.3529412, 1, 1,
0.2859439, 0.2093528, 1.49141, 0, 0.345098, 1, 1,
0.2884629, -0.4290045, 2.000036, 0, 0.3411765, 1, 1,
0.2906764, 0.04069984, 1.210695, 0, 0.3333333, 1, 1,
0.2911609, -0.8073971, 1.582101, 0, 0.3294118, 1, 1,
0.2940744, 0.02755878, 0.7116912, 0, 0.3215686, 1, 1,
0.2952676, 1.420833, 0.2538537, 0, 0.3176471, 1, 1,
0.3010899, -1.930354, 2.88779, 0, 0.3098039, 1, 1,
0.3029263, -2.421696, 1.419488, 0, 0.3058824, 1, 1,
0.3045559, 1.317313, 1.648982, 0, 0.2980392, 1, 1,
0.3075792, -1.310685, 3.441863, 0, 0.2901961, 1, 1,
0.3079314, -0.5920736, 2.03459, 0, 0.2862745, 1, 1,
0.311583, 0.2967, 0.8189817, 0, 0.2784314, 1, 1,
0.3159596, 0.7203127, 2.488475, 0, 0.2745098, 1, 1,
0.3162348, -1.555184, 4.404678, 0, 0.2666667, 1, 1,
0.3203006, 1.180037, 1.916136, 0, 0.2627451, 1, 1,
0.3214894, 0.7970371, 0.7472462, 0, 0.254902, 1, 1,
0.3217505, -1.972606, 3.401121, 0, 0.2509804, 1, 1,
0.3224336, 0.03611707, 0.3270673, 0, 0.2431373, 1, 1,
0.3254092, 1.523788, -0.204216, 0, 0.2392157, 1, 1,
0.3269956, 1.492091, -0.03145765, 0, 0.2313726, 1, 1,
0.3380956, 0.7952222, 1.62107, 0, 0.227451, 1, 1,
0.3385758, -2.43514, 3.791696, 0, 0.2196078, 1, 1,
0.3386455, 0.5049638, 1.042547, 0, 0.2156863, 1, 1,
0.3419327, 0.1414966, 2.369102, 0, 0.2078431, 1, 1,
0.3440496, 1.545581, 0.7173854, 0, 0.2039216, 1, 1,
0.3501692, 1.135073, 0.5345205, 0, 0.1960784, 1, 1,
0.3508648, 0.5426908, 1.975951, 0, 0.1882353, 1, 1,
0.3510348, 1.17149, 0.2102722, 0, 0.1843137, 1, 1,
0.3582841, 1.60976, 1.150642, 0, 0.1764706, 1, 1,
0.360129, 0.9683032, -0.7502375, 0, 0.172549, 1, 1,
0.3614703, -0.1606581, 2.731027, 0, 0.1647059, 1, 1,
0.3635029, 0.8645632, 0.120401, 0, 0.1607843, 1, 1,
0.3729943, -0.5298467, 2.53728, 0, 0.1529412, 1, 1,
0.3739731, 0.6309315, 1.799706, 0, 0.1490196, 1, 1,
0.3740949, -0.8346944, 2.955342, 0, 0.1411765, 1, 1,
0.3745713, -0.04278187, 1.343032, 0, 0.1372549, 1, 1,
0.3753675, -0.01083156, 2.229021, 0, 0.1294118, 1, 1,
0.3768737, -0.4582656, 1.92305, 0, 0.1254902, 1, 1,
0.3807773, -0.5607733, 1.046711, 0, 0.1176471, 1, 1,
0.3852166, 0.2731944, 1.925949, 0, 0.1137255, 1, 1,
0.3853812, 0.7020236, 0.7661939, 0, 0.1058824, 1, 1,
0.3864121, 1.875447, -0.5923498, 0, 0.09803922, 1, 1,
0.3916584, 1.021676, 0.7858856, 0, 0.09411765, 1, 1,
0.3930721, -1.784376, 3.605532, 0, 0.08627451, 1, 1,
0.3950121, 1.281139, -0.4190804, 0, 0.08235294, 1, 1,
0.3953553, -0.6020393, 2.180207, 0, 0.07450981, 1, 1,
0.3957256, -0.0372455, 1.723569, 0, 0.07058824, 1, 1,
0.3970911, 0.00344261, 2.285438, 0, 0.0627451, 1, 1,
0.3971669, 1.838332, 1.393747, 0, 0.05882353, 1, 1,
0.3976189, 0.1463368, 1.800923, 0, 0.05098039, 1, 1,
0.4015877, -1.63916, 1.639171, 0, 0.04705882, 1, 1,
0.4063765, -0.1233646, 2.557898, 0, 0.03921569, 1, 1,
0.4083115, -1.472721, 3.846826, 0, 0.03529412, 1, 1,
0.4110532, 1.350473, 1.269939, 0, 0.02745098, 1, 1,
0.4131883, 0.3685985, 1.046454, 0, 0.02352941, 1, 1,
0.4138363, -2.014482, 3.11414, 0, 0.01568628, 1, 1,
0.4190641, -1.962133, 2.703787, 0, 0.01176471, 1, 1,
0.4198708, -0.2533502, 2.520855, 0, 0.003921569, 1, 1,
0.4211409, 0.1928676, 1.117405, 0.003921569, 0, 1, 1,
0.4222223, 0.8644811, 1.995953, 0.007843138, 0, 1, 1,
0.4275421, -0.3417401, 2.178243, 0.01568628, 0, 1, 1,
0.4296402, -0.5323095, 3.736072, 0.01960784, 0, 1, 1,
0.4320775, 0.212424, 1.132086, 0.02745098, 0, 1, 1,
0.4414845, 0.3559104, 0.9583427, 0.03137255, 0, 1, 1,
0.4428257, 0.8698779, 1.22, 0.03921569, 0, 1, 1,
0.4436285, -1.405332, 2.913102, 0.04313726, 0, 1, 1,
0.4467271, 0.1898516, 0.9955125, 0.05098039, 0, 1, 1,
0.4476896, 1.36648, 0.2784959, 0.05490196, 0, 1, 1,
0.4481193, -0.5578126, 1.387383, 0.0627451, 0, 1, 1,
0.4527296, 0.359179, 1.242737, 0.06666667, 0, 1, 1,
0.4620386, 0.4483098, 1.30898, 0.07450981, 0, 1, 1,
0.4658001, -0.1619807, 1.810596, 0.07843138, 0, 1, 1,
0.4670136, 0.3550135, 0.1647921, 0.08627451, 0, 1, 1,
0.467622, -0.9849095, 3.401575, 0.09019608, 0, 1, 1,
0.4682591, -1.497131, 2.437262, 0.09803922, 0, 1, 1,
0.4686007, 2.413483, 2.270416, 0.1058824, 0, 1, 1,
0.4714836, -0.6921992, 3.095623, 0.1098039, 0, 1, 1,
0.4719738, 0.1810669, 0.8044477, 0.1176471, 0, 1, 1,
0.472245, -0.6123686, 2.541349, 0.1215686, 0, 1, 1,
0.4732239, -1.305483, 3.717697, 0.1294118, 0, 1, 1,
0.478652, 1.948697, 1.663819, 0.1333333, 0, 1, 1,
0.4812699, 1.645782, 0.08012822, 0.1411765, 0, 1, 1,
0.4850853, -1.439215, 3.825414, 0.145098, 0, 1, 1,
0.4882475, -0.9637834, 2.507783, 0.1529412, 0, 1, 1,
0.4906134, 0.2157556, 1.040854, 0.1568628, 0, 1, 1,
0.4920516, -0.2044816, 3.304873, 0.1647059, 0, 1, 1,
0.4940138, -1.804994, 3.178366, 0.1686275, 0, 1, 1,
0.4998585, -2.006042, 1.768953, 0.1764706, 0, 1, 1,
0.5015699, -0.6091626, -0.07808388, 0.1803922, 0, 1, 1,
0.5058795, -1.197287, 2.957328, 0.1882353, 0, 1, 1,
0.5064085, 0.6295467, 0.8799955, 0.1921569, 0, 1, 1,
0.5073441, 0.8208082, -2.278303, 0.2, 0, 1, 1,
0.5090013, -2.122633, 1.950051, 0.2078431, 0, 1, 1,
0.5114473, 1.080966, 0.7668452, 0.2117647, 0, 1, 1,
0.5156246, -0.4940444, 0.4673882, 0.2196078, 0, 1, 1,
0.5231629, 0.5969182, 0.7395756, 0.2235294, 0, 1, 1,
0.5274262, -0.09862135, 1.376404, 0.2313726, 0, 1, 1,
0.533717, -0.5958754, 3.551037, 0.2352941, 0, 1, 1,
0.5408309, -0.9359164, 1.828147, 0.2431373, 0, 1, 1,
0.5410385, 0.1555962, -0.02896978, 0.2470588, 0, 1, 1,
0.5421742, -0.5261123, 3.186655, 0.254902, 0, 1, 1,
0.5434795, 1.162172, -1.220941, 0.2588235, 0, 1, 1,
0.5475987, 0.4798057, -0.4342189, 0.2666667, 0, 1, 1,
0.5498838, -0.7255994, 2.013132, 0.2705882, 0, 1, 1,
0.5514066, 0.09961808, 1.261309, 0.2784314, 0, 1, 1,
0.5520792, 0.2082167, 1.089927, 0.282353, 0, 1, 1,
0.5556311, 0.04021029, 0.535407, 0.2901961, 0, 1, 1,
0.5583978, 0.5219292, 2.407558, 0.2941177, 0, 1, 1,
0.5628684, -1.634231, 3.348471, 0.3019608, 0, 1, 1,
0.5641393, 0.5586914, -0.5295998, 0.3098039, 0, 1, 1,
0.5708829, 0.3037764, 1.054177, 0.3137255, 0, 1, 1,
0.573674, 0.2427485, -0.6239398, 0.3215686, 0, 1, 1,
0.5799098, 0.2199818, 1.467241, 0.3254902, 0, 1, 1,
0.5840168, 2.122811, -0.5129508, 0.3333333, 0, 1, 1,
0.5856599, -0.9798202, 2.787432, 0.3372549, 0, 1, 1,
0.5875592, 0.4198719, 1.185786, 0.345098, 0, 1, 1,
0.5899593, -2.154006, 3.415834, 0.3490196, 0, 1, 1,
0.5906962, 0.6839908, 0.4481255, 0.3568628, 0, 1, 1,
0.5910369, -0.6830434, 1.952022, 0.3607843, 0, 1, 1,
0.5995289, -0.4646372, 1.648278, 0.3686275, 0, 1, 1,
0.5998059, 0.09538773, 2.376463, 0.372549, 0, 1, 1,
0.6011995, -1.588068, 3.153201, 0.3803922, 0, 1, 1,
0.6036423, -0.09047332, 2.751208, 0.3843137, 0, 1, 1,
0.6081356, -0.3373186, 1.781605, 0.3921569, 0, 1, 1,
0.6187356, 0.8401227, 0.5794371, 0.3960784, 0, 1, 1,
0.6199276, 0.9679079, 1.061869, 0.4039216, 0, 1, 1,
0.6202483, 0.4183247, 1.90558, 0.4117647, 0, 1, 1,
0.6287895, -0.2483567, 0.3894178, 0.4156863, 0, 1, 1,
0.6288251, -0.4779608, 1.566823, 0.4235294, 0, 1, 1,
0.6330736, 0.1359357, 0.2147864, 0.427451, 0, 1, 1,
0.634422, 0.907686, -0.1157608, 0.4352941, 0, 1, 1,
0.6359673, 0.9252124, 0.2526869, 0.4392157, 0, 1, 1,
0.6369897, 0.06419505, 3.266478, 0.4470588, 0, 1, 1,
0.6421417, -0.6739526, 2.217063, 0.4509804, 0, 1, 1,
0.6426867, 0.07148983, 3.841454, 0.4588235, 0, 1, 1,
0.6568049, 0.6761721, 0.7541606, 0.4627451, 0, 1, 1,
0.6697582, 1.605416, 1.458067, 0.4705882, 0, 1, 1,
0.6736994, 2.405384, 1.215963, 0.4745098, 0, 1, 1,
0.6781052, -0.8708521, 1.159247, 0.4823529, 0, 1, 1,
0.6792617, 0.4923667, 1.913291, 0.4862745, 0, 1, 1,
0.6796559, -4.469793, 2.040634, 0.4941176, 0, 1, 1,
0.6797144, 0.3549497, 1.988071, 0.5019608, 0, 1, 1,
0.6821982, 1.280092, 0.6207756, 0.5058824, 0, 1, 1,
0.6823767, -0.9074334, 2.356756, 0.5137255, 0, 1, 1,
0.6869007, -0.817637, 1.753033, 0.5176471, 0, 1, 1,
0.6881049, -0.4980679, 1.633773, 0.5254902, 0, 1, 1,
0.6906147, -0.8814515, 1.725907, 0.5294118, 0, 1, 1,
0.691353, -0.7457065, 1.845943, 0.5372549, 0, 1, 1,
0.6913658, 2.552266, -0.7466795, 0.5411765, 0, 1, 1,
0.7030744, -0.6418479, 2.502198, 0.5490196, 0, 1, 1,
0.7069401, 0.7702096, -0.9477825, 0.5529412, 0, 1, 1,
0.7089036, -0.8211517, 1.63609, 0.5607843, 0, 1, 1,
0.7097619, 1.057256, 1.464267, 0.5647059, 0, 1, 1,
0.7131309, 0.6365398, 1.674244, 0.572549, 0, 1, 1,
0.7224031, -1.341213, 2.900455, 0.5764706, 0, 1, 1,
0.7260372, -0.9002702, 1.834843, 0.5843138, 0, 1, 1,
0.7327657, 1.771907, 0.9642734, 0.5882353, 0, 1, 1,
0.7342791, 0.8504726, 1.299467, 0.5960785, 0, 1, 1,
0.7368652, -0.2685144, 1.903568, 0.6039216, 0, 1, 1,
0.7374195, 1.131843, -0.8270242, 0.6078432, 0, 1, 1,
0.7385325, -1.355674, 3.09389, 0.6156863, 0, 1, 1,
0.740783, 0.3338305, 2.118061, 0.6196079, 0, 1, 1,
0.7427335, 0.3064626, 0.9136159, 0.627451, 0, 1, 1,
0.755868, 1.232967, 1.234254, 0.6313726, 0, 1, 1,
0.7572642, 0.4597564, -0.960811, 0.6392157, 0, 1, 1,
0.758373, -1.284201, 4.788899, 0.6431373, 0, 1, 1,
0.7598194, 0.2333099, 0.9733634, 0.6509804, 0, 1, 1,
0.7672122, -0.1041176, 0.932048, 0.654902, 0, 1, 1,
0.7681752, 0.7603868, 1.026483, 0.6627451, 0, 1, 1,
0.779202, 0.5698657, 1.318567, 0.6666667, 0, 1, 1,
0.7796935, 1.524333, -0.3575003, 0.6745098, 0, 1, 1,
0.7841793, -0.5213943, 3.179842, 0.6784314, 0, 1, 1,
0.7847766, -0.8278494, 3.424013, 0.6862745, 0, 1, 1,
0.7884641, 0.0796361, 1.544082, 0.6901961, 0, 1, 1,
0.7900023, -0.2480948, 2.886312, 0.6980392, 0, 1, 1,
0.7945452, 0.7250707, 1.4288, 0.7058824, 0, 1, 1,
0.7946134, -0.5743751, 3.091819, 0.7098039, 0, 1, 1,
0.7958642, -0.9471678, 2.704807, 0.7176471, 0, 1, 1,
0.7980791, -0.9928936, 0.5303884, 0.7215686, 0, 1, 1,
0.7996796, -0.8776603, 4.327637, 0.7294118, 0, 1, 1,
0.8048757, -0.2116714, 1.904576, 0.7333333, 0, 1, 1,
0.8102269, -0.1138542, 1.881691, 0.7411765, 0, 1, 1,
0.8111066, 0.08520933, 2.520381, 0.7450981, 0, 1, 1,
0.8112581, -0.2304516, 2.000122, 0.7529412, 0, 1, 1,
0.8248746, 0.2608021, 2.112691, 0.7568628, 0, 1, 1,
0.8261522, -2.292641, 4.277427, 0.7647059, 0, 1, 1,
0.8264273, -1.710166, 1.792795, 0.7686275, 0, 1, 1,
0.8440225, -0.05562859, 0.461985, 0.7764706, 0, 1, 1,
0.8505878, -0.04230835, 2.774978, 0.7803922, 0, 1, 1,
0.8512517, 1.472662, 1.477869, 0.7882353, 0, 1, 1,
0.8566452, -0.3337106, 1.781813, 0.7921569, 0, 1, 1,
0.8607042, -0.1341937, 1.953419, 0.8, 0, 1, 1,
0.8627344, -0.9073668, 1.676142, 0.8078431, 0, 1, 1,
0.8665841, -1.329885, 3.889115, 0.8117647, 0, 1, 1,
0.8671649, 0.008929549, -0.3727194, 0.8196079, 0, 1, 1,
0.8752087, -0.692965, 1.091517, 0.8235294, 0, 1, 1,
0.881774, 1.42241, 0.2574836, 0.8313726, 0, 1, 1,
0.8851973, -0.0273652, 3.374501, 0.8352941, 0, 1, 1,
0.8884571, 1.661399, 0.324205, 0.8431373, 0, 1, 1,
0.8935047, -2.143587, 3.281032, 0.8470588, 0, 1, 1,
0.8940942, -0.355765, 1.842981, 0.854902, 0, 1, 1,
0.899323, -0.7404284, 1.179119, 0.8588235, 0, 1, 1,
0.9025793, 0.8592128, 1.233014, 0.8666667, 0, 1, 1,
0.9036322, -0.08812731, 1.137276, 0.8705882, 0, 1, 1,
0.9058012, -1.944771, 3.84888, 0.8784314, 0, 1, 1,
0.9071987, 0.2434239, 1.641458, 0.8823529, 0, 1, 1,
0.9074165, -0.8018346, 1.06702, 0.8901961, 0, 1, 1,
0.914348, -1.706793, 1.186443, 0.8941177, 0, 1, 1,
0.9147862, 0.4401648, 0.9159524, 0.9019608, 0, 1, 1,
0.9155903, 0.6905825, 1.681249, 0.9098039, 0, 1, 1,
0.9169514, -0.2469797, 2.667033, 0.9137255, 0, 1, 1,
0.9186389, 0.8372706, 0.7243931, 0.9215686, 0, 1, 1,
0.920453, 1.040538, 1.626127, 0.9254902, 0, 1, 1,
0.9228286, -0.7884036, 1.971461, 0.9333333, 0, 1, 1,
0.9275013, -0.8327209, 4.147417, 0.9372549, 0, 1, 1,
0.9302334, -0.3069263, 0.4291456, 0.945098, 0, 1, 1,
0.9327742, 0.2904491, 2.039328, 0.9490196, 0, 1, 1,
0.9329808, -1.050696, 3.940313, 0.9568627, 0, 1, 1,
0.9366603, -1.522527, 3.352045, 0.9607843, 0, 1, 1,
0.9380594, -0.6768346, 2.393739, 0.9686275, 0, 1, 1,
0.9391647, -0.217343, 2.044115, 0.972549, 0, 1, 1,
0.9407417, 1.802538, 0.7267448, 0.9803922, 0, 1, 1,
0.9447606, 0.6235164, 0.6367758, 0.9843137, 0, 1, 1,
0.9457081, 1.04449, 1.053343, 0.9921569, 0, 1, 1,
0.9470416, -0.03484067, 0.4881337, 0.9960784, 0, 1, 1,
0.9471677, 0.2397037, 2.022332, 1, 0, 0.9960784, 1,
0.9489468, 0.5765905, 0.5100194, 1, 0, 0.9882353, 1,
0.9527717, 0.395384, 2.066701, 1, 0, 0.9843137, 1,
0.9532025, -1.000634, 5.253736, 1, 0, 0.9764706, 1,
0.9603922, -0.2126846, 2.016846, 1, 0, 0.972549, 1,
0.963996, 1.019999, 2.893702, 1, 0, 0.9647059, 1,
0.9690818, 0.5695011, 1.676478, 1, 0, 0.9607843, 1,
0.9774913, -1.234583, 2.796415, 1, 0, 0.9529412, 1,
0.9778214, -1.103002, 2.636223, 1, 0, 0.9490196, 1,
0.9830549, 0.4131115, 2.092584, 1, 0, 0.9411765, 1,
0.9838424, 0.6466407, 1.435004, 1, 0, 0.9372549, 1,
0.9839998, 0.6380602, 2.838776, 1, 0, 0.9294118, 1,
0.9874277, 1.12179, -1.61387, 1, 0, 0.9254902, 1,
0.9875695, -0.2293085, 0.8412647, 1, 0, 0.9176471, 1,
0.9893901, -0.6881278, 2.753538, 1, 0, 0.9137255, 1,
0.9899407, -0.5274546, 1.97158, 1, 0, 0.9058824, 1,
1.003907, -0.3641239, 2.863592, 1, 0, 0.9019608, 1,
1.007929, -0.3097909, 1.280675, 1, 0, 0.8941177, 1,
1.007939, 1.53954, 1.716721, 1, 0, 0.8862745, 1,
1.014203, -0.3834922, 3.246588, 1, 0, 0.8823529, 1,
1.020116, -0.07323384, 1.319247, 1, 0, 0.8745098, 1,
1.025296, -1.609287, 2.015596, 1, 0, 0.8705882, 1,
1.026591, -1.760204, 1.356637, 1, 0, 0.8627451, 1,
1.044984, -1.131617, 1.740456, 1, 0, 0.8588235, 1,
1.047379, 2.230181, -0.03271307, 1, 0, 0.8509804, 1,
1.048604, 1.081516, 0.04994328, 1, 0, 0.8470588, 1,
1.051851, -2.177969, 4.299262, 1, 0, 0.8392157, 1,
1.063381, -0.8917757, 2.108653, 1, 0, 0.8352941, 1,
1.063827, 0.7296468, -0.5765838, 1, 0, 0.827451, 1,
1.06938, 0.1963878, 2.587249, 1, 0, 0.8235294, 1,
1.079197, 1.112974, 0.7414883, 1, 0, 0.8156863, 1,
1.08331, 1.733233, 0.8715304, 1, 0, 0.8117647, 1,
1.083679, 1.550471, -0.1970206, 1, 0, 0.8039216, 1,
1.084779, -0.3474754, 0.4735604, 1, 0, 0.7960784, 1,
1.097001, -1.690378, 2.121506, 1, 0, 0.7921569, 1,
1.103189, -0.6301264, 2.822703, 1, 0, 0.7843137, 1,
1.111431, -2.211857, 2.83847, 1, 0, 0.7803922, 1,
1.127376, 0.7936332, 2.220193, 1, 0, 0.772549, 1,
1.127635, 0.4348854, 0.6610297, 1, 0, 0.7686275, 1,
1.131937, 0.3689425, 2.393438, 1, 0, 0.7607843, 1,
1.136753, 0.8430944, -0.1853254, 1, 0, 0.7568628, 1,
1.139123, -0.5702965, 1.068174, 1, 0, 0.7490196, 1,
1.14007, -0.3550787, 1.891257, 1, 0, 0.7450981, 1,
1.144261, 0.4210883, 2.216545, 1, 0, 0.7372549, 1,
1.145775, 0.2824816, 0.4277168, 1, 0, 0.7333333, 1,
1.150193, 0.7485669, 1.372589, 1, 0, 0.7254902, 1,
1.152683, -0.6389732, 2.348987, 1, 0, 0.7215686, 1,
1.159667, -0.3047304, 0.8238541, 1, 0, 0.7137255, 1,
1.160726, 0.0001776623, 0.9782163, 1, 0, 0.7098039, 1,
1.177093, -0.7779139, 1.968627, 1, 0, 0.7019608, 1,
1.178455, -0.7835241, 2.894239, 1, 0, 0.6941177, 1,
1.184365, 0.6297054, 0.03699324, 1, 0, 0.6901961, 1,
1.188751, -0.9928908, 1.434828, 1, 0, 0.682353, 1,
1.204759, 0.8588364, 1.249088, 1, 0, 0.6784314, 1,
1.212175, 0.2621245, 0.8672101, 1, 0, 0.6705883, 1,
1.212398, -0.7405167, 2.575675, 1, 0, 0.6666667, 1,
1.213768, -2.52871, 3.01888, 1, 0, 0.6588235, 1,
1.229394, 1.808586, -0.1007937, 1, 0, 0.654902, 1,
1.229974, 0.9279444, -0.9409983, 1, 0, 0.6470588, 1,
1.230475, 1.398428, 1.370172, 1, 0, 0.6431373, 1,
1.230548, -0.8934698, 1.497945, 1, 0, 0.6352941, 1,
1.236051, -1.645656, 2.634107, 1, 0, 0.6313726, 1,
1.237813, 2.998916, 0.04797765, 1, 0, 0.6235294, 1,
1.239398, -1.655317, 2.694042, 1, 0, 0.6196079, 1,
1.250883, -0.2897173, 1.392298, 1, 0, 0.6117647, 1,
1.25822, -0.385881, 2.503815, 1, 0, 0.6078432, 1,
1.281583, -0.5135812, 1.244772, 1, 0, 0.6, 1,
1.282815, 0.2715074, 1.883452, 1, 0, 0.5921569, 1,
1.289, 3.291153, 0.9032814, 1, 0, 0.5882353, 1,
1.290187, 1.632237, 0.3581365, 1, 0, 0.5803922, 1,
1.294296, 0.1224094, 0.4141856, 1, 0, 0.5764706, 1,
1.301917, 0.7493005, 0.4787638, 1, 0, 0.5686275, 1,
1.317219, 1.380505, 0.8694988, 1, 0, 0.5647059, 1,
1.318371, -0.637742, 1.78669, 1, 0, 0.5568628, 1,
1.319435, 0.5978554, 1.579982, 1, 0, 0.5529412, 1,
1.320846, 0.706247, -0.8894539, 1, 0, 0.5450981, 1,
1.327086, 0.8656071, 1.886012, 1, 0, 0.5411765, 1,
1.335298, -0.5767282, 0.830672, 1, 0, 0.5333334, 1,
1.358986, 0.7989459, 0.6097606, 1, 0, 0.5294118, 1,
1.362632, 2.116791, 1.790855, 1, 0, 0.5215687, 1,
1.376296, -0.6228382, 1.702675, 1, 0, 0.5176471, 1,
1.381574, 1.148096, 0.06347763, 1, 0, 0.509804, 1,
1.38316, -0.3326892, 2.827067, 1, 0, 0.5058824, 1,
1.39903, 1.435588, -0.3374173, 1, 0, 0.4980392, 1,
1.40039, -0.08590759, 0.7883955, 1, 0, 0.4901961, 1,
1.408074, 0.9453015, 0.721217, 1, 0, 0.4862745, 1,
1.426238, -0.4244388, 0.5361001, 1, 0, 0.4784314, 1,
1.426806, -0.5335948, 1.837064, 1, 0, 0.4745098, 1,
1.426823, 1.168156, 1.68061, 1, 0, 0.4666667, 1,
1.42924, -0.248409, 4.024652, 1, 0, 0.4627451, 1,
1.434678, -0.4749456, 1.232986, 1, 0, 0.454902, 1,
1.438133, 2.634999, 0.9391298, 1, 0, 0.4509804, 1,
1.440651, 1.359606, 1.349283, 1, 0, 0.4431373, 1,
1.447284, 2.053613, -0.1456118, 1, 0, 0.4392157, 1,
1.451058, 0.2302041, 0.5014393, 1, 0, 0.4313726, 1,
1.454436, 0.8870273, 0.3147274, 1, 0, 0.427451, 1,
1.457415, 1.50581, 0.04509172, 1, 0, 0.4196078, 1,
1.457549, -1.870251, 2.245733, 1, 0, 0.4156863, 1,
1.467954, 0.5922728, 1.859547, 1, 0, 0.4078431, 1,
1.469021, -0.08975799, 2.784489, 1, 0, 0.4039216, 1,
1.484396, -0.630193, 2.971533, 1, 0, 0.3960784, 1,
1.484595, 0.7050161, 1.217612, 1, 0, 0.3882353, 1,
1.488277, 0.3221295, -0.03318292, 1, 0, 0.3843137, 1,
1.502162, -0.1030811, 2.335284, 1, 0, 0.3764706, 1,
1.522404, 0.3742496, 0.7884477, 1, 0, 0.372549, 1,
1.523306, -0.5613275, 3.473052, 1, 0, 0.3647059, 1,
1.559262, 0.04161085, 2.704461, 1, 0, 0.3607843, 1,
1.562973, -0.9979577, 2.558937, 1, 0, 0.3529412, 1,
1.578705, -0.5678228, 2.337315, 1, 0, 0.3490196, 1,
1.58915, -0.7559991, 2.666737, 1, 0, 0.3411765, 1,
1.593933, 0.334204, 0.6270167, 1, 0, 0.3372549, 1,
1.602672, 0.2052288, 3.193754, 1, 0, 0.3294118, 1,
1.610519, 0.9740814, 0.7168972, 1, 0, 0.3254902, 1,
1.623558, 1.015655, 1.692785, 1, 0, 0.3176471, 1,
1.627718, 0.2518634, 1.803222, 1, 0, 0.3137255, 1,
1.633611, 1.150176, 1.100016, 1, 0, 0.3058824, 1,
1.636172, -0.9284123, 4.533319, 1, 0, 0.2980392, 1,
1.642149, 0.7519904, 2.12578, 1, 0, 0.2941177, 1,
1.65002, 1.695549, 0.5881376, 1, 0, 0.2862745, 1,
1.65123, -1.53345, 0.6856677, 1, 0, 0.282353, 1,
1.655967, -0.7976177, 2.669335, 1, 0, 0.2745098, 1,
1.662986, 0.568624, -0.05495182, 1, 0, 0.2705882, 1,
1.705439, -1.837639, 1.428343, 1, 0, 0.2627451, 1,
1.716346, -0.1990077, 1.426822, 1, 0, 0.2588235, 1,
1.729786, 0.4986877, 1.270053, 1, 0, 0.2509804, 1,
1.756371, -0.36685, 3.635493, 1, 0, 0.2470588, 1,
1.76072, 0.505632, 0.2323419, 1, 0, 0.2392157, 1,
1.763585, 0.8098325, 0.6305411, 1, 0, 0.2352941, 1,
1.765834, -0.8635921, 3.673365, 1, 0, 0.227451, 1,
1.77456, 0.9444043, -0.01337381, 1, 0, 0.2235294, 1,
1.803509, -0.2229922, 1.501927, 1, 0, 0.2156863, 1,
1.82594, 0.05517653, 2.70518, 1, 0, 0.2117647, 1,
1.826041, -3.001923, 2.278767, 1, 0, 0.2039216, 1,
1.838161, -0.2196093, 1.076652, 1, 0, 0.1960784, 1,
1.8458, 0.04539771, 2.232549, 1, 0, 0.1921569, 1,
1.847835, 0.5804551, 1.944726, 1, 0, 0.1843137, 1,
1.85047, 0.4408941, 2.105948, 1, 0, 0.1803922, 1,
1.853571, -0.7500224, 2.437246, 1, 0, 0.172549, 1,
1.859741, -0.9313069, 1.184936, 1, 0, 0.1686275, 1,
1.901835, -0.5893413, 1.963922, 1, 0, 0.1607843, 1,
1.903007, -0.9410548, 1.013358, 1, 0, 0.1568628, 1,
1.911514, -1.084959, 2.375991, 1, 0, 0.1490196, 1,
1.943395, 0.8021318, 2.318655, 1, 0, 0.145098, 1,
1.971954, 0.6784752, -0.3559223, 1, 0, 0.1372549, 1,
1.994753, -0.2764914, 1.762135, 1, 0, 0.1333333, 1,
2.01291, 0.964008, 0.3141958, 1, 0, 0.1254902, 1,
2.024709, -0.7135268, 1.03087, 1, 0, 0.1215686, 1,
2.036907, -1.201704, 1.845773, 1, 0, 0.1137255, 1,
2.086607, -0.5535198, 1.505278, 1, 0, 0.1098039, 1,
2.095076, 0.755686, 2.612618, 1, 0, 0.1019608, 1,
2.103408, -0.07125258, 1.527503, 1, 0, 0.09411765, 1,
2.117343, 0.08666804, 1.482096, 1, 0, 0.09019608, 1,
2.137916, 0.5504594, 2.941892, 1, 0, 0.08235294, 1,
2.180105, 0.1278175, 1.247415, 1, 0, 0.07843138, 1,
2.180894, -0.9148123, 2.922867, 1, 0, 0.07058824, 1,
2.184176, -0.172268, 2.014725, 1, 0, 0.06666667, 1,
2.268209, 0.3839806, 1.755117, 1, 0, 0.05882353, 1,
2.354164, 0.134377, 3.149218, 1, 0, 0.05490196, 1,
2.35837, 0.9684162, 1.213647, 1, 0, 0.04705882, 1,
2.397971, 0.4127571, -0.9895965, 1, 0, 0.04313726, 1,
2.416539, 0.565568, 3.030905, 1, 0, 0.03529412, 1,
2.442357, 0.529528, 3.312054, 1, 0, 0.03137255, 1,
2.918656, 0.62344, 3.066655, 1, 0, 0.02352941, 1,
3.05683, -0.2096418, 2.038232, 1, 0, 0.01960784, 1,
3.185895, 0.4767826, 1.108485, 1, 0, 0.01176471, 1,
3.42777, -0.03228418, 1.487462, 1, 0, 0.007843138, 1
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
-0.2892622, -5.904303, -6.275288, 0, -0.5, 0.5, 0.5,
-0.2892622, -5.904303, -6.275288, 1, -0.5, 0.5, 0.5,
-0.2892622, -5.904303, -6.275288, 1, 1.5, 0.5, 0.5,
-0.2892622, -5.904303, -6.275288, 0, 1.5, 0.5, 0.5
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
-5.266369, -0.238201, -6.275288, 0, -0.5, 0.5, 0.5,
-5.266369, -0.238201, -6.275288, 1, -0.5, 0.5, 0.5,
-5.266369, -0.238201, -6.275288, 1, 1.5, 0.5, 0.5,
-5.266369, -0.238201, -6.275288, 0, 1.5, 0.5, 0.5
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
-5.266369, -5.904303, 0.403713, 0, -0.5, 0.5, 0.5,
-5.266369, -5.904303, 0.403713, 1, -0.5, 0.5, 0.5,
-5.266369, -5.904303, 0.403713, 1, 1.5, 0.5, 0.5,
-5.266369, -5.904303, 0.403713, 0, 1.5, 0.5, 0.5
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
-4, -4.596741, -4.73398,
2, -4.596741, -4.73398,
-4, -4.596741, -4.73398,
-4, -4.814668, -4.990864,
-2, -4.596741, -4.73398,
-2, -4.814668, -4.990864,
0, -4.596741, -4.73398,
0, -4.814668, -4.990864,
2, -4.596741, -4.73398,
2, -4.814668, -4.990864
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
"-4",
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
-4, -5.250522, -5.504633, 0, -0.5, 0.5, 0.5,
-4, -5.250522, -5.504633, 1, -0.5, 0.5, 0.5,
-4, -5.250522, -5.504633, 1, 1.5, 0.5, 0.5,
-4, -5.250522, -5.504633, 0, 1.5, 0.5, 0.5,
-2, -5.250522, -5.504633, 0, -0.5, 0.5, 0.5,
-2, -5.250522, -5.504633, 1, -0.5, 0.5, 0.5,
-2, -5.250522, -5.504633, 1, 1.5, 0.5, 0.5,
-2, -5.250522, -5.504633, 0, 1.5, 0.5, 0.5,
0, -5.250522, -5.504633, 0, -0.5, 0.5, 0.5,
0, -5.250522, -5.504633, 1, -0.5, 0.5, 0.5,
0, -5.250522, -5.504633, 1, 1.5, 0.5, 0.5,
0, -5.250522, -5.504633, 0, 1.5, 0.5, 0.5,
2, -5.250522, -5.504633, 0, -0.5, 0.5, 0.5,
2, -5.250522, -5.504633, 1, -0.5, 0.5, 0.5,
2, -5.250522, -5.504633, 1, 1.5, 0.5, 0.5,
2, -5.250522, -5.504633, 0, 1.5, 0.5, 0.5
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
-4.117805, -4, -4.73398,
-4.117805, 2, -4.73398,
-4.117805, -4, -4.73398,
-4.309233, -4, -4.990864,
-4.117805, -2, -4.73398,
-4.309233, -2, -4.990864,
-4.117805, 0, -4.73398,
-4.309233, 0, -4.990864,
-4.117805, 2, -4.73398,
-4.309233, 2, -4.990864
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
-4.692087, -4, -5.504633, 0, -0.5, 0.5, 0.5,
-4.692087, -4, -5.504633, 1, -0.5, 0.5, 0.5,
-4.692087, -4, -5.504633, 1, 1.5, 0.5, 0.5,
-4.692087, -4, -5.504633, 0, 1.5, 0.5, 0.5,
-4.692087, -2, -5.504633, 0, -0.5, 0.5, 0.5,
-4.692087, -2, -5.504633, 1, -0.5, 0.5, 0.5,
-4.692087, -2, -5.504633, 1, 1.5, 0.5, 0.5,
-4.692087, -2, -5.504633, 0, 1.5, 0.5, 0.5,
-4.692087, 0, -5.504633, 0, -0.5, 0.5, 0.5,
-4.692087, 0, -5.504633, 1, -0.5, 0.5, 0.5,
-4.692087, 0, -5.504633, 1, 1.5, 0.5, 0.5,
-4.692087, 0, -5.504633, 0, 1.5, 0.5, 0.5,
-4.692087, 2, -5.504633, 0, -0.5, 0.5, 0.5,
-4.692087, 2, -5.504633, 1, -0.5, 0.5, 0.5,
-4.692087, 2, -5.504633, 1, 1.5, 0.5, 0.5,
-4.692087, 2, -5.504633, 0, 1.5, 0.5, 0.5
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
-4.117805, -4.596741, -4,
-4.117805, -4.596741, 4,
-4.117805, -4.596741, -4,
-4.309233, -4.814668, -4,
-4.117805, -4.596741, -2,
-4.309233, -4.814668, -2,
-4.117805, -4.596741, 0,
-4.309233, -4.814668, 0,
-4.117805, -4.596741, 2,
-4.309233, -4.814668, 2,
-4.117805, -4.596741, 4,
-4.309233, -4.814668, 4
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
-4.692087, -5.250522, -4, 0, -0.5, 0.5, 0.5,
-4.692087, -5.250522, -4, 1, -0.5, 0.5, 0.5,
-4.692087, -5.250522, -4, 1, 1.5, 0.5, 0.5,
-4.692087, -5.250522, -4, 0, 1.5, 0.5, 0.5,
-4.692087, -5.250522, -2, 0, -0.5, 0.5, 0.5,
-4.692087, -5.250522, -2, 1, -0.5, 0.5, 0.5,
-4.692087, -5.250522, -2, 1, 1.5, 0.5, 0.5,
-4.692087, -5.250522, -2, 0, 1.5, 0.5, 0.5,
-4.692087, -5.250522, 0, 0, -0.5, 0.5, 0.5,
-4.692087, -5.250522, 0, 1, -0.5, 0.5, 0.5,
-4.692087, -5.250522, 0, 1, 1.5, 0.5, 0.5,
-4.692087, -5.250522, 0, 0, 1.5, 0.5, 0.5,
-4.692087, -5.250522, 2, 0, -0.5, 0.5, 0.5,
-4.692087, -5.250522, 2, 1, -0.5, 0.5, 0.5,
-4.692087, -5.250522, 2, 1, 1.5, 0.5, 0.5,
-4.692087, -5.250522, 2, 0, 1.5, 0.5, 0.5,
-4.692087, -5.250522, 4, 0, -0.5, 0.5, 0.5,
-4.692087, -5.250522, 4, 1, -0.5, 0.5, 0.5,
-4.692087, -5.250522, 4, 1, 1.5, 0.5, 0.5,
-4.692087, -5.250522, 4, 0, 1.5, 0.5, 0.5
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
-4.117805, -4.596741, -4.73398,
-4.117805, 4.120338, -4.73398,
-4.117805, -4.596741, 5.541406,
-4.117805, 4.120338, 5.541406,
-4.117805, -4.596741, -4.73398,
-4.117805, -4.596741, 5.541406,
-4.117805, 4.120338, -4.73398,
-4.117805, 4.120338, 5.541406,
-4.117805, -4.596741, -4.73398,
3.539281, -4.596741, -4.73398,
-4.117805, -4.596741, 5.541406,
3.539281, -4.596741, 5.541406,
-4.117805, 4.120338, -4.73398,
3.539281, 4.120338, -4.73398,
-4.117805, 4.120338, 5.541406,
3.539281, 4.120338, 5.541406,
3.539281, -4.596741, -4.73398,
3.539281, 4.120338, -4.73398,
3.539281, -4.596741, 5.541406,
3.539281, 4.120338, 5.541406,
3.539281, -4.596741, -4.73398,
3.539281, -4.596741, 5.541406,
3.539281, 4.120338, -4.73398,
3.539281, 4.120338, 5.541406
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
var radius = 8.275872;
var distance = 36.82029;
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
mvMatrix.translate( 0.2892622, 0.238201, -0.403713 );
mvMatrix.scale( 1.168595, 1.026495, 0.8708223 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.82029);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Cyclanilide<-read.table("Cyclanilide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cyclanilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cyclanilide' not found
```

```r
y<-Cyclanilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cyclanilide' not found
```

```r
z<-Cyclanilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cyclanilide' not found
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
-4.006295, -0.5311258, -0.7658532, 0, 0, 1, 1, 1,
-2.468216, -0.6490161, -1.40597, 1, 0, 0, 1, 1,
-2.427797, 1.033691, 0.1266155, 1, 0, 0, 1, 1,
-2.421096, -0.3825167, -1.953584, 1, 0, 0, 1, 1,
-2.364741, -1.870853, -2.828484, 1, 0, 0, 1, 1,
-2.30602, -0.6676883, -2.110182, 1, 0, 0, 1, 1,
-2.298538, 1.869631, -0.6201771, 0, 0, 0, 1, 1,
-2.287389, -1.018586, -2.713306, 0, 0, 0, 1, 1,
-2.271424, 0.4842996, -1.635356, 0, 0, 0, 1, 1,
-2.262646, -2.428189, -1.895705, 0, 0, 0, 1, 1,
-2.235386, 0.5769588, -1.118735, 0, 0, 0, 1, 1,
-2.234222, -0.3689104, -1.23235, 0, 0, 0, 1, 1,
-2.221972, 0.8153165, -0.9157335, 0, 0, 0, 1, 1,
-2.196728, 1.319947, -0.565804, 1, 1, 1, 1, 1,
-2.185263, -0.2001764, -1.845687, 1, 1, 1, 1, 1,
-2.126864, -0.2502665, -1.010968, 1, 1, 1, 1, 1,
-2.114934, -0.1458271, -0.1692471, 1, 1, 1, 1, 1,
-2.082673, 1.827062, -1.036556, 1, 1, 1, 1, 1,
-2.068995, 0.5166272, -0.3794578, 1, 1, 1, 1, 1,
-2.06167, -1.024621, -2.772413, 1, 1, 1, 1, 1,
-2.031289, -1.096164, -1.955875, 1, 1, 1, 1, 1,
-2.009886, -0.7342187, -0.5870435, 1, 1, 1, 1, 1,
-1.986526, -1.581581, -2.531543, 1, 1, 1, 1, 1,
-1.979878, -2.789227, -4.117912, 1, 1, 1, 1, 1,
-1.978534, 0.2469628, -0.9802516, 1, 1, 1, 1, 1,
-1.940176, -0.7110074, -1.875343, 1, 1, 1, 1, 1,
-1.93918, 0.1317389, -2.394157, 1, 1, 1, 1, 1,
-1.914565, -0.4496234, -2.447544, 1, 1, 1, 1, 1,
-1.86809, 0.7065447, -2.469986, 0, 0, 1, 1, 1,
-1.849951, 0.4415564, -1.035383, 1, 0, 0, 1, 1,
-1.848305, -0.06980685, -2.081627, 1, 0, 0, 1, 1,
-1.836923, -0.8277838, -1.556621, 1, 0, 0, 1, 1,
-1.826313, -1.343514, -2.573162, 1, 0, 0, 1, 1,
-1.82377, 0.5633055, -1.717886, 1, 0, 0, 1, 1,
-1.822948, 0.04140886, -1.520554, 0, 0, 0, 1, 1,
-1.813655, -1.603537, -1.01589, 0, 0, 0, 1, 1,
-1.811514, -0.09609284, -0.0357025, 0, 0, 0, 1, 1,
-1.811406, 0.7044269, -0.8244094, 0, 0, 0, 1, 1,
-1.801013, 0.01781992, -1.599468, 0, 0, 0, 1, 1,
-1.784684, 0.641373, -2.676149, 0, 0, 0, 1, 1,
-1.780483, 1.818934, -0.5468243, 0, 0, 0, 1, 1,
-1.724166, 0.2200264, 0.001540019, 1, 1, 1, 1, 1,
-1.723807, -0.191608, -2.465734, 1, 1, 1, 1, 1,
-1.699114, -0.2701245, -2.172822, 1, 1, 1, 1, 1,
-1.687127, -0.615475, -3.253807, 1, 1, 1, 1, 1,
-1.680621, -1.000226, -2.452827, 1, 1, 1, 1, 1,
-1.659406, 0.8347524, -0.1257638, 1, 1, 1, 1, 1,
-1.650517, -0.2075913, -1.637948, 1, 1, 1, 1, 1,
-1.646331, -0.4011462, -1.726401, 1, 1, 1, 1, 1,
-1.620468, 0.1954539, -1.033451, 1, 1, 1, 1, 1,
-1.614547, -2.087111, -2.493723, 1, 1, 1, 1, 1,
-1.61393, 0.36143, -1.449614, 1, 1, 1, 1, 1,
-1.604129, 1.383208, -1.924106, 1, 1, 1, 1, 1,
-1.602819, 0.4152489, -1.173125, 1, 1, 1, 1, 1,
-1.598343, 0.2032527, -0.7127982, 1, 1, 1, 1, 1,
-1.580202, 0.1563246, -2.886289, 1, 1, 1, 1, 1,
-1.576563, -1.416522, -2.506849, 0, 0, 1, 1, 1,
-1.572945, 2.36581, -2.09661, 1, 0, 0, 1, 1,
-1.555393, 0.03676772, -3.373017, 1, 0, 0, 1, 1,
-1.544389, -0.7545588, -2.610347, 1, 0, 0, 1, 1,
-1.534144, -0.6562378, -1.692756, 1, 0, 0, 1, 1,
-1.530993, 0.3338332, -1.723959, 1, 0, 0, 1, 1,
-1.528859, -0.2686169, -0.9197517, 0, 0, 0, 1, 1,
-1.526876, 0.5786924, -1.556795, 0, 0, 0, 1, 1,
-1.526443, -0.6068298, -0.9097522, 0, 0, 0, 1, 1,
-1.522664, -0.3365549, -4.23417, 0, 0, 0, 1, 1,
-1.514658, 0.5685068, -1.496976, 0, 0, 0, 1, 1,
-1.495241, 0.4227297, -0.1802765, 0, 0, 0, 1, 1,
-1.482807, 3.993391, -2.335869, 0, 0, 0, 1, 1,
-1.465519, 1.821875, 0.1022323, 1, 1, 1, 1, 1,
-1.451997, 0.9892945, -0.4640833, 1, 1, 1, 1, 1,
-1.449218, 0.04209071, -2.740514, 1, 1, 1, 1, 1,
-1.446209, 0.1947252, -1.616506, 1, 1, 1, 1, 1,
-1.443139, 0.1140186, -2.512659, 1, 1, 1, 1, 1,
-1.443005, -0.243339, -1.197353, 1, 1, 1, 1, 1,
-1.438926, 0.0900962, -1.014554, 1, 1, 1, 1, 1,
-1.421109, 1.153841, -1.760756, 1, 1, 1, 1, 1,
-1.418945, -1.561034, -1.15774, 1, 1, 1, 1, 1,
-1.415786, -0.2243532, -1.721217, 1, 1, 1, 1, 1,
-1.41395, -0.4230108, -1.261267, 1, 1, 1, 1, 1,
-1.408214, 2.005224, 0.9711438, 1, 1, 1, 1, 1,
-1.406175, 0.2711118, -1.176589, 1, 1, 1, 1, 1,
-1.401325, -0.02451974, -0.7828245, 1, 1, 1, 1, 1,
-1.396231, -0.1233408, -3.597811, 1, 1, 1, 1, 1,
-1.393881, -0.06979662, -1.197141, 0, 0, 1, 1, 1,
-1.388084, 0.3116239, 0.4359265, 1, 0, 0, 1, 1,
-1.387153, -0.6108724, -0.4497112, 1, 0, 0, 1, 1,
-1.382082, 2.115668, -2.709073, 1, 0, 0, 1, 1,
-1.373595, 0.2575095, -2.588702, 1, 0, 0, 1, 1,
-1.359349, -1.444558, -3.019933, 1, 0, 0, 1, 1,
-1.358327, 1.650438, -0.1519118, 0, 0, 0, 1, 1,
-1.354882, 0.6775894, -0.8379814, 0, 0, 0, 1, 1,
-1.349628, -0.7812377, -1.572774, 0, 0, 0, 1, 1,
-1.346474, -0.06338223, -0.6918586, 0, 0, 0, 1, 1,
-1.33369, 0.1958081, -2.295332, 0, 0, 0, 1, 1,
-1.330229, -0.2335013, -1.391758, 0, 0, 0, 1, 1,
-1.329751, -0.5828458, -2.702935, 0, 0, 0, 1, 1,
-1.326366, 0.4498653, -1.616496, 1, 1, 1, 1, 1,
-1.317789, -2.264708, -3.343008, 1, 1, 1, 1, 1,
-1.309915, -0.7125721, -1.995949, 1, 1, 1, 1, 1,
-1.30863, -0.09612174, -1.410621, 1, 1, 1, 1, 1,
-1.304363, -1.852182, -2.972846, 1, 1, 1, 1, 1,
-1.303287, -0.5219054, -0.8774211, 1, 1, 1, 1, 1,
-1.298668, -0.2869648, -0.8714435, 1, 1, 1, 1, 1,
-1.288177, 0.9576935, -1.615333, 1, 1, 1, 1, 1,
-1.277125, 0.17657, -2.096663, 1, 1, 1, 1, 1,
-1.267299, 0.01330008, -1.534525, 1, 1, 1, 1, 1,
-1.239262, 0.5771425, -0.0940161, 1, 1, 1, 1, 1,
-1.222871, -0.9863979, -1.207216, 1, 1, 1, 1, 1,
-1.221947, -0.9056153, -2.871549, 1, 1, 1, 1, 1,
-1.221946, -0.1622913, -1.686842, 1, 1, 1, 1, 1,
-1.216715, -0.0830929, -0.1721455, 1, 1, 1, 1, 1,
-1.211747, 2.048066, -1.226343, 0, 0, 1, 1, 1,
-1.207765, -0.1741477, -2.096937, 1, 0, 0, 1, 1,
-1.195912, 0.1301904, -1.86163, 1, 0, 0, 1, 1,
-1.191348, -1.08166, -4.224503, 1, 0, 0, 1, 1,
-1.179937, 0.3788512, -2.193126, 1, 0, 0, 1, 1,
-1.179804, 1.331085, 1.890975, 1, 0, 0, 1, 1,
-1.170737, -1.619495, -2.483017, 0, 0, 0, 1, 1,
-1.165818, 0.3258587, -1.70049, 0, 0, 0, 1, 1,
-1.148223, 0.002263535, -1.810714, 0, 0, 0, 1, 1,
-1.143743, -0.3739874, -1.537227, 0, 0, 0, 1, 1,
-1.138589, -0.3723843, -0.981874, 0, 0, 0, 1, 1,
-1.128715, 0.1732422, -1.034496, 0, 0, 0, 1, 1,
-1.128637, 0.4686378, -2.874319, 0, 0, 0, 1, 1,
-1.12603, 0.3810882, -2.822954, 1, 1, 1, 1, 1,
-1.123845, -0.06841115, -1.226788, 1, 1, 1, 1, 1,
-1.123677, 1.549863, -0.3620012, 1, 1, 1, 1, 1,
-1.117024, 0.8194087, -0.01551044, 1, 1, 1, 1, 1,
-1.115899, 0.2018443, -0.1634073, 1, 1, 1, 1, 1,
-1.112206, 0.2115174, -1.887441, 1, 1, 1, 1, 1,
-1.111905, 0.2286168, 0.9000694, 1, 1, 1, 1, 1,
-1.100098, 1.187984, -0.5430077, 1, 1, 1, 1, 1,
-1.098996, 0.505614, 1.898385, 1, 1, 1, 1, 1,
-1.090907, -1.069631, -0.6638218, 1, 1, 1, 1, 1,
-1.09056, 0.3339688, -0.9296254, 1, 1, 1, 1, 1,
-1.08986, -0.7870829, -1.830113, 1, 1, 1, 1, 1,
-1.089363, -0.8837646, -1.50642, 1, 1, 1, 1, 1,
-1.088622, 0.4220804, 0.08877631, 1, 1, 1, 1, 1,
-1.08704, -0.7875466, -1.593934, 1, 1, 1, 1, 1,
-1.086457, -0.2008659, -1.378882, 0, 0, 1, 1, 1,
-1.082412, 0.9605266, -3.825162, 1, 0, 0, 1, 1,
-1.076691, -0.5272399, -0.8013949, 1, 0, 0, 1, 1,
-1.076322, 0.21316, -0.9897434, 1, 0, 0, 1, 1,
-1.066194, 1.974077, -1.465042, 1, 0, 0, 1, 1,
-1.065015, -0.907804, -2.645437, 1, 0, 0, 1, 1,
-1.064333, -1.554594, -1.003672, 0, 0, 0, 1, 1,
-1.063704, 1.446517, 0.05633074, 0, 0, 0, 1, 1,
-1.061789, -0.3204144, -1.33177, 0, 0, 0, 1, 1,
-1.057846, 1.191884, -0.4503362, 0, 0, 0, 1, 1,
-1.055381, -0.4641249, -2.129432, 0, 0, 0, 1, 1,
-1.055341, -0.7921589, 0.04925601, 0, 0, 0, 1, 1,
-1.047451, -0.4352305, -0.8972566, 0, 0, 0, 1, 1,
-1.046693, 1.583697, -0.9026839, 1, 1, 1, 1, 1,
-1.045588, 0.2835831, -1.231649, 1, 1, 1, 1, 1,
-1.044878, -0.8068939, -1.391524, 1, 1, 1, 1, 1,
-1.03798, -0.704783, -3.862892, 1, 1, 1, 1, 1,
-1.024775, -0.5575971, -1.187143, 1, 1, 1, 1, 1,
-1.018766, 0.619247, -0.8499627, 1, 1, 1, 1, 1,
-1.013884, 1.116426, -2.311897, 1, 1, 1, 1, 1,
-1.011461, 0.1937139, -0.8076016, 1, 1, 1, 1, 1,
-1.006811, 0.5374728, 0.6729656, 1, 1, 1, 1, 1,
-1.006743, -0.09044784, -0.6034514, 1, 1, 1, 1, 1,
-1.005305, -1.575677, -1.387219, 1, 1, 1, 1, 1,
-1.003653, -0.328183, -3.378843, 1, 1, 1, 1, 1,
-1.002693, -0.5768287, -2.254948, 1, 1, 1, 1, 1,
-1.002097, 0.3868296, -1.602138, 1, 1, 1, 1, 1,
-0.9987627, 0.5162807, -1.276262, 1, 1, 1, 1, 1,
-0.9980378, 0.5586092, -1.399651, 0, 0, 1, 1, 1,
-0.9920539, 0.6872198, -0.008445419, 1, 0, 0, 1, 1,
-0.9868924, 0.4119042, 0.07565495, 1, 0, 0, 1, 1,
-0.9840954, -1.553641, -1.431641, 1, 0, 0, 1, 1,
-0.9806618, 2.293547, -1.667927, 1, 0, 0, 1, 1,
-0.9690229, 0.2849672, -2.4127, 1, 0, 0, 1, 1,
-0.966603, -0.1170233, -0.7607805, 0, 0, 0, 1, 1,
-0.965897, -1.747486, -0.5548086, 0, 0, 0, 1, 1,
-0.9530114, 0.3901461, -0.6274815, 0, 0, 0, 1, 1,
-0.9517711, -0.1070864, -2.095281, 0, 0, 0, 1, 1,
-0.9510187, -1.873149, -3.033603, 0, 0, 0, 1, 1,
-0.9496971, -0.3666371, -1.94786, 0, 0, 0, 1, 1,
-0.9394535, 0.5345099, 0.877623, 0, 0, 0, 1, 1,
-0.9378361, -0.7327895, -1.834652, 1, 1, 1, 1, 1,
-0.9378043, 0.3576243, -0.5192831, 1, 1, 1, 1, 1,
-0.9342881, -0.8912933, -4.137383, 1, 1, 1, 1, 1,
-0.9293567, 0.6210271, -2.145694, 1, 1, 1, 1, 1,
-0.9254677, -0.5563022, -3.323603, 1, 1, 1, 1, 1,
-0.9206064, -0.06524062, -2.000934, 1, 1, 1, 1, 1,
-0.9184121, 0.9475073, -1.375931, 1, 1, 1, 1, 1,
-0.9068192, 0.1078653, -1.922743, 1, 1, 1, 1, 1,
-0.9066367, -0.1158205, -0.3420942, 1, 1, 1, 1, 1,
-0.9048439, -0.1705512, -2.125293, 1, 1, 1, 1, 1,
-0.9035951, -1.711352, -2.375991, 1, 1, 1, 1, 1,
-0.9022758, 0.6259781, -3.708885, 1, 1, 1, 1, 1,
-0.9008844, 0.6777534, -0.7571858, 1, 1, 1, 1, 1,
-0.8931494, -0.2137873, -2.326171, 1, 1, 1, 1, 1,
-0.8904872, -0.3715154, -1.434952, 1, 1, 1, 1, 1,
-0.8890331, 1.153305, -0.8215508, 0, 0, 1, 1, 1,
-0.8859076, -0.5588453, -3.10235, 1, 0, 0, 1, 1,
-0.8825587, -1.180591, -2.783689, 1, 0, 0, 1, 1,
-0.8818335, -0.6227604, -1.491537, 1, 0, 0, 1, 1,
-0.8792152, 0.6037632, -1.144007, 1, 0, 0, 1, 1,
-0.8771572, -1.751888, -2.708799, 1, 0, 0, 1, 1,
-0.861621, -0.06430572, -1.740012, 0, 0, 0, 1, 1,
-0.860894, -1.02526, -2.034512, 0, 0, 0, 1, 1,
-0.860849, -1.351251, -2.503503, 0, 0, 0, 1, 1,
-0.8607625, 1.465928, 1.546205, 0, 0, 0, 1, 1,
-0.8593325, 1.208329, -0.1621042, 0, 0, 0, 1, 1,
-0.8587986, -0.01340791, -1.134637, 0, 0, 0, 1, 1,
-0.8562534, 0.7589557, -1.861954, 0, 0, 0, 1, 1,
-0.8562072, -0.3242722, -2.335477, 1, 1, 1, 1, 1,
-0.8517598, 0.8257313, -0.05921048, 1, 1, 1, 1, 1,
-0.8517103, 0.1976852, -1.953699, 1, 1, 1, 1, 1,
-0.8458179, -0.4515489, -1.803818, 1, 1, 1, 1, 1,
-0.8452168, -1.226705, -2.744437, 1, 1, 1, 1, 1,
-0.8449782, 0.4357255, -0.8077661, 1, 1, 1, 1, 1,
-0.8445309, -0.3295601, -0.4092735, 1, 1, 1, 1, 1,
-0.8414184, -0.9413856, -2.071016, 1, 1, 1, 1, 1,
-0.8384972, -0.07955973, -1.834618, 1, 1, 1, 1, 1,
-0.8360936, 0.4366946, -0.3411733, 1, 1, 1, 1, 1,
-0.8309559, -1.374977, -3.041689, 1, 1, 1, 1, 1,
-0.8304662, -0.4348992, -0.06125922, 1, 1, 1, 1, 1,
-0.826342, -0.3018136, -1.651539, 1, 1, 1, 1, 1,
-0.8210756, -1.109976, -2.887857, 1, 1, 1, 1, 1,
-0.8208964, -0.4044385, -1.610911, 1, 1, 1, 1, 1,
-0.8191327, 1.415505, -1.635168, 0, 0, 1, 1, 1,
-0.8182584, -0.7622191, -2.588225, 1, 0, 0, 1, 1,
-0.8180601, -0.958845, -2.983223, 1, 0, 0, 1, 1,
-0.8143433, 0.9424147, -0.676662, 1, 0, 0, 1, 1,
-0.8089374, 0.6797453, -1.3067, 1, 0, 0, 1, 1,
-0.8056669, -0.732329, -2.056962, 1, 0, 0, 1, 1,
-0.804714, -0.6138516, -2.587634, 0, 0, 0, 1, 1,
-0.8035712, -1.511108, -3.856279, 0, 0, 0, 1, 1,
-0.8025409, 0.1965603, -1.441252, 0, 0, 0, 1, 1,
-0.7942598, 1.0477, -0.8035653, 0, 0, 0, 1, 1,
-0.7898976, -0.06779634, -2.467644, 0, 0, 0, 1, 1,
-0.7888731, 1.720374, -0.3678367, 0, 0, 0, 1, 1,
-0.7803969, 0.6237838, -1.813873, 0, 0, 0, 1, 1,
-0.7765144, -0.2692269, -2.590532, 1, 1, 1, 1, 1,
-0.7664542, 2.329879, -0.2484246, 1, 1, 1, 1, 1,
-0.7650293, 1.988181, -1.259365, 1, 1, 1, 1, 1,
-0.7600843, -0.2256523, -2.909548, 1, 1, 1, 1, 1,
-0.7571584, 1.830535, -3.3451, 1, 1, 1, 1, 1,
-0.7563758, 1.621712, -2.543439, 1, 1, 1, 1, 1,
-0.7531049, -0.1494931, -1.643706, 1, 1, 1, 1, 1,
-0.7485502, 0.3731065, -1.763772, 1, 1, 1, 1, 1,
-0.7478519, 0.6005264, 0.2099407, 1, 1, 1, 1, 1,
-0.7454022, 2.109141, -0.3187952, 1, 1, 1, 1, 1,
-0.7398997, -1.703475, -2.626709, 1, 1, 1, 1, 1,
-0.7347558, -1.343594, -2.13603, 1, 1, 1, 1, 1,
-0.7315238, -0.5984901, -1.217028, 1, 1, 1, 1, 1,
-0.7307414, 0.6585771, -1.950728, 1, 1, 1, 1, 1,
-0.7289715, -0.1712338, -1.370996, 1, 1, 1, 1, 1,
-0.7279872, 0.982088, -0.5317453, 0, 0, 1, 1, 1,
-0.7266915, -0.2705691, -2.71351, 1, 0, 0, 1, 1,
-0.725437, -1.000934, -1.861522, 1, 0, 0, 1, 1,
-0.7225136, -1.681252, -4.160306, 1, 0, 0, 1, 1,
-0.7179416, -3.228696, -4.584338, 1, 0, 0, 1, 1,
-0.7177116, -0.6672103, -2.569363, 1, 0, 0, 1, 1,
-0.7175728, 0.4492567, -1.594747, 0, 0, 0, 1, 1,
-0.71145, -1.207931, -2.194495, 0, 0, 0, 1, 1,
-0.7071238, -0.0158223, -0.6701697, 0, 0, 0, 1, 1,
-0.7026739, -0.02969893, -3.167773, 0, 0, 0, 1, 1,
-0.6999694, -0.5485047, -1.538306, 0, 0, 0, 1, 1,
-0.6914921, 0.6382877, -0.5490488, 0, 0, 0, 1, 1,
-0.6910089, 0.4837215, -1.965753, 0, 0, 0, 1, 1,
-0.6904213, 0.1231561, -1.49843, 1, 1, 1, 1, 1,
-0.6892821, -0.9289325, -3.548613, 1, 1, 1, 1, 1,
-0.6868947, -0.07140774, -3.696764, 1, 1, 1, 1, 1,
-0.6838776, 0.3955441, -2.999406, 1, 1, 1, 1, 1,
-0.6802497, -0.2474984, -1.485706, 1, 1, 1, 1, 1,
-0.6782765, -0.009189477, -1.487109, 1, 1, 1, 1, 1,
-0.677152, -0.0933726, -1.78794, 1, 1, 1, 1, 1,
-0.6649309, 0.3146786, -0.2605859, 1, 1, 1, 1, 1,
-0.65391, 0.6939933, -0.3324644, 1, 1, 1, 1, 1,
-0.6512946, 1.742899, -0.344041, 1, 1, 1, 1, 1,
-0.65083, -0.235582, -1.979315, 1, 1, 1, 1, 1,
-0.6387351, -0.5193809, -2.604581, 1, 1, 1, 1, 1,
-0.6354174, 0.8514163, -0.3289211, 1, 1, 1, 1, 1,
-0.6310128, 0.1843119, -1.872086, 1, 1, 1, 1, 1,
-0.6247329, 0.1061624, -0.6141151, 1, 1, 1, 1, 1,
-0.6247056, 0.1650655, -3.643873, 0, 0, 1, 1, 1,
-0.624167, 0.001634676, -1.31502, 1, 0, 0, 1, 1,
-0.6204578, -0.4115039, -1.865201, 1, 0, 0, 1, 1,
-0.6170506, 1.20817, -0.2932752, 1, 0, 0, 1, 1,
-0.6137922, 1.636913, 0.6671978, 1, 0, 0, 1, 1,
-0.6100955, 1.116579, -0.3159795, 1, 0, 0, 1, 1,
-0.6094506, 0.6475489, -0.9107445, 0, 0, 0, 1, 1,
-0.6042445, -0.5443926, -2.252681, 0, 0, 0, 1, 1,
-0.6031278, -0.3353139, -3.037975, 0, 0, 0, 1, 1,
-0.5988518, -0.6900576, -3.191211, 0, 0, 0, 1, 1,
-0.5983163, -1.2626, -3.617377, 0, 0, 0, 1, 1,
-0.5879503, 0.8200079, -1.715289, 0, 0, 0, 1, 1,
-0.5843687, -1.154388, -2.469009, 0, 0, 0, 1, 1,
-0.5825685, 0.819267, -0.6057753, 1, 1, 1, 1, 1,
-0.5812426, 0.8106312, -1.416094, 1, 1, 1, 1, 1,
-0.5763686, 1.107843, -0.8755015, 1, 1, 1, 1, 1,
-0.5757305, 1.654037, -0.1991388, 1, 1, 1, 1, 1,
-0.5685033, 1.281479, -0.2899637, 1, 1, 1, 1, 1,
-0.564872, -0.1980962, -3.238526, 1, 1, 1, 1, 1,
-0.5630839, -0.5295953, -1.492151, 1, 1, 1, 1, 1,
-0.5597621, 2.268222, -0.5758786, 1, 1, 1, 1, 1,
-0.5592946, -1.251801, -1.30545, 1, 1, 1, 1, 1,
-0.5566008, 0.4466907, -1.758069, 1, 1, 1, 1, 1,
-0.5558664, -0.2978928, -2.542043, 1, 1, 1, 1, 1,
-0.5527019, -0.3947474, -2.141007, 1, 1, 1, 1, 1,
-0.5522391, 0.6623523, -1.038306, 1, 1, 1, 1, 1,
-0.5520437, -0.6617105, -2.823396, 1, 1, 1, 1, 1,
-0.5494853, 0.3606384, 0.8547376, 1, 1, 1, 1, 1,
-0.5416078, -1.357002, -1.93775, 0, 0, 1, 1, 1,
-0.5401188, -0.4276812, -3.013083, 1, 0, 0, 1, 1,
-0.5379232, 0.6076507, -0.1588183, 1, 0, 0, 1, 1,
-0.5364688, 0.0278174, -2.289763, 1, 0, 0, 1, 1,
-0.5344504, -0.7239608, -2.866956, 1, 0, 0, 1, 1,
-0.534316, -1.535971, -3.163947, 1, 0, 0, 1, 1,
-0.5324531, -0.5177004, -2.398103, 0, 0, 0, 1, 1,
-0.5294505, 0.9142187, 0.5435398, 0, 0, 0, 1, 1,
-0.5258834, 0.888117, 2.551913, 0, 0, 0, 1, 1,
-0.515624, -0.3289659, -2.114803, 0, 0, 0, 1, 1,
-0.5118557, 2.227068, -1.056945, 0, 0, 0, 1, 1,
-0.5064414, -0.7232286, -3.634588, 0, 0, 0, 1, 1,
-0.5047218, 0.3107038, 0.1702482, 0, 0, 0, 1, 1,
-0.5023113, 0.1494223, -3.113109, 1, 1, 1, 1, 1,
-0.5013315, 0.2341587, -2.678204, 1, 1, 1, 1, 1,
-0.5008148, -0.9671518, -2.616208, 1, 1, 1, 1, 1,
-0.4994381, -0.8554363, -2.014666, 1, 1, 1, 1, 1,
-0.4978034, -0.6123447, -2.431877, 1, 1, 1, 1, 1,
-0.4953885, 0.4794904, -2.119582, 1, 1, 1, 1, 1,
-0.476956, 1.202447, -0.3532445, 1, 1, 1, 1, 1,
-0.4759488, 0.6613823, -0.186443, 1, 1, 1, 1, 1,
-0.468744, -0.3473707, -0.3408089, 1, 1, 1, 1, 1,
-0.4676842, -0.3796705, -1.828829, 1, 1, 1, 1, 1,
-0.4660873, -1.077357, -2.653824, 1, 1, 1, 1, 1,
-0.4650028, -0.4633141, -3.001135, 1, 1, 1, 1, 1,
-0.4645914, -1.269284, -3.955131, 1, 1, 1, 1, 1,
-0.45582, 0.4818748, -1.197853, 1, 1, 1, 1, 1,
-0.4531882, -0.6201389, -1.490191, 1, 1, 1, 1, 1,
-0.4520291, 0.1758847, -1.899807, 0, 0, 1, 1, 1,
-0.4518377, 0.1293136, 0.04003731, 1, 0, 0, 1, 1,
-0.4421381, -0.7706379, -1.63315, 1, 0, 0, 1, 1,
-0.4417344, 0.6609508, 0.2281057, 1, 0, 0, 1, 1,
-0.4380328, 1.96015, -0.331178, 1, 0, 0, 1, 1,
-0.4360317, 0.7251719, -1.512081, 1, 0, 0, 1, 1,
-0.4346133, -1.362944, -1.661074, 0, 0, 0, 1, 1,
-0.4298379, 1.536786, -0.652389, 0, 0, 0, 1, 1,
-0.4287107, -3.487554, -3.689153, 0, 0, 0, 1, 1,
-0.4166653, 0.1774634, -0.3186019, 0, 0, 0, 1, 1,
-0.4141583, -0.3368083, -2.312799, 0, 0, 0, 1, 1,
-0.4114706, 0.791703, -0.3313761, 0, 0, 0, 1, 1,
-0.4094228, -0.2387457, -3.376191, 0, 0, 0, 1, 1,
-0.4090283, -0.641844, -2.993923, 1, 1, 1, 1, 1,
-0.4086291, 0.8044971, -0.00136915, 1, 1, 1, 1, 1,
-0.407183, 0.2952907, -0.9841995, 1, 1, 1, 1, 1,
-0.4058644, -0.5803493, -2.664452, 1, 1, 1, 1, 1,
-0.4055825, 1.438358, -0.2339037, 1, 1, 1, 1, 1,
-0.391816, -0.1655556, -2.094233, 1, 1, 1, 1, 1,
-0.3915599, 0.9516723, 0.08555211, 1, 1, 1, 1, 1,
-0.3842747, 1.282549, -1.767819, 1, 1, 1, 1, 1,
-0.3816715, -0.6553742, -2.362062, 1, 1, 1, 1, 1,
-0.3814773, -0.05982581, -0.710541, 1, 1, 1, 1, 1,
-0.3808244, -1.441138, -4.224583, 1, 1, 1, 1, 1,
-0.3801907, -2.095991, -2.843554, 1, 1, 1, 1, 1,
-0.3789171, 0.6234638, 0.8227382, 1, 1, 1, 1, 1,
-0.3785373, -0.5552188, -1.926986, 1, 1, 1, 1, 1,
-0.3777787, 0.8793889, -0.9927931, 1, 1, 1, 1, 1,
-0.3728435, -0.150859, -2.131551, 0, 0, 1, 1, 1,
-0.3712857, 0.7262561, -1.5199, 1, 0, 0, 1, 1,
-0.3693664, -1.969116, -3.699059, 1, 0, 0, 1, 1,
-0.3629405, -1.894775, -3.4427, 1, 0, 0, 1, 1,
-0.3600733, -0.8060483, -2.654944, 1, 0, 0, 1, 1,
-0.3551186, -1.139375, -1.536329, 1, 0, 0, 1, 1,
-0.3522599, -0.9136328, -4.227006, 0, 0, 0, 1, 1,
-0.3521757, 1.65089, -0.113493, 0, 0, 0, 1, 1,
-0.3521605, -0.710263, -0.3571831, 0, 0, 0, 1, 1,
-0.3504388, 1.372727, -0.8579862, 0, 0, 0, 1, 1,
-0.3500582, 0.5636778, 0.06896892, 0, 0, 0, 1, 1,
-0.345985, 1.645818, 0.2654593, 0, 0, 0, 1, 1,
-0.3446254, -2.170244, -3.478568, 0, 0, 0, 1, 1,
-0.3427651, -0.8823411, -3.264378, 1, 1, 1, 1, 1,
-0.3392712, -0.3699883, -1.842263, 1, 1, 1, 1, 1,
-0.3386196, 0.2791542, -1.200309, 1, 1, 1, 1, 1,
-0.3383652, 0.784968, 0.6119969, 1, 1, 1, 1, 1,
-0.336426, -0.7324843, -2.666967, 1, 1, 1, 1, 1,
-0.3362257, -1.483985, -2.827221, 1, 1, 1, 1, 1,
-0.3353682, -0.1135961, -3.889528, 1, 1, 1, 1, 1,
-0.3342954, -0.5881519, -2.896287, 1, 1, 1, 1, 1,
-0.3258829, -0.8614575, -3.291114, 1, 1, 1, 1, 1,
-0.321972, 1.134711, 0.6620399, 1, 1, 1, 1, 1,
-0.3184719, 1.431768, 0.001993579, 1, 1, 1, 1, 1,
-0.3115429, 0.4941083, -1.245194, 1, 1, 1, 1, 1,
-0.3099548, -1.440046, -1.469601, 1, 1, 1, 1, 1,
-0.3040931, 0.2898521, -1.722549, 1, 1, 1, 1, 1,
-0.302527, -0.04110224, -0.4922543, 1, 1, 1, 1, 1,
-0.2955331, 1.628102, -0.789532, 0, 0, 1, 1, 1,
-0.2895254, 0.7330669, -0.8676543, 1, 0, 0, 1, 1,
-0.2882833, -0.07138868, -0.9237347, 1, 0, 0, 1, 1,
-0.2860123, 1.571269, 0.4654903, 1, 0, 0, 1, 1,
-0.2838671, 0.303908, -0.7767659, 1, 0, 0, 1, 1,
-0.2838302, -3.001652, -2.248043, 1, 0, 0, 1, 1,
-0.2804845, -0.09456608, -0.4234112, 0, 0, 0, 1, 1,
-0.2795008, -0.3245081, -1.751313, 0, 0, 0, 1, 1,
-0.2770081, -1.704575, -2.580206, 0, 0, 0, 1, 1,
-0.2692435, -0.7337001, -1.99148, 0, 0, 0, 1, 1,
-0.2666638, -1.23635, -2.982956, 0, 0, 0, 1, 1,
-0.2592568, -0.292204, -3.691411, 0, 0, 0, 1, 1,
-0.258922, -0.5798811, -3.077313, 0, 0, 0, 1, 1,
-0.2540756, 0.434434, -1.243163, 1, 1, 1, 1, 1,
-0.2383316, 0.2927281, -0.786809, 1, 1, 1, 1, 1,
-0.2316222, 0.3090399, -1.572662, 1, 1, 1, 1, 1,
-0.2313551, -0.4967259, -2.237169, 1, 1, 1, 1, 1,
-0.2255006, 1.393701, -0.0006772349, 1, 1, 1, 1, 1,
-0.2209828, -0.1531009, -1.904056, 1, 1, 1, 1, 1,
-0.2195005, 1.048038, -0.5303389, 1, 1, 1, 1, 1,
-0.2191285, -0.09257223, -2.175528, 1, 1, 1, 1, 1,
-0.2159957, 0.3771936, -1.138948, 1, 1, 1, 1, 1,
-0.2156648, 0.2805803, -1.67922, 1, 1, 1, 1, 1,
-0.2117791, 0.08791801, -0.2459064, 1, 1, 1, 1, 1,
-0.2104827, 0.8847044, -0.1870433, 1, 1, 1, 1, 1,
-0.20684, 1.99362, -0.818724, 1, 1, 1, 1, 1,
-0.2044935, -0.04131732, -3.593315, 1, 1, 1, 1, 1,
-0.2026074, 0.3526872, -0.4779058, 1, 1, 1, 1, 1,
-0.2023597, -0.2212129, -1.248845, 0, 0, 1, 1, 1,
-0.2011401, 0.8064576, -1.983663, 1, 0, 0, 1, 1,
-0.2002143, 0.554575, 0.06486447, 1, 0, 0, 1, 1,
-0.1988375, -1.083333, -3.07662, 1, 0, 0, 1, 1,
-0.1931156, -1.170629, -3.509896, 1, 0, 0, 1, 1,
-0.1923534, -0.8182489, -2.438989, 1, 0, 0, 1, 1,
-0.1844665, -1.15945, -3.644747, 0, 0, 0, 1, 1,
-0.1829902, 1.109734, -0.4235159, 0, 0, 0, 1, 1,
-0.1734752, 1.10586, 0.6711614, 0, 0, 0, 1, 1,
-0.1713047, -0.4013017, -4.352535, 0, 0, 0, 1, 1,
-0.1691178, -1.059515, -3.810436, 0, 0, 0, 1, 1,
-0.1682875, 0.3647765, 0.5311798, 0, 0, 0, 1, 1,
-0.1668664, -0.2427104, -3.373961, 0, 0, 0, 1, 1,
-0.1656981, -0.2301339, -3.073773, 1, 1, 1, 1, 1,
-0.1603421, 0.443706, -0.8412779, 1, 1, 1, 1, 1,
-0.1580619, -1.1183, -3.131145, 1, 1, 1, 1, 1,
-0.1565779, 1.258372, 0.9546105, 1, 1, 1, 1, 1,
-0.1529999, -1.401133, -2.190148, 1, 1, 1, 1, 1,
-0.1479711, -0.3064742, -2.868355, 1, 1, 1, 1, 1,
-0.1419682, -0.3453895, -2.562804, 1, 1, 1, 1, 1,
-0.1395166, -1.250233, -3.762796, 1, 1, 1, 1, 1,
-0.1358271, -0.2112421, -4.066152, 1, 1, 1, 1, 1,
-0.1309513, 0.5822078, 0.8791761, 1, 1, 1, 1, 1,
-0.1305284, -1.286452, -3.617182, 1, 1, 1, 1, 1,
-0.1300968, -0.3368468, -2.82653, 1, 1, 1, 1, 1,
-0.1288171, 1.00792, -0.01941126, 1, 1, 1, 1, 1,
-0.1250677, 0.402574, -0.837258, 1, 1, 1, 1, 1,
-0.1230266, -0.8078185, -2.86966, 1, 1, 1, 1, 1,
-0.1216709, 1.389217, -0.8236361, 0, 0, 1, 1, 1,
-0.1216077, -1.65304, -1.24325, 1, 0, 0, 1, 1,
-0.1207167, -0.3080196, -2.52512, 1, 0, 0, 1, 1,
-0.1205312, -0.06748422, -2.760162, 1, 0, 0, 1, 1,
-0.117108, 0.000910475, -0.8389557, 1, 0, 0, 1, 1,
-0.114599, -0.7136306, -2.227923, 1, 0, 0, 1, 1,
-0.1144008, 0.178894, 1.201652, 0, 0, 0, 1, 1,
-0.1120787, 0.0319736, -2.576029, 0, 0, 0, 1, 1,
-0.1099328, 0.6367455, 0.4910185, 0, 0, 0, 1, 1,
-0.1083928, -1.470258, -3.97683, 0, 0, 0, 1, 1,
-0.1078466, -0.7274632, -3.037378, 0, 0, 0, 1, 1,
-0.103718, -1.294214, -3.254066, 0, 0, 0, 1, 1,
-0.1035788, -0.3397005, -1.879276, 0, 0, 0, 1, 1,
-0.102253, -1.350916, -3.010117, 1, 1, 1, 1, 1,
-0.1015957, -0.6479385, -2.831048, 1, 1, 1, 1, 1,
-0.1010892, -1.596827, -4.48384, 1, 1, 1, 1, 1,
-0.09217058, 0.3827087, 1.677118, 1, 1, 1, 1, 1,
-0.0826345, 0.8513032, -0.4942425, 1, 1, 1, 1, 1,
-0.08096629, -2.985705, -2.814034, 1, 1, 1, 1, 1,
-0.0800577, 0.8997132, -0.6524587, 1, 1, 1, 1, 1,
-0.0796167, -0.9858858, -1.511416, 1, 1, 1, 1, 1,
-0.07792506, -0.8745447, -3.270538, 1, 1, 1, 1, 1,
-0.07746252, 1.08676, -0.2169996, 1, 1, 1, 1, 1,
-0.07687959, -0.3267436, -3.814417, 1, 1, 1, 1, 1,
-0.07566385, -0.0616997, -3.317659, 1, 1, 1, 1, 1,
-0.06540541, -0.7400389, -3.190798, 1, 1, 1, 1, 1,
-0.06489719, -1.227347, -4.145574, 1, 1, 1, 1, 1,
-0.05835401, -0.8230017, -2.473038, 1, 1, 1, 1, 1,
-0.0546813, 0.1974153, -0.428328, 0, 0, 1, 1, 1,
-0.05393899, -0.2219708, -2.589737, 1, 0, 0, 1, 1,
-0.04788455, -1.055288, -3.3869, 1, 0, 0, 1, 1,
-0.04573064, 0.4847446, -0.6958767, 1, 0, 0, 1, 1,
-0.04399539, 1.14914, 0.5362064, 1, 0, 0, 1, 1,
-0.04331489, -0.8065295, -2.457186, 1, 0, 0, 1, 1,
-0.04243798, 0.2987368, -1.298126, 0, 0, 0, 1, 1,
-0.03190771, 0.5525357, -2.249758, 0, 0, 0, 1, 1,
-0.02943243, 1.015075, 2.636499, 0, 0, 0, 1, 1,
-0.02806487, -0.9126921, -4.398371, 0, 0, 0, 1, 1,
-0.02559208, 2.186974, 0.7734181, 0, 0, 0, 1, 1,
-0.02546195, 0.7967874, 0.3520411, 0, 0, 0, 1, 1,
-0.02098996, -0.4244896, -3.781727, 0, 0, 0, 1, 1,
-0.01736465, 1.50671, 1.050014, 1, 1, 1, 1, 1,
-0.0138342, 1.371053, 0.008452816, 1, 1, 1, 1, 1,
-0.005279332, -0.3631901, -3.108699, 1, 1, 1, 1, 1,
-0.003471375, -0.8311272, -3.248449, 1, 1, 1, 1, 1,
-0.002722715, -0.5536497, -2.628758, 1, 1, 1, 1, 1,
-0.001518956, 0.428433, -2.617019, 1, 1, 1, 1, 1,
-0.0007711938, 0.8418214, 0.01598234, 1, 1, 1, 1, 1,
0.01101002, -0.1187366, 5.391764, 1, 1, 1, 1, 1,
0.01719184, -0.002321691, -0.7971838, 1, 1, 1, 1, 1,
0.02241, 2.06721, -0.4802973, 1, 1, 1, 1, 1,
0.02388653, -1.496891, 4.120687, 1, 1, 1, 1, 1,
0.02464141, 1.91727, -0.4514814, 1, 1, 1, 1, 1,
0.02683468, 1.178841, -1.549295, 1, 1, 1, 1, 1,
0.02913112, 0.6746833, 1.204978, 1, 1, 1, 1, 1,
0.02959438, 0.4357901, -0.0334351, 1, 1, 1, 1, 1,
0.03387446, 0.2375594, 0.05861953, 0, 0, 1, 1, 1,
0.03843702, 1.553248, 0.3027927, 1, 0, 0, 1, 1,
0.03961456, 0.788752, 0.306035, 1, 0, 0, 1, 1,
0.04261141, 1.619974, 1.711412, 1, 0, 0, 1, 1,
0.04858469, 0.5901737, -0.4311, 1, 0, 0, 1, 1,
0.04916847, -0.6986056, 3.550725, 1, 0, 0, 1, 1,
0.05170429, -2.565573, 3.684985, 0, 0, 0, 1, 1,
0.05384405, -1.234665, 1.478992, 0, 0, 0, 1, 1,
0.05451072, -0.7034713, 1.598355, 0, 0, 0, 1, 1,
0.0551211, -1.08127, 2.22875, 0, 0, 0, 1, 1,
0.06162904, 0.5591247, 1.099494, 0, 0, 0, 1, 1,
0.06830291, -1.503166, 3.175847, 0, 0, 0, 1, 1,
0.0688849, -1.0641, 3.819185, 0, 0, 0, 1, 1,
0.07199465, 0.02468628, 0.5358887, 1, 1, 1, 1, 1,
0.07396448, -0.002447269, 0.8219287, 1, 1, 1, 1, 1,
0.07746046, 2.620707, -2.06142, 1, 1, 1, 1, 1,
0.07900748, 1.324298, -1.100976, 1, 1, 1, 1, 1,
0.08132625, -0.5382466, 3.228586, 1, 1, 1, 1, 1,
0.08181156, -1.239372, 3.42581, 1, 1, 1, 1, 1,
0.08407229, 1.545402, -0.1992187, 1, 1, 1, 1, 1,
0.08827478, 1.142077, -1.090755, 1, 1, 1, 1, 1,
0.08947866, 1.1404, 0.9650789, 1, 1, 1, 1, 1,
0.09036104, 1.326611, -0.3585715, 1, 1, 1, 1, 1,
0.09592679, -1.445446, 4.301716, 1, 1, 1, 1, 1,
0.1025435, -0.441393, 2.38293, 1, 1, 1, 1, 1,
0.1057819, -0.5413399, 0.2341652, 1, 1, 1, 1, 1,
0.1072628, -0.4272051, 3.149381, 1, 1, 1, 1, 1,
0.1077721, 0.7019392, -0.1491182, 1, 1, 1, 1, 1,
0.1081768, -0.4901115, 4.328813, 0, 0, 1, 1, 1,
0.108954, 1.892479, -0.01692784, 1, 0, 0, 1, 1,
0.1098369, 1.872978, 0.2394809, 1, 0, 0, 1, 1,
0.1117633, -1.626588, 2.585248, 1, 0, 0, 1, 1,
0.1147703, -1.670968, 1.93301, 1, 0, 0, 1, 1,
0.1193293, -1.136195, 4.891637, 1, 0, 0, 1, 1,
0.1259542, -1.04134, 2.808178, 0, 0, 0, 1, 1,
0.1275001, -0.3365822, 2.593899, 0, 0, 0, 1, 1,
0.1292587, -0.4644805, 4.168869, 0, 0, 0, 1, 1,
0.1315209, -0.587455, 3.28321, 0, 0, 0, 1, 1,
0.1319462, 0.245998, 0.6122308, 0, 0, 0, 1, 1,
0.1332211, -0.1101108, 3.356231, 0, 0, 0, 1, 1,
0.133912, -0.2300081, 1.505165, 0, 0, 0, 1, 1,
0.1368315, 0.4853097, 0.1511541, 1, 1, 1, 1, 1,
0.1397733, -0.4247743, 1.953999, 1, 1, 1, 1, 1,
0.1398309, 1.999936, 0.1686848, 1, 1, 1, 1, 1,
0.1419508, -0.517495, 2.038101, 1, 1, 1, 1, 1,
0.1421951, -0.3389049, 3.480068, 1, 1, 1, 1, 1,
0.1440473, -0.7389227, 4.339824, 1, 1, 1, 1, 1,
0.1457764, 0.234936, 2.29952, 1, 1, 1, 1, 1,
0.1532821, -1.664139, 3.429915, 1, 1, 1, 1, 1,
0.1544928, -1.215099, 3.29753, 1, 1, 1, 1, 1,
0.1561767, -0.4139677, 3.442181, 1, 1, 1, 1, 1,
0.1566418, 0.02846656, 3.079109, 1, 1, 1, 1, 1,
0.1568022, -0.1213336, 1.789164, 1, 1, 1, 1, 1,
0.1585885, 0.3556237, 0.4818478, 1, 1, 1, 1, 1,
0.1588259, -0.1165076, 3.884913, 1, 1, 1, 1, 1,
0.1596988, 1.601059, 1.363421, 1, 1, 1, 1, 1,
0.1636672, 0.7366428, -0.07766093, 0, 0, 1, 1, 1,
0.1637603, 0.1283724, 1.698649, 1, 0, 0, 1, 1,
0.1661544, 1.844945, 1.126999, 1, 0, 0, 1, 1,
0.1690503, 0.02268148, 2.221289, 1, 0, 0, 1, 1,
0.1709606, 0.002065353, 0.8411672, 1, 0, 0, 1, 1,
0.1718964, -0.60726, 2.825891, 1, 0, 0, 1, 1,
0.1736696, -1.802887, 2.676036, 0, 0, 0, 1, 1,
0.1743235, 0.560581, -1.289699, 0, 0, 0, 1, 1,
0.1761859, -0.05667453, 2.021597, 0, 0, 0, 1, 1,
0.1774704, -2.260795, 5.231983, 0, 0, 0, 1, 1,
0.1780064, 1.728497, 1.291104, 0, 0, 0, 1, 1,
0.1825655, -1.562994, 3.048695, 0, 0, 0, 1, 1,
0.1826483, -1.712127, 2.534988, 0, 0, 0, 1, 1,
0.1835738, 0.01967638, 1.816084, 1, 1, 1, 1, 1,
0.1840683, 0.1399709, 0.1660347, 1, 1, 1, 1, 1,
0.189065, 0.6520923, 0.435763, 1, 1, 1, 1, 1,
0.1892951, 0.2626504, -0.4714721, 1, 1, 1, 1, 1,
0.1893014, 2.186251, -0.4954294, 1, 1, 1, 1, 1,
0.1904539, -0.2890714, 2.372018, 1, 1, 1, 1, 1,
0.1922324, 0.2727578, 1.117661, 1, 1, 1, 1, 1,
0.197594, -0.3086226, 4.017689, 1, 1, 1, 1, 1,
0.1977963, 0.1734164, 1.306968, 1, 1, 1, 1, 1,
0.2011688, 1.060129, -0.02643746, 1, 1, 1, 1, 1,
0.2046562, 0.8844225, 0.1796733, 1, 1, 1, 1, 1,
0.2103074, -1.591213, 1.863348, 1, 1, 1, 1, 1,
0.2145942, -0.2641061, 2.114978, 1, 1, 1, 1, 1,
0.2192826, 0.3504556, 0.7865054, 1, 1, 1, 1, 1,
0.2236042, -0.01108289, 1.700408, 1, 1, 1, 1, 1,
0.224694, -0.4704379, 2.592118, 0, 0, 1, 1, 1,
0.2247754, 0.8809292, -1.564921, 1, 0, 0, 1, 1,
0.2312046, 0.168585, 0.9011526, 1, 0, 0, 1, 1,
0.2392972, -0.4420325, 2.836886, 1, 0, 0, 1, 1,
0.2439071, 0.7849892, -0.6428984, 1, 0, 0, 1, 1,
0.2440896, -1.273582, 2.112437, 1, 0, 0, 1, 1,
0.2517532, -0.8541229, 4.40103, 0, 0, 0, 1, 1,
0.2517859, 0.1527927, 2.342301, 0, 0, 0, 1, 1,
0.2529559, -1.657244, 1.891762, 0, 0, 0, 1, 1,
0.2558158, -0.4919071, 1.245526, 0, 0, 0, 1, 1,
0.262251, 0.5351123, -0.7349916, 0, 0, 0, 1, 1,
0.2631054, 1.492999, -0.8204079, 0, 0, 0, 1, 1,
0.2638755, 0.5300165, -0.001650286, 0, 0, 0, 1, 1,
0.264215, 0.9079361, -0.7361075, 1, 1, 1, 1, 1,
0.267271, 2.495423, 0.8471912, 1, 1, 1, 1, 1,
0.269047, 0.2937317, 0.9802021, 1, 1, 1, 1, 1,
0.2696486, 0.4575507, -2.427422e-06, 1, 1, 1, 1, 1,
0.2720106, 1.59716, 2.452649, 1, 1, 1, 1, 1,
0.2837398, 0.08153672, 0.4386187, 1, 1, 1, 1, 1,
0.283822, -0.01363858, 2.711226, 1, 1, 1, 1, 1,
0.2841297, -1.910868, 4.254704, 1, 1, 1, 1, 1,
0.2859439, 0.2093528, 1.49141, 1, 1, 1, 1, 1,
0.2884629, -0.4290045, 2.000036, 1, 1, 1, 1, 1,
0.2906764, 0.04069984, 1.210695, 1, 1, 1, 1, 1,
0.2911609, -0.8073971, 1.582101, 1, 1, 1, 1, 1,
0.2940744, 0.02755878, 0.7116912, 1, 1, 1, 1, 1,
0.2952676, 1.420833, 0.2538537, 1, 1, 1, 1, 1,
0.3010899, -1.930354, 2.88779, 1, 1, 1, 1, 1,
0.3029263, -2.421696, 1.419488, 0, 0, 1, 1, 1,
0.3045559, 1.317313, 1.648982, 1, 0, 0, 1, 1,
0.3075792, -1.310685, 3.441863, 1, 0, 0, 1, 1,
0.3079314, -0.5920736, 2.03459, 1, 0, 0, 1, 1,
0.311583, 0.2967, 0.8189817, 1, 0, 0, 1, 1,
0.3159596, 0.7203127, 2.488475, 1, 0, 0, 1, 1,
0.3162348, -1.555184, 4.404678, 0, 0, 0, 1, 1,
0.3203006, 1.180037, 1.916136, 0, 0, 0, 1, 1,
0.3214894, 0.7970371, 0.7472462, 0, 0, 0, 1, 1,
0.3217505, -1.972606, 3.401121, 0, 0, 0, 1, 1,
0.3224336, 0.03611707, 0.3270673, 0, 0, 0, 1, 1,
0.3254092, 1.523788, -0.204216, 0, 0, 0, 1, 1,
0.3269956, 1.492091, -0.03145765, 0, 0, 0, 1, 1,
0.3380956, 0.7952222, 1.62107, 1, 1, 1, 1, 1,
0.3385758, -2.43514, 3.791696, 1, 1, 1, 1, 1,
0.3386455, 0.5049638, 1.042547, 1, 1, 1, 1, 1,
0.3419327, 0.1414966, 2.369102, 1, 1, 1, 1, 1,
0.3440496, 1.545581, 0.7173854, 1, 1, 1, 1, 1,
0.3501692, 1.135073, 0.5345205, 1, 1, 1, 1, 1,
0.3508648, 0.5426908, 1.975951, 1, 1, 1, 1, 1,
0.3510348, 1.17149, 0.2102722, 1, 1, 1, 1, 1,
0.3582841, 1.60976, 1.150642, 1, 1, 1, 1, 1,
0.360129, 0.9683032, -0.7502375, 1, 1, 1, 1, 1,
0.3614703, -0.1606581, 2.731027, 1, 1, 1, 1, 1,
0.3635029, 0.8645632, 0.120401, 1, 1, 1, 1, 1,
0.3729943, -0.5298467, 2.53728, 1, 1, 1, 1, 1,
0.3739731, 0.6309315, 1.799706, 1, 1, 1, 1, 1,
0.3740949, -0.8346944, 2.955342, 1, 1, 1, 1, 1,
0.3745713, -0.04278187, 1.343032, 0, 0, 1, 1, 1,
0.3753675, -0.01083156, 2.229021, 1, 0, 0, 1, 1,
0.3768737, -0.4582656, 1.92305, 1, 0, 0, 1, 1,
0.3807773, -0.5607733, 1.046711, 1, 0, 0, 1, 1,
0.3852166, 0.2731944, 1.925949, 1, 0, 0, 1, 1,
0.3853812, 0.7020236, 0.7661939, 1, 0, 0, 1, 1,
0.3864121, 1.875447, -0.5923498, 0, 0, 0, 1, 1,
0.3916584, 1.021676, 0.7858856, 0, 0, 0, 1, 1,
0.3930721, -1.784376, 3.605532, 0, 0, 0, 1, 1,
0.3950121, 1.281139, -0.4190804, 0, 0, 0, 1, 1,
0.3953553, -0.6020393, 2.180207, 0, 0, 0, 1, 1,
0.3957256, -0.0372455, 1.723569, 0, 0, 0, 1, 1,
0.3970911, 0.00344261, 2.285438, 0, 0, 0, 1, 1,
0.3971669, 1.838332, 1.393747, 1, 1, 1, 1, 1,
0.3976189, 0.1463368, 1.800923, 1, 1, 1, 1, 1,
0.4015877, -1.63916, 1.639171, 1, 1, 1, 1, 1,
0.4063765, -0.1233646, 2.557898, 1, 1, 1, 1, 1,
0.4083115, -1.472721, 3.846826, 1, 1, 1, 1, 1,
0.4110532, 1.350473, 1.269939, 1, 1, 1, 1, 1,
0.4131883, 0.3685985, 1.046454, 1, 1, 1, 1, 1,
0.4138363, -2.014482, 3.11414, 1, 1, 1, 1, 1,
0.4190641, -1.962133, 2.703787, 1, 1, 1, 1, 1,
0.4198708, -0.2533502, 2.520855, 1, 1, 1, 1, 1,
0.4211409, 0.1928676, 1.117405, 1, 1, 1, 1, 1,
0.4222223, 0.8644811, 1.995953, 1, 1, 1, 1, 1,
0.4275421, -0.3417401, 2.178243, 1, 1, 1, 1, 1,
0.4296402, -0.5323095, 3.736072, 1, 1, 1, 1, 1,
0.4320775, 0.212424, 1.132086, 1, 1, 1, 1, 1,
0.4414845, 0.3559104, 0.9583427, 0, 0, 1, 1, 1,
0.4428257, 0.8698779, 1.22, 1, 0, 0, 1, 1,
0.4436285, -1.405332, 2.913102, 1, 0, 0, 1, 1,
0.4467271, 0.1898516, 0.9955125, 1, 0, 0, 1, 1,
0.4476896, 1.36648, 0.2784959, 1, 0, 0, 1, 1,
0.4481193, -0.5578126, 1.387383, 1, 0, 0, 1, 1,
0.4527296, 0.359179, 1.242737, 0, 0, 0, 1, 1,
0.4620386, 0.4483098, 1.30898, 0, 0, 0, 1, 1,
0.4658001, -0.1619807, 1.810596, 0, 0, 0, 1, 1,
0.4670136, 0.3550135, 0.1647921, 0, 0, 0, 1, 1,
0.467622, -0.9849095, 3.401575, 0, 0, 0, 1, 1,
0.4682591, -1.497131, 2.437262, 0, 0, 0, 1, 1,
0.4686007, 2.413483, 2.270416, 0, 0, 0, 1, 1,
0.4714836, -0.6921992, 3.095623, 1, 1, 1, 1, 1,
0.4719738, 0.1810669, 0.8044477, 1, 1, 1, 1, 1,
0.472245, -0.6123686, 2.541349, 1, 1, 1, 1, 1,
0.4732239, -1.305483, 3.717697, 1, 1, 1, 1, 1,
0.478652, 1.948697, 1.663819, 1, 1, 1, 1, 1,
0.4812699, 1.645782, 0.08012822, 1, 1, 1, 1, 1,
0.4850853, -1.439215, 3.825414, 1, 1, 1, 1, 1,
0.4882475, -0.9637834, 2.507783, 1, 1, 1, 1, 1,
0.4906134, 0.2157556, 1.040854, 1, 1, 1, 1, 1,
0.4920516, -0.2044816, 3.304873, 1, 1, 1, 1, 1,
0.4940138, -1.804994, 3.178366, 1, 1, 1, 1, 1,
0.4998585, -2.006042, 1.768953, 1, 1, 1, 1, 1,
0.5015699, -0.6091626, -0.07808388, 1, 1, 1, 1, 1,
0.5058795, -1.197287, 2.957328, 1, 1, 1, 1, 1,
0.5064085, 0.6295467, 0.8799955, 1, 1, 1, 1, 1,
0.5073441, 0.8208082, -2.278303, 0, 0, 1, 1, 1,
0.5090013, -2.122633, 1.950051, 1, 0, 0, 1, 1,
0.5114473, 1.080966, 0.7668452, 1, 0, 0, 1, 1,
0.5156246, -0.4940444, 0.4673882, 1, 0, 0, 1, 1,
0.5231629, 0.5969182, 0.7395756, 1, 0, 0, 1, 1,
0.5274262, -0.09862135, 1.376404, 1, 0, 0, 1, 1,
0.533717, -0.5958754, 3.551037, 0, 0, 0, 1, 1,
0.5408309, -0.9359164, 1.828147, 0, 0, 0, 1, 1,
0.5410385, 0.1555962, -0.02896978, 0, 0, 0, 1, 1,
0.5421742, -0.5261123, 3.186655, 0, 0, 0, 1, 1,
0.5434795, 1.162172, -1.220941, 0, 0, 0, 1, 1,
0.5475987, 0.4798057, -0.4342189, 0, 0, 0, 1, 1,
0.5498838, -0.7255994, 2.013132, 0, 0, 0, 1, 1,
0.5514066, 0.09961808, 1.261309, 1, 1, 1, 1, 1,
0.5520792, 0.2082167, 1.089927, 1, 1, 1, 1, 1,
0.5556311, 0.04021029, 0.535407, 1, 1, 1, 1, 1,
0.5583978, 0.5219292, 2.407558, 1, 1, 1, 1, 1,
0.5628684, -1.634231, 3.348471, 1, 1, 1, 1, 1,
0.5641393, 0.5586914, -0.5295998, 1, 1, 1, 1, 1,
0.5708829, 0.3037764, 1.054177, 1, 1, 1, 1, 1,
0.573674, 0.2427485, -0.6239398, 1, 1, 1, 1, 1,
0.5799098, 0.2199818, 1.467241, 1, 1, 1, 1, 1,
0.5840168, 2.122811, -0.5129508, 1, 1, 1, 1, 1,
0.5856599, -0.9798202, 2.787432, 1, 1, 1, 1, 1,
0.5875592, 0.4198719, 1.185786, 1, 1, 1, 1, 1,
0.5899593, -2.154006, 3.415834, 1, 1, 1, 1, 1,
0.5906962, 0.6839908, 0.4481255, 1, 1, 1, 1, 1,
0.5910369, -0.6830434, 1.952022, 1, 1, 1, 1, 1,
0.5995289, -0.4646372, 1.648278, 0, 0, 1, 1, 1,
0.5998059, 0.09538773, 2.376463, 1, 0, 0, 1, 1,
0.6011995, -1.588068, 3.153201, 1, 0, 0, 1, 1,
0.6036423, -0.09047332, 2.751208, 1, 0, 0, 1, 1,
0.6081356, -0.3373186, 1.781605, 1, 0, 0, 1, 1,
0.6187356, 0.8401227, 0.5794371, 1, 0, 0, 1, 1,
0.6199276, 0.9679079, 1.061869, 0, 0, 0, 1, 1,
0.6202483, 0.4183247, 1.90558, 0, 0, 0, 1, 1,
0.6287895, -0.2483567, 0.3894178, 0, 0, 0, 1, 1,
0.6288251, -0.4779608, 1.566823, 0, 0, 0, 1, 1,
0.6330736, 0.1359357, 0.2147864, 0, 0, 0, 1, 1,
0.634422, 0.907686, -0.1157608, 0, 0, 0, 1, 1,
0.6359673, 0.9252124, 0.2526869, 0, 0, 0, 1, 1,
0.6369897, 0.06419505, 3.266478, 1, 1, 1, 1, 1,
0.6421417, -0.6739526, 2.217063, 1, 1, 1, 1, 1,
0.6426867, 0.07148983, 3.841454, 1, 1, 1, 1, 1,
0.6568049, 0.6761721, 0.7541606, 1, 1, 1, 1, 1,
0.6697582, 1.605416, 1.458067, 1, 1, 1, 1, 1,
0.6736994, 2.405384, 1.215963, 1, 1, 1, 1, 1,
0.6781052, -0.8708521, 1.159247, 1, 1, 1, 1, 1,
0.6792617, 0.4923667, 1.913291, 1, 1, 1, 1, 1,
0.6796559, -4.469793, 2.040634, 1, 1, 1, 1, 1,
0.6797144, 0.3549497, 1.988071, 1, 1, 1, 1, 1,
0.6821982, 1.280092, 0.6207756, 1, 1, 1, 1, 1,
0.6823767, -0.9074334, 2.356756, 1, 1, 1, 1, 1,
0.6869007, -0.817637, 1.753033, 1, 1, 1, 1, 1,
0.6881049, -0.4980679, 1.633773, 1, 1, 1, 1, 1,
0.6906147, -0.8814515, 1.725907, 1, 1, 1, 1, 1,
0.691353, -0.7457065, 1.845943, 0, 0, 1, 1, 1,
0.6913658, 2.552266, -0.7466795, 1, 0, 0, 1, 1,
0.7030744, -0.6418479, 2.502198, 1, 0, 0, 1, 1,
0.7069401, 0.7702096, -0.9477825, 1, 0, 0, 1, 1,
0.7089036, -0.8211517, 1.63609, 1, 0, 0, 1, 1,
0.7097619, 1.057256, 1.464267, 1, 0, 0, 1, 1,
0.7131309, 0.6365398, 1.674244, 0, 0, 0, 1, 1,
0.7224031, -1.341213, 2.900455, 0, 0, 0, 1, 1,
0.7260372, -0.9002702, 1.834843, 0, 0, 0, 1, 1,
0.7327657, 1.771907, 0.9642734, 0, 0, 0, 1, 1,
0.7342791, 0.8504726, 1.299467, 0, 0, 0, 1, 1,
0.7368652, -0.2685144, 1.903568, 0, 0, 0, 1, 1,
0.7374195, 1.131843, -0.8270242, 0, 0, 0, 1, 1,
0.7385325, -1.355674, 3.09389, 1, 1, 1, 1, 1,
0.740783, 0.3338305, 2.118061, 1, 1, 1, 1, 1,
0.7427335, 0.3064626, 0.9136159, 1, 1, 1, 1, 1,
0.755868, 1.232967, 1.234254, 1, 1, 1, 1, 1,
0.7572642, 0.4597564, -0.960811, 1, 1, 1, 1, 1,
0.758373, -1.284201, 4.788899, 1, 1, 1, 1, 1,
0.7598194, 0.2333099, 0.9733634, 1, 1, 1, 1, 1,
0.7672122, -0.1041176, 0.932048, 1, 1, 1, 1, 1,
0.7681752, 0.7603868, 1.026483, 1, 1, 1, 1, 1,
0.779202, 0.5698657, 1.318567, 1, 1, 1, 1, 1,
0.7796935, 1.524333, -0.3575003, 1, 1, 1, 1, 1,
0.7841793, -0.5213943, 3.179842, 1, 1, 1, 1, 1,
0.7847766, -0.8278494, 3.424013, 1, 1, 1, 1, 1,
0.7884641, 0.0796361, 1.544082, 1, 1, 1, 1, 1,
0.7900023, -0.2480948, 2.886312, 1, 1, 1, 1, 1,
0.7945452, 0.7250707, 1.4288, 0, 0, 1, 1, 1,
0.7946134, -0.5743751, 3.091819, 1, 0, 0, 1, 1,
0.7958642, -0.9471678, 2.704807, 1, 0, 0, 1, 1,
0.7980791, -0.9928936, 0.5303884, 1, 0, 0, 1, 1,
0.7996796, -0.8776603, 4.327637, 1, 0, 0, 1, 1,
0.8048757, -0.2116714, 1.904576, 1, 0, 0, 1, 1,
0.8102269, -0.1138542, 1.881691, 0, 0, 0, 1, 1,
0.8111066, 0.08520933, 2.520381, 0, 0, 0, 1, 1,
0.8112581, -0.2304516, 2.000122, 0, 0, 0, 1, 1,
0.8248746, 0.2608021, 2.112691, 0, 0, 0, 1, 1,
0.8261522, -2.292641, 4.277427, 0, 0, 0, 1, 1,
0.8264273, -1.710166, 1.792795, 0, 0, 0, 1, 1,
0.8440225, -0.05562859, 0.461985, 0, 0, 0, 1, 1,
0.8505878, -0.04230835, 2.774978, 1, 1, 1, 1, 1,
0.8512517, 1.472662, 1.477869, 1, 1, 1, 1, 1,
0.8566452, -0.3337106, 1.781813, 1, 1, 1, 1, 1,
0.8607042, -0.1341937, 1.953419, 1, 1, 1, 1, 1,
0.8627344, -0.9073668, 1.676142, 1, 1, 1, 1, 1,
0.8665841, -1.329885, 3.889115, 1, 1, 1, 1, 1,
0.8671649, 0.008929549, -0.3727194, 1, 1, 1, 1, 1,
0.8752087, -0.692965, 1.091517, 1, 1, 1, 1, 1,
0.881774, 1.42241, 0.2574836, 1, 1, 1, 1, 1,
0.8851973, -0.0273652, 3.374501, 1, 1, 1, 1, 1,
0.8884571, 1.661399, 0.324205, 1, 1, 1, 1, 1,
0.8935047, -2.143587, 3.281032, 1, 1, 1, 1, 1,
0.8940942, -0.355765, 1.842981, 1, 1, 1, 1, 1,
0.899323, -0.7404284, 1.179119, 1, 1, 1, 1, 1,
0.9025793, 0.8592128, 1.233014, 1, 1, 1, 1, 1,
0.9036322, -0.08812731, 1.137276, 0, 0, 1, 1, 1,
0.9058012, -1.944771, 3.84888, 1, 0, 0, 1, 1,
0.9071987, 0.2434239, 1.641458, 1, 0, 0, 1, 1,
0.9074165, -0.8018346, 1.06702, 1, 0, 0, 1, 1,
0.914348, -1.706793, 1.186443, 1, 0, 0, 1, 1,
0.9147862, 0.4401648, 0.9159524, 1, 0, 0, 1, 1,
0.9155903, 0.6905825, 1.681249, 0, 0, 0, 1, 1,
0.9169514, -0.2469797, 2.667033, 0, 0, 0, 1, 1,
0.9186389, 0.8372706, 0.7243931, 0, 0, 0, 1, 1,
0.920453, 1.040538, 1.626127, 0, 0, 0, 1, 1,
0.9228286, -0.7884036, 1.971461, 0, 0, 0, 1, 1,
0.9275013, -0.8327209, 4.147417, 0, 0, 0, 1, 1,
0.9302334, -0.3069263, 0.4291456, 0, 0, 0, 1, 1,
0.9327742, 0.2904491, 2.039328, 1, 1, 1, 1, 1,
0.9329808, -1.050696, 3.940313, 1, 1, 1, 1, 1,
0.9366603, -1.522527, 3.352045, 1, 1, 1, 1, 1,
0.9380594, -0.6768346, 2.393739, 1, 1, 1, 1, 1,
0.9391647, -0.217343, 2.044115, 1, 1, 1, 1, 1,
0.9407417, 1.802538, 0.7267448, 1, 1, 1, 1, 1,
0.9447606, 0.6235164, 0.6367758, 1, 1, 1, 1, 1,
0.9457081, 1.04449, 1.053343, 1, 1, 1, 1, 1,
0.9470416, -0.03484067, 0.4881337, 1, 1, 1, 1, 1,
0.9471677, 0.2397037, 2.022332, 1, 1, 1, 1, 1,
0.9489468, 0.5765905, 0.5100194, 1, 1, 1, 1, 1,
0.9527717, 0.395384, 2.066701, 1, 1, 1, 1, 1,
0.9532025, -1.000634, 5.253736, 1, 1, 1, 1, 1,
0.9603922, -0.2126846, 2.016846, 1, 1, 1, 1, 1,
0.963996, 1.019999, 2.893702, 1, 1, 1, 1, 1,
0.9690818, 0.5695011, 1.676478, 0, 0, 1, 1, 1,
0.9774913, -1.234583, 2.796415, 1, 0, 0, 1, 1,
0.9778214, -1.103002, 2.636223, 1, 0, 0, 1, 1,
0.9830549, 0.4131115, 2.092584, 1, 0, 0, 1, 1,
0.9838424, 0.6466407, 1.435004, 1, 0, 0, 1, 1,
0.9839998, 0.6380602, 2.838776, 1, 0, 0, 1, 1,
0.9874277, 1.12179, -1.61387, 0, 0, 0, 1, 1,
0.9875695, -0.2293085, 0.8412647, 0, 0, 0, 1, 1,
0.9893901, -0.6881278, 2.753538, 0, 0, 0, 1, 1,
0.9899407, -0.5274546, 1.97158, 0, 0, 0, 1, 1,
1.003907, -0.3641239, 2.863592, 0, 0, 0, 1, 1,
1.007929, -0.3097909, 1.280675, 0, 0, 0, 1, 1,
1.007939, 1.53954, 1.716721, 0, 0, 0, 1, 1,
1.014203, -0.3834922, 3.246588, 1, 1, 1, 1, 1,
1.020116, -0.07323384, 1.319247, 1, 1, 1, 1, 1,
1.025296, -1.609287, 2.015596, 1, 1, 1, 1, 1,
1.026591, -1.760204, 1.356637, 1, 1, 1, 1, 1,
1.044984, -1.131617, 1.740456, 1, 1, 1, 1, 1,
1.047379, 2.230181, -0.03271307, 1, 1, 1, 1, 1,
1.048604, 1.081516, 0.04994328, 1, 1, 1, 1, 1,
1.051851, -2.177969, 4.299262, 1, 1, 1, 1, 1,
1.063381, -0.8917757, 2.108653, 1, 1, 1, 1, 1,
1.063827, 0.7296468, -0.5765838, 1, 1, 1, 1, 1,
1.06938, 0.1963878, 2.587249, 1, 1, 1, 1, 1,
1.079197, 1.112974, 0.7414883, 1, 1, 1, 1, 1,
1.08331, 1.733233, 0.8715304, 1, 1, 1, 1, 1,
1.083679, 1.550471, -0.1970206, 1, 1, 1, 1, 1,
1.084779, -0.3474754, 0.4735604, 1, 1, 1, 1, 1,
1.097001, -1.690378, 2.121506, 0, 0, 1, 1, 1,
1.103189, -0.6301264, 2.822703, 1, 0, 0, 1, 1,
1.111431, -2.211857, 2.83847, 1, 0, 0, 1, 1,
1.127376, 0.7936332, 2.220193, 1, 0, 0, 1, 1,
1.127635, 0.4348854, 0.6610297, 1, 0, 0, 1, 1,
1.131937, 0.3689425, 2.393438, 1, 0, 0, 1, 1,
1.136753, 0.8430944, -0.1853254, 0, 0, 0, 1, 1,
1.139123, -0.5702965, 1.068174, 0, 0, 0, 1, 1,
1.14007, -0.3550787, 1.891257, 0, 0, 0, 1, 1,
1.144261, 0.4210883, 2.216545, 0, 0, 0, 1, 1,
1.145775, 0.2824816, 0.4277168, 0, 0, 0, 1, 1,
1.150193, 0.7485669, 1.372589, 0, 0, 0, 1, 1,
1.152683, -0.6389732, 2.348987, 0, 0, 0, 1, 1,
1.159667, -0.3047304, 0.8238541, 1, 1, 1, 1, 1,
1.160726, 0.0001776623, 0.9782163, 1, 1, 1, 1, 1,
1.177093, -0.7779139, 1.968627, 1, 1, 1, 1, 1,
1.178455, -0.7835241, 2.894239, 1, 1, 1, 1, 1,
1.184365, 0.6297054, 0.03699324, 1, 1, 1, 1, 1,
1.188751, -0.9928908, 1.434828, 1, 1, 1, 1, 1,
1.204759, 0.8588364, 1.249088, 1, 1, 1, 1, 1,
1.212175, 0.2621245, 0.8672101, 1, 1, 1, 1, 1,
1.212398, -0.7405167, 2.575675, 1, 1, 1, 1, 1,
1.213768, -2.52871, 3.01888, 1, 1, 1, 1, 1,
1.229394, 1.808586, -0.1007937, 1, 1, 1, 1, 1,
1.229974, 0.9279444, -0.9409983, 1, 1, 1, 1, 1,
1.230475, 1.398428, 1.370172, 1, 1, 1, 1, 1,
1.230548, -0.8934698, 1.497945, 1, 1, 1, 1, 1,
1.236051, -1.645656, 2.634107, 1, 1, 1, 1, 1,
1.237813, 2.998916, 0.04797765, 0, 0, 1, 1, 1,
1.239398, -1.655317, 2.694042, 1, 0, 0, 1, 1,
1.250883, -0.2897173, 1.392298, 1, 0, 0, 1, 1,
1.25822, -0.385881, 2.503815, 1, 0, 0, 1, 1,
1.281583, -0.5135812, 1.244772, 1, 0, 0, 1, 1,
1.282815, 0.2715074, 1.883452, 1, 0, 0, 1, 1,
1.289, 3.291153, 0.9032814, 0, 0, 0, 1, 1,
1.290187, 1.632237, 0.3581365, 0, 0, 0, 1, 1,
1.294296, 0.1224094, 0.4141856, 0, 0, 0, 1, 1,
1.301917, 0.7493005, 0.4787638, 0, 0, 0, 1, 1,
1.317219, 1.380505, 0.8694988, 0, 0, 0, 1, 1,
1.318371, -0.637742, 1.78669, 0, 0, 0, 1, 1,
1.319435, 0.5978554, 1.579982, 0, 0, 0, 1, 1,
1.320846, 0.706247, -0.8894539, 1, 1, 1, 1, 1,
1.327086, 0.8656071, 1.886012, 1, 1, 1, 1, 1,
1.335298, -0.5767282, 0.830672, 1, 1, 1, 1, 1,
1.358986, 0.7989459, 0.6097606, 1, 1, 1, 1, 1,
1.362632, 2.116791, 1.790855, 1, 1, 1, 1, 1,
1.376296, -0.6228382, 1.702675, 1, 1, 1, 1, 1,
1.381574, 1.148096, 0.06347763, 1, 1, 1, 1, 1,
1.38316, -0.3326892, 2.827067, 1, 1, 1, 1, 1,
1.39903, 1.435588, -0.3374173, 1, 1, 1, 1, 1,
1.40039, -0.08590759, 0.7883955, 1, 1, 1, 1, 1,
1.408074, 0.9453015, 0.721217, 1, 1, 1, 1, 1,
1.426238, -0.4244388, 0.5361001, 1, 1, 1, 1, 1,
1.426806, -0.5335948, 1.837064, 1, 1, 1, 1, 1,
1.426823, 1.168156, 1.68061, 1, 1, 1, 1, 1,
1.42924, -0.248409, 4.024652, 1, 1, 1, 1, 1,
1.434678, -0.4749456, 1.232986, 0, 0, 1, 1, 1,
1.438133, 2.634999, 0.9391298, 1, 0, 0, 1, 1,
1.440651, 1.359606, 1.349283, 1, 0, 0, 1, 1,
1.447284, 2.053613, -0.1456118, 1, 0, 0, 1, 1,
1.451058, 0.2302041, 0.5014393, 1, 0, 0, 1, 1,
1.454436, 0.8870273, 0.3147274, 1, 0, 0, 1, 1,
1.457415, 1.50581, 0.04509172, 0, 0, 0, 1, 1,
1.457549, -1.870251, 2.245733, 0, 0, 0, 1, 1,
1.467954, 0.5922728, 1.859547, 0, 0, 0, 1, 1,
1.469021, -0.08975799, 2.784489, 0, 0, 0, 1, 1,
1.484396, -0.630193, 2.971533, 0, 0, 0, 1, 1,
1.484595, 0.7050161, 1.217612, 0, 0, 0, 1, 1,
1.488277, 0.3221295, -0.03318292, 0, 0, 0, 1, 1,
1.502162, -0.1030811, 2.335284, 1, 1, 1, 1, 1,
1.522404, 0.3742496, 0.7884477, 1, 1, 1, 1, 1,
1.523306, -0.5613275, 3.473052, 1, 1, 1, 1, 1,
1.559262, 0.04161085, 2.704461, 1, 1, 1, 1, 1,
1.562973, -0.9979577, 2.558937, 1, 1, 1, 1, 1,
1.578705, -0.5678228, 2.337315, 1, 1, 1, 1, 1,
1.58915, -0.7559991, 2.666737, 1, 1, 1, 1, 1,
1.593933, 0.334204, 0.6270167, 1, 1, 1, 1, 1,
1.602672, 0.2052288, 3.193754, 1, 1, 1, 1, 1,
1.610519, 0.9740814, 0.7168972, 1, 1, 1, 1, 1,
1.623558, 1.015655, 1.692785, 1, 1, 1, 1, 1,
1.627718, 0.2518634, 1.803222, 1, 1, 1, 1, 1,
1.633611, 1.150176, 1.100016, 1, 1, 1, 1, 1,
1.636172, -0.9284123, 4.533319, 1, 1, 1, 1, 1,
1.642149, 0.7519904, 2.12578, 1, 1, 1, 1, 1,
1.65002, 1.695549, 0.5881376, 0, 0, 1, 1, 1,
1.65123, -1.53345, 0.6856677, 1, 0, 0, 1, 1,
1.655967, -0.7976177, 2.669335, 1, 0, 0, 1, 1,
1.662986, 0.568624, -0.05495182, 1, 0, 0, 1, 1,
1.705439, -1.837639, 1.428343, 1, 0, 0, 1, 1,
1.716346, -0.1990077, 1.426822, 1, 0, 0, 1, 1,
1.729786, 0.4986877, 1.270053, 0, 0, 0, 1, 1,
1.756371, -0.36685, 3.635493, 0, 0, 0, 1, 1,
1.76072, 0.505632, 0.2323419, 0, 0, 0, 1, 1,
1.763585, 0.8098325, 0.6305411, 0, 0, 0, 1, 1,
1.765834, -0.8635921, 3.673365, 0, 0, 0, 1, 1,
1.77456, 0.9444043, -0.01337381, 0, 0, 0, 1, 1,
1.803509, -0.2229922, 1.501927, 0, 0, 0, 1, 1,
1.82594, 0.05517653, 2.70518, 1, 1, 1, 1, 1,
1.826041, -3.001923, 2.278767, 1, 1, 1, 1, 1,
1.838161, -0.2196093, 1.076652, 1, 1, 1, 1, 1,
1.8458, 0.04539771, 2.232549, 1, 1, 1, 1, 1,
1.847835, 0.5804551, 1.944726, 1, 1, 1, 1, 1,
1.85047, 0.4408941, 2.105948, 1, 1, 1, 1, 1,
1.853571, -0.7500224, 2.437246, 1, 1, 1, 1, 1,
1.859741, -0.9313069, 1.184936, 1, 1, 1, 1, 1,
1.901835, -0.5893413, 1.963922, 1, 1, 1, 1, 1,
1.903007, -0.9410548, 1.013358, 1, 1, 1, 1, 1,
1.911514, -1.084959, 2.375991, 1, 1, 1, 1, 1,
1.943395, 0.8021318, 2.318655, 1, 1, 1, 1, 1,
1.971954, 0.6784752, -0.3559223, 1, 1, 1, 1, 1,
1.994753, -0.2764914, 1.762135, 1, 1, 1, 1, 1,
2.01291, 0.964008, 0.3141958, 1, 1, 1, 1, 1,
2.024709, -0.7135268, 1.03087, 0, 0, 1, 1, 1,
2.036907, -1.201704, 1.845773, 1, 0, 0, 1, 1,
2.086607, -0.5535198, 1.505278, 1, 0, 0, 1, 1,
2.095076, 0.755686, 2.612618, 1, 0, 0, 1, 1,
2.103408, -0.07125258, 1.527503, 1, 0, 0, 1, 1,
2.117343, 0.08666804, 1.482096, 1, 0, 0, 1, 1,
2.137916, 0.5504594, 2.941892, 0, 0, 0, 1, 1,
2.180105, 0.1278175, 1.247415, 0, 0, 0, 1, 1,
2.180894, -0.9148123, 2.922867, 0, 0, 0, 1, 1,
2.184176, -0.172268, 2.014725, 0, 0, 0, 1, 1,
2.268209, 0.3839806, 1.755117, 0, 0, 0, 1, 1,
2.354164, 0.134377, 3.149218, 0, 0, 0, 1, 1,
2.35837, 0.9684162, 1.213647, 0, 0, 0, 1, 1,
2.397971, 0.4127571, -0.9895965, 1, 1, 1, 1, 1,
2.416539, 0.565568, 3.030905, 1, 1, 1, 1, 1,
2.442357, 0.529528, 3.312054, 1, 1, 1, 1, 1,
2.918656, 0.62344, 3.066655, 1, 1, 1, 1, 1,
3.05683, -0.2096418, 2.038232, 1, 1, 1, 1, 1,
3.185895, 0.4767826, 1.108485, 1, 1, 1, 1, 1,
3.42777, -0.03228418, 1.487462, 1, 1, 1, 1, 1
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
var radius = 10.1699;
var distance = 35.72133;
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
mvMatrix.translate( 0.2892621, 0.2382009, -0.403713 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.72133);
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
