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
-3.359356, 2.146174, -0.01068208, 1, 0, 0, 1,
-2.945999, 0.1821569, -0.9353321, 1, 0.007843138, 0, 1,
-2.711257, -1.292895, -2.001983, 1, 0.01176471, 0, 1,
-2.70049, -0.0810376, 0.2559353, 1, 0.01960784, 0, 1,
-2.66708, 0.4148721, -0.5417917, 1, 0.02352941, 0, 1,
-2.657655, 1.300623, -3.058315, 1, 0.03137255, 0, 1,
-2.604875, -2.260589, -1.467011, 1, 0.03529412, 0, 1,
-2.551851, 0.2275861, -1.483027, 1, 0.04313726, 0, 1,
-2.442345, 1.988186, -1.047583, 1, 0.04705882, 0, 1,
-2.294956, -0.6842227, -0.5743479, 1, 0.05490196, 0, 1,
-2.287135, -0.8280587, -3.637205, 1, 0.05882353, 0, 1,
-2.27969, -0.2282958, 0.1613073, 1, 0.06666667, 0, 1,
-2.274421, 0.05881384, -3.156088, 1, 0.07058824, 0, 1,
-2.205774, 0.3222338, -1.878651, 1, 0.07843138, 0, 1,
-2.145504, -2.294542, -2.211952, 1, 0.08235294, 0, 1,
-2.137824, -1.03132, -1.096186, 1, 0.09019608, 0, 1,
-2.133225, -0.2382781, -1.677152, 1, 0.09411765, 0, 1,
-2.098363, 0.6830709, -1.358342, 1, 0.1019608, 0, 1,
-2.073552, 0.3510014, -1.626918, 1, 0.1098039, 0, 1,
-2.066408, -1.059772, -1.461899, 1, 0.1137255, 0, 1,
-2.024362, -0.1563737, -2.258079, 1, 0.1215686, 0, 1,
-2.011416, 0.4570907, -1.766273, 1, 0.1254902, 0, 1,
-2.003578, -0.4497428, 0.5035205, 1, 0.1333333, 0, 1,
-1.99942, 1.57225, -1.393443, 1, 0.1372549, 0, 1,
-1.981809, 1.099616, -1.117044, 1, 0.145098, 0, 1,
-1.973602, -0.4213078, -1.961269, 1, 0.1490196, 0, 1,
-1.945244, 1.954156, -1.350393, 1, 0.1568628, 0, 1,
-1.944886, 0.441681, -2.373304, 1, 0.1607843, 0, 1,
-1.90754, 1.724684, -0.2775936, 1, 0.1686275, 0, 1,
-1.900345, -3.477487, -3.466069, 1, 0.172549, 0, 1,
-1.84559, 0.6982206, -3.138035, 1, 0.1803922, 0, 1,
-1.833554, 0.3979706, -1.127238, 1, 0.1843137, 0, 1,
-1.78612, -1.395909, -2.910678, 1, 0.1921569, 0, 1,
-1.757452, -0.9779691, -2.965792, 1, 0.1960784, 0, 1,
-1.74516, -0.2949219, -1.373799, 1, 0.2039216, 0, 1,
-1.74268, 0.4062548, -1.362382, 1, 0.2117647, 0, 1,
-1.737198, 0.08757651, -0.7949906, 1, 0.2156863, 0, 1,
-1.72994, -0.6659468, -1.235128, 1, 0.2235294, 0, 1,
-1.729783, 0.8576452, -1.862083, 1, 0.227451, 0, 1,
-1.686285, 0.4085003, -2.935335, 1, 0.2352941, 0, 1,
-1.676537, -0.3987528, -0.5453231, 1, 0.2392157, 0, 1,
-1.668274, 0.7735571, 0.0880813, 1, 0.2470588, 0, 1,
-1.665874, -0.6002789, -2.329948, 1, 0.2509804, 0, 1,
-1.659588, 0.03345228, -1.182242, 1, 0.2588235, 0, 1,
-1.654948, -0.5178944, -1.569898, 1, 0.2627451, 0, 1,
-1.640338, -0.2381989, -1.963985, 1, 0.2705882, 0, 1,
-1.638327, 0.6296735, -1.903188, 1, 0.2745098, 0, 1,
-1.636233, -1.440967, -0.0840043, 1, 0.282353, 0, 1,
-1.617587, -0.9905106, -2.221723, 1, 0.2862745, 0, 1,
-1.605223, 0.3044589, -1.154792, 1, 0.2941177, 0, 1,
-1.582656, -0.5657893, -2.112602, 1, 0.3019608, 0, 1,
-1.580389, 0.4138333, -2.545485, 1, 0.3058824, 0, 1,
-1.579059, -0.7346877, -1.050625, 1, 0.3137255, 0, 1,
-1.561458, 1.198167, -1.763186, 1, 0.3176471, 0, 1,
-1.542442, 0.3733694, -1.781502, 1, 0.3254902, 0, 1,
-1.52409, 0.02579888, -2.032509, 1, 0.3294118, 0, 1,
-1.514407, -0.5462539, -2.144196, 1, 0.3372549, 0, 1,
-1.511001, -0.7233024, -1.107833, 1, 0.3411765, 0, 1,
-1.509761, -1.456121, -3.144329, 1, 0.3490196, 0, 1,
-1.490138, -0.8135773, -2.763492, 1, 0.3529412, 0, 1,
-1.480405, -0.003437911, -1.534644, 1, 0.3607843, 0, 1,
-1.471599, 1.057261, -0.1595413, 1, 0.3647059, 0, 1,
-1.462324, 0.2216813, -1.245819, 1, 0.372549, 0, 1,
-1.445231, -1.014493, -2.431761, 1, 0.3764706, 0, 1,
-1.438352, 0.4805913, -2.007812, 1, 0.3843137, 0, 1,
-1.407766, 0.2312312, -1.199668, 1, 0.3882353, 0, 1,
-1.406288, 0.2842959, -1.480804, 1, 0.3960784, 0, 1,
-1.40619, -1.673133, -3.966711, 1, 0.4039216, 0, 1,
-1.404645, 0.5135041, -1.13318, 1, 0.4078431, 0, 1,
-1.401579, 0.8927655, -1.015785, 1, 0.4156863, 0, 1,
-1.400436, -0.4661452, 0.9352722, 1, 0.4196078, 0, 1,
-1.382915, -1.685007, -2.577663, 1, 0.427451, 0, 1,
-1.38092, -0.9909914, -3.830642, 1, 0.4313726, 0, 1,
-1.380811, 0.7452345, -2.97793, 1, 0.4392157, 0, 1,
-1.379934, 0.9561033, -0.4548247, 1, 0.4431373, 0, 1,
-1.36653, 0.2184009, -1.539527, 1, 0.4509804, 0, 1,
-1.3558, -1.763101, -2.544172, 1, 0.454902, 0, 1,
-1.353559, -0.302766, -1.332096, 1, 0.4627451, 0, 1,
-1.349878, 0.08305195, -0.227002, 1, 0.4666667, 0, 1,
-1.341616, -0.9306003, -3.559948, 1, 0.4745098, 0, 1,
-1.332172, -1.568266, -2.719067, 1, 0.4784314, 0, 1,
-1.327874, -0.4342904, -1.544687, 1, 0.4862745, 0, 1,
-1.319423, 0.5551893, -1.657299, 1, 0.4901961, 0, 1,
-1.312584, -1.423628, -3.174511, 1, 0.4980392, 0, 1,
-1.311004, 2.187261, -0.8206644, 1, 0.5058824, 0, 1,
-1.307319, -0.8481963, -0.2524835, 1, 0.509804, 0, 1,
-1.300497, -0.6254418, -1.333304, 1, 0.5176471, 0, 1,
-1.29723, -0.3711671, 0.1272373, 1, 0.5215687, 0, 1,
-1.290845, 0.1776643, -0.6880633, 1, 0.5294118, 0, 1,
-1.282234, -1.03889, -2.084195, 1, 0.5333334, 0, 1,
-1.279212, 0.8144546, -1.620905, 1, 0.5411765, 0, 1,
-1.271758, -1.111474, -2.634185, 1, 0.5450981, 0, 1,
-1.269888, 0.1748989, -1.584278, 1, 0.5529412, 0, 1,
-1.265353, 0.009296931, -1.099938, 1, 0.5568628, 0, 1,
-1.262538, -0.615545, -2.633369, 1, 0.5647059, 0, 1,
-1.259919, 0.8859857, -1.935477, 1, 0.5686275, 0, 1,
-1.243924, 0.2814727, -2.896037, 1, 0.5764706, 0, 1,
-1.226023, 1.213375, 0.3965156, 1, 0.5803922, 0, 1,
-1.220703, -0.8679479, -2.021709, 1, 0.5882353, 0, 1,
-1.214985, -0.1033386, -2.434564, 1, 0.5921569, 0, 1,
-1.214651, 0.2997427, -1.862134, 1, 0.6, 0, 1,
-1.208887, 1.940606, -0.8486609, 1, 0.6078432, 0, 1,
-1.208411, 2.121522, 1.519621, 1, 0.6117647, 0, 1,
-1.197388, -0.1300957, -1.115001, 1, 0.6196079, 0, 1,
-1.193861, -0.4770432, -2.664095, 1, 0.6235294, 0, 1,
-1.187069, 0.9808405, -1.291043, 1, 0.6313726, 0, 1,
-1.185084, -1.853272, -2.679529, 1, 0.6352941, 0, 1,
-1.181893, -0.5874009, -1.671007, 1, 0.6431373, 0, 1,
-1.181885, 0.2652639, -1.193455, 1, 0.6470588, 0, 1,
-1.173241, 1.856336, 0.4132726, 1, 0.654902, 0, 1,
-1.168284, 0.3516665, -0.2537047, 1, 0.6588235, 0, 1,
-1.168089, -0.8013633, -0.8661929, 1, 0.6666667, 0, 1,
-1.154792, -0.4702232, -3.749249, 1, 0.6705883, 0, 1,
-1.152793, 2.075916, -1.628078, 1, 0.6784314, 0, 1,
-1.144109, 0.4653055, -0.5752755, 1, 0.682353, 0, 1,
-1.141667, -1.337511, 0.2083395, 1, 0.6901961, 0, 1,
-1.13273, 0.9068174, -2.33958, 1, 0.6941177, 0, 1,
-1.132093, 2.265507, -0.8034317, 1, 0.7019608, 0, 1,
-1.124091, 1.621922, -1.49037, 1, 0.7098039, 0, 1,
-1.121191, 0.4847809, -1.571646, 1, 0.7137255, 0, 1,
-1.111232, -0.2429585, 0.26567, 1, 0.7215686, 0, 1,
-1.11078, 0.1284838, -1.527775, 1, 0.7254902, 0, 1,
-1.109714, 0.4024493, -1.613435, 1, 0.7333333, 0, 1,
-1.09365, -1.893428, -3.698619, 1, 0.7372549, 0, 1,
-1.090929, 1.340796, -0.394633, 1, 0.7450981, 0, 1,
-1.087153, 0.4637663, 0.3697445, 1, 0.7490196, 0, 1,
-1.08426, 0.3590327, -0.3492998, 1, 0.7568628, 0, 1,
-1.078204, 1.057679, -0.7033339, 1, 0.7607843, 0, 1,
-1.071225, 0.3961507, -1.637143, 1, 0.7686275, 0, 1,
-1.060458, 1.116457, -0.9787527, 1, 0.772549, 0, 1,
-1.060125, 0.2437865, -1.837256, 1, 0.7803922, 0, 1,
-1.057172, 0.3716332, -1.449935, 1, 0.7843137, 0, 1,
-1.042113, 0.4111232, -1.323925, 1, 0.7921569, 0, 1,
-1.040204, 1.134017, -1.019016, 1, 0.7960784, 0, 1,
-1.039791, -1.058379, -2.586443, 1, 0.8039216, 0, 1,
-1.037383, 0.004821607, -0.6182364, 1, 0.8117647, 0, 1,
-1.035746, -0.4153264, -1.043431, 1, 0.8156863, 0, 1,
-1.033146, 1.504943, 0.9686668, 1, 0.8235294, 0, 1,
-1.031064, 0.8061055, -0.4961282, 1, 0.827451, 0, 1,
-1.03073, 0.2373974, -2.096245, 1, 0.8352941, 0, 1,
-1.029534, 0.9350489, -0.7481853, 1, 0.8392157, 0, 1,
-1.028382, -0.2287265, -0.8128408, 1, 0.8470588, 0, 1,
-1.015989, 2.103836, -1.880691, 1, 0.8509804, 0, 1,
-1.011677, 1.012887, -0.6743001, 1, 0.8588235, 0, 1,
-1.010399, 0.5459252, -0.53219, 1, 0.8627451, 0, 1,
-1.006182, -1.216229, -3.366845, 1, 0.8705882, 0, 1,
-1.004822, -0.04170366, -1.958161, 1, 0.8745098, 0, 1,
-1.004672, 1.398488, -0.6381769, 1, 0.8823529, 0, 1,
-1.003246, 1.485559, 0.5885925, 1, 0.8862745, 0, 1,
-0.9973668, -0.289214, -2.253778, 1, 0.8941177, 0, 1,
-0.9967726, -1.900852, -3.863187, 1, 0.8980392, 0, 1,
-0.9916014, 1.761828, -0.04080568, 1, 0.9058824, 0, 1,
-0.9839369, -0.2207657, -2.981377, 1, 0.9137255, 0, 1,
-0.9835429, 0.3330153, 0.5111246, 1, 0.9176471, 0, 1,
-0.9833298, 1.568419, 1.355118, 1, 0.9254902, 0, 1,
-0.982268, -0.8223609, 1.139111, 1, 0.9294118, 0, 1,
-0.9649734, -0.4633559, -1.670029, 1, 0.9372549, 0, 1,
-0.9563255, -0.1827242, -1.539378, 1, 0.9411765, 0, 1,
-0.9546838, -0.7904263, -1.207587, 1, 0.9490196, 0, 1,
-0.9423255, 0.7396997, -2.098279, 1, 0.9529412, 0, 1,
-0.9415222, 0.5493955, -2.706963, 1, 0.9607843, 0, 1,
-0.9408973, -0.7984407, -4.402438, 1, 0.9647059, 0, 1,
-0.9353156, -1.128121, -3.174987, 1, 0.972549, 0, 1,
-0.9347649, 0.5315859, -0.9978538, 1, 0.9764706, 0, 1,
-0.9300604, 1.008924, -0.4140258, 1, 0.9843137, 0, 1,
-0.9277141, -1.656313, -2.636938, 1, 0.9882353, 0, 1,
-0.9221616, 0.3800469, -2.372829, 1, 0.9960784, 0, 1,
-0.9194833, 0.005665954, -0.08225412, 0.9960784, 1, 0, 1,
-0.9181932, 1.898264, 0.5313308, 0.9921569, 1, 0, 1,
-0.9146388, -0.7312501, -3.846234, 0.9843137, 1, 0, 1,
-0.9048361, 0.5603669, -0.232447, 0.9803922, 1, 0, 1,
-0.8934519, -1.01396, -1.723774, 0.972549, 1, 0, 1,
-0.8827904, -0.04116578, -0.2921787, 0.9686275, 1, 0, 1,
-0.8780614, -1.176419, -3.280806, 0.9607843, 1, 0, 1,
-0.8770537, 0.1732797, -1.187584, 0.9568627, 1, 0, 1,
-0.8707367, 0.04700808, -1.015999, 0.9490196, 1, 0, 1,
-0.8697417, 0.3654426, -0.05960093, 0.945098, 1, 0, 1,
-0.867058, -1.036651, -2.573109, 0.9372549, 1, 0, 1,
-0.8581446, 0.3197501, -4.087343, 0.9333333, 1, 0, 1,
-0.8499836, 0.156965, -1.432376, 0.9254902, 1, 0, 1,
-0.8432792, -1.106875, -2.132197, 0.9215686, 1, 0, 1,
-0.8426864, -0.3754918, -2.054884, 0.9137255, 1, 0, 1,
-0.8412063, -0.8188393, -0.6456512, 0.9098039, 1, 0, 1,
-0.8373722, 0.423003, -0.8811334, 0.9019608, 1, 0, 1,
-0.833259, -0.03163874, -0.9457304, 0.8941177, 1, 0, 1,
-0.8290779, -0.6771656, -2.102481, 0.8901961, 1, 0, 1,
-0.8269545, -0.02543894, -2.65781, 0.8823529, 1, 0, 1,
-0.8244032, -1.305612, -2.383533, 0.8784314, 1, 0, 1,
-0.8181401, -0.8959116, -0.03786635, 0.8705882, 1, 0, 1,
-0.8177571, 0.4394734, -1.305295, 0.8666667, 1, 0, 1,
-0.8092793, -0.3965626, -2.033937, 0.8588235, 1, 0, 1,
-0.8062885, -0.3865424, -1.501848, 0.854902, 1, 0, 1,
-0.8043348, -0.534196, -1.232736, 0.8470588, 1, 0, 1,
-0.8041871, -0.4170825, -0.349189, 0.8431373, 1, 0, 1,
-0.803611, 0.8822742, -0.6256765, 0.8352941, 1, 0, 1,
-0.8033593, 0.3186652, 0.375806, 0.8313726, 1, 0, 1,
-0.8032425, 0.4380237, -0.4543591, 0.8235294, 1, 0, 1,
-0.8003437, 0.2251312, -0.02351921, 0.8196079, 1, 0, 1,
-0.7991398, -1.485299, 0.4273078, 0.8117647, 1, 0, 1,
-0.7985278, 0.4273286, -0.0458654, 0.8078431, 1, 0, 1,
-0.7949588, 0.711419, -0.1482604, 0.8, 1, 0, 1,
-0.7801613, -1.451963, -0.4302501, 0.7921569, 1, 0, 1,
-0.7778881, -0.6648523, -2.342597, 0.7882353, 1, 0, 1,
-0.7774954, 0.9248984, -2.679492, 0.7803922, 1, 0, 1,
-0.7739607, 0.6631185, -0.9792732, 0.7764706, 1, 0, 1,
-0.7714034, -1.595285, -2.037231, 0.7686275, 1, 0, 1,
-0.7680385, 0.5340966, -1.439118, 0.7647059, 1, 0, 1,
-0.7649404, 0.6815327, 0.7343698, 0.7568628, 1, 0, 1,
-0.7644978, -1.396898, -2.705804, 0.7529412, 1, 0, 1,
-0.7618703, -1.327991, -2.710732, 0.7450981, 1, 0, 1,
-0.7513023, 0.9603182, -1.166197, 0.7411765, 1, 0, 1,
-0.7502123, -0.5123917, -1.650292, 0.7333333, 1, 0, 1,
-0.7475297, 6.415202e-05, -2.148521, 0.7294118, 1, 0, 1,
-0.7469, 0.500515, 0.4502768, 0.7215686, 1, 0, 1,
-0.7467954, -0.09158405, -3.404608, 0.7176471, 1, 0, 1,
-0.7453632, -0.1110856, -2.556194, 0.7098039, 1, 0, 1,
-0.7381722, 1.906125, -1.783004, 0.7058824, 1, 0, 1,
-0.7360989, 0.498799, 0.9205574, 0.6980392, 1, 0, 1,
-0.7347001, 0.04011366, -0.9053623, 0.6901961, 1, 0, 1,
-0.733874, -0.5896375, -2.652952, 0.6862745, 1, 0, 1,
-0.7320175, 0.1781587, -4.393015, 0.6784314, 1, 0, 1,
-0.7315704, 1.650308, 0.7394693, 0.6745098, 1, 0, 1,
-0.7304152, 2.229595, 2.406733, 0.6666667, 1, 0, 1,
-0.7279146, 1.158587, 1.184987, 0.6627451, 1, 0, 1,
-0.7262326, -0.04613789, -1.700471, 0.654902, 1, 0, 1,
-0.7255543, -1.268987, -2.921248, 0.6509804, 1, 0, 1,
-0.7247958, -0.291194, -2.572903, 0.6431373, 1, 0, 1,
-0.7243029, -0.1982816, -2.250372, 0.6392157, 1, 0, 1,
-0.7207539, -0.3870445, -3.487187, 0.6313726, 1, 0, 1,
-0.7182313, 0.06265087, -1.769806, 0.627451, 1, 0, 1,
-0.717877, 0.3235849, 0.3446501, 0.6196079, 1, 0, 1,
-0.716866, -1.055167, -1.181679, 0.6156863, 1, 0, 1,
-0.7162685, 0.6710365, -3.027362, 0.6078432, 1, 0, 1,
-0.7149368, 1.821177, -2.115774, 0.6039216, 1, 0, 1,
-0.7120066, 1.601203, 1.272278, 0.5960785, 1, 0, 1,
-0.7062203, -1.19619, -1.914963, 0.5882353, 1, 0, 1,
-0.6985391, 0.3221268, -1.468525, 0.5843138, 1, 0, 1,
-0.6972641, -1.261874, -2.706893, 0.5764706, 1, 0, 1,
-0.6952393, 0.3637272, -0.5557416, 0.572549, 1, 0, 1,
-0.6921021, -0.180603, -2.058494, 0.5647059, 1, 0, 1,
-0.6913249, -0.917708, -3.231242, 0.5607843, 1, 0, 1,
-0.6879627, 0.5785852, -0.8300817, 0.5529412, 1, 0, 1,
-0.6813091, -0.2777498, -1.816891, 0.5490196, 1, 0, 1,
-0.6766775, -1.221499, -1.682215, 0.5411765, 1, 0, 1,
-0.6731861, -0.6266941, -2.773649, 0.5372549, 1, 0, 1,
-0.668918, 2.651176, 1.269117, 0.5294118, 1, 0, 1,
-0.6657888, -0.1792208, -0.4244909, 0.5254902, 1, 0, 1,
-0.6616067, 0.207229, -1.995531, 0.5176471, 1, 0, 1,
-0.6606233, -1.471152, -1.530667, 0.5137255, 1, 0, 1,
-0.6542563, 1.936383, -1.77616, 0.5058824, 1, 0, 1,
-0.6542401, -1.445147, -2.358648, 0.5019608, 1, 0, 1,
-0.6516299, -0.6766695, -3.532909, 0.4941176, 1, 0, 1,
-0.6496176, -2.38261, -3.572117, 0.4862745, 1, 0, 1,
-0.6442649, 0.6571819, -1.019783, 0.4823529, 1, 0, 1,
-0.6326099, 1.323506, -3.318727, 0.4745098, 1, 0, 1,
-0.6321766, -0.5905482, -1.145289, 0.4705882, 1, 0, 1,
-0.6317943, -0.8351225, -3.882539, 0.4627451, 1, 0, 1,
-0.6307455, 0.0338245, -2.140974, 0.4588235, 1, 0, 1,
-0.6304068, -0.2142003, -2.063655, 0.4509804, 1, 0, 1,
-0.6248775, 1.208435, 0.2867334, 0.4470588, 1, 0, 1,
-0.6156875, -2.179869, -2.962507, 0.4392157, 1, 0, 1,
-0.6153889, 1.511293, -1.571915, 0.4352941, 1, 0, 1,
-0.6140648, -1.843893, -3.505861, 0.427451, 1, 0, 1,
-0.6128238, -0.3303564, -2.184065, 0.4235294, 1, 0, 1,
-0.606577, 2.232534, 0.4811209, 0.4156863, 1, 0, 1,
-0.6056684, 0.7030193, -1.918914, 0.4117647, 1, 0, 1,
-0.5960399, 1.010994, -0.5362906, 0.4039216, 1, 0, 1,
-0.5944431, -0.215211, -1.176006, 0.3960784, 1, 0, 1,
-0.590551, -1.344608, -1.860039, 0.3921569, 1, 0, 1,
-0.5864871, -1.35392, -2.400547, 0.3843137, 1, 0, 1,
-0.5838265, -0.05634693, -2.332097, 0.3803922, 1, 0, 1,
-0.5809873, -0.5088298, -1.19742, 0.372549, 1, 0, 1,
-0.5760948, -0.2795808, -0.9914128, 0.3686275, 1, 0, 1,
-0.5724373, -0.06369874, 0.2267373, 0.3607843, 1, 0, 1,
-0.5642237, 1.799983, -3.010655, 0.3568628, 1, 0, 1,
-0.5632386, 0.830007, -1.861196, 0.3490196, 1, 0, 1,
-0.5601131, 1.695742, -1.050319, 0.345098, 1, 0, 1,
-0.5580979, 0.4188022, 0.002116528, 0.3372549, 1, 0, 1,
-0.5536705, 1.322637, -1.243151, 0.3333333, 1, 0, 1,
-0.5530353, 0.4350258, -1.150366, 0.3254902, 1, 0, 1,
-0.5486704, 1.285574, 0.1524412, 0.3215686, 1, 0, 1,
-0.5456984, -0.2180028, -2.290996, 0.3137255, 1, 0, 1,
-0.5451021, 0.9515886, -0.03212424, 0.3098039, 1, 0, 1,
-0.5406157, 0.6676553, -0.493046, 0.3019608, 1, 0, 1,
-0.5386354, -0.1042381, -0.08837759, 0.2941177, 1, 0, 1,
-0.5356643, 0.5071289, -0.8137079, 0.2901961, 1, 0, 1,
-0.5344009, 0.7580774, -0.4054446, 0.282353, 1, 0, 1,
-0.5313426, -0.4142713, -2.233413, 0.2784314, 1, 0, 1,
-0.5293928, 0.1004896, -1.539658, 0.2705882, 1, 0, 1,
-0.5234466, 1.797835, -0.1065104, 0.2666667, 1, 0, 1,
-0.5225686, -1.399584, -3.069724, 0.2588235, 1, 0, 1,
-0.5223004, 0.04041169, -0.4241253, 0.254902, 1, 0, 1,
-0.518888, -2.307682, -2.727789, 0.2470588, 1, 0, 1,
-0.5180168, -0.02886118, -2.061227, 0.2431373, 1, 0, 1,
-0.5101449, 0.2943107, -1.327559, 0.2352941, 1, 0, 1,
-0.5056919, -0.9137161, -1.957971, 0.2313726, 1, 0, 1,
-0.5024547, 1.112941, -1.291935, 0.2235294, 1, 0, 1,
-0.502421, 0.04880367, -2.833529, 0.2196078, 1, 0, 1,
-0.4971133, -2.59485, -1.745345, 0.2117647, 1, 0, 1,
-0.4862666, -1.734745, -3.241303, 0.2078431, 1, 0, 1,
-0.4837433, 0.2423994, -1.398237, 0.2, 1, 0, 1,
-0.4734108, -0.7057248, -3.016306, 0.1921569, 1, 0, 1,
-0.4701264, -2.448702, -1.365144, 0.1882353, 1, 0, 1,
-0.4667256, -0.2093647, -1.076172, 0.1803922, 1, 0, 1,
-0.4638979, -1.631751, -1.342237, 0.1764706, 1, 0, 1,
-0.4621792, -1.12708, -4.008405, 0.1686275, 1, 0, 1,
-0.4596294, -0.5595945, -1.958052, 0.1647059, 1, 0, 1,
-0.4594912, 0.6756902, 0.1730592, 0.1568628, 1, 0, 1,
-0.4583805, 1.186666, 0.1743262, 0.1529412, 1, 0, 1,
-0.457301, 2.042971, 0.3522757, 0.145098, 1, 0, 1,
-0.4555634, 0.689447, 0.7414544, 0.1411765, 1, 0, 1,
-0.4543047, 0.4110529, -1.347969, 0.1333333, 1, 0, 1,
-0.4539183, -1.536067, -2.297389, 0.1294118, 1, 0, 1,
-0.4533708, -0.5581504, -2.478, 0.1215686, 1, 0, 1,
-0.4501333, 0.1296028, 0.3183877, 0.1176471, 1, 0, 1,
-0.4492813, -0.7686453, -2.745091, 0.1098039, 1, 0, 1,
-0.4459675, -1.005294, -2.100566, 0.1058824, 1, 0, 1,
-0.4450827, -0.5428815, -3.118982, 0.09803922, 1, 0, 1,
-0.444091, -0.0357533, -1.685943, 0.09019608, 1, 0, 1,
-0.4389986, 0.4130756, -1.061197, 0.08627451, 1, 0, 1,
-0.4375887, -0.5689214, -2.158775, 0.07843138, 1, 0, 1,
-0.4370624, -1.331569, -3.23249, 0.07450981, 1, 0, 1,
-0.4356243, -0.7827371, -2.737775, 0.06666667, 1, 0, 1,
-0.4355973, -0.1242231, -0.4303832, 0.0627451, 1, 0, 1,
-0.4312656, -0.01708851, -0.5913054, 0.05490196, 1, 0, 1,
-0.4246298, 0.4939391, -0.8376283, 0.05098039, 1, 0, 1,
-0.4243515, -0.2056204, -1.772189, 0.04313726, 1, 0, 1,
-0.4223861, -1.454875, -2.782421, 0.03921569, 1, 0, 1,
-0.4186088, -0.05340479, -0.4514196, 0.03137255, 1, 0, 1,
-0.4175814, -0.2574938, -3.133627, 0.02745098, 1, 0, 1,
-0.4138834, 0.5287548, 0.173, 0.01960784, 1, 0, 1,
-0.4093303, -0.1681519, -2.108567, 0.01568628, 1, 0, 1,
-0.4046118, 1.875102, 0.02426587, 0.007843138, 1, 0, 1,
-0.4040248, -1.719476, -2.051005, 0.003921569, 1, 0, 1,
-0.4016858, -1.179023, -1.973887, 0, 1, 0.003921569, 1,
-0.3879475, 0.01750342, -2.347807, 0, 1, 0.01176471, 1,
-0.3806194, -1.825347, -3.008455, 0, 1, 0.01568628, 1,
-0.3789742, 0.2562862, -0.2793482, 0, 1, 0.02352941, 1,
-0.3773369, 0.057523, -1.223842, 0, 1, 0.02745098, 1,
-0.3771072, -1.448248, -2.604786, 0, 1, 0.03529412, 1,
-0.3666038, -0.2884081, -2.911769, 0, 1, 0.03921569, 1,
-0.365884, 2.416997, -0.08357308, 0, 1, 0.04705882, 1,
-0.3633296, -1.559145, -2.207433, 0, 1, 0.05098039, 1,
-0.3630441, 1.346988, 0.7022855, 0, 1, 0.05882353, 1,
-0.3629674, 1.099927, -0.468164, 0, 1, 0.0627451, 1,
-0.3611454, -0.110017, -1.354465, 0, 1, 0.07058824, 1,
-0.3566552, 0.724053, -0.6005648, 0, 1, 0.07450981, 1,
-0.3447356, -0.9183179, -2.674228, 0, 1, 0.08235294, 1,
-0.344301, 0.4855376, -0.1611139, 0, 1, 0.08627451, 1,
-0.343978, -0.1455977, -4.266226, 0, 1, 0.09411765, 1,
-0.3421959, -0.7098894, -2.435906, 0, 1, 0.1019608, 1,
-0.3420309, 1.252467, -0.0626896, 0, 1, 0.1058824, 1,
-0.3363209, 1.035519, -0.9378477, 0, 1, 0.1137255, 1,
-0.3326539, -1.002154, -1.946296, 0, 1, 0.1176471, 1,
-0.3325307, -0.499702, -4.228825, 0, 1, 0.1254902, 1,
-0.3298157, -0.794048, -1.669182, 0, 1, 0.1294118, 1,
-0.3197166, 0.07060047, -1.997741, 0, 1, 0.1372549, 1,
-0.3177126, 0.4036842, 1.397298, 0, 1, 0.1411765, 1,
-0.3154367, 0.4947802, 0.4653465, 0, 1, 0.1490196, 1,
-0.3153274, -0.4035851, -1.096642, 0, 1, 0.1529412, 1,
-0.3137647, 0.4881534, -0.03939116, 0, 1, 0.1607843, 1,
-0.3118359, -0.6336897, -0.9027638, 0, 1, 0.1647059, 1,
-0.3082721, -0.5671263, -2.454795, 0, 1, 0.172549, 1,
-0.3072331, -0.9096057, -2.146708, 0, 1, 0.1764706, 1,
-0.3066587, 0.606912, 0.3318677, 0, 1, 0.1843137, 1,
-0.3060548, 0.9797912, -1.193002, 0, 1, 0.1882353, 1,
-0.3060392, -0.04579026, -0.4832247, 0, 1, 0.1960784, 1,
-0.3058857, -0.9857796, -3.603466, 0, 1, 0.2039216, 1,
-0.3047982, 0.4787901, -0.8597512, 0, 1, 0.2078431, 1,
-0.3023234, -1.268658, -3.903328, 0, 1, 0.2156863, 1,
-0.2964043, -0.4207533, -1.88958, 0, 1, 0.2196078, 1,
-0.2959041, -0.4965905, 0.08208195, 0, 1, 0.227451, 1,
-0.2919713, -0.7128057, -1.829479, 0, 1, 0.2313726, 1,
-0.2907459, 2.167322, 0.4635832, 0, 1, 0.2392157, 1,
-0.2879224, 0.8980302, -1.350719, 0, 1, 0.2431373, 1,
-0.2823375, -0.6223761, -3.348423, 0, 1, 0.2509804, 1,
-0.2780244, 1.201614, -3.414863, 0, 1, 0.254902, 1,
-0.2773264, 0.2646428, -1.316152, 0, 1, 0.2627451, 1,
-0.2755966, 0.110881, -0.2966384, 0, 1, 0.2666667, 1,
-0.2711979, -0.08044894, -1.667695, 0, 1, 0.2745098, 1,
-0.2711042, -1.45041, -2.708689, 0, 1, 0.2784314, 1,
-0.2708209, 0.8886789, -0.9299248, 0, 1, 0.2862745, 1,
-0.2696786, 1.089325, 0.624247, 0, 1, 0.2901961, 1,
-0.252448, -2.276545, -1.185012, 0, 1, 0.2980392, 1,
-0.2455566, -0.7174824, -2.35278, 0, 1, 0.3058824, 1,
-0.2414763, 0.7668176, 0.2313151, 0, 1, 0.3098039, 1,
-0.2399547, 0.2362743, -0.9163765, 0, 1, 0.3176471, 1,
-0.2378751, -0.1750382, -2.210376, 0, 1, 0.3215686, 1,
-0.2378417, 0.8179354, 1.664675, 0, 1, 0.3294118, 1,
-0.236148, 1.4671, -0.7527595, 0, 1, 0.3333333, 1,
-0.2360521, 0.1962027, 0.4983929, 0, 1, 0.3411765, 1,
-0.2355781, 1.65691, 0.6026639, 0, 1, 0.345098, 1,
-0.2353212, -1.123829, -4.226906, 0, 1, 0.3529412, 1,
-0.2341022, 0.3486134, -1.243214, 0, 1, 0.3568628, 1,
-0.2322989, -0.05978278, -2.573427, 0, 1, 0.3647059, 1,
-0.2297597, 1.343094, -0.754017, 0, 1, 0.3686275, 1,
-0.22581, 0.7973778, 1.26877, 0, 1, 0.3764706, 1,
-0.2174475, -2.264606, -2.677829, 0, 1, 0.3803922, 1,
-0.2173439, -0.9538276, -1.89713, 0, 1, 0.3882353, 1,
-0.2143029, 0.5083963, -0.9512252, 0, 1, 0.3921569, 1,
-0.2106078, 1.12298, -1.288857, 0, 1, 0.4, 1,
-0.2061507, -0.8226717, -3.236904, 0, 1, 0.4078431, 1,
-0.2047149, -0.3615503, -3.257285, 0, 1, 0.4117647, 1,
-0.1980423, -1.127466, -2.043441, 0, 1, 0.4196078, 1,
-0.1944339, 0.5206455, -0.8431041, 0, 1, 0.4235294, 1,
-0.1917559, -0.2216389, -0.6426449, 0, 1, 0.4313726, 1,
-0.1909112, -0.9641036, -4.866117, 0, 1, 0.4352941, 1,
-0.1867191, -0.4623312, -3.190931, 0, 1, 0.4431373, 1,
-0.176953, 0.06256233, -1.293457, 0, 1, 0.4470588, 1,
-0.1759975, -1.660044, -5.018692, 0, 1, 0.454902, 1,
-0.1738367, -1.591882, -3.096392, 0, 1, 0.4588235, 1,
-0.1688137, 0.2207053, -0.9996064, 0, 1, 0.4666667, 1,
-0.1648592, 1.040573, 0.2407284, 0, 1, 0.4705882, 1,
-0.1615283, -0.02350562, -2.016736, 0, 1, 0.4784314, 1,
-0.1595362, -0.8546938, -0.9814101, 0, 1, 0.4823529, 1,
-0.1581906, -0.3651309, -3.856471, 0, 1, 0.4901961, 1,
-0.1569869, -0.1298569, -1.483817, 0, 1, 0.4941176, 1,
-0.1563426, -1.909692, -3.836996, 0, 1, 0.5019608, 1,
-0.1563366, -1.395569, -2.481634, 0, 1, 0.509804, 1,
-0.1555298, 1.009922, 0.1933587, 0, 1, 0.5137255, 1,
-0.1554763, 2.256873, -0.2587759, 0, 1, 0.5215687, 1,
-0.1506053, 0.5668839, -0.6199213, 0, 1, 0.5254902, 1,
-0.1497502, -0.3872863, -3.856174, 0, 1, 0.5333334, 1,
-0.1473223, -0.6123977, -2.190513, 0, 1, 0.5372549, 1,
-0.1437069, -0.6793223, -2.358387, 0, 1, 0.5450981, 1,
-0.1385107, -0.4498247, -4.324721, 0, 1, 0.5490196, 1,
-0.1376962, 0.1062093, -0.3108748, 0, 1, 0.5568628, 1,
-0.1343455, 1.889828, -0.1708896, 0, 1, 0.5607843, 1,
-0.1329099, 0.002445973, -2.591352, 0, 1, 0.5686275, 1,
-0.1326694, 0.5225472, 1.950298, 0, 1, 0.572549, 1,
-0.132306, 0.5094993, 1.829728, 0, 1, 0.5803922, 1,
-0.1288435, -0.1053168, -2.945093, 0, 1, 0.5843138, 1,
-0.1280581, 1.014216, -0.8590459, 0, 1, 0.5921569, 1,
-0.127868, -0.7297609, -4.229462, 0, 1, 0.5960785, 1,
-0.127284, 1.155796, 0.9217868, 0, 1, 0.6039216, 1,
-0.1263913, -0.6250516, -4.840451, 0, 1, 0.6117647, 1,
-0.1240383, 1.059793, -0.1204909, 0, 1, 0.6156863, 1,
-0.1237817, -1.009773, -2.235026, 0, 1, 0.6235294, 1,
-0.1211213, 0.1822292, -1.398236, 0, 1, 0.627451, 1,
-0.1163299, -1.020635, -2.599088, 0, 1, 0.6352941, 1,
-0.1130018, -0.9551668, -3.475635, 0, 1, 0.6392157, 1,
-0.1125779, -0.8828096, -2.423686, 0, 1, 0.6470588, 1,
-0.1096646, 1.544585, -0.1627573, 0, 1, 0.6509804, 1,
-0.1092202, 1.190083, 0.8661823, 0, 1, 0.6588235, 1,
-0.1069366, -0.7186147, -3.738728, 0, 1, 0.6627451, 1,
-0.1050514, 0.5732275, 0.5574763, 0, 1, 0.6705883, 1,
-0.1043793, -0.410489, -3.026575, 0, 1, 0.6745098, 1,
-0.1037661, 0.3294854, 0.826575, 0, 1, 0.682353, 1,
-0.1012427, -0.330596, -3.596297, 0, 1, 0.6862745, 1,
-0.09943587, 0.9327407, -0.09579605, 0, 1, 0.6941177, 1,
-0.09660956, -0.08939616, -1.05682, 0, 1, 0.7019608, 1,
-0.09619358, -0.4358331, -2.132929, 0, 1, 0.7058824, 1,
-0.09611726, -1.367107, -2.738895, 0, 1, 0.7137255, 1,
-0.09459002, -0.9690658, -3.111248, 0, 1, 0.7176471, 1,
-0.0936161, -0.1992485, -1.968644, 0, 1, 0.7254902, 1,
-0.09186014, -1.524481, -3.867157, 0, 1, 0.7294118, 1,
-0.09102529, -1.204144, -2.246237, 0, 1, 0.7372549, 1,
-0.0874263, -0.2371154, -3.754342, 0, 1, 0.7411765, 1,
-0.08630924, 1.195692, -0.2743893, 0, 1, 0.7490196, 1,
-0.08568107, 0.2949795, -1.246306, 0, 1, 0.7529412, 1,
-0.08499681, 0.3260452, 0.1329508, 0, 1, 0.7607843, 1,
-0.08410241, -0.2990079, -3.612502, 0, 1, 0.7647059, 1,
-0.07915551, 0.3438356, -1.382859, 0, 1, 0.772549, 1,
-0.07763194, 0.6545252, 0.2100511, 0, 1, 0.7764706, 1,
-0.07643519, 0.2742234, 1.707535, 0, 1, 0.7843137, 1,
-0.07571233, -1.681777, -2.130551, 0, 1, 0.7882353, 1,
-0.07436609, -1.031368, -3.16392, 0, 1, 0.7960784, 1,
-0.07343464, 0.5924888, -0.8947198, 0, 1, 0.8039216, 1,
-0.06911351, -0.4352423, -3.602589, 0, 1, 0.8078431, 1,
-0.06614736, -1.415779, -3.304916, 0, 1, 0.8156863, 1,
-0.06496055, 0.3642779, 0.464127, 0, 1, 0.8196079, 1,
-0.05926963, -0.6818843, -2.532162, 0, 1, 0.827451, 1,
-0.05827416, -0.002890115, -2.13163, 0, 1, 0.8313726, 1,
-0.05596202, 1.165663, 1.258293, 0, 1, 0.8392157, 1,
-0.05462954, 1.195794, -0.5322841, 0, 1, 0.8431373, 1,
-0.05372632, -0.1319169, -0.3817449, 0, 1, 0.8509804, 1,
-0.0522889, -1.163041, -3.058106, 0, 1, 0.854902, 1,
-0.05107023, -1.102592, -2.736816, 0, 1, 0.8627451, 1,
-0.04646517, 0.1103803, -1.801257, 0, 1, 0.8666667, 1,
-0.04646335, -1.363427, -1.635574, 0, 1, 0.8745098, 1,
-0.04162722, 0.2866696, 0.3640328, 0, 1, 0.8784314, 1,
-0.04144198, -0.8052638, -1.691249, 0, 1, 0.8862745, 1,
-0.03568134, -1.390374, -3.71451, 0, 1, 0.8901961, 1,
-0.0352122, -0.3175963, -3.60963, 0, 1, 0.8980392, 1,
-0.03500951, -0.2299981, -2.193264, 0, 1, 0.9058824, 1,
-0.03489049, -1.087066, -2.48889, 0, 1, 0.9098039, 1,
-0.0293153, 0.737571, -0.1970905, 0, 1, 0.9176471, 1,
-0.02790242, -1.584379, -3.433377, 0, 1, 0.9215686, 1,
-0.02144405, -0.503316, -2.834296, 0, 1, 0.9294118, 1,
-0.02047714, 0.6652878, -0.7308106, 0, 1, 0.9333333, 1,
-0.01258199, 0.7415779, -0.6194552, 0, 1, 0.9411765, 1,
-0.009753328, 1.218263, -1.941497, 0, 1, 0.945098, 1,
0.0002110423, -1.785018, 2.963239, 0, 1, 0.9529412, 1,
0.0008885647, 1.072209, -0.4739206, 0, 1, 0.9568627, 1,
0.001444633, 0.05242748, 1.17995, 0, 1, 0.9647059, 1,
0.002430364, 0.1213349, 0.2237646, 0, 1, 0.9686275, 1,
0.002951532, -0.04166358, 2.805568, 0, 1, 0.9764706, 1,
0.004112671, 0.02648768, 1.712835, 0, 1, 0.9803922, 1,
0.004634446, 1.682394, -1.25974, 0, 1, 0.9882353, 1,
0.009045279, -0.4064409, 2.88111, 0, 1, 0.9921569, 1,
0.01358035, -0.7880347, 3.531832, 0, 1, 1, 1,
0.01782667, -0.4182298, 2.754651, 0, 0.9921569, 1, 1,
0.02042169, -0.4473577, 2.202334, 0, 0.9882353, 1, 1,
0.02449297, -0.8668624, 2.913471, 0, 0.9803922, 1, 1,
0.02459793, 1.042971, -0.7616668, 0, 0.9764706, 1, 1,
0.02573384, 0.1307756, 2.524509, 0, 0.9686275, 1, 1,
0.02752446, 2.204481, 0.1396751, 0, 0.9647059, 1, 1,
0.03372013, 0.7937198, 0.1745145, 0, 0.9568627, 1, 1,
0.03456129, 0.05760941, 1.179268, 0, 0.9529412, 1, 1,
0.03474002, -1.436971, 2.054814, 0, 0.945098, 1, 1,
0.03894945, -0.3021857, 2.90039, 0, 0.9411765, 1, 1,
0.04405789, -0.1512201, 3.48591, 0, 0.9333333, 1, 1,
0.04409659, -0.2663472, 4.215693, 0, 0.9294118, 1, 1,
0.04861227, -2.042566, 2.544334, 0, 0.9215686, 1, 1,
0.04920426, -0.01190787, 1.479201, 0, 0.9176471, 1, 1,
0.05321407, -0.9302136, 2.493491, 0, 0.9098039, 1, 1,
0.05627653, -0.2609389, 1.601245, 0, 0.9058824, 1, 1,
0.05644096, 1.324899, -0.4252476, 0, 0.8980392, 1, 1,
0.0570359, -1.477568, 2.796586, 0, 0.8901961, 1, 1,
0.05829708, 0.08483902, 1.955432, 0, 0.8862745, 1, 1,
0.06273144, -0.3920094, 2.936762, 0, 0.8784314, 1, 1,
0.06432556, 0.4584069, 0.8592123, 0, 0.8745098, 1, 1,
0.06750632, -1.695506, 0.540805, 0, 0.8666667, 1, 1,
0.07093416, 0.7690924, -1.196039, 0, 0.8627451, 1, 1,
0.07236142, -0.9590554, 2.955783, 0, 0.854902, 1, 1,
0.07413425, 0.5476354, 0.03422075, 0, 0.8509804, 1, 1,
0.07539967, -0.5597548, 4.497503, 0, 0.8431373, 1, 1,
0.07871906, 0.6435215, -0.9763511, 0, 0.8392157, 1, 1,
0.07959285, -1.13521, 3.107877, 0, 0.8313726, 1, 1,
0.08281123, 0.5830595, 0.5239447, 0, 0.827451, 1, 1,
0.08653627, -0.3330429, 2.761106, 0, 0.8196079, 1, 1,
0.09092185, 0.2690978, 0.8010984, 0, 0.8156863, 1, 1,
0.09409241, 0.6619576, 0.4703259, 0, 0.8078431, 1, 1,
0.09585752, -2.204911, 2.302407, 0, 0.8039216, 1, 1,
0.09888633, 0.2326707, 0.415783, 0, 0.7960784, 1, 1,
0.09949323, 2.356566, -0.4251252, 0, 0.7882353, 1, 1,
0.1005938, 0.0320372, -0.04941355, 0, 0.7843137, 1, 1,
0.1026211, -1.221407, 4.001513, 0, 0.7764706, 1, 1,
0.105966, 0.5266945, 0.02326741, 0, 0.772549, 1, 1,
0.1079474, -0.2599682, 3.201983, 0, 0.7647059, 1, 1,
0.1084261, 1.473467, 0.6499816, 0, 0.7607843, 1, 1,
0.1103545, -0.04975354, 2.678521, 0, 0.7529412, 1, 1,
0.1110203, 0.7227894, 0.5239395, 0, 0.7490196, 1, 1,
0.1122292, -0.673641, 1.944083, 0, 0.7411765, 1, 1,
0.1142978, -0.7963513, 2.84874, 0, 0.7372549, 1, 1,
0.1157391, 0.8529604, 0.4627804, 0, 0.7294118, 1, 1,
0.116095, 1.316986, -0.1057538, 0, 0.7254902, 1, 1,
0.116747, 1.392934, -0.2150762, 0, 0.7176471, 1, 1,
0.1224932, 0.8798743, -0.1958278, 0, 0.7137255, 1, 1,
0.1241542, -0.9233531, 3.225994, 0, 0.7058824, 1, 1,
0.1250401, 0.6423789, -2.029785, 0, 0.6980392, 1, 1,
0.1257399, -0.9334177, 3.198361, 0, 0.6941177, 1, 1,
0.1257707, -1.650439, 3.496079, 0, 0.6862745, 1, 1,
0.1288648, -0.2524931, 5.120406, 0, 0.682353, 1, 1,
0.1303399, 0.4108717, 2.378483, 0, 0.6745098, 1, 1,
0.1312426, 1.641836, -2.133995, 0, 0.6705883, 1, 1,
0.1316451, 0.887517, 1.931339, 0, 0.6627451, 1, 1,
0.1377451, -0.5784302, 2.395647, 0, 0.6588235, 1, 1,
0.1379401, -1.918201, 4.730864, 0, 0.6509804, 1, 1,
0.1435427, -0.4387799, 3.123898, 0, 0.6470588, 1, 1,
0.1453272, -0.1185085, 2.113378, 0, 0.6392157, 1, 1,
0.1524348, -2.207744, 4.11597, 0, 0.6352941, 1, 1,
0.1553236, 1.012394, -0.4429782, 0, 0.627451, 1, 1,
0.1556162, -1.233059, 1.621742, 0, 0.6235294, 1, 1,
0.1567781, 1.811316, -1.201712, 0, 0.6156863, 1, 1,
0.1629637, 2.018254, -0.3945727, 0, 0.6117647, 1, 1,
0.1648574, -0.5382347, 3.339744, 0, 0.6039216, 1, 1,
0.1667634, 1.081183, -0.0572272, 0, 0.5960785, 1, 1,
0.1695607, 0.7477013, 2.270875, 0, 0.5921569, 1, 1,
0.1699724, -0.2161538, 4.293231, 0, 0.5843138, 1, 1,
0.1726444, 0.6088846, -1.030533, 0, 0.5803922, 1, 1,
0.1740046, 0.2259965, -0.3112855, 0, 0.572549, 1, 1,
0.1756672, 0.2702504, 0.6901917, 0, 0.5686275, 1, 1,
0.1763013, 1.008747, -0.08980121, 0, 0.5607843, 1, 1,
0.1830918, -1.845076, 2.454308, 0, 0.5568628, 1, 1,
0.1832829, -1.425083, 2.192709, 0, 0.5490196, 1, 1,
0.1840048, -1.288244, 3.46662, 0, 0.5450981, 1, 1,
0.1853785, -0.2571388, 2.024235, 0, 0.5372549, 1, 1,
0.1854952, -0.5789837, 2.727144, 0, 0.5333334, 1, 1,
0.1856572, -0.4090532, 2.650724, 0, 0.5254902, 1, 1,
0.1905496, -0.5744817, 3.492821, 0, 0.5215687, 1, 1,
0.1911007, -1.187616, 3.728894, 0, 0.5137255, 1, 1,
0.1912129, -0.3913482, 2.916965, 0, 0.509804, 1, 1,
0.1925861, -0.5186611, 1.98923, 0, 0.5019608, 1, 1,
0.1950335, -0.9379783, 3.246332, 0, 0.4941176, 1, 1,
0.1974436, -1.787016, 3.474129, 0, 0.4901961, 1, 1,
0.2010025, 0.08365057, 0.2661813, 0, 0.4823529, 1, 1,
0.2061548, -1.65693, 3.929183, 0, 0.4784314, 1, 1,
0.2071299, 0.3832443, 0.7920924, 0, 0.4705882, 1, 1,
0.2105185, 0.3634078, 0.2435034, 0, 0.4666667, 1, 1,
0.2128295, -0.9792885, 1.763723, 0, 0.4588235, 1, 1,
0.2131285, 0.5239241, 1.048771, 0, 0.454902, 1, 1,
0.2185879, 0.3806611, 1.875956, 0, 0.4470588, 1, 1,
0.2210518, 0.01405214, 3.605983, 0, 0.4431373, 1, 1,
0.2252084, -1.019691, 3.226831, 0, 0.4352941, 1, 1,
0.2255002, -0.6830221, 2.475364, 0, 0.4313726, 1, 1,
0.2283682, -1.853249, 4.138293, 0, 0.4235294, 1, 1,
0.2318459, 0.3719667, 1.002434, 0, 0.4196078, 1, 1,
0.2321765, -1.928173, 2.803126, 0, 0.4117647, 1, 1,
0.2343217, 1.430071, -0.2840559, 0, 0.4078431, 1, 1,
0.2358224, 1.206506, 0.5620054, 0, 0.4, 1, 1,
0.2367222, 0.9129397, 0.2608426, 0, 0.3921569, 1, 1,
0.2373318, -0.1002306, 1.31356, 0, 0.3882353, 1, 1,
0.2375802, -1.553605, 2.722407, 0, 0.3803922, 1, 1,
0.2397456, -0.8652261, 1.467264, 0, 0.3764706, 1, 1,
0.2408055, -0.3950775, 2.974738, 0, 0.3686275, 1, 1,
0.2449526, 0.9555804, 1.772507, 0, 0.3647059, 1, 1,
0.2468566, -0.9776262, 2.14864, 0, 0.3568628, 1, 1,
0.2474644, 0.2334729, 0.01642241, 0, 0.3529412, 1, 1,
0.2489594, 2.237995, 1.671157, 0, 0.345098, 1, 1,
0.2508095, 2.916248, 0.4889427, 0, 0.3411765, 1, 1,
0.2547392, -0.5812382, 2.240802, 0, 0.3333333, 1, 1,
0.2551215, 0.2132746, 0.5561551, 0, 0.3294118, 1, 1,
0.2584303, 0.200373, -0.1957985, 0, 0.3215686, 1, 1,
0.2600592, 0.7665951, 0.1477107, 0, 0.3176471, 1, 1,
0.2663893, 0.4003861, 0.07558999, 0, 0.3098039, 1, 1,
0.2665768, -0.5410533, 1.779388, 0, 0.3058824, 1, 1,
0.2681365, -0.7411779, 3.740601, 0, 0.2980392, 1, 1,
0.268953, 0.940607, 1.115239, 0, 0.2901961, 1, 1,
0.2692681, -0.445302, 2.286364, 0, 0.2862745, 1, 1,
0.2735788, -0.8134959, 3.670875, 0, 0.2784314, 1, 1,
0.273895, 0.4459791, 0.8797196, 0, 0.2745098, 1, 1,
0.2773463, 0.400943, 1.935077, 0, 0.2666667, 1, 1,
0.2787955, 1.399372, 0.7666824, 0, 0.2627451, 1, 1,
0.2805402, -0.2039088, 2.023684, 0, 0.254902, 1, 1,
0.2814352, 0.3453996, 0.7446241, 0, 0.2509804, 1, 1,
0.2832018, -1.255726, 3.925631, 0, 0.2431373, 1, 1,
0.2834817, -0.3588598, 2.764157, 0, 0.2392157, 1, 1,
0.2944261, 0.7667146, 0.3210687, 0, 0.2313726, 1, 1,
0.2950984, -0.664803, 2.100504, 0, 0.227451, 1, 1,
0.3050975, -1.067518, 2.869126, 0, 0.2196078, 1, 1,
0.3052913, 0.6979625, 2.756918, 0, 0.2156863, 1, 1,
0.3080442, -1.858909, 2.531702, 0, 0.2078431, 1, 1,
0.3131669, 0.5844269, -0.3587559, 0, 0.2039216, 1, 1,
0.3133085, -1.032865, 2.036176, 0, 0.1960784, 1, 1,
0.3133892, 0.07021457, 1.838719, 0, 0.1882353, 1, 1,
0.3160726, -1.448424, 1.71604, 0, 0.1843137, 1, 1,
0.3187811, -0.09724976, 3.900841, 0, 0.1764706, 1, 1,
0.3236709, 0.1812594, 0.9861454, 0, 0.172549, 1, 1,
0.3247582, 0.6290825, 1.022602, 0, 0.1647059, 1, 1,
0.3284987, -0.9413704, 3.142113, 0, 0.1607843, 1, 1,
0.3346211, -0.7771176, 3.956773, 0, 0.1529412, 1, 1,
0.3405313, -0.901895, 3.713173, 0, 0.1490196, 1, 1,
0.3433255, 1.178092, -0.005079371, 0, 0.1411765, 1, 1,
0.3434475, 1.170561, 0.3438286, 0, 0.1372549, 1, 1,
0.3444667, 0.3195233, 3.237872, 0, 0.1294118, 1, 1,
0.3488419, 0.002982343, 1.216051, 0, 0.1254902, 1, 1,
0.3550488, -0.4334159, 4.498943, 0, 0.1176471, 1, 1,
0.3577718, -1.901227, 3.59527, 0, 0.1137255, 1, 1,
0.358539, -0.5095873, 1.074011, 0, 0.1058824, 1, 1,
0.3696553, -0.03394556, 0.8164033, 0, 0.09803922, 1, 1,
0.3722574, -0.6505252, 2.586313, 0, 0.09411765, 1, 1,
0.3741504, 0.7741693, 0.2853332, 0, 0.08627451, 1, 1,
0.3761178, -2.114425, 3.418023, 0, 0.08235294, 1, 1,
0.3763998, 0.4671114, 0.05108569, 0, 0.07450981, 1, 1,
0.3769427, 0.5191141, 2.59489, 0, 0.07058824, 1, 1,
0.3802648, -1.915471, 3.575794, 0, 0.0627451, 1, 1,
0.3803214, -0.3749803, 2.398046, 0, 0.05882353, 1, 1,
0.3816144, -1.274588, 2.033121, 0, 0.05098039, 1, 1,
0.3834007, 2.194329, 1.161913, 0, 0.04705882, 1, 1,
0.3883258, -1.412913, 3.228272, 0, 0.03921569, 1, 1,
0.3904954, -0.3104152, 1.677681, 0, 0.03529412, 1, 1,
0.3917453, -0.1458979, 2.034809, 0, 0.02745098, 1, 1,
0.3952186, 1.244278, 1.276949, 0, 0.02352941, 1, 1,
0.3980681, 0.1732737, 2.083767, 0, 0.01568628, 1, 1,
0.4005683, -0.4219735, -0.1302505, 0, 0.01176471, 1, 1,
0.401068, -1.34892, 3.990084, 0, 0.003921569, 1, 1,
0.4041888, -0.4327212, 0.7384658, 0.003921569, 0, 1, 1,
0.4117286, -0.3846537, 2.169941, 0.007843138, 0, 1, 1,
0.4120349, 0.4071511, 1.061438, 0.01568628, 0, 1, 1,
0.4120892, -2.083185, 1.715429, 0.01960784, 0, 1, 1,
0.4232476, 0.4834874, 1.097852, 0.02745098, 0, 1, 1,
0.4260351, 0.3466443, 1.874983, 0.03137255, 0, 1, 1,
0.4292601, 0.2841763, 2.024179, 0.03921569, 0, 1, 1,
0.4293146, -0.1367014, 2.761212, 0.04313726, 0, 1, 1,
0.4306095, -0.9848344, 4.813599, 0.05098039, 0, 1, 1,
0.4327763, 1.335061, 1.717054, 0.05490196, 0, 1, 1,
0.436524, -1.482087, 2.883119, 0.0627451, 0, 1, 1,
0.438094, 0.5273108, 1.574967, 0.06666667, 0, 1, 1,
0.4394258, 0.5685338, 0.2741086, 0.07450981, 0, 1, 1,
0.4408536, 1.520693, -0.1259757, 0.07843138, 0, 1, 1,
0.4415589, 0.26268, 1.225393, 0.08627451, 0, 1, 1,
0.4431905, -0.2589263, 0.6748558, 0.09019608, 0, 1, 1,
0.4503381, -0.8422009, 1.658728, 0.09803922, 0, 1, 1,
0.4505542, -0.8431058, 1.795552, 0.1058824, 0, 1, 1,
0.4512107, 0.3807344, -1.214192, 0.1098039, 0, 1, 1,
0.4527006, 0.4209149, -0.3260105, 0.1176471, 0, 1, 1,
0.4559796, -1.23102, 3.224381, 0.1215686, 0, 1, 1,
0.4579028, 3.20173, 0.3426515, 0.1294118, 0, 1, 1,
0.4579073, -0.3497933, 0.9419771, 0.1333333, 0, 1, 1,
0.460603, 0.9721842, -0.2856756, 0.1411765, 0, 1, 1,
0.46117, -0.7234437, 1.182258, 0.145098, 0, 1, 1,
0.4655949, 0.240921, 0.4372798, 0.1529412, 0, 1, 1,
0.4666583, 1.605249, -1.167325, 0.1568628, 0, 1, 1,
0.4703793, -1.127877, 3.617346, 0.1647059, 0, 1, 1,
0.4720809, -0.3469135, 3.401907, 0.1686275, 0, 1, 1,
0.4760462, 0.1965569, -0.9862297, 0.1764706, 0, 1, 1,
0.4842788, -1.142358, 1.897856, 0.1803922, 0, 1, 1,
0.4851779, -2.467849, 2.195725, 0.1882353, 0, 1, 1,
0.4884632, 0.4126746, 1.461986, 0.1921569, 0, 1, 1,
0.4896814, -0.9750345, 2.928462, 0.2, 0, 1, 1,
0.4901961, -0.2752967, 1.695615, 0.2078431, 0, 1, 1,
0.4956948, -0.1126912, 3.795517, 0.2117647, 0, 1, 1,
0.4972807, 1.200398, 0.3613016, 0.2196078, 0, 1, 1,
0.4980719, 0.9124599, 0.6565998, 0.2235294, 0, 1, 1,
0.5011928, 0.1775974, 0.1142089, 0.2313726, 0, 1, 1,
0.5033989, -0.4993074, 1.915097, 0.2352941, 0, 1, 1,
0.5068683, 1.338524, 0.9530053, 0.2431373, 0, 1, 1,
0.5085549, -1.371593, 3.522729, 0.2470588, 0, 1, 1,
0.5095143, 0.24977, 1.385307, 0.254902, 0, 1, 1,
0.5120479, 1.226574, 1.314569, 0.2588235, 0, 1, 1,
0.512876, 0.9625472, 0.7725111, 0.2666667, 0, 1, 1,
0.5173634, 0.01613065, 1.11442, 0.2705882, 0, 1, 1,
0.5195296, -1.162586, 3.91648, 0.2784314, 0, 1, 1,
0.5196698, -0.2921875, 0.02013328, 0.282353, 0, 1, 1,
0.5198799, -0.6294898, -0.3215697, 0.2901961, 0, 1, 1,
0.5199584, -0.1186583, 1.227711, 0.2941177, 0, 1, 1,
0.5226151, -0.2426535, 1.727749, 0.3019608, 0, 1, 1,
0.5229697, 0.8276395, 2.307947, 0.3098039, 0, 1, 1,
0.5233003, -1.043171, 1.519233, 0.3137255, 0, 1, 1,
0.5356013, 1.364289, -0.2595311, 0.3215686, 0, 1, 1,
0.5377455, 1.911393, -0.6507337, 0.3254902, 0, 1, 1,
0.5451164, 0.6914326, 1.072874, 0.3333333, 0, 1, 1,
0.5510029, 0.9821742, 0.8362488, 0.3372549, 0, 1, 1,
0.5558501, 2.081937, -0.1790472, 0.345098, 0, 1, 1,
0.5607816, -0.2342256, 0.1375167, 0.3490196, 0, 1, 1,
0.5678857, 0.1923989, 2.247755, 0.3568628, 0, 1, 1,
0.5724136, -0.2645082, 0.9470752, 0.3607843, 0, 1, 1,
0.5729203, -0.7848345, 2.225351, 0.3686275, 0, 1, 1,
0.5873904, 0.2967847, 1.845331, 0.372549, 0, 1, 1,
0.589772, 0.1285654, 1.025048, 0.3803922, 0, 1, 1,
0.5912836, 1.562629, 0.5873408, 0.3843137, 0, 1, 1,
0.5926603, -1.22861, 3.238307, 0.3921569, 0, 1, 1,
0.600408, 0.8031803, 0.02926622, 0.3960784, 0, 1, 1,
0.6042067, 0.6764889, 0.6986318, 0.4039216, 0, 1, 1,
0.6046149, -0.2877029, 1.793659, 0.4117647, 0, 1, 1,
0.6091683, 0.5784807, -0.7948251, 0.4156863, 0, 1, 1,
0.6139967, -1.273477, 3.555408, 0.4235294, 0, 1, 1,
0.6145041, -0.4362671, 1.697659, 0.427451, 0, 1, 1,
0.6238821, -0.1167409, 0.6293529, 0.4352941, 0, 1, 1,
0.6262324, -0.2751695, 3.29461, 0.4392157, 0, 1, 1,
0.6272549, 1.358954, 0.9417506, 0.4470588, 0, 1, 1,
0.6278841, 1.252393, 0.5716571, 0.4509804, 0, 1, 1,
0.6352993, -1.016816, 3.010662, 0.4588235, 0, 1, 1,
0.6353586, -0.1582224, 2.534324, 0.4627451, 0, 1, 1,
0.6380292, -1.639045, 2.444598, 0.4705882, 0, 1, 1,
0.6465878, -0.05482592, 2.312198, 0.4745098, 0, 1, 1,
0.6521583, 0.6913954, -0.4005376, 0.4823529, 0, 1, 1,
0.6553062, -0.02433563, 0.7942035, 0.4862745, 0, 1, 1,
0.6567644, 0.2314331, 1.91966, 0.4941176, 0, 1, 1,
0.6580353, -0.07560951, 1.133528, 0.5019608, 0, 1, 1,
0.6609572, 0.8695626, 1.151887, 0.5058824, 0, 1, 1,
0.663803, 0.5534849, 1.166589, 0.5137255, 0, 1, 1,
0.6651151, 1.227126, 1.202065, 0.5176471, 0, 1, 1,
0.6651666, -2.306367, 2.210886, 0.5254902, 0, 1, 1,
0.666597, 0.8919788, 1.025613, 0.5294118, 0, 1, 1,
0.6685732, 1.003928, 1.558881, 0.5372549, 0, 1, 1,
0.6696567, -0.8502436, 4.474113, 0.5411765, 0, 1, 1,
0.670276, -0.4601614, 1.588679, 0.5490196, 0, 1, 1,
0.673059, 0.6632028, 0.4742174, 0.5529412, 0, 1, 1,
0.6742938, 0.6473104, 0.5186543, 0.5607843, 0, 1, 1,
0.6772206, 1.606658, 1.158458, 0.5647059, 0, 1, 1,
0.6824523, 1.210848, 0.7142876, 0.572549, 0, 1, 1,
0.6833275, -0.5123725, 0.2422276, 0.5764706, 0, 1, 1,
0.6841521, 1.498474, -0.2554713, 0.5843138, 0, 1, 1,
0.688894, 1.334221, -0.1213534, 0.5882353, 0, 1, 1,
0.6907184, 0.6565799, 2.894782, 0.5960785, 0, 1, 1,
0.6945595, 0.760813, -0.4917796, 0.6039216, 0, 1, 1,
0.6986049, -2.065282, 2.419071, 0.6078432, 0, 1, 1,
0.6990322, 0.9184312, 2.56758, 0.6156863, 0, 1, 1,
0.699397, 0.2483863, 1.980861, 0.6196079, 0, 1, 1,
0.7019029, 0.3570317, 1.845701, 0.627451, 0, 1, 1,
0.7069653, -0.6562797, 1.358261, 0.6313726, 0, 1, 1,
0.7081332, 0.3061892, 0.7638801, 0.6392157, 0, 1, 1,
0.7093762, 0.4434691, 0.726954, 0.6431373, 0, 1, 1,
0.7096812, 0.9956757, 1.591826, 0.6509804, 0, 1, 1,
0.7135711, -0.02247863, 0.2580243, 0.654902, 0, 1, 1,
0.7139965, -0.9777958, 2.931548, 0.6627451, 0, 1, 1,
0.7208853, 0.5874266, 1.18615, 0.6666667, 0, 1, 1,
0.7212062, -0.384855, 2.78613, 0.6745098, 0, 1, 1,
0.7223111, -0.8869984, 1.819621, 0.6784314, 0, 1, 1,
0.7281089, 0.5001827, 0.7231051, 0.6862745, 0, 1, 1,
0.732801, -0.6237454, 2.780087, 0.6901961, 0, 1, 1,
0.7459887, -0.4900134, 3.42973, 0.6980392, 0, 1, 1,
0.7500126, -1.757775, 2.987129, 0.7058824, 0, 1, 1,
0.7513537, -0.2961577, 2.056342, 0.7098039, 0, 1, 1,
0.7524529, -0.1210372, 3.223532, 0.7176471, 0, 1, 1,
0.7544591, -0.4179031, 2.334988, 0.7215686, 0, 1, 1,
0.7563087, -0.001959177, 1.563164, 0.7294118, 0, 1, 1,
0.7563211, -1.136029, 2.026695, 0.7333333, 0, 1, 1,
0.759847, 1.237776, 1.592036, 0.7411765, 0, 1, 1,
0.7690278, -1.250141, 2.373174, 0.7450981, 0, 1, 1,
0.7740793, -0.2113366, 1.9762, 0.7529412, 0, 1, 1,
0.7788531, 0.1596692, -0.628668, 0.7568628, 0, 1, 1,
0.7815846, -0.02560687, 2.907059, 0.7647059, 0, 1, 1,
0.7817748, -1.16693, 2.703507, 0.7686275, 0, 1, 1,
0.7839049, -1.571353, 2.963149, 0.7764706, 0, 1, 1,
0.7849131, 0.4119092, 0.2328503, 0.7803922, 0, 1, 1,
0.7953826, 1.323222, 1.472837, 0.7882353, 0, 1, 1,
0.8028413, -0.1860149, 4.190888, 0.7921569, 0, 1, 1,
0.8085493, -0.4237943, 0.9368364, 0.8, 0, 1, 1,
0.8112513, -1.035367, 1.03045, 0.8078431, 0, 1, 1,
0.8147035, -0.2649925, 2.566428, 0.8117647, 0, 1, 1,
0.8150847, 0.2873369, 1.244252, 0.8196079, 0, 1, 1,
0.8185991, -0.03713376, 1.185169, 0.8235294, 0, 1, 1,
0.8215317, 1.535941, 0.1985728, 0.8313726, 0, 1, 1,
0.828333, 0.1435141, 0.445625, 0.8352941, 0, 1, 1,
0.8291609, -0.7552994, 4.359262, 0.8431373, 0, 1, 1,
0.8323577, 1.224062, -1.514264, 0.8470588, 0, 1, 1,
0.8352063, -0.9188433, 3.173008, 0.854902, 0, 1, 1,
0.8464888, -0.0337505, 0.08762366, 0.8588235, 0, 1, 1,
0.8503461, -1.65424, 1.66814, 0.8666667, 0, 1, 1,
0.8568457, -0.5953881, 2.244596, 0.8705882, 0, 1, 1,
0.8637661, 1.574306, -0.09608464, 0.8784314, 0, 1, 1,
0.8671984, 0.3880445, 0.9346507, 0.8823529, 0, 1, 1,
0.8698667, -1.176111, 2.429637, 0.8901961, 0, 1, 1,
0.8941813, 2.360055, 0.9160711, 0.8941177, 0, 1, 1,
0.8969658, -1.215682, 2.363265, 0.9019608, 0, 1, 1,
0.9099406, -0.5526549, 0.929134, 0.9098039, 0, 1, 1,
0.9151796, 1.767643, 0.2818445, 0.9137255, 0, 1, 1,
0.9158601, -0.9761482, 3.186025, 0.9215686, 0, 1, 1,
0.918279, 0.6126166, 0.6526795, 0.9254902, 0, 1, 1,
0.921513, -0.8743834, 3.81065, 0.9333333, 0, 1, 1,
0.9217904, -1.171155, 1.503953, 0.9372549, 0, 1, 1,
0.9218309, 0.3815419, -0.3176627, 0.945098, 0, 1, 1,
0.9281657, -0.9906667, 2.153274, 0.9490196, 0, 1, 1,
0.9288777, -2.001352, 1.874491, 0.9568627, 0, 1, 1,
0.9351091, -0.172717, -0.7304629, 0.9607843, 0, 1, 1,
0.9366951, 1.323584, -1.848936, 0.9686275, 0, 1, 1,
0.9411042, 0.4743365, 0.936793, 0.972549, 0, 1, 1,
0.9420859, -0.9479465, 1.765396, 0.9803922, 0, 1, 1,
0.9438428, 1.391257, -0.2145988, 0.9843137, 0, 1, 1,
0.9481717, -1.956319, 1.976602, 0.9921569, 0, 1, 1,
0.9484283, 0.1933426, 3.886392, 0.9960784, 0, 1, 1,
0.9490334, -2.273706, 1.357138, 1, 0, 0.9960784, 1,
0.9526097, 1.458819, 0.3634012, 1, 0, 0.9882353, 1,
0.9527327, -1.440925, 1.597983, 1, 0, 0.9843137, 1,
0.95674, -1.616007, 2.483265, 1, 0, 0.9764706, 1,
0.9623366, -1.928109, 3.297167, 1, 0, 0.972549, 1,
0.969183, -1.094191, 3.682227, 1, 0, 0.9647059, 1,
0.9727728, 1.212269, 0.5147133, 1, 0, 0.9607843, 1,
0.9745011, 1.751511, -0.08964297, 1, 0, 0.9529412, 1,
0.9761403, -1.294537, 1.604107, 1, 0, 0.9490196, 1,
0.9807166, -0.4150724, 2.234829, 1, 0, 0.9411765, 1,
0.983904, 1.023176, 0.3521353, 1, 0, 0.9372549, 1,
0.9854076, -0.6813527, 2.655113, 1, 0, 0.9294118, 1,
0.9854224, 0.7732425, 1.286798, 1, 0, 0.9254902, 1,
0.9975755, -0.5510872, 2.150553, 1, 0, 0.9176471, 1,
0.9977177, 0.9058768, 1.795185, 1, 0, 0.9137255, 1,
0.9992578, -0.3010829, 2.012187, 1, 0, 0.9058824, 1,
1.006701, 0.02592168, 1.519487, 1, 0, 0.9019608, 1,
1.013039, 1.194808, -0.6179658, 1, 0, 0.8941177, 1,
1.016479, -0.1006558, 1.33479, 1, 0, 0.8862745, 1,
1.016905, 1.01526, 0.4099347, 1, 0, 0.8823529, 1,
1.01702, 0.6657622, -0.7869052, 1, 0, 0.8745098, 1,
1.018532, -0.8680567, 3.297985, 1, 0, 0.8705882, 1,
1.025457, 0.1966676, -1.046704, 1, 0, 0.8627451, 1,
1.03681, 0.3169693, 1.729825, 1, 0, 0.8588235, 1,
1.036959, -1.019239, 2.968036, 1, 0, 0.8509804, 1,
1.037281, -0.3012614, 2.355923, 1, 0, 0.8470588, 1,
1.054811, -0.4933946, 2.563001, 1, 0, 0.8392157, 1,
1.05537, -0.4932264, 0.5403861, 1, 0, 0.8352941, 1,
1.063165, 1.321659, 1.710962, 1, 0, 0.827451, 1,
1.068276, -1.654788, 3.03923, 1, 0, 0.8235294, 1,
1.075722, -0.9689239, 2.998577, 1, 0, 0.8156863, 1,
1.086554, -0.5469012, 1.97258, 1, 0, 0.8117647, 1,
1.086781, -1.6606, 3.861864, 1, 0, 0.8039216, 1,
1.087374, 1.697222, 0.232212, 1, 0, 0.7960784, 1,
1.089334, 3.660381, 0.7652089, 1, 0, 0.7921569, 1,
1.093346, 0.4250168, 0.87972, 1, 0, 0.7843137, 1,
1.093516, 2.053991, 0.3634718, 1, 0, 0.7803922, 1,
1.100476, 0.6571875, -0.04003491, 1, 0, 0.772549, 1,
1.101086, 1.448164, 0.6055289, 1, 0, 0.7686275, 1,
1.101845, 0.9303022, -0.3135036, 1, 0, 0.7607843, 1,
1.120235, -0.4828051, 0.8384777, 1, 0, 0.7568628, 1,
1.138897, -0.626123, 1.089596, 1, 0, 0.7490196, 1,
1.145551, 1.954119, 0.9904369, 1, 0, 0.7450981, 1,
1.150241, -0.3171515, 2.503535, 1, 0, 0.7372549, 1,
1.150861, -0.4223789, 2.204071, 1, 0, 0.7333333, 1,
1.158445, 0.5211391, 0.09477251, 1, 0, 0.7254902, 1,
1.170331, -1.480351, 1.32684, 1, 0, 0.7215686, 1,
1.172023, -1.248373, 3.138797, 1, 0, 0.7137255, 1,
1.172466, -0.7872709, 2.30289, 1, 0, 0.7098039, 1,
1.175261, 0.4867017, 1.848116, 1, 0, 0.7019608, 1,
1.190673, 2.024014, 1.727262, 1, 0, 0.6941177, 1,
1.201512, 0.6668605, 2.732474, 1, 0, 0.6901961, 1,
1.20314, -0.3390326, 2.099954, 1, 0, 0.682353, 1,
1.213888, -1.022677, 4.156466, 1, 0, 0.6784314, 1,
1.214978, 0.1048686, 2.674598, 1, 0, 0.6705883, 1,
1.223941, 0.4259593, 1.673267, 1, 0, 0.6666667, 1,
1.227152, 0.01907634, 2.701607, 1, 0, 0.6588235, 1,
1.230564, -1.67477, 1.996086, 1, 0, 0.654902, 1,
1.231749, 0.7860948, 0.9455708, 1, 0, 0.6470588, 1,
1.232669, 0.9550803, 0.007848634, 1, 0, 0.6431373, 1,
1.239, 1.465657, 0.1653334, 1, 0, 0.6352941, 1,
1.242249, 0.02206125, -0.2108522, 1, 0, 0.6313726, 1,
1.250745, 0.1694884, 1.563172, 1, 0, 0.6235294, 1,
1.250986, 0.8554025, -0.01561591, 1, 0, 0.6196079, 1,
1.252204, -0.5699771, 1.854787, 1, 0, 0.6117647, 1,
1.253959, 2.364574, -0.3585038, 1, 0, 0.6078432, 1,
1.266045, 0.2327448, 2.97872, 1, 0, 0.6, 1,
1.269475, 2.547046, 0.6349914, 1, 0, 0.5921569, 1,
1.272707, -2.062456, 2.498752, 1, 0, 0.5882353, 1,
1.276321, 0.07695472, 3.76404, 1, 0, 0.5803922, 1,
1.279568, 0.7946905, -0.08072996, 1, 0, 0.5764706, 1,
1.284066, -1.70458, 1.928044, 1, 0, 0.5686275, 1,
1.284472, 0.3695104, 3.267826, 1, 0, 0.5647059, 1,
1.292518, 1.336077, 2.446174, 1, 0, 0.5568628, 1,
1.294107, 0.9767972, 0.9853551, 1, 0, 0.5529412, 1,
1.297229, 2.034729, 1.372569, 1, 0, 0.5450981, 1,
1.3056, 1.008437, 1.272969, 1, 0, 0.5411765, 1,
1.307765, -0.4851691, 1.679155, 1, 0, 0.5333334, 1,
1.316105, 1.032603, 0.3347372, 1, 0, 0.5294118, 1,
1.330709, -0.9849983, 0.5079788, 1, 0, 0.5215687, 1,
1.330941, 0.1934923, 3.095285, 1, 0, 0.5176471, 1,
1.333103, -0.5085082, 2.29765, 1, 0, 0.509804, 1,
1.334453, -0.1080015, 1.769161, 1, 0, 0.5058824, 1,
1.341665, -1.207589, 2.531874, 1, 0, 0.4980392, 1,
1.343064, -0.6805807, 1.710168, 1, 0, 0.4901961, 1,
1.344529, -0.2492141, 2.545794, 1, 0, 0.4862745, 1,
1.348402, -0.2970194, 2.417409, 1, 0, 0.4784314, 1,
1.361037, -1.617058, 1.822815, 1, 0, 0.4745098, 1,
1.361482, 0.7723696, 1.604076, 1, 0, 0.4666667, 1,
1.363136, 1.442696, -1.623212, 1, 0, 0.4627451, 1,
1.37023, 0.1784021, 0.643124, 1, 0, 0.454902, 1,
1.376594, 2.121466, 1.16425, 1, 0, 0.4509804, 1,
1.376632, -1.031361, 2.458919, 1, 0, 0.4431373, 1,
1.386015, 1.069628, 0.5653427, 1, 0, 0.4392157, 1,
1.396015, 0.159097, 0.8613953, 1, 0, 0.4313726, 1,
1.403713, -0.9094648, 4.199323, 1, 0, 0.427451, 1,
1.405277, 0.8265327, 0.4111734, 1, 0, 0.4196078, 1,
1.423916, -0.1911689, 3.960084, 1, 0, 0.4156863, 1,
1.426785, 0.9777371, 2.195323, 1, 0, 0.4078431, 1,
1.433009, 0.25155, -0.671937, 1, 0, 0.4039216, 1,
1.44571, -0.7500173, -0.005769585, 1, 0, 0.3960784, 1,
1.447162, -0.4902481, 0.4231943, 1, 0, 0.3882353, 1,
1.457135, -0.3653817, 2.008955, 1, 0, 0.3843137, 1,
1.462105, -0.02435779, 2.21257, 1, 0, 0.3764706, 1,
1.464847, -0.635312, 3.831441, 1, 0, 0.372549, 1,
1.46543, -0.6202591, -0.7259622, 1, 0, 0.3647059, 1,
1.47213, -0.4337141, 3.70771, 1, 0, 0.3607843, 1,
1.478615, 1.468782, -1.081176, 1, 0, 0.3529412, 1,
1.482412, 0.2876147, 2.732823, 1, 0, 0.3490196, 1,
1.49178, -1.361648, 2.15988, 1, 0, 0.3411765, 1,
1.498383, 1.269914, 2.551495, 1, 0, 0.3372549, 1,
1.503488, -0.7702981, 0.7186201, 1, 0, 0.3294118, 1,
1.505399, -0.7736079, 1.900741, 1, 0, 0.3254902, 1,
1.52579, 0.6662699, 2.198867, 1, 0, 0.3176471, 1,
1.535815, 0.3726881, 1.255223, 1, 0, 0.3137255, 1,
1.541864, -0.252107, 0.9357476, 1, 0, 0.3058824, 1,
1.543175, 0.8262904, -0.6419334, 1, 0, 0.2980392, 1,
1.549783, -0.5966321, 1.312459, 1, 0, 0.2941177, 1,
1.558388, 0.4543571, 2.062026, 1, 0, 0.2862745, 1,
1.563909, -0.7271109, 2.783066, 1, 0, 0.282353, 1,
1.575454, -1.375779, 1.050474, 1, 0, 0.2745098, 1,
1.600682, -0.0001594412, 3.261719, 1, 0, 0.2705882, 1,
1.601152, -0.6003733, 3.698025, 1, 0, 0.2627451, 1,
1.603719, 0.8321798, 1.407311, 1, 0, 0.2588235, 1,
1.608551, 0.1558281, 1.528274, 1, 0, 0.2509804, 1,
1.608693, -1.522478, 2.390555, 1, 0, 0.2470588, 1,
1.62642, -0.4825393, 1.296699, 1, 0, 0.2392157, 1,
1.640252, -1.184725, 2.99324, 1, 0, 0.2352941, 1,
1.659943, 0.898968, 0.8893135, 1, 0, 0.227451, 1,
1.660859, -0.9242764, 4.218401, 1, 0, 0.2235294, 1,
1.663222, -0.820255, 2.53324, 1, 0, 0.2156863, 1,
1.715617, -0.6146495, 4.177884, 1, 0, 0.2117647, 1,
1.717071, 1.79201, 0.2828209, 1, 0, 0.2039216, 1,
1.722809, -0.2999903, 2.027458, 1, 0, 0.1960784, 1,
1.734109, 1.776903, 0.02415545, 1, 0, 0.1921569, 1,
1.74599, -1.432593, 3.685365, 1, 0, 0.1843137, 1,
1.750541, 1.184385, 2.257138, 1, 0, 0.1803922, 1,
1.756254, -0.3116915, 1.742167, 1, 0, 0.172549, 1,
1.758868, -1.421661, 2.5298, 1, 0, 0.1686275, 1,
1.778429, -0.1152771, 2.905094, 1, 0, 0.1607843, 1,
1.798233, 1.495006, 0.2309712, 1, 0, 0.1568628, 1,
1.800285, -0.5797338, 1.274998, 1, 0, 0.1490196, 1,
1.861304, -1.663827, 1.561485, 1, 0, 0.145098, 1,
1.904221, -0.5997766, 1.272923, 1, 0, 0.1372549, 1,
1.947938, 0.5847037, 0.6950943, 1, 0, 0.1333333, 1,
1.964482, -0.3975376, 1.572562, 1, 0, 0.1254902, 1,
1.978469, -1.21757, 2.687293, 1, 0, 0.1215686, 1,
2.005383, -0.4689439, 2.064892, 1, 0, 0.1137255, 1,
2.011654, -0.02399338, 1.593207, 1, 0, 0.1098039, 1,
2.060414, -1.269261, 3.43043, 1, 0, 0.1019608, 1,
2.066787, 0.918112, 2.881259, 1, 0, 0.09411765, 1,
2.072867, 0.3518275, -0.2626483, 1, 0, 0.09019608, 1,
2.092506, -1.245441, 1.490432, 1, 0, 0.08235294, 1,
2.129764, -0.8542396, 2.860721, 1, 0, 0.07843138, 1,
2.206661, 0.2199264, 2.776376, 1, 0, 0.07058824, 1,
2.238377, -0.3724187, 1.802826, 1, 0, 0.06666667, 1,
2.328692, -1.449322, 1.511942, 1, 0, 0.05882353, 1,
2.393998, -1.001106, 3.17605, 1, 0, 0.05490196, 1,
2.396743, 0.6263959, 3.654725, 1, 0, 0.04705882, 1,
2.469312, 0.2018942, 2.294582, 1, 0, 0.04313726, 1,
2.517649, 0.1304055, 3.066035, 1, 0, 0.03529412, 1,
2.606222, -0.3577712, 2.624854, 1, 0, 0.03137255, 1,
2.747098, 0.2600622, 0.695152, 1, 0, 0.02352941, 1,
2.76889, 0.7326059, 2.033844, 1, 0, 0.01960784, 1,
2.998462, -1.162129, 1.466899, 1, 0, 0.01176471, 1,
3.485881, -0.9303908, 3.057009, 1, 0, 0.007843138, 1
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
0.0632627, -4.687356, -6.737269, 0, -0.5, 0.5, 0.5,
0.0632627, -4.687356, -6.737269, 1, -0.5, 0.5, 0.5,
0.0632627, -4.687356, -6.737269, 1, 1.5, 0.5, 0.5,
0.0632627, -4.687356, -6.737269, 0, 1.5, 0.5, 0.5
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
-4.519624, 0.09144711, -6.737269, 0, -0.5, 0.5, 0.5,
-4.519624, 0.09144711, -6.737269, 1, -0.5, 0.5, 0.5,
-4.519624, 0.09144711, -6.737269, 1, 1.5, 0.5, 0.5,
-4.519624, 0.09144711, -6.737269, 0, 1.5, 0.5, 0.5
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
-4.519624, -4.687356, 0.05085683, 0, -0.5, 0.5, 0.5,
-4.519624, -4.687356, 0.05085683, 1, -0.5, 0.5, 0.5,
-4.519624, -4.687356, 0.05085683, 1, 1.5, 0.5, 0.5,
-4.519624, -4.687356, 0.05085683, 0, 1.5, 0.5, 0.5
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
-3, -3.584555, -5.170778,
3, -3.584555, -5.170778,
-3, -3.584555, -5.170778,
-3, -3.768355, -5.43186,
-2, -3.584555, -5.170778,
-2, -3.768355, -5.43186,
-1, -3.584555, -5.170778,
-1, -3.768355, -5.43186,
0, -3.584555, -5.170778,
0, -3.768355, -5.43186,
1, -3.584555, -5.170778,
1, -3.768355, -5.43186,
2, -3.584555, -5.170778,
2, -3.768355, -5.43186,
3, -3.584555, -5.170778,
3, -3.768355, -5.43186
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
-3, -4.135955, -5.954024, 0, -0.5, 0.5, 0.5,
-3, -4.135955, -5.954024, 1, -0.5, 0.5, 0.5,
-3, -4.135955, -5.954024, 1, 1.5, 0.5, 0.5,
-3, -4.135955, -5.954024, 0, 1.5, 0.5, 0.5,
-2, -4.135955, -5.954024, 0, -0.5, 0.5, 0.5,
-2, -4.135955, -5.954024, 1, -0.5, 0.5, 0.5,
-2, -4.135955, -5.954024, 1, 1.5, 0.5, 0.5,
-2, -4.135955, -5.954024, 0, 1.5, 0.5, 0.5,
-1, -4.135955, -5.954024, 0, -0.5, 0.5, 0.5,
-1, -4.135955, -5.954024, 1, -0.5, 0.5, 0.5,
-1, -4.135955, -5.954024, 1, 1.5, 0.5, 0.5,
-1, -4.135955, -5.954024, 0, 1.5, 0.5, 0.5,
0, -4.135955, -5.954024, 0, -0.5, 0.5, 0.5,
0, -4.135955, -5.954024, 1, -0.5, 0.5, 0.5,
0, -4.135955, -5.954024, 1, 1.5, 0.5, 0.5,
0, -4.135955, -5.954024, 0, 1.5, 0.5, 0.5,
1, -4.135955, -5.954024, 0, -0.5, 0.5, 0.5,
1, -4.135955, -5.954024, 1, -0.5, 0.5, 0.5,
1, -4.135955, -5.954024, 1, 1.5, 0.5, 0.5,
1, -4.135955, -5.954024, 0, 1.5, 0.5, 0.5,
2, -4.135955, -5.954024, 0, -0.5, 0.5, 0.5,
2, -4.135955, -5.954024, 1, -0.5, 0.5, 0.5,
2, -4.135955, -5.954024, 1, 1.5, 0.5, 0.5,
2, -4.135955, -5.954024, 0, 1.5, 0.5, 0.5,
3, -4.135955, -5.954024, 0, -0.5, 0.5, 0.5,
3, -4.135955, -5.954024, 1, -0.5, 0.5, 0.5,
3, -4.135955, -5.954024, 1, 1.5, 0.5, 0.5,
3, -4.135955, -5.954024, 0, 1.5, 0.5, 0.5
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
-3.462034, -2, -5.170778,
-3.462034, 2, -5.170778,
-3.462034, -2, -5.170778,
-3.638299, -2, -5.43186,
-3.462034, 0, -5.170778,
-3.638299, 0, -5.43186,
-3.462034, 2, -5.170778,
-3.638299, 2, -5.43186
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
-3.990829, -2, -5.954024, 0, -0.5, 0.5, 0.5,
-3.990829, -2, -5.954024, 1, -0.5, 0.5, 0.5,
-3.990829, -2, -5.954024, 1, 1.5, 0.5, 0.5,
-3.990829, -2, -5.954024, 0, 1.5, 0.5, 0.5,
-3.990829, 0, -5.954024, 0, -0.5, 0.5, 0.5,
-3.990829, 0, -5.954024, 1, -0.5, 0.5, 0.5,
-3.990829, 0, -5.954024, 1, 1.5, 0.5, 0.5,
-3.990829, 0, -5.954024, 0, 1.5, 0.5, 0.5,
-3.990829, 2, -5.954024, 0, -0.5, 0.5, 0.5,
-3.990829, 2, -5.954024, 1, -0.5, 0.5, 0.5,
-3.990829, 2, -5.954024, 1, 1.5, 0.5, 0.5,
-3.990829, 2, -5.954024, 0, 1.5, 0.5, 0.5
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
-3.462034, -3.584555, -4,
-3.462034, -3.584555, 4,
-3.462034, -3.584555, -4,
-3.638299, -3.768355, -4,
-3.462034, -3.584555, -2,
-3.638299, -3.768355, -2,
-3.462034, -3.584555, 0,
-3.638299, -3.768355, 0,
-3.462034, -3.584555, 2,
-3.638299, -3.768355, 2,
-3.462034, -3.584555, 4,
-3.638299, -3.768355, 4
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
-3.990829, -4.135955, -4, 0, -0.5, 0.5, 0.5,
-3.990829, -4.135955, -4, 1, -0.5, 0.5, 0.5,
-3.990829, -4.135955, -4, 1, 1.5, 0.5, 0.5,
-3.990829, -4.135955, -4, 0, 1.5, 0.5, 0.5,
-3.990829, -4.135955, -2, 0, -0.5, 0.5, 0.5,
-3.990829, -4.135955, -2, 1, -0.5, 0.5, 0.5,
-3.990829, -4.135955, -2, 1, 1.5, 0.5, 0.5,
-3.990829, -4.135955, -2, 0, 1.5, 0.5, 0.5,
-3.990829, -4.135955, 0, 0, -0.5, 0.5, 0.5,
-3.990829, -4.135955, 0, 1, -0.5, 0.5, 0.5,
-3.990829, -4.135955, 0, 1, 1.5, 0.5, 0.5,
-3.990829, -4.135955, 0, 0, 1.5, 0.5, 0.5,
-3.990829, -4.135955, 2, 0, -0.5, 0.5, 0.5,
-3.990829, -4.135955, 2, 1, -0.5, 0.5, 0.5,
-3.990829, -4.135955, 2, 1, 1.5, 0.5, 0.5,
-3.990829, -4.135955, 2, 0, 1.5, 0.5, 0.5,
-3.990829, -4.135955, 4, 0, -0.5, 0.5, 0.5,
-3.990829, -4.135955, 4, 1, -0.5, 0.5, 0.5,
-3.990829, -4.135955, 4, 1, 1.5, 0.5, 0.5,
-3.990829, -4.135955, 4, 0, 1.5, 0.5, 0.5
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
-3.462034, -3.584555, -5.170778,
-3.462034, 3.767449, -5.170778,
-3.462034, -3.584555, 5.272492,
-3.462034, 3.767449, 5.272492,
-3.462034, -3.584555, -5.170778,
-3.462034, -3.584555, 5.272492,
-3.462034, 3.767449, -5.170778,
-3.462034, 3.767449, 5.272492,
-3.462034, -3.584555, -5.170778,
3.58856, -3.584555, -5.170778,
-3.462034, -3.584555, 5.272492,
3.58856, -3.584555, 5.272492,
-3.462034, 3.767449, -5.170778,
3.58856, 3.767449, -5.170778,
-3.462034, 3.767449, 5.272492,
3.58856, 3.767449, 5.272492,
3.58856, -3.584555, -5.170778,
3.58856, 3.767449, -5.170778,
3.58856, -3.584555, 5.272492,
3.58856, 3.767449, 5.272492,
3.58856, -3.584555, -5.170778,
3.58856, -3.584555, 5.272492,
3.58856, 3.767449, -5.170778,
3.58856, 3.767449, 5.272492
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
var radius = 7.789984;
var distance = 34.65852;
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
mvMatrix.translate( -0.0632627, -0.09144711, -0.05085683 );
mvMatrix.scale( 1.194606, 1.145631, 0.8065177 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.65852);
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
D-alanine_methyl_est<-read.table("D-alanine_methyl_est.xyz", skip=1)
```

```
## Error in read.table("D-alanine_methyl_est.xyz", skip = 1): duplicate 'row.names' are not allowed
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
-3.359356, 2.146174, -0.01068208, 0, 0, 1, 1, 1,
-2.945999, 0.1821569, -0.9353321, 1, 0, 0, 1, 1,
-2.711257, -1.292895, -2.001983, 1, 0, 0, 1, 1,
-2.70049, -0.0810376, 0.2559353, 1, 0, 0, 1, 1,
-2.66708, 0.4148721, -0.5417917, 1, 0, 0, 1, 1,
-2.657655, 1.300623, -3.058315, 1, 0, 0, 1, 1,
-2.604875, -2.260589, -1.467011, 0, 0, 0, 1, 1,
-2.551851, 0.2275861, -1.483027, 0, 0, 0, 1, 1,
-2.442345, 1.988186, -1.047583, 0, 0, 0, 1, 1,
-2.294956, -0.6842227, -0.5743479, 0, 0, 0, 1, 1,
-2.287135, -0.8280587, -3.637205, 0, 0, 0, 1, 1,
-2.27969, -0.2282958, 0.1613073, 0, 0, 0, 1, 1,
-2.274421, 0.05881384, -3.156088, 0, 0, 0, 1, 1,
-2.205774, 0.3222338, -1.878651, 1, 1, 1, 1, 1,
-2.145504, -2.294542, -2.211952, 1, 1, 1, 1, 1,
-2.137824, -1.03132, -1.096186, 1, 1, 1, 1, 1,
-2.133225, -0.2382781, -1.677152, 1, 1, 1, 1, 1,
-2.098363, 0.6830709, -1.358342, 1, 1, 1, 1, 1,
-2.073552, 0.3510014, -1.626918, 1, 1, 1, 1, 1,
-2.066408, -1.059772, -1.461899, 1, 1, 1, 1, 1,
-2.024362, -0.1563737, -2.258079, 1, 1, 1, 1, 1,
-2.011416, 0.4570907, -1.766273, 1, 1, 1, 1, 1,
-2.003578, -0.4497428, 0.5035205, 1, 1, 1, 1, 1,
-1.99942, 1.57225, -1.393443, 1, 1, 1, 1, 1,
-1.981809, 1.099616, -1.117044, 1, 1, 1, 1, 1,
-1.973602, -0.4213078, -1.961269, 1, 1, 1, 1, 1,
-1.945244, 1.954156, -1.350393, 1, 1, 1, 1, 1,
-1.944886, 0.441681, -2.373304, 1, 1, 1, 1, 1,
-1.90754, 1.724684, -0.2775936, 0, 0, 1, 1, 1,
-1.900345, -3.477487, -3.466069, 1, 0, 0, 1, 1,
-1.84559, 0.6982206, -3.138035, 1, 0, 0, 1, 1,
-1.833554, 0.3979706, -1.127238, 1, 0, 0, 1, 1,
-1.78612, -1.395909, -2.910678, 1, 0, 0, 1, 1,
-1.757452, -0.9779691, -2.965792, 1, 0, 0, 1, 1,
-1.74516, -0.2949219, -1.373799, 0, 0, 0, 1, 1,
-1.74268, 0.4062548, -1.362382, 0, 0, 0, 1, 1,
-1.737198, 0.08757651, -0.7949906, 0, 0, 0, 1, 1,
-1.72994, -0.6659468, -1.235128, 0, 0, 0, 1, 1,
-1.729783, 0.8576452, -1.862083, 0, 0, 0, 1, 1,
-1.686285, 0.4085003, -2.935335, 0, 0, 0, 1, 1,
-1.676537, -0.3987528, -0.5453231, 0, 0, 0, 1, 1,
-1.668274, 0.7735571, 0.0880813, 1, 1, 1, 1, 1,
-1.665874, -0.6002789, -2.329948, 1, 1, 1, 1, 1,
-1.659588, 0.03345228, -1.182242, 1, 1, 1, 1, 1,
-1.654948, -0.5178944, -1.569898, 1, 1, 1, 1, 1,
-1.640338, -0.2381989, -1.963985, 1, 1, 1, 1, 1,
-1.638327, 0.6296735, -1.903188, 1, 1, 1, 1, 1,
-1.636233, -1.440967, -0.0840043, 1, 1, 1, 1, 1,
-1.617587, -0.9905106, -2.221723, 1, 1, 1, 1, 1,
-1.605223, 0.3044589, -1.154792, 1, 1, 1, 1, 1,
-1.582656, -0.5657893, -2.112602, 1, 1, 1, 1, 1,
-1.580389, 0.4138333, -2.545485, 1, 1, 1, 1, 1,
-1.579059, -0.7346877, -1.050625, 1, 1, 1, 1, 1,
-1.561458, 1.198167, -1.763186, 1, 1, 1, 1, 1,
-1.542442, 0.3733694, -1.781502, 1, 1, 1, 1, 1,
-1.52409, 0.02579888, -2.032509, 1, 1, 1, 1, 1,
-1.514407, -0.5462539, -2.144196, 0, 0, 1, 1, 1,
-1.511001, -0.7233024, -1.107833, 1, 0, 0, 1, 1,
-1.509761, -1.456121, -3.144329, 1, 0, 0, 1, 1,
-1.490138, -0.8135773, -2.763492, 1, 0, 0, 1, 1,
-1.480405, -0.003437911, -1.534644, 1, 0, 0, 1, 1,
-1.471599, 1.057261, -0.1595413, 1, 0, 0, 1, 1,
-1.462324, 0.2216813, -1.245819, 0, 0, 0, 1, 1,
-1.445231, -1.014493, -2.431761, 0, 0, 0, 1, 1,
-1.438352, 0.4805913, -2.007812, 0, 0, 0, 1, 1,
-1.407766, 0.2312312, -1.199668, 0, 0, 0, 1, 1,
-1.406288, 0.2842959, -1.480804, 0, 0, 0, 1, 1,
-1.40619, -1.673133, -3.966711, 0, 0, 0, 1, 1,
-1.404645, 0.5135041, -1.13318, 0, 0, 0, 1, 1,
-1.401579, 0.8927655, -1.015785, 1, 1, 1, 1, 1,
-1.400436, -0.4661452, 0.9352722, 1, 1, 1, 1, 1,
-1.382915, -1.685007, -2.577663, 1, 1, 1, 1, 1,
-1.38092, -0.9909914, -3.830642, 1, 1, 1, 1, 1,
-1.380811, 0.7452345, -2.97793, 1, 1, 1, 1, 1,
-1.379934, 0.9561033, -0.4548247, 1, 1, 1, 1, 1,
-1.36653, 0.2184009, -1.539527, 1, 1, 1, 1, 1,
-1.3558, -1.763101, -2.544172, 1, 1, 1, 1, 1,
-1.353559, -0.302766, -1.332096, 1, 1, 1, 1, 1,
-1.349878, 0.08305195, -0.227002, 1, 1, 1, 1, 1,
-1.341616, -0.9306003, -3.559948, 1, 1, 1, 1, 1,
-1.332172, -1.568266, -2.719067, 1, 1, 1, 1, 1,
-1.327874, -0.4342904, -1.544687, 1, 1, 1, 1, 1,
-1.319423, 0.5551893, -1.657299, 1, 1, 1, 1, 1,
-1.312584, -1.423628, -3.174511, 1, 1, 1, 1, 1,
-1.311004, 2.187261, -0.8206644, 0, 0, 1, 1, 1,
-1.307319, -0.8481963, -0.2524835, 1, 0, 0, 1, 1,
-1.300497, -0.6254418, -1.333304, 1, 0, 0, 1, 1,
-1.29723, -0.3711671, 0.1272373, 1, 0, 0, 1, 1,
-1.290845, 0.1776643, -0.6880633, 1, 0, 0, 1, 1,
-1.282234, -1.03889, -2.084195, 1, 0, 0, 1, 1,
-1.279212, 0.8144546, -1.620905, 0, 0, 0, 1, 1,
-1.271758, -1.111474, -2.634185, 0, 0, 0, 1, 1,
-1.269888, 0.1748989, -1.584278, 0, 0, 0, 1, 1,
-1.265353, 0.009296931, -1.099938, 0, 0, 0, 1, 1,
-1.262538, -0.615545, -2.633369, 0, 0, 0, 1, 1,
-1.259919, 0.8859857, -1.935477, 0, 0, 0, 1, 1,
-1.243924, 0.2814727, -2.896037, 0, 0, 0, 1, 1,
-1.226023, 1.213375, 0.3965156, 1, 1, 1, 1, 1,
-1.220703, -0.8679479, -2.021709, 1, 1, 1, 1, 1,
-1.214985, -0.1033386, -2.434564, 1, 1, 1, 1, 1,
-1.214651, 0.2997427, -1.862134, 1, 1, 1, 1, 1,
-1.208887, 1.940606, -0.8486609, 1, 1, 1, 1, 1,
-1.208411, 2.121522, 1.519621, 1, 1, 1, 1, 1,
-1.197388, -0.1300957, -1.115001, 1, 1, 1, 1, 1,
-1.193861, -0.4770432, -2.664095, 1, 1, 1, 1, 1,
-1.187069, 0.9808405, -1.291043, 1, 1, 1, 1, 1,
-1.185084, -1.853272, -2.679529, 1, 1, 1, 1, 1,
-1.181893, -0.5874009, -1.671007, 1, 1, 1, 1, 1,
-1.181885, 0.2652639, -1.193455, 1, 1, 1, 1, 1,
-1.173241, 1.856336, 0.4132726, 1, 1, 1, 1, 1,
-1.168284, 0.3516665, -0.2537047, 1, 1, 1, 1, 1,
-1.168089, -0.8013633, -0.8661929, 1, 1, 1, 1, 1,
-1.154792, -0.4702232, -3.749249, 0, 0, 1, 1, 1,
-1.152793, 2.075916, -1.628078, 1, 0, 0, 1, 1,
-1.144109, 0.4653055, -0.5752755, 1, 0, 0, 1, 1,
-1.141667, -1.337511, 0.2083395, 1, 0, 0, 1, 1,
-1.13273, 0.9068174, -2.33958, 1, 0, 0, 1, 1,
-1.132093, 2.265507, -0.8034317, 1, 0, 0, 1, 1,
-1.124091, 1.621922, -1.49037, 0, 0, 0, 1, 1,
-1.121191, 0.4847809, -1.571646, 0, 0, 0, 1, 1,
-1.111232, -0.2429585, 0.26567, 0, 0, 0, 1, 1,
-1.11078, 0.1284838, -1.527775, 0, 0, 0, 1, 1,
-1.109714, 0.4024493, -1.613435, 0, 0, 0, 1, 1,
-1.09365, -1.893428, -3.698619, 0, 0, 0, 1, 1,
-1.090929, 1.340796, -0.394633, 0, 0, 0, 1, 1,
-1.087153, 0.4637663, 0.3697445, 1, 1, 1, 1, 1,
-1.08426, 0.3590327, -0.3492998, 1, 1, 1, 1, 1,
-1.078204, 1.057679, -0.7033339, 1, 1, 1, 1, 1,
-1.071225, 0.3961507, -1.637143, 1, 1, 1, 1, 1,
-1.060458, 1.116457, -0.9787527, 1, 1, 1, 1, 1,
-1.060125, 0.2437865, -1.837256, 1, 1, 1, 1, 1,
-1.057172, 0.3716332, -1.449935, 1, 1, 1, 1, 1,
-1.042113, 0.4111232, -1.323925, 1, 1, 1, 1, 1,
-1.040204, 1.134017, -1.019016, 1, 1, 1, 1, 1,
-1.039791, -1.058379, -2.586443, 1, 1, 1, 1, 1,
-1.037383, 0.004821607, -0.6182364, 1, 1, 1, 1, 1,
-1.035746, -0.4153264, -1.043431, 1, 1, 1, 1, 1,
-1.033146, 1.504943, 0.9686668, 1, 1, 1, 1, 1,
-1.031064, 0.8061055, -0.4961282, 1, 1, 1, 1, 1,
-1.03073, 0.2373974, -2.096245, 1, 1, 1, 1, 1,
-1.029534, 0.9350489, -0.7481853, 0, 0, 1, 1, 1,
-1.028382, -0.2287265, -0.8128408, 1, 0, 0, 1, 1,
-1.015989, 2.103836, -1.880691, 1, 0, 0, 1, 1,
-1.011677, 1.012887, -0.6743001, 1, 0, 0, 1, 1,
-1.010399, 0.5459252, -0.53219, 1, 0, 0, 1, 1,
-1.006182, -1.216229, -3.366845, 1, 0, 0, 1, 1,
-1.004822, -0.04170366, -1.958161, 0, 0, 0, 1, 1,
-1.004672, 1.398488, -0.6381769, 0, 0, 0, 1, 1,
-1.003246, 1.485559, 0.5885925, 0, 0, 0, 1, 1,
-0.9973668, -0.289214, -2.253778, 0, 0, 0, 1, 1,
-0.9967726, -1.900852, -3.863187, 0, 0, 0, 1, 1,
-0.9916014, 1.761828, -0.04080568, 0, 0, 0, 1, 1,
-0.9839369, -0.2207657, -2.981377, 0, 0, 0, 1, 1,
-0.9835429, 0.3330153, 0.5111246, 1, 1, 1, 1, 1,
-0.9833298, 1.568419, 1.355118, 1, 1, 1, 1, 1,
-0.982268, -0.8223609, 1.139111, 1, 1, 1, 1, 1,
-0.9649734, -0.4633559, -1.670029, 1, 1, 1, 1, 1,
-0.9563255, -0.1827242, -1.539378, 1, 1, 1, 1, 1,
-0.9546838, -0.7904263, -1.207587, 1, 1, 1, 1, 1,
-0.9423255, 0.7396997, -2.098279, 1, 1, 1, 1, 1,
-0.9415222, 0.5493955, -2.706963, 1, 1, 1, 1, 1,
-0.9408973, -0.7984407, -4.402438, 1, 1, 1, 1, 1,
-0.9353156, -1.128121, -3.174987, 1, 1, 1, 1, 1,
-0.9347649, 0.5315859, -0.9978538, 1, 1, 1, 1, 1,
-0.9300604, 1.008924, -0.4140258, 1, 1, 1, 1, 1,
-0.9277141, -1.656313, -2.636938, 1, 1, 1, 1, 1,
-0.9221616, 0.3800469, -2.372829, 1, 1, 1, 1, 1,
-0.9194833, 0.005665954, -0.08225412, 1, 1, 1, 1, 1,
-0.9181932, 1.898264, 0.5313308, 0, 0, 1, 1, 1,
-0.9146388, -0.7312501, -3.846234, 1, 0, 0, 1, 1,
-0.9048361, 0.5603669, -0.232447, 1, 0, 0, 1, 1,
-0.8934519, -1.01396, -1.723774, 1, 0, 0, 1, 1,
-0.8827904, -0.04116578, -0.2921787, 1, 0, 0, 1, 1,
-0.8780614, -1.176419, -3.280806, 1, 0, 0, 1, 1,
-0.8770537, 0.1732797, -1.187584, 0, 0, 0, 1, 1,
-0.8707367, 0.04700808, -1.015999, 0, 0, 0, 1, 1,
-0.8697417, 0.3654426, -0.05960093, 0, 0, 0, 1, 1,
-0.867058, -1.036651, -2.573109, 0, 0, 0, 1, 1,
-0.8581446, 0.3197501, -4.087343, 0, 0, 0, 1, 1,
-0.8499836, 0.156965, -1.432376, 0, 0, 0, 1, 1,
-0.8432792, -1.106875, -2.132197, 0, 0, 0, 1, 1,
-0.8426864, -0.3754918, -2.054884, 1, 1, 1, 1, 1,
-0.8412063, -0.8188393, -0.6456512, 1, 1, 1, 1, 1,
-0.8373722, 0.423003, -0.8811334, 1, 1, 1, 1, 1,
-0.833259, -0.03163874, -0.9457304, 1, 1, 1, 1, 1,
-0.8290779, -0.6771656, -2.102481, 1, 1, 1, 1, 1,
-0.8269545, -0.02543894, -2.65781, 1, 1, 1, 1, 1,
-0.8244032, -1.305612, -2.383533, 1, 1, 1, 1, 1,
-0.8181401, -0.8959116, -0.03786635, 1, 1, 1, 1, 1,
-0.8177571, 0.4394734, -1.305295, 1, 1, 1, 1, 1,
-0.8092793, -0.3965626, -2.033937, 1, 1, 1, 1, 1,
-0.8062885, -0.3865424, -1.501848, 1, 1, 1, 1, 1,
-0.8043348, -0.534196, -1.232736, 1, 1, 1, 1, 1,
-0.8041871, -0.4170825, -0.349189, 1, 1, 1, 1, 1,
-0.803611, 0.8822742, -0.6256765, 1, 1, 1, 1, 1,
-0.8033593, 0.3186652, 0.375806, 1, 1, 1, 1, 1,
-0.8032425, 0.4380237, -0.4543591, 0, 0, 1, 1, 1,
-0.8003437, 0.2251312, -0.02351921, 1, 0, 0, 1, 1,
-0.7991398, -1.485299, 0.4273078, 1, 0, 0, 1, 1,
-0.7985278, 0.4273286, -0.0458654, 1, 0, 0, 1, 1,
-0.7949588, 0.711419, -0.1482604, 1, 0, 0, 1, 1,
-0.7801613, -1.451963, -0.4302501, 1, 0, 0, 1, 1,
-0.7778881, -0.6648523, -2.342597, 0, 0, 0, 1, 1,
-0.7774954, 0.9248984, -2.679492, 0, 0, 0, 1, 1,
-0.7739607, 0.6631185, -0.9792732, 0, 0, 0, 1, 1,
-0.7714034, -1.595285, -2.037231, 0, 0, 0, 1, 1,
-0.7680385, 0.5340966, -1.439118, 0, 0, 0, 1, 1,
-0.7649404, 0.6815327, 0.7343698, 0, 0, 0, 1, 1,
-0.7644978, -1.396898, -2.705804, 0, 0, 0, 1, 1,
-0.7618703, -1.327991, -2.710732, 1, 1, 1, 1, 1,
-0.7513023, 0.9603182, -1.166197, 1, 1, 1, 1, 1,
-0.7502123, -0.5123917, -1.650292, 1, 1, 1, 1, 1,
-0.7475297, 6.415202e-05, -2.148521, 1, 1, 1, 1, 1,
-0.7469, 0.500515, 0.4502768, 1, 1, 1, 1, 1,
-0.7467954, -0.09158405, -3.404608, 1, 1, 1, 1, 1,
-0.7453632, -0.1110856, -2.556194, 1, 1, 1, 1, 1,
-0.7381722, 1.906125, -1.783004, 1, 1, 1, 1, 1,
-0.7360989, 0.498799, 0.9205574, 1, 1, 1, 1, 1,
-0.7347001, 0.04011366, -0.9053623, 1, 1, 1, 1, 1,
-0.733874, -0.5896375, -2.652952, 1, 1, 1, 1, 1,
-0.7320175, 0.1781587, -4.393015, 1, 1, 1, 1, 1,
-0.7315704, 1.650308, 0.7394693, 1, 1, 1, 1, 1,
-0.7304152, 2.229595, 2.406733, 1, 1, 1, 1, 1,
-0.7279146, 1.158587, 1.184987, 1, 1, 1, 1, 1,
-0.7262326, -0.04613789, -1.700471, 0, 0, 1, 1, 1,
-0.7255543, -1.268987, -2.921248, 1, 0, 0, 1, 1,
-0.7247958, -0.291194, -2.572903, 1, 0, 0, 1, 1,
-0.7243029, -0.1982816, -2.250372, 1, 0, 0, 1, 1,
-0.7207539, -0.3870445, -3.487187, 1, 0, 0, 1, 1,
-0.7182313, 0.06265087, -1.769806, 1, 0, 0, 1, 1,
-0.717877, 0.3235849, 0.3446501, 0, 0, 0, 1, 1,
-0.716866, -1.055167, -1.181679, 0, 0, 0, 1, 1,
-0.7162685, 0.6710365, -3.027362, 0, 0, 0, 1, 1,
-0.7149368, 1.821177, -2.115774, 0, 0, 0, 1, 1,
-0.7120066, 1.601203, 1.272278, 0, 0, 0, 1, 1,
-0.7062203, -1.19619, -1.914963, 0, 0, 0, 1, 1,
-0.6985391, 0.3221268, -1.468525, 0, 0, 0, 1, 1,
-0.6972641, -1.261874, -2.706893, 1, 1, 1, 1, 1,
-0.6952393, 0.3637272, -0.5557416, 1, 1, 1, 1, 1,
-0.6921021, -0.180603, -2.058494, 1, 1, 1, 1, 1,
-0.6913249, -0.917708, -3.231242, 1, 1, 1, 1, 1,
-0.6879627, 0.5785852, -0.8300817, 1, 1, 1, 1, 1,
-0.6813091, -0.2777498, -1.816891, 1, 1, 1, 1, 1,
-0.6766775, -1.221499, -1.682215, 1, 1, 1, 1, 1,
-0.6731861, -0.6266941, -2.773649, 1, 1, 1, 1, 1,
-0.668918, 2.651176, 1.269117, 1, 1, 1, 1, 1,
-0.6657888, -0.1792208, -0.4244909, 1, 1, 1, 1, 1,
-0.6616067, 0.207229, -1.995531, 1, 1, 1, 1, 1,
-0.6606233, -1.471152, -1.530667, 1, 1, 1, 1, 1,
-0.6542563, 1.936383, -1.77616, 1, 1, 1, 1, 1,
-0.6542401, -1.445147, -2.358648, 1, 1, 1, 1, 1,
-0.6516299, -0.6766695, -3.532909, 1, 1, 1, 1, 1,
-0.6496176, -2.38261, -3.572117, 0, 0, 1, 1, 1,
-0.6442649, 0.6571819, -1.019783, 1, 0, 0, 1, 1,
-0.6326099, 1.323506, -3.318727, 1, 0, 0, 1, 1,
-0.6321766, -0.5905482, -1.145289, 1, 0, 0, 1, 1,
-0.6317943, -0.8351225, -3.882539, 1, 0, 0, 1, 1,
-0.6307455, 0.0338245, -2.140974, 1, 0, 0, 1, 1,
-0.6304068, -0.2142003, -2.063655, 0, 0, 0, 1, 1,
-0.6248775, 1.208435, 0.2867334, 0, 0, 0, 1, 1,
-0.6156875, -2.179869, -2.962507, 0, 0, 0, 1, 1,
-0.6153889, 1.511293, -1.571915, 0, 0, 0, 1, 1,
-0.6140648, -1.843893, -3.505861, 0, 0, 0, 1, 1,
-0.6128238, -0.3303564, -2.184065, 0, 0, 0, 1, 1,
-0.606577, 2.232534, 0.4811209, 0, 0, 0, 1, 1,
-0.6056684, 0.7030193, -1.918914, 1, 1, 1, 1, 1,
-0.5960399, 1.010994, -0.5362906, 1, 1, 1, 1, 1,
-0.5944431, -0.215211, -1.176006, 1, 1, 1, 1, 1,
-0.590551, -1.344608, -1.860039, 1, 1, 1, 1, 1,
-0.5864871, -1.35392, -2.400547, 1, 1, 1, 1, 1,
-0.5838265, -0.05634693, -2.332097, 1, 1, 1, 1, 1,
-0.5809873, -0.5088298, -1.19742, 1, 1, 1, 1, 1,
-0.5760948, -0.2795808, -0.9914128, 1, 1, 1, 1, 1,
-0.5724373, -0.06369874, 0.2267373, 1, 1, 1, 1, 1,
-0.5642237, 1.799983, -3.010655, 1, 1, 1, 1, 1,
-0.5632386, 0.830007, -1.861196, 1, 1, 1, 1, 1,
-0.5601131, 1.695742, -1.050319, 1, 1, 1, 1, 1,
-0.5580979, 0.4188022, 0.002116528, 1, 1, 1, 1, 1,
-0.5536705, 1.322637, -1.243151, 1, 1, 1, 1, 1,
-0.5530353, 0.4350258, -1.150366, 1, 1, 1, 1, 1,
-0.5486704, 1.285574, 0.1524412, 0, 0, 1, 1, 1,
-0.5456984, -0.2180028, -2.290996, 1, 0, 0, 1, 1,
-0.5451021, 0.9515886, -0.03212424, 1, 0, 0, 1, 1,
-0.5406157, 0.6676553, -0.493046, 1, 0, 0, 1, 1,
-0.5386354, -0.1042381, -0.08837759, 1, 0, 0, 1, 1,
-0.5356643, 0.5071289, -0.8137079, 1, 0, 0, 1, 1,
-0.5344009, 0.7580774, -0.4054446, 0, 0, 0, 1, 1,
-0.5313426, -0.4142713, -2.233413, 0, 0, 0, 1, 1,
-0.5293928, 0.1004896, -1.539658, 0, 0, 0, 1, 1,
-0.5234466, 1.797835, -0.1065104, 0, 0, 0, 1, 1,
-0.5225686, -1.399584, -3.069724, 0, 0, 0, 1, 1,
-0.5223004, 0.04041169, -0.4241253, 0, 0, 0, 1, 1,
-0.518888, -2.307682, -2.727789, 0, 0, 0, 1, 1,
-0.5180168, -0.02886118, -2.061227, 1, 1, 1, 1, 1,
-0.5101449, 0.2943107, -1.327559, 1, 1, 1, 1, 1,
-0.5056919, -0.9137161, -1.957971, 1, 1, 1, 1, 1,
-0.5024547, 1.112941, -1.291935, 1, 1, 1, 1, 1,
-0.502421, 0.04880367, -2.833529, 1, 1, 1, 1, 1,
-0.4971133, -2.59485, -1.745345, 1, 1, 1, 1, 1,
-0.4862666, -1.734745, -3.241303, 1, 1, 1, 1, 1,
-0.4837433, 0.2423994, -1.398237, 1, 1, 1, 1, 1,
-0.4734108, -0.7057248, -3.016306, 1, 1, 1, 1, 1,
-0.4701264, -2.448702, -1.365144, 1, 1, 1, 1, 1,
-0.4667256, -0.2093647, -1.076172, 1, 1, 1, 1, 1,
-0.4638979, -1.631751, -1.342237, 1, 1, 1, 1, 1,
-0.4621792, -1.12708, -4.008405, 1, 1, 1, 1, 1,
-0.4596294, -0.5595945, -1.958052, 1, 1, 1, 1, 1,
-0.4594912, 0.6756902, 0.1730592, 1, 1, 1, 1, 1,
-0.4583805, 1.186666, 0.1743262, 0, 0, 1, 1, 1,
-0.457301, 2.042971, 0.3522757, 1, 0, 0, 1, 1,
-0.4555634, 0.689447, 0.7414544, 1, 0, 0, 1, 1,
-0.4543047, 0.4110529, -1.347969, 1, 0, 0, 1, 1,
-0.4539183, -1.536067, -2.297389, 1, 0, 0, 1, 1,
-0.4533708, -0.5581504, -2.478, 1, 0, 0, 1, 1,
-0.4501333, 0.1296028, 0.3183877, 0, 0, 0, 1, 1,
-0.4492813, -0.7686453, -2.745091, 0, 0, 0, 1, 1,
-0.4459675, -1.005294, -2.100566, 0, 0, 0, 1, 1,
-0.4450827, -0.5428815, -3.118982, 0, 0, 0, 1, 1,
-0.444091, -0.0357533, -1.685943, 0, 0, 0, 1, 1,
-0.4389986, 0.4130756, -1.061197, 0, 0, 0, 1, 1,
-0.4375887, -0.5689214, -2.158775, 0, 0, 0, 1, 1,
-0.4370624, -1.331569, -3.23249, 1, 1, 1, 1, 1,
-0.4356243, -0.7827371, -2.737775, 1, 1, 1, 1, 1,
-0.4355973, -0.1242231, -0.4303832, 1, 1, 1, 1, 1,
-0.4312656, -0.01708851, -0.5913054, 1, 1, 1, 1, 1,
-0.4246298, 0.4939391, -0.8376283, 1, 1, 1, 1, 1,
-0.4243515, -0.2056204, -1.772189, 1, 1, 1, 1, 1,
-0.4223861, -1.454875, -2.782421, 1, 1, 1, 1, 1,
-0.4186088, -0.05340479, -0.4514196, 1, 1, 1, 1, 1,
-0.4175814, -0.2574938, -3.133627, 1, 1, 1, 1, 1,
-0.4138834, 0.5287548, 0.173, 1, 1, 1, 1, 1,
-0.4093303, -0.1681519, -2.108567, 1, 1, 1, 1, 1,
-0.4046118, 1.875102, 0.02426587, 1, 1, 1, 1, 1,
-0.4040248, -1.719476, -2.051005, 1, 1, 1, 1, 1,
-0.4016858, -1.179023, -1.973887, 1, 1, 1, 1, 1,
-0.3879475, 0.01750342, -2.347807, 1, 1, 1, 1, 1,
-0.3806194, -1.825347, -3.008455, 0, 0, 1, 1, 1,
-0.3789742, 0.2562862, -0.2793482, 1, 0, 0, 1, 1,
-0.3773369, 0.057523, -1.223842, 1, 0, 0, 1, 1,
-0.3771072, -1.448248, -2.604786, 1, 0, 0, 1, 1,
-0.3666038, -0.2884081, -2.911769, 1, 0, 0, 1, 1,
-0.365884, 2.416997, -0.08357308, 1, 0, 0, 1, 1,
-0.3633296, -1.559145, -2.207433, 0, 0, 0, 1, 1,
-0.3630441, 1.346988, 0.7022855, 0, 0, 0, 1, 1,
-0.3629674, 1.099927, -0.468164, 0, 0, 0, 1, 1,
-0.3611454, -0.110017, -1.354465, 0, 0, 0, 1, 1,
-0.3566552, 0.724053, -0.6005648, 0, 0, 0, 1, 1,
-0.3447356, -0.9183179, -2.674228, 0, 0, 0, 1, 1,
-0.344301, 0.4855376, -0.1611139, 0, 0, 0, 1, 1,
-0.343978, -0.1455977, -4.266226, 1, 1, 1, 1, 1,
-0.3421959, -0.7098894, -2.435906, 1, 1, 1, 1, 1,
-0.3420309, 1.252467, -0.0626896, 1, 1, 1, 1, 1,
-0.3363209, 1.035519, -0.9378477, 1, 1, 1, 1, 1,
-0.3326539, -1.002154, -1.946296, 1, 1, 1, 1, 1,
-0.3325307, -0.499702, -4.228825, 1, 1, 1, 1, 1,
-0.3298157, -0.794048, -1.669182, 1, 1, 1, 1, 1,
-0.3197166, 0.07060047, -1.997741, 1, 1, 1, 1, 1,
-0.3177126, 0.4036842, 1.397298, 1, 1, 1, 1, 1,
-0.3154367, 0.4947802, 0.4653465, 1, 1, 1, 1, 1,
-0.3153274, -0.4035851, -1.096642, 1, 1, 1, 1, 1,
-0.3137647, 0.4881534, -0.03939116, 1, 1, 1, 1, 1,
-0.3118359, -0.6336897, -0.9027638, 1, 1, 1, 1, 1,
-0.3082721, -0.5671263, -2.454795, 1, 1, 1, 1, 1,
-0.3072331, -0.9096057, -2.146708, 1, 1, 1, 1, 1,
-0.3066587, 0.606912, 0.3318677, 0, 0, 1, 1, 1,
-0.3060548, 0.9797912, -1.193002, 1, 0, 0, 1, 1,
-0.3060392, -0.04579026, -0.4832247, 1, 0, 0, 1, 1,
-0.3058857, -0.9857796, -3.603466, 1, 0, 0, 1, 1,
-0.3047982, 0.4787901, -0.8597512, 1, 0, 0, 1, 1,
-0.3023234, -1.268658, -3.903328, 1, 0, 0, 1, 1,
-0.2964043, -0.4207533, -1.88958, 0, 0, 0, 1, 1,
-0.2959041, -0.4965905, 0.08208195, 0, 0, 0, 1, 1,
-0.2919713, -0.7128057, -1.829479, 0, 0, 0, 1, 1,
-0.2907459, 2.167322, 0.4635832, 0, 0, 0, 1, 1,
-0.2879224, 0.8980302, -1.350719, 0, 0, 0, 1, 1,
-0.2823375, -0.6223761, -3.348423, 0, 0, 0, 1, 1,
-0.2780244, 1.201614, -3.414863, 0, 0, 0, 1, 1,
-0.2773264, 0.2646428, -1.316152, 1, 1, 1, 1, 1,
-0.2755966, 0.110881, -0.2966384, 1, 1, 1, 1, 1,
-0.2711979, -0.08044894, -1.667695, 1, 1, 1, 1, 1,
-0.2711042, -1.45041, -2.708689, 1, 1, 1, 1, 1,
-0.2708209, 0.8886789, -0.9299248, 1, 1, 1, 1, 1,
-0.2696786, 1.089325, 0.624247, 1, 1, 1, 1, 1,
-0.252448, -2.276545, -1.185012, 1, 1, 1, 1, 1,
-0.2455566, -0.7174824, -2.35278, 1, 1, 1, 1, 1,
-0.2414763, 0.7668176, 0.2313151, 1, 1, 1, 1, 1,
-0.2399547, 0.2362743, -0.9163765, 1, 1, 1, 1, 1,
-0.2378751, -0.1750382, -2.210376, 1, 1, 1, 1, 1,
-0.2378417, 0.8179354, 1.664675, 1, 1, 1, 1, 1,
-0.236148, 1.4671, -0.7527595, 1, 1, 1, 1, 1,
-0.2360521, 0.1962027, 0.4983929, 1, 1, 1, 1, 1,
-0.2355781, 1.65691, 0.6026639, 1, 1, 1, 1, 1,
-0.2353212, -1.123829, -4.226906, 0, 0, 1, 1, 1,
-0.2341022, 0.3486134, -1.243214, 1, 0, 0, 1, 1,
-0.2322989, -0.05978278, -2.573427, 1, 0, 0, 1, 1,
-0.2297597, 1.343094, -0.754017, 1, 0, 0, 1, 1,
-0.22581, 0.7973778, 1.26877, 1, 0, 0, 1, 1,
-0.2174475, -2.264606, -2.677829, 1, 0, 0, 1, 1,
-0.2173439, -0.9538276, -1.89713, 0, 0, 0, 1, 1,
-0.2143029, 0.5083963, -0.9512252, 0, 0, 0, 1, 1,
-0.2106078, 1.12298, -1.288857, 0, 0, 0, 1, 1,
-0.2061507, -0.8226717, -3.236904, 0, 0, 0, 1, 1,
-0.2047149, -0.3615503, -3.257285, 0, 0, 0, 1, 1,
-0.1980423, -1.127466, -2.043441, 0, 0, 0, 1, 1,
-0.1944339, 0.5206455, -0.8431041, 0, 0, 0, 1, 1,
-0.1917559, -0.2216389, -0.6426449, 1, 1, 1, 1, 1,
-0.1909112, -0.9641036, -4.866117, 1, 1, 1, 1, 1,
-0.1867191, -0.4623312, -3.190931, 1, 1, 1, 1, 1,
-0.176953, 0.06256233, -1.293457, 1, 1, 1, 1, 1,
-0.1759975, -1.660044, -5.018692, 1, 1, 1, 1, 1,
-0.1738367, -1.591882, -3.096392, 1, 1, 1, 1, 1,
-0.1688137, 0.2207053, -0.9996064, 1, 1, 1, 1, 1,
-0.1648592, 1.040573, 0.2407284, 1, 1, 1, 1, 1,
-0.1615283, -0.02350562, -2.016736, 1, 1, 1, 1, 1,
-0.1595362, -0.8546938, -0.9814101, 1, 1, 1, 1, 1,
-0.1581906, -0.3651309, -3.856471, 1, 1, 1, 1, 1,
-0.1569869, -0.1298569, -1.483817, 1, 1, 1, 1, 1,
-0.1563426, -1.909692, -3.836996, 1, 1, 1, 1, 1,
-0.1563366, -1.395569, -2.481634, 1, 1, 1, 1, 1,
-0.1555298, 1.009922, 0.1933587, 1, 1, 1, 1, 1,
-0.1554763, 2.256873, -0.2587759, 0, 0, 1, 1, 1,
-0.1506053, 0.5668839, -0.6199213, 1, 0, 0, 1, 1,
-0.1497502, -0.3872863, -3.856174, 1, 0, 0, 1, 1,
-0.1473223, -0.6123977, -2.190513, 1, 0, 0, 1, 1,
-0.1437069, -0.6793223, -2.358387, 1, 0, 0, 1, 1,
-0.1385107, -0.4498247, -4.324721, 1, 0, 0, 1, 1,
-0.1376962, 0.1062093, -0.3108748, 0, 0, 0, 1, 1,
-0.1343455, 1.889828, -0.1708896, 0, 0, 0, 1, 1,
-0.1329099, 0.002445973, -2.591352, 0, 0, 0, 1, 1,
-0.1326694, 0.5225472, 1.950298, 0, 0, 0, 1, 1,
-0.132306, 0.5094993, 1.829728, 0, 0, 0, 1, 1,
-0.1288435, -0.1053168, -2.945093, 0, 0, 0, 1, 1,
-0.1280581, 1.014216, -0.8590459, 0, 0, 0, 1, 1,
-0.127868, -0.7297609, -4.229462, 1, 1, 1, 1, 1,
-0.127284, 1.155796, 0.9217868, 1, 1, 1, 1, 1,
-0.1263913, -0.6250516, -4.840451, 1, 1, 1, 1, 1,
-0.1240383, 1.059793, -0.1204909, 1, 1, 1, 1, 1,
-0.1237817, -1.009773, -2.235026, 1, 1, 1, 1, 1,
-0.1211213, 0.1822292, -1.398236, 1, 1, 1, 1, 1,
-0.1163299, -1.020635, -2.599088, 1, 1, 1, 1, 1,
-0.1130018, -0.9551668, -3.475635, 1, 1, 1, 1, 1,
-0.1125779, -0.8828096, -2.423686, 1, 1, 1, 1, 1,
-0.1096646, 1.544585, -0.1627573, 1, 1, 1, 1, 1,
-0.1092202, 1.190083, 0.8661823, 1, 1, 1, 1, 1,
-0.1069366, -0.7186147, -3.738728, 1, 1, 1, 1, 1,
-0.1050514, 0.5732275, 0.5574763, 1, 1, 1, 1, 1,
-0.1043793, -0.410489, -3.026575, 1, 1, 1, 1, 1,
-0.1037661, 0.3294854, 0.826575, 1, 1, 1, 1, 1,
-0.1012427, -0.330596, -3.596297, 0, 0, 1, 1, 1,
-0.09943587, 0.9327407, -0.09579605, 1, 0, 0, 1, 1,
-0.09660956, -0.08939616, -1.05682, 1, 0, 0, 1, 1,
-0.09619358, -0.4358331, -2.132929, 1, 0, 0, 1, 1,
-0.09611726, -1.367107, -2.738895, 1, 0, 0, 1, 1,
-0.09459002, -0.9690658, -3.111248, 1, 0, 0, 1, 1,
-0.0936161, -0.1992485, -1.968644, 0, 0, 0, 1, 1,
-0.09186014, -1.524481, -3.867157, 0, 0, 0, 1, 1,
-0.09102529, -1.204144, -2.246237, 0, 0, 0, 1, 1,
-0.0874263, -0.2371154, -3.754342, 0, 0, 0, 1, 1,
-0.08630924, 1.195692, -0.2743893, 0, 0, 0, 1, 1,
-0.08568107, 0.2949795, -1.246306, 0, 0, 0, 1, 1,
-0.08499681, 0.3260452, 0.1329508, 0, 0, 0, 1, 1,
-0.08410241, -0.2990079, -3.612502, 1, 1, 1, 1, 1,
-0.07915551, 0.3438356, -1.382859, 1, 1, 1, 1, 1,
-0.07763194, 0.6545252, 0.2100511, 1, 1, 1, 1, 1,
-0.07643519, 0.2742234, 1.707535, 1, 1, 1, 1, 1,
-0.07571233, -1.681777, -2.130551, 1, 1, 1, 1, 1,
-0.07436609, -1.031368, -3.16392, 1, 1, 1, 1, 1,
-0.07343464, 0.5924888, -0.8947198, 1, 1, 1, 1, 1,
-0.06911351, -0.4352423, -3.602589, 1, 1, 1, 1, 1,
-0.06614736, -1.415779, -3.304916, 1, 1, 1, 1, 1,
-0.06496055, 0.3642779, 0.464127, 1, 1, 1, 1, 1,
-0.05926963, -0.6818843, -2.532162, 1, 1, 1, 1, 1,
-0.05827416, -0.002890115, -2.13163, 1, 1, 1, 1, 1,
-0.05596202, 1.165663, 1.258293, 1, 1, 1, 1, 1,
-0.05462954, 1.195794, -0.5322841, 1, 1, 1, 1, 1,
-0.05372632, -0.1319169, -0.3817449, 1, 1, 1, 1, 1,
-0.0522889, -1.163041, -3.058106, 0, 0, 1, 1, 1,
-0.05107023, -1.102592, -2.736816, 1, 0, 0, 1, 1,
-0.04646517, 0.1103803, -1.801257, 1, 0, 0, 1, 1,
-0.04646335, -1.363427, -1.635574, 1, 0, 0, 1, 1,
-0.04162722, 0.2866696, 0.3640328, 1, 0, 0, 1, 1,
-0.04144198, -0.8052638, -1.691249, 1, 0, 0, 1, 1,
-0.03568134, -1.390374, -3.71451, 0, 0, 0, 1, 1,
-0.0352122, -0.3175963, -3.60963, 0, 0, 0, 1, 1,
-0.03500951, -0.2299981, -2.193264, 0, 0, 0, 1, 1,
-0.03489049, -1.087066, -2.48889, 0, 0, 0, 1, 1,
-0.0293153, 0.737571, -0.1970905, 0, 0, 0, 1, 1,
-0.02790242, -1.584379, -3.433377, 0, 0, 0, 1, 1,
-0.02144405, -0.503316, -2.834296, 0, 0, 0, 1, 1,
-0.02047714, 0.6652878, -0.7308106, 1, 1, 1, 1, 1,
-0.01258199, 0.7415779, -0.6194552, 1, 1, 1, 1, 1,
-0.009753328, 1.218263, -1.941497, 1, 1, 1, 1, 1,
0.0002110423, -1.785018, 2.963239, 1, 1, 1, 1, 1,
0.0008885647, 1.072209, -0.4739206, 1, 1, 1, 1, 1,
0.001444633, 0.05242748, 1.17995, 1, 1, 1, 1, 1,
0.002430364, 0.1213349, 0.2237646, 1, 1, 1, 1, 1,
0.002951532, -0.04166358, 2.805568, 1, 1, 1, 1, 1,
0.004112671, 0.02648768, 1.712835, 1, 1, 1, 1, 1,
0.004634446, 1.682394, -1.25974, 1, 1, 1, 1, 1,
0.009045279, -0.4064409, 2.88111, 1, 1, 1, 1, 1,
0.01358035, -0.7880347, 3.531832, 1, 1, 1, 1, 1,
0.01782667, -0.4182298, 2.754651, 1, 1, 1, 1, 1,
0.02042169, -0.4473577, 2.202334, 1, 1, 1, 1, 1,
0.02449297, -0.8668624, 2.913471, 1, 1, 1, 1, 1,
0.02459793, 1.042971, -0.7616668, 0, 0, 1, 1, 1,
0.02573384, 0.1307756, 2.524509, 1, 0, 0, 1, 1,
0.02752446, 2.204481, 0.1396751, 1, 0, 0, 1, 1,
0.03372013, 0.7937198, 0.1745145, 1, 0, 0, 1, 1,
0.03456129, 0.05760941, 1.179268, 1, 0, 0, 1, 1,
0.03474002, -1.436971, 2.054814, 1, 0, 0, 1, 1,
0.03894945, -0.3021857, 2.90039, 0, 0, 0, 1, 1,
0.04405789, -0.1512201, 3.48591, 0, 0, 0, 1, 1,
0.04409659, -0.2663472, 4.215693, 0, 0, 0, 1, 1,
0.04861227, -2.042566, 2.544334, 0, 0, 0, 1, 1,
0.04920426, -0.01190787, 1.479201, 0, 0, 0, 1, 1,
0.05321407, -0.9302136, 2.493491, 0, 0, 0, 1, 1,
0.05627653, -0.2609389, 1.601245, 0, 0, 0, 1, 1,
0.05644096, 1.324899, -0.4252476, 1, 1, 1, 1, 1,
0.0570359, -1.477568, 2.796586, 1, 1, 1, 1, 1,
0.05829708, 0.08483902, 1.955432, 1, 1, 1, 1, 1,
0.06273144, -0.3920094, 2.936762, 1, 1, 1, 1, 1,
0.06432556, 0.4584069, 0.8592123, 1, 1, 1, 1, 1,
0.06750632, -1.695506, 0.540805, 1, 1, 1, 1, 1,
0.07093416, 0.7690924, -1.196039, 1, 1, 1, 1, 1,
0.07236142, -0.9590554, 2.955783, 1, 1, 1, 1, 1,
0.07413425, 0.5476354, 0.03422075, 1, 1, 1, 1, 1,
0.07539967, -0.5597548, 4.497503, 1, 1, 1, 1, 1,
0.07871906, 0.6435215, -0.9763511, 1, 1, 1, 1, 1,
0.07959285, -1.13521, 3.107877, 1, 1, 1, 1, 1,
0.08281123, 0.5830595, 0.5239447, 1, 1, 1, 1, 1,
0.08653627, -0.3330429, 2.761106, 1, 1, 1, 1, 1,
0.09092185, 0.2690978, 0.8010984, 1, 1, 1, 1, 1,
0.09409241, 0.6619576, 0.4703259, 0, 0, 1, 1, 1,
0.09585752, -2.204911, 2.302407, 1, 0, 0, 1, 1,
0.09888633, 0.2326707, 0.415783, 1, 0, 0, 1, 1,
0.09949323, 2.356566, -0.4251252, 1, 0, 0, 1, 1,
0.1005938, 0.0320372, -0.04941355, 1, 0, 0, 1, 1,
0.1026211, -1.221407, 4.001513, 1, 0, 0, 1, 1,
0.105966, 0.5266945, 0.02326741, 0, 0, 0, 1, 1,
0.1079474, -0.2599682, 3.201983, 0, 0, 0, 1, 1,
0.1084261, 1.473467, 0.6499816, 0, 0, 0, 1, 1,
0.1103545, -0.04975354, 2.678521, 0, 0, 0, 1, 1,
0.1110203, 0.7227894, 0.5239395, 0, 0, 0, 1, 1,
0.1122292, -0.673641, 1.944083, 0, 0, 0, 1, 1,
0.1142978, -0.7963513, 2.84874, 0, 0, 0, 1, 1,
0.1157391, 0.8529604, 0.4627804, 1, 1, 1, 1, 1,
0.116095, 1.316986, -0.1057538, 1, 1, 1, 1, 1,
0.116747, 1.392934, -0.2150762, 1, 1, 1, 1, 1,
0.1224932, 0.8798743, -0.1958278, 1, 1, 1, 1, 1,
0.1241542, -0.9233531, 3.225994, 1, 1, 1, 1, 1,
0.1250401, 0.6423789, -2.029785, 1, 1, 1, 1, 1,
0.1257399, -0.9334177, 3.198361, 1, 1, 1, 1, 1,
0.1257707, -1.650439, 3.496079, 1, 1, 1, 1, 1,
0.1288648, -0.2524931, 5.120406, 1, 1, 1, 1, 1,
0.1303399, 0.4108717, 2.378483, 1, 1, 1, 1, 1,
0.1312426, 1.641836, -2.133995, 1, 1, 1, 1, 1,
0.1316451, 0.887517, 1.931339, 1, 1, 1, 1, 1,
0.1377451, -0.5784302, 2.395647, 1, 1, 1, 1, 1,
0.1379401, -1.918201, 4.730864, 1, 1, 1, 1, 1,
0.1435427, -0.4387799, 3.123898, 1, 1, 1, 1, 1,
0.1453272, -0.1185085, 2.113378, 0, 0, 1, 1, 1,
0.1524348, -2.207744, 4.11597, 1, 0, 0, 1, 1,
0.1553236, 1.012394, -0.4429782, 1, 0, 0, 1, 1,
0.1556162, -1.233059, 1.621742, 1, 0, 0, 1, 1,
0.1567781, 1.811316, -1.201712, 1, 0, 0, 1, 1,
0.1629637, 2.018254, -0.3945727, 1, 0, 0, 1, 1,
0.1648574, -0.5382347, 3.339744, 0, 0, 0, 1, 1,
0.1667634, 1.081183, -0.0572272, 0, 0, 0, 1, 1,
0.1695607, 0.7477013, 2.270875, 0, 0, 0, 1, 1,
0.1699724, -0.2161538, 4.293231, 0, 0, 0, 1, 1,
0.1726444, 0.6088846, -1.030533, 0, 0, 0, 1, 1,
0.1740046, 0.2259965, -0.3112855, 0, 0, 0, 1, 1,
0.1756672, 0.2702504, 0.6901917, 0, 0, 0, 1, 1,
0.1763013, 1.008747, -0.08980121, 1, 1, 1, 1, 1,
0.1830918, -1.845076, 2.454308, 1, 1, 1, 1, 1,
0.1832829, -1.425083, 2.192709, 1, 1, 1, 1, 1,
0.1840048, -1.288244, 3.46662, 1, 1, 1, 1, 1,
0.1853785, -0.2571388, 2.024235, 1, 1, 1, 1, 1,
0.1854952, -0.5789837, 2.727144, 1, 1, 1, 1, 1,
0.1856572, -0.4090532, 2.650724, 1, 1, 1, 1, 1,
0.1905496, -0.5744817, 3.492821, 1, 1, 1, 1, 1,
0.1911007, -1.187616, 3.728894, 1, 1, 1, 1, 1,
0.1912129, -0.3913482, 2.916965, 1, 1, 1, 1, 1,
0.1925861, -0.5186611, 1.98923, 1, 1, 1, 1, 1,
0.1950335, -0.9379783, 3.246332, 1, 1, 1, 1, 1,
0.1974436, -1.787016, 3.474129, 1, 1, 1, 1, 1,
0.2010025, 0.08365057, 0.2661813, 1, 1, 1, 1, 1,
0.2061548, -1.65693, 3.929183, 1, 1, 1, 1, 1,
0.2071299, 0.3832443, 0.7920924, 0, 0, 1, 1, 1,
0.2105185, 0.3634078, 0.2435034, 1, 0, 0, 1, 1,
0.2128295, -0.9792885, 1.763723, 1, 0, 0, 1, 1,
0.2131285, 0.5239241, 1.048771, 1, 0, 0, 1, 1,
0.2185879, 0.3806611, 1.875956, 1, 0, 0, 1, 1,
0.2210518, 0.01405214, 3.605983, 1, 0, 0, 1, 1,
0.2252084, -1.019691, 3.226831, 0, 0, 0, 1, 1,
0.2255002, -0.6830221, 2.475364, 0, 0, 0, 1, 1,
0.2283682, -1.853249, 4.138293, 0, 0, 0, 1, 1,
0.2318459, 0.3719667, 1.002434, 0, 0, 0, 1, 1,
0.2321765, -1.928173, 2.803126, 0, 0, 0, 1, 1,
0.2343217, 1.430071, -0.2840559, 0, 0, 0, 1, 1,
0.2358224, 1.206506, 0.5620054, 0, 0, 0, 1, 1,
0.2367222, 0.9129397, 0.2608426, 1, 1, 1, 1, 1,
0.2373318, -0.1002306, 1.31356, 1, 1, 1, 1, 1,
0.2375802, -1.553605, 2.722407, 1, 1, 1, 1, 1,
0.2397456, -0.8652261, 1.467264, 1, 1, 1, 1, 1,
0.2408055, -0.3950775, 2.974738, 1, 1, 1, 1, 1,
0.2449526, 0.9555804, 1.772507, 1, 1, 1, 1, 1,
0.2468566, -0.9776262, 2.14864, 1, 1, 1, 1, 1,
0.2474644, 0.2334729, 0.01642241, 1, 1, 1, 1, 1,
0.2489594, 2.237995, 1.671157, 1, 1, 1, 1, 1,
0.2508095, 2.916248, 0.4889427, 1, 1, 1, 1, 1,
0.2547392, -0.5812382, 2.240802, 1, 1, 1, 1, 1,
0.2551215, 0.2132746, 0.5561551, 1, 1, 1, 1, 1,
0.2584303, 0.200373, -0.1957985, 1, 1, 1, 1, 1,
0.2600592, 0.7665951, 0.1477107, 1, 1, 1, 1, 1,
0.2663893, 0.4003861, 0.07558999, 1, 1, 1, 1, 1,
0.2665768, -0.5410533, 1.779388, 0, 0, 1, 1, 1,
0.2681365, -0.7411779, 3.740601, 1, 0, 0, 1, 1,
0.268953, 0.940607, 1.115239, 1, 0, 0, 1, 1,
0.2692681, -0.445302, 2.286364, 1, 0, 0, 1, 1,
0.2735788, -0.8134959, 3.670875, 1, 0, 0, 1, 1,
0.273895, 0.4459791, 0.8797196, 1, 0, 0, 1, 1,
0.2773463, 0.400943, 1.935077, 0, 0, 0, 1, 1,
0.2787955, 1.399372, 0.7666824, 0, 0, 0, 1, 1,
0.2805402, -0.2039088, 2.023684, 0, 0, 0, 1, 1,
0.2814352, 0.3453996, 0.7446241, 0, 0, 0, 1, 1,
0.2832018, -1.255726, 3.925631, 0, 0, 0, 1, 1,
0.2834817, -0.3588598, 2.764157, 0, 0, 0, 1, 1,
0.2944261, 0.7667146, 0.3210687, 0, 0, 0, 1, 1,
0.2950984, -0.664803, 2.100504, 1, 1, 1, 1, 1,
0.3050975, -1.067518, 2.869126, 1, 1, 1, 1, 1,
0.3052913, 0.6979625, 2.756918, 1, 1, 1, 1, 1,
0.3080442, -1.858909, 2.531702, 1, 1, 1, 1, 1,
0.3131669, 0.5844269, -0.3587559, 1, 1, 1, 1, 1,
0.3133085, -1.032865, 2.036176, 1, 1, 1, 1, 1,
0.3133892, 0.07021457, 1.838719, 1, 1, 1, 1, 1,
0.3160726, -1.448424, 1.71604, 1, 1, 1, 1, 1,
0.3187811, -0.09724976, 3.900841, 1, 1, 1, 1, 1,
0.3236709, 0.1812594, 0.9861454, 1, 1, 1, 1, 1,
0.3247582, 0.6290825, 1.022602, 1, 1, 1, 1, 1,
0.3284987, -0.9413704, 3.142113, 1, 1, 1, 1, 1,
0.3346211, -0.7771176, 3.956773, 1, 1, 1, 1, 1,
0.3405313, -0.901895, 3.713173, 1, 1, 1, 1, 1,
0.3433255, 1.178092, -0.005079371, 1, 1, 1, 1, 1,
0.3434475, 1.170561, 0.3438286, 0, 0, 1, 1, 1,
0.3444667, 0.3195233, 3.237872, 1, 0, 0, 1, 1,
0.3488419, 0.002982343, 1.216051, 1, 0, 0, 1, 1,
0.3550488, -0.4334159, 4.498943, 1, 0, 0, 1, 1,
0.3577718, -1.901227, 3.59527, 1, 0, 0, 1, 1,
0.358539, -0.5095873, 1.074011, 1, 0, 0, 1, 1,
0.3696553, -0.03394556, 0.8164033, 0, 0, 0, 1, 1,
0.3722574, -0.6505252, 2.586313, 0, 0, 0, 1, 1,
0.3741504, 0.7741693, 0.2853332, 0, 0, 0, 1, 1,
0.3761178, -2.114425, 3.418023, 0, 0, 0, 1, 1,
0.3763998, 0.4671114, 0.05108569, 0, 0, 0, 1, 1,
0.3769427, 0.5191141, 2.59489, 0, 0, 0, 1, 1,
0.3802648, -1.915471, 3.575794, 0, 0, 0, 1, 1,
0.3803214, -0.3749803, 2.398046, 1, 1, 1, 1, 1,
0.3816144, -1.274588, 2.033121, 1, 1, 1, 1, 1,
0.3834007, 2.194329, 1.161913, 1, 1, 1, 1, 1,
0.3883258, -1.412913, 3.228272, 1, 1, 1, 1, 1,
0.3904954, -0.3104152, 1.677681, 1, 1, 1, 1, 1,
0.3917453, -0.1458979, 2.034809, 1, 1, 1, 1, 1,
0.3952186, 1.244278, 1.276949, 1, 1, 1, 1, 1,
0.3980681, 0.1732737, 2.083767, 1, 1, 1, 1, 1,
0.4005683, -0.4219735, -0.1302505, 1, 1, 1, 1, 1,
0.401068, -1.34892, 3.990084, 1, 1, 1, 1, 1,
0.4041888, -0.4327212, 0.7384658, 1, 1, 1, 1, 1,
0.4117286, -0.3846537, 2.169941, 1, 1, 1, 1, 1,
0.4120349, 0.4071511, 1.061438, 1, 1, 1, 1, 1,
0.4120892, -2.083185, 1.715429, 1, 1, 1, 1, 1,
0.4232476, 0.4834874, 1.097852, 1, 1, 1, 1, 1,
0.4260351, 0.3466443, 1.874983, 0, 0, 1, 1, 1,
0.4292601, 0.2841763, 2.024179, 1, 0, 0, 1, 1,
0.4293146, -0.1367014, 2.761212, 1, 0, 0, 1, 1,
0.4306095, -0.9848344, 4.813599, 1, 0, 0, 1, 1,
0.4327763, 1.335061, 1.717054, 1, 0, 0, 1, 1,
0.436524, -1.482087, 2.883119, 1, 0, 0, 1, 1,
0.438094, 0.5273108, 1.574967, 0, 0, 0, 1, 1,
0.4394258, 0.5685338, 0.2741086, 0, 0, 0, 1, 1,
0.4408536, 1.520693, -0.1259757, 0, 0, 0, 1, 1,
0.4415589, 0.26268, 1.225393, 0, 0, 0, 1, 1,
0.4431905, -0.2589263, 0.6748558, 0, 0, 0, 1, 1,
0.4503381, -0.8422009, 1.658728, 0, 0, 0, 1, 1,
0.4505542, -0.8431058, 1.795552, 0, 0, 0, 1, 1,
0.4512107, 0.3807344, -1.214192, 1, 1, 1, 1, 1,
0.4527006, 0.4209149, -0.3260105, 1, 1, 1, 1, 1,
0.4559796, -1.23102, 3.224381, 1, 1, 1, 1, 1,
0.4579028, 3.20173, 0.3426515, 1, 1, 1, 1, 1,
0.4579073, -0.3497933, 0.9419771, 1, 1, 1, 1, 1,
0.460603, 0.9721842, -0.2856756, 1, 1, 1, 1, 1,
0.46117, -0.7234437, 1.182258, 1, 1, 1, 1, 1,
0.4655949, 0.240921, 0.4372798, 1, 1, 1, 1, 1,
0.4666583, 1.605249, -1.167325, 1, 1, 1, 1, 1,
0.4703793, -1.127877, 3.617346, 1, 1, 1, 1, 1,
0.4720809, -0.3469135, 3.401907, 1, 1, 1, 1, 1,
0.4760462, 0.1965569, -0.9862297, 1, 1, 1, 1, 1,
0.4842788, -1.142358, 1.897856, 1, 1, 1, 1, 1,
0.4851779, -2.467849, 2.195725, 1, 1, 1, 1, 1,
0.4884632, 0.4126746, 1.461986, 1, 1, 1, 1, 1,
0.4896814, -0.9750345, 2.928462, 0, 0, 1, 1, 1,
0.4901961, -0.2752967, 1.695615, 1, 0, 0, 1, 1,
0.4956948, -0.1126912, 3.795517, 1, 0, 0, 1, 1,
0.4972807, 1.200398, 0.3613016, 1, 0, 0, 1, 1,
0.4980719, 0.9124599, 0.6565998, 1, 0, 0, 1, 1,
0.5011928, 0.1775974, 0.1142089, 1, 0, 0, 1, 1,
0.5033989, -0.4993074, 1.915097, 0, 0, 0, 1, 1,
0.5068683, 1.338524, 0.9530053, 0, 0, 0, 1, 1,
0.5085549, -1.371593, 3.522729, 0, 0, 0, 1, 1,
0.5095143, 0.24977, 1.385307, 0, 0, 0, 1, 1,
0.5120479, 1.226574, 1.314569, 0, 0, 0, 1, 1,
0.512876, 0.9625472, 0.7725111, 0, 0, 0, 1, 1,
0.5173634, 0.01613065, 1.11442, 0, 0, 0, 1, 1,
0.5195296, -1.162586, 3.91648, 1, 1, 1, 1, 1,
0.5196698, -0.2921875, 0.02013328, 1, 1, 1, 1, 1,
0.5198799, -0.6294898, -0.3215697, 1, 1, 1, 1, 1,
0.5199584, -0.1186583, 1.227711, 1, 1, 1, 1, 1,
0.5226151, -0.2426535, 1.727749, 1, 1, 1, 1, 1,
0.5229697, 0.8276395, 2.307947, 1, 1, 1, 1, 1,
0.5233003, -1.043171, 1.519233, 1, 1, 1, 1, 1,
0.5356013, 1.364289, -0.2595311, 1, 1, 1, 1, 1,
0.5377455, 1.911393, -0.6507337, 1, 1, 1, 1, 1,
0.5451164, 0.6914326, 1.072874, 1, 1, 1, 1, 1,
0.5510029, 0.9821742, 0.8362488, 1, 1, 1, 1, 1,
0.5558501, 2.081937, -0.1790472, 1, 1, 1, 1, 1,
0.5607816, -0.2342256, 0.1375167, 1, 1, 1, 1, 1,
0.5678857, 0.1923989, 2.247755, 1, 1, 1, 1, 1,
0.5724136, -0.2645082, 0.9470752, 1, 1, 1, 1, 1,
0.5729203, -0.7848345, 2.225351, 0, 0, 1, 1, 1,
0.5873904, 0.2967847, 1.845331, 1, 0, 0, 1, 1,
0.589772, 0.1285654, 1.025048, 1, 0, 0, 1, 1,
0.5912836, 1.562629, 0.5873408, 1, 0, 0, 1, 1,
0.5926603, -1.22861, 3.238307, 1, 0, 0, 1, 1,
0.600408, 0.8031803, 0.02926622, 1, 0, 0, 1, 1,
0.6042067, 0.6764889, 0.6986318, 0, 0, 0, 1, 1,
0.6046149, -0.2877029, 1.793659, 0, 0, 0, 1, 1,
0.6091683, 0.5784807, -0.7948251, 0, 0, 0, 1, 1,
0.6139967, -1.273477, 3.555408, 0, 0, 0, 1, 1,
0.6145041, -0.4362671, 1.697659, 0, 0, 0, 1, 1,
0.6238821, -0.1167409, 0.6293529, 0, 0, 0, 1, 1,
0.6262324, -0.2751695, 3.29461, 0, 0, 0, 1, 1,
0.6272549, 1.358954, 0.9417506, 1, 1, 1, 1, 1,
0.6278841, 1.252393, 0.5716571, 1, 1, 1, 1, 1,
0.6352993, -1.016816, 3.010662, 1, 1, 1, 1, 1,
0.6353586, -0.1582224, 2.534324, 1, 1, 1, 1, 1,
0.6380292, -1.639045, 2.444598, 1, 1, 1, 1, 1,
0.6465878, -0.05482592, 2.312198, 1, 1, 1, 1, 1,
0.6521583, 0.6913954, -0.4005376, 1, 1, 1, 1, 1,
0.6553062, -0.02433563, 0.7942035, 1, 1, 1, 1, 1,
0.6567644, 0.2314331, 1.91966, 1, 1, 1, 1, 1,
0.6580353, -0.07560951, 1.133528, 1, 1, 1, 1, 1,
0.6609572, 0.8695626, 1.151887, 1, 1, 1, 1, 1,
0.663803, 0.5534849, 1.166589, 1, 1, 1, 1, 1,
0.6651151, 1.227126, 1.202065, 1, 1, 1, 1, 1,
0.6651666, -2.306367, 2.210886, 1, 1, 1, 1, 1,
0.666597, 0.8919788, 1.025613, 1, 1, 1, 1, 1,
0.6685732, 1.003928, 1.558881, 0, 0, 1, 1, 1,
0.6696567, -0.8502436, 4.474113, 1, 0, 0, 1, 1,
0.670276, -0.4601614, 1.588679, 1, 0, 0, 1, 1,
0.673059, 0.6632028, 0.4742174, 1, 0, 0, 1, 1,
0.6742938, 0.6473104, 0.5186543, 1, 0, 0, 1, 1,
0.6772206, 1.606658, 1.158458, 1, 0, 0, 1, 1,
0.6824523, 1.210848, 0.7142876, 0, 0, 0, 1, 1,
0.6833275, -0.5123725, 0.2422276, 0, 0, 0, 1, 1,
0.6841521, 1.498474, -0.2554713, 0, 0, 0, 1, 1,
0.688894, 1.334221, -0.1213534, 0, 0, 0, 1, 1,
0.6907184, 0.6565799, 2.894782, 0, 0, 0, 1, 1,
0.6945595, 0.760813, -0.4917796, 0, 0, 0, 1, 1,
0.6986049, -2.065282, 2.419071, 0, 0, 0, 1, 1,
0.6990322, 0.9184312, 2.56758, 1, 1, 1, 1, 1,
0.699397, 0.2483863, 1.980861, 1, 1, 1, 1, 1,
0.7019029, 0.3570317, 1.845701, 1, 1, 1, 1, 1,
0.7069653, -0.6562797, 1.358261, 1, 1, 1, 1, 1,
0.7081332, 0.3061892, 0.7638801, 1, 1, 1, 1, 1,
0.7093762, 0.4434691, 0.726954, 1, 1, 1, 1, 1,
0.7096812, 0.9956757, 1.591826, 1, 1, 1, 1, 1,
0.7135711, -0.02247863, 0.2580243, 1, 1, 1, 1, 1,
0.7139965, -0.9777958, 2.931548, 1, 1, 1, 1, 1,
0.7208853, 0.5874266, 1.18615, 1, 1, 1, 1, 1,
0.7212062, -0.384855, 2.78613, 1, 1, 1, 1, 1,
0.7223111, -0.8869984, 1.819621, 1, 1, 1, 1, 1,
0.7281089, 0.5001827, 0.7231051, 1, 1, 1, 1, 1,
0.732801, -0.6237454, 2.780087, 1, 1, 1, 1, 1,
0.7459887, -0.4900134, 3.42973, 1, 1, 1, 1, 1,
0.7500126, -1.757775, 2.987129, 0, 0, 1, 1, 1,
0.7513537, -0.2961577, 2.056342, 1, 0, 0, 1, 1,
0.7524529, -0.1210372, 3.223532, 1, 0, 0, 1, 1,
0.7544591, -0.4179031, 2.334988, 1, 0, 0, 1, 1,
0.7563087, -0.001959177, 1.563164, 1, 0, 0, 1, 1,
0.7563211, -1.136029, 2.026695, 1, 0, 0, 1, 1,
0.759847, 1.237776, 1.592036, 0, 0, 0, 1, 1,
0.7690278, -1.250141, 2.373174, 0, 0, 0, 1, 1,
0.7740793, -0.2113366, 1.9762, 0, 0, 0, 1, 1,
0.7788531, 0.1596692, -0.628668, 0, 0, 0, 1, 1,
0.7815846, -0.02560687, 2.907059, 0, 0, 0, 1, 1,
0.7817748, -1.16693, 2.703507, 0, 0, 0, 1, 1,
0.7839049, -1.571353, 2.963149, 0, 0, 0, 1, 1,
0.7849131, 0.4119092, 0.2328503, 1, 1, 1, 1, 1,
0.7953826, 1.323222, 1.472837, 1, 1, 1, 1, 1,
0.8028413, -0.1860149, 4.190888, 1, 1, 1, 1, 1,
0.8085493, -0.4237943, 0.9368364, 1, 1, 1, 1, 1,
0.8112513, -1.035367, 1.03045, 1, 1, 1, 1, 1,
0.8147035, -0.2649925, 2.566428, 1, 1, 1, 1, 1,
0.8150847, 0.2873369, 1.244252, 1, 1, 1, 1, 1,
0.8185991, -0.03713376, 1.185169, 1, 1, 1, 1, 1,
0.8215317, 1.535941, 0.1985728, 1, 1, 1, 1, 1,
0.828333, 0.1435141, 0.445625, 1, 1, 1, 1, 1,
0.8291609, -0.7552994, 4.359262, 1, 1, 1, 1, 1,
0.8323577, 1.224062, -1.514264, 1, 1, 1, 1, 1,
0.8352063, -0.9188433, 3.173008, 1, 1, 1, 1, 1,
0.8464888, -0.0337505, 0.08762366, 1, 1, 1, 1, 1,
0.8503461, -1.65424, 1.66814, 1, 1, 1, 1, 1,
0.8568457, -0.5953881, 2.244596, 0, 0, 1, 1, 1,
0.8637661, 1.574306, -0.09608464, 1, 0, 0, 1, 1,
0.8671984, 0.3880445, 0.9346507, 1, 0, 0, 1, 1,
0.8698667, -1.176111, 2.429637, 1, 0, 0, 1, 1,
0.8941813, 2.360055, 0.9160711, 1, 0, 0, 1, 1,
0.8969658, -1.215682, 2.363265, 1, 0, 0, 1, 1,
0.9099406, -0.5526549, 0.929134, 0, 0, 0, 1, 1,
0.9151796, 1.767643, 0.2818445, 0, 0, 0, 1, 1,
0.9158601, -0.9761482, 3.186025, 0, 0, 0, 1, 1,
0.918279, 0.6126166, 0.6526795, 0, 0, 0, 1, 1,
0.921513, -0.8743834, 3.81065, 0, 0, 0, 1, 1,
0.9217904, -1.171155, 1.503953, 0, 0, 0, 1, 1,
0.9218309, 0.3815419, -0.3176627, 0, 0, 0, 1, 1,
0.9281657, -0.9906667, 2.153274, 1, 1, 1, 1, 1,
0.9288777, -2.001352, 1.874491, 1, 1, 1, 1, 1,
0.9351091, -0.172717, -0.7304629, 1, 1, 1, 1, 1,
0.9366951, 1.323584, -1.848936, 1, 1, 1, 1, 1,
0.9411042, 0.4743365, 0.936793, 1, 1, 1, 1, 1,
0.9420859, -0.9479465, 1.765396, 1, 1, 1, 1, 1,
0.9438428, 1.391257, -0.2145988, 1, 1, 1, 1, 1,
0.9481717, -1.956319, 1.976602, 1, 1, 1, 1, 1,
0.9484283, 0.1933426, 3.886392, 1, 1, 1, 1, 1,
0.9490334, -2.273706, 1.357138, 1, 1, 1, 1, 1,
0.9526097, 1.458819, 0.3634012, 1, 1, 1, 1, 1,
0.9527327, -1.440925, 1.597983, 1, 1, 1, 1, 1,
0.95674, -1.616007, 2.483265, 1, 1, 1, 1, 1,
0.9623366, -1.928109, 3.297167, 1, 1, 1, 1, 1,
0.969183, -1.094191, 3.682227, 1, 1, 1, 1, 1,
0.9727728, 1.212269, 0.5147133, 0, 0, 1, 1, 1,
0.9745011, 1.751511, -0.08964297, 1, 0, 0, 1, 1,
0.9761403, -1.294537, 1.604107, 1, 0, 0, 1, 1,
0.9807166, -0.4150724, 2.234829, 1, 0, 0, 1, 1,
0.983904, 1.023176, 0.3521353, 1, 0, 0, 1, 1,
0.9854076, -0.6813527, 2.655113, 1, 0, 0, 1, 1,
0.9854224, 0.7732425, 1.286798, 0, 0, 0, 1, 1,
0.9975755, -0.5510872, 2.150553, 0, 0, 0, 1, 1,
0.9977177, 0.9058768, 1.795185, 0, 0, 0, 1, 1,
0.9992578, -0.3010829, 2.012187, 0, 0, 0, 1, 1,
1.006701, 0.02592168, 1.519487, 0, 0, 0, 1, 1,
1.013039, 1.194808, -0.6179658, 0, 0, 0, 1, 1,
1.016479, -0.1006558, 1.33479, 0, 0, 0, 1, 1,
1.016905, 1.01526, 0.4099347, 1, 1, 1, 1, 1,
1.01702, 0.6657622, -0.7869052, 1, 1, 1, 1, 1,
1.018532, -0.8680567, 3.297985, 1, 1, 1, 1, 1,
1.025457, 0.1966676, -1.046704, 1, 1, 1, 1, 1,
1.03681, 0.3169693, 1.729825, 1, 1, 1, 1, 1,
1.036959, -1.019239, 2.968036, 1, 1, 1, 1, 1,
1.037281, -0.3012614, 2.355923, 1, 1, 1, 1, 1,
1.054811, -0.4933946, 2.563001, 1, 1, 1, 1, 1,
1.05537, -0.4932264, 0.5403861, 1, 1, 1, 1, 1,
1.063165, 1.321659, 1.710962, 1, 1, 1, 1, 1,
1.068276, -1.654788, 3.03923, 1, 1, 1, 1, 1,
1.075722, -0.9689239, 2.998577, 1, 1, 1, 1, 1,
1.086554, -0.5469012, 1.97258, 1, 1, 1, 1, 1,
1.086781, -1.6606, 3.861864, 1, 1, 1, 1, 1,
1.087374, 1.697222, 0.232212, 1, 1, 1, 1, 1,
1.089334, 3.660381, 0.7652089, 0, 0, 1, 1, 1,
1.093346, 0.4250168, 0.87972, 1, 0, 0, 1, 1,
1.093516, 2.053991, 0.3634718, 1, 0, 0, 1, 1,
1.100476, 0.6571875, -0.04003491, 1, 0, 0, 1, 1,
1.101086, 1.448164, 0.6055289, 1, 0, 0, 1, 1,
1.101845, 0.9303022, -0.3135036, 1, 0, 0, 1, 1,
1.120235, -0.4828051, 0.8384777, 0, 0, 0, 1, 1,
1.138897, -0.626123, 1.089596, 0, 0, 0, 1, 1,
1.145551, 1.954119, 0.9904369, 0, 0, 0, 1, 1,
1.150241, -0.3171515, 2.503535, 0, 0, 0, 1, 1,
1.150861, -0.4223789, 2.204071, 0, 0, 0, 1, 1,
1.158445, 0.5211391, 0.09477251, 0, 0, 0, 1, 1,
1.170331, -1.480351, 1.32684, 0, 0, 0, 1, 1,
1.172023, -1.248373, 3.138797, 1, 1, 1, 1, 1,
1.172466, -0.7872709, 2.30289, 1, 1, 1, 1, 1,
1.175261, 0.4867017, 1.848116, 1, 1, 1, 1, 1,
1.190673, 2.024014, 1.727262, 1, 1, 1, 1, 1,
1.201512, 0.6668605, 2.732474, 1, 1, 1, 1, 1,
1.20314, -0.3390326, 2.099954, 1, 1, 1, 1, 1,
1.213888, -1.022677, 4.156466, 1, 1, 1, 1, 1,
1.214978, 0.1048686, 2.674598, 1, 1, 1, 1, 1,
1.223941, 0.4259593, 1.673267, 1, 1, 1, 1, 1,
1.227152, 0.01907634, 2.701607, 1, 1, 1, 1, 1,
1.230564, -1.67477, 1.996086, 1, 1, 1, 1, 1,
1.231749, 0.7860948, 0.9455708, 1, 1, 1, 1, 1,
1.232669, 0.9550803, 0.007848634, 1, 1, 1, 1, 1,
1.239, 1.465657, 0.1653334, 1, 1, 1, 1, 1,
1.242249, 0.02206125, -0.2108522, 1, 1, 1, 1, 1,
1.250745, 0.1694884, 1.563172, 0, 0, 1, 1, 1,
1.250986, 0.8554025, -0.01561591, 1, 0, 0, 1, 1,
1.252204, -0.5699771, 1.854787, 1, 0, 0, 1, 1,
1.253959, 2.364574, -0.3585038, 1, 0, 0, 1, 1,
1.266045, 0.2327448, 2.97872, 1, 0, 0, 1, 1,
1.269475, 2.547046, 0.6349914, 1, 0, 0, 1, 1,
1.272707, -2.062456, 2.498752, 0, 0, 0, 1, 1,
1.276321, 0.07695472, 3.76404, 0, 0, 0, 1, 1,
1.279568, 0.7946905, -0.08072996, 0, 0, 0, 1, 1,
1.284066, -1.70458, 1.928044, 0, 0, 0, 1, 1,
1.284472, 0.3695104, 3.267826, 0, 0, 0, 1, 1,
1.292518, 1.336077, 2.446174, 0, 0, 0, 1, 1,
1.294107, 0.9767972, 0.9853551, 0, 0, 0, 1, 1,
1.297229, 2.034729, 1.372569, 1, 1, 1, 1, 1,
1.3056, 1.008437, 1.272969, 1, 1, 1, 1, 1,
1.307765, -0.4851691, 1.679155, 1, 1, 1, 1, 1,
1.316105, 1.032603, 0.3347372, 1, 1, 1, 1, 1,
1.330709, -0.9849983, 0.5079788, 1, 1, 1, 1, 1,
1.330941, 0.1934923, 3.095285, 1, 1, 1, 1, 1,
1.333103, -0.5085082, 2.29765, 1, 1, 1, 1, 1,
1.334453, -0.1080015, 1.769161, 1, 1, 1, 1, 1,
1.341665, -1.207589, 2.531874, 1, 1, 1, 1, 1,
1.343064, -0.6805807, 1.710168, 1, 1, 1, 1, 1,
1.344529, -0.2492141, 2.545794, 1, 1, 1, 1, 1,
1.348402, -0.2970194, 2.417409, 1, 1, 1, 1, 1,
1.361037, -1.617058, 1.822815, 1, 1, 1, 1, 1,
1.361482, 0.7723696, 1.604076, 1, 1, 1, 1, 1,
1.363136, 1.442696, -1.623212, 1, 1, 1, 1, 1,
1.37023, 0.1784021, 0.643124, 0, 0, 1, 1, 1,
1.376594, 2.121466, 1.16425, 1, 0, 0, 1, 1,
1.376632, -1.031361, 2.458919, 1, 0, 0, 1, 1,
1.386015, 1.069628, 0.5653427, 1, 0, 0, 1, 1,
1.396015, 0.159097, 0.8613953, 1, 0, 0, 1, 1,
1.403713, -0.9094648, 4.199323, 1, 0, 0, 1, 1,
1.405277, 0.8265327, 0.4111734, 0, 0, 0, 1, 1,
1.423916, -0.1911689, 3.960084, 0, 0, 0, 1, 1,
1.426785, 0.9777371, 2.195323, 0, 0, 0, 1, 1,
1.433009, 0.25155, -0.671937, 0, 0, 0, 1, 1,
1.44571, -0.7500173, -0.005769585, 0, 0, 0, 1, 1,
1.447162, -0.4902481, 0.4231943, 0, 0, 0, 1, 1,
1.457135, -0.3653817, 2.008955, 0, 0, 0, 1, 1,
1.462105, -0.02435779, 2.21257, 1, 1, 1, 1, 1,
1.464847, -0.635312, 3.831441, 1, 1, 1, 1, 1,
1.46543, -0.6202591, -0.7259622, 1, 1, 1, 1, 1,
1.47213, -0.4337141, 3.70771, 1, 1, 1, 1, 1,
1.478615, 1.468782, -1.081176, 1, 1, 1, 1, 1,
1.482412, 0.2876147, 2.732823, 1, 1, 1, 1, 1,
1.49178, -1.361648, 2.15988, 1, 1, 1, 1, 1,
1.498383, 1.269914, 2.551495, 1, 1, 1, 1, 1,
1.503488, -0.7702981, 0.7186201, 1, 1, 1, 1, 1,
1.505399, -0.7736079, 1.900741, 1, 1, 1, 1, 1,
1.52579, 0.6662699, 2.198867, 1, 1, 1, 1, 1,
1.535815, 0.3726881, 1.255223, 1, 1, 1, 1, 1,
1.541864, -0.252107, 0.9357476, 1, 1, 1, 1, 1,
1.543175, 0.8262904, -0.6419334, 1, 1, 1, 1, 1,
1.549783, -0.5966321, 1.312459, 1, 1, 1, 1, 1,
1.558388, 0.4543571, 2.062026, 0, 0, 1, 1, 1,
1.563909, -0.7271109, 2.783066, 1, 0, 0, 1, 1,
1.575454, -1.375779, 1.050474, 1, 0, 0, 1, 1,
1.600682, -0.0001594412, 3.261719, 1, 0, 0, 1, 1,
1.601152, -0.6003733, 3.698025, 1, 0, 0, 1, 1,
1.603719, 0.8321798, 1.407311, 1, 0, 0, 1, 1,
1.608551, 0.1558281, 1.528274, 0, 0, 0, 1, 1,
1.608693, -1.522478, 2.390555, 0, 0, 0, 1, 1,
1.62642, -0.4825393, 1.296699, 0, 0, 0, 1, 1,
1.640252, -1.184725, 2.99324, 0, 0, 0, 1, 1,
1.659943, 0.898968, 0.8893135, 0, 0, 0, 1, 1,
1.660859, -0.9242764, 4.218401, 0, 0, 0, 1, 1,
1.663222, -0.820255, 2.53324, 0, 0, 0, 1, 1,
1.715617, -0.6146495, 4.177884, 1, 1, 1, 1, 1,
1.717071, 1.79201, 0.2828209, 1, 1, 1, 1, 1,
1.722809, -0.2999903, 2.027458, 1, 1, 1, 1, 1,
1.734109, 1.776903, 0.02415545, 1, 1, 1, 1, 1,
1.74599, -1.432593, 3.685365, 1, 1, 1, 1, 1,
1.750541, 1.184385, 2.257138, 1, 1, 1, 1, 1,
1.756254, -0.3116915, 1.742167, 1, 1, 1, 1, 1,
1.758868, -1.421661, 2.5298, 1, 1, 1, 1, 1,
1.778429, -0.1152771, 2.905094, 1, 1, 1, 1, 1,
1.798233, 1.495006, 0.2309712, 1, 1, 1, 1, 1,
1.800285, -0.5797338, 1.274998, 1, 1, 1, 1, 1,
1.861304, -1.663827, 1.561485, 1, 1, 1, 1, 1,
1.904221, -0.5997766, 1.272923, 1, 1, 1, 1, 1,
1.947938, 0.5847037, 0.6950943, 1, 1, 1, 1, 1,
1.964482, -0.3975376, 1.572562, 1, 1, 1, 1, 1,
1.978469, -1.21757, 2.687293, 0, 0, 1, 1, 1,
2.005383, -0.4689439, 2.064892, 1, 0, 0, 1, 1,
2.011654, -0.02399338, 1.593207, 1, 0, 0, 1, 1,
2.060414, -1.269261, 3.43043, 1, 0, 0, 1, 1,
2.066787, 0.918112, 2.881259, 1, 0, 0, 1, 1,
2.072867, 0.3518275, -0.2626483, 1, 0, 0, 1, 1,
2.092506, -1.245441, 1.490432, 0, 0, 0, 1, 1,
2.129764, -0.8542396, 2.860721, 0, 0, 0, 1, 1,
2.206661, 0.2199264, 2.776376, 0, 0, 0, 1, 1,
2.238377, -0.3724187, 1.802826, 0, 0, 0, 1, 1,
2.328692, -1.449322, 1.511942, 0, 0, 0, 1, 1,
2.393998, -1.001106, 3.17605, 0, 0, 0, 1, 1,
2.396743, 0.6263959, 3.654725, 0, 0, 0, 1, 1,
2.469312, 0.2018942, 2.294582, 1, 1, 1, 1, 1,
2.517649, 0.1304055, 3.066035, 1, 1, 1, 1, 1,
2.606222, -0.3577712, 2.624854, 1, 1, 1, 1, 1,
2.747098, 0.2600622, 0.695152, 1, 1, 1, 1, 1,
2.76889, 0.7326059, 2.033844, 1, 1, 1, 1, 1,
2.998462, -1.162129, 1.466899, 1, 1, 1, 1, 1,
3.485881, -0.9303908, 3.057009, 1, 1, 1, 1, 1
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
var radius = 9.669628;
var distance = 33.96416;
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
mvMatrix.translate( -0.0632627, -0.09144711, -0.05085683 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96416);
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
