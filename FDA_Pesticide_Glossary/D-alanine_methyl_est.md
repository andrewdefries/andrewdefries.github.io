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
-3.003663, 0.04402569, -1.727215, 1, 0, 0, 1,
-2.778602, -0.3143742, -1.190749, 1, 0.007843138, 0, 1,
-2.729241, 0.5916517, -1.61774, 1, 0.01176471, 0, 1,
-2.643759, -1.513599, -2.499327, 1, 0.01960784, 0, 1,
-2.580603, -1.311953, -2.069249, 1, 0.02352941, 0, 1,
-2.570877, -1.462322, -1.899436, 1, 0.03137255, 0, 1,
-2.458194, 0.6797485, -0.6895389, 1, 0.03529412, 0, 1,
-2.409259, -1.066291, -3.074911, 1, 0.04313726, 0, 1,
-2.315837, 1.874844, -0.8143013, 1, 0.04705882, 0, 1,
-2.283885, 0.5788057, -1.710319, 1, 0.05490196, 0, 1,
-2.234869, 2.500165, -1.401173, 1, 0.05882353, 0, 1,
-2.223254, 0.2636561, -2.813881, 1, 0.06666667, 0, 1,
-2.194884, -0.7024647, -1.884305, 1, 0.07058824, 0, 1,
-2.186736, -0.2376464, -0.1950961, 1, 0.07843138, 0, 1,
-2.137536, -2.394151, 0.02070306, 1, 0.08235294, 0, 1,
-2.09775, 0.4611416, -2.08252, 1, 0.09019608, 0, 1,
-2.045281, -0.2923561, -1.54188, 1, 0.09411765, 0, 1,
-2.033176, -2.748532, -3.776904, 1, 0.1019608, 0, 1,
-2.029635, 0.5928738, -2.336082, 1, 0.1098039, 0, 1,
-2.025991, -0.03650602, -1.00007, 1, 0.1137255, 0, 1,
-2.02304, 1.719691, -1.262998, 1, 0.1215686, 0, 1,
-1.991689, 1.290708, -1.777648, 1, 0.1254902, 0, 1,
-1.971324, 1.548766, -0.3790078, 1, 0.1333333, 0, 1,
-1.952236, 0.1810882, -1.393816, 1, 0.1372549, 0, 1,
-1.932698, 0.3283356, -2.174757, 1, 0.145098, 0, 1,
-1.931352, 1.316871, -0.4837656, 1, 0.1490196, 0, 1,
-1.926104, -0.845907, -1.410777, 1, 0.1568628, 0, 1,
-1.908594, -0.5573818, -0.6893023, 1, 0.1607843, 0, 1,
-1.903246, -1.309236, -2.845518, 1, 0.1686275, 0, 1,
-1.889697, 0.02772748, -1.517354, 1, 0.172549, 0, 1,
-1.885834, -0.8559347, -1.396659, 1, 0.1803922, 0, 1,
-1.879448, 1.147563, -1.10424, 1, 0.1843137, 0, 1,
-1.877194, 0.3485244, -2.066276, 1, 0.1921569, 0, 1,
-1.869284, -0.1986573, -2.311988, 1, 0.1960784, 0, 1,
-1.847781, 0.6611852, 1.010191, 1, 0.2039216, 0, 1,
-1.846572, -0.7916614, -3.431429, 1, 0.2117647, 0, 1,
-1.83917, 0.01499304, 0.4864833, 1, 0.2156863, 0, 1,
-1.821004, -1.689342, -3.094751, 1, 0.2235294, 0, 1,
-1.814274, -2.401573, -4.160228, 1, 0.227451, 0, 1,
-1.802918, -0.2962096, -2.063637, 1, 0.2352941, 0, 1,
-1.794897, 0.4480304, -1.690768, 1, 0.2392157, 0, 1,
-1.785604, -0.4290446, -2.131841, 1, 0.2470588, 0, 1,
-1.768793, 0.5755966, -0.1842148, 1, 0.2509804, 0, 1,
-1.751089, 0.1024096, -3.793275, 1, 0.2588235, 0, 1,
-1.744298, -0.7000108, -2.542902, 1, 0.2627451, 0, 1,
-1.74425, -1.291244, -2.443484, 1, 0.2705882, 0, 1,
-1.719634, -0.1976482, -0.7044309, 1, 0.2745098, 0, 1,
-1.697142, 1.77263, -0.9518893, 1, 0.282353, 0, 1,
-1.687657, 1.259738, -1.619695, 1, 0.2862745, 0, 1,
-1.679562, -1.346337, -1.897638, 1, 0.2941177, 0, 1,
-1.679017, 1.051196, 0.5368722, 1, 0.3019608, 0, 1,
-1.676281, 1.632627, -3.474357, 1, 0.3058824, 0, 1,
-1.665559, 0.2922285, -2.14091, 1, 0.3137255, 0, 1,
-1.661841, 1.353638, -1.281765, 1, 0.3176471, 0, 1,
-1.623464, -0.002689243, -1.088901, 1, 0.3254902, 0, 1,
-1.622266, -0.7139967, -1.787322, 1, 0.3294118, 0, 1,
-1.621449, -0.9011125, -1.17591, 1, 0.3372549, 0, 1,
-1.582051, -0.4861323, -4.047585, 1, 0.3411765, 0, 1,
-1.581323, -1.38056, -2.474374, 1, 0.3490196, 0, 1,
-1.562786, 0.3122831, -2.129102, 1, 0.3529412, 0, 1,
-1.562229, 0.7546772, 0.3857778, 1, 0.3607843, 0, 1,
-1.537656, 0.8256579, -1.282399, 1, 0.3647059, 0, 1,
-1.531417, 0.4522849, -1.005146, 1, 0.372549, 0, 1,
-1.526139, 0.6247477, -2.580255, 1, 0.3764706, 0, 1,
-1.52562, -0.8451853, -2.038476, 1, 0.3843137, 0, 1,
-1.519672, -0.0668513, -0.2981177, 1, 0.3882353, 0, 1,
-1.511428, 0.6852649, -1.478139, 1, 0.3960784, 0, 1,
-1.481069, -1.743076, -1.720625, 1, 0.4039216, 0, 1,
-1.475127, 0.1591762, -2.322161, 1, 0.4078431, 0, 1,
-1.469431, 0.3973918, -0.555182, 1, 0.4156863, 0, 1,
-1.469351, 0.1392379, -1.360462, 1, 0.4196078, 0, 1,
-1.466173, -1.313728, -1.876538, 1, 0.427451, 0, 1,
-1.460082, -0.3437063, -0.8226213, 1, 0.4313726, 0, 1,
-1.449207, -0.8483926, -3.450722, 1, 0.4392157, 0, 1,
-1.444417, 0.0893949, -0.3817541, 1, 0.4431373, 0, 1,
-1.431326, -1.777871, -3.192287, 1, 0.4509804, 0, 1,
-1.426014, 0.009238309, -0.03742863, 1, 0.454902, 0, 1,
-1.422864, -0.5351585, -2.361216, 1, 0.4627451, 0, 1,
-1.420286, -0.8351808, -2.041371, 1, 0.4666667, 0, 1,
-1.416647, -0.9103631, -1.865412, 1, 0.4745098, 0, 1,
-1.412439, -0.8909147, -2.108099, 1, 0.4784314, 0, 1,
-1.397129, 1.431596, -0.3011604, 1, 0.4862745, 0, 1,
-1.38476, -0.762386, -3.096985, 1, 0.4901961, 0, 1,
-1.383178, -2.28851, -2.736888, 1, 0.4980392, 0, 1,
-1.376932, -1.74222, -1.395211, 1, 0.5058824, 0, 1,
-1.367428, -1.333352, -2.224296, 1, 0.509804, 0, 1,
-1.361102, 0.2731879, -0.8744957, 1, 0.5176471, 0, 1,
-1.360536, -0.05386591, -1.585842, 1, 0.5215687, 0, 1,
-1.353288, 0.04853759, -2.009155, 1, 0.5294118, 0, 1,
-1.3427, 0.52589, -1.237141, 1, 0.5333334, 0, 1,
-1.321371, 1.416712, -1.099031, 1, 0.5411765, 0, 1,
-1.319457, -0.9364077, -1.457711, 1, 0.5450981, 0, 1,
-1.304707, -1.103741, -1.954933, 1, 0.5529412, 0, 1,
-1.301822, 0.5550491, -2.671745, 1, 0.5568628, 0, 1,
-1.297742, 1.211954, -0.06129938, 1, 0.5647059, 0, 1,
-1.288997, 0.5638396, -0.8268136, 1, 0.5686275, 0, 1,
-1.285828, 2.155351, 0.3671677, 1, 0.5764706, 0, 1,
-1.282186, 0.4341156, -0.9789828, 1, 0.5803922, 0, 1,
-1.27371, -0.4957633, -2.233413, 1, 0.5882353, 0, 1,
-1.268119, 1.629971, 0.6521706, 1, 0.5921569, 0, 1,
-1.26243, 0.6538947, -1.308655, 1, 0.6, 0, 1,
-1.253626, -0.4123631, -2.729113, 1, 0.6078432, 0, 1,
-1.241193, -0.0779568, -3.456669, 1, 0.6117647, 0, 1,
-1.231374, 1.511176, -0.08217673, 1, 0.6196079, 0, 1,
-1.2288, 1.591703, -0.5552738, 1, 0.6235294, 0, 1,
-1.223907, 2.057492, 1.054239, 1, 0.6313726, 0, 1,
-1.223017, -1.06967, -2.022616, 1, 0.6352941, 0, 1,
-1.211019, -0.389636, -1.660737, 1, 0.6431373, 0, 1,
-1.210465, -0.03368376, -1.833249, 1, 0.6470588, 0, 1,
-1.204031, 2.068295, 1.277565, 1, 0.654902, 0, 1,
-1.187971, 1.972471, -2.958225, 1, 0.6588235, 0, 1,
-1.18603, 0.8125622, 0.06012093, 1, 0.6666667, 0, 1,
-1.182126, -2.939212, -1.51384, 1, 0.6705883, 0, 1,
-1.175291, 0.7781993, -0.5709895, 1, 0.6784314, 0, 1,
-1.169188, 0.92002, -1.311321, 1, 0.682353, 0, 1,
-1.168698, 0.5599132, -2.568615, 1, 0.6901961, 0, 1,
-1.168188, -0.1003109, -1.38195, 1, 0.6941177, 0, 1,
-1.164636, 1.324303, -0.1970162, 1, 0.7019608, 0, 1,
-1.161822, 1.069936, -2.350066, 1, 0.7098039, 0, 1,
-1.159752, -0.2421964, -2.121979, 1, 0.7137255, 0, 1,
-1.155092, -1.485465, -1.123148, 1, 0.7215686, 0, 1,
-1.154284, -1.13123, -1.635641, 1, 0.7254902, 0, 1,
-1.153211, 0.6218351, -0.822057, 1, 0.7333333, 0, 1,
-1.150437, 1.74371, -1.375733, 1, 0.7372549, 0, 1,
-1.148414, -0.5424864, -2.80585, 1, 0.7450981, 0, 1,
-1.130575, -0.3399552, -1.175769, 1, 0.7490196, 0, 1,
-1.128439, 0.1486264, -0.1616403, 1, 0.7568628, 0, 1,
-1.126968, 0.5695931, -3.21548, 1, 0.7607843, 0, 1,
-1.126939, 0.4200683, -0.5858052, 1, 0.7686275, 0, 1,
-1.124146, 0.8616107, -1.832152, 1, 0.772549, 0, 1,
-1.123055, 1.514398, 0.2069468, 1, 0.7803922, 0, 1,
-1.122429, -0.03129903, -1.206785, 1, 0.7843137, 0, 1,
-1.108884, -0.4046559, -1.057906, 1, 0.7921569, 0, 1,
-1.107951, -0.8897475, -3.083625, 1, 0.7960784, 0, 1,
-1.105044, 0.1100667, -2.439591, 1, 0.8039216, 0, 1,
-1.102688, -0.4067223, -1.989355, 1, 0.8117647, 0, 1,
-1.096566, 0.002463837, -1.190649, 1, 0.8156863, 0, 1,
-1.087265, 0.4189939, -2.695263, 1, 0.8235294, 0, 1,
-1.079063, -0.6204784, -3.158919, 1, 0.827451, 0, 1,
-1.076768, -0.7721376, -1.311642, 1, 0.8352941, 0, 1,
-1.073646, -1.06752, -1.652402, 1, 0.8392157, 0, 1,
-1.054431, 1.27697, -0.6727527, 1, 0.8470588, 0, 1,
-1.053117, 1.946421, -1.173962, 1, 0.8509804, 0, 1,
-1.044995, -0.5630231, -2.072674, 1, 0.8588235, 0, 1,
-1.040713, 1.852041, -0.1785168, 1, 0.8627451, 0, 1,
-1.039637, -0.3564635, -2.262342, 1, 0.8705882, 0, 1,
-1.038873, -0.1510818, -1.124821, 1, 0.8745098, 0, 1,
-1.036503, -0.1167918, -0.9399791, 1, 0.8823529, 0, 1,
-1.034289, -1.214632, -1.827899, 1, 0.8862745, 0, 1,
-1.028228, -1.099097, -1.71482, 1, 0.8941177, 0, 1,
-1.02308, -0.1611059, -0.8655015, 1, 0.8980392, 0, 1,
-1.020964, 0.7327237, 0.2084716, 1, 0.9058824, 0, 1,
-1.012476, -0.1575381, -0.5679128, 1, 0.9137255, 0, 1,
-1.006413, -0.6273636, -2.29729, 1, 0.9176471, 0, 1,
-0.9988309, -0.7067376, -2.162476, 1, 0.9254902, 0, 1,
-0.9972488, -1.301932, -1.199239, 1, 0.9294118, 0, 1,
-0.9904562, 0.6606714, -1.468129, 1, 0.9372549, 0, 1,
-0.9809104, -0.7533622, -2.414633, 1, 0.9411765, 0, 1,
-0.9800341, 0.8875473, -1.330547, 1, 0.9490196, 0, 1,
-0.9785931, -0.2723057, -1.021984, 1, 0.9529412, 0, 1,
-0.9766496, 1.495965, -1.768636, 1, 0.9607843, 0, 1,
-0.9706804, -0.2915411, -1.28769, 1, 0.9647059, 0, 1,
-0.9665686, 1.295358, -1.103767, 1, 0.972549, 0, 1,
-0.9643721, 1.001545, -0.1582939, 1, 0.9764706, 0, 1,
-0.9639302, -1.45515, -3.199344, 1, 0.9843137, 0, 1,
-0.9619222, 1.351683, -0.9804458, 1, 0.9882353, 0, 1,
-0.9548703, 1.077416, 0.6954026, 1, 0.9960784, 0, 1,
-0.9521129, -0.8589932, -1.851669, 0.9960784, 1, 0, 1,
-0.9502133, -0.5309416, -4.043599, 0.9921569, 1, 0, 1,
-0.9444486, -1.174098, -2.837707, 0.9843137, 1, 0, 1,
-0.943805, 2.169576, -0.8821536, 0.9803922, 1, 0, 1,
-0.9424543, -0.3456719, -3.029773, 0.972549, 1, 0, 1,
-0.9354978, -0.2750068, -0.2887765, 0.9686275, 1, 0, 1,
-0.9253782, -0.4859048, -1.506315, 0.9607843, 1, 0, 1,
-0.922384, -1.022846, -4.442721, 0.9568627, 1, 0, 1,
-0.9173469, -0.65233, -2.506027, 0.9490196, 1, 0, 1,
-0.9141693, -0.7905238, -2.176072, 0.945098, 1, 0, 1,
-0.902607, -1.325554, -2.075191, 0.9372549, 1, 0, 1,
-0.8991315, -1.263086, -4.155927, 0.9333333, 1, 0, 1,
-0.8981308, 0.7931346, 0.6253332, 0.9254902, 1, 0, 1,
-0.8889291, 0.4915842, -1.151491, 0.9215686, 1, 0, 1,
-0.883396, 2.208092, 0.03628518, 0.9137255, 1, 0, 1,
-0.8817893, -1.065729, -0.4961097, 0.9098039, 1, 0, 1,
-0.8760354, -0.36259, -0.7596565, 0.9019608, 1, 0, 1,
-0.8747021, 0.8916346, -0.5258179, 0.8941177, 1, 0, 1,
-0.8740029, -0.2136919, -1.368147, 0.8901961, 1, 0, 1,
-0.8733202, -0.07992665, -0.5359869, 0.8823529, 1, 0, 1,
-0.8531801, 0.06291593, 0.3567527, 0.8784314, 1, 0, 1,
-0.8388618, -0.9666451, -2.872689, 0.8705882, 1, 0, 1,
-0.8383009, -2.058056, -2.586777, 0.8666667, 1, 0, 1,
-0.8355583, -0.6979667, -3.309331, 0.8588235, 1, 0, 1,
-0.8354281, -0.9602972, -4.094984, 0.854902, 1, 0, 1,
-0.8330199, -0.3938585, -1.04605, 0.8470588, 1, 0, 1,
-0.8301349, -0.3248192, -2.779803, 0.8431373, 1, 0, 1,
-0.8264039, -0.1863429, -2.040406, 0.8352941, 1, 0, 1,
-0.8227799, 0.5845224, -3.603216, 0.8313726, 1, 0, 1,
-0.8215494, 1.209447, 1.357378, 0.8235294, 1, 0, 1,
-0.8152764, 1.386506, -1.017852, 0.8196079, 1, 0, 1,
-0.8134047, 1.921149, -0.06316559, 0.8117647, 1, 0, 1,
-0.8110213, 1.268116, -1.08154, 0.8078431, 1, 0, 1,
-0.8092688, 0.4073742, -2.438063, 0.8, 1, 0, 1,
-0.8079875, -0.5551786, -2.387995, 0.7921569, 1, 0, 1,
-0.8046906, -0.2054266, -0.970723, 0.7882353, 1, 0, 1,
-0.8015352, 0.1721126, -0.9246652, 0.7803922, 1, 0, 1,
-0.8008527, 0.6609514, -1.242488, 0.7764706, 1, 0, 1,
-0.797338, -0.1493575, -0.8666827, 0.7686275, 1, 0, 1,
-0.7884542, -1.082816, -3.049752, 0.7647059, 1, 0, 1,
-0.7839006, 0.001456345, -2.373514, 0.7568628, 1, 0, 1,
-0.77265, -0.2416126, -0.006212375, 0.7529412, 1, 0, 1,
-0.7712906, 1.215102, 1.13883, 0.7450981, 1, 0, 1,
-0.7704563, -0.4925266, -2.826871, 0.7411765, 1, 0, 1,
-0.7702738, 1.762812, -1.256513, 0.7333333, 1, 0, 1,
-0.7701318, -0.5841137, -2.98194, 0.7294118, 1, 0, 1,
-0.7635507, 0.7529669, 0.2028022, 0.7215686, 1, 0, 1,
-0.7626252, -0.1924362, -0.6788095, 0.7176471, 1, 0, 1,
-0.7610399, -0.3653102, -3.650272, 0.7098039, 1, 0, 1,
-0.754761, -0.978859, -0.850497, 0.7058824, 1, 0, 1,
-0.7542309, 0.192332, -0.0360222, 0.6980392, 1, 0, 1,
-0.7521083, -0.959917, -2.608984, 0.6901961, 1, 0, 1,
-0.7518736, 0.8544469, -1.095862, 0.6862745, 1, 0, 1,
-0.7510616, 1.084808, -1.680349, 0.6784314, 1, 0, 1,
-0.7445784, -0.6597273, -2.097254, 0.6745098, 1, 0, 1,
-0.7412248, -1.378, -3.918324, 0.6666667, 1, 0, 1,
-0.7401963, 1.531939, -1.499854, 0.6627451, 1, 0, 1,
-0.736226, 0.9350249, 1.218999, 0.654902, 1, 0, 1,
-0.735086, -1.032425, -0.7830549, 0.6509804, 1, 0, 1,
-0.7267537, 0.7935491, -1.130008, 0.6431373, 1, 0, 1,
-0.7247615, 0.4910237, -0.6057463, 0.6392157, 1, 0, 1,
-0.7215688, -0.611159, -2.521059, 0.6313726, 1, 0, 1,
-0.7208041, 0.6862077, -0.2170486, 0.627451, 1, 0, 1,
-0.7175246, -0.6957729, -0.2526042, 0.6196079, 1, 0, 1,
-0.7126151, -0.8622154, -3.90517, 0.6156863, 1, 0, 1,
-0.7098989, 0.03909958, -0.5787311, 0.6078432, 1, 0, 1,
-0.7065596, 1.833043, -0.8336729, 0.6039216, 1, 0, 1,
-0.7021413, 0.6915361, -0.4330874, 0.5960785, 1, 0, 1,
-0.7011999, 1.050228, -1.410176, 0.5882353, 1, 0, 1,
-0.7010511, 0.7075731, 0.390805, 0.5843138, 1, 0, 1,
-0.6891039, -0.8180563, -1.667108, 0.5764706, 1, 0, 1,
-0.6867324, -0.3773486, -4.010181, 0.572549, 1, 0, 1,
-0.686297, 0.02445973, -1.446232, 0.5647059, 1, 0, 1,
-0.6695962, -1.345919, -2.529741, 0.5607843, 1, 0, 1,
-0.6691623, 2.052207, -0.4064414, 0.5529412, 1, 0, 1,
-0.6687555, -0.02431815, -0.4208416, 0.5490196, 1, 0, 1,
-0.6594049, 0.395888, 0.3321274, 0.5411765, 1, 0, 1,
-0.6587868, 0.2537423, -1.134464, 0.5372549, 1, 0, 1,
-0.6569455, 1.06265, 0.9341387, 0.5294118, 1, 0, 1,
-0.65661, -1.849517, -3.56255, 0.5254902, 1, 0, 1,
-0.6566092, -0.3559918, -0.8113197, 0.5176471, 1, 0, 1,
-0.6522956, -0.189227, -1.622896, 0.5137255, 1, 0, 1,
-0.6522773, -0.2028996, -2.601543, 0.5058824, 1, 0, 1,
-0.6454754, -0.6001246, -1.986933, 0.5019608, 1, 0, 1,
-0.6440488, -0.6673145, -2.375675, 0.4941176, 1, 0, 1,
-0.6406488, -0.1153321, -2.551214, 0.4862745, 1, 0, 1,
-0.6377284, 1.157124, 0.5754189, 0.4823529, 1, 0, 1,
-0.6359124, 1.927724, -1.005971, 0.4745098, 1, 0, 1,
-0.6357116, -0.07272116, -2.88964, 0.4705882, 1, 0, 1,
-0.633058, -1.147854, -2.198539, 0.4627451, 1, 0, 1,
-0.6282983, -0.03743189, -2.958235, 0.4588235, 1, 0, 1,
-0.6233275, 2.092141, -1.379283, 0.4509804, 1, 0, 1,
-0.6230572, 0.01521189, -3.091576, 0.4470588, 1, 0, 1,
-0.6189352, 0.4518323, -0.8259516, 0.4392157, 1, 0, 1,
-0.6170756, -0.6715195, -3.291632, 0.4352941, 1, 0, 1,
-0.6163197, -0.1524451, -3.05273, 0.427451, 1, 0, 1,
-0.6131957, 0.9463924, -0.9394846, 0.4235294, 1, 0, 1,
-0.6121674, -1.015912, -3.470141, 0.4156863, 1, 0, 1,
-0.6119472, -1.208195, -0.03746223, 0.4117647, 1, 0, 1,
-0.6104972, -0.4632735, -1.203106, 0.4039216, 1, 0, 1,
-0.6059004, -1.000365, -2.246053, 0.3960784, 1, 0, 1,
-0.602749, -0.6590184, -3.381007, 0.3921569, 1, 0, 1,
-0.5987595, -0.4577273, -0.4072243, 0.3843137, 1, 0, 1,
-0.5976898, -0.8858513, -2.868417, 0.3803922, 1, 0, 1,
-0.5976117, 0.9452547, -0.5265517, 0.372549, 1, 0, 1,
-0.5901247, -0.1520369, -1.957089, 0.3686275, 1, 0, 1,
-0.5899782, -0.4057207, -1.429978, 0.3607843, 1, 0, 1,
-0.5860489, -1.039279, -3.319032, 0.3568628, 1, 0, 1,
-0.5852088, -0.6853549, -2.110972, 0.3490196, 1, 0, 1,
-0.5843936, -0.3575889, -0.3788943, 0.345098, 1, 0, 1,
-0.5808823, -1.237626, -4.172671, 0.3372549, 1, 0, 1,
-0.5788977, -0.2800575, -2.441499, 0.3333333, 1, 0, 1,
-0.5779523, -0.8903795, -2.857381, 0.3254902, 1, 0, 1,
-0.5768136, 0.9572999, -0.2866815, 0.3215686, 1, 0, 1,
-0.5736063, -0.5129002, -2.166735, 0.3137255, 1, 0, 1,
-0.5658036, -1.301915, -3.589278, 0.3098039, 1, 0, 1,
-0.5627378, -0.8561048, -2.491371, 0.3019608, 1, 0, 1,
-0.5562531, 0.4031891, -1.85316, 0.2941177, 1, 0, 1,
-0.5534875, 0.03974705, -3.234325, 0.2901961, 1, 0, 1,
-0.5440605, -0.09776725, -1.617187, 0.282353, 1, 0, 1,
-0.5433526, 1.331502, -1.419889, 0.2784314, 1, 0, 1,
-0.5408629, 0.003186959, -2.176408, 0.2705882, 1, 0, 1,
-0.5361246, 2.139742, -0.4748071, 0.2666667, 1, 0, 1,
-0.5312523, -1.754562, -3.410549, 0.2588235, 1, 0, 1,
-0.5308651, -0.3513686, -2.144962, 0.254902, 1, 0, 1,
-0.5284752, -0.5880464, -3.328551, 0.2470588, 1, 0, 1,
-0.5279595, -0.4936182, -1.71319, 0.2431373, 1, 0, 1,
-0.5227569, 2.43067, -1.654743, 0.2352941, 1, 0, 1,
-0.5172946, 1.803566, -1.674196, 0.2313726, 1, 0, 1,
-0.5159429, -0.9346986, -2.219527, 0.2235294, 1, 0, 1,
-0.510758, -0.1938958, -1.820321, 0.2196078, 1, 0, 1,
-0.5099983, -0.5135075, -1.204633, 0.2117647, 1, 0, 1,
-0.5081415, -1.175972, -3.45239, 0.2078431, 1, 0, 1,
-0.5067154, 0.4038843, -2.68181, 0.2, 1, 0, 1,
-0.5053453, -1.387421, -2.583931, 0.1921569, 1, 0, 1,
-0.5023754, 2.214438, 0.3454016, 0.1882353, 1, 0, 1,
-0.5022787, 0.9622216, -1.092223, 0.1803922, 1, 0, 1,
-0.4987706, -0.8258536, -3.710712, 0.1764706, 1, 0, 1,
-0.493806, 0.1701023, -2.323861, 0.1686275, 1, 0, 1,
-0.4927374, -0.1983945, -1.535371, 0.1647059, 1, 0, 1,
-0.4898973, -0.7074348, -2.488008, 0.1568628, 1, 0, 1,
-0.4866018, 0.2428648, -0.02881229, 0.1529412, 1, 0, 1,
-0.4818712, 1.452215, 0.5796126, 0.145098, 1, 0, 1,
-0.4795262, 0.3534717, -1.666339, 0.1411765, 1, 0, 1,
-0.4787437, 0.1360136, -1.785254, 0.1333333, 1, 0, 1,
-0.4762255, -1.711404, -3.502923, 0.1294118, 1, 0, 1,
-0.47356, 1.084677, 0.9646161, 0.1215686, 1, 0, 1,
-0.472914, 0.7700661, -0.8327895, 0.1176471, 1, 0, 1,
-0.4602737, 0.9726228, -0.07600239, 0.1098039, 1, 0, 1,
-0.4591838, -1.649888, -2.393641, 0.1058824, 1, 0, 1,
-0.4589855, 0.0325437, -1.824352, 0.09803922, 1, 0, 1,
-0.4581716, 0.1395669, -1.218322, 0.09019608, 1, 0, 1,
-0.4564247, -2.151155, -4.458978, 0.08627451, 1, 0, 1,
-0.4531387, -0.8351297, -4.348763, 0.07843138, 1, 0, 1,
-0.4485079, 0.9798527, -0.05110193, 0.07450981, 1, 0, 1,
-0.4483635, 0.611153, -3.265142, 0.06666667, 1, 0, 1,
-0.4478461, -1.046512, -4.647986, 0.0627451, 1, 0, 1,
-0.4434693, -1.07821, -2.719077, 0.05490196, 1, 0, 1,
-0.4346379, -0.3813087, -1.861732, 0.05098039, 1, 0, 1,
-0.4282324, -0.2339513, -2.684705, 0.04313726, 1, 0, 1,
-0.4264409, -1.549581, -3.23876, 0.03921569, 1, 0, 1,
-0.4243501, -0.6728767, -2.369365, 0.03137255, 1, 0, 1,
-0.4230905, 1.460825, 1.372572, 0.02745098, 1, 0, 1,
-0.421699, -0.66104, -3.547666, 0.01960784, 1, 0, 1,
-0.4181581, 0.7435333, 1.107903, 0.01568628, 1, 0, 1,
-0.4176476, -0.1690075, -1.223955, 0.007843138, 1, 0, 1,
-0.4146642, -1.027736, -1.702045, 0.003921569, 1, 0, 1,
-0.4119161, -0.426186, -2.241491, 0, 1, 0.003921569, 1,
-0.4116607, 0.9073622, -0.8056167, 0, 1, 0.01176471, 1,
-0.4095608, 1.991266, 0.6480386, 0, 1, 0.01568628, 1,
-0.4091934, -0.1047169, -1.073559, 0, 1, 0.02352941, 1,
-0.4085381, -1.00903, -1.469242, 0, 1, 0.02745098, 1,
-0.4054542, -0.7147135, -1.577488, 0, 1, 0.03529412, 1,
-0.4041384, 1.184763, 1.156475, 0, 1, 0.03921569, 1,
-0.4024045, -1.445164, -0.6773981, 0, 1, 0.04705882, 1,
-0.3954182, -0.4916843, -1.48674, 0, 1, 0.05098039, 1,
-0.3908199, -0.8807107, -0.7188067, 0, 1, 0.05882353, 1,
-0.3847987, 1.205365, -2.076399, 0, 1, 0.0627451, 1,
-0.3813906, 0.8998182, -1.608913, 0, 1, 0.07058824, 1,
-0.3804962, -1.182391, -1.495505, 0, 1, 0.07450981, 1,
-0.3804186, 0.815843, -0.7919667, 0, 1, 0.08235294, 1,
-0.3791114, -0.7291702, -2.721041, 0, 1, 0.08627451, 1,
-0.3715242, -1.839266, -4.817883, 0, 1, 0.09411765, 1,
-0.3706273, -0.1742216, -0.9693946, 0, 1, 0.1019608, 1,
-0.3656017, 2.204829, -0.9408621, 0, 1, 0.1058824, 1,
-0.3641359, -0.5090123, -1.033734, 0, 1, 0.1137255, 1,
-0.3608477, -0.3070898, -3.788187, 0, 1, 0.1176471, 1,
-0.3583241, -0.05875312, -1.151944, 0, 1, 0.1254902, 1,
-0.3577261, 0.1991773, -0.5590485, 0, 1, 0.1294118, 1,
-0.3520602, 0.6561389, 1.317487, 0, 1, 0.1372549, 1,
-0.3472151, -1.266636, -2.657847, 0, 1, 0.1411765, 1,
-0.3460484, 0.8549737, 0.1827796, 0, 1, 0.1490196, 1,
-0.3398535, -1.105077, -2.57228, 0, 1, 0.1529412, 1,
-0.3372155, -0.6135554, -2.67708, 0, 1, 0.1607843, 1,
-0.3361848, -0.1152962, -3.290817, 0, 1, 0.1647059, 1,
-0.3342521, 1.203619, 1.615338, 0, 1, 0.172549, 1,
-0.3332644, 1.516928, -0.3860097, 0, 1, 0.1764706, 1,
-0.3220261, -0.4521426, -2.732507, 0, 1, 0.1843137, 1,
-0.3175148, 0.9460701, 0.01810444, 0, 1, 0.1882353, 1,
-0.3167928, -0.5463501, -2.777813, 0, 1, 0.1960784, 1,
-0.3149436, 0.4857873, -0.9692684, 0, 1, 0.2039216, 1,
-0.3130641, 0.3715951, -1.532264, 0, 1, 0.2078431, 1,
-0.3129314, 0.9519259, -1.294771, 0, 1, 0.2156863, 1,
-0.3057211, 1.16167, 0.6429183, 0, 1, 0.2196078, 1,
-0.3055913, 0.006722767, 0.4274333, 0, 1, 0.227451, 1,
-0.3042402, 0.02576953, -2.225222, 0, 1, 0.2313726, 1,
-0.3037843, 1.106219, 0.6827736, 0, 1, 0.2392157, 1,
-0.3027133, 0.3191807, 0.4776749, 0, 1, 0.2431373, 1,
-0.3020387, -0.5651635, -1.745818, 0, 1, 0.2509804, 1,
-0.2976675, 0.7123783, -0.08339403, 0, 1, 0.254902, 1,
-0.2940149, -0.7478914, -2.886476, 0, 1, 0.2627451, 1,
-0.2939994, -0.01849883, -3.01158, 0, 1, 0.2666667, 1,
-0.2937377, -0.7403066, -3.469877, 0, 1, 0.2745098, 1,
-0.2861633, 1.044335, 0.8615702, 0, 1, 0.2784314, 1,
-0.2861323, -0.2407274, -2.482647, 0, 1, 0.2862745, 1,
-0.2829374, 1.370005, -1.38708, 0, 1, 0.2901961, 1,
-0.273078, 0.8422898, -1.517436, 0, 1, 0.2980392, 1,
-0.272455, -1.591888, -1.264948, 0, 1, 0.3058824, 1,
-0.2722506, 0.7298399, -0.001233804, 0, 1, 0.3098039, 1,
-0.2695952, 2.93314, -0.4742266, 0, 1, 0.3176471, 1,
-0.2685389, -0.3076319, -2.145664, 0, 1, 0.3215686, 1,
-0.2665626, 0.1025331, -1.005692, 0, 1, 0.3294118, 1,
-0.2630602, 0.6511563, -0.03722842, 0, 1, 0.3333333, 1,
-0.260316, 0.6717078, -0.6685807, 0, 1, 0.3411765, 1,
-0.25928, -0.1769061, -1.809802, 0, 1, 0.345098, 1,
-0.2549126, -1.051839, -2.000102, 0, 1, 0.3529412, 1,
-0.2537477, -1.240682, -3.551136, 0, 1, 0.3568628, 1,
-0.2473725, 0.9314908, -1.520561, 0, 1, 0.3647059, 1,
-0.2416803, 0.7404534, -1.486699, 0, 1, 0.3686275, 1,
-0.2351521, -0.5190509, -4.037766, 0, 1, 0.3764706, 1,
-0.2299599, -0.1997232, -2.910938, 0, 1, 0.3803922, 1,
-0.2292889, -0.8581337, -1.6461, 0, 1, 0.3882353, 1,
-0.2284502, 1.859972, 1.500832, 0, 1, 0.3921569, 1,
-0.2273204, 0.5192147, 0.2913632, 0, 1, 0.4, 1,
-0.2224381, 1.175935, 0.8918971, 0, 1, 0.4078431, 1,
-0.2223805, 1.001597, 1.213265, 0, 1, 0.4117647, 1,
-0.2216796, -0.4252343, -0.8056675, 0, 1, 0.4196078, 1,
-0.2215563, -1.33856, -4.241956, 0, 1, 0.4235294, 1,
-0.2185996, -0.7048656, -4.500154, 0, 1, 0.4313726, 1,
-0.2161594, -0.03609098, -2.827566, 0, 1, 0.4352941, 1,
-0.2158492, -0.6286002, -4.814914, 0, 1, 0.4431373, 1,
-0.2143053, 0.6259184, 0.4088128, 0, 1, 0.4470588, 1,
-0.214099, -1.002046, -4.954406, 0, 1, 0.454902, 1,
-0.2106512, -1.568806, -2.958792, 0, 1, 0.4588235, 1,
-0.2090897, 0.9224824, -0.7587312, 0, 1, 0.4666667, 1,
-0.2056329, 0.3320417, -1.208388, 0, 1, 0.4705882, 1,
-0.2029002, -0.1161008, -1.459924, 0, 1, 0.4784314, 1,
-0.2015956, 0.06326112, -2.023524, 0, 1, 0.4823529, 1,
-0.2006929, 0.4687346, -1.293292, 0, 1, 0.4901961, 1,
-0.1999188, -0.2114287, -4.019328, 0, 1, 0.4941176, 1,
-0.1950872, 0.1753585, -1.080394, 0, 1, 0.5019608, 1,
-0.1945398, 0.4466006, 0.4159273, 0, 1, 0.509804, 1,
-0.1939839, -0.7779857, -4.499309, 0, 1, 0.5137255, 1,
-0.189878, -1.801947, -1.604507, 0, 1, 0.5215687, 1,
-0.1827447, -0.7390088, -3.181585, 0, 1, 0.5254902, 1,
-0.1804621, 0.5657836, -0.0336054, 0, 1, 0.5333334, 1,
-0.1803253, -1.227416, -2.851234, 0, 1, 0.5372549, 1,
-0.176515, -0.957938, -2.444509, 0, 1, 0.5450981, 1,
-0.1744309, -0.2128455, -1.565655, 0, 1, 0.5490196, 1,
-0.1727594, -0.1835252, -2.036259, 0, 1, 0.5568628, 1,
-0.1679017, -1.468353, -0.984019, 0, 1, 0.5607843, 1,
-0.1656186, 0.102931, -1.156032, 0, 1, 0.5686275, 1,
-0.1655378, -0.6612165, -1.545524, 0, 1, 0.572549, 1,
-0.1635976, -1.548022, -1.662693, 0, 1, 0.5803922, 1,
-0.1628338, 1.450545, 0.5650451, 0, 1, 0.5843138, 1,
-0.161513, 0.09062483, -1.353842, 0, 1, 0.5921569, 1,
-0.1594067, -0.8456881, -2.546421, 0, 1, 0.5960785, 1,
-0.1582909, -1.005186, -2.142012, 0, 1, 0.6039216, 1,
-0.1568152, -0.2237221, -3.732293, 0, 1, 0.6117647, 1,
-0.1527032, -0.2255729, -3.039708, 0, 1, 0.6156863, 1,
-0.1521061, 0.002809592, -2.216655, 0, 1, 0.6235294, 1,
-0.1482391, -0.3049549, -2.604243, 0, 1, 0.627451, 1,
-0.1456643, 0.1744234, -2.617438, 0, 1, 0.6352941, 1,
-0.1452826, 0.3493971, -0.5309823, 0, 1, 0.6392157, 1,
-0.1448144, -0.3409358, -2.888268, 0, 1, 0.6470588, 1,
-0.1445439, -0.3517971, -2.328036, 0, 1, 0.6509804, 1,
-0.1411428, 0.6973333, 0.6283332, 0, 1, 0.6588235, 1,
-0.1400165, -0.2241329, -1.558721, 0, 1, 0.6627451, 1,
-0.1378327, 0.4855572, 0.09960204, 0, 1, 0.6705883, 1,
-0.1282038, -0.2233178, -3.087029, 0, 1, 0.6745098, 1,
-0.127678, 1.54715, 0.08917045, 0, 1, 0.682353, 1,
-0.1273622, -1.851213, -3.737395, 0, 1, 0.6862745, 1,
-0.1268827, 0.4067563, -0.3090875, 0, 1, 0.6941177, 1,
-0.1227213, 0.4640976, -0.3103461, 0, 1, 0.7019608, 1,
-0.1225546, 1.464722, -0.8986604, 0, 1, 0.7058824, 1,
-0.1220682, 1.519418, 0.04230552, 0, 1, 0.7137255, 1,
-0.1164059, 1.456867, 1.8328, 0, 1, 0.7176471, 1,
-0.114182, 0.626894, -1.774501, 0, 1, 0.7254902, 1,
-0.112556, 0.05405009, -2.185346, 0, 1, 0.7294118, 1,
-0.1120412, 0.1760275, -1.433812, 0, 1, 0.7372549, 1,
-0.1068337, -0.05333666, -2.530189, 0, 1, 0.7411765, 1,
-0.1062794, 1.056814, 2.323562, 0, 1, 0.7490196, 1,
-0.09971061, -0.6481693, -3.078856, 0, 1, 0.7529412, 1,
-0.0995775, 1.425219, 0.352083, 0, 1, 0.7607843, 1,
-0.09878002, -0.1586532, -1.280025, 0, 1, 0.7647059, 1,
-0.09754008, -0.3658573, -3.951399, 0, 1, 0.772549, 1,
-0.09310517, 1.453958, -0.8009436, 0, 1, 0.7764706, 1,
-0.09269118, -1.757549, -4.682621, 0, 1, 0.7843137, 1,
-0.09030413, 1.714703, -0.1569177, 0, 1, 0.7882353, 1,
-0.08951046, -0.05223462, -1.539051, 0, 1, 0.7960784, 1,
-0.08917705, 0.5287122, -0.6508563, 0, 1, 0.8039216, 1,
-0.08779731, 1.388459, -0.1258246, 0, 1, 0.8078431, 1,
-0.08498368, -0.4190129, -1.705392, 0, 1, 0.8156863, 1,
-0.07877212, 1.204334, -1.911224, 0, 1, 0.8196079, 1,
-0.07606331, 1.816405, 0.5786309, 0, 1, 0.827451, 1,
-0.07556311, 0.7760295, -1.828089, 0, 1, 0.8313726, 1,
-0.0742218, -0.1194032, -1.544796, 0, 1, 0.8392157, 1,
-0.07041537, 0.2042451, -1.789055, 0, 1, 0.8431373, 1,
-0.0700818, 1.254253, -0.8120375, 0, 1, 0.8509804, 1,
-0.0691692, -0.7989301, -3.574877, 0, 1, 0.854902, 1,
-0.06868494, 0.3917079, 0.9702539, 0, 1, 0.8627451, 1,
-0.06484265, -2.089114, -0.7189639, 0, 1, 0.8666667, 1,
-0.06159073, 1.043418, -1.030013, 0, 1, 0.8745098, 1,
-0.0601167, -1.852456, -2.764413, 0, 1, 0.8784314, 1,
-0.05965469, -2.267502, -2.60275, 0, 1, 0.8862745, 1,
-0.05702245, 1.301916, -0.6460202, 0, 1, 0.8901961, 1,
-0.05261385, 2.078671, 2.328002, 0, 1, 0.8980392, 1,
-0.04645527, -1.581596, -6.105251, 0, 1, 0.9058824, 1,
-0.04564733, -1.636401, -2.364268, 0, 1, 0.9098039, 1,
-0.0420035, 0.48098, -0.2757372, 0, 1, 0.9176471, 1,
-0.04058941, -1.097485, -1.53402, 0, 1, 0.9215686, 1,
-0.04046055, -0.1675589, -3.475564, 0, 1, 0.9294118, 1,
-0.03906885, 1.180779, 2.454776, 0, 1, 0.9333333, 1,
-0.0389029, -1.980598, -2.861583, 0, 1, 0.9411765, 1,
-0.0384073, 1.174655, -0.2122533, 0, 1, 0.945098, 1,
-0.03747915, -0.02173994, -3.463271, 0, 1, 0.9529412, 1,
-0.03493311, -2.564741, -2.77759, 0, 1, 0.9568627, 1,
-0.03416501, -1.533215, -4.738451, 0, 1, 0.9647059, 1,
-0.03257924, 1.51338, -0.2424707, 0, 1, 0.9686275, 1,
-0.03071943, -0.7380784, -2.536413, 0, 1, 0.9764706, 1,
-0.02802546, -0.09376463, -1.163848, 0, 1, 0.9803922, 1,
-0.02598351, 0.2700007, -1.104786, 0, 1, 0.9882353, 1,
-0.02508492, 0.1757759, -1.6, 0, 1, 0.9921569, 1,
-0.02459307, 0.2409106, -1.928009, 0, 1, 1, 1,
-0.01888995, 0.2000989, -0.06248903, 0, 0.9921569, 1, 1,
-0.01008354, -0.9841493, -5.127465, 0, 0.9882353, 1, 1,
-0.009612191, 0.3609499, -0.4809842, 0, 0.9803922, 1, 1,
-0.00843959, -0.7171134, -3.149984, 0, 0.9764706, 1, 1,
-0.003465998, -0.2948028, -2.766614, 0, 0.9686275, 1, 1,
0.003154716, -0.9111204, 3.373808, 0, 0.9647059, 1, 1,
0.003649701, -0.9771653, 3.157685, 0, 0.9568627, 1, 1,
0.004205154, -0.4820654, 4.464026, 0, 0.9529412, 1, 1,
0.005547094, 0.1961724, 1.020592, 0, 0.945098, 1, 1,
0.01037069, -0.3947719, 3.789946, 0, 0.9411765, 1, 1,
0.01221551, 0.5799527, 0.6383349, 0, 0.9333333, 1, 1,
0.01543386, -0.4125917, 3.348098, 0, 0.9294118, 1, 1,
0.01808424, -2.393713, 3.969898, 0, 0.9215686, 1, 1,
0.01937462, -0.4276136, 2.417044, 0, 0.9176471, 1, 1,
0.02094898, -0.02786569, 3.312954, 0, 0.9098039, 1, 1,
0.0237981, -0.8787118, 0.0002772473, 0, 0.9058824, 1, 1,
0.02751375, -0.08394355, 3.368162, 0, 0.8980392, 1, 1,
0.02775619, -1.397062, 2.800732, 0, 0.8901961, 1, 1,
0.02982147, 1.248949, -0.1464847, 0, 0.8862745, 1, 1,
0.034389, -0.5723715, 3.885188, 0, 0.8784314, 1, 1,
0.03543095, -0.7783563, 4.270972, 0, 0.8745098, 1, 1,
0.03559403, 0.234839, -0.1639013, 0, 0.8666667, 1, 1,
0.03660364, 1.254543, -0.4670008, 0, 0.8627451, 1, 1,
0.03681183, 1.209755, -0.524937, 0, 0.854902, 1, 1,
0.03764473, -0.0817794, 3.116087, 0, 0.8509804, 1, 1,
0.03855726, -0.9804718, 3.418406, 0, 0.8431373, 1, 1,
0.04532665, -1.707631, 3.051301, 0, 0.8392157, 1, 1,
0.04554432, 1.171321, -0.4487618, 0, 0.8313726, 1, 1,
0.05107742, 0.7314466, -0.6330836, 0, 0.827451, 1, 1,
0.0512646, -0.8130285, 3.583266, 0, 0.8196079, 1, 1,
0.05232257, 1.5453, -0.5083035, 0, 0.8156863, 1, 1,
0.0548105, -0.975105, 2.709599, 0, 0.8078431, 1, 1,
0.05825216, -0.6219719, 2.942372, 0, 0.8039216, 1, 1,
0.06177137, 0.3453555, -0.4729604, 0, 0.7960784, 1, 1,
0.06489144, 0.02920145, 1.879156, 0, 0.7882353, 1, 1,
0.06584024, 1.039316, -0.1833827, 0, 0.7843137, 1, 1,
0.06688113, 0.3128624, 2.071881, 0, 0.7764706, 1, 1,
0.07141433, 1.25711, 1.342099, 0, 0.772549, 1, 1,
0.07397306, -0.7440835, 3.583937, 0, 0.7647059, 1, 1,
0.0748226, 0.6988938, -1.659716, 0, 0.7607843, 1, 1,
0.07740735, -0.7970207, 3.210664, 0, 0.7529412, 1, 1,
0.07744192, 0.5927345, 1.220195, 0, 0.7490196, 1, 1,
0.08767862, 0.1709252, -0.2131407, 0, 0.7411765, 1, 1,
0.089806, 0.091111, 0.05814752, 0, 0.7372549, 1, 1,
0.09037081, 0.4507554, 0.6235955, 0, 0.7294118, 1, 1,
0.09670992, 0.5568267, -0.3042377, 0, 0.7254902, 1, 1,
0.09864585, 1.849636, 1.546411, 0, 0.7176471, 1, 1,
0.1006781, -0.003609633, 1.974401, 0, 0.7137255, 1, 1,
0.1010845, 1.057106, -1.426199, 0, 0.7058824, 1, 1,
0.1014911, 1.721884, 1.510125, 0, 0.6980392, 1, 1,
0.1015223, -0.502142, 2.567282, 0, 0.6941177, 1, 1,
0.1042651, -1.630346, 3.506033, 0, 0.6862745, 1, 1,
0.1044747, -0.6417929, 2.755072, 0, 0.682353, 1, 1,
0.1107102, 0.1523856, 2.359417, 0, 0.6745098, 1, 1,
0.1107935, 1.601799, 0.8250343, 0, 0.6705883, 1, 1,
0.1118773, -0.4768305, 4.704262, 0, 0.6627451, 1, 1,
0.1158572, 0.5632986, 2.479674, 0, 0.6588235, 1, 1,
0.1203791, 0.6601455, 0.7346244, 0, 0.6509804, 1, 1,
0.1252677, -0.7097463, 4.514646, 0, 0.6470588, 1, 1,
0.129776, 1.488403, 2.296588, 0, 0.6392157, 1, 1,
0.1398736, 1.083946, -0.4102325, 0, 0.6352941, 1, 1,
0.1402071, 0.2168437, 0.6454413, 0, 0.627451, 1, 1,
0.1414259, -0.1713784, 1.732483, 0, 0.6235294, 1, 1,
0.1436649, 1.417381, -0.1418465, 0, 0.6156863, 1, 1,
0.1436878, 0.3181447, 2.16606, 0, 0.6117647, 1, 1,
0.1445599, 0.5774246, 0.02092678, 0, 0.6039216, 1, 1,
0.1450387, -0.7091874, 2.53637, 0, 0.5960785, 1, 1,
0.1452775, 1.428949, 1.073095, 0, 0.5921569, 1, 1,
0.1454311, -0.7070135, 1.967244, 0, 0.5843138, 1, 1,
0.1466011, -0.2598033, 2.045799, 0, 0.5803922, 1, 1,
0.1503297, 1.41369, 0.6711904, 0, 0.572549, 1, 1,
0.1601986, 0.5233159, -0.5674454, 0, 0.5686275, 1, 1,
0.1611236, 1.362743, 0.7043051, 0, 0.5607843, 1, 1,
0.1618297, 0.9861176, -2.321926, 0, 0.5568628, 1, 1,
0.1658242, -0.3893372, 2.393537, 0, 0.5490196, 1, 1,
0.168593, -0.9038787, 2.719783, 0, 0.5450981, 1, 1,
0.1717792, 0.6379042, 1.199368, 0, 0.5372549, 1, 1,
0.172762, 2.054887, 0.4865943, 0, 0.5333334, 1, 1,
0.1755122, 0.1515711, 1.293245, 0, 0.5254902, 1, 1,
0.1795604, 0.8123598, -0.8633858, 0, 0.5215687, 1, 1,
0.183493, -1.908811, 3.223622, 0, 0.5137255, 1, 1,
0.1856547, 2.080266, 2.210689, 0, 0.509804, 1, 1,
0.1905529, 0.001095554, 0.2257639, 0, 0.5019608, 1, 1,
0.1910143, 0.4424273, -0.9239379, 0, 0.4941176, 1, 1,
0.1920364, 0.3394241, -0.3829885, 0, 0.4901961, 1, 1,
0.1929747, -0.9126614, 0.7501852, 0, 0.4823529, 1, 1,
0.1975079, -0.6998932, 2.925797, 0, 0.4784314, 1, 1,
0.2041003, -1.74648, 3.253523, 0, 0.4705882, 1, 1,
0.207463, 0.04910989, 2.102326, 0, 0.4666667, 1, 1,
0.2075252, -0.07481626, 0.4265463, 0, 0.4588235, 1, 1,
0.2118392, 1.239334, 0.9296098, 0, 0.454902, 1, 1,
0.2121578, -0.5233818, 1.845292, 0, 0.4470588, 1, 1,
0.2127271, -1.409405, 1.488252, 0, 0.4431373, 1, 1,
0.2157126, 1.598808, -1.503614, 0, 0.4352941, 1, 1,
0.2201058, -1.192348, 2.479849, 0, 0.4313726, 1, 1,
0.2206734, -0.3501722, 4.127964, 0, 0.4235294, 1, 1,
0.221181, -0.7130072, 3.721341, 0, 0.4196078, 1, 1,
0.2241121, 0.7989469, 1.801648, 0, 0.4117647, 1, 1,
0.2251116, 1.505186, -0.1452486, 0, 0.4078431, 1, 1,
0.2293719, -0.1388383, 2.507634, 0, 0.4, 1, 1,
0.2333046, -0.5653995, 2.027709, 0, 0.3921569, 1, 1,
0.2442168, 0.5143608, 1.521885, 0, 0.3882353, 1, 1,
0.2464392, 0.519033, 0.9935953, 0, 0.3803922, 1, 1,
0.2476759, -0.4209326, 5.175949, 0, 0.3764706, 1, 1,
0.2539646, -1.27284, 4.292615, 0, 0.3686275, 1, 1,
0.2558084, 0.8797185, 0.836095, 0, 0.3647059, 1, 1,
0.2627468, 1.173274, -0.2870442, 0, 0.3568628, 1, 1,
0.2655146, -0.09415416, 1.46631, 0, 0.3529412, 1, 1,
0.2661293, 2.136586, -0.9395546, 0, 0.345098, 1, 1,
0.2687481, -1.481812, 4.20784, 0, 0.3411765, 1, 1,
0.270178, 1.422748, 0.09608342, 0, 0.3333333, 1, 1,
0.2714087, 0.5189266, 1.576056, 0, 0.3294118, 1, 1,
0.2736118, 2.147438, 0.4681137, 0, 0.3215686, 1, 1,
0.2758605, -0.4810271, 2.607054, 0, 0.3176471, 1, 1,
0.2766558, -0.1138868, 1.31887, 0, 0.3098039, 1, 1,
0.27841, -3.265388, 3.904764, 0, 0.3058824, 1, 1,
0.2788311, 0.3922706, 1.124101, 0, 0.2980392, 1, 1,
0.2855689, 2.214061, -0.8845108, 0, 0.2901961, 1, 1,
0.2883642, -0.6811984, 2.708482, 0, 0.2862745, 1, 1,
0.2905054, -0.9761738, 3.346151, 0, 0.2784314, 1, 1,
0.2916572, -0.1504686, 2.946181, 0, 0.2745098, 1, 1,
0.2919622, -0.511635, 0.4707227, 0, 0.2666667, 1, 1,
0.2930164, -0.5075414, 3.737143, 0, 0.2627451, 1, 1,
0.3034216, 0.229372, 0.2511374, 0, 0.254902, 1, 1,
0.3034257, 0.5744571, 2.509527, 0, 0.2509804, 1, 1,
0.3077166, 0.07305074, 3.063415, 0, 0.2431373, 1, 1,
0.3080787, -0.4992615, 3.454405, 0, 0.2392157, 1, 1,
0.3088589, 0.3023781, 1.17062, 0, 0.2313726, 1, 1,
0.3127886, -0.7674693, 2.34317, 0, 0.227451, 1, 1,
0.3150596, 0.1874867, 3.647208, 0, 0.2196078, 1, 1,
0.3163295, 0.01186017, 1.952136, 0, 0.2156863, 1, 1,
0.3215104, 1.287143, 0.8625696, 0, 0.2078431, 1, 1,
0.3219023, -0.2078405, 1.690807, 0, 0.2039216, 1, 1,
0.3240466, 1.040173, -1.702428, 0, 0.1960784, 1, 1,
0.3255214, -0.3717536, 1.368746, 0, 0.1882353, 1, 1,
0.3265499, 0.8641881, 0.3633596, 0, 0.1843137, 1, 1,
0.3327735, -1.208944, 2.863684, 0, 0.1764706, 1, 1,
0.3341121, -0.8624026, 1.439551, 0, 0.172549, 1, 1,
0.3348904, 0.2501816, -1.250041, 0, 0.1647059, 1, 1,
0.334991, -0.3341666, 3.54343, 0, 0.1607843, 1, 1,
0.3379795, 0.4109525, 0.3219455, 0, 0.1529412, 1, 1,
0.3413407, -0.3489425, 1.500462, 0, 0.1490196, 1, 1,
0.3427632, -1.289316, 1.457111, 0, 0.1411765, 1, 1,
0.3477091, 1.165535, 0.7409186, 0, 0.1372549, 1, 1,
0.3488076, 0.1213098, -0.8485519, 0, 0.1294118, 1, 1,
0.3528102, 1.593513, -0.08020065, 0, 0.1254902, 1, 1,
0.3570182, 0.2274566, 0.7288136, 0, 0.1176471, 1, 1,
0.3581363, 0.2372104, 0.8262423, 0, 0.1137255, 1, 1,
0.3582607, 1.105453, -0.7061458, 0, 0.1058824, 1, 1,
0.362377, -0.2274967, 0.6921655, 0, 0.09803922, 1, 1,
0.3641449, 0.2526203, -0.7914258, 0, 0.09411765, 1, 1,
0.3652085, 0.7847375, 0.8494593, 0, 0.08627451, 1, 1,
0.3663425, 0.09737764, 0.424767, 0, 0.08235294, 1, 1,
0.3698336, 0.1761979, -0.5910922, 0, 0.07450981, 1, 1,
0.3703531, 0.2959737, 1.31728, 0, 0.07058824, 1, 1,
0.3761243, -0.3707103, 1.859871, 0, 0.0627451, 1, 1,
0.3775567, -0.595363, 0.8536924, 0, 0.05882353, 1, 1,
0.3786879, -0.7902026, 3.473523, 0, 0.05098039, 1, 1,
0.3838062, -0.7332474, 1.637343, 0, 0.04705882, 1, 1,
0.3855547, 0.753966, -0.9398251, 0, 0.03921569, 1, 1,
0.3857577, -1.480987, 1.600991, 0, 0.03529412, 1, 1,
0.3862708, -0.05481175, 1.815737, 0, 0.02745098, 1, 1,
0.3915165, 0.4690219, 0.4707521, 0, 0.02352941, 1, 1,
0.3962409, -1.774107, 0.8948117, 0, 0.01568628, 1, 1,
0.3987813, 0.246803, 1.925007, 0, 0.01176471, 1, 1,
0.4048871, 0.6320773, 2.291794, 0, 0.003921569, 1, 1,
0.4064839, 0.7297851, 0.04285459, 0.003921569, 0, 1, 1,
0.4097028, -0.9546939, 3.220002, 0.007843138, 0, 1, 1,
0.4102206, -0.8834955, 3.532354, 0.01568628, 0, 1, 1,
0.4174938, 0.7682801, 2.627994, 0.01960784, 0, 1, 1,
0.4216065, 0.6648892, 1.500594, 0.02745098, 0, 1, 1,
0.4265983, 0.3185006, 2.029228, 0.03137255, 0, 1, 1,
0.4311977, -0.98965, 1.654312, 0.03921569, 0, 1, 1,
0.4375992, -1.231758, 4.209996, 0.04313726, 0, 1, 1,
0.4471748, 1.787223, 1.371967, 0.05098039, 0, 1, 1,
0.4491873, 0.4098077, -0.03938946, 0.05490196, 0, 1, 1,
0.449558, 2.041804, 0.7242401, 0.0627451, 0, 1, 1,
0.4499943, -0.07816494, 1.08203, 0.06666667, 0, 1, 1,
0.4508819, 0.8282315, 0.5010123, 0.07450981, 0, 1, 1,
0.4510794, -0.1515078, 1.90976, 0.07843138, 0, 1, 1,
0.4568303, -0.7957463, 2.407489, 0.08627451, 0, 1, 1,
0.4592097, -2.136148, 3.550636, 0.09019608, 0, 1, 1,
0.4601474, -0.1041748, 4.394996, 0.09803922, 0, 1, 1,
0.4683977, 0.4075925, 0.5869039, 0.1058824, 0, 1, 1,
0.4699917, -0.358929, 2.363309, 0.1098039, 0, 1, 1,
0.4706602, -0.2255687, 1.108631, 0.1176471, 0, 1, 1,
0.473367, 0.2657784, 0.7434719, 0.1215686, 0, 1, 1,
0.4737058, 0.9896678, 1.21113, 0.1294118, 0, 1, 1,
0.4739553, -0.4315852, 3.148343, 0.1333333, 0, 1, 1,
0.4804773, -1.323186, 2.742002, 0.1411765, 0, 1, 1,
0.4813275, 1.238792, -0.2903349, 0.145098, 0, 1, 1,
0.4871037, 0.5608966, 0.3746209, 0.1529412, 0, 1, 1,
0.4895415, -0.7515789, 3.980101, 0.1568628, 0, 1, 1,
0.4911483, 1.111759, 0.004474258, 0.1647059, 0, 1, 1,
0.4921688, 1.412279, 1.923651, 0.1686275, 0, 1, 1,
0.4969158, 1.350814, -0.6842932, 0.1764706, 0, 1, 1,
0.5001734, -0.4814442, 2.462529, 0.1803922, 0, 1, 1,
0.5054383, 0.191228, 2.096859, 0.1882353, 0, 1, 1,
0.509237, 0.5303714, 1.354244, 0.1921569, 0, 1, 1,
0.5141979, -0.1413225, 2.037729, 0.2, 0, 1, 1,
0.5173169, -1.008853, 3.08788, 0.2078431, 0, 1, 1,
0.5188593, -0.8306626, 2.630711, 0.2117647, 0, 1, 1,
0.5234335, -0.4934329, 3.59463, 0.2196078, 0, 1, 1,
0.5234761, 1.560707, -0.1403774, 0.2235294, 0, 1, 1,
0.5309516, -1.085756, 2.796393, 0.2313726, 0, 1, 1,
0.5346947, -0.2331023, 2.367423, 0.2352941, 0, 1, 1,
0.5354268, 0.1080226, 1.725433, 0.2431373, 0, 1, 1,
0.5358686, -0.8242283, 3.576594, 0.2470588, 0, 1, 1,
0.5363583, -0.1638002, 1.876548, 0.254902, 0, 1, 1,
0.5406424, 0.7568496, 0.8352159, 0.2588235, 0, 1, 1,
0.5410057, 2.009775, -0.1700414, 0.2666667, 0, 1, 1,
0.5467086, -1.524808, 0.6837326, 0.2705882, 0, 1, 1,
0.547262, 0.809338, 2.150061, 0.2784314, 0, 1, 1,
0.5531057, 0.2952777, 0.1626511, 0.282353, 0, 1, 1,
0.5539001, 0.9163396, 2.574949, 0.2901961, 0, 1, 1,
0.5557239, -0.5236781, 2.582641, 0.2941177, 0, 1, 1,
0.559516, -0.1587229, 4.098272, 0.3019608, 0, 1, 1,
0.5607156, -0.6660287, 2.134972, 0.3098039, 0, 1, 1,
0.5630761, 0.6127401, 1.889285, 0.3137255, 0, 1, 1,
0.56432, -0.8895963, 3.443959, 0.3215686, 0, 1, 1,
0.5656434, -1.397494, 1.981068, 0.3254902, 0, 1, 1,
0.5662823, 0.2934362, 1.579124, 0.3333333, 0, 1, 1,
0.5700945, 1.840328, 0.7568856, 0.3372549, 0, 1, 1,
0.5702906, -0.5414094, 0.9177758, 0.345098, 0, 1, 1,
0.5784119, 0.2152626, 1.125306, 0.3490196, 0, 1, 1,
0.5802186, 1.371122, -1.708018, 0.3568628, 0, 1, 1,
0.5821723, -0.413432, 2.269349, 0.3607843, 0, 1, 1,
0.5837083, 0.1356309, 2.018658, 0.3686275, 0, 1, 1,
0.5841492, 0.1790689, 1.253549, 0.372549, 0, 1, 1,
0.5856755, 0.0006836923, 3.124673, 0.3803922, 0, 1, 1,
0.5892417, 0.08012572, 3.058688, 0.3843137, 0, 1, 1,
0.5894713, -1.175459, 2.14661, 0.3921569, 0, 1, 1,
0.5901946, -1.191327, 2.35964, 0.3960784, 0, 1, 1,
0.5930858, -0.04644668, 1.26228, 0.4039216, 0, 1, 1,
0.5940427, -1.049919, 0.7458594, 0.4117647, 0, 1, 1,
0.5958834, 1.597869, 1.975801, 0.4156863, 0, 1, 1,
0.6010866, -1.137891, 2.142885, 0.4235294, 0, 1, 1,
0.6016335, 0.2095456, 0.5083961, 0.427451, 0, 1, 1,
0.6070905, 1.940516, 0.1899598, 0.4352941, 0, 1, 1,
0.6085793, 0.4482696, 1.851476, 0.4392157, 0, 1, 1,
0.609279, -0.8782014, 1.653465, 0.4470588, 0, 1, 1,
0.6096228, -2.297699, 1.648948, 0.4509804, 0, 1, 1,
0.6148961, -0.1966681, 1.756929, 0.4588235, 0, 1, 1,
0.6160939, 0.4493169, 0.2245459, 0.4627451, 0, 1, 1,
0.6287667, -0.4118879, 2.814959, 0.4705882, 0, 1, 1,
0.6306412, -1.048113, 3.384115, 0.4745098, 0, 1, 1,
0.6329578, 0.2222715, 0.5586498, 0.4823529, 0, 1, 1,
0.6442918, -0.516495, 3.760024, 0.4862745, 0, 1, 1,
0.6643845, -0.2138037, 2.651445, 0.4941176, 0, 1, 1,
0.6777202, 0.04617088, 1.966225, 0.5019608, 0, 1, 1,
0.6814628, -0.5486288, 1.81133, 0.5058824, 0, 1, 1,
0.6837791, -0.2084289, 1.696197, 0.5137255, 0, 1, 1,
0.6852028, -0.08334742, 1.484852, 0.5176471, 0, 1, 1,
0.691572, -1.106706, 1.183684, 0.5254902, 0, 1, 1,
0.6921039, 1.319207, -0.7754088, 0.5294118, 0, 1, 1,
0.7035133, 1.348624, 0.235999, 0.5372549, 0, 1, 1,
0.7122812, -0.3946554, 3.481939, 0.5411765, 0, 1, 1,
0.7135883, 0.4756654, 2.225716, 0.5490196, 0, 1, 1,
0.719922, -0.5512728, 1.563789, 0.5529412, 0, 1, 1,
0.7235788, -0.09924959, 0.9858652, 0.5607843, 0, 1, 1,
0.7312122, 0.851599, -0.1406693, 0.5647059, 0, 1, 1,
0.7353371, -0.3565098, 2.144676, 0.572549, 0, 1, 1,
0.7364158, -0.989891, 2.746111, 0.5764706, 0, 1, 1,
0.7389776, 0.5357788, 1.599792, 0.5843138, 0, 1, 1,
0.7401943, -0.7431021, 2.718513, 0.5882353, 0, 1, 1,
0.7418641, -0.9510427, 0.6968747, 0.5960785, 0, 1, 1,
0.7448957, 0.2362234, 2.065115, 0.6039216, 0, 1, 1,
0.751002, -0.5343947, 1.211356, 0.6078432, 0, 1, 1,
0.7527375, -0.633018, 0.5153153, 0.6156863, 0, 1, 1,
0.7533703, -0.2924357, 3.06319, 0.6196079, 0, 1, 1,
0.7538404, -0.8222051, 2.236145, 0.627451, 0, 1, 1,
0.7546487, -0.5263749, 3.441669, 0.6313726, 0, 1, 1,
0.7578016, -0.687629, 2.351874, 0.6392157, 0, 1, 1,
0.7612037, -0.1283861, 1.328044, 0.6431373, 0, 1, 1,
0.7622235, -1.48743, 3.636598, 0.6509804, 0, 1, 1,
0.762785, 0.3620782, 0.7910451, 0.654902, 0, 1, 1,
0.7628051, 0.7326288, 0.0935833, 0.6627451, 0, 1, 1,
0.7650801, -1.043803, 2.087934, 0.6666667, 0, 1, 1,
0.7651407, -1.027055, 3.386293, 0.6745098, 0, 1, 1,
0.7688017, 0.4502187, 0.9453394, 0.6784314, 0, 1, 1,
0.7733653, 0.2044076, 2.4643, 0.6862745, 0, 1, 1,
0.7763193, -0.8141848, 2.264089, 0.6901961, 0, 1, 1,
0.7783387, -0.138597, 2.99355, 0.6980392, 0, 1, 1,
0.7787213, -0.8171849, 2.448804, 0.7058824, 0, 1, 1,
0.7799823, -0.2666928, 1.074658, 0.7098039, 0, 1, 1,
0.7811095, 2.008972, 0.7530788, 0.7176471, 0, 1, 1,
0.7821839, 1.683721, 3.606734, 0.7215686, 0, 1, 1,
0.7827262, 0.02569807, 1.783167, 0.7294118, 0, 1, 1,
0.7841722, -0.2355088, 2.889261, 0.7333333, 0, 1, 1,
0.7887306, -0.06449074, 1.672141, 0.7411765, 0, 1, 1,
0.7905171, -0.1988876, 1.246027, 0.7450981, 0, 1, 1,
0.7908639, 0.3511893, 3.65235, 0.7529412, 0, 1, 1,
0.7953146, 0.2712072, 0.9587555, 0.7568628, 0, 1, 1,
0.7956573, 0.6859156, 0.2563469, 0.7647059, 0, 1, 1,
0.7973266, -0.8315778, 2.171355, 0.7686275, 0, 1, 1,
0.7981157, -0.4210954, 3.636078, 0.7764706, 0, 1, 1,
0.8025622, -1.432097, 3.590719, 0.7803922, 0, 1, 1,
0.8028054, 0.5721225, 0.3400072, 0.7882353, 0, 1, 1,
0.8039252, 2.741419, 0.1721814, 0.7921569, 0, 1, 1,
0.8157272, -0.0005705106, 0.5597147, 0.8, 0, 1, 1,
0.8164912, -1.192832, 3.434011, 0.8078431, 0, 1, 1,
0.8194739, -1.468166, 2.536919, 0.8117647, 0, 1, 1,
0.827774, 0.739826, 1.093281, 0.8196079, 0, 1, 1,
0.8279648, -0.4410681, 3.845994, 0.8235294, 0, 1, 1,
0.8319424, 2.538644, -0.9371363, 0.8313726, 0, 1, 1,
0.8320316, -0.9732206, 2.259078, 0.8352941, 0, 1, 1,
0.8354561, -0.6538547, 2.352328, 0.8431373, 0, 1, 1,
0.8375218, 0.5535959, 2.30942, 0.8470588, 0, 1, 1,
0.8490491, -0.248798, 2.635919, 0.854902, 0, 1, 1,
0.8578813, 1.759334, 0.9025754, 0.8588235, 0, 1, 1,
0.8594533, -0.191331, 2.068647, 0.8666667, 0, 1, 1,
0.8616759, -0.6211868, 0.986229, 0.8705882, 0, 1, 1,
0.8652912, -0.2021657, 3.143918, 0.8784314, 0, 1, 1,
0.8668712, -0.2792131, 0.3835507, 0.8823529, 0, 1, 1,
0.875398, -1.491438, 2.681346, 0.8901961, 0, 1, 1,
0.8842104, -0.1558624, 2.614719, 0.8941177, 0, 1, 1,
0.8870484, 0.3221843, 0.5141659, 0.9019608, 0, 1, 1,
0.8963897, -0.1493453, 1.275982, 0.9098039, 0, 1, 1,
0.8972466, -1.400248, 2.776081, 0.9137255, 0, 1, 1,
0.8992203, 0.09674062, 0.742722, 0.9215686, 0, 1, 1,
0.9040838, 0.3822422, -0.08217748, 0.9254902, 0, 1, 1,
0.9053387, 0.0154947, 0.4626794, 0.9333333, 0, 1, 1,
0.9091129, -0.8270603, 4.598537, 0.9372549, 0, 1, 1,
0.90917, 0.8035636, 0.5352468, 0.945098, 0, 1, 1,
0.9114628, 0.4918135, 0.7474883, 0.9490196, 0, 1, 1,
0.9154493, 0.9918854, 0.5522835, 0.9568627, 0, 1, 1,
0.9156538, 2.970106, 1.916844, 0.9607843, 0, 1, 1,
0.9217284, 0.9954692, 0.672725, 0.9686275, 0, 1, 1,
0.9245911, -1.156367, 2.381038, 0.972549, 0, 1, 1,
0.9288055, -0.1042781, 1.201236, 0.9803922, 0, 1, 1,
0.9306562, 0.8235189, 1.104562, 0.9843137, 0, 1, 1,
0.9412898, 2.466705, 0.6204574, 0.9921569, 0, 1, 1,
0.9435686, 1.59831, 0.09766923, 0.9960784, 0, 1, 1,
0.9442394, 1.873779, 0.3200497, 1, 0, 0.9960784, 1,
0.945067, 0.5609013, 1.78616, 1, 0, 0.9882353, 1,
0.9459214, -1.31256, 3.43031, 1, 0, 0.9843137, 1,
0.947426, -0.2221919, 1.40799, 1, 0, 0.9764706, 1,
0.9547802, 0.5471062, 1.667628, 1, 0, 0.972549, 1,
0.9784041, 0.02474426, 1.471184, 1, 0, 0.9647059, 1,
0.9799752, -0.5627434, 0.8296667, 1, 0, 0.9607843, 1,
0.9829964, 0.4337322, 1.055588, 1, 0, 0.9529412, 1,
0.9915972, -0.7331495, 2.371192, 1, 0, 0.9490196, 1,
0.9922065, -0.2289155, 1.026982, 1, 0, 0.9411765, 1,
0.9981241, -0.4142161, 1.62532, 1, 0, 0.9372549, 1,
1.00342, 1.898522, 1.274454, 1, 0, 0.9294118, 1,
1.007164, -0.2065043, 0.7363326, 1, 0, 0.9254902, 1,
1.014735, -0.1773031, 1.793123, 1, 0, 0.9176471, 1,
1.016797, -0.9378009, 1.083127, 1, 0, 0.9137255, 1,
1.030576, -0.9454564, 1.348325, 1, 0, 0.9058824, 1,
1.03301, 0.6874773, 1.015259, 1, 0, 0.9019608, 1,
1.036866, 0.2117122, 0.1526757, 1, 0, 0.8941177, 1,
1.038596, -0.2997765, 0.4227369, 1, 0, 0.8862745, 1,
1.046398, -0.1530857, 3.44677, 1, 0, 0.8823529, 1,
1.05463, -0.9058887, 2.114856, 1, 0, 0.8745098, 1,
1.056286, -0.4161752, 3.37396, 1, 0, 0.8705882, 1,
1.057285, 0.6840493, 2.853087, 1, 0, 0.8627451, 1,
1.062823, 1.140414, 2.551352, 1, 0, 0.8588235, 1,
1.063292, -0.4484756, 2.246017, 1, 0, 0.8509804, 1,
1.063951, 0.7456112, 1.463744, 1, 0, 0.8470588, 1,
1.065888, -0.3446158, 2.602893, 1, 0, 0.8392157, 1,
1.074691, 0.1226208, 0.4826311, 1, 0, 0.8352941, 1,
1.074789, 1.195405, -0.1845706, 1, 0, 0.827451, 1,
1.075976, -0.2305474, 1.29569, 1, 0, 0.8235294, 1,
1.07967, 0.2531186, 0.3839271, 1, 0, 0.8156863, 1,
1.081218, -1.160487, -0.2390171, 1, 0, 0.8117647, 1,
1.082509, -0.8953193, 2.284953, 1, 0, 0.8039216, 1,
1.092482, 0.4194397, 1.268539, 1, 0, 0.7960784, 1,
1.094391, 0.5551127, 0.5955602, 1, 0, 0.7921569, 1,
1.101324, 0.8952613, 0.6589304, 1, 0, 0.7843137, 1,
1.105171, -0.6041288, 1.297799, 1, 0, 0.7803922, 1,
1.106524, -0.0695664, 1.487157, 1, 0, 0.772549, 1,
1.111564, -2.269702, 4.646698, 1, 0, 0.7686275, 1,
1.113174, 0.0495284, 1.106452, 1, 0, 0.7607843, 1,
1.124305, 0.9243886, -0.2263383, 1, 0, 0.7568628, 1,
1.126263, -0.5436991, 2.439731, 1, 0, 0.7490196, 1,
1.133254, 1.22131, 0.399242, 1, 0, 0.7450981, 1,
1.133599, 0.02536314, -0.6517156, 1, 0, 0.7372549, 1,
1.151774, 0.7928353, -0.1189166, 1, 0, 0.7333333, 1,
1.15218, -0.61796, 2.007186, 1, 0, 0.7254902, 1,
1.15331, -0.5461529, 2.389657, 1, 0, 0.7215686, 1,
1.153641, -1.080539, 1.791942, 1, 0, 0.7137255, 1,
1.164546, -0.2319344, 1.634903, 1, 0, 0.7098039, 1,
1.167802, -0.9388376, 2.195038, 1, 0, 0.7019608, 1,
1.168789, -0.5483555, 1.744202, 1, 0, 0.6941177, 1,
1.170977, -0.2275896, 1.657287, 1, 0, 0.6901961, 1,
1.174537, 0.9415882, 0.7996491, 1, 0, 0.682353, 1,
1.176108, 0.310938, 1.602408, 1, 0, 0.6784314, 1,
1.176671, 1.930282, -0.6965132, 1, 0, 0.6705883, 1,
1.178519, -0.2384832, 2.855892, 1, 0, 0.6666667, 1,
1.179117, 0.2094998, 0.3209261, 1, 0, 0.6588235, 1,
1.185572, 0.9304639, 1.057338, 1, 0, 0.654902, 1,
1.186756, 1.810367, -0.751986, 1, 0, 0.6470588, 1,
1.18926, 0.2048005, -0.04551947, 1, 0, 0.6431373, 1,
1.197488, -0.6032116, -0.01254634, 1, 0, 0.6352941, 1,
1.213687, 1.082929, -0.3781961, 1, 0, 0.6313726, 1,
1.236301, -1.145243, 1.731044, 1, 0, 0.6235294, 1,
1.246055, 0.3954429, 1.190608, 1, 0, 0.6196079, 1,
1.246636, 0.6505669, 2.083077, 1, 0, 0.6117647, 1,
1.247748, 0.4569423, 1.958898, 1, 0, 0.6078432, 1,
1.249929, 0.2681526, 0.5180399, 1, 0, 0.6, 1,
1.256235, 0.6021088, 1.002698, 1, 0, 0.5921569, 1,
1.259146, -0.6790898, 1.220464, 1, 0, 0.5882353, 1,
1.27091, -0.8847137, 2.92667, 1, 0, 0.5803922, 1,
1.279372, -0.01485058, 0.8883949, 1, 0, 0.5764706, 1,
1.279414, 1.998538, 0.4497961, 1, 0, 0.5686275, 1,
1.28578, 2.107771, 0.252832, 1, 0, 0.5647059, 1,
1.298088, 0.2139633, 4.126722, 1, 0, 0.5568628, 1,
1.29816, -1.244106, 1.989295, 1, 0, 0.5529412, 1,
1.313088, -0.336556, 1.554086, 1, 0, 0.5450981, 1,
1.313922, 0.410655, 3.048417, 1, 0, 0.5411765, 1,
1.321875, -1.562028, 2.779767, 1, 0, 0.5333334, 1,
1.334893, 0.8554668, -0.003118519, 1, 0, 0.5294118, 1,
1.361325, 1.527271, 2.517039, 1, 0, 0.5215687, 1,
1.371249, 0.816581, -0.2655099, 1, 0, 0.5176471, 1,
1.372761, 0.05368782, 1.519041, 1, 0, 0.509804, 1,
1.37689, -1.209694, 2.913988, 1, 0, 0.5058824, 1,
1.378281, 1.007573, 1.539177, 1, 0, 0.4980392, 1,
1.386309, 0.9141554, 0.883599, 1, 0, 0.4901961, 1,
1.387944, 0.03990597, 2.187111, 1, 0, 0.4862745, 1,
1.396238, 0.5980396, 3.202015, 1, 0, 0.4784314, 1,
1.396245, 0.1983178, 0.9038495, 1, 0, 0.4745098, 1,
1.399998, -0.5469364, 1.714892, 1, 0, 0.4666667, 1,
1.402409, -0.1062931, 0.8840517, 1, 0, 0.4627451, 1,
1.405981, -1.707899, 2.370675, 1, 0, 0.454902, 1,
1.408047, -1.840684, 2.053857, 1, 0, 0.4509804, 1,
1.421481, 0.4575573, 2.304225, 1, 0, 0.4431373, 1,
1.444564, 1.092407, -0.3938504, 1, 0, 0.4392157, 1,
1.445836, -0.4178145, 1.564714, 1, 0, 0.4313726, 1,
1.472534, 0.5185269, 2.639201, 1, 0, 0.427451, 1,
1.474025, -0.6235812, 1.260336, 1, 0, 0.4196078, 1,
1.474448, -1.138593, 3.147403, 1, 0, 0.4156863, 1,
1.475841, 0.9541016, 0.7290731, 1, 0, 0.4078431, 1,
1.478094, -0.09557496, 1.39555, 1, 0, 0.4039216, 1,
1.480469, 1.379456, 0.6106035, 1, 0, 0.3960784, 1,
1.483332, -0.04377139, 0.3068925, 1, 0, 0.3882353, 1,
1.486974, -0.5000953, 2.663495, 1, 0, 0.3843137, 1,
1.50172, 0.313322, 0.7728568, 1, 0, 0.3764706, 1,
1.534431, 1.03748, 1.053686, 1, 0, 0.372549, 1,
1.536693, -0.009021647, 1.5291, 1, 0, 0.3647059, 1,
1.584783, -0.08434318, 1.280552, 1, 0, 0.3607843, 1,
1.591293, -0.8303231, 2.518868, 1, 0, 0.3529412, 1,
1.598041, 0.5442566, 2.109496, 1, 0, 0.3490196, 1,
1.599856, -0.3534671, 0.09058145, 1, 0, 0.3411765, 1,
1.600366, 1.187658, 2.423742, 1, 0, 0.3372549, 1,
1.616176, 1.502254, 2.596569, 1, 0, 0.3294118, 1,
1.632427, -0.5486474, 2.539679, 1, 0, 0.3254902, 1,
1.639145, -0.08495015, -0.5076679, 1, 0, 0.3176471, 1,
1.640479, 0.4947425, 0.6448051, 1, 0, 0.3137255, 1,
1.644211, -1.371894, 1.556161, 1, 0, 0.3058824, 1,
1.650723, 0.3875019, 2.111535, 1, 0, 0.2980392, 1,
1.664822, 0.4343628, 1.442123, 1, 0, 0.2941177, 1,
1.669748, -0.6949388, 1.55309, 1, 0, 0.2862745, 1,
1.673313, 1.30933, 1.577842, 1, 0, 0.282353, 1,
1.67855, -0.1461758, 1.533782, 1, 0, 0.2745098, 1,
1.681372, 0.3158399, 1.11035, 1, 0, 0.2705882, 1,
1.705774, -0.8999871, 3.713746, 1, 0, 0.2627451, 1,
1.735671, 0.3870686, 2.869552, 1, 0, 0.2588235, 1,
1.745656, -0.9695526, 3.577111, 1, 0, 0.2509804, 1,
1.755176, 0.9770925, 1.053468, 1, 0, 0.2470588, 1,
1.767079, -0.757257, 2.408907, 1, 0, 0.2392157, 1,
1.77685, -0.5031679, -0.1875746, 1, 0, 0.2352941, 1,
1.822611, 0.08904737, 3.203072, 1, 0, 0.227451, 1,
1.823393, 0.6356618, 1.842997, 1, 0, 0.2235294, 1,
1.824177, -0.4450634, 1.757476, 1, 0, 0.2156863, 1,
1.82799, 0.7533933, 0.5670726, 1, 0, 0.2117647, 1,
1.830884, -0.6919676, 1.15862, 1, 0, 0.2039216, 1,
1.831972, -0.5813683, 1.142327, 1, 0, 0.1960784, 1,
1.834323, 1.089191, 0.3463208, 1, 0, 0.1921569, 1,
1.843279, -0.3646742, 1.646601, 1, 0, 0.1843137, 1,
1.847393, 1.10716, 2.687231, 1, 0, 0.1803922, 1,
1.850848, -0.9414155, 1.632687, 1, 0, 0.172549, 1,
1.902608, 1.29134, -0.2372942, 1, 0, 0.1686275, 1,
1.902654, -0.519747, 1.536915, 1, 0, 0.1607843, 1,
1.940953, 0.3244891, 1.289811, 1, 0, 0.1568628, 1,
1.941432, -1.007195, 0.4091009, 1, 0, 0.1490196, 1,
1.945026, -0.3752502, -1.549013, 1, 0, 0.145098, 1,
1.984887, 1.447609, 1.011259, 1, 0, 0.1372549, 1,
1.998343, -0.3647227, 3.4345, 1, 0, 0.1333333, 1,
2.007979, -0.4954866, 2.058517, 1, 0, 0.1254902, 1,
2.033107, 0.2904509, 0.6338868, 1, 0, 0.1215686, 1,
2.070447, -0.5996834, 2.443167, 1, 0, 0.1137255, 1,
2.09591, -0.9529454, 0.120307, 1, 0, 0.1098039, 1,
2.131484, -0.9938115, 2.023572, 1, 0, 0.1019608, 1,
2.195073, -1.545135, 1.88557, 1, 0, 0.09411765, 1,
2.216861, 0.6005574, 0.5905765, 1, 0, 0.09019608, 1,
2.236423, -0.7120576, 2.00086, 1, 0, 0.08235294, 1,
2.240977, -0.0690904, 1.098424, 1, 0, 0.07843138, 1,
2.395514, 0.7550533, 1.859872, 1, 0, 0.07058824, 1,
2.397149, 0.5254907, 1.666191, 1, 0, 0.06666667, 1,
2.41118, 0.5064464, 1.595512, 1, 0, 0.05882353, 1,
2.428169, -0.1313237, 2.912249, 1, 0, 0.05490196, 1,
2.438509, 0.3495261, 2.235157, 1, 0, 0.04705882, 1,
2.44277, -1.213939, 2.139624, 1, 0, 0.04313726, 1,
2.488435, 1.823316, 0.4642907, 1, 0, 0.03529412, 1,
2.494428, -2.621863, 2.789933, 1, 0, 0.03137255, 1,
2.701158, 2.019652, 1.40254, 1, 0, 0.02352941, 1,
2.989684, 0.9257898, -0.1925464, 1, 0, 0.01960784, 1,
3.151169, 0.06835233, 0.5819002, 1, 0, 0.01176471, 1,
3.355471, -0.1270293, 0.9557579, 1, 0, 0.007843138, 1
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
0.1759039, -4.322304, -8.017414, 0, -0.5, 0.5, 0.5,
0.1759039, -4.322304, -8.017414, 1, -0.5, 0.5, 0.5,
0.1759039, -4.322304, -8.017414, 1, 1.5, 0.5, 0.5,
0.1759039, -4.322304, -8.017414, 0, 1.5, 0.5, 0.5
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
-4.081536, -0.1476407, -8.017414, 0, -0.5, 0.5, 0.5,
-4.081536, -0.1476407, -8.017414, 1, -0.5, 0.5, 0.5,
-4.081536, -0.1476407, -8.017414, 1, 1.5, 0.5, 0.5,
-4.081536, -0.1476407, -8.017414, 0, 1.5, 0.5, 0.5
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
-4.081536, -4.322304, -0.4646511, 0, -0.5, 0.5, 0.5,
-4.081536, -4.322304, -0.4646511, 1, -0.5, 0.5, 0.5,
-4.081536, -4.322304, -0.4646511, 1, 1.5, 0.5, 0.5,
-4.081536, -4.322304, -0.4646511, 0, 1.5, 0.5, 0.5
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
-3, -3.35892, -6.274469,
3, -3.35892, -6.274469,
-3, -3.35892, -6.274469,
-3, -3.519484, -6.56496,
-2, -3.35892, -6.274469,
-2, -3.519484, -6.56496,
-1, -3.35892, -6.274469,
-1, -3.519484, -6.56496,
0, -3.35892, -6.274469,
0, -3.519484, -6.56496,
1, -3.35892, -6.274469,
1, -3.519484, -6.56496,
2, -3.35892, -6.274469,
2, -3.519484, -6.56496,
3, -3.35892, -6.274469,
3, -3.519484, -6.56496
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
-3, -3.840612, -7.145941, 0, -0.5, 0.5, 0.5,
-3, -3.840612, -7.145941, 1, -0.5, 0.5, 0.5,
-3, -3.840612, -7.145941, 1, 1.5, 0.5, 0.5,
-3, -3.840612, -7.145941, 0, 1.5, 0.5, 0.5,
-2, -3.840612, -7.145941, 0, -0.5, 0.5, 0.5,
-2, -3.840612, -7.145941, 1, -0.5, 0.5, 0.5,
-2, -3.840612, -7.145941, 1, 1.5, 0.5, 0.5,
-2, -3.840612, -7.145941, 0, 1.5, 0.5, 0.5,
-1, -3.840612, -7.145941, 0, -0.5, 0.5, 0.5,
-1, -3.840612, -7.145941, 1, -0.5, 0.5, 0.5,
-1, -3.840612, -7.145941, 1, 1.5, 0.5, 0.5,
-1, -3.840612, -7.145941, 0, 1.5, 0.5, 0.5,
0, -3.840612, -7.145941, 0, -0.5, 0.5, 0.5,
0, -3.840612, -7.145941, 1, -0.5, 0.5, 0.5,
0, -3.840612, -7.145941, 1, 1.5, 0.5, 0.5,
0, -3.840612, -7.145941, 0, 1.5, 0.5, 0.5,
1, -3.840612, -7.145941, 0, -0.5, 0.5, 0.5,
1, -3.840612, -7.145941, 1, -0.5, 0.5, 0.5,
1, -3.840612, -7.145941, 1, 1.5, 0.5, 0.5,
1, -3.840612, -7.145941, 0, 1.5, 0.5, 0.5,
2, -3.840612, -7.145941, 0, -0.5, 0.5, 0.5,
2, -3.840612, -7.145941, 1, -0.5, 0.5, 0.5,
2, -3.840612, -7.145941, 1, 1.5, 0.5, 0.5,
2, -3.840612, -7.145941, 0, 1.5, 0.5, 0.5,
3, -3.840612, -7.145941, 0, -0.5, 0.5, 0.5,
3, -3.840612, -7.145941, 1, -0.5, 0.5, 0.5,
3, -3.840612, -7.145941, 1, 1.5, 0.5, 0.5,
3, -3.840612, -7.145941, 0, 1.5, 0.5, 0.5
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
-3.09905, -3, -6.274469,
-3.09905, 2, -6.274469,
-3.09905, -3, -6.274469,
-3.262798, -3, -6.56496,
-3.09905, -2, -6.274469,
-3.262798, -2, -6.56496,
-3.09905, -1, -6.274469,
-3.262798, -1, -6.56496,
-3.09905, 0, -6.274469,
-3.262798, 0, -6.56496,
-3.09905, 1, -6.274469,
-3.262798, 1, -6.56496,
-3.09905, 2, -6.274469,
-3.262798, 2, -6.56496
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
-3.590293, -3, -7.145941, 0, -0.5, 0.5, 0.5,
-3.590293, -3, -7.145941, 1, -0.5, 0.5, 0.5,
-3.590293, -3, -7.145941, 1, 1.5, 0.5, 0.5,
-3.590293, -3, -7.145941, 0, 1.5, 0.5, 0.5,
-3.590293, -2, -7.145941, 0, -0.5, 0.5, 0.5,
-3.590293, -2, -7.145941, 1, -0.5, 0.5, 0.5,
-3.590293, -2, -7.145941, 1, 1.5, 0.5, 0.5,
-3.590293, -2, -7.145941, 0, 1.5, 0.5, 0.5,
-3.590293, -1, -7.145941, 0, -0.5, 0.5, 0.5,
-3.590293, -1, -7.145941, 1, -0.5, 0.5, 0.5,
-3.590293, -1, -7.145941, 1, 1.5, 0.5, 0.5,
-3.590293, -1, -7.145941, 0, 1.5, 0.5, 0.5,
-3.590293, 0, -7.145941, 0, -0.5, 0.5, 0.5,
-3.590293, 0, -7.145941, 1, -0.5, 0.5, 0.5,
-3.590293, 0, -7.145941, 1, 1.5, 0.5, 0.5,
-3.590293, 0, -7.145941, 0, 1.5, 0.5, 0.5,
-3.590293, 1, -7.145941, 0, -0.5, 0.5, 0.5,
-3.590293, 1, -7.145941, 1, -0.5, 0.5, 0.5,
-3.590293, 1, -7.145941, 1, 1.5, 0.5, 0.5,
-3.590293, 1, -7.145941, 0, 1.5, 0.5, 0.5,
-3.590293, 2, -7.145941, 0, -0.5, 0.5, 0.5,
-3.590293, 2, -7.145941, 1, -0.5, 0.5, 0.5,
-3.590293, 2, -7.145941, 1, 1.5, 0.5, 0.5,
-3.590293, 2, -7.145941, 0, 1.5, 0.5, 0.5
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
-3.09905, -3.35892, -6,
-3.09905, -3.35892, 4,
-3.09905, -3.35892, -6,
-3.262798, -3.519484, -6,
-3.09905, -3.35892, -4,
-3.262798, -3.519484, -4,
-3.09905, -3.35892, -2,
-3.262798, -3.519484, -2,
-3.09905, -3.35892, 0,
-3.262798, -3.519484, 0,
-3.09905, -3.35892, 2,
-3.262798, -3.519484, 2,
-3.09905, -3.35892, 4,
-3.262798, -3.519484, 4
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
-3.590293, -3.840612, -6, 0, -0.5, 0.5, 0.5,
-3.590293, -3.840612, -6, 1, -0.5, 0.5, 0.5,
-3.590293, -3.840612, -6, 1, 1.5, 0.5, 0.5,
-3.590293, -3.840612, -6, 0, 1.5, 0.5, 0.5,
-3.590293, -3.840612, -4, 0, -0.5, 0.5, 0.5,
-3.590293, -3.840612, -4, 1, -0.5, 0.5, 0.5,
-3.590293, -3.840612, -4, 1, 1.5, 0.5, 0.5,
-3.590293, -3.840612, -4, 0, 1.5, 0.5, 0.5,
-3.590293, -3.840612, -2, 0, -0.5, 0.5, 0.5,
-3.590293, -3.840612, -2, 1, -0.5, 0.5, 0.5,
-3.590293, -3.840612, -2, 1, 1.5, 0.5, 0.5,
-3.590293, -3.840612, -2, 0, 1.5, 0.5, 0.5,
-3.590293, -3.840612, 0, 0, -0.5, 0.5, 0.5,
-3.590293, -3.840612, 0, 1, -0.5, 0.5, 0.5,
-3.590293, -3.840612, 0, 1, 1.5, 0.5, 0.5,
-3.590293, -3.840612, 0, 0, 1.5, 0.5, 0.5,
-3.590293, -3.840612, 2, 0, -0.5, 0.5, 0.5,
-3.590293, -3.840612, 2, 1, -0.5, 0.5, 0.5,
-3.590293, -3.840612, 2, 1, 1.5, 0.5, 0.5,
-3.590293, -3.840612, 2, 0, 1.5, 0.5, 0.5,
-3.590293, -3.840612, 4, 0, -0.5, 0.5, 0.5,
-3.590293, -3.840612, 4, 1, -0.5, 0.5, 0.5,
-3.590293, -3.840612, 4, 1, 1.5, 0.5, 0.5,
-3.590293, -3.840612, 4, 0, 1.5, 0.5, 0.5
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
-3.09905, -3.35892, -6.274469,
-3.09905, 3.063639, -6.274469,
-3.09905, -3.35892, 5.345167,
-3.09905, 3.063639, 5.345167,
-3.09905, -3.35892, -6.274469,
-3.09905, -3.35892, 5.345167,
-3.09905, 3.063639, -6.274469,
-3.09905, 3.063639, 5.345167,
-3.09905, -3.35892, -6.274469,
3.450858, -3.35892, -6.274469,
-3.09905, -3.35892, 5.345167,
3.450858, -3.35892, 5.345167,
-3.09905, 3.063639, -6.274469,
3.450858, 3.063639, -6.274469,
-3.09905, 3.063639, 5.345167,
3.450858, 3.063639, 5.345167,
3.450858, -3.35892, -6.274469,
3.450858, 3.063639, -6.274469,
3.450858, -3.35892, 5.345167,
3.450858, 3.063639, 5.345167,
3.450858, -3.35892, -6.274469,
3.450858, -3.35892, 5.345167,
3.450858, 3.063639, -6.274469,
3.450858, 3.063639, 5.345167
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
var radius = 7.905194;
var distance = 35.1711;
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
mvMatrix.translate( -0.1759039, 0.1476407, 0.4646511 );
mvMatrix.scale( 1.304942, 1.330817, 0.7355868 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.1711);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
D-alanine_methyl_est<-read.table("D-alanine_methyl_est.xyz")
```

```
## Error in read.table("D-alanine_methyl_est.xyz"): no lines available in input
```

```r
x<-D-alanine_methyl_est$V2
```

```
## Error in eval(expr, envir, enclos): object 'alanine_methyl_est' not found
```

```r
y<-D-alanine_methyl_est$V3
```

```
## Error in eval(expr, envir, enclos): object 'alanine_methyl_est' not found
```

```r
z<-D-alanine_methyl_est$V4
```

```
## Error in eval(expr, envir, enclos): object 'alanine_methyl_est' not found
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
-3.003663, 0.04402569, -1.727215, 0, 0, 1, 1, 1,
-2.778602, -0.3143742, -1.190749, 1, 0, 0, 1, 1,
-2.729241, 0.5916517, -1.61774, 1, 0, 0, 1, 1,
-2.643759, -1.513599, -2.499327, 1, 0, 0, 1, 1,
-2.580603, -1.311953, -2.069249, 1, 0, 0, 1, 1,
-2.570877, -1.462322, -1.899436, 1, 0, 0, 1, 1,
-2.458194, 0.6797485, -0.6895389, 0, 0, 0, 1, 1,
-2.409259, -1.066291, -3.074911, 0, 0, 0, 1, 1,
-2.315837, 1.874844, -0.8143013, 0, 0, 0, 1, 1,
-2.283885, 0.5788057, -1.710319, 0, 0, 0, 1, 1,
-2.234869, 2.500165, -1.401173, 0, 0, 0, 1, 1,
-2.223254, 0.2636561, -2.813881, 0, 0, 0, 1, 1,
-2.194884, -0.7024647, -1.884305, 0, 0, 0, 1, 1,
-2.186736, -0.2376464, -0.1950961, 1, 1, 1, 1, 1,
-2.137536, -2.394151, 0.02070306, 1, 1, 1, 1, 1,
-2.09775, 0.4611416, -2.08252, 1, 1, 1, 1, 1,
-2.045281, -0.2923561, -1.54188, 1, 1, 1, 1, 1,
-2.033176, -2.748532, -3.776904, 1, 1, 1, 1, 1,
-2.029635, 0.5928738, -2.336082, 1, 1, 1, 1, 1,
-2.025991, -0.03650602, -1.00007, 1, 1, 1, 1, 1,
-2.02304, 1.719691, -1.262998, 1, 1, 1, 1, 1,
-1.991689, 1.290708, -1.777648, 1, 1, 1, 1, 1,
-1.971324, 1.548766, -0.3790078, 1, 1, 1, 1, 1,
-1.952236, 0.1810882, -1.393816, 1, 1, 1, 1, 1,
-1.932698, 0.3283356, -2.174757, 1, 1, 1, 1, 1,
-1.931352, 1.316871, -0.4837656, 1, 1, 1, 1, 1,
-1.926104, -0.845907, -1.410777, 1, 1, 1, 1, 1,
-1.908594, -0.5573818, -0.6893023, 1, 1, 1, 1, 1,
-1.903246, -1.309236, -2.845518, 0, 0, 1, 1, 1,
-1.889697, 0.02772748, -1.517354, 1, 0, 0, 1, 1,
-1.885834, -0.8559347, -1.396659, 1, 0, 0, 1, 1,
-1.879448, 1.147563, -1.10424, 1, 0, 0, 1, 1,
-1.877194, 0.3485244, -2.066276, 1, 0, 0, 1, 1,
-1.869284, -0.1986573, -2.311988, 1, 0, 0, 1, 1,
-1.847781, 0.6611852, 1.010191, 0, 0, 0, 1, 1,
-1.846572, -0.7916614, -3.431429, 0, 0, 0, 1, 1,
-1.83917, 0.01499304, 0.4864833, 0, 0, 0, 1, 1,
-1.821004, -1.689342, -3.094751, 0, 0, 0, 1, 1,
-1.814274, -2.401573, -4.160228, 0, 0, 0, 1, 1,
-1.802918, -0.2962096, -2.063637, 0, 0, 0, 1, 1,
-1.794897, 0.4480304, -1.690768, 0, 0, 0, 1, 1,
-1.785604, -0.4290446, -2.131841, 1, 1, 1, 1, 1,
-1.768793, 0.5755966, -0.1842148, 1, 1, 1, 1, 1,
-1.751089, 0.1024096, -3.793275, 1, 1, 1, 1, 1,
-1.744298, -0.7000108, -2.542902, 1, 1, 1, 1, 1,
-1.74425, -1.291244, -2.443484, 1, 1, 1, 1, 1,
-1.719634, -0.1976482, -0.7044309, 1, 1, 1, 1, 1,
-1.697142, 1.77263, -0.9518893, 1, 1, 1, 1, 1,
-1.687657, 1.259738, -1.619695, 1, 1, 1, 1, 1,
-1.679562, -1.346337, -1.897638, 1, 1, 1, 1, 1,
-1.679017, 1.051196, 0.5368722, 1, 1, 1, 1, 1,
-1.676281, 1.632627, -3.474357, 1, 1, 1, 1, 1,
-1.665559, 0.2922285, -2.14091, 1, 1, 1, 1, 1,
-1.661841, 1.353638, -1.281765, 1, 1, 1, 1, 1,
-1.623464, -0.002689243, -1.088901, 1, 1, 1, 1, 1,
-1.622266, -0.7139967, -1.787322, 1, 1, 1, 1, 1,
-1.621449, -0.9011125, -1.17591, 0, 0, 1, 1, 1,
-1.582051, -0.4861323, -4.047585, 1, 0, 0, 1, 1,
-1.581323, -1.38056, -2.474374, 1, 0, 0, 1, 1,
-1.562786, 0.3122831, -2.129102, 1, 0, 0, 1, 1,
-1.562229, 0.7546772, 0.3857778, 1, 0, 0, 1, 1,
-1.537656, 0.8256579, -1.282399, 1, 0, 0, 1, 1,
-1.531417, 0.4522849, -1.005146, 0, 0, 0, 1, 1,
-1.526139, 0.6247477, -2.580255, 0, 0, 0, 1, 1,
-1.52562, -0.8451853, -2.038476, 0, 0, 0, 1, 1,
-1.519672, -0.0668513, -0.2981177, 0, 0, 0, 1, 1,
-1.511428, 0.6852649, -1.478139, 0, 0, 0, 1, 1,
-1.481069, -1.743076, -1.720625, 0, 0, 0, 1, 1,
-1.475127, 0.1591762, -2.322161, 0, 0, 0, 1, 1,
-1.469431, 0.3973918, -0.555182, 1, 1, 1, 1, 1,
-1.469351, 0.1392379, -1.360462, 1, 1, 1, 1, 1,
-1.466173, -1.313728, -1.876538, 1, 1, 1, 1, 1,
-1.460082, -0.3437063, -0.8226213, 1, 1, 1, 1, 1,
-1.449207, -0.8483926, -3.450722, 1, 1, 1, 1, 1,
-1.444417, 0.0893949, -0.3817541, 1, 1, 1, 1, 1,
-1.431326, -1.777871, -3.192287, 1, 1, 1, 1, 1,
-1.426014, 0.009238309, -0.03742863, 1, 1, 1, 1, 1,
-1.422864, -0.5351585, -2.361216, 1, 1, 1, 1, 1,
-1.420286, -0.8351808, -2.041371, 1, 1, 1, 1, 1,
-1.416647, -0.9103631, -1.865412, 1, 1, 1, 1, 1,
-1.412439, -0.8909147, -2.108099, 1, 1, 1, 1, 1,
-1.397129, 1.431596, -0.3011604, 1, 1, 1, 1, 1,
-1.38476, -0.762386, -3.096985, 1, 1, 1, 1, 1,
-1.383178, -2.28851, -2.736888, 1, 1, 1, 1, 1,
-1.376932, -1.74222, -1.395211, 0, 0, 1, 1, 1,
-1.367428, -1.333352, -2.224296, 1, 0, 0, 1, 1,
-1.361102, 0.2731879, -0.8744957, 1, 0, 0, 1, 1,
-1.360536, -0.05386591, -1.585842, 1, 0, 0, 1, 1,
-1.353288, 0.04853759, -2.009155, 1, 0, 0, 1, 1,
-1.3427, 0.52589, -1.237141, 1, 0, 0, 1, 1,
-1.321371, 1.416712, -1.099031, 0, 0, 0, 1, 1,
-1.319457, -0.9364077, -1.457711, 0, 0, 0, 1, 1,
-1.304707, -1.103741, -1.954933, 0, 0, 0, 1, 1,
-1.301822, 0.5550491, -2.671745, 0, 0, 0, 1, 1,
-1.297742, 1.211954, -0.06129938, 0, 0, 0, 1, 1,
-1.288997, 0.5638396, -0.8268136, 0, 0, 0, 1, 1,
-1.285828, 2.155351, 0.3671677, 0, 0, 0, 1, 1,
-1.282186, 0.4341156, -0.9789828, 1, 1, 1, 1, 1,
-1.27371, -0.4957633, -2.233413, 1, 1, 1, 1, 1,
-1.268119, 1.629971, 0.6521706, 1, 1, 1, 1, 1,
-1.26243, 0.6538947, -1.308655, 1, 1, 1, 1, 1,
-1.253626, -0.4123631, -2.729113, 1, 1, 1, 1, 1,
-1.241193, -0.0779568, -3.456669, 1, 1, 1, 1, 1,
-1.231374, 1.511176, -0.08217673, 1, 1, 1, 1, 1,
-1.2288, 1.591703, -0.5552738, 1, 1, 1, 1, 1,
-1.223907, 2.057492, 1.054239, 1, 1, 1, 1, 1,
-1.223017, -1.06967, -2.022616, 1, 1, 1, 1, 1,
-1.211019, -0.389636, -1.660737, 1, 1, 1, 1, 1,
-1.210465, -0.03368376, -1.833249, 1, 1, 1, 1, 1,
-1.204031, 2.068295, 1.277565, 1, 1, 1, 1, 1,
-1.187971, 1.972471, -2.958225, 1, 1, 1, 1, 1,
-1.18603, 0.8125622, 0.06012093, 1, 1, 1, 1, 1,
-1.182126, -2.939212, -1.51384, 0, 0, 1, 1, 1,
-1.175291, 0.7781993, -0.5709895, 1, 0, 0, 1, 1,
-1.169188, 0.92002, -1.311321, 1, 0, 0, 1, 1,
-1.168698, 0.5599132, -2.568615, 1, 0, 0, 1, 1,
-1.168188, -0.1003109, -1.38195, 1, 0, 0, 1, 1,
-1.164636, 1.324303, -0.1970162, 1, 0, 0, 1, 1,
-1.161822, 1.069936, -2.350066, 0, 0, 0, 1, 1,
-1.159752, -0.2421964, -2.121979, 0, 0, 0, 1, 1,
-1.155092, -1.485465, -1.123148, 0, 0, 0, 1, 1,
-1.154284, -1.13123, -1.635641, 0, 0, 0, 1, 1,
-1.153211, 0.6218351, -0.822057, 0, 0, 0, 1, 1,
-1.150437, 1.74371, -1.375733, 0, 0, 0, 1, 1,
-1.148414, -0.5424864, -2.80585, 0, 0, 0, 1, 1,
-1.130575, -0.3399552, -1.175769, 1, 1, 1, 1, 1,
-1.128439, 0.1486264, -0.1616403, 1, 1, 1, 1, 1,
-1.126968, 0.5695931, -3.21548, 1, 1, 1, 1, 1,
-1.126939, 0.4200683, -0.5858052, 1, 1, 1, 1, 1,
-1.124146, 0.8616107, -1.832152, 1, 1, 1, 1, 1,
-1.123055, 1.514398, 0.2069468, 1, 1, 1, 1, 1,
-1.122429, -0.03129903, -1.206785, 1, 1, 1, 1, 1,
-1.108884, -0.4046559, -1.057906, 1, 1, 1, 1, 1,
-1.107951, -0.8897475, -3.083625, 1, 1, 1, 1, 1,
-1.105044, 0.1100667, -2.439591, 1, 1, 1, 1, 1,
-1.102688, -0.4067223, -1.989355, 1, 1, 1, 1, 1,
-1.096566, 0.002463837, -1.190649, 1, 1, 1, 1, 1,
-1.087265, 0.4189939, -2.695263, 1, 1, 1, 1, 1,
-1.079063, -0.6204784, -3.158919, 1, 1, 1, 1, 1,
-1.076768, -0.7721376, -1.311642, 1, 1, 1, 1, 1,
-1.073646, -1.06752, -1.652402, 0, 0, 1, 1, 1,
-1.054431, 1.27697, -0.6727527, 1, 0, 0, 1, 1,
-1.053117, 1.946421, -1.173962, 1, 0, 0, 1, 1,
-1.044995, -0.5630231, -2.072674, 1, 0, 0, 1, 1,
-1.040713, 1.852041, -0.1785168, 1, 0, 0, 1, 1,
-1.039637, -0.3564635, -2.262342, 1, 0, 0, 1, 1,
-1.038873, -0.1510818, -1.124821, 0, 0, 0, 1, 1,
-1.036503, -0.1167918, -0.9399791, 0, 0, 0, 1, 1,
-1.034289, -1.214632, -1.827899, 0, 0, 0, 1, 1,
-1.028228, -1.099097, -1.71482, 0, 0, 0, 1, 1,
-1.02308, -0.1611059, -0.8655015, 0, 0, 0, 1, 1,
-1.020964, 0.7327237, 0.2084716, 0, 0, 0, 1, 1,
-1.012476, -0.1575381, -0.5679128, 0, 0, 0, 1, 1,
-1.006413, -0.6273636, -2.29729, 1, 1, 1, 1, 1,
-0.9988309, -0.7067376, -2.162476, 1, 1, 1, 1, 1,
-0.9972488, -1.301932, -1.199239, 1, 1, 1, 1, 1,
-0.9904562, 0.6606714, -1.468129, 1, 1, 1, 1, 1,
-0.9809104, -0.7533622, -2.414633, 1, 1, 1, 1, 1,
-0.9800341, 0.8875473, -1.330547, 1, 1, 1, 1, 1,
-0.9785931, -0.2723057, -1.021984, 1, 1, 1, 1, 1,
-0.9766496, 1.495965, -1.768636, 1, 1, 1, 1, 1,
-0.9706804, -0.2915411, -1.28769, 1, 1, 1, 1, 1,
-0.9665686, 1.295358, -1.103767, 1, 1, 1, 1, 1,
-0.9643721, 1.001545, -0.1582939, 1, 1, 1, 1, 1,
-0.9639302, -1.45515, -3.199344, 1, 1, 1, 1, 1,
-0.9619222, 1.351683, -0.9804458, 1, 1, 1, 1, 1,
-0.9548703, 1.077416, 0.6954026, 1, 1, 1, 1, 1,
-0.9521129, -0.8589932, -1.851669, 1, 1, 1, 1, 1,
-0.9502133, -0.5309416, -4.043599, 0, 0, 1, 1, 1,
-0.9444486, -1.174098, -2.837707, 1, 0, 0, 1, 1,
-0.943805, 2.169576, -0.8821536, 1, 0, 0, 1, 1,
-0.9424543, -0.3456719, -3.029773, 1, 0, 0, 1, 1,
-0.9354978, -0.2750068, -0.2887765, 1, 0, 0, 1, 1,
-0.9253782, -0.4859048, -1.506315, 1, 0, 0, 1, 1,
-0.922384, -1.022846, -4.442721, 0, 0, 0, 1, 1,
-0.9173469, -0.65233, -2.506027, 0, 0, 0, 1, 1,
-0.9141693, -0.7905238, -2.176072, 0, 0, 0, 1, 1,
-0.902607, -1.325554, -2.075191, 0, 0, 0, 1, 1,
-0.8991315, -1.263086, -4.155927, 0, 0, 0, 1, 1,
-0.8981308, 0.7931346, 0.6253332, 0, 0, 0, 1, 1,
-0.8889291, 0.4915842, -1.151491, 0, 0, 0, 1, 1,
-0.883396, 2.208092, 0.03628518, 1, 1, 1, 1, 1,
-0.8817893, -1.065729, -0.4961097, 1, 1, 1, 1, 1,
-0.8760354, -0.36259, -0.7596565, 1, 1, 1, 1, 1,
-0.8747021, 0.8916346, -0.5258179, 1, 1, 1, 1, 1,
-0.8740029, -0.2136919, -1.368147, 1, 1, 1, 1, 1,
-0.8733202, -0.07992665, -0.5359869, 1, 1, 1, 1, 1,
-0.8531801, 0.06291593, 0.3567527, 1, 1, 1, 1, 1,
-0.8388618, -0.9666451, -2.872689, 1, 1, 1, 1, 1,
-0.8383009, -2.058056, -2.586777, 1, 1, 1, 1, 1,
-0.8355583, -0.6979667, -3.309331, 1, 1, 1, 1, 1,
-0.8354281, -0.9602972, -4.094984, 1, 1, 1, 1, 1,
-0.8330199, -0.3938585, -1.04605, 1, 1, 1, 1, 1,
-0.8301349, -0.3248192, -2.779803, 1, 1, 1, 1, 1,
-0.8264039, -0.1863429, -2.040406, 1, 1, 1, 1, 1,
-0.8227799, 0.5845224, -3.603216, 1, 1, 1, 1, 1,
-0.8215494, 1.209447, 1.357378, 0, 0, 1, 1, 1,
-0.8152764, 1.386506, -1.017852, 1, 0, 0, 1, 1,
-0.8134047, 1.921149, -0.06316559, 1, 0, 0, 1, 1,
-0.8110213, 1.268116, -1.08154, 1, 0, 0, 1, 1,
-0.8092688, 0.4073742, -2.438063, 1, 0, 0, 1, 1,
-0.8079875, -0.5551786, -2.387995, 1, 0, 0, 1, 1,
-0.8046906, -0.2054266, -0.970723, 0, 0, 0, 1, 1,
-0.8015352, 0.1721126, -0.9246652, 0, 0, 0, 1, 1,
-0.8008527, 0.6609514, -1.242488, 0, 0, 0, 1, 1,
-0.797338, -0.1493575, -0.8666827, 0, 0, 0, 1, 1,
-0.7884542, -1.082816, -3.049752, 0, 0, 0, 1, 1,
-0.7839006, 0.001456345, -2.373514, 0, 0, 0, 1, 1,
-0.77265, -0.2416126, -0.006212375, 0, 0, 0, 1, 1,
-0.7712906, 1.215102, 1.13883, 1, 1, 1, 1, 1,
-0.7704563, -0.4925266, -2.826871, 1, 1, 1, 1, 1,
-0.7702738, 1.762812, -1.256513, 1, 1, 1, 1, 1,
-0.7701318, -0.5841137, -2.98194, 1, 1, 1, 1, 1,
-0.7635507, 0.7529669, 0.2028022, 1, 1, 1, 1, 1,
-0.7626252, -0.1924362, -0.6788095, 1, 1, 1, 1, 1,
-0.7610399, -0.3653102, -3.650272, 1, 1, 1, 1, 1,
-0.754761, -0.978859, -0.850497, 1, 1, 1, 1, 1,
-0.7542309, 0.192332, -0.0360222, 1, 1, 1, 1, 1,
-0.7521083, -0.959917, -2.608984, 1, 1, 1, 1, 1,
-0.7518736, 0.8544469, -1.095862, 1, 1, 1, 1, 1,
-0.7510616, 1.084808, -1.680349, 1, 1, 1, 1, 1,
-0.7445784, -0.6597273, -2.097254, 1, 1, 1, 1, 1,
-0.7412248, -1.378, -3.918324, 1, 1, 1, 1, 1,
-0.7401963, 1.531939, -1.499854, 1, 1, 1, 1, 1,
-0.736226, 0.9350249, 1.218999, 0, 0, 1, 1, 1,
-0.735086, -1.032425, -0.7830549, 1, 0, 0, 1, 1,
-0.7267537, 0.7935491, -1.130008, 1, 0, 0, 1, 1,
-0.7247615, 0.4910237, -0.6057463, 1, 0, 0, 1, 1,
-0.7215688, -0.611159, -2.521059, 1, 0, 0, 1, 1,
-0.7208041, 0.6862077, -0.2170486, 1, 0, 0, 1, 1,
-0.7175246, -0.6957729, -0.2526042, 0, 0, 0, 1, 1,
-0.7126151, -0.8622154, -3.90517, 0, 0, 0, 1, 1,
-0.7098989, 0.03909958, -0.5787311, 0, 0, 0, 1, 1,
-0.7065596, 1.833043, -0.8336729, 0, 0, 0, 1, 1,
-0.7021413, 0.6915361, -0.4330874, 0, 0, 0, 1, 1,
-0.7011999, 1.050228, -1.410176, 0, 0, 0, 1, 1,
-0.7010511, 0.7075731, 0.390805, 0, 0, 0, 1, 1,
-0.6891039, -0.8180563, -1.667108, 1, 1, 1, 1, 1,
-0.6867324, -0.3773486, -4.010181, 1, 1, 1, 1, 1,
-0.686297, 0.02445973, -1.446232, 1, 1, 1, 1, 1,
-0.6695962, -1.345919, -2.529741, 1, 1, 1, 1, 1,
-0.6691623, 2.052207, -0.4064414, 1, 1, 1, 1, 1,
-0.6687555, -0.02431815, -0.4208416, 1, 1, 1, 1, 1,
-0.6594049, 0.395888, 0.3321274, 1, 1, 1, 1, 1,
-0.6587868, 0.2537423, -1.134464, 1, 1, 1, 1, 1,
-0.6569455, 1.06265, 0.9341387, 1, 1, 1, 1, 1,
-0.65661, -1.849517, -3.56255, 1, 1, 1, 1, 1,
-0.6566092, -0.3559918, -0.8113197, 1, 1, 1, 1, 1,
-0.6522956, -0.189227, -1.622896, 1, 1, 1, 1, 1,
-0.6522773, -0.2028996, -2.601543, 1, 1, 1, 1, 1,
-0.6454754, -0.6001246, -1.986933, 1, 1, 1, 1, 1,
-0.6440488, -0.6673145, -2.375675, 1, 1, 1, 1, 1,
-0.6406488, -0.1153321, -2.551214, 0, 0, 1, 1, 1,
-0.6377284, 1.157124, 0.5754189, 1, 0, 0, 1, 1,
-0.6359124, 1.927724, -1.005971, 1, 0, 0, 1, 1,
-0.6357116, -0.07272116, -2.88964, 1, 0, 0, 1, 1,
-0.633058, -1.147854, -2.198539, 1, 0, 0, 1, 1,
-0.6282983, -0.03743189, -2.958235, 1, 0, 0, 1, 1,
-0.6233275, 2.092141, -1.379283, 0, 0, 0, 1, 1,
-0.6230572, 0.01521189, -3.091576, 0, 0, 0, 1, 1,
-0.6189352, 0.4518323, -0.8259516, 0, 0, 0, 1, 1,
-0.6170756, -0.6715195, -3.291632, 0, 0, 0, 1, 1,
-0.6163197, -0.1524451, -3.05273, 0, 0, 0, 1, 1,
-0.6131957, 0.9463924, -0.9394846, 0, 0, 0, 1, 1,
-0.6121674, -1.015912, -3.470141, 0, 0, 0, 1, 1,
-0.6119472, -1.208195, -0.03746223, 1, 1, 1, 1, 1,
-0.6104972, -0.4632735, -1.203106, 1, 1, 1, 1, 1,
-0.6059004, -1.000365, -2.246053, 1, 1, 1, 1, 1,
-0.602749, -0.6590184, -3.381007, 1, 1, 1, 1, 1,
-0.5987595, -0.4577273, -0.4072243, 1, 1, 1, 1, 1,
-0.5976898, -0.8858513, -2.868417, 1, 1, 1, 1, 1,
-0.5976117, 0.9452547, -0.5265517, 1, 1, 1, 1, 1,
-0.5901247, -0.1520369, -1.957089, 1, 1, 1, 1, 1,
-0.5899782, -0.4057207, -1.429978, 1, 1, 1, 1, 1,
-0.5860489, -1.039279, -3.319032, 1, 1, 1, 1, 1,
-0.5852088, -0.6853549, -2.110972, 1, 1, 1, 1, 1,
-0.5843936, -0.3575889, -0.3788943, 1, 1, 1, 1, 1,
-0.5808823, -1.237626, -4.172671, 1, 1, 1, 1, 1,
-0.5788977, -0.2800575, -2.441499, 1, 1, 1, 1, 1,
-0.5779523, -0.8903795, -2.857381, 1, 1, 1, 1, 1,
-0.5768136, 0.9572999, -0.2866815, 0, 0, 1, 1, 1,
-0.5736063, -0.5129002, -2.166735, 1, 0, 0, 1, 1,
-0.5658036, -1.301915, -3.589278, 1, 0, 0, 1, 1,
-0.5627378, -0.8561048, -2.491371, 1, 0, 0, 1, 1,
-0.5562531, 0.4031891, -1.85316, 1, 0, 0, 1, 1,
-0.5534875, 0.03974705, -3.234325, 1, 0, 0, 1, 1,
-0.5440605, -0.09776725, -1.617187, 0, 0, 0, 1, 1,
-0.5433526, 1.331502, -1.419889, 0, 0, 0, 1, 1,
-0.5408629, 0.003186959, -2.176408, 0, 0, 0, 1, 1,
-0.5361246, 2.139742, -0.4748071, 0, 0, 0, 1, 1,
-0.5312523, -1.754562, -3.410549, 0, 0, 0, 1, 1,
-0.5308651, -0.3513686, -2.144962, 0, 0, 0, 1, 1,
-0.5284752, -0.5880464, -3.328551, 0, 0, 0, 1, 1,
-0.5279595, -0.4936182, -1.71319, 1, 1, 1, 1, 1,
-0.5227569, 2.43067, -1.654743, 1, 1, 1, 1, 1,
-0.5172946, 1.803566, -1.674196, 1, 1, 1, 1, 1,
-0.5159429, -0.9346986, -2.219527, 1, 1, 1, 1, 1,
-0.510758, -0.1938958, -1.820321, 1, 1, 1, 1, 1,
-0.5099983, -0.5135075, -1.204633, 1, 1, 1, 1, 1,
-0.5081415, -1.175972, -3.45239, 1, 1, 1, 1, 1,
-0.5067154, 0.4038843, -2.68181, 1, 1, 1, 1, 1,
-0.5053453, -1.387421, -2.583931, 1, 1, 1, 1, 1,
-0.5023754, 2.214438, 0.3454016, 1, 1, 1, 1, 1,
-0.5022787, 0.9622216, -1.092223, 1, 1, 1, 1, 1,
-0.4987706, -0.8258536, -3.710712, 1, 1, 1, 1, 1,
-0.493806, 0.1701023, -2.323861, 1, 1, 1, 1, 1,
-0.4927374, -0.1983945, -1.535371, 1, 1, 1, 1, 1,
-0.4898973, -0.7074348, -2.488008, 1, 1, 1, 1, 1,
-0.4866018, 0.2428648, -0.02881229, 0, 0, 1, 1, 1,
-0.4818712, 1.452215, 0.5796126, 1, 0, 0, 1, 1,
-0.4795262, 0.3534717, -1.666339, 1, 0, 0, 1, 1,
-0.4787437, 0.1360136, -1.785254, 1, 0, 0, 1, 1,
-0.4762255, -1.711404, -3.502923, 1, 0, 0, 1, 1,
-0.47356, 1.084677, 0.9646161, 1, 0, 0, 1, 1,
-0.472914, 0.7700661, -0.8327895, 0, 0, 0, 1, 1,
-0.4602737, 0.9726228, -0.07600239, 0, 0, 0, 1, 1,
-0.4591838, -1.649888, -2.393641, 0, 0, 0, 1, 1,
-0.4589855, 0.0325437, -1.824352, 0, 0, 0, 1, 1,
-0.4581716, 0.1395669, -1.218322, 0, 0, 0, 1, 1,
-0.4564247, -2.151155, -4.458978, 0, 0, 0, 1, 1,
-0.4531387, -0.8351297, -4.348763, 0, 0, 0, 1, 1,
-0.4485079, 0.9798527, -0.05110193, 1, 1, 1, 1, 1,
-0.4483635, 0.611153, -3.265142, 1, 1, 1, 1, 1,
-0.4478461, -1.046512, -4.647986, 1, 1, 1, 1, 1,
-0.4434693, -1.07821, -2.719077, 1, 1, 1, 1, 1,
-0.4346379, -0.3813087, -1.861732, 1, 1, 1, 1, 1,
-0.4282324, -0.2339513, -2.684705, 1, 1, 1, 1, 1,
-0.4264409, -1.549581, -3.23876, 1, 1, 1, 1, 1,
-0.4243501, -0.6728767, -2.369365, 1, 1, 1, 1, 1,
-0.4230905, 1.460825, 1.372572, 1, 1, 1, 1, 1,
-0.421699, -0.66104, -3.547666, 1, 1, 1, 1, 1,
-0.4181581, 0.7435333, 1.107903, 1, 1, 1, 1, 1,
-0.4176476, -0.1690075, -1.223955, 1, 1, 1, 1, 1,
-0.4146642, -1.027736, -1.702045, 1, 1, 1, 1, 1,
-0.4119161, -0.426186, -2.241491, 1, 1, 1, 1, 1,
-0.4116607, 0.9073622, -0.8056167, 1, 1, 1, 1, 1,
-0.4095608, 1.991266, 0.6480386, 0, 0, 1, 1, 1,
-0.4091934, -0.1047169, -1.073559, 1, 0, 0, 1, 1,
-0.4085381, -1.00903, -1.469242, 1, 0, 0, 1, 1,
-0.4054542, -0.7147135, -1.577488, 1, 0, 0, 1, 1,
-0.4041384, 1.184763, 1.156475, 1, 0, 0, 1, 1,
-0.4024045, -1.445164, -0.6773981, 1, 0, 0, 1, 1,
-0.3954182, -0.4916843, -1.48674, 0, 0, 0, 1, 1,
-0.3908199, -0.8807107, -0.7188067, 0, 0, 0, 1, 1,
-0.3847987, 1.205365, -2.076399, 0, 0, 0, 1, 1,
-0.3813906, 0.8998182, -1.608913, 0, 0, 0, 1, 1,
-0.3804962, -1.182391, -1.495505, 0, 0, 0, 1, 1,
-0.3804186, 0.815843, -0.7919667, 0, 0, 0, 1, 1,
-0.3791114, -0.7291702, -2.721041, 0, 0, 0, 1, 1,
-0.3715242, -1.839266, -4.817883, 1, 1, 1, 1, 1,
-0.3706273, -0.1742216, -0.9693946, 1, 1, 1, 1, 1,
-0.3656017, 2.204829, -0.9408621, 1, 1, 1, 1, 1,
-0.3641359, -0.5090123, -1.033734, 1, 1, 1, 1, 1,
-0.3608477, -0.3070898, -3.788187, 1, 1, 1, 1, 1,
-0.3583241, -0.05875312, -1.151944, 1, 1, 1, 1, 1,
-0.3577261, 0.1991773, -0.5590485, 1, 1, 1, 1, 1,
-0.3520602, 0.6561389, 1.317487, 1, 1, 1, 1, 1,
-0.3472151, -1.266636, -2.657847, 1, 1, 1, 1, 1,
-0.3460484, 0.8549737, 0.1827796, 1, 1, 1, 1, 1,
-0.3398535, -1.105077, -2.57228, 1, 1, 1, 1, 1,
-0.3372155, -0.6135554, -2.67708, 1, 1, 1, 1, 1,
-0.3361848, -0.1152962, -3.290817, 1, 1, 1, 1, 1,
-0.3342521, 1.203619, 1.615338, 1, 1, 1, 1, 1,
-0.3332644, 1.516928, -0.3860097, 1, 1, 1, 1, 1,
-0.3220261, -0.4521426, -2.732507, 0, 0, 1, 1, 1,
-0.3175148, 0.9460701, 0.01810444, 1, 0, 0, 1, 1,
-0.3167928, -0.5463501, -2.777813, 1, 0, 0, 1, 1,
-0.3149436, 0.4857873, -0.9692684, 1, 0, 0, 1, 1,
-0.3130641, 0.3715951, -1.532264, 1, 0, 0, 1, 1,
-0.3129314, 0.9519259, -1.294771, 1, 0, 0, 1, 1,
-0.3057211, 1.16167, 0.6429183, 0, 0, 0, 1, 1,
-0.3055913, 0.006722767, 0.4274333, 0, 0, 0, 1, 1,
-0.3042402, 0.02576953, -2.225222, 0, 0, 0, 1, 1,
-0.3037843, 1.106219, 0.6827736, 0, 0, 0, 1, 1,
-0.3027133, 0.3191807, 0.4776749, 0, 0, 0, 1, 1,
-0.3020387, -0.5651635, -1.745818, 0, 0, 0, 1, 1,
-0.2976675, 0.7123783, -0.08339403, 0, 0, 0, 1, 1,
-0.2940149, -0.7478914, -2.886476, 1, 1, 1, 1, 1,
-0.2939994, -0.01849883, -3.01158, 1, 1, 1, 1, 1,
-0.2937377, -0.7403066, -3.469877, 1, 1, 1, 1, 1,
-0.2861633, 1.044335, 0.8615702, 1, 1, 1, 1, 1,
-0.2861323, -0.2407274, -2.482647, 1, 1, 1, 1, 1,
-0.2829374, 1.370005, -1.38708, 1, 1, 1, 1, 1,
-0.273078, 0.8422898, -1.517436, 1, 1, 1, 1, 1,
-0.272455, -1.591888, -1.264948, 1, 1, 1, 1, 1,
-0.2722506, 0.7298399, -0.001233804, 1, 1, 1, 1, 1,
-0.2695952, 2.93314, -0.4742266, 1, 1, 1, 1, 1,
-0.2685389, -0.3076319, -2.145664, 1, 1, 1, 1, 1,
-0.2665626, 0.1025331, -1.005692, 1, 1, 1, 1, 1,
-0.2630602, 0.6511563, -0.03722842, 1, 1, 1, 1, 1,
-0.260316, 0.6717078, -0.6685807, 1, 1, 1, 1, 1,
-0.25928, -0.1769061, -1.809802, 1, 1, 1, 1, 1,
-0.2549126, -1.051839, -2.000102, 0, 0, 1, 1, 1,
-0.2537477, -1.240682, -3.551136, 1, 0, 0, 1, 1,
-0.2473725, 0.9314908, -1.520561, 1, 0, 0, 1, 1,
-0.2416803, 0.7404534, -1.486699, 1, 0, 0, 1, 1,
-0.2351521, -0.5190509, -4.037766, 1, 0, 0, 1, 1,
-0.2299599, -0.1997232, -2.910938, 1, 0, 0, 1, 1,
-0.2292889, -0.8581337, -1.6461, 0, 0, 0, 1, 1,
-0.2284502, 1.859972, 1.500832, 0, 0, 0, 1, 1,
-0.2273204, 0.5192147, 0.2913632, 0, 0, 0, 1, 1,
-0.2224381, 1.175935, 0.8918971, 0, 0, 0, 1, 1,
-0.2223805, 1.001597, 1.213265, 0, 0, 0, 1, 1,
-0.2216796, -0.4252343, -0.8056675, 0, 0, 0, 1, 1,
-0.2215563, -1.33856, -4.241956, 0, 0, 0, 1, 1,
-0.2185996, -0.7048656, -4.500154, 1, 1, 1, 1, 1,
-0.2161594, -0.03609098, -2.827566, 1, 1, 1, 1, 1,
-0.2158492, -0.6286002, -4.814914, 1, 1, 1, 1, 1,
-0.2143053, 0.6259184, 0.4088128, 1, 1, 1, 1, 1,
-0.214099, -1.002046, -4.954406, 1, 1, 1, 1, 1,
-0.2106512, -1.568806, -2.958792, 1, 1, 1, 1, 1,
-0.2090897, 0.9224824, -0.7587312, 1, 1, 1, 1, 1,
-0.2056329, 0.3320417, -1.208388, 1, 1, 1, 1, 1,
-0.2029002, -0.1161008, -1.459924, 1, 1, 1, 1, 1,
-0.2015956, 0.06326112, -2.023524, 1, 1, 1, 1, 1,
-0.2006929, 0.4687346, -1.293292, 1, 1, 1, 1, 1,
-0.1999188, -0.2114287, -4.019328, 1, 1, 1, 1, 1,
-0.1950872, 0.1753585, -1.080394, 1, 1, 1, 1, 1,
-0.1945398, 0.4466006, 0.4159273, 1, 1, 1, 1, 1,
-0.1939839, -0.7779857, -4.499309, 1, 1, 1, 1, 1,
-0.189878, -1.801947, -1.604507, 0, 0, 1, 1, 1,
-0.1827447, -0.7390088, -3.181585, 1, 0, 0, 1, 1,
-0.1804621, 0.5657836, -0.0336054, 1, 0, 0, 1, 1,
-0.1803253, -1.227416, -2.851234, 1, 0, 0, 1, 1,
-0.176515, -0.957938, -2.444509, 1, 0, 0, 1, 1,
-0.1744309, -0.2128455, -1.565655, 1, 0, 0, 1, 1,
-0.1727594, -0.1835252, -2.036259, 0, 0, 0, 1, 1,
-0.1679017, -1.468353, -0.984019, 0, 0, 0, 1, 1,
-0.1656186, 0.102931, -1.156032, 0, 0, 0, 1, 1,
-0.1655378, -0.6612165, -1.545524, 0, 0, 0, 1, 1,
-0.1635976, -1.548022, -1.662693, 0, 0, 0, 1, 1,
-0.1628338, 1.450545, 0.5650451, 0, 0, 0, 1, 1,
-0.161513, 0.09062483, -1.353842, 0, 0, 0, 1, 1,
-0.1594067, -0.8456881, -2.546421, 1, 1, 1, 1, 1,
-0.1582909, -1.005186, -2.142012, 1, 1, 1, 1, 1,
-0.1568152, -0.2237221, -3.732293, 1, 1, 1, 1, 1,
-0.1527032, -0.2255729, -3.039708, 1, 1, 1, 1, 1,
-0.1521061, 0.002809592, -2.216655, 1, 1, 1, 1, 1,
-0.1482391, -0.3049549, -2.604243, 1, 1, 1, 1, 1,
-0.1456643, 0.1744234, -2.617438, 1, 1, 1, 1, 1,
-0.1452826, 0.3493971, -0.5309823, 1, 1, 1, 1, 1,
-0.1448144, -0.3409358, -2.888268, 1, 1, 1, 1, 1,
-0.1445439, -0.3517971, -2.328036, 1, 1, 1, 1, 1,
-0.1411428, 0.6973333, 0.6283332, 1, 1, 1, 1, 1,
-0.1400165, -0.2241329, -1.558721, 1, 1, 1, 1, 1,
-0.1378327, 0.4855572, 0.09960204, 1, 1, 1, 1, 1,
-0.1282038, -0.2233178, -3.087029, 1, 1, 1, 1, 1,
-0.127678, 1.54715, 0.08917045, 1, 1, 1, 1, 1,
-0.1273622, -1.851213, -3.737395, 0, 0, 1, 1, 1,
-0.1268827, 0.4067563, -0.3090875, 1, 0, 0, 1, 1,
-0.1227213, 0.4640976, -0.3103461, 1, 0, 0, 1, 1,
-0.1225546, 1.464722, -0.8986604, 1, 0, 0, 1, 1,
-0.1220682, 1.519418, 0.04230552, 1, 0, 0, 1, 1,
-0.1164059, 1.456867, 1.8328, 1, 0, 0, 1, 1,
-0.114182, 0.626894, -1.774501, 0, 0, 0, 1, 1,
-0.112556, 0.05405009, -2.185346, 0, 0, 0, 1, 1,
-0.1120412, 0.1760275, -1.433812, 0, 0, 0, 1, 1,
-0.1068337, -0.05333666, -2.530189, 0, 0, 0, 1, 1,
-0.1062794, 1.056814, 2.323562, 0, 0, 0, 1, 1,
-0.09971061, -0.6481693, -3.078856, 0, 0, 0, 1, 1,
-0.0995775, 1.425219, 0.352083, 0, 0, 0, 1, 1,
-0.09878002, -0.1586532, -1.280025, 1, 1, 1, 1, 1,
-0.09754008, -0.3658573, -3.951399, 1, 1, 1, 1, 1,
-0.09310517, 1.453958, -0.8009436, 1, 1, 1, 1, 1,
-0.09269118, -1.757549, -4.682621, 1, 1, 1, 1, 1,
-0.09030413, 1.714703, -0.1569177, 1, 1, 1, 1, 1,
-0.08951046, -0.05223462, -1.539051, 1, 1, 1, 1, 1,
-0.08917705, 0.5287122, -0.6508563, 1, 1, 1, 1, 1,
-0.08779731, 1.388459, -0.1258246, 1, 1, 1, 1, 1,
-0.08498368, -0.4190129, -1.705392, 1, 1, 1, 1, 1,
-0.07877212, 1.204334, -1.911224, 1, 1, 1, 1, 1,
-0.07606331, 1.816405, 0.5786309, 1, 1, 1, 1, 1,
-0.07556311, 0.7760295, -1.828089, 1, 1, 1, 1, 1,
-0.0742218, -0.1194032, -1.544796, 1, 1, 1, 1, 1,
-0.07041537, 0.2042451, -1.789055, 1, 1, 1, 1, 1,
-0.0700818, 1.254253, -0.8120375, 1, 1, 1, 1, 1,
-0.0691692, -0.7989301, -3.574877, 0, 0, 1, 1, 1,
-0.06868494, 0.3917079, 0.9702539, 1, 0, 0, 1, 1,
-0.06484265, -2.089114, -0.7189639, 1, 0, 0, 1, 1,
-0.06159073, 1.043418, -1.030013, 1, 0, 0, 1, 1,
-0.0601167, -1.852456, -2.764413, 1, 0, 0, 1, 1,
-0.05965469, -2.267502, -2.60275, 1, 0, 0, 1, 1,
-0.05702245, 1.301916, -0.6460202, 0, 0, 0, 1, 1,
-0.05261385, 2.078671, 2.328002, 0, 0, 0, 1, 1,
-0.04645527, -1.581596, -6.105251, 0, 0, 0, 1, 1,
-0.04564733, -1.636401, -2.364268, 0, 0, 0, 1, 1,
-0.0420035, 0.48098, -0.2757372, 0, 0, 0, 1, 1,
-0.04058941, -1.097485, -1.53402, 0, 0, 0, 1, 1,
-0.04046055, -0.1675589, -3.475564, 0, 0, 0, 1, 1,
-0.03906885, 1.180779, 2.454776, 1, 1, 1, 1, 1,
-0.0389029, -1.980598, -2.861583, 1, 1, 1, 1, 1,
-0.0384073, 1.174655, -0.2122533, 1, 1, 1, 1, 1,
-0.03747915, -0.02173994, -3.463271, 1, 1, 1, 1, 1,
-0.03493311, -2.564741, -2.77759, 1, 1, 1, 1, 1,
-0.03416501, -1.533215, -4.738451, 1, 1, 1, 1, 1,
-0.03257924, 1.51338, -0.2424707, 1, 1, 1, 1, 1,
-0.03071943, -0.7380784, -2.536413, 1, 1, 1, 1, 1,
-0.02802546, -0.09376463, -1.163848, 1, 1, 1, 1, 1,
-0.02598351, 0.2700007, -1.104786, 1, 1, 1, 1, 1,
-0.02508492, 0.1757759, -1.6, 1, 1, 1, 1, 1,
-0.02459307, 0.2409106, -1.928009, 1, 1, 1, 1, 1,
-0.01888995, 0.2000989, -0.06248903, 1, 1, 1, 1, 1,
-0.01008354, -0.9841493, -5.127465, 1, 1, 1, 1, 1,
-0.009612191, 0.3609499, -0.4809842, 1, 1, 1, 1, 1,
-0.00843959, -0.7171134, -3.149984, 0, 0, 1, 1, 1,
-0.003465998, -0.2948028, -2.766614, 1, 0, 0, 1, 1,
0.003154716, -0.9111204, 3.373808, 1, 0, 0, 1, 1,
0.003649701, -0.9771653, 3.157685, 1, 0, 0, 1, 1,
0.004205154, -0.4820654, 4.464026, 1, 0, 0, 1, 1,
0.005547094, 0.1961724, 1.020592, 1, 0, 0, 1, 1,
0.01037069, -0.3947719, 3.789946, 0, 0, 0, 1, 1,
0.01221551, 0.5799527, 0.6383349, 0, 0, 0, 1, 1,
0.01543386, -0.4125917, 3.348098, 0, 0, 0, 1, 1,
0.01808424, -2.393713, 3.969898, 0, 0, 0, 1, 1,
0.01937462, -0.4276136, 2.417044, 0, 0, 0, 1, 1,
0.02094898, -0.02786569, 3.312954, 0, 0, 0, 1, 1,
0.0237981, -0.8787118, 0.0002772473, 0, 0, 0, 1, 1,
0.02751375, -0.08394355, 3.368162, 1, 1, 1, 1, 1,
0.02775619, -1.397062, 2.800732, 1, 1, 1, 1, 1,
0.02982147, 1.248949, -0.1464847, 1, 1, 1, 1, 1,
0.034389, -0.5723715, 3.885188, 1, 1, 1, 1, 1,
0.03543095, -0.7783563, 4.270972, 1, 1, 1, 1, 1,
0.03559403, 0.234839, -0.1639013, 1, 1, 1, 1, 1,
0.03660364, 1.254543, -0.4670008, 1, 1, 1, 1, 1,
0.03681183, 1.209755, -0.524937, 1, 1, 1, 1, 1,
0.03764473, -0.0817794, 3.116087, 1, 1, 1, 1, 1,
0.03855726, -0.9804718, 3.418406, 1, 1, 1, 1, 1,
0.04532665, -1.707631, 3.051301, 1, 1, 1, 1, 1,
0.04554432, 1.171321, -0.4487618, 1, 1, 1, 1, 1,
0.05107742, 0.7314466, -0.6330836, 1, 1, 1, 1, 1,
0.0512646, -0.8130285, 3.583266, 1, 1, 1, 1, 1,
0.05232257, 1.5453, -0.5083035, 1, 1, 1, 1, 1,
0.0548105, -0.975105, 2.709599, 0, 0, 1, 1, 1,
0.05825216, -0.6219719, 2.942372, 1, 0, 0, 1, 1,
0.06177137, 0.3453555, -0.4729604, 1, 0, 0, 1, 1,
0.06489144, 0.02920145, 1.879156, 1, 0, 0, 1, 1,
0.06584024, 1.039316, -0.1833827, 1, 0, 0, 1, 1,
0.06688113, 0.3128624, 2.071881, 1, 0, 0, 1, 1,
0.07141433, 1.25711, 1.342099, 0, 0, 0, 1, 1,
0.07397306, -0.7440835, 3.583937, 0, 0, 0, 1, 1,
0.0748226, 0.6988938, -1.659716, 0, 0, 0, 1, 1,
0.07740735, -0.7970207, 3.210664, 0, 0, 0, 1, 1,
0.07744192, 0.5927345, 1.220195, 0, 0, 0, 1, 1,
0.08767862, 0.1709252, -0.2131407, 0, 0, 0, 1, 1,
0.089806, 0.091111, 0.05814752, 0, 0, 0, 1, 1,
0.09037081, 0.4507554, 0.6235955, 1, 1, 1, 1, 1,
0.09670992, 0.5568267, -0.3042377, 1, 1, 1, 1, 1,
0.09864585, 1.849636, 1.546411, 1, 1, 1, 1, 1,
0.1006781, -0.003609633, 1.974401, 1, 1, 1, 1, 1,
0.1010845, 1.057106, -1.426199, 1, 1, 1, 1, 1,
0.1014911, 1.721884, 1.510125, 1, 1, 1, 1, 1,
0.1015223, -0.502142, 2.567282, 1, 1, 1, 1, 1,
0.1042651, -1.630346, 3.506033, 1, 1, 1, 1, 1,
0.1044747, -0.6417929, 2.755072, 1, 1, 1, 1, 1,
0.1107102, 0.1523856, 2.359417, 1, 1, 1, 1, 1,
0.1107935, 1.601799, 0.8250343, 1, 1, 1, 1, 1,
0.1118773, -0.4768305, 4.704262, 1, 1, 1, 1, 1,
0.1158572, 0.5632986, 2.479674, 1, 1, 1, 1, 1,
0.1203791, 0.6601455, 0.7346244, 1, 1, 1, 1, 1,
0.1252677, -0.7097463, 4.514646, 1, 1, 1, 1, 1,
0.129776, 1.488403, 2.296588, 0, 0, 1, 1, 1,
0.1398736, 1.083946, -0.4102325, 1, 0, 0, 1, 1,
0.1402071, 0.2168437, 0.6454413, 1, 0, 0, 1, 1,
0.1414259, -0.1713784, 1.732483, 1, 0, 0, 1, 1,
0.1436649, 1.417381, -0.1418465, 1, 0, 0, 1, 1,
0.1436878, 0.3181447, 2.16606, 1, 0, 0, 1, 1,
0.1445599, 0.5774246, 0.02092678, 0, 0, 0, 1, 1,
0.1450387, -0.7091874, 2.53637, 0, 0, 0, 1, 1,
0.1452775, 1.428949, 1.073095, 0, 0, 0, 1, 1,
0.1454311, -0.7070135, 1.967244, 0, 0, 0, 1, 1,
0.1466011, -0.2598033, 2.045799, 0, 0, 0, 1, 1,
0.1503297, 1.41369, 0.6711904, 0, 0, 0, 1, 1,
0.1601986, 0.5233159, -0.5674454, 0, 0, 0, 1, 1,
0.1611236, 1.362743, 0.7043051, 1, 1, 1, 1, 1,
0.1618297, 0.9861176, -2.321926, 1, 1, 1, 1, 1,
0.1658242, -0.3893372, 2.393537, 1, 1, 1, 1, 1,
0.168593, -0.9038787, 2.719783, 1, 1, 1, 1, 1,
0.1717792, 0.6379042, 1.199368, 1, 1, 1, 1, 1,
0.172762, 2.054887, 0.4865943, 1, 1, 1, 1, 1,
0.1755122, 0.1515711, 1.293245, 1, 1, 1, 1, 1,
0.1795604, 0.8123598, -0.8633858, 1, 1, 1, 1, 1,
0.183493, -1.908811, 3.223622, 1, 1, 1, 1, 1,
0.1856547, 2.080266, 2.210689, 1, 1, 1, 1, 1,
0.1905529, 0.001095554, 0.2257639, 1, 1, 1, 1, 1,
0.1910143, 0.4424273, -0.9239379, 1, 1, 1, 1, 1,
0.1920364, 0.3394241, -0.3829885, 1, 1, 1, 1, 1,
0.1929747, -0.9126614, 0.7501852, 1, 1, 1, 1, 1,
0.1975079, -0.6998932, 2.925797, 1, 1, 1, 1, 1,
0.2041003, -1.74648, 3.253523, 0, 0, 1, 1, 1,
0.207463, 0.04910989, 2.102326, 1, 0, 0, 1, 1,
0.2075252, -0.07481626, 0.4265463, 1, 0, 0, 1, 1,
0.2118392, 1.239334, 0.9296098, 1, 0, 0, 1, 1,
0.2121578, -0.5233818, 1.845292, 1, 0, 0, 1, 1,
0.2127271, -1.409405, 1.488252, 1, 0, 0, 1, 1,
0.2157126, 1.598808, -1.503614, 0, 0, 0, 1, 1,
0.2201058, -1.192348, 2.479849, 0, 0, 0, 1, 1,
0.2206734, -0.3501722, 4.127964, 0, 0, 0, 1, 1,
0.221181, -0.7130072, 3.721341, 0, 0, 0, 1, 1,
0.2241121, 0.7989469, 1.801648, 0, 0, 0, 1, 1,
0.2251116, 1.505186, -0.1452486, 0, 0, 0, 1, 1,
0.2293719, -0.1388383, 2.507634, 0, 0, 0, 1, 1,
0.2333046, -0.5653995, 2.027709, 1, 1, 1, 1, 1,
0.2442168, 0.5143608, 1.521885, 1, 1, 1, 1, 1,
0.2464392, 0.519033, 0.9935953, 1, 1, 1, 1, 1,
0.2476759, -0.4209326, 5.175949, 1, 1, 1, 1, 1,
0.2539646, -1.27284, 4.292615, 1, 1, 1, 1, 1,
0.2558084, 0.8797185, 0.836095, 1, 1, 1, 1, 1,
0.2627468, 1.173274, -0.2870442, 1, 1, 1, 1, 1,
0.2655146, -0.09415416, 1.46631, 1, 1, 1, 1, 1,
0.2661293, 2.136586, -0.9395546, 1, 1, 1, 1, 1,
0.2687481, -1.481812, 4.20784, 1, 1, 1, 1, 1,
0.270178, 1.422748, 0.09608342, 1, 1, 1, 1, 1,
0.2714087, 0.5189266, 1.576056, 1, 1, 1, 1, 1,
0.2736118, 2.147438, 0.4681137, 1, 1, 1, 1, 1,
0.2758605, -0.4810271, 2.607054, 1, 1, 1, 1, 1,
0.2766558, -0.1138868, 1.31887, 1, 1, 1, 1, 1,
0.27841, -3.265388, 3.904764, 0, 0, 1, 1, 1,
0.2788311, 0.3922706, 1.124101, 1, 0, 0, 1, 1,
0.2855689, 2.214061, -0.8845108, 1, 0, 0, 1, 1,
0.2883642, -0.6811984, 2.708482, 1, 0, 0, 1, 1,
0.2905054, -0.9761738, 3.346151, 1, 0, 0, 1, 1,
0.2916572, -0.1504686, 2.946181, 1, 0, 0, 1, 1,
0.2919622, -0.511635, 0.4707227, 0, 0, 0, 1, 1,
0.2930164, -0.5075414, 3.737143, 0, 0, 0, 1, 1,
0.3034216, 0.229372, 0.2511374, 0, 0, 0, 1, 1,
0.3034257, 0.5744571, 2.509527, 0, 0, 0, 1, 1,
0.3077166, 0.07305074, 3.063415, 0, 0, 0, 1, 1,
0.3080787, -0.4992615, 3.454405, 0, 0, 0, 1, 1,
0.3088589, 0.3023781, 1.17062, 0, 0, 0, 1, 1,
0.3127886, -0.7674693, 2.34317, 1, 1, 1, 1, 1,
0.3150596, 0.1874867, 3.647208, 1, 1, 1, 1, 1,
0.3163295, 0.01186017, 1.952136, 1, 1, 1, 1, 1,
0.3215104, 1.287143, 0.8625696, 1, 1, 1, 1, 1,
0.3219023, -0.2078405, 1.690807, 1, 1, 1, 1, 1,
0.3240466, 1.040173, -1.702428, 1, 1, 1, 1, 1,
0.3255214, -0.3717536, 1.368746, 1, 1, 1, 1, 1,
0.3265499, 0.8641881, 0.3633596, 1, 1, 1, 1, 1,
0.3327735, -1.208944, 2.863684, 1, 1, 1, 1, 1,
0.3341121, -0.8624026, 1.439551, 1, 1, 1, 1, 1,
0.3348904, 0.2501816, -1.250041, 1, 1, 1, 1, 1,
0.334991, -0.3341666, 3.54343, 1, 1, 1, 1, 1,
0.3379795, 0.4109525, 0.3219455, 1, 1, 1, 1, 1,
0.3413407, -0.3489425, 1.500462, 1, 1, 1, 1, 1,
0.3427632, -1.289316, 1.457111, 1, 1, 1, 1, 1,
0.3477091, 1.165535, 0.7409186, 0, 0, 1, 1, 1,
0.3488076, 0.1213098, -0.8485519, 1, 0, 0, 1, 1,
0.3528102, 1.593513, -0.08020065, 1, 0, 0, 1, 1,
0.3570182, 0.2274566, 0.7288136, 1, 0, 0, 1, 1,
0.3581363, 0.2372104, 0.8262423, 1, 0, 0, 1, 1,
0.3582607, 1.105453, -0.7061458, 1, 0, 0, 1, 1,
0.362377, -0.2274967, 0.6921655, 0, 0, 0, 1, 1,
0.3641449, 0.2526203, -0.7914258, 0, 0, 0, 1, 1,
0.3652085, 0.7847375, 0.8494593, 0, 0, 0, 1, 1,
0.3663425, 0.09737764, 0.424767, 0, 0, 0, 1, 1,
0.3698336, 0.1761979, -0.5910922, 0, 0, 0, 1, 1,
0.3703531, 0.2959737, 1.31728, 0, 0, 0, 1, 1,
0.3761243, -0.3707103, 1.859871, 0, 0, 0, 1, 1,
0.3775567, -0.595363, 0.8536924, 1, 1, 1, 1, 1,
0.3786879, -0.7902026, 3.473523, 1, 1, 1, 1, 1,
0.3838062, -0.7332474, 1.637343, 1, 1, 1, 1, 1,
0.3855547, 0.753966, -0.9398251, 1, 1, 1, 1, 1,
0.3857577, -1.480987, 1.600991, 1, 1, 1, 1, 1,
0.3862708, -0.05481175, 1.815737, 1, 1, 1, 1, 1,
0.3915165, 0.4690219, 0.4707521, 1, 1, 1, 1, 1,
0.3962409, -1.774107, 0.8948117, 1, 1, 1, 1, 1,
0.3987813, 0.246803, 1.925007, 1, 1, 1, 1, 1,
0.4048871, 0.6320773, 2.291794, 1, 1, 1, 1, 1,
0.4064839, 0.7297851, 0.04285459, 1, 1, 1, 1, 1,
0.4097028, -0.9546939, 3.220002, 1, 1, 1, 1, 1,
0.4102206, -0.8834955, 3.532354, 1, 1, 1, 1, 1,
0.4174938, 0.7682801, 2.627994, 1, 1, 1, 1, 1,
0.4216065, 0.6648892, 1.500594, 1, 1, 1, 1, 1,
0.4265983, 0.3185006, 2.029228, 0, 0, 1, 1, 1,
0.4311977, -0.98965, 1.654312, 1, 0, 0, 1, 1,
0.4375992, -1.231758, 4.209996, 1, 0, 0, 1, 1,
0.4471748, 1.787223, 1.371967, 1, 0, 0, 1, 1,
0.4491873, 0.4098077, -0.03938946, 1, 0, 0, 1, 1,
0.449558, 2.041804, 0.7242401, 1, 0, 0, 1, 1,
0.4499943, -0.07816494, 1.08203, 0, 0, 0, 1, 1,
0.4508819, 0.8282315, 0.5010123, 0, 0, 0, 1, 1,
0.4510794, -0.1515078, 1.90976, 0, 0, 0, 1, 1,
0.4568303, -0.7957463, 2.407489, 0, 0, 0, 1, 1,
0.4592097, -2.136148, 3.550636, 0, 0, 0, 1, 1,
0.4601474, -0.1041748, 4.394996, 0, 0, 0, 1, 1,
0.4683977, 0.4075925, 0.5869039, 0, 0, 0, 1, 1,
0.4699917, -0.358929, 2.363309, 1, 1, 1, 1, 1,
0.4706602, -0.2255687, 1.108631, 1, 1, 1, 1, 1,
0.473367, 0.2657784, 0.7434719, 1, 1, 1, 1, 1,
0.4737058, 0.9896678, 1.21113, 1, 1, 1, 1, 1,
0.4739553, -0.4315852, 3.148343, 1, 1, 1, 1, 1,
0.4804773, -1.323186, 2.742002, 1, 1, 1, 1, 1,
0.4813275, 1.238792, -0.2903349, 1, 1, 1, 1, 1,
0.4871037, 0.5608966, 0.3746209, 1, 1, 1, 1, 1,
0.4895415, -0.7515789, 3.980101, 1, 1, 1, 1, 1,
0.4911483, 1.111759, 0.004474258, 1, 1, 1, 1, 1,
0.4921688, 1.412279, 1.923651, 1, 1, 1, 1, 1,
0.4969158, 1.350814, -0.6842932, 1, 1, 1, 1, 1,
0.5001734, -0.4814442, 2.462529, 1, 1, 1, 1, 1,
0.5054383, 0.191228, 2.096859, 1, 1, 1, 1, 1,
0.509237, 0.5303714, 1.354244, 1, 1, 1, 1, 1,
0.5141979, -0.1413225, 2.037729, 0, 0, 1, 1, 1,
0.5173169, -1.008853, 3.08788, 1, 0, 0, 1, 1,
0.5188593, -0.8306626, 2.630711, 1, 0, 0, 1, 1,
0.5234335, -0.4934329, 3.59463, 1, 0, 0, 1, 1,
0.5234761, 1.560707, -0.1403774, 1, 0, 0, 1, 1,
0.5309516, -1.085756, 2.796393, 1, 0, 0, 1, 1,
0.5346947, -0.2331023, 2.367423, 0, 0, 0, 1, 1,
0.5354268, 0.1080226, 1.725433, 0, 0, 0, 1, 1,
0.5358686, -0.8242283, 3.576594, 0, 0, 0, 1, 1,
0.5363583, -0.1638002, 1.876548, 0, 0, 0, 1, 1,
0.5406424, 0.7568496, 0.8352159, 0, 0, 0, 1, 1,
0.5410057, 2.009775, -0.1700414, 0, 0, 0, 1, 1,
0.5467086, -1.524808, 0.6837326, 0, 0, 0, 1, 1,
0.547262, 0.809338, 2.150061, 1, 1, 1, 1, 1,
0.5531057, 0.2952777, 0.1626511, 1, 1, 1, 1, 1,
0.5539001, 0.9163396, 2.574949, 1, 1, 1, 1, 1,
0.5557239, -0.5236781, 2.582641, 1, 1, 1, 1, 1,
0.559516, -0.1587229, 4.098272, 1, 1, 1, 1, 1,
0.5607156, -0.6660287, 2.134972, 1, 1, 1, 1, 1,
0.5630761, 0.6127401, 1.889285, 1, 1, 1, 1, 1,
0.56432, -0.8895963, 3.443959, 1, 1, 1, 1, 1,
0.5656434, -1.397494, 1.981068, 1, 1, 1, 1, 1,
0.5662823, 0.2934362, 1.579124, 1, 1, 1, 1, 1,
0.5700945, 1.840328, 0.7568856, 1, 1, 1, 1, 1,
0.5702906, -0.5414094, 0.9177758, 1, 1, 1, 1, 1,
0.5784119, 0.2152626, 1.125306, 1, 1, 1, 1, 1,
0.5802186, 1.371122, -1.708018, 1, 1, 1, 1, 1,
0.5821723, -0.413432, 2.269349, 1, 1, 1, 1, 1,
0.5837083, 0.1356309, 2.018658, 0, 0, 1, 1, 1,
0.5841492, 0.1790689, 1.253549, 1, 0, 0, 1, 1,
0.5856755, 0.0006836923, 3.124673, 1, 0, 0, 1, 1,
0.5892417, 0.08012572, 3.058688, 1, 0, 0, 1, 1,
0.5894713, -1.175459, 2.14661, 1, 0, 0, 1, 1,
0.5901946, -1.191327, 2.35964, 1, 0, 0, 1, 1,
0.5930858, -0.04644668, 1.26228, 0, 0, 0, 1, 1,
0.5940427, -1.049919, 0.7458594, 0, 0, 0, 1, 1,
0.5958834, 1.597869, 1.975801, 0, 0, 0, 1, 1,
0.6010866, -1.137891, 2.142885, 0, 0, 0, 1, 1,
0.6016335, 0.2095456, 0.5083961, 0, 0, 0, 1, 1,
0.6070905, 1.940516, 0.1899598, 0, 0, 0, 1, 1,
0.6085793, 0.4482696, 1.851476, 0, 0, 0, 1, 1,
0.609279, -0.8782014, 1.653465, 1, 1, 1, 1, 1,
0.6096228, -2.297699, 1.648948, 1, 1, 1, 1, 1,
0.6148961, -0.1966681, 1.756929, 1, 1, 1, 1, 1,
0.6160939, 0.4493169, 0.2245459, 1, 1, 1, 1, 1,
0.6287667, -0.4118879, 2.814959, 1, 1, 1, 1, 1,
0.6306412, -1.048113, 3.384115, 1, 1, 1, 1, 1,
0.6329578, 0.2222715, 0.5586498, 1, 1, 1, 1, 1,
0.6442918, -0.516495, 3.760024, 1, 1, 1, 1, 1,
0.6643845, -0.2138037, 2.651445, 1, 1, 1, 1, 1,
0.6777202, 0.04617088, 1.966225, 1, 1, 1, 1, 1,
0.6814628, -0.5486288, 1.81133, 1, 1, 1, 1, 1,
0.6837791, -0.2084289, 1.696197, 1, 1, 1, 1, 1,
0.6852028, -0.08334742, 1.484852, 1, 1, 1, 1, 1,
0.691572, -1.106706, 1.183684, 1, 1, 1, 1, 1,
0.6921039, 1.319207, -0.7754088, 1, 1, 1, 1, 1,
0.7035133, 1.348624, 0.235999, 0, 0, 1, 1, 1,
0.7122812, -0.3946554, 3.481939, 1, 0, 0, 1, 1,
0.7135883, 0.4756654, 2.225716, 1, 0, 0, 1, 1,
0.719922, -0.5512728, 1.563789, 1, 0, 0, 1, 1,
0.7235788, -0.09924959, 0.9858652, 1, 0, 0, 1, 1,
0.7312122, 0.851599, -0.1406693, 1, 0, 0, 1, 1,
0.7353371, -0.3565098, 2.144676, 0, 0, 0, 1, 1,
0.7364158, -0.989891, 2.746111, 0, 0, 0, 1, 1,
0.7389776, 0.5357788, 1.599792, 0, 0, 0, 1, 1,
0.7401943, -0.7431021, 2.718513, 0, 0, 0, 1, 1,
0.7418641, -0.9510427, 0.6968747, 0, 0, 0, 1, 1,
0.7448957, 0.2362234, 2.065115, 0, 0, 0, 1, 1,
0.751002, -0.5343947, 1.211356, 0, 0, 0, 1, 1,
0.7527375, -0.633018, 0.5153153, 1, 1, 1, 1, 1,
0.7533703, -0.2924357, 3.06319, 1, 1, 1, 1, 1,
0.7538404, -0.8222051, 2.236145, 1, 1, 1, 1, 1,
0.7546487, -0.5263749, 3.441669, 1, 1, 1, 1, 1,
0.7578016, -0.687629, 2.351874, 1, 1, 1, 1, 1,
0.7612037, -0.1283861, 1.328044, 1, 1, 1, 1, 1,
0.7622235, -1.48743, 3.636598, 1, 1, 1, 1, 1,
0.762785, 0.3620782, 0.7910451, 1, 1, 1, 1, 1,
0.7628051, 0.7326288, 0.0935833, 1, 1, 1, 1, 1,
0.7650801, -1.043803, 2.087934, 1, 1, 1, 1, 1,
0.7651407, -1.027055, 3.386293, 1, 1, 1, 1, 1,
0.7688017, 0.4502187, 0.9453394, 1, 1, 1, 1, 1,
0.7733653, 0.2044076, 2.4643, 1, 1, 1, 1, 1,
0.7763193, -0.8141848, 2.264089, 1, 1, 1, 1, 1,
0.7783387, -0.138597, 2.99355, 1, 1, 1, 1, 1,
0.7787213, -0.8171849, 2.448804, 0, 0, 1, 1, 1,
0.7799823, -0.2666928, 1.074658, 1, 0, 0, 1, 1,
0.7811095, 2.008972, 0.7530788, 1, 0, 0, 1, 1,
0.7821839, 1.683721, 3.606734, 1, 0, 0, 1, 1,
0.7827262, 0.02569807, 1.783167, 1, 0, 0, 1, 1,
0.7841722, -0.2355088, 2.889261, 1, 0, 0, 1, 1,
0.7887306, -0.06449074, 1.672141, 0, 0, 0, 1, 1,
0.7905171, -0.1988876, 1.246027, 0, 0, 0, 1, 1,
0.7908639, 0.3511893, 3.65235, 0, 0, 0, 1, 1,
0.7953146, 0.2712072, 0.9587555, 0, 0, 0, 1, 1,
0.7956573, 0.6859156, 0.2563469, 0, 0, 0, 1, 1,
0.7973266, -0.8315778, 2.171355, 0, 0, 0, 1, 1,
0.7981157, -0.4210954, 3.636078, 0, 0, 0, 1, 1,
0.8025622, -1.432097, 3.590719, 1, 1, 1, 1, 1,
0.8028054, 0.5721225, 0.3400072, 1, 1, 1, 1, 1,
0.8039252, 2.741419, 0.1721814, 1, 1, 1, 1, 1,
0.8157272, -0.0005705106, 0.5597147, 1, 1, 1, 1, 1,
0.8164912, -1.192832, 3.434011, 1, 1, 1, 1, 1,
0.8194739, -1.468166, 2.536919, 1, 1, 1, 1, 1,
0.827774, 0.739826, 1.093281, 1, 1, 1, 1, 1,
0.8279648, -0.4410681, 3.845994, 1, 1, 1, 1, 1,
0.8319424, 2.538644, -0.9371363, 1, 1, 1, 1, 1,
0.8320316, -0.9732206, 2.259078, 1, 1, 1, 1, 1,
0.8354561, -0.6538547, 2.352328, 1, 1, 1, 1, 1,
0.8375218, 0.5535959, 2.30942, 1, 1, 1, 1, 1,
0.8490491, -0.248798, 2.635919, 1, 1, 1, 1, 1,
0.8578813, 1.759334, 0.9025754, 1, 1, 1, 1, 1,
0.8594533, -0.191331, 2.068647, 1, 1, 1, 1, 1,
0.8616759, -0.6211868, 0.986229, 0, 0, 1, 1, 1,
0.8652912, -0.2021657, 3.143918, 1, 0, 0, 1, 1,
0.8668712, -0.2792131, 0.3835507, 1, 0, 0, 1, 1,
0.875398, -1.491438, 2.681346, 1, 0, 0, 1, 1,
0.8842104, -0.1558624, 2.614719, 1, 0, 0, 1, 1,
0.8870484, 0.3221843, 0.5141659, 1, 0, 0, 1, 1,
0.8963897, -0.1493453, 1.275982, 0, 0, 0, 1, 1,
0.8972466, -1.400248, 2.776081, 0, 0, 0, 1, 1,
0.8992203, 0.09674062, 0.742722, 0, 0, 0, 1, 1,
0.9040838, 0.3822422, -0.08217748, 0, 0, 0, 1, 1,
0.9053387, 0.0154947, 0.4626794, 0, 0, 0, 1, 1,
0.9091129, -0.8270603, 4.598537, 0, 0, 0, 1, 1,
0.90917, 0.8035636, 0.5352468, 0, 0, 0, 1, 1,
0.9114628, 0.4918135, 0.7474883, 1, 1, 1, 1, 1,
0.9154493, 0.9918854, 0.5522835, 1, 1, 1, 1, 1,
0.9156538, 2.970106, 1.916844, 1, 1, 1, 1, 1,
0.9217284, 0.9954692, 0.672725, 1, 1, 1, 1, 1,
0.9245911, -1.156367, 2.381038, 1, 1, 1, 1, 1,
0.9288055, -0.1042781, 1.201236, 1, 1, 1, 1, 1,
0.9306562, 0.8235189, 1.104562, 1, 1, 1, 1, 1,
0.9412898, 2.466705, 0.6204574, 1, 1, 1, 1, 1,
0.9435686, 1.59831, 0.09766923, 1, 1, 1, 1, 1,
0.9442394, 1.873779, 0.3200497, 1, 1, 1, 1, 1,
0.945067, 0.5609013, 1.78616, 1, 1, 1, 1, 1,
0.9459214, -1.31256, 3.43031, 1, 1, 1, 1, 1,
0.947426, -0.2221919, 1.40799, 1, 1, 1, 1, 1,
0.9547802, 0.5471062, 1.667628, 1, 1, 1, 1, 1,
0.9784041, 0.02474426, 1.471184, 1, 1, 1, 1, 1,
0.9799752, -0.5627434, 0.8296667, 0, 0, 1, 1, 1,
0.9829964, 0.4337322, 1.055588, 1, 0, 0, 1, 1,
0.9915972, -0.7331495, 2.371192, 1, 0, 0, 1, 1,
0.9922065, -0.2289155, 1.026982, 1, 0, 0, 1, 1,
0.9981241, -0.4142161, 1.62532, 1, 0, 0, 1, 1,
1.00342, 1.898522, 1.274454, 1, 0, 0, 1, 1,
1.007164, -0.2065043, 0.7363326, 0, 0, 0, 1, 1,
1.014735, -0.1773031, 1.793123, 0, 0, 0, 1, 1,
1.016797, -0.9378009, 1.083127, 0, 0, 0, 1, 1,
1.030576, -0.9454564, 1.348325, 0, 0, 0, 1, 1,
1.03301, 0.6874773, 1.015259, 0, 0, 0, 1, 1,
1.036866, 0.2117122, 0.1526757, 0, 0, 0, 1, 1,
1.038596, -0.2997765, 0.4227369, 0, 0, 0, 1, 1,
1.046398, -0.1530857, 3.44677, 1, 1, 1, 1, 1,
1.05463, -0.9058887, 2.114856, 1, 1, 1, 1, 1,
1.056286, -0.4161752, 3.37396, 1, 1, 1, 1, 1,
1.057285, 0.6840493, 2.853087, 1, 1, 1, 1, 1,
1.062823, 1.140414, 2.551352, 1, 1, 1, 1, 1,
1.063292, -0.4484756, 2.246017, 1, 1, 1, 1, 1,
1.063951, 0.7456112, 1.463744, 1, 1, 1, 1, 1,
1.065888, -0.3446158, 2.602893, 1, 1, 1, 1, 1,
1.074691, 0.1226208, 0.4826311, 1, 1, 1, 1, 1,
1.074789, 1.195405, -0.1845706, 1, 1, 1, 1, 1,
1.075976, -0.2305474, 1.29569, 1, 1, 1, 1, 1,
1.07967, 0.2531186, 0.3839271, 1, 1, 1, 1, 1,
1.081218, -1.160487, -0.2390171, 1, 1, 1, 1, 1,
1.082509, -0.8953193, 2.284953, 1, 1, 1, 1, 1,
1.092482, 0.4194397, 1.268539, 1, 1, 1, 1, 1,
1.094391, 0.5551127, 0.5955602, 0, 0, 1, 1, 1,
1.101324, 0.8952613, 0.6589304, 1, 0, 0, 1, 1,
1.105171, -0.6041288, 1.297799, 1, 0, 0, 1, 1,
1.106524, -0.0695664, 1.487157, 1, 0, 0, 1, 1,
1.111564, -2.269702, 4.646698, 1, 0, 0, 1, 1,
1.113174, 0.0495284, 1.106452, 1, 0, 0, 1, 1,
1.124305, 0.9243886, -0.2263383, 0, 0, 0, 1, 1,
1.126263, -0.5436991, 2.439731, 0, 0, 0, 1, 1,
1.133254, 1.22131, 0.399242, 0, 0, 0, 1, 1,
1.133599, 0.02536314, -0.6517156, 0, 0, 0, 1, 1,
1.151774, 0.7928353, -0.1189166, 0, 0, 0, 1, 1,
1.15218, -0.61796, 2.007186, 0, 0, 0, 1, 1,
1.15331, -0.5461529, 2.389657, 0, 0, 0, 1, 1,
1.153641, -1.080539, 1.791942, 1, 1, 1, 1, 1,
1.164546, -0.2319344, 1.634903, 1, 1, 1, 1, 1,
1.167802, -0.9388376, 2.195038, 1, 1, 1, 1, 1,
1.168789, -0.5483555, 1.744202, 1, 1, 1, 1, 1,
1.170977, -0.2275896, 1.657287, 1, 1, 1, 1, 1,
1.174537, 0.9415882, 0.7996491, 1, 1, 1, 1, 1,
1.176108, 0.310938, 1.602408, 1, 1, 1, 1, 1,
1.176671, 1.930282, -0.6965132, 1, 1, 1, 1, 1,
1.178519, -0.2384832, 2.855892, 1, 1, 1, 1, 1,
1.179117, 0.2094998, 0.3209261, 1, 1, 1, 1, 1,
1.185572, 0.9304639, 1.057338, 1, 1, 1, 1, 1,
1.186756, 1.810367, -0.751986, 1, 1, 1, 1, 1,
1.18926, 0.2048005, -0.04551947, 1, 1, 1, 1, 1,
1.197488, -0.6032116, -0.01254634, 1, 1, 1, 1, 1,
1.213687, 1.082929, -0.3781961, 1, 1, 1, 1, 1,
1.236301, -1.145243, 1.731044, 0, 0, 1, 1, 1,
1.246055, 0.3954429, 1.190608, 1, 0, 0, 1, 1,
1.246636, 0.6505669, 2.083077, 1, 0, 0, 1, 1,
1.247748, 0.4569423, 1.958898, 1, 0, 0, 1, 1,
1.249929, 0.2681526, 0.5180399, 1, 0, 0, 1, 1,
1.256235, 0.6021088, 1.002698, 1, 0, 0, 1, 1,
1.259146, -0.6790898, 1.220464, 0, 0, 0, 1, 1,
1.27091, -0.8847137, 2.92667, 0, 0, 0, 1, 1,
1.279372, -0.01485058, 0.8883949, 0, 0, 0, 1, 1,
1.279414, 1.998538, 0.4497961, 0, 0, 0, 1, 1,
1.28578, 2.107771, 0.252832, 0, 0, 0, 1, 1,
1.298088, 0.2139633, 4.126722, 0, 0, 0, 1, 1,
1.29816, -1.244106, 1.989295, 0, 0, 0, 1, 1,
1.313088, -0.336556, 1.554086, 1, 1, 1, 1, 1,
1.313922, 0.410655, 3.048417, 1, 1, 1, 1, 1,
1.321875, -1.562028, 2.779767, 1, 1, 1, 1, 1,
1.334893, 0.8554668, -0.003118519, 1, 1, 1, 1, 1,
1.361325, 1.527271, 2.517039, 1, 1, 1, 1, 1,
1.371249, 0.816581, -0.2655099, 1, 1, 1, 1, 1,
1.372761, 0.05368782, 1.519041, 1, 1, 1, 1, 1,
1.37689, -1.209694, 2.913988, 1, 1, 1, 1, 1,
1.378281, 1.007573, 1.539177, 1, 1, 1, 1, 1,
1.386309, 0.9141554, 0.883599, 1, 1, 1, 1, 1,
1.387944, 0.03990597, 2.187111, 1, 1, 1, 1, 1,
1.396238, 0.5980396, 3.202015, 1, 1, 1, 1, 1,
1.396245, 0.1983178, 0.9038495, 1, 1, 1, 1, 1,
1.399998, -0.5469364, 1.714892, 1, 1, 1, 1, 1,
1.402409, -0.1062931, 0.8840517, 1, 1, 1, 1, 1,
1.405981, -1.707899, 2.370675, 0, 0, 1, 1, 1,
1.408047, -1.840684, 2.053857, 1, 0, 0, 1, 1,
1.421481, 0.4575573, 2.304225, 1, 0, 0, 1, 1,
1.444564, 1.092407, -0.3938504, 1, 0, 0, 1, 1,
1.445836, -0.4178145, 1.564714, 1, 0, 0, 1, 1,
1.472534, 0.5185269, 2.639201, 1, 0, 0, 1, 1,
1.474025, -0.6235812, 1.260336, 0, 0, 0, 1, 1,
1.474448, -1.138593, 3.147403, 0, 0, 0, 1, 1,
1.475841, 0.9541016, 0.7290731, 0, 0, 0, 1, 1,
1.478094, -0.09557496, 1.39555, 0, 0, 0, 1, 1,
1.480469, 1.379456, 0.6106035, 0, 0, 0, 1, 1,
1.483332, -0.04377139, 0.3068925, 0, 0, 0, 1, 1,
1.486974, -0.5000953, 2.663495, 0, 0, 0, 1, 1,
1.50172, 0.313322, 0.7728568, 1, 1, 1, 1, 1,
1.534431, 1.03748, 1.053686, 1, 1, 1, 1, 1,
1.536693, -0.009021647, 1.5291, 1, 1, 1, 1, 1,
1.584783, -0.08434318, 1.280552, 1, 1, 1, 1, 1,
1.591293, -0.8303231, 2.518868, 1, 1, 1, 1, 1,
1.598041, 0.5442566, 2.109496, 1, 1, 1, 1, 1,
1.599856, -0.3534671, 0.09058145, 1, 1, 1, 1, 1,
1.600366, 1.187658, 2.423742, 1, 1, 1, 1, 1,
1.616176, 1.502254, 2.596569, 1, 1, 1, 1, 1,
1.632427, -0.5486474, 2.539679, 1, 1, 1, 1, 1,
1.639145, -0.08495015, -0.5076679, 1, 1, 1, 1, 1,
1.640479, 0.4947425, 0.6448051, 1, 1, 1, 1, 1,
1.644211, -1.371894, 1.556161, 1, 1, 1, 1, 1,
1.650723, 0.3875019, 2.111535, 1, 1, 1, 1, 1,
1.664822, 0.4343628, 1.442123, 1, 1, 1, 1, 1,
1.669748, -0.6949388, 1.55309, 0, 0, 1, 1, 1,
1.673313, 1.30933, 1.577842, 1, 0, 0, 1, 1,
1.67855, -0.1461758, 1.533782, 1, 0, 0, 1, 1,
1.681372, 0.3158399, 1.11035, 1, 0, 0, 1, 1,
1.705774, -0.8999871, 3.713746, 1, 0, 0, 1, 1,
1.735671, 0.3870686, 2.869552, 1, 0, 0, 1, 1,
1.745656, -0.9695526, 3.577111, 0, 0, 0, 1, 1,
1.755176, 0.9770925, 1.053468, 0, 0, 0, 1, 1,
1.767079, -0.757257, 2.408907, 0, 0, 0, 1, 1,
1.77685, -0.5031679, -0.1875746, 0, 0, 0, 1, 1,
1.822611, 0.08904737, 3.203072, 0, 0, 0, 1, 1,
1.823393, 0.6356618, 1.842997, 0, 0, 0, 1, 1,
1.824177, -0.4450634, 1.757476, 0, 0, 0, 1, 1,
1.82799, 0.7533933, 0.5670726, 1, 1, 1, 1, 1,
1.830884, -0.6919676, 1.15862, 1, 1, 1, 1, 1,
1.831972, -0.5813683, 1.142327, 1, 1, 1, 1, 1,
1.834323, 1.089191, 0.3463208, 1, 1, 1, 1, 1,
1.843279, -0.3646742, 1.646601, 1, 1, 1, 1, 1,
1.847393, 1.10716, 2.687231, 1, 1, 1, 1, 1,
1.850848, -0.9414155, 1.632687, 1, 1, 1, 1, 1,
1.902608, 1.29134, -0.2372942, 1, 1, 1, 1, 1,
1.902654, -0.519747, 1.536915, 1, 1, 1, 1, 1,
1.940953, 0.3244891, 1.289811, 1, 1, 1, 1, 1,
1.941432, -1.007195, 0.4091009, 1, 1, 1, 1, 1,
1.945026, -0.3752502, -1.549013, 1, 1, 1, 1, 1,
1.984887, 1.447609, 1.011259, 1, 1, 1, 1, 1,
1.998343, -0.3647227, 3.4345, 1, 1, 1, 1, 1,
2.007979, -0.4954866, 2.058517, 1, 1, 1, 1, 1,
2.033107, 0.2904509, 0.6338868, 0, 0, 1, 1, 1,
2.070447, -0.5996834, 2.443167, 1, 0, 0, 1, 1,
2.09591, -0.9529454, 0.120307, 1, 0, 0, 1, 1,
2.131484, -0.9938115, 2.023572, 1, 0, 0, 1, 1,
2.195073, -1.545135, 1.88557, 1, 0, 0, 1, 1,
2.216861, 0.6005574, 0.5905765, 1, 0, 0, 1, 1,
2.236423, -0.7120576, 2.00086, 0, 0, 0, 1, 1,
2.240977, -0.0690904, 1.098424, 0, 0, 0, 1, 1,
2.395514, 0.7550533, 1.859872, 0, 0, 0, 1, 1,
2.397149, 0.5254907, 1.666191, 0, 0, 0, 1, 1,
2.41118, 0.5064464, 1.595512, 0, 0, 0, 1, 1,
2.428169, -0.1313237, 2.912249, 0, 0, 0, 1, 1,
2.438509, 0.3495261, 2.235157, 0, 0, 0, 1, 1,
2.44277, -1.213939, 2.139624, 1, 1, 1, 1, 1,
2.488435, 1.823316, 0.4642907, 1, 1, 1, 1, 1,
2.494428, -2.621863, 2.789933, 1, 1, 1, 1, 1,
2.701158, 2.019652, 1.40254, 1, 1, 1, 1, 1,
2.989684, 0.9257898, -0.1925464, 1, 1, 1, 1, 1,
3.151169, 0.06835233, 0.5819002, 1, 1, 1, 1, 1,
3.355471, -0.1270293, 0.9557579, 1, 1, 1, 1, 1
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
var radius = 9.747402;
var distance = 34.23734;
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
mvMatrix.translate( -0.1759038, 0.1476406, 0.4646511 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.23734);
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
