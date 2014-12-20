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
-2.802796, -0.3341197, -3.248951, 1, 0, 0, 1,
-2.673811, -0.1078997, -1.059646, 1, 0.007843138, 0, 1,
-2.619901, 2.445881, -0.4772614, 1, 0.01176471, 0, 1,
-2.421091, -0.4116758, -2.564407, 1, 0.01960784, 0, 1,
-2.383958, -0.3335771, -2.178589, 1, 0.02352941, 0, 1,
-2.361372, 0.4206966, -1.492747, 1, 0.03137255, 0, 1,
-2.356782, -0.375322, -2.209076, 1, 0.03529412, 0, 1,
-2.35182, 1.060678, -0.9809275, 1, 0.04313726, 0, 1,
-2.334477, 1.589041, -1.485713, 1, 0.04705882, 0, 1,
-2.324238, 2.035076, -1.043461, 1, 0.05490196, 0, 1,
-2.293862, 0.7021959, -1.731636, 1, 0.05882353, 0, 1,
-2.253095, -0.0620718, -1.571444, 1, 0.06666667, 0, 1,
-2.248954, 0.5642655, -1.227073, 1, 0.07058824, 0, 1,
-2.243707, -0.6632641, -1.410254, 1, 0.07843138, 0, 1,
-2.237939, 0.2450584, 0.521816, 1, 0.08235294, 0, 1,
-2.205329, -0.3394245, -1.323615, 1, 0.09019608, 0, 1,
-2.204587, -0.5230213, -1.818583, 1, 0.09411765, 0, 1,
-2.200995, -0.3300476, -0.8301174, 1, 0.1019608, 0, 1,
-2.19874, -0.6048519, -1.16633, 1, 0.1098039, 0, 1,
-2.16235, -0.7554402, -2.335667, 1, 0.1137255, 0, 1,
-2.158547, 0.01121497, -2.526223, 1, 0.1215686, 0, 1,
-2.147917, -1.200605, -1.876134, 1, 0.1254902, 0, 1,
-2.055853, -0.164376, -0.7455398, 1, 0.1333333, 0, 1,
-2.051479, -0.7413281, -1.933411, 1, 0.1372549, 0, 1,
-2.045454, -1.075003, -1.802161, 1, 0.145098, 0, 1,
-2.039818, -1.46944, -0.8690823, 1, 0.1490196, 0, 1,
-2.028411, 0.6299636, -0.7342846, 1, 0.1568628, 0, 1,
-2.008179, 0.9351662, -2.381012, 1, 0.1607843, 0, 1,
-1.896713, 1.272289, -2.481183, 1, 0.1686275, 0, 1,
-1.890716, 1.25369, 0.1758832, 1, 0.172549, 0, 1,
-1.890236, 2.662552, -1.15117, 1, 0.1803922, 0, 1,
-1.861157, 1.515642, -0.9914732, 1, 0.1843137, 0, 1,
-1.813015, -0.371996, -1.720051, 1, 0.1921569, 0, 1,
-1.806546, 0.392961, 0.07419689, 1, 0.1960784, 0, 1,
-1.806428, 1.271091, 0.562602, 1, 0.2039216, 0, 1,
-1.780808, 0.9123699, -1.264958, 1, 0.2117647, 0, 1,
-1.754175, 1.142058, 0.400824, 1, 0.2156863, 0, 1,
-1.751809, 0.5216391, -0.6703593, 1, 0.2235294, 0, 1,
-1.745437, -0.7863648, -0.8820667, 1, 0.227451, 0, 1,
-1.732134, 1.253205, -1.600415, 1, 0.2352941, 0, 1,
-1.724701, -1.15957, -1.752902, 1, 0.2392157, 0, 1,
-1.717108, -1.228047, -0.2258772, 1, 0.2470588, 0, 1,
-1.710299, 0.07981174, -3.725014, 1, 0.2509804, 0, 1,
-1.69813, 0.1269841, -1.758725, 1, 0.2588235, 0, 1,
-1.64143, 2.159456, -0.4483537, 1, 0.2627451, 0, 1,
-1.63583, -0.1066728, -1.069275, 1, 0.2705882, 0, 1,
-1.627867, 2.05465, 0.5273265, 1, 0.2745098, 0, 1,
-1.624121, -0.5145115, -2.892995, 1, 0.282353, 0, 1,
-1.623695, 1.036538, 0.02456498, 1, 0.2862745, 0, 1,
-1.612815, 1.283925, -1.596371, 1, 0.2941177, 0, 1,
-1.606061, 0.5827645, -0.265722, 1, 0.3019608, 0, 1,
-1.605311, -2.338442, -0.918525, 1, 0.3058824, 0, 1,
-1.604176, 1.488623, -0.2324386, 1, 0.3137255, 0, 1,
-1.587065, 0.2892195, -1.615663, 1, 0.3176471, 0, 1,
-1.584714, 0.4309339, -1.04893, 1, 0.3254902, 0, 1,
-1.584517, 0.5361438, -0.9748214, 1, 0.3294118, 0, 1,
-1.58389, 0.1849601, -1.552518, 1, 0.3372549, 0, 1,
-1.565945, -0.1907142, -2.269733, 1, 0.3411765, 0, 1,
-1.560919, 0.8142158, -1.593692, 1, 0.3490196, 0, 1,
-1.554714, -0.5130951, -1.123431, 1, 0.3529412, 0, 1,
-1.549499, -1.642492, -2.866998, 1, 0.3607843, 0, 1,
-1.524973, -0.05378124, -1.788964, 1, 0.3647059, 0, 1,
-1.524363, -0.7219901, -2.06856, 1, 0.372549, 0, 1,
-1.518363, -1.0095, -3.280751, 1, 0.3764706, 0, 1,
-1.509212, -0.2329519, -1.294319, 1, 0.3843137, 0, 1,
-1.507047, 1.073426, -1.580248, 1, 0.3882353, 0, 1,
-1.506448, -0.9670321, -4.793168, 1, 0.3960784, 0, 1,
-1.506209, 0.05046398, -1.162357, 1, 0.4039216, 0, 1,
-1.499132, 0.3850903, -1.153803, 1, 0.4078431, 0, 1,
-1.49302, -1.353892, -1.51434, 1, 0.4156863, 0, 1,
-1.480177, 0.9577022, -0.1222449, 1, 0.4196078, 0, 1,
-1.474619, -0.3849975, -2.600224, 1, 0.427451, 0, 1,
-1.465674, -0.610241, -4.049661, 1, 0.4313726, 0, 1,
-1.463184, 0.2509194, -1.436833, 1, 0.4392157, 0, 1,
-1.463072, 0.06778096, -1.664159, 1, 0.4431373, 0, 1,
-1.449582, -2.232494, -3.308584, 1, 0.4509804, 0, 1,
-1.448334, 1.184986, -1.791586, 1, 0.454902, 0, 1,
-1.439352, 0.9104989, -1.186671, 1, 0.4627451, 0, 1,
-1.436414, 0.5403953, -0.9390578, 1, 0.4666667, 0, 1,
-1.434658, -0.08156525, -0.6651243, 1, 0.4745098, 0, 1,
-1.428559, -0.5169384, -1.641692, 1, 0.4784314, 0, 1,
-1.424697, -0.4206406, -1.96383, 1, 0.4862745, 0, 1,
-1.424128, -0.725639, -3.131419, 1, 0.4901961, 0, 1,
-1.42297, -1.829427, -3.77406, 1, 0.4980392, 0, 1,
-1.415976, -1.700312, -0.4682398, 1, 0.5058824, 0, 1,
-1.407553, 0.7889149, -1.649092, 1, 0.509804, 0, 1,
-1.406606, 0.3515539, -0.9902535, 1, 0.5176471, 0, 1,
-1.406321, -1.289698, -2.857253, 1, 0.5215687, 0, 1,
-1.400175, 1.055837, -2.129087, 1, 0.5294118, 0, 1,
-1.393428, 0.6646575, -1.417079, 1, 0.5333334, 0, 1,
-1.365723, 0.7963831, -0.1087248, 1, 0.5411765, 0, 1,
-1.359853, 0.07210677, -0.9116303, 1, 0.5450981, 0, 1,
-1.351262, -1.04699, -3.615674, 1, 0.5529412, 0, 1,
-1.346063, 0.2054101, -2.33481, 1, 0.5568628, 0, 1,
-1.337915, 0.2996565, -1.247156, 1, 0.5647059, 0, 1,
-1.332832, -0.2509617, -3.086791, 1, 0.5686275, 0, 1,
-1.331621, -0.5532917, -3.509955, 1, 0.5764706, 0, 1,
-1.321195, -0.5413995, -1.586404, 1, 0.5803922, 0, 1,
-1.311605, -0.1308792, -2.908783, 1, 0.5882353, 0, 1,
-1.308872, -1.197952, -2.48389, 1, 0.5921569, 0, 1,
-1.306269, -1.444754, -2.473193, 1, 0.6, 0, 1,
-1.306202, -0.460698, 1.326356, 1, 0.6078432, 0, 1,
-1.302012, 0.4832449, -1.680099, 1, 0.6117647, 0, 1,
-1.299536, -0.2224576, -0.6756529, 1, 0.6196079, 0, 1,
-1.284468, -1.111636, -3.357837, 1, 0.6235294, 0, 1,
-1.283704, -0.1216376, -2.08386, 1, 0.6313726, 0, 1,
-1.282113, 2.043753, 0.01865293, 1, 0.6352941, 0, 1,
-1.265563, -1.070482, -3.150793, 1, 0.6431373, 0, 1,
-1.259733, 0.5734798, -1.556022, 1, 0.6470588, 0, 1,
-1.257575, 0.5221705, -1.97564, 1, 0.654902, 0, 1,
-1.24524, -0.2404139, -2.749177, 1, 0.6588235, 0, 1,
-1.241295, -0.5240425, -3.313808, 1, 0.6666667, 0, 1,
-1.240909, 0.5434636, -0.8834018, 1, 0.6705883, 0, 1,
-1.240437, 0.4408452, -2.33936, 1, 0.6784314, 0, 1,
-1.236861, -1.073525, -3.148703, 1, 0.682353, 0, 1,
-1.235267, 1.052885, -0.340652, 1, 0.6901961, 0, 1,
-1.229666, 1.350532, -0.2262444, 1, 0.6941177, 0, 1,
-1.219825, -1.282221, -0.4190961, 1, 0.7019608, 0, 1,
-1.216547, 0.895902, -3.59618, 1, 0.7098039, 0, 1,
-1.215957, 0.1410391, -0.09484696, 1, 0.7137255, 0, 1,
-1.210183, 0.1987423, -1.26711, 1, 0.7215686, 0, 1,
-1.20818, 0.5646559, 0.04165419, 1, 0.7254902, 0, 1,
-1.203923, 0.2432277, 0.02608839, 1, 0.7333333, 0, 1,
-1.201952, -1.802024, -2.622552, 1, 0.7372549, 0, 1,
-1.201792, 0.7860792, -2.025858, 1, 0.7450981, 0, 1,
-1.197276, -1.06033, -1.741297, 1, 0.7490196, 0, 1,
-1.187372, 0.5145531, 0.09199478, 1, 0.7568628, 0, 1,
-1.179514, -0.2892969, -2.934777, 1, 0.7607843, 0, 1,
-1.179473, 0.9110746, -1.910356, 1, 0.7686275, 0, 1,
-1.168197, 1.241201, -1.283828, 1, 0.772549, 0, 1,
-1.164493, 1.10122, -0.8377422, 1, 0.7803922, 0, 1,
-1.159366, -1.772161, -4.417543, 1, 0.7843137, 0, 1,
-1.157437, 0.38319, -1.07343, 1, 0.7921569, 0, 1,
-1.155643, -0.4106719, -1.57324, 1, 0.7960784, 0, 1,
-1.151651, 1.409435, -0.6115364, 1, 0.8039216, 0, 1,
-1.150763, -0.1531453, -1.479169, 1, 0.8117647, 0, 1,
-1.132431, -0.4683209, -4.568752, 1, 0.8156863, 0, 1,
-1.126909, -1.210566, -1.564466, 1, 0.8235294, 0, 1,
-1.124163, 0.2561258, -2.192179, 1, 0.827451, 0, 1,
-1.122908, -1.388162, -2.792279, 1, 0.8352941, 0, 1,
-1.11948, 0.6194744, 0.3174409, 1, 0.8392157, 0, 1,
-1.112295, 0.6703581, -1.413276, 1, 0.8470588, 0, 1,
-1.11123, -0.4584036, -1.393012, 1, 0.8509804, 0, 1,
-1.108564, -0.5634922, -1.692713, 1, 0.8588235, 0, 1,
-1.096728, -0.02873863, -3.755768, 1, 0.8627451, 0, 1,
-1.092738, 1.161668, -0.1463392, 1, 0.8705882, 0, 1,
-1.084805, -1.08248, -2.838914, 1, 0.8745098, 0, 1,
-1.081544, 1.284314, -0.1787633, 1, 0.8823529, 0, 1,
-1.079596, 0.3975768, -0.2450612, 1, 0.8862745, 0, 1,
-1.078338, -0.8720656, -1.531085, 1, 0.8941177, 0, 1,
-1.074406, 0.8377116, -0.4386378, 1, 0.8980392, 0, 1,
-1.074172, 1.754442, 0.2251142, 1, 0.9058824, 0, 1,
-1.052903, 0.5448723, -1.527713, 1, 0.9137255, 0, 1,
-1.051898, 0.2956839, -2.626579, 1, 0.9176471, 0, 1,
-1.050225, 1.151462, -0.2134377, 1, 0.9254902, 0, 1,
-1.04679, 0.9279962, -1.323257, 1, 0.9294118, 0, 1,
-1.046304, 0.582058, -0.7304899, 1, 0.9372549, 0, 1,
-1.046184, -1.039625, -3.301904, 1, 0.9411765, 0, 1,
-1.045241, -1.677152, -1.359698, 1, 0.9490196, 0, 1,
-1.043957, 1.31007, 0.08912523, 1, 0.9529412, 0, 1,
-1.041961, -1.157328, -2.331715, 1, 0.9607843, 0, 1,
-1.03949, -0.608271, -0.5753127, 1, 0.9647059, 0, 1,
-1.035658, 1.142277, -0.6135881, 1, 0.972549, 0, 1,
-1.035593, -0.5733197, -2.496982, 1, 0.9764706, 0, 1,
-1.035191, 0.6765312, -0.9741782, 1, 0.9843137, 0, 1,
-1.032094, -0.713748, -1.065201, 1, 0.9882353, 0, 1,
-1.031787, 1.362431, -0.07728167, 1, 0.9960784, 0, 1,
-1.027588, 0.2478177, -0.880446, 0.9960784, 1, 0, 1,
-1.010106, -0.1704133, -1.208814, 0.9921569, 1, 0, 1,
-1.006567, -0.8322429, -1.364256, 0.9843137, 1, 0, 1,
-1.002239, -1.647419, -1.829852, 0.9803922, 1, 0, 1,
-0.99764, 0.6564484, -1.334633, 0.972549, 1, 0, 1,
-0.9877189, -0.4623298, -0.8090935, 0.9686275, 1, 0, 1,
-0.9855414, -1.135623, -4.249083, 0.9607843, 1, 0, 1,
-0.9848791, -0.03004934, -1.827412, 0.9568627, 1, 0, 1,
-0.9789547, 0.374599, -0.621348, 0.9490196, 1, 0, 1,
-0.9788017, -1.178819, -1.514624, 0.945098, 1, 0, 1,
-0.9642084, 1.873362, -0.7456468, 0.9372549, 1, 0, 1,
-0.9600819, 0.06755613, -0.8925899, 0.9333333, 1, 0, 1,
-0.9557945, -0.028993, -2.225657, 0.9254902, 1, 0, 1,
-0.9541456, 0.7083898, -0.1766217, 0.9215686, 1, 0, 1,
-0.9504939, -1.9528, -4.641666, 0.9137255, 1, 0, 1,
-0.9498984, -0.1086421, -1.688578, 0.9098039, 1, 0, 1,
-0.9481609, -0.9424474, -2.696023, 0.9019608, 1, 0, 1,
-0.9465868, 1.806205, -1.158188, 0.8941177, 1, 0, 1,
-0.9419031, 1.137677, 0.5355859, 0.8901961, 1, 0, 1,
-0.9379233, -0.8545077, -1.461785, 0.8823529, 1, 0, 1,
-0.9355911, 2.047443, 0.3424401, 0.8784314, 1, 0, 1,
-0.9351459, 1.555503, 0.0212762, 0.8705882, 1, 0, 1,
-0.9325382, -0.962715, -2.445889, 0.8666667, 1, 0, 1,
-0.9295359, 2.43811, 0.8201344, 0.8588235, 1, 0, 1,
-0.9237134, 0.536705, -1.880485, 0.854902, 1, 0, 1,
-0.9125398, 0.2827761, -2.836352, 0.8470588, 1, 0, 1,
-0.9058644, 0.2804038, -0.377027, 0.8431373, 1, 0, 1,
-0.8933257, -0.5571331, -1.600426, 0.8352941, 1, 0, 1,
-0.887706, -0.4265369, -3.180126, 0.8313726, 1, 0, 1,
-0.8810744, 1.216552, 0.6851304, 0.8235294, 1, 0, 1,
-0.8793709, 0.6247118, -1.903688, 0.8196079, 1, 0, 1,
-0.8778527, 0.4331455, -0.2974972, 0.8117647, 1, 0, 1,
-0.8697474, 0.6473004, -3.089057, 0.8078431, 1, 0, 1,
-0.8625439, -1.073496, -4.012421, 0.8, 1, 0, 1,
-0.8596947, -0.3761563, -2.836083, 0.7921569, 1, 0, 1,
-0.8580464, -0.8047451, -2.48268, 0.7882353, 1, 0, 1,
-0.8566979, -0.2850891, -1.786959, 0.7803922, 1, 0, 1,
-0.8544874, 0.09894887, -1.588499, 0.7764706, 1, 0, 1,
-0.8487078, -0.7076146, -4.041382, 0.7686275, 1, 0, 1,
-0.8444911, 0.8846276, -1.72523, 0.7647059, 1, 0, 1,
-0.8441588, 0.8418862, -1.320605, 0.7568628, 1, 0, 1,
-0.8323137, -0.3517869, -0.9847159, 0.7529412, 1, 0, 1,
-0.8316169, -0.4374338, -1.180004, 0.7450981, 1, 0, 1,
-0.8251462, -1.058067, -1.951644, 0.7411765, 1, 0, 1,
-0.8238988, -0.4494885, -1.166562, 0.7333333, 1, 0, 1,
-0.813635, 0.5417142, -1.255406, 0.7294118, 1, 0, 1,
-0.8073342, 0.6705189, 0.2176576, 0.7215686, 1, 0, 1,
-0.8069856, 0.5320713, 0.2803546, 0.7176471, 1, 0, 1,
-0.8036763, 0.4325967, -1.222032, 0.7098039, 1, 0, 1,
-0.8025923, -0.01004902, 2.208274, 0.7058824, 1, 0, 1,
-0.7994754, -0.2597525, -1.787314, 0.6980392, 1, 0, 1,
-0.7971895, 1.158662, -0.6201721, 0.6901961, 1, 0, 1,
-0.7867844, -0.6831187, -2.176869, 0.6862745, 1, 0, 1,
-0.7754803, -1.272767, -2.582597, 0.6784314, 1, 0, 1,
-0.7743741, 0.2347313, -1.264175, 0.6745098, 1, 0, 1,
-0.7735459, 0.7312679, 0.2675928, 0.6666667, 1, 0, 1,
-0.7679355, 0.01955231, -1.489589, 0.6627451, 1, 0, 1,
-0.7665957, 0.7756724, 0.2019867, 0.654902, 1, 0, 1,
-0.764012, -0.4698607, 0.02987225, 0.6509804, 1, 0, 1,
-0.7600319, 0.5681994, -0.8369587, 0.6431373, 1, 0, 1,
-0.7590916, 0.1751091, -0.3965788, 0.6392157, 1, 0, 1,
-0.7537976, 2.163736, -1.013904, 0.6313726, 1, 0, 1,
-0.7518108, -0.8604094, -2.23454, 0.627451, 1, 0, 1,
-0.7516001, -0.9378498, -2.538687, 0.6196079, 1, 0, 1,
-0.7451923, 0.9599004, 0.3735459, 0.6156863, 1, 0, 1,
-0.7403929, -0.7165843, -2.524987, 0.6078432, 1, 0, 1,
-0.7298492, -0.3198856, -2.510375, 0.6039216, 1, 0, 1,
-0.7262238, -0.4123663, -2.729121, 0.5960785, 1, 0, 1,
-0.7142089, -0.4479041, -3.003325, 0.5882353, 1, 0, 1,
-0.7133467, -1.079049, -4.785296, 0.5843138, 1, 0, 1,
-0.7116461, -1.152686, -2.500347, 0.5764706, 1, 0, 1,
-0.7095688, 1.002768, 0.008083851, 0.572549, 1, 0, 1,
-0.7088561, -1.174583, -1.968459, 0.5647059, 1, 0, 1,
-0.7084788, -1.391434, -2.239464, 0.5607843, 1, 0, 1,
-0.69726, -0.2869111, -1.163751, 0.5529412, 1, 0, 1,
-0.6958932, -0.09079048, -2.447009, 0.5490196, 1, 0, 1,
-0.6950072, 0.9133893, 0.068759, 0.5411765, 1, 0, 1,
-0.6936579, 1.421676, -2.741842, 0.5372549, 1, 0, 1,
-0.6907473, -1.011657, -2.722021, 0.5294118, 1, 0, 1,
-0.6888467, 0.3057826, -0.6125024, 0.5254902, 1, 0, 1,
-0.6876381, -0.9915724, -2.603549, 0.5176471, 1, 0, 1,
-0.6816644, -0.1422902, -1.171204, 0.5137255, 1, 0, 1,
-0.6794561, -0.3759685, -2.368422, 0.5058824, 1, 0, 1,
-0.6730412, 1.438358, -0.4803907, 0.5019608, 1, 0, 1,
-0.6667215, -1.094309, -1.836416, 0.4941176, 1, 0, 1,
-0.6620525, 1.512007, 0.6211357, 0.4862745, 1, 0, 1,
-0.6566668, -1.720392, -1.917789, 0.4823529, 1, 0, 1,
-0.6552327, 0.6101559, -0.9690779, 0.4745098, 1, 0, 1,
-0.6509814, -0.003222442, 0.1418484, 0.4705882, 1, 0, 1,
-0.6507356, 0.3207136, -0.644158, 0.4627451, 1, 0, 1,
-0.641242, -1.090531, -3.591014, 0.4588235, 1, 0, 1,
-0.6385062, -2.022965, -1.752763, 0.4509804, 1, 0, 1,
-0.6382162, 1.073683, 0.1683565, 0.4470588, 1, 0, 1,
-0.6378543, -0.05795756, -2.061102, 0.4392157, 1, 0, 1,
-0.6372185, -0.8084807, -1.993886, 0.4352941, 1, 0, 1,
-0.6327275, -0.3632849, -2.330326, 0.427451, 1, 0, 1,
-0.6287085, -0.7054704, -3.587303, 0.4235294, 1, 0, 1,
-0.6284493, 1.113609, -0.6827793, 0.4156863, 1, 0, 1,
-0.6261218, -0.08345929, -1.430949, 0.4117647, 1, 0, 1,
-0.6258547, 0.4338132, -0.2413482, 0.4039216, 1, 0, 1,
-0.6231338, 1.120318, 0.009121986, 0.3960784, 1, 0, 1,
-0.6224402, -1.340369, -2.575106, 0.3921569, 1, 0, 1,
-0.6170537, -0.7068477, -2.595775, 0.3843137, 1, 0, 1,
-0.6150262, -1.100762, -2.133319, 0.3803922, 1, 0, 1,
-0.6120431, 0.6071804, -1.05496, 0.372549, 1, 0, 1,
-0.6110685, 0.5154252, -0.00766387, 0.3686275, 1, 0, 1,
-0.606199, -0.8664219, -1.967227, 0.3607843, 1, 0, 1,
-0.605791, 0.2450572, -1.843594, 0.3568628, 1, 0, 1,
-0.6015286, -0.378743, -3.956825, 0.3490196, 1, 0, 1,
-0.5880827, -0.2010576, -3.302418, 0.345098, 1, 0, 1,
-0.5819784, 0.8123847, -1.698823, 0.3372549, 1, 0, 1,
-0.5810366, -0.4489432, -3.269691, 0.3333333, 1, 0, 1,
-0.5803031, -0.0327646, -1.518272, 0.3254902, 1, 0, 1,
-0.5793734, -1.47673, -3.202954, 0.3215686, 1, 0, 1,
-0.5736102, -0.2802701, -1.808661, 0.3137255, 1, 0, 1,
-0.5723975, 1.157392, -1.542968, 0.3098039, 1, 0, 1,
-0.568956, -0.2022772, -2.619369, 0.3019608, 1, 0, 1,
-0.5631916, -0.1230564, -2.059085, 0.2941177, 1, 0, 1,
-0.5580654, -0.5413482, -4.783009, 0.2901961, 1, 0, 1,
-0.5528526, 0.8595625, -0.6161687, 0.282353, 1, 0, 1,
-0.5446866, 0.7601166, -2.991246, 0.2784314, 1, 0, 1,
-0.5441775, 1.141574, -0.6855225, 0.2705882, 1, 0, 1,
-0.5427181, 0.5768216, 0.6713217, 0.2666667, 1, 0, 1,
-0.5370957, -1.575188, -4.260526, 0.2588235, 1, 0, 1,
-0.5345458, 1.798326, -0.204604, 0.254902, 1, 0, 1,
-0.5323759, 1.438542, -0.8127576, 0.2470588, 1, 0, 1,
-0.5311015, -0.1697295, -3.162989, 0.2431373, 1, 0, 1,
-0.5297285, -0.2954914, -0.9382309, 0.2352941, 1, 0, 1,
-0.5264596, 1.105313, -0.007676523, 0.2313726, 1, 0, 1,
-0.5260257, -1.295612, -4.110295, 0.2235294, 1, 0, 1,
-0.5228138, -1.169194, -1.804601, 0.2196078, 1, 0, 1,
-0.5219536, 0.7298318, -0.8313231, 0.2117647, 1, 0, 1,
-0.5209392, 0.2102088, -1.339442, 0.2078431, 1, 0, 1,
-0.5187947, 0.9589568, -2.06771, 0.2, 1, 0, 1,
-0.5171068, 0.9490464, -1.396379, 0.1921569, 1, 0, 1,
-0.5161, 1.202504, -0.3312325, 0.1882353, 1, 0, 1,
-0.5151175, 0.5983294, 0.3051177, 0.1803922, 1, 0, 1,
-0.5130786, -1.62409, -3.409883, 0.1764706, 1, 0, 1,
-0.5045812, 0.3640343, -0.627482, 0.1686275, 1, 0, 1,
-0.4996023, 1.287759, -2.798512, 0.1647059, 1, 0, 1,
-0.4991308, 0.1423238, -1.13724, 0.1568628, 1, 0, 1,
-0.4968198, -0.4380822, -2.83018, 0.1529412, 1, 0, 1,
-0.4967436, -0.3839493, -1.414659, 0.145098, 1, 0, 1,
-0.4948826, -1.255643, -3.105386, 0.1411765, 1, 0, 1,
-0.4937522, 0.7378531, -0.9457392, 0.1333333, 1, 0, 1,
-0.4921359, -1.129398, -3.571078, 0.1294118, 1, 0, 1,
-0.4882905, -1.16289, -0.3581337, 0.1215686, 1, 0, 1,
-0.4880641, 0.4994934, -1.599599, 0.1176471, 1, 0, 1,
-0.4867757, -0.04866552, -1.527206, 0.1098039, 1, 0, 1,
-0.4847497, 0.746673, -0.09571634, 0.1058824, 1, 0, 1,
-0.4844346, 0.8428882, -2.002547, 0.09803922, 1, 0, 1,
-0.4811324, -1.632745, -1.545227, 0.09019608, 1, 0, 1,
-0.4789799, -0.136178, -2.943554, 0.08627451, 1, 0, 1,
-0.4787235, 0.8969988, -1.445634, 0.07843138, 1, 0, 1,
-0.4774667, 0.5229278, -2.599414, 0.07450981, 1, 0, 1,
-0.4766372, -0.1708185, -2.802135, 0.06666667, 1, 0, 1,
-0.476294, 0.7754703, 0.01533544, 0.0627451, 1, 0, 1,
-0.4755251, -0.5935719, -3.30538, 0.05490196, 1, 0, 1,
-0.4732332, -0.4622161, -2.609234, 0.05098039, 1, 0, 1,
-0.4732179, -0.8291318, -1.461586, 0.04313726, 1, 0, 1,
-0.4727509, 0.2280829, -2.935103, 0.03921569, 1, 0, 1,
-0.4706756, 0.710948, -0.5386738, 0.03137255, 1, 0, 1,
-0.4642316, 0.4041666, -1.95953, 0.02745098, 1, 0, 1,
-0.4584075, -0.05476342, -2.40132, 0.01960784, 1, 0, 1,
-0.4486718, -1.051256, -4.267931, 0.01568628, 1, 0, 1,
-0.447336, -0.04469458, -0.7804028, 0.007843138, 1, 0, 1,
-0.4438663, 0.5766702, -1.381304, 0.003921569, 1, 0, 1,
-0.4433455, -0.4981321, -1.859794, 0, 1, 0.003921569, 1,
-0.4431111, -0.9691572, -1.051874, 0, 1, 0.01176471, 1,
-0.4377495, 0.8490452, -2.174759, 0, 1, 0.01568628, 1,
-0.4358428, -1.477347, -3.932741, 0, 1, 0.02352941, 1,
-0.434516, -0.1469695, -3.152374, 0, 1, 0.02745098, 1,
-0.4306365, -0.0185134, -2.14547, 0, 1, 0.03529412, 1,
-0.4304106, -0.4601762, -2.517958, 0, 1, 0.03921569, 1,
-0.4160621, 0.4421586, -1.681747, 0, 1, 0.04705882, 1,
-0.4149561, -0.362569, -1.970422, 0, 1, 0.05098039, 1,
-0.4141361, -0.5077079, -2.726515, 0, 1, 0.05882353, 1,
-0.4124586, -0.3528392, -3.845135, 0, 1, 0.0627451, 1,
-0.4115221, -0.4131488, -1.128228, 0, 1, 0.07058824, 1,
-0.4113913, 0.07862756, -1.273866, 0, 1, 0.07450981, 1,
-0.40809, 0.9442829, 0.3807254, 0, 1, 0.08235294, 1,
-0.4079024, -0.2221914, -1.304588, 0, 1, 0.08627451, 1,
-0.4075784, 1.241138, -0.5765019, 0, 1, 0.09411765, 1,
-0.4066904, -1.747379, -3.753897, 0, 1, 0.1019608, 1,
-0.404018, 9.078276e-05, -2.540301, 0, 1, 0.1058824, 1,
-0.4020359, -0.9031096, -3.213813, 0, 1, 0.1137255, 1,
-0.4004716, 0.6299749, -0.7068153, 0, 1, 0.1176471, 1,
-0.398527, -0.1717527, -3.063043, 0, 1, 0.1254902, 1,
-0.3972448, -0.2808738, -2.992052, 0, 1, 0.1294118, 1,
-0.3952531, -0.2406065, -2.70925, 0, 1, 0.1372549, 1,
-0.3940839, -1.704459, -3.182099, 0, 1, 0.1411765, 1,
-0.3920585, 0.5866376, 0.5926771, 0, 1, 0.1490196, 1,
-0.3913881, -0.5982549, -1.550157, 0, 1, 0.1529412, 1,
-0.3875003, 2.012484, 1.368453, 0, 1, 0.1607843, 1,
-0.3869738, -0.6954342, -2.480252, 0, 1, 0.1647059, 1,
-0.3864059, 0.6637269, -0.1542081, 0, 1, 0.172549, 1,
-0.3846474, -0.1952221, -2.413465, 0, 1, 0.1764706, 1,
-0.3779362, 1.413593, 1.149006, 0, 1, 0.1843137, 1,
-0.3770873, 0.5315976, -0.5262266, 0, 1, 0.1882353, 1,
-0.3755288, 0.4387291, -0.309231, 0, 1, 0.1960784, 1,
-0.3633355, 0.8143106, -0.4931943, 0, 1, 0.2039216, 1,
-0.3579823, 0.8134692, 1.922367, 0, 1, 0.2078431, 1,
-0.3539008, -1.147906, -2.692729, 0, 1, 0.2156863, 1,
-0.3534582, -0.6373412, -2.878393, 0, 1, 0.2196078, 1,
-0.3497638, 1.579585, 0.1033957, 0, 1, 0.227451, 1,
-0.3481801, 1.485728, 1.073782, 0, 1, 0.2313726, 1,
-0.3476893, -1.018977, -5.229814, 0, 1, 0.2392157, 1,
-0.3461655, 1.801376, -1.828265, 0, 1, 0.2431373, 1,
-0.3456759, -2.546824, -3.672894, 0, 1, 0.2509804, 1,
-0.3455497, -0.5800858, -3.367347, 0, 1, 0.254902, 1,
-0.3440234, 0.6420577, -1.606322, 0, 1, 0.2627451, 1,
-0.3417985, -0.07099618, -1.640295, 0, 1, 0.2666667, 1,
-0.3390556, 1.193188, -0.1009033, 0, 1, 0.2745098, 1,
-0.3362503, -2.068149, -4.18318, 0, 1, 0.2784314, 1,
-0.3313844, -1.710035, -2.860374, 0, 1, 0.2862745, 1,
-0.3288598, -0.7753023, -2.746487, 0, 1, 0.2901961, 1,
-0.3234469, 1.327853, -2.144305, 0, 1, 0.2980392, 1,
-0.3211729, 0.2235076, -2.187568, 0, 1, 0.3058824, 1,
-0.3187827, 1.335661, 0.445135, 0, 1, 0.3098039, 1,
-0.3180672, 1.033001, -0.510111, 0, 1, 0.3176471, 1,
-0.3175703, 0.5693643, 0.2306389, 0, 1, 0.3215686, 1,
-0.3106097, 0.912799, 0.428885, 0, 1, 0.3294118, 1,
-0.3085586, 0.1094053, -2.313955, 0, 1, 0.3333333, 1,
-0.3025521, -1.188275, -2.65765, 0, 1, 0.3411765, 1,
-0.3021613, -2.104129, -4.661723, 0, 1, 0.345098, 1,
-0.3009196, -0.1204895, -0.8069036, 0, 1, 0.3529412, 1,
-0.2992852, 0.7543148, -0.09513128, 0, 1, 0.3568628, 1,
-0.2987759, -0.5828612, -2.899605, 0, 1, 0.3647059, 1,
-0.296009, -1.00569, -4.969835, 0, 1, 0.3686275, 1,
-0.2950664, 1.080339, 0.8598501, 0, 1, 0.3764706, 1,
-0.2925619, 0.7333145, -2.27547, 0, 1, 0.3803922, 1,
-0.2869343, 1.035745, 1.065199, 0, 1, 0.3882353, 1,
-0.2779849, -0.9184576, -3.301553, 0, 1, 0.3921569, 1,
-0.2773108, -1.399978, -2.714449, 0, 1, 0.4, 1,
-0.2719462, -1.189837, -2.37737, 0, 1, 0.4078431, 1,
-0.2687988, 1.524062, 0.7121296, 0, 1, 0.4117647, 1,
-0.2685218, 1.367522, -0.9428316, 0, 1, 0.4196078, 1,
-0.2648844, -0.1091978, -1.971998, 0, 1, 0.4235294, 1,
-0.2640283, -0.1614268, -2.4447, 0, 1, 0.4313726, 1,
-0.2640051, -0.5969535, -3.6501, 0, 1, 0.4352941, 1,
-0.2554141, 0.9676896, -0.2767034, 0, 1, 0.4431373, 1,
-0.2531097, 1.194268, 1.360647, 0, 1, 0.4470588, 1,
-0.2530101, 0.08099082, -1.823301, 0, 1, 0.454902, 1,
-0.2528782, 1.040649, 0.6231372, 0, 1, 0.4588235, 1,
-0.2500071, 1.197281, -2.553827, 0, 1, 0.4666667, 1,
-0.2476604, -0.1653669, -1.614457, 0, 1, 0.4705882, 1,
-0.2452238, -0.3554085, -2.560314, 0, 1, 0.4784314, 1,
-0.2441103, -0.9215915, -2.887296, 0, 1, 0.4823529, 1,
-0.2412249, 1.313529, 1.401722, 0, 1, 0.4901961, 1,
-0.2410759, 1.347303, -0.5668698, 0, 1, 0.4941176, 1,
-0.2361177, -0.2413803, -1.837779, 0, 1, 0.5019608, 1,
-0.2307413, 0.9461193, 0.3145309, 0, 1, 0.509804, 1,
-0.2297238, 0.9341486, -0.9169979, 0, 1, 0.5137255, 1,
-0.2274806, -0.5541819, -3.140452, 0, 1, 0.5215687, 1,
-0.2269824, -0.8477814, -2.247007, 0, 1, 0.5254902, 1,
-0.224387, 1.36569, -1.551992, 0, 1, 0.5333334, 1,
-0.2184924, -0.8715398, -0.830716, 0, 1, 0.5372549, 1,
-0.2141828, -0.3644577, -1.127417, 0, 1, 0.5450981, 1,
-0.212195, -1.185213, -3.069131, 0, 1, 0.5490196, 1,
-0.2115592, -0.7474282, -3.105737, 0, 1, 0.5568628, 1,
-0.2103358, 0.7797676, -0.5006981, 0, 1, 0.5607843, 1,
-0.2083922, 0.4554405, -0.3288876, 0, 1, 0.5686275, 1,
-0.2071981, -0.2007661, -0.8337477, 0, 1, 0.572549, 1,
-0.2035612, 0.8032884, -0.1563522, 0, 1, 0.5803922, 1,
-0.2017372, 0.8649573, 0.0188654, 0, 1, 0.5843138, 1,
-0.2013389, 0.7419395, 0.3829194, 0, 1, 0.5921569, 1,
-0.2010999, 0.6116422, 0.1762493, 0, 1, 0.5960785, 1,
-0.2006806, 0.03383503, -1.690436, 0, 1, 0.6039216, 1,
-0.1994036, -1.16798, -3.507202, 0, 1, 0.6117647, 1,
-0.1892006, -0.6601052, -2.292072, 0, 1, 0.6156863, 1,
-0.1867463, 1.431441, 0.7894249, 0, 1, 0.6235294, 1,
-0.1836499, 0.07075207, 0.037498, 0, 1, 0.627451, 1,
-0.1808963, 0.6387758, 1.380923, 0, 1, 0.6352941, 1,
-0.1735091, -1.151623, -2.57599, 0, 1, 0.6392157, 1,
-0.1727619, 1.247176, -0.08674622, 0, 1, 0.6470588, 1,
-0.1717622, -1.185427, -3.669378, 0, 1, 0.6509804, 1,
-0.1648801, -0.9593244, -3.192445, 0, 1, 0.6588235, 1,
-0.1631416, 0.4788973, -1.727158, 0, 1, 0.6627451, 1,
-0.1582924, -0.08463523, -2.379654, 0, 1, 0.6705883, 1,
-0.1571298, 0.6998625, 0.9445292, 0, 1, 0.6745098, 1,
-0.1566069, -0.5509513, -3.338557, 0, 1, 0.682353, 1,
-0.1564198, -0.1716494, -1.704548, 0, 1, 0.6862745, 1,
-0.1554711, 0.2524441, 0.4789538, 0, 1, 0.6941177, 1,
-0.1515505, 1.009658, -1.056247, 0, 1, 0.7019608, 1,
-0.1511688, -0.6964973, -2.037145, 0, 1, 0.7058824, 1,
-0.1500014, 0.7081857, 0.2878437, 0, 1, 0.7137255, 1,
-0.148292, -1.174199, -4.211557, 0, 1, 0.7176471, 1,
-0.1466204, 2.058169, 2.082514, 0, 1, 0.7254902, 1,
-0.1464632, -0.3409013, -3.437353, 0, 1, 0.7294118, 1,
-0.1433214, -0.9745021, -1.015446, 0, 1, 0.7372549, 1,
-0.1410779, -1.009751, -3.148855, 0, 1, 0.7411765, 1,
-0.1401995, 0.4520193, 1.675789, 0, 1, 0.7490196, 1,
-0.1400966, 0.4000026, 0.2345307, 0, 1, 0.7529412, 1,
-0.1374086, -0.9423516, -3.784668, 0, 1, 0.7607843, 1,
-0.1374077, 0.2310732, 0.7896868, 0, 1, 0.7647059, 1,
-0.136368, 0.1062784, -0.8189451, 0, 1, 0.772549, 1,
-0.1360779, -0.3538014, -2.564272, 0, 1, 0.7764706, 1,
-0.1342867, -1.440637, -2.924848, 0, 1, 0.7843137, 1,
-0.1328287, -1.578987, -1.821284, 0, 1, 0.7882353, 1,
-0.1315633, -0.09827851, -3.335591, 0, 1, 0.7960784, 1,
-0.1309246, -0.8644609, -2.789418, 0, 1, 0.8039216, 1,
-0.1304117, 0.3833955, 2.079381, 0, 1, 0.8078431, 1,
-0.1296842, -2.70117, -2.483864, 0, 1, 0.8156863, 1,
-0.1272221, -0.4941379, -3.52674, 0, 1, 0.8196079, 1,
-0.1264756, 0.7880832, -1.214265, 0, 1, 0.827451, 1,
-0.1228523, -0.8136271, -1.417821, 0, 1, 0.8313726, 1,
-0.1183006, -2.058907, -2.647924, 0, 1, 0.8392157, 1,
-0.1131975, -0.8599975, -1.783313, 0, 1, 0.8431373, 1,
-0.1121766, 0.9803222, 1.813532, 0, 1, 0.8509804, 1,
-0.1118381, -0.8711791, -2.501114, 0, 1, 0.854902, 1,
-0.1101676, -2.310919, -2.46612, 0, 1, 0.8627451, 1,
-0.1042379, 1.481398, -0.9404472, 0, 1, 0.8666667, 1,
-0.1040792, -0.4023149, -3.424026, 0, 1, 0.8745098, 1,
-0.1035421, -1.772631, -3.044716, 0, 1, 0.8784314, 1,
-0.1011332, -0.8327235, -2.762094, 0, 1, 0.8862745, 1,
-0.09783883, -0.2235048, -2.535074, 0, 1, 0.8901961, 1,
-0.09720785, -0.0867836, -2.219105, 0, 1, 0.8980392, 1,
-0.09473071, -0.3587777, -2.357391, 0, 1, 0.9058824, 1,
-0.08990522, 0.2119592, 1.254392, 0, 1, 0.9098039, 1,
-0.08794876, -0.01607457, -2.750624, 0, 1, 0.9176471, 1,
-0.08176178, -0.3805971, -3.474044, 0, 1, 0.9215686, 1,
-0.07572049, 0.5850347, -0.1611537, 0, 1, 0.9294118, 1,
-0.07322115, -0.3598146, -3.99813, 0, 1, 0.9333333, 1,
-0.06514728, 0.1508095, 0.3654189, 0, 1, 0.9411765, 1,
-0.06338491, -0.3626072, -3.246128, 0, 1, 0.945098, 1,
-0.06335515, 1.03227, -0.2024982, 0, 1, 0.9529412, 1,
-0.06304327, -1.016592, -1.20233, 0, 1, 0.9568627, 1,
-0.06270761, 1.606867, 1.427479, 0, 1, 0.9647059, 1,
-0.05914826, -0.542095, -2.51801, 0, 1, 0.9686275, 1,
-0.05388195, -0.008160139, 0.5508975, 0, 1, 0.9764706, 1,
-0.05073308, 0.03547242, -0.7067856, 0, 1, 0.9803922, 1,
-0.04816437, 0.4851206, -0.8021721, 0, 1, 0.9882353, 1,
-0.0468721, -0.03546025, -3.053285, 0, 1, 0.9921569, 1,
-0.04685239, 0.7112322, 0.4955944, 0, 1, 1, 1,
-0.04535163, -0.9806648, -2.960765, 0, 0.9921569, 1, 1,
-0.04328102, -0.271496, -2.603152, 0, 0.9882353, 1, 1,
-0.04235306, 1.368024, 0.1532363, 0, 0.9803922, 1, 1,
-0.0371364, 0.2552356, -1.572611, 0, 0.9764706, 1, 1,
-0.03376497, 1.769765, -0.2482993, 0, 0.9686275, 1, 1,
-0.03278038, 1.05068, -2.226994, 0, 0.9647059, 1, 1,
-0.0317414, -0.3470111, -3.456396, 0, 0.9568627, 1, 1,
-0.03065761, 0.7320034, -1.094611, 0, 0.9529412, 1, 1,
-0.0272614, -2.40094, -1.807162, 0, 0.945098, 1, 1,
-0.02669204, 0.5542745, 0.05754398, 0, 0.9411765, 1, 1,
-0.02486257, 1.450769, -1.797137, 0, 0.9333333, 1, 1,
-0.01793719, -0.01988688, -4.422112, 0, 0.9294118, 1, 1,
-0.01127309, -1.277668, -2.873443, 0, 0.9215686, 1, 1,
-0.01101447, 1.393864, -0.572827, 0, 0.9176471, 1, 1,
-0.005821744, -0.5548437, -3.053506, 0, 0.9098039, 1, 1,
-0.003621232, -0.8991581, -2.859447, 0, 0.9058824, 1, 1,
-0.002791442, 1.039685, -1.626838, 0, 0.8980392, 1, 1,
0.001308723, 0.6934084, -0.5778994, 0, 0.8901961, 1, 1,
0.001590696, -0.7625785, 2.971463, 0, 0.8862745, 1, 1,
0.006929238, -0.1225429, 3.584599, 0, 0.8784314, 1, 1,
0.006978465, -0.3893137, 2.476539, 0, 0.8745098, 1, 1,
0.008674531, 0.807319, 0.6254409, 0, 0.8666667, 1, 1,
0.01724937, 0.1190103, 0.1582619, 0, 0.8627451, 1, 1,
0.02341941, 2.435707, 0.005669598, 0, 0.854902, 1, 1,
0.02616971, 2.7337, 0.6376185, 0, 0.8509804, 1, 1,
0.02991962, -1.494131, 3.099558, 0, 0.8431373, 1, 1,
0.03027704, 0.6595548, -1.046735, 0, 0.8392157, 1, 1,
0.0316924, 1.063586, 0.9706623, 0, 0.8313726, 1, 1,
0.03740962, -0.9868472, 4.665671, 0, 0.827451, 1, 1,
0.03810424, 0.2996074, 1.788125, 0, 0.8196079, 1, 1,
0.04268109, 0.6446622, -0.5697833, 0, 0.8156863, 1, 1,
0.04862866, 0.4060661, -1.528188, 0, 0.8078431, 1, 1,
0.05117268, -0.7989076, 3.268125, 0, 0.8039216, 1, 1,
0.05154943, 0.6561069, 1.298436, 0, 0.7960784, 1, 1,
0.05215199, 2.215532, -1.387652, 0, 0.7882353, 1, 1,
0.05497013, -1.152792, 2.706513, 0, 0.7843137, 1, 1,
0.05537102, 1.030556, -0.4424151, 0, 0.7764706, 1, 1,
0.05922167, -0.1207547, 3.197076, 0, 0.772549, 1, 1,
0.05997682, 0.6643347, 1.968944, 0, 0.7647059, 1, 1,
0.06066662, 0.4165737, -0.5969373, 0, 0.7607843, 1, 1,
0.06737807, -0.5607182, 3.125157, 0, 0.7529412, 1, 1,
0.06901233, -1.865683, 2.993443, 0, 0.7490196, 1, 1,
0.07297456, 0.8670782, 1.447837, 0, 0.7411765, 1, 1,
0.07649003, -1.076791, 4.591082, 0, 0.7372549, 1, 1,
0.07766516, -0.4364533, 4.245021, 0, 0.7294118, 1, 1,
0.0799409, 1.022885, -1.043123, 0, 0.7254902, 1, 1,
0.0828391, 0.6426957, 0.6300058, 0, 0.7176471, 1, 1,
0.08305852, -0.2658985, 2.274387, 0, 0.7137255, 1, 1,
0.08559922, -0.3134658, 2.634304, 0, 0.7058824, 1, 1,
0.08881602, -0.003845036, 0.8808882, 0, 0.6980392, 1, 1,
0.08917841, -1.064482, 0.7236228, 0, 0.6941177, 1, 1,
0.09055407, -0.3762512, 1.263441, 0, 0.6862745, 1, 1,
0.09106414, -0.9423939, 3.547494, 0, 0.682353, 1, 1,
0.09410404, 0.994932, 1.493404, 0, 0.6745098, 1, 1,
0.1011888, 0.3411894, -0.03109223, 0, 0.6705883, 1, 1,
0.102551, -0.1138529, 3.147856, 0, 0.6627451, 1, 1,
0.1029431, 1.504004, 0.582014, 0, 0.6588235, 1, 1,
0.1031003, 0.3267642, -0.4446533, 0, 0.6509804, 1, 1,
0.1060958, -2.355906, 3.27453, 0, 0.6470588, 1, 1,
0.1105828, 0.7284977, -0.808388, 0, 0.6392157, 1, 1,
0.1143373, 0.690661, -0.1138882, 0, 0.6352941, 1, 1,
0.116319, -2.06375, 2.839132, 0, 0.627451, 1, 1,
0.1176528, 1.174915, 1.077883, 0, 0.6235294, 1, 1,
0.1188158, 0.149745, 0.9688749, 0, 0.6156863, 1, 1,
0.1215063, -0.9989066, 3.420337, 0, 0.6117647, 1, 1,
0.1220462, 1.902355, 0.7866983, 0, 0.6039216, 1, 1,
0.1248954, -0.4471706, 2.370007, 0, 0.5960785, 1, 1,
0.1250416, -0.5482668, 3.213321, 0, 0.5921569, 1, 1,
0.1331712, 0.3816544, 0.2609673, 0, 0.5843138, 1, 1,
0.1358893, 0.8098435, 0.4097463, 0, 0.5803922, 1, 1,
0.1414658, 2.148621, 0.4611841, 0, 0.572549, 1, 1,
0.1418279, -0.06064619, 2.672299, 0, 0.5686275, 1, 1,
0.1492182, -1.14782, 2.643412, 0, 0.5607843, 1, 1,
0.1523955, -1.536718, 2.497299, 0, 0.5568628, 1, 1,
0.1524187, 1.779977, -0.2321623, 0, 0.5490196, 1, 1,
0.1529865, 0.2800866, 0.01855952, 0, 0.5450981, 1, 1,
0.1536413, -1.01061, 2.958716, 0, 0.5372549, 1, 1,
0.1541104, 1.043525, 0.5083563, 0, 0.5333334, 1, 1,
0.1582818, -0.7870441, 2.285235, 0, 0.5254902, 1, 1,
0.162166, -0.3076173, 3.205695, 0, 0.5215687, 1, 1,
0.1707345, -0.6356079, 3.035839, 0, 0.5137255, 1, 1,
0.1722025, 1.190817, -0.6369724, 0, 0.509804, 1, 1,
0.173485, 0.9907421, 0.9384645, 0, 0.5019608, 1, 1,
0.173644, -2.758946, 4.034857, 0, 0.4941176, 1, 1,
0.1770208, -0.3958202, 3.052177, 0, 0.4901961, 1, 1,
0.1828457, -1.498627, 2.049964, 0, 0.4823529, 1, 1,
0.1879093, -0.774793, 3.210385, 0, 0.4784314, 1, 1,
0.1879144, -0.02472143, 3.40903, 0, 0.4705882, 1, 1,
0.1881936, -0.9593656, 2.848175, 0, 0.4666667, 1, 1,
0.1919488, -0.3419882, 1.512946, 0, 0.4588235, 1, 1,
0.1957754, 0.05469035, 2.756506, 0, 0.454902, 1, 1,
0.196133, -0.3750119, 3.302405, 0, 0.4470588, 1, 1,
0.1961728, 1.239252, 0.6355647, 0, 0.4431373, 1, 1,
0.2007422, 1.688028, 1.959017, 0, 0.4352941, 1, 1,
0.2071437, -0.2496078, 2.232148, 0, 0.4313726, 1, 1,
0.2135819, -2.719803, 2.602684, 0, 0.4235294, 1, 1,
0.2183864, -0.4921355, 1.77546, 0, 0.4196078, 1, 1,
0.2208285, -1.27317, 3.718627, 0, 0.4117647, 1, 1,
0.227233, 0.0722496, 3.007901, 0, 0.4078431, 1, 1,
0.2284831, -1.269196, 5.168781, 0, 0.4, 1, 1,
0.2318762, 0.6432307, 0.4176896, 0, 0.3921569, 1, 1,
0.2344506, -0.03546404, 1.589427, 0, 0.3882353, 1, 1,
0.2386367, 0.6435604, 1.124488, 0, 0.3803922, 1, 1,
0.243993, -3.380615, 4.111719, 0, 0.3764706, 1, 1,
0.2441293, -0.6177554, 2.88377, 0, 0.3686275, 1, 1,
0.2446996, 0.1663393, -0.2662281, 0, 0.3647059, 1, 1,
0.2455357, 0.9752093, -0.7088823, 0, 0.3568628, 1, 1,
0.2458706, 0.9886601, 0.9333192, 0, 0.3529412, 1, 1,
0.2482366, 1.532292, -0.6198874, 0, 0.345098, 1, 1,
0.2500648, 0.9412519, 0.09532372, 0, 0.3411765, 1, 1,
0.2535459, 0.871168, 0.07430907, 0, 0.3333333, 1, 1,
0.2590535, -0.3525369, 3.120968, 0, 0.3294118, 1, 1,
0.2610787, -0.6007807, 2.266533, 0, 0.3215686, 1, 1,
0.2636394, -0.8859981, 2.02572, 0, 0.3176471, 1, 1,
0.2645367, 0.641745, -0.06757452, 0, 0.3098039, 1, 1,
0.2694494, 0.01263024, -0.02498391, 0, 0.3058824, 1, 1,
0.2701602, -1.024335, 2.303332, 0, 0.2980392, 1, 1,
0.2754355, -0.6585924, 1.808807, 0, 0.2901961, 1, 1,
0.2783071, -0.1225034, 2.877785, 0, 0.2862745, 1, 1,
0.2807072, -0.0264187, 1.909292, 0, 0.2784314, 1, 1,
0.2811649, 1.320796, 0.1992198, 0, 0.2745098, 1, 1,
0.2819706, -0.7470595, 3.502248, 0, 0.2666667, 1, 1,
0.2883969, 0.92551, -2.064012, 0, 0.2627451, 1, 1,
0.2922709, 2.001256, -0.8752179, 0, 0.254902, 1, 1,
0.2952873, -0.8007792, 2.388747, 0, 0.2509804, 1, 1,
0.296842, -1.387638, 2.396871, 0, 0.2431373, 1, 1,
0.2989243, 0.7622026, 1.159103, 0, 0.2392157, 1, 1,
0.3003307, -0.6733808, 3.856476, 0, 0.2313726, 1, 1,
0.3062631, 0.9998177, 1.202785, 0, 0.227451, 1, 1,
0.3098376, -0.1215959, 1.733825, 0, 0.2196078, 1, 1,
0.3114554, 0.05162186, 0.4025123, 0, 0.2156863, 1, 1,
0.3124065, -0.6148618, 1.929702, 0, 0.2078431, 1, 1,
0.3124222, -0.5572765, 1.923193, 0, 0.2039216, 1, 1,
0.315385, 0.4959604, 0.8879219, 0, 0.1960784, 1, 1,
0.3171758, -0.5231809, 1.542171, 0, 0.1882353, 1, 1,
0.3218717, -1.541645, 3.626869, 0, 0.1843137, 1, 1,
0.3283939, 0.2598857, 2.803654, 0, 0.1764706, 1, 1,
0.3287239, -0.9229467, 1.481521, 0, 0.172549, 1, 1,
0.3322204, -0.384014, 3.068536, 0, 0.1647059, 1, 1,
0.3366838, 1.524816, 0.7393299, 0, 0.1607843, 1, 1,
0.3375331, -1.351019, 3.151434, 0, 0.1529412, 1, 1,
0.3523964, -0.7884859, 2.243022, 0, 0.1490196, 1, 1,
0.3529537, 0.8739662, 1.014003, 0, 0.1411765, 1, 1,
0.353451, -0.3598264, 2.968457, 0, 0.1372549, 1, 1,
0.3545671, -0.6707857, 2.796495, 0, 0.1294118, 1, 1,
0.3574877, -0.2741119, 3.317067, 0, 0.1254902, 1, 1,
0.3594654, -0.2863399, 2.568416, 0, 0.1176471, 1, 1,
0.3598441, 0.1761861, 3.021849, 0, 0.1137255, 1, 1,
0.3612098, 1.321127, 0.8006735, 0, 0.1058824, 1, 1,
0.3614948, -0.5835468, 3.088942, 0, 0.09803922, 1, 1,
0.3619261, -0.6501962, 2.948166, 0, 0.09411765, 1, 1,
0.3620013, 1.228653, -0.205305, 0, 0.08627451, 1, 1,
0.3625939, -0.1474651, 3.355194, 0, 0.08235294, 1, 1,
0.3631546, 0.7537714, 0.5019791, 0, 0.07450981, 1, 1,
0.3639266, 0.3435679, 2.142507, 0, 0.07058824, 1, 1,
0.3651689, -1.810639, 2.483299, 0, 0.0627451, 1, 1,
0.3651891, 0.08209399, 1.435902, 0, 0.05882353, 1, 1,
0.3655416, -1.842834, 4.366925, 0, 0.05098039, 1, 1,
0.3659221, -1.181005, 1.784435, 0, 0.04705882, 1, 1,
0.3699495, 1.378585, 0.103475, 0, 0.03921569, 1, 1,
0.3810977, -0.7775279, 0.5153152, 0, 0.03529412, 1, 1,
0.3856369, -0.33766, 1.735509, 0, 0.02745098, 1, 1,
0.3930365, -0.8148785, -0.2600768, 0, 0.02352941, 1, 1,
0.3982868, -1.698937, 3.253929, 0, 0.01568628, 1, 1,
0.4045148, 1.862536, -0.0532995, 0, 0.01176471, 1, 1,
0.4077351, 0.1405874, 1.319665, 0, 0.003921569, 1, 1,
0.4112767, -0.2521574, 2.888829, 0.003921569, 0, 1, 1,
0.413996, 0.7688614, 1.25572, 0.007843138, 0, 1, 1,
0.4192069, 1.073165, -0.9570751, 0.01568628, 0, 1, 1,
0.4203717, -0.2831726, 3.184729, 0.01960784, 0, 1, 1,
0.4233668, 0.6468689, -0.4202804, 0.02745098, 0, 1, 1,
0.430802, -0.2687896, 3.164574, 0.03137255, 0, 1, 1,
0.4341797, 0.4291271, 1.324836, 0.03921569, 0, 1, 1,
0.4388098, -0.2661952, 0.7925283, 0.04313726, 0, 1, 1,
0.4393678, -1.673375, 2.361808, 0.05098039, 0, 1, 1,
0.4412388, 0.7783132, 0.06859781, 0.05490196, 0, 1, 1,
0.4443592, -0.3974123, 1.378353, 0.0627451, 0, 1, 1,
0.4500911, 1.618768, -0.4575698, 0.06666667, 0, 1, 1,
0.4561353, -0.07671129, 3.39092, 0.07450981, 0, 1, 1,
0.4711134, 0.3553169, -0.1448395, 0.07843138, 0, 1, 1,
0.4795671, -0.08130825, 2.456929, 0.08627451, 0, 1, 1,
0.480664, 0.5199733, 1.431451, 0.09019608, 0, 1, 1,
0.4831427, -0.8701734, 4.974045, 0.09803922, 0, 1, 1,
0.4842191, -0.3679771, 3.566158, 0.1058824, 0, 1, 1,
0.4850226, -1.006007, 2.836097, 0.1098039, 0, 1, 1,
0.4882149, -1.296812, 3.177574, 0.1176471, 0, 1, 1,
0.4888675, -0.6953142, 3.177703, 0.1215686, 0, 1, 1,
0.4895249, 0.9410858, 2.593006, 0.1294118, 0, 1, 1,
0.4899168, -0.3518744, 2.008274, 0.1333333, 0, 1, 1,
0.4944673, 0.1777586, 1.768807, 0.1411765, 0, 1, 1,
0.5006121, -0.5811226, 2.871223, 0.145098, 0, 1, 1,
0.500633, 0.1437881, 0.4967381, 0.1529412, 0, 1, 1,
0.5071633, -1.211377, 1.228803, 0.1568628, 0, 1, 1,
0.5097806, -0.1929013, 1.835851, 0.1647059, 0, 1, 1,
0.5121657, 1.020645, 1.496863, 0.1686275, 0, 1, 1,
0.5122678, -0.6076659, 1.028997, 0.1764706, 0, 1, 1,
0.5127524, -0.6084704, 3.740386, 0.1803922, 0, 1, 1,
0.5168495, -1.463274, 3.263669, 0.1882353, 0, 1, 1,
0.5217211, -0.1172991, 1.940209, 0.1921569, 0, 1, 1,
0.5223013, -2.440505, 2.625071, 0.2, 0, 1, 1,
0.5255591, 0.6442385, 0.5170167, 0.2078431, 0, 1, 1,
0.5256191, 0.01172028, 3.099336, 0.2117647, 0, 1, 1,
0.528513, -1.191108, 1.195189, 0.2196078, 0, 1, 1,
0.5348037, -0.1025967, 0.5560156, 0.2235294, 0, 1, 1,
0.5383175, 1.909913, 0.7669938, 0.2313726, 0, 1, 1,
0.5454923, 0.2870766, 2.103438, 0.2352941, 0, 1, 1,
0.552281, -0.5248322, 3.263446, 0.2431373, 0, 1, 1,
0.5624024, -0.2002269, 1.5099, 0.2470588, 0, 1, 1,
0.565659, 0.8393805, 1.25375, 0.254902, 0, 1, 1,
0.5665107, -1.387828, 2.269427, 0.2588235, 0, 1, 1,
0.5712793, -0.9936613, 0.953858, 0.2666667, 0, 1, 1,
0.5725297, -1.033786, 1.264004, 0.2705882, 0, 1, 1,
0.5726085, 0.3614381, 2.537926, 0.2784314, 0, 1, 1,
0.5728146, 0.1667416, 1.30712, 0.282353, 0, 1, 1,
0.574914, -1.053353, 2.712467, 0.2901961, 0, 1, 1,
0.5792744, -0.04883906, 2.317247, 0.2941177, 0, 1, 1,
0.5793748, -0.5097735, 3.015981, 0.3019608, 0, 1, 1,
0.579536, -1.601046, 2.203593, 0.3098039, 0, 1, 1,
0.582512, -1.112373, 2.58668, 0.3137255, 0, 1, 1,
0.5843077, 0.3141267, 1.075806, 0.3215686, 0, 1, 1,
0.5855877, 1.146625, 0.5492202, 0.3254902, 0, 1, 1,
0.5925805, -0.7327116, 1.989828, 0.3333333, 0, 1, 1,
0.5963565, 0.8412183, 1.417353, 0.3372549, 0, 1, 1,
0.5981601, -0.738573, 3.162185, 0.345098, 0, 1, 1,
0.6035579, -2.200656, 5.369081, 0.3490196, 0, 1, 1,
0.6038538, -0.9434781, 3.164947, 0.3568628, 0, 1, 1,
0.6071572, -0.1685365, 1.345657, 0.3607843, 0, 1, 1,
0.6085274, 0.3925411, 1.245832, 0.3686275, 0, 1, 1,
0.6114239, -0.4498784, 1.475871, 0.372549, 0, 1, 1,
0.6117156, -0.2815543, 2.566029, 0.3803922, 0, 1, 1,
0.6121284, -1.061813, 1.995027, 0.3843137, 0, 1, 1,
0.6266799, -1.096107, 3.020897, 0.3921569, 0, 1, 1,
0.6320064, -0.7764698, 3.328851, 0.3960784, 0, 1, 1,
0.637888, -1.181633, 2.09985, 0.4039216, 0, 1, 1,
0.6382445, -0.1507665, 1.840835, 0.4117647, 0, 1, 1,
0.6393405, 1.605743, 0.4796171, 0.4156863, 0, 1, 1,
0.6441281, -0.05553403, 2.316883, 0.4235294, 0, 1, 1,
0.6469779, 1.0811, 0.5040002, 0.427451, 0, 1, 1,
0.6471257, 0.5923513, 1.272397, 0.4352941, 0, 1, 1,
0.6472905, -0.6773561, 4.213943, 0.4392157, 0, 1, 1,
0.6503068, -1.048571, 3.373759, 0.4470588, 0, 1, 1,
0.6560422, -1.053298, 2.487563, 0.4509804, 0, 1, 1,
0.6565954, -1.665881, 2.082935, 0.4588235, 0, 1, 1,
0.6593474, 0.4540585, 2.335265, 0.4627451, 0, 1, 1,
0.6634581, 1.011215, 0.5702873, 0.4705882, 0, 1, 1,
0.6674693, -0.4895464, 3.420897, 0.4745098, 0, 1, 1,
0.6694856, -0.9983025, 2.464265, 0.4823529, 0, 1, 1,
0.6700011, -0.9659166, 3.922067, 0.4862745, 0, 1, 1,
0.674247, -0.9203759, 2.238443, 0.4941176, 0, 1, 1,
0.6769885, -0.7437617, 1.210984, 0.5019608, 0, 1, 1,
0.6819638, -0.4100325, 2.406677, 0.5058824, 0, 1, 1,
0.6843974, 0.788136, 0.8367853, 0.5137255, 0, 1, 1,
0.6949671, -1.52209, 3.068664, 0.5176471, 0, 1, 1,
0.6990948, 1.877433, 1.081268, 0.5254902, 0, 1, 1,
0.7035282, -2.147061, 4.541697, 0.5294118, 0, 1, 1,
0.7060961, -0.2478343, 2.298782, 0.5372549, 0, 1, 1,
0.7079322, -0.2770818, 2.678568, 0.5411765, 0, 1, 1,
0.7153127, 0.1790051, 1.368755, 0.5490196, 0, 1, 1,
0.7186081, -1.189656, 2.013673, 0.5529412, 0, 1, 1,
0.7216685, -0.1844475, 1.20382, 0.5607843, 0, 1, 1,
0.7261729, 0.9456537, -0.2976504, 0.5647059, 0, 1, 1,
0.7322235, -0.8772345, 2.358929, 0.572549, 0, 1, 1,
0.7364892, -0.3847446, 0.784864, 0.5764706, 0, 1, 1,
0.7399489, 0.5732456, 1.120152, 0.5843138, 0, 1, 1,
0.7416106, 0.01059898, 2.095372, 0.5882353, 0, 1, 1,
0.7456216, 0.524407, 0.2072779, 0.5960785, 0, 1, 1,
0.7458642, -0.2832431, 1.997368, 0.6039216, 0, 1, 1,
0.7478599, 1.193853, 0.197922, 0.6078432, 0, 1, 1,
0.7503093, -0.6314808, 1.036705, 0.6156863, 0, 1, 1,
0.753242, 0.05611265, 1.961651, 0.6196079, 0, 1, 1,
0.7576346, -0.416116, 2.020073, 0.627451, 0, 1, 1,
0.7621495, 1.268714, 0.08521936, 0.6313726, 0, 1, 1,
0.7642965, -0.8239537, 2.210122, 0.6392157, 0, 1, 1,
0.7796258, -0.3879923, 3.083442, 0.6431373, 0, 1, 1,
0.78996, 0.1745919, 1.918853, 0.6509804, 0, 1, 1,
0.7964863, 0.4853866, -0.1585685, 0.654902, 0, 1, 1,
0.8030091, 0.2341773, 0.6154783, 0.6627451, 0, 1, 1,
0.8053365, -2.277961, 4.646155, 0.6666667, 0, 1, 1,
0.8061467, -0.2909919, 0.9307626, 0.6745098, 0, 1, 1,
0.8109876, 0.9525873, -0.1820466, 0.6784314, 0, 1, 1,
0.812163, 1.5991, 0.4390856, 0.6862745, 0, 1, 1,
0.814975, 0.04974345, 1.770382, 0.6901961, 0, 1, 1,
0.818978, 1.016095, 0.330978, 0.6980392, 0, 1, 1,
0.8192935, 0.803874, 0.968339, 0.7058824, 0, 1, 1,
0.8198622, 1.177611, 0.5806566, 0.7098039, 0, 1, 1,
0.8253164, -0.3426447, 2.678959, 0.7176471, 0, 1, 1,
0.8425458, -0.1407152, 0.7494912, 0.7215686, 0, 1, 1,
0.8432468, 1.211241, 0.9850025, 0.7294118, 0, 1, 1,
0.8436929, 1.46483, 1.178096, 0.7333333, 0, 1, 1,
0.8458706, 0.5624245, 0.3781103, 0.7411765, 0, 1, 1,
0.8499237, 0.1609946, -0.2413064, 0.7450981, 0, 1, 1,
0.8552207, -0.4893961, 2.090832, 0.7529412, 0, 1, 1,
0.8613389, -0.9845008, 2.500722, 0.7568628, 0, 1, 1,
0.8638892, -0.4388073, 0.1555969, 0.7647059, 0, 1, 1,
0.8682657, -1.008043, 1.016675, 0.7686275, 0, 1, 1,
0.8682737, 0.912772, 0.2421159, 0.7764706, 0, 1, 1,
0.8729316, 0.6784757, -0.9519873, 0.7803922, 0, 1, 1,
0.8737133, 0.2539481, 1.160751, 0.7882353, 0, 1, 1,
0.8750903, 0.05360683, 1.066789, 0.7921569, 0, 1, 1,
0.8769991, -0.5570366, 3.229311, 0.8, 0, 1, 1,
0.8780632, -0.1339945, 3.037602, 0.8078431, 0, 1, 1,
0.8788331, -0.1731836, 2.472122, 0.8117647, 0, 1, 1,
0.8811356, -0.634738, 3.566898, 0.8196079, 0, 1, 1,
0.8814671, -0.1428527, 1.83195, 0.8235294, 0, 1, 1,
0.8880434, 1.09869, 0.5308671, 0.8313726, 0, 1, 1,
0.8890314, -0.01608961, 1.468076, 0.8352941, 0, 1, 1,
0.8892719, 1.040186, 1.743083, 0.8431373, 0, 1, 1,
0.8956012, -0.841639, 1.685603, 0.8470588, 0, 1, 1,
0.8963181, -1.393836, 3.126697, 0.854902, 0, 1, 1,
0.8974467, 0.363433, 0.4399366, 0.8588235, 0, 1, 1,
0.8980226, -0.1762384, 0.6808596, 0.8666667, 0, 1, 1,
0.9041665, 2.358789, 0.575684, 0.8705882, 0, 1, 1,
0.9088541, 0.9691796, -0.06946155, 0.8784314, 0, 1, 1,
0.9209861, -0.2438166, 1.961313, 0.8823529, 0, 1, 1,
0.9278527, 0.07027894, 2.307962, 0.8901961, 0, 1, 1,
0.9293426, -2.055475, 3.428424, 0.8941177, 0, 1, 1,
0.9305719, 0.1272904, 0.03983066, 0.9019608, 0, 1, 1,
0.9342894, -1.144101, 1.335265, 0.9098039, 0, 1, 1,
0.9350845, 0.02390608, 1.792227, 0.9137255, 0, 1, 1,
0.9457666, -0.3746687, -0.3776584, 0.9215686, 0, 1, 1,
0.9605696, -0.8881174, 2.2563, 0.9254902, 0, 1, 1,
0.9606333, 3.004243, 0.4607383, 0.9333333, 0, 1, 1,
0.9621214, 0.9566076, 1.291596, 0.9372549, 0, 1, 1,
0.9632853, -0.397022, 1.717206, 0.945098, 0, 1, 1,
0.9660965, -0.4629983, -0.2872764, 0.9490196, 0, 1, 1,
0.9684588, -0.07607252, 0.7077569, 0.9568627, 0, 1, 1,
0.9754176, -0.6089758, 2.299305, 0.9607843, 0, 1, 1,
0.9841501, 0.003972484, 0.7374693, 0.9686275, 0, 1, 1,
0.9887287, 1.585859, -1.286362, 0.972549, 0, 1, 1,
0.9900525, -0.6932929, 2.0994, 0.9803922, 0, 1, 1,
0.9959101, 1.039802, 2.254669, 0.9843137, 0, 1, 1,
1.010799, -0.678787, 0.5472995, 0.9921569, 0, 1, 1,
1.015538, 1.914804, 0.7613717, 0.9960784, 0, 1, 1,
1.018364, 0.01328292, 0.896363, 1, 0, 0.9960784, 1,
1.024562, 0.6448191, 3.270501, 1, 0, 0.9882353, 1,
1.026968, -0.1402123, 1.973206, 1, 0, 0.9843137, 1,
1.027888, 0.1228983, 1.702414, 1, 0, 0.9764706, 1,
1.029957, -0.4947284, 0.4366163, 1, 0, 0.972549, 1,
1.034425, 1.20143, -0.5090302, 1, 0, 0.9647059, 1,
1.039122, 1.321212, 2.333304, 1, 0, 0.9607843, 1,
1.041104, 0.8847746, 0.9113529, 1, 0, 0.9529412, 1,
1.041248, -1.37159, 3.435807, 1, 0, 0.9490196, 1,
1.051572, -0.8797817, 1.865452, 1, 0, 0.9411765, 1,
1.057657, 1.875975, 0.4281569, 1, 0, 0.9372549, 1,
1.06415, -0.5946913, 1.557171, 1, 0, 0.9294118, 1,
1.064184, 0.527918, -1.062309, 1, 0, 0.9254902, 1,
1.065548, 0.186728, 2.367767, 1, 0, 0.9176471, 1,
1.068792, -0.9766214, 2.95523, 1, 0, 0.9137255, 1,
1.076715, 0.7147936, 1.246816, 1, 0, 0.9058824, 1,
1.082248, -0.2526355, 3.702785, 1, 0, 0.9019608, 1,
1.086631, -0.9236948, 3.305885, 1, 0, 0.8941177, 1,
1.090253, -1.626747, 2.256716, 1, 0, 0.8862745, 1,
1.097047, 2.377129, -1.252294, 1, 0, 0.8823529, 1,
1.09901, 0.1571006, 3.001971, 1, 0, 0.8745098, 1,
1.1063, 1.995375, 1.22336, 1, 0, 0.8705882, 1,
1.115306, 0.5458598, 0.01254073, 1, 0, 0.8627451, 1,
1.118735, -0.7644675, 3.101939, 1, 0, 0.8588235, 1,
1.123138, 0.7584116, 0.9576356, 1, 0, 0.8509804, 1,
1.125808, 1.051303, 2.095053, 1, 0, 0.8470588, 1,
1.125907, -0.8974688, 1.01379, 1, 0, 0.8392157, 1,
1.127405, -0.6186316, 3.091815, 1, 0, 0.8352941, 1,
1.132676, -0.8718097, 2.939031, 1, 0, 0.827451, 1,
1.136636, -1.082468, 4.142133, 1, 0, 0.8235294, 1,
1.140846, 1.45581, -0.2684089, 1, 0, 0.8156863, 1,
1.143269, -0.8052536, 0.7368246, 1, 0, 0.8117647, 1,
1.143411, 0.8986209, 0.7695473, 1, 0, 0.8039216, 1,
1.150232, -0.1592373, 1.129639, 1, 0, 0.7960784, 1,
1.152081, 0.8668688, -0.04541815, 1, 0, 0.7921569, 1,
1.165993, -2.444242, 2.872608, 1, 0, 0.7843137, 1,
1.166059, 0.4938281, 0.1263525, 1, 0, 0.7803922, 1,
1.167193, -0.6764621, 1.279134, 1, 0, 0.772549, 1,
1.169206, 0.2559047, 3.9873, 1, 0, 0.7686275, 1,
1.172549, -1.505157, 4.010653, 1, 0, 0.7607843, 1,
1.175568, 1.562298, 0.398584, 1, 0, 0.7568628, 1,
1.177213, -0.5939584, 2.084035, 1, 0, 0.7490196, 1,
1.179375, -0.5067134, 1.625052, 1, 0, 0.7450981, 1,
1.179879, -0.7088528, 2.833298, 1, 0, 0.7372549, 1,
1.183862, -0.6661608, 1.110332, 1, 0, 0.7333333, 1,
1.18516, -1.615085, 1.11962, 1, 0, 0.7254902, 1,
1.19083, 0.9003605, 1.466849, 1, 0, 0.7215686, 1,
1.191429, -0.1652441, 2.715413, 1, 0, 0.7137255, 1,
1.196121, -1.064205, 2.918968, 1, 0, 0.7098039, 1,
1.204138, 1.234594, -1.677588, 1, 0, 0.7019608, 1,
1.207905, -1.736943, 2.003032, 1, 0, 0.6941177, 1,
1.20883, -0.8059876, 1.876489, 1, 0, 0.6901961, 1,
1.212481, -0.4971847, 2.520163, 1, 0, 0.682353, 1,
1.215101, 0.06781083, 1.998856, 1, 0, 0.6784314, 1,
1.225936, 0.4175228, -0.1005529, 1, 0, 0.6705883, 1,
1.225998, -0.8109296, 0.9546379, 1, 0, 0.6666667, 1,
1.23051, 0.990554, 1.082298, 1, 0, 0.6588235, 1,
1.23434, -1.186031, -0.287046, 1, 0, 0.654902, 1,
1.249396, 0.701428, 1.923186, 1, 0, 0.6470588, 1,
1.253251, -0.9566954, 0.8992238, 1, 0, 0.6431373, 1,
1.26069, -0.4796054, 2.18257, 1, 0, 0.6352941, 1,
1.263383, -1.109724, 2.448373, 1, 0, 0.6313726, 1,
1.270456, 1.498418, 0.09880308, 1, 0, 0.6235294, 1,
1.275125, -1.198534, 2.823423, 1, 0, 0.6196079, 1,
1.278156, -1.225387, 1.23735, 1, 0, 0.6117647, 1,
1.285845, -0.3136218, 2.893517, 1, 0, 0.6078432, 1,
1.289516, 0.8175241, 2.2087, 1, 0, 0.6, 1,
1.292922, 2.128017, 0.5811067, 1, 0, 0.5921569, 1,
1.296625, 0.9952074, 1.602465, 1, 0, 0.5882353, 1,
1.306409, 1.862795, 0.4557179, 1, 0, 0.5803922, 1,
1.309404, 0.808436, 0.2528592, 1, 0, 0.5764706, 1,
1.313024, 0.7653754, -0.5325618, 1, 0, 0.5686275, 1,
1.321375, 0.182473, 1.076439, 1, 0, 0.5647059, 1,
1.323069, 0.9973836, 1.08385, 1, 0, 0.5568628, 1,
1.326945, 0.4160982, 2.443795, 1, 0, 0.5529412, 1,
1.334375, 0.8269924, 1.240497, 1, 0, 0.5450981, 1,
1.33491, 0.1923139, 1.645501, 1, 0, 0.5411765, 1,
1.340203, -1.371698, 1.642671, 1, 0, 0.5333334, 1,
1.346368, -0.2343891, 1.810865, 1, 0, 0.5294118, 1,
1.352963, 0.6831789, 1.721135, 1, 0, 0.5215687, 1,
1.353734, 1.229736, 0.3935262, 1, 0, 0.5176471, 1,
1.35617, -0.1666386, 0.8888841, 1, 0, 0.509804, 1,
1.357673, -0.1263267, 2.257811, 1, 0, 0.5058824, 1,
1.366469, -0.01823245, -0.5157679, 1, 0, 0.4980392, 1,
1.379147, 0.221607, -0.03491131, 1, 0, 0.4901961, 1,
1.38354, -0.354479, 2.538213, 1, 0, 0.4862745, 1,
1.391058, 0.4008382, -1.157166, 1, 0, 0.4784314, 1,
1.40182, 0.5703316, 1.550446, 1, 0, 0.4745098, 1,
1.409364, 0.8427419, 0.6745312, 1, 0, 0.4666667, 1,
1.415283, 0.3106335, 2.052, 1, 0, 0.4627451, 1,
1.419737, 0.09244909, 2.173014, 1, 0, 0.454902, 1,
1.428706, -1.153857, 1.039107, 1, 0, 0.4509804, 1,
1.431274, -0.4603212, 2.523021, 1, 0, 0.4431373, 1,
1.443887, -1.147633, 1.158867, 1, 0, 0.4392157, 1,
1.449311, 0.3307948, 0.8270109, 1, 0, 0.4313726, 1,
1.460492, -0.9947587, 2.365863, 1, 0, 0.427451, 1,
1.466724, 0.9597879, 0.2504835, 1, 0, 0.4196078, 1,
1.467732, 0.1800244, 0.9470392, 1, 0, 0.4156863, 1,
1.476589, -0.3188706, 2.26433, 1, 0, 0.4078431, 1,
1.484132, -0.8735617, 1.72826, 1, 0, 0.4039216, 1,
1.49134, 0.2586778, 2.884464, 1, 0, 0.3960784, 1,
1.493061, -1.534335, 3.731164, 1, 0, 0.3882353, 1,
1.493842, -0.4425495, 1.528051, 1, 0, 0.3843137, 1,
1.495089, -0.848214, 2.477019, 1, 0, 0.3764706, 1,
1.495733, 0.2021362, 0.911967, 1, 0, 0.372549, 1,
1.498221, 0.1761818, 2.303993, 1, 0, 0.3647059, 1,
1.501307, 0.1886944, 0.8743156, 1, 0, 0.3607843, 1,
1.507881, -1.227134, 3.749838, 1, 0, 0.3529412, 1,
1.514369, 1.318794, -0.2831331, 1, 0, 0.3490196, 1,
1.544769, -0.6488402, 1.152264, 1, 0, 0.3411765, 1,
1.546484, 0.4899664, 2.016471, 1, 0, 0.3372549, 1,
1.569221, -0.229654, 0.6572303, 1, 0, 0.3294118, 1,
1.572068, -1.707709, 2.586793, 1, 0, 0.3254902, 1,
1.577958, 0.4451819, 2.659846, 1, 0, 0.3176471, 1,
1.58849, 0.7900342, 0.1268536, 1, 0, 0.3137255, 1,
1.592649, 0.4090659, -0.6359041, 1, 0, 0.3058824, 1,
1.597864, -0.3257725, 1.221322, 1, 0, 0.2980392, 1,
1.609713, 1.097897, 2.108108, 1, 0, 0.2941177, 1,
1.617306, 0.5289657, 1.067421, 1, 0, 0.2862745, 1,
1.634516, 0.6520904, 1.485362, 1, 0, 0.282353, 1,
1.644687, -0.7382764, 1.924024, 1, 0, 0.2745098, 1,
1.651674, 0.4073613, 3.701989, 1, 0, 0.2705882, 1,
1.687993, 0.1319339, 0.9700682, 1, 0, 0.2627451, 1,
1.698321, 0.3529757, 1.72562, 1, 0, 0.2588235, 1,
1.70115, 2.211305, 2.190567, 1, 0, 0.2509804, 1,
1.709172, 1.120346, 0.8974982, 1, 0, 0.2470588, 1,
1.712706, -0.3624913, 2.495652, 1, 0, 0.2392157, 1,
1.714203, 0.1136104, 0.7749969, 1, 0, 0.2352941, 1,
1.728597, -0.6846119, 3.252679, 1, 0, 0.227451, 1,
1.739461, 0.6259687, 2.921793, 1, 0, 0.2235294, 1,
1.743403, 0.6830248, 0.9482735, 1, 0, 0.2156863, 1,
1.755636, 0.09054547, 0.8983926, 1, 0, 0.2117647, 1,
1.780838, -0.5821446, 2.002797, 1, 0, 0.2039216, 1,
1.840122, -0.1389427, 0.8118502, 1, 0, 0.1960784, 1,
1.850657, -1.621145, -0.3084552, 1, 0, 0.1921569, 1,
1.873206, 0.1545791, 3.254498, 1, 0, 0.1843137, 1,
1.882664, 0.8376043, 0.3417552, 1, 0, 0.1803922, 1,
1.89792, -0.0743682, 0.0437231, 1, 0, 0.172549, 1,
1.90858, 0.8176049, 1.609108, 1, 0, 0.1686275, 1,
1.910376, 1.61881, 1.078398, 1, 0, 0.1607843, 1,
1.924212, -0.9153726, 1.70244, 1, 0, 0.1568628, 1,
1.93156, -0.3229777, 1.548053, 1, 0, 0.1490196, 1,
1.976263, 0.9575989, 1.033601, 1, 0, 0.145098, 1,
1.993405, -1.570728, 1.310574, 1, 0, 0.1372549, 1,
2.000544, 2.30677, 2.450417, 1, 0, 0.1333333, 1,
2.084656, -0.1283041, -0.5152872, 1, 0, 0.1254902, 1,
2.097945, 0.6906962, 0.5030417, 1, 0, 0.1215686, 1,
2.106442, -1.150948, 1.306266, 1, 0, 0.1137255, 1,
2.107643, -0.07323088, 2.281046, 1, 0, 0.1098039, 1,
2.121013, -0.7772751, 3.159033, 1, 0, 0.1019608, 1,
2.122319, 1.421554, -0.01521772, 1, 0, 0.09411765, 1,
2.130983, 0.8574159, 0.05605032, 1, 0, 0.09019608, 1,
2.140586, -1.617735, 3.952396, 1, 0, 0.08235294, 1,
2.218966, -0.03960769, 2.200802, 1, 0, 0.07843138, 1,
2.30914, -0.383617, 1.14001, 1, 0, 0.07058824, 1,
2.370857, 1.460896, 2.241511, 1, 0, 0.06666667, 1,
2.421183, 0.7914391, 2.41219, 1, 0, 0.05882353, 1,
2.463935, 0.1742356, 1.86241, 1, 0, 0.05490196, 1,
2.479433, 0.05161034, 1.366846, 1, 0, 0.04705882, 1,
2.581458, -0.1228405, 1.11877, 1, 0, 0.04313726, 1,
2.59941, 1.824177, 3.443907, 1, 0, 0.03529412, 1,
2.788037, 0.555048, -0.414564, 1, 0, 0.03137255, 1,
2.846084, 1.522784, 1.376098, 1, 0, 0.02352941, 1,
2.87063, -1.313381, 1.009807, 1, 0, 0.01960784, 1,
2.933165, 0.8158923, -0.1807427, 1, 0, 0.01176471, 1,
3.238654, 0.04005383, 2.904303, 1, 0, 0.007843138, 1
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
0.2179288, -4.462848, -7.026326, 0, -0.5, 0.5, 0.5,
0.2179288, -4.462848, -7.026326, 1, -0.5, 0.5, 0.5,
0.2179288, -4.462848, -7.026326, 1, 1.5, 0.5, 0.5,
0.2179288, -4.462848, -7.026326, 0, 1.5, 0.5, 0.5
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
-3.826822, -0.1881856, -7.026326, 0, -0.5, 0.5, 0.5,
-3.826822, -0.1881856, -7.026326, 1, -0.5, 0.5, 0.5,
-3.826822, -0.1881856, -7.026326, 1, 1.5, 0.5, 0.5,
-3.826822, -0.1881856, -7.026326, 0, 1.5, 0.5, 0.5
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
-3.826822, -4.462848, 0.06963348, 0, -0.5, 0.5, 0.5,
-3.826822, -4.462848, 0.06963348, 1, -0.5, 0.5, 0.5,
-3.826822, -4.462848, 0.06963348, 1, 1.5, 0.5, 0.5,
-3.826822, -4.462848, 0.06963348, 0, 1.5, 0.5, 0.5
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
-2, -3.476388, -5.388797,
3, -3.476388, -5.388797,
-2, -3.476388, -5.388797,
-2, -3.640797, -5.661718,
-1, -3.476388, -5.388797,
-1, -3.640797, -5.661718,
0, -3.476388, -5.388797,
0, -3.640797, -5.661718,
1, -3.476388, -5.388797,
1, -3.640797, -5.661718,
2, -3.476388, -5.388797,
2, -3.640797, -5.661718,
3, -3.476388, -5.388797,
3, -3.640797, -5.661718
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
-2, -3.969618, -6.207561, 0, -0.5, 0.5, 0.5,
-2, -3.969618, -6.207561, 1, -0.5, 0.5, 0.5,
-2, -3.969618, -6.207561, 1, 1.5, 0.5, 0.5,
-2, -3.969618, -6.207561, 0, 1.5, 0.5, 0.5,
-1, -3.969618, -6.207561, 0, -0.5, 0.5, 0.5,
-1, -3.969618, -6.207561, 1, -0.5, 0.5, 0.5,
-1, -3.969618, -6.207561, 1, 1.5, 0.5, 0.5,
-1, -3.969618, -6.207561, 0, 1.5, 0.5, 0.5,
0, -3.969618, -6.207561, 0, -0.5, 0.5, 0.5,
0, -3.969618, -6.207561, 1, -0.5, 0.5, 0.5,
0, -3.969618, -6.207561, 1, 1.5, 0.5, 0.5,
0, -3.969618, -6.207561, 0, 1.5, 0.5, 0.5,
1, -3.969618, -6.207561, 0, -0.5, 0.5, 0.5,
1, -3.969618, -6.207561, 1, -0.5, 0.5, 0.5,
1, -3.969618, -6.207561, 1, 1.5, 0.5, 0.5,
1, -3.969618, -6.207561, 0, 1.5, 0.5, 0.5,
2, -3.969618, -6.207561, 0, -0.5, 0.5, 0.5,
2, -3.969618, -6.207561, 1, -0.5, 0.5, 0.5,
2, -3.969618, -6.207561, 1, 1.5, 0.5, 0.5,
2, -3.969618, -6.207561, 0, 1.5, 0.5, 0.5,
3, -3.969618, -6.207561, 0, -0.5, 0.5, 0.5,
3, -3.969618, -6.207561, 1, -0.5, 0.5, 0.5,
3, -3.969618, -6.207561, 1, 1.5, 0.5, 0.5,
3, -3.969618, -6.207561, 0, 1.5, 0.5, 0.5
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
-2.893418, -3, -5.388797,
-2.893418, 3, -5.388797,
-2.893418, -3, -5.388797,
-3.048985, -3, -5.661718,
-2.893418, -2, -5.388797,
-3.048985, -2, -5.661718,
-2.893418, -1, -5.388797,
-3.048985, -1, -5.661718,
-2.893418, 0, -5.388797,
-3.048985, 0, -5.661718,
-2.893418, 1, -5.388797,
-3.048985, 1, -5.661718,
-2.893418, 2, -5.388797,
-3.048985, 2, -5.661718,
-2.893418, 3, -5.388797,
-3.048985, 3, -5.661718
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
-3.36012, -3, -6.207561, 0, -0.5, 0.5, 0.5,
-3.36012, -3, -6.207561, 1, -0.5, 0.5, 0.5,
-3.36012, -3, -6.207561, 1, 1.5, 0.5, 0.5,
-3.36012, -3, -6.207561, 0, 1.5, 0.5, 0.5,
-3.36012, -2, -6.207561, 0, -0.5, 0.5, 0.5,
-3.36012, -2, -6.207561, 1, -0.5, 0.5, 0.5,
-3.36012, -2, -6.207561, 1, 1.5, 0.5, 0.5,
-3.36012, -2, -6.207561, 0, 1.5, 0.5, 0.5,
-3.36012, -1, -6.207561, 0, -0.5, 0.5, 0.5,
-3.36012, -1, -6.207561, 1, -0.5, 0.5, 0.5,
-3.36012, -1, -6.207561, 1, 1.5, 0.5, 0.5,
-3.36012, -1, -6.207561, 0, 1.5, 0.5, 0.5,
-3.36012, 0, -6.207561, 0, -0.5, 0.5, 0.5,
-3.36012, 0, -6.207561, 1, -0.5, 0.5, 0.5,
-3.36012, 0, -6.207561, 1, 1.5, 0.5, 0.5,
-3.36012, 0, -6.207561, 0, 1.5, 0.5, 0.5,
-3.36012, 1, -6.207561, 0, -0.5, 0.5, 0.5,
-3.36012, 1, -6.207561, 1, -0.5, 0.5, 0.5,
-3.36012, 1, -6.207561, 1, 1.5, 0.5, 0.5,
-3.36012, 1, -6.207561, 0, 1.5, 0.5, 0.5,
-3.36012, 2, -6.207561, 0, -0.5, 0.5, 0.5,
-3.36012, 2, -6.207561, 1, -0.5, 0.5, 0.5,
-3.36012, 2, -6.207561, 1, 1.5, 0.5, 0.5,
-3.36012, 2, -6.207561, 0, 1.5, 0.5, 0.5,
-3.36012, 3, -6.207561, 0, -0.5, 0.5, 0.5,
-3.36012, 3, -6.207561, 1, -0.5, 0.5, 0.5,
-3.36012, 3, -6.207561, 1, 1.5, 0.5, 0.5,
-3.36012, 3, -6.207561, 0, 1.5, 0.5, 0.5
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
-2.893418, -3.476388, -4,
-2.893418, -3.476388, 4,
-2.893418, -3.476388, -4,
-3.048985, -3.640797, -4,
-2.893418, -3.476388, -2,
-3.048985, -3.640797, -2,
-2.893418, -3.476388, 0,
-3.048985, -3.640797, 0,
-2.893418, -3.476388, 2,
-3.048985, -3.640797, 2,
-2.893418, -3.476388, 4,
-3.048985, -3.640797, 4
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
-3.36012, -3.969618, -4, 0, -0.5, 0.5, 0.5,
-3.36012, -3.969618, -4, 1, -0.5, 0.5, 0.5,
-3.36012, -3.969618, -4, 1, 1.5, 0.5, 0.5,
-3.36012, -3.969618, -4, 0, 1.5, 0.5, 0.5,
-3.36012, -3.969618, -2, 0, -0.5, 0.5, 0.5,
-3.36012, -3.969618, -2, 1, -0.5, 0.5, 0.5,
-3.36012, -3.969618, -2, 1, 1.5, 0.5, 0.5,
-3.36012, -3.969618, -2, 0, 1.5, 0.5, 0.5,
-3.36012, -3.969618, 0, 0, -0.5, 0.5, 0.5,
-3.36012, -3.969618, 0, 1, -0.5, 0.5, 0.5,
-3.36012, -3.969618, 0, 1, 1.5, 0.5, 0.5,
-3.36012, -3.969618, 0, 0, 1.5, 0.5, 0.5,
-3.36012, -3.969618, 2, 0, -0.5, 0.5, 0.5,
-3.36012, -3.969618, 2, 1, -0.5, 0.5, 0.5,
-3.36012, -3.969618, 2, 1, 1.5, 0.5, 0.5,
-3.36012, -3.969618, 2, 0, 1.5, 0.5, 0.5,
-3.36012, -3.969618, 4, 0, -0.5, 0.5, 0.5,
-3.36012, -3.969618, 4, 1, -0.5, 0.5, 0.5,
-3.36012, -3.969618, 4, 1, 1.5, 0.5, 0.5,
-3.36012, -3.969618, 4, 0, 1.5, 0.5, 0.5
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
-2.893418, -3.476388, -5.388797,
-2.893418, 3.100016, -5.388797,
-2.893418, -3.476388, 5.528064,
-2.893418, 3.100016, 5.528064,
-2.893418, -3.476388, -5.388797,
-2.893418, -3.476388, 5.528064,
-2.893418, 3.100016, -5.388797,
-2.893418, 3.100016, 5.528064,
-2.893418, -3.476388, -5.388797,
3.329276, -3.476388, -5.388797,
-2.893418, -3.476388, 5.528064,
3.329276, -3.476388, 5.528064,
-2.893418, 3.100016, -5.388797,
3.329276, 3.100016, -5.388797,
-2.893418, 3.100016, 5.528064,
3.329276, 3.100016, 5.528064,
3.329276, -3.476388, -5.388797,
3.329276, 3.100016, -5.388797,
3.329276, -3.476388, 5.528064,
3.329276, 3.100016, 5.528064,
3.329276, -3.476388, -5.388797,
3.329276, -3.476388, 5.528064,
3.329276, 3.100016, -5.388797,
3.329276, 3.100016, 5.528064
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
var radius = 7.573284;
var distance = 33.6944;
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
mvMatrix.translate( -0.2179288, 0.1881856, -0.06963348 );
mvMatrix.scale( 1.31589, 1.245116, 0.7500675 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.6944);
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
DCBN<-read.table("DCBN.xyz")
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
-2.802796, -0.3341197, -3.248951, 0, 0, 1, 1, 1,
-2.673811, -0.1078997, -1.059646, 1, 0, 0, 1, 1,
-2.619901, 2.445881, -0.4772614, 1, 0, 0, 1, 1,
-2.421091, -0.4116758, -2.564407, 1, 0, 0, 1, 1,
-2.383958, -0.3335771, -2.178589, 1, 0, 0, 1, 1,
-2.361372, 0.4206966, -1.492747, 1, 0, 0, 1, 1,
-2.356782, -0.375322, -2.209076, 0, 0, 0, 1, 1,
-2.35182, 1.060678, -0.9809275, 0, 0, 0, 1, 1,
-2.334477, 1.589041, -1.485713, 0, 0, 0, 1, 1,
-2.324238, 2.035076, -1.043461, 0, 0, 0, 1, 1,
-2.293862, 0.7021959, -1.731636, 0, 0, 0, 1, 1,
-2.253095, -0.0620718, -1.571444, 0, 0, 0, 1, 1,
-2.248954, 0.5642655, -1.227073, 0, 0, 0, 1, 1,
-2.243707, -0.6632641, -1.410254, 1, 1, 1, 1, 1,
-2.237939, 0.2450584, 0.521816, 1, 1, 1, 1, 1,
-2.205329, -0.3394245, -1.323615, 1, 1, 1, 1, 1,
-2.204587, -0.5230213, -1.818583, 1, 1, 1, 1, 1,
-2.200995, -0.3300476, -0.8301174, 1, 1, 1, 1, 1,
-2.19874, -0.6048519, -1.16633, 1, 1, 1, 1, 1,
-2.16235, -0.7554402, -2.335667, 1, 1, 1, 1, 1,
-2.158547, 0.01121497, -2.526223, 1, 1, 1, 1, 1,
-2.147917, -1.200605, -1.876134, 1, 1, 1, 1, 1,
-2.055853, -0.164376, -0.7455398, 1, 1, 1, 1, 1,
-2.051479, -0.7413281, -1.933411, 1, 1, 1, 1, 1,
-2.045454, -1.075003, -1.802161, 1, 1, 1, 1, 1,
-2.039818, -1.46944, -0.8690823, 1, 1, 1, 1, 1,
-2.028411, 0.6299636, -0.7342846, 1, 1, 1, 1, 1,
-2.008179, 0.9351662, -2.381012, 1, 1, 1, 1, 1,
-1.896713, 1.272289, -2.481183, 0, 0, 1, 1, 1,
-1.890716, 1.25369, 0.1758832, 1, 0, 0, 1, 1,
-1.890236, 2.662552, -1.15117, 1, 0, 0, 1, 1,
-1.861157, 1.515642, -0.9914732, 1, 0, 0, 1, 1,
-1.813015, -0.371996, -1.720051, 1, 0, 0, 1, 1,
-1.806546, 0.392961, 0.07419689, 1, 0, 0, 1, 1,
-1.806428, 1.271091, 0.562602, 0, 0, 0, 1, 1,
-1.780808, 0.9123699, -1.264958, 0, 0, 0, 1, 1,
-1.754175, 1.142058, 0.400824, 0, 0, 0, 1, 1,
-1.751809, 0.5216391, -0.6703593, 0, 0, 0, 1, 1,
-1.745437, -0.7863648, -0.8820667, 0, 0, 0, 1, 1,
-1.732134, 1.253205, -1.600415, 0, 0, 0, 1, 1,
-1.724701, -1.15957, -1.752902, 0, 0, 0, 1, 1,
-1.717108, -1.228047, -0.2258772, 1, 1, 1, 1, 1,
-1.710299, 0.07981174, -3.725014, 1, 1, 1, 1, 1,
-1.69813, 0.1269841, -1.758725, 1, 1, 1, 1, 1,
-1.64143, 2.159456, -0.4483537, 1, 1, 1, 1, 1,
-1.63583, -0.1066728, -1.069275, 1, 1, 1, 1, 1,
-1.627867, 2.05465, 0.5273265, 1, 1, 1, 1, 1,
-1.624121, -0.5145115, -2.892995, 1, 1, 1, 1, 1,
-1.623695, 1.036538, 0.02456498, 1, 1, 1, 1, 1,
-1.612815, 1.283925, -1.596371, 1, 1, 1, 1, 1,
-1.606061, 0.5827645, -0.265722, 1, 1, 1, 1, 1,
-1.605311, -2.338442, -0.918525, 1, 1, 1, 1, 1,
-1.604176, 1.488623, -0.2324386, 1, 1, 1, 1, 1,
-1.587065, 0.2892195, -1.615663, 1, 1, 1, 1, 1,
-1.584714, 0.4309339, -1.04893, 1, 1, 1, 1, 1,
-1.584517, 0.5361438, -0.9748214, 1, 1, 1, 1, 1,
-1.58389, 0.1849601, -1.552518, 0, 0, 1, 1, 1,
-1.565945, -0.1907142, -2.269733, 1, 0, 0, 1, 1,
-1.560919, 0.8142158, -1.593692, 1, 0, 0, 1, 1,
-1.554714, -0.5130951, -1.123431, 1, 0, 0, 1, 1,
-1.549499, -1.642492, -2.866998, 1, 0, 0, 1, 1,
-1.524973, -0.05378124, -1.788964, 1, 0, 0, 1, 1,
-1.524363, -0.7219901, -2.06856, 0, 0, 0, 1, 1,
-1.518363, -1.0095, -3.280751, 0, 0, 0, 1, 1,
-1.509212, -0.2329519, -1.294319, 0, 0, 0, 1, 1,
-1.507047, 1.073426, -1.580248, 0, 0, 0, 1, 1,
-1.506448, -0.9670321, -4.793168, 0, 0, 0, 1, 1,
-1.506209, 0.05046398, -1.162357, 0, 0, 0, 1, 1,
-1.499132, 0.3850903, -1.153803, 0, 0, 0, 1, 1,
-1.49302, -1.353892, -1.51434, 1, 1, 1, 1, 1,
-1.480177, 0.9577022, -0.1222449, 1, 1, 1, 1, 1,
-1.474619, -0.3849975, -2.600224, 1, 1, 1, 1, 1,
-1.465674, -0.610241, -4.049661, 1, 1, 1, 1, 1,
-1.463184, 0.2509194, -1.436833, 1, 1, 1, 1, 1,
-1.463072, 0.06778096, -1.664159, 1, 1, 1, 1, 1,
-1.449582, -2.232494, -3.308584, 1, 1, 1, 1, 1,
-1.448334, 1.184986, -1.791586, 1, 1, 1, 1, 1,
-1.439352, 0.9104989, -1.186671, 1, 1, 1, 1, 1,
-1.436414, 0.5403953, -0.9390578, 1, 1, 1, 1, 1,
-1.434658, -0.08156525, -0.6651243, 1, 1, 1, 1, 1,
-1.428559, -0.5169384, -1.641692, 1, 1, 1, 1, 1,
-1.424697, -0.4206406, -1.96383, 1, 1, 1, 1, 1,
-1.424128, -0.725639, -3.131419, 1, 1, 1, 1, 1,
-1.42297, -1.829427, -3.77406, 1, 1, 1, 1, 1,
-1.415976, -1.700312, -0.4682398, 0, 0, 1, 1, 1,
-1.407553, 0.7889149, -1.649092, 1, 0, 0, 1, 1,
-1.406606, 0.3515539, -0.9902535, 1, 0, 0, 1, 1,
-1.406321, -1.289698, -2.857253, 1, 0, 0, 1, 1,
-1.400175, 1.055837, -2.129087, 1, 0, 0, 1, 1,
-1.393428, 0.6646575, -1.417079, 1, 0, 0, 1, 1,
-1.365723, 0.7963831, -0.1087248, 0, 0, 0, 1, 1,
-1.359853, 0.07210677, -0.9116303, 0, 0, 0, 1, 1,
-1.351262, -1.04699, -3.615674, 0, 0, 0, 1, 1,
-1.346063, 0.2054101, -2.33481, 0, 0, 0, 1, 1,
-1.337915, 0.2996565, -1.247156, 0, 0, 0, 1, 1,
-1.332832, -0.2509617, -3.086791, 0, 0, 0, 1, 1,
-1.331621, -0.5532917, -3.509955, 0, 0, 0, 1, 1,
-1.321195, -0.5413995, -1.586404, 1, 1, 1, 1, 1,
-1.311605, -0.1308792, -2.908783, 1, 1, 1, 1, 1,
-1.308872, -1.197952, -2.48389, 1, 1, 1, 1, 1,
-1.306269, -1.444754, -2.473193, 1, 1, 1, 1, 1,
-1.306202, -0.460698, 1.326356, 1, 1, 1, 1, 1,
-1.302012, 0.4832449, -1.680099, 1, 1, 1, 1, 1,
-1.299536, -0.2224576, -0.6756529, 1, 1, 1, 1, 1,
-1.284468, -1.111636, -3.357837, 1, 1, 1, 1, 1,
-1.283704, -0.1216376, -2.08386, 1, 1, 1, 1, 1,
-1.282113, 2.043753, 0.01865293, 1, 1, 1, 1, 1,
-1.265563, -1.070482, -3.150793, 1, 1, 1, 1, 1,
-1.259733, 0.5734798, -1.556022, 1, 1, 1, 1, 1,
-1.257575, 0.5221705, -1.97564, 1, 1, 1, 1, 1,
-1.24524, -0.2404139, -2.749177, 1, 1, 1, 1, 1,
-1.241295, -0.5240425, -3.313808, 1, 1, 1, 1, 1,
-1.240909, 0.5434636, -0.8834018, 0, 0, 1, 1, 1,
-1.240437, 0.4408452, -2.33936, 1, 0, 0, 1, 1,
-1.236861, -1.073525, -3.148703, 1, 0, 0, 1, 1,
-1.235267, 1.052885, -0.340652, 1, 0, 0, 1, 1,
-1.229666, 1.350532, -0.2262444, 1, 0, 0, 1, 1,
-1.219825, -1.282221, -0.4190961, 1, 0, 0, 1, 1,
-1.216547, 0.895902, -3.59618, 0, 0, 0, 1, 1,
-1.215957, 0.1410391, -0.09484696, 0, 0, 0, 1, 1,
-1.210183, 0.1987423, -1.26711, 0, 0, 0, 1, 1,
-1.20818, 0.5646559, 0.04165419, 0, 0, 0, 1, 1,
-1.203923, 0.2432277, 0.02608839, 0, 0, 0, 1, 1,
-1.201952, -1.802024, -2.622552, 0, 0, 0, 1, 1,
-1.201792, 0.7860792, -2.025858, 0, 0, 0, 1, 1,
-1.197276, -1.06033, -1.741297, 1, 1, 1, 1, 1,
-1.187372, 0.5145531, 0.09199478, 1, 1, 1, 1, 1,
-1.179514, -0.2892969, -2.934777, 1, 1, 1, 1, 1,
-1.179473, 0.9110746, -1.910356, 1, 1, 1, 1, 1,
-1.168197, 1.241201, -1.283828, 1, 1, 1, 1, 1,
-1.164493, 1.10122, -0.8377422, 1, 1, 1, 1, 1,
-1.159366, -1.772161, -4.417543, 1, 1, 1, 1, 1,
-1.157437, 0.38319, -1.07343, 1, 1, 1, 1, 1,
-1.155643, -0.4106719, -1.57324, 1, 1, 1, 1, 1,
-1.151651, 1.409435, -0.6115364, 1, 1, 1, 1, 1,
-1.150763, -0.1531453, -1.479169, 1, 1, 1, 1, 1,
-1.132431, -0.4683209, -4.568752, 1, 1, 1, 1, 1,
-1.126909, -1.210566, -1.564466, 1, 1, 1, 1, 1,
-1.124163, 0.2561258, -2.192179, 1, 1, 1, 1, 1,
-1.122908, -1.388162, -2.792279, 1, 1, 1, 1, 1,
-1.11948, 0.6194744, 0.3174409, 0, 0, 1, 1, 1,
-1.112295, 0.6703581, -1.413276, 1, 0, 0, 1, 1,
-1.11123, -0.4584036, -1.393012, 1, 0, 0, 1, 1,
-1.108564, -0.5634922, -1.692713, 1, 0, 0, 1, 1,
-1.096728, -0.02873863, -3.755768, 1, 0, 0, 1, 1,
-1.092738, 1.161668, -0.1463392, 1, 0, 0, 1, 1,
-1.084805, -1.08248, -2.838914, 0, 0, 0, 1, 1,
-1.081544, 1.284314, -0.1787633, 0, 0, 0, 1, 1,
-1.079596, 0.3975768, -0.2450612, 0, 0, 0, 1, 1,
-1.078338, -0.8720656, -1.531085, 0, 0, 0, 1, 1,
-1.074406, 0.8377116, -0.4386378, 0, 0, 0, 1, 1,
-1.074172, 1.754442, 0.2251142, 0, 0, 0, 1, 1,
-1.052903, 0.5448723, -1.527713, 0, 0, 0, 1, 1,
-1.051898, 0.2956839, -2.626579, 1, 1, 1, 1, 1,
-1.050225, 1.151462, -0.2134377, 1, 1, 1, 1, 1,
-1.04679, 0.9279962, -1.323257, 1, 1, 1, 1, 1,
-1.046304, 0.582058, -0.7304899, 1, 1, 1, 1, 1,
-1.046184, -1.039625, -3.301904, 1, 1, 1, 1, 1,
-1.045241, -1.677152, -1.359698, 1, 1, 1, 1, 1,
-1.043957, 1.31007, 0.08912523, 1, 1, 1, 1, 1,
-1.041961, -1.157328, -2.331715, 1, 1, 1, 1, 1,
-1.03949, -0.608271, -0.5753127, 1, 1, 1, 1, 1,
-1.035658, 1.142277, -0.6135881, 1, 1, 1, 1, 1,
-1.035593, -0.5733197, -2.496982, 1, 1, 1, 1, 1,
-1.035191, 0.6765312, -0.9741782, 1, 1, 1, 1, 1,
-1.032094, -0.713748, -1.065201, 1, 1, 1, 1, 1,
-1.031787, 1.362431, -0.07728167, 1, 1, 1, 1, 1,
-1.027588, 0.2478177, -0.880446, 1, 1, 1, 1, 1,
-1.010106, -0.1704133, -1.208814, 0, 0, 1, 1, 1,
-1.006567, -0.8322429, -1.364256, 1, 0, 0, 1, 1,
-1.002239, -1.647419, -1.829852, 1, 0, 0, 1, 1,
-0.99764, 0.6564484, -1.334633, 1, 0, 0, 1, 1,
-0.9877189, -0.4623298, -0.8090935, 1, 0, 0, 1, 1,
-0.9855414, -1.135623, -4.249083, 1, 0, 0, 1, 1,
-0.9848791, -0.03004934, -1.827412, 0, 0, 0, 1, 1,
-0.9789547, 0.374599, -0.621348, 0, 0, 0, 1, 1,
-0.9788017, -1.178819, -1.514624, 0, 0, 0, 1, 1,
-0.9642084, 1.873362, -0.7456468, 0, 0, 0, 1, 1,
-0.9600819, 0.06755613, -0.8925899, 0, 0, 0, 1, 1,
-0.9557945, -0.028993, -2.225657, 0, 0, 0, 1, 1,
-0.9541456, 0.7083898, -0.1766217, 0, 0, 0, 1, 1,
-0.9504939, -1.9528, -4.641666, 1, 1, 1, 1, 1,
-0.9498984, -0.1086421, -1.688578, 1, 1, 1, 1, 1,
-0.9481609, -0.9424474, -2.696023, 1, 1, 1, 1, 1,
-0.9465868, 1.806205, -1.158188, 1, 1, 1, 1, 1,
-0.9419031, 1.137677, 0.5355859, 1, 1, 1, 1, 1,
-0.9379233, -0.8545077, -1.461785, 1, 1, 1, 1, 1,
-0.9355911, 2.047443, 0.3424401, 1, 1, 1, 1, 1,
-0.9351459, 1.555503, 0.0212762, 1, 1, 1, 1, 1,
-0.9325382, -0.962715, -2.445889, 1, 1, 1, 1, 1,
-0.9295359, 2.43811, 0.8201344, 1, 1, 1, 1, 1,
-0.9237134, 0.536705, -1.880485, 1, 1, 1, 1, 1,
-0.9125398, 0.2827761, -2.836352, 1, 1, 1, 1, 1,
-0.9058644, 0.2804038, -0.377027, 1, 1, 1, 1, 1,
-0.8933257, -0.5571331, -1.600426, 1, 1, 1, 1, 1,
-0.887706, -0.4265369, -3.180126, 1, 1, 1, 1, 1,
-0.8810744, 1.216552, 0.6851304, 0, 0, 1, 1, 1,
-0.8793709, 0.6247118, -1.903688, 1, 0, 0, 1, 1,
-0.8778527, 0.4331455, -0.2974972, 1, 0, 0, 1, 1,
-0.8697474, 0.6473004, -3.089057, 1, 0, 0, 1, 1,
-0.8625439, -1.073496, -4.012421, 1, 0, 0, 1, 1,
-0.8596947, -0.3761563, -2.836083, 1, 0, 0, 1, 1,
-0.8580464, -0.8047451, -2.48268, 0, 0, 0, 1, 1,
-0.8566979, -0.2850891, -1.786959, 0, 0, 0, 1, 1,
-0.8544874, 0.09894887, -1.588499, 0, 0, 0, 1, 1,
-0.8487078, -0.7076146, -4.041382, 0, 0, 0, 1, 1,
-0.8444911, 0.8846276, -1.72523, 0, 0, 0, 1, 1,
-0.8441588, 0.8418862, -1.320605, 0, 0, 0, 1, 1,
-0.8323137, -0.3517869, -0.9847159, 0, 0, 0, 1, 1,
-0.8316169, -0.4374338, -1.180004, 1, 1, 1, 1, 1,
-0.8251462, -1.058067, -1.951644, 1, 1, 1, 1, 1,
-0.8238988, -0.4494885, -1.166562, 1, 1, 1, 1, 1,
-0.813635, 0.5417142, -1.255406, 1, 1, 1, 1, 1,
-0.8073342, 0.6705189, 0.2176576, 1, 1, 1, 1, 1,
-0.8069856, 0.5320713, 0.2803546, 1, 1, 1, 1, 1,
-0.8036763, 0.4325967, -1.222032, 1, 1, 1, 1, 1,
-0.8025923, -0.01004902, 2.208274, 1, 1, 1, 1, 1,
-0.7994754, -0.2597525, -1.787314, 1, 1, 1, 1, 1,
-0.7971895, 1.158662, -0.6201721, 1, 1, 1, 1, 1,
-0.7867844, -0.6831187, -2.176869, 1, 1, 1, 1, 1,
-0.7754803, -1.272767, -2.582597, 1, 1, 1, 1, 1,
-0.7743741, 0.2347313, -1.264175, 1, 1, 1, 1, 1,
-0.7735459, 0.7312679, 0.2675928, 1, 1, 1, 1, 1,
-0.7679355, 0.01955231, -1.489589, 1, 1, 1, 1, 1,
-0.7665957, 0.7756724, 0.2019867, 0, 0, 1, 1, 1,
-0.764012, -0.4698607, 0.02987225, 1, 0, 0, 1, 1,
-0.7600319, 0.5681994, -0.8369587, 1, 0, 0, 1, 1,
-0.7590916, 0.1751091, -0.3965788, 1, 0, 0, 1, 1,
-0.7537976, 2.163736, -1.013904, 1, 0, 0, 1, 1,
-0.7518108, -0.8604094, -2.23454, 1, 0, 0, 1, 1,
-0.7516001, -0.9378498, -2.538687, 0, 0, 0, 1, 1,
-0.7451923, 0.9599004, 0.3735459, 0, 0, 0, 1, 1,
-0.7403929, -0.7165843, -2.524987, 0, 0, 0, 1, 1,
-0.7298492, -0.3198856, -2.510375, 0, 0, 0, 1, 1,
-0.7262238, -0.4123663, -2.729121, 0, 0, 0, 1, 1,
-0.7142089, -0.4479041, -3.003325, 0, 0, 0, 1, 1,
-0.7133467, -1.079049, -4.785296, 0, 0, 0, 1, 1,
-0.7116461, -1.152686, -2.500347, 1, 1, 1, 1, 1,
-0.7095688, 1.002768, 0.008083851, 1, 1, 1, 1, 1,
-0.7088561, -1.174583, -1.968459, 1, 1, 1, 1, 1,
-0.7084788, -1.391434, -2.239464, 1, 1, 1, 1, 1,
-0.69726, -0.2869111, -1.163751, 1, 1, 1, 1, 1,
-0.6958932, -0.09079048, -2.447009, 1, 1, 1, 1, 1,
-0.6950072, 0.9133893, 0.068759, 1, 1, 1, 1, 1,
-0.6936579, 1.421676, -2.741842, 1, 1, 1, 1, 1,
-0.6907473, -1.011657, -2.722021, 1, 1, 1, 1, 1,
-0.6888467, 0.3057826, -0.6125024, 1, 1, 1, 1, 1,
-0.6876381, -0.9915724, -2.603549, 1, 1, 1, 1, 1,
-0.6816644, -0.1422902, -1.171204, 1, 1, 1, 1, 1,
-0.6794561, -0.3759685, -2.368422, 1, 1, 1, 1, 1,
-0.6730412, 1.438358, -0.4803907, 1, 1, 1, 1, 1,
-0.6667215, -1.094309, -1.836416, 1, 1, 1, 1, 1,
-0.6620525, 1.512007, 0.6211357, 0, 0, 1, 1, 1,
-0.6566668, -1.720392, -1.917789, 1, 0, 0, 1, 1,
-0.6552327, 0.6101559, -0.9690779, 1, 0, 0, 1, 1,
-0.6509814, -0.003222442, 0.1418484, 1, 0, 0, 1, 1,
-0.6507356, 0.3207136, -0.644158, 1, 0, 0, 1, 1,
-0.641242, -1.090531, -3.591014, 1, 0, 0, 1, 1,
-0.6385062, -2.022965, -1.752763, 0, 0, 0, 1, 1,
-0.6382162, 1.073683, 0.1683565, 0, 0, 0, 1, 1,
-0.6378543, -0.05795756, -2.061102, 0, 0, 0, 1, 1,
-0.6372185, -0.8084807, -1.993886, 0, 0, 0, 1, 1,
-0.6327275, -0.3632849, -2.330326, 0, 0, 0, 1, 1,
-0.6287085, -0.7054704, -3.587303, 0, 0, 0, 1, 1,
-0.6284493, 1.113609, -0.6827793, 0, 0, 0, 1, 1,
-0.6261218, -0.08345929, -1.430949, 1, 1, 1, 1, 1,
-0.6258547, 0.4338132, -0.2413482, 1, 1, 1, 1, 1,
-0.6231338, 1.120318, 0.009121986, 1, 1, 1, 1, 1,
-0.6224402, -1.340369, -2.575106, 1, 1, 1, 1, 1,
-0.6170537, -0.7068477, -2.595775, 1, 1, 1, 1, 1,
-0.6150262, -1.100762, -2.133319, 1, 1, 1, 1, 1,
-0.6120431, 0.6071804, -1.05496, 1, 1, 1, 1, 1,
-0.6110685, 0.5154252, -0.00766387, 1, 1, 1, 1, 1,
-0.606199, -0.8664219, -1.967227, 1, 1, 1, 1, 1,
-0.605791, 0.2450572, -1.843594, 1, 1, 1, 1, 1,
-0.6015286, -0.378743, -3.956825, 1, 1, 1, 1, 1,
-0.5880827, -0.2010576, -3.302418, 1, 1, 1, 1, 1,
-0.5819784, 0.8123847, -1.698823, 1, 1, 1, 1, 1,
-0.5810366, -0.4489432, -3.269691, 1, 1, 1, 1, 1,
-0.5803031, -0.0327646, -1.518272, 1, 1, 1, 1, 1,
-0.5793734, -1.47673, -3.202954, 0, 0, 1, 1, 1,
-0.5736102, -0.2802701, -1.808661, 1, 0, 0, 1, 1,
-0.5723975, 1.157392, -1.542968, 1, 0, 0, 1, 1,
-0.568956, -0.2022772, -2.619369, 1, 0, 0, 1, 1,
-0.5631916, -0.1230564, -2.059085, 1, 0, 0, 1, 1,
-0.5580654, -0.5413482, -4.783009, 1, 0, 0, 1, 1,
-0.5528526, 0.8595625, -0.6161687, 0, 0, 0, 1, 1,
-0.5446866, 0.7601166, -2.991246, 0, 0, 0, 1, 1,
-0.5441775, 1.141574, -0.6855225, 0, 0, 0, 1, 1,
-0.5427181, 0.5768216, 0.6713217, 0, 0, 0, 1, 1,
-0.5370957, -1.575188, -4.260526, 0, 0, 0, 1, 1,
-0.5345458, 1.798326, -0.204604, 0, 0, 0, 1, 1,
-0.5323759, 1.438542, -0.8127576, 0, 0, 0, 1, 1,
-0.5311015, -0.1697295, -3.162989, 1, 1, 1, 1, 1,
-0.5297285, -0.2954914, -0.9382309, 1, 1, 1, 1, 1,
-0.5264596, 1.105313, -0.007676523, 1, 1, 1, 1, 1,
-0.5260257, -1.295612, -4.110295, 1, 1, 1, 1, 1,
-0.5228138, -1.169194, -1.804601, 1, 1, 1, 1, 1,
-0.5219536, 0.7298318, -0.8313231, 1, 1, 1, 1, 1,
-0.5209392, 0.2102088, -1.339442, 1, 1, 1, 1, 1,
-0.5187947, 0.9589568, -2.06771, 1, 1, 1, 1, 1,
-0.5171068, 0.9490464, -1.396379, 1, 1, 1, 1, 1,
-0.5161, 1.202504, -0.3312325, 1, 1, 1, 1, 1,
-0.5151175, 0.5983294, 0.3051177, 1, 1, 1, 1, 1,
-0.5130786, -1.62409, -3.409883, 1, 1, 1, 1, 1,
-0.5045812, 0.3640343, -0.627482, 1, 1, 1, 1, 1,
-0.4996023, 1.287759, -2.798512, 1, 1, 1, 1, 1,
-0.4991308, 0.1423238, -1.13724, 1, 1, 1, 1, 1,
-0.4968198, -0.4380822, -2.83018, 0, 0, 1, 1, 1,
-0.4967436, -0.3839493, -1.414659, 1, 0, 0, 1, 1,
-0.4948826, -1.255643, -3.105386, 1, 0, 0, 1, 1,
-0.4937522, 0.7378531, -0.9457392, 1, 0, 0, 1, 1,
-0.4921359, -1.129398, -3.571078, 1, 0, 0, 1, 1,
-0.4882905, -1.16289, -0.3581337, 1, 0, 0, 1, 1,
-0.4880641, 0.4994934, -1.599599, 0, 0, 0, 1, 1,
-0.4867757, -0.04866552, -1.527206, 0, 0, 0, 1, 1,
-0.4847497, 0.746673, -0.09571634, 0, 0, 0, 1, 1,
-0.4844346, 0.8428882, -2.002547, 0, 0, 0, 1, 1,
-0.4811324, -1.632745, -1.545227, 0, 0, 0, 1, 1,
-0.4789799, -0.136178, -2.943554, 0, 0, 0, 1, 1,
-0.4787235, 0.8969988, -1.445634, 0, 0, 0, 1, 1,
-0.4774667, 0.5229278, -2.599414, 1, 1, 1, 1, 1,
-0.4766372, -0.1708185, -2.802135, 1, 1, 1, 1, 1,
-0.476294, 0.7754703, 0.01533544, 1, 1, 1, 1, 1,
-0.4755251, -0.5935719, -3.30538, 1, 1, 1, 1, 1,
-0.4732332, -0.4622161, -2.609234, 1, 1, 1, 1, 1,
-0.4732179, -0.8291318, -1.461586, 1, 1, 1, 1, 1,
-0.4727509, 0.2280829, -2.935103, 1, 1, 1, 1, 1,
-0.4706756, 0.710948, -0.5386738, 1, 1, 1, 1, 1,
-0.4642316, 0.4041666, -1.95953, 1, 1, 1, 1, 1,
-0.4584075, -0.05476342, -2.40132, 1, 1, 1, 1, 1,
-0.4486718, -1.051256, -4.267931, 1, 1, 1, 1, 1,
-0.447336, -0.04469458, -0.7804028, 1, 1, 1, 1, 1,
-0.4438663, 0.5766702, -1.381304, 1, 1, 1, 1, 1,
-0.4433455, -0.4981321, -1.859794, 1, 1, 1, 1, 1,
-0.4431111, -0.9691572, -1.051874, 1, 1, 1, 1, 1,
-0.4377495, 0.8490452, -2.174759, 0, 0, 1, 1, 1,
-0.4358428, -1.477347, -3.932741, 1, 0, 0, 1, 1,
-0.434516, -0.1469695, -3.152374, 1, 0, 0, 1, 1,
-0.4306365, -0.0185134, -2.14547, 1, 0, 0, 1, 1,
-0.4304106, -0.4601762, -2.517958, 1, 0, 0, 1, 1,
-0.4160621, 0.4421586, -1.681747, 1, 0, 0, 1, 1,
-0.4149561, -0.362569, -1.970422, 0, 0, 0, 1, 1,
-0.4141361, -0.5077079, -2.726515, 0, 0, 0, 1, 1,
-0.4124586, -0.3528392, -3.845135, 0, 0, 0, 1, 1,
-0.4115221, -0.4131488, -1.128228, 0, 0, 0, 1, 1,
-0.4113913, 0.07862756, -1.273866, 0, 0, 0, 1, 1,
-0.40809, 0.9442829, 0.3807254, 0, 0, 0, 1, 1,
-0.4079024, -0.2221914, -1.304588, 0, 0, 0, 1, 1,
-0.4075784, 1.241138, -0.5765019, 1, 1, 1, 1, 1,
-0.4066904, -1.747379, -3.753897, 1, 1, 1, 1, 1,
-0.404018, 9.078276e-05, -2.540301, 1, 1, 1, 1, 1,
-0.4020359, -0.9031096, -3.213813, 1, 1, 1, 1, 1,
-0.4004716, 0.6299749, -0.7068153, 1, 1, 1, 1, 1,
-0.398527, -0.1717527, -3.063043, 1, 1, 1, 1, 1,
-0.3972448, -0.2808738, -2.992052, 1, 1, 1, 1, 1,
-0.3952531, -0.2406065, -2.70925, 1, 1, 1, 1, 1,
-0.3940839, -1.704459, -3.182099, 1, 1, 1, 1, 1,
-0.3920585, 0.5866376, 0.5926771, 1, 1, 1, 1, 1,
-0.3913881, -0.5982549, -1.550157, 1, 1, 1, 1, 1,
-0.3875003, 2.012484, 1.368453, 1, 1, 1, 1, 1,
-0.3869738, -0.6954342, -2.480252, 1, 1, 1, 1, 1,
-0.3864059, 0.6637269, -0.1542081, 1, 1, 1, 1, 1,
-0.3846474, -0.1952221, -2.413465, 1, 1, 1, 1, 1,
-0.3779362, 1.413593, 1.149006, 0, 0, 1, 1, 1,
-0.3770873, 0.5315976, -0.5262266, 1, 0, 0, 1, 1,
-0.3755288, 0.4387291, -0.309231, 1, 0, 0, 1, 1,
-0.3633355, 0.8143106, -0.4931943, 1, 0, 0, 1, 1,
-0.3579823, 0.8134692, 1.922367, 1, 0, 0, 1, 1,
-0.3539008, -1.147906, -2.692729, 1, 0, 0, 1, 1,
-0.3534582, -0.6373412, -2.878393, 0, 0, 0, 1, 1,
-0.3497638, 1.579585, 0.1033957, 0, 0, 0, 1, 1,
-0.3481801, 1.485728, 1.073782, 0, 0, 0, 1, 1,
-0.3476893, -1.018977, -5.229814, 0, 0, 0, 1, 1,
-0.3461655, 1.801376, -1.828265, 0, 0, 0, 1, 1,
-0.3456759, -2.546824, -3.672894, 0, 0, 0, 1, 1,
-0.3455497, -0.5800858, -3.367347, 0, 0, 0, 1, 1,
-0.3440234, 0.6420577, -1.606322, 1, 1, 1, 1, 1,
-0.3417985, -0.07099618, -1.640295, 1, 1, 1, 1, 1,
-0.3390556, 1.193188, -0.1009033, 1, 1, 1, 1, 1,
-0.3362503, -2.068149, -4.18318, 1, 1, 1, 1, 1,
-0.3313844, -1.710035, -2.860374, 1, 1, 1, 1, 1,
-0.3288598, -0.7753023, -2.746487, 1, 1, 1, 1, 1,
-0.3234469, 1.327853, -2.144305, 1, 1, 1, 1, 1,
-0.3211729, 0.2235076, -2.187568, 1, 1, 1, 1, 1,
-0.3187827, 1.335661, 0.445135, 1, 1, 1, 1, 1,
-0.3180672, 1.033001, -0.510111, 1, 1, 1, 1, 1,
-0.3175703, 0.5693643, 0.2306389, 1, 1, 1, 1, 1,
-0.3106097, 0.912799, 0.428885, 1, 1, 1, 1, 1,
-0.3085586, 0.1094053, -2.313955, 1, 1, 1, 1, 1,
-0.3025521, -1.188275, -2.65765, 1, 1, 1, 1, 1,
-0.3021613, -2.104129, -4.661723, 1, 1, 1, 1, 1,
-0.3009196, -0.1204895, -0.8069036, 0, 0, 1, 1, 1,
-0.2992852, 0.7543148, -0.09513128, 1, 0, 0, 1, 1,
-0.2987759, -0.5828612, -2.899605, 1, 0, 0, 1, 1,
-0.296009, -1.00569, -4.969835, 1, 0, 0, 1, 1,
-0.2950664, 1.080339, 0.8598501, 1, 0, 0, 1, 1,
-0.2925619, 0.7333145, -2.27547, 1, 0, 0, 1, 1,
-0.2869343, 1.035745, 1.065199, 0, 0, 0, 1, 1,
-0.2779849, -0.9184576, -3.301553, 0, 0, 0, 1, 1,
-0.2773108, -1.399978, -2.714449, 0, 0, 0, 1, 1,
-0.2719462, -1.189837, -2.37737, 0, 0, 0, 1, 1,
-0.2687988, 1.524062, 0.7121296, 0, 0, 0, 1, 1,
-0.2685218, 1.367522, -0.9428316, 0, 0, 0, 1, 1,
-0.2648844, -0.1091978, -1.971998, 0, 0, 0, 1, 1,
-0.2640283, -0.1614268, -2.4447, 1, 1, 1, 1, 1,
-0.2640051, -0.5969535, -3.6501, 1, 1, 1, 1, 1,
-0.2554141, 0.9676896, -0.2767034, 1, 1, 1, 1, 1,
-0.2531097, 1.194268, 1.360647, 1, 1, 1, 1, 1,
-0.2530101, 0.08099082, -1.823301, 1, 1, 1, 1, 1,
-0.2528782, 1.040649, 0.6231372, 1, 1, 1, 1, 1,
-0.2500071, 1.197281, -2.553827, 1, 1, 1, 1, 1,
-0.2476604, -0.1653669, -1.614457, 1, 1, 1, 1, 1,
-0.2452238, -0.3554085, -2.560314, 1, 1, 1, 1, 1,
-0.2441103, -0.9215915, -2.887296, 1, 1, 1, 1, 1,
-0.2412249, 1.313529, 1.401722, 1, 1, 1, 1, 1,
-0.2410759, 1.347303, -0.5668698, 1, 1, 1, 1, 1,
-0.2361177, -0.2413803, -1.837779, 1, 1, 1, 1, 1,
-0.2307413, 0.9461193, 0.3145309, 1, 1, 1, 1, 1,
-0.2297238, 0.9341486, -0.9169979, 1, 1, 1, 1, 1,
-0.2274806, -0.5541819, -3.140452, 0, 0, 1, 1, 1,
-0.2269824, -0.8477814, -2.247007, 1, 0, 0, 1, 1,
-0.224387, 1.36569, -1.551992, 1, 0, 0, 1, 1,
-0.2184924, -0.8715398, -0.830716, 1, 0, 0, 1, 1,
-0.2141828, -0.3644577, -1.127417, 1, 0, 0, 1, 1,
-0.212195, -1.185213, -3.069131, 1, 0, 0, 1, 1,
-0.2115592, -0.7474282, -3.105737, 0, 0, 0, 1, 1,
-0.2103358, 0.7797676, -0.5006981, 0, 0, 0, 1, 1,
-0.2083922, 0.4554405, -0.3288876, 0, 0, 0, 1, 1,
-0.2071981, -0.2007661, -0.8337477, 0, 0, 0, 1, 1,
-0.2035612, 0.8032884, -0.1563522, 0, 0, 0, 1, 1,
-0.2017372, 0.8649573, 0.0188654, 0, 0, 0, 1, 1,
-0.2013389, 0.7419395, 0.3829194, 0, 0, 0, 1, 1,
-0.2010999, 0.6116422, 0.1762493, 1, 1, 1, 1, 1,
-0.2006806, 0.03383503, -1.690436, 1, 1, 1, 1, 1,
-0.1994036, -1.16798, -3.507202, 1, 1, 1, 1, 1,
-0.1892006, -0.6601052, -2.292072, 1, 1, 1, 1, 1,
-0.1867463, 1.431441, 0.7894249, 1, 1, 1, 1, 1,
-0.1836499, 0.07075207, 0.037498, 1, 1, 1, 1, 1,
-0.1808963, 0.6387758, 1.380923, 1, 1, 1, 1, 1,
-0.1735091, -1.151623, -2.57599, 1, 1, 1, 1, 1,
-0.1727619, 1.247176, -0.08674622, 1, 1, 1, 1, 1,
-0.1717622, -1.185427, -3.669378, 1, 1, 1, 1, 1,
-0.1648801, -0.9593244, -3.192445, 1, 1, 1, 1, 1,
-0.1631416, 0.4788973, -1.727158, 1, 1, 1, 1, 1,
-0.1582924, -0.08463523, -2.379654, 1, 1, 1, 1, 1,
-0.1571298, 0.6998625, 0.9445292, 1, 1, 1, 1, 1,
-0.1566069, -0.5509513, -3.338557, 1, 1, 1, 1, 1,
-0.1564198, -0.1716494, -1.704548, 0, 0, 1, 1, 1,
-0.1554711, 0.2524441, 0.4789538, 1, 0, 0, 1, 1,
-0.1515505, 1.009658, -1.056247, 1, 0, 0, 1, 1,
-0.1511688, -0.6964973, -2.037145, 1, 0, 0, 1, 1,
-0.1500014, 0.7081857, 0.2878437, 1, 0, 0, 1, 1,
-0.148292, -1.174199, -4.211557, 1, 0, 0, 1, 1,
-0.1466204, 2.058169, 2.082514, 0, 0, 0, 1, 1,
-0.1464632, -0.3409013, -3.437353, 0, 0, 0, 1, 1,
-0.1433214, -0.9745021, -1.015446, 0, 0, 0, 1, 1,
-0.1410779, -1.009751, -3.148855, 0, 0, 0, 1, 1,
-0.1401995, 0.4520193, 1.675789, 0, 0, 0, 1, 1,
-0.1400966, 0.4000026, 0.2345307, 0, 0, 0, 1, 1,
-0.1374086, -0.9423516, -3.784668, 0, 0, 0, 1, 1,
-0.1374077, 0.2310732, 0.7896868, 1, 1, 1, 1, 1,
-0.136368, 0.1062784, -0.8189451, 1, 1, 1, 1, 1,
-0.1360779, -0.3538014, -2.564272, 1, 1, 1, 1, 1,
-0.1342867, -1.440637, -2.924848, 1, 1, 1, 1, 1,
-0.1328287, -1.578987, -1.821284, 1, 1, 1, 1, 1,
-0.1315633, -0.09827851, -3.335591, 1, 1, 1, 1, 1,
-0.1309246, -0.8644609, -2.789418, 1, 1, 1, 1, 1,
-0.1304117, 0.3833955, 2.079381, 1, 1, 1, 1, 1,
-0.1296842, -2.70117, -2.483864, 1, 1, 1, 1, 1,
-0.1272221, -0.4941379, -3.52674, 1, 1, 1, 1, 1,
-0.1264756, 0.7880832, -1.214265, 1, 1, 1, 1, 1,
-0.1228523, -0.8136271, -1.417821, 1, 1, 1, 1, 1,
-0.1183006, -2.058907, -2.647924, 1, 1, 1, 1, 1,
-0.1131975, -0.8599975, -1.783313, 1, 1, 1, 1, 1,
-0.1121766, 0.9803222, 1.813532, 1, 1, 1, 1, 1,
-0.1118381, -0.8711791, -2.501114, 0, 0, 1, 1, 1,
-0.1101676, -2.310919, -2.46612, 1, 0, 0, 1, 1,
-0.1042379, 1.481398, -0.9404472, 1, 0, 0, 1, 1,
-0.1040792, -0.4023149, -3.424026, 1, 0, 0, 1, 1,
-0.1035421, -1.772631, -3.044716, 1, 0, 0, 1, 1,
-0.1011332, -0.8327235, -2.762094, 1, 0, 0, 1, 1,
-0.09783883, -0.2235048, -2.535074, 0, 0, 0, 1, 1,
-0.09720785, -0.0867836, -2.219105, 0, 0, 0, 1, 1,
-0.09473071, -0.3587777, -2.357391, 0, 0, 0, 1, 1,
-0.08990522, 0.2119592, 1.254392, 0, 0, 0, 1, 1,
-0.08794876, -0.01607457, -2.750624, 0, 0, 0, 1, 1,
-0.08176178, -0.3805971, -3.474044, 0, 0, 0, 1, 1,
-0.07572049, 0.5850347, -0.1611537, 0, 0, 0, 1, 1,
-0.07322115, -0.3598146, -3.99813, 1, 1, 1, 1, 1,
-0.06514728, 0.1508095, 0.3654189, 1, 1, 1, 1, 1,
-0.06338491, -0.3626072, -3.246128, 1, 1, 1, 1, 1,
-0.06335515, 1.03227, -0.2024982, 1, 1, 1, 1, 1,
-0.06304327, -1.016592, -1.20233, 1, 1, 1, 1, 1,
-0.06270761, 1.606867, 1.427479, 1, 1, 1, 1, 1,
-0.05914826, -0.542095, -2.51801, 1, 1, 1, 1, 1,
-0.05388195, -0.008160139, 0.5508975, 1, 1, 1, 1, 1,
-0.05073308, 0.03547242, -0.7067856, 1, 1, 1, 1, 1,
-0.04816437, 0.4851206, -0.8021721, 1, 1, 1, 1, 1,
-0.0468721, -0.03546025, -3.053285, 1, 1, 1, 1, 1,
-0.04685239, 0.7112322, 0.4955944, 1, 1, 1, 1, 1,
-0.04535163, -0.9806648, -2.960765, 1, 1, 1, 1, 1,
-0.04328102, -0.271496, -2.603152, 1, 1, 1, 1, 1,
-0.04235306, 1.368024, 0.1532363, 1, 1, 1, 1, 1,
-0.0371364, 0.2552356, -1.572611, 0, 0, 1, 1, 1,
-0.03376497, 1.769765, -0.2482993, 1, 0, 0, 1, 1,
-0.03278038, 1.05068, -2.226994, 1, 0, 0, 1, 1,
-0.0317414, -0.3470111, -3.456396, 1, 0, 0, 1, 1,
-0.03065761, 0.7320034, -1.094611, 1, 0, 0, 1, 1,
-0.0272614, -2.40094, -1.807162, 1, 0, 0, 1, 1,
-0.02669204, 0.5542745, 0.05754398, 0, 0, 0, 1, 1,
-0.02486257, 1.450769, -1.797137, 0, 0, 0, 1, 1,
-0.01793719, -0.01988688, -4.422112, 0, 0, 0, 1, 1,
-0.01127309, -1.277668, -2.873443, 0, 0, 0, 1, 1,
-0.01101447, 1.393864, -0.572827, 0, 0, 0, 1, 1,
-0.005821744, -0.5548437, -3.053506, 0, 0, 0, 1, 1,
-0.003621232, -0.8991581, -2.859447, 0, 0, 0, 1, 1,
-0.002791442, 1.039685, -1.626838, 1, 1, 1, 1, 1,
0.001308723, 0.6934084, -0.5778994, 1, 1, 1, 1, 1,
0.001590696, -0.7625785, 2.971463, 1, 1, 1, 1, 1,
0.006929238, -0.1225429, 3.584599, 1, 1, 1, 1, 1,
0.006978465, -0.3893137, 2.476539, 1, 1, 1, 1, 1,
0.008674531, 0.807319, 0.6254409, 1, 1, 1, 1, 1,
0.01724937, 0.1190103, 0.1582619, 1, 1, 1, 1, 1,
0.02341941, 2.435707, 0.005669598, 1, 1, 1, 1, 1,
0.02616971, 2.7337, 0.6376185, 1, 1, 1, 1, 1,
0.02991962, -1.494131, 3.099558, 1, 1, 1, 1, 1,
0.03027704, 0.6595548, -1.046735, 1, 1, 1, 1, 1,
0.0316924, 1.063586, 0.9706623, 1, 1, 1, 1, 1,
0.03740962, -0.9868472, 4.665671, 1, 1, 1, 1, 1,
0.03810424, 0.2996074, 1.788125, 1, 1, 1, 1, 1,
0.04268109, 0.6446622, -0.5697833, 1, 1, 1, 1, 1,
0.04862866, 0.4060661, -1.528188, 0, 0, 1, 1, 1,
0.05117268, -0.7989076, 3.268125, 1, 0, 0, 1, 1,
0.05154943, 0.6561069, 1.298436, 1, 0, 0, 1, 1,
0.05215199, 2.215532, -1.387652, 1, 0, 0, 1, 1,
0.05497013, -1.152792, 2.706513, 1, 0, 0, 1, 1,
0.05537102, 1.030556, -0.4424151, 1, 0, 0, 1, 1,
0.05922167, -0.1207547, 3.197076, 0, 0, 0, 1, 1,
0.05997682, 0.6643347, 1.968944, 0, 0, 0, 1, 1,
0.06066662, 0.4165737, -0.5969373, 0, 0, 0, 1, 1,
0.06737807, -0.5607182, 3.125157, 0, 0, 0, 1, 1,
0.06901233, -1.865683, 2.993443, 0, 0, 0, 1, 1,
0.07297456, 0.8670782, 1.447837, 0, 0, 0, 1, 1,
0.07649003, -1.076791, 4.591082, 0, 0, 0, 1, 1,
0.07766516, -0.4364533, 4.245021, 1, 1, 1, 1, 1,
0.0799409, 1.022885, -1.043123, 1, 1, 1, 1, 1,
0.0828391, 0.6426957, 0.6300058, 1, 1, 1, 1, 1,
0.08305852, -0.2658985, 2.274387, 1, 1, 1, 1, 1,
0.08559922, -0.3134658, 2.634304, 1, 1, 1, 1, 1,
0.08881602, -0.003845036, 0.8808882, 1, 1, 1, 1, 1,
0.08917841, -1.064482, 0.7236228, 1, 1, 1, 1, 1,
0.09055407, -0.3762512, 1.263441, 1, 1, 1, 1, 1,
0.09106414, -0.9423939, 3.547494, 1, 1, 1, 1, 1,
0.09410404, 0.994932, 1.493404, 1, 1, 1, 1, 1,
0.1011888, 0.3411894, -0.03109223, 1, 1, 1, 1, 1,
0.102551, -0.1138529, 3.147856, 1, 1, 1, 1, 1,
0.1029431, 1.504004, 0.582014, 1, 1, 1, 1, 1,
0.1031003, 0.3267642, -0.4446533, 1, 1, 1, 1, 1,
0.1060958, -2.355906, 3.27453, 1, 1, 1, 1, 1,
0.1105828, 0.7284977, -0.808388, 0, 0, 1, 1, 1,
0.1143373, 0.690661, -0.1138882, 1, 0, 0, 1, 1,
0.116319, -2.06375, 2.839132, 1, 0, 0, 1, 1,
0.1176528, 1.174915, 1.077883, 1, 0, 0, 1, 1,
0.1188158, 0.149745, 0.9688749, 1, 0, 0, 1, 1,
0.1215063, -0.9989066, 3.420337, 1, 0, 0, 1, 1,
0.1220462, 1.902355, 0.7866983, 0, 0, 0, 1, 1,
0.1248954, -0.4471706, 2.370007, 0, 0, 0, 1, 1,
0.1250416, -0.5482668, 3.213321, 0, 0, 0, 1, 1,
0.1331712, 0.3816544, 0.2609673, 0, 0, 0, 1, 1,
0.1358893, 0.8098435, 0.4097463, 0, 0, 0, 1, 1,
0.1414658, 2.148621, 0.4611841, 0, 0, 0, 1, 1,
0.1418279, -0.06064619, 2.672299, 0, 0, 0, 1, 1,
0.1492182, -1.14782, 2.643412, 1, 1, 1, 1, 1,
0.1523955, -1.536718, 2.497299, 1, 1, 1, 1, 1,
0.1524187, 1.779977, -0.2321623, 1, 1, 1, 1, 1,
0.1529865, 0.2800866, 0.01855952, 1, 1, 1, 1, 1,
0.1536413, -1.01061, 2.958716, 1, 1, 1, 1, 1,
0.1541104, 1.043525, 0.5083563, 1, 1, 1, 1, 1,
0.1582818, -0.7870441, 2.285235, 1, 1, 1, 1, 1,
0.162166, -0.3076173, 3.205695, 1, 1, 1, 1, 1,
0.1707345, -0.6356079, 3.035839, 1, 1, 1, 1, 1,
0.1722025, 1.190817, -0.6369724, 1, 1, 1, 1, 1,
0.173485, 0.9907421, 0.9384645, 1, 1, 1, 1, 1,
0.173644, -2.758946, 4.034857, 1, 1, 1, 1, 1,
0.1770208, -0.3958202, 3.052177, 1, 1, 1, 1, 1,
0.1828457, -1.498627, 2.049964, 1, 1, 1, 1, 1,
0.1879093, -0.774793, 3.210385, 1, 1, 1, 1, 1,
0.1879144, -0.02472143, 3.40903, 0, 0, 1, 1, 1,
0.1881936, -0.9593656, 2.848175, 1, 0, 0, 1, 1,
0.1919488, -0.3419882, 1.512946, 1, 0, 0, 1, 1,
0.1957754, 0.05469035, 2.756506, 1, 0, 0, 1, 1,
0.196133, -0.3750119, 3.302405, 1, 0, 0, 1, 1,
0.1961728, 1.239252, 0.6355647, 1, 0, 0, 1, 1,
0.2007422, 1.688028, 1.959017, 0, 0, 0, 1, 1,
0.2071437, -0.2496078, 2.232148, 0, 0, 0, 1, 1,
0.2135819, -2.719803, 2.602684, 0, 0, 0, 1, 1,
0.2183864, -0.4921355, 1.77546, 0, 0, 0, 1, 1,
0.2208285, -1.27317, 3.718627, 0, 0, 0, 1, 1,
0.227233, 0.0722496, 3.007901, 0, 0, 0, 1, 1,
0.2284831, -1.269196, 5.168781, 0, 0, 0, 1, 1,
0.2318762, 0.6432307, 0.4176896, 1, 1, 1, 1, 1,
0.2344506, -0.03546404, 1.589427, 1, 1, 1, 1, 1,
0.2386367, 0.6435604, 1.124488, 1, 1, 1, 1, 1,
0.243993, -3.380615, 4.111719, 1, 1, 1, 1, 1,
0.2441293, -0.6177554, 2.88377, 1, 1, 1, 1, 1,
0.2446996, 0.1663393, -0.2662281, 1, 1, 1, 1, 1,
0.2455357, 0.9752093, -0.7088823, 1, 1, 1, 1, 1,
0.2458706, 0.9886601, 0.9333192, 1, 1, 1, 1, 1,
0.2482366, 1.532292, -0.6198874, 1, 1, 1, 1, 1,
0.2500648, 0.9412519, 0.09532372, 1, 1, 1, 1, 1,
0.2535459, 0.871168, 0.07430907, 1, 1, 1, 1, 1,
0.2590535, -0.3525369, 3.120968, 1, 1, 1, 1, 1,
0.2610787, -0.6007807, 2.266533, 1, 1, 1, 1, 1,
0.2636394, -0.8859981, 2.02572, 1, 1, 1, 1, 1,
0.2645367, 0.641745, -0.06757452, 1, 1, 1, 1, 1,
0.2694494, 0.01263024, -0.02498391, 0, 0, 1, 1, 1,
0.2701602, -1.024335, 2.303332, 1, 0, 0, 1, 1,
0.2754355, -0.6585924, 1.808807, 1, 0, 0, 1, 1,
0.2783071, -0.1225034, 2.877785, 1, 0, 0, 1, 1,
0.2807072, -0.0264187, 1.909292, 1, 0, 0, 1, 1,
0.2811649, 1.320796, 0.1992198, 1, 0, 0, 1, 1,
0.2819706, -0.7470595, 3.502248, 0, 0, 0, 1, 1,
0.2883969, 0.92551, -2.064012, 0, 0, 0, 1, 1,
0.2922709, 2.001256, -0.8752179, 0, 0, 0, 1, 1,
0.2952873, -0.8007792, 2.388747, 0, 0, 0, 1, 1,
0.296842, -1.387638, 2.396871, 0, 0, 0, 1, 1,
0.2989243, 0.7622026, 1.159103, 0, 0, 0, 1, 1,
0.3003307, -0.6733808, 3.856476, 0, 0, 0, 1, 1,
0.3062631, 0.9998177, 1.202785, 1, 1, 1, 1, 1,
0.3098376, -0.1215959, 1.733825, 1, 1, 1, 1, 1,
0.3114554, 0.05162186, 0.4025123, 1, 1, 1, 1, 1,
0.3124065, -0.6148618, 1.929702, 1, 1, 1, 1, 1,
0.3124222, -0.5572765, 1.923193, 1, 1, 1, 1, 1,
0.315385, 0.4959604, 0.8879219, 1, 1, 1, 1, 1,
0.3171758, -0.5231809, 1.542171, 1, 1, 1, 1, 1,
0.3218717, -1.541645, 3.626869, 1, 1, 1, 1, 1,
0.3283939, 0.2598857, 2.803654, 1, 1, 1, 1, 1,
0.3287239, -0.9229467, 1.481521, 1, 1, 1, 1, 1,
0.3322204, -0.384014, 3.068536, 1, 1, 1, 1, 1,
0.3366838, 1.524816, 0.7393299, 1, 1, 1, 1, 1,
0.3375331, -1.351019, 3.151434, 1, 1, 1, 1, 1,
0.3523964, -0.7884859, 2.243022, 1, 1, 1, 1, 1,
0.3529537, 0.8739662, 1.014003, 1, 1, 1, 1, 1,
0.353451, -0.3598264, 2.968457, 0, 0, 1, 1, 1,
0.3545671, -0.6707857, 2.796495, 1, 0, 0, 1, 1,
0.3574877, -0.2741119, 3.317067, 1, 0, 0, 1, 1,
0.3594654, -0.2863399, 2.568416, 1, 0, 0, 1, 1,
0.3598441, 0.1761861, 3.021849, 1, 0, 0, 1, 1,
0.3612098, 1.321127, 0.8006735, 1, 0, 0, 1, 1,
0.3614948, -0.5835468, 3.088942, 0, 0, 0, 1, 1,
0.3619261, -0.6501962, 2.948166, 0, 0, 0, 1, 1,
0.3620013, 1.228653, -0.205305, 0, 0, 0, 1, 1,
0.3625939, -0.1474651, 3.355194, 0, 0, 0, 1, 1,
0.3631546, 0.7537714, 0.5019791, 0, 0, 0, 1, 1,
0.3639266, 0.3435679, 2.142507, 0, 0, 0, 1, 1,
0.3651689, -1.810639, 2.483299, 0, 0, 0, 1, 1,
0.3651891, 0.08209399, 1.435902, 1, 1, 1, 1, 1,
0.3655416, -1.842834, 4.366925, 1, 1, 1, 1, 1,
0.3659221, -1.181005, 1.784435, 1, 1, 1, 1, 1,
0.3699495, 1.378585, 0.103475, 1, 1, 1, 1, 1,
0.3810977, -0.7775279, 0.5153152, 1, 1, 1, 1, 1,
0.3856369, -0.33766, 1.735509, 1, 1, 1, 1, 1,
0.3930365, -0.8148785, -0.2600768, 1, 1, 1, 1, 1,
0.3982868, -1.698937, 3.253929, 1, 1, 1, 1, 1,
0.4045148, 1.862536, -0.0532995, 1, 1, 1, 1, 1,
0.4077351, 0.1405874, 1.319665, 1, 1, 1, 1, 1,
0.4112767, -0.2521574, 2.888829, 1, 1, 1, 1, 1,
0.413996, 0.7688614, 1.25572, 1, 1, 1, 1, 1,
0.4192069, 1.073165, -0.9570751, 1, 1, 1, 1, 1,
0.4203717, -0.2831726, 3.184729, 1, 1, 1, 1, 1,
0.4233668, 0.6468689, -0.4202804, 1, 1, 1, 1, 1,
0.430802, -0.2687896, 3.164574, 0, 0, 1, 1, 1,
0.4341797, 0.4291271, 1.324836, 1, 0, 0, 1, 1,
0.4388098, -0.2661952, 0.7925283, 1, 0, 0, 1, 1,
0.4393678, -1.673375, 2.361808, 1, 0, 0, 1, 1,
0.4412388, 0.7783132, 0.06859781, 1, 0, 0, 1, 1,
0.4443592, -0.3974123, 1.378353, 1, 0, 0, 1, 1,
0.4500911, 1.618768, -0.4575698, 0, 0, 0, 1, 1,
0.4561353, -0.07671129, 3.39092, 0, 0, 0, 1, 1,
0.4711134, 0.3553169, -0.1448395, 0, 0, 0, 1, 1,
0.4795671, -0.08130825, 2.456929, 0, 0, 0, 1, 1,
0.480664, 0.5199733, 1.431451, 0, 0, 0, 1, 1,
0.4831427, -0.8701734, 4.974045, 0, 0, 0, 1, 1,
0.4842191, -0.3679771, 3.566158, 0, 0, 0, 1, 1,
0.4850226, -1.006007, 2.836097, 1, 1, 1, 1, 1,
0.4882149, -1.296812, 3.177574, 1, 1, 1, 1, 1,
0.4888675, -0.6953142, 3.177703, 1, 1, 1, 1, 1,
0.4895249, 0.9410858, 2.593006, 1, 1, 1, 1, 1,
0.4899168, -0.3518744, 2.008274, 1, 1, 1, 1, 1,
0.4944673, 0.1777586, 1.768807, 1, 1, 1, 1, 1,
0.5006121, -0.5811226, 2.871223, 1, 1, 1, 1, 1,
0.500633, 0.1437881, 0.4967381, 1, 1, 1, 1, 1,
0.5071633, -1.211377, 1.228803, 1, 1, 1, 1, 1,
0.5097806, -0.1929013, 1.835851, 1, 1, 1, 1, 1,
0.5121657, 1.020645, 1.496863, 1, 1, 1, 1, 1,
0.5122678, -0.6076659, 1.028997, 1, 1, 1, 1, 1,
0.5127524, -0.6084704, 3.740386, 1, 1, 1, 1, 1,
0.5168495, -1.463274, 3.263669, 1, 1, 1, 1, 1,
0.5217211, -0.1172991, 1.940209, 1, 1, 1, 1, 1,
0.5223013, -2.440505, 2.625071, 0, 0, 1, 1, 1,
0.5255591, 0.6442385, 0.5170167, 1, 0, 0, 1, 1,
0.5256191, 0.01172028, 3.099336, 1, 0, 0, 1, 1,
0.528513, -1.191108, 1.195189, 1, 0, 0, 1, 1,
0.5348037, -0.1025967, 0.5560156, 1, 0, 0, 1, 1,
0.5383175, 1.909913, 0.7669938, 1, 0, 0, 1, 1,
0.5454923, 0.2870766, 2.103438, 0, 0, 0, 1, 1,
0.552281, -0.5248322, 3.263446, 0, 0, 0, 1, 1,
0.5624024, -0.2002269, 1.5099, 0, 0, 0, 1, 1,
0.565659, 0.8393805, 1.25375, 0, 0, 0, 1, 1,
0.5665107, -1.387828, 2.269427, 0, 0, 0, 1, 1,
0.5712793, -0.9936613, 0.953858, 0, 0, 0, 1, 1,
0.5725297, -1.033786, 1.264004, 0, 0, 0, 1, 1,
0.5726085, 0.3614381, 2.537926, 1, 1, 1, 1, 1,
0.5728146, 0.1667416, 1.30712, 1, 1, 1, 1, 1,
0.574914, -1.053353, 2.712467, 1, 1, 1, 1, 1,
0.5792744, -0.04883906, 2.317247, 1, 1, 1, 1, 1,
0.5793748, -0.5097735, 3.015981, 1, 1, 1, 1, 1,
0.579536, -1.601046, 2.203593, 1, 1, 1, 1, 1,
0.582512, -1.112373, 2.58668, 1, 1, 1, 1, 1,
0.5843077, 0.3141267, 1.075806, 1, 1, 1, 1, 1,
0.5855877, 1.146625, 0.5492202, 1, 1, 1, 1, 1,
0.5925805, -0.7327116, 1.989828, 1, 1, 1, 1, 1,
0.5963565, 0.8412183, 1.417353, 1, 1, 1, 1, 1,
0.5981601, -0.738573, 3.162185, 1, 1, 1, 1, 1,
0.6035579, -2.200656, 5.369081, 1, 1, 1, 1, 1,
0.6038538, -0.9434781, 3.164947, 1, 1, 1, 1, 1,
0.6071572, -0.1685365, 1.345657, 1, 1, 1, 1, 1,
0.6085274, 0.3925411, 1.245832, 0, 0, 1, 1, 1,
0.6114239, -0.4498784, 1.475871, 1, 0, 0, 1, 1,
0.6117156, -0.2815543, 2.566029, 1, 0, 0, 1, 1,
0.6121284, -1.061813, 1.995027, 1, 0, 0, 1, 1,
0.6266799, -1.096107, 3.020897, 1, 0, 0, 1, 1,
0.6320064, -0.7764698, 3.328851, 1, 0, 0, 1, 1,
0.637888, -1.181633, 2.09985, 0, 0, 0, 1, 1,
0.6382445, -0.1507665, 1.840835, 0, 0, 0, 1, 1,
0.6393405, 1.605743, 0.4796171, 0, 0, 0, 1, 1,
0.6441281, -0.05553403, 2.316883, 0, 0, 0, 1, 1,
0.6469779, 1.0811, 0.5040002, 0, 0, 0, 1, 1,
0.6471257, 0.5923513, 1.272397, 0, 0, 0, 1, 1,
0.6472905, -0.6773561, 4.213943, 0, 0, 0, 1, 1,
0.6503068, -1.048571, 3.373759, 1, 1, 1, 1, 1,
0.6560422, -1.053298, 2.487563, 1, 1, 1, 1, 1,
0.6565954, -1.665881, 2.082935, 1, 1, 1, 1, 1,
0.6593474, 0.4540585, 2.335265, 1, 1, 1, 1, 1,
0.6634581, 1.011215, 0.5702873, 1, 1, 1, 1, 1,
0.6674693, -0.4895464, 3.420897, 1, 1, 1, 1, 1,
0.6694856, -0.9983025, 2.464265, 1, 1, 1, 1, 1,
0.6700011, -0.9659166, 3.922067, 1, 1, 1, 1, 1,
0.674247, -0.9203759, 2.238443, 1, 1, 1, 1, 1,
0.6769885, -0.7437617, 1.210984, 1, 1, 1, 1, 1,
0.6819638, -0.4100325, 2.406677, 1, 1, 1, 1, 1,
0.6843974, 0.788136, 0.8367853, 1, 1, 1, 1, 1,
0.6949671, -1.52209, 3.068664, 1, 1, 1, 1, 1,
0.6990948, 1.877433, 1.081268, 1, 1, 1, 1, 1,
0.7035282, -2.147061, 4.541697, 1, 1, 1, 1, 1,
0.7060961, -0.2478343, 2.298782, 0, 0, 1, 1, 1,
0.7079322, -0.2770818, 2.678568, 1, 0, 0, 1, 1,
0.7153127, 0.1790051, 1.368755, 1, 0, 0, 1, 1,
0.7186081, -1.189656, 2.013673, 1, 0, 0, 1, 1,
0.7216685, -0.1844475, 1.20382, 1, 0, 0, 1, 1,
0.7261729, 0.9456537, -0.2976504, 1, 0, 0, 1, 1,
0.7322235, -0.8772345, 2.358929, 0, 0, 0, 1, 1,
0.7364892, -0.3847446, 0.784864, 0, 0, 0, 1, 1,
0.7399489, 0.5732456, 1.120152, 0, 0, 0, 1, 1,
0.7416106, 0.01059898, 2.095372, 0, 0, 0, 1, 1,
0.7456216, 0.524407, 0.2072779, 0, 0, 0, 1, 1,
0.7458642, -0.2832431, 1.997368, 0, 0, 0, 1, 1,
0.7478599, 1.193853, 0.197922, 0, 0, 0, 1, 1,
0.7503093, -0.6314808, 1.036705, 1, 1, 1, 1, 1,
0.753242, 0.05611265, 1.961651, 1, 1, 1, 1, 1,
0.7576346, -0.416116, 2.020073, 1, 1, 1, 1, 1,
0.7621495, 1.268714, 0.08521936, 1, 1, 1, 1, 1,
0.7642965, -0.8239537, 2.210122, 1, 1, 1, 1, 1,
0.7796258, -0.3879923, 3.083442, 1, 1, 1, 1, 1,
0.78996, 0.1745919, 1.918853, 1, 1, 1, 1, 1,
0.7964863, 0.4853866, -0.1585685, 1, 1, 1, 1, 1,
0.8030091, 0.2341773, 0.6154783, 1, 1, 1, 1, 1,
0.8053365, -2.277961, 4.646155, 1, 1, 1, 1, 1,
0.8061467, -0.2909919, 0.9307626, 1, 1, 1, 1, 1,
0.8109876, 0.9525873, -0.1820466, 1, 1, 1, 1, 1,
0.812163, 1.5991, 0.4390856, 1, 1, 1, 1, 1,
0.814975, 0.04974345, 1.770382, 1, 1, 1, 1, 1,
0.818978, 1.016095, 0.330978, 1, 1, 1, 1, 1,
0.8192935, 0.803874, 0.968339, 0, 0, 1, 1, 1,
0.8198622, 1.177611, 0.5806566, 1, 0, 0, 1, 1,
0.8253164, -0.3426447, 2.678959, 1, 0, 0, 1, 1,
0.8425458, -0.1407152, 0.7494912, 1, 0, 0, 1, 1,
0.8432468, 1.211241, 0.9850025, 1, 0, 0, 1, 1,
0.8436929, 1.46483, 1.178096, 1, 0, 0, 1, 1,
0.8458706, 0.5624245, 0.3781103, 0, 0, 0, 1, 1,
0.8499237, 0.1609946, -0.2413064, 0, 0, 0, 1, 1,
0.8552207, -0.4893961, 2.090832, 0, 0, 0, 1, 1,
0.8613389, -0.9845008, 2.500722, 0, 0, 0, 1, 1,
0.8638892, -0.4388073, 0.1555969, 0, 0, 0, 1, 1,
0.8682657, -1.008043, 1.016675, 0, 0, 0, 1, 1,
0.8682737, 0.912772, 0.2421159, 0, 0, 0, 1, 1,
0.8729316, 0.6784757, -0.9519873, 1, 1, 1, 1, 1,
0.8737133, 0.2539481, 1.160751, 1, 1, 1, 1, 1,
0.8750903, 0.05360683, 1.066789, 1, 1, 1, 1, 1,
0.8769991, -0.5570366, 3.229311, 1, 1, 1, 1, 1,
0.8780632, -0.1339945, 3.037602, 1, 1, 1, 1, 1,
0.8788331, -0.1731836, 2.472122, 1, 1, 1, 1, 1,
0.8811356, -0.634738, 3.566898, 1, 1, 1, 1, 1,
0.8814671, -0.1428527, 1.83195, 1, 1, 1, 1, 1,
0.8880434, 1.09869, 0.5308671, 1, 1, 1, 1, 1,
0.8890314, -0.01608961, 1.468076, 1, 1, 1, 1, 1,
0.8892719, 1.040186, 1.743083, 1, 1, 1, 1, 1,
0.8956012, -0.841639, 1.685603, 1, 1, 1, 1, 1,
0.8963181, -1.393836, 3.126697, 1, 1, 1, 1, 1,
0.8974467, 0.363433, 0.4399366, 1, 1, 1, 1, 1,
0.8980226, -0.1762384, 0.6808596, 1, 1, 1, 1, 1,
0.9041665, 2.358789, 0.575684, 0, 0, 1, 1, 1,
0.9088541, 0.9691796, -0.06946155, 1, 0, 0, 1, 1,
0.9209861, -0.2438166, 1.961313, 1, 0, 0, 1, 1,
0.9278527, 0.07027894, 2.307962, 1, 0, 0, 1, 1,
0.9293426, -2.055475, 3.428424, 1, 0, 0, 1, 1,
0.9305719, 0.1272904, 0.03983066, 1, 0, 0, 1, 1,
0.9342894, -1.144101, 1.335265, 0, 0, 0, 1, 1,
0.9350845, 0.02390608, 1.792227, 0, 0, 0, 1, 1,
0.9457666, -0.3746687, -0.3776584, 0, 0, 0, 1, 1,
0.9605696, -0.8881174, 2.2563, 0, 0, 0, 1, 1,
0.9606333, 3.004243, 0.4607383, 0, 0, 0, 1, 1,
0.9621214, 0.9566076, 1.291596, 0, 0, 0, 1, 1,
0.9632853, -0.397022, 1.717206, 0, 0, 0, 1, 1,
0.9660965, -0.4629983, -0.2872764, 1, 1, 1, 1, 1,
0.9684588, -0.07607252, 0.7077569, 1, 1, 1, 1, 1,
0.9754176, -0.6089758, 2.299305, 1, 1, 1, 1, 1,
0.9841501, 0.003972484, 0.7374693, 1, 1, 1, 1, 1,
0.9887287, 1.585859, -1.286362, 1, 1, 1, 1, 1,
0.9900525, -0.6932929, 2.0994, 1, 1, 1, 1, 1,
0.9959101, 1.039802, 2.254669, 1, 1, 1, 1, 1,
1.010799, -0.678787, 0.5472995, 1, 1, 1, 1, 1,
1.015538, 1.914804, 0.7613717, 1, 1, 1, 1, 1,
1.018364, 0.01328292, 0.896363, 1, 1, 1, 1, 1,
1.024562, 0.6448191, 3.270501, 1, 1, 1, 1, 1,
1.026968, -0.1402123, 1.973206, 1, 1, 1, 1, 1,
1.027888, 0.1228983, 1.702414, 1, 1, 1, 1, 1,
1.029957, -0.4947284, 0.4366163, 1, 1, 1, 1, 1,
1.034425, 1.20143, -0.5090302, 1, 1, 1, 1, 1,
1.039122, 1.321212, 2.333304, 0, 0, 1, 1, 1,
1.041104, 0.8847746, 0.9113529, 1, 0, 0, 1, 1,
1.041248, -1.37159, 3.435807, 1, 0, 0, 1, 1,
1.051572, -0.8797817, 1.865452, 1, 0, 0, 1, 1,
1.057657, 1.875975, 0.4281569, 1, 0, 0, 1, 1,
1.06415, -0.5946913, 1.557171, 1, 0, 0, 1, 1,
1.064184, 0.527918, -1.062309, 0, 0, 0, 1, 1,
1.065548, 0.186728, 2.367767, 0, 0, 0, 1, 1,
1.068792, -0.9766214, 2.95523, 0, 0, 0, 1, 1,
1.076715, 0.7147936, 1.246816, 0, 0, 0, 1, 1,
1.082248, -0.2526355, 3.702785, 0, 0, 0, 1, 1,
1.086631, -0.9236948, 3.305885, 0, 0, 0, 1, 1,
1.090253, -1.626747, 2.256716, 0, 0, 0, 1, 1,
1.097047, 2.377129, -1.252294, 1, 1, 1, 1, 1,
1.09901, 0.1571006, 3.001971, 1, 1, 1, 1, 1,
1.1063, 1.995375, 1.22336, 1, 1, 1, 1, 1,
1.115306, 0.5458598, 0.01254073, 1, 1, 1, 1, 1,
1.118735, -0.7644675, 3.101939, 1, 1, 1, 1, 1,
1.123138, 0.7584116, 0.9576356, 1, 1, 1, 1, 1,
1.125808, 1.051303, 2.095053, 1, 1, 1, 1, 1,
1.125907, -0.8974688, 1.01379, 1, 1, 1, 1, 1,
1.127405, -0.6186316, 3.091815, 1, 1, 1, 1, 1,
1.132676, -0.8718097, 2.939031, 1, 1, 1, 1, 1,
1.136636, -1.082468, 4.142133, 1, 1, 1, 1, 1,
1.140846, 1.45581, -0.2684089, 1, 1, 1, 1, 1,
1.143269, -0.8052536, 0.7368246, 1, 1, 1, 1, 1,
1.143411, 0.8986209, 0.7695473, 1, 1, 1, 1, 1,
1.150232, -0.1592373, 1.129639, 1, 1, 1, 1, 1,
1.152081, 0.8668688, -0.04541815, 0, 0, 1, 1, 1,
1.165993, -2.444242, 2.872608, 1, 0, 0, 1, 1,
1.166059, 0.4938281, 0.1263525, 1, 0, 0, 1, 1,
1.167193, -0.6764621, 1.279134, 1, 0, 0, 1, 1,
1.169206, 0.2559047, 3.9873, 1, 0, 0, 1, 1,
1.172549, -1.505157, 4.010653, 1, 0, 0, 1, 1,
1.175568, 1.562298, 0.398584, 0, 0, 0, 1, 1,
1.177213, -0.5939584, 2.084035, 0, 0, 0, 1, 1,
1.179375, -0.5067134, 1.625052, 0, 0, 0, 1, 1,
1.179879, -0.7088528, 2.833298, 0, 0, 0, 1, 1,
1.183862, -0.6661608, 1.110332, 0, 0, 0, 1, 1,
1.18516, -1.615085, 1.11962, 0, 0, 0, 1, 1,
1.19083, 0.9003605, 1.466849, 0, 0, 0, 1, 1,
1.191429, -0.1652441, 2.715413, 1, 1, 1, 1, 1,
1.196121, -1.064205, 2.918968, 1, 1, 1, 1, 1,
1.204138, 1.234594, -1.677588, 1, 1, 1, 1, 1,
1.207905, -1.736943, 2.003032, 1, 1, 1, 1, 1,
1.20883, -0.8059876, 1.876489, 1, 1, 1, 1, 1,
1.212481, -0.4971847, 2.520163, 1, 1, 1, 1, 1,
1.215101, 0.06781083, 1.998856, 1, 1, 1, 1, 1,
1.225936, 0.4175228, -0.1005529, 1, 1, 1, 1, 1,
1.225998, -0.8109296, 0.9546379, 1, 1, 1, 1, 1,
1.23051, 0.990554, 1.082298, 1, 1, 1, 1, 1,
1.23434, -1.186031, -0.287046, 1, 1, 1, 1, 1,
1.249396, 0.701428, 1.923186, 1, 1, 1, 1, 1,
1.253251, -0.9566954, 0.8992238, 1, 1, 1, 1, 1,
1.26069, -0.4796054, 2.18257, 1, 1, 1, 1, 1,
1.263383, -1.109724, 2.448373, 1, 1, 1, 1, 1,
1.270456, 1.498418, 0.09880308, 0, 0, 1, 1, 1,
1.275125, -1.198534, 2.823423, 1, 0, 0, 1, 1,
1.278156, -1.225387, 1.23735, 1, 0, 0, 1, 1,
1.285845, -0.3136218, 2.893517, 1, 0, 0, 1, 1,
1.289516, 0.8175241, 2.2087, 1, 0, 0, 1, 1,
1.292922, 2.128017, 0.5811067, 1, 0, 0, 1, 1,
1.296625, 0.9952074, 1.602465, 0, 0, 0, 1, 1,
1.306409, 1.862795, 0.4557179, 0, 0, 0, 1, 1,
1.309404, 0.808436, 0.2528592, 0, 0, 0, 1, 1,
1.313024, 0.7653754, -0.5325618, 0, 0, 0, 1, 1,
1.321375, 0.182473, 1.076439, 0, 0, 0, 1, 1,
1.323069, 0.9973836, 1.08385, 0, 0, 0, 1, 1,
1.326945, 0.4160982, 2.443795, 0, 0, 0, 1, 1,
1.334375, 0.8269924, 1.240497, 1, 1, 1, 1, 1,
1.33491, 0.1923139, 1.645501, 1, 1, 1, 1, 1,
1.340203, -1.371698, 1.642671, 1, 1, 1, 1, 1,
1.346368, -0.2343891, 1.810865, 1, 1, 1, 1, 1,
1.352963, 0.6831789, 1.721135, 1, 1, 1, 1, 1,
1.353734, 1.229736, 0.3935262, 1, 1, 1, 1, 1,
1.35617, -0.1666386, 0.8888841, 1, 1, 1, 1, 1,
1.357673, -0.1263267, 2.257811, 1, 1, 1, 1, 1,
1.366469, -0.01823245, -0.5157679, 1, 1, 1, 1, 1,
1.379147, 0.221607, -0.03491131, 1, 1, 1, 1, 1,
1.38354, -0.354479, 2.538213, 1, 1, 1, 1, 1,
1.391058, 0.4008382, -1.157166, 1, 1, 1, 1, 1,
1.40182, 0.5703316, 1.550446, 1, 1, 1, 1, 1,
1.409364, 0.8427419, 0.6745312, 1, 1, 1, 1, 1,
1.415283, 0.3106335, 2.052, 1, 1, 1, 1, 1,
1.419737, 0.09244909, 2.173014, 0, 0, 1, 1, 1,
1.428706, -1.153857, 1.039107, 1, 0, 0, 1, 1,
1.431274, -0.4603212, 2.523021, 1, 0, 0, 1, 1,
1.443887, -1.147633, 1.158867, 1, 0, 0, 1, 1,
1.449311, 0.3307948, 0.8270109, 1, 0, 0, 1, 1,
1.460492, -0.9947587, 2.365863, 1, 0, 0, 1, 1,
1.466724, 0.9597879, 0.2504835, 0, 0, 0, 1, 1,
1.467732, 0.1800244, 0.9470392, 0, 0, 0, 1, 1,
1.476589, -0.3188706, 2.26433, 0, 0, 0, 1, 1,
1.484132, -0.8735617, 1.72826, 0, 0, 0, 1, 1,
1.49134, 0.2586778, 2.884464, 0, 0, 0, 1, 1,
1.493061, -1.534335, 3.731164, 0, 0, 0, 1, 1,
1.493842, -0.4425495, 1.528051, 0, 0, 0, 1, 1,
1.495089, -0.848214, 2.477019, 1, 1, 1, 1, 1,
1.495733, 0.2021362, 0.911967, 1, 1, 1, 1, 1,
1.498221, 0.1761818, 2.303993, 1, 1, 1, 1, 1,
1.501307, 0.1886944, 0.8743156, 1, 1, 1, 1, 1,
1.507881, -1.227134, 3.749838, 1, 1, 1, 1, 1,
1.514369, 1.318794, -0.2831331, 1, 1, 1, 1, 1,
1.544769, -0.6488402, 1.152264, 1, 1, 1, 1, 1,
1.546484, 0.4899664, 2.016471, 1, 1, 1, 1, 1,
1.569221, -0.229654, 0.6572303, 1, 1, 1, 1, 1,
1.572068, -1.707709, 2.586793, 1, 1, 1, 1, 1,
1.577958, 0.4451819, 2.659846, 1, 1, 1, 1, 1,
1.58849, 0.7900342, 0.1268536, 1, 1, 1, 1, 1,
1.592649, 0.4090659, -0.6359041, 1, 1, 1, 1, 1,
1.597864, -0.3257725, 1.221322, 1, 1, 1, 1, 1,
1.609713, 1.097897, 2.108108, 1, 1, 1, 1, 1,
1.617306, 0.5289657, 1.067421, 0, 0, 1, 1, 1,
1.634516, 0.6520904, 1.485362, 1, 0, 0, 1, 1,
1.644687, -0.7382764, 1.924024, 1, 0, 0, 1, 1,
1.651674, 0.4073613, 3.701989, 1, 0, 0, 1, 1,
1.687993, 0.1319339, 0.9700682, 1, 0, 0, 1, 1,
1.698321, 0.3529757, 1.72562, 1, 0, 0, 1, 1,
1.70115, 2.211305, 2.190567, 0, 0, 0, 1, 1,
1.709172, 1.120346, 0.8974982, 0, 0, 0, 1, 1,
1.712706, -0.3624913, 2.495652, 0, 0, 0, 1, 1,
1.714203, 0.1136104, 0.7749969, 0, 0, 0, 1, 1,
1.728597, -0.6846119, 3.252679, 0, 0, 0, 1, 1,
1.739461, 0.6259687, 2.921793, 0, 0, 0, 1, 1,
1.743403, 0.6830248, 0.9482735, 0, 0, 0, 1, 1,
1.755636, 0.09054547, 0.8983926, 1, 1, 1, 1, 1,
1.780838, -0.5821446, 2.002797, 1, 1, 1, 1, 1,
1.840122, -0.1389427, 0.8118502, 1, 1, 1, 1, 1,
1.850657, -1.621145, -0.3084552, 1, 1, 1, 1, 1,
1.873206, 0.1545791, 3.254498, 1, 1, 1, 1, 1,
1.882664, 0.8376043, 0.3417552, 1, 1, 1, 1, 1,
1.89792, -0.0743682, 0.0437231, 1, 1, 1, 1, 1,
1.90858, 0.8176049, 1.609108, 1, 1, 1, 1, 1,
1.910376, 1.61881, 1.078398, 1, 1, 1, 1, 1,
1.924212, -0.9153726, 1.70244, 1, 1, 1, 1, 1,
1.93156, -0.3229777, 1.548053, 1, 1, 1, 1, 1,
1.976263, 0.9575989, 1.033601, 1, 1, 1, 1, 1,
1.993405, -1.570728, 1.310574, 1, 1, 1, 1, 1,
2.000544, 2.30677, 2.450417, 1, 1, 1, 1, 1,
2.084656, -0.1283041, -0.5152872, 1, 1, 1, 1, 1,
2.097945, 0.6906962, 0.5030417, 0, 0, 1, 1, 1,
2.106442, -1.150948, 1.306266, 1, 0, 0, 1, 1,
2.107643, -0.07323088, 2.281046, 1, 0, 0, 1, 1,
2.121013, -0.7772751, 3.159033, 1, 0, 0, 1, 1,
2.122319, 1.421554, -0.01521772, 1, 0, 0, 1, 1,
2.130983, 0.8574159, 0.05605032, 1, 0, 0, 1, 1,
2.140586, -1.617735, 3.952396, 0, 0, 0, 1, 1,
2.218966, -0.03960769, 2.200802, 0, 0, 0, 1, 1,
2.30914, -0.383617, 1.14001, 0, 0, 0, 1, 1,
2.370857, 1.460896, 2.241511, 0, 0, 0, 1, 1,
2.421183, 0.7914391, 2.41219, 0, 0, 0, 1, 1,
2.463935, 0.1742356, 1.86241, 0, 0, 0, 1, 1,
2.479433, 0.05161034, 1.366846, 0, 0, 0, 1, 1,
2.581458, -0.1228405, 1.11877, 1, 1, 1, 1, 1,
2.59941, 1.824177, 3.443907, 1, 1, 1, 1, 1,
2.788037, 0.555048, -0.414564, 1, 1, 1, 1, 1,
2.846084, 1.522784, 1.376098, 1, 1, 1, 1, 1,
2.87063, -1.313381, 1.009807, 1, 1, 1, 1, 1,
2.933165, 0.8158923, -0.1807427, 1, 1, 1, 1, 1,
3.238654, 0.04005383, 2.904303, 1, 1, 1, 1, 1
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
var radius = 9.425769;
var distance = 33.10761;
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
mvMatrix.translate( -0.2179289, 0.1881855, -0.06963348 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.10761);
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
