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
-3.791184, 0.1416526, -1.59063, 1, 0, 0, 1,
-3.438361, 0.7985022, -2.098253, 1, 0.007843138, 0, 1,
-3.061396, 0.3698831, -0.8815358, 1, 0.01176471, 0, 1,
-2.964539, 0.2387604, -1.875941, 1, 0.01960784, 0, 1,
-2.952444, 0.8345029, -2.286649, 1, 0.02352941, 0, 1,
-2.913191, 1.323352, -0.9733438, 1, 0.03137255, 0, 1,
-2.874218, 0.3801782, -2.137449, 1, 0.03529412, 0, 1,
-2.537082, 0.4076838, -1.286889, 1, 0.04313726, 0, 1,
-2.536814, 0.364841, -1.291764, 1, 0.04705882, 0, 1,
-2.526828, -1.573108, -0.3184389, 1, 0.05490196, 0, 1,
-2.510721, 0.8544461, -1.070952, 1, 0.05882353, 0, 1,
-2.499692, -0.1479206, -2.368676, 1, 0.06666667, 0, 1,
-2.386807, 0.5136396, -0.7183796, 1, 0.07058824, 0, 1,
-2.371467, 1.674468, -2.182513, 1, 0.07843138, 0, 1,
-2.35506, -0.9328167, -3.334664, 1, 0.08235294, 0, 1,
-2.229648, -1.045641, -2.925383, 1, 0.09019608, 0, 1,
-2.190732, -0.2257112, -2.333341, 1, 0.09411765, 0, 1,
-2.180038, 1.060976, -0.8033473, 1, 0.1019608, 0, 1,
-2.169627, -1.318804, -3.092633, 1, 0.1098039, 0, 1,
-2.154354, -0.5039877, -2.420342, 1, 0.1137255, 0, 1,
-2.138659, 1.103813, -0.7108394, 1, 0.1215686, 0, 1,
-2.098766, 0.3423169, 0.8754899, 1, 0.1254902, 0, 1,
-2.094347, 0.06819113, -0.6244326, 1, 0.1333333, 0, 1,
-2.081944, -0.3844697, -3.449493, 1, 0.1372549, 0, 1,
-2.075855, 0.984201, -0.9920095, 1, 0.145098, 0, 1,
-2.074145, -0.1438056, -0.9588636, 1, 0.1490196, 0, 1,
-2.036595, 0.2292224, -0.6555027, 1, 0.1568628, 0, 1,
-2.029116, -0.1035274, -1.954578, 1, 0.1607843, 0, 1,
-2.028262, 0.4832011, 0.5288988, 1, 0.1686275, 0, 1,
-1.992803, -1.326812, -1.651846, 1, 0.172549, 0, 1,
-1.99249, 1.083323, -1.924133, 1, 0.1803922, 0, 1,
-1.979546, -1.475297, -3.235427, 1, 0.1843137, 0, 1,
-1.973115, -0.3473257, -1.684755, 1, 0.1921569, 0, 1,
-1.94211, 0.2782988, -1.336485, 1, 0.1960784, 0, 1,
-1.897178, 1.584386, -2.280035, 1, 0.2039216, 0, 1,
-1.880757, 0.5945682, -0.1178778, 1, 0.2117647, 0, 1,
-1.871472, -0.4629592, -1.880504, 1, 0.2156863, 0, 1,
-1.871361, -1.092698, -1.308334, 1, 0.2235294, 0, 1,
-1.843861, 0.04986388, -2.195302, 1, 0.227451, 0, 1,
-1.828453, 0.2676083, -1.762907, 1, 0.2352941, 0, 1,
-1.776006, -1.295676, -3.291365, 1, 0.2392157, 0, 1,
-1.753446, 0.9377727, 1.025464, 1, 0.2470588, 0, 1,
-1.745349, -0.7241837, -3.001776, 1, 0.2509804, 0, 1,
-1.736324, 0.4528592, -1.869582, 1, 0.2588235, 0, 1,
-1.710943, 0.6611924, -0.2991495, 1, 0.2627451, 0, 1,
-1.687987, 0.6386344, -0.7425932, 1, 0.2705882, 0, 1,
-1.679271, -0.4948457, -2.575636, 1, 0.2745098, 0, 1,
-1.668905, 0.1552103, -2.029986, 1, 0.282353, 0, 1,
-1.663801, -0.3177591, -2.440253, 1, 0.2862745, 0, 1,
-1.66056, -0.2873542, -1.22284, 1, 0.2941177, 0, 1,
-1.657942, -1.31429, -0.9556231, 1, 0.3019608, 0, 1,
-1.65668, -0.1177775, 0.3103474, 1, 0.3058824, 0, 1,
-1.655633, -1.027688, -2.661474, 1, 0.3137255, 0, 1,
-1.650568, 0.1841958, 0.4146992, 1, 0.3176471, 0, 1,
-1.643133, 0.6539975, -0.07152647, 1, 0.3254902, 0, 1,
-1.631355, 0.9427429, -0.9629096, 1, 0.3294118, 0, 1,
-1.62542, -0.2331179, -2.454529, 1, 0.3372549, 0, 1,
-1.60854, -0.863575, -2.968302, 1, 0.3411765, 0, 1,
-1.567552, 0.2176528, 0.1861136, 1, 0.3490196, 0, 1,
-1.560245, 0.6520385, -1.905787, 1, 0.3529412, 0, 1,
-1.544351, 0.5423129, -0.5716846, 1, 0.3607843, 0, 1,
-1.543655, -0.5570216, -1.640882, 1, 0.3647059, 0, 1,
-1.533232, -0.0131381, 0.2045833, 1, 0.372549, 0, 1,
-1.532237, -0.005277317, -0.3452251, 1, 0.3764706, 0, 1,
-1.526426, 0.01068631, -2.986798, 1, 0.3843137, 0, 1,
-1.524919, 0.7575493, 0.2814301, 1, 0.3882353, 0, 1,
-1.508686, 0.9313087, -0.2090009, 1, 0.3960784, 0, 1,
-1.503384, -0.5775956, -1.780042, 1, 0.4039216, 0, 1,
-1.481164, -1.170935, -2.796023, 1, 0.4078431, 0, 1,
-1.478687, 1.252937, -0.821684, 1, 0.4156863, 0, 1,
-1.435017, 0.3580711, -0.7588077, 1, 0.4196078, 0, 1,
-1.424464, -0.05551598, -1.676067, 1, 0.427451, 0, 1,
-1.421339, 0.6054712, -0.4187471, 1, 0.4313726, 0, 1,
-1.419552, -2.469314, -2.623577, 1, 0.4392157, 0, 1,
-1.413473, -0.3474532, -2.448902, 1, 0.4431373, 0, 1,
-1.407758, 0.6407967, -2.551045, 1, 0.4509804, 0, 1,
-1.396946, 2.173925, -3.33584, 1, 0.454902, 0, 1,
-1.390823, -0.7116389, -2.795722, 1, 0.4627451, 0, 1,
-1.382646, 0.3752428, -0.8589997, 1, 0.4666667, 0, 1,
-1.372842, -0.5706822, -2.00994, 1, 0.4745098, 0, 1,
-1.372474, 0.2276496, -3.882959, 1, 0.4784314, 0, 1,
-1.369101, 0.7418504, -2.086374, 1, 0.4862745, 0, 1,
-1.366779, -0.3623594, -2.802734, 1, 0.4901961, 0, 1,
-1.365124, -1.564443, -2.061005, 1, 0.4980392, 0, 1,
-1.324177, 0.03929972, -2.357854, 1, 0.5058824, 0, 1,
-1.317346, -1.795815, -2.11254, 1, 0.509804, 0, 1,
-1.308313, -0.5525688, -2.62027, 1, 0.5176471, 0, 1,
-1.305551, 0.506756, -1.274735, 1, 0.5215687, 0, 1,
-1.304381, 0.4015294, -1.990964, 1, 0.5294118, 0, 1,
-1.302266, 1.020696, 0.009979131, 1, 0.5333334, 0, 1,
-1.295707, -0.8837011, -2.283102, 1, 0.5411765, 0, 1,
-1.292081, -1.238941, -2.909214, 1, 0.5450981, 0, 1,
-1.287263, 0.05264505, -1.905202, 1, 0.5529412, 0, 1,
-1.286474, 0.2311094, -0.2317088, 1, 0.5568628, 0, 1,
-1.281987, -0.2529013, -1.059022, 1, 0.5647059, 0, 1,
-1.278093, -0.8320848, -1.337393, 1, 0.5686275, 0, 1,
-1.274276, 2.048773, -2.22689, 1, 0.5764706, 0, 1,
-1.253027, 0.903653, -0.9532546, 1, 0.5803922, 0, 1,
-1.251251, 1.187858, -0.941226, 1, 0.5882353, 0, 1,
-1.250533, -0.414786, -2.991818, 1, 0.5921569, 0, 1,
-1.250096, 1.052025, -1.603754, 1, 0.6, 0, 1,
-1.239848, 0.6878224, -0.5345443, 1, 0.6078432, 0, 1,
-1.234131, -1.162534, -2.149958, 1, 0.6117647, 0, 1,
-1.229381, 0.6917139, -0.7947263, 1, 0.6196079, 0, 1,
-1.226031, 0.1671516, -1.519494, 1, 0.6235294, 0, 1,
-1.220925, -0.1417366, -1.631796, 1, 0.6313726, 0, 1,
-1.218063, -0.9640206, -2.077806, 1, 0.6352941, 0, 1,
-1.217251, 1.448607, -0.4619044, 1, 0.6431373, 0, 1,
-1.214523, -0.6370952, -1.086465, 1, 0.6470588, 0, 1,
-1.202417, -0.4840821, -4.249152, 1, 0.654902, 0, 1,
-1.196731, -0.0774391, -0.3910079, 1, 0.6588235, 0, 1,
-1.193483, 0.6135986, 0.9162617, 1, 0.6666667, 0, 1,
-1.192721, 0.1145426, -2.879681, 1, 0.6705883, 0, 1,
-1.190964, 1.002473, -0.8212072, 1, 0.6784314, 0, 1,
-1.172091, 0.06408602, -1.463069, 1, 0.682353, 0, 1,
-1.170428, -2.370117, -0.5469685, 1, 0.6901961, 0, 1,
-1.160321, 0.1867521, -1.838555, 1, 0.6941177, 0, 1,
-1.153277, -0.3232709, -3.849718, 1, 0.7019608, 0, 1,
-1.141641, -0.06761508, -2.457605, 1, 0.7098039, 0, 1,
-1.133108, 1.139978, -2.251848, 1, 0.7137255, 0, 1,
-1.132717, -1.048772, -2.548117, 1, 0.7215686, 0, 1,
-1.130607, -0.8645946, -0.5715284, 1, 0.7254902, 0, 1,
-1.121753, -0.9566935, -2.323236, 1, 0.7333333, 0, 1,
-1.100857, 0.2494286, -1.051597, 1, 0.7372549, 0, 1,
-1.09239, -1.488445, -1.835264, 1, 0.7450981, 0, 1,
-1.085526, 0.6459976, -1.059907, 1, 0.7490196, 0, 1,
-1.080865, -1.52294, -1.800602, 1, 0.7568628, 0, 1,
-1.079489, -1.551852, -4.234492, 1, 0.7607843, 0, 1,
-1.078549, 0.2573037, -2.178477, 1, 0.7686275, 0, 1,
-1.074696, 1.340552, -0.2451284, 1, 0.772549, 0, 1,
-1.064488, 1.229716, -1.051239, 1, 0.7803922, 0, 1,
-1.060742, 0.3594438, 0.358399, 1, 0.7843137, 0, 1,
-1.058251, -0.03827637, -2.061834, 1, 0.7921569, 0, 1,
-1.05677, 0.05492313, -2.126246, 1, 0.7960784, 0, 1,
-1.052145, 1.558705, 1.027013, 1, 0.8039216, 0, 1,
-1.051789, -0.4075789, -2.434778, 1, 0.8117647, 0, 1,
-1.045489, 0.1113159, -2.863973, 1, 0.8156863, 0, 1,
-1.043282, -1.302752, -2.240529, 1, 0.8235294, 0, 1,
-1.042374, -0.6141873, -1.281152, 1, 0.827451, 0, 1,
-1.041602, -0.3912939, -1.439223, 1, 0.8352941, 0, 1,
-1.039476, -0.8082821, -2.212259, 1, 0.8392157, 0, 1,
-1.036036, -0.3427168, -1.079902, 1, 0.8470588, 0, 1,
-1.019374, -1.412667, -4.426323, 1, 0.8509804, 0, 1,
-1.015074, 0.2941161, -3.374546, 1, 0.8588235, 0, 1,
-1.012791, -1.14642, -2.704448, 1, 0.8627451, 0, 1,
-1.010024, 0.07921851, -1.538604, 1, 0.8705882, 0, 1,
-1.007871, -0.846554, -2.060144, 1, 0.8745098, 0, 1,
-0.9932498, 1.233237, -0.09918743, 1, 0.8823529, 0, 1,
-0.9928778, -1.419035, -2.197263, 1, 0.8862745, 0, 1,
-0.992533, 0.5040716, -0.7219876, 1, 0.8941177, 0, 1,
-0.9879379, 0.7474552, -1.005426, 1, 0.8980392, 0, 1,
-0.9842312, -1.515868, -3.93422, 1, 0.9058824, 0, 1,
-0.9827629, 0.5109387, 0.0871256, 1, 0.9137255, 0, 1,
-0.9789256, 0.1989869, -0.3955969, 1, 0.9176471, 0, 1,
-0.9745603, 0.4104837, -0.9417645, 1, 0.9254902, 0, 1,
-0.9706273, 0.9278958, 0.216621, 1, 0.9294118, 0, 1,
-0.9678251, -0.3307592, -0.777668, 1, 0.9372549, 0, 1,
-0.9643115, -0.7024379, -0.7316667, 1, 0.9411765, 0, 1,
-0.951678, -0.07219777, -3.1061, 1, 0.9490196, 0, 1,
-0.9501832, 0.2813312, -1.319799, 1, 0.9529412, 0, 1,
-0.944752, 0.3982807, -0.5087202, 1, 0.9607843, 0, 1,
-0.9380757, 0.3923068, -2.213104, 1, 0.9647059, 0, 1,
-0.9370782, 0.4719233, -3.117538, 1, 0.972549, 0, 1,
-0.9355212, 1.367965, -1.888556, 1, 0.9764706, 0, 1,
-0.9260143, -0.4529819, -2.542685, 1, 0.9843137, 0, 1,
-0.9259458, -0.1564651, -0.7960535, 1, 0.9882353, 0, 1,
-0.9237563, -0.3445251, -0.1996609, 1, 0.9960784, 0, 1,
-0.9218895, -0.5335284, -1.879208, 0.9960784, 1, 0, 1,
-0.9209067, 0.179433, -3.147984, 0.9921569, 1, 0, 1,
-0.9111906, -0.2892934, -3.284764, 0.9843137, 1, 0, 1,
-0.9063939, -0.03290268, -1.994924, 0.9803922, 1, 0, 1,
-0.906276, -0.02431899, -1.048974, 0.972549, 1, 0, 1,
-0.9044336, -0.3171816, -1.751272, 0.9686275, 1, 0, 1,
-0.903052, 0.175658, -1.532551, 0.9607843, 1, 0, 1,
-0.8992418, 0.1951811, -1.632993, 0.9568627, 1, 0, 1,
-0.8969077, -0.6293271, -1.151726, 0.9490196, 1, 0, 1,
-0.8941613, 0.5592557, -0.4200535, 0.945098, 1, 0, 1,
-0.8905249, -2.075029, -4.85767, 0.9372549, 1, 0, 1,
-0.8878605, 0.9927462, -0.4282609, 0.9333333, 1, 0, 1,
-0.8866704, -0.4801321, -1.261697, 0.9254902, 1, 0, 1,
-0.8841653, -0.7625253, -2.875865, 0.9215686, 1, 0, 1,
-0.884151, 0.09108897, -2.507128, 0.9137255, 1, 0, 1,
-0.8745911, 0.1996035, -3.602688, 0.9098039, 1, 0, 1,
-0.8743942, 0.7294828, -0.369365, 0.9019608, 1, 0, 1,
-0.871051, -0.1924745, -1.874323, 0.8941177, 1, 0, 1,
-0.8686943, -0.2818535, -0.875599, 0.8901961, 1, 0, 1,
-0.8678134, 0.6211833, -0.1958853, 0.8823529, 1, 0, 1,
-0.8670076, -0.2929641, -1.757372, 0.8784314, 1, 0, 1,
-0.8637756, 0.5840315, -0.3910071, 0.8705882, 1, 0, 1,
-0.86372, -2.065475, -4.005475, 0.8666667, 1, 0, 1,
-0.8600574, -0.5843767, -2.649964, 0.8588235, 1, 0, 1,
-0.8573284, 0.1658673, -1.264827, 0.854902, 1, 0, 1,
-0.854844, 0.6778291, -1.724262, 0.8470588, 1, 0, 1,
-0.8533119, -0.01146433, -1.466923, 0.8431373, 1, 0, 1,
-0.8510561, 0.4739855, -1.43958, 0.8352941, 1, 0, 1,
-0.8504381, 1.259403, -3.084611, 0.8313726, 1, 0, 1,
-0.8473773, 0.0618571, 0.0521188, 0.8235294, 1, 0, 1,
-0.8447902, -0.294414, -0.6965963, 0.8196079, 1, 0, 1,
-0.834888, 0.6544476, -1.116269, 0.8117647, 1, 0, 1,
-0.8327076, 1.169636, -2.397122, 0.8078431, 1, 0, 1,
-0.8306762, -1.352838, -2.23554, 0.8, 1, 0, 1,
-0.8286821, 0.6867599, -0.5535253, 0.7921569, 1, 0, 1,
-0.826348, -0.4758963, -1.604799, 0.7882353, 1, 0, 1,
-0.8191399, -0.5320768, -3.05737, 0.7803922, 1, 0, 1,
-0.8190695, 3.041317, -0.8319637, 0.7764706, 1, 0, 1,
-0.8156773, 0.3324921, -1.840274, 0.7686275, 1, 0, 1,
-0.8048003, 1.063923, -0.1260312, 0.7647059, 1, 0, 1,
-0.7948777, -0.9599631, -2.731894, 0.7568628, 1, 0, 1,
-0.7937923, 0.8783231, -3.130979, 0.7529412, 1, 0, 1,
-0.7907631, -0.2675967, -1.813604, 0.7450981, 1, 0, 1,
-0.7904228, 0.07132794, -0.2704191, 0.7411765, 1, 0, 1,
-0.7903137, 1.585643, -0.8021536, 0.7333333, 1, 0, 1,
-0.789471, -1.093426, -3.026336, 0.7294118, 1, 0, 1,
-0.7869279, 0.04785808, -2.451941, 0.7215686, 1, 0, 1,
-0.7835434, -0.6179954, -2.186417, 0.7176471, 1, 0, 1,
-0.7800649, 0.2380104, -2.076338, 0.7098039, 1, 0, 1,
-0.7799169, 0.8002834, -2.921133, 0.7058824, 1, 0, 1,
-0.7793313, 0.256521, -1.168366, 0.6980392, 1, 0, 1,
-0.7787121, 0.02807373, -1.705767, 0.6901961, 1, 0, 1,
-0.7777946, 0.4262727, -1.471386, 0.6862745, 1, 0, 1,
-0.7750531, -0.2789075, -1.663478, 0.6784314, 1, 0, 1,
-0.7646798, 1.325251, 0.2897901, 0.6745098, 1, 0, 1,
-0.7555312, 0.1946687, -1.568216, 0.6666667, 1, 0, 1,
-0.7552751, 0.3404374, -0.325876, 0.6627451, 1, 0, 1,
-0.7530321, 1.371976, 0.04916077, 0.654902, 1, 0, 1,
-0.7516736, 0.5744833, 0.8379728, 0.6509804, 1, 0, 1,
-0.7494878, -0.9446527, -1.377656, 0.6431373, 1, 0, 1,
-0.7490683, -0.6446013, -2.943849, 0.6392157, 1, 0, 1,
-0.7446805, -0.8932119, -3.798209, 0.6313726, 1, 0, 1,
-0.7330108, 1.668737, 0.601392, 0.627451, 1, 0, 1,
-0.7254753, 0.1166015, -2.764066, 0.6196079, 1, 0, 1,
-0.7216141, -0.8000233, -2.129058, 0.6156863, 1, 0, 1,
-0.7189234, 1.382705, 1.311731, 0.6078432, 1, 0, 1,
-0.7184755, -1.501346, -2.176739, 0.6039216, 1, 0, 1,
-0.7168475, 0.2843548, -0.6391784, 0.5960785, 1, 0, 1,
-0.7147307, 0.1693356, -2.93847, 0.5882353, 1, 0, 1,
-0.7103275, 0.9197335, -1.235986, 0.5843138, 1, 0, 1,
-0.707216, -1.781364, -2.511755, 0.5764706, 1, 0, 1,
-0.7037084, 0.6235116, -0.6451923, 0.572549, 1, 0, 1,
-0.6985359, -1.670677, -0.3629847, 0.5647059, 1, 0, 1,
-0.6948311, -0.1551565, -2.269331, 0.5607843, 1, 0, 1,
-0.6931785, 0.8488498, 0.3311373, 0.5529412, 1, 0, 1,
-0.6864499, 0.6656076, -0.3399127, 0.5490196, 1, 0, 1,
-0.6848813, 0.9067962, -0.7616206, 0.5411765, 1, 0, 1,
-0.6754104, -0.4229493, -2.055021, 0.5372549, 1, 0, 1,
-0.6753235, -1.780502, -2.146594, 0.5294118, 1, 0, 1,
-0.6731781, -1.135646, -1.896047, 0.5254902, 1, 0, 1,
-0.6731068, 1.035016, -0.6693755, 0.5176471, 1, 0, 1,
-0.6667895, -0.591633, -3.392667, 0.5137255, 1, 0, 1,
-0.662012, -0.3947563, -2.223059, 0.5058824, 1, 0, 1,
-0.6556309, -0.7074671, -3.900262, 0.5019608, 1, 0, 1,
-0.6550249, -0.222442, -2.608603, 0.4941176, 1, 0, 1,
-0.6547961, -0.4941883, -1.695669, 0.4862745, 1, 0, 1,
-0.6532204, -0.7575084, -2.670122, 0.4823529, 1, 0, 1,
-0.6498543, 0.4488642, -2.646683, 0.4745098, 1, 0, 1,
-0.6476319, -2.562584, -3.643478, 0.4705882, 1, 0, 1,
-0.6461803, 0.9249664, 1.113526, 0.4627451, 1, 0, 1,
-0.6446329, 0.5128699, -1.621108, 0.4588235, 1, 0, 1,
-0.6402227, -0.7760606, -3.154605, 0.4509804, 1, 0, 1,
-0.6390585, 2.491973, -0.1384364, 0.4470588, 1, 0, 1,
-0.6384968, -0.1173953, -1.096438, 0.4392157, 1, 0, 1,
-0.6384178, -0.2660007, -2.091237, 0.4352941, 1, 0, 1,
-0.6380532, 0.3945534, -1.354583, 0.427451, 1, 0, 1,
-0.6373765, 1.076843, -1.291996, 0.4235294, 1, 0, 1,
-0.6293057, 1.420929, -0.4496545, 0.4156863, 1, 0, 1,
-0.6286423, -1.760814, -3.001533, 0.4117647, 1, 0, 1,
-0.6200779, 0.9917449, -0.65591, 0.4039216, 1, 0, 1,
-0.6121456, 0.4372621, -0.8020331, 0.3960784, 1, 0, 1,
-0.6070322, 0.3227676, -2.883318, 0.3921569, 1, 0, 1,
-0.5995361, 0.7982661, 1.739611, 0.3843137, 1, 0, 1,
-0.5981856, 0.6441531, -0.17664, 0.3803922, 1, 0, 1,
-0.594212, 1.138205, 0.09054104, 0.372549, 1, 0, 1,
-0.5904521, 1.46445, -0.2035876, 0.3686275, 1, 0, 1,
-0.5898961, -0.6074107, -2.890275, 0.3607843, 1, 0, 1,
-0.5890829, 0.9728001, -0.6255469, 0.3568628, 1, 0, 1,
-0.588892, 1.476249, -1.386548, 0.3490196, 1, 0, 1,
-0.5880718, -0.7545726, -3.172928, 0.345098, 1, 0, 1,
-0.5844465, -0.6235495, -0.7839365, 0.3372549, 1, 0, 1,
-0.5831171, 0.2228939, -0.7811047, 0.3333333, 1, 0, 1,
-0.5816343, -0.9878114, -1.955457, 0.3254902, 1, 0, 1,
-0.5803012, 0.2796564, -0.8024646, 0.3215686, 1, 0, 1,
-0.5799046, 0.3201977, -0.3561998, 0.3137255, 1, 0, 1,
-0.5781597, 0.9602526, -1.222233, 0.3098039, 1, 0, 1,
-0.5773587, 0.9050305, 0.3156427, 0.3019608, 1, 0, 1,
-0.5766357, 0.7855468, -0.8342638, 0.2941177, 1, 0, 1,
-0.5753127, 1.186027, -0.5873334, 0.2901961, 1, 0, 1,
-0.5748052, 1.096418, -2.291532, 0.282353, 1, 0, 1,
-0.5728409, 0.9577472, 0.5987202, 0.2784314, 1, 0, 1,
-0.5719017, 0.8522044, 0.2408256, 0.2705882, 1, 0, 1,
-0.5651631, 0.02225037, -0.94148, 0.2666667, 1, 0, 1,
-0.5600707, -0.9623706, -3.793005, 0.2588235, 1, 0, 1,
-0.5517496, -2.424522, -2.312599, 0.254902, 1, 0, 1,
-0.5517374, -2.571013, -2.370695, 0.2470588, 1, 0, 1,
-0.5493513, 0.4503997, -1.80616, 0.2431373, 1, 0, 1,
-0.549184, -0.8007317, -2.578169, 0.2352941, 1, 0, 1,
-0.5467861, 0.3306082, -0.7575775, 0.2313726, 1, 0, 1,
-0.5465186, 2.983511, -0.8024046, 0.2235294, 1, 0, 1,
-0.5451534, -0.4449801, -1.923573, 0.2196078, 1, 0, 1,
-0.5436685, 1.532566, -0.5203149, 0.2117647, 1, 0, 1,
-0.5414631, 1.076487, -0.2848522, 0.2078431, 1, 0, 1,
-0.5366606, -0.6278352, -2.728154, 0.2, 1, 0, 1,
-0.5318182, -1.259354, -2.879081, 0.1921569, 1, 0, 1,
-0.5291693, -0.8393656, -2.195818, 0.1882353, 1, 0, 1,
-0.5284134, 0.1378676, 0.0404895, 0.1803922, 1, 0, 1,
-0.5283211, -0.2830188, -2.493242, 0.1764706, 1, 0, 1,
-0.5277364, -0.9336651, -1.339087, 0.1686275, 1, 0, 1,
-0.5225633, -1.687763, -1.524921, 0.1647059, 1, 0, 1,
-0.5216462, -1.319895, -2.484037, 0.1568628, 1, 0, 1,
-0.5170047, 0.9150814, -0.2448391, 0.1529412, 1, 0, 1,
-0.5116844, 0.3828168, -0.09297889, 0.145098, 1, 0, 1,
-0.5072033, -1.791046, -1.081973, 0.1411765, 1, 0, 1,
-0.5068054, 0.9587892, -2.086349, 0.1333333, 1, 0, 1,
-0.5046887, 2.046649, -1.515186, 0.1294118, 1, 0, 1,
-0.5046853, 0.7620719, -2.680911, 0.1215686, 1, 0, 1,
-0.491582, -0.07896852, -2.726354, 0.1176471, 1, 0, 1,
-0.4889599, -0.2208991, -0.6751511, 0.1098039, 1, 0, 1,
-0.4853041, 0.2219363, -1.902923, 0.1058824, 1, 0, 1,
-0.4834872, -0.5383711, -3.53887, 0.09803922, 1, 0, 1,
-0.4803978, 0.515763, -1.03739, 0.09019608, 1, 0, 1,
-0.4789569, 0.5448485, -0.5576599, 0.08627451, 1, 0, 1,
-0.4765021, -0.1595569, -0.7923371, 0.07843138, 1, 0, 1,
-0.4761394, -2.216874, -3.306253, 0.07450981, 1, 0, 1,
-0.4751419, -0.2927139, -2.414984, 0.06666667, 1, 0, 1,
-0.4612417, 0.7229557, 0.3487417, 0.0627451, 1, 0, 1,
-0.4582011, 0.8958613, -1.358618, 0.05490196, 1, 0, 1,
-0.4539016, -0.6551363, -2.979572, 0.05098039, 1, 0, 1,
-0.4453935, -0.1263941, -3.202892, 0.04313726, 1, 0, 1,
-0.4448716, -1.409486, -4.135025, 0.03921569, 1, 0, 1,
-0.4448215, 0.04739629, 0.06567894, 0.03137255, 1, 0, 1,
-0.4416007, -0.67002, -1.860494, 0.02745098, 1, 0, 1,
-0.4387148, 0.2062225, -1.000601, 0.01960784, 1, 0, 1,
-0.4373885, -0.2604057, -3.963979, 0.01568628, 1, 0, 1,
-0.4339361, 0.4773323, -0.9708292, 0.007843138, 1, 0, 1,
-0.4332363, 0.2734573, -1.246278, 0.003921569, 1, 0, 1,
-0.4314639, 0.2108756, -2.296919, 0, 1, 0.003921569, 1,
-0.4279492, -0.7125253, -1.529398, 0, 1, 0.01176471, 1,
-0.4149725, -0.7496493, -1.499795, 0, 1, 0.01568628, 1,
-0.4098222, 0.1864167, -1.149978, 0, 1, 0.02352941, 1,
-0.4080492, -1.770053, -2.041713, 0, 1, 0.02745098, 1,
-0.4074548, -1.141315, -3.07323, 0, 1, 0.03529412, 1,
-0.4038752, -0.2825431, -1.430922, 0, 1, 0.03921569, 1,
-0.3985241, 0.7172143, 0.6122051, 0, 1, 0.04705882, 1,
-0.3975459, -0.7464564, -2.018802, 0, 1, 0.05098039, 1,
-0.3920655, -2.345873, -2.026382, 0, 1, 0.05882353, 1,
-0.3889227, 0.383008, -1.944197, 0, 1, 0.0627451, 1,
-0.3859074, 1.016604, -0.9515173, 0, 1, 0.07058824, 1,
-0.3851206, 1.191393, -0.8559256, 0, 1, 0.07450981, 1,
-0.3833099, -0.8129606, -3.903284, 0, 1, 0.08235294, 1,
-0.3815593, -0.4267581, -4.235635, 0, 1, 0.08627451, 1,
-0.373755, -0.08957617, -1.703374, 0, 1, 0.09411765, 1,
-0.3689162, -0.6637462, -2.532579, 0, 1, 0.1019608, 1,
-0.3671499, 1.416015, 1.696989, 0, 1, 0.1058824, 1,
-0.3640279, -0.7332556, -2.366868, 0, 1, 0.1137255, 1,
-0.3618602, -1.024575, -2.483306, 0, 1, 0.1176471, 1,
-0.360828, -0.5133713, -4.101266, 0, 1, 0.1254902, 1,
-0.3607457, 0.20253, -1.948857, 0, 1, 0.1294118, 1,
-0.3602035, 1.064977, -0.7908159, 0, 1, 0.1372549, 1,
-0.3578053, 0.2511362, -0.4119716, 0, 1, 0.1411765, 1,
-0.3532947, 0.004922253, -0.2289744, 0, 1, 0.1490196, 1,
-0.3530506, 0.001618475, -2.800568, 0, 1, 0.1529412, 1,
-0.351191, -1.13251, -3.220491, 0, 1, 0.1607843, 1,
-0.3436223, 1.376527, 0.1795457, 0, 1, 0.1647059, 1,
-0.3401402, -0.5661972, -3.228929, 0, 1, 0.172549, 1,
-0.3388736, 1.194209, -0.2704062, 0, 1, 0.1764706, 1,
-0.3376816, 0.2906671, -2.079525, 0, 1, 0.1843137, 1,
-0.3318631, 1.799264, -0.1483476, 0, 1, 0.1882353, 1,
-0.3274469, -0.04561655, -3.028276, 0, 1, 0.1960784, 1,
-0.326052, 1.387243, 1.591618, 0, 1, 0.2039216, 1,
-0.3249514, -0.09758706, -3.218059, 0, 1, 0.2078431, 1,
-0.3232837, 1.26085, 0.3005216, 0, 1, 0.2156863, 1,
-0.3225566, 0.8667851, -1.537018, 0, 1, 0.2196078, 1,
-0.3215155, 0.1316404, -2.032406, 0, 1, 0.227451, 1,
-0.3207623, 0.3738197, -1.181951, 0, 1, 0.2313726, 1,
-0.3196487, -1.76377, -2.756495, 0, 1, 0.2392157, 1,
-0.3167282, 2.053775, 0.3452531, 0, 1, 0.2431373, 1,
-0.3164711, -0.5201093, -2.355395, 0, 1, 0.2509804, 1,
-0.3107226, -0.06252304, -3.541029, 0, 1, 0.254902, 1,
-0.308808, -0.06787855, -1.913387, 0, 1, 0.2627451, 1,
-0.3045728, -0.511, -2.372697, 0, 1, 0.2666667, 1,
-0.3029338, 0.976658, -0.5721395, 0, 1, 0.2745098, 1,
-0.2986442, 1.31459, -0.3320236, 0, 1, 0.2784314, 1,
-0.2983813, 3.072919, -1.122818, 0, 1, 0.2862745, 1,
-0.2974693, -0.6814302, -3.209037, 0, 1, 0.2901961, 1,
-0.2964236, -1.876061, -3.708428, 0, 1, 0.2980392, 1,
-0.2961373, 0.8684828, -0.4600882, 0, 1, 0.3058824, 1,
-0.2959689, -0.1626213, -1.872245, 0, 1, 0.3098039, 1,
-0.2954446, 0.2213381, -1.025368, 0, 1, 0.3176471, 1,
-0.2911655, 1.626831, -0.1146132, 0, 1, 0.3215686, 1,
-0.2845378, -0.255667, -2.878675, 0, 1, 0.3294118, 1,
-0.2827678, 1.645694, 1.535232, 0, 1, 0.3333333, 1,
-0.2799928, -0.1762048, -2.814372, 0, 1, 0.3411765, 1,
-0.2794688, -1.656982, -3.992067, 0, 1, 0.345098, 1,
-0.2756141, 0.9060381, -0.6668131, 0, 1, 0.3529412, 1,
-0.2725358, -0.2773922, -4.028391, 0, 1, 0.3568628, 1,
-0.2723689, 0.8439157, -0.1301237, 0, 1, 0.3647059, 1,
-0.2713902, -1.074374, -2.600213, 0, 1, 0.3686275, 1,
-0.2711157, 0.4490447, -0.3641039, 0, 1, 0.3764706, 1,
-0.2704768, -0.03565262, -0.329232, 0, 1, 0.3803922, 1,
-0.2678009, 2.235871, -1.433048, 0, 1, 0.3882353, 1,
-0.2670881, -0.1851488, -3.690548, 0, 1, 0.3921569, 1,
-0.2658554, 0.8614177, 0.9385294, 0, 1, 0.4, 1,
-0.265168, 1.996083, -0.2001974, 0, 1, 0.4078431, 1,
-0.2603776, 0.1594766, -1.873148, 0, 1, 0.4117647, 1,
-0.2602564, 0.8847703, -0.006990603, 0, 1, 0.4196078, 1,
-0.2574377, 0.3281453, -0.8358347, 0, 1, 0.4235294, 1,
-0.2508264, -0.9783494, -3.216513, 0, 1, 0.4313726, 1,
-0.2489658, -0.4174056, -1.636824, 0, 1, 0.4352941, 1,
-0.2439778, -1.122448, -4.614521, 0, 1, 0.4431373, 1,
-0.2274864, -0.6589736, -0.893286, 0, 1, 0.4470588, 1,
-0.2270149, -1.209816, -1.701619, 0, 1, 0.454902, 1,
-0.2270053, 0.9826165, 0.9919988, 0, 1, 0.4588235, 1,
-0.2263691, -0.6220506, -3.310381, 0, 1, 0.4666667, 1,
-0.2247738, 0.01424105, -0.984389, 0, 1, 0.4705882, 1,
-0.224004, 1.052099, 0.03099371, 0, 1, 0.4784314, 1,
-0.2226455, -1.994523, -2.981062, 0, 1, 0.4823529, 1,
-0.2218195, -1.804799, -5.111296, 0, 1, 0.4901961, 1,
-0.2193575, 0.07184663, -1.523755, 0, 1, 0.4941176, 1,
-0.2172941, 0.247446, 0.2158161, 0, 1, 0.5019608, 1,
-0.2164476, 0.0687741, -0.9488724, 0, 1, 0.509804, 1,
-0.2163739, 1.159556, 0.2278818, 0, 1, 0.5137255, 1,
-0.213156, -1.096024, -2.934438, 0, 1, 0.5215687, 1,
-0.2083483, -0.497364, -4.981613, 0, 1, 0.5254902, 1,
-0.2073265, -1.645519, -3.688123, 0, 1, 0.5333334, 1,
-0.2011243, -0.4841517, -3.208959, 0, 1, 0.5372549, 1,
-0.2002946, -0.9677456, -4.328608, 0, 1, 0.5450981, 1,
-0.1928694, -0.9578925, -4.22441, 0, 1, 0.5490196, 1,
-0.1905677, 1.291113, -3.379108, 0, 1, 0.5568628, 1,
-0.1817166, 1.201855, -1.005377, 0, 1, 0.5607843, 1,
-0.1786678, 1.331567, -1.028327, 0, 1, 0.5686275, 1,
-0.1754545, 0.8958968, 0.2583379, 0, 1, 0.572549, 1,
-0.1706849, 0.5455691, 0.1624396, 0, 1, 0.5803922, 1,
-0.1693083, 0.5729084, -0.7035662, 0, 1, 0.5843138, 1,
-0.1692488, 2.016851, 1.377025, 0, 1, 0.5921569, 1,
-0.1648656, 0.5145909, -0.2421391, 0, 1, 0.5960785, 1,
-0.1640307, 0.01371779, -0.8415806, 0, 1, 0.6039216, 1,
-0.160794, -0.553286, -2.685172, 0, 1, 0.6117647, 1,
-0.1607924, -0.6897197, -4.090729, 0, 1, 0.6156863, 1,
-0.1600618, 0.7098361, 0.6062815, 0, 1, 0.6235294, 1,
-0.1551666, 0.1784434, -1.489099, 0, 1, 0.627451, 1,
-0.154873, 0.1161237, -0.0848885, 0, 1, 0.6352941, 1,
-0.1509202, -0.8545418, -2.508381, 0, 1, 0.6392157, 1,
-0.1487993, -0.3826077, -3.708216, 0, 1, 0.6470588, 1,
-0.1430101, -0.7464637, -1.683573, 0, 1, 0.6509804, 1,
-0.1393598, -0.6837871, -2.964753, 0, 1, 0.6588235, 1,
-0.1386183, 1.110885, -0.3920842, 0, 1, 0.6627451, 1,
-0.1381667, -0.4348969, -2.058561, 0, 1, 0.6705883, 1,
-0.133628, -2.162055, -2.210043, 0, 1, 0.6745098, 1,
-0.1333565, 1.271162, 0.07090373, 0, 1, 0.682353, 1,
-0.1318703, 0.3961678, -0.8276881, 0, 1, 0.6862745, 1,
-0.1316442, -0.6739653, -3.719116, 0, 1, 0.6941177, 1,
-0.1286482, -0.1218012, -3.011843, 0, 1, 0.7019608, 1,
-0.1280606, 0.2179414, -1.408547, 0, 1, 0.7058824, 1,
-0.1213707, -1.0333, -2.346056, 0, 1, 0.7137255, 1,
-0.1209893, -2.108373, -6.084213, 0, 1, 0.7176471, 1,
-0.1160033, -2.22305, -3.161772, 0, 1, 0.7254902, 1,
-0.1128603, 0.02995278, -0.9603407, 0, 1, 0.7294118, 1,
-0.1114572, -0.5158903, -2.918782, 0, 1, 0.7372549, 1,
-0.1068711, -0.7252265, -2.822685, 0, 1, 0.7411765, 1,
-0.1021407, 0.2305519, 0.1192457, 0, 1, 0.7490196, 1,
-0.09696124, 0.8043883, -0.713076, 0, 1, 0.7529412, 1,
-0.0950997, -0.4483449, -1.446393, 0, 1, 0.7607843, 1,
-0.09341861, -1.007196, -2.068306, 0, 1, 0.7647059, 1,
-0.0913471, 1.520135, -1.059616, 0, 1, 0.772549, 1,
-0.09026872, -2.061248, -2.274239, 0, 1, 0.7764706, 1,
-0.08546015, -0.6474299, -1.667448, 0, 1, 0.7843137, 1,
-0.08498176, -1.047307, -6.026329, 0, 1, 0.7882353, 1,
-0.06688112, 0.7534409, -2.061035, 0, 1, 0.7960784, 1,
-0.06625463, -0.4055906, -1.292825, 0, 1, 0.8039216, 1,
-0.06321544, 1.231479, -1.1183, 0, 1, 0.8078431, 1,
-0.06246673, 0.2325428, -1.261964, 0, 1, 0.8156863, 1,
-0.06238074, 0.6005048, 0.02744071, 0, 1, 0.8196079, 1,
-0.05956982, -0.4912775, -1.191465, 0, 1, 0.827451, 1,
-0.058994, 1.254509, 0.436381, 0, 1, 0.8313726, 1,
-0.05472229, 0.1010399, -0.2813625, 0, 1, 0.8392157, 1,
-0.05119781, 0.2060514, -0.373093, 0, 1, 0.8431373, 1,
-0.04473744, 0.1914106, 0.2121699, 0, 1, 0.8509804, 1,
-0.04401461, 0.3672302, -0.3281735, 0, 1, 0.854902, 1,
-0.04233126, -0.6237137, -2.386971, 0, 1, 0.8627451, 1,
-0.03947986, 1.123129, 0.3054695, 0, 1, 0.8666667, 1,
-0.0375932, 2.516892, -0.5008459, 0, 1, 0.8745098, 1,
-0.03743507, 0.7262485, 0.7662275, 0, 1, 0.8784314, 1,
-0.0348005, -2.37877, -2.031902, 0, 1, 0.8862745, 1,
-0.0333316, -0.8066327, -2.095721, 0, 1, 0.8901961, 1,
-0.03298547, 1.940463, 0.01882188, 0, 1, 0.8980392, 1,
-0.02954024, -0.2450735, -4.439563, 0, 1, 0.9058824, 1,
-0.02901302, 0.04228588, -1.077565, 0, 1, 0.9098039, 1,
-0.0285286, 0.4691462, 1.221731, 0, 1, 0.9176471, 1,
-0.02453767, 1.436338, 1.700259, 0, 1, 0.9215686, 1,
-0.02185199, 1.419598, -1.045419, 0, 1, 0.9294118, 1,
-0.0218129, -2.778213, -4.345189, 0, 1, 0.9333333, 1,
-0.01860325, -0.3574035, -1.647908, 0, 1, 0.9411765, 1,
-0.01709492, 0.5547462, -1.157924, 0, 1, 0.945098, 1,
-0.01623998, 0.3031042, -0.2811242, 0, 1, 0.9529412, 1,
-0.01300202, -0.6590807, -3.699102, 0, 1, 0.9568627, 1,
-0.01294914, -0.9615653, -3.527864, 0, 1, 0.9647059, 1,
-0.01218986, 0.370462, -1.038807, 0, 1, 0.9686275, 1,
-0.01212585, 0.3951876, 0.9156909, 0, 1, 0.9764706, 1,
-0.01068861, 0.5249406, -0.6596646, 0, 1, 0.9803922, 1,
-0.008074534, -0.9194744, -2.817604, 0, 1, 0.9882353, 1,
-0.007420645, -0.833716, -2.283308, 0, 1, 0.9921569, 1,
-0.006110183, 0.5365826, 0.6378105, 0, 1, 1, 1,
-0.004971199, 1.429503, -1.657035, 0, 0.9921569, 1, 1,
0.0006643425, 0.7035367, -0.1716531, 0, 0.9882353, 1, 1,
0.001580797, 0.2744221, 0.8833612, 0, 0.9803922, 1, 1,
0.00381606, 2.204982, 0.5502552, 0, 0.9764706, 1, 1,
0.004417615, 1.316741, -0.3214665, 0, 0.9686275, 1, 1,
0.01080868, 0.6426179, -2.561313, 0, 0.9647059, 1, 1,
0.01178572, -0.7581076, 4.938024, 0, 0.9568627, 1, 1,
0.01263924, -0.02725042, 3.257568, 0, 0.9529412, 1, 1,
0.01554797, 0.08204489, -0.4289238, 0, 0.945098, 1, 1,
0.01613364, 1.34341, -0.6250022, 0, 0.9411765, 1, 1,
0.01696539, 0.2257944, -0.8476064, 0, 0.9333333, 1, 1,
0.01735524, 1.233125, -0.5448231, 0, 0.9294118, 1, 1,
0.01818825, 0.2566402, -0.600238, 0, 0.9215686, 1, 1,
0.01838616, -0.2689622, 3.638936, 0, 0.9176471, 1, 1,
0.01934939, -1.140749, 4.659301, 0, 0.9098039, 1, 1,
0.02213393, 2.255331, -1.141978, 0, 0.9058824, 1, 1,
0.02285989, 1.21315, 0.7194445, 0, 0.8980392, 1, 1,
0.02371607, 0.2352721, -1.671356, 0, 0.8901961, 1, 1,
0.02950649, 0.08406783, 1.521208, 0, 0.8862745, 1, 1,
0.03117838, 0.4417037, -1.955331, 0, 0.8784314, 1, 1,
0.03290155, 1.703662, -0.4445105, 0, 0.8745098, 1, 1,
0.03404887, 0.5279266, -2.083135, 0, 0.8666667, 1, 1,
0.03484009, 0.5231224, -0.4446522, 0, 0.8627451, 1, 1,
0.0364503, -0.7264677, 3.990897, 0, 0.854902, 1, 1,
0.03759769, 1.555074, 0.03385771, 0, 0.8509804, 1, 1,
0.03796736, -1.309562, 4.132328, 0, 0.8431373, 1, 1,
0.04008753, -0.2331212, 3.6283, 0, 0.8392157, 1, 1,
0.04144325, -1.474515, 1.123383, 0, 0.8313726, 1, 1,
0.04315904, -0.5657601, 2.375502, 0, 0.827451, 1, 1,
0.04499778, 0.368926, -0.9040692, 0, 0.8196079, 1, 1,
0.04657694, 0.9687167, 0.6114424, 0, 0.8156863, 1, 1,
0.05562508, 0.559058, -0.0909792, 0, 0.8078431, 1, 1,
0.05852574, -0.168734, 3.785083, 0, 0.8039216, 1, 1,
0.06044691, -0.4458443, 3.043517, 0, 0.7960784, 1, 1,
0.06305052, 0.2199997, -0.2261178, 0, 0.7882353, 1, 1,
0.06558485, -0.4939918, 4.456086, 0, 0.7843137, 1, 1,
0.06974181, 0.7826926, -0.9734138, 0, 0.7764706, 1, 1,
0.07046958, -0.3657306, 2.122587, 0, 0.772549, 1, 1,
0.07177152, 0.751194, -0.4265434, 0, 0.7647059, 1, 1,
0.07398053, -1.426662, 5.239843, 0, 0.7607843, 1, 1,
0.0765574, -0.7204694, 1.521466, 0, 0.7529412, 1, 1,
0.07794324, -0.3989328, 1.321902, 0, 0.7490196, 1, 1,
0.08219958, 0.3553017, 0.2999418, 0, 0.7411765, 1, 1,
0.08265781, -0.9770901, 1.40433, 0, 0.7372549, 1, 1,
0.08378869, 0.7950373, -0.9882983, 0, 0.7294118, 1, 1,
0.08436478, 2.848977, -0.2470322, 0, 0.7254902, 1, 1,
0.0846242, 0.6795877, 1.100865, 0, 0.7176471, 1, 1,
0.08961334, 0.6018276, -0.6969676, 0, 0.7137255, 1, 1,
0.09046376, -0.5853323, 4.382399, 0, 0.7058824, 1, 1,
0.0914572, 0.21327, 2.216759, 0, 0.6980392, 1, 1,
0.09396699, 1.071448, 1.770803, 0, 0.6941177, 1, 1,
0.09582578, -0.7541757, 2.982272, 0, 0.6862745, 1, 1,
0.09625635, 0.798349, 1.875298, 0, 0.682353, 1, 1,
0.09690615, -0.4557005, 2.897128, 0, 0.6745098, 1, 1,
0.0973414, -0.8955508, 3.089276, 0, 0.6705883, 1, 1,
0.1007943, -1.183139, 2.545928, 0, 0.6627451, 1, 1,
0.1013201, 0.002114723, 0.8974433, 0, 0.6588235, 1, 1,
0.1063224, -1.466255, 6.075032, 0, 0.6509804, 1, 1,
0.1071399, -0.5151445, 2.195903, 0, 0.6470588, 1, 1,
0.1074755, 0.4366133, -0.4231384, 0, 0.6392157, 1, 1,
0.1088919, 0.5296843, -0.01886052, 0, 0.6352941, 1, 1,
0.1108891, -1.084039, 0.7980419, 0, 0.627451, 1, 1,
0.1122142, 0.8700468, 0.45585, 0, 0.6235294, 1, 1,
0.1141506, -0.2199216, 2.03962, 0, 0.6156863, 1, 1,
0.1280382, -0.1862935, 2.552552, 0, 0.6117647, 1, 1,
0.1302863, -0.8787681, 3.843342, 0, 0.6039216, 1, 1,
0.1302894, 0.2169556, 2.014956, 0, 0.5960785, 1, 1,
0.1332648, -1.302505, 3.040279, 0, 0.5921569, 1, 1,
0.1352383, 0.6068749, -0.4916409, 0, 0.5843138, 1, 1,
0.1363412, 0.2165852, -0.6102896, 0, 0.5803922, 1, 1,
0.1372289, 1.165863, 0.4961106, 0, 0.572549, 1, 1,
0.1382565, -0.4891693, 3.510293, 0, 0.5686275, 1, 1,
0.1418308, 0.94744, -0.8092006, 0, 0.5607843, 1, 1,
0.1418931, -0.13007, 1.684233, 0, 0.5568628, 1, 1,
0.1434936, 0.5911405, 0.5429966, 0, 0.5490196, 1, 1,
0.1444212, 1.805585, -2.026534, 0, 0.5450981, 1, 1,
0.1457789, -0.4716719, 4.517807, 0, 0.5372549, 1, 1,
0.1475112, -0.6229727, 2.899607, 0, 0.5333334, 1, 1,
0.1479895, 0.7547582, -0.2987804, 0, 0.5254902, 1, 1,
0.1612608, -1.941906, 3.930006, 0, 0.5215687, 1, 1,
0.1618319, -1.538208, 1.968544, 0, 0.5137255, 1, 1,
0.1620281, -1.087936, 2.078922, 0, 0.509804, 1, 1,
0.1640707, 0.2995237, -0.1504413, 0, 0.5019608, 1, 1,
0.1712423, -1.443171, 1.255292, 0, 0.4941176, 1, 1,
0.1732375, 0.5359859, 1.031266, 0, 0.4901961, 1, 1,
0.1755653, 0.6166406, -0.2267305, 0, 0.4823529, 1, 1,
0.1767429, 0.2708469, 1.267898, 0, 0.4784314, 1, 1,
0.1773489, 0.4474079, -0.6854398, 0, 0.4705882, 1, 1,
0.1813279, -1.81139, 1.190255, 0, 0.4666667, 1, 1,
0.1814492, -0.7426293, 1.919168, 0, 0.4588235, 1, 1,
0.1835615, 1.654519, 0.5445313, 0, 0.454902, 1, 1,
0.1842231, 0.1054344, 1.04773, 0, 0.4470588, 1, 1,
0.1859785, 1.944269, -1.493433, 0, 0.4431373, 1, 1,
0.1865535, -0.2851469, 2.199481, 0, 0.4352941, 1, 1,
0.1928169, -1.04356, 2.610454, 0, 0.4313726, 1, 1,
0.1928578, 0.1287887, 0.255394, 0, 0.4235294, 1, 1,
0.1938302, -0.4334632, 2.122117, 0, 0.4196078, 1, 1,
0.1949411, 1.844959, 0.6799737, 0, 0.4117647, 1, 1,
0.2018256, 0.6638522, -0.9484771, 0, 0.4078431, 1, 1,
0.2036322, 1.884594, 0.943395, 0, 0.4, 1, 1,
0.2044737, 1.678812, 1.426646, 0, 0.3921569, 1, 1,
0.2082069, 0.6548993, 0.250726, 0, 0.3882353, 1, 1,
0.2082252, 0.8438834, -0.4469707, 0, 0.3803922, 1, 1,
0.2119808, 0.1887339, -0.6684065, 0, 0.3764706, 1, 1,
0.2139896, 1.219473, -1.044323, 0, 0.3686275, 1, 1,
0.2145874, 1.954707, 0.3748965, 0, 0.3647059, 1, 1,
0.2147432, 0.9795992, 0.2851593, 0, 0.3568628, 1, 1,
0.215364, 1.85688, 1.368289, 0, 0.3529412, 1, 1,
0.2164425, 0.6024159, 2.017041, 0, 0.345098, 1, 1,
0.2175432, 0.7523619, 0.4237675, 0, 0.3411765, 1, 1,
0.2182484, -0.5090861, 5.213492, 0, 0.3333333, 1, 1,
0.2218731, -0.6765135, 3.331075, 0, 0.3294118, 1, 1,
0.2221155, -1.101226, 1.65963, 0, 0.3215686, 1, 1,
0.2222629, -0.2114374, 0.978751, 0, 0.3176471, 1, 1,
0.22673, 0.1348784, 0.03754929, 0, 0.3098039, 1, 1,
0.2356617, -0.9180156, 1.885071, 0, 0.3058824, 1, 1,
0.2368616, 0.5678983, -0.9778818, 0, 0.2980392, 1, 1,
0.2426648, -1.246117, 3.721319, 0, 0.2901961, 1, 1,
0.2444059, 1.961, 1.504726, 0, 0.2862745, 1, 1,
0.2483542, 1.475921, -1.328924, 0, 0.2784314, 1, 1,
0.2510292, -1.26547, 4.323409, 0, 0.2745098, 1, 1,
0.2540107, 0.08442783, 1.418394, 0, 0.2666667, 1, 1,
0.2574112, -1.751384, 2.379006, 0, 0.2627451, 1, 1,
0.2575046, 0.6052584, 2.424835, 0, 0.254902, 1, 1,
0.2596518, 0.7263564, 2.270222, 0, 0.2509804, 1, 1,
0.2761154, -1.427093, 4.263443, 0, 0.2431373, 1, 1,
0.2769396, -0.09874783, 1.298752, 0, 0.2392157, 1, 1,
0.2771981, -2.048062, 3.512433, 0, 0.2313726, 1, 1,
0.2798355, -0.1939568, 2.514048, 0, 0.227451, 1, 1,
0.282223, 0.2413926, 0.1764206, 0, 0.2196078, 1, 1,
0.2857092, 0.7527015, -0.03144516, 0, 0.2156863, 1, 1,
0.2878198, -2.75316, 3.630416, 0, 0.2078431, 1, 1,
0.2934605, 0.5983607, 0.07075419, 0, 0.2039216, 1, 1,
0.2983646, 0.6513802, -1.872874, 0, 0.1960784, 1, 1,
0.29938, 0.7815194, 0.2350276, 0, 0.1882353, 1, 1,
0.3034958, -0.538565, 2.203627, 0, 0.1843137, 1, 1,
0.3035156, 0.9672881, 0.4734433, 0, 0.1764706, 1, 1,
0.3049886, -1.217926, 5.977983, 0, 0.172549, 1, 1,
0.3054326, 0.9743281, -0.4220539, 0, 0.1647059, 1, 1,
0.3059235, 0.9466467, 2.179204, 0, 0.1607843, 1, 1,
0.3068352, 0.5479338, 1.924991, 0, 0.1529412, 1, 1,
0.3084581, -0.04662786, 2.19282, 0, 0.1490196, 1, 1,
0.311308, -0.6610363, 0.8689936, 0, 0.1411765, 1, 1,
0.3137884, -0.562526, 4.146756, 0, 0.1372549, 1, 1,
0.3186464, -0.1471112, 2.545393, 0, 0.1294118, 1, 1,
0.3188361, 0.1257001, 0.9291925, 0, 0.1254902, 1, 1,
0.3191257, -0.8022593, 1.821501, 0, 0.1176471, 1, 1,
0.3199891, -1.294074, 2.18475, 0, 0.1137255, 1, 1,
0.3219891, -0.3624598, 1.194434, 0, 0.1058824, 1, 1,
0.3233024, -1.342788, 3.442132, 0, 0.09803922, 1, 1,
0.3234219, 1.850195, -1.725884, 0, 0.09411765, 1, 1,
0.3237258, -0.08832476, 2.371817, 0, 0.08627451, 1, 1,
0.3237787, 0.5604106, 0.3863328, 0, 0.08235294, 1, 1,
0.3249208, 0.2669012, -0.1489719, 0, 0.07450981, 1, 1,
0.3300752, 0.68602, 1.11651, 0, 0.07058824, 1, 1,
0.3315933, -0.5131488, 1.828519, 0, 0.0627451, 1, 1,
0.334549, -1.227476, 2.3421, 0, 0.05882353, 1, 1,
0.3426109, -0.618305, 1.951004, 0, 0.05098039, 1, 1,
0.3446263, 0.1414936, -0.9201238, 0, 0.04705882, 1, 1,
0.3471499, 0.233796, 0.4284972, 0, 0.03921569, 1, 1,
0.3507453, -0.1174984, 2.910263, 0, 0.03529412, 1, 1,
0.3580211, 0.8934494, 0.07830226, 0, 0.02745098, 1, 1,
0.3595346, 0.008030051, 2.652264, 0, 0.02352941, 1, 1,
0.373708, 0.6306372, -0.1167763, 0, 0.01568628, 1, 1,
0.373844, 0.1631098, 3.124703, 0, 0.01176471, 1, 1,
0.3751616, 0.7899004, 0.6555226, 0, 0.003921569, 1, 1,
0.375688, 0.2450965, -0.3507254, 0.003921569, 0, 1, 1,
0.383008, 1.102954, -1.081008, 0.007843138, 0, 1, 1,
0.3839287, -0.4823682, 1.010873, 0.01568628, 0, 1, 1,
0.3856802, -2.541596, 3.110311, 0.01960784, 0, 1, 1,
0.3864707, -0.05592953, 2.31192, 0.02745098, 0, 1, 1,
0.3976179, 0.6392386, -0.2672322, 0.03137255, 0, 1, 1,
0.3978358, -0.006594027, -0.16545, 0.03921569, 0, 1, 1,
0.3983494, -0.7163551, 2.65493, 0.04313726, 0, 1, 1,
0.4045309, -0.7643842, 1.463257, 0.05098039, 0, 1, 1,
0.4067476, -1.929135, 2.698302, 0.05490196, 0, 1, 1,
0.406969, -2.692952, 3.036645, 0.0627451, 0, 1, 1,
0.418031, 1.621327, 0.1761022, 0.06666667, 0, 1, 1,
0.4199785, -0.1209413, 1.2801, 0.07450981, 0, 1, 1,
0.4229043, 0.3384697, 1.234128, 0.07843138, 0, 1, 1,
0.4240803, -0.1244124, 1.492166, 0.08627451, 0, 1, 1,
0.4246635, -0.374294, 3.704631, 0.09019608, 0, 1, 1,
0.4338736, -0.2737673, 2.657169, 0.09803922, 0, 1, 1,
0.4356163, 0.6394482, -0.4299812, 0.1058824, 0, 1, 1,
0.4377002, -0.7251593, 0.8211721, 0.1098039, 0, 1, 1,
0.4384421, -0.3522266, 3.197496, 0.1176471, 0, 1, 1,
0.4394728, -0.196557, 2.183191, 0.1215686, 0, 1, 1,
0.4408545, 0.6115215, 1.43342, 0.1294118, 0, 1, 1,
0.441035, 1.120199, -1.063697, 0.1333333, 0, 1, 1,
0.4487874, -0.2421863, 2.555858, 0.1411765, 0, 1, 1,
0.4487932, 1.545913, 0.8528627, 0.145098, 0, 1, 1,
0.4492894, -0.6473103, 1.556104, 0.1529412, 0, 1, 1,
0.452088, 0.9705632, -1.854927, 0.1568628, 0, 1, 1,
0.45267, -1.507996, 1.38348, 0.1647059, 0, 1, 1,
0.454375, -0.4788654, 4.345123, 0.1686275, 0, 1, 1,
0.4546622, -1.200065, 2.625194, 0.1764706, 0, 1, 1,
0.4613836, -0.9280479, 4.135695, 0.1803922, 0, 1, 1,
0.4633679, -0.1310151, 1.385032, 0.1882353, 0, 1, 1,
0.4663089, -1.849008, 2.426216, 0.1921569, 0, 1, 1,
0.4669684, -0.1430949, 0.6542425, 0.2, 0, 1, 1,
0.4671062, 0.9085541, -0.4672135, 0.2078431, 0, 1, 1,
0.4712194, -0.8285553, 2.963767, 0.2117647, 0, 1, 1,
0.474663, 0.4114299, -0.2443661, 0.2196078, 0, 1, 1,
0.4775166, 0.02419195, 1.173434, 0.2235294, 0, 1, 1,
0.479215, 0.3871205, 1.567868, 0.2313726, 0, 1, 1,
0.4795914, 0.8062414, 0.3636883, 0.2352941, 0, 1, 1,
0.4813661, 0.2822765, 0.9854458, 0.2431373, 0, 1, 1,
0.4826499, -1.424703, 0.7182693, 0.2470588, 0, 1, 1,
0.4857934, -0.6396861, 2.060824, 0.254902, 0, 1, 1,
0.4875565, 1.532874, 0.01562811, 0.2588235, 0, 1, 1,
0.4887002, 0.09054583, 1.226195, 0.2666667, 0, 1, 1,
0.4900756, -0.5485267, 3.614437, 0.2705882, 0, 1, 1,
0.490564, 0.02526804, 1.625698, 0.2784314, 0, 1, 1,
0.4919247, -1.973433, 2.151272, 0.282353, 0, 1, 1,
0.494962, 0.6361603, -0.5829381, 0.2901961, 0, 1, 1,
0.4950115, 0.3727544, 2.107957, 0.2941177, 0, 1, 1,
0.5013947, 0.5975757, 1.745998, 0.3019608, 0, 1, 1,
0.504123, 0.1778553, 1.448457, 0.3098039, 0, 1, 1,
0.5048122, -0.3954336, 2.789039, 0.3137255, 0, 1, 1,
0.5053752, -1.741131, 4.502041, 0.3215686, 0, 1, 1,
0.5058344, -0.8812462, 2.564638, 0.3254902, 0, 1, 1,
0.5096069, -0.2603677, 2.182536, 0.3333333, 0, 1, 1,
0.5162933, -0.9381958, 4.130271, 0.3372549, 0, 1, 1,
0.5171574, 0.4520467, -0.1208343, 0.345098, 0, 1, 1,
0.5318069, -1.333041, 2.207492, 0.3490196, 0, 1, 1,
0.5338242, 0.5404959, 0.413343, 0.3568628, 0, 1, 1,
0.5378929, 0.8704229, 0.8579963, 0.3607843, 0, 1, 1,
0.5421079, -0.2287032, 1.678426, 0.3686275, 0, 1, 1,
0.5427733, 1.584318, 0.7907576, 0.372549, 0, 1, 1,
0.5499076, 0.6393407, 1.581261, 0.3803922, 0, 1, 1,
0.5595545, 1.150618, -1.563753, 0.3843137, 0, 1, 1,
0.5602118, 0.6909962, 0.6681749, 0.3921569, 0, 1, 1,
0.5614027, -0.420751, 1.577041, 0.3960784, 0, 1, 1,
0.5617008, 1.238361, 1.900289, 0.4039216, 0, 1, 1,
0.5617705, -0.1150337, 0.6539515, 0.4117647, 0, 1, 1,
0.5625115, -1.620548, 2.238754, 0.4156863, 0, 1, 1,
0.5636617, -1.548001, 1.947454, 0.4235294, 0, 1, 1,
0.5651734, 2.816346, -0.9682375, 0.427451, 0, 1, 1,
0.567753, 0.9927214, -0.1728436, 0.4352941, 0, 1, 1,
0.5688903, 0.0006885742, 1.247832, 0.4392157, 0, 1, 1,
0.5699533, 0.2887008, 2.369813, 0.4470588, 0, 1, 1,
0.5784501, 0.002918527, 0.07153289, 0.4509804, 0, 1, 1,
0.5796114, 0.1738545, 0.9588261, 0.4588235, 0, 1, 1,
0.5809057, 0.1533205, 0.5764445, 0.4627451, 0, 1, 1,
0.5849776, 2.418007, 0.9878916, 0.4705882, 0, 1, 1,
0.5897055, -1.353077, 2.59625, 0.4745098, 0, 1, 1,
0.596679, 0.8364431, -0.700343, 0.4823529, 0, 1, 1,
0.5991963, -0.76911, 5.914222, 0.4862745, 0, 1, 1,
0.6000955, -0.4232861, 2.995641, 0.4941176, 0, 1, 1,
0.6006877, -1.169243, 2.675917, 0.5019608, 0, 1, 1,
0.600786, 0.991967, 1.556144, 0.5058824, 0, 1, 1,
0.6027682, -0.3102511, 2.637817, 0.5137255, 0, 1, 1,
0.603451, 0.5066474, 0.08972569, 0.5176471, 0, 1, 1,
0.6068685, 1.78149, 1.046008, 0.5254902, 0, 1, 1,
0.6158614, -1.874467, 3.057195, 0.5294118, 0, 1, 1,
0.6162111, 0.1268795, 1.507667, 0.5372549, 0, 1, 1,
0.6168852, 0.1064053, 0.5356734, 0.5411765, 0, 1, 1,
0.6210746, 1.918863, 0.05205132, 0.5490196, 0, 1, 1,
0.624028, -0.2954913, 2.188978, 0.5529412, 0, 1, 1,
0.6244228, -0.8506422, 2.528704, 0.5607843, 0, 1, 1,
0.6245239, 0.6106342, 0.5607803, 0.5647059, 0, 1, 1,
0.6274093, 1.628723, 1.669816, 0.572549, 0, 1, 1,
0.6285909, 0.7407345, 1.79895, 0.5764706, 0, 1, 1,
0.6298097, -1.668335, 2.266726, 0.5843138, 0, 1, 1,
0.6345925, 1.315198, -0.8771793, 0.5882353, 0, 1, 1,
0.6406661, -1.007102, 1.702077, 0.5960785, 0, 1, 1,
0.6422225, 1.001799, 1.467397, 0.6039216, 0, 1, 1,
0.6469386, -0.4893818, 1.179099, 0.6078432, 0, 1, 1,
0.6487804, -1.321005, 4.506293, 0.6156863, 0, 1, 1,
0.6494707, 1.04201, 0.3904379, 0.6196079, 0, 1, 1,
0.6606384, 0.3388009, 0.3837688, 0.627451, 0, 1, 1,
0.6771368, 0.6953495, -1.300216, 0.6313726, 0, 1, 1,
0.6804441, 0.4869889, 0.3580793, 0.6392157, 0, 1, 1,
0.6814147, 1.375205, -1.081504, 0.6431373, 0, 1, 1,
0.6829875, 0.2566969, 2.774058, 0.6509804, 0, 1, 1,
0.6875908, -0.5403913, 1.552922, 0.654902, 0, 1, 1,
0.6938353, -0.09406161, 2.280635, 0.6627451, 0, 1, 1,
0.7005703, 2.780856, -0.4269809, 0.6666667, 0, 1, 1,
0.7067098, 0.08404528, 2.365015, 0.6745098, 0, 1, 1,
0.7098972, -0.06985682, 2.218303, 0.6784314, 0, 1, 1,
0.7107743, -0.3673806, 1.251104, 0.6862745, 0, 1, 1,
0.7143949, -0.7083023, 2.776321, 0.6901961, 0, 1, 1,
0.7156515, 0.3931372, 1.942612, 0.6980392, 0, 1, 1,
0.7210518, 0.1308914, 1.20536, 0.7058824, 0, 1, 1,
0.723694, 0.05139535, 2.206908, 0.7098039, 0, 1, 1,
0.7272555, -0.05641932, 1.273063, 0.7176471, 0, 1, 1,
0.7313657, -0.3385327, 1.530064, 0.7215686, 0, 1, 1,
0.73231, -2.284867, 3.571426, 0.7294118, 0, 1, 1,
0.7338297, 1.584488, 2.053202, 0.7333333, 0, 1, 1,
0.7347968, 0.07640128, 0.5033754, 0.7411765, 0, 1, 1,
0.7359334, -0.09191544, 4.162356, 0.7450981, 0, 1, 1,
0.7406403, 0.6429518, -0.05497266, 0.7529412, 0, 1, 1,
0.7407103, 0.9647554, 0.1152692, 0.7568628, 0, 1, 1,
0.7410726, 0.1797607, 0.4978527, 0.7647059, 0, 1, 1,
0.7418505, 0.2991998, 1.591322, 0.7686275, 0, 1, 1,
0.7425826, -0.8697955, 3.108392, 0.7764706, 0, 1, 1,
0.7452286, -0.667019, 1.876883, 0.7803922, 0, 1, 1,
0.7463815, 0.8809308, 0.3542981, 0.7882353, 0, 1, 1,
0.7530566, 0.625206, 0.324446, 0.7921569, 0, 1, 1,
0.7575115, 1.444698, 0.7009916, 0.8, 0, 1, 1,
0.7589954, -1.451876, 1.067065, 0.8078431, 0, 1, 1,
0.7646388, 1.519909, -0.2545176, 0.8117647, 0, 1, 1,
0.7672094, 0.5177677, -0.1236911, 0.8196079, 0, 1, 1,
0.7681984, 0.4828486, -0.2145817, 0.8235294, 0, 1, 1,
0.7706573, -1.290298, 1.985465, 0.8313726, 0, 1, 1,
0.7758574, -0.34135, 0.8072291, 0.8352941, 0, 1, 1,
0.7770875, 0.2817304, 1.307035, 0.8431373, 0, 1, 1,
0.7790408, 0.8763858, 0.376669, 0.8470588, 0, 1, 1,
0.7872511, -0.5791891, 2.822221, 0.854902, 0, 1, 1,
0.7879701, -0.2214516, 1.316557, 0.8588235, 0, 1, 1,
0.788326, 0.9768603, -0.1174704, 0.8666667, 0, 1, 1,
0.78915, 2.168301, 0.5674278, 0.8705882, 0, 1, 1,
0.8017718, 0.2544016, 0.5031506, 0.8784314, 0, 1, 1,
0.8022479, -0.5236071, 2.889489, 0.8823529, 0, 1, 1,
0.8056695, 1.122028, 0.3507562, 0.8901961, 0, 1, 1,
0.8081077, -3.441577, 1.922674, 0.8941177, 0, 1, 1,
0.8157677, -0.4304616, 2.103319, 0.9019608, 0, 1, 1,
0.817782, -0.1432888, 0.6159977, 0.9098039, 0, 1, 1,
0.8200042, 1.042876, 0.9109423, 0.9137255, 0, 1, 1,
0.8231142, 1.49245, 0.2438276, 0.9215686, 0, 1, 1,
0.8234195, -0.0645529, 1.681785, 0.9254902, 0, 1, 1,
0.8242524, 1.04094, 0.893416, 0.9333333, 0, 1, 1,
0.8250337, -0.6560382, 3.409538, 0.9372549, 0, 1, 1,
0.8382565, 0.1042645, 1.61766, 0.945098, 0, 1, 1,
0.8384113, 1.214667, 0.9375885, 0.9490196, 0, 1, 1,
0.8420849, 0.8679633, 1.062166, 0.9568627, 0, 1, 1,
0.8465008, -0.8078401, 3.702304, 0.9607843, 0, 1, 1,
0.8486989, -0.845713, 2.248754, 0.9686275, 0, 1, 1,
0.8517389, 0.4806324, 2.801888, 0.972549, 0, 1, 1,
0.854169, 0.09090074, 1.283046, 0.9803922, 0, 1, 1,
0.8564899, -0.05431015, 3.71242, 0.9843137, 0, 1, 1,
0.8584992, 1.762752, -0.1218984, 0.9921569, 0, 1, 1,
0.8663638, -0.6369586, 1.376243, 0.9960784, 0, 1, 1,
0.8838206, -0.505444, 2.008081, 1, 0, 0.9960784, 1,
0.8859302, -0.5301877, 2.633033, 1, 0, 0.9882353, 1,
0.8919456, 1.446917, -0.1340441, 1, 0, 0.9843137, 1,
0.9018389, 2.013736, 0.7032191, 1, 0, 0.9764706, 1,
0.9168805, 1.041604, 0.4147819, 1, 0, 0.972549, 1,
0.9222855, 0.2277426, 1.205967, 1, 0, 0.9647059, 1,
0.9255317, 0.1050242, 1.249569, 1, 0, 0.9607843, 1,
0.9266405, -0.6904113, 1.10911, 1, 0, 0.9529412, 1,
0.927601, -0.8920023, 2.117845, 1, 0, 0.9490196, 1,
0.9276952, 0.2433738, 0.9117905, 1, 0, 0.9411765, 1,
0.9329854, 1.141229, 1.6996, 1, 0, 0.9372549, 1,
0.9347165, 1.25405, 0.6090531, 1, 0, 0.9294118, 1,
0.9367867, -0.1010562, 2.650659, 1, 0, 0.9254902, 1,
0.9375376, 1.084697, 1.146953, 1, 0, 0.9176471, 1,
0.9401721, 0.156344, 1.772516, 1, 0, 0.9137255, 1,
0.965278, 0.25267, 1.376236, 1, 0, 0.9058824, 1,
0.9685328, 0.2239793, 2.135925, 1, 0, 0.9019608, 1,
0.9713274, 0.7292923, 1.094529, 1, 0, 0.8941177, 1,
0.9831238, 1.489718, -0.5129963, 1, 0, 0.8862745, 1,
0.9903517, -1.060025, 1.732591, 1, 0, 0.8823529, 1,
0.9911602, 0.04151795, 2.45786, 1, 0, 0.8745098, 1,
0.9942168, -0.0454006, 3.334403, 1, 0, 0.8705882, 1,
0.9973377, 1.150393, -0.6838388, 1, 0, 0.8627451, 1,
1.006987, 0.3296235, -0.8389934, 1, 0, 0.8588235, 1,
1.011162, 1.218833, -0.9344586, 1, 0, 0.8509804, 1,
1.022463, -0.7732653, 2.787808, 1, 0, 0.8470588, 1,
1.023757, -1.311486, 2.847184, 1, 0, 0.8392157, 1,
1.039713, 0.09991277, 2.484222, 1, 0, 0.8352941, 1,
1.043396, -0.5136408, 3.855591, 1, 0, 0.827451, 1,
1.044568, 1.482639, 0.4829586, 1, 0, 0.8235294, 1,
1.05182, 0.6519905, 0.2141069, 1, 0, 0.8156863, 1,
1.064111, 0.3995761, 0.4093135, 1, 0, 0.8117647, 1,
1.065427, -0.3603134, 1.224568, 1, 0, 0.8039216, 1,
1.068165, -1.625854, 3.077135, 1, 0, 0.7960784, 1,
1.070578, 0.07159478, 2.808786, 1, 0, 0.7921569, 1,
1.071315, 0.6179284, 1.955297, 1, 0, 0.7843137, 1,
1.079797, 0.8569191, 0.7872004, 1, 0, 0.7803922, 1,
1.079882, -0.5074775, 1.334397, 1, 0, 0.772549, 1,
1.080171, -1.231088, 1.716167, 1, 0, 0.7686275, 1,
1.085367, 0.7974821, 1.085577, 1, 0, 0.7607843, 1,
1.094633, 1.416135, -1.038091, 1, 0, 0.7568628, 1,
1.095502, 0.9181972, 1.933217, 1, 0, 0.7490196, 1,
1.099707, 0.9265451, 1.210032, 1, 0, 0.7450981, 1,
1.104043, -0.2458462, 1.278893, 1, 0, 0.7372549, 1,
1.106476, 0.438313, 1.343299, 1, 0, 0.7333333, 1,
1.106851, -0.7971407, 0.8845773, 1, 0, 0.7254902, 1,
1.107859, 0.1796844, 1.074035, 1, 0, 0.7215686, 1,
1.111575, 1.136564, 1.809826, 1, 0, 0.7137255, 1,
1.113078, 0.547343, 0.1436927, 1, 0, 0.7098039, 1,
1.120492, -1.362459, 2.275532, 1, 0, 0.7019608, 1,
1.12932, -0.6516574, 0.02375517, 1, 0, 0.6941177, 1,
1.130479, 0.1354888, 0.36459, 1, 0, 0.6901961, 1,
1.13212, -0.3391335, 3.08557, 1, 0, 0.682353, 1,
1.138644, -0.7800775, 3.102662, 1, 0, 0.6784314, 1,
1.145163, 0.1798323, 3.123846, 1, 0, 0.6705883, 1,
1.148624, 1.530027, 1.115514, 1, 0, 0.6666667, 1,
1.151932, -0.195145, 2.07851, 1, 0, 0.6588235, 1,
1.152937, -0.2102017, 2.484894, 1, 0, 0.654902, 1,
1.157007, 1.000896, 2.092828, 1, 0, 0.6470588, 1,
1.158362, -1.607577, 4.002698, 1, 0, 0.6431373, 1,
1.1596, -0.6699541, 1.707638, 1, 0, 0.6352941, 1,
1.162364, -1.015271, 4.374905, 1, 0, 0.6313726, 1,
1.175868, 0.4847057, 2.506272, 1, 0, 0.6235294, 1,
1.176351, -0.5425465, 3.034806, 1, 0, 0.6196079, 1,
1.176879, 0.3601383, 1.704512, 1, 0, 0.6117647, 1,
1.184733, -0.3767772, 2.246759, 1, 0, 0.6078432, 1,
1.186525, -1.450828, 1.699535, 1, 0, 0.6, 1,
1.189686, -0.9698496, 3.785306, 1, 0, 0.5921569, 1,
1.204274, -1.303723, 1.10619, 1, 0, 0.5882353, 1,
1.208184, -0.3409, 3.186036, 1, 0, 0.5803922, 1,
1.215765, 0.9427363, 1.554317, 1, 0, 0.5764706, 1,
1.219787, -0.07709444, 2.343814, 1, 0, 0.5686275, 1,
1.229542, 1.430333, 0.8872221, 1, 0, 0.5647059, 1,
1.231378, -0.5907185, 1.538315, 1, 0, 0.5568628, 1,
1.263721, -0.7524926, 2.328053, 1, 0, 0.5529412, 1,
1.269876, 1.316974, 1.604772, 1, 0, 0.5450981, 1,
1.283089, -1.11949, 5.056198, 1, 0, 0.5411765, 1,
1.285717, -0.1678201, 2.707186, 1, 0, 0.5333334, 1,
1.297394, -1.025613, 2.380896, 1, 0, 0.5294118, 1,
1.307975, 1.268325, 1.478245, 1, 0, 0.5215687, 1,
1.308332, -0.06830092, 1.935988, 1, 0, 0.5176471, 1,
1.30856, -0.8881252, 0.9319133, 1, 0, 0.509804, 1,
1.308679, -0.09379568, 0.6583173, 1, 0, 0.5058824, 1,
1.312236, -0.7270654, 1.728751, 1, 0, 0.4980392, 1,
1.31587, -0.3423425, 1.064219, 1, 0, 0.4901961, 1,
1.326087, 0.3554577, 1.105361, 1, 0, 0.4862745, 1,
1.337696, -0.8233503, -0.382276, 1, 0, 0.4784314, 1,
1.347303, 0.01624285, 1.295055, 1, 0, 0.4745098, 1,
1.36425, 0.4501738, 1.274802, 1, 0, 0.4666667, 1,
1.365841, -2.073895, 0.6655993, 1, 0, 0.4627451, 1,
1.367863, -1.027611, 0.9128304, 1, 0, 0.454902, 1,
1.371546, 0.4280781, 2.650777, 1, 0, 0.4509804, 1,
1.372352, -0.6785509, 2.679777, 1, 0, 0.4431373, 1,
1.394826, -1.178251, 2.705531, 1, 0, 0.4392157, 1,
1.396093, -0.7459679, -0.6232075, 1, 0, 0.4313726, 1,
1.410769, 0.2914366, 2.71693, 1, 0, 0.427451, 1,
1.43197, -0.8981391, 1.088404, 1, 0, 0.4196078, 1,
1.436141, 0.6517709, 1.712166, 1, 0, 0.4156863, 1,
1.445962, -0.5086964, 2.608747, 1, 0, 0.4078431, 1,
1.44756, -0.2064201, 2.540895, 1, 0, 0.4039216, 1,
1.465911, -0.4152345, 2.027406, 1, 0, 0.3960784, 1,
1.478642, 0.5292231, -0.4634939, 1, 0, 0.3882353, 1,
1.479369, -1.071886, 2.0067, 1, 0, 0.3843137, 1,
1.491575, 0.2077497, 1.650009, 1, 0, 0.3764706, 1,
1.492411, -1.931156, 3.542349, 1, 0, 0.372549, 1,
1.494688, -0.3570977, 1.731116, 1, 0, 0.3647059, 1,
1.501135, 0.3967499, 1.094075, 1, 0, 0.3607843, 1,
1.502483, -1.256925, 2.946256, 1, 0, 0.3529412, 1,
1.502824, -0.374232, -0.04128169, 1, 0, 0.3490196, 1,
1.504778, -0.4284947, 2.589218, 1, 0, 0.3411765, 1,
1.529206, 0.6501033, 0.983288, 1, 0, 0.3372549, 1,
1.538799, 0.4777015, 1.671244, 1, 0, 0.3294118, 1,
1.552385, -0.5881621, 1.382371, 1, 0, 0.3254902, 1,
1.59167, -1.202803, 1.844887, 1, 0, 0.3176471, 1,
1.611873, -0.494618, 3.235682, 1, 0, 0.3137255, 1,
1.61227, -0.2263181, 1.144076, 1, 0, 0.3058824, 1,
1.616192, -0.520218, 1.729999, 1, 0, 0.2980392, 1,
1.647509, -2.338297, 2.885564, 1, 0, 0.2941177, 1,
1.657668, -0.2254915, 2.075145, 1, 0, 0.2862745, 1,
1.663849, 0.6919163, 2.025551, 1, 0, 0.282353, 1,
1.675336, -0.398019, 2.844137, 1, 0, 0.2745098, 1,
1.700252, -0.1539243, 3.871841, 1, 0, 0.2705882, 1,
1.720086, 0.05394468, 1.53131, 1, 0, 0.2627451, 1,
1.728385, -0.2890482, -0.0948117, 1, 0, 0.2588235, 1,
1.735123, 0.008311789, 0.2053401, 1, 0, 0.2509804, 1,
1.737226, 0.702646, 0.6179844, 1, 0, 0.2470588, 1,
1.757252, -0.2362211, 1.984322, 1, 0, 0.2392157, 1,
1.759251, 0.9669417, 0.637946, 1, 0, 0.2352941, 1,
1.788581, 0.5038659, 2.011802, 1, 0, 0.227451, 1,
1.789002, -0.9372333, 1.63489, 1, 0, 0.2235294, 1,
1.807943, 0.7490394, 1.198623, 1, 0, 0.2156863, 1,
1.827053, 0.7718602, -0.9221206, 1, 0, 0.2117647, 1,
1.844462, 0.3578802, 1.139238, 1, 0, 0.2039216, 1,
1.87717, 1.363062, -0.705987, 1, 0, 0.1960784, 1,
1.91991, -0.2238881, 0.09382161, 1, 0, 0.1921569, 1,
1.972335, 0.8837638, 1.480164, 1, 0, 0.1843137, 1,
1.978671, 2.290019, 1.194005, 1, 0, 0.1803922, 1,
1.995246, -0.3156246, 1.992391, 1, 0, 0.172549, 1,
1.995327, 0.2352737, 0.1266369, 1, 0, 0.1686275, 1,
2.003048, -0.2683499, 1.293656, 1, 0, 0.1607843, 1,
2.04545, -0.06895456, 2.081311, 1, 0, 0.1568628, 1,
2.0514, -1.657425, 0.8223658, 1, 0, 0.1490196, 1,
2.059601, -0.2778357, 0.447301, 1, 0, 0.145098, 1,
2.072028, -0.6282378, 1.63911, 1, 0, 0.1372549, 1,
2.07315, 0.8618619, 1.679217, 1, 0, 0.1333333, 1,
2.079624, -1.07389, 1.656908, 1, 0, 0.1254902, 1,
2.11983, -0.3071309, 2.206922, 1, 0, 0.1215686, 1,
2.128519, 1.290489, -0.04695474, 1, 0, 0.1137255, 1,
2.154241, -0.505596, 3.896986, 1, 0, 0.1098039, 1,
2.165354, 0.9847205, 1.082638, 1, 0, 0.1019608, 1,
2.173748, -0.2153146, 1.433124, 1, 0, 0.09411765, 1,
2.222538, -0.8297228, 2.121519, 1, 0, 0.09019608, 1,
2.240827, -0.4601396, 1.725216, 1, 0, 0.08235294, 1,
2.241086, 0.7794019, 0.5479479, 1, 0, 0.07843138, 1,
2.242666, 0.9181357, 2.594499, 1, 0, 0.07058824, 1,
2.254569, -1.08232, 1.342029, 1, 0, 0.06666667, 1,
2.279189, 0.5217964, 0.7610201, 1, 0, 0.05882353, 1,
2.281166, -0.5216713, 3.355732, 1, 0, 0.05490196, 1,
2.393174, -1.060189, 2.484726, 1, 0, 0.04705882, 1,
2.3969, -0.5810172, -0.8235382, 1, 0, 0.04313726, 1,
2.423666, 0.2603067, 2.993632, 1, 0, 0.03529412, 1,
2.560155, 1.018975, 0.3718006, 1, 0, 0.03137255, 1,
2.646813, -0.1955514, 0.4335107, 1, 0, 0.02352941, 1,
2.76007, -0.6946548, 2.292014, 1, 0, 0.01960784, 1,
2.821541, -0.6863781, 3.018587, 1, 0, 0.01176471, 1,
2.908117, -1.237288, 0.3208441, 1, 0, 0.007843138, 1
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
-0.4415334, -4.545784, -8.145205, 0, -0.5, 0.5, 0.5,
-0.4415334, -4.545784, -8.145205, 1, -0.5, 0.5, 0.5,
-0.4415334, -4.545784, -8.145205, 1, 1.5, 0.5, 0.5,
-0.4415334, -4.545784, -8.145205, 0, 1.5, 0.5, 0.5
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
-4.926715, -0.1843289, -8.145205, 0, -0.5, 0.5, 0.5,
-4.926715, -0.1843289, -8.145205, 1, -0.5, 0.5, 0.5,
-4.926715, -0.1843289, -8.145205, 1, 1.5, 0.5, 0.5,
-4.926715, -0.1843289, -8.145205, 0, 1.5, 0.5, 0.5
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
-4.926715, -4.545784, -0.004590511, 0, -0.5, 0.5, 0.5,
-4.926715, -4.545784, -0.004590511, 1, -0.5, 0.5, 0.5,
-4.926715, -4.545784, -0.004590511, 1, 1.5, 0.5, 0.5,
-4.926715, -4.545784, -0.004590511, 0, 1.5, 0.5, 0.5
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
-3, -3.539295, -6.266602,
2, -3.539295, -6.266602,
-3, -3.539295, -6.266602,
-3, -3.707043, -6.579702,
-2, -3.539295, -6.266602,
-2, -3.707043, -6.579702,
-1, -3.539295, -6.266602,
-1, -3.707043, -6.579702,
0, -3.539295, -6.266602,
0, -3.707043, -6.579702,
1, -3.539295, -6.266602,
1, -3.707043, -6.579702,
2, -3.539295, -6.266602,
2, -3.707043, -6.579702
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
-3, -4.04254, -7.205903, 0, -0.5, 0.5, 0.5,
-3, -4.04254, -7.205903, 1, -0.5, 0.5, 0.5,
-3, -4.04254, -7.205903, 1, 1.5, 0.5, 0.5,
-3, -4.04254, -7.205903, 0, 1.5, 0.5, 0.5,
-2, -4.04254, -7.205903, 0, -0.5, 0.5, 0.5,
-2, -4.04254, -7.205903, 1, -0.5, 0.5, 0.5,
-2, -4.04254, -7.205903, 1, 1.5, 0.5, 0.5,
-2, -4.04254, -7.205903, 0, 1.5, 0.5, 0.5,
-1, -4.04254, -7.205903, 0, -0.5, 0.5, 0.5,
-1, -4.04254, -7.205903, 1, -0.5, 0.5, 0.5,
-1, -4.04254, -7.205903, 1, 1.5, 0.5, 0.5,
-1, -4.04254, -7.205903, 0, 1.5, 0.5, 0.5,
0, -4.04254, -7.205903, 0, -0.5, 0.5, 0.5,
0, -4.04254, -7.205903, 1, -0.5, 0.5, 0.5,
0, -4.04254, -7.205903, 1, 1.5, 0.5, 0.5,
0, -4.04254, -7.205903, 0, 1.5, 0.5, 0.5,
1, -4.04254, -7.205903, 0, -0.5, 0.5, 0.5,
1, -4.04254, -7.205903, 1, -0.5, 0.5, 0.5,
1, -4.04254, -7.205903, 1, 1.5, 0.5, 0.5,
1, -4.04254, -7.205903, 0, 1.5, 0.5, 0.5,
2, -4.04254, -7.205903, 0, -0.5, 0.5, 0.5,
2, -4.04254, -7.205903, 1, -0.5, 0.5, 0.5,
2, -4.04254, -7.205903, 1, 1.5, 0.5, 0.5,
2, -4.04254, -7.205903, 0, 1.5, 0.5, 0.5
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
-3.891674, -3, -6.266602,
-3.891674, 3, -6.266602,
-3.891674, -3, -6.266602,
-4.06418, -3, -6.579702,
-3.891674, -2, -6.266602,
-4.06418, -2, -6.579702,
-3.891674, -1, -6.266602,
-4.06418, -1, -6.579702,
-3.891674, 0, -6.266602,
-4.06418, 0, -6.579702,
-3.891674, 1, -6.266602,
-4.06418, 1, -6.579702,
-3.891674, 2, -6.266602,
-4.06418, 2, -6.579702,
-3.891674, 3, -6.266602,
-4.06418, 3, -6.579702
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
-4.409194, -3, -7.205903, 0, -0.5, 0.5, 0.5,
-4.409194, -3, -7.205903, 1, -0.5, 0.5, 0.5,
-4.409194, -3, -7.205903, 1, 1.5, 0.5, 0.5,
-4.409194, -3, -7.205903, 0, 1.5, 0.5, 0.5,
-4.409194, -2, -7.205903, 0, -0.5, 0.5, 0.5,
-4.409194, -2, -7.205903, 1, -0.5, 0.5, 0.5,
-4.409194, -2, -7.205903, 1, 1.5, 0.5, 0.5,
-4.409194, -2, -7.205903, 0, 1.5, 0.5, 0.5,
-4.409194, -1, -7.205903, 0, -0.5, 0.5, 0.5,
-4.409194, -1, -7.205903, 1, -0.5, 0.5, 0.5,
-4.409194, -1, -7.205903, 1, 1.5, 0.5, 0.5,
-4.409194, -1, -7.205903, 0, 1.5, 0.5, 0.5,
-4.409194, 0, -7.205903, 0, -0.5, 0.5, 0.5,
-4.409194, 0, -7.205903, 1, -0.5, 0.5, 0.5,
-4.409194, 0, -7.205903, 1, 1.5, 0.5, 0.5,
-4.409194, 0, -7.205903, 0, 1.5, 0.5, 0.5,
-4.409194, 1, -7.205903, 0, -0.5, 0.5, 0.5,
-4.409194, 1, -7.205903, 1, -0.5, 0.5, 0.5,
-4.409194, 1, -7.205903, 1, 1.5, 0.5, 0.5,
-4.409194, 1, -7.205903, 0, 1.5, 0.5, 0.5,
-4.409194, 2, -7.205903, 0, -0.5, 0.5, 0.5,
-4.409194, 2, -7.205903, 1, -0.5, 0.5, 0.5,
-4.409194, 2, -7.205903, 1, 1.5, 0.5, 0.5,
-4.409194, 2, -7.205903, 0, 1.5, 0.5, 0.5,
-4.409194, 3, -7.205903, 0, -0.5, 0.5, 0.5,
-4.409194, 3, -7.205903, 1, -0.5, 0.5, 0.5,
-4.409194, 3, -7.205903, 1, 1.5, 0.5, 0.5,
-4.409194, 3, -7.205903, 0, 1.5, 0.5, 0.5
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
-3.891674, -3.539295, -6,
-3.891674, -3.539295, 6,
-3.891674, -3.539295, -6,
-4.06418, -3.707043, -6,
-3.891674, -3.539295, -4,
-4.06418, -3.707043, -4,
-3.891674, -3.539295, -2,
-4.06418, -3.707043, -2,
-3.891674, -3.539295, 0,
-4.06418, -3.707043, 0,
-3.891674, -3.539295, 2,
-4.06418, -3.707043, 2,
-3.891674, -3.539295, 4,
-4.06418, -3.707043, 4,
-3.891674, -3.539295, 6,
-4.06418, -3.707043, 6
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
"-6",
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
-4.409194, -4.04254, -6, 0, -0.5, 0.5, 0.5,
-4.409194, -4.04254, -6, 1, -0.5, 0.5, 0.5,
-4.409194, -4.04254, -6, 1, 1.5, 0.5, 0.5,
-4.409194, -4.04254, -6, 0, 1.5, 0.5, 0.5,
-4.409194, -4.04254, -4, 0, -0.5, 0.5, 0.5,
-4.409194, -4.04254, -4, 1, -0.5, 0.5, 0.5,
-4.409194, -4.04254, -4, 1, 1.5, 0.5, 0.5,
-4.409194, -4.04254, -4, 0, 1.5, 0.5, 0.5,
-4.409194, -4.04254, -2, 0, -0.5, 0.5, 0.5,
-4.409194, -4.04254, -2, 1, -0.5, 0.5, 0.5,
-4.409194, -4.04254, -2, 1, 1.5, 0.5, 0.5,
-4.409194, -4.04254, -2, 0, 1.5, 0.5, 0.5,
-4.409194, -4.04254, 0, 0, -0.5, 0.5, 0.5,
-4.409194, -4.04254, 0, 1, -0.5, 0.5, 0.5,
-4.409194, -4.04254, 0, 1, 1.5, 0.5, 0.5,
-4.409194, -4.04254, 0, 0, 1.5, 0.5, 0.5,
-4.409194, -4.04254, 2, 0, -0.5, 0.5, 0.5,
-4.409194, -4.04254, 2, 1, -0.5, 0.5, 0.5,
-4.409194, -4.04254, 2, 1, 1.5, 0.5, 0.5,
-4.409194, -4.04254, 2, 0, 1.5, 0.5, 0.5,
-4.409194, -4.04254, 4, 0, -0.5, 0.5, 0.5,
-4.409194, -4.04254, 4, 1, -0.5, 0.5, 0.5,
-4.409194, -4.04254, 4, 1, 1.5, 0.5, 0.5,
-4.409194, -4.04254, 4, 0, 1.5, 0.5, 0.5,
-4.409194, -4.04254, 6, 0, -0.5, 0.5, 0.5,
-4.409194, -4.04254, 6, 1, -0.5, 0.5, 0.5,
-4.409194, -4.04254, 6, 1, 1.5, 0.5, 0.5,
-4.409194, -4.04254, 6, 0, 1.5, 0.5, 0.5
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
-3.891674, -3.539295, -6.266602,
-3.891674, 3.170637, -6.266602,
-3.891674, -3.539295, 6.257421,
-3.891674, 3.170637, 6.257421,
-3.891674, -3.539295, -6.266602,
-3.891674, -3.539295, 6.257421,
-3.891674, 3.170637, -6.266602,
-3.891674, 3.170637, 6.257421,
-3.891674, -3.539295, -6.266602,
3.008607, -3.539295, -6.266602,
-3.891674, -3.539295, 6.257421,
3.008607, -3.539295, 6.257421,
-3.891674, 3.170637, -6.266602,
3.008607, 3.170637, -6.266602,
-3.891674, 3.170637, 6.257421,
3.008607, 3.170637, 6.257421,
3.008607, -3.539295, -6.266602,
3.008607, 3.170637, -6.266602,
3.008607, -3.539295, 6.257421,
3.008607, 3.170637, 6.257421,
3.008607, -3.539295, -6.266602,
3.008607, -3.539295, 6.257421,
3.008607, 3.170637, -6.266602,
3.008607, 3.170637, 6.257421
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
var radius = 8.434327;
var distance = 37.52527;
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
mvMatrix.translate( 0.4415334, 0.1843289, 0.004590511 );
mvMatrix.scale( 1.321593, 1.359084, 0.7281495 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.52527);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Cyhexatin<-read.table("Cyhexatin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.791184, 0.1416526, -1.59063, 0, 0, 1, 1, 1,
-3.438361, 0.7985022, -2.098253, 1, 0, 0, 1, 1,
-3.061396, 0.3698831, -0.8815358, 1, 0, 0, 1, 1,
-2.964539, 0.2387604, -1.875941, 1, 0, 0, 1, 1,
-2.952444, 0.8345029, -2.286649, 1, 0, 0, 1, 1,
-2.913191, 1.323352, -0.9733438, 1, 0, 0, 1, 1,
-2.874218, 0.3801782, -2.137449, 0, 0, 0, 1, 1,
-2.537082, 0.4076838, -1.286889, 0, 0, 0, 1, 1,
-2.536814, 0.364841, -1.291764, 0, 0, 0, 1, 1,
-2.526828, -1.573108, -0.3184389, 0, 0, 0, 1, 1,
-2.510721, 0.8544461, -1.070952, 0, 0, 0, 1, 1,
-2.499692, -0.1479206, -2.368676, 0, 0, 0, 1, 1,
-2.386807, 0.5136396, -0.7183796, 0, 0, 0, 1, 1,
-2.371467, 1.674468, -2.182513, 1, 1, 1, 1, 1,
-2.35506, -0.9328167, -3.334664, 1, 1, 1, 1, 1,
-2.229648, -1.045641, -2.925383, 1, 1, 1, 1, 1,
-2.190732, -0.2257112, -2.333341, 1, 1, 1, 1, 1,
-2.180038, 1.060976, -0.8033473, 1, 1, 1, 1, 1,
-2.169627, -1.318804, -3.092633, 1, 1, 1, 1, 1,
-2.154354, -0.5039877, -2.420342, 1, 1, 1, 1, 1,
-2.138659, 1.103813, -0.7108394, 1, 1, 1, 1, 1,
-2.098766, 0.3423169, 0.8754899, 1, 1, 1, 1, 1,
-2.094347, 0.06819113, -0.6244326, 1, 1, 1, 1, 1,
-2.081944, -0.3844697, -3.449493, 1, 1, 1, 1, 1,
-2.075855, 0.984201, -0.9920095, 1, 1, 1, 1, 1,
-2.074145, -0.1438056, -0.9588636, 1, 1, 1, 1, 1,
-2.036595, 0.2292224, -0.6555027, 1, 1, 1, 1, 1,
-2.029116, -0.1035274, -1.954578, 1, 1, 1, 1, 1,
-2.028262, 0.4832011, 0.5288988, 0, 0, 1, 1, 1,
-1.992803, -1.326812, -1.651846, 1, 0, 0, 1, 1,
-1.99249, 1.083323, -1.924133, 1, 0, 0, 1, 1,
-1.979546, -1.475297, -3.235427, 1, 0, 0, 1, 1,
-1.973115, -0.3473257, -1.684755, 1, 0, 0, 1, 1,
-1.94211, 0.2782988, -1.336485, 1, 0, 0, 1, 1,
-1.897178, 1.584386, -2.280035, 0, 0, 0, 1, 1,
-1.880757, 0.5945682, -0.1178778, 0, 0, 0, 1, 1,
-1.871472, -0.4629592, -1.880504, 0, 0, 0, 1, 1,
-1.871361, -1.092698, -1.308334, 0, 0, 0, 1, 1,
-1.843861, 0.04986388, -2.195302, 0, 0, 0, 1, 1,
-1.828453, 0.2676083, -1.762907, 0, 0, 0, 1, 1,
-1.776006, -1.295676, -3.291365, 0, 0, 0, 1, 1,
-1.753446, 0.9377727, 1.025464, 1, 1, 1, 1, 1,
-1.745349, -0.7241837, -3.001776, 1, 1, 1, 1, 1,
-1.736324, 0.4528592, -1.869582, 1, 1, 1, 1, 1,
-1.710943, 0.6611924, -0.2991495, 1, 1, 1, 1, 1,
-1.687987, 0.6386344, -0.7425932, 1, 1, 1, 1, 1,
-1.679271, -0.4948457, -2.575636, 1, 1, 1, 1, 1,
-1.668905, 0.1552103, -2.029986, 1, 1, 1, 1, 1,
-1.663801, -0.3177591, -2.440253, 1, 1, 1, 1, 1,
-1.66056, -0.2873542, -1.22284, 1, 1, 1, 1, 1,
-1.657942, -1.31429, -0.9556231, 1, 1, 1, 1, 1,
-1.65668, -0.1177775, 0.3103474, 1, 1, 1, 1, 1,
-1.655633, -1.027688, -2.661474, 1, 1, 1, 1, 1,
-1.650568, 0.1841958, 0.4146992, 1, 1, 1, 1, 1,
-1.643133, 0.6539975, -0.07152647, 1, 1, 1, 1, 1,
-1.631355, 0.9427429, -0.9629096, 1, 1, 1, 1, 1,
-1.62542, -0.2331179, -2.454529, 0, 0, 1, 1, 1,
-1.60854, -0.863575, -2.968302, 1, 0, 0, 1, 1,
-1.567552, 0.2176528, 0.1861136, 1, 0, 0, 1, 1,
-1.560245, 0.6520385, -1.905787, 1, 0, 0, 1, 1,
-1.544351, 0.5423129, -0.5716846, 1, 0, 0, 1, 1,
-1.543655, -0.5570216, -1.640882, 1, 0, 0, 1, 1,
-1.533232, -0.0131381, 0.2045833, 0, 0, 0, 1, 1,
-1.532237, -0.005277317, -0.3452251, 0, 0, 0, 1, 1,
-1.526426, 0.01068631, -2.986798, 0, 0, 0, 1, 1,
-1.524919, 0.7575493, 0.2814301, 0, 0, 0, 1, 1,
-1.508686, 0.9313087, -0.2090009, 0, 0, 0, 1, 1,
-1.503384, -0.5775956, -1.780042, 0, 0, 0, 1, 1,
-1.481164, -1.170935, -2.796023, 0, 0, 0, 1, 1,
-1.478687, 1.252937, -0.821684, 1, 1, 1, 1, 1,
-1.435017, 0.3580711, -0.7588077, 1, 1, 1, 1, 1,
-1.424464, -0.05551598, -1.676067, 1, 1, 1, 1, 1,
-1.421339, 0.6054712, -0.4187471, 1, 1, 1, 1, 1,
-1.419552, -2.469314, -2.623577, 1, 1, 1, 1, 1,
-1.413473, -0.3474532, -2.448902, 1, 1, 1, 1, 1,
-1.407758, 0.6407967, -2.551045, 1, 1, 1, 1, 1,
-1.396946, 2.173925, -3.33584, 1, 1, 1, 1, 1,
-1.390823, -0.7116389, -2.795722, 1, 1, 1, 1, 1,
-1.382646, 0.3752428, -0.8589997, 1, 1, 1, 1, 1,
-1.372842, -0.5706822, -2.00994, 1, 1, 1, 1, 1,
-1.372474, 0.2276496, -3.882959, 1, 1, 1, 1, 1,
-1.369101, 0.7418504, -2.086374, 1, 1, 1, 1, 1,
-1.366779, -0.3623594, -2.802734, 1, 1, 1, 1, 1,
-1.365124, -1.564443, -2.061005, 1, 1, 1, 1, 1,
-1.324177, 0.03929972, -2.357854, 0, 0, 1, 1, 1,
-1.317346, -1.795815, -2.11254, 1, 0, 0, 1, 1,
-1.308313, -0.5525688, -2.62027, 1, 0, 0, 1, 1,
-1.305551, 0.506756, -1.274735, 1, 0, 0, 1, 1,
-1.304381, 0.4015294, -1.990964, 1, 0, 0, 1, 1,
-1.302266, 1.020696, 0.009979131, 1, 0, 0, 1, 1,
-1.295707, -0.8837011, -2.283102, 0, 0, 0, 1, 1,
-1.292081, -1.238941, -2.909214, 0, 0, 0, 1, 1,
-1.287263, 0.05264505, -1.905202, 0, 0, 0, 1, 1,
-1.286474, 0.2311094, -0.2317088, 0, 0, 0, 1, 1,
-1.281987, -0.2529013, -1.059022, 0, 0, 0, 1, 1,
-1.278093, -0.8320848, -1.337393, 0, 0, 0, 1, 1,
-1.274276, 2.048773, -2.22689, 0, 0, 0, 1, 1,
-1.253027, 0.903653, -0.9532546, 1, 1, 1, 1, 1,
-1.251251, 1.187858, -0.941226, 1, 1, 1, 1, 1,
-1.250533, -0.414786, -2.991818, 1, 1, 1, 1, 1,
-1.250096, 1.052025, -1.603754, 1, 1, 1, 1, 1,
-1.239848, 0.6878224, -0.5345443, 1, 1, 1, 1, 1,
-1.234131, -1.162534, -2.149958, 1, 1, 1, 1, 1,
-1.229381, 0.6917139, -0.7947263, 1, 1, 1, 1, 1,
-1.226031, 0.1671516, -1.519494, 1, 1, 1, 1, 1,
-1.220925, -0.1417366, -1.631796, 1, 1, 1, 1, 1,
-1.218063, -0.9640206, -2.077806, 1, 1, 1, 1, 1,
-1.217251, 1.448607, -0.4619044, 1, 1, 1, 1, 1,
-1.214523, -0.6370952, -1.086465, 1, 1, 1, 1, 1,
-1.202417, -0.4840821, -4.249152, 1, 1, 1, 1, 1,
-1.196731, -0.0774391, -0.3910079, 1, 1, 1, 1, 1,
-1.193483, 0.6135986, 0.9162617, 1, 1, 1, 1, 1,
-1.192721, 0.1145426, -2.879681, 0, 0, 1, 1, 1,
-1.190964, 1.002473, -0.8212072, 1, 0, 0, 1, 1,
-1.172091, 0.06408602, -1.463069, 1, 0, 0, 1, 1,
-1.170428, -2.370117, -0.5469685, 1, 0, 0, 1, 1,
-1.160321, 0.1867521, -1.838555, 1, 0, 0, 1, 1,
-1.153277, -0.3232709, -3.849718, 1, 0, 0, 1, 1,
-1.141641, -0.06761508, -2.457605, 0, 0, 0, 1, 1,
-1.133108, 1.139978, -2.251848, 0, 0, 0, 1, 1,
-1.132717, -1.048772, -2.548117, 0, 0, 0, 1, 1,
-1.130607, -0.8645946, -0.5715284, 0, 0, 0, 1, 1,
-1.121753, -0.9566935, -2.323236, 0, 0, 0, 1, 1,
-1.100857, 0.2494286, -1.051597, 0, 0, 0, 1, 1,
-1.09239, -1.488445, -1.835264, 0, 0, 0, 1, 1,
-1.085526, 0.6459976, -1.059907, 1, 1, 1, 1, 1,
-1.080865, -1.52294, -1.800602, 1, 1, 1, 1, 1,
-1.079489, -1.551852, -4.234492, 1, 1, 1, 1, 1,
-1.078549, 0.2573037, -2.178477, 1, 1, 1, 1, 1,
-1.074696, 1.340552, -0.2451284, 1, 1, 1, 1, 1,
-1.064488, 1.229716, -1.051239, 1, 1, 1, 1, 1,
-1.060742, 0.3594438, 0.358399, 1, 1, 1, 1, 1,
-1.058251, -0.03827637, -2.061834, 1, 1, 1, 1, 1,
-1.05677, 0.05492313, -2.126246, 1, 1, 1, 1, 1,
-1.052145, 1.558705, 1.027013, 1, 1, 1, 1, 1,
-1.051789, -0.4075789, -2.434778, 1, 1, 1, 1, 1,
-1.045489, 0.1113159, -2.863973, 1, 1, 1, 1, 1,
-1.043282, -1.302752, -2.240529, 1, 1, 1, 1, 1,
-1.042374, -0.6141873, -1.281152, 1, 1, 1, 1, 1,
-1.041602, -0.3912939, -1.439223, 1, 1, 1, 1, 1,
-1.039476, -0.8082821, -2.212259, 0, 0, 1, 1, 1,
-1.036036, -0.3427168, -1.079902, 1, 0, 0, 1, 1,
-1.019374, -1.412667, -4.426323, 1, 0, 0, 1, 1,
-1.015074, 0.2941161, -3.374546, 1, 0, 0, 1, 1,
-1.012791, -1.14642, -2.704448, 1, 0, 0, 1, 1,
-1.010024, 0.07921851, -1.538604, 1, 0, 0, 1, 1,
-1.007871, -0.846554, -2.060144, 0, 0, 0, 1, 1,
-0.9932498, 1.233237, -0.09918743, 0, 0, 0, 1, 1,
-0.9928778, -1.419035, -2.197263, 0, 0, 0, 1, 1,
-0.992533, 0.5040716, -0.7219876, 0, 0, 0, 1, 1,
-0.9879379, 0.7474552, -1.005426, 0, 0, 0, 1, 1,
-0.9842312, -1.515868, -3.93422, 0, 0, 0, 1, 1,
-0.9827629, 0.5109387, 0.0871256, 0, 0, 0, 1, 1,
-0.9789256, 0.1989869, -0.3955969, 1, 1, 1, 1, 1,
-0.9745603, 0.4104837, -0.9417645, 1, 1, 1, 1, 1,
-0.9706273, 0.9278958, 0.216621, 1, 1, 1, 1, 1,
-0.9678251, -0.3307592, -0.777668, 1, 1, 1, 1, 1,
-0.9643115, -0.7024379, -0.7316667, 1, 1, 1, 1, 1,
-0.951678, -0.07219777, -3.1061, 1, 1, 1, 1, 1,
-0.9501832, 0.2813312, -1.319799, 1, 1, 1, 1, 1,
-0.944752, 0.3982807, -0.5087202, 1, 1, 1, 1, 1,
-0.9380757, 0.3923068, -2.213104, 1, 1, 1, 1, 1,
-0.9370782, 0.4719233, -3.117538, 1, 1, 1, 1, 1,
-0.9355212, 1.367965, -1.888556, 1, 1, 1, 1, 1,
-0.9260143, -0.4529819, -2.542685, 1, 1, 1, 1, 1,
-0.9259458, -0.1564651, -0.7960535, 1, 1, 1, 1, 1,
-0.9237563, -0.3445251, -0.1996609, 1, 1, 1, 1, 1,
-0.9218895, -0.5335284, -1.879208, 1, 1, 1, 1, 1,
-0.9209067, 0.179433, -3.147984, 0, 0, 1, 1, 1,
-0.9111906, -0.2892934, -3.284764, 1, 0, 0, 1, 1,
-0.9063939, -0.03290268, -1.994924, 1, 0, 0, 1, 1,
-0.906276, -0.02431899, -1.048974, 1, 0, 0, 1, 1,
-0.9044336, -0.3171816, -1.751272, 1, 0, 0, 1, 1,
-0.903052, 0.175658, -1.532551, 1, 0, 0, 1, 1,
-0.8992418, 0.1951811, -1.632993, 0, 0, 0, 1, 1,
-0.8969077, -0.6293271, -1.151726, 0, 0, 0, 1, 1,
-0.8941613, 0.5592557, -0.4200535, 0, 0, 0, 1, 1,
-0.8905249, -2.075029, -4.85767, 0, 0, 0, 1, 1,
-0.8878605, 0.9927462, -0.4282609, 0, 0, 0, 1, 1,
-0.8866704, -0.4801321, -1.261697, 0, 0, 0, 1, 1,
-0.8841653, -0.7625253, -2.875865, 0, 0, 0, 1, 1,
-0.884151, 0.09108897, -2.507128, 1, 1, 1, 1, 1,
-0.8745911, 0.1996035, -3.602688, 1, 1, 1, 1, 1,
-0.8743942, 0.7294828, -0.369365, 1, 1, 1, 1, 1,
-0.871051, -0.1924745, -1.874323, 1, 1, 1, 1, 1,
-0.8686943, -0.2818535, -0.875599, 1, 1, 1, 1, 1,
-0.8678134, 0.6211833, -0.1958853, 1, 1, 1, 1, 1,
-0.8670076, -0.2929641, -1.757372, 1, 1, 1, 1, 1,
-0.8637756, 0.5840315, -0.3910071, 1, 1, 1, 1, 1,
-0.86372, -2.065475, -4.005475, 1, 1, 1, 1, 1,
-0.8600574, -0.5843767, -2.649964, 1, 1, 1, 1, 1,
-0.8573284, 0.1658673, -1.264827, 1, 1, 1, 1, 1,
-0.854844, 0.6778291, -1.724262, 1, 1, 1, 1, 1,
-0.8533119, -0.01146433, -1.466923, 1, 1, 1, 1, 1,
-0.8510561, 0.4739855, -1.43958, 1, 1, 1, 1, 1,
-0.8504381, 1.259403, -3.084611, 1, 1, 1, 1, 1,
-0.8473773, 0.0618571, 0.0521188, 0, 0, 1, 1, 1,
-0.8447902, -0.294414, -0.6965963, 1, 0, 0, 1, 1,
-0.834888, 0.6544476, -1.116269, 1, 0, 0, 1, 1,
-0.8327076, 1.169636, -2.397122, 1, 0, 0, 1, 1,
-0.8306762, -1.352838, -2.23554, 1, 0, 0, 1, 1,
-0.8286821, 0.6867599, -0.5535253, 1, 0, 0, 1, 1,
-0.826348, -0.4758963, -1.604799, 0, 0, 0, 1, 1,
-0.8191399, -0.5320768, -3.05737, 0, 0, 0, 1, 1,
-0.8190695, 3.041317, -0.8319637, 0, 0, 0, 1, 1,
-0.8156773, 0.3324921, -1.840274, 0, 0, 0, 1, 1,
-0.8048003, 1.063923, -0.1260312, 0, 0, 0, 1, 1,
-0.7948777, -0.9599631, -2.731894, 0, 0, 0, 1, 1,
-0.7937923, 0.8783231, -3.130979, 0, 0, 0, 1, 1,
-0.7907631, -0.2675967, -1.813604, 1, 1, 1, 1, 1,
-0.7904228, 0.07132794, -0.2704191, 1, 1, 1, 1, 1,
-0.7903137, 1.585643, -0.8021536, 1, 1, 1, 1, 1,
-0.789471, -1.093426, -3.026336, 1, 1, 1, 1, 1,
-0.7869279, 0.04785808, -2.451941, 1, 1, 1, 1, 1,
-0.7835434, -0.6179954, -2.186417, 1, 1, 1, 1, 1,
-0.7800649, 0.2380104, -2.076338, 1, 1, 1, 1, 1,
-0.7799169, 0.8002834, -2.921133, 1, 1, 1, 1, 1,
-0.7793313, 0.256521, -1.168366, 1, 1, 1, 1, 1,
-0.7787121, 0.02807373, -1.705767, 1, 1, 1, 1, 1,
-0.7777946, 0.4262727, -1.471386, 1, 1, 1, 1, 1,
-0.7750531, -0.2789075, -1.663478, 1, 1, 1, 1, 1,
-0.7646798, 1.325251, 0.2897901, 1, 1, 1, 1, 1,
-0.7555312, 0.1946687, -1.568216, 1, 1, 1, 1, 1,
-0.7552751, 0.3404374, -0.325876, 1, 1, 1, 1, 1,
-0.7530321, 1.371976, 0.04916077, 0, 0, 1, 1, 1,
-0.7516736, 0.5744833, 0.8379728, 1, 0, 0, 1, 1,
-0.7494878, -0.9446527, -1.377656, 1, 0, 0, 1, 1,
-0.7490683, -0.6446013, -2.943849, 1, 0, 0, 1, 1,
-0.7446805, -0.8932119, -3.798209, 1, 0, 0, 1, 1,
-0.7330108, 1.668737, 0.601392, 1, 0, 0, 1, 1,
-0.7254753, 0.1166015, -2.764066, 0, 0, 0, 1, 1,
-0.7216141, -0.8000233, -2.129058, 0, 0, 0, 1, 1,
-0.7189234, 1.382705, 1.311731, 0, 0, 0, 1, 1,
-0.7184755, -1.501346, -2.176739, 0, 0, 0, 1, 1,
-0.7168475, 0.2843548, -0.6391784, 0, 0, 0, 1, 1,
-0.7147307, 0.1693356, -2.93847, 0, 0, 0, 1, 1,
-0.7103275, 0.9197335, -1.235986, 0, 0, 0, 1, 1,
-0.707216, -1.781364, -2.511755, 1, 1, 1, 1, 1,
-0.7037084, 0.6235116, -0.6451923, 1, 1, 1, 1, 1,
-0.6985359, -1.670677, -0.3629847, 1, 1, 1, 1, 1,
-0.6948311, -0.1551565, -2.269331, 1, 1, 1, 1, 1,
-0.6931785, 0.8488498, 0.3311373, 1, 1, 1, 1, 1,
-0.6864499, 0.6656076, -0.3399127, 1, 1, 1, 1, 1,
-0.6848813, 0.9067962, -0.7616206, 1, 1, 1, 1, 1,
-0.6754104, -0.4229493, -2.055021, 1, 1, 1, 1, 1,
-0.6753235, -1.780502, -2.146594, 1, 1, 1, 1, 1,
-0.6731781, -1.135646, -1.896047, 1, 1, 1, 1, 1,
-0.6731068, 1.035016, -0.6693755, 1, 1, 1, 1, 1,
-0.6667895, -0.591633, -3.392667, 1, 1, 1, 1, 1,
-0.662012, -0.3947563, -2.223059, 1, 1, 1, 1, 1,
-0.6556309, -0.7074671, -3.900262, 1, 1, 1, 1, 1,
-0.6550249, -0.222442, -2.608603, 1, 1, 1, 1, 1,
-0.6547961, -0.4941883, -1.695669, 0, 0, 1, 1, 1,
-0.6532204, -0.7575084, -2.670122, 1, 0, 0, 1, 1,
-0.6498543, 0.4488642, -2.646683, 1, 0, 0, 1, 1,
-0.6476319, -2.562584, -3.643478, 1, 0, 0, 1, 1,
-0.6461803, 0.9249664, 1.113526, 1, 0, 0, 1, 1,
-0.6446329, 0.5128699, -1.621108, 1, 0, 0, 1, 1,
-0.6402227, -0.7760606, -3.154605, 0, 0, 0, 1, 1,
-0.6390585, 2.491973, -0.1384364, 0, 0, 0, 1, 1,
-0.6384968, -0.1173953, -1.096438, 0, 0, 0, 1, 1,
-0.6384178, -0.2660007, -2.091237, 0, 0, 0, 1, 1,
-0.6380532, 0.3945534, -1.354583, 0, 0, 0, 1, 1,
-0.6373765, 1.076843, -1.291996, 0, 0, 0, 1, 1,
-0.6293057, 1.420929, -0.4496545, 0, 0, 0, 1, 1,
-0.6286423, -1.760814, -3.001533, 1, 1, 1, 1, 1,
-0.6200779, 0.9917449, -0.65591, 1, 1, 1, 1, 1,
-0.6121456, 0.4372621, -0.8020331, 1, 1, 1, 1, 1,
-0.6070322, 0.3227676, -2.883318, 1, 1, 1, 1, 1,
-0.5995361, 0.7982661, 1.739611, 1, 1, 1, 1, 1,
-0.5981856, 0.6441531, -0.17664, 1, 1, 1, 1, 1,
-0.594212, 1.138205, 0.09054104, 1, 1, 1, 1, 1,
-0.5904521, 1.46445, -0.2035876, 1, 1, 1, 1, 1,
-0.5898961, -0.6074107, -2.890275, 1, 1, 1, 1, 1,
-0.5890829, 0.9728001, -0.6255469, 1, 1, 1, 1, 1,
-0.588892, 1.476249, -1.386548, 1, 1, 1, 1, 1,
-0.5880718, -0.7545726, -3.172928, 1, 1, 1, 1, 1,
-0.5844465, -0.6235495, -0.7839365, 1, 1, 1, 1, 1,
-0.5831171, 0.2228939, -0.7811047, 1, 1, 1, 1, 1,
-0.5816343, -0.9878114, -1.955457, 1, 1, 1, 1, 1,
-0.5803012, 0.2796564, -0.8024646, 0, 0, 1, 1, 1,
-0.5799046, 0.3201977, -0.3561998, 1, 0, 0, 1, 1,
-0.5781597, 0.9602526, -1.222233, 1, 0, 0, 1, 1,
-0.5773587, 0.9050305, 0.3156427, 1, 0, 0, 1, 1,
-0.5766357, 0.7855468, -0.8342638, 1, 0, 0, 1, 1,
-0.5753127, 1.186027, -0.5873334, 1, 0, 0, 1, 1,
-0.5748052, 1.096418, -2.291532, 0, 0, 0, 1, 1,
-0.5728409, 0.9577472, 0.5987202, 0, 0, 0, 1, 1,
-0.5719017, 0.8522044, 0.2408256, 0, 0, 0, 1, 1,
-0.5651631, 0.02225037, -0.94148, 0, 0, 0, 1, 1,
-0.5600707, -0.9623706, -3.793005, 0, 0, 0, 1, 1,
-0.5517496, -2.424522, -2.312599, 0, 0, 0, 1, 1,
-0.5517374, -2.571013, -2.370695, 0, 0, 0, 1, 1,
-0.5493513, 0.4503997, -1.80616, 1, 1, 1, 1, 1,
-0.549184, -0.8007317, -2.578169, 1, 1, 1, 1, 1,
-0.5467861, 0.3306082, -0.7575775, 1, 1, 1, 1, 1,
-0.5465186, 2.983511, -0.8024046, 1, 1, 1, 1, 1,
-0.5451534, -0.4449801, -1.923573, 1, 1, 1, 1, 1,
-0.5436685, 1.532566, -0.5203149, 1, 1, 1, 1, 1,
-0.5414631, 1.076487, -0.2848522, 1, 1, 1, 1, 1,
-0.5366606, -0.6278352, -2.728154, 1, 1, 1, 1, 1,
-0.5318182, -1.259354, -2.879081, 1, 1, 1, 1, 1,
-0.5291693, -0.8393656, -2.195818, 1, 1, 1, 1, 1,
-0.5284134, 0.1378676, 0.0404895, 1, 1, 1, 1, 1,
-0.5283211, -0.2830188, -2.493242, 1, 1, 1, 1, 1,
-0.5277364, -0.9336651, -1.339087, 1, 1, 1, 1, 1,
-0.5225633, -1.687763, -1.524921, 1, 1, 1, 1, 1,
-0.5216462, -1.319895, -2.484037, 1, 1, 1, 1, 1,
-0.5170047, 0.9150814, -0.2448391, 0, 0, 1, 1, 1,
-0.5116844, 0.3828168, -0.09297889, 1, 0, 0, 1, 1,
-0.5072033, -1.791046, -1.081973, 1, 0, 0, 1, 1,
-0.5068054, 0.9587892, -2.086349, 1, 0, 0, 1, 1,
-0.5046887, 2.046649, -1.515186, 1, 0, 0, 1, 1,
-0.5046853, 0.7620719, -2.680911, 1, 0, 0, 1, 1,
-0.491582, -0.07896852, -2.726354, 0, 0, 0, 1, 1,
-0.4889599, -0.2208991, -0.6751511, 0, 0, 0, 1, 1,
-0.4853041, 0.2219363, -1.902923, 0, 0, 0, 1, 1,
-0.4834872, -0.5383711, -3.53887, 0, 0, 0, 1, 1,
-0.4803978, 0.515763, -1.03739, 0, 0, 0, 1, 1,
-0.4789569, 0.5448485, -0.5576599, 0, 0, 0, 1, 1,
-0.4765021, -0.1595569, -0.7923371, 0, 0, 0, 1, 1,
-0.4761394, -2.216874, -3.306253, 1, 1, 1, 1, 1,
-0.4751419, -0.2927139, -2.414984, 1, 1, 1, 1, 1,
-0.4612417, 0.7229557, 0.3487417, 1, 1, 1, 1, 1,
-0.4582011, 0.8958613, -1.358618, 1, 1, 1, 1, 1,
-0.4539016, -0.6551363, -2.979572, 1, 1, 1, 1, 1,
-0.4453935, -0.1263941, -3.202892, 1, 1, 1, 1, 1,
-0.4448716, -1.409486, -4.135025, 1, 1, 1, 1, 1,
-0.4448215, 0.04739629, 0.06567894, 1, 1, 1, 1, 1,
-0.4416007, -0.67002, -1.860494, 1, 1, 1, 1, 1,
-0.4387148, 0.2062225, -1.000601, 1, 1, 1, 1, 1,
-0.4373885, -0.2604057, -3.963979, 1, 1, 1, 1, 1,
-0.4339361, 0.4773323, -0.9708292, 1, 1, 1, 1, 1,
-0.4332363, 0.2734573, -1.246278, 1, 1, 1, 1, 1,
-0.4314639, 0.2108756, -2.296919, 1, 1, 1, 1, 1,
-0.4279492, -0.7125253, -1.529398, 1, 1, 1, 1, 1,
-0.4149725, -0.7496493, -1.499795, 0, 0, 1, 1, 1,
-0.4098222, 0.1864167, -1.149978, 1, 0, 0, 1, 1,
-0.4080492, -1.770053, -2.041713, 1, 0, 0, 1, 1,
-0.4074548, -1.141315, -3.07323, 1, 0, 0, 1, 1,
-0.4038752, -0.2825431, -1.430922, 1, 0, 0, 1, 1,
-0.3985241, 0.7172143, 0.6122051, 1, 0, 0, 1, 1,
-0.3975459, -0.7464564, -2.018802, 0, 0, 0, 1, 1,
-0.3920655, -2.345873, -2.026382, 0, 0, 0, 1, 1,
-0.3889227, 0.383008, -1.944197, 0, 0, 0, 1, 1,
-0.3859074, 1.016604, -0.9515173, 0, 0, 0, 1, 1,
-0.3851206, 1.191393, -0.8559256, 0, 0, 0, 1, 1,
-0.3833099, -0.8129606, -3.903284, 0, 0, 0, 1, 1,
-0.3815593, -0.4267581, -4.235635, 0, 0, 0, 1, 1,
-0.373755, -0.08957617, -1.703374, 1, 1, 1, 1, 1,
-0.3689162, -0.6637462, -2.532579, 1, 1, 1, 1, 1,
-0.3671499, 1.416015, 1.696989, 1, 1, 1, 1, 1,
-0.3640279, -0.7332556, -2.366868, 1, 1, 1, 1, 1,
-0.3618602, -1.024575, -2.483306, 1, 1, 1, 1, 1,
-0.360828, -0.5133713, -4.101266, 1, 1, 1, 1, 1,
-0.3607457, 0.20253, -1.948857, 1, 1, 1, 1, 1,
-0.3602035, 1.064977, -0.7908159, 1, 1, 1, 1, 1,
-0.3578053, 0.2511362, -0.4119716, 1, 1, 1, 1, 1,
-0.3532947, 0.004922253, -0.2289744, 1, 1, 1, 1, 1,
-0.3530506, 0.001618475, -2.800568, 1, 1, 1, 1, 1,
-0.351191, -1.13251, -3.220491, 1, 1, 1, 1, 1,
-0.3436223, 1.376527, 0.1795457, 1, 1, 1, 1, 1,
-0.3401402, -0.5661972, -3.228929, 1, 1, 1, 1, 1,
-0.3388736, 1.194209, -0.2704062, 1, 1, 1, 1, 1,
-0.3376816, 0.2906671, -2.079525, 0, 0, 1, 1, 1,
-0.3318631, 1.799264, -0.1483476, 1, 0, 0, 1, 1,
-0.3274469, -0.04561655, -3.028276, 1, 0, 0, 1, 1,
-0.326052, 1.387243, 1.591618, 1, 0, 0, 1, 1,
-0.3249514, -0.09758706, -3.218059, 1, 0, 0, 1, 1,
-0.3232837, 1.26085, 0.3005216, 1, 0, 0, 1, 1,
-0.3225566, 0.8667851, -1.537018, 0, 0, 0, 1, 1,
-0.3215155, 0.1316404, -2.032406, 0, 0, 0, 1, 1,
-0.3207623, 0.3738197, -1.181951, 0, 0, 0, 1, 1,
-0.3196487, -1.76377, -2.756495, 0, 0, 0, 1, 1,
-0.3167282, 2.053775, 0.3452531, 0, 0, 0, 1, 1,
-0.3164711, -0.5201093, -2.355395, 0, 0, 0, 1, 1,
-0.3107226, -0.06252304, -3.541029, 0, 0, 0, 1, 1,
-0.308808, -0.06787855, -1.913387, 1, 1, 1, 1, 1,
-0.3045728, -0.511, -2.372697, 1, 1, 1, 1, 1,
-0.3029338, 0.976658, -0.5721395, 1, 1, 1, 1, 1,
-0.2986442, 1.31459, -0.3320236, 1, 1, 1, 1, 1,
-0.2983813, 3.072919, -1.122818, 1, 1, 1, 1, 1,
-0.2974693, -0.6814302, -3.209037, 1, 1, 1, 1, 1,
-0.2964236, -1.876061, -3.708428, 1, 1, 1, 1, 1,
-0.2961373, 0.8684828, -0.4600882, 1, 1, 1, 1, 1,
-0.2959689, -0.1626213, -1.872245, 1, 1, 1, 1, 1,
-0.2954446, 0.2213381, -1.025368, 1, 1, 1, 1, 1,
-0.2911655, 1.626831, -0.1146132, 1, 1, 1, 1, 1,
-0.2845378, -0.255667, -2.878675, 1, 1, 1, 1, 1,
-0.2827678, 1.645694, 1.535232, 1, 1, 1, 1, 1,
-0.2799928, -0.1762048, -2.814372, 1, 1, 1, 1, 1,
-0.2794688, -1.656982, -3.992067, 1, 1, 1, 1, 1,
-0.2756141, 0.9060381, -0.6668131, 0, 0, 1, 1, 1,
-0.2725358, -0.2773922, -4.028391, 1, 0, 0, 1, 1,
-0.2723689, 0.8439157, -0.1301237, 1, 0, 0, 1, 1,
-0.2713902, -1.074374, -2.600213, 1, 0, 0, 1, 1,
-0.2711157, 0.4490447, -0.3641039, 1, 0, 0, 1, 1,
-0.2704768, -0.03565262, -0.329232, 1, 0, 0, 1, 1,
-0.2678009, 2.235871, -1.433048, 0, 0, 0, 1, 1,
-0.2670881, -0.1851488, -3.690548, 0, 0, 0, 1, 1,
-0.2658554, 0.8614177, 0.9385294, 0, 0, 0, 1, 1,
-0.265168, 1.996083, -0.2001974, 0, 0, 0, 1, 1,
-0.2603776, 0.1594766, -1.873148, 0, 0, 0, 1, 1,
-0.2602564, 0.8847703, -0.006990603, 0, 0, 0, 1, 1,
-0.2574377, 0.3281453, -0.8358347, 0, 0, 0, 1, 1,
-0.2508264, -0.9783494, -3.216513, 1, 1, 1, 1, 1,
-0.2489658, -0.4174056, -1.636824, 1, 1, 1, 1, 1,
-0.2439778, -1.122448, -4.614521, 1, 1, 1, 1, 1,
-0.2274864, -0.6589736, -0.893286, 1, 1, 1, 1, 1,
-0.2270149, -1.209816, -1.701619, 1, 1, 1, 1, 1,
-0.2270053, 0.9826165, 0.9919988, 1, 1, 1, 1, 1,
-0.2263691, -0.6220506, -3.310381, 1, 1, 1, 1, 1,
-0.2247738, 0.01424105, -0.984389, 1, 1, 1, 1, 1,
-0.224004, 1.052099, 0.03099371, 1, 1, 1, 1, 1,
-0.2226455, -1.994523, -2.981062, 1, 1, 1, 1, 1,
-0.2218195, -1.804799, -5.111296, 1, 1, 1, 1, 1,
-0.2193575, 0.07184663, -1.523755, 1, 1, 1, 1, 1,
-0.2172941, 0.247446, 0.2158161, 1, 1, 1, 1, 1,
-0.2164476, 0.0687741, -0.9488724, 1, 1, 1, 1, 1,
-0.2163739, 1.159556, 0.2278818, 1, 1, 1, 1, 1,
-0.213156, -1.096024, -2.934438, 0, 0, 1, 1, 1,
-0.2083483, -0.497364, -4.981613, 1, 0, 0, 1, 1,
-0.2073265, -1.645519, -3.688123, 1, 0, 0, 1, 1,
-0.2011243, -0.4841517, -3.208959, 1, 0, 0, 1, 1,
-0.2002946, -0.9677456, -4.328608, 1, 0, 0, 1, 1,
-0.1928694, -0.9578925, -4.22441, 1, 0, 0, 1, 1,
-0.1905677, 1.291113, -3.379108, 0, 0, 0, 1, 1,
-0.1817166, 1.201855, -1.005377, 0, 0, 0, 1, 1,
-0.1786678, 1.331567, -1.028327, 0, 0, 0, 1, 1,
-0.1754545, 0.8958968, 0.2583379, 0, 0, 0, 1, 1,
-0.1706849, 0.5455691, 0.1624396, 0, 0, 0, 1, 1,
-0.1693083, 0.5729084, -0.7035662, 0, 0, 0, 1, 1,
-0.1692488, 2.016851, 1.377025, 0, 0, 0, 1, 1,
-0.1648656, 0.5145909, -0.2421391, 1, 1, 1, 1, 1,
-0.1640307, 0.01371779, -0.8415806, 1, 1, 1, 1, 1,
-0.160794, -0.553286, -2.685172, 1, 1, 1, 1, 1,
-0.1607924, -0.6897197, -4.090729, 1, 1, 1, 1, 1,
-0.1600618, 0.7098361, 0.6062815, 1, 1, 1, 1, 1,
-0.1551666, 0.1784434, -1.489099, 1, 1, 1, 1, 1,
-0.154873, 0.1161237, -0.0848885, 1, 1, 1, 1, 1,
-0.1509202, -0.8545418, -2.508381, 1, 1, 1, 1, 1,
-0.1487993, -0.3826077, -3.708216, 1, 1, 1, 1, 1,
-0.1430101, -0.7464637, -1.683573, 1, 1, 1, 1, 1,
-0.1393598, -0.6837871, -2.964753, 1, 1, 1, 1, 1,
-0.1386183, 1.110885, -0.3920842, 1, 1, 1, 1, 1,
-0.1381667, -0.4348969, -2.058561, 1, 1, 1, 1, 1,
-0.133628, -2.162055, -2.210043, 1, 1, 1, 1, 1,
-0.1333565, 1.271162, 0.07090373, 1, 1, 1, 1, 1,
-0.1318703, 0.3961678, -0.8276881, 0, 0, 1, 1, 1,
-0.1316442, -0.6739653, -3.719116, 1, 0, 0, 1, 1,
-0.1286482, -0.1218012, -3.011843, 1, 0, 0, 1, 1,
-0.1280606, 0.2179414, -1.408547, 1, 0, 0, 1, 1,
-0.1213707, -1.0333, -2.346056, 1, 0, 0, 1, 1,
-0.1209893, -2.108373, -6.084213, 1, 0, 0, 1, 1,
-0.1160033, -2.22305, -3.161772, 0, 0, 0, 1, 1,
-0.1128603, 0.02995278, -0.9603407, 0, 0, 0, 1, 1,
-0.1114572, -0.5158903, -2.918782, 0, 0, 0, 1, 1,
-0.1068711, -0.7252265, -2.822685, 0, 0, 0, 1, 1,
-0.1021407, 0.2305519, 0.1192457, 0, 0, 0, 1, 1,
-0.09696124, 0.8043883, -0.713076, 0, 0, 0, 1, 1,
-0.0950997, -0.4483449, -1.446393, 0, 0, 0, 1, 1,
-0.09341861, -1.007196, -2.068306, 1, 1, 1, 1, 1,
-0.0913471, 1.520135, -1.059616, 1, 1, 1, 1, 1,
-0.09026872, -2.061248, -2.274239, 1, 1, 1, 1, 1,
-0.08546015, -0.6474299, -1.667448, 1, 1, 1, 1, 1,
-0.08498176, -1.047307, -6.026329, 1, 1, 1, 1, 1,
-0.06688112, 0.7534409, -2.061035, 1, 1, 1, 1, 1,
-0.06625463, -0.4055906, -1.292825, 1, 1, 1, 1, 1,
-0.06321544, 1.231479, -1.1183, 1, 1, 1, 1, 1,
-0.06246673, 0.2325428, -1.261964, 1, 1, 1, 1, 1,
-0.06238074, 0.6005048, 0.02744071, 1, 1, 1, 1, 1,
-0.05956982, -0.4912775, -1.191465, 1, 1, 1, 1, 1,
-0.058994, 1.254509, 0.436381, 1, 1, 1, 1, 1,
-0.05472229, 0.1010399, -0.2813625, 1, 1, 1, 1, 1,
-0.05119781, 0.2060514, -0.373093, 1, 1, 1, 1, 1,
-0.04473744, 0.1914106, 0.2121699, 1, 1, 1, 1, 1,
-0.04401461, 0.3672302, -0.3281735, 0, 0, 1, 1, 1,
-0.04233126, -0.6237137, -2.386971, 1, 0, 0, 1, 1,
-0.03947986, 1.123129, 0.3054695, 1, 0, 0, 1, 1,
-0.0375932, 2.516892, -0.5008459, 1, 0, 0, 1, 1,
-0.03743507, 0.7262485, 0.7662275, 1, 0, 0, 1, 1,
-0.0348005, -2.37877, -2.031902, 1, 0, 0, 1, 1,
-0.0333316, -0.8066327, -2.095721, 0, 0, 0, 1, 1,
-0.03298547, 1.940463, 0.01882188, 0, 0, 0, 1, 1,
-0.02954024, -0.2450735, -4.439563, 0, 0, 0, 1, 1,
-0.02901302, 0.04228588, -1.077565, 0, 0, 0, 1, 1,
-0.0285286, 0.4691462, 1.221731, 0, 0, 0, 1, 1,
-0.02453767, 1.436338, 1.700259, 0, 0, 0, 1, 1,
-0.02185199, 1.419598, -1.045419, 0, 0, 0, 1, 1,
-0.0218129, -2.778213, -4.345189, 1, 1, 1, 1, 1,
-0.01860325, -0.3574035, -1.647908, 1, 1, 1, 1, 1,
-0.01709492, 0.5547462, -1.157924, 1, 1, 1, 1, 1,
-0.01623998, 0.3031042, -0.2811242, 1, 1, 1, 1, 1,
-0.01300202, -0.6590807, -3.699102, 1, 1, 1, 1, 1,
-0.01294914, -0.9615653, -3.527864, 1, 1, 1, 1, 1,
-0.01218986, 0.370462, -1.038807, 1, 1, 1, 1, 1,
-0.01212585, 0.3951876, 0.9156909, 1, 1, 1, 1, 1,
-0.01068861, 0.5249406, -0.6596646, 1, 1, 1, 1, 1,
-0.008074534, -0.9194744, -2.817604, 1, 1, 1, 1, 1,
-0.007420645, -0.833716, -2.283308, 1, 1, 1, 1, 1,
-0.006110183, 0.5365826, 0.6378105, 1, 1, 1, 1, 1,
-0.004971199, 1.429503, -1.657035, 1, 1, 1, 1, 1,
0.0006643425, 0.7035367, -0.1716531, 1, 1, 1, 1, 1,
0.001580797, 0.2744221, 0.8833612, 1, 1, 1, 1, 1,
0.00381606, 2.204982, 0.5502552, 0, 0, 1, 1, 1,
0.004417615, 1.316741, -0.3214665, 1, 0, 0, 1, 1,
0.01080868, 0.6426179, -2.561313, 1, 0, 0, 1, 1,
0.01178572, -0.7581076, 4.938024, 1, 0, 0, 1, 1,
0.01263924, -0.02725042, 3.257568, 1, 0, 0, 1, 1,
0.01554797, 0.08204489, -0.4289238, 1, 0, 0, 1, 1,
0.01613364, 1.34341, -0.6250022, 0, 0, 0, 1, 1,
0.01696539, 0.2257944, -0.8476064, 0, 0, 0, 1, 1,
0.01735524, 1.233125, -0.5448231, 0, 0, 0, 1, 1,
0.01818825, 0.2566402, -0.600238, 0, 0, 0, 1, 1,
0.01838616, -0.2689622, 3.638936, 0, 0, 0, 1, 1,
0.01934939, -1.140749, 4.659301, 0, 0, 0, 1, 1,
0.02213393, 2.255331, -1.141978, 0, 0, 0, 1, 1,
0.02285989, 1.21315, 0.7194445, 1, 1, 1, 1, 1,
0.02371607, 0.2352721, -1.671356, 1, 1, 1, 1, 1,
0.02950649, 0.08406783, 1.521208, 1, 1, 1, 1, 1,
0.03117838, 0.4417037, -1.955331, 1, 1, 1, 1, 1,
0.03290155, 1.703662, -0.4445105, 1, 1, 1, 1, 1,
0.03404887, 0.5279266, -2.083135, 1, 1, 1, 1, 1,
0.03484009, 0.5231224, -0.4446522, 1, 1, 1, 1, 1,
0.0364503, -0.7264677, 3.990897, 1, 1, 1, 1, 1,
0.03759769, 1.555074, 0.03385771, 1, 1, 1, 1, 1,
0.03796736, -1.309562, 4.132328, 1, 1, 1, 1, 1,
0.04008753, -0.2331212, 3.6283, 1, 1, 1, 1, 1,
0.04144325, -1.474515, 1.123383, 1, 1, 1, 1, 1,
0.04315904, -0.5657601, 2.375502, 1, 1, 1, 1, 1,
0.04499778, 0.368926, -0.9040692, 1, 1, 1, 1, 1,
0.04657694, 0.9687167, 0.6114424, 1, 1, 1, 1, 1,
0.05562508, 0.559058, -0.0909792, 0, 0, 1, 1, 1,
0.05852574, -0.168734, 3.785083, 1, 0, 0, 1, 1,
0.06044691, -0.4458443, 3.043517, 1, 0, 0, 1, 1,
0.06305052, 0.2199997, -0.2261178, 1, 0, 0, 1, 1,
0.06558485, -0.4939918, 4.456086, 1, 0, 0, 1, 1,
0.06974181, 0.7826926, -0.9734138, 1, 0, 0, 1, 1,
0.07046958, -0.3657306, 2.122587, 0, 0, 0, 1, 1,
0.07177152, 0.751194, -0.4265434, 0, 0, 0, 1, 1,
0.07398053, -1.426662, 5.239843, 0, 0, 0, 1, 1,
0.0765574, -0.7204694, 1.521466, 0, 0, 0, 1, 1,
0.07794324, -0.3989328, 1.321902, 0, 0, 0, 1, 1,
0.08219958, 0.3553017, 0.2999418, 0, 0, 0, 1, 1,
0.08265781, -0.9770901, 1.40433, 0, 0, 0, 1, 1,
0.08378869, 0.7950373, -0.9882983, 1, 1, 1, 1, 1,
0.08436478, 2.848977, -0.2470322, 1, 1, 1, 1, 1,
0.0846242, 0.6795877, 1.100865, 1, 1, 1, 1, 1,
0.08961334, 0.6018276, -0.6969676, 1, 1, 1, 1, 1,
0.09046376, -0.5853323, 4.382399, 1, 1, 1, 1, 1,
0.0914572, 0.21327, 2.216759, 1, 1, 1, 1, 1,
0.09396699, 1.071448, 1.770803, 1, 1, 1, 1, 1,
0.09582578, -0.7541757, 2.982272, 1, 1, 1, 1, 1,
0.09625635, 0.798349, 1.875298, 1, 1, 1, 1, 1,
0.09690615, -0.4557005, 2.897128, 1, 1, 1, 1, 1,
0.0973414, -0.8955508, 3.089276, 1, 1, 1, 1, 1,
0.1007943, -1.183139, 2.545928, 1, 1, 1, 1, 1,
0.1013201, 0.002114723, 0.8974433, 1, 1, 1, 1, 1,
0.1063224, -1.466255, 6.075032, 1, 1, 1, 1, 1,
0.1071399, -0.5151445, 2.195903, 1, 1, 1, 1, 1,
0.1074755, 0.4366133, -0.4231384, 0, 0, 1, 1, 1,
0.1088919, 0.5296843, -0.01886052, 1, 0, 0, 1, 1,
0.1108891, -1.084039, 0.7980419, 1, 0, 0, 1, 1,
0.1122142, 0.8700468, 0.45585, 1, 0, 0, 1, 1,
0.1141506, -0.2199216, 2.03962, 1, 0, 0, 1, 1,
0.1280382, -0.1862935, 2.552552, 1, 0, 0, 1, 1,
0.1302863, -0.8787681, 3.843342, 0, 0, 0, 1, 1,
0.1302894, 0.2169556, 2.014956, 0, 0, 0, 1, 1,
0.1332648, -1.302505, 3.040279, 0, 0, 0, 1, 1,
0.1352383, 0.6068749, -0.4916409, 0, 0, 0, 1, 1,
0.1363412, 0.2165852, -0.6102896, 0, 0, 0, 1, 1,
0.1372289, 1.165863, 0.4961106, 0, 0, 0, 1, 1,
0.1382565, -0.4891693, 3.510293, 0, 0, 0, 1, 1,
0.1418308, 0.94744, -0.8092006, 1, 1, 1, 1, 1,
0.1418931, -0.13007, 1.684233, 1, 1, 1, 1, 1,
0.1434936, 0.5911405, 0.5429966, 1, 1, 1, 1, 1,
0.1444212, 1.805585, -2.026534, 1, 1, 1, 1, 1,
0.1457789, -0.4716719, 4.517807, 1, 1, 1, 1, 1,
0.1475112, -0.6229727, 2.899607, 1, 1, 1, 1, 1,
0.1479895, 0.7547582, -0.2987804, 1, 1, 1, 1, 1,
0.1612608, -1.941906, 3.930006, 1, 1, 1, 1, 1,
0.1618319, -1.538208, 1.968544, 1, 1, 1, 1, 1,
0.1620281, -1.087936, 2.078922, 1, 1, 1, 1, 1,
0.1640707, 0.2995237, -0.1504413, 1, 1, 1, 1, 1,
0.1712423, -1.443171, 1.255292, 1, 1, 1, 1, 1,
0.1732375, 0.5359859, 1.031266, 1, 1, 1, 1, 1,
0.1755653, 0.6166406, -0.2267305, 1, 1, 1, 1, 1,
0.1767429, 0.2708469, 1.267898, 1, 1, 1, 1, 1,
0.1773489, 0.4474079, -0.6854398, 0, 0, 1, 1, 1,
0.1813279, -1.81139, 1.190255, 1, 0, 0, 1, 1,
0.1814492, -0.7426293, 1.919168, 1, 0, 0, 1, 1,
0.1835615, 1.654519, 0.5445313, 1, 0, 0, 1, 1,
0.1842231, 0.1054344, 1.04773, 1, 0, 0, 1, 1,
0.1859785, 1.944269, -1.493433, 1, 0, 0, 1, 1,
0.1865535, -0.2851469, 2.199481, 0, 0, 0, 1, 1,
0.1928169, -1.04356, 2.610454, 0, 0, 0, 1, 1,
0.1928578, 0.1287887, 0.255394, 0, 0, 0, 1, 1,
0.1938302, -0.4334632, 2.122117, 0, 0, 0, 1, 1,
0.1949411, 1.844959, 0.6799737, 0, 0, 0, 1, 1,
0.2018256, 0.6638522, -0.9484771, 0, 0, 0, 1, 1,
0.2036322, 1.884594, 0.943395, 0, 0, 0, 1, 1,
0.2044737, 1.678812, 1.426646, 1, 1, 1, 1, 1,
0.2082069, 0.6548993, 0.250726, 1, 1, 1, 1, 1,
0.2082252, 0.8438834, -0.4469707, 1, 1, 1, 1, 1,
0.2119808, 0.1887339, -0.6684065, 1, 1, 1, 1, 1,
0.2139896, 1.219473, -1.044323, 1, 1, 1, 1, 1,
0.2145874, 1.954707, 0.3748965, 1, 1, 1, 1, 1,
0.2147432, 0.9795992, 0.2851593, 1, 1, 1, 1, 1,
0.215364, 1.85688, 1.368289, 1, 1, 1, 1, 1,
0.2164425, 0.6024159, 2.017041, 1, 1, 1, 1, 1,
0.2175432, 0.7523619, 0.4237675, 1, 1, 1, 1, 1,
0.2182484, -0.5090861, 5.213492, 1, 1, 1, 1, 1,
0.2218731, -0.6765135, 3.331075, 1, 1, 1, 1, 1,
0.2221155, -1.101226, 1.65963, 1, 1, 1, 1, 1,
0.2222629, -0.2114374, 0.978751, 1, 1, 1, 1, 1,
0.22673, 0.1348784, 0.03754929, 1, 1, 1, 1, 1,
0.2356617, -0.9180156, 1.885071, 0, 0, 1, 1, 1,
0.2368616, 0.5678983, -0.9778818, 1, 0, 0, 1, 1,
0.2426648, -1.246117, 3.721319, 1, 0, 0, 1, 1,
0.2444059, 1.961, 1.504726, 1, 0, 0, 1, 1,
0.2483542, 1.475921, -1.328924, 1, 0, 0, 1, 1,
0.2510292, -1.26547, 4.323409, 1, 0, 0, 1, 1,
0.2540107, 0.08442783, 1.418394, 0, 0, 0, 1, 1,
0.2574112, -1.751384, 2.379006, 0, 0, 0, 1, 1,
0.2575046, 0.6052584, 2.424835, 0, 0, 0, 1, 1,
0.2596518, 0.7263564, 2.270222, 0, 0, 0, 1, 1,
0.2761154, -1.427093, 4.263443, 0, 0, 0, 1, 1,
0.2769396, -0.09874783, 1.298752, 0, 0, 0, 1, 1,
0.2771981, -2.048062, 3.512433, 0, 0, 0, 1, 1,
0.2798355, -0.1939568, 2.514048, 1, 1, 1, 1, 1,
0.282223, 0.2413926, 0.1764206, 1, 1, 1, 1, 1,
0.2857092, 0.7527015, -0.03144516, 1, 1, 1, 1, 1,
0.2878198, -2.75316, 3.630416, 1, 1, 1, 1, 1,
0.2934605, 0.5983607, 0.07075419, 1, 1, 1, 1, 1,
0.2983646, 0.6513802, -1.872874, 1, 1, 1, 1, 1,
0.29938, 0.7815194, 0.2350276, 1, 1, 1, 1, 1,
0.3034958, -0.538565, 2.203627, 1, 1, 1, 1, 1,
0.3035156, 0.9672881, 0.4734433, 1, 1, 1, 1, 1,
0.3049886, -1.217926, 5.977983, 1, 1, 1, 1, 1,
0.3054326, 0.9743281, -0.4220539, 1, 1, 1, 1, 1,
0.3059235, 0.9466467, 2.179204, 1, 1, 1, 1, 1,
0.3068352, 0.5479338, 1.924991, 1, 1, 1, 1, 1,
0.3084581, -0.04662786, 2.19282, 1, 1, 1, 1, 1,
0.311308, -0.6610363, 0.8689936, 1, 1, 1, 1, 1,
0.3137884, -0.562526, 4.146756, 0, 0, 1, 1, 1,
0.3186464, -0.1471112, 2.545393, 1, 0, 0, 1, 1,
0.3188361, 0.1257001, 0.9291925, 1, 0, 0, 1, 1,
0.3191257, -0.8022593, 1.821501, 1, 0, 0, 1, 1,
0.3199891, -1.294074, 2.18475, 1, 0, 0, 1, 1,
0.3219891, -0.3624598, 1.194434, 1, 0, 0, 1, 1,
0.3233024, -1.342788, 3.442132, 0, 0, 0, 1, 1,
0.3234219, 1.850195, -1.725884, 0, 0, 0, 1, 1,
0.3237258, -0.08832476, 2.371817, 0, 0, 0, 1, 1,
0.3237787, 0.5604106, 0.3863328, 0, 0, 0, 1, 1,
0.3249208, 0.2669012, -0.1489719, 0, 0, 0, 1, 1,
0.3300752, 0.68602, 1.11651, 0, 0, 0, 1, 1,
0.3315933, -0.5131488, 1.828519, 0, 0, 0, 1, 1,
0.334549, -1.227476, 2.3421, 1, 1, 1, 1, 1,
0.3426109, -0.618305, 1.951004, 1, 1, 1, 1, 1,
0.3446263, 0.1414936, -0.9201238, 1, 1, 1, 1, 1,
0.3471499, 0.233796, 0.4284972, 1, 1, 1, 1, 1,
0.3507453, -0.1174984, 2.910263, 1, 1, 1, 1, 1,
0.3580211, 0.8934494, 0.07830226, 1, 1, 1, 1, 1,
0.3595346, 0.008030051, 2.652264, 1, 1, 1, 1, 1,
0.373708, 0.6306372, -0.1167763, 1, 1, 1, 1, 1,
0.373844, 0.1631098, 3.124703, 1, 1, 1, 1, 1,
0.3751616, 0.7899004, 0.6555226, 1, 1, 1, 1, 1,
0.375688, 0.2450965, -0.3507254, 1, 1, 1, 1, 1,
0.383008, 1.102954, -1.081008, 1, 1, 1, 1, 1,
0.3839287, -0.4823682, 1.010873, 1, 1, 1, 1, 1,
0.3856802, -2.541596, 3.110311, 1, 1, 1, 1, 1,
0.3864707, -0.05592953, 2.31192, 1, 1, 1, 1, 1,
0.3976179, 0.6392386, -0.2672322, 0, 0, 1, 1, 1,
0.3978358, -0.006594027, -0.16545, 1, 0, 0, 1, 1,
0.3983494, -0.7163551, 2.65493, 1, 0, 0, 1, 1,
0.4045309, -0.7643842, 1.463257, 1, 0, 0, 1, 1,
0.4067476, -1.929135, 2.698302, 1, 0, 0, 1, 1,
0.406969, -2.692952, 3.036645, 1, 0, 0, 1, 1,
0.418031, 1.621327, 0.1761022, 0, 0, 0, 1, 1,
0.4199785, -0.1209413, 1.2801, 0, 0, 0, 1, 1,
0.4229043, 0.3384697, 1.234128, 0, 0, 0, 1, 1,
0.4240803, -0.1244124, 1.492166, 0, 0, 0, 1, 1,
0.4246635, -0.374294, 3.704631, 0, 0, 0, 1, 1,
0.4338736, -0.2737673, 2.657169, 0, 0, 0, 1, 1,
0.4356163, 0.6394482, -0.4299812, 0, 0, 0, 1, 1,
0.4377002, -0.7251593, 0.8211721, 1, 1, 1, 1, 1,
0.4384421, -0.3522266, 3.197496, 1, 1, 1, 1, 1,
0.4394728, -0.196557, 2.183191, 1, 1, 1, 1, 1,
0.4408545, 0.6115215, 1.43342, 1, 1, 1, 1, 1,
0.441035, 1.120199, -1.063697, 1, 1, 1, 1, 1,
0.4487874, -0.2421863, 2.555858, 1, 1, 1, 1, 1,
0.4487932, 1.545913, 0.8528627, 1, 1, 1, 1, 1,
0.4492894, -0.6473103, 1.556104, 1, 1, 1, 1, 1,
0.452088, 0.9705632, -1.854927, 1, 1, 1, 1, 1,
0.45267, -1.507996, 1.38348, 1, 1, 1, 1, 1,
0.454375, -0.4788654, 4.345123, 1, 1, 1, 1, 1,
0.4546622, -1.200065, 2.625194, 1, 1, 1, 1, 1,
0.4613836, -0.9280479, 4.135695, 1, 1, 1, 1, 1,
0.4633679, -0.1310151, 1.385032, 1, 1, 1, 1, 1,
0.4663089, -1.849008, 2.426216, 1, 1, 1, 1, 1,
0.4669684, -0.1430949, 0.6542425, 0, 0, 1, 1, 1,
0.4671062, 0.9085541, -0.4672135, 1, 0, 0, 1, 1,
0.4712194, -0.8285553, 2.963767, 1, 0, 0, 1, 1,
0.474663, 0.4114299, -0.2443661, 1, 0, 0, 1, 1,
0.4775166, 0.02419195, 1.173434, 1, 0, 0, 1, 1,
0.479215, 0.3871205, 1.567868, 1, 0, 0, 1, 1,
0.4795914, 0.8062414, 0.3636883, 0, 0, 0, 1, 1,
0.4813661, 0.2822765, 0.9854458, 0, 0, 0, 1, 1,
0.4826499, -1.424703, 0.7182693, 0, 0, 0, 1, 1,
0.4857934, -0.6396861, 2.060824, 0, 0, 0, 1, 1,
0.4875565, 1.532874, 0.01562811, 0, 0, 0, 1, 1,
0.4887002, 0.09054583, 1.226195, 0, 0, 0, 1, 1,
0.4900756, -0.5485267, 3.614437, 0, 0, 0, 1, 1,
0.490564, 0.02526804, 1.625698, 1, 1, 1, 1, 1,
0.4919247, -1.973433, 2.151272, 1, 1, 1, 1, 1,
0.494962, 0.6361603, -0.5829381, 1, 1, 1, 1, 1,
0.4950115, 0.3727544, 2.107957, 1, 1, 1, 1, 1,
0.5013947, 0.5975757, 1.745998, 1, 1, 1, 1, 1,
0.504123, 0.1778553, 1.448457, 1, 1, 1, 1, 1,
0.5048122, -0.3954336, 2.789039, 1, 1, 1, 1, 1,
0.5053752, -1.741131, 4.502041, 1, 1, 1, 1, 1,
0.5058344, -0.8812462, 2.564638, 1, 1, 1, 1, 1,
0.5096069, -0.2603677, 2.182536, 1, 1, 1, 1, 1,
0.5162933, -0.9381958, 4.130271, 1, 1, 1, 1, 1,
0.5171574, 0.4520467, -0.1208343, 1, 1, 1, 1, 1,
0.5318069, -1.333041, 2.207492, 1, 1, 1, 1, 1,
0.5338242, 0.5404959, 0.413343, 1, 1, 1, 1, 1,
0.5378929, 0.8704229, 0.8579963, 1, 1, 1, 1, 1,
0.5421079, -0.2287032, 1.678426, 0, 0, 1, 1, 1,
0.5427733, 1.584318, 0.7907576, 1, 0, 0, 1, 1,
0.5499076, 0.6393407, 1.581261, 1, 0, 0, 1, 1,
0.5595545, 1.150618, -1.563753, 1, 0, 0, 1, 1,
0.5602118, 0.6909962, 0.6681749, 1, 0, 0, 1, 1,
0.5614027, -0.420751, 1.577041, 1, 0, 0, 1, 1,
0.5617008, 1.238361, 1.900289, 0, 0, 0, 1, 1,
0.5617705, -0.1150337, 0.6539515, 0, 0, 0, 1, 1,
0.5625115, -1.620548, 2.238754, 0, 0, 0, 1, 1,
0.5636617, -1.548001, 1.947454, 0, 0, 0, 1, 1,
0.5651734, 2.816346, -0.9682375, 0, 0, 0, 1, 1,
0.567753, 0.9927214, -0.1728436, 0, 0, 0, 1, 1,
0.5688903, 0.0006885742, 1.247832, 0, 0, 0, 1, 1,
0.5699533, 0.2887008, 2.369813, 1, 1, 1, 1, 1,
0.5784501, 0.002918527, 0.07153289, 1, 1, 1, 1, 1,
0.5796114, 0.1738545, 0.9588261, 1, 1, 1, 1, 1,
0.5809057, 0.1533205, 0.5764445, 1, 1, 1, 1, 1,
0.5849776, 2.418007, 0.9878916, 1, 1, 1, 1, 1,
0.5897055, -1.353077, 2.59625, 1, 1, 1, 1, 1,
0.596679, 0.8364431, -0.700343, 1, 1, 1, 1, 1,
0.5991963, -0.76911, 5.914222, 1, 1, 1, 1, 1,
0.6000955, -0.4232861, 2.995641, 1, 1, 1, 1, 1,
0.6006877, -1.169243, 2.675917, 1, 1, 1, 1, 1,
0.600786, 0.991967, 1.556144, 1, 1, 1, 1, 1,
0.6027682, -0.3102511, 2.637817, 1, 1, 1, 1, 1,
0.603451, 0.5066474, 0.08972569, 1, 1, 1, 1, 1,
0.6068685, 1.78149, 1.046008, 1, 1, 1, 1, 1,
0.6158614, -1.874467, 3.057195, 1, 1, 1, 1, 1,
0.6162111, 0.1268795, 1.507667, 0, 0, 1, 1, 1,
0.6168852, 0.1064053, 0.5356734, 1, 0, 0, 1, 1,
0.6210746, 1.918863, 0.05205132, 1, 0, 0, 1, 1,
0.624028, -0.2954913, 2.188978, 1, 0, 0, 1, 1,
0.6244228, -0.8506422, 2.528704, 1, 0, 0, 1, 1,
0.6245239, 0.6106342, 0.5607803, 1, 0, 0, 1, 1,
0.6274093, 1.628723, 1.669816, 0, 0, 0, 1, 1,
0.6285909, 0.7407345, 1.79895, 0, 0, 0, 1, 1,
0.6298097, -1.668335, 2.266726, 0, 0, 0, 1, 1,
0.6345925, 1.315198, -0.8771793, 0, 0, 0, 1, 1,
0.6406661, -1.007102, 1.702077, 0, 0, 0, 1, 1,
0.6422225, 1.001799, 1.467397, 0, 0, 0, 1, 1,
0.6469386, -0.4893818, 1.179099, 0, 0, 0, 1, 1,
0.6487804, -1.321005, 4.506293, 1, 1, 1, 1, 1,
0.6494707, 1.04201, 0.3904379, 1, 1, 1, 1, 1,
0.6606384, 0.3388009, 0.3837688, 1, 1, 1, 1, 1,
0.6771368, 0.6953495, -1.300216, 1, 1, 1, 1, 1,
0.6804441, 0.4869889, 0.3580793, 1, 1, 1, 1, 1,
0.6814147, 1.375205, -1.081504, 1, 1, 1, 1, 1,
0.6829875, 0.2566969, 2.774058, 1, 1, 1, 1, 1,
0.6875908, -0.5403913, 1.552922, 1, 1, 1, 1, 1,
0.6938353, -0.09406161, 2.280635, 1, 1, 1, 1, 1,
0.7005703, 2.780856, -0.4269809, 1, 1, 1, 1, 1,
0.7067098, 0.08404528, 2.365015, 1, 1, 1, 1, 1,
0.7098972, -0.06985682, 2.218303, 1, 1, 1, 1, 1,
0.7107743, -0.3673806, 1.251104, 1, 1, 1, 1, 1,
0.7143949, -0.7083023, 2.776321, 1, 1, 1, 1, 1,
0.7156515, 0.3931372, 1.942612, 1, 1, 1, 1, 1,
0.7210518, 0.1308914, 1.20536, 0, 0, 1, 1, 1,
0.723694, 0.05139535, 2.206908, 1, 0, 0, 1, 1,
0.7272555, -0.05641932, 1.273063, 1, 0, 0, 1, 1,
0.7313657, -0.3385327, 1.530064, 1, 0, 0, 1, 1,
0.73231, -2.284867, 3.571426, 1, 0, 0, 1, 1,
0.7338297, 1.584488, 2.053202, 1, 0, 0, 1, 1,
0.7347968, 0.07640128, 0.5033754, 0, 0, 0, 1, 1,
0.7359334, -0.09191544, 4.162356, 0, 0, 0, 1, 1,
0.7406403, 0.6429518, -0.05497266, 0, 0, 0, 1, 1,
0.7407103, 0.9647554, 0.1152692, 0, 0, 0, 1, 1,
0.7410726, 0.1797607, 0.4978527, 0, 0, 0, 1, 1,
0.7418505, 0.2991998, 1.591322, 0, 0, 0, 1, 1,
0.7425826, -0.8697955, 3.108392, 0, 0, 0, 1, 1,
0.7452286, -0.667019, 1.876883, 1, 1, 1, 1, 1,
0.7463815, 0.8809308, 0.3542981, 1, 1, 1, 1, 1,
0.7530566, 0.625206, 0.324446, 1, 1, 1, 1, 1,
0.7575115, 1.444698, 0.7009916, 1, 1, 1, 1, 1,
0.7589954, -1.451876, 1.067065, 1, 1, 1, 1, 1,
0.7646388, 1.519909, -0.2545176, 1, 1, 1, 1, 1,
0.7672094, 0.5177677, -0.1236911, 1, 1, 1, 1, 1,
0.7681984, 0.4828486, -0.2145817, 1, 1, 1, 1, 1,
0.7706573, -1.290298, 1.985465, 1, 1, 1, 1, 1,
0.7758574, -0.34135, 0.8072291, 1, 1, 1, 1, 1,
0.7770875, 0.2817304, 1.307035, 1, 1, 1, 1, 1,
0.7790408, 0.8763858, 0.376669, 1, 1, 1, 1, 1,
0.7872511, -0.5791891, 2.822221, 1, 1, 1, 1, 1,
0.7879701, -0.2214516, 1.316557, 1, 1, 1, 1, 1,
0.788326, 0.9768603, -0.1174704, 1, 1, 1, 1, 1,
0.78915, 2.168301, 0.5674278, 0, 0, 1, 1, 1,
0.8017718, 0.2544016, 0.5031506, 1, 0, 0, 1, 1,
0.8022479, -0.5236071, 2.889489, 1, 0, 0, 1, 1,
0.8056695, 1.122028, 0.3507562, 1, 0, 0, 1, 1,
0.8081077, -3.441577, 1.922674, 1, 0, 0, 1, 1,
0.8157677, -0.4304616, 2.103319, 1, 0, 0, 1, 1,
0.817782, -0.1432888, 0.6159977, 0, 0, 0, 1, 1,
0.8200042, 1.042876, 0.9109423, 0, 0, 0, 1, 1,
0.8231142, 1.49245, 0.2438276, 0, 0, 0, 1, 1,
0.8234195, -0.0645529, 1.681785, 0, 0, 0, 1, 1,
0.8242524, 1.04094, 0.893416, 0, 0, 0, 1, 1,
0.8250337, -0.6560382, 3.409538, 0, 0, 0, 1, 1,
0.8382565, 0.1042645, 1.61766, 0, 0, 0, 1, 1,
0.8384113, 1.214667, 0.9375885, 1, 1, 1, 1, 1,
0.8420849, 0.8679633, 1.062166, 1, 1, 1, 1, 1,
0.8465008, -0.8078401, 3.702304, 1, 1, 1, 1, 1,
0.8486989, -0.845713, 2.248754, 1, 1, 1, 1, 1,
0.8517389, 0.4806324, 2.801888, 1, 1, 1, 1, 1,
0.854169, 0.09090074, 1.283046, 1, 1, 1, 1, 1,
0.8564899, -0.05431015, 3.71242, 1, 1, 1, 1, 1,
0.8584992, 1.762752, -0.1218984, 1, 1, 1, 1, 1,
0.8663638, -0.6369586, 1.376243, 1, 1, 1, 1, 1,
0.8838206, -0.505444, 2.008081, 1, 1, 1, 1, 1,
0.8859302, -0.5301877, 2.633033, 1, 1, 1, 1, 1,
0.8919456, 1.446917, -0.1340441, 1, 1, 1, 1, 1,
0.9018389, 2.013736, 0.7032191, 1, 1, 1, 1, 1,
0.9168805, 1.041604, 0.4147819, 1, 1, 1, 1, 1,
0.9222855, 0.2277426, 1.205967, 1, 1, 1, 1, 1,
0.9255317, 0.1050242, 1.249569, 0, 0, 1, 1, 1,
0.9266405, -0.6904113, 1.10911, 1, 0, 0, 1, 1,
0.927601, -0.8920023, 2.117845, 1, 0, 0, 1, 1,
0.9276952, 0.2433738, 0.9117905, 1, 0, 0, 1, 1,
0.9329854, 1.141229, 1.6996, 1, 0, 0, 1, 1,
0.9347165, 1.25405, 0.6090531, 1, 0, 0, 1, 1,
0.9367867, -0.1010562, 2.650659, 0, 0, 0, 1, 1,
0.9375376, 1.084697, 1.146953, 0, 0, 0, 1, 1,
0.9401721, 0.156344, 1.772516, 0, 0, 0, 1, 1,
0.965278, 0.25267, 1.376236, 0, 0, 0, 1, 1,
0.9685328, 0.2239793, 2.135925, 0, 0, 0, 1, 1,
0.9713274, 0.7292923, 1.094529, 0, 0, 0, 1, 1,
0.9831238, 1.489718, -0.5129963, 0, 0, 0, 1, 1,
0.9903517, -1.060025, 1.732591, 1, 1, 1, 1, 1,
0.9911602, 0.04151795, 2.45786, 1, 1, 1, 1, 1,
0.9942168, -0.0454006, 3.334403, 1, 1, 1, 1, 1,
0.9973377, 1.150393, -0.6838388, 1, 1, 1, 1, 1,
1.006987, 0.3296235, -0.8389934, 1, 1, 1, 1, 1,
1.011162, 1.218833, -0.9344586, 1, 1, 1, 1, 1,
1.022463, -0.7732653, 2.787808, 1, 1, 1, 1, 1,
1.023757, -1.311486, 2.847184, 1, 1, 1, 1, 1,
1.039713, 0.09991277, 2.484222, 1, 1, 1, 1, 1,
1.043396, -0.5136408, 3.855591, 1, 1, 1, 1, 1,
1.044568, 1.482639, 0.4829586, 1, 1, 1, 1, 1,
1.05182, 0.6519905, 0.2141069, 1, 1, 1, 1, 1,
1.064111, 0.3995761, 0.4093135, 1, 1, 1, 1, 1,
1.065427, -0.3603134, 1.224568, 1, 1, 1, 1, 1,
1.068165, -1.625854, 3.077135, 1, 1, 1, 1, 1,
1.070578, 0.07159478, 2.808786, 0, 0, 1, 1, 1,
1.071315, 0.6179284, 1.955297, 1, 0, 0, 1, 1,
1.079797, 0.8569191, 0.7872004, 1, 0, 0, 1, 1,
1.079882, -0.5074775, 1.334397, 1, 0, 0, 1, 1,
1.080171, -1.231088, 1.716167, 1, 0, 0, 1, 1,
1.085367, 0.7974821, 1.085577, 1, 0, 0, 1, 1,
1.094633, 1.416135, -1.038091, 0, 0, 0, 1, 1,
1.095502, 0.9181972, 1.933217, 0, 0, 0, 1, 1,
1.099707, 0.9265451, 1.210032, 0, 0, 0, 1, 1,
1.104043, -0.2458462, 1.278893, 0, 0, 0, 1, 1,
1.106476, 0.438313, 1.343299, 0, 0, 0, 1, 1,
1.106851, -0.7971407, 0.8845773, 0, 0, 0, 1, 1,
1.107859, 0.1796844, 1.074035, 0, 0, 0, 1, 1,
1.111575, 1.136564, 1.809826, 1, 1, 1, 1, 1,
1.113078, 0.547343, 0.1436927, 1, 1, 1, 1, 1,
1.120492, -1.362459, 2.275532, 1, 1, 1, 1, 1,
1.12932, -0.6516574, 0.02375517, 1, 1, 1, 1, 1,
1.130479, 0.1354888, 0.36459, 1, 1, 1, 1, 1,
1.13212, -0.3391335, 3.08557, 1, 1, 1, 1, 1,
1.138644, -0.7800775, 3.102662, 1, 1, 1, 1, 1,
1.145163, 0.1798323, 3.123846, 1, 1, 1, 1, 1,
1.148624, 1.530027, 1.115514, 1, 1, 1, 1, 1,
1.151932, -0.195145, 2.07851, 1, 1, 1, 1, 1,
1.152937, -0.2102017, 2.484894, 1, 1, 1, 1, 1,
1.157007, 1.000896, 2.092828, 1, 1, 1, 1, 1,
1.158362, -1.607577, 4.002698, 1, 1, 1, 1, 1,
1.1596, -0.6699541, 1.707638, 1, 1, 1, 1, 1,
1.162364, -1.015271, 4.374905, 1, 1, 1, 1, 1,
1.175868, 0.4847057, 2.506272, 0, 0, 1, 1, 1,
1.176351, -0.5425465, 3.034806, 1, 0, 0, 1, 1,
1.176879, 0.3601383, 1.704512, 1, 0, 0, 1, 1,
1.184733, -0.3767772, 2.246759, 1, 0, 0, 1, 1,
1.186525, -1.450828, 1.699535, 1, 0, 0, 1, 1,
1.189686, -0.9698496, 3.785306, 1, 0, 0, 1, 1,
1.204274, -1.303723, 1.10619, 0, 0, 0, 1, 1,
1.208184, -0.3409, 3.186036, 0, 0, 0, 1, 1,
1.215765, 0.9427363, 1.554317, 0, 0, 0, 1, 1,
1.219787, -0.07709444, 2.343814, 0, 0, 0, 1, 1,
1.229542, 1.430333, 0.8872221, 0, 0, 0, 1, 1,
1.231378, -0.5907185, 1.538315, 0, 0, 0, 1, 1,
1.263721, -0.7524926, 2.328053, 0, 0, 0, 1, 1,
1.269876, 1.316974, 1.604772, 1, 1, 1, 1, 1,
1.283089, -1.11949, 5.056198, 1, 1, 1, 1, 1,
1.285717, -0.1678201, 2.707186, 1, 1, 1, 1, 1,
1.297394, -1.025613, 2.380896, 1, 1, 1, 1, 1,
1.307975, 1.268325, 1.478245, 1, 1, 1, 1, 1,
1.308332, -0.06830092, 1.935988, 1, 1, 1, 1, 1,
1.30856, -0.8881252, 0.9319133, 1, 1, 1, 1, 1,
1.308679, -0.09379568, 0.6583173, 1, 1, 1, 1, 1,
1.312236, -0.7270654, 1.728751, 1, 1, 1, 1, 1,
1.31587, -0.3423425, 1.064219, 1, 1, 1, 1, 1,
1.326087, 0.3554577, 1.105361, 1, 1, 1, 1, 1,
1.337696, -0.8233503, -0.382276, 1, 1, 1, 1, 1,
1.347303, 0.01624285, 1.295055, 1, 1, 1, 1, 1,
1.36425, 0.4501738, 1.274802, 1, 1, 1, 1, 1,
1.365841, -2.073895, 0.6655993, 1, 1, 1, 1, 1,
1.367863, -1.027611, 0.9128304, 0, 0, 1, 1, 1,
1.371546, 0.4280781, 2.650777, 1, 0, 0, 1, 1,
1.372352, -0.6785509, 2.679777, 1, 0, 0, 1, 1,
1.394826, -1.178251, 2.705531, 1, 0, 0, 1, 1,
1.396093, -0.7459679, -0.6232075, 1, 0, 0, 1, 1,
1.410769, 0.2914366, 2.71693, 1, 0, 0, 1, 1,
1.43197, -0.8981391, 1.088404, 0, 0, 0, 1, 1,
1.436141, 0.6517709, 1.712166, 0, 0, 0, 1, 1,
1.445962, -0.5086964, 2.608747, 0, 0, 0, 1, 1,
1.44756, -0.2064201, 2.540895, 0, 0, 0, 1, 1,
1.465911, -0.4152345, 2.027406, 0, 0, 0, 1, 1,
1.478642, 0.5292231, -0.4634939, 0, 0, 0, 1, 1,
1.479369, -1.071886, 2.0067, 0, 0, 0, 1, 1,
1.491575, 0.2077497, 1.650009, 1, 1, 1, 1, 1,
1.492411, -1.931156, 3.542349, 1, 1, 1, 1, 1,
1.494688, -0.3570977, 1.731116, 1, 1, 1, 1, 1,
1.501135, 0.3967499, 1.094075, 1, 1, 1, 1, 1,
1.502483, -1.256925, 2.946256, 1, 1, 1, 1, 1,
1.502824, -0.374232, -0.04128169, 1, 1, 1, 1, 1,
1.504778, -0.4284947, 2.589218, 1, 1, 1, 1, 1,
1.529206, 0.6501033, 0.983288, 1, 1, 1, 1, 1,
1.538799, 0.4777015, 1.671244, 1, 1, 1, 1, 1,
1.552385, -0.5881621, 1.382371, 1, 1, 1, 1, 1,
1.59167, -1.202803, 1.844887, 1, 1, 1, 1, 1,
1.611873, -0.494618, 3.235682, 1, 1, 1, 1, 1,
1.61227, -0.2263181, 1.144076, 1, 1, 1, 1, 1,
1.616192, -0.520218, 1.729999, 1, 1, 1, 1, 1,
1.647509, -2.338297, 2.885564, 1, 1, 1, 1, 1,
1.657668, -0.2254915, 2.075145, 0, 0, 1, 1, 1,
1.663849, 0.6919163, 2.025551, 1, 0, 0, 1, 1,
1.675336, -0.398019, 2.844137, 1, 0, 0, 1, 1,
1.700252, -0.1539243, 3.871841, 1, 0, 0, 1, 1,
1.720086, 0.05394468, 1.53131, 1, 0, 0, 1, 1,
1.728385, -0.2890482, -0.0948117, 1, 0, 0, 1, 1,
1.735123, 0.008311789, 0.2053401, 0, 0, 0, 1, 1,
1.737226, 0.702646, 0.6179844, 0, 0, 0, 1, 1,
1.757252, -0.2362211, 1.984322, 0, 0, 0, 1, 1,
1.759251, 0.9669417, 0.637946, 0, 0, 0, 1, 1,
1.788581, 0.5038659, 2.011802, 0, 0, 0, 1, 1,
1.789002, -0.9372333, 1.63489, 0, 0, 0, 1, 1,
1.807943, 0.7490394, 1.198623, 0, 0, 0, 1, 1,
1.827053, 0.7718602, -0.9221206, 1, 1, 1, 1, 1,
1.844462, 0.3578802, 1.139238, 1, 1, 1, 1, 1,
1.87717, 1.363062, -0.705987, 1, 1, 1, 1, 1,
1.91991, -0.2238881, 0.09382161, 1, 1, 1, 1, 1,
1.972335, 0.8837638, 1.480164, 1, 1, 1, 1, 1,
1.978671, 2.290019, 1.194005, 1, 1, 1, 1, 1,
1.995246, -0.3156246, 1.992391, 1, 1, 1, 1, 1,
1.995327, 0.2352737, 0.1266369, 1, 1, 1, 1, 1,
2.003048, -0.2683499, 1.293656, 1, 1, 1, 1, 1,
2.04545, -0.06895456, 2.081311, 1, 1, 1, 1, 1,
2.0514, -1.657425, 0.8223658, 1, 1, 1, 1, 1,
2.059601, -0.2778357, 0.447301, 1, 1, 1, 1, 1,
2.072028, -0.6282378, 1.63911, 1, 1, 1, 1, 1,
2.07315, 0.8618619, 1.679217, 1, 1, 1, 1, 1,
2.079624, -1.07389, 1.656908, 1, 1, 1, 1, 1,
2.11983, -0.3071309, 2.206922, 0, 0, 1, 1, 1,
2.128519, 1.290489, -0.04695474, 1, 0, 0, 1, 1,
2.154241, -0.505596, 3.896986, 1, 0, 0, 1, 1,
2.165354, 0.9847205, 1.082638, 1, 0, 0, 1, 1,
2.173748, -0.2153146, 1.433124, 1, 0, 0, 1, 1,
2.222538, -0.8297228, 2.121519, 1, 0, 0, 1, 1,
2.240827, -0.4601396, 1.725216, 0, 0, 0, 1, 1,
2.241086, 0.7794019, 0.5479479, 0, 0, 0, 1, 1,
2.242666, 0.9181357, 2.594499, 0, 0, 0, 1, 1,
2.254569, -1.08232, 1.342029, 0, 0, 0, 1, 1,
2.279189, 0.5217964, 0.7610201, 0, 0, 0, 1, 1,
2.281166, -0.5216713, 3.355732, 0, 0, 0, 1, 1,
2.393174, -1.060189, 2.484726, 0, 0, 0, 1, 1,
2.3969, -0.5810172, -0.8235382, 1, 1, 1, 1, 1,
2.423666, 0.2603067, 2.993632, 1, 1, 1, 1, 1,
2.560155, 1.018975, 0.3718006, 1, 1, 1, 1, 1,
2.646813, -0.1955514, 0.4335107, 1, 1, 1, 1, 1,
2.76007, -0.6946548, 2.292014, 1, 1, 1, 1, 1,
2.821541, -0.6863781, 3.018587, 1, 1, 1, 1, 1,
2.908117, -1.237288, 0.3208441, 1, 1, 1, 1, 1
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
var radius = 10.26982;
var distance = 36.07232;
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
mvMatrix.translate( 0.4415334, 0.1843288, 0.004590511 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.07232);
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
