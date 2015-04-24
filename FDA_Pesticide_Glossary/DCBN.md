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
-2.91403, 0.1344896, -0.8914204, 1, 0, 0, 1,
-2.882034, -0.635088, -1.461, 1, 0.007843138, 0, 1,
-2.70951, 0.2026734, -0.569309, 1, 0.01176471, 0, 1,
-2.674202, 1.409314, -3.171643, 1, 0.01960784, 0, 1,
-2.592376, 0.7968646, -2.033587, 1, 0.02352941, 0, 1,
-2.583138, 0.1012999, -2.575733, 1, 0.03137255, 0, 1,
-2.452812, 0.1092734, -1.388827, 1, 0.03529412, 0, 1,
-2.42343, -1.815928, -1.239815, 1, 0.04313726, 0, 1,
-2.364976, 0.5851404, -2.632874, 1, 0.04705882, 0, 1,
-2.355515, -0.1878849, -2.453717, 1, 0.05490196, 0, 1,
-2.331703, -1.147301, -2.194772, 1, 0.05882353, 0, 1,
-2.302639, 1.654441, -2.593634, 1, 0.06666667, 0, 1,
-2.300578, -0.4536025, 0.933085, 1, 0.07058824, 0, 1,
-2.264341, 1.273088, -1.037526, 1, 0.07843138, 0, 1,
-2.25772, -0.6225064, -2.267014, 1, 0.08235294, 0, 1,
-2.237405, -0.1695319, -3.01745, 1, 0.09019608, 0, 1,
-2.234203, -0.413854, -2.056159, 1, 0.09411765, 0, 1,
-2.207602, 2.641623, -2.033746, 1, 0.1019608, 0, 1,
-2.181811, -0.5387939, -3.038045, 1, 0.1098039, 0, 1,
-2.103774, 0.225464, -2.114992, 1, 0.1137255, 0, 1,
-2.060275, -0.06728999, -2.778059, 1, 0.1215686, 0, 1,
-2.060226, -0.9721419, -2.835491, 1, 0.1254902, 0, 1,
-2.041124, -0.02141732, -1.654168, 1, 0.1333333, 0, 1,
-2.030537, 0.1652582, -0.04903434, 1, 0.1372549, 0, 1,
-2.020536, 1.066622, -1.566125, 1, 0.145098, 0, 1,
-2.013473, -0.2097081, -0.3341798, 1, 0.1490196, 0, 1,
-1.996433, 0.08065332, -0.5268425, 1, 0.1568628, 0, 1,
-1.982698, -0.2603708, -2.000187, 1, 0.1607843, 0, 1,
-1.946181, -1.642484, -3.663224, 1, 0.1686275, 0, 1,
-1.93793, 1.562119, -2.450176, 1, 0.172549, 0, 1,
-1.937437, 1.862453, -0.1462457, 1, 0.1803922, 0, 1,
-1.933988, -0.01252366, -1.500402, 1, 0.1843137, 0, 1,
-1.92883, -1.177335, -2.88412, 1, 0.1921569, 0, 1,
-1.912525, -0.7707996, -2.207847, 1, 0.1960784, 0, 1,
-1.90325, -1.476521, -4.316647, 1, 0.2039216, 0, 1,
-1.900182, 0.3817602, -2.094173, 1, 0.2117647, 0, 1,
-1.854811, -1.269028, -2.561548, 1, 0.2156863, 0, 1,
-1.840725, -0.206625, -1.844384, 1, 0.2235294, 0, 1,
-1.83342, 1.174737, -2.510714, 1, 0.227451, 0, 1,
-1.828058, 0.05259281, -2.305272, 1, 0.2352941, 0, 1,
-1.807299, 1.234593, -0.5198057, 1, 0.2392157, 0, 1,
-1.781613, 1.841236, -0.1083284, 1, 0.2470588, 0, 1,
-1.771561, 1.35186, 1.033295, 1, 0.2509804, 0, 1,
-1.765881, -1.01314, -2.740215, 1, 0.2588235, 0, 1,
-1.74718, 0.6914797, -1.481892, 1, 0.2627451, 0, 1,
-1.746989, 0.469914, -2.01653, 1, 0.2705882, 0, 1,
-1.722499, 0.02008392, -1.436819, 1, 0.2745098, 0, 1,
-1.695648, -0.8339771, -2.412528, 1, 0.282353, 0, 1,
-1.694164, -1.202929, -1.779452, 1, 0.2862745, 0, 1,
-1.665613, -0.6819127, -3.154049, 1, 0.2941177, 0, 1,
-1.634469, 0.1988984, -0.2416962, 1, 0.3019608, 0, 1,
-1.631073, 0.9277858, -2.365857, 1, 0.3058824, 0, 1,
-1.6253, -0.2624754, -1.098497, 1, 0.3137255, 0, 1,
-1.61597, 0.2677127, -2.319004, 1, 0.3176471, 0, 1,
-1.593432, -0.327272, -2.563339, 1, 0.3254902, 0, 1,
-1.591186, -0.9171557, -0.8378325, 1, 0.3294118, 0, 1,
-1.576303, -0.776944, -2.864087, 1, 0.3372549, 0, 1,
-1.574273, -0.1949008, -1.272585, 1, 0.3411765, 0, 1,
-1.572926, -0.821089, -1.843459, 1, 0.3490196, 0, 1,
-1.556647, -0.7727771, -2.329379, 1, 0.3529412, 0, 1,
-1.546354, 0.3025755, 0.04671482, 1, 0.3607843, 0, 1,
-1.546004, 0.2831022, -1.508696, 1, 0.3647059, 0, 1,
-1.54245, 0.5385951, -2.872312, 1, 0.372549, 0, 1,
-1.516899, -0.09746619, -1.743831, 1, 0.3764706, 0, 1,
-1.515249, -0.103457, -0.556888, 1, 0.3843137, 0, 1,
-1.486506, 0.2831045, -0.8277409, 1, 0.3882353, 0, 1,
-1.486506, 0.4174753, -1.875961, 1, 0.3960784, 0, 1,
-1.481947, -1.015998, -2.20047, 1, 0.4039216, 0, 1,
-1.468801, -3.111347, -3.494788, 1, 0.4078431, 0, 1,
-1.464974, 0.007751907, -1.629769, 1, 0.4156863, 0, 1,
-1.46148, -0.6668056, -1.71764, 1, 0.4196078, 0, 1,
-1.460654, -1.63978, -3.672253, 1, 0.427451, 0, 1,
-1.458588, -2.363192, -2.504142, 1, 0.4313726, 0, 1,
-1.457109, -1.894709, -4.036337, 1, 0.4392157, 0, 1,
-1.451626, -0.00859926, -1.387079, 1, 0.4431373, 0, 1,
-1.451017, 0.9710174, -1.09904, 1, 0.4509804, 0, 1,
-1.447717, -0.5593261, -1.813403, 1, 0.454902, 0, 1,
-1.439288, 0.6588781, -2.85279, 1, 0.4627451, 0, 1,
-1.436987, -0.1362599, -0.8532122, 1, 0.4666667, 0, 1,
-1.429059, 0.1230526, -2.484974, 1, 0.4745098, 0, 1,
-1.42867, -1.263342, -2.416863, 1, 0.4784314, 0, 1,
-1.419863, 1.023132, 0.05191733, 1, 0.4862745, 0, 1,
-1.412893, 0.183903, -0.9041657, 1, 0.4901961, 0, 1,
-1.411611, -0.9881437, -3.408146, 1, 0.4980392, 0, 1,
-1.389801, -0.3465487, -2.714799, 1, 0.5058824, 0, 1,
-1.375968, -0.05387118, -1.37482, 1, 0.509804, 0, 1,
-1.367295, 0.2912694, -0.2253904, 1, 0.5176471, 0, 1,
-1.352067, -1.543664, -0.5192629, 1, 0.5215687, 0, 1,
-1.34276, -2.032036, -4.835728, 1, 0.5294118, 0, 1,
-1.331447, -0.7901202, -1.274986, 1, 0.5333334, 0, 1,
-1.322751, -1.307283, -2.592725, 1, 0.5411765, 0, 1,
-1.319164, -0.02752778, -1.950081, 1, 0.5450981, 0, 1,
-1.31151, -0.8783388, -2.200011, 1, 0.5529412, 0, 1,
-1.307204, 1.024209, -1.656087, 1, 0.5568628, 0, 1,
-1.304373, 1.996022, -0.2308349, 1, 0.5647059, 0, 1,
-1.303375, -0.5002671, -1.416056, 1, 0.5686275, 0, 1,
-1.294977, -1.115961, -1.585989, 1, 0.5764706, 0, 1,
-1.293822, 1.366406, -2.242307, 1, 0.5803922, 0, 1,
-1.289982, -0.5620216, -1.795548, 1, 0.5882353, 0, 1,
-1.282049, -2.615473, -3.02949, 1, 0.5921569, 0, 1,
-1.273705, -0.3521217, -1.636941, 1, 0.6, 0, 1,
-1.273284, 0.8295108, -0.9506125, 1, 0.6078432, 0, 1,
-1.25811, -0.3401524, -1.293585, 1, 0.6117647, 0, 1,
-1.245008, -1.342075, -0.1397596, 1, 0.6196079, 0, 1,
-1.241175, 1.816175, -0.6118794, 1, 0.6235294, 0, 1,
-1.23518, 0.2722661, 0.6765097, 1, 0.6313726, 0, 1,
-1.21816, 0.7133224, -0.7267935, 1, 0.6352941, 0, 1,
-1.218073, 0.3645314, -1.640742, 1, 0.6431373, 0, 1,
-1.203583, -0.5306495, -2.950394, 1, 0.6470588, 0, 1,
-1.200756, 0.2526155, -1.844371, 1, 0.654902, 0, 1,
-1.194718, -1.315043, -1.668355, 1, 0.6588235, 0, 1,
-1.192333, 1.180989, -0.843823, 1, 0.6666667, 0, 1,
-1.186365, 1.031156, -0.856223, 1, 0.6705883, 0, 1,
-1.179661, -0.7608027, -2.370392, 1, 0.6784314, 0, 1,
-1.177959, -0.04545782, -1.227377, 1, 0.682353, 0, 1,
-1.176017, 1.181624, -0.4566537, 1, 0.6901961, 0, 1,
-1.174183, -0.07039946, -1.880599, 1, 0.6941177, 0, 1,
-1.164503, -0.7313414, -2.071532, 1, 0.7019608, 0, 1,
-1.163557, -1.581365, -0.6492962, 1, 0.7098039, 0, 1,
-1.157289, 1.449691, 0.2383842, 1, 0.7137255, 0, 1,
-1.156488, -0.3509563, -2.28309, 1, 0.7215686, 0, 1,
-1.145649, 0.4391436, -0.2101255, 1, 0.7254902, 0, 1,
-1.143142, 0.4798975, 0.2652912, 1, 0.7333333, 0, 1,
-1.140551, -1.006559, -1.13477, 1, 0.7372549, 0, 1,
-1.138914, 1.222681, 0.6973388, 1, 0.7450981, 0, 1,
-1.135192, 0.6320448, -0.3447312, 1, 0.7490196, 0, 1,
-1.133571, 1.125298, -1.766227, 1, 0.7568628, 0, 1,
-1.131889, -0.4526978, -3.548317, 1, 0.7607843, 0, 1,
-1.129473, 0.5375965, -3.226786, 1, 0.7686275, 0, 1,
-1.126094, -1.19959, -1.865377, 1, 0.772549, 0, 1,
-1.12153, 1.264445, -0.3251109, 1, 0.7803922, 0, 1,
-1.120365, -0.4966798, -2.556124, 1, 0.7843137, 0, 1,
-1.120047, -0.1491764, -0.5703231, 1, 0.7921569, 0, 1,
-1.109539, 1.053976, -0.3000424, 1, 0.7960784, 0, 1,
-1.1093, -2.823076, -3.070616, 1, 0.8039216, 0, 1,
-1.097294, -0.5490901, -1.516665, 1, 0.8117647, 0, 1,
-1.095776, -0.7831009, -3.332989, 1, 0.8156863, 0, 1,
-1.088608, -0.1312523, -0.79037, 1, 0.8235294, 0, 1,
-1.087956, 1.47203, -1.308843, 1, 0.827451, 0, 1,
-1.079675, -0.9535854, -2.328855, 1, 0.8352941, 0, 1,
-1.078494, -0.4427293, -3.382063, 1, 0.8392157, 0, 1,
-1.07364, -0.4425791, -2.150748, 1, 0.8470588, 0, 1,
-1.06813, -0.8067805, -1.360642, 1, 0.8509804, 0, 1,
-1.060635, 0.1762952, -1.68013, 1, 0.8588235, 0, 1,
-1.055063, 0.5847384, 0.629205, 1, 0.8627451, 0, 1,
-1.052046, -0.08627153, -0.8525912, 1, 0.8705882, 0, 1,
-1.040327, 0.8087795, -1.796632, 1, 0.8745098, 0, 1,
-1.039088, -0.5595182, -0.09052713, 1, 0.8823529, 0, 1,
-1.029211, -0.3975147, -1.545861, 1, 0.8862745, 0, 1,
-1.024736, -1.425913, -1.893617, 1, 0.8941177, 0, 1,
-1.024198, 0.1383519, -0.6170192, 1, 0.8980392, 0, 1,
-1.02307, 0.5746159, -1.70797, 1, 0.9058824, 0, 1,
-1.009622, 1.392474, -1.02745, 1, 0.9137255, 0, 1,
-1.008543, 1.091477, -0.2695367, 1, 0.9176471, 0, 1,
-1.006828, -1.794761, -2.20194, 1, 0.9254902, 0, 1,
-1.006506, -0.2442497, 0.5704571, 1, 0.9294118, 0, 1,
-1.005144, -1.392234, -1.98616, 1, 0.9372549, 0, 1,
-1.002271, -0.2177583, -1.580598, 1, 0.9411765, 0, 1,
-1.00024, 1.004144, 0.7480943, 1, 0.9490196, 0, 1,
-1.000087, 0.1861442, -1.719852, 1, 0.9529412, 0, 1,
-0.9924913, 0.1494122, -1.355107, 1, 0.9607843, 0, 1,
-0.9919086, -0.1362514, -1.305539, 1, 0.9647059, 0, 1,
-0.9863106, 0.3100352, -2.472357, 1, 0.972549, 0, 1,
-0.9817013, -1.133807, -2.787697, 1, 0.9764706, 0, 1,
-0.9815307, 0.3590519, -0.729732, 1, 0.9843137, 0, 1,
-0.9804625, 0.4231992, -1.071416, 1, 0.9882353, 0, 1,
-0.9767524, -0.4437147, -2.190353, 1, 0.9960784, 0, 1,
-0.9746854, -1.342829, -3.475998, 0.9960784, 1, 0, 1,
-0.9547958, 0.9208948, -0.6244623, 0.9921569, 1, 0, 1,
-0.9538542, 0.1461636, -0.1295271, 0.9843137, 1, 0, 1,
-0.9493555, -0.000939592, -0.9970273, 0.9803922, 1, 0, 1,
-0.9440869, 0.2954509, -1.295678, 0.972549, 1, 0, 1,
-0.9392033, -0.269674, 0.01089979, 0.9686275, 1, 0, 1,
-0.9343916, -0.2089004, -2.360227, 0.9607843, 1, 0, 1,
-0.9288087, 1.920324, -1.599768, 0.9568627, 1, 0, 1,
-0.925063, -0.6007038, -2.803523, 0.9490196, 1, 0, 1,
-0.9228622, 0.8408963, -0.1232262, 0.945098, 1, 0, 1,
-0.9213679, 0.06776147, -2.692824, 0.9372549, 1, 0, 1,
-0.9173906, 0.2713677, -1.297537, 0.9333333, 1, 0, 1,
-0.9065436, -0.05792842, -1.595127, 0.9254902, 1, 0, 1,
-0.8971381, -0.8834991, -1.68463, 0.9215686, 1, 0, 1,
-0.8951847, -0.178174, -0.7408936, 0.9137255, 1, 0, 1,
-0.894332, -1.453832, -3.249688, 0.9098039, 1, 0, 1,
-0.8916817, -1.327222, -3.146413, 0.9019608, 1, 0, 1,
-0.8798234, -0.6767598, -1.788854, 0.8941177, 1, 0, 1,
-0.8747496, 0.002059543, -1.649385, 0.8901961, 1, 0, 1,
-0.8709212, -1.298537, -2.254188, 0.8823529, 1, 0, 1,
-0.867994, 0.2939456, -1.931502, 0.8784314, 1, 0, 1,
-0.8669152, 0.1516425, -1.084965, 0.8705882, 1, 0, 1,
-0.8542475, -1.781019, -0.9744753, 0.8666667, 1, 0, 1,
-0.8531961, -0.1858242, -3.26586, 0.8588235, 1, 0, 1,
-0.8526023, -1.010629, -1.838183, 0.854902, 1, 0, 1,
-0.8518777, 2.347289, -0.5091742, 0.8470588, 1, 0, 1,
-0.8469706, -0.6017919, -0.5228522, 0.8431373, 1, 0, 1,
-0.8370286, -0.6268674, -2.116892, 0.8352941, 1, 0, 1,
-0.8342583, 0.9604526, 0.2926468, 0.8313726, 1, 0, 1,
-0.8341554, 0.3443, -1.287245, 0.8235294, 1, 0, 1,
-0.8341129, -0.6336035, -1.834137, 0.8196079, 1, 0, 1,
-0.8337356, 0.8559902, -0.01629687, 0.8117647, 1, 0, 1,
-0.8328765, 0.8744265, -1.468175, 0.8078431, 1, 0, 1,
-0.8323768, 0.1329059, -0.06801045, 0.8, 1, 0, 1,
-0.8280489, 0.4579095, -0.6338836, 0.7921569, 1, 0, 1,
-0.8278759, 0.3758255, -0.6675146, 0.7882353, 1, 0, 1,
-0.81241, -1.622389, -3.080525, 0.7803922, 1, 0, 1,
-0.8083901, -2.033942, -3.940779, 0.7764706, 1, 0, 1,
-0.8050421, -0.08824643, -1.526207, 0.7686275, 1, 0, 1,
-0.8021278, -2.167317, -2.9401, 0.7647059, 1, 0, 1,
-0.7999279, -0.2160634, -2.466996, 0.7568628, 1, 0, 1,
-0.7988094, -0.06380716, -1.979321, 0.7529412, 1, 0, 1,
-0.7921931, -0.09010674, 0.1159891, 0.7450981, 1, 0, 1,
-0.7855686, 0.5316507, -0.7373298, 0.7411765, 1, 0, 1,
-0.7842865, 0.585144, 0.283921, 0.7333333, 1, 0, 1,
-0.7822465, 1.766496, -1.002752, 0.7294118, 1, 0, 1,
-0.7820652, -0.9595456, -1.287487, 0.7215686, 1, 0, 1,
-0.7812552, -0.3854817, -1.288002, 0.7176471, 1, 0, 1,
-0.7744272, 0.8999233, -0.05382167, 0.7098039, 1, 0, 1,
-0.7721911, 1.89612, -1.862855, 0.7058824, 1, 0, 1,
-0.7703183, 0.3579134, 0.1344693, 0.6980392, 1, 0, 1,
-0.7668216, -0.6389902, -3.636884, 0.6901961, 1, 0, 1,
-0.7653219, -0.1864405, -1.308588, 0.6862745, 1, 0, 1,
-0.7574984, -0.5895482, -3.298913, 0.6784314, 1, 0, 1,
-0.7570286, -1.16801, -2.513692, 0.6745098, 1, 0, 1,
-0.7535507, 0.1350835, -3.291337, 0.6666667, 1, 0, 1,
-0.751969, 0.4586966, -1.209334, 0.6627451, 1, 0, 1,
-0.7469606, -1.733688, -2.516573, 0.654902, 1, 0, 1,
-0.7456528, 0.3370671, -3.23964, 0.6509804, 1, 0, 1,
-0.743366, 0.07087891, -1.627903, 0.6431373, 1, 0, 1,
-0.7431872, 0.6471825, -1.544606, 0.6392157, 1, 0, 1,
-0.7356279, -2.69003, -3.254793, 0.6313726, 1, 0, 1,
-0.7341985, 0.2012302, -3.607025, 0.627451, 1, 0, 1,
-0.7332528, 0.9156811, -0.3411813, 0.6196079, 1, 0, 1,
-0.7329613, -1.061582, -1.109365, 0.6156863, 1, 0, 1,
-0.731361, -2.247773, -3.381304, 0.6078432, 1, 0, 1,
-0.7289827, 0.08741852, -2.791625, 0.6039216, 1, 0, 1,
-0.7169468, -0.6472351, -2.493709, 0.5960785, 1, 0, 1,
-0.7112507, -0.9450582, -1.20265, 0.5882353, 1, 0, 1,
-0.7101214, -1.111175, -3.903644, 0.5843138, 1, 0, 1,
-0.7097902, 0.36053, -1.322933, 0.5764706, 1, 0, 1,
-0.7053993, -1.485061, -3.244311, 0.572549, 1, 0, 1,
-0.7052235, 0.8960065, 0.1732165, 0.5647059, 1, 0, 1,
-0.7040231, -1.163315, -2.011541, 0.5607843, 1, 0, 1,
-0.7021376, -0.4056983, -2.201318, 0.5529412, 1, 0, 1,
-0.7019904, 1.054604, 0.2223769, 0.5490196, 1, 0, 1,
-0.6940945, 0.8112668, -1.126795, 0.5411765, 1, 0, 1,
-0.6922176, -0.6113914, -2.278654, 0.5372549, 1, 0, 1,
-0.6915876, 1.690015, 0.6882532, 0.5294118, 1, 0, 1,
-0.6821629, -0.09437764, -1.866706, 0.5254902, 1, 0, 1,
-0.6820011, 0.03771219, -2.065772, 0.5176471, 1, 0, 1,
-0.6774997, -1.024089, -3.249892, 0.5137255, 1, 0, 1,
-0.6700123, 1.557388, -1.718474, 0.5058824, 1, 0, 1,
-0.6627505, -0.6626042, -2.011698, 0.5019608, 1, 0, 1,
-0.6579375, -1.626549, -1.677342, 0.4941176, 1, 0, 1,
-0.6512285, -0.3960197, -2.258545, 0.4862745, 1, 0, 1,
-0.6504818, 1.106994, -0.9513944, 0.4823529, 1, 0, 1,
-0.6497716, 0.6953291, -0.1343636, 0.4745098, 1, 0, 1,
-0.6492185, 0.5840317, -0.163961, 0.4705882, 1, 0, 1,
-0.6479976, -2.191085, -3.033657, 0.4627451, 1, 0, 1,
-0.6463881, 0.5155318, -0.6802093, 0.4588235, 1, 0, 1,
-0.6454755, -0.8215325, -1.923792, 0.4509804, 1, 0, 1,
-0.640528, 0.6820711, -1.803898, 0.4470588, 1, 0, 1,
-0.6362913, 0.09797099, 0.4570822, 0.4392157, 1, 0, 1,
-0.6349119, -0.4927089, -1.750429, 0.4352941, 1, 0, 1,
-0.6348345, 0.1915299, -0.3920952, 0.427451, 1, 0, 1,
-0.6339899, -0.2695394, -3.444725, 0.4235294, 1, 0, 1,
-0.6247272, -0.7223982, -3.261185, 0.4156863, 1, 0, 1,
-0.6242564, -0.09543668, -3.348777, 0.4117647, 1, 0, 1,
-0.6204864, -0.5312862, -2.756164, 0.4039216, 1, 0, 1,
-0.6069955, 0.5989299, -0.8963346, 0.3960784, 1, 0, 1,
-0.6044372, -0.1130423, -1.896012, 0.3921569, 1, 0, 1,
-0.5991912, 1.014783, -1.006969, 0.3843137, 1, 0, 1,
-0.5986775, -1.020902, -2.752005, 0.3803922, 1, 0, 1,
-0.5973743, -0.9110276, -3.760914, 0.372549, 1, 0, 1,
-0.5965167, -0.267475, -2.381447, 0.3686275, 1, 0, 1,
-0.5963256, 2.390703, 0.9020587, 0.3607843, 1, 0, 1,
-0.5902891, 0.006852555, -1.787141, 0.3568628, 1, 0, 1,
-0.5800073, 0.9791526, -0.3815288, 0.3490196, 1, 0, 1,
-0.5779318, 0.3775321, -0.7507051, 0.345098, 1, 0, 1,
-0.5778689, -0.04089565, -1.167892, 0.3372549, 1, 0, 1,
-0.5742164, -1.527047, -2.535037, 0.3333333, 1, 0, 1,
-0.5719725, 1.41009, 0.7043325, 0.3254902, 1, 0, 1,
-0.5702994, -0.6876477, -3.10008, 0.3215686, 1, 0, 1,
-0.5687792, 0.06346946, -2.071448, 0.3137255, 1, 0, 1,
-0.5673698, -1.292418, -4.781665, 0.3098039, 1, 0, 1,
-0.5662204, 0.7251438, -2.03705, 0.3019608, 1, 0, 1,
-0.5641798, 0.1969497, -0.8711182, 0.2941177, 1, 0, 1,
-0.5607916, 2.23622, -1.329333, 0.2901961, 1, 0, 1,
-0.5578952, -0.1585346, -0.4885315, 0.282353, 1, 0, 1,
-0.5574138, -1.189786, -3.147726, 0.2784314, 1, 0, 1,
-0.5570472, -0.4692845, -2.166356, 0.2705882, 1, 0, 1,
-0.5561374, -0.2103405, -3.455975, 0.2666667, 1, 0, 1,
-0.5548161, 0.2948619, -0.621614, 0.2588235, 1, 0, 1,
-0.5544511, 0.6901224, -0.9156418, 0.254902, 1, 0, 1,
-0.5538649, 1.032473, 1.568092, 0.2470588, 1, 0, 1,
-0.5484509, -0.0760559, -2.035455, 0.2431373, 1, 0, 1,
-0.5451305, 0.4721274, 0.6845757, 0.2352941, 1, 0, 1,
-0.5437605, 0.301189, -2.090749, 0.2313726, 1, 0, 1,
-0.5364669, -1.169857, -4.13611, 0.2235294, 1, 0, 1,
-0.5346381, -0.04040712, -1.789468, 0.2196078, 1, 0, 1,
-0.5301712, 0.5348421, -0.5226224, 0.2117647, 1, 0, 1,
-0.5284005, 0.2720222, -0.4347259, 0.2078431, 1, 0, 1,
-0.5266614, -0.3806874, -0.8079216, 0.2, 1, 0, 1,
-0.5181651, 0.02438615, -1.355894, 0.1921569, 1, 0, 1,
-0.5181442, -0.4689651, -3.255612, 0.1882353, 1, 0, 1,
-0.5180088, 1.512025, -2.531414, 0.1803922, 1, 0, 1,
-0.5099969, -0.4604748, -3.003116, 0.1764706, 1, 0, 1,
-0.5081537, -0.2166223, -1.754925, 0.1686275, 1, 0, 1,
-0.5073229, 0.9183672, 0.8267843, 0.1647059, 1, 0, 1,
-0.5017883, -0.5660419, 0.002165765, 0.1568628, 1, 0, 1,
-0.5002401, -1.281498, -1.93462, 0.1529412, 1, 0, 1,
-0.4969288, -0.119108, -1.408101, 0.145098, 1, 0, 1,
-0.4961278, 0.948244, -0.3357378, 0.1411765, 1, 0, 1,
-0.4876644, 1.477821, 0.22316, 0.1333333, 1, 0, 1,
-0.4867519, 1.448176, 0.1705382, 0.1294118, 1, 0, 1,
-0.4844866, 1.651523, 1.33815, 0.1215686, 1, 0, 1,
-0.4832569, -0.2669622, -2.204393, 0.1176471, 1, 0, 1,
-0.4807831, -0.4166477, -1.044394, 0.1098039, 1, 0, 1,
-0.479652, 0.08971825, -2.157506, 0.1058824, 1, 0, 1,
-0.4749984, -0.238248, -3.050015, 0.09803922, 1, 0, 1,
-0.4744475, -1.988795, -1.848307, 0.09019608, 1, 0, 1,
-0.4715544, 1.073557, -1.889626, 0.08627451, 1, 0, 1,
-0.4699085, -0.1940273, -2.951518, 0.07843138, 1, 0, 1,
-0.467299, -0.8843888, -3.788625, 0.07450981, 1, 0, 1,
-0.4583132, -1.095687, -2.877519, 0.06666667, 1, 0, 1,
-0.4537829, 0.8190733, -0.9438661, 0.0627451, 1, 0, 1,
-0.4520961, -0.3119907, -2.934993, 0.05490196, 1, 0, 1,
-0.4514568, 1.5411, 1.251071, 0.05098039, 1, 0, 1,
-0.4487265, -0.9166023, -4.305305, 0.04313726, 1, 0, 1,
-0.4486427, -0.3981371, -3.037033, 0.03921569, 1, 0, 1,
-0.4470795, 0.4662719, -1.335609, 0.03137255, 1, 0, 1,
-0.4463246, -0.5893116, -2.377555, 0.02745098, 1, 0, 1,
-0.4441392, -0.4698088, -3.418955, 0.01960784, 1, 0, 1,
-0.4370207, 0.169306, 0.1893618, 0.01568628, 1, 0, 1,
-0.4351071, -0.9237649, -2.041733, 0.007843138, 1, 0, 1,
-0.4340189, 0.05491796, -2.383536, 0.003921569, 1, 0, 1,
-0.4327225, -0.08936039, -2.6361, 0, 1, 0.003921569, 1,
-0.4243948, 1.143099, -1.186836, 0, 1, 0.01176471, 1,
-0.4200978, -0.001021874, -1.42515, 0, 1, 0.01568628, 1,
-0.4200423, -0.05195875, -1.215841, 0, 1, 0.02352941, 1,
-0.4180888, 0.04596551, -1.617527, 0, 1, 0.02745098, 1,
-0.4180446, -0.7739582, -4.486931, 0, 1, 0.03529412, 1,
-0.4170005, -0.2609555, -1.712893, 0, 1, 0.03921569, 1,
-0.415716, 0.2437065, -1.864814, 0, 1, 0.04705882, 1,
-0.41139, 1.266609, 0.492043, 0, 1, 0.05098039, 1,
-0.4101764, 1.187873, 0.2342197, 0, 1, 0.05882353, 1,
-0.4055645, 1.118647, -0.1390899, 0, 1, 0.0627451, 1,
-0.4050695, 0.4163562, -1.355374, 0, 1, 0.07058824, 1,
-0.402759, -0.2780182, -1.981202, 0, 1, 0.07450981, 1,
-0.402404, 0.855781, -1.055844, 0, 1, 0.08235294, 1,
-0.4016178, -2.351216, -2.036958, 0, 1, 0.08627451, 1,
-0.4009018, 0.01441564, -2.735795, 0, 1, 0.09411765, 1,
-0.4006277, 0.2526602, -0.8878874, 0, 1, 0.1019608, 1,
-0.3997714, -0.3699119, -2.187643, 0, 1, 0.1058824, 1,
-0.3967321, -0.2263667, -2.394361, 0, 1, 0.1137255, 1,
-0.3934286, -0.05449451, -0.6364587, 0, 1, 0.1176471, 1,
-0.3913735, -0.4864113, -3.896569, 0, 1, 0.1254902, 1,
-0.3912404, -1.017814, -3.092853, 0, 1, 0.1294118, 1,
-0.3890153, 0.6579407, -1.770782, 0, 1, 0.1372549, 1,
-0.3878673, -1.737033, -2.63602, 0, 1, 0.1411765, 1,
-0.3876482, -0.0262791, -1.71023, 0, 1, 0.1490196, 1,
-0.3862726, 0.4710842, -2.861351, 0, 1, 0.1529412, 1,
-0.3858904, -1.316891, -2.88731, 0, 1, 0.1607843, 1,
-0.3854418, -1.079275, -3.118419, 0, 1, 0.1647059, 1,
-0.3839546, 0.5034046, -2.864043, 0, 1, 0.172549, 1,
-0.3801583, 0.2893862, 0.3045077, 0, 1, 0.1764706, 1,
-0.3747574, 1.184555, 0.9229499, 0, 1, 0.1843137, 1,
-0.3736976, -0.5182766, -1.53843, 0, 1, 0.1882353, 1,
-0.3716358, -1.016347, -3.245967, 0, 1, 0.1960784, 1,
-0.3668365, 0.7557048, 0.2905305, 0, 1, 0.2039216, 1,
-0.3662499, 1.039321, -0.494148, 0, 1, 0.2078431, 1,
-0.3650515, -1.319585, -1.583577, 0, 1, 0.2156863, 1,
-0.3620043, 1.487189, -1.261382, 0, 1, 0.2196078, 1,
-0.3609669, 0.06290559, -1.423711, 0, 1, 0.227451, 1,
-0.358468, -0.2549558, -0.8120059, 0, 1, 0.2313726, 1,
-0.3527084, 0.1038288, -0.9041169, 0, 1, 0.2392157, 1,
-0.348874, 0.1665861, -0.8922579, 0, 1, 0.2431373, 1,
-0.3380868, -0.08903272, -3.579283, 0, 1, 0.2509804, 1,
-0.3376068, 0.6626357, -2.326091, 0, 1, 0.254902, 1,
-0.3343153, 1.836885, 0.7435015, 0, 1, 0.2627451, 1,
-0.3308759, -1.654681, -2.716933, 0, 1, 0.2666667, 1,
-0.3189794, -0.4462515, -2.486419, 0, 1, 0.2745098, 1,
-0.3169363, -0.05786693, -1.672129, 0, 1, 0.2784314, 1,
-0.3138597, 1.524506, 2.148972, 0, 1, 0.2862745, 1,
-0.3130051, 0.1558463, -1.907761, 0, 1, 0.2901961, 1,
-0.3106119, -0.443412, -1.291729, 0, 1, 0.2980392, 1,
-0.3070967, 0.4499891, -1.808505, 0, 1, 0.3058824, 1,
-0.3069876, 0.1180477, -3.771835, 0, 1, 0.3098039, 1,
-0.3061125, -0.9892486, -2.315388, 0, 1, 0.3176471, 1,
-0.3033023, -0.8241814, -4.24412, 0, 1, 0.3215686, 1,
-0.2971371, -0.1221015, -1.545132, 0, 1, 0.3294118, 1,
-0.2896036, 0.9122681, 0.6041353, 0, 1, 0.3333333, 1,
-0.2890393, 0.8013915, -1.227275, 0, 1, 0.3411765, 1,
-0.2865907, -0.8774896, -4.144095, 0, 1, 0.345098, 1,
-0.2854203, -0.416181, -0.9091909, 0, 1, 0.3529412, 1,
-0.2814569, 0.7794558, 0.1943774, 0, 1, 0.3568628, 1,
-0.2808007, 3.04291, -0.03508846, 0, 1, 0.3647059, 1,
-0.2805271, -1.352895, -3.357959, 0, 1, 0.3686275, 1,
-0.2747309, -0.5451655, -2.436804, 0, 1, 0.3764706, 1,
-0.2732135, -1.460801, -3.275445, 0, 1, 0.3803922, 1,
-0.2729967, -0.824581, -3.800437, 0, 1, 0.3882353, 1,
-0.2720286, -0.2115151, -3.692447, 0, 1, 0.3921569, 1,
-0.2623034, 0.4183919, 1.026224, 0, 1, 0.4, 1,
-0.2560299, 1.021056, 2.456156, 0, 1, 0.4078431, 1,
-0.2554463, -0.1663606, -0.7026076, 0, 1, 0.4117647, 1,
-0.2546887, -0.4235467, -1.341508, 0, 1, 0.4196078, 1,
-0.2546434, 0.9571826, 0.1742457, 0, 1, 0.4235294, 1,
-0.2540163, -0.4143218, -2.894956, 0, 1, 0.4313726, 1,
-0.2490704, 0.4291809, -0.2351822, 0, 1, 0.4352941, 1,
-0.2420882, -0.1418725, -1.444674, 0, 1, 0.4431373, 1,
-0.2400034, 0.2176515, -1.838026, 0, 1, 0.4470588, 1,
-0.2362214, -0.8276728, -2.661873, 0, 1, 0.454902, 1,
-0.2311933, 0.2762797, -0.7305055, 0, 1, 0.4588235, 1,
-0.2306509, -3.068575, -2.782681, 0, 1, 0.4666667, 1,
-0.2285348, -0.6067157, -2.465007, 0, 1, 0.4705882, 1,
-0.225991, 0.2271397, 0.325119, 0, 1, 0.4784314, 1,
-0.2241288, 1.497422, -0.6992251, 0, 1, 0.4823529, 1,
-0.2178461, -0.3110551, -1.793064, 0, 1, 0.4901961, 1,
-0.2173414, 0.8219066, 0.5211067, 0, 1, 0.4941176, 1,
-0.2154928, -1.502838, -1.716016, 0, 1, 0.5019608, 1,
-0.2135761, 0.244435, -1.560583, 0, 1, 0.509804, 1,
-0.2116517, -0.4160168, -2.58952, 0, 1, 0.5137255, 1,
-0.2095314, 1.766405, -1.0332, 0, 1, 0.5215687, 1,
-0.2094216, 0.03841964, -0.1583638, 0, 1, 0.5254902, 1,
-0.2042929, 0.502543, 0.06964625, 0, 1, 0.5333334, 1,
-0.2018522, 1.67377, -1.361731, 0, 1, 0.5372549, 1,
-0.2008564, -1.059723, -4.438662, 0, 1, 0.5450981, 1,
-0.1961049, -0.009425341, -1.20356, 0, 1, 0.5490196, 1,
-0.1950652, -0.01252683, -0.7200078, 0, 1, 0.5568628, 1,
-0.1916816, -0.427699, -4.964052, 0, 1, 0.5607843, 1,
-0.1765915, -0.1585812, -2.737413, 0, 1, 0.5686275, 1,
-0.1752715, 0.03157516, -1.405812, 0, 1, 0.572549, 1,
-0.1723135, 0.6930843, -0.2351858, 0, 1, 0.5803922, 1,
-0.171567, -1.671282, -2.531953, 0, 1, 0.5843138, 1,
-0.1709944, 0.02245777, -0.6496992, 0, 1, 0.5921569, 1,
-0.1695846, -0.8886928, -3.41793, 0, 1, 0.5960785, 1,
-0.1670341, 1.472964, 0.2012707, 0, 1, 0.6039216, 1,
-0.1664744, 0.1828028, -0.4818246, 0, 1, 0.6117647, 1,
-0.1656149, 0.2032762, -2.401644, 0, 1, 0.6156863, 1,
-0.1651351, -1.075645, -1.911497, 0, 1, 0.6235294, 1,
-0.1613136, -0.2820506, -3.258317, 0, 1, 0.627451, 1,
-0.1597078, 2.030233, 0.03532598, 0, 1, 0.6352941, 1,
-0.1516931, -0.8400877, -2.646247, 0, 1, 0.6392157, 1,
-0.1494973, -0.1210317, -2.554109, 0, 1, 0.6470588, 1,
-0.1491647, -0.1857266, -2.091669, 0, 1, 0.6509804, 1,
-0.1475546, -0.06799626, -1.654761, 0, 1, 0.6588235, 1,
-0.1473945, -0.3337658, -3.288521, 0, 1, 0.6627451, 1,
-0.1458057, -0.5576715, -3.844852, 0, 1, 0.6705883, 1,
-0.1424015, -0.4683847, -2.510384, 0, 1, 0.6745098, 1,
-0.1420513, -0.5570349, -2.851424, 0, 1, 0.682353, 1,
-0.1365187, -0.1077415, -2.184412, 0, 1, 0.6862745, 1,
-0.1358736, 1.640071, -0.7556752, 0, 1, 0.6941177, 1,
-0.1347989, 1.662923, -1.138213, 0, 1, 0.7019608, 1,
-0.134389, 1.045345, -0.9143286, 0, 1, 0.7058824, 1,
-0.128203, 0.07063022, -3.071941, 0, 1, 0.7137255, 1,
-0.1227124, 1.846229, 0.4337419, 0, 1, 0.7176471, 1,
-0.1226277, -1.698327, -2.071775, 0, 1, 0.7254902, 1,
-0.1199086, -1.675824, -3.979498, 0, 1, 0.7294118, 1,
-0.1174618, -1.211665, -1.122953, 0, 1, 0.7372549, 1,
-0.1161349, -0.05084569, -3.64139, 0, 1, 0.7411765, 1,
-0.1156816, 1.084261, -0.3654761, 0, 1, 0.7490196, 1,
-0.1152612, 0.8726936, -0.6833891, 0, 1, 0.7529412, 1,
-0.1151477, 1.184615, -1.059864, 0, 1, 0.7607843, 1,
-0.1066243, 1.456668, 0.580721, 0, 1, 0.7647059, 1,
-0.1028555, -0.5770731, -4.742439, 0, 1, 0.772549, 1,
-0.1018869, 2.264676, 0.5210763, 0, 1, 0.7764706, 1,
-0.1000683, 0.6565618, -1.090893, 0, 1, 0.7843137, 1,
-0.09995968, 1.410009, -1.765929, 0, 1, 0.7882353, 1,
-0.09821431, 0.06243292, 0.2094783, 0, 1, 0.7960784, 1,
-0.09781685, -0.1245872, -2.267197, 0, 1, 0.8039216, 1,
-0.08382649, -0.7918375, -2.849922, 0, 1, 0.8078431, 1,
-0.08224122, 0.1917506, 0.3912723, 0, 1, 0.8156863, 1,
-0.08114055, -0.209034, -2.123548, 0, 1, 0.8196079, 1,
-0.08098853, -0.08633213, -1.706398, 0, 1, 0.827451, 1,
-0.08023236, -0.5624717, -3.954037, 0, 1, 0.8313726, 1,
-0.07705917, 1.332866, -1.044708, 0, 1, 0.8392157, 1,
-0.07059772, -1.212593, -3.919467, 0, 1, 0.8431373, 1,
-0.06664438, 0.2335986, 2.251617, 0, 1, 0.8509804, 1,
-0.06153783, 0.02009249, -2.255154, 0, 1, 0.854902, 1,
-0.06146577, 0.3424331, -1.027089, 0, 1, 0.8627451, 1,
-0.06118439, 0.01997556, -1.387169, 0, 1, 0.8666667, 1,
-0.06087325, -0.4779482, -3.006695, 0, 1, 0.8745098, 1,
-0.0510464, 0.2986284, 0.4333467, 0, 1, 0.8784314, 1,
-0.05023148, 0.1635842, 0.2352272, 0, 1, 0.8862745, 1,
-0.04850137, -0.1524894, -2.460778, 0, 1, 0.8901961, 1,
-0.04840773, 0.9295192, -2.014826, 0, 1, 0.8980392, 1,
-0.04483915, -1.95548, -3.259916, 0, 1, 0.9058824, 1,
-0.04459567, 2.278735, -1.135013, 0, 1, 0.9098039, 1,
-0.04233684, -0.05916091, -3.074095, 0, 1, 0.9176471, 1,
-0.04075479, -0.5910397, -3.155556, 0, 1, 0.9215686, 1,
-0.03408909, 0.4330232, 1.799322, 0, 1, 0.9294118, 1,
-0.03047774, 0.2647642, -0.5863585, 0, 1, 0.9333333, 1,
-0.02742454, -0.557117, -2.07464, 0, 1, 0.9411765, 1,
-0.02059064, -1.647476, -4.092426, 0, 1, 0.945098, 1,
-0.02042648, -1.051775, -1.72465, 0, 1, 0.9529412, 1,
-0.02010354, 0.6871181, -0.9396523, 0, 1, 0.9568627, 1,
-0.004478462, 1.36074, 1.221224, 0, 1, 0.9647059, 1,
-0.002158598, -0.2534288, -2.877704, 0, 1, 0.9686275, 1,
-0.001262467, -0.6903612, -4.814709, 0, 1, 0.9764706, 1,
-0.0009062645, 0.08754013, 2.333427, 0, 1, 0.9803922, 1,
0.001428518, -0.04148006, 5.160544, 0, 1, 0.9882353, 1,
0.004259992, 1.547573, -0.5708486, 0, 1, 0.9921569, 1,
0.005261051, -0.2933807, 1.604532, 0, 1, 1, 1,
0.005557469, -0.4665195, 3.337977, 0, 0.9921569, 1, 1,
0.007363541, 0.9910043, -1.640483, 0, 0.9882353, 1, 1,
0.009057258, 0.4761511, 0.183548, 0, 0.9803922, 1, 1,
0.01705636, -1.274199, 3.305161, 0, 0.9764706, 1, 1,
0.02036613, -1.474093, 3.453136, 0, 0.9686275, 1, 1,
0.02327295, 0.1316059, -0.8384059, 0, 0.9647059, 1, 1,
0.03157074, 1.882271, -0.8267343, 0, 0.9568627, 1, 1,
0.03218564, 1.085168, 0.03342149, 0, 0.9529412, 1, 1,
0.03533338, -2.261425, 3.396043, 0, 0.945098, 1, 1,
0.03720871, -1.345095, 2.096611, 0, 0.9411765, 1, 1,
0.03778613, -0.1853112, 1.053658, 0, 0.9333333, 1, 1,
0.04024119, 0.8140052, -0.6730629, 0, 0.9294118, 1, 1,
0.04067467, 0.2402408, 1.163829, 0, 0.9215686, 1, 1,
0.04386549, -0.7135174, 2.518883, 0, 0.9176471, 1, 1,
0.0443976, 0.3446083, 0.7382244, 0, 0.9098039, 1, 1,
0.04786848, 1.579832, -0.6343412, 0, 0.9058824, 1, 1,
0.05014442, 0.06666897, 0.6133774, 0, 0.8980392, 1, 1,
0.05035937, 0.415432, 0.1680918, 0, 0.8901961, 1, 1,
0.05112513, 0.2937318, -0.599414, 0, 0.8862745, 1, 1,
0.06604388, -1.592154, 2.865591, 0, 0.8784314, 1, 1,
0.066691, 2.36675, 0.4014506, 0, 0.8745098, 1, 1,
0.06686672, 0.8226293, 0.08567034, 0, 0.8666667, 1, 1,
0.07078633, 0.01073899, 3.16492, 0, 0.8627451, 1, 1,
0.07117333, -0.02167233, 1.646228, 0, 0.854902, 1, 1,
0.07320352, 1.502843, -1.93553, 0, 0.8509804, 1, 1,
0.07523582, 0.1399078, 0.08976172, 0, 0.8431373, 1, 1,
0.07634365, -0.800123, 1.959147, 0, 0.8392157, 1, 1,
0.07964239, 3.068571, 0.6666885, 0, 0.8313726, 1, 1,
0.08060197, -0.03065407, 2.315128, 0, 0.827451, 1, 1,
0.0809883, -0.1074669, 1.091654, 0, 0.8196079, 1, 1,
0.08367751, 0.1920387, -0.1188826, 0, 0.8156863, 1, 1,
0.09099998, -0.862218, 3.098075, 0, 0.8078431, 1, 1,
0.0945325, 0.3380065, -1.739815, 0, 0.8039216, 1, 1,
0.1017904, -0.03457943, 0.4636394, 0, 0.7960784, 1, 1,
0.1035192, 1.168058, -0.1783255, 0, 0.7882353, 1, 1,
0.105115, -0.8978347, 2.608586, 0, 0.7843137, 1, 1,
0.1054852, -0.5429621, 2.650928, 0, 0.7764706, 1, 1,
0.1071963, -0.09068094, 2.277368, 0, 0.772549, 1, 1,
0.108096, 0.5940979, 0.6592945, 0, 0.7647059, 1, 1,
0.1092674, -0.1927938, 3.417815, 0, 0.7607843, 1, 1,
0.1112766, 0.2970175, 0.5042847, 0, 0.7529412, 1, 1,
0.1137684, -0.09843633, 1.525342, 0, 0.7490196, 1, 1,
0.1225079, -1.282191, 2.509998, 0, 0.7411765, 1, 1,
0.1236689, 1.482955, 0.4153529, 0, 0.7372549, 1, 1,
0.127108, -1.931044, 2.845773, 0, 0.7294118, 1, 1,
0.127993, -0.1592157, 3.007729, 0, 0.7254902, 1, 1,
0.1316906, -1.299544, 4.03125, 0, 0.7176471, 1, 1,
0.1332154, 0.5661511, 0.3225588, 0, 0.7137255, 1, 1,
0.1346928, 0.2543868, -1.683519, 0, 0.7058824, 1, 1,
0.141647, -0.5668228, 2.643389, 0, 0.6980392, 1, 1,
0.1428526, -0.3424338, 2.62247, 0, 0.6941177, 1, 1,
0.1435752, -0.7720582, 1.265749, 0, 0.6862745, 1, 1,
0.1501312, -1.601806, 2.677668, 0, 0.682353, 1, 1,
0.1527264, -0.1612357, 1.40603, 0, 0.6745098, 1, 1,
0.1552772, -0.8296628, 3.71296, 0, 0.6705883, 1, 1,
0.1573082, 0.3549947, 1.787617, 0, 0.6627451, 1, 1,
0.1615563, -0.003235188, 2.012422, 0, 0.6588235, 1, 1,
0.1695981, 1.143109, -0.575471, 0, 0.6509804, 1, 1,
0.1737215, -1.507999, 2.697948, 0, 0.6470588, 1, 1,
0.1779828, 0.3709443, 2.903595, 0, 0.6392157, 1, 1,
0.1836599, -0.1904278, 3.280287, 0, 0.6352941, 1, 1,
0.184588, -0.5629997, -0.03006739, 0, 0.627451, 1, 1,
0.1871745, -0.3810762, 2.237719, 0, 0.6235294, 1, 1,
0.1890161, -0.4855125, 3.697853, 0, 0.6156863, 1, 1,
0.1931392, 0.2457455, 1.878414, 0, 0.6117647, 1, 1,
0.2012651, -2.2411, 3.26711, 0, 0.6039216, 1, 1,
0.204404, 0.1014706, 1.810615, 0, 0.5960785, 1, 1,
0.2050884, -0.1722045, 2.6225, 0, 0.5921569, 1, 1,
0.2065683, -0.1406551, 2.986182, 0, 0.5843138, 1, 1,
0.2098594, -0.6111606, 2.162092, 0, 0.5803922, 1, 1,
0.2109338, 0.2856663, 3.817965, 0, 0.572549, 1, 1,
0.2109575, 0.822345, 0.5456412, 0, 0.5686275, 1, 1,
0.2136411, -1.403126, 3.089784, 0, 0.5607843, 1, 1,
0.21394, -0.3147547, 2.114677, 0, 0.5568628, 1, 1,
0.2149117, -0.5275271, 4.560954, 0, 0.5490196, 1, 1,
0.2149142, -0.5310637, 1.441549, 0, 0.5450981, 1, 1,
0.2191706, 1.407783, -0.9568075, 0, 0.5372549, 1, 1,
0.2203727, 0.5928571, -0.7360663, 0, 0.5333334, 1, 1,
0.2270993, 1.004987, 0.9786789, 0, 0.5254902, 1, 1,
0.2296774, 0.1624634, 1.935212, 0, 0.5215687, 1, 1,
0.230402, -0.7524384, 3.760531, 0, 0.5137255, 1, 1,
0.2344208, -1.240498, 2.21372, 0, 0.509804, 1, 1,
0.2350851, -1.018158, 3.356162, 0, 0.5019608, 1, 1,
0.2383059, -0.4978579, 4.065189, 0, 0.4941176, 1, 1,
0.2386059, 0.4077974, 1.506771, 0, 0.4901961, 1, 1,
0.2389393, 0.07209513, 2.337562, 0, 0.4823529, 1, 1,
0.2436919, -0.2064935, 1.326526, 0, 0.4784314, 1, 1,
0.2445424, 0.8552048, -0.8248519, 0, 0.4705882, 1, 1,
0.2488446, 0.2513331, -0.2197708, 0, 0.4666667, 1, 1,
0.2491885, 0.209105, 2.038015, 0, 0.4588235, 1, 1,
0.2532035, -0.2645247, 1.296896, 0, 0.454902, 1, 1,
0.2538709, 0.2164347, 1.483221, 0, 0.4470588, 1, 1,
0.2567622, -0.4046727, 2.502582, 0, 0.4431373, 1, 1,
0.2580395, -0.2402293, 2.500305, 0, 0.4352941, 1, 1,
0.2582433, -0.2388737, 2.776211, 0, 0.4313726, 1, 1,
0.2643599, -0.4754014, 2.181225, 0, 0.4235294, 1, 1,
0.2652103, -0.7141128, 3.570206, 0, 0.4196078, 1, 1,
0.2675364, -0.470444, 3.047353, 0, 0.4117647, 1, 1,
0.2713954, 0.4402248, 0.6021879, 0, 0.4078431, 1, 1,
0.2715573, -0.8133997, 2.416857, 0, 0.4, 1, 1,
0.2767422, 1.634267, -0.981855, 0, 0.3921569, 1, 1,
0.2791831, -0.01928253, 1.076694, 0, 0.3882353, 1, 1,
0.2813301, 0.9295571, -0.1069958, 0, 0.3803922, 1, 1,
0.2820966, -1.600622, 3.108446, 0, 0.3764706, 1, 1,
0.2826982, 1.067115, 0.1376548, 0, 0.3686275, 1, 1,
0.2841289, 0.3192134, -0.03029666, 0, 0.3647059, 1, 1,
0.2908691, 0.07551645, 1.739615, 0, 0.3568628, 1, 1,
0.2921802, -1.300789, 3.868954, 0, 0.3529412, 1, 1,
0.2962203, 0.7091383, 2.129539, 0, 0.345098, 1, 1,
0.299643, -0.05426155, 0.9347805, 0, 0.3411765, 1, 1,
0.300095, -0.4442742, 2.918404, 0, 0.3333333, 1, 1,
0.3016495, -0.05834787, 2.479354, 0, 0.3294118, 1, 1,
0.303425, 0.8732209, -0.8195034, 0, 0.3215686, 1, 1,
0.3063022, 1.008864, 0.980561, 0, 0.3176471, 1, 1,
0.3071429, -1.063002, 2.531021, 0, 0.3098039, 1, 1,
0.3076836, 0.4350726, -1.067242, 0, 0.3058824, 1, 1,
0.3097655, -2.691184, 2.553755, 0, 0.2980392, 1, 1,
0.3109538, -0.6501282, 0.322162, 0, 0.2901961, 1, 1,
0.311518, 0.7490056, -1.215826, 0, 0.2862745, 1, 1,
0.3116123, -1.063844, 3.083129, 0, 0.2784314, 1, 1,
0.3119204, -0.2508187, 1.629629, 0, 0.2745098, 1, 1,
0.3129383, 0.1216915, 2.572516, 0, 0.2666667, 1, 1,
0.3132972, -0.1522835, 1.687004, 0, 0.2627451, 1, 1,
0.3140315, 0.4969223, 2.086098, 0, 0.254902, 1, 1,
0.3162135, -0.3434493, 3.548892, 0, 0.2509804, 1, 1,
0.3198034, -0.2247015, -0.238346, 0, 0.2431373, 1, 1,
0.3200718, -1.107134, 3.493143, 0, 0.2392157, 1, 1,
0.3226492, 1.053776, 0.3225612, 0, 0.2313726, 1, 1,
0.3231191, 0.5935994, 0.7800918, 0, 0.227451, 1, 1,
0.3246866, 0.1434655, 2.002775, 0, 0.2196078, 1, 1,
0.3269762, -2.077944, 3.915485, 0, 0.2156863, 1, 1,
0.3357525, -0.6389738, 1.519224, 0, 0.2078431, 1, 1,
0.3369226, -0.3238183, 2.295558, 0, 0.2039216, 1, 1,
0.3377453, -0.3752314, 2.576869, 0, 0.1960784, 1, 1,
0.3389939, 0.04307504, 1.155704, 0, 0.1882353, 1, 1,
0.3405547, 1.520892, 0.6443747, 0, 0.1843137, 1, 1,
0.343785, -0.821223, 4.099955, 0, 0.1764706, 1, 1,
0.344933, 2.977207, -0.6243538, 0, 0.172549, 1, 1,
0.347607, 0.3537023, 0.3504851, 0, 0.1647059, 1, 1,
0.348592, -1.1973, 3.196468, 0, 0.1607843, 1, 1,
0.3554807, -0.5687872, 3.004885, 0, 0.1529412, 1, 1,
0.3554819, -0.6832802, 3.209731, 0, 0.1490196, 1, 1,
0.3560231, 0.5553472, -0.3213829, 0, 0.1411765, 1, 1,
0.3564266, 0.64148, 1.5292, 0, 0.1372549, 1, 1,
0.3576865, 1.705065, 0.2007386, 0, 0.1294118, 1, 1,
0.363438, -0.5344577, 2.658441, 0, 0.1254902, 1, 1,
0.3638736, -0.5258291, 1.877408, 0, 0.1176471, 1, 1,
0.3643792, -0.8603728, 2.151468, 0, 0.1137255, 1, 1,
0.3677295, 2.099696, 0.2494585, 0, 0.1058824, 1, 1,
0.3729205, 1.447917, 0.2855697, 0, 0.09803922, 1, 1,
0.3772095, -0.4044923, 3.48779, 0, 0.09411765, 1, 1,
0.3818366, -0.4679568, 3.290603, 0, 0.08627451, 1, 1,
0.3845938, -0.02767178, 0.7852834, 0, 0.08235294, 1, 1,
0.3874497, -0.2302191, 3.186342, 0, 0.07450981, 1, 1,
0.391388, 0.7716168, 1.471764, 0, 0.07058824, 1, 1,
0.3917232, -0.1024067, 1.805652, 0, 0.0627451, 1, 1,
0.3927096, 0.3711313, -1.070656, 0, 0.05882353, 1, 1,
0.3954182, -2.054468, 2.645375, 0, 0.05098039, 1, 1,
0.3958003, 0.9226092, 0.8965873, 0, 0.04705882, 1, 1,
0.3972485, 0.2001102, 1.518914, 0, 0.03921569, 1, 1,
0.3979134, 0.7883713, 0.3598151, 0, 0.03529412, 1, 1,
0.4058962, -0.6026989, 3.729494, 0, 0.02745098, 1, 1,
0.4068918, 0.2274336, 0.3477256, 0, 0.02352941, 1, 1,
0.4076058, 0.3255041, 0.02096274, 0, 0.01568628, 1, 1,
0.4098035, 0.180075, 0.2820595, 0, 0.01176471, 1, 1,
0.4123118, 0.5822323, 1.569324, 0, 0.003921569, 1, 1,
0.4124211, -0.07962212, 0.6779588, 0.003921569, 0, 1, 1,
0.4175858, 0.8313417, -0.03967199, 0.007843138, 0, 1, 1,
0.4186169, -0.5443608, 2.256102, 0.01568628, 0, 1, 1,
0.4187932, -0.1446049, 3.539054, 0.01960784, 0, 1, 1,
0.4225492, 1.52301, -2.591369, 0.02745098, 0, 1, 1,
0.4233537, 0.2524029, 0.7608099, 0.03137255, 0, 1, 1,
0.4248034, 0.9034679, 0.3053759, 0.03921569, 0, 1, 1,
0.4250775, -0.5302221, 3.491803, 0.04313726, 0, 1, 1,
0.4252552, -0.2436729, 0.414811, 0.05098039, 0, 1, 1,
0.4287069, -1.216492, 2.038841, 0.05490196, 0, 1, 1,
0.4308502, 1.235249, -0.7165889, 0.0627451, 0, 1, 1,
0.4316162, -0.1736979, 1.899209, 0.06666667, 0, 1, 1,
0.4325512, -0.8950812, 2.317545, 0.07450981, 0, 1, 1,
0.4388175, -1.287925, 3.740525, 0.07843138, 0, 1, 1,
0.4427285, 1.23766, 1.252309, 0.08627451, 0, 1, 1,
0.4449584, 2.276529, -1.380715, 0.09019608, 0, 1, 1,
0.4490596, -0.4524681, 2.401986, 0.09803922, 0, 1, 1,
0.4531161, -1.154293, 3.29632, 0.1058824, 0, 1, 1,
0.4542107, -0.1971608, 2.12416, 0.1098039, 0, 1, 1,
0.4547186, -0.5273254, 1.112947, 0.1176471, 0, 1, 1,
0.4634078, -2.926094, 3.255832, 0.1215686, 0, 1, 1,
0.4648567, 1.382069, 0.9986326, 0.1294118, 0, 1, 1,
0.4718018, -0.627229, 1.589956, 0.1333333, 0, 1, 1,
0.4721448, 1.026679, -0.5351962, 0.1411765, 0, 1, 1,
0.4723536, 1.554174, -0.6452296, 0.145098, 0, 1, 1,
0.4725817, 0.07519717, 0.3785059, 0.1529412, 0, 1, 1,
0.4740214, 0.1178204, 1.516313, 0.1568628, 0, 1, 1,
0.4751665, -0.6739222, 1.342355, 0.1647059, 0, 1, 1,
0.4779969, -1.493055, 4.366127, 0.1686275, 0, 1, 1,
0.4804993, -0.09206787, 3.249301, 0.1764706, 0, 1, 1,
0.4836832, 0.06879137, 1.186795, 0.1803922, 0, 1, 1,
0.4856752, -0.03053833, 0.6160493, 0.1882353, 0, 1, 1,
0.4865131, 0.7807017, 1.163051, 0.1921569, 0, 1, 1,
0.491514, -0.1958717, 1.141454, 0.2, 0, 1, 1,
0.4949257, -1.515902, 3.524651, 0.2078431, 0, 1, 1,
0.5063127, -1.316354, 1.825363, 0.2117647, 0, 1, 1,
0.5127603, 0.07623552, 2.821445, 0.2196078, 0, 1, 1,
0.5131541, -0.1185578, 2.761004, 0.2235294, 0, 1, 1,
0.5133362, 1.083835, 1.552882, 0.2313726, 0, 1, 1,
0.5146047, -2.689804, 5.865023, 0.2352941, 0, 1, 1,
0.5163827, 0.4852183, 0.3997063, 0.2431373, 0, 1, 1,
0.5190649, 0.727227, 0.3518327, 0.2470588, 0, 1, 1,
0.5233284, -0.8697246, 2.39908, 0.254902, 0, 1, 1,
0.5243718, 0.320879, 2.093788, 0.2588235, 0, 1, 1,
0.5272831, 0.2679078, 1.72439, 0.2666667, 0, 1, 1,
0.528052, 1.156521, 0.22233, 0.2705882, 0, 1, 1,
0.5362089, -0.6781784, 1.599398, 0.2784314, 0, 1, 1,
0.5367414, 0.416589, 0.7132828, 0.282353, 0, 1, 1,
0.5417172, -1.845644, 1.068231, 0.2901961, 0, 1, 1,
0.5418727, -0.6078256, 2.455797, 0.2941177, 0, 1, 1,
0.5477998, -0.3346798, 3.228397, 0.3019608, 0, 1, 1,
0.5482892, -1.800134, 3.161804, 0.3098039, 0, 1, 1,
0.5485934, -0.1484966, 2.957326, 0.3137255, 0, 1, 1,
0.5521979, -0.1325964, 0.5367698, 0.3215686, 0, 1, 1,
0.5545154, 0.2386899, 2.935865, 0.3254902, 0, 1, 1,
0.5550172, -0.8093695, 3.307991, 0.3333333, 0, 1, 1,
0.5626721, 1.703711, -1.541732, 0.3372549, 0, 1, 1,
0.5637738, -0.2512845, 1.186075, 0.345098, 0, 1, 1,
0.564114, -0.6231898, 2.448891, 0.3490196, 0, 1, 1,
0.5680087, 0.1260469, 0.9013302, 0.3568628, 0, 1, 1,
0.5680263, 0.7895166, -0.255688, 0.3607843, 0, 1, 1,
0.5691096, -0.3253607, 4.240829, 0.3686275, 0, 1, 1,
0.5707688, 0.1616711, 0.5034097, 0.372549, 0, 1, 1,
0.5716556, -0.4752698, 3.550881, 0.3803922, 0, 1, 1,
0.5738586, -0.05000506, 4.114333, 0.3843137, 0, 1, 1,
0.5796497, -0.7972251, 1.637331, 0.3921569, 0, 1, 1,
0.584439, -0.7398849, 1.554499, 0.3960784, 0, 1, 1,
0.5902597, 0.104269, 1.269788, 0.4039216, 0, 1, 1,
0.5907525, 2.198211, 0.632967, 0.4117647, 0, 1, 1,
0.593005, 0.05629957, 2.101743, 0.4156863, 0, 1, 1,
0.596782, -0.4369487, 0.7319858, 0.4235294, 0, 1, 1,
0.6002201, 0.8909792, 0.8292787, 0.427451, 0, 1, 1,
0.6027856, -0.902536, 2.652788, 0.4352941, 0, 1, 1,
0.6033531, 1.038713, 1.201081, 0.4392157, 0, 1, 1,
0.6057456, 0.4189715, -0.8150963, 0.4470588, 0, 1, 1,
0.6098036, -0.5758829, 3.953339, 0.4509804, 0, 1, 1,
0.6114836, 1.337254, 0.727939, 0.4588235, 0, 1, 1,
0.6134865, -1.138988, 2.925397, 0.4627451, 0, 1, 1,
0.6224864, -0.05942409, 1.892253, 0.4705882, 0, 1, 1,
0.6231077, 0.007137319, 0.6654571, 0.4745098, 0, 1, 1,
0.6315152, 1.142574, 0.2145541, 0.4823529, 0, 1, 1,
0.6333676, 0.7449991, 0.6322253, 0.4862745, 0, 1, 1,
0.6438803, 0.2194117, 0.8176877, 0.4941176, 0, 1, 1,
0.6446213, 0.8993309, 1.165512, 0.5019608, 0, 1, 1,
0.6494213, -1.911556, 1.690479, 0.5058824, 0, 1, 1,
0.6595834, 1.099602, 2.033349, 0.5137255, 0, 1, 1,
0.6610279, -3.136961, 2.210514, 0.5176471, 0, 1, 1,
0.6616053, 0.4053023, 1.551389, 0.5254902, 0, 1, 1,
0.6619792, -0.0131769, 2.217812, 0.5294118, 0, 1, 1,
0.6691348, 0.04308543, 3.052655, 0.5372549, 0, 1, 1,
0.6703851, 0.2735449, 0.9716598, 0.5411765, 0, 1, 1,
0.671733, -2.066195, 2.82271, 0.5490196, 0, 1, 1,
0.6726491, -1.228019, 1.720601, 0.5529412, 0, 1, 1,
0.6762691, 0.3474399, 1.526059, 0.5607843, 0, 1, 1,
0.6840293, 1.998764, 1.685315, 0.5647059, 0, 1, 1,
0.6850321, 1.773218, 0.6712489, 0.572549, 0, 1, 1,
0.6871682, -0.1133774, 1.111902, 0.5764706, 0, 1, 1,
0.7061131, 0.171935, 3.006631, 0.5843138, 0, 1, 1,
0.7068179, 0.3274945, 0.9954852, 0.5882353, 0, 1, 1,
0.7097206, 1.321891, -0.2964515, 0.5960785, 0, 1, 1,
0.7122633, -0.8951805, 2.278352, 0.6039216, 0, 1, 1,
0.716315, -0.7634091, 3.17714, 0.6078432, 0, 1, 1,
0.7235404, -0.04751538, 3.769739, 0.6156863, 0, 1, 1,
0.7312957, 0.493365, 1.509081, 0.6196079, 0, 1, 1,
0.73283, 1.090697, 0.9068119, 0.627451, 0, 1, 1,
0.7333868, -0.3223569, 2.357516, 0.6313726, 0, 1, 1,
0.7481343, -0.1146352, 0.948159, 0.6392157, 0, 1, 1,
0.7496969, -0.8044346, 2.295846, 0.6431373, 0, 1, 1,
0.757499, 0.07164875, -0.1965893, 0.6509804, 0, 1, 1,
0.7585552, 0.9898292, -0.3695992, 0.654902, 0, 1, 1,
0.758872, -0.1221639, 0.4699697, 0.6627451, 0, 1, 1,
0.7607793, 0.07472086, 2.04474, 0.6666667, 0, 1, 1,
0.7667598, -0.5254225, 2.701543, 0.6745098, 0, 1, 1,
0.7671775, -1.504855, 1.247731, 0.6784314, 0, 1, 1,
0.7698643, -0.7534822, 1.950626, 0.6862745, 0, 1, 1,
0.7722883, -1.32598, 1.486184, 0.6901961, 0, 1, 1,
0.7727786, 1.53505, 0.63084, 0.6980392, 0, 1, 1,
0.7760777, 0.0001890229, 0.151409, 0.7058824, 0, 1, 1,
0.7763436, 1.165062, 1.123724, 0.7098039, 0, 1, 1,
0.7835979, 0.9826742, 0.2262216, 0.7176471, 0, 1, 1,
0.7860706, 1.181042, 0.1441804, 0.7215686, 0, 1, 1,
0.7867773, -0.9649907, 2.448633, 0.7294118, 0, 1, 1,
0.790544, -1.515175, 1.335364, 0.7333333, 0, 1, 1,
0.7925074, 0.8498976, -1.119567, 0.7411765, 0, 1, 1,
0.8026447, 0.1409664, 1.769582, 0.7450981, 0, 1, 1,
0.811011, -0.7236487, 3.870088, 0.7529412, 0, 1, 1,
0.8161061, -1.465444, 2.443062, 0.7568628, 0, 1, 1,
0.8212296, -0.03449815, 3.531511, 0.7647059, 0, 1, 1,
0.8217893, -0.2791257, 2.395545, 0.7686275, 0, 1, 1,
0.8248897, 0.3520798, 0.4417619, 0.7764706, 0, 1, 1,
0.8257133, 1.344841, 0.3683325, 0.7803922, 0, 1, 1,
0.8345906, -1.392516, 2.842559, 0.7882353, 0, 1, 1,
0.8390313, -0.8435045, 1.249917, 0.7921569, 0, 1, 1,
0.8423547, 0.4882863, 1.601715, 0.8, 0, 1, 1,
0.8429013, 0.4625266, 0.8709458, 0.8078431, 0, 1, 1,
0.8448575, 2.484516, -0.297844, 0.8117647, 0, 1, 1,
0.8458022, -0.03916894, 0.5926127, 0.8196079, 0, 1, 1,
0.8464802, -0.3742438, 3.239735, 0.8235294, 0, 1, 1,
0.8592566, -1.342528, 3.182867, 0.8313726, 0, 1, 1,
0.8606486, 0.471177, 0.4698886, 0.8352941, 0, 1, 1,
0.8672986, -0.784991, 2.449464, 0.8431373, 0, 1, 1,
0.871337, 0.7656953, 2.861587, 0.8470588, 0, 1, 1,
0.8809119, -0.4124073, 1.493149, 0.854902, 0, 1, 1,
0.8863767, 0.3159269, 1.377828, 0.8588235, 0, 1, 1,
0.888506, -0.9345975, 2.19457, 0.8666667, 0, 1, 1,
0.8920584, -0.05119642, 0.6121274, 0.8705882, 0, 1, 1,
0.8950987, 0.8926887, -0.446069, 0.8784314, 0, 1, 1,
0.8953134, -0.5382584, 3.896424, 0.8823529, 0, 1, 1,
0.8988022, 0.4818725, 2.517988, 0.8901961, 0, 1, 1,
0.9020602, -0.326124, 0.8658358, 0.8941177, 0, 1, 1,
0.9077628, 1.271422, 2.699685, 0.9019608, 0, 1, 1,
0.9100536, -1.633949, 0.5505546, 0.9098039, 0, 1, 1,
0.9165766, 0.4673921, 0.9271819, 0.9137255, 0, 1, 1,
0.919464, -0.1913777, 2.783347, 0.9215686, 0, 1, 1,
0.9202055, 0.6425884, 0.4634834, 0.9254902, 0, 1, 1,
0.9212991, -0.4024041, 1.872461, 0.9333333, 0, 1, 1,
0.9254146, -1.054697, 2.310616, 0.9372549, 0, 1, 1,
0.927175, 1.373869, 0.9009107, 0.945098, 0, 1, 1,
0.9315959, -0.1427007, 1.555086, 0.9490196, 0, 1, 1,
0.9318123, -0.04150594, 1.376787, 0.9568627, 0, 1, 1,
0.9331527, -0.6075771, 1.446083, 0.9607843, 0, 1, 1,
0.9363646, 0.3088818, 0.771758, 0.9686275, 0, 1, 1,
0.9386228, 0.0945515, 0.3972888, 0.972549, 0, 1, 1,
0.9441158, -1.276042, 1.99393, 0.9803922, 0, 1, 1,
0.9463339, -0.2712567, 1.322713, 0.9843137, 0, 1, 1,
0.9468845, -0.4000209, 4.259265, 0.9921569, 0, 1, 1,
0.9505091, 0.812265, 0.08361218, 0.9960784, 0, 1, 1,
0.9507633, -1.055209, 4.918426, 1, 0, 0.9960784, 1,
0.9532984, -0.4424949, 1.719601, 1, 0, 0.9882353, 1,
0.9590127, 1.646541, 0.7256536, 1, 0, 0.9843137, 1,
0.9596146, -0.8531404, 2.907934, 1, 0, 0.9764706, 1,
0.9662932, 0.4091891, 0.2178645, 1, 0, 0.972549, 1,
0.9671783, -0.3305911, 2.885342, 1, 0, 0.9647059, 1,
0.9674089, -0.4313281, 2.598262, 1, 0, 0.9607843, 1,
0.9679379, -0.2110452, 1.378126, 1, 0, 0.9529412, 1,
0.9709731, -1.059762, 2.380663, 1, 0, 0.9490196, 1,
0.9900399, 1.142771, 1.028987, 1, 0, 0.9411765, 1,
1.0129, -0.6082234, 2.215405, 1, 0, 0.9372549, 1,
1.013172, -0.6385862, 0.8919277, 1, 0, 0.9294118, 1,
1.015491, 0.3818172, 2.975938, 1, 0, 0.9254902, 1,
1.017417, -0.6995439, 2.987861, 1, 0, 0.9176471, 1,
1.021655, -0.6342022, 2.055285, 1, 0, 0.9137255, 1,
1.028317, 0.3207483, 0.7206877, 1, 0, 0.9058824, 1,
1.028905, -1.201482, 3.080425, 1, 0, 0.9019608, 1,
1.038724, 0.6863187, 0.2402446, 1, 0, 0.8941177, 1,
1.042351, 1.053457, 0.6402625, 1, 0, 0.8862745, 1,
1.049938, -0.9867849, 3.020084, 1, 0, 0.8823529, 1,
1.060074, 0.4394408, 1.170965, 1, 0, 0.8745098, 1,
1.062254, -3.398645, 3.372835, 1, 0, 0.8705882, 1,
1.064449, 0.9357898, 1.910836, 1, 0, 0.8627451, 1,
1.067502, 0.8265563, 3.720483, 1, 0, 0.8588235, 1,
1.069973, -1.036238, 2.870175, 1, 0, 0.8509804, 1,
1.072696, -0.1940423, 2.942073, 1, 0, 0.8470588, 1,
1.07411, 0.765796, 3.17457, 1, 0, 0.8392157, 1,
1.076916, 0.5472693, 2.934843, 1, 0, 0.8352941, 1,
1.082531, -0.2112648, -0.02828802, 1, 0, 0.827451, 1,
1.095701, 1.77966, -0.1635363, 1, 0, 0.8235294, 1,
1.097524, -1.692713, 1.981709, 1, 0, 0.8156863, 1,
1.099826, 1.321834, 1.400158, 1, 0, 0.8117647, 1,
1.110696, -0.7072292, 0.9947461, 1, 0, 0.8039216, 1,
1.112828, -1.850125, 1.88981, 1, 0, 0.7960784, 1,
1.113468, 0.8297201, -1.675568, 1, 0, 0.7921569, 1,
1.12424, 1.390743, 0.1663361, 1, 0, 0.7843137, 1,
1.133775, -0.2470974, 1.440512, 1, 0, 0.7803922, 1,
1.140138, -0.6649595, 2.157129, 1, 0, 0.772549, 1,
1.143806, -2.345549, 1.799283, 1, 0, 0.7686275, 1,
1.144919, 0.4185179, 0.7205044, 1, 0, 0.7607843, 1,
1.165745, 1.360285, 0.4888976, 1, 0, 0.7568628, 1,
1.167555, -0.8313183, 1.290604, 1, 0, 0.7490196, 1,
1.177755, 0.1402948, 0.970557, 1, 0, 0.7450981, 1,
1.177815, -2.431139, 1.61468, 1, 0, 0.7372549, 1,
1.178247, -0.3889332, 1.676297, 1, 0, 0.7333333, 1,
1.179038, -0.6302487, 2.403135, 1, 0, 0.7254902, 1,
1.179169, 0.8061393, 1.539479, 1, 0, 0.7215686, 1,
1.181318, -1.065305, 2.127681, 1, 0, 0.7137255, 1,
1.189759, 0.7703421, 1.947992, 1, 0, 0.7098039, 1,
1.193656, -1.799968, 1.287272, 1, 0, 0.7019608, 1,
1.194583, -0.9335814, 3.718445, 1, 0, 0.6941177, 1,
1.200256, -0.7301978, 1.689143, 1, 0, 0.6901961, 1,
1.205201, -3.35762, 3.425079, 1, 0, 0.682353, 1,
1.205873, 0.9915065, 1.45364, 1, 0, 0.6784314, 1,
1.21601, 0.747049, -0.6520221, 1, 0, 0.6705883, 1,
1.216792, 1.518902, 1.266315, 1, 0, 0.6666667, 1,
1.223151, 0.9183002, 1.944771, 1, 0, 0.6588235, 1,
1.225711, 0.7830993, 1.763675, 1, 0, 0.654902, 1,
1.22574, 0.1809151, 1.680731, 1, 0, 0.6470588, 1,
1.231197, -0.9722412, -0.0856233, 1, 0, 0.6431373, 1,
1.235652, -1.367081, 1.673834, 1, 0, 0.6352941, 1,
1.237091, -1.307844, 1.344902, 1, 0, 0.6313726, 1,
1.240025, -0.4599871, 2.97531, 1, 0, 0.6235294, 1,
1.2411, -0.8200447, 1.310489, 1, 0, 0.6196079, 1,
1.249089, -0.05615769, 0.8149091, 1, 0, 0.6117647, 1,
1.254564, -0.3094029, 1.813085, 1, 0, 0.6078432, 1,
1.263075, -0.6728002, 1.795835, 1, 0, 0.6, 1,
1.264958, 0.1554193, 3.265, 1, 0, 0.5921569, 1,
1.267905, -0.5423015, 2.426482, 1, 0, 0.5882353, 1,
1.269747, -0.1469508, 2.903383, 1, 0, 0.5803922, 1,
1.273554, 1.051347, -0.1144098, 1, 0, 0.5764706, 1,
1.292561, -0.7618384, 3.025884, 1, 0, 0.5686275, 1,
1.293238, -0.2520832, 2.000426, 1, 0, 0.5647059, 1,
1.295079, -0.660189, 1.782864, 1, 0, 0.5568628, 1,
1.307748, -0.4324178, 0.4960245, 1, 0, 0.5529412, 1,
1.310992, 1.048206, 0.7334681, 1, 0, 0.5450981, 1,
1.312245, -0.4290287, 2.416084, 1, 0, 0.5411765, 1,
1.313521, -0.004868125, 2.01738, 1, 0, 0.5333334, 1,
1.320995, -1.253097, 2.330698, 1, 0, 0.5294118, 1,
1.321887, -1.082545, 2.336231, 1, 0, 0.5215687, 1,
1.324075, -1.06752, 1.846428, 1, 0, 0.5176471, 1,
1.327659, -1.02504, 1.496037, 1, 0, 0.509804, 1,
1.328682, -0.7631527, 2.635207, 1, 0, 0.5058824, 1,
1.3292, 0.358941, 0.8896369, 1, 0, 0.4980392, 1,
1.345841, 0.5970892, 1.016027, 1, 0, 0.4901961, 1,
1.364522, 0.7588106, 1.510468, 1, 0, 0.4862745, 1,
1.369572, 1.137466, 1.24055, 1, 0, 0.4784314, 1,
1.37973, 1.721202, 2.15208, 1, 0, 0.4745098, 1,
1.381775, 0.4879427, 0.981252, 1, 0, 0.4666667, 1,
1.384629, 0.4647357, 1.366985, 1, 0, 0.4627451, 1,
1.420829, 1.610031, 1.89207, 1, 0, 0.454902, 1,
1.427952, -0.3402305, 4.276818, 1, 0, 0.4509804, 1,
1.431171, -0.7404595, 2.923169, 1, 0, 0.4431373, 1,
1.432869, 0.2942587, 3.061383, 1, 0, 0.4392157, 1,
1.441063, -0.3563475, 1.152025, 1, 0, 0.4313726, 1,
1.442267, -0.4516545, 1.843045, 1, 0, 0.427451, 1,
1.448051, -0.6747718, 1.919865, 1, 0, 0.4196078, 1,
1.460207, -0.6360962, 3.925571, 1, 0, 0.4156863, 1,
1.46299, -0.3702258, 1.952899, 1, 0, 0.4078431, 1,
1.468264, -0.3265452, 1.095684, 1, 0, 0.4039216, 1,
1.483149, -2.486942, 2.796972, 1, 0, 0.3960784, 1,
1.484543, 0.4990797, 0.4003527, 1, 0, 0.3882353, 1,
1.485022, -1.413897, 0.1830519, 1, 0, 0.3843137, 1,
1.490611, 1.902879, 0.8812122, 1, 0, 0.3764706, 1,
1.5084, -0.4913498, 1.598363, 1, 0, 0.372549, 1,
1.516883, 0.4028352, 0.6787131, 1, 0, 0.3647059, 1,
1.523058, 0.1121553, 1.08992, 1, 0, 0.3607843, 1,
1.524717, -0.3542411, 0.3756153, 1, 0, 0.3529412, 1,
1.544519, -0.09055258, 1.147736, 1, 0, 0.3490196, 1,
1.568562, -1.046073, 3.164977, 1, 0, 0.3411765, 1,
1.581971, 0.1193757, -0.1030306, 1, 0, 0.3372549, 1,
1.597203, 0.1378715, 1.200588, 1, 0, 0.3294118, 1,
1.599508, 0.3279037, 2.00932, 1, 0, 0.3254902, 1,
1.611558, 0.3657685, 2.095086, 1, 0, 0.3176471, 1,
1.616573, 0.9759654, 0.136764, 1, 0, 0.3137255, 1,
1.633361, -0.4081704, 1.94233, 1, 0, 0.3058824, 1,
1.635363, 0.8636906, 1.967753, 1, 0, 0.2980392, 1,
1.639067, -0.1287166, 2.05125, 1, 0, 0.2941177, 1,
1.640621, -1.59944, 1.810913, 1, 0, 0.2862745, 1,
1.662019, 0.5129544, 1.066725, 1, 0, 0.282353, 1,
1.662576, -0.5031978, 1.466731, 1, 0, 0.2745098, 1,
1.671542, -2.502508, 3.397746, 1, 0, 0.2705882, 1,
1.689538, 0.2756344, 1.813197, 1, 0, 0.2627451, 1,
1.690633, -0.2185218, 1.655903, 1, 0, 0.2588235, 1,
1.691326, 0.8907043, -0.1281153, 1, 0, 0.2509804, 1,
1.704077, 0.7893782, 0.4900976, 1, 0, 0.2470588, 1,
1.713237, -1.509234, 1.818713, 1, 0, 0.2392157, 1,
1.74862, 1.084908, 0.9398934, 1, 0, 0.2352941, 1,
1.77275, -1.187892, 3.816812, 1, 0, 0.227451, 1,
1.776532, 0.008846847, 0.7769774, 1, 0, 0.2235294, 1,
1.785349, 0.2929757, 2.301343, 1, 0, 0.2156863, 1,
1.79571, 1.330102, -0.8976868, 1, 0, 0.2117647, 1,
1.798926, 2.989192, -1.1731, 1, 0, 0.2039216, 1,
1.855515, -0.851371, 2.527858, 1, 0, 0.1960784, 1,
1.865721, 0.5954269, 1.660731, 1, 0, 0.1921569, 1,
1.904588, -1.525671, 2.818917, 1, 0, 0.1843137, 1,
1.916719, -0.8970776, 1.631322, 1, 0, 0.1803922, 1,
1.922356, 0.1706806, 2.688203, 1, 0, 0.172549, 1,
1.966101, -0.4764564, 2.103664, 1, 0, 0.1686275, 1,
1.979143, -0.2844651, 2.451914, 1, 0, 0.1607843, 1,
2.01405, -1.080876, 1.219135, 1, 0, 0.1568628, 1,
2.01526, -1.41986, 1.525123, 1, 0, 0.1490196, 1,
2.030954, -1.78615, 3.385003, 1, 0, 0.145098, 1,
2.048048, -0.8770539, 3.653099, 1, 0, 0.1372549, 1,
2.062523, 0.5460132, -0.1407737, 1, 0, 0.1333333, 1,
2.066084, 1.268862, 1.256843, 1, 0, 0.1254902, 1,
2.073713, -0.4236199, 2.06266, 1, 0, 0.1215686, 1,
2.103159, 0.3002736, 4.628469, 1, 0, 0.1137255, 1,
2.127519, 0.8060668, 2.689372, 1, 0, 0.1098039, 1,
2.141716, 1.320386, 2.583851, 1, 0, 0.1019608, 1,
2.176397, 0.5836686, -0.5538464, 1, 0, 0.09411765, 1,
2.188223, -0.2989051, 2.226612, 1, 0, 0.09019608, 1,
2.263496, 0.5751137, 0.5713679, 1, 0, 0.08235294, 1,
2.302047, 1.771137, 0.8737354, 1, 0, 0.07843138, 1,
2.313325, -0.5455428, 1.495431, 1, 0, 0.07058824, 1,
2.376344, 1.513467, -0.4625197, 1, 0, 0.06666667, 1,
2.399774, 0.9016634, 0.8258393, 1, 0, 0.05882353, 1,
2.442952, 0.01828401, 1.394226, 1, 0, 0.05490196, 1,
2.528486, 0.9368739, 0.1496576, 1, 0, 0.04705882, 1,
2.53744, 0.1852294, 1.39967, 1, 0, 0.04313726, 1,
2.648382, -0.5477298, 1.691087, 1, 0, 0.03529412, 1,
2.716534, 2.047921, -0.1957995, 1, 0, 0.03137255, 1,
2.732609, 0.4212426, 0.6250788, 1, 0, 0.02352941, 1,
2.837402, 1.064233, 0.9085578, 1, 0, 0.01960784, 1,
2.900373, -1.947986, 0.7918164, 1, 0, 0.01176471, 1,
2.967975, 1.747233, 1.737623, 1, 0, 0.007843138, 1
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
0.02697277, -4.494838, -6.79958, 0, -0.5, 0.5, 0.5,
0.02697277, -4.494838, -6.79958, 1, -0.5, 0.5, 0.5,
0.02697277, -4.494838, -6.79958, 1, 1.5, 0.5, 0.5,
0.02697277, -4.494838, -6.79958, 0, 1.5, 0.5, 0.5
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
-3.91103, -0.1650367, -6.79958, 0, -0.5, 0.5, 0.5,
-3.91103, -0.1650367, -6.79958, 1, -0.5, 0.5, 0.5,
-3.91103, -0.1650367, -6.79958, 1, 1.5, 0.5, 0.5,
-3.91103, -0.1650367, -6.79958, 0, 1.5, 0.5, 0.5
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
-3.91103, -4.494838, 0.4504855, 0, -0.5, 0.5, 0.5,
-3.91103, -4.494838, 0.4504855, 1, -0.5, 0.5, 0.5,
-3.91103, -4.494838, 0.4504855, 1, 1.5, 0.5, 0.5,
-3.91103, -4.494838, 0.4504855, 0, 1.5, 0.5, 0.5
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
-2, -3.495653, -5.126488,
2, -3.495653, -5.126488,
-2, -3.495653, -5.126488,
-2, -3.662184, -5.405336,
-1, -3.495653, -5.126488,
-1, -3.662184, -5.405336,
0, -3.495653, -5.126488,
0, -3.662184, -5.405336,
1, -3.495653, -5.126488,
1, -3.662184, -5.405336,
2, -3.495653, -5.126488,
2, -3.662184, -5.405336
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
-2, -3.995245, -5.963034, 0, -0.5, 0.5, 0.5,
-2, -3.995245, -5.963034, 1, -0.5, 0.5, 0.5,
-2, -3.995245, -5.963034, 1, 1.5, 0.5, 0.5,
-2, -3.995245, -5.963034, 0, 1.5, 0.5, 0.5,
-1, -3.995245, -5.963034, 0, -0.5, 0.5, 0.5,
-1, -3.995245, -5.963034, 1, -0.5, 0.5, 0.5,
-1, -3.995245, -5.963034, 1, 1.5, 0.5, 0.5,
-1, -3.995245, -5.963034, 0, 1.5, 0.5, 0.5,
0, -3.995245, -5.963034, 0, -0.5, 0.5, 0.5,
0, -3.995245, -5.963034, 1, -0.5, 0.5, 0.5,
0, -3.995245, -5.963034, 1, 1.5, 0.5, 0.5,
0, -3.995245, -5.963034, 0, 1.5, 0.5, 0.5,
1, -3.995245, -5.963034, 0, -0.5, 0.5, 0.5,
1, -3.995245, -5.963034, 1, -0.5, 0.5, 0.5,
1, -3.995245, -5.963034, 1, 1.5, 0.5, 0.5,
1, -3.995245, -5.963034, 0, 1.5, 0.5, 0.5,
2, -3.995245, -5.963034, 0, -0.5, 0.5, 0.5,
2, -3.995245, -5.963034, 1, -0.5, 0.5, 0.5,
2, -3.995245, -5.963034, 1, 1.5, 0.5, 0.5,
2, -3.995245, -5.963034, 0, 1.5, 0.5, 0.5
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
-3.00226, -3, -5.126488,
-3.00226, 3, -5.126488,
-3.00226, -3, -5.126488,
-3.153722, -3, -5.405336,
-3.00226, -2, -5.126488,
-3.153722, -2, -5.405336,
-3.00226, -1, -5.126488,
-3.153722, -1, -5.405336,
-3.00226, 0, -5.126488,
-3.153722, 0, -5.405336,
-3.00226, 1, -5.126488,
-3.153722, 1, -5.405336,
-3.00226, 2, -5.126488,
-3.153722, 2, -5.405336,
-3.00226, 3, -5.126488,
-3.153722, 3, -5.405336
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
-3.456645, -3, -5.963034, 0, -0.5, 0.5, 0.5,
-3.456645, -3, -5.963034, 1, -0.5, 0.5, 0.5,
-3.456645, -3, -5.963034, 1, 1.5, 0.5, 0.5,
-3.456645, -3, -5.963034, 0, 1.5, 0.5, 0.5,
-3.456645, -2, -5.963034, 0, -0.5, 0.5, 0.5,
-3.456645, -2, -5.963034, 1, -0.5, 0.5, 0.5,
-3.456645, -2, -5.963034, 1, 1.5, 0.5, 0.5,
-3.456645, -2, -5.963034, 0, 1.5, 0.5, 0.5,
-3.456645, -1, -5.963034, 0, -0.5, 0.5, 0.5,
-3.456645, -1, -5.963034, 1, -0.5, 0.5, 0.5,
-3.456645, -1, -5.963034, 1, 1.5, 0.5, 0.5,
-3.456645, -1, -5.963034, 0, 1.5, 0.5, 0.5,
-3.456645, 0, -5.963034, 0, -0.5, 0.5, 0.5,
-3.456645, 0, -5.963034, 1, -0.5, 0.5, 0.5,
-3.456645, 0, -5.963034, 1, 1.5, 0.5, 0.5,
-3.456645, 0, -5.963034, 0, 1.5, 0.5, 0.5,
-3.456645, 1, -5.963034, 0, -0.5, 0.5, 0.5,
-3.456645, 1, -5.963034, 1, -0.5, 0.5, 0.5,
-3.456645, 1, -5.963034, 1, 1.5, 0.5, 0.5,
-3.456645, 1, -5.963034, 0, 1.5, 0.5, 0.5,
-3.456645, 2, -5.963034, 0, -0.5, 0.5, 0.5,
-3.456645, 2, -5.963034, 1, -0.5, 0.5, 0.5,
-3.456645, 2, -5.963034, 1, 1.5, 0.5, 0.5,
-3.456645, 2, -5.963034, 0, 1.5, 0.5, 0.5,
-3.456645, 3, -5.963034, 0, -0.5, 0.5, 0.5,
-3.456645, 3, -5.963034, 1, -0.5, 0.5, 0.5,
-3.456645, 3, -5.963034, 1, 1.5, 0.5, 0.5,
-3.456645, 3, -5.963034, 0, 1.5, 0.5, 0.5
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
-3.00226, -3.495653, -4,
-3.00226, -3.495653, 4,
-3.00226, -3.495653, -4,
-3.153722, -3.662184, -4,
-3.00226, -3.495653, -2,
-3.153722, -3.662184, -2,
-3.00226, -3.495653, 0,
-3.153722, -3.662184, 0,
-3.00226, -3.495653, 2,
-3.153722, -3.662184, 2,
-3.00226, -3.495653, 4,
-3.153722, -3.662184, 4
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
-3.456645, -3.995245, -4, 0, -0.5, 0.5, 0.5,
-3.456645, -3.995245, -4, 1, -0.5, 0.5, 0.5,
-3.456645, -3.995245, -4, 1, 1.5, 0.5, 0.5,
-3.456645, -3.995245, -4, 0, 1.5, 0.5, 0.5,
-3.456645, -3.995245, -2, 0, -0.5, 0.5, 0.5,
-3.456645, -3.995245, -2, 1, -0.5, 0.5, 0.5,
-3.456645, -3.995245, -2, 1, 1.5, 0.5, 0.5,
-3.456645, -3.995245, -2, 0, 1.5, 0.5, 0.5,
-3.456645, -3.995245, 0, 0, -0.5, 0.5, 0.5,
-3.456645, -3.995245, 0, 1, -0.5, 0.5, 0.5,
-3.456645, -3.995245, 0, 1, 1.5, 0.5, 0.5,
-3.456645, -3.995245, 0, 0, 1.5, 0.5, 0.5,
-3.456645, -3.995245, 2, 0, -0.5, 0.5, 0.5,
-3.456645, -3.995245, 2, 1, -0.5, 0.5, 0.5,
-3.456645, -3.995245, 2, 1, 1.5, 0.5, 0.5,
-3.456645, -3.995245, 2, 0, 1.5, 0.5, 0.5,
-3.456645, -3.995245, 4, 0, -0.5, 0.5, 0.5,
-3.456645, -3.995245, 4, 1, -0.5, 0.5, 0.5,
-3.456645, -3.995245, 4, 1, 1.5, 0.5, 0.5,
-3.456645, -3.995245, 4, 0, 1.5, 0.5, 0.5
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
-3.00226, -3.495653, -5.126488,
-3.00226, 3.16558, -5.126488,
-3.00226, -3.495653, 6.027459,
-3.00226, 3.16558, 6.027459,
-3.00226, -3.495653, -5.126488,
-3.00226, -3.495653, 6.027459,
-3.00226, 3.16558, -5.126488,
-3.00226, 3.16558, 6.027459,
-3.00226, -3.495653, -5.126488,
3.056206, -3.495653, -5.126488,
-3.00226, -3.495653, 6.027459,
3.056206, -3.495653, 6.027459,
-3.00226, 3.16558, -5.126488,
3.056206, 3.16558, -5.126488,
-3.00226, 3.16558, 6.027459,
3.056206, 3.16558, 6.027459,
3.056206, -3.495653, -5.126488,
3.056206, 3.16558, -5.126488,
3.056206, -3.495653, 6.027459,
3.056206, 3.16558, 6.027459,
3.056206, -3.495653, -5.126488,
3.056206, -3.495653, 6.027459,
3.056206, 3.16558, -5.126488,
3.056206, 3.16558, 6.027459
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
var radius = 7.654524;
var distance = 34.05584;
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
mvMatrix.translate( -0.02697277, 0.1650367, -0.4504855 );
mvMatrix.scale( 1.366059, 1.242446, 0.7419994 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.05584);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
DCBN<-read.table("DCBN.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DCBN$V2
```

```
## Error in eval(expr, envir, enclos): object 'DCBN' not found
```

```r
y<-DCBN$V3
```

```
## Error in eval(expr, envir, enclos): object 'DCBN' not found
```

```r
z<-DCBN$V4
```

```
## Error in eval(expr, envir, enclos): object 'DCBN' not found
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
-2.91403, 0.1344896, -0.8914204, 0, 0, 1, 1, 1,
-2.882034, -0.635088, -1.461, 1, 0, 0, 1, 1,
-2.70951, 0.2026734, -0.569309, 1, 0, 0, 1, 1,
-2.674202, 1.409314, -3.171643, 1, 0, 0, 1, 1,
-2.592376, 0.7968646, -2.033587, 1, 0, 0, 1, 1,
-2.583138, 0.1012999, -2.575733, 1, 0, 0, 1, 1,
-2.452812, 0.1092734, -1.388827, 0, 0, 0, 1, 1,
-2.42343, -1.815928, -1.239815, 0, 0, 0, 1, 1,
-2.364976, 0.5851404, -2.632874, 0, 0, 0, 1, 1,
-2.355515, -0.1878849, -2.453717, 0, 0, 0, 1, 1,
-2.331703, -1.147301, -2.194772, 0, 0, 0, 1, 1,
-2.302639, 1.654441, -2.593634, 0, 0, 0, 1, 1,
-2.300578, -0.4536025, 0.933085, 0, 0, 0, 1, 1,
-2.264341, 1.273088, -1.037526, 1, 1, 1, 1, 1,
-2.25772, -0.6225064, -2.267014, 1, 1, 1, 1, 1,
-2.237405, -0.1695319, -3.01745, 1, 1, 1, 1, 1,
-2.234203, -0.413854, -2.056159, 1, 1, 1, 1, 1,
-2.207602, 2.641623, -2.033746, 1, 1, 1, 1, 1,
-2.181811, -0.5387939, -3.038045, 1, 1, 1, 1, 1,
-2.103774, 0.225464, -2.114992, 1, 1, 1, 1, 1,
-2.060275, -0.06728999, -2.778059, 1, 1, 1, 1, 1,
-2.060226, -0.9721419, -2.835491, 1, 1, 1, 1, 1,
-2.041124, -0.02141732, -1.654168, 1, 1, 1, 1, 1,
-2.030537, 0.1652582, -0.04903434, 1, 1, 1, 1, 1,
-2.020536, 1.066622, -1.566125, 1, 1, 1, 1, 1,
-2.013473, -0.2097081, -0.3341798, 1, 1, 1, 1, 1,
-1.996433, 0.08065332, -0.5268425, 1, 1, 1, 1, 1,
-1.982698, -0.2603708, -2.000187, 1, 1, 1, 1, 1,
-1.946181, -1.642484, -3.663224, 0, 0, 1, 1, 1,
-1.93793, 1.562119, -2.450176, 1, 0, 0, 1, 1,
-1.937437, 1.862453, -0.1462457, 1, 0, 0, 1, 1,
-1.933988, -0.01252366, -1.500402, 1, 0, 0, 1, 1,
-1.92883, -1.177335, -2.88412, 1, 0, 0, 1, 1,
-1.912525, -0.7707996, -2.207847, 1, 0, 0, 1, 1,
-1.90325, -1.476521, -4.316647, 0, 0, 0, 1, 1,
-1.900182, 0.3817602, -2.094173, 0, 0, 0, 1, 1,
-1.854811, -1.269028, -2.561548, 0, 0, 0, 1, 1,
-1.840725, -0.206625, -1.844384, 0, 0, 0, 1, 1,
-1.83342, 1.174737, -2.510714, 0, 0, 0, 1, 1,
-1.828058, 0.05259281, -2.305272, 0, 0, 0, 1, 1,
-1.807299, 1.234593, -0.5198057, 0, 0, 0, 1, 1,
-1.781613, 1.841236, -0.1083284, 1, 1, 1, 1, 1,
-1.771561, 1.35186, 1.033295, 1, 1, 1, 1, 1,
-1.765881, -1.01314, -2.740215, 1, 1, 1, 1, 1,
-1.74718, 0.6914797, -1.481892, 1, 1, 1, 1, 1,
-1.746989, 0.469914, -2.01653, 1, 1, 1, 1, 1,
-1.722499, 0.02008392, -1.436819, 1, 1, 1, 1, 1,
-1.695648, -0.8339771, -2.412528, 1, 1, 1, 1, 1,
-1.694164, -1.202929, -1.779452, 1, 1, 1, 1, 1,
-1.665613, -0.6819127, -3.154049, 1, 1, 1, 1, 1,
-1.634469, 0.1988984, -0.2416962, 1, 1, 1, 1, 1,
-1.631073, 0.9277858, -2.365857, 1, 1, 1, 1, 1,
-1.6253, -0.2624754, -1.098497, 1, 1, 1, 1, 1,
-1.61597, 0.2677127, -2.319004, 1, 1, 1, 1, 1,
-1.593432, -0.327272, -2.563339, 1, 1, 1, 1, 1,
-1.591186, -0.9171557, -0.8378325, 1, 1, 1, 1, 1,
-1.576303, -0.776944, -2.864087, 0, 0, 1, 1, 1,
-1.574273, -0.1949008, -1.272585, 1, 0, 0, 1, 1,
-1.572926, -0.821089, -1.843459, 1, 0, 0, 1, 1,
-1.556647, -0.7727771, -2.329379, 1, 0, 0, 1, 1,
-1.546354, 0.3025755, 0.04671482, 1, 0, 0, 1, 1,
-1.546004, 0.2831022, -1.508696, 1, 0, 0, 1, 1,
-1.54245, 0.5385951, -2.872312, 0, 0, 0, 1, 1,
-1.516899, -0.09746619, -1.743831, 0, 0, 0, 1, 1,
-1.515249, -0.103457, -0.556888, 0, 0, 0, 1, 1,
-1.486506, 0.2831045, -0.8277409, 0, 0, 0, 1, 1,
-1.486506, 0.4174753, -1.875961, 0, 0, 0, 1, 1,
-1.481947, -1.015998, -2.20047, 0, 0, 0, 1, 1,
-1.468801, -3.111347, -3.494788, 0, 0, 0, 1, 1,
-1.464974, 0.007751907, -1.629769, 1, 1, 1, 1, 1,
-1.46148, -0.6668056, -1.71764, 1, 1, 1, 1, 1,
-1.460654, -1.63978, -3.672253, 1, 1, 1, 1, 1,
-1.458588, -2.363192, -2.504142, 1, 1, 1, 1, 1,
-1.457109, -1.894709, -4.036337, 1, 1, 1, 1, 1,
-1.451626, -0.00859926, -1.387079, 1, 1, 1, 1, 1,
-1.451017, 0.9710174, -1.09904, 1, 1, 1, 1, 1,
-1.447717, -0.5593261, -1.813403, 1, 1, 1, 1, 1,
-1.439288, 0.6588781, -2.85279, 1, 1, 1, 1, 1,
-1.436987, -0.1362599, -0.8532122, 1, 1, 1, 1, 1,
-1.429059, 0.1230526, -2.484974, 1, 1, 1, 1, 1,
-1.42867, -1.263342, -2.416863, 1, 1, 1, 1, 1,
-1.419863, 1.023132, 0.05191733, 1, 1, 1, 1, 1,
-1.412893, 0.183903, -0.9041657, 1, 1, 1, 1, 1,
-1.411611, -0.9881437, -3.408146, 1, 1, 1, 1, 1,
-1.389801, -0.3465487, -2.714799, 0, 0, 1, 1, 1,
-1.375968, -0.05387118, -1.37482, 1, 0, 0, 1, 1,
-1.367295, 0.2912694, -0.2253904, 1, 0, 0, 1, 1,
-1.352067, -1.543664, -0.5192629, 1, 0, 0, 1, 1,
-1.34276, -2.032036, -4.835728, 1, 0, 0, 1, 1,
-1.331447, -0.7901202, -1.274986, 1, 0, 0, 1, 1,
-1.322751, -1.307283, -2.592725, 0, 0, 0, 1, 1,
-1.319164, -0.02752778, -1.950081, 0, 0, 0, 1, 1,
-1.31151, -0.8783388, -2.200011, 0, 0, 0, 1, 1,
-1.307204, 1.024209, -1.656087, 0, 0, 0, 1, 1,
-1.304373, 1.996022, -0.2308349, 0, 0, 0, 1, 1,
-1.303375, -0.5002671, -1.416056, 0, 0, 0, 1, 1,
-1.294977, -1.115961, -1.585989, 0, 0, 0, 1, 1,
-1.293822, 1.366406, -2.242307, 1, 1, 1, 1, 1,
-1.289982, -0.5620216, -1.795548, 1, 1, 1, 1, 1,
-1.282049, -2.615473, -3.02949, 1, 1, 1, 1, 1,
-1.273705, -0.3521217, -1.636941, 1, 1, 1, 1, 1,
-1.273284, 0.8295108, -0.9506125, 1, 1, 1, 1, 1,
-1.25811, -0.3401524, -1.293585, 1, 1, 1, 1, 1,
-1.245008, -1.342075, -0.1397596, 1, 1, 1, 1, 1,
-1.241175, 1.816175, -0.6118794, 1, 1, 1, 1, 1,
-1.23518, 0.2722661, 0.6765097, 1, 1, 1, 1, 1,
-1.21816, 0.7133224, -0.7267935, 1, 1, 1, 1, 1,
-1.218073, 0.3645314, -1.640742, 1, 1, 1, 1, 1,
-1.203583, -0.5306495, -2.950394, 1, 1, 1, 1, 1,
-1.200756, 0.2526155, -1.844371, 1, 1, 1, 1, 1,
-1.194718, -1.315043, -1.668355, 1, 1, 1, 1, 1,
-1.192333, 1.180989, -0.843823, 1, 1, 1, 1, 1,
-1.186365, 1.031156, -0.856223, 0, 0, 1, 1, 1,
-1.179661, -0.7608027, -2.370392, 1, 0, 0, 1, 1,
-1.177959, -0.04545782, -1.227377, 1, 0, 0, 1, 1,
-1.176017, 1.181624, -0.4566537, 1, 0, 0, 1, 1,
-1.174183, -0.07039946, -1.880599, 1, 0, 0, 1, 1,
-1.164503, -0.7313414, -2.071532, 1, 0, 0, 1, 1,
-1.163557, -1.581365, -0.6492962, 0, 0, 0, 1, 1,
-1.157289, 1.449691, 0.2383842, 0, 0, 0, 1, 1,
-1.156488, -0.3509563, -2.28309, 0, 0, 0, 1, 1,
-1.145649, 0.4391436, -0.2101255, 0, 0, 0, 1, 1,
-1.143142, 0.4798975, 0.2652912, 0, 0, 0, 1, 1,
-1.140551, -1.006559, -1.13477, 0, 0, 0, 1, 1,
-1.138914, 1.222681, 0.6973388, 0, 0, 0, 1, 1,
-1.135192, 0.6320448, -0.3447312, 1, 1, 1, 1, 1,
-1.133571, 1.125298, -1.766227, 1, 1, 1, 1, 1,
-1.131889, -0.4526978, -3.548317, 1, 1, 1, 1, 1,
-1.129473, 0.5375965, -3.226786, 1, 1, 1, 1, 1,
-1.126094, -1.19959, -1.865377, 1, 1, 1, 1, 1,
-1.12153, 1.264445, -0.3251109, 1, 1, 1, 1, 1,
-1.120365, -0.4966798, -2.556124, 1, 1, 1, 1, 1,
-1.120047, -0.1491764, -0.5703231, 1, 1, 1, 1, 1,
-1.109539, 1.053976, -0.3000424, 1, 1, 1, 1, 1,
-1.1093, -2.823076, -3.070616, 1, 1, 1, 1, 1,
-1.097294, -0.5490901, -1.516665, 1, 1, 1, 1, 1,
-1.095776, -0.7831009, -3.332989, 1, 1, 1, 1, 1,
-1.088608, -0.1312523, -0.79037, 1, 1, 1, 1, 1,
-1.087956, 1.47203, -1.308843, 1, 1, 1, 1, 1,
-1.079675, -0.9535854, -2.328855, 1, 1, 1, 1, 1,
-1.078494, -0.4427293, -3.382063, 0, 0, 1, 1, 1,
-1.07364, -0.4425791, -2.150748, 1, 0, 0, 1, 1,
-1.06813, -0.8067805, -1.360642, 1, 0, 0, 1, 1,
-1.060635, 0.1762952, -1.68013, 1, 0, 0, 1, 1,
-1.055063, 0.5847384, 0.629205, 1, 0, 0, 1, 1,
-1.052046, -0.08627153, -0.8525912, 1, 0, 0, 1, 1,
-1.040327, 0.8087795, -1.796632, 0, 0, 0, 1, 1,
-1.039088, -0.5595182, -0.09052713, 0, 0, 0, 1, 1,
-1.029211, -0.3975147, -1.545861, 0, 0, 0, 1, 1,
-1.024736, -1.425913, -1.893617, 0, 0, 0, 1, 1,
-1.024198, 0.1383519, -0.6170192, 0, 0, 0, 1, 1,
-1.02307, 0.5746159, -1.70797, 0, 0, 0, 1, 1,
-1.009622, 1.392474, -1.02745, 0, 0, 0, 1, 1,
-1.008543, 1.091477, -0.2695367, 1, 1, 1, 1, 1,
-1.006828, -1.794761, -2.20194, 1, 1, 1, 1, 1,
-1.006506, -0.2442497, 0.5704571, 1, 1, 1, 1, 1,
-1.005144, -1.392234, -1.98616, 1, 1, 1, 1, 1,
-1.002271, -0.2177583, -1.580598, 1, 1, 1, 1, 1,
-1.00024, 1.004144, 0.7480943, 1, 1, 1, 1, 1,
-1.000087, 0.1861442, -1.719852, 1, 1, 1, 1, 1,
-0.9924913, 0.1494122, -1.355107, 1, 1, 1, 1, 1,
-0.9919086, -0.1362514, -1.305539, 1, 1, 1, 1, 1,
-0.9863106, 0.3100352, -2.472357, 1, 1, 1, 1, 1,
-0.9817013, -1.133807, -2.787697, 1, 1, 1, 1, 1,
-0.9815307, 0.3590519, -0.729732, 1, 1, 1, 1, 1,
-0.9804625, 0.4231992, -1.071416, 1, 1, 1, 1, 1,
-0.9767524, -0.4437147, -2.190353, 1, 1, 1, 1, 1,
-0.9746854, -1.342829, -3.475998, 1, 1, 1, 1, 1,
-0.9547958, 0.9208948, -0.6244623, 0, 0, 1, 1, 1,
-0.9538542, 0.1461636, -0.1295271, 1, 0, 0, 1, 1,
-0.9493555, -0.000939592, -0.9970273, 1, 0, 0, 1, 1,
-0.9440869, 0.2954509, -1.295678, 1, 0, 0, 1, 1,
-0.9392033, -0.269674, 0.01089979, 1, 0, 0, 1, 1,
-0.9343916, -0.2089004, -2.360227, 1, 0, 0, 1, 1,
-0.9288087, 1.920324, -1.599768, 0, 0, 0, 1, 1,
-0.925063, -0.6007038, -2.803523, 0, 0, 0, 1, 1,
-0.9228622, 0.8408963, -0.1232262, 0, 0, 0, 1, 1,
-0.9213679, 0.06776147, -2.692824, 0, 0, 0, 1, 1,
-0.9173906, 0.2713677, -1.297537, 0, 0, 0, 1, 1,
-0.9065436, -0.05792842, -1.595127, 0, 0, 0, 1, 1,
-0.8971381, -0.8834991, -1.68463, 0, 0, 0, 1, 1,
-0.8951847, -0.178174, -0.7408936, 1, 1, 1, 1, 1,
-0.894332, -1.453832, -3.249688, 1, 1, 1, 1, 1,
-0.8916817, -1.327222, -3.146413, 1, 1, 1, 1, 1,
-0.8798234, -0.6767598, -1.788854, 1, 1, 1, 1, 1,
-0.8747496, 0.002059543, -1.649385, 1, 1, 1, 1, 1,
-0.8709212, -1.298537, -2.254188, 1, 1, 1, 1, 1,
-0.867994, 0.2939456, -1.931502, 1, 1, 1, 1, 1,
-0.8669152, 0.1516425, -1.084965, 1, 1, 1, 1, 1,
-0.8542475, -1.781019, -0.9744753, 1, 1, 1, 1, 1,
-0.8531961, -0.1858242, -3.26586, 1, 1, 1, 1, 1,
-0.8526023, -1.010629, -1.838183, 1, 1, 1, 1, 1,
-0.8518777, 2.347289, -0.5091742, 1, 1, 1, 1, 1,
-0.8469706, -0.6017919, -0.5228522, 1, 1, 1, 1, 1,
-0.8370286, -0.6268674, -2.116892, 1, 1, 1, 1, 1,
-0.8342583, 0.9604526, 0.2926468, 1, 1, 1, 1, 1,
-0.8341554, 0.3443, -1.287245, 0, 0, 1, 1, 1,
-0.8341129, -0.6336035, -1.834137, 1, 0, 0, 1, 1,
-0.8337356, 0.8559902, -0.01629687, 1, 0, 0, 1, 1,
-0.8328765, 0.8744265, -1.468175, 1, 0, 0, 1, 1,
-0.8323768, 0.1329059, -0.06801045, 1, 0, 0, 1, 1,
-0.8280489, 0.4579095, -0.6338836, 1, 0, 0, 1, 1,
-0.8278759, 0.3758255, -0.6675146, 0, 0, 0, 1, 1,
-0.81241, -1.622389, -3.080525, 0, 0, 0, 1, 1,
-0.8083901, -2.033942, -3.940779, 0, 0, 0, 1, 1,
-0.8050421, -0.08824643, -1.526207, 0, 0, 0, 1, 1,
-0.8021278, -2.167317, -2.9401, 0, 0, 0, 1, 1,
-0.7999279, -0.2160634, -2.466996, 0, 0, 0, 1, 1,
-0.7988094, -0.06380716, -1.979321, 0, 0, 0, 1, 1,
-0.7921931, -0.09010674, 0.1159891, 1, 1, 1, 1, 1,
-0.7855686, 0.5316507, -0.7373298, 1, 1, 1, 1, 1,
-0.7842865, 0.585144, 0.283921, 1, 1, 1, 1, 1,
-0.7822465, 1.766496, -1.002752, 1, 1, 1, 1, 1,
-0.7820652, -0.9595456, -1.287487, 1, 1, 1, 1, 1,
-0.7812552, -0.3854817, -1.288002, 1, 1, 1, 1, 1,
-0.7744272, 0.8999233, -0.05382167, 1, 1, 1, 1, 1,
-0.7721911, 1.89612, -1.862855, 1, 1, 1, 1, 1,
-0.7703183, 0.3579134, 0.1344693, 1, 1, 1, 1, 1,
-0.7668216, -0.6389902, -3.636884, 1, 1, 1, 1, 1,
-0.7653219, -0.1864405, -1.308588, 1, 1, 1, 1, 1,
-0.7574984, -0.5895482, -3.298913, 1, 1, 1, 1, 1,
-0.7570286, -1.16801, -2.513692, 1, 1, 1, 1, 1,
-0.7535507, 0.1350835, -3.291337, 1, 1, 1, 1, 1,
-0.751969, 0.4586966, -1.209334, 1, 1, 1, 1, 1,
-0.7469606, -1.733688, -2.516573, 0, 0, 1, 1, 1,
-0.7456528, 0.3370671, -3.23964, 1, 0, 0, 1, 1,
-0.743366, 0.07087891, -1.627903, 1, 0, 0, 1, 1,
-0.7431872, 0.6471825, -1.544606, 1, 0, 0, 1, 1,
-0.7356279, -2.69003, -3.254793, 1, 0, 0, 1, 1,
-0.7341985, 0.2012302, -3.607025, 1, 0, 0, 1, 1,
-0.7332528, 0.9156811, -0.3411813, 0, 0, 0, 1, 1,
-0.7329613, -1.061582, -1.109365, 0, 0, 0, 1, 1,
-0.731361, -2.247773, -3.381304, 0, 0, 0, 1, 1,
-0.7289827, 0.08741852, -2.791625, 0, 0, 0, 1, 1,
-0.7169468, -0.6472351, -2.493709, 0, 0, 0, 1, 1,
-0.7112507, -0.9450582, -1.20265, 0, 0, 0, 1, 1,
-0.7101214, -1.111175, -3.903644, 0, 0, 0, 1, 1,
-0.7097902, 0.36053, -1.322933, 1, 1, 1, 1, 1,
-0.7053993, -1.485061, -3.244311, 1, 1, 1, 1, 1,
-0.7052235, 0.8960065, 0.1732165, 1, 1, 1, 1, 1,
-0.7040231, -1.163315, -2.011541, 1, 1, 1, 1, 1,
-0.7021376, -0.4056983, -2.201318, 1, 1, 1, 1, 1,
-0.7019904, 1.054604, 0.2223769, 1, 1, 1, 1, 1,
-0.6940945, 0.8112668, -1.126795, 1, 1, 1, 1, 1,
-0.6922176, -0.6113914, -2.278654, 1, 1, 1, 1, 1,
-0.6915876, 1.690015, 0.6882532, 1, 1, 1, 1, 1,
-0.6821629, -0.09437764, -1.866706, 1, 1, 1, 1, 1,
-0.6820011, 0.03771219, -2.065772, 1, 1, 1, 1, 1,
-0.6774997, -1.024089, -3.249892, 1, 1, 1, 1, 1,
-0.6700123, 1.557388, -1.718474, 1, 1, 1, 1, 1,
-0.6627505, -0.6626042, -2.011698, 1, 1, 1, 1, 1,
-0.6579375, -1.626549, -1.677342, 1, 1, 1, 1, 1,
-0.6512285, -0.3960197, -2.258545, 0, 0, 1, 1, 1,
-0.6504818, 1.106994, -0.9513944, 1, 0, 0, 1, 1,
-0.6497716, 0.6953291, -0.1343636, 1, 0, 0, 1, 1,
-0.6492185, 0.5840317, -0.163961, 1, 0, 0, 1, 1,
-0.6479976, -2.191085, -3.033657, 1, 0, 0, 1, 1,
-0.6463881, 0.5155318, -0.6802093, 1, 0, 0, 1, 1,
-0.6454755, -0.8215325, -1.923792, 0, 0, 0, 1, 1,
-0.640528, 0.6820711, -1.803898, 0, 0, 0, 1, 1,
-0.6362913, 0.09797099, 0.4570822, 0, 0, 0, 1, 1,
-0.6349119, -0.4927089, -1.750429, 0, 0, 0, 1, 1,
-0.6348345, 0.1915299, -0.3920952, 0, 0, 0, 1, 1,
-0.6339899, -0.2695394, -3.444725, 0, 0, 0, 1, 1,
-0.6247272, -0.7223982, -3.261185, 0, 0, 0, 1, 1,
-0.6242564, -0.09543668, -3.348777, 1, 1, 1, 1, 1,
-0.6204864, -0.5312862, -2.756164, 1, 1, 1, 1, 1,
-0.6069955, 0.5989299, -0.8963346, 1, 1, 1, 1, 1,
-0.6044372, -0.1130423, -1.896012, 1, 1, 1, 1, 1,
-0.5991912, 1.014783, -1.006969, 1, 1, 1, 1, 1,
-0.5986775, -1.020902, -2.752005, 1, 1, 1, 1, 1,
-0.5973743, -0.9110276, -3.760914, 1, 1, 1, 1, 1,
-0.5965167, -0.267475, -2.381447, 1, 1, 1, 1, 1,
-0.5963256, 2.390703, 0.9020587, 1, 1, 1, 1, 1,
-0.5902891, 0.006852555, -1.787141, 1, 1, 1, 1, 1,
-0.5800073, 0.9791526, -0.3815288, 1, 1, 1, 1, 1,
-0.5779318, 0.3775321, -0.7507051, 1, 1, 1, 1, 1,
-0.5778689, -0.04089565, -1.167892, 1, 1, 1, 1, 1,
-0.5742164, -1.527047, -2.535037, 1, 1, 1, 1, 1,
-0.5719725, 1.41009, 0.7043325, 1, 1, 1, 1, 1,
-0.5702994, -0.6876477, -3.10008, 0, 0, 1, 1, 1,
-0.5687792, 0.06346946, -2.071448, 1, 0, 0, 1, 1,
-0.5673698, -1.292418, -4.781665, 1, 0, 0, 1, 1,
-0.5662204, 0.7251438, -2.03705, 1, 0, 0, 1, 1,
-0.5641798, 0.1969497, -0.8711182, 1, 0, 0, 1, 1,
-0.5607916, 2.23622, -1.329333, 1, 0, 0, 1, 1,
-0.5578952, -0.1585346, -0.4885315, 0, 0, 0, 1, 1,
-0.5574138, -1.189786, -3.147726, 0, 0, 0, 1, 1,
-0.5570472, -0.4692845, -2.166356, 0, 0, 0, 1, 1,
-0.5561374, -0.2103405, -3.455975, 0, 0, 0, 1, 1,
-0.5548161, 0.2948619, -0.621614, 0, 0, 0, 1, 1,
-0.5544511, 0.6901224, -0.9156418, 0, 0, 0, 1, 1,
-0.5538649, 1.032473, 1.568092, 0, 0, 0, 1, 1,
-0.5484509, -0.0760559, -2.035455, 1, 1, 1, 1, 1,
-0.5451305, 0.4721274, 0.6845757, 1, 1, 1, 1, 1,
-0.5437605, 0.301189, -2.090749, 1, 1, 1, 1, 1,
-0.5364669, -1.169857, -4.13611, 1, 1, 1, 1, 1,
-0.5346381, -0.04040712, -1.789468, 1, 1, 1, 1, 1,
-0.5301712, 0.5348421, -0.5226224, 1, 1, 1, 1, 1,
-0.5284005, 0.2720222, -0.4347259, 1, 1, 1, 1, 1,
-0.5266614, -0.3806874, -0.8079216, 1, 1, 1, 1, 1,
-0.5181651, 0.02438615, -1.355894, 1, 1, 1, 1, 1,
-0.5181442, -0.4689651, -3.255612, 1, 1, 1, 1, 1,
-0.5180088, 1.512025, -2.531414, 1, 1, 1, 1, 1,
-0.5099969, -0.4604748, -3.003116, 1, 1, 1, 1, 1,
-0.5081537, -0.2166223, -1.754925, 1, 1, 1, 1, 1,
-0.5073229, 0.9183672, 0.8267843, 1, 1, 1, 1, 1,
-0.5017883, -0.5660419, 0.002165765, 1, 1, 1, 1, 1,
-0.5002401, -1.281498, -1.93462, 0, 0, 1, 1, 1,
-0.4969288, -0.119108, -1.408101, 1, 0, 0, 1, 1,
-0.4961278, 0.948244, -0.3357378, 1, 0, 0, 1, 1,
-0.4876644, 1.477821, 0.22316, 1, 0, 0, 1, 1,
-0.4867519, 1.448176, 0.1705382, 1, 0, 0, 1, 1,
-0.4844866, 1.651523, 1.33815, 1, 0, 0, 1, 1,
-0.4832569, -0.2669622, -2.204393, 0, 0, 0, 1, 1,
-0.4807831, -0.4166477, -1.044394, 0, 0, 0, 1, 1,
-0.479652, 0.08971825, -2.157506, 0, 0, 0, 1, 1,
-0.4749984, -0.238248, -3.050015, 0, 0, 0, 1, 1,
-0.4744475, -1.988795, -1.848307, 0, 0, 0, 1, 1,
-0.4715544, 1.073557, -1.889626, 0, 0, 0, 1, 1,
-0.4699085, -0.1940273, -2.951518, 0, 0, 0, 1, 1,
-0.467299, -0.8843888, -3.788625, 1, 1, 1, 1, 1,
-0.4583132, -1.095687, -2.877519, 1, 1, 1, 1, 1,
-0.4537829, 0.8190733, -0.9438661, 1, 1, 1, 1, 1,
-0.4520961, -0.3119907, -2.934993, 1, 1, 1, 1, 1,
-0.4514568, 1.5411, 1.251071, 1, 1, 1, 1, 1,
-0.4487265, -0.9166023, -4.305305, 1, 1, 1, 1, 1,
-0.4486427, -0.3981371, -3.037033, 1, 1, 1, 1, 1,
-0.4470795, 0.4662719, -1.335609, 1, 1, 1, 1, 1,
-0.4463246, -0.5893116, -2.377555, 1, 1, 1, 1, 1,
-0.4441392, -0.4698088, -3.418955, 1, 1, 1, 1, 1,
-0.4370207, 0.169306, 0.1893618, 1, 1, 1, 1, 1,
-0.4351071, -0.9237649, -2.041733, 1, 1, 1, 1, 1,
-0.4340189, 0.05491796, -2.383536, 1, 1, 1, 1, 1,
-0.4327225, -0.08936039, -2.6361, 1, 1, 1, 1, 1,
-0.4243948, 1.143099, -1.186836, 1, 1, 1, 1, 1,
-0.4200978, -0.001021874, -1.42515, 0, 0, 1, 1, 1,
-0.4200423, -0.05195875, -1.215841, 1, 0, 0, 1, 1,
-0.4180888, 0.04596551, -1.617527, 1, 0, 0, 1, 1,
-0.4180446, -0.7739582, -4.486931, 1, 0, 0, 1, 1,
-0.4170005, -0.2609555, -1.712893, 1, 0, 0, 1, 1,
-0.415716, 0.2437065, -1.864814, 1, 0, 0, 1, 1,
-0.41139, 1.266609, 0.492043, 0, 0, 0, 1, 1,
-0.4101764, 1.187873, 0.2342197, 0, 0, 0, 1, 1,
-0.4055645, 1.118647, -0.1390899, 0, 0, 0, 1, 1,
-0.4050695, 0.4163562, -1.355374, 0, 0, 0, 1, 1,
-0.402759, -0.2780182, -1.981202, 0, 0, 0, 1, 1,
-0.402404, 0.855781, -1.055844, 0, 0, 0, 1, 1,
-0.4016178, -2.351216, -2.036958, 0, 0, 0, 1, 1,
-0.4009018, 0.01441564, -2.735795, 1, 1, 1, 1, 1,
-0.4006277, 0.2526602, -0.8878874, 1, 1, 1, 1, 1,
-0.3997714, -0.3699119, -2.187643, 1, 1, 1, 1, 1,
-0.3967321, -0.2263667, -2.394361, 1, 1, 1, 1, 1,
-0.3934286, -0.05449451, -0.6364587, 1, 1, 1, 1, 1,
-0.3913735, -0.4864113, -3.896569, 1, 1, 1, 1, 1,
-0.3912404, -1.017814, -3.092853, 1, 1, 1, 1, 1,
-0.3890153, 0.6579407, -1.770782, 1, 1, 1, 1, 1,
-0.3878673, -1.737033, -2.63602, 1, 1, 1, 1, 1,
-0.3876482, -0.0262791, -1.71023, 1, 1, 1, 1, 1,
-0.3862726, 0.4710842, -2.861351, 1, 1, 1, 1, 1,
-0.3858904, -1.316891, -2.88731, 1, 1, 1, 1, 1,
-0.3854418, -1.079275, -3.118419, 1, 1, 1, 1, 1,
-0.3839546, 0.5034046, -2.864043, 1, 1, 1, 1, 1,
-0.3801583, 0.2893862, 0.3045077, 1, 1, 1, 1, 1,
-0.3747574, 1.184555, 0.9229499, 0, 0, 1, 1, 1,
-0.3736976, -0.5182766, -1.53843, 1, 0, 0, 1, 1,
-0.3716358, -1.016347, -3.245967, 1, 0, 0, 1, 1,
-0.3668365, 0.7557048, 0.2905305, 1, 0, 0, 1, 1,
-0.3662499, 1.039321, -0.494148, 1, 0, 0, 1, 1,
-0.3650515, -1.319585, -1.583577, 1, 0, 0, 1, 1,
-0.3620043, 1.487189, -1.261382, 0, 0, 0, 1, 1,
-0.3609669, 0.06290559, -1.423711, 0, 0, 0, 1, 1,
-0.358468, -0.2549558, -0.8120059, 0, 0, 0, 1, 1,
-0.3527084, 0.1038288, -0.9041169, 0, 0, 0, 1, 1,
-0.348874, 0.1665861, -0.8922579, 0, 0, 0, 1, 1,
-0.3380868, -0.08903272, -3.579283, 0, 0, 0, 1, 1,
-0.3376068, 0.6626357, -2.326091, 0, 0, 0, 1, 1,
-0.3343153, 1.836885, 0.7435015, 1, 1, 1, 1, 1,
-0.3308759, -1.654681, -2.716933, 1, 1, 1, 1, 1,
-0.3189794, -0.4462515, -2.486419, 1, 1, 1, 1, 1,
-0.3169363, -0.05786693, -1.672129, 1, 1, 1, 1, 1,
-0.3138597, 1.524506, 2.148972, 1, 1, 1, 1, 1,
-0.3130051, 0.1558463, -1.907761, 1, 1, 1, 1, 1,
-0.3106119, -0.443412, -1.291729, 1, 1, 1, 1, 1,
-0.3070967, 0.4499891, -1.808505, 1, 1, 1, 1, 1,
-0.3069876, 0.1180477, -3.771835, 1, 1, 1, 1, 1,
-0.3061125, -0.9892486, -2.315388, 1, 1, 1, 1, 1,
-0.3033023, -0.8241814, -4.24412, 1, 1, 1, 1, 1,
-0.2971371, -0.1221015, -1.545132, 1, 1, 1, 1, 1,
-0.2896036, 0.9122681, 0.6041353, 1, 1, 1, 1, 1,
-0.2890393, 0.8013915, -1.227275, 1, 1, 1, 1, 1,
-0.2865907, -0.8774896, -4.144095, 1, 1, 1, 1, 1,
-0.2854203, -0.416181, -0.9091909, 0, 0, 1, 1, 1,
-0.2814569, 0.7794558, 0.1943774, 1, 0, 0, 1, 1,
-0.2808007, 3.04291, -0.03508846, 1, 0, 0, 1, 1,
-0.2805271, -1.352895, -3.357959, 1, 0, 0, 1, 1,
-0.2747309, -0.5451655, -2.436804, 1, 0, 0, 1, 1,
-0.2732135, -1.460801, -3.275445, 1, 0, 0, 1, 1,
-0.2729967, -0.824581, -3.800437, 0, 0, 0, 1, 1,
-0.2720286, -0.2115151, -3.692447, 0, 0, 0, 1, 1,
-0.2623034, 0.4183919, 1.026224, 0, 0, 0, 1, 1,
-0.2560299, 1.021056, 2.456156, 0, 0, 0, 1, 1,
-0.2554463, -0.1663606, -0.7026076, 0, 0, 0, 1, 1,
-0.2546887, -0.4235467, -1.341508, 0, 0, 0, 1, 1,
-0.2546434, 0.9571826, 0.1742457, 0, 0, 0, 1, 1,
-0.2540163, -0.4143218, -2.894956, 1, 1, 1, 1, 1,
-0.2490704, 0.4291809, -0.2351822, 1, 1, 1, 1, 1,
-0.2420882, -0.1418725, -1.444674, 1, 1, 1, 1, 1,
-0.2400034, 0.2176515, -1.838026, 1, 1, 1, 1, 1,
-0.2362214, -0.8276728, -2.661873, 1, 1, 1, 1, 1,
-0.2311933, 0.2762797, -0.7305055, 1, 1, 1, 1, 1,
-0.2306509, -3.068575, -2.782681, 1, 1, 1, 1, 1,
-0.2285348, -0.6067157, -2.465007, 1, 1, 1, 1, 1,
-0.225991, 0.2271397, 0.325119, 1, 1, 1, 1, 1,
-0.2241288, 1.497422, -0.6992251, 1, 1, 1, 1, 1,
-0.2178461, -0.3110551, -1.793064, 1, 1, 1, 1, 1,
-0.2173414, 0.8219066, 0.5211067, 1, 1, 1, 1, 1,
-0.2154928, -1.502838, -1.716016, 1, 1, 1, 1, 1,
-0.2135761, 0.244435, -1.560583, 1, 1, 1, 1, 1,
-0.2116517, -0.4160168, -2.58952, 1, 1, 1, 1, 1,
-0.2095314, 1.766405, -1.0332, 0, 0, 1, 1, 1,
-0.2094216, 0.03841964, -0.1583638, 1, 0, 0, 1, 1,
-0.2042929, 0.502543, 0.06964625, 1, 0, 0, 1, 1,
-0.2018522, 1.67377, -1.361731, 1, 0, 0, 1, 1,
-0.2008564, -1.059723, -4.438662, 1, 0, 0, 1, 1,
-0.1961049, -0.009425341, -1.20356, 1, 0, 0, 1, 1,
-0.1950652, -0.01252683, -0.7200078, 0, 0, 0, 1, 1,
-0.1916816, -0.427699, -4.964052, 0, 0, 0, 1, 1,
-0.1765915, -0.1585812, -2.737413, 0, 0, 0, 1, 1,
-0.1752715, 0.03157516, -1.405812, 0, 0, 0, 1, 1,
-0.1723135, 0.6930843, -0.2351858, 0, 0, 0, 1, 1,
-0.171567, -1.671282, -2.531953, 0, 0, 0, 1, 1,
-0.1709944, 0.02245777, -0.6496992, 0, 0, 0, 1, 1,
-0.1695846, -0.8886928, -3.41793, 1, 1, 1, 1, 1,
-0.1670341, 1.472964, 0.2012707, 1, 1, 1, 1, 1,
-0.1664744, 0.1828028, -0.4818246, 1, 1, 1, 1, 1,
-0.1656149, 0.2032762, -2.401644, 1, 1, 1, 1, 1,
-0.1651351, -1.075645, -1.911497, 1, 1, 1, 1, 1,
-0.1613136, -0.2820506, -3.258317, 1, 1, 1, 1, 1,
-0.1597078, 2.030233, 0.03532598, 1, 1, 1, 1, 1,
-0.1516931, -0.8400877, -2.646247, 1, 1, 1, 1, 1,
-0.1494973, -0.1210317, -2.554109, 1, 1, 1, 1, 1,
-0.1491647, -0.1857266, -2.091669, 1, 1, 1, 1, 1,
-0.1475546, -0.06799626, -1.654761, 1, 1, 1, 1, 1,
-0.1473945, -0.3337658, -3.288521, 1, 1, 1, 1, 1,
-0.1458057, -0.5576715, -3.844852, 1, 1, 1, 1, 1,
-0.1424015, -0.4683847, -2.510384, 1, 1, 1, 1, 1,
-0.1420513, -0.5570349, -2.851424, 1, 1, 1, 1, 1,
-0.1365187, -0.1077415, -2.184412, 0, 0, 1, 1, 1,
-0.1358736, 1.640071, -0.7556752, 1, 0, 0, 1, 1,
-0.1347989, 1.662923, -1.138213, 1, 0, 0, 1, 1,
-0.134389, 1.045345, -0.9143286, 1, 0, 0, 1, 1,
-0.128203, 0.07063022, -3.071941, 1, 0, 0, 1, 1,
-0.1227124, 1.846229, 0.4337419, 1, 0, 0, 1, 1,
-0.1226277, -1.698327, -2.071775, 0, 0, 0, 1, 1,
-0.1199086, -1.675824, -3.979498, 0, 0, 0, 1, 1,
-0.1174618, -1.211665, -1.122953, 0, 0, 0, 1, 1,
-0.1161349, -0.05084569, -3.64139, 0, 0, 0, 1, 1,
-0.1156816, 1.084261, -0.3654761, 0, 0, 0, 1, 1,
-0.1152612, 0.8726936, -0.6833891, 0, 0, 0, 1, 1,
-0.1151477, 1.184615, -1.059864, 0, 0, 0, 1, 1,
-0.1066243, 1.456668, 0.580721, 1, 1, 1, 1, 1,
-0.1028555, -0.5770731, -4.742439, 1, 1, 1, 1, 1,
-0.1018869, 2.264676, 0.5210763, 1, 1, 1, 1, 1,
-0.1000683, 0.6565618, -1.090893, 1, 1, 1, 1, 1,
-0.09995968, 1.410009, -1.765929, 1, 1, 1, 1, 1,
-0.09821431, 0.06243292, 0.2094783, 1, 1, 1, 1, 1,
-0.09781685, -0.1245872, -2.267197, 1, 1, 1, 1, 1,
-0.08382649, -0.7918375, -2.849922, 1, 1, 1, 1, 1,
-0.08224122, 0.1917506, 0.3912723, 1, 1, 1, 1, 1,
-0.08114055, -0.209034, -2.123548, 1, 1, 1, 1, 1,
-0.08098853, -0.08633213, -1.706398, 1, 1, 1, 1, 1,
-0.08023236, -0.5624717, -3.954037, 1, 1, 1, 1, 1,
-0.07705917, 1.332866, -1.044708, 1, 1, 1, 1, 1,
-0.07059772, -1.212593, -3.919467, 1, 1, 1, 1, 1,
-0.06664438, 0.2335986, 2.251617, 1, 1, 1, 1, 1,
-0.06153783, 0.02009249, -2.255154, 0, 0, 1, 1, 1,
-0.06146577, 0.3424331, -1.027089, 1, 0, 0, 1, 1,
-0.06118439, 0.01997556, -1.387169, 1, 0, 0, 1, 1,
-0.06087325, -0.4779482, -3.006695, 1, 0, 0, 1, 1,
-0.0510464, 0.2986284, 0.4333467, 1, 0, 0, 1, 1,
-0.05023148, 0.1635842, 0.2352272, 1, 0, 0, 1, 1,
-0.04850137, -0.1524894, -2.460778, 0, 0, 0, 1, 1,
-0.04840773, 0.9295192, -2.014826, 0, 0, 0, 1, 1,
-0.04483915, -1.95548, -3.259916, 0, 0, 0, 1, 1,
-0.04459567, 2.278735, -1.135013, 0, 0, 0, 1, 1,
-0.04233684, -0.05916091, -3.074095, 0, 0, 0, 1, 1,
-0.04075479, -0.5910397, -3.155556, 0, 0, 0, 1, 1,
-0.03408909, 0.4330232, 1.799322, 0, 0, 0, 1, 1,
-0.03047774, 0.2647642, -0.5863585, 1, 1, 1, 1, 1,
-0.02742454, -0.557117, -2.07464, 1, 1, 1, 1, 1,
-0.02059064, -1.647476, -4.092426, 1, 1, 1, 1, 1,
-0.02042648, -1.051775, -1.72465, 1, 1, 1, 1, 1,
-0.02010354, 0.6871181, -0.9396523, 1, 1, 1, 1, 1,
-0.004478462, 1.36074, 1.221224, 1, 1, 1, 1, 1,
-0.002158598, -0.2534288, -2.877704, 1, 1, 1, 1, 1,
-0.001262467, -0.6903612, -4.814709, 1, 1, 1, 1, 1,
-0.0009062645, 0.08754013, 2.333427, 1, 1, 1, 1, 1,
0.001428518, -0.04148006, 5.160544, 1, 1, 1, 1, 1,
0.004259992, 1.547573, -0.5708486, 1, 1, 1, 1, 1,
0.005261051, -0.2933807, 1.604532, 1, 1, 1, 1, 1,
0.005557469, -0.4665195, 3.337977, 1, 1, 1, 1, 1,
0.007363541, 0.9910043, -1.640483, 1, 1, 1, 1, 1,
0.009057258, 0.4761511, 0.183548, 1, 1, 1, 1, 1,
0.01705636, -1.274199, 3.305161, 0, 0, 1, 1, 1,
0.02036613, -1.474093, 3.453136, 1, 0, 0, 1, 1,
0.02327295, 0.1316059, -0.8384059, 1, 0, 0, 1, 1,
0.03157074, 1.882271, -0.8267343, 1, 0, 0, 1, 1,
0.03218564, 1.085168, 0.03342149, 1, 0, 0, 1, 1,
0.03533338, -2.261425, 3.396043, 1, 0, 0, 1, 1,
0.03720871, -1.345095, 2.096611, 0, 0, 0, 1, 1,
0.03778613, -0.1853112, 1.053658, 0, 0, 0, 1, 1,
0.04024119, 0.8140052, -0.6730629, 0, 0, 0, 1, 1,
0.04067467, 0.2402408, 1.163829, 0, 0, 0, 1, 1,
0.04386549, -0.7135174, 2.518883, 0, 0, 0, 1, 1,
0.0443976, 0.3446083, 0.7382244, 0, 0, 0, 1, 1,
0.04786848, 1.579832, -0.6343412, 0, 0, 0, 1, 1,
0.05014442, 0.06666897, 0.6133774, 1, 1, 1, 1, 1,
0.05035937, 0.415432, 0.1680918, 1, 1, 1, 1, 1,
0.05112513, 0.2937318, -0.599414, 1, 1, 1, 1, 1,
0.06604388, -1.592154, 2.865591, 1, 1, 1, 1, 1,
0.066691, 2.36675, 0.4014506, 1, 1, 1, 1, 1,
0.06686672, 0.8226293, 0.08567034, 1, 1, 1, 1, 1,
0.07078633, 0.01073899, 3.16492, 1, 1, 1, 1, 1,
0.07117333, -0.02167233, 1.646228, 1, 1, 1, 1, 1,
0.07320352, 1.502843, -1.93553, 1, 1, 1, 1, 1,
0.07523582, 0.1399078, 0.08976172, 1, 1, 1, 1, 1,
0.07634365, -0.800123, 1.959147, 1, 1, 1, 1, 1,
0.07964239, 3.068571, 0.6666885, 1, 1, 1, 1, 1,
0.08060197, -0.03065407, 2.315128, 1, 1, 1, 1, 1,
0.0809883, -0.1074669, 1.091654, 1, 1, 1, 1, 1,
0.08367751, 0.1920387, -0.1188826, 1, 1, 1, 1, 1,
0.09099998, -0.862218, 3.098075, 0, 0, 1, 1, 1,
0.0945325, 0.3380065, -1.739815, 1, 0, 0, 1, 1,
0.1017904, -0.03457943, 0.4636394, 1, 0, 0, 1, 1,
0.1035192, 1.168058, -0.1783255, 1, 0, 0, 1, 1,
0.105115, -0.8978347, 2.608586, 1, 0, 0, 1, 1,
0.1054852, -0.5429621, 2.650928, 1, 0, 0, 1, 1,
0.1071963, -0.09068094, 2.277368, 0, 0, 0, 1, 1,
0.108096, 0.5940979, 0.6592945, 0, 0, 0, 1, 1,
0.1092674, -0.1927938, 3.417815, 0, 0, 0, 1, 1,
0.1112766, 0.2970175, 0.5042847, 0, 0, 0, 1, 1,
0.1137684, -0.09843633, 1.525342, 0, 0, 0, 1, 1,
0.1225079, -1.282191, 2.509998, 0, 0, 0, 1, 1,
0.1236689, 1.482955, 0.4153529, 0, 0, 0, 1, 1,
0.127108, -1.931044, 2.845773, 1, 1, 1, 1, 1,
0.127993, -0.1592157, 3.007729, 1, 1, 1, 1, 1,
0.1316906, -1.299544, 4.03125, 1, 1, 1, 1, 1,
0.1332154, 0.5661511, 0.3225588, 1, 1, 1, 1, 1,
0.1346928, 0.2543868, -1.683519, 1, 1, 1, 1, 1,
0.141647, -0.5668228, 2.643389, 1, 1, 1, 1, 1,
0.1428526, -0.3424338, 2.62247, 1, 1, 1, 1, 1,
0.1435752, -0.7720582, 1.265749, 1, 1, 1, 1, 1,
0.1501312, -1.601806, 2.677668, 1, 1, 1, 1, 1,
0.1527264, -0.1612357, 1.40603, 1, 1, 1, 1, 1,
0.1552772, -0.8296628, 3.71296, 1, 1, 1, 1, 1,
0.1573082, 0.3549947, 1.787617, 1, 1, 1, 1, 1,
0.1615563, -0.003235188, 2.012422, 1, 1, 1, 1, 1,
0.1695981, 1.143109, -0.575471, 1, 1, 1, 1, 1,
0.1737215, -1.507999, 2.697948, 1, 1, 1, 1, 1,
0.1779828, 0.3709443, 2.903595, 0, 0, 1, 1, 1,
0.1836599, -0.1904278, 3.280287, 1, 0, 0, 1, 1,
0.184588, -0.5629997, -0.03006739, 1, 0, 0, 1, 1,
0.1871745, -0.3810762, 2.237719, 1, 0, 0, 1, 1,
0.1890161, -0.4855125, 3.697853, 1, 0, 0, 1, 1,
0.1931392, 0.2457455, 1.878414, 1, 0, 0, 1, 1,
0.2012651, -2.2411, 3.26711, 0, 0, 0, 1, 1,
0.204404, 0.1014706, 1.810615, 0, 0, 0, 1, 1,
0.2050884, -0.1722045, 2.6225, 0, 0, 0, 1, 1,
0.2065683, -0.1406551, 2.986182, 0, 0, 0, 1, 1,
0.2098594, -0.6111606, 2.162092, 0, 0, 0, 1, 1,
0.2109338, 0.2856663, 3.817965, 0, 0, 0, 1, 1,
0.2109575, 0.822345, 0.5456412, 0, 0, 0, 1, 1,
0.2136411, -1.403126, 3.089784, 1, 1, 1, 1, 1,
0.21394, -0.3147547, 2.114677, 1, 1, 1, 1, 1,
0.2149117, -0.5275271, 4.560954, 1, 1, 1, 1, 1,
0.2149142, -0.5310637, 1.441549, 1, 1, 1, 1, 1,
0.2191706, 1.407783, -0.9568075, 1, 1, 1, 1, 1,
0.2203727, 0.5928571, -0.7360663, 1, 1, 1, 1, 1,
0.2270993, 1.004987, 0.9786789, 1, 1, 1, 1, 1,
0.2296774, 0.1624634, 1.935212, 1, 1, 1, 1, 1,
0.230402, -0.7524384, 3.760531, 1, 1, 1, 1, 1,
0.2344208, -1.240498, 2.21372, 1, 1, 1, 1, 1,
0.2350851, -1.018158, 3.356162, 1, 1, 1, 1, 1,
0.2383059, -0.4978579, 4.065189, 1, 1, 1, 1, 1,
0.2386059, 0.4077974, 1.506771, 1, 1, 1, 1, 1,
0.2389393, 0.07209513, 2.337562, 1, 1, 1, 1, 1,
0.2436919, -0.2064935, 1.326526, 1, 1, 1, 1, 1,
0.2445424, 0.8552048, -0.8248519, 0, 0, 1, 1, 1,
0.2488446, 0.2513331, -0.2197708, 1, 0, 0, 1, 1,
0.2491885, 0.209105, 2.038015, 1, 0, 0, 1, 1,
0.2532035, -0.2645247, 1.296896, 1, 0, 0, 1, 1,
0.2538709, 0.2164347, 1.483221, 1, 0, 0, 1, 1,
0.2567622, -0.4046727, 2.502582, 1, 0, 0, 1, 1,
0.2580395, -0.2402293, 2.500305, 0, 0, 0, 1, 1,
0.2582433, -0.2388737, 2.776211, 0, 0, 0, 1, 1,
0.2643599, -0.4754014, 2.181225, 0, 0, 0, 1, 1,
0.2652103, -0.7141128, 3.570206, 0, 0, 0, 1, 1,
0.2675364, -0.470444, 3.047353, 0, 0, 0, 1, 1,
0.2713954, 0.4402248, 0.6021879, 0, 0, 0, 1, 1,
0.2715573, -0.8133997, 2.416857, 0, 0, 0, 1, 1,
0.2767422, 1.634267, -0.981855, 1, 1, 1, 1, 1,
0.2791831, -0.01928253, 1.076694, 1, 1, 1, 1, 1,
0.2813301, 0.9295571, -0.1069958, 1, 1, 1, 1, 1,
0.2820966, -1.600622, 3.108446, 1, 1, 1, 1, 1,
0.2826982, 1.067115, 0.1376548, 1, 1, 1, 1, 1,
0.2841289, 0.3192134, -0.03029666, 1, 1, 1, 1, 1,
0.2908691, 0.07551645, 1.739615, 1, 1, 1, 1, 1,
0.2921802, -1.300789, 3.868954, 1, 1, 1, 1, 1,
0.2962203, 0.7091383, 2.129539, 1, 1, 1, 1, 1,
0.299643, -0.05426155, 0.9347805, 1, 1, 1, 1, 1,
0.300095, -0.4442742, 2.918404, 1, 1, 1, 1, 1,
0.3016495, -0.05834787, 2.479354, 1, 1, 1, 1, 1,
0.303425, 0.8732209, -0.8195034, 1, 1, 1, 1, 1,
0.3063022, 1.008864, 0.980561, 1, 1, 1, 1, 1,
0.3071429, -1.063002, 2.531021, 1, 1, 1, 1, 1,
0.3076836, 0.4350726, -1.067242, 0, 0, 1, 1, 1,
0.3097655, -2.691184, 2.553755, 1, 0, 0, 1, 1,
0.3109538, -0.6501282, 0.322162, 1, 0, 0, 1, 1,
0.311518, 0.7490056, -1.215826, 1, 0, 0, 1, 1,
0.3116123, -1.063844, 3.083129, 1, 0, 0, 1, 1,
0.3119204, -0.2508187, 1.629629, 1, 0, 0, 1, 1,
0.3129383, 0.1216915, 2.572516, 0, 0, 0, 1, 1,
0.3132972, -0.1522835, 1.687004, 0, 0, 0, 1, 1,
0.3140315, 0.4969223, 2.086098, 0, 0, 0, 1, 1,
0.3162135, -0.3434493, 3.548892, 0, 0, 0, 1, 1,
0.3198034, -0.2247015, -0.238346, 0, 0, 0, 1, 1,
0.3200718, -1.107134, 3.493143, 0, 0, 0, 1, 1,
0.3226492, 1.053776, 0.3225612, 0, 0, 0, 1, 1,
0.3231191, 0.5935994, 0.7800918, 1, 1, 1, 1, 1,
0.3246866, 0.1434655, 2.002775, 1, 1, 1, 1, 1,
0.3269762, -2.077944, 3.915485, 1, 1, 1, 1, 1,
0.3357525, -0.6389738, 1.519224, 1, 1, 1, 1, 1,
0.3369226, -0.3238183, 2.295558, 1, 1, 1, 1, 1,
0.3377453, -0.3752314, 2.576869, 1, 1, 1, 1, 1,
0.3389939, 0.04307504, 1.155704, 1, 1, 1, 1, 1,
0.3405547, 1.520892, 0.6443747, 1, 1, 1, 1, 1,
0.343785, -0.821223, 4.099955, 1, 1, 1, 1, 1,
0.344933, 2.977207, -0.6243538, 1, 1, 1, 1, 1,
0.347607, 0.3537023, 0.3504851, 1, 1, 1, 1, 1,
0.348592, -1.1973, 3.196468, 1, 1, 1, 1, 1,
0.3554807, -0.5687872, 3.004885, 1, 1, 1, 1, 1,
0.3554819, -0.6832802, 3.209731, 1, 1, 1, 1, 1,
0.3560231, 0.5553472, -0.3213829, 1, 1, 1, 1, 1,
0.3564266, 0.64148, 1.5292, 0, 0, 1, 1, 1,
0.3576865, 1.705065, 0.2007386, 1, 0, 0, 1, 1,
0.363438, -0.5344577, 2.658441, 1, 0, 0, 1, 1,
0.3638736, -0.5258291, 1.877408, 1, 0, 0, 1, 1,
0.3643792, -0.8603728, 2.151468, 1, 0, 0, 1, 1,
0.3677295, 2.099696, 0.2494585, 1, 0, 0, 1, 1,
0.3729205, 1.447917, 0.2855697, 0, 0, 0, 1, 1,
0.3772095, -0.4044923, 3.48779, 0, 0, 0, 1, 1,
0.3818366, -0.4679568, 3.290603, 0, 0, 0, 1, 1,
0.3845938, -0.02767178, 0.7852834, 0, 0, 0, 1, 1,
0.3874497, -0.2302191, 3.186342, 0, 0, 0, 1, 1,
0.391388, 0.7716168, 1.471764, 0, 0, 0, 1, 1,
0.3917232, -0.1024067, 1.805652, 0, 0, 0, 1, 1,
0.3927096, 0.3711313, -1.070656, 1, 1, 1, 1, 1,
0.3954182, -2.054468, 2.645375, 1, 1, 1, 1, 1,
0.3958003, 0.9226092, 0.8965873, 1, 1, 1, 1, 1,
0.3972485, 0.2001102, 1.518914, 1, 1, 1, 1, 1,
0.3979134, 0.7883713, 0.3598151, 1, 1, 1, 1, 1,
0.4058962, -0.6026989, 3.729494, 1, 1, 1, 1, 1,
0.4068918, 0.2274336, 0.3477256, 1, 1, 1, 1, 1,
0.4076058, 0.3255041, 0.02096274, 1, 1, 1, 1, 1,
0.4098035, 0.180075, 0.2820595, 1, 1, 1, 1, 1,
0.4123118, 0.5822323, 1.569324, 1, 1, 1, 1, 1,
0.4124211, -0.07962212, 0.6779588, 1, 1, 1, 1, 1,
0.4175858, 0.8313417, -0.03967199, 1, 1, 1, 1, 1,
0.4186169, -0.5443608, 2.256102, 1, 1, 1, 1, 1,
0.4187932, -0.1446049, 3.539054, 1, 1, 1, 1, 1,
0.4225492, 1.52301, -2.591369, 1, 1, 1, 1, 1,
0.4233537, 0.2524029, 0.7608099, 0, 0, 1, 1, 1,
0.4248034, 0.9034679, 0.3053759, 1, 0, 0, 1, 1,
0.4250775, -0.5302221, 3.491803, 1, 0, 0, 1, 1,
0.4252552, -0.2436729, 0.414811, 1, 0, 0, 1, 1,
0.4287069, -1.216492, 2.038841, 1, 0, 0, 1, 1,
0.4308502, 1.235249, -0.7165889, 1, 0, 0, 1, 1,
0.4316162, -0.1736979, 1.899209, 0, 0, 0, 1, 1,
0.4325512, -0.8950812, 2.317545, 0, 0, 0, 1, 1,
0.4388175, -1.287925, 3.740525, 0, 0, 0, 1, 1,
0.4427285, 1.23766, 1.252309, 0, 0, 0, 1, 1,
0.4449584, 2.276529, -1.380715, 0, 0, 0, 1, 1,
0.4490596, -0.4524681, 2.401986, 0, 0, 0, 1, 1,
0.4531161, -1.154293, 3.29632, 0, 0, 0, 1, 1,
0.4542107, -0.1971608, 2.12416, 1, 1, 1, 1, 1,
0.4547186, -0.5273254, 1.112947, 1, 1, 1, 1, 1,
0.4634078, -2.926094, 3.255832, 1, 1, 1, 1, 1,
0.4648567, 1.382069, 0.9986326, 1, 1, 1, 1, 1,
0.4718018, -0.627229, 1.589956, 1, 1, 1, 1, 1,
0.4721448, 1.026679, -0.5351962, 1, 1, 1, 1, 1,
0.4723536, 1.554174, -0.6452296, 1, 1, 1, 1, 1,
0.4725817, 0.07519717, 0.3785059, 1, 1, 1, 1, 1,
0.4740214, 0.1178204, 1.516313, 1, 1, 1, 1, 1,
0.4751665, -0.6739222, 1.342355, 1, 1, 1, 1, 1,
0.4779969, -1.493055, 4.366127, 1, 1, 1, 1, 1,
0.4804993, -0.09206787, 3.249301, 1, 1, 1, 1, 1,
0.4836832, 0.06879137, 1.186795, 1, 1, 1, 1, 1,
0.4856752, -0.03053833, 0.6160493, 1, 1, 1, 1, 1,
0.4865131, 0.7807017, 1.163051, 1, 1, 1, 1, 1,
0.491514, -0.1958717, 1.141454, 0, 0, 1, 1, 1,
0.4949257, -1.515902, 3.524651, 1, 0, 0, 1, 1,
0.5063127, -1.316354, 1.825363, 1, 0, 0, 1, 1,
0.5127603, 0.07623552, 2.821445, 1, 0, 0, 1, 1,
0.5131541, -0.1185578, 2.761004, 1, 0, 0, 1, 1,
0.5133362, 1.083835, 1.552882, 1, 0, 0, 1, 1,
0.5146047, -2.689804, 5.865023, 0, 0, 0, 1, 1,
0.5163827, 0.4852183, 0.3997063, 0, 0, 0, 1, 1,
0.5190649, 0.727227, 0.3518327, 0, 0, 0, 1, 1,
0.5233284, -0.8697246, 2.39908, 0, 0, 0, 1, 1,
0.5243718, 0.320879, 2.093788, 0, 0, 0, 1, 1,
0.5272831, 0.2679078, 1.72439, 0, 0, 0, 1, 1,
0.528052, 1.156521, 0.22233, 0, 0, 0, 1, 1,
0.5362089, -0.6781784, 1.599398, 1, 1, 1, 1, 1,
0.5367414, 0.416589, 0.7132828, 1, 1, 1, 1, 1,
0.5417172, -1.845644, 1.068231, 1, 1, 1, 1, 1,
0.5418727, -0.6078256, 2.455797, 1, 1, 1, 1, 1,
0.5477998, -0.3346798, 3.228397, 1, 1, 1, 1, 1,
0.5482892, -1.800134, 3.161804, 1, 1, 1, 1, 1,
0.5485934, -0.1484966, 2.957326, 1, 1, 1, 1, 1,
0.5521979, -0.1325964, 0.5367698, 1, 1, 1, 1, 1,
0.5545154, 0.2386899, 2.935865, 1, 1, 1, 1, 1,
0.5550172, -0.8093695, 3.307991, 1, 1, 1, 1, 1,
0.5626721, 1.703711, -1.541732, 1, 1, 1, 1, 1,
0.5637738, -0.2512845, 1.186075, 1, 1, 1, 1, 1,
0.564114, -0.6231898, 2.448891, 1, 1, 1, 1, 1,
0.5680087, 0.1260469, 0.9013302, 1, 1, 1, 1, 1,
0.5680263, 0.7895166, -0.255688, 1, 1, 1, 1, 1,
0.5691096, -0.3253607, 4.240829, 0, 0, 1, 1, 1,
0.5707688, 0.1616711, 0.5034097, 1, 0, 0, 1, 1,
0.5716556, -0.4752698, 3.550881, 1, 0, 0, 1, 1,
0.5738586, -0.05000506, 4.114333, 1, 0, 0, 1, 1,
0.5796497, -0.7972251, 1.637331, 1, 0, 0, 1, 1,
0.584439, -0.7398849, 1.554499, 1, 0, 0, 1, 1,
0.5902597, 0.104269, 1.269788, 0, 0, 0, 1, 1,
0.5907525, 2.198211, 0.632967, 0, 0, 0, 1, 1,
0.593005, 0.05629957, 2.101743, 0, 0, 0, 1, 1,
0.596782, -0.4369487, 0.7319858, 0, 0, 0, 1, 1,
0.6002201, 0.8909792, 0.8292787, 0, 0, 0, 1, 1,
0.6027856, -0.902536, 2.652788, 0, 0, 0, 1, 1,
0.6033531, 1.038713, 1.201081, 0, 0, 0, 1, 1,
0.6057456, 0.4189715, -0.8150963, 1, 1, 1, 1, 1,
0.6098036, -0.5758829, 3.953339, 1, 1, 1, 1, 1,
0.6114836, 1.337254, 0.727939, 1, 1, 1, 1, 1,
0.6134865, -1.138988, 2.925397, 1, 1, 1, 1, 1,
0.6224864, -0.05942409, 1.892253, 1, 1, 1, 1, 1,
0.6231077, 0.007137319, 0.6654571, 1, 1, 1, 1, 1,
0.6315152, 1.142574, 0.2145541, 1, 1, 1, 1, 1,
0.6333676, 0.7449991, 0.6322253, 1, 1, 1, 1, 1,
0.6438803, 0.2194117, 0.8176877, 1, 1, 1, 1, 1,
0.6446213, 0.8993309, 1.165512, 1, 1, 1, 1, 1,
0.6494213, -1.911556, 1.690479, 1, 1, 1, 1, 1,
0.6595834, 1.099602, 2.033349, 1, 1, 1, 1, 1,
0.6610279, -3.136961, 2.210514, 1, 1, 1, 1, 1,
0.6616053, 0.4053023, 1.551389, 1, 1, 1, 1, 1,
0.6619792, -0.0131769, 2.217812, 1, 1, 1, 1, 1,
0.6691348, 0.04308543, 3.052655, 0, 0, 1, 1, 1,
0.6703851, 0.2735449, 0.9716598, 1, 0, 0, 1, 1,
0.671733, -2.066195, 2.82271, 1, 0, 0, 1, 1,
0.6726491, -1.228019, 1.720601, 1, 0, 0, 1, 1,
0.6762691, 0.3474399, 1.526059, 1, 0, 0, 1, 1,
0.6840293, 1.998764, 1.685315, 1, 0, 0, 1, 1,
0.6850321, 1.773218, 0.6712489, 0, 0, 0, 1, 1,
0.6871682, -0.1133774, 1.111902, 0, 0, 0, 1, 1,
0.7061131, 0.171935, 3.006631, 0, 0, 0, 1, 1,
0.7068179, 0.3274945, 0.9954852, 0, 0, 0, 1, 1,
0.7097206, 1.321891, -0.2964515, 0, 0, 0, 1, 1,
0.7122633, -0.8951805, 2.278352, 0, 0, 0, 1, 1,
0.716315, -0.7634091, 3.17714, 0, 0, 0, 1, 1,
0.7235404, -0.04751538, 3.769739, 1, 1, 1, 1, 1,
0.7312957, 0.493365, 1.509081, 1, 1, 1, 1, 1,
0.73283, 1.090697, 0.9068119, 1, 1, 1, 1, 1,
0.7333868, -0.3223569, 2.357516, 1, 1, 1, 1, 1,
0.7481343, -0.1146352, 0.948159, 1, 1, 1, 1, 1,
0.7496969, -0.8044346, 2.295846, 1, 1, 1, 1, 1,
0.757499, 0.07164875, -0.1965893, 1, 1, 1, 1, 1,
0.7585552, 0.9898292, -0.3695992, 1, 1, 1, 1, 1,
0.758872, -0.1221639, 0.4699697, 1, 1, 1, 1, 1,
0.7607793, 0.07472086, 2.04474, 1, 1, 1, 1, 1,
0.7667598, -0.5254225, 2.701543, 1, 1, 1, 1, 1,
0.7671775, -1.504855, 1.247731, 1, 1, 1, 1, 1,
0.7698643, -0.7534822, 1.950626, 1, 1, 1, 1, 1,
0.7722883, -1.32598, 1.486184, 1, 1, 1, 1, 1,
0.7727786, 1.53505, 0.63084, 1, 1, 1, 1, 1,
0.7760777, 0.0001890229, 0.151409, 0, 0, 1, 1, 1,
0.7763436, 1.165062, 1.123724, 1, 0, 0, 1, 1,
0.7835979, 0.9826742, 0.2262216, 1, 0, 0, 1, 1,
0.7860706, 1.181042, 0.1441804, 1, 0, 0, 1, 1,
0.7867773, -0.9649907, 2.448633, 1, 0, 0, 1, 1,
0.790544, -1.515175, 1.335364, 1, 0, 0, 1, 1,
0.7925074, 0.8498976, -1.119567, 0, 0, 0, 1, 1,
0.8026447, 0.1409664, 1.769582, 0, 0, 0, 1, 1,
0.811011, -0.7236487, 3.870088, 0, 0, 0, 1, 1,
0.8161061, -1.465444, 2.443062, 0, 0, 0, 1, 1,
0.8212296, -0.03449815, 3.531511, 0, 0, 0, 1, 1,
0.8217893, -0.2791257, 2.395545, 0, 0, 0, 1, 1,
0.8248897, 0.3520798, 0.4417619, 0, 0, 0, 1, 1,
0.8257133, 1.344841, 0.3683325, 1, 1, 1, 1, 1,
0.8345906, -1.392516, 2.842559, 1, 1, 1, 1, 1,
0.8390313, -0.8435045, 1.249917, 1, 1, 1, 1, 1,
0.8423547, 0.4882863, 1.601715, 1, 1, 1, 1, 1,
0.8429013, 0.4625266, 0.8709458, 1, 1, 1, 1, 1,
0.8448575, 2.484516, -0.297844, 1, 1, 1, 1, 1,
0.8458022, -0.03916894, 0.5926127, 1, 1, 1, 1, 1,
0.8464802, -0.3742438, 3.239735, 1, 1, 1, 1, 1,
0.8592566, -1.342528, 3.182867, 1, 1, 1, 1, 1,
0.8606486, 0.471177, 0.4698886, 1, 1, 1, 1, 1,
0.8672986, -0.784991, 2.449464, 1, 1, 1, 1, 1,
0.871337, 0.7656953, 2.861587, 1, 1, 1, 1, 1,
0.8809119, -0.4124073, 1.493149, 1, 1, 1, 1, 1,
0.8863767, 0.3159269, 1.377828, 1, 1, 1, 1, 1,
0.888506, -0.9345975, 2.19457, 1, 1, 1, 1, 1,
0.8920584, -0.05119642, 0.6121274, 0, 0, 1, 1, 1,
0.8950987, 0.8926887, -0.446069, 1, 0, 0, 1, 1,
0.8953134, -0.5382584, 3.896424, 1, 0, 0, 1, 1,
0.8988022, 0.4818725, 2.517988, 1, 0, 0, 1, 1,
0.9020602, -0.326124, 0.8658358, 1, 0, 0, 1, 1,
0.9077628, 1.271422, 2.699685, 1, 0, 0, 1, 1,
0.9100536, -1.633949, 0.5505546, 0, 0, 0, 1, 1,
0.9165766, 0.4673921, 0.9271819, 0, 0, 0, 1, 1,
0.919464, -0.1913777, 2.783347, 0, 0, 0, 1, 1,
0.9202055, 0.6425884, 0.4634834, 0, 0, 0, 1, 1,
0.9212991, -0.4024041, 1.872461, 0, 0, 0, 1, 1,
0.9254146, -1.054697, 2.310616, 0, 0, 0, 1, 1,
0.927175, 1.373869, 0.9009107, 0, 0, 0, 1, 1,
0.9315959, -0.1427007, 1.555086, 1, 1, 1, 1, 1,
0.9318123, -0.04150594, 1.376787, 1, 1, 1, 1, 1,
0.9331527, -0.6075771, 1.446083, 1, 1, 1, 1, 1,
0.9363646, 0.3088818, 0.771758, 1, 1, 1, 1, 1,
0.9386228, 0.0945515, 0.3972888, 1, 1, 1, 1, 1,
0.9441158, -1.276042, 1.99393, 1, 1, 1, 1, 1,
0.9463339, -0.2712567, 1.322713, 1, 1, 1, 1, 1,
0.9468845, -0.4000209, 4.259265, 1, 1, 1, 1, 1,
0.9505091, 0.812265, 0.08361218, 1, 1, 1, 1, 1,
0.9507633, -1.055209, 4.918426, 1, 1, 1, 1, 1,
0.9532984, -0.4424949, 1.719601, 1, 1, 1, 1, 1,
0.9590127, 1.646541, 0.7256536, 1, 1, 1, 1, 1,
0.9596146, -0.8531404, 2.907934, 1, 1, 1, 1, 1,
0.9662932, 0.4091891, 0.2178645, 1, 1, 1, 1, 1,
0.9671783, -0.3305911, 2.885342, 1, 1, 1, 1, 1,
0.9674089, -0.4313281, 2.598262, 0, 0, 1, 1, 1,
0.9679379, -0.2110452, 1.378126, 1, 0, 0, 1, 1,
0.9709731, -1.059762, 2.380663, 1, 0, 0, 1, 1,
0.9900399, 1.142771, 1.028987, 1, 0, 0, 1, 1,
1.0129, -0.6082234, 2.215405, 1, 0, 0, 1, 1,
1.013172, -0.6385862, 0.8919277, 1, 0, 0, 1, 1,
1.015491, 0.3818172, 2.975938, 0, 0, 0, 1, 1,
1.017417, -0.6995439, 2.987861, 0, 0, 0, 1, 1,
1.021655, -0.6342022, 2.055285, 0, 0, 0, 1, 1,
1.028317, 0.3207483, 0.7206877, 0, 0, 0, 1, 1,
1.028905, -1.201482, 3.080425, 0, 0, 0, 1, 1,
1.038724, 0.6863187, 0.2402446, 0, 0, 0, 1, 1,
1.042351, 1.053457, 0.6402625, 0, 0, 0, 1, 1,
1.049938, -0.9867849, 3.020084, 1, 1, 1, 1, 1,
1.060074, 0.4394408, 1.170965, 1, 1, 1, 1, 1,
1.062254, -3.398645, 3.372835, 1, 1, 1, 1, 1,
1.064449, 0.9357898, 1.910836, 1, 1, 1, 1, 1,
1.067502, 0.8265563, 3.720483, 1, 1, 1, 1, 1,
1.069973, -1.036238, 2.870175, 1, 1, 1, 1, 1,
1.072696, -0.1940423, 2.942073, 1, 1, 1, 1, 1,
1.07411, 0.765796, 3.17457, 1, 1, 1, 1, 1,
1.076916, 0.5472693, 2.934843, 1, 1, 1, 1, 1,
1.082531, -0.2112648, -0.02828802, 1, 1, 1, 1, 1,
1.095701, 1.77966, -0.1635363, 1, 1, 1, 1, 1,
1.097524, -1.692713, 1.981709, 1, 1, 1, 1, 1,
1.099826, 1.321834, 1.400158, 1, 1, 1, 1, 1,
1.110696, -0.7072292, 0.9947461, 1, 1, 1, 1, 1,
1.112828, -1.850125, 1.88981, 1, 1, 1, 1, 1,
1.113468, 0.8297201, -1.675568, 0, 0, 1, 1, 1,
1.12424, 1.390743, 0.1663361, 1, 0, 0, 1, 1,
1.133775, -0.2470974, 1.440512, 1, 0, 0, 1, 1,
1.140138, -0.6649595, 2.157129, 1, 0, 0, 1, 1,
1.143806, -2.345549, 1.799283, 1, 0, 0, 1, 1,
1.144919, 0.4185179, 0.7205044, 1, 0, 0, 1, 1,
1.165745, 1.360285, 0.4888976, 0, 0, 0, 1, 1,
1.167555, -0.8313183, 1.290604, 0, 0, 0, 1, 1,
1.177755, 0.1402948, 0.970557, 0, 0, 0, 1, 1,
1.177815, -2.431139, 1.61468, 0, 0, 0, 1, 1,
1.178247, -0.3889332, 1.676297, 0, 0, 0, 1, 1,
1.179038, -0.6302487, 2.403135, 0, 0, 0, 1, 1,
1.179169, 0.8061393, 1.539479, 0, 0, 0, 1, 1,
1.181318, -1.065305, 2.127681, 1, 1, 1, 1, 1,
1.189759, 0.7703421, 1.947992, 1, 1, 1, 1, 1,
1.193656, -1.799968, 1.287272, 1, 1, 1, 1, 1,
1.194583, -0.9335814, 3.718445, 1, 1, 1, 1, 1,
1.200256, -0.7301978, 1.689143, 1, 1, 1, 1, 1,
1.205201, -3.35762, 3.425079, 1, 1, 1, 1, 1,
1.205873, 0.9915065, 1.45364, 1, 1, 1, 1, 1,
1.21601, 0.747049, -0.6520221, 1, 1, 1, 1, 1,
1.216792, 1.518902, 1.266315, 1, 1, 1, 1, 1,
1.223151, 0.9183002, 1.944771, 1, 1, 1, 1, 1,
1.225711, 0.7830993, 1.763675, 1, 1, 1, 1, 1,
1.22574, 0.1809151, 1.680731, 1, 1, 1, 1, 1,
1.231197, -0.9722412, -0.0856233, 1, 1, 1, 1, 1,
1.235652, -1.367081, 1.673834, 1, 1, 1, 1, 1,
1.237091, -1.307844, 1.344902, 1, 1, 1, 1, 1,
1.240025, -0.4599871, 2.97531, 0, 0, 1, 1, 1,
1.2411, -0.8200447, 1.310489, 1, 0, 0, 1, 1,
1.249089, -0.05615769, 0.8149091, 1, 0, 0, 1, 1,
1.254564, -0.3094029, 1.813085, 1, 0, 0, 1, 1,
1.263075, -0.6728002, 1.795835, 1, 0, 0, 1, 1,
1.264958, 0.1554193, 3.265, 1, 0, 0, 1, 1,
1.267905, -0.5423015, 2.426482, 0, 0, 0, 1, 1,
1.269747, -0.1469508, 2.903383, 0, 0, 0, 1, 1,
1.273554, 1.051347, -0.1144098, 0, 0, 0, 1, 1,
1.292561, -0.7618384, 3.025884, 0, 0, 0, 1, 1,
1.293238, -0.2520832, 2.000426, 0, 0, 0, 1, 1,
1.295079, -0.660189, 1.782864, 0, 0, 0, 1, 1,
1.307748, -0.4324178, 0.4960245, 0, 0, 0, 1, 1,
1.310992, 1.048206, 0.7334681, 1, 1, 1, 1, 1,
1.312245, -0.4290287, 2.416084, 1, 1, 1, 1, 1,
1.313521, -0.004868125, 2.01738, 1, 1, 1, 1, 1,
1.320995, -1.253097, 2.330698, 1, 1, 1, 1, 1,
1.321887, -1.082545, 2.336231, 1, 1, 1, 1, 1,
1.324075, -1.06752, 1.846428, 1, 1, 1, 1, 1,
1.327659, -1.02504, 1.496037, 1, 1, 1, 1, 1,
1.328682, -0.7631527, 2.635207, 1, 1, 1, 1, 1,
1.3292, 0.358941, 0.8896369, 1, 1, 1, 1, 1,
1.345841, 0.5970892, 1.016027, 1, 1, 1, 1, 1,
1.364522, 0.7588106, 1.510468, 1, 1, 1, 1, 1,
1.369572, 1.137466, 1.24055, 1, 1, 1, 1, 1,
1.37973, 1.721202, 2.15208, 1, 1, 1, 1, 1,
1.381775, 0.4879427, 0.981252, 1, 1, 1, 1, 1,
1.384629, 0.4647357, 1.366985, 1, 1, 1, 1, 1,
1.420829, 1.610031, 1.89207, 0, 0, 1, 1, 1,
1.427952, -0.3402305, 4.276818, 1, 0, 0, 1, 1,
1.431171, -0.7404595, 2.923169, 1, 0, 0, 1, 1,
1.432869, 0.2942587, 3.061383, 1, 0, 0, 1, 1,
1.441063, -0.3563475, 1.152025, 1, 0, 0, 1, 1,
1.442267, -0.4516545, 1.843045, 1, 0, 0, 1, 1,
1.448051, -0.6747718, 1.919865, 0, 0, 0, 1, 1,
1.460207, -0.6360962, 3.925571, 0, 0, 0, 1, 1,
1.46299, -0.3702258, 1.952899, 0, 0, 0, 1, 1,
1.468264, -0.3265452, 1.095684, 0, 0, 0, 1, 1,
1.483149, -2.486942, 2.796972, 0, 0, 0, 1, 1,
1.484543, 0.4990797, 0.4003527, 0, 0, 0, 1, 1,
1.485022, -1.413897, 0.1830519, 0, 0, 0, 1, 1,
1.490611, 1.902879, 0.8812122, 1, 1, 1, 1, 1,
1.5084, -0.4913498, 1.598363, 1, 1, 1, 1, 1,
1.516883, 0.4028352, 0.6787131, 1, 1, 1, 1, 1,
1.523058, 0.1121553, 1.08992, 1, 1, 1, 1, 1,
1.524717, -0.3542411, 0.3756153, 1, 1, 1, 1, 1,
1.544519, -0.09055258, 1.147736, 1, 1, 1, 1, 1,
1.568562, -1.046073, 3.164977, 1, 1, 1, 1, 1,
1.581971, 0.1193757, -0.1030306, 1, 1, 1, 1, 1,
1.597203, 0.1378715, 1.200588, 1, 1, 1, 1, 1,
1.599508, 0.3279037, 2.00932, 1, 1, 1, 1, 1,
1.611558, 0.3657685, 2.095086, 1, 1, 1, 1, 1,
1.616573, 0.9759654, 0.136764, 1, 1, 1, 1, 1,
1.633361, -0.4081704, 1.94233, 1, 1, 1, 1, 1,
1.635363, 0.8636906, 1.967753, 1, 1, 1, 1, 1,
1.639067, -0.1287166, 2.05125, 1, 1, 1, 1, 1,
1.640621, -1.59944, 1.810913, 0, 0, 1, 1, 1,
1.662019, 0.5129544, 1.066725, 1, 0, 0, 1, 1,
1.662576, -0.5031978, 1.466731, 1, 0, 0, 1, 1,
1.671542, -2.502508, 3.397746, 1, 0, 0, 1, 1,
1.689538, 0.2756344, 1.813197, 1, 0, 0, 1, 1,
1.690633, -0.2185218, 1.655903, 1, 0, 0, 1, 1,
1.691326, 0.8907043, -0.1281153, 0, 0, 0, 1, 1,
1.704077, 0.7893782, 0.4900976, 0, 0, 0, 1, 1,
1.713237, -1.509234, 1.818713, 0, 0, 0, 1, 1,
1.74862, 1.084908, 0.9398934, 0, 0, 0, 1, 1,
1.77275, -1.187892, 3.816812, 0, 0, 0, 1, 1,
1.776532, 0.008846847, 0.7769774, 0, 0, 0, 1, 1,
1.785349, 0.2929757, 2.301343, 0, 0, 0, 1, 1,
1.79571, 1.330102, -0.8976868, 1, 1, 1, 1, 1,
1.798926, 2.989192, -1.1731, 1, 1, 1, 1, 1,
1.855515, -0.851371, 2.527858, 1, 1, 1, 1, 1,
1.865721, 0.5954269, 1.660731, 1, 1, 1, 1, 1,
1.904588, -1.525671, 2.818917, 1, 1, 1, 1, 1,
1.916719, -0.8970776, 1.631322, 1, 1, 1, 1, 1,
1.922356, 0.1706806, 2.688203, 1, 1, 1, 1, 1,
1.966101, -0.4764564, 2.103664, 1, 1, 1, 1, 1,
1.979143, -0.2844651, 2.451914, 1, 1, 1, 1, 1,
2.01405, -1.080876, 1.219135, 1, 1, 1, 1, 1,
2.01526, -1.41986, 1.525123, 1, 1, 1, 1, 1,
2.030954, -1.78615, 3.385003, 1, 1, 1, 1, 1,
2.048048, -0.8770539, 3.653099, 1, 1, 1, 1, 1,
2.062523, 0.5460132, -0.1407737, 1, 1, 1, 1, 1,
2.066084, 1.268862, 1.256843, 1, 1, 1, 1, 1,
2.073713, -0.4236199, 2.06266, 0, 0, 1, 1, 1,
2.103159, 0.3002736, 4.628469, 1, 0, 0, 1, 1,
2.127519, 0.8060668, 2.689372, 1, 0, 0, 1, 1,
2.141716, 1.320386, 2.583851, 1, 0, 0, 1, 1,
2.176397, 0.5836686, -0.5538464, 1, 0, 0, 1, 1,
2.188223, -0.2989051, 2.226612, 1, 0, 0, 1, 1,
2.263496, 0.5751137, 0.5713679, 0, 0, 0, 1, 1,
2.302047, 1.771137, 0.8737354, 0, 0, 0, 1, 1,
2.313325, -0.5455428, 1.495431, 0, 0, 0, 1, 1,
2.376344, 1.513467, -0.4625197, 0, 0, 0, 1, 1,
2.399774, 0.9016634, 0.8258393, 0, 0, 0, 1, 1,
2.442952, 0.01828401, 1.394226, 0, 0, 0, 1, 1,
2.528486, 0.9368739, 0.1496576, 0, 0, 0, 1, 1,
2.53744, 0.1852294, 1.39967, 1, 1, 1, 1, 1,
2.648382, -0.5477298, 1.691087, 1, 1, 1, 1, 1,
2.716534, 2.047921, -0.1957995, 1, 1, 1, 1, 1,
2.732609, 0.4212426, 0.6250788, 1, 1, 1, 1, 1,
2.837402, 1.064233, 0.9085578, 1, 1, 1, 1, 1,
2.900373, -1.947986, 0.7918164, 1, 1, 1, 1, 1,
2.967975, 1.747233, 1.737623, 1, 1, 1, 1, 1
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
var radius = 9.50092;
var distance = 33.37158;
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
mvMatrix.translate( -0.02697277, 0.1650367, -0.4504855 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.37158);
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