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
-3.097612, 1.36576, -0.3456926, 1, 0, 0, 1,
-2.710334, 0.0942687, -0.6811829, 1, 0.007843138, 0, 1,
-2.577665, 0.6603813, -2.489936, 1, 0.01176471, 0, 1,
-2.478515, 0.5545428, -2.946654, 1, 0.01960784, 0, 1,
-2.451555, -0.4870925, -3.288554, 1, 0.02352941, 0, 1,
-2.361705, 0.1803034, -2.055068, 1, 0.03137255, 0, 1,
-2.289248, 0.597944, -1.853583, 1, 0.03529412, 0, 1,
-2.211631, 1.947686, 0.5841871, 1, 0.04313726, 0, 1,
-2.150691, 1.822239, 1.145235, 1, 0.04705882, 0, 1,
-2.148329, -1.677055, -2.48026, 1, 0.05490196, 0, 1,
-2.141384, 1.629596, -1.877504, 1, 0.05882353, 0, 1,
-2.140811, 1.351352, -0.3523917, 1, 0.06666667, 0, 1,
-2.061124, -0.9162726, -1.292832, 1, 0.07058824, 0, 1,
-2.060613, 2.115597, -0.5710927, 1, 0.07843138, 0, 1,
-2.048794, -0.3600414, -0.2193975, 1, 0.08235294, 0, 1,
-2.017312, -0.2563317, -2.375034, 1, 0.09019608, 0, 1,
-2.016298, 0.2274281, -1.070804, 1, 0.09411765, 0, 1,
-1.981437, -0.5269446, -0.1548338, 1, 0.1019608, 0, 1,
-1.977312, -0.2484782, -0.9795045, 1, 0.1098039, 0, 1,
-1.97711, 0.9783532, -1.137017, 1, 0.1137255, 0, 1,
-1.941871, 0.5853872, -1.626471, 1, 0.1215686, 0, 1,
-1.939959, -0.2136717, -1.090737, 1, 0.1254902, 0, 1,
-1.876322, 0.8217135, 0.164037, 1, 0.1333333, 0, 1,
-1.854658, 0.7074536, 0.2358988, 1, 0.1372549, 0, 1,
-1.852172, 1.669557, -0.09072579, 1, 0.145098, 0, 1,
-1.841852, -0.1540037, -2.215905, 1, 0.1490196, 0, 1,
-1.841553, 0.5535547, -1.030157, 1, 0.1568628, 0, 1,
-1.812806, 0.6174173, 0.03850924, 1, 0.1607843, 0, 1,
-1.789757, -0.5437155, -3.276896, 1, 0.1686275, 0, 1,
-1.769144, -0.2957424, -0.6592532, 1, 0.172549, 0, 1,
-1.758298, -0.8881249, -1.622937, 1, 0.1803922, 0, 1,
-1.72831, -0.08159951, -2.55543, 1, 0.1843137, 0, 1,
-1.717376, 1.833042, -1.177472, 1, 0.1921569, 0, 1,
-1.694244, -0.1681002, -0.4902877, 1, 0.1960784, 0, 1,
-1.690522, 0.6446311, -0.655241, 1, 0.2039216, 0, 1,
-1.682415, 0.7090971, -1.652109, 1, 0.2117647, 0, 1,
-1.681866, 1.169778, -0.218918, 1, 0.2156863, 0, 1,
-1.678916, 1.323023, -1.680886, 1, 0.2235294, 0, 1,
-1.664485, 0.2717933, -1.122373, 1, 0.227451, 0, 1,
-1.658015, 1.019398, -0.2822141, 1, 0.2352941, 0, 1,
-1.654372, -0.5735561, -2.247366, 1, 0.2392157, 0, 1,
-1.650935, 1.235217, -1.980334, 1, 0.2470588, 0, 1,
-1.616341, -0.7089399, -0.3500259, 1, 0.2509804, 0, 1,
-1.597184, 0.7950826, -3.141738, 1, 0.2588235, 0, 1,
-1.596666, 0.4795623, -0.8988951, 1, 0.2627451, 0, 1,
-1.576495, -0.06903663, -1.702161, 1, 0.2705882, 0, 1,
-1.552893, 0.2580666, -1.266161, 1, 0.2745098, 0, 1,
-1.550876, -0.5866398, -2.583751, 1, 0.282353, 0, 1,
-1.531798, -0.1890301, -0.2629151, 1, 0.2862745, 0, 1,
-1.521284, -1.450736, -5.180994, 1, 0.2941177, 0, 1,
-1.520292, -0.2315421, -2.948002, 1, 0.3019608, 0, 1,
-1.520102, 1.239196, -1.233196, 1, 0.3058824, 0, 1,
-1.517082, 0.1879855, -0.3255849, 1, 0.3137255, 0, 1,
-1.490247, -0.5324516, -3.539706, 1, 0.3176471, 0, 1,
-1.490209, -0.8557041, -1.650759, 1, 0.3254902, 0, 1,
-1.481214, 1.876605, -1.217383, 1, 0.3294118, 0, 1,
-1.468547, 0.0983913, -0.6372459, 1, 0.3372549, 0, 1,
-1.459755, 0.0283971, -3.044245, 1, 0.3411765, 0, 1,
-1.458223, 0.2218656, -2.81938, 1, 0.3490196, 0, 1,
-1.452881, 1.099595, -0.009824819, 1, 0.3529412, 0, 1,
-1.432264, 0.07733147, -0.4812066, 1, 0.3607843, 0, 1,
-1.432083, 1.022891, -0.2952581, 1, 0.3647059, 0, 1,
-1.43181, -1.943297, -2.201519, 1, 0.372549, 0, 1,
-1.430352, -0.3128172, -1.377146, 1, 0.3764706, 0, 1,
-1.408298, -1.729847, -1.879561, 1, 0.3843137, 0, 1,
-1.406444, -0.5490509, -3.154942, 1, 0.3882353, 0, 1,
-1.403333, -0.1145531, -2.136101, 1, 0.3960784, 0, 1,
-1.402017, 0.6250306, -1.083638, 1, 0.4039216, 0, 1,
-1.399249, -1.341202, -0.1322508, 1, 0.4078431, 0, 1,
-1.393409, 0.5533608, -1.362912, 1, 0.4156863, 0, 1,
-1.389093, -0.06397056, -1.489907, 1, 0.4196078, 0, 1,
-1.383041, -0.303844, -3.729556, 1, 0.427451, 0, 1,
-1.378112, 0.885182, -2.03342, 1, 0.4313726, 0, 1,
-1.374346, 1.808789, 1.260647, 1, 0.4392157, 0, 1,
-1.374182, 1.104241, -2.3664, 1, 0.4431373, 0, 1,
-1.370461, -1.445039, -2.485234, 1, 0.4509804, 0, 1,
-1.334172, -2.043727, -4.35541, 1, 0.454902, 0, 1,
-1.328838, 0.9133112, -1.912392, 1, 0.4627451, 0, 1,
-1.327296, 1.473973, -1.725732, 1, 0.4666667, 0, 1,
-1.326334, -0.5402369, -3.657931, 1, 0.4745098, 0, 1,
-1.315994, 0.1947352, -1.92921, 1, 0.4784314, 0, 1,
-1.308743, -0.05710058, -2.327736, 1, 0.4862745, 0, 1,
-1.289834, -0.9077999, -1.671617, 1, 0.4901961, 0, 1,
-1.288579, -0.1953941, 0.5378463, 1, 0.4980392, 0, 1,
-1.287775, 0.5479151, -0.7857412, 1, 0.5058824, 0, 1,
-1.285627, 0.3971286, -2.260186, 1, 0.509804, 0, 1,
-1.285015, 0.7859176, -2.218963, 1, 0.5176471, 0, 1,
-1.281995, -0.6264704, -2.812353, 1, 0.5215687, 0, 1,
-1.279922, -0.485695, -2.079465, 1, 0.5294118, 0, 1,
-1.278766, 0.05948589, -1.241149, 1, 0.5333334, 0, 1,
-1.273182, 1.637536, -1.679124, 1, 0.5411765, 0, 1,
-1.263641, 1.783908, -3.17175, 1, 0.5450981, 0, 1,
-1.246378, 0.2930018, -1.450599, 1, 0.5529412, 0, 1,
-1.245425, 0.8535747, -0.9615223, 1, 0.5568628, 0, 1,
-1.241487, 1.437051, -1.157891, 1, 0.5647059, 0, 1,
-1.226554, 1.408313, -2.06405, 1, 0.5686275, 0, 1,
-1.224147, 0.2121198, -1.449801, 1, 0.5764706, 0, 1,
-1.223785, -0.0007383092, -3.104198, 1, 0.5803922, 0, 1,
-1.222353, -0.9812003, -3.460903, 1, 0.5882353, 0, 1,
-1.215829, 1.29932, -0.9193634, 1, 0.5921569, 0, 1,
-1.213055, -0.8651534, -2.318728, 1, 0.6, 0, 1,
-1.20482, 0.2492265, 0.2743485, 1, 0.6078432, 0, 1,
-1.204807, 1.617143, -0.7991382, 1, 0.6117647, 0, 1,
-1.20038, -0.7766548, -2.725727, 1, 0.6196079, 0, 1,
-1.186437, 0.8433943, -0.1045273, 1, 0.6235294, 0, 1,
-1.180613, 0.1095862, -2.750994, 1, 0.6313726, 0, 1,
-1.174381, -0.5369347, -2.488773, 1, 0.6352941, 0, 1,
-1.172763, -0.1287255, -1.775237, 1, 0.6431373, 0, 1,
-1.170871, 0.1281523, -2.432192, 1, 0.6470588, 0, 1,
-1.168173, 0.5828394, 0.02358012, 1, 0.654902, 0, 1,
-1.167958, 0.7079415, -1.674725, 1, 0.6588235, 0, 1,
-1.158244, 1.584249, 0.7621844, 1, 0.6666667, 0, 1,
-1.143524, 0.9228015, -2.276407, 1, 0.6705883, 0, 1,
-1.140414, 0.5874353, -2.819688, 1, 0.6784314, 0, 1,
-1.133173, -1.197519, -4.742733, 1, 0.682353, 0, 1,
-1.129446, 1.090621, -1.466597, 1, 0.6901961, 0, 1,
-1.127041, -2.450491, -2.484556, 1, 0.6941177, 0, 1,
-1.1245, 0.158081, -0.8514886, 1, 0.7019608, 0, 1,
-1.122854, -0.6077201, -4.27877, 1, 0.7098039, 0, 1,
-1.119393, -1.054667, -1.903717, 1, 0.7137255, 0, 1,
-1.118401, -0.645573, -3.239054, 1, 0.7215686, 0, 1,
-1.106258, -0.3375362, -2.962836, 1, 0.7254902, 0, 1,
-1.098, -0.8387056, -2.019542, 1, 0.7333333, 0, 1,
-1.096608, 1.062675, 0.2386732, 1, 0.7372549, 0, 1,
-1.079984, 1.217902, 0.4536805, 1, 0.7450981, 0, 1,
-1.065383, 0.4019915, -1.238741, 1, 0.7490196, 0, 1,
-1.060359, -0.565277, -3.152022, 1, 0.7568628, 0, 1,
-1.056909, -0.1894575, -2.195378, 1, 0.7607843, 0, 1,
-1.053222, 1.45104, -1.629837, 1, 0.7686275, 0, 1,
-1.038355, -0.2236758, -2.068606, 1, 0.772549, 0, 1,
-1.037874, -1.281382, -0.3383061, 1, 0.7803922, 0, 1,
-1.032882, 1.030736, -1.276341, 1, 0.7843137, 0, 1,
-1.027392, 2.388541, 1.281121, 1, 0.7921569, 0, 1,
-1.026797, 0.244964, 1.642548, 1, 0.7960784, 0, 1,
-1.022074, 1.523487, 0.2111394, 1, 0.8039216, 0, 1,
-1.018536, 1.250483, -0.03067578, 1, 0.8117647, 0, 1,
-1.012026, -0.2764947, 0.9492716, 1, 0.8156863, 0, 1,
-1.007972, 1.32364, 0.1365235, 1, 0.8235294, 0, 1,
-1.003447, 1.246596, -0.3887508, 1, 0.827451, 0, 1,
-0.9982769, -0.9169605, -2.658417, 1, 0.8352941, 0, 1,
-0.9958274, 0.8805015, -0.8555927, 1, 0.8392157, 0, 1,
-0.9943019, -0.5413874, -2.220981, 1, 0.8470588, 0, 1,
-0.9776594, 1.40392, -0.7850538, 1, 0.8509804, 0, 1,
-0.9771797, -1.038213, -2.797546, 1, 0.8588235, 0, 1,
-0.9769645, 0.1622464, -0.6435181, 1, 0.8627451, 0, 1,
-0.9735677, -0.6820536, -0.3420708, 1, 0.8705882, 0, 1,
-0.9677751, -0.3588023, -1.2082, 1, 0.8745098, 0, 1,
-0.9670102, -1.526842, -5.145415, 1, 0.8823529, 0, 1,
-0.9648167, 0.2537842, -0.8578177, 1, 0.8862745, 0, 1,
-0.9577569, -1.467882, -4.087434, 1, 0.8941177, 0, 1,
-0.9575257, 0.2203697, -1.548512, 1, 0.8980392, 0, 1,
-0.9553627, -0.6464995, -2.211414, 1, 0.9058824, 0, 1,
-0.9482682, -0.5302026, -2.182534, 1, 0.9137255, 0, 1,
-0.9422925, 0.02135134, 0.4392452, 1, 0.9176471, 0, 1,
-0.9362327, 0.9408074, -0.04950083, 1, 0.9254902, 0, 1,
-0.9339996, -0.3869171, -1.427633, 1, 0.9294118, 0, 1,
-0.930441, -0.01237428, -1.724867, 1, 0.9372549, 0, 1,
-0.9303192, 0.466814, -2.300439, 1, 0.9411765, 0, 1,
-0.9212905, 0.1802762, -0.6816079, 1, 0.9490196, 0, 1,
-0.9211571, -0.1118679, -0.5778383, 1, 0.9529412, 0, 1,
-0.9187714, -0.007380371, -3.084282, 1, 0.9607843, 0, 1,
-0.9135002, 0.1171778, -2.290504, 1, 0.9647059, 0, 1,
-0.9134164, -0.6890916, -3.109035, 1, 0.972549, 0, 1,
-0.9093905, 0.8843104, -3.257101, 1, 0.9764706, 0, 1,
-0.9078535, -0.2705283, -2.239602, 1, 0.9843137, 0, 1,
-0.9076468, 0.5590332, -2.088316, 1, 0.9882353, 0, 1,
-0.9060052, 1.241409, -1.578806, 1, 0.9960784, 0, 1,
-0.9012457, -1.699176, -4.504642, 0.9960784, 1, 0, 1,
-0.9010381, 1.403965, 0.4954035, 0.9921569, 1, 0, 1,
-0.8940694, 0.6481681, -1.393363, 0.9843137, 1, 0, 1,
-0.8902629, 1.216656, -0.5060428, 0.9803922, 1, 0, 1,
-0.8893657, -0.1152154, -0.2950489, 0.972549, 1, 0, 1,
-0.8844478, 0.2312225, -2.159411, 0.9686275, 1, 0, 1,
-0.8806115, -1.955201, -3.992487, 0.9607843, 1, 0, 1,
-0.8796349, -0.4692658, -1.082896, 0.9568627, 1, 0, 1,
-0.8793309, 0.98961, 0.9498762, 0.9490196, 1, 0, 1,
-0.8788124, -1.259834, -2.726758, 0.945098, 1, 0, 1,
-0.8779893, 0.3504249, -0.5979012, 0.9372549, 1, 0, 1,
-0.8755037, 0.3501625, -1.113732, 0.9333333, 1, 0, 1,
-0.8747658, -0.5035195, -1.790387, 0.9254902, 1, 0, 1,
-0.8741812, 1.823603, -0.5995853, 0.9215686, 1, 0, 1,
-0.867856, -2.363327, -3.127833, 0.9137255, 1, 0, 1,
-0.8659265, 0.3149593, 0.05584699, 0.9098039, 1, 0, 1,
-0.8651105, 0.333149, -2.02139, 0.9019608, 1, 0, 1,
-0.8640485, 1.290461, -1.625501, 0.8941177, 1, 0, 1,
-0.8587404, 0.4767708, -0.9455273, 0.8901961, 1, 0, 1,
-0.8435206, -0.05117922, -2.070484, 0.8823529, 1, 0, 1,
-0.8391184, -0.6347622, -3.394416, 0.8784314, 1, 0, 1,
-0.8358538, 0.606787, 1.377918, 0.8705882, 1, 0, 1,
-0.8328084, 0.4697649, -0.8113948, 0.8666667, 1, 0, 1,
-0.831298, -0.4950788, -1.352232, 0.8588235, 1, 0, 1,
-0.8242423, -0.218974, -0.318215, 0.854902, 1, 0, 1,
-0.8238446, 0.9045289, -1.342386, 0.8470588, 1, 0, 1,
-0.8218091, -0.993379, -2.674581, 0.8431373, 1, 0, 1,
-0.8217307, -0.5824277, -3.29553, 0.8352941, 1, 0, 1,
-0.8211735, -0.1307002, -2.06977, 0.8313726, 1, 0, 1,
-0.8205096, 1.951153, -1.172834, 0.8235294, 1, 0, 1,
-0.8196578, 1.036698, -0.7647429, 0.8196079, 1, 0, 1,
-0.8183683, 1.287112, -1.272822, 0.8117647, 1, 0, 1,
-0.8156407, 0.620051, -0.7683878, 0.8078431, 1, 0, 1,
-0.8142836, -1.801134, -2.012517, 0.8, 1, 0, 1,
-0.8102551, 1.525351, -0.6963587, 0.7921569, 1, 0, 1,
-0.8101878, 1.196175, 0.3567121, 0.7882353, 1, 0, 1,
-0.8088688, 0.4283744, -2.106676, 0.7803922, 1, 0, 1,
-0.8054404, 1.212727, -1.070159, 0.7764706, 1, 0, 1,
-0.8052991, -0.01836362, -1.944381, 0.7686275, 1, 0, 1,
-0.8052775, -0.8039597, -2.718966, 0.7647059, 1, 0, 1,
-0.8022438, -1.267698, -2.752912, 0.7568628, 1, 0, 1,
-0.7979298, 0.4771047, -0.3561245, 0.7529412, 1, 0, 1,
-0.7971655, -0.2181455, -2.20678, 0.7450981, 1, 0, 1,
-0.7849217, 0.8411894, -2.292978, 0.7411765, 1, 0, 1,
-0.7838932, -0.8087775, -2.314201, 0.7333333, 1, 0, 1,
-0.7834784, 1.447405, -1.568672, 0.7294118, 1, 0, 1,
-0.7783268, -0.05384595, -1.315198, 0.7215686, 1, 0, 1,
-0.7759954, 0.2312484, 0.1325864, 0.7176471, 1, 0, 1,
-0.7752526, 0.5860139, -0.722042, 0.7098039, 1, 0, 1,
-0.7703993, -0.01412207, -1.586597, 0.7058824, 1, 0, 1,
-0.7635314, -0.02169486, -1.235255, 0.6980392, 1, 0, 1,
-0.7605546, -0.3033527, -2.052061, 0.6901961, 1, 0, 1,
-0.7586903, -1.44667, -2.379546, 0.6862745, 1, 0, 1,
-0.7572899, 0.7595029, 0.1338605, 0.6784314, 1, 0, 1,
-0.753234, -2.93078, -4.680018, 0.6745098, 1, 0, 1,
-0.7521317, 0.3450252, -1.089251, 0.6666667, 1, 0, 1,
-0.7486143, 1.827305, -2.955494, 0.6627451, 1, 0, 1,
-0.7467278, -1.123912, -3.621647, 0.654902, 1, 0, 1,
-0.7456922, 0.7443638, -2.659165, 0.6509804, 1, 0, 1,
-0.7421659, -0.8443619, -3.354515, 0.6431373, 1, 0, 1,
-0.7404926, -1.515999, -0.1996596, 0.6392157, 1, 0, 1,
-0.7393226, -0.2161338, -2.633993, 0.6313726, 1, 0, 1,
-0.7365934, -0.7211782, -1.574023, 0.627451, 1, 0, 1,
-0.7319158, -0.2670408, -2.739311, 0.6196079, 1, 0, 1,
-0.7311017, -1.52928, -3.325782, 0.6156863, 1, 0, 1,
-0.7310266, 1.270451, 0.6012911, 0.6078432, 1, 0, 1,
-0.7259909, -0.6319166, -1.955822, 0.6039216, 1, 0, 1,
-0.7259676, -1.3508, -3.954455, 0.5960785, 1, 0, 1,
-0.7207851, -0.527851, 0.189485, 0.5882353, 1, 0, 1,
-0.7169116, 0.3535069, -0.8003933, 0.5843138, 1, 0, 1,
-0.7160252, 1.14692, -1.457909, 0.5764706, 1, 0, 1,
-0.7150689, -0.5177792, -1.808569, 0.572549, 1, 0, 1,
-0.7081633, -0.39626, -3.210011, 0.5647059, 1, 0, 1,
-0.7056967, -0.2609132, -2.288967, 0.5607843, 1, 0, 1,
-0.7023546, 0.5169159, 0.7579718, 0.5529412, 1, 0, 1,
-0.6991298, 0.6963454, -0.6197635, 0.5490196, 1, 0, 1,
-0.6878882, 0.3901823, -1.17899, 0.5411765, 1, 0, 1,
-0.6869541, -1.777461, -3.858582, 0.5372549, 1, 0, 1,
-0.6834014, -1.098036, -2.200985, 0.5294118, 1, 0, 1,
-0.6811805, -0.9684036, -4.296777, 0.5254902, 1, 0, 1,
-0.6717559, 0.515317, -0.3148278, 0.5176471, 1, 0, 1,
-0.6711445, -1.397508, -3.099194, 0.5137255, 1, 0, 1,
-0.6648911, 1.010298, -0.7839744, 0.5058824, 1, 0, 1,
-0.6637194, 0.06726834, -2.696463, 0.5019608, 1, 0, 1,
-0.6627639, 1.214322, -0.5730267, 0.4941176, 1, 0, 1,
-0.6594876, -0.3861081, -0.7837418, 0.4862745, 1, 0, 1,
-0.6588305, -0.5353758, -0.2131185, 0.4823529, 1, 0, 1,
-0.6561156, 0.4909332, -0.1782455, 0.4745098, 1, 0, 1,
-0.6538609, -0.7791617, -1.963888, 0.4705882, 1, 0, 1,
-0.6524535, -1.930576, -2.311306, 0.4627451, 1, 0, 1,
-0.6474171, -1.067845, -3.188544, 0.4588235, 1, 0, 1,
-0.6469892, -0.113444, -1.197619, 0.4509804, 1, 0, 1,
-0.6390799, -0.1493791, -3.354141, 0.4470588, 1, 0, 1,
-0.6386899, -0.370954, -1.994392, 0.4392157, 1, 0, 1,
-0.6375718, 1.430699, -0.7513614, 0.4352941, 1, 0, 1,
-0.6372989, 0.819528, 1.401176, 0.427451, 1, 0, 1,
-0.6356423, 0.9930133, 0.780525, 0.4235294, 1, 0, 1,
-0.6336448, -1.2905, -2.644548, 0.4156863, 1, 0, 1,
-0.6324485, -0.1809822, -2.428984, 0.4117647, 1, 0, 1,
-0.6252577, -1.407391, -4.331658, 0.4039216, 1, 0, 1,
-0.6251799, -0.8827941, -2.618302, 0.3960784, 1, 0, 1,
-0.6206053, 0.9231094, 0.1416932, 0.3921569, 1, 0, 1,
-0.6198066, 0.5621657, -0.5102657, 0.3843137, 1, 0, 1,
-0.6158201, -1.252007, -3.666457, 0.3803922, 1, 0, 1,
-0.6117021, 1.195032, -1.27151, 0.372549, 1, 0, 1,
-0.6073726, 1.395527, 1.088526, 0.3686275, 1, 0, 1,
-0.6063091, -0.885683, -2.619666, 0.3607843, 1, 0, 1,
-0.6056443, -1.292984, -3.451536, 0.3568628, 1, 0, 1,
-0.6031535, 1.003614, -0.1801976, 0.3490196, 1, 0, 1,
-0.6015998, -0.08025588, -1.929508, 0.345098, 1, 0, 1,
-0.5988483, -0.7300263, -2.216747, 0.3372549, 1, 0, 1,
-0.5977828, -1.032464, -1.816908, 0.3333333, 1, 0, 1,
-0.5957881, 0.5164707, 0.02767865, 0.3254902, 1, 0, 1,
-0.5926515, -0.1865829, -0.5539811, 0.3215686, 1, 0, 1,
-0.5898327, 0.09915292, -1.639601, 0.3137255, 1, 0, 1,
-0.5876523, 0.1730679, -2.049296, 0.3098039, 1, 0, 1,
-0.5845395, 1.499359, 1.595226, 0.3019608, 1, 0, 1,
-0.5723017, 0.2394121, -0.08421459, 0.2941177, 1, 0, 1,
-0.570434, -1.34738, -3.780019, 0.2901961, 1, 0, 1,
-0.5657548, 1.287769, -1.001596, 0.282353, 1, 0, 1,
-0.555797, -0.7715243, -2.312751, 0.2784314, 1, 0, 1,
-0.5552679, 2.436967, -0.1822357, 0.2705882, 1, 0, 1,
-0.5497913, 0.7559298, -0.3834447, 0.2666667, 1, 0, 1,
-0.5466215, 1.314495, -1.255432, 0.2588235, 1, 0, 1,
-0.5444721, 0.2667941, -0.9488261, 0.254902, 1, 0, 1,
-0.5431327, -1.121643, -3.866694, 0.2470588, 1, 0, 1,
-0.5394188, 0.7683179, -0.3978342, 0.2431373, 1, 0, 1,
-0.5349686, 0.3380878, -2.391051, 0.2352941, 1, 0, 1,
-0.5260785, -0.2755058, -3.942897, 0.2313726, 1, 0, 1,
-0.5248272, -2.952519, -2.423935, 0.2235294, 1, 0, 1,
-0.5220215, -1.647739, -1.853397, 0.2196078, 1, 0, 1,
-0.5109999, 0.9307766, -2.598151, 0.2117647, 1, 0, 1,
-0.5095848, -1.053623, -3.181836, 0.2078431, 1, 0, 1,
-0.5066432, 0.1910262, 1.148468, 0.2, 1, 0, 1,
-0.5023916, -0.8742732, -1.647037, 0.1921569, 1, 0, 1,
-0.500113, 0.1251434, -3.99241, 0.1882353, 1, 0, 1,
-0.49957, -1.244197, -4.690158, 0.1803922, 1, 0, 1,
-0.4994641, -0.1165068, -1.937922, 0.1764706, 1, 0, 1,
-0.4986616, 0.210812, -2.301459, 0.1686275, 1, 0, 1,
-0.4955179, 0.3598887, -0.441677, 0.1647059, 1, 0, 1,
-0.4932737, -0.5500683, -1.603001, 0.1568628, 1, 0, 1,
-0.4924145, -2.672424, -1.756473, 0.1529412, 1, 0, 1,
-0.488485, 0.1524221, -0.5239682, 0.145098, 1, 0, 1,
-0.4884378, 1.737752, 0.2899917, 0.1411765, 1, 0, 1,
-0.488229, 1.900804, 0.4900881, 0.1333333, 1, 0, 1,
-0.4814252, -0.4213796, -4.400331, 0.1294118, 1, 0, 1,
-0.4787268, 0.3044199, -2.20845, 0.1215686, 1, 0, 1,
-0.4769738, 0.980806, -1.726976, 0.1176471, 1, 0, 1,
-0.4748224, 0.4587047, -1.207471, 0.1098039, 1, 0, 1,
-0.4699507, 1.762707, 1.018283, 0.1058824, 1, 0, 1,
-0.4679139, -1.131551, -3.360286, 0.09803922, 1, 0, 1,
-0.4619762, -0.2566143, -1.962392, 0.09019608, 1, 0, 1,
-0.4602116, -0.7166504, -3.935619, 0.08627451, 1, 0, 1,
-0.4586783, -0.6923716, -1.994593, 0.07843138, 1, 0, 1,
-0.457903, -0.7894945, -1.994956, 0.07450981, 1, 0, 1,
-0.4553804, -1.640739, -3.647568, 0.06666667, 1, 0, 1,
-0.4531575, -0.2165822, -1.909651, 0.0627451, 1, 0, 1,
-0.4518675, 0.0328851, -1.631196, 0.05490196, 1, 0, 1,
-0.448585, 1.031273, -1.296021, 0.05098039, 1, 0, 1,
-0.4462727, 1.32793, 1.492701, 0.04313726, 1, 0, 1,
-0.4449727, -0.4064919, -3.374681, 0.03921569, 1, 0, 1,
-0.4445481, -0.3297549, -2.247303, 0.03137255, 1, 0, 1,
-0.4437672, -0.211783, -2.637723, 0.02745098, 1, 0, 1,
-0.443591, 2.048063, -0.9435481, 0.01960784, 1, 0, 1,
-0.4363305, -0.04393218, -1.679026, 0.01568628, 1, 0, 1,
-0.4315256, 0.8290975, -1.315196, 0.007843138, 1, 0, 1,
-0.4307269, 0.6706643, -0.4316727, 0.003921569, 1, 0, 1,
-0.4285578, 0.7441662, -0.8966207, 0, 1, 0.003921569, 1,
-0.4254298, 0.1685905, -2.378162, 0, 1, 0.01176471, 1,
-0.4205181, -0.6307129, -3.287916, 0, 1, 0.01568628, 1,
-0.4190802, 0.4092274, -0.3923202, 0, 1, 0.02352941, 1,
-0.415601, 0.8849444, -0.004009061, 0, 1, 0.02745098, 1,
-0.4155145, -0.08726795, -3.069198, 0, 1, 0.03529412, 1,
-0.4144065, 1.854882, 0.01244313, 0, 1, 0.03921569, 1,
-0.408234, 0.4610073, -0.3128846, 0, 1, 0.04705882, 1,
-0.4076895, 0.009300359, -2.22776, 0, 1, 0.05098039, 1,
-0.4069088, -0.5854542, -4.137248, 0, 1, 0.05882353, 1,
-0.4050393, -1.991029, -3.797235, 0, 1, 0.0627451, 1,
-0.4004879, 1.700682, -0.5174522, 0, 1, 0.07058824, 1,
-0.3949476, -1.211192, -3.219264, 0, 1, 0.07450981, 1,
-0.3945222, -0.750944, -1.874046, 0, 1, 0.08235294, 1,
-0.3933952, 0.5672956, 1.54246, 0, 1, 0.08627451, 1,
-0.3932334, -0.3059059, -2.900109, 0, 1, 0.09411765, 1,
-0.39271, 0.3467545, -3.051507, 0, 1, 0.1019608, 1,
-0.3849355, 0.4280457, -1.795479, 0, 1, 0.1058824, 1,
-0.3831533, 0.4546165, -0.4720925, 0, 1, 0.1137255, 1,
-0.3821379, 1.056375, -0.4266621, 0, 1, 0.1176471, 1,
-0.3800161, -0.371377, -2.076992, 0, 1, 0.1254902, 1,
-0.3795005, 0.8514459, 0.3460048, 0, 1, 0.1294118, 1,
-0.3765766, -0.1423525, -1.768889, 0, 1, 0.1372549, 1,
-0.3727532, 0.560786, -0.5832602, 0, 1, 0.1411765, 1,
-0.3630806, 1.726059, -1.307517, 0, 1, 0.1490196, 1,
-0.3580008, 0.216031, -1.420188, 0, 1, 0.1529412, 1,
-0.3536195, -1.46078, -2.684723, 0, 1, 0.1607843, 1,
-0.3514388, 0.5563123, -2.84355, 0, 1, 0.1647059, 1,
-0.3461426, -0.1667465, -0.3433025, 0, 1, 0.172549, 1,
-0.3443369, -0.4155008, -4.198584, 0, 1, 0.1764706, 1,
-0.343316, 0.6862083, -2.000605, 0, 1, 0.1843137, 1,
-0.3411348, -0.2566555, -3.564062, 0, 1, 0.1882353, 1,
-0.33826, 0.9345036, -1.343655, 0, 1, 0.1960784, 1,
-0.3241517, 0.5533925, -2.153291, 0, 1, 0.2039216, 1,
-0.3201078, -0.3720974, -3.496255, 0, 1, 0.2078431, 1,
-0.3194142, 1.053931, -0.8969821, 0, 1, 0.2156863, 1,
-0.3191425, -0.8995278, -1.745668, 0, 1, 0.2196078, 1,
-0.3153079, 0.2415649, 0.7419633, 0, 1, 0.227451, 1,
-0.3113742, -0.8085964, -1.943673, 0, 1, 0.2313726, 1,
-0.3108384, -0.9921361, -2.440743, 0, 1, 0.2392157, 1,
-0.3108184, 1.218045, -0.2363425, 0, 1, 0.2431373, 1,
-0.3051459, -2.013453, -3.588905, 0, 1, 0.2509804, 1,
-0.3046462, 0.7326565, 2.026871, 0, 1, 0.254902, 1,
-0.2997119, -0.01122223, -0.09502443, 0, 1, 0.2627451, 1,
-0.2995583, 0.06684384, -1.254056, 0, 1, 0.2666667, 1,
-0.2969393, 2.337515, -0.6215692, 0, 1, 0.2745098, 1,
-0.2956803, 0.7422745, 0.3269698, 0, 1, 0.2784314, 1,
-0.2871166, 1.068867, -0.5833045, 0, 1, 0.2862745, 1,
-0.2837314, 0.4128307, -1.535566, 0, 1, 0.2901961, 1,
-0.2831487, 0.6115366, 0.4711035, 0, 1, 0.2980392, 1,
-0.2815687, 0.7358492, 0.5872074, 0, 1, 0.3058824, 1,
-0.2774709, 1.269683, -0.3075185, 0, 1, 0.3098039, 1,
-0.2760831, 0.3046579, -0.1677576, 0, 1, 0.3176471, 1,
-0.2741059, -0.6631972, -1.834551, 0, 1, 0.3215686, 1,
-0.2732902, 0.06005885, -2.309785, 0, 1, 0.3294118, 1,
-0.2693859, -0.408182, -3.026136, 0, 1, 0.3333333, 1,
-0.2675971, 0.6121606, -2.8818, 0, 1, 0.3411765, 1,
-0.2579811, 0.3705166, -1.407555, 0, 1, 0.345098, 1,
-0.2530462, -0.4021963, -1.651512, 0, 1, 0.3529412, 1,
-0.2500308, 0.1406322, -0.09838887, 0, 1, 0.3568628, 1,
-0.2495376, -1.080129, -1.056398, 0, 1, 0.3647059, 1,
-0.2478581, -0.06693523, -2.969191, 0, 1, 0.3686275, 1,
-0.2477923, 2.398829, 0.407768, 0, 1, 0.3764706, 1,
-0.2451339, -0.2918458, -3.362882, 0, 1, 0.3803922, 1,
-0.2434999, -0.8548586, -3.032138, 0, 1, 0.3882353, 1,
-0.2409066, 0.6481789, 0.2783637, 0, 1, 0.3921569, 1,
-0.2252962, -1.20228, -2.905187, 0, 1, 0.4, 1,
-0.2211014, -0.003108907, -3.073308, 0, 1, 0.4078431, 1,
-0.2181304, -1.612425, -3.171098, 0, 1, 0.4117647, 1,
-0.2131683, 0.387204, -0.685504, 0, 1, 0.4196078, 1,
-0.2111781, 0.3258941, -0.2583852, 0, 1, 0.4235294, 1,
-0.210411, 1.238313, -1.22177, 0, 1, 0.4313726, 1,
-0.2101015, 0.8182741, -1.48335, 0, 1, 0.4352941, 1,
-0.209417, 0.390126, -0.7625944, 0, 1, 0.4431373, 1,
-0.2093253, 0.02065033, 0.159206, 0, 1, 0.4470588, 1,
-0.2090007, -0.5504259, -3.502614, 0, 1, 0.454902, 1,
-0.2078101, -0.6749258, -2.01576, 0, 1, 0.4588235, 1,
-0.2066581, -0.2843178, -2.929927, 0, 1, 0.4666667, 1,
-0.2047285, 0.8836359, -0.4403376, 0, 1, 0.4705882, 1,
-0.2027443, 0.6211516, -0.4320064, 0, 1, 0.4784314, 1,
-0.2021444, 0.4637925, 1.264204, 0, 1, 0.4823529, 1,
-0.1997801, 0.8962317, -0.8064896, 0, 1, 0.4901961, 1,
-0.1923238, 0.7229008, 0.1290399, 0, 1, 0.4941176, 1,
-0.1895739, -0.3542778, -3.077641, 0, 1, 0.5019608, 1,
-0.1892217, -0.8385108, -2.120813, 0, 1, 0.509804, 1,
-0.1887904, 0.4647346, -0.754024, 0, 1, 0.5137255, 1,
-0.1882102, 0.9091619, -0.9140424, 0, 1, 0.5215687, 1,
-0.1880053, 2.383417, 0.09369015, 0, 1, 0.5254902, 1,
-0.1848383, -0.5025943, -1.42412, 0, 1, 0.5333334, 1,
-0.1837007, -1.252971, -2.917947, 0, 1, 0.5372549, 1,
-0.1814138, -1.35781, -3.906277, 0, 1, 0.5450981, 1,
-0.1773393, -0.6671087, -4.65935, 0, 1, 0.5490196, 1,
-0.1765336, -0.9844718, -4.338919, 0, 1, 0.5568628, 1,
-0.1763701, -0.1124544, -2.15327, 0, 1, 0.5607843, 1,
-0.1752116, 0.2265653, -1.043618, 0, 1, 0.5686275, 1,
-0.1692241, -0.3879532, -1.764027, 0, 1, 0.572549, 1,
-0.1689783, -0.5744356, -3.026182, 0, 1, 0.5803922, 1,
-0.165821, -1.176152, -1.614133, 0, 1, 0.5843138, 1,
-0.1649839, 0.1266406, -1.725561, 0, 1, 0.5921569, 1,
-0.1585086, 1.887786, -2.215627, 0, 1, 0.5960785, 1,
-0.1582053, -0.358669, -3.34397, 0, 1, 0.6039216, 1,
-0.1570719, -0.2679458, -0.9052328, 0, 1, 0.6117647, 1,
-0.1568387, 0.6792878, -0.6370553, 0, 1, 0.6156863, 1,
-0.1514771, -0.2374597, -2.074304, 0, 1, 0.6235294, 1,
-0.1447949, -0.905417, -4.338663, 0, 1, 0.627451, 1,
-0.1423344, -0.1721323, -1.149521, 0, 1, 0.6352941, 1,
-0.1389899, -0.1866435, -3.242484, 0, 1, 0.6392157, 1,
-0.1367065, 0.3918197, -0.6608735, 0, 1, 0.6470588, 1,
-0.1335564, 0.6065584, -0.8137871, 0, 1, 0.6509804, 1,
-0.1331983, -0.5317519, -2.73996, 0, 1, 0.6588235, 1,
-0.1271181, 0.1013823, -2.038588, 0, 1, 0.6627451, 1,
-0.1261012, 1.571956, -1.962226, 0, 1, 0.6705883, 1,
-0.122857, 0.6028637, -0.8478092, 0, 1, 0.6745098, 1,
-0.122764, -0.4210277, -2.136495, 0, 1, 0.682353, 1,
-0.1206086, -1.067803, -1.931821, 0, 1, 0.6862745, 1,
-0.1176715, 0.9511567, -0.4443547, 0, 1, 0.6941177, 1,
-0.1151009, -0.110053, -1.613204, 0, 1, 0.7019608, 1,
-0.1124782, -0.254594, -1.240772, 0, 1, 0.7058824, 1,
-0.1085728, 0.1142977, 0.5705878, 0, 1, 0.7137255, 1,
-0.1036055, -0.7882986, -3.091696, 0, 1, 0.7176471, 1,
-0.1025756, -0.3427055, -2.011013, 0, 1, 0.7254902, 1,
-0.09753375, 0.2199046, 2.132666, 0, 1, 0.7294118, 1,
-0.09481944, -0.8098788, -2.225901, 0, 1, 0.7372549, 1,
-0.09204857, 1.155492, 1.085212, 0, 1, 0.7411765, 1,
-0.09110875, -0.8499391, -2.467673, 0, 1, 0.7490196, 1,
-0.09041251, 0.05154176, -0.5076231, 0, 1, 0.7529412, 1,
-0.0901628, -0.6731226, -1.847795, 0, 1, 0.7607843, 1,
-0.09003333, -1.266607, -2.882881, 0, 1, 0.7647059, 1,
-0.08877626, -0.1084147, -1.839157, 0, 1, 0.772549, 1,
-0.08786318, 1.7111, -0.4995129, 0, 1, 0.7764706, 1,
-0.08561714, 0.02141676, 0.2039939, 0, 1, 0.7843137, 1,
-0.08310059, 0.2990237, -0.4717896, 0, 1, 0.7882353, 1,
-0.08167377, -0.686374, -3.258951, 0, 1, 0.7960784, 1,
-0.0814845, 1.503749, -0.7556477, 0, 1, 0.8039216, 1,
-0.08069099, -0.5145207, -3.59465, 0, 1, 0.8078431, 1,
-0.08034958, -0.3148346, -2.37764, 0, 1, 0.8156863, 1,
-0.07971243, 0.3690387, -0.720806, 0, 1, 0.8196079, 1,
-0.07644415, -0.08235405, -1.72622, 0, 1, 0.827451, 1,
-0.07564197, -0.661814, -2.55498, 0, 1, 0.8313726, 1,
-0.06760403, 0.7349574, -0.2581355, 0, 1, 0.8392157, 1,
-0.06748606, -0.8464467, -3.067086, 0, 1, 0.8431373, 1,
-0.061847, 1.612069, -0.3912515, 0, 1, 0.8509804, 1,
-0.05935674, -0.7983015, -3.221121, 0, 1, 0.854902, 1,
-0.05549352, 0.6071554, 0.8081928, 0, 1, 0.8627451, 1,
-0.04846228, 0.4931821, -0.08912103, 0, 1, 0.8666667, 1,
-0.04841407, -0.4804924, -3.35106, 0, 1, 0.8745098, 1,
-0.04800467, 2.002097, -0.6164205, 0, 1, 0.8784314, 1,
-0.0458868, 0.1159236, 0.8642336, 0, 1, 0.8862745, 1,
-0.04217426, 0.3069796, -0.9785477, 0, 1, 0.8901961, 1,
-0.04011221, 0.9589193, 0.5203612, 0, 1, 0.8980392, 1,
-0.03655435, 0.1146617, -0.1623578, 0, 1, 0.9058824, 1,
-0.03576592, -1.501716, -1.936674, 0, 1, 0.9098039, 1,
-0.02484507, -0.3596425, -2.74956, 0, 1, 0.9176471, 1,
-0.02408047, 0.1505377, 0.3862242, 0, 1, 0.9215686, 1,
-0.02286919, -0.8065251, -1.825173, 0, 1, 0.9294118, 1,
-0.02271284, -0.2119109, -4.036118, 0, 1, 0.9333333, 1,
-0.02002804, -2.486628, -3.411966, 0, 1, 0.9411765, 1,
-0.01912777, -0.3859383, -1.005441, 0, 1, 0.945098, 1,
-0.0170598, -1.162806, -3.099891, 0, 1, 0.9529412, 1,
-0.01559765, -0.2806417, -2.631586, 0, 1, 0.9568627, 1,
-0.01359117, 0.7386956, 0.9621266, 0, 1, 0.9647059, 1,
-0.01348514, -0.2902044, -2.675018, 0, 1, 0.9686275, 1,
-0.012377, -0.589857, -1.860855, 0, 1, 0.9764706, 1,
-0.01180412, 1.302247, 0.384635, 0, 1, 0.9803922, 1,
-0.008510202, 0.2399967, 0.09216104, 0, 1, 0.9882353, 1,
-0.005043255, 0.8851786, 0.2389194, 0, 1, 0.9921569, 1,
-0.00436433, -2.041544, -2.719874, 0, 1, 1, 1,
-0.004191489, 0.2920884, 0.8799278, 0, 0.9921569, 1, 1,
-0.003933939, -0.9950322, -2.584883, 0, 0.9882353, 1, 1,
-0.003559866, 0.9962048, -1.281517, 0, 0.9803922, 1, 1,
-0.001127579, 0.3794439, 1.033748, 0, 0.9764706, 1, 1,
0.003276918, -0.01869877, 2.375993, 0, 0.9686275, 1, 1,
0.003593599, 0.7141134, -1.048172, 0, 0.9647059, 1, 1,
0.004169882, -0.4827722, 1.65879, 0, 0.9568627, 1, 1,
0.01398473, -0.6515961, 2.522638, 0, 0.9529412, 1, 1,
0.01503703, -0.8287678, 3.76213, 0, 0.945098, 1, 1,
0.01730795, 1.197936, 1.368374, 0, 0.9411765, 1, 1,
0.01828723, 1.090986, -0.6527728, 0, 0.9333333, 1, 1,
0.02195662, -0.1690069, 3.894298, 0, 0.9294118, 1, 1,
0.02795623, -1.1158, 3.888832, 0, 0.9215686, 1, 1,
0.02999892, 0.5074613, -0.7691633, 0, 0.9176471, 1, 1,
0.03028351, -0.21397, 2.953718, 0, 0.9098039, 1, 1,
0.03129647, 1.168808, -0.5521442, 0, 0.9058824, 1, 1,
0.0332163, -1.39576, 2.362069, 0, 0.8980392, 1, 1,
0.03321801, 0.1653411, -0.09805847, 0, 0.8901961, 1, 1,
0.03623327, 0.6601598, -0.2240696, 0, 0.8862745, 1, 1,
0.0368993, -0.4679184, 2.728599, 0, 0.8784314, 1, 1,
0.04216108, 0.08802042, -0.4057375, 0, 0.8745098, 1, 1,
0.04303663, -0.5985069, 2.716206, 0, 0.8666667, 1, 1,
0.04368863, 0.08176772, 2.007567, 0, 0.8627451, 1, 1,
0.04465109, 0.08962397, -0.5049071, 0, 0.854902, 1, 1,
0.04605858, 0.8347831, 0.7475416, 0, 0.8509804, 1, 1,
0.04637432, -0.7607453, 3.937148, 0, 0.8431373, 1, 1,
0.05895401, -0.3441077, 2.722659, 0, 0.8392157, 1, 1,
0.0621646, 0.1344945, -1.088525, 0, 0.8313726, 1, 1,
0.06582586, 0.9264656, -1.803465, 0, 0.827451, 1, 1,
0.06815687, -0.455687, 2.99193, 0, 0.8196079, 1, 1,
0.07643962, 1.449797, -1.467765, 0, 0.8156863, 1, 1,
0.07710773, 0.4689371, 0.5341578, 0, 0.8078431, 1, 1,
0.07976325, -0.9113782, 2.842152, 0, 0.8039216, 1, 1,
0.08313804, -0.1800259, 3.217655, 0, 0.7960784, 1, 1,
0.08376747, -0.91434, 3.078937, 0, 0.7882353, 1, 1,
0.08411491, -1.527671, 4.426703, 0, 0.7843137, 1, 1,
0.08703276, -0.3403707, 4.673629, 0, 0.7764706, 1, 1,
0.09294071, 0.8985367, -0.4144668, 0, 0.772549, 1, 1,
0.09378348, 0.2421562, 1.134962, 0, 0.7647059, 1, 1,
0.0938535, -0.4254733, 1.628713, 0, 0.7607843, 1, 1,
0.09525439, 2.331167, 0.2497542, 0, 0.7529412, 1, 1,
0.09756041, 1.438316, 0.002208997, 0, 0.7490196, 1, 1,
0.0982619, 0.2951682, 0.7715293, 0, 0.7411765, 1, 1,
0.09980427, 0.3346038, -0.0884821, 0, 0.7372549, 1, 1,
0.1045734, 0.05210648, -0.3717549, 0, 0.7294118, 1, 1,
0.1094012, -0.2066822, 3.132909, 0, 0.7254902, 1, 1,
0.1100387, -1.092921, 2.330144, 0, 0.7176471, 1, 1,
0.1106026, 0.5668843, -1.228441, 0, 0.7137255, 1, 1,
0.1110807, -0.5671628, 3.200965, 0, 0.7058824, 1, 1,
0.1116172, -1.59339, 2.636969, 0, 0.6980392, 1, 1,
0.1168614, -0.4633195, 4.431072, 0, 0.6941177, 1, 1,
0.1172203, 0.2670465, -0.1508219, 0, 0.6862745, 1, 1,
0.1330017, 0.5433559, 0.3393356, 0, 0.682353, 1, 1,
0.1338619, -1.336235, 2.117333, 0, 0.6745098, 1, 1,
0.134163, 0.03231923, 0.7780576, 0, 0.6705883, 1, 1,
0.1360765, -0.1215174, 2.652234, 0, 0.6627451, 1, 1,
0.1411271, 0.3573107, -0.1491524, 0, 0.6588235, 1, 1,
0.1435055, -1.05818, 4.091199, 0, 0.6509804, 1, 1,
0.1443532, 0.09497678, 1.482212, 0, 0.6470588, 1, 1,
0.1458945, -0.6049454, 2.150729, 0, 0.6392157, 1, 1,
0.1472839, -2.756767, 4.809512, 0, 0.6352941, 1, 1,
0.1478098, -0.80089, 4.010041, 0, 0.627451, 1, 1,
0.1520796, -0.09883642, 2.420551, 0, 0.6235294, 1, 1,
0.1544932, -0.4105001, 2.899884, 0, 0.6156863, 1, 1,
0.1550728, -2.604618, 3.013012, 0, 0.6117647, 1, 1,
0.1553116, -0.2214572, 0.1107197, 0, 0.6039216, 1, 1,
0.156, 0.881948, 1.179259, 0, 0.5960785, 1, 1,
0.1575589, 1.359073, -0.464408, 0, 0.5921569, 1, 1,
0.1580805, 1.395622, -0.5066319, 0, 0.5843138, 1, 1,
0.1599933, 1.528917, -1.641104, 0, 0.5803922, 1, 1,
0.1607402, 0.3561227, 1.937141, 0, 0.572549, 1, 1,
0.1612582, 1.238912, -1.06994, 0, 0.5686275, 1, 1,
0.1626684, 0.9134581, 1.140055, 0, 0.5607843, 1, 1,
0.1639086, 0.5034205, 2.56645, 0, 0.5568628, 1, 1,
0.1643031, -1.055497, 3.641171, 0, 0.5490196, 1, 1,
0.1649435, -0.9756978, 4.726182, 0, 0.5450981, 1, 1,
0.1657862, 0.5452411, 1.326022, 0, 0.5372549, 1, 1,
0.1669388, 0.5682901, -0.08074532, 0, 0.5333334, 1, 1,
0.1692275, 0.4528967, 0.4947929, 0, 0.5254902, 1, 1,
0.1739632, 0.07868067, 0.882614, 0, 0.5215687, 1, 1,
0.1786047, -0.5671063, 2.431815, 0, 0.5137255, 1, 1,
0.1887313, -0.9650621, 3.538828, 0, 0.509804, 1, 1,
0.1910304, -1.348346, 2.593707, 0, 0.5019608, 1, 1,
0.1935055, 0.1294398, 2.623103, 0, 0.4941176, 1, 1,
0.1935213, 1.449467, -0.1125563, 0, 0.4901961, 1, 1,
0.1970281, -1.322382, 2.686475, 0, 0.4823529, 1, 1,
0.1987677, 0.004323796, 2.03449, 0, 0.4784314, 1, 1,
0.2024956, 0.8242655, 0.7469264, 0, 0.4705882, 1, 1,
0.2055856, 0.437295, 1.421836, 0, 0.4666667, 1, 1,
0.2070641, -0.5995505, 2.623437, 0, 0.4588235, 1, 1,
0.2091092, 0.4609281, -1.598705, 0, 0.454902, 1, 1,
0.2163928, 0.540017, -1.050271, 0, 0.4470588, 1, 1,
0.2182002, -1.768534, 3.160022, 0, 0.4431373, 1, 1,
0.2187461, -0.02809793, 1.706216, 0, 0.4352941, 1, 1,
0.2194015, -0.288682, 3.023758, 0, 0.4313726, 1, 1,
0.2232714, -1.325953, 4.323413, 0, 0.4235294, 1, 1,
0.2238187, 0.4053188, 1.074929, 0, 0.4196078, 1, 1,
0.2287241, -0.5374458, 4.019858, 0, 0.4117647, 1, 1,
0.2352532, 0.07637326, 1.996568, 0, 0.4078431, 1, 1,
0.2370292, 0.3723208, 0.761865, 0, 0.4, 1, 1,
0.2390486, 0.5642104, 3.010321, 0, 0.3921569, 1, 1,
0.241374, -0.3013465, 2.228955, 0, 0.3882353, 1, 1,
0.2459961, -0.7467771, 3.502713, 0, 0.3803922, 1, 1,
0.2472895, 0.3165919, 2.371068, 0, 0.3764706, 1, 1,
0.2480568, 1.511714, -1.953046, 0, 0.3686275, 1, 1,
0.2533444, -0.4718606, 1.192961, 0, 0.3647059, 1, 1,
0.2538321, -2.39884, 3.579947, 0, 0.3568628, 1, 1,
0.2591061, -2.134492, 2.865932, 0, 0.3529412, 1, 1,
0.2597088, -0.8955529, 2.569892, 0, 0.345098, 1, 1,
0.2615885, -0.2989215, 4.866891, 0, 0.3411765, 1, 1,
0.2636092, -0.3515122, 3.239558, 0, 0.3333333, 1, 1,
0.267211, 0.9920576, 0.6614991, 0, 0.3294118, 1, 1,
0.2699911, 0.8901053, -0.2175505, 0, 0.3215686, 1, 1,
0.2733482, -0.3001527, 3.095681, 0, 0.3176471, 1, 1,
0.274815, 0.271933, 0.5281536, 0, 0.3098039, 1, 1,
0.2801853, -0.4710624, 3.348686, 0, 0.3058824, 1, 1,
0.2855139, 0.4670853, 0.7046214, 0, 0.2980392, 1, 1,
0.2857095, 1.262173, -0.2580381, 0, 0.2901961, 1, 1,
0.2879083, 1.147524, 0.6666223, 0, 0.2862745, 1, 1,
0.2893893, 0.07514168, 0.8756841, 0, 0.2784314, 1, 1,
0.2894456, 1.520776, 2.00724, 0, 0.2745098, 1, 1,
0.2914123, -0.1800195, 2.624738, 0, 0.2666667, 1, 1,
0.2934509, 0.1585986, 2.033065, 0, 0.2627451, 1, 1,
0.2946739, -0.8448605, 3.441085, 0, 0.254902, 1, 1,
0.2971265, 0.7413456, 0.1236695, 0, 0.2509804, 1, 1,
0.299397, 0.8557792, -0.006533606, 0, 0.2431373, 1, 1,
0.2999547, 0.8201477, -0.37374, 0, 0.2392157, 1, 1,
0.3003778, 0.7190266, -0.5895254, 0, 0.2313726, 1, 1,
0.3017117, 0.8595732, 2.514107, 0, 0.227451, 1, 1,
0.3022718, 0.501251, 1.313679, 0, 0.2196078, 1, 1,
0.3069378, 0.5828353, 2.77913, 0, 0.2156863, 1, 1,
0.3077095, -0.5349905, 3.024745, 0, 0.2078431, 1, 1,
0.3153349, -0.4769708, 0.712975, 0, 0.2039216, 1, 1,
0.3155824, -0.01595329, 1.384008, 0, 0.1960784, 1, 1,
0.3205666, 0.2570464, -0.1827306, 0, 0.1882353, 1, 1,
0.3208688, 0.3300636, 0.160811, 0, 0.1843137, 1, 1,
0.3209866, 0.8013659, 0.9134705, 0, 0.1764706, 1, 1,
0.3210557, 0.4892376, 0.9652568, 0, 0.172549, 1, 1,
0.3212305, -0.6233073, 2.924747, 0, 0.1647059, 1, 1,
0.3295159, 0.04177551, 1.120944, 0, 0.1607843, 1, 1,
0.3308977, 0.2027558, 2.137022, 0, 0.1529412, 1, 1,
0.3340524, 2.273649, -1.096103, 0, 0.1490196, 1, 1,
0.3343999, 0.3499696, 1.25974, 0, 0.1411765, 1, 1,
0.3354416, -0.6951891, 3.261781, 0, 0.1372549, 1, 1,
0.3420533, -0.5680248, 1.20814, 0, 0.1294118, 1, 1,
0.3440601, -0.6613694, 3.470516, 0, 0.1254902, 1, 1,
0.3449076, -1.826103, 4.141205, 0, 0.1176471, 1, 1,
0.3482312, -0.7268605, 2.455692, 0, 0.1137255, 1, 1,
0.3515607, -0.2338146, 3.612892, 0, 0.1058824, 1, 1,
0.3549999, -0.9006085, 3.787474, 0, 0.09803922, 1, 1,
0.3551975, -0.7132757, 2.728041, 0, 0.09411765, 1, 1,
0.3635375, 1.153515, 0.2788807, 0, 0.08627451, 1, 1,
0.3659791, 0.1745911, 1.164794, 0, 0.08235294, 1, 1,
0.369447, 1.366206, 0.872835, 0, 0.07450981, 1, 1,
0.3695716, -0.002688833, 1.867967, 0, 0.07058824, 1, 1,
0.3716562, 1.649824, -1.072724, 0, 0.0627451, 1, 1,
0.3733741, -2.18793, 1.12114, 0, 0.05882353, 1, 1,
0.3734861, 0.1491127, -0.07383665, 0, 0.05098039, 1, 1,
0.3742484, -0.3202472, 3.039095, 0, 0.04705882, 1, 1,
0.3752362, 0.7545355, 0.3799228, 0, 0.03921569, 1, 1,
0.3761054, -0.2317904, 3.783582, 0, 0.03529412, 1, 1,
0.3768647, -0.9934525, 3.091664, 0, 0.02745098, 1, 1,
0.3771308, 0.7551063, 0.1128518, 0, 0.02352941, 1, 1,
0.3779756, 1.105932, 0.4467335, 0, 0.01568628, 1, 1,
0.3796538, -0.8026216, 3.864186, 0, 0.01176471, 1, 1,
0.3800896, 0.6975188, 0.7422082, 0, 0.003921569, 1, 1,
0.3829719, 1.235897, 0.6184771, 0.003921569, 0, 1, 1,
0.3838409, -0.1133107, 1.808918, 0.007843138, 0, 1, 1,
0.3902076, 1.551147, 2.354213, 0.01568628, 0, 1, 1,
0.3925592, -0.5894755, 3.30101, 0.01960784, 0, 1, 1,
0.393548, 0.1341849, 2.469691, 0.02745098, 0, 1, 1,
0.4072473, 1.106055, 0.6559454, 0.03137255, 0, 1, 1,
0.4101535, -0.8011217, 1.812135, 0.03921569, 0, 1, 1,
0.4111578, 0.6795952, -0.1827054, 0.04313726, 0, 1, 1,
0.4151091, 1.576978, 0.3515473, 0.05098039, 0, 1, 1,
0.4156236, -0.03338915, 2.551384, 0.05490196, 0, 1, 1,
0.4183953, 0.6598247, 0.3952324, 0.0627451, 0, 1, 1,
0.4184282, -0.9420435, 1.212172, 0.06666667, 0, 1, 1,
0.4217525, 0.6442335, 0.5581547, 0.07450981, 0, 1, 1,
0.4247112, 0.3518225, 0.05785464, 0.07843138, 0, 1, 1,
0.4305491, -0.2069258, 1.977763, 0.08627451, 0, 1, 1,
0.4314406, 0.2532699, 2.802138, 0.09019608, 0, 1, 1,
0.4322743, -0.4095723, 1.814857, 0.09803922, 0, 1, 1,
0.4353535, 0.4072286, 0.5722608, 0.1058824, 0, 1, 1,
0.437397, 1.226522, 0.4694881, 0.1098039, 0, 1, 1,
0.4396721, 1.014524, 1.459284, 0.1176471, 0, 1, 1,
0.4425481, 0.8835303, 0.9850678, 0.1215686, 0, 1, 1,
0.4429097, -0.8157473, 3.989369, 0.1294118, 0, 1, 1,
0.4435658, 1.074447, -1.058244, 0.1333333, 0, 1, 1,
0.4467672, -0.9168308, 2.503886, 0.1411765, 0, 1, 1,
0.4506159, 0.0828801, 0.6038907, 0.145098, 0, 1, 1,
0.4674132, -0.3766504, 3.314895, 0.1529412, 0, 1, 1,
0.4698373, -0.70912, 0.7405171, 0.1568628, 0, 1, 1,
0.4708783, 0.4517158, -0.3805794, 0.1647059, 0, 1, 1,
0.4747178, 0.1731471, 2.125268, 0.1686275, 0, 1, 1,
0.475079, -0.221197, 0.9085397, 0.1764706, 0, 1, 1,
0.4763135, 1.274654, 2.096393, 0.1803922, 0, 1, 1,
0.4768842, 0.3692032, 0.889569, 0.1882353, 0, 1, 1,
0.4796407, 0.4596504, -0.4440856, 0.1921569, 0, 1, 1,
0.4804499, -0.01686581, 1.792972, 0.2, 0, 1, 1,
0.4829395, -0.9455667, 2.549026, 0.2078431, 0, 1, 1,
0.4838131, 0.7440907, 1.471463, 0.2117647, 0, 1, 1,
0.4860224, -0.1642499, 0.9251453, 0.2196078, 0, 1, 1,
0.4932455, -0.5113915, 2.782631, 0.2235294, 0, 1, 1,
0.4934718, 1.294183, 2.421217, 0.2313726, 0, 1, 1,
0.4992066, 1.68969, 1.554965, 0.2352941, 0, 1, 1,
0.5039561, 1.061104, 1.459467, 0.2431373, 0, 1, 1,
0.5069935, 1.973052, 0.4870126, 0.2470588, 0, 1, 1,
0.5072226, -0.5307334, 2.879186, 0.254902, 0, 1, 1,
0.5078876, -1.055096, 3.824699, 0.2588235, 0, 1, 1,
0.5250102, 0.6459486, 0.8100565, 0.2666667, 0, 1, 1,
0.5280817, -1.306615, 2.780424, 0.2705882, 0, 1, 1,
0.5280971, -0.7751051, 1.263565, 0.2784314, 0, 1, 1,
0.5288104, -0.3621865, 2.242636, 0.282353, 0, 1, 1,
0.5296468, -0.5180908, 2.521635, 0.2901961, 0, 1, 1,
0.5330497, -0.1928664, 2.648059, 0.2941177, 0, 1, 1,
0.542199, 0.1564502, 0.3193878, 0.3019608, 0, 1, 1,
0.542776, -2.032871, 2.697823, 0.3098039, 0, 1, 1,
0.5441132, 0.8969804, -0.3797505, 0.3137255, 0, 1, 1,
0.5555961, 0.9804834, 0.2008324, 0.3215686, 0, 1, 1,
0.557807, -0.03112162, 2.040123, 0.3254902, 0, 1, 1,
0.5649909, -1.005154, 3.140565, 0.3333333, 0, 1, 1,
0.5688108, 0.951237, 0.9602912, 0.3372549, 0, 1, 1,
0.5723118, 1.782928, -0.05745249, 0.345098, 0, 1, 1,
0.5738407, -0.8211482, 1.726208, 0.3490196, 0, 1, 1,
0.5776133, -2.584909, 2.034384, 0.3568628, 0, 1, 1,
0.5813236, -0.796109, 3.055547, 0.3607843, 0, 1, 1,
0.5817019, -0.5776007, 1.604447, 0.3686275, 0, 1, 1,
0.581722, -0.09443774, 1.151056, 0.372549, 0, 1, 1,
0.5818686, 0.4135433, 2.75745, 0.3803922, 0, 1, 1,
0.5828975, 1.22408, 0.7886223, 0.3843137, 0, 1, 1,
0.5848553, 0.981183, 1.924794, 0.3921569, 0, 1, 1,
0.5915715, -1.628279, 3.354153, 0.3960784, 0, 1, 1,
0.5922395, -1.448723, 3.120844, 0.4039216, 0, 1, 1,
0.5991434, 0.8967044, 0.9874849, 0.4117647, 0, 1, 1,
0.5993335, -0.6876523, 2.584472, 0.4156863, 0, 1, 1,
0.5997663, 0.1269425, 2.859203, 0.4235294, 0, 1, 1,
0.6147736, 0.5372808, 2.114716, 0.427451, 0, 1, 1,
0.6163262, 0.3090999, 2.394877, 0.4352941, 0, 1, 1,
0.6189216, 0.5732819, 1.395019, 0.4392157, 0, 1, 1,
0.6244547, 2.650077, -0.5384532, 0.4470588, 0, 1, 1,
0.6294697, -0.2983467, 1.338235, 0.4509804, 0, 1, 1,
0.6328263, 0.2956392, 0.9564359, 0.4588235, 0, 1, 1,
0.6349534, -0.2152855, 0.6337822, 0.4627451, 0, 1, 1,
0.6373098, 0.6897424, 0.2968411, 0.4705882, 0, 1, 1,
0.6396989, 0.1772334, 1.180349, 0.4745098, 0, 1, 1,
0.6402806, 0.2602175, 1.888245, 0.4823529, 0, 1, 1,
0.6406208, 0.9428597, -0.1646069, 0.4862745, 0, 1, 1,
0.6417788, -1.093965, 3.541388, 0.4941176, 0, 1, 1,
0.643492, -0.2820334, 1.127809, 0.5019608, 0, 1, 1,
0.645565, 0.1948661, 1.596843, 0.5058824, 0, 1, 1,
0.6462367, -0.5872221, 1.343888, 0.5137255, 0, 1, 1,
0.6492277, -2.115614, 2.774087, 0.5176471, 0, 1, 1,
0.6566839, 0.7853376, 1.123902, 0.5254902, 0, 1, 1,
0.6626586, 1.214254, -0.5377916, 0.5294118, 0, 1, 1,
0.6664492, -2.219741, 3.127714, 0.5372549, 0, 1, 1,
0.6681802, -2.911248, 2.100482, 0.5411765, 0, 1, 1,
0.6697907, -1.356171, 2.838177, 0.5490196, 0, 1, 1,
0.6698569, 1.093293, 0.4986121, 0.5529412, 0, 1, 1,
0.6721796, 0.5759224, 1.38908, 0.5607843, 0, 1, 1,
0.6723339, 0.761048, 0.6548563, 0.5647059, 0, 1, 1,
0.6759161, -0.6333111, 2.433472, 0.572549, 0, 1, 1,
0.6760229, 0.9108853, 0.4235282, 0.5764706, 0, 1, 1,
0.6761408, -0.513733, 2.649079, 0.5843138, 0, 1, 1,
0.6763217, -1.522747, 3.225134, 0.5882353, 0, 1, 1,
0.682587, -0.0460523, 2.803655, 0.5960785, 0, 1, 1,
0.6869497, -0.2764195, 1.184799, 0.6039216, 0, 1, 1,
0.6904571, -0.2664269, 2.430543, 0.6078432, 0, 1, 1,
0.6933073, -0.2945147, 2.403589, 0.6156863, 0, 1, 1,
0.6938652, 0.08319523, 1.154687, 0.6196079, 0, 1, 1,
0.6958907, 0.1674198, 3.134598, 0.627451, 0, 1, 1,
0.697866, 0.551658, 0.6610859, 0.6313726, 0, 1, 1,
0.7045991, 2.07538, -0.1745948, 0.6392157, 0, 1, 1,
0.707507, 0.8249816, 0.9400582, 0.6431373, 0, 1, 1,
0.7079413, -2.305153, 2.306049, 0.6509804, 0, 1, 1,
0.7083145, -0.1303236, 2.631851, 0.654902, 0, 1, 1,
0.7227442, 0.0235785, 1.250274, 0.6627451, 0, 1, 1,
0.7231607, -0.7781332, 3.743465, 0.6666667, 0, 1, 1,
0.7232179, -2.084673, 3.781709, 0.6745098, 0, 1, 1,
0.7240093, 0.5416992, 1.195403, 0.6784314, 0, 1, 1,
0.7287705, 1.947044, -0.2397446, 0.6862745, 0, 1, 1,
0.7298304, -0.1117866, 1.861524, 0.6901961, 0, 1, 1,
0.7349921, 0.3657109, 2.44384, 0.6980392, 0, 1, 1,
0.7430866, -0.1691835, 3.018847, 0.7058824, 0, 1, 1,
0.7441452, 2.117036, -0.1528086, 0.7098039, 0, 1, 1,
0.7497461, -0.548333, 2.932337, 0.7176471, 0, 1, 1,
0.7540726, -0.09960733, 1.694447, 0.7215686, 0, 1, 1,
0.7546371, 1.723694, 1.680515, 0.7294118, 0, 1, 1,
0.7554244, 0.6848042, -0.881122, 0.7333333, 0, 1, 1,
0.7612589, 0.885326, 0.5991946, 0.7411765, 0, 1, 1,
0.7636303, -0.4515606, 1.597231, 0.7450981, 0, 1, 1,
0.7645991, 0.4091291, 0.9506425, 0.7529412, 0, 1, 1,
0.7666255, 0.74484, 1.420154, 0.7568628, 0, 1, 1,
0.7734474, -1.810802, 1.637834, 0.7647059, 0, 1, 1,
0.7785183, -2.150094, 1.989835, 0.7686275, 0, 1, 1,
0.7841625, -0.3546907, 2.327124, 0.7764706, 0, 1, 1,
0.7845052, -1.167516, 4.502028, 0.7803922, 0, 1, 1,
0.784843, 0.9749616, 0.8860633, 0.7882353, 0, 1, 1,
0.7915462, -1.845557, 2.651468, 0.7921569, 0, 1, 1,
0.7956961, 0.07708046, 2.043759, 0.8, 0, 1, 1,
0.7979762, 1.083143, 1.862095, 0.8078431, 0, 1, 1,
0.8026038, 0.9918621, -0.8522611, 0.8117647, 0, 1, 1,
0.8050473, -1.03389, 2.213115, 0.8196079, 0, 1, 1,
0.8124544, -1.517873, 2.399806, 0.8235294, 0, 1, 1,
0.8125833, -0.02082119, 3.679248, 0.8313726, 0, 1, 1,
0.8159411, 0.6100373, 0.7470471, 0.8352941, 0, 1, 1,
0.8159497, 0.2239725, 0.8208812, 0.8431373, 0, 1, 1,
0.8162349, -0.136008, 2.185748, 0.8470588, 0, 1, 1,
0.8172016, 0.5952421, 0.01321496, 0.854902, 0, 1, 1,
0.8198928, 1.104684, 1.496679, 0.8588235, 0, 1, 1,
0.8253538, -0.3542222, 1.200679, 0.8666667, 0, 1, 1,
0.8385563, 0.1369034, 0.9293424, 0.8705882, 0, 1, 1,
0.8414201, 1.314035, -0.8562059, 0.8784314, 0, 1, 1,
0.8432539, -0.2186881, -0.3439194, 0.8823529, 0, 1, 1,
0.8461292, 0.04984887, 1.476448, 0.8901961, 0, 1, 1,
0.8480007, -0.6154228, 3.203544, 0.8941177, 0, 1, 1,
0.8495054, 1.206481, 1.506968, 0.9019608, 0, 1, 1,
0.8554665, -0.4343425, 1.88688, 0.9098039, 0, 1, 1,
0.8606406, 0.2378778, 0.1067481, 0.9137255, 0, 1, 1,
0.8697585, 0.3317403, 0.7530719, 0.9215686, 0, 1, 1,
0.8742282, 0.02709664, 2.826385, 0.9254902, 0, 1, 1,
0.8796132, -2.172802, 2.043427, 0.9333333, 0, 1, 1,
0.88094, 1.15842, -0.06882339, 0.9372549, 0, 1, 1,
0.8920401, 1.487868, -0.1643675, 0.945098, 0, 1, 1,
0.8964542, -0.7124211, 4.567486, 0.9490196, 0, 1, 1,
0.9017296, -1.168831, 2.473514, 0.9568627, 0, 1, 1,
0.9068515, 0.1181803, 2.002254, 0.9607843, 0, 1, 1,
0.9180341, 1.714367, 1.353542, 0.9686275, 0, 1, 1,
0.9250473, 0.3149521, 2.685774, 0.972549, 0, 1, 1,
0.9298887, 1.095725, 1.226963, 0.9803922, 0, 1, 1,
0.9349905, 0.3238777, 1.976757, 0.9843137, 0, 1, 1,
0.9360853, -0.8932495, 3.333261, 0.9921569, 0, 1, 1,
0.9408014, -0.36432, 1.785166, 0.9960784, 0, 1, 1,
0.9437132, 0.6364039, 2.161839, 1, 0, 0.9960784, 1,
0.9496192, 0.6314939, -0.5629752, 1, 0, 0.9882353, 1,
0.9499496, 0.6695098, -0.5261293, 1, 0, 0.9843137, 1,
0.951104, 0.50402, 1.088808, 1, 0, 0.9764706, 1,
0.954601, 0.3099753, 0.3588811, 1, 0, 0.972549, 1,
0.9611113, -0.1769757, 1.038957, 1, 0, 0.9647059, 1,
0.9644356, -0.6546295, 3.925371, 1, 0, 0.9607843, 1,
0.973103, 0.5109634, 1.602899, 1, 0, 0.9529412, 1,
0.9735617, 0.8518592, 0.7778218, 1, 0, 0.9490196, 1,
0.9821714, 1.599059, 2.036701, 1, 0, 0.9411765, 1,
0.9876527, -0.2628401, 0.7388288, 1, 0, 0.9372549, 1,
0.9888114, 1.014844, 1.852417, 1, 0, 0.9294118, 1,
0.9998743, -0.4672035, 0.3205052, 1, 0, 0.9254902, 1,
1.003074, -0.6568626, 2.851749, 1, 0, 0.9176471, 1,
1.007748, 2.583842, 1.299798, 1, 0, 0.9137255, 1,
1.017421, 1.342889, -0.8660802, 1, 0, 0.9058824, 1,
1.021313, -1.72283, 2.845975, 1, 0, 0.9019608, 1,
1.022614, -0.1372285, 1.105006, 1, 0, 0.8941177, 1,
1.03255, -0.8161189, 0.6774087, 1, 0, 0.8862745, 1,
1.034016, -0.3432668, 2.218283, 1, 0, 0.8823529, 1,
1.041966, 0.6813613, -0.3903326, 1, 0, 0.8745098, 1,
1.048278, 0.583322, 2.070629, 1, 0, 0.8705882, 1,
1.050678, 0.822907, 2.21516, 1, 0, 0.8627451, 1,
1.054429, -0.7168925, 0.139516, 1, 0, 0.8588235, 1,
1.055056, 1.157779, 0.4547248, 1, 0, 0.8509804, 1,
1.05863, 1.253372, -0.05791107, 1, 0, 0.8470588, 1,
1.076993, 0.8099901, 0.2193719, 1, 0, 0.8392157, 1,
1.077748, -0.07642376, 2.272147, 1, 0, 0.8352941, 1,
1.08343, -0.7490302, 1.831064, 1, 0, 0.827451, 1,
1.086728, -0.07262874, 3.038931, 1, 0, 0.8235294, 1,
1.094884, -1.807893, 1.523805, 1, 0, 0.8156863, 1,
1.097416, -0.8795639, 1.697971, 1, 0, 0.8117647, 1,
1.101461, 0.5084026, 0.9172479, 1, 0, 0.8039216, 1,
1.109111, -1.397, 2.949269, 1, 0, 0.7960784, 1,
1.109589, -0.2212086, 2.378801, 1, 0, 0.7921569, 1,
1.113467, -0.02693834, 0.007274217, 1, 0, 0.7843137, 1,
1.113584, 0.6688671, 1.244031, 1, 0, 0.7803922, 1,
1.11616, 1.142614, 1.442443, 1, 0, 0.772549, 1,
1.122274, 0.1627868, 2.08625, 1, 0, 0.7686275, 1,
1.123995, -0.4537498, 2.207299, 1, 0, 0.7607843, 1,
1.125878, 1.869207, 0.4482709, 1, 0, 0.7568628, 1,
1.128877, 0.615407, 1.487436, 1, 0, 0.7490196, 1,
1.145259, 0.758949, 1.410992, 1, 0, 0.7450981, 1,
1.151411, -0.4701596, -0.2431147, 1, 0, 0.7372549, 1,
1.15512, -0.5638139, 0.4955577, 1, 0, 0.7333333, 1,
1.156491, -1.38681, 3.258026, 1, 0, 0.7254902, 1,
1.161763, -0.01515063, 1.946111, 1, 0, 0.7215686, 1,
1.175504, -0.3870089, 1.788511, 1, 0, 0.7137255, 1,
1.187907, 0.4900773, 1.558313, 1, 0, 0.7098039, 1,
1.189934, -0.7644636, 3.59816, 1, 0, 0.7019608, 1,
1.198819, -0.5064691, 1.929586, 1, 0, 0.6941177, 1,
1.203042, 0.4647594, 2.191329, 1, 0, 0.6901961, 1,
1.203776, -0.2277318, 1.082363, 1, 0, 0.682353, 1,
1.222383, -0.7645777, 1.510242, 1, 0, 0.6784314, 1,
1.23229, 0.1066254, 2.47023, 1, 0, 0.6705883, 1,
1.234664, 2.30612, -0.872373, 1, 0, 0.6666667, 1,
1.236425, -0.5675462, 1.731739, 1, 0, 0.6588235, 1,
1.244977, 2.080687, 0.4108776, 1, 0, 0.654902, 1,
1.247836, 0.6689353, 2.261318, 1, 0, 0.6470588, 1,
1.252741, -1.232034, 4.114863, 1, 0, 0.6431373, 1,
1.260577, 0.06577896, 1.559075, 1, 0, 0.6352941, 1,
1.261474, -0.3946519, 0.8502389, 1, 0, 0.6313726, 1,
1.268993, 2.976188, 0.2196323, 1, 0, 0.6235294, 1,
1.281854, 2.087646, -2.132626, 1, 0, 0.6196079, 1,
1.284506, -0.4225303, 3.507111, 1, 0, 0.6117647, 1,
1.287543, -0.8680614, 2.101943, 1, 0, 0.6078432, 1,
1.292514, -0.2331769, 4.327538, 1, 0, 0.6, 1,
1.293618, 0.8698691, 1.125794, 1, 0, 0.5921569, 1,
1.306241, -0.351865, 1.762468, 1, 0, 0.5882353, 1,
1.307125, -0.5461485, 2.963978, 1, 0, 0.5803922, 1,
1.307317, -0.6788837, 3.181936, 1, 0, 0.5764706, 1,
1.30737, -0.2041802, 1.624086, 1, 0, 0.5686275, 1,
1.308258, 0.6422707, 1.041782, 1, 0, 0.5647059, 1,
1.310232, -1.360672, 4.455149, 1, 0, 0.5568628, 1,
1.317335, 1.360238, 1.608306, 1, 0, 0.5529412, 1,
1.323624, 0.2133425, 0.06956843, 1, 0, 0.5450981, 1,
1.324641, -0.3124268, 3.478855, 1, 0, 0.5411765, 1,
1.327145, -0.3873367, 2.177056, 1, 0, 0.5333334, 1,
1.339323, -0.4969629, 2.589989, 1, 0, 0.5294118, 1,
1.3844, 0.6052088, 3.048269, 1, 0, 0.5215687, 1,
1.401123, 1.679142, -0.5608827, 1, 0, 0.5176471, 1,
1.408917, -1.251251, 1.225263, 1, 0, 0.509804, 1,
1.41133, 2.365913, 1.010418, 1, 0, 0.5058824, 1,
1.412947, -0.1069869, 2.486276, 1, 0, 0.4980392, 1,
1.424576, -0.7211512, 2.044196, 1, 0, 0.4901961, 1,
1.442953, -0.5276235, 1.728332, 1, 0, 0.4862745, 1,
1.448532, 0.3039747, 4.081359, 1, 0, 0.4784314, 1,
1.453358, 1.764143, 2.195841, 1, 0, 0.4745098, 1,
1.455583, 1.638531, 1.248799, 1, 0, 0.4666667, 1,
1.456912, -0.2109007, 1.464104, 1, 0, 0.4627451, 1,
1.462295, -0.2284086, 2.662693, 1, 0, 0.454902, 1,
1.471778, -0.4357578, 0.9844008, 1, 0, 0.4509804, 1,
1.501889, 0.7250608, 0.5154576, 1, 0, 0.4431373, 1,
1.511569, -1.316422, 1.392044, 1, 0, 0.4392157, 1,
1.513633, 0.2658786, 1.684527, 1, 0, 0.4313726, 1,
1.525849, 0.8466997, 0.7249504, 1, 0, 0.427451, 1,
1.527989, -1.37064, 2.171386, 1, 0, 0.4196078, 1,
1.529277, -0.4247687, 3.039934, 1, 0, 0.4156863, 1,
1.529695, -1.922911, 1.978133, 1, 0, 0.4078431, 1,
1.541535, 0.5678253, 0.3411678, 1, 0, 0.4039216, 1,
1.550024, -0.2801196, 1.3277, 1, 0, 0.3960784, 1,
1.567406, -0.07222633, 1.830955, 1, 0, 0.3882353, 1,
1.569587, 0.2261964, 1.734575, 1, 0, 0.3843137, 1,
1.592456, -0.007422902, -0.04216784, 1, 0, 0.3764706, 1,
1.600695, 0.885034, 0.0755567, 1, 0, 0.372549, 1,
1.609164, 0.01677092, -0.1959947, 1, 0, 0.3647059, 1,
1.61242, 0.84973, 1.874079, 1, 0, 0.3607843, 1,
1.618769, -1.510483, -0.1131911, 1, 0, 0.3529412, 1,
1.631269, 1.12347, 2.235378, 1, 0, 0.3490196, 1,
1.634757, -3.243379, 2.784916, 1, 0, 0.3411765, 1,
1.655328, -0.5000067, 2.285501, 1, 0, 0.3372549, 1,
1.6573, 0.2285926, 1.283924, 1, 0, 0.3294118, 1,
1.662968, -0.5880851, 0.5928998, 1, 0, 0.3254902, 1,
1.665348, -1.464677, 2.509213, 1, 0, 0.3176471, 1,
1.667873, 1.015371, 2.523272, 1, 0, 0.3137255, 1,
1.66948, -0.6137064, 1.35456, 1, 0, 0.3058824, 1,
1.672112, -0.4892952, 1.739348, 1, 0, 0.2980392, 1,
1.673278, 0.7159567, 2.37815, 1, 0, 0.2941177, 1,
1.68817, 0.1180277, 1.312715, 1, 0, 0.2862745, 1,
1.69386, -0.3802626, 2.451506, 1, 0, 0.282353, 1,
1.696739, -0.685122, 1.478618, 1, 0, 0.2745098, 1,
1.700598, -1.884538, 2.202719, 1, 0, 0.2705882, 1,
1.702358, 0.4567596, 2.050032, 1, 0, 0.2627451, 1,
1.702553, 0.6785727, 1.080089, 1, 0, 0.2588235, 1,
1.702794, -0.6832693, 1.343332, 1, 0, 0.2509804, 1,
1.703311, 0.09861188, 0.6751337, 1, 0, 0.2470588, 1,
1.714797, 1.327656, 0.9817157, 1, 0, 0.2392157, 1,
1.727838, 1.127994, 1.602962, 1, 0, 0.2352941, 1,
1.731865, 0.1439057, 2.978342, 1, 0, 0.227451, 1,
1.73366, 0.902116, 0.8244829, 1, 0, 0.2235294, 1,
1.739462, -0.09399319, 0.5184206, 1, 0, 0.2156863, 1,
1.741949, -1.776523, 2.600583, 1, 0, 0.2117647, 1,
1.742492, 0.7622448, -0.5674767, 1, 0, 0.2039216, 1,
1.75388, -1.378959, 2.500299, 1, 0, 0.1960784, 1,
1.790406, -0.5986083, 1.513991, 1, 0, 0.1921569, 1,
1.803672, -1.318417, 1.237189, 1, 0, 0.1843137, 1,
1.813262, 0.2570704, 2.375632, 1, 0, 0.1803922, 1,
1.860751, 1.4129, 1.57705, 1, 0, 0.172549, 1,
1.875424, 0.5168959, -0.6031215, 1, 0, 0.1686275, 1,
1.876207, -2.00025, 2.794113, 1, 0, 0.1607843, 1,
1.882228, 0.5392202, 1.09925, 1, 0, 0.1568628, 1,
1.886808, -0.6032891, 1.633724, 1, 0, 0.1490196, 1,
1.89856, 0.9857019, 3.180728, 1, 0, 0.145098, 1,
1.911656, 0.2041075, 0.444594, 1, 0, 0.1372549, 1,
1.916347, 0.03932535, 0.3555754, 1, 0, 0.1333333, 1,
1.926382, 0.4899111, 1.909059, 1, 0, 0.1254902, 1,
1.947356, 1.412543, 0.04924807, 1, 0, 0.1215686, 1,
1.972009, 0.2609839, 1.336041, 1, 0, 0.1137255, 1,
2.019476, 1.600461, 1.172311, 1, 0, 0.1098039, 1,
2.032578, -0.3588324, 2.127706, 1, 0, 0.1019608, 1,
2.061663, -1.927143, 3.206284, 1, 0, 0.09411765, 1,
2.065739, 0.7480533, 1.290108, 1, 0, 0.09019608, 1,
2.067373, -1.190735, 1.824428, 1, 0, 0.08235294, 1,
2.080595, 0.1563396, 1.499585, 1, 0, 0.07843138, 1,
2.095424, -0.0554037, 3.289916, 1, 0, 0.07058824, 1,
2.108625, -0.3115864, 2.387635, 1, 0, 0.06666667, 1,
2.13384, 0.3141437, 2.639052, 1, 0, 0.05882353, 1,
2.176562, -0.1944924, 1.622375, 1, 0, 0.05490196, 1,
2.189084, 1.93125, -0.2765954, 1, 0, 0.04705882, 1,
2.215299, 0.4986113, 0.9495286, 1, 0, 0.04313726, 1,
2.266208, 1.937822, 1.420517, 1, 0, 0.03529412, 1,
2.347939, 1.378618, 0.9340791, 1, 0, 0.03137255, 1,
2.386667, 0.8892059, 1.04112, 1, 0, 0.02352941, 1,
2.420641, -0.3929614, 0.2564467, 1, 0, 0.01960784, 1,
2.469126, 0.1362281, 0.07920026, 1, 0, 0.01176471, 1,
2.669774, 0.005566131, 3.34607, 1, 0, 0.007843138, 1
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
-0.2139187, -4.297596, -6.88411, 0, -0.5, 0.5, 0.5,
-0.2139187, -4.297596, -6.88411, 1, -0.5, 0.5, 0.5,
-0.2139187, -4.297596, -6.88411, 1, 1.5, 0.5, 0.5,
-0.2139187, -4.297596, -6.88411, 0, 1.5, 0.5, 0.5
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
-4.075183, -0.1335955, -6.88411, 0, -0.5, 0.5, 0.5,
-4.075183, -0.1335955, -6.88411, 1, -0.5, 0.5, 0.5,
-4.075183, -0.1335955, -6.88411, 1, 1.5, 0.5, 0.5,
-4.075183, -0.1335955, -6.88411, 0, 1.5, 0.5, 0.5
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
-4.075183, -4.297596, -0.1570513, 0, -0.5, 0.5, 0.5,
-4.075183, -4.297596, -0.1570513, 1, -0.5, 0.5, 0.5,
-4.075183, -4.297596, -0.1570513, 1, 1.5, 0.5, 0.5,
-4.075183, -4.297596, -0.1570513, 0, 1.5, 0.5, 0.5
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
-3, -3.336673, -5.331712,
2, -3.336673, -5.331712,
-3, -3.336673, -5.331712,
-3, -3.496827, -5.590446,
-2, -3.336673, -5.331712,
-2, -3.496827, -5.590446,
-1, -3.336673, -5.331712,
-1, -3.496827, -5.590446,
0, -3.336673, -5.331712,
0, -3.496827, -5.590446,
1, -3.336673, -5.331712,
1, -3.496827, -5.590446,
2, -3.336673, -5.331712,
2, -3.496827, -5.590446
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
-3, -3.817134, -6.107912, 0, -0.5, 0.5, 0.5,
-3, -3.817134, -6.107912, 1, -0.5, 0.5, 0.5,
-3, -3.817134, -6.107912, 1, 1.5, 0.5, 0.5,
-3, -3.817134, -6.107912, 0, 1.5, 0.5, 0.5,
-2, -3.817134, -6.107912, 0, -0.5, 0.5, 0.5,
-2, -3.817134, -6.107912, 1, -0.5, 0.5, 0.5,
-2, -3.817134, -6.107912, 1, 1.5, 0.5, 0.5,
-2, -3.817134, -6.107912, 0, 1.5, 0.5, 0.5,
-1, -3.817134, -6.107912, 0, -0.5, 0.5, 0.5,
-1, -3.817134, -6.107912, 1, -0.5, 0.5, 0.5,
-1, -3.817134, -6.107912, 1, 1.5, 0.5, 0.5,
-1, -3.817134, -6.107912, 0, 1.5, 0.5, 0.5,
0, -3.817134, -6.107912, 0, -0.5, 0.5, 0.5,
0, -3.817134, -6.107912, 1, -0.5, 0.5, 0.5,
0, -3.817134, -6.107912, 1, 1.5, 0.5, 0.5,
0, -3.817134, -6.107912, 0, 1.5, 0.5, 0.5,
1, -3.817134, -6.107912, 0, -0.5, 0.5, 0.5,
1, -3.817134, -6.107912, 1, -0.5, 0.5, 0.5,
1, -3.817134, -6.107912, 1, 1.5, 0.5, 0.5,
1, -3.817134, -6.107912, 0, 1.5, 0.5, 0.5,
2, -3.817134, -6.107912, 0, -0.5, 0.5, 0.5,
2, -3.817134, -6.107912, 1, -0.5, 0.5, 0.5,
2, -3.817134, -6.107912, 1, 1.5, 0.5, 0.5,
2, -3.817134, -6.107912, 0, 1.5, 0.5, 0.5
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
-3.184123, -3, -5.331712,
-3.184123, 2, -5.331712,
-3.184123, -3, -5.331712,
-3.332633, -3, -5.590446,
-3.184123, -2, -5.331712,
-3.332633, -2, -5.590446,
-3.184123, -1, -5.331712,
-3.332633, -1, -5.590446,
-3.184123, 0, -5.331712,
-3.332633, 0, -5.590446,
-3.184123, 1, -5.331712,
-3.332633, 1, -5.590446,
-3.184123, 2, -5.331712,
-3.332633, 2, -5.590446
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
-3.629653, -3, -6.107912, 0, -0.5, 0.5, 0.5,
-3.629653, -3, -6.107912, 1, -0.5, 0.5, 0.5,
-3.629653, -3, -6.107912, 1, 1.5, 0.5, 0.5,
-3.629653, -3, -6.107912, 0, 1.5, 0.5, 0.5,
-3.629653, -2, -6.107912, 0, -0.5, 0.5, 0.5,
-3.629653, -2, -6.107912, 1, -0.5, 0.5, 0.5,
-3.629653, -2, -6.107912, 1, 1.5, 0.5, 0.5,
-3.629653, -2, -6.107912, 0, 1.5, 0.5, 0.5,
-3.629653, -1, -6.107912, 0, -0.5, 0.5, 0.5,
-3.629653, -1, -6.107912, 1, -0.5, 0.5, 0.5,
-3.629653, -1, -6.107912, 1, 1.5, 0.5, 0.5,
-3.629653, -1, -6.107912, 0, 1.5, 0.5, 0.5,
-3.629653, 0, -6.107912, 0, -0.5, 0.5, 0.5,
-3.629653, 0, -6.107912, 1, -0.5, 0.5, 0.5,
-3.629653, 0, -6.107912, 1, 1.5, 0.5, 0.5,
-3.629653, 0, -6.107912, 0, 1.5, 0.5, 0.5,
-3.629653, 1, -6.107912, 0, -0.5, 0.5, 0.5,
-3.629653, 1, -6.107912, 1, -0.5, 0.5, 0.5,
-3.629653, 1, -6.107912, 1, 1.5, 0.5, 0.5,
-3.629653, 1, -6.107912, 0, 1.5, 0.5, 0.5,
-3.629653, 2, -6.107912, 0, -0.5, 0.5, 0.5,
-3.629653, 2, -6.107912, 1, -0.5, 0.5, 0.5,
-3.629653, 2, -6.107912, 1, 1.5, 0.5, 0.5,
-3.629653, 2, -6.107912, 0, 1.5, 0.5, 0.5
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
-3.184123, -3.336673, -4,
-3.184123, -3.336673, 4,
-3.184123, -3.336673, -4,
-3.332633, -3.496827, -4,
-3.184123, -3.336673, -2,
-3.332633, -3.496827, -2,
-3.184123, -3.336673, 0,
-3.332633, -3.496827, 0,
-3.184123, -3.336673, 2,
-3.332633, -3.496827, 2,
-3.184123, -3.336673, 4,
-3.332633, -3.496827, 4
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
-3.629653, -3.817134, -4, 0, -0.5, 0.5, 0.5,
-3.629653, -3.817134, -4, 1, -0.5, 0.5, 0.5,
-3.629653, -3.817134, -4, 1, 1.5, 0.5, 0.5,
-3.629653, -3.817134, -4, 0, 1.5, 0.5, 0.5,
-3.629653, -3.817134, -2, 0, -0.5, 0.5, 0.5,
-3.629653, -3.817134, -2, 1, -0.5, 0.5, 0.5,
-3.629653, -3.817134, -2, 1, 1.5, 0.5, 0.5,
-3.629653, -3.817134, -2, 0, 1.5, 0.5, 0.5,
-3.629653, -3.817134, 0, 0, -0.5, 0.5, 0.5,
-3.629653, -3.817134, 0, 1, -0.5, 0.5, 0.5,
-3.629653, -3.817134, 0, 1, 1.5, 0.5, 0.5,
-3.629653, -3.817134, 0, 0, 1.5, 0.5, 0.5,
-3.629653, -3.817134, 2, 0, -0.5, 0.5, 0.5,
-3.629653, -3.817134, 2, 1, -0.5, 0.5, 0.5,
-3.629653, -3.817134, 2, 1, 1.5, 0.5, 0.5,
-3.629653, -3.817134, 2, 0, 1.5, 0.5, 0.5,
-3.629653, -3.817134, 4, 0, -0.5, 0.5, 0.5,
-3.629653, -3.817134, 4, 1, -0.5, 0.5, 0.5,
-3.629653, -3.817134, 4, 1, 1.5, 0.5, 0.5,
-3.629653, -3.817134, 4, 0, 1.5, 0.5, 0.5
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
-3.184123, -3.336673, -5.331712,
-3.184123, 3.069482, -5.331712,
-3.184123, -3.336673, 5.01761,
-3.184123, 3.069482, 5.01761,
-3.184123, -3.336673, -5.331712,
-3.184123, -3.336673, 5.01761,
-3.184123, 3.069482, -5.331712,
-3.184123, 3.069482, 5.01761,
-3.184123, -3.336673, -5.331712,
2.756285, -3.336673, -5.331712,
-3.184123, -3.336673, 5.01761,
2.756285, -3.336673, 5.01761,
-3.184123, 3.069482, -5.331712,
2.756285, 3.069482, -5.331712,
-3.184123, 3.069482, 5.01761,
2.756285, 3.069482, 5.01761,
2.756285, -3.336673, -5.331712,
2.756285, 3.069482, -5.331712,
2.756285, -3.336673, 5.01761,
2.756285, 3.069482, 5.01761,
2.756285, -3.336673, -5.331712,
2.756285, -3.336673, 5.01761,
2.756285, 3.069482, -5.331712,
2.756285, 3.069482, 5.01761
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
var radius = 7.23215;
var distance = 32.17665;
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
mvMatrix.translate( 0.2139187, 0.1335955, 0.1570513 );
mvMatrix.scale( 1.316331, 1.22063, 0.7555608 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.17665);
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
Cymoxanil<-read.table("Cymoxanil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cymoxanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cymoxanil' not found
```

```r
y<-Cymoxanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cymoxanil' not found
```

```r
z<-Cymoxanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cymoxanil' not found
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
-3.097612, 1.36576, -0.3456926, 0, 0, 1, 1, 1,
-2.710334, 0.0942687, -0.6811829, 1, 0, 0, 1, 1,
-2.577665, 0.6603813, -2.489936, 1, 0, 0, 1, 1,
-2.478515, 0.5545428, -2.946654, 1, 0, 0, 1, 1,
-2.451555, -0.4870925, -3.288554, 1, 0, 0, 1, 1,
-2.361705, 0.1803034, -2.055068, 1, 0, 0, 1, 1,
-2.289248, 0.597944, -1.853583, 0, 0, 0, 1, 1,
-2.211631, 1.947686, 0.5841871, 0, 0, 0, 1, 1,
-2.150691, 1.822239, 1.145235, 0, 0, 0, 1, 1,
-2.148329, -1.677055, -2.48026, 0, 0, 0, 1, 1,
-2.141384, 1.629596, -1.877504, 0, 0, 0, 1, 1,
-2.140811, 1.351352, -0.3523917, 0, 0, 0, 1, 1,
-2.061124, -0.9162726, -1.292832, 0, 0, 0, 1, 1,
-2.060613, 2.115597, -0.5710927, 1, 1, 1, 1, 1,
-2.048794, -0.3600414, -0.2193975, 1, 1, 1, 1, 1,
-2.017312, -0.2563317, -2.375034, 1, 1, 1, 1, 1,
-2.016298, 0.2274281, -1.070804, 1, 1, 1, 1, 1,
-1.981437, -0.5269446, -0.1548338, 1, 1, 1, 1, 1,
-1.977312, -0.2484782, -0.9795045, 1, 1, 1, 1, 1,
-1.97711, 0.9783532, -1.137017, 1, 1, 1, 1, 1,
-1.941871, 0.5853872, -1.626471, 1, 1, 1, 1, 1,
-1.939959, -0.2136717, -1.090737, 1, 1, 1, 1, 1,
-1.876322, 0.8217135, 0.164037, 1, 1, 1, 1, 1,
-1.854658, 0.7074536, 0.2358988, 1, 1, 1, 1, 1,
-1.852172, 1.669557, -0.09072579, 1, 1, 1, 1, 1,
-1.841852, -0.1540037, -2.215905, 1, 1, 1, 1, 1,
-1.841553, 0.5535547, -1.030157, 1, 1, 1, 1, 1,
-1.812806, 0.6174173, 0.03850924, 1, 1, 1, 1, 1,
-1.789757, -0.5437155, -3.276896, 0, 0, 1, 1, 1,
-1.769144, -0.2957424, -0.6592532, 1, 0, 0, 1, 1,
-1.758298, -0.8881249, -1.622937, 1, 0, 0, 1, 1,
-1.72831, -0.08159951, -2.55543, 1, 0, 0, 1, 1,
-1.717376, 1.833042, -1.177472, 1, 0, 0, 1, 1,
-1.694244, -0.1681002, -0.4902877, 1, 0, 0, 1, 1,
-1.690522, 0.6446311, -0.655241, 0, 0, 0, 1, 1,
-1.682415, 0.7090971, -1.652109, 0, 0, 0, 1, 1,
-1.681866, 1.169778, -0.218918, 0, 0, 0, 1, 1,
-1.678916, 1.323023, -1.680886, 0, 0, 0, 1, 1,
-1.664485, 0.2717933, -1.122373, 0, 0, 0, 1, 1,
-1.658015, 1.019398, -0.2822141, 0, 0, 0, 1, 1,
-1.654372, -0.5735561, -2.247366, 0, 0, 0, 1, 1,
-1.650935, 1.235217, -1.980334, 1, 1, 1, 1, 1,
-1.616341, -0.7089399, -0.3500259, 1, 1, 1, 1, 1,
-1.597184, 0.7950826, -3.141738, 1, 1, 1, 1, 1,
-1.596666, 0.4795623, -0.8988951, 1, 1, 1, 1, 1,
-1.576495, -0.06903663, -1.702161, 1, 1, 1, 1, 1,
-1.552893, 0.2580666, -1.266161, 1, 1, 1, 1, 1,
-1.550876, -0.5866398, -2.583751, 1, 1, 1, 1, 1,
-1.531798, -0.1890301, -0.2629151, 1, 1, 1, 1, 1,
-1.521284, -1.450736, -5.180994, 1, 1, 1, 1, 1,
-1.520292, -0.2315421, -2.948002, 1, 1, 1, 1, 1,
-1.520102, 1.239196, -1.233196, 1, 1, 1, 1, 1,
-1.517082, 0.1879855, -0.3255849, 1, 1, 1, 1, 1,
-1.490247, -0.5324516, -3.539706, 1, 1, 1, 1, 1,
-1.490209, -0.8557041, -1.650759, 1, 1, 1, 1, 1,
-1.481214, 1.876605, -1.217383, 1, 1, 1, 1, 1,
-1.468547, 0.0983913, -0.6372459, 0, 0, 1, 1, 1,
-1.459755, 0.0283971, -3.044245, 1, 0, 0, 1, 1,
-1.458223, 0.2218656, -2.81938, 1, 0, 0, 1, 1,
-1.452881, 1.099595, -0.009824819, 1, 0, 0, 1, 1,
-1.432264, 0.07733147, -0.4812066, 1, 0, 0, 1, 1,
-1.432083, 1.022891, -0.2952581, 1, 0, 0, 1, 1,
-1.43181, -1.943297, -2.201519, 0, 0, 0, 1, 1,
-1.430352, -0.3128172, -1.377146, 0, 0, 0, 1, 1,
-1.408298, -1.729847, -1.879561, 0, 0, 0, 1, 1,
-1.406444, -0.5490509, -3.154942, 0, 0, 0, 1, 1,
-1.403333, -0.1145531, -2.136101, 0, 0, 0, 1, 1,
-1.402017, 0.6250306, -1.083638, 0, 0, 0, 1, 1,
-1.399249, -1.341202, -0.1322508, 0, 0, 0, 1, 1,
-1.393409, 0.5533608, -1.362912, 1, 1, 1, 1, 1,
-1.389093, -0.06397056, -1.489907, 1, 1, 1, 1, 1,
-1.383041, -0.303844, -3.729556, 1, 1, 1, 1, 1,
-1.378112, 0.885182, -2.03342, 1, 1, 1, 1, 1,
-1.374346, 1.808789, 1.260647, 1, 1, 1, 1, 1,
-1.374182, 1.104241, -2.3664, 1, 1, 1, 1, 1,
-1.370461, -1.445039, -2.485234, 1, 1, 1, 1, 1,
-1.334172, -2.043727, -4.35541, 1, 1, 1, 1, 1,
-1.328838, 0.9133112, -1.912392, 1, 1, 1, 1, 1,
-1.327296, 1.473973, -1.725732, 1, 1, 1, 1, 1,
-1.326334, -0.5402369, -3.657931, 1, 1, 1, 1, 1,
-1.315994, 0.1947352, -1.92921, 1, 1, 1, 1, 1,
-1.308743, -0.05710058, -2.327736, 1, 1, 1, 1, 1,
-1.289834, -0.9077999, -1.671617, 1, 1, 1, 1, 1,
-1.288579, -0.1953941, 0.5378463, 1, 1, 1, 1, 1,
-1.287775, 0.5479151, -0.7857412, 0, 0, 1, 1, 1,
-1.285627, 0.3971286, -2.260186, 1, 0, 0, 1, 1,
-1.285015, 0.7859176, -2.218963, 1, 0, 0, 1, 1,
-1.281995, -0.6264704, -2.812353, 1, 0, 0, 1, 1,
-1.279922, -0.485695, -2.079465, 1, 0, 0, 1, 1,
-1.278766, 0.05948589, -1.241149, 1, 0, 0, 1, 1,
-1.273182, 1.637536, -1.679124, 0, 0, 0, 1, 1,
-1.263641, 1.783908, -3.17175, 0, 0, 0, 1, 1,
-1.246378, 0.2930018, -1.450599, 0, 0, 0, 1, 1,
-1.245425, 0.8535747, -0.9615223, 0, 0, 0, 1, 1,
-1.241487, 1.437051, -1.157891, 0, 0, 0, 1, 1,
-1.226554, 1.408313, -2.06405, 0, 0, 0, 1, 1,
-1.224147, 0.2121198, -1.449801, 0, 0, 0, 1, 1,
-1.223785, -0.0007383092, -3.104198, 1, 1, 1, 1, 1,
-1.222353, -0.9812003, -3.460903, 1, 1, 1, 1, 1,
-1.215829, 1.29932, -0.9193634, 1, 1, 1, 1, 1,
-1.213055, -0.8651534, -2.318728, 1, 1, 1, 1, 1,
-1.20482, 0.2492265, 0.2743485, 1, 1, 1, 1, 1,
-1.204807, 1.617143, -0.7991382, 1, 1, 1, 1, 1,
-1.20038, -0.7766548, -2.725727, 1, 1, 1, 1, 1,
-1.186437, 0.8433943, -0.1045273, 1, 1, 1, 1, 1,
-1.180613, 0.1095862, -2.750994, 1, 1, 1, 1, 1,
-1.174381, -0.5369347, -2.488773, 1, 1, 1, 1, 1,
-1.172763, -0.1287255, -1.775237, 1, 1, 1, 1, 1,
-1.170871, 0.1281523, -2.432192, 1, 1, 1, 1, 1,
-1.168173, 0.5828394, 0.02358012, 1, 1, 1, 1, 1,
-1.167958, 0.7079415, -1.674725, 1, 1, 1, 1, 1,
-1.158244, 1.584249, 0.7621844, 1, 1, 1, 1, 1,
-1.143524, 0.9228015, -2.276407, 0, 0, 1, 1, 1,
-1.140414, 0.5874353, -2.819688, 1, 0, 0, 1, 1,
-1.133173, -1.197519, -4.742733, 1, 0, 0, 1, 1,
-1.129446, 1.090621, -1.466597, 1, 0, 0, 1, 1,
-1.127041, -2.450491, -2.484556, 1, 0, 0, 1, 1,
-1.1245, 0.158081, -0.8514886, 1, 0, 0, 1, 1,
-1.122854, -0.6077201, -4.27877, 0, 0, 0, 1, 1,
-1.119393, -1.054667, -1.903717, 0, 0, 0, 1, 1,
-1.118401, -0.645573, -3.239054, 0, 0, 0, 1, 1,
-1.106258, -0.3375362, -2.962836, 0, 0, 0, 1, 1,
-1.098, -0.8387056, -2.019542, 0, 0, 0, 1, 1,
-1.096608, 1.062675, 0.2386732, 0, 0, 0, 1, 1,
-1.079984, 1.217902, 0.4536805, 0, 0, 0, 1, 1,
-1.065383, 0.4019915, -1.238741, 1, 1, 1, 1, 1,
-1.060359, -0.565277, -3.152022, 1, 1, 1, 1, 1,
-1.056909, -0.1894575, -2.195378, 1, 1, 1, 1, 1,
-1.053222, 1.45104, -1.629837, 1, 1, 1, 1, 1,
-1.038355, -0.2236758, -2.068606, 1, 1, 1, 1, 1,
-1.037874, -1.281382, -0.3383061, 1, 1, 1, 1, 1,
-1.032882, 1.030736, -1.276341, 1, 1, 1, 1, 1,
-1.027392, 2.388541, 1.281121, 1, 1, 1, 1, 1,
-1.026797, 0.244964, 1.642548, 1, 1, 1, 1, 1,
-1.022074, 1.523487, 0.2111394, 1, 1, 1, 1, 1,
-1.018536, 1.250483, -0.03067578, 1, 1, 1, 1, 1,
-1.012026, -0.2764947, 0.9492716, 1, 1, 1, 1, 1,
-1.007972, 1.32364, 0.1365235, 1, 1, 1, 1, 1,
-1.003447, 1.246596, -0.3887508, 1, 1, 1, 1, 1,
-0.9982769, -0.9169605, -2.658417, 1, 1, 1, 1, 1,
-0.9958274, 0.8805015, -0.8555927, 0, 0, 1, 1, 1,
-0.9943019, -0.5413874, -2.220981, 1, 0, 0, 1, 1,
-0.9776594, 1.40392, -0.7850538, 1, 0, 0, 1, 1,
-0.9771797, -1.038213, -2.797546, 1, 0, 0, 1, 1,
-0.9769645, 0.1622464, -0.6435181, 1, 0, 0, 1, 1,
-0.9735677, -0.6820536, -0.3420708, 1, 0, 0, 1, 1,
-0.9677751, -0.3588023, -1.2082, 0, 0, 0, 1, 1,
-0.9670102, -1.526842, -5.145415, 0, 0, 0, 1, 1,
-0.9648167, 0.2537842, -0.8578177, 0, 0, 0, 1, 1,
-0.9577569, -1.467882, -4.087434, 0, 0, 0, 1, 1,
-0.9575257, 0.2203697, -1.548512, 0, 0, 0, 1, 1,
-0.9553627, -0.6464995, -2.211414, 0, 0, 0, 1, 1,
-0.9482682, -0.5302026, -2.182534, 0, 0, 0, 1, 1,
-0.9422925, 0.02135134, 0.4392452, 1, 1, 1, 1, 1,
-0.9362327, 0.9408074, -0.04950083, 1, 1, 1, 1, 1,
-0.9339996, -0.3869171, -1.427633, 1, 1, 1, 1, 1,
-0.930441, -0.01237428, -1.724867, 1, 1, 1, 1, 1,
-0.9303192, 0.466814, -2.300439, 1, 1, 1, 1, 1,
-0.9212905, 0.1802762, -0.6816079, 1, 1, 1, 1, 1,
-0.9211571, -0.1118679, -0.5778383, 1, 1, 1, 1, 1,
-0.9187714, -0.007380371, -3.084282, 1, 1, 1, 1, 1,
-0.9135002, 0.1171778, -2.290504, 1, 1, 1, 1, 1,
-0.9134164, -0.6890916, -3.109035, 1, 1, 1, 1, 1,
-0.9093905, 0.8843104, -3.257101, 1, 1, 1, 1, 1,
-0.9078535, -0.2705283, -2.239602, 1, 1, 1, 1, 1,
-0.9076468, 0.5590332, -2.088316, 1, 1, 1, 1, 1,
-0.9060052, 1.241409, -1.578806, 1, 1, 1, 1, 1,
-0.9012457, -1.699176, -4.504642, 1, 1, 1, 1, 1,
-0.9010381, 1.403965, 0.4954035, 0, 0, 1, 1, 1,
-0.8940694, 0.6481681, -1.393363, 1, 0, 0, 1, 1,
-0.8902629, 1.216656, -0.5060428, 1, 0, 0, 1, 1,
-0.8893657, -0.1152154, -0.2950489, 1, 0, 0, 1, 1,
-0.8844478, 0.2312225, -2.159411, 1, 0, 0, 1, 1,
-0.8806115, -1.955201, -3.992487, 1, 0, 0, 1, 1,
-0.8796349, -0.4692658, -1.082896, 0, 0, 0, 1, 1,
-0.8793309, 0.98961, 0.9498762, 0, 0, 0, 1, 1,
-0.8788124, -1.259834, -2.726758, 0, 0, 0, 1, 1,
-0.8779893, 0.3504249, -0.5979012, 0, 0, 0, 1, 1,
-0.8755037, 0.3501625, -1.113732, 0, 0, 0, 1, 1,
-0.8747658, -0.5035195, -1.790387, 0, 0, 0, 1, 1,
-0.8741812, 1.823603, -0.5995853, 0, 0, 0, 1, 1,
-0.867856, -2.363327, -3.127833, 1, 1, 1, 1, 1,
-0.8659265, 0.3149593, 0.05584699, 1, 1, 1, 1, 1,
-0.8651105, 0.333149, -2.02139, 1, 1, 1, 1, 1,
-0.8640485, 1.290461, -1.625501, 1, 1, 1, 1, 1,
-0.8587404, 0.4767708, -0.9455273, 1, 1, 1, 1, 1,
-0.8435206, -0.05117922, -2.070484, 1, 1, 1, 1, 1,
-0.8391184, -0.6347622, -3.394416, 1, 1, 1, 1, 1,
-0.8358538, 0.606787, 1.377918, 1, 1, 1, 1, 1,
-0.8328084, 0.4697649, -0.8113948, 1, 1, 1, 1, 1,
-0.831298, -0.4950788, -1.352232, 1, 1, 1, 1, 1,
-0.8242423, -0.218974, -0.318215, 1, 1, 1, 1, 1,
-0.8238446, 0.9045289, -1.342386, 1, 1, 1, 1, 1,
-0.8218091, -0.993379, -2.674581, 1, 1, 1, 1, 1,
-0.8217307, -0.5824277, -3.29553, 1, 1, 1, 1, 1,
-0.8211735, -0.1307002, -2.06977, 1, 1, 1, 1, 1,
-0.8205096, 1.951153, -1.172834, 0, 0, 1, 1, 1,
-0.8196578, 1.036698, -0.7647429, 1, 0, 0, 1, 1,
-0.8183683, 1.287112, -1.272822, 1, 0, 0, 1, 1,
-0.8156407, 0.620051, -0.7683878, 1, 0, 0, 1, 1,
-0.8142836, -1.801134, -2.012517, 1, 0, 0, 1, 1,
-0.8102551, 1.525351, -0.6963587, 1, 0, 0, 1, 1,
-0.8101878, 1.196175, 0.3567121, 0, 0, 0, 1, 1,
-0.8088688, 0.4283744, -2.106676, 0, 0, 0, 1, 1,
-0.8054404, 1.212727, -1.070159, 0, 0, 0, 1, 1,
-0.8052991, -0.01836362, -1.944381, 0, 0, 0, 1, 1,
-0.8052775, -0.8039597, -2.718966, 0, 0, 0, 1, 1,
-0.8022438, -1.267698, -2.752912, 0, 0, 0, 1, 1,
-0.7979298, 0.4771047, -0.3561245, 0, 0, 0, 1, 1,
-0.7971655, -0.2181455, -2.20678, 1, 1, 1, 1, 1,
-0.7849217, 0.8411894, -2.292978, 1, 1, 1, 1, 1,
-0.7838932, -0.8087775, -2.314201, 1, 1, 1, 1, 1,
-0.7834784, 1.447405, -1.568672, 1, 1, 1, 1, 1,
-0.7783268, -0.05384595, -1.315198, 1, 1, 1, 1, 1,
-0.7759954, 0.2312484, 0.1325864, 1, 1, 1, 1, 1,
-0.7752526, 0.5860139, -0.722042, 1, 1, 1, 1, 1,
-0.7703993, -0.01412207, -1.586597, 1, 1, 1, 1, 1,
-0.7635314, -0.02169486, -1.235255, 1, 1, 1, 1, 1,
-0.7605546, -0.3033527, -2.052061, 1, 1, 1, 1, 1,
-0.7586903, -1.44667, -2.379546, 1, 1, 1, 1, 1,
-0.7572899, 0.7595029, 0.1338605, 1, 1, 1, 1, 1,
-0.753234, -2.93078, -4.680018, 1, 1, 1, 1, 1,
-0.7521317, 0.3450252, -1.089251, 1, 1, 1, 1, 1,
-0.7486143, 1.827305, -2.955494, 1, 1, 1, 1, 1,
-0.7467278, -1.123912, -3.621647, 0, 0, 1, 1, 1,
-0.7456922, 0.7443638, -2.659165, 1, 0, 0, 1, 1,
-0.7421659, -0.8443619, -3.354515, 1, 0, 0, 1, 1,
-0.7404926, -1.515999, -0.1996596, 1, 0, 0, 1, 1,
-0.7393226, -0.2161338, -2.633993, 1, 0, 0, 1, 1,
-0.7365934, -0.7211782, -1.574023, 1, 0, 0, 1, 1,
-0.7319158, -0.2670408, -2.739311, 0, 0, 0, 1, 1,
-0.7311017, -1.52928, -3.325782, 0, 0, 0, 1, 1,
-0.7310266, 1.270451, 0.6012911, 0, 0, 0, 1, 1,
-0.7259909, -0.6319166, -1.955822, 0, 0, 0, 1, 1,
-0.7259676, -1.3508, -3.954455, 0, 0, 0, 1, 1,
-0.7207851, -0.527851, 0.189485, 0, 0, 0, 1, 1,
-0.7169116, 0.3535069, -0.8003933, 0, 0, 0, 1, 1,
-0.7160252, 1.14692, -1.457909, 1, 1, 1, 1, 1,
-0.7150689, -0.5177792, -1.808569, 1, 1, 1, 1, 1,
-0.7081633, -0.39626, -3.210011, 1, 1, 1, 1, 1,
-0.7056967, -0.2609132, -2.288967, 1, 1, 1, 1, 1,
-0.7023546, 0.5169159, 0.7579718, 1, 1, 1, 1, 1,
-0.6991298, 0.6963454, -0.6197635, 1, 1, 1, 1, 1,
-0.6878882, 0.3901823, -1.17899, 1, 1, 1, 1, 1,
-0.6869541, -1.777461, -3.858582, 1, 1, 1, 1, 1,
-0.6834014, -1.098036, -2.200985, 1, 1, 1, 1, 1,
-0.6811805, -0.9684036, -4.296777, 1, 1, 1, 1, 1,
-0.6717559, 0.515317, -0.3148278, 1, 1, 1, 1, 1,
-0.6711445, -1.397508, -3.099194, 1, 1, 1, 1, 1,
-0.6648911, 1.010298, -0.7839744, 1, 1, 1, 1, 1,
-0.6637194, 0.06726834, -2.696463, 1, 1, 1, 1, 1,
-0.6627639, 1.214322, -0.5730267, 1, 1, 1, 1, 1,
-0.6594876, -0.3861081, -0.7837418, 0, 0, 1, 1, 1,
-0.6588305, -0.5353758, -0.2131185, 1, 0, 0, 1, 1,
-0.6561156, 0.4909332, -0.1782455, 1, 0, 0, 1, 1,
-0.6538609, -0.7791617, -1.963888, 1, 0, 0, 1, 1,
-0.6524535, -1.930576, -2.311306, 1, 0, 0, 1, 1,
-0.6474171, -1.067845, -3.188544, 1, 0, 0, 1, 1,
-0.6469892, -0.113444, -1.197619, 0, 0, 0, 1, 1,
-0.6390799, -0.1493791, -3.354141, 0, 0, 0, 1, 1,
-0.6386899, -0.370954, -1.994392, 0, 0, 0, 1, 1,
-0.6375718, 1.430699, -0.7513614, 0, 0, 0, 1, 1,
-0.6372989, 0.819528, 1.401176, 0, 0, 0, 1, 1,
-0.6356423, 0.9930133, 0.780525, 0, 0, 0, 1, 1,
-0.6336448, -1.2905, -2.644548, 0, 0, 0, 1, 1,
-0.6324485, -0.1809822, -2.428984, 1, 1, 1, 1, 1,
-0.6252577, -1.407391, -4.331658, 1, 1, 1, 1, 1,
-0.6251799, -0.8827941, -2.618302, 1, 1, 1, 1, 1,
-0.6206053, 0.9231094, 0.1416932, 1, 1, 1, 1, 1,
-0.6198066, 0.5621657, -0.5102657, 1, 1, 1, 1, 1,
-0.6158201, -1.252007, -3.666457, 1, 1, 1, 1, 1,
-0.6117021, 1.195032, -1.27151, 1, 1, 1, 1, 1,
-0.6073726, 1.395527, 1.088526, 1, 1, 1, 1, 1,
-0.6063091, -0.885683, -2.619666, 1, 1, 1, 1, 1,
-0.6056443, -1.292984, -3.451536, 1, 1, 1, 1, 1,
-0.6031535, 1.003614, -0.1801976, 1, 1, 1, 1, 1,
-0.6015998, -0.08025588, -1.929508, 1, 1, 1, 1, 1,
-0.5988483, -0.7300263, -2.216747, 1, 1, 1, 1, 1,
-0.5977828, -1.032464, -1.816908, 1, 1, 1, 1, 1,
-0.5957881, 0.5164707, 0.02767865, 1, 1, 1, 1, 1,
-0.5926515, -0.1865829, -0.5539811, 0, 0, 1, 1, 1,
-0.5898327, 0.09915292, -1.639601, 1, 0, 0, 1, 1,
-0.5876523, 0.1730679, -2.049296, 1, 0, 0, 1, 1,
-0.5845395, 1.499359, 1.595226, 1, 0, 0, 1, 1,
-0.5723017, 0.2394121, -0.08421459, 1, 0, 0, 1, 1,
-0.570434, -1.34738, -3.780019, 1, 0, 0, 1, 1,
-0.5657548, 1.287769, -1.001596, 0, 0, 0, 1, 1,
-0.555797, -0.7715243, -2.312751, 0, 0, 0, 1, 1,
-0.5552679, 2.436967, -0.1822357, 0, 0, 0, 1, 1,
-0.5497913, 0.7559298, -0.3834447, 0, 0, 0, 1, 1,
-0.5466215, 1.314495, -1.255432, 0, 0, 0, 1, 1,
-0.5444721, 0.2667941, -0.9488261, 0, 0, 0, 1, 1,
-0.5431327, -1.121643, -3.866694, 0, 0, 0, 1, 1,
-0.5394188, 0.7683179, -0.3978342, 1, 1, 1, 1, 1,
-0.5349686, 0.3380878, -2.391051, 1, 1, 1, 1, 1,
-0.5260785, -0.2755058, -3.942897, 1, 1, 1, 1, 1,
-0.5248272, -2.952519, -2.423935, 1, 1, 1, 1, 1,
-0.5220215, -1.647739, -1.853397, 1, 1, 1, 1, 1,
-0.5109999, 0.9307766, -2.598151, 1, 1, 1, 1, 1,
-0.5095848, -1.053623, -3.181836, 1, 1, 1, 1, 1,
-0.5066432, 0.1910262, 1.148468, 1, 1, 1, 1, 1,
-0.5023916, -0.8742732, -1.647037, 1, 1, 1, 1, 1,
-0.500113, 0.1251434, -3.99241, 1, 1, 1, 1, 1,
-0.49957, -1.244197, -4.690158, 1, 1, 1, 1, 1,
-0.4994641, -0.1165068, -1.937922, 1, 1, 1, 1, 1,
-0.4986616, 0.210812, -2.301459, 1, 1, 1, 1, 1,
-0.4955179, 0.3598887, -0.441677, 1, 1, 1, 1, 1,
-0.4932737, -0.5500683, -1.603001, 1, 1, 1, 1, 1,
-0.4924145, -2.672424, -1.756473, 0, 0, 1, 1, 1,
-0.488485, 0.1524221, -0.5239682, 1, 0, 0, 1, 1,
-0.4884378, 1.737752, 0.2899917, 1, 0, 0, 1, 1,
-0.488229, 1.900804, 0.4900881, 1, 0, 0, 1, 1,
-0.4814252, -0.4213796, -4.400331, 1, 0, 0, 1, 1,
-0.4787268, 0.3044199, -2.20845, 1, 0, 0, 1, 1,
-0.4769738, 0.980806, -1.726976, 0, 0, 0, 1, 1,
-0.4748224, 0.4587047, -1.207471, 0, 0, 0, 1, 1,
-0.4699507, 1.762707, 1.018283, 0, 0, 0, 1, 1,
-0.4679139, -1.131551, -3.360286, 0, 0, 0, 1, 1,
-0.4619762, -0.2566143, -1.962392, 0, 0, 0, 1, 1,
-0.4602116, -0.7166504, -3.935619, 0, 0, 0, 1, 1,
-0.4586783, -0.6923716, -1.994593, 0, 0, 0, 1, 1,
-0.457903, -0.7894945, -1.994956, 1, 1, 1, 1, 1,
-0.4553804, -1.640739, -3.647568, 1, 1, 1, 1, 1,
-0.4531575, -0.2165822, -1.909651, 1, 1, 1, 1, 1,
-0.4518675, 0.0328851, -1.631196, 1, 1, 1, 1, 1,
-0.448585, 1.031273, -1.296021, 1, 1, 1, 1, 1,
-0.4462727, 1.32793, 1.492701, 1, 1, 1, 1, 1,
-0.4449727, -0.4064919, -3.374681, 1, 1, 1, 1, 1,
-0.4445481, -0.3297549, -2.247303, 1, 1, 1, 1, 1,
-0.4437672, -0.211783, -2.637723, 1, 1, 1, 1, 1,
-0.443591, 2.048063, -0.9435481, 1, 1, 1, 1, 1,
-0.4363305, -0.04393218, -1.679026, 1, 1, 1, 1, 1,
-0.4315256, 0.8290975, -1.315196, 1, 1, 1, 1, 1,
-0.4307269, 0.6706643, -0.4316727, 1, 1, 1, 1, 1,
-0.4285578, 0.7441662, -0.8966207, 1, 1, 1, 1, 1,
-0.4254298, 0.1685905, -2.378162, 1, 1, 1, 1, 1,
-0.4205181, -0.6307129, -3.287916, 0, 0, 1, 1, 1,
-0.4190802, 0.4092274, -0.3923202, 1, 0, 0, 1, 1,
-0.415601, 0.8849444, -0.004009061, 1, 0, 0, 1, 1,
-0.4155145, -0.08726795, -3.069198, 1, 0, 0, 1, 1,
-0.4144065, 1.854882, 0.01244313, 1, 0, 0, 1, 1,
-0.408234, 0.4610073, -0.3128846, 1, 0, 0, 1, 1,
-0.4076895, 0.009300359, -2.22776, 0, 0, 0, 1, 1,
-0.4069088, -0.5854542, -4.137248, 0, 0, 0, 1, 1,
-0.4050393, -1.991029, -3.797235, 0, 0, 0, 1, 1,
-0.4004879, 1.700682, -0.5174522, 0, 0, 0, 1, 1,
-0.3949476, -1.211192, -3.219264, 0, 0, 0, 1, 1,
-0.3945222, -0.750944, -1.874046, 0, 0, 0, 1, 1,
-0.3933952, 0.5672956, 1.54246, 0, 0, 0, 1, 1,
-0.3932334, -0.3059059, -2.900109, 1, 1, 1, 1, 1,
-0.39271, 0.3467545, -3.051507, 1, 1, 1, 1, 1,
-0.3849355, 0.4280457, -1.795479, 1, 1, 1, 1, 1,
-0.3831533, 0.4546165, -0.4720925, 1, 1, 1, 1, 1,
-0.3821379, 1.056375, -0.4266621, 1, 1, 1, 1, 1,
-0.3800161, -0.371377, -2.076992, 1, 1, 1, 1, 1,
-0.3795005, 0.8514459, 0.3460048, 1, 1, 1, 1, 1,
-0.3765766, -0.1423525, -1.768889, 1, 1, 1, 1, 1,
-0.3727532, 0.560786, -0.5832602, 1, 1, 1, 1, 1,
-0.3630806, 1.726059, -1.307517, 1, 1, 1, 1, 1,
-0.3580008, 0.216031, -1.420188, 1, 1, 1, 1, 1,
-0.3536195, -1.46078, -2.684723, 1, 1, 1, 1, 1,
-0.3514388, 0.5563123, -2.84355, 1, 1, 1, 1, 1,
-0.3461426, -0.1667465, -0.3433025, 1, 1, 1, 1, 1,
-0.3443369, -0.4155008, -4.198584, 1, 1, 1, 1, 1,
-0.343316, 0.6862083, -2.000605, 0, 0, 1, 1, 1,
-0.3411348, -0.2566555, -3.564062, 1, 0, 0, 1, 1,
-0.33826, 0.9345036, -1.343655, 1, 0, 0, 1, 1,
-0.3241517, 0.5533925, -2.153291, 1, 0, 0, 1, 1,
-0.3201078, -0.3720974, -3.496255, 1, 0, 0, 1, 1,
-0.3194142, 1.053931, -0.8969821, 1, 0, 0, 1, 1,
-0.3191425, -0.8995278, -1.745668, 0, 0, 0, 1, 1,
-0.3153079, 0.2415649, 0.7419633, 0, 0, 0, 1, 1,
-0.3113742, -0.8085964, -1.943673, 0, 0, 0, 1, 1,
-0.3108384, -0.9921361, -2.440743, 0, 0, 0, 1, 1,
-0.3108184, 1.218045, -0.2363425, 0, 0, 0, 1, 1,
-0.3051459, -2.013453, -3.588905, 0, 0, 0, 1, 1,
-0.3046462, 0.7326565, 2.026871, 0, 0, 0, 1, 1,
-0.2997119, -0.01122223, -0.09502443, 1, 1, 1, 1, 1,
-0.2995583, 0.06684384, -1.254056, 1, 1, 1, 1, 1,
-0.2969393, 2.337515, -0.6215692, 1, 1, 1, 1, 1,
-0.2956803, 0.7422745, 0.3269698, 1, 1, 1, 1, 1,
-0.2871166, 1.068867, -0.5833045, 1, 1, 1, 1, 1,
-0.2837314, 0.4128307, -1.535566, 1, 1, 1, 1, 1,
-0.2831487, 0.6115366, 0.4711035, 1, 1, 1, 1, 1,
-0.2815687, 0.7358492, 0.5872074, 1, 1, 1, 1, 1,
-0.2774709, 1.269683, -0.3075185, 1, 1, 1, 1, 1,
-0.2760831, 0.3046579, -0.1677576, 1, 1, 1, 1, 1,
-0.2741059, -0.6631972, -1.834551, 1, 1, 1, 1, 1,
-0.2732902, 0.06005885, -2.309785, 1, 1, 1, 1, 1,
-0.2693859, -0.408182, -3.026136, 1, 1, 1, 1, 1,
-0.2675971, 0.6121606, -2.8818, 1, 1, 1, 1, 1,
-0.2579811, 0.3705166, -1.407555, 1, 1, 1, 1, 1,
-0.2530462, -0.4021963, -1.651512, 0, 0, 1, 1, 1,
-0.2500308, 0.1406322, -0.09838887, 1, 0, 0, 1, 1,
-0.2495376, -1.080129, -1.056398, 1, 0, 0, 1, 1,
-0.2478581, -0.06693523, -2.969191, 1, 0, 0, 1, 1,
-0.2477923, 2.398829, 0.407768, 1, 0, 0, 1, 1,
-0.2451339, -0.2918458, -3.362882, 1, 0, 0, 1, 1,
-0.2434999, -0.8548586, -3.032138, 0, 0, 0, 1, 1,
-0.2409066, 0.6481789, 0.2783637, 0, 0, 0, 1, 1,
-0.2252962, -1.20228, -2.905187, 0, 0, 0, 1, 1,
-0.2211014, -0.003108907, -3.073308, 0, 0, 0, 1, 1,
-0.2181304, -1.612425, -3.171098, 0, 0, 0, 1, 1,
-0.2131683, 0.387204, -0.685504, 0, 0, 0, 1, 1,
-0.2111781, 0.3258941, -0.2583852, 0, 0, 0, 1, 1,
-0.210411, 1.238313, -1.22177, 1, 1, 1, 1, 1,
-0.2101015, 0.8182741, -1.48335, 1, 1, 1, 1, 1,
-0.209417, 0.390126, -0.7625944, 1, 1, 1, 1, 1,
-0.2093253, 0.02065033, 0.159206, 1, 1, 1, 1, 1,
-0.2090007, -0.5504259, -3.502614, 1, 1, 1, 1, 1,
-0.2078101, -0.6749258, -2.01576, 1, 1, 1, 1, 1,
-0.2066581, -0.2843178, -2.929927, 1, 1, 1, 1, 1,
-0.2047285, 0.8836359, -0.4403376, 1, 1, 1, 1, 1,
-0.2027443, 0.6211516, -0.4320064, 1, 1, 1, 1, 1,
-0.2021444, 0.4637925, 1.264204, 1, 1, 1, 1, 1,
-0.1997801, 0.8962317, -0.8064896, 1, 1, 1, 1, 1,
-0.1923238, 0.7229008, 0.1290399, 1, 1, 1, 1, 1,
-0.1895739, -0.3542778, -3.077641, 1, 1, 1, 1, 1,
-0.1892217, -0.8385108, -2.120813, 1, 1, 1, 1, 1,
-0.1887904, 0.4647346, -0.754024, 1, 1, 1, 1, 1,
-0.1882102, 0.9091619, -0.9140424, 0, 0, 1, 1, 1,
-0.1880053, 2.383417, 0.09369015, 1, 0, 0, 1, 1,
-0.1848383, -0.5025943, -1.42412, 1, 0, 0, 1, 1,
-0.1837007, -1.252971, -2.917947, 1, 0, 0, 1, 1,
-0.1814138, -1.35781, -3.906277, 1, 0, 0, 1, 1,
-0.1773393, -0.6671087, -4.65935, 1, 0, 0, 1, 1,
-0.1765336, -0.9844718, -4.338919, 0, 0, 0, 1, 1,
-0.1763701, -0.1124544, -2.15327, 0, 0, 0, 1, 1,
-0.1752116, 0.2265653, -1.043618, 0, 0, 0, 1, 1,
-0.1692241, -0.3879532, -1.764027, 0, 0, 0, 1, 1,
-0.1689783, -0.5744356, -3.026182, 0, 0, 0, 1, 1,
-0.165821, -1.176152, -1.614133, 0, 0, 0, 1, 1,
-0.1649839, 0.1266406, -1.725561, 0, 0, 0, 1, 1,
-0.1585086, 1.887786, -2.215627, 1, 1, 1, 1, 1,
-0.1582053, -0.358669, -3.34397, 1, 1, 1, 1, 1,
-0.1570719, -0.2679458, -0.9052328, 1, 1, 1, 1, 1,
-0.1568387, 0.6792878, -0.6370553, 1, 1, 1, 1, 1,
-0.1514771, -0.2374597, -2.074304, 1, 1, 1, 1, 1,
-0.1447949, -0.905417, -4.338663, 1, 1, 1, 1, 1,
-0.1423344, -0.1721323, -1.149521, 1, 1, 1, 1, 1,
-0.1389899, -0.1866435, -3.242484, 1, 1, 1, 1, 1,
-0.1367065, 0.3918197, -0.6608735, 1, 1, 1, 1, 1,
-0.1335564, 0.6065584, -0.8137871, 1, 1, 1, 1, 1,
-0.1331983, -0.5317519, -2.73996, 1, 1, 1, 1, 1,
-0.1271181, 0.1013823, -2.038588, 1, 1, 1, 1, 1,
-0.1261012, 1.571956, -1.962226, 1, 1, 1, 1, 1,
-0.122857, 0.6028637, -0.8478092, 1, 1, 1, 1, 1,
-0.122764, -0.4210277, -2.136495, 1, 1, 1, 1, 1,
-0.1206086, -1.067803, -1.931821, 0, 0, 1, 1, 1,
-0.1176715, 0.9511567, -0.4443547, 1, 0, 0, 1, 1,
-0.1151009, -0.110053, -1.613204, 1, 0, 0, 1, 1,
-0.1124782, -0.254594, -1.240772, 1, 0, 0, 1, 1,
-0.1085728, 0.1142977, 0.5705878, 1, 0, 0, 1, 1,
-0.1036055, -0.7882986, -3.091696, 1, 0, 0, 1, 1,
-0.1025756, -0.3427055, -2.011013, 0, 0, 0, 1, 1,
-0.09753375, 0.2199046, 2.132666, 0, 0, 0, 1, 1,
-0.09481944, -0.8098788, -2.225901, 0, 0, 0, 1, 1,
-0.09204857, 1.155492, 1.085212, 0, 0, 0, 1, 1,
-0.09110875, -0.8499391, -2.467673, 0, 0, 0, 1, 1,
-0.09041251, 0.05154176, -0.5076231, 0, 0, 0, 1, 1,
-0.0901628, -0.6731226, -1.847795, 0, 0, 0, 1, 1,
-0.09003333, -1.266607, -2.882881, 1, 1, 1, 1, 1,
-0.08877626, -0.1084147, -1.839157, 1, 1, 1, 1, 1,
-0.08786318, 1.7111, -0.4995129, 1, 1, 1, 1, 1,
-0.08561714, 0.02141676, 0.2039939, 1, 1, 1, 1, 1,
-0.08310059, 0.2990237, -0.4717896, 1, 1, 1, 1, 1,
-0.08167377, -0.686374, -3.258951, 1, 1, 1, 1, 1,
-0.0814845, 1.503749, -0.7556477, 1, 1, 1, 1, 1,
-0.08069099, -0.5145207, -3.59465, 1, 1, 1, 1, 1,
-0.08034958, -0.3148346, -2.37764, 1, 1, 1, 1, 1,
-0.07971243, 0.3690387, -0.720806, 1, 1, 1, 1, 1,
-0.07644415, -0.08235405, -1.72622, 1, 1, 1, 1, 1,
-0.07564197, -0.661814, -2.55498, 1, 1, 1, 1, 1,
-0.06760403, 0.7349574, -0.2581355, 1, 1, 1, 1, 1,
-0.06748606, -0.8464467, -3.067086, 1, 1, 1, 1, 1,
-0.061847, 1.612069, -0.3912515, 1, 1, 1, 1, 1,
-0.05935674, -0.7983015, -3.221121, 0, 0, 1, 1, 1,
-0.05549352, 0.6071554, 0.8081928, 1, 0, 0, 1, 1,
-0.04846228, 0.4931821, -0.08912103, 1, 0, 0, 1, 1,
-0.04841407, -0.4804924, -3.35106, 1, 0, 0, 1, 1,
-0.04800467, 2.002097, -0.6164205, 1, 0, 0, 1, 1,
-0.0458868, 0.1159236, 0.8642336, 1, 0, 0, 1, 1,
-0.04217426, 0.3069796, -0.9785477, 0, 0, 0, 1, 1,
-0.04011221, 0.9589193, 0.5203612, 0, 0, 0, 1, 1,
-0.03655435, 0.1146617, -0.1623578, 0, 0, 0, 1, 1,
-0.03576592, -1.501716, -1.936674, 0, 0, 0, 1, 1,
-0.02484507, -0.3596425, -2.74956, 0, 0, 0, 1, 1,
-0.02408047, 0.1505377, 0.3862242, 0, 0, 0, 1, 1,
-0.02286919, -0.8065251, -1.825173, 0, 0, 0, 1, 1,
-0.02271284, -0.2119109, -4.036118, 1, 1, 1, 1, 1,
-0.02002804, -2.486628, -3.411966, 1, 1, 1, 1, 1,
-0.01912777, -0.3859383, -1.005441, 1, 1, 1, 1, 1,
-0.0170598, -1.162806, -3.099891, 1, 1, 1, 1, 1,
-0.01559765, -0.2806417, -2.631586, 1, 1, 1, 1, 1,
-0.01359117, 0.7386956, 0.9621266, 1, 1, 1, 1, 1,
-0.01348514, -0.2902044, -2.675018, 1, 1, 1, 1, 1,
-0.012377, -0.589857, -1.860855, 1, 1, 1, 1, 1,
-0.01180412, 1.302247, 0.384635, 1, 1, 1, 1, 1,
-0.008510202, 0.2399967, 0.09216104, 1, 1, 1, 1, 1,
-0.005043255, 0.8851786, 0.2389194, 1, 1, 1, 1, 1,
-0.00436433, -2.041544, -2.719874, 1, 1, 1, 1, 1,
-0.004191489, 0.2920884, 0.8799278, 1, 1, 1, 1, 1,
-0.003933939, -0.9950322, -2.584883, 1, 1, 1, 1, 1,
-0.003559866, 0.9962048, -1.281517, 1, 1, 1, 1, 1,
-0.001127579, 0.3794439, 1.033748, 0, 0, 1, 1, 1,
0.003276918, -0.01869877, 2.375993, 1, 0, 0, 1, 1,
0.003593599, 0.7141134, -1.048172, 1, 0, 0, 1, 1,
0.004169882, -0.4827722, 1.65879, 1, 0, 0, 1, 1,
0.01398473, -0.6515961, 2.522638, 1, 0, 0, 1, 1,
0.01503703, -0.8287678, 3.76213, 1, 0, 0, 1, 1,
0.01730795, 1.197936, 1.368374, 0, 0, 0, 1, 1,
0.01828723, 1.090986, -0.6527728, 0, 0, 0, 1, 1,
0.02195662, -0.1690069, 3.894298, 0, 0, 0, 1, 1,
0.02795623, -1.1158, 3.888832, 0, 0, 0, 1, 1,
0.02999892, 0.5074613, -0.7691633, 0, 0, 0, 1, 1,
0.03028351, -0.21397, 2.953718, 0, 0, 0, 1, 1,
0.03129647, 1.168808, -0.5521442, 0, 0, 0, 1, 1,
0.0332163, -1.39576, 2.362069, 1, 1, 1, 1, 1,
0.03321801, 0.1653411, -0.09805847, 1, 1, 1, 1, 1,
0.03623327, 0.6601598, -0.2240696, 1, 1, 1, 1, 1,
0.0368993, -0.4679184, 2.728599, 1, 1, 1, 1, 1,
0.04216108, 0.08802042, -0.4057375, 1, 1, 1, 1, 1,
0.04303663, -0.5985069, 2.716206, 1, 1, 1, 1, 1,
0.04368863, 0.08176772, 2.007567, 1, 1, 1, 1, 1,
0.04465109, 0.08962397, -0.5049071, 1, 1, 1, 1, 1,
0.04605858, 0.8347831, 0.7475416, 1, 1, 1, 1, 1,
0.04637432, -0.7607453, 3.937148, 1, 1, 1, 1, 1,
0.05895401, -0.3441077, 2.722659, 1, 1, 1, 1, 1,
0.0621646, 0.1344945, -1.088525, 1, 1, 1, 1, 1,
0.06582586, 0.9264656, -1.803465, 1, 1, 1, 1, 1,
0.06815687, -0.455687, 2.99193, 1, 1, 1, 1, 1,
0.07643962, 1.449797, -1.467765, 1, 1, 1, 1, 1,
0.07710773, 0.4689371, 0.5341578, 0, 0, 1, 1, 1,
0.07976325, -0.9113782, 2.842152, 1, 0, 0, 1, 1,
0.08313804, -0.1800259, 3.217655, 1, 0, 0, 1, 1,
0.08376747, -0.91434, 3.078937, 1, 0, 0, 1, 1,
0.08411491, -1.527671, 4.426703, 1, 0, 0, 1, 1,
0.08703276, -0.3403707, 4.673629, 1, 0, 0, 1, 1,
0.09294071, 0.8985367, -0.4144668, 0, 0, 0, 1, 1,
0.09378348, 0.2421562, 1.134962, 0, 0, 0, 1, 1,
0.0938535, -0.4254733, 1.628713, 0, 0, 0, 1, 1,
0.09525439, 2.331167, 0.2497542, 0, 0, 0, 1, 1,
0.09756041, 1.438316, 0.002208997, 0, 0, 0, 1, 1,
0.0982619, 0.2951682, 0.7715293, 0, 0, 0, 1, 1,
0.09980427, 0.3346038, -0.0884821, 0, 0, 0, 1, 1,
0.1045734, 0.05210648, -0.3717549, 1, 1, 1, 1, 1,
0.1094012, -0.2066822, 3.132909, 1, 1, 1, 1, 1,
0.1100387, -1.092921, 2.330144, 1, 1, 1, 1, 1,
0.1106026, 0.5668843, -1.228441, 1, 1, 1, 1, 1,
0.1110807, -0.5671628, 3.200965, 1, 1, 1, 1, 1,
0.1116172, -1.59339, 2.636969, 1, 1, 1, 1, 1,
0.1168614, -0.4633195, 4.431072, 1, 1, 1, 1, 1,
0.1172203, 0.2670465, -0.1508219, 1, 1, 1, 1, 1,
0.1330017, 0.5433559, 0.3393356, 1, 1, 1, 1, 1,
0.1338619, -1.336235, 2.117333, 1, 1, 1, 1, 1,
0.134163, 0.03231923, 0.7780576, 1, 1, 1, 1, 1,
0.1360765, -0.1215174, 2.652234, 1, 1, 1, 1, 1,
0.1411271, 0.3573107, -0.1491524, 1, 1, 1, 1, 1,
0.1435055, -1.05818, 4.091199, 1, 1, 1, 1, 1,
0.1443532, 0.09497678, 1.482212, 1, 1, 1, 1, 1,
0.1458945, -0.6049454, 2.150729, 0, 0, 1, 1, 1,
0.1472839, -2.756767, 4.809512, 1, 0, 0, 1, 1,
0.1478098, -0.80089, 4.010041, 1, 0, 0, 1, 1,
0.1520796, -0.09883642, 2.420551, 1, 0, 0, 1, 1,
0.1544932, -0.4105001, 2.899884, 1, 0, 0, 1, 1,
0.1550728, -2.604618, 3.013012, 1, 0, 0, 1, 1,
0.1553116, -0.2214572, 0.1107197, 0, 0, 0, 1, 1,
0.156, 0.881948, 1.179259, 0, 0, 0, 1, 1,
0.1575589, 1.359073, -0.464408, 0, 0, 0, 1, 1,
0.1580805, 1.395622, -0.5066319, 0, 0, 0, 1, 1,
0.1599933, 1.528917, -1.641104, 0, 0, 0, 1, 1,
0.1607402, 0.3561227, 1.937141, 0, 0, 0, 1, 1,
0.1612582, 1.238912, -1.06994, 0, 0, 0, 1, 1,
0.1626684, 0.9134581, 1.140055, 1, 1, 1, 1, 1,
0.1639086, 0.5034205, 2.56645, 1, 1, 1, 1, 1,
0.1643031, -1.055497, 3.641171, 1, 1, 1, 1, 1,
0.1649435, -0.9756978, 4.726182, 1, 1, 1, 1, 1,
0.1657862, 0.5452411, 1.326022, 1, 1, 1, 1, 1,
0.1669388, 0.5682901, -0.08074532, 1, 1, 1, 1, 1,
0.1692275, 0.4528967, 0.4947929, 1, 1, 1, 1, 1,
0.1739632, 0.07868067, 0.882614, 1, 1, 1, 1, 1,
0.1786047, -0.5671063, 2.431815, 1, 1, 1, 1, 1,
0.1887313, -0.9650621, 3.538828, 1, 1, 1, 1, 1,
0.1910304, -1.348346, 2.593707, 1, 1, 1, 1, 1,
0.1935055, 0.1294398, 2.623103, 1, 1, 1, 1, 1,
0.1935213, 1.449467, -0.1125563, 1, 1, 1, 1, 1,
0.1970281, -1.322382, 2.686475, 1, 1, 1, 1, 1,
0.1987677, 0.004323796, 2.03449, 1, 1, 1, 1, 1,
0.2024956, 0.8242655, 0.7469264, 0, 0, 1, 1, 1,
0.2055856, 0.437295, 1.421836, 1, 0, 0, 1, 1,
0.2070641, -0.5995505, 2.623437, 1, 0, 0, 1, 1,
0.2091092, 0.4609281, -1.598705, 1, 0, 0, 1, 1,
0.2163928, 0.540017, -1.050271, 1, 0, 0, 1, 1,
0.2182002, -1.768534, 3.160022, 1, 0, 0, 1, 1,
0.2187461, -0.02809793, 1.706216, 0, 0, 0, 1, 1,
0.2194015, -0.288682, 3.023758, 0, 0, 0, 1, 1,
0.2232714, -1.325953, 4.323413, 0, 0, 0, 1, 1,
0.2238187, 0.4053188, 1.074929, 0, 0, 0, 1, 1,
0.2287241, -0.5374458, 4.019858, 0, 0, 0, 1, 1,
0.2352532, 0.07637326, 1.996568, 0, 0, 0, 1, 1,
0.2370292, 0.3723208, 0.761865, 0, 0, 0, 1, 1,
0.2390486, 0.5642104, 3.010321, 1, 1, 1, 1, 1,
0.241374, -0.3013465, 2.228955, 1, 1, 1, 1, 1,
0.2459961, -0.7467771, 3.502713, 1, 1, 1, 1, 1,
0.2472895, 0.3165919, 2.371068, 1, 1, 1, 1, 1,
0.2480568, 1.511714, -1.953046, 1, 1, 1, 1, 1,
0.2533444, -0.4718606, 1.192961, 1, 1, 1, 1, 1,
0.2538321, -2.39884, 3.579947, 1, 1, 1, 1, 1,
0.2591061, -2.134492, 2.865932, 1, 1, 1, 1, 1,
0.2597088, -0.8955529, 2.569892, 1, 1, 1, 1, 1,
0.2615885, -0.2989215, 4.866891, 1, 1, 1, 1, 1,
0.2636092, -0.3515122, 3.239558, 1, 1, 1, 1, 1,
0.267211, 0.9920576, 0.6614991, 1, 1, 1, 1, 1,
0.2699911, 0.8901053, -0.2175505, 1, 1, 1, 1, 1,
0.2733482, -0.3001527, 3.095681, 1, 1, 1, 1, 1,
0.274815, 0.271933, 0.5281536, 1, 1, 1, 1, 1,
0.2801853, -0.4710624, 3.348686, 0, 0, 1, 1, 1,
0.2855139, 0.4670853, 0.7046214, 1, 0, 0, 1, 1,
0.2857095, 1.262173, -0.2580381, 1, 0, 0, 1, 1,
0.2879083, 1.147524, 0.6666223, 1, 0, 0, 1, 1,
0.2893893, 0.07514168, 0.8756841, 1, 0, 0, 1, 1,
0.2894456, 1.520776, 2.00724, 1, 0, 0, 1, 1,
0.2914123, -0.1800195, 2.624738, 0, 0, 0, 1, 1,
0.2934509, 0.1585986, 2.033065, 0, 0, 0, 1, 1,
0.2946739, -0.8448605, 3.441085, 0, 0, 0, 1, 1,
0.2971265, 0.7413456, 0.1236695, 0, 0, 0, 1, 1,
0.299397, 0.8557792, -0.006533606, 0, 0, 0, 1, 1,
0.2999547, 0.8201477, -0.37374, 0, 0, 0, 1, 1,
0.3003778, 0.7190266, -0.5895254, 0, 0, 0, 1, 1,
0.3017117, 0.8595732, 2.514107, 1, 1, 1, 1, 1,
0.3022718, 0.501251, 1.313679, 1, 1, 1, 1, 1,
0.3069378, 0.5828353, 2.77913, 1, 1, 1, 1, 1,
0.3077095, -0.5349905, 3.024745, 1, 1, 1, 1, 1,
0.3153349, -0.4769708, 0.712975, 1, 1, 1, 1, 1,
0.3155824, -0.01595329, 1.384008, 1, 1, 1, 1, 1,
0.3205666, 0.2570464, -0.1827306, 1, 1, 1, 1, 1,
0.3208688, 0.3300636, 0.160811, 1, 1, 1, 1, 1,
0.3209866, 0.8013659, 0.9134705, 1, 1, 1, 1, 1,
0.3210557, 0.4892376, 0.9652568, 1, 1, 1, 1, 1,
0.3212305, -0.6233073, 2.924747, 1, 1, 1, 1, 1,
0.3295159, 0.04177551, 1.120944, 1, 1, 1, 1, 1,
0.3308977, 0.2027558, 2.137022, 1, 1, 1, 1, 1,
0.3340524, 2.273649, -1.096103, 1, 1, 1, 1, 1,
0.3343999, 0.3499696, 1.25974, 1, 1, 1, 1, 1,
0.3354416, -0.6951891, 3.261781, 0, 0, 1, 1, 1,
0.3420533, -0.5680248, 1.20814, 1, 0, 0, 1, 1,
0.3440601, -0.6613694, 3.470516, 1, 0, 0, 1, 1,
0.3449076, -1.826103, 4.141205, 1, 0, 0, 1, 1,
0.3482312, -0.7268605, 2.455692, 1, 0, 0, 1, 1,
0.3515607, -0.2338146, 3.612892, 1, 0, 0, 1, 1,
0.3549999, -0.9006085, 3.787474, 0, 0, 0, 1, 1,
0.3551975, -0.7132757, 2.728041, 0, 0, 0, 1, 1,
0.3635375, 1.153515, 0.2788807, 0, 0, 0, 1, 1,
0.3659791, 0.1745911, 1.164794, 0, 0, 0, 1, 1,
0.369447, 1.366206, 0.872835, 0, 0, 0, 1, 1,
0.3695716, -0.002688833, 1.867967, 0, 0, 0, 1, 1,
0.3716562, 1.649824, -1.072724, 0, 0, 0, 1, 1,
0.3733741, -2.18793, 1.12114, 1, 1, 1, 1, 1,
0.3734861, 0.1491127, -0.07383665, 1, 1, 1, 1, 1,
0.3742484, -0.3202472, 3.039095, 1, 1, 1, 1, 1,
0.3752362, 0.7545355, 0.3799228, 1, 1, 1, 1, 1,
0.3761054, -0.2317904, 3.783582, 1, 1, 1, 1, 1,
0.3768647, -0.9934525, 3.091664, 1, 1, 1, 1, 1,
0.3771308, 0.7551063, 0.1128518, 1, 1, 1, 1, 1,
0.3779756, 1.105932, 0.4467335, 1, 1, 1, 1, 1,
0.3796538, -0.8026216, 3.864186, 1, 1, 1, 1, 1,
0.3800896, 0.6975188, 0.7422082, 1, 1, 1, 1, 1,
0.3829719, 1.235897, 0.6184771, 1, 1, 1, 1, 1,
0.3838409, -0.1133107, 1.808918, 1, 1, 1, 1, 1,
0.3902076, 1.551147, 2.354213, 1, 1, 1, 1, 1,
0.3925592, -0.5894755, 3.30101, 1, 1, 1, 1, 1,
0.393548, 0.1341849, 2.469691, 1, 1, 1, 1, 1,
0.4072473, 1.106055, 0.6559454, 0, 0, 1, 1, 1,
0.4101535, -0.8011217, 1.812135, 1, 0, 0, 1, 1,
0.4111578, 0.6795952, -0.1827054, 1, 0, 0, 1, 1,
0.4151091, 1.576978, 0.3515473, 1, 0, 0, 1, 1,
0.4156236, -0.03338915, 2.551384, 1, 0, 0, 1, 1,
0.4183953, 0.6598247, 0.3952324, 1, 0, 0, 1, 1,
0.4184282, -0.9420435, 1.212172, 0, 0, 0, 1, 1,
0.4217525, 0.6442335, 0.5581547, 0, 0, 0, 1, 1,
0.4247112, 0.3518225, 0.05785464, 0, 0, 0, 1, 1,
0.4305491, -0.2069258, 1.977763, 0, 0, 0, 1, 1,
0.4314406, 0.2532699, 2.802138, 0, 0, 0, 1, 1,
0.4322743, -0.4095723, 1.814857, 0, 0, 0, 1, 1,
0.4353535, 0.4072286, 0.5722608, 0, 0, 0, 1, 1,
0.437397, 1.226522, 0.4694881, 1, 1, 1, 1, 1,
0.4396721, 1.014524, 1.459284, 1, 1, 1, 1, 1,
0.4425481, 0.8835303, 0.9850678, 1, 1, 1, 1, 1,
0.4429097, -0.8157473, 3.989369, 1, 1, 1, 1, 1,
0.4435658, 1.074447, -1.058244, 1, 1, 1, 1, 1,
0.4467672, -0.9168308, 2.503886, 1, 1, 1, 1, 1,
0.4506159, 0.0828801, 0.6038907, 1, 1, 1, 1, 1,
0.4674132, -0.3766504, 3.314895, 1, 1, 1, 1, 1,
0.4698373, -0.70912, 0.7405171, 1, 1, 1, 1, 1,
0.4708783, 0.4517158, -0.3805794, 1, 1, 1, 1, 1,
0.4747178, 0.1731471, 2.125268, 1, 1, 1, 1, 1,
0.475079, -0.221197, 0.9085397, 1, 1, 1, 1, 1,
0.4763135, 1.274654, 2.096393, 1, 1, 1, 1, 1,
0.4768842, 0.3692032, 0.889569, 1, 1, 1, 1, 1,
0.4796407, 0.4596504, -0.4440856, 1, 1, 1, 1, 1,
0.4804499, -0.01686581, 1.792972, 0, 0, 1, 1, 1,
0.4829395, -0.9455667, 2.549026, 1, 0, 0, 1, 1,
0.4838131, 0.7440907, 1.471463, 1, 0, 0, 1, 1,
0.4860224, -0.1642499, 0.9251453, 1, 0, 0, 1, 1,
0.4932455, -0.5113915, 2.782631, 1, 0, 0, 1, 1,
0.4934718, 1.294183, 2.421217, 1, 0, 0, 1, 1,
0.4992066, 1.68969, 1.554965, 0, 0, 0, 1, 1,
0.5039561, 1.061104, 1.459467, 0, 0, 0, 1, 1,
0.5069935, 1.973052, 0.4870126, 0, 0, 0, 1, 1,
0.5072226, -0.5307334, 2.879186, 0, 0, 0, 1, 1,
0.5078876, -1.055096, 3.824699, 0, 0, 0, 1, 1,
0.5250102, 0.6459486, 0.8100565, 0, 0, 0, 1, 1,
0.5280817, -1.306615, 2.780424, 0, 0, 0, 1, 1,
0.5280971, -0.7751051, 1.263565, 1, 1, 1, 1, 1,
0.5288104, -0.3621865, 2.242636, 1, 1, 1, 1, 1,
0.5296468, -0.5180908, 2.521635, 1, 1, 1, 1, 1,
0.5330497, -0.1928664, 2.648059, 1, 1, 1, 1, 1,
0.542199, 0.1564502, 0.3193878, 1, 1, 1, 1, 1,
0.542776, -2.032871, 2.697823, 1, 1, 1, 1, 1,
0.5441132, 0.8969804, -0.3797505, 1, 1, 1, 1, 1,
0.5555961, 0.9804834, 0.2008324, 1, 1, 1, 1, 1,
0.557807, -0.03112162, 2.040123, 1, 1, 1, 1, 1,
0.5649909, -1.005154, 3.140565, 1, 1, 1, 1, 1,
0.5688108, 0.951237, 0.9602912, 1, 1, 1, 1, 1,
0.5723118, 1.782928, -0.05745249, 1, 1, 1, 1, 1,
0.5738407, -0.8211482, 1.726208, 1, 1, 1, 1, 1,
0.5776133, -2.584909, 2.034384, 1, 1, 1, 1, 1,
0.5813236, -0.796109, 3.055547, 1, 1, 1, 1, 1,
0.5817019, -0.5776007, 1.604447, 0, 0, 1, 1, 1,
0.581722, -0.09443774, 1.151056, 1, 0, 0, 1, 1,
0.5818686, 0.4135433, 2.75745, 1, 0, 0, 1, 1,
0.5828975, 1.22408, 0.7886223, 1, 0, 0, 1, 1,
0.5848553, 0.981183, 1.924794, 1, 0, 0, 1, 1,
0.5915715, -1.628279, 3.354153, 1, 0, 0, 1, 1,
0.5922395, -1.448723, 3.120844, 0, 0, 0, 1, 1,
0.5991434, 0.8967044, 0.9874849, 0, 0, 0, 1, 1,
0.5993335, -0.6876523, 2.584472, 0, 0, 0, 1, 1,
0.5997663, 0.1269425, 2.859203, 0, 0, 0, 1, 1,
0.6147736, 0.5372808, 2.114716, 0, 0, 0, 1, 1,
0.6163262, 0.3090999, 2.394877, 0, 0, 0, 1, 1,
0.6189216, 0.5732819, 1.395019, 0, 0, 0, 1, 1,
0.6244547, 2.650077, -0.5384532, 1, 1, 1, 1, 1,
0.6294697, -0.2983467, 1.338235, 1, 1, 1, 1, 1,
0.6328263, 0.2956392, 0.9564359, 1, 1, 1, 1, 1,
0.6349534, -0.2152855, 0.6337822, 1, 1, 1, 1, 1,
0.6373098, 0.6897424, 0.2968411, 1, 1, 1, 1, 1,
0.6396989, 0.1772334, 1.180349, 1, 1, 1, 1, 1,
0.6402806, 0.2602175, 1.888245, 1, 1, 1, 1, 1,
0.6406208, 0.9428597, -0.1646069, 1, 1, 1, 1, 1,
0.6417788, -1.093965, 3.541388, 1, 1, 1, 1, 1,
0.643492, -0.2820334, 1.127809, 1, 1, 1, 1, 1,
0.645565, 0.1948661, 1.596843, 1, 1, 1, 1, 1,
0.6462367, -0.5872221, 1.343888, 1, 1, 1, 1, 1,
0.6492277, -2.115614, 2.774087, 1, 1, 1, 1, 1,
0.6566839, 0.7853376, 1.123902, 1, 1, 1, 1, 1,
0.6626586, 1.214254, -0.5377916, 1, 1, 1, 1, 1,
0.6664492, -2.219741, 3.127714, 0, 0, 1, 1, 1,
0.6681802, -2.911248, 2.100482, 1, 0, 0, 1, 1,
0.6697907, -1.356171, 2.838177, 1, 0, 0, 1, 1,
0.6698569, 1.093293, 0.4986121, 1, 0, 0, 1, 1,
0.6721796, 0.5759224, 1.38908, 1, 0, 0, 1, 1,
0.6723339, 0.761048, 0.6548563, 1, 0, 0, 1, 1,
0.6759161, -0.6333111, 2.433472, 0, 0, 0, 1, 1,
0.6760229, 0.9108853, 0.4235282, 0, 0, 0, 1, 1,
0.6761408, -0.513733, 2.649079, 0, 0, 0, 1, 1,
0.6763217, -1.522747, 3.225134, 0, 0, 0, 1, 1,
0.682587, -0.0460523, 2.803655, 0, 0, 0, 1, 1,
0.6869497, -0.2764195, 1.184799, 0, 0, 0, 1, 1,
0.6904571, -0.2664269, 2.430543, 0, 0, 0, 1, 1,
0.6933073, -0.2945147, 2.403589, 1, 1, 1, 1, 1,
0.6938652, 0.08319523, 1.154687, 1, 1, 1, 1, 1,
0.6958907, 0.1674198, 3.134598, 1, 1, 1, 1, 1,
0.697866, 0.551658, 0.6610859, 1, 1, 1, 1, 1,
0.7045991, 2.07538, -0.1745948, 1, 1, 1, 1, 1,
0.707507, 0.8249816, 0.9400582, 1, 1, 1, 1, 1,
0.7079413, -2.305153, 2.306049, 1, 1, 1, 1, 1,
0.7083145, -0.1303236, 2.631851, 1, 1, 1, 1, 1,
0.7227442, 0.0235785, 1.250274, 1, 1, 1, 1, 1,
0.7231607, -0.7781332, 3.743465, 1, 1, 1, 1, 1,
0.7232179, -2.084673, 3.781709, 1, 1, 1, 1, 1,
0.7240093, 0.5416992, 1.195403, 1, 1, 1, 1, 1,
0.7287705, 1.947044, -0.2397446, 1, 1, 1, 1, 1,
0.7298304, -0.1117866, 1.861524, 1, 1, 1, 1, 1,
0.7349921, 0.3657109, 2.44384, 1, 1, 1, 1, 1,
0.7430866, -0.1691835, 3.018847, 0, 0, 1, 1, 1,
0.7441452, 2.117036, -0.1528086, 1, 0, 0, 1, 1,
0.7497461, -0.548333, 2.932337, 1, 0, 0, 1, 1,
0.7540726, -0.09960733, 1.694447, 1, 0, 0, 1, 1,
0.7546371, 1.723694, 1.680515, 1, 0, 0, 1, 1,
0.7554244, 0.6848042, -0.881122, 1, 0, 0, 1, 1,
0.7612589, 0.885326, 0.5991946, 0, 0, 0, 1, 1,
0.7636303, -0.4515606, 1.597231, 0, 0, 0, 1, 1,
0.7645991, 0.4091291, 0.9506425, 0, 0, 0, 1, 1,
0.7666255, 0.74484, 1.420154, 0, 0, 0, 1, 1,
0.7734474, -1.810802, 1.637834, 0, 0, 0, 1, 1,
0.7785183, -2.150094, 1.989835, 0, 0, 0, 1, 1,
0.7841625, -0.3546907, 2.327124, 0, 0, 0, 1, 1,
0.7845052, -1.167516, 4.502028, 1, 1, 1, 1, 1,
0.784843, 0.9749616, 0.8860633, 1, 1, 1, 1, 1,
0.7915462, -1.845557, 2.651468, 1, 1, 1, 1, 1,
0.7956961, 0.07708046, 2.043759, 1, 1, 1, 1, 1,
0.7979762, 1.083143, 1.862095, 1, 1, 1, 1, 1,
0.8026038, 0.9918621, -0.8522611, 1, 1, 1, 1, 1,
0.8050473, -1.03389, 2.213115, 1, 1, 1, 1, 1,
0.8124544, -1.517873, 2.399806, 1, 1, 1, 1, 1,
0.8125833, -0.02082119, 3.679248, 1, 1, 1, 1, 1,
0.8159411, 0.6100373, 0.7470471, 1, 1, 1, 1, 1,
0.8159497, 0.2239725, 0.8208812, 1, 1, 1, 1, 1,
0.8162349, -0.136008, 2.185748, 1, 1, 1, 1, 1,
0.8172016, 0.5952421, 0.01321496, 1, 1, 1, 1, 1,
0.8198928, 1.104684, 1.496679, 1, 1, 1, 1, 1,
0.8253538, -0.3542222, 1.200679, 1, 1, 1, 1, 1,
0.8385563, 0.1369034, 0.9293424, 0, 0, 1, 1, 1,
0.8414201, 1.314035, -0.8562059, 1, 0, 0, 1, 1,
0.8432539, -0.2186881, -0.3439194, 1, 0, 0, 1, 1,
0.8461292, 0.04984887, 1.476448, 1, 0, 0, 1, 1,
0.8480007, -0.6154228, 3.203544, 1, 0, 0, 1, 1,
0.8495054, 1.206481, 1.506968, 1, 0, 0, 1, 1,
0.8554665, -0.4343425, 1.88688, 0, 0, 0, 1, 1,
0.8606406, 0.2378778, 0.1067481, 0, 0, 0, 1, 1,
0.8697585, 0.3317403, 0.7530719, 0, 0, 0, 1, 1,
0.8742282, 0.02709664, 2.826385, 0, 0, 0, 1, 1,
0.8796132, -2.172802, 2.043427, 0, 0, 0, 1, 1,
0.88094, 1.15842, -0.06882339, 0, 0, 0, 1, 1,
0.8920401, 1.487868, -0.1643675, 0, 0, 0, 1, 1,
0.8964542, -0.7124211, 4.567486, 1, 1, 1, 1, 1,
0.9017296, -1.168831, 2.473514, 1, 1, 1, 1, 1,
0.9068515, 0.1181803, 2.002254, 1, 1, 1, 1, 1,
0.9180341, 1.714367, 1.353542, 1, 1, 1, 1, 1,
0.9250473, 0.3149521, 2.685774, 1, 1, 1, 1, 1,
0.9298887, 1.095725, 1.226963, 1, 1, 1, 1, 1,
0.9349905, 0.3238777, 1.976757, 1, 1, 1, 1, 1,
0.9360853, -0.8932495, 3.333261, 1, 1, 1, 1, 1,
0.9408014, -0.36432, 1.785166, 1, 1, 1, 1, 1,
0.9437132, 0.6364039, 2.161839, 1, 1, 1, 1, 1,
0.9496192, 0.6314939, -0.5629752, 1, 1, 1, 1, 1,
0.9499496, 0.6695098, -0.5261293, 1, 1, 1, 1, 1,
0.951104, 0.50402, 1.088808, 1, 1, 1, 1, 1,
0.954601, 0.3099753, 0.3588811, 1, 1, 1, 1, 1,
0.9611113, -0.1769757, 1.038957, 1, 1, 1, 1, 1,
0.9644356, -0.6546295, 3.925371, 0, 0, 1, 1, 1,
0.973103, 0.5109634, 1.602899, 1, 0, 0, 1, 1,
0.9735617, 0.8518592, 0.7778218, 1, 0, 0, 1, 1,
0.9821714, 1.599059, 2.036701, 1, 0, 0, 1, 1,
0.9876527, -0.2628401, 0.7388288, 1, 0, 0, 1, 1,
0.9888114, 1.014844, 1.852417, 1, 0, 0, 1, 1,
0.9998743, -0.4672035, 0.3205052, 0, 0, 0, 1, 1,
1.003074, -0.6568626, 2.851749, 0, 0, 0, 1, 1,
1.007748, 2.583842, 1.299798, 0, 0, 0, 1, 1,
1.017421, 1.342889, -0.8660802, 0, 0, 0, 1, 1,
1.021313, -1.72283, 2.845975, 0, 0, 0, 1, 1,
1.022614, -0.1372285, 1.105006, 0, 0, 0, 1, 1,
1.03255, -0.8161189, 0.6774087, 0, 0, 0, 1, 1,
1.034016, -0.3432668, 2.218283, 1, 1, 1, 1, 1,
1.041966, 0.6813613, -0.3903326, 1, 1, 1, 1, 1,
1.048278, 0.583322, 2.070629, 1, 1, 1, 1, 1,
1.050678, 0.822907, 2.21516, 1, 1, 1, 1, 1,
1.054429, -0.7168925, 0.139516, 1, 1, 1, 1, 1,
1.055056, 1.157779, 0.4547248, 1, 1, 1, 1, 1,
1.05863, 1.253372, -0.05791107, 1, 1, 1, 1, 1,
1.076993, 0.8099901, 0.2193719, 1, 1, 1, 1, 1,
1.077748, -0.07642376, 2.272147, 1, 1, 1, 1, 1,
1.08343, -0.7490302, 1.831064, 1, 1, 1, 1, 1,
1.086728, -0.07262874, 3.038931, 1, 1, 1, 1, 1,
1.094884, -1.807893, 1.523805, 1, 1, 1, 1, 1,
1.097416, -0.8795639, 1.697971, 1, 1, 1, 1, 1,
1.101461, 0.5084026, 0.9172479, 1, 1, 1, 1, 1,
1.109111, -1.397, 2.949269, 1, 1, 1, 1, 1,
1.109589, -0.2212086, 2.378801, 0, 0, 1, 1, 1,
1.113467, -0.02693834, 0.007274217, 1, 0, 0, 1, 1,
1.113584, 0.6688671, 1.244031, 1, 0, 0, 1, 1,
1.11616, 1.142614, 1.442443, 1, 0, 0, 1, 1,
1.122274, 0.1627868, 2.08625, 1, 0, 0, 1, 1,
1.123995, -0.4537498, 2.207299, 1, 0, 0, 1, 1,
1.125878, 1.869207, 0.4482709, 0, 0, 0, 1, 1,
1.128877, 0.615407, 1.487436, 0, 0, 0, 1, 1,
1.145259, 0.758949, 1.410992, 0, 0, 0, 1, 1,
1.151411, -0.4701596, -0.2431147, 0, 0, 0, 1, 1,
1.15512, -0.5638139, 0.4955577, 0, 0, 0, 1, 1,
1.156491, -1.38681, 3.258026, 0, 0, 0, 1, 1,
1.161763, -0.01515063, 1.946111, 0, 0, 0, 1, 1,
1.175504, -0.3870089, 1.788511, 1, 1, 1, 1, 1,
1.187907, 0.4900773, 1.558313, 1, 1, 1, 1, 1,
1.189934, -0.7644636, 3.59816, 1, 1, 1, 1, 1,
1.198819, -0.5064691, 1.929586, 1, 1, 1, 1, 1,
1.203042, 0.4647594, 2.191329, 1, 1, 1, 1, 1,
1.203776, -0.2277318, 1.082363, 1, 1, 1, 1, 1,
1.222383, -0.7645777, 1.510242, 1, 1, 1, 1, 1,
1.23229, 0.1066254, 2.47023, 1, 1, 1, 1, 1,
1.234664, 2.30612, -0.872373, 1, 1, 1, 1, 1,
1.236425, -0.5675462, 1.731739, 1, 1, 1, 1, 1,
1.244977, 2.080687, 0.4108776, 1, 1, 1, 1, 1,
1.247836, 0.6689353, 2.261318, 1, 1, 1, 1, 1,
1.252741, -1.232034, 4.114863, 1, 1, 1, 1, 1,
1.260577, 0.06577896, 1.559075, 1, 1, 1, 1, 1,
1.261474, -0.3946519, 0.8502389, 1, 1, 1, 1, 1,
1.268993, 2.976188, 0.2196323, 0, 0, 1, 1, 1,
1.281854, 2.087646, -2.132626, 1, 0, 0, 1, 1,
1.284506, -0.4225303, 3.507111, 1, 0, 0, 1, 1,
1.287543, -0.8680614, 2.101943, 1, 0, 0, 1, 1,
1.292514, -0.2331769, 4.327538, 1, 0, 0, 1, 1,
1.293618, 0.8698691, 1.125794, 1, 0, 0, 1, 1,
1.306241, -0.351865, 1.762468, 0, 0, 0, 1, 1,
1.307125, -0.5461485, 2.963978, 0, 0, 0, 1, 1,
1.307317, -0.6788837, 3.181936, 0, 0, 0, 1, 1,
1.30737, -0.2041802, 1.624086, 0, 0, 0, 1, 1,
1.308258, 0.6422707, 1.041782, 0, 0, 0, 1, 1,
1.310232, -1.360672, 4.455149, 0, 0, 0, 1, 1,
1.317335, 1.360238, 1.608306, 0, 0, 0, 1, 1,
1.323624, 0.2133425, 0.06956843, 1, 1, 1, 1, 1,
1.324641, -0.3124268, 3.478855, 1, 1, 1, 1, 1,
1.327145, -0.3873367, 2.177056, 1, 1, 1, 1, 1,
1.339323, -0.4969629, 2.589989, 1, 1, 1, 1, 1,
1.3844, 0.6052088, 3.048269, 1, 1, 1, 1, 1,
1.401123, 1.679142, -0.5608827, 1, 1, 1, 1, 1,
1.408917, -1.251251, 1.225263, 1, 1, 1, 1, 1,
1.41133, 2.365913, 1.010418, 1, 1, 1, 1, 1,
1.412947, -0.1069869, 2.486276, 1, 1, 1, 1, 1,
1.424576, -0.7211512, 2.044196, 1, 1, 1, 1, 1,
1.442953, -0.5276235, 1.728332, 1, 1, 1, 1, 1,
1.448532, 0.3039747, 4.081359, 1, 1, 1, 1, 1,
1.453358, 1.764143, 2.195841, 1, 1, 1, 1, 1,
1.455583, 1.638531, 1.248799, 1, 1, 1, 1, 1,
1.456912, -0.2109007, 1.464104, 1, 1, 1, 1, 1,
1.462295, -0.2284086, 2.662693, 0, 0, 1, 1, 1,
1.471778, -0.4357578, 0.9844008, 1, 0, 0, 1, 1,
1.501889, 0.7250608, 0.5154576, 1, 0, 0, 1, 1,
1.511569, -1.316422, 1.392044, 1, 0, 0, 1, 1,
1.513633, 0.2658786, 1.684527, 1, 0, 0, 1, 1,
1.525849, 0.8466997, 0.7249504, 1, 0, 0, 1, 1,
1.527989, -1.37064, 2.171386, 0, 0, 0, 1, 1,
1.529277, -0.4247687, 3.039934, 0, 0, 0, 1, 1,
1.529695, -1.922911, 1.978133, 0, 0, 0, 1, 1,
1.541535, 0.5678253, 0.3411678, 0, 0, 0, 1, 1,
1.550024, -0.2801196, 1.3277, 0, 0, 0, 1, 1,
1.567406, -0.07222633, 1.830955, 0, 0, 0, 1, 1,
1.569587, 0.2261964, 1.734575, 0, 0, 0, 1, 1,
1.592456, -0.007422902, -0.04216784, 1, 1, 1, 1, 1,
1.600695, 0.885034, 0.0755567, 1, 1, 1, 1, 1,
1.609164, 0.01677092, -0.1959947, 1, 1, 1, 1, 1,
1.61242, 0.84973, 1.874079, 1, 1, 1, 1, 1,
1.618769, -1.510483, -0.1131911, 1, 1, 1, 1, 1,
1.631269, 1.12347, 2.235378, 1, 1, 1, 1, 1,
1.634757, -3.243379, 2.784916, 1, 1, 1, 1, 1,
1.655328, -0.5000067, 2.285501, 1, 1, 1, 1, 1,
1.6573, 0.2285926, 1.283924, 1, 1, 1, 1, 1,
1.662968, -0.5880851, 0.5928998, 1, 1, 1, 1, 1,
1.665348, -1.464677, 2.509213, 1, 1, 1, 1, 1,
1.667873, 1.015371, 2.523272, 1, 1, 1, 1, 1,
1.66948, -0.6137064, 1.35456, 1, 1, 1, 1, 1,
1.672112, -0.4892952, 1.739348, 1, 1, 1, 1, 1,
1.673278, 0.7159567, 2.37815, 1, 1, 1, 1, 1,
1.68817, 0.1180277, 1.312715, 0, 0, 1, 1, 1,
1.69386, -0.3802626, 2.451506, 1, 0, 0, 1, 1,
1.696739, -0.685122, 1.478618, 1, 0, 0, 1, 1,
1.700598, -1.884538, 2.202719, 1, 0, 0, 1, 1,
1.702358, 0.4567596, 2.050032, 1, 0, 0, 1, 1,
1.702553, 0.6785727, 1.080089, 1, 0, 0, 1, 1,
1.702794, -0.6832693, 1.343332, 0, 0, 0, 1, 1,
1.703311, 0.09861188, 0.6751337, 0, 0, 0, 1, 1,
1.714797, 1.327656, 0.9817157, 0, 0, 0, 1, 1,
1.727838, 1.127994, 1.602962, 0, 0, 0, 1, 1,
1.731865, 0.1439057, 2.978342, 0, 0, 0, 1, 1,
1.73366, 0.902116, 0.8244829, 0, 0, 0, 1, 1,
1.739462, -0.09399319, 0.5184206, 0, 0, 0, 1, 1,
1.741949, -1.776523, 2.600583, 1, 1, 1, 1, 1,
1.742492, 0.7622448, -0.5674767, 1, 1, 1, 1, 1,
1.75388, -1.378959, 2.500299, 1, 1, 1, 1, 1,
1.790406, -0.5986083, 1.513991, 1, 1, 1, 1, 1,
1.803672, -1.318417, 1.237189, 1, 1, 1, 1, 1,
1.813262, 0.2570704, 2.375632, 1, 1, 1, 1, 1,
1.860751, 1.4129, 1.57705, 1, 1, 1, 1, 1,
1.875424, 0.5168959, -0.6031215, 1, 1, 1, 1, 1,
1.876207, -2.00025, 2.794113, 1, 1, 1, 1, 1,
1.882228, 0.5392202, 1.09925, 1, 1, 1, 1, 1,
1.886808, -0.6032891, 1.633724, 1, 1, 1, 1, 1,
1.89856, 0.9857019, 3.180728, 1, 1, 1, 1, 1,
1.911656, 0.2041075, 0.444594, 1, 1, 1, 1, 1,
1.916347, 0.03932535, 0.3555754, 1, 1, 1, 1, 1,
1.926382, 0.4899111, 1.909059, 1, 1, 1, 1, 1,
1.947356, 1.412543, 0.04924807, 0, 0, 1, 1, 1,
1.972009, 0.2609839, 1.336041, 1, 0, 0, 1, 1,
2.019476, 1.600461, 1.172311, 1, 0, 0, 1, 1,
2.032578, -0.3588324, 2.127706, 1, 0, 0, 1, 1,
2.061663, -1.927143, 3.206284, 1, 0, 0, 1, 1,
2.065739, 0.7480533, 1.290108, 1, 0, 0, 1, 1,
2.067373, -1.190735, 1.824428, 0, 0, 0, 1, 1,
2.080595, 0.1563396, 1.499585, 0, 0, 0, 1, 1,
2.095424, -0.0554037, 3.289916, 0, 0, 0, 1, 1,
2.108625, -0.3115864, 2.387635, 0, 0, 0, 1, 1,
2.13384, 0.3141437, 2.639052, 0, 0, 0, 1, 1,
2.176562, -0.1944924, 1.622375, 0, 0, 0, 1, 1,
2.189084, 1.93125, -0.2765954, 0, 0, 0, 1, 1,
2.215299, 0.4986113, 0.9495286, 1, 1, 1, 1, 1,
2.266208, 1.937822, 1.420517, 1, 1, 1, 1, 1,
2.347939, 1.378618, 0.9340791, 1, 1, 1, 1, 1,
2.386667, 0.8892059, 1.04112, 1, 1, 1, 1, 1,
2.420641, -0.3929614, 0.2564467, 1, 1, 1, 1, 1,
2.469126, 0.1362281, 0.07920026, 1, 1, 1, 1, 1,
2.669774, 0.005566131, 3.34607, 1, 1, 1, 1, 1
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
var radius = 9.088242;
var distance = 31.92207;
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
mvMatrix.translate( 0.2139186, 0.1335956, 0.1570513 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.92207);
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
