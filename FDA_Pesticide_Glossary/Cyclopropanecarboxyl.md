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
-3.049848, 1.119506, -1.458233, 1, 0, 0, 1,
-2.671706, 0.3038311, -1.390645, 1, 0.007843138, 0, 1,
-2.635087, -1.234523, -2.689383, 1, 0.01176471, 0, 1,
-2.519653, -0.07173106, -1.875774, 1, 0.01960784, 0, 1,
-2.489957, 0.4245375, -2.546955, 1, 0.02352941, 0, 1,
-2.463459, 1.827697, 0.1431488, 1, 0.03137255, 0, 1,
-2.359477, 0.4160728, -1.413754, 1, 0.03529412, 0, 1,
-2.326507, 1.554967, -1.62523, 1, 0.04313726, 0, 1,
-2.312138, 0.5781816, -0.9849583, 1, 0.04705882, 0, 1,
-2.288436, -0.1295372, -2.196527, 1, 0.05490196, 0, 1,
-2.288367, -0.1032611, -2.635299, 1, 0.05882353, 0, 1,
-2.267281, -0.01076063, -0.001642279, 1, 0.06666667, 0, 1,
-2.25019, -1.225992, -2.889909, 1, 0.07058824, 0, 1,
-2.190077, -1.802647, -1.916136, 1, 0.07843138, 0, 1,
-2.178883, -0.5079064, -1.810202, 1, 0.08235294, 0, 1,
-2.164912, -0.2649475, -2.137472, 1, 0.09019608, 0, 1,
-2.115107, -0.4193964, -3.395646, 1, 0.09411765, 0, 1,
-2.10764, 0.03225996, -1.334628, 1, 0.1019608, 0, 1,
-2.036877, -1.788368, -2.937596, 1, 0.1098039, 0, 1,
-2.018077, 0.7289974, -2.359239, 1, 0.1137255, 0, 1,
-2.005005, -0.4077311, -1.89361, 1, 0.1215686, 0, 1,
-1.993083, 0.2511317, 0.07267822, 1, 0.1254902, 0, 1,
-1.96449, 0.6725369, -1.299055, 1, 0.1333333, 0, 1,
-1.93744, 1.136742, 0.3491769, 1, 0.1372549, 0, 1,
-1.919305, -0.4757178, -1.71948, 1, 0.145098, 0, 1,
-1.903711, -0.02484926, -0.6528711, 1, 0.1490196, 0, 1,
-1.902553, -0.7231277, -2.918994, 1, 0.1568628, 0, 1,
-1.868558, 0.03519715, -2.625013, 1, 0.1607843, 0, 1,
-1.857499, 0.8608744, -1.307711, 1, 0.1686275, 0, 1,
-1.852292, 1.374655, -1.04665, 1, 0.172549, 0, 1,
-1.838856, 1.050616, -0.3332177, 1, 0.1803922, 0, 1,
-1.838569, -1.347718, -4.321669, 1, 0.1843137, 0, 1,
-1.832024, -0.6647753, -0.7401866, 1, 0.1921569, 0, 1,
-1.795906, -0.1803006, -1.059705, 1, 0.1960784, 0, 1,
-1.787488, 1.695203, -1.357807, 1, 0.2039216, 0, 1,
-1.779283, 0.7518209, -0.6990815, 1, 0.2117647, 0, 1,
-1.76902, 0.8596922, -2.478435, 1, 0.2156863, 0, 1,
-1.76894, 0.5738072, -0.05737747, 1, 0.2235294, 0, 1,
-1.758035, 0.2159944, -2.351186, 1, 0.227451, 0, 1,
-1.754296, 0.6745026, -0.7175771, 1, 0.2352941, 0, 1,
-1.742501, -0.3179784, -2.653348, 1, 0.2392157, 0, 1,
-1.714605, 0.196632, -0.5665714, 1, 0.2470588, 0, 1,
-1.7109, -0.7252399, -0.7540795, 1, 0.2509804, 0, 1,
-1.708993, 1.042816, -0.9323452, 1, 0.2588235, 0, 1,
-1.699791, 1.073562, 1.013199, 1, 0.2627451, 0, 1,
-1.672357, 0.3997899, -0.8614841, 1, 0.2705882, 0, 1,
-1.670267, -0.04684742, -1.500481, 1, 0.2745098, 0, 1,
-1.652263, -0.5488471, -2.941113, 1, 0.282353, 0, 1,
-1.63597, -0.836825, -3.392906, 1, 0.2862745, 0, 1,
-1.635047, 0.8991175, -1.262443, 1, 0.2941177, 0, 1,
-1.634143, 1.793886, 0.1086569, 1, 0.3019608, 0, 1,
-1.617941, 1.269874, -0.7071038, 1, 0.3058824, 0, 1,
-1.609041, -1.281155, -0.4934371, 1, 0.3137255, 0, 1,
-1.608994, -0.04008763, -2.056938, 1, 0.3176471, 0, 1,
-1.607555, -0.8028606, -2.03285, 1, 0.3254902, 0, 1,
-1.602055, 1.093917, -2.351675, 1, 0.3294118, 0, 1,
-1.596427, -0.2736118, -1.073486, 1, 0.3372549, 0, 1,
-1.590797, 1.278366, -0.424609, 1, 0.3411765, 0, 1,
-1.57411, 0.2545907, -1.095283, 1, 0.3490196, 0, 1,
-1.569479, 0.08588793, -1.596312, 1, 0.3529412, 0, 1,
-1.544509, -0.2370281, -3.273157, 1, 0.3607843, 0, 1,
-1.537053, -0.9040583, -2.403349, 1, 0.3647059, 0, 1,
-1.535836, 2.517317, -2.832486, 1, 0.372549, 0, 1,
-1.534773, 0.9807993, 0.5593049, 1, 0.3764706, 0, 1,
-1.527789, 1.112409, -1.297932, 1, 0.3843137, 0, 1,
-1.519392, 0.3109426, 1.166532, 1, 0.3882353, 0, 1,
-1.511287, 0.04203635, -2.668566, 1, 0.3960784, 0, 1,
-1.490032, -0.07042258, -2.600305, 1, 0.4039216, 0, 1,
-1.488028, -0.442904, -2.461597, 1, 0.4078431, 0, 1,
-1.485684, -0.03414268, -1.851828, 1, 0.4156863, 0, 1,
-1.476, -0.2716967, -1.129493, 1, 0.4196078, 0, 1,
-1.471347, -0.09033801, -0.3334895, 1, 0.427451, 0, 1,
-1.465851, 0.2187695, -1.0679, 1, 0.4313726, 0, 1,
-1.465684, 0.06772688, -0.7401794, 1, 0.4392157, 0, 1,
-1.46287, -0.8422342, -1.528012, 1, 0.4431373, 0, 1,
-1.461163, -0.6003036, -1.625476, 1, 0.4509804, 0, 1,
-1.455384, -0.5480801, -1.401567, 1, 0.454902, 0, 1,
-1.454968, 1.800416, 0.001912211, 1, 0.4627451, 0, 1,
-1.443307, 1.154926, -1.033929, 1, 0.4666667, 0, 1,
-1.415223, 0.3834566, -0.8104365, 1, 0.4745098, 0, 1,
-1.401866, -0.1237119, -1.822266, 1, 0.4784314, 0, 1,
-1.3928, -1.029653, -2.448946, 1, 0.4862745, 0, 1,
-1.377854, 1.322692, -0.8002164, 1, 0.4901961, 0, 1,
-1.357341, -0.08366171, -2.04416, 1, 0.4980392, 0, 1,
-1.339181, -1.388148, -2.121634, 1, 0.5058824, 0, 1,
-1.336114, -0.05811232, -1.718408, 1, 0.509804, 0, 1,
-1.334827, 0.2460715, -0.4069203, 1, 0.5176471, 0, 1,
-1.333372, -0.5373474, -1.67669, 1, 0.5215687, 0, 1,
-1.332598, -0.5272316, -1.52945, 1, 0.5294118, 0, 1,
-1.331089, -0.8560528, -2.411474, 1, 0.5333334, 0, 1,
-1.32251, -1.88919, -1.903169, 1, 0.5411765, 0, 1,
-1.318483, 0.7560946, -0.9756371, 1, 0.5450981, 0, 1,
-1.312699, -0.5600134, -2.35981, 1, 0.5529412, 0, 1,
-1.303918, 0.2236092, -1.652208, 1, 0.5568628, 0, 1,
-1.302938, 0.3019418, -0.6503356, 1, 0.5647059, 0, 1,
-1.296146, -0.2629299, -1.922572, 1, 0.5686275, 0, 1,
-1.294985, -0.2946386, -2.419513, 1, 0.5764706, 0, 1,
-1.291291, -0.4247518, -1.343921, 1, 0.5803922, 0, 1,
-1.277431, -1.329663, -1.089384, 1, 0.5882353, 0, 1,
-1.277366, -0.5169826, -2.658878, 1, 0.5921569, 0, 1,
-1.276899, 0.7387146, -1.406157, 1, 0.6, 0, 1,
-1.275932, -0.3405387, -2.676126, 1, 0.6078432, 0, 1,
-1.273941, 1.474414, -0.6236842, 1, 0.6117647, 0, 1,
-1.266484, -2.228336, -1.792758, 1, 0.6196079, 0, 1,
-1.263113, -0.22218, 0.0945638, 1, 0.6235294, 0, 1,
-1.25581, 2.009534, 0.334031, 1, 0.6313726, 0, 1,
-1.236894, 1.240829, -1.004997, 1, 0.6352941, 0, 1,
-1.230275, -1.314448, -1.286581, 1, 0.6431373, 0, 1,
-1.22992, -1.820679, -1.241226, 1, 0.6470588, 0, 1,
-1.229719, -0.8157015, -0.7451587, 1, 0.654902, 0, 1,
-1.222079, 0.8106747, -1.102166, 1, 0.6588235, 0, 1,
-1.219943, 0.2196199, -2.304729, 1, 0.6666667, 0, 1,
-1.218304, 0.1871931, -1.427899, 1, 0.6705883, 0, 1,
-1.213174, 1.281567, -0.7945717, 1, 0.6784314, 0, 1,
-1.213048, 0.5500426, -1.381562, 1, 0.682353, 0, 1,
-1.20215, 0.3780777, 0.05015249, 1, 0.6901961, 0, 1,
-1.18936, -1.098994, -2.746605, 1, 0.6941177, 0, 1,
-1.187325, 0.4410558, -0.2022452, 1, 0.7019608, 0, 1,
-1.173773, -1.838296, -3.391677, 1, 0.7098039, 0, 1,
-1.168147, 1.013174, -1.911948, 1, 0.7137255, 0, 1,
-1.166734, 0.5330184, 0.7320458, 1, 0.7215686, 0, 1,
-1.164623, 1.71683, -1.478787, 1, 0.7254902, 0, 1,
-1.161339, 0.02115498, -0.2825092, 1, 0.7333333, 0, 1,
-1.152889, 0.5925774, -2.170285, 1, 0.7372549, 0, 1,
-1.152736, -0.5794185, -3.038583, 1, 0.7450981, 0, 1,
-1.150709, -1.178909, -1.792707, 1, 0.7490196, 0, 1,
-1.146279, -0.6253564, -0.03898195, 1, 0.7568628, 0, 1,
-1.144855, -0.5042065, -3.075656, 1, 0.7607843, 0, 1,
-1.140316, -0.07120624, -0.6680077, 1, 0.7686275, 0, 1,
-1.130185, -0.6140454, -3.191022, 1, 0.772549, 0, 1,
-1.121145, 0.2997943, -2.416682, 1, 0.7803922, 0, 1,
-1.111797, 0.4676137, -1.124024, 1, 0.7843137, 0, 1,
-1.110454, -0.5894437, -2.716918, 1, 0.7921569, 0, 1,
-1.110133, -1.405651, -2.554525, 1, 0.7960784, 0, 1,
-1.105332, -0.9346099, -3.175232, 1, 0.8039216, 0, 1,
-1.095755, -1.287027, -2.925159, 1, 0.8117647, 0, 1,
-1.084612, -0.5328406, -3.009715, 1, 0.8156863, 0, 1,
-1.080617, 0.01134113, -2.422837, 1, 0.8235294, 0, 1,
-1.075994, 1.199769, -1.31584, 1, 0.827451, 0, 1,
-1.068467, 1.908509, 1.055692, 1, 0.8352941, 0, 1,
-1.062524, -0.6907533, -1.621154, 1, 0.8392157, 0, 1,
-1.061137, -0.8446093, -0.6323458, 1, 0.8470588, 0, 1,
-1.029847, -1.400709, -2.62588, 1, 0.8509804, 0, 1,
-1.023456, -0.9325615, -3.864443, 1, 0.8588235, 0, 1,
-1.020234, 2.129938, -1.819938, 1, 0.8627451, 0, 1,
-1.018849, -0.6675264, -1.252697, 1, 0.8705882, 0, 1,
-1.017368, -0.2391274, -0.8810384, 1, 0.8745098, 0, 1,
-1.017173, 0.9616101, -0.1715821, 1, 0.8823529, 0, 1,
-1.00988, 0.8714994, -2.37174, 1, 0.8862745, 0, 1,
-1.007973, 0.5280531, -1.462505, 1, 0.8941177, 0, 1,
-1.004284, -0.4088347, -2.455356, 1, 0.8980392, 0, 1,
-1.003996, -1.320405, -1.511628, 1, 0.9058824, 0, 1,
-1.003406, 0.3213441, -1.704469, 1, 0.9137255, 0, 1,
-0.9957823, 1.247836, -1.000795, 1, 0.9176471, 0, 1,
-0.9915542, 0.07773929, -0.8899729, 1, 0.9254902, 0, 1,
-0.9901699, 1.62712, -1.906328, 1, 0.9294118, 0, 1,
-0.9898025, 0.1648419, -1.213389, 1, 0.9372549, 0, 1,
-0.9878951, 0.1696896, -0.8069085, 1, 0.9411765, 0, 1,
-0.9853417, -1.047256, -1.858395, 1, 0.9490196, 0, 1,
-0.9815384, -1.6913, -1.737842, 1, 0.9529412, 0, 1,
-0.978453, -0.9522448, -2.186251, 1, 0.9607843, 0, 1,
-0.9776568, -1.312186, -2.084902, 1, 0.9647059, 0, 1,
-0.9735551, 0.3424451, -0.4516144, 1, 0.972549, 0, 1,
-0.9723025, 1.543765, -1.247952, 1, 0.9764706, 0, 1,
-0.9722183, -0.390613, -1.102518, 1, 0.9843137, 0, 1,
-0.9713053, 0.3238311, -1.676902, 1, 0.9882353, 0, 1,
-0.9666096, 0.4440839, 0.1462667, 1, 0.9960784, 0, 1,
-0.9645287, 0.4722686, -2.09747, 0.9960784, 1, 0, 1,
-0.9627783, -0.1013656, -0.8975797, 0.9921569, 1, 0, 1,
-0.9564172, -0.9518272, -0.7346101, 0.9843137, 1, 0, 1,
-0.9439228, 0.0936598, -0.9688544, 0.9803922, 1, 0, 1,
-0.9410186, 1.899567, -1.144942, 0.972549, 1, 0, 1,
-0.9350491, -0.9845248, -2.424525, 0.9686275, 1, 0, 1,
-0.9317918, -1.278449, -3.371732, 0.9607843, 1, 0, 1,
-0.9284099, 1.859913, -0.6109084, 0.9568627, 1, 0, 1,
-0.9230939, 0.1301938, -1.280256, 0.9490196, 1, 0, 1,
-0.9192618, 1.16359, 0.6462231, 0.945098, 1, 0, 1,
-0.9184487, 0.5497302, 0.07903615, 0.9372549, 1, 0, 1,
-0.9128523, -0.4321457, -1.649761, 0.9333333, 1, 0, 1,
-0.9093875, 0.15115, -0.2365801, 0.9254902, 1, 0, 1,
-0.9040809, 0.04666055, -0.8064919, 0.9215686, 1, 0, 1,
-0.8981791, 2.31681, -0.128273, 0.9137255, 1, 0, 1,
-0.8945492, -1.941628, -2.475925, 0.9098039, 1, 0, 1,
-0.8840465, -0.2225644, -2.337115, 0.9019608, 1, 0, 1,
-0.8811763, -0.8023599, -3.302438, 0.8941177, 1, 0, 1,
-0.8803241, -0.3850845, -2.9583, 0.8901961, 1, 0, 1,
-0.8752568, 0.8810633, -2.283464, 0.8823529, 1, 0, 1,
-0.8686678, 0.930039, -3.599366, 0.8784314, 1, 0, 1,
-0.865827, 0.4773879, -1.52749, 0.8705882, 1, 0, 1,
-0.8599672, -0.5306594, -2.25351, 0.8666667, 1, 0, 1,
-0.853723, -3.203822, -1.379058, 0.8588235, 1, 0, 1,
-0.8501662, -0.6809895, -2.734738, 0.854902, 1, 0, 1,
-0.8471141, 0.8820751, -0.8315113, 0.8470588, 1, 0, 1,
-0.8465461, 1.529849, 1.124333, 0.8431373, 1, 0, 1,
-0.8454948, -0.2224209, -2.540448, 0.8352941, 1, 0, 1,
-0.8452686, 0.3221018, -1.143224, 0.8313726, 1, 0, 1,
-0.8351043, 0.6338152, -1.558116, 0.8235294, 1, 0, 1,
-0.8340047, -0.07478864, -2.723956, 0.8196079, 1, 0, 1,
-0.829756, -1.212157, -2.700963, 0.8117647, 1, 0, 1,
-0.82925, -0.5176081, 0.3887371, 0.8078431, 1, 0, 1,
-0.8175803, -0.3829215, -2.268915, 0.8, 1, 0, 1,
-0.8172603, -0.0944949, -2.189861, 0.7921569, 1, 0, 1,
-0.8120125, 0.8282934, 1.20166, 0.7882353, 1, 0, 1,
-0.8066985, 0.8007126, -1.37193, 0.7803922, 1, 0, 1,
-0.7936567, -0.1577573, -2.108294, 0.7764706, 1, 0, 1,
-0.7895339, 1.101416, -1.42273, 0.7686275, 1, 0, 1,
-0.7892028, 0.5442566, 0.6293677, 0.7647059, 1, 0, 1,
-0.7879793, -1.56128, -3.42902, 0.7568628, 1, 0, 1,
-0.7872138, 1.187262, -0.4195958, 0.7529412, 1, 0, 1,
-0.7838928, -1.275575, -2.849073, 0.7450981, 1, 0, 1,
-0.7797427, -2.080208, -3.8187, 0.7411765, 1, 0, 1,
-0.7769421, 1.096377, -0.1444221, 0.7333333, 1, 0, 1,
-0.7754532, 0.1315967, -0.6756258, 0.7294118, 1, 0, 1,
-0.7753962, -0.06572835, -1.003326, 0.7215686, 1, 0, 1,
-0.7708062, -0.1334479, -1.180672, 0.7176471, 1, 0, 1,
-0.7692441, 0.547365, -4.203593, 0.7098039, 1, 0, 1,
-0.7677314, 0.01228088, -2.06246, 0.7058824, 1, 0, 1,
-0.7643266, -0.2203094, -2.762266, 0.6980392, 1, 0, 1,
-0.7640162, -0.6303015, -2.160105, 0.6901961, 1, 0, 1,
-0.760498, 0.9415818, -1.029555, 0.6862745, 1, 0, 1,
-0.759849, -0.01878684, -1.493461, 0.6784314, 1, 0, 1,
-0.758463, 0.001118517, -1.859156, 0.6745098, 1, 0, 1,
-0.7515152, -0.4073351, -2.549075, 0.6666667, 1, 0, 1,
-0.7513642, 1.283601, -0.2950417, 0.6627451, 1, 0, 1,
-0.7497863, 2.050564, -0.7997401, 0.654902, 1, 0, 1,
-0.7487366, -0.7865128, -2.976415, 0.6509804, 1, 0, 1,
-0.7454163, -1.017779, -2.569347, 0.6431373, 1, 0, 1,
-0.7450125, -0.1889856, -0.4976145, 0.6392157, 1, 0, 1,
-0.7429302, -1.395635, -0.3301009, 0.6313726, 1, 0, 1,
-0.7399574, 0.891376, -1.815428, 0.627451, 1, 0, 1,
-0.7347494, -0.7567029, -2.058295, 0.6196079, 1, 0, 1,
-0.7346294, 0.08418248, -1.39648, 0.6156863, 1, 0, 1,
-0.7345387, -0.536722, -3.351801, 0.6078432, 1, 0, 1,
-0.7318445, 1.397552, -0.9558862, 0.6039216, 1, 0, 1,
-0.7301237, -1.420699, -1.359374, 0.5960785, 1, 0, 1,
-0.72862, 1.379094, -2.279392, 0.5882353, 1, 0, 1,
-0.7278808, -0.02602804, -2.297304, 0.5843138, 1, 0, 1,
-0.7257628, 0.6064002, -0.7751144, 0.5764706, 1, 0, 1,
-0.7223688, 0.05252941, -1.580407, 0.572549, 1, 0, 1,
-0.7092106, -0.7467372, -2.77396, 0.5647059, 1, 0, 1,
-0.7018082, 1.824618, -0.7477734, 0.5607843, 1, 0, 1,
-0.696897, 0.05543077, -3.179124, 0.5529412, 1, 0, 1,
-0.6954833, 1.86171, -0.1830392, 0.5490196, 1, 0, 1,
-0.6918517, 0.7100913, -1.283157, 0.5411765, 1, 0, 1,
-0.6880403, -0.716615, -3.992972, 0.5372549, 1, 0, 1,
-0.6874971, 0.8986859, 0.3742891, 0.5294118, 1, 0, 1,
-0.6838278, 1.256366, 0.05829324, 0.5254902, 1, 0, 1,
-0.6811745, -0.1496052, -1.594151, 0.5176471, 1, 0, 1,
-0.6810807, 1.803917, -1.278514, 0.5137255, 1, 0, 1,
-0.6808226, 0.642894, -1.677939, 0.5058824, 1, 0, 1,
-0.6784943, -0.295312, -2.922637, 0.5019608, 1, 0, 1,
-0.6762475, -0.7593387, -1.59824, 0.4941176, 1, 0, 1,
-0.6660112, 1.505838, 0.693785, 0.4862745, 1, 0, 1,
-0.6626716, 0.08436933, -1.521422, 0.4823529, 1, 0, 1,
-0.6551343, 1.796337, -1.475677, 0.4745098, 1, 0, 1,
-0.6550387, 0.4513933, -0.7749664, 0.4705882, 1, 0, 1,
-0.6531219, 1.043761, 0.04859764, 0.4627451, 1, 0, 1,
-0.6528274, -0.8156915, -3.519411, 0.4588235, 1, 0, 1,
-0.6515586, -1.022522, -2.730183, 0.4509804, 1, 0, 1,
-0.6496646, -0.06571938, -3.449971, 0.4470588, 1, 0, 1,
-0.6487514, -0.7598572, -3.701974, 0.4392157, 1, 0, 1,
-0.6483296, 0.1013565, -0.1168847, 0.4352941, 1, 0, 1,
-0.6452254, -0.8541462, -3.941283, 0.427451, 1, 0, 1,
-0.643373, 0.3455051, 0.8366529, 0.4235294, 1, 0, 1,
-0.6409698, 0.08763754, -2.200405, 0.4156863, 1, 0, 1,
-0.6378442, -0.5817289, -2.115239, 0.4117647, 1, 0, 1,
-0.6330773, -1.096284, -2.021666, 0.4039216, 1, 0, 1,
-0.6328644, 0.3349877, -1.968341, 0.3960784, 1, 0, 1,
-0.629663, -0.2671209, -0.8121392, 0.3921569, 1, 0, 1,
-0.6259406, -0.5952498, -3.478261, 0.3843137, 1, 0, 1,
-0.6224489, 0.9753748, -2.164662, 0.3803922, 1, 0, 1,
-0.6163087, 0.517593, -1.24661, 0.372549, 1, 0, 1,
-0.6139884, 1.17408, 0.1505013, 0.3686275, 1, 0, 1,
-0.610615, -0.07641665, -4.308058, 0.3607843, 1, 0, 1,
-0.6078069, 0.3170153, -0.391054, 0.3568628, 1, 0, 1,
-0.6055256, 1.23131, -1.359923, 0.3490196, 1, 0, 1,
-0.6038881, 0.4236572, -1.457902, 0.345098, 1, 0, 1,
-0.6020784, -1.258325, -2.978926, 0.3372549, 1, 0, 1,
-0.5997054, 0.07049759, -1.57753, 0.3333333, 1, 0, 1,
-0.5961319, -1.824609, -1.978628, 0.3254902, 1, 0, 1,
-0.5944217, 0.5516924, -3.867743, 0.3215686, 1, 0, 1,
-0.5888327, 1.775357, -1.679986, 0.3137255, 1, 0, 1,
-0.5781949, -0.2708578, -1.482638, 0.3098039, 1, 0, 1,
-0.5765686, 2.041108, 0.3409896, 0.3019608, 1, 0, 1,
-0.5746703, 0.458725, -1.925742, 0.2941177, 1, 0, 1,
-0.5711206, 1.265052, -0.6286593, 0.2901961, 1, 0, 1,
-0.5709454, -1.089425, -3.948184, 0.282353, 1, 0, 1,
-0.5692254, 0.6137319, -3.617499, 0.2784314, 1, 0, 1,
-0.5688419, -0.7376239, -1.862782, 0.2705882, 1, 0, 1,
-0.5638362, -1.512352, -1.039884, 0.2666667, 1, 0, 1,
-0.5614577, -0.3278846, -1.994339, 0.2588235, 1, 0, 1,
-0.5589598, -0.5677245, -1.947263, 0.254902, 1, 0, 1,
-0.5529078, -1.178157, -3.31025, 0.2470588, 1, 0, 1,
-0.5528355, 0.3525161, -0.1885914, 0.2431373, 1, 0, 1,
-0.5521067, 0.06343219, -2.075549, 0.2352941, 1, 0, 1,
-0.5483611, -1.718678, -2.229088, 0.2313726, 1, 0, 1,
-0.5466363, -0.2029819, -0.5716184, 0.2235294, 1, 0, 1,
-0.5401659, -0.8975151, -3.320598, 0.2196078, 1, 0, 1,
-0.5342465, -0.5770765, -2.709891, 0.2117647, 1, 0, 1,
-0.5300639, 0.01091937, -0.2355634, 0.2078431, 1, 0, 1,
-0.528999, 0.6351215, -1.055495, 0.2, 1, 0, 1,
-0.5288842, 1.345792, -1.199347, 0.1921569, 1, 0, 1,
-0.5246807, -0.0960499, -2.197222, 0.1882353, 1, 0, 1,
-0.5143158, -0.365741, -2.259398, 0.1803922, 1, 0, 1,
-0.4996212, -0.5333501, -2.551585, 0.1764706, 1, 0, 1,
-0.499274, -0.280901, -2.799708, 0.1686275, 1, 0, 1,
-0.4984628, 0.4246938, -2.145115, 0.1647059, 1, 0, 1,
-0.4976459, 1.934804, -2.410611, 0.1568628, 1, 0, 1,
-0.4961067, 1.721684, 1.688312, 0.1529412, 1, 0, 1,
-0.4931473, -0.2342149, -1.609314, 0.145098, 1, 0, 1,
-0.483488, -0.01805722, -2.057518, 0.1411765, 1, 0, 1,
-0.4752234, 0.8648173, 0.2550384, 0.1333333, 1, 0, 1,
-0.4741869, -0.6832641, -2.529183, 0.1294118, 1, 0, 1,
-0.4684577, -0.5461311, -3.641329, 0.1215686, 1, 0, 1,
-0.4675367, -0.5118822, -1.366519, 0.1176471, 1, 0, 1,
-0.4650819, -2.28916, -2.729233, 0.1098039, 1, 0, 1,
-0.4650118, 0.7617702, -2.540585, 0.1058824, 1, 0, 1,
-0.4649792, 0.6310762, 0.03354437, 0.09803922, 1, 0, 1,
-0.4637664, 0.5297623, -2.331953, 0.09019608, 1, 0, 1,
-0.4626465, -0.5215058, -1.819095, 0.08627451, 1, 0, 1,
-0.4595187, -0.9102709, -3.259902, 0.07843138, 1, 0, 1,
-0.450105, -1.489286, -3.510504, 0.07450981, 1, 0, 1,
-0.4465182, 0.4745838, -0.2059231, 0.06666667, 1, 0, 1,
-0.4445778, -1.133345, -5.621307, 0.0627451, 1, 0, 1,
-0.4416603, -0.9752951, -2.978109, 0.05490196, 1, 0, 1,
-0.4354653, 1.000399, -1.466366, 0.05098039, 1, 0, 1,
-0.4338236, -0.6253589, -3.521774, 0.04313726, 1, 0, 1,
-0.4303743, 0.6392504, -1.097096, 0.03921569, 1, 0, 1,
-0.4271011, -0.5192198, -2.355227, 0.03137255, 1, 0, 1,
-0.4236265, -0.495372, -3.189034, 0.02745098, 1, 0, 1,
-0.4209827, -2.163178, -3.357104, 0.01960784, 1, 0, 1,
-0.4118741, 0.136278, -1.097597, 0.01568628, 1, 0, 1,
-0.4070484, 0.7673039, -0.5217924, 0.007843138, 1, 0, 1,
-0.3982205, 0.9325289, 0.2392226, 0.003921569, 1, 0, 1,
-0.3979014, 0.4930907, 0.2820598, 0, 1, 0.003921569, 1,
-0.3974068, -0.4901191, -3.674856, 0, 1, 0.01176471, 1,
-0.3971342, -0.5484062, -1.535328, 0, 1, 0.01568628, 1,
-0.3939414, -0.1203171, -2.852972, 0, 1, 0.02352941, 1,
-0.3848634, -0.4886546, -1.246712, 0, 1, 0.02745098, 1,
-0.3846509, -0.8389856, -2.512668, 0, 1, 0.03529412, 1,
-0.3818634, 0.3987235, -1.734698, 0, 1, 0.03921569, 1,
-0.3813513, 0.1263451, 0.7329557, 0, 1, 0.04705882, 1,
-0.3763238, -0.6680776, -3.736703, 0, 1, 0.05098039, 1,
-0.3752927, 0.2590071, -0.01069896, 0, 1, 0.05882353, 1,
-0.3743671, -0.5311478, -1.788369, 0, 1, 0.0627451, 1,
-0.3733676, -1.464317, -1.734639, 0, 1, 0.07058824, 1,
-0.3623218, 1.873142, -0.1042324, 0, 1, 0.07450981, 1,
-0.3603504, 2.327644, 0.2652706, 0, 1, 0.08235294, 1,
-0.353695, -0.9558764, -2.351618, 0, 1, 0.08627451, 1,
-0.3528994, -0.07876971, -0.8776693, 0, 1, 0.09411765, 1,
-0.3528027, -0.3872327, -1.763926, 0, 1, 0.1019608, 1,
-0.3499497, 1.834759, -0.1864088, 0, 1, 0.1058824, 1,
-0.3474996, 1.629936, 0.31614, 0, 1, 0.1137255, 1,
-0.3359847, -0.9192178, -2.569363, 0, 1, 0.1176471, 1,
-0.3345397, 0.470251, -0.5340637, 0, 1, 0.1254902, 1,
-0.3286744, 1.285575, -0.6358687, 0, 1, 0.1294118, 1,
-0.3268286, -0.06719553, -3.555346, 0, 1, 0.1372549, 1,
-0.3256471, 0.2867114, -0.8047599, 0, 1, 0.1411765, 1,
-0.3249544, 0.9222057, -0.5213355, 0, 1, 0.1490196, 1,
-0.322184, -0.3874254, -4.298975, 0, 1, 0.1529412, 1,
-0.3164597, -0.9628289, -3.858782, 0, 1, 0.1607843, 1,
-0.3109962, 0.02196836, 0.3997497, 0, 1, 0.1647059, 1,
-0.3084678, 0.3678652, -1.599525, 0, 1, 0.172549, 1,
-0.3075919, -1.481208, -4.312525, 0, 1, 0.1764706, 1,
-0.295332, -0.4238716, -3.391165, 0, 1, 0.1843137, 1,
-0.2939535, -0.4011759, -4.630215, 0, 1, 0.1882353, 1,
-0.2935685, -0.2398038, -2.815046, 0, 1, 0.1960784, 1,
-0.2888328, -0.5853617, -2.792061, 0, 1, 0.2039216, 1,
-0.2876378, 1.448617, 0.7771142, 0, 1, 0.2078431, 1,
-0.2864966, -0.8709947, -3.069898, 0, 1, 0.2156863, 1,
-0.2825919, 1.293728, -0.4693541, 0, 1, 0.2196078, 1,
-0.2761111, 0.8088582, -0.1496788, 0, 1, 0.227451, 1,
-0.2740366, 0.4304137, 1.202664, 0, 1, 0.2313726, 1,
-0.2684872, -1.564424, -3.176039, 0, 1, 0.2392157, 1,
-0.2674589, -0.0827425, -2.566776, 0, 1, 0.2431373, 1,
-0.2642919, 0.3902431, -1.402839, 0, 1, 0.2509804, 1,
-0.2630429, 2.043604, 1.443175, 0, 1, 0.254902, 1,
-0.2624322, -1.187729, -3.306768, 0, 1, 0.2627451, 1,
-0.2623616, -0.8712221, -4.132085, 0, 1, 0.2666667, 1,
-0.2526836, -0.07804286, -2.130794, 0, 1, 0.2745098, 1,
-0.2519355, -0.08871377, -2.640171, 0, 1, 0.2784314, 1,
-0.2508707, -0.8875804, -3.049115, 0, 1, 0.2862745, 1,
-0.247537, 0.2460902, -0.2527567, 0, 1, 0.2901961, 1,
-0.2463086, 0.3233318, -2.077812, 0, 1, 0.2980392, 1,
-0.2460615, 0.7093752, -1.213808, 0, 1, 0.3058824, 1,
-0.2433642, 0.7945319, -0.5130241, 0, 1, 0.3098039, 1,
-0.2426832, 0.2162619, -1.04924, 0, 1, 0.3176471, 1,
-0.2424915, -0.3789968, -3.48258, 0, 1, 0.3215686, 1,
-0.2353882, 0.305537, -1.380618, 0, 1, 0.3294118, 1,
-0.2345878, -0.8827341, -2.722606, 0, 1, 0.3333333, 1,
-0.2305434, 1.546519, -0.5740736, 0, 1, 0.3411765, 1,
-0.2293067, 1.45087, 2.145255, 0, 1, 0.345098, 1,
-0.2292593, 0.9709541, -1.055929, 0, 1, 0.3529412, 1,
-0.2241925, 0.3322755, 0.5002003, 0, 1, 0.3568628, 1,
-0.22314, 2.368678, -1.484502, 0, 1, 0.3647059, 1,
-0.2231199, 1.664321, -0.7235072, 0, 1, 0.3686275, 1,
-0.2225965, -0.0710771, -3.426807, 0, 1, 0.3764706, 1,
-0.2155908, -0.2268987, -1.743224, 0, 1, 0.3803922, 1,
-0.2122776, -1.58033, -1.4421, 0, 1, 0.3882353, 1,
-0.211124, 0.8006422, -0.9265063, 0, 1, 0.3921569, 1,
-0.2108314, -1.049587, -3.862269, 0, 1, 0.4, 1,
-0.1992054, 0.2280322, -1.332724, 0, 1, 0.4078431, 1,
-0.198429, -0.2951652, -1.799481, 0, 1, 0.4117647, 1,
-0.1920322, 0.3465768, -0.1331628, 0, 1, 0.4196078, 1,
-0.1900826, 0.3283765, 0.6719, 0, 1, 0.4235294, 1,
-0.1832926, -0.7901023, -3.001338, 0, 1, 0.4313726, 1,
-0.17527, -1.740579, -4.175573, 0, 1, 0.4352941, 1,
-0.1746622, -0.7799584, -3.975961, 0, 1, 0.4431373, 1,
-0.1715026, -0.1663154, -1.143816, 0, 1, 0.4470588, 1,
-0.1690976, 0.652517, 0.6170842, 0, 1, 0.454902, 1,
-0.1690006, 0.8368453, 0.61925, 0, 1, 0.4588235, 1,
-0.1682055, 0.6091984, 0.1586601, 0, 1, 0.4666667, 1,
-0.1639652, -1.357229, -2.403981, 0, 1, 0.4705882, 1,
-0.1595557, 0.3607836, -0.9271703, 0, 1, 0.4784314, 1,
-0.157316, 0.1984273, -0.9153209, 0, 1, 0.4823529, 1,
-0.1550175, -0.01056104, -1.606737, 0, 1, 0.4901961, 1,
-0.1533028, 1.062049, -1.212638, 0, 1, 0.4941176, 1,
-0.1518547, -0.6173759, -1.797605, 0, 1, 0.5019608, 1,
-0.1496154, -0.66175, -1.733725, 0, 1, 0.509804, 1,
-0.1495608, 1.69397, -0.3588145, 0, 1, 0.5137255, 1,
-0.1477357, -1.927046, -3.258372, 0, 1, 0.5215687, 1,
-0.146766, -0.7107324, -4.020422, 0, 1, 0.5254902, 1,
-0.1464811, -0.6899787, -2.794954, 0, 1, 0.5333334, 1,
-0.1458005, -0.5546886, -3.766516, 0, 1, 0.5372549, 1,
-0.145642, 0.7224776, 0.7748444, 0, 1, 0.5450981, 1,
-0.1395074, 0.4157706, -0.836477, 0, 1, 0.5490196, 1,
-0.1369651, 5.339149e-05, -2.825688, 0, 1, 0.5568628, 1,
-0.1365483, -0.5968704, -3.266873, 0, 1, 0.5607843, 1,
-0.1325193, 0.9897566, -1.074305, 0, 1, 0.5686275, 1,
-0.1298833, -1.272977, -1.114675, 0, 1, 0.572549, 1,
-0.1271509, 0.1510703, -0.2658938, 0, 1, 0.5803922, 1,
-0.1248035, -0.5721545, -1.183884, 0, 1, 0.5843138, 1,
-0.1203083, -0.2439118, -3.370526, 0, 1, 0.5921569, 1,
-0.1146703, -0.0411447, -0.6809955, 0, 1, 0.5960785, 1,
-0.1137114, -0.5594538, -2.401515, 0, 1, 0.6039216, 1,
-0.1076255, 0.8700776, -0.4547351, 0, 1, 0.6117647, 1,
-0.1062312, -0.6406029, -3.585985, 0, 1, 0.6156863, 1,
-0.1012874, -1.21106, -3.705584, 0, 1, 0.6235294, 1,
-0.1008791, 0.8646878, -0.06692512, 0, 1, 0.627451, 1,
-0.0985149, 0.6760549, -0.02852682, 0, 1, 0.6352941, 1,
-0.09630767, -0.3863586, -4.507652, 0, 1, 0.6392157, 1,
-0.09494369, -1.702536, -3.851797, 0, 1, 0.6470588, 1,
-0.09144092, -0.6333621, -3.140151, 0, 1, 0.6509804, 1,
-0.09034, -0.9186849, -2.350829, 0, 1, 0.6588235, 1,
-0.08459634, 1.262008, -0.5338159, 0, 1, 0.6627451, 1,
-0.08220368, 0.1155058, 0.5143661, 0, 1, 0.6705883, 1,
-0.08208991, 0.4117082, 0.503127, 0, 1, 0.6745098, 1,
-0.07693915, -0.484183, -3.598508, 0, 1, 0.682353, 1,
-0.07563388, 0.5690731, -1.257699, 0, 1, 0.6862745, 1,
-0.0755126, -0.3170352, -2.213336, 0, 1, 0.6941177, 1,
-0.07152307, 1.046501, -0.3099306, 0, 1, 0.7019608, 1,
-0.06772122, 0.8024515, 0.9832345, 0, 1, 0.7058824, 1,
-0.06535877, -1.194646, -2.910225, 0, 1, 0.7137255, 1,
-0.06483711, -0.6257733, -2.733619, 0, 1, 0.7176471, 1,
-0.06310497, -0.4342986, -4.304568, 0, 1, 0.7254902, 1,
-0.06115106, 0.9527126, -2.731923, 0, 1, 0.7294118, 1,
-0.06095241, 0.7681876, -0.788532, 0, 1, 0.7372549, 1,
-0.05991057, -0.7524516, -3.258385, 0, 1, 0.7411765, 1,
-0.05304953, -0.1675399, -1.999302, 0, 1, 0.7490196, 1,
-0.05304466, 0.4101482, 0.4777038, 0, 1, 0.7529412, 1,
-0.04990819, -0.1426682, -1.920612, 0, 1, 0.7607843, 1,
-0.047993, -0.9687094, -4.394347, 0, 1, 0.7647059, 1,
-0.04377263, 0.6168281, -1.337528, 0, 1, 0.772549, 1,
-0.04299807, 0.2188603, 0.7725307, 0, 1, 0.7764706, 1,
-0.04028347, -1.457133, -3.205066, 0, 1, 0.7843137, 1,
-0.02605804, -0.3952524, -4.059958, 0, 1, 0.7882353, 1,
-0.02169713, 0.2124354, -1.534677, 0, 1, 0.7960784, 1,
-0.0177662, -1.276443, -3.618961, 0, 1, 0.8039216, 1,
-0.009215951, -1.070275, -4.213939, 0, 1, 0.8078431, 1,
-0.008081965, 0.3972879, -0.813513, 0, 1, 0.8156863, 1,
0.007778079, -0.4446335, 3.90512, 0, 1, 0.8196079, 1,
0.01296603, -0.05923236, 2.605661, 0, 1, 0.827451, 1,
0.01463761, 0.4229881, 0.6812838, 0, 1, 0.8313726, 1,
0.02503588, 0.3230158, -0.1163437, 0, 1, 0.8392157, 1,
0.02588745, 0.2665952, 1.528541, 0, 1, 0.8431373, 1,
0.02640927, 0.0003584793, 0.1611703, 0, 1, 0.8509804, 1,
0.02816067, -0.9835592, 2.74866, 0, 1, 0.854902, 1,
0.03541011, -0.02377486, 2.177014, 0, 1, 0.8627451, 1,
0.04055851, -1.565392, 3.725851, 0, 1, 0.8666667, 1,
0.04698487, 0.2480822, -1.080612, 0, 1, 0.8745098, 1,
0.04713275, 0.6145906, -0.2319518, 0, 1, 0.8784314, 1,
0.04742725, -0.2129974, 3.79403, 0, 1, 0.8862745, 1,
0.04829735, 1.518407, -1.682284, 0, 1, 0.8901961, 1,
0.04833758, 0.6963741, 1.643497, 0, 1, 0.8980392, 1,
0.04924307, 1.059031, 1.032194, 0, 1, 0.9058824, 1,
0.04930462, -0.1591203, 1.482671, 0, 1, 0.9098039, 1,
0.05244512, 0.389063, 0.8457202, 0, 1, 0.9176471, 1,
0.05541572, 0.6042209, 0.6957564, 0, 1, 0.9215686, 1,
0.05553746, 1.098553, 1.340628, 0, 1, 0.9294118, 1,
0.05576571, 0.2981539, -0.7332522, 0, 1, 0.9333333, 1,
0.05839054, 1.761695, -1.146609, 0, 1, 0.9411765, 1,
0.0594544, 0.253976, 0.3552498, 0, 1, 0.945098, 1,
0.06008204, 0.1156409, 1.71019, 0, 1, 0.9529412, 1,
0.06028556, -0.1103603, 3.83491, 0, 1, 0.9568627, 1,
0.06326041, 1.600601, -1.275254, 0, 1, 0.9647059, 1,
0.06720305, -1.57516, 3.71542, 0, 1, 0.9686275, 1,
0.06776815, 1.003415, 1.673513, 0, 1, 0.9764706, 1,
0.06853309, 0.1738683, 0.6395098, 0, 1, 0.9803922, 1,
0.070702, 0.8300779, 1.388716, 0, 1, 0.9882353, 1,
0.072165, 0.2094791, -0.5670629, 0, 1, 0.9921569, 1,
0.07341427, 0.2717682, 0.006234664, 0, 1, 1, 1,
0.07369816, 0.7321112, -0.03430766, 0, 0.9921569, 1, 1,
0.07717882, -0.2157693, 4.964266, 0, 0.9882353, 1, 1,
0.07777763, -0.5157267, 3.135793, 0, 0.9803922, 1, 1,
0.07994454, 1.040069, -1.232428, 0, 0.9764706, 1, 1,
0.08481497, -0.5481321, 3.333408, 0, 0.9686275, 1, 1,
0.0870314, 1.574849, -0.378216, 0, 0.9647059, 1, 1,
0.08831445, 1.159027, -1.666589, 0, 0.9568627, 1, 1,
0.09087492, 0.4350802, -0.5098711, 0, 0.9529412, 1, 1,
0.09095202, -0.6179717, 2.108023, 0, 0.945098, 1, 1,
0.09096992, 0.5701661, -0.2252198, 0, 0.9411765, 1, 1,
0.09768845, 0.7734978, -0.4665484, 0, 0.9333333, 1, 1,
0.1009335, -0.2826828, 3.47226, 0, 0.9294118, 1, 1,
0.1028629, -1.015606, 2.311067, 0, 0.9215686, 1, 1,
0.1033328, -0.2323494, 1.554231, 0, 0.9176471, 1, 1,
0.103953, -0.6092761, 3.743293, 0, 0.9098039, 1, 1,
0.1043084, 0.3138867, -0.2509753, 0, 0.9058824, 1, 1,
0.1070612, -0.8867221, 4.134758, 0, 0.8980392, 1, 1,
0.1083251, -0.1428991, 2.671531, 0, 0.8901961, 1, 1,
0.1087201, -0.8748665, 4.621135, 0, 0.8862745, 1, 1,
0.1112999, -0.7775611, 3.506166, 0, 0.8784314, 1, 1,
0.1195344, -0.6108662, 2.287959, 0, 0.8745098, 1, 1,
0.1198893, 1.594762, 0.5764259, 0, 0.8666667, 1, 1,
0.1199637, -0.04779584, 1.773021, 0, 0.8627451, 1, 1,
0.1219431, 0.7792426, 0.7427653, 0, 0.854902, 1, 1,
0.1224315, -0.1738431, 3.240341, 0, 0.8509804, 1, 1,
0.1231837, -0.005644789, 1.316444, 0, 0.8431373, 1, 1,
0.1369037, -1.520715, 4.565088, 0, 0.8392157, 1, 1,
0.1377382, -0.0727087, 2.351763, 0, 0.8313726, 1, 1,
0.1403912, 0.6623442, 0.02587664, 0, 0.827451, 1, 1,
0.1412127, 2.025213, -0.2074224, 0, 0.8196079, 1, 1,
0.1450836, 0.0503566, 2.065975, 0, 0.8156863, 1, 1,
0.1463713, 1.803077, -0.6877002, 0, 0.8078431, 1, 1,
0.1504697, -0.5590103, 2.65942, 0, 0.8039216, 1, 1,
0.151141, 0.2855912, -3.130361, 0, 0.7960784, 1, 1,
0.155314, 0.9690949, 0.2063601, 0, 0.7882353, 1, 1,
0.1577398, 2.125784, -0.2868514, 0, 0.7843137, 1, 1,
0.1608585, 1.229692, 1.728371, 0, 0.7764706, 1, 1,
0.1622785, 1.495124, 0.0996139, 0, 0.772549, 1, 1,
0.1631993, 0.4565556, 0.05532384, 0, 0.7647059, 1, 1,
0.1654164, 0.2599484, 0.3668022, 0, 0.7607843, 1, 1,
0.1664393, 1.205649, -1.226366, 0, 0.7529412, 1, 1,
0.1673459, -1.427434, 3.497992, 0, 0.7490196, 1, 1,
0.1674474, -1.557487, 3.119857, 0, 0.7411765, 1, 1,
0.1685418, 1.177438, -1.965932, 0, 0.7372549, 1, 1,
0.1708393, -0.1062987, 2.456251, 0, 0.7294118, 1, 1,
0.173747, 0.804336, -1.047221, 0, 0.7254902, 1, 1,
0.1764733, -0.3956327, 1.854486, 0, 0.7176471, 1, 1,
0.1767963, 0.4783486, -0.8566133, 0, 0.7137255, 1, 1,
0.1792922, -1.981608, 3.86356, 0, 0.7058824, 1, 1,
0.180278, -0.07702207, 1.765887, 0, 0.6980392, 1, 1,
0.1867409, -1.696976, 4.925766, 0, 0.6941177, 1, 1,
0.1878585, 0.165717, -0.6026636, 0, 0.6862745, 1, 1,
0.1894317, 1.4662, 1.825706, 0, 0.682353, 1, 1,
0.1901519, 0.1094121, 0.339066, 0, 0.6745098, 1, 1,
0.1928281, -0.583267, 1.900728, 0, 0.6705883, 1, 1,
0.1934335, -0.4547369, 3.194501, 0, 0.6627451, 1, 1,
0.1973861, 0.2589172, 0.8018752, 0, 0.6588235, 1, 1,
0.2005607, 0.6473084, 0.7311285, 0, 0.6509804, 1, 1,
0.2006773, 0.728496, -0.425492, 0, 0.6470588, 1, 1,
0.206179, -0.6443933, 3.600945, 0, 0.6392157, 1, 1,
0.209735, -1.256189, 4.476465, 0, 0.6352941, 1, 1,
0.216475, 0.5623536, -0.1828826, 0, 0.627451, 1, 1,
0.2188253, 1.236727, 1.404472, 0, 0.6235294, 1, 1,
0.2227578, 0.476523, 0.7938063, 0, 0.6156863, 1, 1,
0.2273509, -0.6304858, 2.276154, 0, 0.6117647, 1, 1,
0.2320928, 0.4358796, 1.215925, 0, 0.6039216, 1, 1,
0.2332962, 0.8449334, -0.7732592, 0, 0.5960785, 1, 1,
0.234695, 0.9934448, 2.450643, 0, 0.5921569, 1, 1,
0.2383709, 1.535343, -1.985849, 0, 0.5843138, 1, 1,
0.2387182, 2.558558, 0.1035767, 0, 0.5803922, 1, 1,
0.2459591, -0.05637107, 1.583124, 0, 0.572549, 1, 1,
0.246839, 1.208134, 1.575311, 0, 0.5686275, 1, 1,
0.2470124, 0.458024, -0.49804, 0, 0.5607843, 1, 1,
0.250263, -1.065758, 3.406629, 0, 0.5568628, 1, 1,
0.2553205, -0.98972, 5.106752, 0, 0.5490196, 1, 1,
0.2578187, -0.3352195, 2.377872, 0, 0.5450981, 1, 1,
0.264227, -0.9640935, 1.187357, 0, 0.5372549, 1, 1,
0.2643665, 0.008846526, 0.4759607, 0, 0.5333334, 1, 1,
0.2738597, -0.2654189, 1.156777, 0, 0.5254902, 1, 1,
0.2773878, 0.8003116, -1.038115, 0, 0.5215687, 1, 1,
0.2784797, 0.6950356, -0.8297673, 0, 0.5137255, 1, 1,
0.2834461, -2.5935, 3.879025, 0, 0.509804, 1, 1,
0.2865084, 0.02507784, 1.332239, 0, 0.5019608, 1, 1,
0.2886609, -1.25433, 2.828663, 0, 0.4941176, 1, 1,
0.2889952, 1.087314, 0.1556031, 0, 0.4901961, 1, 1,
0.2947176, 0.2197352, 2.312064, 0, 0.4823529, 1, 1,
0.3026236, 0.6095231, -0.4949163, 0, 0.4784314, 1, 1,
0.3048, 0.759833, 0.2580708, 0, 0.4705882, 1, 1,
0.3062899, -0.5386776, 0.6938275, 0, 0.4666667, 1, 1,
0.3095189, 0.2163286, 0.7667249, 0, 0.4588235, 1, 1,
0.3135899, 1.985973, -0.1552361, 0, 0.454902, 1, 1,
0.3137145, 0.2963471, -1.239109, 0, 0.4470588, 1, 1,
0.3156359, 0.2024854, 0.9217349, 0, 0.4431373, 1, 1,
0.3159894, 0.1965618, 0.1591595, 0, 0.4352941, 1, 1,
0.3241572, -0.925738, 2.216002, 0, 0.4313726, 1, 1,
0.3256385, -0.7749092, 1.702599, 0, 0.4235294, 1, 1,
0.3309771, -1.393801, 0.65347, 0, 0.4196078, 1, 1,
0.3408829, 0.07428154, 1.038823, 0, 0.4117647, 1, 1,
0.3418373, -1.648433, 3.444687, 0, 0.4078431, 1, 1,
0.3436986, 0.3082375, 2.171402, 0, 0.4, 1, 1,
0.3516841, 0.4583091, 1.541192, 0, 0.3921569, 1, 1,
0.3519265, 0.183186, -0.1118919, 0, 0.3882353, 1, 1,
0.3548543, 1.346996, -0.5102935, 0, 0.3803922, 1, 1,
0.3553674, 1.889234, 1.437418, 0, 0.3764706, 1, 1,
0.3583145, 0.05372424, 1.651786, 0, 0.3686275, 1, 1,
0.3619843, 0.03916766, 1.797723, 0, 0.3647059, 1, 1,
0.3657813, -1.188993, 2.264183, 0, 0.3568628, 1, 1,
0.3665344, -0.3414869, 3.44615, 0, 0.3529412, 1, 1,
0.3666435, 1.488063, -0.03579092, 0, 0.345098, 1, 1,
0.3676902, -0.6306332, 2.950314, 0, 0.3411765, 1, 1,
0.37416, -0.4738362, 1.645009, 0, 0.3333333, 1, 1,
0.3795487, 0.1711421, 2.55584, 0, 0.3294118, 1, 1,
0.3803749, 0.4099277, -0.1357668, 0, 0.3215686, 1, 1,
0.3817693, -0.8254787, 3.797204, 0, 0.3176471, 1, 1,
0.3830391, 0.7130461, 0.03502505, 0, 0.3098039, 1, 1,
0.3830456, 1.701515, 0.4396432, 0, 0.3058824, 1, 1,
0.3851432, 0.419857, 0.7700029, 0, 0.2980392, 1, 1,
0.3876704, -2.192497, 2.558121, 0, 0.2901961, 1, 1,
0.3877241, -0.7371137, 2.995571, 0, 0.2862745, 1, 1,
0.38919, -0.7238792, 1.56803, 0, 0.2784314, 1, 1,
0.3895321, 0.5539197, -0.07984761, 0, 0.2745098, 1, 1,
0.3917401, -0.3809384, 0.9229271, 0, 0.2666667, 1, 1,
0.3925644, -1.347079, 0.3887614, 0, 0.2627451, 1, 1,
0.3994913, 1.477369, -1.313155, 0, 0.254902, 1, 1,
0.4013457, 1.673302, 0.3604108, 0, 0.2509804, 1, 1,
0.4027503, 1.655319, -0.1268507, 0, 0.2431373, 1, 1,
0.4093857, -0.2199714, 1.048933, 0, 0.2392157, 1, 1,
0.4099507, 0.39093, -1.163162, 0, 0.2313726, 1, 1,
0.411508, 0.6644205, 0.7550506, 0, 0.227451, 1, 1,
0.4144831, -0.9741325, 1.828362, 0, 0.2196078, 1, 1,
0.4147803, 0.71867, 0.5540692, 0, 0.2156863, 1, 1,
0.4156665, 0.4607377, -1.774836, 0, 0.2078431, 1, 1,
0.420058, -0.7096716, 3.554765, 0, 0.2039216, 1, 1,
0.4207832, -1.466173, 3.608051, 0, 0.1960784, 1, 1,
0.4212333, 1.267314, -1.811599, 0, 0.1882353, 1, 1,
0.4248993, 0.9304894, 0.5787424, 0, 0.1843137, 1, 1,
0.4253527, 0.6332753, 1.81655, 0, 0.1764706, 1, 1,
0.4257598, -1.024791, 3.231299, 0, 0.172549, 1, 1,
0.4261481, 2.089455, 1.211986, 0, 0.1647059, 1, 1,
0.4370282, 0.5360025, -0.9906533, 0, 0.1607843, 1, 1,
0.4372144, 0.1872306, 1.35551, 0, 0.1529412, 1, 1,
0.4410015, -0.3220335, 1.488521, 0, 0.1490196, 1, 1,
0.4411004, 0.3957633, 1.893014, 0, 0.1411765, 1, 1,
0.4419723, 0.51744, 1.641047, 0, 0.1372549, 1, 1,
0.4424097, -1.370375, 2.767932, 0, 0.1294118, 1, 1,
0.4478251, 0.8342668, 0.1826811, 0, 0.1254902, 1, 1,
0.449666, 0.3144016, 0.7077094, 0, 0.1176471, 1, 1,
0.4508046, -0.0143965, -0.1081656, 0, 0.1137255, 1, 1,
0.4530704, 1.358153, 0.7717918, 0, 0.1058824, 1, 1,
0.4556692, 1.864595, -0.20625, 0, 0.09803922, 1, 1,
0.4557325, 0.9363454, 1.91837, 0, 0.09411765, 1, 1,
0.4581505, 0.4931956, 0.5256613, 0, 0.08627451, 1, 1,
0.4587849, -0.7812576, 3.855687, 0, 0.08235294, 1, 1,
0.4616406, 0.1757026, 3.436581, 0, 0.07450981, 1, 1,
0.468152, -0.7647851, 4.103225, 0, 0.07058824, 1, 1,
0.4700641, 1.833075, 0.2917574, 0, 0.0627451, 1, 1,
0.4703271, -0.3414359, 0.8489108, 0, 0.05882353, 1, 1,
0.4713563, -0.07145354, 0.3458147, 0, 0.05098039, 1, 1,
0.4720754, -0.4063013, 2.987469, 0, 0.04705882, 1, 1,
0.4730049, -1.374782, 4.706296, 0, 0.03921569, 1, 1,
0.4794383, 0.425611, 0.2654075, 0, 0.03529412, 1, 1,
0.4916197, 1.126666, -0.5173717, 0, 0.02745098, 1, 1,
0.4952642, -0.464407, 3.407968, 0, 0.02352941, 1, 1,
0.5022894, -1.005911, 4.788366, 0, 0.01568628, 1, 1,
0.5039175, -0.4377038, 4.151275, 0, 0.01176471, 1, 1,
0.5062015, -0.2024326, 1.695233, 0, 0.003921569, 1, 1,
0.5118278, -0.1606422, 1.358962, 0.003921569, 0, 1, 1,
0.51251, 0.9483744, -1.462842, 0.007843138, 0, 1, 1,
0.5134931, 2.209028, -1.545952, 0.01568628, 0, 1, 1,
0.5149962, 1.579684, -0.2750285, 0.01960784, 0, 1, 1,
0.515731, 0.6276517, -0.08662134, 0.02745098, 0, 1, 1,
0.5170323, 1.164013, 0.7048445, 0.03137255, 0, 1, 1,
0.5192046, 0.6215794, 0.3681481, 0.03921569, 0, 1, 1,
0.5248338, 0.9956203, 2.903204, 0.04313726, 0, 1, 1,
0.5259992, -0.06057968, 2.893036, 0.05098039, 0, 1, 1,
0.5261831, -1.603891, 3.00902, 0.05490196, 0, 1, 1,
0.5267233, -0.7274275, 2.536231, 0.0627451, 0, 1, 1,
0.5310189, 0.9055507, 2.09952, 0.06666667, 0, 1, 1,
0.534723, -1.553777, 3.03411, 0.07450981, 0, 1, 1,
0.547628, 0.6718349, -0.0333637, 0.07843138, 0, 1, 1,
0.5476614, -0.972187, 2.456261, 0.08627451, 0, 1, 1,
0.5494834, -1.271213, 3.360563, 0.09019608, 0, 1, 1,
0.553769, -0.8034706, 3.078699, 0.09803922, 0, 1, 1,
0.5545977, -1.832994, 2.720846, 0.1058824, 0, 1, 1,
0.5601955, 0.3232548, 1.40767, 0.1098039, 0, 1, 1,
0.5605091, -0.2827444, 1.28641, 0.1176471, 0, 1, 1,
0.561469, -0.4335586, 0.9877018, 0.1215686, 0, 1, 1,
0.562564, 0.5060581, -0.6637158, 0.1294118, 0, 1, 1,
0.5639167, -0.1960202, 2.035063, 0.1333333, 0, 1, 1,
0.5667716, -1.963953, 2.026298, 0.1411765, 0, 1, 1,
0.5721182, 0.4701813, -0.02762868, 0.145098, 0, 1, 1,
0.5868893, -1.128224, 4.918811, 0.1529412, 0, 1, 1,
0.5875886, 1.198781, 0.4197293, 0.1568628, 0, 1, 1,
0.5942563, 0.6852219, 2.262023, 0.1647059, 0, 1, 1,
0.5953696, -1.494721, 5.125538, 0.1686275, 0, 1, 1,
0.5963024, -1.472898, 1.783324, 0.1764706, 0, 1, 1,
0.5969926, 1.802936, 2.2193, 0.1803922, 0, 1, 1,
0.5980574, -1.18208, 2.579467, 0.1882353, 0, 1, 1,
0.5990233, 0.3472746, 1.876518, 0.1921569, 0, 1, 1,
0.6003409, -0.06596638, 0.8237394, 0.2, 0, 1, 1,
0.6077477, -0.6082059, 1.710104, 0.2078431, 0, 1, 1,
0.608009, -0.626626, 0.7095584, 0.2117647, 0, 1, 1,
0.6113808, 1.24116, -1.099748, 0.2196078, 0, 1, 1,
0.6113966, 0.5404395, 0.6341621, 0.2235294, 0, 1, 1,
0.6149707, 1.343605, 1.143708, 0.2313726, 0, 1, 1,
0.6161372, -0.04358707, 2.729867, 0.2352941, 0, 1, 1,
0.6201208, 0.6282869, 1.608027, 0.2431373, 0, 1, 1,
0.6202649, 0.7736304, -0.1838927, 0.2470588, 0, 1, 1,
0.6230842, -1.799521, 2.618055, 0.254902, 0, 1, 1,
0.6303334, -0.9645388, 3.96174, 0.2588235, 0, 1, 1,
0.6319649, 1.348582, 0.1761209, 0.2666667, 0, 1, 1,
0.6356876, 0.6490054, 0.621833, 0.2705882, 0, 1, 1,
0.6395435, -0.4231402, 1.543065, 0.2784314, 0, 1, 1,
0.6448085, -0.6158943, 3.409256, 0.282353, 0, 1, 1,
0.6448693, -0.8981597, 3.859745, 0.2901961, 0, 1, 1,
0.645251, 0.1083159, 2.924858, 0.2941177, 0, 1, 1,
0.6457277, -0.2198592, 2.054551, 0.3019608, 0, 1, 1,
0.6495044, -2.353977, 3.446341, 0.3098039, 0, 1, 1,
0.653253, -0.4858492, 4.487394, 0.3137255, 0, 1, 1,
0.6543455, 0.4600111, -0.2515489, 0.3215686, 0, 1, 1,
0.65675, -0.0007856514, 1.753385, 0.3254902, 0, 1, 1,
0.6599677, -0.005132011, 2.148828, 0.3333333, 0, 1, 1,
0.6600021, -1.316868, 1.154806, 0.3372549, 0, 1, 1,
0.6610518, -0.04704515, 3.151074, 0.345098, 0, 1, 1,
0.662733, 0.8906323, 0.02174545, 0.3490196, 0, 1, 1,
0.6659026, 0.6104496, -0.2864267, 0.3568628, 0, 1, 1,
0.6728085, -0.924929, 3.454636, 0.3607843, 0, 1, 1,
0.6757104, 0.5961448, 0.6868051, 0.3686275, 0, 1, 1,
0.6840894, 0.03940547, 0.9958522, 0.372549, 0, 1, 1,
0.6886777, 1.329172, -0.6980491, 0.3803922, 0, 1, 1,
0.6895248, -0.5804437, 2.302547, 0.3843137, 0, 1, 1,
0.6936153, -0.8170163, 2.932459, 0.3921569, 0, 1, 1,
0.6971932, -0.1216455, 3.530007, 0.3960784, 0, 1, 1,
0.6979558, -0.2523525, 1.267833, 0.4039216, 0, 1, 1,
0.700482, -0.7121487, 2.218263, 0.4117647, 0, 1, 1,
0.7053901, -0.2065491, 2.026443, 0.4156863, 0, 1, 1,
0.7072052, -0.8251616, 2.656886, 0.4235294, 0, 1, 1,
0.7077104, -0.8993114, 1.973852, 0.427451, 0, 1, 1,
0.7167965, 0.4951058, 0.3471937, 0.4352941, 0, 1, 1,
0.7175923, -1.04611, 0.8057683, 0.4392157, 0, 1, 1,
0.7219405, 0.3292226, 1.325184, 0.4470588, 0, 1, 1,
0.7234156, 0.5762814, 0.7710713, 0.4509804, 0, 1, 1,
0.7248905, -1.101632, 3.198751, 0.4588235, 0, 1, 1,
0.7284653, 0.4752845, 2.393606, 0.4627451, 0, 1, 1,
0.7295487, 0.427937, 0.7483429, 0.4705882, 0, 1, 1,
0.7302035, 0.9723699, -1.20282, 0.4745098, 0, 1, 1,
0.7304645, -1.606092, 3.392541, 0.4823529, 0, 1, 1,
0.7404717, 1.135235, 0.3243194, 0.4862745, 0, 1, 1,
0.7407656, 0.2182828, 2.032399, 0.4941176, 0, 1, 1,
0.741484, 1.278584, -0.7754043, 0.5019608, 0, 1, 1,
0.7478181, 1.183776, 1.499495, 0.5058824, 0, 1, 1,
0.7530566, -1.367964, 1.826602, 0.5137255, 0, 1, 1,
0.7532973, 0.5400294, 3.311525, 0.5176471, 0, 1, 1,
0.7552519, -1.115529, 1.514242, 0.5254902, 0, 1, 1,
0.7563297, -0.3682614, 1.708432, 0.5294118, 0, 1, 1,
0.7610828, -0.3023642, 1.540468, 0.5372549, 0, 1, 1,
0.7644393, -0.3724644, 3.508411, 0.5411765, 0, 1, 1,
0.7676471, -2.048712, 1.11902, 0.5490196, 0, 1, 1,
0.7696092, 1.339779, 1.869808, 0.5529412, 0, 1, 1,
0.7744318, 1.101226, 1.535599, 0.5607843, 0, 1, 1,
0.774613, -1.207273, 1.200096, 0.5647059, 0, 1, 1,
0.7806432, 0.4229167, 0.6550688, 0.572549, 0, 1, 1,
0.7834684, -1.264407, 3.172868, 0.5764706, 0, 1, 1,
0.7845723, -0.5948178, 3.974964, 0.5843138, 0, 1, 1,
0.7849019, -0.8217039, 1.566167, 0.5882353, 0, 1, 1,
0.7883251, -0.2745705, 0.9403466, 0.5960785, 0, 1, 1,
0.7956652, -0.6448399, 1.000802, 0.6039216, 0, 1, 1,
0.800976, -1.201009, 0.6979241, 0.6078432, 0, 1, 1,
0.8018274, 0.8568005, -0.08624197, 0.6156863, 0, 1, 1,
0.8029215, -1.436007, 2.932808, 0.6196079, 0, 1, 1,
0.8043461, -1.724675, 2.666043, 0.627451, 0, 1, 1,
0.8057979, -1.079993, 2.89562, 0.6313726, 0, 1, 1,
0.8063585, -0.4232979, 2.002178, 0.6392157, 0, 1, 1,
0.8079528, 1.219962, 0.8785682, 0.6431373, 0, 1, 1,
0.8154767, -0.4666094, 3.11728, 0.6509804, 0, 1, 1,
0.8179433, -1.494286, 4.573359, 0.654902, 0, 1, 1,
0.8179685, -1.921925, 2.672339, 0.6627451, 0, 1, 1,
0.8263031, -0.3260624, 1.916328, 0.6666667, 0, 1, 1,
0.8276358, -0.8138852, 1.847833, 0.6745098, 0, 1, 1,
0.8368086, 0.2286635, 1.252666, 0.6784314, 0, 1, 1,
0.8451285, 1.836554, 0.3138341, 0.6862745, 0, 1, 1,
0.8483461, -1.384711, 1.948828, 0.6901961, 0, 1, 1,
0.8483685, 0.26209, -0.09299714, 0.6980392, 0, 1, 1,
0.8521714, -0.3874371, 2.642231, 0.7058824, 0, 1, 1,
0.8611391, 2.073142, 0.8243926, 0.7098039, 0, 1, 1,
0.8646501, -1.826602, 1.340694, 0.7176471, 0, 1, 1,
0.8656429, 0.4809313, 1.789713, 0.7215686, 0, 1, 1,
0.8688236, -1.284332, 3.654303, 0.7294118, 0, 1, 1,
0.8706624, -1.435502, 3.26568, 0.7333333, 0, 1, 1,
0.8720529, 0.4286185, 1.002865, 0.7411765, 0, 1, 1,
0.8794559, -0.478974, 3.126914, 0.7450981, 0, 1, 1,
0.8817641, -0.07225791, 1.186632, 0.7529412, 0, 1, 1,
0.88925, -0.1583594, 2.415476, 0.7568628, 0, 1, 1,
0.8934731, -0.2310881, -1.062287, 0.7647059, 0, 1, 1,
0.8980854, -0.6905532, 2.774843, 0.7686275, 0, 1, 1,
0.900154, 1.103125, 1.046683, 0.7764706, 0, 1, 1,
0.9016878, -0.1648823, 0.9574246, 0.7803922, 0, 1, 1,
0.9067843, -0.2384126, 1.029101, 0.7882353, 0, 1, 1,
0.9070465, 2.206378, 0.8970632, 0.7921569, 0, 1, 1,
0.9089442, -0.94421, 3.172886, 0.8, 0, 1, 1,
0.9103718, 0.6330138, 2.258952, 0.8078431, 0, 1, 1,
0.910939, -0.7258269, 1.395445, 0.8117647, 0, 1, 1,
0.9194138, 0.3569736, 1.415927, 0.8196079, 0, 1, 1,
0.9234456, 1.696688, -0.04981718, 0.8235294, 0, 1, 1,
0.9274248, 0.3186746, 2.395511, 0.8313726, 0, 1, 1,
0.9330472, -0.1288111, 1.400633, 0.8352941, 0, 1, 1,
0.9360354, -0.545156, 1.886481, 0.8431373, 0, 1, 1,
0.9372665, -1.227579, 1.543944, 0.8470588, 0, 1, 1,
0.9405306, -0.4146977, 1.478398, 0.854902, 0, 1, 1,
0.9406021, 0.2024095, 1.778823, 0.8588235, 0, 1, 1,
0.942243, -0.1228074, -0.99593, 0.8666667, 0, 1, 1,
0.9434744, 1.48093, 0.7428654, 0.8705882, 0, 1, 1,
0.9512248, 0.5620195, 1.30443, 0.8784314, 0, 1, 1,
0.9515635, 1.111368, 2.419409, 0.8823529, 0, 1, 1,
0.9530587, -0.4508091, 2.684271, 0.8901961, 0, 1, 1,
0.953562, -0.8369328, 1.968539, 0.8941177, 0, 1, 1,
0.9589429, -0.8858762, 2.483019, 0.9019608, 0, 1, 1,
0.9592229, 0.04262417, 0.7613668, 0.9098039, 0, 1, 1,
0.9699441, -2.673865, 3.733065, 0.9137255, 0, 1, 1,
0.9823545, 0.8620862, 0.7552636, 0.9215686, 0, 1, 1,
0.988193, -0.3942188, 2.086358, 0.9254902, 0, 1, 1,
0.989365, -0.647519, 1.388928, 0.9333333, 0, 1, 1,
0.9895217, -0.4568835, 1.290727, 0.9372549, 0, 1, 1,
0.9975165, 1.139073, 0.5840448, 0.945098, 0, 1, 1,
1.005074, -0.1118284, -0.6340246, 0.9490196, 0, 1, 1,
1.00601, 1.606943, 0.5629343, 0.9568627, 0, 1, 1,
1.008333, 0.3687171, 1.749495, 0.9607843, 0, 1, 1,
1.011663, -1.506679, 1.558821, 0.9686275, 0, 1, 1,
1.015529, 0.7331362, 0.6787614, 0.972549, 0, 1, 1,
1.015974, -0.433896, 1.429287, 0.9803922, 0, 1, 1,
1.019594, -0.2642806, 3.919505, 0.9843137, 0, 1, 1,
1.023653, -1.224243, 1.805434, 0.9921569, 0, 1, 1,
1.031243, -0.6973718, 0.5916092, 0.9960784, 0, 1, 1,
1.032573, -0.872786, 2.13929, 1, 0, 0.9960784, 1,
1.034851, 0.7640759, 0.9441959, 1, 0, 0.9882353, 1,
1.036869, 0.25549, 1.391121, 1, 0, 0.9843137, 1,
1.037189, 0.001425367, 1.380927, 1, 0, 0.9764706, 1,
1.040839, -0.2430609, 1.280839, 1, 0, 0.972549, 1,
1.046725, -0.2647372, 2.529811, 1, 0, 0.9647059, 1,
1.047535, 1.185994, 0.7062538, 1, 0, 0.9607843, 1,
1.047646, 0.06598487, 2.532303, 1, 0, 0.9529412, 1,
1.048255, 0.4939457, -0.2432555, 1, 0, 0.9490196, 1,
1.048769, 3.100912, -0.8225015, 1, 0, 0.9411765, 1,
1.050189, 0.9577132, 2.612605, 1, 0, 0.9372549, 1,
1.051379, 0.09926426, 0.2441198, 1, 0, 0.9294118, 1,
1.056351, -0.6692893, 0.3592808, 1, 0, 0.9254902, 1,
1.064564, -0.212416, 2.392532, 1, 0, 0.9176471, 1,
1.066581, -0.5953197, 1.126119, 1, 0, 0.9137255, 1,
1.073605, 0.3605163, -0.7312042, 1, 0, 0.9058824, 1,
1.073676, 1.054062, -0.09014285, 1, 0, 0.9019608, 1,
1.076639, -1.55653, 1.774605, 1, 0, 0.8941177, 1,
1.076911, 0.01766666, 0.6683007, 1, 0, 0.8862745, 1,
1.081531, -0.3159891, 2.071063, 1, 0, 0.8823529, 1,
1.0829, -1.867378, 3.814708, 1, 0, 0.8745098, 1,
1.08693, -0.4840631, 1.017552, 1, 0, 0.8705882, 1,
1.087248, 1.144816, 1.604179, 1, 0, 0.8627451, 1,
1.088404, -0.009078261, 1.437967, 1, 0, 0.8588235, 1,
1.097375, -0.3112395, 2.193438, 1, 0, 0.8509804, 1,
1.101193, 1.032928, 1.237324, 1, 0, 0.8470588, 1,
1.10593, 0.552435, 1.481196, 1, 0, 0.8392157, 1,
1.11119, 1.320729, -0.7292855, 1, 0, 0.8352941, 1,
1.118296, 0.3613669, 3.085779, 1, 0, 0.827451, 1,
1.12958, 0.1704002, 2.46907, 1, 0, 0.8235294, 1,
1.143373, -1.817839, 1.290401, 1, 0, 0.8156863, 1,
1.145906, -1.958862, 4.990229, 1, 0, 0.8117647, 1,
1.146827, 0.7095438, 0.4376203, 1, 0, 0.8039216, 1,
1.153068, 0.4351943, 1.162315, 1, 0, 0.7960784, 1,
1.158702, 0.4485941, 0.4095772, 1, 0, 0.7921569, 1,
1.161986, 0.2531162, -0.281591, 1, 0, 0.7843137, 1,
1.169032, -0.7593414, 2.613274, 1, 0, 0.7803922, 1,
1.172865, -0.5169377, 1.442656, 1, 0, 0.772549, 1,
1.174269, 1.472349, 1.236344, 1, 0, 0.7686275, 1,
1.178373, 0.194744, 0.6628245, 1, 0, 0.7607843, 1,
1.178422, 0.5164864, 0.3335034, 1, 0, 0.7568628, 1,
1.186334, 0.3407055, 0.2805231, 1, 0, 0.7490196, 1,
1.189812, 0.4796603, 0.3098084, 1, 0, 0.7450981, 1,
1.194185, -0.1924614, 2.728372, 1, 0, 0.7372549, 1,
1.204938, -0.008870556, 1.326153, 1, 0, 0.7333333, 1,
1.211725, 0.3696551, 1.282646, 1, 0, 0.7254902, 1,
1.215639, -0.2166866, 1.874605, 1, 0, 0.7215686, 1,
1.225971, 1.168254, 0.2779611, 1, 0, 0.7137255, 1,
1.22699, 1.560235, 0.9418615, 1, 0, 0.7098039, 1,
1.236593, -0.03962237, 3.162089, 1, 0, 0.7019608, 1,
1.237947, -0.9459215, 1.229662, 1, 0, 0.6941177, 1,
1.238692, -0.3978227, 3.332855, 1, 0, 0.6901961, 1,
1.238867, -0.9167452, 1.622366, 1, 0, 0.682353, 1,
1.244152, 0.9456717, 0.2378284, 1, 0, 0.6784314, 1,
1.245025, 0.4421188, 0.9512731, 1, 0, 0.6705883, 1,
1.247137, -1.974226, 2.482696, 1, 0, 0.6666667, 1,
1.255225, 0.672716, 1.038693, 1, 0, 0.6588235, 1,
1.258937, -1.140738, 3.901213, 1, 0, 0.654902, 1,
1.259557, -0.412291, 0.8970703, 1, 0, 0.6470588, 1,
1.262202, 2.481597, 2.339865, 1, 0, 0.6431373, 1,
1.262781, 0.4097976, 2.870293, 1, 0, 0.6352941, 1,
1.270714, -1.779302, 2.426942, 1, 0, 0.6313726, 1,
1.273221, -1.033754, 2.218395, 1, 0, 0.6235294, 1,
1.278088, 0.507216, 2.231439, 1, 0, 0.6196079, 1,
1.310709, -0.6948203, 0.7514612, 1, 0, 0.6117647, 1,
1.324939, -0.3802015, 2.609775, 1, 0, 0.6078432, 1,
1.327061, -1.367908, 2.007684, 1, 0, 0.6, 1,
1.330792, 1.161875, 0.7698197, 1, 0, 0.5921569, 1,
1.334957, -0.2823038, 0.8187048, 1, 0, 0.5882353, 1,
1.341193, -0.957221, 3.060282, 1, 0, 0.5803922, 1,
1.343328, 0.4407379, 0.4076581, 1, 0, 0.5764706, 1,
1.35006, -0.4389813, 2.362929, 1, 0, 0.5686275, 1,
1.352495, -0.4141873, 2.384344, 1, 0, 0.5647059, 1,
1.374899, -0.3962458, 0.9333867, 1, 0, 0.5568628, 1,
1.383323, 0.6251738, 2.322559, 1, 0, 0.5529412, 1,
1.385749, 0.4116841, 1.078518, 1, 0, 0.5450981, 1,
1.391652, -1.476385, 3.611582, 1, 0, 0.5411765, 1,
1.408015, 0.5764696, 0.04611324, 1, 0, 0.5333334, 1,
1.416066, -0.04234728, 1.146828, 1, 0, 0.5294118, 1,
1.437395, 0.5511187, 1.966022, 1, 0, 0.5215687, 1,
1.457995, 0.6207268, -0.857217, 1, 0, 0.5176471, 1,
1.460994, -1.051374, 1.104524, 1, 0, 0.509804, 1,
1.466864, -0.6098961, 5.253652, 1, 0, 0.5058824, 1,
1.48374, -0.1549502, 2.248075, 1, 0, 0.4980392, 1,
1.484773, -0.6642802, 1.820393, 1, 0, 0.4901961, 1,
1.486821, 2.158268, -0.6733046, 1, 0, 0.4862745, 1,
1.497629, 0.8082205, 0.8756809, 1, 0, 0.4784314, 1,
1.51008, 0.153677, 1.481038, 1, 0, 0.4745098, 1,
1.526978, -0.3877223, 2.446326, 1, 0, 0.4666667, 1,
1.52857, -1.071411, 4.680264, 1, 0, 0.4627451, 1,
1.543399, 0.5935366, 0.3280078, 1, 0, 0.454902, 1,
1.547685, -1.4898, 1.882155, 1, 0, 0.4509804, 1,
1.568929, -0.05024964, 1.741152, 1, 0, 0.4431373, 1,
1.596788, -2.110332, 1.956733, 1, 0, 0.4392157, 1,
1.609807, 1.037196, 3.105409, 1, 0, 0.4313726, 1,
1.611813, -0.4973689, 1.209451, 1, 0, 0.427451, 1,
1.622432, 0.02895989, 1.051856, 1, 0, 0.4196078, 1,
1.622846, -0.1532238, -0.06354751, 1, 0, 0.4156863, 1,
1.629823, 1.599383, 0.491792, 1, 0, 0.4078431, 1,
1.630876, -0.6300995, 1.463462, 1, 0, 0.4039216, 1,
1.632127, 0.3584847, 2.560393, 1, 0, 0.3960784, 1,
1.638369, 0.7349098, 2.625352, 1, 0, 0.3882353, 1,
1.65042, -2.179189, 2.81595, 1, 0, 0.3843137, 1,
1.674164, -0.5170295, 3.079242, 1, 0, 0.3764706, 1,
1.680182, 0.4981094, 0.6192561, 1, 0, 0.372549, 1,
1.686417, 0.6640942, 2.08322, 1, 0, 0.3647059, 1,
1.690018, 1.033368, 1.760729, 1, 0, 0.3607843, 1,
1.693851, 0.4286943, -1.779388, 1, 0, 0.3529412, 1,
1.697966, 0.3168484, 0.8068831, 1, 0, 0.3490196, 1,
1.710158, -0.7997949, 1.753992, 1, 0, 0.3411765, 1,
1.713441, 0.9355802, 1.853459, 1, 0, 0.3372549, 1,
1.717915, 0.235891, -0.3860217, 1, 0, 0.3294118, 1,
1.722277, -1.421778, 2.507659, 1, 0, 0.3254902, 1,
1.725784, -1.389848, 2.249602, 1, 0, 0.3176471, 1,
1.733264, -0.9160179, 3.146131, 1, 0, 0.3137255, 1,
1.745683, -1.876644, 2.51483, 1, 0, 0.3058824, 1,
1.761289, 0.7170991, 0.4287829, 1, 0, 0.2980392, 1,
1.767789, 0.8755447, 1.137138, 1, 0, 0.2941177, 1,
1.796628, -1.64927, 1.392171, 1, 0, 0.2862745, 1,
1.799717, 1.1276, 0.315836, 1, 0, 0.282353, 1,
1.805446, 0.6424028, 1.353788, 1, 0, 0.2745098, 1,
1.820642, -0.1567532, 1.140561, 1, 0, 0.2705882, 1,
1.847453, -0.6343184, 1.370897, 1, 0, 0.2627451, 1,
1.867026, -0.04761563, 1.322202, 1, 0, 0.2588235, 1,
1.872156, -0.7183276, 1.641704, 1, 0, 0.2509804, 1,
1.87651, -0.1527228, 0.5969547, 1, 0, 0.2470588, 1,
1.880273, 1.707154, 0.8489842, 1, 0, 0.2392157, 1,
1.888431, -0.3674176, 0.9764985, 1, 0, 0.2352941, 1,
1.8965, -1.608191, 3.720377, 1, 0, 0.227451, 1,
1.912456, -0.2173288, 4.648702, 1, 0, 0.2235294, 1,
1.939744, 0.6509104, 1.167136, 1, 0, 0.2156863, 1,
1.948969, -0.8588766, 4.839293, 1, 0, 0.2117647, 1,
1.950011, -1.343031, 2.599299, 1, 0, 0.2039216, 1,
1.960861, -0.3836109, 2.441767, 1, 0, 0.1960784, 1,
1.963777, 0.7299854, -0.8848996, 1, 0, 0.1921569, 1,
1.963907, -0.7001684, 2.83559, 1, 0, 0.1843137, 1,
1.976226, -0.9334377, 0.6382579, 1, 0, 0.1803922, 1,
2.011046, 1.662845, 1.626108, 1, 0, 0.172549, 1,
2.015885, -0.2409138, 2.3841, 1, 0, 0.1686275, 1,
2.024519, 1.094532, -0.02806458, 1, 0, 0.1607843, 1,
2.033278, -0.7802799, 2.97749, 1, 0, 0.1568628, 1,
2.03395, -1.75979, 2.99342, 1, 0, 0.1490196, 1,
2.050965, -0.1988072, 0.9272299, 1, 0, 0.145098, 1,
2.110435, 0.6040545, 2.012567, 1, 0, 0.1372549, 1,
2.13133, -0.919232, 2.759039, 1, 0, 0.1333333, 1,
2.147089, 0.009365219, 0.3217513, 1, 0, 0.1254902, 1,
2.165395, 2.046297, -0.5595875, 1, 0, 0.1215686, 1,
2.249405, -0.6471771, 0.3268775, 1, 0, 0.1137255, 1,
2.260391, 0.478892, 1.778787, 1, 0, 0.1098039, 1,
2.282883, -0.1374099, 0.1848352, 1, 0, 0.1019608, 1,
2.318775, -1.165516, 2.253556, 1, 0, 0.09411765, 1,
2.384815, -2.255966, 1.539368, 1, 0, 0.09019608, 1,
2.425829, 0.5966595, 1.741791, 1, 0, 0.08235294, 1,
2.426342, -0.09645084, 0.228186, 1, 0, 0.07843138, 1,
2.427726, -0.2872975, 2.866586, 1, 0, 0.07058824, 1,
2.445631, -0.4003969, 0.500537, 1, 0, 0.06666667, 1,
2.508488, -0.8189556, 0.5440509, 1, 0, 0.05882353, 1,
2.633593, 1.058459, 2.150213, 1, 0, 0.05490196, 1,
2.71489, -1.357837, 3.033465, 1, 0, 0.04705882, 1,
2.721251, -0.5585333, 1.637562, 1, 0, 0.04313726, 1,
2.742371, 0.430233, 2.609473, 1, 0, 0.03529412, 1,
2.789752, -1.008589, 1.048583, 1, 0, 0.03137255, 1,
2.846462, -0.08510349, 1.265467, 1, 0, 0.02352941, 1,
2.965821, 0.7214519, 0.9484136, 1, 0, 0.01960784, 1,
2.968385, 0.6658458, 2.409349, 1, 0, 0.01176471, 1,
3.166106, -0.9706182, 3.212558, 1, 0, 0.007843138, 1
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
0.05812907, -4.272474, -7.464612, 0, -0.5, 0.5, 0.5,
0.05812907, -4.272474, -7.464612, 1, -0.5, 0.5, 0.5,
0.05812907, -4.272474, -7.464612, 1, 1.5, 0.5, 0.5,
0.05812907, -4.272474, -7.464612, 0, 1.5, 0.5, 0.5
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
-4.103452, -0.05145526, -7.464612, 0, -0.5, 0.5, 0.5,
-4.103452, -0.05145526, -7.464612, 1, -0.5, 0.5, 0.5,
-4.103452, -0.05145526, -7.464612, 1, 1.5, 0.5, 0.5,
-4.103452, -0.05145526, -7.464612, 0, 1.5, 0.5, 0.5
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
-4.103452, -4.272474, -0.1838276, 0, -0.5, 0.5, 0.5,
-4.103452, -4.272474, -0.1838276, 1, -0.5, 0.5, 0.5,
-4.103452, -4.272474, -0.1838276, 1, 1.5, 0.5, 0.5,
-4.103452, -4.272474, -0.1838276, 0, 1.5, 0.5, 0.5
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
-3, -3.298393, -5.784431,
3, -3.298393, -5.784431,
-3, -3.298393, -5.784431,
-3, -3.46074, -6.064461,
-2, -3.298393, -5.784431,
-2, -3.46074, -6.064461,
-1, -3.298393, -5.784431,
-1, -3.46074, -6.064461,
0, -3.298393, -5.784431,
0, -3.46074, -6.064461,
1, -3.298393, -5.784431,
1, -3.46074, -6.064461,
2, -3.298393, -5.784431,
2, -3.46074, -6.064461,
3, -3.298393, -5.784431,
3, -3.46074, -6.064461
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
-3, -3.785434, -6.624522, 0, -0.5, 0.5, 0.5,
-3, -3.785434, -6.624522, 1, -0.5, 0.5, 0.5,
-3, -3.785434, -6.624522, 1, 1.5, 0.5, 0.5,
-3, -3.785434, -6.624522, 0, 1.5, 0.5, 0.5,
-2, -3.785434, -6.624522, 0, -0.5, 0.5, 0.5,
-2, -3.785434, -6.624522, 1, -0.5, 0.5, 0.5,
-2, -3.785434, -6.624522, 1, 1.5, 0.5, 0.5,
-2, -3.785434, -6.624522, 0, 1.5, 0.5, 0.5,
-1, -3.785434, -6.624522, 0, -0.5, 0.5, 0.5,
-1, -3.785434, -6.624522, 1, -0.5, 0.5, 0.5,
-1, -3.785434, -6.624522, 1, 1.5, 0.5, 0.5,
-1, -3.785434, -6.624522, 0, 1.5, 0.5, 0.5,
0, -3.785434, -6.624522, 0, -0.5, 0.5, 0.5,
0, -3.785434, -6.624522, 1, -0.5, 0.5, 0.5,
0, -3.785434, -6.624522, 1, 1.5, 0.5, 0.5,
0, -3.785434, -6.624522, 0, 1.5, 0.5, 0.5,
1, -3.785434, -6.624522, 0, -0.5, 0.5, 0.5,
1, -3.785434, -6.624522, 1, -0.5, 0.5, 0.5,
1, -3.785434, -6.624522, 1, 1.5, 0.5, 0.5,
1, -3.785434, -6.624522, 0, 1.5, 0.5, 0.5,
2, -3.785434, -6.624522, 0, -0.5, 0.5, 0.5,
2, -3.785434, -6.624522, 1, -0.5, 0.5, 0.5,
2, -3.785434, -6.624522, 1, 1.5, 0.5, 0.5,
2, -3.785434, -6.624522, 0, 1.5, 0.5, 0.5,
3, -3.785434, -6.624522, 0, -0.5, 0.5, 0.5,
3, -3.785434, -6.624522, 1, -0.5, 0.5, 0.5,
3, -3.785434, -6.624522, 1, 1.5, 0.5, 0.5,
3, -3.785434, -6.624522, 0, 1.5, 0.5, 0.5
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
-3.143087, -3, -5.784431,
-3.143087, 3, -5.784431,
-3.143087, -3, -5.784431,
-3.303148, -3, -6.064461,
-3.143087, -2, -5.784431,
-3.303148, -2, -6.064461,
-3.143087, -1, -5.784431,
-3.303148, -1, -6.064461,
-3.143087, 0, -5.784431,
-3.303148, 0, -6.064461,
-3.143087, 1, -5.784431,
-3.303148, 1, -6.064461,
-3.143087, 2, -5.784431,
-3.303148, 2, -6.064461,
-3.143087, 3, -5.784431,
-3.303148, 3, -6.064461
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
-3.62327, -3, -6.624522, 0, -0.5, 0.5, 0.5,
-3.62327, -3, -6.624522, 1, -0.5, 0.5, 0.5,
-3.62327, -3, -6.624522, 1, 1.5, 0.5, 0.5,
-3.62327, -3, -6.624522, 0, 1.5, 0.5, 0.5,
-3.62327, -2, -6.624522, 0, -0.5, 0.5, 0.5,
-3.62327, -2, -6.624522, 1, -0.5, 0.5, 0.5,
-3.62327, -2, -6.624522, 1, 1.5, 0.5, 0.5,
-3.62327, -2, -6.624522, 0, 1.5, 0.5, 0.5,
-3.62327, -1, -6.624522, 0, -0.5, 0.5, 0.5,
-3.62327, -1, -6.624522, 1, -0.5, 0.5, 0.5,
-3.62327, -1, -6.624522, 1, 1.5, 0.5, 0.5,
-3.62327, -1, -6.624522, 0, 1.5, 0.5, 0.5,
-3.62327, 0, -6.624522, 0, -0.5, 0.5, 0.5,
-3.62327, 0, -6.624522, 1, -0.5, 0.5, 0.5,
-3.62327, 0, -6.624522, 1, 1.5, 0.5, 0.5,
-3.62327, 0, -6.624522, 0, 1.5, 0.5, 0.5,
-3.62327, 1, -6.624522, 0, -0.5, 0.5, 0.5,
-3.62327, 1, -6.624522, 1, -0.5, 0.5, 0.5,
-3.62327, 1, -6.624522, 1, 1.5, 0.5, 0.5,
-3.62327, 1, -6.624522, 0, 1.5, 0.5, 0.5,
-3.62327, 2, -6.624522, 0, -0.5, 0.5, 0.5,
-3.62327, 2, -6.624522, 1, -0.5, 0.5, 0.5,
-3.62327, 2, -6.624522, 1, 1.5, 0.5, 0.5,
-3.62327, 2, -6.624522, 0, 1.5, 0.5, 0.5,
-3.62327, 3, -6.624522, 0, -0.5, 0.5, 0.5,
-3.62327, 3, -6.624522, 1, -0.5, 0.5, 0.5,
-3.62327, 3, -6.624522, 1, 1.5, 0.5, 0.5,
-3.62327, 3, -6.624522, 0, 1.5, 0.5, 0.5
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
-3.143087, -3.298393, -4,
-3.143087, -3.298393, 4,
-3.143087, -3.298393, -4,
-3.303148, -3.46074, -4,
-3.143087, -3.298393, -2,
-3.303148, -3.46074, -2,
-3.143087, -3.298393, 0,
-3.303148, -3.46074, 0,
-3.143087, -3.298393, 2,
-3.303148, -3.46074, 2,
-3.143087, -3.298393, 4,
-3.303148, -3.46074, 4
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
-3.62327, -3.785434, -4, 0, -0.5, 0.5, 0.5,
-3.62327, -3.785434, -4, 1, -0.5, 0.5, 0.5,
-3.62327, -3.785434, -4, 1, 1.5, 0.5, 0.5,
-3.62327, -3.785434, -4, 0, 1.5, 0.5, 0.5,
-3.62327, -3.785434, -2, 0, -0.5, 0.5, 0.5,
-3.62327, -3.785434, -2, 1, -0.5, 0.5, 0.5,
-3.62327, -3.785434, -2, 1, 1.5, 0.5, 0.5,
-3.62327, -3.785434, -2, 0, 1.5, 0.5, 0.5,
-3.62327, -3.785434, 0, 0, -0.5, 0.5, 0.5,
-3.62327, -3.785434, 0, 1, -0.5, 0.5, 0.5,
-3.62327, -3.785434, 0, 1, 1.5, 0.5, 0.5,
-3.62327, -3.785434, 0, 0, 1.5, 0.5, 0.5,
-3.62327, -3.785434, 2, 0, -0.5, 0.5, 0.5,
-3.62327, -3.785434, 2, 1, -0.5, 0.5, 0.5,
-3.62327, -3.785434, 2, 1, 1.5, 0.5, 0.5,
-3.62327, -3.785434, 2, 0, 1.5, 0.5, 0.5,
-3.62327, -3.785434, 4, 0, -0.5, 0.5, 0.5,
-3.62327, -3.785434, 4, 1, -0.5, 0.5, 0.5,
-3.62327, -3.785434, 4, 1, 1.5, 0.5, 0.5,
-3.62327, -3.785434, 4, 0, 1.5, 0.5, 0.5
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
-3.143087, -3.298393, -5.784431,
-3.143087, 3.195483, -5.784431,
-3.143087, -3.298393, 5.416776,
-3.143087, 3.195483, 5.416776,
-3.143087, -3.298393, -5.784431,
-3.143087, -3.298393, 5.416776,
-3.143087, 3.195483, -5.784431,
-3.143087, 3.195483, 5.416776,
-3.143087, -3.298393, -5.784431,
3.259346, -3.298393, -5.784431,
-3.143087, -3.298393, 5.416776,
3.259346, -3.298393, 5.416776,
-3.143087, 3.195483, -5.784431,
3.259346, 3.195483, -5.784431,
-3.143087, 3.195483, 5.416776,
3.259346, 3.195483, 5.416776,
3.259346, -3.298393, -5.784431,
3.259346, 3.195483, -5.784431,
3.259346, -3.298393, 5.416776,
3.259346, 3.195483, 5.416776,
3.259346, -3.298393, -5.784431,
3.259346, -3.298393, 5.416776,
3.259346, 3.195483, -5.784431,
3.259346, 3.195483, 5.416776
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
var radius = 7.712806;
var distance = 34.31514;
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
mvMatrix.translate( -0.05812907, 0.05145526, 0.1838276 );
mvMatrix.scale( 1.302511, 1.284169, 0.7444945 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.31514);
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
Cyclopropanecarboxyl<-read.table("Cyclopropanecarboxyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cyclopropanecarboxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cyclopropanecarboxyl' not found
```

```r
y<-Cyclopropanecarboxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cyclopropanecarboxyl' not found
```

```r
z<-Cyclopropanecarboxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cyclopropanecarboxyl' not found
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
-3.049848, 1.119506, -1.458233, 0, 0, 1, 1, 1,
-2.671706, 0.3038311, -1.390645, 1, 0, 0, 1, 1,
-2.635087, -1.234523, -2.689383, 1, 0, 0, 1, 1,
-2.519653, -0.07173106, -1.875774, 1, 0, 0, 1, 1,
-2.489957, 0.4245375, -2.546955, 1, 0, 0, 1, 1,
-2.463459, 1.827697, 0.1431488, 1, 0, 0, 1, 1,
-2.359477, 0.4160728, -1.413754, 0, 0, 0, 1, 1,
-2.326507, 1.554967, -1.62523, 0, 0, 0, 1, 1,
-2.312138, 0.5781816, -0.9849583, 0, 0, 0, 1, 1,
-2.288436, -0.1295372, -2.196527, 0, 0, 0, 1, 1,
-2.288367, -0.1032611, -2.635299, 0, 0, 0, 1, 1,
-2.267281, -0.01076063, -0.001642279, 0, 0, 0, 1, 1,
-2.25019, -1.225992, -2.889909, 0, 0, 0, 1, 1,
-2.190077, -1.802647, -1.916136, 1, 1, 1, 1, 1,
-2.178883, -0.5079064, -1.810202, 1, 1, 1, 1, 1,
-2.164912, -0.2649475, -2.137472, 1, 1, 1, 1, 1,
-2.115107, -0.4193964, -3.395646, 1, 1, 1, 1, 1,
-2.10764, 0.03225996, -1.334628, 1, 1, 1, 1, 1,
-2.036877, -1.788368, -2.937596, 1, 1, 1, 1, 1,
-2.018077, 0.7289974, -2.359239, 1, 1, 1, 1, 1,
-2.005005, -0.4077311, -1.89361, 1, 1, 1, 1, 1,
-1.993083, 0.2511317, 0.07267822, 1, 1, 1, 1, 1,
-1.96449, 0.6725369, -1.299055, 1, 1, 1, 1, 1,
-1.93744, 1.136742, 0.3491769, 1, 1, 1, 1, 1,
-1.919305, -0.4757178, -1.71948, 1, 1, 1, 1, 1,
-1.903711, -0.02484926, -0.6528711, 1, 1, 1, 1, 1,
-1.902553, -0.7231277, -2.918994, 1, 1, 1, 1, 1,
-1.868558, 0.03519715, -2.625013, 1, 1, 1, 1, 1,
-1.857499, 0.8608744, -1.307711, 0, 0, 1, 1, 1,
-1.852292, 1.374655, -1.04665, 1, 0, 0, 1, 1,
-1.838856, 1.050616, -0.3332177, 1, 0, 0, 1, 1,
-1.838569, -1.347718, -4.321669, 1, 0, 0, 1, 1,
-1.832024, -0.6647753, -0.7401866, 1, 0, 0, 1, 1,
-1.795906, -0.1803006, -1.059705, 1, 0, 0, 1, 1,
-1.787488, 1.695203, -1.357807, 0, 0, 0, 1, 1,
-1.779283, 0.7518209, -0.6990815, 0, 0, 0, 1, 1,
-1.76902, 0.8596922, -2.478435, 0, 0, 0, 1, 1,
-1.76894, 0.5738072, -0.05737747, 0, 0, 0, 1, 1,
-1.758035, 0.2159944, -2.351186, 0, 0, 0, 1, 1,
-1.754296, 0.6745026, -0.7175771, 0, 0, 0, 1, 1,
-1.742501, -0.3179784, -2.653348, 0, 0, 0, 1, 1,
-1.714605, 0.196632, -0.5665714, 1, 1, 1, 1, 1,
-1.7109, -0.7252399, -0.7540795, 1, 1, 1, 1, 1,
-1.708993, 1.042816, -0.9323452, 1, 1, 1, 1, 1,
-1.699791, 1.073562, 1.013199, 1, 1, 1, 1, 1,
-1.672357, 0.3997899, -0.8614841, 1, 1, 1, 1, 1,
-1.670267, -0.04684742, -1.500481, 1, 1, 1, 1, 1,
-1.652263, -0.5488471, -2.941113, 1, 1, 1, 1, 1,
-1.63597, -0.836825, -3.392906, 1, 1, 1, 1, 1,
-1.635047, 0.8991175, -1.262443, 1, 1, 1, 1, 1,
-1.634143, 1.793886, 0.1086569, 1, 1, 1, 1, 1,
-1.617941, 1.269874, -0.7071038, 1, 1, 1, 1, 1,
-1.609041, -1.281155, -0.4934371, 1, 1, 1, 1, 1,
-1.608994, -0.04008763, -2.056938, 1, 1, 1, 1, 1,
-1.607555, -0.8028606, -2.03285, 1, 1, 1, 1, 1,
-1.602055, 1.093917, -2.351675, 1, 1, 1, 1, 1,
-1.596427, -0.2736118, -1.073486, 0, 0, 1, 1, 1,
-1.590797, 1.278366, -0.424609, 1, 0, 0, 1, 1,
-1.57411, 0.2545907, -1.095283, 1, 0, 0, 1, 1,
-1.569479, 0.08588793, -1.596312, 1, 0, 0, 1, 1,
-1.544509, -0.2370281, -3.273157, 1, 0, 0, 1, 1,
-1.537053, -0.9040583, -2.403349, 1, 0, 0, 1, 1,
-1.535836, 2.517317, -2.832486, 0, 0, 0, 1, 1,
-1.534773, 0.9807993, 0.5593049, 0, 0, 0, 1, 1,
-1.527789, 1.112409, -1.297932, 0, 0, 0, 1, 1,
-1.519392, 0.3109426, 1.166532, 0, 0, 0, 1, 1,
-1.511287, 0.04203635, -2.668566, 0, 0, 0, 1, 1,
-1.490032, -0.07042258, -2.600305, 0, 0, 0, 1, 1,
-1.488028, -0.442904, -2.461597, 0, 0, 0, 1, 1,
-1.485684, -0.03414268, -1.851828, 1, 1, 1, 1, 1,
-1.476, -0.2716967, -1.129493, 1, 1, 1, 1, 1,
-1.471347, -0.09033801, -0.3334895, 1, 1, 1, 1, 1,
-1.465851, 0.2187695, -1.0679, 1, 1, 1, 1, 1,
-1.465684, 0.06772688, -0.7401794, 1, 1, 1, 1, 1,
-1.46287, -0.8422342, -1.528012, 1, 1, 1, 1, 1,
-1.461163, -0.6003036, -1.625476, 1, 1, 1, 1, 1,
-1.455384, -0.5480801, -1.401567, 1, 1, 1, 1, 1,
-1.454968, 1.800416, 0.001912211, 1, 1, 1, 1, 1,
-1.443307, 1.154926, -1.033929, 1, 1, 1, 1, 1,
-1.415223, 0.3834566, -0.8104365, 1, 1, 1, 1, 1,
-1.401866, -0.1237119, -1.822266, 1, 1, 1, 1, 1,
-1.3928, -1.029653, -2.448946, 1, 1, 1, 1, 1,
-1.377854, 1.322692, -0.8002164, 1, 1, 1, 1, 1,
-1.357341, -0.08366171, -2.04416, 1, 1, 1, 1, 1,
-1.339181, -1.388148, -2.121634, 0, 0, 1, 1, 1,
-1.336114, -0.05811232, -1.718408, 1, 0, 0, 1, 1,
-1.334827, 0.2460715, -0.4069203, 1, 0, 0, 1, 1,
-1.333372, -0.5373474, -1.67669, 1, 0, 0, 1, 1,
-1.332598, -0.5272316, -1.52945, 1, 0, 0, 1, 1,
-1.331089, -0.8560528, -2.411474, 1, 0, 0, 1, 1,
-1.32251, -1.88919, -1.903169, 0, 0, 0, 1, 1,
-1.318483, 0.7560946, -0.9756371, 0, 0, 0, 1, 1,
-1.312699, -0.5600134, -2.35981, 0, 0, 0, 1, 1,
-1.303918, 0.2236092, -1.652208, 0, 0, 0, 1, 1,
-1.302938, 0.3019418, -0.6503356, 0, 0, 0, 1, 1,
-1.296146, -0.2629299, -1.922572, 0, 0, 0, 1, 1,
-1.294985, -0.2946386, -2.419513, 0, 0, 0, 1, 1,
-1.291291, -0.4247518, -1.343921, 1, 1, 1, 1, 1,
-1.277431, -1.329663, -1.089384, 1, 1, 1, 1, 1,
-1.277366, -0.5169826, -2.658878, 1, 1, 1, 1, 1,
-1.276899, 0.7387146, -1.406157, 1, 1, 1, 1, 1,
-1.275932, -0.3405387, -2.676126, 1, 1, 1, 1, 1,
-1.273941, 1.474414, -0.6236842, 1, 1, 1, 1, 1,
-1.266484, -2.228336, -1.792758, 1, 1, 1, 1, 1,
-1.263113, -0.22218, 0.0945638, 1, 1, 1, 1, 1,
-1.25581, 2.009534, 0.334031, 1, 1, 1, 1, 1,
-1.236894, 1.240829, -1.004997, 1, 1, 1, 1, 1,
-1.230275, -1.314448, -1.286581, 1, 1, 1, 1, 1,
-1.22992, -1.820679, -1.241226, 1, 1, 1, 1, 1,
-1.229719, -0.8157015, -0.7451587, 1, 1, 1, 1, 1,
-1.222079, 0.8106747, -1.102166, 1, 1, 1, 1, 1,
-1.219943, 0.2196199, -2.304729, 1, 1, 1, 1, 1,
-1.218304, 0.1871931, -1.427899, 0, 0, 1, 1, 1,
-1.213174, 1.281567, -0.7945717, 1, 0, 0, 1, 1,
-1.213048, 0.5500426, -1.381562, 1, 0, 0, 1, 1,
-1.20215, 0.3780777, 0.05015249, 1, 0, 0, 1, 1,
-1.18936, -1.098994, -2.746605, 1, 0, 0, 1, 1,
-1.187325, 0.4410558, -0.2022452, 1, 0, 0, 1, 1,
-1.173773, -1.838296, -3.391677, 0, 0, 0, 1, 1,
-1.168147, 1.013174, -1.911948, 0, 0, 0, 1, 1,
-1.166734, 0.5330184, 0.7320458, 0, 0, 0, 1, 1,
-1.164623, 1.71683, -1.478787, 0, 0, 0, 1, 1,
-1.161339, 0.02115498, -0.2825092, 0, 0, 0, 1, 1,
-1.152889, 0.5925774, -2.170285, 0, 0, 0, 1, 1,
-1.152736, -0.5794185, -3.038583, 0, 0, 0, 1, 1,
-1.150709, -1.178909, -1.792707, 1, 1, 1, 1, 1,
-1.146279, -0.6253564, -0.03898195, 1, 1, 1, 1, 1,
-1.144855, -0.5042065, -3.075656, 1, 1, 1, 1, 1,
-1.140316, -0.07120624, -0.6680077, 1, 1, 1, 1, 1,
-1.130185, -0.6140454, -3.191022, 1, 1, 1, 1, 1,
-1.121145, 0.2997943, -2.416682, 1, 1, 1, 1, 1,
-1.111797, 0.4676137, -1.124024, 1, 1, 1, 1, 1,
-1.110454, -0.5894437, -2.716918, 1, 1, 1, 1, 1,
-1.110133, -1.405651, -2.554525, 1, 1, 1, 1, 1,
-1.105332, -0.9346099, -3.175232, 1, 1, 1, 1, 1,
-1.095755, -1.287027, -2.925159, 1, 1, 1, 1, 1,
-1.084612, -0.5328406, -3.009715, 1, 1, 1, 1, 1,
-1.080617, 0.01134113, -2.422837, 1, 1, 1, 1, 1,
-1.075994, 1.199769, -1.31584, 1, 1, 1, 1, 1,
-1.068467, 1.908509, 1.055692, 1, 1, 1, 1, 1,
-1.062524, -0.6907533, -1.621154, 0, 0, 1, 1, 1,
-1.061137, -0.8446093, -0.6323458, 1, 0, 0, 1, 1,
-1.029847, -1.400709, -2.62588, 1, 0, 0, 1, 1,
-1.023456, -0.9325615, -3.864443, 1, 0, 0, 1, 1,
-1.020234, 2.129938, -1.819938, 1, 0, 0, 1, 1,
-1.018849, -0.6675264, -1.252697, 1, 0, 0, 1, 1,
-1.017368, -0.2391274, -0.8810384, 0, 0, 0, 1, 1,
-1.017173, 0.9616101, -0.1715821, 0, 0, 0, 1, 1,
-1.00988, 0.8714994, -2.37174, 0, 0, 0, 1, 1,
-1.007973, 0.5280531, -1.462505, 0, 0, 0, 1, 1,
-1.004284, -0.4088347, -2.455356, 0, 0, 0, 1, 1,
-1.003996, -1.320405, -1.511628, 0, 0, 0, 1, 1,
-1.003406, 0.3213441, -1.704469, 0, 0, 0, 1, 1,
-0.9957823, 1.247836, -1.000795, 1, 1, 1, 1, 1,
-0.9915542, 0.07773929, -0.8899729, 1, 1, 1, 1, 1,
-0.9901699, 1.62712, -1.906328, 1, 1, 1, 1, 1,
-0.9898025, 0.1648419, -1.213389, 1, 1, 1, 1, 1,
-0.9878951, 0.1696896, -0.8069085, 1, 1, 1, 1, 1,
-0.9853417, -1.047256, -1.858395, 1, 1, 1, 1, 1,
-0.9815384, -1.6913, -1.737842, 1, 1, 1, 1, 1,
-0.978453, -0.9522448, -2.186251, 1, 1, 1, 1, 1,
-0.9776568, -1.312186, -2.084902, 1, 1, 1, 1, 1,
-0.9735551, 0.3424451, -0.4516144, 1, 1, 1, 1, 1,
-0.9723025, 1.543765, -1.247952, 1, 1, 1, 1, 1,
-0.9722183, -0.390613, -1.102518, 1, 1, 1, 1, 1,
-0.9713053, 0.3238311, -1.676902, 1, 1, 1, 1, 1,
-0.9666096, 0.4440839, 0.1462667, 1, 1, 1, 1, 1,
-0.9645287, 0.4722686, -2.09747, 1, 1, 1, 1, 1,
-0.9627783, -0.1013656, -0.8975797, 0, 0, 1, 1, 1,
-0.9564172, -0.9518272, -0.7346101, 1, 0, 0, 1, 1,
-0.9439228, 0.0936598, -0.9688544, 1, 0, 0, 1, 1,
-0.9410186, 1.899567, -1.144942, 1, 0, 0, 1, 1,
-0.9350491, -0.9845248, -2.424525, 1, 0, 0, 1, 1,
-0.9317918, -1.278449, -3.371732, 1, 0, 0, 1, 1,
-0.9284099, 1.859913, -0.6109084, 0, 0, 0, 1, 1,
-0.9230939, 0.1301938, -1.280256, 0, 0, 0, 1, 1,
-0.9192618, 1.16359, 0.6462231, 0, 0, 0, 1, 1,
-0.9184487, 0.5497302, 0.07903615, 0, 0, 0, 1, 1,
-0.9128523, -0.4321457, -1.649761, 0, 0, 0, 1, 1,
-0.9093875, 0.15115, -0.2365801, 0, 0, 0, 1, 1,
-0.9040809, 0.04666055, -0.8064919, 0, 0, 0, 1, 1,
-0.8981791, 2.31681, -0.128273, 1, 1, 1, 1, 1,
-0.8945492, -1.941628, -2.475925, 1, 1, 1, 1, 1,
-0.8840465, -0.2225644, -2.337115, 1, 1, 1, 1, 1,
-0.8811763, -0.8023599, -3.302438, 1, 1, 1, 1, 1,
-0.8803241, -0.3850845, -2.9583, 1, 1, 1, 1, 1,
-0.8752568, 0.8810633, -2.283464, 1, 1, 1, 1, 1,
-0.8686678, 0.930039, -3.599366, 1, 1, 1, 1, 1,
-0.865827, 0.4773879, -1.52749, 1, 1, 1, 1, 1,
-0.8599672, -0.5306594, -2.25351, 1, 1, 1, 1, 1,
-0.853723, -3.203822, -1.379058, 1, 1, 1, 1, 1,
-0.8501662, -0.6809895, -2.734738, 1, 1, 1, 1, 1,
-0.8471141, 0.8820751, -0.8315113, 1, 1, 1, 1, 1,
-0.8465461, 1.529849, 1.124333, 1, 1, 1, 1, 1,
-0.8454948, -0.2224209, -2.540448, 1, 1, 1, 1, 1,
-0.8452686, 0.3221018, -1.143224, 1, 1, 1, 1, 1,
-0.8351043, 0.6338152, -1.558116, 0, 0, 1, 1, 1,
-0.8340047, -0.07478864, -2.723956, 1, 0, 0, 1, 1,
-0.829756, -1.212157, -2.700963, 1, 0, 0, 1, 1,
-0.82925, -0.5176081, 0.3887371, 1, 0, 0, 1, 1,
-0.8175803, -0.3829215, -2.268915, 1, 0, 0, 1, 1,
-0.8172603, -0.0944949, -2.189861, 1, 0, 0, 1, 1,
-0.8120125, 0.8282934, 1.20166, 0, 0, 0, 1, 1,
-0.8066985, 0.8007126, -1.37193, 0, 0, 0, 1, 1,
-0.7936567, -0.1577573, -2.108294, 0, 0, 0, 1, 1,
-0.7895339, 1.101416, -1.42273, 0, 0, 0, 1, 1,
-0.7892028, 0.5442566, 0.6293677, 0, 0, 0, 1, 1,
-0.7879793, -1.56128, -3.42902, 0, 0, 0, 1, 1,
-0.7872138, 1.187262, -0.4195958, 0, 0, 0, 1, 1,
-0.7838928, -1.275575, -2.849073, 1, 1, 1, 1, 1,
-0.7797427, -2.080208, -3.8187, 1, 1, 1, 1, 1,
-0.7769421, 1.096377, -0.1444221, 1, 1, 1, 1, 1,
-0.7754532, 0.1315967, -0.6756258, 1, 1, 1, 1, 1,
-0.7753962, -0.06572835, -1.003326, 1, 1, 1, 1, 1,
-0.7708062, -0.1334479, -1.180672, 1, 1, 1, 1, 1,
-0.7692441, 0.547365, -4.203593, 1, 1, 1, 1, 1,
-0.7677314, 0.01228088, -2.06246, 1, 1, 1, 1, 1,
-0.7643266, -0.2203094, -2.762266, 1, 1, 1, 1, 1,
-0.7640162, -0.6303015, -2.160105, 1, 1, 1, 1, 1,
-0.760498, 0.9415818, -1.029555, 1, 1, 1, 1, 1,
-0.759849, -0.01878684, -1.493461, 1, 1, 1, 1, 1,
-0.758463, 0.001118517, -1.859156, 1, 1, 1, 1, 1,
-0.7515152, -0.4073351, -2.549075, 1, 1, 1, 1, 1,
-0.7513642, 1.283601, -0.2950417, 1, 1, 1, 1, 1,
-0.7497863, 2.050564, -0.7997401, 0, 0, 1, 1, 1,
-0.7487366, -0.7865128, -2.976415, 1, 0, 0, 1, 1,
-0.7454163, -1.017779, -2.569347, 1, 0, 0, 1, 1,
-0.7450125, -0.1889856, -0.4976145, 1, 0, 0, 1, 1,
-0.7429302, -1.395635, -0.3301009, 1, 0, 0, 1, 1,
-0.7399574, 0.891376, -1.815428, 1, 0, 0, 1, 1,
-0.7347494, -0.7567029, -2.058295, 0, 0, 0, 1, 1,
-0.7346294, 0.08418248, -1.39648, 0, 0, 0, 1, 1,
-0.7345387, -0.536722, -3.351801, 0, 0, 0, 1, 1,
-0.7318445, 1.397552, -0.9558862, 0, 0, 0, 1, 1,
-0.7301237, -1.420699, -1.359374, 0, 0, 0, 1, 1,
-0.72862, 1.379094, -2.279392, 0, 0, 0, 1, 1,
-0.7278808, -0.02602804, -2.297304, 0, 0, 0, 1, 1,
-0.7257628, 0.6064002, -0.7751144, 1, 1, 1, 1, 1,
-0.7223688, 0.05252941, -1.580407, 1, 1, 1, 1, 1,
-0.7092106, -0.7467372, -2.77396, 1, 1, 1, 1, 1,
-0.7018082, 1.824618, -0.7477734, 1, 1, 1, 1, 1,
-0.696897, 0.05543077, -3.179124, 1, 1, 1, 1, 1,
-0.6954833, 1.86171, -0.1830392, 1, 1, 1, 1, 1,
-0.6918517, 0.7100913, -1.283157, 1, 1, 1, 1, 1,
-0.6880403, -0.716615, -3.992972, 1, 1, 1, 1, 1,
-0.6874971, 0.8986859, 0.3742891, 1, 1, 1, 1, 1,
-0.6838278, 1.256366, 0.05829324, 1, 1, 1, 1, 1,
-0.6811745, -0.1496052, -1.594151, 1, 1, 1, 1, 1,
-0.6810807, 1.803917, -1.278514, 1, 1, 1, 1, 1,
-0.6808226, 0.642894, -1.677939, 1, 1, 1, 1, 1,
-0.6784943, -0.295312, -2.922637, 1, 1, 1, 1, 1,
-0.6762475, -0.7593387, -1.59824, 1, 1, 1, 1, 1,
-0.6660112, 1.505838, 0.693785, 0, 0, 1, 1, 1,
-0.6626716, 0.08436933, -1.521422, 1, 0, 0, 1, 1,
-0.6551343, 1.796337, -1.475677, 1, 0, 0, 1, 1,
-0.6550387, 0.4513933, -0.7749664, 1, 0, 0, 1, 1,
-0.6531219, 1.043761, 0.04859764, 1, 0, 0, 1, 1,
-0.6528274, -0.8156915, -3.519411, 1, 0, 0, 1, 1,
-0.6515586, -1.022522, -2.730183, 0, 0, 0, 1, 1,
-0.6496646, -0.06571938, -3.449971, 0, 0, 0, 1, 1,
-0.6487514, -0.7598572, -3.701974, 0, 0, 0, 1, 1,
-0.6483296, 0.1013565, -0.1168847, 0, 0, 0, 1, 1,
-0.6452254, -0.8541462, -3.941283, 0, 0, 0, 1, 1,
-0.643373, 0.3455051, 0.8366529, 0, 0, 0, 1, 1,
-0.6409698, 0.08763754, -2.200405, 0, 0, 0, 1, 1,
-0.6378442, -0.5817289, -2.115239, 1, 1, 1, 1, 1,
-0.6330773, -1.096284, -2.021666, 1, 1, 1, 1, 1,
-0.6328644, 0.3349877, -1.968341, 1, 1, 1, 1, 1,
-0.629663, -0.2671209, -0.8121392, 1, 1, 1, 1, 1,
-0.6259406, -0.5952498, -3.478261, 1, 1, 1, 1, 1,
-0.6224489, 0.9753748, -2.164662, 1, 1, 1, 1, 1,
-0.6163087, 0.517593, -1.24661, 1, 1, 1, 1, 1,
-0.6139884, 1.17408, 0.1505013, 1, 1, 1, 1, 1,
-0.610615, -0.07641665, -4.308058, 1, 1, 1, 1, 1,
-0.6078069, 0.3170153, -0.391054, 1, 1, 1, 1, 1,
-0.6055256, 1.23131, -1.359923, 1, 1, 1, 1, 1,
-0.6038881, 0.4236572, -1.457902, 1, 1, 1, 1, 1,
-0.6020784, -1.258325, -2.978926, 1, 1, 1, 1, 1,
-0.5997054, 0.07049759, -1.57753, 1, 1, 1, 1, 1,
-0.5961319, -1.824609, -1.978628, 1, 1, 1, 1, 1,
-0.5944217, 0.5516924, -3.867743, 0, 0, 1, 1, 1,
-0.5888327, 1.775357, -1.679986, 1, 0, 0, 1, 1,
-0.5781949, -0.2708578, -1.482638, 1, 0, 0, 1, 1,
-0.5765686, 2.041108, 0.3409896, 1, 0, 0, 1, 1,
-0.5746703, 0.458725, -1.925742, 1, 0, 0, 1, 1,
-0.5711206, 1.265052, -0.6286593, 1, 0, 0, 1, 1,
-0.5709454, -1.089425, -3.948184, 0, 0, 0, 1, 1,
-0.5692254, 0.6137319, -3.617499, 0, 0, 0, 1, 1,
-0.5688419, -0.7376239, -1.862782, 0, 0, 0, 1, 1,
-0.5638362, -1.512352, -1.039884, 0, 0, 0, 1, 1,
-0.5614577, -0.3278846, -1.994339, 0, 0, 0, 1, 1,
-0.5589598, -0.5677245, -1.947263, 0, 0, 0, 1, 1,
-0.5529078, -1.178157, -3.31025, 0, 0, 0, 1, 1,
-0.5528355, 0.3525161, -0.1885914, 1, 1, 1, 1, 1,
-0.5521067, 0.06343219, -2.075549, 1, 1, 1, 1, 1,
-0.5483611, -1.718678, -2.229088, 1, 1, 1, 1, 1,
-0.5466363, -0.2029819, -0.5716184, 1, 1, 1, 1, 1,
-0.5401659, -0.8975151, -3.320598, 1, 1, 1, 1, 1,
-0.5342465, -0.5770765, -2.709891, 1, 1, 1, 1, 1,
-0.5300639, 0.01091937, -0.2355634, 1, 1, 1, 1, 1,
-0.528999, 0.6351215, -1.055495, 1, 1, 1, 1, 1,
-0.5288842, 1.345792, -1.199347, 1, 1, 1, 1, 1,
-0.5246807, -0.0960499, -2.197222, 1, 1, 1, 1, 1,
-0.5143158, -0.365741, -2.259398, 1, 1, 1, 1, 1,
-0.4996212, -0.5333501, -2.551585, 1, 1, 1, 1, 1,
-0.499274, -0.280901, -2.799708, 1, 1, 1, 1, 1,
-0.4984628, 0.4246938, -2.145115, 1, 1, 1, 1, 1,
-0.4976459, 1.934804, -2.410611, 1, 1, 1, 1, 1,
-0.4961067, 1.721684, 1.688312, 0, 0, 1, 1, 1,
-0.4931473, -0.2342149, -1.609314, 1, 0, 0, 1, 1,
-0.483488, -0.01805722, -2.057518, 1, 0, 0, 1, 1,
-0.4752234, 0.8648173, 0.2550384, 1, 0, 0, 1, 1,
-0.4741869, -0.6832641, -2.529183, 1, 0, 0, 1, 1,
-0.4684577, -0.5461311, -3.641329, 1, 0, 0, 1, 1,
-0.4675367, -0.5118822, -1.366519, 0, 0, 0, 1, 1,
-0.4650819, -2.28916, -2.729233, 0, 0, 0, 1, 1,
-0.4650118, 0.7617702, -2.540585, 0, 0, 0, 1, 1,
-0.4649792, 0.6310762, 0.03354437, 0, 0, 0, 1, 1,
-0.4637664, 0.5297623, -2.331953, 0, 0, 0, 1, 1,
-0.4626465, -0.5215058, -1.819095, 0, 0, 0, 1, 1,
-0.4595187, -0.9102709, -3.259902, 0, 0, 0, 1, 1,
-0.450105, -1.489286, -3.510504, 1, 1, 1, 1, 1,
-0.4465182, 0.4745838, -0.2059231, 1, 1, 1, 1, 1,
-0.4445778, -1.133345, -5.621307, 1, 1, 1, 1, 1,
-0.4416603, -0.9752951, -2.978109, 1, 1, 1, 1, 1,
-0.4354653, 1.000399, -1.466366, 1, 1, 1, 1, 1,
-0.4338236, -0.6253589, -3.521774, 1, 1, 1, 1, 1,
-0.4303743, 0.6392504, -1.097096, 1, 1, 1, 1, 1,
-0.4271011, -0.5192198, -2.355227, 1, 1, 1, 1, 1,
-0.4236265, -0.495372, -3.189034, 1, 1, 1, 1, 1,
-0.4209827, -2.163178, -3.357104, 1, 1, 1, 1, 1,
-0.4118741, 0.136278, -1.097597, 1, 1, 1, 1, 1,
-0.4070484, 0.7673039, -0.5217924, 1, 1, 1, 1, 1,
-0.3982205, 0.9325289, 0.2392226, 1, 1, 1, 1, 1,
-0.3979014, 0.4930907, 0.2820598, 1, 1, 1, 1, 1,
-0.3974068, -0.4901191, -3.674856, 1, 1, 1, 1, 1,
-0.3971342, -0.5484062, -1.535328, 0, 0, 1, 1, 1,
-0.3939414, -0.1203171, -2.852972, 1, 0, 0, 1, 1,
-0.3848634, -0.4886546, -1.246712, 1, 0, 0, 1, 1,
-0.3846509, -0.8389856, -2.512668, 1, 0, 0, 1, 1,
-0.3818634, 0.3987235, -1.734698, 1, 0, 0, 1, 1,
-0.3813513, 0.1263451, 0.7329557, 1, 0, 0, 1, 1,
-0.3763238, -0.6680776, -3.736703, 0, 0, 0, 1, 1,
-0.3752927, 0.2590071, -0.01069896, 0, 0, 0, 1, 1,
-0.3743671, -0.5311478, -1.788369, 0, 0, 0, 1, 1,
-0.3733676, -1.464317, -1.734639, 0, 0, 0, 1, 1,
-0.3623218, 1.873142, -0.1042324, 0, 0, 0, 1, 1,
-0.3603504, 2.327644, 0.2652706, 0, 0, 0, 1, 1,
-0.353695, -0.9558764, -2.351618, 0, 0, 0, 1, 1,
-0.3528994, -0.07876971, -0.8776693, 1, 1, 1, 1, 1,
-0.3528027, -0.3872327, -1.763926, 1, 1, 1, 1, 1,
-0.3499497, 1.834759, -0.1864088, 1, 1, 1, 1, 1,
-0.3474996, 1.629936, 0.31614, 1, 1, 1, 1, 1,
-0.3359847, -0.9192178, -2.569363, 1, 1, 1, 1, 1,
-0.3345397, 0.470251, -0.5340637, 1, 1, 1, 1, 1,
-0.3286744, 1.285575, -0.6358687, 1, 1, 1, 1, 1,
-0.3268286, -0.06719553, -3.555346, 1, 1, 1, 1, 1,
-0.3256471, 0.2867114, -0.8047599, 1, 1, 1, 1, 1,
-0.3249544, 0.9222057, -0.5213355, 1, 1, 1, 1, 1,
-0.322184, -0.3874254, -4.298975, 1, 1, 1, 1, 1,
-0.3164597, -0.9628289, -3.858782, 1, 1, 1, 1, 1,
-0.3109962, 0.02196836, 0.3997497, 1, 1, 1, 1, 1,
-0.3084678, 0.3678652, -1.599525, 1, 1, 1, 1, 1,
-0.3075919, -1.481208, -4.312525, 1, 1, 1, 1, 1,
-0.295332, -0.4238716, -3.391165, 0, 0, 1, 1, 1,
-0.2939535, -0.4011759, -4.630215, 1, 0, 0, 1, 1,
-0.2935685, -0.2398038, -2.815046, 1, 0, 0, 1, 1,
-0.2888328, -0.5853617, -2.792061, 1, 0, 0, 1, 1,
-0.2876378, 1.448617, 0.7771142, 1, 0, 0, 1, 1,
-0.2864966, -0.8709947, -3.069898, 1, 0, 0, 1, 1,
-0.2825919, 1.293728, -0.4693541, 0, 0, 0, 1, 1,
-0.2761111, 0.8088582, -0.1496788, 0, 0, 0, 1, 1,
-0.2740366, 0.4304137, 1.202664, 0, 0, 0, 1, 1,
-0.2684872, -1.564424, -3.176039, 0, 0, 0, 1, 1,
-0.2674589, -0.0827425, -2.566776, 0, 0, 0, 1, 1,
-0.2642919, 0.3902431, -1.402839, 0, 0, 0, 1, 1,
-0.2630429, 2.043604, 1.443175, 0, 0, 0, 1, 1,
-0.2624322, -1.187729, -3.306768, 1, 1, 1, 1, 1,
-0.2623616, -0.8712221, -4.132085, 1, 1, 1, 1, 1,
-0.2526836, -0.07804286, -2.130794, 1, 1, 1, 1, 1,
-0.2519355, -0.08871377, -2.640171, 1, 1, 1, 1, 1,
-0.2508707, -0.8875804, -3.049115, 1, 1, 1, 1, 1,
-0.247537, 0.2460902, -0.2527567, 1, 1, 1, 1, 1,
-0.2463086, 0.3233318, -2.077812, 1, 1, 1, 1, 1,
-0.2460615, 0.7093752, -1.213808, 1, 1, 1, 1, 1,
-0.2433642, 0.7945319, -0.5130241, 1, 1, 1, 1, 1,
-0.2426832, 0.2162619, -1.04924, 1, 1, 1, 1, 1,
-0.2424915, -0.3789968, -3.48258, 1, 1, 1, 1, 1,
-0.2353882, 0.305537, -1.380618, 1, 1, 1, 1, 1,
-0.2345878, -0.8827341, -2.722606, 1, 1, 1, 1, 1,
-0.2305434, 1.546519, -0.5740736, 1, 1, 1, 1, 1,
-0.2293067, 1.45087, 2.145255, 1, 1, 1, 1, 1,
-0.2292593, 0.9709541, -1.055929, 0, 0, 1, 1, 1,
-0.2241925, 0.3322755, 0.5002003, 1, 0, 0, 1, 1,
-0.22314, 2.368678, -1.484502, 1, 0, 0, 1, 1,
-0.2231199, 1.664321, -0.7235072, 1, 0, 0, 1, 1,
-0.2225965, -0.0710771, -3.426807, 1, 0, 0, 1, 1,
-0.2155908, -0.2268987, -1.743224, 1, 0, 0, 1, 1,
-0.2122776, -1.58033, -1.4421, 0, 0, 0, 1, 1,
-0.211124, 0.8006422, -0.9265063, 0, 0, 0, 1, 1,
-0.2108314, -1.049587, -3.862269, 0, 0, 0, 1, 1,
-0.1992054, 0.2280322, -1.332724, 0, 0, 0, 1, 1,
-0.198429, -0.2951652, -1.799481, 0, 0, 0, 1, 1,
-0.1920322, 0.3465768, -0.1331628, 0, 0, 0, 1, 1,
-0.1900826, 0.3283765, 0.6719, 0, 0, 0, 1, 1,
-0.1832926, -0.7901023, -3.001338, 1, 1, 1, 1, 1,
-0.17527, -1.740579, -4.175573, 1, 1, 1, 1, 1,
-0.1746622, -0.7799584, -3.975961, 1, 1, 1, 1, 1,
-0.1715026, -0.1663154, -1.143816, 1, 1, 1, 1, 1,
-0.1690976, 0.652517, 0.6170842, 1, 1, 1, 1, 1,
-0.1690006, 0.8368453, 0.61925, 1, 1, 1, 1, 1,
-0.1682055, 0.6091984, 0.1586601, 1, 1, 1, 1, 1,
-0.1639652, -1.357229, -2.403981, 1, 1, 1, 1, 1,
-0.1595557, 0.3607836, -0.9271703, 1, 1, 1, 1, 1,
-0.157316, 0.1984273, -0.9153209, 1, 1, 1, 1, 1,
-0.1550175, -0.01056104, -1.606737, 1, 1, 1, 1, 1,
-0.1533028, 1.062049, -1.212638, 1, 1, 1, 1, 1,
-0.1518547, -0.6173759, -1.797605, 1, 1, 1, 1, 1,
-0.1496154, -0.66175, -1.733725, 1, 1, 1, 1, 1,
-0.1495608, 1.69397, -0.3588145, 1, 1, 1, 1, 1,
-0.1477357, -1.927046, -3.258372, 0, 0, 1, 1, 1,
-0.146766, -0.7107324, -4.020422, 1, 0, 0, 1, 1,
-0.1464811, -0.6899787, -2.794954, 1, 0, 0, 1, 1,
-0.1458005, -0.5546886, -3.766516, 1, 0, 0, 1, 1,
-0.145642, 0.7224776, 0.7748444, 1, 0, 0, 1, 1,
-0.1395074, 0.4157706, -0.836477, 1, 0, 0, 1, 1,
-0.1369651, 5.339149e-05, -2.825688, 0, 0, 0, 1, 1,
-0.1365483, -0.5968704, -3.266873, 0, 0, 0, 1, 1,
-0.1325193, 0.9897566, -1.074305, 0, 0, 0, 1, 1,
-0.1298833, -1.272977, -1.114675, 0, 0, 0, 1, 1,
-0.1271509, 0.1510703, -0.2658938, 0, 0, 0, 1, 1,
-0.1248035, -0.5721545, -1.183884, 0, 0, 0, 1, 1,
-0.1203083, -0.2439118, -3.370526, 0, 0, 0, 1, 1,
-0.1146703, -0.0411447, -0.6809955, 1, 1, 1, 1, 1,
-0.1137114, -0.5594538, -2.401515, 1, 1, 1, 1, 1,
-0.1076255, 0.8700776, -0.4547351, 1, 1, 1, 1, 1,
-0.1062312, -0.6406029, -3.585985, 1, 1, 1, 1, 1,
-0.1012874, -1.21106, -3.705584, 1, 1, 1, 1, 1,
-0.1008791, 0.8646878, -0.06692512, 1, 1, 1, 1, 1,
-0.0985149, 0.6760549, -0.02852682, 1, 1, 1, 1, 1,
-0.09630767, -0.3863586, -4.507652, 1, 1, 1, 1, 1,
-0.09494369, -1.702536, -3.851797, 1, 1, 1, 1, 1,
-0.09144092, -0.6333621, -3.140151, 1, 1, 1, 1, 1,
-0.09034, -0.9186849, -2.350829, 1, 1, 1, 1, 1,
-0.08459634, 1.262008, -0.5338159, 1, 1, 1, 1, 1,
-0.08220368, 0.1155058, 0.5143661, 1, 1, 1, 1, 1,
-0.08208991, 0.4117082, 0.503127, 1, 1, 1, 1, 1,
-0.07693915, -0.484183, -3.598508, 1, 1, 1, 1, 1,
-0.07563388, 0.5690731, -1.257699, 0, 0, 1, 1, 1,
-0.0755126, -0.3170352, -2.213336, 1, 0, 0, 1, 1,
-0.07152307, 1.046501, -0.3099306, 1, 0, 0, 1, 1,
-0.06772122, 0.8024515, 0.9832345, 1, 0, 0, 1, 1,
-0.06535877, -1.194646, -2.910225, 1, 0, 0, 1, 1,
-0.06483711, -0.6257733, -2.733619, 1, 0, 0, 1, 1,
-0.06310497, -0.4342986, -4.304568, 0, 0, 0, 1, 1,
-0.06115106, 0.9527126, -2.731923, 0, 0, 0, 1, 1,
-0.06095241, 0.7681876, -0.788532, 0, 0, 0, 1, 1,
-0.05991057, -0.7524516, -3.258385, 0, 0, 0, 1, 1,
-0.05304953, -0.1675399, -1.999302, 0, 0, 0, 1, 1,
-0.05304466, 0.4101482, 0.4777038, 0, 0, 0, 1, 1,
-0.04990819, -0.1426682, -1.920612, 0, 0, 0, 1, 1,
-0.047993, -0.9687094, -4.394347, 1, 1, 1, 1, 1,
-0.04377263, 0.6168281, -1.337528, 1, 1, 1, 1, 1,
-0.04299807, 0.2188603, 0.7725307, 1, 1, 1, 1, 1,
-0.04028347, -1.457133, -3.205066, 1, 1, 1, 1, 1,
-0.02605804, -0.3952524, -4.059958, 1, 1, 1, 1, 1,
-0.02169713, 0.2124354, -1.534677, 1, 1, 1, 1, 1,
-0.0177662, -1.276443, -3.618961, 1, 1, 1, 1, 1,
-0.009215951, -1.070275, -4.213939, 1, 1, 1, 1, 1,
-0.008081965, 0.3972879, -0.813513, 1, 1, 1, 1, 1,
0.007778079, -0.4446335, 3.90512, 1, 1, 1, 1, 1,
0.01296603, -0.05923236, 2.605661, 1, 1, 1, 1, 1,
0.01463761, 0.4229881, 0.6812838, 1, 1, 1, 1, 1,
0.02503588, 0.3230158, -0.1163437, 1, 1, 1, 1, 1,
0.02588745, 0.2665952, 1.528541, 1, 1, 1, 1, 1,
0.02640927, 0.0003584793, 0.1611703, 1, 1, 1, 1, 1,
0.02816067, -0.9835592, 2.74866, 0, 0, 1, 1, 1,
0.03541011, -0.02377486, 2.177014, 1, 0, 0, 1, 1,
0.04055851, -1.565392, 3.725851, 1, 0, 0, 1, 1,
0.04698487, 0.2480822, -1.080612, 1, 0, 0, 1, 1,
0.04713275, 0.6145906, -0.2319518, 1, 0, 0, 1, 1,
0.04742725, -0.2129974, 3.79403, 1, 0, 0, 1, 1,
0.04829735, 1.518407, -1.682284, 0, 0, 0, 1, 1,
0.04833758, 0.6963741, 1.643497, 0, 0, 0, 1, 1,
0.04924307, 1.059031, 1.032194, 0, 0, 0, 1, 1,
0.04930462, -0.1591203, 1.482671, 0, 0, 0, 1, 1,
0.05244512, 0.389063, 0.8457202, 0, 0, 0, 1, 1,
0.05541572, 0.6042209, 0.6957564, 0, 0, 0, 1, 1,
0.05553746, 1.098553, 1.340628, 0, 0, 0, 1, 1,
0.05576571, 0.2981539, -0.7332522, 1, 1, 1, 1, 1,
0.05839054, 1.761695, -1.146609, 1, 1, 1, 1, 1,
0.0594544, 0.253976, 0.3552498, 1, 1, 1, 1, 1,
0.06008204, 0.1156409, 1.71019, 1, 1, 1, 1, 1,
0.06028556, -0.1103603, 3.83491, 1, 1, 1, 1, 1,
0.06326041, 1.600601, -1.275254, 1, 1, 1, 1, 1,
0.06720305, -1.57516, 3.71542, 1, 1, 1, 1, 1,
0.06776815, 1.003415, 1.673513, 1, 1, 1, 1, 1,
0.06853309, 0.1738683, 0.6395098, 1, 1, 1, 1, 1,
0.070702, 0.8300779, 1.388716, 1, 1, 1, 1, 1,
0.072165, 0.2094791, -0.5670629, 1, 1, 1, 1, 1,
0.07341427, 0.2717682, 0.006234664, 1, 1, 1, 1, 1,
0.07369816, 0.7321112, -0.03430766, 1, 1, 1, 1, 1,
0.07717882, -0.2157693, 4.964266, 1, 1, 1, 1, 1,
0.07777763, -0.5157267, 3.135793, 1, 1, 1, 1, 1,
0.07994454, 1.040069, -1.232428, 0, 0, 1, 1, 1,
0.08481497, -0.5481321, 3.333408, 1, 0, 0, 1, 1,
0.0870314, 1.574849, -0.378216, 1, 0, 0, 1, 1,
0.08831445, 1.159027, -1.666589, 1, 0, 0, 1, 1,
0.09087492, 0.4350802, -0.5098711, 1, 0, 0, 1, 1,
0.09095202, -0.6179717, 2.108023, 1, 0, 0, 1, 1,
0.09096992, 0.5701661, -0.2252198, 0, 0, 0, 1, 1,
0.09768845, 0.7734978, -0.4665484, 0, 0, 0, 1, 1,
0.1009335, -0.2826828, 3.47226, 0, 0, 0, 1, 1,
0.1028629, -1.015606, 2.311067, 0, 0, 0, 1, 1,
0.1033328, -0.2323494, 1.554231, 0, 0, 0, 1, 1,
0.103953, -0.6092761, 3.743293, 0, 0, 0, 1, 1,
0.1043084, 0.3138867, -0.2509753, 0, 0, 0, 1, 1,
0.1070612, -0.8867221, 4.134758, 1, 1, 1, 1, 1,
0.1083251, -0.1428991, 2.671531, 1, 1, 1, 1, 1,
0.1087201, -0.8748665, 4.621135, 1, 1, 1, 1, 1,
0.1112999, -0.7775611, 3.506166, 1, 1, 1, 1, 1,
0.1195344, -0.6108662, 2.287959, 1, 1, 1, 1, 1,
0.1198893, 1.594762, 0.5764259, 1, 1, 1, 1, 1,
0.1199637, -0.04779584, 1.773021, 1, 1, 1, 1, 1,
0.1219431, 0.7792426, 0.7427653, 1, 1, 1, 1, 1,
0.1224315, -0.1738431, 3.240341, 1, 1, 1, 1, 1,
0.1231837, -0.005644789, 1.316444, 1, 1, 1, 1, 1,
0.1369037, -1.520715, 4.565088, 1, 1, 1, 1, 1,
0.1377382, -0.0727087, 2.351763, 1, 1, 1, 1, 1,
0.1403912, 0.6623442, 0.02587664, 1, 1, 1, 1, 1,
0.1412127, 2.025213, -0.2074224, 1, 1, 1, 1, 1,
0.1450836, 0.0503566, 2.065975, 1, 1, 1, 1, 1,
0.1463713, 1.803077, -0.6877002, 0, 0, 1, 1, 1,
0.1504697, -0.5590103, 2.65942, 1, 0, 0, 1, 1,
0.151141, 0.2855912, -3.130361, 1, 0, 0, 1, 1,
0.155314, 0.9690949, 0.2063601, 1, 0, 0, 1, 1,
0.1577398, 2.125784, -0.2868514, 1, 0, 0, 1, 1,
0.1608585, 1.229692, 1.728371, 1, 0, 0, 1, 1,
0.1622785, 1.495124, 0.0996139, 0, 0, 0, 1, 1,
0.1631993, 0.4565556, 0.05532384, 0, 0, 0, 1, 1,
0.1654164, 0.2599484, 0.3668022, 0, 0, 0, 1, 1,
0.1664393, 1.205649, -1.226366, 0, 0, 0, 1, 1,
0.1673459, -1.427434, 3.497992, 0, 0, 0, 1, 1,
0.1674474, -1.557487, 3.119857, 0, 0, 0, 1, 1,
0.1685418, 1.177438, -1.965932, 0, 0, 0, 1, 1,
0.1708393, -0.1062987, 2.456251, 1, 1, 1, 1, 1,
0.173747, 0.804336, -1.047221, 1, 1, 1, 1, 1,
0.1764733, -0.3956327, 1.854486, 1, 1, 1, 1, 1,
0.1767963, 0.4783486, -0.8566133, 1, 1, 1, 1, 1,
0.1792922, -1.981608, 3.86356, 1, 1, 1, 1, 1,
0.180278, -0.07702207, 1.765887, 1, 1, 1, 1, 1,
0.1867409, -1.696976, 4.925766, 1, 1, 1, 1, 1,
0.1878585, 0.165717, -0.6026636, 1, 1, 1, 1, 1,
0.1894317, 1.4662, 1.825706, 1, 1, 1, 1, 1,
0.1901519, 0.1094121, 0.339066, 1, 1, 1, 1, 1,
0.1928281, -0.583267, 1.900728, 1, 1, 1, 1, 1,
0.1934335, -0.4547369, 3.194501, 1, 1, 1, 1, 1,
0.1973861, 0.2589172, 0.8018752, 1, 1, 1, 1, 1,
0.2005607, 0.6473084, 0.7311285, 1, 1, 1, 1, 1,
0.2006773, 0.728496, -0.425492, 1, 1, 1, 1, 1,
0.206179, -0.6443933, 3.600945, 0, 0, 1, 1, 1,
0.209735, -1.256189, 4.476465, 1, 0, 0, 1, 1,
0.216475, 0.5623536, -0.1828826, 1, 0, 0, 1, 1,
0.2188253, 1.236727, 1.404472, 1, 0, 0, 1, 1,
0.2227578, 0.476523, 0.7938063, 1, 0, 0, 1, 1,
0.2273509, -0.6304858, 2.276154, 1, 0, 0, 1, 1,
0.2320928, 0.4358796, 1.215925, 0, 0, 0, 1, 1,
0.2332962, 0.8449334, -0.7732592, 0, 0, 0, 1, 1,
0.234695, 0.9934448, 2.450643, 0, 0, 0, 1, 1,
0.2383709, 1.535343, -1.985849, 0, 0, 0, 1, 1,
0.2387182, 2.558558, 0.1035767, 0, 0, 0, 1, 1,
0.2459591, -0.05637107, 1.583124, 0, 0, 0, 1, 1,
0.246839, 1.208134, 1.575311, 0, 0, 0, 1, 1,
0.2470124, 0.458024, -0.49804, 1, 1, 1, 1, 1,
0.250263, -1.065758, 3.406629, 1, 1, 1, 1, 1,
0.2553205, -0.98972, 5.106752, 1, 1, 1, 1, 1,
0.2578187, -0.3352195, 2.377872, 1, 1, 1, 1, 1,
0.264227, -0.9640935, 1.187357, 1, 1, 1, 1, 1,
0.2643665, 0.008846526, 0.4759607, 1, 1, 1, 1, 1,
0.2738597, -0.2654189, 1.156777, 1, 1, 1, 1, 1,
0.2773878, 0.8003116, -1.038115, 1, 1, 1, 1, 1,
0.2784797, 0.6950356, -0.8297673, 1, 1, 1, 1, 1,
0.2834461, -2.5935, 3.879025, 1, 1, 1, 1, 1,
0.2865084, 0.02507784, 1.332239, 1, 1, 1, 1, 1,
0.2886609, -1.25433, 2.828663, 1, 1, 1, 1, 1,
0.2889952, 1.087314, 0.1556031, 1, 1, 1, 1, 1,
0.2947176, 0.2197352, 2.312064, 1, 1, 1, 1, 1,
0.3026236, 0.6095231, -0.4949163, 1, 1, 1, 1, 1,
0.3048, 0.759833, 0.2580708, 0, 0, 1, 1, 1,
0.3062899, -0.5386776, 0.6938275, 1, 0, 0, 1, 1,
0.3095189, 0.2163286, 0.7667249, 1, 0, 0, 1, 1,
0.3135899, 1.985973, -0.1552361, 1, 0, 0, 1, 1,
0.3137145, 0.2963471, -1.239109, 1, 0, 0, 1, 1,
0.3156359, 0.2024854, 0.9217349, 1, 0, 0, 1, 1,
0.3159894, 0.1965618, 0.1591595, 0, 0, 0, 1, 1,
0.3241572, -0.925738, 2.216002, 0, 0, 0, 1, 1,
0.3256385, -0.7749092, 1.702599, 0, 0, 0, 1, 1,
0.3309771, -1.393801, 0.65347, 0, 0, 0, 1, 1,
0.3408829, 0.07428154, 1.038823, 0, 0, 0, 1, 1,
0.3418373, -1.648433, 3.444687, 0, 0, 0, 1, 1,
0.3436986, 0.3082375, 2.171402, 0, 0, 0, 1, 1,
0.3516841, 0.4583091, 1.541192, 1, 1, 1, 1, 1,
0.3519265, 0.183186, -0.1118919, 1, 1, 1, 1, 1,
0.3548543, 1.346996, -0.5102935, 1, 1, 1, 1, 1,
0.3553674, 1.889234, 1.437418, 1, 1, 1, 1, 1,
0.3583145, 0.05372424, 1.651786, 1, 1, 1, 1, 1,
0.3619843, 0.03916766, 1.797723, 1, 1, 1, 1, 1,
0.3657813, -1.188993, 2.264183, 1, 1, 1, 1, 1,
0.3665344, -0.3414869, 3.44615, 1, 1, 1, 1, 1,
0.3666435, 1.488063, -0.03579092, 1, 1, 1, 1, 1,
0.3676902, -0.6306332, 2.950314, 1, 1, 1, 1, 1,
0.37416, -0.4738362, 1.645009, 1, 1, 1, 1, 1,
0.3795487, 0.1711421, 2.55584, 1, 1, 1, 1, 1,
0.3803749, 0.4099277, -0.1357668, 1, 1, 1, 1, 1,
0.3817693, -0.8254787, 3.797204, 1, 1, 1, 1, 1,
0.3830391, 0.7130461, 0.03502505, 1, 1, 1, 1, 1,
0.3830456, 1.701515, 0.4396432, 0, 0, 1, 1, 1,
0.3851432, 0.419857, 0.7700029, 1, 0, 0, 1, 1,
0.3876704, -2.192497, 2.558121, 1, 0, 0, 1, 1,
0.3877241, -0.7371137, 2.995571, 1, 0, 0, 1, 1,
0.38919, -0.7238792, 1.56803, 1, 0, 0, 1, 1,
0.3895321, 0.5539197, -0.07984761, 1, 0, 0, 1, 1,
0.3917401, -0.3809384, 0.9229271, 0, 0, 0, 1, 1,
0.3925644, -1.347079, 0.3887614, 0, 0, 0, 1, 1,
0.3994913, 1.477369, -1.313155, 0, 0, 0, 1, 1,
0.4013457, 1.673302, 0.3604108, 0, 0, 0, 1, 1,
0.4027503, 1.655319, -0.1268507, 0, 0, 0, 1, 1,
0.4093857, -0.2199714, 1.048933, 0, 0, 0, 1, 1,
0.4099507, 0.39093, -1.163162, 0, 0, 0, 1, 1,
0.411508, 0.6644205, 0.7550506, 1, 1, 1, 1, 1,
0.4144831, -0.9741325, 1.828362, 1, 1, 1, 1, 1,
0.4147803, 0.71867, 0.5540692, 1, 1, 1, 1, 1,
0.4156665, 0.4607377, -1.774836, 1, 1, 1, 1, 1,
0.420058, -0.7096716, 3.554765, 1, 1, 1, 1, 1,
0.4207832, -1.466173, 3.608051, 1, 1, 1, 1, 1,
0.4212333, 1.267314, -1.811599, 1, 1, 1, 1, 1,
0.4248993, 0.9304894, 0.5787424, 1, 1, 1, 1, 1,
0.4253527, 0.6332753, 1.81655, 1, 1, 1, 1, 1,
0.4257598, -1.024791, 3.231299, 1, 1, 1, 1, 1,
0.4261481, 2.089455, 1.211986, 1, 1, 1, 1, 1,
0.4370282, 0.5360025, -0.9906533, 1, 1, 1, 1, 1,
0.4372144, 0.1872306, 1.35551, 1, 1, 1, 1, 1,
0.4410015, -0.3220335, 1.488521, 1, 1, 1, 1, 1,
0.4411004, 0.3957633, 1.893014, 1, 1, 1, 1, 1,
0.4419723, 0.51744, 1.641047, 0, 0, 1, 1, 1,
0.4424097, -1.370375, 2.767932, 1, 0, 0, 1, 1,
0.4478251, 0.8342668, 0.1826811, 1, 0, 0, 1, 1,
0.449666, 0.3144016, 0.7077094, 1, 0, 0, 1, 1,
0.4508046, -0.0143965, -0.1081656, 1, 0, 0, 1, 1,
0.4530704, 1.358153, 0.7717918, 1, 0, 0, 1, 1,
0.4556692, 1.864595, -0.20625, 0, 0, 0, 1, 1,
0.4557325, 0.9363454, 1.91837, 0, 0, 0, 1, 1,
0.4581505, 0.4931956, 0.5256613, 0, 0, 0, 1, 1,
0.4587849, -0.7812576, 3.855687, 0, 0, 0, 1, 1,
0.4616406, 0.1757026, 3.436581, 0, 0, 0, 1, 1,
0.468152, -0.7647851, 4.103225, 0, 0, 0, 1, 1,
0.4700641, 1.833075, 0.2917574, 0, 0, 0, 1, 1,
0.4703271, -0.3414359, 0.8489108, 1, 1, 1, 1, 1,
0.4713563, -0.07145354, 0.3458147, 1, 1, 1, 1, 1,
0.4720754, -0.4063013, 2.987469, 1, 1, 1, 1, 1,
0.4730049, -1.374782, 4.706296, 1, 1, 1, 1, 1,
0.4794383, 0.425611, 0.2654075, 1, 1, 1, 1, 1,
0.4916197, 1.126666, -0.5173717, 1, 1, 1, 1, 1,
0.4952642, -0.464407, 3.407968, 1, 1, 1, 1, 1,
0.5022894, -1.005911, 4.788366, 1, 1, 1, 1, 1,
0.5039175, -0.4377038, 4.151275, 1, 1, 1, 1, 1,
0.5062015, -0.2024326, 1.695233, 1, 1, 1, 1, 1,
0.5118278, -0.1606422, 1.358962, 1, 1, 1, 1, 1,
0.51251, 0.9483744, -1.462842, 1, 1, 1, 1, 1,
0.5134931, 2.209028, -1.545952, 1, 1, 1, 1, 1,
0.5149962, 1.579684, -0.2750285, 1, 1, 1, 1, 1,
0.515731, 0.6276517, -0.08662134, 1, 1, 1, 1, 1,
0.5170323, 1.164013, 0.7048445, 0, 0, 1, 1, 1,
0.5192046, 0.6215794, 0.3681481, 1, 0, 0, 1, 1,
0.5248338, 0.9956203, 2.903204, 1, 0, 0, 1, 1,
0.5259992, -0.06057968, 2.893036, 1, 0, 0, 1, 1,
0.5261831, -1.603891, 3.00902, 1, 0, 0, 1, 1,
0.5267233, -0.7274275, 2.536231, 1, 0, 0, 1, 1,
0.5310189, 0.9055507, 2.09952, 0, 0, 0, 1, 1,
0.534723, -1.553777, 3.03411, 0, 0, 0, 1, 1,
0.547628, 0.6718349, -0.0333637, 0, 0, 0, 1, 1,
0.5476614, -0.972187, 2.456261, 0, 0, 0, 1, 1,
0.5494834, -1.271213, 3.360563, 0, 0, 0, 1, 1,
0.553769, -0.8034706, 3.078699, 0, 0, 0, 1, 1,
0.5545977, -1.832994, 2.720846, 0, 0, 0, 1, 1,
0.5601955, 0.3232548, 1.40767, 1, 1, 1, 1, 1,
0.5605091, -0.2827444, 1.28641, 1, 1, 1, 1, 1,
0.561469, -0.4335586, 0.9877018, 1, 1, 1, 1, 1,
0.562564, 0.5060581, -0.6637158, 1, 1, 1, 1, 1,
0.5639167, -0.1960202, 2.035063, 1, 1, 1, 1, 1,
0.5667716, -1.963953, 2.026298, 1, 1, 1, 1, 1,
0.5721182, 0.4701813, -0.02762868, 1, 1, 1, 1, 1,
0.5868893, -1.128224, 4.918811, 1, 1, 1, 1, 1,
0.5875886, 1.198781, 0.4197293, 1, 1, 1, 1, 1,
0.5942563, 0.6852219, 2.262023, 1, 1, 1, 1, 1,
0.5953696, -1.494721, 5.125538, 1, 1, 1, 1, 1,
0.5963024, -1.472898, 1.783324, 1, 1, 1, 1, 1,
0.5969926, 1.802936, 2.2193, 1, 1, 1, 1, 1,
0.5980574, -1.18208, 2.579467, 1, 1, 1, 1, 1,
0.5990233, 0.3472746, 1.876518, 1, 1, 1, 1, 1,
0.6003409, -0.06596638, 0.8237394, 0, 0, 1, 1, 1,
0.6077477, -0.6082059, 1.710104, 1, 0, 0, 1, 1,
0.608009, -0.626626, 0.7095584, 1, 0, 0, 1, 1,
0.6113808, 1.24116, -1.099748, 1, 0, 0, 1, 1,
0.6113966, 0.5404395, 0.6341621, 1, 0, 0, 1, 1,
0.6149707, 1.343605, 1.143708, 1, 0, 0, 1, 1,
0.6161372, -0.04358707, 2.729867, 0, 0, 0, 1, 1,
0.6201208, 0.6282869, 1.608027, 0, 0, 0, 1, 1,
0.6202649, 0.7736304, -0.1838927, 0, 0, 0, 1, 1,
0.6230842, -1.799521, 2.618055, 0, 0, 0, 1, 1,
0.6303334, -0.9645388, 3.96174, 0, 0, 0, 1, 1,
0.6319649, 1.348582, 0.1761209, 0, 0, 0, 1, 1,
0.6356876, 0.6490054, 0.621833, 0, 0, 0, 1, 1,
0.6395435, -0.4231402, 1.543065, 1, 1, 1, 1, 1,
0.6448085, -0.6158943, 3.409256, 1, 1, 1, 1, 1,
0.6448693, -0.8981597, 3.859745, 1, 1, 1, 1, 1,
0.645251, 0.1083159, 2.924858, 1, 1, 1, 1, 1,
0.6457277, -0.2198592, 2.054551, 1, 1, 1, 1, 1,
0.6495044, -2.353977, 3.446341, 1, 1, 1, 1, 1,
0.653253, -0.4858492, 4.487394, 1, 1, 1, 1, 1,
0.6543455, 0.4600111, -0.2515489, 1, 1, 1, 1, 1,
0.65675, -0.0007856514, 1.753385, 1, 1, 1, 1, 1,
0.6599677, -0.005132011, 2.148828, 1, 1, 1, 1, 1,
0.6600021, -1.316868, 1.154806, 1, 1, 1, 1, 1,
0.6610518, -0.04704515, 3.151074, 1, 1, 1, 1, 1,
0.662733, 0.8906323, 0.02174545, 1, 1, 1, 1, 1,
0.6659026, 0.6104496, -0.2864267, 1, 1, 1, 1, 1,
0.6728085, -0.924929, 3.454636, 1, 1, 1, 1, 1,
0.6757104, 0.5961448, 0.6868051, 0, 0, 1, 1, 1,
0.6840894, 0.03940547, 0.9958522, 1, 0, 0, 1, 1,
0.6886777, 1.329172, -0.6980491, 1, 0, 0, 1, 1,
0.6895248, -0.5804437, 2.302547, 1, 0, 0, 1, 1,
0.6936153, -0.8170163, 2.932459, 1, 0, 0, 1, 1,
0.6971932, -0.1216455, 3.530007, 1, 0, 0, 1, 1,
0.6979558, -0.2523525, 1.267833, 0, 0, 0, 1, 1,
0.700482, -0.7121487, 2.218263, 0, 0, 0, 1, 1,
0.7053901, -0.2065491, 2.026443, 0, 0, 0, 1, 1,
0.7072052, -0.8251616, 2.656886, 0, 0, 0, 1, 1,
0.7077104, -0.8993114, 1.973852, 0, 0, 0, 1, 1,
0.7167965, 0.4951058, 0.3471937, 0, 0, 0, 1, 1,
0.7175923, -1.04611, 0.8057683, 0, 0, 0, 1, 1,
0.7219405, 0.3292226, 1.325184, 1, 1, 1, 1, 1,
0.7234156, 0.5762814, 0.7710713, 1, 1, 1, 1, 1,
0.7248905, -1.101632, 3.198751, 1, 1, 1, 1, 1,
0.7284653, 0.4752845, 2.393606, 1, 1, 1, 1, 1,
0.7295487, 0.427937, 0.7483429, 1, 1, 1, 1, 1,
0.7302035, 0.9723699, -1.20282, 1, 1, 1, 1, 1,
0.7304645, -1.606092, 3.392541, 1, 1, 1, 1, 1,
0.7404717, 1.135235, 0.3243194, 1, 1, 1, 1, 1,
0.7407656, 0.2182828, 2.032399, 1, 1, 1, 1, 1,
0.741484, 1.278584, -0.7754043, 1, 1, 1, 1, 1,
0.7478181, 1.183776, 1.499495, 1, 1, 1, 1, 1,
0.7530566, -1.367964, 1.826602, 1, 1, 1, 1, 1,
0.7532973, 0.5400294, 3.311525, 1, 1, 1, 1, 1,
0.7552519, -1.115529, 1.514242, 1, 1, 1, 1, 1,
0.7563297, -0.3682614, 1.708432, 1, 1, 1, 1, 1,
0.7610828, -0.3023642, 1.540468, 0, 0, 1, 1, 1,
0.7644393, -0.3724644, 3.508411, 1, 0, 0, 1, 1,
0.7676471, -2.048712, 1.11902, 1, 0, 0, 1, 1,
0.7696092, 1.339779, 1.869808, 1, 0, 0, 1, 1,
0.7744318, 1.101226, 1.535599, 1, 0, 0, 1, 1,
0.774613, -1.207273, 1.200096, 1, 0, 0, 1, 1,
0.7806432, 0.4229167, 0.6550688, 0, 0, 0, 1, 1,
0.7834684, -1.264407, 3.172868, 0, 0, 0, 1, 1,
0.7845723, -0.5948178, 3.974964, 0, 0, 0, 1, 1,
0.7849019, -0.8217039, 1.566167, 0, 0, 0, 1, 1,
0.7883251, -0.2745705, 0.9403466, 0, 0, 0, 1, 1,
0.7956652, -0.6448399, 1.000802, 0, 0, 0, 1, 1,
0.800976, -1.201009, 0.6979241, 0, 0, 0, 1, 1,
0.8018274, 0.8568005, -0.08624197, 1, 1, 1, 1, 1,
0.8029215, -1.436007, 2.932808, 1, 1, 1, 1, 1,
0.8043461, -1.724675, 2.666043, 1, 1, 1, 1, 1,
0.8057979, -1.079993, 2.89562, 1, 1, 1, 1, 1,
0.8063585, -0.4232979, 2.002178, 1, 1, 1, 1, 1,
0.8079528, 1.219962, 0.8785682, 1, 1, 1, 1, 1,
0.8154767, -0.4666094, 3.11728, 1, 1, 1, 1, 1,
0.8179433, -1.494286, 4.573359, 1, 1, 1, 1, 1,
0.8179685, -1.921925, 2.672339, 1, 1, 1, 1, 1,
0.8263031, -0.3260624, 1.916328, 1, 1, 1, 1, 1,
0.8276358, -0.8138852, 1.847833, 1, 1, 1, 1, 1,
0.8368086, 0.2286635, 1.252666, 1, 1, 1, 1, 1,
0.8451285, 1.836554, 0.3138341, 1, 1, 1, 1, 1,
0.8483461, -1.384711, 1.948828, 1, 1, 1, 1, 1,
0.8483685, 0.26209, -0.09299714, 1, 1, 1, 1, 1,
0.8521714, -0.3874371, 2.642231, 0, 0, 1, 1, 1,
0.8611391, 2.073142, 0.8243926, 1, 0, 0, 1, 1,
0.8646501, -1.826602, 1.340694, 1, 0, 0, 1, 1,
0.8656429, 0.4809313, 1.789713, 1, 0, 0, 1, 1,
0.8688236, -1.284332, 3.654303, 1, 0, 0, 1, 1,
0.8706624, -1.435502, 3.26568, 1, 0, 0, 1, 1,
0.8720529, 0.4286185, 1.002865, 0, 0, 0, 1, 1,
0.8794559, -0.478974, 3.126914, 0, 0, 0, 1, 1,
0.8817641, -0.07225791, 1.186632, 0, 0, 0, 1, 1,
0.88925, -0.1583594, 2.415476, 0, 0, 0, 1, 1,
0.8934731, -0.2310881, -1.062287, 0, 0, 0, 1, 1,
0.8980854, -0.6905532, 2.774843, 0, 0, 0, 1, 1,
0.900154, 1.103125, 1.046683, 0, 0, 0, 1, 1,
0.9016878, -0.1648823, 0.9574246, 1, 1, 1, 1, 1,
0.9067843, -0.2384126, 1.029101, 1, 1, 1, 1, 1,
0.9070465, 2.206378, 0.8970632, 1, 1, 1, 1, 1,
0.9089442, -0.94421, 3.172886, 1, 1, 1, 1, 1,
0.9103718, 0.6330138, 2.258952, 1, 1, 1, 1, 1,
0.910939, -0.7258269, 1.395445, 1, 1, 1, 1, 1,
0.9194138, 0.3569736, 1.415927, 1, 1, 1, 1, 1,
0.9234456, 1.696688, -0.04981718, 1, 1, 1, 1, 1,
0.9274248, 0.3186746, 2.395511, 1, 1, 1, 1, 1,
0.9330472, -0.1288111, 1.400633, 1, 1, 1, 1, 1,
0.9360354, -0.545156, 1.886481, 1, 1, 1, 1, 1,
0.9372665, -1.227579, 1.543944, 1, 1, 1, 1, 1,
0.9405306, -0.4146977, 1.478398, 1, 1, 1, 1, 1,
0.9406021, 0.2024095, 1.778823, 1, 1, 1, 1, 1,
0.942243, -0.1228074, -0.99593, 1, 1, 1, 1, 1,
0.9434744, 1.48093, 0.7428654, 0, 0, 1, 1, 1,
0.9512248, 0.5620195, 1.30443, 1, 0, 0, 1, 1,
0.9515635, 1.111368, 2.419409, 1, 0, 0, 1, 1,
0.9530587, -0.4508091, 2.684271, 1, 0, 0, 1, 1,
0.953562, -0.8369328, 1.968539, 1, 0, 0, 1, 1,
0.9589429, -0.8858762, 2.483019, 1, 0, 0, 1, 1,
0.9592229, 0.04262417, 0.7613668, 0, 0, 0, 1, 1,
0.9699441, -2.673865, 3.733065, 0, 0, 0, 1, 1,
0.9823545, 0.8620862, 0.7552636, 0, 0, 0, 1, 1,
0.988193, -0.3942188, 2.086358, 0, 0, 0, 1, 1,
0.989365, -0.647519, 1.388928, 0, 0, 0, 1, 1,
0.9895217, -0.4568835, 1.290727, 0, 0, 0, 1, 1,
0.9975165, 1.139073, 0.5840448, 0, 0, 0, 1, 1,
1.005074, -0.1118284, -0.6340246, 1, 1, 1, 1, 1,
1.00601, 1.606943, 0.5629343, 1, 1, 1, 1, 1,
1.008333, 0.3687171, 1.749495, 1, 1, 1, 1, 1,
1.011663, -1.506679, 1.558821, 1, 1, 1, 1, 1,
1.015529, 0.7331362, 0.6787614, 1, 1, 1, 1, 1,
1.015974, -0.433896, 1.429287, 1, 1, 1, 1, 1,
1.019594, -0.2642806, 3.919505, 1, 1, 1, 1, 1,
1.023653, -1.224243, 1.805434, 1, 1, 1, 1, 1,
1.031243, -0.6973718, 0.5916092, 1, 1, 1, 1, 1,
1.032573, -0.872786, 2.13929, 1, 1, 1, 1, 1,
1.034851, 0.7640759, 0.9441959, 1, 1, 1, 1, 1,
1.036869, 0.25549, 1.391121, 1, 1, 1, 1, 1,
1.037189, 0.001425367, 1.380927, 1, 1, 1, 1, 1,
1.040839, -0.2430609, 1.280839, 1, 1, 1, 1, 1,
1.046725, -0.2647372, 2.529811, 1, 1, 1, 1, 1,
1.047535, 1.185994, 0.7062538, 0, 0, 1, 1, 1,
1.047646, 0.06598487, 2.532303, 1, 0, 0, 1, 1,
1.048255, 0.4939457, -0.2432555, 1, 0, 0, 1, 1,
1.048769, 3.100912, -0.8225015, 1, 0, 0, 1, 1,
1.050189, 0.9577132, 2.612605, 1, 0, 0, 1, 1,
1.051379, 0.09926426, 0.2441198, 1, 0, 0, 1, 1,
1.056351, -0.6692893, 0.3592808, 0, 0, 0, 1, 1,
1.064564, -0.212416, 2.392532, 0, 0, 0, 1, 1,
1.066581, -0.5953197, 1.126119, 0, 0, 0, 1, 1,
1.073605, 0.3605163, -0.7312042, 0, 0, 0, 1, 1,
1.073676, 1.054062, -0.09014285, 0, 0, 0, 1, 1,
1.076639, -1.55653, 1.774605, 0, 0, 0, 1, 1,
1.076911, 0.01766666, 0.6683007, 0, 0, 0, 1, 1,
1.081531, -0.3159891, 2.071063, 1, 1, 1, 1, 1,
1.0829, -1.867378, 3.814708, 1, 1, 1, 1, 1,
1.08693, -0.4840631, 1.017552, 1, 1, 1, 1, 1,
1.087248, 1.144816, 1.604179, 1, 1, 1, 1, 1,
1.088404, -0.009078261, 1.437967, 1, 1, 1, 1, 1,
1.097375, -0.3112395, 2.193438, 1, 1, 1, 1, 1,
1.101193, 1.032928, 1.237324, 1, 1, 1, 1, 1,
1.10593, 0.552435, 1.481196, 1, 1, 1, 1, 1,
1.11119, 1.320729, -0.7292855, 1, 1, 1, 1, 1,
1.118296, 0.3613669, 3.085779, 1, 1, 1, 1, 1,
1.12958, 0.1704002, 2.46907, 1, 1, 1, 1, 1,
1.143373, -1.817839, 1.290401, 1, 1, 1, 1, 1,
1.145906, -1.958862, 4.990229, 1, 1, 1, 1, 1,
1.146827, 0.7095438, 0.4376203, 1, 1, 1, 1, 1,
1.153068, 0.4351943, 1.162315, 1, 1, 1, 1, 1,
1.158702, 0.4485941, 0.4095772, 0, 0, 1, 1, 1,
1.161986, 0.2531162, -0.281591, 1, 0, 0, 1, 1,
1.169032, -0.7593414, 2.613274, 1, 0, 0, 1, 1,
1.172865, -0.5169377, 1.442656, 1, 0, 0, 1, 1,
1.174269, 1.472349, 1.236344, 1, 0, 0, 1, 1,
1.178373, 0.194744, 0.6628245, 1, 0, 0, 1, 1,
1.178422, 0.5164864, 0.3335034, 0, 0, 0, 1, 1,
1.186334, 0.3407055, 0.2805231, 0, 0, 0, 1, 1,
1.189812, 0.4796603, 0.3098084, 0, 0, 0, 1, 1,
1.194185, -0.1924614, 2.728372, 0, 0, 0, 1, 1,
1.204938, -0.008870556, 1.326153, 0, 0, 0, 1, 1,
1.211725, 0.3696551, 1.282646, 0, 0, 0, 1, 1,
1.215639, -0.2166866, 1.874605, 0, 0, 0, 1, 1,
1.225971, 1.168254, 0.2779611, 1, 1, 1, 1, 1,
1.22699, 1.560235, 0.9418615, 1, 1, 1, 1, 1,
1.236593, -0.03962237, 3.162089, 1, 1, 1, 1, 1,
1.237947, -0.9459215, 1.229662, 1, 1, 1, 1, 1,
1.238692, -0.3978227, 3.332855, 1, 1, 1, 1, 1,
1.238867, -0.9167452, 1.622366, 1, 1, 1, 1, 1,
1.244152, 0.9456717, 0.2378284, 1, 1, 1, 1, 1,
1.245025, 0.4421188, 0.9512731, 1, 1, 1, 1, 1,
1.247137, -1.974226, 2.482696, 1, 1, 1, 1, 1,
1.255225, 0.672716, 1.038693, 1, 1, 1, 1, 1,
1.258937, -1.140738, 3.901213, 1, 1, 1, 1, 1,
1.259557, -0.412291, 0.8970703, 1, 1, 1, 1, 1,
1.262202, 2.481597, 2.339865, 1, 1, 1, 1, 1,
1.262781, 0.4097976, 2.870293, 1, 1, 1, 1, 1,
1.270714, -1.779302, 2.426942, 1, 1, 1, 1, 1,
1.273221, -1.033754, 2.218395, 0, 0, 1, 1, 1,
1.278088, 0.507216, 2.231439, 1, 0, 0, 1, 1,
1.310709, -0.6948203, 0.7514612, 1, 0, 0, 1, 1,
1.324939, -0.3802015, 2.609775, 1, 0, 0, 1, 1,
1.327061, -1.367908, 2.007684, 1, 0, 0, 1, 1,
1.330792, 1.161875, 0.7698197, 1, 0, 0, 1, 1,
1.334957, -0.2823038, 0.8187048, 0, 0, 0, 1, 1,
1.341193, -0.957221, 3.060282, 0, 0, 0, 1, 1,
1.343328, 0.4407379, 0.4076581, 0, 0, 0, 1, 1,
1.35006, -0.4389813, 2.362929, 0, 0, 0, 1, 1,
1.352495, -0.4141873, 2.384344, 0, 0, 0, 1, 1,
1.374899, -0.3962458, 0.9333867, 0, 0, 0, 1, 1,
1.383323, 0.6251738, 2.322559, 0, 0, 0, 1, 1,
1.385749, 0.4116841, 1.078518, 1, 1, 1, 1, 1,
1.391652, -1.476385, 3.611582, 1, 1, 1, 1, 1,
1.408015, 0.5764696, 0.04611324, 1, 1, 1, 1, 1,
1.416066, -0.04234728, 1.146828, 1, 1, 1, 1, 1,
1.437395, 0.5511187, 1.966022, 1, 1, 1, 1, 1,
1.457995, 0.6207268, -0.857217, 1, 1, 1, 1, 1,
1.460994, -1.051374, 1.104524, 1, 1, 1, 1, 1,
1.466864, -0.6098961, 5.253652, 1, 1, 1, 1, 1,
1.48374, -0.1549502, 2.248075, 1, 1, 1, 1, 1,
1.484773, -0.6642802, 1.820393, 1, 1, 1, 1, 1,
1.486821, 2.158268, -0.6733046, 1, 1, 1, 1, 1,
1.497629, 0.8082205, 0.8756809, 1, 1, 1, 1, 1,
1.51008, 0.153677, 1.481038, 1, 1, 1, 1, 1,
1.526978, -0.3877223, 2.446326, 1, 1, 1, 1, 1,
1.52857, -1.071411, 4.680264, 1, 1, 1, 1, 1,
1.543399, 0.5935366, 0.3280078, 0, 0, 1, 1, 1,
1.547685, -1.4898, 1.882155, 1, 0, 0, 1, 1,
1.568929, -0.05024964, 1.741152, 1, 0, 0, 1, 1,
1.596788, -2.110332, 1.956733, 1, 0, 0, 1, 1,
1.609807, 1.037196, 3.105409, 1, 0, 0, 1, 1,
1.611813, -0.4973689, 1.209451, 1, 0, 0, 1, 1,
1.622432, 0.02895989, 1.051856, 0, 0, 0, 1, 1,
1.622846, -0.1532238, -0.06354751, 0, 0, 0, 1, 1,
1.629823, 1.599383, 0.491792, 0, 0, 0, 1, 1,
1.630876, -0.6300995, 1.463462, 0, 0, 0, 1, 1,
1.632127, 0.3584847, 2.560393, 0, 0, 0, 1, 1,
1.638369, 0.7349098, 2.625352, 0, 0, 0, 1, 1,
1.65042, -2.179189, 2.81595, 0, 0, 0, 1, 1,
1.674164, -0.5170295, 3.079242, 1, 1, 1, 1, 1,
1.680182, 0.4981094, 0.6192561, 1, 1, 1, 1, 1,
1.686417, 0.6640942, 2.08322, 1, 1, 1, 1, 1,
1.690018, 1.033368, 1.760729, 1, 1, 1, 1, 1,
1.693851, 0.4286943, -1.779388, 1, 1, 1, 1, 1,
1.697966, 0.3168484, 0.8068831, 1, 1, 1, 1, 1,
1.710158, -0.7997949, 1.753992, 1, 1, 1, 1, 1,
1.713441, 0.9355802, 1.853459, 1, 1, 1, 1, 1,
1.717915, 0.235891, -0.3860217, 1, 1, 1, 1, 1,
1.722277, -1.421778, 2.507659, 1, 1, 1, 1, 1,
1.725784, -1.389848, 2.249602, 1, 1, 1, 1, 1,
1.733264, -0.9160179, 3.146131, 1, 1, 1, 1, 1,
1.745683, -1.876644, 2.51483, 1, 1, 1, 1, 1,
1.761289, 0.7170991, 0.4287829, 1, 1, 1, 1, 1,
1.767789, 0.8755447, 1.137138, 1, 1, 1, 1, 1,
1.796628, -1.64927, 1.392171, 0, 0, 1, 1, 1,
1.799717, 1.1276, 0.315836, 1, 0, 0, 1, 1,
1.805446, 0.6424028, 1.353788, 1, 0, 0, 1, 1,
1.820642, -0.1567532, 1.140561, 1, 0, 0, 1, 1,
1.847453, -0.6343184, 1.370897, 1, 0, 0, 1, 1,
1.867026, -0.04761563, 1.322202, 1, 0, 0, 1, 1,
1.872156, -0.7183276, 1.641704, 0, 0, 0, 1, 1,
1.87651, -0.1527228, 0.5969547, 0, 0, 0, 1, 1,
1.880273, 1.707154, 0.8489842, 0, 0, 0, 1, 1,
1.888431, -0.3674176, 0.9764985, 0, 0, 0, 1, 1,
1.8965, -1.608191, 3.720377, 0, 0, 0, 1, 1,
1.912456, -0.2173288, 4.648702, 0, 0, 0, 1, 1,
1.939744, 0.6509104, 1.167136, 0, 0, 0, 1, 1,
1.948969, -0.8588766, 4.839293, 1, 1, 1, 1, 1,
1.950011, -1.343031, 2.599299, 1, 1, 1, 1, 1,
1.960861, -0.3836109, 2.441767, 1, 1, 1, 1, 1,
1.963777, 0.7299854, -0.8848996, 1, 1, 1, 1, 1,
1.963907, -0.7001684, 2.83559, 1, 1, 1, 1, 1,
1.976226, -0.9334377, 0.6382579, 1, 1, 1, 1, 1,
2.011046, 1.662845, 1.626108, 1, 1, 1, 1, 1,
2.015885, -0.2409138, 2.3841, 1, 1, 1, 1, 1,
2.024519, 1.094532, -0.02806458, 1, 1, 1, 1, 1,
2.033278, -0.7802799, 2.97749, 1, 1, 1, 1, 1,
2.03395, -1.75979, 2.99342, 1, 1, 1, 1, 1,
2.050965, -0.1988072, 0.9272299, 1, 1, 1, 1, 1,
2.110435, 0.6040545, 2.012567, 1, 1, 1, 1, 1,
2.13133, -0.919232, 2.759039, 1, 1, 1, 1, 1,
2.147089, 0.009365219, 0.3217513, 1, 1, 1, 1, 1,
2.165395, 2.046297, -0.5595875, 0, 0, 1, 1, 1,
2.249405, -0.6471771, 0.3268775, 1, 0, 0, 1, 1,
2.260391, 0.478892, 1.778787, 1, 0, 0, 1, 1,
2.282883, -0.1374099, 0.1848352, 1, 0, 0, 1, 1,
2.318775, -1.165516, 2.253556, 1, 0, 0, 1, 1,
2.384815, -2.255966, 1.539368, 1, 0, 0, 1, 1,
2.425829, 0.5966595, 1.741791, 0, 0, 0, 1, 1,
2.426342, -0.09645084, 0.228186, 0, 0, 0, 1, 1,
2.427726, -0.2872975, 2.866586, 0, 0, 0, 1, 1,
2.445631, -0.4003969, 0.500537, 0, 0, 0, 1, 1,
2.508488, -0.8189556, 0.5440509, 0, 0, 0, 1, 1,
2.633593, 1.058459, 2.150213, 0, 0, 0, 1, 1,
2.71489, -1.357837, 3.033465, 0, 0, 0, 1, 1,
2.721251, -0.5585333, 1.637562, 1, 1, 1, 1, 1,
2.742371, 0.430233, 2.609473, 1, 1, 1, 1, 1,
2.789752, -1.008589, 1.048583, 1, 1, 1, 1, 1,
2.846462, -0.08510349, 1.265467, 1, 1, 1, 1, 1,
2.965821, 0.7214519, 0.9484136, 1, 1, 1, 1, 1,
2.968385, 0.6658458, 2.409349, 1, 1, 1, 1, 1,
3.166106, -0.9706182, 3.212558, 1, 1, 1, 1, 1
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
var radius = 9.5617;
var distance = 33.58506;
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
mvMatrix.translate( -0.05812907, 0.05145526, 0.1838276 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.58506);
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