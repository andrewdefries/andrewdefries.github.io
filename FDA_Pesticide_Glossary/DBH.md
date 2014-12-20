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
-3.019796, 1.313002, -0.8710006, 1, 0, 0, 1,
-2.700647, 0.4963116, -2.335921, 1, 0.007843138, 0, 1,
-2.621811, 2.082022, -1.176187, 1, 0.01176471, 0, 1,
-2.59956, 1.166986, 0.2558531, 1, 0.01960784, 0, 1,
-2.469272, -0.9951406, -1.606214, 1, 0.02352941, 0, 1,
-2.436192, 0.8542576, -1.003679, 1, 0.03137255, 0, 1,
-2.401851, -0.3251856, -2.779324, 1, 0.03529412, 0, 1,
-2.35588, 1.701672, -0.7815488, 1, 0.04313726, 0, 1,
-2.31887, 1.010422, -1.382812, 1, 0.04705882, 0, 1,
-2.296438, 2.58314, -1.181779, 1, 0.05490196, 0, 1,
-2.265524, 0.3101214, -3.046193, 1, 0.05882353, 0, 1,
-2.259049, 0.4014477, -1.174656, 1, 0.06666667, 0, 1,
-2.247154, -0.2049191, -3.560869, 1, 0.07058824, 0, 1,
-2.244541, -0.2713719, -1.615051, 1, 0.07843138, 0, 1,
-2.193517, 0.8319887, -0.3026829, 1, 0.08235294, 0, 1,
-2.193351, 2.240162, 0.1617873, 1, 0.09019608, 0, 1,
-2.190978, 0.0253505, -2.387685, 1, 0.09411765, 0, 1,
-2.177465, -0.428389, 0.2324048, 1, 0.1019608, 0, 1,
-2.176039, -1.976637, -3.928433, 1, 0.1098039, 0, 1,
-2.139288, -0.282504, -1.351961, 1, 0.1137255, 0, 1,
-2.077583, -0.4380744, -1.468123, 1, 0.1215686, 0, 1,
-2.030859, -0.002002799, -3.071646, 1, 0.1254902, 0, 1,
-1.981198, 0.7603146, -0.8940712, 1, 0.1333333, 0, 1,
-1.959214, 1.179148, -0.320386, 1, 0.1372549, 0, 1,
-1.916282, 1.719395, -1.17272, 1, 0.145098, 0, 1,
-1.912511, -1.00907, 0.08229627, 1, 0.1490196, 0, 1,
-1.907307, -0.07596112, -0.3877649, 1, 0.1568628, 0, 1,
-1.885136, -0.2794617, -1.41493, 1, 0.1607843, 0, 1,
-1.885098, -0.8037983, -2.211949, 1, 0.1686275, 0, 1,
-1.878781, -0.5605795, -1.304958, 1, 0.172549, 0, 1,
-1.876427, -1.011348, -3.017383, 1, 0.1803922, 0, 1,
-1.873715, 1.057857, -1.130719, 1, 0.1843137, 0, 1,
-1.856715, 1.396994, -0.3881743, 1, 0.1921569, 0, 1,
-1.827081, -1.403935, -1.971711, 1, 0.1960784, 0, 1,
-1.826423, -1.451143, -1.311695, 1, 0.2039216, 0, 1,
-1.825593, 1.635204, -1.295732, 1, 0.2117647, 0, 1,
-1.819783, 0.9152349, -0.5214, 1, 0.2156863, 0, 1,
-1.801494, -0.6041551, 0.2878304, 1, 0.2235294, 0, 1,
-1.774881, -0.4240549, -2.25909, 1, 0.227451, 0, 1,
-1.772348, 0.3569854, -0.3360153, 1, 0.2352941, 0, 1,
-1.762272, 0.475576, -2.60997, 1, 0.2392157, 0, 1,
-1.7544, -0.3099043, -2.591541, 1, 0.2470588, 0, 1,
-1.733532, 2.169216, -0.7243342, 1, 0.2509804, 0, 1,
-1.732345, 0.5429706, -0.5629003, 1, 0.2588235, 0, 1,
-1.717481, -0.3850147, -3.5147, 1, 0.2627451, 0, 1,
-1.697086, -0.1397511, -1.671873, 1, 0.2705882, 0, 1,
-1.690437, 1.579078, -0.407318, 1, 0.2745098, 0, 1,
-1.650773, 1.853015, -1.058442, 1, 0.282353, 0, 1,
-1.63899, 0.05325959, -0.8887181, 1, 0.2862745, 0, 1,
-1.625408, -0.9387817, -3.448147, 1, 0.2941177, 0, 1,
-1.618795, -0.8737787, -2.332098, 1, 0.3019608, 0, 1,
-1.613359, -1.182466, -3.788456, 1, 0.3058824, 0, 1,
-1.611733, -0.2395013, 0.05646973, 1, 0.3137255, 0, 1,
-1.579622, -0.6674377, -1.702101, 1, 0.3176471, 0, 1,
-1.577441, 0.7456256, -0.3473783, 1, 0.3254902, 0, 1,
-1.561726, -0.7234941, -0.8345271, 1, 0.3294118, 0, 1,
-1.556802, -2.414243, -2.889889, 1, 0.3372549, 0, 1,
-1.552344, -1.108785, -4.163245, 1, 0.3411765, 0, 1,
-1.550969, -0.3037275, -2.547889, 1, 0.3490196, 0, 1,
-1.543389, 0.09929895, -1.214638, 1, 0.3529412, 0, 1,
-1.523973, 0.733809, -1.04684, 1, 0.3607843, 0, 1,
-1.523746, 1.627551, 0.1631244, 1, 0.3647059, 0, 1,
-1.519711, 1.316412, -1.561111, 1, 0.372549, 0, 1,
-1.519435, 1.213564, -1.035228, 1, 0.3764706, 0, 1,
-1.517226, -1.035326, -2.431501, 1, 0.3843137, 0, 1,
-1.503495, -0.190037, -0.7648891, 1, 0.3882353, 0, 1,
-1.499744, 0.2561547, 0.6711091, 1, 0.3960784, 0, 1,
-1.474676, 0.07463984, -2.567234, 1, 0.4039216, 0, 1,
-1.468188, 0.9739663, 1.401308, 1, 0.4078431, 0, 1,
-1.435027, 0.2555259, -3.440106, 1, 0.4156863, 0, 1,
-1.433965, -0.0006683734, -1.013389, 1, 0.4196078, 0, 1,
-1.433212, -0.7409345, -0.7476478, 1, 0.427451, 0, 1,
-1.415713, -1.830074, -2.655523, 1, 0.4313726, 0, 1,
-1.415605, 0.4336301, -0.6291776, 1, 0.4392157, 0, 1,
-1.408018, -0.3702472, -1.062855, 1, 0.4431373, 0, 1,
-1.403496, 0.2750936, 0.3777763, 1, 0.4509804, 0, 1,
-1.401251, -0.4830959, -3.134857, 1, 0.454902, 0, 1,
-1.399901, -0.99355, -2.177166, 1, 0.4627451, 0, 1,
-1.398163, -1.59466, -3.106248, 1, 0.4666667, 0, 1,
-1.393764, 0.7489346, -1.506561, 1, 0.4745098, 0, 1,
-1.391561, -0.6445617, 1.098645, 1, 0.4784314, 0, 1,
-1.391496, -0.3326164, -1.098616, 1, 0.4862745, 0, 1,
-1.374892, -0.9963782, -3.079883, 1, 0.4901961, 0, 1,
-1.358666, 0.9878897, -0.3721539, 1, 0.4980392, 0, 1,
-1.353307, 1.432507, -1.01052, 1, 0.5058824, 0, 1,
-1.351707, -1.209332, -2.227542, 1, 0.509804, 0, 1,
-1.346488, 1.128451, -0.6353762, 1, 0.5176471, 0, 1,
-1.336397, -0.7236122, -0.8655939, 1, 0.5215687, 0, 1,
-1.31501, 0.5305557, -0.191311, 1, 0.5294118, 0, 1,
-1.313194, 0.9529022, 0.1048311, 1, 0.5333334, 0, 1,
-1.309975, -1.075801, -2.331636, 1, 0.5411765, 0, 1,
-1.30774, 1.046152, 0.4620408, 1, 0.5450981, 0, 1,
-1.293531, -2.244566, -2.530981, 1, 0.5529412, 0, 1,
-1.289304, -1.246592, -3.834123, 1, 0.5568628, 0, 1,
-1.280662, 0.7348286, -0.8246054, 1, 0.5647059, 0, 1,
-1.280183, 0.8917565, 0.2026964, 1, 0.5686275, 0, 1,
-1.278177, 1.07547, -0.6877359, 1, 0.5764706, 0, 1,
-1.273878, 2.467708, -1.241239, 1, 0.5803922, 0, 1,
-1.270828, 0.09279692, -0.9825161, 1, 0.5882353, 0, 1,
-1.260407, 1.459003, 1.696912, 1, 0.5921569, 0, 1,
-1.255606, -2.034576, -2.265125, 1, 0.6, 0, 1,
-1.252258, 1.22999, 0.3052483, 1, 0.6078432, 0, 1,
-1.251545, 0.8471702, -1.716408, 1, 0.6117647, 0, 1,
-1.249171, 1.136519, -1.434219, 1, 0.6196079, 0, 1,
-1.244589, 0.6134835, -1.375494, 1, 0.6235294, 0, 1,
-1.23923, 0.8217523, -1.021727, 1, 0.6313726, 0, 1,
-1.238264, 0.2453961, -0.8800925, 1, 0.6352941, 0, 1,
-1.22943, -0.429966, -2.34935, 1, 0.6431373, 0, 1,
-1.225121, 0.1244752, -1.474035, 1, 0.6470588, 0, 1,
-1.217844, -0.983925, -1.969048, 1, 0.654902, 0, 1,
-1.202903, -0.1991365, -1.774765, 1, 0.6588235, 0, 1,
-1.200536, 0.7628121, -2.177853, 1, 0.6666667, 0, 1,
-1.187297, 0.7409029, -2.475526, 1, 0.6705883, 0, 1,
-1.185335, 1.443315, -0.7664639, 1, 0.6784314, 0, 1,
-1.182731, 0.8408957, -2.683977, 1, 0.682353, 0, 1,
-1.18244, -0.09560706, -1.995624, 1, 0.6901961, 0, 1,
-1.176454, 0.4487022, -0.05332937, 1, 0.6941177, 0, 1,
-1.174422, -0.3671144, -2.885982, 1, 0.7019608, 0, 1,
-1.172656, -1.3368, -1.471304, 1, 0.7098039, 0, 1,
-1.146979, -0.2357732, -3.478448, 1, 0.7137255, 0, 1,
-1.135565, -2.245508, -2.523033, 1, 0.7215686, 0, 1,
-1.134933, -0.7694415, -2.464792, 1, 0.7254902, 0, 1,
-1.132338, -1.685639, -4.42745, 1, 0.7333333, 0, 1,
-1.128581, -0.4010799, -1.401941, 1, 0.7372549, 0, 1,
-1.122285, -0.1308752, -2.254601, 1, 0.7450981, 0, 1,
-1.115636, -1.080856, -2.285442, 1, 0.7490196, 0, 1,
-1.115226, 0.2971064, -0.9134853, 1, 0.7568628, 0, 1,
-1.114862, 0.5164875, -0.2818398, 1, 0.7607843, 0, 1,
-1.110243, -0.4367091, -4.341796, 1, 0.7686275, 0, 1,
-1.107768, -0.9657758, -2.401181, 1, 0.772549, 0, 1,
-1.10264, 1.028165, -0.7981385, 1, 0.7803922, 0, 1,
-1.095705, 0.5076796, -1.100111, 1, 0.7843137, 0, 1,
-1.089222, -0.3475787, -1.503484, 1, 0.7921569, 0, 1,
-1.086199, 0.5999728, -0.5765529, 1, 0.7960784, 0, 1,
-1.081716, 0.9358021, 0.4469202, 1, 0.8039216, 0, 1,
-1.07865, -0.01044997, -2.379146, 1, 0.8117647, 0, 1,
-1.073658, -1.35947, -2.922798, 1, 0.8156863, 0, 1,
-1.062354, -1.669255, -2.641422, 1, 0.8235294, 0, 1,
-1.058643, -0.3051138, -2.626656, 1, 0.827451, 0, 1,
-1.049711, 0.7441998, 0.59315, 1, 0.8352941, 0, 1,
-1.049621, -0.4322996, -3.496635, 1, 0.8392157, 0, 1,
-1.03887, -0.3080961, -0.7914233, 1, 0.8470588, 0, 1,
-1.035114, 0.3577314, -1.52118, 1, 0.8509804, 0, 1,
-1.026147, 1.18622, -0.6797099, 1, 0.8588235, 0, 1,
-1.018564, -0.6220955, -3.078966, 1, 0.8627451, 0, 1,
-1.017306, -0.5653155, -2.323068, 1, 0.8705882, 0, 1,
-1.015168, -1.036332, -1.704235, 1, 0.8745098, 0, 1,
-1.011125, -1.486408, -1.511912, 1, 0.8823529, 0, 1,
-1.008101, 2.449236, -1.046571, 1, 0.8862745, 0, 1,
-0.9947791, 0.5149369, -1.010023, 1, 0.8941177, 0, 1,
-0.9947065, -0.8655497, -1.788556, 1, 0.8980392, 0, 1,
-0.9918501, 0.07187326, -0.5904503, 1, 0.9058824, 0, 1,
-0.9891707, 0.225541, -0.6284068, 1, 0.9137255, 0, 1,
-0.9807488, -0.3190318, -2.916827, 1, 0.9176471, 0, 1,
-0.9648816, 0.6764384, -1.059404, 1, 0.9254902, 0, 1,
-0.9608715, -0.6241486, -3.371313, 1, 0.9294118, 0, 1,
-0.9471316, -0.4964529, -1.239404, 1, 0.9372549, 0, 1,
-0.9439526, 1.279466, -0.2677828, 1, 0.9411765, 0, 1,
-0.9416527, -0.6835998, -1.604812, 1, 0.9490196, 0, 1,
-0.935981, -0.9049734, -2.529128, 1, 0.9529412, 0, 1,
-0.9323072, 0.1778704, -2.194791, 1, 0.9607843, 0, 1,
-0.9294809, 0.3056604, -1.352533, 1, 0.9647059, 0, 1,
-0.9289098, 0.6319264, -1.559168, 1, 0.972549, 0, 1,
-0.926851, 0.3207602, -1.534127, 1, 0.9764706, 0, 1,
-0.9266026, 0.1895385, -1.794435, 1, 0.9843137, 0, 1,
-0.9227034, 0.3073671, -0.4676225, 1, 0.9882353, 0, 1,
-0.9192054, 0.7427825, -2.044791, 1, 0.9960784, 0, 1,
-0.9171279, 0.356982, -2.340069, 0.9960784, 1, 0, 1,
-0.9077947, -0.3263764, 0.3159396, 0.9921569, 1, 0, 1,
-0.8996924, -0.1789927, -2.629056, 0.9843137, 1, 0, 1,
-0.8984728, -1.460828, -1.132659, 0.9803922, 1, 0, 1,
-0.8947955, 0.8245525, -0.4827137, 0.972549, 1, 0, 1,
-0.8918553, -0.597291, -1.406054, 0.9686275, 1, 0, 1,
-0.8901523, -0.7223297, -2.960954, 0.9607843, 1, 0, 1,
-0.8828605, -0.381237, -2.064278, 0.9568627, 1, 0, 1,
-0.8813627, -0.2760903, -3.335799, 0.9490196, 1, 0, 1,
-0.8767148, -0.02040258, -1.034626, 0.945098, 1, 0, 1,
-0.8732388, 0.4106962, -0.6643372, 0.9372549, 1, 0, 1,
-0.8729668, -0.7174594, -2.317597, 0.9333333, 1, 0, 1,
-0.8637706, -1.893905, -4.687229, 0.9254902, 1, 0, 1,
-0.8599714, -0.7631851, -1.470201, 0.9215686, 1, 0, 1,
-0.8573043, -0.7522041, -1.636176, 0.9137255, 1, 0, 1,
-0.8544062, -1.239457, -4.322161, 0.9098039, 1, 0, 1,
-0.8478364, 0.08317003, -0.4334921, 0.9019608, 1, 0, 1,
-0.847649, 0.7279547, -2.785691, 0.8941177, 1, 0, 1,
-0.8455827, -0.137157, 0.3392469, 0.8901961, 1, 0, 1,
-0.8449091, -0.8348507, -1.440921, 0.8823529, 1, 0, 1,
-0.8441171, -0.4346476, -2.502939, 0.8784314, 1, 0, 1,
-0.8419349, -0.592158, -2.092204, 0.8705882, 1, 0, 1,
-0.8411222, -1.464503, -1.49177, 0.8666667, 1, 0, 1,
-0.8386735, -2.979292, -3.491267, 0.8588235, 1, 0, 1,
-0.8318817, -1.375342, -1.960416, 0.854902, 1, 0, 1,
-0.8289868, -0.2410655, -3.255238, 0.8470588, 1, 0, 1,
-0.821064, 0.09302076, -1.533654, 0.8431373, 1, 0, 1,
-0.8171054, 0.9456259, -0.7965578, 0.8352941, 1, 0, 1,
-0.8120883, 0.3631105, -2.178653, 0.8313726, 1, 0, 1,
-0.8110114, -0.9725134, -3.381372, 0.8235294, 1, 0, 1,
-0.8044834, -0.3113739, -1.437796, 0.8196079, 1, 0, 1,
-0.8044012, -0.1190603, -1.80457, 0.8117647, 1, 0, 1,
-0.7967808, -0.5967522, -2.981403, 0.8078431, 1, 0, 1,
-0.7945951, -0.4681633, -3.093506, 0.8, 1, 0, 1,
-0.7900859, -1.399189, -0.6588361, 0.7921569, 1, 0, 1,
-0.7851614, 0.04001957, -1.146042, 0.7882353, 1, 0, 1,
-0.7831237, -0.4963988, -5.179433, 0.7803922, 1, 0, 1,
-0.7809942, -1.126967, -2.990013, 0.7764706, 1, 0, 1,
-0.7794251, -0.06929895, -1.23047, 0.7686275, 1, 0, 1,
-0.7772673, -0.796155, -2.598066, 0.7647059, 1, 0, 1,
-0.7761109, 0.1942199, -0.035556, 0.7568628, 1, 0, 1,
-0.7748725, -0.2019155, -3.120951, 0.7529412, 1, 0, 1,
-0.7747343, 0.6001799, -0.9430538, 0.7450981, 1, 0, 1,
-0.7739626, 0.0196323, -1.837015, 0.7411765, 1, 0, 1,
-0.7675958, 0.672629, -0.5226505, 0.7333333, 1, 0, 1,
-0.7671969, -1.019815, -3.181241, 0.7294118, 1, 0, 1,
-0.7591762, 0.6684919, -1.319896, 0.7215686, 1, 0, 1,
-0.7581843, 1.025085, 0.03038476, 0.7176471, 1, 0, 1,
-0.75225, 0.1026594, -1.519158, 0.7098039, 1, 0, 1,
-0.7505491, 1.320078, 0.2226226, 0.7058824, 1, 0, 1,
-0.745223, -0.108678, -3.495801, 0.6980392, 1, 0, 1,
-0.7447168, -0.7483293, -2.589221, 0.6901961, 1, 0, 1,
-0.7417431, 0.1321312, -0.3826036, 0.6862745, 1, 0, 1,
-0.7378877, 0.9837776, 0.1458851, 0.6784314, 1, 0, 1,
-0.7349916, 0.3890961, 0.08856156, 0.6745098, 1, 0, 1,
-0.7332521, 0.2329168, -1.99639, 0.6666667, 1, 0, 1,
-0.7328215, 0.1026638, -2.908709, 0.6627451, 1, 0, 1,
-0.7287351, -0.4987473, -1.509568, 0.654902, 1, 0, 1,
-0.7280189, 1.161454, -1.183925, 0.6509804, 1, 0, 1,
-0.7274163, 1.418566, 1.644038, 0.6431373, 1, 0, 1,
-0.7242814, -0.4132429, -2.374926, 0.6392157, 1, 0, 1,
-0.7223744, -0.9023812, -3.189133, 0.6313726, 1, 0, 1,
-0.7083834, 1.120723, -0.491843, 0.627451, 1, 0, 1,
-0.7071163, 0.6245561, -0.685401, 0.6196079, 1, 0, 1,
-0.7037727, -0.1564642, -0.7978701, 0.6156863, 1, 0, 1,
-0.7034681, 0.3552786, -1.388837, 0.6078432, 1, 0, 1,
-0.7025236, 0.4970846, 0.08860415, 0.6039216, 1, 0, 1,
-0.70194, 1.680198, 0.396198, 0.5960785, 1, 0, 1,
-0.7004007, -0.05105146, -1.57248, 0.5882353, 1, 0, 1,
-0.6948476, 0.766642, -0.8097656, 0.5843138, 1, 0, 1,
-0.6863449, -0.6568266, -2.506432, 0.5764706, 1, 0, 1,
-0.685774, 2.797409, -0.02603282, 0.572549, 1, 0, 1,
-0.6855683, 0.3548896, -0.3605348, 0.5647059, 1, 0, 1,
-0.6835832, 0.7493974, 0.01097505, 0.5607843, 1, 0, 1,
-0.6709027, -0.5760384, -2.446597, 0.5529412, 1, 0, 1,
-0.6703919, -1.112939, -2.5511, 0.5490196, 1, 0, 1,
-0.6702839, 0.7150601, -1.324644, 0.5411765, 1, 0, 1,
-0.6694971, 1.347092, -1.399932, 0.5372549, 1, 0, 1,
-0.6673595, 0.3907839, -1.845857, 0.5294118, 1, 0, 1,
-0.6648429, -0.588461, -1.553549, 0.5254902, 1, 0, 1,
-0.6624759, -0.110555, -1.119061, 0.5176471, 1, 0, 1,
-0.662275, 0.09918308, -0.4125758, 0.5137255, 1, 0, 1,
-0.6617596, 0.6074439, -2.241036, 0.5058824, 1, 0, 1,
-0.6613434, -0.8177908, -1.645117, 0.5019608, 1, 0, 1,
-0.661331, -0.005570469, -2.744474, 0.4941176, 1, 0, 1,
-0.6611161, 0.001809534, -1.654391, 0.4862745, 1, 0, 1,
-0.6586859, 0.1937392, -1.469716, 0.4823529, 1, 0, 1,
-0.6532182, -0.1719434, -1.126216, 0.4745098, 1, 0, 1,
-0.6531363, -0.5517927, -0.1718004, 0.4705882, 1, 0, 1,
-0.6515495, -1.44194, -3.987601, 0.4627451, 1, 0, 1,
-0.6494305, 0.9833333, 0.04645538, 0.4588235, 1, 0, 1,
-0.6474606, 0.02122995, -2.239198, 0.4509804, 1, 0, 1,
-0.6457732, -0.1214915, -1.063808, 0.4470588, 1, 0, 1,
-0.6457078, -1.560564, -2.312879, 0.4392157, 1, 0, 1,
-0.6415654, -0.2266572, -2.067028, 0.4352941, 1, 0, 1,
-0.6348161, -0.6270564, -1.260429, 0.427451, 1, 0, 1,
-0.6339114, -0.7771316, -2.590769, 0.4235294, 1, 0, 1,
-0.6286873, -0.1891257, -3.549073, 0.4156863, 1, 0, 1,
-0.6274978, 0.6607496, -1.693254, 0.4117647, 1, 0, 1,
-0.6273947, -0.6097419, -2.696128, 0.4039216, 1, 0, 1,
-0.62569, -1.076073, -4.816285, 0.3960784, 1, 0, 1,
-0.6210727, -0.7176644, -1.129024, 0.3921569, 1, 0, 1,
-0.6209671, -0.7906645, -2.179996, 0.3843137, 1, 0, 1,
-0.6165861, -0.4399949, -2.033567, 0.3803922, 1, 0, 1,
-0.6125285, -1.38059, -0.7969751, 0.372549, 1, 0, 1,
-0.6102325, -1.059293, -4.349183, 0.3686275, 1, 0, 1,
-0.5968872, -1.077565, -4.504034, 0.3607843, 1, 0, 1,
-0.595751, -0.1671092, -1.997427, 0.3568628, 1, 0, 1,
-0.5928894, -1.744788, -2.285137, 0.3490196, 1, 0, 1,
-0.5833987, -0.5330442, -1.056321, 0.345098, 1, 0, 1,
-0.5795042, -0.8391131, -2.492687, 0.3372549, 1, 0, 1,
-0.5748399, 0.7480519, -1.493439, 0.3333333, 1, 0, 1,
-0.5716411, 0.1228076, 0.2049964, 0.3254902, 1, 0, 1,
-0.5711312, 1.726017, -1.377024, 0.3215686, 1, 0, 1,
-0.5672899, -0.6583687, -3.813663, 0.3137255, 1, 0, 1,
-0.5662803, -0.7052099, -3.006943, 0.3098039, 1, 0, 1,
-0.5655822, -0.04718983, -2.351894, 0.3019608, 1, 0, 1,
-0.5641125, -1.072961, -2.550703, 0.2941177, 1, 0, 1,
-0.5640689, 0.08335064, 0.9185287, 0.2901961, 1, 0, 1,
-0.5624055, -0.6760095, -2.939961, 0.282353, 1, 0, 1,
-0.5569712, 1.380278, -0.2283559, 0.2784314, 1, 0, 1,
-0.5552809, 1.145509, 0.8071502, 0.2705882, 1, 0, 1,
-0.5526858, -0.1288119, -0.4451672, 0.2666667, 1, 0, 1,
-0.5506793, 0.09605584, -0.6014193, 0.2588235, 1, 0, 1,
-0.5474301, 0.0623493, -1.068407, 0.254902, 1, 0, 1,
-0.5473093, 0.5047864, -0.6823052, 0.2470588, 1, 0, 1,
-0.5443796, -1.232253, -2.593021, 0.2431373, 1, 0, 1,
-0.5440304, -1.046821, -3.56909, 0.2352941, 1, 0, 1,
-0.5376309, 0.2208231, -2.322876, 0.2313726, 1, 0, 1,
-0.5358742, -0.2642719, -1.905732, 0.2235294, 1, 0, 1,
-0.5292949, -0.3899191, -2.102491, 0.2196078, 1, 0, 1,
-0.5288112, 0.8332496, -0.9776161, 0.2117647, 1, 0, 1,
-0.5236254, 1.695197, -0.7637044, 0.2078431, 1, 0, 1,
-0.5208465, 1.128291, 0.06526901, 0.2, 1, 0, 1,
-0.5197596, 0.666066, -0.6019571, 0.1921569, 1, 0, 1,
-0.5147607, 0.1926465, -1.143752, 0.1882353, 1, 0, 1,
-0.506807, -0.0922426, -0.5376152, 0.1803922, 1, 0, 1,
-0.506799, 0.8140137, 0.5698116, 0.1764706, 1, 0, 1,
-0.4853832, -0.05462824, -0.9167979, 0.1686275, 1, 0, 1,
-0.4818231, 0.08604541, -2.640882, 0.1647059, 1, 0, 1,
-0.4748198, 0.3464249, 0.8387868, 0.1568628, 1, 0, 1,
-0.4681278, 0.01558445, -2.748513, 0.1529412, 1, 0, 1,
-0.4640143, 1.719916, 0.8718755, 0.145098, 1, 0, 1,
-0.4638543, -1.047611, -4.133005, 0.1411765, 1, 0, 1,
-0.4633481, 0.5574136, -1.646013, 0.1333333, 1, 0, 1,
-0.4592292, -1.015181, -3.731496, 0.1294118, 1, 0, 1,
-0.4500318, 1.219639, 0.0757665, 0.1215686, 1, 0, 1,
-0.4496823, -0.2857749, -3.512391, 0.1176471, 1, 0, 1,
-0.4454726, -1.866119, -5.570131, 0.1098039, 1, 0, 1,
-0.439668, 0.3979738, -0.5697513, 0.1058824, 1, 0, 1,
-0.4356709, -0.0002120679, -2.329863, 0.09803922, 1, 0, 1,
-0.4340362, 0.2309316, -1.04432, 0.09019608, 1, 0, 1,
-0.430142, 0.1088802, -0.9176962, 0.08627451, 1, 0, 1,
-0.4296869, -0.2929256, -2.830201, 0.07843138, 1, 0, 1,
-0.4296727, -1.381315, -3.76712, 0.07450981, 1, 0, 1,
-0.4275768, -0.7377964, -2.484981, 0.06666667, 1, 0, 1,
-0.4242466, -0.5331647, -3.890419, 0.0627451, 1, 0, 1,
-0.4203381, -0.04382897, -1.205205, 0.05490196, 1, 0, 1,
-0.4157651, 1.625448, 0.2646234, 0.05098039, 1, 0, 1,
-0.4121527, -0.072894, 0.9222246, 0.04313726, 1, 0, 1,
-0.4119303, 0.06607117, -2.036994, 0.03921569, 1, 0, 1,
-0.4089776, -1.042039, -2.909953, 0.03137255, 1, 0, 1,
-0.4073431, -1.874611, -2.362158, 0.02745098, 1, 0, 1,
-0.4063315, 1.408885, -1.089549, 0.01960784, 1, 0, 1,
-0.4048921, 1.230777, 0.9369178, 0.01568628, 1, 0, 1,
-0.4024555, 0.0582868, -1.427077, 0.007843138, 1, 0, 1,
-0.4023936, 0.7828204, -0.9401956, 0.003921569, 1, 0, 1,
-0.4014919, -2.807182, -1.969285, 0, 1, 0.003921569, 1,
-0.40006, 1.032874, -1.187524, 0, 1, 0.01176471, 1,
-0.4000074, -0.5283542, -3.797377, 0, 1, 0.01568628, 1,
-0.3998361, 0.3658515, -2.988104, 0, 1, 0.02352941, 1,
-0.3994892, 0.5917286, -0.926172, 0, 1, 0.02745098, 1,
-0.3977801, 1.112779, -1.08356, 0, 1, 0.03529412, 1,
-0.3844197, 1.540619, -1.559608, 0, 1, 0.03921569, 1,
-0.382456, 0.1486423, -3.003147, 0, 1, 0.04705882, 1,
-0.3813699, 0.3462615, -0.8904426, 0, 1, 0.05098039, 1,
-0.3802549, -0.5589547, -2.472701, 0, 1, 0.05882353, 1,
-0.3790876, -1.090919, -2.987043, 0, 1, 0.0627451, 1,
-0.3786882, 1.35609, -0.5292515, 0, 1, 0.07058824, 1,
-0.3746429, 1.991822, 0.5278054, 0, 1, 0.07450981, 1,
-0.3745517, 0.1071768, 1.016605, 0, 1, 0.08235294, 1,
-0.3731596, 1.273613, -1.603316, 0, 1, 0.08627451, 1,
-0.3703334, -0.6272323, -0.8833688, 0, 1, 0.09411765, 1,
-0.3616328, 1.365922, 1.771678, 0, 1, 0.1019608, 1,
-0.3587688, 1.908899, -0.3624672, 0, 1, 0.1058824, 1,
-0.358588, 0.2617599, 0.341525, 0, 1, 0.1137255, 1,
-0.3579662, 0.1598848, -1.197484, 0, 1, 0.1176471, 1,
-0.3560843, 0.5642096, -0.7820135, 0, 1, 0.1254902, 1,
-0.345452, 0.2853758, -0.7353789, 0, 1, 0.1294118, 1,
-0.3451129, -0.8430263, -3.692263, 0, 1, 0.1372549, 1,
-0.343591, -1.333869, -3.254551, 0, 1, 0.1411765, 1,
-0.3420997, -0.2367843, -1.061131, 0, 1, 0.1490196, 1,
-0.3353315, -0.3168719, -1.9804, 0, 1, 0.1529412, 1,
-0.3346958, -0.1549101, -1.579598, 0, 1, 0.1607843, 1,
-0.3335142, -0.02740207, -2.450714, 0, 1, 0.1647059, 1,
-0.3229991, 0.5337324, -0.0490933, 0, 1, 0.172549, 1,
-0.319956, -0.1494579, -1.790901, 0, 1, 0.1764706, 1,
-0.3139885, -0.5594252, -3.362829, 0, 1, 0.1843137, 1,
-0.3133054, -0.7627937, -2.507867, 0, 1, 0.1882353, 1,
-0.3118592, 0.8971218, 0.2423747, 0, 1, 0.1960784, 1,
-0.3115395, 2.494444, 1.133229, 0, 1, 0.2039216, 1,
-0.3085832, 0.3679814, 0.4438352, 0, 1, 0.2078431, 1,
-0.3079478, -1.014427, -2.323899, 0, 1, 0.2156863, 1,
-0.3075751, -0.6174856, -1.52964, 0, 1, 0.2196078, 1,
-0.3058367, -0.699413, -1.531283, 0, 1, 0.227451, 1,
-0.305801, 1.581014, -0.4374924, 0, 1, 0.2313726, 1,
-0.3055483, -0.131021, -0.7249695, 0, 1, 0.2392157, 1,
-0.3036851, -0.6115299, -2.188312, 0, 1, 0.2431373, 1,
-0.3020441, 0.8322397, -0.03132082, 0, 1, 0.2509804, 1,
-0.3015992, 0.725632, -1.776571, 0, 1, 0.254902, 1,
-0.3003722, -2.325121, -3.909848, 0, 1, 0.2627451, 1,
-0.2969329, 0.5952913, -1.837252, 0, 1, 0.2666667, 1,
-0.2961938, 0.1295233, 1.977918, 0, 1, 0.2745098, 1,
-0.2954278, -1.0687, -4.879557, 0, 1, 0.2784314, 1,
-0.2951973, 0.566175, -0.9219378, 0, 1, 0.2862745, 1,
-0.2951945, -0.03013742, -1.98296, 0, 1, 0.2901961, 1,
-0.2949057, 1.065533, -0.9369017, 0, 1, 0.2980392, 1,
-0.2948937, -0.1634525, -2.335741, 0, 1, 0.3058824, 1,
-0.2942325, 0.9049066, 0.6347634, 0, 1, 0.3098039, 1,
-0.2891375, -0.8822118, -3.674705, 0, 1, 0.3176471, 1,
-0.2872734, -0.5696387, -2.771617, 0, 1, 0.3215686, 1,
-0.2849463, -0.2548449, -1.682255, 0, 1, 0.3294118, 1,
-0.2845541, 0.2332745, 0.6908684, 0, 1, 0.3333333, 1,
-0.2843977, -0.138828, -1.133659, 0, 1, 0.3411765, 1,
-0.2803057, 0.8778226, -0.9315218, 0, 1, 0.345098, 1,
-0.2799909, 0.06914593, -1.099761, 0, 1, 0.3529412, 1,
-0.2743188, 1.065881, 0.6964677, 0, 1, 0.3568628, 1,
-0.2721815, -1.787728, -2.601165, 0, 1, 0.3647059, 1,
-0.2695644, -0.5469289, -2.637507, 0, 1, 0.3686275, 1,
-0.2612498, 0.6294656, -0.3279157, 0, 1, 0.3764706, 1,
-0.2607907, -0.0351323, -0.6968107, 0, 1, 0.3803922, 1,
-0.2588095, -1.95766, -2.956893, 0, 1, 0.3882353, 1,
-0.2557766, -1.282227, -3.597449, 0, 1, 0.3921569, 1,
-0.250542, -0.6281429, -3.240159, 0, 1, 0.4, 1,
-0.2482861, 0.1139762, -2.325731, 0, 1, 0.4078431, 1,
-0.2479587, -0.2505423, -2.38321, 0, 1, 0.4117647, 1,
-0.2465833, -0.4616171, -1.15257, 0, 1, 0.4196078, 1,
-0.2447536, -1.089717, -2.510527, 0, 1, 0.4235294, 1,
-0.2331195, -0.3874255, -3.493984, 0, 1, 0.4313726, 1,
-0.2312655, -1.135128, -2.664589, 0, 1, 0.4352941, 1,
-0.2242441, 0.7367254, -0.8157723, 0, 1, 0.4431373, 1,
-0.2151669, 0.7727398, -0.04905531, 0, 1, 0.4470588, 1,
-0.2137361, 0.3638776, -1.869087, 0, 1, 0.454902, 1,
-0.2092062, -0.4002964, -2.790866, 0, 1, 0.4588235, 1,
-0.2051207, -1.103844, -3.784772, 0, 1, 0.4666667, 1,
-0.2031534, 0.05772863, -0.4706834, 0, 1, 0.4705882, 1,
-0.1939032, 0.4323965, 1.436316, 0, 1, 0.4784314, 1,
-0.1918778, -0.3067607, -2.43699, 0, 1, 0.4823529, 1,
-0.1904273, -0.1583325, -2.02739, 0, 1, 0.4901961, 1,
-0.1888856, 1.269347, 1.621109, 0, 1, 0.4941176, 1,
-0.1887968, 0.3977757, -1.483845, 0, 1, 0.5019608, 1,
-0.1879486, 0.8605711, 1.226339, 0, 1, 0.509804, 1,
-0.1862445, -1.27953, -2.801576, 0, 1, 0.5137255, 1,
-0.1827541, 0.1206807, 0.2109934, 0, 1, 0.5215687, 1,
-0.1808455, -0.8719758, -2.256726, 0, 1, 0.5254902, 1,
-0.1786897, 0.1821678, -2.057753, 0, 1, 0.5333334, 1,
-0.1762766, -0.06132228, -3.025685, 0, 1, 0.5372549, 1,
-0.176018, 0.8442748, -0.3315665, 0, 1, 0.5450981, 1,
-0.1686761, 0.7370788, -0.9326609, 0, 1, 0.5490196, 1,
-0.168138, 0.4687634, -0.9810494, 0, 1, 0.5568628, 1,
-0.163744, -1.267754, -2.353891, 0, 1, 0.5607843, 1,
-0.1604065, 0.07731809, -1.453811, 0, 1, 0.5686275, 1,
-0.1584539, -0.294514, -3.003143, 0, 1, 0.572549, 1,
-0.1533997, 0.2632618, -0.3337499, 0, 1, 0.5803922, 1,
-0.1526494, 0.5178524, -0.4479271, 0, 1, 0.5843138, 1,
-0.1506694, -1.765407, -5.05268, 0, 1, 0.5921569, 1,
-0.1482115, -0.2801407, -1.17292, 0, 1, 0.5960785, 1,
-0.1439954, 0.5158574, 1.033095, 0, 1, 0.6039216, 1,
-0.1438746, 0.3307784, -1.129494, 0, 1, 0.6117647, 1,
-0.141976, -0.7427565, -3.154699, 0, 1, 0.6156863, 1,
-0.1415406, -1.440698, -2.462669, 0, 1, 0.6235294, 1,
-0.1401888, -2.416167, -3.705437, 0, 1, 0.627451, 1,
-0.1388774, 1.23843, -0.5431727, 0, 1, 0.6352941, 1,
-0.1370699, -0.03252013, -2.822668, 0, 1, 0.6392157, 1,
-0.1347359, -0.4975689, -3.543475, 0, 1, 0.6470588, 1,
-0.1336641, -0.5513278, -3.610373, 0, 1, 0.6509804, 1,
-0.1324732, -0.07009687, -2.672214, 0, 1, 0.6588235, 1,
-0.1249189, 0.5426498, -1.058614, 0, 1, 0.6627451, 1,
-0.1240914, 1.433418, -0.7193158, 0, 1, 0.6705883, 1,
-0.1164646, 0.7811388, 0.3344847, 0, 1, 0.6745098, 1,
-0.1148346, -0.1696912, -1.842711, 0, 1, 0.682353, 1,
-0.1141529, 1.708043, -0.1865184, 0, 1, 0.6862745, 1,
-0.1079405, 0.1809993, 1.682769, 0, 1, 0.6941177, 1,
-0.1076665, 0.4186189, -0.9828581, 0, 1, 0.7019608, 1,
-0.1041735, -0.4600424, -1.942702, 0, 1, 0.7058824, 1,
-0.1022309, 1.123626, -0.4506791, 0, 1, 0.7137255, 1,
-0.1018373, -1.145544, -4.235992, 0, 1, 0.7176471, 1,
-0.1011294, 1.426333, -0.5754375, 0, 1, 0.7254902, 1,
-0.1001986, 2.058284, -0.7507818, 0, 1, 0.7294118, 1,
-0.09940559, 0.4002913, 1.001412, 0, 1, 0.7372549, 1,
-0.09847169, 1.201058, 0.1436835, 0, 1, 0.7411765, 1,
-0.09625051, -1.285528, -5.188945, 0, 1, 0.7490196, 1,
-0.08982336, 0.9306053, -1.483166, 0, 1, 0.7529412, 1,
-0.08812102, -1.268458, -4.726113, 0, 1, 0.7607843, 1,
-0.07045477, 0.3691775, -0.2934146, 0, 1, 0.7647059, 1,
-0.06801569, -1.863627, -3.112334, 0, 1, 0.772549, 1,
-0.06758995, 0.8423763, 0.1651667, 0, 1, 0.7764706, 1,
-0.06635544, -0.0321462, 0.235259, 0, 1, 0.7843137, 1,
-0.06590905, 1.710258, -0.6508082, 0, 1, 0.7882353, 1,
-0.06494504, 0.8370145, 0.4096127, 0, 1, 0.7960784, 1,
-0.06183795, -0.6807512, -3.181432, 0, 1, 0.8039216, 1,
-0.06014983, -1.71349, -2.4352, 0, 1, 0.8078431, 1,
-0.05919814, 0.2264093, -0.9009809, 0, 1, 0.8156863, 1,
-0.05442475, -1.676761, -2.800203, 0, 1, 0.8196079, 1,
-0.05370512, -1.52111, -1.910021, 0, 1, 0.827451, 1,
-0.05206743, -0.1787623, -2.966013, 0, 1, 0.8313726, 1,
-0.05167832, 0.92066, -0.7106807, 0, 1, 0.8392157, 1,
-0.04712968, 0.5763808, 0.2549274, 0, 1, 0.8431373, 1,
-0.04413657, 0.05638367, -1.043528, 0, 1, 0.8509804, 1,
-0.04380582, 0.09885324, -0.9210684, 0, 1, 0.854902, 1,
-0.04329376, -0.08651561, -2.095638, 0, 1, 0.8627451, 1,
-0.0427514, 1.762306, 0.7636208, 0, 1, 0.8666667, 1,
-0.03976414, 0.4721507, 0.4776989, 0, 1, 0.8745098, 1,
-0.03503867, 0.04122724, -2.69629, 0, 1, 0.8784314, 1,
-0.03108479, -0.8397124, -3.909317, 0, 1, 0.8862745, 1,
-0.02806186, -0.408954, -4.154664, 0, 1, 0.8901961, 1,
-0.02725489, 0.847955, -1.213178, 0, 1, 0.8980392, 1,
-0.02389731, -1.355973, -2.64814, 0, 1, 0.9058824, 1,
-0.02295587, -0.2386662, -3.696896, 0, 1, 0.9098039, 1,
-0.0228981, 0.3045064, 0.02279998, 0, 1, 0.9176471, 1,
-0.02153785, -0.6566533, -3.988183, 0, 1, 0.9215686, 1,
-0.007714378, -0.99695, -4.393703, 0, 1, 0.9294118, 1,
-0.001720601, 0.7192947, -0.1212018, 0, 1, 0.9333333, 1,
0.004059914, -0.1842527, 4.85109, 0, 1, 0.9411765, 1,
0.00585077, 0.2933505, -0.808755, 0, 1, 0.945098, 1,
0.007031976, 1.223486, -0.0008181705, 0, 1, 0.9529412, 1,
0.009952048, 1.55588, 0.4938308, 0, 1, 0.9568627, 1,
0.01715308, 0.5891892, 0.7182702, 0, 1, 0.9647059, 1,
0.02278921, -0.9203856, 2.199455, 0, 1, 0.9686275, 1,
0.02669402, -0.2896824, 2.616685, 0, 1, 0.9764706, 1,
0.03031895, -1.666791, 3.083184, 0, 1, 0.9803922, 1,
0.03611518, -0.3393192, 1.988063, 0, 1, 0.9882353, 1,
0.04043163, -1.05907, 2.128011, 0, 1, 0.9921569, 1,
0.04388674, -0.3720622, 1.715361, 0, 1, 1, 1,
0.04681747, -1.620636, 0.8373951, 0, 0.9921569, 1, 1,
0.05421458, -1.316038, 1.802983, 0, 0.9882353, 1, 1,
0.05745718, -1.042753, 2.757366, 0, 0.9803922, 1, 1,
0.06029084, -0.7675539, 2.577371, 0, 0.9764706, 1, 1,
0.06642117, 0.931906, -1.424722, 0, 0.9686275, 1, 1,
0.06659247, -1.909437, 1.653889, 0, 0.9647059, 1, 1,
0.06859428, 0.5860748, 0.04838688, 0, 0.9568627, 1, 1,
0.07172517, 0.5180508, 0.2320039, 0, 0.9529412, 1, 1,
0.07263386, -0.1617399, 2.344852, 0, 0.945098, 1, 1,
0.07340726, -0.5157996, 4.305308, 0, 0.9411765, 1, 1,
0.07833809, 0.7582342, 0.7451161, 0, 0.9333333, 1, 1,
0.08018276, 1.099221, -0.09448553, 0, 0.9294118, 1, 1,
0.08125979, -0.3031804, 2.935396, 0, 0.9215686, 1, 1,
0.0817373, -3.050405, 3.142501, 0, 0.9176471, 1, 1,
0.08256878, -1.439438, 3.495274, 0, 0.9098039, 1, 1,
0.08378961, -0.7415273, 1.866791, 0, 0.9058824, 1, 1,
0.08513258, 0.4933321, 0.3510626, 0, 0.8980392, 1, 1,
0.08693107, -2.192704, 2.917905, 0, 0.8901961, 1, 1,
0.08694986, -0.3778844, 2.947623, 0, 0.8862745, 1, 1,
0.09017162, 0.3894121, 0.3577426, 0, 0.8784314, 1, 1,
0.09199753, 0.8375248, -0.3608049, 0, 0.8745098, 1, 1,
0.09310944, -0.2114701, 1.794209, 0, 0.8666667, 1, 1,
0.09459136, 0.3890851, 1.335438, 0, 0.8627451, 1, 1,
0.09537204, -0.940295, 5.264499, 0, 0.854902, 1, 1,
0.1000953, -1.088018, 2.857327, 0, 0.8509804, 1, 1,
0.1010276, -0.2256664, 2.699027, 0, 0.8431373, 1, 1,
0.1010705, -0.4693539, 4.294991, 0, 0.8392157, 1, 1,
0.1037842, -0.7097948, 3.118936, 0, 0.8313726, 1, 1,
0.1041619, -2.006298, 3.971455, 0, 0.827451, 1, 1,
0.1043504, 0.224351, 0.4445742, 0, 0.8196079, 1, 1,
0.1057232, 0.6029145, -0.6882827, 0, 0.8156863, 1, 1,
0.1090109, -0.5148737, 1.370176, 0, 0.8078431, 1, 1,
0.1095855, 0.6515095, -0.8777974, 0, 0.8039216, 1, 1,
0.1126268, 0.054435, 1.068032, 0, 0.7960784, 1, 1,
0.1137952, 0.4667186, 0.07123721, 0, 0.7882353, 1, 1,
0.11441, -0.5170693, 3.804722, 0, 0.7843137, 1, 1,
0.1145928, 0.3291827, 0.9793041, 0, 0.7764706, 1, 1,
0.1149354, -0.5657702, 2.119996, 0, 0.772549, 1, 1,
0.1168441, -1.443887, 3.146106, 0, 0.7647059, 1, 1,
0.117898, 0.2095928, 0.4971851, 0, 0.7607843, 1, 1,
0.1181615, 0.03459236, 2.54353, 0, 0.7529412, 1, 1,
0.1218825, -0.5120046, 2.233915, 0, 0.7490196, 1, 1,
0.1230803, 0.03878419, 3.338783, 0, 0.7411765, 1, 1,
0.1233621, 1.472315, 1.269839, 0, 0.7372549, 1, 1,
0.1251452, -0.09805554, 3.359102, 0, 0.7294118, 1, 1,
0.1288557, 1.223094, -0.3387915, 0, 0.7254902, 1, 1,
0.1308929, 0.06308699, 1.8908, 0, 0.7176471, 1, 1,
0.131992, 3.015054, -0.4583605, 0, 0.7137255, 1, 1,
0.1373668, 0.5975958, 0.575606, 0, 0.7058824, 1, 1,
0.1447229, 1.13889, -0.6630433, 0, 0.6980392, 1, 1,
0.148193, 1.825987, 0.2636358, 0, 0.6941177, 1, 1,
0.1509612, 1.338898, 1.390824, 0, 0.6862745, 1, 1,
0.1523811, 0.001762735, 0.803695, 0, 0.682353, 1, 1,
0.1546491, 0.09290817, 2.028658, 0, 0.6745098, 1, 1,
0.1572541, 0.8340943, -0.1707898, 0, 0.6705883, 1, 1,
0.1595547, -0.08774002, 1.647926, 0, 0.6627451, 1, 1,
0.1607264, -0.500375, 3.136419, 0, 0.6588235, 1, 1,
0.1616494, -0.06147691, 1.461661, 0, 0.6509804, 1, 1,
0.1670796, -0.04810757, 3.796153, 0, 0.6470588, 1, 1,
0.1707538, -0.1847268, 3.582445, 0, 0.6392157, 1, 1,
0.1712741, -1.129845, 2.526814, 0, 0.6352941, 1, 1,
0.1716362, 1.18761, -0.2461624, 0, 0.627451, 1, 1,
0.1722335, -0.9133083, 2.084625, 0, 0.6235294, 1, 1,
0.1778514, 1.384101, -1.66437, 0, 0.6156863, 1, 1,
0.1780417, -0.006341449, 0.4606035, 0, 0.6117647, 1, 1,
0.1783982, 0.1806673, -0.02452176, 0, 0.6039216, 1, 1,
0.1810475, -1.071556, 2.624838, 0, 0.5960785, 1, 1,
0.1814847, -0.0319172, -0.266992, 0, 0.5921569, 1, 1,
0.1844226, -0.5676686, 1.850411, 0, 0.5843138, 1, 1,
0.187321, -0.4207841, 4.473685, 0, 0.5803922, 1, 1,
0.1933825, 1.248388, -1.236024, 0, 0.572549, 1, 1,
0.209643, -1.084586, 2.282525, 0, 0.5686275, 1, 1,
0.2126921, -3.088992, 4.19344, 0, 0.5607843, 1, 1,
0.2133344, 0.8410995, -2.109133, 0, 0.5568628, 1, 1,
0.2164433, 0.6905108, -1.875676, 0, 0.5490196, 1, 1,
0.2176714, -1.021722, 3.335561, 0, 0.5450981, 1, 1,
0.2179966, 0.01936664, 2.007584, 0, 0.5372549, 1, 1,
0.2180156, -0.6349325, 2.814186, 0, 0.5333334, 1, 1,
0.225028, 1.107553, -0.730917, 0, 0.5254902, 1, 1,
0.2262574, 0.02051151, 0.4044434, 0, 0.5215687, 1, 1,
0.2275772, 0.09374391, 2.545821, 0, 0.5137255, 1, 1,
0.2318452, 0.1546652, 0.6321694, 0, 0.509804, 1, 1,
0.2321961, -2.140448, 2.338646, 0, 0.5019608, 1, 1,
0.2351118, -0.8245248, 3.801653, 0, 0.4941176, 1, 1,
0.2353999, -0.6283254, 2.719786, 0, 0.4901961, 1, 1,
0.2354596, 1.443515, 0.8376344, 0, 0.4823529, 1, 1,
0.2361631, -0.2391849, 3.856607, 0, 0.4784314, 1, 1,
0.2373129, -1.029697, 3.602543, 0, 0.4705882, 1, 1,
0.2399483, 0.8041875, -1.807022, 0, 0.4666667, 1, 1,
0.2419469, 0.4075705, 1.27012, 0, 0.4588235, 1, 1,
0.2468376, -0.7768703, 2.143255, 0, 0.454902, 1, 1,
0.2481715, -1.613965, 3.353531, 0, 0.4470588, 1, 1,
0.2503298, 0.2931494, 0.2274213, 0, 0.4431373, 1, 1,
0.2507441, 0.6291191, -0.5021908, 0, 0.4352941, 1, 1,
0.2522388, 0.4304773, 2.377316, 0, 0.4313726, 1, 1,
0.2531585, -0.7334903, 1.813632, 0, 0.4235294, 1, 1,
0.2615107, -0.7701882, 2.44705, 0, 0.4196078, 1, 1,
0.2639129, -2.239946, 3.532036, 0, 0.4117647, 1, 1,
0.2652979, 0.5420507, 1.174949, 0, 0.4078431, 1, 1,
0.2677675, -0.06367157, 1.506051, 0, 0.4, 1, 1,
0.2682646, 0.1117577, 0.3556304, 0, 0.3921569, 1, 1,
0.2717082, -0.2243911, 2.793558, 0, 0.3882353, 1, 1,
0.272721, 1.51353, 2.537604, 0, 0.3803922, 1, 1,
0.2738765, 0.7565102, -0.26757, 0, 0.3764706, 1, 1,
0.2886514, -0.6990049, 2.154466, 0, 0.3686275, 1, 1,
0.2932441, 0.08209403, 1.76182, 0, 0.3647059, 1, 1,
0.2946054, -1.522715, 1.036302, 0, 0.3568628, 1, 1,
0.295651, 1.888277, 1.456968, 0, 0.3529412, 1, 1,
0.3048503, 0.6259404, 0.6223472, 0, 0.345098, 1, 1,
0.307676, 0.7343799, -1.218915, 0, 0.3411765, 1, 1,
0.3083129, 1.883444, 0.3073438, 0, 0.3333333, 1, 1,
0.3095397, 1.224808, 1.645602, 0, 0.3294118, 1, 1,
0.3113573, -0.6289558, 3.581907, 0, 0.3215686, 1, 1,
0.3117028, -1.316354, 1.99509, 0, 0.3176471, 1, 1,
0.3152058, -0.5954721, 1.721302, 0, 0.3098039, 1, 1,
0.3169794, 0.3534364, 1.231741, 0, 0.3058824, 1, 1,
0.3174359, 0.01567606, 1.839792, 0, 0.2980392, 1, 1,
0.3209204, 1.042642, 0.6518104, 0, 0.2901961, 1, 1,
0.3287928, -0.2763282, 1.408001, 0, 0.2862745, 1, 1,
0.3306571, 0.456826, -0.5834092, 0, 0.2784314, 1, 1,
0.3357757, -1.724033, 2.284268, 0, 0.2745098, 1, 1,
0.3400583, 0.1266809, 1.334162, 0, 0.2666667, 1, 1,
0.3426196, 0.5843378, -0.7000143, 0, 0.2627451, 1, 1,
0.3467051, -2.177818, 3.057802, 0, 0.254902, 1, 1,
0.3474027, 0.9163859, 0.5689597, 0, 0.2509804, 1, 1,
0.3492441, 0.06563146, 1.054974, 0, 0.2431373, 1, 1,
0.352737, 0.3670706, 0.6750644, 0, 0.2392157, 1, 1,
0.35921, -2.165562, 4.290517, 0, 0.2313726, 1, 1,
0.3607548, -0.01593367, 1.852896, 0, 0.227451, 1, 1,
0.3611013, 1.149468, 0.9751322, 0, 0.2196078, 1, 1,
0.361571, 1.60639, -1.804649, 0, 0.2156863, 1, 1,
0.3650164, 1.260158, 0.3504042, 0, 0.2078431, 1, 1,
0.3686742, -0.8266569, 2.004772, 0, 0.2039216, 1, 1,
0.3739305, 2.165817, 0.1506596, 0, 0.1960784, 1, 1,
0.3749316, -0.588738, 3.445187, 0, 0.1882353, 1, 1,
0.3764524, -0.4931564, 1.566785, 0, 0.1843137, 1, 1,
0.3784288, 0.2578131, 0.4220793, 0, 0.1764706, 1, 1,
0.3809397, 0.5469979, -0.5477801, 0, 0.172549, 1, 1,
0.3817155, 1.494123, 0.01935231, 0, 0.1647059, 1, 1,
0.3822705, 0.05062196, 1.604913, 0, 0.1607843, 1, 1,
0.3839726, 0.5889381, 0.4024797, 0, 0.1529412, 1, 1,
0.3899196, -0.297913, 1.003227, 0, 0.1490196, 1, 1,
0.3942229, -0.3674366, 2.382398, 0, 0.1411765, 1, 1,
0.3951063, -1.147256, 3.766677, 0, 0.1372549, 1, 1,
0.3955896, 0.9773141, -1.241109, 0, 0.1294118, 1, 1,
0.401109, -0.397933, 1.298066, 0, 0.1254902, 1, 1,
0.405403, 0.1458846, 2.626728, 0, 0.1176471, 1, 1,
0.4067828, -0.5191129, 1.655043, 0, 0.1137255, 1, 1,
0.4087993, 0.0008848706, 1.410392, 0, 0.1058824, 1, 1,
0.4110978, 1.828065, -0.3686146, 0, 0.09803922, 1, 1,
0.4154325, -2.035411, 1.751417, 0, 0.09411765, 1, 1,
0.4154478, -0.2452181, 3.495863, 0, 0.08627451, 1, 1,
0.4160707, 0.7795823, -0.2906397, 0, 0.08235294, 1, 1,
0.4300041, 0.5916198, 0.9928662, 0, 0.07450981, 1, 1,
0.4351713, -0.06826329, 1.443002, 0, 0.07058824, 1, 1,
0.435944, -0.64412, 2.874539, 0, 0.0627451, 1, 1,
0.4389375, 0.02459954, 0.7136693, 0, 0.05882353, 1, 1,
0.4404998, 0.1012609, 1.358848, 0, 0.05098039, 1, 1,
0.4475031, -0.3675122, 1.445863, 0, 0.04705882, 1, 1,
0.4549932, 0.6002948, 0.4261765, 0, 0.03921569, 1, 1,
0.4576615, -0.6413605, 1.836941, 0, 0.03529412, 1, 1,
0.4646749, -0.6653916, 1.808042, 0, 0.02745098, 1, 1,
0.4660849, 0.7415811, 0.4880894, 0, 0.02352941, 1, 1,
0.4716899, -0.2341078, 1.965218, 0, 0.01568628, 1, 1,
0.4772129, 2.015407, -0.9130496, 0, 0.01176471, 1, 1,
0.4803495, 1.382179, -0.6682447, 0, 0.003921569, 1, 1,
0.482044, 1.277902, 0.664455, 0.003921569, 0, 1, 1,
0.4836292, -0.9676479, 3.091306, 0.007843138, 0, 1, 1,
0.4862412, 1.008509, 1.02729, 0.01568628, 0, 1, 1,
0.4899428, -0.7727082, 1.697541, 0.01960784, 0, 1, 1,
0.4924508, -0.1806657, 1.11488, 0.02745098, 0, 1, 1,
0.494505, 1.614281, -0.1448347, 0.03137255, 0, 1, 1,
0.4958174, 0.2267059, 1.047774, 0.03921569, 0, 1, 1,
0.5018107, 1.954, -1.947533, 0.04313726, 0, 1, 1,
0.5054274, 0.710265, 1.848079, 0.05098039, 0, 1, 1,
0.5060258, 1.522028, 1.892876, 0.05490196, 0, 1, 1,
0.5063087, -0.812341, 3.299373, 0.0627451, 0, 1, 1,
0.5080798, 1.341093, -0.6389722, 0.06666667, 0, 1, 1,
0.5085092, 0.5207686, 0.3485328, 0.07450981, 0, 1, 1,
0.5191777, -0.427972, 2.159247, 0.07843138, 0, 1, 1,
0.5255408, 1.641205, -0.1436485, 0.08627451, 0, 1, 1,
0.5272546, -0.9250135, 2.925682, 0.09019608, 0, 1, 1,
0.5324089, -0.5546714, 3.547819, 0.09803922, 0, 1, 1,
0.533859, -0.3186376, 1.997079, 0.1058824, 0, 1, 1,
0.539587, 0.2685601, 0.09133718, 0.1098039, 0, 1, 1,
0.541141, -0.04638556, 1.663575, 0.1176471, 0, 1, 1,
0.5431692, 0.7516735, 2.208837, 0.1215686, 0, 1, 1,
0.544681, 0.3212304, 1.07403, 0.1294118, 0, 1, 1,
0.5467607, 1.048156, 0.3889678, 0.1333333, 0, 1, 1,
0.5477429, 0.3999437, -0.4932494, 0.1411765, 0, 1, 1,
0.5493088, 1.44824, 0.08743718, 0.145098, 0, 1, 1,
0.5501121, 0.3716717, 0.2860267, 0.1529412, 0, 1, 1,
0.5532039, -0.6372587, 2.81374, 0.1568628, 0, 1, 1,
0.5556875, 1.664427, -0.5931184, 0.1647059, 0, 1, 1,
0.5609889, 0.1322371, 0.8710621, 0.1686275, 0, 1, 1,
0.566088, -0.1266963, 2.171589, 0.1764706, 0, 1, 1,
0.5737476, 0.3877861, 1.246689, 0.1803922, 0, 1, 1,
0.5801335, 0.05914596, 0.7864366, 0.1882353, 0, 1, 1,
0.5857978, -0.2826068, 0.9675328, 0.1921569, 0, 1, 1,
0.5862279, -1.963352, 1.623831, 0.2, 0, 1, 1,
0.5904462, -1.054881, 2.149649, 0.2078431, 0, 1, 1,
0.5923219, -0.07651347, 0.6030476, 0.2117647, 0, 1, 1,
0.5927343, 1.560411, 1.361493, 0.2196078, 0, 1, 1,
0.5973901, 0.01506944, 0.347686, 0.2235294, 0, 1, 1,
0.6044538, 0.08143873, 1.582028, 0.2313726, 0, 1, 1,
0.6061757, -0.2164667, 3.261491, 0.2352941, 0, 1, 1,
0.6067363, -0.5041516, 0.4492538, 0.2431373, 0, 1, 1,
0.6095518, -0.1169992, 0.1068801, 0.2470588, 0, 1, 1,
0.6096719, 0.332766, 1.260868, 0.254902, 0, 1, 1,
0.6141823, -0.9209838, 4.442633, 0.2588235, 0, 1, 1,
0.6215759, -0.5899692, 0.7670536, 0.2666667, 0, 1, 1,
0.6234491, -0.7149796, 1.883931, 0.2705882, 0, 1, 1,
0.6258351, -0.4353653, 1.036877, 0.2784314, 0, 1, 1,
0.6270854, 0.9065961, 0.07238925, 0.282353, 0, 1, 1,
0.6306935, 1.78881, 1.153781, 0.2901961, 0, 1, 1,
0.6381848, -0.7632257, 1.770309, 0.2941177, 0, 1, 1,
0.6421162, 0.2145636, 3.096568, 0.3019608, 0, 1, 1,
0.6429679, 0.1643531, 1.11156, 0.3098039, 0, 1, 1,
0.6444998, -0.748491, 1.697636, 0.3137255, 0, 1, 1,
0.6452057, 0.9231398, 1.0415, 0.3215686, 0, 1, 1,
0.6460188, -0.9924574, 3.338162, 0.3254902, 0, 1, 1,
0.6491254, 0.4825171, 0.2868263, 0.3333333, 0, 1, 1,
0.6529504, -0.0119457, 2.032418, 0.3372549, 0, 1, 1,
0.655799, -0.8259933, 1.1956, 0.345098, 0, 1, 1,
0.6577565, 0.7775578, -0.3043516, 0.3490196, 0, 1, 1,
0.6596496, 1.441931, 0.5792905, 0.3568628, 0, 1, 1,
0.66294, 0.5432363, 1.470155, 0.3607843, 0, 1, 1,
0.6654302, -0.2542501, 2.861139, 0.3686275, 0, 1, 1,
0.6662849, 1.215627, 0.7523135, 0.372549, 0, 1, 1,
0.6730354, -1.532336, 2.410753, 0.3803922, 0, 1, 1,
0.6730418, 0.7760062, 1.123418, 0.3843137, 0, 1, 1,
0.6740834, 0.7533187, 0.7934104, 0.3921569, 0, 1, 1,
0.6749244, 0.4946679, 1.274108, 0.3960784, 0, 1, 1,
0.6768619, 0.5016906, 0.961848, 0.4039216, 0, 1, 1,
0.6775345, 0.07110492, 0.6022649, 0.4117647, 0, 1, 1,
0.6825641, 0.7000242, 1.23889, 0.4156863, 0, 1, 1,
0.6873252, -0.7489547, 0.0758086, 0.4235294, 0, 1, 1,
0.6877526, -1.483344, 1.628769, 0.427451, 0, 1, 1,
0.6963269, 0.09608556, 0.7239003, 0.4352941, 0, 1, 1,
0.697504, 0.2021709, 0.545105, 0.4392157, 0, 1, 1,
0.7021282, 0.1319762, 0.06105468, 0.4470588, 0, 1, 1,
0.7035879, -0.9398257, 2.931636, 0.4509804, 0, 1, 1,
0.7062873, 0.2079121, 0.845993, 0.4588235, 0, 1, 1,
0.7077562, 0.3125615, 1.953791, 0.4627451, 0, 1, 1,
0.7087995, -1.486411, 3.675737, 0.4705882, 0, 1, 1,
0.7138289, -1.24977, 2.554586, 0.4745098, 0, 1, 1,
0.7139719, 0.1512659, 2.710265, 0.4823529, 0, 1, 1,
0.7147266, 1.123974, -0.5361732, 0.4862745, 0, 1, 1,
0.7173288, 0.2352247, 1.306785, 0.4941176, 0, 1, 1,
0.7207069, -1.511871, 1.905675, 0.5019608, 0, 1, 1,
0.7228987, -0.05463312, 4.314734, 0.5058824, 0, 1, 1,
0.7234608, 0.3064294, 0.450926, 0.5137255, 0, 1, 1,
0.7249303, -0.3073881, 2.570522, 0.5176471, 0, 1, 1,
0.7257151, -0.1301958, -2.524094, 0.5254902, 0, 1, 1,
0.7268559, -1.221948, 0.6502607, 0.5294118, 0, 1, 1,
0.7329805, -0.282405, 1.824896, 0.5372549, 0, 1, 1,
0.734262, 0.0291474, 1.985117, 0.5411765, 0, 1, 1,
0.7355888, 1.410087, 1.173094, 0.5490196, 0, 1, 1,
0.7371987, 0.3494264, 2.231685, 0.5529412, 0, 1, 1,
0.7506155, 0.2635829, 1.543174, 0.5607843, 0, 1, 1,
0.7513625, -0.5516396, -0.03076473, 0.5647059, 0, 1, 1,
0.7582291, 1.204569, 1.677188, 0.572549, 0, 1, 1,
0.7627343, 1.325705, 0.3888642, 0.5764706, 0, 1, 1,
0.7628796, -1.082663, 2.110739, 0.5843138, 0, 1, 1,
0.7641293, -0.9018677, 1.071713, 0.5882353, 0, 1, 1,
0.7673082, -0.02666714, 1.750401, 0.5960785, 0, 1, 1,
0.7685819, -1.260428, 3.061331, 0.6039216, 0, 1, 1,
0.7699108, -0.247259, 2.14075, 0.6078432, 0, 1, 1,
0.7720379, -0.01388133, 2.844686, 0.6156863, 0, 1, 1,
0.7753009, 0.4683462, 0.733471, 0.6196079, 0, 1, 1,
0.7758138, 0.8329237, 1.252065, 0.627451, 0, 1, 1,
0.7772202, -0.8124653, 2.232322, 0.6313726, 0, 1, 1,
0.7832652, -1.679901, 3.547965, 0.6392157, 0, 1, 1,
0.7909797, -0.02405015, 2.182186, 0.6431373, 0, 1, 1,
0.7978681, 0.7563902, -0.9206222, 0.6509804, 0, 1, 1,
0.7991158, -0.704473, 2.87385, 0.654902, 0, 1, 1,
0.8075944, 0.6910784, 0.5876543, 0.6627451, 0, 1, 1,
0.8113548, -0.1867924, 1.049624, 0.6666667, 0, 1, 1,
0.8124387, -0.2764537, 1.405502, 0.6745098, 0, 1, 1,
0.818414, -0.3480977, 3.044333, 0.6784314, 0, 1, 1,
0.8187168, -1.080578, 3.219316, 0.6862745, 0, 1, 1,
0.8253968, -0.7027825, 2.627712, 0.6901961, 0, 1, 1,
0.8280891, 2.457086, -1.1493, 0.6980392, 0, 1, 1,
0.8296589, -1.023373, 2.751336, 0.7058824, 0, 1, 1,
0.8343402, 0.5997475, 0.9817401, 0.7098039, 0, 1, 1,
0.8367622, -0.2858478, 0.5230893, 0.7176471, 0, 1, 1,
0.8405197, 1.227414, 0.385477, 0.7215686, 0, 1, 1,
0.8413979, -0.2858228, 1.418903, 0.7294118, 0, 1, 1,
0.8429219, -0.529249, 0.7612573, 0.7333333, 0, 1, 1,
0.8506481, 0.04484994, 2.134414, 0.7411765, 0, 1, 1,
0.8510546, -1.189222, 3.172332, 0.7450981, 0, 1, 1,
0.8539962, 0.6657532, 2.701397, 0.7529412, 0, 1, 1,
0.854315, 0.003320522, 0.02841242, 0.7568628, 0, 1, 1,
0.8543904, -0.3638976, 0.800678, 0.7647059, 0, 1, 1,
0.8605186, 2.200036, 0.4027703, 0.7686275, 0, 1, 1,
0.8606163, -0.6059744, 5.476037, 0.7764706, 0, 1, 1,
0.866757, 1.01307, 1.503036, 0.7803922, 0, 1, 1,
0.8679245, -0.02044008, 1.510499, 0.7882353, 0, 1, 1,
0.8702036, -0.6198738, 0.7044811, 0.7921569, 0, 1, 1,
0.8710064, -2.11857, 3.905251, 0.8, 0, 1, 1,
0.872537, 1.315681, 0.7164538, 0.8078431, 0, 1, 1,
0.8981784, 0.09678949, 0.8479376, 0.8117647, 0, 1, 1,
0.8981918, 0.8591108, 1.372104, 0.8196079, 0, 1, 1,
0.8983668, 2.391873, 0.2105562, 0.8235294, 0, 1, 1,
0.9065423, -0.654512, 2.689899, 0.8313726, 0, 1, 1,
0.9115456, 0.07623347, 0.9921719, 0.8352941, 0, 1, 1,
0.9120101, 1.045427, 0.1814875, 0.8431373, 0, 1, 1,
0.9151585, 0.9133515, -0.4200634, 0.8470588, 0, 1, 1,
0.9169468, 1.901116, 0.04078564, 0.854902, 0, 1, 1,
0.9205436, 0.3722168, 1.386757, 0.8588235, 0, 1, 1,
0.9370996, -0.05542495, 1.920043, 0.8666667, 0, 1, 1,
0.9382941, 2.224102, -0.3473661, 0.8705882, 0, 1, 1,
0.9451239, 0.8744218, -1.601514, 0.8784314, 0, 1, 1,
0.9473485, -0.06762818, 2.881648, 0.8823529, 0, 1, 1,
0.9512886, -2.087073, 2.581834, 0.8901961, 0, 1, 1,
0.9540263, 1.775804, -0.06756018, 0.8941177, 0, 1, 1,
0.9549786, 0.08477578, 0.4109986, 0.9019608, 0, 1, 1,
0.9569301, -1.061276, 2.531939, 0.9098039, 0, 1, 1,
0.9580846, 0.5068197, 0.8429629, 0.9137255, 0, 1, 1,
0.9661017, -0.1150345, 1.72741, 0.9215686, 0, 1, 1,
0.9667689, -0.7573964, 1.635569, 0.9254902, 0, 1, 1,
0.971288, 0.3389254, 1.824267, 0.9333333, 0, 1, 1,
0.9731784, 1.195771, 0.4362193, 0.9372549, 0, 1, 1,
0.9734609, 0.5252687, 1.200315, 0.945098, 0, 1, 1,
0.9820694, 0.7430861, -1.558106, 0.9490196, 0, 1, 1,
0.9849567, -0.3865519, 1.575108, 0.9568627, 0, 1, 1,
1.001583, 0.2573416, 1.034723, 0.9607843, 0, 1, 1,
1.003964, 0.5184748, 0.3319979, 0.9686275, 0, 1, 1,
1.008824, 0.5405058, 0.866949, 0.972549, 0, 1, 1,
1.021358, -0.2430553, 3.1521, 0.9803922, 0, 1, 1,
1.027307, -0.2072231, 1.72743, 0.9843137, 0, 1, 1,
1.031404, 0.9021201, 0.422514, 0.9921569, 0, 1, 1,
1.040053, -0.4748321, 2.669395, 0.9960784, 0, 1, 1,
1.042026, -0.4554466, 1.251207, 1, 0, 0.9960784, 1,
1.042314, 0.8571517, 0.2245687, 1, 0, 0.9882353, 1,
1.045353, 1.673596, 2.198337, 1, 0, 0.9843137, 1,
1.046107, -1.03016, 1.681016, 1, 0, 0.9764706, 1,
1.047321, -0.2101085, 3.234663, 1, 0, 0.972549, 1,
1.047789, -0.7916292, 3.495438, 1, 0, 0.9647059, 1,
1.053155, -1.621566, 1.145917, 1, 0, 0.9607843, 1,
1.053991, 2.007925, 1.505618, 1, 0, 0.9529412, 1,
1.057164, -0.1806538, -0.2606915, 1, 0, 0.9490196, 1,
1.05796, -2.008981, 2.638851, 1, 0, 0.9411765, 1,
1.061365, 1.298875, 2.440657, 1, 0, 0.9372549, 1,
1.064595, -1.883658, 2.826926, 1, 0, 0.9294118, 1,
1.068718, -0.3881675, 1.746626, 1, 0, 0.9254902, 1,
1.079199, 0.01236496, 2.544611, 1, 0, 0.9176471, 1,
1.084358, 0.09960226, 0.4747157, 1, 0, 0.9137255, 1,
1.08631, 0.8351573, 1.089508, 1, 0, 0.9058824, 1,
1.089345, 0.460789, 1.143997, 1, 0, 0.9019608, 1,
1.10299, -0.2371215, 1.671881, 1, 0, 0.8941177, 1,
1.109491, 0.1806791, 0.424077, 1, 0, 0.8862745, 1,
1.112399, 1.207638, -0.4639999, 1, 0, 0.8823529, 1,
1.120952, 0.858578, 0.3406538, 1, 0, 0.8745098, 1,
1.122454, 0.1536871, 1.128456, 1, 0, 0.8705882, 1,
1.12417, -1.680604, 1.699594, 1, 0, 0.8627451, 1,
1.12484, -1.53748, 2.724945, 1, 0, 0.8588235, 1,
1.127975, 0.5499908, 2.471195, 1, 0, 0.8509804, 1,
1.132237, -0.1123487, 1.830103, 1, 0, 0.8470588, 1,
1.147823, 0.5579725, 0.5652741, 1, 0, 0.8392157, 1,
1.149638, 1.07803, 2.030945, 1, 0, 0.8352941, 1,
1.156092, 1.09124, 0.4956209, 1, 0, 0.827451, 1,
1.156733, 1.564473, 0.5513775, 1, 0, 0.8235294, 1,
1.158297, -2.561634, 1.906458, 1, 0, 0.8156863, 1,
1.163115, 1.40968, 2.38775, 1, 0, 0.8117647, 1,
1.165488, 1.454953, 0.9153425, 1, 0, 0.8039216, 1,
1.170867, 0.6142553, 3.936106, 1, 0, 0.7960784, 1,
1.173054, 0.06553832, 1.461336, 1, 0, 0.7921569, 1,
1.173797, 0.9062734, 1.051888, 1, 0, 0.7843137, 1,
1.175872, 0.4599814, -0.2100069, 1, 0, 0.7803922, 1,
1.180308, -0.04089922, 2.93758, 1, 0, 0.772549, 1,
1.182164, 1.108143, 0.3863837, 1, 0, 0.7686275, 1,
1.184172, 0.8725415, 2.058699, 1, 0, 0.7607843, 1,
1.189091, -0.009598528, 1.572945, 1, 0, 0.7568628, 1,
1.199449, 0.3954488, 2.040983, 1, 0, 0.7490196, 1,
1.213124, -1.078498, 5.348437, 1, 0, 0.7450981, 1,
1.213549, -0.9564605, 2.614048, 1, 0, 0.7372549, 1,
1.220539, 0.7192402, 1.16164, 1, 0, 0.7333333, 1,
1.231538, 1.118804, 0.872001, 1, 0, 0.7254902, 1,
1.250681, 0.1800061, 1.344263, 1, 0, 0.7215686, 1,
1.253316, 0.212696, 0.5032533, 1, 0, 0.7137255, 1,
1.265084, -0.6696367, 3.155705, 1, 0, 0.7098039, 1,
1.26527, 0.3966785, 2.207641, 1, 0, 0.7019608, 1,
1.273052, 1.449057, 1.370068, 1, 0, 0.6941177, 1,
1.276607, 0.9100225, 1.072879, 1, 0, 0.6901961, 1,
1.279419, -1.497796, 5.089126, 1, 0, 0.682353, 1,
1.280348, -0.8920623, 2.299448, 1, 0, 0.6784314, 1,
1.281196, -0.2735517, 2.230205, 1, 0, 0.6705883, 1,
1.289382, 1.770658, -0.06986126, 1, 0, 0.6666667, 1,
1.291645, 2.331048, 1.995072, 1, 0, 0.6588235, 1,
1.29712, 0.7296498, -0.4055159, 1, 0, 0.654902, 1,
1.303632, 1.572813, 0.7217548, 1, 0, 0.6470588, 1,
1.307946, -1.946495, 2.381028, 1, 0, 0.6431373, 1,
1.308488, 0.4547007, 2.151926, 1, 0, 0.6352941, 1,
1.313612, 0.1139607, 0.3452731, 1, 0, 0.6313726, 1,
1.319945, -0.4726308, 3.490785, 1, 0, 0.6235294, 1,
1.325648, -1.329224, 2.548783, 1, 0, 0.6196079, 1,
1.3268, -0.3314046, 0.07292421, 1, 0, 0.6117647, 1,
1.337369, 0.9654226, 1.811555, 1, 0, 0.6078432, 1,
1.338651, 2.692461, 0.3477129, 1, 0, 0.6, 1,
1.355615, 0.8972608, -0.9563406, 1, 0, 0.5921569, 1,
1.364415, 0.3444246, 1.951003, 1, 0, 0.5882353, 1,
1.379628, -0.4614405, 1.062648, 1, 0, 0.5803922, 1,
1.382264, -0.4236088, -0.1351061, 1, 0, 0.5764706, 1,
1.407576, -1.122966, 1.990083, 1, 0, 0.5686275, 1,
1.41096, -0.06941832, -0.495448, 1, 0, 0.5647059, 1,
1.416498, -0.4627141, 2.020669, 1, 0, 0.5568628, 1,
1.426558, -0.5546567, 3.097787, 1, 0, 0.5529412, 1,
1.441129, -0.6886819, 1.858049, 1, 0, 0.5450981, 1,
1.454229, -1.334827, -0.4098039, 1, 0, 0.5411765, 1,
1.454648, -0.7975358, 2.894006, 1, 0, 0.5333334, 1,
1.461028, 0.08000771, 1.225275, 1, 0, 0.5294118, 1,
1.461137, -0.4468389, 2.357443, 1, 0, 0.5215687, 1,
1.467724, -0.5486684, 1.974385, 1, 0, 0.5176471, 1,
1.474902, -0.7388203, -0.4555252, 1, 0, 0.509804, 1,
1.479201, -0.8377281, 1.068847, 1, 0, 0.5058824, 1,
1.479363, 1.303089, 1.657137, 1, 0, 0.4980392, 1,
1.481308, 0.006569084, 2.092039, 1, 0, 0.4901961, 1,
1.514275, 3.591473, -0.9171824, 1, 0, 0.4862745, 1,
1.524566, 1.321475, -0.2255547, 1, 0, 0.4784314, 1,
1.525456, -0.7871453, 2.092899, 1, 0, 0.4745098, 1,
1.52665, -0.7448403, -0.3111373, 1, 0, 0.4666667, 1,
1.539502, 0.06723754, 2.295392, 1, 0, 0.4627451, 1,
1.542973, 0.04755697, 2.916711, 1, 0, 0.454902, 1,
1.546198, 1.13591, 3.020752, 1, 0, 0.4509804, 1,
1.54836, -1.226198, 2.278458, 1, 0, 0.4431373, 1,
1.551548, -0.4982268, -0.2955419, 1, 0, 0.4392157, 1,
1.553012, 0.9640687, 0.2997636, 1, 0, 0.4313726, 1,
1.555503, -0.7808225, 3.654722, 1, 0, 0.427451, 1,
1.557377, -0.2731304, 2.475143, 1, 0, 0.4196078, 1,
1.560096, -0.6606496, 2.251193, 1, 0, 0.4156863, 1,
1.569484, -0.3043103, 2.584661, 1, 0, 0.4078431, 1,
1.572951, -0.2717765, 0.05416356, 1, 0, 0.4039216, 1,
1.577862, 0.5908821, 2.373006, 1, 0, 0.3960784, 1,
1.578725, 1.262432, 1.760264, 1, 0, 0.3882353, 1,
1.599175, 0.8564956, 0.6581427, 1, 0, 0.3843137, 1,
1.610247, 0.2477208, 0.5691797, 1, 0, 0.3764706, 1,
1.618551, 0.435956, -0.1462304, 1, 0, 0.372549, 1,
1.632172, 0.5364292, 0.9629134, 1, 0, 0.3647059, 1,
1.642601, -0.605619, 3.001038, 1, 0, 0.3607843, 1,
1.645797, 1.70587, -0.7907434, 1, 0, 0.3529412, 1,
1.646796, 0.8805349, 2.248789, 1, 0, 0.3490196, 1,
1.647568, -2.799434, 3.494727, 1, 0, 0.3411765, 1,
1.652704, -1.45697, 3.55326, 1, 0, 0.3372549, 1,
1.657425, 0.3856265, 1.441549, 1, 0, 0.3294118, 1,
1.663094, -0.009601636, 2.651876, 1, 0, 0.3254902, 1,
1.67923, -0.4816828, 2.217891, 1, 0, 0.3176471, 1,
1.706718, -0.1353121, 0.4610711, 1, 0, 0.3137255, 1,
1.721606, 0.8508648, -0.3684013, 1, 0, 0.3058824, 1,
1.722682, -0.9556082, 2.612607, 1, 0, 0.2980392, 1,
1.747519, 2.199673, -0.2781011, 1, 0, 0.2941177, 1,
1.755163, -0.1246573, 2.921531, 1, 0, 0.2862745, 1,
1.768067, -0.8510752, 0.7652743, 1, 0, 0.282353, 1,
1.78074, -1.634895, 1.347472, 1, 0, 0.2745098, 1,
1.783735, 0.07485296, 1.580646, 1, 0, 0.2705882, 1,
1.791235, -0.8872198, 1.96899, 1, 0, 0.2627451, 1,
1.813081, 1.837246, 1.709081, 1, 0, 0.2588235, 1,
1.81455, 2.669716, 0.6293876, 1, 0, 0.2509804, 1,
1.822362, -0.9675143, 1.497033, 1, 0, 0.2470588, 1,
1.825195, -1.206068, 1.918519, 1, 0, 0.2392157, 1,
1.83488, -1.130251, 0.8279294, 1, 0, 0.2352941, 1,
1.836577, -1.085681, 2.383193, 1, 0, 0.227451, 1,
1.841854, -0.9732009, 3.356319, 1, 0, 0.2235294, 1,
1.878574, 0.9277987, 2.264565, 1, 0, 0.2156863, 1,
1.890555, 0.3087006, 0.8855975, 1, 0, 0.2117647, 1,
1.900004, -0.4143142, 2.27976, 1, 0, 0.2039216, 1,
1.918769, -0.1525744, 1.292231, 1, 0, 0.1960784, 1,
1.942958, 0.3070925, 1.870936, 1, 0, 0.1921569, 1,
1.945386, 0.3809927, 0.6348456, 1, 0, 0.1843137, 1,
1.948552, 0.5614479, 2.26886, 1, 0, 0.1803922, 1,
1.960238, -1.369214, 1.193062, 1, 0, 0.172549, 1,
1.980987, 0.1510035, 1.298774, 1, 0, 0.1686275, 1,
1.999095, -0.4975339, 1.721602, 1, 0, 0.1607843, 1,
2.028038, -0.349831, 2.282591, 1, 0, 0.1568628, 1,
2.052284, 0.7672396, 3.621578, 1, 0, 0.1490196, 1,
2.07877, -0.7655435, 2.355614, 1, 0, 0.145098, 1,
2.149118, -0.5369354, 2.720972, 1, 0, 0.1372549, 1,
2.155257, -2.338306, 1.305379, 1, 0, 0.1333333, 1,
2.168193, 0.05429621, 0.6493548, 1, 0, 0.1254902, 1,
2.189248, -0.5808907, 1.075517, 1, 0, 0.1215686, 1,
2.191245, -0.9073162, 0.3615321, 1, 0, 0.1137255, 1,
2.230825, -0.1274175, 0.4827636, 1, 0, 0.1098039, 1,
2.243625, 1.684137, 2.982575, 1, 0, 0.1019608, 1,
2.251421, -1.528905, 2.036674, 1, 0, 0.09411765, 1,
2.263887, 1.305738, -1.387472, 1, 0, 0.09019608, 1,
2.358032, 0.6585304, 1.39265, 1, 0, 0.08235294, 1,
2.448555, 0.4032096, 2.426797, 1, 0, 0.07843138, 1,
2.459616, -0.5710211, 2.402701, 1, 0, 0.07058824, 1,
2.475238, 0.583448, 1.032143, 1, 0, 0.06666667, 1,
2.508083, 1.518558, 0.1598987, 1, 0, 0.05882353, 1,
2.543754, -1.167727, 3.525054, 1, 0, 0.05490196, 1,
2.567017, 0.5106391, 1.317625, 1, 0, 0.04705882, 1,
2.595757, -1.32753, 1.840124, 1, 0, 0.04313726, 1,
2.601027, 0.0002922883, 1.065154, 1, 0, 0.03529412, 1,
2.849095, -0.8659661, 2.71886, 1, 0, 0.03137255, 1,
2.955595, 0.8375913, 0.5295777, 1, 0, 0.02352941, 1,
3.08617, -0.1540216, 0.7084712, 1, 0, 0.01960784, 1,
3.35047, 0.2387181, 1.412466, 1, 0, 0.01176471, 1,
4.083067, 1.218998, 1.215524, 1, 0, 0.007843138, 1
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
0.5316353, -4.221331, -7.442457, 0, -0.5, 0.5, 0.5,
0.5316353, -4.221331, -7.442457, 1, -0.5, 0.5, 0.5,
0.5316353, -4.221331, -7.442457, 1, 1.5, 0.5, 0.5,
0.5316353, -4.221331, -7.442457, 0, 1.5, 0.5, 0.5
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
-4.223732, 0.2512404, -7.442457, 0, -0.5, 0.5, 0.5,
-4.223732, 0.2512404, -7.442457, 1, -0.5, 0.5, 0.5,
-4.223732, 0.2512404, -7.442457, 1, 1.5, 0.5, 0.5,
-4.223732, 0.2512404, -7.442457, 0, 1.5, 0.5, 0.5
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
-4.223732, -4.221331, -0.04704714, 0, -0.5, 0.5, 0.5,
-4.223732, -4.221331, -0.04704714, 1, -0.5, 0.5, 0.5,
-4.223732, -4.221331, -0.04704714, 1, 1.5, 0.5, 0.5,
-4.223732, -4.221331, -0.04704714, 0, 1.5, 0.5, 0.5
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
-2, -3.189199, -5.735824,
4, -3.189199, -5.735824,
-2, -3.189199, -5.735824,
-2, -3.361221, -6.020263,
0, -3.189199, -5.735824,
0, -3.361221, -6.020263,
2, -3.189199, -5.735824,
2, -3.361221, -6.020263,
4, -3.189199, -5.735824,
4, -3.361221, -6.020263
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
"0",
"2",
"4"
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
-2, -3.705265, -6.58914, 0, -0.5, 0.5, 0.5,
-2, -3.705265, -6.58914, 1, -0.5, 0.5, 0.5,
-2, -3.705265, -6.58914, 1, 1.5, 0.5, 0.5,
-2, -3.705265, -6.58914, 0, 1.5, 0.5, 0.5,
0, -3.705265, -6.58914, 0, -0.5, 0.5, 0.5,
0, -3.705265, -6.58914, 1, -0.5, 0.5, 0.5,
0, -3.705265, -6.58914, 1, 1.5, 0.5, 0.5,
0, -3.705265, -6.58914, 0, 1.5, 0.5, 0.5,
2, -3.705265, -6.58914, 0, -0.5, 0.5, 0.5,
2, -3.705265, -6.58914, 1, -0.5, 0.5, 0.5,
2, -3.705265, -6.58914, 1, 1.5, 0.5, 0.5,
2, -3.705265, -6.58914, 0, 1.5, 0.5, 0.5,
4, -3.705265, -6.58914, 0, -0.5, 0.5, 0.5,
4, -3.705265, -6.58914, 1, -0.5, 0.5, 0.5,
4, -3.705265, -6.58914, 1, 1.5, 0.5, 0.5,
4, -3.705265, -6.58914, 0, 1.5, 0.5, 0.5
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
-3.126339, -3, -5.735824,
-3.126339, 3, -5.735824,
-3.126339, -3, -5.735824,
-3.309238, -3, -6.020263,
-3.126339, -2, -5.735824,
-3.309238, -2, -6.020263,
-3.126339, -1, -5.735824,
-3.309238, -1, -6.020263,
-3.126339, 0, -5.735824,
-3.309238, 0, -6.020263,
-3.126339, 1, -5.735824,
-3.309238, 1, -6.020263,
-3.126339, 2, -5.735824,
-3.309238, 2, -6.020263,
-3.126339, 3, -5.735824,
-3.309238, 3, -6.020263
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
-3.675035, -3, -6.58914, 0, -0.5, 0.5, 0.5,
-3.675035, -3, -6.58914, 1, -0.5, 0.5, 0.5,
-3.675035, -3, -6.58914, 1, 1.5, 0.5, 0.5,
-3.675035, -3, -6.58914, 0, 1.5, 0.5, 0.5,
-3.675035, -2, -6.58914, 0, -0.5, 0.5, 0.5,
-3.675035, -2, -6.58914, 1, -0.5, 0.5, 0.5,
-3.675035, -2, -6.58914, 1, 1.5, 0.5, 0.5,
-3.675035, -2, -6.58914, 0, 1.5, 0.5, 0.5,
-3.675035, -1, -6.58914, 0, -0.5, 0.5, 0.5,
-3.675035, -1, -6.58914, 1, -0.5, 0.5, 0.5,
-3.675035, -1, -6.58914, 1, 1.5, 0.5, 0.5,
-3.675035, -1, -6.58914, 0, 1.5, 0.5, 0.5,
-3.675035, 0, -6.58914, 0, -0.5, 0.5, 0.5,
-3.675035, 0, -6.58914, 1, -0.5, 0.5, 0.5,
-3.675035, 0, -6.58914, 1, 1.5, 0.5, 0.5,
-3.675035, 0, -6.58914, 0, 1.5, 0.5, 0.5,
-3.675035, 1, -6.58914, 0, -0.5, 0.5, 0.5,
-3.675035, 1, -6.58914, 1, -0.5, 0.5, 0.5,
-3.675035, 1, -6.58914, 1, 1.5, 0.5, 0.5,
-3.675035, 1, -6.58914, 0, 1.5, 0.5, 0.5,
-3.675035, 2, -6.58914, 0, -0.5, 0.5, 0.5,
-3.675035, 2, -6.58914, 1, -0.5, 0.5, 0.5,
-3.675035, 2, -6.58914, 1, 1.5, 0.5, 0.5,
-3.675035, 2, -6.58914, 0, 1.5, 0.5, 0.5,
-3.675035, 3, -6.58914, 0, -0.5, 0.5, 0.5,
-3.675035, 3, -6.58914, 1, -0.5, 0.5, 0.5,
-3.675035, 3, -6.58914, 1, 1.5, 0.5, 0.5,
-3.675035, 3, -6.58914, 0, 1.5, 0.5, 0.5
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
-3.126339, -3.189199, -4,
-3.126339, -3.189199, 4,
-3.126339, -3.189199, -4,
-3.309238, -3.361221, -4,
-3.126339, -3.189199, -2,
-3.309238, -3.361221, -2,
-3.126339, -3.189199, 0,
-3.309238, -3.361221, 0,
-3.126339, -3.189199, 2,
-3.309238, -3.361221, 2,
-3.126339, -3.189199, 4,
-3.309238, -3.361221, 4
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
-3.675035, -3.705265, -4, 0, -0.5, 0.5, 0.5,
-3.675035, -3.705265, -4, 1, -0.5, 0.5, 0.5,
-3.675035, -3.705265, -4, 1, 1.5, 0.5, 0.5,
-3.675035, -3.705265, -4, 0, 1.5, 0.5, 0.5,
-3.675035, -3.705265, -2, 0, -0.5, 0.5, 0.5,
-3.675035, -3.705265, -2, 1, -0.5, 0.5, 0.5,
-3.675035, -3.705265, -2, 1, 1.5, 0.5, 0.5,
-3.675035, -3.705265, -2, 0, 1.5, 0.5, 0.5,
-3.675035, -3.705265, 0, 0, -0.5, 0.5, 0.5,
-3.675035, -3.705265, 0, 1, -0.5, 0.5, 0.5,
-3.675035, -3.705265, 0, 1, 1.5, 0.5, 0.5,
-3.675035, -3.705265, 0, 0, 1.5, 0.5, 0.5,
-3.675035, -3.705265, 2, 0, -0.5, 0.5, 0.5,
-3.675035, -3.705265, 2, 1, -0.5, 0.5, 0.5,
-3.675035, -3.705265, 2, 1, 1.5, 0.5, 0.5,
-3.675035, -3.705265, 2, 0, 1.5, 0.5, 0.5,
-3.675035, -3.705265, 4, 0, -0.5, 0.5, 0.5,
-3.675035, -3.705265, 4, 1, -0.5, 0.5, 0.5,
-3.675035, -3.705265, 4, 1, 1.5, 0.5, 0.5,
-3.675035, -3.705265, 4, 0, 1.5, 0.5, 0.5
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
-3.126339, -3.189199, -5.735824,
-3.126339, 3.691679, -5.735824,
-3.126339, -3.189199, 5.641729,
-3.126339, 3.691679, 5.641729,
-3.126339, -3.189199, -5.735824,
-3.126339, -3.189199, 5.641729,
-3.126339, 3.691679, -5.735824,
-3.126339, 3.691679, 5.641729,
-3.126339, -3.189199, -5.735824,
4.18961, -3.189199, -5.735824,
-3.126339, -3.189199, 5.641729,
4.18961, -3.189199, 5.641729,
-3.126339, 3.691679, -5.735824,
4.18961, 3.691679, -5.735824,
-3.126339, 3.691679, 5.641729,
4.18961, 3.691679, 5.641729,
4.18961, -3.189199, -5.735824,
4.18961, 3.691679, -5.735824,
4.18961, -3.189199, 5.641729,
4.18961, 3.691679, 5.641729,
4.18961, -3.189199, -5.735824,
4.18961, -3.189199, 5.641729,
4.18961, 3.691679, -5.735824,
4.18961, 3.691679, 5.641729
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
var radius = 8.103819;
var distance = 36.0548;
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
mvMatrix.translate( -0.5316353, -0.2512404, 0.04704714 );
mvMatrix.scale( 1.197658, 1.273385, 0.7701135 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.0548);
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
DBH<-read.table("DBH.xyz")
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
-3.019796, 1.313002, -0.8710006, 0, 0, 1, 1, 1,
-2.700647, 0.4963116, -2.335921, 1, 0, 0, 1, 1,
-2.621811, 2.082022, -1.176187, 1, 0, 0, 1, 1,
-2.59956, 1.166986, 0.2558531, 1, 0, 0, 1, 1,
-2.469272, -0.9951406, -1.606214, 1, 0, 0, 1, 1,
-2.436192, 0.8542576, -1.003679, 1, 0, 0, 1, 1,
-2.401851, -0.3251856, -2.779324, 0, 0, 0, 1, 1,
-2.35588, 1.701672, -0.7815488, 0, 0, 0, 1, 1,
-2.31887, 1.010422, -1.382812, 0, 0, 0, 1, 1,
-2.296438, 2.58314, -1.181779, 0, 0, 0, 1, 1,
-2.265524, 0.3101214, -3.046193, 0, 0, 0, 1, 1,
-2.259049, 0.4014477, -1.174656, 0, 0, 0, 1, 1,
-2.247154, -0.2049191, -3.560869, 0, 0, 0, 1, 1,
-2.244541, -0.2713719, -1.615051, 1, 1, 1, 1, 1,
-2.193517, 0.8319887, -0.3026829, 1, 1, 1, 1, 1,
-2.193351, 2.240162, 0.1617873, 1, 1, 1, 1, 1,
-2.190978, 0.0253505, -2.387685, 1, 1, 1, 1, 1,
-2.177465, -0.428389, 0.2324048, 1, 1, 1, 1, 1,
-2.176039, -1.976637, -3.928433, 1, 1, 1, 1, 1,
-2.139288, -0.282504, -1.351961, 1, 1, 1, 1, 1,
-2.077583, -0.4380744, -1.468123, 1, 1, 1, 1, 1,
-2.030859, -0.002002799, -3.071646, 1, 1, 1, 1, 1,
-1.981198, 0.7603146, -0.8940712, 1, 1, 1, 1, 1,
-1.959214, 1.179148, -0.320386, 1, 1, 1, 1, 1,
-1.916282, 1.719395, -1.17272, 1, 1, 1, 1, 1,
-1.912511, -1.00907, 0.08229627, 1, 1, 1, 1, 1,
-1.907307, -0.07596112, -0.3877649, 1, 1, 1, 1, 1,
-1.885136, -0.2794617, -1.41493, 1, 1, 1, 1, 1,
-1.885098, -0.8037983, -2.211949, 0, 0, 1, 1, 1,
-1.878781, -0.5605795, -1.304958, 1, 0, 0, 1, 1,
-1.876427, -1.011348, -3.017383, 1, 0, 0, 1, 1,
-1.873715, 1.057857, -1.130719, 1, 0, 0, 1, 1,
-1.856715, 1.396994, -0.3881743, 1, 0, 0, 1, 1,
-1.827081, -1.403935, -1.971711, 1, 0, 0, 1, 1,
-1.826423, -1.451143, -1.311695, 0, 0, 0, 1, 1,
-1.825593, 1.635204, -1.295732, 0, 0, 0, 1, 1,
-1.819783, 0.9152349, -0.5214, 0, 0, 0, 1, 1,
-1.801494, -0.6041551, 0.2878304, 0, 0, 0, 1, 1,
-1.774881, -0.4240549, -2.25909, 0, 0, 0, 1, 1,
-1.772348, 0.3569854, -0.3360153, 0, 0, 0, 1, 1,
-1.762272, 0.475576, -2.60997, 0, 0, 0, 1, 1,
-1.7544, -0.3099043, -2.591541, 1, 1, 1, 1, 1,
-1.733532, 2.169216, -0.7243342, 1, 1, 1, 1, 1,
-1.732345, 0.5429706, -0.5629003, 1, 1, 1, 1, 1,
-1.717481, -0.3850147, -3.5147, 1, 1, 1, 1, 1,
-1.697086, -0.1397511, -1.671873, 1, 1, 1, 1, 1,
-1.690437, 1.579078, -0.407318, 1, 1, 1, 1, 1,
-1.650773, 1.853015, -1.058442, 1, 1, 1, 1, 1,
-1.63899, 0.05325959, -0.8887181, 1, 1, 1, 1, 1,
-1.625408, -0.9387817, -3.448147, 1, 1, 1, 1, 1,
-1.618795, -0.8737787, -2.332098, 1, 1, 1, 1, 1,
-1.613359, -1.182466, -3.788456, 1, 1, 1, 1, 1,
-1.611733, -0.2395013, 0.05646973, 1, 1, 1, 1, 1,
-1.579622, -0.6674377, -1.702101, 1, 1, 1, 1, 1,
-1.577441, 0.7456256, -0.3473783, 1, 1, 1, 1, 1,
-1.561726, -0.7234941, -0.8345271, 1, 1, 1, 1, 1,
-1.556802, -2.414243, -2.889889, 0, 0, 1, 1, 1,
-1.552344, -1.108785, -4.163245, 1, 0, 0, 1, 1,
-1.550969, -0.3037275, -2.547889, 1, 0, 0, 1, 1,
-1.543389, 0.09929895, -1.214638, 1, 0, 0, 1, 1,
-1.523973, 0.733809, -1.04684, 1, 0, 0, 1, 1,
-1.523746, 1.627551, 0.1631244, 1, 0, 0, 1, 1,
-1.519711, 1.316412, -1.561111, 0, 0, 0, 1, 1,
-1.519435, 1.213564, -1.035228, 0, 0, 0, 1, 1,
-1.517226, -1.035326, -2.431501, 0, 0, 0, 1, 1,
-1.503495, -0.190037, -0.7648891, 0, 0, 0, 1, 1,
-1.499744, 0.2561547, 0.6711091, 0, 0, 0, 1, 1,
-1.474676, 0.07463984, -2.567234, 0, 0, 0, 1, 1,
-1.468188, 0.9739663, 1.401308, 0, 0, 0, 1, 1,
-1.435027, 0.2555259, -3.440106, 1, 1, 1, 1, 1,
-1.433965, -0.0006683734, -1.013389, 1, 1, 1, 1, 1,
-1.433212, -0.7409345, -0.7476478, 1, 1, 1, 1, 1,
-1.415713, -1.830074, -2.655523, 1, 1, 1, 1, 1,
-1.415605, 0.4336301, -0.6291776, 1, 1, 1, 1, 1,
-1.408018, -0.3702472, -1.062855, 1, 1, 1, 1, 1,
-1.403496, 0.2750936, 0.3777763, 1, 1, 1, 1, 1,
-1.401251, -0.4830959, -3.134857, 1, 1, 1, 1, 1,
-1.399901, -0.99355, -2.177166, 1, 1, 1, 1, 1,
-1.398163, -1.59466, -3.106248, 1, 1, 1, 1, 1,
-1.393764, 0.7489346, -1.506561, 1, 1, 1, 1, 1,
-1.391561, -0.6445617, 1.098645, 1, 1, 1, 1, 1,
-1.391496, -0.3326164, -1.098616, 1, 1, 1, 1, 1,
-1.374892, -0.9963782, -3.079883, 1, 1, 1, 1, 1,
-1.358666, 0.9878897, -0.3721539, 1, 1, 1, 1, 1,
-1.353307, 1.432507, -1.01052, 0, 0, 1, 1, 1,
-1.351707, -1.209332, -2.227542, 1, 0, 0, 1, 1,
-1.346488, 1.128451, -0.6353762, 1, 0, 0, 1, 1,
-1.336397, -0.7236122, -0.8655939, 1, 0, 0, 1, 1,
-1.31501, 0.5305557, -0.191311, 1, 0, 0, 1, 1,
-1.313194, 0.9529022, 0.1048311, 1, 0, 0, 1, 1,
-1.309975, -1.075801, -2.331636, 0, 0, 0, 1, 1,
-1.30774, 1.046152, 0.4620408, 0, 0, 0, 1, 1,
-1.293531, -2.244566, -2.530981, 0, 0, 0, 1, 1,
-1.289304, -1.246592, -3.834123, 0, 0, 0, 1, 1,
-1.280662, 0.7348286, -0.8246054, 0, 0, 0, 1, 1,
-1.280183, 0.8917565, 0.2026964, 0, 0, 0, 1, 1,
-1.278177, 1.07547, -0.6877359, 0, 0, 0, 1, 1,
-1.273878, 2.467708, -1.241239, 1, 1, 1, 1, 1,
-1.270828, 0.09279692, -0.9825161, 1, 1, 1, 1, 1,
-1.260407, 1.459003, 1.696912, 1, 1, 1, 1, 1,
-1.255606, -2.034576, -2.265125, 1, 1, 1, 1, 1,
-1.252258, 1.22999, 0.3052483, 1, 1, 1, 1, 1,
-1.251545, 0.8471702, -1.716408, 1, 1, 1, 1, 1,
-1.249171, 1.136519, -1.434219, 1, 1, 1, 1, 1,
-1.244589, 0.6134835, -1.375494, 1, 1, 1, 1, 1,
-1.23923, 0.8217523, -1.021727, 1, 1, 1, 1, 1,
-1.238264, 0.2453961, -0.8800925, 1, 1, 1, 1, 1,
-1.22943, -0.429966, -2.34935, 1, 1, 1, 1, 1,
-1.225121, 0.1244752, -1.474035, 1, 1, 1, 1, 1,
-1.217844, -0.983925, -1.969048, 1, 1, 1, 1, 1,
-1.202903, -0.1991365, -1.774765, 1, 1, 1, 1, 1,
-1.200536, 0.7628121, -2.177853, 1, 1, 1, 1, 1,
-1.187297, 0.7409029, -2.475526, 0, 0, 1, 1, 1,
-1.185335, 1.443315, -0.7664639, 1, 0, 0, 1, 1,
-1.182731, 0.8408957, -2.683977, 1, 0, 0, 1, 1,
-1.18244, -0.09560706, -1.995624, 1, 0, 0, 1, 1,
-1.176454, 0.4487022, -0.05332937, 1, 0, 0, 1, 1,
-1.174422, -0.3671144, -2.885982, 1, 0, 0, 1, 1,
-1.172656, -1.3368, -1.471304, 0, 0, 0, 1, 1,
-1.146979, -0.2357732, -3.478448, 0, 0, 0, 1, 1,
-1.135565, -2.245508, -2.523033, 0, 0, 0, 1, 1,
-1.134933, -0.7694415, -2.464792, 0, 0, 0, 1, 1,
-1.132338, -1.685639, -4.42745, 0, 0, 0, 1, 1,
-1.128581, -0.4010799, -1.401941, 0, 0, 0, 1, 1,
-1.122285, -0.1308752, -2.254601, 0, 0, 0, 1, 1,
-1.115636, -1.080856, -2.285442, 1, 1, 1, 1, 1,
-1.115226, 0.2971064, -0.9134853, 1, 1, 1, 1, 1,
-1.114862, 0.5164875, -0.2818398, 1, 1, 1, 1, 1,
-1.110243, -0.4367091, -4.341796, 1, 1, 1, 1, 1,
-1.107768, -0.9657758, -2.401181, 1, 1, 1, 1, 1,
-1.10264, 1.028165, -0.7981385, 1, 1, 1, 1, 1,
-1.095705, 0.5076796, -1.100111, 1, 1, 1, 1, 1,
-1.089222, -0.3475787, -1.503484, 1, 1, 1, 1, 1,
-1.086199, 0.5999728, -0.5765529, 1, 1, 1, 1, 1,
-1.081716, 0.9358021, 0.4469202, 1, 1, 1, 1, 1,
-1.07865, -0.01044997, -2.379146, 1, 1, 1, 1, 1,
-1.073658, -1.35947, -2.922798, 1, 1, 1, 1, 1,
-1.062354, -1.669255, -2.641422, 1, 1, 1, 1, 1,
-1.058643, -0.3051138, -2.626656, 1, 1, 1, 1, 1,
-1.049711, 0.7441998, 0.59315, 1, 1, 1, 1, 1,
-1.049621, -0.4322996, -3.496635, 0, 0, 1, 1, 1,
-1.03887, -0.3080961, -0.7914233, 1, 0, 0, 1, 1,
-1.035114, 0.3577314, -1.52118, 1, 0, 0, 1, 1,
-1.026147, 1.18622, -0.6797099, 1, 0, 0, 1, 1,
-1.018564, -0.6220955, -3.078966, 1, 0, 0, 1, 1,
-1.017306, -0.5653155, -2.323068, 1, 0, 0, 1, 1,
-1.015168, -1.036332, -1.704235, 0, 0, 0, 1, 1,
-1.011125, -1.486408, -1.511912, 0, 0, 0, 1, 1,
-1.008101, 2.449236, -1.046571, 0, 0, 0, 1, 1,
-0.9947791, 0.5149369, -1.010023, 0, 0, 0, 1, 1,
-0.9947065, -0.8655497, -1.788556, 0, 0, 0, 1, 1,
-0.9918501, 0.07187326, -0.5904503, 0, 0, 0, 1, 1,
-0.9891707, 0.225541, -0.6284068, 0, 0, 0, 1, 1,
-0.9807488, -0.3190318, -2.916827, 1, 1, 1, 1, 1,
-0.9648816, 0.6764384, -1.059404, 1, 1, 1, 1, 1,
-0.9608715, -0.6241486, -3.371313, 1, 1, 1, 1, 1,
-0.9471316, -0.4964529, -1.239404, 1, 1, 1, 1, 1,
-0.9439526, 1.279466, -0.2677828, 1, 1, 1, 1, 1,
-0.9416527, -0.6835998, -1.604812, 1, 1, 1, 1, 1,
-0.935981, -0.9049734, -2.529128, 1, 1, 1, 1, 1,
-0.9323072, 0.1778704, -2.194791, 1, 1, 1, 1, 1,
-0.9294809, 0.3056604, -1.352533, 1, 1, 1, 1, 1,
-0.9289098, 0.6319264, -1.559168, 1, 1, 1, 1, 1,
-0.926851, 0.3207602, -1.534127, 1, 1, 1, 1, 1,
-0.9266026, 0.1895385, -1.794435, 1, 1, 1, 1, 1,
-0.9227034, 0.3073671, -0.4676225, 1, 1, 1, 1, 1,
-0.9192054, 0.7427825, -2.044791, 1, 1, 1, 1, 1,
-0.9171279, 0.356982, -2.340069, 1, 1, 1, 1, 1,
-0.9077947, -0.3263764, 0.3159396, 0, 0, 1, 1, 1,
-0.8996924, -0.1789927, -2.629056, 1, 0, 0, 1, 1,
-0.8984728, -1.460828, -1.132659, 1, 0, 0, 1, 1,
-0.8947955, 0.8245525, -0.4827137, 1, 0, 0, 1, 1,
-0.8918553, -0.597291, -1.406054, 1, 0, 0, 1, 1,
-0.8901523, -0.7223297, -2.960954, 1, 0, 0, 1, 1,
-0.8828605, -0.381237, -2.064278, 0, 0, 0, 1, 1,
-0.8813627, -0.2760903, -3.335799, 0, 0, 0, 1, 1,
-0.8767148, -0.02040258, -1.034626, 0, 0, 0, 1, 1,
-0.8732388, 0.4106962, -0.6643372, 0, 0, 0, 1, 1,
-0.8729668, -0.7174594, -2.317597, 0, 0, 0, 1, 1,
-0.8637706, -1.893905, -4.687229, 0, 0, 0, 1, 1,
-0.8599714, -0.7631851, -1.470201, 0, 0, 0, 1, 1,
-0.8573043, -0.7522041, -1.636176, 1, 1, 1, 1, 1,
-0.8544062, -1.239457, -4.322161, 1, 1, 1, 1, 1,
-0.8478364, 0.08317003, -0.4334921, 1, 1, 1, 1, 1,
-0.847649, 0.7279547, -2.785691, 1, 1, 1, 1, 1,
-0.8455827, -0.137157, 0.3392469, 1, 1, 1, 1, 1,
-0.8449091, -0.8348507, -1.440921, 1, 1, 1, 1, 1,
-0.8441171, -0.4346476, -2.502939, 1, 1, 1, 1, 1,
-0.8419349, -0.592158, -2.092204, 1, 1, 1, 1, 1,
-0.8411222, -1.464503, -1.49177, 1, 1, 1, 1, 1,
-0.8386735, -2.979292, -3.491267, 1, 1, 1, 1, 1,
-0.8318817, -1.375342, -1.960416, 1, 1, 1, 1, 1,
-0.8289868, -0.2410655, -3.255238, 1, 1, 1, 1, 1,
-0.821064, 0.09302076, -1.533654, 1, 1, 1, 1, 1,
-0.8171054, 0.9456259, -0.7965578, 1, 1, 1, 1, 1,
-0.8120883, 0.3631105, -2.178653, 1, 1, 1, 1, 1,
-0.8110114, -0.9725134, -3.381372, 0, 0, 1, 1, 1,
-0.8044834, -0.3113739, -1.437796, 1, 0, 0, 1, 1,
-0.8044012, -0.1190603, -1.80457, 1, 0, 0, 1, 1,
-0.7967808, -0.5967522, -2.981403, 1, 0, 0, 1, 1,
-0.7945951, -0.4681633, -3.093506, 1, 0, 0, 1, 1,
-0.7900859, -1.399189, -0.6588361, 1, 0, 0, 1, 1,
-0.7851614, 0.04001957, -1.146042, 0, 0, 0, 1, 1,
-0.7831237, -0.4963988, -5.179433, 0, 0, 0, 1, 1,
-0.7809942, -1.126967, -2.990013, 0, 0, 0, 1, 1,
-0.7794251, -0.06929895, -1.23047, 0, 0, 0, 1, 1,
-0.7772673, -0.796155, -2.598066, 0, 0, 0, 1, 1,
-0.7761109, 0.1942199, -0.035556, 0, 0, 0, 1, 1,
-0.7748725, -0.2019155, -3.120951, 0, 0, 0, 1, 1,
-0.7747343, 0.6001799, -0.9430538, 1, 1, 1, 1, 1,
-0.7739626, 0.0196323, -1.837015, 1, 1, 1, 1, 1,
-0.7675958, 0.672629, -0.5226505, 1, 1, 1, 1, 1,
-0.7671969, -1.019815, -3.181241, 1, 1, 1, 1, 1,
-0.7591762, 0.6684919, -1.319896, 1, 1, 1, 1, 1,
-0.7581843, 1.025085, 0.03038476, 1, 1, 1, 1, 1,
-0.75225, 0.1026594, -1.519158, 1, 1, 1, 1, 1,
-0.7505491, 1.320078, 0.2226226, 1, 1, 1, 1, 1,
-0.745223, -0.108678, -3.495801, 1, 1, 1, 1, 1,
-0.7447168, -0.7483293, -2.589221, 1, 1, 1, 1, 1,
-0.7417431, 0.1321312, -0.3826036, 1, 1, 1, 1, 1,
-0.7378877, 0.9837776, 0.1458851, 1, 1, 1, 1, 1,
-0.7349916, 0.3890961, 0.08856156, 1, 1, 1, 1, 1,
-0.7332521, 0.2329168, -1.99639, 1, 1, 1, 1, 1,
-0.7328215, 0.1026638, -2.908709, 1, 1, 1, 1, 1,
-0.7287351, -0.4987473, -1.509568, 0, 0, 1, 1, 1,
-0.7280189, 1.161454, -1.183925, 1, 0, 0, 1, 1,
-0.7274163, 1.418566, 1.644038, 1, 0, 0, 1, 1,
-0.7242814, -0.4132429, -2.374926, 1, 0, 0, 1, 1,
-0.7223744, -0.9023812, -3.189133, 1, 0, 0, 1, 1,
-0.7083834, 1.120723, -0.491843, 1, 0, 0, 1, 1,
-0.7071163, 0.6245561, -0.685401, 0, 0, 0, 1, 1,
-0.7037727, -0.1564642, -0.7978701, 0, 0, 0, 1, 1,
-0.7034681, 0.3552786, -1.388837, 0, 0, 0, 1, 1,
-0.7025236, 0.4970846, 0.08860415, 0, 0, 0, 1, 1,
-0.70194, 1.680198, 0.396198, 0, 0, 0, 1, 1,
-0.7004007, -0.05105146, -1.57248, 0, 0, 0, 1, 1,
-0.6948476, 0.766642, -0.8097656, 0, 0, 0, 1, 1,
-0.6863449, -0.6568266, -2.506432, 1, 1, 1, 1, 1,
-0.685774, 2.797409, -0.02603282, 1, 1, 1, 1, 1,
-0.6855683, 0.3548896, -0.3605348, 1, 1, 1, 1, 1,
-0.6835832, 0.7493974, 0.01097505, 1, 1, 1, 1, 1,
-0.6709027, -0.5760384, -2.446597, 1, 1, 1, 1, 1,
-0.6703919, -1.112939, -2.5511, 1, 1, 1, 1, 1,
-0.6702839, 0.7150601, -1.324644, 1, 1, 1, 1, 1,
-0.6694971, 1.347092, -1.399932, 1, 1, 1, 1, 1,
-0.6673595, 0.3907839, -1.845857, 1, 1, 1, 1, 1,
-0.6648429, -0.588461, -1.553549, 1, 1, 1, 1, 1,
-0.6624759, -0.110555, -1.119061, 1, 1, 1, 1, 1,
-0.662275, 0.09918308, -0.4125758, 1, 1, 1, 1, 1,
-0.6617596, 0.6074439, -2.241036, 1, 1, 1, 1, 1,
-0.6613434, -0.8177908, -1.645117, 1, 1, 1, 1, 1,
-0.661331, -0.005570469, -2.744474, 1, 1, 1, 1, 1,
-0.6611161, 0.001809534, -1.654391, 0, 0, 1, 1, 1,
-0.6586859, 0.1937392, -1.469716, 1, 0, 0, 1, 1,
-0.6532182, -0.1719434, -1.126216, 1, 0, 0, 1, 1,
-0.6531363, -0.5517927, -0.1718004, 1, 0, 0, 1, 1,
-0.6515495, -1.44194, -3.987601, 1, 0, 0, 1, 1,
-0.6494305, 0.9833333, 0.04645538, 1, 0, 0, 1, 1,
-0.6474606, 0.02122995, -2.239198, 0, 0, 0, 1, 1,
-0.6457732, -0.1214915, -1.063808, 0, 0, 0, 1, 1,
-0.6457078, -1.560564, -2.312879, 0, 0, 0, 1, 1,
-0.6415654, -0.2266572, -2.067028, 0, 0, 0, 1, 1,
-0.6348161, -0.6270564, -1.260429, 0, 0, 0, 1, 1,
-0.6339114, -0.7771316, -2.590769, 0, 0, 0, 1, 1,
-0.6286873, -0.1891257, -3.549073, 0, 0, 0, 1, 1,
-0.6274978, 0.6607496, -1.693254, 1, 1, 1, 1, 1,
-0.6273947, -0.6097419, -2.696128, 1, 1, 1, 1, 1,
-0.62569, -1.076073, -4.816285, 1, 1, 1, 1, 1,
-0.6210727, -0.7176644, -1.129024, 1, 1, 1, 1, 1,
-0.6209671, -0.7906645, -2.179996, 1, 1, 1, 1, 1,
-0.6165861, -0.4399949, -2.033567, 1, 1, 1, 1, 1,
-0.6125285, -1.38059, -0.7969751, 1, 1, 1, 1, 1,
-0.6102325, -1.059293, -4.349183, 1, 1, 1, 1, 1,
-0.5968872, -1.077565, -4.504034, 1, 1, 1, 1, 1,
-0.595751, -0.1671092, -1.997427, 1, 1, 1, 1, 1,
-0.5928894, -1.744788, -2.285137, 1, 1, 1, 1, 1,
-0.5833987, -0.5330442, -1.056321, 1, 1, 1, 1, 1,
-0.5795042, -0.8391131, -2.492687, 1, 1, 1, 1, 1,
-0.5748399, 0.7480519, -1.493439, 1, 1, 1, 1, 1,
-0.5716411, 0.1228076, 0.2049964, 1, 1, 1, 1, 1,
-0.5711312, 1.726017, -1.377024, 0, 0, 1, 1, 1,
-0.5672899, -0.6583687, -3.813663, 1, 0, 0, 1, 1,
-0.5662803, -0.7052099, -3.006943, 1, 0, 0, 1, 1,
-0.5655822, -0.04718983, -2.351894, 1, 0, 0, 1, 1,
-0.5641125, -1.072961, -2.550703, 1, 0, 0, 1, 1,
-0.5640689, 0.08335064, 0.9185287, 1, 0, 0, 1, 1,
-0.5624055, -0.6760095, -2.939961, 0, 0, 0, 1, 1,
-0.5569712, 1.380278, -0.2283559, 0, 0, 0, 1, 1,
-0.5552809, 1.145509, 0.8071502, 0, 0, 0, 1, 1,
-0.5526858, -0.1288119, -0.4451672, 0, 0, 0, 1, 1,
-0.5506793, 0.09605584, -0.6014193, 0, 0, 0, 1, 1,
-0.5474301, 0.0623493, -1.068407, 0, 0, 0, 1, 1,
-0.5473093, 0.5047864, -0.6823052, 0, 0, 0, 1, 1,
-0.5443796, -1.232253, -2.593021, 1, 1, 1, 1, 1,
-0.5440304, -1.046821, -3.56909, 1, 1, 1, 1, 1,
-0.5376309, 0.2208231, -2.322876, 1, 1, 1, 1, 1,
-0.5358742, -0.2642719, -1.905732, 1, 1, 1, 1, 1,
-0.5292949, -0.3899191, -2.102491, 1, 1, 1, 1, 1,
-0.5288112, 0.8332496, -0.9776161, 1, 1, 1, 1, 1,
-0.5236254, 1.695197, -0.7637044, 1, 1, 1, 1, 1,
-0.5208465, 1.128291, 0.06526901, 1, 1, 1, 1, 1,
-0.5197596, 0.666066, -0.6019571, 1, 1, 1, 1, 1,
-0.5147607, 0.1926465, -1.143752, 1, 1, 1, 1, 1,
-0.506807, -0.0922426, -0.5376152, 1, 1, 1, 1, 1,
-0.506799, 0.8140137, 0.5698116, 1, 1, 1, 1, 1,
-0.4853832, -0.05462824, -0.9167979, 1, 1, 1, 1, 1,
-0.4818231, 0.08604541, -2.640882, 1, 1, 1, 1, 1,
-0.4748198, 0.3464249, 0.8387868, 1, 1, 1, 1, 1,
-0.4681278, 0.01558445, -2.748513, 0, 0, 1, 1, 1,
-0.4640143, 1.719916, 0.8718755, 1, 0, 0, 1, 1,
-0.4638543, -1.047611, -4.133005, 1, 0, 0, 1, 1,
-0.4633481, 0.5574136, -1.646013, 1, 0, 0, 1, 1,
-0.4592292, -1.015181, -3.731496, 1, 0, 0, 1, 1,
-0.4500318, 1.219639, 0.0757665, 1, 0, 0, 1, 1,
-0.4496823, -0.2857749, -3.512391, 0, 0, 0, 1, 1,
-0.4454726, -1.866119, -5.570131, 0, 0, 0, 1, 1,
-0.439668, 0.3979738, -0.5697513, 0, 0, 0, 1, 1,
-0.4356709, -0.0002120679, -2.329863, 0, 0, 0, 1, 1,
-0.4340362, 0.2309316, -1.04432, 0, 0, 0, 1, 1,
-0.430142, 0.1088802, -0.9176962, 0, 0, 0, 1, 1,
-0.4296869, -0.2929256, -2.830201, 0, 0, 0, 1, 1,
-0.4296727, -1.381315, -3.76712, 1, 1, 1, 1, 1,
-0.4275768, -0.7377964, -2.484981, 1, 1, 1, 1, 1,
-0.4242466, -0.5331647, -3.890419, 1, 1, 1, 1, 1,
-0.4203381, -0.04382897, -1.205205, 1, 1, 1, 1, 1,
-0.4157651, 1.625448, 0.2646234, 1, 1, 1, 1, 1,
-0.4121527, -0.072894, 0.9222246, 1, 1, 1, 1, 1,
-0.4119303, 0.06607117, -2.036994, 1, 1, 1, 1, 1,
-0.4089776, -1.042039, -2.909953, 1, 1, 1, 1, 1,
-0.4073431, -1.874611, -2.362158, 1, 1, 1, 1, 1,
-0.4063315, 1.408885, -1.089549, 1, 1, 1, 1, 1,
-0.4048921, 1.230777, 0.9369178, 1, 1, 1, 1, 1,
-0.4024555, 0.0582868, -1.427077, 1, 1, 1, 1, 1,
-0.4023936, 0.7828204, -0.9401956, 1, 1, 1, 1, 1,
-0.4014919, -2.807182, -1.969285, 1, 1, 1, 1, 1,
-0.40006, 1.032874, -1.187524, 1, 1, 1, 1, 1,
-0.4000074, -0.5283542, -3.797377, 0, 0, 1, 1, 1,
-0.3998361, 0.3658515, -2.988104, 1, 0, 0, 1, 1,
-0.3994892, 0.5917286, -0.926172, 1, 0, 0, 1, 1,
-0.3977801, 1.112779, -1.08356, 1, 0, 0, 1, 1,
-0.3844197, 1.540619, -1.559608, 1, 0, 0, 1, 1,
-0.382456, 0.1486423, -3.003147, 1, 0, 0, 1, 1,
-0.3813699, 0.3462615, -0.8904426, 0, 0, 0, 1, 1,
-0.3802549, -0.5589547, -2.472701, 0, 0, 0, 1, 1,
-0.3790876, -1.090919, -2.987043, 0, 0, 0, 1, 1,
-0.3786882, 1.35609, -0.5292515, 0, 0, 0, 1, 1,
-0.3746429, 1.991822, 0.5278054, 0, 0, 0, 1, 1,
-0.3745517, 0.1071768, 1.016605, 0, 0, 0, 1, 1,
-0.3731596, 1.273613, -1.603316, 0, 0, 0, 1, 1,
-0.3703334, -0.6272323, -0.8833688, 1, 1, 1, 1, 1,
-0.3616328, 1.365922, 1.771678, 1, 1, 1, 1, 1,
-0.3587688, 1.908899, -0.3624672, 1, 1, 1, 1, 1,
-0.358588, 0.2617599, 0.341525, 1, 1, 1, 1, 1,
-0.3579662, 0.1598848, -1.197484, 1, 1, 1, 1, 1,
-0.3560843, 0.5642096, -0.7820135, 1, 1, 1, 1, 1,
-0.345452, 0.2853758, -0.7353789, 1, 1, 1, 1, 1,
-0.3451129, -0.8430263, -3.692263, 1, 1, 1, 1, 1,
-0.343591, -1.333869, -3.254551, 1, 1, 1, 1, 1,
-0.3420997, -0.2367843, -1.061131, 1, 1, 1, 1, 1,
-0.3353315, -0.3168719, -1.9804, 1, 1, 1, 1, 1,
-0.3346958, -0.1549101, -1.579598, 1, 1, 1, 1, 1,
-0.3335142, -0.02740207, -2.450714, 1, 1, 1, 1, 1,
-0.3229991, 0.5337324, -0.0490933, 1, 1, 1, 1, 1,
-0.319956, -0.1494579, -1.790901, 1, 1, 1, 1, 1,
-0.3139885, -0.5594252, -3.362829, 0, 0, 1, 1, 1,
-0.3133054, -0.7627937, -2.507867, 1, 0, 0, 1, 1,
-0.3118592, 0.8971218, 0.2423747, 1, 0, 0, 1, 1,
-0.3115395, 2.494444, 1.133229, 1, 0, 0, 1, 1,
-0.3085832, 0.3679814, 0.4438352, 1, 0, 0, 1, 1,
-0.3079478, -1.014427, -2.323899, 1, 0, 0, 1, 1,
-0.3075751, -0.6174856, -1.52964, 0, 0, 0, 1, 1,
-0.3058367, -0.699413, -1.531283, 0, 0, 0, 1, 1,
-0.305801, 1.581014, -0.4374924, 0, 0, 0, 1, 1,
-0.3055483, -0.131021, -0.7249695, 0, 0, 0, 1, 1,
-0.3036851, -0.6115299, -2.188312, 0, 0, 0, 1, 1,
-0.3020441, 0.8322397, -0.03132082, 0, 0, 0, 1, 1,
-0.3015992, 0.725632, -1.776571, 0, 0, 0, 1, 1,
-0.3003722, -2.325121, -3.909848, 1, 1, 1, 1, 1,
-0.2969329, 0.5952913, -1.837252, 1, 1, 1, 1, 1,
-0.2961938, 0.1295233, 1.977918, 1, 1, 1, 1, 1,
-0.2954278, -1.0687, -4.879557, 1, 1, 1, 1, 1,
-0.2951973, 0.566175, -0.9219378, 1, 1, 1, 1, 1,
-0.2951945, -0.03013742, -1.98296, 1, 1, 1, 1, 1,
-0.2949057, 1.065533, -0.9369017, 1, 1, 1, 1, 1,
-0.2948937, -0.1634525, -2.335741, 1, 1, 1, 1, 1,
-0.2942325, 0.9049066, 0.6347634, 1, 1, 1, 1, 1,
-0.2891375, -0.8822118, -3.674705, 1, 1, 1, 1, 1,
-0.2872734, -0.5696387, -2.771617, 1, 1, 1, 1, 1,
-0.2849463, -0.2548449, -1.682255, 1, 1, 1, 1, 1,
-0.2845541, 0.2332745, 0.6908684, 1, 1, 1, 1, 1,
-0.2843977, -0.138828, -1.133659, 1, 1, 1, 1, 1,
-0.2803057, 0.8778226, -0.9315218, 1, 1, 1, 1, 1,
-0.2799909, 0.06914593, -1.099761, 0, 0, 1, 1, 1,
-0.2743188, 1.065881, 0.6964677, 1, 0, 0, 1, 1,
-0.2721815, -1.787728, -2.601165, 1, 0, 0, 1, 1,
-0.2695644, -0.5469289, -2.637507, 1, 0, 0, 1, 1,
-0.2612498, 0.6294656, -0.3279157, 1, 0, 0, 1, 1,
-0.2607907, -0.0351323, -0.6968107, 1, 0, 0, 1, 1,
-0.2588095, -1.95766, -2.956893, 0, 0, 0, 1, 1,
-0.2557766, -1.282227, -3.597449, 0, 0, 0, 1, 1,
-0.250542, -0.6281429, -3.240159, 0, 0, 0, 1, 1,
-0.2482861, 0.1139762, -2.325731, 0, 0, 0, 1, 1,
-0.2479587, -0.2505423, -2.38321, 0, 0, 0, 1, 1,
-0.2465833, -0.4616171, -1.15257, 0, 0, 0, 1, 1,
-0.2447536, -1.089717, -2.510527, 0, 0, 0, 1, 1,
-0.2331195, -0.3874255, -3.493984, 1, 1, 1, 1, 1,
-0.2312655, -1.135128, -2.664589, 1, 1, 1, 1, 1,
-0.2242441, 0.7367254, -0.8157723, 1, 1, 1, 1, 1,
-0.2151669, 0.7727398, -0.04905531, 1, 1, 1, 1, 1,
-0.2137361, 0.3638776, -1.869087, 1, 1, 1, 1, 1,
-0.2092062, -0.4002964, -2.790866, 1, 1, 1, 1, 1,
-0.2051207, -1.103844, -3.784772, 1, 1, 1, 1, 1,
-0.2031534, 0.05772863, -0.4706834, 1, 1, 1, 1, 1,
-0.1939032, 0.4323965, 1.436316, 1, 1, 1, 1, 1,
-0.1918778, -0.3067607, -2.43699, 1, 1, 1, 1, 1,
-0.1904273, -0.1583325, -2.02739, 1, 1, 1, 1, 1,
-0.1888856, 1.269347, 1.621109, 1, 1, 1, 1, 1,
-0.1887968, 0.3977757, -1.483845, 1, 1, 1, 1, 1,
-0.1879486, 0.8605711, 1.226339, 1, 1, 1, 1, 1,
-0.1862445, -1.27953, -2.801576, 1, 1, 1, 1, 1,
-0.1827541, 0.1206807, 0.2109934, 0, 0, 1, 1, 1,
-0.1808455, -0.8719758, -2.256726, 1, 0, 0, 1, 1,
-0.1786897, 0.1821678, -2.057753, 1, 0, 0, 1, 1,
-0.1762766, -0.06132228, -3.025685, 1, 0, 0, 1, 1,
-0.176018, 0.8442748, -0.3315665, 1, 0, 0, 1, 1,
-0.1686761, 0.7370788, -0.9326609, 1, 0, 0, 1, 1,
-0.168138, 0.4687634, -0.9810494, 0, 0, 0, 1, 1,
-0.163744, -1.267754, -2.353891, 0, 0, 0, 1, 1,
-0.1604065, 0.07731809, -1.453811, 0, 0, 0, 1, 1,
-0.1584539, -0.294514, -3.003143, 0, 0, 0, 1, 1,
-0.1533997, 0.2632618, -0.3337499, 0, 0, 0, 1, 1,
-0.1526494, 0.5178524, -0.4479271, 0, 0, 0, 1, 1,
-0.1506694, -1.765407, -5.05268, 0, 0, 0, 1, 1,
-0.1482115, -0.2801407, -1.17292, 1, 1, 1, 1, 1,
-0.1439954, 0.5158574, 1.033095, 1, 1, 1, 1, 1,
-0.1438746, 0.3307784, -1.129494, 1, 1, 1, 1, 1,
-0.141976, -0.7427565, -3.154699, 1, 1, 1, 1, 1,
-0.1415406, -1.440698, -2.462669, 1, 1, 1, 1, 1,
-0.1401888, -2.416167, -3.705437, 1, 1, 1, 1, 1,
-0.1388774, 1.23843, -0.5431727, 1, 1, 1, 1, 1,
-0.1370699, -0.03252013, -2.822668, 1, 1, 1, 1, 1,
-0.1347359, -0.4975689, -3.543475, 1, 1, 1, 1, 1,
-0.1336641, -0.5513278, -3.610373, 1, 1, 1, 1, 1,
-0.1324732, -0.07009687, -2.672214, 1, 1, 1, 1, 1,
-0.1249189, 0.5426498, -1.058614, 1, 1, 1, 1, 1,
-0.1240914, 1.433418, -0.7193158, 1, 1, 1, 1, 1,
-0.1164646, 0.7811388, 0.3344847, 1, 1, 1, 1, 1,
-0.1148346, -0.1696912, -1.842711, 1, 1, 1, 1, 1,
-0.1141529, 1.708043, -0.1865184, 0, 0, 1, 1, 1,
-0.1079405, 0.1809993, 1.682769, 1, 0, 0, 1, 1,
-0.1076665, 0.4186189, -0.9828581, 1, 0, 0, 1, 1,
-0.1041735, -0.4600424, -1.942702, 1, 0, 0, 1, 1,
-0.1022309, 1.123626, -0.4506791, 1, 0, 0, 1, 1,
-0.1018373, -1.145544, -4.235992, 1, 0, 0, 1, 1,
-0.1011294, 1.426333, -0.5754375, 0, 0, 0, 1, 1,
-0.1001986, 2.058284, -0.7507818, 0, 0, 0, 1, 1,
-0.09940559, 0.4002913, 1.001412, 0, 0, 0, 1, 1,
-0.09847169, 1.201058, 0.1436835, 0, 0, 0, 1, 1,
-0.09625051, -1.285528, -5.188945, 0, 0, 0, 1, 1,
-0.08982336, 0.9306053, -1.483166, 0, 0, 0, 1, 1,
-0.08812102, -1.268458, -4.726113, 0, 0, 0, 1, 1,
-0.07045477, 0.3691775, -0.2934146, 1, 1, 1, 1, 1,
-0.06801569, -1.863627, -3.112334, 1, 1, 1, 1, 1,
-0.06758995, 0.8423763, 0.1651667, 1, 1, 1, 1, 1,
-0.06635544, -0.0321462, 0.235259, 1, 1, 1, 1, 1,
-0.06590905, 1.710258, -0.6508082, 1, 1, 1, 1, 1,
-0.06494504, 0.8370145, 0.4096127, 1, 1, 1, 1, 1,
-0.06183795, -0.6807512, -3.181432, 1, 1, 1, 1, 1,
-0.06014983, -1.71349, -2.4352, 1, 1, 1, 1, 1,
-0.05919814, 0.2264093, -0.9009809, 1, 1, 1, 1, 1,
-0.05442475, -1.676761, -2.800203, 1, 1, 1, 1, 1,
-0.05370512, -1.52111, -1.910021, 1, 1, 1, 1, 1,
-0.05206743, -0.1787623, -2.966013, 1, 1, 1, 1, 1,
-0.05167832, 0.92066, -0.7106807, 1, 1, 1, 1, 1,
-0.04712968, 0.5763808, 0.2549274, 1, 1, 1, 1, 1,
-0.04413657, 0.05638367, -1.043528, 1, 1, 1, 1, 1,
-0.04380582, 0.09885324, -0.9210684, 0, 0, 1, 1, 1,
-0.04329376, -0.08651561, -2.095638, 1, 0, 0, 1, 1,
-0.0427514, 1.762306, 0.7636208, 1, 0, 0, 1, 1,
-0.03976414, 0.4721507, 0.4776989, 1, 0, 0, 1, 1,
-0.03503867, 0.04122724, -2.69629, 1, 0, 0, 1, 1,
-0.03108479, -0.8397124, -3.909317, 1, 0, 0, 1, 1,
-0.02806186, -0.408954, -4.154664, 0, 0, 0, 1, 1,
-0.02725489, 0.847955, -1.213178, 0, 0, 0, 1, 1,
-0.02389731, -1.355973, -2.64814, 0, 0, 0, 1, 1,
-0.02295587, -0.2386662, -3.696896, 0, 0, 0, 1, 1,
-0.0228981, 0.3045064, 0.02279998, 0, 0, 0, 1, 1,
-0.02153785, -0.6566533, -3.988183, 0, 0, 0, 1, 1,
-0.007714378, -0.99695, -4.393703, 0, 0, 0, 1, 1,
-0.001720601, 0.7192947, -0.1212018, 1, 1, 1, 1, 1,
0.004059914, -0.1842527, 4.85109, 1, 1, 1, 1, 1,
0.00585077, 0.2933505, -0.808755, 1, 1, 1, 1, 1,
0.007031976, 1.223486, -0.0008181705, 1, 1, 1, 1, 1,
0.009952048, 1.55588, 0.4938308, 1, 1, 1, 1, 1,
0.01715308, 0.5891892, 0.7182702, 1, 1, 1, 1, 1,
0.02278921, -0.9203856, 2.199455, 1, 1, 1, 1, 1,
0.02669402, -0.2896824, 2.616685, 1, 1, 1, 1, 1,
0.03031895, -1.666791, 3.083184, 1, 1, 1, 1, 1,
0.03611518, -0.3393192, 1.988063, 1, 1, 1, 1, 1,
0.04043163, -1.05907, 2.128011, 1, 1, 1, 1, 1,
0.04388674, -0.3720622, 1.715361, 1, 1, 1, 1, 1,
0.04681747, -1.620636, 0.8373951, 1, 1, 1, 1, 1,
0.05421458, -1.316038, 1.802983, 1, 1, 1, 1, 1,
0.05745718, -1.042753, 2.757366, 1, 1, 1, 1, 1,
0.06029084, -0.7675539, 2.577371, 0, 0, 1, 1, 1,
0.06642117, 0.931906, -1.424722, 1, 0, 0, 1, 1,
0.06659247, -1.909437, 1.653889, 1, 0, 0, 1, 1,
0.06859428, 0.5860748, 0.04838688, 1, 0, 0, 1, 1,
0.07172517, 0.5180508, 0.2320039, 1, 0, 0, 1, 1,
0.07263386, -0.1617399, 2.344852, 1, 0, 0, 1, 1,
0.07340726, -0.5157996, 4.305308, 0, 0, 0, 1, 1,
0.07833809, 0.7582342, 0.7451161, 0, 0, 0, 1, 1,
0.08018276, 1.099221, -0.09448553, 0, 0, 0, 1, 1,
0.08125979, -0.3031804, 2.935396, 0, 0, 0, 1, 1,
0.0817373, -3.050405, 3.142501, 0, 0, 0, 1, 1,
0.08256878, -1.439438, 3.495274, 0, 0, 0, 1, 1,
0.08378961, -0.7415273, 1.866791, 0, 0, 0, 1, 1,
0.08513258, 0.4933321, 0.3510626, 1, 1, 1, 1, 1,
0.08693107, -2.192704, 2.917905, 1, 1, 1, 1, 1,
0.08694986, -0.3778844, 2.947623, 1, 1, 1, 1, 1,
0.09017162, 0.3894121, 0.3577426, 1, 1, 1, 1, 1,
0.09199753, 0.8375248, -0.3608049, 1, 1, 1, 1, 1,
0.09310944, -0.2114701, 1.794209, 1, 1, 1, 1, 1,
0.09459136, 0.3890851, 1.335438, 1, 1, 1, 1, 1,
0.09537204, -0.940295, 5.264499, 1, 1, 1, 1, 1,
0.1000953, -1.088018, 2.857327, 1, 1, 1, 1, 1,
0.1010276, -0.2256664, 2.699027, 1, 1, 1, 1, 1,
0.1010705, -0.4693539, 4.294991, 1, 1, 1, 1, 1,
0.1037842, -0.7097948, 3.118936, 1, 1, 1, 1, 1,
0.1041619, -2.006298, 3.971455, 1, 1, 1, 1, 1,
0.1043504, 0.224351, 0.4445742, 1, 1, 1, 1, 1,
0.1057232, 0.6029145, -0.6882827, 1, 1, 1, 1, 1,
0.1090109, -0.5148737, 1.370176, 0, 0, 1, 1, 1,
0.1095855, 0.6515095, -0.8777974, 1, 0, 0, 1, 1,
0.1126268, 0.054435, 1.068032, 1, 0, 0, 1, 1,
0.1137952, 0.4667186, 0.07123721, 1, 0, 0, 1, 1,
0.11441, -0.5170693, 3.804722, 1, 0, 0, 1, 1,
0.1145928, 0.3291827, 0.9793041, 1, 0, 0, 1, 1,
0.1149354, -0.5657702, 2.119996, 0, 0, 0, 1, 1,
0.1168441, -1.443887, 3.146106, 0, 0, 0, 1, 1,
0.117898, 0.2095928, 0.4971851, 0, 0, 0, 1, 1,
0.1181615, 0.03459236, 2.54353, 0, 0, 0, 1, 1,
0.1218825, -0.5120046, 2.233915, 0, 0, 0, 1, 1,
0.1230803, 0.03878419, 3.338783, 0, 0, 0, 1, 1,
0.1233621, 1.472315, 1.269839, 0, 0, 0, 1, 1,
0.1251452, -0.09805554, 3.359102, 1, 1, 1, 1, 1,
0.1288557, 1.223094, -0.3387915, 1, 1, 1, 1, 1,
0.1308929, 0.06308699, 1.8908, 1, 1, 1, 1, 1,
0.131992, 3.015054, -0.4583605, 1, 1, 1, 1, 1,
0.1373668, 0.5975958, 0.575606, 1, 1, 1, 1, 1,
0.1447229, 1.13889, -0.6630433, 1, 1, 1, 1, 1,
0.148193, 1.825987, 0.2636358, 1, 1, 1, 1, 1,
0.1509612, 1.338898, 1.390824, 1, 1, 1, 1, 1,
0.1523811, 0.001762735, 0.803695, 1, 1, 1, 1, 1,
0.1546491, 0.09290817, 2.028658, 1, 1, 1, 1, 1,
0.1572541, 0.8340943, -0.1707898, 1, 1, 1, 1, 1,
0.1595547, -0.08774002, 1.647926, 1, 1, 1, 1, 1,
0.1607264, -0.500375, 3.136419, 1, 1, 1, 1, 1,
0.1616494, -0.06147691, 1.461661, 1, 1, 1, 1, 1,
0.1670796, -0.04810757, 3.796153, 1, 1, 1, 1, 1,
0.1707538, -0.1847268, 3.582445, 0, 0, 1, 1, 1,
0.1712741, -1.129845, 2.526814, 1, 0, 0, 1, 1,
0.1716362, 1.18761, -0.2461624, 1, 0, 0, 1, 1,
0.1722335, -0.9133083, 2.084625, 1, 0, 0, 1, 1,
0.1778514, 1.384101, -1.66437, 1, 0, 0, 1, 1,
0.1780417, -0.006341449, 0.4606035, 1, 0, 0, 1, 1,
0.1783982, 0.1806673, -0.02452176, 0, 0, 0, 1, 1,
0.1810475, -1.071556, 2.624838, 0, 0, 0, 1, 1,
0.1814847, -0.0319172, -0.266992, 0, 0, 0, 1, 1,
0.1844226, -0.5676686, 1.850411, 0, 0, 0, 1, 1,
0.187321, -0.4207841, 4.473685, 0, 0, 0, 1, 1,
0.1933825, 1.248388, -1.236024, 0, 0, 0, 1, 1,
0.209643, -1.084586, 2.282525, 0, 0, 0, 1, 1,
0.2126921, -3.088992, 4.19344, 1, 1, 1, 1, 1,
0.2133344, 0.8410995, -2.109133, 1, 1, 1, 1, 1,
0.2164433, 0.6905108, -1.875676, 1, 1, 1, 1, 1,
0.2176714, -1.021722, 3.335561, 1, 1, 1, 1, 1,
0.2179966, 0.01936664, 2.007584, 1, 1, 1, 1, 1,
0.2180156, -0.6349325, 2.814186, 1, 1, 1, 1, 1,
0.225028, 1.107553, -0.730917, 1, 1, 1, 1, 1,
0.2262574, 0.02051151, 0.4044434, 1, 1, 1, 1, 1,
0.2275772, 0.09374391, 2.545821, 1, 1, 1, 1, 1,
0.2318452, 0.1546652, 0.6321694, 1, 1, 1, 1, 1,
0.2321961, -2.140448, 2.338646, 1, 1, 1, 1, 1,
0.2351118, -0.8245248, 3.801653, 1, 1, 1, 1, 1,
0.2353999, -0.6283254, 2.719786, 1, 1, 1, 1, 1,
0.2354596, 1.443515, 0.8376344, 1, 1, 1, 1, 1,
0.2361631, -0.2391849, 3.856607, 1, 1, 1, 1, 1,
0.2373129, -1.029697, 3.602543, 0, 0, 1, 1, 1,
0.2399483, 0.8041875, -1.807022, 1, 0, 0, 1, 1,
0.2419469, 0.4075705, 1.27012, 1, 0, 0, 1, 1,
0.2468376, -0.7768703, 2.143255, 1, 0, 0, 1, 1,
0.2481715, -1.613965, 3.353531, 1, 0, 0, 1, 1,
0.2503298, 0.2931494, 0.2274213, 1, 0, 0, 1, 1,
0.2507441, 0.6291191, -0.5021908, 0, 0, 0, 1, 1,
0.2522388, 0.4304773, 2.377316, 0, 0, 0, 1, 1,
0.2531585, -0.7334903, 1.813632, 0, 0, 0, 1, 1,
0.2615107, -0.7701882, 2.44705, 0, 0, 0, 1, 1,
0.2639129, -2.239946, 3.532036, 0, 0, 0, 1, 1,
0.2652979, 0.5420507, 1.174949, 0, 0, 0, 1, 1,
0.2677675, -0.06367157, 1.506051, 0, 0, 0, 1, 1,
0.2682646, 0.1117577, 0.3556304, 1, 1, 1, 1, 1,
0.2717082, -0.2243911, 2.793558, 1, 1, 1, 1, 1,
0.272721, 1.51353, 2.537604, 1, 1, 1, 1, 1,
0.2738765, 0.7565102, -0.26757, 1, 1, 1, 1, 1,
0.2886514, -0.6990049, 2.154466, 1, 1, 1, 1, 1,
0.2932441, 0.08209403, 1.76182, 1, 1, 1, 1, 1,
0.2946054, -1.522715, 1.036302, 1, 1, 1, 1, 1,
0.295651, 1.888277, 1.456968, 1, 1, 1, 1, 1,
0.3048503, 0.6259404, 0.6223472, 1, 1, 1, 1, 1,
0.307676, 0.7343799, -1.218915, 1, 1, 1, 1, 1,
0.3083129, 1.883444, 0.3073438, 1, 1, 1, 1, 1,
0.3095397, 1.224808, 1.645602, 1, 1, 1, 1, 1,
0.3113573, -0.6289558, 3.581907, 1, 1, 1, 1, 1,
0.3117028, -1.316354, 1.99509, 1, 1, 1, 1, 1,
0.3152058, -0.5954721, 1.721302, 1, 1, 1, 1, 1,
0.3169794, 0.3534364, 1.231741, 0, 0, 1, 1, 1,
0.3174359, 0.01567606, 1.839792, 1, 0, 0, 1, 1,
0.3209204, 1.042642, 0.6518104, 1, 0, 0, 1, 1,
0.3287928, -0.2763282, 1.408001, 1, 0, 0, 1, 1,
0.3306571, 0.456826, -0.5834092, 1, 0, 0, 1, 1,
0.3357757, -1.724033, 2.284268, 1, 0, 0, 1, 1,
0.3400583, 0.1266809, 1.334162, 0, 0, 0, 1, 1,
0.3426196, 0.5843378, -0.7000143, 0, 0, 0, 1, 1,
0.3467051, -2.177818, 3.057802, 0, 0, 0, 1, 1,
0.3474027, 0.9163859, 0.5689597, 0, 0, 0, 1, 1,
0.3492441, 0.06563146, 1.054974, 0, 0, 0, 1, 1,
0.352737, 0.3670706, 0.6750644, 0, 0, 0, 1, 1,
0.35921, -2.165562, 4.290517, 0, 0, 0, 1, 1,
0.3607548, -0.01593367, 1.852896, 1, 1, 1, 1, 1,
0.3611013, 1.149468, 0.9751322, 1, 1, 1, 1, 1,
0.361571, 1.60639, -1.804649, 1, 1, 1, 1, 1,
0.3650164, 1.260158, 0.3504042, 1, 1, 1, 1, 1,
0.3686742, -0.8266569, 2.004772, 1, 1, 1, 1, 1,
0.3739305, 2.165817, 0.1506596, 1, 1, 1, 1, 1,
0.3749316, -0.588738, 3.445187, 1, 1, 1, 1, 1,
0.3764524, -0.4931564, 1.566785, 1, 1, 1, 1, 1,
0.3784288, 0.2578131, 0.4220793, 1, 1, 1, 1, 1,
0.3809397, 0.5469979, -0.5477801, 1, 1, 1, 1, 1,
0.3817155, 1.494123, 0.01935231, 1, 1, 1, 1, 1,
0.3822705, 0.05062196, 1.604913, 1, 1, 1, 1, 1,
0.3839726, 0.5889381, 0.4024797, 1, 1, 1, 1, 1,
0.3899196, -0.297913, 1.003227, 1, 1, 1, 1, 1,
0.3942229, -0.3674366, 2.382398, 1, 1, 1, 1, 1,
0.3951063, -1.147256, 3.766677, 0, 0, 1, 1, 1,
0.3955896, 0.9773141, -1.241109, 1, 0, 0, 1, 1,
0.401109, -0.397933, 1.298066, 1, 0, 0, 1, 1,
0.405403, 0.1458846, 2.626728, 1, 0, 0, 1, 1,
0.4067828, -0.5191129, 1.655043, 1, 0, 0, 1, 1,
0.4087993, 0.0008848706, 1.410392, 1, 0, 0, 1, 1,
0.4110978, 1.828065, -0.3686146, 0, 0, 0, 1, 1,
0.4154325, -2.035411, 1.751417, 0, 0, 0, 1, 1,
0.4154478, -0.2452181, 3.495863, 0, 0, 0, 1, 1,
0.4160707, 0.7795823, -0.2906397, 0, 0, 0, 1, 1,
0.4300041, 0.5916198, 0.9928662, 0, 0, 0, 1, 1,
0.4351713, -0.06826329, 1.443002, 0, 0, 0, 1, 1,
0.435944, -0.64412, 2.874539, 0, 0, 0, 1, 1,
0.4389375, 0.02459954, 0.7136693, 1, 1, 1, 1, 1,
0.4404998, 0.1012609, 1.358848, 1, 1, 1, 1, 1,
0.4475031, -0.3675122, 1.445863, 1, 1, 1, 1, 1,
0.4549932, 0.6002948, 0.4261765, 1, 1, 1, 1, 1,
0.4576615, -0.6413605, 1.836941, 1, 1, 1, 1, 1,
0.4646749, -0.6653916, 1.808042, 1, 1, 1, 1, 1,
0.4660849, 0.7415811, 0.4880894, 1, 1, 1, 1, 1,
0.4716899, -0.2341078, 1.965218, 1, 1, 1, 1, 1,
0.4772129, 2.015407, -0.9130496, 1, 1, 1, 1, 1,
0.4803495, 1.382179, -0.6682447, 1, 1, 1, 1, 1,
0.482044, 1.277902, 0.664455, 1, 1, 1, 1, 1,
0.4836292, -0.9676479, 3.091306, 1, 1, 1, 1, 1,
0.4862412, 1.008509, 1.02729, 1, 1, 1, 1, 1,
0.4899428, -0.7727082, 1.697541, 1, 1, 1, 1, 1,
0.4924508, -0.1806657, 1.11488, 1, 1, 1, 1, 1,
0.494505, 1.614281, -0.1448347, 0, 0, 1, 1, 1,
0.4958174, 0.2267059, 1.047774, 1, 0, 0, 1, 1,
0.5018107, 1.954, -1.947533, 1, 0, 0, 1, 1,
0.5054274, 0.710265, 1.848079, 1, 0, 0, 1, 1,
0.5060258, 1.522028, 1.892876, 1, 0, 0, 1, 1,
0.5063087, -0.812341, 3.299373, 1, 0, 0, 1, 1,
0.5080798, 1.341093, -0.6389722, 0, 0, 0, 1, 1,
0.5085092, 0.5207686, 0.3485328, 0, 0, 0, 1, 1,
0.5191777, -0.427972, 2.159247, 0, 0, 0, 1, 1,
0.5255408, 1.641205, -0.1436485, 0, 0, 0, 1, 1,
0.5272546, -0.9250135, 2.925682, 0, 0, 0, 1, 1,
0.5324089, -0.5546714, 3.547819, 0, 0, 0, 1, 1,
0.533859, -0.3186376, 1.997079, 0, 0, 0, 1, 1,
0.539587, 0.2685601, 0.09133718, 1, 1, 1, 1, 1,
0.541141, -0.04638556, 1.663575, 1, 1, 1, 1, 1,
0.5431692, 0.7516735, 2.208837, 1, 1, 1, 1, 1,
0.544681, 0.3212304, 1.07403, 1, 1, 1, 1, 1,
0.5467607, 1.048156, 0.3889678, 1, 1, 1, 1, 1,
0.5477429, 0.3999437, -0.4932494, 1, 1, 1, 1, 1,
0.5493088, 1.44824, 0.08743718, 1, 1, 1, 1, 1,
0.5501121, 0.3716717, 0.2860267, 1, 1, 1, 1, 1,
0.5532039, -0.6372587, 2.81374, 1, 1, 1, 1, 1,
0.5556875, 1.664427, -0.5931184, 1, 1, 1, 1, 1,
0.5609889, 0.1322371, 0.8710621, 1, 1, 1, 1, 1,
0.566088, -0.1266963, 2.171589, 1, 1, 1, 1, 1,
0.5737476, 0.3877861, 1.246689, 1, 1, 1, 1, 1,
0.5801335, 0.05914596, 0.7864366, 1, 1, 1, 1, 1,
0.5857978, -0.2826068, 0.9675328, 1, 1, 1, 1, 1,
0.5862279, -1.963352, 1.623831, 0, 0, 1, 1, 1,
0.5904462, -1.054881, 2.149649, 1, 0, 0, 1, 1,
0.5923219, -0.07651347, 0.6030476, 1, 0, 0, 1, 1,
0.5927343, 1.560411, 1.361493, 1, 0, 0, 1, 1,
0.5973901, 0.01506944, 0.347686, 1, 0, 0, 1, 1,
0.6044538, 0.08143873, 1.582028, 1, 0, 0, 1, 1,
0.6061757, -0.2164667, 3.261491, 0, 0, 0, 1, 1,
0.6067363, -0.5041516, 0.4492538, 0, 0, 0, 1, 1,
0.6095518, -0.1169992, 0.1068801, 0, 0, 0, 1, 1,
0.6096719, 0.332766, 1.260868, 0, 0, 0, 1, 1,
0.6141823, -0.9209838, 4.442633, 0, 0, 0, 1, 1,
0.6215759, -0.5899692, 0.7670536, 0, 0, 0, 1, 1,
0.6234491, -0.7149796, 1.883931, 0, 0, 0, 1, 1,
0.6258351, -0.4353653, 1.036877, 1, 1, 1, 1, 1,
0.6270854, 0.9065961, 0.07238925, 1, 1, 1, 1, 1,
0.6306935, 1.78881, 1.153781, 1, 1, 1, 1, 1,
0.6381848, -0.7632257, 1.770309, 1, 1, 1, 1, 1,
0.6421162, 0.2145636, 3.096568, 1, 1, 1, 1, 1,
0.6429679, 0.1643531, 1.11156, 1, 1, 1, 1, 1,
0.6444998, -0.748491, 1.697636, 1, 1, 1, 1, 1,
0.6452057, 0.9231398, 1.0415, 1, 1, 1, 1, 1,
0.6460188, -0.9924574, 3.338162, 1, 1, 1, 1, 1,
0.6491254, 0.4825171, 0.2868263, 1, 1, 1, 1, 1,
0.6529504, -0.0119457, 2.032418, 1, 1, 1, 1, 1,
0.655799, -0.8259933, 1.1956, 1, 1, 1, 1, 1,
0.6577565, 0.7775578, -0.3043516, 1, 1, 1, 1, 1,
0.6596496, 1.441931, 0.5792905, 1, 1, 1, 1, 1,
0.66294, 0.5432363, 1.470155, 1, 1, 1, 1, 1,
0.6654302, -0.2542501, 2.861139, 0, 0, 1, 1, 1,
0.6662849, 1.215627, 0.7523135, 1, 0, 0, 1, 1,
0.6730354, -1.532336, 2.410753, 1, 0, 0, 1, 1,
0.6730418, 0.7760062, 1.123418, 1, 0, 0, 1, 1,
0.6740834, 0.7533187, 0.7934104, 1, 0, 0, 1, 1,
0.6749244, 0.4946679, 1.274108, 1, 0, 0, 1, 1,
0.6768619, 0.5016906, 0.961848, 0, 0, 0, 1, 1,
0.6775345, 0.07110492, 0.6022649, 0, 0, 0, 1, 1,
0.6825641, 0.7000242, 1.23889, 0, 0, 0, 1, 1,
0.6873252, -0.7489547, 0.0758086, 0, 0, 0, 1, 1,
0.6877526, -1.483344, 1.628769, 0, 0, 0, 1, 1,
0.6963269, 0.09608556, 0.7239003, 0, 0, 0, 1, 1,
0.697504, 0.2021709, 0.545105, 0, 0, 0, 1, 1,
0.7021282, 0.1319762, 0.06105468, 1, 1, 1, 1, 1,
0.7035879, -0.9398257, 2.931636, 1, 1, 1, 1, 1,
0.7062873, 0.2079121, 0.845993, 1, 1, 1, 1, 1,
0.7077562, 0.3125615, 1.953791, 1, 1, 1, 1, 1,
0.7087995, -1.486411, 3.675737, 1, 1, 1, 1, 1,
0.7138289, -1.24977, 2.554586, 1, 1, 1, 1, 1,
0.7139719, 0.1512659, 2.710265, 1, 1, 1, 1, 1,
0.7147266, 1.123974, -0.5361732, 1, 1, 1, 1, 1,
0.7173288, 0.2352247, 1.306785, 1, 1, 1, 1, 1,
0.7207069, -1.511871, 1.905675, 1, 1, 1, 1, 1,
0.7228987, -0.05463312, 4.314734, 1, 1, 1, 1, 1,
0.7234608, 0.3064294, 0.450926, 1, 1, 1, 1, 1,
0.7249303, -0.3073881, 2.570522, 1, 1, 1, 1, 1,
0.7257151, -0.1301958, -2.524094, 1, 1, 1, 1, 1,
0.7268559, -1.221948, 0.6502607, 1, 1, 1, 1, 1,
0.7329805, -0.282405, 1.824896, 0, 0, 1, 1, 1,
0.734262, 0.0291474, 1.985117, 1, 0, 0, 1, 1,
0.7355888, 1.410087, 1.173094, 1, 0, 0, 1, 1,
0.7371987, 0.3494264, 2.231685, 1, 0, 0, 1, 1,
0.7506155, 0.2635829, 1.543174, 1, 0, 0, 1, 1,
0.7513625, -0.5516396, -0.03076473, 1, 0, 0, 1, 1,
0.7582291, 1.204569, 1.677188, 0, 0, 0, 1, 1,
0.7627343, 1.325705, 0.3888642, 0, 0, 0, 1, 1,
0.7628796, -1.082663, 2.110739, 0, 0, 0, 1, 1,
0.7641293, -0.9018677, 1.071713, 0, 0, 0, 1, 1,
0.7673082, -0.02666714, 1.750401, 0, 0, 0, 1, 1,
0.7685819, -1.260428, 3.061331, 0, 0, 0, 1, 1,
0.7699108, -0.247259, 2.14075, 0, 0, 0, 1, 1,
0.7720379, -0.01388133, 2.844686, 1, 1, 1, 1, 1,
0.7753009, 0.4683462, 0.733471, 1, 1, 1, 1, 1,
0.7758138, 0.8329237, 1.252065, 1, 1, 1, 1, 1,
0.7772202, -0.8124653, 2.232322, 1, 1, 1, 1, 1,
0.7832652, -1.679901, 3.547965, 1, 1, 1, 1, 1,
0.7909797, -0.02405015, 2.182186, 1, 1, 1, 1, 1,
0.7978681, 0.7563902, -0.9206222, 1, 1, 1, 1, 1,
0.7991158, -0.704473, 2.87385, 1, 1, 1, 1, 1,
0.8075944, 0.6910784, 0.5876543, 1, 1, 1, 1, 1,
0.8113548, -0.1867924, 1.049624, 1, 1, 1, 1, 1,
0.8124387, -0.2764537, 1.405502, 1, 1, 1, 1, 1,
0.818414, -0.3480977, 3.044333, 1, 1, 1, 1, 1,
0.8187168, -1.080578, 3.219316, 1, 1, 1, 1, 1,
0.8253968, -0.7027825, 2.627712, 1, 1, 1, 1, 1,
0.8280891, 2.457086, -1.1493, 1, 1, 1, 1, 1,
0.8296589, -1.023373, 2.751336, 0, 0, 1, 1, 1,
0.8343402, 0.5997475, 0.9817401, 1, 0, 0, 1, 1,
0.8367622, -0.2858478, 0.5230893, 1, 0, 0, 1, 1,
0.8405197, 1.227414, 0.385477, 1, 0, 0, 1, 1,
0.8413979, -0.2858228, 1.418903, 1, 0, 0, 1, 1,
0.8429219, -0.529249, 0.7612573, 1, 0, 0, 1, 1,
0.8506481, 0.04484994, 2.134414, 0, 0, 0, 1, 1,
0.8510546, -1.189222, 3.172332, 0, 0, 0, 1, 1,
0.8539962, 0.6657532, 2.701397, 0, 0, 0, 1, 1,
0.854315, 0.003320522, 0.02841242, 0, 0, 0, 1, 1,
0.8543904, -0.3638976, 0.800678, 0, 0, 0, 1, 1,
0.8605186, 2.200036, 0.4027703, 0, 0, 0, 1, 1,
0.8606163, -0.6059744, 5.476037, 0, 0, 0, 1, 1,
0.866757, 1.01307, 1.503036, 1, 1, 1, 1, 1,
0.8679245, -0.02044008, 1.510499, 1, 1, 1, 1, 1,
0.8702036, -0.6198738, 0.7044811, 1, 1, 1, 1, 1,
0.8710064, -2.11857, 3.905251, 1, 1, 1, 1, 1,
0.872537, 1.315681, 0.7164538, 1, 1, 1, 1, 1,
0.8981784, 0.09678949, 0.8479376, 1, 1, 1, 1, 1,
0.8981918, 0.8591108, 1.372104, 1, 1, 1, 1, 1,
0.8983668, 2.391873, 0.2105562, 1, 1, 1, 1, 1,
0.9065423, -0.654512, 2.689899, 1, 1, 1, 1, 1,
0.9115456, 0.07623347, 0.9921719, 1, 1, 1, 1, 1,
0.9120101, 1.045427, 0.1814875, 1, 1, 1, 1, 1,
0.9151585, 0.9133515, -0.4200634, 1, 1, 1, 1, 1,
0.9169468, 1.901116, 0.04078564, 1, 1, 1, 1, 1,
0.9205436, 0.3722168, 1.386757, 1, 1, 1, 1, 1,
0.9370996, -0.05542495, 1.920043, 1, 1, 1, 1, 1,
0.9382941, 2.224102, -0.3473661, 0, 0, 1, 1, 1,
0.9451239, 0.8744218, -1.601514, 1, 0, 0, 1, 1,
0.9473485, -0.06762818, 2.881648, 1, 0, 0, 1, 1,
0.9512886, -2.087073, 2.581834, 1, 0, 0, 1, 1,
0.9540263, 1.775804, -0.06756018, 1, 0, 0, 1, 1,
0.9549786, 0.08477578, 0.4109986, 1, 0, 0, 1, 1,
0.9569301, -1.061276, 2.531939, 0, 0, 0, 1, 1,
0.9580846, 0.5068197, 0.8429629, 0, 0, 0, 1, 1,
0.9661017, -0.1150345, 1.72741, 0, 0, 0, 1, 1,
0.9667689, -0.7573964, 1.635569, 0, 0, 0, 1, 1,
0.971288, 0.3389254, 1.824267, 0, 0, 0, 1, 1,
0.9731784, 1.195771, 0.4362193, 0, 0, 0, 1, 1,
0.9734609, 0.5252687, 1.200315, 0, 0, 0, 1, 1,
0.9820694, 0.7430861, -1.558106, 1, 1, 1, 1, 1,
0.9849567, -0.3865519, 1.575108, 1, 1, 1, 1, 1,
1.001583, 0.2573416, 1.034723, 1, 1, 1, 1, 1,
1.003964, 0.5184748, 0.3319979, 1, 1, 1, 1, 1,
1.008824, 0.5405058, 0.866949, 1, 1, 1, 1, 1,
1.021358, -0.2430553, 3.1521, 1, 1, 1, 1, 1,
1.027307, -0.2072231, 1.72743, 1, 1, 1, 1, 1,
1.031404, 0.9021201, 0.422514, 1, 1, 1, 1, 1,
1.040053, -0.4748321, 2.669395, 1, 1, 1, 1, 1,
1.042026, -0.4554466, 1.251207, 1, 1, 1, 1, 1,
1.042314, 0.8571517, 0.2245687, 1, 1, 1, 1, 1,
1.045353, 1.673596, 2.198337, 1, 1, 1, 1, 1,
1.046107, -1.03016, 1.681016, 1, 1, 1, 1, 1,
1.047321, -0.2101085, 3.234663, 1, 1, 1, 1, 1,
1.047789, -0.7916292, 3.495438, 1, 1, 1, 1, 1,
1.053155, -1.621566, 1.145917, 0, 0, 1, 1, 1,
1.053991, 2.007925, 1.505618, 1, 0, 0, 1, 1,
1.057164, -0.1806538, -0.2606915, 1, 0, 0, 1, 1,
1.05796, -2.008981, 2.638851, 1, 0, 0, 1, 1,
1.061365, 1.298875, 2.440657, 1, 0, 0, 1, 1,
1.064595, -1.883658, 2.826926, 1, 0, 0, 1, 1,
1.068718, -0.3881675, 1.746626, 0, 0, 0, 1, 1,
1.079199, 0.01236496, 2.544611, 0, 0, 0, 1, 1,
1.084358, 0.09960226, 0.4747157, 0, 0, 0, 1, 1,
1.08631, 0.8351573, 1.089508, 0, 0, 0, 1, 1,
1.089345, 0.460789, 1.143997, 0, 0, 0, 1, 1,
1.10299, -0.2371215, 1.671881, 0, 0, 0, 1, 1,
1.109491, 0.1806791, 0.424077, 0, 0, 0, 1, 1,
1.112399, 1.207638, -0.4639999, 1, 1, 1, 1, 1,
1.120952, 0.858578, 0.3406538, 1, 1, 1, 1, 1,
1.122454, 0.1536871, 1.128456, 1, 1, 1, 1, 1,
1.12417, -1.680604, 1.699594, 1, 1, 1, 1, 1,
1.12484, -1.53748, 2.724945, 1, 1, 1, 1, 1,
1.127975, 0.5499908, 2.471195, 1, 1, 1, 1, 1,
1.132237, -0.1123487, 1.830103, 1, 1, 1, 1, 1,
1.147823, 0.5579725, 0.5652741, 1, 1, 1, 1, 1,
1.149638, 1.07803, 2.030945, 1, 1, 1, 1, 1,
1.156092, 1.09124, 0.4956209, 1, 1, 1, 1, 1,
1.156733, 1.564473, 0.5513775, 1, 1, 1, 1, 1,
1.158297, -2.561634, 1.906458, 1, 1, 1, 1, 1,
1.163115, 1.40968, 2.38775, 1, 1, 1, 1, 1,
1.165488, 1.454953, 0.9153425, 1, 1, 1, 1, 1,
1.170867, 0.6142553, 3.936106, 1, 1, 1, 1, 1,
1.173054, 0.06553832, 1.461336, 0, 0, 1, 1, 1,
1.173797, 0.9062734, 1.051888, 1, 0, 0, 1, 1,
1.175872, 0.4599814, -0.2100069, 1, 0, 0, 1, 1,
1.180308, -0.04089922, 2.93758, 1, 0, 0, 1, 1,
1.182164, 1.108143, 0.3863837, 1, 0, 0, 1, 1,
1.184172, 0.8725415, 2.058699, 1, 0, 0, 1, 1,
1.189091, -0.009598528, 1.572945, 0, 0, 0, 1, 1,
1.199449, 0.3954488, 2.040983, 0, 0, 0, 1, 1,
1.213124, -1.078498, 5.348437, 0, 0, 0, 1, 1,
1.213549, -0.9564605, 2.614048, 0, 0, 0, 1, 1,
1.220539, 0.7192402, 1.16164, 0, 0, 0, 1, 1,
1.231538, 1.118804, 0.872001, 0, 0, 0, 1, 1,
1.250681, 0.1800061, 1.344263, 0, 0, 0, 1, 1,
1.253316, 0.212696, 0.5032533, 1, 1, 1, 1, 1,
1.265084, -0.6696367, 3.155705, 1, 1, 1, 1, 1,
1.26527, 0.3966785, 2.207641, 1, 1, 1, 1, 1,
1.273052, 1.449057, 1.370068, 1, 1, 1, 1, 1,
1.276607, 0.9100225, 1.072879, 1, 1, 1, 1, 1,
1.279419, -1.497796, 5.089126, 1, 1, 1, 1, 1,
1.280348, -0.8920623, 2.299448, 1, 1, 1, 1, 1,
1.281196, -0.2735517, 2.230205, 1, 1, 1, 1, 1,
1.289382, 1.770658, -0.06986126, 1, 1, 1, 1, 1,
1.291645, 2.331048, 1.995072, 1, 1, 1, 1, 1,
1.29712, 0.7296498, -0.4055159, 1, 1, 1, 1, 1,
1.303632, 1.572813, 0.7217548, 1, 1, 1, 1, 1,
1.307946, -1.946495, 2.381028, 1, 1, 1, 1, 1,
1.308488, 0.4547007, 2.151926, 1, 1, 1, 1, 1,
1.313612, 0.1139607, 0.3452731, 1, 1, 1, 1, 1,
1.319945, -0.4726308, 3.490785, 0, 0, 1, 1, 1,
1.325648, -1.329224, 2.548783, 1, 0, 0, 1, 1,
1.3268, -0.3314046, 0.07292421, 1, 0, 0, 1, 1,
1.337369, 0.9654226, 1.811555, 1, 0, 0, 1, 1,
1.338651, 2.692461, 0.3477129, 1, 0, 0, 1, 1,
1.355615, 0.8972608, -0.9563406, 1, 0, 0, 1, 1,
1.364415, 0.3444246, 1.951003, 0, 0, 0, 1, 1,
1.379628, -0.4614405, 1.062648, 0, 0, 0, 1, 1,
1.382264, -0.4236088, -0.1351061, 0, 0, 0, 1, 1,
1.407576, -1.122966, 1.990083, 0, 0, 0, 1, 1,
1.41096, -0.06941832, -0.495448, 0, 0, 0, 1, 1,
1.416498, -0.4627141, 2.020669, 0, 0, 0, 1, 1,
1.426558, -0.5546567, 3.097787, 0, 0, 0, 1, 1,
1.441129, -0.6886819, 1.858049, 1, 1, 1, 1, 1,
1.454229, -1.334827, -0.4098039, 1, 1, 1, 1, 1,
1.454648, -0.7975358, 2.894006, 1, 1, 1, 1, 1,
1.461028, 0.08000771, 1.225275, 1, 1, 1, 1, 1,
1.461137, -0.4468389, 2.357443, 1, 1, 1, 1, 1,
1.467724, -0.5486684, 1.974385, 1, 1, 1, 1, 1,
1.474902, -0.7388203, -0.4555252, 1, 1, 1, 1, 1,
1.479201, -0.8377281, 1.068847, 1, 1, 1, 1, 1,
1.479363, 1.303089, 1.657137, 1, 1, 1, 1, 1,
1.481308, 0.006569084, 2.092039, 1, 1, 1, 1, 1,
1.514275, 3.591473, -0.9171824, 1, 1, 1, 1, 1,
1.524566, 1.321475, -0.2255547, 1, 1, 1, 1, 1,
1.525456, -0.7871453, 2.092899, 1, 1, 1, 1, 1,
1.52665, -0.7448403, -0.3111373, 1, 1, 1, 1, 1,
1.539502, 0.06723754, 2.295392, 1, 1, 1, 1, 1,
1.542973, 0.04755697, 2.916711, 0, 0, 1, 1, 1,
1.546198, 1.13591, 3.020752, 1, 0, 0, 1, 1,
1.54836, -1.226198, 2.278458, 1, 0, 0, 1, 1,
1.551548, -0.4982268, -0.2955419, 1, 0, 0, 1, 1,
1.553012, 0.9640687, 0.2997636, 1, 0, 0, 1, 1,
1.555503, -0.7808225, 3.654722, 1, 0, 0, 1, 1,
1.557377, -0.2731304, 2.475143, 0, 0, 0, 1, 1,
1.560096, -0.6606496, 2.251193, 0, 0, 0, 1, 1,
1.569484, -0.3043103, 2.584661, 0, 0, 0, 1, 1,
1.572951, -0.2717765, 0.05416356, 0, 0, 0, 1, 1,
1.577862, 0.5908821, 2.373006, 0, 0, 0, 1, 1,
1.578725, 1.262432, 1.760264, 0, 0, 0, 1, 1,
1.599175, 0.8564956, 0.6581427, 0, 0, 0, 1, 1,
1.610247, 0.2477208, 0.5691797, 1, 1, 1, 1, 1,
1.618551, 0.435956, -0.1462304, 1, 1, 1, 1, 1,
1.632172, 0.5364292, 0.9629134, 1, 1, 1, 1, 1,
1.642601, -0.605619, 3.001038, 1, 1, 1, 1, 1,
1.645797, 1.70587, -0.7907434, 1, 1, 1, 1, 1,
1.646796, 0.8805349, 2.248789, 1, 1, 1, 1, 1,
1.647568, -2.799434, 3.494727, 1, 1, 1, 1, 1,
1.652704, -1.45697, 3.55326, 1, 1, 1, 1, 1,
1.657425, 0.3856265, 1.441549, 1, 1, 1, 1, 1,
1.663094, -0.009601636, 2.651876, 1, 1, 1, 1, 1,
1.67923, -0.4816828, 2.217891, 1, 1, 1, 1, 1,
1.706718, -0.1353121, 0.4610711, 1, 1, 1, 1, 1,
1.721606, 0.8508648, -0.3684013, 1, 1, 1, 1, 1,
1.722682, -0.9556082, 2.612607, 1, 1, 1, 1, 1,
1.747519, 2.199673, -0.2781011, 1, 1, 1, 1, 1,
1.755163, -0.1246573, 2.921531, 0, 0, 1, 1, 1,
1.768067, -0.8510752, 0.7652743, 1, 0, 0, 1, 1,
1.78074, -1.634895, 1.347472, 1, 0, 0, 1, 1,
1.783735, 0.07485296, 1.580646, 1, 0, 0, 1, 1,
1.791235, -0.8872198, 1.96899, 1, 0, 0, 1, 1,
1.813081, 1.837246, 1.709081, 1, 0, 0, 1, 1,
1.81455, 2.669716, 0.6293876, 0, 0, 0, 1, 1,
1.822362, -0.9675143, 1.497033, 0, 0, 0, 1, 1,
1.825195, -1.206068, 1.918519, 0, 0, 0, 1, 1,
1.83488, -1.130251, 0.8279294, 0, 0, 0, 1, 1,
1.836577, -1.085681, 2.383193, 0, 0, 0, 1, 1,
1.841854, -0.9732009, 3.356319, 0, 0, 0, 1, 1,
1.878574, 0.9277987, 2.264565, 0, 0, 0, 1, 1,
1.890555, 0.3087006, 0.8855975, 1, 1, 1, 1, 1,
1.900004, -0.4143142, 2.27976, 1, 1, 1, 1, 1,
1.918769, -0.1525744, 1.292231, 1, 1, 1, 1, 1,
1.942958, 0.3070925, 1.870936, 1, 1, 1, 1, 1,
1.945386, 0.3809927, 0.6348456, 1, 1, 1, 1, 1,
1.948552, 0.5614479, 2.26886, 1, 1, 1, 1, 1,
1.960238, -1.369214, 1.193062, 1, 1, 1, 1, 1,
1.980987, 0.1510035, 1.298774, 1, 1, 1, 1, 1,
1.999095, -0.4975339, 1.721602, 1, 1, 1, 1, 1,
2.028038, -0.349831, 2.282591, 1, 1, 1, 1, 1,
2.052284, 0.7672396, 3.621578, 1, 1, 1, 1, 1,
2.07877, -0.7655435, 2.355614, 1, 1, 1, 1, 1,
2.149118, -0.5369354, 2.720972, 1, 1, 1, 1, 1,
2.155257, -2.338306, 1.305379, 1, 1, 1, 1, 1,
2.168193, 0.05429621, 0.6493548, 1, 1, 1, 1, 1,
2.189248, -0.5808907, 1.075517, 0, 0, 1, 1, 1,
2.191245, -0.9073162, 0.3615321, 1, 0, 0, 1, 1,
2.230825, -0.1274175, 0.4827636, 1, 0, 0, 1, 1,
2.243625, 1.684137, 2.982575, 1, 0, 0, 1, 1,
2.251421, -1.528905, 2.036674, 1, 0, 0, 1, 1,
2.263887, 1.305738, -1.387472, 1, 0, 0, 1, 1,
2.358032, 0.6585304, 1.39265, 0, 0, 0, 1, 1,
2.448555, 0.4032096, 2.426797, 0, 0, 0, 1, 1,
2.459616, -0.5710211, 2.402701, 0, 0, 0, 1, 1,
2.475238, 0.583448, 1.032143, 0, 0, 0, 1, 1,
2.508083, 1.518558, 0.1598987, 0, 0, 0, 1, 1,
2.543754, -1.167727, 3.525054, 0, 0, 0, 1, 1,
2.567017, 0.5106391, 1.317625, 0, 0, 0, 1, 1,
2.595757, -1.32753, 1.840124, 1, 1, 1, 1, 1,
2.601027, 0.0002922883, 1.065154, 1, 1, 1, 1, 1,
2.849095, -0.8659661, 2.71886, 1, 1, 1, 1, 1,
2.955595, 0.8375913, 0.5295777, 1, 1, 1, 1, 1,
3.08617, -0.1540216, 0.7084712, 1, 1, 1, 1, 1,
3.35047, 0.2387181, 1.412466, 1, 1, 1, 1, 1,
4.083067, 1.218998, 1.215524, 1, 1, 1, 1, 1
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
var radius = 9.967225;
var distance = 35.00945;
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
mvMatrix.translate( -0.5316353, -0.2512403, 0.04704714 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.00945);
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
