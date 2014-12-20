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
-3.354996, -2.159962, -0.1574093, 1, 0, 0, 1,
-3.259516, 0.5047224, 0.6308382, 1, 0.007843138, 0, 1,
-3.129829, 0.7096416, -2.533334, 1, 0.01176471, 0, 1,
-2.913959, 1.211033, -3.205158, 1, 0.01960784, 0, 1,
-2.632304, 0.7290589, -1.757407, 1, 0.02352941, 0, 1,
-2.592226, 1.300133, -0.3242901, 1, 0.03137255, 0, 1,
-2.537353, -0.453016, -2.930422, 1, 0.03529412, 0, 1,
-2.459282, 1.45213, -1.471774, 1, 0.04313726, 0, 1,
-2.416606, -1.077631, -1.850454, 1, 0.04705882, 0, 1,
-2.362583, -0.8550545, -2.537549, 1, 0.05490196, 0, 1,
-2.277153, 0.9465111, -0.847992, 1, 0.05882353, 0, 1,
-2.262273, -0.6486751, -1.238239, 1, 0.06666667, 0, 1,
-2.241535, 1.24896, -1.662266, 1, 0.07058824, 0, 1,
-2.22144, 0.1961082, -0.6508459, 1, 0.07843138, 0, 1,
-2.21869, -1.643938, -3.232246, 1, 0.08235294, 0, 1,
-2.188917, 0.08038785, -0.7215567, 1, 0.09019608, 0, 1,
-2.13496, -0.2403155, -2.680646, 1, 0.09411765, 0, 1,
-2.110152, 1.988394, -1.654078, 1, 0.1019608, 0, 1,
-2.041955, 0.953352, -1.386614, 1, 0.1098039, 0, 1,
-2.007791, 0.1890743, -1.786522, 1, 0.1137255, 0, 1,
-1.997529, 0.7888252, 0.1467072, 1, 0.1215686, 0, 1,
-1.996875, 0.6494715, 1.066401, 1, 0.1254902, 0, 1,
-1.943858, 1.221318, -1.374265, 1, 0.1333333, 0, 1,
-1.912597, -0.4562822, -2.93983, 1, 0.1372549, 0, 1,
-1.904488, -0.5967941, -0.4614501, 1, 0.145098, 0, 1,
-1.89974, -0.1863477, -2.193098, 1, 0.1490196, 0, 1,
-1.870561, 0.4642093, -0.9047686, 1, 0.1568628, 0, 1,
-1.810281, -0.3351251, -2.196914, 1, 0.1607843, 0, 1,
-1.800219, -0.9479944, -3.480596, 1, 0.1686275, 0, 1,
-1.780882, -0.2023531, -0.4938791, 1, 0.172549, 0, 1,
-1.776004, 1.059987, -0.8311262, 1, 0.1803922, 0, 1,
-1.760155, 0.5798563, -0.9496619, 1, 0.1843137, 0, 1,
-1.757212, 0.2126798, -4.044874, 1, 0.1921569, 0, 1,
-1.744934, 0.01625585, -2.029923, 1, 0.1960784, 0, 1,
-1.715181, -1.64108, -1.240506, 1, 0.2039216, 0, 1,
-1.710704, -0.5284665, -2.492384, 1, 0.2117647, 0, 1,
-1.708095, 1.559952, -1.506848, 1, 0.2156863, 0, 1,
-1.703414, 0.1354811, -3.149105, 1, 0.2235294, 0, 1,
-1.689194, 0.7366427, -1.237562, 1, 0.227451, 0, 1,
-1.674117, 2.139252, -0.266001, 1, 0.2352941, 0, 1,
-1.673711, -1.615349, -1.889881, 1, 0.2392157, 0, 1,
-1.670413, 0.4588278, -1.668966, 1, 0.2470588, 0, 1,
-1.669274, 2.246829, -1.761228, 1, 0.2509804, 0, 1,
-1.632019, 0.514989, -1.018046, 1, 0.2588235, 0, 1,
-1.630718, 1.086216, -0.73729, 1, 0.2627451, 0, 1,
-1.625753, -0.0645379, -1.714224, 1, 0.2705882, 0, 1,
-1.618826, 0.6276253, -1.910704, 1, 0.2745098, 0, 1,
-1.618564, -1.102561, -1.770074, 1, 0.282353, 0, 1,
-1.606107, 1.722797, -0.2994051, 1, 0.2862745, 0, 1,
-1.595992, -1.238703, -1.861865, 1, 0.2941177, 0, 1,
-1.587121, -0.601591, -2.410879, 1, 0.3019608, 0, 1,
-1.580931, 0.1829854, -0.7071134, 1, 0.3058824, 0, 1,
-1.571014, 1.589144, -0.2800293, 1, 0.3137255, 0, 1,
-1.570709, 0.326961, -2.204638, 1, 0.3176471, 0, 1,
-1.566301, -1.930466, -3.147874, 1, 0.3254902, 0, 1,
-1.55568, 0.7680058, -0.03481247, 1, 0.3294118, 0, 1,
-1.542205, 1.208359, -1.931616, 1, 0.3372549, 0, 1,
-1.541599, 0.1529399, -1.409789, 1, 0.3411765, 0, 1,
-1.539884, -0.3831047, -2.958848, 1, 0.3490196, 0, 1,
-1.505919, 0.2286836, -2.856543, 1, 0.3529412, 0, 1,
-1.500824, 0.6335193, -0.8737781, 1, 0.3607843, 0, 1,
-1.475564, 0.2283289, -2.881913, 1, 0.3647059, 0, 1,
-1.469439, -0.4506046, -1.294883, 1, 0.372549, 0, 1,
-1.466241, 0.03466351, -2.035971, 1, 0.3764706, 0, 1,
-1.457904, -0.7438653, -0.1862371, 1, 0.3843137, 0, 1,
-1.443917, -0.3430744, -0.2380224, 1, 0.3882353, 0, 1,
-1.43223, -0.720204, -1.161986, 1, 0.3960784, 0, 1,
-1.413413, -0.323235, -2.272819, 1, 0.4039216, 0, 1,
-1.409795, -0.5605368, -1.975181, 1, 0.4078431, 0, 1,
-1.405499, 0.06769821, -0.7198467, 1, 0.4156863, 0, 1,
-1.4041, 2.05728, 0.5888644, 1, 0.4196078, 0, 1,
-1.402784, 0.4290122, -2.326832, 1, 0.427451, 0, 1,
-1.389485, -0.4331779, -1.22117, 1, 0.4313726, 0, 1,
-1.377761, -0.4531551, -1.471656, 1, 0.4392157, 0, 1,
-1.367648, -1.633325, -1.271347, 1, 0.4431373, 0, 1,
-1.363377, 0.6187248, -2.111837, 1, 0.4509804, 0, 1,
-1.357791, -0.2361063, -0.9115114, 1, 0.454902, 0, 1,
-1.350665, -1.259495, -1.482293, 1, 0.4627451, 0, 1,
-1.347021, 0.7147893, -2.758385, 1, 0.4666667, 0, 1,
-1.343506, -0.8756232, -0.9853919, 1, 0.4745098, 0, 1,
-1.337279, -0.1149112, -1.812258, 1, 0.4784314, 0, 1,
-1.332505, 1.149583, -1.095704, 1, 0.4862745, 0, 1,
-1.325041, -0.5906487, -0.6198187, 1, 0.4901961, 0, 1,
-1.321195, -0.1472074, -1.702241, 1, 0.4980392, 0, 1,
-1.319477, 0.1301804, -3.058472, 1, 0.5058824, 0, 1,
-1.309736, -0.2639145, -1.398935, 1, 0.509804, 0, 1,
-1.30428, -0.9966902, -2.997932, 1, 0.5176471, 0, 1,
-1.298088, -1.755627, -2.025852, 1, 0.5215687, 0, 1,
-1.292504, 0.5055563, -3.132977, 1, 0.5294118, 0, 1,
-1.277242, -0.720899, -0.9246625, 1, 0.5333334, 0, 1,
-1.274805, 1.108944, -1.170145, 1, 0.5411765, 0, 1,
-1.267963, 0.555661, 0.002658293, 1, 0.5450981, 0, 1,
-1.266884, 0.0974683, 0.1321101, 1, 0.5529412, 0, 1,
-1.26617, 0.05254458, -1.146238, 1, 0.5568628, 0, 1,
-1.257672, 0.590593, -0.9532674, 1, 0.5647059, 0, 1,
-1.254407, -0.2941442, -3.04724, 1, 0.5686275, 0, 1,
-1.244108, 2.249446, 0.1120028, 1, 0.5764706, 0, 1,
-1.220525, -0.6986789, -2.768271, 1, 0.5803922, 0, 1,
-1.215071, -0.2247236, -2.255702, 1, 0.5882353, 0, 1,
-1.207892, 0.5738497, -1.896753, 1, 0.5921569, 0, 1,
-1.207049, 0.2384596, 0.1564583, 1, 0.6, 0, 1,
-1.206262, 0.03183396, -1.75788, 1, 0.6078432, 0, 1,
-1.202224, -1.399677, -3.337367, 1, 0.6117647, 0, 1,
-1.199751, -0.03735318, -1.851683, 1, 0.6196079, 0, 1,
-1.196572, 0.4329316, -0.8145469, 1, 0.6235294, 0, 1,
-1.190646, 0.3829439, -2.042317, 1, 0.6313726, 0, 1,
-1.187662, -1.555324, -4.798299, 1, 0.6352941, 0, 1,
-1.186865, 0.1935924, -0.7986081, 1, 0.6431373, 0, 1,
-1.175384, -0.3057262, -1.715955, 1, 0.6470588, 0, 1,
-1.163141, -0.6326702, -2.796337, 1, 0.654902, 0, 1,
-1.149572, -0.06165669, -0.9526568, 1, 0.6588235, 0, 1,
-1.148526, -1.691565, -1.687106, 1, 0.6666667, 0, 1,
-1.138198, -0.3557415, -2.026373, 1, 0.6705883, 0, 1,
-1.134538, -1.536435, -3.98347, 1, 0.6784314, 0, 1,
-1.132763, -0.532836, -3.538338, 1, 0.682353, 0, 1,
-1.126195, -0.5172669, -1.452439, 1, 0.6901961, 0, 1,
-1.118825, -0.9634227, -3.056036, 1, 0.6941177, 0, 1,
-1.11645, -0.697009, -2.307657, 1, 0.7019608, 0, 1,
-1.115147, -1.027903, -3.635081, 1, 0.7098039, 0, 1,
-1.112713, 0.8683476, -2.197237, 1, 0.7137255, 0, 1,
-1.109267, 1.181384, 0.5288534, 1, 0.7215686, 0, 1,
-1.106864, -1.176013, -2.910682, 1, 0.7254902, 0, 1,
-1.100866, 1.280219, 0.8730832, 1, 0.7333333, 0, 1,
-1.09513, 0.1107123, -1.351295, 1, 0.7372549, 0, 1,
-1.089116, 0.5549667, -0.3304732, 1, 0.7450981, 0, 1,
-1.088293, -0.1167943, -1.233793, 1, 0.7490196, 0, 1,
-1.087971, -1.213516, -6.300654, 1, 0.7568628, 0, 1,
-1.080334, 0.7498412, -1.685379, 1, 0.7607843, 0, 1,
-1.076367, 0.0684308, -2.023998, 1, 0.7686275, 0, 1,
-1.074967, -0.08733899, -1.994941, 1, 0.772549, 0, 1,
-1.071216, 0.5437109, -3.725829, 1, 0.7803922, 0, 1,
-1.0554, 1.539635, 0.6265665, 1, 0.7843137, 0, 1,
-1.054415, -0.2853616, -1.69952, 1, 0.7921569, 0, 1,
-1.050701, 0.9029885, 0.2171477, 1, 0.7960784, 0, 1,
-1.048174, -0.8918249, -1.718248, 1, 0.8039216, 0, 1,
-1.046298, 0.6440759, -0.8363087, 1, 0.8117647, 0, 1,
-1.043623, 1.583717, -0.5496302, 1, 0.8156863, 0, 1,
-1.043044, -0.1917734, -0.01497029, 1, 0.8235294, 0, 1,
-1.037585, 2.216663, 0.6036209, 1, 0.827451, 0, 1,
-1.028402, -2.984172, -2.015962, 1, 0.8352941, 0, 1,
-1.024904, -0.1798388, -0.5148908, 1, 0.8392157, 0, 1,
-1.020623, -0.2407689, -2.725749, 1, 0.8470588, 0, 1,
-1.020344, 0.9713846, -1.851705, 1, 0.8509804, 0, 1,
-1.013628, -1.272728, -0.6299626, 1, 0.8588235, 0, 1,
-1.01362, -0.7326987, -3.211262, 1, 0.8627451, 0, 1,
-1.008127, -0.5087803, -2.188749, 1, 0.8705882, 0, 1,
-1.0061, -0.5560292, -2.07031, 1, 0.8745098, 0, 1,
-1.001576, 1.647799, -2.661219, 1, 0.8823529, 0, 1,
-0.9984301, -0.8748682, -2.26998, 1, 0.8862745, 0, 1,
-0.9856651, 0.627272, -0.9140183, 1, 0.8941177, 0, 1,
-0.9848308, 1.766757, -2.255475, 1, 0.8980392, 0, 1,
-0.9844021, -2.338514, -3.399535, 1, 0.9058824, 0, 1,
-0.9832551, 0.4852446, 1.074294, 1, 0.9137255, 0, 1,
-0.9799021, -1.127205, -2.854039, 1, 0.9176471, 0, 1,
-0.9777614, -0.6750832, -2.660058, 1, 0.9254902, 0, 1,
-0.9703176, 0.3149415, -1.843661, 1, 0.9294118, 0, 1,
-0.9570123, 0.009807142, -1.754081, 1, 0.9372549, 0, 1,
-0.9475574, 1.14936, -0.6573042, 1, 0.9411765, 0, 1,
-0.9396625, 0.8243991, 1.758154, 1, 0.9490196, 0, 1,
-0.9361511, 2.038106, -0.8347185, 1, 0.9529412, 0, 1,
-0.9338803, 2.838644, -0.3944707, 1, 0.9607843, 0, 1,
-0.9297783, -0.2934434, -3.519907, 1, 0.9647059, 0, 1,
-0.9297476, -0.5282306, -1.465165, 1, 0.972549, 0, 1,
-0.924832, -0.5841652, -1.06243, 1, 0.9764706, 0, 1,
-0.9197132, 0.3623464, -3.194508, 1, 0.9843137, 0, 1,
-0.9120725, -0.9680859, -2.69315, 1, 0.9882353, 0, 1,
-0.9110553, 0.8276295, -0.8647938, 1, 0.9960784, 0, 1,
-0.9088136, 0.5125859, 0.6438468, 0.9960784, 1, 0, 1,
-0.9074802, -1.424201, -1.68621, 0.9921569, 1, 0, 1,
-0.9059133, 0.8206424, -0.6021234, 0.9843137, 1, 0, 1,
-0.9051583, 1.155408, -0.2877299, 0.9803922, 1, 0, 1,
-0.9034276, 1.570812, -2.463402, 0.972549, 1, 0, 1,
-0.9000543, -0.3530638, -0.9368954, 0.9686275, 1, 0, 1,
-0.8941511, -0.44836, -3.75217, 0.9607843, 1, 0, 1,
-0.8881843, 1.650768, -1.716447, 0.9568627, 1, 0, 1,
-0.8794053, 1.06589, -2.295473, 0.9490196, 1, 0, 1,
-0.87762, -0.06915279, -1.459386, 0.945098, 1, 0, 1,
-0.8734576, 0.3489089, -0.8572957, 0.9372549, 1, 0, 1,
-0.8689398, 0.8434737, -1.103673, 0.9333333, 1, 0, 1,
-0.8688768, -0.702524, -3.095928, 0.9254902, 1, 0, 1,
-0.8629446, -0.6170738, -3.326216, 0.9215686, 1, 0, 1,
-0.8591457, -0.03352574, -1.45691, 0.9137255, 1, 0, 1,
-0.8579245, -1.756576, -3.319629, 0.9098039, 1, 0, 1,
-0.8534012, 1.139255, -1.778353, 0.9019608, 1, 0, 1,
-0.8513647, 0.2962593, -0.5654171, 0.8941177, 1, 0, 1,
-0.8492612, 1.235781, -1.338744, 0.8901961, 1, 0, 1,
-0.848996, 0.8555542, -0.6561713, 0.8823529, 1, 0, 1,
-0.8420568, -1.54841, -3.291473, 0.8784314, 1, 0, 1,
-0.8411157, 0.907337, -2.312197, 0.8705882, 1, 0, 1,
-0.8406653, -1.585484, -3.348139, 0.8666667, 1, 0, 1,
-0.8337668, -0.1696959, -1.029145, 0.8588235, 1, 0, 1,
-0.8321085, -0.04456466, -0.1931083, 0.854902, 1, 0, 1,
-0.8310343, 0.4879247, -2.357158, 0.8470588, 1, 0, 1,
-0.829836, -1.660847, -0.8496337, 0.8431373, 1, 0, 1,
-0.8266652, 0.8828255, -0.808512, 0.8352941, 1, 0, 1,
-0.8189948, 1.969229, -2.007029, 0.8313726, 1, 0, 1,
-0.8139069, 0.1898553, -1.381332, 0.8235294, 1, 0, 1,
-0.811774, 0.4924416, 1.86658, 0.8196079, 1, 0, 1,
-0.8116627, -0.7468599, -2.568219, 0.8117647, 1, 0, 1,
-0.8083838, 1.551988, -0.5582111, 0.8078431, 1, 0, 1,
-0.8061719, -0.2365739, -2.983551, 0.8, 1, 0, 1,
-0.8003587, 2.022976, -1.193703, 0.7921569, 1, 0, 1,
-0.7861847, 0.4365069, -0.7485252, 0.7882353, 1, 0, 1,
-0.7852498, -0.3811671, -1.033814, 0.7803922, 1, 0, 1,
-0.7770895, -0.5251998, -4.120977, 0.7764706, 1, 0, 1,
-0.774717, -0.6567653, -4.150823, 0.7686275, 1, 0, 1,
-0.7740989, 0.08504076, -2.804366, 0.7647059, 1, 0, 1,
-0.769233, 0.5548447, -1.295613, 0.7568628, 1, 0, 1,
-0.7672167, -1.382989, -2.858447, 0.7529412, 1, 0, 1,
-0.7641242, 1.236288, 0.01504037, 0.7450981, 1, 0, 1,
-0.7604765, 1.774414, 0.6768888, 0.7411765, 1, 0, 1,
-0.7604038, 1.316303, -0.660525, 0.7333333, 1, 0, 1,
-0.7567951, 0.4452021, -2.074806, 0.7294118, 1, 0, 1,
-0.7537757, -0.1366794, -0.7115895, 0.7215686, 1, 0, 1,
-0.7523153, 0.3984987, -3.015012, 0.7176471, 1, 0, 1,
-0.7505333, -0.1826095, -2.294833, 0.7098039, 1, 0, 1,
-0.7480961, 0.7119979, 0.3497047, 0.7058824, 1, 0, 1,
-0.7455677, 0.7223132, -3.05537, 0.6980392, 1, 0, 1,
-0.7412964, -1.57628, -1.751117, 0.6901961, 1, 0, 1,
-0.7328543, -0.2664863, -1.820401, 0.6862745, 1, 0, 1,
-0.7328038, 1.192514, 0.03517071, 0.6784314, 1, 0, 1,
-0.7318646, -0.1444317, -1.188969, 0.6745098, 1, 0, 1,
-0.7301007, 0.154893, -1.672387, 0.6666667, 1, 0, 1,
-0.7271824, 0.9566637, -0.2673309, 0.6627451, 1, 0, 1,
-0.7269336, -0.3967547, -2.175462, 0.654902, 1, 0, 1,
-0.7264837, 0.143027, -1.464354, 0.6509804, 1, 0, 1,
-0.7221711, -1.238729, -3.01984, 0.6431373, 1, 0, 1,
-0.7044975, -0.5152958, -3.394786, 0.6392157, 1, 0, 1,
-0.7010911, -1.101411, -2.695048, 0.6313726, 1, 0, 1,
-0.7004552, -0.2598858, -2.95816, 0.627451, 1, 0, 1,
-0.6955415, 0.8210858, -0.2684205, 0.6196079, 1, 0, 1,
-0.6939176, -1.355573, -1.999691, 0.6156863, 1, 0, 1,
-0.692673, -0.2356519, -2.250006, 0.6078432, 1, 0, 1,
-0.6904948, 0.9880725, -0.9210752, 0.6039216, 1, 0, 1,
-0.6847591, -2.887744, -3.142789, 0.5960785, 1, 0, 1,
-0.6839485, -1.232047, -3.359334, 0.5882353, 1, 0, 1,
-0.6821824, 0.2307604, -2.945313, 0.5843138, 1, 0, 1,
-0.6804874, -0.4755328, -0.3091466, 0.5764706, 1, 0, 1,
-0.6765693, -0.5585933, -3.037073, 0.572549, 1, 0, 1,
-0.6686553, 0.0937553, -2.393009, 0.5647059, 1, 0, 1,
-0.6676185, -0.2969311, -3.02004, 0.5607843, 1, 0, 1,
-0.6666972, -0.8563885, -3.104477, 0.5529412, 1, 0, 1,
-0.6654525, 0.9785174, -0.4595593, 0.5490196, 1, 0, 1,
-0.6623558, 1.832788, -0.1124517, 0.5411765, 1, 0, 1,
-0.6580153, 0.557398, -1.768708, 0.5372549, 1, 0, 1,
-0.6499615, 2.273434, 0.03818488, 0.5294118, 1, 0, 1,
-0.6476663, 0.9821531, -0.5843649, 0.5254902, 1, 0, 1,
-0.6446916, 0.6007226, -0.4813512, 0.5176471, 1, 0, 1,
-0.6419892, 0.315127, -1.24337, 0.5137255, 1, 0, 1,
-0.6404822, 1.36186, -1.646882, 0.5058824, 1, 0, 1,
-0.6326037, 1.649308, 0.5810132, 0.5019608, 1, 0, 1,
-0.6322104, -0.3552497, -2.966542, 0.4941176, 1, 0, 1,
-0.6300473, -1.106952, -3.350878, 0.4862745, 1, 0, 1,
-0.6295414, -0.04930764, -1.745892, 0.4823529, 1, 0, 1,
-0.6223177, 0.08067181, -2.368885, 0.4745098, 1, 0, 1,
-0.6219121, -1.265211, -2.507466, 0.4705882, 1, 0, 1,
-0.605967, 0.8242577, -0.2578847, 0.4627451, 1, 0, 1,
-0.6053658, -0.2837295, -2.457845, 0.4588235, 1, 0, 1,
-0.6043686, -0.3047854, -0.9338009, 0.4509804, 1, 0, 1,
-0.602254, 0.6445777, 0.2925157, 0.4470588, 1, 0, 1,
-0.6018116, 0.3227457, -2.390643, 0.4392157, 1, 0, 1,
-0.6014934, -0.205226, -2.636767, 0.4352941, 1, 0, 1,
-0.5970978, 0.7169124, -0.286353, 0.427451, 1, 0, 1,
-0.59568, -1.253275, -3.738602, 0.4235294, 1, 0, 1,
-0.5937926, 0.1608645, -1.020164, 0.4156863, 1, 0, 1,
-0.5920912, -0.2573254, -1.643491, 0.4117647, 1, 0, 1,
-0.5896921, 1.092783, 0.3802408, 0.4039216, 1, 0, 1,
-0.5891632, 0.4058283, 0.5652958, 0.3960784, 1, 0, 1,
-0.5861155, -0.0001140164, -3.228767, 0.3921569, 1, 0, 1,
-0.5855906, -0.5291566, -2.57108, 0.3843137, 1, 0, 1,
-0.5826274, -0.9144912, -0.3757156, 0.3803922, 1, 0, 1,
-0.5778255, -1.397579, -2.370512, 0.372549, 1, 0, 1,
-0.5769619, 0.7540239, 1.23144, 0.3686275, 1, 0, 1,
-0.5735426, -0.3529267, -1.373065, 0.3607843, 1, 0, 1,
-0.571371, 0.3840109, -1.582592, 0.3568628, 1, 0, 1,
-0.5686426, 0.003523411, -2.17761, 0.3490196, 1, 0, 1,
-0.568635, -0.3855583, -2.26507, 0.345098, 1, 0, 1,
-0.5685437, 2.543375, 1.410733, 0.3372549, 1, 0, 1,
-0.5667596, 1.082811, -1.38643, 0.3333333, 1, 0, 1,
-0.565638, 0.8228167, -0.7058887, 0.3254902, 1, 0, 1,
-0.5634931, 0.4113473, -2.5012, 0.3215686, 1, 0, 1,
-0.5619085, 0.3132214, -1.559439, 0.3137255, 1, 0, 1,
-0.5617946, 0.3859112, -0.8344233, 0.3098039, 1, 0, 1,
-0.5573319, 2.147532, -0.9937454, 0.3019608, 1, 0, 1,
-0.5533565, -1.538119, -5.872783, 0.2941177, 1, 0, 1,
-0.5481502, -0.2146033, -1.645, 0.2901961, 1, 0, 1,
-0.5424452, 1.100848, -1.048352, 0.282353, 1, 0, 1,
-0.5398368, 0.5495026, -0.8171556, 0.2784314, 1, 0, 1,
-0.5395042, -0.05982783, -0.9323487, 0.2705882, 1, 0, 1,
-0.539492, 0.655333, 0.03287098, 0.2666667, 1, 0, 1,
-0.5393679, 1.832789, -2.272647, 0.2588235, 1, 0, 1,
-0.5360451, 0.4185162, -2.715555, 0.254902, 1, 0, 1,
-0.5325541, -1.59882, -3.753113, 0.2470588, 1, 0, 1,
-0.5304744, -0.4766143, -2.446505, 0.2431373, 1, 0, 1,
-0.5295421, 0.2717328, -1.955916, 0.2352941, 1, 0, 1,
-0.5287823, 0.6408395, -1.617019, 0.2313726, 1, 0, 1,
-0.5285821, -0.186583, 0.3062648, 0.2235294, 1, 0, 1,
-0.5250012, -0.31944, -2.420827, 0.2196078, 1, 0, 1,
-0.5240923, 0.4732729, -0.8059288, 0.2117647, 1, 0, 1,
-0.521792, -0.5101619, -4.01155, 0.2078431, 1, 0, 1,
-0.5168555, 1.711985, -1.198671, 0.2, 1, 0, 1,
-0.5146123, 1.147523, -0.3398262, 0.1921569, 1, 0, 1,
-0.5077737, 1.38318, 0.1218744, 0.1882353, 1, 0, 1,
-0.5066608, 0.5305516, -0.7578037, 0.1803922, 1, 0, 1,
-0.5055794, -1.167503, -3.097391, 0.1764706, 1, 0, 1,
-0.5023766, -0.1808635, -3.304438, 0.1686275, 1, 0, 1,
-0.5011324, -0.3428271, -2.324339, 0.1647059, 1, 0, 1,
-0.4980832, -0.6971364, -2.680754, 0.1568628, 1, 0, 1,
-0.4978081, -0.5079391, -3.730605, 0.1529412, 1, 0, 1,
-0.4976482, 0.6710088, -1.196922, 0.145098, 1, 0, 1,
-0.4929041, -0.5847931, -2.446892, 0.1411765, 1, 0, 1,
-0.4855161, 0.9399423, -0.3042355, 0.1333333, 1, 0, 1,
-0.4851025, 0.464167, -0.6643782, 0.1294118, 1, 0, 1,
-0.4831299, -0.9833837, -1.678177, 0.1215686, 1, 0, 1,
-0.4795805, 0.7182092, 0.3999079, 0.1176471, 1, 0, 1,
-0.4789248, -0.5438725, -0.676722, 0.1098039, 1, 0, 1,
-0.4766722, -0.774276, -2.767869, 0.1058824, 1, 0, 1,
-0.4757847, 1.211277, -1.32116, 0.09803922, 1, 0, 1,
-0.4740463, -0.03160045, -2.181125, 0.09019608, 1, 0, 1,
-0.4739479, 0.7766725, 1.100257, 0.08627451, 1, 0, 1,
-0.4691672, 0.9869692, -0.8897453, 0.07843138, 1, 0, 1,
-0.4637469, 0.4521716, -0.3221878, 0.07450981, 1, 0, 1,
-0.4577341, -0.4929898, -3.539068, 0.06666667, 1, 0, 1,
-0.4571081, -0.4984273, -2.61442, 0.0627451, 1, 0, 1,
-0.456898, -1.06434, -1.970838, 0.05490196, 1, 0, 1,
-0.4540687, 0.2966145, -0.8809273, 0.05098039, 1, 0, 1,
-0.447932, -0.7016768, -2.033991, 0.04313726, 1, 0, 1,
-0.4462089, 0.8466889, 1.458811, 0.03921569, 1, 0, 1,
-0.4433791, 0.006715515, -2.301254, 0.03137255, 1, 0, 1,
-0.4424053, -2.094784, -3.302093, 0.02745098, 1, 0, 1,
-0.4423272, -0.739776, -4.390597, 0.01960784, 1, 0, 1,
-0.4397351, 2.267197, 0.8576088, 0.01568628, 1, 0, 1,
-0.4350092, 1.573931, -2.973964, 0.007843138, 1, 0, 1,
-0.4349231, 1.71788, -0.8796974, 0.003921569, 1, 0, 1,
-0.4338807, 1.843215, 0.3886502, 0, 1, 0.003921569, 1,
-0.4263168, 0.4125134, -1.685007, 0, 1, 0.01176471, 1,
-0.4218599, -0.09616115, -3.320724, 0, 1, 0.01568628, 1,
-0.4142489, -0.1306573, -2.701461, 0, 1, 0.02352941, 1,
-0.4110076, 0.1897363, -1.626479, 0, 1, 0.02745098, 1,
-0.4104247, -1.228203, -2.417408, 0, 1, 0.03529412, 1,
-0.4103311, 0.6556931, -1.226633, 0, 1, 0.03921569, 1,
-0.4069802, -0.4431033, -2.163464, 0, 1, 0.04705882, 1,
-0.3988075, 0.6013941, -1.565433, 0, 1, 0.05098039, 1,
-0.3985506, -1.013519, -2.527855, 0, 1, 0.05882353, 1,
-0.3957112, 0.02665561, -2.018217, 0, 1, 0.0627451, 1,
-0.3905119, 0.7260911, 0.06174967, 0, 1, 0.07058824, 1,
-0.3871137, 0.2687753, -1.273295, 0, 1, 0.07450981, 1,
-0.3844144, 1.076515, 0.5100262, 0, 1, 0.08235294, 1,
-0.3772119, 1.063663, -2.370742, 0, 1, 0.08627451, 1,
-0.3767036, 0.3932665, -0.6036804, 0, 1, 0.09411765, 1,
-0.3762219, 1.172046, 0.1703519, 0, 1, 0.1019608, 1,
-0.3736599, 1.620759, 1.265561, 0, 1, 0.1058824, 1,
-0.373127, -0.3647559, -2.494416, 0, 1, 0.1137255, 1,
-0.3726961, -2.305779, -1.307891, 0, 1, 0.1176471, 1,
-0.368708, -0.8256655, -2.9898, 0, 1, 0.1254902, 1,
-0.3664439, -1.400033, -3.898578, 0, 1, 0.1294118, 1,
-0.3637833, 0.3821995, -0.1683972, 0, 1, 0.1372549, 1,
-0.3558716, 0.786063, -0.8162041, 0, 1, 0.1411765, 1,
-0.3528319, 0.01207031, -1.443739, 0, 1, 0.1490196, 1,
-0.3517852, 0.8222178, 0.188333, 0, 1, 0.1529412, 1,
-0.3465975, -1.738923, -3.293382, 0, 1, 0.1607843, 1,
-0.3412559, -0.7963565, -2.383229, 0, 1, 0.1647059, 1,
-0.3405299, 0.5609818, 1.376859, 0, 1, 0.172549, 1,
-0.3287585, -0.3826424, -3.826877, 0, 1, 0.1764706, 1,
-0.326849, -0.7619981, -2.033121, 0, 1, 0.1843137, 1,
-0.3266338, 0.4801131, -0.8991088, 0, 1, 0.1882353, 1,
-0.3266281, -0.2704374, -1.484415, 0, 1, 0.1960784, 1,
-0.3254812, -1.933845, -3.202719, 0, 1, 0.2039216, 1,
-0.3165116, 0.9931536, 1.379756, 0, 1, 0.2078431, 1,
-0.3147193, -1.755675, -2.229225, 0, 1, 0.2156863, 1,
-0.3128276, -0.4658964, -2.580982, 0, 1, 0.2196078, 1,
-0.3106307, -1.158407, -2.635597, 0, 1, 0.227451, 1,
-0.3099034, -0.3707118, -3.184419, 0, 1, 0.2313726, 1,
-0.3077223, 0.7679844, -0.9251294, 0, 1, 0.2392157, 1,
-0.3061967, -1.156588, -2.639308, 0, 1, 0.2431373, 1,
-0.3007176, -1.104407, -5.769519, 0, 1, 0.2509804, 1,
-0.2990662, -1.999168, -3.437124, 0, 1, 0.254902, 1,
-0.294691, 1.731605, -1.74829, 0, 1, 0.2627451, 1,
-0.2916056, 0.3516004, -0.1464543, 0, 1, 0.2666667, 1,
-0.2899147, 0.9003294, 0.6882612, 0, 1, 0.2745098, 1,
-0.2874028, -0.2921174, -1.929245, 0, 1, 0.2784314, 1,
-0.2869868, 0.12084, -3.309434, 0, 1, 0.2862745, 1,
-0.2849817, -0.3236936, -2.371866, 0, 1, 0.2901961, 1,
-0.2840103, 0.004290478, -1.390831, 0, 1, 0.2980392, 1,
-0.2827395, 0.314945, -1.867547, 0, 1, 0.3058824, 1,
-0.2798401, 1.455877, 0.9330505, 0, 1, 0.3098039, 1,
-0.2771335, 0.1273424, 0.2669565, 0, 1, 0.3176471, 1,
-0.2760882, -0.7161743, -3.862697, 0, 1, 0.3215686, 1,
-0.2752018, 1.982397, 0.2754767, 0, 1, 0.3294118, 1,
-0.2732255, 1.170666, -0.5153378, 0, 1, 0.3333333, 1,
-0.2682717, -1.122296, -4.210768, 0, 1, 0.3411765, 1,
-0.2515433, -2.569978, -2.882638, 0, 1, 0.345098, 1,
-0.2486966, -0.6952778, -2.589465, 0, 1, 0.3529412, 1,
-0.2485083, 0.3133869, -1.04326, 0, 1, 0.3568628, 1,
-0.2471706, -0.9565407, -3.400627, 0, 1, 0.3647059, 1,
-0.2442375, 1.214278, 0.6798173, 0, 1, 0.3686275, 1,
-0.2378042, -1.767998, -2.93398, 0, 1, 0.3764706, 1,
-0.237715, 1.834882, 0.777028, 0, 1, 0.3803922, 1,
-0.2348903, 0.7881281, 0.2151141, 0, 1, 0.3882353, 1,
-0.234455, -1.57293, -2.457632, 0, 1, 0.3921569, 1,
-0.232719, 0.2057873, 0.1898472, 0, 1, 0.4, 1,
-0.2302093, -0.6623139, -4.617905, 0, 1, 0.4078431, 1,
-0.2292658, 0.6489517, -1.037967, 0, 1, 0.4117647, 1,
-0.2272482, -1.414748, -4.808428, 0, 1, 0.4196078, 1,
-0.2251637, -0.2750852, -1.411514, 0, 1, 0.4235294, 1,
-0.2245241, 0.3774318, -1.19557, 0, 1, 0.4313726, 1,
-0.2230706, -0.9308362, -3.807037, 0, 1, 0.4352941, 1,
-0.2218897, 0.5533549, 0.1075279, 0, 1, 0.4431373, 1,
-0.221218, 0.2235418, -0.9823759, 0, 1, 0.4470588, 1,
-0.2210934, 1.096992, -0.3447136, 0, 1, 0.454902, 1,
-0.2199697, 1.164889, -1.299803, 0, 1, 0.4588235, 1,
-0.2178827, 2.01913, -0.2132986, 0, 1, 0.4666667, 1,
-0.2110797, -0.07680999, -2.707793, 0, 1, 0.4705882, 1,
-0.2076754, -0.205412, -2.290286, 0, 1, 0.4784314, 1,
-0.2004708, 0.3844578, -1.739868, 0, 1, 0.4823529, 1,
-0.1964144, -2.180143, -4.443468, 0, 1, 0.4901961, 1,
-0.1932138, 0.6666969, -0.5430633, 0, 1, 0.4941176, 1,
-0.1882501, 1.262576, -0.4708916, 0, 1, 0.5019608, 1,
-0.1882454, 0.3764578, 0.3788799, 0, 1, 0.509804, 1,
-0.1869343, 0.2920221, -0.685285, 0, 1, 0.5137255, 1,
-0.182426, 0.5721692, -0.2630588, 0, 1, 0.5215687, 1,
-0.1761483, 0.5104468, -2.313918, 0, 1, 0.5254902, 1,
-0.1754955, 1.166692, 0.0234374, 0, 1, 0.5333334, 1,
-0.1744716, 0.1194081, -0.9405918, 0, 1, 0.5372549, 1,
-0.1741142, -1.472885, -3.921932, 0, 1, 0.5450981, 1,
-0.1740061, -0.5777524, -2.527224, 0, 1, 0.5490196, 1,
-0.1726885, 0.796589, 0.1840422, 0, 1, 0.5568628, 1,
-0.1707009, -0.1556438, -0.9830324, 0, 1, 0.5607843, 1,
-0.1682431, -1.215131, -3.748464, 0, 1, 0.5686275, 1,
-0.1676219, 0.776341, -0.3480053, 0, 1, 0.572549, 1,
-0.1646061, 0.3922347, 0.3608718, 0, 1, 0.5803922, 1,
-0.1625409, 0.7443392, -0.3250988, 0, 1, 0.5843138, 1,
-0.1572792, 0.1157824, -0.8855828, 0, 1, 0.5921569, 1,
-0.1556197, 1.467432, -0.5992214, 0, 1, 0.5960785, 1,
-0.1381144, 1.409855, -0.6226788, 0, 1, 0.6039216, 1,
-0.1374406, 0.6647232, 0.2581164, 0, 1, 0.6117647, 1,
-0.1360798, -1.244098, -2.520562, 0, 1, 0.6156863, 1,
-0.1342505, -1.296397, -3.881299, 0, 1, 0.6235294, 1,
-0.1311223, -1.291064, -2.530836, 0, 1, 0.627451, 1,
-0.1309799, 1.69575, 1.247926, 0, 1, 0.6352941, 1,
-0.1307679, 0.2508681, -1.809961, 0, 1, 0.6392157, 1,
-0.1302264, -0.6219225, -2.129763, 0, 1, 0.6470588, 1,
-0.1257595, 2.301614, 0.8683975, 0, 1, 0.6509804, 1,
-0.1240907, 0.2469276, -0.3789515, 0, 1, 0.6588235, 1,
-0.1236404, 1.343333, 0.8037028, 0, 1, 0.6627451, 1,
-0.1177931, 0.7118226, -1.19143, 0, 1, 0.6705883, 1,
-0.1160639, 0.9851289, -1.53145, 0, 1, 0.6745098, 1,
-0.1155542, -0.4374833, -2.88713, 0, 1, 0.682353, 1,
-0.1135918, -2.140862, -2.972815, 0, 1, 0.6862745, 1,
-0.1129784, -0.001177792, -1.753282, 0, 1, 0.6941177, 1,
-0.1084532, 1.074409, 1.69746, 0, 1, 0.7019608, 1,
-0.1077066, -0.4607311, -2.941178, 0, 1, 0.7058824, 1,
-0.1070711, -1.081226, -3.292771, 0, 1, 0.7137255, 1,
-0.1012864, -0.4041606, -2.525838, 0, 1, 0.7176471, 1,
-0.1005939, 0.07715096, -1.846891, 0, 1, 0.7254902, 1,
-0.0983834, -1.597229, -2.173805, 0, 1, 0.7294118, 1,
-0.0979142, 0.07035146, -0.7774284, 0, 1, 0.7372549, 1,
-0.09592505, 0.4818328, 0.4777291, 0, 1, 0.7411765, 1,
-0.09500159, 0.2304488, -1.175922, 0, 1, 0.7490196, 1,
-0.09251037, 0.1308604, -0.02525724, 0, 1, 0.7529412, 1,
-0.08874793, 1.004213, -1.059033, 0, 1, 0.7607843, 1,
-0.08792011, 1.652024, 0.9972153, 0, 1, 0.7647059, 1,
-0.08765545, -0.01074804, -1.703693, 0, 1, 0.772549, 1,
-0.08662249, 0.9496675, -0.8092555, 0, 1, 0.7764706, 1,
-0.08649341, 0.5179195, 0.1117818, 0, 1, 0.7843137, 1,
-0.08175858, 0.8622847, -1.077288, 0, 1, 0.7882353, 1,
-0.08099699, -0.7691371, -0.6359744, 0, 1, 0.7960784, 1,
-0.07598022, 1.031667, -1.38415, 0, 1, 0.8039216, 1,
-0.07283568, 0.5832794, 0.1417309, 0, 1, 0.8078431, 1,
-0.07236646, -1.355645, -4.622369, 0, 1, 0.8156863, 1,
-0.06280462, -0.570803, -1.735027, 0, 1, 0.8196079, 1,
-0.05959322, -0.238603, -3.700848, 0, 1, 0.827451, 1,
-0.05930308, -1.33443, -2.579148, 0, 1, 0.8313726, 1,
-0.05767141, -0.6319149, -2.900671, 0, 1, 0.8392157, 1,
-0.0572547, 0.1257963, 0.9039109, 0, 1, 0.8431373, 1,
-0.05639035, 0.3051989, -1.128708, 0, 1, 0.8509804, 1,
-0.05549334, 1.517577, -0.6674897, 0, 1, 0.854902, 1,
-0.05512457, 0.2177284, -0.4024198, 0, 1, 0.8627451, 1,
-0.05290826, 0.8923224, 0.4941562, 0, 1, 0.8666667, 1,
-0.0515513, -1.614733, -4.171102, 0, 1, 0.8745098, 1,
-0.05132734, 1.925759, 0.9756212, 0, 1, 0.8784314, 1,
-0.05049898, -1.475432, -2.376622, 0, 1, 0.8862745, 1,
-0.04950146, -1.07203, -1.601144, 0, 1, 0.8901961, 1,
-0.04860996, -0.2242878, -2.643622, 0, 1, 0.8980392, 1,
-0.04605031, 1.581286, -0.2537768, 0, 1, 0.9058824, 1,
-0.0433787, -0.9840274, -4.412622, 0, 1, 0.9098039, 1,
-0.03801627, 0.1423445, 0.5191132, 0, 1, 0.9176471, 1,
-0.03461577, -0.905099, -3.927088, 0, 1, 0.9215686, 1,
-0.03455563, 0.4753501, -0.6843028, 0, 1, 0.9294118, 1,
-0.03440847, -0.7805858, -2.483238, 0, 1, 0.9333333, 1,
-0.0337502, -0.003763694, -2.429784, 0, 1, 0.9411765, 1,
-0.03269885, -0.5804695, -3.161098, 0, 1, 0.945098, 1,
-0.02672444, -0.4068077, -4.839875, 0, 1, 0.9529412, 1,
-0.02481323, -1.574754, -1.921849, 0, 1, 0.9568627, 1,
-0.02062374, 0.5824897, 1.427036, 0, 1, 0.9647059, 1,
-0.01980097, -0.5746244, -4.716177, 0, 1, 0.9686275, 1,
-0.01545394, 0.3746785, -0.2279982, 0, 1, 0.9764706, 1,
-0.01353566, -0.3290167, -2.764484, 0, 1, 0.9803922, 1,
-0.01184836, 0.7767311, -0.5048426, 0, 1, 0.9882353, 1,
-0.009341278, -0.8488235, -2.018567, 0, 1, 0.9921569, 1,
-0.008014625, 0.2406661, 3.299735, 0, 1, 1, 1,
-0.004831067, -1.001754, -3.281257, 0, 0.9921569, 1, 1,
-0.0001479399, 0.1023149, 1.733025, 0, 0.9882353, 1, 1,
0.001530401, 0.3235689, 0.8056048, 0, 0.9803922, 1, 1,
0.008585515, -0.6959404, 2.94499, 0, 0.9764706, 1, 1,
0.009293023, 1.510122, 0.03456442, 0, 0.9686275, 1, 1,
0.01214411, 0.03198143, 0.8626895, 0, 0.9647059, 1, 1,
0.01334913, -1.8311, 1.2132, 0, 0.9568627, 1, 1,
0.01475098, 0.2942387, -0.9596888, 0, 0.9529412, 1, 1,
0.01486824, -0.5116962, 2.991194, 0, 0.945098, 1, 1,
0.01606623, -0.06460421, 4.544269, 0, 0.9411765, 1, 1,
0.01939562, 0.2191489, 1.286313, 0, 0.9333333, 1, 1,
0.01950058, -0.6659394, 3.576569, 0, 0.9294118, 1, 1,
0.01954022, -0.8325279, 4.860264, 0, 0.9215686, 1, 1,
0.02395184, -0.192343, 1.421369, 0, 0.9176471, 1, 1,
0.02647715, -1.33389, 3.441199, 0, 0.9098039, 1, 1,
0.02676423, -0.04111651, 3.359048, 0, 0.9058824, 1, 1,
0.02794837, 0.04573095, 0.5629224, 0, 0.8980392, 1, 1,
0.02841166, 0.3238966, -1.292676, 0, 0.8901961, 1, 1,
0.03100078, -0.2811002, 3.235349, 0, 0.8862745, 1, 1,
0.03162953, -0.2179916, 1.763714, 0, 0.8784314, 1, 1,
0.03270857, 0.7818491, -1.520227, 0, 0.8745098, 1, 1,
0.03694445, -0.3521709, 1.962947, 0, 0.8666667, 1, 1,
0.03952797, -1.243391, 3.911213, 0, 0.8627451, 1, 1,
0.04548353, 1.015578, -0.05472442, 0, 0.854902, 1, 1,
0.04577602, -1.099359, 1.92883, 0, 0.8509804, 1, 1,
0.04713701, 1.201634, 1.037401, 0, 0.8431373, 1, 1,
0.04759783, -0.9254451, 3.849514, 0, 0.8392157, 1, 1,
0.0480499, 1.192681, 0.1680361, 0, 0.8313726, 1, 1,
0.04848964, 1.961839, -0.4421677, 0, 0.827451, 1, 1,
0.04851153, -0.8536745, 2.889031, 0, 0.8196079, 1, 1,
0.05498834, -0.1303038, 2.192827, 0, 0.8156863, 1, 1,
0.05698987, -0.345412, 3.289664, 0, 0.8078431, 1, 1,
0.05905811, -0.7734591, 2.135204, 0, 0.8039216, 1, 1,
0.06121567, -1.215568, 3.655815, 0, 0.7960784, 1, 1,
0.06158436, -0.6044474, 1.696231, 0, 0.7882353, 1, 1,
0.0676787, -0.7435269, 2.580417, 0, 0.7843137, 1, 1,
0.07206601, 0.3026222, -0.1427248, 0, 0.7764706, 1, 1,
0.08218201, -1.423066, 2.222553, 0, 0.772549, 1, 1,
0.0839062, -0.05007054, 2.446492, 0, 0.7647059, 1, 1,
0.09431124, 0.08981894, 0.6347178, 0, 0.7607843, 1, 1,
0.09784245, -0.6289428, 0.8750359, 0, 0.7529412, 1, 1,
0.09816606, 0.03882188, 1.43456, 0, 0.7490196, 1, 1,
0.1002228, -0.8334486, 3.920411, 0, 0.7411765, 1, 1,
0.1027761, -0.5427564, 1.413324, 0, 0.7372549, 1, 1,
0.1049177, 0.7556839, 2.542078, 0, 0.7294118, 1, 1,
0.108119, -0.2510311, 1.874851, 0, 0.7254902, 1, 1,
0.1085775, -0.03695868, 2.370834, 0, 0.7176471, 1, 1,
0.1096296, 0.1171752, 2.709618, 0, 0.7137255, 1, 1,
0.1097404, 0.8307037, -2.375009, 0, 0.7058824, 1, 1,
0.1199433, 0.3884428, 1.605173, 0, 0.6980392, 1, 1,
0.1223044, 1.650253, -2.131766, 0, 0.6941177, 1, 1,
0.12265, 0.3002559, 1.119449, 0, 0.6862745, 1, 1,
0.1256386, -0.2820164, 2.932328, 0, 0.682353, 1, 1,
0.1258921, -0.3770896, 3.01325, 0, 0.6745098, 1, 1,
0.1267329, -0.3099138, 2.290729, 0, 0.6705883, 1, 1,
0.1301714, -0.4668923, 2.735024, 0, 0.6627451, 1, 1,
0.1370912, -0.08824064, 3.909975, 0, 0.6588235, 1, 1,
0.137322, 1.270688, -2.501611, 0, 0.6509804, 1, 1,
0.139558, 0.1704792, 1.240278, 0, 0.6470588, 1, 1,
0.1399296, 0.2561423, 0.4015526, 0, 0.6392157, 1, 1,
0.1408487, 0.6437362, 0.497246, 0, 0.6352941, 1, 1,
0.1412755, -1.258739, 3.193757, 0, 0.627451, 1, 1,
0.1435289, 1.055204, -0.5244614, 0, 0.6235294, 1, 1,
0.145215, -1.233759, 2.003677, 0, 0.6156863, 1, 1,
0.146568, 1.159989, 1.223226, 0, 0.6117647, 1, 1,
0.1502905, 0.5832394, -0.7489858, 0, 0.6039216, 1, 1,
0.1521113, 0.2672907, 0.5814556, 0, 0.5960785, 1, 1,
0.154244, 1.707201, 2.081793, 0, 0.5921569, 1, 1,
0.1572705, -0.69121, 2.699185, 0, 0.5843138, 1, 1,
0.1626823, -1.354149, 3.232915, 0, 0.5803922, 1, 1,
0.1639191, 2.204382, 0.3796557, 0, 0.572549, 1, 1,
0.165969, 1.000477, -0.6902015, 0, 0.5686275, 1, 1,
0.1663779, 0.4144045, 0.4083162, 0, 0.5607843, 1, 1,
0.1678569, -0.224869, 1.820684, 0, 0.5568628, 1, 1,
0.1705192, 0.7202021, 0.1520683, 0, 0.5490196, 1, 1,
0.1707525, -1.110109, 3.332036, 0, 0.5450981, 1, 1,
0.1714371, -0.6474453, 4.309613, 0, 0.5372549, 1, 1,
0.1716764, -0.3337555, 3.155629, 0, 0.5333334, 1, 1,
0.1750249, 0.02120385, 0.9197221, 0, 0.5254902, 1, 1,
0.175371, -1.850731, 4.234282, 0, 0.5215687, 1, 1,
0.1851164, 0.7318223, 0.5534591, 0, 0.5137255, 1, 1,
0.1852234, 1.178219, 0.7790136, 0, 0.509804, 1, 1,
0.1856282, 0.3594828, -0.01777358, 0, 0.5019608, 1, 1,
0.1880052, 1.226299, 2.352339, 0, 0.4941176, 1, 1,
0.1886876, -0.2887248, 2.796878, 0, 0.4901961, 1, 1,
0.1981079, 0.883321, 0.8840795, 0, 0.4823529, 1, 1,
0.1987602, 1.649961, 1.576303, 0, 0.4784314, 1, 1,
0.2051429, 0.9083722, -0.1664517, 0, 0.4705882, 1, 1,
0.2052478, -0.4372464, 3.289134, 0, 0.4666667, 1, 1,
0.2146264, -0.4479259, 3.754778, 0, 0.4588235, 1, 1,
0.2166991, 1.423729, 1.023564, 0, 0.454902, 1, 1,
0.2168812, 0.1178191, 1.876815, 0, 0.4470588, 1, 1,
0.2171338, -0.1070711, 1.621327, 0, 0.4431373, 1, 1,
0.2174346, 0.5664319, -1.772865, 0, 0.4352941, 1, 1,
0.2190385, 0.4972294, 0.1790065, 0, 0.4313726, 1, 1,
0.2212865, 0.909391, 1.658693, 0, 0.4235294, 1, 1,
0.2217557, -0.7789772, 0.91495, 0, 0.4196078, 1, 1,
0.224463, 0.8201334, 0.6615058, 0, 0.4117647, 1, 1,
0.225325, 0.7611601, 0.2595106, 0, 0.4078431, 1, 1,
0.2255588, -0.9200088, 1.630019, 0, 0.4, 1, 1,
0.227022, -0.1433265, 0.9117475, 0, 0.3921569, 1, 1,
0.227337, 0.4349308, 1.831827, 0, 0.3882353, 1, 1,
0.2295884, -0.9810663, 1.617139, 0, 0.3803922, 1, 1,
0.2366574, -0.5142721, 2.685795, 0, 0.3764706, 1, 1,
0.2450384, -1.802782, 6.655173, 0, 0.3686275, 1, 1,
0.2455569, -0.009739349, 1.002748, 0, 0.3647059, 1, 1,
0.2489863, 0.9719861, 0.7640414, 0, 0.3568628, 1, 1,
0.2518868, -0.1235887, 3.484423, 0, 0.3529412, 1, 1,
0.2546785, -0.09843204, 1.391538, 0, 0.345098, 1, 1,
0.2550778, -0.1728413, 2.858988, 0, 0.3411765, 1, 1,
0.2568018, -0.06226107, 1.862188, 0, 0.3333333, 1, 1,
0.2606079, 0.05856684, 0.971989, 0, 0.3294118, 1, 1,
0.2616236, -0.1841172, 1.774578, 0, 0.3215686, 1, 1,
0.2621424, 0.6839553, 1.272378, 0, 0.3176471, 1, 1,
0.2623348, -0.5603271, 2.622869, 0, 0.3098039, 1, 1,
0.2628919, -0.5527983, 1.512661, 0, 0.3058824, 1, 1,
0.2634056, 1.743683, -0.8916855, 0, 0.2980392, 1, 1,
0.2662199, 0.7635954, 1.469713, 0, 0.2901961, 1, 1,
0.2718573, 2.821138, 0.9327983, 0, 0.2862745, 1, 1,
0.2733282, 0.141198, 1.908843, 0, 0.2784314, 1, 1,
0.2751716, 1.063045, 0.6377869, 0, 0.2745098, 1, 1,
0.2760102, 0.2210605, 0.4084051, 0, 0.2666667, 1, 1,
0.2767875, -0.5781532, 2.86935, 0, 0.2627451, 1, 1,
0.2839794, 0.2382781, -1.850705, 0, 0.254902, 1, 1,
0.2940347, 0.775659, 0.7809764, 0, 0.2509804, 1, 1,
0.2941521, -1.893474, 3.926241, 0, 0.2431373, 1, 1,
0.2964373, -0.1919642, 3.211421, 0, 0.2392157, 1, 1,
0.2974692, 0.5856624, -0.334179, 0, 0.2313726, 1, 1,
0.3007815, 0.3246276, 1.257062, 0, 0.227451, 1, 1,
0.3080491, 0.2416846, -1.817558, 0, 0.2196078, 1, 1,
0.3154674, 0.1203087, 2.533611, 0, 0.2156863, 1, 1,
0.3171706, -0.8990598, 3.723516, 0, 0.2078431, 1, 1,
0.317834, -1.196076, 4.173038, 0, 0.2039216, 1, 1,
0.3186359, 1.451699, 1.525068, 0, 0.1960784, 1, 1,
0.3226741, 0.3151522, -0.5814751, 0, 0.1882353, 1, 1,
0.3245087, 0.9320205, 0.7477524, 0, 0.1843137, 1, 1,
0.3251404, -0.4205502, 2.391411, 0, 0.1764706, 1, 1,
0.3272956, 0.307608, 1.435279, 0, 0.172549, 1, 1,
0.3276175, 0.06392834, 2.260239, 0, 0.1647059, 1, 1,
0.3292592, 1.063797, 1.877412, 0, 0.1607843, 1, 1,
0.3296388, 0.7372879, -0.6980274, 0, 0.1529412, 1, 1,
0.3316121, -0.252868, 4.217775, 0, 0.1490196, 1, 1,
0.3336027, 0.7216645, 0.2525496, 0, 0.1411765, 1, 1,
0.3360802, 0.8428373, 1.003264, 0, 0.1372549, 1, 1,
0.3409596, -1.117775, 3.044042, 0, 0.1294118, 1, 1,
0.3414637, 0.3871661, 2.442637, 0, 0.1254902, 1, 1,
0.3464418, 1.276058, -0.2262791, 0, 0.1176471, 1, 1,
0.3492619, 1.092308, -0.0765634, 0, 0.1137255, 1, 1,
0.3518964, -0.1422299, 1.29403, 0, 0.1058824, 1, 1,
0.3567469, 1.695871, 0.7896465, 0, 0.09803922, 1, 1,
0.3629252, 0.761461, 0.1955926, 0, 0.09411765, 1, 1,
0.3653641, 1.078279, 0.1888012, 0, 0.08627451, 1, 1,
0.3684449, 0.9251564, -0.4235161, 0, 0.08235294, 1, 1,
0.3723118, 0.416003, -0.8397738, 0, 0.07450981, 1, 1,
0.3790231, -1.126638, 4.333656, 0, 0.07058824, 1, 1,
0.3820341, 0.3361363, 1.597052, 0, 0.0627451, 1, 1,
0.3837154, -0.1547566, 2.476236, 0, 0.05882353, 1, 1,
0.3897214, 1.517403, 0.321445, 0, 0.05098039, 1, 1,
0.3915682, -1.365737, 1.125321, 0, 0.04705882, 1, 1,
0.391975, 1.860991, 0.7727603, 0, 0.03921569, 1, 1,
0.394196, 0.5127279, 0.5483392, 0, 0.03529412, 1, 1,
0.3946959, 0.4402994, 0.3533377, 0, 0.02745098, 1, 1,
0.3957022, 0.9567984, 1.721087, 0, 0.02352941, 1, 1,
0.4015682, -0.4578571, 1.814347, 0, 0.01568628, 1, 1,
0.4061714, 0.7364724, -1.958016, 0, 0.01176471, 1, 1,
0.4091195, -0.6254729, 2.57574, 0, 0.003921569, 1, 1,
0.412701, 0.1222355, 3.923359, 0.003921569, 0, 1, 1,
0.4150097, 0.5892884, 0.4138187, 0.007843138, 0, 1, 1,
0.4194141, -0.5424762, 2.095032, 0.01568628, 0, 1, 1,
0.4204561, 0.1894397, -1.154544, 0.01960784, 0, 1, 1,
0.4207851, 0.6462799, -0.5731821, 0.02745098, 0, 1, 1,
0.4227669, -0.2094217, 0.1920978, 0.03137255, 0, 1, 1,
0.4248573, 0.06308959, 1.014609, 0.03921569, 0, 1, 1,
0.424936, 1.637227, 2.646801, 0.04313726, 0, 1, 1,
0.4316015, -0.06967156, 1.777496, 0.05098039, 0, 1, 1,
0.4359311, 0.4539823, 0.359007, 0.05490196, 0, 1, 1,
0.4362489, 1.805545, 1.886616, 0.0627451, 0, 1, 1,
0.436527, -0.5844258, 2.430795, 0.06666667, 0, 1, 1,
0.438992, 0.4684361, 0.3595239, 0.07450981, 0, 1, 1,
0.4401248, 1.154104, -0.06207307, 0.07843138, 0, 1, 1,
0.4482746, 0.2499232, 0.4765831, 0.08627451, 0, 1, 1,
0.4499177, -1.135132, 1.884401, 0.09019608, 0, 1, 1,
0.4612162, 0.207876, 0.8638855, 0.09803922, 0, 1, 1,
0.4729563, 1.667263, 1.434879, 0.1058824, 0, 1, 1,
0.473505, 0.6954949, 2.156426, 0.1098039, 0, 1, 1,
0.4818587, 0.2687578, 1.236799, 0.1176471, 0, 1, 1,
0.4819036, -2.7178, 2.625588, 0.1215686, 0, 1, 1,
0.4865688, 0.3471502, 1.851435, 0.1294118, 0, 1, 1,
0.4888319, -0.8355834, 3.465962, 0.1333333, 0, 1, 1,
0.4929641, -0.1879139, 1.514301, 0.1411765, 0, 1, 1,
0.4978876, 1.138941, -0.3985766, 0.145098, 0, 1, 1,
0.498868, 1.971541, 1.648979, 0.1529412, 0, 1, 1,
0.5009385, -0.1726808, 2.680657, 0.1568628, 0, 1, 1,
0.50293, 0.3335336, 0.8770139, 0.1647059, 0, 1, 1,
0.5087971, -0.5507724, 1.829982, 0.1686275, 0, 1, 1,
0.5120162, -0.02697005, 1.66134, 0.1764706, 0, 1, 1,
0.5124605, 0.5842828, 1.28491, 0.1803922, 0, 1, 1,
0.5129971, 0.7732255, 1.152135, 0.1882353, 0, 1, 1,
0.5148553, 0.60861, 1.54237, 0.1921569, 0, 1, 1,
0.522805, 0.4324897, 0.6095895, 0.2, 0, 1, 1,
0.5243158, -0.7090936, 2.816143, 0.2078431, 0, 1, 1,
0.5243756, 0.4398697, -0.6176437, 0.2117647, 0, 1, 1,
0.5267419, 1.515637, -1.501367, 0.2196078, 0, 1, 1,
0.5325011, 0.07014313, 0.7983618, 0.2235294, 0, 1, 1,
0.5336162, 0.08341205, 1.38159, 0.2313726, 0, 1, 1,
0.5344568, -1.232066, 4.081346, 0.2352941, 0, 1, 1,
0.5351257, -1.200112, 1.014984, 0.2431373, 0, 1, 1,
0.5364769, -0.7998672, 1.953345, 0.2470588, 0, 1, 1,
0.5416569, -0.4893481, 2.936767, 0.254902, 0, 1, 1,
0.5427966, -1.595907, 3.3786, 0.2588235, 0, 1, 1,
0.5458504, -0.09229825, 1.908429, 0.2666667, 0, 1, 1,
0.5528439, 0.5841007, 0.09275623, 0.2705882, 0, 1, 1,
0.5533518, 0.6348748, 1.394866, 0.2784314, 0, 1, 1,
0.5564222, -0.7438079, 3.487589, 0.282353, 0, 1, 1,
0.5605588, -1.73138, 2.89854, 0.2901961, 0, 1, 1,
0.5606394, 0.9360069, 0.5138581, 0.2941177, 0, 1, 1,
0.5641659, -0.3940136, 2.041409, 0.3019608, 0, 1, 1,
0.5648221, -0.01665891, -0.2142696, 0.3098039, 0, 1, 1,
0.5716347, 0.4180276, -0.1994077, 0.3137255, 0, 1, 1,
0.5717757, -1.381657, 3.576246, 0.3215686, 0, 1, 1,
0.5732835, 0.4458149, 2.297153, 0.3254902, 0, 1, 1,
0.5741541, -0.6666546, 2.659541, 0.3333333, 0, 1, 1,
0.5744278, 0.5214171, 0.9290094, 0.3372549, 0, 1, 1,
0.5807912, -0.1480697, 1.22339, 0.345098, 0, 1, 1,
0.583975, 0.2130209, 1.100022, 0.3490196, 0, 1, 1,
0.5919603, -0.9174965, 2.514289, 0.3568628, 0, 1, 1,
0.5947113, -0.1464521, 3.51483, 0.3607843, 0, 1, 1,
0.5954398, -2.315114, 2.565252, 0.3686275, 0, 1, 1,
0.600188, -0.1803328, -0.09016068, 0.372549, 0, 1, 1,
0.6012385, 0.8156158, 1.559098, 0.3803922, 0, 1, 1,
0.6034014, 1.150357, -1.312157, 0.3843137, 0, 1, 1,
0.6092169, 1.806396, 0.05011838, 0.3921569, 0, 1, 1,
0.6105468, 0.8858753, -0.1086094, 0.3960784, 0, 1, 1,
0.6130536, -0.6561263, 2.024229, 0.4039216, 0, 1, 1,
0.6148784, -1.469733, 2.181464, 0.4117647, 0, 1, 1,
0.6151267, 1.090808, 0.9208674, 0.4156863, 0, 1, 1,
0.6154197, 0.4698726, 0.8604748, 0.4235294, 0, 1, 1,
0.6231446, -0.608734, 3.754847, 0.427451, 0, 1, 1,
0.6237878, -0.9004609, 2.926444, 0.4352941, 0, 1, 1,
0.6259546, 0.9296895, 0.4101122, 0.4392157, 0, 1, 1,
0.629819, 0.7127393, -0.3408954, 0.4470588, 0, 1, 1,
0.6305575, 0.3805805, 1.320028, 0.4509804, 0, 1, 1,
0.6330375, -0.2647318, 1.999931, 0.4588235, 0, 1, 1,
0.6333905, -0.3294845, 3.754947, 0.4627451, 0, 1, 1,
0.6398103, -1.11628, 4.21841, 0.4705882, 0, 1, 1,
0.6462615, -0.4625795, 1.982053, 0.4745098, 0, 1, 1,
0.6474362, 1.82289, -0.6339667, 0.4823529, 0, 1, 1,
0.6491954, -1.648098, 2.43428, 0.4862745, 0, 1, 1,
0.6552588, 0.237568, 2.107062, 0.4941176, 0, 1, 1,
0.6567509, 0.4114662, -0.8620526, 0.5019608, 0, 1, 1,
0.657254, 0.8530813, 0.6235291, 0.5058824, 0, 1, 1,
0.665834, -3.383004, 4.475174, 0.5137255, 0, 1, 1,
0.6700061, -1.191916, 1.626798, 0.5176471, 0, 1, 1,
0.6725192, 0.9861225, 2.508909, 0.5254902, 0, 1, 1,
0.6748819, 0.2841739, 0.03257808, 0.5294118, 0, 1, 1,
0.6798455, -1.079919, 4.75963, 0.5372549, 0, 1, 1,
0.6800419, -0.7508435, 2.677825, 0.5411765, 0, 1, 1,
0.6812679, -0.05772523, 2.032557, 0.5490196, 0, 1, 1,
0.68685, -0.2325435, 1.908335, 0.5529412, 0, 1, 1,
0.6910709, -1.348193, 2.984392, 0.5607843, 0, 1, 1,
0.6971638, -1.743413, 1.952863, 0.5647059, 0, 1, 1,
0.698873, 0.5911743, 0.3376092, 0.572549, 0, 1, 1,
0.7010903, -0.7509485, 1.802628, 0.5764706, 0, 1, 1,
0.7206275, -0.3245972, 1.935936, 0.5843138, 0, 1, 1,
0.7235798, -0.02751945, 1.772093, 0.5882353, 0, 1, 1,
0.7263918, -0.07335661, 0.7090519, 0.5960785, 0, 1, 1,
0.7404365, 2.080911, -0.2023495, 0.6039216, 0, 1, 1,
0.7425623, -0.2914648, 2.208707, 0.6078432, 0, 1, 1,
0.7553939, 0.430308, 0.5020351, 0.6156863, 0, 1, 1,
0.7559316, 0.8073528, -1.115098, 0.6196079, 0, 1, 1,
0.7571496, 0.9629234, 1.306558, 0.627451, 0, 1, 1,
0.7619844, -0.4332671, 2.334461, 0.6313726, 0, 1, 1,
0.7729463, -1.28245, 1.233223, 0.6392157, 0, 1, 1,
0.7765667, -0.1937469, 1.55345, 0.6431373, 0, 1, 1,
0.7775578, 1.747585, 1.669253, 0.6509804, 0, 1, 1,
0.7778437, 0.8218904, 0.0536896, 0.654902, 0, 1, 1,
0.7831328, -0.844215, 4.450034, 0.6627451, 0, 1, 1,
0.789454, 0.1429606, 2.920138, 0.6666667, 0, 1, 1,
0.7935899, -0.3433404, 3.169723, 0.6745098, 0, 1, 1,
0.7954535, -0.9581576, 1.390889, 0.6784314, 0, 1, 1,
0.7976912, 1.274892, 0.5215186, 0.6862745, 0, 1, 1,
0.8002768, 2.698695, -1.128343, 0.6901961, 0, 1, 1,
0.8023903, -0.2480917, -0.5733997, 0.6980392, 0, 1, 1,
0.8088913, -0.8928534, 3.276563, 0.7058824, 0, 1, 1,
0.8121041, 0.5196336, 1.719456, 0.7098039, 0, 1, 1,
0.8130511, -0.04355147, 3.479584, 0.7176471, 0, 1, 1,
0.8131962, 0.9626043, 1.124247, 0.7215686, 0, 1, 1,
0.8144384, 0.09839899, 2.527706, 0.7294118, 0, 1, 1,
0.8180105, -0.8036636, 1.768131, 0.7333333, 0, 1, 1,
0.8187274, 0.6598316, 0.06779361, 0.7411765, 0, 1, 1,
0.8204618, -0.6393244, 1.839048, 0.7450981, 0, 1, 1,
0.821535, -1.38127, 1.784058, 0.7529412, 0, 1, 1,
0.8240263, -0.1952636, 1.850201, 0.7568628, 0, 1, 1,
0.826525, -0.6721753, 2.094695, 0.7647059, 0, 1, 1,
0.8328684, 0.2114186, 0.04675168, 0.7686275, 0, 1, 1,
0.8450326, 0.8839915, 1.591558, 0.7764706, 0, 1, 1,
0.8465061, 0.4539891, -0.04296247, 0.7803922, 0, 1, 1,
0.8529546, -1.927714, 1.287644, 0.7882353, 0, 1, 1,
0.8555694, -0.2818124, 2.768335, 0.7921569, 0, 1, 1,
0.8560462, 0.5862496, 1.533699, 0.8, 0, 1, 1,
0.8584776, 0.8665836, 0.7540543, 0.8078431, 0, 1, 1,
0.8756129, 0.03637645, 2.579321, 0.8117647, 0, 1, 1,
0.8768398, -0.7279983, 2.590441, 0.8196079, 0, 1, 1,
0.8802274, 0.7907495, 0.0819873, 0.8235294, 0, 1, 1,
0.8805279, 0.3504933, 1.018218, 0.8313726, 0, 1, 1,
0.8902858, -0.1836844, 2.90054, 0.8352941, 0, 1, 1,
0.8913003, 0.7589974, 1.0321, 0.8431373, 0, 1, 1,
0.8918175, -0.04439222, 2.642944, 0.8470588, 0, 1, 1,
0.8998834, -0.2204314, 2.162055, 0.854902, 0, 1, 1,
0.9018949, -0.9401259, 0.9401519, 0.8588235, 0, 1, 1,
0.903432, 0.579665, 0.2993529, 0.8666667, 0, 1, 1,
0.9041059, -0.6139193, 0.9237033, 0.8705882, 0, 1, 1,
0.9044343, 0.7206369, -0.9457571, 0.8784314, 0, 1, 1,
0.9093281, 0.6508978, 0.4885806, 0.8823529, 0, 1, 1,
0.9120666, 0.2774303, 0.1663172, 0.8901961, 0, 1, 1,
0.9122399, -1.553932, 2.326, 0.8941177, 0, 1, 1,
0.91636, 1.023119, -0.66829, 0.9019608, 0, 1, 1,
0.918519, 0.9175458, 1.170182, 0.9098039, 0, 1, 1,
0.9209867, 0.2803979, 0.6271162, 0.9137255, 0, 1, 1,
0.9239248, 0.3707399, 1.128869, 0.9215686, 0, 1, 1,
0.9264623, 0.180774, 1.90418, 0.9254902, 0, 1, 1,
0.9317778, 0.3926345, -0.5144338, 0.9333333, 0, 1, 1,
0.9322565, 0.6908435, 1.582387, 0.9372549, 0, 1, 1,
0.9345034, -0.45521, 2.743155, 0.945098, 0, 1, 1,
0.9416671, -0.01314586, 3.200938, 0.9490196, 0, 1, 1,
0.9440191, -0.7270741, 1.802437, 0.9568627, 0, 1, 1,
0.9455391, -2.194972, 1.989147, 0.9607843, 0, 1, 1,
0.9465918, 1.535506, 0.1883782, 0.9686275, 0, 1, 1,
0.9474148, 0.517747, 1.121346, 0.972549, 0, 1, 1,
0.949044, -0.1332028, 2.152814, 0.9803922, 0, 1, 1,
0.950269, 1.036286, 0.7709554, 0.9843137, 0, 1, 1,
0.9512419, 1.498778, 1.359322, 0.9921569, 0, 1, 1,
0.9533682, 0.76505, 1.982503, 0.9960784, 0, 1, 1,
0.9621079, 0.6464897, 1.213936, 1, 0, 0.9960784, 1,
0.9645528, 0.03402366, 0.3809685, 1, 0, 0.9882353, 1,
0.9665437, 0.2110484, 3.162541, 1, 0, 0.9843137, 1,
0.9665918, 1.254497, 1.971071, 1, 0, 0.9764706, 1,
0.9681128, 2.547355, 0.6745598, 1, 0, 0.972549, 1,
0.9690577, -0.8805938, 3.678878, 1, 0, 0.9647059, 1,
0.9693604, -0.9104612, 3.42934, 1, 0, 0.9607843, 1,
0.9802073, -0.9039496, 2.233239, 1, 0, 0.9529412, 1,
0.9822173, -0.1912501, 4.055555, 1, 0, 0.9490196, 1,
0.9831048, 1.019632, 2.380139, 1, 0, 0.9411765, 1,
0.9842244, -0.2963206, 1.072154, 1, 0, 0.9372549, 1,
0.988857, -0.5321547, 0.5589689, 1, 0, 0.9294118, 1,
0.9942451, -0.9872666, 0.9953117, 1, 0, 0.9254902, 1,
0.9943246, 0.02123401, -0.05488139, 1, 0, 0.9176471, 1,
0.9943807, 3.17267, 0.9583553, 1, 0, 0.9137255, 1,
0.9944531, 1.315758, 0.6980153, 1, 0, 0.9058824, 1,
1.006816, 1.542695, 2.093206, 1, 0, 0.9019608, 1,
1.010146, -0.7657339, 2.981669, 1, 0, 0.8941177, 1,
1.012576, -1.424127, 0.9337959, 1, 0, 0.8862745, 1,
1.01482, 0.4768666, 1.081108, 1, 0, 0.8823529, 1,
1.026234, -2.524904, 2.178167, 1, 0, 0.8745098, 1,
1.0324, -0.01048301, 1.433987, 1, 0, 0.8705882, 1,
1.033075, 0.2015551, 0.3872207, 1, 0, 0.8627451, 1,
1.041928, 1.943749, 2.250788, 1, 0, 0.8588235, 1,
1.062055, 0.05599327, 0.9027556, 1, 0, 0.8509804, 1,
1.062851, 0.134082, 2.103984, 1, 0, 0.8470588, 1,
1.067559, 1.665892, 2.719762, 1, 0, 0.8392157, 1,
1.073816, 0.7737272, 1.360214, 1, 0, 0.8352941, 1,
1.08586, 0.5122505, 2.318407, 1, 0, 0.827451, 1,
1.089423, 0.008189205, 1.947859, 1, 0, 0.8235294, 1,
1.092217, -0.402728, 3.272156, 1, 0, 0.8156863, 1,
1.095786, 0.2527756, 1.16741, 1, 0, 0.8117647, 1,
1.096121, -0.4035854, 0.9948164, 1, 0, 0.8039216, 1,
1.108671, 1.726295, -0.2979265, 1, 0, 0.7960784, 1,
1.109695, 0.4102036, 0.5944169, 1, 0, 0.7921569, 1,
1.115703, 0.7435479, 1.122308, 1, 0, 0.7843137, 1,
1.119409, -2.558462, 4.640375, 1, 0, 0.7803922, 1,
1.123173, 0.2178302, 1.190523, 1, 0, 0.772549, 1,
1.134724, 0.5391652, 1.918149, 1, 0, 0.7686275, 1,
1.139727, 0.7012447, 1.086774, 1, 0, 0.7607843, 1,
1.148219, -0.2954568, 2.188437, 1, 0, 0.7568628, 1,
1.152299, -0.2615659, 1.944841, 1, 0, 0.7490196, 1,
1.155214, 0.8070226, -0.8845286, 1, 0, 0.7450981, 1,
1.155271, 0.5258953, 0.7542105, 1, 0, 0.7372549, 1,
1.16278, -1.428726, 1.653095, 1, 0, 0.7333333, 1,
1.166748, 0.6688284, 1.562848, 1, 0, 0.7254902, 1,
1.172666, 0.6575721, 1.57, 1, 0, 0.7215686, 1,
1.174184, 0.84771, 0.4501353, 1, 0, 0.7137255, 1,
1.184632, 0.8607552, 0.767442, 1, 0, 0.7098039, 1,
1.191889, 2.34872, 0.4451784, 1, 0, 0.7019608, 1,
1.198654, 0.3271708, 1.374452, 1, 0, 0.6941177, 1,
1.224076, -0.2507265, 2.361363, 1, 0, 0.6901961, 1,
1.226599, 0.05566528, 1.057695, 1, 0, 0.682353, 1,
1.22883, -1.210958, 4.524333, 1, 0, 0.6784314, 1,
1.229046, -0.9369678, 1.953491, 1, 0, 0.6705883, 1,
1.23363, -0.1327353, 0.6855859, 1, 0, 0.6666667, 1,
1.238595, 1.72538, 2.484691, 1, 0, 0.6588235, 1,
1.25055, 2.275335, 2.21719, 1, 0, 0.654902, 1,
1.25976, -1.034439, 2.842396, 1, 0, 0.6470588, 1,
1.26508, 0.7880758, 1.246422, 1, 0, 0.6431373, 1,
1.266108, -0.1259844, 3.419912, 1, 0, 0.6352941, 1,
1.267061, 0.7875293, 0.6641815, 1, 0, 0.6313726, 1,
1.269306, 0.3318619, 2.238623, 1, 0, 0.6235294, 1,
1.281929, -0.318681, 2.554682, 1, 0, 0.6196079, 1,
1.283434, 1.073711, 0.803928, 1, 0, 0.6117647, 1,
1.283437, 0.03520432, 2.403893, 1, 0, 0.6078432, 1,
1.283486, 0.1715745, 2.350624, 1, 0, 0.6, 1,
1.283908, -0.4334708, 2.808408, 1, 0, 0.5921569, 1,
1.286301, 0.6985564, -0.4350545, 1, 0, 0.5882353, 1,
1.288467, -1.314237, 1.391614, 1, 0, 0.5803922, 1,
1.288508, 2.87189, 1.867292, 1, 0, 0.5764706, 1,
1.293126, -0.2769623, 1.123838, 1, 0, 0.5686275, 1,
1.308155, -1.80051, 1.60606, 1, 0, 0.5647059, 1,
1.312086, 0.9505709, -0.5682947, 1, 0, 0.5568628, 1,
1.314175, 0.1939283, 1.323358, 1, 0, 0.5529412, 1,
1.315572, -1.551178, 2.598144, 1, 0, 0.5450981, 1,
1.316489, -0.5721385, 1.346471, 1, 0, 0.5411765, 1,
1.330257, -1.613963, 2.873083, 1, 0, 0.5333334, 1,
1.330706, -0.9036719, 1.042847, 1, 0, 0.5294118, 1,
1.334258, -0.796703, 1.6536, 1, 0, 0.5215687, 1,
1.335789, -1.735476, 2.138752, 1, 0, 0.5176471, 1,
1.34163, 0.3120303, 2.286869, 1, 0, 0.509804, 1,
1.344084, -1.63962, 1.975984, 1, 0, 0.5058824, 1,
1.344241, 1.132129, 0.2740372, 1, 0, 0.4980392, 1,
1.350269, 0.7438377, 0.5816916, 1, 0, 0.4901961, 1,
1.357308, 0.6676686, 1.915187, 1, 0, 0.4862745, 1,
1.357981, 1.347283, 2.061575, 1, 0, 0.4784314, 1,
1.366176, 0.5083131, 0.3309696, 1, 0, 0.4745098, 1,
1.366719, 0.4075488, 0.2667419, 1, 0, 0.4666667, 1,
1.368034, 0.08109935, 1.235614, 1, 0, 0.4627451, 1,
1.397796, 0.01478785, 1.661378, 1, 0, 0.454902, 1,
1.41502, -1.623116, 4.380098, 1, 0, 0.4509804, 1,
1.417377, 0.4612894, 0.1223598, 1, 0, 0.4431373, 1,
1.42039, -1.050824, 3.268927, 1, 0, 0.4392157, 1,
1.427518, -0.3805942, 0.4668435, 1, 0, 0.4313726, 1,
1.427785, 0.7275888, 1.330194, 1, 0, 0.427451, 1,
1.437536, -2.373455, 2.514383, 1, 0, 0.4196078, 1,
1.437555, -0.5818825, 2.188314, 1, 0, 0.4156863, 1,
1.44496, -1.734452, 2.374806, 1, 0, 0.4078431, 1,
1.457374, 1.418558, -2.871464, 1, 0, 0.4039216, 1,
1.469158, 1.466114, 0.9922922, 1, 0, 0.3960784, 1,
1.475261, 0.06752874, 2.668118, 1, 0, 0.3882353, 1,
1.481809, -1.007848, 1.348872, 1, 0, 0.3843137, 1,
1.513821, -0.1190687, -0.7884637, 1, 0, 0.3764706, 1,
1.515778, -0.1343341, 3.724281, 1, 0, 0.372549, 1,
1.523324, 0.9962809, 0.8758744, 1, 0, 0.3647059, 1,
1.52617, 1.453115, 2.263158, 1, 0, 0.3607843, 1,
1.560561, -0.2170083, 0.7281502, 1, 0, 0.3529412, 1,
1.575697, 0.4670739, 2.369719, 1, 0, 0.3490196, 1,
1.587832, 0.9748901, 1.432633, 1, 0, 0.3411765, 1,
1.58917, -0.08897763, 2.808541, 1, 0, 0.3372549, 1,
1.592996, 1.198512, 0.2668159, 1, 0, 0.3294118, 1,
1.602148, 0.7810363, 1.348131, 1, 0, 0.3254902, 1,
1.614588, 1.73313, -0.5463613, 1, 0, 0.3176471, 1,
1.62492, 1.632772, -1.098425, 1, 0, 0.3137255, 1,
1.630448, 0.2240897, 3.07474, 1, 0, 0.3058824, 1,
1.666505, 1.454542, -0.8951311, 1, 0, 0.2980392, 1,
1.673114, 0.8366193, 0.5777412, 1, 0, 0.2941177, 1,
1.674636, 0.880654, 2.666032, 1, 0, 0.2862745, 1,
1.678418, -0.2821754, 2.909868, 1, 0, 0.282353, 1,
1.690442, -0.1790304, 1.8306, 1, 0, 0.2745098, 1,
1.692179, 2.551296, 1.079582, 1, 0, 0.2705882, 1,
1.714065, -0.107744, 0.8928717, 1, 0, 0.2627451, 1,
1.720798, -2.730731, 1.412034, 1, 0, 0.2588235, 1,
1.722137, -2.360357, 2.895118, 1, 0, 0.2509804, 1,
1.722861, -0.6910465, 0.5273613, 1, 0, 0.2470588, 1,
1.730268, 0.3386487, 1.771479, 1, 0, 0.2392157, 1,
1.73254, -0.968086, 4.013511, 1, 0, 0.2352941, 1,
1.751693, -0.06305408, 2.187853, 1, 0, 0.227451, 1,
1.766107, -0.9626535, 2.510425, 1, 0, 0.2235294, 1,
1.787806, -0.8486954, 0.8928985, 1, 0, 0.2156863, 1,
1.795347, 0.1125972, 2.701361, 1, 0, 0.2117647, 1,
1.796868, 0.1180235, 1.783861, 1, 0, 0.2039216, 1,
1.80711, 1.411064, 0.08946485, 1, 0, 0.1960784, 1,
1.808238, -0.2490136, 0.5475127, 1, 0, 0.1921569, 1,
1.828229, 1.669958, 0.005627433, 1, 0, 0.1843137, 1,
1.83307, 0.3684359, 1.409133, 1, 0, 0.1803922, 1,
1.841662, -0.7412983, 1.48204, 1, 0, 0.172549, 1,
1.844642, 0.5293653, 0.7289831, 1, 0, 0.1686275, 1,
1.863405, -0.7354124, 2.368106, 1, 0, 0.1607843, 1,
1.873694, 0.714632, 2.558822, 1, 0, 0.1568628, 1,
1.881615, 1.592994, -0.5143922, 1, 0, 0.1490196, 1,
1.884783, 0.05939979, 0.01801508, 1, 0, 0.145098, 1,
1.933405, 0.583486, 2.246314, 1, 0, 0.1372549, 1,
1.982046, 0.9487151, 2.106293, 1, 0, 0.1333333, 1,
2.009522, -0.05150163, 3.801323, 1, 0, 0.1254902, 1,
2.053508, -0.330889, 1.094479, 1, 0, 0.1215686, 1,
2.064603, -3.22436, 3.519326, 1, 0, 0.1137255, 1,
2.124497, 0.4134671, -0.1499817, 1, 0, 0.1098039, 1,
2.132656, 1.391728, 0.3941474, 1, 0, 0.1019608, 1,
2.181592, -0.2675749, 3.39844, 1, 0, 0.09411765, 1,
2.206988, 0.6986734, 1.769358, 1, 0, 0.09019608, 1,
2.208509, -1.564263, 1.592554, 1, 0, 0.08235294, 1,
2.23842, 0.4639367, 1.510605, 1, 0, 0.07843138, 1,
2.250721, 2.080405, 1.045902, 1, 0, 0.07058824, 1,
2.279974, 1.663058, 0.5878784, 1, 0, 0.06666667, 1,
2.292322, 0.4273123, 2.081196, 1, 0, 0.05882353, 1,
2.366726, 0.8993573, 0.7578239, 1, 0, 0.05490196, 1,
2.458034, 0.4854595, 1.935542, 1, 0, 0.04705882, 1,
2.526078, -1.693986, 1.920291, 1, 0, 0.04313726, 1,
2.594383, -0.2249712, 1.08416, 1, 0, 0.03529412, 1,
2.631554, 0.5959961, 1.042639, 1, 0, 0.03137255, 1,
2.674258, 0.007052218, 2.102173, 1, 0, 0.02352941, 1,
2.69821, 0.4156336, 2.136738, 1, 0, 0.01960784, 1,
2.84499, -2.290759, 3.122097, 1, 0, 0.01176471, 1,
3.128518, -0.2245742, 1.230621, 1, 0, 0.007843138, 1
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
-0.1132392, -4.494191, -8.496667, 0, -0.5, 0.5, 0.5,
-0.1132392, -4.494191, -8.496667, 1, -0.5, 0.5, 0.5,
-0.1132392, -4.494191, -8.496667, 1, 1.5, 0.5, 0.5,
-0.1132392, -4.494191, -8.496667, 0, 1.5, 0.5, 0.5
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
-4.453951, -0.1051673, -8.496667, 0, -0.5, 0.5, 0.5,
-4.453951, -0.1051673, -8.496667, 1, -0.5, 0.5, 0.5,
-4.453951, -0.1051673, -8.496667, 1, 1.5, 0.5, 0.5,
-4.453951, -0.1051673, -8.496667, 0, 1.5, 0.5, 0.5
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
-4.453951, -4.494191, 0.1772592, 0, -0.5, 0.5, 0.5,
-4.453951, -4.494191, 0.1772592, 1, -0.5, 0.5, 0.5,
-4.453951, -4.494191, 0.1772592, 1, 1.5, 0.5, 0.5,
-4.453951, -4.494191, 0.1772592, 0, 1.5, 0.5, 0.5
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
-3, -3.481339, -6.494992,
3, -3.481339, -6.494992,
-3, -3.481339, -6.494992,
-3, -3.650148, -6.828604,
-2, -3.481339, -6.494992,
-2, -3.650148, -6.828604,
-1, -3.481339, -6.494992,
-1, -3.650148, -6.828604,
0, -3.481339, -6.494992,
0, -3.650148, -6.828604,
1, -3.481339, -6.494992,
1, -3.650148, -6.828604,
2, -3.481339, -6.494992,
2, -3.650148, -6.828604,
3, -3.481339, -6.494992,
3, -3.650148, -6.828604
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
-3, -3.987765, -7.49583, 0, -0.5, 0.5, 0.5,
-3, -3.987765, -7.49583, 1, -0.5, 0.5, 0.5,
-3, -3.987765, -7.49583, 1, 1.5, 0.5, 0.5,
-3, -3.987765, -7.49583, 0, 1.5, 0.5, 0.5,
-2, -3.987765, -7.49583, 0, -0.5, 0.5, 0.5,
-2, -3.987765, -7.49583, 1, -0.5, 0.5, 0.5,
-2, -3.987765, -7.49583, 1, 1.5, 0.5, 0.5,
-2, -3.987765, -7.49583, 0, 1.5, 0.5, 0.5,
-1, -3.987765, -7.49583, 0, -0.5, 0.5, 0.5,
-1, -3.987765, -7.49583, 1, -0.5, 0.5, 0.5,
-1, -3.987765, -7.49583, 1, 1.5, 0.5, 0.5,
-1, -3.987765, -7.49583, 0, 1.5, 0.5, 0.5,
0, -3.987765, -7.49583, 0, -0.5, 0.5, 0.5,
0, -3.987765, -7.49583, 1, -0.5, 0.5, 0.5,
0, -3.987765, -7.49583, 1, 1.5, 0.5, 0.5,
0, -3.987765, -7.49583, 0, 1.5, 0.5, 0.5,
1, -3.987765, -7.49583, 0, -0.5, 0.5, 0.5,
1, -3.987765, -7.49583, 1, -0.5, 0.5, 0.5,
1, -3.987765, -7.49583, 1, 1.5, 0.5, 0.5,
1, -3.987765, -7.49583, 0, 1.5, 0.5, 0.5,
2, -3.987765, -7.49583, 0, -0.5, 0.5, 0.5,
2, -3.987765, -7.49583, 1, -0.5, 0.5, 0.5,
2, -3.987765, -7.49583, 1, 1.5, 0.5, 0.5,
2, -3.987765, -7.49583, 0, 1.5, 0.5, 0.5,
3, -3.987765, -7.49583, 0, -0.5, 0.5, 0.5,
3, -3.987765, -7.49583, 1, -0.5, 0.5, 0.5,
3, -3.987765, -7.49583, 1, 1.5, 0.5, 0.5,
3, -3.987765, -7.49583, 0, 1.5, 0.5, 0.5
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
-3.452249, -3, -6.494992,
-3.452249, 3, -6.494992,
-3.452249, -3, -6.494992,
-3.619199, -3, -6.828604,
-3.452249, -2, -6.494992,
-3.619199, -2, -6.828604,
-3.452249, -1, -6.494992,
-3.619199, -1, -6.828604,
-3.452249, 0, -6.494992,
-3.619199, 0, -6.828604,
-3.452249, 1, -6.494992,
-3.619199, 1, -6.828604,
-3.452249, 2, -6.494992,
-3.619199, 2, -6.828604,
-3.452249, 3, -6.494992,
-3.619199, 3, -6.828604
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
-3.9531, -3, -7.49583, 0, -0.5, 0.5, 0.5,
-3.9531, -3, -7.49583, 1, -0.5, 0.5, 0.5,
-3.9531, -3, -7.49583, 1, 1.5, 0.5, 0.5,
-3.9531, -3, -7.49583, 0, 1.5, 0.5, 0.5,
-3.9531, -2, -7.49583, 0, -0.5, 0.5, 0.5,
-3.9531, -2, -7.49583, 1, -0.5, 0.5, 0.5,
-3.9531, -2, -7.49583, 1, 1.5, 0.5, 0.5,
-3.9531, -2, -7.49583, 0, 1.5, 0.5, 0.5,
-3.9531, -1, -7.49583, 0, -0.5, 0.5, 0.5,
-3.9531, -1, -7.49583, 1, -0.5, 0.5, 0.5,
-3.9531, -1, -7.49583, 1, 1.5, 0.5, 0.5,
-3.9531, -1, -7.49583, 0, 1.5, 0.5, 0.5,
-3.9531, 0, -7.49583, 0, -0.5, 0.5, 0.5,
-3.9531, 0, -7.49583, 1, -0.5, 0.5, 0.5,
-3.9531, 0, -7.49583, 1, 1.5, 0.5, 0.5,
-3.9531, 0, -7.49583, 0, 1.5, 0.5, 0.5,
-3.9531, 1, -7.49583, 0, -0.5, 0.5, 0.5,
-3.9531, 1, -7.49583, 1, -0.5, 0.5, 0.5,
-3.9531, 1, -7.49583, 1, 1.5, 0.5, 0.5,
-3.9531, 1, -7.49583, 0, 1.5, 0.5, 0.5,
-3.9531, 2, -7.49583, 0, -0.5, 0.5, 0.5,
-3.9531, 2, -7.49583, 1, -0.5, 0.5, 0.5,
-3.9531, 2, -7.49583, 1, 1.5, 0.5, 0.5,
-3.9531, 2, -7.49583, 0, 1.5, 0.5, 0.5,
-3.9531, 3, -7.49583, 0, -0.5, 0.5, 0.5,
-3.9531, 3, -7.49583, 1, -0.5, 0.5, 0.5,
-3.9531, 3, -7.49583, 1, 1.5, 0.5, 0.5,
-3.9531, 3, -7.49583, 0, 1.5, 0.5, 0.5
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
-3.452249, -3.481339, -6,
-3.452249, -3.481339, 6,
-3.452249, -3.481339, -6,
-3.619199, -3.650148, -6,
-3.452249, -3.481339, -4,
-3.619199, -3.650148, -4,
-3.452249, -3.481339, -2,
-3.619199, -3.650148, -2,
-3.452249, -3.481339, 0,
-3.619199, -3.650148, 0,
-3.452249, -3.481339, 2,
-3.619199, -3.650148, 2,
-3.452249, -3.481339, 4,
-3.619199, -3.650148, 4,
-3.452249, -3.481339, 6,
-3.619199, -3.650148, 6
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
-3.9531, -3.987765, -6, 0, -0.5, 0.5, 0.5,
-3.9531, -3.987765, -6, 1, -0.5, 0.5, 0.5,
-3.9531, -3.987765, -6, 1, 1.5, 0.5, 0.5,
-3.9531, -3.987765, -6, 0, 1.5, 0.5, 0.5,
-3.9531, -3.987765, -4, 0, -0.5, 0.5, 0.5,
-3.9531, -3.987765, -4, 1, -0.5, 0.5, 0.5,
-3.9531, -3.987765, -4, 1, 1.5, 0.5, 0.5,
-3.9531, -3.987765, -4, 0, 1.5, 0.5, 0.5,
-3.9531, -3.987765, -2, 0, -0.5, 0.5, 0.5,
-3.9531, -3.987765, -2, 1, -0.5, 0.5, 0.5,
-3.9531, -3.987765, -2, 1, 1.5, 0.5, 0.5,
-3.9531, -3.987765, -2, 0, 1.5, 0.5, 0.5,
-3.9531, -3.987765, 0, 0, -0.5, 0.5, 0.5,
-3.9531, -3.987765, 0, 1, -0.5, 0.5, 0.5,
-3.9531, -3.987765, 0, 1, 1.5, 0.5, 0.5,
-3.9531, -3.987765, 0, 0, 1.5, 0.5, 0.5,
-3.9531, -3.987765, 2, 0, -0.5, 0.5, 0.5,
-3.9531, -3.987765, 2, 1, -0.5, 0.5, 0.5,
-3.9531, -3.987765, 2, 1, 1.5, 0.5, 0.5,
-3.9531, -3.987765, 2, 0, 1.5, 0.5, 0.5,
-3.9531, -3.987765, 4, 0, -0.5, 0.5, 0.5,
-3.9531, -3.987765, 4, 1, -0.5, 0.5, 0.5,
-3.9531, -3.987765, 4, 1, 1.5, 0.5, 0.5,
-3.9531, -3.987765, 4, 0, 1.5, 0.5, 0.5,
-3.9531, -3.987765, 6, 0, -0.5, 0.5, 0.5,
-3.9531, -3.987765, 6, 1, -0.5, 0.5, 0.5,
-3.9531, -3.987765, 6, 1, 1.5, 0.5, 0.5,
-3.9531, -3.987765, 6, 0, 1.5, 0.5, 0.5
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
-3.452249, -3.481339, -6.494992,
-3.452249, 3.271005, -6.494992,
-3.452249, -3.481339, 6.84951,
-3.452249, 3.271005, 6.84951,
-3.452249, -3.481339, -6.494992,
-3.452249, -3.481339, 6.84951,
-3.452249, 3.271005, -6.494992,
-3.452249, 3.271005, 6.84951,
-3.452249, -3.481339, -6.494992,
3.22577, -3.481339, -6.494992,
-3.452249, -3.481339, 6.84951,
3.22577, -3.481339, 6.84951,
-3.452249, 3.271005, -6.494992,
3.22577, 3.271005, -6.494992,
-3.452249, 3.271005, 6.84951,
3.22577, 3.271005, 6.84951,
3.22577, -3.481339, -6.494992,
3.22577, 3.271005, -6.494992,
3.22577, -3.481339, 6.84951,
3.22577, 3.271005, 6.84951,
3.22577, -3.481339, -6.494992,
3.22577, -3.481339, 6.84951,
3.22577, 3.271005, -6.494992,
3.22577, 3.271005, 6.84951
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
var radius = 8.745973;
var distance = 38.91182;
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
mvMatrix.translate( 0.1132392, 0.1051673, -0.1772592 );
mvMatrix.scale( 1.416036, 1.40045, 0.7086303 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.91182);
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
Cypermethrin<-read.table("Cypermethrin.xyz")
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
-3.354996, -2.159962, -0.1574093, 0, 0, 1, 1, 1,
-3.259516, 0.5047224, 0.6308382, 1, 0, 0, 1, 1,
-3.129829, 0.7096416, -2.533334, 1, 0, 0, 1, 1,
-2.913959, 1.211033, -3.205158, 1, 0, 0, 1, 1,
-2.632304, 0.7290589, -1.757407, 1, 0, 0, 1, 1,
-2.592226, 1.300133, -0.3242901, 1, 0, 0, 1, 1,
-2.537353, -0.453016, -2.930422, 0, 0, 0, 1, 1,
-2.459282, 1.45213, -1.471774, 0, 0, 0, 1, 1,
-2.416606, -1.077631, -1.850454, 0, 0, 0, 1, 1,
-2.362583, -0.8550545, -2.537549, 0, 0, 0, 1, 1,
-2.277153, 0.9465111, -0.847992, 0, 0, 0, 1, 1,
-2.262273, -0.6486751, -1.238239, 0, 0, 0, 1, 1,
-2.241535, 1.24896, -1.662266, 0, 0, 0, 1, 1,
-2.22144, 0.1961082, -0.6508459, 1, 1, 1, 1, 1,
-2.21869, -1.643938, -3.232246, 1, 1, 1, 1, 1,
-2.188917, 0.08038785, -0.7215567, 1, 1, 1, 1, 1,
-2.13496, -0.2403155, -2.680646, 1, 1, 1, 1, 1,
-2.110152, 1.988394, -1.654078, 1, 1, 1, 1, 1,
-2.041955, 0.953352, -1.386614, 1, 1, 1, 1, 1,
-2.007791, 0.1890743, -1.786522, 1, 1, 1, 1, 1,
-1.997529, 0.7888252, 0.1467072, 1, 1, 1, 1, 1,
-1.996875, 0.6494715, 1.066401, 1, 1, 1, 1, 1,
-1.943858, 1.221318, -1.374265, 1, 1, 1, 1, 1,
-1.912597, -0.4562822, -2.93983, 1, 1, 1, 1, 1,
-1.904488, -0.5967941, -0.4614501, 1, 1, 1, 1, 1,
-1.89974, -0.1863477, -2.193098, 1, 1, 1, 1, 1,
-1.870561, 0.4642093, -0.9047686, 1, 1, 1, 1, 1,
-1.810281, -0.3351251, -2.196914, 1, 1, 1, 1, 1,
-1.800219, -0.9479944, -3.480596, 0, 0, 1, 1, 1,
-1.780882, -0.2023531, -0.4938791, 1, 0, 0, 1, 1,
-1.776004, 1.059987, -0.8311262, 1, 0, 0, 1, 1,
-1.760155, 0.5798563, -0.9496619, 1, 0, 0, 1, 1,
-1.757212, 0.2126798, -4.044874, 1, 0, 0, 1, 1,
-1.744934, 0.01625585, -2.029923, 1, 0, 0, 1, 1,
-1.715181, -1.64108, -1.240506, 0, 0, 0, 1, 1,
-1.710704, -0.5284665, -2.492384, 0, 0, 0, 1, 1,
-1.708095, 1.559952, -1.506848, 0, 0, 0, 1, 1,
-1.703414, 0.1354811, -3.149105, 0, 0, 0, 1, 1,
-1.689194, 0.7366427, -1.237562, 0, 0, 0, 1, 1,
-1.674117, 2.139252, -0.266001, 0, 0, 0, 1, 1,
-1.673711, -1.615349, -1.889881, 0, 0, 0, 1, 1,
-1.670413, 0.4588278, -1.668966, 1, 1, 1, 1, 1,
-1.669274, 2.246829, -1.761228, 1, 1, 1, 1, 1,
-1.632019, 0.514989, -1.018046, 1, 1, 1, 1, 1,
-1.630718, 1.086216, -0.73729, 1, 1, 1, 1, 1,
-1.625753, -0.0645379, -1.714224, 1, 1, 1, 1, 1,
-1.618826, 0.6276253, -1.910704, 1, 1, 1, 1, 1,
-1.618564, -1.102561, -1.770074, 1, 1, 1, 1, 1,
-1.606107, 1.722797, -0.2994051, 1, 1, 1, 1, 1,
-1.595992, -1.238703, -1.861865, 1, 1, 1, 1, 1,
-1.587121, -0.601591, -2.410879, 1, 1, 1, 1, 1,
-1.580931, 0.1829854, -0.7071134, 1, 1, 1, 1, 1,
-1.571014, 1.589144, -0.2800293, 1, 1, 1, 1, 1,
-1.570709, 0.326961, -2.204638, 1, 1, 1, 1, 1,
-1.566301, -1.930466, -3.147874, 1, 1, 1, 1, 1,
-1.55568, 0.7680058, -0.03481247, 1, 1, 1, 1, 1,
-1.542205, 1.208359, -1.931616, 0, 0, 1, 1, 1,
-1.541599, 0.1529399, -1.409789, 1, 0, 0, 1, 1,
-1.539884, -0.3831047, -2.958848, 1, 0, 0, 1, 1,
-1.505919, 0.2286836, -2.856543, 1, 0, 0, 1, 1,
-1.500824, 0.6335193, -0.8737781, 1, 0, 0, 1, 1,
-1.475564, 0.2283289, -2.881913, 1, 0, 0, 1, 1,
-1.469439, -0.4506046, -1.294883, 0, 0, 0, 1, 1,
-1.466241, 0.03466351, -2.035971, 0, 0, 0, 1, 1,
-1.457904, -0.7438653, -0.1862371, 0, 0, 0, 1, 1,
-1.443917, -0.3430744, -0.2380224, 0, 0, 0, 1, 1,
-1.43223, -0.720204, -1.161986, 0, 0, 0, 1, 1,
-1.413413, -0.323235, -2.272819, 0, 0, 0, 1, 1,
-1.409795, -0.5605368, -1.975181, 0, 0, 0, 1, 1,
-1.405499, 0.06769821, -0.7198467, 1, 1, 1, 1, 1,
-1.4041, 2.05728, 0.5888644, 1, 1, 1, 1, 1,
-1.402784, 0.4290122, -2.326832, 1, 1, 1, 1, 1,
-1.389485, -0.4331779, -1.22117, 1, 1, 1, 1, 1,
-1.377761, -0.4531551, -1.471656, 1, 1, 1, 1, 1,
-1.367648, -1.633325, -1.271347, 1, 1, 1, 1, 1,
-1.363377, 0.6187248, -2.111837, 1, 1, 1, 1, 1,
-1.357791, -0.2361063, -0.9115114, 1, 1, 1, 1, 1,
-1.350665, -1.259495, -1.482293, 1, 1, 1, 1, 1,
-1.347021, 0.7147893, -2.758385, 1, 1, 1, 1, 1,
-1.343506, -0.8756232, -0.9853919, 1, 1, 1, 1, 1,
-1.337279, -0.1149112, -1.812258, 1, 1, 1, 1, 1,
-1.332505, 1.149583, -1.095704, 1, 1, 1, 1, 1,
-1.325041, -0.5906487, -0.6198187, 1, 1, 1, 1, 1,
-1.321195, -0.1472074, -1.702241, 1, 1, 1, 1, 1,
-1.319477, 0.1301804, -3.058472, 0, 0, 1, 1, 1,
-1.309736, -0.2639145, -1.398935, 1, 0, 0, 1, 1,
-1.30428, -0.9966902, -2.997932, 1, 0, 0, 1, 1,
-1.298088, -1.755627, -2.025852, 1, 0, 0, 1, 1,
-1.292504, 0.5055563, -3.132977, 1, 0, 0, 1, 1,
-1.277242, -0.720899, -0.9246625, 1, 0, 0, 1, 1,
-1.274805, 1.108944, -1.170145, 0, 0, 0, 1, 1,
-1.267963, 0.555661, 0.002658293, 0, 0, 0, 1, 1,
-1.266884, 0.0974683, 0.1321101, 0, 0, 0, 1, 1,
-1.26617, 0.05254458, -1.146238, 0, 0, 0, 1, 1,
-1.257672, 0.590593, -0.9532674, 0, 0, 0, 1, 1,
-1.254407, -0.2941442, -3.04724, 0, 0, 0, 1, 1,
-1.244108, 2.249446, 0.1120028, 0, 0, 0, 1, 1,
-1.220525, -0.6986789, -2.768271, 1, 1, 1, 1, 1,
-1.215071, -0.2247236, -2.255702, 1, 1, 1, 1, 1,
-1.207892, 0.5738497, -1.896753, 1, 1, 1, 1, 1,
-1.207049, 0.2384596, 0.1564583, 1, 1, 1, 1, 1,
-1.206262, 0.03183396, -1.75788, 1, 1, 1, 1, 1,
-1.202224, -1.399677, -3.337367, 1, 1, 1, 1, 1,
-1.199751, -0.03735318, -1.851683, 1, 1, 1, 1, 1,
-1.196572, 0.4329316, -0.8145469, 1, 1, 1, 1, 1,
-1.190646, 0.3829439, -2.042317, 1, 1, 1, 1, 1,
-1.187662, -1.555324, -4.798299, 1, 1, 1, 1, 1,
-1.186865, 0.1935924, -0.7986081, 1, 1, 1, 1, 1,
-1.175384, -0.3057262, -1.715955, 1, 1, 1, 1, 1,
-1.163141, -0.6326702, -2.796337, 1, 1, 1, 1, 1,
-1.149572, -0.06165669, -0.9526568, 1, 1, 1, 1, 1,
-1.148526, -1.691565, -1.687106, 1, 1, 1, 1, 1,
-1.138198, -0.3557415, -2.026373, 0, 0, 1, 1, 1,
-1.134538, -1.536435, -3.98347, 1, 0, 0, 1, 1,
-1.132763, -0.532836, -3.538338, 1, 0, 0, 1, 1,
-1.126195, -0.5172669, -1.452439, 1, 0, 0, 1, 1,
-1.118825, -0.9634227, -3.056036, 1, 0, 0, 1, 1,
-1.11645, -0.697009, -2.307657, 1, 0, 0, 1, 1,
-1.115147, -1.027903, -3.635081, 0, 0, 0, 1, 1,
-1.112713, 0.8683476, -2.197237, 0, 0, 0, 1, 1,
-1.109267, 1.181384, 0.5288534, 0, 0, 0, 1, 1,
-1.106864, -1.176013, -2.910682, 0, 0, 0, 1, 1,
-1.100866, 1.280219, 0.8730832, 0, 0, 0, 1, 1,
-1.09513, 0.1107123, -1.351295, 0, 0, 0, 1, 1,
-1.089116, 0.5549667, -0.3304732, 0, 0, 0, 1, 1,
-1.088293, -0.1167943, -1.233793, 1, 1, 1, 1, 1,
-1.087971, -1.213516, -6.300654, 1, 1, 1, 1, 1,
-1.080334, 0.7498412, -1.685379, 1, 1, 1, 1, 1,
-1.076367, 0.0684308, -2.023998, 1, 1, 1, 1, 1,
-1.074967, -0.08733899, -1.994941, 1, 1, 1, 1, 1,
-1.071216, 0.5437109, -3.725829, 1, 1, 1, 1, 1,
-1.0554, 1.539635, 0.6265665, 1, 1, 1, 1, 1,
-1.054415, -0.2853616, -1.69952, 1, 1, 1, 1, 1,
-1.050701, 0.9029885, 0.2171477, 1, 1, 1, 1, 1,
-1.048174, -0.8918249, -1.718248, 1, 1, 1, 1, 1,
-1.046298, 0.6440759, -0.8363087, 1, 1, 1, 1, 1,
-1.043623, 1.583717, -0.5496302, 1, 1, 1, 1, 1,
-1.043044, -0.1917734, -0.01497029, 1, 1, 1, 1, 1,
-1.037585, 2.216663, 0.6036209, 1, 1, 1, 1, 1,
-1.028402, -2.984172, -2.015962, 1, 1, 1, 1, 1,
-1.024904, -0.1798388, -0.5148908, 0, 0, 1, 1, 1,
-1.020623, -0.2407689, -2.725749, 1, 0, 0, 1, 1,
-1.020344, 0.9713846, -1.851705, 1, 0, 0, 1, 1,
-1.013628, -1.272728, -0.6299626, 1, 0, 0, 1, 1,
-1.01362, -0.7326987, -3.211262, 1, 0, 0, 1, 1,
-1.008127, -0.5087803, -2.188749, 1, 0, 0, 1, 1,
-1.0061, -0.5560292, -2.07031, 0, 0, 0, 1, 1,
-1.001576, 1.647799, -2.661219, 0, 0, 0, 1, 1,
-0.9984301, -0.8748682, -2.26998, 0, 0, 0, 1, 1,
-0.9856651, 0.627272, -0.9140183, 0, 0, 0, 1, 1,
-0.9848308, 1.766757, -2.255475, 0, 0, 0, 1, 1,
-0.9844021, -2.338514, -3.399535, 0, 0, 0, 1, 1,
-0.9832551, 0.4852446, 1.074294, 0, 0, 0, 1, 1,
-0.9799021, -1.127205, -2.854039, 1, 1, 1, 1, 1,
-0.9777614, -0.6750832, -2.660058, 1, 1, 1, 1, 1,
-0.9703176, 0.3149415, -1.843661, 1, 1, 1, 1, 1,
-0.9570123, 0.009807142, -1.754081, 1, 1, 1, 1, 1,
-0.9475574, 1.14936, -0.6573042, 1, 1, 1, 1, 1,
-0.9396625, 0.8243991, 1.758154, 1, 1, 1, 1, 1,
-0.9361511, 2.038106, -0.8347185, 1, 1, 1, 1, 1,
-0.9338803, 2.838644, -0.3944707, 1, 1, 1, 1, 1,
-0.9297783, -0.2934434, -3.519907, 1, 1, 1, 1, 1,
-0.9297476, -0.5282306, -1.465165, 1, 1, 1, 1, 1,
-0.924832, -0.5841652, -1.06243, 1, 1, 1, 1, 1,
-0.9197132, 0.3623464, -3.194508, 1, 1, 1, 1, 1,
-0.9120725, -0.9680859, -2.69315, 1, 1, 1, 1, 1,
-0.9110553, 0.8276295, -0.8647938, 1, 1, 1, 1, 1,
-0.9088136, 0.5125859, 0.6438468, 1, 1, 1, 1, 1,
-0.9074802, -1.424201, -1.68621, 0, 0, 1, 1, 1,
-0.9059133, 0.8206424, -0.6021234, 1, 0, 0, 1, 1,
-0.9051583, 1.155408, -0.2877299, 1, 0, 0, 1, 1,
-0.9034276, 1.570812, -2.463402, 1, 0, 0, 1, 1,
-0.9000543, -0.3530638, -0.9368954, 1, 0, 0, 1, 1,
-0.8941511, -0.44836, -3.75217, 1, 0, 0, 1, 1,
-0.8881843, 1.650768, -1.716447, 0, 0, 0, 1, 1,
-0.8794053, 1.06589, -2.295473, 0, 0, 0, 1, 1,
-0.87762, -0.06915279, -1.459386, 0, 0, 0, 1, 1,
-0.8734576, 0.3489089, -0.8572957, 0, 0, 0, 1, 1,
-0.8689398, 0.8434737, -1.103673, 0, 0, 0, 1, 1,
-0.8688768, -0.702524, -3.095928, 0, 0, 0, 1, 1,
-0.8629446, -0.6170738, -3.326216, 0, 0, 0, 1, 1,
-0.8591457, -0.03352574, -1.45691, 1, 1, 1, 1, 1,
-0.8579245, -1.756576, -3.319629, 1, 1, 1, 1, 1,
-0.8534012, 1.139255, -1.778353, 1, 1, 1, 1, 1,
-0.8513647, 0.2962593, -0.5654171, 1, 1, 1, 1, 1,
-0.8492612, 1.235781, -1.338744, 1, 1, 1, 1, 1,
-0.848996, 0.8555542, -0.6561713, 1, 1, 1, 1, 1,
-0.8420568, -1.54841, -3.291473, 1, 1, 1, 1, 1,
-0.8411157, 0.907337, -2.312197, 1, 1, 1, 1, 1,
-0.8406653, -1.585484, -3.348139, 1, 1, 1, 1, 1,
-0.8337668, -0.1696959, -1.029145, 1, 1, 1, 1, 1,
-0.8321085, -0.04456466, -0.1931083, 1, 1, 1, 1, 1,
-0.8310343, 0.4879247, -2.357158, 1, 1, 1, 1, 1,
-0.829836, -1.660847, -0.8496337, 1, 1, 1, 1, 1,
-0.8266652, 0.8828255, -0.808512, 1, 1, 1, 1, 1,
-0.8189948, 1.969229, -2.007029, 1, 1, 1, 1, 1,
-0.8139069, 0.1898553, -1.381332, 0, 0, 1, 1, 1,
-0.811774, 0.4924416, 1.86658, 1, 0, 0, 1, 1,
-0.8116627, -0.7468599, -2.568219, 1, 0, 0, 1, 1,
-0.8083838, 1.551988, -0.5582111, 1, 0, 0, 1, 1,
-0.8061719, -0.2365739, -2.983551, 1, 0, 0, 1, 1,
-0.8003587, 2.022976, -1.193703, 1, 0, 0, 1, 1,
-0.7861847, 0.4365069, -0.7485252, 0, 0, 0, 1, 1,
-0.7852498, -0.3811671, -1.033814, 0, 0, 0, 1, 1,
-0.7770895, -0.5251998, -4.120977, 0, 0, 0, 1, 1,
-0.774717, -0.6567653, -4.150823, 0, 0, 0, 1, 1,
-0.7740989, 0.08504076, -2.804366, 0, 0, 0, 1, 1,
-0.769233, 0.5548447, -1.295613, 0, 0, 0, 1, 1,
-0.7672167, -1.382989, -2.858447, 0, 0, 0, 1, 1,
-0.7641242, 1.236288, 0.01504037, 1, 1, 1, 1, 1,
-0.7604765, 1.774414, 0.6768888, 1, 1, 1, 1, 1,
-0.7604038, 1.316303, -0.660525, 1, 1, 1, 1, 1,
-0.7567951, 0.4452021, -2.074806, 1, 1, 1, 1, 1,
-0.7537757, -0.1366794, -0.7115895, 1, 1, 1, 1, 1,
-0.7523153, 0.3984987, -3.015012, 1, 1, 1, 1, 1,
-0.7505333, -0.1826095, -2.294833, 1, 1, 1, 1, 1,
-0.7480961, 0.7119979, 0.3497047, 1, 1, 1, 1, 1,
-0.7455677, 0.7223132, -3.05537, 1, 1, 1, 1, 1,
-0.7412964, -1.57628, -1.751117, 1, 1, 1, 1, 1,
-0.7328543, -0.2664863, -1.820401, 1, 1, 1, 1, 1,
-0.7328038, 1.192514, 0.03517071, 1, 1, 1, 1, 1,
-0.7318646, -0.1444317, -1.188969, 1, 1, 1, 1, 1,
-0.7301007, 0.154893, -1.672387, 1, 1, 1, 1, 1,
-0.7271824, 0.9566637, -0.2673309, 1, 1, 1, 1, 1,
-0.7269336, -0.3967547, -2.175462, 0, 0, 1, 1, 1,
-0.7264837, 0.143027, -1.464354, 1, 0, 0, 1, 1,
-0.7221711, -1.238729, -3.01984, 1, 0, 0, 1, 1,
-0.7044975, -0.5152958, -3.394786, 1, 0, 0, 1, 1,
-0.7010911, -1.101411, -2.695048, 1, 0, 0, 1, 1,
-0.7004552, -0.2598858, -2.95816, 1, 0, 0, 1, 1,
-0.6955415, 0.8210858, -0.2684205, 0, 0, 0, 1, 1,
-0.6939176, -1.355573, -1.999691, 0, 0, 0, 1, 1,
-0.692673, -0.2356519, -2.250006, 0, 0, 0, 1, 1,
-0.6904948, 0.9880725, -0.9210752, 0, 0, 0, 1, 1,
-0.6847591, -2.887744, -3.142789, 0, 0, 0, 1, 1,
-0.6839485, -1.232047, -3.359334, 0, 0, 0, 1, 1,
-0.6821824, 0.2307604, -2.945313, 0, 0, 0, 1, 1,
-0.6804874, -0.4755328, -0.3091466, 1, 1, 1, 1, 1,
-0.6765693, -0.5585933, -3.037073, 1, 1, 1, 1, 1,
-0.6686553, 0.0937553, -2.393009, 1, 1, 1, 1, 1,
-0.6676185, -0.2969311, -3.02004, 1, 1, 1, 1, 1,
-0.6666972, -0.8563885, -3.104477, 1, 1, 1, 1, 1,
-0.6654525, 0.9785174, -0.4595593, 1, 1, 1, 1, 1,
-0.6623558, 1.832788, -0.1124517, 1, 1, 1, 1, 1,
-0.6580153, 0.557398, -1.768708, 1, 1, 1, 1, 1,
-0.6499615, 2.273434, 0.03818488, 1, 1, 1, 1, 1,
-0.6476663, 0.9821531, -0.5843649, 1, 1, 1, 1, 1,
-0.6446916, 0.6007226, -0.4813512, 1, 1, 1, 1, 1,
-0.6419892, 0.315127, -1.24337, 1, 1, 1, 1, 1,
-0.6404822, 1.36186, -1.646882, 1, 1, 1, 1, 1,
-0.6326037, 1.649308, 0.5810132, 1, 1, 1, 1, 1,
-0.6322104, -0.3552497, -2.966542, 1, 1, 1, 1, 1,
-0.6300473, -1.106952, -3.350878, 0, 0, 1, 1, 1,
-0.6295414, -0.04930764, -1.745892, 1, 0, 0, 1, 1,
-0.6223177, 0.08067181, -2.368885, 1, 0, 0, 1, 1,
-0.6219121, -1.265211, -2.507466, 1, 0, 0, 1, 1,
-0.605967, 0.8242577, -0.2578847, 1, 0, 0, 1, 1,
-0.6053658, -0.2837295, -2.457845, 1, 0, 0, 1, 1,
-0.6043686, -0.3047854, -0.9338009, 0, 0, 0, 1, 1,
-0.602254, 0.6445777, 0.2925157, 0, 0, 0, 1, 1,
-0.6018116, 0.3227457, -2.390643, 0, 0, 0, 1, 1,
-0.6014934, -0.205226, -2.636767, 0, 0, 0, 1, 1,
-0.5970978, 0.7169124, -0.286353, 0, 0, 0, 1, 1,
-0.59568, -1.253275, -3.738602, 0, 0, 0, 1, 1,
-0.5937926, 0.1608645, -1.020164, 0, 0, 0, 1, 1,
-0.5920912, -0.2573254, -1.643491, 1, 1, 1, 1, 1,
-0.5896921, 1.092783, 0.3802408, 1, 1, 1, 1, 1,
-0.5891632, 0.4058283, 0.5652958, 1, 1, 1, 1, 1,
-0.5861155, -0.0001140164, -3.228767, 1, 1, 1, 1, 1,
-0.5855906, -0.5291566, -2.57108, 1, 1, 1, 1, 1,
-0.5826274, -0.9144912, -0.3757156, 1, 1, 1, 1, 1,
-0.5778255, -1.397579, -2.370512, 1, 1, 1, 1, 1,
-0.5769619, 0.7540239, 1.23144, 1, 1, 1, 1, 1,
-0.5735426, -0.3529267, -1.373065, 1, 1, 1, 1, 1,
-0.571371, 0.3840109, -1.582592, 1, 1, 1, 1, 1,
-0.5686426, 0.003523411, -2.17761, 1, 1, 1, 1, 1,
-0.568635, -0.3855583, -2.26507, 1, 1, 1, 1, 1,
-0.5685437, 2.543375, 1.410733, 1, 1, 1, 1, 1,
-0.5667596, 1.082811, -1.38643, 1, 1, 1, 1, 1,
-0.565638, 0.8228167, -0.7058887, 1, 1, 1, 1, 1,
-0.5634931, 0.4113473, -2.5012, 0, 0, 1, 1, 1,
-0.5619085, 0.3132214, -1.559439, 1, 0, 0, 1, 1,
-0.5617946, 0.3859112, -0.8344233, 1, 0, 0, 1, 1,
-0.5573319, 2.147532, -0.9937454, 1, 0, 0, 1, 1,
-0.5533565, -1.538119, -5.872783, 1, 0, 0, 1, 1,
-0.5481502, -0.2146033, -1.645, 1, 0, 0, 1, 1,
-0.5424452, 1.100848, -1.048352, 0, 0, 0, 1, 1,
-0.5398368, 0.5495026, -0.8171556, 0, 0, 0, 1, 1,
-0.5395042, -0.05982783, -0.9323487, 0, 0, 0, 1, 1,
-0.539492, 0.655333, 0.03287098, 0, 0, 0, 1, 1,
-0.5393679, 1.832789, -2.272647, 0, 0, 0, 1, 1,
-0.5360451, 0.4185162, -2.715555, 0, 0, 0, 1, 1,
-0.5325541, -1.59882, -3.753113, 0, 0, 0, 1, 1,
-0.5304744, -0.4766143, -2.446505, 1, 1, 1, 1, 1,
-0.5295421, 0.2717328, -1.955916, 1, 1, 1, 1, 1,
-0.5287823, 0.6408395, -1.617019, 1, 1, 1, 1, 1,
-0.5285821, -0.186583, 0.3062648, 1, 1, 1, 1, 1,
-0.5250012, -0.31944, -2.420827, 1, 1, 1, 1, 1,
-0.5240923, 0.4732729, -0.8059288, 1, 1, 1, 1, 1,
-0.521792, -0.5101619, -4.01155, 1, 1, 1, 1, 1,
-0.5168555, 1.711985, -1.198671, 1, 1, 1, 1, 1,
-0.5146123, 1.147523, -0.3398262, 1, 1, 1, 1, 1,
-0.5077737, 1.38318, 0.1218744, 1, 1, 1, 1, 1,
-0.5066608, 0.5305516, -0.7578037, 1, 1, 1, 1, 1,
-0.5055794, -1.167503, -3.097391, 1, 1, 1, 1, 1,
-0.5023766, -0.1808635, -3.304438, 1, 1, 1, 1, 1,
-0.5011324, -0.3428271, -2.324339, 1, 1, 1, 1, 1,
-0.4980832, -0.6971364, -2.680754, 1, 1, 1, 1, 1,
-0.4978081, -0.5079391, -3.730605, 0, 0, 1, 1, 1,
-0.4976482, 0.6710088, -1.196922, 1, 0, 0, 1, 1,
-0.4929041, -0.5847931, -2.446892, 1, 0, 0, 1, 1,
-0.4855161, 0.9399423, -0.3042355, 1, 0, 0, 1, 1,
-0.4851025, 0.464167, -0.6643782, 1, 0, 0, 1, 1,
-0.4831299, -0.9833837, -1.678177, 1, 0, 0, 1, 1,
-0.4795805, 0.7182092, 0.3999079, 0, 0, 0, 1, 1,
-0.4789248, -0.5438725, -0.676722, 0, 0, 0, 1, 1,
-0.4766722, -0.774276, -2.767869, 0, 0, 0, 1, 1,
-0.4757847, 1.211277, -1.32116, 0, 0, 0, 1, 1,
-0.4740463, -0.03160045, -2.181125, 0, 0, 0, 1, 1,
-0.4739479, 0.7766725, 1.100257, 0, 0, 0, 1, 1,
-0.4691672, 0.9869692, -0.8897453, 0, 0, 0, 1, 1,
-0.4637469, 0.4521716, -0.3221878, 1, 1, 1, 1, 1,
-0.4577341, -0.4929898, -3.539068, 1, 1, 1, 1, 1,
-0.4571081, -0.4984273, -2.61442, 1, 1, 1, 1, 1,
-0.456898, -1.06434, -1.970838, 1, 1, 1, 1, 1,
-0.4540687, 0.2966145, -0.8809273, 1, 1, 1, 1, 1,
-0.447932, -0.7016768, -2.033991, 1, 1, 1, 1, 1,
-0.4462089, 0.8466889, 1.458811, 1, 1, 1, 1, 1,
-0.4433791, 0.006715515, -2.301254, 1, 1, 1, 1, 1,
-0.4424053, -2.094784, -3.302093, 1, 1, 1, 1, 1,
-0.4423272, -0.739776, -4.390597, 1, 1, 1, 1, 1,
-0.4397351, 2.267197, 0.8576088, 1, 1, 1, 1, 1,
-0.4350092, 1.573931, -2.973964, 1, 1, 1, 1, 1,
-0.4349231, 1.71788, -0.8796974, 1, 1, 1, 1, 1,
-0.4338807, 1.843215, 0.3886502, 1, 1, 1, 1, 1,
-0.4263168, 0.4125134, -1.685007, 1, 1, 1, 1, 1,
-0.4218599, -0.09616115, -3.320724, 0, 0, 1, 1, 1,
-0.4142489, -0.1306573, -2.701461, 1, 0, 0, 1, 1,
-0.4110076, 0.1897363, -1.626479, 1, 0, 0, 1, 1,
-0.4104247, -1.228203, -2.417408, 1, 0, 0, 1, 1,
-0.4103311, 0.6556931, -1.226633, 1, 0, 0, 1, 1,
-0.4069802, -0.4431033, -2.163464, 1, 0, 0, 1, 1,
-0.3988075, 0.6013941, -1.565433, 0, 0, 0, 1, 1,
-0.3985506, -1.013519, -2.527855, 0, 0, 0, 1, 1,
-0.3957112, 0.02665561, -2.018217, 0, 0, 0, 1, 1,
-0.3905119, 0.7260911, 0.06174967, 0, 0, 0, 1, 1,
-0.3871137, 0.2687753, -1.273295, 0, 0, 0, 1, 1,
-0.3844144, 1.076515, 0.5100262, 0, 0, 0, 1, 1,
-0.3772119, 1.063663, -2.370742, 0, 0, 0, 1, 1,
-0.3767036, 0.3932665, -0.6036804, 1, 1, 1, 1, 1,
-0.3762219, 1.172046, 0.1703519, 1, 1, 1, 1, 1,
-0.3736599, 1.620759, 1.265561, 1, 1, 1, 1, 1,
-0.373127, -0.3647559, -2.494416, 1, 1, 1, 1, 1,
-0.3726961, -2.305779, -1.307891, 1, 1, 1, 1, 1,
-0.368708, -0.8256655, -2.9898, 1, 1, 1, 1, 1,
-0.3664439, -1.400033, -3.898578, 1, 1, 1, 1, 1,
-0.3637833, 0.3821995, -0.1683972, 1, 1, 1, 1, 1,
-0.3558716, 0.786063, -0.8162041, 1, 1, 1, 1, 1,
-0.3528319, 0.01207031, -1.443739, 1, 1, 1, 1, 1,
-0.3517852, 0.8222178, 0.188333, 1, 1, 1, 1, 1,
-0.3465975, -1.738923, -3.293382, 1, 1, 1, 1, 1,
-0.3412559, -0.7963565, -2.383229, 1, 1, 1, 1, 1,
-0.3405299, 0.5609818, 1.376859, 1, 1, 1, 1, 1,
-0.3287585, -0.3826424, -3.826877, 1, 1, 1, 1, 1,
-0.326849, -0.7619981, -2.033121, 0, 0, 1, 1, 1,
-0.3266338, 0.4801131, -0.8991088, 1, 0, 0, 1, 1,
-0.3266281, -0.2704374, -1.484415, 1, 0, 0, 1, 1,
-0.3254812, -1.933845, -3.202719, 1, 0, 0, 1, 1,
-0.3165116, 0.9931536, 1.379756, 1, 0, 0, 1, 1,
-0.3147193, -1.755675, -2.229225, 1, 0, 0, 1, 1,
-0.3128276, -0.4658964, -2.580982, 0, 0, 0, 1, 1,
-0.3106307, -1.158407, -2.635597, 0, 0, 0, 1, 1,
-0.3099034, -0.3707118, -3.184419, 0, 0, 0, 1, 1,
-0.3077223, 0.7679844, -0.9251294, 0, 0, 0, 1, 1,
-0.3061967, -1.156588, -2.639308, 0, 0, 0, 1, 1,
-0.3007176, -1.104407, -5.769519, 0, 0, 0, 1, 1,
-0.2990662, -1.999168, -3.437124, 0, 0, 0, 1, 1,
-0.294691, 1.731605, -1.74829, 1, 1, 1, 1, 1,
-0.2916056, 0.3516004, -0.1464543, 1, 1, 1, 1, 1,
-0.2899147, 0.9003294, 0.6882612, 1, 1, 1, 1, 1,
-0.2874028, -0.2921174, -1.929245, 1, 1, 1, 1, 1,
-0.2869868, 0.12084, -3.309434, 1, 1, 1, 1, 1,
-0.2849817, -0.3236936, -2.371866, 1, 1, 1, 1, 1,
-0.2840103, 0.004290478, -1.390831, 1, 1, 1, 1, 1,
-0.2827395, 0.314945, -1.867547, 1, 1, 1, 1, 1,
-0.2798401, 1.455877, 0.9330505, 1, 1, 1, 1, 1,
-0.2771335, 0.1273424, 0.2669565, 1, 1, 1, 1, 1,
-0.2760882, -0.7161743, -3.862697, 1, 1, 1, 1, 1,
-0.2752018, 1.982397, 0.2754767, 1, 1, 1, 1, 1,
-0.2732255, 1.170666, -0.5153378, 1, 1, 1, 1, 1,
-0.2682717, -1.122296, -4.210768, 1, 1, 1, 1, 1,
-0.2515433, -2.569978, -2.882638, 1, 1, 1, 1, 1,
-0.2486966, -0.6952778, -2.589465, 0, 0, 1, 1, 1,
-0.2485083, 0.3133869, -1.04326, 1, 0, 0, 1, 1,
-0.2471706, -0.9565407, -3.400627, 1, 0, 0, 1, 1,
-0.2442375, 1.214278, 0.6798173, 1, 0, 0, 1, 1,
-0.2378042, -1.767998, -2.93398, 1, 0, 0, 1, 1,
-0.237715, 1.834882, 0.777028, 1, 0, 0, 1, 1,
-0.2348903, 0.7881281, 0.2151141, 0, 0, 0, 1, 1,
-0.234455, -1.57293, -2.457632, 0, 0, 0, 1, 1,
-0.232719, 0.2057873, 0.1898472, 0, 0, 0, 1, 1,
-0.2302093, -0.6623139, -4.617905, 0, 0, 0, 1, 1,
-0.2292658, 0.6489517, -1.037967, 0, 0, 0, 1, 1,
-0.2272482, -1.414748, -4.808428, 0, 0, 0, 1, 1,
-0.2251637, -0.2750852, -1.411514, 0, 0, 0, 1, 1,
-0.2245241, 0.3774318, -1.19557, 1, 1, 1, 1, 1,
-0.2230706, -0.9308362, -3.807037, 1, 1, 1, 1, 1,
-0.2218897, 0.5533549, 0.1075279, 1, 1, 1, 1, 1,
-0.221218, 0.2235418, -0.9823759, 1, 1, 1, 1, 1,
-0.2210934, 1.096992, -0.3447136, 1, 1, 1, 1, 1,
-0.2199697, 1.164889, -1.299803, 1, 1, 1, 1, 1,
-0.2178827, 2.01913, -0.2132986, 1, 1, 1, 1, 1,
-0.2110797, -0.07680999, -2.707793, 1, 1, 1, 1, 1,
-0.2076754, -0.205412, -2.290286, 1, 1, 1, 1, 1,
-0.2004708, 0.3844578, -1.739868, 1, 1, 1, 1, 1,
-0.1964144, -2.180143, -4.443468, 1, 1, 1, 1, 1,
-0.1932138, 0.6666969, -0.5430633, 1, 1, 1, 1, 1,
-0.1882501, 1.262576, -0.4708916, 1, 1, 1, 1, 1,
-0.1882454, 0.3764578, 0.3788799, 1, 1, 1, 1, 1,
-0.1869343, 0.2920221, -0.685285, 1, 1, 1, 1, 1,
-0.182426, 0.5721692, -0.2630588, 0, 0, 1, 1, 1,
-0.1761483, 0.5104468, -2.313918, 1, 0, 0, 1, 1,
-0.1754955, 1.166692, 0.0234374, 1, 0, 0, 1, 1,
-0.1744716, 0.1194081, -0.9405918, 1, 0, 0, 1, 1,
-0.1741142, -1.472885, -3.921932, 1, 0, 0, 1, 1,
-0.1740061, -0.5777524, -2.527224, 1, 0, 0, 1, 1,
-0.1726885, 0.796589, 0.1840422, 0, 0, 0, 1, 1,
-0.1707009, -0.1556438, -0.9830324, 0, 0, 0, 1, 1,
-0.1682431, -1.215131, -3.748464, 0, 0, 0, 1, 1,
-0.1676219, 0.776341, -0.3480053, 0, 0, 0, 1, 1,
-0.1646061, 0.3922347, 0.3608718, 0, 0, 0, 1, 1,
-0.1625409, 0.7443392, -0.3250988, 0, 0, 0, 1, 1,
-0.1572792, 0.1157824, -0.8855828, 0, 0, 0, 1, 1,
-0.1556197, 1.467432, -0.5992214, 1, 1, 1, 1, 1,
-0.1381144, 1.409855, -0.6226788, 1, 1, 1, 1, 1,
-0.1374406, 0.6647232, 0.2581164, 1, 1, 1, 1, 1,
-0.1360798, -1.244098, -2.520562, 1, 1, 1, 1, 1,
-0.1342505, -1.296397, -3.881299, 1, 1, 1, 1, 1,
-0.1311223, -1.291064, -2.530836, 1, 1, 1, 1, 1,
-0.1309799, 1.69575, 1.247926, 1, 1, 1, 1, 1,
-0.1307679, 0.2508681, -1.809961, 1, 1, 1, 1, 1,
-0.1302264, -0.6219225, -2.129763, 1, 1, 1, 1, 1,
-0.1257595, 2.301614, 0.8683975, 1, 1, 1, 1, 1,
-0.1240907, 0.2469276, -0.3789515, 1, 1, 1, 1, 1,
-0.1236404, 1.343333, 0.8037028, 1, 1, 1, 1, 1,
-0.1177931, 0.7118226, -1.19143, 1, 1, 1, 1, 1,
-0.1160639, 0.9851289, -1.53145, 1, 1, 1, 1, 1,
-0.1155542, -0.4374833, -2.88713, 1, 1, 1, 1, 1,
-0.1135918, -2.140862, -2.972815, 0, 0, 1, 1, 1,
-0.1129784, -0.001177792, -1.753282, 1, 0, 0, 1, 1,
-0.1084532, 1.074409, 1.69746, 1, 0, 0, 1, 1,
-0.1077066, -0.4607311, -2.941178, 1, 0, 0, 1, 1,
-0.1070711, -1.081226, -3.292771, 1, 0, 0, 1, 1,
-0.1012864, -0.4041606, -2.525838, 1, 0, 0, 1, 1,
-0.1005939, 0.07715096, -1.846891, 0, 0, 0, 1, 1,
-0.0983834, -1.597229, -2.173805, 0, 0, 0, 1, 1,
-0.0979142, 0.07035146, -0.7774284, 0, 0, 0, 1, 1,
-0.09592505, 0.4818328, 0.4777291, 0, 0, 0, 1, 1,
-0.09500159, 0.2304488, -1.175922, 0, 0, 0, 1, 1,
-0.09251037, 0.1308604, -0.02525724, 0, 0, 0, 1, 1,
-0.08874793, 1.004213, -1.059033, 0, 0, 0, 1, 1,
-0.08792011, 1.652024, 0.9972153, 1, 1, 1, 1, 1,
-0.08765545, -0.01074804, -1.703693, 1, 1, 1, 1, 1,
-0.08662249, 0.9496675, -0.8092555, 1, 1, 1, 1, 1,
-0.08649341, 0.5179195, 0.1117818, 1, 1, 1, 1, 1,
-0.08175858, 0.8622847, -1.077288, 1, 1, 1, 1, 1,
-0.08099699, -0.7691371, -0.6359744, 1, 1, 1, 1, 1,
-0.07598022, 1.031667, -1.38415, 1, 1, 1, 1, 1,
-0.07283568, 0.5832794, 0.1417309, 1, 1, 1, 1, 1,
-0.07236646, -1.355645, -4.622369, 1, 1, 1, 1, 1,
-0.06280462, -0.570803, -1.735027, 1, 1, 1, 1, 1,
-0.05959322, -0.238603, -3.700848, 1, 1, 1, 1, 1,
-0.05930308, -1.33443, -2.579148, 1, 1, 1, 1, 1,
-0.05767141, -0.6319149, -2.900671, 1, 1, 1, 1, 1,
-0.0572547, 0.1257963, 0.9039109, 1, 1, 1, 1, 1,
-0.05639035, 0.3051989, -1.128708, 1, 1, 1, 1, 1,
-0.05549334, 1.517577, -0.6674897, 0, 0, 1, 1, 1,
-0.05512457, 0.2177284, -0.4024198, 1, 0, 0, 1, 1,
-0.05290826, 0.8923224, 0.4941562, 1, 0, 0, 1, 1,
-0.0515513, -1.614733, -4.171102, 1, 0, 0, 1, 1,
-0.05132734, 1.925759, 0.9756212, 1, 0, 0, 1, 1,
-0.05049898, -1.475432, -2.376622, 1, 0, 0, 1, 1,
-0.04950146, -1.07203, -1.601144, 0, 0, 0, 1, 1,
-0.04860996, -0.2242878, -2.643622, 0, 0, 0, 1, 1,
-0.04605031, 1.581286, -0.2537768, 0, 0, 0, 1, 1,
-0.0433787, -0.9840274, -4.412622, 0, 0, 0, 1, 1,
-0.03801627, 0.1423445, 0.5191132, 0, 0, 0, 1, 1,
-0.03461577, -0.905099, -3.927088, 0, 0, 0, 1, 1,
-0.03455563, 0.4753501, -0.6843028, 0, 0, 0, 1, 1,
-0.03440847, -0.7805858, -2.483238, 1, 1, 1, 1, 1,
-0.0337502, -0.003763694, -2.429784, 1, 1, 1, 1, 1,
-0.03269885, -0.5804695, -3.161098, 1, 1, 1, 1, 1,
-0.02672444, -0.4068077, -4.839875, 1, 1, 1, 1, 1,
-0.02481323, -1.574754, -1.921849, 1, 1, 1, 1, 1,
-0.02062374, 0.5824897, 1.427036, 1, 1, 1, 1, 1,
-0.01980097, -0.5746244, -4.716177, 1, 1, 1, 1, 1,
-0.01545394, 0.3746785, -0.2279982, 1, 1, 1, 1, 1,
-0.01353566, -0.3290167, -2.764484, 1, 1, 1, 1, 1,
-0.01184836, 0.7767311, -0.5048426, 1, 1, 1, 1, 1,
-0.009341278, -0.8488235, -2.018567, 1, 1, 1, 1, 1,
-0.008014625, 0.2406661, 3.299735, 1, 1, 1, 1, 1,
-0.004831067, -1.001754, -3.281257, 1, 1, 1, 1, 1,
-0.0001479399, 0.1023149, 1.733025, 1, 1, 1, 1, 1,
0.001530401, 0.3235689, 0.8056048, 1, 1, 1, 1, 1,
0.008585515, -0.6959404, 2.94499, 0, 0, 1, 1, 1,
0.009293023, 1.510122, 0.03456442, 1, 0, 0, 1, 1,
0.01214411, 0.03198143, 0.8626895, 1, 0, 0, 1, 1,
0.01334913, -1.8311, 1.2132, 1, 0, 0, 1, 1,
0.01475098, 0.2942387, -0.9596888, 1, 0, 0, 1, 1,
0.01486824, -0.5116962, 2.991194, 1, 0, 0, 1, 1,
0.01606623, -0.06460421, 4.544269, 0, 0, 0, 1, 1,
0.01939562, 0.2191489, 1.286313, 0, 0, 0, 1, 1,
0.01950058, -0.6659394, 3.576569, 0, 0, 0, 1, 1,
0.01954022, -0.8325279, 4.860264, 0, 0, 0, 1, 1,
0.02395184, -0.192343, 1.421369, 0, 0, 0, 1, 1,
0.02647715, -1.33389, 3.441199, 0, 0, 0, 1, 1,
0.02676423, -0.04111651, 3.359048, 0, 0, 0, 1, 1,
0.02794837, 0.04573095, 0.5629224, 1, 1, 1, 1, 1,
0.02841166, 0.3238966, -1.292676, 1, 1, 1, 1, 1,
0.03100078, -0.2811002, 3.235349, 1, 1, 1, 1, 1,
0.03162953, -0.2179916, 1.763714, 1, 1, 1, 1, 1,
0.03270857, 0.7818491, -1.520227, 1, 1, 1, 1, 1,
0.03694445, -0.3521709, 1.962947, 1, 1, 1, 1, 1,
0.03952797, -1.243391, 3.911213, 1, 1, 1, 1, 1,
0.04548353, 1.015578, -0.05472442, 1, 1, 1, 1, 1,
0.04577602, -1.099359, 1.92883, 1, 1, 1, 1, 1,
0.04713701, 1.201634, 1.037401, 1, 1, 1, 1, 1,
0.04759783, -0.9254451, 3.849514, 1, 1, 1, 1, 1,
0.0480499, 1.192681, 0.1680361, 1, 1, 1, 1, 1,
0.04848964, 1.961839, -0.4421677, 1, 1, 1, 1, 1,
0.04851153, -0.8536745, 2.889031, 1, 1, 1, 1, 1,
0.05498834, -0.1303038, 2.192827, 1, 1, 1, 1, 1,
0.05698987, -0.345412, 3.289664, 0, 0, 1, 1, 1,
0.05905811, -0.7734591, 2.135204, 1, 0, 0, 1, 1,
0.06121567, -1.215568, 3.655815, 1, 0, 0, 1, 1,
0.06158436, -0.6044474, 1.696231, 1, 0, 0, 1, 1,
0.0676787, -0.7435269, 2.580417, 1, 0, 0, 1, 1,
0.07206601, 0.3026222, -0.1427248, 1, 0, 0, 1, 1,
0.08218201, -1.423066, 2.222553, 0, 0, 0, 1, 1,
0.0839062, -0.05007054, 2.446492, 0, 0, 0, 1, 1,
0.09431124, 0.08981894, 0.6347178, 0, 0, 0, 1, 1,
0.09784245, -0.6289428, 0.8750359, 0, 0, 0, 1, 1,
0.09816606, 0.03882188, 1.43456, 0, 0, 0, 1, 1,
0.1002228, -0.8334486, 3.920411, 0, 0, 0, 1, 1,
0.1027761, -0.5427564, 1.413324, 0, 0, 0, 1, 1,
0.1049177, 0.7556839, 2.542078, 1, 1, 1, 1, 1,
0.108119, -0.2510311, 1.874851, 1, 1, 1, 1, 1,
0.1085775, -0.03695868, 2.370834, 1, 1, 1, 1, 1,
0.1096296, 0.1171752, 2.709618, 1, 1, 1, 1, 1,
0.1097404, 0.8307037, -2.375009, 1, 1, 1, 1, 1,
0.1199433, 0.3884428, 1.605173, 1, 1, 1, 1, 1,
0.1223044, 1.650253, -2.131766, 1, 1, 1, 1, 1,
0.12265, 0.3002559, 1.119449, 1, 1, 1, 1, 1,
0.1256386, -0.2820164, 2.932328, 1, 1, 1, 1, 1,
0.1258921, -0.3770896, 3.01325, 1, 1, 1, 1, 1,
0.1267329, -0.3099138, 2.290729, 1, 1, 1, 1, 1,
0.1301714, -0.4668923, 2.735024, 1, 1, 1, 1, 1,
0.1370912, -0.08824064, 3.909975, 1, 1, 1, 1, 1,
0.137322, 1.270688, -2.501611, 1, 1, 1, 1, 1,
0.139558, 0.1704792, 1.240278, 1, 1, 1, 1, 1,
0.1399296, 0.2561423, 0.4015526, 0, 0, 1, 1, 1,
0.1408487, 0.6437362, 0.497246, 1, 0, 0, 1, 1,
0.1412755, -1.258739, 3.193757, 1, 0, 0, 1, 1,
0.1435289, 1.055204, -0.5244614, 1, 0, 0, 1, 1,
0.145215, -1.233759, 2.003677, 1, 0, 0, 1, 1,
0.146568, 1.159989, 1.223226, 1, 0, 0, 1, 1,
0.1502905, 0.5832394, -0.7489858, 0, 0, 0, 1, 1,
0.1521113, 0.2672907, 0.5814556, 0, 0, 0, 1, 1,
0.154244, 1.707201, 2.081793, 0, 0, 0, 1, 1,
0.1572705, -0.69121, 2.699185, 0, 0, 0, 1, 1,
0.1626823, -1.354149, 3.232915, 0, 0, 0, 1, 1,
0.1639191, 2.204382, 0.3796557, 0, 0, 0, 1, 1,
0.165969, 1.000477, -0.6902015, 0, 0, 0, 1, 1,
0.1663779, 0.4144045, 0.4083162, 1, 1, 1, 1, 1,
0.1678569, -0.224869, 1.820684, 1, 1, 1, 1, 1,
0.1705192, 0.7202021, 0.1520683, 1, 1, 1, 1, 1,
0.1707525, -1.110109, 3.332036, 1, 1, 1, 1, 1,
0.1714371, -0.6474453, 4.309613, 1, 1, 1, 1, 1,
0.1716764, -0.3337555, 3.155629, 1, 1, 1, 1, 1,
0.1750249, 0.02120385, 0.9197221, 1, 1, 1, 1, 1,
0.175371, -1.850731, 4.234282, 1, 1, 1, 1, 1,
0.1851164, 0.7318223, 0.5534591, 1, 1, 1, 1, 1,
0.1852234, 1.178219, 0.7790136, 1, 1, 1, 1, 1,
0.1856282, 0.3594828, -0.01777358, 1, 1, 1, 1, 1,
0.1880052, 1.226299, 2.352339, 1, 1, 1, 1, 1,
0.1886876, -0.2887248, 2.796878, 1, 1, 1, 1, 1,
0.1981079, 0.883321, 0.8840795, 1, 1, 1, 1, 1,
0.1987602, 1.649961, 1.576303, 1, 1, 1, 1, 1,
0.2051429, 0.9083722, -0.1664517, 0, 0, 1, 1, 1,
0.2052478, -0.4372464, 3.289134, 1, 0, 0, 1, 1,
0.2146264, -0.4479259, 3.754778, 1, 0, 0, 1, 1,
0.2166991, 1.423729, 1.023564, 1, 0, 0, 1, 1,
0.2168812, 0.1178191, 1.876815, 1, 0, 0, 1, 1,
0.2171338, -0.1070711, 1.621327, 1, 0, 0, 1, 1,
0.2174346, 0.5664319, -1.772865, 0, 0, 0, 1, 1,
0.2190385, 0.4972294, 0.1790065, 0, 0, 0, 1, 1,
0.2212865, 0.909391, 1.658693, 0, 0, 0, 1, 1,
0.2217557, -0.7789772, 0.91495, 0, 0, 0, 1, 1,
0.224463, 0.8201334, 0.6615058, 0, 0, 0, 1, 1,
0.225325, 0.7611601, 0.2595106, 0, 0, 0, 1, 1,
0.2255588, -0.9200088, 1.630019, 0, 0, 0, 1, 1,
0.227022, -0.1433265, 0.9117475, 1, 1, 1, 1, 1,
0.227337, 0.4349308, 1.831827, 1, 1, 1, 1, 1,
0.2295884, -0.9810663, 1.617139, 1, 1, 1, 1, 1,
0.2366574, -0.5142721, 2.685795, 1, 1, 1, 1, 1,
0.2450384, -1.802782, 6.655173, 1, 1, 1, 1, 1,
0.2455569, -0.009739349, 1.002748, 1, 1, 1, 1, 1,
0.2489863, 0.9719861, 0.7640414, 1, 1, 1, 1, 1,
0.2518868, -0.1235887, 3.484423, 1, 1, 1, 1, 1,
0.2546785, -0.09843204, 1.391538, 1, 1, 1, 1, 1,
0.2550778, -0.1728413, 2.858988, 1, 1, 1, 1, 1,
0.2568018, -0.06226107, 1.862188, 1, 1, 1, 1, 1,
0.2606079, 0.05856684, 0.971989, 1, 1, 1, 1, 1,
0.2616236, -0.1841172, 1.774578, 1, 1, 1, 1, 1,
0.2621424, 0.6839553, 1.272378, 1, 1, 1, 1, 1,
0.2623348, -0.5603271, 2.622869, 1, 1, 1, 1, 1,
0.2628919, -0.5527983, 1.512661, 0, 0, 1, 1, 1,
0.2634056, 1.743683, -0.8916855, 1, 0, 0, 1, 1,
0.2662199, 0.7635954, 1.469713, 1, 0, 0, 1, 1,
0.2718573, 2.821138, 0.9327983, 1, 0, 0, 1, 1,
0.2733282, 0.141198, 1.908843, 1, 0, 0, 1, 1,
0.2751716, 1.063045, 0.6377869, 1, 0, 0, 1, 1,
0.2760102, 0.2210605, 0.4084051, 0, 0, 0, 1, 1,
0.2767875, -0.5781532, 2.86935, 0, 0, 0, 1, 1,
0.2839794, 0.2382781, -1.850705, 0, 0, 0, 1, 1,
0.2940347, 0.775659, 0.7809764, 0, 0, 0, 1, 1,
0.2941521, -1.893474, 3.926241, 0, 0, 0, 1, 1,
0.2964373, -0.1919642, 3.211421, 0, 0, 0, 1, 1,
0.2974692, 0.5856624, -0.334179, 0, 0, 0, 1, 1,
0.3007815, 0.3246276, 1.257062, 1, 1, 1, 1, 1,
0.3080491, 0.2416846, -1.817558, 1, 1, 1, 1, 1,
0.3154674, 0.1203087, 2.533611, 1, 1, 1, 1, 1,
0.3171706, -0.8990598, 3.723516, 1, 1, 1, 1, 1,
0.317834, -1.196076, 4.173038, 1, 1, 1, 1, 1,
0.3186359, 1.451699, 1.525068, 1, 1, 1, 1, 1,
0.3226741, 0.3151522, -0.5814751, 1, 1, 1, 1, 1,
0.3245087, 0.9320205, 0.7477524, 1, 1, 1, 1, 1,
0.3251404, -0.4205502, 2.391411, 1, 1, 1, 1, 1,
0.3272956, 0.307608, 1.435279, 1, 1, 1, 1, 1,
0.3276175, 0.06392834, 2.260239, 1, 1, 1, 1, 1,
0.3292592, 1.063797, 1.877412, 1, 1, 1, 1, 1,
0.3296388, 0.7372879, -0.6980274, 1, 1, 1, 1, 1,
0.3316121, -0.252868, 4.217775, 1, 1, 1, 1, 1,
0.3336027, 0.7216645, 0.2525496, 1, 1, 1, 1, 1,
0.3360802, 0.8428373, 1.003264, 0, 0, 1, 1, 1,
0.3409596, -1.117775, 3.044042, 1, 0, 0, 1, 1,
0.3414637, 0.3871661, 2.442637, 1, 0, 0, 1, 1,
0.3464418, 1.276058, -0.2262791, 1, 0, 0, 1, 1,
0.3492619, 1.092308, -0.0765634, 1, 0, 0, 1, 1,
0.3518964, -0.1422299, 1.29403, 1, 0, 0, 1, 1,
0.3567469, 1.695871, 0.7896465, 0, 0, 0, 1, 1,
0.3629252, 0.761461, 0.1955926, 0, 0, 0, 1, 1,
0.3653641, 1.078279, 0.1888012, 0, 0, 0, 1, 1,
0.3684449, 0.9251564, -0.4235161, 0, 0, 0, 1, 1,
0.3723118, 0.416003, -0.8397738, 0, 0, 0, 1, 1,
0.3790231, -1.126638, 4.333656, 0, 0, 0, 1, 1,
0.3820341, 0.3361363, 1.597052, 0, 0, 0, 1, 1,
0.3837154, -0.1547566, 2.476236, 1, 1, 1, 1, 1,
0.3897214, 1.517403, 0.321445, 1, 1, 1, 1, 1,
0.3915682, -1.365737, 1.125321, 1, 1, 1, 1, 1,
0.391975, 1.860991, 0.7727603, 1, 1, 1, 1, 1,
0.394196, 0.5127279, 0.5483392, 1, 1, 1, 1, 1,
0.3946959, 0.4402994, 0.3533377, 1, 1, 1, 1, 1,
0.3957022, 0.9567984, 1.721087, 1, 1, 1, 1, 1,
0.4015682, -0.4578571, 1.814347, 1, 1, 1, 1, 1,
0.4061714, 0.7364724, -1.958016, 1, 1, 1, 1, 1,
0.4091195, -0.6254729, 2.57574, 1, 1, 1, 1, 1,
0.412701, 0.1222355, 3.923359, 1, 1, 1, 1, 1,
0.4150097, 0.5892884, 0.4138187, 1, 1, 1, 1, 1,
0.4194141, -0.5424762, 2.095032, 1, 1, 1, 1, 1,
0.4204561, 0.1894397, -1.154544, 1, 1, 1, 1, 1,
0.4207851, 0.6462799, -0.5731821, 1, 1, 1, 1, 1,
0.4227669, -0.2094217, 0.1920978, 0, 0, 1, 1, 1,
0.4248573, 0.06308959, 1.014609, 1, 0, 0, 1, 1,
0.424936, 1.637227, 2.646801, 1, 0, 0, 1, 1,
0.4316015, -0.06967156, 1.777496, 1, 0, 0, 1, 1,
0.4359311, 0.4539823, 0.359007, 1, 0, 0, 1, 1,
0.4362489, 1.805545, 1.886616, 1, 0, 0, 1, 1,
0.436527, -0.5844258, 2.430795, 0, 0, 0, 1, 1,
0.438992, 0.4684361, 0.3595239, 0, 0, 0, 1, 1,
0.4401248, 1.154104, -0.06207307, 0, 0, 0, 1, 1,
0.4482746, 0.2499232, 0.4765831, 0, 0, 0, 1, 1,
0.4499177, -1.135132, 1.884401, 0, 0, 0, 1, 1,
0.4612162, 0.207876, 0.8638855, 0, 0, 0, 1, 1,
0.4729563, 1.667263, 1.434879, 0, 0, 0, 1, 1,
0.473505, 0.6954949, 2.156426, 1, 1, 1, 1, 1,
0.4818587, 0.2687578, 1.236799, 1, 1, 1, 1, 1,
0.4819036, -2.7178, 2.625588, 1, 1, 1, 1, 1,
0.4865688, 0.3471502, 1.851435, 1, 1, 1, 1, 1,
0.4888319, -0.8355834, 3.465962, 1, 1, 1, 1, 1,
0.4929641, -0.1879139, 1.514301, 1, 1, 1, 1, 1,
0.4978876, 1.138941, -0.3985766, 1, 1, 1, 1, 1,
0.498868, 1.971541, 1.648979, 1, 1, 1, 1, 1,
0.5009385, -0.1726808, 2.680657, 1, 1, 1, 1, 1,
0.50293, 0.3335336, 0.8770139, 1, 1, 1, 1, 1,
0.5087971, -0.5507724, 1.829982, 1, 1, 1, 1, 1,
0.5120162, -0.02697005, 1.66134, 1, 1, 1, 1, 1,
0.5124605, 0.5842828, 1.28491, 1, 1, 1, 1, 1,
0.5129971, 0.7732255, 1.152135, 1, 1, 1, 1, 1,
0.5148553, 0.60861, 1.54237, 1, 1, 1, 1, 1,
0.522805, 0.4324897, 0.6095895, 0, 0, 1, 1, 1,
0.5243158, -0.7090936, 2.816143, 1, 0, 0, 1, 1,
0.5243756, 0.4398697, -0.6176437, 1, 0, 0, 1, 1,
0.5267419, 1.515637, -1.501367, 1, 0, 0, 1, 1,
0.5325011, 0.07014313, 0.7983618, 1, 0, 0, 1, 1,
0.5336162, 0.08341205, 1.38159, 1, 0, 0, 1, 1,
0.5344568, -1.232066, 4.081346, 0, 0, 0, 1, 1,
0.5351257, -1.200112, 1.014984, 0, 0, 0, 1, 1,
0.5364769, -0.7998672, 1.953345, 0, 0, 0, 1, 1,
0.5416569, -0.4893481, 2.936767, 0, 0, 0, 1, 1,
0.5427966, -1.595907, 3.3786, 0, 0, 0, 1, 1,
0.5458504, -0.09229825, 1.908429, 0, 0, 0, 1, 1,
0.5528439, 0.5841007, 0.09275623, 0, 0, 0, 1, 1,
0.5533518, 0.6348748, 1.394866, 1, 1, 1, 1, 1,
0.5564222, -0.7438079, 3.487589, 1, 1, 1, 1, 1,
0.5605588, -1.73138, 2.89854, 1, 1, 1, 1, 1,
0.5606394, 0.9360069, 0.5138581, 1, 1, 1, 1, 1,
0.5641659, -0.3940136, 2.041409, 1, 1, 1, 1, 1,
0.5648221, -0.01665891, -0.2142696, 1, 1, 1, 1, 1,
0.5716347, 0.4180276, -0.1994077, 1, 1, 1, 1, 1,
0.5717757, -1.381657, 3.576246, 1, 1, 1, 1, 1,
0.5732835, 0.4458149, 2.297153, 1, 1, 1, 1, 1,
0.5741541, -0.6666546, 2.659541, 1, 1, 1, 1, 1,
0.5744278, 0.5214171, 0.9290094, 1, 1, 1, 1, 1,
0.5807912, -0.1480697, 1.22339, 1, 1, 1, 1, 1,
0.583975, 0.2130209, 1.100022, 1, 1, 1, 1, 1,
0.5919603, -0.9174965, 2.514289, 1, 1, 1, 1, 1,
0.5947113, -0.1464521, 3.51483, 1, 1, 1, 1, 1,
0.5954398, -2.315114, 2.565252, 0, 0, 1, 1, 1,
0.600188, -0.1803328, -0.09016068, 1, 0, 0, 1, 1,
0.6012385, 0.8156158, 1.559098, 1, 0, 0, 1, 1,
0.6034014, 1.150357, -1.312157, 1, 0, 0, 1, 1,
0.6092169, 1.806396, 0.05011838, 1, 0, 0, 1, 1,
0.6105468, 0.8858753, -0.1086094, 1, 0, 0, 1, 1,
0.6130536, -0.6561263, 2.024229, 0, 0, 0, 1, 1,
0.6148784, -1.469733, 2.181464, 0, 0, 0, 1, 1,
0.6151267, 1.090808, 0.9208674, 0, 0, 0, 1, 1,
0.6154197, 0.4698726, 0.8604748, 0, 0, 0, 1, 1,
0.6231446, -0.608734, 3.754847, 0, 0, 0, 1, 1,
0.6237878, -0.9004609, 2.926444, 0, 0, 0, 1, 1,
0.6259546, 0.9296895, 0.4101122, 0, 0, 0, 1, 1,
0.629819, 0.7127393, -0.3408954, 1, 1, 1, 1, 1,
0.6305575, 0.3805805, 1.320028, 1, 1, 1, 1, 1,
0.6330375, -0.2647318, 1.999931, 1, 1, 1, 1, 1,
0.6333905, -0.3294845, 3.754947, 1, 1, 1, 1, 1,
0.6398103, -1.11628, 4.21841, 1, 1, 1, 1, 1,
0.6462615, -0.4625795, 1.982053, 1, 1, 1, 1, 1,
0.6474362, 1.82289, -0.6339667, 1, 1, 1, 1, 1,
0.6491954, -1.648098, 2.43428, 1, 1, 1, 1, 1,
0.6552588, 0.237568, 2.107062, 1, 1, 1, 1, 1,
0.6567509, 0.4114662, -0.8620526, 1, 1, 1, 1, 1,
0.657254, 0.8530813, 0.6235291, 1, 1, 1, 1, 1,
0.665834, -3.383004, 4.475174, 1, 1, 1, 1, 1,
0.6700061, -1.191916, 1.626798, 1, 1, 1, 1, 1,
0.6725192, 0.9861225, 2.508909, 1, 1, 1, 1, 1,
0.6748819, 0.2841739, 0.03257808, 1, 1, 1, 1, 1,
0.6798455, -1.079919, 4.75963, 0, 0, 1, 1, 1,
0.6800419, -0.7508435, 2.677825, 1, 0, 0, 1, 1,
0.6812679, -0.05772523, 2.032557, 1, 0, 0, 1, 1,
0.68685, -0.2325435, 1.908335, 1, 0, 0, 1, 1,
0.6910709, -1.348193, 2.984392, 1, 0, 0, 1, 1,
0.6971638, -1.743413, 1.952863, 1, 0, 0, 1, 1,
0.698873, 0.5911743, 0.3376092, 0, 0, 0, 1, 1,
0.7010903, -0.7509485, 1.802628, 0, 0, 0, 1, 1,
0.7206275, -0.3245972, 1.935936, 0, 0, 0, 1, 1,
0.7235798, -0.02751945, 1.772093, 0, 0, 0, 1, 1,
0.7263918, -0.07335661, 0.7090519, 0, 0, 0, 1, 1,
0.7404365, 2.080911, -0.2023495, 0, 0, 0, 1, 1,
0.7425623, -0.2914648, 2.208707, 0, 0, 0, 1, 1,
0.7553939, 0.430308, 0.5020351, 1, 1, 1, 1, 1,
0.7559316, 0.8073528, -1.115098, 1, 1, 1, 1, 1,
0.7571496, 0.9629234, 1.306558, 1, 1, 1, 1, 1,
0.7619844, -0.4332671, 2.334461, 1, 1, 1, 1, 1,
0.7729463, -1.28245, 1.233223, 1, 1, 1, 1, 1,
0.7765667, -0.1937469, 1.55345, 1, 1, 1, 1, 1,
0.7775578, 1.747585, 1.669253, 1, 1, 1, 1, 1,
0.7778437, 0.8218904, 0.0536896, 1, 1, 1, 1, 1,
0.7831328, -0.844215, 4.450034, 1, 1, 1, 1, 1,
0.789454, 0.1429606, 2.920138, 1, 1, 1, 1, 1,
0.7935899, -0.3433404, 3.169723, 1, 1, 1, 1, 1,
0.7954535, -0.9581576, 1.390889, 1, 1, 1, 1, 1,
0.7976912, 1.274892, 0.5215186, 1, 1, 1, 1, 1,
0.8002768, 2.698695, -1.128343, 1, 1, 1, 1, 1,
0.8023903, -0.2480917, -0.5733997, 1, 1, 1, 1, 1,
0.8088913, -0.8928534, 3.276563, 0, 0, 1, 1, 1,
0.8121041, 0.5196336, 1.719456, 1, 0, 0, 1, 1,
0.8130511, -0.04355147, 3.479584, 1, 0, 0, 1, 1,
0.8131962, 0.9626043, 1.124247, 1, 0, 0, 1, 1,
0.8144384, 0.09839899, 2.527706, 1, 0, 0, 1, 1,
0.8180105, -0.8036636, 1.768131, 1, 0, 0, 1, 1,
0.8187274, 0.6598316, 0.06779361, 0, 0, 0, 1, 1,
0.8204618, -0.6393244, 1.839048, 0, 0, 0, 1, 1,
0.821535, -1.38127, 1.784058, 0, 0, 0, 1, 1,
0.8240263, -0.1952636, 1.850201, 0, 0, 0, 1, 1,
0.826525, -0.6721753, 2.094695, 0, 0, 0, 1, 1,
0.8328684, 0.2114186, 0.04675168, 0, 0, 0, 1, 1,
0.8450326, 0.8839915, 1.591558, 0, 0, 0, 1, 1,
0.8465061, 0.4539891, -0.04296247, 1, 1, 1, 1, 1,
0.8529546, -1.927714, 1.287644, 1, 1, 1, 1, 1,
0.8555694, -0.2818124, 2.768335, 1, 1, 1, 1, 1,
0.8560462, 0.5862496, 1.533699, 1, 1, 1, 1, 1,
0.8584776, 0.8665836, 0.7540543, 1, 1, 1, 1, 1,
0.8756129, 0.03637645, 2.579321, 1, 1, 1, 1, 1,
0.8768398, -0.7279983, 2.590441, 1, 1, 1, 1, 1,
0.8802274, 0.7907495, 0.0819873, 1, 1, 1, 1, 1,
0.8805279, 0.3504933, 1.018218, 1, 1, 1, 1, 1,
0.8902858, -0.1836844, 2.90054, 1, 1, 1, 1, 1,
0.8913003, 0.7589974, 1.0321, 1, 1, 1, 1, 1,
0.8918175, -0.04439222, 2.642944, 1, 1, 1, 1, 1,
0.8998834, -0.2204314, 2.162055, 1, 1, 1, 1, 1,
0.9018949, -0.9401259, 0.9401519, 1, 1, 1, 1, 1,
0.903432, 0.579665, 0.2993529, 1, 1, 1, 1, 1,
0.9041059, -0.6139193, 0.9237033, 0, 0, 1, 1, 1,
0.9044343, 0.7206369, -0.9457571, 1, 0, 0, 1, 1,
0.9093281, 0.6508978, 0.4885806, 1, 0, 0, 1, 1,
0.9120666, 0.2774303, 0.1663172, 1, 0, 0, 1, 1,
0.9122399, -1.553932, 2.326, 1, 0, 0, 1, 1,
0.91636, 1.023119, -0.66829, 1, 0, 0, 1, 1,
0.918519, 0.9175458, 1.170182, 0, 0, 0, 1, 1,
0.9209867, 0.2803979, 0.6271162, 0, 0, 0, 1, 1,
0.9239248, 0.3707399, 1.128869, 0, 0, 0, 1, 1,
0.9264623, 0.180774, 1.90418, 0, 0, 0, 1, 1,
0.9317778, 0.3926345, -0.5144338, 0, 0, 0, 1, 1,
0.9322565, 0.6908435, 1.582387, 0, 0, 0, 1, 1,
0.9345034, -0.45521, 2.743155, 0, 0, 0, 1, 1,
0.9416671, -0.01314586, 3.200938, 1, 1, 1, 1, 1,
0.9440191, -0.7270741, 1.802437, 1, 1, 1, 1, 1,
0.9455391, -2.194972, 1.989147, 1, 1, 1, 1, 1,
0.9465918, 1.535506, 0.1883782, 1, 1, 1, 1, 1,
0.9474148, 0.517747, 1.121346, 1, 1, 1, 1, 1,
0.949044, -0.1332028, 2.152814, 1, 1, 1, 1, 1,
0.950269, 1.036286, 0.7709554, 1, 1, 1, 1, 1,
0.9512419, 1.498778, 1.359322, 1, 1, 1, 1, 1,
0.9533682, 0.76505, 1.982503, 1, 1, 1, 1, 1,
0.9621079, 0.6464897, 1.213936, 1, 1, 1, 1, 1,
0.9645528, 0.03402366, 0.3809685, 1, 1, 1, 1, 1,
0.9665437, 0.2110484, 3.162541, 1, 1, 1, 1, 1,
0.9665918, 1.254497, 1.971071, 1, 1, 1, 1, 1,
0.9681128, 2.547355, 0.6745598, 1, 1, 1, 1, 1,
0.9690577, -0.8805938, 3.678878, 1, 1, 1, 1, 1,
0.9693604, -0.9104612, 3.42934, 0, 0, 1, 1, 1,
0.9802073, -0.9039496, 2.233239, 1, 0, 0, 1, 1,
0.9822173, -0.1912501, 4.055555, 1, 0, 0, 1, 1,
0.9831048, 1.019632, 2.380139, 1, 0, 0, 1, 1,
0.9842244, -0.2963206, 1.072154, 1, 0, 0, 1, 1,
0.988857, -0.5321547, 0.5589689, 1, 0, 0, 1, 1,
0.9942451, -0.9872666, 0.9953117, 0, 0, 0, 1, 1,
0.9943246, 0.02123401, -0.05488139, 0, 0, 0, 1, 1,
0.9943807, 3.17267, 0.9583553, 0, 0, 0, 1, 1,
0.9944531, 1.315758, 0.6980153, 0, 0, 0, 1, 1,
1.006816, 1.542695, 2.093206, 0, 0, 0, 1, 1,
1.010146, -0.7657339, 2.981669, 0, 0, 0, 1, 1,
1.012576, -1.424127, 0.9337959, 0, 0, 0, 1, 1,
1.01482, 0.4768666, 1.081108, 1, 1, 1, 1, 1,
1.026234, -2.524904, 2.178167, 1, 1, 1, 1, 1,
1.0324, -0.01048301, 1.433987, 1, 1, 1, 1, 1,
1.033075, 0.2015551, 0.3872207, 1, 1, 1, 1, 1,
1.041928, 1.943749, 2.250788, 1, 1, 1, 1, 1,
1.062055, 0.05599327, 0.9027556, 1, 1, 1, 1, 1,
1.062851, 0.134082, 2.103984, 1, 1, 1, 1, 1,
1.067559, 1.665892, 2.719762, 1, 1, 1, 1, 1,
1.073816, 0.7737272, 1.360214, 1, 1, 1, 1, 1,
1.08586, 0.5122505, 2.318407, 1, 1, 1, 1, 1,
1.089423, 0.008189205, 1.947859, 1, 1, 1, 1, 1,
1.092217, -0.402728, 3.272156, 1, 1, 1, 1, 1,
1.095786, 0.2527756, 1.16741, 1, 1, 1, 1, 1,
1.096121, -0.4035854, 0.9948164, 1, 1, 1, 1, 1,
1.108671, 1.726295, -0.2979265, 1, 1, 1, 1, 1,
1.109695, 0.4102036, 0.5944169, 0, 0, 1, 1, 1,
1.115703, 0.7435479, 1.122308, 1, 0, 0, 1, 1,
1.119409, -2.558462, 4.640375, 1, 0, 0, 1, 1,
1.123173, 0.2178302, 1.190523, 1, 0, 0, 1, 1,
1.134724, 0.5391652, 1.918149, 1, 0, 0, 1, 1,
1.139727, 0.7012447, 1.086774, 1, 0, 0, 1, 1,
1.148219, -0.2954568, 2.188437, 0, 0, 0, 1, 1,
1.152299, -0.2615659, 1.944841, 0, 0, 0, 1, 1,
1.155214, 0.8070226, -0.8845286, 0, 0, 0, 1, 1,
1.155271, 0.5258953, 0.7542105, 0, 0, 0, 1, 1,
1.16278, -1.428726, 1.653095, 0, 0, 0, 1, 1,
1.166748, 0.6688284, 1.562848, 0, 0, 0, 1, 1,
1.172666, 0.6575721, 1.57, 0, 0, 0, 1, 1,
1.174184, 0.84771, 0.4501353, 1, 1, 1, 1, 1,
1.184632, 0.8607552, 0.767442, 1, 1, 1, 1, 1,
1.191889, 2.34872, 0.4451784, 1, 1, 1, 1, 1,
1.198654, 0.3271708, 1.374452, 1, 1, 1, 1, 1,
1.224076, -0.2507265, 2.361363, 1, 1, 1, 1, 1,
1.226599, 0.05566528, 1.057695, 1, 1, 1, 1, 1,
1.22883, -1.210958, 4.524333, 1, 1, 1, 1, 1,
1.229046, -0.9369678, 1.953491, 1, 1, 1, 1, 1,
1.23363, -0.1327353, 0.6855859, 1, 1, 1, 1, 1,
1.238595, 1.72538, 2.484691, 1, 1, 1, 1, 1,
1.25055, 2.275335, 2.21719, 1, 1, 1, 1, 1,
1.25976, -1.034439, 2.842396, 1, 1, 1, 1, 1,
1.26508, 0.7880758, 1.246422, 1, 1, 1, 1, 1,
1.266108, -0.1259844, 3.419912, 1, 1, 1, 1, 1,
1.267061, 0.7875293, 0.6641815, 1, 1, 1, 1, 1,
1.269306, 0.3318619, 2.238623, 0, 0, 1, 1, 1,
1.281929, -0.318681, 2.554682, 1, 0, 0, 1, 1,
1.283434, 1.073711, 0.803928, 1, 0, 0, 1, 1,
1.283437, 0.03520432, 2.403893, 1, 0, 0, 1, 1,
1.283486, 0.1715745, 2.350624, 1, 0, 0, 1, 1,
1.283908, -0.4334708, 2.808408, 1, 0, 0, 1, 1,
1.286301, 0.6985564, -0.4350545, 0, 0, 0, 1, 1,
1.288467, -1.314237, 1.391614, 0, 0, 0, 1, 1,
1.288508, 2.87189, 1.867292, 0, 0, 0, 1, 1,
1.293126, -0.2769623, 1.123838, 0, 0, 0, 1, 1,
1.308155, -1.80051, 1.60606, 0, 0, 0, 1, 1,
1.312086, 0.9505709, -0.5682947, 0, 0, 0, 1, 1,
1.314175, 0.1939283, 1.323358, 0, 0, 0, 1, 1,
1.315572, -1.551178, 2.598144, 1, 1, 1, 1, 1,
1.316489, -0.5721385, 1.346471, 1, 1, 1, 1, 1,
1.330257, -1.613963, 2.873083, 1, 1, 1, 1, 1,
1.330706, -0.9036719, 1.042847, 1, 1, 1, 1, 1,
1.334258, -0.796703, 1.6536, 1, 1, 1, 1, 1,
1.335789, -1.735476, 2.138752, 1, 1, 1, 1, 1,
1.34163, 0.3120303, 2.286869, 1, 1, 1, 1, 1,
1.344084, -1.63962, 1.975984, 1, 1, 1, 1, 1,
1.344241, 1.132129, 0.2740372, 1, 1, 1, 1, 1,
1.350269, 0.7438377, 0.5816916, 1, 1, 1, 1, 1,
1.357308, 0.6676686, 1.915187, 1, 1, 1, 1, 1,
1.357981, 1.347283, 2.061575, 1, 1, 1, 1, 1,
1.366176, 0.5083131, 0.3309696, 1, 1, 1, 1, 1,
1.366719, 0.4075488, 0.2667419, 1, 1, 1, 1, 1,
1.368034, 0.08109935, 1.235614, 1, 1, 1, 1, 1,
1.397796, 0.01478785, 1.661378, 0, 0, 1, 1, 1,
1.41502, -1.623116, 4.380098, 1, 0, 0, 1, 1,
1.417377, 0.4612894, 0.1223598, 1, 0, 0, 1, 1,
1.42039, -1.050824, 3.268927, 1, 0, 0, 1, 1,
1.427518, -0.3805942, 0.4668435, 1, 0, 0, 1, 1,
1.427785, 0.7275888, 1.330194, 1, 0, 0, 1, 1,
1.437536, -2.373455, 2.514383, 0, 0, 0, 1, 1,
1.437555, -0.5818825, 2.188314, 0, 0, 0, 1, 1,
1.44496, -1.734452, 2.374806, 0, 0, 0, 1, 1,
1.457374, 1.418558, -2.871464, 0, 0, 0, 1, 1,
1.469158, 1.466114, 0.9922922, 0, 0, 0, 1, 1,
1.475261, 0.06752874, 2.668118, 0, 0, 0, 1, 1,
1.481809, -1.007848, 1.348872, 0, 0, 0, 1, 1,
1.513821, -0.1190687, -0.7884637, 1, 1, 1, 1, 1,
1.515778, -0.1343341, 3.724281, 1, 1, 1, 1, 1,
1.523324, 0.9962809, 0.8758744, 1, 1, 1, 1, 1,
1.52617, 1.453115, 2.263158, 1, 1, 1, 1, 1,
1.560561, -0.2170083, 0.7281502, 1, 1, 1, 1, 1,
1.575697, 0.4670739, 2.369719, 1, 1, 1, 1, 1,
1.587832, 0.9748901, 1.432633, 1, 1, 1, 1, 1,
1.58917, -0.08897763, 2.808541, 1, 1, 1, 1, 1,
1.592996, 1.198512, 0.2668159, 1, 1, 1, 1, 1,
1.602148, 0.7810363, 1.348131, 1, 1, 1, 1, 1,
1.614588, 1.73313, -0.5463613, 1, 1, 1, 1, 1,
1.62492, 1.632772, -1.098425, 1, 1, 1, 1, 1,
1.630448, 0.2240897, 3.07474, 1, 1, 1, 1, 1,
1.666505, 1.454542, -0.8951311, 1, 1, 1, 1, 1,
1.673114, 0.8366193, 0.5777412, 1, 1, 1, 1, 1,
1.674636, 0.880654, 2.666032, 0, 0, 1, 1, 1,
1.678418, -0.2821754, 2.909868, 1, 0, 0, 1, 1,
1.690442, -0.1790304, 1.8306, 1, 0, 0, 1, 1,
1.692179, 2.551296, 1.079582, 1, 0, 0, 1, 1,
1.714065, -0.107744, 0.8928717, 1, 0, 0, 1, 1,
1.720798, -2.730731, 1.412034, 1, 0, 0, 1, 1,
1.722137, -2.360357, 2.895118, 0, 0, 0, 1, 1,
1.722861, -0.6910465, 0.5273613, 0, 0, 0, 1, 1,
1.730268, 0.3386487, 1.771479, 0, 0, 0, 1, 1,
1.73254, -0.968086, 4.013511, 0, 0, 0, 1, 1,
1.751693, -0.06305408, 2.187853, 0, 0, 0, 1, 1,
1.766107, -0.9626535, 2.510425, 0, 0, 0, 1, 1,
1.787806, -0.8486954, 0.8928985, 0, 0, 0, 1, 1,
1.795347, 0.1125972, 2.701361, 1, 1, 1, 1, 1,
1.796868, 0.1180235, 1.783861, 1, 1, 1, 1, 1,
1.80711, 1.411064, 0.08946485, 1, 1, 1, 1, 1,
1.808238, -0.2490136, 0.5475127, 1, 1, 1, 1, 1,
1.828229, 1.669958, 0.005627433, 1, 1, 1, 1, 1,
1.83307, 0.3684359, 1.409133, 1, 1, 1, 1, 1,
1.841662, -0.7412983, 1.48204, 1, 1, 1, 1, 1,
1.844642, 0.5293653, 0.7289831, 1, 1, 1, 1, 1,
1.863405, -0.7354124, 2.368106, 1, 1, 1, 1, 1,
1.873694, 0.714632, 2.558822, 1, 1, 1, 1, 1,
1.881615, 1.592994, -0.5143922, 1, 1, 1, 1, 1,
1.884783, 0.05939979, 0.01801508, 1, 1, 1, 1, 1,
1.933405, 0.583486, 2.246314, 1, 1, 1, 1, 1,
1.982046, 0.9487151, 2.106293, 1, 1, 1, 1, 1,
2.009522, -0.05150163, 3.801323, 1, 1, 1, 1, 1,
2.053508, -0.330889, 1.094479, 0, 0, 1, 1, 1,
2.064603, -3.22436, 3.519326, 1, 0, 0, 1, 1,
2.124497, 0.4134671, -0.1499817, 1, 0, 0, 1, 1,
2.132656, 1.391728, 0.3941474, 1, 0, 0, 1, 1,
2.181592, -0.2675749, 3.39844, 1, 0, 0, 1, 1,
2.206988, 0.6986734, 1.769358, 1, 0, 0, 1, 1,
2.208509, -1.564263, 1.592554, 0, 0, 0, 1, 1,
2.23842, 0.4639367, 1.510605, 0, 0, 0, 1, 1,
2.250721, 2.080405, 1.045902, 0, 0, 0, 1, 1,
2.279974, 1.663058, 0.5878784, 0, 0, 0, 1, 1,
2.292322, 0.4273123, 2.081196, 0, 0, 0, 1, 1,
2.366726, 0.8993573, 0.7578239, 0, 0, 0, 1, 1,
2.458034, 0.4854595, 1.935542, 0, 0, 0, 1, 1,
2.526078, -1.693986, 1.920291, 1, 1, 1, 1, 1,
2.594383, -0.2249712, 1.08416, 1, 1, 1, 1, 1,
2.631554, 0.5959961, 1.042639, 1, 1, 1, 1, 1,
2.674258, 0.007052218, 2.102173, 1, 1, 1, 1, 1,
2.69821, 0.4156336, 2.136738, 1, 1, 1, 1, 1,
2.84499, -2.290759, 3.122097, 1, 1, 1, 1, 1,
3.128518, -0.2245742, 1.230621, 1, 1, 1, 1, 1
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
var radius = 10.56295;
var distance = 37.10193;
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
mvMatrix.translate( 0.113239, 0.1051672, -0.1772592 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.10193);
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
