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
-3.50113, -0.9601526, -1.927329, 1, 0, 0, 1,
-3.194581, -0.7252474, -1.728492, 1, 0.007843138, 0, 1,
-2.929621, -0.3721191, -1.405166, 1, 0.01176471, 0, 1,
-2.605144, -1.456895, -2.460047, 1, 0.01960784, 0, 1,
-2.562966, -1.998078, -1.157744, 1, 0.02352941, 0, 1,
-2.462866, 0.9587929, -1.281358, 1, 0.03137255, 0, 1,
-2.433909, -0.4774506, -2.610948, 1, 0.03529412, 0, 1,
-2.428596, -0.5983402, -1.091718, 1, 0.04313726, 0, 1,
-2.318437, 1.028988, -0.1123676, 1, 0.04705882, 0, 1,
-2.222618, 0.476709, -2.076628, 1, 0.05490196, 0, 1,
-2.178743, -1.041581, -2.729668, 1, 0.05882353, 0, 1,
-2.161851, -1.303573, -3.508674, 1, 0.06666667, 0, 1,
-2.159428, -2.567355, -1.699664, 1, 0.07058824, 0, 1,
-2.138701, 0.1527624, -3.275959, 1, 0.07843138, 0, 1,
-2.112903, 1.223908, -2.595766, 1, 0.08235294, 0, 1,
-2.110164, 1.168062, -0.8301995, 1, 0.09019608, 0, 1,
-2.104188, -1.067621, -2.404971, 1, 0.09411765, 0, 1,
-2.095532, 0.1783831, -1.109554, 1, 0.1019608, 0, 1,
-2.092, 1.301684, -1.717581, 1, 0.1098039, 0, 1,
-2.091697, 0.2952324, -1.257636, 1, 0.1137255, 0, 1,
-2.075224, 1.162123, -1.025731, 1, 0.1215686, 0, 1,
-2.058261, -0.3176377, -1.233184, 1, 0.1254902, 0, 1,
-2.022257, 0.6302042, -1.664885, 1, 0.1333333, 0, 1,
-2.014465, 1.915213, -1.400844, 1, 0.1372549, 0, 1,
-2.01446, -1.950286, 0.2737381, 1, 0.145098, 0, 1,
-1.984798, -0.4085463, -2.6066, 1, 0.1490196, 0, 1,
-1.975654, -0.0420025, -2.062087, 1, 0.1568628, 0, 1,
-1.974375, 0.9397479, 0.5544204, 1, 0.1607843, 0, 1,
-1.972443, -0.4412963, -2.712224, 1, 0.1686275, 0, 1,
-1.960502, 0.258539, -0.2618875, 1, 0.172549, 0, 1,
-1.958557, 0.3654132, -0.8693288, 1, 0.1803922, 0, 1,
-1.958298, -0.1679407, -1.15528, 1, 0.1843137, 0, 1,
-1.93538, -0.9704089, -3.254285, 1, 0.1921569, 0, 1,
-1.928403, -1.233229, -2.379322, 1, 0.1960784, 0, 1,
-1.921128, -0.9397162, -0.9158366, 1, 0.2039216, 0, 1,
-1.915487, 1.604599, -2.506451, 1, 0.2117647, 0, 1,
-1.869714, -0.4340494, -0.7572283, 1, 0.2156863, 0, 1,
-1.862342, -0.5731965, -0.7312906, 1, 0.2235294, 0, 1,
-1.850106, -0.9427192, -1.741803, 1, 0.227451, 0, 1,
-1.833331, 1.467225, -1.904016, 1, 0.2352941, 0, 1,
-1.828314, -0.0004590964, -1.541408, 1, 0.2392157, 0, 1,
-1.828158, -0.08603951, -2.87765, 1, 0.2470588, 0, 1,
-1.827426, 0.3709951, -1.25508, 1, 0.2509804, 0, 1,
-1.818054, -1.363583, -3.696535, 1, 0.2588235, 0, 1,
-1.791694, 0.6904775, 0.7576393, 1, 0.2627451, 0, 1,
-1.790165, 2.394719, 1.284492, 1, 0.2705882, 0, 1,
-1.777438, -0.01767069, -1.996714, 1, 0.2745098, 0, 1,
-1.756704, -2.263432, -3.335405, 1, 0.282353, 0, 1,
-1.740809, -0.1932651, -2.564148, 1, 0.2862745, 0, 1,
-1.736723, -1.600932, -2.566371, 1, 0.2941177, 0, 1,
-1.734013, -0.3135981, -2.19115, 1, 0.3019608, 0, 1,
-1.729367, 1.182646, -1.07378, 1, 0.3058824, 0, 1,
-1.71281, 0.1704918, -2.230509, 1, 0.3137255, 0, 1,
-1.692337, -1.177005, -1.581904, 1, 0.3176471, 0, 1,
-1.685201, 0.09010243, 0.1515377, 1, 0.3254902, 0, 1,
-1.684193, -0.4269504, -1.472507, 1, 0.3294118, 0, 1,
-1.673808, -2.893167, -3.73844, 1, 0.3372549, 0, 1,
-1.668204, 0.556849, -2.335412, 1, 0.3411765, 0, 1,
-1.656979, -0.5341306, -1.088808, 1, 0.3490196, 0, 1,
-1.641281, 1.753023, -0.166743, 1, 0.3529412, 0, 1,
-1.634782, 0.1840322, -2.946681, 1, 0.3607843, 0, 1,
-1.620568, 0.2405606, -0.1354418, 1, 0.3647059, 0, 1,
-1.615992, -0.04988166, 1.049034, 1, 0.372549, 0, 1,
-1.605094, -3.187625, -2.714821, 1, 0.3764706, 0, 1,
-1.591175, -0.6917838, -0.7725174, 1, 0.3843137, 0, 1,
-1.565733, 0.1251578, -2.212864, 1, 0.3882353, 0, 1,
-1.55496, 1.61483, -0.7281647, 1, 0.3960784, 0, 1,
-1.551335, 0.4225408, -0.08704, 1, 0.4039216, 0, 1,
-1.529882, -0.2283982, -3.104648, 1, 0.4078431, 0, 1,
-1.529165, 0.9685016, -0.5743488, 1, 0.4156863, 0, 1,
-1.519801, -0.09045976, -3.409636, 1, 0.4196078, 0, 1,
-1.508896, -0.2290131, -0.5232468, 1, 0.427451, 0, 1,
-1.506989, -0.2658257, -3.928282, 1, 0.4313726, 0, 1,
-1.501306, 1.427722, -1.831194, 1, 0.4392157, 0, 1,
-1.497694, 0.2189415, -0.05692378, 1, 0.4431373, 0, 1,
-1.490372, -0.92285, -3.467261, 1, 0.4509804, 0, 1,
-1.47926, -0.2031708, -2.394819, 1, 0.454902, 0, 1,
-1.474959, 0.8398768, 0.8234642, 1, 0.4627451, 0, 1,
-1.471969, -0.3038375, -2.28399, 1, 0.4666667, 0, 1,
-1.462174, -0.1678776, -2.374909, 1, 0.4745098, 0, 1,
-1.459397, 0.183926, -0.7858415, 1, 0.4784314, 0, 1,
-1.450901, 0.1323749, -2.360993, 1, 0.4862745, 0, 1,
-1.448936, -0.1620095, -2.299508, 1, 0.4901961, 0, 1,
-1.448765, 0.6696169, -0.9224153, 1, 0.4980392, 0, 1,
-1.448496, 0.1759813, -3.155245, 1, 0.5058824, 0, 1,
-1.440721, -0.4903741, -3.485067, 1, 0.509804, 0, 1,
-1.439818, -0.2810944, -2.364059, 1, 0.5176471, 0, 1,
-1.430364, 1.706339, -1.471841, 1, 0.5215687, 0, 1,
-1.42917, 1.068225, -1.726617, 1, 0.5294118, 0, 1,
-1.423785, 0.1856234, -1.717374, 1, 0.5333334, 0, 1,
-1.421344, 0.552691, -2.703155, 1, 0.5411765, 0, 1,
-1.420322, -0.100124, -1.806347, 1, 0.5450981, 0, 1,
-1.417008, -0.4407873, -1.038207, 1, 0.5529412, 0, 1,
-1.409152, 0.6558257, 0.07336807, 1, 0.5568628, 0, 1,
-1.404042, -2.383395, -2.218123, 1, 0.5647059, 0, 1,
-1.386788, 0.184669, -0.4399305, 1, 0.5686275, 0, 1,
-1.382954, 1.460881, -1.122147, 1, 0.5764706, 0, 1,
-1.381241, -0.4655175, -1.301491, 1, 0.5803922, 0, 1,
-1.381046, -0.7954556, -1.283335, 1, 0.5882353, 0, 1,
-1.377125, -0.7695398, -0.9596319, 1, 0.5921569, 0, 1,
-1.354252, -1.325345, -0.4847307, 1, 0.6, 0, 1,
-1.351745, -0.3395256, -0.3929121, 1, 0.6078432, 0, 1,
-1.346727, -0.08387204, -2.005776, 1, 0.6117647, 0, 1,
-1.340761, -0.2839649, -0.9966602, 1, 0.6196079, 0, 1,
-1.330686, -1.954531, -2.122196, 1, 0.6235294, 0, 1,
-1.32399, 1.274951, -2.233794, 1, 0.6313726, 0, 1,
-1.30846, 0.9222721, -1.500167, 1, 0.6352941, 0, 1,
-1.269006, 0.0726068, -1.793842, 1, 0.6431373, 0, 1,
-1.266065, -1.223763, -1.783066, 1, 0.6470588, 0, 1,
-1.262012, 1.064762, 0.1146321, 1, 0.654902, 0, 1,
-1.256355, -0.07620829, -2.680508, 1, 0.6588235, 0, 1,
-1.247981, 0.2234524, -0.6653873, 1, 0.6666667, 0, 1,
-1.241069, -0.7649358, -0.7461157, 1, 0.6705883, 0, 1,
-1.237633, 0.7070401, -0.3897101, 1, 0.6784314, 0, 1,
-1.22802, 0.1928463, 0.634208, 1, 0.682353, 0, 1,
-1.213531, -0.09471564, -2.960747, 1, 0.6901961, 0, 1,
-1.2133, 2.0978, 0.3267798, 1, 0.6941177, 0, 1,
-1.200799, -0.2738367, -2.314427, 1, 0.7019608, 0, 1,
-1.19366, -0.256497, -1.266687, 1, 0.7098039, 0, 1,
-1.191904, -0.8682814, -1.718998, 1, 0.7137255, 0, 1,
-1.189378, -0.3750754, -3.405497, 1, 0.7215686, 0, 1,
-1.189338, -1.442843, -2.327598, 1, 0.7254902, 0, 1,
-1.174543, -2.040954, -2.317064, 1, 0.7333333, 0, 1,
-1.169227, -2.665627, -1.262494, 1, 0.7372549, 0, 1,
-1.168792, 1.979035, -0.8593472, 1, 0.7450981, 0, 1,
-1.167044, 1.32958, -1.674352, 1, 0.7490196, 0, 1,
-1.166417, -1.060187, -1.446883, 1, 0.7568628, 0, 1,
-1.160757, -0.5593958, -2.795678, 1, 0.7607843, 0, 1,
-1.15653, -1.508998, -2.256594, 1, 0.7686275, 0, 1,
-1.142294, -0.08832049, -1.361686, 1, 0.772549, 0, 1,
-1.132686, -1.383095, -3.958072, 1, 0.7803922, 0, 1,
-1.131059, 0.4747396, 0.1550761, 1, 0.7843137, 0, 1,
-1.117583, -0.2055982, -0.8180351, 1, 0.7921569, 0, 1,
-1.110531, 1.28837, -0.794394, 1, 0.7960784, 0, 1,
-1.107348, 1.273676, 0.07346723, 1, 0.8039216, 0, 1,
-1.106699, -0.4950807, -1.258211, 1, 0.8117647, 0, 1,
-1.095912, -1.550834, -2.420913, 1, 0.8156863, 0, 1,
-1.093923, -2.100767, -3.906882, 1, 0.8235294, 0, 1,
-1.085825, 1.037026, -0.8964257, 1, 0.827451, 0, 1,
-1.077996, -0.5954457, -1.964747, 1, 0.8352941, 0, 1,
-1.074922, 0.3615857, -1.912006, 1, 0.8392157, 0, 1,
-1.065128, -1.800296, -1.728617, 1, 0.8470588, 0, 1,
-1.053389, -0.1866698, -2.834289, 1, 0.8509804, 0, 1,
-1.045684, 0.3376921, -1.765898, 1, 0.8588235, 0, 1,
-1.045038, -1.242586, -3.746716, 1, 0.8627451, 0, 1,
-1.043748, -0.6552856, -3.146196, 1, 0.8705882, 0, 1,
-1.040488, -0.9051513, -2.932632, 1, 0.8745098, 0, 1,
-1.029603, -1.19468, -2.952505, 1, 0.8823529, 0, 1,
-1.028503, 0.5757906, -2.849317, 1, 0.8862745, 0, 1,
-1.026482, 1.294177, -0.9227117, 1, 0.8941177, 0, 1,
-1.026168, 1.33159, 1.268343, 1, 0.8980392, 0, 1,
-1.021595, -0.1083635, -2.301494, 1, 0.9058824, 0, 1,
-1.017975, 1.178006, -1.665165, 1, 0.9137255, 0, 1,
-1.013435, -0.3003697, -3.73547, 1, 0.9176471, 0, 1,
-1.011505, 1.319139, -1.345481, 1, 0.9254902, 0, 1,
-1.011154, -0.09053463, -2.245955, 1, 0.9294118, 0, 1,
-0.9959155, 0.9690741, 0.4818203, 1, 0.9372549, 0, 1,
-0.9957477, -0.0776078, -3.59651, 1, 0.9411765, 0, 1,
-0.9955614, -1.845727, -3.360443, 1, 0.9490196, 0, 1,
-0.9949259, -1.264329, -3.448176, 1, 0.9529412, 0, 1,
-0.9948257, 1.254488, -1.098121, 1, 0.9607843, 0, 1,
-0.985864, 0.6195351, -1.658914, 1, 0.9647059, 0, 1,
-0.9837542, 0.2060215, -2.031729, 1, 0.972549, 0, 1,
-0.9832104, 0.3867514, 0.4234621, 1, 0.9764706, 0, 1,
-0.9752528, -0.9157627, -1.455716, 1, 0.9843137, 0, 1,
-0.973766, 0.4380334, -0.6732821, 1, 0.9882353, 0, 1,
-0.9664289, -1.546647, -2.719751, 1, 0.9960784, 0, 1,
-0.9656894, 0.6520135, -1.479773, 0.9960784, 1, 0, 1,
-0.9625833, -0.08811038, -2.471267, 0.9921569, 1, 0, 1,
-0.9600772, 1.011694, -1.627873, 0.9843137, 1, 0, 1,
-0.9567474, 0.5772177, -3.1964, 0.9803922, 1, 0, 1,
-0.9563438, -0.2541131, -2.303452, 0.972549, 1, 0, 1,
-0.9480665, -0.5944098, -1.495304, 0.9686275, 1, 0, 1,
-0.9477864, 0.2351712, -1.765818, 0.9607843, 1, 0, 1,
-0.9423227, -1.177375, -1.486612, 0.9568627, 1, 0, 1,
-0.9419178, -0.164236, -2.928037, 0.9490196, 1, 0, 1,
-0.9408513, -0.5541841, -2.815925, 0.945098, 1, 0, 1,
-0.9361841, -0.6858336, -4.259743, 0.9372549, 1, 0, 1,
-0.9360126, 0.01447166, -1.470509, 0.9333333, 1, 0, 1,
-0.9320707, 1.452824, 0.2868407, 0.9254902, 1, 0, 1,
-0.9286376, -0.2693081, -0.6091732, 0.9215686, 1, 0, 1,
-0.9282918, 1.164211, 0.3069157, 0.9137255, 1, 0, 1,
-0.9200882, -0.9366966, -3.202376, 0.9098039, 1, 0, 1,
-0.9170214, -0.7200159, -1.767208, 0.9019608, 1, 0, 1,
-0.9160584, 0.9421834, 0.1385121, 0.8941177, 1, 0, 1,
-0.9127794, 1.045904, 0.01402098, 0.8901961, 1, 0, 1,
-0.9122875, -0.973861, -2.685848, 0.8823529, 1, 0, 1,
-0.908012, 0.5139928, -0.417205, 0.8784314, 1, 0, 1,
-0.9067466, 0.08166631, 0.6444585, 0.8705882, 1, 0, 1,
-0.9065174, 1.55324, 0.4722174, 0.8666667, 1, 0, 1,
-0.8945288, -0.1656502, -1.402865, 0.8588235, 1, 0, 1,
-0.8903329, -0.6536027, -3.256121, 0.854902, 1, 0, 1,
-0.8807163, -0.7193864, -1.587622, 0.8470588, 1, 0, 1,
-0.8803781, 0.7689782, -1.479944, 0.8431373, 1, 0, 1,
-0.8782022, 0.3363152, -2.47428, 0.8352941, 1, 0, 1,
-0.8762265, -0.9580753, -1.770782, 0.8313726, 1, 0, 1,
-0.8749011, -0.636165, -0.710366, 0.8235294, 1, 0, 1,
-0.8701255, -0.4095136, -1.022264, 0.8196079, 1, 0, 1,
-0.8666234, -0.5350925, -2.171353, 0.8117647, 1, 0, 1,
-0.8658713, 1.333, -1.764438, 0.8078431, 1, 0, 1,
-0.8633998, -0.7370104, -1.297592, 0.8, 1, 0, 1,
-0.8622229, 1.07919, -0.314466, 0.7921569, 1, 0, 1,
-0.8608152, 0.4517473, -0.7902539, 0.7882353, 1, 0, 1,
-0.8605756, 1.94304, 0.9269648, 0.7803922, 1, 0, 1,
-0.8490388, 1.220062, -0.4877977, 0.7764706, 1, 0, 1,
-0.8454812, 1.132689, -1.901309, 0.7686275, 1, 0, 1,
-0.8447183, -1.268644, -1.908736, 0.7647059, 1, 0, 1,
-0.8443306, -0.3809356, -2.944645, 0.7568628, 1, 0, 1,
-0.8441384, 0.8500383, -1.665279, 0.7529412, 1, 0, 1,
-0.8413361, 0.1768683, -2.762321, 0.7450981, 1, 0, 1,
-0.8410625, 2.18879, -1.148759, 0.7411765, 1, 0, 1,
-0.8382758, 0.1168347, -0.7136831, 0.7333333, 1, 0, 1,
-0.8373277, 1.239642, -0.4382701, 0.7294118, 1, 0, 1,
-0.8290532, 0.8180144, -1.232785, 0.7215686, 1, 0, 1,
-0.8261867, -0.6842808, -1.709724, 0.7176471, 1, 0, 1,
-0.8258487, -0.5430182, -0.9255688, 0.7098039, 1, 0, 1,
-0.8216494, 0.1268856, -1.452335, 0.7058824, 1, 0, 1,
-0.8165789, 1.41336, -0.5446126, 0.6980392, 1, 0, 1,
-0.8143364, -1.10281, -2.641711, 0.6901961, 1, 0, 1,
-0.8139303, 1.296592, -1.080456, 0.6862745, 1, 0, 1,
-0.8100482, 0.6783526, -1.807953, 0.6784314, 1, 0, 1,
-0.8017199, -0.1025086, 0.849268, 0.6745098, 1, 0, 1,
-0.8010908, 0.7820842, -1.928966, 0.6666667, 1, 0, 1,
-0.7992835, 0.7016844, -2.006468, 0.6627451, 1, 0, 1,
-0.7911829, -0.5264184, -2.329936, 0.654902, 1, 0, 1,
-0.7865723, -0.2142594, -1.260472, 0.6509804, 1, 0, 1,
-0.7787685, 1.159459, 0.3006289, 0.6431373, 1, 0, 1,
-0.7775197, -0.5902871, -2.448024, 0.6392157, 1, 0, 1,
-0.7706438, 1.307149, 0.78236, 0.6313726, 1, 0, 1,
-0.765954, -1.266696, -3.221614, 0.627451, 1, 0, 1,
-0.761291, 0.3499728, -0.7428262, 0.6196079, 1, 0, 1,
-0.7603799, -1.638752, -3.133262, 0.6156863, 1, 0, 1,
-0.7598854, -1.492663, -1.707528, 0.6078432, 1, 0, 1,
-0.7552219, 0.4894493, -2.4678, 0.6039216, 1, 0, 1,
-0.7407191, 0.871779, 1.180264, 0.5960785, 1, 0, 1,
-0.7356261, -1.091325, -4.201745, 0.5882353, 1, 0, 1,
-0.7336348, 0.09475145, -1.024585, 0.5843138, 1, 0, 1,
-0.7305817, 2.295274, 0.05419189, 0.5764706, 1, 0, 1,
-0.7283906, -0.2627355, -3.051773, 0.572549, 1, 0, 1,
-0.7158226, 0.4897218, -1.11271, 0.5647059, 1, 0, 1,
-0.7074878, 0.1062627, -2.857715, 0.5607843, 1, 0, 1,
-0.7006, -0.04308851, -3.076128, 0.5529412, 1, 0, 1,
-0.6985673, 0.1620347, -0.6165621, 0.5490196, 1, 0, 1,
-0.6963666, -0.4272831, -2.529672, 0.5411765, 1, 0, 1,
-0.6882048, 0.5206654, -0.7596149, 0.5372549, 1, 0, 1,
-0.6859146, 1.555825, -2.272242, 0.5294118, 1, 0, 1,
-0.6846422, -0.1674491, -2.000296, 0.5254902, 1, 0, 1,
-0.6845753, 0.8353547, -1.273924, 0.5176471, 1, 0, 1,
-0.6836669, -1.157664, -2.055347, 0.5137255, 1, 0, 1,
-0.6751747, -0.3714318, -2.025375, 0.5058824, 1, 0, 1,
-0.6739703, -0.2063644, -0.8388605, 0.5019608, 1, 0, 1,
-0.6720488, 1.236152, 0.4925944, 0.4941176, 1, 0, 1,
-0.6715753, 0.2721945, -0.7106887, 0.4862745, 1, 0, 1,
-0.668248, -0.1068809, -0.2719715, 0.4823529, 1, 0, 1,
-0.6646758, 0.4863488, -1.283959, 0.4745098, 1, 0, 1,
-0.6630696, 0.6568375, -0.2610207, 0.4705882, 1, 0, 1,
-0.6571159, 0.3461119, -3.504036, 0.4627451, 1, 0, 1,
-0.6569948, 0.410301, -0.1938277, 0.4588235, 1, 0, 1,
-0.6558843, -0.5746925, -3.034533, 0.4509804, 1, 0, 1,
-0.654476, 0.03184871, -2.93988, 0.4470588, 1, 0, 1,
-0.649292, -1.206391, -1.623984, 0.4392157, 1, 0, 1,
-0.6480859, -0.6961545, -1.463732, 0.4352941, 1, 0, 1,
-0.6473847, -0.8485741, -1.454862, 0.427451, 1, 0, 1,
-0.6391995, -0.2174641, -1.834754, 0.4235294, 1, 0, 1,
-0.6373017, 0.4470882, -1.186402, 0.4156863, 1, 0, 1,
-0.6337074, -1.550936, -3.481258, 0.4117647, 1, 0, 1,
-0.6297567, -0.6318628, -2.330521, 0.4039216, 1, 0, 1,
-0.6254327, -0.2413085, -0.7608382, 0.3960784, 1, 0, 1,
-0.6216521, 0.9097984, -0.160237, 0.3921569, 1, 0, 1,
-0.6145222, 0.279368, -0.6926438, 0.3843137, 1, 0, 1,
-0.611522, 1.410497, -0.688033, 0.3803922, 1, 0, 1,
-0.6099522, -0.4276271, -2.993599, 0.372549, 1, 0, 1,
-0.5964748, -0.5048288, -1.427382, 0.3686275, 1, 0, 1,
-0.5904436, -1.401447, -2.026035, 0.3607843, 1, 0, 1,
-0.5832301, -0.4796228, -1.893498, 0.3568628, 1, 0, 1,
-0.573475, -0.7198968, -3.438507, 0.3490196, 1, 0, 1,
-0.5712953, -0.6115928, -2.187754, 0.345098, 1, 0, 1,
-0.5711015, -1.587632, -1.910012, 0.3372549, 1, 0, 1,
-0.5689623, 0.7362187, 0.7779435, 0.3333333, 1, 0, 1,
-0.5676476, 0.1430785, -0.9705952, 0.3254902, 1, 0, 1,
-0.5655786, 0.82346, -2.327115, 0.3215686, 1, 0, 1,
-0.5654779, 0.2264311, -0.8706703, 0.3137255, 1, 0, 1,
-0.561017, -0.2929479, -1.10722, 0.3098039, 1, 0, 1,
-0.5596389, 1.305379, -2.107215, 0.3019608, 1, 0, 1,
-0.5591789, -1.100254, -2.672509, 0.2941177, 1, 0, 1,
-0.5582945, 0.575976, -1.049476, 0.2901961, 1, 0, 1,
-0.5544536, 0.2483765, -2.044043, 0.282353, 1, 0, 1,
-0.5536785, 0.7212586, -1.817332, 0.2784314, 1, 0, 1,
-0.5505251, -0.3872546, -2.122327, 0.2705882, 1, 0, 1,
-0.5504736, -0.4754541, -2.240103, 0.2666667, 1, 0, 1,
-0.5490396, -1.762802, -2.021417, 0.2588235, 1, 0, 1,
-0.5490208, -0.4582132, -1.972065, 0.254902, 1, 0, 1,
-0.5472366, 0.4368093, -0.5787483, 0.2470588, 1, 0, 1,
-0.5446036, 0.3944692, -1.952903, 0.2431373, 1, 0, 1,
-0.5419712, -0.1506143, -0.5877298, 0.2352941, 1, 0, 1,
-0.5406798, -0.2822521, -2.684219, 0.2313726, 1, 0, 1,
-0.5377631, -0.5395813, -1.994553, 0.2235294, 1, 0, 1,
-0.5377099, 1.86965, -1.380663, 0.2196078, 1, 0, 1,
-0.5342452, -0.8711594, -2.698132, 0.2117647, 1, 0, 1,
-0.5340205, 0.04898325, -0.9093959, 0.2078431, 1, 0, 1,
-0.5339332, 0.7426888, 0.06794129, 0.2, 1, 0, 1,
-0.5302041, 0.5627835, -0.0003275059, 0.1921569, 1, 0, 1,
-0.5246599, -0.3093632, -1.328374, 0.1882353, 1, 0, 1,
-0.5176074, 0.936639, -0.3121502, 0.1803922, 1, 0, 1,
-0.5168898, 2.908411, 0.4643092, 0.1764706, 1, 0, 1,
-0.5140181, -0.8231684, -2.239245, 0.1686275, 1, 0, 1,
-0.5129772, -0.3703639, -1.293734, 0.1647059, 1, 0, 1,
-0.5106646, 2.067206, -1.059605, 0.1568628, 1, 0, 1,
-0.5098159, 1.420517, -0.3806572, 0.1529412, 1, 0, 1,
-0.5089014, -0.5817713, -2.877566, 0.145098, 1, 0, 1,
-0.5067838, 0.03491782, -1.543792, 0.1411765, 1, 0, 1,
-0.5059416, -1.241274, -3.04464, 0.1333333, 1, 0, 1,
-0.5050922, 2.772322, -1.991477, 0.1294118, 1, 0, 1,
-0.503852, -0.6360053, -2.868793, 0.1215686, 1, 0, 1,
-0.503296, 1.045512, 1.222157, 0.1176471, 1, 0, 1,
-0.5005986, 1.140501, 1.026085, 0.1098039, 1, 0, 1,
-0.4937232, 0.2079418, -1.151157, 0.1058824, 1, 0, 1,
-0.4913907, 0.6144313, -1.719562, 0.09803922, 1, 0, 1,
-0.4886179, -1.052734, -2.852972, 0.09019608, 1, 0, 1,
-0.4868191, 0.4605322, -1.591807, 0.08627451, 1, 0, 1,
-0.4861044, 0.3658977, -0.7995952, 0.07843138, 1, 0, 1,
-0.483981, 0.3636096, -0.5942254, 0.07450981, 1, 0, 1,
-0.480444, 0.3688997, -0.7860289, 0.06666667, 1, 0, 1,
-0.4796459, -2.589241, -3.164541, 0.0627451, 1, 0, 1,
-0.4751915, -0.2150637, -2.337659, 0.05490196, 1, 0, 1,
-0.4732863, -0.5543534, -3.714569, 0.05098039, 1, 0, 1,
-0.4691791, 0.4815623, -2.324055, 0.04313726, 1, 0, 1,
-0.4671347, -0.3596349, -0.9861743, 0.03921569, 1, 0, 1,
-0.4660885, 0.2545357, -0.4314257, 0.03137255, 1, 0, 1,
-0.4659932, -0.5330258, -3.478638, 0.02745098, 1, 0, 1,
-0.4654379, 0.3922774, 0.7067014, 0.01960784, 1, 0, 1,
-0.4604604, 0.9861479, 1.228232, 0.01568628, 1, 0, 1,
-0.4602012, 0.8853371, 0.05320285, 0.007843138, 1, 0, 1,
-0.4585201, 0.0139299, -2.398325, 0.003921569, 1, 0, 1,
-0.4578902, 0.398296, -0.1861617, 0, 1, 0.003921569, 1,
-0.4541123, 0.6556855, -1.135236, 0, 1, 0.01176471, 1,
-0.4526733, 0.3865328, -0.9094265, 0, 1, 0.01568628, 1,
-0.4410644, -0.5199289, -2.270628, 0, 1, 0.02352941, 1,
-0.4289385, -0.0009557873, -1.924751, 0, 1, 0.02745098, 1,
-0.4245432, 0.4769908, -2.4053, 0, 1, 0.03529412, 1,
-0.4138265, 0.4247886, -2.273061, 0, 1, 0.03921569, 1,
-0.4071901, -0.5352523, -1.971875, 0, 1, 0.04705882, 1,
-0.4000941, -0.9742606, -3.814653, 0, 1, 0.05098039, 1,
-0.3987989, -1.17784, -2.75853, 0, 1, 0.05882353, 1,
-0.3973339, 0.9083165, -1.065665, 0, 1, 0.0627451, 1,
-0.3959507, 0.5913, -0.215805, 0, 1, 0.07058824, 1,
-0.3883384, -0.3698849, -1.303752, 0, 1, 0.07450981, 1,
-0.3875143, -0.03824336, -2.634904, 0, 1, 0.08235294, 1,
-0.3868495, 0.5498553, 1.332324, 0, 1, 0.08627451, 1,
-0.3803189, 1.531341, 0.4969947, 0, 1, 0.09411765, 1,
-0.3756443, -0.0294966, -0.9658957, 0, 1, 0.1019608, 1,
-0.3746466, -0.9547868, -3.499204, 0, 1, 0.1058824, 1,
-0.3735982, 0.5150191, -0.7560561, 0, 1, 0.1137255, 1,
-0.3628475, -0.2845046, -1.746755, 0, 1, 0.1176471, 1,
-0.3564084, 0.8474444, -0.8686828, 0, 1, 0.1254902, 1,
-0.3558705, 0.8306817, -0.8051151, 0, 1, 0.1294118, 1,
-0.3552593, 0.346559, -1.172888, 0, 1, 0.1372549, 1,
-0.3549699, 0.833998, -0.7757308, 0, 1, 0.1411765, 1,
-0.3544995, 0.1942232, -0.1873213, 0, 1, 0.1490196, 1,
-0.3472599, 1.121771, -1.710401, 0, 1, 0.1529412, 1,
-0.3460294, -0.09567436, 0.009991514, 0, 1, 0.1607843, 1,
-0.3422976, -2.417676, -3.135021, 0, 1, 0.1647059, 1,
-0.3392996, -0.2556564, -3.908032, 0, 1, 0.172549, 1,
-0.3382117, -0.5534322, -3.54, 0, 1, 0.1764706, 1,
-0.3377442, -0.7567654, -1.315471, 0, 1, 0.1843137, 1,
-0.3226377, -0.4705623, -2.776986, 0, 1, 0.1882353, 1,
-0.3224251, -1.936305, -1.51999, 0, 1, 0.1960784, 1,
-0.3217386, 2.253755, -0.4552515, 0, 1, 0.2039216, 1,
-0.320988, -0.6943914, -3.493383, 0, 1, 0.2078431, 1,
-0.3169082, 3.188269, -0.6104854, 0, 1, 0.2156863, 1,
-0.3160931, 2.32591, -1.119526, 0, 1, 0.2196078, 1,
-0.3106118, 1.524229, -0.4547675, 0, 1, 0.227451, 1,
-0.3086652, -2.24205, -3.68387, 0, 1, 0.2313726, 1,
-0.3084747, 1.667945, -0.5768203, 0, 1, 0.2392157, 1,
-0.3062179, -0.4221005, -2.248459, 0, 1, 0.2431373, 1,
-0.3059965, 0.5324756, 0.1414822, 0, 1, 0.2509804, 1,
-0.3052474, 0.9111936, -0.97867, 0, 1, 0.254902, 1,
-0.3021241, 0.5670596, -1.364372, 0, 1, 0.2627451, 1,
-0.2981768, -0.1062743, 0.03279109, 0, 1, 0.2666667, 1,
-0.2951791, 0.4744062, -0.7484944, 0, 1, 0.2745098, 1,
-0.2925134, -0.4005956, -1.669791, 0, 1, 0.2784314, 1,
-0.2923736, 1.155224, -0.8111252, 0, 1, 0.2862745, 1,
-0.2882978, 0.1948466, 0.7555698, 0, 1, 0.2901961, 1,
-0.2881847, 1.137587, 1.696534, 0, 1, 0.2980392, 1,
-0.2880273, 0.7121916, 0.7450496, 0, 1, 0.3058824, 1,
-0.2878103, -2.322518, -3.260008, 0, 1, 0.3098039, 1,
-0.2872467, -0.9813671, -2.735293, 0, 1, 0.3176471, 1,
-0.284546, -0.4783924, -3.041302, 0, 1, 0.3215686, 1,
-0.2798325, -1.242796, -5.171747, 0, 1, 0.3294118, 1,
-0.2756249, 1.200974, -0.3877078, 0, 1, 0.3333333, 1,
-0.2736155, -0.3970716, -4.190354, 0, 1, 0.3411765, 1,
-0.2713317, 1.442533, -0.02165151, 0, 1, 0.345098, 1,
-0.2703072, 1.310042, 0.462469, 0, 1, 0.3529412, 1,
-0.2702069, -0.8489406, -3.738053, 0, 1, 0.3568628, 1,
-0.2674652, -0.1191018, -2.551236, 0, 1, 0.3647059, 1,
-0.2654956, -2.009849, -4.950493, 0, 1, 0.3686275, 1,
-0.2602018, -0.4152602, -3.753352, 0, 1, 0.3764706, 1,
-0.260174, -0.5238287, -3.008144, 0, 1, 0.3803922, 1,
-0.2595223, 0.1393251, -1.613462, 0, 1, 0.3882353, 1,
-0.2553625, -1.080745, -4.009807, 0, 1, 0.3921569, 1,
-0.2542128, 0.3257097, -2.10032, 0, 1, 0.4, 1,
-0.2527816, 1.331083, -0.05778667, 0, 1, 0.4078431, 1,
-0.2493904, -0.04945323, -0.8689098, 0, 1, 0.4117647, 1,
-0.2493675, 1.280793, 0.8481541, 0, 1, 0.4196078, 1,
-0.2490017, 0.8746763, -0.8532748, 0, 1, 0.4235294, 1,
-0.2435288, -0.3019237, -1.253289, 0, 1, 0.4313726, 1,
-0.2324171, 0.4955265, -1.708538, 0, 1, 0.4352941, 1,
-0.2298994, 1.233885, -0.5524325, 0, 1, 0.4431373, 1,
-0.227035, 0.4656182, -0.2525522, 0, 1, 0.4470588, 1,
-0.2240829, -0.7358493, -1.417967, 0, 1, 0.454902, 1,
-0.2214018, 0.7271968, -0.6472538, 0, 1, 0.4588235, 1,
-0.2198733, -1.7985, -4.107976, 0, 1, 0.4666667, 1,
-0.2190525, -0.202289, -1.981484, 0, 1, 0.4705882, 1,
-0.2162471, -0.2775256, -2.760371, 0, 1, 0.4784314, 1,
-0.2159423, 0.04394979, -2.260246, 0, 1, 0.4823529, 1,
-0.2131909, -0.4466437, -1.225085, 0, 1, 0.4901961, 1,
-0.210224, -0.4486519, -4.499753, 0, 1, 0.4941176, 1,
-0.2072851, 1.274791, 2.065777, 0, 1, 0.5019608, 1,
-0.2071582, 2.115054, -0.7295238, 0, 1, 0.509804, 1,
-0.2066539, 0.587413, -0.4907317, 0, 1, 0.5137255, 1,
-0.2035982, -0.5902, -3.675538, 0, 1, 0.5215687, 1,
-0.2026031, -0.5886006, -3.987691, 0, 1, 0.5254902, 1,
-0.2008277, 1.360993, -1.669607, 0, 1, 0.5333334, 1,
-0.1986918, 1.371419, 0.8115206, 0, 1, 0.5372549, 1,
-0.195175, 1.271777, 0.8435279, 0, 1, 0.5450981, 1,
-0.1927061, 1.035834, 0.2080687, 0, 1, 0.5490196, 1,
-0.1919544, -0.7221099, -3.113347, 0, 1, 0.5568628, 1,
-0.1906959, 1.605429, -0.7378968, 0, 1, 0.5607843, 1,
-0.1857939, -0.6517502, -2.973307, 0, 1, 0.5686275, 1,
-0.1797151, -0.1461479, -3.179383, 0, 1, 0.572549, 1,
-0.1787416, -0.5621058, -1.90188, 0, 1, 0.5803922, 1,
-0.178593, 0.4458723, -0.2409023, 0, 1, 0.5843138, 1,
-0.1782134, -0.1367858, -2.407985, 0, 1, 0.5921569, 1,
-0.1717407, 1.4145, -0.6306368, 0, 1, 0.5960785, 1,
-0.1635387, 0.05778932, -1.191952, 0, 1, 0.6039216, 1,
-0.1625348, -1.792586, -4.528419, 0, 1, 0.6117647, 1,
-0.156795, -0.176886, -2.099676, 0, 1, 0.6156863, 1,
-0.1543274, -0.3533882, -3.840315, 0, 1, 0.6235294, 1,
-0.1538189, 1.020536, 1.509107, 0, 1, 0.627451, 1,
-0.1516648, -0.01636769, -0.8728279, 0, 1, 0.6352941, 1,
-0.1500568, 0.5481785, -0.8577681, 0, 1, 0.6392157, 1,
-0.1495583, 0.06228245, -0.2598576, 0, 1, 0.6470588, 1,
-0.1485612, -0.5717773, -3.295138, 0, 1, 0.6509804, 1,
-0.1472142, -0.5932699, -2.105113, 0, 1, 0.6588235, 1,
-0.147128, -1.239016, -2.795802, 0, 1, 0.6627451, 1,
-0.1439084, 0.3036366, 0.6096355, 0, 1, 0.6705883, 1,
-0.1436923, 0.8659491, -1.141778, 0, 1, 0.6745098, 1,
-0.1363843, -0.6451279, -2.879292, 0, 1, 0.682353, 1,
-0.1360459, 0.05444916, -1.41772, 0, 1, 0.6862745, 1,
-0.1347706, -0.9227993, -1.952609, 0, 1, 0.6941177, 1,
-0.1331768, -0.2066433, -1.430428, 0, 1, 0.7019608, 1,
-0.1328271, -1.089635, -1.475709, 0, 1, 0.7058824, 1,
-0.1318945, 0.0109873, -1.764225, 0, 1, 0.7137255, 1,
-0.1288721, -0.7044834, -3.309477, 0, 1, 0.7176471, 1,
-0.1264662, 0.517774, 0.336564, 0, 1, 0.7254902, 1,
-0.1257135, -0.5048021, -1.811701, 0, 1, 0.7294118, 1,
-0.1244014, 0.1224546, -1.505839, 0, 1, 0.7372549, 1,
-0.1223833, 1.790787, -0.618921, 0, 1, 0.7411765, 1,
-0.1176024, 0.30243, 0.4081976, 0, 1, 0.7490196, 1,
-0.1158665, -1.517265, -4.170758, 0, 1, 0.7529412, 1,
-0.1128359, 0.1009463, -1.312555, 0, 1, 0.7607843, 1,
-0.1122083, -0.5532913, -3.32332, 0, 1, 0.7647059, 1,
-0.1048548, -0.289675, -2.765997, 0, 1, 0.772549, 1,
-0.1042959, -0.1357171, -3.1545, 0, 1, 0.7764706, 1,
-0.1042445, -1.699706, -2.542267, 0, 1, 0.7843137, 1,
-0.1033929, 1.071599, 0.8681328, 0, 1, 0.7882353, 1,
-0.1032162, -1.176233, -3.697524, 0, 1, 0.7960784, 1,
-0.102704, 0.4855612, -0.3537138, 0, 1, 0.8039216, 1,
-0.09894355, 1.373958, 1.511943, 0, 1, 0.8078431, 1,
-0.09623507, 0.05009311, -1.382728, 0, 1, 0.8156863, 1,
-0.09622324, 1.038791, -0.08840096, 0, 1, 0.8196079, 1,
-0.09536411, -2.200165, -2.515488, 0, 1, 0.827451, 1,
-0.09488054, -0.1406679, -2.69976, 0, 1, 0.8313726, 1,
-0.094503, 0.1174266, -1.201939, 0, 1, 0.8392157, 1,
-0.09033491, 0.1147023, -0.5644132, 0, 1, 0.8431373, 1,
-0.08739679, -0.2369109, -1.999234, 0, 1, 0.8509804, 1,
-0.08716514, -2.850914, -2.16872, 0, 1, 0.854902, 1,
-0.08437645, -0.9202523, -3.927608, 0, 1, 0.8627451, 1,
-0.08035054, -1.14713, -1.748062, 0, 1, 0.8666667, 1,
-0.079327, -0.2802861, -3.827117, 0, 1, 0.8745098, 1,
-0.07880977, -0.09957818, -2.344705, 0, 1, 0.8784314, 1,
-0.07863032, 2.223311, 0.2996297, 0, 1, 0.8862745, 1,
-0.07782981, -0.7042047, -2.888593, 0, 1, 0.8901961, 1,
-0.07756251, -0.008655461, -0.07856853, 0, 1, 0.8980392, 1,
-0.07603846, -1.269986, -3.256763, 0, 1, 0.9058824, 1,
-0.07325824, 0.01637702, -2.069965, 0, 1, 0.9098039, 1,
-0.0731549, -0.4817945, -2.111913, 0, 1, 0.9176471, 1,
-0.06939713, 0.8531347, -0.7309737, 0, 1, 0.9215686, 1,
-0.05950454, -0.5964938, -4.43967, 0, 1, 0.9294118, 1,
-0.05907913, -0.2367045, -4.420916, 0, 1, 0.9333333, 1,
-0.05885772, -0.5090904, -2.419423, 0, 1, 0.9411765, 1,
-0.05735588, 0.7151811, 0.7933708, 0, 1, 0.945098, 1,
-0.05581122, -2.362223, -4.583105, 0, 1, 0.9529412, 1,
-0.05538131, -0.7996382, -2.248367, 0, 1, 0.9568627, 1,
-0.04979569, -0.117323, -1.897833, 0, 1, 0.9647059, 1,
-0.04914019, 0.7656624, -1.146428, 0, 1, 0.9686275, 1,
-0.04913383, -0.5485558, -2.157445, 0, 1, 0.9764706, 1,
-0.04884947, -0.07684639, -2.82166, 0, 1, 0.9803922, 1,
-0.04795079, -0.370988, -2.037159, 0, 1, 0.9882353, 1,
-0.03563069, 0.6650083, 1.739299, 0, 1, 0.9921569, 1,
-0.03409472, 0.2768974, -0.291086, 0, 1, 1, 1,
-0.03093, 1.572454, -0.3752185, 0, 0.9921569, 1, 1,
-0.0305112, -0.04329184, -2.068164, 0, 0.9882353, 1, 1,
-0.03024681, -0.9317318, -3.536635, 0, 0.9803922, 1, 1,
-0.03013501, 0.3460245, -1.391815, 0, 0.9764706, 1, 1,
-0.02331246, 0.6702335, 1.219453, 0, 0.9686275, 1, 1,
-0.02224361, -0.5971514, -2.168243, 0, 0.9647059, 1, 1,
-0.02137171, -2.19863, -3.272405, 0, 0.9568627, 1, 1,
-0.02106359, -0.2931825, -4.082865, 0, 0.9529412, 1, 1,
-0.0195942, 0.001274859, -1.474575, 0, 0.945098, 1, 1,
-0.01921846, 0.9359421, 1.38309, 0, 0.9411765, 1, 1,
-0.01531063, -0.4670426, -2.379091, 0, 0.9333333, 1, 1,
-0.0128058, 0.8395209, 1.892347, 0, 0.9294118, 1, 1,
-0.010876, -0.0125506, -1.766551, 0, 0.9215686, 1, 1,
-0.01023988, 0.3707761, 0.4675018, 0, 0.9176471, 1, 1,
-0.01022047, -0.8302655, -6.490305, 0, 0.9098039, 1, 1,
-0.009024347, -1.106434, -4.079336, 0, 0.9058824, 1, 1,
-0.008320592, -0.2291471, -2.612838, 0, 0.8980392, 1, 1,
-0.005341453, -0.8069194, -4.346197, 0, 0.8901961, 1, 1,
0.002589243, -0.05271888, 3.966893, 0, 0.8862745, 1, 1,
0.00863465, 1.417177, 2.605913, 0, 0.8784314, 1, 1,
0.009566168, 0.7472399, -1.360669, 0, 0.8745098, 1, 1,
0.01573852, -1.238729, 2.77897, 0, 0.8666667, 1, 1,
0.01634533, 0.8377989, 0.7367067, 0, 0.8627451, 1, 1,
0.01754021, 0.3541442, -0.02611901, 0, 0.854902, 1, 1,
0.0197247, -1.009427, 1.560427, 0, 0.8509804, 1, 1,
0.02905672, -0.4934449, 3.485182, 0, 0.8431373, 1, 1,
0.02963531, -0.02795785, 1.218289, 0, 0.8392157, 1, 1,
0.03172803, -0.6115987, 3.132024, 0, 0.8313726, 1, 1,
0.03280479, 0.5737578, -0.1885477, 0, 0.827451, 1, 1,
0.03439512, 0.6402802, -0.2964986, 0, 0.8196079, 1, 1,
0.04272056, -0.6221052, 2.569327, 0, 0.8156863, 1, 1,
0.04583501, 0.8597716, -0.808976, 0, 0.8078431, 1, 1,
0.04697967, -0.7705752, 2.887834, 0, 0.8039216, 1, 1,
0.05022104, 0.749657, 1.409378, 0, 0.7960784, 1, 1,
0.05096372, -0.5227425, 2.025992, 0, 0.7882353, 1, 1,
0.05376488, 0.2099764, 1.326027, 0, 0.7843137, 1, 1,
0.05543257, 0.386873, 0.1298378, 0, 0.7764706, 1, 1,
0.05557568, -1.800747, 2.883006, 0, 0.772549, 1, 1,
0.05815315, 1.974943, -0.7207298, 0, 0.7647059, 1, 1,
0.0601714, -0.9300141, 4.033329, 0, 0.7607843, 1, 1,
0.06063596, -0.1845301, 2.800533, 0, 0.7529412, 1, 1,
0.06678588, 0.9634114, 0.4420278, 0, 0.7490196, 1, 1,
0.06748784, -0.1912967, 1.884598, 0, 0.7411765, 1, 1,
0.06759093, 0.1142507, 0.7294851, 0, 0.7372549, 1, 1,
0.07307883, -0.3413613, 2.920611, 0, 0.7294118, 1, 1,
0.07382262, -0.9076678, 2.746262, 0, 0.7254902, 1, 1,
0.07405597, 1.094021, 1.152639, 0, 0.7176471, 1, 1,
0.07421605, -0.1550012, 3.471002, 0, 0.7137255, 1, 1,
0.07710804, 0.787636, 1.622919, 0, 0.7058824, 1, 1,
0.07882401, 0.1884215, -0.03076757, 0, 0.6980392, 1, 1,
0.07979707, -0.8053969, 1.98731, 0, 0.6941177, 1, 1,
0.08125769, -1.075371, 2.119631, 0, 0.6862745, 1, 1,
0.08278381, 1.607569, 0.2026469, 0, 0.682353, 1, 1,
0.08280496, 0.706029, -0.1471305, 0, 0.6745098, 1, 1,
0.08504838, -0.5489042, 2.356951, 0, 0.6705883, 1, 1,
0.08692332, 0.1325527, 0.9846003, 0, 0.6627451, 1, 1,
0.09274294, 0.7665365, -1.126058, 0, 0.6588235, 1, 1,
0.09503306, 0.5207321, 0.2065248, 0, 0.6509804, 1, 1,
0.09633657, -0.2887033, 3.55391, 0, 0.6470588, 1, 1,
0.09714963, -1.581495, 2.684883, 0, 0.6392157, 1, 1,
0.09980081, 0.3749241, -0.792937, 0, 0.6352941, 1, 1,
0.107406, -1.10742, 2.446937, 0, 0.627451, 1, 1,
0.1145492, -0.03554146, 2.362027, 0, 0.6235294, 1, 1,
0.1159468, 1.430809, 0.2918544, 0, 0.6156863, 1, 1,
0.121475, -0.4383834, 2.734515, 0, 0.6117647, 1, 1,
0.1225959, -0.1618474, 4.055088, 0, 0.6039216, 1, 1,
0.1255962, 0.3651516, 1.208562, 0, 0.5960785, 1, 1,
0.126146, 1.470284, 0.2772074, 0, 0.5921569, 1, 1,
0.1267971, -0.132995, 2.005881, 0, 0.5843138, 1, 1,
0.1302731, -2.62834, 2.053746, 0, 0.5803922, 1, 1,
0.1313378, -0.3467284, 3.26484, 0, 0.572549, 1, 1,
0.1322163, 0.05533462, 0.6006668, 0, 0.5686275, 1, 1,
0.1329808, -2.143284, 3.746513, 0, 0.5607843, 1, 1,
0.1330121, -1.254553, 3.46628, 0, 0.5568628, 1, 1,
0.1332223, 2.202593, 1.838826, 0, 0.5490196, 1, 1,
0.1370995, -0.9943999, 2.112011, 0, 0.5450981, 1, 1,
0.1389201, 0.9160527, -0.6220814, 0, 0.5372549, 1, 1,
0.1447222, 1.470661, 0.9064849, 0, 0.5333334, 1, 1,
0.1487533, -0.08220996, 2.878889, 0, 0.5254902, 1, 1,
0.1608773, -2.438214, 3.582697, 0, 0.5215687, 1, 1,
0.1613966, 1.332909, 0.1989647, 0, 0.5137255, 1, 1,
0.1651363, -2.290719, 3.43613, 0, 0.509804, 1, 1,
0.1721139, 0.3349628, -1.045336, 0, 0.5019608, 1, 1,
0.1726985, -0.9077483, 3.103895, 0, 0.4941176, 1, 1,
0.1738656, 0.21294, -0.1233117, 0, 0.4901961, 1, 1,
0.1741798, -0.1029318, 3.145814, 0, 0.4823529, 1, 1,
0.1760828, 0.4050814, 0.09383073, 0, 0.4784314, 1, 1,
0.1776944, -2.357678, 3.014746, 0, 0.4705882, 1, 1,
0.1777942, -1.654462, 2.062559, 0, 0.4666667, 1, 1,
0.1787173, 0.03277543, 0.6562104, 0, 0.4588235, 1, 1,
0.1791943, -2.031362, 3.893527, 0, 0.454902, 1, 1,
0.1807003, -0.512384, 2.19723, 0, 0.4470588, 1, 1,
0.1809511, -0.6152487, 2.757692, 0, 0.4431373, 1, 1,
0.1840293, -0.984418, 2.951249, 0, 0.4352941, 1, 1,
0.1869669, -0.2582523, 0.930732, 0, 0.4313726, 1, 1,
0.1881683, -0.2145628, 1.867178, 0, 0.4235294, 1, 1,
0.188549, -2.440427, 3.092848, 0, 0.4196078, 1, 1,
0.193964, -0.8700528, 3.607159, 0, 0.4117647, 1, 1,
0.1959853, -0.04525629, 0.399322, 0, 0.4078431, 1, 1,
0.1993049, -0.2020731, 1.803169, 0, 0.4, 1, 1,
0.2001319, -0.6889874, 2.813193, 0, 0.3921569, 1, 1,
0.2024581, -0.2215178, 2.56891, 0, 0.3882353, 1, 1,
0.2049165, 0.5203679, -0.9102238, 0, 0.3803922, 1, 1,
0.2091368, -0.05134834, 1.199636, 0, 0.3764706, 1, 1,
0.2116736, 0.1743128, 0.2389353, 0, 0.3686275, 1, 1,
0.213984, 0.4983727, 1.128181, 0, 0.3647059, 1, 1,
0.2142813, 0.6203843, -0.07322425, 0, 0.3568628, 1, 1,
0.2204743, -1.653883, 3.557425, 0, 0.3529412, 1, 1,
0.2205415, 0.295621, -0.7554166, 0, 0.345098, 1, 1,
0.223554, 1.267361, 0.09525588, 0, 0.3411765, 1, 1,
0.2238671, -0.5466325, 3.046163, 0, 0.3333333, 1, 1,
0.2329371, -0.5479085, 2.350086, 0, 0.3294118, 1, 1,
0.2336991, 0.8917222, -0.0215108, 0, 0.3215686, 1, 1,
0.237503, 0.1148882, 1.45821, 0, 0.3176471, 1, 1,
0.2387848, 0.07368091, 1.138984, 0, 0.3098039, 1, 1,
0.2441903, -0.6006022, 0.4796429, 0, 0.3058824, 1, 1,
0.2514571, -0.5677629, 2.467048, 0, 0.2980392, 1, 1,
0.252665, 0.3644537, -1.127841, 0, 0.2901961, 1, 1,
0.2539605, 1.124227, -0.0474549, 0, 0.2862745, 1, 1,
0.2556213, -1.512557, 3.03473, 0, 0.2784314, 1, 1,
0.2619167, -0.1937579, 2.80408, 0, 0.2745098, 1, 1,
0.2619278, 0.668098, -0.341364, 0, 0.2666667, 1, 1,
0.2623063, 0.4551979, 0.7911569, 0, 0.2627451, 1, 1,
0.2624933, -0.4146478, 2.018402, 0, 0.254902, 1, 1,
0.2713384, 1.819941, 0.5199724, 0, 0.2509804, 1, 1,
0.2719395, -0.4922442, 1.860082, 0, 0.2431373, 1, 1,
0.2725376, -0.8011512, 2.559101, 0, 0.2392157, 1, 1,
0.2759012, -0.3835121, 1.847984, 0, 0.2313726, 1, 1,
0.2777264, -0.6302167, 0.8233924, 0, 0.227451, 1, 1,
0.2778313, 0.6535152, -0.1591342, 0, 0.2196078, 1, 1,
0.2799297, -3.361237, 4.292328, 0, 0.2156863, 1, 1,
0.2799842, -2.721138, 3.731519, 0, 0.2078431, 1, 1,
0.282731, 2.201531, -0.8035498, 0, 0.2039216, 1, 1,
0.2836409, 1.216136, 0.006393029, 0, 0.1960784, 1, 1,
0.2890027, 1.291626, 1.220108, 0, 0.1882353, 1, 1,
0.293931, 1.494047, 1.046007, 0, 0.1843137, 1, 1,
0.3031369, 1.149876, -0.2586084, 0, 0.1764706, 1, 1,
0.3082417, 0.6756679, 1.517626, 0, 0.172549, 1, 1,
0.3117069, -0.836166, 2.514176, 0, 0.1647059, 1, 1,
0.3117156, -1.135346, 1.630171, 0, 0.1607843, 1, 1,
0.3120574, 1.005976, 1.307445, 0, 0.1529412, 1, 1,
0.3129892, -0.7142365, 3.25044, 0, 0.1490196, 1, 1,
0.3177598, -1.625986, 2.574367, 0, 0.1411765, 1, 1,
0.3202398, 1.29329, 0.8535135, 0, 0.1372549, 1, 1,
0.3224285, 0.260178, 1.757064, 0, 0.1294118, 1, 1,
0.3272595, 2.551829, 0.5691212, 0, 0.1254902, 1, 1,
0.3283171, -0.262343, 5.880173, 0, 0.1176471, 1, 1,
0.3307202, 0.1473282, 1.579872, 0, 0.1137255, 1, 1,
0.3318572, 0.1115802, 2.000735, 0, 0.1058824, 1, 1,
0.3323068, -0.0857005, 2.068225, 0, 0.09803922, 1, 1,
0.3346131, 1.411661, -0.6429799, 0, 0.09411765, 1, 1,
0.3431093, -1.027832, 1.995401, 0, 0.08627451, 1, 1,
0.3432584, -0.4265812, 2.392809, 0, 0.08235294, 1, 1,
0.34491, -0.9533787, 2.616236, 0, 0.07450981, 1, 1,
0.348721, -0.7621858, 2.505406, 0, 0.07058824, 1, 1,
0.3574209, -0.1498534, 1.010851, 0, 0.0627451, 1, 1,
0.3587393, 1.007952, -0.5954575, 0, 0.05882353, 1, 1,
0.3598998, -1.034788, 4.225088, 0, 0.05098039, 1, 1,
0.3612184, -0.533296, 2.469708, 0, 0.04705882, 1, 1,
0.3625782, -1.65137, 4.986437, 0, 0.03921569, 1, 1,
0.3665082, 0.1018846, -0.359331, 0, 0.03529412, 1, 1,
0.3668194, 0.5147077, -1.232165, 0, 0.02745098, 1, 1,
0.3675612, -0.234755, 1.078856, 0, 0.02352941, 1, 1,
0.3683209, 0.1139012, 3.331486, 0, 0.01568628, 1, 1,
0.3695289, -0.1344942, 0.4431742, 0, 0.01176471, 1, 1,
0.3700639, -2.280476, 2.038582, 0, 0.003921569, 1, 1,
0.3794093, -1.580921, 2.250688, 0.003921569, 0, 1, 1,
0.3841222, -0.9240852, 2.240654, 0.007843138, 0, 1, 1,
0.3894249, 0.9058564, 0.08126879, 0.01568628, 0, 1, 1,
0.3908209, -0.8871962, 1.972853, 0.01960784, 0, 1, 1,
0.3911721, -0.4924465, 3.202567, 0.02745098, 0, 1, 1,
0.3928033, -2.531815, 4.930747, 0.03137255, 0, 1, 1,
0.4009769, -0.2360261, 1.753167, 0.03921569, 0, 1, 1,
0.403241, -0.9719397, 4.084999, 0.04313726, 0, 1, 1,
0.4047055, -0.7490814, 3.045329, 0.05098039, 0, 1, 1,
0.4061683, 0.1909428, 1.213012, 0.05490196, 0, 1, 1,
0.4108039, -1.398634, 1.311919, 0.0627451, 0, 1, 1,
0.4153975, 0.972435, 0.3275207, 0.06666667, 0, 1, 1,
0.4177483, 0.6561847, 0.9979515, 0.07450981, 0, 1, 1,
0.4216588, -2.037576, 2.992205, 0.07843138, 0, 1, 1,
0.428829, -0.03892893, -0.6988583, 0.08627451, 0, 1, 1,
0.4339013, -0.3055842, 4.239005, 0.09019608, 0, 1, 1,
0.4358794, 1.36477, -0.1519748, 0.09803922, 0, 1, 1,
0.4378545, 1.003655, 1.211543, 0.1058824, 0, 1, 1,
0.4410906, 0.7309927, 0.8323806, 0.1098039, 0, 1, 1,
0.4416059, -0.6590465, 3.182045, 0.1176471, 0, 1, 1,
0.4466324, -0.9785595, 2.761444, 0.1215686, 0, 1, 1,
0.4493452, -1.003901, 0.3356498, 0.1294118, 0, 1, 1,
0.4496036, -0.8812311, 1.754691, 0.1333333, 0, 1, 1,
0.4499324, -0.3441655, 0.9487569, 0.1411765, 0, 1, 1,
0.4508154, 0.09136119, 1.149364, 0.145098, 0, 1, 1,
0.4512883, -0.1331401, 2.417585, 0.1529412, 0, 1, 1,
0.4520403, 0.1648612, 1.584195, 0.1568628, 0, 1, 1,
0.4555167, -0.7033094, 3.754737, 0.1647059, 0, 1, 1,
0.4583233, -2.200914, 1.641184, 0.1686275, 0, 1, 1,
0.4598354, 0.01156948, 0.9706669, 0.1764706, 0, 1, 1,
0.4655511, -0.1688004, 1.456642, 0.1803922, 0, 1, 1,
0.4675991, -0.5880633, 3.322485, 0.1882353, 0, 1, 1,
0.4689281, -1.242335, 2.631083, 0.1921569, 0, 1, 1,
0.4697954, 0.7503892, 2.527837, 0.2, 0, 1, 1,
0.4700851, 0.8327233, 1.57318, 0.2078431, 0, 1, 1,
0.4716444, -0.6478778, 1.573858, 0.2117647, 0, 1, 1,
0.4811209, 0.6170981, 0.627663, 0.2196078, 0, 1, 1,
0.4848143, -0.2130853, 2.537583, 0.2235294, 0, 1, 1,
0.4871357, -1.590221, 2.642873, 0.2313726, 0, 1, 1,
0.4903907, 1.295055, 0.4889399, 0.2352941, 0, 1, 1,
0.4929046, 0.9102119, 0.20491, 0.2431373, 0, 1, 1,
0.4960385, -0.7127821, 3.216996, 0.2470588, 0, 1, 1,
0.496461, 1.321264, -0.4187196, 0.254902, 0, 1, 1,
0.5024115, 0.7831529, -1.230052, 0.2588235, 0, 1, 1,
0.5041512, -1.092032, 0.9238825, 0.2666667, 0, 1, 1,
0.508713, -0.4704637, 3.979997, 0.2705882, 0, 1, 1,
0.5126762, 0.3140762, 2.162112, 0.2784314, 0, 1, 1,
0.512839, -1.627168, 3.608618, 0.282353, 0, 1, 1,
0.5151285, -0.6808143, 2.840286, 0.2901961, 0, 1, 1,
0.5193733, 1.688136, -1.199572, 0.2941177, 0, 1, 1,
0.5270355, 1.157194, -1.119457, 0.3019608, 0, 1, 1,
0.5276377, -2.27635, 2.687019, 0.3098039, 0, 1, 1,
0.5280162, 1.0067, 0.6203814, 0.3137255, 0, 1, 1,
0.5362782, -0.5099143, 3.055833, 0.3215686, 0, 1, 1,
0.5373282, -0.8679376, 2.437378, 0.3254902, 0, 1, 1,
0.537516, -0.7614418, 3.795956, 0.3333333, 0, 1, 1,
0.538707, -0.3768913, 2.791774, 0.3372549, 0, 1, 1,
0.5440856, -0.2280893, 0.7234469, 0.345098, 0, 1, 1,
0.5505559, -1.050097, 2.777822, 0.3490196, 0, 1, 1,
0.5568767, 0.7038317, 0.6509476, 0.3568628, 0, 1, 1,
0.5616917, 0.5277088, -0.6507519, 0.3607843, 0, 1, 1,
0.5634397, 1.953633, -0.2640501, 0.3686275, 0, 1, 1,
0.5645714, 0.6743446, -1.10283, 0.372549, 0, 1, 1,
0.5702919, -0.615409, 2.686277, 0.3803922, 0, 1, 1,
0.5758495, -1.105925, 1.670205, 0.3843137, 0, 1, 1,
0.581274, 0.3555686, 0.2528531, 0.3921569, 0, 1, 1,
0.5869786, -1.167382, 3.498137, 0.3960784, 0, 1, 1,
0.5871538, -0.4696117, 3.65121, 0.4039216, 0, 1, 1,
0.589355, -0.6874881, 2.872016, 0.4117647, 0, 1, 1,
0.5945517, -0.1188871, 1.161717, 0.4156863, 0, 1, 1,
0.6077269, 0.3015125, 1.515166, 0.4235294, 0, 1, 1,
0.6082535, -0.2001269, 1.760288, 0.427451, 0, 1, 1,
0.6086192, 0.1827619, 1.865734, 0.4352941, 0, 1, 1,
0.6112851, -0.3010043, 1.628998, 0.4392157, 0, 1, 1,
0.6140997, 1.720403, 1.444351, 0.4470588, 0, 1, 1,
0.6267898, 0.3098728, 0.6115084, 0.4509804, 0, 1, 1,
0.6317668, -1.921504, 3.714431, 0.4588235, 0, 1, 1,
0.6356601, -0.004289785, 2.131932, 0.4627451, 0, 1, 1,
0.6371704, 0.8467643, 2.241676, 0.4705882, 0, 1, 1,
0.6438391, 0.1127761, 0.2676375, 0.4745098, 0, 1, 1,
0.6457806, -1.205518, 2.618157, 0.4823529, 0, 1, 1,
0.6501787, -0.8611171, 3.453525, 0.4862745, 0, 1, 1,
0.6521299, -0.3913845, 2.415561, 0.4941176, 0, 1, 1,
0.6526518, 0.9123433, 0.958519, 0.5019608, 0, 1, 1,
0.6553075, 0.625746, 0.8052766, 0.5058824, 0, 1, 1,
0.6559604, -0.2445106, 2.106695, 0.5137255, 0, 1, 1,
0.6567453, 0.2381156, 0.3766593, 0.5176471, 0, 1, 1,
0.6597416, 0.3065127, 1.572293, 0.5254902, 0, 1, 1,
0.6694627, -0.4554033, 2.122089, 0.5294118, 0, 1, 1,
0.6695067, 0.2752544, 2.466055, 0.5372549, 0, 1, 1,
0.6768885, 0.4663101, 0.6800194, 0.5411765, 0, 1, 1,
0.6861926, 0.7146989, 0.5278643, 0.5490196, 0, 1, 1,
0.6922241, -0.8545947, 1.376621, 0.5529412, 0, 1, 1,
0.6933331, 0.4127172, 1.59673, 0.5607843, 0, 1, 1,
0.7051308, 0.1870989, 0.2541014, 0.5647059, 0, 1, 1,
0.7055637, -1.377498, 1.753697, 0.572549, 0, 1, 1,
0.7096668, 0.691376, 1.678822, 0.5764706, 0, 1, 1,
0.7108315, 1.038447, -0.3936254, 0.5843138, 0, 1, 1,
0.7123672, -0.5959435, 1.231672, 0.5882353, 0, 1, 1,
0.7159342, 0.7950751, 1.821591, 0.5960785, 0, 1, 1,
0.7174128, 0.729544, 0.6735071, 0.6039216, 0, 1, 1,
0.7186409, 1.419094, -0.2027644, 0.6078432, 0, 1, 1,
0.7222378, 0.4623683, 1.430502, 0.6156863, 0, 1, 1,
0.7241407, 0.7215044, 0.7358267, 0.6196079, 0, 1, 1,
0.7305353, 0.6021066, 1.182638, 0.627451, 0, 1, 1,
0.7311673, 0.4177191, 1.718733, 0.6313726, 0, 1, 1,
0.7336466, 0.370478, 2.412381, 0.6392157, 0, 1, 1,
0.7340442, -0.3824675, 4.496655, 0.6431373, 0, 1, 1,
0.7371883, -0.3054726, 2.9955, 0.6509804, 0, 1, 1,
0.7389492, 0.2947438, 2.007922, 0.654902, 0, 1, 1,
0.7418898, -1.674942, 1.447342, 0.6627451, 0, 1, 1,
0.7483683, -1.372386, 1.870296, 0.6666667, 0, 1, 1,
0.749871, 0.3559514, 2.287582, 0.6745098, 0, 1, 1,
0.7536429, -0.2152921, 1.844633, 0.6784314, 0, 1, 1,
0.7565208, 0.2379072, 2.033055, 0.6862745, 0, 1, 1,
0.7594565, 0.6655418, 2.200693, 0.6901961, 0, 1, 1,
0.7664179, -0.7512438, 2.321926, 0.6980392, 0, 1, 1,
0.7735459, 0.1807805, 0.7522779, 0.7058824, 0, 1, 1,
0.7735742, -0.5249576, 2.006985, 0.7098039, 0, 1, 1,
0.7736833, 0.3899664, 0.7097852, 0.7176471, 0, 1, 1,
0.7781275, -1.013135, 3.036931, 0.7215686, 0, 1, 1,
0.7809374, -0.3353862, 0.9029315, 0.7294118, 0, 1, 1,
0.787039, 0.554015, 0.7392988, 0.7333333, 0, 1, 1,
0.7889453, 0.0168909, 1.536874, 0.7411765, 0, 1, 1,
0.792253, -0.6414978, 2.955099, 0.7450981, 0, 1, 1,
0.7945031, -0.780001, -0.7294248, 0.7529412, 0, 1, 1,
0.8039974, -0.02859934, 2.985942, 0.7568628, 0, 1, 1,
0.8092192, 1.666341, 0.4297916, 0.7647059, 0, 1, 1,
0.8110518, 0.5133048, 1.677499, 0.7686275, 0, 1, 1,
0.8121858, 2.770628, -0.718185, 0.7764706, 0, 1, 1,
0.8137578, 0.3272165, 1.622447, 0.7803922, 0, 1, 1,
0.8214182, 0.621141, -0.9086301, 0.7882353, 0, 1, 1,
0.8274025, -1.031715, 2.624899, 0.7921569, 0, 1, 1,
0.8277733, -0.8180092, 0.7463127, 0.8, 0, 1, 1,
0.828826, -0.9374485, 1.65669, 0.8078431, 0, 1, 1,
0.8339918, 1.165975, 1.721241, 0.8117647, 0, 1, 1,
0.8341298, -1.264321, 2.675822, 0.8196079, 0, 1, 1,
0.8342788, -0.2735742, 1.151977, 0.8235294, 0, 1, 1,
0.8554749, 1.040131, 2.356197, 0.8313726, 0, 1, 1,
0.8724056, 0.0915547, 0.09442744, 0.8352941, 0, 1, 1,
0.8799077, -1.170202, 0.9801337, 0.8431373, 0, 1, 1,
0.8862516, -0.2257969, 2.476983, 0.8470588, 0, 1, 1,
0.887087, -2.060053, 2.39516, 0.854902, 0, 1, 1,
0.888678, 0.007920597, 3.64581, 0.8588235, 0, 1, 1,
0.8913525, -2.412779, 1.830854, 0.8666667, 0, 1, 1,
0.8982872, -1.040689, 2.634692, 0.8705882, 0, 1, 1,
0.9029191, 1.137092, 0.6256315, 0.8784314, 0, 1, 1,
0.9030842, -1.130088, 3.154373, 0.8823529, 0, 1, 1,
0.9073909, -0.4676122, 1.495104, 0.8901961, 0, 1, 1,
0.9078981, -0.2677888, 0.9040029, 0.8941177, 0, 1, 1,
0.9104609, -1.836045, 3.325017, 0.9019608, 0, 1, 1,
0.9152862, -2.121511, 1.32779, 0.9098039, 0, 1, 1,
0.9153216, -0.326507, 1.272023, 0.9137255, 0, 1, 1,
0.9211295, 1.369204, -0.6181254, 0.9215686, 0, 1, 1,
0.9263262, 0.4730991, 2.295407, 0.9254902, 0, 1, 1,
0.931351, 1.523853, 2.300118, 0.9333333, 0, 1, 1,
0.9333414, -1.061841, 2.583725, 0.9372549, 0, 1, 1,
0.9427314, 0.06278063, 2.925593, 0.945098, 0, 1, 1,
0.9467662, 0.7546818, -0.2929585, 0.9490196, 0, 1, 1,
0.9479427, -0.2798847, 0.7963117, 0.9568627, 0, 1, 1,
0.9516442, 1.427625, 0.8357256, 0.9607843, 0, 1, 1,
0.952533, 0.03943959, 1.673801, 0.9686275, 0, 1, 1,
0.9531595, 0.4131338, 0.6756801, 0.972549, 0, 1, 1,
0.9587066, -1.041836, 2.779304, 0.9803922, 0, 1, 1,
0.9632465, -1.488824, 2.575979, 0.9843137, 0, 1, 1,
0.9743035, -0.2768149, 0.1922846, 0.9921569, 0, 1, 1,
0.9747458, 0.1556287, 2.638089, 0.9960784, 0, 1, 1,
0.9753442, 0.2715365, 1.546326, 1, 0, 0.9960784, 1,
0.9757186, 0.8296221, 0.6478728, 1, 0, 0.9882353, 1,
0.9801201, -1.219366, 0.886533, 1, 0, 0.9843137, 1,
0.983748, -0.1255071, 1.746368, 1, 0, 0.9764706, 1,
0.9916183, -2.069809, 4.152231, 1, 0, 0.972549, 1,
0.9933881, 0.168993, 1.928088, 1, 0, 0.9647059, 1,
1.005385, -1.52535, 3.069853, 1, 0, 0.9607843, 1,
1.005589, -0.7529737, 1.958874, 1, 0, 0.9529412, 1,
1.010282, 0.5483089, 1.757529, 1, 0, 0.9490196, 1,
1.010533, -0.6214272, 1.680962, 1, 0, 0.9411765, 1,
1.011125, -0.4673017, 2.960364, 1, 0, 0.9372549, 1,
1.01219, 0.9662461, 1.145293, 1, 0, 0.9294118, 1,
1.012401, 2.083088, 0.3396074, 1, 0, 0.9254902, 1,
1.022443, -0.527078, 0.8068266, 1, 0, 0.9176471, 1,
1.022573, 1.550003, -0.4338042, 1, 0, 0.9137255, 1,
1.024733, -1.031454, 2.801998, 1, 0, 0.9058824, 1,
1.024933, -1.117981, 1.732084, 1, 0, 0.9019608, 1,
1.025453, 0.2327853, 1.375859, 1, 0, 0.8941177, 1,
1.029282, 1.500007, 1.3119, 1, 0, 0.8862745, 1,
1.032356, -0.7316623, 2.059896, 1, 0, 0.8823529, 1,
1.034611, -0.03207229, 1.151388, 1, 0, 0.8745098, 1,
1.038028, 1.045705, 1.412969, 1, 0, 0.8705882, 1,
1.04197, -2.017394, 2.952253, 1, 0, 0.8627451, 1,
1.042993, 0.175504, 2.248919, 1, 0, 0.8588235, 1,
1.043284, -0.05909027, 0.3252188, 1, 0, 0.8509804, 1,
1.044434, 0.1328693, 0.8687885, 1, 0, 0.8470588, 1,
1.046155, 0.2732282, 1.566203, 1, 0, 0.8392157, 1,
1.049473, 0.4315217, 0.7408881, 1, 0, 0.8352941, 1,
1.050381, -0.0555259, 1.906494, 1, 0, 0.827451, 1,
1.05448, 1.320495, 0.2418761, 1, 0, 0.8235294, 1,
1.062152, -0.517361, 0.1840552, 1, 0, 0.8156863, 1,
1.062941, -1.164389, 4.059059, 1, 0, 0.8117647, 1,
1.065783, 0.8642425, 0.9072269, 1, 0, 0.8039216, 1,
1.07464, 0.3937561, 2.594744, 1, 0, 0.7960784, 1,
1.074739, -0.07174987, 2.698813, 1, 0, 0.7921569, 1,
1.080504, 0.4842673, 2.611919, 1, 0, 0.7843137, 1,
1.086554, -0.8000925, 1.882186, 1, 0, 0.7803922, 1,
1.087219, 0.3695766, 2.095319, 1, 0, 0.772549, 1,
1.095968, 1.370008, 1.990394, 1, 0, 0.7686275, 1,
1.102488, 0.06794097, 0.4692634, 1, 0, 0.7607843, 1,
1.104513, 1.493482, 0.7739593, 1, 0, 0.7568628, 1,
1.107638, 1.40329, -0.05170983, 1, 0, 0.7490196, 1,
1.113758, -0.6578269, 2.657862, 1, 0, 0.7450981, 1,
1.11509, -2.826536, 3.031278, 1, 0, 0.7372549, 1,
1.11866, 0.03820242, 2.393687, 1, 0, 0.7333333, 1,
1.122407, -0.08736073, 1.252944, 1, 0, 0.7254902, 1,
1.135298, 0.2455165, 1.341581, 1, 0, 0.7215686, 1,
1.146808, 0.1049002, 2.899835, 1, 0, 0.7137255, 1,
1.150098, -0.8182764, 1.954549, 1, 0, 0.7098039, 1,
1.151363, 0.6393269, 1.081531, 1, 0, 0.7019608, 1,
1.160163, -0.7524717, 1.705779, 1, 0, 0.6941177, 1,
1.171716, -0.732793, 3.058701, 1, 0, 0.6901961, 1,
1.181107, -0.521347, 0.6478796, 1, 0, 0.682353, 1,
1.184596, 0.2086299, 2.246771, 1, 0, 0.6784314, 1,
1.197362, -1.003371, 3.617879, 1, 0, 0.6705883, 1,
1.206556, 0.5810491, 0.4189048, 1, 0, 0.6666667, 1,
1.20979, -0.5852934, 1.474769, 1, 0, 0.6588235, 1,
1.216035, 1.152873, 0.3341966, 1, 0, 0.654902, 1,
1.218154, 1.344599, 1.094614, 1, 0, 0.6470588, 1,
1.221059, -1.115909, 2.029895, 1, 0, 0.6431373, 1,
1.223347, 0.3724214, 0.09331235, 1, 0, 0.6352941, 1,
1.247679, -0.154426, 1.344211, 1, 0, 0.6313726, 1,
1.249572, 0.01359802, 0.4438795, 1, 0, 0.6235294, 1,
1.256599, 1.061413, 1.291892, 1, 0, 0.6196079, 1,
1.261322, 1.751755, -0.4117657, 1, 0, 0.6117647, 1,
1.262365, -0.6986566, 2.730331, 1, 0, 0.6078432, 1,
1.269506, -1.217694, 2.945463, 1, 0, 0.6, 1,
1.286285, -1.429139, 1.648732, 1, 0, 0.5921569, 1,
1.289286, 2.332489, -0.9683939, 1, 0, 0.5882353, 1,
1.291375, -1.836196, 0.3370983, 1, 0, 0.5803922, 1,
1.296926, 0.9769219, 0.5572603, 1, 0, 0.5764706, 1,
1.309222, 2.053733, -0.708098, 1, 0, 0.5686275, 1,
1.3183, 0.04903971, 1.434508, 1, 0, 0.5647059, 1,
1.324015, 1.029782, -0.1648303, 1, 0, 0.5568628, 1,
1.35641, -1.153902, 2.008411, 1, 0, 0.5529412, 1,
1.368454, 0.04804276, 2.186734, 1, 0, 0.5450981, 1,
1.375327, 0.4124382, 3.543959, 1, 0, 0.5411765, 1,
1.380243, 0.2092369, -0.7745349, 1, 0, 0.5333334, 1,
1.394024, -0.1332362, -0.6198847, 1, 0, 0.5294118, 1,
1.394431, 0.2545211, 1.066729, 1, 0, 0.5215687, 1,
1.402463, -1.410803, 4.768028, 1, 0, 0.5176471, 1,
1.404248, 0.2869357, 0.4465264, 1, 0, 0.509804, 1,
1.408115, 0.5148878, 2.052796, 1, 0, 0.5058824, 1,
1.409072, 0.5312164, 0.48044, 1, 0, 0.4980392, 1,
1.413734, 0.401633, 0.9659242, 1, 0, 0.4901961, 1,
1.427101, -2.096526, 3.21903, 1, 0, 0.4862745, 1,
1.446223, 0.6675665, 0.1823898, 1, 0, 0.4784314, 1,
1.46374, 1.162408, 1.209583, 1, 0, 0.4745098, 1,
1.514474, 0.6760831, 2.257725, 1, 0, 0.4666667, 1,
1.517679, 0.6729516, 1.499246, 1, 0, 0.4627451, 1,
1.518478, -0.8605885, 1.524972, 1, 0, 0.454902, 1,
1.524851, 0.8477421, 2.406915, 1, 0, 0.4509804, 1,
1.540168, 0.2154163, 1.337709, 1, 0, 0.4431373, 1,
1.54665, 0.1255653, 2.205852, 1, 0, 0.4392157, 1,
1.551707, -0.1616383, 1.997943, 1, 0, 0.4313726, 1,
1.553925, 0.05156172, 3.502345, 1, 0, 0.427451, 1,
1.554659, 0.3297886, 0.4527512, 1, 0, 0.4196078, 1,
1.559761, -0.3039412, 2.50379, 1, 0, 0.4156863, 1,
1.606398, -0.7629298, 2.884824, 1, 0, 0.4078431, 1,
1.626975, 1.642633, -0.3574651, 1, 0, 0.4039216, 1,
1.631721, 0.2587314, 2.093752, 1, 0, 0.3960784, 1,
1.633838, -0.1637404, 2.334567, 1, 0, 0.3882353, 1,
1.641481, 0.1254749, 1.073195, 1, 0, 0.3843137, 1,
1.64192, -1.05226, 1.556832, 1, 0, 0.3764706, 1,
1.645054, -0.9529318, 1.241697, 1, 0, 0.372549, 1,
1.654929, -2.538162, 3.115848, 1, 0, 0.3647059, 1,
1.659893, 1.015278, 0.6950778, 1, 0, 0.3607843, 1,
1.664533, 1.105567, 1.244215, 1, 0, 0.3529412, 1,
1.670004, 1.102257, 2.112046, 1, 0, 0.3490196, 1,
1.689951, -0.9477633, 1.767698, 1, 0, 0.3411765, 1,
1.708899, -0.8489956, 2.68664, 1, 0, 0.3372549, 1,
1.721345, -1.099749, 1.649599, 1, 0, 0.3294118, 1,
1.723429, -1.480423, 4.616586, 1, 0, 0.3254902, 1,
1.730623, -1.253095, 3.144349, 1, 0, 0.3176471, 1,
1.736009, 0.423637, 1.363805, 1, 0, 0.3137255, 1,
1.745966, -0.01862035, 1.933518, 1, 0, 0.3058824, 1,
1.749898, -0.7969019, 1.961387, 1, 0, 0.2980392, 1,
1.751714, -0.6566723, 0.8130725, 1, 0, 0.2941177, 1,
1.755033, -0.6385271, 2.660768, 1, 0, 0.2862745, 1,
1.770097, -0.3710356, 2.71208, 1, 0, 0.282353, 1,
1.770187, -1.272424, 1.085648, 1, 0, 0.2745098, 1,
1.778189, -0.8224862, 3.043417, 1, 0, 0.2705882, 1,
1.780019, 0.5397007, 0.3185102, 1, 0, 0.2627451, 1,
1.782712, -1.399159, 0.8157008, 1, 0, 0.2588235, 1,
1.785272, 1.398689, 1.646567, 1, 0, 0.2509804, 1,
1.791502, 0.2184901, 3.297582, 1, 0, 0.2470588, 1,
1.808703, 1.328637, 2.578296, 1, 0, 0.2392157, 1,
1.81347, -0.297523, 1.560405, 1, 0, 0.2352941, 1,
1.815108, 0.3781343, -0.1398906, 1, 0, 0.227451, 1,
1.818048, -0.6770563, 1.049359, 1, 0, 0.2235294, 1,
1.820894, 0.3406135, -0.4586683, 1, 0, 0.2156863, 1,
1.822895, 1.832539, 2.261184, 1, 0, 0.2117647, 1,
1.827448, -0.2227277, 3.600128, 1, 0, 0.2039216, 1,
1.828947, 0.06486543, 2.088412, 1, 0, 0.1960784, 1,
1.830942, 1.397732, -1.389135, 1, 0, 0.1921569, 1,
1.835041, 1.078254, 1.631413, 1, 0, 0.1843137, 1,
1.862578, 1.407394, 1.234218, 1, 0, 0.1803922, 1,
1.885232, 0.5681605, 1.422519, 1, 0, 0.172549, 1,
1.936179, 0.4363867, 0.7581887, 1, 0, 0.1686275, 1,
1.95191, 0.4066482, 1.523872, 1, 0, 0.1607843, 1,
1.957369, -0.4230169, 2.671621, 1, 0, 0.1568628, 1,
1.98067, -1.406212, 0.7171152, 1, 0, 0.1490196, 1,
1.982361, -0.6606914, 0.8182865, 1, 0, 0.145098, 1,
1.982498, 0.01222563, 2.311091, 1, 0, 0.1372549, 1,
1.99614, -0.01618745, 2.752355, 1, 0, 0.1333333, 1,
2.009392, 1.085027, 2.417605, 1, 0, 0.1254902, 1,
2.015285, -0.8631652, 2.884013, 1, 0, 0.1215686, 1,
2.036263, 1.07472, 2.129725, 1, 0, 0.1137255, 1,
2.062923, 0.01387162, 1.368575, 1, 0, 0.1098039, 1,
2.063946, 1.147475, 1.392827, 1, 0, 0.1019608, 1,
2.07044, -0.006380807, 2.590415, 1, 0, 0.09411765, 1,
2.099603, 0.2647749, 1.741463, 1, 0, 0.09019608, 1,
2.102208, 0.8440055, 1.401205, 1, 0, 0.08235294, 1,
2.119787, -0.3258529, 1.903245, 1, 0, 0.07843138, 1,
2.137555, -2.589577, 2.928434, 1, 0, 0.07058824, 1,
2.181895, -1.994276, 4.074401, 1, 0, 0.06666667, 1,
2.236469, -1.224846, 1.489933, 1, 0, 0.05882353, 1,
2.320821, 0.03052979, 1.908522, 1, 0, 0.05490196, 1,
2.349972, -0.2910024, 1.741509, 1, 0, 0.04705882, 1,
2.401025, 2.959527, -0.6557781, 1, 0, 0.04313726, 1,
2.454102, -0.9201925, 3.501408, 1, 0, 0.03529412, 1,
2.473661, -0.7935513, 3.210946, 1, 0, 0.03137255, 1,
2.716547, -1.046309, 3.41246, 1, 0, 0.02352941, 1,
2.735482, -0.9230802, 2.701529, 1, 0, 0.01960784, 1,
2.786774, -0.08638148, 3.521167, 1, 0, 0.01176471, 1,
3.269374, -1.253774, 1.341825, 1, 0, 0.007843138, 1
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
-0.115878, -4.471378, -8.587102, 0, -0.5, 0.5, 0.5,
-0.115878, -4.471378, -8.587102, 1, -0.5, 0.5, 0.5,
-0.115878, -4.471378, -8.587102, 1, 1.5, 0.5, 0.5,
-0.115878, -4.471378, -8.587102, 0, 1.5, 0.5, 0.5
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
-4.64873, -0.08648384, -8.587102, 0, -0.5, 0.5, 0.5,
-4.64873, -0.08648384, -8.587102, 1, -0.5, 0.5, 0.5,
-4.64873, -0.08648384, -8.587102, 1, 1.5, 0.5, 0.5,
-4.64873, -0.08648384, -8.587102, 0, 1.5, 0.5, 0.5
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
-4.64873, -4.471378, -0.3050661, 0, -0.5, 0.5, 0.5,
-4.64873, -4.471378, -0.3050661, 1, -0.5, 0.5, 0.5,
-4.64873, -4.471378, -0.3050661, 1, 1.5, 0.5, 0.5,
-4.64873, -4.471378, -0.3050661, 0, 1.5, 0.5, 0.5
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
-3, -3.45948, -6.675863,
3, -3.45948, -6.675863,
-3, -3.45948, -6.675863,
-3, -3.628129, -6.994402,
-2, -3.45948, -6.675863,
-2, -3.628129, -6.994402,
-1, -3.45948, -6.675863,
-1, -3.628129, -6.994402,
0, -3.45948, -6.675863,
0, -3.628129, -6.994402,
1, -3.45948, -6.675863,
1, -3.628129, -6.994402,
2, -3.45948, -6.675863,
2, -3.628129, -6.994402,
3, -3.45948, -6.675863,
3, -3.628129, -6.994402
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
-3, -3.965429, -7.631482, 0, -0.5, 0.5, 0.5,
-3, -3.965429, -7.631482, 1, -0.5, 0.5, 0.5,
-3, -3.965429, -7.631482, 1, 1.5, 0.5, 0.5,
-3, -3.965429, -7.631482, 0, 1.5, 0.5, 0.5,
-2, -3.965429, -7.631482, 0, -0.5, 0.5, 0.5,
-2, -3.965429, -7.631482, 1, -0.5, 0.5, 0.5,
-2, -3.965429, -7.631482, 1, 1.5, 0.5, 0.5,
-2, -3.965429, -7.631482, 0, 1.5, 0.5, 0.5,
-1, -3.965429, -7.631482, 0, -0.5, 0.5, 0.5,
-1, -3.965429, -7.631482, 1, -0.5, 0.5, 0.5,
-1, -3.965429, -7.631482, 1, 1.5, 0.5, 0.5,
-1, -3.965429, -7.631482, 0, 1.5, 0.5, 0.5,
0, -3.965429, -7.631482, 0, -0.5, 0.5, 0.5,
0, -3.965429, -7.631482, 1, -0.5, 0.5, 0.5,
0, -3.965429, -7.631482, 1, 1.5, 0.5, 0.5,
0, -3.965429, -7.631482, 0, 1.5, 0.5, 0.5,
1, -3.965429, -7.631482, 0, -0.5, 0.5, 0.5,
1, -3.965429, -7.631482, 1, -0.5, 0.5, 0.5,
1, -3.965429, -7.631482, 1, 1.5, 0.5, 0.5,
1, -3.965429, -7.631482, 0, 1.5, 0.5, 0.5,
2, -3.965429, -7.631482, 0, -0.5, 0.5, 0.5,
2, -3.965429, -7.631482, 1, -0.5, 0.5, 0.5,
2, -3.965429, -7.631482, 1, 1.5, 0.5, 0.5,
2, -3.965429, -7.631482, 0, 1.5, 0.5, 0.5,
3, -3.965429, -7.631482, 0, -0.5, 0.5, 0.5,
3, -3.965429, -7.631482, 1, -0.5, 0.5, 0.5,
3, -3.965429, -7.631482, 1, 1.5, 0.5, 0.5,
3, -3.965429, -7.631482, 0, 1.5, 0.5, 0.5
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
-3.602687, -3, -6.675863,
-3.602687, 3, -6.675863,
-3.602687, -3, -6.675863,
-3.777028, -3, -6.994402,
-3.602687, -2, -6.675863,
-3.777028, -2, -6.994402,
-3.602687, -1, -6.675863,
-3.777028, -1, -6.994402,
-3.602687, 0, -6.675863,
-3.777028, 0, -6.994402,
-3.602687, 1, -6.675863,
-3.777028, 1, -6.994402,
-3.602687, 2, -6.675863,
-3.777028, 2, -6.994402,
-3.602687, 3, -6.675863,
-3.777028, 3, -6.994402
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
-4.125709, -3, -7.631482, 0, -0.5, 0.5, 0.5,
-4.125709, -3, -7.631482, 1, -0.5, 0.5, 0.5,
-4.125709, -3, -7.631482, 1, 1.5, 0.5, 0.5,
-4.125709, -3, -7.631482, 0, 1.5, 0.5, 0.5,
-4.125709, -2, -7.631482, 0, -0.5, 0.5, 0.5,
-4.125709, -2, -7.631482, 1, -0.5, 0.5, 0.5,
-4.125709, -2, -7.631482, 1, 1.5, 0.5, 0.5,
-4.125709, -2, -7.631482, 0, 1.5, 0.5, 0.5,
-4.125709, -1, -7.631482, 0, -0.5, 0.5, 0.5,
-4.125709, -1, -7.631482, 1, -0.5, 0.5, 0.5,
-4.125709, -1, -7.631482, 1, 1.5, 0.5, 0.5,
-4.125709, -1, -7.631482, 0, 1.5, 0.5, 0.5,
-4.125709, 0, -7.631482, 0, -0.5, 0.5, 0.5,
-4.125709, 0, -7.631482, 1, -0.5, 0.5, 0.5,
-4.125709, 0, -7.631482, 1, 1.5, 0.5, 0.5,
-4.125709, 0, -7.631482, 0, 1.5, 0.5, 0.5,
-4.125709, 1, -7.631482, 0, -0.5, 0.5, 0.5,
-4.125709, 1, -7.631482, 1, -0.5, 0.5, 0.5,
-4.125709, 1, -7.631482, 1, 1.5, 0.5, 0.5,
-4.125709, 1, -7.631482, 0, 1.5, 0.5, 0.5,
-4.125709, 2, -7.631482, 0, -0.5, 0.5, 0.5,
-4.125709, 2, -7.631482, 1, -0.5, 0.5, 0.5,
-4.125709, 2, -7.631482, 1, 1.5, 0.5, 0.5,
-4.125709, 2, -7.631482, 0, 1.5, 0.5, 0.5,
-4.125709, 3, -7.631482, 0, -0.5, 0.5, 0.5,
-4.125709, 3, -7.631482, 1, -0.5, 0.5, 0.5,
-4.125709, 3, -7.631482, 1, 1.5, 0.5, 0.5,
-4.125709, 3, -7.631482, 0, 1.5, 0.5, 0.5
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
-3.602687, -3.45948, -6,
-3.602687, -3.45948, 4,
-3.602687, -3.45948, -6,
-3.777028, -3.628129, -6,
-3.602687, -3.45948, -4,
-3.777028, -3.628129, -4,
-3.602687, -3.45948, -2,
-3.777028, -3.628129, -2,
-3.602687, -3.45948, 0,
-3.777028, -3.628129, 0,
-3.602687, -3.45948, 2,
-3.777028, -3.628129, 2,
-3.602687, -3.45948, 4,
-3.777028, -3.628129, 4
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
-4.125709, -3.965429, -6, 0, -0.5, 0.5, 0.5,
-4.125709, -3.965429, -6, 1, -0.5, 0.5, 0.5,
-4.125709, -3.965429, -6, 1, 1.5, 0.5, 0.5,
-4.125709, -3.965429, -6, 0, 1.5, 0.5, 0.5,
-4.125709, -3.965429, -4, 0, -0.5, 0.5, 0.5,
-4.125709, -3.965429, -4, 1, -0.5, 0.5, 0.5,
-4.125709, -3.965429, -4, 1, 1.5, 0.5, 0.5,
-4.125709, -3.965429, -4, 0, 1.5, 0.5, 0.5,
-4.125709, -3.965429, -2, 0, -0.5, 0.5, 0.5,
-4.125709, -3.965429, -2, 1, -0.5, 0.5, 0.5,
-4.125709, -3.965429, -2, 1, 1.5, 0.5, 0.5,
-4.125709, -3.965429, -2, 0, 1.5, 0.5, 0.5,
-4.125709, -3.965429, 0, 0, -0.5, 0.5, 0.5,
-4.125709, -3.965429, 0, 1, -0.5, 0.5, 0.5,
-4.125709, -3.965429, 0, 1, 1.5, 0.5, 0.5,
-4.125709, -3.965429, 0, 0, 1.5, 0.5, 0.5,
-4.125709, -3.965429, 2, 0, -0.5, 0.5, 0.5,
-4.125709, -3.965429, 2, 1, -0.5, 0.5, 0.5,
-4.125709, -3.965429, 2, 1, 1.5, 0.5, 0.5,
-4.125709, -3.965429, 2, 0, 1.5, 0.5, 0.5,
-4.125709, -3.965429, 4, 0, -0.5, 0.5, 0.5,
-4.125709, -3.965429, 4, 1, -0.5, 0.5, 0.5,
-4.125709, -3.965429, 4, 1, 1.5, 0.5, 0.5,
-4.125709, -3.965429, 4, 0, 1.5, 0.5, 0.5
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
-3.602687, -3.45948, -6.675863,
-3.602687, 3.286512, -6.675863,
-3.602687, -3.45948, 6.065731,
-3.602687, 3.286512, 6.065731,
-3.602687, -3.45948, -6.675863,
-3.602687, -3.45948, 6.065731,
-3.602687, 3.286512, -6.675863,
-3.602687, 3.286512, 6.065731,
-3.602687, -3.45948, -6.675863,
3.370931, -3.45948, -6.675863,
-3.602687, -3.45948, 6.065731,
3.370931, -3.45948, 6.065731,
-3.602687, 3.286512, -6.675863,
3.370931, 3.286512, -6.675863,
-3.602687, 3.286512, 6.065731,
3.370931, 3.286512, 6.065731,
3.370931, -3.45948, -6.675863,
3.370931, 3.286512, -6.675863,
3.370931, -3.45948, 6.065731,
3.370931, 3.286512, 6.065731,
3.370931, -3.45948, -6.675863,
3.370931, -3.45948, 6.065731,
3.370931, 3.286512, -6.675863,
3.370931, 3.286512, 6.065731
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
var radius = 8.551827;
var distance = 38.04805;
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
mvMatrix.translate( 0.115878, 0.08648384, 0.3050661 );
mvMatrix.scale( 1.325912, 1.370651, 0.7256866 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.04805);
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
DBH<-read.table("DBH.xyz")
```

```
## Error in read.table("DBH.xyz"): no lines available in input
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
-3.50113, -0.9601526, -1.927329, 0, 0, 1, 1, 1,
-3.194581, -0.7252474, -1.728492, 1, 0, 0, 1, 1,
-2.929621, -0.3721191, -1.405166, 1, 0, 0, 1, 1,
-2.605144, -1.456895, -2.460047, 1, 0, 0, 1, 1,
-2.562966, -1.998078, -1.157744, 1, 0, 0, 1, 1,
-2.462866, 0.9587929, -1.281358, 1, 0, 0, 1, 1,
-2.433909, -0.4774506, -2.610948, 0, 0, 0, 1, 1,
-2.428596, -0.5983402, -1.091718, 0, 0, 0, 1, 1,
-2.318437, 1.028988, -0.1123676, 0, 0, 0, 1, 1,
-2.222618, 0.476709, -2.076628, 0, 0, 0, 1, 1,
-2.178743, -1.041581, -2.729668, 0, 0, 0, 1, 1,
-2.161851, -1.303573, -3.508674, 0, 0, 0, 1, 1,
-2.159428, -2.567355, -1.699664, 0, 0, 0, 1, 1,
-2.138701, 0.1527624, -3.275959, 1, 1, 1, 1, 1,
-2.112903, 1.223908, -2.595766, 1, 1, 1, 1, 1,
-2.110164, 1.168062, -0.8301995, 1, 1, 1, 1, 1,
-2.104188, -1.067621, -2.404971, 1, 1, 1, 1, 1,
-2.095532, 0.1783831, -1.109554, 1, 1, 1, 1, 1,
-2.092, 1.301684, -1.717581, 1, 1, 1, 1, 1,
-2.091697, 0.2952324, -1.257636, 1, 1, 1, 1, 1,
-2.075224, 1.162123, -1.025731, 1, 1, 1, 1, 1,
-2.058261, -0.3176377, -1.233184, 1, 1, 1, 1, 1,
-2.022257, 0.6302042, -1.664885, 1, 1, 1, 1, 1,
-2.014465, 1.915213, -1.400844, 1, 1, 1, 1, 1,
-2.01446, -1.950286, 0.2737381, 1, 1, 1, 1, 1,
-1.984798, -0.4085463, -2.6066, 1, 1, 1, 1, 1,
-1.975654, -0.0420025, -2.062087, 1, 1, 1, 1, 1,
-1.974375, 0.9397479, 0.5544204, 1, 1, 1, 1, 1,
-1.972443, -0.4412963, -2.712224, 0, 0, 1, 1, 1,
-1.960502, 0.258539, -0.2618875, 1, 0, 0, 1, 1,
-1.958557, 0.3654132, -0.8693288, 1, 0, 0, 1, 1,
-1.958298, -0.1679407, -1.15528, 1, 0, 0, 1, 1,
-1.93538, -0.9704089, -3.254285, 1, 0, 0, 1, 1,
-1.928403, -1.233229, -2.379322, 1, 0, 0, 1, 1,
-1.921128, -0.9397162, -0.9158366, 0, 0, 0, 1, 1,
-1.915487, 1.604599, -2.506451, 0, 0, 0, 1, 1,
-1.869714, -0.4340494, -0.7572283, 0, 0, 0, 1, 1,
-1.862342, -0.5731965, -0.7312906, 0, 0, 0, 1, 1,
-1.850106, -0.9427192, -1.741803, 0, 0, 0, 1, 1,
-1.833331, 1.467225, -1.904016, 0, 0, 0, 1, 1,
-1.828314, -0.0004590964, -1.541408, 0, 0, 0, 1, 1,
-1.828158, -0.08603951, -2.87765, 1, 1, 1, 1, 1,
-1.827426, 0.3709951, -1.25508, 1, 1, 1, 1, 1,
-1.818054, -1.363583, -3.696535, 1, 1, 1, 1, 1,
-1.791694, 0.6904775, 0.7576393, 1, 1, 1, 1, 1,
-1.790165, 2.394719, 1.284492, 1, 1, 1, 1, 1,
-1.777438, -0.01767069, -1.996714, 1, 1, 1, 1, 1,
-1.756704, -2.263432, -3.335405, 1, 1, 1, 1, 1,
-1.740809, -0.1932651, -2.564148, 1, 1, 1, 1, 1,
-1.736723, -1.600932, -2.566371, 1, 1, 1, 1, 1,
-1.734013, -0.3135981, -2.19115, 1, 1, 1, 1, 1,
-1.729367, 1.182646, -1.07378, 1, 1, 1, 1, 1,
-1.71281, 0.1704918, -2.230509, 1, 1, 1, 1, 1,
-1.692337, -1.177005, -1.581904, 1, 1, 1, 1, 1,
-1.685201, 0.09010243, 0.1515377, 1, 1, 1, 1, 1,
-1.684193, -0.4269504, -1.472507, 1, 1, 1, 1, 1,
-1.673808, -2.893167, -3.73844, 0, 0, 1, 1, 1,
-1.668204, 0.556849, -2.335412, 1, 0, 0, 1, 1,
-1.656979, -0.5341306, -1.088808, 1, 0, 0, 1, 1,
-1.641281, 1.753023, -0.166743, 1, 0, 0, 1, 1,
-1.634782, 0.1840322, -2.946681, 1, 0, 0, 1, 1,
-1.620568, 0.2405606, -0.1354418, 1, 0, 0, 1, 1,
-1.615992, -0.04988166, 1.049034, 0, 0, 0, 1, 1,
-1.605094, -3.187625, -2.714821, 0, 0, 0, 1, 1,
-1.591175, -0.6917838, -0.7725174, 0, 0, 0, 1, 1,
-1.565733, 0.1251578, -2.212864, 0, 0, 0, 1, 1,
-1.55496, 1.61483, -0.7281647, 0, 0, 0, 1, 1,
-1.551335, 0.4225408, -0.08704, 0, 0, 0, 1, 1,
-1.529882, -0.2283982, -3.104648, 0, 0, 0, 1, 1,
-1.529165, 0.9685016, -0.5743488, 1, 1, 1, 1, 1,
-1.519801, -0.09045976, -3.409636, 1, 1, 1, 1, 1,
-1.508896, -0.2290131, -0.5232468, 1, 1, 1, 1, 1,
-1.506989, -0.2658257, -3.928282, 1, 1, 1, 1, 1,
-1.501306, 1.427722, -1.831194, 1, 1, 1, 1, 1,
-1.497694, 0.2189415, -0.05692378, 1, 1, 1, 1, 1,
-1.490372, -0.92285, -3.467261, 1, 1, 1, 1, 1,
-1.47926, -0.2031708, -2.394819, 1, 1, 1, 1, 1,
-1.474959, 0.8398768, 0.8234642, 1, 1, 1, 1, 1,
-1.471969, -0.3038375, -2.28399, 1, 1, 1, 1, 1,
-1.462174, -0.1678776, -2.374909, 1, 1, 1, 1, 1,
-1.459397, 0.183926, -0.7858415, 1, 1, 1, 1, 1,
-1.450901, 0.1323749, -2.360993, 1, 1, 1, 1, 1,
-1.448936, -0.1620095, -2.299508, 1, 1, 1, 1, 1,
-1.448765, 0.6696169, -0.9224153, 1, 1, 1, 1, 1,
-1.448496, 0.1759813, -3.155245, 0, 0, 1, 1, 1,
-1.440721, -0.4903741, -3.485067, 1, 0, 0, 1, 1,
-1.439818, -0.2810944, -2.364059, 1, 0, 0, 1, 1,
-1.430364, 1.706339, -1.471841, 1, 0, 0, 1, 1,
-1.42917, 1.068225, -1.726617, 1, 0, 0, 1, 1,
-1.423785, 0.1856234, -1.717374, 1, 0, 0, 1, 1,
-1.421344, 0.552691, -2.703155, 0, 0, 0, 1, 1,
-1.420322, -0.100124, -1.806347, 0, 0, 0, 1, 1,
-1.417008, -0.4407873, -1.038207, 0, 0, 0, 1, 1,
-1.409152, 0.6558257, 0.07336807, 0, 0, 0, 1, 1,
-1.404042, -2.383395, -2.218123, 0, 0, 0, 1, 1,
-1.386788, 0.184669, -0.4399305, 0, 0, 0, 1, 1,
-1.382954, 1.460881, -1.122147, 0, 0, 0, 1, 1,
-1.381241, -0.4655175, -1.301491, 1, 1, 1, 1, 1,
-1.381046, -0.7954556, -1.283335, 1, 1, 1, 1, 1,
-1.377125, -0.7695398, -0.9596319, 1, 1, 1, 1, 1,
-1.354252, -1.325345, -0.4847307, 1, 1, 1, 1, 1,
-1.351745, -0.3395256, -0.3929121, 1, 1, 1, 1, 1,
-1.346727, -0.08387204, -2.005776, 1, 1, 1, 1, 1,
-1.340761, -0.2839649, -0.9966602, 1, 1, 1, 1, 1,
-1.330686, -1.954531, -2.122196, 1, 1, 1, 1, 1,
-1.32399, 1.274951, -2.233794, 1, 1, 1, 1, 1,
-1.30846, 0.9222721, -1.500167, 1, 1, 1, 1, 1,
-1.269006, 0.0726068, -1.793842, 1, 1, 1, 1, 1,
-1.266065, -1.223763, -1.783066, 1, 1, 1, 1, 1,
-1.262012, 1.064762, 0.1146321, 1, 1, 1, 1, 1,
-1.256355, -0.07620829, -2.680508, 1, 1, 1, 1, 1,
-1.247981, 0.2234524, -0.6653873, 1, 1, 1, 1, 1,
-1.241069, -0.7649358, -0.7461157, 0, 0, 1, 1, 1,
-1.237633, 0.7070401, -0.3897101, 1, 0, 0, 1, 1,
-1.22802, 0.1928463, 0.634208, 1, 0, 0, 1, 1,
-1.213531, -0.09471564, -2.960747, 1, 0, 0, 1, 1,
-1.2133, 2.0978, 0.3267798, 1, 0, 0, 1, 1,
-1.200799, -0.2738367, -2.314427, 1, 0, 0, 1, 1,
-1.19366, -0.256497, -1.266687, 0, 0, 0, 1, 1,
-1.191904, -0.8682814, -1.718998, 0, 0, 0, 1, 1,
-1.189378, -0.3750754, -3.405497, 0, 0, 0, 1, 1,
-1.189338, -1.442843, -2.327598, 0, 0, 0, 1, 1,
-1.174543, -2.040954, -2.317064, 0, 0, 0, 1, 1,
-1.169227, -2.665627, -1.262494, 0, 0, 0, 1, 1,
-1.168792, 1.979035, -0.8593472, 0, 0, 0, 1, 1,
-1.167044, 1.32958, -1.674352, 1, 1, 1, 1, 1,
-1.166417, -1.060187, -1.446883, 1, 1, 1, 1, 1,
-1.160757, -0.5593958, -2.795678, 1, 1, 1, 1, 1,
-1.15653, -1.508998, -2.256594, 1, 1, 1, 1, 1,
-1.142294, -0.08832049, -1.361686, 1, 1, 1, 1, 1,
-1.132686, -1.383095, -3.958072, 1, 1, 1, 1, 1,
-1.131059, 0.4747396, 0.1550761, 1, 1, 1, 1, 1,
-1.117583, -0.2055982, -0.8180351, 1, 1, 1, 1, 1,
-1.110531, 1.28837, -0.794394, 1, 1, 1, 1, 1,
-1.107348, 1.273676, 0.07346723, 1, 1, 1, 1, 1,
-1.106699, -0.4950807, -1.258211, 1, 1, 1, 1, 1,
-1.095912, -1.550834, -2.420913, 1, 1, 1, 1, 1,
-1.093923, -2.100767, -3.906882, 1, 1, 1, 1, 1,
-1.085825, 1.037026, -0.8964257, 1, 1, 1, 1, 1,
-1.077996, -0.5954457, -1.964747, 1, 1, 1, 1, 1,
-1.074922, 0.3615857, -1.912006, 0, 0, 1, 1, 1,
-1.065128, -1.800296, -1.728617, 1, 0, 0, 1, 1,
-1.053389, -0.1866698, -2.834289, 1, 0, 0, 1, 1,
-1.045684, 0.3376921, -1.765898, 1, 0, 0, 1, 1,
-1.045038, -1.242586, -3.746716, 1, 0, 0, 1, 1,
-1.043748, -0.6552856, -3.146196, 1, 0, 0, 1, 1,
-1.040488, -0.9051513, -2.932632, 0, 0, 0, 1, 1,
-1.029603, -1.19468, -2.952505, 0, 0, 0, 1, 1,
-1.028503, 0.5757906, -2.849317, 0, 0, 0, 1, 1,
-1.026482, 1.294177, -0.9227117, 0, 0, 0, 1, 1,
-1.026168, 1.33159, 1.268343, 0, 0, 0, 1, 1,
-1.021595, -0.1083635, -2.301494, 0, 0, 0, 1, 1,
-1.017975, 1.178006, -1.665165, 0, 0, 0, 1, 1,
-1.013435, -0.3003697, -3.73547, 1, 1, 1, 1, 1,
-1.011505, 1.319139, -1.345481, 1, 1, 1, 1, 1,
-1.011154, -0.09053463, -2.245955, 1, 1, 1, 1, 1,
-0.9959155, 0.9690741, 0.4818203, 1, 1, 1, 1, 1,
-0.9957477, -0.0776078, -3.59651, 1, 1, 1, 1, 1,
-0.9955614, -1.845727, -3.360443, 1, 1, 1, 1, 1,
-0.9949259, -1.264329, -3.448176, 1, 1, 1, 1, 1,
-0.9948257, 1.254488, -1.098121, 1, 1, 1, 1, 1,
-0.985864, 0.6195351, -1.658914, 1, 1, 1, 1, 1,
-0.9837542, 0.2060215, -2.031729, 1, 1, 1, 1, 1,
-0.9832104, 0.3867514, 0.4234621, 1, 1, 1, 1, 1,
-0.9752528, -0.9157627, -1.455716, 1, 1, 1, 1, 1,
-0.973766, 0.4380334, -0.6732821, 1, 1, 1, 1, 1,
-0.9664289, -1.546647, -2.719751, 1, 1, 1, 1, 1,
-0.9656894, 0.6520135, -1.479773, 1, 1, 1, 1, 1,
-0.9625833, -0.08811038, -2.471267, 0, 0, 1, 1, 1,
-0.9600772, 1.011694, -1.627873, 1, 0, 0, 1, 1,
-0.9567474, 0.5772177, -3.1964, 1, 0, 0, 1, 1,
-0.9563438, -0.2541131, -2.303452, 1, 0, 0, 1, 1,
-0.9480665, -0.5944098, -1.495304, 1, 0, 0, 1, 1,
-0.9477864, 0.2351712, -1.765818, 1, 0, 0, 1, 1,
-0.9423227, -1.177375, -1.486612, 0, 0, 0, 1, 1,
-0.9419178, -0.164236, -2.928037, 0, 0, 0, 1, 1,
-0.9408513, -0.5541841, -2.815925, 0, 0, 0, 1, 1,
-0.9361841, -0.6858336, -4.259743, 0, 0, 0, 1, 1,
-0.9360126, 0.01447166, -1.470509, 0, 0, 0, 1, 1,
-0.9320707, 1.452824, 0.2868407, 0, 0, 0, 1, 1,
-0.9286376, -0.2693081, -0.6091732, 0, 0, 0, 1, 1,
-0.9282918, 1.164211, 0.3069157, 1, 1, 1, 1, 1,
-0.9200882, -0.9366966, -3.202376, 1, 1, 1, 1, 1,
-0.9170214, -0.7200159, -1.767208, 1, 1, 1, 1, 1,
-0.9160584, 0.9421834, 0.1385121, 1, 1, 1, 1, 1,
-0.9127794, 1.045904, 0.01402098, 1, 1, 1, 1, 1,
-0.9122875, -0.973861, -2.685848, 1, 1, 1, 1, 1,
-0.908012, 0.5139928, -0.417205, 1, 1, 1, 1, 1,
-0.9067466, 0.08166631, 0.6444585, 1, 1, 1, 1, 1,
-0.9065174, 1.55324, 0.4722174, 1, 1, 1, 1, 1,
-0.8945288, -0.1656502, -1.402865, 1, 1, 1, 1, 1,
-0.8903329, -0.6536027, -3.256121, 1, 1, 1, 1, 1,
-0.8807163, -0.7193864, -1.587622, 1, 1, 1, 1, 1,
-0.8803781, 0.7689782, -1.479944, 1, 1, 1, 1, 1,
-0.8782022, 0.3363152, -2.47428, 1, 1, 1, 1, 1,
-0.8762265, -0.9580753, -1.770782, 1, 1, 1, 1, 1,
-0.8749011, -0.636165, -0.710366, 0, 0, 1, 1, 1,
-0.8701255, -0.4095136, -1.022264, 1, 0, 0, 1, 1,
-0.8666234, -0.5350925, -2.171353, 1, 0, 0, 1, 1,
-0.8658713, 1.333, -1.764438, 1, 0, 0, 1, 1,
-0.8633998, -0.7370104, -1.297592, 1, 0, 0, 1, 1,
-0.8622229, 1.07919, -0.314466, 1, 0, 0, 1, 1,
-0.8608152, 0.4517473, -0.7902539, 0, 0, 0, 1, 1,
-0.8605756, 1.94304, 0.9269648, 0, 0, 0, 1, 1,
-0.8490388, 1.220062, -0.4877977, 0, 0, 0, 1, 1,
-0.8454812, 1.132689, -1.901309, 0, 0, 0, 1, 1,
-0.8447183, -1.268644, -1.908736, 0, 0, 0, 1, 1,
-0.8443306, -0.3809356, -2.944645, 0, 0, 0, 1, 1,
-0.8441384, 0.8500383, -1.665279, 0, 0, 0, 1, 1,
-0.8413361, 0.1768683, -2.762321, 1, 1, 1, 1, 1,
-0.8410625, 2.18879, -1.148759, 1, 1, 1, 1, 1,
-0.8382758, 0.1168347, -0.7136831, 1, 1, 1, 1, 1,
-0.8373277, 1.239642, -0.4382701, 1, 1, 1, 1, 1,
-0.8290532, 0.8180144, -1.232785, 1, 1, 1, 1, 1,
-0.8261867, -0.6842808, -1.709724, 1, 1, 1, 1, 1,
-0.8258487, -0.5430182, -0.9255688, 1, 1, 1, 1, 1,
-0.8216494, 0.1268856, -1.452335, 1, 1, 1, 1, 1,
-0.8165789, 1.41336, -0.5446126, 1, 1, 1, 1, 1,
-0.8143364, -1.10281, -2.641711, 1, 1, 1, 1, 1,
-0.8139303, 1.296592, -1.080456, 1, 1, 1, 1, 1,
-0.8100482, 0.6783526, -1.807953, 1, 1, 1, 1, 1,
-0.8017199, -0.1025086, 0.849268, 1, 1, 1, 1, 1,
-0.8010908, 0.7820842, -1.928966, 1, 1, 1, 1, 1,
-0.7992835, 0.7016844, -2.006468, 1, 1, 1, 1, 1,
-0.7911829, -0.5264184, -2.329936, 0, 0, 1, 1, 1,
-0.7865723, -0.2142594, -1.260472, 1, 0, 0, 1, 1,
-0.7787685, 1.159459, 0.3006289, 1, 0, 0, 1, 1,
-0.7775197, -0.5902871, -2.448024, 1, 0, 0, 1, 1,
-0.7706438, 1.307149, 0.78236, 1, 0, 0, 1, 1,
-0.765954, -1.266696, -3.221614, 1, 0, 0, 1, 1,
-0.761291, 0.3499728, -0.7428262, 0, 0, 0, 1, 1,
-0.7603799, -1.638752, -3.133262, 0, 0, 0, 1, 1,
-0.7598854, -1.492663, -1.707528, 0, 0, 0, 1, 1,
-0.7552219, 0.4894493, -2.4678, 0, 0, 0, 1, 1,
-0.7407191, 0.871779, 1.180264, 0, 0, 0, 1, 1,
-0.7356261, -1.091325, -4.201745, 0, 0, 0, 1, 1,
-0.7336348, 0.09475145, -1.024585, 0, 0, 0, 1, 1,
-0.7305817, 2.295274, 0.05419189, 1, 1, 1, 1, 1,
-0.7283906, -0.2627355, -3.051773, 1, 1, 1, 1, 1,
-0.7158226, 0.4897218, -1.11271, 1, 1, 1, 1, 1,
-0.7074878, 0.1062627, -2.857715, 1, 1, 1, 1, 1,
-0.7006, -0.04308851, -3.076128, 1, 1, 1, 1, 1,
-0.6985673, 0.1620347, -0.6165621, 1, 1, 1, 1, 1,
-0.6963666, -0.4272831, -2.529672, 1, 1, 1, 1, 1,
-0.6882048, 0.5206654, -0.7596149, 1, 1, 1, 1, 1,
-0.6859146, 1.555825, -2.272242, 1, 1, 1, 1, 1,
-0.6846422, -0.1674491, -2.000296, 1, 1, 1, 1, 1,
-0.6845753, 0.8353547, -1.273924, 1, 1, 1, 1, 1,
-0.6836669, -1.157664, -2.055347, 1, 1, 1, 1, 1,
-0.6751747, -0.3714318, -2.025375, 1, 1, 1, 1, 1,
-0.6739703, -0.2063644, -0.8388605, 1, 1, 1, 1, 1,
-0.6720488, 1.236152, 0.4925944, 1, 1, 1, 1, 1,
-0.6715753, 0.2721945, -0.7106887, 0, 0, 1, 1, 1,
-0.668248, -0.1068809, -0.2719715, 1, 0, 0, 1, 1,
-0.6646758, 0.4863488, -1.283959, 1, 0, 0, 1, 1,
-0.6630696, 0.6568375, -0.2610207, 1, 0, 0, 1, 1,
-0.6571159, 0.3461119, -3.504036, 1, 0, 0, 1, 1,
-0.6569948, 0.410301, -0.1938277, 1, 0, 0, 1, 1,
-0.6558843, -0.5746925, -3.034533, 0, 0, 0, 1, 1,
-0.654476, 0.03184871, -2.93988, 0, 0, 0, 1, 1,
-0.649292, -1.206391, -1.623984, 0, 0, 0, 1, 1,
-0.6480859, -0.6961545, -1.463732, 0, 0, 0, 1, 1,
-0.6473847, -0.8485741, -1.454862, 0, 0, 0, 1, 1,
-0.6391995, -0.2174641, -1.834754, 0, 0, 0, 1, 1,
-0.6373017, 0.4470882, -1.186402, 0, 0, 0, 1, 1,
-0.6337074, -1.550936, -3.481258, 1, 1, 1, 1, 1,
-0.6297567, -0.6318628, -2.330521, 1, 1, 1, 1, 1,
-0.6254327, -0.2413085, -0.7608382, 1, 1, 1, 1, 1,
-0.6216521, 0.9097984, -0.160237, 1, 1, 1, 1, 1,
-0.6145222, 0.279368, -0.6926438, 1, 1, 1, 1, 1,
-0.611522, 1.410497, -0.688033, 1, 1, 1, 1, 1,
-0.6099522, -0.4276271, -2.993599, 1, 1, 1, 1, 1,
-0.5964748, -0.5048288, -1.427382, 1, 1, 1, 1, 1,
-0.5904436, -1.401447, -2.026035, 1, 1, 1, 1, 1,
-0.5832301, -0.4796228, -1.893498, 1, 1, 1, 1, 1,
-0.573475, -0.7198968, -3.438507, 1, 1, 1, 1, 1,
-0.5712953, -0.6115928, -2.187754, 1, 1, 1, 1, 1,
-0.5711015, -1.587632, -1.910012, 1, 1, 1, 1, 1,
-0.5689623, 0.7362187, 0.7779435, 1, 1, 1, 1, 1,
-0.5676476, 0.1430785, -0.9705952, 1, 1, 1, 1, 1,
-0.5655786, 0.82346, -2.327115, 0, 0, 1, 1, 1,
-0.5654779, 0.2264311, -0.8706703, 1, 0, 0, 1, 1,
-0.561017, -0.2929479, -1.10722, 1, 0, 0, 1, 1,
-0.5596389, 1.305379, -2.107215, 1, 0, 0, 1, 1,
-0.5591789, -1.100254, -2.672509, 1, 0, 0, 1, 1,
-0.5582945, 0.575976, -1.049476, 1, 0, 0, 1, 1,
-0.5544536, 0.2483765, -2.044043, 0, 0, 0, 1, 1,
-0.5536785, 0.7212586, -1.817332, 0, 0, 0, 1, 1,
-0.5505251, -0.3872546, -2.122327, 0, 0, 0, 1, 1,
-0.5504736, -0.4754541, -2.240103, 0, 0, 0, 1, 1,
-0.5490396, -1.762802, -2.021417, 0, 0, 0, 1, 1,
-0.5490208, -0.4582132, -1.972065, 0, 0, 0, 1, 1,
-0.5472366, 0.4368093, -0.5787483, 0, 0, 0, 1, 1,
-0.5446036, 0.3944692, -1.952903, 1, 1, 1, 1, 1,
-0.5419712, -0.1506143, -0.5877298, 1, 1, 1, 1, 1,
-0.5406798, -0.2822521, -2.684219, 1, 1, 1, 1, 1,
-0.5377631, -0.5395813, -1.994553, 1, 1, 1, 1, 1,
-0.5377099, 1.86965, -1.380663, 1, 1, 1, 1, 1,
-0.5342452, -0.8711594, -2.698132, 1, 1, 1, 1, 1,
-0.5340205, 0.04898325, -0.9093959, 1, 1, 1, 1, 1,
-0.5339332, 0.7426888, 0.06794129, 1, 1, 1, 1, 1,
-0.5302041, 0.5627835, -0.0003275059, 1, 1, 1, 1, 1,
-0.5246599, -0.3093632, -1.328374, 1, 1, 1, 1, 1,
-0.5176074, 0.936639, -0.3121502, 1, 1, 1, 1, 1,
-0.5168898, 2.908411, 0.4643092, 1, 1, 1, 1, 1,
-0.5140181, -0.8231684, -2.239245, 1, 1, 1, 1, 1,
-0.5129772, -0.3703639, -1.293734, 1, 1, 1, 1, 1,
-0.5106646, 2.067206, -1.059605, 1, 1, 1, 1, 1,
-0.5098159, 1.420517, -0.3806572, 0, 0, 1, 1, 1,
-0.5089014, -0.5817713, -2.877566, 1, 0, 0, 1, 1,
-0.5067838, 0.03491782, -1.543792, 1, 0, 0, 1, 1,
-0.5059416, -1.241274, -3.04464, 1, 0, 0, 1, 1,
-0.5050922, 2.772322, -1.991477, 1, 0, 0, 1, 1,
-0.503852, -0.6360053, -2.868793, 1, 0, 0, 1, 1,
-0.503296, 1.045512, 1.222157, 0, 0, 0, 1, 1,
-0.5005986, 1.140501, 1.026085, 0, 0, 0, 1, 1,
-0.4937232, 0.2079418, -1.151157, 0, 0, 0, 1, 1,
-0.4913907, 0.6144313, -1.719562, 0, 0, 0, 1, 1,
-0.4886179, -1.052734, -2.852972, 0, 0, 0, 1, 1,
-0.4868191, 0.4605322, -1.591807, 0, 0, 0, 1, 1,
-0.4861044, 0.3658977, -0.7995952, 0, 0, 0, 1, 1,
-0.483981, 0.3636096, -0.5942254, 1, 1, 1, 1, 1,
-0.480444, 0.3688997, -0.7860289, 1, 1, 1, 1, 1,
-0.4796459, -2.589241, -3.164541, 1, 1, 1, 1, 1,
-0.4751915, -0.2150637, -2.337659, 1, 1, 1, 1, 1,
-0.4732863, -0.5543534, -3.714569, 1, 1, 1, 1, 1,
-0.4691791, 0.4815623, -2.324055, 1, 1, 1, 1, 1,
-0.4671347, -0.3596349, -0.9861743, 1, 1, 1, 1, 1,
-0.4660885, 0.2545357, -0.4314257, 1, 1, 1, 1, 1,
-0.4659932, -0.5330258, -3.478638, 1, 1, 1, 1, 1,
-0.4654379, 0.3922774, 0.7067014, 1, 1, 1, 1, 1,
-0.4604604, 0.9861479, 1.228232, 1, 1, 1, 1, 1,
-0.4602012, 0.8853371, 0.05320285, 1, 1, 1, 1, 1,
-0.4585201, 0.0139299, -2.398325, 1, 1, 1, 1, 1,
-0.4578902, 0.398296, -0.1861617, 1, 1, 1, 1, 1,
-0.4541123, 0.6556855, -1.135236, 1, 1, 1, 1, 1,
-0.4526733, 0.3865328, -0.9094265, 0, 0, 1, 1, 1,
-0.4410644, -0.5199289, -2.270628, 1, 0, 0, 1, 1,
-0.4289385, -0.0009557873, -1.924751, 1, 0, 0, 1, 1,
-0.4245432, 0.4769908, -2.4053, 1, 0, 0, 1, 1,
-0.4138265, 0.4247886, -2.273061, 1, 0, 0, 1, 1,
-0.4071901, -0.5352523, -1.971875, 1, 0, 0, 1, 1,
-0.4000941, -0.9742606, -3.814653, 0, 0, 0, 1, 1,
-0.3987989, -1.17784, -2.75853, 0, 0, 0, 1, 1,
-0.3973339, 0.9083165, -1.065665, 0, 0, 0, 1, 1,
-0.3959507, 0.5913, -0.215805, 0, 0, 0, 1, 1,
-0.3883384, -0.3698849, -1.303752, 0, 0, 0, 1, 1,
-0.3875143, -0.03824336, -2.634904, 0, 0, 0, 1, 1,
-0.3868495, 0.5498553, 1.332324, 0, 0, 0, 1, 1,
-0.3803189, 1.531341, 0.4969947, 1, 1, 1, 1, 1,
-0.3756443, -0.0294966, -0.9658957, 1, 1, 1, 1, 1,
-0.3746466, -0.9547868, -3.499204, 1, 1, 1, 1, 1,
-0.3735982, 0.5150191, -0.7560561, 1, 1, 1, 1, 1,
-0.3628475, -0.2845046, -1.746755, 1, 1, 1, 1, 1,
-0.3564084, 0.8474444, -0.8686828, 1, 1, 1, 1, 1,
-0.3558705, 0.8306817, -0.8051151, 1, 1, 1, 1, 1,
-0.3552593, 0.346559, -1.172888, 1, 1, 1, 1, 1,
-0.3549699, 0.833998, -0.7757308, 1, 1, 1, 1, 1,
-0.3544995, 0.1942232, -0.1873213, 1, 1, 1, 1, 1,
-0.3472599, 1.121771, -1.710401, 1, 1, 1, 1, 1,
-0.3460294, -0.09567436, 0.009991514, 1, 1, 1, 1, 1,
-0.3422976, -2.417676, -3.135021, 1, 1, 1, 1, 1,
-0.3392996, -0.2556564, -3.908032, 1, 1, 1, 1, 1,
-0.3382117, -0.5534322, -3.54, 1, 1, 1, 1, 1,
-0.3377442, -0.7567654, -1.315471, 0, 0, 1, 1, 1,
-0.3226377, -0.4705623, -2.776986, 1, 0, 0, 1, 1,
-0.3224251, -1.936305, -1.51999, 1, 0, 0, 1, 1,
-0.3217386, 2.253755, -0.4552515, 1, 0, 0, 1, 1,
-0.320988, -0.6943914, -3.493383, 1, 0, 0, 1, 1,
-0.3169082, 3.188269, -0.6104854, 1, 0, 0, 1, 1,
-0.3160931, 2.32591, -1.119526, 0, 0, 0, 1, 1,
-0.3106118, 1.524229, -0.4547675, 0, 0, 0, 1, 1,
-0.3086652, -2.24205, -3.68387, 0, 0, 0, 1, 1,
-0.3084747, 1.667945, -0.5768203, 0, 0, 0, 1, 1,
-0.3062179, -0.4221005, -2.248459, 0, 0, 0, 1, 1,
-0.3059965, 0.5324756, 0.1414822, 0, 0, 0, 1, 1,
-0.3052474, 0.9111936, -0.97867, 0, 0, 0, 1, 1,
-0.3021241, 0.5670596, -1.364372, 1, 1, 1, 1, 1,
-0.2981768, -0.1062743, 0.03279109, 1, 1, 1, 1, 1,
-0.2951791, 0.4744062, -0.7484944, 1, 1, 1, 1, 1,
-0.2925134, -0.4005956, -1.669791, 1, 1, 1, 1, 1,
-0.2923736, 1.155224, -0.8111252, 1, 1, 1, 1, 1,
-0.2882978, 0.1948466, 0.7555698, 1, 1, 1, 1, 1,
-0.2881847, 1.137587, 1.696534, 1, 1, 1, 1, 1,
-0.2880273, 0.7121916, 0.7450496, 1, 1, 1, 1, 1,
-0.2878103, -2.322518, -3.260008, 1, 1, 1, 1, 1,
-0.2872467, -0.9813671, -2.735293, 1, 1, 1, 1, 1,
-0.284546, -0.4783924, -3.041302, 1, 1, 1, 1, 1,
-0.2798325, -1.242796, -5.171747, 1, 1, 1, 1, 1,
-0.2756249, 1.200974, -0.3877078, 1, 1, 1, 1, 1,
-0.2736155, -0.3970716, -4.190354, 1, 1, 1, 1, 1,
-0.2713317, 1.442533, -0.02165151, 1, 1, 1, 1, 1,
-0.2703072, 1.310042, 0.462469, 0, 0, 1, 1, 1,
-0.2702069, -0.8489406, -3.738053, 1, 0, 0, 1, 1,
-0.2674652, -0.1191018, -2.551236, 1, 0, 0, 1, 1,
-0.2654956, -2.009849, -4.950493, 1, 0, 0, 1, 1,
-0.2602018, -0.4152602, -3.753352, 1, 0, 0, 1, 1,
-0.260174, -0.5238287, -3.008144, 1, 0, 0, 1, 1,
-0.2595223, 0.1393251, -1.613462, 0, 0, 0, 1, 1,
-0.2553625, -1.080745, -4.009807, 0, 0, 0, 1, 1,
-0.2542128, 0.3257097, -2.10032, 0, 0, 0, 1, 1,
-0.2527816, 1.331083, -0.05778667, 0, 0, 0, 1, 1,
-0.2493904, -0.04945323, -0.8689098, 0, 0, 0, 1, 1,
-0.2493675, 1.280793, 0.8481541, 0, 0, 0, 1, 1,
-0.2490017, 0.8746763, -0.8532748, 0, 0, 0, 1, 1,
-0.2435288, -0.3019237, -1.253289, 1, 1, 1, 1, 1,
-0.2324171, 0.4955265, -1.708538, 1, 1, 1, 1, 1,
-0.2298994, 1.233885, -0.5524325, 1, 1, 1, 1, 1,
-0.227035, 0.4656182, -0.2525522, 1, 1, 1, 1, 1,
-0.2240829, -0.7358493, -1.417967, 1, 1, 1, 1, 1,
-0.2214018, 0.7271968, -0.6472538, 1, 1, 1, 1, 1,
-0.2198733, -1.7985, -4.107976, 1, 1, 1, 1, 1,
-0.2190525, -0.202289, -1.981484, 1, 1, 1, 1, 1,
-0.2162471, -0.2775256, -2.760371, 1, 1, 1, 1, 1,
-0.2159423, 0.04394979, -2.260246, 1, 1, 1, 1, 1,
-0.2131909, -0.4466437, -1.225085, 1, 1, 1, 1, 1,
-0.210224, -0.4486519, -4.499753, 1, 1, 1, 1, 1,
-0.2072851, 1.274791, 2.065777, 1, 1, 1, 1, 1,
-0.2071582, 2.115054, -0.7295238, 1, 1, 1, 1, 1,
-0.2066539, 0.587413, -0.4907317, 1, 1, 1, 1, 1,
-0.2035982, -0.5902, -3.675538, 0, 0, 1, 1, 1,
-0.2026031, -0.5886006, -3.987691, 1, 0, 0, 1, 1,
-0.2008277, 1.360993, -1.669607, 1, 0, 0, 1, 1,
-0.1986918, 1.371419, 0.8115206, 1, 0, 0, 1, 1,
-0.195175, 1.271777, 0.8435279, 1, 0, 0, 1, 1,
-0.1927061, 1.035834, 0.2080687, 1, 0, 0, 1, 1,
-0.1919544, -0.7221099, -3.113347, 0, 0, 0, 1, 1,
-0.1906959, 1.605429, -0.7378968, 0, 0, 0, 1, 1,
-0.1857939, -0.6517502, -2.973307, 0, 0, 0, 1, 1,
-0.1797151, -0.1461479, -3.179383, 0, 0, 0, 1, 1,
-0.1787416, -0.5621058, -1.90188, 0, 0, 0, 1, 1,
-0.178593, 0.4458723, -0.2409023, 0, 0, 0, 1, 1,
-0.1782134, -0.1367858, -2.407985, 0, 0, 0, 1, 1,
-0.1717407, 1.4145, -0.6306368, 1, 1, 1, 1, 1,
-0.1635387, 0.05778932, -1.191952, 1, 1, 1, 1, 1,
-0.1625348, -1.792586, -4.528419, 1, 1, 1, 1, 1,
-0.156795, -0.176886, -2.099676, 1, 1, 1, 1, 1,
-0.1543274, -0.3533882, -3.840315, 1, 1, 1, 1, 1,
-0.1538189, 1.020536, 1.509107, 1, 1, 1, 1, 1,
-0.1516648, -0.01636769, -0.8728279, 1, 1, 1, 1, 1,
-0.1500568, 0.5481785, -0.8577681, 1, 1, 1, 1, 1,
-0.1495583, 0.06228245, -0.2598576, 1, 1, 1, 1, 1,
-0.1485612, -0.5717773, -3.295138, 1, 1, 1, 1, 1,
-0.1472142, -0.5932699, -2.105113, 1, 1, 1, 1, 1,
-0.147128, -1.239016, -2.795802, 1, 1, 1, 1, 1,
-0.1439084, 0.3036366, 0.6096355, 1, 1, 1, 1, 1,
-0.1436923, 0.8659491, -1.141778, 1, 1, 1, 1, 1,
-0.1363843, -0.6451279, -2.879292, 1, 1, 1, 1, 1,
-0.1360459, 0.05444916, -1.41772, 0, 0, 1, 1, 1,
-0.1347706, -0.9227993, -1.952609, 1, 0, 0, 1, 1,
-0.1331768, -0.2066433, -1.430428, 1, 0, 0, 1, 1,
-0.1328271, -1.089635, -1.475709, 1, 0, 0, 1, 1,
-0.1318945, 0.0109873, -1.764225, 1, 0, 0, 1, 1,
-0.1288721, -0.7044834, -3.309477, 1, 0, 0, 1, 1,
-0.1264662, 0.517774, 0.336564, 0, 0, 0, 1, 1,
-0.1257135, -0.5048021, -1.811701, 0, 0, 0, 1, 1,
-0.1244014, 0.1224546, -1.505839, 0, 0, 0, 1, 1,
-0.1223833, 1.790787, -0.618921, 0, 0, 0, 1, 1,
-0.1176024, 0.30243, 0.4081976, 0, 0, 0, 1, 1,
-0.1158665, -1.517265, -4.170758, 0, 0, 0, 1, 1,
-0.1128359, 0.1009463, -1.312555, 0, 0, 0, 1, 1,
-0.1122083, -0.5532913, -3.32332, 1, 1, 1, 1, 1,
-0.1048548, -0.289675, -2.765997, 1, 1, 1, 1, 1,
-0.1042959, -0.1357171, -3.1545, 1, 1, 1, 1, 1,
-0.1042445, -1.699706, -2.542267, 1, 1, 1, 1, 1,
-0.1033929, 1.071599, 0.8681328, 1, 1, 1, 1, 1,
-0.1032162, -1.176233, -3.697524, 1, 1, 1, 1, 1,
-0.102704, 0.4855612, -0.3537138, 1, 1, 1, 1, 1,
-0.09894355, 1.373958, 1.511943, 1, 1, 1, 1, 1,
-0.09623507, 0.05009311, -1.382728, 1, 1, 1, 1, 1,
-0.09622324, 1.038791, -0.08840096, 1, 1, 1, 1, 1,
-0.09536411, -2.200165, -2.515488, 1, 1, 1, 1, 1,
-0.09488054, -0.1406679, -2.69976, 1, 1, 1, 1, 1,
-0.094503, 0.1174266, -1.201939, 1, 1, 1, 1, 1,
-0.09033491, 0.1147023, -0.5644132, 1, 1, 1, 1, 1,
-0.08739679, -0.2369109, -1.999234, 1, 1, 1, 1, 1,
-0.08716514, -2.850914, -2.16872, 0, 0, 1, 1, 1,
-0.08437645, -0.9202523, -3.927608, 1, 0, 0, 1, 1,
-0.08035054, -1.14713, -1.748062, 1, 0, 0, 1, 1,
-0.079327, -0.2802861, -3.827117, 1, 0, 0, 1, 1,
-0.07880977, -0.09957818, -2.344705, 1, 0, 0, 1, 1,
-0.07863032, 2.223311, 0.2996297, 1, 0, 0, 1, 1,
-0.07782981, -0.7042047, -2.888593, 0, 0, 0, 1, 1,
-0.07756251, -0.008655461, -0.07856853, 0, 0, 0, 1, 1,
-0.07603846, -1.269986, -3.256763, 0, 0, 0, 1, 1,
-0.07325824, 0.01637702, -2.069965, 0, 0, 0, 1, 1,
-0.0731549, -0.4817945, -2.111913, 0, 0, 0, 1, 1,
-0.06939713, 0.8531347, -0.7309737, 0, 0, 0, 1, 1,
-0.05950454, -0.5964938, -4.43967, 0, 0, 0, 1, 1,
-0.05907913, -0.2367045, -4.420916, 1, 1, 1, 1, 1,
-0.05885772, -0.5090904, -2.419423, 1, 1, 1, 1, 1,
-0.05735588, 0.7151811, 0.7933708, 1, 1, 1, 1, 1,
-0.05581122, -2.362223, -4.583105, 1, 1, 1, 1, 1,
-0.05538131, -0.7996382, -2.248367, 1, 1, 1, 1, 1,
-0.04979569, -0.117323, -1.897833, 1, 1, 1, 1, 1,
-0.04914019, 0.7656624, -1.146428, 1, 1, 1, 1, 1,
-0.04913383, -0.5485558, -2.157445, 1, 1, 1, 1, 1,
-0.04884947, -0.07684639, -2.82166, 1, 1, 1, 1, 1,
-0.04795079, -0.370988, -2.037159, 1, 1, 1, 1, 1,
-0.03563069, 0.6650083, 1.739299, 1, 1, 1, 1, 1,
-0.03409472, 0.2768974, -0.291086, 1, 1, 1, 1, 1,
-0.03093, 1.572454, -0.3752185, 1, 1, 1, 1, 1,
-0.0305112, -0.04329184, -2.068164, 1, 1, 1, 1, 1,
-0.03024681, -0.9317318, -3.536635, 1, 1, 1, 1, 1,
-0.03013501, 0.3460245, -1.391815, 0, 0, 1, 1, 1,
-0.02331246, 0.6702335, 1.219453, 1, 0, 0, 1, 1,
-0.02224361, -0.5971514, -2.168243, 1, 0, 0, 1, 1,
-0.02137171, -2.19863, -3.272405, 1, 0, 0, 1, 1,
-0.02106359, -0.2931825, -4.082865, 1, 0, 0, 1, 1,
-0.0195942, 0.001274859, -1.474575, 1, 0, 0, 1, 1,
-0.01921846, 0.9359421, 1.38309, 0, 0, 0, 1, 1,
-0.01531063, -0.4670426, -2.379091, 0, 0, 0, 1, 1,
-0.0128058, 0.8395209, 1.892347, 0, 0, 0, 1, 1,
-0.010876, -0.0125506, -1.766551, 0, 0, 0, 1, 1,
-0.01023988, 0.3707761, 0.4675018, 0, 0, 0, 1, 1,
-0.01022047, -0.8302655, -6.490305, 0, 0, 0, 1, 1,
-0.009024347, -1.106434, -4.079336, 0, 0, 0, 1, 1,
-0.008320592, -0.2291471, -2.612838, 1, 1, 1, 1, 1,
-0.005341453, -0.8069194, -4.346197, 1, 1, 1, 1, 1,
0.002589243, -0.05271888, 3.966893, 1, 1, 1, 1, 1,
0.00863465, 1.417177, 2.605913, 1, 1, 1, 1, 1,
0.009566168, 0.7472399, -1.360669, 1, 1, 1, 1, 1,
0.01573852, -1.238729, 2.77897, 1, 1, 1, 1, 1,
0.01634533, 0.8377989, 0.7367067, 1, 1, 1, 1, 1,
0.01754021, 0.3541442, -0.02611901, 1, 1, 1, 1, 1,
0.0197247, -1.009427, 1.560427, 1, 1, 1, 1, 1,
0.02905672, -0.4934449, 3.485182, 1, 1, 1, 1, 1,
0.02963531, -0.02795785, 1.218289, 1, 1, 1, 1, 1,
0.03172803, -0.6115987, 3.132024, 1, 1, 1, 1, 1,
0.03280479, 0.5737578, -0.1885477, 1, 1, 1, 1, 1,
0.03439512, 0.6402802, -0.2964986, 1, 1, 1, 1, 1,
0.04272056, -0.6221052, 2.569327, 1, 1, 1, 1, 1,
0.04583501, 0.8597716, -0.808976, 0, 0, 1, 1, 1,
0.04697967, -0.7705752, 2.887834, 1, 0, 0, 1, 1,
0.05022104, 0.749657, 1.409378, 1, 0, 0, 1, 1,
0.05096372, -0.5227425, 2.025992, 1, 0, 0, 1, 1,
0.05376488, 0.2099764, 1.326027, 1, 0, 0, 1, 1,
0.05543257, 0.386873, 0.1298378, 1, 0, 0, 1, 1,
0.05557568, -1.800747, 2.883006, 0, 0, 0, 1, 1,
0.05815315, 1.974943, -0.7207298, 0, 0, 0, 1, 1,
0.0601714, -0.9300141, 4.033329, 0, 0, 0, 1, 1,
0.06063596, -0.1845301, 2.800533, 0, 0, 0, 1, 1,
0.06678588, 0.9634114, 0.4420278, 0, 0, 0, 1, 1,
0.06748784, -0.1912967, 1.884598, 0, 0, 0, 1, 1,
0.06759093, 0.1142507, 0.7294851, 0, 0, 0, 1, 1,
0.07307883, -0.3413613, 2.920611, 1, 1, 1, 1, 1,
0.07382262, -0.9076678, 2.746262, 1, 1, 1, 1, 1,
0.07405597, 1.094021, 1.152639, 1, 1, 1, 1, 1,
0.07421605, -0.1550012, 3.471002, 1, 1, 1, 1, 1,
0.07710804, 0.787636, 1.622919, 1, 1, 1, 1, 1,
0.07882401, 0.1884215, -0.03076757, 1, 1, 1, 1, 1,
0.07979707, -0.8053969, 1.98731, 1, 1, 1, 1, 1,
0.08125769, -1.075371, 2.119631, 1, 1, 1, 1, 1,
0.08278381, 1.607569, 0.2026469, 1, 1, 1, 1, 1,
0.08280496, 0.706029, -0.1471305, 1, 1, 1, 1, 1,
0.08504838, -0.5489042, 2.356951, 1, 1, 1, 1, 1,
0.08692332, 0.1325527, 0.9846003, 1, 1, 1, 1, 1,
0.09274294, 0.7665365, -1.126058, 1, 1, 1, 1, 1,
0.09503306, 0.5207321, 0.2065248, 1, 1, 1, 1, 1,
0.09633657, -0.2887033, 3.55391, 1, 1, 1, 1, 1,
0.09714963, -1.581495, 2.684883, 0, 0, 1, 1, 1,
0.09980081, 0.3749241, -0.792937, 1, 0, 0, 1, 1,
0.107406, -1.10742, 2.446937, 1, 0, 0, 1, 1,
0.1145492, -0.03554146, 2.362027, 1, 0, 0, 1, 1,
0.1159468, 1.430809, 0.2918544, 1, 0, 0, 1, 1,
0.121475, -0.4383834, 2.734515, 1, 0, 0, 1, 1,
0.1225959, -0.1618474, 4.055088, 0, 0, 0, 1, 1,
0.1255962, 0.3651516, 1.208562, 0, 0, 0, 1, 1,
0.126146, 1.470284, 0.2772074, 0, 0, 0, 1, 1,
0.1267971, -0.132995, 2.005881, 0, 0, 0, 1, 1,
0.1302731, -2.62834, 2.053746, 0, 0, 0, 1, 1,
0.1313378, -0.3467284, 3.26484, 0, 0, 0, 1, 1,
0.1322163, 0.05533462, 0.6006668, 0, 0, 0, 1, 1,
0.1329808, -2.143284, 3.746513, 1, 1, 1, 1, 1,
0.1330121, -1.254553, 3.46628, 1, 1, 1, 1, 1,
0.1332223, 2.202593, 1.838826, 1, 1, 1, 1, 1,
0.1370995, -0.9943999, 2.112011, 1, 1, 1, 1, 1,
0.1389201, 0.9160527, -0.6220814, 1, 1, 1, 1, 1,
0.1447222, 1.470661, 0.9064849, 1, 1, 1, 1, 1,
0.1487533, -0.08220996, 2.878889, 1, 1, 1, 1, 1,
0.1608773, -2.438214, 3.582697, 1, 1, 1, 1, 1,
0.1613966, 1.332909, 0.1989647, 1, 1, 1, 1, 1,
0.1651363, -2.290719, 3.43613, 1, 1, 1, 1, 1,
0.1721139, 0.3349628, -1.045336, 1, 1, 1, 1, 1,
0.1726985, -0.9077483, 3.103895, 1, 1, 1, 1, 1,
0.1738656, 0.21294, -0.1233117, 1, 1, 1, 1, 1,
0.1741798, -0.1029318, 3.145814, 1, 1, 1, 1, 1,
0.1760828, 0.4050814, 0.09383073, 1, 1, 1, 1, 1,
0.1776944, -2.357678, 3.014746, 0, 0, 1, 1, 1,
0.1777942, -1.654462, 2.062559, 1, 0, 0, 1, 1,
0.1787173, 0.03277543, 0.6562104, 1, 0, 0, 1, 1,
0.1791943, -2.031362, 3.893527, 1, 0, 0, 1, 1,
0.1807003, -0.512384, 2.19723, 1, 0, 0, 1, 1,
0.1809511, -0.6152487, 2.757692, 1, 0, 0, 1, 1,
0.1840293, -0.984418, 2.951249, 0, 0, 0, 1, 1,
0.1869669, -0.2582523, 0.930732, 0, 0, 0, 1, 1,
0.1881683, -0.2145628, 1.867178, 0, 0, 0, 1, 1,
0.188549, -2.440427, 3.092848, 0, 0, 0, 1, 1,
0.193964, -0.8700528, 3.607159, 0, 0, 0, 1, 1,
0.1959853, -0.04525629, 0.399322, 0, 0, 0, 1, 1,
0.1993049, -0.2020731, 1.803169, 0, 0, 0, 1, 1,
0.2001319, -0.6889874, 2.813193, 1, 1, 1, 1, 1,
0.2024581, -0.2215178, 2.56891, 1, 1, 1, 1, 1,
0.2049165, 0.5203679, -0.9102238, 1, 1, 1, 1, 1,
0.2091368, -0.05134834, 1.199636, 1, 1, 1, 1, 1,
0.2116736, 0.1743128, 0.2389353, 1, 1, 1, 1, 1,
0.213984, 0.4983727, 1.128181, 1, 1, 1, 1, 1,
0.2142813, 0.6203843, -0.07322425, 1, 1, 1, 1, 1,
0.2204743, -1.653883, 3.557425, 1, 1, 1, 1, 1,
0.2205415, 0.295621, -0.7554166, 1, 1, 1, 1, 1,
0.223554, 1.267361, 0.09525588, 1, 1, 1, 1, 1,
0.2238671, -0.5466325, 3.046163, 1, 1, 1, 1, 1,
0.2329371, -0.5479085, 2.350086, 1, 1, 1, 1, 1,
0.2336991, 0.8917222, -0.0215108, 1, 1, 1, 1, 1,
0.237503, 0.1148882, 1.45821, 1, 1, 1, 1, 1,
0.2387848, 0.07368091, 1.138984, 1, 1, 1, 1, 1,
0.2441903, -0.6006022, 0.4796429, 0, 0, 1, 1, 1,
0.2514571, -0.5677629, 2.467048, 1, 0, 0, 1, 1,
0.252665, 0.3644537, -1.127841, 1, 0, 0, 1, 1,
0.2539605, 1.124227, -0.0474549, 1, 0, 0, 1, 1,
0.2556213, -1.512557, 3.03473, 1, 0, 0, 1, 1,
0.2619167, -0.1937579, 2.80408, 1, 0, 0, 1, 1,
0.2619278, 0.668098, -0.341364, 0, 0, 0, 1, 1,
0.2623063, 0.4551979, 0.7911569, 0, 0, 0, 1, 1,
0.2624933, -0.4146478, 2.018402, 0, 0, 0, 1, 1,
0.2713384, 1.819941, 0.5199724, 0, 0, 0, 1, 1,
0.2719395, -0.4922442, 1.860082, 0, 0, 0, 1, 1,
0.2725376, -0.8011512, 2.559101, 0, 0, 0, 1, 1,
0.2759012, -0.3835121, 1.847984, 0, 0, 0, 1, 1,
0.2777264, -0.6302167, 0.8233924, 1, 1, 1, 1, 1,
0.2778313, 0.6535152, -0.1591342, 1, 1, 1, 1, 1,
0.2799297, -3.361237, 4.292328, 1, 1, 1, 1, 1,
0.2799842, -2.721138, 3.731519, 1, 1, 1, 1, 1,
0.282731, 2.201531, -0.8035498, 1, 1, 1, 1, 1,
0.2836409, 1.216136, 0.006393029, 1, 1, 1, 1, 1,
0.2890027, 1.291626, 1.220108, 1, 1, 1, 1, 1,
0.293931, 1.494047, 1.046007, 1, 1, 1, 1, 1,
0.3031369, 1.149876, -0.2586084, 1, 1, 1, 1, 1,
0.3082417, 0.6756679, 1.517626, 1, 1, 1, 1, 1,
0.3117069, -0.836166, 2.514176, 1, 1, 1, 1, 1,
0.3117156, -1.135346, 1.630171, 1, 1, 1, 1, 1,
0.3120574, 1.005976, 1.307445, 1, 1, 1, 1, 1,
0.3129892, -0.7142365, 3.25044, 1, 1, 1, 1, 1,
0.3177598, -1.625986, 2.574367, 1, 1, 1, 1, 1,
0.3202398, 1.29329, 0.8535135, 0, 0, 1, 1, 1,
0.3224285, 0.260178, 1.757064, 1, 0, 0, 1, 1,
0.3272595, 2.551829, 0.5691212, 1, 0, 0, 1, 1,
0.3283171, -0.262343, 5.880173, 1, 0, 0, 1, 1,
0.3307202, 0.1473282, 1.579872, 1, 0, 0, 1, 1,
0.3318572, 0.1115802, 2.000735, 1, 0, 0, 1, 1,
0.3323068, -0.0857005, 2.068225, 0, 0, 0, 1, 1,
0.3346131, 1.411661, -0.6429799, 0, 0, 0, 1, 1,
0.3431093, -1.027832, 1.995401, 0, 0, 0, 1, 1,
0.3432584, -0.4265812, 2.392809, 0, 0, 0, 1, 1,
0.34491, -0.9533787, 2.616236, 0, 0, 0, 1, 1,
0.348721, -0.7621858, 2.505406, 0, 0, 0, 1, 1,
0.3574209, -0.1498534, 1.010851, 0, 0, 0, 1, 1,
0.3587393, 1.007952, -0.5954575, 1, 1, 1, 1, 1,
0.3598998, -1.034788, 4.225088, 1, 1, 1, 1, 1,
0.3612184, -0.533296, 2.469708, 1, 1, 1, 1, 1,
0.3625782, -1.65137, 4.986437, 1, 1, 1, 1, 1,
0.3665082, 0.1018846, -0.359331, 1, 1, 1, 1, 1,
0.3668194, 0.5147077, -1.232165, 1, 1, 1, 1, 1,
0.3675612, -0.234755, 1.078856, 1, 1, 1, 1, 1,
0.3683209, 0.1139012, 3.331486, 1, 1, 1, 1, 1,
0.3695289, -0.1344942, 0.4431742, 1, 1, 1, 1, 1,
0.3700639, -2.280476, 2.038582, 1, 1, 1, 1, 1,
0.3794093, -1.580921, 2.250688, 1, 1, 1, 1, 1,
0.3841222, -0.9240852, 2.240654, 1, 1, 1, 1, 1,
0.3894249, 0.9058564, 0.08126879, 1, 1, 1, 1, 1,
0.3908209, -0.8871962, 1.972853, 1, 1, 1, 1, 1,
0.3911721, -0.4924465, 3.202567, 1, 1, 1, 1, 1,
0.3928033, -2.531815, 4.930747, 0, 0, 1, 1, 1,
0.4009769, -0.2360261, 1.753167, 1, 0, 0, 1, 1,
0.403241, -0.9719397, 4.084999, 1, 0, 0, 1, 1,
0.4047055, -0.7490814, 3.045329, 1, 0, 0, 1, 1,
0.4061683, 0.1909428, 1.213012, 1, 0, 0, 1, 1,
0.4108039, -1.398634, 1.311919, 1, 0, 0, 1, 1,
0.4153975, 0.972435, 0.3275207, 0, 0, 0, 1, 1,
0.4177483, 0.6561847, 0.9979515, 0, 0, 0, 1, 1,
0.4216588, -2.037576, 2.992205, 0, 0, 0, 1, 1,
0.428829, -0.03892893, -0.6988583, 0, 0, 0, 1, 1,
0.4339013, -0.3055842, 4.239005, 0, 0, 0, 1, 1,
0.4358794, 1.36477, -0.1519748, 0, 0, 0, 1, 1,
0.4378545, 1.003655, 1.211543, 0, 0, 0, 1, 1,
0.4410906, 0.7309927, 0.8323806, 1, 1, 1, 1, 1,
0.4416059, -0.6590465, 3.182045, 1, 1, 1, 1, 1,
0.4466324, -0.9785595, 2.761444, 1, 1, 1, 1, 1,
0.4493452, -1.003901, 0.3356498, 1, 1, 1, 1, 1,
0.4496036, -0.8812311, 1.754691, 1, 1, 1, 1, 1,
0.4499324, -0.3441655, 0.9487569, 1, 1, 1, 1, 1,
0.4508154, 0.09136119, 1.149364, 1, 1, 1, 1, 1,
0.4512883, -0.1331401, 2.417585, 1, 1, 1, 1, 1,
0.4520403, 0.1648612, 1.584195, 1, 1, 1, 1, 1,
0.4555167, -0.7033094, 3.754737, 1, 1, 1, 1, 1,
0.4583233, -2.200914, 1.641184, 1, 1, 1, 1, 1,
0.4598354, 0.01156948, 0.9706669, 1, 1, 1, 1, 1,
0.4655511, -0.1688004, 1.456642, 1, 1, 1, 1, 1,
0.4675991, -0.5880633, 3.322485, 1, 1, 1, 1, 1,
0.4689281, -1.242335, 2.631083, 1, 1, 1, 1, 1,
0.4697954, 0.7503892, 2.527837, 0, 0, 1, 1, 1,
0.4700851, 0.8327233, 1.57318, 1, 0, 0, 1, 1,
0.4716444, -0.6478778, 1.573858, 1, 0, 0, 1, 1,
0.4811209, 0.6170981, 0.627663, 1, 0, 0, 1, 1,
0.4848143, -0.2130853, 2.537583, 1, 0, 0, 1, 1,
0.4871357, -1.590221, 2.642873, 1, 0, 0, 1, 1,
0.4903907, 1.295055, 0.4889399, 0, 0, 0, 1, 1,
0.4929046, 0.9102119, 0.20491, 0, 0, 0, 1, 1,
0.4960385, -0.7127821, 3.216996, 0, 0, 0, 1, 1,
0.496461, 1.321264, -0.4187196, 0, 0, 0, 1, 1,
0.5024115, 0.7831529, -1.230052, 0, 0, 0, 1, 1,
0.5041512, -1.092032, 0.9238825, 0, 0, 0, 1, 1,
0.508713, -0.4704637, 3.979997, 0, 0, 0, 1, 1,
0.5126762, 0.3140762, 2.162112, 1, 1, 1, 1, 1,
0.512839, -1.627168, 3.608618, 1, 1, 1, 1, 1,
0.5151285, -0.6808143, 2.840286, 1, 1, 1, 1, 1,
0.5193733, 1.688136, -1.199572, 1, 1, 1, 1, 1,
0.5270355, 1.157194, -1.119457, 1, 1, 1, 1, 1,
0.5276377, -2.27635, 2.687019, 1, 1, 1, 1, 1,
0.5280162, 1.0067, 0.6203814, 1, 1, 1, 1, 1,
0.5362782, -0.5099143, 3.055833, 1, 1, 1, 1, 1,
0.5373282, -0.8679376, 2.437378, 1, 1, 1, 1, 1,
0.537516, -0.7614418, 3.795956, 1, 1, 1, 1, 1,
0.538707, -0.3768913, 2.791774, 1, 1, 1, 1, 1,
0.5440856, -0.2280893, 0.7234469, 1, 1, 1, 1, 1,
0.5505559, -1.050097, 2.777822, 1, 1, 1, 1, 1,
0.5568767, 0.7038317, 0.6509476, 1, 1, 1, 1, 1,
0.5616917, 0.5277088, -0.6507519, 1, 1, 1, 1, 1,
0.5634397, 1.953633, -0.2640501, 0, 0, 1, 1, 1,
0.5645714, 0.6743446, -1.10283, 1, 0, 0, 1, 1,
0.5702919, -0.615409, 2.686277, 1, 0, 0, 1, 1,
0.5758495, -1.105925, 1.670205, 1, 0, 0, 1, 1,
0.581274, 0.3555686, 0.2528531, 1, 0, 0, 1, 1,
0.5869786, -1.167382, 3.498137, 1, 0, 0, 1, 1,
0.5871538, -0.4696117, 3.65121, 0, 0, 0, 1, 1,
0.589355, -0.6874881, 2.872016, 0, 0, 0, 1, 1,
0.5945517, -0.1188871, 1.161717, 0, 0, 0, 1, 1,
0.6077269, 0.3015125, 1.515166, 0, 0, 0, 1, 1,
0.6082535, -0.2001269, 1.760288, 0, 0, 0, 1, 1,
0.6086192, 0.1827619, 1.865734, 0, 0, 0, 1, 1,
0.6112851, -0.3010043, 1.628998, 0, 0, 0, 1, 1,
0.6140997, 1.720403, 1.444351, 1, 1, 1, 1, 1,
0.6267898, 0.3098728, 0.6115084, 1, 1, 1, 1, 1,
0.6317668, -1.921504, 3.714431, 1, 1, 1, 1, 1,
0.6356601, -0.004289785, 2.131932, 1, 1, 1, 1, 1,
0.6371704, 0.8467643, 2.241676, 1, 1, 1, 1, 1,
0.6438391, 0.1127761, 0.2676375, 1, 1, 1, 1, 1,
0.6457806, -1.205518, 2.618157, 1, 1, 1, 1, 1,
0.6501787, -0.8611171, 3.453525, 1, 1, 1, 1, 1,
0.6521299, -0.3913845, 2.415561, 1, 1, 1, 1, 1,
0.6526518, 0.9123433, 0.958519, 1, 1, 1, 1, 1,
0.6553075, 0.625746, 0.8052766, 1, 1, 1, 1, 1,
0.6559604, -0.2445106, 2.106695, 1, 1, 1, 1, 1,
0.6567453, 0.2381156, 0.3766593, 1, 1, 1, 1, 1,
0.6597416, 0.3065127, 1.572293, 1, 1, 1, 1, 1,
0.6694627, -0.4554033, 2.122089, 1, 1, 1, 1, 1,
0.6695067, 0.2752544, 2.466055, 0, 0, 1, 1, 1,
0.6768885, 0.4663101, 0.6800194, 1, 0, 0, 1, 1,
0.6861926, 0.7146989, 0.5278643, 1, 0, 0, 1, 1,
0.6922241, -0.8545947, 1.376621, 1, 0, 0, 1, 1,
0.6933331, 0.4127172, 1.59673, 1, 0, 0, 1, 1,
0.7051308, 0.1870989, 0.2541014, 1, 0, 0, 1, 1,
0.7055637, -1.377498, 1.753697, 0, 0, 0, 1, 1,
0.7096668, 0.691376, 1.678822, 0, 0, 0, 1, 1,
0.7108315, 1.038447, -0.3936254, 0, 0, 0, 1, 1,
0.7123672, -0.5959435, 1.231672, 0, 0, 0, 1, 1,
0.7159342, 0.7950751, 1.821591, 0, 0, 0, 1, 1,
0.7174128, 0.729544, 0.6735071, 0, 0, 0, 1, 1,
0.7186409, 1.419094, -0.2027644, 0, 0, 0, 1, 1,
0.7222378, 0.4623683, 1.430502, 1, 1, 1, 1, 1,
0.7241407, 0.7215044, 0.7358267, 1, 1, 1, 1, 1,
0.7305353, 0.6021066, 1.182638, 1, 1, 1, 1, 1,
0.7311673, 0.4177191, 1.718733, 1, 1, 1, 1, 1,
0.7336466, 0.370478, 2.412381, 1, 1, 1, 1, 1,
0.7340442, -0.3824675, 4.496655, 1, 1, 1, 1, 1,
0.7371883, -0.3054726, 2.9955, 1, 1, 1, 1, 1,
0.7389492, 0.2947438, 2.007922, 1, 1, 1, 1, 1,
0.7418898, -1.674942, 1.447342, 1, 1, 1, 1, 1,
0.7483683, -1.372386, 1.870296, 1, 1, 1, 1, 1,
0.749871, 0.3559514, 2.287582, 1, 1, 1, 1, 1,
0.7536429, -0.2152921, 1.844633, 1, 1, 1, 1, 1,
0.7565208, 0.2379072, 2.033055, 1, 1, 1, 1, 1,
0.7594565, 0.6655418, 2.200693, 1, 1, 1, 1, 1,
0.7664179, -0.7512438, 2.321926, 1, 1, 1, 1, 1,
0.7735459, 0.1807805, 0.7522779, 0, 0, 1, 1, 1,
0.7735742, -0.5249576, 2.006985, 1, 0, 0, 1, 1,
0.7736833, 0.3899664, 0.7097852, 1, 0, 0, 1, 1,
0.7781275, -1.013135, 3.036931, 1, 0, 0, 1, 1,
0.7809374, -0.3353862, 0.9029315, 1, 0, 0, 1, 1,
0.787039, 0.554015, 0.7392988, 1, 0, 0, 1, 1,
0.7889453, 0.0168909, 1.536874, 0, 0, 0, 1, 1,
0.792253, -0.6414978, 2.955099, 0, 0, 0, 1, 1,
0.7945031, -0.780001, -0.7294248, 0, 0, 0, 1, 1,
0.8039974, -0.02859934, 2.985942, 0, 0, 0, 1, 1,
0.8092192, 1.666341, 0.4297916, 0, 0, 0, 1, 1,
0.8110518, 0.5133048, 1.677499, 0, 0, 0, 1, 1,
0.8121858, 2.770628, -0.718185, 0, 0, 0, 1, 1,
0.8137578, 0.3272165, 1.622447, 1, 1, 1, 1, 1,
0.8214182, 0.621141, -0.9086301, 1, 1, 1, 1, 1,
0.8274025, -1.031715, 2.624899, 1, 1, 1, 1, 1,
0.8277733, -0.8180092, 0.7463127, 1, 1, 1, 1, 1,
0.828826, -0.9374485, 1.65669, 1, 1, 1, 1, 1,
0.8339918, 1.165975, 1.721241, 1, 1, 1, 1, 1,
0.8341298, -1.264321, 2.675822, 1, 1, 1, 1, 1,
0.8342788, -0.2735742, 1.151977, 1, 1, 1, 1, 1,
0.8554749, 1.040131, 2.356197, 1, 1, 1, 1, 1,
0.8724056, 0.0915547, 0.09442744, 1, 1, 1, 1, 1,
0.8799077, -1.170202, 0.9801337, 1, 1, 1, 1, 1,
0.8862516, -0.2257969, 2.476983, 1, 1, 1, 1, 1,
0.887087, -2.060053, 2.39516, 1, 1, 1, 1, 1,
0.888678, 0.007920597, 3.64581, 1, 1, 1, 1, 1,
0.8913525, -2.412779, 1.830854, 1, 1, 1, 1, 1,
0.8982872, -1.040689, 2.634692, 0, 0, 1, 1, 1,
0.9029191, 1.137092, 0.6256315, 1, 0, 0, 1, 1,
0.9030842, -1.130088, 3.154373, 1, 0, 0, 1, 1,
0.9073909, -0.4676122, 1.495104, 1, 0, 0, 1, 1,
0.9078981, -0.2677888, 0.9040029, 1, 0, 0, 1, 1,
0.9104609, -1.836045, 3.325017, 1, 0, 0, 1, 1,
0.9152862, -2.121511, 1.32779, 0, 0, 0, 1, 1,
0.9153216, -0.326507, 1.272023, 0, 0, 0, 1, 1,
0.9211295, 1.369204, -0.6181254, 0, 0, 0, 1, 1,
0.9263262, 0.4730991, 2.295407, 0, 0, 0, 1, 1,
0.931351, 1.523853, 2.300118, 0, 0, 0, 1, 1,
0.9333414, -1.061841, 2.583725, 0, 0, 0, 1, 1,
0.9427314, 0.06278063, 2.925593, 0, 0, 0, 1, 1,
0.9467662, 0.7546818, -0.2929585, 1, 1, 1, 1, 1,
0.9479427, -0.2798847, 0.7963117, 1, 1, 1, 1, 1,
0.9516442, 1.427625, 0.8357256, 1, 1, 1, 1, 1,
0.952533, 0.03943959, 1.673801, 1, 1, 1, 1, 1,
0.9531595, 0.4131338, 0.6756801, 1, 1, 1, 1, 1,
0.9587066, -1.041836, 2.779304, 1, 1, 1, 1, 1,
0.9632465, -1.488824, 2.575979, 1, 1, 1, 1, 1,
0.9743035, -0.2768149, 0.1922846, 1, 1, 1, 1, 1,
0.9747458, 0.1556287, 2.638089, 1, 1, 1, 1, 1,
0.9753442, 0.2715365, 1.546326, 1, 1, 1, 1, 1,
0.9757186, 0.8296221, 0.6478728, 1, 1, 1, 1, 1,
0.9801201, -1.219366, 0.886533, 1, 1, 1, 1, 1,
0.983748, -0.1255071, 1.746368, 1, 1, 1, 1, 1,
0.9916183, -2.069809, 4.152231, 1, 1, 1, 1, 1,
0.9933881, 0.168993, 1.928088, 1, 1, 1, 1, 1,
1.005385, -1.52535, 3.069853, 0, 0, 1, 1, 1,
1.005589, -0.7529737, 1.958874, 1, 0, 0, 1, 1,
1.010282, 0.5483089, 1.757529, 1, 0, 0, 1, 1,
1.010533, -0.6214272, 1.680962, 1, 0, 0, 1, 1,
1.011125, -0.4673017, 2.960364, 1, 0, 0, 1, 1,
1.01219, 0.9662461, 1.145293, 1, 0, 0, 1, 1,
1.012401, 2.083088, 0.3396074, 0, 0, 0, 1, 1,
1.022443, -0.527078, 0.8068266, 0, 0, 0, 1, 1,
1.022573, 1.550003, -0.4338042, 0, 0, 0, 1, 1,
1.024733, -1.031454, 2.801998, 0, 0, 0, 1, 1,
1.024933, -1.117981, 1.732084, 0, 0, 0, 1, 1,
1.025453, 0.2327853, 1.375859, 0, 0, 0, 1, 1,
1.029282, 1.500007, 1.3119, 0, 0, 0, 1, 1,
1.032356, -0.7316623, 2.059896, 1, 1, 1, 1, 1,
1.034611, -0.03207229, 1.151388, 1, 1, 1, 1, 1,
1.038028, 1.045705, 1.412969, 1, 1, 1, 1, 1,
1.04197, -2.017394, 2.952253, 1, 1, 1, 1, 1,
1.042993, 0.175504, 2.248919, 1, 1, 1, 1, 1,
1.043284, -0.05909027, 0.3252188, 1, 1, 1, 1, 1,
1.044434, 0.1328693, 0.8687885, 1, 1, 1, 1, 1,
1.046155, 0.2732282, 1.566203, 1, 1, 1, 1, 1,
1.049473, 0.4315217, 0.7408881, 1, 1, 1, 1, 1,
1.050381, -0.0555259, 1.906494, 1, 1, 1, 1, 1,
1.05448, 1.320495, 0.2418761, 1, 1, 1, 1, 1,
1.062152, -0.517361, 0.1840552, 1, 1, 1, 1, 1,
1.062941, -1.164389, 4.059059, 1, 1, 1, 1, 1,
1.065783, 0.8642425, 0.9072269, 1, 1, 1, 1, 1,
1.07464, 0.3937561, 2.594744, 1, 1, 1, 1, 1,
1.074739, -0.07174987, 2.698813, 0, 0, 1, 1, 1,
1.080504, 0.4842673, 2.611919, 1, 0, 0, 1, 1,
1.086554, -0.8000925, 1.882186, 1, 0, 0, 1, 1,
1.087219, 0.3695766, 2.095319, 1, 0, 0, 1, 1,
1.095968, 1.370008, 1.990394, 1, 0, 0, 1, 1,
1.102488, 0.06794097, 0.4692634, 1, 0, 0, 1, 1,
1.104513, 1.493482, 0.7739593, 0, 0, 0, 1, 1,
1.107638, 1.40329, -0.05170983, 0, 0, 0, 1, 1,
1.113758, -0.6578269, 2.657862, 0, 0, 0, 1, 1,
1.11509, -2.826536, 3.031278, 0, 0, 0, 1, 1,
1.11866, 0.03820242, 2.393687, 0, 0, 0, 1, 1,
1.122407, -0.08736073, 1.252944, 0, 0, 0, 1, 1,
1.135298, 0.2455165, 1.341581, 0, 0, 0, 1, 1,
1.146808, 0.1049002, 2.899835, 1, 1, 1, 1, 1,
1.150098, -0.8182764, 1.954549, 1, 1, 1, 1, 1,
1.151363, 0.6393269, 1.081531, 1, 1, 1, 1, 1,
1.160163, -0.7524717, 1.705779, 1, 1, 1, 1, 1,
1.171716, -0.732793, 3.058701, 1, 1, 1, 1, 1,
1.181107, -0.521347, 0.6478796, 1, 1, 1, 1, 1,
1.184596, 0.2086299, 2.246771, 1, 1, 1, 1, 1,
1.197362, -1.003371, 3.617879, 1, 1, 1, 1, 1,
1.206556, 0.5810491, 0.4189048, 1, 1, 1, 1, 1,
1.20979, -0.5852934, 1.474769, 1, 1, 1, 1, 1,
1.216035, 1.152873, 0.3341966, 1, 1, 1, 1, 1,
1.218154, 1.344599, 1.094614, 1, 1, 1, 1, 1,
1.221059, -1.115909, 2.029895, 1, 1, 1, 1, 1,
1.223347, 0.3724214, 0.09331235, 1, 1, 1, 1, 1,
1.247679, -0.154426, 1.344211, 1, 1, 1, 1, 1,
1.249572, 0.01359802, 0.4438795, 0, 0, 1, 1, 1,
1.256599, 1.061413, 1.291892, 1, 0, 0, 1, 1,
1.261322, 1.751755, -0.4117657, 1, 0, 0, 1, 1,
1.262365, -0.6986566, 2.730331, 1, 0, 0, 1, 1,
1.269506, -1.217694, 2.945463, 1, 0, 0, 1, 1,
1.286285, -1.429139, 1.648732, 1, 0, 0, 1, 1,
1.289286, 2.332489, -0.9683939, 0, 0, 0, 1, 1,
1.291375, -1.836196, 0.3370983, 0, 0, 0, 1, 1,
1.296926, 0.9769219, 0.5572603, 0, 0, 0, 1, 1,
1.309222, 2.053733, -0.708098, 0, 0, 0, 1, 1,
1.3183, 0.04903971, 1.434508, 0, 0, 0, 1, 1,
1.324015, 1.029782, -0.1648303, 0, 0, 0, 1, 1,
1.35641, -1.153902, 2.008411, 0, 0, 0, 1, 1,
1.368454, 0.04804276, 2.186734, 1, 1, 1, 1, 1,
1.375327, 0.4124382, 3.543959, 1, 1, 1, 1, 1,
1.380243, 0.2092369, -0.7745349, 1, 1, 1, 1, 1,
1.394024, -0.1332362, -0.6198847, 1, 1, 1, 1, 1,
1.394431, 0.2545211, 1.066729, 1, 1, 1, 1, 1,
1.402463, -1.410803, 4.768028, 1, 1, 1, 1, 1,
1.404248, 0.2869357, 0.4465264, 1, 1, 1, 1, 1,
1.408115, 0.5148878, 2.052796, 1, 1, 1, 1, 1,
1.409072, 0.5312164, 0.48044, 1, 1, 1, 1, 1,
1.413734, 0.401633, 0.9659242, 1, 1, 1, 1, 1,
1.427101, -2.096526, 3.21903, 1, 1, 1, 1, 1,
1.446223, 0.6675665, 0.1823898, 1, 1, 1, 1, 1,
1.46374, 1.162408, 1.209583, 1, 1, 1, 1, 1,
1.514474, 0.6760831, 2.257725, 1, 1, 1, 1, 1,
1.517679, 0.6729516, 1.499246, 1, 1, 1, 1, 1,
1.518478, -0.8605885, 1.524972, 0, 0, 1, 1, 1,
1.524851, 0.8477421, 2.406915, 1, 0, 0, 1, 1,
1.540168, 0.2154163, 1.337709, 1, 0, 0, 1, 1,
1.54665, 0.1255653, 2.205852, 1, 0, 0, 1, 1,
1.551707, -0.1616383, 1.997943, 1, 0, 0, 1, 1,
1.553925, 0.05156172, 3.502345, 1, 0, 0, 1, 1,
1.554659, 0.3297886, 0.4527512, 0, 0, 0, 1, 1,
1.559761, -0.3039412, 2.50379, 0, 0, 0, 1, 1,
1.606398, -0.7629298, 2.884824, 0, 0, 0, 1, 1,
1.626975, 1.642633, -0.3574651, 0, 0, 0, 1, 1,
1.631721, 0.2587314, 2.093752, 0, 0, 0, 1, 1,
1.633838, -0.1637404, 2.334567, 0, 0, 0, 1, 1,
1.641481, 0.1254749, 1.073195, 0, 0, 0, 1, 1,
1.64192, -1.05226, 1.556832, 1, 1, 1, 1, 1,
1.645054, -0.9529318, 1.241697, 1, 1, 1, 1, 1,
1.654929, -2.538162, 3.115848, 1, 1, 1, 1, 1,
1.659893, 1.015278, 0.6950778, 1, 1, 1, 1, 1,
1.664533, 1.105567, 1.244215, 1, 1, 1, 1, 1,
1.670004, 1.102257, 2.112046, 1, 1, 1, 1, 1,
1.689951, -0.9477633, 1.767698, 1, 1, 1, 1, 1,
1.708899, -0.8489956, 2.68664, 1, 1, 1, 1, 1,
1.721345, -1.099749, 1.649599, 1, 1, 1, 1, 1,
1.723429, -1.480423, 4.616586, 1, 1, 1, 1, 1,
1.730623, -1.253095, 3.144349, 1, 1, 1, 1, 1,
1.736009, 0.423637, 1.363805, 1, 1, 1, 1, 1,
1.745966, -0.01862035, 1.933518, 1, 1, 1, 1, 1,
1.749898, -0.7969019, 1.961387, 1, 1, 1, 1, 1,
1.751714, -0.6566723, 0.8130725, 1, 1, 1, 1, 1,
1.755033, -0.6385271, 2.660768, 0, 0, 1, 1, 1,
1.770097, -0.3710356, 2.71208, 1, 0, 0, 1, 1,
1.770187, -1.272424, 1.085648, 1, 0, 0, 1, 1,
1.778189, -0.8224862, 3.043417, 1, 0, 0, 1, 1,
1.780019, 0.5397007, 0.3185102, 1, 0, 0, 1, 1,
1.782712, -1.399159, 0.8157008, 1, 0, 0, 1, 1,
1.785272, 1.398689, 1.646567, 0, 0, 0, 1, 1,
1.791502, 0.2184901, 3.297582, 0, 0, 0, 1, 1,
1.808703, 1.328637, 2.578296, 0, 0, 0, 1, 1,
1.81347, -0.297523, 1.560405, 0, 0, 0, 1, 1,
1.815108, 0.3781343, -0.1398906, 0, 0, 0, 1, 1,
1.818048, -0.6770563, 1.049359, 0, 0, 0, 1, 1,
1.820894, 0.3406135, -0.4586683, 0, 0, 0, 1, 1,
1.822895, 1.832539, 2.261184, 1, 1, 1, 1, 1,
1.827448, -0.2227277, 3.600128, 1, 1, 1, 1, 1,
1.828947, 0.06486543, 2.088412, 1, 1, 1, 1, 1,
1.830942, 1.397732, -1.389135, 1, 1, 1, 1, 1,
1.835041, 1.078254, 1.631413, 1, 1, 1, 1, 1,
1.862578, 1.407394, 1.234218, 1, 1, 1, 1, 1,
1.885232, 0.5681605, 1.422519, 1, 1, 1, 1, 1,
1.936179, 0.4363867, 0.7581887, 1, 1, 1, 1, 1,
1.95191, 0.4066482, 1.523872, 1, 1, 1, 1, 1,
1.957369, -0.4230169, 2.671621, 1, 1, 1, 1, 1,
1.98067, -1.406212, 0.7171152, 1, 1, 1, 1, 1,
1.982361, -0.6606914, 0.8182865, 1, 1, 1, 1, 1,
1.982498, 0.01222563, 2.311091, 1, 1, 1, 1, 1,
1.99614, -0.01618745, 2.752355, 1, 1, 1, 1, 1,
2.009392, 1.085027, 2.417605, 1, 1, 1, 1, 1,
2.015285, -0.8631652, 2.884013, 0, 0, 1, 1, 1,
2.036263, 1.07472, 2.129725, 1, 0, 0, 1, 1,
2.062923, 0.01387162, 1.368575, 1, 0, 0, 1, 1,
2.063946, 1.147475, 1.392827, 1, 0, 0, 1, 1,
2.07044, -0.006380807, 2.590415, 1, 0, 0, 1, 1,
2.099603, 0.2647749, 1.741463, 1, 0, 0, 1, 1,
2.102208, 0.8440055, 1.401205, 0, 0, 0, 1, 1,
2.119787, -0.3258529, 1.903245, 0, 0, 0, 1, 1,
2.137555, -2.589577, 2.928434, 0, 0, 0, 1, 1,
2.181895, -1.994276, 4.074401, 0, 0, 0, 1, 1,
2.236469, -1.224846, 1.489933, 0, 0, 0, 1, 1,
2.320821, 0.03052979, 1.908522, 0, 0, 0, 1, 1,
2.349972, -0.2910024, 1.741509, 0, 0, 0, 1, 1,
2.401025, 2.959527, -0.6557781, 1, 1, 1, 1, 1,
2.454102, -0.9201925, 3.501408, 1, 1, 1, 1, 1,
2.473661, -0.7935513, 3.210946, 1, 1, 1, 1, 1,
2.716547, -1.046309, 3.41246, 1, 1, 1, 1, 1,
2.735482, -0.9230802, 2.701529, 1, 1, 1, 1, 1,
2.786774, -0.08638148, 3.521167, 1, 1, 1, 1, 1,
3.269374, -1.253774, 1.341825, 1, 1, 1, 1, 1
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
var radius = 10.38505;
var distance = 36.47705;
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
mvMatrix.translate( 0.1158779, 0.08648372, 0.3050661 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.47705);
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
