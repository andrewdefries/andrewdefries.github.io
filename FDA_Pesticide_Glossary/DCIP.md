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
-3.204987, 0.2834398, -1.851121, 1, 0, 0, 1,
-3.011212, 1.916486, -0.5015786, 1, 0.007843138, 0, 1,
-2.713245, 0.1472432, -1.051987, 1, 0.01176471, 0, 1,
-2.674606, -0.1380667, -1.230687, 1, 0.01960784, 0, 1,
-2.63713, -0.2460159, -1.556136, 1, 0.02352941, 0, 1,
-2.606875, -1.333044, -2.841227, 1, 0.03137255, 0, 1,
-2.429885, 0.4811299, -1.451736, 1, 0.03529412, 0, 1,
-2.394203, -1.676656, -2.70356, 1, 0.04313726, 0, 1,
-2.391303, -0.2911944, -0.7865607, 1, 0.04705882, 0, 1,
-2.326209, -0.3089564, -2.728618, 1, 0.05490196, 0, 1,
-2.27568, 0.1103066, -1.732025, 1, 0.05882353, 0, 1,
-2.256021, 0.6932434, 0.2759441, 1, 0.06666667, 0, 1,
-2.169232, 0.5522938, -1.967271, 1, 0.07058824, 0, 1,
-2.133884, 0.2685619, -0.2552794, 1, 0.07843138, 0, 1,
-2.124031, -0.8335932, -1.592843, 1, 0.08235294, 0, 1,
-2.123382, -0.5414708, 0.3444226, 1, 0.09019608, 0, 1,
-2.113914, 0.9647794, -0.6381208, 1, 0.09411765, 0, 1,
-2.051421, 0.3883611, -0.9537404, 1, 0.1019608, 0, 1,
-2.049367, -0.05264988, -1.762716, 1, 0.1098039, 0, 1,
-2.029991, -0.3596086, -0.6529109, 1, 0.1137255, 0, 1,
-2.003765, 0.09104558, -1.027569, 1, 0.1215686, 0, 1,
-2.001394, 0.6409743, -0.9453372, 1, 0.1254902, 0, 1,
-1.994626, -1.561543, -4.904837, 1, 0.1333333, 0, 1,
-1.891234, -0.1240804, -1.60984, 1, 0.1372549, 0, 1,
-1.889273, 0.6260857, -1.083001, 1, 0.145098, 0, 1,
-1.87994, 0.2004189, -2.01509, 1, 0.1490196, 0, 1,
-1.868417, -0.7290324, -3.458833, 1, 0.1568628, 0, 1,
-1.865822, -1.114509, -0.51577, 1, 0.1607843, 0, 1,
-1.84307, 1.075629, -0.4686974, 1, 0.1686275, 0, 1,
-1.818259, 0.1211745, -0.2476154, 1, 0.172549, 0, 1,
-1.812803, 0.1538735, -1.122337, 1, 0.1803922, 0, 1,
-1.809224, 1.501137, 0.4289222, 1, 0.1843137, 0, 1,
-1.792268, 0.6248847, -0.1842901, 1, 0.1921569, 0, 1,
-1.766021, 0.6201645, -1.978798, 1, 0.1960784, 0, 1,
-1.71772, 0.6860703, 0.2622548, 1, 0.2039216, 0, 1,
-1.716252, 0.3526392, -2.24128, 1, 0.2117647, 0, 1,
-1.69952, -1.026655, -2.612266, 1, 0.2156863, 0, 1,
-1.698141, 0.7577671, -0.8447417, 1, 0.2235294, 0, 1,
-1.694178, -1.323599, -1.540327, 1, 0.227451, 0, 1,
-1.657562, 0.5502743, -2.912545, 1, 0.2352941, 0, 1,
-1.64617, -1.925298, -4.434718, 1, 0.2392157, 0, 1,
-1.64476, -0.7909142, -0.7278734, 1, 0.2470588, 0, 1,
-1.633753, 1.352507, -3.638795, 1, 0.2509804, 0, 1,
-1.612614, -0.3026958, -1.81168, 1, 0.2588235, 0, 1,
-1.599814, 2.378704, -0.7079505, 1, 0.2627451, 0, 1,
-1.595742, 0.1049632, -0.01540457, 1, 0.2705882, 0, 1,
-1.587099, 0.06174405, -1.633918, 1, 0.2745098, 0, 1,
-1.581645, 0.4351524, -0.7468471, 1, 0.282353, 0, 1,
-1.577049, 0.2251569, -2.13043, 1, 0.2862745, 0, 1,
-1.56734, -1.128895, -1.564931, 1, 0.2941177, 0, 1,
-1.562526, -0.1227444, -1.576498, 1, 0.3019608, 0, 1,
-1.562443, 0.02227203, -1.551692, 1, 0.3058824, 0, 1,
-1.553696, -0.09939495, -0.66486, 1, 0.3137255, 0, 1,
-1.515296, 0.2332629, -0.5480608, 1, 0.3176471, 0, 1,
-1.511043, -1.424859, -3.094483, 1, 0.3254902, 0, 1,
-1.499943, 1.751122, -0.4567202, 1, 0.3294118, 0, 1,
-1.492897, 0.03046864, -0.6478297, 1, 0.3372549, 0, 1,
-1.492415, -0.5873482, -1.74035, 1, 0.3411765, 0, 1,
-1.491193, 0.0578197, -2.719753, 1, 0.3490196, 0, 1,
-1.489262, -0.6403919, -1.513253, 1, 0.3529412, 0, 1,
-1.484067, -2.021732, -1.38238, 1, 0.3607843, 0, 1,
-1.476298, -1.088141, -2.785789, 1, 0.3647059, 0, 1,
-1.469867, 0.6841385, -2.405974, 1, 0.372549, 0, 1,
-1.468582, -0.5963688, -1.557912, 1, 0.3764706, 0, 1,
-1.461279, -0.77012, -2.484134, 1, 0.3843137, 0, 1,
-1.458405, 0.508325, -0.5113334, 1, 0.3882353, 0, 1,
-1.456034, 0.2519745, -1.708059, 1, 0.3960784, 0, 1,
-1.436915, -1.45226, -2.244581, 1, 0.4039216, 0, 1,
-1.422155, 1.74779, -0.5610368, 1, 0.4078431, 0, 1,
-1.422133, -0.7917708, -2.048386, 1, 0.4156863, 0, 1,
-1.415044, 1.06786, -0.587373, 1, 0.4196078, 0, 1,
-1.412193, -0.9756119, -1.425324, 1, 0.427451, 0, 1,
-1.410759, -0.4695268, 0.1776333, 1, 0.4313726, 0, 1,
-1.410618, 1.130195, -1.202939, 1, 0.4392157, 0, 1,
-1.407855, -1.374713, -3.195067, 1, 0.4431373, 0, 1,
-1.403791, 0.185417, -0.4616671, 1, 0.4509804, 0, 1,
-1.402951, 0.3392489, -1.440411, 1, 0.454902, 0, 1,
-1.38679, -0.3203154, -1.222385, 1, 0.4627451, 0, 1,
-1.373646, -1.647483, -0.7155103, 1, 0.4666667, 0, 1,
-1.372381, -0.1419591, 0.102439, 1, 0.4745098, 0, 1,
-1.365367, -1.728706, -1.855741, 1, 0.4784314, 0, 1,
-1.357125, 0.8964476, -2.235897, 1, 0.4862745, 0, 1,
-1.345915, 0.3392907, -0.6503989, 1, 0.4901961, 0, 1,
-1.328226, 0.2620283, -1.932815, 1, 0.4980392, 0, 1,
-1.327456, 0.4703182, -0.1669027, 1, 0.5058824, 0, 1,
-1.326148, -1.591915, -1.865969, 1, 0.509804, 0, 1,
-1.307552, -1.456805, -0.779774, 1, 0.5176471, 0, 1,
-1.288757, 0.6677118, -2.040483, 1, 0.5215687, 0, 1,
-1.288597, -0.4183027, -2.738567, 1, 0.5294118, 0, 1,
-1.2833, 1.692, 0.1747416, 1, 0.5333334, 0, 1,
-1.274145, 0.5310214, -2.298283, 1, 0.5411765, 0, 1,
-1.27287, -0.5209345, -1.448495, 1, 0.5450981, 0, 1,
-1.270029, 0.1430521, -1.591384, 1, 0.5529412, 0, 1,
-1.260005, -1.904574, -3.017769, 1, 0.5568628, 0, 1,
-1.240598, 1.12245, 0.4363641, 1, 0.5647059, 0, 1,
-1.238984, 2.270538, -1.19647, 1, 0.5686275, 0, 1,
-1.23885, -0.8311334, -1.901708, 1, 0.5764706, 0, 1,
-1.235985, -0.5028372, -0.8834085, 1, 0.5803922, 0, 1,
-1.23296, -2.052209, -2.27492, 1, 0.5882353, 0, 1,
-1.232148, -0.5209666, -3.099933, 1, 0.5921569, 0, 1,
-1.231084, -0.697594, -2.371901, 1, 0.6, 0, 1,
-1.22788, 0.5231884, -2.534269, 1, 0.6078432, 0, 1,
-1.222909, -0.5489748, -2.737202, 1, 0.6117647, 0, 1,
-1.220829, 1.105678, 0.1923781, 1, 0.6196079, 0, 1,
-1.210279, 0.3531669, 0.1640363, 1, 0.6235294, 0, 1,
-1.204255, -0.05356761, -1.773228, 1, 0.6313726, 0, 1,
-1.204164, -0.4947623, -1.662596, 1, 0.6352941, 0, 1,
-1.195822, -0.08991102, 0.8694155, 1, 0.6431373, 0, 1,
-1.193628, 1.507029, -1.458256, 1, 0.6470588, 0, 1,
-1.189743, 0.40911, -2.475144, 1, 0.654902, 0, 1,
-1.183077, -1.147741, -2.699354, 1, 0.6588235, 0, 1,
-1.17541, 0.7575651, -1.696592, 1, 0.6666667, 0, 1,
-1.172552, 0.5931825, -0.9122384, 1, 0.6705883, 0, 1,
-1.16707, -1.224422, -2.526446, 1, 0.6784314, 0, 1,
-1.149849, -0.4356728, -2.558231, 1, 0.682353, 0, 1,
-1.147989, 1.797577, -1.643295, 1, 0.6901961, 0, 1,
-1.14658, 0.5183392, 0.3978824, 1, 0.6941177, 0, 1,
-1.135173, 0.5839065, 0.4817103, 1, 0.7019608, 0, 1,
-1.133816, -1.300317, -1.144294, 1, 0.7098039, 0, 1,
-1.132938, -0.9148546, -2.371822, 1, 0.7137255, 0, 1,
-1.129551, 0.1633522, -1.26668, 1, 0.7215686, 0, 1,
-1.127311, 0.08746786, 0.8257564, 1, 0.7254902, 0, 1,
-1.124886, -3.148544, -2.900577, 1, 0.7333333, 0, 1,
-1.124714, 2.808095, -0.06309576, 1, 0.7372549, 0, 1,
-1.124502, -0.1469475, -1.503026, 1, 0.7450981, 0, 1,
-1.121607, 0.5386278, -1.779981, 1, 0.7490196, 0, 1,
-1.121192, -1.623023, -1.264075, 1, 0.7568628, 0, 1,
-1.119183, -0.4406479, -0.8661612, 1, 0.7607843, 0, 1,
-1.110102, -1.217329, -2.145734, 1, 0.7686275, 0, 1,
-1.107053, -0.9417049, -2.642759, 1, 0.772549, 0, 1,
-1.092785, -0.4030131, 0.1488206, 1, 0.7803922, 0, 1,
-1.091226, -0.7104402, -0.4492424, 1, 0.7843137, 0, 1,
-1.090685, -0.2990385, -2.311185, 1, 0.7921569, 0, 1,
-1.089476, -0.1408297, -1.570032, 1, 0.7960784, 0, 1,
-1.086111, 0.992977, -1.984475, 1, 0.8039216, 0, 1,
-1.085276, -1.283956, -1.796529, 1, 0.8117647, 0, 1,
-1.082405, 0.8129584, -0.6191842, 1, 0.8156863, 0, 1,
-1.066326, -0.1924436, -2.790414, 1, 0.8235294, 0, 1,
-1.065725, -0.3386489, -1.891205, 1, 0.827451, 0, 1,
-1.063424, 2.019238, -0.1615955, 1, 0.8352941, 0, 1,
-1.057054, -0.6298981, -2.209064, 1, 0.8392157, 0, 1,
-1.043697, 2.78994, -2.673113, 1, 0.8470588, 0, 1,
-1.039201, 1.318771, -2.123456, 1, 0.8509804, 0, 1,
-1.038742, 1.562513, -0.01247852, 1, 0.8588235, 0, 1,
-1.03772, 0.7701073, -2.269579, 1, 0.8627451, 0, 1,
-1.036015, 0.1604632, -0.8003555, 1, 0.8705882, 0, 1,
-1.031915, 1.794435, -0.7393584, 1, 0.8745098, 0, 1,
-1.028409, -0.3886121, -1.629093, 1, 0.8823529, 0, 1,
-1.019071, 2.3583, 0.04297974, 1, 0.8862745, 0, 1,
-1.009894, 0.8353328, 0.1402882, 1, 0.8941177, 0, 1,
-1.006472, -1.30946, -4.305203, 1, 0.8980392, 0, 1,
-1.00432, -1.019367, -2.249775, 1, 0.9058824, 0, 1,
-0.9812875, -1.059979, -1.945245, 1, 0.9137255, 0, 1,
-0.9801419, -0.7560802, -3.853467, 1, 0.9176471, 0, 1,
-0.9747927, 0.5864509, 0.7180452, 1, 0.9254902, 0, 1,
-0.9720901, 0.1315359, -2.36298, 1, 0.9294118, 0, 1,
-0.9624946, 0.7083923, -0.6656287, 1, 0.9372549, 0, 1,
-0.954845, 0.8657277, -0.8065552, 1, 0.9411765, 0, 1,
-0.9455394, 1.320156, -1.007405, 1, 0.9490196, 0, 1,
-0.9431661, -0.4811878, -3.076011, 1, 0.9529412, 0, 1,
-0.9319324, -1.14834, -3.018633, 1, 0.9607843, 0, 1,
-0.9304659, 1.870009, -2.464187, 1, 0.9647059, 0, 1,
-0.9223512, -0.6928129, -2.315384, 1, 0.972549, 0, 1,
-0.9192302, 0.05923739, 0.3385187, 1, 0.9764706, 0, 1,
-0.911872, -1.588609, -2.862134, 1, 0.9843137, 0, 1,
-0.9073308, 0.1856887, -3.549512, 1, 0.9882353, 0, 1,
-0.9062208, -0.9064384, -1.772423, 1, 0.9960784, 0, 1,
-0.902482, 1.845277, 0.09571312, 0.9960784, 1, 0, 1,
-0.8998778, 0.2646407, -2.471008, 0.9921569, 1, 0, 1,
-0.8882874, 0.5877312, 0.5699096, 0.9843137, 1, 0, 1,
-0.886692, 1.498672, -0.4241776, 0.9803922, 1, 0, 1,
-0.8863462, 0.6112735, -0.219225, 0.972549, 1, 0, 1,
-0.8862615, 1.505862, 0.5613847, 0.9686275, 1, 0, 1,
-0.8854885, -1.090641, -4.520617, 0.9607843, 1, 0, 1,
-0.8832472, 2.759115, -1.140111, 0.9568627, 1, 0, 1,
-0.8797196, -1.232713, -1.784397, 0.9490196, 1, 0, 1,
-0.8782756, 0.8011698, 0.08695401, 0.945098, 1, 0, 1,
-0.8747912, -0.390301, -2.067348, 0.9372549, 1, 0, 1,
-0.871128, -0.4762611, -2.885506, 0.9333333, 1, 0, 1,
-0.8710806, -0.9548464, -2.061239, 0.9254902, 1, 0, 1,
-0.8709821, 1.907034, -0.4401478, 0.9215686, 1, 0, 1,
-0.8668848, 0.4018526, -0.8285241, 0.9137255, 1, 0, 1,
-0.8560702, 1.561002, 1.372657, 0.9098039, 1, 0, 1,
-0.8536695, 0.8738245, -1.083809, 0.9019608, 1, 0, 1,
-0.853073, 0.6086338, -0.6377164, 0.8941177, 1, 0, 1,
-0.8401781, 0.5122514, -0.5572, 0.8901961, 1, 0, 1,
-0.8362621, 0.4376445, -1.874769, 0.8823529, 1, 0, 1,
-0.8350251, 1.621454, -1.546733, 0.8784314, 1, 0, 1,
-0.8311653, -0.7094657, -2.285539, 0.8705882, 1, 0, 1,
-0.8294356, 1.307351, -1.551685, 0.8666667, 1, 0, 1,
-0.8219044, -0.8161187, -1.506372, 0.8588235, 1, 0, 1,
-0.8209038, 1.583813, 0.9125075, 0.854902, 1, 0, 1,
-0.8164084, 0.01923419, -1.513115, 0.8470588, 1, 0, 1,
-0.8161181, -3.423006, -3.495557, 0.8431373, 1, 0, 1,
-0.8141377, 0.9265959, -1.056074, 0.8352941, 1, 0, 1,
-0.8066525, -1.008155, -2.148996, 0.8313726, 1, 0, 1,
-0.8064495, -1.623913, -3.485096, 0.8235294, 1, 0, 1,
-0.8044709, -0.9093559, -1.707864, 0.8196079, 1, 0, 1,
-0.8043537, -0.03717938, -1.489572, 0.8117647, 1, 0, 1,
-0.8033859, 1.160217, 1.428044, 0.8078431, 1, 0, 1,
-0.8024695, -0.7836232, -0.2869338, 0.8, 1, 0, 1,
-0.7969405, -0.449836, -0.89267, 0.7921569, 1, 0, 1,
-0.7968234, 0.9923249, -0.1150403, 0.7882353, 1, 0, 1,
-0.7854022, 0.5121932, -1.52275, 0.7803922, 1, 0, 1,
-0.7837767, 0.7259888, -2.003389, 0.7764706, 1, 0, 1,
-0.7825148, 0.4764997, -1.701294, 0.7686275, 1, 0, 1,
-0.7744043, -0.08111339, -1.720403, 0.7647059, 1, 0, 1,
-0.7733305, -0.4672287, -2.228734, 0.7568628, 1, 0, 1,
-0.7643666, -0.1993237, -0.5976149, 0.7529412, 1, 0, 1,
-0.7611448, -0.1817767, -3.476765, 0.7450981, 1, 0, 1,
-0.758558, -1.444904, -3.471925, 0.7411765, 1, 0, 1,
-0.7489226, -0.2316956, -1.610072, 0.7333333, 1, 0, 1,
-0.7476584, 0.2773289, 0.7320318, 0.7294118, 1, 0, 1,
-0.7423507, -2.754524, -2.333192, 0.7215686, 1, 0, 1,
-0.739491, 0.9702416, -0.6353586, 0.7176471, 1, 0, 1,
-0.7369799, 0.5200662, -0.9829862, 0.7098039, 1, 0, 1,
-0.7322193, -1.500523, -1.698697, 0.7058824, 1, 0, 1,
-0.7299234, 1.076872, -1.268724, 0.6980392, 1, 0, 1,
-0.7282962, -0.6417447, -1.630231, 0.6901961, 1, 0, 1,
-0.7265573, 0.04255763, -1.143477, 0.6862745, 1, 0, 1,
-0.724078, -0.3320113, -3.819154, 0.6784314, 1, 0, 1,
-0.7215042, -1.380506, -3.362983, 0.6745098, 1, 0, 1,
-0.7208328, 1.010956, 0.6432079, 0.6666667, 1, 0, 1,
-0.7207689, -0.2126647, -1.651132, 0.6627451, 1, 0, 1,
-0.7168009, -1.203299, -3.62864, 0.654902, 1, 0, 1,
-0.715418, 0.5576894, -0.3315672, 0.6509804, 1, 0, 1,
-0.7096269, -0.133464, -3.135914, 0.6431373, 1, 0, 1,
-0.7056779, 0.3823301, -2.331353, 0.6392157, 1, 0, 1,
-0.7037668, 0.319757, -1.915555, 0.6313726, 1, 0, 1,
-0.7003775, 0.4945269, -0.5199469, 0.627451, 1, 0, 1,
-0.6947815, 0.7197235, 0.2714827, 0.6196079, 1, 0, 1,
-0.6894826, -1.057971, -2.217276, 0.6156863, 1, 0, 1,
-0.6849726, 0.2769182, -1.669671, 0.6078432, 1, 0, 1,
-0.6847911, -0.1339747, -1.42171, 0.6039216, 1, 0, 1,
-0.6813115, 0.5598264, -0.6548433, 0.5960785, 1, 0, 1,
-0.6794626, 0.1709789, -1.428577, 0.5882353, 1, 0, 1,
-0.67392, -0.8337978, -2.492682, 0.5843138, 1, 0, 1,
-0.6730099, -1.638516, -3.091391, 0.5764706, 1, 0, 1,
-0.6700379, 1.12122, -1.3504, 0.572549, 1, 0, 1,
-0.6638752, -0.2471054, -2.388355, 0.5647059, 1, 0, 1,
-0.6610514, -1.206618, -0.602284, 0.5607843, 1, 0, 1,
-0.6497704, 0.2276177, -0.1098956, 0.5529412, 1, 0, 1,
-0.6470489, 0.1939602, -0.2823607, 0.5490196, 1, 0, 1,
-0.6407263, -0.7594827, -1.368001, 0.5411765, 1, 0, 1,
-0.6373313, -0.9474548, -2.388028, 0.5372549, 1, 0, 1,
-0.6335825, 0.9775068, -0.7646039, 0.5294118, 1, 0, 1,
-0.6262432, 0.9883566, -1.158351, 0.5254902, 1, 0, 1,
-0.625528, 0.8296118, -1.83596, 0.5176471, 1, 0, 1,
-0.6217038, 0.3537956, -2.178523, 0.5137255, 1, 0, 1,
-0.6204558, -0.6227703, -1.450186, 0.5058824, 1, 0, 1,
-0.6197444, -0.426908, -2.445143, 0.5019608, 1, 0, 1,
-0.6135506, -1.914027, -4.427119, 0.4941176, 1, 0, 1,
-0.6128612, 0.1096347, -0.4696722, 0.4862745, 1, 0, 1,
-0.6023116, -0.3598458, -2.198619, 0.4823529, 1, 0, 1,
-0.5951639, -1.009653, -3.157923, 0.4745098, 1, 0, 1,
-0.5927387, -0.8064677, -4.179322, 0.4705882, 1, 0, 1,
-0.589731, 0.3992898, -1.192822, 0.4627451, 1, 0, 1,
-0.5885113, 0.09875518, -0.6074504, 0.4588235, 1, 0, 1,
-0.5879037, 1.22683, -2.179568, 0.4509804, 1, 0, 1,
-0.5870294, 0.5284214, -1.692851, 0.4470588, 1, 0, 1,
-0.5854362, -0.2847789, -2.738041, 0.4392157, 1, 0, 1,
-0.5832928, 0.0066139, -1.712863, 0.4352941, 1, 0, 1,
-0.5832422, -0.03153766, -1.507388, 0.427451, 1, 0, 1,
-0.5828413, -0.8447852, -4.333147, 0.4235294, 1, 0, 1,
-0.5807222, -1.401515, -3.670043, 0.4156863, 1, 0, 1,
-0.5803537, -0.1726812, -2.055077, 0.4117647, 1, 0, 1,
-0.5773603, -0.768019, -4.083076, 0.4039216, 1, 0, 1,
-0.5760311, -0.6701699, -2.874256, 0.3960784, 1, 0, 1,
-0.5726066, 0.7306451, -2.21428, 0.3921569, 1, 0, 1,
-0.5714459, -0.4562407, -1.137526, 0.3843137, 1, 0, 1,
-0.5701237, 0.8576339, 0.0280944, 0.3803922, 1, 0, 1,
-0.5671796, -2.089038, -3.386489, 0.372549, 1, 0, 1,
-0.5670139, -0.827007, -2.461428, 0.3686275, 1, 0, 1,
-0.5665405, -1.418636, -2.392317, 0.3607843, 1, 0, 1,
-0.5640512, -0.3665149, -0.7998106, 0.3568628, 1, 0, 1,
-0.5632679, 0.4390177, -1.036274, 0.3490196, 1, 0, 1,
-0.5622801, 0.7764666, -1.693233, 0.345098, 1, 0, 1,
-0.561639, 0.01393385, -1.671114, 0.3372549, 1, 0, 1,
-0.5584359, 0.5017034, -0.4742629, 0.3333333, 1, 0, 1,
-0.555257, -0.4148564, -1.760579, 0.3254902, 1, 0, 1,
-0.5525995, 0.4295278, -2.294048, 0.3215686, 1, 0, 1,
-0.5525989, 0.5920153, -1.174765, 0.3137255, 1, 0, 1,
-0.5506348, -1.21929, -3.770442, 0.3098039, 1, 0, 1,
-0.5497075, 0.2094774, -0.2860745, 0.3019608, 1, 0, 1,
-0.5494936, 1.470639, -0.5956084, 0.2941177, 1, 0, 1,
-0.5474087, -0.7003252, -2.219905, 0.2901961, 1, 0, 1,
-0.5409356, -1.352841, -0.7719016, 0.282353, 1, 0, 1,
-0.5407561, 2.286343, 0.2669693, 0.2784314, 1, 0, 1,
-0.5406725, 0.5767167, 0.6288617, 0.2705882, 1, 0, 1,
-0.526556, 0.07991058, -2.256016, 0.2666667, 1, 0, 1,
-0.5263497, -0.7954028, -2.703564, 0.2588235, 1, 0, 1,
-0.5249842, 1.448903, 0.07880411, 0.254902, 1, 0, 1,
-0.5185711, -1.763996, -2.649511, 0.2470588, 1, 0, 1,
-0.5177441, -1.620379, -4.030161, 0.2431373, 1, 0, 1,
-0.5120521, -1.119386, -2.386349, 0.2352941, 1, 0, 1,
-0.5115879, 0.547732, -1.581769, 0.2313726, 1, 0, 1,
-0.5105354, 0.4886327, -0.4567234, 0.2235294, 1, 0, 1,
-0.5088475, 2.453598, -0.1127057, 0.2196078, 1, 0, 1,
-0.50623, 0.4801849, -1.181827, 0.2117647, 1, 0, 1,
-0.4980317, 1.09618, -0.01907078, 0.2078431, 1, 0, 1,
-0.4908041, 1.051961, -1.300503, 0.2, 1, 0, 1,
-0.4889863, 1.228335, -2.141254, 0.1921569, 1, 0, 1,
-0.4855539, 0.4447963, 0.1430377, 0.1882353, 1, 0, 1,
-0.4823107, -0.6376402, -2.894495, 0.1803922, 1, 0, 1,
-0.4819993, -0.2334457, -1.641121, 0.1764706, 1, 0, 1,
-0.4807239, -0.9536884, -3.580655, 0.1686275, 1, 0, 1,
-0.479882, 0.3210983, 0.3619757, 0.1647059, 1, 0, 1,
-0.4768796, -1.206484, -2.378491, 0.1568628, 1, 0, 1,
-0.4698794, -1.277788, -3.50535, 0.1529412, 1, 0, 1,
-0.4683628, 0.565952, 1.314381, 0.145098, 1, 0, 1,
-0.4653409, -0.7146404, -1.98842, 0.1411765, 1, 0, 1,
-0.4517532, -0.1659831, -2.929962, 0.1333333, 1, 0, 1,
-0.4462561, 0.7223726, 0.9353193, 0.1294118, 1, 0, 1,
-0.4453081, -1.344063, -3.629674, 0.1215686, 1, 0, 1,
-0.4452858, 0.3782771, -0.2970539, 0.1176471, 1, 0, 1,
-0.4442886, -0.8245434, -4.299133, 0.1098039, 1, 0, 1,
-0.442549, -0.1398202, -4.860433, 0.1058824, 1, 0, 1,
-0.4386213, 0.2044692, -0.8484613, 0.09803922, 1, 0, 1,
-0.437499, -0.439693, -2.132167, 0.09019608, 1, 0, 1,
-0.4348114, 0.3134676, -2.237805, 0.08627451, 1, 0, 1,
-0.4327426, 1.163023, -2.01277, 0.07843138, 1, 0, 1,
-0.431859, 2.082891, 0.4184782, 0.07450981, 1, 0, 1,
-0.4316267, -1.340014, -2.853075, 0.06666667, 1, 0, 1,
-0.4200047, 0.4237955, 0.3303314, 0.0627451, 1, 0, 1,
-0.4192966, -0.005510384, -1.949485, 0.05490196, 1, 0, 1,
-0.4184287, -0.7220411, -4.271893, 0.05098039, 1, 0, 1,
-0.413621, 1.607859, -0.1902188, 0.04313726, 1, 0, 1,
-0.402292, 1.470212, -0.2378416, 0.03921569, 1, 0, 1,
-0.4022647, -2.53103, -2.310702, 0.03137255, 1, 0, 1,
-0.3999978, -0.7325867, -3.107829, 0.02745098, 1, 0, 1,
-0.3964319, 0.2938953, 0.01849253, 0.01960784, 1, 0, 1,
-0.3904002, -0.9158979, -3.17813, 0.01568628, 1, 0, 1,
-0.389691, -0.4297205, -2.217329, 0.007843138, 1, 0, 1,
-0.3885464, 1.978649, 1.480863, 0.003921569, 1, 0, 1,
-0.387319, -0.4301148, -2.579621, 0, 1, 0.003921569, 1,
-0.3829703, 0.4224804, 0.2709042, 0, 1, 0.01176471, 1,
-0.3816278, -0.4464086, -0.8078268, 0, 1, 0.01568628, 1,
-0.3797729, -0.7764152, -1.336905, 0, 1, 0.02352941, 1,
-0.3793374, 1.043686, -0.3785717, 0, 1, 0.02745098, 1,
-0.3675185, 1.500899, 1.401374, 0, 1, 0.03529412, 1,
-0.367415, 0.9489865, -2.405019, 0, 1, 0.03921569, 1,
-0.3643062, -0.2697098, -2.872124, 0, 1, 0.04705882, 1,
-0.3615628, 1.113134, 0.08748407, 0, 1, 0.05098039, 1,
-0.3601363, -0.7918931, -2.779593, 0, 1, 0.05882353, 1,
-0.3589695, -0.2725511, -1.996381, 0, 1, 0.0627451, 1,
-0.3558476, -1.008825, -2.533222, 0, 1, 0.07058824, 1,
-0.3533986, -1.423704, -4.412633, 0, 1, 0.07450981, 1,
-0.3466347, 0.2257888, -2.115477, 0, 1, 0.08235294, 1,
-0.3463577, -0.3250241, -1.82318, 0, 1, 0.08627451, 1,
-0.3455525, -1.460065, -2.075888, 0, 1, 0.09411765, 1,
-0.3437099, -0.1667085, -2.86472, 0, 1, 0.1019608, 1,
-0.3419727, 0.8903256, -1.280742, 0, 1, 0.1058824, 1,
-0.3416106, 0.6013548, 0.1187942, 0, 1, 0.1137255, 1,
-0.3388025, -0.8069121, -3.987522, 0, 1, 0.1176471, 1,
-0.3356352, -1.667637, -3.351932, 0, 1, 0.1254902, 1,
-0.333049, 0.8590589, 1.562581, 0, 1, 0.1294118, 1,
-0.3289301, 1.325407, -1.736088, 0, 1, 0.1372549, 1,
-0.3265422, 0.4609475, -1.530257, 0, 1, 0.1411765, 1,
-0.3218253, -0.09985533, -0.2554898, 0, 1, 0.1490196, 1,
-0.3180881, -0.3124308, -1.017785, 0, 1, 0.1529412, 1,
-0.317833, 0.1887369, 1.077676, 0, 1, 0.1607843, 1,
-0.3174293, -1.537473, -3.034187, 0, 1, 0.1647059, 1,
-0.3090573, 1.381726, 0.5643675, 0, 1, 0.172549, 1,
-0.3084331, 0.3942623, -0.3775202, 0, 1, 0.1764706, 1,
-0.3048326, 1.120571, -1.244765, 0, 1, 0.1843137, 1,
-0.3017254, 0.9618159, -2.489969, 0, 1, 0.1882353, 1,
-0.3001361, -0.781942, -3.552852, 0, 1, 0.1960784, 1,
-0.2996864, -0.08571134, -1.453648, 0, 1, 0.2039216, 1,
-0.2918887, -0.1143857, -1.385572, 0, 1, 0.2078431, 1,
-0.2889203, 0.3100557, -1.030516, 0, 1, 0.2156863, 1,
-0.2881038, 1.174685, -1.270279, 0, 1, 0.2196078, 1,
-0.2799277, 0.277958, -0.2965668, 0, 1, 0.227451, 1,
-0.2783315, 1.940617, -0.1857231, 0, 1, 0.2313726, 1,
-0.2763156, -0.6214554, -1.930617, 0, 1, 0.2392157, 1,
-0.2754198, 0.6034395, 0.2151919, 0, 1, 0.2431373, 1,
-0.270865, 0.2873987, -0.6635281, 0, 1, 0.2509804, 1,
-0.2705692, 0.1716885, -0.7351508, 0, 1, 0.254902, 1,
-0.269738, 0.5334342, 0.0914505, 0, 1, 0.2627451, 1,
-0.2684132, -0.9778629, -3.441362, 0, 1, 0.2666667, 1,
-0.2549565, 1.173249, -0.7839566, 0, 1, 0.2745098, 1,
-0.2532196, 0.8674195, -1.274252, 0, 1, 0.2784314, 1,
-0.2491663, 0.2030375, -0.7186347, 0, 1, 0.2862745, 1,
-0.2491319, 1.676756, -1.846091, 0, 1, 0.2901961, 1,
-0.2484841, -0.9325225, -3.838686, 0, 1, 0.2980392, 1,
-0.2445228, 0.2251329, -2.972835, 0, 1, 0.3058824, 1,
-0.2372998, -0.1906572, -2.684892, 0, 1, 0.3098039, 1,
-0.2360924, 0.7271416, -1.034761, 0, 1, 0.3176471, 1,
-0.2338945, 1.549633, 1.280334, 0, 1, 0.3215686, 1,
-0.2330733, 1.708458, 1.170291, 0, 1, 0.3294118, 1,
-0.2305385, -1.443811, -3.51075, 0, 1, 0.3333333, 1,
-0.2304924, 1.382799, -0.5902091, 0, 1, 0.3411765, 1,
-0.2295096, 0.3434107, 0.8702074, 0, 1, 0.345098, 1,
-0.229276, 0.2960973, 0.331742, 0, 1, 0.3529412, 1,
-0.227106, -0.5720453, -4.131896, 0, 1, 0.3568628, 1,
-0.2186593, 0.1822367, -1.65051, 0, 1, 0.3647059, 1,
-0.218015, 1.059274, 1.262933, 0, 1, 0.3686275, 1,
-0.2159214, 0.9595913, -0.2165765, 0, 1, 0.3764706, 1,
-0.2144969, 1.233808, -1.475148, 0, 1, 0.3803922, 1,
-0.2093511, 1.448919, 0.302067, 0, 1, 0.3882353, 1,
-0.2062747, -0.9885033, -4.08158, 0, 1, 0.3921569, 1,
-0.2013251, -0.7891062, -1.469047, 0, 1, 0.4, 1,
-0.2010753, -2.19032, -3.815287, 0, 1, 0.4078431, 1,
-0.1968002, -0.7211417, -4.087084, 0, 1, 0.4117647, 1,
-0.1955422, 0.3881615, 1.612329, 0, 1, 0.4196078, 1,
-0.1945972, -0.6572393, -2.30877, 0, 1, 0.4235294, 1,
-0.1896531, 0.9246351, -0.9674793, 0, 1, 0.4313726, 1,
-0.1869185, 1.062641, -1.134976, 0, 1, 0.4352941, 1,
-0.1837183, 0.8038837, -0.563455, 0, 1, 0.4431373, 1,
-0.1833135, 0.6186342, -2.19719, 0, 1, 0.4470588, 1,
-0.1807537, -0.069523, -3.776492, 0, 1, 0.454902, 1,
-0.1796425, -0.0616214, -1.207812, 0, 1, 0.4588235, 1,
-0.1776244, 0.3883452, -2.056717, 0, 1, 0.4666667, 1,
-0.1776184, -1.407754, -2.585789, 0, 1, 0.4705882, 1,
-0.1725482, 1.651918, 0.2873269, 0, 1, 0.4784314, 1,
-0.1712787, 0.3985831, -1.333382, 0, 1, 0.4823529, 1,
-0.1665757, 1.126629, -0.2170332, 0, 1, 0.4901961, 1,
-0.1657441, 0.6011034, -0.2204841, 0, 1, 0.4941176, 1,
-0.1655463, -0.803427, -3.705404, 0, 1, 0.5019608, 1,
-0.164608, -0.8492813, -1.914284, 0, 1, 0.509804, 1,
-0.1635583, -0.2721771, -2.264906, 0, 1, 0.5137255, 1,
-0.1558886, -0.6800262, -5.132086, 0, 1, 0.5215687, 1,
-0.1545936, 1.187568, -0.9677787, 0, 1, 0.5254902, 1,
-0.153494, -0.613344, -3.241751, 0, 1, 0.5333334, 1,
-0.1529267, 1.486316, 2.264455, 0, 1, 0.5372549, 1,
-0.1494636, 1.424208, 0.1888017, 0, 1, 0.5450981, 1,
-0.1487183, 0.8226586, -0.9673869, 0, 1, 0.5490196, 1,
-0.1449854, -1.524325, -4.096818, 0, 1, 0.5568628, 1,
-0.1422426, -0.627009, -4.797047, 0, 1, 0.5607843, 1,
-0.1397604, 1.333576, -0.1140266, 0, 1, 0.5686275, 1,
-0.1362588, 0.2124949, -1.019004, 0, 1, 0.572549, 1,
-0.1360202, -1.658351, -3.483468, 0, 1, 0.5803922, 1,
-0.1257708, -0.8884184, -2.626124, 0, 1, 0.5843138, 1,
-0.1232734, -1.542078, -4.346188, 0, 1, 0.5921569, 1,
-0.1227371, -0.5429169, -1.282895, 0, 1, 0.5960785, 1,
-0.1157011, 0.5704815, 0.3490487, 0, 1, 0.6039216, 1,
-0.1129728, 0.2882479, 0.1479484, 0, 1, 0.6117647, 1,
-0.1097396, -0.04105012, -2.375881, 0, 1, 0.6156863, 1,
-0.1088463, 2.790937, 0.2141841, 0, 1, 0.6235294, 1,
-0.1081816, 1.170803, 1.233272, 0, 1, 0.627451, 1,
-0.1074212, -1.267384, -3.251419, 0, 1, 0.6352941, 1,
-0.102781, -0.2262502, -4.147983, 0, 1, 0.6392157, 1,
-0.09981141, -2.382185, -4.737794, 0, 1, 0.6470588, 1,
-0.09816449, -0.3598403, -2.47503, 0, 1, 0.6509804, 1,
-0.09815777, -0.742604, -2.612396, 0, 1, 0.6588235, 1,
-0.09662683, -0.5653995, -4.42277, 0, 1, 0.6627451, 1,
-0.096391, 0.03829536, -1.019681, 0, 1, 0.6705883, 1,
-0.09358755, 0.1692944, 0.7150692, 0, 1, 0.6745098, 1,
-0.08860923, 0.05046609, -1.875983, 0, 1, 0.682353, 1,
-0.08653901, 1.461318, 0.08027747, 0, 1, 0.6862745, 1,
-0.08540785, 0.429817, -1.223387, 0, 1, 0.6941177, 1,
-0.08259454, -0.780171, -1.225394, 0, 1, 0.7019608, 1,
-0.08133996, -0.8162159, -2.532543, 0, 1, 0.7058824, 1,
-0.08008298, -1.338836, -4.071696, 0, 1, 0.7137255, 1,
-0.07903434, -0.4331531, -2.302748, 0, 1, 0.7176471, 1,
-0.07857063, -0.5786505, -1.808958, 0, 1, 0.7254902, 1,
-0.07782567, -1.239897, -3.116353, 0, 1, 0.7294118, 1,
-0.07606865, -0.04224254, -3.034099, 0, 1, 0.7372549, 1,
-0.07585228, 0.2810826, -0.651103, 0, 1, 0.7411765, 1,
-0.07383901, 0.9862898, -1.22266, 0, 1, 0.7490196, 1,
-0.07029099, -0.2508026, -2.487712, 0, 1, 0.7529412, 1,
-0.07010404, -0.21945, -2.753835, 0, 1, 0.7607843, 1,
-0.06296798, 0.2220363, 0.1730148, 0, 1, 0.7647059, 1,
-0.06079081, 0.3153066, -1.647051, 0, 1, 0.772549, 1,
-0.06030246, 0.5278516, -0.003352714, 0, 1, 0.7764706, 1,
-0.05983644, 1.190996, -0.5315565, 0, 1, 0.7843137, 1,
-0.0563331, -1.413332, -4.275383, 0, 1, 0.7882353, 1,
-0.05498274, -0.1501918, -2.555028, 0, 1, 0.7960784, 1,
-0.05397953, 1.004699, -0.8256267, 0, 1, 0.8039216, 1,
-0.04951311, -0.4380072, -3.765388, 0, 1, 0.8078431, 1,
-0.04824147, 0.5643634, -0.9516124, 0, 1, 0.8156863, 1,
-0.04668951, -0.4922522, -0.5024954, 0, 1, 0.8196079, 1,
-0.04322264, -0.9799086, -4.203474, 0, 1, 0.827451, 1,
-0.04101126, -1.52757, -3.436201, 0, 1, 0.8313726, 1,
-0.04071096, 1.711689, 1.183395, 0, 1, 0.8392157, 1,
-0.0395328, 0.8423175, -0.330213, 0, 1, 0.8431373, 1,
-0.03215795, 0.3482573, -0.1468736, 0, 1, 0.8509804, 1,
-0.03210277, 0.7873672, 2.136073, 0, 1, 0.854902, 1,
-0.0318539, 1.057041, -0.4162528, 0, 1, 0.8627451, 1,
-0.02980398, -0.1867635, -3.606057, 0, 1, 0.8666667, 1,
-0.02562007, -0.5502955, -5.02027, 0, 1, 0.8745098, 1,
-0.02312649, -0.9605986, -4.820206, 0, 1, 0.8784314, 1,
-0.01829178, -0.376106, -1.974918, 0, 1, 0.8862745, 1,
-0.01824731, 0.1408679, -1.981082, 0, 1, 0.8901961, 1,
-0.01634905, 0.02099632, -0.7048141, 0, 1, 0.8980392, 1,
-0.01354205, -0.3554115, -4.589565, 0, 1, 0.9058824, 1,
-0.01351304, 1.997398, 0.4021874, 0, 1, 0.9098039, 1,
0.0003078, -1.136696, 3.040591, 0, 1, 0.9176471, 1,
0.007086939, -0.03775264, 2.388594, 0, 1, 0.9215686, 1,
0.008019368, 0.2170513, -2.063896, 0, 1, 0.9294118, 1,
0.0134386, -0.288371, 3.864809, 0, 1, 0.9333333, 1,
0.01525336, 0.08441224, 0.4263147, 0, 1, 0.9411765, 1,
0.01585939, -1.47719, 3.576597, 0, 1, 0.945098, 1,
0.01616876, -0.9813187, 3.457036, 0, 1, 0.9529412, 1,
0.02213537, 2.693387, 1.052348, 0, 1, 0.9568627, 1,
0.02457203, 1.115989, -0.6271917, 0, 1, 0.9647059, 1,
0.02469648, -0.5497949, 2.071174, 0, 1, 0.9686275, 1,
0.03207228, -0.06612372, 3.250586, 0, 1, 0.9764706, 1,
0.03751979, 0.8988832, -0.5157316, 0, 1, 0.9803922, 1,
0.0379264, 0.2825615, 1.374478, 0, 1, 0.9882353, 1,
0.04862375, -0.3079941, 3.458119, 0, 1, 0.9921569, 1,
0.04904361, 0.6820428, -0.2265538, 0, 1, 1, 1,
0.05107323, -0.04136663, -0.5140303, 0, 0.9921569, 1, 1,
0.05519665, -0.5259601, 3.642694, 0, 0.9882353, 1, 1,
0.05871475, -0.7848276, 2.71972, 0, 0.9803922, 1, 1,
0.05960581, -0.8444772, 2.601087, 0, 0.9764706, 1, 1,
0.06220532, 0.1960497, 1.376717, 0, 0.9686275, 1, 1,
0.06228997, -0.9262727, 3.695553, 0, 0.9647059, 1, 1,
0.06606162, -0.3098912, 3.604052, 0, 0.9568627, 1, 1,
0.06976303, 0.00362215, 1.313594, 0, 0.9529412, 1, 1,
0.07029668, 0.18058, 1.111753, 0, 0.945098, 1, 1,
0.07308626, 0.7925551, 0.4090253, 0, 0.9411765, 1, 1,
0.0734276, 1.267689, -1.182981, 0, 0.9333333, 1, 1,
0.07446191, 0.8227767, -0.6689919, 0, 0.9294118, 1, 1,
0.07579976, 0.9498394, 2.002324, 0, 0.9215686, 1, 1,
0.07734686, -0.0235973, 0.8382502, 0, 0.9176471, 1, 1,
0.07762981, -1.636118, 2.945338, 0, 0.9098039, 1, 1,
0.08161046, -0.5782446, 2.830798, 0, 0.9058824, 1, 1,
0.08183362, -0.3425465, 3.025665, 0, 0.8980392, 1, 1,
0.08389022, 0.487449, -0.611386, 0, 0.8901961, 1, 1,
0.08528981, -0.7029636, 1.537006, 0, 0.8862745, 1, 1,
0.08586948, 0.07555699, 0.2327964, 0, 0.8784314, 1, 1,
0.08899524, 0.4526397, -1.485224, 0, 0.8745098, 1, 1,
0.08923867, 1.692786, -0.387014, 0, 0.8666667, 1, 1,
0.09431408, 1.03373, 0.153641, 0, 0.8627451, 1, 1,
0.0991244, -0.4052927, 1.938286, 0, 0.854902, 1, 1,
0.09948348, -1.064345, 2.806207, 0, 0.8509804, 1, 1,
0.1002095, 0.7945666, -1.135351, 0, 0.8431373, 1, 1,
0.1052571, 1.170834, 1.229899, 0, 0.8392157, 1, 1,
0.1135485, 0.06286158, 0.2058135, 0, 0.8313726, 1, 1,
0.1148965, -1.787118, 4.033002, 0, 0.827451, 1, 1,
0.118907, 1.055984, 0.5198494, 0, 0.8196079, 1, 1,
0.1190428, -1.164816, 3.063247, 0, 0.8156863, 1, 1,
0.1212835, -0.8991508, 4.253953, 0, 0.8078431, 1, 1,
0.1215752, 0.227767, 0.7689158, 0, 0.8039216, 1, 1,
0.124899, 1.477292, -0.6769609, 0, 0.7960784, 1, 1,
0.129289, -0.8302083, 2.607522, 0, 0.7882353, 1, 1,
0.1330254, 0.06686297, 0.4588217, 0, 0.7843137, 1, 1,
0.1334771, 0.4827155, 0.155067, 0, 0.7764706, 1, 1,
0.1335919, 0.1529929, 0.4285063, 0, 0.772549, 1, 1,
0.138213, -0.5536543, 1.462194, 0, 0.7647059, 1, 1,
0.146533, -1.603459, 4.185314, 0, 0.7607843, 1, 1,
0.1472213, 0.8884985, -0.7005773, 0, 0.7529412, 1, 1,
0.1489291, 1.04666, -1.136751, 0, 0.7490196, 1, 1,
0.1518002, 0.09367916, -0.6691923, 0, 0.7411765, 1, 1,
0.1526601, -1.796552, 3.219529, 0, 0.7372549, 1, 1,
0.1527391, 0.7769526, 1.465056, 0, 0.7294118, 1, 1,
0.1553027, -1.071173, 3.26, 0, 0.7254902, 1, 1,
0.1580271, -0.3781161, 2.525566, 0, 0.7176471, 1, 1,
0.15922, -1.339153, 4.055143, 0, 0.7137255, 1, 1,
0.1619977, 1.755431, 0.778389, 0, 0.7058824, 1, 1,
0.1624092, -1.124904, 3.134411, 0, 0.6980392, 1, 1,
0.1644372, 0.6217581, -0.09704753, 0, 0.6941177, 1, 1,
0.1663296, 0.2476074, 0.8926739, 0, 0.6862745, 1, 1,
0.1693371, 1.689058, 0.2556167, 0, 0.682353, 1, 1,
0.1723616, 0.9892946, -0.4229538, 0, 0.6745098, 1, 1,
0.1758866, -0.2189403, 3.897741, 0, 0.6705883, 1, 1,
0.1760024, 2.735907, 1.491367, 0, 0.6627451, 1, 1,
0.1771206, -0.8717771, 2.442397, 0, 0.6588235, 1, 1,
0.1856978, 0.4919702, 0.9998059, 0, 0.6509804, 1, 1,
0.1872645, -2.026954, 2.918929, 0, 0.6470588, 1, 1,
0.1907775, -0.8724568, 4.836679, 0, 0.6392157, 1, 1,
0.19106, -1.614969, 4.029421, 0, 0.6352941, 1, 1,
0.1922051, 0.09865064, 2.510319, 0, 0.627451, 1, 1,
0.1928404, -0.181817, 2.196234, 0, 0.6235294, 1, 1,
0.1952762, -0.9765593, 2.373339, 0, 0.6156863, 1, 1,
0.1957017, -1.273385, 5.992225, 0, 0.6117647, 1, 1,
0.1960127, 3.008166, -0.6586924, 0, 0.6039216, 1, 1,
0.1966467, -0.3710251, 3.006835, 0, 0.5960785, 1, 1,
0.1977606, -0.9294776, 4.825135, 0, 0.5921569, 1, 1,
0.1979277, -1.738684, 3.909438, 0, 0.5843138, 1, 1,
0.1986392, -0.2866137, 3.044131, 0, 0.5803922, 1, 1,
0.1990553, -1.171715, 4.460989, 0, 0.572549, 1, 1,
0.1992438, 0.8366712, -0.5653909, 0, 0.5686275, 1, 1,
0.2007095, -2.729582, 3.402195, 0, 0.5607843, 1, 1,
0.2040567, 0.7912154, -1.434762, 0, 0.5568628, 1, 1,
0.2092644, -1.56635, 3.584936, 0, 0.5490196, 1, 1,
0.2101106, -0.451278, 1.88104, 0, 0.5450981, 1, 1,
0.2135424, 1.356435, -0.2433233, 0, 0.5372549, 1, 1,
0.214286, 1.108148, 0.5984075, 0, 0.5333334, 1, 1,
0.2153364, 2.274189, 0.7518367, 0, 0.5254902, 1, 1,
0.2156205, 1.418351, -1.489222, 0, 0.5215687, 1, 1,
0.2172552, 0.05418574, 3.212455, 0, 0.5137255, 1, 1,
0.2187426, -0.4356686, 3.019481, 0, 0.509804, 1, 1,
0.2204766, -0.07677905, 1.780576, 0, 0.5019608, 1, 1,
0.2207083, 0.8575016, 0.6411689, 0, 0.4941176, 1, 1,
0.2212307, -0.6776082, 3.147887, 0, 0.4901961, 1, 1,
0.2268545, -0.5428906, 4.832829, 0, 0.4823529, 1, 1,
0.2279472, 0.121674, 1.287787, 0, 0.4784314, 1, 1,
0.2309694, 1.217956, 0.5079335, 0, 0.4705882, 1, 1,
0.2315388, 0.2948434, 1.7169, 0, 0.4666667, 1, 1,
0.2328905, -1.371337, 1.336839, 0, 0.4588235, 1, 1,
0.2330202, 0.7722814, -1.046148, 0, 0.454902, 1, 1,
0.2339397, -0.3685978, 2.620149, 0, 0.4470588, 1, 1,
0.2352316, -0.1044418, 2.09346, 0, 0.4431373, 1, 1,
0.2370179, 1.27501, 1.296125, 0, 0.4352941, 1, 1,
0.2394806, 1.421668, 1.039244, 0, 0.4313726, 1, 1,
0.2413663, 0.06331221, 1.277854, 0, 0.4235294, 1, 1,
0.2445483, 0.8210462, 1.016781, 0, 0.4196078, 1, 1,
0.2457618, -0.7196388, 3.354457, 0, 0.4117647, 1, 1,
0.2470402, -0.6023818, 2.475191, 0, 0.4078431, 1, 1,
0.2474327, -0.5492828, 0.7479225, 0, 0.4, 1, 1,
0.248887, 0.2407949, 1.037066, 0, 0.3921569, 1, 1,
0.2499219, 1.537604, -0.784431, 0, 0.3882353, 1, 1,
0.2554794, 0.712321, 0.0997813, 0, 0.3803922, 1, 1,
0.2562584, -0.6488331, 1.768422, 0, 0.3764706, 1, 1,
0.2565291, 0.826394, 0.3538001, 0, 0.3686275, 1, 1,
0.2584528, -1.347979, 2.250395, 0, 0.3647059, 1, 1,
0.2612263, -0.2231178, 0.4330985, 0, 0.3568628, 1, 1,
0.2633182, -0.29296, 1.475257, 0, 0.3529412, 1, 1,
0.2642258, 0.7097624, -1.537097, 0, 0.345098, 1, 1,
0.2676895, 0.00245634, 2.64827, 0, 0.3411765, 1, 1,
0.2689706, -0.3908208, 2.691901, 0, 0.3333333, 1, 1,
0.2700304, -0.4258335, 2.37272, 0, 0.3294118, 1, 1,
0.270804, -1.266498, 2.154663, 0, 0.3215686, 1, 1,
0.2750411, 0.2070064, 1.025104, 0, 0.3176471, 1, 1,
0.2753162, 0.7564746, 1.773163, 0, 0.3098039, 1, 1,
0.2784999, 2.165962, 0.8755689, 0, 0.3058824, 1, 1,
0.2786842, -0.9455528, 3.486435, 0, 0.2980392, 1, 1,
0.2796295, 1.821753, -1.20226, 0, 0.2901961, 1, 1,
0.2802044, 0.3300934, 0.9377107, 0, 0.2862745, 1, 1,
0.281949, -1.481151, 2.637056, 0, 0.2784314, 1, 1,
0.2883739, 0.739386, 0.08329885, 0, 0.2745098, 1, 1,
0.2927051, 0.5978289, 0.3986192, 0, 0.2666667, 1, 1,
0.2976112, -1.048151, 3.778928, 0, 0.2627451, 1, 1,
0.3004704, 2.01055, 0.7302004, 0, 0.254902, 1, 1,
0.3033464, -0.2488126, 2.781555, 0, 0.2509804, 1, 1,
0.3036802, -0.7207103, 2.892488, 0, 0.2431373, 1, 1,
0.312876, 2.25071, 1.013142, 0, 0.2392157, 1, 1,
0.3151878, -0.7230688, 2.075255, 0, 0.2313726, 1, 1,
0.3151918, -1.38127, 2.610826, 0, 0.227451, 1, 1,
0.3158806, 1.282301, 0.563524, 0, 0.2196078, 1, 1,
0.3258452, 0.4318542, 1.608863, 0, 0.2156863, 1, 1,
0.3307532, 0.06243171, 3.089239, 0, 0.2078431, 1, 1,
0.3311292, -0.6457171, 2.696589, 0, 0.2039216, 1, 1,
0.3327506, -1.770429, 3.360476, 0, 0.1960784, 1, 1,
0.3331999, 2.143854, 1.556288, 0, 0.1882353, 1, 1,
0.3349279, 0.4671321, 0.02479147, 0, 0.1843137, 1, 1,
0.3392594, 1.363457, 1.235491, 0, 0.1764706, 1, 1,
0.3403175, 0.3946061, 1.086442, 0, 0.172549, 1, 1,
0.3406448, 0.4515969, 2.015082, 0, 0.1647059, 1, 1,
0.3420646, 0.03614858, 3.656369, 0, 0.1607843, 1, 1,
0.3451412, 0.7049506, -0.2038081, 0, 0.1529412, 1, 1,
0.3452467, -2.062366, 1.935617, 0, 0.1490196, 1, 1,
0.3473715, -0.08370704, 1.331432, 0, 0.1411765, 1, 1,
0.3482962, 0.1789107, 2.295495, 0, 0.1372549, 1, 1,
0.3483436, -1.611897, 3.285042, 0, 0.1294118, 1, 1,
0.3497114, 0.003534815, -2.944907, 0, 0.1254902, 1, 1,
0.3501087, -0.04705191, 1.355798, 0, 0.1176471, 1, 1,
0.3553155, 1.286899, -1.259942, 0, 0.1137255, 1, 1,
0.3595487, -0.7120057, 1.659677, 0, 0.1058824, 1, 1,
0.3649724, 2.155743, 0.604917, 0, 0.09803922, 1, 1,
0.3652075, 0.5450892, 2.39705, 0, 0.09411765, 1, 1,
0.3662388, 0.9084721, 0.9130628, 0, 0.08627451, 1, 1,
0.3698131, -1.555142, 3.636416, 0, 0.08235294, 1, 1,
0.3722172, -0.4861074, 3.069833, 0, 0.07450981, 1, 1,
0.3738524, -0.7024161, 1.485744, 0, 0.07058824, 1, 1,
0.3760242, -0.5986933, 3.164885, 0, 0.0627451, 1, 1,
0.380539, 0.4419059, 2.0698, 0, 0.05882353, 1, 1,
0.3833589, -0.5367841, 3.100199, 0, 0.05098039, 1, 1,
0.3855874, 0.4247524, 0.1024103, 0, 0.04705882, 1, 1,
0.3897582, 0.795092, 0.788137, 0, 0.03921569, 1, 1,
0.3950908, 0.4625628, -1.332865, 0, 0.03529412, 1, 1,
0.4010728, 0.9761428, 1.025579, 0, 0.02745098, 1, 1,
0.4011923, -0.9542504, 2.340587, 0, 0.02352941, 1, 1,
0.4038526, -0.008444439, 1.079716, 0, 0.01568628, 1, 1,
0.4068345, 0.877569, -0.4469784, 0, 0.01176471, 1, 1,
0.4106098, 0.4238661, 3.155578, 0, 0.003921569, 1, 1,
0.4132568, -0.1314446, 3.174284, 0.003921569, 0, 1, 1,
0.414359, 0.3860051, 2.875892, 0.007843138, 0, 1, 1,
0.4154071, 0.38208, 0.6063668, 0.01568628, 0, 1, 1,
0.4172292, -0.9517437, 1.651107, 0.01960784, 0, 1, 1,
0.418968, 0.9204597, 0.3105901, 0.02745098, 0, 1, 1,
0.4201643, -0.05490352, 2.202241, 0.03137255, 0, 1, 1,
0.420182, -1.614486, 1.011591, 0.03921569, 0, 1, 1,
0.4214978, 0.9131519, -0.4551154, 0.04313726, 0, 1, 1,
0.4217481, 0.7333897, 0.9573681, 0.05098039, 0, 1, 1,
0.4248061, 0.1298852, 1.674676, 0.05490196, 0, 1, 1,
0.4262614, -1.477109, 2.300608, 0.0627451, 0, 1, 1,
0.4313083, -1.872828, 4.424767, 0.06666667, 0, 1, 1,
0.4332735, 0.455119, 3.145792, 0.07450981, 0, 1, 1,
0.4344155, -0.6203519, 2.738729, 0.07843138, 0, 1, 1,
0.4392853, 0.5201903, 0.8461096, 0.08627451, 0, 1, 1,
0.440968, 2.078219, -0.05589863, 0.09019608, 0, 1, 1,
0.444925, -1.242354, 2.131891, 0.09803922, 0, 1, 1,
0.4482759, 0.4357317, 0.5484381, 0.1058824, 0, 1, 1,
0.4573162, 1.312982, 0.7326096, 0.1098039, 0, 1, 1,
0.4578474, 0.2814229, 2.721944, 0.1176471, 0, 1, 1,
0.4591495, -0.2569521, -0.06134342, 0.1215686, 0, 1, 1,
0.4600302, -1.842753, 3.097636, 0.1294118, 0, 1, 1,
0.4669455, -0.5342733, 3.028039, 0.1333333, 0, 1, 1,
0.4737123, -0.1699015, 2.248807, 0.1411765, 0, 1, 1,
0.4757464, -2.048593, 4.23672, 0.145098, 0, 1, 1,
0.477431, 0.3340808, -0.7445208, 0.1529412, 0, 1, 1,
0.4804665, 0.1905678, 0.3295958, 0.1568628, 0, 1, 1,
0.4819831, -0.9599015, 2.187175, 0.1647059, 0, 1, 1,
0.4909374, -1.628363, 3.040398, 0.1686275, 0, 1, 1,
0.4920875, -1.164598, 4.318233, 0.1764706, 0, 1, 1,
0.4989805, -0.7781208, 3.105967, 0.1803922, 0, 1, 1,
0.4999003, -0.9644045, 2.555585, 0.1882353, 0, 1, 1,
0.5005033, 1.04725, -1.609831, 0.1921569, 0, 1, 1,
0.500757, 0.004748294, 1.191319, 0.2, 0, 1, 1,
0.5046323, 0.6271247, -0.208846, 0.2078431, 0, 1, 1,
0.5099759, -0.1701751, 0.7643185, 0.2117647, 0, 1, 1,
0.5100622, 0.871951, 0.6874084, 0.2196078, 0, 1, 1,
0.5122539, 0.7058393, 1.267431, 0.2235294, 0, 1, 1,
0.5158386, 0.7537897, 2.664794, 0.2313726, 0, 1, 1,
0.5168713, -0.7086618, 2.910874, 0.2352941, 0, 1, 1,
0.5173157, 0.5398169, 2.816262, 0.2431373, 0, 1, 1,
0.5213147, -0.5805733, 2.426341, 0.2470588, 0, 1, 1,
0.5255257, -0.8580555, 2.872574, 0.254902, 0, 1, 1,
0.529434, -0.2218201, 1.059033, 0.2588235, 0, 1, 1,
0.5338756, 0.08796963, 1.719465, 0.2666667, 0, 1, 1,
0.5357236, -1.162513, 1.844159, 0.2705882, 0, 1, 1,
0.5382631, 0.4444396, 1.250131, 0.2784314, 0, 1, 1,
0.539211, 0.4741405, 0.355146, 0.282353, 0, 1, 1,
0.5420462, -0.4578462, 1.613179, 0.2901961, 0, 1, 1,
0.5460837, 0.3743083, 0.7808834, 0.2941177, 0, 1, 1,
0.5542404, 0.152045, 0.7454201, 0.3019608, 0, 1, 1,
0.5542594, -0.4733996, 2.952104, 0.3098039, 0, 1, 1,
0.5556856, 0.9063341, -0.2251507, 0.3137255, 0, 1, 1,
0.5582766, -1.126123, 2.771244, 0.3215686, 0, 1, 1,
0.5585924, -0.7933044, 3.288383, 0.3254902, 0, 1, 1,
0.5620168, 0.2005685, 1.748412, 0.3333333, 0, 1, 1,
0.5638931, 0.540585, -0.7019925, 0.3372549, 0, 1, 1,
0.5687077, 0.3870698, 0.3167238, 0.345098, 0, 1, 1,
0.5719954, -0.7170115, 1.870957, 0.3490196, 0, 1, 1,
0.5734842, 0.3840746, 1.090717, 0.3568628, 0, 1, 1,
0.5757065, 1.165169, -0.7926231, 0.3607843, 0, 1, 1,
0.581504, 0.6157066, 1.256814, 0.3686275, 0, 1, 1,
0.5827411, -0.6669434, 2.65402, 0.372549, 0, 1, 1,
0.5838158, 0.7329962, 2.319108, 0.3803922, 0, 1, 1,
0.5936478, 0.8779936, 0.004193108, 0.3843137, 0, 1, 1,
0.5945723, -1.296955, 0.9786582, 0.3921569, 0, 1, 1,
0.595128, -0.1840967, 2.398629, 0.3960784, 0, 1, 1,
0.6012201, 0.5503839, -0.7653641, 0.4039216, 0, 1, 1,
0.6032462, 1.077152, -0.2709481, 0.4117647, 0, 1, 1,
0.6071976, -1.055932, 1.849621, 0.4156863, 0, 1, 1,
0.6091649, 0.4503492, -0.2427716, 0.4235294, 0, 1, 1,
0.616892, -0.6014042, 1.64652, 0.427451, 0, 1, 1,
0.6216363, -1.260681, 1.465419, 0.4352941, 0, 1, 1,
0.6236255, 0.4070964, 0.5084236, 0.4392157, 0, 1, 1,
0.6236842, -1.842722, 1.835354, 0.4470588, 0, 1, 1,
0.6248565, -0.2483008, 3.136856, 0.4509804, 0, 1, 1,
0.627103, -1.396937, 2.278008, 0.4588235, 0, 1, 1,
0.6302668, -1.110851, 3.643978, 0.4627451, 0, 1, 1,
0.6347939, -0.2090996, 3.555828, 0.4705882, 0, 1, 1,
0.6407948, -0.4656922, 2.391659, 0.4745098, 0, 1, 1,
0.6457011, 1.707355, 0.9779685, 0.4823529, 0, 1, 1,
0.6518757, 1.8768, -0.3073407, 0.4862745, 0, 1, 1,
0.6599262, -0.5949596, 2.668016, 0.4941176, 0, 1, 1,
0.6617929, 0.1087812, 0.9929363, 0.5019608, 0, 1, 1,
0.6661761, 0.08456855, -0.5539286, 0.5058824, 0, 1, 1,
0.6669388, -0.5797698, 2.380661, 0.5137255, 0, 1, 1,
0.6681181, -1.128431, 4.592795, 0.5176471, 0, 1, 1,
0.6700161, 0.2309739, -0.2393613, 0.5254902, 0, 1, 1,
0.6728862, 0.1538293, 0.2888421, 0.5294118, 0, 1, 1,
0.6730187, 0.112872, 0.5704077, 0.5372549, 0, 1, 1,
0.6732087, -1.250822, 2.283843, 0.5411765, 0, 1, 1,
0.676064, 1.57571, 1.12815, 0.5490196, 0, 1, 1,
0.677572, 0.1514612, 1.524903, 0.5529412, 0, 1, 1,
0.6812425, 0.9441007, 1.013628, 0.5607843, 0, 1, 1,
0.6828431, 1.035553, -1.476381, 0.5647059, 0, 1, 1,
0.6844851, -0.6207728, 2.916813, 0.572549, 0, 1, 1,
0.6900085, 1.03305, -0.7709018, 0.5764706, 0, 1, 1,
0.6932904, 0.5220201, 0.9303429, 0.5843138, 0, 1, 1,
0.6946142, 1.226861, -1.467303, 0.5882353, 0, 1, 1,
0.6946478, 1.449119, -0.7894003, 0.5960785, 0, 1, 1,
0.695848, -0.00456553, 1.628715, 0.6039216, 0, 1, 1,
0.6971589, -0.2415743, 2.474302, 0.6078432, 0, 1, 1,
0.6998218, 1.203132, -0.9174997, 0.6156863, 0, 1, 1,
0.7029967, 1.641301, 0.2124301, 0.6196079, 0, 1, 1,
0.7038825, -0.7250919, 3.932012, 0.627451, 0, 1, 1,
0.7079455, 1.242671, 1.155266, 0.6313726, 0, 1, 1,
0.7103359, 1.854965, 1.541005, 0.6392157, 0, 1, 1,
0.710595, 0.3751406, 1.653121, 0.6431373, 0, 1, 1,
0.7176476, 0.2469248, 2.187775, 0.6509804, 0, 1, 1,
0.7178181, 0.1394575, 0.8638985, 0.654902, 0, 1, 1,
0.7192597, 1.176976, 2.090312, 0.6627451, 0, 1, 1,
0.7262542, -0.6609058, 2.632022, 0.6666667, 0, 1, 1,
0.7272928, 0.08999709, 2.993412, 0.6745098, 0, 1, 1,
0.7279037, -0.5741745, 2.13377, 0.6784314, 0, 1, 1,
0.7282857, 1.256934, 0.5408761, 0.6862745, 0, 1, 1,
0.7312336, 0.900367, 0.5094999, 0.6901961, 0, 1, 1,
0.7318115, -2.678167, 1.562584, 0.6980392, 0, 1, 1,
0.7368539, 0.02117216, 2.416125, 0.7058824, 0, 1, 1,
0.7373409, -0.03288888, 2.998559, 0.7098039, 0, 1, 1,
0.7467527, -0.5130842, 2.473351, 0.7176471, 0, 1, 1,
0.7476712, -0.2916923, 1.955872, 0.7215686, 0, 1, 1,
0.765504, -0.145654, 1.204425, 0.7294118, 0, 1, 1,
0.7696413, -1.282013, 2.21735, 0.7333333, 0, 1, 1,
0.7726693, 1.462549, -0.218099, 0.7411765, 0, 1, 1,
0.7734336, -1.547071, 2.286247, 0.7450981, 0, 1, 1,
0.777867, -0.7984432, 1.742305, 0.7529412, 0, 1, 1,
0.7800497, 0.4365356, 0.2736012, 0.7568628, 0, 1, 1,
0.7923997, -0.07309482, 1.467959, 0.7647059, 0, 1, 1,
0.7939175, 0.9246898, 2.322859, 0.7686275, 0, 1, 1,
0.7986672, -0.06749377, -0.03292821, 0.7764706, 0, 1, 1,
0.8005419, -0.7201541, 3.192147, 0.7803922, 0, 1, 1,
0.8099938, -0.7784004, 2.887244, 0.7882353, 0, 1, 1,
0.8129209, -1.818328, 4.322573, 0.7921569, 0, 1, 1,
0.8131342, -0.5379272, 2.51565, 0.8, 0, 1, 1,
0.81594, 0.4935423, 1.475249, 0.8078431, 0, 1, 1,
0.8177675, 0.5534079, -1.392812, 0.8117647, 0, 1, 1,
0.8205843, 0.9439386, 1.585008, 0.8196079, 0, 1, 1,
0.8361048, -0.4993592, 2.588396, 0.8235294, 0, 1, 1,
0.8363535, -0.2529521, 1.36096, 0.8313726, 0, 1, 1,
0.8399467, 0.6352891, 0.9160873, 0.8352941, 0, 1, 1,
0.8496279, -0.7073478, 3.717961, 0.8431373, 0, 1, 1,
0.8583176, 0.8153504, 0.2902222, 0.8470588, 0, 1, 1,
0.8673454, -0.05878431, 1.622254, 0.854902, 0, 1, 1,
0.867947, -0.4218324, 2.128391, 0.8588235, 0, 1, 1,
0.8753079, -0.02953896, 2.600183, 0.8666667, 0, 1, 1,
0.8762401, -0.8242748, 2.454368, 0.8705882, 0, 1, 1,
0.8765951, -1.562782, 2.034711, 0.8784314, 0, 1, 1,
0.8837032, 1.575602, -0.3938008, 0.8823529, 0, 1, 1,
0.892424, 0.2810366, -0.9367436, 0.8901961, 0, 1, 1,
0.8948734, -0.5375465, -0.254727, 0.8941177, 0, 1, 1,
0.89521, -0.732663, 2.424551, 0.9019608, 0, 1, 1,
0.9023932, -0.8037114, 1.461944, 0.9098039, 0, 1, 1,
0.9031852, -0.8133287, 4.904319, 0.9137255, 0, 1, 1,
0.9044679, -0.5183886, 0.6962727, 0.9215686, 0, 1, 1,
0.9046181, 1.505891, 0.1530344, 0.9254902, 0, 1, 1,
0.9046674, 0.8266409, 1.958083, 0.9333333, 0, 1, 1,
0.9051787, 1.564332, 1.132855, 0.9372549, 0, 1, 1,
0.9085509, -1.723972, 2.586368, 0.945098, 0, 1, 1,
0.9087899, -2.159066, 2.050229, 0.9490196, 0, 1, 1,
0.9166873, 1.556473, 0.2724287, 0.9568627, 0, 1, 1,
0.9251584, -1.081444, 3.01153, 0.9607843, 0, 1, 1,
0.928008, 0.7452747, -0.007215485, 0.9686275, 0, 1, 1,
0.9280933, -0.02578819, 2.277468, 0.972549, 0, 1, 1,
0.9398448, 0.007755407, 2.152447, 0.9803922, 0, 1, 1,
0.9466304, 0.7551987, 1.425817, 0.9843137, 0, 1, 1,
0.95185, -1.701358, 2.374451, 0.9921569, 0, 1, 1,
0.9600754, 0.1821055, 1.526468, 0.9960784, 0, 1, 1,
0.9630352, 0.2159878, 1.626331, 1, 0, 0.9960784, 1,
0.9653834, -0.2687055, 1.440616, 1, 0, 0.9882353, 1,
0.9661019, -0.8902819, 1.184732, 1, 0, 0.9843137, 1,
0.9893411, 0.4790128, 0.524408, 1, 0, 0.9764706, 1,
0.9895781, 0.7770725, 1.627611, 1, 0, 0.972549, 1,
0.990223, 0.002448958, 1.360807, 1, 0, 0.9647059, 1,
0.995488, 3.013532, 1.855297, 1, 0, 0.9607843, 1,
0.9966527, 0.8787649, 1.440137, 1, 0, 0.9529412, 1,
1.000953, 0.7582718, -0.177864, 1, 0, 0.9490196, 1,
1.001043, -0.9611726, 2.33762, 1, 0, 0.9411765, 1,
1.025638, 0.4115463, 2.962218, 1, 0, 0.9372549, 1,
1.026, 0.08129872, 1.698147, 1, 0, 0.9294118, 1,
1.02692, -1.197412, 1.454655, 1, 0, 0.9254902, 1,
1.028419, -0.3376783, 2.590482, 1, 0, 0.9176471, 1,
1.045081, -1.32129, 2.158548, 1, 0, 0.9137255, 1,
1.052144, -0.1803056, 1.199465, 1, 0, 0.9058824, 1,
1.054247, -0.4916639, 2.102885, 1, 0, 0.9019608, 1,
1.055445, -0.2215156, 2.253243, 1, 0, 0.8941177, 1,
1.060592, -1.471926, 2.326864, 1, 0, 0.8862745, 1,
1.067357, -0.429377, 2.425107, 1, 0, 0.8823529, 1,
1.089248, -0.9285355, 2.250825, 1, 0, 0.8745098, 1,
1.092008, 1.265178, 0.388715, 1, 0, 0.8705882, 1,
1.096926, 2.018667, -1.86773, 1, 0, 0.8627451, 1,
1.116124, 0.8054006, 0.7739918, 1, 0, 0.8588235, 1,
1.122986, 0.1207339, -0.6215143, 1, 0, 0.8509804, 1,
1.123607, -1.768889, 2.853187, 1, 0, 0.8470588, 1,
1.129881, 0.9289656, 0.1919418, 1, 0, 0.8392157, 1,
1.13284, -1.556834, 2.290623, 1, 0, 0.8352941, 1,
1.15104, -0.3788553, 0.1446004, 1, 0, 0.827451, 1,
1.159647, -0.5488158, 0.8546425, 1, 0, 0.8235294, 1,
1.160571, 0.9828907, 0.9898885, 1, 0, 0.8156863, 1,
1.163276, 0.5424815, 2.119138, 1, 0, 0.8117647, 1,
1.16484, 1.30263, -1.711185, 1, 0, 0.8039216, 1,
1.167776, 0.0817258, 1.795986, 1, 0, 0.7960784, 1,
1.177771, 0.2355469, 0.7427394, 1, 0, 0.7921569, 1,
1.178037, 0.8092529, -0.8417394, 1, 0, 0.7843137, 1,
1.179318, 0.0962228, 1.95477, 1, 0, 0.7803922, 1,
1.186092, -0.5415165, 1.41974, 1, 0, 0.772549, 1,
1.203265, 0.6451034, 2.891416, 1, 0, 0.7686275, 1,
1.208993, -0.004358511, 1.784728, 1, 0, 0.7607843, 1,
1.218684, 0.9411232, 0.9738119, 1, 0, 0.7568628, 1,
1.226587, -1.366011, 2.763793, 1, 0, 0.7490196, 1,
1.229553, -0.4985387, 2.964106, 1, 0, 0.7450981, 1,
1.23188, 0.4367432, 1.567806, 1, 0, 0.7372549, 1,
1.234329, 1.464017, 0.08920434, 1, 0, 0.7333333, 1,
1.235837, -0.9341721, 2.943882, 1, 0, 0.7254902, 1,
1.256253, -1.476193, 2.946248, 1, 0, 0.7215686, 1,
1.257237, 1.212386, 0.255693, 1, 0, 0.7137255, 1,
1.25853, 0.6568233, 0.06020976, 1, 0, 0.7098039, 1,
1.262776, -0.8437497, 1.783452, 1, 0, 0.7019608, 1,
1.275095, 0.01609495, -0.07343587, 1, 0, 0.6941177, 1,
1.278557, 0.2588296, 1.68601, 1, 0, 0.6901961, 1,
1.280737, 1.795633, 2.039734, 1, 0, 0.682353, 1,
1.281661, -0.3505994, 2.44548, 1, 0, 0.6784314, 1,
1.282674, 0.03885315, 1.317596, 1, 0, 0.6705883, 1,
1.291558, 2.985919, 0.1546189, 1, 0, 0.6666667, 1,
1.294228, 0.2005754, -0.03489574, 1, 0, 0.6588235, 1,
1.29856, 0.02885713, 2.273913, 1, 0, 0.654902, 1,
1.305788, -1.355789, 1.202464, 1, 0, 0.6470588, 1,
1.318793, 0.7176578, 1.727188, 1, 0, 0.6431373, 1,
1.320095, -0.7292691, 2.473076, 1, 0, 0.6352941, 1,
1.327441, -1.657, 1.874875, 1, 0, 0.6313726, 1,
1.330196, 1.080687, 1.053637, 1, 0, 0.6235294, 1,
1.333556, -0.2015706, 1.138274, 1, 0, 0.6196079, 1,
1.336739, -1.239434, 1.839899, 1, 0, 0.6117647, 1,
1.339883, -1.945861, 1.261009, 1, 0, 0.6078432, 1,
1.34658, -0.7440016, 0.09396199, 1, 0, 0.6, 1,
1.348616, -0.1804563, 1.680898, 1, 0, 0.5921569, 1,
1.349383, 1.292132, 0.3521203, 1, 0, 0.5882353, 1,
1.351327, -1.108714, 2.283408, 1, 0, 0.5803922, 1,
1.368182, -0.2173402, 1.244873, 1, 0, 0.5764706, 1,
1.372183, 0.1108028, 1.309634, 1, 0, 0.5686275, 1,
1.372376, -0.2014708, -0.5006278, 1, 0, 0.5647059, 1,
1.378797, 1.079185, -0.09329446, 1, 0, 0.5568628, 1,
1.379237, 1.739937, 1.799316, 1, 0, 0.5529412, 1,
1.38202, 0.1666736, 0.9375748, 1, 0, 0.5450981, 1,
1.398894, 0.4463076, 1.088163, 1, 0, 0.5411765, 1,
1.4088, -0.722103, 1.382396, 1, 0, 0.5333334, 1,
1.411829, 0.0433091, 0.4948027, 1, 0, 0.5294118, 1,
1.418324, -0.4768929, 1.246314, 1, 0, 0.5215687, 1,
1.43277, 2.238825, 0.07037329, 1, 0, 0.5176471, 1,
1.432867, -0.3996845, 1.438832, 1, 0, 0.509804, 1,
1.447179, 1.043186, 0.3207406, 1, 0, 0.5058824, 1,
1.44759, 1.373053, -0.4957507, 1, 0, 0.4980392, 1,
1.44911, -0.4852842, 2.851958, 1, 0, 0.4901961, 1,
1.453795, 1.724448, 1.452739, 1, 0, 0.4862745, 1,
1.456054, 0.3218448, 0.9192581, 1, 0, 0.4784314, 1,
1.46099, 0.7602958, 2.253952, 1, 0, 0.4745098, 1,
1.461472, -0.07356728, 2.94782, 1, 0, 0.4666667, 1,
1.466106, -0.1203832, 0.8149928, 1, 0, 0.4627451, 1,
1.467684, -0.3617756, 2.819423, 1, 0, 0.454902, 1,
1.471732, 0.04845878, 2.984786, 1, 0, 0.4509804, 1,
1.471736, -0.6589446, 1.079565, 1, 0, 0.4431373, 1,
1.481285, 0.3472441, 1.102393, 1, 0, 0.4392157, 1,
1.485268, 0.4483828, 3.055488, 1, 0, 0.4313726, 1,
1.493017, 0.9050472, 2.721649, 1, 0, 0.427451, 1,
1.495106, 1.138073, 0.2406744, 1, 0, 0.4196078, 1,
1.533916, 1.108448, 0.6269839, 1, 0, 0.4156863, 1,
1.539381, 0.1413622, 1.952329, 1, 0, 0.4078431, 1,
1.549574, -0.1469103, 2.516382, 1, 0, 0.4039216, 1,
1.550695, 0.8425503, 2.044684, 1, 0, 0.3960784, 1,
1.551353, 0.3029523, 0.03488673, 1, 0, 0.3882353, 1,
1.572894, -0.9861464, 0.6503108, 1, 0, 0.3843137, 1,
1.57856, 1.298132, 0.1482969, 1, 0, 0.3764706, 1,
1.584226, -0.7308795, 1.116535, 1, 0, 0.372549, 1,
1.593184, -1.082447, 3.369184, 1, 0, 0.3647059, 1,
1.605859, -0.482626, 0.7900981, 1, 0, 0.3607843, 1,
1.612336, -1.554052, 2.143934, 1, 0, 0.3529412, 1,
1.613794, -0.194188, 2.086541, 1, 0, 0.3490196, 1,
1.624465, 0.06178044, 2.212908, 1, 0, 0.3411765, 1,
1.626509, -0.8520169, 2.585151, 1, 0, 0.3372549, 1,
1.631083, -0.4355694, 2.00264, 1, 0, 0.3294118, 1,
1.65586, 0.846918, 0.06157004, 1, 0, 0.3254902, 1,
1.656239, 1.263192, 1.306564, 1, 0, 0.3176471, 1,
1.676359, 0.05761743, 2.621969, 1, 0, 0.3137255, 1,
1.706342, 0.5948758, 1.845519, 1, 0, 0.3058824, 1,
1.707494, 2.565846, -0.247594, 1, 0, 0.2980392, 1,
1.730197, 1.069257, 1.402496, 1, 0, 0.2941177, 1,
1.730655, -0.0177761, 1.800457, 1, 0, 0.2862745, 1,
1.742545, -1.555314, 2.983704, 1, 0, 0.282353, 1,
1.756329, 0.5025912, 1.38152, 1, 0, 0.2745098, 1,
1.772951, -1.072451, 2.545776, 1, 0, 0.2705882, 1,
1.777503, 1.718122, 1.357233, 1, 0, 0.2627451, 1,
1.779777, 1.905069, 0.4652512, 1, 0, 0.2588235, 1,
1.786743, 0.1969343, 0.3533264, 1, 0, 0.2509804, 1,
1.789013, 0.6846987, 1.086358, 1, 0, 0.2470588, 1,
1.798007, -1.387641, 1.486491, 1, 0, 0.2392157, 1,
1.833694, -0.09085754, 1.992836, 1, 0, 0.2352941, 1,
1.844007, 0.4851908, 1.664875, 1, 0, 0.227451, 1,
1.862426, 1.486182, 0.4859399, 1, 0, 0.2235294, 1,
1.863264, -1.399032, 1.495889, 1, 0, 0.2156863, 1,
1.876474, 0.3245501, 2.013198, 1, 0, 0.2117647, 1,
1.878478, -2.101743, 3.348701, 1, 0, 0.2039216, 1,
1.879283, -0.6939657, 2.142002, 1, 0, 0.1960784, 1,
1.879463, 1.035656, 1.761969, 1, 0, 0.1921569, 1,
1.891459, 1.942933, 0.9118361, 1, 0, 0.1843137, 1,
1.892265, 0.5959687, 2.523196, 1, 0, 0.1803922, 1,
1.892378, -1.404486, 3.105543, 1, 0, 0.172549, 1,
1.91574, 0.6174281, 0.3442924, 1, 0, 0.1686275, 1,
1.927248, 0.6747038, 0.9346007, 1, 0, 0.1607843, 1,
1.963528, -0.8195987, 2.179666, 1, 0, 0.1568628, 1,
1.991317, -0.2748214, 2.028385, 1, 0, 0.1490196, 1,
1.991823, 0.995482, 0.7579831, 1, 0, 0.145098, 1,
2.046558, -0.307848, 1.516464, 1, 0, 0.1372549, 1,
2.10217, -0.4739121, 1.53781, 1, 0, 0.1333333, 1,
2.124347, -0.2747463, 2.737643, 1, 0, 0.1254902, 1,
2.136763, -0.05131358, 2.653099, 1, 0, 0.1215686, 1,
2.172377, 0.3363453, 1.981949, 1, 0, 0.1137255, 1,
2.212867, -1.359381, 2.779902, 1, 0, 0.1098039, 1,
2.21966, -0.3546818, 3.695131, 1, 0, 0.1019608, 1,
2.242395, 0.2463444, 2.567316, 1, 0, 0.09411765, 1,
2.258055, 0.5613146, 3.070661, 1, 0, 0.09019608, 1,
2.266922, -0.1122821, -0.4124277, 1, 0, 0.08235294, 1,
2.28352, -1.999599, 1.542987, 1, 0, 0.07843138, 1,
2.328817, 0.3224322, 3.101599, 1, 0, 0.07058824, 1,
2.339245, -0.01759572, 0.9221393, 1, 0, 0.06666667, 1,
2.393508, -1.290034, 2.691323, 1, 0, 0.05882353, 1,
2.411464, -1.074823, 1.096537, 1, 0, 0.05490196, 1,
2.426302, -0.7485167, 1.811905, 1, 0, 0.04705882, 1,
2.433858, 0.6712448, 2.062569, 1, 0, 0.04313726, 1,
2.587935, -0.9581223, 1.963556, 1, 0, 0.03529412, 1,
2.614491, 0.1546235, 1.651654, 1, 0, 0.03137255, 1,
2.621593, 0.8679768, 1.491499, 1, 0, 0.02352941, 1,
2.804518, -0.1357263, 1.65217, 1, 0, 0.01960784, 1,
3.00576, -0.734718, 0.2957111, 1, 0, 0.01176471, 1,
3.619013, -0.4132524, 1.695937, 1, 0, 0.007843138, 1
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
0.2070129, -4.513999, -7.017657, 0, -0.5, 0.5, 0.5,
0.2070129, -4.513999, -7.017657, 1, -0.5, 0.5, 0.5,
0.2070129, -4.513999, -7.017657, 1, 1.5, 0.5, 0.5,
0.2070129, -4.513999, -7.017657, 0, 1.5, 0.5, 0.5
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
-4.361655, -0.2047369, -7.017657, 0, -0.5, 0.5, 0.5,
-4.361655, -0.2047369, -7.017657, 1, -0.5, 0.5, 0.5,
-4.361655, -0.2047369, -7.017657, 1, 1.5, 0.5, 0.5,
-4.361655, -0.2047369, -7.017657, 0, 1.5, 0.5, 0.5
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
-4.361655, -4.513999, 0.4300692, 0, -0.5, 0.5, 0.5,
-4.361655, -4.513999, 0.4300692, 1, -0.5, 0.5, 0.5,
-4.361655, -4.513999, 0.4300692, 1, 1.5, 0.5, 0.5,
-4.361655, -4.513999, 0.4300692, 0, 1.5, 0.5, 0.5
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
-3, -3.519554, -5.298951,
3, -3.519554, -5.298951,
-3, -3.519554, -5.298951,
-3, -3.685294, -5.585402,
-2, -3.519554, -5.298951,
-2, -3.685294, -5.585402,
-1, -3.519554, -5.298951,
-1, -3.685294, -5.585402,
0, -3.519554, -5.298951,
0, -3.685294, -5.585402,
1, -3.519554, -5.298951,
1, -3.685294, -5.585402,
2, -3.519554, -5.298951,
2, -3.685294, -5.585402,
3, -3.519554, -5.298951,
3, -3.685294, -5.585402
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
-3, -4.016776, -6.158304, 0, -0.5, 0.5, 0.5,
-3, -4.016776, -6.158304, 1, -0.5, 0.5, 0.5,
-3, -4.016776, -6.158304, 1, 1.5, 0.5, 0.5,
-3, -4.016776, -6.158304, 0, 1.5, 0.5, 0.5,
-2, -4.016776, -6.158304, 0, -0.5, 0.5, 0.5,
-2, -4.016776, -6.158304, 1, -0.5, 0.5, 0.5,
-2, -4.016776, -6.158304, 1, 1.5, 0.5, 0.5,
-2, -4.016776, -6.158304, 0, 1.5, 0.5, 0.5,
-1, -4.016776, -6.158304, 0, -0.5, 0.5, 0.5,
-1, -4.016776, -6.158304, 1, -0.5, 0.5, 0.5,
-1, -4.016776, -6.158304, 1, 1.5, 0.5, 0.5,
-1, -4.016776, -6.158304, 0, 1.5, 0.5, 0.5,
0, -4.016776, -6.158304, 0, -0.5, 0.5, 0.5,
0, -4.016776, -6.158304, 1, -0.5, 0.5, 0.5,
0, -4.016776, -6.158304, 1, 1.5, 0.5, 0.5,
0, -4.016776, -6.158304, 0, 1.5, 0.5, 0.5,
1, -4.016776, -6.158304, 0, -0.5, 0.5, 0.5,
1, -4.016776, -6.158304, 1, -0.5, 0.5, 0.5,
1, -4.016776, -6.158304, 1, 1.5, 0.5, 0.5,
1, -4.016776, -6.158304, 0, 1.5, 0.5, 0.5,
2, -4.016776, -6.158304, 0, -0.5, 0.5, 0.5,
2, -4.016776, -6.158304, 1, -0.5, 0.5, 0.5,
2, -4.016776, -6.158304, 1, 1.5, 0.5, 0.5,
2, -4.016776, -6.158304, 0, 1.5, 0.5, 0.5,
3, -4.016776, -6.158304, 0, -0.5, 0.5, 0.5,
3, -4.016776, -6.158304, 1, -0.5, 0.5, 0.5,
3, -4.016776, -6.158304, 1, 1.5, 0.5, 0.5,
3, -4.016776, -6.158304, 0, 1.5, 0.5, 0.5
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
-3.307347, -3, -5.298951,
-3.307347, 3, -5.298951,
-3.307347, -3, -5.298951,
-3.483065, -3, -5.585402,
-3.307347, -2, -5.298951,
-3.483065, -2, -5.585402,
-3.307347, -1, -5.298951,
-3.483065, -1, -5.585402,
-3.307347, 0, -5.298951,
-3.483065, 0, -5.585402,
-3.307347, 1, -5.298951,
-3.483065, 1, -5.585402,
-3.307347, 2, -5.298951,
-3.483065, 2, -5.585402,
-3.307347, 3, -5.298951,
-3.483065, 3, -5.585402
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
-3.834501, -3, -6.158304, 0, -0.5, 0.5, 0.5,
-3.834501, -3, -6.158304, 1, -0.5, 0.5, 0.5,
-3.834501, -3, -6.158304, 1, 1.5, 0.5, 0.5,
-3.834501, -3, -6.158304, 0, 1.5, 0.5, 0.5,
-3.834501, -2, -6.158304, 0, -0.5, 0.5, 0.5,
-3.834501, -2, -6.158304, 1, -0.5, 0.5, 0.5,
-3.834501, -2, -6.158304, 1, 1.5, 0.5, 0.5,
-3.834501, -2, -6.158304, 0, 1.5, 0.5, 0.5,
-3.834501, -1, -6.158304, 0, -0.5, 0.5, 0.5,
-3.834501, -1, -6.158304, 1, -0.5, 0.5, 0.5,
-3.834501, -1, -6.158304, 1, 1.5, 0.5, 0.5,
-3.834501, -1, -6.158304, 0, 1.5, 0.5, 0.5,
-3.834501, 0, -6.158304, 0, -0.5, 0.5, 0.5,
-3.834501, 0, -6.158304, 1, -0.5, 0.5, 0.5,
-3.834501, 0, -6.158304, 1, 1.5, 0.5, 0.5,
-3.834501, 0, -6.158304, 0, 1.5, 0.5, 0.5,
-3.834501, 1, -6.158304, 0, -0.5, 0.5, 0.5,
-3.834501, 1, -6.158304, 1, -0.5, 0.5, 0.5,
-3.834501, 1, -6.158304, 1, 1.5, 0.5, 0.5,
-3.834501, 1, -6.158304, 0, 1.5, 0.5, 0.5,
-3.834501, 2, -6.158304, 0, -0.5, 0.5, 0.5,
-3.834501, 2, -6.158304, 1, -0.5, 0.5, 0.5,
-3.834501, 2, -6.158304, 1, 1.5, 0.5, 0.5,
-3.834501, 2, -6.158304, 0, 1.5, 0.5, 0.5,
-3.834501, 3, -6.158304, 0, -0.5, 0.5, 0.5,
-3.834501, 3, -6.158304, 1, -0.5, 0.5, 0.5,
-3.834501, 3, -6.158304, 1, 1.5, 0.5, 0.5,
-3.834501, 3, -6.158304, 0, 1.5, 0.5, 0.5
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
-3.307347, -3.519554, -4,
-3.307347, -3.519554, 4,
-3.307347, -3.519554, -4,
-3.483065, -3.685294, -4,
-3.307347, -3.519554, -2,
-3.483065, -3.685294, -2,
-3.307347, -3.519554, 0,
-3.483065, -3.685294, 0,
-3.307347, -3.519554, 2,
-3.483065, -3.685294, 2,
-3.307347, -3.519554, 4,
-3.483065, -3.685294, 4
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
-3.834501, -4.016776, -4, 0, -0.5, 0.5, 0.5,
-3.834501, -4.016776, -4, 1, -0.5, 0.5, 0.5,
-3.834501, -4.016776, -4, 1, 1.5, 0.5, 0.5,
-3.834501, -4.016776, -4, 0, 1.5, 0.5, 0.5,
-3.834501, -4.016776, -2, 0, -0.5, 0.5, 0.5,
-3.834501, -4.016776, -2, 1, -0.5, 0.5, 0.5,
-3.834501, -4.016776, -2, 1, 1.5, 0.5, 0.5,
-3.834501, -4.016776, -2, 0, 1.5, 0.5, 0.5,
-3.834501, -4.016776, 0, 0, -0.5, 0.5, 0.5,
-3.834501, -4.016776, 0, 1, -0.5, 0.5, 0.5,
-3.834501, -4.016776, 0, 1, 1.5, 0.5, 0.5,
-3.834501, -4.016776, 0, 0, 1.5, 0.5, 0.5,
-3.834501, -4.016776, 2, 0, -0.5, 0.5, 0.5,
-3.834501, -4.016776, 2, 1, -0.5, 0.5, 0.5,
-3.834501, -4.016776, 2, 1, 1.5, 0.5, 0.5,
-3.834501, -4.016776, 2, 0, 1.5, 0.5, 0.5,
-3.834501, -4.016776, 4, 0, -0.5, 0.5, 0.5,
-3.834501, -4.016776, 4, 1, -0.5, 0.5, 0.5,
-3.834501, -4.016776, 4, 1, 1.5, 0.5, 0.5,
-3.834501, -4.016776, 4, 0, 1.5, 0.5, 0.5
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
-3.307347, -3.519554, -5.298951,
-3.307347, 3.11008, -5.298951,
-3.307347, -3.519554, 6.15909,
-3.307347, 3.11008, 6.15909,
-3.307347, -3.519554, -5.298951,
-3.307347, -3.519554, 6.15909,
-3.307347, 3.11008, -5.298951,
-3.307347, 3.11008, 6.15909,
-3.307347, -3.519554, -5.298951,
3.721373, -3.519554, -5.298951,
-3.307347, -3.519554, 6.15909,
3.721373, -3.519554, 6.15909,
-3.307347, 3.11008, -5.298951,
3.721373, 3.11008, -5.298951,
-3.307347, 3.11008, 6.15909,
3.721373, 3.11008, 6.15909,
3.721373, -3.519554, -5.298951,
3.721373, 3.11008, -5.298951,
3.721373, -3.519554, 6.15909,
3.721373, 3.11008, 6.15909,
3.721373, -3.519554, -5.298951,
3.721373, -3.519554, 6.15909,
3.721373, 3.11008, -5.298951,
3.721373, 3.11008, 6.15909
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
var radius = 8.003328;
var distance = 35.60771;
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
mvMatrix.translate( -0.2070129, 0.2047369, -0.4300692 );
mvMatrix.scale( 1.231142, 1.305254, 0.7552212 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.60771);
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
DCIP<-read.table("DCIP.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DCIP$V2
```

```
## Error in eval(expr, envir, enclos): object 'DCIP' not found
```

```r
y<-DCIP$V3
```

```
## Error in eval(expr, envir, enclos): object 'DCIP' not found
```

```r
z<-DCIP$V4
```

```
## Error in eval(expr, envir, enclos): object 'DCIP' not found
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
-3.204987, 0.2834398, -1.851121, 0, 0, 1, 1, 1,
-3.011212, 1.916486, -0.5015786, 1, 0, 0, 1, 1,
-2.713245, 0.1472432, -1.051987, 1, 0, 0, 1, 1,
-2.674606, -0.1380667, -1.230687, 1, 0, 0, 1, 1,
-2.63713, -0.2460159, -1.556136, 1, 0, 0, 1, 1,
-2.606875, -1.333044, -2.841227, 1, 0, 0, 1, 1,
-2.429885, 0.4811299, -1.451736, 0, 0, 0, 1, 1,
-2.394203, -1.676656, -2.70356, 0, 0, 0, 1, 1,
-2.391303, -0.2911944, -0.7865607, 0, 0, 0, 1, 1,
-2.326209, -0.3089564, -2.728618, 0, 0, 0, 1, 1,
-2.27568, 0.1103066, -1.732025, 0, 0, 0, 1, 1,
-2.256021, 0.6932434, 0.2759441, 0, 0, 0, 1, 1,
-2.169232, 0.5522938, -1.967271, 0, 0, 0, 1, 1,
-2.133884, 0.2685619, -0.2552794, 1, 1, 1, 1, 1,
-2.124031, -0.8335932, -1.592843, 1, 1, 1, 1, 1,
-2.123382, -0.5414708, 0.3444226, 1, 1, 1, 1, 1,
-2.113914, 0.9647794, -0.6381208, 1, 1, 1, 1, 1,
-2.051421, 0.3883611, -0.9537404, 1, 1, 1, 1, 1,
-2.049367, -0.05264988, -1.762716, 1, 1, 1, 1, 1,
-2.029991, -0.3596086, -0.6529109, 1, 1, 1, 1, 1,
-2.003765, 0.09104558, -1.027569, 1, 1, 1, 1, 1,
-2.001394, 0.6409743, -0.9453372, 1, 1, 1, 1, 1,
-1.994626, -1.561543, -4.904837, 1, 1, 1, 1, 1,
-1.891234, -0.1240804, -1.60984, 1, 1, 1, 1, 1,
-1.889273, 0.6260857, -1.083001, 1, 1, 1, 1, 1,
-1.87994, 0.2004189, -2.01509, 1, 1, 1, 1, 1,
-1.868417, -0.7290324, -3.458833, 1, 1, 1, 1, 1,
-1.865822, -1.114509, -0.51577, 1, 1, 1, 1, 1,
-1.84307, 1.075629, -0.4686974, 0, 0, 1, 1, 1,
-1.818259, 0.1211745, -0.2476154, 1, 0, 0, 1, 1,
-1.812803, 0.1538735, -1.122337, 1, 0, 0, 1, 1,
-1.809224, 1.501137, 0.4289222, 1, 0, 0, 1, 1,
-1.792268, 0.6248847, -0.1842901, 1, 0, 0, 1, 1,
-1.766021, 0.6201645, -1.978798, 1, 0, 0, 1, 1,
-1.71772, 0.6860703, 0.2622548, 0, 0, 0, 1, 1,
-1.716252, 0.3526392, -2.24128, 0, 0, 0, 1, 1,
-1.69952, -1.026655, -2.612266, 0, 0, 0, 1, 1,
-1.698141, 0.7577671, -0.8447417, 0, 0, 0, 1, 1,
-1.694178, -1.323599, -1.540327, 0, 0, 0, 1, 1,
-1.657562, 0.5502743, -2.912545, 0, 0, 0, 1, 1,
-1.64617, -1.925298, -4.434718, 0, 0, 0, 1, 1,
-1.64476, -0.7909142, -0.7278734, 1, 1, 1, 1, 1,
-1.633753, 1.352507, -3.638795, 1, 1, 1, 1, 1,
-1.612614, -0.3026958, -1.81168, 1, 1, 1, 1, 1,
-1.599814, 2.378704, -0.7079505, 1, 1, 1, 1, 1,
-1.595742, 0.1049632, -0.01540457, 1, 1, 1, 1, 1,
-1.587099, 0.06174405, -1.633918, 1, 1, 1, 1, 1,
-1.581645, 0.4351524, -0.7468471, 1, 1, 1, 1, 1,
-1.577049, 0.2251569, -2.13043, 1, 1, 1, 1, 1,
-1.56734, -1.128895, -1.564931, 1, 1, 1, 1, 1,
-1.562526, -0.1227444, -1.576498, 1, 1, 1, 1, 1,
-1.562443, 0.02227203, -1.551692, 1, 1, 1, 1, 1,
-1.553696, -0.09939495, -0.66486, 1, 1, 1, 1, 1,
-1.515296, 0.2332629, -0.5480608, 1, 1, 1, 1, 1,
-1.511043, -1.424859, -3.094483, 1, 1, 1, 1, 1,
-1.499943, 1.751122, -0.4567202, 1, 1, 1, 1, 1,
-1.492897, 0.03046864, -0.6478297, 0, 0, 1, 1, 1,
-1.492415, -0.5873482, -1.74035, 1, 0, 0, 1, 1,
-1.491193, 0.0578197, -2.719753, 1, 0, 0, 1, 1,
-1.489262, -0.6403919, -1.513253, 1, 0, 0, 1, 1,
-1.484067, -2.021732, -1.38238, 1, 0, 0, 1, 1,
-1.476298, -1.088141, -2.785789, 1, 0, 0, 1, 1,
-1.469867, 0.6841385, -2.405974, 0, 0, 0, 1, 1,
-1.468582, -0.5963688, -1.557912, 0, 0, 0, 1, 1,
-1.461279, -0.77012, -2.484134, 0, 0, 0, 1, 1,
-1.458405, 0.508325, -0.5113334, 0, 0, 0, 1, 1,
-1.456034, 0.2519745, -1.708059, 0, 0, 0, 1, 1,
-1.436915, -1.45226, -2.244581, 0, 0, 0, 1, 1,
-1.422155, 1.74779, -0.5610368, 0, 0, 0, 1, 1,
-1.422133, -0.7917708, -2.048386, 1, 1, 1, 1, 1,
-1.415044, 1.06786, -0.587373, 1, 1, 1, 1, 1,
-1.412193, -0.9756119, -1.425324, 1, 1, 1, 1, 1,
-1.410759, -0.4695268, 0.1776333, 1, 1, 1, 1, 1,
-1.410618, 1.130195, -1.202939, 1, 1, 1, 1, 1,
-1.407855, -1.374713, -3.195067, 1, 1, 1, 1, 1,
-1.403791, 0.185417, -0.4616671, 1, 1, 1, 1, 1,
-1.402951, 0.3392489, -1.440411, 1, 1, 1, 1, 1,
-1.38679, -0.3203154, -1.222385, 1, 1, 1, 1, 1,
-1.373646, -1.647483, -0.7155103, 1, 1, 1, 1, 1,
-1.372381, -0.1419591, 0.102439, 1, 1, 1, 1, 1,
-1.365367, -1.728706, -1.855741, 1, 1, 1, 1, 1,
-1.357125, 0.8964476, -2.235897, 1, 1, 1, 1, 1,
-1.345915, 0.3392907, -0.6503989, 1, 1, 1, 1, 1,
-1.328226, 0.2620283, -1.932815, 1, 1, 1, 1, 1,
-1.327456, 0.4703182, -0.1669027, 0, 0, 1, 1, 1,
-1.326148, -1.591915, -1.865969, 1, 0, 0, 1, 1,
-1.307552, -1.456805, -0.779774, 1, 0, 0, 1, 1,
-1.288757, 0.6677118, -2.040483, 1, 0, 0, 1, 1,
-1.288597, -0.4183027, -2.738567, 1, 0, 0, 1, 1,
-1.2833, 1.692, 0.1747416, 1, 0, 0, 1, 1,
-1.274145, 0.5310214, -2.298283, 0, 0, 0, 1, 1,
-1.27287, -0.5209345, -1.448495, 0, 0, 0, 1, 1,
-1.270029, 0.1430521, -1.591384, 0, 0, 0, 1, 1,
-1.260005, -1.904574, -3.017769, 0, 0, 0, 1, 1,
-1.240598, 1.12245, 0.4363641, 0, 0, 0, 1, 1,
-1.238984, 2.270538, -1.19647, 0, 0, 0, 1, 1,
-1.23885, -0.8311334, -1.901708, 0, 0, 0, 1, 1,
-1.235985, -0.5028372, -0.8834085, 1, 1, 1, 1, 1,
-1.23296, -2.052209, -2.27492, 1, 1, 1, 1, 1,
-1.232148, -0.5209666, -3.099933, 1, 1, 1, 1, 1,
-1.231084, -0.697594, -2.371901, 1, 1, 1, 1, 1,
-1.22788, 0.5231884, -2.534269, 1, 1, 1, 1, 1,
-1.222909, -0.5489748, -2.737202, 1, 1, 1, 1, 1,
-1.220829, 1.105678, 0.1923781, 1, 1, 1, 1, 1,
-1.210279, 0.3531669, 0.1640363, 1, 1, 1, 1, 1,
-1.204255, -0.05356761, -1.773228, 1, 1, 1, 1, 1,
-1.204164, -0.4947623, -1.662596, 1, 1, 1, 1, 1,
-1.195822, -0.08991102, 0.8694155, 1, 1, 1, 1, 1,
-1.193628, 1.507029, -1.458256, 1, 1, 1, 1, 1,
-1.189743, 0.40911, -2.475144, 1, 1, 1, 1, 1,
-1.183077, -1.147741, -2.699354, 1, 1, 1, 1, 1,
-1.17541, 0.7575651, -1.696592, 1, 1, 1, 1, 1,
-1.172552, 0.5931825, -0.9122384, 0, 0, 1, 1, 1,
-1.16707, -1.224422, -2.526446, 1, 0, 0, 1, 1,
-1.149849, -0.4356728, -2.558231, 1, 0, 0, 1, 1,
-1.147989, 1.797577, -1.643295, 1, 0, 0, 1, 1,
-1.14658, 0.5183392, 0.3978824, 1, 0, 0, 1, 1,
-1.135173, 0.5839065, 0.4817103, 1, 0, 0, 1, 1,
-1.133816, -1.300317, -1.144294, 0, 0, 0, 1, 1,
-1.132938, -0.9148546, -2.371822, 0, 0, 0, 1, 1,
-1.129551, 0.1633522, -1.26668, 0, 0, 0, 1, 1,
-1.127311, 0.08746786, 0.8257564, 0, 0, 0, 1, 1,
-1.124886, -3.148544, -2.900577, 0, 0, 0, 1, 1,
-1.124714, 2.808095, -0.06309576, 0, 0, 0, 1, 1,
-1.124502, -0.1469475, -1.503026, 0, 0, 0, 1, 1,
-1.121607, 0.5386278, -1.779981, 1, 1, 1, 1, 1,
-1.121192, -1.623023, -1.264075, 1, 1, 1, 1, 1,
-1.119183, -0.4406479, -0.8661612, 1, 1, 1, 1, 1,
-1.110102, -1.217329, -2.145734, 1, 1, 1, 1, 1,
-1.107053, -0.9417049, -2.642759, 1, 1, 1, 1, 1,
-1.092785, -0.4030131, 0.1488206, 1, 1, 1, 1, 1,
-1.091226, -0.7104402, -0.4492424, 1, 1, 1, 1, 1,
-1.090685, -0.2990385, -2.311185, 1, 1, 1, 1, 1,
-1.089476, -0.1408297, -1.570032, 1, 1, 1, 1, 1,
-1.086111, 0.992977, -1.984475, 1, 1, 1, 1, 1,
-1.085276, -1.283956, -1.796529, 1, 1, 1, 1, 1,
-1.082405, 0.8129584, -0.6191842, 1, 1, 1, 1, 1,
-1.066326, -0.1924436, -2.790414, 1, 1, 1, 1, 1,
-1.065725, -0.3386489, -1.891205, 1, 1, 1, 1, 1,
-1.063424, 2.019238, -0.1615955, 1, 1, 1, 1, 1,
-1.057054, -0.6298981, -2.209064, 0, 0, 1, 1, 1,
-1.043697, 2.78994, -2.673113, 1, 0, 0, 1, 1,
-1.039201, 1.318771, -2.123456, 1, 0, 0, 1, 1,
-1.038742, 1.562513, -0.01247852, 1, 0, 0, 1, 1,
-1.03772, 0.7701073, -2.269579, 1, 0, 0, 1, 1,
-1.036015, 0.1604632, -0.8003555, 1, 0, 0, 1, 1,
-1.031915, 1.794435, -0.7393584, 0, 0, 0, 1, 1,
-1.028409, -0.3886121, -1.629093, 0, 0, 0, 1, 1,
-1.019071, 2.3583, 0.04297974, 0, 0, 0, 1, 1,
-1.009894, 0.8353328, 0.1402882, 0, 0, 0, 1, 1,
-1.006472, -1.30946, -4.305203, 0, 0, 0, 1, 1,
-1.00432, -1.019367, -2.249775, 0, 0, 0, 1, 1,
-0.9812875, -1.059979, -1.945245, 0, 0, 0, 1, 1,
-0.9801419, -0.7560802, -3.853467, 1, 1, 1, 1, 1,
-0.9747927, 0.5864509, 0.7180452, 1, 1, 1, 1, 1,
-0.9720901, 0.1315359, -2.36298, 1, 1, 1, 1, 1,
-0.9624946, 0.7083923, -0.6656287, 1, 1, 1, 1, 1,
-0.954845, 0.8657277, -0.8065552, 1, 1, 1, 1, 1,
-0.9455394, 1.320156, -1.007405, 1, 1, 1, 1, 1,
-0.9431661, -0.4811878, -3.076011, 1, 1, 1, 1, 1,
-0.9319324, -1.14834, -3.018633, 1, 1, 1, 1, 1,
-0.9304659, 1.870009, -2.464187, 1, 1, 1, 1, 1,
-0.9223512, -0.6928129, -2.315384, 1, 1, 1, 1, 1,
-0.9192302, 0.05923739, 0.3385187, 1, 1, 1, 1, 1,
-0.911872, -1.588609, -2.862134, 1, 1, 1, 1, 1,
-0.9073308, 0.1856887, -3.549512, 1, 1, 1, 1, 1,
-0.9062208, -0.9064384, -1.772423, 1, 1, 1, 1, 1,
-0.902482, 1.845277, 0.09571312, 1, 1, 1, 1, 1,
-0.8998778, 0.2646407, -2.471008, 0, 0, 1, 1, 1,
-0.8882874, 0.5877312, 0.5699096, 1, 0, 0, 1, 1,
-0.886692, 1.498672, -0.4241776, 1, 0, 0, 1, 1,
-0.8863462, 0.6112735, -0.219225, 1, 0, 0, 1, 1,
-0.8862615, 1.505862, 0.5613847, 1, 0, 0, 1, 1,
-0.8854885, -1.090641, -4.520617, 1, 0, 0, 1, 1,
-0.8832472, 2.759115, -1.140111, 0, 0, 0, 1, 1,
-0.8797196, -1.232713, -1.784397, 0, 0, 0, 1, 1,
-0.8782756, 0.8011698, 0.08695401, 0, 0, 0, 1, 1,
-0.8747912, -0.390301, -2.067348, 0, 0, 0, 1, 1,
-0.871128, -0.4762611, -2.885506, 0, 0, 0, 1, 1,
-0.8710806, -0.9548464, -2.061239, 0, 0, 0, 1, 1,
-0.8709821, 1.907034, -0.4401478, 0, 0, 0, 1, 1,
-0.8668848, 0.4018526, -0.8285241, 1, 1, 1, 1, 1,
-0.8560702, 1.561002, 1.372657, 1, 1, 1, 1, 1,
-0.8536695, 0.8738245, -1.083809, 1, 1, 1, 1, 1,
-0.853073, 0.6086338, -0.6377164, 1, 1, 1, 1, 1,
-0.8401781, 0.5122514, -0.5572, 1, 1, 1, 1, 1,
-0.8362621, 0.4376445, -1.874769, 1, 1, 1, 1, 1,
-0.8350251, 1.621454, -1.546733, 1, 1, 1, 1, 1,
-0.8311653, -0.7094657, -2.285539, 1, 1, 1, 1, 1,
-0.8294356, 1.307351, -1.551685, 1, 1, 1, 1, 1,
-0.8219044, -0.8161187, -1.506372, 1, 1, 1, 1, 1,
-0.8209038, 1.583813, 0.9125075, 1, 1, 1, 1, 1,
-0.8164084, 0.01923419, -1.513115, 1, 1, 1, 1, 1,
-0.8161181, -3.423006, -3.495557, 1, 1, 1, 1, 1,
-0.8141377, 0.9265959, -1.056074, 1, 1, 1, 1, 1,
-0.8066525, -1.008155, -2.148996, 1, 1, 1, 1, 1,
-0.8064495, -1.623913, -3.485096, 0, 0, 1, 1, 1,
-0.8044709, -0.9093559, -1.707864, 1, 0, 0, 1, 1,
-0.8043537, -0.03717938, -1.489572, 1, 0, 0, 1, 1,
-0.8033859, 1.160217, 1.428044, 1, 0, 0, 1, 1,
-0.8024695, -0.7836232, -0.2869338, 1, 0, 0, 1, 1,
-0.7969405, -0.449836, -0.89267, 1, 0, 0, 1, 1,
-0.7968234, 0.9923249, -0.1150403, 0, 0, 0, 1, 1,
-0.7854022, 0.5121932, -1.52275, 0, 0, 0, 1, 1,
-0.7837767, 0.7259888, -2.003389, 0, 0, 0, 1, 1,
-0.7825148, 0.4764997, -1.701294, 0, 0, 0, 1, 1,
-0.7744043, -0.08111339, -1.720403, 0, 0, 0, 1, 1,
-0.7733305, -0.4672287, -2.228734, 0, 0, 0, 1, 1,
-0.7643666, -0.1993237, -0.5976149, 0, 0, 0, 1, 1,
-0.7611448, -0.1817767, -3.476765, 1, 1, 1, 1, 1,
-0.758558, -1.444904, -3.471925, 1, 1, 1, 1, 1,
-0.7489226, -0.2316956, -1.610072, 1, 1, 1, 1, 1,
-0.7476584, 0.2773289, 0.7320318, 1, 1, 1, 1, 1,
-0.7423507, -2.754524, -2.333192, 1, 1, 1, 1, 1,
-0.739491, 0.9702416, -0.6353586, 1, 1, 1, 1, 1,
-0.7369799, 0.5200662, -0.9829862, 1, 1, 1, 1, 1,
-0.7322193, -1.500523, -1.698697, 1, 1, 1, 1, 1,
-0.7299234, 1.076872, -1.268724, 1, 1, 1, 1, 1,
-0.7282962, -0.6417447, -1.630231, 1, 1, 1, 1, 1,
-0.7265573, 0.04255763, -1.143477, 1, 1, 1, 1, 1,
-0.724078, -0.3320113, -3.819154, 1, 1, 1, 1, 1,
-0.7215042, -1.380506, -3.362983, 1, 1, 1, 1, 1,
-0.7208328, 1.010956, 0.6432079, 1, 1, 1, 1, 1,
-0.7207689, -0.2126647, -1.651132, 1, 1, 1, 1, 1,
-0.7168009, -1.203299, -3.62864, 0, 0, 1, 1, 1,
-0.715418, 0.5576894, -0.3315672, 1, 0, 0, 1, 1,
-0.7096269, -0.133464, -3.135914, 1, 0, 0, 1, 1,
-0.7056779, 0.3823301, -2.331353, 1, 0, 0, 1, 1,
-0.7037668, 0.319757, -1.915555, 1, 0, 0, 1, 1,
-0.7003775, 0.4945269, -0.5199469, 1, 0, 0, 1, 1,
-0.6947815, 0.7197235, 0.2714827, 0, 0, 0, 1, 1,
-0.6894826, -1.057971, -2.217276, 0, 0, 0, 1, 1,
-0.6849726, 0.2769182, -1.669671, 0, 0, 0, 1, 1,
-0.6847911, -0.1339747, -1.42171, 0, 0, 0, 1, 1,
-0.6813115, 0.5598264, -0.6548433, 0, 0, 0, 1, 1,
-0.6794626, 0.1709789, -1.428577, 0, 0, 0, 1, 1,
-0.67392, -0.8337978, -2.492682, 0, 0, 0, 1, 1,
-0.6730099, -1.638516, -3.091391, 1, 1, 1, 1, 1,
-0.6700379, 1.12122, -1.3504, 1, 1, 1, 1, 1,
-0.6638752, -0.2471054, -2.388355, 1, 1, 1, 1, 1,
-0.6610514, -1.206618, -0.602284, 1, 1, 1, 1, 1,
-0.6497704, 0.2276177, -0.1098956, 1, 1, 1, 1, 1,
-0.6470489, 0.1939602, -0.2823607, 1, 1, 1, 1, 1,
-0.6407263, -0.7594827, -1.368001, 1, 1, 1, 1, 1,
-0.6373313, -0.9474548, -2.388028, 1, 1, 1, 1, 1,
-0.6335825, 0.9775068, -0.7646039, 1, 1, 1, 1, 1,
-0.6262432, 0.9883566, -1.158351, 1, 1, 1, 1, 1,
-0.625528, 0.8296118, -1.83596, 1, 1, 1, 1, 1,
-0.6217038, 0.3537956, -2.178523, 1, 1, 1, 1, 1,
-0.6204558, -0.6227703, -1.450186, 1, 1, 1, 1, 1,
-0.6197444, -0.426908, -2.445143, 1, 1, 1, 1, 1,
-0.6135506, -1.914027, -4.427119, 1, 1, 1, 1, 1,
-0.6128612, 0.1096347, -0.4696722, 0, 0, 1, 1, 1,
-0.6023116, -0.3598458, -2.198619, 1, 0, 0, 1, 1,
-0.5951639, -1.009653, -3.157923, 1, 0, 0, 1, 1,
-0.5927387, -0.8064677, -4.179322, 1, 0, 0, 1, 1,
-0.589731, 0.3992898, -1.192822, 1, 0, 0, 1, 1,
-0.5885113, 0.09875518, -0.6074504, 1, 0, 0, 1, 1,
-0.5879037, 1.22683, -2.179568, 0, 0, 0, 1, 1,
-0.5870294, 0.5284214, -1.692851, 0, 0, 0, 1, 1,
-0.5854362, -0.2847789, -2.738041, 0, 0, 0, 1, 1,
-0.5832928, 0.0066139, -1.712863, 0, 0, 0, 1, 1,
-0.5832422, -0.03153766, -1.507388, 0, 0, 0, 1, 1,
-0.5828413, -0.8447852, -4.333147, 0, 0, 0, 1, 1,
-0.5807222, -1.401515, -3.670043, 0, 0, 0, 1, 1,
-0.5803537, -0.1726812, -2.055077, 1, 1, 1, 1, 1,
-0.5773603, -0.768019, -4.083076, 1, 1, 1, 1, 1,
-0.5760311, -0.6701699, -2.874256, 1, 1, 1, 1, 1,
-0.5726066, 0.7306451, -2.21428, 1, 1, 1, 1, 1,
-0.5714459, -0.4562407, -1.137526, 1, 1, 1, 1, 1,
-0.5701237, 0.8576339, 0.0280944, 1, 1, 1, 1, 1,
-0.5671796, -2.089038, -3.386489, 1, 1, 1, 1, 1,
-0.5670139, -0.827007, -2.461428, 1, 1, 1, 1, 1,
-0.5665405, -1.418636, -2.392317, 1, 1, 1, 1, 1,
-0.5640512, -0.3665149, -0.7998106, 1, 1, 1, 1, 1,
-0.5632679, 0.4390177, -1.036274, 1, 1, 1, 1, 1,
-0.5622801, 0.7764666, -1.693233, 1, 1, 1, 1, 1,
-0.561639, 0.01393385, -1.671114, 1, 1, 1, 1, 1,
-0.5584359, 0.5017034, -0.4742629, 1, 1, 1, 1, 1,
-0.555257, -0.4148564, -1.760579, 1, 1, 1, 1, 1,
-0.5525995, 0.4295278, -2.294048, 0, 0, 1, 1, 1,
-0.5525989, 0.5920153, -1.174765, 1, 0, 0, 1, 1,
-0.5506348, -1.21929, -3.770442, 1, 0, 0, 1, 1,
-0.5497075, 0.2094774, -0.2860745, 1, 0, 0, 1, 1,
-0.5494936, 1.470639, -0.5956084, 1, 0, 0, 1, 1,
-0.5474087, -0.7003252, -2.219905, 1, 0, 0, 1, 1,
-0.5409356, -1.352841, -0.7719016, 0, 0, 0, 1, 1,
-0.5407561, 2.286343, 0.2669693, 0, 0, 0, 1, 1,
-0.5406725, 0.5767167, 0.6288617, 0, 0, 0, 1, 1,
-0.526556, 0.07991058, -2.256016, 0, 0, 0, 1, 1,
-0.5263497, -0.7954028, -2.703564, 0, 0, 0, 1, 1,
-0.5249842, 1.448903, 0.07880411, 0, 0, 0, 1, 1,
-0.5185711, -1.763996, -2.649511, 0, 0, 0, 1, 1,
-0.5177441, -1.620379, -4.030161, 1, 1, 1, 1, 1,
-0.5120521, -1.119386, -2.386349, 1, 1, 1, 1, 1,
-0.5115879, 0.547732, -1.581769, 1, 1, 1, 1, 1,
-0.5105354, 0.4886327, -0.4567234, 1, 1, 1, 1, 1,
-0.5088475, 2.453598, -0.1127057, 1, 1, 1, 1, 1,
-0.50623, 0.4801849, -1.181827, 1, 1, 1, 1, 1,
-0.4980317, 1.09618, -0.01907078, 1, 1, 1, 1, 1,
-0.4908041, 1.051961, -1.300503, 1, 1, 1, 1, 1,
-0.4889863, 1.228335, -2.141254, 1, 1, 1, 1, 1,
-0.4855539, 0.4447963, 0.1430377, 1, 1, 1, 1, 1,
-0.4823107, -0.6376402, -2.894495, 1, 1, 1, 1, 1,
-0.4819993, -0.2334457, -1.641121, 1, 1, 1, 1, 1,
-0.4807239, -0.9536884, -3.580655, 1, 1, 1, 1, 1,
-0.479882, 0.3210983, 0.3619757, 1, 1, 1, 1, 1,
-0.4768796, -1.206484, -2.378491, 1, 1, 1, 1, 1,
-0.4698794, -1.277788, -3.50535, 0, 0, 1, 1, 1,
-0.4683628, 0.565952, 1.314381, 1, 0, 0, 1, 1,
-0.4653409, -0.7146404, -1.98842, 1, 0, 0, 1, 1,
-0.4517532, -0.1659831, -2.929962, 1, 0, 0, 1, 1,
-0.4462561, 0.7223726, 0.9353193, 1, 0, 0, 1, 1,
-0.4453081, -1.344063, -3.629674, 1, 0, 0, 1, 1,
-0.4452858, 0.3782771, -0.2970539, 0, 0, 0, 1, 1,
-0.4442886, -0.8245434, -4.299133, 0, 0, 0, 1, 1,
-0.442549, -0.1398202, -4.860433, 0, 0, 0, 1, 1,
-0.4386213, 0.2044692, -0.8484613, 0, 0, 0, 1, 1,
-0.437499, -0.439693, -2.132167, 0, 0, 0, 1, 1,
-0.4348114, 0.3134676, -2.237805, 0, 0, 0, 1, 1,
-0.4327426, 1.163023, -2.01277, 0, 0, 0, 1, 1,
-0.431859, 2.082891, 0.4184782, 1, 1, 1, 1, 1,
-0.4316267, -1.340014, -2.853075, 1, 1, 1, 1, 1,
-0.4200047, 0.4237955, 0.3303314, 1, 1, 1, 1, 1,
-0.4192966, -0.005510384, -1.949485, 1, 1, 1, 1, 1,
-0.4184287, -0.7220411, -4.271893, 1, 1, 1, 1, 1,
-0.413621, 1.607859, -0.1902188, 1, 1, 1, 1, 1,
-0.402292, 1.470212, -0.2378416, 1, 1, 1, 1, 1,
-0.4022647, -2.53103, -2.310702, 1, 1, 1, 1, 1,
-0.3999978, -0.7325867, -3.107829, 1, 1, 1, 1, 1,
-0.3964319, 0.2938953, 0.01849253, 1, 1, 1, 1, 1,
-0.3904002, -0.9158979, -3.17813, 1, 1, 1, 1, 1,
-0.389691, -0.4297205, -2.217329, 1, 1, 1, 1, 1,
-0.3885464, 1.978649, 1.480863, 1, 1, 1, 1, 1,
-0.387319, -0.4301148, -2.579621, 1, 1, 1, 1, 1,
-0.3829703, 0.4224804, 0.2709042, 1, 1, 1, 1, 1,
-0.3816278, -0.4464086, -0.8078268, 0, 0, 1, 1, 1,
-0.3797729, -0.7764152, -1.336905, 1, 0, 0, 1, 1,
-0.3793374, 1.043686, -0.3785717, 1, 0, 0, 1, 1,
-0.3675185, 1.500899, 1.401374, 1, 0, 0, 1, 1,
-0.367415, 0.9489865, -2.405019, 1, 0, 0, 1, 1,
-0.3643062, -0.2697098, -2.872124, 1, 0, 0, 1, 1,
-0.3615628, 1.113134, 0.08748407, 0, 0, 0, 1, 1,
-0.3601363, -0.7918931, -2.779593, 0, 0, 0, 1, 1,
-0.3589695, -0.2725511, -1.996381, 0, 0, 0, 1, 1,
-0.3558476, -1.008825, -2.533222, 0, 0, 0, 1, 1,
-0.3533986, -1.423704, -4.412633, 0, 0, 0, 1, 1,
-0.3466347, 0.2257888, -2.115477, 0, 0, 0, 1, 1,
-0.3463577, -0.3250241, -1.82318, 0, 0, 0, 1, 1,
-0.3455525, -1.460065, -2.075888, 1, 1, 1, 1, 1,
-0.3437099, -0.1667085, -2.86472, 1, 1, 1, 1, 1,
-0.3419727, 0.8903256, -1.280742, 1, 1, 1, 1, 1,
-0.3416106, 0.6013548, 0.1187942, 1, 1, 1, 1, 1,
-0.3388025, -0.8069121, -3.987522, 1, 1, 1, 1, 1,
-0.3356352, -1.667637, -3.351932, 1, 1, 1, 1, 1,
-0.333049, 0.8590589, 1.562581, 1, 1, 1, 1, 1,
-0.3289301, 1.325407, -1.736088, 1, 1, 1, 1, 1,
-0.3265422, 0.4609475, -1.530257, 1, 1, 1, 1, 1,
-0.3218253, -0.09985533, -0.2554898, 1, 1, 1, 1, 1,
-0.3180881, -0.3124308, -1.017785, 1, 1, 1, 1, 1,
-0.317833, 0.1887369, 1.077676, 1, 1, 1, 1, 1,
-0.3174293, -1.537473, -3.034187, 1, 1, 1, 1, 1,
-0.3090573, 1.381726, 0.5643675, 1, 1, 1, 1, 1,
-0.3084331, 0.3942623, -0.3775202, 1, 1, 1, 1, 1,
-0.3048326, 1.120571, -1.244765, 0, 0, 1, 1, 1,
-0.3017254, 0.9618159, -2.489969, 1, 0, 0, 1, 1,
-0.3001361, -0.781942, -3.552852, 1, 0, 0, 1, 1,
-0.2996864, -0.08571134, -1.453648, 1, 0, 0, 1, 1,
-0.2918887, -0.1143857, -1.385572, 1, 0, 0, 1, 1,
-0.2889203, 0.3100557, -1.030516, 1, 0, 0, 1, 1,
-0.2881038, 1.174685, -1.270279, 0, 0, 0, 1, 1,
-0.2799277, 0.277958, -0.2965668, 0, 0, 0, 1, 1,
-0.2783315, 1.940617, -0.1857231, 0, 0, 0, 1, 1,
-0.2763156, -0.6214554, -1.930617, 0, 0, 0, 1, 1,
-0.2754198, 0.6034395, 0.2151919, 0, 0, 0, 1, 1,
-0.270865, 0.2873987, -0.6635281, 0, 0, 0, 1, 1,
-0.2705692, 0.1716885, -0.7351508, 0, 0, 0, 1, 1,
-0.269738, 0.5334342, 0.0914505, 1, 1, 1, 1, 1,
-0.2684132, -0.9778629, -3.441362, 1, 1, 1, 1, 1,
-0.2549565, 1.173249, -0.7839566, 1, 1, 1, 1, 1,
-0.2532196, 0.8674195, -1.274252, 1, 1, 1, 1, 1,
-0.2491663, 0.2030375, -0.7186347, 1, 1, 1, 1, 1,
-0.2491319, 1.676756, -1.846091, 1, 1, 1, 1, 1,
-0.2484841, -0.9325225, -3.838686, 1, 1, 1, 1, 1,
-0.2445228, 0.2251329, -2.972835, 1, 1, 1, 1, 1,
-0.2372998, -0.1906572, -2.684892, 1, 1, 1, 1, 1,
-0.2360924, 0.7271416, -1.034761, 1, 1, 1, 1, 1,
-0.2338945, 1.549633, 1.280334, 1, 1, 1, 1, 1,
-0.2330733, 1.708458, 1.170291, 1, 1, 1, 1, 1,
-0.2305385, -1.443811, -3.51075, 1, 1, 1, 1, 1,
-0.2304924, 1.382799, -0.5902091, 1, 1, 1, 1, 1,
-0.2295096, 0.3434107, 0.8702074, 1, 1, 1, 1, 1,
-0.229276, 0.2960973, 0.331742, 0, 0, 1, 1, 1,
-0.227106, -0.5720453, -4.131896, 1, 0, 0, 1, 1,
-0.2186593, 0.1822367, -1.65051, 1, 0, 0, 1, 1,
-0.218015, 1.059274, 1.262933, 1, 0, 0, 1, 1,
-0.2159214, 0.9595913, -0.2165765, 1, 0, 0, 1, 1,
-0.2144969, 1.233808, -1.475148, 1, 0, 0, 1, 1,
-0.2093511, 1.448919, 0.302067, 0, 0, 0, 1, 1,
-0.2062747, -0.9885033, -4.08158, 0, 0, 0, 1, 1,
-0.2013251, -0.7891062, -1.469047, 0, 0, 0, 1, 1,
-0.2010753, -2.19032, -3.815287, 0, 0, 0, 1, 1,
-0.1968002, -0.7211417, -4.087084, 0, 0, 0, 1, 1,
-0.1955422, 0.3881615, 1.612329, 0, 0, 0, 1, 1,
-0.1945972, -0.6572393, -2.30877, 0, 0, 0, 1, 1,
-0.1896531, 0.9246351, -0.9674793, 1, 1, 1, 1, 1,
-0.1869185, 1.062641, -1.134976, 1, 1, 1, 1, 1,
-0.1837183, 0.8038837, -0.563455, 1, 1, 1, 1, 1,
-0.1833135, 0.6186342, -2.19719, 1, 1, 1, 1, 1,
-0.1807537, -0.069523, -3.776492, 1, 1, 1, 1, 1,
-0.1796425, -0.0616214, -1.207812, 1, 1, 1, 1, 1,
-0.1776244, 0.3883452, -2.056717, 1, 1, 1, 1, 1,
-0.1776184, -1.407754, -2.585789, 1, 1, 1, 1, 1,
-0.1725482, 1.651918, 0.2873269, 1, 1, 1, 1, 1,
-0.1712787, 0.3985831, -1.333382, 1, 1, 1, 1, 1,
-0.1665757, 1.126629, -0.2170332, 1, 1, 1, 1, 1,
-0.1657441, 0.6011034, -0.2204841, 1, 1, 1, 1, 1,
-0.1655463, -0.803427, -3.705404, 1, 1, 1, 1, 1,
-0.164608, -0.8492813, -1.914284, 1, 1, 1, 1, 1,
-0.1635583, -0.2721771, -2.264906, 1, 1, 1, 1, 1,
-0.1558886, -0.6800262, -5.132086, 0, 0, 1, 1, 1,
-0.1545936, 1.187568, -0.9677787, 1, 0, 0, 1, 1,
-0.153494, -0.613344, -3.241751, 1, 0, 0, 1, 1,
-0.1529267, 1.486316, 2.264455, 1, 0, 0, 1, 1,
-0.1494636, 1.424208, 0.1888017, 1, 0, 0, 1, 1,
-0.1487183, 0.8226586, -0.9673869, 1, 0, 0, 1, 1,
-0.1449854, -1.524325, -4.096818, 0, 0, 0, 1, 1,
-0.1422426, -0.627009, -4.797047, 0, 0, 0, 1, 1,
-0.1397604, 1.333576, -0.1140266, 0, 0, 0, 1, 1,
-0.1362588, 0.2124949, -1.019004, 0, 0, 0, 1, 1,
-0.1360202, -1.658351, -3.483468, 0, 0, 0, 1, 1,
-0.1257708, -0.8884184, -2.626124, 0, 0, 0, 1, 1,
-0.1232734, -1.542078, -4.346188, 0, 0, 0, 1, 1,
-0.1227371, -0.5429169, -1.282895, 1, 1, 1, 1, 1,
-0.1157011, 0.5704815, 0.3490487, 1, 1, 1, 1, 1,
-0.1129728, 0.2882479, 0.1479484, 1, 1, 1, 1, 1,
-0.1097396, -0.04105012, -2.375881, 1, 1, 1, 1, 1,
-0.1088463, 2.790937, 0.2141841, 1, 1, 1, 1, 1,
-0.1081816, 1.170803, 1.233272, 1, 1, 1, 1, 1,
-0.1074212, -1.267384, -3.251419, 1, 1, 1, 1, 1,
-0.102781, -0.2262502, -4.147983, 1, 1, 1, 1, 1,
-0.09981141, -2.382185, -4.737794, 1, 1, 1, 1, 1,
-0.09816449, -0.3598403, -2.47503, 1, 1, 1, 1, 1,
-0.09815777, -0.742604, -2.612396, 1, 1, 1, 1, 1,
-0.09662683, -0.5653995, -4.42277, 1, 1, 1, 1, 1,
-0.096391, 0.03829536, -1.019681, 1, 1, 1, 1, 1,
-0.09358755, 0.1692944, 0.7150692, 1, 1, 1, 1, 1,
-0.08860923, 0.05046609, -1.875983, 1, 1, 1, 1, 1,
-0.08653901, 1.461318, 0.08027747, 0, 0, 1, 1, 1,
-0.08540785, 0.429817, -1.223387, 1, 0, 0, 1, 1,
-0.08259454, -0.780171, -1.225394, 1, 0, 0, 1, 1,
-0.08133996, -0.8162159, -2.532543, 1, 0, 0, 1, 1,
-0.08008298, -1.338836, -4.071696, 1, 0, 0, 1, 1,
-0.07903434, -0.4331531, -2.302748, 1, 0, 0, 1, 1,
-0.07857063, -0.5786505, -1.808958, 0, 0, 0, 1, 1,
-0.07782567, -1.239897, -3.116353, 0, 0, 0, 1, 1,
-0.07606865, -0.04224254, -3.034099, 0, 0, 0, 1, 1,
-0.07585228, 0.2810826, -0.651103, 0, 0, 0, 1, 1,
-0.07383901, 0.9862898, -1.22266, 0, 0, 0, 1, 1,
-0.07029099, -0.2508026, -2.487712, 0, 0, 0, 1, 1,
-0.07010404, -0.21945, -2.753835, 0, 0, 0, 1, 1,
-0.06296798, 0.2220363, 0.1730148, 1, 1, 1, 1, 1,
-0.06079081, 0.3153066, -1.647051, 1, 1, 1, 1, 1,
-0.06030246, 0.5278516, -0.003352714, 1, 1, 1, 1, 1,
-0.05983644, 1.190996, -0.5315565, 1, 1, 1, 1, 1,
-0.0563331, -1.413332, -4.275383, 1, 1, 1, 1, 1,
-0.05498274, -0.1501918, -2.555028, 1, 1, 1, 1, 1,
-0.05397953, 1.004699, -0.8256267, 1, 1, 1, 1, 1,
-0.04951311, -0.4380072, -3.765388, 1, 1, 1, 1, 1,
-0.04824147, 0.5643634, -0.9516124, 1, 1, 1, 1, 1,
-0.04668951, -0.4922522, -0.5024954, 1, 1, 1, 1, 1,
-0.04322264, -0.9799086, -4.203474, 1, 1, 1, 1, 1,
-0.04101126, -1.52757, -3.436201, 1, 1, 1, 1, 1,
-0.04071096, 1.711689, 1.183395, 1, 1, 1, 1, 1,
-0.0395328, 0.8423175, -0.330213, 1, 1, 1, 1, 1,
-0.03215795, 0.3482573, -0.1468736, 1, 1, 1, 1, 1,
-0.03210277, 0.7873672, 2.136073, 0, 0, 1, 1, 1,
-0.0318539, 1.057041, -0.4162528, 1, 0, 0, 1, 1,
-0.02980398, -0.1867635, -3.606057, 1, 0, 0, 1, 1,
-0.02562007, -0.5502955, -5.02027, 1, 0, 0, 1, 1,
-0.02312649, -0.9605986, -4.820206, 1, 0, 0, 1, 1,
-0.01829178, -0.376106, -1.974918, 1, 0, 0, 1, 1,
-0.01824731, 0.1408679, -1.981082, 0, 0, 0, 1, 1,
-0.01634905, 0.02099632, -0.7048141, 0, 0, 0, 1, 1,
-0.01354205, -0.3554115, -4.589565, 0, 0, 0, 1, 1,
-0.01351304, 1.997398, 0.4021874, 0, 0, 0, 1, 1,
0.0003078, -1.136696, 3.040591, 0, 0, 0, 1, 1,
0.007086939, -0.03775264, 2.388594, 0, 0, 0, 1, 1,
0.008019368, 0.2170513, -2.063896, 0, 0, 0, 1, 1,
0.0134386, -0.288371, 3.864809, 1, 1, 1, 1, 1,
0.01525336, 0.08441224, 0.4263147, 1, 1, 1, 1, 1,
0.01585939, -1.47719, 3.576597, 1, 1, 1, 1, 1,
0.01616876, -0.9813187, 3.457036, 1, 1, 1, 1, 1,
0.02213537, 2.693387, 1.052348, 1, 1, 1, 1, 1,
0.02457203, 1.115989, -0.6271917, 1, 1, 1, 1, 1,
0.02469648, -0.5497949, 2.071174, 1, 1, 1, 1, 1,
0.03207228, -0.06612372, 3.250586, 1, 1, 1, 1, 1,
0.03751979, 0.8988832, -0.5157316, 1, 1, 1, 1, 1,
0.0379264, 0.2825615, 1.374478, 1, 1, 1, 1, 1,
0.04862375, -0.3079941, 3.458119, 1, 1, 1, 1, 1,
0.04904361, 0.6820428, -0.2265538, 1, 1, 1, 1, 1,
0.05107323, -0.04136663, -0.5140303, 1, 1, 1, 1, 1,
0.05519665, -0.5259601, 3.642694, 1, 1, 1, 1, 1,
0.05871475, -0.7848276, 2.71972, 1, 1, 1, 1, 1,
0.05960581, -0.8444772, 2.601087, 0, 0, 1, 1, 1,
0.06220532, 0.1960497, 1.376717, 1, 0, 0, 1, 1,
0.06228997, -0.9262727, 3.695553, 1, 0, 0, 1, 1,
0.06606162, -0.3098912, 3.604052, 1, 0, 0, 1, 1,
0.06976303, 0.00362215, 1.313594, 1, 0, 0, 1, 1,
0.07029668, 0.18058, 1.111753, 1, 0, 0, 1, 1,
0.07308626, 0.7925551, 0.4090253, 0, 0, 0, 1, 1,
0.0734276, 1.267689, -1.182981, 0, 0, 0, 1, 1,
0.07446191, 0.8227767, -0.6689919, 0, 0, 0, 1, 1,
0.07579976, 0.9498394, 2.002324, 0, 0, 0, 1, 1,
0.07734686, -0.0235973, 0.8382502, 0, 0, 0, 1, 1,
0.07762981, -1.636118, 2.945338, 0, 0, 0, 1, 1,
0.08161046, -0.5782446, 2.830798, 0, 0, 0, 1, 1,
0.08183362, -0.3425465, 3.025665, 1, 1, 1, 1, 1,
0.08389022, 0.487449, -0.611386, 1, 1, 1, 1, 1,
0.08528981, -0.7029636, 1.537006, 1, 1, 1, 1, 1,
0.08586948, 0.07555699, 0.2327964, 1, 1, 1, 1, 1,
0.08899524, 0.4526397, -1.485224, 1, 1, 1, 1, 1,
0.08923867, 1.692786, -0.387014, 1, 1, 1, 1, 1,
0.09431408, 1.03373, 0.153641, 1, 1, 1, 1, 1,
0.0991244, -0.4052927, 1.938286, 1, 1, 1, 1, 1,
0.09948348, -1.064345, 2.806207, 1, 1, 1, 1, 1,
0.1002095, 0.7945666, -1.135351, 1, 1, 1, 1, 1,
0.1052571, 1.170834, 1.229899, 1, 1, 1, 1, 1,
0.1135485, 0.06286158, 0.2058135, 1, 1, 1, 1, 1,
0.1148965, -1.787118, 4.033002, 1, 1, 1, 1, 1,
0.118907, 1.055984, 0.5198494, 1, 1, 1, 1, 1,
0.1190428, -1.164816, 3.063247, 1, 1, 1, 1, 1,
0.1212835, -0.8991508, 4.253953, 0, 0, 1, 1, 1,
0.1215752, 0.227767, 0.7689158, 1, 0, 0, 1, 1,
0.124899, 1.477292, -0.6769609, 1, 0, 0, 1, 1,
0.129289, -0.8302083, 2.607522, 1, 0, 0, 1, 1,
0.1330254, 0.06686297, 0.4588217, 1, 0, 0, 1, 1,
0.1334771, 0.4827155, 0.155067, 1, 0, 0, 1, 1,
0.1335919, 0.1529929, 0.4285063, 0, 0, 0, 1, 1,
0.138213, -0.5536543, 1.462194, 0, 0, 0, 1, 1,
0.146533, -1.603459, 4.185314, 0, 0, 0, 1, 1,
0.1472213, 0.8884985, -0.7005773, 0, 0, 0, 1, 1,
0.1489291, 1.04666, -1.136751, 0, 0, 0, 1, 1,
0.1518002, 0.09367916, -0.6691923, 0, 0, 0, 1, 1,
0.1526601, -1.796552, 3.219529, 0, 0, 0, 1, 1,
0.1527391, 0.7769526, 1.465056, 1, 1, 1, 1, 1,
0.1553027, -1.071173, 3.26, 1, 1, 1, 1, 1,
0.1580271, -0.3781161, 2.525566, 1, 1, 1, 1, 1,
0.15922, -1.339153, 4.055143, 1, 1, 1, 1, 1,
0.1619977, 1.755431, 0.778389, 1, 1, 1, 1, 1,
0.1624092, -1.124904, 3.134411, 1, 1, 1, 1, 1,
0.1644372, 0.6217581, -0.09704753, 1, 1, 1, 1, 1,
0.1663296, 0.2476074, 0.8926739, 1, 1, 1, 1, 1,
0.1693371, 1.689058, 0.2556167, 1, 1, 1, 1, 1,
0.1723616, 0.9892946, -0.4229538, 1, 1, 1, 1, 1,
0.1758866, -0.2189403, 3.897741, 1, 1, 1, 1, 1,
0.1760024, 2.735907, 1.491367, 1, 1, 1, 1, 1,
0.1771206, -0.8717771, 2.442397, 1, 1, 1, 1, 1,
0.1856978, 0.4919702, 0.9998059, 1, 1, 1, 1, 1,
0.1872645, -2.026954, 2.918929, 1, 1, 1, 1, 1,
0.1907775, -0.8724568, 4.836679, 0, 0, 1, 1, 1,
0.19106, -1.614969, 4.029421, 1, 0, 0, 1, 1,
0.1922051, 0.09865064, 2.510319, 1, 0, 0, 1, 1,
0.1928404, -0.181817, 2.196234, 1, 0, 0, 1, 1,
0.1952762, -0.9765593, 2.373339, 1, 0, 0, 1, 1,
0.1957017, -1.273385, 5.992225, 1, 0, 0, 1, 1,
0.1960127, 3.008166, -0.6586924, 0, 0, 0, 1, 1,
0.1966467, -0.3710251, 3.006835, 0, 0, 0, 1, 1,
0.1977606, -0.9294776, 4.825135, 0, 0, 0, 1, 1,
0.1979277, -1.738684, 3.909438, 0, 0, 0, 1, 1,
0.1986392, -0.2866137, 3.044131, 0, 0, 0, 1, 1,
0.1990553, -1.171715, 4.460989, 0, 0, 0, 1, 1,
0.1992438, 0.8366712, -0.5653909, 0, 0, 0, 1, 1,
0.2007095, -2.729582, 3.402195, 1, 1, 1, 1, 1,
0.2040567, 0.7912154, -1.434762, 1, 1, 1, 1, 1,
0.2092644, -1.56635, 3.584936, 1, 1, 1, 1, 1,
0.2101106, -0.451278, 1.88104, 1, 1, 1, 1, 1,
0.2135424, 1.356435, -0.2433233, 1, 1, 1, 1, 1,
0.214286, 1.108148, 0.5984075, 1, 1, 1, 1, 1,
0.2153364, 2.274189, 0.7518367, 1, 1, 1, 1, 1,
0.2156205, 1.418351, -1.489222, 1, 1, 1, 1, 1,
0.2172552, 0.05418574, 3.212455, 1, 1, 1, 1, 1,
0.2187426, -0.4356686, 3.019481, 1, 1, 1, 1, 1,
0.2204766, -0.07677905, 1.780576, 1, 1, 1, 1, 1,
0.2207083, 0.8575016, 0.6411689, 1, 1, 1, 1, 1,
0.2212307, -0.6776082, 3.147887, 1, 1, 1, 1, 1,
0.2268545, -0.5428906, 4.832829, 1, 1, 1, 1, 1,
0.2279472, 0.121674, 1.287787, 1, 1, 1, 1, 1,
0.2309694, 1.217956, 0.5079335, 0, 0, 1, 1, 1,
0.2315388, 0.2948434, 1.7169, 1, 0, 0, 1, 1,
0.2328905, -1.371337, 1.336839, 1, 0, 0, 1, 1,
0.2330202, 0.7722814, -1.046148, 1, 0, 0, 1, 1,
0.2339397, -0.3685978, 2.620149, 1, 0, 0, 1, 1,
0.2352316, -0.1044418, 2.09346, 1, 0, 0, 1, 1,
0.2370179, 1.27501, 1.296125, 0, 0, 0, 1, 1,
0.2394806, 1.421668, 1.039244, 0, 0, 0, 1, 1,
0.2413663, 0.06331221, 1.277854, 0, 0, 0, 1, 1,
0.2445483, 0.8210462, 1.016781, 0, 0, 0, 1, 1,
0.2457618, -0.7196388, 3.354457, 0, 0, 0, 1, 1,
0.2470402, -0.6023818, 2.475191, 0, 0, 0, 1, 1,
0.2474327, -0.5492828, 0.7479225, 0, 0, 0, 1, 1,
0.248887, 0.2407949, 1.037066, 1, 1, 1, 1, 1,
0.2499219, 1.537604, -0.784431, 1, 1, 1, 1, 1,
0.2554794, 0.712321, 0.0997813, 1, 1, 1, 1, 1,
0.2562584, -0.6488331, 1.768422, 1, 1, 1, 1, 1,
0.2565291, 0.826394, 0.3538001, 1, 1, 1, 1, 1,
0.2584528, -1.347979, 2.250395, 1, 1, 1, 1, 1,
0.2612263, -0.2231178, 0.4330985, 1, 1, 1, 1, 1,
0.2633182, -0.29296, 1.475257, 1, 1, 1, 1, 1,
0.2642258, 0.7097624, -1.537097, 1, 1, 1, 1, 1,
0.2676895, 0.00245634, 2.64827, 1, 1, 1, 1, 1,
0.2689706, -0.3908208, 2.691901, 1, 1, 1, 1, 1,
0.2700304, -0.4258335, 2.37272, 1, 1, 1, 1, 1,
0.270804, -1.266498, 2.154663, 1, 1, 1, 1, 1,
0.2750411, 0.2070064, 1.025104, 1, 1, 1, 1, 1,
0.2753162, 0.7564746, 1.773163, 1, 1, 1, 1, 1,
0.2784999, 2.165962, 0.8755689, 0, 0, 1, 1, 1,
0.2786842, -0.9455528, 3.486435, 1, 0, 0, 1, 1,
0.2796295, 1.821753, -1.20226, 1, 0, 0, 1, 1,
0.2802044, 0.3300934, 0.9377107, 1, 0, 0, 1, 1,
0.281949, -1.481151, 2.637056, 1, 0, 0, 1, 1,
0.2883739, 0.739386, 0.08329885, 1, 0, 0, 1, 1,
0.2927051, 0.5978289, 0.3986192, 0, 0, 0, 1, 1,
0.2976112, -1.048151, 3.778928, 0, 0, 0, 1, 1,
0.3004704, 2.01055, 0.7302004, 0, 0, 0, 1, 1,
0.3033464, -0.2488126, 2.781555, 0, 0, 0, 1, 1,
0.3036802, -0.7207103, 2.892488, 0, 0, 0, 1, 1,
0.312876, 2.25071, 1.013142, 0, 0, 0, 1, 1,
0.3151878, -0.7230688, 2.075255, 0, 0, 0, 1, 1,
0.3151918, -1.38127, 2.610826, 1, 1, 1, 1, 1,
0.3158806, 1.282301, 0.563524, 1, 1, 1, 1, 1,
0.3258452, 0.4318542, 1.608863, 1, 1, 1, 1, 1,
0.3307532, 0.06243171, 3.089239, 1, 1, 1, 1, 1,
0.3311292, -0.6457171, 2.696589, 1, 1, 1, 1, 1,
0.3327506, -1.770429, 3.360476, 1, 1, 1, 1, 1,
0.3331999, 2.143854, 1.556288, 1, 1, 1, 1, 1,
0.3349279, 0.4671321, 0.02479147, 1, 1, 1, 1, 1,
0.3392594, 1.363457, 1.235491, 1, 1, 1, 1, 1,
0.3403175, 0.3946061, 1.086442, 1, 1, 1, 1, 1,
0.3406448, 0.4515969, 2.015082, 1, 1, 1, 1, 1,
0.3420646, 0.03614858, 3.656369, 1, 1, 1, 1, 1,
0.3451412, 0.7049506, -0.2038081, 1, 1, 1, 1, 1,
0.3452467, -2.062366, 1.935617, 1, 1, 1, 1, 1,
0.3473715, -0.08370704, 1.331432, 1, 1, 1, 1, 1,
0.3482962, 0.1789107, 2.295495, 0, 0, 1, 1, 1,
0.3483436, -1.611897, 3.285042, 1, 0, 0, 1, 1,
0.3497114, 0.003534815, -2.944907, 1, 0, 0, 1, 1,
0.3501087, -0.04705191, 1.355798, 1, 0, 0, 1, 1,
0.3553155, 1.286899, -1.259942, 1, 0, 0, 1, 1,
0.3595487, -0.7120057, 1.659677, 1, 0, 0, 1, 1,
0.3649724, 2.155743, 0.604917, 0, 0, 0, 1, 1,
0.3652075, 0.5450892, 2.39705, 0, 0, 0, 1, 1,
0.3662388, 0.9084721, 0.9130628, 0, 0, 0, 1, 1,
0.3698131, -1.555142, 3.636416, 0, 0, 0, 1, 1,
0.3722172, -0.4861074, 3.069833, 0, 0, 0, 1, 1,
0.3738524, -0.7024161, 1.485744, 0, 0, 0, 1, 1,
0.3760242, -0.5986933, 3.164885, 0, 0, 0, 1, 1,
0.380539, 0.4419059, 2.0698, 1, 1, 1, 1, 1,
0.3833589, -0.5367841, 3.100199, 1, 1, 1, 1, 1,
0.3855874, 0.4247524, 0.1024103, 1, 1, 1, 1, 1,
0.3897582, 0.795092, 0.788137, 1, 1, 1, 1, 1,
0.3950908, 0.4625628, -1.332865, 1, 1, 1, 1, 1,
0.4010728, 0.9761428, 1.025579, 1, 1, 1, 1, 1,
0.4011923, -0.9542504, 2.340587, 1, 1, 1, 1, 1,
0.4038526, -0.008444439, 1.079716, 1, 1, 1, 1, 1,
0.4068345, 0.877569, -0.4469784, 1, 1, 1, 1, 1,
0.4106098, 0.4238661, 3.155578, 1, 1, 1, 1, 1,
0.4132568, -0.1314446, 3.174284, 1, 1, 1, 1, 1,
0.414359, 0.3860051, 2.875892, 1, 1, 1, 1, 1,
0.4154071, 0.38208, 0.6063668, 1, 1, 1, 1, 1,
0.4172292, -0.9517437, 1.651107, 1, 1, 1, 1, 1,
0.418968, 0.9204597, 0.3105901, 1, 1, 1, 1, 1,
0.4201643, -0.05490352, 2.202241, 0, 0, 1, 1, 1,
0.420182, -1.614486, 1.011591, 1, 0, 0, 1, 1,
0.4214978, 0.9131519, -0.4551154, 1, 0, 0, 1, 1,
0.4217481, 0.7333897, 0.9573681, 1, 0, 0, 1, 1,
0.4248061, 0.1298852, 1.674676, 1, 0, 0, 1, 1,
0.4262614, -1.477109, 2.300608, 1, 0, 0, 1, 1,
0.4313083, -1.872828, 4.424767, 0, 0, 0, 1, 1,
0.4332735, 0.455119, 3.145792, 0, 0, 0, 1, 1,
0.4344155, -0.6203519, 2.738729, 0, 0, 0, 1, 1,
0.4392853, 0.5201903, 0.8461096, 0, 0, 0, 1, 1,
0.440968, 2.078219, -0.05589863, 0, 0, 0, 1, 1,
0.444925, -1.242354, 2.131891, 0, 0, 0, 1, 1,
0.4482759, 0.4357317, 0.5484381, 0, 0, 0, 1, 1,
0.4573162, 1.312982, 0.7326096, 1, 1, 1, 1, 1,
0.4578474, 0.2814229, 2.721944, 1, 1, 1, 1, 1,
0.4591495, -0.2569521, -0.06134342, 1, 1, 1, 1, 1,
0.4600302, -1.842753, 3.097636, 1, 1, 1, 1, 1,
0.4669455, -0.5342733, 3.028039, 1, 1, 1, 1, 1,
0.4737123, -0.1699015, 2.248807, 1, 1, 1, 1, 1,
0.4757464, -2.048593, 4.23672, 1, 1, 1, 1, 1,
0.477431, 0.3340808, -0.7445208, 1, 1, 1, 1, 1,
0.4804665, 0.1905678, 0.3295958, 1, 1, 1, 1, 1,
0.4819831, -0.9599015, 2.187175, 1, 1, 1, 1, 1,
0.4909374, -1.628363, 3.040398, 1, 1, 1, 1, 1,
0.4920875, -1.164598, 4.318233, 1, 1, 1, 1, 1,
0.4989805, -0.7781208, 3.105967, 1, 1, 1, 1, 1,
0.4999003, -0.9644045, 2.555585, 1, 1, 1, 1, 1,
0.5005033, 1.04725, -1.609831, 1, 1, 1, 1, 1,
0.500757, 0.004748294, 1.191319, 0, 0, 1, 1, 1,
0.5046323, 0.6271247, -0.208846, 1, 0, 0, 1, 1,
0.5099759, -0.1701751, 0.7643185, 1, 0, 0, 1, 1,
0.5100622, 0.871951, 0.6874084, 1, 0, 0, 1, 1,
0.5122539, 0.7058393, 1.267431, 1, 0, 0, 1, 1,
0.5158386, 0.7537897, 2.664794, 1, 0, 0, 1, 1,
0.5168713, -0.7086618, 2.910874, 0, 0, 0, 1, 1,
0.5173157, 0.5398169, 2.816262, 0, 0, 0, 1, 1,
0.5213147, -0.5805733, 2.426341, 0, 0, 0, 1, 1,
0.5255257, -0.8580555, 2.872574, 0, 0, 0, 1, 1,
0.529434, -0.2218201, 1.059033, 0, 0, 0, 1, 1,
0.5338756, 0.08796963, 1.719465, 0, 0, 0, 1, 1,
0.5357236, -1.162513, 1.844159, 0, 0, 0, 1, 1,
0.5382631, 0.4444396, 1.250131, 1, 1, 1, 1, 1,
0.539211, 0.4741405, 0.355146, 1, 1, 1, 1, 1,
0.5420462, -0.4578462, 1.613179, 1, 1, 1, 1, 1,
0.5460837, 0.3743083, 0.7808834, 1, 1, 1, 1, 1,
0.5542404, 0.152045, 0.7454201, 1, 1, 1, 1, 1,
0.5542594, -0.4733996, 2.952104, 1, 1, 1, 1, 1,
0.5556856, 0.9063341, -0.2251507, 1, 1, 1, 1, 1,
0.5582766, -1.126123, 2.771244, 1, 1, 1, 1, 1,
0.5585924, -0.7933044, 3.288383, 1, 1, 1, 1, 1,
0.5620168, 0.2005685, 1.748412, 1, 1, 1, 1, 1,
0.5638931, 0.540585, -0.7019925, 1, 1, 1, 1, 1,
0.5687077, 0.3870698, 0.3167238, 1, 1, 1, 1, 1,
0.5719954, -0.7170115, 1.870957, 1, 1, 1, 1, 1,
0.5734842, 0.3840746, 1.090717, 1, 1, 1, 1, 1,
0.5757065, 1.165169, -0.7926231, 1, 1, 1, 1, 1,
0.581504, 0.6157066, 1.256814, 0, 0, 1, 1, 1,
0.5827411, -0.6669434, 2.65402, 1, 0, 0, 1, 1,
0.5838158, 0.7329962, 2.319108, 1, 0, 0, 1, 1,
0.5936478, 0.8779936, 0.004193108, 1, 0, 0, 1, 1,
0.5945723, -1.296955, 0.9786582, 1, 0, 0, 1, 1,
0.595128, -0.1840967, 2.398629, 1, 0, 0, 1, 1,
0.6012201, 0.5503839, -0.7653641, 0, 0, 0, 1, 1,
0.6032462, 1.077152, -0.2709481, 0, 0, 0, 1, 1,
0.6071976, -1.055932, 1.849621, 0, 0, 0, 1, 1,
0.6091649, 0.4503492, -0.2427716, 0, 0, 0, 1, 1,
0.616892, -0.6014042, 1.64652, 0, 0, 0, 1, 1,
0.6216363, -1.260681, 1.465419, 0, 0, 0, 1, 1,
0.6236255, 0.4070964, 0.5084236, 0, 0, 0, 1, 1,
0.6236842, -1.842722, 1.835354, 1, 1, 1, 1, 1,
0.6248565, -0.2483008, 3.136856, 1, 1, 1, 1, 1,
0.627103, -1.396937, 2.278008, 1, 1, 1, 1, 1,
0.6302668, -1.110851, 3.643978, 1, 1, 1, 1, 1,
0.6347939, -0.2090996, 3.555828, 1, 1, 1, 1, 1,
0.6407948, -0.4656922, 2.391659, 1, 1, 1, 1, 1,
0.6457011, 1.707355, 0.9779685, 1, 1, 1, 1, 1,
0.6518757, 1.8768, -0.3073407, 1, 1, 1, 1, 1,
0.6599262, -0.5949596, 2.668016, 1, 1, 1, 1, 1,
0.6617929, 0.1087812, 0.9929363, 1, 1, 1, 1, 1,
0.6661761, 0.08456855, -0.5539286, 1, 1, 1, 1, 1,
0.6669388, -0.5797698, 2.380661, 1, 1, 1, 1, 1,
0.6681181, -1.128431, 4.592795, 1, 1, 1, 1, 1,
0.6700161, 0.2309739, -0.2393613, 1, 1, 1, 1, 1,
0.6728862, 0.1538293, 0.2888421, 1, 1, 1, 1, 1,
0.6730187, 0.112872, 0.5704077, 0, 0, 1, 1, 1,
0.6732087, -1.250822, 2.283843, 1, 0, 0, 1, 1,
0.676064, 1.57571, 1.12815, 1, 0, 0, 1, 1,
0.677572, 0.1514612, 1.524903, 1, 0, 0, 1, 1,
0.6812425, 0.9441007, 1.013628, 1, 0, 0, 1, 1,
0.6828431, 1.035553, -1.476381, 1, 0, 0, 1, 1,
0.6844851, -0.6207728, 2.916813, 0, 0, 0, 1, 1,
0.6900085, 1.03305, -0.7709018, 0, 0, 0, 1, 1,
0.6932904, 0.5220201, 0.9303429, 0, 0, 0, 1, 1,
0.6946142, 1.226861, -1.467303, 0, 0, 0, 1, 1,
0.6946478, 1.449119, -0.7894003, 0, 0, 0, 1, 1,
0.695848, -0.00456553, 1.628715, 0, 0, 0, 1, 1,
0.6971589, -0.2415743, 2.474302, 0, 0, 0, 1, 1,
0.6998218, 1.203132, -0.9174997, 1, 1, 1, 1, 1,
0.7029967, 1.641301, 0.2124301, 1, 1, 1, 1, 1,
0.7038825, -0.7250919, 3.932012, 1, 1, 1, 1, 1,
0.7079455, 1.242671, 1.155266, 1, 1, 1, 1, 1,
0.7103359, 1.854965, 1.541005, 1, 1, 1, 1, 1,
0.710595, 0.3751406, 1.653121, 1, 1, 1, 1, 1,
0.7176476, 0.2469248, 2.187775, 1, 1, 1, 1, 1,
0.7178181, 0.1394575, 0.8638985, 1, 1, 1, 1, 1,
0.7192597, 1.176976, 2.090312, 1, 1, 1, 1, 1,
0.7262542, -0.6609058, 2.632022, 1, 1, 1, 1, 1,
0.7272928, 0.08999709, 2.993412, 1, 1, 1, 1, 1,
0.7279037, -0.5741745, 2.13377, 1, 1, 1, 1, 1,
0.7282857, 1.256934, 0.5408761, 1, 1, 1, 1, 1,
0.7312336, 0.900367, 0.5094999, 1, 1, 1, 1, 1,
0.7318115, -2.678167, 1.562584, 1, 1, 1, 1, 1,
0.7368539, 0.02117216, 2.416125, 0, 0, 1, 1, 1,
0.7373409, -0.03288888, 2.998559, 1, 0, 0, 1, 1,
0.7467527, -0.5130842, 2.473351, 1, 0, 0, 1, 1,
0.7476712, -0.2916923, 1.955872, 1, 0, 0, 1, 1,
0.765504, -0.145654, 1.204425, 1, 0, 0, 1, 1,
0.7696413, -1.282013, 2.21735, 1, 0, 0, 1, 1,
0.7726693, 1.462549, -0.218099, 0, 0, 0, 1, 1,
0.7734336, -1.547071, 2.286247, 0, 0, 0, 1, 1,
0.777867, -0.7984432, 1.742305, 0, 0, 0, 1, 1,
0.7800497, 0.4365356, 0.2736012, 0, 0, 0, 1, 1,
0.7923997, -0.07309482, 1.467959, 0, 0, 0, 1, 1,
0.7939175, 0.9246898, 2.322859, 0, 0, 0, 1, 1,
0.7986672, -0.06749377, -0.03292821, 0, 0, 0, 1, 1,
0.8005419, -0.7201541, 3.192147, 1, 1, 1, 1, 1,
0.8099938, -0.7784004, 2.887244, 1, 1, 1, 1, 1,
0.8129209, -1.818328, 4.322573, 1, 1, 1, 1, 1,
0.8131342, -0.5379272, 2.51565, 1, 1, 1, 1, 1,
0.81594, 0.4935423, 1.475249, 1, 1, 1, 1, 1,
0.8177675, 0.5534079, -1.392812, 1, 1, 1, 1, 1,
0.8205843, 0.9439386, 1.585008, 1, 1, 1, 1, 1,
0.8361048, -0.4993592, 2.588396, 1, 1, 1, 1, 1,
0.8363535, -0.2529521, 1.36096, 1, 1, 1, 1, 1,
0.8399467, 0.6352891, 0.9160873, 1, 1, 1, 1, 1,
0.8496279, -0.7073478, 3.717961, 1, 1, 1, 1, 1,
0.8583176, 0.8153504, 0.2902222, 1, 1, 1, 1, 1,
0.8673454, -0.05878431, 1.622254, 1, 1, 1, 1, 1,
0.867947, -0.4218324, 2.128391, 1, 1, 1, 1, 1,
0.8753079, -0.02953896, 2.600183, 1, 1, 1, 1, 1,
0.8762401, -0.8242748, 2.454368, 0, 0, 1, 1, 1,
0.8765951, -1.562782, 2.034711, 1, 0, 0, 1, 1,
0.8837032, 1.575602, -0.3938008, 1, 0, 0, 1, 1,
0.892424, 0.2810366, -0.9367436, 1, 0, 0, 1, 1,
0.8948734, -0.5375465, -0.254727, 1, 0, 0, 1, 1,
0.89521, -0.732663, 2.424551, 1, 0, 0, 1, 1,
0.9023932, -0.8037114, 1.461944, 0, 0, 0, 1, 1,
0.9031852, -0.8133287, 4.904319, 0, 0, 0, 1, 1,
0.9044679, -0.5183886, 0.6962727, 0, 0, 0, 1, 1,
0.9046181, 1.505891, 0.1530344, 0, 0, 0, 1, 1,
0.9046674, 0.8266409, 1.958083, 0, 0, 0, 1, 1,
0.9051787, 1.564332, 1.132855, 0, 0, 0, 1, 1,
0.9085509, -1.723972, 2.586368, 0, 0, 0, 1, 1,
0.9087899, -2.159066, 2.050229, 1, 1, 1, 1, 1,
0.9166873, 1.556473, 0.2724287, 1, 1, 1, 1, 1,
0.9251584, -1.081444, 3.01153, 1, 1, 1, 1, 1,
0.928008, 0.7452747, -0.007215485, 1, 1, 1, 1, 1,
0.9280933, -0.02578819, 2.277468, 1, 1, 1, 1, 1,
0.9398448, 0.007755407, 2.152447, 1, 1, 1, 1, 1,
0.9466304, 0.7551987, 1.425817, 1, 1, 1, 1, 1,
0.95185, -1.701358, 2.374451, 1, 1, 1, 1, 1,
0.9600754, 0.1821055, 1.526468, 1, 1, 1, 1, 1,
0.9630352, 0.2159878, 1.626331, 1, 1, 1, 1, 1,
0.9653834, -0.2687055, 1.440616, 1, 1, 1, 1, 1,
0.9661019, -0.8902819, 1.184732, 1, 1, 1, 1, 1,
0.9893411, 0.4790128, 0.524408, 1, 1, 1, 1, 1,
0.9895781, 0.7770725, 1.627611, 1, 1, 1, 1, 1,
0.990223, 0.002448958, 1.360807, 1, 1, 1, 1, 1,
0.995488, 3.013532, 1.855297, 0, 0, 1, 1, 1,
0.9966527, 0.8787649, 1.440137, 1, 0, 0, 1, 1,
1.000953, 0.7582718, -0.177864, 1, 0, 0, 1, 1,
1.001043, -0.9611726, 2.33762, 1, 0, 0, 1, 1,
1.025638, 0.4115463, 2.962218, 1, 0, 0, 1, 1,
1.026, 0.08129872, 1.698147, 1, 0, 0, 1, 1,
1.02692, -1.197412, 1.454655, 0, 0, 0, 1, 1,
1.028419, -0.3376783, 2.590482, 0, 0, 0, 1, 1,
1.045081, -1.32129, 2.158548, 0, 0, 0, 1, 1,
1.052144, -0.1803056, 1.199465, 0, 0, 0, 1, 1,
1.054247, -0.4916639, 2.102885, 0, 0, 0, 1, 1,
1.055445, -0.2215156, 2.253243, 0, 0, 0, 1, 1,
1.060592, -1.471926, 2.326864, 0, 0, 0, 1, 1,
1.067357, -0.429377, 2.425107, 1, 1, 1, 1, 1,
1.089248, -0.9285355, 2.250825, 1, 1, 1, 1, 1,
1.092008, 1.265178, 0.388715, 1, 1, 1, 1, 1,
1.096926, 2.018667, -1.86773, 1, 1, 1, 1, 1,
1.116124, 0.8054006, 0.7739918, 1, 1, 1, 1, 1,
1.122986, 0.1207339, -0.6215143, 1, 1, 1, 1, 1,
1.123607, -1.768889, 2.853187, 1, 1, 1, 1, 1,
1.129881, 0.9289656, 0.1919418, 1, 1, 1, 1, 1,
1.13284, -1.556834, 2.290623, 1, 1, 1, 1, 1,
1.15104, -0.3788553, 0.1446004, 1, 1, 1, 1, 1,
1.159647, -0.5488158, 0.8546425, 1, 1, 1, 1, 1,
1.160571, 0.9828907, 0.9898885, 1, 1, 1, 1, 1,
1.163276, 0.5424815, 2.119138, 1, 1, 1, 1, 1,
1.16484, 1.30263, -1.711185, 1, 1, 1, 1, 1,
1.167776, 0.0817258, 1.795986, 1, 1, 1, 1, 1,
1.177771, 0.2355469, 0.7427394, 0, 0, 1, 1, 1,
1.178037, 0.8092529, -0.8417394, 1, 0, 0, 1, 1,
1.179318, 0.0962228, 1.95477, 1, 0, 0, 1, 1,
1.186092, -0.5415165, 1.41974, 1, 0, 0, 1, 1,
1.203265, 0.6451034, 2.891416, 1, 0, 0, 1, 1,
1.208993, -0.004358511, 1.784728, 1, 0, 0, 1, 1,
1.218684, 0.9411232, 0.9738119, 0, 0, 0, 1, 1,
1.226587, -1.366011, 2.763793, 0, 0, 0, 1, 1,
1.229553, -0.4985387, 2.964106, 0, 0, 0, 1, 1,
1.23188, 0.4367432, 1.567806, 0, 0, 0, 1, 1,
1.234329, 1.464017, 0.08920434, 0, 0, 0, 1, 1,
1.235837, -0.9341721, 2.943882, 0, 0, 0, 1, 1,
1.256253, -1.476193, 2.946248, 0, 0, 0, 1, 1,
1.257237, 1.212386, 0.255693, 1, 1, 1, 1, 1,
1.25853, 0.6568233, 0.06020976, 1, 1, 1, 1, 1,
1.262776, -0.8437497, 1.783452, 1, 1, 1, 1, 1,
1.275095, 0.01609495, -0.07343587, 1, 1, 1, 1, 1,
1.278557, 0.2588296, 1.68601, 1, 1, 1, 1, 1,
1.280737, 1.795633, 2.039734, 1, 1, 1, 1, 1,
1.281661, -0.3505994, 2.44548, 1, 1, 1, 1, 1,
1.282674, 0.03885315, 1.317596, 1, 1, 1, 1, 1,
1.291558, 2.985919, 0.1546189, 1, 1, 1, 1, 1,
1.294228, 0.2005754, -0.03489574, 1, 1, 1, 1, 1,
1.29856, 0.02885713, 2.273913, 1, 1, 1, 1, 1,
1.305788, -1.355789, 1.202464, 1, 1, 1, 1, 1,
1.318793, 0.7176578, 1.727188, 1, 1, 1, 1, 1,
1.320095, -0.7292691, 2.473076, 1, 1, 1, 1, 1,
1.327441, -1.657, 1.874875, 1, 1, 1, 1, 1,
1.330196, 1.080687, 1.053637, 0, 0, 1, 1, 1,
1.333556, -0.2015706, 1.138274, 1, 0, 0, 1, 1,
1.336739, -1.239434, 1.839899, 1, 0, 0, 1, 1,
1.339883, -1.945861, 1.261009, 1, 0, 0, 1, 1,
1.34658, -0.7440016, 0.09396199, 1, 0, 0, 1, 1,
1.348616, -0.1804563, 1.680898, 1, 0, 0, 1, 1,
1.349383, 1.292132, 0.3521203, 0, 0, 0, 1, 1,
1.351327, -1.108714, 2.283408, 0, 0, 0, 1, 1,
1.368182, -0.2173402, 1.244873, 0, 0, 0, 1, 1,
1.372183, 0.1108028, 1.309634, 0, 0, 0, 1, 1,
1.372376, -0.2014708, -0.5006278, 0, 0, 0, 1, 1,
1.378797, 1.079185, -0.09329446, 0, 0, 0, 1, 1,
1.379237, 1.739937, 1.799316, 0, 0, 0, 1, 1,
1.38202, 0.1666736, 0.9375748, 1, 1, 1, 1, 1,
1.398894, 0.4463076, 1.088163, 1, 1, 1, 1, 1,
1.4088, -0.722103, 1.382396, 1, 1, 1, 1, 1,
1.411829, 0.0433091, 0.4948027, 1, 1, 1, 1, 1,
1.418324, -0.4768929, 1.246314, 1, 1, 1, 1, 1,
1.43277, 2.238825, 0.07037329, 1, 1, 1, 1, 1,
1.432867, -0.3996845, 1.438832, 1, 1, 1, 1, 1,
1.447179, 1.043186, 0.3207406, 1, 1, 1, 1, 1,
1.44759, 1.373053, -0.4957507, 1, 1, 1, 1, 1,
1.44911, -0.4852842, 2.851958, 1, 1, 1, 1, 1,
1.453795, 1.724448, 1.452739, 1, 1, 1, 1, 1,
1.456054, 0.3218448, 0.9192581, 1, 1, 1, 1, 1,
1.46099, 0.7602958, 2.253952, 1, 1, 1, 1, 1,
1.461472, -0.07356728, 2.94782, 1, 1, 1, 1, 1,
1.466106, -0.1203832, 0.8149928, 1, 1, 1, 1, 1,
1.467684, -0.3617756, 2.819423, 0, 0, 1, 1, 1,
1.471732, 0.04845878, 2.984786, 1, 0, 0, 1, 1,
1.471736, -0.6589446, 1.079565, 1, 0, 0, 1, 1,
1.481285, 0.3472441, 1.102393, 1, 0, 0, 1, 1,
1.485268, 0.4483828, 3.055488, 1, 0, 0, 1, 1,
1.493017, 0.9050472, 2.721649, 1, 0, 0, 1, 1,
1.495106, 1.138073, 0.2406744, 0, 0, 0, 1, 1,
1.533916, 1.108448, 0.6269839, 0, 0, 0, 1, 1,
1.539381, 0.1413622, 1.952329, 0, 0, 0, 1, 1,
1.549574, -0.1469103, 2.516382, 0, 0, 0, 1, 1,
1.550695, 0.8425503, 2.044684, 0, 0, 0, 1, 1,
1.551353, 0.3029523, 0.03488673, 0, 0, 0, 1, 1,
1.572894, -0.9861464, 0.6503108, 0, 0, 0, 1, 1,
1.57856, 1.298132, 0.1482969, 1, 1, 1, 1, 1,
1.584226, -0.7308795, 1.116535, 1, 1, 1, 1, 1,
1.593184, -1.082447, 3.369184, 1, 1, 1, 1, 1,
1.605859, -0.482626, 0.7900981, 1, 1, 1, 1, 1,
1.612336, -1.554052, 2.143934, 1, 1, 1, 1, 1,
1.613794, -0.194188, 2.086541, 1, 1, 1, 1, 1,
1.624465, 0.06178044, 2.212908, 1, 1, 1, 1, 1,
1.626509, -0.8520169, 2.585151, 1, 1, 1, 1, 1,
1.631083, -0.4355694, 2.00264, 1, 1, 1, 1, 1,
1.65586, 0.846918, 0.06157004, 1, 1, 1, 1, 1,
1.656239, 1.263192, 1.306564, 1, 1, 1, 1, 1,
1.676359, 0.05761743, 2.621969, 1, 1, 1, 1, 1,
1.706342, 0.5948758, 1.845519, 1, 1, 1, 1, 1,
1.707494, 2.565846, -0.247594, 1, 1, 1, 1, 1,
1.730197, 1.069257, 1.402496, 1, 1, 1, 1, 1,
1.730655, -0.0177761, 1.800457, 0, 0, 1, 1, 1,
1.742545, -1.555314, 2.983704, 1, 0, 0, 1, 1,
1.756329, 0.5025912, 1.38152, 1, 0, 0, 1, 1,
1.772951, -1.072451, 2.545776, 1, 0, 0, 1, 1,
1.777503, 1.718122, 1.357233, 1, 0, 0, 1, 1,
1.779777, 1.905069, 0.4652512, 1, 0, 0, 1, 1,
1.786743, 0.1969343, 0.3533264, 0, 0, 0, 1, 1,
1.789013, 0.6846987, 1.086358, 0, 0, 0, 1, 1,
1.798007, -1.387641, 1.486491, 0, 0, 0, 1, 1,
1.833694, -0.09085754, 1.992836, 0, 0, 0, 1, 1,
1.844007, 0.4851908, 1.664875, 0, 0, 0, 1, 1,
1.862426, 1.486182, 0.4859399, 0, 0, 0, 1, 1,
1.863264, -1.399032, 1.495889, 0, 0, 0, 1, 1,
1.876474, 0.3245501, 2.013198, 1, 1, 1, 1, 1,
1.878478, -2.101743, 3.348701, 1, 1, 1, 1, 1,
1.879283, -0.6939657, 2.142002, 1, 1, 1, 1, 1,
1.879463, 1.035656, 1.761969, 1, 1, 1, 1, 1,
1.891459, 1.942933, 0.9118361, 1, 1, 1, 1, 1,
1.892265, 0.5959687, 2.523196, 1, 1, 1, 1, 1,
1.892378, -1.404486, 3.105543, 1, 1, 1, 1, 1,
1.91574, 0.6174281, 0.3442924, 1, 1, 1, 1, 1,
1.927248, 0.6747038, 0.9346007, 1, 1, 1, 1, 1,
1.963528, -0.8195987, 2.179666, 1, 1, 1, 1, 1,
1.991317, -0.2748214, 2.028385, 1, 1, 1, 1, 1,
1.991823, 0.995482, 0.7579831, 1, 1, 1, 1, 1,
2.046558, -0.307848, 1.516464, 1, 1, 1, 1, 1,
2.10217, -0.4739121, 1.53781, 1, 1, 1, 1, 1,
2.124347, -0.2747463, 2.737643, 1, 1, 1, 1, 1,
2.136763, -0.05131358, 2.653099, 0, 0, 1, 1, 1,
2.172377, 0.3363453, 1.981949, 1, 0, 0, 1, 1,
2.212867, -1.359381, 2.779902, 1, 0, 0, 1, 1,
2.21966, -0.3546818, 3.695131, 1, 0, 0, 1, 1,
2.242395, 0.2463444, 2.567316, 1, 0, 0, 1, 1,
2.258055, 0.5613146, 3.070661, 1, 0, 0, 1, 1,
2.266922, -0.1122821, -0.4124277, 0, 0, 0, 1, 1,
2.28352, -1.999599, 1.542987, 0, 0, 0, 1, 1,
2.328817, 0.3224322, 3.101599, 0, 0, 0, 1, 1,
2.339245, -0.01759572, 0.9221393, 0, 0, 0, 1, 1,
2.393508, -1.290034, 2.691323, 0, 0, 0, 1, 1,
2.411464, -1.074823, 1.096537, 0, 0, 0, 1, 1,
2.426302, -0.7485167, 1.811905, 0, 0, 0, 1, 1,
2.433858, 0.6712448, 2.062569, 1, 1, 1, 1, 1,
2.587935, -0.9581223, 1.963556, 1, 1, 1, 1, 1,
2.614491, 0.1546235, 1.651654, 1, 1, 1, 1, 1,
2.621593, 0.8679768, 1.491499, 1, 1, 1, 1, 1,
2.804518, -0.1357263, 1.65217, 1, 1, 1, 1, 1,
3.00576, -0.734718, 0.2957111, 1, 1, 1, 1, 1,
3.619013, -0.4132524, 1.695937, 1, 1, 1, 1, 1
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
var radius = 9.858444;
var distance = 34.62737;
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
mvMatrix.translate( -0.2070127, 0.2047369, -0.4300692 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.62737);
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