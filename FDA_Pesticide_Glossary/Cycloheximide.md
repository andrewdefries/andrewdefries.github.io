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
-3.318443, 0.5170361, -0.6569265, 1, 0, 0, 1,
-2.874419, 0.1256017, -2.525281, 1, 0.007843138, 0, 1,
-2.550574, 0.313061, -1.610467, 1, 0.01176471, 0, 1,
-2.521799, 0.1604998, -1.914224, 1, 0.01960784, 0, 1,
-2.480678, 0.6093085, -1.356217, 1, 0.02352941, 0, 1,
-2.465035, -0.4001215, -1.858462, 1, 0.03137255, 0, 1,
-2.461563, -0.2413417, -2.286504, 1, 0.03529412, 0, 1,
-2.448825, 1.752583, 0.1396487, 1, 0.04313726, 0, 1,
-2.371441, -0.1509604, -1.674293, 1, 0.04705882, 0, 1,
-2.359191, 0.6810313, -0.9259706, 1, 0.05490196, 0, 1,
-2.358323, 2.003897, -0.9063722, 1, 0.05882353, 0, 1,
-2.351662, 0.3850719, -1.286995, 1, 0.06666667, 0, 1,
-2.276429, -0.7386154, -2.513093, 1, 0.07058824, 0, 1,
-2.27466, 0.1082505, -1.715065, 1, 0.07843138, 0, 1,
-2.268396, -1.114609, -4.074203, 1, 0.08235294, 0, 1,
-2.256623, 1.184308, -0.8185738, 1, 0.09019608, 0, 1,
-2.232552, -1.571687, -1.267269, 1, 0.09411765, 0, 1,
-2.22263, -2.638039, -2.0971, 1, 0.1019608, 0, 1,
-2.216336, -1.787812, -3.781269, 1, 0.1098039, 0, 1,
-2.186637, 1.295452, -1.583436, 1, 0.1137255, 0, 1,
-2.177885, -1.411338, -3.250792, 1, 0.1215686, 0, 1,
-2.12784, 0.6377444, -1.44417, 1, 0.1254902, 0, 1,
-2.108438, 0.01876507, -1.25984, 1, 0.1333333, 0, 1,
-2.090598, 0.4758186, -1.410841, 1, 0.1372549, 0, 1,
-2.055507, 0.8746101, -3.172671, 1, 0.145098, 0, 1,
-2.049173, 0.3786352, -1.174323, 1, 0.1490196, 0, 1,
-2.025887, 1.067915, -0.7627162, 1, 0.1568628, 0, 1,
-2.025169, 1.727072, -1.144654, 1, 0.1607843, 0, 1,
-1.986404, -1.135479, -1.677722, 1, 0.1686275, 0, 1,
-1.954026, 1.972585, -0.144762, 1, 0.172549, 0, 1,
-1.928761, 0.1446577, 0.1156161, 1, 0.1803922, 0, 1,
-1.892018, -1.580402, -2.751368, 1, 0.1843137, 0, 1,
-1.844873, -0.05870286, -1.793355, 1, 0.1921569, 0, 1,
-1.837, 0.4104857, 0.8412461, 1, 0.1960784, 0, 1,
-1.833353, 2.585626, -0.1108131, 1, 0.2039216, 0, 1,
-1.798162, 0.003773691, -2.810343, 1, 0.2117647, 0, 1,
-1.796698, 1.289973, -0.4344757, 1, 0.2156863, 0, 1,
-1.792559, -0.1805253, -0.8799798, 1, 0.2235294, 0, 1,
-1.790802, -0.5010602, -0.6527784, 1, 0.227451, 0, 1,
-1.76652, 0.7484863, -0.08069912, 1, 0.2352941, 0, 1,
-1.743393, -1.183773, -1.440703, 1, 0.2392157, 0, 1,
-1.742613, 1.621634, 0.4859808, 1, 0.2470588, 0, 1,
-1.731468, 0.929041, 0.4269539, 1, 0.2509804, 0, 1,
-1.724162, 0.3935284, -1.727217, 1, 0.2588235, 0, 1,
-1.714393, 2.641847, 0.6802781, 1, 0.2627451, 0, 1,
-1.711184, 0.0798259, 0.978942, 1, 0.2705882, 0, 1,
-1.681462, 0.2606126, -0.5012435, 1, 0.2745098, 0, 1,
-1.656909, -1.353525, -1.852852, 1, 0.282353, 0, 1,
-1.656772, -2.052188, -1.175678, 1, 0.2862745, 0, 1,
-1.656164, -0.2257805, -1.48696, 1, 0.2941177, 0, 1,
-1.648958, 0.1064723, -1.328476, 1, 0.3019608, 0, 1,
-1.634826, -0.2154533, -1.179922, 1, 0.3058824, 0, 1,
-1.629008, -0.809932, -2.880987, 1, 0.3137255, 0, 1,
-1.623683, -0.7733261, -1.775326, 1, 0.3176471, 0, 1,
-1.611454, 1.346197, -2.121134, 1, 0.3254902, 0, 1,
-1.610186, -0.8411114, -1.329059, 1, 0.3294118, 0, 1,
-1.606742, -0.06036733, -1.407981, 1, 0.3372549, 0, 1,
-1.600389, -1.547943, -1.886794, 1, 0.3411765, 0, 1,
-1.597659, 0.773773, -1.302227, 1, 0.3490196, 0, 1,
-1.594016, -1.158803, -3.308256, 1, 0.3529412, 0, 1,
-1.590446, 0.07534598, -0.5227172, 1, 0.3607843, 0, 1,
-1.579569, -1.118524, -2.495256, 1, 0.3647059, 0, 1,
-1.568296, -2.050521, -1.590873, 1, 0.372549, 0, 1,
-1.566844, -1.012465, -3.552643, 1, 0.3764706, 0, 1,
-1.566044, -1.28255, -0.4171976, 1, 0.3843137, 0, 1,
-1.556777, -1.351349, -5.361338, 1, 0.3882353, 0, 1,
-1.523516, -0.03856029, -3.061826, 1, 0.3960784, 0, 1,
-1.511287, 0.8228796, -2.600249, 1, 0.4039216, 0, 1,
-1.495816, -0.7530339, -3.350244, 1, 0.4078431, 0, 1,
-1.475775, -0.1159363, -1.703329, 1, 0.4156863, 0, 1,
-1.475407, 0.4081185, -1.637535, 1, 0.4196078, 0, 1,
-1.462087, 1.387993, -1.625386, 1, 0.427451, 0, 1,
-1.45074, -0.7046648, -2.264903, 1, 0.4313726, 0, 1,
-1.442774, 0.7130336, -0.1945552, 1, 0.4392157, 0, 1,
-1.43313, 0.01565874, -1.429705, 1, 0.4431373, 0, 1,
-1.429053, 0.3221585, 0.1194352, 1, 0.4509804, 0, 1,
-1.427025, 0.9804911, 0.3793992, 1, 0.454902, 0, 1,
-1.410008, 1.240734, -1.437037, 1, 0.4627451, 0, 1,
-1.406184, 2.489678, -1.371606, 1, 0.4666667, 0, 1,
-1.405434, -0.7879897, -4.869499, 1, 0.4745098, 0, 1,
-1.399381, 1.360065, -1.384902, 1, 0.4784314, 0, 1,
-1.390356, -0.4351684, -1.691433, 1, 0.4862745, 0, 1,
-1.37773, -1.950684, -3.527899, 1, 0.4901961, 0, 1,
-1.37426, 0.0123492, -0.9838857, 1, 0.4980392, 0, 1,
-1.371887, 1.490299, -1.073779, 1, 0.5058824, 0, 1,
-1.371748, 0.1400304, -1.347144, 1, 0.509804, 0, 1,
-1.348301, -0.9062232, -1.050794, 1, 0.5176471, 0, 1,
-1.346735, -1.842731, -2.85868, 1, 0.5215687, 0, 1,
-1.333494, -0.1278049, -1.586633, 1, 0.5294118, 0, 1,
-1.324746, -1.088796, -2.188878, 1, 0.5333334, 0, 1,
-1.323487, -0.9574207, -2.45844, 1, 0.5411765, 0, 1,
-1.322671, 1.093643, -0.3481277, 1, 0.5450981, 0, 1,
-1.315966, 0.02907426, -2.50504, 1, 0.5529412, 0, 1,
-1.312119, 0.4156335, -0.9979648, 1, 0.5568628, 0, 1,
-1.304691, -0.6077074, -2.972524, 1, 0.5647059, 0, 1,
-1.280954, 1.733029, 1.875087, 1, 0.5686275, 0, 1,
-1.272873, 0.6983253, -2.039606, 1, 0.5764706, 0, 1,
-1.271799, 0.6471134, 0.7300253, 1, 0.5803922, 0, 1,
-1.267959, -0.7977675, -2.062942, 1, 0.5882353, 0, 1,
-1.266215, 0.6801549, -2.03955, 1, 0.5921569, 0, 1,
-1.264212, -1.405832, -2.518856, 1, 0.6, 0, 1,
-1.261724, 0.2355824, -3.033477, 1, 0.6078432, 0, 1,
-1.248519, 0.338601, -0.533902, 1, 0.6117647, 0, 1,
-1.245377, -0.8747687, -3.043165, 1, 0.6196079, 0, 1,
-1.240651, -0.1576312, -2.166485, 1, 0.6235294, 0, 1,
-1.240105, -0.3727988, -1.286767, 1, 0.6313726, 0, 1,
-1.237062, 1.455211, -0.5336611, 1, 0.6352941, 0, 1,
-1.236807, -1.17531, -0.109358, 1, 0.6431373, 0, 1,
-1.23623, -2.423987, -2.569696, 1, 0.6470588, 0, 1,
-1.235086, 0.1117581, -2.846281, 1, 0.654902, 0, 1,
-1.234981, 0.1429017, -2.796381, 1, 0.6588235, 0, 1,
-1.228892, 0.05215739, -1.227006, 1, 0.6666667, 0, 1,
-1.22828, 0.1840734, -2.305486, 1, 0.6705883, 0, 1,
-1.228146, -0.7264202, -2.415554, 1, 0.6784314, 0, 1,
-1.225656, -0.9119927, -0.3540767, 1, 0.682353, 0, 1,
-1.204342, -0.8206008, -0.5999377, 1, 0.6901961, 0, 1,
-1.204012, 0.7969296, -1.289553, 1, 0.6941177, 0, 1,
-1.202943, -0.2159328, -1.657364, 1, 0.7019608, 0, 1,
-1.186593, -0.986925, -0.5495144, 1, 0.7098039, 0, 1,
-1.175606, -0.1784981, -3.056791, 1, 0.7137255, 0, 1,
-1.175437, 0.01221899, -0.849529, 1, 0.7215686, 0, 1,
-1.175365, -0.5334233, -1.167711, 1, 0.7254902, 0, 1,
-1.174948, -0.28497, -1.359062, 1, 0.7333333, 0, 1,
-1.17344, 0.9949108, -2.955816, 1, 0.7372549, 0, 1,
-1.173241, 0.9806058, -1.304054, 1, 0.7450981, 0, 1,
-1.172334, -0.1304497, -1.629048, 1, 0.7490196, 0, 1,
-1.170187, 2.069992, -0.8380718, 1, 0.7568628, 0, 1,
-1.167878, 1.338647, -0.6124677, 1, 0.7607843, 0, 1,
-1.158279, -0.391712, -3.332501, 1, 0.7686275, 0, 1,
-1.157028, -1.362938, -3.983473, 1, 0.772549, 0, 1,
-1.151516, -1.728163, -3.44751, 1, 0.7803922, 0, 1,
-1.150779, -0.03468888, -1.618807, 1, 0.7843137, 0, 1,
-1.144807, 1.006139, 0.25453, 1, 0.7921569, 0, 1,
-1.144333, 0.5496438, -0.7773224, 1, 0.7960784, 0, 1,
-1.143113, 1.626433, -1.046308, 1, 0.8039216, 0, 1,
-1.13515, 0.5755424, -0.7756083, 1, 0.8117647, 0, 1,
-1.133466, -0.8119339, -3.425754, 1, 0.8156863, 0, 1,
-1.132713, -0.6739411, -2.393361, 1, 0.8235294, 0, 1,
-1.12236, -0.7924755, -1.796893, 1, 0.827451, 0, 1,
-1.119023, 1.066344, -1.044719, 1, 0.8352941, 0, 1,
-1.118851, 0.01984921, -1.729997, 1, 0.8392157, 0, 1,
-1.116876, -0.1810671, -1.448846, 1, 0.8470588, 0, 1,
-1.112642, 2.545297, 0.309233, 1, 0.8509804, 0, 1,
-1.103595, -0.8451219, -2.014143, 1, 0.8588235, 0, 1,
-1.08321, 0.2050684, -0.9385919, 1, 0.8627451, 0, 1,
-1.07643, -1.364779, -2.12559, 1, 0.8705882, 0, 1,
-1.076332, -0.5299239, -3.53841, 1, 0.8745098, 0, 1,
-1.074119, 0.8562405, -0.2605189, 1, 0.8823529, 0, 1,
-1.072382, 0.9423637, 0.06992412, 1, 0.8862745, 0, 1,
-1.064968, -0.3196133, -2.853324, 1, 0.8941177, 0, 1,
-1.064747, -0.4008728, -3.339181, 1, 0.8980392, 0, 1,
-1.061869, 0.5800576, -0.5194655, 1, 0.9058824, 0, 1,
-1.056659, 1.132116, -1.511583, 1, 0.9137255, 0, 1,
-1.056569, 0.2984757, -1.761764, 1, 0.9176471, 0, 1,
-1.053795, 0.5374995, -1.995394, 1, 0.9254902, 0, 1,
-1.051591, 0.6700166, 0.4251128, 1, 0.9294118, 0, 1,
-1.047716, 1.112982, -1.531028, 1, 0.9372549, 0, 1,
-1.047482, 0.3861172, -1.319831, 1, 0.9411765, 0, 1,
-1.040361, 1.110567, -1.79107, 1, 0.9490196, 0, 1,
-1.039044, 0.3329802, -2.102452, 1, 0.9529412, 0, 1,
-1.036625, -0.4042533, -1.488096, 1, 0.9607843, 0, 1,
-1.030691, 0.1564045, -1.385287, 1, 0.9647059, 0, 1,
-1.029118, -1.175666, -3.305434, 1, 0.972549, 0, 1,
-1.023468, 0.3203183, -1.722268, 1, 0.9764706, 0, 1,
-1.008211, 1.799732, -1.711278, 1, 0.9843137, 0, 1,
-1.002977, -1.141224, -2.18863, 1, 0.9882353, 0, 1,
-1.000975, -1.061407, -2.557567, 1, 0.9960784, 0, 1,
-0.9988405, -0.6595657, -1.591124, 0.9960784, 1, 0, 1,
-0.9930745, -0.4030582, -2.093516, 0.9921569, 1, 0, 1,
-0.9905766, 0.2821199, -0.4028758, 0.9843137, 1, 0, 1,
-0.9832077, -0.2018839, -2.26312, 0.9803922, 1, 0, 1,
-0.9719304, -1.750433, -5.356746, 0.972549, 1, 0, 1,
-0.9713505, -1.441038, -2.145149, 0.9686275, 1, 0, 1,
-0.9671052, 1.103414, -0.0777998, 0.9607843, 1, 0, 1,
-0.9648176, 0.04474624, -1.444252, 0.9568627, 1, 0, 1,
-0.9634119, -1.848352, -3.166435, 0.9490196, 1, 0, 1,
-0.9629096, 0.6690191, -0.5130055, 0.945098, 1, 0, 1,
-0.9587212, -1.054607, -2.244455, 0.9372549, 1, 0, 1,
-0.9555227, 1.626301, 0.2125195, 0.9333333, 1, 0, 1,
-0.9445174, -0.3194249, -1.426583, 0.9254902, 1, 0, 1,
-0.9252551, 0.6570294, -1.281829, 0.9215686, 1, 0, 1,
-0.91315, 0.5104941, -0.7698423, 0.9137255, 1, 0, 1,
-0.9126752, 0.4126212, -0.3908556, 0.9098039, 1, 0, 1,
-0.9124781, -1.618081, -3.832923, 0.9019608, 1, 0, 1,
-0.9121955, 1.208164, -2.358427, 0.8941177, 1, 0, 1,
-0.9033601, -0.4093128, -2.1871, 0.8901961, 1, 0, 1,
-0.8854837, -0.879598, -2.070438, 0.8823529, 1, 0, 1,
-0.8799665, 0.6154771, -0.04466539, 0.8784314, 1, 0, 1,
-0.8779568, 0.6207631, -2.976259, 0.8705882, 1, 0, 1,
-0.8765964, 0.1371228, -1.100195, 0.8666667, 1, 0, 1,
-0.8662595, 0.9692688, -0.9992336, 0.8588235, 1, 0, 1,
-0.861285, 0.6593031, -0.5088459, 0.854902, 1, 0, 1,
-0.8600506, -0.8903005, -4.088275, 0.8470588, 1, 0, 1,
-0.858744, -0.4203158, 0.2960462, 0.8431373, 1, 0, 1,
-0.8489074, -0.5420631, -4.165524, 0.8352941, 1, 0, 1,
-0.8486671, -0.0592566, -1.800944, 0.8313726, 1, 0, 1,
-0.8445539, 0.9006929, -0.9230596, 0.8235294, 1, 0, 1,
-0.8411134, -0.7847764, -3.961277, 0.8196079, 1, 0, 1,
-0.8399128, 0.49873, -1.184755, 0.8117647, 1, 0, 1,
-0.833524, -2.418643, -3.245369, 0.8078431, 1, 0, 1,
-0.8193485, 0.9789395, -1.772715, 0.8, 1, 0, 1,
-0.8151953, 2.673571, -1.194175, 0.7921569, 1, 0, 1,
-0.8142044, 1.579835, -0.5228819, 0.7882353, 1, 0, 1,
-0.8086087, -2.02692, -3.210688, 0.7803922, 1, 0, 1,
-0.8049821, 0.4551861, -2.23576, 0.7764706, 1, 0, 1,
-0.799515, 0.2670687, -3.01381, 0.7686275, 1, 0, 1,
-0.7939743, 1.084161, -1.683065, 0.7647059, 1, 0, 1,
-0.791262, -1.526719, -3.376006, 0.7568628, 1, 0, 1,
-0.7895897, 0.5088111, -1.515161, 0.7529412, 1, 0, 1,
-0.777681, 0.2167322, -1.603947, 0.7450981, 1, 0, 1,
-0.7765045, 0.1569645, -1.251561, 0.7411765, 1, 0, 1,
-0.7709541, 0.6994876, -0.1321037, 0.7333333, 1, 0, 1,
-0.7708938, 0.9935818, 1.143242, 0.7294118, 1, 0, 1,
-0.7694501, -1.755898, -2.303682, 0.7215686, 1, 0, 1,
-0.7517965, -2.296801, -3.700436, 0.7176471, 1, 0, 1,
-0.7501746, 0.6142138, -0.1078731, 0.7098039, 1, 0, 1,
-0.7451274, 1.294721, -0.9899079, 0.7058824, 1, 0, 1,
-0.7434981, 0.4565271, -1.617538, 0.6980392, 1, 0, 1,
-0.7433759, 0.4257504, -0.1235073, 0.6901961, 1, 0, 1,
-0.7407709, 1.937769, 0.3152111, 0.6862745, 1, 0, 1,
-0.7373595, 0.2764067, -2.183818, 0.6784314, 1, 0, 1,
-0.7366672, -2.29364, -2.964268, 0.6745098, 1, 0, 1,
-0.7364416, 1.271298, 0.3996563, 0.6666667, 1, 0, 1,
-0.7333242, -0.9672875, -1.800578, 0.6627451, 1, 0, 1,
-0.7290319, -0.1445273, -4.049363, 0.654902, 1, 0, 1,
-0.7287304, -0.6942504, -1.513807, 0.6509804, 1, 0, 1,
-0.7238563, 0.4500774, -2.545366, 0.6431373, 1, 0, 1,
-0.7238328, 0.7020025, -1.558591, 0.6392157, 1, 0, 1,
-0.7191427, 0.3763424, -0.09022121, 0.6313726, 1, 0, 1,
-0.7025169, -0.5251408, -0.2002358, 0.627451, 1, 0, 1,
-0.6994944, 0.3284411, -1.995689, 0.6196079, 1, 0, 1,
-0.6940475, 0.31627, -0.9314106, 0.6156863, 1, 0, 1,
-0.6901653, 0.5044327, -1.876555, 0.6078432, 1, 0, 1,
-0.6883146, -0.5100797, -2.944881, 0.6039216, 1, 0, 1,
-0.6878374, -0.8436394, -2.447834, 0.5960785, 1, 0, 1,
-0.6853301, -0.4174921, -1.73545, 0.5882353, 1, 0, 1,
-0.6850407, 0.9046919, -1.289238, 0.5843138, 1, 0, 1,
-0.6832749, -1.085201, -4.222079, 0.5764706, 1, 0, 1,
-0.6831574, -1.601, -2.290418, 0.572549, 1, 0, 1,
-0.6804506, -0.09741328, -0.7794341, 0.5647059, 1, 0, 1,
-0.6795495, -0.6060988, -3.424736, 0.5607843, 1, 0, 1,
-0.6791507, -1.09286, -2.773952, 0.5529412, 1, 0, 1,
-0.6781976, -0.2956584, -1.122744, 0.5490196, 1, 0, 1,
-0.6762851, 0.3866878, -1.516468, 0.5411765, 1, 0, 1,
-0.6740685, 0.1678561, -0.9014507, 0.5372549, 1, 0, 1,
-0.6730906, 1.158044, -0.3399134, 0.5294118, 1, 0, 1,
-0.6730856, -1.227374, -2.264747, 0.5254902, 1, 0, 1,
-0.6719133, 0.01322262, -1.92553, 0.5176471, 1, 0, 1,
-0.6690499, -0.9620919, -1.681287, 0.5137255, 1, 0, 1,
-0.6646557, 0.8439064, -1.781093, 0.5058824, 1, 0, 1,
-0.6642906, 1.37389, -1.026092, 0.5019608, 1, 0, 1,
-0.6623432, 1.251935, 0.2707129, 0.4941176, 1, 0, 1,
-0.6622323, -0.1225863, -2.386887, 0.4862745, 1, 0, 1,
-0.6608201, -0.7833425, -2.42912, 0.4823529, 1, 0, 1,
-0.659417, -0.06086015, -1.580985, 0.4745098, 1, 0, 1,
-0.6565773, 0.9007578, -1.82131, 0.4705882, 1, 0, 1,
-0.6557272, 1.444428, -0.8556094, 0.4627451, 1, 0, 1,
-0.6446053, -1.140327, -2.909607, 0.4588235, 1, 0, 1,
-0.6440731, 0.06009891, -2.081673, 0.4509804, 1, 0, 1,
-0.6392176, 0.3485884, -2.004468, 0.4470588, 1, 0, 1,
-0.6329304, 0.4172668, -1.979116, 0.4392157, 1, 0, 1,
-0.6327357, 0.3789848, -1.384168, 0.4352941, 1, 0, 1,
-0.6288398, -0.01048249, -0.8446942, 0.427451, 1, 0, 1,
-0.6234495, -1.654472, -1.663191, 0.4235294, 1, 0, 1,
-0.6181151, 0.5086747, -1.860231, 0.4156863, 1, 0, 1,
-0.6038575, 0.535708, -2.622875, 0.4117647, 1, 0, 1,
-0.6011276, 0.3993723, -1.173261, 0.4039216, 1, 0, 1,
-0.6004105, -0.1629798, 0.007185991, 0.3960784, 1, 0, 1,
-0.5990874, 0.6463631, -0.8870761, 0.3921569, 1, 0, 1,
-0.5969627, 0.5030155, -0.3115736, 0.3843137, 1, 0, 1,
-0.5965967, 1.502211, -1.112215, 0.3803922, 1, 0, 1,
-0.5913798, -0.8797485, -3.090053, 0.372549, 1, 0, 1,
-0.590605, 0.4284119, -3.165543, 0.3686275, 1, 0, 1,
-0.5803621, 0.9342286, -1.081547, 0.3607843, 1, 0, 1,
-0.5753362, -0.2711359, -1.763794, 0.3568628, 1, 0, 1,
-0.5707355, 0.433892, 0.8635751, 0.3490196, 1, 0, 1,
-0.5672337, -0.7560928, -2.468677, 0.345098, 1, 0, 1,
-0.5670151, 0.5824097, -0.8472365, 0.3372549, 1, 0, 1,
-0.56665, 0.8389523, 0.4859873, 0.3333333, 1, 0, 1,
-0.5663357, 0.9764928, -0.7281416, 0.3254902, 1, 0, 1,
-0.5651021, 1.881273, -0.9201515, 0.3215686, 1, 0, 1,
-0.5628576, -0.3451132, -3.122798, 0.3137255, 1, 0, 1,
-0.5547691, -1.545845, -1.773559, 0.3098039, 1, 0, 1,
-0.5523854, -0.3983255, -1.714148, 0.3019608, 1, 0, 1,
-0.5520776, -0.5474642, -0.8866777, 0.2941177, 1, 0, 1,
-0.5462798, 1.055586, 0.07286707, 0.2901961, 1, 0, 1,
-0.5431036, -0.9658792, -0.02277006, 0.282353, 1, 0, 1,
-0.542608, -0.9365122, -2.469475, 0.2784314, 1, 0, 1,
-0.5412079, -0.9414539, -1.79803, 0.2705882, 1, 0, 1,
-0.5377136, 1.320213, -1.514423, 0.2666667, 1, 0, 1,
-0.5355681, -1.605485, -2.326043, 0.2588235, 1, 0, 1,
-0.5297108, -0.3244555, -5.073731, 0.254902, 1, 0, 1,
-0.5265309, -0.631307, -0.425856, 0.2470588, 1, 0, 1,
-0.5261663, 0.9774582, -1.545477, 0.2431373, 1, 0, 1,
-0.5261103, -2.025518, -2.550679, 0.2352941, 1, 0, 1,
-0.5206434, -2.654639, -2.644176, 0.2313726, 1, 0, 1,
-0.5173385, 1.439886, 0.1249703, 0.2235294, 1, 0, 1,
-0.5033517, -0.5291962, -3.04943, 0.2196078, 1, 0, 1,
-0.5010793, -0.1969102, -3.660828, 0.2117647, 1, 0, 1,
-0.4991697, 0.5691074, 0.3547728, 0.2078431, 1, 0, 1,
-0.4985172, 0.08944783, -1.893756, 0.2, 1, 0, 1,
-0.4980649, -0.7609274, -2.299291, 0.1921569, 1, 0, 1,
-0.494752, -0.05777269, -2.11217, 0.1882353, 1, 0, 1,
-0.4943647, 0.5805225, 0.6410379, 0.1803922, 1, 0, 1,
-0.4919716, 0.9920117, 0.1945523, 0.1764706, 1, 0, 1,
-0.483346, 0.05757352, -2.1399, 0.1686275, 1, 0, 1,
-0.4726519, -0.3195252, -0.3180688, 0.1647059, 1, 0, 1,
-0.4715052, 1.069979, 0.4699943, 0.1568628, 1, 0, 1,
-0.4663555, 1.032755, -2.771685, 0.1529412, 1, 0, 1,
-0.4644676, 0.2320057, -1.805279, 0.145098, 1, 0, 1,
-0.4552636, -0.1942958, -2.039713, 0.1411765, 1, 0, 1,
-0.4480881, 0.2308804, -0.4434596, 0.1333333, 1, 0, 1,
-0.4456842, -0.4123306, -3.261032, 0.1294118, 1, 0, 1,
-0.4449417, -1.098926, -2.673727, 0.1215686, 1, 0, 1,
-0.4438643, 0.6074355, 0.1436169, 0.1176471, 1, 0, 1,
-0.4432608, -0.02768327, -1.781173, 0.1098039, 1, 0, 1,
-0.4300081, -1.736045, -1.904485, 0.1058824, 1, 0, 1,
-0.4281256, 0.6563132, -1.131718, 0.09803922, 1, 0, 1,
-0.4280964, -0.4305395, -1.038303, 0.09019608, 1, 0, 1,
-0.4277003, 0.06934417, -2.885898, 0.08627451, 1, 0, 1,
-0.4273665, -0.2193924, -3.206285, 0.07843138, 1, 0, 1,
-0.4253091, -1.541432, -2.364619, 0.07450981, 1, 0, 1,
-0.4245358, -1.599782, -1.784634, 0.06666667, 1, 0, 1,
-0.4244657, -0.2720509, -3.092595, 0.0627451, 1, 0, 1,
-0.4235751, 1.553086, 0.6170632, 0.05490196, 1, 0, 1,
-0.4201823, 0.6290812, -1.727298, 0.05098039, 1, 0, 1,
-0.4166053, -0.01850236, -3.499954, 0.04313726, 1, 0, 1,
-0.4157643, 0.02737427, -0.1599417, 0.03921569, 1, 0, 1,
-0.4139777, 0.9931688, -0.6618264, 0.03137255, 1, 0, 1,
-0.398066, 0.8409657, -1.035072, 0.02745098, 1, 0, 1,
-0.3978593, 1.24001, -1.570246, 0.01960784, 1, 0, 1,
-0.3977713, -0.5364586, -2.397139, 0.01568628, 1, 0, 1,
-0.3964834, -0.527004, -2.73877, 0.007843138, 1, 0, 1,
-0.3955408, -1.400462, -3.277701, 0.003921569, 1, 0, 1,
-0.3936505, 1.906878, 0.3588157, 0, 1, 0.003921569, 1,
-0.3914844, -0.4972377, -2.319622, 0, 1, 0.01176471, 1,
-0.3854221, -2.284556, -3.954498, 0, 1, 0.01568628, 1,
-0.384104, -0.9480652, -3.303419, 0, 1, 0.02352941, 1,
-0.3828275, 1.06382, -0.594817, 0, 1, 0.02745098, 1,
-0.3810482, -1.351518, -1.881403, 0, 1, 0.03529412, 1,
-0.3785357, -1.317298, -3.273949, 0, 1, 0.03921569, 1,
-0.3782086, 1.145223, -0.5211537, 0, 1, 0.04705882, 1,
-0.3771829, 0.5275807, -0.3116516, 0, 1, 0.05098039, 1,
-0.3762413, -0.9405773, -3.783456, 0, 1, 0.05882353, 1,
-0.3733324, 0.4327876, -1.098, 0, 1, 0.0627451, 1,
-0.3668954, -2.029239, -4.109906, 0, 1, 0.07058824, 1,
-0.3648398, 0.494579, 0.2698373, 0, 1, 0.07450981, 1,
-0.3642816, 2.64263, -1.385073, 0, 1, 0.08235294, 1,
-0.3632151, -0.066767, -2.330199, 0, 1, 0.08627451, 1,
-0.3600396, -0.2539098, -2.209034, 0, 1, 0.09411765, 1,
-0.3579734, 1.173818, 0.1536113, 0, 1, 0.1019608, 1,
-0.3472025, 0.2914807, 0.4833238, 0, 1, 0.1058824, 1,
-0.3434846, 0.4231379, -1.176385, 0, 1, 0.1137255, 1,
-0.3408111, 0.9070052, -0.05051816, 0, 1, 0.1176471, 1,
-0.3384726, 0.9776658, -0.8629906, 0, 1, 0.1254902, 1,
-0.3379446, -1.259135, -4.637828, 0, 1, 0.1294118, 1,
-0.3332332, 3.023284, -1.227093, 0, 1, 0.1372549, 1,
-0.3282543, -0.1184087, -1.120211, 0, 1, 0.1411765, 1,
-0.3275164, 0.5380777, 0.8697739, 0, 1, 0.1490196, 1,
-0.3220925, 0.5367804, -0.7357189, 0, 1, 0.1529412, 1,
-0.3188189, -0.626691, -1.830978, 0, 1, 0.1607843, 1,
-0.3144913, -0.4997647, -2.994713, 0, 1, 0.1647059, 1,
-0.3140963, -0.4107074, -1.295388, 0, 1, 0.172549, 1,
-0.3101433, -0.8416786, -2.745719, 0, 1, 0.1764706, 1,
-0.3088824, 0.193894, -1.377248, 0, 1, 0.1843137, 1,
-0.3056575, 0.6832294, 0.9500079, 0, 1, 0.1882353, 1,
-0.3048534, 0.4842, -0.8751169, 0, 1, 0.1960784, 1,
-0.3029231, 2.145363, -0.529753, 0, 1, 0.2039216, 1,
-0.3001849, -0.4788636, -2.423274, 0, 1, 0.2078431, 1,
-0.2894386, -1.482602, -2.177982, 0, 1, 0.2156863, 1,
-0.2884372, 2.991663, -1.159359, 0, 1, 0.2196078, 1,
-0.2867141, -0.8040606, -3.666704, 0, 1, 0.227451, 1,
-0.2815209, -0.357905, -3.139196, 0, 1, 0.2313726, 1,
-0.2758085, -0.6215163, -2.928653, 0, 1, 0.2392157, 1,
-0.275073, -1.096739, -3.86951, 0, 1, 0.2431373, 1,
-0.2736011, 1.116052, -0.4647751, 0, 1, 0.2509804, 1,
-0.273044, 1.6071, -1.715992, 0, 1, 0.254902, 1,
-0.265055, -0.7158473, -3.182663, 0, 1, 0.2627451, 1,
-0.253842, 0.04181163, -0.7426364, 0, 1, 0.2666667, 1,
-0.2456322, 2.672097, -0.5604724, 0, 1, 0.2745098, 1,
-0.2454649, 0.4972983, 0.280445, 0, 1, 0.2784314, 1,
-0.2394689, -0.218104, -3.446039, 0, 1, 0.2862745, 1,
-0.237728, -1.094937, -1.82927, 0, 1, 0.2901961, 1,
-0.2376467, -1.310974, -1.820009, 0, 1, 0.2980392, 1,
-0.2348632, 1.025804, 0.2754556, 0, 1, 0.3058824, 1,
-0.2295747, -0.09953763, -1.846069, 0, 1, 0.3098039, 1,
-0.2291664, -0.1086893, -4.132947, 0, 1, 0.3176471, 1,
-0.2243799, 0.6791625, -0.8158574, 0, 1, 0.3215686, 1,
-0.2210682, -0.1132617, -2.45008, 0, 1, 0.3294118, 1,
-0.2187623, -0.4542996, -2.003755, 0, 1, 0.3333333, 1,
-0.2185622, 0.3681769, -0.2563369, 0, 1, 0.3411765, 1,
-0.2172374, 0.7303967, -0.02463438, 0, 1, 0.345098, 1,
-0.2145026, -0.2687578, -2.859765, 0, 1, 0.3529412, 1,
-0.2131336, -1.089088, -2.425962, 0, 1, 0.3568628, 1,
-0.2115742, -0.2107791, -1.809885, 0, 1, 0.3647059, 1,
-0.2105995, -0.2873788, -1.863118, 0, 1, 0.3686275, 1,
-0.203678, 0.3275743, 1.23375, 0, 1, 0.3764706, 1,
-0.2035379, -0.8094074, -3.356025, 0, 1, 0.3803922, 1,
-0.2033005, -1.429384, -3.270467, 0, 1, 0.3882353, 1,
-0.1961388, 0.2121754, -0.7993153, 0, 1, 0.3921569, 1,
-0.1953781, 0.7178286, 0.6546764, 0, 1, 0.4, 1,
-0.1944743, -0.06553581, -2.428572, 0, 1, 0.4078431, 1,
-0.1931629, 0.1004737, -0.03553374, 0, 1, 0.4117647, 1,
-0.1929245, -0.9584281, -1.933916, 0, 1, 0.4196078, 1,
-0.1805478, -1.740245, -2.628658, 0, 1, 0.4235294, 1,
-0.1772326, 1.053158, 1.388579, 0, 1, 0.4313726, 1,
-0.1692905, 0.3750553, 0.08534864, 0, 1, 0.4352941, 1,
-0.166731, -0.5123063, -1.29466, 0, 1, 0.4431373, 1,
-0.1661794, 0.8376827, -0.8783068, 0, 1, 0.4470588, 1,
-0.1652515, -0.4821077, -1.696955, 0, 1, 0.454902, 1,
-0.1607765, 0.7365087, -1.923198, 0, 1, 0.4588235, 1,
-0.160017, 0.8517729, -1.109386, 0, 1, 0.4666667, 1,
-0.1600113, -0.1252444, -3.489927, 0, 1, 0.4705882, 1,
-0.1598047, 1.066088, -0.2264073, 0, 1, 0.4784314, 1,
-0.1596359, 0.8842581, -0.1677075, 0, 1, 0.4823529, 1,
-0.1567616, 0.2667864, 0.9516447, 0, 1, 0.4901961, 1,
-0.1519952, 1.686588, 0.1446068, 0, 1, 0.4941176, 1,
-0.1499824, -0.8621458, -2.328549, 0, 1, 0.5019608, 1,
-0.1487914, -0.02492055, -2.114175, 0, 1, 0.509804, 1,
-0.1465835, 1.676769, -1.238484, 0, 1, 0.5137255, 1,
-0.144606, -0.4268923, -2.037596, 0, 1, 0.5215687, 1,
-0.1429014, -0.5354631, -2.707481, 0, 1, 0.5254902, 1,
-0.1403769, 1.0524, 1.337847, 0, 1, 0.5333334, 1,
-0.1394797, 0.8200759, 0.7439383, 0, 1, 0.5372549, 1,
-0.1380727, 0.03634727, 0.7672927, 0, 1, 0.5450981, 1,
-0.1371632, 0.2234, -2.532466, 0, 1, 0.5490196, 1,
-0.1369567, 0.4340627, 0.9593445, 0, 1, 0.5568628, 1,
-0.1319216, 0.9120911, -0.6384213, 0, 1, 0.5607843, 1,
-0.1282358, 0.4789221, 0.1210807, 0, 1, 0.5686275, 1,
-0.1207319, 1.233559, -1.058536, 0, 1, 0.572549, 1,
-0.1195391, -0.2709068, -2.713737, 0, 1, 0.5803922, 1,
-0.1181318, 1.19622, -0.5528775, 0, 1, 0.5843138, 1,
-0.1153623, -0.1112527, -1.235191, 0, 1, 0.5921569, 1,
-0.1153243, 1.810323, -1.26549, 0, 1, 0.5960785, 1,
-0.1133628, 1.310101, 1.227748, 0, 1, 0.6039216, 1,
-0.1123357, -0.4503952, -3.655187, 0, 1, 0.6117647, 1,
-0.1119511, 2.434479, -1.085865, 0, 1, 0.6156863, 1,
-0.1084898, 1.662019, 0.5725899, 0, 1, 0.6235294, 1,
-0.1078471, 1.348682, -2.031887, 0, 1, 0.627451, 1,
-0.1048194, -0.4088582, -1.238452, 0, 1, 0.6352941, 1,
-0.09365806, 0.1641193, -0.991345, 0, 1, 0.6392157, 1,
-0.09271079, 0.6985129, 0.7302395, 0, 1, 0.6470588, 1,
-0.09058275, 0.3615261, -0.1130297, 0, 1, 0.6509804, 1,
-0.08366685, 0.2931408, -0.5364257, 0, 1, 0.6588235, 1,
-0.08089033, 0.3952647, 0.579259, 0, 1, 0.6627451, 1,
-0.07765082, -0.2464089, -3.803949, 0, 1, 0.6705883, 1,
-0.07705817, -0.7145597, -2.477925, 0, 1, 0.6745098, 1,
-0.07678848, 0.02456078, -2.352744, 0, 1, 0.682353, 1,
-0.07297443, -0.769196, -4.477745, 0, 1, 0.6862745, 1,
-0.06955123, -1.396728, -2.729973, 0, 1, 0.6941177, 1,
-0.06867289, 0.08811624, -0.53092, 0, 1, 0.7019608, 1,
-0.06854127, 0.2184245, -0.7062253, 0, 1, 0.7058824, 1,
-0.06796831, -0.4373318, -4.290541, 0, 1, 0.7137255, 1,
-0.06439469, 2.158508, 0.7649427, 0, 1, 0.7176471, 1,
-0.06435852, -0.1725092, -2.962089, 0, 1, 0.7254902, 1,
-0.06425601, 0.07727439, -0.5102027, 0, 1, 0.7294118, 1,
-0.06357756, 0.4377704, 0.4545057, 0, 1, 0.7372549, 1,
-0.062576, 0.08116255, -0.8527124, 0, 1, 0.7411765, 1,
-0.05593213, 0.1713865, 2.047759, 0, 1, 0.7490196, 1,
-0.0547561, 0.4668641, -0.406665, 0, 1, 0.7529412, 1,
-0.05186329, -0.1622976, -2.522387, 0, 1, 0.7607843, 1,
-0.05118215, -0.3161193, -0.6283201, 0, 1, 0.7647059, 1,
-0.04470902, 0.9163545, -1.835954, 0, 1, 0.772549, 1,
-0.04248602, 0.5774955, -1.615109, 0, 1, 0.7764706, 1,
-0.03774111, 1.694682, -0.6275407, 0, 1, 0.7843137, 1,
-0.03506587, -0.9589379, -1.549219, 0, 1, 0.7882353, 1,
-0.03485676, -0.9425589, -4.980248, 0, 1, 0.7960784, 1,
-0.03297773, -0.4776375, -2.336304, 0, 1, 0.8039216, 1,
-0.03219474, 0.9084342, 0.02532022, 0, 1, 0.8078431, 1,
-0.03157471, 0.9514738, 0.8001386, 0, 1, 0.8156863, 1,
-0.03040093, -1.319752, -2.961748, 0, 1, 0.8196079, 1,
-0.02665595, 1.56406, 0.120217, 0, 1, 0.827451, 1,
-0.02283593, -1.322294, -2.371829, 0, 1, 0.8313726, 1,
-0.02004728, 1.019909, 1.679323, 0, 1, 0.8392157, 1,
-0.01372949, -1.963115, -2.084455, 0, 1, 0.8431373, 1,
-0.01156245, -0.4842005, -4.89044, 0, 1, 0.8509804, 1,
-0.01072756, 0.3758843, 0.9353846, 0, 1, 0.854902, 1,
-0.008936062, 1.314918, -0.09160797, 0, 1, 0.8627451, 1,
-0.004088773, -1.528073, -3.106181, 0, 1, 0.8666667, 1,
-0.003949408, -1.234759, -4.498133, 0, 1, 0.8745098, 1,
-0.003909437, -0.5374691, -2.643064, 0, 1, 0.8784314, 1,
-0.002031317, -1.478506, -3.999138, 0, 1, 0.8862745, 1,
-0.0002289833, 1.464926, -0.6431707, 0, 1, 0.8901961, 1,
0.0005241116, 0.5132713, 0.9548382, 0, 1, 0.8980392, 1,
0.005356359, 0.2516337, -0.8365256, 0, 1, 0.9058824, 1,
0.009208034, 0.4884023, -0.5905342, 0, 1, 0.9098039, 1,
0.009932483, -1.929758, 4.727462, 0, 1, 0.9176471, 1,
0.01002015, 0.03365324, 1.406755, 0, 1, 0.9215686, 1,
0.01240458, -1.758108, 1.366334, 0, 1, 0.9294118, 1,
0.01285416, 1.012954, 0.002794902, 0, 1, 0.9333333, 1,
0.01400201, -0.2681721, 4.493005, 0, 1, 0.9411765, 1,
0.01518769, 0.04520705, 1.020702, 0, 1, 0.945098, 1,
0.0202927, -0.546676, 2.94364, 0, 1, 0.9529412, 1,
0.02218155, -0.3741216, 3.750101, 0, 1, 0.9568627, 1,
0.02368552, -0.3584145, 2.560196, 0, 1, 0.9647059, 1,
0.02414167, -1.071931, 2.907726, 0, 1, 0.9686275, 1,
0.02631138, -2.045058, 1.871408, 0, 1, 0.9764706, 1,
0.02720478, 1.007039, 0.3608891, 0, 1, 0.9803922, 1,
0.02829018, 0.3553009, -0.3733507, 0, 1, 0.9882353, 1,
0.0302718, -0.05360032, 3.976794, 0, 1, 0.9921569, 1,
0.03206882, 1.85498, 0.354219, 0, 1, 1, 1,
0.03246225, 0.5343387, 0.4867764, 0, 0.9921569, 1, 1,
0.03251768, -0.05141528, 3.360727, 0, 0.9882353, 1, 1,
0.03439461, -0.366533, 4.038283, 0, 0.9803922, 1, 1,
0.03791922, 0.6946484, 0.9432941, 0, 0.9764706, 1, 1,
0.04287475, -1.61607, 4.20417, 0, 0.9686275, 1, 1,
0.04848182, 0.5680233, -0.603657, 0, 0.9647059, 1, 1,
0.04857578, -0.7264832, 2.5501, 0, 0.9568627, 1, 1,
0.04966794, 0.1123297, -1.451397, 0, 0.9529412, 1, 1,
0.05387549, 0.02728086, 0.7365538, 0, 0.945098, 1, 1,
0.06020774, -0.209715, 2.509322, 0, 0.9411765, 1, 1,
0.06192861, -0.2461148, 3.000918, 0, 0.9333333, 1, 1,
0.06337774, -0.8667766, 2.879632, 0, 0.9294118, 1, 1,
0.06485363, -0.2646984, 2.957285, 0, 0.9215686, 1, 1,
0.06620345, -1.594385, 2.335983, 0, 0.9176471, 1, 1,
0.07297663, -1.828511, 4.231905, 0, 0.9098039, 1, 1,
0.07494953, -0.8852437, 2.04224, 0, 0.9058824, 1, 1,
0.07496746, -0.1952614, 2.617655, 0, 0.8980392, 1, 1,
0.07864831, -0.4473557, 1.875728, 0, 0.8901961, 1, 1,
0.07969216, -0.778104, 3.589865, 0, 0.8862745, 1, 1,
0.08323085, 0.9963731, -0.6494603, 0, 0.8784314, 1, 1,
0.08739159, -0.5493915, 3.681462, 0, 0.8745098, 1, 1,
0.09198876, -0.1763832, 2.990519, 0, 0.8666667, 1, 1,
0.09297139, -1.393517, 2.405725, 0, 0.8627451, 1, 1,
0.09325554, -0.1389476, 1.821769, 0, 0.854902, 1, 1,
0.09509117, 0.3891065, 0.7826242, 0, 0.8509804, 1, 1,
0.1076629, 0.9310651, -0.04757142, 0, 0.8431373, 1, 1,
0.1077524, 2.054374, 0.09339435, 0, 0.8392157, 1, 1,
0.1090258, 0.8760316, 1.621606, 0, 0.8313726, 1, 1,
0.1140435, 0.8839837, -0.5661414, 0, 0.827451, 1, 1,
0.1141341, 0.2992989, -0.5634376, 0, 0.8196079, 1, 1,
0.117645, 1.569796, 0.6733232, 0, 0.8156863, 1, 1,
0.1191502, -1.04139, 1.910739, 0, 0.8078431, 1, 1,
0.1194911, -0.3756597, 2.122845, 0, 0.8039216, 1, 1,
0.1203037, -1.676643, 3.179855, 0, 0.7960784, 1, 1,
0.1244179, 1.646985, 1.891629, 0, 0.7882353, 1, 1,
0.1249657, 0.8147709, -0.5919065, 0, 0.7843137, 1, 1,
0.1310036, 0.1410833, 0.06389982, 0, 0.7764706, 1, 1,
0.1325296, -0.3150481, 0.9844518, 0, 0.772549, 1, 1,
0.1327936, 0.5875654, 1.400905, 0, 0.7647059, 1, 1,
0.1332373, 1.301217, -0.1555827, 0, 0.7607843, 1, 1,
0.1347494, -0.7407442, 2.381759, 0, 0.7529412, 1, 1,
0.1347759, -2.849197, 4.995586, 0, 0.7490196, 1, 1,
0.1380248, 0.7780929, 2.3899, 0, 0.7411765, 1, 1,
0.1382014, -1.27127, 2.584015, 0, 0.7372549, 1, 1,
0.1388334, 0.9501669, 0.01898296, 0, 0.7294118, 1, 1,
0.1409495, -0.02128586, 1.894841, 0, 0.7254902, 1, 1,
0.1442036, 1.039885, 2.153752, 0, 0.7176471, 1, 1,
0.1477432, 0.5060726, -0.9949723, 0, 0.7137255, 1, 1,
0.1554821, -0.3223752, 3.62362, 0, 0.7058824, 1, 1,
0.1566156, -0.765203, 5.527275, 0, 0.6980392, 1, 1,
0.1653621, -2.145561, 1.987498, 0, 0.6941177, 1, 1,
0.1709139, 1.042671, -0.4111084, 0, 0.6862745, 1, 1,
0.1719652, 0.5919029, 0.6822845, 0, 0.682353, 1, 1,
0.174346, -1.220446, 4.125124, 0, 0.6745098, 1, 1,
0.1746802, 0.9633749, 1.940883, 0, 0.6705883, 1, 1,
0.174809, -1.086859, 2.366364, 0, 0.6627451, 1, 1,
0.1777116, 0.002765829, 0.7916412, 0, 0.6588235, 1, 1,
0.1876635, 0.9631534, -0.1121408, 0, 0.6509804, 1, 1,
0.1944305, 0.4182324, -1.157017, 0, 0.6470588, 1, 1,
0.1972455, -1.273027, 3.057076, 0, 0.6392157, 1, 1,
0.201765, -0.7817144, 3.381491, 0, 0.6352941, 1, 1,
0.2034105, 0.2498009, 0.8509867, 0, 0.627451, 1, 1,
0.2102249, -2.02201, 2.607413, 0, 0.6235294, 1, 1,
0.2123419, 0.1175695, -0.7484093, 0, 0.6156863, 1, 1,
0.2173214, 1.023814, 0.1954549, 0, 0.6117647, 1, 1,
0.2205107, 0.3135935, 0.564165, 0, 0.6039216, 1, 1,
0.2236191, 1.200973, 0.08639362, 0, 0.5960785, 1, 1,
0.2236989, -0.1008783, 2.04297, 0, 0.5921569, 1, 1,
0.23204, 0.2772226, 1.241227, 0, 0.5843138, 1, 1,
0.233589, 1.009957, 0.2258682, 0, 0.5803922, 1, 1,
0.2339557, 0.6665248, 0.2973323, 0, 0.572549, 1, 1,
0.235948, -2.232552, 3.557904, 0, 0.5686275, 1, 1,
0.2362034, 0.6102669, -0.9573354, 0, 0.5607843, 1, 1,
0.2372202, 0.8123943, -0.06814981, 0, 0.5568628, 1, 1,
0.2383466, 1.005339, 1.874857, 0, 0.5490196, 1, 1,
0.2385446, -1.627456, 3.84091, 0, 0.5450981, 1, 1,
0.2405045, -0.1812397, 2.612634, 0, 0.5372549, 1, 1,
0.2426467, 1.035894, 0.401591, 0, 0.5333334, 1, 1,
0.2434949, -0.3722979, 2.072704, 0, 0.5254902, 1, 1,
0.2446101, 0.3915644, 1.460388, 0, 0.5215687, 1, 1,
0.2451617, -0.03790117, 2.076562, 0, 0.5137255, 1, 1,
0.2459916, -0.5340555, 2.48261, 0, 0.509804, 1, 1,
0.2501386, -0.1376845, 4.151002, 0, 0.5019608, 1, 1,
0.2506065, -0.5183365, 3.034961, 0, 0.4941176, 1, 1,
0.251938, -1.030564, 3.664088, 0, 0.4901961, 1, 1,
0.2531385, -1.442009, 3.562877, 0, 0.4823529, 1, 1,
0.2559353, 0.0299073, 2.103994, 0, 0.4784314, 1, 1,
0.2576163, 0.1937936, 0.1258038, 0, 0.4705882, 1, 1,
0.2663765, -0.80208, 3.120267, 0, 0.4666667, 1, 1,
0.2669404, -0.7291853, 3.695867, 0, 0.4588235, 1, 1,
0.2684772, -0.3711812, 3.573323, 0, 0.454902, 1, 1,
0.27142, 0.7608455, 0.9937145, 0, 0.4470588, 1, 1,
0.273652, -0.8080106, 4.044682, 0, 0.4431373, 1, 1,
0.273801, 1.324286, 1.414111, 0, 0.4352941, 1, 1,
0.2759208, -0.600764, 2.480482, 0, 0.4313726, 1, 1,
0.2788149, -0.7270476, 2.679853, 0, 0.4235294, 1, 1,
0.2793415, -0.6835615, 1.265455, 0, 0.4196078, 1, 1,
0.2806248, 1.861454, -0.8266546, 0, 0.4117647, 1, 1,
0.281698, 1.072977, 0.8515337, 0, 0.4078431, 1, 1,
0.2829725, 1.301316, 2.290031, 0, 0.4, 1, 1,
0.28901, 0.6307766, 2.373811, 0, 0.3921569, 1, 1,
0.2980932, -1.262532, 5.567759, 0, 0.3882353, 1, 1,
0.2982815, -0.8137951, 3.331319, 0, 0.3803922, 1, 1,
0.3021364, -1.445232, 3.05442, 0, 0.3764706, 1, 1,
0.3052388, 0.9223348, 1.439654, 0, 0.3686275, 1, 1,
0.3060912, -0.728573, 4.014515, 0, 0.3647059, 1, 1,
0.3074649, -1.13628, 4.547102, 0, 0.3568628, 1, 1,
0.3076879, 1.283766, -1.330274, 0, 0.3529412, 1, 1,
0.3115128, 1.058077, 0.08823692, 0, 0.345098, 1, 1,
0.3150456, 1.018197, -0.7115057, 0, 0.3411765, 1, 1,
0.3182966, -1.165476, 2.612594, 0, 0.3333333, 1, 1,
0.318676, 0.3995444, -1.289281, 0, 0.3294118, 1, 1,
0.3202651, 0.682101, 0.8430164, 0, 0.3215686, 1, 1,
0.3219919, -0.6746169, 3.257001, 0, 0.3176471, 1, 1,
0.323797, 0.2365701, 1.931092, 0, 0.3098039, 1, 1,
0.326381, -1.164139, 0.7251818, 0, 0.3058824, 1, 1,
0.3286943, -0.5886188, 4.063836, 0, 0.2980392, 1, 1,
0.3290424, -1.143777, 3.566423, 0, 0.2901961, 1, 1,
0.3302574, 0.9140782, -0.3025596, 0, 0.2862745, 1, 1,
0.3310912, -0.4529411, 4.942255, 0, 0.2784314, 1, 1,
0.3321951, -0.3898009, 2.835565, 0, 0.2745098, 1, 1,
0.3330476, 0.2040149, -0.08702805, 0, 0.2666667, 1, 1,
0.3341546, 0.3158915, 1.287342, 0, 0.2627451, 1, 1,
0.3513264, -1.618975, 3.153401, 0, 0.254902, 1, 1,
0.3522035, -0.01309642, 2.234975, 0, 0.2509804, 1, 1,
0.3558121, -1.576887, 3.15095, 0, 0.2431373, 1, 1,
0.3558678, -0.1911348, 0.641324, 0, 0.2392157, 1, 1,
0.3572307, -0.3469961, 0.2902895, 0, 0.2313726, 1, 1,
0.3583176, 0.7549647, 2.380022, 0, 0.227451, 1, 1,
0.3652597, -0.08864099, 1.18532, 0, 0.2196078, 1, 1,
0.3679434, -1.247302, 1.578616, 0, 0.2156863, 1, 1,
0.3698296, 2.406862, -0.5145782, 0, 0.2078431, 1, 1,
0.3743894, 1.231249, -0.5737004, 0, 0.2039216, 1, 1,
0.3790157, 0.01161519, 1.726372, 0, 0.1960784, 1, 1,
0.3866044, -0.4329363, 1.740374, 0, 0.1882353, 1, 1,
0.3871855, 0.6845819, -0.2610589, 0, 0.1843137, 1, 1,
0.3964871, -0.7689407, 1.869822, 0, 0.1764706, 1, 1,
0.3993865, -0.7632787, 3.536045, 0, 0.172549, 1, 1,
0.4007669, -2.043681, 2.984875, 0, 0.1647059, 1, 1,
0.4071827, -1.959309, 2.360992, 0, 0.1607843, 1, 1,
0.4094692, -1.168871, 2.553237, 0, 0.1529412, 1, 1,
0.4130516, 0.9262272, -0.4471287, 0, 0.1490196, 1, 1,
0.4147376, -0.7198842, 2.028451, 0, 0.1411765, 1, 1,
0.4149956, -0.6329688, 2.822959, 0, 0.1372549, 1, 1,
0.4154219, -0.5650367, 2.696476, 0, 0.1294118, 1, 1,
0.4217121, 0.8271192, 2.591693, 0, 0.1254902, 1, 1,
0.4253596, 1.428145, -0.1742377, 0, 0.1176471, 1, 1,
0.4275478, -1.599312, 4.315413, 0, 0.1137255, 1, 1,
0.4334348, 1.106801, -0.00300557, 0, 0.1058824, 1, 1,
0.4408273, -0.6715506, 1.89, 0, 0.09803922, 1, 1,
0.4410213, -0.4381123, 3.306885, 0, 0.09411765, 1, 1,
0.442932, 0.5972353, -1.097059, 0, 0.08627451, 1, 1,
0.4452214, 0.08822808, 1.373015, 0, 0.08235294, 1, 1,
0.4477056, 1.291261, 1.858699, 0, 0.07450981, 1, 1,
0.4478898, -0.5744159, 2.302554, 0, 0.07058824, 1, 1,
0.4525328, 1.392854, -0.4227708, 0, 0.0627451, 1, 1,
0.4559549, -0.177886, 3.185406, 0, 0.05882353, 1, 1,
0.4590188, 0.7647585, -0.3085641, 0, 0.05098039, 1, 1,
0.4592036, -0.611453, 2.549152, 0, 0.04705882, 1, 1,
0.4617651, -0.9912691, 4.074844, 0, 0.03921569, 1, 1,
0.4650919, -0.4570861, 2.698909, 0, 0.03529412, 1, 1,
0.47053, 1.036488, 1.499808, 0, 0.02745098, 1, 1,
0.4707686, 1.522034, 0.3645792, 0, 0.02352941, 1, 1,
0.4749523, -1.321029, 2.015965, 0, 0.01568628, 1, 1,
0.4758262, 0.1805383, 0.5574023, 0, 0.01176471, 1, 1,
0.4786854, 1.120436, -0.5705369, 0, 0.003921569, 1, 1,
0.4809514, 0.4039007, 0.7893529, 0.003921569, 0, 1, 1,
0.4821926, 2.399157, 0.9757121, 0.007843138, 0, 1, 1,
0.4843596, 0.9473298, -0.502033, 0.01568628, 0, 1, 1,
0.4862688, -0.2105563, 1.585643, 0.01960784, 0, 1, 1,
0.4877489, 0.3522395, 0.6522031, 0.02745098, 0, 1, 1,
0.4975035, -1.053605, 2.955489, 0.03137255, 0, 1, 1,
0.498563, -0.2183346, 0.9494876, 0.03921569, 0, 1, 1,
0.499474, 1.782321, -0.6735588, 0.04313726, 0, 1, 1,
0.5041544, 0.9725177, 0.4199971, 0.05098039, 0, 1, 1,
0.5048441, 0.2306067, 2.45535, 0.05490196, 0, 1, 1,
0.5098099, -1.527062, 2.11981, 0.0627451, 0, 1, 1,
0.5111663, 0.7417052, 1.683315, 0.06666667, 0, 1, 1,
0.5135531, 2.07376, -0.7326888, 0.07450981, 0, 1, 1,
0.5183884, -0.0734625, 0.7816925, 0.07843138, 0, 1, 1,
0.5184742, -0.6081573, 2.057806, 0.08627451, 0, 1, 1,
0.5216766, -1.831136, 3.623858, 0.09019608, 0, 1, 1,
0.5224681, -1.143149, 4.223862, 0.09803922, 0, 1, 1,
0.5311437, 1.8578, 1.932447, 0.1058824, 0, 1, 1,
0.5364823, -2.063505, 1.709019, 0.1098039, 0, 1, 1,
0.5391807, -0.03455305, 1.326705, 0.1176471, 0, 1, 1,
0.5405535, -0.9661302, 3.517781, 0.1215686, 0, 1, 1,
0.5512571, -0.8838511, 1.728077, 0.1294118, 0, 1, 1,
0.5560965, -0.1409424, 0.9560077, 0.1333333, 0, 1, 1,
0.5572148, -0.9873973, 1.033041, 0.1411765, 0, 1, 1,
0.5625542, 0.221021, 1.730322, 0.145098, 0, 1, 1,
0.5639243, -2.662574, 3.949621, 0.1529412, 0, 1, 1,
0.5650871, -0.3646566, 1.221634, 0.1568628, 0, 1, 1,
0.5659043, 0.5585235, 1.11672, 0.1647059, 0, 1, 1,
0.5725427, 1.480574, -0.02440133, 0.1686275, 0, 1, 1,
0.5730437, -0.02728183, 1.396972, 0.1764706, 0, 1, 1,
0.5767136, -0.2926503, 2.763956, 0.1803922, 0, 1, 1,
0.5768581, -1.731524, 2.5958, 0.1882353, 0, 1, 1,
0.5772985, 0.456463, 0.6378584, 0.1921569, 0, 1, 1,
0.5804525, 1.245373, 0.839731, 0.2, 0, 1, 1,
0.584051, 0.1570462, 2.92306, 0.2078431, 0, 1, 1,
0.5844927, -0.7500856, 1.527954, 0.2117647, 0, 1, 1,
0.5955172, 0.7365158, -0.2567373, 0.2196078, 0, 1, 1,
0.5969455, -1.161238, 4.280207, 0.2235294, 0, 1, 1,
0.5986534, 0.2168047, 1.361764, 0.2313726, 0, 1, 1,
0.6026093, 0.1767464, 0.9058109, 0.2352941, 0, 1, 1,
0.6053624, -1.498507, 4.506279, 0.2431373, 0, 1, 1,
0.6070977, -1.489033, 2.060114, 0.2470588, 0, 1, 1,
0.6128929, -0.6837159, 2.856491, 0.254902, 0, 1, 1,
0.615335, 1.45324, 1.26681, 0.2588235, 0, 1, 1,
0.6159905, -0.08329797, 2.359351, 0.2666667, 0, 1, 1,
0.6175246, -0.7367758, 2.096356, 0.2705882, 0, 1, 1,
0.6175266, 1.105597, 0.1542775, 0.2784314, 0, 1, 1,
0.6217023, 0.6797113, 1.381135, 0.282353, 0, 1, 1,
0.6226906, 0.2025997, 1.039719, 0.2901961, 0, 1, 1,
0.6248314, 2.654854, 1.816535, 0.2941177, 0, 1, 1,
0.6264474, 0.564932, 2.492172, 0.3019608, 0, 1, 1,
0.6303193, 0.06283721, 0.922558, 0.3098039, 0, 1, 1,
0.6368611, 1.620185, -0.1832707, 0.3137255, 0, 1, 1,
0.6489772, -1.341697, 3.096469, 0.3215686, 0, 1, 1,
0.6514294, 0.8966016, 1.859353, 0.3254902, 0, 1, 1,
0.6533756, 0.4634109, 1.578857, 0.3333333, 0, 1, 1,
0.654027, -0.2639814, 2.353776, 0.3372549, 0, 1, 1,
0.6558753, -0.7542829, 1.230423, 0.345098, 0, 1, 1,
0.6559697, 0.8119307, -0.1047855, 0.3490196, 0, 1, 1,
0.6580873, 0.6920982, 1.34859, 0.3568628, 0, 1, 1,
0.6629487, 0.9684904, 0.2148743, 0.3607843, 0, 1, 1,
0.6640855, -0.05626684, 2.799263, 0.3686275, 0, 1, 1,
0.6641036, -0.2573884, 1.511428, 0.372549, 0, 1, 1,
0.6681982, 0.1990181, 0.1861208, 0.3803922, 0, 1, 1,
0.6689417, 0.08911829, -1.574469, 0.3843137, 0, 1, 1,
0.6721822, -0.7894307, 3.146279, 0.3921569, 0, 1, 1,
0.6799247, -0.01152526, -0.2945999, 0.3960784, 0, 1, 1,
0.6832861, -1.461524, 4.086411, 0.4039216, 0, 1, 1,
0.6835545, 0.5138051, 1.68421, 0.4117647, 0, 1, 1,
0.683699, -1.803103, 1.960576, 0.4156863, 0, 1, 1,
0.6865019, 0.6837258, 0.8918449, 0.4235294, 0, 1, 1,
0.6869171, 3.205389, 1.081532, 0.427451, 0, 1, 1,
0.6902219, 0.07248276, 1.66297, 0.4352941, 0, 1, 1,
0.6904649, 0.561388, 0.948115, 0.4392157, 0, 1, 1,
0.6951463, -0.8961104, 1.926496, 0.4470588, 0, 1, 1,
0.6957633, 1.027952, -0.2553561, 0.4509804, 0, 1, 1,
0.6978925, -0.3394228, 1.999506, 0.4588235, 0, 1, 1,
0.698936, -0.8570868, 1.468749, 0.4627451, 0, 1, 1,
0.7030427, 0.6640077, 2.818733, 0.4705882, 0, 1, 1,
0.7082405, -0.6954109, 1.431245, 0.4745098, 0, 1, 1,
0.7091935, 1.207551, 1.371888, 0.4823529, 0, 1, 1,
0.7109306, -1.586926, 2.789844, 0.4862745, 0, 1, 1,
0.7134675, -1.609643, 2.796195, 0.4941176, 0, 1, 1,
0.7145217, -1.594694, 3.826526, 0.5019608, 0, 1, 1,
0.7159127, -0.4686281, 2.641238, 0.5058824, 0, 1, 1,
0.719079, -1.368642, 3.617617, 0.5137255, 0, 1, 1,
0.7201445, 1.283571, 0.7915877, 0.5176471, 0, 1, 1,
0.7222696, -0.9336341, 3.233025, 0.5254902, 0, 1, 1,
0.7224036, 1.233506, -3.037294, 0.5294118, 0, 1, 1,
0.7230685, 1.265323, 2.75074, 0.5372549, 0, 1, 1,
0.7238191, 0.009574216, 1.490644, 0.5411765, 0, 1, 1,
0.7243472, 0.6170154, 0.970362, 0.5490196, 0, 1, 1,
0.7263143, 1.042472, 1.676323, 0.5529412, 0, 1, 1,
0.730382, 0.524741, -1.309093, 0.5607843, 0, 1, 1,
0.7335972, 0.4779665, 1.303297, 0.5647059, 0, 1, 1,
0.74428, 0.5153469, 1.293737, 0.572549, 0, 1, 1,
0.7451177, 0.7329755, 1.047323, 0.5764706, 0, 1, 1,
0.7459893, 0.3246753, 0.9275948, 0.5843138, 0, 1, 1,
0.7492501, -0.0003977341, 1.591827, 0.5882353, 0, 1, 1,
0.7503254, 0.9331508, 0.01602309, 0.5960785, 0, 1, 1,
0.7510297, -1.758383, 4.094697, 0.6039216, 0, 1, 1,
0.7511857, -0.2237826, 1.857994, 0.6078432, 0, 1, 1,
0.7514497, -0.1455777, 1.825245, 0.6156863, 0, 1, 1,
0.7550764, -0.1319087, 2.250283, 0.6196079, 0, 1, 1,
0.7599257, 0.2722488, 2.485549, 0.627451, 0, 1, 1,
0.7628636, -0.03790422, 3.237996, 0.6313726, 0, 1, 1,
0.7628798, -1.546895, 1.995546, 0.6392157, 0, 1, 1,
0.7632096, -0.2535292, 3.941899, 0.6431373, 0, 1, 1,
0.7660443, -0.3618449, 0.3935249, 0.6509804, 0, 1, 1,
0.7666706, 0.0253531, 0.9286771, 0.654902, 0, 1, 1,
0.7678858, 0.06850744, 1.356988, 0.6627451, 0, 1, 1,
0.7782437, -0.5378959, 0.6382248, 0.6666667, 0, 1, 1,
0.7857515, 0.387998, 1.230192, 0.6745098, 0, 1, 1,
0.7861959, -0.3666447, 1.749796, 0.6784314, 0, 1, 1,
0.7862207, 0.1926146, 2.789059, 0.6862745, 0, 1, 1,
0.7891125, -0.990287, 1.249049, 0.6901961, 0, 1, 1,
0.7912814, 1.39856, 0.3725277, 0.6980392, 0, 1, 1,
0.793181, -0.2632377, 1.626448, 0.7058824, 0, 1, 1,
0.7935057, 1.02341, 1.689132, 0.7098039, 0, 1, 1,
0.7939786, 0.1423839, 1.143002, 0.7176471, 0, 1, 1,
0.797915, 0.1500989, 2.048229, 0.7215686, 0, 1, 1,
0.8016009, 0.08313366, 3.424814, 0.7294118, 0, 1, 1,
0.8020282, 0.2612163, 1.365672, 0.7333333, 0, 1, 1,
0.8093787, -1.89563, 2.924228, 0.7411765, 0, 1, 1,
0.8099951, -0.4499748, 0.9465214, 0.7450981, 0, 1, 1,
0.8140032, 0.286411, -0.7534716, 0.7529412, 0, 1, 1,
0.8146315, 1.350599, 0.4518356, 0.7568628, 0, 1, 1,
0.8160229, 0.1168652, 2.991856, 0.7647059, 0, 1, 1,
0.8162435, -0.6086642, 1.491245, 0.7686275, 0, 1, 1,
0.819819, 0.562256, 1.210356, 0.7764706, 0, 1, 1,
0.82679, 0.4134229, 1.39998, 0.7803922, 0, 1, 1,
0.834314, -1.490118, 2.136937, 0.7882353, 0, 1, 1,
0.8430461, -0.5574732, 1.234454, 0.7921569, 0, 1, 1,
0.8459024, -0.248084, 3.47709, 0.8, 0, 1, 1,
0.8478575, 2.367873, -0.9773738, 0.8078431, 0, 1, 1,
0.8493195, -0.8663231, 1.629428, 0.8117647, 0, 1, 1,
0.8538632, -1.460916, 4.670797, 0.8196079, 0, 1, 1,
0.85598, 0.5008567, -0.4163764, 0.8235294, 0, 1, 1,
0.8634164, 0.2972117, 1.148716, 0.8313726, 0, 1, 1,
0.8647719, -0.4311105, 1.664212, 0.8352941, 0, 1, 1,
0.8659936, -1.774359, 1.596891, 0.8431373, 0, 1, 1,
0.8664684, -1.583255, 3.508329, 0.8470588, 0, 1, 1,
0.8666023, 0.2230159, 1.803557, 0.854902, 0, 1, 1,
0.8675465, 0.2349042, -0.6176571, 0.8588235, 0, 1, 1,
0.8700697, -0.7528845, 2.076918, 0.8666667, 0, 1, 1,
0.8716545, -1.057971, 2.688603, 0.8705882, 0, 1, 1,
0.8726723, -0.4236392, 2.569641, 0.8784314, 0, 1, 1,
0.8790746, -1.239927, 3.900486, 0.8823529, 0, 1, 1,
0.8818094, 0.6160881, 0.7569456, 0.8901961, 0, 1, 1,
0.8902603, -0.8996974, 2.68247, 0.8941177, 0, 1, 1,
0.8903888, -0.954312, 1.600831, 0.9019608, 0, 1, 1,
0.8914666, 0.2754804, 0.7741244, 0.9098039, 0, 1, 1,
0.8942211, 0.3286783, 2.37327, 0.9137255, 0, 1, 1,
0.9024308, -1.574715, 2.707452, 0.9215686, 0, 1, 1,
0.9043512, -0.5312435, 1.277771, 0.9254902, 0, 1, 1,
0.906444, -1.312711, 2.626072, 0.9333333, 0, 1, 1,
0.9075683, 0.5545217, 1.127119, 0.9372549, 0, 1, 1,
0.9123105, -1.593141, 1.422042, 0.945098, 0, 1, 1,
0.9128135, -1.28725, 3.129361, 0.9490196, 0, 1, 1,
0.9130898, 0.7843904, 1.21787, 0.9568627, 0, 1, 1,
0.9225156, -0.6914073, 1.859379, 0.9607843, 0, 1, 1,
0.9313527, 0.1903152, 1.950789, 0.9686275, 0, 1, 1,
0.9425333, 1.197552, 0.9039152, 0.972549, 0, 1, 1,
0.9503448, -2.361753, 3.106928, 0.9803922, 0, 1, 1,
0.9512109, 1.466187, -1.628979, 0.9843137, 0, 1, 1,
0.9524583, 1.090727, -1.532446, 0.9921569, 0, 1, 1,
0.9529645, -0.1379264, 1.651834, 0.9960784, 0, 1, 1,
0.9602348, -0.1376375, 1.602542, 1, 0, 0.9960784, 1,
0.9605048, 0.8553104, 3.259157, 1, 0, 0.9882353, 1,
0.9607629, 1.499921, 1.862595, 1, 0, 0.9843137, 1,
0.9702985, 1.540505, 1.059865, 1, 0, 0.9764706, 1,
0.9712721, -0.259102, 1.420084, 1, 0, 0.972549, 1,
0.9730922, -0.4445505, 3.233515, 1, 0, 0.9647059, 1,
0.9733515, 0.8009371, 0.9541677, 1, 0, 0.9607843, 1,
0.9737506, -0.4686328, 0.7177507, 1, 0, 0.9529412, 1,
0.9756464, -0.1766067, 1.881493, 1, 0, 0.9490196, 1,
0.9786116, 0.7645404, 0.9421449, 1, 0, 0.9411765, 1,
0.9823853, -0.09533711, 0.9280341, 1, 0, 0.9372549, 1,
0.9856767, -0.05536454, 2.124852, 1, 0, 0.9294118, 1,
0.9878255, 0.6037607, 2.770692, 1, 0, 0.9254902, 1,
0.9992639, 0.05106176, 0.2409069, 1, 0, 0.9176471, 1,
1.000977, 1.172879, 0.4263842, 1, 0, 0.9137255, 1,
1.004468, 0.4311953, 2.638034, 1, 0, 0.9058824, 1,
1.009539, 0.03118919, 1.655999, 1, 0, 0.9019608, 1,
1.011304, -0.5318602, 2.341697, 1, 0, 0.8941177, 1,
1.013984, 0.4332322, 2.882116, 1, 0, 0.8862745, 1,
1.015251, -1.373119, 1.751601, 1, 0, 0.8823529, 1,
1.019487, 0.8778575, 0.8065401, 1, 0, 0.8745098, 1,
1.025395, -0.9983423, 1.608828, 1, 0, 0.8705882, 1,
1.026694, -0.4908937, 2.325399, 1, 0, 0.8627451, 1,
1.033236, 0.8098027, 0.3828733, 1, 0, 0.8588235, 1,
1.034712, 2.304195, -0.06922507, 1, 0, 0.8509804, 1,
1.03604, -0.3489211, 0.8730428, 1, 0, 0.8470588, 1,
1.040802, 0.1493213, 0.6054962, 1, 0, 0.8392157, 1,
1.048995, -0.5195121, 2.548524, 1, 0, 0.8352941, 1,
1.064502, 0.6102548, 2.831581, 1, 0, 0.827451, 1,
1.064877, -0.5925757, 1.902388, 1, 0, 0.8235294, 1,
1.0759, 2.065923, 0.2107698, 1, 0, 0.8156863, 1,
1.089555, 1.159127, -0.8102747, 1, 0, 0.8117647, 1,
1.091842, 0.04775907, 0.4080761, 1, 0, 0.8039216, 1,
1.092233, -0.9154815, 1.184289, 1, 0, 0.7960784, 1,
1.092447, -1.804995, 2.490556, 1, 0, 0.7921569, 1,
1.094223, -0.4221342, 1.8668, 1, 0, 0.7843137, 1,
1.108911, -0.5988806, 2.216648, 1, 0, 0.7803922, 1,
1.11388, 0.1083491, 1.02861, 1, 0, 0.772549, 1,
1.120069, 1.013499, -0.2195161, 1, 0, 0.7686275, 1,
1.129895, 0.9096903, 1.257974, 1, 0, 0.7607843, 1,
1.152669, 1.934428, 1.807735, 1, 0, 0.7568628, 1,
1.153458, 0.4353002, 1.566818, 1, 0, 0.7490196, 1,
1.157688, 1.243963, 2.282841, 1, 0, 0.7450981, 1,
1.163774, 0.4693782, 0.7302658, 1, 0, 0.7372549, 1,
1.167967, 1.290317, -0.4483346, 1, 0, 0.7333333, 1,
1.170052, 0.9529558, 0.4939163, 1, 0, 0.7254902, 1,
1.173387, -0.2790254, 2.935476, 1, 0, 0.7215686, 1,
1.178382, 1.186044, 1.576117, 1, 0, 0.7137255, 1,
1.183597, 0.9317081, 2.7611, 1, 0, 0.7098039, 1,
1.188395, -1.44363, 2.282605, 1, 0, 0.7019608, 1,
1.193211, -0.7197944, 0.8444047, 1, 0, 0.6941177, 1,
1.203449, -0.3277887, 2.001904, 1, 0, 0.6901961, 1,
1.205738, 1.049962, 2.278548, 1, 0, 0.682353, 1,
1.207615, -1.256795, 1.926742, 1, 0, 0.6784314, 1,
1.208483, 1.176364, -0.8936862, 1, 0, 0.6705883, 1,
1.2124, 0.05504177, 2.128962, 1, 0, 0.6666667, 1,
1.220725, -0.7918451, 2.043715, 1, 0, 0.6588235, 1,
1.231764, 0.4417477, 1.16096, 1, 0, 0.654902, 1,
1.235724, -0.2631791, 2.146232, 1, 0, 0.6470588, 1,
1.240089, 0.8852465, 2.2653, 1, 0, 0.6431373, 1,
1.252449, -1.589021, 1.637399, 1, 0, 0.6352941, 1,
1.258242, -0.04680802, 0.197542, 1, 0, 0.6313726, 1,
1.258707, -0.06247037, 2.487411, 1, 0, 0.6235294, 1,
1.258762, -0.1002085, 1.489786, 1, 0, 0.6196079, 1,
1.265661, 1.77445, 1.94031, 1, 0, 0.6117647, 1,
1.274778, -1.258694, 2.216756, 1, 0, 0.6078432, 1,
1.276395, 0.359468, 0.9310977, 1, 0, 0.6, 1,
1.276624, -0.2603599, 1.955526, 1, 0, 0.5921569, 1,
1.282436, 1.017507, 2.184763, 1, 0, 0.5882353, 1,
1.298999, -1.529012, 1.63102, 1, 0, 0.5803922, 1,
1.299553, -0.6473043, 1.486843, 1, 0, 0.5764706, 1,
1.299722, -0.9990659, 2.254094, 1, 0, 0.5686275, 1,
1.302042, 0.02851919, 2.958522, 1, 0, 0.5647059, 1,
1.302061, 1.41238, -0.1656163, 1, 0, 0.5568628, 1,
1.325659, -1.219802, 1.898264, 1, 0, 0.5529412, 1,
1.33467, -0.1030222, 0.8927164, 1, 0, 0.5450981, 1,
1.337698, 0.5361864, 1.461202, 1, 0, 0.5411765, 1,
1.355901, -1.317886, 0.9813436, 1, 0, 0.5333334, 1,
1.359532, 0.8992256, -0.5156543, 1, 0, 0.5294118, 1,
1.374142, 0.8897308, 1.251388, 1, 0, 0.5215687, 1,
1.374814, 1.433036, 0.8639254, 1, 0, 0.5176471, 1,
1.382596, 1.37087, 1.477281, 1, 0, 0.509804, 1,
1.386706, -0.7957203, 0.3701918, 1, 0, 0.5058824, 1,
1.38717, -0.9391423, -0.0265363, 1, 0, 0.4980392, 1,
1.388147, -0.8423525, 2.828087, 1, 0, 0.4901961, 1,
1.39633, -1.222695, 2.428705, 1, 0, 0.4862745, 1,
1.401633, -1.4297, 2.88728, 1, 0, 0.4784314, 1,
1.411399, 0.4167291, 1.151989, 1, 0, 0.4745098, 1,
1.412215, 0.9307579, 1.475367, 1, 0, 0.4666667, 1,
1.416842, -0.9762949, 2.167753, 1, 0, 0.4627451, 1,
1.417916, 1.125147, 0.7998831, 1, 0, 0.454902, 1,
1.429189, 0.3333646, 2.269064, 1, 0, 0.4509804, 1,
1.441089, 0.1308661, 1.137877, 1, 0, 0.4431373, 1,
1.441807, 0.2290705, 2.014127, 1, 0, 0.4392157, 1,
1.451011, -0.4352211, 2.212604, 1, 0, 0.4313726, 1,
1.455167, 0.1492051, 1.64115, 1, 0, 0.427451, 1,
1.477594, -1.302469, 0.5392941, 1, 0, 0.4196078, 1,
1.480324, 0.9937156, -0.003291066, 1, 0, 0.4156863, 1,
1.489414, -0.163408, 2.456559, 1, 0, 0.4078431, 1,
1.495479, -0.1447537, 3.792801, 1, 0, 0.4039216, 1,
1.496822, 0.1926683, 1.245197, 1, 0, 0.3960784, 1,
1.496873, -1.145956, 2.546873, 1, 0, 0.3882353, 1,
1.509888, 0.4202433, -0.2163192, 1, 0, 0.3843137, 1,
1.519523, -0.4708524, 1.864163, 1, 0, 0.3764706, 1,
1.521159, -0.3035092, 1.383168, 1, 0, 0.372549, 1,
1.521719, 1.319397, -0.291053, 1, 0, 0.3647059, 1,
1.525788, -0.9465957, 2.245736, 1, 0, 0.3607843, 1,
1.529245, 0.561016, 1.356188, 1, 0, 0.3529412, 1,
1.537731, 0.1949381, 0.4791298, 1, 0, 0.3490196, 1,
1.543411, -1.937372, 1.999759, 1, 0, 0.3411765, 1,
1.55196, -0.2849368, 1.168023, 1, 0, 0.3372549, 1,
1.560066, 1.192096, 1.114012, 1, 0, 0.3294118, 1,
1.593945, 1.176652, -0.1190898, 1, 0, 0.3254902, 1,
1.597245, 0.4549981, 2.17736, 1, 0, 0.3176471, 1,
1.605058, 0.06591374, 0.7315972, 1, 0, 0.3137255, 1,
1.628362, -0.2234446, 1.406411, 1, 0, 0.3058824, 1,
1.637793, 0.5602963, -1.072769, 1, 0, 0.2980392, 1,
1.638467, 0.02300052, 2.970572, 1, 0, 0.2941177, 1,
1.651482, -0.118116, 1.850632, 1, 0, 0.2862745, 1,
1.653483, -0.4094035, 2.215815, 1, 0, 0.282353, 1,
1.674407, -0.9438645, 0.4351677, 1, 0, 0.2745098, 1,
1.676974, 0.3127573, -0.7908444, 1, 0, 0.2705882, 1,
1.70739, -0.8630404, 1.444982, 1, 0, 0.2627451, 1,
1.714477, 0.3256086, 0.6213938, 1, 0, 0.2588235, 1,
1.715182, -2.734311, 2.509125, 1, 0, 0.2509804, 1,
1.722368, 1.052703, 1.567578, 1, 0, 0.2470588, 1,
1.737453, 0.5008757, 0.9832416, 1, 0, 0.2392157, 1,
1.759169, -0.72329, 1.968661, 1, 0, 0.2352941, 1,
1.766003, 0.881346, 1.253175, 1, 0, 0.227451, 1,
1.768854, -0.7158841, 2.85158, 1, 0, 0.2235294, 1,
1.774078, 0.4798115, 0.6941094, 1, 0, 0.2156863, 1,
1.77811, -1.835511, 2.834311, 1, 0, 0.2117647, 1,
1.784266, 1.452316, 0.461471, 1, 0, 0.2039216, 1,
1.793297, 0.8594822, -0.1948866, 1, 0, 0.1960784, 1,
1.798844, -1.862676, 0.9416934, 1, 0, 0.1921569, 1,
1.813017, 0.3914565, 1.488833, 1, 0, 0.1843137, 1,
1.816574, -0.8253887, 1.688697, 1, 0, 0.1803922, 1,
1.862011, -1.403525, 1.602768, 1, 0, 0.172549, 1,
1.867585, -1.170476, 3.667184, 1, 0, 0.1686275, 1,
1.882271, 1.243857, 1.403409, 1, 0, 0.1607843, 1,
1.893256, 0.2594585, 0.7419264, 1, 0, 0.1568628, 1,
1.951389, 1.38798, 0.5256928, 1, 0, 0.1490196, 1,
1.965472, 0.4022269, 0.08553205, 1, 0, 0.145098, 1,
1.971486, -0.2541222, 3.046447, 1, 0, 0.1372549, 1,
1.97807, 0.5922224, 3.064667, 1, 0, 0.1333333, 1,
1.999103, 1.587824, 0.4272978, 1, 0, 0.1254902, 1,
2.001003, -1.619468, 0.4297195, 1, 0, 0.1215686, 1,
2.032556, -1.166542, 3.239167, 1, 0, 0.1137255, 1,
2.079347, 0.6714525, 0.8005689, 1, 0, 0.1098039, 1,
2.092026, -0.122374, 0.4709505, 1, 0, 0.1019608, 1,
2.092599, -0.1943189, 3.048726, 1, 0, 0.09411765, 1,
2.099851, 0.07352167, 1.475016, 1, 0, 0.09019608, 1,
2.099999, -0.6291903, 1.30539, 1, 0, 0.08235294, 1,
2.140343, 1.020805, 1.502355, 1, 0, 0.07843138, 1,
2.215797, -0.6306924, 2.233766, 1, 0, 0.07058824, 1,
2.261889, 0.7580591, 2.520823, 1, 0, 0.06666667, 1,
2.374935, -0.4847658, 1.756583, 1, 0, 0.05882353, 1,
2.375899, -1.047416, 3.595983, 1, 0, 0.05490196, 1,
2.428159, 1.671634, 0.9980547, 1, 0, 0.04705882, 1,
2.437593, -0.9317494, 2.36725, 1, 0, 0.04313726, 1,
2.461544, -0.4345824, 1.492908, 1, 0, 0.03529412, 1,
2.495928, 0.5961313, 0.8925739, 1, 0, 0.03137255, 1,
2.532248, -0.7015977, 2.466472, 1, 0, 0.02352941, 1,
2.586049, 0.8331462, 3.234586, 1, 0, 0.01960784, 1,
2.799973, -0.1346299, 1.189945, 1, 0, 0.01176471, 1,
2.911558, -0.1672702, 1.512608, 1, 0, 0.007843138, 1
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
-0.2034425, -3.87545, -7.21382, 0, -0.5, 0.5, 0.5,
-0.2034425, -3.87545, -7.21382, 1, -0.5, 0.5, 0.5,
-0.2034425, -3.87545, -7.21382, 1, 1.5, 0.5, 0.5,
-0.2034425, -3.87545, -7.21382, 0, 1.5, 0.5, 0.5
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
-4.374429, 0.1780959, -7.21382, 0, -0.5, 0.5, 0.5,
-4.374429, 0.1780959, -7.21382, 1, -0.5, 0.5, 0.5,
-4.374429, 0.1780959, -7.21382, 1, 1.5, 0.5, 0.5,
-4.374429, 0.1780959, -7.21382, 0, 1.5, 0.5, 0.5
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
-4.374429, -3.87545, 0.1032102, 0, -0.5, 0.5, 0.5,
-4.374429, -3.87545, 0.1032102, 1, -0.5, 0.5, 0.5,
-4.374429, -3.87545, 0.1032102, 1, 1.5, 0.5, 0.5,
-4.374429, -3.87545, 0.1032102, 0, 1.5, 0.5, 0.5
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
-3, -2.940016, -5.525275,
2, -2.940016, -5.525275,
-3, -2.940016, -5.525275,
-3, -3.095922, -5.806699,
-2, -2.940016, -5.525275,
-2, -3.095922, -5.806699,
-1, -2.940016, -5.525275,
-1, -3.095922, -5.806699,
0, -2.940016, -5.525275,
0, -3.095922, -5.806699,
1, -2.940016, -5.525275,
1, -3.095922, -5.806699,
2, -2.940016, -5.525275,
2, -3.095922, -5.806699
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
-3, -3.407733, -6.369547, 0, -0.5, 0.5, 0.5,
-3, -3.407733, -6.369547, 1, -0.5, 0.5, 0.5,
-3, -3.407733, -6.369547, 1, 1.5, 0.5, 0.5,
-3, -3.407733, -6.369547, 0, 1.5, 0.5, 0.5,
-2, -3.407733, -6.369547, 0, -0.5, 0.5, 0.5,
-2, -3.407733, -6.369547, 1, -0.5, 0.5, 0.5,
-2, -3.407733, -6.369547, 1, 1.5, 0.5, 0.5,
-2, -3.407733, -6.369547, 0, 1.5, 0.5, 0.5,
-1, -3.407733, -6.369547, 0, -0.5, 0.5, 0.5,
-1, -3.407733, -6.369547, 1, -0.5, 0.5, 0.5,
-1, -3.407733, -6.369547, 1, 1.5, 0.5, 0.5,
-1, -3.407733, -6.369547, 0, 1.5, 0.5, 0.5,
0, -3.407733, -6.369547, 0, -0.5, 0.5, 0.5,
0, -3.407733, -6.369547, 1, -0.5, 0.5, 0.5,
0, -3.407733, -6.369547, 1, 1.5, 0.5, 0.5,
0, -3.407733, -6.369547, 0, 1.5, 0.5, 0.5,
1, -3.407733, -6.369547, 0, -0.5, 0.5, 0.5,
1, -3.407733, -6.369547, 1, -0.5, 0.5, 0.5,
1, -3.407733, -6.369547, 1, 1.5, 0.5, 0.5,
1, -3.407733, -6.369547, 0, 1.5, 0.5, 0.5,
2, -3.407733, -6.369547, 0, -0.5, 0.5, 0.5,
2, -3.407733, -6.369547, 1, -0.5, 0.5, 0.5,
2, -3.407733, -6.369547, 1, 1.5, 0.5, 0.5,
2, -3.407733, -6.369547, 0, 1.5, 0.5, 0.5
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
-3.411893, -2, -5.525275,
-3.411893, 3, -5.525275,
-3.411893, -2, -5.525275,
-3.572316, -2, -5.806699,
-3.411893, -1, -5.525275,
-3.572316, -1, -5.806699,
-3.411893, 0, -5.525275,
-3.572316, 0, -5.806699,
-3.411893, 1, -5.525275,
-3.572316, 1, -5.806699,
-3.411893, 2, -5.525275,
-3.572316, 2, -5.806699,
-3.411893, 3, -5.525275,
-3.572316, 3, -5.806699
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
-3.893161, -2, -6.369547, 0, -0.5, 0.5, 0.5,
-3.893161, -2, -6.369547, 1, -0.5, 0.5, 0.5,
-3.893161, -2, -6.369547, 1, 1.5, 0.5, 0.5,
-3.893161, -2, -6.369547, 0, 1.5, 0.5, 0.5,
-3.893161, -1, -6.369547, 0, -0.5, 0.5, 0.5,
-3.893161, -1, -6.369547, 1, -0.5, 0.5, 0.5,
-3.893161, -1, -6.369547, 1, 1.5, 0.5, 0.5,
-3.893161, -1, -6.369547, 0, 1.5, 0.5, 0.5,
-3.893161, 0, -6.369547, 0, -0.5, 0.5, 0.5,
-3.893161, 0, -6.369547, 1, -0.5, 0.5, 0.5,
-3.893161, 0, -6.369547, 1, 1.5, 0.5, 0.5,
-3.893161, 0, -6.369547, 0, 1.5, 0.5, 0.5,
-3.893161, 1, -6.369547, 0, -0.5, 0.5, 0.5,
-3.893161, 1, -6.369547, 1, -0.5, 0.5, 0.5,
-3.893161, 1, -6.369547, 1, 1.5, 0.5, 0.5,
-3.893161, 1, -6.369547, 0, 1.5, 0.5, 0.5,
-3.893161, 2, -6.369547, 0, -0.5, 0.5, 0.5,
-3.893161, 2, -6.369547, 1, -0.5, 0.5, 0.5,
-3.893161, 2, -6.369547, 1, 1.5, 0.5, 0.5,
-3.893161, 2, -6.369547, 0, 1.5, 0.5, 0.5,
-3.893161, 3, -6.369547, 0, -0.5, 0.5, 0.5,
-3.893161, 3, -6.369547, 1, -0.5, 0.5, 0.5,
-3.893161, 3, -6.369547, 1, 1.5, 0.5, 0.5,
-3.893161, 3, -6.369547, 0, 1.5, 0.5, 0.5
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
-3.411893, -2.940016, -4,
-3.411893, -2.940016, 4,
-3.411893, -2.940016, -4,
-3.572316, -3.095922, -4,
-3.411893, -2.940016, -2,
-3.572316, -3.095922, -2,
-3.411893, -2.940016, 0,
-3.572316, -3.095922, 0,
-3.411893, -2.940016, 2,
-3.572316, -3.095922, 2,
-3.411893, -2.940016, 4,
-3.572316, -3.095922, 4
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
-3.893161, -3.407733, -4, 0, -0.5, 0.5, 0.5,
-3.893161, -3.407733, -4, 1, -0.5, 0.5, 0.5,
-3.893161, -3.407733, -4, 1, 1.5, 0.5, 0.5,
-3.893161, -3.407733, -4, 0, 1.5, 0.5, 0.5,
-3.893161, -3.407733, -2, 0, -0.5, 0.5, 0.5,
-3.893161, -3.407733, -2, 1, -0.5, 0.5, 0.5,
-3.893161, -3.407733, -2, 1, 1.5, 0.5, 0.5,
-3.893161, -3.407733, -2, 0, 1.5, 0.5, 0.5,
-3.893161, -3.407733, 0, 0, -0.5, 0.5, 0.5,
-3.893161, -3.407733, 0, 1, -0.5, 0.5, 0.5,
-3.893161, -3.407733, 0, 1, 1.5, 0.5, 0.5,
-3.893161, -3.407733, 0, 0, 1.5, 0.5, 0.5,
-3.893161, -3.407733, 2, 0, -0.5, 0.5, 0.5,
-3.893161, -3.407733, 2, 1, -0.5, 0.5, 0.5,
-3.893161, -3.407733, 2, 1, 1.5, 0.5, 0.5,
-3.893161, -3.407733, 2, 0, 1.5, 0.5, 0.5,
-3.893161, -3.407733, 4, 0, -0.5, 0.5, 0.5,
-3.893161, -3.407733, 4, 1, -0.5, 0.5, 0.5,
-3.893161, -3.407733, 4, 1, 1.5, 0.5, 0.5,
-3.893161, -3.407733, 4, 0, 1.5, 0.5, 0.5
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
-3.411893, -2.940016, -5.525275,
-3.411893, 3.296208, -5.525275,
-3.411893, -2.940016, 5.731695,
-3.411893, 3.296208, 5.731695,
-3.411893, -2.940016, -5.525275,
-3.411893, -2.940016, 5.731695,
-3.411893, 3.296208, -5.525275,
-3.411893, 3.296208, 5.731695,
-3.411893, -2.940016, -5.525275,
3.005008, -2.940016, -5.525275,
-3.411893, -2.940016, 5.731695,
3.005008, -2.940016, 5.731695,
-3.411893, 3.296208, -5.525275,
3.005008, 3.296208, -5.525275,
-3.411893, 3.296208, 5.731695,
3.005008, 3.296208, 5.731695,
3.005008, -2.940016, -5.525275,
3.005008, 3.296208, -5.525275,
3.005008, -2.940016, 5.731695,
3.005008, 3.296208, 5.731695,
3.005008, -2.940016, -5.525275,
3.005008, -2.940016, 5.731695,
3.005008, 3.296208, -5.525275,
3.005008, 3.296208, 5.731695
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
var radius = 7.67868;
var distance = 34.16331;
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
mvMatrix.translate( 0.2034425, -0.1780959, -0.1032102 );
mvMatrix.scale( 1.293824, 1.331309, 0.7375287 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.16331);
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
Cycloheximide<-read.table("Cycloheximide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cycloheximide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cycloheximide' not found
```

```r
y<-Cycloheximide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cycloheximide' not found
```

```r
z<-Cycloheximide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cycloheximide' not found
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
-3.318443, 0.5170361, -0.6569265, 0, 0, 1, 1, 1,
-2.874419, 0.1256017, -2.525281, 1, 0, 0, 1, 1,
-2.550574, 0.313061, -1.610467, 1, 0, 0, 1, 1,
-2.521799, 0.1604998, -1.914224, 1, 0, 0, 1, 1,
-2.480678, 0.6093085, -1.356217, 1, 0, 0, 1, 1,
-2.465035, -0.4001215, -1.858462, 1, 0, 0, 1, 1,
-2.461563, -0.2413417, -2.286504, 0, 0, 0, 1, 1,
-2.448825, 1.752583, 0.1396487, 0, 0, 0, 1, 1,
-2.371441, -0.1509604, -1.674293, 0, 0, 0, 1, 1,
-2.359191, 0.6810313, -0.9259706, 0, 0, 0, 1, 1,
-2.358323, 2.003897, -0.9063722, 0, 0, 0, 1, 1,
-2.351662, 0.3850719, -1.286995, 0, 0, 0, 1, 1,
-2.276429, -0.7386154, -2.513093, 0, 0, 0, 1, 1,
-2.27466, 0.1082505, -1.715065, 1, 1, 1, 1, 1,
-2.268396, -1.114609, -4.074203, 1, 1, 1, 1, 1,
-2.256623, 1.184308, -0.8185738, 1, 1, 1, 1, 1,
-2.232552, -1.571687, -1.267269, 1, 1, 1, 1, 1,
-2.22263, -2.638039, -2.0971, 1, 1, 1, 1, 1,
-2.216336, -1.787812, -3.781269, 1, 1, 1, 1, 1,
-2.186637, 1.295452, -1.583436, 1, 1, 1, 1, 1,
-2.177885, -1.411338, -3.250792, 1, 1, 1, 1, 1,
-2.12784, 0.6377444, -1.44417, 1, 1, 1, 1, 1,
-2.108438, 0.01876507, -1.25984, 1, 1, 1, 1, 1,
-2.090598, 0.4758186, -1.410841, 1, 1, 1, 1, 1,
-2.055507, 0.8746101, -3.172671, 1, 1, 1, 1, 1,
-2.049173, 0.3786352, -1.174323, 1, 1, 1, 1, 1,
-2.025887, 1.067915, -0.7627162, 1, 1, 1, 1, 1,
-2.025169, 1.727072, -1.144654, 1, 1, 1, 1, 1,
-1.986404, -1.135479, -1.677722, 0, 0, 1, 1, 1,
-1.954026, 1.972585, -0.144762, 1, 0, 0, 1, 1,
-1.928761, 0.1446577, 0.1156161, 1, 0, 0, 1, 1,
-1.892018, -1.580402, -2.751368, 1, 0, 0, 1, 1,
-1.844873, -0.05870286, -1.793355, 1, 0, 0, 1, 1,
-1.837, 0.4104857, 0.8412461, 1, 0, 0, 1, 1,
-1.833353, 2.585626, -0.1108131, 0, 0, 0, 1, 1,
-1.798162, 0.003773691, -2.810343, 0, 0, 0, 1, 1,
-1.796698, 1.289973, -0.4344757, 0, 0, 0, 1, 1,
-1.792559, -0.1805253, -0.8799798, 0, 0, 0, 1, 1,
-1.790802, -0.5010602, -0.6527784, 0, 0, 0, 1, 1,
-1.76652, 0.7484863, -0.08069912, 0, 0, 0, 1, 1,
-1.743393, -1.183773, -1.440703, 0, 0, 0, 1, 1,
-1.742613, 1.621634, 0.4859808, 1, 1, 1, 1, 1,
-1.731468, 0.929041, 0.4269539, 1, 1, 1, 1, 1,
-1.724162, 0.3935284, -1.727217, 1, 1, 1, 1, 1,
-1.714393, 2.641847, 0.6802781, 1, 1, 1, 1, 1,
-1.711184, 0.0798259, 0.978942, 1, 1, 1, 1, 1,
-1.681462, 0.2606126, -0.5012435, 1, 1, 1, 1, 1,
-1.656909, -1.353525, -1.852852, 1, 1, 1, 1, 1,
-1.656772, -2.052188, -1.175678, 1, 1, 1, 1, 1,
-1.656164, -0.2257805, -1.48696, 1, 1, 1, 1, 1,
-1.648958, 0.1064723, -1.328476, 1, 1, 1, 1, 1,
-1.634826, -0.2154533, -1.179922, 1, 1, 1, 1, 1,
-1.629008, -0.809932, -2.880987, 1, 1, 1, 1, 1,
-1.623683, -0.7733261, -1.775326, 1, 1, 1, 1, 1,
-1.611454, 1.346197, -2.121134, 1, 1, 1, 1, 1,
-1.610186, -0.8411114, -1.329059, 1, 1, 1, 1, 1,
-1.606742, -0.06036733, -1.407981, 0, 0, 1, 1, 1,
-1.600389, -1.547943, -1.886794, 1, 0, 0, 1, 1,
-1.597659, 0.773773, -1.302227, 1, 0, 0, 1, 1,
-1.594016, -1.158803, -3.308256, 1, 0, 0, 1, 1,
-1.590446, 0.07534598, -0.5227172, 1, 0, 0, 1, 1,
-1.579569, -1.118524, -2.495256, 1, 0, 0, 1, 1,
-1.568296, -2.050521, -1.590873, 0, 0, 0, 1, 1,
-1.566844, -1.012465, -3.552643, 0, 0, 0, 1, 1,
-1.566044, -1.28255, -0.4171976, 0, 0, 0, 1, 1,
-1.556777, -1.351349, -5.361338, 0, 0, 0, 1, 1,
-1.523516, -0.03856029, -3.061826, 0, 0, 0, 1, 1,
-1.511287, 0.8228796, -2.600249, 0, 0, 0, 1, 1,
-1.495816, -0.7530339, -3.350244, 0, 0, 0, 1, 1,
-1.475775, -0.1159363, -1.703329, 1, 1, 1, 1, 1,
-1.475407, 0.4081185, -1.637535, 1, 1, 1, 1, 1,
-1.462087, 1.387993, -1.625386, 1, 1, 1, 1, 1,
-1.45074, -0.7046648, -2.264903, 1, 1, 1, 1, 1,
-1.442774, 0.7130336, -0.1945552, 1, 1, 1, 1, 1,
-1.43313, 0.01565874, -1.429705, 1, 1, 1, 1, 1,
-1.429053, 0.3221585, 0.1194352, 1, 1, 1, 1, 1,
-1.427025, 0.9804911, 0.3793992, 1, 1, 1, 1, 1,
-1.410008, 1.240734, -1.437037, 1, 1, 1, 1, 1,
-1.406184, 2.489678, -1.371606, 1, 1, 1, 1, 1,
-1.405434, -0.7879897, -4.869499, 1, 1, 1, 1, 1,
-1.399381, 1.360065, -1.384902, 1, 1, 1, 1, 1,
-1.390356, -0.4351684, -1.691433, 1, 1, 1, 1, 1,
-1.37773, -1.950684, -3.527899, 1, 1, 1, 1, 1,
-1.37426, 0.0123492, -0.9838857, 1, 1, 1, 1, 1,
-1.371887, 1.490299, -1.073779, 0, 0, 1, 1, 1,
-1.371748, 0.1400304, -1.347144, 1, 0, 0, 1, 1,
-1.348301, -0.9062232, -1.050794, 1, 0, 0, 1, 1,
-1.346735, -1.842731, -2.85868, 1, 0, 0, 1, 1,
-1.333494, -0.1278049, -1.586633, 1, 0, 0, 1, 1,
-1.324746, -1.088796, -2.188878, 1, 0, 0, 1, 1,
-1.323487, -0.9574207, -2.45844, 0, 0, 0, 1, 1,
-1.322671, 1.093643, -0.3481277, 0, 0, 0, 1, 1,
-1.315966, 0.02907426, -2.50504, 0, 0, 0, 1, 1,
-1.312119, 0.4156335, -0.9979648, 0, 0, 0, 1, 1,
-1.304691, -0.6077074, -2.972524, 0, 0, 0, 1, 1,
-1.280954, 1.733029, 1.875087, 0, 0, 0, 1, 1,
-1.272873, 0.6983253, -2.039606, 0, 0, 0, 1, 1,
-1.271799, 0.6471134, 0.7300253, 1, 1, 1, 1, 1,
-1.267959, -0.7977675, -2.062942, 1, 1, 1, 1, 1,
-1.266215, 0.6801549, -2.03955, 1, 1, 1, 1, 1,
-1.264212, -1.405832, -2.518856, 1, 1, 1, 1, 1,
-1.261724, 0.2355824, -3.033477, 1, 1, 1, 1, 1,
-1.248519, 0.338601, -0.533902, 1, 1, 1, 1, 1,
-1.245377, -0.8747687, -3.043165, 1, 1, 1, 1, 1,
-1.240651, -0.1576312, -2.166485, 1, 1, 1, 1, 1,
-1.240105, -0.3727988, -1.286767, 1, 1, 1, 1, 1,
-1.237062, 1.455211, -0.5336611, 1, 1, 1, 1, 1,
-1.236807, -1.17531, -0.109358, 1, 1, 1, 1, 1,
-1.23623, -2.423987, -2.569696, 1, 1, 1, 1, 1,
-1.235086, 0.1117581, -2.846281, 1, 1, 1, 1, 1,
-1.234981, 0.1429017, -2.796381, 1, 1, 1, 1, 1,
-1.228892, 0.05215739, -1.227006, 1, 1, 1, 1, 1,
-1.22828, 0.1840734, -2.305486, 0, 0, 1, 1, 1,
-1.228146, -0.7264202, -2.415554, 1, 0, 0, 1, 1,
-1.225656, -0.9119927, -0.3540767, 1, 0, 0, 1, 1,
-1.204342, -0.8206008, -0.5999377, 1, 0, 0, 1, 1,
-1.204012, 0.7969296, -1.289553, 1, 0, 0, 1, 1,
-1.202943, -0.2159328, -1.657364, 1, 0, 0, 1, 1,
-1.186593, -0.986925, -0.5495144, 0, 0, 0, 1, 1,
-1.175606, -0.1784981, -3.056791, 0, 0, 0, 1, 1,
-1.175437, 0.01221899, -0.849529, 0, 0, 0, 1, 1,
-1.175365, -0.5334233, -1.167711, 0, 0, 0, 1, 1,
-1.174948, -0.28497, -1.359062, 0, 0, 0, 1, 1,
-1.17344, 0.9949108, -2.955816, 0, 0, 0, 1, 1,
-1.173241, 0.9806058, -1.304054, 0, 0, 0, 1, 1,
-1.172334, -0.1304497, -1.629048, 1, 1, 1, 1, 1,
-1.170187, 2.069992, -0.8380718, 1, 1, 1, 1, 1,
-1.167878, 1.338647, -0.6124677, 1, 1, 1, 1, 1,
-1.158279, -0.391712, -3.332501, 1, 1, 1, 1, 1,
-1.157028, -1.362938, -3.983473, 1, 1, 1, 1, 1,
-1.151516, -1.728163, -3.44751, 1, 1, 1, 1, 1,
-1.150779, -0.03468888, -1.618807, 1, 1, 1, 1, 1,
-1.144807, 1.006139, 0.25453, 1, 1, 1, 1, 1,
-1.144333, 0.5496438, -0.7773224, 1, 1, 1, 1, 1,
-1.143113, 1.626433, -1.046308, 1, 1, 1, 1, 1,
-1.13515, 0.5755424, -0.7756083, 1, 1, 1, 1, 1,
-1.133466, -0.8119339, -3.425754, 1, 1, 1, 1, 1,
-1.132713, -0.6739411, -2.393361, 1, 1, 1, 1, 1,
-1.12236, -0.7924755, -1.796893, 1, 1, 1, 1, 1,
-1.119023, 1.066344, -1.044719, 1, 1, 1, 1, 1,
-1.118851, 0.01984921, -1.729997, 0, 0, 1, 1, 1,
-1.116876, -0.1810671, -1.448846, 1, 0, 0, 1, 1,
-1.112642, 2.545297, 0.309233, 1, 0, 0, 1, 1,
-1.103595, -0.8451219, -2.014143, 1, 0, 0, 1, 1,
-1.08321, 0.2050684, -0.9385919, 1, 0, 0, 1, 1,
-1.07643, -1.364779, -2.12559, 1, 0, 0, 1, 1,
-1.076332, -0.5299239, -3.53841, 0, 0, 0, 1, 1,
-1.074119, 0.8562405, -0.2605189, 0, 0, 0, 1, 1,
-1.072382, 0.9423637, 0.06992412, 0, 0, 0, 1, 1,
-1.064968, -0.3196133, -2.853324, 0, 0, 0, 1, 1,
-1.064747, -0.4008728, -3.339181, 0, 0, 0, 1, 1,
-1.061869, 0.5800576, -0.5194655, 0, 0, 0, 1, 1,
-1.056659, 1.132116, -1.511583, 0, 0, 0, 1, 1,
-1.056569, 0.2984757, -1.761764, 1, 1, 1, 1, 1,
-1.053795, 0.5374995, -1.995394, 1, 1, 1, 1, 1,
-1.051591, 0.6700166, 0.4251128, 1, 1, 1, 1, 1,
-1.047716, 1.112982, -1.531028, 1, 1, 1, 1, 1,
-1.047482, 0.3861172, -1.319831, 1, 1, 1, 1, 1,
-1.040361, 1.110567, -1.79107, 1, 1, 1, 1, 1,
-1.039044, 0.3329802, -2.102452, 1, 1, 1, 1, 1,
-1.036625, -0.4042533, -1.488096, 1, 1, 1, 1, 1,
-1.030691, 0.1564045, -1.385287, 1, 1, 1, 1, 1,
-1.029118, -1.175666, -3.305434, 1, 1, 1, 1, 1,
-1.023468, 0.3203183, -1.722268, 1, 1, 1, 1, 1,
-1.008211, 1.799732, -1.711278, 1, 1, 1, 1, 1,
-1.002977, -1.141224, -2.18863, 1, 1, 1, 1, 1,
-1.000975, -1.061407, -2.557567, 1, 1, 1, 1, 1,
-0.9988405, -0.6595657, -1.591124, 1, 1, 1, 1, 1,
-0.9930745, -0.4030582, -2.093516, 0, 0, 1, 1, 1,
-0.9905766, 0.2821199, -0.4028758, 1, 0, 0, 1, 1,
-0.9832077, -0.2018839, -2.26312, 1, 0, 0, 1, 1,
-0.9719304, -1.750433, -5.356746, 1, 0, 0, 1, 1,
-0.9713505, -1.441038, -2.145149, 1, 0, 0, 1, 1,
-0.9671052, 1.103414, -0.0777998, 1, 0, 0, 1, 1,
-0.9648176, 0.04474624, -1.444252, 0, 0, 0, 1, 1,
-0.9634119, -1.848352, -3.166435, 0, 0, 0, 1, 1,
-0.9629096, 0.6690191, -0.5130055, 0, 0, 0, 1, 1,
-0.9587212, -1.054607, -2.244455, 0, 0, 0, 1, 1,
-0.9555227, 1.626301, 0.2125195, 0, 0, 0, 1, 1,
-0.9445174, -0.3194249, -1.426583, 0, 0, 0, 1, 1,
-0.9252551, 0.6570294, -1.281829, 0, 0, 0, 1, 1,
-0.91315, 0.5104941, -0.7698423, 1, 1, 1, 1, 1,
-0.9126752, 0.4126212, -0.3908556, 1, 1, 1, 1, 1,
-0.9124781, -1.618081, -3.832923, 1, 1, 1, 1, 1,
-0.9121955, 1.208164, -2.358427, 1, 1, 1, 1, 1,
-0.9033601, -0.4093128, -2.1871, 1, 1, 1, 1, 1,
-0.8854837, -0.879598, -2.070438, 1, 1, 1, 1, 1,
-0.8799665, 0.6154771, -0.04466539, 1, 1, 1, 1, 1,
-0.8779568, 0.6207631, -2.976259, 1, 1, 1, 1, 1,
-0.8765964, 0.1371228, -1.100195, 1, 1, 1, 1, 1,
-0.8662595, 0.9692688, -0.9992336, 1, 1, 1, 1, 1,
-0.861285, 0.6593031, -0.5088459, 1, 1, 1, 1, 1,
-0.8600506, -0.8903005, -4.088275, 1, 1, 1, 1, 1,
-0.858744, -0.4203158, 0.2960462, 1, 1, 1, 1, 1,
-0.8489074, -0.5420631, -4.165524, 1, 1, 1, 1, 1,
-0.8486671, -0.0592566, -1.800944, 1, 1, 1, 1, 1,
-0.8445539, 0.9006929, -0.9230596, 0, 0, 1, 1, 1,
-0.8411134, -0.7847764, -3.961277, 1, 0, 0, 1, 1,
-0.8399128, 0.49873, -1.184755, 1, 0, 0, 1, 1,
-0.833524, -2.418643, -3.245369, 1, 0, 0, 1, 1,
-0.8193485, 0.9789395, -1.772715, 1, 0, 0, 1, 1,
-0.8151953, 2.673571, -1.194175, 1, 0, 0, 1, 1,
-0.8142044, 1.579835, -0.5228819, 0, 0, 0, 1, 1,
-0.8086087, -2.02692, -3.210688, 0, 0, 0, 1, 1,
-0.8049821, 0.4551861, -2.23576, 0, 0, 0, 1, 1,
-0.799515, 0.2670687, -3.01381, 0, 0, 0, 1, 1,
-0.7939743, 1.084161, -1.683065, 0, 0, 0, 1, 1,
-0.791262, -1.526719, -3.376006, 0, 0, 0, 1, 1,
-0.7895897, 0.5088111, -1.515161, 0, 0, 0, 1, 1,
-0.777681, 0.2167322, -1.603947, 1, 1, 1, 1, 1,
-0.7765045, 0.1569645, -1.251561, 1, 1, 1, 1, 1,
-0.7709541, 0.6994876, -0.1321037, 1, 1, 1, 1, 1,
-0.7708938, 0.9935818, 1.143242, 1, 1, 1, 1, 1,
-0.7694501, -1.755898, -2.303682, 1, 1, 1, 1, 1,
-0.7517965, -2.296801, -3.700436, 1, 1, 1, 1, 1,
-0.7501746, 0.6142138, -0.1078731, 1, 1, 1, 1, 1,
-0.7451274, 1.294721, -0.9899079, 1, 1, 1, 1, 1,
-0.7434981, 0.4565271, -1.617538, 1, 1, 1, 1, 1,
-0.7433759, 0.4257504, -0.1235073, 1, 1, 1, 1, 1,
-0.7407709, 1.937769, 0.3152111, 1, 1, 1, 1, 1,
-0.7373595, 0.2764067, -2.183818, 1, 1, 1, 1, 1,
-0.7366672, -2.29364, -2.964268, 1, 1, 1, 1, 1,
-0.7364416, 1.271298, 0.3996563, 1, 1, 1, 1, 1,
-0.7333242, -0.9672875, -1.800578, 1, 1, 1, 1, 1,
-0.7290319, -0.1445273, -4.049363, 0, 0, 1, 1, 1,
-0.7287304, -0.6942504, -1.513807, 1, 0, 0, 1, 1,
-0.7238563, 0.4500774, -2.545366, 1, 0, 0, 1, 1,
-0.7238328, 0.7020025, -1.558591, 1, 0, 0, 1, 1,
-0.7191427, 0.3763424, -0.09022121, 1, 0, 0, 1, 1,
-0.7025169, -0.5251408, -0.2002358, 1, 0, 0, 1, 1,
-0.6994944, 0.3284411, -1.995689, 0, 0, 0, 1, 1,
-0.6940475, 0.31627, -0.9314106, 0, 0, 0, 1, 1,
-0.6901653, 0.5044327, -1.876555, 0, 0, 0, 1, 1,
-0.6883146, -0.5100797, -2.944881, 0, 0, 0, 1, 1,
-0.6878374, -0.8436394, -2.447834, 0, 0, 0, 1, 1,
-0.6853301, -0.4174921, -1.73545, 0, 0, 0, 1, 1,
-0.6850407, 0.9046919, -1.289238, 0, 0, 0, 1, 1,
-0.6832749, -1.085201, -4.222079, 1, 1, 1, 1, 1,
-0.6831574, -1.601, -2.290418, 1, 1, 1, 1, 1,
-0.6804506, -0.09741328, -0.7794341, 1, 1, 1, 1, 1,
-0.6795495, -0.6060988, -3.424736, 1, 1, 1, 1, 1,
-0.6791507, -1.09286, -2.773952, 1, 1, 1, 1, 1,
-0.6781976, -0.2956584, -1.122744, 1, 1, 1, 1, 1,
-0.6762851, 0.3866878, -1.516468, 1, 1, 1, 1, 1,
-0.6740685, 0.1678561, -0.9014507, 1, 1, 1, 1, 1,
-0.6730906, 1.158044, -0.3399134, 1, 1, 1, 1, 1,
-0.6730856, -1.227374, -2.264747, 1, 1, 1, 1, 1,
-0.6719133, 0.01322262, -1.92553, 1, 1, 1, 1, 1,
-0.6690499, -0.9620919, -1.681287, 1, 1, 1, 1, 1,
-0.6646557, 0.8439064, -1.781093, 1, 1, 1, 1, 1,
-0.6642906, 1.37389, -1.026092, 1, 1, 1, 1, 1,
-0.6623432, 1.251935, 0.2707129, 1, 1, 1, 1, 1,
-0.6622323, -0.1225863, -2.386887, 0, 0, 1, 1, 1,
-0.6608201, -0.7833425, -2.42912, 1, 0, 0, 1, 1,
-0.659417, -0.06086015, -1.580985, 1, 0, 0, 1, 1,
-0.6565773, 0.9007578, -1.82131, 1, 0, 0, 1, 1,
-0.6557272, 1.444428, -0.8556094, 1, 0, 0, 1, 1,
-0.6446053, -1.140327, -2.909607, 1, 0, 0, 1, 1,
-0.6440731, 0.06009891, -2.081673, 0, 0, 0, 1, 1,
-0.6392176, 0.3485884, -2.004468, 0, 0, 0, 1, 1,
-0.6329304, 0.4172668, -1.979116, 0, 0, 0, 1, 1,
-0.6327357, 0.3789848, -1.384168, 0, 0, 0, 1, 1,
-0.6288398, -0.01048249, -0.8446942, 0, 0, 0, 1, 1,
-0.6234495, -1.654472, -1.663191, 0, 0, 0, 1, 1,
-0.6181151, 0.5086747, -1.860231, 0, 0, 0, 1, 1,
-0.6038575, 0.535708, -2.622875, 1, 1, 1, 1, 1,
-0.6011276, 0.3993723, -1.173261, 1, 1, 1, 1, 1,
-0.6004105, -0.1629798, 0.007185991, 1, 1, 1, 1, 1,
-0.5990874, 0.6463631, -0.8870761, 1, 1, 1, 1, 1,
-0.5969627, 0.5030155, -0.3115736, 1, 1, 1, 1, 1,
-0.5965967, 1.502211, -1.112215, 1, 1, 1, 1, 1,
-0.5913798, -0.8797485, -3.090053, 1, 1, 1, 1, 1,
-0.590605, 0.4284119, -3.165543, 1, 1, 1, 1, 1,
-0.5803621, 0.9342286, -1.081547, 1, 1, 1, 1, 1,
-0.5753362, -0.2711359, -1.763794, 1, 1, 1, 1, 1,
-0.5707355, 0.433892, 0.8635751, 1, 1, 1, 1, 1,
-0.5672337, -0.7560928, -2.468677, 1, 1, 1, 1, 1,
-0.5670151, 0.5824097, -0.8472365, 1, 1, 1, 1, 1,
-0.56665, 0.8389523, 0.4859873, 1, 1, 1, 1, 1,
-0.5663357, 0.9764928, -0.7281416, 1, 1, 1, 1, 1,
-0.5651021, 1.881273, -0.9201515, 0, 0, 1, 1, 1,
-0.5628576, -0.3451132, -3.122798, 1, 0, 0, 1, 1,
-0.5547691, -1.545845, -1.773559, 1, 0, 0, 1, 1,
-0.5523854, -0.3983255, -1.714148, 1, 0, 0, 1, 1,
-0.5520776, -0.5474642, -0.8866777, 1, 0, 0, 1, 1,
-0.5462798, 1.055586, 0.07286707, 1, 0, 0, 1, 1,
-0.5431036, -0.9658792, -0.02277006, 0, 0, 0, 1, 1,
-0.542608, -0.9365122, -2.469475, 0, 0, 0, 1, 1,
-0.5412079, -0.9414539, -1.79803, 0, 0, 0, 1, 1,
-0.5377136, 1.320213, -1.514423, 0, 0, 0, 1, 1,
-0.5355681, -1.605485, -2.326043, 0, 0, 0, 1, 1,
-0.5297108, -0.3244555, -5.073731, 0, 0, 0, 1, 1,
-0.5265309, -0.631307, -0.425856, 0, 0, 0, 1, 1,
-0.5261663, 0.9774582, -1.545477, 1, 1, 1, 1, 1,
-0.5261103, -2.025518, -2.550679, 1, 1, 1, 1, 1,
-0.5206434, -2.654639, -2.644176, 1, 1, 1, 1, 1,
-0.5173385, 1.439886, 0.1249703, 1, 1, 1, 1, 1,
-0.5033517, -0.5291962, -3.04943, 1, 1, 1, 1, 1,
-0.5010793, -0.1969102, -3.660828, 1, 1, 1, 1, 1,
-0.4991697, 0.5691074, 0.3547728, 1, 1, 1, 1, 1,
-0.4985172, 0.08944783, -1.893756, 1, 1, 1, 1, 1,
-0.4980649, -0.7609274, -2.299291, 1, 1, 1, 1, 1,
-0.494752, -0.05777269, -2.11217, 1, 1, 1, 1, 1,
-0.4943647, 0.5805225, 0.6410379, 1, 1, 1, 1, 1,
-0.4919716, 0.9920117, 0.1945523, 1, 1, 1, 1, 1,
-0.483346, 0.05757352, -2.1399, 1, 1, 1, 1, 1,
-0.4726519, -0.3195252, -0.3180688, 1, 1, 1, 1, 1,
-0.4715052, 1.069979, 0.4699943, 1, 1, 1, 1, 1,
-0.4663555, 1.032755, -2.771685, 0, 0, 1, 1, 1,
-0.4644676, 0.2320057, -1.805279, 1, 0, 0, 1, 1,
-0.4552636, -0.1942958, -2.039713, 1, 0, 0, 1, 1,
-0.4480881, 0.2308804, -0.4434596, 1, 0, 0, 1, 1,
-0.4456842, -0.4123306, -3.261032, 1, 0, 0, 1, 1,
-0.4449417, -1.098926, -2.673727, 1, 0, 0, 1, 1,
-0.4438643, 0.6074355, 0.1436169, 0, 0, 0, 1, 1,
-0.4432608, -0.02768327, -1.781173, 0, 0, 0, 1, 1,
-0.4300081, -1.736045, -1.904485, 0, 0, 0, 1, 1,
-0.4281256, 0.6563132, -1.131718, 0, 0, 0, 1, 1,
-0.4280964, -0.4305395, -1.038303, 0, 0, 0, 1, 1,
-0.4277003, 0.06934417, -2.885898, 0, 0, 0, 1, 1,
-0.4273665, -0.2193924, -3.206285, 0, 0, 0, 1, 1,
-0.4253091, -1.541432, -2.364619, 1, 1, 1, 1, 1,
-0.4245358, -1.599782, -1.784634, 1, 1, 1, 1, 1,
-0.4244657, -0.2720509, -3.092595, 1, 1, 1, 1, 1,
-0.4235751, 1.553086, 0.6170632, 1, 1, 1, 1, 1,
-0.4201823, 0.6290812, -1.727298, 1, 1, 1, 1, 1,
-0.4166053, -0.01850236, -3.499954, 1, 1, 1, 1, 1,
-0.4157643, 0.02737427, -0.1599417, 1, 1, 1, 1, 1,
-0.4139777, 0.9931688, -0.6618264, 1, 1, 1, 1, 1,
-0.398066, 0.8409657, -1.035072, 1, 1, 1, 1, 1,
-0.3978593, 1.24001, -1.570246, 1, 1, 1, 1, 1,
-0.3977713, -0.5364586, -2.397139, 1, 1, 1, 1, 1,
-0.3964834, -0.527004, -2.73877, 1, 1, 1, 1, 1,
-0.3955408, -1.400462, -3.277701, 1, 1, 1, 1, 1,
-0.3936505, 1.906878, 0.3588157, 1, 1, 1, 1, 1,
-0.3914844, -0.4972377, -2.319622, 1, 1, 1, 1, 1,
-0.3854221, -2.284556, -3.954498, 0, 0, 1, 1, 1,
-0.384104, -0.9480652, -3.303419, 1, 0, 0, 1, 1,
-0.3828275, 1.06382, -0.594817, 1, 0, 0, 1, 1,
-0.3810482, -1.351518, -1.881403, 1, 0, 0, 1, 1,
-0.3785357, -1.317298, -3.273949, 1, 0, 0, 1, 1,
-0.3782086, 1.145223, -0.5211537, 1, 0, 0, 1, 1,
-0.3771829, 0.5275807, -0.3116516, 0, 0, 0, 1, 1,
-0.3762413, -0.9405773, -3.783456, 0, 0, 0, 1, 1,
-0.3733324, 0.4327876, -1.098, 0, 0, 0, 1, 1,
-0.3668954, -2.029239, -4.109906, 0, 0, 0, 1, 1,
-0.3648398, 0.494579, 0.2698373, 0, 0, 0, 1, 1,
-0.3642816, 2.64263, -1.385073, 0, 0, 0, 1, 1,
-0.3632151, -0.066767, -2.330199, 0, 0, 0, 1, 1,
-0.3600396, -0.2539098, -2.209034, 1, 1, 1, 1, 1,
-0.3579734, 1.173818, 0.1536113, 1, 1, 1, 1, 1,
-0.3472025, 0.2914807, 0.4833238, 1, 1, 1, 1, 1,
-0.3434846, 0.4231379, -1.176385, 1, 1, 1, 1, 1,
-0.3408111, 0.9070052, -0.05051816, 1, 1, 1, 1, 1,
-0.3384726, 0.9776658, -0.8629906, 1, 1, 1, 1, 1,
-0.3379446, -1.259135, -4.637828, 1, 1, 1, 1, 1,
-0.3332332, 3.023284, -1.227093, 1, 1, 1, 1, 1,
-0.3282543, -0.1184087, -1.120211, 1, 1, 1, 1, 1,
-0.3275164, 0.5380777, 0.8697739, 1, 1, 1, 1, 1,
-0.3220925, 0.5367804, -0.7357189, 1, 1, 1, 1, 1,
-0.3188189, -0.626691, -1.830978, 1, 1, 1, 1, 1,
-0.3144913, -0.4997647, -2.994713, 1, 1, 1, 1, 1,
-0.3140963, -0.4107074, -1.295388, 1, 1, 1, 1, 1,
-0.3101433, -0.8416786, -2.745719, 1, 1, 1, 1, 1,
-0.3088824, 0.193894, -1.377248, 0, 0, 1, 1, 1,
-0.3056575, 0.6832294, 0.9500079, 1, 0, 0, 1, 1,
-0.3048534, 0.4842, -0.8751169, 1, 0, 0, 1, 1,
-0.3029231, 2.145363, -0.529753, 1, 0, 0, 1, 1,
-0.3001849, -0.4788636, -2.423274, 1, 0, 0, 1, 1,
-0.2894386, -1.482602, -2.177982, 1, 0, 0, 1, 1,
-0.2884372, 2.991663, -1.159359, 0, 0, 0, 1, 1,
-0.2867141, -0.8040606, -3.666704, 0, 0, 0, 1, 1,
-0.2815209, -0.357905, -3.139196, 0, 0, 0, 1, 1,
-0.2758085, -0.6215163, -2.928653, 0, 0, 0, 1, 1,
-0.275073, -1.096739, -3.86951, 0, 0, 0, 1, 1,
-0.2736011, 1.116052, -0.4647751, 0, 0, 0, 1, 1,
-0.273044, 1.6071, -1.715992, 0, 0, 0, 1, 1,
-0.265055, -0.7158473, -3.182663, 1, 1, 1, 1, 1,
-0.253842, 0.04181163, -0.7426364, 1, 1, 1, 1, 1,
-0.2456322, 2.672097, -0.5604724, 1, 1, 1, 1, 1,
-0.2454649, 0.4972983, 0.280445, 1, 1, 1, 1, 1,
-0.2394689, -0.218104, -3.446039, 1, 1, 1, 1, 1,
-0.237728, -1.094937, -1.82927, 1, 1, 1, 1, 1,
-0.2376467, -1.310974, -1.820009, 1, 1, 1, 1, 1,
-0.2348632, 1.025804, 0.2754556, 1, 1, 1, 1, 1,
-0.2295747, -0.09953763, -1.846069, 1, 1, 1, 1, 1,
-0.2291664, -0.1086893, -4.132947, 1, 1, 1, 1, 1,
-0.2243799, 0.6791625, -0.8158574, 1, 1, 1, 1, 1,
-0.2210682, -0.1132617, -2.45008, 1, 1, 1, 1, 1,
-0.2187623, -0.4542996, -2.003755, 1, 1, 1, 1, 1,
-0.2185622, 0.3681769, -0.2563369, 1, 1, 1, 1, 1,
-0.2172374, 0.7303967, -0.02463438, 1, 1, 1, 1, 1,
-0.2145026, -0.2687578, -2.859765, 0, 0, 1, 1, 1,
-0.2131336, -1.089088, -2.425962, 1, 0, 0, 1, 1,
-0.2115742, -0.2107791, -1.809885, 1, 0, 0, 1, 1,
-0.2105995, -0.2873788, -1.863118, 1, 0, 0, 1, 1,
-0.203678, 0.3275743, 1.23375, 1, 0, 0, 1, 1,
-0.2035379, -0.8094074, -3.356025, 1, 0, 0, 1, 1,
-0.2033005, -1.429384, -3.270467, 0, 0, 0, 1, 1,
-0.1961388, 0.2121754, -0.7993153, 0, 0, 0, 1, 1,
-0.1953781, 0.7178286, 0.6546764, 0, 0, 0, 1, 1,
-0.1944743, -0.06553581, -2.428572, 0, 0, 0, 1, 1,
-0.1931629, 0.1004737, -0.03553374, 0, 0, 0, 1, 1,
-0.1929245, -0.9584281, -1.933916, 0, 0, 0, 1, 1,
-0.1805478, -1.740245, -2.628658, 0, 0, 0, 1, 1,
-0.1772326, 1.053158, 1.388579, 1, 1, 1, 1, 1,
-0.1692905, 0.3750553, 0.08534864, 1, 1, 1, 1, 1,
-0.166731, -0.5123063, -1.29466, 1, 1, 1, 1, 1,
-0.1661794, 0.8376827, -0.8783068, 1, 1, 1, 1, 1,
-0.1652515, -0.4821077, -1.696955, 1, 1, 1, 1, 1,
-0.1607765, 0.7365087, -1.923198, 1, 1, 1, 1, 1,
-0.160017, 0.8517729, -1.109386, 1, 1, 1, 1, 1,
-0.1600113, -0.1252444, -3.489927, 1, 1, 1, 1, 1,
-0.1598047, 1.066088, -0.2264073, 1, 1, 1, 1, 1,
-0.1596359, 0.8842581, -0.1677075, 1, 1, 1, 1, 1,
-0.1567616, 0.2667864, 0.9516447, 1, 1, 1, 1, 1,
-0.1519952, 1.686588, 0.1446068, 1, 1, 1, 1, 1,
-0.1499824, -0.8621458, -2.328549, 1, 1, 1, 1, 1,
-0.1487914, -0.02492055, -2.114175, 1, 1, 1, 1, 1,
-0.1465835, 1.676769, -1.238484, 1, 1, 1, 1, 1,
-0.144606, -0.4268923, -2.037596, 0, 0, 1, 1, 1,
-0.1429014, -0.5354631, -2.707481, 1, 0, 0, 1, 1,
-0.1403769, 1.0524, 1.337847, 1, 0, 0, 1, 1,
-0.1394797, 0.8200759, 0.7439383, 1, 0, 0, 1, 1,
-0.1380727, 0.03634727, 0.7672927, 1, 0, 0, 1, 1,
-0.1371632, 0.2234, -2.532466, 1, 0, 0, 1, 1,
-0.1369567, 0.4340627, 0.9593445, 0, 0, 0, 1, 1,
-0.1319216, 0.9120911, -0.6384213, 0, 0, 0, 1, 1,
-0.1282358, 0.4789221, 0.1210807, 0, 0, 0, 1, 1,
-0.1207319, 1.233559, -1.058536, 0, 0, 0, 1, 1,
-0.1195391, -0.2709068, -2.713737, 0, 0, 0, 1, 1,
-0.1181318, 1.19622, -0.5528775, 0, 0, 0, 1, 1,
-0.1153623, -0.1112527, -1.235191, 0, 0, 0, 1, 1,
-0.1153243, 1.810323, -1.26549, 1, 1, 1, 1, 1,
-0.1133628, 1.310101, 1.227748, 1, 1, 1, 1, 1,
-0.1123357, -0.4503952, -3.655187, 1, 1, 1, 1, 1,
-0.1119511, 2.434479, -1.085865, 1, 1, 1, 1, 1,
-0.1084898, 1.662019, 0.5725899, 1, 1, 1, 1, 1,
-0.1078471, 1.348682, -2.031887, 1, 1, 1, 1, 1,
-0.1048194, -0.4088582, -1.238452, 1, 1, 1, 1, 1,
-0.09365806, 0.1641193, -0.991345, 1, 1, 1, 1, 1,
-0.09271079, 0.6985129, 0.7302395, 1, 1, 1, 1, 1,
-0.09058275, 0.3615261, -0.1130297, 1, 1, 1, 1, 1,
-0.08366685, 0.2931408, -0.5364257, 1, 1, 1, 1, 1,
-0.08089033, 0.3952647, 0.579259, 1, 1, 1, 1, 1,
-0.07765082, -0.2464089, -3.803949, 1, 1, 1, 1, 1,
-0.07705817, -0.7145597, -2.477925, 1, 1, 1, 1, 1,
-0.07678848, 0.02456078, -2.352744, 1, 1, 1, 1, 1,
-0.07297443, -0.769196, -4.477745, 0, 0, 1, 1, 1,
-0.06955123, -1.396728, -2.729973, 1, 0, 0, 1, 1,
-0.06867289, 0.08811624, -0.53092, 1, 0, 0, 1, 1,
-0.06854127, 0.2184245, -0.7062253, 1, 0, 0, 1, 1,
-0.06796831, -0.4373318, -4.290541, 1, 0, 0, 1, 1,
-0.06439469, 2.158508, 0.7649427, 1, 0, 0, 1, 1,
-0.06435852, -0.1725092, -2.962089, 0, 0, 0, 1, 1,
-0.06425601, 0.07727439, -0.5102027, 0, 0, 0, 1, 1,
-0.06357756, 0.4377704, 0.4545057, 0, 0, 0, 1, 1,
-0.062576, 0.08116255, -0.8527124, 0, 0, 0, 1, 1,
-0.05593213, 0.1713865, 2.047759, 0, 0, 0, 1, 1,
-0.0547561, 0.4668641, -0.406665, 0, 0, 0, 1, 1,
-0.05186329, -0.1622976, -2.522387, 0, 0, 0, 1, 1,
-0.05118215, -0.3161193, -0.6283201, 1, 1, 1, 1, 1,
-0.04470902, 0.9163545, -1.835954, 1, 1, 1, 1, 1,
-0.04248602, 0.5774955, -1.615109, 1, 1, 1, 1, 1,
-0.03774111, 1.694682, -0.6275407, 1, 1, 1, 1, 1,
-0.03506587, -0.9589379, -1.549219, 1, 1, 1, 1, 1,
-0.03485676, -0.9425589, -4.980248, 1, 1, 1, 1, 1,
-0.03297773, -0.4776375, -2.336304, 1, 1, 1, 1, 1,
-0.03219474, 0.9084342, 0.02532022, 1, 1, 1, 1, 1,
-0.03157471, 0.9514738, 0.8001386, 1, 1, 1, 1, 1,
-0.03040093, -1.319752, -2.961748, 1, 1, 1, 1, 1,
-0.02665595, 1.56406, 0.120217, 1, 1, 1, 1, 1,
-0.02283593, -1.322294, -2.371829, 1, 1, 1, 1, 1,
-0.02004728, 1.019909, 1.679323, 1, 1, 1, 1, 1,
-0.01372949, -1.963115, -2.084455, 1, 1, 1, 1, 1,
-0.01156245, -0.4842005, -4.89044, 1, 1, 1, 1, 1,
-0.01072756, 0.3758843, 0.9353846, 0, 0, 1, 1, 1,
-0.008936062, 1.314918, -0.09160797, 1, 0, 0, 1, 1,
-0.004088773, -1.528073, -3.106181, 1, 0, 0, 1, 1,
-0.003949408, -1.234759, -4.498133, 1, 0, 0, 1, 1,
-0.003909437, -0.5374691, -2.643064, 1, 0, 0, 1, 1,
-0.002031317, -1.478506, -3.999138, 1, 0, 0, 1, 1,
-0.0002289833, 1.464926, -0.6431707, 0, 0, 0, 1, 1,
0.0005241116, 0.5132713, 0.9548382, 0, 0, 0, 1, 1,
0.005356359, 0.2516337, -0.8365256, 0, 0, 0, 1, 1,
0.009208034, 0.4884023, -0.5905342, 0, 0, 0, 1, 1,
0.009932483, -1.929758, 4.727462, 0, 0, 0, 1, 1,
0.01002015, 0.03365324, 1.406755, 0, 0, 0, 1, 1,
0.01240458, -1.758108, 1.366334, 0, 0, 0, 1, 1,
0.01285416, 1.012954, 0.002794902, 1, 1, 1, 1, 1,
0.01400201, -0.2681721, 4.493005, 1, 1, 1, 1, 1,
0.01518769, 0.04520705, 1.020702, 1, 1, 1, 1, 1,
0.0202927, -0.546676, 2.94364, 1, 1, 1, 1, 1,
0.02218155, -0.3741216, 3.750101, 1, 1, 1, 1, 1,
0.02368552, -0.3584145, 2.560196, 1, 1, 1, 1, 1,
0.02414167, -1.071931, 2.907726, 1, 1, 1, 1, 1,
0.02631138, -2.045058, 1.871408, 1, 1, 1, 1, 1,
0.02720478, 1.007039, 0.3608891, 1, 1, 1, 1, 1,
0.02829018, 0.3553009, -0.3733507, 1, 1, 1, 1, 1,
0.0302718, -0.05360032, 3.976794, 1, 1, 1, 1, 1,
0.03206882, 1.85498, 0.354219, 1, 1, 1, 1, 1,
0.03246225, 0.5343387, 0.4867764, 1, 1, 1, 1, 1,
0.03251768, -0.05141528, 3.360727, 1, 1, 1, 1, 1,
0.03439461, -0.366533, 4.038283, 1, 1, 1, 1, 1,
0.03791922, 0.6946484, 0.9432941, 0, 0, 1, 1, 1,
0.04287475, -1.61607, 4.20417, 1, 0, 0, 1, 1,
0.04848182, 0.5680233, -0.603657, 1, 0, 0, 1, 1,
0.04857578, -0.7264832, 2.5501, 1, 0, 0, 1, 1,
0.04966794, 0.1123297, -1.451397, 1, 0, 0, 1, 1,
0.05387549, 0.02728086, 0.7365538, 1, 0, 0, 1, 1,
0.06020774, -0.209715, 2.509322, 0, 0, 0, 1, 1,
0.06192861, -0.2461148, 3.000918, 0, 0, 0, 1, 1,
0.06337774, -0.8667766, 2.879632, 0, 0, 0, 1, 1,
0.06485363, -0.2646984, 2.957285, 0, 0, 0, 1, 1,
0.06620345, -1.594385, 2.335983, 0, 0, 0, 1, 1,
0.07297663, -1.828511, 4.231905, 0, 0, 0, 1, 1,
0.07494953, -0.8852437, 2.04224, 0, 0, 0, 1, 1,
0.07496746, -0.1952614, 2.617655, 1, 1, 1, 1, 1,
0.07864831, -0.4473557, 1.875728, 1, 1, 1, 1, 1,
0.07969216, -0.778104, 3.589865, 1, 1, 1, 1, 1,
0.08323085, 0.9963731, -0.6494603, 1, 1, 1, 1, 1,
0.08739159, -0.5493915, 3.681462, 1, 1, 1, 1, 1,
0.09198876, -0.1763832, 2.990519, 1, 1, 1, 1, 1,
0.09297139, -1.393517, 2.405725, 1, 1, 1, 1, 1,
0.09325554, -0.1389476, 1.821769, 1, 1, 1, 1, 1,
0.09509117, 0.3891065, 0.7826242, 1, 1, 1, 1, 1,
0.1076629, 0.9310651, -0.04757142, 1, 1, 1, 1, 1,
0.1077524, 2.054374, 0.09339435, 1, 1, 1, 1, 1,
0.1090258, 0.8760316, 1.621606, 1, 1, 1, 1, 1,
0.1140435, 0.8839837, -0.5661414, 1, 1, 1, 1, 1,
0.1141341, 0.2992989, -0.5634376, 1, 1, 1, 1, 1,
0.117645, 1.569796, 0.6733232, 1, 1, 1, 1, 1,
0.1191502, -1.04139, 1.910739, 0, 0, 1, 1, 1,
0.1194911, -0.3756597, 2.122845, 1, 0, 0, 1, 1,
0.1203037, -1.676643, 3.179855, 1, 0, 0, 1, 1,
0.1244179, 1.646985, 1.891629, 1, 0, 0, 1, 1,
0.1249657, 0.8147709, -0.5919065, 1, 0, 0, 1, 1,
0.1310036, 0.1410833, 0.06389982, 1, 0, 0, 1, 1,
0.1325296, -0.3150481, 0.9844518, 0, 0, 0, 1, 1,
0.1327936, 0.5875654, 1.400905, 0, 0, 0, 1, 1,
0.1332373, 1.301217, -0.1555827, 0, 0, 0, 1, 1,
0.1347494, -0.7407442, 2.381759, 0, 0, 0, 1, 1,
0.1347759, -2.849197, 4.995586, 0, 0, 0, 1, 1,
0.1380248, 0.7780929, 2.3899, 0, 0, 0, 1, 1,
0.1382014, -1.27127, 2.584015, 0, 0, 0, 1, 1,
0.1388334, 0.9501669, 0.01898296, 1, 1, 1, 1, 1,
0.1409495, -0.02128586, 1.894841, 1, 1, 1, 1, 1,
0.1442036, 1.039885, 2.153752, 1, 1, 1, 1, 1,
0.1477432, 0.5060726, -0.9949723, 1, 1, 1, 1, 1,
0.1554821, -0.3223752, 3.62362, 1, 1, 1, 1, 1,
0.1566156, -0.765203, 5.527275, 1, 1, 1, 1, 1,
0.1653621, -2.145561, 1.987498, 1, 1, 1, 1, 1,
0.1709139, 1.042671, -0.4111084, 1, 1, 1, 1, 1,
0.1719652, 0.5919029, 0.6822845, 1, 1, 1, 1, 1,
0.174346, -1.220446, 4.125124, 1, 1, 1, 1, 1,
0.1746802, 0.9633749, 1.940883, 1, 1, 1, 1, 1,
0.174809, -1.086859, 2.366364, 1, 1, 1, 1, 1,
0.1777116, 0.002765829, 0.7916412, 1, 1, 1, 1, 1,
0.1876635, 0.9631534, -0.1121408, 1, 1, 1, 1, 1,
0.1944305, 0.4182324, -1.157017, 1, 1, 1, 1, 1,
0.1972455, -1.273027, 3.057076, 0, 0, 1, 1, 1,
0.201765, -0.7817144, 3.381491, 1, 0, 0, 1, 1,
0.2034105, 0.2498009, 0.8509867, 1, 0, 0, 1, 1,
0.2102249, -2.02201, 2.607413, 1, 0, 0, 1, 1,
0.2123419, 0.1175695, -0.7484093, 1, 0, 0, 1, 1,
0.2173214, 1.023814, 0.1954549, 1, 0, 0, 1, 1,
0.2205107, 0.3135935, 0.564165, 0, 0, 0, 1, 1,
0.2236191, 1.200973, 0.08639362, 0, 0, 0, 1, 1,
0.2236989, -0.1008783, 2.04297, 0, 0, 0, 1, 1,
0.23204, 0.2772226, 1.241227, 0, 0, 0, 1, 1,
0.233589, 1.009957, 0.2258682, 0, 0, 0, 1, 1,
0.2339557, 0.6665248, 0.2973323, 0, 0, 0, 1, 1,
0.235948, -2.232552, 3.557904, 0, 0, 0, 1, 1,
0.2362034, 0.6102669, -0.9573354, 1, 1, 1, 1, 1,
0.2372202, 0.8123943, -0.06814981, 1, 1, 1, 1, 1,
0.2383466, 1.005339, 1.874857, 1, 1, 1, 1, 1,
0.2385446, -1.627456, 3.84091, 1, 1, 1, 1, 1,
0.2405045, -0.1812397, 2.612634, 1, 1, 1, 1, 1,
0.2426467, 1.035894, 0.401591, 1, 1, 1, 1, 1,
0.2434949, -0.3722979, 2.072704, 1, 1, 1, 1, 1,
0.2446101, 0.3915644, 1.460388, 1, 1, 1, 1, 1,
0.2451617, -0.03790117, 2.076562, 1, 1, 1, 1, 1,
0.2459916, -0.5340555, 2.48261, 1, 1, 1, 1, 1,
0.2501386, -0.1376845, 4.151002, 1, 1, 1, 1, 1,
0.2506065, -0.5183365, 3.034961, 1, 1, 1, 1, 1,
0.251938, -1.030564, 3.664088, 1, 1, 1, 1, 1,
0.2531385, -1.442009, 3.562877, 1, 1, 1, 1, 1,
0.2559353, 0.0299073, 2.103994, 1, 1, 1, 1, 1,
0.2576163, 0.1937936, 0.1258038, 0, 0, 1, 1, 1,
0.2663765, -0.80208, 3.120267, 1, 0, 0, 1, 1,
0.2669404, -0.7291853, 3.695867, 1, 0, 0, 1, 1,
0.2684772, -0.3711812, 3.573323, 1, 0, 0, 1, 1,
0.27142, 0.7608455, 0.9937145, 1, 0, 0, 1, 1,
0.273652, -0.8080106, 4.044682, 1, 0, 0, 1, 1,
0.273801, 1.324286, 1.414111, 0, 0, 0, 1, 1,
0.2759208, -0.600764, 2.480482, 0, 0, 0, 1, 1,
0.2788149, -0.7270476, 2.679853, 0, 0, 0, 1, 1,
0.2793415, -0.6835615, 1.265455, 0, 0, 0, 1, 1,
0.2806248, 1.861454, -0.8266546, 0, 0, 0, 1, 1,
0.281698, 1.072977, 0.8515337, 0, 0, 0, 1, 1,
0.2829725, 1.301316, 2.290031, 0, 0, 0, 1, 1,
0.28901, 0.6307766, 2.373811, 1, 1, 1, 1, 1,
0.2980932, -1.262532, 5.567759, 1, 1, 1, 1, 1,
0.2982815, -0.8137951, 3.331319, 1, 1, 1, 1, 1,
0.3021364, -1.445232, 3.05442, 1, 1, 1, 1, 1,
0.3052388, 0.9223348, 1.439654, 1, 1, 1, 1, 1,
0.3060912, -0.728573, 4.014515, 1, 1, 1, 1, 1,
0.3074649, -1.13628, 4.547102, 1, 1, 1, 1, 1,
0.3076879, 1.283766, -1.330274, 1, 1, 1, 1, 1,
0.3115128, 1.058077, 0.08823692, 1, 1, 1, 1, 1,
0.3150456, 1.018197, -0.7115057, 1, 1, 1, 1, 1,
0.3182966, -1.165476, 2.612594, 1, 1, 1, 1, 1,
0.318676, 0.3995444, -1.289281, 1, 1, 1, 1, 1,
0.3202651, 0.682101, 0.8430164, 1, 1, 1, 1, 1,
0.3219919, -0.6746169, 3.257001, 1, 1, 1, 1, 1,
0.323797, 0.2365701, 1.931092, 1, 1, 1, 1, 1,
0.326381, -1.164139, 0.7251818, 0, 0, 1, 1, 1,
0.3286943, -0.5886188, 4.063836, 1, 0, 0, 1, 1,
0.3290424, -1.143777, 3.566423, 1, 0, 0, 1, 1,
0.3302574, 0.9140782, -0.3025596, 1, 0, 0, 1, 1,
0.3310912, -0.4529411, 4.942255, 1, 0, 0, 1, 1,
0.3321951, -0.3898009, 2.835565, 1, 0, 0, 1, 1,
0.3330476, 0.2040149, -0.08702805, 0, 0, 0, 1, 1,
0.3341546, 0.3158915, 1.287342, 0, 0, 0, 1, 1,
0.3513264, -1.618975, 3.153401, 0, 0, 0, 1, 1,
0.3522035, -0.01309642, 2.234975, 0, 0, 0, 1, 1,
0.3558121, -1.576887, 3.15095, 0, 0, 0, 1, 1,
0.3558678, -0.1911348, 0.641324, 0, 0, 0, 1, 1,
0.3572307, -0.3469961, 0.2902895, 0, 0, 0, 1, 1,
0.3583176, 0.7549647, 2.380022, 1, 1, 1, 1, 1,
0.3652597, -0.08864099, 1.18532, 1, 1, 1, 1, 1,
0.3679434, -1.247302, 1.578616, 1, 1, 1, 1, 1,
0.3698296, 2.406862, -0.5145782, 1, 1, 1, 1, 1,
0.3743894, 1.231249, -0.5737004, 1, 1, 1, 1, 1,
0.3790157, 0.01161519, 1.726372, 1, 1, 1, 1, 1,
0.3866044, -0.4329363, 1.740374, 1, 1, 1, 1, 1,
0.3871855, 0.6845819, -0.2610589, 1, 1, 1, 1, 1,
0.3964871, -0.7689407, 1.869822, 1, 1, 1, 1, 1,
0.3993865, -0.7632787, 3.536045, 1, 1, 1, 1, 1,
0.4007669, -2.043681, 2.984875, 1, 1, 1, 1, 1,
0.4071827, -1.959309, 2.360992, 1, 1, 1, 1, 1,
0.4094692, -1.168871, 2.553237, 1, 1, 1, 1, 1,
0.4130516, 0.9262272, -0.4471287, 1, 1, 1, 1, 1,
0.4147376, -0.7198842, 2.028451, 1, 1, 1, 1, 1,
0.4149956, -0.6329688, 2.822959, 0, 0, 1, 1, 1,
0.4154219, -0.5650367, 2.696476, 1, 0, 0, 1, 1,
0.4217121, 0.8271192, 2.591693, 1, 0, 0, 1, 1,
0.4253596, 1.428145, -0.1742377, 1, 0, 0, 1, 1,
0.4275478, -1.599312, 4.315413, 1, 0, 0, 1, 1,
0.4334348, 1.106801, -0.00300557, 1, 0, 0, 1, 1,
0.4408273, -0.6715506, 1.89, 0, 0, 0, 1, 1,
0.4410213, -0.4381123, 3.306885, 0, 0, 0, 1, 1,
0.442932, 0.5972353, -1.097059, 0, 0, 0, 1, 1,
0.4452214, 0.08822808, 1.373015, 0, 0, 0, 1, 1,
0.4477056, 1.291261, 1.858699, 0, 0, 0, 1, 1,
0.4478898, -0.5744159, 2.302554, 0, 0, 0, 1, 1,
0.4525328, 1.392854, -0.4227708, 0, 0, 0, 1, 1,
0.4559549, -0.177886, 3.185406, 1, 1, 1, 1, 1,
0.4590188, 0.7647585, -0.3085641, 1, 1, 1, 1, 1,
0.4592036, -0.611453, 2.549152, 1, 1, 1, 1, 1,
0.4617651, -0.9912691, 4.074844, 1, 1, 1, 1, 1,
0.4650919, -0.4570861, 2.698909, 1, 1, 1, 1, 1,
0.47053, 1.036488, 1.499808, 1, 1, 1, 1, 1,
0.4707686, 1.522034, 0.3645792, 1, 1, 1, 1, 1,
0.4749523, -1.321029, 2.015965, 1, 1, 1, 1, 1,
0.4758262, 0.1805383, 0.5574023, 1, 1, 1, 1, 1,
0.4786854, 1.120436, -0.5705369, 1, 1, 1, 1, 1,
0.4809514, 0.4039007, 0.7893529, 1, 1, 1, 1, 1,
0.4821926, 2.399157, 0.9757121, 1, 1, 1, 1, 1,
0.4843596, 0.9473298, -0.502033, 1, 1, 1, 1, 1,
0.4862688, -0.2105563, 1.585643, 1, 1, 1, 1, 1,
0.4877489, 0.3522395, 0.6522031, 1, 1, 1, 1, 1,
0.4975035, -1.053605, 2.955489, 0, 0, 1, 1, 1,
0.498563, -0.2183346, 0.9494876, 1, 0, 0, 1, 1,
0.499474, 1.782321, -0.6735588, 1, 0, 0, 1, 1,
0.5041544, 0.9725177, 0.4199971, 1, 0, 0, 1, 1,
0.5048441, 0.2306067, 2.45535, 1, 0, 0, 1, 1,
0.5098099, -1.527062, 2.11981, 1, 0, 0, 1, 1,
0.5111663, 0.7417052, 1.683315, 0, 0, 0, 1, 1,
0.5135531, 2.07376, -0.7326888, 0, 0, 0, 1, 1,
0.5183884, -0.0734625, 0.7816925, 0, 0, 0, 1, 1,
0.5184742, -0.6081573, 2.057806, 0, 0, 0, 1, 1,
0.5216766, -1.831136, 3.623858, 0, 0, 0, 1, 1,
0.5224681, -1.143149, 4.223862, 0, 0, 0, 1, 1,
0.5311437, 1.8578, 1.932447, 0, 0, 0, 1, 1,
0.5364823, -2.063505, 1.709019, 1, 1, 1, 1, 1,
0.5391807, -0.03455305, 1.326705, 1, 1, 1, 1, 1,
0.5405535, -0.9661302, 3.517781, 1, 1, 1, 1, 1,
0.5512571, -0.8838511, 1.728077, 1, 1, 1, 1, 1,
0.5560965, -0.1409424, 0.9560077, 1, 1, 1, 1, 1,
0.5572148, -0.9873973, 1.033041, 1, 1, 1, 1, 1,
0.5625542, 0.221021, 1.730322, 1, 1, 1, 1, 1,
0.5639243, -2.662574, 3.949621, 1, 1, 1, 1, 1,
0.5650871, -0.3646566, 1.221634, 1, 1, 1, 1, 1,
0.5659043, 0.5585235, 1.11672, 1, 1, 1, 1, 1,
0.5725427, 1.480574, -0.02440133, 1, 1, 1, 1, 1,
0.5730437, -0.02728183, 1.396972, 1, 1, 1, 1, 1,
0.5767136, -0.2926503, 2.763956, 1, 1, 1, 1, 1,
0.5768581, -1.731524, 2.5958, 1, 1, 1, 1, 1,
0.5772985, 0.456463, 0.6378584, 1, 1, 1, 1, 1,
0.5804525, 1.245373, 0.839731, 0, 0, 1, 1, 1,
0.584051, 0.1570462, 2.92306, 1, 0, 0, 1, 1,
0.5844927, -0.7500856, 1.527954, 1, 0, 0, 1, 1,
0.5955172, 0.7365158, -0.2567373, 1, 0, 0, 1, 1,
0.5969455, -1.161238, 4.280207, 1, 0, 0, 1, 1,
0.5986534, 0.2168047, 1.361764, 1, 0, 0, 1, 1,
0.6026093, 0.1767464, 0.9058109, 0, 0, 0, 1, 1,
0.6053624, -1.498507, 4.506279, 0, 0, 0, 1, 1,
0.6070977, -1.489033, 2.060114, 0, 0, 0, 1, 1,
0.6128929, -0.6837159, 2.856491, 0, 0, 0, 1, 1,
0.615335, 1.45324, 1.26681, 0, 0, 0, 1, 1,
0.6159905, -0.08329797, 2.359351, 0, 0, 0, 1, 1,
0.6175246, -0.7367758, 2.096356, 0, 0, 0, 1, 1,
0.6175266, 1.105597, 0.1542775, 1, 1, 1, 1, 1,
0.6217023, 0.6797113, 1.381135, 1, 1, 1, 1, 1,
0.6226906, 0.2025997, 1.039719, 1, 1, 1, 1, 1,
0.6248314, 2.654854, 1.816535, 1, 1, 1, 1, 1,
0.6264474, 0.564932, 2.492172, 1, 1, 1, 1, 1,
0.6303193, 0.06283721, 0.922558, 1, 1, 1, 1, 1,
0.6368611, 1.620185, -0.1832707, 1, 1, 1, 1, 1,
0.6489772, -1.341697, 3.096469, 1, 1, 1, 1, 1,
0.6514294, 0.8966016, 1.859353, 1, 1, 1, 1, 1,
0.6533756, 0.4634109, 1.578857, 1, 1, 1, 1, 1,
0.654027, -0.2639814, 2.353776, 1, 1, 1, 1, 1,
0.6558753, -0.7542829, 1.230423, 1, 1, 1, 1, 1,
0.6559697, 0.8119307, -0.1047855, 1, 1, 1, 1, 1,
0.6580873, 0.6920982, 1.34859, 1, 1, 1, 1, 1,
0.6629487, 0.9684904, 0.2148743, 1, 1, 1, 1, 1,
0.6640855, -0.05626684, 2.799263, 0, 0, 1, 1, 1,
0.6641036, -0.2573884, 1.511428, 1, 0, 0, 1, 1,
0.6681982, 0.1990181, 0.1861208, 1, 0, 0, 1, 1,
0.6689417, 0.08911829, -1.574469, 1, 0, 0, 1, 1,
0.6721822, -0.7894307, 3.146279, 1, 0, 0, 1, 1,
0.6799247, -0.01152526, -0.2945999, 1, 0, 0, 1, 1,
0.6832861, -1.461524, 4.086411, 0, 0, 0, 1, 1,
0.6835545, 0.5138051, 1.68421, 0, 0, 0, 1, 1,
0.683699, -1.803103, 1.960576, 0, 0, 0, 1, 1,
0.6865019, 0.6837258, 0.8918449, 0, 0, 0, 1, 1,
0.6869171, 3.205389, 1.081532, 0, 0, 0, 1, 1,
0.6902219, 0.07248276, 1.66297, 0, 0, 0, 1, 1,
0.6904649, 0.561388, 0.948115, 0, 0, 0, 1, 1,
0.6951463, -0.8961104, 1.926496, 1, 1, 1, 1, 1,
0.6957633, 1.027952, -0.2553561, 1, 1, 1, 1, 1,
0.6978925, -0.3394228, 1.999506, 1, 1, 1, 1, 1,
0.698936, -0.8570868, 1.468749, 1, 1, 1, 1, 1,
0.7030427, 0.6640077, 2.818733, 1, 1, 1, 1, 1,
0.7082405, -0.6954109, 1.431245, 1, 1, 1, 1, 1,
0.7091935, 1.207551, 1.371888, 1, 1, 1, 1, 1,
0.7109306, -1.586926, 2.789844, 1, 1, 1, 1, 1,
0.7134675, -1.609643, 2.796195, 1, 1, 1, 1, 1,
0.7145217, -1.594694, 3.826526, 1, 1, 1, 1, 1,
0.7159127, -0.4686281, 2.641238, 1, 1, 1, 1, 1,
0.719079, -1.368642, 3.617617, 1, 1, 1, 1, 1,
0.7201445, 1.283571, 0.7915877, 1, 1, 1, 1, 1,
0.7222696, -0.9336341, 3.233025, 1, 1, 1, 1, 1,
0.7224036, 1.233506, -3.037294, 1, 1, 1, 1, 1,
0.7230685, 1.265323, 2.75074, 0, 0, 1, 1, 1,
0.7238191, 0.009574216, 1.490644, 1, 0, 0, 1, 1,
0.7243472, 0.6170154, 0.970362, 1, 0, 0, 1, 1,
0.7263143, 1.042472, 1.676323, 1, 0, 0, 1, 1,
0.730382, 0.524741, -1.309093, 1, 0, 0, 1, 1,
0.7335972, 0.4779665, 1.303297, 1, 0, 0, 1, 1,
0.74428, 0.5153469, 1.293737, 0, 0, 0, 1, 1,
0.7451177, 0.7329755, 1.047323, 0, 0, 0, 1, 1,
0.7459893, 0.3246753, 0.9275948, 0, 0, 0, 1, 1,
0.7492501, -0.0003977341, 1.591827, 0, 0, 0, 1, 1,
0.7503254, 0.9331508, 0.01602309, 0, 0, 0, 1, 1,
0.7510297, -1.758383, 4.094697, 0, 0, 0, 1, 1,
0.7511857, -0.2237826, 1.857994, 0, 0, 0, 1, 1,
0.7514497, -0.1455777, 1.825245, 1, 1, 1, 1, 1,
0.7550764, -0.1319087, 2.250283, 1, 1, 1, 1, 1,
0.7599257, 0.2722488, 2.485549, 1, 1, 1, 1, 1,
0.7628636, -0.03790422, 3.237996, 1, 1, 1, 1, 1,
0.7628798, -1.546895, 1.995546, 1, 1, 1, 1, 1,
0.7632096, -0.2535292, 3.941899, 1, 1, 1, 1, 1,
0.7660443, -0.3618449, 0.3935249, 1, 1, 1, 1, 1,
0.7666706, 0.0253531, 0.9286771, 1, 1, 1, 1, 1,
0.7678858, 0.06850744, 1.356988, 1, 1, 1, 1, 1,
0.7782437, -0.5378959, 0.6382248, 1, 1, 1, 1, 1,
0.7857515, 0.387998, 1.230192, 1, 1, 1, 1, 1,
0.7861959, -0.3666447, 1.749796, 1, 1, 1, 1, 1,
0.7862207, 0.1926146, 2.789059, 1, 1, 1, 1, 1,
0.7891125, -0.990287, 1.249049, 1, 1, 1, 1, 1,
0.7912814, 1.39856, 0.3725277, 1, 1, 1, 1, 1,
0.793181, -0.2632377, 1.626448, 0, 0, 1, 1, 1,
0.7935057, 1.02341, 1.689132, 1, 0, 0, 1, 1,
0.7939786, 0.1423839, 1.143002, 1, 0, 0, 1, 1,
0.797915, 0.1500989, 2.048229, 1, 0, 0, 1, 1,
0.8016009, 0.08313366, 3.424814, 1, 0, 0, 1, 1,
0.8020282, 0.2612163, 1.365672, 1, 0, 0, 1, 1,
0.8093787, -1.89563, 2.924228, 0, 0, 0, 1, 1,
0.8099951, -0.4499748, 0.9465214, 0, 0, 0, 1, 1,
0.8140032, 0.286411, -0.7534716, 0, 0, 0, 1, 1,
0.8146315, 1.350599, 0.4518356, 0, 0, 0, 1, 1,
0.8160229, 0.1168652, 2.991856, 0, 0, 0, 1, 1,
0.8162435, -0.6086642, 1.491245, 0, 0, 0, 1, 1,
0.819819, 0.562256, 1.210356, 0, 0, 0, 1, 1,
0.82679, 0.4134229, 1.39998, 1, 1, 1, 1, 1,
0.834314, -1.490118, 2.136937, 1, 1, 1, 1, 1,
0.8430461, -0.5574732, 1.234454, 1, 1, 1, 1, 1,
0.8459024, -0.248084, 3.47709, 1, 1, 1, 1, 1,
0.8478575, 2.367873, -0.9773738, 1, 1, 1, 1, 1,
0.8493195, -0.8663231, 1.629428, 1, 1, 1, 1, 1,
0.8538632, -1.460916, 4.670797, 1, 1, 1, 1, 1,
0.85598, 0.5008567, -0.4163764, 1, 1, 1, 1, 1,
0.8634164, 0.2972117, 1.148716, 1, 1, 1, 1, 1,
0.8647719, -0.4311105, 1.664212, 1, 1, 1, 1, 1,
0.8659936, -1.774359, 1.596891, 1, 1, 1, 1, 1,
0.8664684, -1.583255, 3.508329, 1, 1, 1, 1, 1,
0.8666023, 0.2230159, 1.803557, 1, 1, 1, 1, 1,
0.8675465, 0.2349042, -0.6176571, 1, 1, 1, 1, 1,
0.8700697, -0.7528845, 2.076918, 1, 1, 1, 1, 1,
0.8716545, -1.057971, 2.688603, 0, 0, 1, 1, 1,
0.8726723, -0.4236392, 2.569641, 1, 0, 0, 1, 1,
0.8790746, -1.239927, 3.900486, 1, 0, 0, 1, 1,
0.8818094, 0.6160881, 0.7569456, 1, 0, 0, 1, 1,
0.8902603, -0.8996974, 2.68247, 1, 0, 0, 1, 1,
0.8903888, -0.954312, 1.600831, 1, 0, 0, 1, 1,
0.8914666, 0.2754804, 0.7741244, 0, 0, 0, 1, 1,
0.8942211, 0.3286783, 2.37327, 0, 0, 0, 1, 1,
0.9024308, -1.574715, 2.707452, 0, 0, 0, 1, 1,
0.9043512, -0.5312435, 1.277771, 0, 0, 0, 1, 1,
0.906444, -1.312711, 2.626072, 0, 0, 0, 1, 1,
0.9075683, 0.5545217, 1.127119, 0, 0, 0, 1, 1,
0.9123105, -1.593141, 1.422042, 0, 0, 0, 1, 1,
0.9128135, -1.28725, 3.129361, 1, 1, 1, 1, 1,
0.9130898, 0.7843904, 1.21787, 1, 1, 1, 1, 1,
0.9225156, -0.6914073, 1.859379, 1, 1, 1, 1, 1,
0.9313527, 0.1903152, 1.950789, 1, 1, 1, 1, 1,
0.9425333, 1.197552, 0.9039152, 1, 1, 1, 1, 1,
0.9503448, -2.361753, 3.106928, 1, 1, 1, 1, 1,
0.9512109, 1.466187, -1.628979, 1, 1, 1, 1, 1,
0.9524583, 1.090727, -1.532446, 1, 1, 1, 1, 1,
0.9529645, -0.1379264, 1.651834, 1, 1, 1, 1, 1,
0.9602348, -0.1376375, 1.602542, 1, 1, 1, 1, 1,
0.9605048, 0.8553104, 3.259157, 1, 1, 1, 1, 1,
0.9607629, 1.499921, 1.862595, 1, 1, 1, 1, 1,
0.9702985, 1.540505, 1.059865, 1, 1, 1, 1, 1,
0.9712721, -0.259102, 1.420084, 1, 1, 1, 1, 1,
0.9730922, -0.4445505, 3.233515, 1, 1, 1, 1, 1,
0.9733515, 0.8009371, 0.9541677, 0, 0, 1, 1, 1,
0.9737506, -0.4686328, 0.7177507, 1, 0, 0, 1, 1,
0.9756464, -0.1766067, 1.881493, 1, 0, 0, 1, 1,
0.9786116, 0.7645404, 0.9421449, 1, 0, 0, 1, 1,
0.9823853, -0.09533711, 0.9280341, 1, 0, 0, 1, 1,
0.9856767, -0.05536454, 2.124852, 1, 0, 0, 1, 1,
0.9878255, 0.6037607, 2.770692, 0, 0, 0, 1, 1,
0.9992639, 0.05106176, 0.2409069, 0, 0, 0, 1, 1,
1.000977, 1.172879, 0.4263842, 0, 0, 0, 1, 1,
1.004468, 0.4311953, 2.638034, 0, 0, 0, 1, 1,
1.009539, 0.03118919, 1.655999, 0, 0, 0, 1, 1,
1.011304, -0.5318602, 2.341697, 0, 0, 0, 1, 1,
1.013984, 0.4332322, 2.882116, 0, 0, 0, 1, 1,
1.015251, -1.373119, 1.751601, 1, 1, 1, 1, 1,
1.019487, 0.8778575, 0.8065401, 1, 1, 1, 1, 1,
1.025395, -0.9983423, 1.608828, 1, 1, 1, 1, 1,
1.026694, -0.4908937, 2.325399, 1, 1, 1, 1, 1,
1.033236, 0.8098027, 0.3828733, 1, 1, 1, 1, 1,
1.034712, 2.304195, -0.06922507, 1, 1, 1, 1, 1,
1.03604, -0.3489211, 0.8730428, 1, 1, 1, 1, 1,
1.040802, 0.1493213, 0.6054962, 1, 1, 1, 1, 1,
1.048995, -0.5195121, 2.548524, 1, 1, 1, 1, 1,
1.064502, 0.6102548, 2.831581, 1, 1, 1, 1, 1,
1.064877, -0.5925757, 1.902388, 1, 1, 1, 1, 1,
1.0759, 2.065923, 0.2107698, 1, 1, 1, 1, 1,
1.089555, 1.159127, -0.8102747, 1, 1, 1, 1, 1,
1.091842, 0.04775907, 0.4080761, 1, 1, 1, 1, 1,
1.092233, -0.9154815, 1.184289, 1, 1, 1, 1, 1,
1.092447, -1.804995, 2.490556, 0, 0, 1, 1, 1,
1.094223, -0.4221342, 1.8668, 1, 0, 0, 1, 1,
1.108911, -0.5988806, 2.216648, 1, 0, 0, 1, 1,
1.11388, 0.1083491, 1.02861, 1, 0, 0, 1, 1,
1.120069, 1.013499, -0.2195161, 1, 0, 0, 1, 1,
1.129895, 0.9096903, 1.257974, 1, 0, 0, 1, 1,
1.152669, 1.934428, 1.807735, 0, 0, 0, 1, 1,
1.153458, 0.4353002, 1.566818, 0, 0, 0, 1, 1,
1.157688, 1.243963, 2.282841, 0, 0, 0, 1, 1,
1.163774, 0.4693782, 0.7302658, 0, 0, 0, 1, 1,
1.167967, 1.290317, -0.4483346, 0, 0, 0, 1, 1,
1.170052, 0.9529558, 0.4939163, 0, 0, 0, 1, 1,
1.173387, -0.2790254, 2.935476, 0, 0, 0, 1, 1,
1.178382, 1.186044, 1.576117, 1, 1, 1, 1, 1,
1.183597, 0.9317081, 2.7611, 1, 1, 1, 1, 1,
1.188395, -1.44363, 2.282605, 1, 1, 1, 1, 1,
1.193211, -0.7197944, 0.8444047, 1, 1, 1, 1, 1,
1.203449, -0.3277887, 2.001904, 1, 1, 1, 1, 1,
1.205738, 1.049962, 2.278548, 1, 1, 1, 1, 1,
1.207615, -1.256795, 1.926742, 1, 1, 1, 1, 1,
1.208483, 1.176364, -0.8936862, 1, 1, 1, 1, 1,
1.2124, 0.05504177, 2.128962, 1, 1, 1, 1, 1,
1.220725, -0.7918451, 2.043715, 1, 1, 1, 1, 1,
1.231764, 0.4417477, 1.16096, 1, 1, 1, 1, 1,
1.235724, -0.2631791, 2.146232, 1, 1, 1, 1, 1,
1.240089, 0.8852465, 2.2653, 1, 1, 1, 1, 1,
1.252449, -1.589021, 1.637399, 1, 1, 1, 1, 1,
1.258242, -0.04680802, 0.197542, 1, 1, 1, 1, 1,
1.258707, -0.06247037, 2.487411, 0, 0, 1, 1, 1,
1.258762, -0.1002085, 1.489786, 1, 0, 0, 1, 1,
1.265661, 1.77445, 1.94031, 1, 0, 0, 1, 1,
1.274778, -1.258694, 2.216756, 1, 0, 0, 1, 1,
1.276395, 0.359468, 0.9310977, 1, 0, 0, 1, 1,
1.276624, -0.2603599, 1.955526, 1, 0, 0, 1, 1,
1.282436, 1.017507, 2.184763, 0, 0, 0, 1, 1,
1.298999, -1.529012, 1.63102, 0, 0, 0, 1, 1,
1.299553, -0.6473043, 1.486843, 0, 0, 0, 1, 1,
1.299722, -0.9990659, 2.254094, 0, 0, 0, 1, 1,
1.302042, 0.02851919, 2.958522, 0, 0, 0, 1, 1,
1.302061, 1.41238, -0.1656163, 0, 0, 0, 1, 1,
1.325659, -1.219802, 1.898264, 0, 0, 0, 1, 1,
1.33467, -0.1030222, 0.8927164, 1, 1, 1, 1, 1,
1.337698, 0.5361864, 1.461202, 1, 1, 1, 1, 1,
1.355901, -1.317886, 0.9813436, 1, 1, 1, 1, 1,
1.359532, 0.8992256, -0.5156543, 1, 1, 1, 1, 1,
1.374142, 0.8897308, 1.251388, 1, 1, 1, 1, 1,
1.374814, 1.433036, 0.8639254, 1, 1, 1, 1, 1,
1.382596, 1.37087, 1.477281, 1, 1, 1, 1, 1,
1.386706, -0.7957203, 0.3701918, 1, 1, 1, 1, 1,
1.38717, -0.9391423, -0.0265363, 1, 1, 1, 1, 1,
1.388147, -0.8423525, 2.828087, 1, 1, 1, 1, 1,
1.39633, -1.222695, 2.428705, 1, 1, 1, 1, 1,
1.401633, -1.4297, 2.88728, 1, 1, 1, 1, 1,
1.411399, 0.4167291, 1.151989, 1, 1, 1, 1, 1,
1.412215, 0.9307579, 1.475367, 1, 1, 1, 1, 1,
1.416842, -0.9762949, 2.167753, 1, 1, 1, 1, 1,
1.417916, 1.125147, 0.7998831, 0, 0, 1, 1, 1,
1.429189, 0.3333646, 2.269064, 1, 0, 0, 1, 1,
1.441089, 0.1308661, 1.137877, 1, 0, 0, 1, 1,
1.441807, 0.2290705, 2.014127, 1, 0, 0, 1, 1,
1.451011, -0.4352211, 2.212604, 1, 0, 0, 1, 1,
1.455167, 0.1492051, 1.64115, 1, 0, 0, 1, 1,
1.477594, -1.302469, 0.5392941, 0, 0, 0, 1, 1,
1.480324, 0.9937156, -0.003291066, 0, 0, 0, 1, 1,
1.489414, -0.163408, 2.456559, 0, 0, 0, 1, 1,
1.495479, -0.1447537, 3.792801, 0, 0, 0, 1, 1,
1.496822, 0.1926683, 1.245197, 0, 0, 0, 1, 1,
1.496873, -1.145956, 2.546873, 0, 0, 0, 1, 1,
1.509888, 0.4202433, -0.2163192, 0, 0, 0, 1, 1,
1.519523, -0.4708524, 1.864163, 1, 1, 1, 1, 1,
1.521159, -0.3035092, 1.383168, 1, 1, 1, 1, 1,
1.521719, 1.319397, -0.291053, 1, 1, 1, 1, 1,
1.525788, -0.9465957, 2.245736, 1, 1, 1, 1, 1,
1.529245, 0.561016, 1.356188, 1, 1, 1, 1, 1,
1.537731, 0.1949381, 0.4791298, 1, 1, 1, 1, 1,
1.543411, -1.937372, 1.999759, 1, 1, 1, 1, 1,
1.55196, -0.2849368, 1.168023, 1, 1, 1, 1, 1,
1.560066, 1.192096, 1.114012, 1, 1, 1, 1, 1,
1.593945, 1.176652, -0.1190898, 1, 1, 1, 1, 1,
1.597245, 0.4549981, 2.17736, 1, 1, 1, 1, 1,
1.605058, 0.06591374, 0.7315972, 1, 1, 1, 1, 1,
1.628362, -0.2234446, 1.406411, 1, 1, 1, 1, 1,
1.637793, 0.5602963, -1.072769, 1, 1, 1, 1, 1,
1.638467, 0.02300052, 2.970572, 1, 1, 1, 1, 1,
1.651482, -0.118116, 1.850632, 0, 0, 1, 1, 1,
1.653483, -0.4094035, 2.215815, 1, 0, 0, 1, 1,
1.674407, -0.9438645, 0.4351677, 1, 0, 0, 1, 1,
1.676974, 0.3127573, -0.7908444, 1, 0, 0, 1, 1,
1.70739, -0.8630404, 1.444982, 1, 0, 0, 1, 1,
1.714477, 0.3256086, 0.6213938, 1, 0, 0, 1, 1,
1.715182, -2.734311, 2.509125, 0, 0, 0, 1, 1,
1.722368, 1.052703, 1.567578, 0, 0, 0, 1, 1,
1.737453, 0.5008757, 0.9832416, 0, 0, 0, 1, 1,
1.759169, -0.72329, 1.968661, 0, 0, 0, 1, 1,
1.766003, 0.881346, 1.253175, 0, 0, 0, 1, 1,
1.768854, -0.7158841, 2.85158, 0, 0, 0, 1, 1,
1.774078, 0.4798115, 0.6941094, 0, 0, 0, 1, 1,
1.77811, -1.835511, 2.834311, 1, 1, 1, 1, 1,
1.784266, 1.452316, 0.461471, 1, 1, 1, 1, 1,
1.793297, 0.8594822, -0.1948866, 1, 1, 1, 1, 1,
1.798844, -1.862676, 0.9416934, 1, 1, 1, 1, 1,
1.813017, 0.3914565, 1.488833, 1, 1, 1, 1, 1,
1.816574, -0.8253887, 1.688697, 1, 1, 1, 1, 1,
1.862011, -1.403525, 1.602768, 1, 1, 1, 1, 1,
1.867585, -1.170476, 3.667184, 1, 1, 1, 1, 1,
1.882271, 1.243857, 1.403409, 1, 1, 1, 1, 1,
1.893256, 0.2594585, 0.7419264, 1, 1, 1, 1, 1,
1.951389, 1.38798, 0.5256928, 1, 1, 1, 1, 1,
1.965472, 0.4022269, 0.08553205, 1, 1, 1, 1, 1,
1.971486, -0.2541222, 3.046447, 1, 1, 1, 1, 1,
1.97807, 0.5922224, 3.064667, 1, 1, 1, 1, 1,
1.999103, 1.587824, 0.4272978, 1, 1, 1, 1, 1,
2.001003, -1.619468, 0.4297195, 0, 0, 1, 1, 1,
2.032556, -1.166542, 3.239167, 1, 0, 0, 1, 1,
2.079347, 0.6714525, 0.8005689, 1, 0, 0, 1, 1,
2.092026, -0.122374, 0.4709505, 1, 0, 0, 1, 1,
2.092599, -0.1943189, 3.048726, 1, 0, 0, 1, 1,
2.099851, 0.07352167, 1.475016, 1, 0, 0, 1, 1,
2.099999, -0.6291903, 1.30539, 0, 0, 0, 1, 1,
2.140343, 1.020805, 1.502355, 0, 0, 0, 1, 1,
2.215797, -0.6306924, 2.233766, 0, 0, 0, 1, 1,
2.261889, 0.7580591, 2.520823, 0, 0, 0, 1, 1,
2.374935, -0.4847658, 1.756583, 0, 0, 0, 1, 1,
2.375899, -1.047416, 3.595983, 0, 0, 0, 1, 1,
2.428159, 1.671634, 0.9980547, 0, 0, 0, 1, 1,
2.437593, -0.9317494, 2.36725, 1, 1, 1, 1, 1,
2.461544, -0.4345824, 1.492908, 1, 1, 1, 1, 1,
2.495928, 0.5961313, 0.8925739, 1, 1, 1, 1, 1,
2.532248, -0.7015977, 2.466472, 1, 1, 1, 1, 1,
2.586049, 0.8331462, 3.234586, 1, 1, 1, 1, 1,
2.799973, -0.1346299, 1.189945, 1, 1, 1, 1, 1,
2.911558, -0.1672702, 1.512608, 1, 1, 1, 1, 1
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
var radius = 9.52264;
var distance = 33.44787;
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
mvMatrix.translate( 0.2034425, -0.1780958, -0.1032102 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.44787);
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