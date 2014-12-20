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
-2.845435, -0.5460333, -2.57562, 1, 0, 0, 1,
-2.741779, -1.328532, -2.354696, 1, 0.007843138, 0, 1,
-2.526907, 0.0325257, -1.142442, 1, 0.01176471, 0, 1,
-2.400918, 0.1836968, -0.9758095, 1, 0.01960784, 0, 1,
-2.377385, 0.6194781, -2.426045, 1, 0.02352941, 0, 1,
-2.367421, -1.033922, -0.6848812, 1, 0.03137255, 0, 1,
-2.292706, 1.455117, -0.3575088, 1, 0.03529412, 0, 1,
-2.233539, 1.370295, -0.6237721, 1, 0.04313726, 0, 1,
-2.229278, 1.953493, -0.2460467, 1, 0.04705882, 0, 1,
-2.218356, 1.853867, -0.754878, 1, 0.05490196, 0, 1,
-2.175863, 0.4709435, -0.3457096, 1, 0.05882353, 0, 1,
-2.175208, -0.04546952, -2.537848, 1, 0.06666667, 0, 1,
-2.171979, 0.2779175, -2.695785, 1, 0.07058824, 0, 1,
-2.087104, 0.07134434, -1.171642, 1, 0.07843138, 0, 1,
-2.084457, -0.4487951, -3.404037, 1, 0.08235294, 0, 1,
-2.058172, 0.9300783, -0.6541703, 1, 0.09019608, 0, 1,
-2.056584, -0.1208314, -1.109454, 1, 0.09411765, 0, 1,
-2.055513, 0.9667452, -1.007573, 1, 0.1019608, 0, 1,
-2.050232, 0.06783632, -0.7288432, 1, 0.1098039, 0, 1,
-2.000081, 0.9904449, -1.123468, 1, 0.1137255, 0, 1,
-1.973205, 0.8906862, -1.394164, 1, 0.1215686, 0, 1,
-1.952143, 1.925301, -1.76518, 1, 0.1254902, 0, 1,
-1.944482, 1.841355, 1.213111, 1, 0.1333333, 0, 1,
-1.931333, 0.7434058, -0.1205223, 1, 0.1372549, 0, 1,
-1.914203, 0.3931317, -0.5900514, 1, 0.145098, 0, 1,
-1.900854, 1.256558, -2.322923, 1, 0.1490196, 0, 1,
-1.893775, -0.1732838, -0.7193441, 1, 0.1568628, 0, 1,
-1.892247, -0.04534701, -0.5878053, 1, 0.1607843, 0, 1,
-1.890454, -0.6236273, -0.7958438, 1, 0.1686275, 0, 1,
-1.882833, 2.102748, -0.1290245, 1, 0.172549, 0, 1,
-1.878445, -0.7702673, -2.740683, 1, 0.1803922, 0, 1,
-1.861841, -0.06478626, -0.2365524, 1, 0.1843137, 0, 1,
-1.857237, 1.105138, -3.834882, 1, 0.1921569, 0, 1,
-1.844094, -1.153127, -2.921819, 1, 0.1960784, 0, 1,
-1.826878, 1.435499, -1.881466, 1, 0.2039216, 0, 1,
-1.79978, 1.409706, -0.5526692, 1, 0.2117647, 0, 1,
-1.787234, 1.472459, -1.299447, 1, 0.2156863, 0, 1,
-1.772717, 0.1280061, -2.010674, 1, 0.2235294, 0, 1,
-1.767423, 0.839349, 0.4888979, 1, 0.227451, 0, 1,
-1.749961, 0.1991366, -2.169559, 1, 0.2352941, 0, 1,
-1.741996, 0.2340629, -2.715359, 1, 0.2392157, 0, 1,
-1.734185, 0.9263935, -1.127951, 1, 0.2470588, 0, 1,
-1.731212, -0.1702788, -1.551379, 1, 0.2509804, 0, 1,
-1.705398, 1.025291, -1.927027, 1, 0.2588235, 0, 1,
-1.691095, 0.9915782, -0.8667207, 1, 0.2627451, 0, 1,
-1.689106, 0.887689, -1.845318, 1, 0.2705882, 0, 1,
-1.686419, 0.2050781, -0.3860458, 1, 0.2745098, 0, 1,
-1.674551, 0.01168971, -0.9550073, 1, 0.282353, 0, 1,
-1.673361, 0.2582055, -1.576264, 1, 0.2862745, 0, 1,
-1.66775, -0.3124392, -1.202438, 1, 0.2941177, 0, 1,
-1.658799, 0.3919698, -1.271909, 1, 0.3019608, 0, 1,
-1.655796, 0.9641709, -0.1158768, 1, 0.3058824, 0, 1,
-1.652042, -0.906321, -3.973977, 1, 0.3137255, 0, 1,
-1.64765, 1.513104, -0.959094, 1, 0.3176471, 0, 1,
-1.647213, -1.567202, -0.1999456, 1, 0.3254902, 0, 1,
-1.646702, 0.3336767, -0.2110374, 1, 0.3294118, 0, 1,
-1.615754, -2.062127, -1.778198, 1, 0.3372549, 0, 1,
-1.609042, 0.6282283, -2.230432, 1, 0.3411765, 0, 1,
-1.603333, -3.141176, -5.385435, 1, 0.3490196, 0, 1,
-1.601616, 2.338619, -2.224243, 1, 0.3529412, 0, 1,
-1.594194, 2.159214, 0.6781775, 1, 0.3607843, 0, 1,
-1.565779, -0.494324, -2.173764, 1, 0.3647059, 0, 1,
-1.561282, 0.8141623, -2.209758, 1, 0.372549, 0, 1,
-1.543515, -1.729069, -1.819605, 1, 0.3764706, 0, 1,
-1.540884, 1.686424, -0.5677716, 1, 0.3843137, 0, 1,
-1.532012, 0.02489407, -0.4821295, 1, 0.3882353, 0, 1,
-1.481947, -0.5807287, -2.608248, 1, 0.3960784, 0, 1,
-1.481454, -0.2052707, -2.413481, 1, 0.4039216, 0, 1,
-1.478492, 0.08297986, -0.6036019, 1, 0.4078431, 0, 1,
-1.475738, 0.7655688, -0.3149091, 1, 0.4156863, 0, 1,
-1.471851, 0.1026046, -2.51843, 1, 0.4196078, 0, 1,
-1.471024, 0.2474585, -1.077585, 1, 0.427451, 0, 1,
-1.470917, -0.3007599, -1.263673, 1, 0.4313726, 0, 1,
-1.462637, 2.588207, -0.1680622, 1, 0.4392157, 0, 1,
-1.460612, 0.9305843, -2.040924, 1, 0.4431373, 0, 1,
-1.458477, 0.3691162, -2.051343, 1, 0.4509804, 0, 1,
-1.455795, -1.132524, -2.2824, 1, 0.454902, 0, 1,
-1.453449, 0.6373938, -1.430342, 1, 0.4627451, 0, 1,
-1.444848, 0.100195, -2.130548, 1, 0.4666667, 0, 1,
-1.431958, 0.5432765, -1.36501, 1, 0.4745098, 0, 1,
-1.419611, -0.5444371, -4.913652, 1, 0.4784314, 0, 1,
-1.414808, 0.4692424, 1.191397, 1, 0.4862745, 0, 1,
-1.413359, 0.01127521, -1.19957, 1, 0.4901961, 0, 1,
-1.405928, 0.5131969, -1.864307, 1, 0.4980392, 0, 1,
-1.405636, -1.347689, -0.3841417, 1, 0.5058824, 0, 1,
-1.404522, 0.3098821, -1.924067, 1, 0.509804, 0, 1,
-1.401082, -0.3578056, -1.821354, 1, 0.5176471, 0, 1,
-1.393653, 0.6503632, -0.5531699, 1, 0.5215687, 0, 1,
-1.392657, -1.658458, -1.810706, 1, 0.5294118, 0, 1,
-1.384108, -1.111304, -2.759557, 1, 0.5333334, 0, 1,
-1.383118, 0.1871126, -0.4683657, 1, 0.5411765, 0, 1,
-1.381209, -0.4373985, -1.33117, 1, 0.5450981, 0, 1,
-1.375948, -1.829827, -2.279905, 1, 0.5529412, 0, 1,
-1.373501, 0.6044391, -1.803213, 1, 0.5568628, 0, 1,
-1.339568, 1.312319, -0.3685495, 1, 0.5647059, 0, 1,
-1.33923, -1.4766, -3.894984, 1, 0.5686275, 0, 1,
-1.31821, 0.368829, -2.01818, 1, 0.5764706, 0, 1,
-1.316926, -2.190007, -2.496342, 1, 0.5803922, 0, 1,
-1.312274, -0.6915145, -1.640155, 1, 0.5882353, 0, 1,
-1.309893, 0.652735, -1.500321, 1, 0.5921569, 0, 1,
-1.294328, 0.6116917, -1.738056, 1, 0.6, 0, 1,
-1.284862, 0.1923364, -2.408444, 1, 0.6078432, 0, 1,
-1.281868, -0.2557025, -1.297121, 1, 0.6117647, 0, 1,
-1.275597, 1.317907, -1.198977, 1, 0.6196079, 0, 1,
-1.272148, 1.450483, -0.003312379, 1, 0.6235294, 0, 1,
-1.266062, -0.06363645, -1.369699, 1, 0.6313726, 0, 1,
-1.263098, 0.4692121, -0.8563438, 1, 0.6352941, 0, 1,
-1.253717, 1.390208, -1.92012, 1, 0.6431373, 0, 1,
-1.249615, -0.2746556, -0.5407548, 1, 0.6470588, 0, 1,
-1.247443, 0.266619, -1.072089, 1, 0.654902, 0, 1,
-1.244802, 0.7337206, -1.359489, 1, 0.6588235, 0, 1,
-1.239875, -1.579906, -1.779208, 1, 0.6666667, 0, 1,
-1.236559, 0.7022857, -1.470515, 1, 0.6705883, 0, 1,
-1.232292, 0.2853268, 0.4593676, 1, 0.6784314, 0, 1,
-1.221433, -0.3099223, -1.021575, 1, 0.682353, 0, 1,
-1.210827, -0.5553569, -1.025992, 1, 0.6901961, 0, 1,
-1.208706, 2.08766, -0.2912284, 1, 0.6941177, 0, 1,
-1.186549, -0.1733164, -1.589163, 1, 0.7019608, 0, 1,
-1.185427, -0.5902049, -2.239792, 1, 0.7098039, 0, 1,
-1.182563, -0.5101869, -0.9073443, 1, 0.7137255, 0, 1,
-1.176819, -0.7727788, -1.47276, 1, 0.7215686, 0, 1,
-1.166939, -0.7708977, -0.6359946, 1, 0.7254902, 0, 1,
-1.161406, -0.2575652, -2.634929, 1, 0.7333333, 0, 1,
-1.161171, -0.1997488, -1.475672, 1, 0.7372549, 0, 1,
-1.160336, -0.6039546, -1.526847, 1, 0.7450981, 0, 1,
-1.151981, -1.198324, -2.753057, 1, 0.7490196, 0, 1,
-1.150882, -1.189135, -2.415494, 1, 0.7568628, 0, 1,
-1.148835, -1.293949, -4.097749, 1, 0.7607843, 0, 1,
-1.140881, 0.4144704, 0.4449385, 1, 0.7686275, 0, 1,
-1.140401, 0.2015682, -1.13882, 1, 0.772549, 0, 1,
-1.13925, 0.3171659, -1.389119, 1, 0.7803922, 0, 1,
-1.129842, 0.254743, -0.1853688, 1, 0.7843137, 0, 1,
-1.12786, -0.124601, -2.122984, 1, 0.7921569, 0, 1,
-1.124113, 0.4863266, -0.2164918, 1, 0.7960784, 0, 1,
-1.109872, -0.3932699, -1.859255, 1, 0.8039216, 0, 1,
-1.101411, -1.066524, -1.381431, 1, 0.8117647, 0, 1,
-1.096574, 0.08965921, -2.935515, 1, 0.8156863, 0, 1,
-1.096354, -0.1493923, -1.302345, 1, 0.8235294, 0, 1,
-1.095016, -1.275966, -3.694506, 1, 0.827451, 0, 1,
-1.09011, 0.0901557, -3.194972, 1, 0.8352941, 0, 1,
-1.083256, 1.420596, 0.7669466, 1, 0.8392157, 0, 1,
-1.08068, -1.380855, -1.206433, 1, 0.8470588, 0, 1,
-1.051048, -1.238672, -3.361331, 1, 0.8509804, 0, 1,
-1.044521, -0.254197, -1.256334, 1, 0.8588235, 0, 1,
-1.039516, -0.3263069, -0.1340082, 1, 0.8627451, 0, 1,
-1.022443, -0.3146383, -0.8636236, 1, 0.8705882, 0, 1,
-1.022157, 1.912086, -0.8360661, 1, 0.8745098, 0, 1,
-1.017458, -0.9472445, -3.057913, 1, 0.8823529, 0, 1,
-1.009244, 0.7113158, -2.484044, 1, 0.8862745, 0, 1,
-1.000357, 1.038507, 1.203975, 1, 0.8941177, 0, 1,
-0.9984752, -0.3523882, -2.20594, 1, 0.8980392, 0, 1,
-0.9978071, 0.8983808, -0.9825994, 1, 0.9058824, 0, 1,
-0.9919853, 0.5039707, -0.09276602, 1, 0.9137255, 0, 1,
-0.9826385, -0.8797138, -1.712409, 1, 0.9176471, 0, 1,
-0.9793706, 0.2851706, -2.619668, 1, 0.9254902, 0, 1,
-0.9791303, 1.874808, -1.793303, 1, 0.9294118, 0, 1,
-0.9706265, 0.9111524, -0.8869427, 1, 0.9372549, 0, 1,
-0.9670752, 1.002134, 1.069689, 1, 0.9411765, 0, 1,
-0.966828, -0.4500336, -0.8984144, 1, 0.9490196, 0, 1,
-0.9648348, -1.602606, -2.035548, 1, 0.9529412, 0, 1,
-0.9609969, 0.7647434, -2.561053, 1, 0.9607843, 0, 1,
-0.9585959, -0.5478457, -3.805578, 1, 0.9647059, 0, 1,
-0.9560311, -0.5072591, -1.811588, 1, 0.972549, 0, 1,
-0.9521028, 0.5143372, -0.06672318, 1, 0.9764706, 0, 1,
-0.9510288, -0.08235184, -2.529921, 1, 0.9843137, 0, 1,
-0.9486478, -0.365758, -1.501809, 1, 0.9882353, 0, 1,
-0.9450266, -0.03568135, -0.793366, 1, 0.9960784, 0, 1,
-0.9431233, 0.4280177, 0.7824183, 0.9960784, 1, 0, 1,
-0.9369209, 0.6927056, -0.2498617, 0.9921569, 1, 0, 1,
-0.935675, -1.126945, -3.827923, 0.9843137, 1, 0, 1,
-0.9242224, 0.4690901, -1.649818, 0.9803922, 1, 0, 1,
-0.9240739, 0.6793151, -1.585113, 0.972549, 1, 0, 1,
-0.9075767, -2.011163, -3.429667, 0.9686275, 1, 0, 1,
-0.9031804, -0.4064573, -1.392561, 0.9607843, 1, 0, 1,
-0.9031517, 0.222732, -0.2109059, 0.9568627, 1, 0, 1,
-0.9019665, -1.346499, -3.70809, 0.9490196, 1, 0, 1,
-0.8999816, 1.59813, -1.453466, 0.945098, 1, 0, 1,
-0.8979775, 0.8876467, -0.7367164, 0.9372549, 1, 0, 1,
-0.8926592, -0.7170979, -1.955052, 0.9333333, 1, 0, 1,
-0.8912251, 0.3956489, -3.494718, 0.9254902, 1, 0, 1,
-0.8883229, -0.3473987, -2.564228, 0.9215686, 1, 0, 1,
-0.8858331, 0.3625048, -1.47337, 0.9137255, 1, 0, 1,
-0.8850742, -0.4583389, -2.255572, 0.9098039, 1, 0, 1,
-0.8830652, -0.9950362, -0.2306543, 0.9019608, 1, 0, 1,
-0.878867, -0.3695702, 0.3756855, 0.8941177, 1, 0, 1,
-0.8689009, 1.015975, -2.109259, 0.8901961, 1, 0, 1,
-0.8496922, 0.3888752, -0.9603678, 0.8823529, 1, 0, 1,
-0.8437122, -1.178178, -2.705261, 0.8784314, 1, 0, 1,
-0.841252, -0.8815477, -2.571786, 0.8705882, 1, 0, 1,
-0.8369658, -0.01892329, -2.128793, 0.8666667, 1, 0, 1,
-0.8364656, -1.490562, -3.661491, 0.8588235, 1, 0, 1,
-0.8364374, 1.570779, 0.04559939, 0.854902, 1, 0, 1,
-0.8302431, 2.859326, 2.289553, 0.8470588, 1, 0, 1,
-0.8276342, 1.099514, -0.9350199, 0.8431373, 1, 0, 1,
-0.8240164, -0.06446722, -0.358324, 0.8352941, 1, 0, 1,
-0.8238176, 1.273406, -2.500457, 0.8313726, 1, 0, 1,
-0.8230373, -0.8355, -3.373806, 0.8235294, 1, 0, 1,
-0.8215144, 1.509076, -1.370147, 0.8196079, 1, 0, 1,
-0.8202305, -0.3455516, -1.051983, 0.8117647, 1, 0, 1,
-0.820124, 0.7061561, -0.9794586, 0.8078431, 1, 0, 1,
-0.8161958, 0.008558832, -2.507683, 0.8, 1, 0, 1,
-0.810087, -0.758224, -4.254469, 0.7921569, 1, 0, 1,
-0.805419, 0.3397243, -1.68405, 0.7882353, 1, 0, 1,
-0.8014747, 1.207206, 0.2911471, 0.7803922, 1, 0, 1,
-0.8006763, 0.2987664, -0.9410125, 0.7764706, 1, 0, 1,
-0.799051, -0.08646509, -1.844528, 0.7686275, 1, 0, 1,
-0.7979248, -0.6532452, -3.106414, 0.7647059, 1, 0, 1,
-0.7905856, 1.239649, -2.314344, 0.7568628, 1, 0, 1,
-0.7870739, 0.5868765, -1.274179, 0.7529412, 1, 0, 1,
-0.7799371, -0.1573176, -0.6327806, 0.7450981, 1, 0, 1,
-0.7740406, 0.6091957, 0.5984316, 0.7411765, 1, 0, 1,
-0.7730275, -1.180549, -4.697469, 0.7333333, 1, 0, 1,
-0.7715846, -1.090111, -2.749682, 0.7294118, 1, 0, 1,
-0.7715307, 1.657447, -0.1932671, 0.7215686, 1, 0, 1,
-0.7691132, 1.525009, -1.898565, 0.7176471, 1, 0, 1,
-0.7640435, 0.09960151, -1.519386, 0.7098039, 1, 0, 1,
-0.763299, 1.277329, 2.567819, 0.7058824, 1, 0, 1,
-0.7597317, 0.3567275, 0.1181058, 0.6980392, 1, 0, 1,
-0.7589871, 0.2401967, -1.968415, 0.6901961, 1, 0, 1,
-0.7572878, -2.607553, -4.545428, 0.6862745, 1, 0, 1,
-0.7500298, 0.981735, 2.145911, 0.6784314, 1, 0, 1,
-0.7489973, 1.983617, -0.3874956, 0.6745098, 1, 0, 1,
-0.746195, 1.030842, 0.0354916, 0.6666667, 1, 0, 1,
-0.7461832, 1.472379, -0.8034564, 0.6627451, 1, 0, 1,
-0.7441788, -0.9024702, -2.455716, 0.654902, 1, 0, 1,
-0.7427767, -0.3292137, -2.233719, 0.6509804, 1, 0, 1,
-0.7392545, 0.1998598, -0.7514201, 0.6431373, 1, 0, 1,
-0.7383369, -0.1881663, -2.367409, 0.6392157, 1, 0, 1,
-0.7364519, -2.113695, -2.543261, 0.6313726, 1, 0, 1,
-0.7363632, -0.3858637, -1.776025, 0.627451, 1, 0, 1,
-0.7360535, 1.073509, -0.1073979, 0.6196079, 1, 0, 1,
-0.7334353, -0.7228712, -2.193069, 0.6156863, 1, 0, 1,
-0.7250527, -1.543307, -1.95166, 0.6078432, 1, 0, 1,
-0.7228497, -0.5492208, -1.778447, 0.6039216, 1, 0, 1,
-0.7199082, -0.07036118, -1.302539, 0.5960785, 1, 0, 1,
-0.718627, 1.221379, -1.989575, 0.5882353, 1, 0, 1,
-0.7165457, -1.02947, -0.9271613, 0.5843138, 1, 0, 1,
-0.7129701, -1.016099, -2.171773, 0.5764706, 1, 0, 1,
-0.7120386, 0.2503511, -1.198549, 0.572549, 1, 0, 1,
-0.7054958, 0.03974994, -0.05120418, 0.5647059, 1, 0, 1,
-0.7018834, -0.5335718, -2.731002, 0.5607843, 1, 0, 1,
-0.697253, 1.445763, 0.5387444, 0.5529412, 1, 0, 1,
-0.6882872, -1.945226, -4.279173, 0.5490196, 1, 0, 1,
-0.687324, 0.9625649, 0.5685905, 0.5411765, 1, 0, 1,
-0.6804644, -0.04266192, -2.598004, 0.5372549, 1, 0, 1,
-0.6790831, 0.003346829, -2.093309, 0.5294118, 1, 0, 1,
-0.6781759, 0.7476087, -3.006723, 0.5254902, 1, 0, 1,
-0.6698937, 0.8302793, -1.480281, 0.5176471, 1, 0, 1,
-0.6665772, -1.011763, -3.248395, 0.5137255, 1, 0, 1,
-0.6635588, 1.199417, -1.583781, 0.5058824, 1, 0, 1,
-0.659937, 1.410145, -0.3968931, 0.5019608, 1, 0, 1,
-0.6551777, -0.1626301, -2.605621, 0.4941176, 1, 0, 1,
-0.6500347, -0.1470972, -1.25133, 0.4862745, 1, 0, 1,
-0.642069, 0.4214276, -0.8468112, 0.4823529, 1, 0, 1,
-0.641784, 0.8300951, -2.559292, 0.4745098, 1, 0, 1,
-0.6391852, 1.001259, -2.658195, 0.4705882, 1, 0, 1,
-0.6374826, 1.532032, -0.08874884, 0.4627451, 1, 0, 1,
-0.6352525, 1.730274, 1.223375, 0.4588235, 1, 0, 1,
-0.6331354, 1.002222, 1.362928, 0.4509804, 1, 0, 1,
-0.6319253, -0.2348437, 0.2460674, 0.4470588, 1, 0, 1,
-0.6316856, -2.124612, -3.001724, 0.4392157, 1, 0, 1,
-0.6282176, -1.435609, -2.754181, 0.4352941, 1, 0, 1,
-0.6280401, 0.6570851, -0.9987078, 0.427451, 1, 0, 1,
-0.6264839, 2.047473, 1.596711, 0.4235294, 1, 0, 1,
-0.6192064, -0.5322723, -3.422974, 0.4156863, 1, 0, 1,
-0.6157418, 0.00978898, -0.9874102, 0.4117647, 1, 0, 1,
-0.6156845, -0.5343031, -1.317284, 0.4039216, 1, 0, 1,
-0.6094205, -0.4456891, -2.235123, 0.3960784, 1, 0, 1,
-0.6091141, -0.8343577, -1.762186, 0.3921569, 1, 0, 1,
-0.6059961, -1.43441, 0.7796425, 0.3843137, 1, 0, 1,
-0.5995056, 2.460667, 0.2714525, 0.3803922, 1, 0, 1,
-0.5920804, -1.317151, -3.507608, 0.372549, 1, 0, 1,
-0.5916603, 0.4459476, -0.07916387, 0.3686275, 1, 0, 1,
-0.5908888, 0.4770023, -1.054738, 0.3607843, 1, 0, 1,
-0.5907753, -0.3959085, -2.394289, 0.3568628, 1, 0, 1,
-0.5883353, 0.04715218, -0.3265476, 0.3490196, 1, 0, 1,
-0.5828698, 0.3510166, -1.73807, 0.345098, 1, 0, 1,
-0.5799493, 0.3938627, -2.230174, 0.3372549, 1, 0, 1,
-0.5757216, -2.207659, -3.962868, 0.3333333, 1, 0, 1,
-0.5699528, -1.562538, -1.738265, 0.3254902, 1, 0, 1,
-0.5541493, 0.8677396, 0.3541048, 0.3215686, 1, 0, 1,
-0.5515764, 0.02188242, -1.833664, 0.3137255, 1, 0, 1,
-0.5503442, -0.409897, -3.411138, 0.3098039, 1, 0, 1,
-0.5501372, 0.01235296, -3.049607, 0.3019608, 1, 0, 1,
-0.5453727, 0.4858794, -0.04982302, 0.2941177, 1, 0, 1,
-0.5444799, 0.9641533, -0.777458, 0.2901961, 1, 0, 1,
-0.5420593, -1.218198, -1.326849, 0.282353, 1, 0, 1,
-0.5416526, 0.8599153, -0.2406564, 0.2784314, 1, 0, 1,
-0.5392483, -0.7018728, -2.79077, 0.2705882, 1, 0, 1,
-0.5389715, -1.795351, -4.279543, 0.2666667, 1, 0, 1,
-0.5319983, -0.8658943, -1.539095, 0.2588235, 1, 0, 1,
-0.5315922, 0.8632203, -0.9834765, 0.254902, 1, 0, 1,
-0.530257, -0.2982479, -2.652179, 0.2470588, 1, 0, 1,
-0.5286893, 0.1931843, -1.125925, 0.2431373, 1, 0, 1,
-0.5237896, -0.3756248, -3.310132, 0.2352941, 1, 0, 1,
-0.5213367, -0.8904387, -2.174421, 0.2313726, 1, 0, 1,
-0.520212, 0.3847829, -1.026, 0.2235294, 1, 0, 1,
-0.5171852, 0.3857423, -1.19105, 0.2196078, 1, 0, 1,
-0.5156171, -0.08887079, -0.7691805, 0.2117647, 1, 0, 1,
-0.5134767, 0.08300118, 0.2292818, 0.2078431, 1, 0, 1,
-0.5122672, 0.04589904, -1.779127, 0.2, 1, 0, 1,
-0.5102142, -1.015081, -1.495763, 0.1921569, 1, 0, 1,
-0.5079589, 0.7571424, -1.45329, 0.1882353, 1, 0, 1,
-0.5079418, -2.116571, -2.532426, 0.1803922, 1, 0, 1,
-0.5053548, -1.885722, -2.453371, 0.1764706, 1, 0, 1,
-0.5023975, -1.160696, -3.003742, 0.1686275, 1, 0, 1,
-0.5012136, 1.188816, 0.9448328, 0.1647059, 1, 0, 1,
-0.4947234, -0.1215968, -2.17114, 0.1568628, 1, 0, 1,
-0.4940412, 2.51588, 2.38715, 0.1529412, 1, 0, 1,
-0.4928906, 0.2863887, -2.340328, 0.145098, 1, 0, 1,
-0.4927877, -2.050087, -5.360321, 0.1411765, 1, 0, 1,
-0.487216, 0.1255884, -1.867301, 0.1333333, 1, 0, 1,
-0.486379, -0.3483183, -1.350008, 0.1294118, 1, 0, 1,
-0.4862555, -0.06728311, -3.551877, 0.1215686, 1, 0, 1,
-0.4842806, 0.3464301, -1.260639, 0.1176471, 1, 0, 1,
-0.4804415, -2.242019, -3.304457, 0.1098039, 1, 0, 1,
-0.480151, -0.8173894, -1.279859, 0.1058824, 1, 0, 1,
-0.4782378, 0.5027607, 0.1703204, 0.09803922, 1, 0, 1,
-0.4761159, 0.1414726, -2.80909, 0.09019608, 1, 0, 1,
-0.4743184, -0.6733273, -2.88602, 0.08627451, 1, 0, 1,
-0.4624821, -0.3546658, -1.228264, 0.07843138, 1, 0, 1,
-0.4617268, 0.4389368, -1.973153, 0.07450981, 1, 0, 1,
-0.4569211, -1.707454, -2.878612, 0.06666667, 1, 0, 1,
-0.4557038, 0.6220191, 0.04493849, 0.0627451, 1, 0, 1,
-0.4552192, 0.5823288, -0.4895055, 0.05490196, 1, 0, 1,
-0.4539509, 0.4377089, -1.158213, 0.05098039, 1, 0, 1,
-0.4497484, -0.04455295, -1.175268, 0.04313726, 1, 0, 1,
-0.4473694, -1.474136, -2.906085, 0.03921569, 1, 0, 1,
-0.445127, -0.7120906, -3.240779, 0.03137255, 1, 0, 1,
-0.438693, -1.064369, -4.152878, 0.02745098, 1, 0, 1,
-0.4342726, 1.149818, -0.6720845, 0.01960784, 1, 0, 1,
-0.4338304, 0.9557564, -2.477699, 0.01568628, 1, 0, 1,
-0.4327494, 1.002571, -1.173219, 0.007843138, 1, 0, 1,
-0.431527, 1.072482, -0.8234772, 0.003921569, 1, 0, 1,
-0.4311983, -0.4938715, -1.460624, 0, 1, 0.003921569, 1,
-0.4264764, -1.004175, -4.355127, 0, 1, 0.01176471, 1,
-0.4240295, 1.203298, -1.180872, 0, 1, 0.01568628, 1,
-0.4181553, -0.980745, -2.311774, 0, 1, 0.02352941, 1,
-0.4169949, -0.5571856, -2.350307, 0, 1, 0.02745098, 1,
-0.4165308, -0.2127765, -1.418533, 0, 1, 0.03529412, 1,
-0.4157778, 0.7930707, -1.805315, 0, 1, 0.03921569, 1,
-0.4122761, -0.8994438, -1.675366, 0, 1, 0.04705882, 1,
-0.4120725, -1.211319, 0.5466614, 0, 1, 0.05098039, 1,
-0.4117919, 0.4917574, 0.8579215, 0, 1, 0.05882353, 1,
-0.4115953, 0.3263304, -1.230812, 0, 1, 0.0627451, 1,
-0.4097303, -0.6324441, -2.158007, 0, 1, 0.07058824, 1,
-0.4088416, 0.1673737, -0.494276, 0, 1, 0.07450981, 1,
-0.4030595, -0.04979016, -1.491512, 0, 1, 0.08235294, 1,
-0.3992756, -0.05700338, 0.3737333, 0, 1, 0.08627451, 1,
-0.3991048, -0.7673024, -2.804386, 0, 1, 0.09411765, 1,
-0.3972442, -0.2009538, -3.86176, 0, 1, 0.1019608, 1,
-0.3958421, -0.07964239, -2.080233, 0, 1, 0.1058824, 1,
-0.3944277, 0.6661694, -0.7618181, 0, 1, 0.1137255, 1,
-0.3917723, -1.225849, -3.135589, 0, 1, 0.1176471, 1,
-0.3894872, -0.05223429, -2.257396, 0, 1, 0.1254902, 1,
-0.3885365, 1.063934, -1.920259, 0, 1, 0.1294118, 1,
-0.3797118, 0.7356278, -0.04812975, 0, 1, 0.1372549, 1,
-0.3794254, -1.515015, -4.865844, 0, 1, 0.1411765, 1,
-0.3789201, -0.3248001, -1.739875, 0, 1, 0.1490196, 1,
-0.3759916, -2.672031, -4.00127, 0, 1, 0.1529412, 1,
-0.3759028, -0.08902091, -2.315996, 0, 1, 0.1607843, 1,
-0.3757991, -1.498733, -1.492387, 0, 1, 0.1647059, 1,
-0.3746616, -0.1944574, -1.671541, 0, 1, 0.172549, 1,
-0.3734939, 1.285536, 0.3010463, 0, 1, 0.1764706, 1,
-0.3720775, -0.06686234, -1.800087, 0, 1, 0.1843137, 1,
-0.3706299, 0.5105824, -1.449095, 0, 1, 0.1882353, 1,
-0.3691231, -1.800032, -3.600155, 0, 1, 0.1960784, 1,
-0.3625591, 0.10999, -1.451275, 0, 1, 0.2039216, 1,
-0.3586884, -0.6976996, -2.513381, 0, 1, 0.2078431, 1,
-0.354936, -0.5578467, -1.65963, 0, 1, 0.2156863, 1,
-0.3526334, -0.3540389, -3.026253, 0, 1, 0.2196078, 1,
-0.3516231, -1.164013, -2.723092, 0, 1, 0.227451, 1,
-0.3485395, -1.588617, -2.620729, 0, 1, 0.2313726, 1,
-0.3433544, 0.03055413, -0.7364611, 0, 1, 0.2392157, 1,
-0.3419208, 1.546643, -1.563226, 0, 1, 0.2431373, 1,
-0.3341869, 0.9640927, 1.45155, 0, 1, 0.2509804, 1,
-0.3336293, -0.8938058, -2.532723, 0, 1, 0.254902, 1,
-0.3299321, 1.486597, 0.6282361, 0, 1, 0.2627451, 1,
-0.3267334, 0.6980967, 0.467827, 0, 1, 0.2666667, 1,
-0.325956, -0.1741016, -4.913974, 0, 1, 0.2745098, 1,
-0.3203551, -0.7066606, -2.674035, 0, 1, 0.2784314, 1,
-0.318347, 0.5597545, 0.2377274, 0, 1, 0.2862745, 1,
-0.3144068, 0.9282961, -0.8377214, 0, 1, 0.2901961, 1,
-0.3140916, -0.5625995, -3.530984, 0, 1, 0.2980392, 1,
-0.3122191, 0.2330831, -1.170512, 0, 1, 0.3058824, 1,
-0.3074658, 0.7179552, -0.5488197, 0, 1, 0.3098039, 1,
-0.3057832, -0.2138496, -3.002014, 0, 1, 0.3176471, 1,
-0.3056138, -0.2666323, -1.431505, 0, 1, 0.3215686, 1,
-0.3047183, -0.4360038, -2.467811, 0, 1, 0.3294118, 1,
-0.3031156, -0.02189551, 1.42799, 0, 1, 0.3333333, 1,
-0.3019338, 1.361241, 0.9853663, 0, 1, 0.3411765, 1,
-0.2998967, -0.5399041, -4.13189, 0, 1, 0.345098, 1,
-0.2993425, -0.05829439, -2.082979, 0, 1, 0.3529412, 1,
-0.2868879, 0.1389126, -2.009775, 0, 1, 0.3568628, 1,
-0.2862085, -1.211143, -1.541032, 0, 1, 0.3647059, 1,
-0.2857465, 0.8089892, -1.021956, 0, 1, 0.3686275, 1,
-0.2848401, 1.366078, -0.4498075, 0, 1, 0.3764706, 1,
-0.2840174, 0.439896, 1.840121, 0, 1, 0.3803922, 1,
-0.2836106, -0.4339159, -2.391899, 0, 1, 0.3882353, 1,
-0.281616, 1.611495, -1.300862, 0, 1, 0.3921569, 1,
-0.2791603, -0.4399658, -1.79811, 0, 1, 0.4, 1,
-0.2789825, -0.1184001, -1.205086, 0, 1, 0.4078431, 1,
-0.275708, -0.2541807, -1.620492, 0, 1, 0.4117647, 1,
-0.2750663, 1.746332, 0.4217595, 0, 1, 0.4196078, 1,
-0.2711368, 0.2435499, -0.9406652, 0, 1, 0.4235294, 1,
-0.2698449, 0.734467, -0.7658501, 0, 1, 0.4313726, 1,
-0.2670789, 1.182976, -0.1340795, 0, 1, 0.4352941, 1,
-0.2662013, 0.5652505, 0.1205332, 0, 1, 0.4431373, 1,
-0.2653658, 1.560671, -0.08621877, 0, 1, 0.4470588, 1,
-0.2651216, 0.2610958, -1.086231, 0, 1, 0.454902, 1,
-0.2642354, 0.7446327, 0.1269552, 0, 1, 0.4588235, 1,
-0.263447, 1.027013, 0.3136103, 0, 1, 0.4666667, 1,
-0.2630342, -0.1355653, -3.305785, 0, 1, 0.4705882, 1,
-0.2603049, 0.745003, 0.2896293, 0, 1, 0.4784314, 1,
-0.2595748, -0.04464182, -2.187598, 0, 1, 0.4823529, 1,
-0.2582064, -0.5335827, -3.902457, 0, 1, 0.4901961, 1,
-0.2558346, 0.6573511, -1.297944, 0, 1, 0.4941176, 1,
-0.2558248, 1.573638, -0.3603194, 0, 1, 0.5019608, 1,
-0.2556018, 0.03404898, -0.8892013, 0, 1, 0.509804, 1,
-0.2544513, -0.7002996, -3.310721, 0, 1, 0.5137255, 1,
-0.2510604, -1.924783, -2.755388, 0, 1, 0.5215687, 1,
-0.2500034, -0.9733022, -2.83824, 0, 1, 0.5254902, 1,
-0.2497383, -0.523414, -3.437768, 0, 1, 0.5333334, 1,
-0.2495062, 0.1488029, -0.1592986, 0, 1, 0.5372549, 1,
-0.246801, -0.1251437, -1.608172, 0, 1, 0.5450981, 1,
-0.244789, -0.9036754, -1.897071, 0, 1, 0.5490196, 1,
-0.2388689, 1.390832, -1.219697, 0, 1, 0.5568628, 1,
-0.2385911, 0.495718, 0.1517156, 0, 1, 0.5607843, 1,
-0.237151, 2.280747, -3.277447, 0, 1, 0.5686275, 1,
-0.2360569, 1.436442, 0.4528857, 0, 1, 0.572549, 1,
-0.2359589, -0.5238914, -2.208793, 0, 1, 0.5803922, 1,
-0.2347885, -0.4465638, -1.635361, 0, 1, 0.5843138, 1,
-0.2308248, 0.8410334, 0.1752827, 0, 1, 0.5921569, 1,
-0.2301125, -1.494564, -2.65753, 0, 1, 0.5960785, 1,
-0.2300206, -0.5880609, -2.280644, 0, 1, 0.6039216, 1,
-0.2259341, 3.010236, -0.7580478, 0, 1, 0.6117647, 1,
-0.2230339, -0.3609942, -2.814488, 0, 1, 0.6156863, 1,
-0.2179781, -1.221972, -2.073049, 0, 1, 0.6235294, 1,
-0.2163151, -1.770695, -3.099245, 0, 1, 0.627451, 1,
-0.2158972, -0.03937874, -1.496744, 0, 1, 0.6352941, 1,
-0.2155906, 1.276574, -0.8906786, 0, 1, 0.6392157, 1,
-0.2137486, -0.5487686, -3.236362, 0, 1, 0.6470588, 1,
-0.2104677, 0.411893, -1.165446, 0, 1, 0.6509804, 1,
-0.2097497, -0.6064476, -3.185588, 0, 1, 0.6588235, 1,
-0.2069217, -1.405466, -2.221541, 0, 1, 0.6627451, 1,
-0.2061047, 0.3743547, -1.101005, 0, 1, 0.6705883, 1,
-0.2055098, -0.1809438, -3.613846, 0, 1, 0.6745098, 1,
-0.2037714, -0.6915145, -1.48446, 0, 1, 0.682353, 1,
-0.2018928, -0.2916245, -1.309782, 0, 1, 0.6862745, 1,
-0.2017347, -1.664318, -4.385808, 0, 1, 0.6941177, 1,
-0.1996464, -0.2826293, -1.479559, 0, 1, 0.7019608, 1,
-0.1982486, 1.008212, -0.4358912, 0, 1, 0.7058824, 1,
-0.1972927, -1.764907, -3.385995, 0, 1, 0.7137255, 1,
-0.1962096, -0.1161593, -0.6376633, 0, 1, 0.7176471, 1,
-0.1955742, 0.2461034, -1.003505, 0, 1, 0.7254902, 1,
-0.1929455, 0.3584765, 1.274476, 0, 1, 0.7294118, 1,
-0.191974, -1.936537, -2.028827, 0, 1, 0.7372549, 1,
-0.1853654, 0.6262079, 0.9887109, 0, 1, 0.7411765, 1,
-0.1849875, -2.399452, -3.349881, 0, 1, 0.7490196, 1,
-0.184533, -0.6973346, -3.973955, 0, 1, 0.7529412, 1,
-0.1830897, 0.03986029, -0.9172426, 0, 1, 0.7607843, 1,
-0.1819384, -1.150976, -1.496763, 0, 1, 0.7647059, 1,
-0.1800022, -2.089034, -1.578338, 0, 1, 0.772549, 1,
-0.1794651, 0.1132981, -1.432347, 0, 1, 0.7764706, 1,
-0.1770011, 1.37971, 0.0211743, 0, 1, 0.7843137, 1,
-0.1760782, 0.1046184, 0.5550873, 0, 1, 0.7882353, 1,
-0.1756564, -1.691502, -4.118032, 0, 1, 0.7960784, 1,
-0.1717755, 0.3335258, 0.06262701, 0, 1, 0.8039216, 1,
-0.16823, -0.354852, -2.744234, 0, 1, 0.8078431, 1,
-0.1610924, -0.3232658, -4.062543, 0, 1, 0.8156863, 1,
-0.1544676, -0.5370446, -2.59878, 0, 1, 0.8196079, 1,
-0.1538907, 0.7883576, -2.299858, 0, 1, 0.827451, 1,
-0.1525604, 0.7760402, 1.169075, 0, 1, 0.8313726, 1,
-0.1515813, -1.308079, -2.21051, 0, 1, 0.8392157, 1,
-0.1500878, 0.8162302, 0.01192752, 0, 1, 0.8431373, 1,
-0.1479435, -0.4072897, -1.990364, 0, 1, 0.8509804, 1,
-0.135342, -0.7127898, -2.666356, 0, 1, 0.854902, 1,
-0.1351982, 0.5428233, -1.53022, 0, 1, 0.8627451, 1,
-0.1210009, -1.116185, -4.522193, 0, 1, 0.8666667, 1,
-0.1209007, -0.8104798, -4.584707, 0, 1, 0.8745098, 1,
-0.1200824, 1.943544, 1.336781, 0, 1, 0.8784314, 1,
-0.1120303, -1.362074, -3.290629, 0, 1, 0.8862745, 1,
-0.1110995, -0.1838717, -3.263999, 0, 1, 0.8901961, 1,
-0.1102248, 2.045086, -0.7499359, 0, 1, 0.8980392, 1,
-0.1075767, 0.5755929, -0.8559518, 0, 1, 0.9058824, 1,
-0.1063727, 1.377438, -1.15871, 0, 1, 0.9098039, 1,
-0.1057585, -0.3498064, -5.361017, 0, 1, 0.9176471, 1,
-0.09194814, -0.6010435, -3.295372, 0, 1, 0.9215686, 1,
-0.09128907, 0.09426443, 0.01459209, 0, 1, 0.9294118, 1,
-0.09017944, 0.5798093, -0.4774266, 0, 1, 0.9333333, 1,
-0.08860365, -2.280679, -2.985569, 0, 1, 0.9411765, 1,
-0.07964993, -1.829706, -3.007657, 0, 1, 0.945098, 1,
-0.07913694, -0.6775017, -2.83888, 0, 1, 0.9529412, 1,
-0.07770912, 0.495081, 0.6209764, 0, 1, 0.9568627, 1,
-0.07430467, 0.2139774, -2.265976, 0, 1, 0.9647059, 1,
-0.07317694, 0.5209094, -0.8428999, 0, 1, 0.9686275, 1,
-0.07315329, 0.7710196, -0.3086448, 0, 1, 0.9764706, 1,
-0.07169855, 0.1131327, 0.9033042, 0, 1, 0.9803922, 1,
-0.07002421, 0.5573479, 0.08524817, 0, 1, 0.9882353, 1,
-0.06989077, 0.2023599, -1.140768, 0, 1, 0.9921569, 1,
-0.06608897, -0.9872921, -2.30253, 0, 1, 1, 1,
-0.06566735, -0.374241, -2.192362, 0, 0.9921569, 1, 1,
-0.06094456, 0.8408608, -0.9246449, 0, 0.9882353, 1, 1,
-0.06054853, -0.7642521, -1.915056, 0, 0.9803922, 1, 1,
-0.05976677, 0.2465957, 2.33031, 0, 0.9764706, 1, 1,
-0.05920588, -0.6149151, -3.087493, 0, 0.9686275, 1, 1,
-0.05715283, 0.4072459, -0.04984161, 0, 0.9647059, 1, 1,
-0.05384709, 1.333368, 1.495525, 0, 0.9568627, 1, 1,
-0.05361777, 1.298271, -0.5723101, 0, 0.9529412, 1, 1,
-0.05360806, 1.468321, -0.2556129, 0, 0.945098, 1, 1,
-0.05337087, 1.028606, 0.87841, 0, 0.9411765, 1, 1,
-0.04994081, -1.05573, -3.723003, 0, 0.9333333, 1, 1,
-0.04913344, 1.295743, -0.9311965, 0, 0.9294118, 1, 1,
-0.04159242, 2.565491, -1.083618, 0, 0.9215686, 1, 1,
-0.0410691, 0.225588, -1.227914, 0, 0.9176471, 1, 1,
-0.03976145, 0.2169259, -0.6726806, 0, 0.9098039, 1, 1,
-0.03973851, 0.5051874, -0.7266888, 0, 0.9058824, 1, 1,
-0.03880209, 0.644043, -0.9092723, 0, 0.8980392, 1, 1,
-0.0380547, -0.6422734, -2.114691, 0, 0.8901961, 1, 1,
-0.03469222, 0.745771, 0.8263514, 0, 0.8862745, 1, 1,
-0.03028447, -1.163238, -0.6122671, 0, 0.8784314, 1, 1,
-0.02818395, -0.424266, -2.580927, 0, 0.8745098, 1, 1,
-0.02713992, 2.100032, -0.8786004, 0, 0.8666667, 1, 1,
-0.02455324, 1.059772, -1.146174, 0, 0.8627451, 1, 1,
-0.02258556, -0.2411166, -2.194243, 0, 0.854902, 1, 1,
-0.009926819, 1.537951, -0.9904252, 0, 0.8509804, 1, 1,
-0.009144772, 0.5915588, -0.01392719, 0, 0.8431373, 1, 1,
-0.006223013, 0.3936705, 0.6434529, 0, 0.8392157, 1, 1,
-0.001722864, -2.829213, -2.835443, 0, 0.8313726, 1, 1,
-0.0002908078, 1.012427, -0.4929748, 0, 0.827451, 1, 1,
0.001312036, 0.8868035, 0.6354705, 0, 0.8196079, 1, 1,
0.007292719, -0.3463358, 3.342084, 0, 0.8156863, 1, 1,
0.01268997, -0.7238503, 2.208244, 0, 0.8078431, 1, 1,
0.01304459, 0.1697571, 1.874787, 0, 0.8039216, 1, 1,
0.0161207, -0.4634652, 2.874971, 0, 0.7960784, 1, 1,
0.01742432, -1.140113, 3.903451, 0, 0.7882353, 1, 1,
0.01754403, -1.194824, 1.678106, 0, 0.7843137, 1, 1,
0.0188688, -0.6275372, 3.532745, 0, 0.7764706, 1, 1,
0.01966963, -0.9066051, 2.359898, 0, 0.772549, 1, 1,
0.01971573, 0.9198489, -0.3382874, 0, 0.7647059, 1, 1,
0.02312966, 0.3440882, -1.910877, 0, 0.7607843, 1, 1,
0.02327402, 0.1836139, -0.8048791, 0, 0.7529412, 1, 1,
0.02509985, -0.7207386, 0.9344888, 0, 0.7490196, 1, 1,
0.03021057, -0.1419885, 1.455058, 0, 0.7411765, 1, 1,
0.03416337, 0.6135064, 1.758675, 0, 0.7372549, 1, 1,
0.03843688, -0.005321903, 1.741013, 0, 0.7294118, 1, 1,
0.04304878, -0.2774196, 3.451872, 0, 0.7254902, 1, 1,
0.04375985, 0.4307918, 0.6393396, 0, 0.7176471, 1, 1,
0.04393141, 0.9683238, -1.388952, 0, 0.7137255, 1, 1,
0.04481414, -0.4553233, 3.574573, 0, 0.7058824, 1, 1,
0.04484995, 0.1254945, -0.8381811, 0, 0.6980392, 1, 1,
0.04599549, -0.6751899, 3.732409, 0, 0.6941177, 1, 1,
0.04787205, 0.8955895, 0.2423272, 0, 0.6862745, 1, 1,
0.05030355, 0.3797019, 0.7953236, 0, 0.682353, 1, 1,
0.05717368, 0.88963, 0.2582681, 0, 0.6745098, 1, 1,
0.05857752, 0.1304967, 0.4271997, 0, 0.6705883, 1, 1,
0.06025431, 0.9467373, -0.1632364, 0, 0.6627451, 1, 1,
0.06367941, 0.1583722, 1.278747, 0, 0.6588235, 1, 1,
0.06631805, -0.7697418, 4.823581, 0, 0.6509804, 1, 1,
0.06639634, 0.3518133, 0.4130186, 0, 0.6470588, 1, 1,
0.07330316, -1.283351, 2.997831, 0, 0.6392157, 1, 1,
0.07952717, 1.665193, 0.1013376, 0, 0.6352941, 1, 1,
0.08166236, 0.8466007, 0.5939858, 0, 0.627451, 1, 1,
0.08468148, -0.3963199, 0.9994439, 0, 0.6235294, 1, 1,
0.08567104, 0.3702176, 0.6011279, 0, 0.6156863, 1, 1,
0.1032782, 0.4844056, -0.3972963, 0, 0.6117647, 1, 1,
0.1052673, -0.225856, 0.9023902, 0, 0.6039216, 1, 1,
0.1114039, -0.8149486, 3.334326, 0, 0.5960785, 1, 1,
0.1138669, 0.6156713, -1.631274, 0, 0.5921569, 1, 1,
0.1162439, -0.4723663, 1.585622, 0, 0.5843138, 1, 1,
0.1163912, 0.6033829, 1.470696, 0, 0.5803922, 1, 1,
0.1167338, 0.621055, -1.422738, 0, 0.572549, 1, 1,
0.1200284, -0.8974448, 2.439617, 0, 0.5686275, 1, 1,
0.1222249, -1.370557, 2.823436, 0, 0.5607843, 1, 1,
0.1246153, 0.1472024, 1.209922, 0, 0.5568628, 1, 1,
0.1250972, 1.327617, 0.1288189, 0, 0.5490196, 1, 1,
0.1284382, 0.4537464, 0.3595408, 0, 0.5450981, 1, 1,
0.1323455, 1.116651, 0.220381, 0, 0.5372549, 1, 1,
0.1354385, 0.003003674, 2.070593, 0, 0.5333334, 1, 1,
0.1394944, -1.131489, 3.087902, 0, 0.5254902, 1, 1,
0.1412316, -0.262081, 3.906087, 0, 0.5215687, 1, 1,
0.1435833, 0.7725482, -0.1257236, 0, 0.5137255, 1, 1,
0.1454718, -0.9816414, 2.614085, 0, 0.509804, 1, 1,
0.1474447, -0.1887503, 3.795418, 0, 0.5019608, 1, 1,
0.1512523, -0.668504, 3.13552, 0, 0.4941176, 1, 1,
0.1537567, 0.9116553, 0.1456216, 0, 0.4901961, 1, 1,
0.1549559, 0.5071114, 0.467275, 0, 0.4823529, 1, 1,
0.1561862, -1.089422, 4.268431, 0, 0.4784314, 1, 1,
0.1613305, 0.108782, 0.6140079, 0, 0.4705882, 1, 1,
0.1619722, 0.642673, 0.9275334, 0, 0.4666667, 1, 1,
0.1695748, -0.2709742, 1.735592, 0, 0.4588235, 1, 1,
0.1701385, 0.4575169, -0.2796005, 0, 0.454902, 1, 1,
0.1724819, -1.191168, 2.675793, 0, 0.4470588, 1, 1,
0.1783907, 0.577406, 1.446548, 0, 0.4431373, 1, 1,
0.1790135, 0.08873598, -0.2575491, 0, 0.4352941, 1, 1,
0.1792381, 0.4645003, 0.9487805, 0, 0.4313726, 1, 1,
0.1813856, -0.9147476, 3.461164, 0, 0.4235294, 1, 1,
0.1835547, -1.261188, 3.332758, 0, 0.4196078, 1, 1,
0.1871396, 0.9120697, -0.2279803, 0, 0.4117647, 1, 1,
0.1874316, 1.272263, 0.9141209, 0, 0.4078431, 1, 1,
0.1917033, -2.382704, 2.163604, 0, 0.4, 1, 1,
0.1951984, 0.05324424, 2.413814, 0, 0.3921569, 1, 1,
0.1974277, 1.121105, 1.074515, 0, 0.3882353, 1, 1,
0.2046485, -0.2716789, 1.706117, 0, 0.3803922, 1, 1,
0.2054422, -0.4657045, 5.175166, 0, 0.3764706, 1, 1,
0.2086751, -0.3739524, 3.080745, 0, 0.3686275, 1, 1,
0.2151856, 0.2925727, 0.7343557, 0, 0.3647059, 1, 1,
0.2153997, -0.8820071, 5.009847, 0, 0.3568628, 1, 1,
0.2154407, 0.01244385, 0.5265774, 0, 0.3529412, 1, 1,
0.2156853, 1.509436, 0.8157475, 0, 0.345098, 1, 1,
0.2168606, -0.8731757, 1.57362, 0, 0.3411765, 1, 1,
0.2182744, 0.5469009, -0.06602018, 0, 0.3333333, 1, 1,
0.223571, 1.043022, 0.4502164, 0, 0.3294118, 1, 1,
0.2247609, -0.6018184, 4.376957, 0, 0.3215686, 1, 1,
0.2266165, -1.438279, 4.387837, 0, 0.3176471, 1, 1,
0.2279533, -0.3237116, 3.371183, 0, 0.3098039, 1, 1,
0.2287925, -0.7101852, 2.274846, 0, 0.3058824, 1, 1,
0.2310051, -1.025721, 2.003288, 0, 0.2980392, 1, 1,
0.2310104, -0.3640791, 2.676827, 0, 0.2901961, 1, 1,
0.2325083, 0.4243675, 1.118833, 0, 0.2862745, 1, 1,
0.2425551, -0.6920804, 0.5981429, 0, 0.2784314, 1, 1,
0.2480669, -1.66657, 0.2213269, 0, 0.2745098, 1, 1,
0.2498132, -0.4532807, 1.470971, 0, 0.2666667, 1, 1,
0.2498636, 0.4274624, -0.9034757, 0, 0.2627451, 1, 1,
0.2507931, -0.174071, 3.458622, 0, 0.254902, 1, 1,
0.2558644, -0.2687717, 3.085385, 0, 0.2509804, 1, 1,
0.2588466, 0.2659557, -1.68916, 0, 0.2431373, 1, 1,
0.2597154, 0.5562156, 0.3119864, 0, 0.2392157, 1, 1,
0.2603388, 0.2821147, 0.9826703, 0, 0.2313726, 1, 1,
0.2629422, -0.1672336, 1.772232, 0, 0.227451, 1, 1,
0.2632796, -0.1866531, 2.595676, 0, 0.2196078, 1, 1,
0.2638415, -1.585207, 1.810368, 0, 0.2156863, 1, 1,
0.2649379, -0.2243397, 1.818053, 0, 0.2078431, 1, 1,
0.2712207, -0.9157092, 2.062558, 0, 0.2039216, 1, 1,
0.271567, 0.9813526, -0.3538011, 0, 0.1960784, 1, 1,
0.2820866, -0.4135253, 1.466942, 0, 0.1882353, 1, 1,
0.2822185, -0.9414946, 4.507315, 0, 0.1843137, 1, 1,
0.2836331, -0.4970497, 2.428225, 0, 0.1764706, 1, 1,
0.2858426, 0.7545099, -0.5380206, 0, 0.172549, 1, 1,
0.2914931, -1.133366, 2.822997, 0, 0.1647059, 1, 1,
0.2921798, -0.0733395, 1.662484, 0, 0.1607843, 1, 1,
0.3023364, -0.01764291, 0.1365691, 0, 0.1529412, 1, 1,
0.3025615, 1.479115, -0.9335831, 0, 0.1490196, 1, 1,
0.3053299, -0.673763, 1.471125, 0, 0.1411765, 1, 1,
0.308834, 1.128929, -0.6038481, 0, 0.1372549, 1, 1,
0.3104011, -0.3948713, 1.746662, 0, 0.1294118, 1, 1,
0.3126858, -1.605404, 2.553863, 0, 0.1254902, 1, 1,
0.314364, 0.05033324, 1.888569, 0, 0.1176471, 1, 1,
0.3146174, -0.9961424, 2.252842, 0, 0.1137255, 1, 1,
0.3177995, 0.8507129, 0.1605594, 0, 0.1058824, 1, 1,
0.318175, -0.2812835, 1.385136, 0, 0.09803922, 1, 1,
0.318932, 0.6932079, 2.378341, 0, 0.09411765, 1, 1,
0.3196459, 1.244593, 1.540683, 0, 0.08627451, 1, 1,
0.3214784, -1.352325, 0.6316511, 0, 0.08235294, 1, 1,
0.3218855, 0.04863439, 2.634708, 0, 0.07450981, 1, 1,
0.3232995, 0.1226689, 1.966177, 0, 0.07058824, 1, 1,
0.3244038, -0.7121745, 2.974044, 0, 0.0627451, 1, 1,
0.3316419, 0.08391024, 1.805515, 0, 0.05882353, 1, 1,
0.3345252, 1.023343, 1.555168, 0, 0.05098039, 1, 1,
0.3361644, -1.015169, 5.434415, 0, 0.04705882, 1, 1,
0.3362167, 1.267781, 0.754383, 0, 0.03921569, 1, 1,
0.3372479, -0.9235603, 0.3871954, 0, 0.03529412, 1, 1,
0.3406111, 2.817163, 0.5149516, 0, 0.02745098, 1, 1,
0.3418149, -0.1982381, 2.308898, 0, 0.02352941, 1, 1,
0.3421783, 1.283667, 1.364607, 0, 0.01568628, 1, 1,
0.3447885, -0.3155363, 1.797903, 0, 0.01176471, 1, 1,
0.3455215, -0.09668931, 2.083888, 0, 0.003921569, 1, 1,
0.3489158, -0.3267672, 0.5318315, 0.003921569, 0, 1, 1,
0.3515856, -0.5850761, 2.622341, 0.007843138, 0, 1, 1,
0.3530042, -0.06608486, 2.602977, 0.01568628, 0, 1, 1,
0.3535862, -0.6455383, 4.154677, 0.01960784, 0, 1, 1,
0.3538142, 0.3793411, 1.859929, 0.02745098, 0, 1, 1,
0.3574374, -0.3133909, 3.546652, 0.03137255, 0, 1, 1,
0.3588742, -0.8838003, 2.777741, 0.03921569, 0, 1, 1,
0.3593555, 0.001378424, 1.440497, 0.04313726, 0, 1, 1,
0.362018, -0.6133295, 5.137441, 0.05098039, 0, 1, 1,
0.3623509, 1.450783, -0.2475083, 0.05490196, 0, 1, 1,
0.3699622, 0.8249999, 1.354749, 0.0627451, 0, 1, 1,
0.3699762, 1.607792, -0.1509582, 0.06666667, 0, 1, 1,
0.3711395, -0.8432389, 5.498608, 0.07450981, 0, 1, 1,
0.3716963, 0.2040068, 0.6279455, 0.07843138, 0, 1, 1,
0.37256, -1.305251, 3.148818, 0.08627451, 0, 1, 1,
0.3752263, 0.401215, 0.199566, 0.09019608, 0, 1, 1,
0.3786073, -0.402714, 2.221151, 0.09803922, 0, 1, 1,
0.3798577, 0.6459444, 1.725038, 0.1058824, 0, 1, 1,
0.3813851, 0.5554851, 1.02185, 0.1098039, 0, 1, 1,
0.3826631, 0.7696917, 0.0625158, 0.1176471, 0, 1, 1,
0.386919, -0.3229332, 2.024643, 0.1215686, 0, 1, 1,
0.3899121, 1.858378, 0.6001301, 0.1294118, 0, 1, 1,
0.39252, 0.5824018, 0.7182922, 0.1333333, 0, 1, 1,
0.3927701, -0.5081858, 3.737146, 0.1411765, 0, 1, 1,
0.3938321, -0.7985655, 3.862219, 0.145098, 0, 1, 1,
0.3959044, 0.2027299, 1.41225, 0.1529412, 0, 1, 1,
0.4008004, -1.967741, 2.632626, 0.1568628, 0, 1, 1,
0.4023142, -0.4767895, 1.89172, 0.1647059, 0, 1, 1,
0.4026285, 1.805431, -0.6486275, 0.1686275, 0, 1, 1,
0.4034211, 2.023719, 0.6888093, 0.1764706, 0, 1, 1,
0.4042809, -0.5413895, 1.342518, 0.1803922, 0, 1, 1,
0.405032, -1.175156, 3.627682, 0.1882353, 0, 1, 1,
0.4060491, 0.7171844, -0.5729794, 0.1921569, 0, 1, 1,
0.4075995, -0.8964767, 4.6835, 0.2, 0, 1, 1,
0.4097309, -0.4271523, 2.31191, 0.2078431, 0, 1, 1,
0.4126627, 0.2667216, 0.6474163, 0.2117647, 0, 1, 1,
0.4157878, 0.6671154, -0.02098259, 0.2196078, 0, 1, 1,
0.4275739, -0.05914201, 2.403043, 0.2235294, 0, 1, 1,
0.4289237, -0.2805097, 1.680415, 0.2313726, 0, 1, 1,
0.4317867, 0.5141671, 1.473034, 0.2352941, 0, 1, 1,
0.4330052, -1.059281, 2.762188, 0.2431373, 0, 1, 1,
0.4373876, -0.4569835, 4.201706, 0.2470588, 0, 1, 1,
0.4389701, 1.095009, 0.09529133, 0.254902, 0, 1, 1,
0.4394732, -0.8926217, 3.124802, 0.2588235, 0, 1, 1,
0.4449181, -0.3911926, 2.554764, 0.2666667, 0, 1, 1,
0.4452365, 0.8278146, 2.644064, 0.2705882, 0, 1, 1,
0.447128, -1.019396, 2.963295, 0.2784314, 0, 1, 1,
0.4476743, -0.08863966, 1.943154, 0.282353, 0, 1, 1,
0.4481433, 0.2623762, 1.890352, 0.2901961, 0, 1, 1,
0.450627, 0.2633672, 1.872228, 0.2941177, 0, 1, 1,
0.4507354, -0.06711161, 1.158603, 0.3019608, 0, 1, 1,
0.4513135, -1.273986, 3.008848, 0.3098039, 0, 1, 1,
0.4519564, -0.225077, 0.8847353, 0.3137255, 0, 1, 1,
0.4525718, 0.2475501, 1.618694, 0.3215686, 0, 1, 1,
0.4528349, 0.4128318, 0.4609258, 0.3254902, 0, 1, 1,
0.457146, -1.127268, 2.457861, 0.3333333, 0, 1, 1,
0.4602437, -1.043039, 2.329349, 0.3372549, 0, 1, 1,
0.4636691, 1.604105, 1.487578, 0.345098, 0, 1, 1,
0.464909, 1.13767, 1.023802, 0.3490196, 0, 1, 1,
0.4671243, -0.3401201, 2.515922, 0.3568628, 0, 1, 1,
0.4696169, 1.182765, -1.78268, 0.3607843, 0, 1, 1,
0.4713229, -1.83629, 3.442759, 0.3686275, 0, 1, 1,
0.4742187, -0.06069795, 3.594847, 0.372549, 0, 1, 1,
0.475431, -0.1298904, 1.429253, 0.3803922, 0, 1, 1,
0.4770235, 0.07132852, 1.229152, 0.3843137, 0, 1, 1,
0.4829939, 0.4385221, 0.4105995, 0.3921569, 0, 1, 1,
0.4837044, 0.9435022, 0.5942783, 0.3960784, 0, 1, 1,
0.4837506, 0.5823081, 1.844534, 0.4039216, 0, 1, 1,
0.4841782, -1.103293, 2.915779, 0.4117647, 0, 1, 1,
0.4879867, -0.08660691, 2.202263, 0.4156863, 0, 1, 1,
0.4885819, 2.050888, 1.873081, 0.4235294, 0, 1, 1,
0.4906684, 0.5337983, 1.110338, 0.427451, 0, 1, 1,
0.4929775, 0.6721697, -0.6137635, 0.4352941, 0, 1, 1,
0.4934246, 0.864997, 0.760918, 0.4392157, 0, 1, 1,
0.5090001, 1.544553, 0.4755416, 0.4470588, 0, 1, 1,
0.5102051, 0.1866789, 1.307361, 0.4509804, 0, 1, 1,
0.5118076, 1.672077, 0.7514037, 0.4588235, 0, 1, 1,
0.5186543, -0.04756624, 2.006381, 0.4627451, 0, 1, 1,
0.5199975, -1.654692, 2.324143, 0.4705882, 0, 1, 1,
0.5218664, 1.466384, 0.5948244, 0.4745098, 0, 1, 1,
0.5238516, 1.910704, 1.44807, 0.4823529, 0, 1, 1,
0.5240057, 0.08301152, 1.371709, 0.4862745, 0, 1, 1,
0.52894, -1.286447, 2.600616, 0.4941176, 0, 1, 1,
0.5317203, -1.546604, 3.510735, 0.5019608, 0, 1, 1,
0.5322753, 0.4336534, 0.5265368, 0.5058824, 0, 1, 1,
0.532392, 1.018835, 0.3089069, 0.5137255, 0, 1, 1,
0.5382406, -0.6034234, 2.748269, 0.5176471, 0, 1, 1,
0.5383706, -1.297318, 2.412586, 0.5254902, 0, 1, 1,
0.5490751, -2.297749, 4.598704, 0.5294118, 0, 1, 1,
0.55045, -1.172096, 2.591759, 0.5372549, 0, 1, 1,
0.5530081, -0.5705308, 0.4414478, 0.5411765, 0, 1, 1,
0.5589499, 2.06862, 1.426064, 0.5490196, 0, 1, 1,
0.561292, 1.442248, 0.6212851, 0.5529412, 0, 1, 1,
0.5645601, 0.9017105, -0.5701729, 0.5607843, 0, 1, 1,
0.5647507, -0.9398287, 2.932889, 0.5647059, 0, 1, 1,
0.57012, 1.501947, -0.6514869, 0.572549, 0, 1, 1,
0.5710409, -2.159561, 2.016373, 0.5764706, 0, 1, 1,
0.578609, -1.368716, 3.690428, 0.5843138, 0, 1, 1,
0.5804728, 0.5026082, -0.02824714, 0.5882353, 0, 1, 1,
0.5834132, 0.7825675, 2.142335, 0.5960785, 0, 1, 1,
0.588883, 0.507651, 0.3192558, 0.6039216, 0, 1, 1,
0.5975733, -0.4711162, 4.257539, 0.6078432, 0, 1, 1,
0.6012738, 0.5151942, -0.527177, 0.6156863, 0, 1, 1,
0.6023223, 0.09333036, -0.09915278, 0.6196079, 0, 1, 1,
0.6035146, -1.691332, 2.246767, 0.627451, 0, 1, 1,
0.6046305, -0.4461505, 1.614895, 0.6313726, 0, 1, 1,
0.6069347, 0.3683046, 2.554454, 0.6392157, 0, 1, 1,
0.6071492, -0.2921758, 0.1482845, 0.6431373, 0, 1, 1,
0.6088271, -0.1591828, 0.5280548, 0.6509804, 0, 1, 1,
0.6118895, -0.2280357, 4.094035, 0.654902, 0, 1, 1,
0.6120195, -0.6100687, 1.914332, 0.6627451, 0, 1, 1,
0.6135337, 1.255376, -0.4873194, 0.6666667, 0, 1, 1,
0.6151779, -0.02152571, 2.333105, 0.6745098, 0, 1, 1,
0.620951, -0.7436211, 1.751907, 0.6784314, 0, 1, 1,
0.6214476, 0.1411948, 0.4939608, 0.6862745, 0, 1, 1,
0.6434601, -0.3726738, 3.212214, 0.6901961, 0, 1, 1,
0.6504276, 0.6369575, 0.2669214, 0.6980392, 0, 1, 1,
0.6530883, -0.7116257, 2.90749, 0.7058824, 0, 1, 1,
0.6537831, 1.071208, 0.5271, 0.7098039, 0, 1, 1,
0.6570899, -0.444881, 3.216893, 0.7176471, 0, 1, 1,
0.6580663, 0.4652165, -0.9300891, 0.7215686, 0, 1, 1,
0.6616073, 0.981528, 0.1631474, 0.7294118, 0, 1, 1,
0.6621585, 1.80382, -0.1758574, 0.7333333, 0, 1, 1,
0.6689223, 0.8025025, -0.1235714, 0.7411765, 0, 1, 1,
0.6710296, -0.777131, 4.379572, 0.7450981, 0, 1, 1,
0.6756577, 0.4525252, 0.4416747, 0.7529412, 0, 1, 1,
0.6800742, -0.3268993, 1.592417, 0.7568628, 0, 1, 1,
0.6811932, -0.5635712, 2.32179, 0.7647059, 0, 1, 1,
0.6853228, -1.383953, 0.9643552, 0.7686275, 0, 1, 1,
0.6873845, 1.78338, -0.3064734, 0.7764706, 0, 1, 1,
0.6883654, 1.126526, 1.360317, 0.7803922, 0, 1, 1,
0.6917506, 0.01373678, 1.954953, 0.7882353, 0, 1, 1,
0.6964858, -0.828142, 1.990898, 0.7921569, 0, 1, 1,
0.6982133, 0.4082262, 1.769249, 0.8, 0, 1, 1,
0.7016926, -1.887333, 2.345087, 0.8078431, 0, 1, 1,
0.7106044, 0.4298613, 0.7136896, 0.8117647, 0, 1, 1,
0.7108552, -0.3469829, 1.260405, 0.8196079, 0, 1, 1,
0.7163258, -0.5203602, 0.9960288, 0.8235294, 0, 1, 1,
0.7165124, -1.259683, 1.946397, 0.8313726, 0, 1, 1,
0.7212868, 2.1717, 0.6190606, 0.8352941, 0, 1, 1,
0.7247608, 0.2696573, 1.192186, 0.8431373, 0, 1, 1,
0.7259446, 0.5329822, 1.037682, 0.8470588, 0, 1, 1,
0.7289963, 1.53452, 1.867029, 0.854902, 0, 1, 1,
0.7335538, -0.01351596, 2.517366, 0.8588235, 0, 1, 1,
0.7372047, -0.6499316, 0.6520585, 0.8666667, 0, 1, 1,
0.7436153, -1.173797, 1.69071, 0.8705882, 0, 1, 1,
0.7455583, 1.344408, 0.480227, 0.8784314, 0, 1, 1,
0.7572818, -0.9150938, 2.3265, 0.8823529, 0, 1, 1,
0.7587934, 0.6788739, 1.568867, 0.8901961, 0, 1, 1,
0.7622423, 1.305533, 1.962411, 0.8941177, 0, 1, 1,
0.7654064, 1.732938, -0.8971323, 0.9019608, 0, 1, 1,
0.7735124, 1.458099, -0.2335055, 0.9098039, 0, 1, 1,
0.7740547, -0.1974484, 1.918459, 0.9137255, 0, 1, 1,
0.7744129, -0.3192768, 2.486192, 0.9215686, 0, 1, 1,
0.7758453, -0.1461854, 4.03391, 0.9254902, 0, 1, 1,
0.777063, -1.164491, 0.7260913, 0.9333333, 0, 1, 1,
0.7773288, -0.9192449, 1.31707, 0.9372549, 0, 1, 1,
0.7905886, 0.5043933, 3.006805, 0.945098, 0, 1, 1,
0.7918134, 0.8423958, 0.9789543, 0.9490196, 0, 1, 1,
0.7940919, 0.03460954, 2.157937, 0.9568627, 0, 1, 1,
0.8070539, 1.097951, -1.060874, 0.9607843, 0, 1, 1,
0.8089136, -0.4766882, 1.836278, 0.9686275, 0, 1, 1,
0.81676, -0.952545, 3.254927, 0.972549, 0, 1, 1,
0.8190809, -0.3001817, 2.414652, 0.9803922, 0, 1, 1,
0.8208126, -0.1627563, -0.07559648, 0.9843137, 0, 1, 1,
0.8270568, -0.9418314, 2.053188, 0.9921569, 0, 1, 1,
0.8280978, -1.665038, 1.905347, 0.9960784, 0, 1, 1,
0.8301488, 0.3673882, 1.151851, 1, 0, 0.9960784, 1,
0.8317226, 0.864372, 0.6490752, 1, 0, 0.9882353, 1,
0.8317837, 1.266287, 2.4386, 1, 0, 0.9843137, 1,
0.8470219, -0.3189631, 1.710273, 1, 0, 0.9764706, 1,
0.8502489, 0.8088573, 1.577382, 1, 0, 0.972549, 1,
0.8506944, 0.6367556, 1.018838, 1, 0, 0.9647059, 1,
0.8516604, -1.870231, 1.666065, 1, 0, 0.9607843, 1,
0.853698, 1.208442, 1.613291, 1, 0, 0.9529412, 1,
0.8577921, -1.04815, 2.324153, 1, 0, 0.9490196, 1,
0.8631799, 0.308827, -0.1746279, 1, 0, 0.9411765, 1,
0.8666657, 0.08848891, 2.468566, 1, 0, 0.9372549, 1,
0.8807526, -0.4892649, 3.335155, 1, 0, 0.9294118, 1,
0.8812599, 0.9913052, -0.2874427, 1, 0, 0.9254902, 1,
0.8872921, -1.446361, 2.833672, 1, 0, 0.9176471, 1,
0.8885955, 0.4074084, 0.9807366, 1, 0, 0.9137255, 1,
0.9019002, -1.229092, 3.859084, 1, 0, 0.9058824, 1,
0.9023615, 0.1920423, 0.6078601, 1, 0, 0.9019608, 1,
0.9065562, -0.4535484, 2.899974, 1, 0, 0.8941177, 1,
0.9093899, -0.7754143, 2.24098, 1, 0, 0.8862745, 1,
0.9107639, -0.9721047, 0.05153083, 1, 0, 0.8823529, 1,
0.911635, 1.635919, 0.2959087, 1, 0, 0.8745098, 1,
0.9177068, 0.7660533, 0.1273509, 1, 0, 0.8705882, 1,
0.9182715, 2.353535, 1.311577, 1, 0, 0.8627451, 1,
0.9241057, 0.4202911, 0.3012864, 1, 0, 0.8588235, 1,
0.9244564, -0.1045334, 1.686975, 1, 0, 0.8509804, 1,
0.9408131, 1.894978, -0.2123068, 1, 0, 0.8470588, 1,
0.943259, -0.2814588, 1.292375, 1, 0, 0.8392157, 1,
0.9524979, 1.024848, 2.118329, 1, 0, 0.8352941, 1,
0.9552791, -1.385339, 2.642968, 1, 0, 0.827451, 1,
0.9560171, -0.2965816, 3.359699, 1, 0, 0.8235294, 1,
0.9653262, -0.09067971, 1.710351, 1, 0, 0.8156863, 1,
0.9664762, -0.6644961, 0.8748783, 1, 0, 0.8117647, 1,
0.9703803, 0.3253691, 1.138704, 1, 0, 0.8039216, 1,
0.9760134, -0.2023963, 0.7381247, 1, 0, 0.7960784, 1,
0.9784827, -1.769617, 2.02054, 1, 0, 0.7921569, 1,
0.9871026, -0.007555202, 2.59598, 1, 0, 0.7843137, 1,
0.9956492, -0.1701313, 1.270759, 1, 0, 0.7803922, 1,
0.9994456, -1.274668, 1.887072, 1, 0, 0.772549, 1,
1.004731, -0.07827937, 2.691327, 1, 0, 0.7686275, 1,
1.005304, -0.7554847, 3.57551, 1, 0, 0.7607843, 1,
1.014136, 0.5341399, 0.550701, 1, 0, 0.7568628, 1,
1.017302, -1.990165, 1.726107, 1, 0, 0.7490196, 1,
1.045061, -0.5288342, 0.8020561, 1, 0, 0.7450981, 1,
1.051768, -0.8098459, 3.783112, 1, 0, 0.7372549, 1,
1.05631, -0.004210135, 0.8312777, 1, 0, 0.7333333, 1,
1.056369, -0.524138, 2.686122, 1, 0, 0.7254902, 1,
1.061133, 0.8419416, 0.08828737, 1, 0, 0.7215686, 1,
1.071437, -0.7165778, 0.4690846, 1, 0, 0.7137255, 1,
1.072458, 0.3991442, -0.09807104, 1, 0, 0.7098039, 1,
1.073173, 1.927565, 0.2412256, 1, 0, 0.7019608, 1,
1.08395, 0.2832697, 1.372878, 1, 0, 0.6941177, 1,
1.08447, 0.4425525, 2.258364, 1, 0, 0.6901961, 1,
1.0867, 1.445894, -0.4902796, 1, 0, 0.682353, 1,
1.097039, 0.6767184, 1.175834, 1, 0, 0.6784314, 1,
1.102416, -1.116297, 2.657904, 1, 0, 0.6705883, 1,
1.111358, -1.771375, 2.721164, 1, 0, 0.6666667, 1,
1.112104, -1.402195, 2.332219, 1, 0, 0.6588235, 1,
1.127251, 0.5888525, 1.535829, 1, 0, 0.654902, 1,
1.137666, 1.30072, 1.049622, 1, 0, 0.6470588, 1,
1.156918, 2.053395, 0.7586457, 1, 0, 0.6431373, 1,
1.161182, 0.8673052, 2.976095, 1, 0, 0.6352941, 1,
1.161827, -0.02114994, 1.452592, 1, 0, 0.6313726, 1,
1.169384, 0.03332084, 1.620854, 1, 0, 0.6235294, 1,
1.174091, 0.07481463, 2.460902, 1, 0, 0.6196079, 1,
1.176706, -0.6162652, 2.990651, 1, 0, 0.6117647, 1,
1.188094, 0.2716991, 1.214933, 1, 0, 0.6078432, 1,
1.20453, -1.298344, 1.428317, 1, 0, 0.6, 1,
1.219191, 2.795987, -0.08635914, 1, 0, 0.5921569, 1,
1.220013, -0.6130196, 1.165345, 1, 0, 0.5882353, 1,
1.222881, 1.17527, -0.6073638, 1, 0, 0.5803922, 1,
1.229513, -1.046921, 2.059002, 1, 0, 0.5764706, 1,
1.230997, 0.1553573, 2.058564, 1, 0, 0.5686275, 1,
1.236391, -0.5178107, 2.715955, 1, 0, 0.5647059, 1,
1.242648, -0.2237686, 2.494876, 1, 0, 0.5568628, 1,
1.245626, 0.1554189, 1.845855, 1, 0, 0.5529412, 1,
1.251553, 0.001234273, 2.412584, 1, 0, 0.5450981, 1,
1.26406, -2.196908, 1.463979, 1, 0, 0.5411765, 1,
1.265916, -0.02132822, 1.78626, 1, 0, 0.5333334, 1,
1.266312, 1.726001, 0.1901335, 1, 0, 0.5294118, 1,
1.279225, -0.2336791, 2.678081, 1, 0, 0.5215687, 1,
1.294541, 1.424272, 0.6265665, 1, 0, 0.5176471, 1,
1.295449, 0.3451522, 1.702551, 1, 0, 0.509804, 1,
1.300012, 1.846992, 1.191837, 1, 0, 0.5058824, 1,
1.301062, -0.525279, 2.50789, 1, 0, 0.4980392, 1,
1.305598, 0.5251504, 3.668109, 1, 0, 0.4901961, 1,
1.313191, 0.01528487, 2.617687, 1, 0, 0.4862745, 1,
1.316613, -0.9524285, 4.434042, 1, 0, 0.4784314, 1,
1.318468, -0.8366816, 3.776806, 1, 0, 0.4745098, 1,
1.320499, -0.3620016, 2.626257, 1, 0, 0.4666667, 1,
1.33511, -0.0198707, 2.613092, 1, 0, 0.4627451, 1,
1.335989, 0.7668065, 0.4868317, 1, 0, 0.454902, 1,
1.34493, -2.264054, 1.265657, 1, 0, 0.4509804, 1,
1.345335, -1.567283, 2.960745, 1, 0, 0.4431373, 1,
1.345935, 0.09044188, 2.978256, 1, 0, 0.4392157, 1,
1.346309, 0.01006562, 3.204278, 1, 0, 0.4313726, 1,
1.351271, 2.259438, 1.531381, 1, 0, 0.427451, 1,
1.367661, 0.6649491, 1.301729, 1, 0, 0.4196078, 1,
1.368207, 0.5532435, 1.626692, 1, 0, 0.4156863, 1,
1.369835, -0.9817036, 0.5852808, 1, 0, 0.4078431, 1,
1.371834, -0.622516, 1.038961, 1, 0, 0.4039216, 1,
1.385719, -1.075001, 3.534309, 1, 0, 0.3960784, 1,
1.390469, -1.172869, 2.910874, 1, 0, 0.3882353, 1,
1.393607, 1.19626, 1.559834, 1, 0, 0.3843137, 1,
1.39803, -0.4303266, 2.953923, 1, 0, 0.3764706, 1,
1.398054, 0.1058821, 0.4882279, 1, 0, 0.372549, 1,
1.398975, 1.316079, 0.1235383, 1, 0, 0.3647059, 1,
1.41992, -1.030779, 2.334464, 1, 0, 0.3607843, 1,
1.422087, -0.04521672, 2.240712, 1, 0, 0.3529412, 1,
1.423674, -1.619344, 1.542766, 1, 0, 0.3490196, 1,
1.43991, 1.313074, 1.724209, 1, 0, 0.3411765, 1,
1.442451, -0.9241886, 2.326433, 1, 0, 0.3372549, 1,
1.448331, -0.03554294, 2.644704, 1, 0, 0.3294118, 1,
1.460156, -0.667114, 0.5031484, 1, 0, 0.3254902, 1,
1.467097, 0.4155155, 1.270527, 1, 0, 0.3176471, 1,
1.477148, 0.5219327, 1.624362, 1, 0, 0.3137255, 1,
1.477395, 2.173073, 0.6050035, 1, 0, 0.3058824, 1,
1.484232, 0.01395699, 1.443726, 1, 0, 0.2980392, 1,
1.498697, -0.6209229, 1.135826, 1, 0, 0.2941177, 1,
1.518778, 0.5855572, 0.9341599, 1, 0, 0.2862745, 1,
1.542757, -0.8433777, 2.295478, 1, 0, 0.282353, 1,
1.547719, -0.3580559, 2.357583, 1, 0, 0.2745098, 1,
1.548354, 1.18527, 0.6482424, 1, 0, 0.2705882, 1,
1.549656, -1.776666, 2.576476, 1, 0, 0.2627451, 1,
1.566338, 0.8386289, 0.6976876, 1, 0, 0.2588235, 1,
1.567669, -2.238879, 1.648458, 1, 0, 0.2509804, 1,
1.568734, 0.5393156, 0.7998702, 1, 0, 0.2470588, 1,
1.581994, 0.4359095, 1.108315, 1, 0, 0.2392157, 1,
1.582311, 0.09985577, 0.7286134, 1, 0, 0.2352941, 1,
1.591844, 1.171835, 0.003166348, 1, 0, 0.227451, 1,
1.616806, -0.636146, 0.7429241, 1, 0, 0.2235294, 1,
1.617687, 0.4051522, -1.21733, 1, 0, 0.2156863, 1,
1.631275, -0.2497247, 0.7063576, 1, 0, 0.2117647, 1,
1.638146, -0.5156524, 3.024886, 1, 0, 0.2039216, 1,
1.646692, -2.428773, 2.214825, 1, 0, 0.1960784, 1,
1.653876, -0.1120375, 1.259296, 1, 0, 0.1921569, 1,
1.667754, 0.4619006, 1.075175, 1, 0, 0.1843137, 1,
1.669188, -0.2969726, 2.063886, 1, 0, 0.1803922, 1,
1.694819, 0.03924881, 1.605775, 1, 0, 0.172549, 1,
1.704963, 1.051429, 1.29863, 1, 0, 0.1686275, 1,
1.726619, 0.1113596, 1.077001, 1, 0, 0.1607843, 1,
1.738524, -0.3572905, 3.168946, 1, 0, 0.1568628, 1,
1.756975, 0.5898076, -0.9226893, 1, 0, 0.1490196, 1,
1.763927, -1.527244, 2.529678, 1, 0, 0.145098, 1,
1.766293, -0.0896907, 2.062579, 1, 0, 0.1372549, 1,
1.77369, -2.201353, 1.930873, 1, 0, 0.1333333, 1,
1.778529, -0.2080414, 1.576838, 1, 0, 0.1254902, 1,
1.791287, -1.343993, 3.166153, 1, 0, 0.1215686, 1,
1.822656, 0.8628412, -0.6364338, 1, 0, 0.1137255, 1,
1.84468, 0.508752, -0.8797486, 1, 0, 0.1098039, 1,
1.900221, 1.120927, 0.2927593, 1, 0, 0.1019608, 1,
1.945203, 1.235217, 1.029706, 1, 0, 0.09411765, 1,
1.981232, -0.7520863, 3.626117, 1, 0, 0.09019608, 1,
2.020561, 0.8456722, 1.929934, 1, 0, 0.08235294, 1,
2.051244, 1.728607, 0.8706498, 1, 0, 0.07843138, 1,
2.093893, -0.4332162, 3.880332, 1, 0, 0.07058824, 1,
2.127676, 1.017799, 1.512013, 1, 0, 0.06666667, 1,
2.19916, 0.4806023, -0.02720067, 1, 0, 0.05882353, 1,
2.221134, -0.1921006, 0.1429743, 1, 0, 0.05490196, 1,
2.266949, 2.551808, -0.7480323, 1, 0, 0.04705882, 1,
2.426582, -2.112667, 1.059595, 1, 0, 0.04313726, 1,
2.441027, -0.2028421, 1.670751, 1, 0, 0.03529412, 1,
2.48327, 1.045395, 1.898276, 1, 0, 0.03137255, 1,
2.551902, -0.5832309, 2.703932, 1, 0, 0.02352941, 1,
2.655018, -0.9156193, 1.17112, 1, 0, 0.01960784, 1,
3.089354, 0.5369135, 1.530473, 1, 0, 0.01176471, 1,
3.313631, 1.743044, 1.43133, 1, 0, 0.007843138, 1
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
0.2340983, -4.18384, -7.23028, 0, -0.5, 0.5, 0.5,
0.2340983, -4.18384, -7.23028, 1, -0.5, 0.5, 0.5,
0.2340983, -4.18384, -7.23028, 1, 1.5, 0.5, 0.5,
0.2340983, -4.18384, -7.23028, 0, 1.5, 0.5, 0.5
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
-3.889396, -0.06546986, -7.23028, 0, -0.5, 0.5, 0.5,
-3.889396, -0.06546986, -7.23028, 1, -0.5, 0.5, 0.5,
-3.889396, -0.06546986, -7.23028, 1, 1.5, 0.5, 0.5,
-3.889396, -0.06546986, -7.23028, 0, 1.5, 0.5, 0.5
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
-3.889396, -4.18384, 0.05658674, 0, -0.5, 0.5, 0.5,
-3.889396, -4.18384, 0.05658674, 1, -0.5, 0.5, 0.5,
-3.889396, -4.18384, 0.05658674, 1, 1.5, 0.5, 0.5,
-3.889396, -4.18384, 0.05658674, 0, 1.5, 0.5, 0.5
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
-2, -3.233447, -5.548695,
3, -3.233447, -5.548695,
-2, -3.233447, -5.548695,
-2, -3.391846, -5.828959,
-1, -3.233447, -5.548695,
-1, -3.391846, -5.828959,
0, -3.233447, -5.548695,
0, -3.391846, -5.828959,
1, -3.233447, -5.548695,
1, -3.391846, -5.828959,
2, -3.233447, -5.548695,
2, -3.391846, -5.828959,
3, -3.233447, -5.548695,
3, -3.391846, -5.828959
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
-2, -3.708644, -6.389488, 0, -0.5, 0.5, 0.5,
-2, -3.708644, -6.389488, 1, -0.5, 0.5, 0.5,
-2, -3.708644, -6.389488, 1, 1.5, 0.5, 0.5,
-2, -3.708644, -6.389488, 0, 1.5, 0.5, 0.5,
-1, -3.708644, -6.389488, 0, -0.5, 0.5, 0.5,
-1, -3.708644, -6.389488, 1, -0.5, 0.5, 0.5,
-1, -3.708644, -6.389488, 1, 1.5, 0.5, 0.5,
-1, -3.708644, -6.389488, 0, 1.5, 0.5, 0.5,
0, -3.708644, -6.389488, 0, -0.5, 0.5, 0.5,
0, -3.708644, -6.389488, 1, -0.5, 0.5, 0.5,
0, -3.708644, -6.389488, 1, 1.5, 0.5, 0.5,
0, -3.708644, -6.389488, 0, 1.5, 0.5, 0.5,
1, -3.708644, -6.389488, 0, -0.5, 0.5, 0.5,
1, -3.708644, -6.389488, 1, -0.5, 0.5, 0.5,
1, -3.708644, -6.389488, 1, 1.5, 0.5, 0.5,
1, -3.708644, -6.389488, 0, 1.5, 0.5, 0.5,
2, -3.708644, -6.389488, 0, -0.5, 0.5, 0.5,
2, -3.708644, -6.389488, 1, -0.5, 0.5, 0.5,
2, -3.708644, -6.389488, 1, 1.5, 0.5, 0.5,
2, -3.708644, -6.389488, 0, 1.5, 0.5, 0.5,
3, -3.708644, -6.389488, 0, -0.5, 0.5, 0.5,
3, -3.708644, -6.389488, 1, -0.5, 0.5, 0.5,
3, -3.708644, -6.389488, 1, 1.5, 0.5, 0.5,
3, -3.708644, -6.389488, 0, 1.5, 0.5, 0.5
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
-2.937821, -3, -5.548695,
-2.937821, 3, -5.548695,
-2.937821, -3, -5.548695,
-3.096417, -3, -5.828959,
-2.937821, -2, -5.548695,
-3.096417, -2, -5.828959,
-2.937821, -1, -5.548695,
-3.096417, -1, -5.828959,
-2.937821, 0, -5.548695,
-3.096417, 0, -5.828959,
-2.937821, 1, -5.548695,
-3.096417, 1, -5.828959,
-2.937821, 2, -5.548695,
-3.096417, 2, -5.828959,
-2.937821, 3, -5.548695,
-3.096417, 3, -5.828959
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
-3.413609, -3, -6.389488, 0, -0.5, 0.5, 0.5,
-3.413609, -3, -6.389488, 1, -0.5, 0.5, 0.5,
-3.413609, -3, -6.389488, 1, 1.5, 0.5, 0.5,
-3.413609, -3, -6.389488, 0, 1.5, 0.5, 0.5,
-3.413609, -2, -6.389488, 0, -0.5, 0.5, 0.5,
-3.413609, -2, -6.389488, 1, -0.5, 0.5, 0.5,
-3.413609, -2, -6.389488, 1, 1.5, 0.5, 0.5,
-3.413609, -2, -6.389488, 0, 1.5, 0.5, 0.5,
-3.413609, -1, -6.389488, 0, -0.5, 0.5, 0.5,
-3.413609, -1, -6.389488, 1, -0.5, 0.5, 0.5,
-3.413609, -1, -6.389488, 1, 1.5, 0.5, 0.5,
-3.413609, -1, -6.389488, 0, 1.5, 0.5, 0.5,
-3.413609, 0, -6.389488, 0, -0.5, 0.5, 0.5,
-3.413609, 0, -6.389488, 1, -0.5, 0.5, 0.5,
-3.413609, 0, -6.389488, 1, 1.5, 0.5, 0.5,
-3.413609, 0, -6.389488, 0, 1.5, 0.5, 0.5,
-3.413609, 1, -6.389488, 0, -0.5, 0.5, 0.5,
-3.413609, 1, -6.389488, 1, -0.5, 0.5, 0.5,
-3.413609, 1, -6.389488, 1, 1.5, 0.5, 0.5,
-3.413609, 1, -6.389488, 0, 1.5, 0.5, 0.5,
-3.413609, 2, -6.389488, 0, -0.5, 0.5, 0.5,
-3.413609, 2, -6.389488, 1, -0.5, 0.5, 0.5,
-3.413609, 2, -6.389488, 1, 1.5, 0.5, 0.5,
-3.413609, 2, -6.389488, 0, 1.5, 0.5, 0.5,
-3.413609, 3, -6.389488, 0, -0.5, 0.5, 0.5,
-3.413609, 3, -6.389488, 1, -0.5, 0.5, 0.5,
-3.413609, 3, -6.389488, 1, 1.5, 0.5, 0.5,
-3.413609, 3, -6.389488, 0, 1.5, 0.5, 0.5
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
-2.937821, -3.233447, -4,
-2.937821, -3.233447, 4,
-2.937821, -3.233447, -4,
-3.096417, -3.391846, -4,
-2.937821, -3.233447, -2,
-3.096417, -3.391846, -2,
-2.937821, -3.233447, 0,
-3.096417, -3.391846, 0,
-2.937821, -3.233447, 2,
-3.096417, -3.391846, 2,
-2.937821, -3.233447, 4,
-3.096417, -3.391846, 4
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
-3.413609, -3.708644, -4, 0, -0.5, 0.5, 0.5,
-3.413609, -3.708644, -4, 1, -0.5, 0.5, 0.5,
-3.413609, -3.708644, -4, 1, 1.5, 0.5, 0.5,
-3.413609, -3.708644, -4, 0, 1.5, 0.5, 0.5,
-3.413609, -3.708644, -2, 0, -0.5, 0.5, 0.5,
-3.413609, -3.708644, -2, 1, -0.5, 0.5, 0.5,
-3.413609, -3.708644, -2, 1, 1.5, 0.5, 0.5,
-3.413609, -3.708644, -2, 0, 1.5, 0.5, 0.5,
-3.413609, -3.708644, 0, 0, -0.5, 0.5, 0.5,
-3.413609, -3.708644, 0, 1, -0.5, 0.5, 0.5,
-3.413609, -3.708644, 0, 1, 1.5, 0.5, 0.5,
-3.413609, -3.708644, 0, 0, 1.5, 0.5, 0.5,
-3.413609, -3.708644, 2, 0, -0.5, 0.5, 0.5,
-3.413609, -3.708644, 2, 1, -0.5, 0.5, 0.5,
-3.413609, -3.708644, 2, 1, 1.5, 0.5, 0.5,
-3.413609, -3.708644, 2, 0, 1.5, 0.5, 0.5,
-3.413609, -3.708644, 4, 0, -0.5, 0.5, 0.5,
-3.413609, -3.708644, 4, 1, -0.5, 0.5, 0.5,
-3.413609, -3.708644, 4, 1, 1.5, 0.5, 0.5,
-3.413609, -3.708644, 4, 0, 1.5, 0.5, 0.5
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
-2.937821, -3.233447, -5.548695,
-2.937821, 3.102507, -5.548695,
-2.937821, -3.233447, 5.661869,
-2.937821, 3.102507, 5.661869,
-2.937821, -3.233447, -5.548695,
-2.937821, -3.233447, 5.661869,
-2.937821, 3.102507, -5.548695,
-2.937821, 3.102507, 5.661869,
-2.937821, -3.233447, -5.548695,
3.406017, -3.233447, -5.548695,
-2.937821, -3.233447, 5.661869,
3.406017, -3.233447, 5.661869,
-2.937821, 3.102507, -5.548695,
3.406017, 3.102507, -5.548695,
-2.937821, 3.102507, 5.661869,
3.406017, 3.102507, 5.661869,
3.406017, -3.233447, -5.548695,
3.406017, 3.102507, -5.548695,
3.406017, -3.233447, 5.661869,
3.406017, 3.102507, 5.661869,
3.406017, -3.233447, -5.548695,
3.406017, -3.233447, 5.661869,
3.406017, 3.102507, -5.548695,
3.406017, 3.102507, 5.661869
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
var radius = 7.665279;
var distance = 34.10369;
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
mvMatrix.translate( -0.2340983, 0.06546986, -0.05658674 );
mvMatrix.scale( 1.306441, 1.308066, 0.7392892 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10369);
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
DBH<-read.table("DBH.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DBH$V2
```

```
## Error in eval(expr, envir, enclos): object 'DBH' not found
```

```r
y<-DBH$V3
```

```
## Error in eval(expr, envir, enclos): object 'DBH' not found
```

```r
z<-DBH$V4
```

```
## Error in eval(expr, envir, enclos): object 'DBH' not found
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
-2.845435, -0.5460333, -2.57562, 0, 0, 1, 1, 1,
-2.741779, -1.328532, -2.354696, 1, 0, 0, 1, 1,
-2.526907, 0.0325257, -1.142442, 1, 0, 0, 1, 1,
-2.400918, 0.1836968, -0.9758095, 1, 0, 0, 1, 1,
-2.377385, 0.6194781, -2.426045, 1, 0, 0, 1, 1,
-2.367421, -1.033922, -0.6848812, 1, 0, 0, 1, 1,
-2.292706, 1.455117, -0.3575088, 0, 0, 0, 1, 1,
-2.233539, 1.370295, -0.6237721, 0, 0, 0, 1, 1,
-2.229278, 1.953493, -0.2460467, 0, 0, 0, 1, 1,
-2.218356, 1.853867, -0.754878, 0, 0, 0, 1, 1,
-2.175863, 0.4709435, -0.3457096, 0, 0, 0, 1, 1,
-2.175208, -0.04546952, -2.537848, 0, 0, 0, 1, 1,
-2.171979, 0.2779175, -2.695785, 0, 0, 0, 1, 1,
-2.087104, 0.07134434, -1.171642, 1, 1, 1, 1, 1,
-2.084457, -0.4487951, -3.404037, 1, 1, 1, 1, 1,
-2.058172, 0.9300783, -0.6541703, 1, 1, 1, 1, 1,
-2.056584, -0.1208314, -1.109454, 1, 1, 1, 1, 1,
-2.055513, 0.9667452, -1.007573, 1, 1, 1, 1, 1,
-2.050232, 0.06783632, -0.7288432, 1, 1, 1, 1, 1,
-2.000081, 0.9904449, -1.123468, 1, 1, 1, 1, 1,
-1.973205, 0.8906862, -1.394164, 1, 1, 1, 1, 1,
-1.952143, 1.925301, -1.76518, 1, 1, 1, 1, 1,
-1.944482, 1.841355, 1.213111, 1, 1, 1, 1, 1,
-1.931333, 0.7434058, -0.1205223, 1, 1, 1, 1, 1,
-1.914203, 0.3931317, -0.5900514, 1, 1, 1, 1, 1,
-1.900854, 1.256558, -2.322923, 1, 1, 1, 1, 1,
-1.893775, -0.1732838, -0.7193441, 1, 1, 1, 1, 1,
-1.892247, -0.04534701, -0.5878053, 1, 1, 1, 1, 1,
-1.890454, -0.6236273, -0.7958438, 0, 0, 1, 1, 1,
-1.882833, 2.102748, -0.1290245, 1, 0, 0, 1, 1,
-1.878445, -0.7702673, -2.740683, 1, 0, 0, 1, 1,
-1.861841, -0.06478626, -0.2365524, 1, 0, 0, 1, 1,
-1.857237, 1.105138, -3.834882, 1, 0, 0, 1, 1,
-1.844094, -1.153127, -2.921819, 1, 0, 0, 1, 1,
-1.826878, 1.435499, -1.881466, 0, 0, 0, 1, 1,
-1.79978, 1.409706, -0.5526692, 0, 0, 0, 1, 1,
-1.787234, 1.472459, -1.299447, 0, 0, 0, 1, 1,
-1.772717, 0.1280061, -2.010674, 0, 0, 0, 1, 1,
-1.767423, 0.839349, 0.4888979, 0, 0, 0, 1, 1,
-1.749961, 0.1991366, -2.169559, 0, 0, 0, 1, 1,
-1.741996, 0.2340629, -2.715359, 0, 0, 0, 1, 1,
-1.734185, 0.9263935, -1.127951, 1, 1, 1, 1, 1,
-1.731212, -0.1702788, -1.551379, 1, 1, 1, 1, 1,
-1.705398, 1.025291, -1.927027, 1, 1, 1, 1, 1,
-1.691095, 0.9915782, -0.8667207, 1, 1, 1, 1, 1,
-1.689106, 0.887689, -1.845318, 1, 1, 1, 1, 1,
-1.686419, 0.2050781, -0.3860458, 1, 1, 1, 1, 1,
-1.674551, 0.01168971, -0.9550073, 1, 1, 1, 1, 1,
-1.673361, 0.2582055, -1.576264, 1, 1, 1, 1, 1,
-1.66775, -0.3124392, -1.202438, 1, 1, 1, 1, 1,
-1.658799, 0.3919698, -1.271909, 1, 1, 1, 1, 1,
-1.655796, 0.9641709, -0.1158768, 1, 1, 1, 1, 1,
-1.652042, -0.906321, -3.973977, 1, 1, 1, 1, 1,
-1.64765, 1.513104, -0.959094, 1, 1, 1, 1, 1,
-1.647213, -1.567202, -0.1999456, 1, 1, 1, 1, 1,
-1.646702, 0.3336767, -0.2110374, 1, 1, 1, 1, 1,
-1.615754, -2.062127, -1.778198, 0, 0, 1, 1, 1,
-1.609042, 0.6282283, -2.230432, 1, 0, 0, 1, 1,
-1.603333, -3.141176, -5.385435, 1, 0, 0, 1, 1,
-1.601616, 2.338619, -2.224243, 1, 0, 0, 1, 1,
-1.594194, 2.159214, 0.6781775, 1, 0, 0, 1, 1,
-1.565779, -0.494324, -2.173764, 1, 0, 0, 1, 1,
-1.561282, 0.8141623, -2.209758, 0, 0, 0, 1, 1,
-1.543515, -1.729069, -1.819605, 0, 0, 0, 1, 1,
-1.540884, 1.686424, -0.5677716, 0, 0, 0, 1, 1,
-1.532012, 0.02489407, -0.4821295, 0, 0, 0, 1, 1,
-1.481947, -0.5807287, -2.608248, 0, 0, 0, 1, 1,
-1.481454, -0.2052707, -2.413481, 0, 0, 0, 1, 1,
-1.478492, 0.08297986, -0.6036019, 0, 0, 0, 1, 1,
-1.475738, 0.7655688, -0.3149091, 1, 1, 1, 1, 1,
-1.471851, 0.1026046, -2.51843, 1, 1, 1, 1, 1,
-1.471024, 0.2474585, -1.077585, 1, 1, 1, 1, 1,
-1.470917, -0.3007599, -1.263673, 1, 1, 1, 1, 1,
-1.462637, 2.588207, -0.1680622, 1, 1, 1, 1, 1,
-1.460612, 0.9305843, -2.040924, 1, 1, 1, 1, 1,
-1.458477, 0.3691162, -2.051343, 1, 1, 1, 1, 1,
-1.455795, -1.132524, -2.2824, 1, 1, 1, 1, 1,
-1.453449, 0.6373938, -1.430342, 1, 1, 1, 1, 1,
-1.444848, 0.100195, -2.130548, 1, 1, 1, 1, 1,
-1.431958, 0.5432765, -1.36501, 1, 1, 1, 1, 1,
-1.419611, -0.5444371, -4.913652, 1, 1, 1, 1, 1,
-1.414808, 0.4692424, 1.191397, 1, 1, 1, 1, 1,
-1.413359, 0.01127521, -1.19957, 1, 1, 1, 1, 1,
-1.405928, 0.5131969, -1.864307, 1, 1, 1, 1, 1,
-1.405636, -1.347689, -0.3841417, 0, 0, 1, 1, 1,
-1.404522, 0.3098821, -1.924067, 1, 0, 0, 1, 1,
-1.401082, -0.3578056, -1.821354, 1, 0, 0, 1, 1,
-1.393653, 0.6503632, -0.5531699, 1, 0, 0, 1, 1,
-1.392657, -1.658458, -1.810706, 1, 0, 0, 1, 1,
-1.384108, -1.111304, -2.759557, 1, 0, 0, 1, 1,
-1.383118, 0.1871126, -0.4683657, 0, 0, 0, 1, 1,
-1.381209, -0.4373985, -1.33117, 0, 0, 0, 1, 1,
-1.375948, -1.829827, -2.279905, 0, 0, 0, 1, 1,
-1.373501, 0.6044391, -1.803213, 0, 0, 0, 1, 1,
-1.339568, 1.312319, -0.3685495, 0, 0, 0, 1, 1,
-1.33923, -1.4766, -3.894984, 0, 0, 0, 1, 1,
-1.31821, 0.368829, -2.01818, 0, 0, 0, 1, 1,
-1.316926, -2.190007, -2.496342, 1, 1, 1, 1, 1,
-1.312274, -0.6915145, -1.640155, 1, 1, 1, 1, 1,
-1.309893, 0.652735, -1.500321, 1, 1, 1, 1, 1,
-1.294328, 0.6116917, -1.738056, 1, 1, 1, 1, 1,
-1.284862, 0.1923364, -2.408444, 1, 1, 1, 1, 1,
-1.281868, -0.2557025, -1.297121, 1, 1, 1, 1, 1,
-1.275597, 1.317907, -1.198977, 1, 1, 1, 1, 1,
-1.272148, 1.450483, -0.003312379, 1, 1, 1, 1, 1,
-1.266062, -0.06363645, -1.369699, 1, 1, 1, 1, 1,
-1.263098, 0.4692121, -0.8563438, 1, 1, 1, 1, 1,
-1.253717, 1.390208, -1.92012, 1, 1, 1, 1, 1,
-1.249615, -0.2746556, -0.5407548, 1, 1, 1, 1, 1,
-1.247443, 0.266619, -1.072089, 1, 1, 1, 1, 1,
-1.244802, 0.7337206, -1.359489, 1, 1, 1, 1, 1,
-1.239875, -1.579906, -1.779208, 1, 1, 1, 1, 1,
-1.236559, 0.7022857, -1.470515, 0, 0, 1, 1, 1,
-1.232292, 0.2853268, 0.4593676, 1, 0, 0, 1, 1,
-1.221433, -0.3099223, -1.021575, 1, 0, 0, 1, 1,
-1.210827, -0.5553569, -1.025992, 1, 0, 0, 1, 1,
-1.208706, 2.08766, -0.2912284, 1, 0, 0, 1, 1,
-1.186549, -0.1733164, -1.589163, 1, 0, 0, 1, 1,
-1.185427, -0.5902049, -2.239792, 0, 0, 0, 1, 1,
-1.182563, -0.5101869, -0.9073443, 0, 0, 0, 1, 1,
-1.176819, -0.7727788, -1.47276, 0, 0, 0, 1, 1,
-1.166939, -0.7708977, -0.6359946, 0, 0, 0, 1, 1,
-1.161406, -0.2575652, -2.634929, 0, 0, 0, 1, 1,
-1.161171, -0.1997488, -1.475672, 0, 0, 0, 1, 1,
-1.160336, -0.6039546, -1.526847, 0, 0, 0, 1, 1,
-1.151981, -1.198324, -2.753057, 1, 1, 1, 1, 1,
-1.150882, -1.189135, -2.415494, 1, 1, 1, 1, 1,
-1.148835, -1.293949, -4.097749, 1, 1, 1, 1, 1,
-1.140881, 0.4144704, 0.4449385, 1, 1, 1, 1, 1,
-1.140401, 0.2015682, -1.13882, 1, 1, 1, 1, 1,
-1.13925, 0.3171659, -1.389119, 1, 1, 1, 1, 1,
-1.129842, 0.254743, -0.1853688, 1, 1, 1, 1, 1,
-1.12786, -0.124601, -2.122984, 1, 1, 1, 1, 1,
-1.124113, 0.4863266, -0.2164918, 1, 1, 1, 1, 1,
-1.109872, -0.3932699, -1.859255, 1, 1, 1, 1, 1,
-1.101411, -1.066524, -1.381431, 1, 1, 1, 1, 1,
-1.096574, 0.08965921, -2.935515, 1, 1, 1, 1, 1,
-1.096354, -0.1493923, -1.302345, 1, 1, 1, 1, 1,
-1.095016, -1.275966, -3.694506, 1, 1, 1, 1, 1,
-1.09011, 0.0901557, -3.194972, 1, 1, 1, 1, 1,
-1.083256, 1.420596, 0.7669466, 0, 0, 1, 1, 1,
-1.08068, -1.380855, -1.206433, 1, 0, 0, 1, 1,
-1.051048, -1.238672, -3.361331, 1, 0, 0, 1, 1,
-1.044521, -0.254197, -1.256334, 1, 0, 0, 1, 1,
-1.039516, -0.3263069, -0.1340082, 1, 0, 0, 1, 1,
-1.022443, -0.3146383, -0.8636236, 1, 0, 0, 1, 1,
-1.022157, 1.912086, -0.8360661, 0, 0, 0, 1, 1,
-1.017458, -0.9472445, -3.057913, 0, 0, 0, 1, 1,
-1.009244, 0.7113158, -2.484044, 0, 0, 0, 1, 1,
-1.000357, 1.038507, 1.203975, 0, 0, 0, 1, 1,
-0.9984752, -0.3523882, -2.20594, 0, 0, 0, 1, 1,
-0.9978071, 0.8983808, -0.9825994, 0, 0, 0, 1, 1,
-0.9919853, 0.5039707, -0.09276602, 0, 0, 0, 1, 1,
-0.9826385, -0.8797138, -1.712409, 1, 1, 1, 1, 1,
-0.9793706, 0.2851706, -2.619668, 1, 1, 1, 1, 1,
-0.9791303, 1.874808, -1.793303, 1, 1, 1, 1, 1,
-0.9706265, 0.9111524, -0.8869427, 1, 1, 1, 1, 1,
-0.9670752, 1.002134, 1.069689, 1, 1, 1, 1, 1,
-0.966828, -0.4500336, -0.8984144, 1, 1, 1, 1, 1,
-0.9648348, -1.602606, -2.035548, 1, 1, 1, 1, 1,
-0.9609969, 0.7647434, -2.561053, 1, 1, 1, 1, 1,
-0.9585959, -0.5478457, -3.805578, 1, 1, 1, 1, 1,
-0.9560311, -0.5072591, -1.811588, 1, 1, 1, 1, 1,
-0.9521028, 0.5143372, -0.06672318, 1, 1, 1, 1, 1,
-0.9510288, -0.08235184, -2.529921, 1, 1, 1, 1, 1,
-0.9486478, -0.365758, -1.501809, 1, 1, 1, 1, 1,
-0.9450266, -0.03568135, -0.793366, 1, 1, 1, 1, 1,
-0.9431233, 0.4280177, 0.7824183, 1, 1, 1, 1, 1,
-0.9369209, 0.6927056, -0.2498617, 0, 0, 1, 1, 1,
-0.935675, -1.126945, -3.827923, 1, 0, 0, 1, 1,
-0.9242224, 0.4690901, -1.649818, 1, 0, 0, 1, 1,
-0.9240739, 0.6793151, -1.585113, 1, 0, 0, 1, 1,
-0.9075767, -2.011163, -3.429667, 1, 0, 0, 1, 1,
-0.9031804, -0.4064573, -1.392561, 1, 0, 0, 1, 1,
-0.9031517, 0.222732, -0.2109059, 0, 0, 0, 1, 1,
-0.9019665, -1.346499, -3.70809, 0, 0, 0, 1, 1,
-0.8999816, 1.59813, -1.453466, 0, 0, 0, 1, 1,
-0.8979775, 0.8876467, -0.7367164, 0, 0, 0, 1, 1,
-0.8926592, -0.7170979, -1.955052, 0, 0, 0, 1, 1,
-0.8912251, 0.3956489, -3.494718, 0, 0, 0, 1, 1,
-0.8883229, -0.3473987, -2.564228, 0, 0, 0, 1, 1,
-0.8858331, 0.3625048, -1.47337, 1, 1, 1, 1, 1,
-0.8850742, -0.4583389, -2.255572, 1, 1, 1, 1, 1,
-0.8830652, -0.9950362, -0.2306543, 1, 1, 1, 1, 1,
-0.878867, -0.3695702, 0.3756855, 1, 1, 1, 1, 1,
-0.8689009, 1.015975, -2.109259, 1, 1, 1, 1, 1,
-0.8496922, 0.3888752, -0.9603678, 1, 1, 1, 1, 1,
-0.8437122, -1.178178, -2.705261, 1, 1, 1, 1, 1,
-0.841252, -0.8815477, -2.571786, 1, 1, 1, 1, 1,
-0.8369658, -0.01892329, -2.128793, 1, 1, 1, 1, 1,
-0.8364656, -1.490562, -3.661491, 1, 1, 1, 1, 1,
-0.8364374, 1.570779, 0.04559939, 1, 1, 1, 1, 1,
-0.8302431, 2.859326, 2.289553, 1, 1, 1, 1, 1,
-0.8276342, 1.099514, -0.9350199, 1, 1, 1, 1, 1,
-0.8240164, -0.06446722, -0.358324, 1, 1, 1, 1, 1,
-0.8238176, 1.273406, -2.500457, 1, 1, 1, 1, 1,
-0.8230373, -0.8355, -3.373806, 0, 0, 1, 1, 1,
-0.8215144, 1.509076, -1.370147, 1, 0, 0, 1, 1,
-0.8202305, -0.3455516, -1.051983, 1, 0, 0, 1, 1,
-0.820124, 0.7061561, -0.9794586, 1, 0, 0, 1, 1,
-0.8161958, 0.008558832, -2.507683, 1, 0, 0, 1, 1,
-0.810087, -0.758224, -4.254469, 1, 0, 0, 1, 1,
-0.805419, 0.3397243, -1.68405, 0, 0, 0, 1, 1,
-0.8014747, 1.207206, 0.2911471, 0, 0, 0, 1, 1,
-0.8006763, 0.2987664, -0.9410125, 0, 0, 0, 1, 1,
-0.799051, -0.08646509, -1.844528, 0, 0, 0, 1, 1,
-0.7979248, -0.6532452, -3.106414, 0, 0, 0, 1, 1,
-0.7905856, 1.239649, -2.314344, 0, 0, 0, 1, 1,
-0.7870739, 0.5868765, -1.274179, 0, 0, 0, 1, 1,
-0.7799371, -0.1573176, -0.6327806, 1, 1, 1, 1, 1,
-0.7740406, 0.6091957, 0.5984316, 1, 1, 1, 1, 1,
-0.7730275, -1.180549, -4.697469, 1, 1, 1, 1, 1,
-0.7715846, -1.090111, -2.749682, 1, 1, 1, 1, 1,
-0.7715307, 1.657447, -0.1932671, 1, 1, 1, 1, 1,
-0.7691132, 1.525009, -1.898565, 1, 1, 1, 1, 1,
-0.7640435, 0.09960151, -1.519386, 1, 1, 1, 1, 1,
-0.763299, 1.277329, 2.567819, 1, 1, 1, 1, 1,
-0.7597317, 0.3567275, 0.1181058, 1, 1, 1, 1, 1,
-0.7589871, 0.2401967, -1.968415, 1, 1, 1, 1, 1,
-0.7572878, -2.607553, -4.545428, 1, 1, 1, 1, 1,
-0.7500298, 0.981735, 2.145911, 1, 1, 1, 1, 1,
-0.7489973, 1.983617, -0.3874956, 1, 1, 1, 1, 1,
-0.746195, 1.030842, 0.0354916, 1, 1, 1, 1, 1,
-0.7461832, 1.472379, -0.8034564, 1, 1, 1, 1, 1,
-0.7441788, -0.9024702, -2.455716, 0, 0, 1, 1, 1,
-0.7427767, -0.3292137, -2.233719, 1, 0, 0, 1, 1,
-0.7392545, 0.1998598, -0.7514201, 1, 0, 0, 1, 1,
-0.7383369, -0.1881663, -2.367409, 1, 0, 0, 1, 1,
-0.7364519, -2.113695, -2.543261, 1, 0, 0, 1, 1,
-0.7363632, -0.3858637, -1.776025, 1, 0, 0, 1, 1,
-0.7360535, 1.073509, -0.1073979, 0, 0, 0, 1, 1,
-0.7334353, -0.7228712, -2.193069, 0, 0, 0, 1, 1,
-0.7250527, -1.543307, -1.95166, 0, 0, 0, 1, 1,
-0.7228497, -0.5492208, -1.778447, 0, 0, 0, 1, 1,
-0.7199082, -0.07036118, -1.302539, 0, 0, 0, 1, 1,
-0.718627, 1.221379, -1.989575, 0, 0, 0, 1, 1,
-0.7165457, -1.02947, -0.9271613, 0, 0, 0, 1, 1,
-0.7129701, -1.016099, -2.171773, 1, 1, 1, 1, 1,
-0.7120386, 0.2503511, -1.198549, 1, 1, 1, 1, 1,
-0.7054958, 0.03974994, -0.05120418, 1, 1, 1, 1, 1,
-0.7018834, -0.5335718, -2.731002, 1, 1, 1, 1, 1,
-0.697253, 1.445763, 0.5387444, 1, 1, 1, 1, 1,
-0.6882872, -1.945226, -4.279173, 1, 1, 1, 1, 1,
-0.687324, 0.9625649, 0.5685905, 1, 1, 1, 1, 1,
-0.6804644, -0.04266192, -2.598004, 1, 1, 1, 1, 1,
-0.6790831, 0.003346829, -2.093309, 1, 1, 1, 1, 1,
-0.6781759, 0.7476087, -3.006723, 1, 1, 1, 1, 1,
-0.6698937, 0.8302793, -1.480281, 1, 1, 1, 1, 1,
-0.6665772, -1.011763, -3.248395, 1, 1, 1, 1, 1,
-0.6635588, 1.199417, -1.583781, 1, 1, 1, 1, 1,
-0.659937, 1.410145, -0.3968931, 1, 1, 1, 1, 1,
-0.6551777, -0.1626301, -2.605621, 1, 1, 1, 1, 1,
-0.6500347, -0.1470972, -1.25133, 0, 0, 1, 1, 1,
-0.642069, 0.4214276, -0.8468112, 1, 0, 0, 1, 1,
-0.641784, 0.8300951, -2.559292, 1, 0, 0, 1, 1,
-0.6391852, 1.001259, -2.658195, 1, 0, 0, 1, 1,
-0.6374826, 1.532032, -0.08874884, 1, 0, 0, 1, 1,
-0.6352525, 1.730274, 1.223375, 1, 0, 0, 1, 1,
-0.6331354, 1.002222, 1.362928, 0, 0, 0, 1, 1,
-0.6319253, -0.2348437, 0.2460674, 0, 0, 0, 1, 1,
-0.6316856, -2.124612, -3.001724, 0, 0, 0, 1, 1,
-0.6282176, -1.435609, -2.754181, 0, 0, 0, 1, 1,
-0.6280401, 0.6570851, -0.9987078, 0, 0, 0, 1, 1,
-0.6264839, 2.047473, 1.596711, 0, 0, 0, 1, 1,
-0.6192064, -0.5322723, -3.422974, 0, 0, 0, 1, 1,
-0.6157418, 0.00978898, -0.9874102, 1, 1, 1, 1, 1,
-0.6156845, -0.5343031, -1.317284, 1, 1, 1, 1, 1,
-0.6094205, -0.4456891, -2.235123, 1, 1, 1, 1, 1,
-0.6091141, -0.8343577, -1.762186, 1, 1, 1, 1, 1,
-0.6059961, -1.43441, 0.7796425, 1, 1, 1, 1, 1,
-0.5995056, 2.460667, 0.2714525, 1, 1, 1, 1, 1,
-0.5920804, -1.317151, -3.507608, 1, 1, 1, 1, 1,
-0.5916603, 0.4459476, -0.07916387, 1, 1, 1, 1, 1,
-0.5908888, 0.4770023, -1.054738, 1, 1, 1, 1, 1,
-0.5907753, -0.3959085, -2.394289, 1, 1, 1, 1, 1,
-0.5883353, 0.04715218, -0.3265476, 1, 1, 1, 1, 1,
-0.5828698, 0.3510166, -1.73807, 1, 1, 1, 1, 1,
-0.5799493, 0.3938627, -2.230174, 1, 1, 1, 1, 1,
-0.5757216, -2.207659, -3.962868, 1, 1, 1, 1, 1,
-0.5699528, -1.562538, -1.738265, 1, 1, 1, 1, 1,
-0.5541493, 0.8677396, 0.3541048, 0, 0, 1, 1, 1,
-0.5515764, 0.02188242, -1.833664, 1, 0, 0, 1, 1,
-0.5503442, -0.409897, -3.411138, 1, 0, 0, 1, 1,
-0.5501372, 0.01235296, -3.049607, 1, 0, 0, 1, 1,
-0.5453727, 0.4858794, -0.04982302, 1, 0, 0, 1, 1,
-0.5444799, 0.9641533, -0.777458, 1, 0, 0, 1, 1,
-0.5420593, -1.218198, -1.326849, 0, 0, 0, 1, 1,
-0.5416526, 0.8599153, -0.2406564, 0, 0, 0, 1, 1,
-0.5392483, -0.7018728, -2.79077, 0, 0, 0, 1, 1,
-0.5389715, -1.795351, -4.279543, 0, 0, 0, 1, 1,
-0.5319983, -0.8658943, -1.539095, 0, 0, 0, 1, 1,
-0.5315922, 0.8632203, -0.9834765, 0, 0, 0, 1, 1,
-0.530257, -0.2982479, -2.652179, 0, 0, 0, 1, 1,
-0.5286893, 0.1931843, -1.125925, 1, 1, 1, 1, 1,
-0.5237896, -0.3756248, -3.310132, 1, 1, 1, 1, 1,
-0.5213367, -0.8904387, -2.174421, 1, 1, 1, 1, 1,
-0.520212, 0.3847829, -1.026, 1, 1, 1, 1, 1,
-0.5171852, 0.3857423, -1.19105, 1, 1, 1, 1, 1,
-0.5156171, -0.08887079, -0.7691805, 1, 1, 1, 1, 1,
-0.5134767, 0.08300118, 0.2292818, 1, 1, 1, 1, 1,
-0.5122672, 0.04589904, -1.779127, 1, 1, 1, 1, 1,
-0.5102142, -1.015081, -1.495763, 1, 1, 1, 1, 1,
-0.5079589, 0.7571424, -1.45329, 1, 1, 1, 1, 1,
-0.5079418, -2.116571, -2.532426, 1, 1, 1, 1, 1,
-0.5053548, -1.885722, -2.453371, 1, 1, 1, 1, 1,
-0.5023975, -1.160696, -3.003742, 1, 1, 1, 1, 1,
-0.5012136, 1.188816, 0.9448328, 1, 1, 1, 1, 1,
-0.4947234, -0.1215968, -2.17114, 1, 1, 1, 1, 1,
-0.4940412, 2.51588, 2.38715, 0, 0, 1, 1, 1,
-0.4928906, 0.2863887, -2.340328, 1, 0, 0, 1, 1,
-0.4927877, -2.050087, -5.360321, 1, 0, 0, 1, 1,
-0.487216, 0.1255884, -1.867301, 1, 0, 0, 1, 1,
-0.486379, -0.3483183, -1.350008, 1, 0, 0, 1, 1,
-0.4862555, -0.06728311, -3.551877, 1, 0, 0, 1, 1,
-0.4842806, 0.3464301, -1.260639, 0, 0, 0, 1, 1,
-0.4804415, -2.242019, -3.304457, 0, 0, 0, 1, 1,
-0.480151, -0.8173894, -1.279859, 0, 0, 0, 1, 1,
-0.4782378, 0.5027607, 0.1703204, 0, 0, 0, 1, 1,
-0.4761159, 0.1414726, -2.80909, 0, 0, 0, 1, 1,
-0.4743184, -0.6733273, -2.88602, 0, 0, 0, 1, 1,
-0.4624821, -0.3546658, -1.228264, 0, 0, 0, 1, 1,
-0.4617268, 0.4389368, -1.973153, 1, 1, 1, 1, 1,
-0.4569211, -1.707454, -2.878612, 1, 1, 1, 1, 1,
-0.4557038, 0.6220191, 0.04493849, 1, 1, 1, 1, 1,
-0.4552192, 0.5823288, -0.4895055, 1, 1, 1, 1, 1,
-0.4539509, 0.4377089, -1.158213, 1, 1, 1, 1, 1,
-0.4497484, -0.04455295, -1.175268, 1, 1, 1, 1, 1,
-0.4473694, -1.474136, -2.906085, 1, 1, 1, 1, 1,
-0.445127, -0.7120906, -3.240779, 1, 1, 1, 1, 1,
-0.438693, -1.064369, -4.152878, 1, 1, 1, 1, 1,
-0.4342726, 1.149818, -0.6720845, 1, 1, 1, 1, 1,
-0.4338304, 0.9557564, -2.477699, 1, 1, 1, 1, 1,
-0.4327494, 1.002571, -1.173219, 1, 1, 1, 1, 1,
-0.431527, 1.072482, -0.8234772, 1, 1, 1, 1, 1,
-0.4311983, -0.4938715, -1.460624, 1, 1, 1, 1, 1,
-0.4264764, -1.004175, -4.355127, 1, 1, 1, 1, 1,
-0.4240295, 1.203298, -1.180872, 0, 0, 1, 1, 1,
-0.4181553, -0.980745, -2.311774, 1, 0, 0, 1, 1,
-0.4169949, -0.5571856, -2.350307, 1, 0, 0, 1, 1,
-0.4165308, -0.2127765, -1.418533, 1, 0, 0, 1, 1,
-0.4157778, 0.7930707, -1.805315, 1, 0, 0, 1, 1,
-0.4122761, -0.8994438, -1.675366, 1, 0, 0, 1, 1,
-0.4120725, -1.211319, 0.5466614, 0, 0, 0, 1, 1,
-0.4117919, 0.4917574, 0.8579215, 0, 0, 0, 1, 1,
-0.4115953, 0.3263304, -1.230812, 0, 0, 0, 1, 1,
-0.4097303, -0.6324441, -2.158007, 0, 0, 0, 1, 1,
-0.4088416, 0.1673737, -0.494276, 0, 0, 0, 1, 1,
-0.4030595, -0.04979016, -1.491512, 0, 0, 0, 1, 1,
-0.3992756, -0.05700338, 0.3737333, 0, 0, 0, 1, 1,
-0.3991048, -0.7673024, -2.804386, 1, 1, 1, 1, 1,
-0.3972442, -0.2009538, -3.86176, 1, 1, 1, 1, 1,
-0.3958421, -0.07964239, -2.080233, 1, 1, 1, 1, 1,
-0.3944277, 0.6661694, -0.7618181, 1, 1, 1, 1, 1,
-0.3917723, -1.225849, -3.135589, 1, 1, 1, 1, 1,
-0.3894872, -0.05223429, -2.257396, 1, 1, 1, 1, 1,
-0.3885365, 1.063934, -1.920259, 1, 1, 1, 1, 1,
-0.3797118, 0.7356278, -0.04812975, 1, 1, 1, 1, 1,
-0.3794254, -1.515015, -4.865844, 1, 1, 1, 1, 1,
-0.3789201, -0.3248001, -1.739875, 1, 1, 1, 1, 1,
-0.3759916, -2.672031, -4.00127, 1, 1, 1, 1, 1,
-0.3759028, -0.08902091, -2.315996, 1, 1, 1, 1, 1,
-0.3757991, -1.498733, -1.492387, 1, 1, 1, 1, 1,
-0.3746616, -0.1944574, -1.671541, 1, 1, 1, 1, 1,
-0.3734939, 1.285536, 0.3010463, 1, 1, 1, 1, 1,
-0.3720775, -0.06686234, -1.800087, 0, 0, 1, 1, 1,
-0.3706299, 0.5105824, -1.449095, 1, 0, 0, 1, 1,
-0.3691231, -1.800032, -3.600155, 1, 0, 0, 1, 1,
-0.3625591, 0.10999, -1.451275, 1, 0, 0, 1, 1,
-0.3586884, -0.6976996, -2.513381, 1, 0, 0, 1, 1,
-0.354936, -0.5578467, -1.65963, 1, 0, 0, 1, 1,
-0.3526334, -0.3540389, -3.026253, 0, 0, 0, 1, 1,
-0.3516231, -1.164013, -2.723092, 0, 0, 0, 1, 1,
-0.3485395, -1.588617, -2.620729, 0, 0, 0, 1, 1,
-0.3433544, 0.03055413, -0.7364611, 0, 0, 0, 1, 1,
-0.3419208, 1.546643, -1.563226, 0, 0, 0, 1, 1,
-0.3341869, 0.9640927, 1.45155, 0, 0, 0, 1, 1,
-0.3336293, -0.8938058, -2.532723, 0, 0, 0, 1, 1,
-0.3299321, 1.486597, 0.6282361, 1, 1, 1, 1, 1,
-0.3267334, 0.6980967, 0.467827, 1, 1, 1, 1, 1,
-0.325956, -0.1741016, -4.913974, 1, 1, 1, 1, 1,
-0.3203551, -0.7066606, -2.674035, 1, 1, 1, 1, 1,
-0.318347, 0.5597545, 0.2377274, 1, 1, 1, 1, 1,
-0.3144068, 0.9282961, -0.8377214, 1, 1, 1, 1, 1,
-0.3140916, -0.5625995, -3.530984, 1, 1, 1, 1, 1,
-0.3122191, 0.2330831, -1.170512, 1, 1, 1, 1, 1,
-0.3074658, 0.7179552, -0.5488197, 1, 1, 1, 1, 1,
-0.3057832, -0.2138496, -3.002014, 1, 1, 1, 1, 1,
-0.3056138, -0.2666323, -1.431505, 1, 1, 1, 1, 1,
-0.3047183, -0.4360038, -2.467811, 1, 1, 1, 1, 1,
-0.3031156, -0.02189551, 1.42799, 1, 1, 1, 1, 1,
-0.3019338, 1.361241, 0.9853663, 1, 1, 1, 1, 1,
-0.2998967, -0.5399041, -4.13189, 1, 1, 1, 1, 1,
-0.2993425, -0.05829439, -2.082979, 0, 0, 1, 1, 1,
-0.2868879, 0.1389126, -2.009775, 1, 0, 0, 1, 1,
-0.2862085, -1.211143, -1.541032, 1, 0, 0, 1, 1,
-0.2857465, 0.8089892, -1.021956, 1, 0, 0, 1, 1,
-0.2848401, 1.366078, -0.4498075, 1, 0, 0, 1, 1,
-0.2840174, 0.439896, 1.840121, 1, 0, 0, 1, 1,
-0.2836106, -0.4339159, -2.391899, 0, 0, 0, 1, 1,
-0.281616, 1.611495, -1.300862, 0, 0, 0, 1, 1,
-0.2791603, -0.4399658, -1.79811, 0, 0, 0, 1, 1,
-0.2789825, -0.1184001, -1.205086, 0, 0, 0, 1, 1,
-0.275708, -0.2541807, -1.620492, 0, 0, 0, 1, 1,
-0.2750663, 1.746332, 0.4217595, 0, 0, 0, 1, 1,
-0.2711368, 0.2435499, -0.9406652, 0, 0, 0, 1, 1,
-0.2698449, 0.734467, -0.7658501, 1, 1, 1, 1, 1,
-0.2670789, 1.182976, -0.1340795, 1, 1, 1, 1, 1,
-0.2662013, 0.5652505, 0.1205332, 1, 1, 1, 1, 1,
-0.2653658, 1.560671, -0.08621877, 1, 1, 1, 1, 1,
-0.2651216, 0.2610958, -1.086231, 1, 1, 1, 1, 1,
-0.2642354, 0.7446327, 0.1269552, 1, 1, 1, 1, 1,
-0.263447, 1.027013, 0.3136103, 1, 1, 1, 1, 1,
-0.2630342, -0.1355653, -3.305785, 1, 1, 1, 1, 1,
-0.2603049, 0.745003, 0.2896293, 1, 1, 1, 1, 1,
-0.2595748, -0.04464182, -2.187598, 1, 1, 1, 1, 1,
-0.2582064, -0.5335827, -3.902457, 1, 1, 1, 1, 1,
-0.2558346, 0.6573511, -1.297944, 1, 1, 1, 1, 1,
-0.2558248, 1.573638, -0.3603194, 1, 1, 1, 1, 1,
-0.2556018, 0.03404898, -0.8892013, 1, 1, 1, 1, 1,
-0.2544513, -0.7002996, -3.310721, 1, 1, 1, 1, 1,
-0.2510604, -1.924783, -2.755388, 0, 0, 1, 1, 1,
-0.2500034, -0.9733022, -2.83824, 1, 0, 0, 1, 1,
-0.2497383, -0.523414, -3.437768, 1, 0, 0, 1, 1,
-0.2495062, 0.1488029, -0.1592986, 1, 0, 0, 1, 1,
-0.246801, -0.1251437, -1.608172, 1, 0, 0, 1, 1,
-0.244789, -0.9036754, -1.897071, 1, 0, 0, 1, 1,
-0.2388689, 1.390832, -1.219697, 0, 0, 0, 1, 1,
-0.2385911, 0.495718, 0.1517156, 0, 0, 0, 1, 1,
-0.237151, 2.280747, -3.277447, 0, 0, 0, 1, 1,
-0.2360569, 1.436442, 0.4528857, 0, 0, 0, 1, 1,
-0.2359589, -0.5238914, -2.208793, 0, 0, 0, 1, 1,
-0.2347885, -0.4465638, -1.635361, 0, 0, 0, 1, 1,
-0.2308248, 0.8410334, 0.1752827, 0, 0, 0, 1, 1,
-0.2301125, -1.494564, -2.65753, 1, 1, 1, 1, 1,
-0.2300206, -0.5880609, -2.280644, 1, 1, 1, 1, 1,
-0.2259341, 3.010236, -0.7580478, 1, 1, 1, 1, 1,
-0.2230339, -0.3609942, -2.814488, 1, 1, 1, 1, 1,
-0.2179781, -1.221972, -2.073049, 1, 1, 1, 1, 1,
-0.2163151, -1.770695, -3.099245, 1, 1, 1, 1, 1,
-0.2158972, -0.03937874, -1.496744, 1, 1, 1, 1, 1,
-0.2155906, 1.276574, -0.8906786, 1, 1, 1, 1, 1,
-0.2137486, -0.5487686, -3.236362, 1, 1, 1, 1, 1,
-0.2104677, 0.411893, -1.165446, 1, 1, 1, 1, 1,
-0.2097497, -0.6064476, -3.185588, 1, 1, 1, 1, 1,
-0.2069217, -1.405466, -2.221541, 1, 1, 1, 1, 1,
-0.2061047, 0.3743547, -1.101005, 1, 1, 1, 1, 1,
-0.2055098, -0.1809438, -3.613846, 1, 1, 1, 1, 1,
-0.2037714, -0.6915145, -1.48446, 1, 1, 1, 1, 1,
-0.2018928, -0.2916245, -1.309782, 0, 0, 1, 1, 1,
-0.2017347, -1.664318, -4.385808, 1, 0, 0, 1, 1,
-0.1996464, -0.2826293, -1.479559, 1, 0, 0, 1, 1,
-0.1982486, 1.008212, -0.4358912, 1, 0, 0, 1, 1,
-0.1972927, -1.764907, -3.385995, 1, 0, 0, 1, 1,
-0.1962096, -0.1161593, -0.6376633, 1, 0, 0, 1, 1,
-0.1955742, 0.2461034, -1.003505, 0, 0, 0, 1, 1,
-0.1929455, 0.3584765, 1.274476, 0, 0, 0, 1, 1,
-0.191974, -1.936537, -2.028827, 0, 0, 0, 1, 1,
-0.1853654, 0.6262079, 0.9887109, 0, 0, 0, 1, 1,
-0.1849875, -2.399452, -3.349881, 0, 0, 0, 1, 1,
-0.184533, -0.6973346, -3.973955, 0, 0, 0, 1, 1,
-0.1830897, 0.03986029, -0.9172426, 0, 0, 0, 1, 1,
-0.1819384, -1.150976, -1.496763, 1, 1, 1, 1, 1,
-0.1800022, -2.089034, -1.578338, 1, 1, 1, 1, 1,
-0.1794651, 0.1132981, -1.432347, 1, 1, 1, 1, 1,
-0.1770011, 1.37971, 0.0211743, 1, 1, 1, 1, 1,
-0.1760782, 0.1046184, 0.5550873, 1, 1, 1, 1, 1,
-0.1756564, -1.691502, -4.118032, 1, 1, 1, 1, 1,
-0.1717755, 0.3335258, 0.06262701, 1, 1, 1, 1, 1,
-0.16823, -0.354852, -2.744234, 1, 1, 1, 1, 1,
-0.1610924, -0.3232658, -4.062543, 1, 1, 1, 1, 1,
-0.1544676, -0.5370446, -2.59878, 1, 1, 1, 1, 1,
-0.1538907, 0.7883576, -2.299858, 1, 1, 1, 1, 1,
-0.1525604, 0.7760402, 1.169075, 1, 1, 1, 1, 1,
-0.1515813, -1.308079, -2.21051, 1, 1, 1, 1, 1,
-0.1500878, 0.8162302, 0.01192752, 1, 1, 1, 1, 1,
-0.1479435, -0.4072897, -1.990364, 1, 1, 1, 1, 1,
-0.135342, -0.7127898, -2.666356, 0, 0, 1, 1, 1,
-0.1351982, 0.5428233, -1.53022, 1, 0, 0, 1, 1,
-0.1210009, -1.116185, -4.522193, 1, 0, 0, 1, 1,
-0.1209007, -0.8104798, -4.584707, 1, 0, 0, 1, 1,
-0.1200824, 1.943544, 1.336781, 1, 0, 0, 1, 1,
-0.1120303, -1.362074, -3.290629, 1, 0, 0, 1, 1,
-0.1110995, -0.1838717, -3.263999, 0, 0, 0, 1, 1,
-0.1102248, 2.045086, -0.7499359, 0, 0, 0, 1, 1,
-0.1075767, 0.5755929, -0.8559518, 0, 0, 0, 1, 1,
-0.1063727, 1.377438, -1.15871, 0, 0, 0, 1, 1,
-0.1057585, -0.3498064, -5.361017, 0, 0, 0, 1, 1,
-0.09194814, -0.6010435, -3.295372, 0, 0, 0, 1, 1,
-0.09128907, 0.09426443, 0.01459209, 0, 0, 0, 1, 1,
-0.09017944, 0.5798093, -0.4774266, 1, 1, 1, 1, 1,
-0.08860365, -2.280679, -2.985569, 1, 1, 1, 1, 1,
-0.07964993, -1.829706, -3.007657, 1, 1, 1, 1, 1,
-0.07913694, -0.6775017, -2.83888, 1, 1, 1, 1, 1,
-0.07770912, 0.495081, 0.6209764, 1, 1, 1, 1, 1,
-0.07430467, 0.2139774, -2.265976, 1, 1, 1, 1, 1,
-0.07317694, 0.5209094, -0.8428999, 1, 1, 1, 1, 1,
-0.07315329, 0.7710196, -0.3086448, 1, 1, 1, 1, 1,
-0.07169855, 0.1131327, 0.9033042, 1, 1, 1, 1, 1,
-0.07002421, 0.5573479, 0.08524817, 1, 1, 1, 1, 1,
-0.06989077, 0.2023599, -1.140768, 1, 1, 1, 1, 1,
-0.06608897, -0.9872921, -2.30253, 1, 1, 1, 1, 1,
-0.06566735, -0.374241, -2.192362, 1, 1, 1, 1, 1,
-0.06094456, 0.8408608, -0.9246449, 1, 1, 1, 1, 1,
-0.06054853, -0.7642521, -1.915056, 1, 1, 1, 1, 1,
-0.05976677, 0.2465957, 2.33031, 0, 0, 1, 1, 1,
-0.05920588, -0.6149151, -3.087493, 1, 0, 0, 1, 1,
-0.05715283, 0.4072459, -0.04984161, 1, 0, 0, 1, 1,
-0.05384709, 1.333368, 1.495525, 1, 0, 0, 1, 1,
-0.05361777, 1.298271, -0.5723101, 1, 0, 0, 1, 1,
-0.05360806, 1.468321, -0.2556129, 1, 0, 0, 1, 1,
-0.05337087, 1.028606, 0.87841, 0, 0, 0, 1, 1,
-0.04994081, -1.05573, -3.723003, 0, 0, 0, 1, 1,
-0.04913344, 1.295743, -0.9311965, 0, 0, 0, 1, 1,
-0.04159242, 2.565491, -1.083618, 0, 0, 0, 1, 1,
-0.0410691, 0.225588, -1.227914, 0, 0, 0, 1, 1,
-0.03976145, 0.2169259, -0.6726806, 0, 0, 0, 1, 1,
-0.03973851, 0.5051874, -0.7266888, 0, 0, 0, 1, 1,
-0.03880209, 0.644043, -0.9092723, 1, 1, 1, 1, 1,
-0.0380547, -0.6422734, -2.114691, 1, 1, 1, 1, 1,
-0.03469222, 0.745771, 0.8263514, 1, 1, 1, 1, 1,
-0.03028447, -1.163238, -0.6122671, 1, 1, 1, 1, 1,
-0.02818395, -0.424266, -2.580927, 1, 1, 1, 1, 1,
-0.02713992, 2.100032, -0.8786004, 1, 1, 1, 1, 1,
-0.02455324, 1.059772, -1.146174, 1, 1, 1, 1, 1,
-0.02258556, -0.2411166, -2.194243, 1, 1, 1, 1, 1,
-0.009926819, 1.537951, -0.9904252, 1, 1, 1, 1, 1,
-0.009144772, 0.5915588, -0.01392719, 1, 1, 1, 1, 1,
-0.006223013, 0.3936705, 0.6434529, 1, 1, 1, 1, 1,
-0.001722864, -2.829213, -2.835443, 1, 1, 1, 1, 1,
-0.0002908078, 1.012427, -0.4929748, 1, 1, 1, 1, 1,
0.001312036, 0.8868035, 0.6354705, 1, 1, 1, 1, 1,
0.007292719, -0.3463358, 3.342084, 1, 1, 1, 1, 1,
0.01268997, -0.7238503, 2.208244, 0, 0, 1, 1, 1,
0.01304459, 0.1697571, 1.874787, 1, 0, 0, 1, 1,
0.0161207, -0.4634652, 2.874971, 1, 0, 0, 1, 1,
0.01742432, -1.140113, 3.903451, 1, 0, 0, 1, 1,
0.01754403, -1.194824, 1.678106, 1, 0, 0, 1, 1,
0.0188688, -0.6275372, 3.532745, 1, 0, 0, 1, 1,
0.01966963, -0.9066051, 2.359898, 0, 0, 0, 1, 1,
0.01971573, 0.9198489, -0.3382874, 0, 0, 0, 1, 1,
0.02312966, 0.3440882, -1.910877, 0, 0, 0, 1, 1,
0.02327402, 0.1836139, -0.8048791, 0, 0, 0, 1, 1,
0.02509985, -0.7207386, 0.9344888, 0, 0, 0, 1, 1,
0.03021057, -0.1419885, 1.455058, 0, 0, 0, 1, 1,
0.03416337, 0.6135064, 1.758675, 0, 0, 0, 1, 1,
0.03843688, -0.005321903, 1.741013, 1, 1, 1, 1, 1,
0.04304878, -0.2774196, 3.451872, 1, 1, 1, 1, 1,
0.04375985, 0.4307918, 0.6393396, 1, 1, 1, 1, 1,
0.04393141, 0.9683238, -1.388952, 1, 1, 1, 1, 1,
0.04481414, -0.4553233, 3.574573, 1, 1, 1, 1, 1,
0.04484995, 0.1254945, -0.8381811, 1, 1, 1, 1, 1,
0.04599549, -0.6751899, 3.732409, 1, 1, 1, 1, 1,
0.04787205, 0.8955895, 0.2423272, 1, 1, 1, 1, 1,
0.05030355, 0.3797019, 0.7953236, 1, 1, 1, 1, 1,
0.05717368, 0.88963, 0.2582681, 1, 1, 1, 1, 1,
0.05857752, 0.1304967, 0.4271997, 1, 1, 1, 1, 1,
0.06025431, 0.9467373, -0.1632364, 1, 1, 1, 1, 1,
0.06367941, 0.1583722, 1.278747, 1, 1, 1, 1, 1,
0.06631805, -0.7697418, 4.823581, 1, 1, 1, 1, 1,
0.06639634, 0.3518133, 0.4130186, 1, 1, 1, 1, 1,
0.07330316, -1.283351, 2.997831, 0, 0, 1, 1, 1,
0.07952717, 1.665193, 0.1013376, 1, 0, 0, 1, 1,
0.08166236, 0.8466007, 0.5939858, 1, 0, 0, 1, 1,
0.08468148, -0.3963199, 0.9994439, 1, 0, 0, 1, 1,
0.08567104, 0.3702176, 0.6011279, 1, 0, 0, 1, 1,
0.1032782, 0.4844056, -0.3972963, 1, 0, 0, 1, 1,
0.1052673, -0.225856, 0.9023902, 0, 0, 0, 1, 1,
0.1114039, -0.8149486, 3.334326, 0, 0, 0, 1, 1,
0.1138669, 0.6156713, -1.631274, 0, 0, 0, 1, 1,
0.1162439, -0.4723663, 1.585622, 0, 0, 0, 1, 1,
0.1163912, 0.6033829, 1.470696, 0, 0, 0, 1, 1,
0.1167338, 0.621055, -1.422738, 0, 0, 0, 1, 1,
0.1200284, -0.8974448, 2.439617, 0, 0, 0, 1, 1,
0.1222249, -1.370557, 2.823436, 1, 1, 1, 1, 1,
0.1246153, 0.1472024, 1.209922, 1, 1, 1, 1, 1,
0.1250972, 1.327617, 0.1288189, 1, 1, 1, 1, 1,
0.1284382, 0.4537464, 0.3595408, 1, 1, 1, 1, 1,
0.1323455, 1.116651, 0.220381, 1, 1, 1, 1, 1,
0.1354385, 0.003003674, 2.070593, 1, 1, 1, 1, 1,
0.1394944, -1.131489, 3.087902, 1, 1, 1, 1, 1,
0.1412316, -0.262081, 3.906087, 1, 1, 1, 1, 1,
0.1435833, 0.7725482, -0.1257236, 1, 1, 1, 1, 1,
0.1454718, -0.9816414, 2.614085, 1, 1, 1, 1, 1,
0.1474447, -0.1887503, 3.795418, 1, 1, 1, 1, 1,
0.1512523, -0.668504, 3.13552, 1, 1, 1, 1, 1,
0.1537567, 0.9116553, 0.1456216, 1, 1, 1, 1, 1,
0.1549559, 0.5071114, 0.467275, 1, 1, 1, 1, 1,
0.1561862, -1.089422, 4.268431, 1, 1, 1, 1, 1,
0.1613305, 0.108782, 0.6140079, 0, 0, 1, 1, 1,
0.1619722, 0.642673, 0.9275334, 1, 0, 0, 1, 1,
0.1695748, -0.2709742, 1.735592, 1, 0, 0, 1, 1,
0.1701385, 0.4575169, -0.2796005, 1, 0, 0, 1, 1,
0.1724819, -1.191168, 2.675793, 1, 0, 0, 1, 1,
0.1783907, 0.577406, 1.446548, 1, 0, 0, 1, 1,
0.1790135, 0.08873598, -0.2575491, 0, 0, 0, 1, 1,
0.1792381, 0.4645003, 0.9487805, 0, 0, 0, 1, 1,
0.1813856, -0.9147476, 3.461164, 0, 0, 0, 1, 1,
0.1835547, -1.261188, 3.332758, 0, 0, 0, 1, 1,
0.1871396, 0.9120697, -0.2279803, 0, 0, 0, 1, 1,
0.1874316, 1.272263, 0.9141209, 0, 0, 0, 1, 1,
0.1917033, -2.382704, 2.163604, 0, 0, 0, 1, 1,
0.1951984, 0.05324424, 2.413814, 1, 1, 1, 1, 1,
0.1974277, 1.121105, 1.074515, 1, 1, 1, 1, 1,
0.2046485, -0.2716789, 1.706117, 1, 1, 1, 1, 1,
0.2054422, -0.4657045, 5.175166, 1, 1, 1, 1, 1,
0.2086751, -0.3739524, 3.080745, 1, 1, 1, 1, 1,
0.2151856, 0.2925727, 0.7343557, 1, 1, 1, 1, 1,
0.2153997, -0.8820071, 5.009847, 1, 1, 1, 1, 1,
0.2154407, 0.01244385, 0.5265774, 1, 1, 1, 1, 1,
0.2156853, 1.509436, 0.8157475, 1, 1, 1, 1, 1,
0.2168606, -0.8731757, 1.57362, 1, 1, 1, 1, 1,
0.2182744, 0.5469009, -0.06602018, 1, 1, 1, 1, 1,
0.223571, 1.043022, 0.4502164, 1, 1, 1, 1, 1,
0.2247609, -0.6018184, 4.376957, 1, 1, 1, 1, 1,
0.2266165, -1.438279, 4.387837, 1, 1, 1, 1, 1,
0.2279533, -0.3237116, 3.371183, 1, 1, 1, 1, 1,
0.2287925, -0.7101852, 2.274846, 0, 0, 1, 1, 1,
0.2310051, -1.025721, 2.003288, 1, 0, 0, 1, 1,
0.2310104, -0.3640791, 2.676827, 1, 0, 0, 1, 1,
0.2325083, 0.4243675, 1.118833, 1, 0, 0, 1, 1,
0.2425551, -0.6920804, 0.5981429, 1, 0, 0, 1, 1,
0.2480669, -1.66657, 0.2213269, 1, 0, 0, 1, 1,
0.2498132, -0.4532807, 1.470971, 0, 0, 0, 1, 1,
0.2498636, 0.4274624, -0.9034757, 0, 0, 0, 1, 1,
0.2507931, -0.174071, 3.458622, 0, 0, 0, 1, 1,
0.2558644, -0.2687717, 3.085385, 0, 0, 0, 1, 1,
0.2588466, 0.2659557, -1.68916, 0, 0, 0, 1, 1,
0.2597154, 0.5562156, 0.3119864, 0, 0, 0, 1, 1,
0.2603388, 0.2821147, 0.9826703, 0, 0, 0, 1, 1,
0.2629422, -0.1672336, 1.772232, 1, 1, 1, 1, 1,
0.2632796, -0.1866531, 2.595676, 1, 1, 1, 1, 1,
0.2638415, -1.585207, 1.810368, 1, 1, 1, 1, 1,
0.2649379, -0.2243397, 1.818053, 1, 1, 1, 1, 1,
0.2712207, -0.9157092, 2.062558, 1, 1, 1, 1, 1,
0.271567, 0.9813526, -0.3538011, 1, 1, 1, 1, 1,
0.2820866, -0.4135253, 1.466942, 1, 1, 1, 1, 1,
0.2822185, -0.9414946, 4.507315, 1, 1, 1, 1, 1,
0.2836331, -0.4970497, 2.428225, 1, 1, 1, 1, 1,
0.2858426, 0.7545099, -0.5380206, 1, 1, 1, 1, 1,
0.2914931, -1.133366, 2.822997, 1, 1, 1, 1, 1,
0.2921798, -0.0733395, 1.662484, 1, 1, 1, 1, 1,
0.3023364, -0.01764291, 0.1365691, 1, 1, 1, 1, 1,
0.3025615, 1.479115, -0.9335831, 1, 1, 1, 1, 1,
0.3053299, -0.673763, 1.471125, 1, 1, 1, 1, 1,
0.308834, 1.128929, -0.6038481, 0, 0, 1, 1, 1,
0.3104011, -0.3948713, 1.746662, 1, 0, 0, 1, 1,
0.3126858, -1.605404, 2.553863, 1, 0, 0, 1, 1,
0.314364, 0.05033324, 1.888569, 1, 0, 0, 1, 1,
0.3146174, -0.9961424, 2.252842, 1, 0, 0, 1, 1,
0.3177995, 0.8507129, 0.1605594, 1, 0, 0, 1, 1,
0.318175, -0.2812835, 1.385136, 0, 0, 0, 1, 1,
0.318932, 0.6932079, 2.378341, 0, 0, 0, 1, 1,
0.3196459, 1.244593, 1.540683, 0, 0, 0, 1, 1,
0.3214784, -1.352325, 0.6316511, 0, 0, 0, 1, 1,
0.3218855, 0.04863439, 2.634708, 0, 0, 0, 1, 1,
0.3232995, 0.1226689, 1.966177, 0, 0, 0, 1, 1,
0.3244038, -0.7121745, 2.974044, 0, 0, 0, 1, 1,
0.3316419, 0.08391024, 1.805515, 1, 1, 1, 1, 1,
0.3345252, 1.023343, 1.555168, 1, 1, 1, 1, 1,
0.3361644, -1.015169, 5.434415, 1, 1, 1, 1, 1,
0.3362167, 1.267781, 0.754383, 1, 1, 1, 1, 1,
0.3372479, -0.9235603, 0.3871954, 1, 1, 1, 1, 1,
0.3406111, 2.817163, 0.5149516, 1, 1, 1, 1, 1,
0.3418149, -0.1982381, 2.308898, 1, 1, 1, 1, 1,
0.3421783, 1.283667, 1.364607, 1, 1, 1, 1, 1,
0.3447885, -0.3155363, 1.797903, 1, 1, 1, 1, 1,
0.3455215, -0.09668931, 2.083888, 1, 1, 1, 1, 1,
0.3489158, -0.3267672, 0.5318315, 1, 1, 1, 1, 1,
0.3515856, -0.5850761, 2.622341, 1, 1, 1, 1, 1,
0.3530042, -0.06608486, 2.602977, 1, 1, 1, 1, 1,
0.3535862, -0.6455383, 4.154677, 1, 1, 1, 1, 1,
0.3538142, 0.3793411, 1.859929, 1, 1, 1, 1, 1,
0.3574374, -0.3133909, 3.546652, 0, 0, 1, 1, 1,
0.3588742, -0.8838003, 2.777741, 1, 0, 0, 1, 1,
0.3593555, 0.001378424, 1.440497, 1, 0, 0, 1, 1,
0.362018, -0.6133295, 5.137441, 1, 0, 0, 1, 1,
0.3623509, 1.450783, -0.2475083, 1, 0, 0, 1, 1,
0.3699622, 0.8249999, 1.354749, 1, 0, 0, 1, 1,
0.3699762, 1.607792, -0.1509582, 0, 0, 0, 1, 1,
0.3711395, -0.8432389, 5.498608, 0, 0, 0, 1, 1,
0.3716963, 0.2040068, 0.6279455, 0, 0, 0, 1, 1,
0.37256, -1.305251, 3.148818, 0, 0, 0, 1, 1,
0.3752263, 0.401215, 0.199566, 0, 0, 0, 1, 1,
0.3786073, -0.402714, 2.221151, 0, 0, 0, 1, 1,
0.3798577, 0.6459444, 1.725038, 0, 0, 0, 1, 1,
0.3813851, 0.5554851, 1.02185, 1, 1, 1, 1, 1,
0.3826631, 0.7696917, 0.0625158, 1, 1, 1, 1, 1,
0.386919, -0.3229332, 2.024643, 1, 1, 1, 1, 1,
0.3899121, 1.858378, 0.6001301, 1, 1, 1, 1, 1,
0.39252, 0.5824018, 0.7182922, 1, 1, 1, 1, 1,
0.3927701, -0.5081858, 3.737146, 1, 1, 1, 1, 1,
0.3938321, -0.7985655, 3.862219, 1, 1, 1, 1, 1,
0.3959044, 0.2027299, 1.41225, 1, 1, 1, 1, 1,
0.4008004, -1.967741, 2.632626, 1, 1, 1, 1, 1,
0.4023142, -0.4767895, 1.89172, 1, 1, 1, 1, 1,
0.4026285, 1.805431, -0.6486275, 1, 1, 1, 1, 1,
0.4034211, 2.023719, 0.6888093, 1, 1, 1, 1, 1,
0.4042809, -0.5413895, 1.342518, 1, 1, 1, 1, 1,
0.405032, -1.175156, 3.627682, 1, 1, 1, 1, 1,
0.4060491, 0.7171844, -0.5729794, 1, 1, 1, 1, 1,
0.4075995, -0.8964767, 4.6835, 0, 0, 1, 1, 1,
0.4097309, -0.4271523, 2.31191, 1, 0, 0, 1, 1,
0.4126627, 0.2667216, 0.6474163, 1, 0, 0, 1, 1,
0.4157878, 0.6671154, -0.02098259, 1, 0, 0, 1, 1,
0.4275739, -0.05914201, 2.403043, 1, 0, 0, 1, 1,
0.4289237, -0.2805097, 1.680415, 1, 0, 0, 1, 1,
0.4317867, 0.5141671, 1.473034, 0, 0, 0, 1, 1,
0.4330052, -1.059281, 2.762188, 0, 0, 0, 1, 1,
0.4373876, -0.4569835, 4.201706, 0, 0, 0, 1, 1,
0.4389701, 1.095009, 0.09529133, 0, 0, 0, 1, 1,
0.4394732, -0.8926217, 3.124802, 0, 0, 0, 1, 1,
0.4449181, -0.3911926, 2.554764, 0, 0, 0, 1, 1,
0.4452365, 0.8278146, 2.644064, 0, 0, 0, 1, 1,
0.447128, -1.019396, 2.963295, 1, 1, 1, 1, 1,
0.4476743, -0.08863966, 1.943154, 1, 1, 1, 1, 1,
0.4481433, 0.2623762, 1.890352, 1, 1, 1, 1, 1,
0.450627, 0.2633672, 1.872228, 1, 1, 1, 1, 1,
0.4507354, -0.06711161, 1.158603, 1, 1, 1, 1, 1,
0.4513135, -1.273986, 3.008848, 1, 1, 1, 1, 1,
0.4519564, -0.225077, 0.8847353, 1, 1, 1, 1, 1,
0.4525718, 0.2475501, 1.618694, 1, 1, 1, 1, 1,
0.4528349, 0.4128318, 0.4609258, 1, 1, 1, 1, 1,
0.457146, -1.127268, 2.457861, 1, 1, 1, 1, 1,
0.4602437, -1.043039, 2.329349, 1, 1, 1, 1, 1,
0.4636691, 1.604105, 1.487578, 1, 1, 1, 1, 1,
0.464909, 1.13767, 1.023802, 1, 1, 1, 1, 1,
0.4671243, -0.3401201, 2.515922, 1, 1, 1, 1, 1,
0.4696169, 1.182765, -1.78268, 1, 1, 1, 1, 1,
0.4713229, -1.83629, 3.442759, 0, 0, 1, 1, 1,
0.4742187, -0.06069795, 3.594847, 1, 0, 0, 1, 1,
0.475431, -0.1298904, 1.429253, 1, 0, 0, 1, 1,
0.4770235, 0.07132852, 1.229152, 1, 0, 0, 1, 1,
0.4829939, 0.4385221, 0.4105995, 1, 0, 0, 1, 1,
0.4837044, 0.9435022, 0.5942783, 1, 0, 0, 1, 1,
0.4837506, 0.5823081, 1.844534, 0, 0, 0, 1, 1,
0.4841782, -1.103293, 2.915779, 0, 0, 0, 1, 1,
0.4879867, -0.08660691, 2.202263, 0, 0, 0, 1, 1,
0.4885819, 2.050888, 1.873081, 0, 0, 0, 1, 1,
0.4906684, 0.5337983, 1.110338, 0, 0, 0, 1, 1,
0.4929775, 0.6721697, -0.6137635, 0, 0, 0, 1, 1,
0.4934246, 0.864997, 0.760918, 0, 0, 0, 1, 1,
0.5090001, 1.544553, 0.4755416, 1, 1, 1, 1, 1,
0.5102051, 0.1866789, 1.307361, 1, 1, 1, 1, 1,
0.5118076, 1.672077, 0.7514037, 1, 1, 1, 1, 1,
0.5186543, -0.04756624, 2.006381, 1, 1, 1, 1, 1,
0.5199975, -1.654692, 2.324143, 1, 1, 1, 1, 1,
0.5218664, 1.466384, 0.5948244, 1, 1, 1, 1, 1,
0.5238516, 1.910704, 1.44807, 1, 1, 1, 1, 1,
0.5240057, 0.08301152, 1.371709, 1, 1, 1, 1, 1,
0.52894, -1.286447, 2.600616, 1, 1, 1, 1, 1,
0.5317203, -1.546604, 3.510735, 1, 1, 1, 1, 1,
0.5322753, 0.4336534, 0.5265368, 1, 1, 1, 1, 1,
0.532392, 1.018835, 0.3089069, 1, 1, 1, 1, 1,
0.5382406, -0.6034234, 2.748269, 1, 1, 1, 1, 1,
0.5383706, -1.297318, 2.412586, 1, 1, 1, 1, 1,
0.5490751, -2.297749, 4.598704, 1, 1, 1, 1, 1,
0.55045, -1.172096, 2.591759, 0, 0, 1, 1, 1,
0.5530081, -0.5705308, 0.4414478, 1, 0, 0, 1, 1,
0.5589499, 2.06862, 1.426064, 1, 0, 0, 1, 1,
0.561292, 1.442248, 0.6212851, 1, 0, 0, 1, 1,
0.5645601, 0.9017105, -0.5701729, 1, 0, 0, 1, 1,
0.5647507, -0.9398287, 2.932889, 1, 0, 0, 1, 1,
0.57012, 1.501947, -0.6514869, 0, 0, 0, 1, 1,
0.5710409, -2.159561, 2.016373, 0, 0, 0, 1, 1,
0.578609, -1.368716, 3.690428, 0, 0, 0, 1, 1,
0.5804728, 0.5026082, -0.02824714, 0, 0, 0, 1, 1,
0.5834132, 0.7825675, 2.142335, 0, 0, 0, 1, 1,
0.588883, 0.507651, 0.3192558, 0, 0, 0, 1, 1,
0.5975733, -0.4711162, 4.257539, 0, 0, 0, 1, 1,
0.6012738, 0.5151942, -0.527177, 1, 1, 1, 1, 1,
0.6023223, 0.09333036, -0.09915278, 1, 1, 1, 1, 1,
0.6035146, -1.691332, 2.246767, 1, 1, 1, 1, 1,
0.6046305, -0.4461505, 1.614895, 1, 1, 1, 1, 1,
0.6069347, 0.3683046, 2.554454, 1, 1, 1, 1, 1,
0.6071492, -0.2921758, 0.1482845, 1, 1, 1, 1, 1,
0.6088271, -0.1591828, 0.5280548, 1, 1, 1, 1, 1,
0.6118895, -0.2280357, 4.094035, 1, 1, 1, 1, 1,
0.6120195, -0.6100687, 1.914332, 1, 1, 1, 1, 1,
0.6135337, 1.255376, -0.4873194, 1, 1, 1, 1, 1,
0.6151779, -0.02152571, 2.333105, 1, 1, 1, 1, 1,
0.620951, -0.7436211, 1.751907, 1, 1, 1, 1, 1,
0.6214476, 0.1411948, 0.4939608, 1, 1, 1, 1, 1,
0.6434601, -0.3726738, 3.212214, 1, 1, 1, 1, 1,
0.6504276, 0.6369575, 0.2669214, 1, 1, 1, 1, 1,
0.6530883, -0.7116257, 2.90749, 0, 0, 1, 1, 1,
0.6537831, 1.071208, 0.5271, 1, 0, 0, 1, 1,
0.6570899, -0.444881, 3.216893, 1, 0, 0, 1, 1,
0.6580663, 0.4652165, -0.9300891, 1, 0, 0, 1, 1,
0.6616073, 0.981528, 0.1631474, 1, 0, 0, 1, 1,
0.6621585, 1.80382, -0.1758574, 1, 0, 0, 1, 1,
0.6689223, 0.8025025, -0.1235714, 0, 0, 0, 1, 1,
0.6710296, -0.777131, 4.379572, 0, 0, 0, 1, 1,
0.6756577, 0.4525252, 0.4416747, 0, 0, 0, 1, 1,
0.6800742, -0.3268993, 1.592417, 0, 0, 0, 1, 1,
0.6811932, -0.5635712, 2.32179, 0, 0, 0, 1, 1,
0.6853228, -1.383953, 0.9643552, 0, 0, 0, 1, 1,
0.6873845, 1.78338, -0.3064734, 0, 0, 0, 1, 1,
0.6883654, 1.126526, 1.360317, 1, 1, 1, 1, 1,
0.6917506, 0.01373678, 1.954953, 1, 1, 1, 1, 1,
0.6964858, -0.828142, 1.990898, 1, 1, 1, 1, 1,
0.6982133, 0.4082262, 1.769249, 1, 1, 1, 1, 1,
0.7016926, -1.887333, 2.345087, 1, 1, 1, 1, 1,
0.7106044, 0.4298613, 0.7136896, 1, 1, 1, 1, 1,
0.7108552, -0.3469829, 1.260405, 1, 1, 1, 1, 1,
0.7163258, -0.5203602, 0.9960288, 1, 1, 1, 1, 1,
0.7165124, -1.259683, 1.946397, 1, 1, 1, 1, 1,
0.7212868, 2.1717, 0.6190606, 1, 1, 1, 1, 1,
0.7247608, 0.2696573, 1.192186, 1, 1, 1, 1, 1,
0.7259446, 0.5329822, 1.037682, 1, 1, 1, 1, 1,
0.7289963, 1.53452, 1.867029, 1, 1, 1, 1, 1,
0.7335538, -0.01351596, 2.517366, 1, 1, 1, 1, 1,
0.7372047, -0.6499316, 0.6520585, 1, 1, 1, 1, 1,
0.7436153, -1.173797, 1.69071, 0, 0, 1, 1, 1,
0.7455583, 1.344408, 0.480227, 1, 0, 0, 1, 1,
0.7572818, -0.9150938, 2.3265, 1, 0, 0, 1, 1,
0.7587934, 0.6788739, 1.568867, 1, 0, 0, 1, 1,
0.7622423, 1.305533, 1.962411, 1, 0, 0, 1, 1,
0.7654064, 1.732938, -0.8971323, 1, 0, 0, 1, 1,
0.7735124, 1.458099, -0.2335055, 0, 0, 0, 1, 1,
0.7740547, -0.1974484, 1.918459, 0, 0, 0, 1, 1,
0.7744129, -0.3192768, 2.486192, 0, 0, 0, 1, 1,
0.7758453, -0.1461854, 4.03391, 0, 0, 0, 1, 1,
0.777063, -1.164491, 0.7260913, 0, 0, 0, 1, 1,
0.7773288, -0.9192449, 1.31707, 0, 0, 0, 1, 1,
0.7905886, 0.5043933, 3.006805, 0, 0, 0, 1, 1,
0.7918134, 0.8423958, 0.9789543, 1, 1, 1, 1, 1,
0.7940919, 0.03460954, 2.157937, 1, 1, 1, 1, 1,
0.8070539, 1.097951, -1.060874, 1, 1, 1, 1, 1,
0.8089136, -0.4766882, 1.836278, 1, 1, 1, 1, 1,
0.81676, -0.952545, 3.254927, 1, 1, 1, 1, 1,
0.8190809, -0.3001817, 2.414652, 1, 1, 1, 1, 1,
0.8208126, -0.1627563, -0.07559648, 1, 1, 1, 1, 1,
0.8270568, -0.9418314, 2.053188, 1, 1, 1, 1, 1,
0.8280978, -1.665038, 1.905347, 1, 1, 1, 1, 1,
0.8301488, 0.3673882, 1.151851, 1, 1, 1, 1, 1,
0.8317226, 0.864372, 0.6490752, 1, 1, 1, 1, 1,
0.8317837, 1.266287, 2.4386, 1, 1, 1, 1, 1,
0.8470219, -0.3189631, 1.710273, 1, 1, 1, 1, 1,
0.8502489, 0.8088573, 1.577382, 1, 1, 1, 1, 1,
0.8506944, 0.6367556, 1.018838, 1, 1, 1, 1, 1,
0.8516604, -1.870231, 1.666065, 0, 0, 1, 1, 1,
0.853698, 1.208442, 1.613291, 1, 0, 0, 1, 1,
0.8577921, -1.04815, 2.324153, 1, 0, 0, 1, 1,
0.8631799, 0.308827, -0.1746279, 1, 0, 0, 1, 1,
0.8666657, 0.08848891, 2.468566, 1, 0, 0, 1, 1,
0.8807526, -0.4892649, 3.335155, 1, 0, 0, 1, 1,
0.8812599, 0.9913052, -0.2874427, 0, 0, 0, 1, 1,
0.8872921, -1.446361, 2.833672, 0, 0, 0, 1, 1,
0.8885955, 0.4074084, 0.9807366, 0, 0, 0, 1, 1,
0.9019002, -1.229092, 3.859084, 0, 0, 0, 1, 1,
0.9023615, 0.1920423, 0.6078601, 0, 0, 0, 1, 1,
0.9065562, -0.4535484, 2.899974, 0, 0, 0, 1, 1,
0.9093899, -0.7754143, 2.24098, 0, 0, 0, 1, 1,
0.9107639, -0.9721047, 0.05153083, 1, 1, 1, 1, 1,
0.911635, 1.635919, 0.2959087, 1, 1, 1, 1, 1,
0.9177068, 0.7660533, 0.1273509, 1, 1, 1, 1, 1,
0.9182715, 2.353535, 1.311577, 1, 1, 1, 1, 1,
0.9241057, 0.4202911, 0.3012864, 1, 1, 1, 1, 1,
0.9244564, -0.1045334, 1.686975, 1, 1, 1, 1, 1,
0.9408131, 1.894978, -0.2123068, 1, 1, 1, 1, 1,
0.943259, -0.2814588, 1.292375, 1, 1, 1, 1, 1,
0.9524979, 1.024848, 2.118329, 1, 1, 1, 1, 1,
0.9552791, -1.385339, 2.642968, 1, 1, 1, 1, 1,
0.9560171, -0.2965816, 3.359699, 1, 1, 1, 1, 1,
0.9653262, -0.09067971, 1.710351, 1, 1, 1, 1, 1,
0.9664762, -0.6644961, 0.8748783, 1, 1, 1, 1, 1,
0.9703803, 0.3253691, 1.138704, 1, 1, 1, 1, 1,
0.9760134, -0.2023963, 0.7381247, 1, 1, 1, 1, 1,
0.9784827, -1.769617, 2.02054, 0, 0, 1, 1, 1,
0.9871026, -0.007555202, 2.59598, 1, 0, 0, 1, 1,
0.9956492, -0.1701313, 1.270759, 1, 0, 0, 1, 1,
0.9994456, -1.274668, 1.887072, 1, 0, 0, 1, 1,
1.004731, -0.07827937, 2.691327, 1, 0, 0, 1, 1,
1.005304, -0.7554847, 3.57551, 1, 0, 0, 1, 1,
1.014136, 0.5341399, 0.550701, 0, 0, 0, 1, 1,
1.017302, -1.990165, 1.726107, 0, 0, 0, 1, 1,
1.045061, -0.5288342, 0.8020561, 0, 0, 0, 1, 1,
1.051768, -0.8098459, 3.783112, 0, 0, 0, 1, 1,
1.05631, -0.004210135, 0.8312777, 0, 0, 0, 1, 1,
1.056369, -0.524138, 2.686122, 0, 0, 0, 1, 1,
1.061133, 0.8419416, 0.08828737, 0, 0, 0, 1, 1,
1.071437, -0.7165778, 0.4690846, 1, 1, 1, 1, 1,
1.072458, 0.3991442, -0.09807104, 1, 1, 1, 1, 1,
1.073173, 1.927565, 0.2412256, 1, 1, 1, 1, 1,
1.08395, 0.2832697, 1.372878, 1, 1, 1, 1, 1,
1.08447, 0.4425525, 2.258364, 1, 1, 1, 1, 1,
1.0867, 1.445894, -0.4902796, 1, 1, 1, 1, 1,
1.097039, 0.6767184, 1.175834, 1, 1, 1, 1, 1,
1.102416, -1.116297, 2.657904, 1, 1, 1, 1, 1,
1.111358, -1.771375, 2.721164, 1, 1, 1, 1, 1,
1.112104, -1.402195, 2.332219, 1, 1, 1, 1, 1,
1.127251, 0.5888525, 1.535829, 1, 1, 1, 1, 1,
1.137666, 1.30072, 1.049622, 1, 1, 1, 1, 1,
1.156918, 2.053395, 0.7586457, 1, 1, 1, 1, 1,
1.161182, 0.8673052, 2.976095, 1, 1, 1, 1, 1,
1.161827, -0.02114994, 1.452592, 1, 1, 1, 1, 1,
1.169384, 0.03332084, 1.620854, 0, 0, 1, 1, 1,
1.174091, 0.07481463, 2.460902, 1, 0, 0, 1, 1,
1.176706, -0.6162652, 2.990651, 1, 0, 0, 1, 1,
1.188094, 0.2716991, 1.214933, 1, 0, 0, 1, 1,
1.20453, -1.298344, 1.428317, 1, 0, 0, 1, 1,
1.219191, 2.795987, -0.08635914, 1, 0, 0, 1, 1,
1.220013, -0.6130196, 1.165345, 0, 0, 0, 1, 1,
1.222881, 1.17527, -0.6073638, 0, 0, 0, 1, 1,
1.229513, -1.046921, 2.059002, 0, 0, 0, 1, 1,
1.230997, 0.1553573, 2.058564, 0, 0, 0, 1, 1,
1.236391, -0.5178107, 2.715955, 0, 0, 0, 1, 1,
1.242648, -0.2237686, 2.494876, 0, 0, 0, 1, 1,
1.245626, 0.1554189, 1.845855, 0, 0, 0, 1, 1,
1.251553, 0.001234273, 2.412584, 1, 1, 1, 1, 1,
1.26406, -2.196908, 1.463979, 1, 1, 1, 1, 1,
1.265916, -0.02132822, 1.78626, 1, 1, 1, 1, 1,
1.266312, 1.726001, 0.1901335, 1, 1, 1, 1, 1,
1.279225, -0.2336791, 2.678081, 1, 1, 1, 1, 1,
1.294541, 1.424272, 0.6265665, 1, 1, 1, 1, 1,
1.295449, 0.3451522, 1.702551, 1, 1, 1, 1, 1,
1.300012, 1.846992, 1.191837, 1, 1, 1, 1, 1,
1.301062, -0.525279, 2.50789, 1, 1, 1, 1, 1,
1.305598, 0.5251504, 3.668109, 1, 1, 1, 1, 1,
1.313191, 0.01528487, 2.617687, 1, 1, 1, 1, 1,
1.316613, -0.9524285, 4.434042, 1, 1, 1, 1, 1,
1.318468, -0.8366816, 3.776806, 1, 1, 1, 1, 1,
1.320499, -0.3620016, 2.626257, 1, 1, 1, 1, 1,
1.33511, -0.0198707, 2.613092, 1, 1, 1, 1, 1,
1.335989, 0.7668065, 0.4868317, 0, 0, 1, 1, 1,
1.34493, -2.264054, 1.265657, 1, 0, 0, 1, 1,
1.345335, -1.567283, 2.960745, 1, 0, 0, 1, 1,
1.345935, 0.09044188, 2.978256, 1, 0, 0, 1, 1,
1.346309, 0.01006562, 3.204278, 1, 0, 0, 1, 1,
1.351271, 2.259438, 1.531381, 1, 0, 0, 1, 1,
1.367661, 0.6649491, 1.301729, 0, 0, 0, 1, 1,
1.368207, 0.5532435, 1.626692, 0, 0, 0, 1, 1,
1.369835, -0.9817036, 0.5852808, 0, 0, 0, 1, 1,
1.371834, -0.622516, 1.038961, 0, 0, 0, 1, 1,
1.385719, -1.075001, 3.534309, 0, 0, 0, 1, 1,
1.390469, -1.172869, 2.910874, 0, 0, 0, 1, 1,
1.393607, 1.19626, 1.559834, 0, 0, 0, 1, 1,
1.39803, -0.4303266, 2.953923, 1, 1, 1, 1, 1,
1.398054, 0.1058821, 0.4882279, 1, 1, 1, 1, 1,
1.398975, 1.316079, 0.1235383, 1, 1, 1, 1, 1,
1.41992, -1.030779, 2.334464, 1, 1, 1, 1, 1,
1.422087, -0.04521672, 2.240712, 1, 1, 1, 1, 1,
1.423674, -1.619344, 1.542766, 1, 1, 1, 1, 1,
1.43991, 1.313074, 1.724209, 1, 1, 1, 1, 1,
1.442451, -0.9241886, 2.326433, 1, 1, 1, 1, 1,
1.448331, -0.03554294, 2.644704, 1, 1, 1, 1, 1,
1.460156, -0.667114, 0.5031484, 1, 1, 1, 1, 1,
1.467097, 0.4155155, 1.270527, 1, 1, 1, 1, 1,
1.477148, 0.5219327, 1.624362, 1, 1, 1, 1, 1,
1.477395, 2.173073, 0.6050035, 1, 1, 1, 1, 1,
1.484232, 0.01395699, 1.443726, 1, 1, 1, 1, 1,
1.498697, -0.6209229, 1.135826, 1, 1, 1, 1, 1,
1.518778, 0.5855572, 0.9341599, 0, 0, 1, 1, 1,
1.542757, -0.8433777, 2.295478, 1, 0, 0, 1, 1,
1.547719, -0.3580559, 2.357583, 1, 0, 0, 1, 1,
1.548354, 1.18527, 0.6482424, 1, 0, 0, 1, 1,
1.549656, -1.776666, 2.576476, 1, 0, 0, 1, 1,
1.566338, 0.8386289, 0.6976876, 1, 0, 0, 1, 1,
1.567669, -2.238879, 1.648458, 0, 0, 0, 1, 1,
1.568734, 0.5393156, 0.7998702, 0, 0, 0, 1, 1,
1.581994, 0.4359095, 1.108315, 0, 0, 0, 1, 1,
1.582311, 0.09985577, 0.7286134, 0, 0, 0, 1, 1,
1.591844, 1.171835, 0.003166348, 0, 0, 0, 1, 1,
1.616806, -0.636146, 0.7429241, 0, 0, 0, 1, 1,
1.617687, 0.4051522, -1.21733, 0, 0, 0, 1, 1,
1.631275, -0.2497247, 0.7063576, 1, 1, 1, 1, 1,
1.638146, -0.5156524, 3.024886, 1, 1, 1, 1, 1,
1.646692, -2.428773, 2.214825, 1, 1, 1, 1, 1,
1.653876, -0.1120375, 1.259296, 1, 1, 1, 1, 1,
1.667754, 0.4619006, 1.075175, 1, 1, 1, 1, 1,
1.669188, -0.2969726, 2.063886, 1, 1, 1, 1, 1,
1.694819, 0.03924881, 1.605775, 1, 1, 1, 1, 1,
1.704963, 1.051429, 1.29863, 1, 1, 1, 1, 1,
1.726619, 0.1113596, 1.077001, 1, 1, 1, 1, 1,
1.738524, -0.3572905, 3.168946, 1, 1, 1, 1, 1,
1.756975, 0.5898076, -0.9226893, 1, 1, 1, 1, 1,
1.763927, -1.527244, 2.529678, 1, 1, 1, 1, 1,
1.766293, -0.0896907, 2.062579, 1, 1, 1, 1, 1,
1.77369, -2.201353, 1.930873, 1, 1, 1, 1, 1,
1.778529, -0.2080414, 1.576838, 1, 1, 1, 1, 1,
1.791287, -1.343993, 3.166153, 0, 0, 1, 1, 1,
1.822656, 0.8628412, -0.6364338, 1, 0, 0, 1, 1,
1.84468, 0.508752, -0.8797486, 1, 0, 0, 1, 1,
1.900221, 1.120927, 0.2927593, 1, 0, 0, 1, 1,
1.945203, 1.235217, 1.029706, 1, 0, 0, 1, 1,
1.981232, -0.7520863, 3.626117, 1, 0, 0, 1, 1,
2.020561, 0.8456722, 1.929934, 0, 0, 0, 1, 1,
2.051244, 1.728607, 0.8706498, 0, 0, 0, 1, 1,
2.093893, -0.4332162, 3.880332, 0, 0, 0, 1, 1,
2.127676, 1.017799, 1.512013, 0, 0, 0, 1, 1,
2.19916, 0.4806023, -0.02720067, 0, 0, 0, 1, 1,
2.221134, -0.1921006, 0.1429743, 0, 0, 0, 1, 1,
2.266949, 2.551808, -0.7480323, 0, 0, 0, 1, 1,
2.426582, -2.112667, 1.059595, 1, 1, 1, 1, 1,
2.441027, -0.2028421, 1.670751, 1, 1, 1, 1, 1,
2.48327, 1.045395, 1.898276, 1, 1, 1, 1, 1,
2.551902, -0.5832309, 2.703932, 1, 1, 1, 1, 1,
2.655018, -0.9156193, 1.17112, 1, 1, 1, 1, 1,
3.089354, 0.5369135, 1.530473, 1, 1, 1, 1, 1,
3.313631, 1.743044, 1.43133, 1, 1, 1, 1, 1
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
var radius = 9.510619;
var distance = 33.40564;
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
mvMatrix.translate( -0.2340982, 0.06546998, -0.05658674 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.40564);
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
