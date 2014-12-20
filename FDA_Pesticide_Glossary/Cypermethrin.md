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
-2.650921, -0.4326404, -3.141003, 1, 0, 0, 1,
-2.632987, -0.05259664, -0.6063496, 1, 0.007843138, 0, 1,
-2.544052, -0.8156852, -1.484536, 1, 0.01176471, 0, 1,
-2.541045, -0.1281056, -1.129025, 1, 0.01960784, 0, 1,
-2.494622, 0.2043448, -2.347896, 1, 0.02352941, 0, 1,
-2.37256, 0.9881048, -1.214375, 1, 0.03137255, 0, 1,
-2.349385, 0.3312277, -2.025113, 1, 0.03529412, 0, 1,
-2.344677, 0.3382391, -1.984524, 1, 0.04313726, 0, 1,
-2.303015, -0.443952, -0.9557464, 1, 0.04705882, 0, 1,
-2.234922, -0.5891985, -2.418326, 1, 0.05490196, 0, 1,
-2.193406, 1.250464, -0.3045626, 1, 0.05882353, 0, 1,
-2.175573, -0.428779, -2.080682, 1, 0.06666667, 0, 1,
-2.115312, 0.0961983, -2.476457, 1, 0.07058824, 0, 1,
-2.101764, 0.01872835, -3.239908, 1, 0.07843138, 0, 1,
-2.100294, 0.8707139, -2.332426, 1, 0.08235294, 0, 1,
-2.075325, -1.303899, -2.637343, 1, 0.09019608, 0, 1,
-2.048996, -0.8603961, -1.429133, 1, 0.09411765, 0, 1,
-2.043538, -0.5445994, -1.417291, 1, 0.1019608, 0, 1,
-2.042988, 1.086988, -2.590253, 1, 0.1098039, 0, 1,
-1.962207, 1.495148, -0.8936755, 1, 0.1137255, 0, 1,
-1.931769, 0.1396431, -2.69439, 1, 0.1215686, 0, 1,
-1.867453, -0.8109484, -2.792528, 1, 0.1254902, 0, 1,
-1.861261, 0.2875973, -1.137549, 1, 0.1333333, 0, 1,
-1.857368, 0.9113054, -2.119682, 1, 0.1372549, 0, 1,
-1.854121, 1.404463, -1.404432, 1, 0.145098, 0, 1,
-1.841894, 1.102775, -2.252914, 1, 0.1490196, 0, 1,
-1.836199, 0.2184758, -2.446601, 1, 0.1568628, 0, 1,
-1.818185, -1.07144, -2.853657, 1, 0.1607843, 0, 1,
-1.800118, 2.077164, -0.9866056, 1, 0.1686275, 0, 1,
-1.789719, 0.3966698, -1.003934, 1, 0.172549, 0, 1,
-1.783107, -0.7045937, -1.038438, 1, 0.1803922, 0, 1,
-1.776948, -0.8474523, -3.390296, 1, 0.1843137, 0, 1,
-1.77427, -0.2293731, -1.926187, 1, 0.1921569, 0, 1,
-1.771475, -0.80761, -1.055908, 1, 0.1960784, 0, 1,
-1.764972, -0.0246314, -1.065268, 1, 0.2039216, 0, 1,
-1.754135, 0.1895017, -1.930659, 1, 0.2117647, 0, 1,
-1.745243, -1.344279, -3.452583, 1, 0.2156863, 0, 1,
-1.738593, 1.102006, -0.7672482, 1, 0.2235294, 0, 1,
-1.723554, 0.1290666, -0.7898785, 1, 0.227451, 0, 1,
-1.710258, -0.344738, -3.23391, 1, 0.2352941, 0, 1,
-1.702381, -0.9596636, -2.925392, 1, 0.2392157, 0, 1,
-1.700094, -0.2399208, -1.609812, 1, 0.2470588, 0, 1,
-1.683757, -0.0641655, -1.541212, 1, 0.2509804, 0, 1,
-1.68105, 0.2869001, -2.484063, 1, 0.2588235, 0, 1,
-1.67808, 0.7477575, -0.1926104, 1, 0.2627451, 0, 1,
-1.658575, 1.327913, -2.716254, 1, 0.2705882, 0, 1,
-1.642486, 1.28904, -1.872172, 1, 0.2745098, 0, 1,
-1.635429, -1.293054, -0.9336506, 1, 0.282353, 0, 1,
-1.610109, -0.9225668, -3.190277, 1, 0.2862745, 0, 1,
-1.603937, -0.4804178, -2.146244, 1, 0.2941177, 0, 1,
-1.580967, 0.06865508, -1.151229, 1, 0.3019608, 0, 1,
-1.573511, 0.1449274, -1.288732, 1, 0.3058824, 0, 1,
-1.558851, 0.1478304, -0.2340281, 1, 0.3137255, 0, 1,
-1.553716, 0.6574872, -1.306134, 1, 0.3176471, 0, 1,
-1.537735, 0.04363381, -1.440849, 1, 0.3254902, 0, 1,
-1.536865, 0.1542709, -0.9204876, 1, 0.3294118, 0, 1,
-1.53164, 0.6485658, -1.338936, 1, 0.3372549, 0, 1,
-1.528517, 0.0008467, -1.785058, 1, 0.3411765, 0, 1,
-1.528171, 1.032485, -0.3563107, 1, 0.3490196, 0, 1,
-1.521966, 0.3038113, -1.575418, 1, 0.3529412, 0, 1,
-1.514409, -0.5498217, -0.2224714, 1, 0.3607843, 0, 1,
-1.514172, 0.1782727, -1.229577, 1, 0.3647059, 0, 1,
-1.49535, 1.270866, -1.053186, 1, 0.372549, 0, 1,
-1.478077, -0.3905775, -0.6025202, 1, 0.3764706, 0, 1,
-1.467678, 0.7183675, -0.8057674, 1, 0.3843137, 0, 1,
-1.466665, 0.4338314, -2.620796, 1, 0.3882353, 0, 1,
-1.455776, -1.007859, -2.140737, 1, 0.3960784, 0, 1,
-1.453324, -0.466249, -1.985332, 1, 0.4039216, 0, 1,
-1.443129, -1.886124, -3.466038, 1, 0.4078431, 0, 1,
-1.440834, -1.012371, -2.962297, 1, 0.4156863, 0, 1,
-1.433499, 0.2880714, -1.455508, 1, 0.4196078, 0, 1,
-1.428038, 1.388437, -0.6575714, 1, 0.427451, 0, 1,
-1.422564, 1.562323, -2.323776, 1, 0.4313726, 0, 1,
-1.413777, 0.4058796, -3.758816, 1, 0.4392157, 0, 1,
-1.400822, -0.2118158, -0.2483414, 1, 0.4431373, 0, 1,
-1.394072, 1.029911, -3.183611, 1, 0.4509804, 0, 1,
-1.390232, -1.093138, -0.7832379, 1, 0.454902, 0, 1,
-1.388494, -0.6299388, -0.909686, 1, 0.4627451, 0, 1,
-1.388139, -0.1860247, -1.090427, 1, 0.4666667, 0, 1,
-1.387856, 0.5277122, -2.21474, 1, 0.4745098, 0, 1,
-1.38569, -2.319046, -2.507382, 1, 0.4784314, 0, 1,
-1.383873, -0.3334858, -2.717877, 1, 0.4862745, 0, 1,
-1.383164, 0.4322177, -0.4554289, 1, 0.4901961, 0, 1,
-1.379442, 0.2511322, -2.14848, 1, 0.4980392, 0, 1,
-1.3763, 1.409263, -0.3901081, 1, 0.5058824, 0, 1,
-1.362591, -1.31661, -1.299525, 1, 0.509804, 0, 1,
-1.359247, -0.3378694, -1.348377, 1, 0.5176471, 0, 1,
-1.353294, -1.324418, -2.04518, 1, 0.5215687, 0, 1,
-1.349768, 1.010223, -0.3308298, 1, 0.5294118, 0, 1,
-1.344553, 1.220535, 0.5078433, 1, 0.5333334, 0, 1,
-1.316297, -2.211058, -2.67957, 1, 0.5411765, 0, 1,
-1.313028, -0.6370121, -1.699192, 1, 0.5450981, 0, 1,
-1.309442, 2.074265, -0.8870085, 1, 0.5529412, 0, 1,
-1.304166, 0.07471196, -2.895777, 1, 0.5568628, 0, 1,
-1.302401, 1.667343, 0.3653722, 1, 0.5647059, 0, 1,
-1.290951, -1.244051, -3.570127, 1, 0.5686275, 0, 1,
-1.280755, 0.05936724, 0.1415777, 1, 0.5764706, 0, 1,
-1.265745, 0.2948722, -0.6644021, 1, 0.5803922, 0, 1,
-1.261341, 0.6429511, -1.565055, 1, 0.5882353, 0, 1,
-1.245226, 1.077782, -0.5891086, 1, 0.5921569, 0, 1,
-1.24399, -0.406846, -1.703678, 1, 0.6, 0, 1,
-1.220617, 1.02142, -1.101159, 1, 0.6078432, 0, 1,
-1.220321, 0.3016259, -0.1577259, 1, 0.6117647, 0, 1,
-1.17545, -1.300436, -1.339075, 1, 0.6196079, 0, 1,
-1.173488, 0.9599195, -0.7178951, 1, 0.6235294, 0, 1,
-1.162469, -0.3326244, -0.6406777, 1, 0.6313726, 0, 1,
-1.162163, -0.5916739, -2.66508, 1, 0.6352941, 0, 1,
-1.162063, 1.806916, -1.657711, 1, 0.6431373, 0, 1,
-1.152669, 0.4012032, -0.620795, 1, 0.6470588, 0, 1,
-1.148168, 0.7652926, -0.006907255, 1, 0.654902, 0, 1,
-1.135466, -0.7167998, -2.939581, 1, 0.6588235, 0, 1,
-1.129855, -1.065019, -1.548545, 1, 0.6666667, 0, 1,
-1.122554, -0.7446507, -3.059263, 1, 0.6705883, 0, 1,
-1.120729, -0.2512192, -3.483397, 1, 0.6784314, 0, 1,
-1.118531, 0.5655535, -2.654864, 1, 0.682353, 0, 1,
-1.115386, -2.431576, -2.577584, 1, 0.6901961, 0, 1,
-1.103888, 0.4334475, -2.532597, 1, 0.6941177, 0, 1,
-1.100211, -0.4562351, -1.232205, 1, 0.7019608, 0, 1,
-1.091119, 0.9823523, -0.9122591, 1, 0.7098039, 0, 1,
-1.083801, -0.1688197, -2.256019, 1, 0.7137255, 0, 1,
-1.08144, 0.04823714, -0.7589373, 1, 0.7215686, 0, 1,
-1.078613, 1.11415, -0.05517784, 1, 0.7254902, 0, 1,
-1.074388, -1.441521, -1.484195, 1, 0.7333333, 0, 1,
-1.064319, -0.3053099, -2.174124, 1, 0.7372549, 0, 1,
-1.063112, -1.043501, -2.552633, 1, 0.7450981, 0, 1,
-1.062613, -0.2666183, -3.201256, 1, 0.7490196, 0, 1,
-1.06219, 0.810446, -2.346019, 1, 0.7568628, 0, 1,
-1.052646, 1.38904, -0.3442876, 1, 0.7607843, 0, 1,
-1.051226, -1.242575, -1.605721, 1, 0.7686275, 0, 1,
-1.050299, 1.166431, 0.2207588, 1, 0.772549, 0, 1,
-1.04349, -1.186105, -1.335418, 1, 0.7803922, 0, 1,
-1.04174, -0.258385, -3.119334, 1, 0.7843137, 0, 1,
-1.041529, -0.3445685, -1.508454, 1, 0.7921569, 0, 1,
-1.040682, -1.037829, -0.8543654, 1, 0.7960784, 0, 1,
-1.040151, -1.488038, -3.456735, 1, 0.8039216, 0, 1,
-1.038278, -0.9647369, -1.530299, 1, 0.8117647, 0, 1,
-1.031864, -0.9007813, -2.635119, 1, 0.8156863, 0, 1,
-1.020872, 0.5051688, -0.947548, 1, 0.8235294, 0, 1,
-1.016477, -1.920931, -2.366157, 1, 0.827451, 0, 1,
-1.000834, 0.9412164, -1.797986, 1, 0.8352941, 0, 1,
-0.9999933, -0.5275944, -4.460402, 1, 0.8392157, 0, 1,
-0.997646, 0.8507085, -2.872131, 1, 0.8470588, 0, 1,
-0.9971568, 1.536, -0.7334979, 1, 0.8509804, 0, 1,
-0.9968579, 0.05903042, -1.210495, 1, 0.8588235, 0, 1,
-0.9945231, 2.319319, 1.486438, 1, 0.8627451, 0, 1,
-0.9923277, 0.5444089, -1.611202, 1, 0.8705882, 0, 1,
-0.9857819, 0.9862258, -2.15221, 1, 0.8745098, 0, 1,
-0.9841207, -0.06483917, -0.5752624, 1, 0.8823529, 0, 1,
-0.9773554, -1.038238, -4.630044, 1, 0.8862745, 0, 1,
-0.976177, 1.519158, 2.248781, 1, 0.8941177, 0, 1,
-0.9748196, -1.803016, -2.016222, 1, 0.8980392, 0, 1,
-0.9731956, -0.8092059, -1.733132, 1, 0.9058824, 0, 1,
-0.9730057, 0.5962543, -2.243682, 1, 0.9137255, 0, 1,
-0.9720094, -0.08933069, -0.7121512, 1, 0.9176471, 0, 1,
-0.9719232, -0.9194552, -3.030785, 1, 0.9254902, 0, 1,
-0.9706692, -0.8268077, -2.438891, 1, 0.9294118, 0, 1,
-0.9686028, 0.4394977, -1.573068, 1, 0.9372549, 0, 1,
-0.9632202, 1.997128, -0.5011479, 1, 0.9411765, 0, 1,
-0.9557073, 0.09575673, -1.589172, 1, 0.9490196, 0, 1,
-0.9524654, -0.4338478, -2.811936, 1, 0.9529412, 0, 1,
-0.9483793, -0.4225286, -0.6062789, 1, 0.9607843, 0, 1,
-0.9455189, -0.1340486, -2.038315, 1, 0.9647059, 0, 1,
-0.9449705, -0.3374678, -1.647995, 1, 0.972549, 0, 1,
-0.9407025, 0.7305118, 1.61273, 1, 0.9764706, 0, 1,
-0.939464, 0.2977136, -1.355108, 1, 0.9843137, 0, 1,
-0.9335535, -0.8818881, -3.054724, 1, 0.9882353, 0, 1,
-0.9277231, -0.3493251, -0.4441355, 1, 0.9960784, 0, 1,
-0.9252774, -0.2396956, -1.873168, 0.9960784, 1, 0, 1,
-0.9223623, -1.326677, -1.95384, 0.9921569, 1, 0, 1,
-0.9184963, -2.006573, -2.084887, 0.9843137, 1, 0, 1,
-0.8959448, -0.06134324, 0.1403293, 0.9803922, 1, 0, 1,
-0.8930174, 0.431526, -1.121079, 0.972549, 1, 0, 1,
-0.8916904, -0.1023486, -0.564784, 0.9686275, 1, 0, 1,
-0.8818172, -1.354089, -2.45943, 0.9607843, 1, 0, 1,
-0.8722353, -0.4870237, -1.494795, 0.9568627, 1, 0, 1,
-0.8719739, 0.5964235, -1.132649, 0.9490196, 1, 0, 1,
-0.8662074, 0.4175842, -3.545697, 0.945098, 1, 0, 1,
-0.8560664, -0.2724995, -2.586255, 0.9372549, 1, 0, 1,
-0.8545745, 1.365019, -1.511705, 0.9333333, 1, 0, 1,
-0.853131, -1.746799, -4.312669, 0.9254902, 1, 0, 1,
-0.8511155, -0.02304609, -2.391102, 0.9215686, 1, 0, 1,
-0.8507825, 1.099197, -0.6653118, 0.9137255, 1, 0, 1,
-0.8468766, -0.1669326, -2.765353, 0.9098039, 1, 0, 1,
-0.8398846, -0.4408373, -0.4134054, 0.9019608, 1, 0, 1,
-0.8348975, -0.4452521, -3.674188, 0.8941177, 1, 0, 1,
-0.832865, -1.098835, -1.190342, 0.8901961, 1, 0, 1,
-0.8325054, 0.1266444, -1.305297, 0.8823529, 1, 0, 1,
-0.8321034, 1.614982, 0.2678514, 0.8784314, 1, 0, 1,
-0.831995, 0.2034575, -1.297151, 0.8705882, 1, 0, 1,
-0.8250143, 0.2203051, 0.5335339, 0.8666667, 1, 0, 1,
-0.8202469, 0.7225518, -1.441391, 0.8588235, 1, 0, 1,
-0.8177873, 0.09082515, -1.71205, 0.854902, 1, 0, 1,
-0.8150305, -0.4558783, -2.652253, 0.8470588, 1, 0, 1,
-0.8148056, -1.160882, -1.683417, 0.8431373, 1, 0, 1,
-0.805568, -0.8150269, -1.898281, 0.8352941, 1, 0, 1,
-0.8000637, -0.4714035, -3.355366, 0.8313726, 1, 0, 1,
-0.792034, -0.6951753, -0.6401894, 0.8235294, 1, 0, 1,
-0.7841616, -1.032617, -1.654484, 0.8196079, 1, 0, 1,
-0.7792289, 0.3888316, -1.990837, 0.8117647, 1, 0, 1,
-0.7745721, 0.5967383, -2.245915, 0.8078431, 1, 0, 1,
-0.7711348, 0.1207255, -1.988782, 0.8, 1, 0, 1,
-0.7699032, 0.9597799, 0.2429034, 0.7921569, 1, 0, 1,
-0.7658798, 0.2617051, -1.857409, 0.7882353, 1, 0, 1,
-0.7644994, -0.3097918, -2.034727, 0.7803922, 1, 0, 1,
-0.7578914, 0.931866, -0.8034703, 0.7764706, 1, 0, 1,
-0.7575461, -0.3532725, -3.847982, 0.7686275, 1, 0, 1,
-0.7542028, 2.272184, 0.8386683, 0.7647059, 1, 0, 1,
-0.7493866, -0.6428483, -3.246922, 0.7568628, 1, 0, 1,
-0.7467678, -1.770281, -3.647959, 0.7529412, 1, 0, 1,
-0.7406154, -0.1193415, -0.9165045, 0.7450981, 1, 0, 1,
-0.7366743, 0.1626476, -0.143842, 0.7411765, 1, 0, 1,
-0.7362081, 0.7327237, 0.06249307, 0.7333333, 1, 0, 1,
-0.7343414, 0.3179127, -1.063932, 0.7294118, 1, 0, 1,
-0.7311217, 2.54269, -0.7492138, 0.7215686, 1, 0, 1,
-0.7283534, -0.6577018, -2.513389, 0.7176471, 1, 0, 1,
-0.7270828, 0.8046137, -1.27843, 0.7098039, 1, 0, 1,
-0.7176762, -0.04833313, -1.906096, 0.7058824, 1, 0, 1,
-0.7169696, 0.2919089, -1.414247, 0.6980392, 1, 0, 1,
-0.7055006, 0.526499, -0.9015798, 0.6901961, 1, 0, 1,
-0.7049794, -1.003083, -2.643771, 0.6862745, 1, 0, 1,
-0.704563, -0.05925633, -2.475334, 0.6784314, 1, 0, 1,
-0.6947849, 0.8154679, 0.3605687, 0.6745098, 1, 0, 1,
-0.6937063, -0.03296217, -1.255572, 0.6666667, 1, 0, 1,
-0.691584, -0.3424142, -0.7116431, 0.6627451, 1, 0, 1,
-0.6851172, -1.381983, -1.847738, 0.654902, 1, 0, 1,
-0.681072, 1.104795, -0.4684671, 0.6509804, 1, 0, 1,
-0.6740927, -0.7027954, -2.515945, 0.6431373, 1, 0, 1,
-0.6729347, -2.166175, -3.803734, 0.6392157, 1, 0, 1,
-0.6682881, 0.9525957, -0.4911673, 0.6313726, 1, 0, 1,
-0.6669498, -1.106626, -0.5045084, 0.627451, 1, 0, 1,
-0.6598774, 0.8211243, -0.2671106, 0.6196079, 1, 0, 1,
-0.6545997, 0.5715216, -0.8259018, 0.6156863, 1, 0, 1,
-0.6545276, -0.1070945, -1.570283, 0.6078432, 1, 0, 1,
-0.650799, -1.674751, -1.367426, 0.6039216, 1, 0, 1,
-0.6492525, 1.164698, -0.9852832, 0.5960785, 1, 0, 1,
-0.6483958, -0.8898352, -2.421569, 0.5882353, 1, 0, 1,
-0.6459585, 0.5216568, -1.264889, 0.5843138, 1, 0, 1,
-0.6418195, 1.056658, 0.02601452, 0.5764706, 1, 0, 1,
-0.6417931, 3.118437, -0.947262, 0.572549, 1, 0, 1,
-0.639554, 0.7114524, -1.835997, 0.5647059, 1, 0, 1,
-0.6390802, -0.4140029, -0.9662082, 0.5607843, 1, 0, 1,
-0.6351978, -0.5321691, -2.895686, 0.5529412, 1, 0, 1,
-0.632687, -1.972771, -3.228316, 0.5490196, 1, 0, 1,
-0.6265886, -0.7603843, -3.55245, 0.5411765, 1, 0, 1,
-0.6258048, -0.170064, -1.709623, 0.5372549, 1, 0, 1,
-0.6256768, 0.3382252, -1.134312, 0.5294118, 1, 0, 1,
-0.6218462, 0.5100898, 0.8639, 0.5254902, 1, 0, 1,
-0.6179658, -0.2472896, -0.9674354, 0.5176471, 1, 0, 1,
-0.6178167, 0.2435047, -0.8499894, 0.5137255, 1, 0, 1,
-0.6160571, -0.007093891, -2.698114, 0.5058824, 1, 0, 1,
-0.5962939, 0.1793718, -1.644497, 0.5019608, 1, 0, 1,
-0.5906699, -2.346713, 0.186017, 0.4941176, 1, 0, 1,
-0.5899783, 0.1173422, -1.565858, 0.4862745, 1, 0, 1,
-0.5882856, 0.95917, -2.706363, 0.4823529, 1, 0, 1,
-0.5864148, -1.848147, -2.822953, 0.4745098, 1, 0, 1,
-0.5852503, 0.486682, -2.637118, 0.4705882, 1, 0, 1,
-0.5844474, -0.05275516, -1.247039, 0.4627451, 1, 0, 1,
-0.5827051, -0.4412407, -2.073234, 0.4588235, 1, 0, 1,
-0.5795078, 0.9830646, 0.2941349, 0.4509804, 1, 0, 1,
-0.5775377, -0.4856662, -2.100048, 0.4470588, 1, 0, 1,
-0.577382, 0.2841392, -1.383682, 0.4392157, 1, 0, 1,
-0.5773097, 0.3377025, -3.099801, 0.4352941, 1, 0, 1,
-0.5698223, -2.142383, -1.492586, 0.427451, 1, 0, 1,
-0.5690221, -0.1245313, -3.197874, 0.4235294, 1, 0, 1,
-0.5684351, 0.4966804, -1.806291, 0.4156863, 1, 0, 1,
-0.5679904, -0.3765654, -2.627604, 0.4117647, 1, 0, 1,
-0.5676708, 0.8477228, -0.4485573, 0.4039216, 1, 0, 1,
-0.5660635, -2.094519, -3.400545, 0.3960784, 1, 0, 1,
-0.5594321, -0.4036911, -1.303205, 0.3921569, 1, 0, 1,
-0.5515557, 0.9461777, 0.1026932, 0.3843137, 1, 0, 1,
-0.5513361, -0.02078497, -1.410411, 0.3803922, 1, 0, 1,
-0.5466976, 2.004059, 0.4573663, 0.372549, 1, 0, 1,
-0.5463969, 2.485574, 0.3746751, 0.3686275, 1, 0, 1,
-0.5454302, 0.5800715, -0.8683572, 0.3607843, 1, 0, 1,
-0.5381452, -0.3597685, -2.589387, 0.3568628, 1, 0, 1,
-0.536157, -0.7612954, -3.736567, 0.3490196, 1, 0, 1,
-0.5346278, -0.6663493, -3.652346, 0.345098, 1, 0, 1,
-0.5195833, 0.8366274, 0.5499952, 0.3372549, 1, 0, 1,
-0.5188037, 0.9231983, 0.1094953, 0.3333333, 1, 0, 1,
-0.5161895, -0.03467526, -2.231132, 0.3254902, 1, 0, 1,
-0.515674, -0.8881968, -2.570813, 0.3215686, 1, 0, 1,
-0.5117829, 1.206691, -1.488296, 0.3137255, 1, 0, 1,
-0.5074127, 0.5155705, 0.742202, 0.3098039, 1, 0, 1,
-0.5000688, 0.1917203, -1.27015, 0.3019608, 1, 0, 1,
-0.495041, 2.029624, 0.7171134, 0.2941177, 1, 0, 1,
-0.4803968, -0.07239882, -1.085522, 0.2901961, 1, 0, 1,
-0.4738279, 2.212484, -0.342121, 0.282353, 1, 0, 1,
-0.4690336, 1.625046, 0.8532231, 0.2784314, 1, 0, 1,
-0.4633943, -0.8622206, -2.506886, 0.2705882, 1, 0, 1,
-0.4561904, -1.019262, -2.458896, 0.2666667, 1, 0, 1,
-0.4541889, -2.180611, -3.797659, 0.2588235, 1, 0, 1,
-0.4515577, 0.6654515, 0.3045986, 0.254902, 1, 0, 1,
-0.4506364, -0.1128438, -1.764542, 0.2470588, 1, 0, 1,
-0.4447805, -0.9601645, -2.345827, 0.2431373, 1, 0, 1,
-0.4428439, -0.1311496, -0.6841584, 0.2352941, 1, 0, 1,
-0.4427474, -1.862125, -4.998978, 0.2313726, 1, 0, 1,
-0.4333078, 1.150087, 0.331203, 0.2235294, 1, 0, 1,
-0.4330448, -1.528237, -3.681069, 0.2196078, 1, 0, 1,
-0.4327303, 0.7383088, 0.8919054, 0.2117647, 1, 0, 1,
-0.4307691, -0.1696693, -1.02416, 0.2078431, 1, 0, 1,
-0.4284436, -1.160388, -2.827166, 0.2, 1, 0, 1,
-0.4266832, -0.7341021, -3.020492, 0.1921569, 1, 0, 1,
-0.4241772, 1.454781, -0.663625, 0.1882353, 1, 0, 1,
-0.4147478, 0.4507399, -0.01274549, 0.1803922, 1, 0, 1,
-0.411165, -0.4731707, -4.735961, 0.1764706, 1, 0, 1,
-0.408283, -0.9207755, -2.907989, 0.1686275, 1, 0, 1,
-0.4077115, 0.8110065, -0.486906, 0.1647059, 1, 0, 1,
-0.4067263, 0.8301465, -0.2276232, 0.1568628, 1, 0, 1,
-0.4015645, 0.5026466, -0.438225, 0.1529412, 1, 0, 1,
-0.4008108, -0.4620936, -2.05844, 0.145098, 1, 0, 1,
-0.4006393, -0.07569951, -1.780208, 0.1411765, 1, 0, 1,
-0.4002654, -0.03477794, -0.05807345, 0.1333333, 1, 0, 1,
-0.3928218, 0.3547567, -1.625613, 0.1294118, 1, 0, 1,
-0.3915741, -0.4186743, -2.705455, 0.1215686, 1, 0, 1,
-0.3904353, 0.7510381, 1.100207, 0.1176471, 1, 0, 1,
-0.3900609, -0.2972053, -2.465383, 0.1098039, 1, 0, 1,
-0.3882624, -0.1481648, -1.984415, 0.1058824, 1, 0, 1,
-0.3846046, -1.285077, -2.872063, 0.09803922, 1, 0, 1,
-0.3839691, -1.044106, -3.111378, 0.09019608, 1, 0, 1,
-0.3810144, 0.3605555, -1.117279, 0.08627451, 1, 0, 1,
-0.3766759, 1.398157, -0.8035221, 0.07843138, 1, 0, 1,
-0.3734621, 1.078882, -1.580095, 0.07450981, 1, 0, 1,
-0.3695186, -0.01927773, -2.65474, 0.06666667, 1, 0, 1,
-0.366439, 0.1089276, -2.243363, 0.0627451, 1, 0, 1,
-0.3657213, -0.4762117, -2.721244, 0.05490196, 1, 0, 1,
-0.3644414, 1.863094, 0.4173004, 0.05098039, 1, 0, 1,
-0.3596788, 0.3002784, 0.001667391, 0.04313726, 1, 0, 1,
-0.3594694, 0.02223518, -1.049872, 0.03921569, 1, 0, 1,
-0.3591267, -0.427372, -1.368283, 0.03137255, 1, 0, 1,
-0.3588766, -0.6286823, -3.263536, 0.02745098, 1, 0, 1,
-0.355599, -0.8205586, -1.646463, 0.01960784, 1, 0, 1,
-0.354389, 0.6771716, -1.049103, 0.01568628, 1, 0, 1,
-0.3495962, 0.163494, -0.9273716, 0.007843138, 1, 0, 1,
-0.3493598, -0.6752052, -3.264886, 0.003921569, 1, 0, 1,
-0.3478338, -1.891816, -2.774485, 0, 1, 0.003921569, 1,
-0.3349756, 0.3220207, 0.6360993, 0, 1, 0.01176471, 1,
-0.3328795, 1.158721, -0.8412583, 0, 1, 0.01568628, 1,
-0.3318866, -0.4337067, -2.429333, 0, 1, 0.02352941, 1,
-0.3305689, -0.2591242, -2.539445, 0, 1, 0.02745098, 1,
-0.3276082, -2.337436, -2.43369, 0, 1, 0.03529412, 1,
-0.3186648, 1.235375, -2.364972, 0, 1, 0.03921569, 1,
-0.3172256, -0.3089667, -2.291306, 0, 1, 0.04705882, 1,
-0.3146448, -0.3743995, -3.3653, 0, 1, 0.05098039, 1,
-0.3131264, 0.334409, -1.887428, 0, 1, 0.05882353, 1,
-0.3121069, 0.2082146, -2.063594, 0, 1, 0.0627451, 1,
-0.308884, 0.3443483, -1.772976, 0, 1, 0.07058824, 1,
-0.3013143, -0.4334239, -1.334422, 0, 1, 0.07450981, 1,
-0.2997314, -0.7822344, -2.430953, 0, 1, 0.08235294, 1,
-0.2973695, -0.6660914, -2.095572, 0, 1, 0.08627451, 1,
-0.2927989, 0.1698551, -2.20788, 0, 1, 0.09411765, 1,
-0.2904446, 1.539085, -0.7771696, 0, 1, 0.1019608, 1,
-0.2834491, 0.885601, -0.9020047, 0, 1, 0.1058824, 1,
-0.282482, -0.2007483, -2.050505, 0, 1, 0.1137255, 1,
-0.2818487, -0.5461301, -2.701185, 0, 1, 0.1176471, 1,
-0.279755, 0.5279175, -0.636906, 0, 1, 0.1254902, 1,
-0.2764467, 0.5105855, -1.570923, 0, 1, 0.1294118, 1,
-0.2735239, -1.666189, -3.406076, 0, 1, 0.1372549, 1,
-0.2734413, 0.4239574, -0.3159394, 0, 1, 0.1411765, 1,
-0.2681861, -0.7424386, -3.401803, 0, 1, 0.1490196, 1,
-0.2677728, 0.0376619, -0.6892878, 0, 1, 0.1529412, 1,
-0.267305, -1.107295, -2.274364, 0, 1, 0.1607843, 1,
-0.2668751, 1.278957, -1.216753, 0, 1, 0.1647059, 1,
-0.2661636, 0.1300575, 0.613588, 0, 1, 0.172549, 1,
-0.2656586, 0.4296233, 1.251305, 0, 1, 0.1764706, 1,
-0.2641173, -1.398509, -2.354789, 0, 1, 0.1843137, 1,
-0.2639849, -0.3170902, -3.244799, 0, 1, 0.1882353, 1,
-0.263317, -1.666773, -3.340019, 0, 1, 0.1960784, 1,
-0.2585174, -0.4611758, -3.886293, 0, 1, 0.2039216, 1,
-0.255263, -1.698898, -1.190215, 0, 1, 0.2078431, 1,
-0.255261, -1.836362, -3.012344, 0, 1, 0.2156863, 1,
-0.2511241, -0.02334963, -3.551379, 0, 1, 0.2196078, 1,
-0.2455155, -0.3564566, -0.8499555, 0, 1, 0.227451, 1,
-0.2424735, 0.4701802, 0.3745056, 0, 1, 0.2313726, 1,
-0.2397026, 0.2913244, -1.039992, 0, 1, 0.2392157, 1,
-0.2350591, 0.6628845, 2.000886, 0, 1, 0.2431373, 1,
-0.234672, 0.3282282, -0.391009, 0, 1, 0.2509804, 1,
-0.2324145, 0.0933739, -1.448435, 0, 1, 0.254902, 1,
-0.2323934, -1.214352, -3.33547, 0, 1, 0.2627451, 1,
-0.2289415, 1.638927, -0.2445209, 0, 1, 0.2666667, 1,
-0.2267377, -0.6138378, -1.343035, 0, 1, 0.2745098, 1,
-0.2252365, 0.9644688, 0.05776724, 0, 1, 0.2784314, 1,
-0.2150817, -2.639644, -3.087165, 0, 1, 0.2862745, 1,
-0.2130545, -0.3342771, -4.003065, 0, 1, 0.2901961, 1,
-0.2120628, -1.032038, -3.469364, 0, 1, 0.2980392, 1,
-0.2082124, 0.9719381, -0.6892492, 0, 1, 0.3058824, 1,
-0.2080737, -0.4491407, -5.60733, 0, 1, 0.3098039, 1,
-0.2031451, 0.3824754, -0.120262, 0, 1, 0.3176471, 1,
-0.2021201, 1.200462, -0.04206178, 0, 1, 0.3215686, 1,
-0.1987678, 0.04958114, -1.790452, 0, 1, 0.3294118, 1,
-0.1986371, -1.314974, -3.258779, 0, 1, 0.3333333, 1,
-0.1978284, 0.105564, -1.468938, 0, 1, 0.3411765, 1,
-0.1935495, 0.1926675, -0.1918886, 0, 1, 0.345098, 1,
-0.1853326, -0.09637627, -1.840185, 0, 1, 0.3529412, 1,
-0.1841328, -0.8349813, -3.297808, 0, 1, 0.3568628, 1,
-0.18261, 0.7497488, 0.4429815, 0, 1, 0.3647059, 1,
-0.1818128, 1.406086, -0.9347757, 0, 1, 0.3686275, 1,
-0.180359, -1.442544, -3.686682, 0, 1, 0.3764706, 1,
-0.1615325, -2.300288, -2.371836, 0, 1, 0.3803922, 1,
-0.157359, 2.191906, -0.4379799, 0, 1, 0.3882353, 1,
-0.1570083, 1.470246, -0.04945887, 0, 1, 0.3921569, 1,
-0.1531481, 0.9342337, 0.9555315, 0, 1, 0.4, 1,
-0.1518256, -0.5122627, -1.490419, 0, 1, 0.4078431, 1,
-0.1478214, 0.4160596, -0.1041609, 0, 1, 0.4117647, 1,
-0.1463725, 0.6691938, 1.043378, 0, 1, 0.4196078, 1,
-0.1456137, 1.376495, -0.1999594, 0, 1, 0.4235294, 1,
-0.1428005, 0.4589263, -0.198982, 0, 1, 0.4313726, 1,
-0.1425659, -0.6790803, -2.021361, 0, 1, 0.4352941, 1,
-0.1391624, 0.7328559, 1.170924, 0, 1, 0.4431373, 1,
-0.1384719, 0.2734823, -1.197532, 0, 1, 0.4470588, 1,
-0.1361205, 0.09980218, -1.745664, 0, 1, 0.454902, 1,
-0.1351765, 0.7373609, -0.1509822, 0, 1, 0.4588235, 1,
-0.132634, -1.046877, -3.388865, 0, 1, 0.4666667, 1,
-0.1306471, -0.2921936, -2.555306, 0, 1, 0.4705882, 1,
-0.1289491, -1.563495, -3.462384, 0, 1, 0.4784314, 1,
-0.1285098, -0.1048762, -1.948088, 0, 1, 0.4823529, 1,
-0.1238708, -0.8930678, -3.529761, 0, 1, 0.4901961, 1,
-0.1195711, -0.06670526, -0.9829283, 0, 1, 0.4941176, 1,
-0.1178522, 0.05897116, -1.615809, 0, 1, 0.5019608, 1,
-0.116564, -0.8948715, -0.9790223, 0, 1, 0.509804, 1,
-0.1144801, 1.962889, -0.7451805, 0, 1, 0.5137255, 1,
-0.1106569, -1.034929, -2.655539, 0, 1, 0.5215687, 1,
-0.09860203, 0.8545998, -0.3248996, 0, 1, 0.5254902, 1,
-0.0977409, 0.7808808, -0.9189305, 0, 1, 0.5333334, 1,
-0.09748248, -1.136951, -2.428818, 0, 1, 0.5372549, 1,
-0.09272918, 1.365947, -0.1027539, 0, 1, 0.5450981, 1,
-0.0916606, -0.06339739, -1.729696, 0, 1, 0.5490196, 1,
-0.08795337, -1.574876, -3.051187, 0, 1, 0.5568628, 1,
-0.08218978, -0.7404122, -4.186272, 0, 1, 0.5607843, 1,
-0.07758217, 1.920133, -1.844619, 0, 1, 0.5686275, 1,
-0.07408129, -0.7882395, -2.544052, 0, 1, 0.572549, 1,
-0.07223735, 1.519172, 0.8577017, 0, 1, 0.5803922, 1,
-0.06735357, -1.612943, -3.196681, 0, 1, 0.5843138, 1,
-0.06596633, 1.445414, -0.2732618, 0, 1, 0.5921569, 1,
-0.06468906, 1.539331, -0.1858574, 0, 1, 0.5960785, 1,
-0.06249537, 0.1169923, 0.3363611, 0, 1, 0.6039216, 1,
-0.06087847, 0.5934018, -0.05044072, 0, 1, 0.6117647, 1,
-0.06020047, -0.5638492, -2.483641, 0, 1, 0.6156863, 1,
-0.05595856, 0.6471722, 0.8652061, 0, 1, 0.6235294, 1,
-0.05394262, -0.0157655, -0.8985594, 0, 1, 0.627451, 1,
-0.05132772, 0.2511226, -1.626533, 0, 1, 0.6352941, 1,
-0.05024754, 0.01915484, -2.333533, 0, 1, 0.6392157, 1,
-0.04735707, 0.5331219, 1.899981, 0, 1, 0.6470588, 1,
-0.04673534, 0.9972755, -1.72231, 0, 1, 0.6509804, 1,
-0.04359124, -0.1452141, -2.259348, 0, 1, 0.6588235, 1,
-0.03726958, 1.480061, -0.9989226, 0, 1, 0.6627451, 1,
-0.03711445, -0.2518556, -4.21745, 0, 1, 0.6705883, 1,
-0.03273267, 0.305939, 1.0408, 0, 1, 0.6745098, 1,
-0.03220326, -0.06475433, -3.267963, 0, 1, 0.682353, 1,
-0.02951799, 2.52522, -0.5543682, 0, 1, 0.6862745, 1,
-0.02865247, -0.1238132, -1.714612, 0, 1, 0.6941177, 1,
-0.02478493, -1.399591, -1.392493, 0, 1, 0.7019608, 1,
-0.02328503, -0.8203905, -3.675321, 0, 1, 0.7058824, 1,
-0.02172416, 0.5825641, -1.052094, 0, 1, 0.7137255, 1,
-0.02083517, 0.8083224, 0.4577243, 0, 1, 0.7176471, 1,
-0.02063369, 0.003291785, -1.864863, 0, 1, 0.7254902, 1,
-0.01977308, 0.9883278, -0.1864857, 0, 1, 0.7294118, 1,
-0.01688255, 0.6154518, 1.119607, 0, 1, 0.7372549, 1,
-0.01674235, -0.3835781, -1.970622, 0, 1, 0.7411765, 1,
-0.0142374, -1.324034, -2.908923, 0, 1, 0.7490196, 1,
-0.01242037, -0.07711923, -2.666927, 0, 1, 0.7529412, 1,
-0.008657404, 1.346962, 0.006072524, 0, 1, 0.7607843, 1,
-0.00822081, 1.412853, -0.5393569, 0, 1, 0.7647059, 1,
-0.007736906, -0.2941563, -2.687089, 0, 1, 0.772549, 1,
-0.006117603, 0.4289783, -0.6388984, 0, 1, 0.7764706, 1,
-0.004354939, -1.395925, -3.308112, 0, 1, 0.7843137, 1,
-0.003927718, -0.824131, -0.7553767, 0, 1, 0.7882353, 1,
-0.003619041, -1.452507, -4.837392, 0, 1, 0.7960784, 1,
-0.001223562, 1.282877, 1.154224, 0, 1, 0.8039216, 1,
-0.0003839263, 0.4245932, 0.04037086, 0, 1, 0.8078431, 1,
0.0008237471, -0.575752, 5.233359, 0, 1, 0.8156863, 1,
0.0009688313, 0.04666767, 0.119583, 0, 1, 0.8196079, 1,
0.001088052, 1.810197, -0.09397563, 0, 1, 0.827451, 1,
0.001644675, 0.7022743, 1.274201, 0, 1, 0.8313726, 1,
0.003563985, -0.3993376, 5.514354, 0, 1, 0.8392157, 1,
0.004216169, 0.1730354, 0.9931874, 0, 1, 0.8431373, 1,
0.004783196, -1.434184, 2.607913, 0, 1, 0.8509804, 1,
0.005425445, 0.5763031, 1.909382, 0, 1, 0.854902, 1,
0.006373172, 0.7729074, 0.8688869, 0, 1, 0.8627451, 1,
0.006456167, 0.7516624, 1.473366, 0, 1, 0.8666667, 1,
0.008266938, -0.01124475, 1.897102, 0, 1, 0.8745098, 1,
0.009759381, 1.402611, -0.111132, 0, 1, 0.8784314, 1,
0.01061167, -0.3863431, 3.819999, 0, 1, 0.8862745, 1,
0.01124709, 1.397769, -0.2552259, 0, 1, 0.8901961, 1,
0.012916, 0.2475105, 0.04917794, 0, 1, 0.8980392, 1,
0.01453037, 0.9595794, 1.194215, 0, 1, 0.9058824, 1,
0.01904428, 0.9541083, 1.913493, 0, 1, 0.9098039, 1,
0.0271496, -0.1355461, 3.496971, 0, 1, 0.9176471, 1,
0.02911565, 1.657047, -0.8597803, 0, 1, 0.9215686, 1,
0.03123481, 0.9520023, 1.07421, 0, 1, 0.9294118, 1,
0.0362118, 0.9039281, 0.2760323, 0, 1, 0.9333333, 1,
0.03646735, -3.055065, 4.316487, 0, 1, 0.9411765, 1,
0.04924664, 0.3618091, 0.6418729, 0, 1, 0.945098, 1,
0.04995699, -0.4740768, 3.274481, 0, 1, 0.9529412, 1,
0.05083048, -0.7921922, 4.232113, 0, 1, 0.9568627, 1,
0.05262787, 1.924232, -0.3912227, 0, 1, 0.9647059, 1,
0.05583193, 1.617208, 1.277159, 0, 1, 0.9686275, 1,
0.05731446, 0.3180895, -0.9515766, 0, 1, 0.9764706, 1,
0.05970667, -0.363305, 1.829505, 0, 1, 0.9803922, 1,
0.06488538, 0.04975842, 1.576051, 0, 1, 0.9882353, 1,
0.06749281, -1.159437, 4.814938, 0, 1, 0.9921569, 1,
0.07347425, -0.04466665, 2.021195, 0, 1, 1, 1,
0.07666828, 0.1458128, -0.3905245, 0, 0.9921569, 1, 1,
0.07993135, 0.7170734, 1.380105, 0, 0.9882353, 1, 1,
0.08108544, -1.813971, 4.012131, 0, 0.9803922, 1, 1,
0.08131456, 0.4915333, -0.6947, 0, 0.9764706, 1, 1,
0.08170246, 0.6218727, 0.8251271, 0, 0.9686275, 1, 1,
0.0837883, -0.2053393, 3.860058, 0, 0.9647059, 1, 1,
0.08685784, 1.330295, 0.6526964, 0, 0.9568627, 1, 1,
0.08753407, -0.07498248, 1.457445, 0, 0.9529412, 1, 1,
0.09011757, -0.06040489, 1.195974, 0, 0.945098, 1, 1,
0.09422564, 0.5169084, -0.1602377, 0, 0.9411765, 1, 1,
0.09676075, -1.000351, 5.339482, 0, 0.9333333, 1, 1,
0.09691255, 0.1105235, 1.757196, 0, 0.9294118, 1, 1,
0.09759968, -1.885463, 1.659923, 0, 0.9215686, 1, 1,
0.107868, -0.7740119, 3.82844, 0, 0.9176471, 1, 1,
0.1081925, -0.5998786, 3.581526, 0, 0.9098039, 1, 1,
0.1085185, 1.822642, 1.257223, 0, 0.9058824, 1, 1,
0.1160309, 0.6890383, 1.495858, 0, 0.8980392, 1, 1,
0.1161991, -0.6732249, 2.784642, 0, 0.8901961, 1, 1,
0.1172933, -3.268954, 3.374194, 0, 0.8862745, 1, 1,
0.1174472, -0.02564333, 1.531481, 0, 0.8784314, 1, 1,
0.117644, 0.5758209, -0.08494072, 0, 0.8745098, 1, 1,
0.1213507, -0.2296793, 4.076001, 0, 0.8666667, 1, 1,
0.1224737, 0.3285538, -0.001933966, 0, 0.8627451, 1, 1,
0.1227818, 0.6056755, 0.3747107, 0, 0.854902, 1, 1,
0.1274487, 0.9708188, 0.3179778, 0, 0.8509804, 1, 1,
0.1285961, -1.014886, 1.666428, 0, 0.8431373, 1, 1,
0.1288731, 2.385397, 0.4375395, 0, 0.8392157, 1, 1,
0.1290672, -0.788798, 3.803462, 0, 0.8313726, 1, 1,
0.129843, -0.8281839, 5.150668, 0, 0.827451, 1, 1,
0.1343282, -0.5336347, 1.632697, 0, 0.8196079, 1, 1,
0.1389739, -1.449658, 3.778908, 0, 0.8156863, 1, 1,
0.1423097, -0.3178923, 1.245503, 0, 0.8078431, 1, 1,
0.1478096, -0.4152795, 1.28169, 0, 0.8039216, 1, 1,
0.1493892, 1.074853, -0.5272746, 0, 0.7960784, 1, 1,
0.1510071, 0.4520833, 1.13687, 0, 0.7882353, 1, 1,
0.1527255, -0.1154322, 2.077828, 0, 0.7843137, 1, 1,
0.1550227, 0.3978269, 1.221887, 0, 0.7764706, 1, 1,
0.1583735, 0.4983163, 0.4071888, 0, 0.772549, 1, 1,
0.1598265, 0.2780082, -0.02601689, 0, 0.7647059, 1, 1,
0.1600545, -0.6848257, 3.939826, 0, 0.7607843, 1, 1,
0.1603138, -1.9369, 4.027927, 0, 0.7529412, 1, 1,
0.1615469, -0.7106469, 4.319118, 0, 0.7490196, 1, 1,
0.1615818, 1.193575, 2.15337, 0, 0.7411765, 1, 1,
0.1630152, 1.143294, -0.547893, 0, 0.7372549, 1, 1,
0.1646669, 0.3531687, 1.193026, 0, 0.7294118, 1, 1,
0.1702023, -0.2332712, 1.770152, 0, 0.7254902, 1, 1,
0.1707746, -0.06137078, 3.092745, 0, 0.7176471, 1, 1,
0.1723927, -0.1997509, 2.770514, 0, 0.7137255, 1, 1,
0.1755974, -1.294014, 2.905285, 0, 0.7058824, 1, 1,
0.1780621, 0.5781698, 1.559021, 0, 0.6980392, 1, 1,
0.1823644, -1.311494, 2.527376, 0, 0.6941177, 1, 1,
0.1845102, 0.2032449, -1.297083, 0, 0.6862745, 1, 1,
0.1853712, 0.1523353, -0.2306829, 0, 0.682353, 1, 1,
0.1943538, -0.4737699, 4.804638, 0, 0.6745098, 1, 1,
0.1964827, 1.182813, 1.259572, 0, 0.6705883, 1, 1,
0.1982701, -0.2289083, 4.162024, 0, 0.6627451, 1, 1,
0.1993898, 1.53382, 1.40939, 0, 0.6588235, 1, 1,
0.1999951, 0.1222384, 1.126341, 0, 0.6509804, 1, 1,
0.2012447, 0.784247, 0.06322429, 0, 0.6470588, 1, 1,
0.2023326, -0.3548613, 3.122455, 0, 0.6392157, 1, 1,
0.2124075, -0.2825141, 3.063466, 0, 0.6352941, 1, 1,
0.213677, -1.229816, 4.508607, 0, 0.627451, 1, 1,
0.2154257, 1.489075, 0.5795517, 0, 0.6235294, 1, 1,
0.2159309, 0.6349198, 0.5567346, 0, 0.6156863, 1, 1,
0.2160225, 0.8562072, 0.9963101, 0, 0.6117647, 1, 1,
0.2224395, -0.2274256, 3.922492, 0, 0.6039216, 1, 1,
0.2280579, 0.4092629, 0.09951796, 0, 0.5960785, 1, 1,
0.2307558, 0.312912, 0.9720476, 0, 0.5921569, 1, 1,
0.2310914, 0.5429667, 2.102032, 0, 0.5843138, 1, 1,
0.2313935, -0.4784402, 2.239552, 0, 0.5803922, 1, 1,
0.2316482, 1.783687, 0.8278584, 0, 0.572549, 1, 1,
0.2317441, 0.6796009, 0.1801751, 0, 0.5686275, 1, 1,
0.233369, 1.209785, 0.2534761, 0, 0.5607843, 1, 1,
0.2343391, -1.609984, 2.274952, 0, 0.5568628, 1, 1,
0.2366154, 1.141223, -0.6035591, 0, 0.5490196, 1, 1,
0.2388287, -0.951254, 2.79879, 0, 0.5450981, 1, 1,
0.239586, -1.097175, 4.941709, 0, 0.5372549, 1, 1,
0.2458042, 0.0347087, 2.237261, 0, 0.5333334, 1, 1,
0.2502282, 0.08385105, 0.6496659, 0, 0.5254902, 1, 1,
0.2533242, -1.050262, 1.842597, 0, 0.5215687, 1, 1,
0.2558262, 0.2307895, 1.145094, 0, 0.5137255, 1, 1,
0.2574455, -0.2875338, 1.254657, 0, 0.509804, 1, 1,
0.2575202, 1.058576, -0.8589106, 0, 0.5019608, 1, 1,
0.2599936, -0.6913263, 0.9042534, 0, 0.4941176, 1, 1,
0.2617419, -0.6569738, 2.661963, 0, 0.4901961, 1, 1,
0.2658933, -0.3391808, 2.795853, 0, 0.4823529, 1, 1,
0.2737241, 0.2294939, 2.396356, 0, 0.4784314, 1, 1,
0.2748437, -1.422701, 3.310594, 0, 0.4705882, 1, 1,
0.2760545, -0.7154472, 3.104951, 0, 0.4666667, 1, 1,
0.2767152, 1.526517, 0.2765452, 0, 0.4588235, 1, 1,
0.27786, -0.4172661, 4.09987, 0, 0.454902, 1, 1,
0.2883295, -1.126743, 2.752739, 0, 0.4470588, 1, 1,
0.2892579, 0.6815212, 0.2077241, 0, 0.4431373, 1, 1,
0.2904169, -0.1434636, 3.095095, 0, 0.4352941, 1, 1,
0.2904419, -0.5381856, 2.929933, 0, 0.4313726, 1, 1,
0.2913722, 0.2664158, 0.9888257, 0, 0.4235294, 1, 1,
0.2919023, 1.367392, -0.5329915, 0, 0.4196078, 1, 1,
0.2994236, -1.343693, 3.35885, 0, 0.4117647, 1, 1,
0.3004111, 1.627465, -0.05675316, 0, 0.4078431, 1, 1,
0.30108, 0.36589, 1.397292, 0, 0.4, 1, 1,
0.3023976, 1.687088, 1.171836, 0, 0.3921569, 1, 1,
0.3033966, 1.436561, 0.1987366, 0, 0.3882353, 1, 1,
0.3039527, 1.168114, -1.175738, 0, 0.3803922, 1, 1,
0.3088705, 0.8097131, 0.2039264, 0, 0.3764706, 1, 1,
0.3093177, -0.8983847, 2.900334, 0, 0.3686275, 1, 1,
0.312434, 0.4397617, -0.2833883, 0, 0.3647059, 1, 1,
0.3137873, -1.352951, 2.798059, 0, 0.3568628, 1, 1,
0.3142872, -0.7930917, 4.703875, 0, 0.3529412, 1, 1,
0.3172522, 0.7264121, 0.9698801, 0, 0.345098, 1, 1,
0.3173892, 0.6155773, 0.235676, 0, 0.3411765, 1, 1,
0.3177169, -0.668335, 0.6378877, 0, 0.3333333, 1, 1,
0.3190747, -0.1725988, 1.80042, 0, 0.3294118, 1, 1,
0.322359, 1.174091, 1.178006, 0, 0.3215686, 1, 1,
0.3241738, 0.1487567, 2.317442, 0, 0.3176471, 1, 1,
0.3270867, 0.3652488, 1.357698, 0, 0.3098039, 1, 1,
0.3284553, 0.9376383, 0.3416992, 0, 0.3058824, 1, 1,
0.3351955, 0.0363264, 1.544662, 0, 0.2980392, 1, 1,
0.3355607, -0.6874427, 1.971566, 0, 0.2901961, 1, 1,
0.3370524, 0.1767055, -1.030839, 0, 0.2862745, 1, 1,
0.3449053, 1.17564, -0.09911331, 0, 0.2784314, 1, 1,
0.349468, -0.05733098, -0.7393786, 0, 0.2745098, 1, 1,
0.3516047, 1.379409, -0.9401621, 0, 0.2666667, 1, 1,
0.3526591, -0.6939118, 2.844853, 0, 0.2627451, 1, 1,
0.3526666, 0.643829, 0.5525709, 0, 0.254902, 1, 1,
0.3544879, -0.6118094, 0.8991814, 0, 0.2509804, 1, 1,
0.3572919, 0.6556476, 1.165832, 0, 0.2431373, 1, 1,
0.3586385, -0.9092187, 2.078305, 0, 0.2392157, 1, 1,
0.3618844, -0.8662409, 2.062545, 0, 0.2313726, 1, 1,
0.3639094, -0.1495546, 2.036502, 0, 0.227451, 1, 1,
0.3655772, 1.280183, 0.7875895, 0, 0.2196078, 1, 1,
0.366679, -1.372458, 3.391239, 0, 0.2156863, 1, 1,
0.374322, -0.06225637, 2.380735, 0, 0.2078431, 1, 1,
0.3747082, 0.2272625, 0.9752542, 0, 0.2039216, 1, 1,
0.375192, -0.1614484, 0.3326743, 0, 0.1960784, 1, 1,
0.3755994, -1.69628, 1.337941, 0, 0.1882353, 1, 1,
0.3795652, 0.3874859, 1.296367, 0, 0.1843137, 1, 1,
0.3804244, -1.400225, 3.68666, 0, 0.1764706, 1, 1,
0.3837645, -0.09277418, 2.364677, 0, 0.172549, 1, 1,
0.3872365, -0.4845171, 3.380257, 0, 0.1647059, 1, 1,
0.3890102, 1.39135, -0.5894619, 0, 0.1607843, 1, 1,
0.3921981, -0.4179399, 0.2445876, 0, 0.1529412, 1, 1,
0.3945182, -0.9137793, 0.492152, 0, 0.1490196, 1, 1,
0.3974292, -1.17724, 2.257786, 0, 0.1411765, 1, 1,
0.3993309, -0.4387764, 1.688138, 0, 0.1372549, 1, 1,
0.3994628, 0.2430366, 0.8269115, 0, 0.1294118, 1, 1,
0.4007245, 0.8084874, 1.612335, 0, 0.1254902, 1, 1,
0.4050218, -0.6726331, 1.51072, 0, 0.1176471, 1, 1,
0.40582, 0.9921678, 0.5953874, 0, 0.1137255, 1, 1,
0.4119604, -1.353636, 3.236049, 0, 0.1058824, 1, 1,
0.412534, -1.230051, 3.743665, 0, 0.09803922, 1, 1,
0.4128311, -0.4711114, 0.9810457, 0, 0.09411765, 1, 1,
0.4145914, -0.9706579, 2.637362, 0, 0.08627451, 1, 1,
0.41672, 1.249112, -0.2847449, 0, 0.08235294, 1, 1,
0.4255525, -2.141408, 2.929448, 0, 0.07450981, 1, 1,
0.4282838, 0.7761587, 0.5420451, 0, 0.07058824, 1, 1,
0.4302269, -0.2297972, 1.874504, 0, 0.0627451, 1, 1,
0.4307718, -2.124549, 1.963392, 0, 0.05882353, 1, 1,
0.4355749, -0.2231044, 2.524144, 0, 0.05098039, 1, 1,
0.4361083, -1.507299, 2.151084, 0, 0.04705882, 1, 1,
0.4362782, -1.260054, 2.220183, 0, 0.03921569, 1, 1,
0.4424065, 1.574417, -1.202767, 0, 0.03529412, 1, 1,
0.445464, -0.1320284, 2.606415, 0, 0.02745098, 1, 1,
0.4474786, -0.2948004, 0.3279026, 0, 0.02352941, 1, 1,
0.4476307, -0.2797501, 1.642161, 0, 0.01568628, 1, 1,
0.4516753, 0.7535139, 0.3211448, 0, 0.01176471, 1, 1,
0.4524828, 1.973166, 0.5207084, 0, 0.003921569, 1, 1,
0.4567668, -0.9672524, 3.811048, 0.003921569, 0, 1, 1,
0.460675, -0.2747346, 2.48787, 0.007843138, 0, 1, 1,
0.4610685, 0.08819066, 3.414199, 0.01568628, 0, 1, 1,
0.4617148, -2.270137, 2.899529, 0.01960784, 0, 1, 1,
0.4652537, 0.1326879, 0.9936163, 0.02745098, 0, 1, 1,
0.4688113, 0.6708612, 0.1413013, 0.03137255, 0, 1, 1,
0.4728483, 0.0624304, 0.6082811, 0.03921569, 0, 1, 1,
0.4759717, 1.617723, 1.585583, 0.04313726, 0, 1, 1,
0.4772529, -0.1154705, 4.264349, 0.05098039, 0, 1, 1,
0.4778032, 0.4065651, 2.74993, 0.05490196, 0, 1, 1,
0.47869, -1.086946, 3.797796, 0.0627451, 0, 1, 1,
0.4805384, 0.3699531, 1.562274, 0.06666667, 0, 1, 1,
0.4827812, -0.4086068, 1.755017, 0.07450981, 0, 1, 1,
0.4854075, 0.7102428, 0.7696453, 0.07843138, 0, 1, 1,
0.487066, 0.4160515, 2.41164, 0.08627451, 0, 1, 1,
0.4913566, 0.2992941, 1.990948, 0.09019608, 0, 1, 1,
0.4926992, -0.01150148, -0.1267238, 0.09803922, 0, 1, 1,
0.5029998, 1.321195, 0.5055854, 0.1058824, 0, 1, 1,
0.5030963, -1.657302, 2.452018, 0.1098039, 0, 1, 1,
0.5080051, 0.9326596, 0.0605708, 0.1176471, 0, 1, 1,
0.509811, 1.008655, 2.356223, 0.1215686, 0, 1, 1,
0.5113099, -0.5614088, 1.736557, 0.1294118, 0, 1, 1,
0.5116209, -1.039941, 3.123349, 0.1333333, 0, 1, 1,
0.514103, -0.2816398, 2.103074, 0.1411765, 0, 1, 1,
0.5168248, -0.5879812, 2.309267, 0.145098, 0, 1, 1,
0.5218905, 0.2008982, -0.9851049, 0.1529412, 0, 1, 1,
0.5235018, -0.4482746, 3.477126, 0.1568628, 0, 1, 1,
0.5294122, 0.0542777, 2.872201, 0.1647059, 0, 1, 1,
0.5326468, 0.942513, -0.01303906, 0.1686275, 0, 1, 1,
0.5381234, 0.01650175, 2.90293, 0.1764706, 0, 1, 1,
0.5437095, -1.43282, 1.739327, 0.1803922, 0, 1, 1,
0.5474516, -0.6319705, 2.745178, 0.1882353, 0, 1, 1,
0.5516785, 0.6680532, 0.08677021, 0.1921569, 0, 1, 1,
0.5590137, 1.213452, 0.7576868, 0.2, 0, 1, 1,
0.5591035, 0.6997111, 1.142963, 0.2078431, 0, 1, 1,
0.5622315, -0.3389851, 1.491824, 0.2117647, 0, 1, 1,
0.5674368, 1.31244, 0.1890836, 0.2196078, 0, 1, 1,
0.5723004, 0.9811184, -0.4503237, 0.2235294, 0, 1, 1,
0.5744278, -0.3333526, 3.291325, 0.2313726, 0, 1, 1,
0.5746685, 0.5224876, 1.412069, 0.2352941, 0, 1, 1,
0.5774924, -0.01734481, 2.388553, 0.2431373, 0, 1, 1,
0.5778354, 0.4561116, 2.550786, 0.2470588, 0, 1, 1,
0.5836211, 2.090529, 0.1000444, 0.254902, 0, 1, 1,
0.5845773, -0.1956747, 1.689079, 0.2588235, 0, 1, 1,
0.5861126, -0.1425472, 2.399782, 0.2666667, 0, 1, 1,
0.5930991, 0.1736269, 0.7043051, 0.2705882, 0, 1, 1,
0.5945335, -0.1768373, 0.5637272, 0.2784314, 0, 1, 1,
0.5951642, 1.47569, -0.6604822, 0.282353, 0, 1, 1,
0.5969797, 0.3083341, 3.72924, 0.2901961, 0, 1, 1,
0.5989324, -1.310201, 3.79439, 0.2941177, 0, 1, 1,
0.6014018, 0.1668956, 0.4085208, 0.3019608, 0, 1, 1,
0.6046302, 1.036849, 1.689743, 0.3098039, 0, 1, 1,
0.6070833, 1.599655, 1.29614, 0.3137255, 0, 1, 1,
0.6091403, -0.3273008, 2.151292, 0.3215686, 0, 1, 1,
0.6109058, -0.4476452, 2.491211, 0.3254902, 0, 1, 1,
0.6149269, -0.6088668, 1.797027, 0.3333333, 0, 1, 1,
0.6154797, -0.4271166, 1.737656, 0.3372549, 0, 1, 1,
0.6198645, -1.730538, 1.88898, 0.345098, 0, 1, 1,
0.6223774, -0.02055623, 1.813911, 0.3490196, 0, 1, 1,
0.6235766, -0.1191558, 1.909973, 0.3568628, 0, 1, 1,
0.6315951, 1.049471, -0.4854271, 0.3607843, 0, 1, 1,
0.6459987, 0.09016779, 1.748891, 0.3686275, 0, 1, 1,
0.6534874, -0.4541742, 1.521387, 0.372549, 0, 1, 1,
0.6549237, -0.402948, 2.327898, 0.3803922, 0, 1, 1,
0.6557303, -1.829287, 4.038363, 0.3843137, 0, 1, 1,
0.6560348, -1.261613, 2.466655, 0.3921569, 0, 1, 1,
0.6621066, 1.544113, 0.9187242, 0.3960784, 0, 1, 1,
0.6648184, -0.3183571, 2.212447, 0.4039216, 0, 1, 1,
0.6706805, -0.9814411, 2.073429, 0.4117647, 0, 1, 1,
0.6715901, 0.07199761, 0.7112881, 0.4156863, 0, 1, 1,
0.6718169, -0.7022317, 3.519695, 0.4235294, 0, 1, 1,
0.6768104, -0.1310212, 0.8453132, 0.427451, 0, 1, 1,
0.6804612, 0.7621429, 0.1461578, 0.4352941, 0, 1, 1,
0.6811087, 0.3766692, 1.663298, 0.4392157, 0, 1, 1,
0.6838558, 1.234014, 0.8790834, 0.4470588, 0, 1, 1,
0.6841606, -1.257515, 3.288285, 0.4509804, 0, 1, 1,
0.7004241, 0.03329806, -0.4210373, 0.4588235, 0, 1, 1,
0.7027283, 0.1576963, 1.916556, 0.4627451, 0, 1, 1,
0.7082233, -0.5373756, 1.42201, 0.4705882, 0, 1, 1,
0.7093993, -1.955211, 4.480849, 0.4745098, 0, 1, 1,
0.7115505, 1.681441, 0.231925, 0.4823529, 0, 1, 1,
0.7159958, -0.6982113, 3.977307, 0.4862745, 0, 1, 1,
0.7185327, 0.6903851, 2.24315, 0.4941176, 0, 1, 1,
0.7189627, -0.1640207, -0.5419654, 0.5019608, 0, 1, 1,
0.7208902, -0.004287356, 2.914187, 0.5058824, 0, 1, 1,
0.721943, 1.13228, 3.299561, 0.5137255, 0, 1, 1,
0.7280506, 1.54523, 1.074566, 0.5176471, 0, 1, 1,
0.7282881, -0.9236879, 3.375514, 0.5254902, 0, 1, 1,
0.7296133, 0.2241706, 1.263551, 0.5294118, 0, 1, 1,
0.7322206, 0.2293938, 2.397602, 0.5372549, 0, 1, 1,
0.7347715, 0.9688606, -1.11046, 0.5411765, 0, 1, 1,
0.7354435, -1.805421, 4.000511, 0.5490196, 0, 1, 1,
0.7380635, -0.7265446, 4.189708, 0.5529412, 0, 1, 1,
0.7397953, -1.223905, 3.753942, 0.5607843, 0, 1, 1,
0.7420707, -0.02749674, 0.4120998, 0.5647059, 0, 1, 1,
0.7433875, -0.3480469, 3.632043, 0.572549, 0, 1, 1,
0.7453228, 0.4493045, -0.06333993, 0.5764706, 0, 1, 1,
0.7463098, 0.7447211, 1.230221, 0.5843138, 0, 1, 1,
0.7465292, -0.8668696, 2.163362, 0.5882353, 0, 1, 1,
0.7497118, -0.5806464, 2.042349, 0.5960785, 0, 1, 1,
0.7551295, -0.7991691, 1.854268, 0.6039216, 0, 1, 1,
0.7590682, 0.2079527, 0.3735255, 0.6078432, 0, 1, 1,
0.7603942, 0.4000213, 1.407736, 0.6156863, 0, 1, 1,
0.775444, 1.123548, 1.019826, 0.6196079, 0, 1, 1,
0.777705, 0.9209224, 1.065003, 0.627451, 0, 1, 1,
0.7798572, -0.408382, 2.963361, 0.6313726, 0, 1, 1,
0.7801378, 0.8084784, 2.705811, 0.6392157, 0, 1, 1,
0.7856573, -1.523877, 2.071222, 0.6431373, 0, 1, 1,
0.792028, 0.3271356, 1.905794, 0.6509804, 0, 1, 1,
0.7925913, 0.652878, -0.3539158, 0.654902, 0, 1, 1,
0.7970418, 0.3587704, 1.291814, 0.6627451, 0, 1, 1,
0.79738, -0.8814542, 2.818331, 0.6666667, 0, 1, 1,
0.8018774, -0.3641731, 1.858009, 0.6745098, 0, 1, 1,
0.802116, -0.6517388, 1.567361, 0.6784314, 0, 1, 1,
0.8048791, 1.511546, 0.1061895, 0.6862745, 0, 1, 1,
0.8103587, 0.3619408, -0.5760512, 0.6901961, 0, 1, 1,
0.8257537, -0.4258434, 1.730499, 0.6980392, 0, 1, 1,
0.8262117, 1.9474, 0.2507979, 0.7058824, 0, 1, 1,
0.8266789, -0.9134514, 2.542077, 0.7098039, 0, 1, 1,
0.8280655, 0.2582502, 0.5689014, 0.7176471, 0, 1, 1,
0.8316273, 0.8055534, -0.9432319, 0.7215686, 0, 1, 1,
0.8369842, -0.7255334, 1.625145, 0.7294118, 0, 1, 1,
0.8382597, 0.25649, -0.8148689, 0.7333333, 0, 1, 1,
0.8395537, -0.9114806, 2.670739, 0.7411765, 0, 1, 1,
0.8478914, -0.6004263, 2.980211, 0.7450981, 0, 1, 1,
0.8531846, 0.1772762, 2.029951, 0.7529412, 0, 1, 1,
0.8556647, 0.04506731, 0.4359268, 0.7568628, 0, 1, 1,
0.8644426, -1.347588, 3.043638, 0.7647059, 0, 1, 1,
0.8647549, 0.9503014, 0.6068048, 0.7686275, 0, 1, 1,
0.8728592, 0.3609604, 0.3561431, 0.7764706, 0, 1, 1,
0.8734899, -0.4322621, 3.819572, 0.7803922, 0, 1, 1,
0.8742294, -0.5620741, 2.677347, 0.7882353, 0, 1, 1,
0.8784662, 0.2116562, 2.009117, 0.7921569, 0, 1, 1,
0.8790137, 2.046902, -0.2997164, 0.8, 0, 1, 1,
0.8816884, -1.233966, 2.154558, 0.8078431, 0, 1, 1,
0.8818126, -1.846845, 2.021655, 0.8117647, 0, 1, 1,
0.888195, -0.5327581, 0.1553571, 0.8196079, 0, 1, 1,
0.8930241, 0.431339, 2.907203, 0.8235294, 0, 1, 1,
0.8944001, -1.693793, 3.181219, 0.8313726, 0, 1, 1,
0.8952921, -0.5203294, 2.014984, 0.8352941, 0, 1, 1,
0.9147871, 0.9049546, 2.62189, 0.8431373, 0, 1, 1,
0.9166626, -0.8230513, 3.333786, 0.8470588, 0, 1, 1,
0.924349, 0.5709421, 0.6070035, 0.854902, 0, 1, 1,
0.9258839, 0.8454602, 1.796536, 0.8588235, 0, 1, 1,
0.9279192, -0.06475436, 1.869703, 0.8666667, 0, 1, 1,
0.928918, 0.3044355, 0.8797685, 0.8705882, 0, 1, 1,
0.9293668, 0.03662808, 2.254768, 0.8784314, 0, 1, 1,
0.9302203, -1.373312, 2.484844, 0.8823529, 0, 1, 1,
0.9371812, 1.333261, -0.06271604, 0.8901961, 0, 1, 1,
0.9485717, -1.340698, 1.269364, 0.8941177, 0, 1, 1,
0.9490766, 0.05425142, 1.946283, 0.9019608, 0, 1, 1,
0.9578811, -1.366352, 1.788526, 0.9098039, 0, 1, 1,
0.9598975, -0.7097726, 4.041139, 0.9137255, 0, 1, 1,
0.9607066, 1.589332, 0.3262684, 0.9215686, 0, 1, 1,
0.9743213, 0.3875473, 0.7659864, 0.9254902, 0, 1, 1,
0.9787986, 2.477493, -0.3477046, 0.9333333, 0, 1, 1,
0.982152, -0.6367006, 2.669621, 0.9372549, 0, 1, 1,
0.9850714, 1.134379, 1.072042, 0.945098, 0, 1, 1,
0.9866382, 0.361919, 1.559116, 0.9490196, 0, 1, 1,
0.98835, 1.810578, -0.3627834, 0.9568627, 0, 1, 1,
0.9897146, 0.171343, 0.9496979, 0.9607843, 0, 1, 1,
0.990692, -1.275605, 1.112445, 0.9686275, 0, 1, 1,
0.9950781, -0.8137697, 4.025893, 0.972549, 0, 1, 1,
1.005135, 1.038886, -0.4608604, 0.9803922, 0, 1, 1,
1.005169, -0.4973027, 1.196272, 0.9843137, 0, 1, 1,
1.006125, 2.887971, -0.8649475, 0.9921569, 0, 1, 1,
1.006617, 0.2004796, 0.9226162, 0.9960784, 0, 1, 1,
1.008944, -0.966675, 3.094374, 1, 0, 0.9960784, 1,
1.009136, 0.4225681, 0.5508658, 1, 0, 0.9882353, 1,
1.011147, -0.99913, 2.006454, 1, 0, 0.9843137, 1,
1.011235, 0.08195453, 0.7156792, 1, 0, 0.9764706, 1,
1.015568, -0.812985, 2.920964, 1, 0, 0.972549, 1,
1.017088, -0.01671448, 0.7139723, 1, 0, 0.9647059, 1,
1.021795, -0.06216655, -0.7530097, 1, 0, 0.9607843, 1,
1.024265, 0.8633366, -2.730592, 1, 0, 0.9529412, 1,
1.024799, 1.340837, 1.098254, 1, 0, 0.9490196, 1,
1.032032, 0.0810139, 3.323246, 1, 0, 0.9411765, 1,
1.033108, 0.2624764, 2.196247, 1, 0, 0.9372549, 1,
1.042551, 0.4729353, -0.1447615, 1, 0, 0.9294118, 1,
1.047475, 1.047854, 1.152527, 1, 0, 0.9254902, 1,
1.052898, -0.8073246, 2.110577, 1, 0, 0.9176471, 1,
1.057277, 0.1741405, 0.3867718, 1, 0, 0.9137255, 1,
1.058897, -0.7540219, -0.1719024, 1, 0, 0.9058824, 1,
1.067218, 0.7965347, 2.073252, 1, 0, 0.9019608, 1,
1.071207, 1.048586, 0.273458, 1, 0, 0.8941177, 1,
1.077301, -1.805272, 1.028895, 1, 0, 0.8862745, 1,
1.081576, -0.3549427, 1.533921, 1, 0, 0.8823529, 1,
1.084711, 0.5626482, -1.524791, 1, 0, 0.8745098, 1,
1.085499, 0.2025038, 1.057932, 1, 0, 0.8705882, 1,
1.091357, -0.4883441, 1.508673, 1, 0, 0.8627451, 1,
1.106724, 0.310516, 0.5605512, 1, 0, 0.8588235, 1,
1.107125, 1.085407, 1.161617, 1, 0, 0.8509804, 1,
1.10793, -0.3091392, 2.711681, 1, 0, 0.8470588, 1,
1.112597, -0.4580939, 1.482958, 1, 0, 0.8392157, 1,
1.119692, 1.680728, 0.340877, 1, 0, 0.8352941, 1,
1.127263, 1.251166, 0.06884533, 1, 0, 0.827451, 1,
1.132457, 0.386272, 0.4658561, 1, 0, 0.8235294, 1,
1.143152, 1.977049, 1.009502, 1, 0, 0.8156863, 1,
1.144457, 0.8581218, 1.451213, 1, 0, 0.8117647, 1,
1.152188, -0.197969, 1.898912, 1, 0, 0.8039216, 1,
1.153869, -0.9255092, 3.820515, 1, 0, 0.7960784, 1,
1.160079, -0.6592643, 1.970034, 1, 0, 0.7921569, 1,
1.162026, -0.7107223, 1.064848, 1, 0, 0.7843137, 1,
1.16312, 0.2303863, 1.338038, 1, 0, 0.7803922, 1,
1.164591, 0.12662, 1.396518, 1, 0, 0.772549, 1,
1.171342, 1.253534, 1.061518, 1, 0, 0.7686275, 1,
1.178162, -0.1351128, 2.22797, 1, 0, 0.7607843, 1,
1.181375, 1.897355, -0.3437291, 1, 0, 0.7568628, 1,
1.188973, 0.489134, 0.02599424, 1, 0, 0.7490196, 1,
1.193403, -1.643461, 2.769882, 1, 0, 0.7450981, 1,
1.20861, -0.0393105, 2.674926, 1, 0, 0.7372549, 1,
1.213714, -1.290472, 1.346735, 1, 0, 0.7333333, 1,
1.228143, 0.7800067, -0.05904397, 1, 0, 0.7254902, 1,
1.229179, 0.2760814, 1.257239, 1, 0, 0.7215686, 1,
1.229599, -0.0765416, 0.8676655, 1, 0, 0.7137255, 1,
1.234804, 2.1933, 2.149073, 1, 0, 0.7098039, 1,
1.252938, -0.6499517, 2.522472, 1, 0, 0.7019608, 1,
1.259117, 1.907957, -0.1709329, 1, 0, 0.6941177, 1,
1.261584, -0.8083682, 3.523782, 1, 0, 0.6901961, 1,
1.266375, 0.03324973, 0.3216033, 1, 0, 0.682353, 1,
1.2764, 1.459366, -0.09731042, 1, 0, 0.6784314, 1,
1.285922, 0.520154, 0.1004547, 1, 0, 0.6705883, 1,
1.288429, -0.138217, 2.017121, 1, 0, 0.6666667, 1,
1.289778, 1.108875, 0.9609491, 1, 0, 0.6588235, 1,
1.291088, -0.06059428, 1.942945, 1, 0, 0.654902, 1,
1.300795, -0.7650182, 2.045157, 1, 0, 0.6470588, 1,
1.302873, 0.2052055, 2.413309, 1, 0, 0.6431373, 1,
1.305614, 0.2976256, 1.15028, 1, 0, 0.6352941, 1,
1.308548, -0.4441819, 2.49275, 1, 0, 0.6313726, 1,
1.311187, -1.208685, 1.924445, 1, 0, 0.6235294, 1,
1.323641, 0.3176714, 2.103116, 1, 0, 0.6196079, 1,
1.326951, 0.8873542, 1.154819, 1, 0, 0.6117647, 1,
1.327263, -0.5846118, 3.167293, 1, 0, 0.6078432, 1,
1.339976, -0.03377296, 2.519496, 1, 0, 0.6, 1,
1.340506, 0.4632466, 0.9351537, 1, 0, 0.5921569, 1,
1.355635, 1.150566, 1.763989, 1, 0, 0.5882353, 1,
1.36021, 0.09192204, 2.786139, 1, 0, 0.5803922, 1,
1.360885, -0.1597959, 0.5423973, 1, 0, 0.5764706, 1,
1.365913, -0.3973492, 1.734255, 1, 0, 0.5686275, 1,
1.373326, 0.7108356, -0.6081967, 1, 0, 0.5647059, 1,
1.38282, -1.212438, 2.723453, 1, 0, 0.5568628, 1,
1.384087, -1.248835, 1.446154, 1, 0, 0.5529412, 1,
1.389449, 0.3967762, 0.4453192, 1, 0, 0.5450981, 1,
1.392142, -1.260959, 2.794412, 1, 0, 0.5411765, 1,
1.395971, 0.08329399, 2.459239, 1, 0, 0.5333334, 1,
1.396553, -0.7814934, 1.939089, 1, 0, 0.5294118, 1,
1.399279, -1.725576, 1.093809, 1, 0, 0.5215687, 1,
1.401641, -1.166291, 2.129765, 1, 0, 0.5176471, 1,
1.407426, 1.121786, -1.89329, 1, 0, 0.509804, 1,
1.409826, -0.5297264, 2.067607, 1, 0, 0.5058824, 1,
1.417739, 0.03700193, 1.216218, 1, 0, 0.4980392, 1,
1.425566, -2.119665, 1.068972, 1, 0, 0.4901961, 1,
1.427086, -0.5410505, 1.077066, 1, 0, 0.4862745, 1,
1.436282, -0.01566607, 2.706058, 1, 0, 0.4784314, 1,
1.447664, 1.407184, -0.3328598, 1, 0, 0.4745098, 1,
1.450061, 1.187231, 0.8641407, 1, 0, 0.4666667, 1,
1.450433, -1.730231, 1.898075, 1, 0, 0.4627451, 1,
1.452618, 2.039242, 0.06427386, 1, 0, 0.454902, 1,
1.452938, -0.4632788, 2.946942, 1, 0, 0.4509804, 1,
1.49271, -1.901617, 1.673045, 1, 0, 0.4431373, 1,
1.497865, 0.4293171, 2.304024, 1, 0, 0.4392157, 1,
1.516988, -0.1080587, 1.209199, 1, 0, 0.4313726, 1,
1.522837, -1.313861, 1.680157, 1, 0, 0.427451, 1,
1.526433, -1.204664, 4.8308, 1, 0, 0.4196078, 1,
1.536955, 0.5238973, 0.9222554, 1, 0, 0.4156863, 1,
1.539947, 0.06369073, 1.068789, 1, 0, 0.4078431, 1,
1.540867, 0.8275825, -0.3457388, 1, 0, 0.4039216, 1,
1.55375, -1.129969, 3.251468, 1, 0, 0.3960784, 1,
1.561724, 0.401512, -0.04793973, 1, 0, 0.3882353, 1,
1.565292, -0.8758754, 3.020516, 1, 0, 0.3843137, 1,
1.570082, -1.210566, 3.642554, 1, 0, 0.3764706, 1,
1.608198, -0.758634, 2.586326, 1, 0, 0.372549, 1,
1.614198, -0.4913651, 5.248364, 1, 0, 0.3647059, 1,
1.62082, 0.1157632, 0.1933787, 1, 0, 0.3607843, 1,
1.646891, 0.6756178, 0.4172994, 1, 0, 0.3529412, 1,
1.649992, -1.127372, 2.859195, 1, 0, 0.3490196, 1,
1.666214, -0.004433902, -2.085816, 1, 0, 0.3411765, 1,
1.66969, 0.8825345, -0.504238, 1, 0, 0.3372549, 1,
1.673651, 0.5010639, -0.6032807, 1, 0, 0.3294118, 1,
1.679251, 0.4398094, 0.7990381, 1, 0, 0.3254902, 1,
1.690285, 1.695245, 0.9360576, 1, 0, 0.3176471, 1,
1.693102, 0.5147237, 1.039703, 1, 0, 0.3137255, 1,
1.700754, 0.5371271, 1.040716, 1, 0, 0.3058824, 1,
1.704533, 0.2559941, -0.2172533, 1, 0, 0.2980392, 1,
1.718678, 0.0676764, 0.8497871, 1, 0, 0.2941177, 1,
1.720624, -1.054685, 0.7972405, 1, 0, 0.2862745, 1,
1.727367, 0.2124055, 1.499298, 1, 0, 0.282353, 1,
1.749969, 1.556147, 0.6331456, 1, 0, 0.2745098, 1,
1.753262, 0.2445942, 2.366553, 1, 0, 0.2705882, 1,
1.769528, 0.04997703, 2.488489, 1, 0, 0.2627451, 1,
1.787382, -0.5533714, 4.692069, 1, 0, 0.2588235, 1,
1.82957, -0.6017041, 3.286783, 1, 0, 0.2509804, 1,
1.835313, -0.102895, 1.849925, 1, 0, 0.2470588, 1,
1.841103, 0.4788193, 1.03447, 1, 0, 0.2392157, 1,
1.845312, 1.646263, 1.076757, 1, 0, 0.2352941, 1,
1.848699, -1.318406, 2.142052, 1, 0, 0.227451, 1,
1.856644, 0.3243922, 1.952152, 1, 0, 0.2235294, 1,
1.858909, 1.758653, 0.9162005, 1, 0, 0.2156863, 1,
1.861942, -0.2337165, 0.6327108, 1, 0, 0.2117647, 1,
1.864245, -0.4739576, 1.518042, 1, 0, 0.2039216, 1,
1.870741, 1.330807, 1.844628, 1, 0, 0.1960784, 1,
1.877549, -0.5451567, 2.970063, 1, 0, 0.1921569, 1,
1.878953, -0.5096892, 2.080765, 1, 0, 0.1843137, 1,
1.899857, 0.7898099, 0.8132999, 1, 0, 0.1803922, 1,
1.92184, -1.447919, 1.587052, 1, 0, 0.172549, 1,
1.973501, 1.042103, 1.40758, 1, 0, 0.1686275, 1,
1.986356, 1.097249, 0.1752604, 1, 0, 0.1607843, 1,
1.988319, 1.33228, 1.494199, 1, 0, 0.1568628, 1,
2.015709, 0.009585069, 2.013516, 1, 0, 0.1490196, 1,
2.016323, 0.1209662, 1.219986, 1, 0, 0.145098, 1,
2.037249, -0.6261336, 3.24624, 1, 0, 0.1372549, 1,
2.053483, 0.4220507, 0.1667513, 1, 0, 0.1333333, 1,
2.105225, -0.7352189, 2.070595, 1, 0, 0.1254902, 1,
2.138551, -0.3839578, 1.172685, 1, 0, 0.1215686, 1,
2.149911, -1.142526, 1.154375, 1, 0, 0.1137255, 1,
2.196494, -0.7849895, 2.643564, 1, 0, 0.1098039, 1,
2.213749, -0.1834821, 1.508837, 1, 0, 0.1019608, 1,
2.239512, 0.8823875, 1.02692, 1, 0, 0.09411765, 1,
2.281063, 1.040386, 1.293197, 1, 0, 0.09019608, 1,
2.352232, 0.6492001, 0.6728123, 1, 0, 0.08235294, 1,
2.352947, -0.6922791, 2.099597, 1, 0, 0.07843138, 1,
2.424488, 1.449564, -0.1804188, 1, 0, 0.07058824, 1,
2.45013, -0.1425654, 1.686299, 1, 0, 0.06666667, 1,
2.474291, 0.07811101, 3.126843, 1, 0, 0.05882353, 1,
2.478547, 0.9367709, 0.09204527, 1, 0, 0.05490196, 1,
2.536822, -1.103801, 2.960229, 1, 0, 0.04705882, 1,
2.605048, -0.1884895, 2.385621, 1, 0, 0.04313726, 1,
2.647397, 0.143308, -1.770925, 1, 0, 0.03529412, 1,
2.654397, 0.7042066, 0.3547105, 1, 0, 0.03137255, 1,
2.668911, 0.5964269, -0.5058605, 1, 0, 0.02352941, 1,
2.773749, 0.520327, 2.210614, 1, 0, 0.01960784, 1,
2.888002, -1.170996, 1.732638, 1, 0, 0.01176471, 1,
3.127187, 0.8531516, 1.383566, 1, 0, 0.007843138, 1
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
0.2381328, -4.351616, -7.492456, 0, -0.5, 0.5, 0.5,
0.2381328, -4.351616, -7.492456, 1, -0.5, 0.5, 0.5,
0.2381328, -4.351616, -7.492456, 1, 1.5, 0.5, 0.5,
0.2381328, -4.351616, -7.492456, 0, 1.5, 0.5, 0.5
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
-3.63031, -0.07525826, -7.492456, 0, -0.5, 0.5, 0.5,
-3.63031, -0.07525826, -7.492456, 1, -0.5, 0.5, 0.5,
-3.63031, -0.07525826, -7.492456, 1, 1.5, 0.5, 0.5,
-3.63031, -0.07525826, -7.492456, 0, 1.5, 0.5, 0.5
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
-3.63031, -4.351616, -0.04648805, 0, -0.5, 0.5, 0.5,
-3.63031, -4.351616, -0.04648805, 1, -0.5, 0.5, 0.5,
-3.63031, -4.351616, -0.04648805, 1, 1.5, 0.5, 0.5,
-3.63031, -4.351616, -0.04648805, 0, 1.5, 0.5, 0.5
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
-2, -3.364765, -5.774156,
3, -3.364765, -5.774156,
-2, -3.364765, -5.774156,
-2, -3.52924, -6.060539,
-1, -3.364765, -5.774156,
-1, -3.52924, -6.060539,
0, -3.364765, -5.774156,
0, -3.52924, -6.060539,
1, -3.364765, -5.774156,
1, -3.52924, -6.060539,
2, -3.364765, -5.774156,
2, -3.52924, -6.060539,
3, -3.364765, -5.774156,
3, -3.52924, -6.060539
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
-2, -3.858191, -6.633306, 0, -0.5, 0.5, 0.5,
-2, -3.858191, -6.633306, 1, -0.5, 0.5, 0.5,
-2, -3.858191, -6.633306, 1, 1.5, 0.5, 0.5,
-2, -3.858191, -6.633306, 0, 1.5, 0.5, 0.5,
-1, -3.858191, -6.633306, 0, -0.5, 0.5, 0.5,
-1, -3.858191, -6.633306, 1, -0.5, 0.5, 0.5,
-1, -3.858191, -6.633306, 1, 1.5, 0.5, 0.5,
-1, -3.858191, -6.633306, 0, 1.5, 0.5, 0.5,
0, -3.858191, -6.633306, 0, -0.5, 0.5, 0.5,
0, -3.858191, -6.633306, 1, -0.5, 0.5, 0.5,
0, -3.858191, -6.633306, 1, 1.5, 0.5, 0.5,
0, -3.858191, -6.633306, 0, 1.5, 0.5, 0.5,
1, -3.858191, -6.633306, 0, -0.5, 0.5, 0.5,
1, -3.858191, -6.633306, 1, -0.5, 0.5, 0.5,
1, -3.858191, -6.633306, 1, 1.5, 0.5, 0.5,
1, -3.858191, -6.633306, 0, 1.5, 0.5, 0.5,
2, -3.858191, -6.633306, 0, -0.5, 0.5, 0.5,
2, -3.858191, -6.633306, 1, -0.5, 0.5, 0.5,
2, -3.858191, -6.633306, 1, 1.5, 0.5, 0.5,
2, -3.858191, -6.633306, 0, 1.5, 0.5, 0.5,
3, -3.858191, -6.633306, 0, -0.5, 0.5, 0.5,
3, -3.858191, -6.633306, 1, -0.5, 0.5, 0.5,
3, -3.858191, -6.633306, 1, 1.5, 0.5, 0.5,
3, -3.858191, -6.633306, 0, 1.5, 0.5, 0.5
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
-2.737593, -3, -5.774156,
-2.737593, 3, -5.774156,
-2.737593, -3, -5.774156,
-2.886379, -3, -6.060539,
-2.737593, -2, -5.774156,
-2.886379, -2, -6.060539,
-2.737593, -1, -5.774156,
-2.886379, -1, -6.060539,
-2.737593, 0, -5.774156,
-2.886379, 0, -6.060539,
-2.737593, 1, -5.774156,
-2.886379, 1, -6.060539,
-2.737593, 2, -5.774156,
-2.886379, 2, -6.060539,
-2.737593, 3, -5.774156,
-2.886379, 3, -6.060539
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
-3.183952, -3, -6.633306, 0, -0.5, 0.5, 0.5,
-3.183952, -3, -6.633306, 1, -0.5, 0.5, 0.5,
-3.183952, -3, -6.633306, 1, 1.5, 0.5, 0.5,
-3.183952, -3, -6.633306, 0, 1.5, 0.5, 0.5,
-3.183952, -2, -6.633306, 0, -0.5, 0.5, 0.5,
-3.183952, -2, -6.633306, 1, -0.5, 0.5, 0.5,
-3.183952, -2, -6.633306, 1, 1.5, 0.5, 0.5,
-3.183952, -2, -6.633306, 0, 1.5, 0.5, 0.5,
-3.183952, -1, -6.633306, 0, -0.5, 0.5, 0.5,
-3.183952, -1, -6.633306, 1, -0.5, 0.5, 0.5,
-3.183952, -1, -6.633306, 1, 1.5, 0.5, 0.5,
-3.183952, -1, -6.633306, 0, 1.5, 0.5, 0.5,
-3.183952, 0, -6.633306, 0, -0.5, 0.5, 0.5,
-3.183952, 0, -6.633306, 1, -0.5, 0.5, 0.5,
-3.183952, 0, -6.633306, 1, 1.5, 0.5, 0.5,
-3.183952, 0, -6.633306, 0, 1.5, 0.5, 0.5,
-3.183952, 1, -6.633306, 0, -0.5, 0.5, 0.5,
-3.183952, 1, -6.633306, 1, -0.5, 0.5, 0.5,
-3.183952, 1, -6.633306, 1, 1.5, 0.5, 0.5,
-3.183952, 1, -6.633306, 0, 1.5, 0.5, 0.5,
-3.183952, 2, -6.633306, 0, -0.5, 0.5, 0.5,
-3.183952, 2, -6.633306, 1, -0.5, 0.5, 0.5,
-3.183952, 2, -6.633306, 1, 1.5, 0.5, 0.5,
-3.183952, 2, -6.633306, 0, 1.5, 0.5, 0.5,
-3.183952, 3, -6.633306, 0, -0.5, 0.5, 0.5,
-3.183952, 3, -6.633306, 1, -0.5, 0.5, 0.5,
-3.183952, 3, -6.633306, 1, 1.5, 0.5, 0.5,
-3.183952, 3, -6.633306, 0, 1.5, 0.5, 0.5
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
-2.737593, -3.364765, -4,
-2.737593, -3.364765, 4,
-2.737593, -3.364765, -4,
-2.886379, -3.52924, -4,
-2.737593, -3.364765, -2,
-2.886379, -3.52924, -2,
-2.737593, -3.364765, 0,
-2.886379, -3.52924, 0,
-2.737593, -3.364765, 2,
-2.886379, -3.52924, 2,
-2.737593, -3.364765, 4,
-2.886379, -3.52924, 4
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
-3.183952, -3.858191, -4, 0, -0.5, 0.5, 0.5,
-3.183952, -3.858191, -4, 1, -0.5, 0.5, 0.5,
-3.183952, -3.858191, -4, 1, 1.5, 0.5, 0.5,
-3.183952, -3.858191, -4, 0, 1.5, 0.5, 0.5,
-3.183952, -3.858191, -2, 0, -0.5, 0.5, 0.5,
-3.183952, -3.858191, -2, 1, -0.5, 0.5, 0.5,
-3.183952, -3.858191, -2, 1, 1.5, 0.5, 0.5,
-3.183952, -3.858191, -2, 0, 1.5, 0.5, 0.5,
-3.183952, -3.858191, 0, 0, -0.5, 0.5, 0.5,
-3.183952, -3.858191, 0, 1, -0.5, 0.5, 0.5,
-3.183952, -3.858191, 0, 1, 1.5, 0.5, 0.5,
-3.183952, -3.858191, 0, 0, 1.5, 0.5, 0.5,
-3.183952, -3.858191, 2, 0, -0.5, 0.5, 0.5,
-3.183952, -3.858191, 2, 1, -0.5, 0.5, 0.5,
-3.183952, -3.858191, 2, 1, 1.5, 0.5, 0.5,
-3.183952, -3.858191, 2, 0, 1.5, 0.5, 0.5,
-3.183952, -3.858191, 4, 0, -0.5, 0.5, 0.5,
-3.183952, -3.858191, 4, 1, -0.5, 0.5, 0.5,
-3.183952, -3.858191, 4, 1, 1.5, 0.5, 0.5,
-3.183952, -3.858191, 4, 0, 1.5, 0.5, 0.5
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
-2.737593, -3.364765, -5.774156,
-2.737593, 3.214248, -5.774156,
-2.737593, -3.364765, 5.68118,
-2.737593, 3.214248, 5.68118,
-2.737593, -3.364765, -5.774156,
-2.737593, -3.364765, 5.68118,
-2.737593, 3.214248, -5.774156,
-2.737593, 3.214248, 5.68118,
-2.737593, -3.364765, -5.774156,
3.213858, -3.364765, -5.774156,
-2.737593, -3.364765, 5.68118,
3.213858, -3.364765, 5.68118,
-2.737593, 3.214248, -5.774156,
3.213858, 3.214248, -5.774156,
-2.737593, 3.214248, 5.68118,
3.213858, 3.214248, 5.68118,
3.213858, -3.364765, -5.774156,
3.213858, 3.214248, -5.774156,
3.213858, -3.364765, 5.68118,
3.213858, 3.214248, 5.68118,
3.213858, -3.364765, -5.774156,
3.213858, -3.364765, 5.68118,
3.213858, 3.214248, -5.774156,
3.213858, 3.214248, 5.68118
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
var radius = 7.736785;
var distance = 34.42183;
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
mvMatrix.translate( -0.2381328, 0.07525826, 0.04648805 );
mvMatrix.scale( 1.405567, 1.271492, 0.7302417 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.42183);
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
Cypermethrin<-read.table("Cypermethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Cypermethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Cypermethrin' not found
```

```r
y<-Cypermethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Cypermethrin' not found
```

```r
z<-Cypermethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Cypermethrin' not found
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
-2.650921, -0.4326404, -3.141003, 0, 0, 1, 1, 1,
-2.632987, -0.05259664, -0.6063496, 1, 0, 0, 1, 1,
-2.544052, -0.8156852, -1.484536, 1, 0, 0, 1, 1,
-2.541045, -0.1281056, -1.129025, 1, 0, 0, 1, 1,
-2.494622, 0.2043448, -2.347896, 1, 0, 0, 1, 1,
-2.37256, 0.9881048, -1.214375, 1, 0, 0, 1, 1,
-2.349385, 0.3312277, -2.025113, 0, 0, 0, 1, 1,
-2.344677, 0.3382391, -1.984524, 0, 0, 0, 1, 1,
-2.303015, -0.443952, -0.9557464, 0, 0, 0, 1, 1,
-2.234922, -0.5891985, -2.418326, 0, 0, 0, 1, 1,
-2.193406, 1.250464, -0.3045626, 0, 0, 0, 1, 1,
-2.175573, -0.428779, -2.080682, 0, 0, 0, 1, 1,
-2.115312, 0.0961983, -2.476457, 0, 0, 0, 1, 1,
-2.101764, 0.01872835, -3.239908, 1, 1, 1, 1, 1,
-2.100294, 0.8707139, -2.332426, 1, 1, 1, 1, 1,
-2.075325, -1.303899, -2.637343, 1, 1, 1, 1, 1,
-2.048996, -0.8603961, -1.429133, 1, 1, 1, 1, 1,
-2.043538, -0.5445994, -1.417291, 1, 1, 1, 1, 1,
-2.042988, 1.086988, -2.590253, 1, 1, 1, 1, 1,
-1.962207, 1.495148, -0.8936755, 1, 1, 1, 1, 1,
-1.931769, 0.1396431, -2.69439, 1, 1, 1, 1, 1,
-1.867453, -0.8109484, -2.792528, 1, 1, 1, 1, 1,
-1.861261, 0.2875973, -1.137549, 1, 1, 1, 1, 1,
-1.857368, 0.9113054, -2.119682, 1, 1, 1, 1, 1,
-1.854121, 1.404463, -1.404432, 1, 1, 1, 1, 1,
-1.841894, 1.102775, -2.252914, 1, 1, 1, 1, 1,
-1.836199, 0.2184758, -2.446601, 1, 1, 1, 1, 1,
-1.818185, -1.07144, -2.853657, 1, 1, 1, 1, 1,
-1.800118, 2.077164, -0.9866056, 0, 0, 1, 1, 1,
-1.789719, 0.3966698, -1.003934, 1, 0, 0, 1, 1,
-1.783107, -0.7045937, -1.038438, 1, 0, 0, 1, 1,
-1.776948, -0.8474523, -3.390296, 1, 0, 0, 1, 1,
-1.77427, -0.2293731, -1.926187, 1, 0, 0, 1, 1,
-1.771475, -0.80761, -1.055908, 1, 0, 0, 1, 1,
-1.764972, -0.0246314, -1.065268, 0, 0, 0, 1, 1,
-1.754135, 0.1895017, -1.930659, 0, 0, 0, 1, 1,
-1.745243, -1.344279, -3.452583, 0, 0, 0, 1, 1,
-1.738593, 1.102006, -0.7672482, 0, 0, 0, 1, 1,
-1.723554, 0.1290666, -0.7898785, 0, 0, 0, 1, 1,
-1.710258, -0.344738, -3.23391, 0, 0, 0, 1, 1,
-1.702381, -0.9596636, -2.925392, 0, 0, 0, 1, 1,
-1.700094, -0.2399208, -1.609812, 1, 1, 1, 1, 1,
-1.683757, -0.0641655, -1.541212, 1, 1, 1, 1, 1,
-1.68105, 0.2869001, -2.484063, 1, 1, 1, 1, 1,
-1.67808, 0.7477575, -0.1926104, 1, 1, 1, 1, 1,
-1.658575, 1.327913, -2.716254, 1, 1, 1, 1, 1,
-1.642486, 1.28904, -1.872172, 1, 1, 1, 1, 1,
-1.635429, -1.293054, -0.9336506, 1, 1, 1, 1, 1,
-1.610109, -0.9225668, -3.190277, 1, 1, 1, 1, 1,
-1.603937, -0.4804178, -2.146244, 1, 1, 1, 1, 1,
-1.580967, 0.06865508, -1.151229, 1, 1, 1, 1, 1,
-1.573511, 0.1449274, -1.288732, 1, 1, 1, 1, 1,
-1.558851, 0.1478304, -0.2340281, 1, 1, 1, 1, 1,
-1.553716, 0.6574872, -1.306134, 1, 1, 1, 1, 1,
-1.537735, 0.04363381, -1.440849, 1, 1, 1, 1, 1,
-1.536865, 0.1542709, -0.9204876, 1, 1, 1, 1, 1,
-1.53164, 0.6485658, -1.338936, 0, 0, 1, 1, 1,
-1.528517, 0.0008467, -1.785058, 1, 0, 0, 1, 1,
-1.528171, 1.032485, -0.3563107, 1, 0, 0, 1, 1,
-1.521966, 0.3038113, -1.575418, 1, 0, 0, 1, 1,
-1.514409, -0.5498217, -0.2224714, 1, 0, 0, 1, 1,
-1.514172, 0.1782727, -1.229577, 1, 0, 0, 1, 1,
-1.49535, 1.270866, -1.053186, 0, 0, 0, 1, 1,
-1.478077, -0.3905775, -0.6025202, 0, 0, 0, 1, 1,
-1.467678, 0.7183675, -0.8057674, 0, 0, 0, 1, 1,
-1.466665, 0.4338314, -2.620796, 0, 0, 0, 1, 1,
-1.455776, -1.007859, -2.140737, 0, 0, 0, 1, 1,
-1.453324, -0.466249, -1.985332, 0, 0, 0, 1, 1,
-1.443129, -1.886124, -3.466038, 0, 0, 0, 1, 1,
-1.440834, -1.012371, -2.962297, 1, 1, 1, 1, 1,
-1.433499, 0.2880714, -1.455508, 1, 1, 1, 1, 1,
-1.428038, 1.388437, -0.6575714, 1, 1, 1, 1, 1,
-1.422564, 1.562323, -2.323776, 1, 1, 1, 1, 1,
-1.413777, 0.4058796, -3.758816, 1, 1, 1, 1, 1,
-1.400822, -0.2118158, -0.2483414, 1, 1, 1, 1, 1,
-1.394072, 1.029911, -3.183611, 1, 1, 1, 1, 1,
-1.390232, -1.093138, -0.7832379, 1, 1, 1, 1, 1,
-1.388494, -0.6299388, -0.909686, 1, 1, 1, 1, 1,
-1.388139, -0.1860247, -1.090427, 1, 1, 1, 1, 1,
-1.387856, 0.5277122, -2.21474, 1, 1, 1, 1, 1,
-1.38569, -2.319046, -2.507382, 1, 1, 1, 1, 1,
-1.383873, -0.3334858, -2.717877, 1, 1, 1, 1, 1,
-1.383164, 0.4322177, -0.4554289, 1, 1, 1, 1, 1,
-1.379442, 0.2511322, -2.14848, 1, 1, 1, 1, 1,
-1.3763, 1.409263, -0.3901081, 0, 0, 1, 1, 1,
-1.362591, -1.31661, -1.299525, 1, 0, 0, 1, 1,
-1.359247, -0.3378694, -1.348377, 1, 0, 0, 1, 1,
-1.353294, -1.324418, -2.04518, 1, 0, 0, 1, 1,
-1.349768, 1.010223, -0.3308298, 1, 0, 0, 1, 1,
-1.344553, 1.220535, 0.5078433, 1, 0, 0, 1, 1,
-1.316297, -2.211058, -2.67957, 0, 0, 0, 1, 1,
-1.313028, -0.6370121, -1.699192, 0, 0, 0, 1, 1,
-1.309442, 2.074265, -0.8870085, 0, 0, 0, 1, 1,
-1.304166, 0.07471196, -2.895777, 0, 0, 0, 1, 1,
-1.302401, 1.667343, 0.3653722, 0, 0, 0, 1, 1,
-1.290951, -1.244051, -3.570127, 0, 0, 0, 1, 1,
-1.280755, 0.05936724, 0.1415777, 0, 0, 0, 1, 1,
-1.265745, 0.2948722, -0.6644021, 1, 1, 1, 1, 1,
-1.261341, 0.6429511, -1.565055, 1, 1, 1, 1, 1,
-1.245226, 1.077782, -0.5891086, 1, 1, 1, 1, 1,
-1.24399, -0.406846, -1.703678, 1, 1, 1, 1, 1,
-1.220617, 1.02142, -1.101159, 1, 1, 1, 1, 1,
-1.220321, 0.3016259, -0.1577259, 1, 1, 1, 1, 1,
-1.17545, -1.300436, -1.339075, 1, 1, 1, 1, 1,
-1.173488, 0.9599195, -0.7178951, 1, 1, 1, 1, 1,
-1.162469, -0.3326244, -0.6406777, 1, 1, 1, 1, 1,
-1.162163, -0.5916739, -2.66508, 1, 1, 1, 1, 1,
-1.162063, 1.806916, -1.657711, 1, 1, 1, 1, 1,
-1.152669, 0.4012032, -0.620795, 1, 1, 1, 1, 1,
-1.148168, 0.7652926, -0.006907255, 1, 1, 1, 1, 1,
-1.135466, -0.7167998, -2.939581, 1, 1, 1, 1, 1,
-1.129855, -1.065019, -1.548545, 1, 1, 1, 1, 1,
-1.122554, -0.7446507, -3.059263, 0, 0, 1, 1, 1,
-1.120729, -0.2512192, -3.483397, 1, 0, 0, 1, 1,
-1.118531, 0.5655535, -2.654864, 1, 0, 0, 1, 1,
-1.115386, -2.431576, -2.577584, 1, 0, 0, 1, 1,
-1.103888, 0.4334475, -2.532597, 1, 0, 0, 1, 1,
-1.100211, -0.4562351, -1.232205, 1, 0, 0, 1, 1,
-1.091119, 0.9823523, -0.9122591, 0, 0, 0, 1, 1,
-1.083801, -0.1688197, -2.256019, 0, 0, 0, 1, 1,
-1.08144, 0.04823714, -0.7589373, 0, 0, 0, 1, 1,
-1.078613, 1.11415, -0.05517784, 0, 0, 0, 1, 1,
-1.074388, -1.441521, -1.484195, 0, 0, 0, 1, 1,
-1.064319, -0.3053099, -2.174124, 0, 0, 0, 1, 1,
-1.063112, -1.043501, -2.552633, 0, 0, 0, 1, 1,
-1.062613, -0.2666183, -3.201256, 1, 1, 1, 1, 1,
-1.06219, 0.810446, -2.346019, 1, 1, 1, 1, 1,
-1.052646, 1.38904, -0.3442876, 1, 1, 1, 1, 1,
-1.051226, -1.242575, -1.605721, 1, 1, 1, 1, 1,
-1.050299, 1.166431, 0.2207588, 1, 1, 1, 1, 1,
-1.04349, -1.186105, -1.335418, 1, 1, 1, 1, 1,
-1.04174, -0.258385, -3.119334, 1, 1, 1, 1, 1,
-1.041529, -0.3445685, -1.508454, 1, 1, 1, 1, 1,
-1.040682, -1.037829, -0.8543654, 1, 1, 1, 1, 1,
-1.040151, -1.488038, -3.456735, 1, 1, 1, 1, 1,
-1.038278, -0.9647369, -1.530299, 1, 1, 1, 1, 1,
-1.031864, -0.9007813, -2.635119, 1, 1, 1, 1, 1,
-1.020872, 0.5051688, -0.947548, 1, 1, 1, 1, 1,
-1.016477, -1.920931, -2.366157, 1, 1, 1, 1, 1,
-1.000834, 0.9412164, -1.797986, 1, 1, 1, 1, 1,
-0.9999933, -0.5275944, -4.460402, 0, 0, 1, 1, 1,
-0.997646, 0.8507085, -2.872131, 1, 0, 0, 1, 1,
-0.9971568, 1.536, -0.7334979, 1, 0, 0, 1, 1,
-0.9968579, 0.05903042, -1.210495, 1, 0, 0, 1, 1,
-0.9945231, 2.319319, 1.486438, 1, 0, 0, 1, 1,
-0.9923277, 0.5444089, -1.611202, 1, 0, 0, 1, 1,
-0.9857819, 0.9862258, -2.15221, 0, 0, 0, 1, 1,
-0.9841207, -0.06483917, -0.5752624, 0, 0, 0, 1, 1,
-0.9773554, -1.038238, -4.630044, 0, 0, 0, 1, 1,
-0.976177, 1.519158, 2.248781, 0, 0, 0, 1, 1,
-0.9748196, -1.803016, -2.016222, 0, 0, 0, 1, 1,
-0.9731956, -0.8092059, -1.733132, 0, 0, 0, 1, 1,
-0.9730057, 0.5962543, -2.243682, 0, 0, 0, 1, 1,
-0.9720094, -0.08933069, -0.7121512, 1, 1, 1, 1, 1,
-0.9719232, -0.9194552, -3.030785, 1, 1, 1, 1, 1,
-0.9706692, -0.8268077, -2.438891, 1, 1, 1, 1, 1,
-0.9686028, 0.4394977, -1.573068, 1, 1, 1, 1, 1,
-0.9632202, 1.997128, -0.5011479, 1, 1, 1, 1, 1,
-0.9557073, 0.09575673, -1.589172, 1, 1, 1, 1, 1,
-0.9524654, -0.4338478, -2.811936, 1, 1, 1, 1, 1,
-0.9483793, -0.4225286, -0.6062789, 1, 1, 1, 1, 1,
-0.9455189, -0.1340486, -2.038315, 1, 1, 1, 1, 1,
-0.9449705, -0.3374678, -1.647995, 1, 1, 1, 1, 1,
-0.9407025, 0.7305118, 1.61273, 1, 1, 1, 1, 1,
-0.939464, 0.2977136, -1.355108, 1, 1, 1, 1, 1,
-0.9335535, -0.8818881, -3.054724, 1, 1, 1, 1, 1,
-0.9277231, -0.3493251, -0.4441355, 1, 1, 1, 1, 1,
-0.9252774, -0.2396956, -1.873168, 1, 1, 1, 1, 1,
-0.9223623, -1.326677, -1.95384, 0, 0, 1, 1, 1,
-0.9184963, -2.006573, -2.084887, 1, 0, 0, 1, 1,
-0.8959448, -0.06134324, 0.1403293, 1, 0, 0, 1, 1,
-0.8930174, 0.431526, -1.121079, 1, 0, 0, 1, 1,
-0.8916904, -0.1023486, -0.564784, 1, 0, 0, 1, 1,
-0.8818172, -1.354089, -2.45943, 1, 0, 0, 1, 1,
-0.8722353, -0.4870237, -1.494795, 0, 0, 0, 1, 1,
-0.8719739, 0.5964235, -1.132649, 0, 0, 0, 1, 1,
-0.8662074, 0.4175842, -3.545697, 0, 0, 0, 1, 1,
-0.8560664, -0.2724995, -2.586255, 0, 0, 0, 1, 1,
-0.8545745, 1.365019, -1.511705, 0, 0, 0, 1, 1,
-0.853131, -1.746799, -4.312669, 0, 0, 0, 1, 1,
-0.8511155, -0.02304609, -2.391102, 0, 0, 0, 1, 1,
-0.8507825, 1.099197, -0.6653118, 1, 1, 1, 1, 1,
-0.8468766, -0.1669326, -2.765353, 1, 1, 1, 1, 1,
-0.8398846, -0.4408373, -0.4134054, 1, 1, 1, 1, 1,
-0.8348975, -0.4452521, -3.674188, 1, 1, 1, 1, 1,
-0.832865, -1.098835, -1.190342, 1, 1, 1, 1, 1,
-0.8325054, 0.1266444, -1.305297, 1, 1, 1, 1, 1,
-0.8321034, 1.614982, 0.2678514, 1, 1, 1, 1, 1,
-0.831995, 0.2034575, -1.297151, 1, 1, 1, 1, 1,
-0.8250143, 0.2203051, 0.5335339, 1, 1, 1, 1, 1,
-0.8202469, 0.7225518, -1.441391, 1, 1, 1, 1, 1,
-0.8177873, 0.09082515, -1.71205, 1, 1, 1, 1, 1,
-0.8150305, -0.4558783, -2.652253, 1, 1, 1, 1, 1,
-0.8148056, -1.160882, -1.683417, 1, 1, 1, 1, 1,
-0.805568, -0.8150269, -1.898281, 1, 1, 1, 1, 1,
-0.8000637, -0.4714035, -3.355366, 1, 1, 1, 1, 1,
-0.792034, -0.6951753, -0.6401894, 0, 0, 1, 1, 1,
-0.7841616, -1.032617, -1.654484, 1, 0, 0, 1, 1,
-0.7792289, 0.3888316, -1.990837, 1, 0, 0, 1, 1,
-0.7745721, 0.5967383, -2.245915, 1, 0, 0, 1, 1,
-0.7711348, 0.1207255, -1.988782, 1, 0, 0, 1, 1,
-0.7699032, 0.9597799, 0.2429034, 1, 0, 0, 1, 1,
-0.7658798, 0.2617051, -1.857409, 0, 0, 0, 1, 1,
-0.7644994, -0.3097918, -2.034727, 0, 0, 0, 1, 1,
-0.7578914, 0.931866, -0.8034703, 0, 0, 0, 1, 1,
-0.7575461, -0.3532725, -3.847982, 0, 0, 0, 1, 1,
-0.7542028, 2.272184, 0.8386683, 0, 0, 0, 1, 1,
-0.7493866, -0.6428483, -3.246922, 0, 0, 0, 1, 1,
-0.7467678, -1.770281, -3.647959, 0, 0, 0, 1, 1,
-0.7406154, -0.1193415, -0.9165045, 1, 1, 1, 1, 1,
-0.7366743, 0.1626476, -0.143842, 1, 1, 1, 1, 1,
-0.7362081, 0.7327237, 0.06249307, 1, 1, 1, 1, 1,
-0.7343414, 0.3179127, -1.063932, 1, 1, 1, 1, 1,
-0.7311217, 2.54269, -0.7492138, 1, 1, 1, 1, 1,
-0.7283534, -0.6577018, -2.513389, 1, 1, 1, 1, 1,
-0.7270828, 0.8046137, -1.27843, 1, 1, 1, 1, 1,
-0.7176762, -0.04833313, -1.906096, 1, 1, 1, 1, 1,
-0.7169696, 0.2919089, -1.414247, 1, 1, 1, 1, 1,
-0.7055006, 0.526499, -0.9015798, 1, 1, 1, 1, 1,
-0.7049794, -1.003083, -2.643771, 1, 1, 1, 1, 1,
-0.704563, -0.05925633, -2.475334, 1, 1, 1, 1, 1,
-0.6947849, 0.8154679, 0.3605687, 1, 1, 1, 1, 1,
-0.6937063, -0.03296217, -1.255572, 1, 1, 1, 1, 1,
-0.691584, -0.3424142, -0.7116431, 1, 1, 1, 1, 1,
-0.6851172, -1.381983, -1.847738, 0, 0, 1, 1, 1,
-0.681072, 1.104795, -0.4684671, 1, 0, 0, 1, 1,
-0.6740927, -0.7027954, -2.515945, 1, 0, 0, 1, 1,
-0.6729347, -2.166175, -3.803734, 1, 0, 0, 1, 1,
-0.6682881, 0.9525957, -0.4911673, 1, 0, 0, 1, 1,
-0.6669498, -1.106626, -0.5045084, 1, 0, 0, 1, 1,
-0.6598774, 0.8211243, -0.2671106, 0, 0, 0, 1, 1,
-0.6545997, 0.5715216, -0.8259018, 0, 0, 0, 1, 1,
-0.6545276, -0.1070945, -1.570283, 0, 0, 0, 1, 1,
-0.650799, -1.674751, -1.367426, 0, 0, 0, 1, 1,
-0.6492525, 1.164698, -0.9852832, 0, 0, 0, 1, 1,
-0.6483958, -0.8898352, -2.421569, 0, 0, 0, 1, 1,
-0.6459585, 0.5216568, -1.264889, 0, 0, 0, 1, 1,
-0.6418195, 1.056658, 0.02601452, 1, 1, 1, 1, 1,
-0.6417931, 3.118437, -0.947262, 1, 1, 1, 1, 1,
-0.639554, 0.7114524, -1.835997, 1, 1, 1, 1, 1,
-0.6390802, -0.4140029, -0.9662082, 1, 1, 1, 1, 1,
-0.6351978, -0.5321691, -2.895686, 1, 1, 1, 1, 1,
-0.632687, -1.972771, -3.228316, 1, 1, 1, 1, 1,
-0.6265886, -0.7603843, -3.55245, 1, 1, 1, 1, 1,
-0.6258048, -0.170064, -1.709623, 1, 1, 1, 1, 1,
-0.6256768, 0.3382252, -1.134312, 1, 1, 1, 1, 1,
-0.6218462, 0.5100898, 0.8639, 1, 1, 1, 1, 1,
-0.6179658, -0.2472896, -0.9674354, 1, 1, 1, 1, 1,
-0.6178167, 0.2435047, -0.8499894, 1, 1, 1, 1, 1,
-0.6160571, -0.007093891, -2.698114, 1, 1, 1, 1, 1,
-0.5962939, 0.1793718, -1.644497, 1, 1, 1, 1, 1,
-0.5906699, -2.346713, 0.186017, 1, 1, 1, 1, 1,
-0.5899783, 0.1173422, -1.565858, 0, 0, 1, 1, 1,
-0.5882856, 0.95917, -2.706363, 1, 0, 0, 1, 1,
-0.5864148, -1.848147, -2.822953, 1, 0, 0, 1, 1,
-0.5852503, 0.486682, -2.637118, 1, 0, 0, 1, 1,
-0.5844474, -0.05275516, -1.247039, 1, 0, 0, 1, 1,
-0.5827051, -0.4412407, -2.073234, 1, 0, 0, 1, 1,
-0.5795078, 0.9830646, 0.2941349, 0, 0, 0, 1, 1,
-0.5775377, -0.4856662, -2.100048, 0, 0, 0, 1, 1,
-0.577382, 0.2841392, -1.383682, 0, 0, 0, 1, 1,
-0.5773097, 0.3377025, -3.099801, 0, 0, 0, 1, 1,
-0.5698223, -2.142383, -1.492586, 0, 0, 0, 1, 1,
-0.5690221, -0.1245313, -3.197874, 0, 0, 0, 1, 1,
-0.5684351, 0.4966804, -1.806291, 0, 0, 0, 1, 1,
-0.5679904, -0.3765654, -2.627604, 1, 1, 1, 1, 1,
-0.5676708, 0.8477228, -0.4485573, 1, 1, 1, 1, 1,
-0.5660635, -2.094519, -3.400545, 1, 1, 1, 1, 1,
-0.5594321, -0.4036911, -1.303205, 1, 1, 1, 1, 1,
-0.5515557, 0.9461777, 0.1026932, 1, 1, 1, 1, 1,
-0.5513361, -0.02078497, -1.410411, 1, 1, 1, 1, 1,
-0.5466976, 2.004059, 0.4573663, 1, 1, 1, 1, 1,
-0.5463969, 2.485574, 0.3746751, 1, 1, 1, 1, 1,
-0.5454302, 0.5800715, -0.8683572, 1, 1, 1, 1, 1,
-0.5381452, -0.3597685, -2.589387, 1, 1, 1, 1, 1,
-0.536157, -0.7612954, -3.736567, 1, 1, 1, 1, 1,
-0.5346278, -0.6663493, -3.652346, 1, 1, 1, 1, 1,
-0.5195833, 0.8366274, 0.5499952, 1, 1, 1, 1, 1,
-0.5188037, 0.9231983, 0.1094953, 1, 1, 1, 1, 1,
-0.5161895, -0.03467526, -2.231132, 1, 1, 1, 1, 1,
-0.515674, -0.8881968, -2.570813, 0, 0, 1, 1, 1,
-0.5117829, 1.206691, -1.488296, 1, 0, 0, 1, 1,
-0.5074127, 0.5155705, 0.742202, 1, 0, 0, 1, 1,
-0.5000688, 0.1917203, -1.27015, 1, 0, 0, 1, 1,
-0.495041, 2.029624, 0.7171134, 1, 0, 0, 1, 1,
-0.4803968, -0.07239882, -1.085522, 1, 0, 0, 1, 1,
-0.4738279, 2.212484, -0.342121, 0, 0, 0, 1, 1,
-0.4690336, 1.625046, 0.8532231, 0, 0, 0, 1, 1,
-0.4633943, -0.8622206, -2.506886, 0, 0, 0, 1, 1,
-0.4561904, -1.019262, -2.458896, 0, 0, 0, 1, 1,
-0.4541889, -2.180611, -3.797659, 0, 0, 0, 1, 1,
-0.4515577, 0.6654515, 0.3045986, 0, 0, 0, 1, 1,
-0.4506364, -0.1128438, -1.764542, 0, 0, 0, 1, 1,
-0.4447805, -0.9601645, -2.345827, 1, 1, 1, 1, 1,
-0.4428439, -0.1311496, -0.6841584, 1, 1, 1, 1, 1,
-0.4427474, -1.862125, -4.998978, 1, 1, 1, 1, 1,
-0.4333078, 1.150087, 0.331203, 1, 1, 1, 1, 1,
-0.4330448, -1.528237, -3.681069, 1, 1, 1, 1, 1,
-0.4327303, 0.7383088, 0.8919054, 1, 1, 1, 1, 1,
-0.4307691, -0.1696693, -1.02416, 1, 1, 1, 1, 1,
-0.4284436, -1.160388, -2.827166, 1, 1, 1, 1, 1,
-0.4266832, -0.7341021, -3.020492, 1, 1, 1, 1, 1,
-0.4241772, 1.454781, -0.663625, 1, 1, 1, 1, 1,
-0.4147478, 0.4507399, -0.01274549, 1, 1, 1, 1, 1,
-0.411165, -0.4731707, -4.735961, 1, 1, 1, 1, 1,
-0.408283, -0.9207755, -2.907989, 1, 1, 1, 1, 1,
-0.4077115, 0.8110065, -0.486906, 1, 1, 1, 1, 1,
-0.4067263, 0.8301465, -0.2276232, 1, 1, 1, 1, 1,
-0.4015645, 0.5026466, -0.438225, 0, 0, 1, 1, 1,
-0.4008108, -0.4620936, -2.05844, 1, 0, 0, 1, 1,
-0.4006393, -0.07569951, -1.780208, 1, 0, 0, 1, 1,
-0.4002654, -0.03477794, -0.05807345, 1, 0, 0, 1, 1,
-0.3928218, 0.3547567, -1.625613, 1, 0, 0, 1, 1,
-0.3915741, -0.4186743, -2.705455, 1, 0, 0, 1, 1,
-0.3904353, 0.7510381, 1.100207, 0, 0, 0, 1, 1,
-0.3900609, -0.2972053, -2.465383, 0, 0, 0, 1, 1,
-0.3882624, -0.1481648, -1.984415, 0, 0, 0, 1, 1,
-0.3846046, -1.285077, -2.872063, 0, 0, 0, 1, 1,
-0.3839691, -1.044106, -3.111378, 0, 0, 0, 1, 1,
-0.3810144, 0.3605555, -1.117279, 0, 0, 0, 1, 1,
-0.3766759, 1.398157, -0.8035221, 0, 0, 0, 1, 1,
-0.3734621, 1.078882, -1.580095, 1, 1, 1, 1, 1,
-0.3695186, -0.01927773, -2.65474, 1, 1, 1, 1, 1,
-0.366439, 0.1089276, -2.243363, 1, 1, 1, 1, 1,
-0.3657213, -0.4762117, -2.721244, 1, 1, 1, 1, 1,
-0.3644414, 1.863094, 0.4173004, 1, 1, 1, 1, 1,
-0.3596788, 0.3002784, 0.001667391, 1, 1, 1, 1, 1,
-0.3594694, 0.02223518, -1.049872, 1, 1, 1, 1, 1,
-0.3591267, -0.427372, -1.368283, 1, 1, 1, 1, 1,
-0.3588766, -0.6286823, -3.263536, 1, 1, 1, 1, 1,
-0.355599, -0.8205586, -1.646463, 1, 1, 1, 1, 1,
-0.354389, 0.6771716, -1.049103, 1, 1, 1, 1, 1,
-0.3495962, 0.163494, -0.9273716, 1, 1, 1, 1, 1,
-0.3493598, -0.6752052, -3.264886, 1, 1, 1, 1, 1,
-0.3478338, -1.891816, -2.774485, 1, 1, 1, 1, 1,
-0.3349756, 0.3220207, 0.6360993, 1, 1, 1, 1, 1,
-0.3328795, 1.158721, -0.8412583, 0, 0, 1, 1, 1,
-0.3318866, -0.4337067, -2.429333, 1, 0, 0, 1, 1,
-0.3305689, -0.2591242, -2.539445, 1, 0, 0, 1, 1,
-0.3276082, -2.337436, -2.43369, 1, 0, 0, 1, 1,
-0.3186648, 1.235375, -2.364972, 1, 0, 0, 1, 1,
-0.3172256, -0.3089667, -2.291306, 1, 0, 0, 1, 1,
-0.3146448, -0.3743995, -3.3653, 0, 0, 0, 1, 1,
-0.3131264, 0.334409, -1.887428, 0, 0, 0, 1, 1,
-0.3121069, 0.2082146, -2.063594, 0, 0, 0, 1, 1,
-0.308884, 0.3443483, -1.772976, 0, 0, 0, 1, 1,
-0.3013143, -0.4334239, -1.334422, 0, 0, 0, 1, 1,
-0.2997314, -0.7822344, -2.430953, 0, 0, 0, 1, 1,
-0.2973695, -0.6660914, -2.095572, 0, 0, 0, 1, 1,
-0.2927989, 0.1698551, -2.20788, 1, 1, 1, 1, 1,
-0.2904446, 1.539085, -0.7771696, 1, 1, 1, 1, 1,
-0.2834491, 0.885601, -0.9020047, 1, 1, 1, 1, 1,
-0.282482, -0.2007483, -2.050505, 1, 1, 1, 1, 1,
-0.2818487, -0.5461301, -2.701185, 1, 1, 1, 1, 1,
-0.279755, 0.5279175, -0.636906, 1, 1, 1, 1, 1,
-0.2764467, 0.5105855, -1.570923, 1, 1, 1, 1, 1,
-0.2735239, -1.666189, -3.406076, 1, 1, 1, 1, 1,
-0.2734413, 0.4239574, -0.3159394, 1, 1, 1, 1, 1,
-0.2681861, -0.7424386, -3.401803, 1, 1, 1, 1, 1,
-0.2677728, 0.0376619, -0.6892878, 1, 1, 1, 1, 1,
-0.267305, -1.107295, -2.274364, 1, 1, 1, 1, 1,
-0.2668751, 1.278957, -1.216753, 1, 1, 1, 1, 1,
-0.2661636, 0.1300575, 0.613588, 1, 1, 1, 1, 1,
-0.2656586, 0.4296233, 1.251305, 1, 1, 1, 1, 1,
-0.2641173, -1.398509, -2.354789, 0, 0, 1, 1, 1,
-0.2639849, -0.3170902, -3.244799, 1, 0, 0, 1, 1,
-0.263317, -1.666773, -3.340019, 1, 0, 0, 1, 1,
-0.2585174, -0.4611758, -3.886293, 1, 0, 0, 1, 1,
-0.255263, -1.698898, -1.190215, 1, 0, 0, 1, 1,
-0.255261, -1.836362, -3.012344, 1, 0, 0, 1, 1,
-0.2511241, -0.02334963, -3.551379, 0, 0, 0, 1, 1,
-0.2455155, -0.3564566, -0.8499555, 0, 0, 0, 1, 1,
-0.2424735, 0.4701802, 0.3745056, 0, 0, 0, 1, 1,
-0.2397026, 0.2913244, -1.039992, 0, 0, 0, 1, 1,
-0.2350591, 0.6628845, 2.000886, 0, 0, 0, 1, 1,
-0.234672, 0.3282282, -0.391009, 0, 0, 0, 1, 1,
-0.2324145, 0.0933739, -1.448435, 0, 0, 0, 1, 1,
-0.2323934, -1.214352, -3.33547, 1, 1, 1, 1, 1,
-0.2289415, 1.638927, -0.2445209, 1, 1, 1, 1, 1,
-0.2267377, -0.6138378, -1.343035, 1, 1, 1, 1, 1,
-0.2252365, 0.9644688, 0.05776724, 1, 1, 1, 1, 1,
-0.2150817, -2.639644, -3.087165, 1, 1, 1, 1, 1,
-0.2130545, -0.3342771, -4.003065, 1, 1, 1, 1, 1,
-0.2120628, -1.032038, -3.469364, 1, 1, 1, 1, 1,
-0.2082124, 0.9719381, -0.6892492, 1, 1, 1, 1, 1,
-0.2080737, -0.4491407, -5.60733, 1, 1, 1, 1, 1,
-0.2031451, 0.3824754, -0.120262, 1, 1, 1, 1, 1,
-0.2021201, 1.200462, -0.04206178, 1, 1, 1, 1, 1,
-0.1987678, 0.04958114, -1.790452, 1, 1, 1, 1, 1,
-0.1986371, -1.314974, -3.258779, 1, 1, 1, 1, 1,
-0.1978284, 0.105564, -1.468938, 1, 1, 1, 1, 1,
-0.1935495, 0.1926675, -0.1918886, 1, 1, 1, 1, 1,
-0.1853326, -0.09637627, -1.840185, 0, 0, 1, 1, 1,
-0.1841328, -0.8349813, -3.297808, 1, 0, 0, 1, 1,
-0.18261, 0.7497488, 0.4429815, 1, 0, 0, 1, 1,
-0.1818128, 1.406086, -0.9347757, 1, 0, 0, 1, 1,
-0.180359, -1.442544, -3.686682, 1, 0, 0, 1, 1,
-0.1615325, -2.300288, -2.371836, 1, 0, 0, 1, 1,
-0.157359, 2.191906, -0.4379799, 0, 0, 0, 1, 1,
-0.1570083, 1.470246, -0.04945887, 0, 0, 0, 1, 1,
-0.1531481, 0.9342337, 0.9555315, 0, 0, 0, 1, 1,
-0.1518256, -0.5122627, -1.490419, 0, 0, 0, 1, 1,
-0.1478214, 0.4160596, -0.1041609, 0, 0, 0, 1, 1,
-0.1463725, 0.6691938, 1.043378, 0, 0, 0, 1, 1,
-0.1456137, 1.376495, -0.1999594, 0, 0, 0, 1, 1,
-0.1428005, 0.4589263, -0.198982, 1, 1, 1, 1, 1,
-0.1425659, -0.6790803, -2.021361, 1, 1, 1, 1, 1,
-0.1391624, 0.7328559, 1.170924, 1, 1, 1, 1, 1,
-0.1384719, 0.2734823, -1.197532, 1, 1, 1, 1, 1,
-0.1361205, 0.09980218, -1.745664, 1, 1, 1, 1, 1,
-0.1351765, 0.7373609, -0.1509822, 1, 1, 1, 1, 1,
-0.132634, -1.046877, -3.388865, 1, 1, 1, 1, 1,
-0.1306471, -0.2921936, -2.555306, 1, 1, 1, 1, 1,
-0.1289491, -1.563495, -3.462384, 1, 1, 1, 1, 1,
-0.1285098, -0.1048762, -1.948088, 1, 1, 1, 1, 1,
-0.1238708, -0.8930678, -3.529761, 1, 1, 1, 1, 1,
-0.1195711, -0.06670526, -0.9829283, 1, 1, 1, 1, 1,
-0.1178522, 0.05897116, -1.615809, 1, 1, 1, 1, 1,
-0.116564, -0.8948715, -0.9790223, 1, 1, 1, 1, 1,
-0.1144801, 1.962889, -0.7451805, 1, 1, 1, 1, 1,
-0.1106569, -1.034929, -2.655539, 0, 0, 1, 1, 1,
-0.09860203, 0.8545998, -0.3248996, 1, 0, 0, 1, 1,
-0.0977409, 0.7808808, -0.9189305, 1, 0, 0, 1, 1,
-0.09748248, -1.136951, -2.428818, 1, 0, 0, 1, 1,
-0.09272918, 1.365947, -0.1027539, 1, 0, 0, 1, 1,
-0.0916606, -0.06339739, -1.729696, 1, 0, 0, 1, 1,
-0.08795337, -1.574876, -3.051187, 0, 0, 0, 1, 1,
-0.08218978, -0.7404122, -4.186272, 0, 0, 0, 1, 1,
-0.07758217, 1.920133, -1.844619, 0, 0, 0, 1, 1,
-0.07408129, -0.7882395, -2.544052, 0, 0, 0, 1, 1,
-0.07223735, 1.519172, 0.8577017, 0, 0, 0, 1, 1,
-0.06735357, -1.612943, -3.196681, 0, 0, 0, 1, 1,
-0.06596633, 1.445414, -0.2732618, 0, 0, 0, 1, 1,
-0.06468906, 1.539331, -0.1858574, 1, 1, 1, 1, 1,
-0.06249537, 0.1169923, 0.3363611, 1, 1, 1, 1, 1,
-0.06087847, 0.5934018, -0.05044072, 1, 1, 1, 1, 1,
-0.06020047, -0.5638492, -2.483641, 1, 1, 1, 1, 1,
-0.05595856, 0.6471722, 0.8652061, 1, 1, 1, 1, 1,
-0.05394262, -0.0157655, -0.8985594, 1, 1, 1, 1, 1,
-0.05132772, 0.2511226, -1.626533, 1, 1, 1, 1, 1,
-0.05024754, 0.01915484, -2.333533, 1, 1, 1, 1, 1,
-0.04735707, 0.5331219, 1.899981, 1, 1, 1, 1, 1,
-0.04673534, 0.9972755, -1.72231, 1, 1, 1, 1, 1,
-0.04359124, -0.1452141, -2.259348, 1, 1, 1, 1, 1,
-0.03726958, 1.480061, -0.9989226, 1, 1, 1, 1, 1,
-0.03711445, -0.2518556, -4.21745, 1, 1, 1, 1, 1,
-0.03273267, 0.305939, 1.0408, 1, 1, 1, 1, 1,
-0.03220326, -0.06475433, -3.267963, 1, 1, 1, 1, 1,
-0.02951799, 2.52522, -0.5543682, 0, 0, 1, 1, 1,
-0.02865247, -0.1238132, -1.714612, 1, 0, 0, 1, 1,
-0.02478493, -1.399591, -1.392493, 1, 0, 0, 1, 1,
-0.02328503, -0.8203905, -3.675321, 1, 0, 0, 1, 1,
-0.02172416, 0.5825641, -1.052094, 1, 0, 0, 1, 1,
-0.02083517, 0.8083224, 0.4577243, 1, 0, 0, 1, 1,
-0.02063369, 0.003291785, -1.864863, 0, 0, 0, 1, 1,
-0.01977308, 0.9883278, -0.1864857, 0, 0, 0, 1, 1,
-0.01688255, 0.6154518, 1.119607, 0, 0, 0, 1, 1,
-0.01674235, -0.3835781, -1.970622, 0, 0, 0, 1, 1,
-0.0142374, -1.324034, -2.908923, 0, 0, 0, 1, 1,
-0.01242037, -0.07711923, -2.666927, 0, 0, 0, 1, 1,
-0.008657404, 1.346962, 0.006072524, 0, 0, 0, 1, 1,
-0.00822081, 1.412853, -0.5393569, 1, 1, 1, 1, 1,
-0.007736906, -0.2941563, -2.687089, 1, 1, 1, 1, 1,
-0.006117603, 0.4289783, -0.6388984, 1, 1, 1, 1, 1,
-0.004354939, -1.395925, -3.308112, 1, 1, 1, 1, 1,
-0.003927718, -0.824131, -0.7553767, 1, 1, 1, 1, 1,
-0.003619041, -1.452507, -4.837392, 1, 1, 1, 1, 1,
-0.001223562, 1.282877, 1.154224, 1, 1, 1, 1, 1,
-0.0003839263, 0.4245932, 0.04037086, 1, 1, 1, 1, 1,
0.0008237471, -0.575752, 5.233359, 1, 1, 1, 1, 1,
0.0009688313, 0.04666767, 0.119583, 1, 1, 1, 1, 1,
0.001088052, 1.810197, -0.09397563, 1, 1, 1, 1, 1,
0.001644675, 0.7022743, 1.274201, 1, 1, 1, 1, 1,
0.003563985, -0.3993376, 5.514354, 1, 1, 1, 1, 1,
0.004216169, 0.1730354, 0.9931874, 1, 1, 1, 1, 1,
0.004783196, -1.434184, 2.607913, 1, 1, 1, 1, 1,
0.005425445, 0.5763031, 1.909382, 0, 0, 1, 1, 1,
0.006373172, 0.7729074, 0.8688869, 1, 0, 0, 1, 1,
0.006456167, 0.7516624, 1.473366, 1, 0, 0, 1, 1,
0.008266938, -0.01124475, 1.897102, 1, 0, 0, 1, 1,
0.009759381, 1.402611, -0.111132, 1, 0, 0, 1, 1,
0.01061167, -0.3863431, 3.819999, 1, 0, 0, 1, 1,
0.01124709, 1.397769, -0.2552259, 0, 0, 0, 1, 1,
0.012916, 0.2475105, 0.04917794, 0, 0, 0, 1, 1,
0.01453037, 0.9595794, 1.194215, 0, 0, 0, 1, 1,
0.01904428, 0.9541083, 1.913493, 0, 0, 0, 1, 1,
0.0271496, -0.1355461, 3.496971, 0, 0, 0, 1, 1,
0.02911565, 1.657047, -0.8597803, 0, 0, 0, 1, 1,
0.03123481, 0.9520023, 1.07421, 0, 0, 0, 1, 1,
0.0362118, 0.9039281, 0.2760323, 1, 1, 1, 1, 1,
0.03646735, -3.055065, 4.316487, 1, 1, 1, 1, 1,
0.04924664, 0.3618091, 0.6418729, 1, 1, 1, 1, 1,
0.04995699, -0.4740768, 3.274481, 1, 1, 1, 1, 1,
0.05083048, -0.7921922, 4.232113, 1, 1, 1, 1, 1,
0.05262787, 1.924232, -0.3912227, 1, 1, 1, 1, 1,
0.05583193, 1.617208, 1.277159, 1, 1, 1, 1, 1,
0.05731446, 0.3180895, -0.9515766, 1, 1, 1, 1, 1,
0.05970667, -0.363305, 1.829505, 1, 1, 1, 1, 1,
0.06488538, 0.04975842, 1.576051, 1, 1, 1, 1, 1,
0.06749281, -1.159437, 4.814938, 1, 1, 1, 1, 1,
0.07347425, -0.04466665, 2.021195, 1, 1, 1, 1, 1,
0.07666828, 0.1458128, -0.3905245, 1, 1, 1, 1, 1,
0.07993135, 0.7170734, 1.380105, 1, 1, 1, 1, 1,
0.08108544, -1.813971, 4.012131, 1, 1, 1, 1, 1,
0.08131456, 0.4915333, -0.6947, 0, 0, 1, 1, 1,
0.08170246, 0.6218727, 0.8251271, 1, 0, 0, 1, 1,
0.0837883, -0.2053393, 3.860058, 1, 0, 0, 1, 1,
0.08685784, 1.330295, 0.6526964, 1, 0, 0, 1, 1,
0.08753407, -0.07498248, 1.457445, 1, 0, 0, 1, 1,
0.09011757, -0.06040489, 1.195974, 1, 0, 0, 1, 1,
0.09422564, 0.5169084, -0.1602377, 0, 0, 0, 1, 1,
0.09676075, -1.000351, 5.339482, 0, 0, 0, 1, 1,
0.09691255, 0.1105235, 1.757196, 0, 0, 0, 1, 1,
0.09759968, -1.885463, 1.659923, 0, 0, 0, 1, 1,
0.107868, -0.7740119, 3.82844, 0, 0, 0, 1, 1,
0.1081925, -0.5998786, 3.581526, 0, 0, 0, 1, 1,
0.1085185, 1.822642, 1.257223, 0, 0, 0, 1, 1,
0.1160309, 0.6890383, 1.495858, 1, 1, 1, 1, 1,
0.1161991, -0.6732249, 2.784642, 1, 1, 1, 1, 1,
0.1172933, -3.268954, 3.374194, 1, 1, 1, 1, 1,
0.1174472, -0.02564333, 1.531481, 1, 1, 1, 1, 1,
0.117644, 0.5758209, -0.08494072, 1, 1, 1, 1, 1,
0.1213507, -0.2296793, 4.076001, 1, 1, 1, 1, 1,
0.1224737, 0.3285538, -0.001933966, 1, 1, 1, 1, 1,
0.1227818, 0.6056755, 0.3747107, 1, 1, 1, 1, 1,
0.1274487, 0.9708188, 0.3179778, 1, 1, 1, 1, 1,
0.1285961, -1.014886, 1.666428, 1, 1, 1, 1, 1,
0.1288731, 2.385397, 0.4375395, 1, 1, 1, 1, 1,
0.1290672, -0.788798, 3.803462, 1, 1, 1, 1, 1,
0.129843, -0.8281839, 5.150668, 1, 1, 1, 1, 1,
0.1343282, -0.5336347, 1.632697, 1, 1, 1, 1, 1,
0.1389739, -1.449658, 3.778908, 1, 1, 1, 1, 1,
0.1423097, -0.3178923, 1.245503, 0, 0, 1, 1, 1,
0.1478096, -0.4152795, 1.28169, 1, 0, 0, 1, 1,
0.1493892, 1.074853, -0.5272746, 1, 0, 0, 1, 1,
0.1510071, 0.4520833, 1.13687, 1, 0, 0, 1, 1,
0.1527255, -0.1154322, 2.077828, 1, 0, 0, 1, 1,
0.1550227, 0.3978269, 1.221887, 1, 0, 0, 1, 1,
0.1583735, 0.4983163, 0.4071888, 0, 0, 0, 1, 1,
0.1598265, 0.2780082, -0.02601689, 0, 0, 0, 1, 1,
0.1600545, -0.6848257, 3.939826, 0, 0, 0, 1, 1,
0.1603138, -1.9369, 4.027927, 0, 0, 0, 1, 1,
0.1615469, -0.7106469, 4.319118, 0, 0, 0, 1, 1,
0.1615818, 1.193575, 2.15337, 0, 0, 0, 1, 1,
0.1630152, 1.143294, -0.547893, 0, 0, 0, 1, 1,
0.1646669, 0.3531687, 1.193026, 1, 1, 1, 1, 1,
0.1702023, -0.2332712, 1.770152, 1, 1, 1, 1, 1,
0.1707746, -0.06137078, 3.092745, 1, 1, 1, 1, 1,
0.1723927, -0.1997509, 2.770514, 1, 1, 1, 1, 1,
0.1755974, -1.294014, 2.905285, 1, 1, 1, 1, 1,
0.1780621, 0.5781698, 1.559021, 1, 1, 1, 1, 1,
0.1823644, -1.311494, 2.527376, 1, 1, 1, 1, 1,
0.1845102, 0.2032449, -1.297083, 1, 1, 1, 1, 1,
0.1853712, 0.1523353, -0.2306829, 1, 1, 1, 1, 1,
0.1943538, -0.4737699, 4.804638, 1, 1, 1, 1, 1,
0.1964827, 1.182813, 1.259572, 1, 1, 1, 1, 1,
0.1982701, -0.2289083, 4.162024, 1, 1, 1, 1, 1,
0.1993898, 1.53382, 1.40939, 1, 1, 1, 1, 1,
0.1999951, 0.1222384, 1.126341, 1, 1, 1, 1, 1,
0.2012447, 0.784247, 0.06322429, 1, 1, 1, 1, 1,
0.2023326, -0.3548613, 3.122455, 0, 0, 1, 1, 1,
0.2124075, -0.2825141, 3.063466, 1, 0, 0, 1, 1,
0.213677, -1.229816, 4.508607, 1, 0, 0, 1, 1,
0.2154257, 1.489075, 0.5795517, 1, 0, 0, 1, 1,
0.2159309, 0.6349198, 0.5567346, 1, 0, 0, 1, 1,
0.2160225, 0.8562072, 0.9963101, 1, 0, 0, 1, 1,
0.2224395, -0.2274256, 3.922492, 0, 0, 0, 1, 1,
0.2280579, 0.4092629, 0.09951796, 0, 0, 0, 1, 1,
0.2307558, 0.312912, 0.9720476, 0, 0, 0, 1, 1,
0.2310914, 0.5429667, 2.102032, 0, 0, 0, 1, 1,
0.2313935, -0.4784402, 2.239552, 0, 0, 0, 1, 1,
0.2316482, 1.783687, 0.8278584, 0, 0, 0, 1, 1,
0.2317441, 0.6796009, 0.1801751, 0, 0, 0, 1, 1,
0.233369, 1.209785, 0.2534761, 1, 1, 1, 1, 1,
0.2343391, -1.609984, 2.274952, 1, 1, 1, 1, 1,
0.2366154, 1.141223, -0.6035591, 1, 1, 1, 1, 1,
0.2388287, -0.951254, 2.79879, 1, 1, 1, 1, 1,
0.239586, -1.097175, 4.941709, 1, 1, 1, 1, 1,
0.2458042, 0.0347087, 2.237261, 1, 1, 1, 1, 1,
0.2502282, 0.08385105, 0.6496659, 1, 1, 1, 1, 1,
0.2533242, -1.050262, 1.842597, 1, 1, 1, 1, 1,
0.2558262, 0.2307895, 1.145094, 1, 1, 1, 1, 1,
0.2574455, -0.2875338, 1.254657, 1, 1, 1, 1, 1,
0.2575202, 1.058576, -0.8589106, 1, 1, 1, 1, 1,
0.2599936, -0.6913263, 0.9042534, 1, 1, 1, 1, 1,
0.2617419, -0.6569738, 2.661963, 1, 1, 1, 1, 1,
0.2658933, -0.3391808, 2.795853, 1, 1, 1, 1, 1,
0.2737241, 0.2294939, 2.396356, 1, 1, 1, 1, 1,
0.2748437, -1.422701, 3.310594, 0, 0, 1, 1, 1,
0.2760545, -0.7154472, 3.104951, 1, 0, 0, 1, 1,
0.2767152, 1.526517, 0.2765452, 1, 0, 0, 1, 1,
0.27786, -0.4172661, 4.09987, 1, 0, 0, 1, 1,
0.2883295, -1.126743, 2.752739, 1, 0, 0, 1, 1,
0.2892579, 0.6815212, 0.2077241, 1, 0, 0, 1, 1,
0.2904169, -0.1434636, 3.095095, 0, 0, 0, 1, 1,
0.2904419, -0.5381856, 2.929933, 0, 0, 0, 1, 1,
0.2913722, 0.2664158, 0.9888257, 0, 0, 0, 1, 1,
0.2919023, 1.367392, -0.5329915, 0, 0, 0, 1, 1,
0.2994236, -1.343693, 3.35885, 0, 0, 0, 1, 1,
0.3004111, 1.627465, -0.05675316, 0, 0, 0, 1, 1,
0.30108, 0.36589, 1.397292, 0, 0, 0, 1, 1,
0.3023976, 1.687088, 1.171836, 1, 1, 1, 1, 1,
0.3033966, 1.436561, 0.1987366, 1, 1, 1, 1, 1,
0.3039527, 1.168114, -1.175738, 1, 1, 1, 1, 1,
0.3088705, 0.8097131, 0.2039264, 1, 1, 1, 1, 1,
0.3093177, -0.8983847, 2.900334, 1, 1, 1, 1, 1,
0.312434, 0.4397617, -0.2833883, 1, 1, 1, 1, 1,
0.3137873, -1.352951, 2.798059, 1, 1, 1, 1, 1,
0.3142872, -0.7930917, 4.703875, 1, 1, 1, 1, 1,
0.3172522, 0.7264121, 0.9698801, 1, 1, 1, 1, 1,
0.3173892, 0.6155773, 0.235676, 1, 1, 1, 1, 1,
0.3177169, -0.668335, 0.6378877, 1, 1, 1, 1, 1,
0.3190747, -0.1725988, 1.80042, 1, 1, 1, 1, 1,
0.322359, 1.174091, 1.178006, 1, 1, 1, 1, 1,
0.3241738, 0.1487567, 2.317442, 1, 1, 1, 1, 1,
0.3270867, 0.3652488, 1.357698, 1, 1, 1, 1, 1,
0.3284553, 0.9376383, 0.3416992, 0, 0, 1, 1, 1,
0.3351955, 0.0363264, 1.544662, 1, 0, 0, 1, 1,
0.3355607, -0.6874427, 1.971566, 1, 0, 0, 1, 1,
0.3370524, 0.1767055, -1.030839, 1, 0, 0, 1, 1,
0.3449053, 1.17564, -0.09911331, 1, 0, 0, 1, 1,
0.349468, -0.05733098, -0.7393786, 1, 0, 0, 1, 1,
0.3516047, 1.379409, -0.9401621, 0, 0, 0, 1, 1,
0.3526591, -0.6939118, 2.844853, 0, 0, 0, 1, 1,
0.3526666, 0.643829, 0.5525709, 0, 0, 0, 1, 1,
0.3544879, -0.6118094, 0.8991814, 0, 0, 0, 1, 1,
0.3572919, 0.6556476, 1.165832, 0, 0, 0, 1, 1,
0.3586385, -0.9092187, 2.078305, 0, 0, 0, 1, 1,
0.3618844, -0.8662409, 2.062545, 0, 0, 0, 1, 1,
0.3639094, -0.1495546, 2.036502, 1, 1, 1, 1, 1,
0.3655772, 1.280183, 0.7875895, 1, 1, 1, 1, 1,
0.366679, -1.372458, 3.391239, 1, 1, 1, 1, 1,
0.374322, -0.06225637, 2.380735, 1, 1, 1, 1, 1,
0.3747082, 0.2272625, 0.9752542, 1, 1, 1, 1, 1,
0.375192, -0.1614484, 0.3326743, 1, 1, 1, 1, 1,
0.3755994, -1.69628, 1.337941, 1, 1, 1, 1, 1,
0.3795652, 0.3874859, 1.296367, 1, 1, 1, 1, 1,
0.3804244, -1.400225, 3.68666, 1, 1, 1, 1, 1,
0.3837645, -0.09277418, 2.364677, 1, 1, 1, 1, 1,
0.3872365, -0.4845171, 3.380257, 1, 1, 1, 1, 1,
0.3890102, 1.39135, -0.5894619, 1, 1, 1, 1, 1,
0.3921981, -0.4179399, 0.2445876, 1, 1, 1, 1, 1,
0.3945182, -0.9137793, 0.492152, 1, 1, 1, 1, 1,
0.3974292, -1.17724, 2.257786, 1, 1, 1, 1, 1,
0.3993309, -0.4387764, 1.688138, 0, 0, 1, 1, 1,
0.3994628, 0.2430366, 0.8269115, 1, 0, 0, 1, 1,
0.4007245, 0.8084874, 1.612335, 1, 0, 0, 1, 1,
0.4050218, -0.6726331, 1.51072, 1, 0, 0, 1, 1,
0.40582, 0.9921678, 0.5953874, 1, 0, 0, 1, 1,
0.4119604, -1.353636, 3.236049, 1, 0, 0, 1, 1,
0.412534, -1.230051, 3.743665, 0, 0, 0, 1, 1,
0.4128311, -0.4711114, 0.9810457, 0, 0, 0, 1, 1,
0.4145914, -0.9706579, 2.637362, 0, 0, 0, 1, 1,
0.41672, 1.249112, -0.2847449, 0, 0, 0, 1, 1,
0.4255525, -2.141408, 2.929448, 0, 0, 0, 1, 1,
0.4282838, 0.7761587, 0.5420451, 0, 0, 0, 1, 1,
0.4302269, -0.2297972, 1.874504, 0, 0, 0, 1, 1,
0.4307718, -2.124549, 1.963392, 1, 1, 1, 1, 1,
0.4355749, -0.2231044, 2.524144, 1, 1, 1, 1, 1,
0.4361083, -1.507299, 2.151084, 1, 1, 1, 1, 1,
0.4362782, -1.260054, 2.220183, 1, 1, 1, 1, 1,
0.4424065, 1.574417, -1.202767, 1, 1, 1, 1, 1,
0.445464, -0.1320284, 2.606415, 1, 1, 1, 1, 1,
0.4474786, -0.2948004, 0.3279026, 1, 1, 1, 1, 1,
0.4476307, -0.2797501, 1.642161, 1, 1, 1, 1, 1,
0.4516753, 0.7535139, 0.3211448, 1, 1, 1, 1, 1,
0.4524828, 1.973166, 0.5207084, 1, 1, 1, 1, 1,
0.4567668, -0.9672524, 3.811048, 1, 1, 1, 1, 1,
0.460675, -0.2747346, 2.48787, 1, 1, 1, 1, 1,
0.4610685, 0.08819066, 3.414199, 1, 1, 1, 1, 1,
0.4617148, -2.270137, 2.899529, 1, 1, 1, 1, 1,
0.4652537, 0.1326879, 0.9936163, 1, 1, 1, 1, 1,
0.4688113, 0.6708612, 0.1413013, 0, 0, 1, 1, 1,
0.4728483, 0.0624304, 0.6082811, 1, 0, 0, 1, 1,
0.4759717, 1.617723, 1.585583, 1, 0, 0, 1, 1,
0.4772529, -0.1154705, 4.264349, 1, 0, 0, 1, 1,
0.4778032, 0.4065651, 2.74993, 1, 0, 0, 1, 1,
0.47869, -1.086946, 3.797796, 1, 0, 0, 1, 1,
0.4805384, 0.3699531, 1.562274, 0, 0, 0, 1, 1,
0.4827812, -0.4086068, 1.755017, 0, 0, 0, 1, 1,
0.4854075, 0.7102428, 0.7696453, 0, 0, 0, 1, 1,
0.487066, 0.4160515, 2.41164, 0, 0, 0, 1, 1,
0.4913566, 0.2992941, 1.990948, 0, 0, 0, 1, 1,
0.4926992, -0.01150148, -0.1267238, 0, 0, 0, 1, 1,
0.5029998, 1.321195, 0.5055854, 0, 0, 0, 1, 1,
0.5030963, -1.657302, 2.452018, 1, 1, 1, 1, 1,
0.5080051, 0.9326596, 0.0605708, 1, 1, 1, 1, 1,
0.509811, 1.008655, 2.356223, 1, 1, 1, 1, 1,
0.5113099, -0.5614088, 1.736557, 1, 1, 1, 1, 1,
0.5116209, -1.039941, 3.123349, 1, 1, 1, 1, 1,
0.514103, -0.2816398, 2.103074, 1, 1, 1, 1, 1,
0.5168248, -0.5879812, 2.309267, 1, 1, 1, 1, 1,
0.5218905, 0.2008982, -0.9851049, 1, 1, 1, 1, 1,
0.5235018, -0.4482746, 3.477126, 1, 1, 1, 1, 1,
0.5294122, 0.0542777, 2.872201, 1, 1, 1, 1, 1,
0.5326468, 0.942513, -0.01303906, 1, 1, 1, 1, 1,
0.5381234, 0.01650175, 2.90293, 1, 1, 1, 1, 1,
0.5437095, -1.43282, 1.739327, 1, 1, 1, 1, 1,
0.5474516, -0.6319705, 2.745178, 1, 1, 1, 1, 1,
0.5516785, 0.6680532, 0.08677021, 1, 1, 1, 1, 1,
0.5590137, 1.213452, 0.7576868, 0, 0, 1, 1, 1,
0.5591035, 0.6997111, 1.142963, 1, 0, 0, 1, 1,
0.5622315, -0.3389851, 1.491824, 1, 0, 0, 1, 1,
0.5674368, 1.31244, 0.1890836, 1, 0, 0, 1, 1,
0.5723004, 0.9811184, -0.4503237, 1, 0, 0, 1, 1,
0.5744278, -0.3333526, 3.291325, 1, 0, 0, 1, 1,
0.5746685, 0.5224876, 1.412069, 0, 0, 0, 1, 1,
0.5774924, -0.01734481, 2.388553, 0, 0, 0, 1, 1,
0.5778354, 0.4561116, 2.550786, 0, 0, 0, 1, 1,
0.5836211, 2.090529, 0.1000444, 0, 0, 0, 1, 1,
0.5845773, -0.1956747, 1.689079, 0, 0, 0, 1, 1,
0.5861126, -0.1425472, 2.399782, 0, 0, 0, 1, 1,
0.5930991, 0.1736269, 0.7043051, 0, 0, 0, 1, 1,
0.5945335, -0.1768373, 0.5637272, 1, 1, 1, 1, 1,
0.5951642, 1.47569, -0.6604822, 1, 1, 1, 1, 1,
0.5969797, 0.3083341, 3.72924, 1, 1, 1, 1, 1,
0.5989324, -1.310201, 3.79439, 1, 1, 1, 1, 1,
0.6014018, 0.1668956, 0.4085208, 1, 1, 1, 1, 1,
0.6046302, 1.036849, 1.689743, 1, 1, 1, 1, 1,
0.6070833, 1.599655, 1.29614, 1, 1, 1, 1, 1,
0.6091403, -0.3273008, 2.151292, 1, 1, 1, 1, 1,
0.6109058, -0.4476452, 2.491211, 1, 1, 1, 1, 1,
0.6149269, -0.6088668, 1.797027, 1, 1, 1, 1, 1,
0.6154797, -0.4271166, 1.737656, 1, 1, 1, 1, 1,
0.6198645, -1.730538, 1.88898, 1, 1, 1, 1, 1,
0.6223774, -0.02055623, 1.813911, 1, 1, 1, 1, 1,
0.6235766, -0.1191558, 1.909973, 1, 1, 1, 1, 1,
0.6315951, 1.049471, -0.4854271, 1, 1, 1, 1, 1,
0.6459987, 0.09016779, 1.748891, 0, 0, 1, 1, 1,
0.6534874, -0.4541742, 1.521387, 1, 0, 0, 1, 1,
0.6549237, -0.402948, 2.327898, 1, 0, 0, 1, 1,
0.6557303, -1.829287, 4.038363, 1, 0, 0, 1, 1,
0.6560348, -1.261613, 2.466655, 1, 0, 0, 1, 1,
0.6621066, 1.544113, 0.9187242, 1, 0, 0, 1, 1,
0.6648184, -0.3183571, 2.212447, 0, 0, 0, 1, 1,
0.6706805, -0.9814411, 2.073429, 0, 0, 0, 1, 1,
0.6715901, 0.07199761, 0.7112881, 0, 0, 0, 1, 1,
0.6718169, -0.7022317, 3.519695, 0, 0, 0, 1, 1,
0.6768104, -0.1310212, 0.8453132, 0, 0, 0, 1, 1,
0.6804612, 0.7621429, 0.1461578, 0, 0, 0, 1, 1,
0.6811087, 0.3766692, 1.663298, 0, 0, 0, 1, 1,
0.6838558, 1.234014, 0.8790834, 1, 1, 1, 1, 1,
0.6841606, -1.257515, 3.288285, 1, 1, 1, 1, 1,
0.7004241, 0.03329806, -0.4210373, 1, 1, 1, 1, 1,
0.7027283, 0.1576963, 1.916556, 1, 1, 1, 1, 1,
0.7082233, -0.5373756, 1.42201, 1, 1, 1, 1, 1,
0.7093993, -1.955211, 4.480849, 1, 1, 1, 1, 1,
0.7115505, 1.681441, 0.231925, 1, 1, 1, 1, 1,
0.7159958, -0.6982113, 3.977307, 1, 1, 1, 1, 1,
0.7185327, 0.6903851, 2.24315, 1, 1, 1, 1, 1,
0.7189627, -0.1640207, -0.5419654, 1, 1, 1, 1, 1,
0.7208902, -0.004287356, 2.914187, 1, 1, 1, 1, 1,
0.721943, 1.13228, 3.299561, 1, 1, 1, 1, 1,
0.7280506, 1.54523, 1.074566, 1, 1, 1, 1, 1,
0.7282881, -0.9236879, 3.375514, 1, 1, 1, 1, 1,
0.7296133, 0.2241706, 1.263551, 1, 1, 1, 1, 1,
0.7322206, 0.2293938, 2.397602, 0, 0, 1, 1, 1,
0.7347715, 0.9688606, -1.11046, 1, 0, 0, 1, 1,
0.7354435, -1.805421, 4.000511, 1, 0, 0, 1, 1,
0.7380635, -0.7265446, 4.189708, 1, 0, 0, 1, 1,
0.7397953, -1.223905, 3.753942, 1, 0, 0, 1, 1,
0.7420707, -0.02749674, 0.4120998, 1, 0, 0, 1, 1,
0.7433875, -0.3480469, 3.632043, 0, 0, 0, 1, 1,
0.7453228, 0.4493045, -0.06333993, 0, 0, 0, 1, 1,
0.7463098, 0.7447211, 1.230221, 0, 0, 0, 1, 1,
0.7465292, -0.8668696, 2.163362, 0, 0, 0, 1, 1,
0.7497118, -0.5806464, 2.042349, 0, 0, 0, 1, 1,
0.7551295, -0.7991691, 1.854268, 0, 0, 0, 1, 1,
0.7590682, 0.2079527, 0.3735255, 0, 0, 0, 1, 1,
0.7603942, 0.4000213, 1.407736, 1, 1, 1, 1, 1,
0.775444, 1.123548, 1.019826, 1, 1, 1, 1, 1,
0.777705, 0.9209224, 1.065003, 1, 1, 1, 1, 1,
0.7798572, -0.408382, 2.963361, 1, 1, 1, 1, 1,
0.7801378, 0.8084784, 2.705811, 1, 1, 1, 1, 1,
0.7856573, -1.523877, 2.071222, 1, 1, 1, 1, 1,
0.792028, 0.3271356, 1.905794, 1, 1, 1, 1, 1,
0.7925913, 0.652878, -0.3539158, 1, 1, 1, 1, 1,
0.7970418, 0.3587704, 1.291814, 1, 1, 1, 1, 1,
0.79738, -0.8814542, 2.818331, 1, 1, 1, 1, 1,
0.8018774, -0.3641731, 1.858009, 1, 1, 1, 1, 1,
0.802116, -0.6517388, 1.567361, 1, 1, 1, 1, 1,
0.8048791, 1.511546, 0.1061895, 1, 1, 1, 1, 1,
0.8103587, 0.3619408, -0.5760512, 1, 1, 1, 1, 1,
0.8257537, -0.4258434, 1.730499, 1, 1, 1, 1, 1,
0.8262117, 1.9474, 0.2507979, 0, 0, 1, 1, 1,
0.8266789, -0.9134514, 2.542077, 1, 0, 0, 1, 1,
0.8280655, 0.2582502, 0.5689014, 1, 0, 0, 1, 1,
0.8316273, 0.8055534, -0.9432319, 1, 0, 0, 1, 1,
0.8369842, -0.7255334, 1.625145, 1, 0, 0, 1, 1,
0.8382597, 0.25649, -0.8148689, 1, 0, 0, 1, 1,
0.8395537, -0.9114806, 2.670739, 0, 0, 0, 1, 1,
0.8478914, -0.6004263, 2.980211, 0, 0, 0, 1, 1,
0.8531846, 0.1772762, 2.029951, 0, 0, 0, 1, 1,
0.8556647, 0.04506731, 0.4359268, 0, 0, 0, 1, 1,
0.8644426, -1.347588, 3.043638, 0, 0, 0, 1, 1,
0.8647549, 0.9503014, 0.6068048, 0, 0, 0, 1, 1,
0.8728592, 0.3609604, 0.3561431, 0, 0, 0, 1, 1,
0.8734899, -0.4322621, 3.819572, 1, 1, 1, 1, 1,
0.8742294, -0.5620741, 2.677347, 1, 1, 1, 1, 1,
0.8784662, 0.2116562, 2.009117, 1, 1, 1, 1, 1,
0.8790137, 2.046902, -0.2997164, 1, 1, 1, 1, 1,
0.8816884, -1.233966, 2.154558, 1, 1, 1, 1, 1,
0.8818126, -1.846845, 2.021655, 1, 1, 1, 1, 1,
0.888195, -0.5327581, 0.1553571, 1, 1, 1, 1, 1,
0.8930241, 0.431339, 2.907203, 1, 1, 1, 1, 1,
0.8944001, -1.693793, 3.181219, 1, 1, 1, 1, 1,
0.8952921, -0.5203294, 2.014984, 1, 1, 1, 1, 1,
0.9147871, 0.9049546, 2.62189, 1, 1, 1, 1, 1,
0.9166626, -0.8230513, 3.333786, 1, 1, 1, 1, 1,
0.924349, 0.5709421, 0.6070035, 1, 1, 1, 1, 1,
0.9258839, 0.8454602, 1.796536, 1, 1, 1, 1, 1,
0.9279192, -0.06475436, 1.869703, 1, 1, 1, 1, 1,
0.928918, 0.3044355, 0.8797685, 0, 0, 1, 1, 1,
0.9293668, 0.03662808, 2.254768, 1, 0, 0, 1, 1,
0.9302203, -1.373312, 2.484844, 1, 0, 0, 1, 1,
0.9371812, 1.333261, -0.06271604, 1, 0, 0, 1, 1,
0.9485717, -1.340698, 1.269364, 1, 0, 0, 1, 1,
0.9490766, 0.05425142, 1.946283, 1, 0, 0, 1, 1,
0.9578811, -1.366352, 1.788526, 0, 0, 0, 1, 1,
0.9598975, -0.7097726, 4.041139, 0, 0, 0, 1, 1,
0.9607066, 1.589332, 0.3262684, 0, 0, 0, 1, 1,
0.9743213, 0.3875473, 0.7659864, 0, 0, 0, 1, 1,
0.9787986, 2.477493, -0.3477046, 0, 0, 0, 1, 1,
0.982152, -0.6367006, 2.669621, 0, 0, 0, 1, 1,
0.9850714, 1.134379, 1.072042, 0, 0, 0, 1, 1,
0.9866382, 0.361919, 1.559116, 1, 1, 1, 1, 1,
0.98835, 1.810578, -0.3627834, 1, 1, 1, 1, 1,
0.9897146, 0.171343, 0.9496979, 1, 1, 1, 1, 1,
0.990692, -1.275605, 1.112445, 1, 1, 1, 1, 1,
0.9950781, -0.8137697, 4.025893, 1, 1, 1, 1, 1,
1.005135, 1.038886, -0.4608604, 1, 1, 1, 1, 1,
1.005169, -0.4973027, 1.196272, 1, 1, 1, 1, 1,
1.006125, 2.887971, -0.8649475, 1, 1, 1, 1, 1,
1.006617, 0.2004796, 0.9226162, 1, 1, 1, 1, 1,
1.008944, -0.966675, 3.094374, 1, 1, 1, 1, 1,
1.009136, 0.4225681, 0.5508658, 1, 1, 1, 1, 1,
1.011147, -0.99913, 2.006454, 1, 1, 1, 1, 1,
1.011235, 0.08195453, 0.7156792, 1, 1, 1, 1, 1,
1.015568, -0.812985, 2.920964, 1, 1, 1, 1, 1,
1.017088, -0.01671448, 0.7139723, 1, 1, 1, 1, 1,
1.021795, -0.06216655, -0.7530097, 0, 0, 1, 1, 1,
1.024265, 0.8633366, -2.730592, 1, 0, 0, 1, 1,
1.024799, 1.340837, 1.098254, 1, 0, 0, 1, 1,
1.032032, 0.0810139, 3.323246, 1, 0, 0, 1, 1,
1.033108, 0.2624764, 2.196247, 1, 0, 0, 1, 1,
1.042551, 0.4729353, -0.1447615, 1, 0, 0, 1, 1,
1.047475, 1.047854, 1.152527, 0, 0, 0, 1, 1,
1.052898, -0.8073246, 2.110577, 0, 0, 0, 1, 1,
1.057277, 0.1741405, 0.3867718, 0, 0, 0, 1, 1,
1.058897, -0.7540219, -0.1719024, 0, 0, 0, 1, 1,
1.067218, 0.7965347, 2.073252, 0, 0, 0, 1, 1,
1.071207, 1.048586, 0.273458, 0, 0, 0, 1, 1,
1.077301, -1.805272, 1.028895, 0, 0, 0, 1, 1,
1.081576, -0.3549427, 1.533921, 1, 1, 1, 1, 1,
1.084711, 0.5626482, -1.524791, 1, 1, 1, 1, 1,
1.085499, 0.2025038, 1.057932, 1, 1, 1, 1, 1,
1.091357, -0.4883441, 1.508673, 1, 1, 1, 1, 1,
1.106724, 0.310516, 0.5605512, 1, 1, 1, 1, 1,
1.107125, 1.085407, 1.161617, 1, 1, 1, 1, 1,
1.10793, -0.3091392, 2.711681, 1, 1, 1, 1, 1,
1.112597, -0.4580939, 1.482958, 1, 1, 1, 1, 1,
1.119692, 1.680728, 0.340877, 1, 1, 1, 1, 1,
1.127263, 1.251166, 0.06884533, 1, 1, 1, 1, 1,
1.132457, 0.386272, 0.4658561, 1, 1, 1, 1, 1,
1.143152, 1.977049, 1.009502, 1, 1, 1, 1, 1,
1.144457, 0.8581218, 1.451213, 1, 1, 1, 1, 1,
1.152188, -0.197969, 1.898912, 1, 1, 1, 1, 1,
1.153869, -0.9255092, 3.820515, 1, 1, 1, 1, 1,
1.160079, -0.6592643, 1.970034, 0, 0, 1, 1, 1,
1.162026, -0.7107223, 1.064848, 1, 0, 0, 1, 1,
1.16312, 0.2303863, 1.338038, 1, 0, 0, 1, 1,
1.164591, 0.12662, 1.396518, 1, 0, 0, 1, 1,
1.171342, 1.253534, 1.061518, 1, 0, 0, 1, 1,
1.178162, -0.1351128, 2.22797, 1, 0, 0, 1, 1,
1.181375, 1.897355, -0.3437291, 0, 0, 0, 1, 1,
1.188973, 0.489134, 0.02599424, 0, 0, 0, 1, 1,
1.193403, -1.643461, 2.769882, 0, 0, 0, 1, 1,
1.20861, -0.0393105, 2.674926, 0, 0, 0, 1, 1,
1.213714, -1.290472, 1.346735, 0, 0, 0, 1, 1,
1.228143, 0.7800067, -0.05904397, 0, 0, 0, 1, 1,
1.229179, 0.2760814, 1.257239, 0, 0, 0, 1, 1,
1.229599, -0.0765416, 0.8676655, 1, 1, 1, 1, 1,
1.234804, 2.1933, 2.149073, 1, 1, 1, 1, 1,
1.252938, -0.6499517, 2.522472, 1, 1, 1, 1, 1,
1.259117, 1.907957, -0.1709329, 1, 1, 1, 1, 1,
1.261584, -0.8083682, 3.523782, 1, 1, 1, 1, 1,
1.266375, 0.03324973, 0.3216033, 1, 1, 1, 1, 1,
1.2764, 1.459366, -0.09731042, 1, 1, 1, 1, 1,
1.285922, 0.520154, 0.1004547, 1, 1, 1, 1, 1,
1.288429, -0.138217, 2.017121, 1, 1, 1, 1, 1,
1.289778, 1.108875, 0.9609491, 1, 1, 1, 1, 1,
1.291088, -0.06059428, 1.942945, 1, 1, 1, 1, 1,
1.300795, -0.7650182, 2.045157, 1, 1, 1, 1, 1,
1.302873, 0.2052055, 2.413309, 1, 1, 1, 1, 1,
1.305614, 0.2976256, 1.15028, 1, 1, 1, 1, 1,
1.308548, -0.4441819, 2.49275, 1, 1, 1, 1, 1,
1.311187, -1.208685, 1.924445, 0, 0, 1, 1, 1,
1.323641, 0.3176714, 2.103116, 1, 0, 0, 1, 1,
1.326951, 0.8873542, 1.154819, 1, 0, 0, 1, 1,
1.327263, -0.5846118, 3.167293, 1, 0, 0, 1, 1,
1.339976, -0.03377296, 2.519496, 1, 0, 0, 1, 1,
1.340506, 0.4632466, 0.9351537, 1, 0, 0, 1, 1,
1.355635, 1.150566, 1.763989, 0, 0, 0, 1, 1,
1.36021, 0.09192204, 2.786139, 0, 0, 0, 1, 1,
1.360885, -0.1597959, 0.5423973, 0, 0, 0, 1, 1,
1.365913, -0.3973492, 1.734255, 0, 0, 0, 1, 1,
1.373326, 0.7108356, -0.6081967, 0, 0, 0, 1, 1,
1.38282, -1.212438, 2.723453, 0, 0, 0, 1, 1,
1.384087, -1.248835, 1.446154, 0, 0, 0, 1, 1,
1.389449, 0.3967762, 0.4453192, 1, 1, 1, 1, 1,
1.392142, -1.260959, 2.794412, 1, 1, 1, 1, 1,
1.395971, 0.08329399, 2.459239, 1, 1, 1, 1, 1,
1.396553, -0.7814934, 1.939089, 1, 1, 1, 1, 1,
1.399279, -1.725576, 1.093809, 1, 1, 1, 1, 1,
1.401641, -1.166291, 2.129765, 1, 1, 1, 1, 1,
1.407426, 1.121786, -1.89329, 1, 1, 1, 1, 1,
1.409826, -0.5297264, 2.067607, 1, 1, 1, 1, 1,
1.417739, 0.03700193, 1.216218, 1, 1, 1, 1, 1,
1.425566, -2.119665, 1.068972, 1, 1, 1, 1, 1,
1.427086, -0.5410505, 1.077066, 1, 1, 1, 1, 1,
1.436282, -0.01566607, 2.706058, 1, 1, 1, 1, 1,
1.447664, 1.407184, -0.3328598, 1, 1, 1, 1, 1,
1.450061, 1.187231, 0.8641407, 1, 1, 1, 1, 1,
1.450433, -1.730231, 1.898075, 1, 1, 1, 1, 1,
1.452618, 2.039242, 0.06427386, 0, 0, 1, 1, 1,
1.452938, -0.4632788, 2.946942, 1, 0, 0, 1, 1,
1.49271, -1.901617, 1.673045, 1, 0, 0, 1, 1,
1.497865, 0.4293171, 2.304024, 1, 0, 0, 1, 1,
1.516988, -0.1080587, 1.209199, 1, 0, 0, 1, 1,
1.522837, -1.313861, 1.680157, 1, 0, 0, 1, 1,
1.526433, -1.204664, 4.8308, 0, 0, 0, 1, 1,
1.536955, 0.5238973, 0.9222554, 0, 0, 0, 1, 1,
1.539947, 0.06369073, 1.068789, 0, 0, 0, 1, 1,
1.540867, 0.8275825, -0.3457388, 0, 0, 0, 1, 1,
1.55375, -1.129969, 3.251468, 0, 0, 0, 1, 1,
1.561724, 0.401512, -0.04793973, 0, 0, 0, 1, 1,
1.565292, -0.8758754, 3.020516, 0, 0, 0, 1, 1,
1.570082, -1.210566, 3.642554, 1, 1, 1, 1, 1,
1.608198, -0.758634, 2.586326, 1, 1, 1, 1, 1,
1.614198, -0.4913651, 5.248364, 1, 1, 1, 1, 1,
1.62082, 0.1157632, 0.1933787, 1, 1, 1, 1, 1,
1.646891, 0.6756178, 0.4172994, 1, 1, 1, 1, 1,
1.649992, -1.127372, 2.859195, 1, 1, 1, 1, 1,
1.666214, -0.004433902, -2.085816, 1, 1, 1, 1, 1,
1.66969, 0.8825345, -0.504238, 1, 1, 1, 1, 1,
1.673651, 0.5010639, -0.6032807, 1, 1, 1, 1, 1,
1.679251, 0.4398094, 0.7990381, 1, 1, 1, 1, 1,
1.690285, 1.695245, 0.9360576, 1, 1, 1, 1, 1,
1.693102, 0.5147237, 1.039703, 1, 1, 1, 1, 1,
1.700754, 0.5371271, 1.040716, 1, 1, 1, 1, 1,
1.704533, 0.2559941, -0.2172533, 1, 1, 1, 1, 1,
1.718678, 0.0676764, 0.8497871, 1, 1, 1, 1, 1,
1.720624, -1.054685, 0.7972405, 0, 0, 1, 1, 1,
1.727367, 0.2124055, 1.499298, 1, 0, 0, 1, 1,
1.749969, 1.556147, 0.6331456, 1, 0, 0, 1, 1,
1.753262, 0.2445942, 2.366553, 1, 0, 0, 1, 1,
1.769528, 0.04997703, 2.488489, 1, 0, 0, 1, 1,
1.787382, -0.5533714, 4.692069, 1, 0, 0, 1, 1,
1.82957, -0.6017041, 3.286783, 0, 0, 0, 1, 1,
1.835313, -0.102895, 1.849925, 0, 0, 0, 1, 1,
1.841103, 0.4788193, 1.03447, 0, 0, 0, 1, 1,
1.845312, 1.646263, 1.076757, 0, 0, 0, 1, 1,
1.848699, -1.318406, 2.142052, 0, 0, 0, 1, 1,
1.856644, 0.3243922, 1.952152, 0, 0, 0, 1, 1,
1.858909, 1.758653, 0.9162005, 0, 0, 0, 1, 1,
1.861942, -0.2337165, 0.6327108, 1, 1, 1, 1, 1,
1.864245, -0.4739576, 1.518042, 1, 1, 1, 1, 1,
1.870741, 1.330807, 1.844628, 1, 1, 1, 1, 1,
1.877549, -0.5451567, 2.970063, 1, 1, 1, 1, 1,
1.878953, -0.5096892, 2.080765, 1, 1, 1, 1, 1,
1.899857, 0.7898099, 0.8132999, 1, 1, 1, 1, 1,
1.92184, -1.447919, 1.587052, 1, 1, 1, 1, 1,
1.973501, 1.042103, 1.40758, 1, 1, 1, 1, 1,
1.986356, 1.097249, 0.1752604, 1, 1, 1, 1, 1,
1.988319, 1.33228, 1.494199, 1, 1, 1, 1, 1,
2.015709, 0.009585069, 2.013516, 1, 1, 1, 1, 1,
2.016323, 0.1209662, 1.219986, 1, 1, 1, 1, 1,
2.037249, -0.6261336, 3.24624, 1, 1, 1, 1, 1,
2.053483, 0.4220507, 0.1667513, 1, 1, 1, 1, 1,
2.105225, -0.7352189, 2.070595, 1, 1, 1, 1, 1,
2.138551, -0.3839578, 1.172685, 0, 0, 1, 1, 1,
2.149911, -1.142526, 1.154375, 1, 0, 0, 1, 1,
2.196494, -0.7849895, 2.643564, 1, 0, 0, 1, 1,
2.213749, -0.1834821, 1.508837, 1, 0, 0, 1, 1,
2.239512, 0.8823875, 1.02692, 1, 0, 0, 1, 1,
2.281063, 1.040386, 1.293197, 1, 0, 0, 1, 1,
2.352232, 0.6492001, 0.6728123, 0, 0, 0, 1, 1,
2.352947, -0.6922791, 2.099597, 0, 0, 0, 1, 1,
2.424488, 1.449564, -0.1804188, 0, 0, 0, 1, 1,
2.45013, -0.1425654, 1.686299, 0, 0, 0, 1, 1,
2.474291, 0.07811101, 3.126843, 0, 0, 0, 1, 1,
2.478547, 0.9367709, 0.09204527, 0, 0, 0, 1, 1,
2.536822, -1.103801, 2.960229, 0, 0, 0, 1, 1,
2.605048, -0.1884895, 2.385621, 1, 1, 1, 1, 1,
2.647397, 0.143308, -1.770925, 1, 1, 1, 1, 1,
2.654397, 0.7042066, 0.3547105, 1, 1, 1, 1, 1,
2.668911, 0.5964269, -0.5058605, 1, 1, 1, 1, 1,
2.773749, 0.520327, 2.210614, 1, 1, 1, 1, 1,
2.888002, -1.170996, 1.732638, 1, 1, 1, 1, 1,
3.127187, 0.8531516, 1.383566, 1, 1, 1, 1, 1
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
var radius = 9.574201;
var distance = 33.62897;
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
mvMatrix.translate( -0.2381328, 0.07525826, 0.04648805 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.62897);
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
