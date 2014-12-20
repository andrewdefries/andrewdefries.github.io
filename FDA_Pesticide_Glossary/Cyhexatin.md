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
-4.107978, -0.7716829, -0.8628945, 1, 0, 0, 1,
-3.656754, -0.3354789, -0.5499837, 1, 0.007843138, 0, 1,
-3.275529, 1.860179, -1.656462, 1, 0.01176471, 0, 1,
-3.164733, -1.935015, -0.9557546, 1, 0.01960784, 0, 1,
-2.662341, -2.139303, -3.595233, 1, 0.02352941, 0, 1,
-2.542174, 0.4387824, -0.3340722, 1, 0.03137255, 0, 1,
-2.464345, -1.813861, -1.269449, 1, 0.03529412, 0, 1,
-2.46074, 1.69496, -1.684735, 1, 0.04313726, 0, 1,
-2.439626, -0.647594, -2.296696, 1, 0.04705882, 0, 1,
-2.269822, 1.836695, -2.411408, 1, 0.05490196, 0, 1,
-2.250598, 0.451071, -1.866477, 1, 0.05882353, 0, 1,
-2.232585, 2.549045, -0.6256291, 1, 0.06666667, 0, 1,
-2.166263, -1.535761, -1.261577, 1, 0.07058824, 0, 1,
-2.148047, -0.1618505, -2.203068, 1, 0.07843138, 0, 1,
-2.129236, -0.2436678, -2.559588, 1, 0.08235294, 0, 1,
-2.09712, -0.138793, -0.4678441, 1, 0.09019608, 0, 1,
-2.08986, -0.4205205, 0.6594101, 1, 0.09411765, 0, 1,
-2.085073, -0.3141365, -1.835955, 1, 0.1019608, 0, 1,
-2.078099, -0.6742977, -1.563842, 1, 0.1098039, 0, 1,
-2.075501, 0.7965963, -1.692199, 1, 0.1137255, 0, 1,
-2.073767, -1.628664, -3.928144, 1, 0.1215686, 0, 1,
-2.050372, -1.028021, -1.637107, 1, 0.1254902, 0, 1,
-2.045041, -0.9762434, -3.600857, 1, 0.1333333, 0, 1,
-2.017084, -0.5926271, -1.41224, 1, 0.1372549, 0, 1,
-2.00743, -1.262903, -2.711926, 1, 0.145098, 0, 1,
-1.989797, 0.771748, -1.004243, 1, 0.1490196, 0, 1,
-1.970881, -0.1222449, -1.230835, 1, 0.1568628, 0, 1,
-1.964098, 0.2790292, -1.061145, 1, 0.1607843, 0, 1,
-1.92598, -0.4587924, -2.102638, 1, 0.1686275, 0, 1,
-1.915934, -0.3199981, -1.224997, 1, 0.172549, 0, 1,
-1.884918, -1.199018, -1.926021, 1, 0.1803922, 0, 1,
-1.881597, 0.8659708, -2.274877, 1, 0.1843137, 0, 1,
-1.850905, 0.223055, -0.6145897, 1, 0.1921569, 0, 1,
-1.848123, -0.8377588, -2.026515, 1, 0.1960784, 0, 1,
-1.814079, -1.783992, -2.057824, 1, 0.2039216, 0, 1,
-1.812272, 0.207206, -3.820112, 1, 0.2117647, 0, 1,
-1.802772, -1.174467, -3.817039, 1, 0.2156863, 0, 1,
-1.801198, -0.781301, -1.39765, 1, 0.2235294, 0, 1,
-1.782758, -1.110176, -0.8973278, 1, 0.227451, 0, 1,
-1.765908, 0.03905283, -2.345124, 1, 0.2352941, 0, 1,
-1.744936, -0.8799981, -2.997491, 1, 0.2392157, 0, 1,
-1.739319, 1.437552, -0.8898805, 1, 0.2470588, 0, 1,
-1.731824, -0.5062266, -2.122967, 1, 0.2509804, 0, 1,
-1.731593, -1.264337, -4.736569, 1, 0.2588235, 0, 1,
-1.709546, 0.8219118, 0.1386041, 1, 0.2627451, 0, 1,
-1.703752, -0.6059793, -1.736273, 1, 0.2705882, 0, 1,
-1.686364, 0.5276039, -0.05626781, 1, 0.2745098, 0, 1,
-1.679933, 0.3485483, -1.628339, 1, 0.282353, 0, 1,
-1.677846, -1.367795, -3.347338, 1, 0.2862745, 0, 1,
-1.676674, -1.932981, -1.344832, 1, 0.2941177, 0, 1,
-1.668046, 0.1481109, -0.8618426, 1, 0.3019608, 0, 1,
-1.667302, 0.2900063, -2.03951, 1, 0.3058824, 0, 1,
-1.644655, -0.5168313, -1.687796, 1, 0.3137255, 0, 1,
-1.612237, -1.303812, -1.67713, 1, 0.3176471, 0, 1,
-1.601701, 0.6470441, -0.5995668, 1, 0.3254902, 0, 1,
-1.597111, -0.4233022, -2.019765, 1, 0.3294118, 0, 1,
-1.59327, -0.1717999, -4.120162, 1, 0.3372549, 0, 1,
-1.587993, -2.631799, -2.799188, 1, 0.3411765, 0, 1,
-1.585556, -0.2665912, -1.09638, 1, 0.3490196, 0, 1,
-1.57992, -1.243739, -2.961567, 1, 0.3529412, 0, 1,
-1.571362, 0.646987, -0.3159349, 1, 0.3607843, 0, 1,
-1.564517, -0.9349406, -3.875407, 1, 0.3647059, 0, 1,
-1.557902, -1.238016, -3.226962, 1, 0.372549, 0, 1,
-1.547831, -0.5435663, -2.557909, 1, 0.3764706, 0, 1,
-1.536788, -2.962397, -3.349001, 1, 0.3843137, 0, 1,
-1.523277, -0.4144758, -2.531769, 1, 0.3882353, 0, 1,
-1.521709, -0.2266666, -1.375631, 1, 0.3960784, 0, 1,
-1.519231, 0.8955372, -0.6669448, 1, 0.4039216, 0, 1,
-1.516167, 0.00972865, -2.207557, 1, 0.4078431, 0, 1,
-1.515357, 1.275651, -0.1671712, 1, 0.4156863, 0, 1,
-1.507645, 1.431716, -1.120971, 1, 0.4196078, 0, 1,
-1.493984, -0.6254399, -2.36359, 1, 0.427451, 0, 1,
-1.490939, 0.756354, -1.872986, 1, 0.4313726, 0, 1,
-1.478936, -2.892133, -3.091261, 1, 0.4392157, 0, 1,
-1.477756, -0.5936016, -0.8875606, 1, 0.4431373, 0, 1,
-1.472423, 0.8632887, -1.2004, 1, 0.4509804, 0, 1,
-1.463923, -1.649317, -3.53914, 1, 0.454902, 0, 1,
-1.460195, 0.7268361, -1.044685, 1, 0.4627451, 0, 1,
-1.448677, 1.007254, -0.09503813, 1, 0.4666667, 0, 1,
-1.444407, 0.5392848, -0.2361709, 1, 0.4745098, 0, 1,
-1.441417, -0.4828239, -2.319202, 1, 0.4784314, 0, 1,
-1.437544, 1.047327, -2.157529, 1, 0.4862745, 0, 1,
-1.436538, -0.7616345, -2.587981, 1, 0.4901961, 0, 1,
-1.418717, -0.3160411, -1.249406, 1, 0.4980392, 0, 1,
-1.41274, 0.741004, -1.770919, 1, 0.5058824, 0, 1,
-1.412474, 0.461021, -3.057552, 1, 0.509804, 0, 1,
-1.412088, -1.811033, -3.447498, 1, 0.5176471, 0, 1,
-1.404877, -0.9404044, -2.198834, 1, 0.5215687, 0, 1,
-1.385177, -0.1861087, 0.09638526, 1, 0.5294118, 0, 1,
-1.384665, -1.014526, -2.812407, 1, 0.5333334, 0, 1,
-1.382364, -0.2563431, -2.42608, 1, 0.5411765, 0, 1,
-1.382266, -0.1519036, -1.142337, 1, 0.5450981, 0, 1,
-1.380967, -0.247366, -1.844342, 1, 0.5529412, 0, 1,
-1.379983, -0.1211332, -4.347715, 1, 0.5568628, 0, 1,
-1.379805, 0.003696858, -0.2255146, 1, 0.5647059, 0, 1,
-1.37267, 0.8745627, -1.836722, 1, 0.5686275, 0, 1,
-1.372381, 0.1140165, -0.3513008, 1, 0.5764706, 0, 1,
-1.366646, -0.4833378, -3.791023, 1, 0.5803922, 0, 1,
-1.36454, 0.3804094, -1.847698, 1, 0.5882353, 0, 1,
-1.359946, -2.592994, -1.963962, 1, 0.5921569, 0, 1,
-1.358668, 2.591811, -1.992482, 1, 0.6, 0, 1,
-1.357959, 0.2964991, -0.6376925, 1, 0.6078432, 0, 1,
-1.346738, -0.1337352, -1.253748, 1, 0.6117647, 0, 1,
-1.34566, 0.2287258, -1.924643, 1, 0.6196079, 0, 1,
-1.343006, -0.07468417, 0.3194357, 1, 0.6235294, 0, 1,
-1.333746, 0.7471502, -0.4828343, 1, 0.6313726, 0, 1,
-1.332896, 0.5841204, -1.458155, 1, 0.6352941, 0, 1,
-1.332105, 0.5179426, -1.922265, 1, 0.6431373, 0, 1,
-1.331496, -0.6631369, -2.405411, 1, 0.6470588, 0, 1,
-1.329299, -1.253135, -2.455156, 1, 0.654902, 0, 1,
-1.322492, -1.484926, -3.117562, 1, 0.6588235, 0, 1,
-1.321942, -1.203533, -3.030583, 1, 0.6666667, 0, 1,
-1.320107, -0.2347176, -3.342176, 1, 0.6705883, 0, 1,
-1.319188, 0.3147863, -1.871539, 1, 0.6784314, 0, 1,
-1.314812, 0.8344372, -1.104902, 1, 0.682353, 0, 1,
-1.314464, -0.1840713, -1.005358, 1, 0.6901961, 0, 1,
-1.31402, 0.1905399, -1.799906, 1, 0.6941177, 0, 1,
-1.29841, -0.1940006, -1.262038, 1, 0.7019608, 0, 1,
-1.297524, -0.8889824, -2.888257, 1, 0.7098039, 0, 1,
-1.294352, -1.867295, -3.865742, 1, 0.7137255, 0, 1,
-1.29147, -0.08665514, -2.038758, 1, 0.7215686, 0, 1,
-1.266925, 1.341158, -0.995518, 1, 0.7254902, 0, 1,
-1.26692, -0.7906777, -3.101695, 1, 0.7333333, 0, 1,
-1.265138, -1.200252, -2.234816, 1, 0.7372549, 0, 1,
-1.232037, -1.305588, -2.255074, 1, 0.7450981, 0, 1,
-1.217612, 0.1138244, -0.8452091, 1, 0.7490196, 0, 1,
-1.215648, -0.2519011, -0.829994, 1, 0.7568628, 0, 1,
-1.213, -0.00665231, -2.132303, 1, 0.7607843, 0, 1,
-1.212626, 0.5094084, -1.847542, 1, 0.7686275, 0, 1,
-1.209412, 1.526674, 2.121659, 1, 0.772549, 0, 1,
-1.208423, 3.159564, -2.041969, 1, 0.7803922, 0, 1,
-1.204545, 0.2066401, -0.7885947, 1, 0.7843137, 0, 1,
-1.202392, -1.614525, -2.37073, 1, 0.7921569, 0, 1,
-1.194898, -0.6308357, -1.550032, 1, 0.7960784, 0, 1,
-1.189123, -0.7791867, -2.011145, 1, 0.8039216, 0, 1,
-1.18734, 0.720593, -0.9043761, 1, 0.8117647, 0, 1,
-1.186555, -1.257012, -1.223107, 1, 0.8156863, 0, 1,
-1.181279, -0.922334, -4.048584, 1, 0.8235294, 0, 1,
-1.16742, 1.026839, -0.1477711, 1, 0.827451, 0, 1,
-1.165419, 0.3671247, -2.318388, 1, 0.8352941, 0, 1,
-1.161484, -2.122714, -1.960631, 1, 0.8392157, 0, 1,
-1.151387, 1.047154, -0.3694536, 1, 0.8470588, 0, 1,
-1.147094, 1.331149, 0.4579151, 1, 0.8509804, 0, 1,
-1.138381, -0.5370532, -3.017342, 1, 0.8588235, 0, 1,
-1.138174, -1.169399, -3.437688, 1, 0.8627451, 0, 1,
-1.130844, -0.5981393, -0.5815473, 1, 0.8705882, 0, 1,
-1.128403, -1.570272, -3.671634, 1, 0.8745098, 0, 1,
-1.127574, -0.3417649, -1.712392, 1, 0.8823529, 0, 1,
-1.11851, -0.6091356, -3.508214, 1, 0.8862745, 0, 1,
-1.117875, 0.6666068, -1.317536, 1, 0.8941177, 0, 1,
-1.114137, 0.7186146, -2.621757, 1, 0.8980392, 0, 1,
-1.113944, 0.1826543, 0.06994482, 1, 0.9058824, 0, 1,
-1.107977, -0.7146521, -2.658953, 1, 0.9137255, 0, 1,
-1.106312, 0.03368198, -2.789084, 1, 0.9176471, 0, 1,
-1.102798, -0.9043228, -1.725524, 1, 0.9254902, 0, 1,
-1.09928, 1.686786, -0.1826871, 1, 0.9294118, 0, 1,
-1.098812, -1.23474, -1.807082, 1, 0.9372549, 0, 1,
-1.079856, -1.136781, -0.5602273, 1, 0.9411765, 0, 1,
-1.076907, -0.3906369, -2.004996, 1, 0.9490196, 0, 1,
-1.073931, 1.381759, -1.134409, 1, 0.9529412, 0, 1,
-1.058393, -0.4996941, -1.021948, 1, 0.9607843, 0, 1,
-1.057454, -0.3618339, -2.941258, 1, 0.9647059, 0, 1,
-1.05073, 0.1510929, -1.114482, 1, 0.972549, 0, 1,
-1.044793, 1.797278, -2.12708, 1, 0.9764706, 0, 1,
-1.043196, 1.104707, -1.542996, 1, 0.9843137, 0, 1,
-1.040823, -0.7991029, -1.497714, 1, 0.9882353, 0, 1,
-1.040556, 1.532949, -0.8445883, 1, 0.9960784, 0, 1,
-1.035218, -0.3215786, -1.403949, 0.9960784, 1, 0, 1,
-1.028789, 1.130901, 0.3448152, 0.9921569, 1, 0, 1,
-1.023155, 0.7647783, -0.730843, 0.9843137, 1, 0, 1,
-1.020732, 0.9575436, -3.324531, 0.9803922, 1, 0, 1,
-1.01912, 0.453623, -1.420402, 0.972549, 1, 0, 1,
-1.007081, -0.6505924, -1.441785, 0.9686275, 1, 0, 1,
-0.9968147, 1.518359, 0.4856826, 0.9607843, 1, 0, 1,
-0.9950459, -0.5231127, -2.496725, 0.9568627, 1, 0, 1,
-0.9903785, 1.363176, -1.363273, 0.9490196, 1, 0, 1,
-0.9790229, -0.8005663, -2.214192, 0.945098, 1, 0, 1,
-0.9788166, 1.353433, 0.5061447, 0.9372549, 1, 0, 1,
-0.9744393, -0.02220724, -1.21329, 0.9333333, 1, 0, 1,
-0.9709747, -1.38824, -1.961864, 0.9254902, 1, 0, 1,
-0.9701959, 1.481789, -2.704462, 0.9215686, 1, 0, 1,
-0.9583535, 0.9404217, 0.1894674, 0.9137255, 1, 0, 1,
-0.9569926, 0.819472, -1.043742, 0.9098039, 1, 0, 1,
-0.955193, -0.1685206, -1.115154, 0.9019608, 1, 0, 1,
-0.9450378, -0.6384551, -2.973783, 0.8941177, 1, 0, 1,
-0.943023, -0.9883053, -0.6223529, 0.8901961, 1, 0, 1,
-0.9391785, 1.055349, -0.387086, 0.8823529, 1, 0, 1,
-0.938289, 0.9235296, 0.6566535, 0.8784314, 1, 0, 1,
-0.9377968, -1.056386, 0.2358717, 0.8705882, 1, 0, 1,
-0.9274095, -0.1633281, -0.9714046, 0.8666667, 1, 0, 1,
-0.921738, -0.6770499, -1.838029, 0.8588235, 1, 0, 1,
-0.9188004, -1.714346, -2.109283, 0.854902, 1, 0, 1,
-0.8989705, -0.6557327, -3.722532, 0.8470588, 1, 0, 1,
-0.8949093, -0.01054949, -0.7515355, 0.8431373, 1, 0, 1,
-0.8933891, 0.4678559, -1.350878, 0.8352941, 1, 0, 1,
-0.8921376, -0.2148641, -2.127154, 0.8313726, 1, 0, 1,
-0.8918914, -0.4827907, -2.895703, 0.8235294, 1, 0, 1,
-0.8906336, 0.198305, -0.4864278, 0.8196079, 1, 0, 1,
-0.885322, -0.9868293, -2.274698, 0.8117647, 1, 0, 1,
-0.8776041, 0.6437469, 0.4258695, 0.8078431, 1, 0, 1,
-0.8697259, 1.636203, -0.3740554, 0.8, 1, 0, 1,
-0.8660623, 1.767573, 0.07553025, 0.7921569, 1, 0, 1,
-0.8644109, -0.3781056, -2.33382, 0.7882353, 1, 0, 1,
-0.8632715, 0.627714, -0.5003715, 0.7803922, 1, 0, 1,
-0.8581677, 0.8339409, -1.77073, 0.7764706, 1, 0, 1,
-0.8511289, -1.410975, -1.584711, 0.7686275, 1, 0, 1,
-0.8448915, -1.501871, -3.024058, 0.7647059, 1, 0, 1,
-0.8415892, -0.01849796, -2.703674, 0.7568628, 1, 0, 1,
-0.839599, -1.594691, -1.415767, 0.7529412, 1, 0, 1,
-0.8351118, -1.037543, -2.362018, 0.7450981, 1, 0, 1,
-0.8344467, 0.4354898, -0.6396505, 0.7411765, 1, 0, 1,
-0.8341613, 0.258091, -1.700879, 0.7333333, 1, 0, 1,
-0.821039, 0.9157638, 0.7599237, 0.7294118, 1, 0, 1,
-0.8167349, 1.213777, -1.008657, 0.7215686, 1, 0, 1,
-0.8065058, -0.3695661, -1.504376, 0.7176471, 1, 0, 1,
-0.8060243, 0.5599996, -1.957423, 0.7098039, 1, 0, 1,
-0.8043905, -1.652414, -2.212282, 0.7058824, 1, 0, 1,
-0.8027374, 0.2418388, 0.5761784, 0.6980392, 1, 0, 1,
-0.8002431, 1.202459, 0.9024941, 0.6901961, 1, 0, 1,
-0.7959265, -0.926248, -2.535515, 0.6862745, 1, 0, 1,
-0.7908938, 0.1993688, -1.660663, 0.6784314, 1, 0, 1,
-0.7890474, -1.771926, -3.319992, 0.6745098, 1, 0, 1,
-0.7847549, 0.3298951, -1.54005, 0.6666667, 1, 0, 1,
-0.7845868, 0.7263193, -1.161864, 0.6627451, 1, 0, 1,
-0.7839063, 0.7713768, 0.8369263, 0.654902, 1, 0, 1,
-0.7834138, -0.04337744, -1.400059, 0.6509804, 1, 0, 1,
-0.780405, -0.0441942, -0.4293507, 0.6431373, 1, 0, 1,
-0.7716162, -0.3624488, -2.722214, 0.6392157, 1, 0, 1,
-0.7708269, -0.4801484, -3.065717, 0.6313726, 1, 0, 1,
-0.7632549, 1.011213, -0.7081705, 0.627451, 1, 0, 1,
-0.7629328, -0.7928473, -2.735309, 0.6196079, 1, 0, 1,
-0.7584437, 0.8457688, -0.03684457, 0.6156863, 1, 0, 1,
-0.7577264, 1.580129, -0.1239278, 0.6078432, 1, 0, 1,
-0.7562612, -0.4913238, -1.613655, 0.6039216, 1, 0, 1,
-0.7547172, -0.6703133, -3.169085, 0.5960785, 1, 0, 1,
-0.7546933, -0.3789496, -2.912638, 0.5882353, 1, 0, 1,
-0.7515937, 1.511885, -0.07197889, 0.5843138, 1, 0, 1,
-0.7510812, -0.4387513, -0.6057984, 0.5764706, 1, 0, 1,
-0.7476066, 0.9704955, -0.3803857, 0.572549, 1, 0, 1,
-0.7395286, -1.285351, -2.142862, 0.5647059, 1, 0, 1,
-0.7393231, -2.563406, -4.103857, 0.5607843, 1, 0, 1,
-0.7389809, -1.410738, -2.028668, 0.5529412, 1, 0, 1,
-0.7330804, -0.4249075, -3.459916, 0.5490196, 1, 0, 1,
-0.729955, -0.7790452, -3.1725, 0.5411765, 1, 0, 1,
-0.7264817, 1.407775, -0.8545205, 0.5372549, 1, 0, 1,
-0.7208828, 0.4318544, -2.845429, 0.5294118, 1, 0, 1,
-0.7149103, 1.059846, 0.03770142, 0.5254902, 1, 0, 1,
-0.7080104, 0.07912305, -2.145401, 0.5176471, 1, 0, 1,
-0.7011124, -0.6429785, -1.595691, 0.5137255, 1, 0, 1,
-0.6916804, -1.411165, -1.772503, 0.5058824, 1, 0, 1,
-0.6829914, -0.01447735, -2.652914, 0.5019608, 1, 0, 1,
-0.6817422, 0.0724562, -1.397989, 0.4941176, 1, 0, 1,
-0.6770431, 1.199089, -0.6099641, 0.4862745, 1, 0, 1,
-0.6667246, 1.199745, -0.01976134, 0.4823529, 1, 0, 1,
-0.6593946, -0.06395224, -0.8194546, 0.4745098, 1, 0, 1,
-0.6509669, 0.3467338, -1.18774, 0.4705882, 1, 0, 1,
-0.647971, 1.236248, -2.155404, 0.4627451, 1, 0, 1,
-0.6467953, 1.335244, -1.379275, 0.4588235, 1, 0, 1,
-0.6449708, 0.4309389, -0.4227833, 0.4509804, 1, 0, 1,
-0.6435962, 0.7504664, -0.9584079, 0.4470588, 1, 0, 1,
-0.6419439, -0.02090062, -1.927881, 0.4392157, 1, 0, 1,
-0.6367857, 1.136712, -0.1422023, 0.4352941, 1, 0, 1,
-0.6365499, -1.76537, -2.532104, 0.427451, 1, 0, 1,
-0.6352024, -1.390913, -3.090081, 0.4235294, 1, 0, 1,
-0.6318877, -0.552005, -2.621579, 0.4156863, 1, 0, 1,
-0.6308611, -0.9113951, -3.443943, 0.4117647, 1, 0, 1,
-0.6305852, -0.3635966, -1.711582, 0.4039216, 1, 0, 1,
-0.6284814, 0.1512907, -0.7031182, 0.3960784, 1, 0, 1,
-0.6214281, 0.5884806, -1.328218, 0.3921569, 1, 0, 1,
-0.6176327, -1.095014, -3.243518, 0.3843137, 1, 0, 1,
-0.6165659, -0.5511053, -1.459725, 0.3803922, 1, 0, 1,
-0.6159058, -1.408796, -3.238057, 0.372549, 1, 0, 1,
-0.6153409, -1.401153, -1.315163, 0.3686275, 1, 0, 1,
-0.6128834, 0.5495705, 0.4427893, 0.3607843, 1, 0, 1,
-0.6122271, 0.4985803, -2.885864, 0.3568628, 1, 0, 1,
-0.6095055, 0.6151971, -0.2065985, 0.3490196, 1, 0, 1,
-0.6065419, 0.9709957, -0.600634, 0.345098, 1, 0, 1,
-0.600131, 0.2323448, -0.9114646, 0.3372549, 1, 0, 1,
-0.5989987, -1.363352, -3.335974, 0.3333333, 1, 0, 1,
-0.5966526, 0.02718794, -1.406565, 0.3254902, 1, 0, 1,
-0.5964288, -0.6807441, -2.480364, 0.3215686, 1, 0, 1,
-0.5860462, 0.01926524, -1.787784, 0.3137255, 1, 0, 1,
-0.5778868, -1.189773, -2.271706, 0.3098039, 1, 0, 1,
-0.5777392, 0.9131007, -1.099422, 0.3019608, 1, 0, 1,
-0.5764319, -0.6205322, -3.850586, 0.2941177, 1, 0, 1,
-0.5747827, -0.1955862, -0.7752406, 0.2901961, 1, 0, 1,
-0.5746627, -1.65967, -2.292447, 0.282353, 1, 0, 1,
-0.5699684, -0.4575682, -2.099432, 0.2784314, 1, 0, 1,
-0.5688319, 0.02780096, -0.4745533, 0.2705882, 1, 0, 1,
-0.5536881, -0.4746663, -3.183681, 0.2666667, 1, 0, 1,
-0.552482, 0.09648806, -1.665042, 0.2588235, 1, 0, 1,
-0.5503407, 0.1863493, -2.390787, 0.254902, 1, 0, 1,
-0.5492701, -0.2980812, -2.723451, 0.2470588, 1, 0, 1,
-0.5479901, 0.08464818, 0.1411226, 0.2431373, 1, 0, 1,
-0.5475785, 0.6506471, -0.9641236, 0.2352941, 1, 0, 1,
-0.5456199, 1.737247, -1.679486, 0.2313726, 1, 0, 1,
-0.5407246, 0.3710847, -2.108256, 0.2235294, 1, 0, 1,
-0.5355954, -0.4485792, -1.983941, 0.2196078, 1, 0, 1,
-0.5323611, 0.1727908, -0.8060926, 0.2117647, 1, 0, 1,
-0.5320475, -0.06271371, -0.2629215, 0.2078431, 1, 0, 1,
-0.5315405, -0.9258939, -3.927347, 0.2, 1, 0, 1,
-0.530651, 1.057828, -0.9295502, 0.1921569, 1, 0, 1,
-0.5287978, -1.122378, -3.208801, 0.1882353, 1, 0, 1,
-0.5270248, 1.473912, -1.928466, 0.1803922, 1, 0, 1,
-0.526387, -0.2291665, -1.1624, 0.1764706, 1, 0, 1,
-0.517885, -1.368429, -3.462197, 0.1686275, 1, 0, 1,
-0.5085974, 1.013824, -0.3671313, 0.1647059, 1, 0, 1,
-0.5076753, 0.09884738, -0.9344988, 0.1568628, 1, 0, 1,
-0.5068952, -0.7543711, -4.192063, 0.1529412, 1, 0, 1,
-0.5051807, -0.2341688, -2.671199, 0.145098, 1, 0, 1,
-0.5024646, 0.05637529, 0.1772338, 0.1411765, 1, 0, 1,
-0.4995188, 0.1418774, -0.9743631, 0.1333333, 1, 0, 1,
-0.4979887, -0.7591825, -2.270413, 0.1294118, 1, 0, 1,
-0.4970299, 0.562744, 0.5857857, 0.1215686, 1, 0, 1,
-0.4966093, -0.8389865, -2.581333, 0.1176471, 1, 0, 1,
-0.4965501, -0.136556, -1.683634, 0.1098039, 1, 0, 1,
-0.4860152, -0.6460438, -4.192297, 0.1058824, 1, 0, 1,
-0.4859352, 1.868077, -1.718371, 0.09803922, 1, 0, 1,
-0.4855537, -1.967094, -3.532125, 0.09019608, 1, 0, 1,
-0.4800857, 0.7287906, 0.1874114, 0.08627451, 1, 0, 1,
-0.4799611, 0.6879652, -0.3235136, 0.07843138, 1, 0, 1,
-0.4792209, -3.326163, -2.788494, 0.07450981, 1, 0, 1,
-0.4776444, -0.3845957, -2.510455, 0.06666667, 1, 0, 1,
-0.473941, -0.8135338, -3.009803, 0.0627451, 1, 0, 1,
-0.4719363, -0.0131605, -0.5154728, 0.05490196, 1, 0, 1,
-0.4707185, 0.6688415, -1.469467, 0.05098039, 1, 0, 1,
-0.4656985, 1.208956, -1.183843, 0.04313726, 1, 0, 1,
-0.4619927, 1.332606, -1.133793, 0.03921569, 1, 0, 1,
-0.4615598, 0.2559533, -1.331487, 0.03137255, 1, 0, 1,
-0.4612172, 3.744861, 1.701115, 0.02745098, 1, 0, 1,
-0.4585073, -1.34604, -1.799138, 0.01960784, 1, 0, 1,
-0.4547699, -1.659891, -2.167274, 0.01568628, 1, 0, 1,
-0.4545254, 1.855151, 2.045602, 0.007843138, 1, 0, 1,
-0.4510821, -0.6419778, -3.387219, 0.003921569, 1, 0, 1,
-0.4420217, 0.584002, -0.2227957, 0, 1, 0.003921569, 1,
-0.437442, -0.04754502, -3.894832, 0, 1, 0.01176471, 1,
-0.4316804, 0.4915934, 0.2701989, 0, 1, 0.01568628, 1,
-0.4296307, 0.2458396, -0.7236425, 0, 1, 0.02352941, 1,
-0.4291463, -0.1741298, -1.645876, 0, 1, 0.02745098, 1,
-0.4170357, 0.06048951, -1.648046, 0, 1, 0.03529412, 1,
-0.4169483, 1.377822, -0.1104109, 0, 1, 0.03921569, 1,
-0.4162865, -0.9123505, -3.540915, 0, 1, 0.04705882, 1,
-0.4157979, 0.1852926, -2.612608, 0, 1, 0.05098039, 1,
-0.4142661, 1.290043, -0.7905645, 0, 1, 0.05882353, 1,
-0.4118001, -0.3556646, -1.092815, 0, 1, 0.0627451, 1,
-0.4093482, 0.8925974, -2.233584, 0, 1, 0.07058824, 1,
-0.4038337, -1.257322, -2.372267, 0, 1, 0.07450981, 1,
-0.40279, -0.445398, -1.388594, 0, 1, 0.08235294, 1,
-0.4014732, 0.05284168, -0.7044773, 0, 1, 0.08627451, 1,
-0.3998502, 2.466146, 0.3668863, 0, 1, 0.09411765, 1,
-0.3930348, -0.8094819, -1.357158, 0, 1, 0.1019608, 1,
-0.3909087, 0.2351964, -0.5450907, 0, 1, 0.1058824, 1,
-0.3892587, 0.4639035, -0.9696019, 0, 1, 0.1137255, 1,
-0.3877907, 0.1950582, 1.126152, 0, 1, 0.1176471, 1,
-0.3857902, 1.259202, -0.6609216, 0, 1, 0.1254902, 1,
-0.385594, -1.419868, -2.873258, 0, 1, 0.1294118, 1,
-0.3715937, 0.06341819, -0.2275884, 0, 1, 0.1372549, 1,
-0.364127, 0.121022, -2.298293, 0, 1, 0.1411765, 1,
-0.3617403, 1.402308, 0.3332269, 0, 1, 0.1490196, 1,
-0.3603809, -0.9621245, -2.895614, 0, 1, 0.1529412, 1,
-0.3578938, -0.5553027, -3.295928, 0, 1, 0.1607843, 1,
-0.3570796, 0.7816765, -0.2865326, 0, 1, 0.1647059, 1,
-0.349554, -0.3402975, -1.821394, 0, 1, 0.172549, 1,
-0.3493228, -0.4647454, -1.834201, 0, 1, 0.1764706, 1,
-0.3491449, 0.3760875, 0.2508439, 0, 1, 0.1843137, 1,
-0.3462186, 0.2394386, -1.312053, 0, 1, 0.1882353, 1,
-0.3461735, -1.423762, -1.660571, 0, 1, 0.1960784, 1,
-0.3457097, -0.784867, -2.563721, 0, 1, 0.2039216, 1,
-0.3384512, -1.100422, -3.266388, 0, 1, 0.2078431, 1,
-0.3371647, -0.8769068, -3.067277, 0, 1, 0.2156863, 1,
-0.333561, -0.5551825, -3.849146, 0, 1, 0.2196078, 1,
-0.3309166, 0.3944041, -0.4371558, 0, 1, 0.227451, 1,
-0.3303054, 1.434052, 1.657126, 0, 1, 0.2313726, 1,
-0.3288674, 1.078575, -2.600868, 0, 1, 0.2392157, 1,
-0.3256691, -1.842274, -1.40031, 0, 1, 0.2431373, 1,
-0.3256327, 1.210503, 0.4033864, 0, 1, 0.2509804, 1,
-0.3242978, 0.5526083, -2.200837, 0, 1, 0.254902, 1,
-0.3241096, 0.2834915, -2.529912, 0, 1, 0.2627451, 1,
-0.3201083, 1.007794, -0.6979938, 0, 1, 0.2666667, 1,
-0.3200656, -2.458086, -2.461419, 0, 1, 0.2745098, 1,
-0.3195281, -0.8588311, -3.114296, 0, 1, 0.2784314, 1,
-0.3179483, -0.235999, -0.8837484, 0, 1, 0.2862745, 1,
-0.3141358, -0.3542033, -3.291408, 0, 1, 0.2901961, 1,
-0.3134307, 0.5226206, 0.4964663, 0, 1, 0.2980392, 1,
-0.3110781, 1.059541, -0.01922359, 0, 1, 0.3058824, 1,
-0.3107874, -0.8218625, -3.563755, 0, 1, 0.3098039, 1,
-0.3085051, -0.6046295, -0.7884577, 0, 1, 0.3176471, 1,
-0.3081164, -0.08994272, -2.601111, 0, 1, 0.3215686, 1,
-0.3040892, 0.2205885, -0.5289945, 0, 1, 0.3294118, 1,
-0.3035307, -0.3747378, -0.2163657, 0, 1, 0.3333333, 1,
-0.3030109, 0.01893097, -1.368729, 0, 1, 0.3411765, 1,
-0.3020514, -0.07914069, -2.655063, 0, 1, 0.345098, 1,
-0.2999442, 0.99478, -0.799135, 0, 1, 0.3529412, 1,
-0.2907853, 0.4419946, -0.2620423, 0, 1, 0.3568628, 1,
-0.2901994, -0.4680987, -1.983698, 0, 1, 0.3647059, 1,
-0.2899728, -0.9498783, -2.494785, 0, 1, 0.3686275, 1,
-0.2879702, -0.4108106, -0.5957943, 0, 1, 0.3764706, 1,
-0.2851741, 1.1156, -2.10334, 0, 1, 0.3803922, 1,
-0.283409, -1.118467, -2.495864, 0, 1, 0.3882353, 1,
-0.2780874, -0.2393036, -2.532715, 0, 1, 0.3921569, 1,
-0.2766683, 0.1435739, 0.8232369, 0, 1, 0.4, 1,
-0.2748055, -1.134701, -2.253173, 0, 1, 0.4078431, 1,
-0.2745848, 1.441998, -0.499138, 0, 1, 0.4117647, 1,
-0.272197, 0.2813503, -1.082745, 0, 1, 0.4196078, 1,
-0.2694243, 1.601707, 1.196894, 0, 1, 0.4235294, 1,
-0.2670585, 0.05538295, -1.034654, 0, 1, 0.4313726, 1,
-0.2651663, 0.9461727, -0.7591238, 0, 1, 0.4352941, 1,
-0.2603763, 0.03923239, -1.882924, 0, 1, 0.4431373, 1,
-0.2594782, -0.1500608, -1.406756, 0, 1, 0.4470588, 1,
-0.2593009, -1.134826, -2.267496, 0, 1, 0.454902, 1,
-0.2576513, 0.2059191, 0.2236494, 0, 1, 0.4588235, 1,
-0.257453, -0.6355683, -1.670224, 0, 1, 0.4666667, 1,
-0.2565762, 0.6583706, -0.7152745, 0, 1, 0.4705882, 1,
-0.2521367, -0.1696232, -0.9510322, 0, 1, 0.4784314, 1,
-0.2503805, 0.1312925, -0.0555493, 0, 1, 0.4823529, 1,
-0.2420419, 0.915471, -1.15163, 0, 1, 0.4901961, 1,
-0.2318552, 0.8010945, 1.884259, 0, 1, 0.4941176, 1,
-0.2305819, 0.5150225, -0.439539, 0, 1, 0.5019608, 1,
-0.2283826, -1.1269, -4.526309, 0, 1, 0.509804, 1,
-0.2281219, -0.5443523, -1.751175, 0, 1, 0.5137255, 1,
-0.2251414, 0.8757486, 0.9023852, 0, 1, 0.5215687, 1,
-0.2201593, -0.5872037, -3.046257, 0, 1, 0.5254902, 1,
-0.2189617, 1.854427, -0.650218, 0, 1, 0.5333334, 1,
-0.2188124, -1.183904, -3.546201, 0, 1, 0.5372549, 1,
-0.2174079, 0.5293325, -0.1785072, 0, 1, 0.5450981, 1,
-0.2148478, 1.221073, 1.381051, 0, 1, 0.5490196, 1,
-0.2123378, 2.164976, -1.913317, 0, 1, 0.5568628, 1,
-0.2105583, 0.4307172, -0.1198071, 0, 1, 0.5607843, 1,
-0.2100594, -0.1129506, -2.988976, 0, 1, 0.5686275, 1,
-0.2017265, -0.6274687, -2.047466, 0, 1, 0.572549, 1,
-0.1946048, -1.646229, -3.089395, 0, 1, 0.5803922, 1,
-0.1944196, 0.8359289, -1.262267, 0, 1, 0.5843138, 1,
-0.193367, -0.09005277, -2.515689, 0, 1, 0.5921569, 1,
-0.1902014, -0.6056054, -2.470111, 0, 1, 0.5960785, 1,
-0.1899461, 0.815513, -0.9942216, 0, 1, 0.6039216, 1,
-0.1887744, -0.5252506, -3.662305, 0, 1, 0.6117647, 1,
-0.1864409, 0.7302603, 0.5610323, 0, 1, 0.6156863, 1,
-0.1864329, -1.103078, -1.57341, 0, 1, 0.6235294, 1,
-0.1834971, 0.5579305, -0.6708102, 0, 1, 0.627451, 1,
-0.1819409, -0.8813998, -3.491338, 0, 1, 0.6352941, 1,
-0.1781641, -1.013918, -2.254349, 0, 1, 0.6392157, 1,
-0.1759175, -0.4293377, -1.331508, 0, 1, 0.6470588, 1,
-0.1752904, -0.1239645, -1.570214, 0, 1, 0.6509804, 1,
-0.172539, 0.9438371, -0.7593321, 0, 1, 0.6588235, 1,
-0.1698569, -1.156141, -2.942571, 0, 1, 0.6627451, 1,
-0.1690445, -0.6917269, -2.974317, 0, 1, 0.6705883, 1,
-0.1687116, 0.5580197, -0.4047351, 0, 1, 0.6745098, 1,
-0.1685696, -0.5643416, -2.680941, 0, 1, 0.682353, 1,
-0.1673492, 0.4428775, -0.7738019, 0, 1, 0.6862745, 1,
-0.1638654, -2.259874, -2.314077, 0, 1, 0.6941177, 1,
-0.1638182, -0.3056389, -0.4613806, 0, 1, 0.7019608, 1,
-0.1636503, 0.3629574, -0.2662098, 0, 1, 0.7058824, 1,
-0.1626985, -0.337974, -4.413116, 0, 1, 0.7137255, 1,
-0.1577699, -1.064224, -2.668257, 0, 1, 0.7176471, 1,
-0.1503668, -1.310369, -3.312935, 0, 1, 0.7254902, 1,
-0.1418833, -1.447165, -3.71331, 0, 1, 0.7294118, 1,
-0.1414189, -0.8858153, -3.829948, 0, 1, 0.7372549, 1,
-0.1379183, 0.06007908, -3.205797, 0, 1, 0.7411765, 1,
-0.1372151, -0.1735829, -2.489286, 0, 1, 0.7490196, 1,
-0.1364585, 0.4588798, -0.9415177, 0, 1, 0.7529412, 1,
-0.1318551, 0.4232614, -0.334989, 0, 1, 0.7607843, 1,
-0.1247851, -1.773791, -1.038278, 0, 1, 0.7647059, 1,
-0.1245875, 0.3518206, -1.158211, 0, 1, 0.772549, 1,
-0.1237182, -0.5952154, -3.720947, 0, 1, 0.7764706, 1,
-0.1235187, -0.3373254, -1.452584, 0, 1, 0.7843137, 1,
-0.1191232, -1.797817, -2.980092, 0, 1, 0.7882353, 1,
-0.1149208, 0.4115394, 1.427217, 0, 1, 0.7960784, 1,
-0.1116538, 0.4093877, 1.446361, 0, 1, 0.8039216, 1,
-0.1108844, 0.5930108, -1.452319, 0, 1, 0.8078431, 1,
-0.1091397, -1.32935, -3.218963, 0, 1, 0.8156863, 1,
-0.10829, 0.2511954, -0.375402, 0, 1, 0.8196079, 1,
-0.1074698, 0.8692548, 0.3454247, 0, 1, 0.827451, 1,
-0.1017505, -0.7678772, -3.462555, 0, 1, 0.8313726, 1,
-0.1007107, 0.5083416, 0.6094487, 0, 1, 0.8392157, 1,
-0.09979419, -0.1295744, -2.60842, 0, 1, 0.8431373, 1,
-0.0993149, -0.09678292, -1.534116, 0, 1, 0.8509804, 1,
-0.09841293, -0.5027472, -3.954172, 0, 1, 0.854902, 1,
-0.0982969, -0.6265397, -2.741731, 0, 1, 0.8627451, 1,
-0.09802782, -0.03898139, -1.636365, 0, 1, 0.8666667, 1,
-0.09617807, -0.473825, -1.957649, 0, 1, 0.8745098, 1,
-0.09598518, 1.694274, 0.1038699, 0, 1, 0.8784314, 1,
-0.08657716, -0.781945, -3.81212, 0, 1, 0.8862745, 1,
-0.08604327, -1.504948, -2.026885, 0, 1, 0.8901961, 1,
-0.08089787, -1.196928, -4.578991, 0, 1, 0.8980392, 1,
-0.08088943, -0.6414101, -2.931911, 0, 1, 0.9058824, 1,
-0.08048674, -2.226696, -2.57121, 0, 1, 0.9098039, 1,
-0.07895534, 0.5724634, -0.7645493, 0, 1, 0.9176471, 1,
-0.07509351, 0.6411385, -1.748994, 0, 1, 0.9215686, 1,
-0.06625334, 0.9638628, -0.8060938, 0, 1, 0.9294118, 1,
-0.06245738, 0.01288794, -0.8998113, 0, 1, 0.9333333, 1,
-0.06204176, 1.607218, -0.275997, 0, 1, 0.9411765, 1,
-0.05686087, -0.787919, -2.940593, 0, 1, 0.945098, 1,
-0.05502378, -0.1222638, -2.711557, 0, 1, 0.9529412, 1,
-0.05379184, 0.5631385, -1.414584, 0, 1, 0.9568627, 1,
-0.05208189, 0.2162781, -0.6137846, 0, 1, 0.9647059, 1,
-0.05009741, 0.01737334, 1.379157, 0, 1, 0.9686275, 1,
-0.04728064, -2.151663, -4.948362, 0, 1, 0.9764706, 1,
-0.04634628, -2.775279, -3.118326, 0, 1, 0.9803922, 1,
-0.04609035, 1.756901, -0.3860393, 0, 1, 0.9882353, 1,
-0.0441507, 2.414577, -1.107237, 0, 1, 0.9921569, 1,
-0.03935883, 0.4822715, 0.5757952, 0, 1, 1, 1,
-0.03229121, -1.237273, -1.882022, 0, 0.9921569, 1, 1,
-0.03184346, -0.388782, -2.56023, 0, 0.9882353, 1, 1,
-0.03046928, -2.644701, -2.4292, 0, 0.9803922, 1, 1,
-0.02858521, -0.1128264, -3.843215, 0, 0.9764706, 1, 1,
-0.01815397, -0.8211409, -2.839316, 0, 0.9686275, 1, 1,
-0.0144385, -0.263364, -2.759957, 0, 0.9647059, 1, 1,
-0.01132404, -0.06778154, -3.808701, 0, 0.9568627, 1, 1,
-0.01059174, -0.2292421, -4.485008, 0, 0.9529412, 1, 1,
-0.008915867, -1.387758, -1.529207, 0, 0.945098, 1, 1,
-0.008893436, -0.9253374, -2.999904, 0, 0.9411765, 1, 1,
-0.007462009, 0.1119283, -1.256904, 0, 0.9333333, 1, 1,
-0.007340938, 0.07766335, -0.9611529, 0, 0.9294118, 1, 1,
-0.007194656, 1.279605, -0.5409095, 0, 0.9215686, 1, 1,
-0.006777965, 2.673425, -0.7428671, 0, 0.9176471, 1, 1,
-0.002177575, -0.3131562, -3.937472, 0, 0.9098039, 1, 1,
6.031615e-06, 0.2282761, 1.271707, 0, 0.9058824, 1, 1,
0.001053418, -0.551513, 1.666089, 0, 0.8980392, 1, 1,
0.003989258, -0.05651706, 1.942005, 0, 0.8901961, 1, 1,
0.005858521, -0.5185329, 1.329387, 0, 0.8862745, 1, 1,
0.006031215, 1.753116, 0.06870636, 0, 0.8784314, 1, 1,
0.007641665, 0.07732695, -1.181883, 0, 0.8745098, 1, 1,
0.01201, -1.111063, 2.777999, 0, 0.8666667, 1, 1,
0.0128456, -0.5259929, 3.687746, 0, 0.8627451, 1, 1,
0.01529304, -1.201137, 1.828964, 0, 0.854902, 1, 1,
0.01800967, 0.255087, -0.5124007, 0, 0.8509804, 1, 1,
0.01882357, -0.3894754, 3.60475, 0, 0.8431373, 1, 1,
0.02029899, -0.9240718, 0.7886694, 0, 0.8392157, 1, 1,
0.02192344, 0.9110715, 0.1972284, 0, 0.8313726, 1, 1,
0.026539, -0.6707878, 2.846504, 0, 0.827451, 1, 1,
0.02693122, -1.291691, 4.066078, 0, 0.8196079, 1, 1,
0.02718346, 1.790299, -0.2849197, 0, 0.8156863, 1, 1,
0.02949419, -0.5345306, 2.816688, 0, 0.8078431, 1, 1,
0.03152229, 0.2791206, -0.09254923, 0, 0.8039216, 1, 1,
0.03454709, -1.105241, 2.581568, 0, 0.7960784, 1, 1,
0.04201761, -0.166093, 3.099725, 0, 0.7882353, 1, 1,
0.04278329, 1.064867, -1.30043, 0, 0.7843137, 1, 1,
0.04467462, 0.01656236, 1.312825, 0, 0.7764706, 1, 1,
0.0469329, -0.2962714, 4.360676, 0, 0.772549, 1, 1,
0.0478601, -1.199619, 3.077722, 0, 0.7647059, 1, 1,
0.04957699, -0.2664791, 1.588802, 0, 0.7607843, 1, 1,
0.05115407, -1.349872, 5.496605, 0, 0.7529412, 1, 1,
0.05118342, -0.2370308, 2.984256, 0, 0.7490196, 1, 1,
0.05516839, 0.3141418, 1.709165, 0, 0.7411765, 1, 1,
0.05680968, 0.9823611, 0.4299236, 0, 0.7372549, 1, 1,
0.06142535, -1.058548, 3.180795, 0, 0.7294118, 1, 1,
0.06542783, -0.1869957, 1.241189, 0, 0.7254902, 1, 1,
0.07033335, 0.6749655, 1.23454, 0, 0.7176471, 1, 1,
0.07676227, -0.6372135, 4.449123, 0, 0.7137255, 1, 1,
0.07754343, -1.818315, 3.46354, 0, 0.7058824, 1, 1,
0.07811967, 1.66821, -0.3685224, 0, 0.6980392, 1, 1,
0.07998892, -1.178756, 4.755273, 0, 0.6941177, 1, 1,
0.0809306, 0.40648, -0.7640847, 0, 0.6862745, 1, 1,
0.08252369, 0.44691, 0.8424049, 0, 0.682353, 1, 1,
0.08547243, 1.720263, 0.3276886, 0, 0.6745098, 1, 1,
0.0891851, 0.6233917, -2.222781, 0, 0.6705883, 1, 1,
0.09704227, -0.6340829, 3.301212, 0, 0.6627451, 1, 1,
0.09956639, 0.04848796, 3.023639, 0, 0.6588235, 1, 1,
0.09958054, -0.6200563, 2.994931, 0, 0.6509804, 1, 1,
0.1000812, -0.6470786, 4.450832, 0, 0.6470588, 1, 1,
0.1022046, -0.6284604, 1.365687, 0, 0.6392157, 1, 1,
0.1052673, 1.186893, 0.201368, 0, 0.6352941, 1, 1,
0.1068294, 0.6192912, 1.380872, 0, 0.627451, 1, 1,
0.1089969, -0.5584888, 1.904779, 0, 0.6235294, 1, 1,
0.1096469, -0.2940845, 3.295206, 0, 0.6156863, 1, 1,
0.1105017, -0.7904248, 5.528529, 0, 0.6117647, 1, 1,
0.1125158, -1.539346, 2.982653, 0, 0.6039216, 1, 1,
0.1133092, 0.1648644, 1.62387, 0, 0.5960785, 1, 1,
0.1211242, 1.51501, 1.766761, 0, 0.5921569, 1, 1,
0.1213424, -1.267996, 2.716986, 0, 0.5843138, 1, 1,
0.1255596, -1.162954, 0.8493857, 0, 0.5803922, 1, 1,
0.1268481, -2.921092, 1.627167, 0, 0.572549, 1, 1,
0.1300905, 0.3118544, 0.4645624, 0, 0.5686275, 1, 1,
0.1351512, 0.9628281, 0.1870161, 0, 0.5607843, 1, 1,
0.1352793, 0.7402298, 0.02992896, 0, 0.5568628, 1, 1,
0.1390648, 0.1398964, 0.1201233, 0, 0.5490196, 1, 1,
0.139588, 0.3481589, -1.833698, 0, 0.5450981, 1, 1,
0.142357, 0.2204463, 0.8031001, 0, 0.5372549, 1, 1,
0.143245, -0.02830838, 1.860469, 0, 0.5333334, 1, 1,
0.1435347, -0.3280079, 2.931386, 0, 0.5254902, 1, 1,
0.1450931, -0.09423131, 1.369384, 0, 0.5215687, 1, 1,
0.1462956, -0.3883821, 2.327476, 0, 0.5137255, 1, 1,
0.1483311, -0.02942461, 2.138993, 0, 0.509804, 1, 1,
0.1487926, -0.3976194, 3.853128, 0, 0.5019608, 1, 1,
0.1504896, 0.4836631, 0.7151756, 0, 0.4941176, 1, 1,
0.1531852, 1.158463, -0.145457, 0, 0.4901961, 1, 1,
0.1549192, -1.428763, 3.160661, 0, 0.4823529, 1, 1,
0.1553932, -1.187209, 0.3198835, 0, 0.4784314, 1, 1,
0.156274, -1.285401, 2.561298, 0, 0.4705882, 1, 1,
0.1591427, -0.6823409, 2.892141, 0, 0.4666667, 1, 1,
0.1596079, 1.430047, 0.09286741, 0, 0.4588235, 1, 1,
0.1626146, -0.7944762, 2.139618, 0, 0.454902, 1, 1,
0.1673996, -0.7101335, 2.905569, 0, 0.4470588, 1, 1,
0.1689742, -0.6865204, 2.868048, 0, 0.4431373, 1, 1,
0.1700212, -0.8025842, 3.090413, 0, 0.4352941, 1, 1,
0.170673, -0.9997147, 4.112936, 0, 0.4313726, 1, 1,
0.1743762, -0.3386918, 1.20767, 0, 0.4235294, 1, 1,
0.1803461, 0.2163185, 3.537519, 0, 0.4196078, 1, 1,
0.1828875, -2.277467, 1.844322, 0, 0.4117647, 1, 1,
0.1853121, 2.342719, -0.8812878, 0, 0.4078431, 1, 1,
0.1853191, -0.476153, 2.776799, 0, 0.4, 1, 1,
0.1857705, -0.7532979, 1.141888, 0, 0.3921569, 1, 1,
0.18607, 1.749979, 0.3939179, 0, 0.3882353, 1, 1,
0.1934754, -0.6469893, 2.6057, 0, 0.3803922, 1, 1,
0.1936544, 0.3698161, 2.106592, 0, 0.3764706, 1, 1,
0.1989101, -2.540963, 2.886476, 0, 0.3686275, 1, 1,
0.2008991, -0.4103219, 4.296672, 0, 0.3647059, 1, 1,
0.2060783, 0.2568503, 1.084661, 0, 0.3568628, 1, 1,
0.2091791, 0.6188719, 0.6222122, 0, 0.3529412, 1, 1,
0.2096353, -0.2609028, 2.368078, 0, 0.345098, 1, 1,
0.209746, 1.657619, -0.6779345, 0, 0.3411765, 1, 1,
0.2157921, -1.407518, 1.090303, 0, 0.3333333, 1, 1,
0.2270991, -0.2792804, 0.5018135, 0, 0.3294118, 1, 1,
0.229087, 0.1839136, 0.6397623, 0, 0.3215686, 1, 1,
0.235815, -0.2574436, 3.208951, 0, 0.3176471, 1, 1,
0.2462127, -0.1657836, 3.223658, 0, 0.3098039, 1, 1,
0.249898, 0.5360786, -0.9671338, 0, 0.3058824, 1, 1,
0.2516083, -1.112129, 3.858497, 0, 0.2980392, 1, 1,
0.2550312, -0.04347783, 1.913202, 0, 0.2901961, 1, 1,
0.2574156, 0.01738423, 2.623414, 0, 0.2862745, 1, 1,
0.2590979, -1.546713, 2.043991, 0, 0.2784314, 1, 1,
0.2603748, -0.3223705, 3.726875, 0, 0.2745098, 1, 1,
0.2610467, -1.609361, 3.334321, 0, 0.2666667, 1, 1,
0.261054, -0.419141, 2.443641, 0, 0.2627451, 1, 1,
0.2618976, 0.300679, 1.003411, 0, 0.254902, 1, 1,
0.2660605, -2.512291, 3.569675, 0, 0.2509804, 1, 1,
0.2663702, 0.007782666, 2.437848, 0, 0.2431373, 1, 1,
0.2680492, -2.01104, 3.614507, 0, 0.2392157, 1, 1,
0.2730119, 0.8971649, -0.3550116, 0, 0.2313726, 1, 1,
0.276829, -1.731198, 2.872093, 0, 0.227451, 1, 1,
0.2824308, -0.6370729, 3.973058, 0, 0.2196078, 1, 1,
0.2867756, 1.155144, -1.651468, 0, 0.2156863, 1, 1,
0.2879202, 0.147691, 2.049486, 0, 0.2078431, 1, 1,
0.2907642, -1.197566, 2.106029, 0, 0.2039216, 1, 1,
0.2934774, -0.460413, 1.892099, 0, 0.1960784, 1, 1,
0.2937029, 1.77152, 0.2945595, 0, 0.1882353, 1, 1,
0.3000579, 1.510162, -0.4805805, 0, 0.1843137, 1, 1,
0.3011986, 0.2655865, 0.506012, 0, 0.1764706, 1, 1,
0.3015721, -1.272944, 1.407209, 0, 0.172549, 1, 1,
0.3025393, -0.2193292, 1.088908, 0, 0.1647059, 1, 1,
0.3058696, 0.004935768, 1.767609, 0, 0.1607843, 1, 1,
0.3133273, 0.1973109, 0.3160333, 0, 0.1529412, 1, 1,
0.3138664, -3.078537, 1.151196, 0, 0.1490196, 1, 1,
0.3179487, -0.6290513, 3.693135, 0, 0.1411765, 1, 1,
0.319563, 0.3320799, 0.3776133, 0, 0.1372549, 1, 1,
0.3199998, 2.07746, -1.129548, 0, 0.1294118, 1, 1,
0.3215824, 1.317635, 0.7535022, 0, 0.1254902, 1, 1,
0.3216317, 0.4763195, -1.633944, 0, 0.1176471, 1, 1,
0.3242451, 0.6214882, 0.07634883, 0, 0.1137255, 1, 1,
0.3253415, -0.8145961, 2.1469, 0, 0.1058824, 1, 1,
0.3263372, 0.6945421, -0.1782028, 0, 0.09803922, 1, 1,
0.3272248, -0.1544587, 1.234859, 0, 0.09411765, 1, 1,
0.3289739, -0.9990519, 1.779784, 0, 0.08627451, 1, 1,
0.3413382, 0.8777915, -1.025446, 0, 0.08235294, 1, 1,
0.3419766, -0.8038784, 3.227549, 0, 0.07450981, 1, 1,
0.3459233, 1.557778, -1.611898, 0, 0.07058824, 1, 1,
0.3461148, 1.043171, -1.267613, 0, 0.0627451, 1, 1,
0.3467721, 1.716702, 0.5807998, 0, 0.05882353, 1, 1,
0.3468758, 0.6702576, 2.080771, 0, 0.05098039, 1, 1,
0.3531423, -1.655888, 4.522455, 0, 0.04705882, 1, 1,
0.3540134, 2.573602, -0.07894972, 0, 0.03921569, 1, 1,
0.3542367, 0.3499559, 2.057468, 0, 0.03529412, 1, 1,
0.3554427, 0.1358015, 2.04656, 0, 0.02745098, 1, 1,
0.3604399, 0.4444755, -0.3581694, 0, 0.02352941, 1, 1,
0.3642284, -1.807358, 3.706977, 0, 0.01568628, 1, 1,
0.3714289, -0.3463707, 2.177892, 0, 0.01176471, 1, 1,
0.3764961, -0.4730178, 2.241617, 0, 0.003921569, 1, 1,
0.3768903, 0.8374181, -0.1323894, 0.003921569, 0, 1, 1,
0.3790261, -1.028595, 2.738584, 0.007843138, 0, 1, 1,
0.3824139, 0.8383833, -0.5115166, 0.01568628, 0, 1, 1,
0.3864803, 0.3937396, 0.5587242, 0.01960784, 0, 1, 1,
0.3873457, 0.8600336, 0.574599, 0.02745098, 0, 1, 1,
0.3877256, 0.4917755, 0.7841579, 0.03137255, 0, 1, 1,
0.3879123, 0.864776, 1.553424, 0.03921569, 0, 1, 1,
0.3899002, -0.5498115, 4.129552, 0.04313726, 0, 1, 1,
0.3905292, -0.492553, 1.25571, 0.05098039, 0, 1, 1,
0.391616, -0.08670762, 0.4282714, 0.05490196, 0, 1, 1,
0.3921609, -0.8697654, 2.023983, 0.0627451, 0, 1, 1,
0.3929054, -1.98736, 3.358222, 0.06666667, 0, 1, 1,
0.39515, -0.7976205, 2.525213, 0.07450981, 0, 1, 1,
0.3974174, 1.257095, 0.4310398, 0.07843138, 0, 1, 1,
0.3975632, 1.224421, 0.3264909, 0.08627451, 0, 1, 1,
0.3986428, 2.080174, 0.7325519, 0.09019608, 0, 1, 1,
0.4019778, -0.2084788, 1.365654, 0.09803922, 0, 1, 1,
0.4071074, 0.1915909, 1.760566, 0.1058824, 0, 1, 1,
0.4132217, -0.03359511, 2.367175, 0.1098039, 0, 1, 1,
0.4187585, -0.3348932, 3.870905, 0.1176471, 0, 1, 1,
0.4197179, 1.458255, -0.4527991, 0.1215686, 0, 1, 1,
0.4220204, -0.4636548, 2.14041, 0.1294118, 0, 1, 1,
0.422833, 1.051002, -0.4689738, 0.1333333, 0, 1, 1,
0.4265133, 0.4055694, -0.5812428, 0.1411765, 0, 1, 1,
0.428395, 1.138067, -0.5682743, 0.145098, 0, 1, 1,
0.4354866, -0.8992991, 3.87758, 0.1529412, 0, 1, 1,
0.4432627, -0.9499684, 4.014786, 0.1568628, 0, 1, 1,
0.4487188, 0.7433568, 0.4732586, 0.1647059, 0, 1, 1,
0.4509783, -0.04214013, 2.441211, 0.1686275, 0, 1, 1,
0.4515404, -0.3226227, 1.652807, 0.1764706, 0, 1, 1,
0.4523976, -0.7354786, 2.531462, 0.1803922, 0, 1, 1,
0.4551808, 3.135668, 1.322029, 0.1882353, 0, 1, 1,
0.459387, 1.154834, -0.1641901, 0.1921569, 0, 1, 1,
0.4598188, -0.2261537, 1.460689, 0.2, 0, 1, 1,
0.4661036, 0.6425263, 2.302054, 0.2078431, 0, 1, 1,
0.4699625, 1.771501, -0.4042751, 0.2117647, 0, 1, 1,
0.4726997, -0.2008485, -0.4325333, 0.2196078, 0, 1, 1,
0.4775078, 1.814263, 0.2253834, 0.2235294, 0, 1, 1,
0.4783222, -0.05318251, 0.2672622, 0.2313726, 0, 1, 1,
0.4787014, 0.6478962, 1.770211, 0.2352941, 0, 1, 1,
0.4801736, -0.2489523, 1.809609, 0.2431373, 0, 1, 1,
0.4877665, 0.2824533, 2.196522, 0.2470588, 0, 1, 1,
0.4906718, 1.050559, 1.291986, 0.254902, 0, 1, 1,
0.4937938, -0.6219143, 3.842957, 0.2588235, 0, 1, 1,
0.4939795, 0.2049103, 1.602622, 0.2666667, 0, 1, 1,
0.4978536, 0.09765785, 2.036479, 0.2705882, 0, 1, 1,
0.5010633, 0.7450427, 1.039808, 0.2784314, 0, 1, 1,
0.501202, 0.2646697, 2.170851, 0.282353, 0, 1, 1,
0.5024409, -0.2493314, 1.474072, 0.2901961, 0, 1, 1,
0.5127475, -0.7666376, 1.652633, 0.2941177, 0, 1, 1,
0.5151663, -1.328333, 3.036352, 0.3019608, 0, 1, 1,
0.5194897, -1.683247, 4.915199, 0.3098039, 0, 1, 1,
0.5208619, -0.3643924, 1.402912, 0.3137255, 0, 1, 1,
0.5236616, 0.5806522, 2.56646, 0.3215686, 0, 1, 1,
0.5273985, -1.996848, 3.040087, 0.3254902, 0, 1, 1,
0.5298164, -0.7360774, 2.864058, 0.3333333, 0, 1, 1,
0.5306827, 2.678354, 0.322442, 0.3372549, 0, 1, 1,
0.5354365, -0.4849499, 1.55614, 0.345098, 0, 1, 1,
0.5378215, 0.8956711, -0.5321147, 0.3490196, 0, 1, 1,
0.5403271, 1.225196, 0.9882507, 0.3568628, 0, 1, 1,
0.5403826, 0.1409511, 0.5302287, 0.3607843, 0, 1, 1,
0.5414759, -0.5446027, 2.380898, 0.3686275, 0, 1, 1,
0.5418513, -0.5100747, 1.844367, 0.372549, 0, 1, 1,
0.5482904, 0.2474085, 1.005611, 0.3803922, 0, 1, 1,
0.5497822, 1.116954, -0.09253724, 0.3843137, 0, 1, 1,
0.5520585, 1.47268, -0.8760753, 0.3921569, 0, 1, 1,
0.5524016, 0.4650808, -1.145127, 0.3960784, 0, 1, 1,
0.5550803, 2.647607, -0.9779325, 0.4039216, 0, 1, 1,
0.5577977, -2.164489, 2.996365, 0.4117647, 0, 1, 1,
0.5586684, -0.320347, 4.251808, 0.4156863, 0, 1, 1,
0.5621181, -0.9163553, 2.322447, 0.4235294, 0, 1, 1,
0.564525, 1.112966, 0.9073981, 0.427451, 0, 1, 1,
0.5645528, 0.937548, 2.670133, 0.4352941, 0, 1, 1,
0.5682036, -1.282472, 3.824701, 0.4392157, 0, 1, 1,
0.5701609, 1.015361, -0.1737131, 0.4470588, 0, 1, 1,
0.5758373, -0.4935127, 2.649985, 0.4509804, 0, 1, 1,
0.5798763, -0.8578634, 0.8152537, 0.4588235, 0, 1, 1,
0.5818326, -1.26252, 2.59249, 0.4627451, 0, 1, 1,
0.5849912, 1.549084, 1.485941, 0.4705882, 0, 1, 1,
0.5928776, 0.6009402, 1.036052, 0.4745098, 0, 1, 1,
0.5969726, 0.5277426, 1.070832, 0.4823529, 0, 1, 1,
0.5969759, -0.6335409, 1.4483, 0.4862745, 0, 1, 1,
0.6024228, 0.3115937, -0.1240341, 0.4941176, 0, 1, 1,
0.6025279, -0.9764442, 1.216693, 0.5019608, 0, 1, 1,
0.6076922, 0.08920463, 2.94384, 0.5058824, 0, 1, 1,
0.6085607, -0.7493565, 0.9929771, 0.5137255, 0, 1, 1,
0.6135265, 0.7433522, 1.05023, 0.5176471, 0, 1, 1,
0.614686, 0.1798571, 2.583422, 0.5254902, 0, 1, 1,
0.6150098, 1.905167, 0.2954934, 0.5294118, 0, 1, 1,
0.6150983, 0.976545, -0.6966361, 0.5372549, 0, 1, 1,
0.6227621, -0.8425711, -0.5402312, 0.5411765, 0, 1, 1,
0.6242164, 0.69076, 0.6234738, 0.5490196, 0, 1, 1,
0.6267751, 2.251631, -0.2671461, 0.5529412, 0, 1, 1,
0.6309779, 2.695481, 3.0409, 0.5607843, 0, 1, 1,
0.6321056, 0.09852803, 2.908411, 0.5647059, 0, 1, 1,
0.6349767, -2.109011, 3.49036, 0.572549, 0, 1, 1,
0.6368871, 0.6296209, 2.200995, 0.5764706, 0, 1, 1,
0.6371741, 2.677218, -1.068451, 0.5843138, 0, 1, 1,
0.6403098, 1.336006, -0.1126695, 0.5882353, 0, 1, 1,
0.6403457, -0.1900116, 1.624061, 0.5960785, 0, 1, 1,
0.6411539, -0.7785924, 3.188382, 0.6039216, 0, 1, 1,
0.6429026, 0.2235429, 1.409359, 0.6078432, 0, 1, 1,
0.6431767, 0.3533469, 0.9412819, 0.6156863, 0, 1, 1,
0.6439692, 0.4208039, 0.6266369, 0.6196079, 0, 1, 1,
0.6463408, -0.177517, 2.191648, 0.627451, 0, 1, 1,
0.6471489, 0.8507802, -1.502888, 0.6313726, 0, 1, 1,
0.6472955, 0.4036584, 0.7422435, 0.6392157, 0, 1, 1,
0.6483471, 0.432333, -0.8814376, 0.6431373, 0, 1, 1,
0.6506313, 0.852738, 0.2379672, 0.6509804, 0, 1, 1,
0.6557847, -0.08686338, 2.275895, 0.654902, 0, 1, 1,
0.6646363, -0.3049893, 4.25881, 0.6627451, 0, 1, 1,
0.6650115, 1.506793, -0.7051365, 0.6666667, 0, 1, 1,
0.6665687, 0.9851727, 1.311054, 0.6745098, 0, 1, 1,
0.6702076, -0.9038649, 3.817112, 0.6784314, 0, 1, 1,
0.6730431, 1.001471, -0.8601297, 0.6862745, 0, 1, 1,
0.6798006, -0.346353, 2.065639, 0.6901961, 0, 1, 1,
0.6859748, 0.1981385, 0.6409811, 0.6980392, 0, 1, 1,
0.687182, 2.904965, 1.882284, 0.7058824, 0, 1, 1,
0.68789, 1.167202, 0.8505908, 0.7098039, 0, 1, 1,
0.6879061, -2.144039, 1.66701, 0.7176471, 0, 1, 1,
0.6883755, 0.3373637, 3.008965, 0.7215686, 0, 1, 1,
0.6958784, -1.357883, 3.44203, 0.7294118, 0, 1, 1,
0.698634, 0.2712514, 1.522709, 0.7333333, 0, 1, 1,
0.699165, 1.201395, -0.02059451, 0.7411765, 0, 1, 1,
0.7022612, 2.038558, 3.17182, 0.7450981, 0, 1, 1,
0.7074903, 0.7798632, 0.4996478, 0.7529412, 0, 1, 1,
0.7084752, -0.6405461, 2.44889, 0.7568628, 0, 1, 1,
0.7187946, 1.945165, -0.2443947, 0.7647059, 0, 1, 1,
0.7199258, 2.375673, 0.2328007, 0.7686275, 0, 1, 1,
0.7249832, -1.075567, 1.361082, 0.7764706, 0, 1, 1,
0.7261316, -0.3463204, 2.833181, 0.7803922, 0, 1, 1,
0.7271761, -0.7716509, 2.687162, 0.7882353, 0, 1, 1,
0.7309619, -0.4440192, 2.411397, 0.7921569, 0, 1, 1,
0.7348282, 0.8731503, -0.2424208, 0.8, 0, 1, 1,
0.7364597, 0.2459631, 2.534349, 0.8078431, 0, 1, 1,
0.7364787, 0.1713175, 2.20232, 0.8117647, 0, 1, 1,
0.7406347, 0.08040115, -0.387478, 0.8196079, 0, 1, 1,
0.7429014, 0.2474107, 2.456129, 0.8235294, 0, 1, 1,
0.745396, -1.265507, 2.223705, 0.8313726, 0, 1, 1,
0.7477755, -1.603369, 1.105711, 0.8352941, 0, 1, 1,
0.750871, -0.03361846, 1.85141, 0.8431373, 0, 1, 1,
0.7509803, 0.4771786, 1.279668, 0.8470588, 0, 1, 1,
0.756414, -0.6555282, 1.779514, 0.854902, 0, 1, 1,
0.7595278, -0.3700523, 2.289033, 0.8588235, 0, 1, 1,
0.762906, 0.7060059, -0.266515, 0.8666667, 0, 1, 1,
0.7635131, -0.2280968, 0.1964417, 0.8705882, 0, 1, 1,
0.7676442, -0.9964196, 3.96244, 0.8784314, 0, 1, 1,
0.7679025, -1.267927, 1.005874, 0.8823529, 0, 1, 1,
0.7698752, 1.376317, 0.374665, 0.8901961, 0, 1, 1,
0.7855194, -0.3221445, 0.6488221, 0.8941177, 0, 1, 1,
0.8014167, 1.452192, 0.9285322, 0.9019608, 0, 1, 1,
0.8022298, -0.6800676, 1.992264, 0.9098039, 0, 1, 1,
0.807152, -0.7631038, 2.89881, 0.9137255, 0, 1, 1,
0.8117231, -0.9177313, 3.047727, 0.9215686, 0, 1, 1,
0.8204048, -0.1994565, 0.8920915, 0.9254902, 0, 1, 1,
0.8227784, 1.740849, -1.199831, 0.9333333, 0, 1, 1,
0.8283691, -1.903947, 2.593815, 0.9372549, 0, 1, 1,
0.8288502, 0.5869057, 2.509943, 0.945098, 0, 1, 1,
0.8304737, -1.792297, 3.466497, 0.9490196, 0, 1, 1,
0.8434806, -0.649975, 1.306316, 0.9568627, 0, 1, 1,
0.8438332, 0.5138327, 0.3198711, 0.9607843, 0, 1, 1,
0.8483324, -0.3148152, 3.50617, 0.9686275, 0, 1, 1,
0.8530257, 2.406054, 0.3489005, 0.972549, 0, 1, 1,
0.8596281, -0.6074229, 2.450368, 0.9803922, 0, 1, 1,
0.8614932, 2.16398, 0.002075333, 0.9843137, 0, 1, 1,
0.8641495, 0.0424514, 3.222937, 0.9921569, 0, 1, 1,
0.8798989, -1.021911, 4.466254, 0.9960784, 0, 1, 1,
0.882682, -0.627507, 2.330917, 1, 0, 0.9960784, 1,
0.8891266, 0.9215227, 3.104999, 1, 0, 0.9882353, 1,
0.8941329, -0.8328642, 2.274928, 1, 0, 0.9843137, 1,
0.8962198, 0.06138331, 1.58779, 1, 0, 0.9764706, 1,
0.8962897, -0.620818, 2.371472, 1, 0, 0.972549, 1,
0.8973272, 2.996994, -0.4512505, 1, 0, 0.9647059, 1,
0.8975625, -0.5339444, -0.360396, 1, 0, 0.9607843, 1,
0.9004021, 1.404341, -0.9552798, 1, 0, 0.9529412, 1,
0.901859, 0.2852168, 1.373551, 1, 0, 0.9490196, 1,
0.9175614, 1.033219, 0.7865118, 1, 0, 0.9411765, 1,
0.9181576, -0.3230346, 2.444582, 1, 0, 0.9372549, 1,
0.9320616, -1.472713, 3.556209, 1, 0, 0.9294118, 1,
0.9385685, 0.1735188, 0.3531573, 1, 0, 0.9254902, 1,
0.9394307, -0.6063666, 4.09905, 1, 0, 0.9176471, 1,
0.9397256, -0.6375158, -0.2667159, 1, 0, 0.9137255, 1,
0.9398008, -0.7248273, 3.471229, 1, 0, 0.9058824, 1,
0.9447007, 0.1999459, -0.1959094, 1, 0, 0.9019608, 1,
0.947975, 1.154741, 1.482069, 1, 0, 0.8941177, 1,
0.9567307, -1.576472, 3.293238, 1, 0, 0.8862745, 1,
0.9583685, -0.2999388, 2.850168, 1, 0, 0.8823529, 1,
0.9625045, 1.468283, 0.246334, 1, 0, 0.8745098, 1,
0.9662405, 1.808768, 1.640342, 1, 0, 0.8705882, 1,
0.9680855, -1.269157, 3.21355, 1, 0, 0.8627451, 1,
0.9879822, -0.3634172, 1.627482, 1, 0, 0.8588235, 1,
0.9902359, -1.092492, 3.103285, 1, 0, 0.8509804, 1,
0.9955459, 0.2810014, 1.296578, 1, 0, 0.8470588, 1,
0.9972669, -0.071366, 0.8573056, 1, 0, 0.8392157, 1,
1.007304, 0.758094, -1.431116, 1, 0, 0.8352941, 1,
1.012779, -0.5415537, 0.5234134, 1, 0, 0.827451, 1,
1.015038, 1.015961, 1.049525, 1, 0, 0.8235294, 1,
1.015208, -1.208441, 2.980509, 1, 0, 0.8156863, 1,
1.02639, -0.6008015, 0.6997925, 1, 0, 0.8117647, 1,
1.026594, 0.4015519, 1.065934, 1, 0, 0.8039216, 1,
1.030748, -0.325048, 1.584389, 1, 0, 0.7960784, 1,
1.034187, 0.2677769, 0.5999113, 1, 0, 0.7921569, 1,
1.035187, 1.734072, 2.840387, 1, 0, 0.7843137, 1,
1.047964, 0.8703104, 1.804848, 1, 0, 0.7803922, 1,
1.061261, -0.3317155, 1.589119, 1, 0, 0.772549, 1,
1.064468, 0.2115246, 0.4652702, 1, 0, 0.7686275, 1,
1.064527, 1.187509, 0.5771345, 1, 0, 0.7607843, 1,
1.071486, -1.845394, 2.856567, 1, 0, 0.7568628, 1,
1.072262, 0.4604482, 3.526696, 1, 0, 0.7490196, 1,
1.074257, -0.422402, 1.222279, 1, 0, 0.7450981, 1,
1.078491, 1.517867, 1.060465, 1, 0, 0.7372549, 1,
1.090418, 0.3415081, 1.854669, 1, 0, 0.7333333, 1,
1.094041, 0.7976723, 1.508361, 1, 0, 0.7254902, 1,
1.098384, -0.1452641, 2.253278, 1, 0, 0.7215686, 1,
1.101991, 1.594311, 1.863144, 1, 0, 0.7137255, 1,
1.113716, 1.34304, -1.108622, 1, 0, 0.7098039, 1,
1.12075, 0.8251006, 2.614083, 1, 0, 0.7019608, 1,
1.126447, 0.1733047, 0.3466225, 1, 0, 0.6941177, 1,
1.131212, -0.4318584, 4.890954, 1, 0, 0.6901961, 1,
1.132604, -1.471125, 1.399067, 1, 0, 0.682353, 1,
1.133128, -0.3186953, 0.6664934, 1, 0, 0.6784314, 1,
1.137124, -1.344838, 2.060893, 1, 0, 0.6705883, 1,
1.143546, -0.6122786, 0.8639801, 1, 0, 0.6666667, 1,
1.151071, 0.7245202, 0.8865774, 1, 0, 0.6588235, 1,
1.159794, 1.114602, 0.6070819, 1, 0, 0.654902, 1,
1.164031, -1.031616, 1.599216, 1, 0, 0.6470588, 1,
1.17303, 0.4490318, 1.988234, 1, 0, 0.6431373, 1,
1.179775, 1.359498, 0.2424931, 1, 0, 0.6352941, 1,
1.194254, 1.705895, 0.7835286, 1, 0, 0.6313726, 1,
1.197889, -0.888194, 3.147576, 1, 0, 0.6235294, 1,
1.201611, 0.7030298, 1.530156, 1, 0, 0.6196079, 1,
1.211086, -0.059886, 3.36754, 1, 0, 0.6117647, 1,
1.216927, -1.170608, 2.37959, 1, 0, 0.6078432, 1,
1.220349, 0.4125658, -0.1185035, 1, 0, 0.6, 1,
1.231991, -0.4862495, 2.42198, 1, 0, 0.5921569, 1,
1.245828, 0.5383611, 2.003544, 1, 0, 0.5882353, 1,
1.248645, 1.705967, -0.9825697, 1, 0, 0.5803922, 1,
1.250988, 0.1656481, 0.3029793, 1, 0, 0.5764706, 1,
1.257832, -0.3437227, 2.665695, 1, 0, 0.5686275, 1,
1.266733, -0.1005238, 0.8410868, 1, 0, 0.5647059, 1,
1.282204, -1.793906, 0.3201516, 1, 0, 0.5568628, 1,
1.286384, 1.708764, 0.7801238, 1, 0, 0.5529412, 1,
1.303316, -0.5281531, 3.417068, 1, 0, 0.5450981, 1,
1.307986, 0.197492, -0.3067166, 1, 0, 0.5411765, 1,
1.327703, 0.136493, 0.6699498, 1, 0, 0.5333334, 1,
1.32979, -1.43737, 3.01537, 1, 0, 0.5294118, 1,
1.331656, 0.2882361, 2.012563, 1, 0, 0.5215687, 1,
1.332119, 0.878055, 0.6189368, 1, 0, 0.5176471, 1,
1.332137, -0.5514879, 3.00861, 1, 0, 0.509804, 1,
1.337699, 0.7944292, -0.1083217, 1, 0, 0.5058824, 1,
1.339413, 1.9524, -0.04840133, 1, 0, 0.4980392, 1,
1.341737, -1.660569, 1.795785, 1, 0, 0.4901961, 1,
1.350198, -1.23604, 2.452629, 1, 0, 0.4862745, 1,
1.368704, -0.6850486, 1.242091, 1, 0, 0.4784314, 1,
1.376322, -0.2041557, 0.9485259, 1, 0, 0.4745098, 1,
1.378688, 1.023083, 0.8395808, 1, 0, 0.4666667, 1,
1.382907, -2.008297, 1.038077, 1, 0, 0.4627451, 1,
1.397862, 1.18111, -0.07939968, 1, 0, 0.454902, 1,
1.399503, -1.424319, 2.418081, 1, 0, 0.4509804, 1,
1.434414, 2.071781, -1.382194, 1, 0, 0.4431373, 1,
1.447081, -0.5821924, 3.412977, 1, 0, 0.4392157, 1,
1.474208, 0.1613673, 1.783429, 1, 0, 0.4313726, 1,
1.477553, -1.282452, 1.567313, 1, 0, 0.427451, 1,
1.48226, 0.6706926, 3.635614, 1, 0, 0.4196078, 1,
1.483708, -0.4102023, 1.545399, 1, 0, 0.4156863, 1,
1.501663, 0.1252781, 0.9662665, 1, 0, 0.4078431, 1,
1.50744, -0.20492, 1.107247, 1, 0, 0.4039216, 1,
1.515867, 0.3767466, 2.935533, 1, 0, 0.3960784, 1,
1.523272, 0.4847079, 0.9665134, 1, 0, 0.3882353, 1,
1.526794, 1.037977, 1.605773, 1, 0, 0.3843137, 1,
1.528377, 0.0589968, 1.334888, 1, 0, 0.3764706, 1,
1.536976, -1.361293, 1.617233, 1, 0, 0.372549, 1,
1.541111, -0.6230419, 3.868952, 1, 0, 0.3647059, 1,
1.543337, -0.9099566, 1.0239, 1, 0, 0.3607843, 1,
1.548468, 0.8525447, 0.7407371, 1, 0, 0.3529412, 1,
1.551934, 0.637503, 0.4776099, 1, 0, 0.3490196, 1,
1.563879, 1.156007, 2.294751, 1, 0, 0.3411765, 1,
1.575694, 1.140218, 1.823702, 1, 0, 0.3372549, 1,
1.590999, -0.8252901, 1.449569, 1, 0, 0.3294118, 1,
1.648582, -0.3688962, 1.326502, 1, 0, 0.3254902, 1,
1.658069, 1.579597, 0.7534966, 1, 0, 0.3176471, 1,
1.66731, 0.6230329, 2.49092, 1, 0, 0.3137255, 1,
1.668345, 0.2921841, 2.506714, 1, 0, 0.3058824, 1,
1.67534, -0.2060855, 0.1639341, 1, 0, 0.2980392, 1,
1.688802, -1.578122, 2.501517, 1, 0, 0.2941177, 1,
1.695665, 0.859954, 1.411684, 1, 0, 0.2862745, 1,
1.697284, 1.762169, -0.9127129, 1, 0, 0.282353, 1,
1.70025, -1.476277, 3.099393, 1, 0, 0.2745098, 1,
1.704787, -0.1162248, 1.102493, 1, 0, 0.2705882, 1,
1.712631, -0.3132636, 2.73663, 1, 0, 0.2627451, 1,
1.716295, -0.4634591, 0.9768072, 1, 0, 0.2588235, 1,
1.716634, 0.2178737, 1.767789, 1, 0, 0.2509804, 1,
1.735011, -0.9234102, 1.403002, 1, 0, 0.2470588, 1,
1.756174, 0.08934605, 1.507186, 1, 0, 0.2392157, 1,
1.773161, 0.9124807, 1.057366, 1, 0, 0.2352941, 1,
1.773987, -0.1989535, 0.8492287, 1, 0, 0.227451, 1,
1.775939, 0.2203799, 1.143078, 1, 0, 0.2235294, 1,
1.778231, -1.551574, 1.293575, 1, 0, 0.2156863, 1,
1.787901, -0.8880101, 3.064256, 1, 0, 0.2117647, 1,
1.790266, -0.06344534, 1.789863, 1, 0, 0.2039216, 1,
1.801247, -0.4305673, -0.6278474, 1, 0, 0.1960784, 1,
1.802278, 0.76168, 0.1050119, 1, 0, 0.1921569, 1,
1.819315, -0.2447411, 3.007821, 1, 0, 0.1843137, 1,
1.866624, -0.08277477, -0.2116507, 1, 0, 0.1803922, 1,
1.878866, -0.1234872, 0.4683657, 1, 0, 0.172549, 1,
1.906496, -0.400215, 0.6025774, 1, 0, 0.1686275, 1,
1.921103, 0.1168648, 1.870533, 1, 0, 0.1607843, 1,
1.923197, 0.6207108, 0.3613586, 1, 0, 0.1568628, 1,
1.960584, 0.1870686, 3.796894, 1, 0, 0.1490196, 1,
1.980954, -0.7428495, 1.894261, 1, 0, 0.145098, 1,
2.06093, 2.02856, 2.237102, 1, 0, 0.1372549, 1,
2.082426, -0.7879899, 1.585922, 1, 0, 0.1333333, 1,
2.100305, -0.2025803, 1.262263, 1, 0, 0.1254902, 1,
2.150009, 0.1474213, 0.3481482, 1, 0, 0.1215686, 1,
2.184186, 0.8151714, 1.023419, 1, 0, 0.1137255, 1,
2.189013, -0.8430551, 3.206093, 1, 0, 0.1098039, 1,
2.215412, 0.9135517, 0.9508952, 1, 0, 0.1019608, 1,
2.23275, -0.02724508, 1.86828, 1, 0, 0.09411765, 1,
2.235217, -1.449308, 3.403807, 1, 0, 0.09019608, 1,
2.289654, 0.6668797, 1.094981, 1, 0, 0.08235294, 1,
2.312985, 1.379379, 1.920116, 1, 0, 0.07843138, 1,
2.330093, 1.077872, 1.911528, 1, 0, 0.07058824, 1,
2.344154, -1.388486, 1.668879, 1, 0, 0.06666667, 1,
2.357243, 1.006642, 0.5768285, 1, 0, 0.05882353, 1,
2.375103, 0.2075911, 2.19716, 1, 0, 0.05490196, 1,
2.447481, -1.426873, 1.061335, 1, 0, 0.04705882, 1,
2.449332, 0.6762665, 0.9744719, 1, 0, 0.04313726, 1,
2.473687, 0.1508777, 0.971467, 1, 0, 0.03529412, 1,
2.54711, -1.590491, 0.6918685, 1, 0, 0.03137255, 1,
2.625639, -0.4849924, 2.193921, 1, 0, 0.02352941, 1,
2.660868, -0.9433539, 2.108065, 1, 0, 0.01960784, 1,
2.989892, -0.2575659, 2.216518, 1, 0, 0.01176471, 1,
3.867528, 0.1821414, 1.048998, 1, 0, 0.007843138, 1
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
-0.120225, -4.524702, -6.724195, 0, -0.5, 0.5, 0.5,
-0.120225, -4.524702, -6.724195, 1, -0.5, 0.5, 0.5,
-0.120225, -4.524702, -6.724195, 1, 1.5, 0.5, 0.5,
-0.120225, -4.524702, -6.724195, 0, 1.5, 0.5, 0.5
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
-5.459827, 0.2093488, -6.724195, 0, -0.5, 0.5, 0.5,
-5.459827, 0.2093488, -6.724195, 1, -0.5, 0.5, 0.5,
-5.459827, 0.2093488, -6.724195, 1, 1.5, 0.5, 0.5,
-5.459827, 0.2093488, -6.724195, 0, 1.5, 0.5, 0.5
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
-5.459827, -4.524702, 0.2900834, 0, -0.5, 0.5, 0.5,
-5.459827, -4.524702, 0.2900834, 1, -0.5, 0.5, 0.5,
-5.459827, -4.524702, 0.2900834, 1, 1.5, 0.5, 0.5,
-5.459827, -4.524702, 0.2900834, 0, 1.5, 0.5, 0.5
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
-4, -3.432228, -5.105515,
2, -3.432228, -5.105515,
-4, -3.432228, -5.105515,
-4, -3.614307, -5.375295,
-2, -3.432228, -5.105515,
-2, -3.614307, -5.375295,
0, -3.432228, -5.105515,
0, -3.614307, -5.375295,
2, -3.432228, -5.105515,
2, -3.614307, -5.375295
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
-4, -3.978465, -5.914855, 0, -0.5, 0.5, 0.5,
-4, -3.978465, -5.914855, 1, -0.5, 0.5, 0.5,
-4, -3.978465, -5.914855, 1, 1.5, 0.5, 0.5,
-4, -3.978465, -5.914855, 0, 1.5, 0.5, 0.5,
-2, -3.978465, -5.914855, 0, -0.5, 0.5, 0.5,
-2, -3.978465, -5.914855, 1, -0.5, 0.5, 0.5,
-2, -3.978465, -5.914855, 1, 1.5, 0.5, 0.5,
-2, -3.978465, -5.914855, 0, 1.5, 0.5, 0.5,
0, -3.978465, -5.914855, 0, -0.5, 0.5, 0.5,
0, -3.978465, -5.914855, 1, -0.5, 0.5, 0.5,
0, -3.978465, -5.914855, 1, 1.5, 0.5, 0.5,
0, -3.978465, -5.914855, 0, 1.5, 0.5, 0.5,
2, -3.978465, -5.914855, 0, -0.5, 0.5, 0.5,
2, -3.978465, -5.914855, 1, -0.5, 0.5, 0.5,
2, -3.978465, -5.914855, 1, 1.5, 0.5, 0.5,
2, -3.978465, -5.914855, 0, 1.5, 0.5, 0.5
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
-4.227611, -2, -5.105515,
-4.227611, 2, -5.105515,
-4.227611, -2, -5.105515,
-4.43298, -2, -5.375295,
-4.227611, 0, -5.105515,
-4.43298, 0, -5.375295,
-4.227611, 2, -5.105515,
-4.43298, 2, -5.375295
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
-4.843719, -2, -5.914855, 0, -0.5, 0.5, 0.5,
-4.843719, -2, -5.914855, 1, -0.5, 0.5, 0.5,
-4.843719, -2, -5.914855, 1, 1.5, 0.5, 0.5,
-4.843719, -2, -5.914855, 0, 1.5, 0.5, 0.5,
-4.843719, 0, -5.914855, 0, -0.5, 0.5, 0.5,
-4.843719, 0, -5.914855, 1, -0.5, 0.5, 0.5,
-4.843719, 0, -5.914855, 1, 1.5, 0.5, 0.5,
-4.843719, 0, -5.914855, 0, 1.5, 0.5, 0.5,
-4.843719, 2, -5.914855, 0, -0.5, 0.5, 0.5,
-4.843719, 2, -5.914855, 1, -0.5, 0.5, 0.5,
-4.843719, 2, -5.914855, 1, 1.5, 0.5, 0.5,
-4.843719, 2, -5.914855, 0, 1.5, 0.5, 0.5
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
-4.227611, -3.432228, -4,
-4.227611, -3.432228, 4,
-4.227611, -3.432228, -4,
-4.43298, -3.614307, -4,
-4.227611, -3.432228, -2,
-4.43298, -3.614307, -2,
-4.227611, -3.432228, 0,
-4.43298, -3.614307, 0,
-4.227611, -3.432228, 2,
-4.43298, -3.614307, 2,
-4.227611, -3.432228, 4,
-4.43298, -3.614307, 4
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
-4.843719, -3.978465, -4, 0, -0.5, 0.5, 0.5,
-4.843719, -3.978465, -4, 1, -0.5, 0.5, 0.5,
-4.843719, -3.978465, -4, 1, 1.5, 0.5, 0.5,
-4.843719, -3.978465, -4, 0, 1.5, 0.5, 0.5,
-4.843719, -3.978465, -2, 0, -0.5, 0.5, 0.5,
-4.843719, -3.978465, -2, 1, -0.5, 0.5, 0.5,
-4.843719, -3.978465, -2, 1, 1.5, 0.5, 0.5,
-4.843719, -3.978465, -2, 0, 1.5, 0.5, 0.5,
-4.843719, -3.978465, 0, 0, -0.5, 0.5, 0.5,
-4.843719, -3.978465, 0, 1, -0.5, 0.5, 0.5,
-4.843719, -3.978465, 0, 1, 1.5, 0.5, 0.5,
-4.843719, -3.978465, 0, 0, 1.5, 0.5, 0.5,
-4.843719, -3.978465, 2, 0, -0.5, 0.5, 0.5,
-4.843719, -3.978465, 2, 1, -0.5, 0.5, 0.5,
-4.843719, -3.978465, 2, 1, 1.5, 0.5, 0.5,
-4.843719, -3.978465, 2, 0, 1.5, 0.5, 0.5,
-4.843719, -3.978465, 4, 0, -0.5, 0.5, 0.5,
-4.843719, -3.978465, 4, 1, -0.5, 0.5, 0.5,
-4.843719, -3.978465, 4, 1, 1.5, 0.5, 0.5,
-4.843719, -3.978465, 4, 0, 1.5, 0.5, 0.5
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
-4.227611, -3.432228, -5.105515,
-4.227611, 3.850926, -5.105515,
-4.227611, -3.432228, 5.685682,
-4.227611, 3.850926, 5.685682,
-4.227611, -3.432228, -5.105515,
-4.227611, -3.432228, 5.685682,
-4.227611, 3.850926, -5.105515,
-4.227611, 3.850926, 5.685682,
-4.227611, -3.432228, -5.105515,
3.987161, -3.432228, -5.105515,
-4.227611, -3.432228, 5.685682,
3.987161, -3.432228, 5.685682,
-4.227611, 3.850926, -5.105515,
3.987161, 3.850926, -5.105515,
-4.227611, 3.850926, 5.685682,
3.987161, 3.850926, 5.685682,
3.987161, -3.432228, -5.105515,
3.987161, 3.850926, -5.105515,
3.987161, -3.432228, 5.685682,
3.987161, 3.850926, 5.685682,
3.987161, -3.432228, -5.105515,
3.987161, -3.432228, 5.685682,
3.987161, 3.850926, -5.105515,
3.987161, 3.850926, 5.685682
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
var radius = 8.220124;
var distance = 36.57226;
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
mvMatrix.translate( 0.120225, -0.2093488, -0.2900834 );
mvMatrix.scale( 1.081924, 1.220317, 0.8236119 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.57226);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Cyhexatin<-read.table("Cyhexatin.xyz")
```

```
## Error in read.table("Cyhexatin.xyz"): no lines available in input
```

```r
x<-Cyhexatin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cyhexatin' not found
```

```r
y<-Cyhexatin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cyhexatin' not found
```

```r
z<-Cyhexatin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cyhexatin' not found
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
-4.107978, -0.7716829, -0.8628945, 0, 0, 1, 1, 1,
-3.656754, -0.3354789, -0.5499837, 1, 0, 0, 1, 1,
-3.275529, 1.860179, -1.656462, 1, 0, 0, 1, 1,
-3.164733, -1.935015, -0.9557546, 1, 0, 0, 1, 1,
-2.662341, -2.139303, -3.595233, 1, 0, 0, 1, 1,
-2.542174, 0.4387824, -0.3340722, 1, 0, 0, 1, 1,
-2.464345, -1.813861, -1.269449, 0, 0, 0, 1, 1,
-2.46074, 1.69496, -1.684735, 0, 0, 0, 1, 1,
-2.439626, -0.647594, -2.296696, 0, 0, 0, 1, 1,
-2.269822, 1.836695, -2.411408, 0, 0, 0, 1, 1,
-2.250598, 0.451071, -1.866477, 0, 0, 0, 1, 1,
-2.232585, 2.549045, -0.6256291, 0, 0, 0, 1, 1,
-2.166263, -1.535761, -1.261577, 0, 0, 0, 1, 1,
-2.148047, -0.1618505, -2.203068, 1, 1, 1, 1, 1,
-2.129236, -0.2436678, -2.559588, 1, 1, 1, 1, 1,
-2.09712, -0.138793, -0.4678441, 1, 1, 1, 1, 1,
-2.08986, -0.4205205, 0.6594101, 1, 1, 1, 1, 1,
-2.085073, -0.3141365, -1.835955, 1, 1, 1, 1, 1,
-2.078099, -0.6742977, -1.563842, 1, 1, 1, 1, 1,
-2.075501, 0.7965963, -1.692199, 1, 1, 1, 1, 1,
-2.073767, -1.628664, -3.928144, 1, 1, 1, 1, 1,
-2.050372, -1.028021, -1.637107, 1, 1, 1, 1, 1,
-2.045041, -0.9762434, -3.600857, 1, 1, 1, 1, 1,
-2.017084, -0.5926271, -1.41224, 1, 1, 1, 1, 1,
-2.00743, -1.262903, -2.711926, 1, 1, 1, 1, 1,
-1.989797, 0.771748, -1.004243, 1, 1, 1, 1, 1,
-1.970881, -0.1222449, -1.230835, 1, 1, 1, 1, 1,
-1.964098, 0.2790292, -1.061145, 1, 1, 1, 1, 1,
-1.92598, -0.4587924, -2.102638, 0, 0, 1, 1, 1,
-1.915934, -0.3199981, -1.224997, 1, 0, 0, 1, 1,
-1.884918, -1.199018, -1.926021, 1, 0, 0, 1, 1,
-1.881597, 0.8659708, -2.274877, 1, 0, 0, 1, 1,
-1.850905, 0.223055, -0.6145897, 1, 0, 0, 1, 1,
-1.848123, -0.8377588, -2.026515, 1, 0, 0, 1, 1,
-1.814079, -1.783992, -2.057824, 0, 0, 0, 1, 1,
-1.812272, 0.207206, -3.820112, 0, 0, 0, 1, 1,
-1.802772, -1.174467, -3.817039, 0, 0, 0, 1, 1,
-1.801198, -0.781301, -1.39765, 0, 0, 0, 1, 1,
-1.782758, -1.110176, -0.8973278, 0, 0, 0, 1, 1,
-1.765908, 0.03905283, -2.345124, 0, 0, 0, 1, 1,
-1.744936, -0.8799981, -2.997491, 0, 0, 0, 1, 1,
-1.739319, 1.437552, -0.8898805, 1, 1, 1, 1, 1,
-1.731824, -0.5062266, -2.122967, 1, 1, 1, 1, 1,
-1.731593, -1.264337, -4.736569, 1, 1, 1, 1, 1,
-1.709546, 0.8219118, 0.1386041, 1, 1, 1, 1, 1,
-1.703752, -0.6059793, -1.736273, 1, 1, 1, 1, 1,
-1.686364, 0.5276039, -0.05626781, 1, 1, 1, 1, 1,
-1.679933, 0.3485483, -1.628339, 1, 1, 1, 1, 1,
-1.677846, -1.367795, -3.347338, 1, 1, 1, 1, 1,
-1.676674, -1.932981, -1.344832, 1, 1, 1, 1, 1,
-1.668046, 0.1481109, -0.8618426, 1, 1, 1, 1, 1,
-1.667302, 0.2900063, -2.03951, 1, 1, 1, 1, 1,
-1.644655, -0.5168313, -1.687796, 1, 1, 1, 1, 1,
-1.612237, -1.303812, -1.67713, 1, 1, 1, 1, 1,
-1.601701, 0.6470441, -0.5995668, 1, 1, 1, 1, 1,
-1.597111, -0.4233022, -2.019765, 1, 1, 1, 1, 1,
-1.59327, -0.1717999, -4.120162, 0, 0, 1, 1, 1,
-1.587993, -2.631799, -2.799188, 1, 0, 0, 1, 1,
-1.585556, -0.2665912, -1.09638, 1, 0, 0, 1, 1,
-1.57992, -1.243739, -2.961567, 1, 0, 0, 1, 1,
-1.571362, 0.646987, -0.3159349, 1, 0, 0, 1, 1,
-1.564517, -0.9349406, -3.875407, 1, 0, 0, 1, 1,
-1.557902, -1.238016, -3.226962, 0, 0, 0, 1, 1,
-1.547831, -0.5435663, -2.557909, 0, 0, 0, 1, 1,
-1.536788, -2.962397, -3.349001, 0, 0, 0, 1, 1,
-1.523277, -0.4144758, -2.531769, 0, 0, 0, 1, 1,
-1.521709, -0.2266666, -1.375631, 0, 0, 0, 1, 1,
-1.519231, 0.8955372, -0.6669448, 0, 0, 0, 1, 1,
-1.516167, 0.00972865, -2.207557, 0, 0, 0, 1, 1,
-1.515357, 1.275651, -0.1671712, 1, 1, 1, 1, 1,
-1.507645, 1.431716, -1.120971, 1, 1, 1, 1, 1,
-1.493984, -0.6254399, -2.36359, 1, 1, 1, 1, 1,
-1.490939, 0.756354, -1.872986, 1, 1, 1, 1, 1,
-1.478936, -2.892133, -3.091261, 1, 1, 1, 1, 1,
-1.477756, -0.5936016, -0.8875606, 1, 1, 1, 1, 1,
-1.472423, 0.8632887, -1.2004, 1, 1, 1, 1, 1,
-1.463923, -1.649317, -3.53914, 1, 1, 1, 1, 1,
-1.460195, 0.7268361, -1.044685, 1, 1, 1, 1, 1,
-1.448677, 1.007254, -0.09503813, 1, 1, 1, 1, 1,
-1.444407, 0.5392848, -0.2361709, 1, 1, 1, 1, 1,
-1.441417, -0.4828239, -2.319202, 1, 1, 1, 1, 1,
-1.437544, 1.047327, -2.157529, 1, 1, 1, 1, 1,
-1.436538, -0.7616345, -2.587981, 1, 1, 1, 1, 1,
-1.418717, -0.3160411, -1.249406, 1, 1, 1, 1, 1,
-1.41274, 0.741004, -1.770919, 0, 0, 1, 1, 1,
-1.412474, 0.461021, -3.057552, 1, 0, 0, 1, 1,
-1.412088, -1.811033, -3.447498, 1, 0, 0, 1, 1,
-1.404877, -0.9404044, -2.198834, 1, 0, 0, 1, 1,
-1.385177, -0.1861087, 0.09638526, 1, 0, 0, 1, 1,
-1.384665, -1.014526, -2.812407, 1, 0, 0, 1, 1,
-1.382364, -0.2563431, -2.42608, 0, 0, 0, 1, 1,
-1.382266, -0.1519036, -1.142337, 0, 0, 0, 1, 1,
-1.380967, -0.247366, -1.844342, 0, 0, 0, 1, 1,
-1.379983, -0.1211332, -4.347715, 0, 0, 0, 1, 1,
-1.379805, 0.003696858, -0.2255146, 0, 0, 0, 1, 1,
-1.37267, 0.8745627, -1.836722, 0, 0, 0, 1, 1,
-1.372381, 0.1140165, -0.3513008, 0, 0, 0, 1, 1,
-1.366646, -0.4833378, -3.791023, 1, 1, 1, 1, 1,
-1.36454, 0.3804094, -1.847698, 1, 1, 1, 1, 1,
-1.359946, -2.592994, -1.963962, 1, 1, 1, 1, 1,
-1.358668, 2.591811, -1.992482, 1, 1, 1, 1, 1,
-1.357959, 0.2964991, -0.6376925, 1, 1, 1, 1, 1,
-1.346738, -0.1337352, -1.253748, 1, 1, 1, 1, 1,
-1.34566, 0.2287258, -1.924643, 1, 1, 1, 1, 1,
-1.343006, -0.07468417, 0.3194357, 1, 1, 1, 1, 1,
-1.333746, 0.7471502, -0.4828343, 1, 1, 1, 1, 1,
-1.332896, 0.5841204, -1.458155, 1, 1, 1, 1, 1,
-1.332105, 0.5179426, -1.922265, 1, 1, 1, 1, 1,
-1.331496, -0.6631369, -2.405411, 1, 1, 1, 1, 1,
-1.329299, -1.253135, -2.455156, 1, 1, 1, 1, 1,
-1.322492, -1.484926, -3.117562, 1, 1, 1, 1, 1,
-1.321942, -1.203533, -3.030583, 1, 1, 1, 1, 1,
-1.320107, -0.2347176, -3.342176, 0, 0, 1, 1, 1,
-1.319188, 0.3147863, -1.871539, 1, 0, 0, 1, 1,
-1.314812, 0.8344372, -1.104902, 1, 0, 0, 1, 1,
-1.314464, -0.1840713, -1.005358, 1, 0, 0, 1, 1,
-1.31402, 0.1905399, -1.799906, 1, 0, 0, 1, 1,
-1.29841, -0.1940006, -1.262038, 1, 0, 0, 1, 1,
-1.297524, -0.8889824, -2.888257, 0, 0, 0, 1, 1,
-1.294352, -1.867295, -3.865742, 0, 0, 0, 1, 1,
-1.29147, -0.08665514, -2.038758, 0, 0, 0, 1, 1,
-1.266925, 1.341158, -0.995518, 0, 0, 0, 1, 1,
-1.26692, -0.7906777, -3.101695, 0, 0, 0, 1, 1,
-1.265138, -1.200252, -2.234816, 0, 0, 0, 1, 1,
-1.232037, -1.305588, -2.255074, 0, 0, 0, 1, 1,
-1.217612, 0.1138244, -0.8452091, 1, 1, 1, 1, 1,
-1.215648, -0.2519011, -0.829994, 1, 1, 1, 1, 1,
-1.213, -0.00665231, -2.132303, 1, 1, 1, 1, 1,
-1.212626, 0.5094084, -1.847542, 1, 1, 1, 1, 1,
-1.209412, 1.526674, 2.121659, 1, 1, 1, 1, 1,
-1.208423, 3.159564, -2.041969, 1, 1, 1, 1, 1,
-1.204545, 0.2066401, -0.7885947, 1, 1, 1, 1, 1,
-1.202392, -1.614525, -2.37073, 1, 1, 1, 1, 1,
-1.194898, -0.6308357, -1.550032, 1, 1, 1, 1, 1,
-1.189123, -0.7791867, -2.011145, 1, 1, 1, 1, 1,
-1.18734, 0.720593, -0.9043761, 1, 1, 1, 1, 1,
-1.186555, -1.257012, -1.223107, 1, 1, 1, 1, 1,
-1.181279, -0.922334, -4.048584, 1, 1, 1, 1, 1,
-1.16742, 1.026839, -0.1477711, 1, 1, 1, 1, 1,
-1.165419, 0.3671247, -2.318388, 1, 1, 1, 1, 1,
-1.161484, -2.122714, -1.960631, 0, 0, 1, 1, 1,
-1.151387, 1.047154, -0.3694536, 1, 0, 0, 1, 1,
-1.147094, 1.331149, 0.4579151, 1, 0, 0, 1, 1,
-1.138381, -0.5370532, -3.017342, 1, 0, 0, 1, 1,
-1.138174, -1.169399, -3.437688, 1, 0, 0, 1, 1,
-1.130844, -0.5981393, -0.5815473, 1, 0, 0, 1, 1,
-1.128403, -1.570272, -3.671634, 0, 0, 0, 1, 1,
-1.127574, -0.3417649, -1.712392, 0, 0, 0, 1, 1,
-1.11851, -0.6091356, -3.508214, 0, 0, 0, 1, 1,
-1.117875, 0.6666068, -1.317536, 0, 0, 0, 1, 1,
-1.114137, 0.7186146, -2.621757, 0, 0, 0, 1, 1,
-1.113944, 0.1826543, 0.06994482, 0, 0, 0, 1, 1,
-1.107977, -0.7146521, -2.658953, 0, 0, 0, 1, 1,
-1.106312, 0.03368198, -2.789084, 1, 1, 1, 1, 1,
-1.102798, -0.9043228, -1.725524, 1, 1, 1, 1, 1,
-1.09928, 1.686786, -0.1826871, 1, 1, 1, 1, 1,
-1.098812, -1.23474, -1.807082, 1, 1, 1, 1, 1,
-1.079856, -1.136781, -0.5602273, 1, 1, 1, 1, 1,
-1.076907, -0.3906369, -2.004996, 1, 1, 1, 1, 1,
-1.073931, 1.381759, -1.134409, 1, 1, 1, 1, 1,
-1.058393, -0.4996941, -1.021948, 1, 1, 1, 1, 1,
-1.057454, -0.3618339, -2.941258, 1, 1, 1, 1, 1,
-1.05073, 0.1510929, -1.114482, 1, 1, 1, 1, 1,
-1.044793, 1.797278, -2.12708, 1, 1, 1, 1, 1,
-1.043196, 1.104707, -1.542996, 1, 1, 1, 1, 1,
-1.040823, -0.7991029, -1.497714, 1, 1, 1, 1, 1,
-1.040556, 1.532949, -0.8445883, 1, 1, 1, 1, 1,
-1.035218, -0.3215786, -1.403949, 1, 1, 1, 1, 1,
-1.028789, 1.130901, 0.3448152, 0, 0, 1, 1, 1,
-1.023155, 0.7647783, -0.730843, 1, 0, 0, 1, 1,
-1.020732, 0.9575436, -3.324531, 1, 0, 0, 1, 1,
-1.01912, 0.453623, -1.420402, 1, 0, 0, 1, 1,
-1.007081, -0.6505924, -1.441785, 1, 0, 0, 1, 1,
-0.9968147, 1.518359, 0.4856826, 1, 0, 0, 1, 1,
-0.9950459, -0.5231127, -2.496725, 0, 0, 0, 1, 1,
-0.9903785, 1.363176, -1.363273, 0, 0, 0, 1, 1,
-0.9790229, -0.8005663, -2.214192, 0, 0, 0, 1, 1,
-0.9788166, 1.353433, 0.5061447, 0, 0, 0, 1, 1,
-0.9744393, -0.02220724, -1.21329, 0, 0, 0, 1, 1,
-0.9709747, -1.38824, -1.961864, 0, 0, 0, 1, 1,
-0.9701959, 1.481789, -2.704462, 0, 0, 0, 1, 1,
-0.9583535, 0.9404217, 0.1894674, 1, 1, 1, 1, 1,
-0.9569926, 0.819472, -1.043742, 1, 1, 1, 1, 1,
-0.955193, -0.1685206, -1.115154, 1, 1, 1, 1, 1,
-0.9450378, -0.6384551, -2.973783, 1, 1, 1, 1, 1,
-0.943023, -0.9883053, -0.6223529, 1, 1, 1, 1, 1,
-0.9391785, 1.055349, -0.387086, 1, 1, 1, 1, 1,
-0.938289, 0.9235296, 0.6566535, 1, 1, 1, 1, 1,
-0.9377968, -1.056386, 0.2358717, 1, 1, 1, 1, 1,
-0.9274095, -0.1633281, -0.9714046, 1, 1, 1, 1, 1,
-0.921738, -0.6770499, -1.838029, 1, 1, 1, 1, 1,
-0.9188004, -1.714346, -2.109283, 1, 1, 1, 1, 1,
-0.8989705, -0.6557327, -3.722532, 1, 1, 1, 1, 1,
-0.8949093, -0.01054949, -0.7515355, 1, 1, 1, 1, 1,
-0.8933891, 0.4678559, -1.350878, 1, 1, 1, 1, 1,
-0.8921376, -0.2148641, -2.127154, 1, 1, 1, 1, 1,
-0.8918914, -0.4827907, -2.895703, 0, 0, 1, 1, 1,
-0.8906336, 0.198305, -0.4864278, 1, 0, 0, 1, 1,
-0.885322, -0.9868293, -2.274698, 1, 0, 0, 1, 1,
-0.8776041, 0.6437469, 0.4258695, 1, 0, 0, 1, 1,
-0.8697259, 1.636203, -0.3740554, 1, 0, 0, 1, 1,
-0.8660623, 1.767573, 0.07553025, 1, 0, 0, 1, 1,
-0.8644109, -0.3781056, -2.33382, 0, 0, 0, 1, 1,
-0.8632715, 0.627714, -0.5003715, 0, 0, 0, 1, 1,
-0.8581677, 0.8339409, -1.77073, 0, 0, 0, 1, 1,
-0.8511289, -1.410975, -1.584711, 0, 0, 0, 1, 1,
-0.8448915, -1.501871, -3.024058, 0, 0, 0, 1, 1,
-0.8415892, -0.01849796, -2.703674, 0, 0, 0, 1, 1,
-0.839599, -1.594691, -1.415767, 0, 0, 0, 1, 1,
-0.8351118, -1.037543, -2.362018, 1, 1, 1, 1, 1,
-0.8344467, 0.4354898, -0.6396505, 1, 1, 1, 1, 1,
-0.8341613, 0.258091, -1.700879, 1, 1, 1, 1, 1,
-0.821039, 0.9157638, 0.7599237, 1, 1, 1, 1, 1,
-0.8167349, 1.213777, -1.008657, 1, 1, 1, 1, 1,
-0.8065058, -0.3695661, -1.504376, 1, 1, 1, 1, 1,
-0.8060243, 0.5599996, -1.957423, 1, 1, 1, 1, 1,
-0.8043905, -1.652414, -2.212282, 1, 1, 1, 1, 1,
-0.8027374, 0.2418388, 0.5761784, 1, 1, 1, 1, 1,
-0.8002431, 1.202459, 0.9024941, 1, 1, 1, 1, 1,
-0.7959265, -0.926248, -2.535515, 1, 1, 1, 1, 1,
-0.7908938, 0.1993688, -1.660663, 1, 1, 1, 1, 1,
-0.7890474, -1.771926, -3.319992, 1, 1, 1, 1, 1,
-0.7847549, 0.3298951, -1.54005, 1, 1, 1, 1, 1,
-0.7845868, 0.7263193, -1.161864, 1, 1, 1, 1, 1,
-0.7839063, 0.7713768, 0.8369263, 0, 0, 1, 1, 1,
-0.7834138, -0.04337744, -1.400059, 1, 0, 0, 1, 1,
-0.780405, -0.0441942, -0.4293507, 1, 0, 0, 1, 1,
-0.7716162, -0.3624488, -2.722214, 1, 0, 0, 1, 1,
-0.7708269, -0.4801484, -3.065717, 1, 0, 0, 1, 1,
-0.7632549, 1.011213, -0.7081705, 1, 0, 0, 1, 1,
-0.7629328, -0.7928473, -2.735309, 0, 0, 0, 1, 1,
-0.7584437, 0.8457688, -0.03684457, 0, 0, 0, 1, 1,
-0.7577264, 1.580129, -0.1239278, 0, 0, 0, 1, 1,
-0.7562612, -0.4913238, -1.613655, 0, 0, 0, 1, 1,
-0.7547172, -0.6703133, -3.169085, 0, 0, 0, 1, 1,
-0.7546933, -0.3789496, -2.912638, 0, 0, 0, 1, 1,
-0.7515937, 1.511885, -0.07197889, 0, 0, 0, 1, 1,
-0.7510812, -0.4387513, -0.6057984, 1, 1, 1, 1, 1,
-0.7476066, 0.9704955, -0.3803857, 1, 1, 1, 1, 1,
-0.7395286, -1.285351, -2.142862, 1, 1, 1, 1, 1,
-0.7393231, -2.563406, -4.103857, 1, 1, 1, 1, 1,
-0.7389809, -1.410738, -2.028668, 1, 1, 1, 1, 1,
-0.7330804, -0.4249075, -3.459916, 1, 1, 1, 1, 1,
-0.729955, -0.7790452, -3.1725, 1, 1, 1, 1, 1,
-0.7264817, 1.407775, -0.8545205, 1, 1, 1, 1, 1,
-0.7208828, 0.4318544, -2.845429, 1, 1, 1, 1, 1,
-0.7149103, 1.059846, 0.03770142, 1, 1, 1, 1, 1,
-0.7080104, 0.07912305, -2.145401, 1, 1, 1, 1, 1,
-0.7011124, -0.6429785, -1.595691, 1, 1, 1, 1, 1,
-0.6916804, -1.411165, -1.772503, 1, 1, 1, 1, 1,
-0.6829914, -0.01447735, -2.652914, 1, 1, 1, 1, 1,
-0.6817422, 0.0724562, -1.397989, 1, 1, 1, 1, 1,
-0.6770431, 1.199089, -0.6099641, 0, 0, 1, 1, 1,
-0.6667246, 1.199745, -0.01976134, 1, 0, 0, 1, 1,
-0.6593946, -0.06395224, -0.8194546, 1, 0, 0, 1, 1,
-0.6509669, 0.3467338, -1.18774, 1, 0, 0, 1, 1,
-0.647971, 1.236248, -2.155404, 1, 0, 0, 1, 1,
-0.6467953, 1.335244, -1.379275, 1, 0, 0, 1, 1,
-0.6449708, 0.4309389, -0.4227833, 0, 0, 0, 1, 1,
-0.6435962, 0.7504664, -0.9584079, 0, 0, 0, 1, 1,
-0.6419439, -0.02090062, -1.927881, 0, 0, 0, 1, 1,
-0.6367857, 1.136712, -0.1422023, 0, 0, 0, 1, 1,
-0.6365499, -1.76537, -2.532104, 0, 0, 0, 1, 1,
-0.6352024, -1.390913, -3.090081, 0, 0, 0, 1, 1,
-0.6318877, -0.552005, -2.621579, 0, 0, 0, 1, 1,
-0.6308611, -0.9113951, -3.443943, 1, 1, 1, 1, 1,
-0.6305852, -0.3635966, -1.711582, 1, 1, 1, 1, 1,
-0.6284814, 0.1512907, -0.7031182, 1, 1, 1, 1, 1,
-0.6214281, 0.5884806, -1.328218, 1, 1, 1, 1, 1,
-0.6176327, -1.095014, -3.243518, 1, 1, 1, 1, 1,
-0.6165659, -0.5511053, -1.459725, 1, 1, 1, 1, 1,
-0.6159058, -1.408796, -3.238057, 1, 1, 1, 1, 1,
-0.6153409, -1.401153, -1.315163, 1, 1, 1, 1, 1,
-0.6128834, 0.5495705, 0.4427893, 1, 1, 1, 1, 1,
-0.6122271, 0.4985803, -2.885864, 1, 1, 1, 1, 1,
-0.6095055, 0.6151971, -0.2065985, 1, 1, 1, 1, 1,
-0.6065419, 0.9709957, -0.600634, 1, 1, 1, 1, 1,
-0.600131, 0.2323448, -0.9114646, 1, 1, 1, 1, 1,
-0.5989987, -1.363352, -3.335974, 1, 1, 1, 1, 1,
-0.5966526, 0.02718794, -1.406565, 1, 1, 1, 1, 1,
-0.5964288, -0.6807441, -2.480364, 0, 0, 1, 1, 1,
-0.5860462, 0.01926524, -1.787784, 1, 0, 0, 1, 1,
-0.5778868, -1.189773, -2.271706, 1, 0, 0, 1, 1,
-0.5777392, 0.9131007, -1.099422, 1, 0, 0, 1, 1,
-0.5764319, -0.6205322, -3.850586, 1, 0, 0, 1, 1,
-0.5747827, -0.1955862, -0.7752406, 1, 0, 0, 1, 1,
-0.5746627, -1.65967, -2.292447, 0, 0, 0, 1, 1,
-0.5699684, -0.4575682, -2.099432, 0, 0, 0, 1, 1,
-0.5688319, 0.02780096, -0.4745533, 0, 0, 0, 1, 1,
-0.5536881, -0.4746663, -3.183681, 0, 0, 0, 1, 1,
-0.552482, 0.09648806, -1.665042, 0, 0, 0, 1, 1,
-0.5503407, 0.1863493, -2.390787, 0, 0, 0, 1, 1,
-0.5492701, -0.2980812, -2.723451, 0, 0, 0, 1, 1,
-0.5479901, 0.08464818, 0.1411226, 1, 1, 1, 1, 1,
-0.5475785, 0.6506471, -0.9641236, 1, 1, 1, 1, 1,
-0.5456199, 1.737247, -1.679486, 1, 1, 1, 1, 1,
-0.5407246, 0.3710847, -2.108256, 1, 1, 1, 1, 1,
-0.5355954, -0.4485792, -1.983941, 1, 1, 1, 1, 1,
-0.5323611, 0.1727908, -0.8060926, 1, 1, 1, 1, 1,
-0.5320475, -0.06271371, -0.2629215, 1, 1, 1, 1, 1,
-0.5315405, -0.9258939, -3.927347, 1, 1, 1, 1, 1,
-0.530651, 1.057828, -0.9295502, 1, 1, 1, 1, 1,
-0.5287978, -1.122378, -3.208801, 1, 1, 1, 1, 1,
-0.5270248, 1.473912, -1.928466, 1, 1, 1, 1, 1,
-0.526387, -0.2291665, -1.1624, 1, 1, 1, 1, 1,
-0.517885, -1.368429, -3.462197, 1, 1, 1, 1, 1,
-0.5085974, 1.013824, -0.3671313, 1, 1, 1, 1, 1,
-0.5076753, 0.09884738, -0.9344988, 1, 1, 1, 1, 1,
-0.5068952, -0.7543711, -4.192063, 0, 0, 1, 1, 1,
-0.5051807, -0.2341688, -2.671199, 1, 0, 0, 1, 1,
-0.5024646, 0.05637529, 0.1772338, 1, 0, 0, 1, 1,
-0.4995188, 0.1418774, -0.9743631, 1, 0, 0, 1, 1,
-0.4979887, -0.7591825, -2.270413, 1, 0, 0, 1, 1,
-0.4970299, 0.562744, 0.5857857, 1, 0, 0, 1, 1,
-0.4966093, -0.8389865, -2.581333, 0, 0, 0, 1, 1,
-0.4965501, -0.136556, -1.683634, 0, 0, 0, 1, 1,
-0.4860152, -0.6460438, -4.192297, 0, 0, 0, 1, 1,
-0.4859352, 1.868077, -1.718371, 0, 0, 0, 1, 1,
-0.4855537, -1.967094, -3.532125, 0, 0, 0, 1, 1,
-0.4800857, 0.7287906, 0.1874114, 0, 0, 0, 1, 1,
-0.4799611, 0.6879652, -0.3235136, 0, 0, 0, 1, 1,
-0.4792209, -3.326163, -2.788494, 1, 1, 1, 1, 1,
-0.4776444, -0.3845957, -2.510455, 1, 1, 1, 1, 1,
-0.473941, -0.8135338, -3.009803, 1, 1, 1, 1, 1,
-0.4719363, -0.0131605, -0.5154728, 1, 1, 1, 1, 1,
-0.4707185, 0.6688415, -1.469467, 1, 1, 1, 1, 1,
-0.4656985, 1.208956, -1.183843, 1, 1, 1, 1, 1,
-0.4619927, 1.332606, -1.133793, 1, 1, 1, 1, 1,
-0.4615598, 0.2559533, -1.331487, 1, 1, 1, 1, 1,
-0.4612172, 3.744861, 1.701115, 1, 1, 1, 1, 1,
-0.4585073, -1.34604, -1.799138, 1, 1, 1, 1, 1,
-0.4547699, -1.659891, -2.167274, 1, 1, 1, 1, 1,
-0.4545254, 1.855151, 2.045602, 1, 1, 1, 1, 1,
-0.4510821, -0.6419778, -3.387219, 1, 1, 1, 1, 1,
-0.4420217, 0.584002, -0.2227957, 1, 1, 1, 1, 1,
-0.437442, -0.04754502, -3.894832, 1, 1, 1, 1, 1,
-0.4316804, 0.4915934, 0.2701989, 0, 0, 1, 1, 1,
-0.4296307, 0.2458396, -0.7236425, 1, 0, 0, 1, 1,
-0.4291463, -0.1741298, -1.645876, 1, 0, 0, 1, 1,
-0.4170357, 0.06048951, -1.648046, 1, 0, 0, 1, 1,
-0.4169483, 1.377822, -0.1104109, 1, 0, 0, 1, 1,
-0.4162865, -0.9123505, -3.540915, 1, 0, 0, 1, 1,
-0.4157979, 0.1852926, -2.612608, 0, 0, 0, 1, 1,
-0.4142661, 1.290043, -0.7905645, 0, 0, 0, 1, 1,
-0.4118001, -0.3556646, -1.092815, 0, 0, 0, 1, 1,
-0.4093482, 0.8925974, -2.233584, 0, 0, 0, 1, 1,
-0.4038337, -1.257322, -2.372267, 0, 0, 0, 1, 1,
-0.40279, -0.445398, -1.388594, 0, 0, 0, 1, 1,
-0.4014732, 0.05284168, -0.7044773, 0, 0, 0, 1, 1,
-0.3998502, 2.466146, 0.3668863, 1, 1, 1, 1, 1,
-0.3930348, -0.8094819, -1.357158, 1, 1, 1, 1, 1,
-0.3909087, 0.2351964, -0.5450907, 1, 1, 1, 1, 1,
-0.3892587, 0.4639035, -0.9696019, 1, 1, 1, 1, 1,
-0.3877907, 0.1950582, 1.126152, 1, 1, 1, 1, 1,
-0.3857902, 1.259202, -0.6609216, 1, 1, 1, 1, 1,
-0.385594, -1.419868, -2.873258, 1, 1, 1, 1, 1,
-0.3715937, 0.06341819, -0.2275884, 1, 1, 1, 1, 1,
-0.364127, 0.121022, -2.298293, 1, 1, 1, 1, 1,
-0.3617403, 1.402308, 0.3332269, 1, 1, 1, 1, 1,
-0.3603809, -0.9621245, -2.895614, 1, 1, 1, 1, 1,
-0.3578938, -0.5553027, -3.295928, 1, 1, 1, 1, 1,
-0.3570796, 0.7816765, -0.2865326, 1, 1, 1, 1, 1,
-0.349554, -0.3402975, -1.821394, 1, 1, 1, 1, 1,
-0.3493228, -0.4647454, -1.834201, 1, 1, 1, 1, 1,
-0.3491449, 0.3760875, 0.2508439, 0, 0, 1, 1, 1,
-0.3462186, 0.2394386, -1.312053, 1, 0, 0, 1, 1,
-0.3461735, -1.423762, -1.660571, 1, 0, 0, 1, 1,
-0.3457097, -0.784867, -2.563721, 1, 0, 0, 1, 1,
-0.3384512, -1.100422, -3.266388, 1, 0, 0, 1, 1,
-0.3371647, -0.8769068, -3.067277, 1, 0, 0, 1, 1,
-0.333561, -0.5551825, -3.849146, 0, 0, 0, 1, 1,
-0.3309166, 0.3944041, -0.4371558, 0, 0, 0, 1, 1,
-0.3303054, 1.434052, 1.657126, 0, 0, 0, 1, 1,
-0.3288674, 1.078575, -2.600868, 0, 0, 0, 1, 1,
-0.3256691, -1.842274, -1.40031, 0, 0, 0, 1, 1,
-0.3256327, 1.210503, 0.4033864, 0, 0, 0, 1, 1,
-0.3242978, 0.5526083, -2.200837, 0, 0, 0, 1, 1,
-0.3241096, 0.2834915, -2.529912, 1, 1, 1, 1, 1,
-0.3201083, 1.007794, -0.6979938, 1, 1, 1, 1, 1,
-0.3200656, -2.458086, -2.461419, 1, 1, 1, 1, 1,
-0.3195281, -0.8588311, -3.114296, 1, 1, 1, 1, 1,
-0.3179483, -0.235999, -0.8837484, 1, 1, 1, 1, 1,
-0.3141358, -0.3542033, -3.291408, 1, 1, 1, 1, 1,
-0.3134307, 0.5226206, 0.4964663, 1, 1, 1, 1, 1,
-0.3110781, 1.059541, -0.01922359, 1, 1, 1, 1, 1,
-0.3107874, -0.8218625, -3.563755, 1, 1, 1, 1, 1,
-0.3085051, -0.6046295, -0.7884577, 1, 1, 1, 1, 1,
-0.3081164, -0.08994272, -2.601111, 1, 1, 1, 1, 1,
-0.3040892, 0.2205885, -0.5289945, 1, 1, 1, 1, 1,
-0.3035307, -0.3747378, -0.2163657, 1, 1, 1, 1, 1,
-0.3030109, 0.01893097, -1.368729, 1, 1, 1, 1, 1,
-0.3020514, -0.07914069, -2.655063, 1, 1, 1, 1, 1,
-0.2999442, 0.99478, -0.799135, 0, 0, 1, 1, 1,
-0.2907853, 0.4419946, -0.2620423, 1, 0, 0, 1, 1,
-0.2901994, -0.4680987, -1.983698, 1, 0, 0, 1, 1,
-0.2899728, -0.9498783, -2.494785, 1, 0, 0, 1, 1,
-0.2879702, -0.4108106, -0.5957943, 1, 0, 0, 1, 1,
-0.2851741, 1.1156, -2.10334, 1, 0, 0, 1, 1,
-0.283409, -1.118467, -2.495864, 0, 0, 0, 1, 1,
-0.2780874, -0.2393036, -2.532715, 0, 0, 0, 1, 1,
-0.2766683, 0.1435739, 0.8232369, 0, 0, 0, 1, 1,
-0.2748055, -1.134701, -2.253173, 0, 0, 0, 1, 1,
-0.2745848, 1.441998, -0.499138, 0, 0, 0, 1, 1,
-0.272197, 0.2813503, -1.082745, 0, 0, 0, 1, 1,
-0.2694243, 1.601707, 1.196894, 0, 0, 0, 1, 1,
-0.2670585, 0.05538295, -1.034654, 1, 1, 1, 1, 1,
-0.2651663, 0.9461727, -0.7591238, 1, 1, 1, 1, 1,
-0.2603763, 0.03923239, -1.882924, 1, 1, 1, 1, 1,
-0.2594782, -0.1500608, -1.406756, 1, 1, 1, 1, 1,
-0.2593009, -1.134826, -2.267496, 1, 1, 1, 1, 1,
-0.2576513, 0.2059191, 0.2236494, 1, 1, 1, 1, 1,
-0.257453, -0.6355683, -1.670224, 1, 1, 1, 1, 1,
-0.2565762, 0.6583706, -0.7152745, 1, 1, 1, 1, 1,
-0.2521367, -0.1696232, -0.9510322, 1, 1, 1, 1, 1,
-0.2503805, 0.1312925, -0.0555493, 1, 1, 1, 1, 1,
-0.2420419, 0.915471, -1.15163, 1, 1, 1, 1, 1,
-0.2318552, 0.8010945, 1.884259, 1, 1, 1, 1, 1,
-0.2305819, 0.5150225, -0.439539, 1, 1, 1, 1, 1,
-0.2283826, -1.1269, -4.526309, 1, 1, 1, 1, 1,
-0.2281219, -0.5443523, -1.751175, 1, 1, 1, 1, 1,
-0.2251414, 0.8757486, 0.9023852, 0, 0, 1, 1, 1,
-0.2201593, -0.5872037, -3.046257, 1, 0, 0, 1, 1,
-0.2189617, 1.854427, -0.650218, 1, 0, 0, 1, 1,
-0.2188124, -1.183904, -3.546201, 1, 0, 0, 1, 1,
-0.2174079, 0.5293325, -0.1785072, 1, 0, 0, 1, 1,
-0.2148478, 1.221073, 1.381051, 1, 0, 0, 1, 1,
-0.2123378, 2.164976, -1.913317, 0, 0, 0, 1, 1,
-0.2105583, 0.4307172, -0.1198071, 0, 0, 0, 1, 1,
-0.2100594, -0.1129506, -2.988976, 0, 0, 0, 1, 1,
-0.2017265, -0.6274687, -2.047466, 0, 0, 0, 1, 1,
-0.1946048, -1.646229, -3.089395, 0, 0, 0, 1, 1,
-0.1944196, 0.8359289, -1.262267, 0, 0, 0, 1, 1,
-0.193367, -0.09005277, -2.515689, 0, 0, 0, 1, 1,
-0.1902014, -0.6056054, -2.470111, 1, 1, 1, 1, 1,
-0.1899461, 0.815513, -0.9942216, 1, 1, 1, 1, 1,
-0.1887744, -0.5252506, -3.662305, 1, 1, 1, 1, 1,
-0.1864409, 0.7302603, 0.5610323, 1, 1, 1, 1, 1,
-0.1864329, -1.103078, -1.57341, 1, 1, 1, 1, 1,
-0.1834971, 0.5579305, -0.6708102, 1, 1, 1, 1, 1,
-0.1819409, -0.8813998, -3.491338, 1, 1, 1, 1, 1,
-0.1781641, -1.013918, -2.254349, 1, 1, 1, 1, 1,
-0.1759175, -0.4293377, -1.331508, 1, 1, 1, 1, 1,
-0.1752904, -0.1239645, -1.570214, 1, 1, 1, 1, 1,
-0.172539, 0.9438371, -0.7593321, 1, 1, 1, 1, 1,
-0.1698569, -1.156141, -2.942571, 1, 1, 1, 1, 1,
-0.1690445, -0.6917269, -2.974317, 1, 1, 1, 1, 1,
-0.1687116, 0.5580197, -0.4047351, 1, 1, 1, 1, 1,
-0.1685696, -0.5643416, -2.680941, 1, 1, 1, 1, 1,
-0.1673492, 0.4428775, -0.7738019, 0, 0, 1, 1, 1,
-0.1638654, -2.259874, -2.314077, 1, 0, 0, 1, 1,
-0.1638182, -0.3056389, -0.4613806, 1, 0, 0, 1, 1,
-0.1636503, 0.3629574, -0.2662098, 1, 0, 0, 1, 1,
-0.1626985, -0.337974, -4.413116, 1, 0, 0, 1, 1,
-0.1577699, -1.064224, -2.668257, 1, 0, 0, 1, 1,
-0.1503668, -1.310369, -3.312935, 0, 0, 0, 1, 1,
-0.1418833, -1.447165, -3.71331, 0, 0, 0, 1, 1,
-0.1414189, -0.8858153, -3.829948, 0, 0, 0, 1, 1,
-0.1379183, 0.06007908, -3.205797, 0, 0, 0, 1, 1,
-0.1372151, -0.1735829, -2.489286, 0, 0, 0, 1, 1,
-0.1364585, 0.4588798, -0.9415177, 0, 0, 0, 1, 1,
-0.1318551, 0.4232614, -0.334989, 0, 0, 0, 1, 1,
-0.1247851, -1.773791, -1.038278, 1, 1, 1, 1, 1,
-0.1245875, 0.3518206, -1.158211, 1, 1, 1, 1, 1,
-0.1237182, -0.5952154, -3.720947, 1, 1, 1, 1, 1,
-0.1235187, -0.3373254, -1.452584, 1, 1, 1, 1, 1,
-0.1191232, -1.797817, -2.980092, 1, 1, 1, 1, 1,
-0.1149208, 0.4115394, 1.427217, 1, 1, 1, 1, 1,
-0.1116538, 0.4093877, 1.446361, 1, 1, 1, 1, 1,
-0.1108844, 0.5930108, -1.452319, 1, 1, 1, 1, 1,
-0.1091397, -1.32935, -3.218963, 1, 1, 1, 1, 1,
-0.10829, 0.2511954, -0.375402, 1, 1, 1, 1, 1,
-0.1074698, 0.8692548, 0.3454247, 1, 1, 1, 1, 1,
-0.1017505, -0.7678772, -3.462555, 1, 1, 1, 1, 1,
-0.1007107, 0.5083416, 0.6094487, 1, 1, 1, 1, 1,
-0.09979419, -0.1295744, -2.60842, 1, 1, 1, 1, 1,
-0.0993149, -0.09678292, -1.534116, 1, 1, 1, 1, 1,
-0.09841293, -0.5027472, -3.954172, 0, 0, 1, 1, 1,
-0.0982969, -0.6265397, -2.741731, 1, 0, 0, 1, 1,
-0.09802782, -0.03898139, -1.636365, 1, 0, 0, 1, 1,
-0.09617807, -0.473825, -1.957649, 1, 0, 0, 1, 1,
-0.09598518, 1.694274, 0.1038699, 1, 0, 0, 1, 1,
-0.08657716, -0.781945, -3.81212, 1, 0, 0, 1, 1,
-0.08604327, -1.504948, -2.026885, 0, 0, 0, 1, 1,
-0.08089787, -1.196928, -4.578991, 0, 0, 0, 1, 1,
-0.08088943, -0.6414101, -2.931911, 0, 0, 0, 1, 1,
-0.08048674, -2.226696, -2.57121, 0, 0, 0, 1, 1,
-0.07895534, 0.5724634, -0.7645493, 0, 0, 0, 1, 1,
-0.07509351, 0.6411385, -1.748994, 0, 0, 0, 1, 1,
-0.06625334, 0.9638628, -0.8060938, 0, 0, 0, 1, 1,
-0.06245738, 0.01288794, -0.8998113, 1, 1, 1, 1, 1,
-0.06204176, 1.607218, -0.275997, 1, 1, 1, 1, 1,
-0.05686087, -0.787919, -2.940593, 1, 1, 1, 1, 1,
-0.05502378, -0.1222638, -2.711557, 1, 1, 1, 1, 1,
-0.05379184, 0.5631385, -1.414584, 1, 1, 1, 1, 1,
-0.05208189, 0.2162781, -0.6137846, 1, 1, 1, 1, 1,
-0.05009741, 0.01737334, 1.379157, 1, 1, 1, 1, 1,
-0.04728064, -2.151663, -4.948362, 1, 1, 1, 1, 1,
-0.04634628, -2.775279, -3.118326, 1, 1, 1, 1, 1,
-0.04609035, 1.756901, -0.3860393, 1, 1, 1, 1, 1,
-0.0441507, 2.414577, -1.107237, 1, 1, 1, 1, 1,
-0.03935883, 0.4822715, 0.5757952, 1, 1, 1, 1, 1,
-0.03229121, -1.237273, -1.882022, 1, 1, 1, 1, 1,
-0.03184346, -0.388782, -2.56023, 1, 1, 1, 1, 1,
-0.03046928, -2.644701, -2.4292, 1, 1, 1, 1, 1,
-0.02858521, -0.1128264, -3.843215, 0, 0, 1, 1, 1,
-0.01815397, -0.8211409, -2.839316, 1, 0, 0, 1, 1,
-0.0144385, -0.263364, -2.759957, 1, 0, 0, 1, 1,
-0.01132404, -0.06778154, -3.808701, 1, 0, 0, 1, 1,
-0.01059174, -0.2292421, -4.485008, 1, 0, 0, 1, 1,
-0.008915867, -1.387758, -1.529207, 1, 0, 0, 1, 1,
-0.008893436, -0.9253374, -2.999904, 0, 0, 0, 1, 1,
-0.007462009, 0.1119283, -1.256904, 0, 0, 0, 1, 1,
-0.007340938, 0.07766335, -0.9611529, 0, 0, 0, 1, 1,
-0.007194656, 1.279605, -0.5409095, 0, 0, 0, 1, 1,
-0.006777965, 2.673425, -0.7428671, 0, 0, 0, 1, 1,
-0.002177575, -0.3131562, -3.937472, 0, 0, 0, 1, 1,
6.031615e-06, 0.2282761, 1.271707, 0, 0, 0, 1, 1,
0.001053418, -0.551513, 1.666089, 1, 1, 1, 1, 1,
0.003989258, -0.05651706, 1.942005, 1, 1, 1, 1, 1,
0.005858521, -0.5185329, 1.329387, 1, 1, 1, 1, 1,
0.006031215, 1.753116, 0.06870636, 1, 1, 1, 1, 1,
0.007641665, 0.07732695, -1.181883, 1, 1, 1, 1, 1,
0.01201, -1.111063, 2.777999, 1, 1, 1, 1, 1,
0.0128456, -0.5259929, 3.687746, 1, 1, 1, 1, 1,
0.01529304, -1.201137, 1.828964, 1, 1, 1, 1, 1,
0.01800967, 0.255087, -0.5124007, 1, 1, 1, 1, 1,
0.01882357, -0.3894754, 3.60475, 1, 1, 1, 1, 1,
0.02029899, -0.9240718, 0.7886694, 1, 1, 1, 1, 1,
0.02192344, 0.9110715, 0.1972284, 1, 1, 1, 1, 1,
0.026539, -0.6707878, 2.846504, 1, 1, 1, 1, 1,
0.02693122, -1.291691, 4.066078, 1, 1, 1, 1, 1,
0.02718346, 1.790299, -0.2849197, 1, 1, 1, 1, 1,
0.02949419, -0.5345306, 2.816688, 0, 0, 1, 1, 1,
0.03152229, 0.2791206, -0.09254923, 1, 0, 0, 1, 1,
0.03454709, -1.105241, 2.581568, 1, 0, 0, 1, 1,
0.04201761, -0.166093, 3.099725, 1, 0, 0, 1, 1,
0.04278329, 1.064867, -1.30043, 1, 0, 0, 1, 1,
0.04467462, 0.01656236, 1.312825, 1, 0, 0, 1, 1,
0.0469329, -0.2962714, 4.360676, 0, 0, 0, 1, 1,
0.0478601, -1.199619, 3.077722, 0, 0, 0, 1, 1,
0.04957699, -0.2664791, 1.588802, 0, 0, 0, 1, 1,
0.05115407, -1.349872, 5.496605, 0, 0, 0, 1, 1,
0.05118342, -0.2370308, 2.984256, 0, 0, 0, 1, 1,
0.05516839, 0.3141418, 1.709165, 0, 0, 0, 1, 1,
0.05680968, 0.9823611, 0.4299236, 0, 0, 0, 1, 1,
0.06142535, -1.058548, 3.180795, 1, 1, 1, 1, 1,
0.06542783, -0.1869957, 1.241189, 1, 1, 1, 1, 1,
0.07033335, 0.6749655, 1.23454, 1, 1, 1, 1, 1,
0.07676227, -0.6372135, 4.449123, 1, 1, 1, 1, 1,
0.07754343, -1.818315, 3.46354, 1, 1, 1, 1, 1,
0.07811967, 1.66821, -0.3685224, 1, 1, 1, 1, 1,
0.07998892, -1.178756, 4.755273, 1, 1, 1, 1, 1,
0.0809306, 0.40648, -0.7640847, 1, 1, 1, 1, 1,
0.08252369, 0.44691, 0.8424049, 1, 1, 1, 1, 1,
0.08547243, 1.720263, 0.3276886, 1, 1, 1, 1, 1,
0.0891851, 0.6233917, -2.222781, 1, 1, 1, 1, 1,
0.09704227, -0.6340829, 3.301212, 1, 1, 1, 1, 1,
0.09956639, 0.04848796, 3.023639, 1, 1, 1, 1, 1,
0.09958054, -0.6200563, 2.994931, 1, 1, 1, 1, 1,
0.1000812, -0.6470786, 4.450832, 1, 1, 1, 1, 1,
0.1022046, -0.6284604, 1.365687, 0, 0, 1, 1, 1,
0.1052673, 1.186893, 0.201368, 1, 0, 0, 1, 1,
0.1068294, 0.6192912, 1.380872, 1, 0, 0, 1, 1,
0.1089969, -0.5584888, 1.904779, 1, 0, 0, 1, 1,
0.1096469, -0.2940845, 3.295206, 1, 0, 0, 1, 1,
0.1105017, -0.7904248, 5.528529, 1, 0, 0, 1, 1,
0.1125158, -1.539346, 2.982653, 0, 0, 0, 1, 1,
0.1133092, 0.1648644, 1.62387, 0, 0, 0, 1, 1,
0.1211242, 1.51501, 1.766761, 0, 0, 0, 1, 1,
0.1213424, -1.267996, 2.716986, 0, 0, 0, 1, 1,
0.1255596, -1.162954, 0.8493857, 0, 0, 0, 1, 1,
0.1268481, -2.921092, 1.627167, 0, 0, 0, 1, 1,
0.1300905, 0.3118544, 0.4645624, 0, 0, 0, 1, 1,
0.1351512, 0.9628281, 0.1870161, 1, 1, 1, 1, 1,
0.1352793, 0.7402298, 0.02992896, 1, 1, 1, 1, 1,
0.1390648, 0.1398964, 0.1201233, 1, 1, 1, 1, 1,
0.139588, 0.3481589, -1.833698, 1, 1, 1, 1, 1,
0.142357, 0.2204463, 0.8031001, 1, 1, 1, 1, 1,
0.143245, -0.02830838, 1.860469, 1, 1, 1, 1, 1,
0.1435347, -0.3280079, 2.931386, 1, 1, 1, 1, 1,
0.1450931, -0.09423131, 1.369384, 1, 1, 1, 1, 1,
0.1462956, -0.3883821, 2.327476, 1, 1, 1, 1, 1,
0.1483311, -0.02942461, 2.138993, 1, 1, 1, 1, 1,
0.1487926, -0.3976194, 3.853128, 1, 1, 1, 1, 1,
0.1504896, 0.4836631, 0.7151756, 1, 1, 1, 1, 1,
0.1531852, 1.158463, -0.145457, 1, 1, 1, 1, 1,
0.1549192, -1.428763, 3.160661, 1, 1, 1, 1, 1,
0.1553932, -1.187209, 0.3198835, 1, 1, 1, 1, 1,
0.156274, -1.285401, 2.561298, 0, 0, 1, 1, 1,
0.1591427, -0.6823409, 2.892141, 1, 0, 0, 1, 1,
0.1596079, 1.430047, 0.09286741, 1, 0, 0, 1, 1,
0.1626146, -0.7944762, 2.139618, 1, 0, 0, 1, 1,
0.1673996, -0.7101335, 2.905569, 1, 0, 0, 1, 1,
0.1689742, -0.6865204, 2.868048, 1, 0, 0, 1, 1,
0.1700212, -0.8025842, 3.090413, 0, 0, 0, 1, 1,
0.170673, -0.9997147, 4.112936, 0, 0, 0, 1, 1,
0.1743762, -0.3386918, 1.20767, 0, 0, 0, 1, 1,
0.1803461, 0.2163185, 3.537519, 0, 0, 0, 1, 1,
0.1828875, -2.277467, 1.844322, 0, 0, 0, 1, 1,
0.1853121, 2.342719, -0.8812878, 0, 0, 0, 1, 1,
0.1853191, -0.476153, 2.776799, 0, 0, 0, 1, 1,
0.1857705, -0.7532979, 1.141888, 1, 1, 1, 1, 1,
0.18607, 1.749979, 0.3939179, 1, 1, 1, 1, 1,
0.1934754, -0.6469893, 2.6057, 1, 1, 1, 1, 1,
0.1936544, 0.3698161, 2.106592, 1, 1, 1, 1, 1,
0.1989101, -2.540963, 2.886476, 1, 1, 1, 1, 1,
0.2008991, -0.4103219, 4.296672, 1, 1, 1, 1, 1,
0.2060783, 0.2568503, 1.084661, 1, 1, 1, 1, 1,
0.2091791, 0.6188719, 0.6222122, 1, 1, 1, 1, 1,
0.2096353, -0.2609028, 2.368078, 1, 1, 1, 1, 1,
0.209746, 1.657619, -0.6779345, 1, 1, 1, 1, 1,
0.2157921, -1.407518, 1.090303, 1, 1, 1, 1, 1,
0.2270991, -0.2792804, 0.5018135, 1, 1, 1, 1, 1,
0.229087, 0.1839136, 0.6397623, 1, 1, 1, 1, 1,
0.235815, -0.2574436, 3.208951, 1, 1, 1, 1, 1,
0.2462127, -0.1657836, 3.223658, 1, 1, 1, 1, 1,
0.249898, 0.5360786, -0.9671338, 0, 0, 1, 1, 1,
0.2516083, -1.112129, 3.858497, 1, 0, 0, 1, 1,
0.2550312, -0.04347783, 1.913202, 1, 0, 0, 1, 1,
0.2574156, 0.01738423, 2.623414, 1, 0, 0, 1, 1,
0.2590979, -1.546713, 2.043991, 1, 0, 0, 1, 1,
0.2603748, -0.3223705, 3.726875, 1, 0, 0, 1, 1,
0.2610467, -1.609361, 3.334321, 0, 0, 0, 1, 1,
0.261054, -0.419141, 2.443641, 0, 0, 0, 1, 1,
0.2618976, 0.300679, 1.003411, 0, 0, 0, 1, 1,
0.2660605, -2.512291, 3.569675, 0, 0, 0, 1, 1,
0.2663702, 0.007782666, 2.437848, 0, 0, 0, 1, 1,
0.2680492, -2.01104, 3.614507, 0, 0, 0, 1, 1,
0.2730119, 0.8971649, -0.3550116, 0, 0, 0, 1, 1,
0.276829, -1.731198, 2.872093, 1, 1, 1, 1, 1,
0.2824308, -0.6370729, 3.973058, 1, 1, 1, 1, 1,
0.2867756, 1.155144, -1.651468, 1, 1, 1, 1, 1,
0.2879202, 0.147691, 2.049486, 1, 1, 1, 1, 1,
0.2907642, -1.197566, 2.106029, 1, 1, 1, 1, 1,
0.2934774, -0.460413, 1.892099, 1, 1, 1, 1, 1,
0.2937029, 1.77152, 0.2945595, 1, 1, 1, 1, 1,
0.3000579, 1.510162, -0.4805805, 1, 1, 1, 1, 1,
0.3011986, 0.2655865, 0.506012, 1, 1, 1, 1, 1,
0.3015721, -1.272944, 1.407209, 1, 1, 1, 1, 1,
0.3025393, -0.2193292, 1.088908, 1, 1, 1, 1, 1,
0.3058696, 0.004935768, 1.767609, 1, 1, 1, 1, 1,
0.3133273, 0.1973109, 0.3160333, 1, 1, 1, 1, 1,
0.3138664, -3.078537, 1.151196, 1, 1, 1, 1, 1,
0.3179487, -0.6290513, 3.693135, 1, 1, 1, 1, 1,
0.319563, 0.3320799, 0.3776133, 0, 0, 1, 1, 1,
0.3199998, 2.07746, -1.129548, 1, 0, 0, 1, 1,
0.3215824, 1.317635, 0.7535022, 1, 0, 0, 1, 1,
0.3216317, 0.4763195, -1.633944, 1, 0, 0, 1, 1,
0.3242451, 0.6214882, 0.07634883, 1, 0, 0, 1, 1,
0.3253415, -0.8145961, 2.1469, 1, 0, 0, 1, 1,
0.3263372, 0.6945421, -0.1782028, 0, 0, 0, 1, 1,
0.3272248, -0.1544587, 1.234859, 0, 0, 0, 1, 1,
0.3289739, -0.9990519, 1.779784, 0, 0, 0, 1, 1,
0.3413382, 0.8777915, -1.025446, 0, 0, 0, 1, 1,
0.3419766, -0.8038784, 3.227549, 0, 0, 0, 1, 1,
0.3459233, 1.557778, -1.611898, 0, 0, 0, 1, 1,
0.3461148, 1.043171, -1.267613, 0, 0, 0, 1, 1,
0.3467721, 1.716702, 0.5807998, 1, 1, 1, 1, 1,
0.3468758, 0.6702576, 2.080771, 1, 1, 1, 1, 1,
0.3531423, -1.655888, 4.522455, 1, 1, 1, 1, 1,
0.3540134, 2.573602, -0.07894972, 1, 1, 1, 1, 1,
0.3542367, 0.3499559, 2.057468, 1, 1, 1, 1, 1,
0.3554427, 0.1358015, 2.04656, 1, 1, 1, 1, 1,
0.3604399, 0.4444755, -0.3581694, 1, 1, 1, 1, 1,
0.3642284, -1.807358, 3.706977, 1, 1, 1, 1, 1,
0.3714289, -0.3463707, 2.177892, 1, 1, 1, 1, 1,
0.3764961, -0.4730178, 2.241617, 1, 1, 1, 1, 1,
0.3768903, 0.8374181, -0.1323894, 1, 1, 1, 1, 1,
0.3790261, -1.028595, 2.738584, 1, 1, 1, 1, 1,
0.3824139, 0.8383833, -0.5115166, 1, 1, 1, 1, 1,
0.3864803, 0.3937396, 0.5587242, 1, 1, 1, 1, 1,
0.3873457, 0.8600336, 0.574599, 1, 1, 1, 1, 1,
0.3877256, 0.4917755, 0.7841579, 0, 0, 1, 1, 1,
0.3879123, 0.864776, 1.553424, 1, 0, 0, 1, 1,
0.3899002, -0.5498115, 4.129552, 1, 0, 0, 1, 1,
0.3905292, -0.492553, 1.25571, 1, 0, 0, 1, 1,
0.391616, -0.08670762, 0.4282714, 1, 0, 0, 1, 1,
0.3921609, -0.8697654, 2.023983, 1, 0, 0, 1, 1,
0.3929054, -1.98736, 3.358222, 0, 0, 0, 1, 1,
0.39515, -0.7976205, 2.525213, 0, 0, 0, 1, 1,
0.3974174, 1.257095, 0.4310398, 0, 0, 0, 1, 1,
0.3975632, 1.224421, 0.3264909, 0, 0, 0, 1, 1,
0.3986428, 2.080174, 0.7325519, 0, 0, 0, 1, 1,
0.4019778, -0.2084788, 1.365654, 0, 0, 0, 1, 1,
0.4071074, 0.1915909, 1.760566, 0, 0, 0, 1, 1,
0.4132217, -0.03359511, 2.367175, 1, 1, 1, 1, 1,
0.4187585, -0.3348932, 3.870905, 1, 1, 1, 1, 1,
0.4197179, 1.458255, -0.4527991, 1, 1, 1, 1, 1,
0.4220204, -0.4636548, 2.14041, 1, 1, 1, 1, 1,
0.422833, 1.051002, -0.4689738, 1, 1, 1, 1, 1,
0.4265133, 0.4055694, -0.5812428, 1, 1, 1, 1, 1,
0.428395, 1.138067, -0.5682743, 1, 1, 1, 1, 1,
0.4354866, -0.8992991, 3.87758, 1, 1, 1, 1, 1,
0.4432627, -0.9499684, 4.014786, 1, 1, 1, 1, 1,
0.4487188, 0.7433568, 0.4732586, 1, 1, 1, 1, 1,
0.4509783, -0.04214013, 2.441211, 1, 1, 1, 1, 1,
0.4515404, -0.3226227, 1.652807, 1, 1, 1, 1, 1,
0.4523976, -0.7354786, 2.531462, 1, 1, 1, 1, 1,
0.4551808, 3.135668, 1.322029, 1, 1, 1, 1, 1,
0.459387, 1.154834, -0.1641901, 1, 1, 1, 1, 1,
0.4598188, -0.2261537, 1.460689, 0, 0, 1, 1, 1,
0.4661036, 0.6425263, 2.302054, 1, 0, 0, 1, 1,
0.4699625, 1.771501, -0.4042751, 1, 0, 0, 1, 1,
0.4726997, -0.2008485, -0.4325333, 1, 0, 0, 1, 1,
0.4775078, 1.814263, 0.2253834, 1, 0, 0, 1, 1,
0.4783222, -0.05318251, 0.2672622, 1, 0, 0, 1, 1,
0.4787014, 0.6478962, 1.770211, 0, 0, 0, 1, 1,
0.4801736, -0.2489523, 1.809609, 0, 0, 0, 1, 1,
0.4877665, 0.2824533, 2.196522, 0, 0, 0, 1, 1,
0.4906718, 1.050559, 1.291986, 0, 0, 0, 1, 1,
0.4937938, -0.6219143, 3.842957, 0, 0, 0, 1, 1,
0.4939795, 0.2049103, 1.602622, 0, 0, 0, 1, 1,
0.4978536, 0.09765785, 2.036479, 0, 0, 0, 1, 1,
0.5010633, 0.7450427, 1.039808, 1, 1, 1, 1, 1,
0.501202, 0.2646697, 2.170851, 1, 1, 1, 1, 1,
0.5024409, -0.2493314, 1.474072, 1, 1, 1, 1, 1,
0.5127475, -0.7666376, 1.652633, 1, 1, 1, 1, 1,
0.5151663, -1.328333, 3.036352, 1, 1, 1, 1, 1,
0.5194897, -1.683247, 4.915199, 1, 1, 1, 1, 1,
0.5208619, -0.3643924, 1.402912, 1, 1, 1, 1, 1,
0.5236616, 0.5806522, 2.56646, 1, 1, 1, 1, 1,
0.5273985, -1.996848, 3.040087, 1, 1, 1, 1, 1,
0.5298164, -0.7360774, 2.864058, 1, 1, 1, 1, 1,
0.5306827, 2.678354, 0.322442, 1, 1, 1, 1, 1,
0.5354365, -0.4849499, 1.55614, 1, 1, 1, 1, 1,
0.5378215, 0.8956711, -0.5321147, 1, 1, 1, 1, 1,
0.5403271, 1.225196, 0.9882507, 1, 1, 1, 1, 1,
0.5403826, 0.1409511, 0.5302287, 1, 1, 1, 1, 1,
0.5414759, -0.5446027, 2.380898, 0, 0, 1, 1, 1,
0.5418513, -0.5100747, 1.844367, 1, 0, 0, 1, 1,
0.5482904, 0.2474085, 1.005611, 1, 0, 0, 1, 1,
0.5497822, 1.116954, -0.09253724, 1, 0, 0, 1, 1,
0.5520585, 1.47268, -0.8760753, 1, 0, 0, 1, 1,
0.5524016, 0.4650808, -1.145127, 1, 0, 0, 1, 1,
0.5550803, 2.647607, -0.9779325, 0, 0, 0, 1, 1,
0.5577977, -2.164489, 2.996365, 0, 0, 0, 1, 1,
0.5586684, -0.320347, 4.251808, 0, 0, 0, 1, 1,
0.5621181, -0.9163553, 2.322447, 0, 0, 0, 1, 1,
0.564525, 1.112966, 0.9073981, 0, 0, 0, 1, 1,
0.5645528, 0.937548, 2.670133, 0, 0, 0, 1, 1,
0.5682036, -1.282472, 3.824701, 0, 0, 0, 1, 1,
0.5701609, 1.015361, -0.1737131, 1, 1, 1, 1, 1,
0.5758373, -0.4935127, 2.649985, 1, 1, 1, 1, 1,
0.5798763, -0.8578634, 0.8152537, 1, 1, 1, 1, 1,
0.5818326, -1.26252, 2.59249, 1, 1, 1, 1, 1,
0.5849912, 1.549084, 1.485941, 1, 1, 1, 1, 1,
0.5928776, 0.6009402, 1.036052, 1, 1, 1, 1, 1,
0.5969726, 0.5277426, 1.070832, 1, 1, 1, 1, 1,
0.5969759, -0.6335409, 1.4483, 1, 1, 1, 1, 1,
0.6024228, 0.3115937, -0.1240341, 1, 1, 1, 1, 1,
0.6025279, -0.9764442, 1.216693, 1, 1, 1, 1, 1,
0.6076922, 0.08920463, 2.94384, 1, 1, 1, 1, 1,
0.6085607, -0.7493565, 0.9929771, 1, 1, 1, 1, 1,
0.6135265, 0.7433522, 1.05023, 1, 1, 1, 1, 1,
0.614686, 0.1798571, 2.583422, 1, 1, 1, 1, 1,
0.6150098, 1.905167, 0.2954934, 1, 1, 1, 1, 1,
0.6150983, 0.976545, -0.6966361, 0, 0, 1, 1, 1,
0.6227621, -0.8425711, -0.5402312, 1, 0, 0, 1, 1,
0.6242164, 0.69076, 0.6234738, 1, 0, 0, 1, 1,
0.6267751, 2.251631, -0.2671461, 1, 0, 0, 1, 1,
0.6309779, 2.695481, 3.0409, 1, 0, 0, 1, 1,
0.6321056, 0.09852803, 2.908411, 1, 0, 0, 1, 1,
0.6349767, -2.109011, 3.49036, 0, 0, 0, 1, 1,
0.6368871, 0.6296209, 2.200995, 0, 0, 0, 1, 1,
0.6371741, 2.677218, -1.068451, 0, 0, 0, 1, 1,
0.6403098, 1.336006, -0.1126695, 0, 0, 0, 1, 1,
0.6403457, -0.1900116, 1.624061, 0, 0, 0, 1, 1,
0.6411539, -0.7785924, 3.188382, 0, 0, 0, 1, 1,
0.6429026, 0.2235429, 1.409359, 0, 0, 0, 1, 1,
0.6431767, 0.3533469, 0.9412819, 1, 1, 1, 1, 1,
0.6439692, 0.4208039, 0.6266369, 1, 1, 1, 1, 1,
0.6463408, -0.177517, 2.191648, 1, 1, 1, 1, 1,
0.6471489, 0.8507802, -1.502888, 1, 1, 1, 1, 1,
0.6472955, 0.4036584, 0.7422435, 1, 1, 1, 1, 1,
0.6483471, 0.432333, -0.8814376, 1, 1, 1, 1, 1,
0.6506313, 0.852738, 0.2379672, 1, 1, 1, 1, 1,
0.6557847, -0.08686338, 2.275895, 1, 1, 1, 1, 1,
0.6646363, -0.3049893, 4.25881, 1, 1, 1, 1, 1,
0.6650115, 1.506793, -0.7051365, 1, 1, 1, 1, 1,
0.6665687, 0.9851727, 1.311054, 1, 1, 1, 1, 1,
0.6702076, -0.9038649, 3.817112, 1, 1, 1, 1, 1,
0.6730431, 1.001471, -0.8601297, 1, 1, 1, 1, 1,
0.6798006, -0.346353, 2.065639, 1, 1, 1, 1, 1,
0.6859748, 0.1981385, 0.6409811, 1, 1, 1, 1, 1,
0.687182, 2.904965, 1.882284, 0, 0, 1, 1, 1,
0.68789, 1.167202, 0.8505908, 1, 0, 0, 1, 1,
0.6879061, -2.144039, 1.66701, 1, 0, 0, 1, 1,
0.6883755, 0.3373637, 3.008965, 1, 0, 0, 1, 1,
0.6958784, -1.357883, 3.44203, 1, 0, 0, 1, 1,
0.698634, 0.2712514, 1.522709, 1, 0, 0, 1, 1,
0.699165, 1.201395, -0.02059451, 0, 0, 0, 1, 1,
0.7022612, 2.038558, 3.17182, 0, 0, 0, 1, 1,
0.7074903, 0.7798632, 0.4996478, 0, 0, 0, 1, 1,
0.7084752, -0.6405461, 2.44889, 0, 0, 0, 1, 1,
0.7187946, 1.945165, -0.2443947, 0, 0, 0, 1, 1,
0.7199258, 2.375673, 0.2328007, 0, 0, 0, 1, 1,
0.7249832, -1.075567, 1.361082, 0, 0, 0, 1, 1,
0.7261316, -0.3463204, 2.833181, 1, 1, 1, 1, 1,
0.7271761, -0.7716509, 2.687162, 1, 1, 1, 1, 1,
0.7309619, -0.4440192, 2.411397, 1, 1, 1, 1, 1,
0.7348282, 0.8731503, -0.2424208, 1, 1, 1, 1, 1,
0.7364597, 0.2459631, 2.534349, 1, 1, 1, 1, 1,
0.7364787, 0.1713175, 2.20232, 1, 1, 1, 1, 1,
0.7406347, 0.08040115, -0.387478, 1, 1, 1, 1, 1,
0.7429014, 0.2474107, 2.456129, 1, 1, 1, 1, 1,
0.745396, -1.265507, 2.223705, 1, 1, 1, 1, 1,
0.7477755, -1.603369, 1.105711, 1, 1, 1, 1, 1,
0.750871, -0.03361846, 1.85141, 1, 1, 1, 1, 1,
0.7509803, 0.4771786, 1.279668, 1, 1, 1, 1, 1,
0.756414, -0.6555282, 1.779514, 1, 1, 1, 1, 1,
0.7595278, -0.3700523, 2.289033, 1, 1, 1, 1, 1,
0.762906, 0.7060059, -0.266515, 1, 1, 1, 1, 1,
0.7635131, -0.2280968, 0.1964417, 0, 0, 1, 1, 1,
0.7676442, -0.9964196, 3.96244, 1, 0, 0, 1, 1,
0.7679025, -1.267927, 1.005874, 1, 0, 0, 1, 1,
0.7698752, 1.376317, 0.374665, 1, 0, 0, 1, 1,
0.7855194, -0.3221445, 0.6488221, 1, 0, 0, 1, 1,
0.8014167, 1.452192, 0.9285322, 1, 0, 0, 1, 1,
0.8022298, -0.6800676, 1.992264, 0, 0, 0, 1, 1,
0.807152, -0.7631038, 2.89881, 0, 0, 0, 1, 1,
0.8117231, -0.9177313, 3.047727, 0, 0, 0, 1, 1,
0.8204048, -0.1994565, 0.8920915, 0, 0, 0, 1, 1,
0.8227784, 1.740849, -1.199831, 0, 0, 0, 1, 1,
0.8283691, -1.903947, 2.593815, 0, 0, 0, 1, 1,
0.8288502, 0.5869057, 2.509943, 0, 0, 0, 1, 1,
0.8304737, -1.792297, 3.466497, 1, 1, 1, 1, 1,
0.8434806, -0.649975, 1.306316, 1, 1, 1, 1, 1,
0.8438332, 0.5138327, 0.3198711, 1, 1, 1, 1, 1,
0.8483324, -0.3148152, 3.50617, 1, 1, 1, 1, 1,
0.8530257, 2.406054, 0.3489005, 1, 1, 1, 1, 1,
0.8596281, -0.6074229, 2.450368, 1, 1, 1, 1, 1,
0.8614932, 2.16398, 0.002075333, 1, 1, 1, 1, 1,
0.8641495, 0.0424514, 3.222937, 1, 1, 1, 1, 1,
0.8798989, -1.021911, 4.466254, 1, 1, 1, 1, 1,
0.882682, -0.627507, 2.330917, 1, 1, 1, 1, 1,
0.8891266, 0.9215227, 3.104999, 1, 1, 1, 1, 1,
0.8941329, -0.8328642, 2.274928, 1, 1, 1, 1, 1,
0.8962198, 0.06138331, 1.58779, 1, 1, 1, 1, 1,
0.8962897, -0.620818, 2.371472, 1, 1, 1, 1, 1,
0.8973272, 2.996994, -0.4512505, 1, 1, 1, 1, 1,
0.8975625, -0.5339444, -0.360396, 0, 0, 1, 1, 1,
0.9004021, 1.404341, -0.9552798, 1, 0, 0, 1, 1,
0.901859, 0.2852168, 1.373551, 1, 0, 0, 1, 1,
0.9175614, 1.033219, 0.7865118, 1, 0, 0, 1, 1,
0.9181576, -0.3230346, 2.444582, 1, 0, 0, 1, 1,
0.9320616, -1.472713, 3.556209, 1, 0, 0, 1, 1,
0.9385685, 0.1735188, 0.3531573, 0, 0, 0, 1, 1,
0.9394307, -0.6063666, 4.09905, 0, 0, 0, 1, 1,
0.9397256, -0.6375158, -0.2667159, 0, 0, 0, 1, 1,
0.9398008, -0.7248273, 3.471229, 0, 0, 0, 1, 1,
0.9447007, 0.1999459, -0.1959094, 0, 0, 0, 1, 1,
0.947975, 1.154741, 1.482069, 0, 0, 0, 1, 1,
0.9567307, -1.576472, 3.293238, 0, 0, 0, 1, 1,
0.9583685, -0.2999388, 2.850168, 1, 1, 1, 1, 1,
0.9625045, 1.468283, 0.246334, 1, 1, 1, 1, 1,
0.9662405, 1.808768, 1.640342, 1, 1, 1, 1, 1,
0.9680855, -1.269157, 3.21355, 1, 1, 1, 1, 1,
0.9879822, -0.3634172, 1.627482, 1, 1, 1, 1, 1,
0.9902359, -1.092492, 3.103285, 1, 1, 1, 1, 1,
0.9955459, 0.2810014, 1.296578, 1, 1, 1, 1, 1,
0.9972669, -0.071366, 0.8573056, 1, 1, 1, 1, 1,
1.007304, 0.758094, -1.431116, 1, 1, 1, 1, 1,
1.012779, -0.5415537, 0.5234134, 1, 1, 1, 1, 1,
1.015038, 1.015961, 1.049525, 1, 1, 1, 1, 1,
1.015208, -1.208441, 2.980509, 1, 1, 1, 1, 1,
1.02639, -0.6008015, 0.6997925, 1, 1, 1, 1, 1,
1.026594, 0.4015519, 1.065934, 1, 1, 1, 1, 1,
1.030748, -0.325048, 1.584389, 1, 1, 1, 1, 1,
1.034187, 0.2677769, 0.5999113, 0, 0, 1, 1, 1,
1.035187, 1.734072, 2.840387, 1, 0, 0, 1, 1,
1.047964, 0.8703104, 1.804848, 1, 0, 0, 1, 1,
1.061261, -0.3317155, 1.589119, 1, 0, 0, 1, 1,
1.064468, 0.2115246, 0.4652702, 1, 0, 0, 1, 1,
1.064527, 1.187509, 0.5771345, 1, 0, 0, 1, 1,
1.071486, -1.845394, 2.856567, 0, 0, 0, 1, 1,
1.072262, 0.4604482, 3.526696, 0, 0, 0, 1, 1,
1.074257, -0.422402, 1.222279, 0, 0, 0, 1, 1,
1.078491, 1.517867, 1.060465, 0, 0, 0, 1, 1,
1.090418, 0.3415081, 1.854669, 0, 0, 0, 1, 1,
1.094041, 0.7976723, 1.508361, 0, 0, 0, 1, 1,
1.098384, -0.1452641, 2.253278, 0, 0, 0, 1, 1,
1.101991, 1.594311, 1.863144, 1, 1, 1, 1, 1,
1.113716, 1.34304, -1.108622, 1, 1, 1, 1, 1,
1.12075, 0.8251006, 2.614083, 1, 1, 1, 1, 1,
1.126447, 0.1733047, 0.3466225, 1, 1, 1, 1, 1,
1.131212, -0.4318584, 4.890954, 1, 1, 1, 1, 1,
1.132604, -1.471125, 1.399067, 1, 1, 1, 1, 1,
1.133128, -0.3186953, 0.6664934, 1, 1, 1, 1, 1,
1.137124, -1.344838, 2.060893, 1, 1, 1, 1, 1,
1.143546, -0.6122786, 0.8639801, 1, 1, 1, 1, 1,
1.151071, 0.7245202, 0.8865774, 1, 1, 1, 1, 1,
1.159794, 1.114602, 0.6070819, 1, 1, 1, 1, 1,
1.164031, -1.031616, 1.599216, 1, 1, 1, 1, 1,
1.17303, 0.4490318, 1.988234, 1, 1, 1, 1, 1,
1.179775, 1.359498, 0.2424931, 1, 1, 1, 1, 1,
1.194254, 1.705895, 0.7835286, 1, 1, 1, 1, 1,
1.197889, -0.888194, 3.147576, 0, 0, 1, 1, 1,
1.201611, 0.7030298, 1.530156, 1, 0, 0, 1, 1,
1.211086, -0.059886, 3.36754, 1, 0, 0, 1, 1,
1.216927, -1.170608, 2.37959, 1, 0, 0, 1, 1,
1.220349, 0.4125658, -0.1185035, 1, 0, 0, 1, 1,
1.231991, -0.4862495, 2.42198, 1, 0, 0, 1, 1,
1.245828, 0.5383611, 2.003544, 0, 0, 0, 1, 1,
1.248645, 1.705967, -0.9825697, 0, 0, 0, 1, 1,
1.250988, 0.1656481, 0.3029793, 0, 0, 0, 1, 1,
1.257832, -0.3437227, 2.665695, 0, 0, 0, 1, 1,
1.266733, -0.1005238, 0.8410868, 0, 0, 0, 1, 1,
1.282204, -1.793906, 0.3201516, 0, 0, 0, 1, 1,
1.286384, 1.708764, 0.7801238, 0, 0, 0, 1, 1,
1.303316, -0.5281531, 3.417068, 1, 1, 1, 1, 1,
1.307986, 0.197492, -0.3067166, 1, 1, 1, 1, 1,
1.327703, 0.136493, 0.6699498, 1, 1, 1, 1, 1,
1.32979, -1.43737, 3.01537, 1, 1, 1, 1, 1,
1.331656, 0.2882361, 2.012563, 1, 1, 1, 1, 1,
1.332119, 0.878055, 0.6189368, 1, 1, 1, 1, 1,
1.332137, -0.5514879, 3.00861, 1, 1, 1, 1, 1,
1.337699, 0.7944292, -0.1083217, 1, 1, 1, 1, 1,
1.339413, 1.9524, -0.04840133, 1, 1, 1, 1, 1,
1.341737, -1.660569, 1.795785, 1, 1, 1, 1, 1,
1.350198, -1.23604, 2.452629, 1, 1, 1, 1, 1,
1.368704, -0.6850486, 1.242091, 1, 1, 1, 1, 1,
1.376322, -0.2041557, 0.9485259, 1, 1, 1, 1, 1,
1.378688, 1.023083, 0.8395808, 1, 1, 1, 1, 1,
1.382907, -2.008297, 1.038077, 1, 1, 1, 1, 1,
1.397862, 1.18111, -0.07939968, 0, 0, 1, 1, 1,
1.399503, -1.424319, 2.418081, 1, 0, 0, 1, 1,
1.434414, 2.071781, -1.382194, 1, 0, 0, 1, 1,
1.447081, -0.5821924, 3.412977, 1, 0, 0, 1, 1,
1.474208, 0.1613673, 1.783429, 1, 0, 0, 1, 1,
1.477553, -1.282452, 1.567313, 1, 0, 0, 1, 1,
1.48226, 0.6706926, 3.635614, 0, 0, 0, 1, 1,
1.483708, -0.4102023, 1.545399, 0, 0, 0, 1, 1,
1.501663, 0.1252781, 0.9662665, 0, 0, 0, 1, 1,
1.50744, -0.20492, 1.107247, 0, 0, 0, 1, 1,
1.515867, 0.3767466, 2.935533, 0, 0, 0, 1, 1,
1.523272, 0.4847079, 0.9665134, 0, 0, 0, 1, 1,
1.526794, 1.037977, 1.605773, 0, 0, 0, 1, 1,
1.528377, 0.0589968, 1.334888, 1, 1, 1, 1, 1,
1.536976, -1.361293, 1.617233, 1, 1, 1, 1, 1,
1.541111, -0.6230419, 3.868952, 1, 1, 1, 1, 1,
1.543337, -0.9099566, 1.0239, 1, 1, 1, 1, 1,
1.548468, 0.8525447, 0.7407371, 1, 1, 1, 1, 1,
1.551934, 0.637503, 0.4776099, 1, 1, 1, 1, 1,
1.563879, 1.156007, 2.294751, 1, 1, 1, 1, 1,
1.575694, 1.140218, 1.823702, 1, 1, 1, 1, 1,
1.590999, -0.8252901, 1.449569, 1, 1, 1, 1, 1,
1.648582, -0.3688962, 1.326502, 1, 1, 1, 1, 1,
1.658069, 1.579597, 0.7534966, 1, 1, 1, 1, 1,
1.66731, 0.6230329, 2.49092, 1, 1, 1, 1, 1,
1.668345, 0.2921841, 2.506714, 1, 1, 1, 1, 1,
1.67534, -0.2060855, 0.1639341, 1, 1, 1, 1, 1,
1.688802, -1.578122, 2.501517, 1, 1, 1, 1, 1,
1.695665, 0.859954, 1.411684, 0, 0, 1, 1, 1,
1.697284, 1.762169, -0.9127129, 1, 0, 0, 1, 1,
1.70025, -1.476277, 3.099393, 1, 0, 0, 1, 1,
1.704787, -0.1162248, 1.102493, 1, 0, 0, 1, 1,
1.712631, -0.3132636, 2.73663, 1, 0, 0, 1, 1,
1.716295, -0.4634591, 0.9768072, 1, 0, 0, 1, 1,
1.716634, 0.2178737, 1.767789, 0, 0, 0, 1, 1,
1.735011, -0.9234102, 1.403002, 0, 0, 0, 1, 1,
1.756174, 0.08934605, 1.507186, 0, 0, 0, 1, 1,
1.773161, 0.9124807, 1.057366, 0, 0, 0, 1, 1,
1.773987, -0.1989535, 0.8492287, 0, 0, 0, 1, 1,
1.775939, 0.2203799, 1.143078, 0, 0, 0, 1, 1,
1.778231, -1.551574, 1.293575, 0, 0, 0, 1, 1,
1.787901, -0.8880101, 3.064256, 1, 1, 1, 1, 1,
1.790266, -0.06344534, 1.789863, 1, 1, 1, 1, 1,
1.801247, -0.4305673, -0.6278474, 1, 1, 1, 1, 1,
1.802278, 0.76168, 0.1050119, 1, 1, 1, 1, 1,
1.819315, -0.2447411, 3.007821, 1, 1, 1, 1, 1,
1.866624, -0.08277477, -0.2116507, 1, 1, 1, 1, 1,
1.878866, -0.1234872, 0.4683657, 1, 1, 1, 1, 1,
1.906496, -0.400215, 0.6025774, 1, 1, 1, 1, 1,
1.921103, 0.1168648, 1.870533, 1, 1, 1, 1, 1,
1.923197, 0.6207108, 0.3613586, 1, 1, 1, 1, 1,
1.960584, 0.1870686, 3.796894, 1, 1, 1, 1, 1,
1.980954, -0.7428495, 1.894261, 1, 1, 1, 1, 1,
2.06093, 2.02856, 2.237102, 1, 1, 1, 1, 1,
2.082426, -0.7879899, 1.585922, 1, 1, 1, 1, 1,
2.100305, -0.2025803, 1.262263, 1, 1, 1, 1, 1,
2.150009, 0.1474213, 0.3481482, 0, 0, 1, 1, 1,
2.184186, 0.8151714, 1.023419, 1, 0, 0, 1, 1,
2.189013, -0.8430551, 3.206093, 1, 0, 0, 1, 1,
2.215412, 0.9135517, 0.9508952, 1, 0, 0, 1, 1,
2.23275, -0.02724508, 1.86828, 1, 0, 0, 1, 1,
2.235217, -1.449308, 3.403807, 1, 0, 0, 1, 1,
2.289654, 0.6668797, 1.094981, 0, 0, 0, 1, 1,
2.312985, 1.379379, 1.920116, 0, 0, 0, 1, 1,
2.330093, 1.077872, 1.911528, 0, 0, 0, 1, 1,
2.344154, -1.388486, 1.668879, 0, 0, 0, 1, 1,
2.357243, 1.006642, 0.5768285, 0, 0, 0, 1, 1,
2.375103, 0.2075911, 2.19716, 0, 0, 0, 1, 1,
2.447481, -1.426873, 1.061335, 0, 0, 0, 1, 1,
2.449332, 0.6762665, 0.9744719, 1, 1, 1, 1, 1,
2.473687, 0.1508777, 0.971467, 1, 1, 1, 1, 1,
2.54711, -1.590491, 0.6918685, 1, 1, 1, 1, 1,
2.625639, -0.4849924, 2.193921, 1, 1, 1, 1, 1,
2.660868, -0.9433539, 2.108065, 1, 1, 1, 1, 1,
2.989892, -0.2575659, 2.216518, 1, 1, 1, 1, 1,
3.867528, 0.1821414, 1.048998, 1, 1, 1, 1, 1
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
var radius = 10.10365;
var distance = 35.48865;
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
mvMatrix.translate( 0.120225, -0.2093487, -0.2900834 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.48865);
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
