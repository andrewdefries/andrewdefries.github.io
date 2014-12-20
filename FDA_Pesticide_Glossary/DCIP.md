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
-2.880095, -0.7784649, -2.524076, 1, 0, 0, 1,
-2.803682, 0.8781681, -2.12458, 1, 0.007843138, 0, 1,
-2.543087, -0.446499, -0.7983484, 1, 0.01176471, 0, 1,
-2.518775, -0.5482496, -2.161067, 1, 0.01960784, 0, 1,
-2.495007, 0.355652, 0.2251053, 1, 0.02352941, 0, 1,
-2.463401, 0.9254949, -1.30924, 1, 0.03137255, 0, 1,
-2.460766, 0.9324067, -1.731223, 1, 0.03529412, 0, 1,
-2.363353, 1.464506, -0.6877461, 1, 0.04313726, 0, 1,
-2.324248, -0.9359783, -1.268918, 1, 0.04705882, 0, 1,
-2.308317, -0.40474, -2.970423, 1, 0.05490196, 0, 1,
-2.30417, 0.8589807, -0.2287192, 1, 0.05882353, 0, 1,
-2.261398, 0.3334207, -1.836064, 1, 0.06666667, 0, 1,
-2.238126, -1.302232, -2.192652, 1, 0.07058824, 0, 1,
-2.205523, 0.4043611, -1.635265, 1, 0.07843138, 0, 1,
-2.157196, -0.1885443, -2.865798, 1, 0.08235294, 0, 1,
-2.154872, 0.6314784, -0.883453, 1, 0.09019608, 0, 1,
-2.151839, -0.7481773, -0.7831045, 1, 0.09411765, 0, 1,
-2.129128, 0.1126491, -1.354769, 1, 0.1019608, 0, 1,
-2.102566, -1.690307, -2.727268, 1, 0.1098039, 0, 1,
-2.081456, 0.4226258, -2.879669, 1, 0.1137255, 0, 1,
-2.077513, 1.648843, -1.813042, 1, 0.1215686, 0, 1,
-2.068615, 0.6223241, -1.075721, 1, 0.1254902, 0, 1,
-2.061481, 1.688101, 0.603959, 1, 0.1333333, 0, 1,
-2.036774, 2.148312, -1.928568, 1, 0.1372549, 0, 1,
-1.998122, -0.6136432, -1.869164, 1, 0.145098, 0, 1,
-1.962302, -0.1911405, -1.567663, 1, 0.1490196, 0, 1,
-1.939772, 0.3410341, -1.676124, 1, 0.1568628, 0, 1,
-1.924277, -0.06452744, -2.080725, 1, 0.1607843, 0, 1,
-1.921826, -0.2216115, -0.5969095, 1, 0.1686275, 0, 1,
-1.920603, 0.5999738, 0.4351437, 1, 0.172549, 0, 1,
-1.89829, -1.147804, -1.825739, 1, 0.1803922, 0, 1,
-1.873783, 0.9362264, -1.637164, 1, 0.1843137, 0, 1,
-1.857919, 0.7102913, -1.857978, 1, 0.1921569, 0, 1,
-1.852103, 0.5815271, -1.454787, 1, 0.1960784, 0, 1,
-1.834969, -0.6419181, -1.962518, 1, 0.2039216, 0, 1,
-1.831065, -0.5784535, -2.333075, 1, 0.2117647, 0, 1,
-1.827803, 0.02560805, -0.1340224, 1, 0.2156863, 0, 1,
-1.797261, 0.6686849, 0.1393863, 1, 0.2235294, 0, 1,
-1.779537, 0.01231664, -1.77963, 1, 0.227451, 0, 1,
-1.76474, -0.3148375, -1.17258, 1, 0.2352941, 0, 1,
-1.755203, 0.1466266, -1.757078, 1, 0.2392157, 0, 1,
-1.734975, -1.464088, -2.293906, 1, 0.2470588, 0, 1,
-1.734094, -0.2587554, -1.541041, 1, 0.2509804, 0, 1,
-1.728638, -0.3829955, -2.583665, 1, 0.2588235, 0, 1,
-1.694696, 0.5295348, -3.004303, 1, 0.2627451, 0, 1,
-1.692852, -0.1840113, -0.147736, 1, 0.2705882, 0, 1,
-1.687166, 0.07560105, -0.01000374, 1, 0.2745098, 0, 1,
-1.677594, 2.197808, -1.58941, 1, 0.282353, 0, 1,
-1.675623, -2.201663, -3.243687, 1, 0.2862745, 0, 1,
-1.664126, -0.3454491, -1.653616, 1, 0.2941177, 0, 1,
-1.657265, -0.1649323, -2.533888, 1, 0.3019608, 0, 1,
-1.642982, 2.30089, -1.497379, 1, 0.3058824, 0, 1,
-1.632278, -0.4975621, -0.8631889, 1, 0.3137255, 0, 1,
-1.631545, -1.037505, -2.292553, 1, 0.3176471, 0, 1,
-1.630719, -0.4693485, -1.831345, 1, 0.3254902, 0, 1,
-1.620912, -1.417109, -3.58214, 1, 0.3294118, 0, 1,
-1.601143, -0.6652521, -1.967736, 1, 0.3372549, 0, 1,
-1.599549, 1.863328, -1.550189, 1, 0.3411765, 0, 1,
-1.598249, 0.02122279, -1.396924, 1, 0.3490196, 0, 1,
-1.581179, 0.8461301, -0.3264092, 1, 0.3529412, 0, 1,
-1.579378, -1.359282, -4.460948, 1, 0.3607843, 0, 1,
-1.569898, -0.008504761, -1.391885, 1, 0.3647059, 0, 1,
-1.543716, 0.4884719, -0.5907937, 1, 0.372549, 0, 1,
-1.532445, 0.3706738, -1.918043, 1, 0.3764706, 0, 1,
-1.530581, 2.485418, -1.164391, 1, 0.3843137, 0, 1,
-1.523453, -1.846529, -1.631939, 1, 0.3882353, 0, 1,
-1.514477, -1.229482, -4.342044, 1, 0.3960784, 0, 1,
-1.512739, 1.792202, -1.595661, 1, 0.4039216, 0, 1,
-1.511321, 0.8917401, -0.4881088, 1, 0.4078431, 0, 1,
-1.489809, 0.1134864, -0.8406885, 1, 0.4156863, 0, 1,
-1.485832, -0.5004098, -3.418071, 1, 0.4196078, 0, 1,
-1.477737, -0.3238989, -1.907191, 1, 0.427451, 0, 1,
-1.46957, 0.01368284, -0.6405677, 1, 0.4313726, 0, 1,
-1.466645, -0.06265834, -0.5691175, 1, 0.4392157, 0, 1,
-1.460379, -1.144281, -3.01087, 1, 0.4431373, 0, 1,
-1.447117, 1.192211, -0.2649432, 1, 0.4509804, 0, 1,
-1.439127, 0.008583987, -2.940861, 1, 0.454902, 0, 1,
-1.433022, -0.07023808, -1.999743, 1, 0.4627451, 0, 1,
-1.427089, -0.06805161, -0.681581, 1, 0.4666667, 0, 1,
-1.412699, -0.0001287311, -0.2709191, 1, 0.4745098, 0, 1,
-1.404787, 0.8494781, -2.862434, 1, 0.4784314, 0, 1,
-1.404001, 1.11952, -0.2407311, 1, 0.4862745, 0, 1,
-1.386028, -0.06736132, -1.047041, 1, 0.4901961, 0, 1,
-1.379673, 0.05359032, -1.740779, 1, 0.4980392, 0, 1,
-1.379642, -0.6480004, -1.252386, 1, 0.5058824, 0, 1,
-1.361287, 0.1743381, -1.144103, 1, 0.509804, 0, 1,
-1.352913, -0.1269932, -1.275434, 1, 0.5176471, 0, 1,
-1.338576, -1.516042, -2.372571, 1, 0.5215687, 0, 1,
-1.323159, 1.794774, -0.3247451, 1, 0.5294118, 0, 1,
-1.314666, 0.7938008, -0.952141, 1, 0.5333334, 0, 1,
-1.306445, -0.8828536, -2.265182, 1, 0.5411765, 0, 1,
-1.297236, 0.7730179, -0.3892201, 1, 0.5450981, 0, 1,
-1.295246, 0.4274933, -1.022877, 1, 0.5529412, 0, 1,
-1.292474, 2.581967, -0.6216866, 1, 0.5568628, 0, 1,
-1.28734, 0.5940251, 0.6620499, 1, 0.5647059, 0, 1,
-1.28607, 0.2193441, -1.609806, 1, 0.5686275, 0, 1,
-1.275373, 1.552085, -0.9613318, 1, 0.5764706, 0, 1,
-1.275246, 0.593311, -1.988532, 1, 0.5803922, 0, 1,
-1.267858, 0.2879565, -2.532788, 1, 0.5882353, 0, 1,
-1.243958, 0.1612775, -1.345291, 1, 0.5921569, 0, 1,
-1.234708, 0.2889647, -1.994357, 1, 0.6, 0, 1,
-1.233191, -2.229759, -2.968888, 1, 0.6078432, 0, 1,
-1.230601, 0.06343167, -1.481624, 1, 0.6117647, 0, 1,
-1.226878, -0.7857088, -2.964419, 1, 0.6196079, 0, 1,
-1.226489, 0.2997999, -2.168831, 1, 0.6235294, 0, 1,
-1.225073, -0.7613344, -2.122384, 1, 0.6313726, 0, 1,
-1.223342, 1.29971, 0.2386881, 1, 0.6352941, 0, 1,
-1.221154, 1.117208, -0.8913157, 1, 0.6431373, 0, 1,
-1.219608, -0.370239, -0.9706174, 1, 0.6470588, 0, 1,
-1.216198, -0.1434233, -1.807235, 1, 0.654902, 0, 1,
-1.214631, -1.110895, -1.522165, 1, 0.6588235, 0, 1,
-1.210994, 0.01973635, -1.256787, 1, 0.6666667, 0, 1,
-1.203045, 0.2676674, -2.525645, 1, 0.6705883, 0, 1,
-1.196927, -1.096806, -2.377279, 1, 0.6784314, 0, 1,
-1.191238, 0.01435272, -1.67014, 1, 0.682353, 0, 1,
-1.188081, -0.9443399, -3.25617, 1, 0.6901961, 0, 1,
-1.179043, 0.05806184, -1.711651, 1, 0.6941177, 0, 1,
-1.164856, -0.3275038, -2.774077, 1, 0.7019608, 0, 1,
-1.137257, -1.677265, -2.014183, 1, 0.7098039, 0, 1,
-1.133508, -1.519566, -2.076549, 1, 0.7137255, 0, 1,
-1.133137, 0.7434906, -1.601595, 1, 0.7215686, 0, 1,
-1.130982, -0.8668011, -0.5768096, 1, 0.7254902, 0, 1,
-1.12562, -0.9775165, -2.004929, 1, 0.7333333, 0, 1,
-1.123934, -1.061675, -2.804468, 1, 0.7372549, 0, 1,
-1.120598, 1.066337, -1.125661, 1, 0.7450981, 0, 1,
-1.116039, 0.4688115, -1.74859, 1, 0.7490196, 0, 1,
-1.11258, 0.7976061, -0.03475511, 1, 0.7568628, 0, 1,
-1.109111, -0.8340855, -1.924118, 1, 0.7607843, 0, 1,
-1.107271, 0.350374, -0.317792, 1, 0.7686275, 0, 1,
-1.107151, -0.2490582, -0.9194224, 1, 0.772549, 0, 1,
-1.102201, -0.1194003, 0.3755325, 1, 0.7803922, 0, 1,
-1.100219, -0.5536123, -2.806759, 1, 0.7843137, 0, 1,
-1.097396, -0.00597947, -3.66975, 1, 0.7921569, 0, 1,
-1.093367, -1.209583, -2.741382, 1, 0.7960784, 0, 1,
-1.092159, 1.031623, -0.9513916, 1, 0.8039216, 0, 1,
-1.086879, -0.935986, -3.502192, 1, 0.8117647, 0, 1,
-1.070403, 0.6714058, -0.3377544, 1, 0.8156863, 0, 1,
-1.066969, -1.113237, -2.696646, 1, 0.8235294, 0, 1,
-1.064869, 0.3503231, -0.5093603, 1, 0.827451, 0, 1,
-1.05593, -0.6817527, -1.968696, 1, 0.8352941, 0, 1,
-1.055392, -0.906843, -1.686397, 1, 0.8392157, 0, 1,
-1.050855, 0.1240398, -2.052926, 1, 0.8470588, 0, 1,
-1.050405, 0.3505263, -1.805219, 1, 0.8509804, 0, 1,
-1.048752, -1.448014, -0.5743337, 1, 0.8588235, 0, 1,
-1.03549, -0.4252552, -0.2856381, 1, 0.8627451, 0, 1,
-1.034514, 0.5674402, -2.791462, 1, 0.8705882, 0, 1,
-1.033712, -0.440341, -1.251546, 1, 0.8745098, 0, 1,
-1.030197, 2.336332, -0.2091046, 1, 0.8823529, 0, 1,
-1.030062, 0.1103305, -2.118772, 1, 0.8862745, 0, 1,
-1.026052, 0.1594427, -0.3740822, 1, 0.8941177, 0, 1,
-1.024793, 0.1668578, 0.08290292, 1, 0.8980392, 0, 1,
-1.023702, -0.9660621, -1.980227, 1, 0.9058824, 0, 1,
-1.021335, 0.7173221, -0.1826741, 1, 0.9137255, 0, 1,
-1.017935, 0.4381317, -1.228759, 1, 0.9176471, 0, 1,
-1.017628, 1.474589, -1.527182, 1, 0.9254902, 0, 1,
-1.009101, 0.2711912, -1.191866, 1, 0.9294118, 0, 1,
-1.008897, -0.4905611, -1.80555, 1, 0.9372549, 0, 1,
-1.004186, -2.093933, -3.268813, 1, 0.9411765, 0, 1,
-0.9964092, -0.199351, -1.116258, 1, 0.9490196, 0, 1,
-0.9870666, -0.08889437, -0.5566522, 1, 0.9529412, 0, 1,
-0.9825266, -0.2341399, -2.222344, 1, 0.9607843, 0, 1,
-0.9814931, 0.249062, 0.5271584, 1, 0.9647059, 0, 1,
-0.9786682, -0.472724, -1.517589, 1, 0.972549, 0, 1,
-0.9776593, -0.874349, -2.155288, 1, 0.9764706, 0, 1,
-0.9723962, 0.9565869, -1.279927, 1, 0.9843137, 0, 1,
-0.9712644, 0.5536141, 0.02387627, 1, 0.9882353, 0, 1,
-0.9628317, -2.138806, -2.465243, 1, 0.9960784, 0, 1,
-0.9513877, -0.8450702, -1.549869, 0.9960784, 1, 0, 1,
-0.9494802, -0.02433437, -1.346351, 0.9921569, 1, 0, 1,
-0.9362815, -0.2758744, -1.844535, 0.9843137, 1, 0, 1,
-0.9351789, 0.5209422, -2.396434, 0.9803922, 1, 0, 1,
-0.93499, -0.3178537, -2.105256, 0.972549, 1, 0, 1,
-0.9288537, 1.187834, -0.4195538, 0.9686275, 1, 0, 1,
-0.9283829, 0.06048833, -1.522638, 0.9607843, 1, 0, 1,
-0.9251295, 0.8326126, -0.1018236, 0.9568627, 1, 0, 1,
-0.9237019, 0.2190463, -1.487691, 0.9490196, 1, 0, 1,
-0.9207563, -1.070963, -2.746299, 0.945098, 1, 0, 1,
-0.9160692, 0.9691609, -0.8029343, 0.9372549, 1, 0, 1,
-0.9110689, 0.2682654, -1.561515, 0.9333333, 1, 0, 1,
-0.9071434, -0.5493606, -1.87898, 0.9254902, 1, 0, 1,
-0.9038833, 0.02346661, -1.463493, 0.9215686, 1, 0, 1,
-0.8961397, -1.456994, -2.624048, 0.9137255, 1, 0, 1,
-0.8879462, -1.123554, -3.732073, 0.9098039, 1, 0, 1,
-0.8878402, 0.9578929, -0.4002289, 0.9019608, 1, 0, 1,
-0.8855095, 0.3738757, -2.449109, 0.8941177, 1, 0, 1,
-0.8799477, -1.209771, -1.885771, 0.8901961, 1, 0, 1,
-0.8776863, -0.1734889, -2.453322, 0.8823529, 1, 0, 1,
-0.8770384, 0.1251921, -1.13698, 0.8784314, 1, 0, 1,
-0.8712222, 0.1055192, -2.106126, 0.8705882, 1, 0, 1,
-0.8618795, -1.122733, -3.335097, 0.8666667, 1, 0, 1,
-0.8609223, 1.664613, -1.481578, 0.8588235, 1, 0, 1,
-0.8592621, -0.03365629, -2.510219, 0.854902, 1, 0, 1,
-0.8554527, 1.841192, -2.19749, 0.8470588, 1, 0, 1,
-0.8546237, 0.3942339, -2.333816, 0.8431373, 1, 0, 1,
-0.8504493, 0.6786268, -1.905484, 0.8352941, 1, 0, 1,
-0.8468882, -0.7282826, -3.511616, 0.8313726, 1, 0, 1,
-0.8455266, 1.03681, -0.7969315, 0.8235294, 1, 0, 1,
-0.844704, 0.5810694, -1.168565, 0.8196079, 1, 0, 1,
-0.8379185, 0.2643635, -1.591095, 0.8117647, 1, 0, 1,
-0.8340091, 0.1483601, -1.714513, 0.8078431, 1, 0, 1,
-0.8310364, -0.3074004, -1.998525, 0.8, 1, 0, 1,
-0.8307719, -0.746796, -1.600394, 0.7921569, 1, 0, 1,
-0.8300809, -1.575289, -3.499439, 0.7882353, 1, 0, 1,
-0.8285365, -0.2134065, -1.157781, 0.7803922, 1, 0, 1,
-0.822843, 0.2665745, -1.939913, 0.7764706, 1, 0, 1,
-0.8165164, 0.6014954, -1.157948, 0.7686275, 1, 0, 1,
-0.8090343, 0.2426612, -1.219653, 0.7647059, 1, 0, 1,
-0.7989355, 1.373219, -0.6413417, 0.7568628, 1, 0, 1,
-0.7892658, 0.2141917, -1.642281, 0.7529412, 1, 0, 1,
-0.7888252, -1.850162, -1.417296, 0.7450981, 1, 0, 1,
-0.788169, 0.02534377, -1.696003, 0.7411765, 1, 0, 1,
-0.7879921, -1.435454, -2.881851, 0.7333333, 1, 0, 1,
-0.7781332, -0.4867112, -2.73407, 0.7294118, 1, 0, 1,
-0.7721323, -0.8583668, -3.233657, 0.7215686, 1, 0, 1,
-0.7669998, 1.300987, -1.825316, 0.7176471, 1, 0, 1,
-0.7629275, 0.5983882, -2.619333, 0.7098039, 1, 0, 1,
-0.7575444, -0.6321204, -0.7470433, 0.7058824, 1, 0, 1,
-0.7548636, -0.003676647, -3.181674, 0.6980392, 1, 0, 1,
-0.7526947, 0.7168923, -1.468974, 0.6901961, 1, 0, 1,
-0.7496724, 0.4372471, -1.305405, 0.6862745, 1, 0, 1,
-0.7415143, -0.002285813, -0.9223324, 0.6784314, 1, 0, 1,
-0.7276865, -0.04908063, -0.6251003, 0.6745098, 1, 0, 1,
-0.720785, -0.536683, -3.209159, 0.6666667, 1, 0, 1,
-0.7146027, -0.2797211, -2.615243, 0.6627451, 1, 0, 1,
-0.7144969, 0.9214724, -1.232051, 0.654902, 1, 0, 1,
-0.7137988, 0.870772, -1.823286, 0.6509804, 1, 0, 1,
-0.707339, -0.8069848, -4.223485, 0.6431373, 1, 0, 1,
-0.6941347, -0.158199, -0.4601993, 0.6392157, 1, 0, 1,
-0.6804124, -1.033629, -3.174265, 0.6313726, 1, 0, 1,
-0.6785995, 0.7185991, -0.3744335, 0.627451, 1, 0, 1,
-0.6760355, -0.3904777, -0.05970994, 0.6196079, 1, 0, 1,
-0.6758785, 0.1824345, -2.294726, 0.6156863, 1, 0, 1,
-0.6747791, -0.9938744, -2.33882, 0.6078432, 1, 0, 1,
-0.6653595, 0.4300581, 0.4368839, 0.6039216, 1, 0, 1,
-0.6653033, -0.745824, -2.240565, 0.5960785, 1, 0, 1,
-0.657415, -1.753493, -3.434512, 0.5882353, 1, 0, 1,
-0.6532676, -0.7405292, -4.794655, 0.5843138, 1, 0, 1,
-0.6515704, -2.935066, -5.756493, 0.5764706, 1, 0, 1,
-0.6458079, 0.5188518, -2.25391, 0.572549, 1, 0, 1,
-0.6447505, -2.031789, -3.896501, 0.5647059, 1, 0, 1,
-0.63993, 2.532449, -1.024721, 0.5607843, 1, 0, 1,
-0.6366081, 0.5345909, -2.220691, 0.5529412, 1, 0, 1,
-0.629622, -0.3564405, -1.536746, 0.5490196, 1, 0, 1,
-0.6290628, -1.02639, -2.323354, 0.5411765, 1, 0, 1,
-0.6272265, 0.1329854, -2.008651, 0.5372549, 1, 0, 1,
-0.626586, -0.3104958, -2.132948, 0.5294118, 1, 0, 1,
-0.6242521, -1.23506, -1.707913, 0.5254902, 1, 0, 1,
-0.61183, 0.1253468, -2.513406, 0.5176471, 1, 0, 1,
-0.6102396, -0.09701063, -2.483318, 0.5137255, 1, 0, 1,
-0.6095703, -1.924166, -3.186433, 0.5058824, 1, 0, 1,
-0.6068026, -0.1375844, -2.38024, 0.5019608, 1, 0, 1,
-0.6060715, -0.500301, -3.667475, 0.4941176, 1, 0, 1,
-0.5988876, 2.821763, 1.018888, 0.4862745, 1, 0, 1,
-0.5972517, -1.872509, -2.443761, 0.4823529, 1, 0, 1,
-0.5938712, -0.5356903, -1.903551, 0.4745098, 1, 0, 1,
-0.5881022, 0.2896194, -1.261173, 0.4705882, 1, 0, 1,
-0.5822042, -0.9021818, -2.035251, 0.4627451, 1, 0, 1,
-0.5767269, 0.2503277, -2.25752, 0.4588235, 1, 0, 1,
-0.569171, 0.3416649, -0.9095523, 0.4509804, 1, 0, 1,
-0.5594875, -0.2571057, -0.8315678, 0.4470588, 1, 0, 1,
-0.5549387, -0.4657473, -1.580566, 0.4392157, 1, 0, 1,
-0.5525371, 0.2045471, 1.385928, 0.4352941, 1, 0, 1,
-0.5508101, 0.2187093, -1.342427, 0.427451, 1, 0, 1,
-0.5481532, 0.1781345, -1.435576, 0.4235294, 1, 0, 1,
-0.5476325, 1.25469, -1.078768, 0.4156863, 1, 0, 1,
-0.5448475, -2.04722, -1.413855, 0.4117647, 1, 0, 1,
-0.543433, 1.073688, 1.112864, 0.4039216, 1, 0, 1,
-0.5417953, 0.1827569, -1.000799, 0.3960784, 1, 0, 1,
-0.5390308, -0.2653559, -3.609746, 0.3921569, 1, 0, 1,
-0.5386922, -0.1231525, -1.459307, 0.3843137, 1, 0, 1,
-0.5382821, 0.3805919, -1.202209, 0.3803922, 1, 0, 1,
-0.5337156, -0.596038, -2.755587, 0.372549, 1, 0, 1,
-0.5275935, 0.09970479, -0.5818854, 0.3686275, 1, 0, 1,
-0.5243197, -0.009330285, -2.104368, 0.3607843, 1, 0, 1,
-0.5238435, 0.2256973, -1.300532, 0.3568628, 1, 0, 1,
-0.5236775, 1.37512, -0.6322122, 0.3490196, 1, 0, 1,
-0.520709, -0.3860352, -1.299404, 0.345098, 1, 0, 1,
-0.5199658, -1.711052, -3.78235, 0.3372549, 1, 0, 1,
-0.5124615, 0.5024748, -0.3771977, 0.3333333, 1, 0, 1,
-0.5122488, -0.1948341, -2.185292, 0.3254902, 1, 0, 1,
-0.5040533, -0.5694405, -0.8553303, 0.3215686, 1, 0, 1,
-0.5021753, 0.285217, -0.2523727, 0.3137255, 1, 0, 1,
-0.5015116, -0.1812392, -0.5484471, 0.3098039, 1, 0, 1,
-0.5008054, 0.6554851, 1.404322, 0.3019608, 1, 0, 1,
-0.5003874, 1.083045, -0.7011359, 0.2941177, 1, 0, 1,
-0.4969249, 0.2266747, 1.327485, 0.2901961, 1, 0, 1,
-0.4900702, 0.6662228, -2.147762, 0.282353, 1, 0, 1,
-0.4894, 0.6544849, -0.2437445, 0.2784314, 1, 0, 1,
-0.4888939, 0.8270523, 0.1005818, 0.2705882, 1, 0, 1,
-0.4884059, 0.4682665, -0.8888991, 0.2666667, 1, 0, 1,
-0.4883983, -1.975291, -4.011413, 0.2588235, 1, 0, 1,
-0.4862635, -0.6662689, -2.779218, 0.254902, 1, 0, 1,
-0.4808424, -0.1804526, -2.354276, 0.2470588, 1, 0, 1,
-0.4790521, -1.346317, -2.184357, 0.2431373, 1, 0, 1,
-0.4749461, -0.0611923, -0.4926394, 0.2352941, 1, 0, 1,
-0.4745081, -0.874854, -2.574632, 0.2313726, 1, 0, 1,
-0.4717287, 0.0369148, -1.051035, 0.2235294, 1, 0, 1,
-0.4672502, -0.7160144, -1.612672, 0.2196078, 1, 0, 1,
-0.4631608, 1.13264, 0.384825, 0.2117647, 1, 0, 1,
-0.4617953, 1.446259, -0.2172477, 0.2078431, 1, 0, 1,
-0.4616344, 0.3563234, -0.02536628, 0.2, 1, 0, 1,
-0.4614443, 0.3125197, -0.7141499, 0.1921569, 1, 0, 1,
-0.4603677, -0.09450208, -1.872005, 0.1882353, 1, 0, 1,
-0.4602763, 0.3285008, -2.521711, 0.1803922, 1, 0, 1,
-0.4595293, 0.1545465, -1.554938, 0.1764706, 1, 0, 1,
-0.4585035, 0.5476952, -0.5847633, 0.1686275, 1, 0, 1,
-0.4525121, -0.2772719, -2.661647, 0.1647059, 1, 0, 1,
-0.4524718, 0.6910189, 1.459603, 0.1568628, 1, 0, 1,
-0.4501288, 0.03351322, -1.999346, 0.1529412, 1, 0, 1,
-0.4496732, 0.8947056, -0.8560123, 0.145098, 1, 0, 1,
-0.446933, -0.2065375, -1.388167, 0.1411765, 1, 0, 1,
-0.4389916, 0.2332622, -1.141792, 0.1333333, 1, 0, 1,
-0.437659, 0.5233891, 0.3957651, 0.1294118, 1, 0, 1,
-0.4324375, 0.549239, -1.501821, 0.1215686, 1, 0, 1,
-0.4294003, 0.07107083, -1.689536, 0.1176471, 1, 0, 1,
-0.4277712, -3.471739, -5.262794, 0.1098039, 1, 0, 1,
-0.4167679, 0.5026016, -0.6064273, 0.1058824, 1, 0, 1,
-0.4122138, -0.647319, -2.745287, 0.09803922, 1, 0, 1,
-0.411955, -0.761043, -1.689711, 0.09019608, 1, 0, 1,
-0.4112413, 0.1876045, -1.938983, 0.08627451, 1, 0, 1,
-0.4090911, 0.1975482, -1.618956, 0.07843138, 1, 0, 1,
-0.4066418, -1.657238, -2.157336, 0.07450981, 1, 0, 1,
-0.4009775, -0.2302799, -2.332311, 0.06666667, 1, 0, 1,
-0.3978695, -1.936365, -2.32302, 0.0627451, 1, 0, 1,
-0.3934912, -0.9309603, -2.349949, 0.05490196, 1, 0, 1,
-0.391821, 1.912587, -2.559654, 0.05098039, 1, 0, 1,
-0.39132, -0.4867573, -3.972749, 0.04313726, 1, 0, 1,
-0.3889896, 1.409204, 0.002984296, 0.03921569, 1, 0, 1,
-0.3802307, 0.1340609, -1.556257, 0.03137255, 1, 0, 1,
-0.3797338, 0.3331679, -1.144307, 0.02745098, 1, 0, 1,
-0.3773817, 0.5352371, -0.3441289, 0.01960784, 1, 0, 1,
-0.376822, -0.02205573, -1.410254, 0.01568628, 1, 0, 1,
-0.376653, -0.1832408, 0.3068755, 0.007843138, 1, 0, 1,
-0.3716583, -0.223283, -1.416802, 0.003921569, 1, 0, 1,
-0.3686309, 2.236979, -1.805902, 0, 1, 0.003921569, 1,
-0.3651302, -2.198284, -3.006506, 0, 1, 0.01176471, 1,
-0.3611373, -1.016701, -3.724787, 0, 1, 0.01568628, 1,
-0.3597675, 0.5146437, -1.387727, 0, 1, 0.02352941, 1,
-0.3557515, -0.06158347, -1.662598, 0, 1, 0.02745098, 1,
-0.352816, 0.05198764, -2.276918, 0, 1, 0.03529412, 1,
-0.3525144, 0.04185004, -2.05634, 0, 1, 0.03921569, 1,
-0.3506258, 0.550885, 0.9592863, 0, 1, 0.04705882, 1,
-0.3446333, -1.029448, -4.13297, 0, 1, 0.05098039, 1,
-0.3432107, -0.2774884, -4.254606, 0, 1, 0.05882353, 1,
-0.3430341, 0.9532741, -0.6489586, 0, 1, 0.0627451, 1,
-0.3424846, 0.9784979, -1.641375, 0, 1, 0.07058824, 1,
-0.3403037, -0.7471985, -4.076277, 0, 1, 0.07450981, 1,
-0.3390961, 0.2892996, -0.9803605, 0, 1, 0.08235294, 1,
-0.3388114, 0.08501098, -0.4909996, 0, 1, 0.08627451, 1,
-0.333488, -0.4525113, -2.56001, 0, 1, 0.09411765, 1,
-0.3332658, -0.5712364, -1.829769, 0, 1, 0.1019608, 1,
-0.3293236, -1.035033, -3.648116, 0, 1, 0.1058824, 1,
-0.3270915, 0.5646855, 0.7691005, 0, 1, 0.1137255, 1,
-0.3260873, -1.163193, -3.812936, 0, 1, 0.1176471, 1,
-0.3228684, 1.335344, -0.6639255, 0, 1, 0.1254902, 1,
-0.3224333, -0.4152605, -2.116264, 0, 1, 0.1294118, 1,
-0.3212376, 0.9830001, -0.6007609, 0, 1, 0.1372549, 1,
-0.3209477, -0.9013953, -1.505242, 0, 1, 0.1411765, 1,
-0.3198211, 0.2272721, -1.169819, 0, 1, 0.1490196, 1,
-0.3176645, -0.6631655, -1.957595, 0, 1, 0.1529412, 1,
-0.3153599, -0.9952703, -1.361301, 0, 1, 0.1607843, 1,
-0.3139974, 0.6323258, -0.7622314, 0, 1, 0.1647059, 1,
-0.3081392, 0.642723, -1.265545, 0, 1, 0.172549, 1,
-0.307926, -0.05728195, -1.630405, 0, 1, 0.1764706, 1,
-0.3046463, -0.8722364, -1.560351, 0, 1, 0.1843137, 1,
-0.2985701, -1.948779, -4.445111, 0, 1, 0.1882353, 1,
-0.2949223, 0.2945981, -1.100855, 0, 1, 0.1960784, 1,
-0.2949042, 0.1100583, -1.490061, 0, 1, 0.2039216, 1,
-0.2904602, 0.7640837, -0.8015892, 0, 1, 0.2078431, 1,
-0.2902572, -1.007268, -3.131535, 0, 1, 0.2156863, 1,
-0.2902161, 0.9240668, -0.3075618, 0, 1, 0.2196078, 1,
-0.2887421, -1.467415, -3.150018, 0, 1, 0.227451, 1,
-0.2864005, 0.2593167, 0.1752049, 0, 1, 0.2313726, 1,
-0.2827654, 0.3564703, -1.641973, 0, 1, 0.2392157, 1,
-0.2758693, 0.3277795, -1.43927, 0, 1, 0.2431373, 1,
-0.2722793, 0.08824541, -1.218905, 0, 1, 0.2509804, 1,
-0.2661593, -0.8675611, -0.04588783, 0, 1, 0.254902, 1,
-0.2561055, 1.02355, -0.2035765, 0, 1, 0.2627451, 1,
-0.2560178, -0.3161758, -2.972286, 0, 1, 0.2666667, 1,
-0.2544543, -1.141263, -3.336155, 0, 1, 0.2745098, 1,
-0.2518439, -0.5402068, -3.242325, 0, 1, 0.2784314, 1,
-0.2504942, -1.080544, -3.414356, 0, 1, 0.2862745, 1,
-0.2477091, -1.095027, -3.737853, 0, 1, 0.2901961, 1,
-0.2452172, 0.08259363, -3.026702, 0, 1, 0.2980392, 1,
-0.2435568, 0.4409771, 0.7155631, 0, 1, 0.3058824, 1,
-0.2435229, -0.6560733, -3.217365, 0, 1, 0.3098039, 1,
-0.2371207, 0.7420499, -0.9369523, 0, 1, 0.3176471, 1,
-0.2352206, -0.6528444, -3.635391, 0, 1, 0.3215686, 1,
-0.2344577, 0.2175098, -3.598345, 0, 1, 0.3294118, 1,
-0.2319592, 0.7978758, -1.712567, 0, 1, 0.3333333, 1,
-0.231716, 0.9295313, -1.326929, 0, 1, 0.3411765, 1,
-0.2312158, -0.7021908, -4.042042, 0, 1, 0.345098, 1,
-0.230952, 1.507747, -0.04916789, 0, 1, 0.3529412, 1,
-0.2308582, 1.453857, -1.108166, 0, 1, 0.3568628, 1,
-0.2240555, 0.9108437, 0.3543231, 0, 1, 0.3647059, 1,
-0.2207698, -0.4839226, -3.482834, 0, 1, 0.3686275, 1,
-0.219957, -1.482233, -2.259604, 0, 1, 0.3764706, 1,
-0.21458, -0.4424593, -3.15003, 0, 1, 0.3803922, 1,
-0.2132519, -0.2522888, -2.462966, 0, 1, 0.3882353, 1,
-0.2110127, 1.24389, 2.093099, 0, 1, 0.3921569, 1,
-0.2100343, -0.7561702, -1.355534, 0, 1, 0.4, 1,
-0.2051189, 0.009878795, -1.637592, 0, 1, 0.4078431, 1,
-0.2034564, -0.8417989, -2.626768, 0, 1, 0.4117647, 1,
-0.2014474, 0.8337408, -0.03300333, 0, 1, 0.4196078, 1,
-0.2002143, -0.6058305, -2.421382, 0, 1, 0.4235294, 1,
-0.2001712, 0.5584329, -1.249199, 0, 1, 0.4313726, 1,
-0.1978697, 0.3921195, -0.4687618, 0, 1, 0.4352941, 1,
-0.1941572, -0.4009018, -3.228698, 0, 1, 0.4431373, 1,
-0.1930295, 0.8445733, 0.140798, 0, 1, 0.4470588, 1,
-0.1904232, -0.3544683, -2.45681, 0, 1, 0.454902, 1,
-0.1889022, -0.6778358, -2.150325, 0, 1, 0.4588235, 1,
-0.1886272, 0.1051847, -0.2926121, 0, 1, 0.4666667, 1,
-0.1883093, -1.072966, -3.811046, 0, 1, 0.4705882, 1,
-0.1868848, 1.165102, 0.4150529, 0, 1, 0.4784314, 1,
-0.1856849, -1.343522, -2.735849, 0, 1, 0.4823529, 1,
-0.1850678, 0.1607241, -1.131029, 0, 1, 0.4901961, 1,
-0.1834201, -0.4258827, -3.451673, 0, 1, 0.4941176, 1,
-0.1830097, 0.4466074, -0.4642496, 0, 1, 0.5019608, 1,
-0.1813954, 0.9225565, -0.1794885, 0, 1, 0.509804, 1,
-0.1713286, 1.063524, 0.1788202, 0, 1, 0.5137255, 1,
-0.1669058, 0.1551979, 0.8152694, 0, 1, 0.5215687, 1,
-0.1661811, 0.7589184, 1.386064, 0, 1, 0.5254902, 1,
-0.1639285, 1.461724, -1.579729, 0, 1, 0.5333334, 1,
-0.1630599, 0.9652966, 0.652288, 0, 1, 0.5372549, 1,
-0.1594856, 0.5878258, 2.024628, 0, 1, 0.5450981, 1,
-0.1586755, -1.867601, -2.434356, 0, 1, 0.5490196, 1,
-0.1485371, -0.1547337, -1.5807, 0, 1, 0.5568628, 1,
-0.142248, -0.3960158, -2.467422, 0, 1, 0.5607843, 1,
-0.1411278, 0.6544822, -0.5744045, 0, 1, 0.5686275, 1,
-0.1409001, 1.49051, 2.100243, 0, 1, 0.572549, 1,
-0.1397435, -2.426437, -4.251168, 0, 1, 0.5803922, 1,
-0.1358149, -0.7320561, -4.507801, 0, 1, 0.5843138, 1,
-0.135392, 0.3240227, -2.343685, 0, 1, 0.5921569, 1,
-0.1224892, -0.169563, -0.3526773, 0, 1, 0.5960785, 1,
-0.1202308, -0.03837512, -2.180221, 0, 1, 0.6039216, 1,
-0.1190139, 0.7487347, -0.8877186, 0, 1, 0.6117647, 1,
-0.1170496, -1.75051, -3.643668, 0, 1, 0.6156863, 1,
-0.1106831, 0.9599633, 0.9694387, 0, 1, 0.6235294, 1,
-0.1051288, -0.5702856, -4.086112, 0, 1, 0.627451, 1,
-0.1026194, 0.3018681, 0.9338816, 0, 1, 0.6352941, 1,
-0.1012297, 0.6002493, -0.2297186, 0, 1, 0.6392157, 1,
-0.09187745, -1.182947, -3.584716, 0, 1, 0.6470588, 1,
-0.09152915, 0.9673559, -0.2280124, 0, 1, 0.6509804, 1,
-0.09010163, -0.0537204, -1.595037, 0, 1, 0.6588235, 1,
-0.08809344, 1.099376, 1.247036, 0, 1, 0.6627451, 1,
-0.08663654, -1.473128, -3.799174, 0, 1, 0.6705883, 1,
-0.08392975, -0.6786951, -4.688016, 0, 1, 0.6745098, 1,
-0.08379719, 1.56059, -0.245086, 0, 1, 0.682353, 1,
-0.07918794, -0.1295084, -2.051296, 0, 1, 0.6862745, 1,
-0.07551672, -1.211446, -4.150249, 0, 1, 0.6941177, 1,
-0.07304899, -1.316188, -2.020026, 0, 1, 0.7019608, 1,
-0.0726525, 1.073089, -2.21367, 0, 1, 0.7058824, 1,
-0.06944184, 0.9137051, -0.909956, 0, 1, 0.7137255, 1,
-0.06913204, -0.1796167, -2.82739, 0, 1, 0.7176471, 1,
-0.06490766, -0.2904007, -3.944978, 0, 1, 0.7254902, 1,
-0.06349024, -0.8679827, -1.871969, 0, 1, 0.7294118, 1,
-0.0600205, -0.1161647, -3.762558, 0, 1, 0.7372549, 1,
-0.05900451, -0.7246112, -3.222388, 0, 1, 0.7411765, 1,
-0.0582805, -0.5583681, -2.596079, 0, 1, 0.7490196, 1,
-0.05182149, 0.5310684, -0.4267833, 0, 1, 0.7529412, 1,
-0.04745748, -0.02717145, -1.958303, 0, 1, 0.7607843, 1,
-0.04682569, -1.196197, -2.68302, 0, 1, 0.7647059, 1,
-0.04551576, -1.558283, -3.721972, 0, 1, 0.772549, 1,
-0.04221221, 1.400438, -0.5358381, 0, 1, 0.7764706, 1,
-0.04110562, -0.5247063, -2.665348, 0, 1, 0.7843137, 1,
-0.03978388, 0.4543647, -1.352393, 0, 1, 0.7882353, 1,
-0.03692897, 0.1568037, -0.3382066, 0, 1, 0.7960784, 1,
-0.0368749, 1.407671, -0.8608575, 0, 1, 0.8039216, 1,
-0.03632606, -0.1404571, -3.342029, 0, 1, 0.8078431, 1,
-0.03275526, 0.2706204, -0.8894972, 0, 1, 0.8156863, 1,
-0.03270726, -1.459088, -3.303917, 0, 1, 0.8196079, 1,
-0.03132171, 0.01595224, -0.1292893, 0, 1, 0.827451, 1,
-0.0278507, -2.343105, -3.536593, 0, 1, 0.8313726, 1,
-0.02751315, 0.8866674, -0.3680539, 0, 1, 0.8392157, 1,
-0.02237115, 0.7563773, -1.034997, 0, 1, 0.8431373, 1,
-0.02227532, -0.1453838, -1.928631, 0, 1, 0.8509804, 1,
-0.02184306, -0.9230254, -3.403935, 0, 1, 0.854902, 1,
-0.02006795, -0.2689218, -2.036, 0, 1, 0.8627451, 1,
-0.01933989, -1.49882, -3.070779, 0, 1, 0.8666667, 1,
-0.01856898, 0.5504199, -0.1746916, 0, 1, 0.8745098, 1,
-0.0174193, 0.1771907, -0.07937063, 0, 1, 0.8784314, 1,
-0.0150695, -0.827964, -3.245563, 0, 1, 0.8862745, 1,
-0.01445227, 0.7980068, 0.4595092, 0, 1, 0.8901961, 1,
-0.01373948, 0.03743472, -0.2885599, 0, 1, 0.8980392, 1,
-0.008143596, -0.1377495, -2.697216, 0, 1, 0.9058824, 1,
-0.00780109, -0.2455253, -3.801462, 0, 1, 0.9098039, 1,
-0.006501582, -1.642477, -3.070338, 0, 1, 0.9176471, 1,
-0.006349158, -0.003891623, -2.62519, 0, 1, 0.9215686, 1,
-0.0009278582, 1.191744, 0.6594572, 0, 1, 0.9294118, 1,
-0.0007586771, -2.225533, -3.148073, 0, 1, 0.9333333, 1,
0.0001390693, -0.958268, 2.056526, 0, 1, 0.9411765, 1,
0.003467494, 0.5191706, 0.8593157, 0, 1, 0.945098, 1,
0.005581032, -1.861387, 3.797497, 0, 1, 0.9529412, 1,
0.006147673, -0.1647191, 3.238637, 0, 1, 0.9568627, 1,
0.006414844, 1.16331, 2.118344, 0, 1, 0.9647059, 1,
0.01351249, -1.055244, 3.79995, 0, 1, 0.9686275, 1,
0.0139309, -0.3755045, 3.510318, 0, 1, 0.9764706, 1,
0.01707447, -1.152073, 2.31108, 0, 1, 0.9803922, 1,
0.01746618, -0.3996425, 2.070675, 0, 1, 0.9882353, 1,
0.01822764, 2.149176, 0.7339162, 0, 1, 0.9921569, 1,
0.01955103, 0.3868729, -0.1586204, 0, 1, 1, 1,
0.02050474, 0.1261129, 0.442662, 0, 0.9921569, 1, 1,
0.02246803, 1.319347, 0.2058388, 0, 0.9882353, 1, 1,
0.0239394, 1.762325, 0.5310673, 0, 0.9803922, 1, 1,
0.02803784, -0.5055132, 3.635377, 0, 0.9764706, 1, 1,
0.02856756, 0.7702856, -0.3113836, 0, 0.9686275, 1, 1,
0.02950865, 0.4577066, 1.015121, 0, 0.9647059, 1, 1,
0.02986641, -1.11033, 4.072372, 0, 0.9568627, 1, 1,
0.03102538, 1.386727, 1.334402, 0, 0.9529412, 1, 1,
0.03195416, -0.2198303, 3.089181, 0, 0.945098, 1, 1,
0.03398399, 1.23274, 0.2992802, 0, 0.9411765, 1, 1,
0.04237687, -0.6377507, 2.76867, 0, 0.9333333, 1, 1,
0.0430796, 0.9600947, -0.6909183, 0, 0.9294118, 1, 1,
0.04610742, -2.03521, 2.127172, 0, 0.9215686, 1, 1,
0.04761728, -0.1516702, 2.833338, 0, 0.9176471, 1, 1,
0.04963532, 0.0195059, 1.350106, 0, 0.9098039, 1, 1,
0.05183676, -0.5415465, 4.449029, 0, 0.9058824, 1, 1,
0.05186597, -1.494072, 3.179868, 0, 0.8980392, 1, 1,
0.05212691, -0.5513431, 4.878299, 0, 0.8901961, 1, 1,
0.05258736, -1.185663, 4.068824, 0, 0.8862745, 1, 1,
0.05598783, -1.51888, 1.665057, 0, 0.8784314, 1, 1,
0.05609816, 0.427389, -0.1030148, 0, 0.8745098, 1, 1,
0.05811367, 0.6442237, -2.216328, 0, 0.8666667, 1, 1,
0.05894578, 0.2112286, 2.735019, 0, 0.8627451, 1, 1,
0.06160185, -0.7265007, 5.081798, 0, 0.854902, 1, 1,
0.06318048, 1.306427, 1.568698, 0, 0.8509804, 1, 1,
0.06327069, 0.949518, 1.805746, 0, 0.8431373, 1, 1,
0.0633157, 0.778465, 0.2562543, 0, 0.8392157, 1, 1,
0.06765629, 0.00144199, 1.149621, 0, 0.8313726, 1, 1,
0.06993936, -0.05393487, 3.126974, 0, 0.827451, 1, 1,
0.07001174, 2.452367, -0.421766, 0, 0.8196079, 1, 1,
0.07222473, 0.2020589, -0.3036946, 0, 0.8156863, 1, 1,
0.07647952, -0.1432731, 1.755334, 0, 0.8078431, 1, 1,
0.07775269, -1.163815, 0.8210014, 0, 0.8039216, 1, 1,
0.08469436, -0.9033604, 4.280305, 0, 0.7960784, 1, 1,
0.08862146, 0.08997142, 2.41617, 0, 0.7882353, 1, 1,
0.0890481, -1.053461, 3.354977, 0, 0.7843137, 1, 1,
0.09733471, 0.02463847, 1.156373, 0, 0.7764706, 1, 1,
0.09781028, -0.5021574, 3.579185, 0, 0.772549, 1, 1,
0.1094586, -0.173316, 3.356046, 0, 0.7647059, 1, 1,
0.115009, -0.1413132, 2.46438, 0, 0.7607843, 1, 1,
0.1176551, 0.01320018, 1.892035, 0, 0.7529412, 1, 1,
0.1179355, -1.352129, 4.045738, 0, 0.7490196, 1, 1,
0.1239168, 0.3526933, 0.06030095, 0, 0.7411765, 1, 1,
0.1279427, -0.2635821, 2.501826, 0, 0.7372549, 1, 1,
0.1311172, -0.449004, 4.600989, 0, 0.7294118, 1, 1,
0.1346992, -0.9478181, 3.576723, 0, 0.7254902, 1, 1,
0.1349559, 0.6534719, 0.6799967, 0, 0.7176471, 1, 1,
0.1350203, -0.02264211, -0.2285955, 0, 0.7137255, 1, 1,
0.1379864, 0.54449, -0.5921293, 0, 0.7058824, 1, 1,
0.142395, 0.3942508, -0.4865455, 0, 0.6980392, 1, 1,
0.1434717, 1.608634, 0.4785472, 0, 0.6941177, 1, 1,
0.1493259, 2.101175, 2.034623, 0, 0.6862745, 1, 1,
0.1498236, -0.7259444, 2.745559, 0, 0.682353, 1, 1,
0.1530447, 0.1912275, 2.54897, 0, 0.6745098, 1, 1,
0.1538009, 0.5184786, 0.06391847, 0, 0.6705883, 1, 1,
0.1545463, 1.175118, 1.957807, 0, 0.6627451, 1, 1,
0.159146, 0.5573564, 0.3925526, 0, 0.6588235, 1, 1,
0.1592481, 0.2615154, 0.541532, 0, 0.6509804, 1, 1,
0.1623554, -0.5487127, 2.216831, 0, 0.6470588, 1, 1,
0.1628838, 2.223021, -1.245046, 0, 0.6392157, 1, 1,
0.1671671, 0.07842211, 1.793499, 0, 0.6352941, 1, 1,
0.168138, 0.8717905, 1.484844, 0, 0.627451, 1, 1,
0.169564, 0.7636172, -0.6227755, 0, 0.6235294, 1, 1,
0.1851038, 0.9865595, -0.289291, 0, 0.6156863, 1, 1,
0.1861852, 0.3810138, -0.6918307, 0, 0.6117647, 1, 1,
0.1881509, -0.6973912, 3.702141, 0, 0.6039216, 1, 1,
0.1900764, -0.2094821, 2.79974, 0, 0.5960785, 1, 1,
0.1908975, 1.474593, 0.7536914, 0, 0.5921569, 1, 1,
0.1936521, 0.8340108, -0.1788271, 0, 0.5843138, 1, 1,
0.1956449, -0.425984, 5.457081, 0, 0.5803922, 1, 1,
0.2045558, -0.08360171, 4.751377, 0, 0.572549, 1, 1,
0.2058706, -0.8282754, 2.946433, 0, 0.5686275, 1, 1,
0.2068186, 0.9996508, 0.539292, 0, 0.5607843, 1, 1,
0.2082647, 0.04684257, 0.03754067, 0, 0.5568628, 1, 1,
0.2085324, -0.4039387, 3.702828, 0, 0.5490196, 1, 1,
0.2103576, -0.2607227, 1.292304, 0, 0.5450981, 1, 1,
0.2109655, -0.7840414, 2.35805, 0, 0.5372549, 1, 1,
0.2110473, -0.5619127, 2.246489, 0, 0.5333334, 1, 1,
0.2140729, -0.7795744, 4.347187, 0, 0.5254902, 1, 1,
0.2215153, 1.528172, 0.4432624, 0, 0.5215687, 1, 1,
0.2240878, 0.6854309, 0.8428552, 0, 0.5137255, 1, 1,
0.224753, -1.185615, 1.956218, 0, 0.509804, 1, 1,
0.2269958, -0.2794852, 4.804018, 0, 0.5019608, 1, 1,
0.2300667, 1.171839, -1.592797, 0, 0.4941176, 1, 1,
0.2300983, -0.3589737, 3.246926, 0, 0.4901961, 1, 1,
0.2386383, 1.085455, 2.218863, 0, 0.4823529, 1, 1,
0.2420364, -0.6892291, 2.48813, 0, 0.4784314, 1, 1,
0.2432847, -0.7205027, 4.117509, 0, 0.4705882, 1, 1,
0.2474905, -0.436352, 3.74531, 0, 0.4666667, 1, 1,
0.2487747, -0.5923308, 2.359764, 0, 0.4588235, 1, 1,
0.2518379, -1.12983, 1.378553, 0, 0.454902, 1, 1,
0.2526502, -0.4414524, 1.271374, 0, 0.4470588, 1, 1,
0.2534145, 1.888707, 0.8709018, 0, 0.4431373, 1, 1,
0.256767, 1.615672, -0.1034636, 0, 0.4352941, 1, 1,
0.2569942, 2.971456, 0.9791235, 0, 0.4313726, 1, 1,
0.2582483, 0.7588912, 1.130901, 0, 0.4235294, 1, 1,
0.2592487, -0.9380746, 3.826411, 0, 0.4196078, 1, 1,
0.2643879, -0.4545066, 1.01197, 0, 0.4117647, 1, 1,
0.2657303, -2.458547, 1.933957, 0, 0.4078431, 1, 1,
0.2680539, -2.145805, 2.680771, 0, 0.4, 1, 1,
0.274063, 0.2872624, 1.5547, 0, 0.3921569, 1, 1,
0.2745832, -0.9747669, 4.28635, 0, 0.3882353, 1, 1,
0.27465, 0.9564691, 0.02537111, 0, 0.3803922, 1, 1,
0.2750141, 1.277013, 1.202591, 0, 0.3764706, 1, 1,
0.2753978, 0.1096731, 1.728611, 0, 0.3686275, 1, 1,
0.2760318, 0.6820019, 0.2205497, 0, 0.3647059, 1, 1,
0.2774392, 1.302262, -1.049745, 0, 0.3568628, 1, 1,
0.2782363, -0.456177, 2.971871, 0, 0.3529412, 1, 1,
0.2790405, 0.8148702, 0.4407647, 0, 0.345098, 1, 1,
0.2862252, 1.092983, -0.4553841, 0, 0.3411765, 1, 1,
0.2875841, 0.8628341, -0.1007276, 0, 0.3333333, 1, 1,
0.2883887, -0.4935678, 2.955433, 0, 0.3294118, 1, 1,
0.2917177, 0.7287608, 2.201694, 0, 0.3215686, 1, 1,
0.2940162, 0.6767006, -0.6515218, 0, 0.3176471, 1, 1,
0.295696, -0.8893893, 3.569813, 0, 0.3098039, 1, 1,
0.2963185, 0.5542007, 1.800942, 0, 0.3058824, 1, 1,
0.2967706, -0.03300558, 2.092, 0, 0.2980392, 1, 1,
0.2987917, 1.186771, -0.6742102, 0, 0.2901961, 1, 1,
0.3005594, -0.9911098, 3.755464, 0, 0.2862745, 1, 1,
0.3034101, -0.4722191, 3.494557, 0, 0.2784314, 1, 1,
0.3046806, 0.4935024, 0.5165978, 0, 0.2745098, 1, 1,
0.3057491, 1.060677, 0.3138269, 0, 0.2666667, 1, 1,
0.315809, 0.5719122, 0.3316821, 0, 0.2627451, 1, 1,
0.3228536, 0.7021648, 1.131772, 0, 0.254902, 1, 1,
0.3230195, -0.3588313, 2.668655, 0, 0.2509804, 1, 1,
0.3230894, -0.9109877, 2.515459, 0, 0.2431373, 1, 1,
0.3274282, -0.9564153, 4.509668, 0, 0.2392157, 1, 1,
0.3294072, -0.4351082, 2.722616, 0, 0.2313726, 1, 1,
0.3306977, -1.543477, 3.199295, 0, 0.227451, 1, 1,
0.3351711, -0.7836123, 3.15516, 0, 0.2196078, 1, 1,
0.3355011, -0.1972818, 0.5850387, 0, 0.2156863, 1, 1,
0.3355199, 0.03164895, 1.709952, 0, 0.2078431, 1, 1,
0.3362585, 1.334602, 0.8664228, 0, 0.2039216, 1, 1,
0.3368962, 0.6729293, 1.901633, 0, 0.1960784, 1, 1,
0.336976, 0.4767553, 0.8857265, 0, 0.1882353, 1, 1,
0.342436, -0.7554108, 1.694651, 0, 0.1843137, 1, 1,
0.3436063, -0.9737192, 3.204845, 0, 0.1764706, 1, 1,
0.3453538, 0.850545, 0.2285968, 0, 0.172549, 1, 1,
0.3458109, 0.4824847, 0.9725929, 0, 0.1647059, 1, 1,
0.3458286, 1.817373, -0.2794579, 0, 0.1607843, 1, 1,
0.351191, -0.633013, 3.436031, 0, 0.1529412, 1, 1,
0.3520801, 0.1481012, 2.293282, 0, 0.1490196, 1, 1,
0.3662855, 1.473502, -0.4533643, 0, 0.1411765, 1, 1,
0.3668369, 1.078657, 1.194774, 0, 0.1372549, 1, 1,
0.3685238, 1.375676, -2.319219, 0, 0.1294118, 1, 1,
0.3749307, -1.470484, 1.363122, 0, 0.1254902, 1, 1,
0.3854839, -1.111477, 2.653212, 0, 0.1176471, 1, 1,
0.3859168, 0.2655667, 1.907917, 0, 0.1137255, 1, 1,
0.3948238, 0.1429908, 1.008691, 0, 0.1058824, 1, 1,
0.398673, -0.7072073, 2.698425, 0, 0.09803922, 1, 1,
0.3991863, 0.3679735, 1.679767, 0, 0.09411765, 1, 1,
0.404956, 0.2529566, 1.502129, 0, 0.08627451, 1, 1,
0.4085374, -0.9213406, 1.180691, 0, 0.08235294, 1, 1,
0.4101734, -0.7606328, 0.9798285, 0, 0.07450981, 1, 1,
0.4129509, 0.1110608, 2.323892, 0, 0.07058824, 1, 1,
0.4155149, -0.02027843, 1.088959, 0, 0.0627451, 1, 1,
0.4161953, -1.466619, 2.910865, 0, 0.05882353, 1, 1,
0.4170252, 1.835564, 1.796563, 0, 0.05098039, 1, 1,
0.421122, 0.2395786, 1.727866, 0, 0.04705882, 1, 1,
0.4234586, 0.2732869, 0.1667119, 0, 0.03921569, 1, 1,
0.4247964, 0.7156968, 0.4017968, 0, 0.03529412, 1, 1,
0.4289947, -2.085947, 0.7701162, 0, 0.02745098, 1, 1,
0.4326344, 1.323356, 0.8386669, 0, 0.02352941, 1, 1,
0.4341779, 1.190586, 0.7904963, 0, 0.01568628, 1, 1,
0.4364423, 0.5323337, 0.2244209, 0, 0.01176471, 1, 1,
0.4367441, -0.4845073, 1.233141, 0, 0.003921569, 1, 1,
0.439602, -3.684658, 1.898456, 0.003921569, 0, 1, 1,
0.4398479, 1.930029, 0.2646057, 0.007843138, 0, 1, 1,
0.4425972, -2.384746, 2.067597, 0.01568628, 0, 1, 1,
0.4456336, -1.129237, 2.823579, 0.01960784, 0, 1, 1,
0.4461839, 0.5409444, 0.05805237, 0.02745098, 0, 1, 1,
0.4472086, 0.872591, 1.852571, 0.03137255, 0, 1, 1,
0.453661, -0.2135528, 3.7904, 0.03921569, 0, 1, 1,
0.4539992, -0.7313135, 2.725296, 0.04313726, 0, 1, 1,
0.4545408, 0.1859064, -0.1096376, 0.05098039, 0, 1, 1,
0.4568059, 1.114342, 0.2954857, 0.05490196, 0, 1, 1,
0.4631955, 0.4351646, 0.9411977, 0.0627451, 0, 1, 1,
0.4644586, -0.07499518, 3.107246, 0.06666667, 0, 1, 1,
0.4670894, 0.7284404, 2.114244, 0.07450981, 0, 1, 1,
0.4673481, -1.97822, 1.378806, 0.07843138, 0, 1, 1,
0.4678787, -0.2700071, 3.789003, 0.08627451, 0, 1, 1,
0.4723668, -1.386457, 2.648993, 0.09019608, 0, 1, 1,
0.4734049, -0.04323015, 1.132969, 0.09803922, 0, 1, 1,
0.474478, -1.108681, 2.311727, 0.1058824, 0, 1, 1,
0.4813725, 0.04448144, 3.172146, 0.1098039, 0, 1, 1,
0.483291, 1.269, 0.5673762, 0.1176471, 0, 1, 1,
0.4848772, 0.310007, 0.8806364, 0.1215686, 0, 1, 1,
0.4849068, 1.585822, 2.470781, 0.1294118, 0, 1, 1,
0.4875426, -0.5585845, 1.733732, 0.1333333, 0, 1, 1,
0.4876659, -1.058652, 1.563357, 0.1411765, 0, 1, 1,
0.49138, -1.630364, 3.613863, 0.145098, 0, 1, 1,
0.4973404, -0.4380923, 2.245759, 0.1529412, 0, 1, 1,
0.4983009, 0.2046048, 1.143408, 0.1568628, 0, 1, 1,
0.4996637, 0.4649768, 0.7111666, 0.1647059, 0, 1, 1,
0.5040854, 0.07895391, 3.308136, 0.1686275, 0, 1, 1,
0.5102302, 1.619584, -1.96386, 0.1764706, 0, 1, 1,
0.512123, 0.3597378, 1.046799, 0.1803922, 0, 1, 1,
0.5123027, 0.6536541, -1.64002, 0.1882353, 0, 1, 1,
0.5162719, 0.8837991, 1.786843, 0.1921569, 0, 1, 1,
0.5204454, -0.06848338, 1.963997, 0.2, 0, 1, 1,
0.5213939, -0.7755872, 2.713018, 0.2078431, 0, 1, 1,
0.5232235, 1.29869, 0.1640956, 0.2117647, 0, 1, 1,
0.5256122, 2.060251, 1.1134, 0.2196078, 0, 1, 1,
0.5262153, -0.09689362, 2.375722, 0.2235294, 0, 1, 1,
0.5278368, 1.354545, 0.9784551, 0.2313726, 0, 1, 1,
0.5283254, 0.4578647, -0.08390363, 0.2352941, 0, 1, 1,
0.5287811, -0.0392407, 0.565852, 0.2431373, 0, 1, 1,
0.5309152, 0.8476582, 1.540354, 0.2470588, 0, 1, 1,
0.5366099, 0.4197972, -0.4911922, 0.254902, 0, 1, 1,
0.545982, 0.8573597, -0.4104888, 0.2588235, 0, 1, 1,
0.5466544, 0.29255, 0.07519594, 0.2666667, 0, 1, 1,
0.5510981, 0.08567434, 0.1546919, 0.2705882, 0, 1, 1,
0.5535024, 0.5092624, 0.2027867, 0.2784314, 0, 1, 1,
0.5562348, -0.3816706, 0.9880322, 0.282353, 0, 1, 1,
0.5579863, 0.9312419, 1.92455, 0.2901961, 0, 1, 1,
0.5588387, 1.934124, 1.162535, 0.2941177, 0, 1, 1,
0.5590774, -0.2175474, 0.7765424, 0.3019608, 0, 1, 1,
0.5648519, -1.302857, 2.72038, 0.3098039, 0, 1, 1,
0.5666392, -0.002807335, 1.327921, 0.3137255, 0, 1, 1,
0.5677944, -0.6436083, 3.207752, 0.3215686, 0, 1, 1,
0.5811477, -2.217721, 2.119848, 0.3254902, 0, 1, 1,
0.5834218, -0.8298473, 1.630193, 0.3333333, 0, 1, 1,
0.5843645, -1.024844, 2.324055, 0.3372549, 0, 1, 1,
0.5889369, 1.107259, -1.124607, 0.345098, 0, 1, 1,
0.5955974, 0.2442232, 1.65029, 0.3490196, 0, 1, 1,
0.5966865, -0.7080222, 0.9346019, 0.3568628, 0, 1, 1,
0.6085494, -1.53943, 1.28449, 0.3607843, 0, 1, 1,
0.608721, 0.201768, 1.008748, 0.3686275, 0, 1, 1,
0.6087456, -0.00181143, 1.959283, 0.372549, 0, 1, 1,
0.610571, -1.687483, 3.984429, 0.3803922, 0, 1, 1,
0.611549, 0.4903725, 2.076976, 0.3843137, 0, 1, 1,
0.614265, -2.629197, 3.808314, 0.3921569, 0, 1, 1,
0.6150314, -0.552114, 2.55289, 0.3960784, 0, 1, 1,
0.6190253, 0.06644174, 1.07355, 0.4039216, 0, 1, 1,
0.6218397, 0.07488105, 2.414829, 0.4117647, 0, 1, 1,
0.6228625, 0.4534274, 1.999478, 0.4156863, 0, 1, 1,
0.6244794, -1.187001, 3.143005, 0.4235294, 0, 1, 1,
0.6276631, -1.503312, 1.778187, 0.427451, 0, 1, 1,
0.6287427, 0.3250321, -0.7398924, 0.4352941, 0, 1, 1,
0.634388, -0.975886, 1.57055, 0.4392157, 0, 1, 1,
0.636021, -0.03408174, 2.970464, 0.4470588, 0, 1, 1,
0.6372538, 1.67029, 1.319879, 0.4509804, 0, 1, 1,
0.6416587, 1.035794, -0.1285894, 0.4588235, 0, 1, 1,
0.6432475, 0.1619761, 1.514302, 0.4627451, 0, 1, 1,
0.6456583, 2.332454, -0.3828889, 0.4705882, 0, 1, 1,
0.6488194, 1.480691, 0.6759343, 0.4745098, 0, 1, 1,
0.6519255, -0.5011362, 1.713577, 0.4823529, 0, 1, 1,
0.6550692, 1.231791, 2.190441, 0.4862745, 0, 1, 1,
0.6561863, -0.6597279, 2.729078, 0.4941176, 0, 1, 1,
0.6578349, -0.2573995, 1.34168, 0.5019608, 0, 1, 1,
0.6586124, 0.1245239, 2.283777, 0.5058824, 0, 1, 1,
0.6589878, -0.1471698, 1.364812, 0.5137255, 0, 1, 1,
0.6590552, -1.819733, 2.320297, 0.5176471, 0, 1, 1,
0.6629689, -0.5656, 1.704023, 0.5254902, 0, 1, 1,
0.6631048, 0.4525209, 2.093403, 0.5294118, 0, 1, 1,
0.6635288, -0.7203331, 1.921689, 0.5372549, 0, 1, 1,
0.6648092, 1.095322, 0.6330536, 0.5411765, 0, 1, 1,
0.6656312, 0.07377147, -0.1745677, 0.5490196, 0, 1, 1,
0.6727093, -0.116928, 0.9569237, 0.5529412, 0, 1, 1,
0.6768427, 1.391191, 0.5674841, 0.5607843, 0, 1, 1,
0.6779386, -0.1802179, 3.557202, 0.5647059, 0, 1, 1,
0.6798826, 0.3696949, 1.218463, 0.572549, 0, 1, 1,
0.6812318, 0.4028544, 1.24201, 0.5764706, 0, 1, 1,
0.6815206, -0.2235791, 0.2579585, 0.5843138, 0, 1, 1,
0.6847242, -0.8530456, 3.253036, 0.5882353, 0, 1, 1,
0.6869498, 0.167143, 0.5220187, 0.5960785, 0, 1, 1,
0.6965489, -0.4440099, 2.295139, 0.6039216, 0, 1, 1,
0.6982978, 0.122429, 1.506065, 0.6078432, 0, 1, 1,
0.699738, 1.007004, -0.1070633, 0.6156863, 0, 1, 1,
0.7018661, -3.030275, 2.98632, 0.6196079, 0, 1, 1,
0.7050208, -0.07232384, 1.920872, 0.627451, 0, 1, 1,
0.7125713, 0.222572, 1.019234, 0.6313726, 0, 1, 1,
0.7150961, -0.4148694, 4.042716, 0.6392157, 0, 1, 1,
0.7278795, -0.6783297, 2.62713, 0.6431373, 0, 1, 1,
0.7312176, -1.81792, 1.667713, 0.6509804, 0, 1, 1,
0.7313451, -0.01732484, 3.098071, 0.654902, 0, 1, 1,
0.7335848, 0.941595, -0.4770422, 0.6627451, 0, 1, 1,
0.7366601, 0.07714655, 2.189848, 0.6666667, 0, 1, 1,
0.7379251, 0.04925183, 0.274412, 0.6745098, 0, 1, 1,
0.7427679, -0.4601889, 3.490642, 0.6784314, 0, 1, 1,
0.7430844, -1.689825, 3.02201, 0.6862745, 0, 1, 1,
0.7433223, -0.6831684, 2.133678, 0.6901961, 0, 1, 1,
0.7469084, -1.931758, 3.18732, 0.6980392, 0, 1, 1,
0.7474473, 1.349265, -2.099269, 0.7058824, 0, 1, 1,
0.7540498, 1.937547, 0.1210114, 0.7098039, 0, 1, 1,
0.7597998, -0.04581, 2.528558, 0.7176471, 0, 1, 1,
0.7629794, 0.5526524, 1.154272, 0.7215686, 0, 1, 1,
0.7649333, -1.501348, 3.746096, 0.7294118, 0, 1, 1,
0.7706459, -0.7098634, 1.812888, 0.7333333, 0, 1, 1,
0.7712341, 0.4054256, 2.27813, 0.7411765, 0, 1, 1,
0.7734469, -0.9027834, 2.776425, 0.7450981, 0, 1, 1,
0.7750884, 0.3580649, 0.187974, 0.7529412, 0, 1, 1,
0.7766373, -0.7940902, 2.735022, 0.7568628, 0, 1, 1,
0.778227, -1.858365, 2.407714, 0.7647059, 0, 1, 1,
0.779774, 1.36584, 0.5407619, 0.7686275, 0, 1, 1,
0.7818322, 0.01581061, -0.59442, 0.7764706, 0, 1, 1,
0.7865738, -0.1999955, 2.285032, 0.7803922, 0, 1, 1,
0.7909947, -0.4538271, 0.5181251, 0.7882353, 0, 1, 1,
0.7932346, 0.4295891, 1.364379, 0.7921569, 0, 1, 1,
0.7945746, 0.9874585, 0.6745762, 0.8, 0, 1, 1,
0.7981572, -0.354921, 2.759627, 0.8078431, 0, 1, 1,
0.7999205, 1.279614, -1.151355, 0.8117647, 0, 1, 1,
0.8026836, 0.4140537, 1.125459, 0.8196079, 0, 1, 1,
0.8043076, 0.3565474, 2.802022, 0.8235294, 0, 1, 1,
0.8057482, -0.5483177, 1.98801, 0.8313726, 0, 1, 1,
0.8112478, -0.3816322, 1.702712, 0.8352941, 0, 1, 1,
0.8149231, 0.5533878, 1.557613, 0.8431373, 0, 1, 1,
0.8309709, -1.048735, 2.92783, 0.8470588, 0, 1, 1,
0.831582, 0.2176781, 0.09574484, 0.854902, 0, 1, 1,
0.836606, -0.2931003, 1.131128, 0.8588235, 0, 1, 1,
0.8413978, -0.8736058, 3.284559, 0.8666667, 0, 1, 1,
0.8437895, 0.4589334, 0.9125887, 0.8705882, 0, 1, 1,
0.8451831, -1.318357, 2.971011, 0.8784314, 0, 1, 1,
0.857905, 2.367173, -2.329514, 0.8823529, 0, 1, 1,
0.8607645, -0.7500667, 2.130703, 0.8901961, 0, 1, 1,
0.8699613, 0.1629906, 2.256096, 0.8941177, 0, 1, 1,
0.8720338, 1.049833, -0.07332377, 0.9019608, 0, 1, 1,
0.8807648, -0.1236418, 0.9566209, 0.9098039, 0, 1, 1,
0.8877487, 0.8152273, -0.1596653, 0.9137255, 0, 1, 1,
0.8901294, 0.0116509, 1.070224, 0.9215686, 0, 1, 1,
0.8921052, -0.9452205, 1.551831, 0.9254902, 0, 1, 1,
0.8959475, 0.8194551, 0.7709239, 0.9333333, 0, 1, 1,
0.8962218, -1.252882, 1.882402, 0.9372549, 0, 1, 1,
0.8972497, -1.248305, 2.265489, 0.945098, 0, 1, 1,
0.8972746, -1.374321, 0.8519541, 0.9490196, 0, 1, 1,
0.9010061, 0.2180485, -0.3527091, 0.9568627, 0, 1, 1,
0.9022744, 0.9138662, 1.199581, 0.9607843, 0, 1, 1,
0.9058385, -0.177156, 0.4720547, 0.9686275, 0, 1, 1,
0.9065419, 0.8246003, -0.8939615, 0.972549, 0, 1, 1,
0.906583, 0.5885264, -0.1399006, 0.9803922, 0, 1, 1,
0.906635, -1.031427, 4.71513, 0.9843137, 0, 1, 1,
0.91046, 0.8432958, 1.285177, 0.9921569, 0, 1, 1,
0.9124303, 0.6787308, 0.009977438, 0.9960784, 0, 1, 1,
0.9251746, 0.2219044, 3.101971, 1, 0, 0.9960784, 1,
0.9270171, 0.7254246, -0.9066485, 1, 0, 0.9882353, 1,
0.9270942, 1.022354, -0.7619013, 1, 0, 0.9843137, 1,
0.9342063, 0.06177999, 1.96241, 1, 0, 0.9764706, 1,
0.9344891, -1.303747, 3.644505, 1, 0, 0.972549, 1,
0.936003, -0.1137059, 1.665564, 1, 0, 0.9647059, 1,
0.937382, 0.3541433, 1.872115, 1, 0, 0.9607843, 1,
0.9445835, 1.038858, 3.085789, 1, 0, 0.9529412, 1,
0.9479303, 1.023112, 0.9857524, 1, 0, 0.9490196, 1,
0.9479343, -0.2821998, 4.007574, 1, 0, 0.9411765, 1,
0.9481001, 0.9607522, 1.177726, 1, 0, 0.9372549, 1,
0.94812, 0.194882, 2.084175, 1, 0, 0.9294118, 1,
0.9576838, 1.596914, 1.645136, 1, 0, 0.9254902, 1,
0.9653671, -0.3945844, 1.50216, 1, 0, 0.9176471, 1,
0.9678596, 0.745765, -0.0504505, 1, 0, 0.9137255, 1,
0.9722351, -0.4570411, 2.646393, 1, 0, 0.9058824, 1,
0.9777546, 1.396141, -1.047206, 1, 0, 0.9019608, 1,
0.9800519, 0.3484684, 0.8054582, 1, 0, 0.8941177, 1,
0.9820831, 0.1922974, 1.136808, 1, 0, 0.8862745, 1,
0.9841485, -2.814028, 3.018228, 1, 0, 0.8823529, 1,
0.985603, 0.09548433, 1.969584, 1, 0, 0.8745098, 1,
0.9884254, -0.4550848, 3.241517, 1, 0, 0.8705882, 1,
0.9907457, 0.2178992, 1.810452, 1, 0, 0.8627451, 1,
0.9916056, -2.683636, 1.65854, 1, 0, 0.8588235, 1,
0.9961879, -1.657052, 1.814454, 1, 0, 0.8509804, 1,
0.9981936, 1.958495, 0.4139362, 1, 0, 0.8470588, 1,
0.9997025, 0.2759061, 1.32722, 1, 0, 0.8392157, 1,
1.001159, -0.8432467, 1.605543, 1, 0, 0.8352941, 1,
1.003313, -0.1328975, 1.394692, 1, 0, 0.827451, 1,
1.03035, 0.4966528, 0.5747637, 1, 0, 0.8235294, 1,
1.03396, -0.553418, 0.4407655, 1, 0, 0.8156863, 1,
1.051498, -1.449179, 1.842094, 1, 0, 0.8117647, 1,
1.052039, -0.826584, 3.425339, 1, 0, 0.8039216, 1,
1.054207, 0.6286801, -0.3273805, 1, 0, 0.7960784, 1,
1.059707, -1.050329, 2.857094, 1, 0, 0.7921569, 1,
1.063194, 1.220563, -1.031176, 1, 0, 0.7843137, 1,
1.07083, -0.8899823, 1.701864, 1, 0, 0.7803922, 1,
1.072672, -2.709721, 3.381004, 1, 0, 0.772549, 1,
1.082081, -0.286768, 3.945536, 1, 0, 0.7686275, 1,
1.092253, 1.249013, 1.84314, 1, 0, 0.7607843, 1,
1.097603, 2.286524, 1.596818, 1, 0, 0.7568628, 1,
1.102868, 0.7912352, -0.9443835, 1, 0, 0.7490196, 1,
1.106968, 0.1500458, 1.118378, 1, 0, 0.7450981, 1,
1.109409, -0.2392102, 0.179674, 1, 0, 0.7372549, 1,
1.109478, -1.071489, 1.45168, 1, 0, 0.7333333, 1,
1.119583, -0.618256, 2.521574, 1, 0, 0.7254902, 1,
1.12334, 1.504732, 2.927886, 1, 0, 0.7215686, 1,
1.125757, 0.9671018, 2.955784, 1, 0, 0.7137255, 1,
1.131922, 0.2195425, 2.1556, 1, 0, 0.7098039, 1,
1.133023, -1.715047, 1.74123, 1, 0, 0.7019608, 1,
1.150655, -0.4424084, 1.319969, 1, 0, 0.6941177, 1,
1.1509, 0.8922487, 1.286136, 1, 0, 0.6901961, 1,
1.157893, 1.762215, -0.6505135, 1, 0, 0.682353, 1,
1.169133, -1.536598, 2.493471, 1, 0, 0.6784314, 1,
1.172504, -0.5920581, 1.954174, 1, 0, 0.6705883, 1,
1.192032, 0.3820212, 1.756958, 1, 0, 0.6666667, 1,
1.197468, -0.2621228, 2.27691, 1, 0, 0.6588235, 1,
1.198841, -0.478756, 1.529113, 1, 0, 0.654902, 1,
1.208333, -0.1143643, 1.766258, 1, 0, 0.6470588, 1,
1.216941, 0.7821472, 1.8878, 1, 0, 0.6431373, 1,
1.234469, -1.038844, 2.257864, 1, 0, 0.6352941, 1,
1.239823, -0.9231892, 4.035057, 1, 0, 0.6313726, 1,
1.240654, -1.021488, 3.382899, 1, 0, 0.6235294, 1,
1.258803, -1.065774, 3.061674, 1, 0, 0.6196079, 1,
1.268806, -0.9181181, 2.144665, 1, 0, 0.6117647, 1,
1.26981, 0.360246, 2.013745, 1, 0, 0.6078432, 1,
1.271638, 1.666459, 2.833763, 1, 0, 0.6, 1,
1.284485, -0.2996149, 3.491364, 1, 0, 0.5921569, 1,
1.298789, -0.9654121, 2.753391, 1, 0, 0.5882353, 1,
1.311663, 1.142312, 0.9521614, 1, 0, 0.5803922, 1,
1.320366, 1.71262, 2.064291, 1, 0, 0.5764706, 1,
1.320856, -0.1218607, 0.4974202, 1, 0, 0.5686275, 1,
1.323283, -0.09223992, -0.2077921, 1, 0, 0.5647059, 1,
1.32517, -0.9900412, 1.722192, 1, 0, 0.5568628, 1,
1.326353, 0.539121, 1.834302, 1, 0, 0.5529412, 1,
1.328996, 0.06303955, 1.779841, 1, 0, 0.5450981, 1,
1.32991, 1.456027, 1.253956, 1, 0, 0.5411765, 1,
1.34099, 2.558112, 4.112368, 1, 0, 0.5333334, 1,
1.347936, -1.409217, 1.600005, 1, 0, 0.5294118, 1,
1.358125, -1.031191, 2.56292, 1, 0, 0.5215687, 1,
1.371016, 0.1131153, 4.479696, 1, 0, 0.5176471, 1,
1.374313, 2.012671, -0.6080758, 1, 0, 0.509804, 1,
1.375335, 0.8555367, 1.751616, 1, 0, 0.5058824, 1,
1.379485, -0.8095456, 2.906271, 1, 0, 0.4980392, 1,
1.384681, 1.125919, 3.377307, 1, 0, 0.4901961, 1,
1.385575, 1.657084, 0.9014903, 1, 0, 0.4862745, 1,
1.388037, -0.1387535, 1.575723, 1, 0, 0.4784314, 1,
1.396426, -1.958713, 2.141019, 1, 0, 0.4745098, 1,
1.402838, 0.7075927, 1.257699, 1, 0, 0.4666667, 1,
1.408085, -1.554175, 3.879079, 1, 0, 0.4627451, 1,
1.408755, -0.06925768, 0.5087333, 1, 0, 0.454902, 1,
1.411825, 1.051232, 0.01024229, 1, 0, 0.4509804, 1,
1.433599, -1.017932, 2.991447, 1, 0, 0.4431373, 1,
1.435791, -0.9897591, 1.70437, 1, 0, 0.4392157, 1,
1.455093, -0.3770433, 2.357051, 1, 0, 0.4313726, 1,
1.462388, -0.3831168, 2.025759, 1, 0, 0.427451, 1,
1.46925, -1.046892, 2.010798, 1, 0, 0.4196078, 1,
1.469684, -2.037493, 2.879689, 1, 0, 0.4156863, 1,
1.474761, 0.6486301, 2.957829, 1, 0, 0.4078431, 1,
1.475034, 0.4931329, 0.818032, 1, 0, 0.4039216, 1,
1.49889, 0.4393327, 0.3561913, 1, 0, 0.3960784, 1,
1.504769, 1.795113, 0.7881994, 1, 0, 0.3882353, 1,
1.506871, -0.6952599, 1.810841, 1, 0, 0.3843137, 1,
1.520784, -1.073718, 2.790584, 1, 0, 0.3764706, 1,
1.524915, -0.08040742, 0.5329446, 1, 0, 0.372549, 1,
1.536285, 1.52238, 0.7159361, 1, 0, 0.3647059, 1,
1.551146, 1.227139, 0.2404555, 1, 0, 0.3607843, 1,
1.561511, 1.111737, 1.022713, 1, 0, 0.3529412, 1,
1.564816, 2.027213, -0.7821667, 1, 0, 0.3490196, 1,
1.573995, -0.2497575, 1.899386, 1, 0, 0.3411765, 1,
1.582429, -1.004546, 3.973628, 1, 0, 0.3372549, 1,
1.591963, 1.197002, 0.937182, 1, 0, 0.3294118, 1,
1.60764, 0.4168289, 0.8477828, 1, 0, 0.3254902, 1,
1.608212, 0.2704297, 1.654205, 1, 0, 0.3176471, 1,
1.627241, 0.5457898, 0.3305251, 1, 0, 0.3137255, 1,
1.639053, -0.2471776, 2.514571, 1, 0, 0.3058824, 1,
1.646945, -0.8456118, 1.814139, 1, 0, 0.2980392, 1,
1.647288, 0.0850905, 2.500144, 1, 0, 0.2941177, 1,
1.654202, 0.4521816, 0.9918153, 1, 0, 0.2862745, 1,
1.655843, 1.192863, 0.2298243, 1, 0, 0.282353, 1,
1.663717, 0.9771128, 0.7587058, 1, 0, 0.2745098, 1,
1.672354, -0.2099111, 1.343416, 1, 0, 0.2705882, 1,
1.674099, 0.3102016, 2.158077, 1, 0, 0.2627451, 1,
1.702969, 0.4091721, 2.067504, 1, 0, 0.2588235, 1,
1.703718, -0.9115943, 3.522175, 1, 0, 0.2509804, 1,
1.705719, -0.7554425, 2.631586, 1, 0, 0.2470588, 1,
1.708777, -1.084722, 2.508067, 1, 0, 0.2392157, 1,
1.728128, -0.2486217, 1.470853, 1, 0, 0.2352941, 1,
1.744558, 0.8490276, -0.1632881, 1, 0, 0.227451, 1,
1.757277, 1.272061, 0.6461917, 1, 0, 0.2235294, 1,
1.782807, -0.4291684, 2.038821, 1, 0, 0.2156863, 1,
1.784498, -1.433318, 3.995143, 1, 0, 0.2117647, 1,
1.803635, 0.3511312, 1.36518, 1, 0, 0.2039216, 1,
1.879789, -0.2791426, 1.634892, 1, 0, 0.1960784, 1,
1.904796, -0.6787383, 1.835261, 1, 0, 0.1921569, 1,
1.914799, 0.8944665, 0.9565343, 1, 0, 0.1843137, 1,
1.935261, -0.8434169, 4.532626, 1, 0, 0.1803922, 1,
1.939029, 0.4438007, 2.892573, 1, 0, 0.172549, 1,
1.94054, -1.257087, 1.556306, 1, 0, 0.1686275, 1,
1.956779, 1.315396, 0.586543, 1, 0, 0.1607843, 1,
1.961414, 0.6745658, 1.724295, 1, 0, 0.1568628, 1,
1.975518, -0.4731126, 2.050758, 1, 0, 0.1490196, 1,
2.017735, -2.991465, 3.849457, 1, 0, 0.145098, 1,
2.039324, -0.442069, 3.279334, 1, 0, 0.1372549, 1,
2.071245, 0.8940569, 1.452208, 1, 0, 0.1333333, 1,
2.073732, -0.07410535, 2.486573, 1, 0, 0.1254902, 1,
2.074678, 0.8248041, 1.94987, 1, 0, 0.1215686, 1,
2.075587, 1.231707, 1.508841, 1, 0, 0.1137255, 1,
2.080826, -0.4837801, 1.921384, 1, 0, 0.1098039, 1,
2.083381, 0.7048808, 1.36085, 1, 0, 0.1019608, 1,
2.110754, -0.03206281, 1.440147, 1, 0, 0.09411765, 1,
2.12664, -0.4644724, 1.331225, 1, 0, 0.09019608, 1,
2.165058, 0.8013079, 0.3350202, 1, 0, 0.08235294, 1,
2.166147, -0.3024918, 2.924834, 1, 0, 0.07843138, 1,
2.205776, -0.6776168, 0.7531198, 1, 0, 0.07058824, 1,
2.208282, 1.487018, 1.222077, 1, 0, 0.06666667, 1,
2.254534, 0.2705191, 1.044093, 1, 0, 0.05882353, 1,
2.346344, 1.458315, 2.028171, 1, 0, 0.05490196, 1,
2.370472, -0.236793, 1.250144, 1, 0, 0.04705882, 1,
2.448779, -0.5671684, 1.189015, 1, 0, 0.04313726, 1,
2.608738, -0.658406, 2.611129, 1, 0, 0.03529412, 1,
2.693751, -0.9297063, 2.651988, 1, 0, 0.03137255, 1,
2.798419, -0.1470972, 1.187735, 1, 0, 0.02352941, 1,
2.824538, -0.532143, 0.8374742, 1, 0, 0.01960784, 1,
2.963236, -0.4446005, 1.026973, 1, 0, 0.01176471, 1,
3.090969, -0.1852729, 1.88548, 1, 0, 0.007843138, 1
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
0.1054369, -4.81287, -7.657193, 0, -0.5, 0.5, 0.5,
0.1054369, -4.81287, -7.657193, 1, -0.5, 0.5, 0.5,
0.1054369, -4.81287, -7.657193, 1, 1.5, 0.5, 0.5,
0.1054369, -4.81287, -7.657193, 0, 1.5, 0.5, 0.5
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
-3.892191, -0.356601, -7.657193, 0, -0.5, 0.5, 0.5,
-3.892191, -0.356601, -7.657193, 1, -0.5, 0.5, 0.5,
-3.892191, -0.356601, -7.657193, 1, 1.5, 0.5, 0.5,
-3.892191, -0.356601, -7.657193, 0, 1.5, 0.5, 0.5
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
-3.892191, -4.81287, -0.1497059, 0, -0.5, 0.5, 0.5,
-3.892191, -4.81287, -0.1497059, 1, -0.5, 0.5, 0.5,
-3.892191, -4.81287, -0.1497059, 1, 1.5, 0.5, 0.5,
-3.892191, -4.81287, -0.1497059, 0, 1.5, 0.5, 0.5
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
-2, -3.7845, -5.924696,
3, -3.7845, -5.924696,
-2, -3.7845, -5.924696,
-2, -3.955895, -6.213446,
-1, -3.7845, -5.924696,
-1, -3.955895, -6.213446,
0, -3.7845, -5.924696,
0, -3.955895, -6.213446,
1, -3.7845, -5.924696,
1, -3.955895, -6.213446,
2, -3.7845, -5.924696,
2, -3.955895, -6.213446,
3, -3.7845, -5.924696,
3, -3.955895, -6.213446
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
-2, -4.298685, -6.790945, 0, -0.5, 0.5, 0.5,
-2, -4.298685, -6.790945, 1, -0.5, 0.5, 0.5,
-2, -4.298685, -6.790945, 1, 1.5, 0.5, 0.5,
-2, -4.298685, -6.790945, 0, 1.5, 0.5, 0.5,
-1, -4.298685, -6.790945, 0, -0.5, 0.5, 0.5,
-1, -4.298685, -6.790945, 1, -0.5, 0.5, 0.5,
-1, -4.298685, -6.790945, 1, 1.5, 0.5, 0.5,
-1, -4.298685, -6.790945, 0, 1.5, 0.5, 0.5,
0, -4.298685, -6.790945, 0, -0.5, 0.5, 0.5,
0, -4.298685, -6.790945, 1, -0.5, 0.5, 0.5,
0, -4.298685, -6.790945, 1, 1.5, 0.5, 0.5,
0, -4.298685, -6.790945, 0, 1.5, 0.5, 0.5,
1, -4.298685, -6.790945, 0, -0.5, 0.5, 0.5,
1, -4.298685, -6.790945, 1, -0.5, 0.5, 0.5,
1, -4.298685, -6.790945, 1, 1.5, 0.5, 0.5,
1, -4.298685, -6.790945, 0, 1.5, 0.5, 0.5,
2, -4.298685, -6.790945, 0, -0.5, 0.5, 0.5,
2, -4.298685, -6.790945, 1, -0.5, 0.5, 0.5,
2, -4.298685, -6.790945, 1, 1.5, 0.5, 0.5,
2, -4.298685, -6.790945, 0, 1.5, 0.5, 0.5,
3, -4.298685, -6.790945, 0, -0.5, 0.5, 0.5,
3, -4.298685, -6.790945, 1, -0.5, 0.5, 0.5,
3, -4.298685, -6.790945, 1, 1.5, 0.5, 0.5,
3, -4.298685, -6.790945, 0, 1.5, 0.5, 0.5
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
-2.969661, -3, -5.924696,
-2.969661, 2, -5.924696,
-2.969661, -3, -5.924696,
-3.123416, -3, -6.213446,
-2.969661, -2, -5.924696,
-3.123416, -2, -6.213446,
-2.969661, -1, -5.924696,
-3.123416, -1, -6.213446,
-2.969661, 0, -5.924696,
-3.123416, 0, -6.213446,
-2.969661, 1, -5.924696,
-3.123416, 1, -6.213446,
-2.969661, 2, -5.924696,
-3.123416, 2, -6.213446
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
-3.430926, -3, -6.790945, 0, -0.5, 0.5, 0.5,
-3.430926, -3, -6.790945, 1, -0.5, 0.5, 0.5,
-3.430926, -3, -6.790945, 1, 1.5, 0.5, 0.5,
-3.430926, -3, -6.790945, 0, 1.5, 0.5, 0.5,
-3.430926, -2, -6.790945, 0, -0.5, 0.5, 0.5,
-3.430926, -2, -6.790945, 1, -0.5, 0.5, 0.5,
-3.430926, -2, -6.790945, 1, 1.5, 0.5, 0.5,
-3.430926, -2, -6.790945, 0, 1.5, 0.5, 0.5,
-3.430926, -1, -6.790945, 0, -0.5, 0.5, 0.5,
-3.430926, -1, -6.790945, 1, -0.5, 0.5, 0.5,
-3.430926, -1, -6.790945, 1, 1.5, 0.5, 0.5,
-3.430926, -1, -6.790945, 0, 1.5, 0.5, 0.5,
-3.430926, 0, -6.790945, 0, -0.5, 0.5, 0.5,
-3.430926, 0, -6.790945, 1, -0.5, 0.5, 0.5,
-3.430926, 0, -6.790945, 1, 1.5, 0.5, 0.5,
-3.430926, 0, -6.790945, 0, 1.5, 0.5, 0.5,
-3.430926, 1, -6.790945, 0, -0.5, 0.5, 0.5,
-3.430926, 1, -6.790945, 1, -0.5, 0.5, 0.5,
-3.430926, 1, -6.790945, 1, 1.5, 0.5, 0.5,
-3.430926, 1, -6.790945, 0, 1.5, 0.5, 0.5,
-3.430926, 2, -6.790945, 0, -0.5, 0.5, 0.5,
-3.430926, 2, -6.790945, 1, -0.5, 0.5, 0.5,
-3.430926, 2, -6.790945, 1, 1.5, 0.5, 0.5,
-3.430926, 2, -6.790945, 0, 1.5, 0.5, 0.5
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
-2.969661, -3.7845, -4,
-2.969661, -3.7845, 4,
-2.969661, -3.7845, -4,
-3.123416, -3.955895, -4,
-2.969661, -3.7845, -2,
-3.123416, -3.955895, -2,
-2.969661, -3.7845, 0,
-3.123416, -3.955895, 0,
-2.969661, -3.7845, 2,
-3.123416, -3.955895, 2,
-2.969661, -3.7845, 4,
-3.123416, -3.955895, 4
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
-3.430926, -4.298685, -4, 0, -0.5, 0.5, 0.5,
-3.430926, -4.298685, -4, 1, -0.5, 0.5, 0.5,
-3.430926, -4.298685, -4, 1, 1.5, 0.5, 0.5,
-3.430926, -4.298685, -4, 0, 1.5, 0.5, 0.5,
-3.430926, -4.298685, -2, 0, -0.5, 0.5, 0.5,
-3.430926, -4.298685, -2, 1, -0.5, 0.5, 0.5,
-3.430926, -4.298685, -2, 1, 1.5, 0.5, 0.5,
-3.430926, -4.298685, -2, 0, 1.5, 0.5, 0.5,
-3.430926, -4.298685, 0, 0, -0.5, 0.5, 0.5,
-3.430926, -4.298685, 0, 1, -0.5, 0.5, 0.5,
-3.430926, -4.298685, 0, 1, 1.5, 0.5, 0.5,
-3.430926, -4.298685, 0, 0, 1.5, 0.5, 0.5,
-3.430926, -4.298685, 2, 0, -0.5, 0.5, 0.5,
-3.430926, -4.298685, 2, 1, -0.5, 0.5, 0.5,
-3.430926, -4.298685, 2, 1, 1.5, 0.5, 0.5,
-3.430926, -4.298685, 2, 0, 1.5, 0.5, 0.5,
-3.430926, -4.298685, 4, 0, -0.5, 0.5, 0.5,
-3.430926, -4.298685, 4, 1, -0.5, 0.5, 0.5,
-3.430926, -4.298685, 4, 1, 1.5, 0.5, 0.5,
-3.430926, -4.298685, 4, 0, 1.5, 0.5, 0.5
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
-2.969661, -3.7845, -5.924696,
-2.969661, 3.071298, -5.924696,
-2.969661, -3.7845, 5.625285,
-2.969661, 3.071298, 5.625285,
-2.969661, -3.7845, -5.924696,
-2.969661, -3.7845, 5.625285,
-2.969661, 3.071298, -5.924696,
-2.969661, 3.071298, 5.625285,
-2.969661, -3.7845, -5.924696,
3.180535, -3.7845, -5.924696,
-2.969661, -3.7845, 5.625285,
3.180535, -3.7845, 5.625285,
-2.969661, 3.071298, -5.924696,
3.180535, 3.071298, -5.924696,
-2.969661, 3.071298, 5.625285,
3.180535, 3.071298, 5.625285,
3.180535, -3.7845, -5.924696,
3.180535, 3.071298, -5.924696,
3.180535, -3.7845, 5.625285,
3.180535, 3.071298, 5.625285,
3.180535, -3.7845, -5.924696,
3.180535, -3.7845, 5.625285,
3.180535, 3.071298, -5.924696,
3.180535, 3.071298, 5.625285
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
var radius = 7.888268;
var distance = 35.09579;
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
mvMatrix.translate( -0.1054369, 0.356601, 0.1497059 );
mvMatrix.scale( 1.386777, 1.244049, 0.7384384 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.09579);
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
DCIP<-read.table("DCIP.xyz")
```

```
## Error in read.table("DCIP.xyz"): no lines available in input
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
-2.880095, -0.7784649, -2.524076, 0, 0, 1, 1, 1,
-2.803682, 0.8781681, -2.12458, 1, 0, 0, 1, 1,
-2.543087, -0.446499, -0.7983484, 1, 0, 0, 1, 1,
-2.518775, -0.5482496, -2.161067, 1, 0, 0, 1, 1,
-2.495007, 0.355652, 0.2251053, 1, 0, 0, 1, 1,
-2.463401, 0.9254949, -1.30924, 1, 0, 0, 1, 1,
-2.460766, 0.9324067, -1.731223, 0, 0, 0, 1, 1,
-2.363353, 1.464506, -0.6877461, 0, 0, 0, 1, 1,
-2.324248, -0.9359783, -1.268918, 0, 0, 0, 1, 1,
-2.308317, -0.40474, -2.970423, 0, 0, 0, 1, 1,
-2.30417, 0.8589807, -0.2287192, 0, 0, 0, 1, 1,
-2.261398, 0.3334207, -1.836064, 0, 0, 0, 1, 1,
-2.238126, -1.302232, -2.192652, 0, 0, 0, 1, 1,
-2.205523, 0.4043611, -1.635265, 1, 1, 1, 1, 1,
-2.157196, -0.1885443, -2.865798, 1, 1, 1, 1, 1,
-2.154872, 0.6314784, -0.883453, 1, 1, 1, 1, 1,
-2.151839, -0.7481773, -0.7831045, 1, 1, 1, 1, 1,
-2.129128, 0.1126491, -1.354769, 1, 1, 1, 1, 1,
-2.102566, -1.690307, -2.727268, 1, 1, 1, 1, 1,
-2.081456, 0.4226258, -2.879669, 1, 1, 1, 1, 1,
-2.077513, 1.648843, -1.813042, 1, 1, 1, 1, 1,
-2.068615, 0.6223241, -1.075721, 1, 1, 1, 1, 1,
-2.061481, 1.688101, 0.603959, 1, 1, 1, 1, 1,
-2.036774, 2.148312, -1.928568, 1, 1, 1, 1, 1,
-1.998122, -0.6136432, -1.869164, 1, 1, 1, 1, 1,
-1.962302, -0.1911405, -1.567663, 1, 1, 1, 1, 1,
-1.939772, 0.3410341, -1.676124, 1, 1, 1, 1, 1,
-1.924277, -0.06452744, -2.080725, 1, 1, 1, 1, 1,
-1.921826, -0.2216115, -0.5969095, 0, 0, 1, 1, 1,
-1.920603, 0.5999738, 0.4351437, 1, 0, 0, 1, 1,
-1.89829, -1.147804, -1.825739, 1, 0, 0, 1, 1,
-1.873783, 0.9362264, -1.637164, 1, 0, 0, 1, 1,
-1.857919, 0.7102913, -1.857978, 1, 0, 0, 1, 1,
-1.852103, 0.5815271, -1.454787, 1, 0, 0, 1, 1,
-1.834969, -0.6419181, -1.962518, 0, 0, 0, 1, 1,
-1.831065, -0.5784535, -2.333075, 0, 0, 0, 1, 1,
-1.827803, 0.02560805, -0.1340224, 0, 0, 0, 1, 1,
-1.797261, 0.6686849, 0.1393863, 0, 0, 0, 1, 1,
-1.779537, 0.01231664, -1.77963, 0, 0, 0, 1, 1,
-1.76474, -0.3148375, -1.17258, 0, 0, 0, 1, 1,
-1.755203, 0.1466266, -1.757078, 0, 0, 0, 1, 1,
-1.734975, -1.464088, -2.293906, 1, 1, 1, 1, 1,
-1.734094, -0.2587554, -1.541041, 1, 1, 1, 1, 1,
-1.728638, -0.3829955, -2.583665, 1, 1, 1, 1, 1,
-1.694696, 0.5295348, -3.004303, 1, 1, 1, 1, 1,
-1.692852, -0.1840113, -0.147736, 1, 1, 1, 1, 1,
-1.687166, 0.07560105, -0.01000374, 1, 1, 1, 1, 1,
-1.677594, 2.197808, -1.58941, 1, 1, 1, 1, 1,
-1.675623, -2.201663, -3.243687, 1, 1, 1, 1, 1,
-1.664126, -0.3454491, -1.653616, 1, 1, 1, 1, 1,
-1.657265, -0.1649323, -2.533888, 1, 1, 1, 1, 1,
-1.642982, 2.30089, -1.497379, 1, 1, 1, 1, 1,
-1.632278, -0.4975621, -0.8631889, 1, 1, 1, 1, 1,
-1.631545, -1.037505, -2.292553, 1, 1, 1, 1, 1,
-1.630719, -0.4693485, -1.831345, 1, 1, 1, 1, 1,
-1.620912, -1.417109, -3.58214, 1, 1, 1, 1, 1,
-1.601143, -0.6652521, -1.967736, 0, 0, 1, 1, 1,
-1.599549, 1.863328, -1.550189, 1, 0, 0, 1, 1,
-1.598249, 0.02122279, -1.396924, 1, 0, 0, 1, 1,
-1.581179, 0.8461301, -0.3264092, 1, 0, 0, 1, 1,
-1.579378, -1.359282, -4.460948, 1, 0, 0, 1, 1,
-1.569898, -0.008504761, -1.391885, 1, 0, 0, 1, 1,
-1.543716, 0.4884719, -0.5907937, 0, 0, 0, 1, 1,
-1.532445, 0.3706738, -1.918043, 0, 0, 0, 1, 1,
-1.530581, 2.485418, -1.164391, 0, 0, 0, 1, 1,
-1.523453, -1.846529, -1.631939, 0, 0, 0, 1, 1,
-1.514477, -1.229482, -4.342044, 0, 0, 0, 1, 1,
-1.512739, 1.792202, -1.595661, 0, 0, 0, 1, 1,
-1.511321, 0.8917401, -0.4881088, 0, 0, 0, 1, 1,
-1.489809, 0.1134864, -0.8406885, 1, 1, 1, 1, 1,
-1.485832, -0.5004098, -3.418071, 1, 1, 1, 1, 1,
-1.477737, -0.3238989, -1.907191, 1, 1, 1, 1, 1,
-1.46957, 0.01368284, -0.6405677, 1, 1, 1, 1, 1,
-1.466645, -0.06265834, -0.5691175, 1, 1, 1, 1, 1,
-1.460379, -1.144281, -3.01087, 1, 1, 1, 1, 1,
-1.447117, 1.192211, -0.2649432, 1, 1, 1, 1, 1,
-1.439127, 0.008583987, -2.940861, 1, 1, 1, 1, 1,
-1.433022, -0.07023808, -1.999743, 1, 1, 1, 1, 1,
-1.427089, -0.06805161, -0.681581, 1, 1, 1, 1, 1,
-1.412699, -0.0001287311, -0.2709191, 1, 1, 1, 1, 1,
-1.404787, 0.8494781, -2.862434, 1, 1, 1, 1, 1,
-1.404001, 1.11952, -0.2407311, 1, 1, 1, 1, 1,
-1.386028, -0.06736132, -1.047041, 1, 1, 1, 1, 1,
-1.379673, 0.05359032, -1.740779, 1, 1, 1, 1, 1,
-1.379642, -0.6480004, -1.252386, 0, 0, 1, 1, 1,
-1.361287, 0.1743381, -1.144103, 1, 0, 0, 1, 1,
-1.352913, -0.1269932, -1.275434, 1, 0, 0, 1, 1,
-1.338576, -1.516042, -2.372571, 1, 0, 0, 1, 1,
-1.323159, 1.794774, -0.3247451, 1, 0, 0, 1, 1,
-1.314666, 0.7938008, -0.952141, 1, 0, 0, 1, 1,
-1.306445, -0.8828536, -2.265182, 0, 0, 0, 1, 1,
-1.297236, 0.7730179, -0.3892201, 0, 0, 0, 1, 1,
-1.295246, 0.4274933, -1.022877, 0, 0, 0, 1, 1,
-1.292474, 2.581967, -0.6216866, 0, 0, 0, 1, 1,
-1.28734, 0.5940251, 0.6620499, 0, 0, 0, 1, 1,
-1.28607, 0.2193441, -1.609806, 0, 0, 0, 1, 1,
-1.275373, 1.552085, -0.9613318, 0, 0, 0, 1, 1,
-1.275246, 0.593311, -1.988532, 1, 1, 1, 1, 1,
-1.267858, 0.2879565, -2.532788, 1, 1, 1, 1, 1,
-1.243958, 0.1612775, -1.345291, 1, 1, 1, 1, 1,
-1.234708, 0.2889647, -1.994357, 1, 1, 1, 1, 1,
-1.233191, -2.229759, -2.968888, 1, 1, 1, 1, 1,
-1.230601, 0.06343167, -1.481624, 1, 1, 1, 1, 1,
-1.226878, -0.7857088, -2.964419, 1, 1, 1, 1, 1,
-1.226489, 0.2997999, -2.168831, 1, 1, 1, 1, 1,
-1.225073, -0.7613344, -2.122384, 1, 1, 1, 1, 1,
-1.223342, 1.29971, 0.2386881, 1, 1, 1, 1, 1,
-1.221154, 1.117208, -0.8913157, 1, 1, 1, 1, 1,
-1.219608, -0.370239, -0.9706174, 1, 1, 1, 1, 1,
-1.216198, -0.1434233, -1.807235, 1, 1, 1, 1, 1,
-1.214631, -1.110895, -1.522165, 1, 1, 1, 1, 1,
-1.210994, 0.01973635, -1.256787, 1, 1, 1, 1, 1,
-1.203045, 0.2676674, -2.525645, 0, 0, 1, 1, 1,
-1.196927, -1.096806, -2.377279, 1, 0, 0, 1, 1,
-1.191238, 0.01435272, -1.67014, 1, 0, 0, 1, 1,
-1.188081, -0.9443399, -3.25617, 1, 0, 0, 1, 1,
-1.179043, 0.05806184, -1.711651, 1, 0, 0, 1, 1,
-1.164856, -0.3275038, -2.774077, 1, 0, 0, 1, 1,
-1.137257, -1.677265, -2.014183, 0, 0, 0, 1, 1,
-1.133508, -1.519566, -2.076549, 0, 0, 0, 1, 1,
-1.133137, 0.7434906, -1.601595, 0, 0, 0, 1, 1,
-1.130982, -0.8668011, -0.5768096, 0, 0, 0, 1, 1,
-1.12562, -0.9775165, -2.004929, 0, 0, 0, 1, 1,
-1.123934, -1.061675, -2.804468, 0, 0, 0, 1, 1,
-1.120598, 1.066337, -1.125661, 0, 0, 0, 1, 1,
-1.116039, 0.4688115, -1.74859, 1, 1, 1, 1, 1,
-1.11258, 0.7976061, -0.03475511, 1, 1, 1, 1, 1,
-1.109111, -0.8340855, -1.924118, 1, 1, 1, 1, 1,
-1.107271, 0.350374, -0.317792, 1, 1, 1, 1, 1,
-1.107151, -0.2490582, -0.9194224, 1, 1, 1, 1, 1,
-1.102201, -0.1194003, 0.3755325, 1, 1, 1, 1, 1,
-1.100219, -0.5536123, -2.806759, 1, 1, 1, 1, 1,
-1.097396, -0.00597947, -3.66975, 1, 1, 1, 1, 1,
-1.093367, -1.209583, -2.741382, 1, 1, 1, 1, 1,
-1.092159, 1.031623, -0.9513916, 1, 1, 1, 1, 1,
-1.086879, -0.935986, -3.502192, 1, 1, 1, 1, 1,
-1.070403, 0.6714058, -0.3377544, 1, 1, 1, 1, 1,
-1.066969, -1.113237, -2.696646, 1, 1, 1, 1, 1,
-1.064869, 0.3503231, -0.5093603, 1, 1, 1, 1, 1,
-1.05593, -0.6817527, -1.968696, 1, 1, 1, 1, 1,
-1.055392, -0.906843, -1.686397, 0, 0, 1, 1, 1,
-1.050855, 0.1240398, -2.052926, 1, 0, 0, 1, 1,
-1.050405, 0.3505263, -1.805219, 1, 0, 0, 1, 1,
-1.048752, -1.448014, -0.5743337, 1, 0, 0, 1, 1,
-1.03549, -0.4252552, -0.2856381, 1, 0, 0, 1, 1,
-1.034514, 0.5674402, -2.791462, 1, 0, 0, 1, 1,
-1.033712, -0.440341, -1.251546, 0, 0, 0, 1, 1,
-1.030197, 2.336332, -0.2091046, 0, 0, 0, 1, 1,
-1.030062, 0.1103305, -2.118772, 0, 0, 0, 1, 1,
-1.026052, 0.1594427, -0.3740822, 0, 0, 0, 1, 1,
-1.024793, 0.1668578, 0.08290292, 0, 0, 0, 1, 1,
-1.023702, -0.9660621, -1.980227, 0, 0, 0, 1, 1,
-1.021335, 0.7173221, -0.1826741, 0, 0, 0, 1, 1,
-1.017935, 0.4381317, -1.228759, 1, 1, 1, 1, 1,
-1.017628, 1.474589, -1.527182, 1, 1, 1, 1, 1,
-1.009101, 0.2711912, -1.191866, 1, 1, 1, 1, 1,
-1.008897, -0.4905611, -1.80555, 1, 1, 1, 1, 1,
-1.004186, -2.093933, -3.268813, 1, 1, 1, 1, 1,
-0.9964092, -0.199351, -1.116258, 1, 1, 1, 1, 1,
-0.9870666, -0.08889437, -0.5566522, 1, 1, 1, 1, 1,
-0.9825266, -0.2341399, -2.222344, 1, 1, 1, 1, 1,
-0.9814931, 0.249062, 0.5271584, 1, 1, 1, 1, 1,
-0.9786682, -0.472724, -1.517589, 1, 1, 1, 1, 1,
-0.9776593, -0.874349, -2.155288, 1, 1, 1, 1, 1,
-0.9723962, 0.9565869, -1.279927, 1, 1, 1, 1, 1,
-0.9712644, 0.5536141, 0.02387627, 1, 1, 1, 1, 1,
-0.9628317, -2.138806, -2.465243, 1, 1, 1, 1, 1,
-0.9513877, -0.8450702, -1.549869, 1, 1, 1, 1, 1,
-0.9494802, -0.02433437, -1.346351, 0, 0, 1, 1, 1,
-0.9362815, -0.2758744, -1.844535, 1, 0, 0, 1, 1,
-0.9351789, 0.5209422, -2.396434, 1, 0, 0, 1, 1,
-0.93499, -0.3178537, -2.105256, 1, 0, 0, 1, 1,
-0.9288537, 1.187834, -0.4195538, 1, 0, 0, 1, 1,
-0.9283829, 0.06048833, -1.522638, 1, 0, 0, 1, 1,
-0.9251295, 0.8326126, -0.1018236, 0, 0, 0, 1, 1,
-0.9237019, 0.2190463, -1.487691, 0, 0, 0, 1, 1,
-0.9207563, -1.070963, -2.746299, 0, 0, 0, 1, 1,
-0.9160692, 0.9691609, -0.8029343, 0, 0, 0, 1, 1,
-0.9110689, 0.2682654, -1.561515, 0, 0, 0, 1, 1,
-0.9071434, -0.5493606, -1.87898, 0, 0, 0, 1, 1,
-0.9038833, 0.02346661, -1.463493, 0, 0, 0, 1, 1,
-0.8961397, -1.456994, -2.624048, 1, 1, 1, 1, 1,
-0.8879462, -1.123554, -3.732073, 1, 1, 1, 1, 1,
-0.8878402, 0.9578929, -0.4002289, 1, 1, 1, 1, 1,
-0.8855095, 0.3738757, -2.449109, 1, 1, 1, 1, 1,
-0.8799477, -1.209771, -1.885771, 1, 1, 1, 1, 1,
-0.8776863, -0.1734889, -2.453322, 1, 1, 1, 1, 1,
-0.8770384, 0.1251921, -1.13698, 1, 1, 1, 1, 1,
-0.8712222, 0.1055192, -2.106126, 1, 1, 1, 1, 1,
-0.8618795, -1.122733, -3.335097, 1, 1, 1, 1, 1,
-0.8609223, 1.664613, -1.481578, 1, 1, 1, 1, 1,
-0.8592621, -0.03365629, -2.510219, 1, 1, 1, 1, 1,
-0.8554527, 1.841192, -2.19749, 1, 1, 1, 1, 1,
-0.8546237, 0.3942339, -2.333816, 1, 1, 1, 1, 1,
-0.8504493, 0.6786268, -1.905484, 1, 1, 1, 1, 1,
-0.8468882, -0.7282826, -3.511616, 1, 1, 1, 1, 1,
-0.8455266, 1.03681, -0.7969315, 0, 0, 1, 1, 1,
-0.844704, 0.5810694, -1.168565, 1, 0, 0, 1, 1,
-0.8379185, 0.2643635, -1.591095, 1, 0, 0, 1, 1,
-0.8340091, 0.1483601, -1.714513, 1, 0, 0, 1, 1,
-0.8310364, -0.3074004, -1.998525, 1, 0, 0, 1, 1,
-0.8307719, -0.746796, -1.600394, 1, 0, 0, 1, 1,
-0.8300809, -1.575289, -3.499439, 0, 0, 0, 1, 1,
-0.8285365, -0.2134065, -1.157781, 0, 0, 0, 1, 1,
-0.822843, 0.2665745, -1.939913, 0, 0, 0, 1, 1,
-0.8165164, 0.6014954, -1.157948, 0, 0, 0, 1, 1,
-0.8090343, 0.2426612, -1.219653, 0, 0, 0, 1, 1,
-0.7989355, 1.373219, -0.6413417, 0, 0, 0, 1, 1,
-0.7892658, 0.2141917, -1.642281, 0, 0, 0, 1, 1,
-0.7888252, -1.850162, -1.417296, 1, 1, 1, 1, 1,
-0.788169, 0.02534377, -1.696003, 1, 1, 1, 1, 1,
-0.7879921, -1.435454, -2.881851, 1, 1, 1, 1, 1,
-0.7781332, -0.4867112, -2.73407, 1, 1, 1, 1, 1,
-0.7721323, -0.8583668, -3.233657, 1, 1, 1, 1, 1,
-0.7669998, 1.300987, -1.825316, 1, 1, 1, 1, 1,
-0.7629275, 0.5983882, -2.619333, 1, 1, 1, 1, 1,
-0.7575444, -0.6321204, -0.7470433, 1, 1, 1, 1, 1,
-0.7548636, -0.003676647, -3.181674, 1, 1, 1, 1, 1,
-0.7526947, 0.7168923, -1.468974, 1, 1, 1, 1, 1,
-0.7496724, 0.4372471, -1.305405, 1, 1, 1, 1, 1,
-0.7415143, -0.002285813, -0.9223324, 1, 1, 1, 1, 1,
-0.7276865, -0.04908063, -0.6251003, 1, 1, 1, 1, 1,
-0.720785, -0.536683, -3.209159, 1, 1, 1, 1, 1,
-0.7146027, -0.2797211, -2.615243, 1, 1, 1, 1, 1,
-0.7144969, 0.9214724, -1.232051, 0, 0, 1, 1, 1,
-0.7137988, 0.870772, -1.823286, 1, 0, 0, 1, 1,
-0.707339, -0.8069848, -4.223485, 1, 0, 0, 1, 1,
-0.6941347, -0.158199, -0.4601993, 1, 0, 0, 1, 1,
-0.6804124, -1.033629, -3.174265, 1, 0, 0, 1, 1,
-0.6785995, 0.7185991, -0.3744335, 1, 0, 0, 1, 1,
-0.6760355, -0.3904777, -0.05970994, 0, 0, 0, 1, 1,
-0.6758785, 0.1824345, -2.294726, 0, 0, 0, 1, 1,
-0.6747791, -0.9938744, -2.33882, 0, 0, 0, 1, 1,
-0.6653595, 0.4300581, 0.4368839, 0, 0, 0, 1, 1,
-0.6653033, -0.745824, -2.240565, 0, 0, 0, 1, 1,
-0.657415, -1.753493, -3.434512, 0, 0, 0, 1, 1,
-0.6532676, -0.7405292, -4.794655, 0, 0, 0, 1, 1,
-0.6515704, -2.935066, -5.756493, 1, 1, 1, 1, 1,
-0.6458079, 0.5188518, -2.25391, 1, 1, 1, 1, 1,
-0.6447505, -2.031789, -3.896501, 1, 1, 1, 1, 1,
-0.63993, 2.532449, -1.024721, 1, 1, 1, 1, 1,
-0.6366081, 0.5345909, -2.220691, 1, 1, 1, 1, 1,
-0.629622, -0.3564405, -1.536746, 1, 1, 1, 1, 1,
-0.6290628, -1.02639, -2.323354, 1, 1, 1, 1, 1,
-0.6272265, 0.1329854, -2.008651, 1, 1, 1, 1, 1,
-0.626586, -0.3104958, -2.132948, 1, 1, 1, 1, 1,
-0.6242521, -1.23506, -1.707913, 1, 1, 1, 1, 1,
-0.61183, 0.1253468, -2.513406, 1, 1, 1, 1, 1,
-0.6102396, -0.09701063, -2.483318, 1, 1, 1, 1, 1,
-0.6095703, -1.924166, -3.186433, 1, 1, 1, 1, 1,
-0.6068026, -0.1375844, -2.38024, 1, 1, 1, 1, 1,
-0.6060715, -0.500301, -3.667475, 1, 1, 1, 1, 1,
-0.5988876, 2.821763, 1.018888, 0, 0, 1, 1, 1,
-0.5972517, -1.872509, -2.443761, 1, 0, 0, 1, 1,
-0.5938712, -0.5356903, -1.903551, 1, 0, 0, 1, 1,
-0.5881022, 0.2896194, -1.261173, 1, 0, 0, 1, 1,
-0.5822042, -0.9021818, -2.035251, 1, 0, 0, 1, 1,
-0.5767269, 0.2503277, -2.25752, 1, 0, 0, 1, 1,
-0.569171, 0.3416649, -0.9095523, 0, 0, 0, 1, 1,
-0.5594875, -0.2571057, -0.8315678, 0, 0, 0, 1, 1,
-0.5549387, -0.4657473, -1.580566, 0, 0, 0, 1, 1,
-0.5525371, 0.2045471, 1.385928, 0, 0, 0, 1, 1,
-0.5508101, 0.2187093, -1.342427, 0, 0, 0, 1, 1,
-0.5481532, 0.1781345, -1.435576, 0, 0, 0, 1, 1,
-0.5476325, 1.25469, -1.078768, 0, 0, 0, 1, 1,
-0.5448475, -2.04722, -1.413855, 1, 1, 1, 1, 1,
-0.543433, 1.073688, 1.112864, 1, 1, 1, 1, 1,
-0.5417953, 0.1827569, -1.000799, 1, 1, 1, 1, 1,
-0.5390308, -0.2653559, -3.609746, 1, 1, 1, 1, 1,
-0.5386922, -0.1231525, -1.459307, 1, 1, 1, 1, 1,
-0.5382821, 0.3805919, -1.202209, 1, 1, 1, 1, 1,
-0.5337156, -0.596038, -2.755587, 1, 1, 1, 1, 1,
-0.5275935, 0.09970479, -0.5818854, 1, 1, 1, 1, 1,
-0.5243197, -0.009330285, -2.104368, 1, 1, 1, 1, 1,
-0.5238435, 0.2256973, -1.300532, 1, 1, 1, 1, 1,
-0.5236775, 1.37512, -0.6322122, 1, 1, 1, 1, 1,
-0.520709, -0.3860352, -1.299404, 1, 1, 1, 1, 1,
-0.5199658, -1.711052, -3.78235, 1, 1, 1, 1, 1,
-0.5124615, 0.5024748, -0.3771977, 1, 1, 1, 1, 1,
-0.5122488, -0.1948341, -2.185292, 1, 1, 1, 1, 1,
-0.5040533, -0.5694405, -0.8553303, 0, 0, 1, 1, 1,
-0.5021753, 0.285217, -0.2523727, 1, 0, 0, 1, 1,
-0.5015116, -0.1812392, -0.5484471, 1, 0, 0, 1, 1,
-0.5008054, 0.6554851, 1.404322, 1, 0, 0, 1, 1,
-0.5003874, 1.083045, -0.7011359, 1, 0, 0, 1, 1,
-0.4969249, 0.2266747, 1.327485, 1, 0, 0, 1, 1,
-0.4900702, 0.6662228, -2.147762, 0, 0, 0, 1, 1,
-0.4894, 0.6544849, -0.2437445, 0, 0, 0, 1, 1,
-0.4888939, 0.8270523, 0.1005818, 0, 0, 0, 1, 1,
-0.4884059, 0.4682665, -0.8888991, 0, 0, 0, 1, 1,
-0.4883983, -1.975291, -4.011413, 0, 0, 0, 1, 1,
-0.4862635, -0.6662689, -2.779218, 0, 0, 0, 1, 1,
-0.4808424, -0.1804526, -2.354276, 0, 0, 0, 1, 1,
-0.4790521, -1.346317, -2.184357, 1, 1, 1, 1, 1,
-0.4749461, -0.0611923, -0.4926394, 1, 1, 1, 1, 1,
-0.4745081, -0.874854, -2.574632, 1, 1, 1, 1, 1,
-0.4717287, 0.0369148, -1.051035, 1, 1, 1, 1, 1,
-0.4672502, -0.7160144, -1.612672, 1, 1, 1, 1, 1,
-0.4631608, 1.13264, 0.384825, 1, 1, 1, 1, 1,
-0.4617953, 1.446259, -0.2172477, 1, 1, 1, 1, 1,
-0.4616344, 0.3563234, -0.02536628, 1, 1, 1, 1, 1,
-0.4614443, 0.3125197, -0.7141499, 1, 1, 1, 1, 1,
-0.4603677, -0.09450208, -1.872005, 1, 1, 1, 1, 1,
-0.4602763, 0.3285008, -2.521711, 1, 1, 1, 1, 1,
-0.4595293, 0.1545465, -1.554938, 1, 1, 1, 1, 1,
-0.4585035, 0.5476952, -0.5847633, 1, 1, 1, 1, 1,
-0.4525121, -0.2772719, -2.661647, 1, 1, 1, 1, 1,
-0.4524718, 0.6910189, 1.459603, 1, 1, 1, 1, 1,
-0.4501288, 0.03351322, -1.999346, 0, 0, 1, 1, 1,
-0.4496732, 0.8947056, -0.8560123, 1, 0, 0, 1, 1,
-0.446933, -0.2065375, -1.388167, 1, 0, 0, 1, 1,
-0.4389916, 0.2332622, -1.141792, 1, 0, 0, 1, 1,
-0.437659, 0.5233891, 0.3957651, 1, 0, 0, 1, 1,
-0.4324375, 0.549239, -1.501821, 1, 0, 0, 1, 1,
-0.4294003, 0.07107083, -1.689536, 0, 0, 0, 1, 1,
-0.4277712, -3.471739, -5.262794, 0, 0, 0, 1, 1,
-0.4167679, 0.5026016, -0.6064273, 0, 0, 0, 1, 1,
-0.4122138, -0.647319, -2.745287, 0, 0, 0, 1, 1,
-0.411955, -0.761043, -1.689711, 0, 0, 0, 1, 1,
-0.4112413, 0.1876045, -1.938983, 0, 0, 0, 1, 1,
-0.4090911, 0.1975482, -1.618956, 0, 0, 0, 1, 1,
-0.4066418, -1.657238, -2.157336, 1, 1, 1, 1, 1,
-0.4009775, -0.2302799, -2.332311, 1, 1, 1, 1, 1,
-0.3978695, -1.936365, -2.32302, 1, 1, 1, 1, 1,
-0.3934912, -0.9309603, -2.349949, 1, 1, 1, 1, 1,
-0.391821, 1.912587, -2.559654, 1, 1, 1, 1, 1,
-0.39132, -0.4867573, -3.972749, 1, 1, 1, 1, 1,
-0.3889896, 1.409204, 0.002984296, 1, 1, 1, 1, 1,
-0.3802307, 0.1340609, -1.556257, 1, 1, 1, 1, 1,
-0.3797338, 0.3331679, -1.144307, 1, 1, 1, 1, 1,
-0.3773817, 0.5352371, -0.3441289, 1, 1, 1, 1, 1,
-0.376822, -0.02205573, -1.410254, 1, 1, 1, 1, 1,
-0.376653, -0.1832408, 0.3068755, 1, 1, 1, 1, 1,
-0.3716583, -0.223283, -1.416802, 1, 1, 1, 1, 1,
-0.3686309, 2.236979, -1.805902, 1, 1, 1, 1, 1,
-0.3651302, -2.198284, -3.006506, 1, 1, 1, 1, 1,
-0.3611373, -1.016701, -3.724787, 0, 0, 1, 1, 1,
-0.3597675, 0.5146437, -1.387727, 1, 0, 0, 1, 1,
-0.3557515, -0.06158347, -1.662598, 1, 0, 0, 1, 1,
-0.352816, 0.05198764, -2.276918, 1, 0, 0, 1, 1,
-0.3525144, 0.04185004, -2.05634, 1, 0, 0, 1, 1,
-0.3506258, 0.550885, 0.9592863, 1, 0, 0, 1, 1,
-0.3446333, -1.029448, -4.13297, 0, 0, 0, 1, 1,
-0.3432107, -0.2774884, -4.254606, 0, 0, 0, 1, 1,
-0.3430341, 0.9532741, -0.6489586, 0, 0, 0, 1, 1,
-0.3424846, 0.9784979, -1.641375, 0, 0, 0, 1, 1,
-0.3403037, -0.7471985, -4.076277, 0, 0, 0, 1, 1,
-0.3390961, 0.2892996, -0.9803605, 0, 0, 0, 1, 1,
-0.3388114, 0.08501098, -0.4909996, 0, 0, 0, 1, 1,
-0.333488, -0.4525113, -2.56001, 1, 1, 1, 1, 1,
-0.3332658, -0.5712364, -1.829769, 1, 1, 1, 1, 1,
-0.3293236, -1.035033, -3.648116, 1, 1, 1, 1, 1,
-0.3270915, 0.5646855, 0.7691005, 1, 1, 1, 1, 1,
-0.3260873, -1.163193, -3.812936, 1, 1, 1, 1, 1,
-0.3228684, 1.335344, -0.6639255, 1, 1, 1, 1, 1,
-0.3224333, -0.4152605, -2.116264, 1, 1, 1, 1, 1,
-0.3212376, 0.9830001, -0.6007609, 1, 1, 1, 1, 1,
-0.3209477, -0.9013953, -1.505242, 1, 1, 1, 1, 1,
-0.3198211, 0.2272721, -1.169819, 1, 1, 1, 1, 1,
-0.3176645, -0.6631655, -1.957595, 1, 1, 1, 1, 1,
-0.3153599, -0.9952703, -1.361301, 1, 1, 1, 1, 1,
-0.3139974, 0.6323258, -0.7622314, 1, 1, 1, 1, 1,
-0.3081392, 0.642723, -1.265545, 1, 1, 1, 1, 1,
-0.307926, -0.05728195, -1.630405, 1, 1, 1, 1, 1,
-0.3046463, -0.8722364, -1.560351, 0, 0, 1, 1, 1,
-0.2985701, -1.948779, -4.445111, 1, 0, 0, 1, 1,
-0.2949223, 0.2945981, -1.100855, 1, 0, 0, 1, 1,
-0.2949042, 0.1100583, -1.490061, 1, 0, 0, 1, 1,
-0.2904602, 0.7640837, -0.8015892, 1, 0, 0, 1, 1,
-0.2902572, -1.007268, -3.131535, 1, 0, 0, 1, 1,
-0.2902161, 0.9240668, -0.3075618, 0, 0, 0, 1, 1,
-0.2887421, -1.467415, -3.150018, 0, 0, 0, 1, 1,
-0.2864005, 0.2593167, 0.1752049, 0, 0, 0, 1, 1,
-0.2827654, 0.3564703, -1.641973, 0, 0, 0, 1, 1,
-0.2758693, 0.3277795, -1.43927, 0, 0, 0, 1, 1,
-0.2722793, 0.08824541, -1.218905, 0, 0, 0, 1, 1,
-0.2661593, -0.8675611, -0.04588783, 0, 0, 0, 1, 1,
-0.2561055, 1.02355, -0.2035765, 1, 1, 1, 1, 1,
-0.2560178, -0.3161758, -2.972286, 1, 1, 1, 1, 1,
-0.2544543, -1.141263, -3.336155, 1, 1, 1, 1, 1,
-0.2518439, -0.5402068, -3.242325, 1, 1, 1, 1, 1,
-0.2504942, -1.080544, -3.414356, 1, 1, 1, 1, 1,
-0.2477091, -1.095027, -3.737853, 1, 1, 1, 1, 1,
-0.2452172, 0.08259363, -3.026702, 1, 1, 1, 1, 1,
-0.2435568, 0.4409771, 0.7155631, 1, 1, 1, 1, 1,
-0.2435229, -0.6560733, -3.217365, 1, 1, 1, 1, 1,
-0.2371207, 0.7420499, -0.9369523, 1, 1, 1, 1, 1,
-0.2352206, -0.6528444, -3.635391, 1, 1, 1, 1, 1,
-0.2344577, 0.2175098, -3.598345, 1, 1, 1, 1, 1,
-0.2319592, 0.7978758, -1.712567, 1, 1, 1, 1, 1,
-0.231716, 0.9295313, -1.326929, 1, 1, 1, 1, 1,
-0.2312158, -0.7021908, -4.042042, 1, 1, 1, 1, 1,
-0.230952, 1.507747, -0.04916789, 0, 0, 1, 1, 1,
-0.2308582, 1.453857, -1.108166, 1, 0, 0, 1, 1,
-0.2240555, 0.9108437, 0.3543231, 1, 0, 0, 1, 1,
-0.2207698, -0.4839226, -3.482834, 1, 0, 0, 1, 1,
-0.219957, -1.482233, -2.259604, 1, 0, 0, 1, 1,
-0.21458, -0.4424593, -3.15003, 1, 0, 0, 1, 1,
-0.2132519, -0.2522888, -2.462966, 0, 0, 0, 1, 1,
-0.2110127, 1.24389, 2.093099, 0, 0, 0, 1, 1,
-0.2100343, -0.7561702, -1.355534, 0, 0, 0, 1, 1,
-0.2051189, 0.009878795, -1.637592, 0, 0, 0, 1, 1,
-0.2034564, -0.8417989, -2.626768, 0, 0, 0, 1, 1,
-0.2014474, 0.8337408, -0.03300333, 0, 0, 0, 1, 1,
-0.2002143, -0.6058305, -2.421382, 0, 0, 0, 1, 1,
-0.2001712, 0.5584329, -1.249199, 1, 1, 1, 1, 1,
-0.1978697, 0.3921195, -0.4687618, 1, 1, 1, 1, 1,
-0.1941572, -0.4009018, -3.228698, 1, 1, 1, 1, 1,
-0.1930295, 0.8445733, 0.140798, 1, 1, 1, 1, 1,
-0.1904232, -0.3544683, -2.45681, 1, 1, 1, 1, 1,
-0.1889022, -0.6778358, -2.150325, 1, 1, 1, 1, 1,
-0.1886272, 0.1051847, -0.2926121, 1, 1, 1, 1, 1,
-0.1883093, -1.072966, -3.811046, 1, 1, 1, 1, 1,
-0.1868848, 1.165102, 0.4150529, 1, 1, 1, 1, 1,
-0.1856849, -1.343522, -2.735849, 1, 1, 1, 1, 1,
-0.1850678, 0.1607241, -1.131029, 1, 1, 1, 1, 1,
-0.1834201, -0.4258827, -3.451673, 1, 1, 1, 1, 1,
-0.1830097, 0.4466074, -0.4642496, 1, 1, 1, 1, 1,
-0.1813954, 0.9225565, -0.1794885, 1, 1, 1, 1, 1,
-0.1713286, 1.063524, 0.1788202, 1, 1, 1, 1, 1,
-0.1669058, 0.1551979, 0.8152694, 0, 0, 1, 1, 1,
-0.1661811, 0.7589184, 1.386064, 1, 0, 0, 1, 1,
-0.1639285, 1.461724, -1.579729, 1, 0, 0, 1, 1,
-0.1630599, 0.9652966, 0.652288, 1, 0, 0, 1, 1,
-0.1594856, 0.5878258, 2.024628, 1, 0, 0, 1, 1,
-0.1586755, -1.867601, -2.434356, 1, 0, 0, 1, 1,
-0.1485371, -0.1547337, -1.5807, 0, 0, 0, 1, 1,
-0.142248, -0.3960158, -2.467422, 0, 0, 0, 1, 1,
-0.1411278, 0.6544822, -0.5744045, 0, 0, 0, 1, 1,
-0.1409001, 1.49051, 2.100243, 0, 0, 0, 1, 1,
-0.1397435, -2.426437, -4.251168, 0, 0, 0, 1, 1,
-0.1358149, -0.7320561, -4.507801, 0, 0, 0, 1, 1,
-0.135392, 0.3240227, -2.343685, 0, 0, 0, 1, 1,
-0.1224892, -0.169563, -0.3526773, 1, 1, 1, 1, 1,
-0.1202308, -0.03837512, -2.180221, 1, 1, 1, 1, 1,
-0.1190139, 0.7487347, -0.8877186, 1, 1, 1, 1, 1,
-0.1170496, -1.75051, -3.643668, 1, 1, 1, 1, 1,
-0.1106831, 0.9599633, 0.9694387, 1, 1, 1, 1, 1,
-0.1051288, -0.5702856, -4.086112, 1, 1, 1, 1, 1,
-0.1026194, 0.3018681, 0.9338816, 1, 1, 1, 1, 1,
-0.1012297, 0.6002493, -0.2297186, 1, 1, 1, 1, 1,
-0.09187745, -1.182947, -3.584716, 1, 1, 1, 1, 1,
-0.09152915, 0.9673559, -0.2280124, 1, 1, 1, 1, 1,
-0.09010163, -0.0537204, -1.595037, 1, 1, 1, 1, 1,
-0.08809344, 1.099376, 1.247036, 1, 1, 1, 1, 1,
-0.08663654, -1.473128, -3.799174, 1, 1, 1, 1, 1,
-0.08392975, -0.6786951, -4.688016, 1, 1, 1, 1, 1,
-0.08379719, 1.56059, -0.245086, 1, 1, 1, 1, 1,
-0.07918794, -0.1295084, -2.051296, 0, 0, 1, 1, 1,
-0.07551672, -1.211446, -4.150249, 1, 0, 0, 1, 1,
-0.07304899, -1.316188, -2.020026, 1, 0, 0, 1, 1,
-0.0726525, 1.073089, -2.21367, 1, 0, 0, 1, 1,
-0.06944184, 0.9137051, -0.909956, 1, 0, 0, 1, 1,
-0.06913204, -0.1796167, -2.82739, 1, 0, 0, 1, 1,
-0.06490766, -0.2904007, -3.944978, 0, 0, 0, 1, 1,
-0.06349024, -0.8679827, -1.871969, 0, 0, 0, 1, 1,
-0.0600205, -0.1161647, -3.762558, 0, 0, 0, 1, 1,
-0.05900451, -0.7246112, -3.222388, 0, 0, 0, 1, 1,
-0.0582805, -0.5583681, -2.596079, 0, 0, 0, 1, 1,
-0.05182149, 0.5310684, -0.4267833, 0, 0, 0, 1, 1,
-0.04745748, -0.02717145, -1.958303, 0, 0, 0, 1, 1,
-0.04682569, -1.196197, -2.68302, 1, 1, 1, 1, 1,
-0.04551576, -1.558283, -3.721972, 1, 1, 1, 1, 1,
-0.04221221, 1.400438, -0.5358381, 1, 1, 1, 1, 1,
-0.04110562, -0.5247063, -2.665348, 1, 1, 1, 1, 1,
-0.03978388, 0.4543647, -1.352393, 1, 1, 1, 1, 1,
-0.03692897, 0.1568037, -0.3382066, 1, 1, 1, 1, 1,
-0.0368749, 1.407671, -0.8608575, 1, 1, 1, 1, 1,
-0.03632606, -0.1404571, -3.342029, 1, 1, 1, 1, 1,
-0.03275526, 0.2706204, -0.8894972, 1, 1, 1, 1, 1,
-0.03270726, -1.459088, -3.303917, 1, 1, 1, 1, 1,
-0.03132171, 0.01595224, -0.1292893, 1, 1, 1, 1, 1,
-0.0278507, -2.343105, -3.536593, 1, 1, 1, 1, 1,
-0.02751315, 0.8866674, -0.3680539, 1, 1, 1, 1, 1,
-0.02237115, 0.7563773, -1.034997, 1, 1, 1, 1, 1,
-0.02227532, -0.1453838, -1.928631, 1, 1, 1, 1, 1,
-0.02184306, -0.9230254, -3.403935, 0, 0, 1, 1, 1,
-0.02006795, -0.2689218, -2.036, 1, 0, 0, 1, 1,
-0.01933989, -1.49882, -3.070779, 1, 0, 0, 1, 1,
-0.01856898, 0.5504199, -0.1746916, 1, 0, 0, 1, 1,
-0.0174193, 0.1771907, -0.07937063, 1, 0, 0, 1, 1,
-0.0150695, -0.827964, -3.245563, 1, 0, 0, 1, 1,
-0.01445227, 0.7980068, 0.4595092, 0, 0, 0, 1, 1,
-0.01373948, 0.03743472, -0.2885599, 0, 0, 0, 1, 1,
-0.008143596, -0.1377495, -2.697216, 0, 0, 0, 1, 1,
-0.00780109, -0.2455253, -3.801462, 0, 0, 0, 1, 1,
-0.006501582, -1.642477, -3.070338, 0, 0, 0, 1, 1,
-0.006349158, -0.003891623, -2.62519, 0, 0, 0, 1, 1,
-0.0009278582, 1.191744, 0.6594572, 0, 0, 0, 1, 1,
-0.0007586771, -2.225533, -3.148073, 1, 1, 1, 1, 1,
0.0001390693, -0.958268, 2.056526, 1, 1, 1, 1, 1,
0.003467494, 0.5191706, 0.8593157, 1, 1, 1, 1, 1,
0.005581032, -1.861387, 3.797497, 1, 1, 1, 1, 1,
0.006147673, -0.1647191, 3.238637, 1, 1, 1, 1, 1,
0.006414844, 1.16331, 2.118344, 1, 1, 1, 1, 1,
0.01351249, -1.055244, 3.79995, 1, 1, 1, 1, 1,
0.0139309, -0.3755045, 3.510318, 1, 1, 1, 1, 1,
0.01707447, -1.152073, 2.31108, 1, 1, 1, 1, 1,
0.01746618, -0.3996425, 2.070675, 1, 1, 1, 1, 1,
0.01822764, 2.149176, 0.7339162, 1, 1, 1, 1, 1,
0.01955103, 0.3868729, -0.1586204, 1, 1, 1, 1, 1,
0.02050474, 0.1261129, 0.442662, 1, 1, 1, 1, 1,
0.02246803, 1.319347, 0.2058388, 1, 1, 1, 1, 1,
0.0239394, 1.762325, 0.5310673, 1, 1, 1, 1, 1,
0.02803784, -0.5055132, 3.635377, 0, 0, 1, 1, 1,
0.02856756, 0.7702856, -0.3113836, 1, 0, 0, 1, 1,
0.02950865, 0.4577066, 1.015121, 1, 0, 0, 1, 1,
0.02986641, -1.11033, 4.072372, 1, 0, 0, 1, 1,
0.03102538, 1.386727, 1.334402, 1, 0, 0, 1, 1,
0.03195416, -0.2198303, 3.089181, 1, 0, 0, 1, 1,
0.03398399, 1.23274, 0.2992802, 0, 0, 0, 1, 1,
0.04237687, -0.6377507, 2.76867, 0, 0, 0, 1, 1,
0.0430796, 0.9600947, -0.6909183, 0, 0, 0, 1, 1,
0.04610742, -2.03521, 2.127172, 0, 0, 0, 1, 1,
0.04761728, -0.1516702, 2.833338, 0, 0, 0, 1, 1,
0.04963532, 0.0195059, 1.350106, 0, 0, 0, 1, 1,
0.05183676, -0.5415465, 4.449029, 0, 0, 0, 1, 1,
0.05186597, -1.494072, 3.179868, 1, 1, 1, 1, 1,
0.05212691, -0.5513431, 4.878299, 1, 1, 1, 1, 1,
0.05258736, -1.185663, 4.068824, 1, 1, 1, 1, 1,
0.05598783, -1.51888, 1.665057, 1, 1, 1, 1, 1,
0.05609816, 0.427389, -0.1030148, 1, 1, 1, 1, 1,
0.05811367, 0.6442237, -2.216328, 1, 1, 1, 1, 1,
0.05894578, 0.2112286, 2.735019, 1, 1, 1, 1, 1,
0.06160185, -0.7265007, 5.081798, 1, 1, 1, 1, 1,
0.06318048, 1.306427, 1.568698, 1, 1, 1, 1, 1,
0.06327069, 0.949518, 1.805746, 1, 1, 1, 1, 1,
0.0633157, 0.778465, 0.2562543, 1, 1, 1, 1, 1,
0.06765629, 0.00144199, 1.149621, 1, 1, 1, 1, 1,
0.06993936, -0.05393487, 3.126974, 1, 1, 1, 1, 1,
0.07001174, 2.452367, -0.421766, 1, 1, 1, 1, 1,
0.07222473, 0.2020589, -0.3036946, 1, 1, 1, 1, 1,
0.07647952, -0.1432731, 1.755334, 0, 0, 1, 1, 1,
0.07775269, -1.163815, 0.8210014, 1, 0, 0, 1, 1,
0.08469436, -0.9033604, 4.280305, 1, 0, 0, 1, 1,
0.08862146, 0.08997142, 2.41617, 1, 0, 0, 1, 1,
0.0890481, -1.053461, 3.354977, 1, 0, 0, 1, 1,
0.09733471, 0.02463847, 1.156373, 1, 0, 0, 1, 1,
0.09781028, -0.5021574, 3.579185, 0, 0, 0, 1, 1,
0.1094586, -0.173316, 3.356046, 0, 0, 0, 1, 1,
0.115009, -0.1413132, 2.46438, 0, 0, 0, 1, 1,
0.1176551, 0.01320018, 1.892035, 0, 0, 0, 1, 1,
0.1179355, -1.352129, 4.045738, 0, 0, 0, 1, 1,
0.1239168, 0.3526933, 0.06030095, 0, 0, 0, 1, 1,
0.1279427, -0.2635821, 2.501826, 0, 0, 0, 1, 1,
0.1311172, -0.449004, 4.600989, 1, 1, 1, 1, 1,
0.1346992, -0.9478181, 3.576723, 1, 1, 1, 1, 1,
0.1349559, 0.6534719, 0.6799967, 1, 1, 1, 1, 1,
0.1350203, -0.02264211, -0.2285955, 1, 1, 1, 1, 1,
0.1379864, 0.54449, -0.5921293, 1, 1, 1, 1, 1,
0.142395, 0.3942508, -0.4865455, 1, 1, 1, 1, 1,
0.1434717, 1.608634, 0.4785472, 1, 1, 1, 1, 1,
0.1493259, 2.101175, 2.034623, 1, 1, 1, 1, 1,
0.1498236, -0.7259444, 2.745559, 1, 1, 1, 1, 1,
0.1530447, 0.1912275, 2.54897, 1, 1, 1, 1, 1,
0.1538009, 0.5184786, 0.06391847, 1, 1, 1, 1, 1,
0.1545463, 1.175118, 1.957807, 1, 1, 1, 1, 1,
0.159146, 0.5573564, 0.3925526, 1, 1, 1, 1, 1,
0.1592481, 0.2615154, 0.541532, 1, 1, 1, 1, 1,
0.1623554, -0.5487127, 2.216831, 1, 1, 1, 1, 1,
0.1628838, 2.223021, -1.245046, 0, 0, 1, 1, 1,
0.1671671, 0.07842211, 1.793499, 1, 0, 0, 1, 1,
0.168138, 0.8717905, 1.484844, 1, 0, 0, 1, 1,
0.169564, 0.7636172, -0.6227755, 1, 0, 0, 1, 1,
0.1851038, 0.9865595, -0.289291, 1, 0, 0, 1, 1,
0.1861852, 0.3810138, -0.6918307, 1, 0, 0, 1, 1,
0.1881509, -0.6973912, 3.702141, 0, 0, 0, 1, 1,
0.1900764, -0.2094821, 2.79974, 0, 0, 0, 1, 1,
0.1908975, 1.474593, 0.7536914, 0, 0, 0, 1, 1,
0.1936521, 0.8340108, -0.1788271, 0, 0, 0, 1, 1,
0.1956449, -0.425984, 5.457081, 0, 0, 0, 1, 1,
0.2045558, -0.08360171, 4.751377, 0, 0, 0, 1, 1,
0.2058706, -0.8282754, 2.946433, 0, 0, 0, 1, 1,
0.2068186, 0.9996508, 0.539292, 1, 1, 1, 1, 1,
0.2082647, 0.04684257, 0.03754067, 1, 1, 1, 1, 1,
0.2085324, -0.4039387, 3.702828, 1, 1, 1, 1, 1,
0.2103576, -0.2607227, 1.292304, 1, 1, 1, 1, 1,
0.2109655, -0.7840414, 2.35805, 1, 1, 1, 1, 1,
0.2110473, -0.5619127, 2.246489, 1, 1, 1, 1, 1,
0.2140729, -0.7795744, 4.347187, 1, 1, 1, 1, 1,
0.2215153, 1.528172, 0.4432624, 1, 1, 1, 1, 1,
0.2240878, 0.6854309, 0.8428552, 1, 1, 1, 1, 1,
0.224753, -1.185615, 1.956218, 1, 1, 1, 1, 1,
0.2269958, -0.2794852, 4.804018, 1, 1, 1, 1, 1,
0.2300667, 1.171839, -1.592797, 1, 1, 1, 1, 1,
0.2300983, -0.3589737, 3.246926, 1, 1, 1, 1, 1,
0.2386383, 1.085455, 2.218863, 1, 1, 1, 1, 1,
0.2420364, -0.6892291, 2.48813, 1, 1, 1, 1, 1,
0.2432847, -0.7205027, 4.117509, 0, 0, 1, 1, 1,
0.2474905, -0.436352, 3.74531, 1, 0, 0, 1, 1,
0.2487747, -0.5923308, 2.359764, 1, 0, 0, 1, 1,
0.2518379, -1.12983, 1.378553, 1, 0, 0, 1, 1,
0.2526502, -0.4414524, 1.271374, 1, 0, 0, 1, 1,
0.2534145, 1.888707, 0.8709018, 1, 0, 0, 1, 1,
0.256767, 1.615672, -0.1034636, 0, 0, 0, 1, 1,
0.2569942, 2.971456, 0.9791235, 0, 0, 0, 1, 1,
0.2582483, 0.7588912, 1.130901, 0, 0, 0, 1, 1,
0.2592487, -0.9380746, 3.826411, 0, 0, 0, 1, 1,
0.2643879, -0.4545066, 1.01197, 0, 0, 0, 1, 1,
0.2657303, -2.458547, 1.933957, 0, 0, 0, 1, 1,
0.2680539, -2.145805, 2.680771, 0, 0, 0, 1, 1,
0.274063, 0.2872624, 1.5547, 1, 1, 1, 1, 1,
0.2745832, -0.9747669, 4.28635, 1, 1, 1, 1, 1,
0.27465, 0.9564691, 0.02537111, 1, 1, 1, 1, 1,
0.2750141, 1.277013, 1.202591, 1, 1, 1, 1, 1,
0.2753978, 0.1096731, 1.728611, 1, 1, 1, 1, 1,
0.2760318, 0.6820019, 0.2205497, 1, 1, 1, 1, 1,
0.2774392, 1.302262, -1.049745, 1, 1, 1, 1, 1,
0.2782363, -0.456177, 2.971871, 1, 1, 1, 1, 1,
0.2790405, 0.8148702, 0.4407647, 1, 1, 1, 1, 1,
0.2862252, 1.092983, -0.4553841, 1, 1, 1, 1, 1,
0.2875841, 0.8628341, -0.1007276, 1, 1, 1, 1, 1,
0.2883887, -0.4935678, 2.955433, 1, 1, 1, 1, 1,
0.2917177, 0.7287608, 2.201694, 1, 1, 1, 1, 1,
0.2940162, 0.6767006, -0.6515218, 1, 1, 1, 1, 1,
0.295696, -0.8893893, 3.569813, 1, 1, 1, 1, 1,
0.2963185, 0.5542007, 1.800942, 0, 0, 1, 1, 1,
0.2967706, -0.03300558, 2.092, 1, 0, 0, 1, 1,
0.2987917, 1.186771, -0.6742102, 1, 0, 0, 1, 1,
0.3005594, -0.9911098, 3.755464, 1, 0, 0, 1, 1,
0.3034101, -0.4722191, 3.494557, 1, 0, 0, 1, 1,
0.3046806, 0.4935024, 0.5165978, 1, 0, 0, 1, 1,
0.3057491, 1.060677, 0.3138269, 0, 0, 0, 1, 1,
0.315809, 0.5719122, 0.3316821, 0, 0, 0, 1, 1,
0.3228536, 0.7021648, 1.131772, 0, 0, 0, 1, 1,
0.3230195, -0.3588313, 2.668655, 0, 0, 0, 1, 1,
0.3230894, -0.9109877, 2.515459, 0, 0, 0, 1, 1,
0.3274282, -0.9564153, 4.509668, 0, 0, 0, 1, 1,
0.3294072, -0.4351082, 2.722616, 0, 0, 0, 1, 1,
0.3306977, -1.543477, 3.199295, 1, 1, 1, 1, 1,
0.3351711, -0.7836123, 3.15516, 1, 1, 1, 1, 1,
0.3355011, -0.1972818, 0.5850387, 1, 1, 1, 1, 1,
0.3355199, 0.03164895, 1.709952, 1, 1, 1, 1, 1,
0.3362585, 1.334602, 0.8664228, 1, 1, 1, 1, 1,
0.3368962, 0.6729293, 1.901633, 1, 1, 1, 1, 1,
0.336976, 0.4767553, 0.8857265, 1, 1, 1, 1, 1,
0.342436, -0.7554108, 1.694651, 1, 1, 1, 1, 1,
0.3436063, -0.9737192, 3.204845, 1, 1, 1, 1, 1,
0.3453538, 0.850545, 0.2285968, 1, 1, 1, 1, 1,
0.3458109, 0.4824847, 0.9725929, 1, 1, 1, 1, 1,
0.3458286, 1.817373, -0.2794579, 1, 1, 1, 1, 1,
0.351191, -0.633013, 3.436031, 1, 1, 1, 1, 1,
0.3520801, 0.1481012, 2.293282, 1, 1, 1, 1, 1,
0.3662855, 1.473502, -0.4533643, 1, 1, 1, 1, 1,
0.3668369, 1.078657, 1.194774, 0, 0, 1, 1, 1,
0.3685238, 1.375676, -2.319219, 1, 0, 0, 1, 1,
0.3749307, -1.470484, 1.363122, 1, 0, 0, 1, 1,
0.3854839, -1.111477, 2.653212, 1, 0, 0, 1, 1,
0.3859168, 0.2655667, 1.907917, 1, 0, 0, 1, 1,
0.3948238, 0.1429908, 1.008691, 1, 0, 0, 1, 1,
0.398673, -0.7072073, 2.698425, 0, 0, 0, 1, 1,
0.3991863, 0.3679735, 1.679767, 0, 0, 0, 1, 1,
0.404956, 0.2529566, 1.502129, 0, 0, 0, 1, 1,
0.4085374, -0.9213406, 1.180691, 0, 0, 0, 1, 1,
0.4101734, -0.7606328, 0.9798285, 0, 0, 0, 1, 1,
0.4129509, 0.1110608, 2.323892, 0, 0, 0, 1, 1,
0.4155149, -0.02027843, 1.088959, 0, 0, 0, 1, 1,
0.4161953, -1.466619, 2.910865, 1, 1, 1, 1, 1,
0.4170252, 1.835564, 1.796563, 1, 1, 1, 1, 1,
0.421122, 0.2395786, 1.727866, 1, 1, 1, 1, 1,
0.4234586, 0.2732869, 0.1667119, 1, 1, 1, 1, 1,
0.4247964, 0.7156968, 0.4017968, 1, 1, 1, 1, 1,
0.4289947, -2.085947, 0.7701162, 1, 1, 1, 1, 1,
0.4326344, 1.323356, 0.8386669, 1, 1, 1, 1, 1,
0.4341779, 1.190586, 0.7904963, 1, 1, 1, 1, 1,
0.4364423, 0.5323337, 0.2244209, 1, 1, 1, 1, 1,
0.4367441, -0.4845073, 1.233141, 1, 1, 1, 1, 1,
0.439602, -3.684658, 1.898456, 1, 1, 1, 1, 1,
0.4398479, 1.930029, 0.2646057, 1, 1, 1, 1, 1,
0.4425972, -2.384746, 2.067597, 1, 1, 1, 1, 1,
0.4456336, -1.129237, 2.823579, 1, 1, 1, 1, 1,
0.4461839, 0.5409444, 0.05805237, 1, 1, 1, 1, 1,
0.4472086, 0.872591, 1.852571, 0, 0, 1, 1, 1,
0.453661, -0.2135528, 3.7904, 1, 0, 0, 1, 1,
0.4539992, -0.7313135, 2.725296, 1, 0, 0, 1, 1,
0.4545408, 0.1859064, -0.1096376, 1, 0, 0, 1, 1,
0.4568059, 1.114342, 0.2954857, 1, 0, 0, 1, 1,
0.4631955, 0.4351646, 0.9411977, 1, 0, 0, 1, 1,
0.4644586, -0.07499518, 3.107246, 0, 0, 0, 1, 1,
0.4670894, 0.7284404, 2.114244, 0, 0, 0, 1, 1,
0.4673481, -1.97822, 1.378806, 0, 0, 0, 1, 1,
0.4678787, -0.2700071, 3.789003, 0, 0, 0, 1, 1,
0.4723668, -1.386457, 2.648993, 0, 0, 0, 1, 1,
0.4734049, -0.04323015, 1.132969, 0, 0, 0, 1, 1,
0.474478, -1.108681, 2.311727, 0, 0, 0, 1, 1,
0.4813725, 0.04448144, 3.172146, 1, 1, 1, 1, 1,
0.483291, 1.269, 0.5673762, 1, 1, 1, 1, 1,
0.4848772, 0.310007, 0.8806364, 1, 1, 1, 1, 1,
0.4849068, 1.585822, 2.470781, 1, 1, 1, 1, 1,
0.4875426, -0.5585845, 1.733732, 1, 1, 1, 1, 1,
0.4876659, -1.058652, 1.563357, 1, 1, 1, 1, 1,
0.49138, -1.630364, 3.613863, 1, 1, 1, 1, 1,
0.4973404, -0.4380923, 2.245759, 1, 1, 1, 1, 1,
0.4983009, 0.2046048, 1.143408, 1, 1, 1, 1, 1,
0.4996637, 0.4649768, 0.7111666, 1, 1, 1, 1, 1,
0.5040854, 0.07895391, 3.308136, 1, 1, 1, 1, 1,
0.5102302, 1.619584, -1.96386, 1, 1, 1, 1, 1,
0.512123, 0.3597378, 1.046799, 1, 1, 1, 1, 1,
0.5123027, 0.6536541, -1.64002, 1, 1, 1, 1, 1,
0.5162719, 0.8837991, 1.786843, 1, 1, 1, 1, 1,
0.5204454, -0.06848338, 1.963997, 0, 0, 1, 1, 1,
0.5213939, -0.7755872, 2.713018, 1, 0, 0, 1, 1,
0.5232235, 1.29869, 0.1640956, 1, 0, 0, 1, 1,
0.5256122, 2.060251, 1.1134, 1, 0, 0, 1, 1,
0.5262153, -0.09689362, 2.375722, 1, 0, 0, 1, 1,
0.5278368, 1.354545, 0.9784551, 1, 0, 0, 1, 1,
0.5283254, 0.4578647, -0.08390363, 0, 0, 0, 1, 1,
0.5287811, -0.0392407, 0.565852, 0, 0, 0, 1, 1,
0.5309152, 0.8476582, 1.540354, 0, 0, 0, 1, 1,
0.5366099, 0.4197972, -0.4911922, 0, 0, 0, 1, 1,
0.545982, 0.8573597, -0.4104888, 0, 0, 0, 1, 1,
0.5466544, 0.29255, 0.07519594, 0, 0, 0, 1, 1,
0.5510981, 0.08567434, 0.1546919, 0, 0, 0, 1, 1,
0.5535024, 0.5092624, 0.2027867, 1, 1, 1, 1, 1,
0.5562348, -0.3816706, 0.9880322, 1, 1, 1, 1, 1,
0.5579863, 0.9312419, 1.92455, 1, 1, 1, 1, 1,
0.5588387, 1.934124, 1.162535, 1, 1, 1, 1, 1,
0.5590774, -0.2175474, 0.7765424, 1, 1, 1, 1, 1,
0.5648519, -1.302857, 2.72038, 1, 1, 1, 1, 1,
0.5666392, -0.002807335, 1.327921, 1, 1, 1, 1, 1,
0.5677944, -0.6436083, 3.207752, 1, 1, 1, 1, 1,
0.5811477, -2.217721, 2.119848, 1, 1, 1, 1, 1,
0.5834218, -0.8298473, 1.630193, 1, 1, 1, 1, 1,
0.5843645, -1.024844, 2.324055, 1, 1, 1, 1, 1,
0.5889369, 1.107259, -1.124607, 1, 1, 1, 1, 1,
0.5955974, 0.2442232, 1.65029, 1, 1, 1, 1, 1,
0.5966865, -0.7080222, 0.9346019, 1, 1, 1, 1, 1,
0.6085494, -1.53943, 1.28449, 1, 1, 1, 1, 1,
0.608721, 0.201768, 1.008748, 0, 0, 1, 1, 1,
0.6087456, -0.00181143, 1.959283, 1, 0, 0, 1, 1,
0.610571, -1.687483, 3.984429, 1, 0, 0, 1, 1,
0.611549, 0.4903725, 2.076976, 1, 0, 0, 1, 1,
0.614265, -2.629197, 3.808314, 1, 0, 0, 1, 1,
0.6150314, -0.552114, 2.55289, 1, 0, 0, 1, 1,
0.6190253, 0.06644174, 1.07355, 0, 0, 0, 1, 1,
0.6218397, 0.07488105, 2.414829, 0, 0, 0, 1, 1,
0.6228625, 0.4534274, 1.999478, 0, 0, 0, 1, 1,
0.6244794, -1.187001, 3.143005, 0, 0, 0, 1, 1,
0.6276631, -1.503312, 1.778187, 0, 0, 0, 1, 1,
0.6287427, 0.3250321, -0.7398924, 0, 0, 0, 1, 1,
0.634388, -0.975886, 1.57055, 0, 0, 0, 1, 1,
0.636021, -0.03408174, 2.970464, 1, 1, 1, 1, 1,
0.6372538, 1.67029, 1.319879, 1, 1, 1, 1, 1,
0.6416587, 1.035794, -0.1285894, 1, 1, 1, 1, 1,
0.6432475, 0.1619761, 1.514302, 1, 1, 1, 1, 1,
0.6456583, 2.332454, -0.3828889, 1, 1, 1, 1, 1,
0.6488194, 1.480691, 0.6759343, 1, 1, 1, 1, 1,
0.6519255, -0.5011362, 1.713577, 1, 1, 1, 1, 1,
0.6550692, 1.231791, 2.190441, 1, 1, 1, 1, 1,
0.6561863, -0.6597279, 2.729078, 1, 1, 1, 1, 1,
0.6578349, -0.2573995, 1.34168, 1, 1, 1, 1, 1,
0.6586124, 0.1245239, 2.283777, 1, 1, 1, 1, 1,
0.6589878, -0.1471698, 1.364812, 1, 1, 1, 1, 1,
0.6590552, -1.819733, 2.320297, 1, 1, 1, 1, 1,
0.6629689, -0.5656, 1.704023, 1, 1, 1, 1, 1,
0.6631048, 0.4525209, 2.093403, 1, 1, 1, 1, 1,
0.6635288, -0.7203331, 1.921689, 0, 0, 1, 1, 1,
0.6648092, 1.095322, 0.6330536, 1, 0, 0, 1, 1,
0.6656312, 0.07377147, -0.1745677, 1, 0, 0, 1, 1,
0.6727093, -0.116928, 0.9569237, 1, 0, 0, 1, 1,
0.6768427, 1.391191, 0.5674841, 1, 0, 0, 1, 1,
0.6779386, -0.1802179, 3.557202, 1, 0, 0, 1, 1,
0.6798826, 0.3696949, 1.218463, 0, 0, 0, 1, 1,
0.6812318, 0.4028544, 1.24201, 0, 0, 0, 1, 1,
0.6815206, -0.2235791, 0.2579585, 0, 0, 0, 1, 1,
0.6847242, -0.8530456, 3.253036, 0, 0, 0, 1, 1,
0.6869498, 0.167143, 0.5220187, 0, 0, 0, 1, 1,
0.6965489, -0.4440099, 2.295139, 0, 0, 0, 1, 1,
0.6982978, 0.122429, 1.506065, 0, 0, 0, 1, 1,
0.699738, 1.007004, -0.1070633, 1, 1, 1, 1, 1,
0.7018661, -3.030275, 2.98632, 1, 1, 1, 1, 1,
0.7050208, -0.07232384, 1.920872, 1, 1, 1, 1, 1,
0.7125713, 0.222572, 1.019234, 1, 1, 1, 1, 1,
0.7150961, -0.4148694, 4.042716, 1, 1, 1, 1, 1,
0.7278795, -0.6783297, 2.62713, 1, 1, 1, 1, 1,
0.7312176, -1.81792, 1.667713, 1, 1, 1, 1, 1,
0.7313451, -0.01732484, 3.098071, 1, 1, 1, 1, 1,
0.7335848, 0.941595, -0.4770422, 1, 1, 1, 1, 1,
0.7366601, 0.07714655, 2.189848, 1, 1, 1, 1, 1,
0.7379251, 0.04925183, 0.274412, 1, 1, 1, 1, 1,
0.7427679, -0.4601889, 3.490642, 1, 1, 1, 1, 1,
0.7430844, -1.689825, 3.02201, 1, 1, 1, 1, 1,
0.7433223, -0.6831684, 2.133678, 1, 1, 1, 1, 1,
0.7469084, -1.931758, 3.18732, 1, 1, 1, 1, 1,
0.7474473, 1.349265, -2.099269, 0, 0, 1, 1, 1,
0.7540498, 1.937547, 0.1210114, 1, 0, 0, 1, 1,
0.7597998, -0.04581, 2.528558, 1, 0, 0, 1, 1,
0.7629794, 0.5526524, 1.154272, 1, 0, 0, 1, 1,
0.7649333, -1.501348, 3.746096, 1, 0, 0, 1, 1,
0.7706459, -0.7098634, 1.812888, 1, 0, 0, 1, 1,
0.7712341, 0.4054256, 2.27813, 0, 0, 0, 1, 1,
0.7734469, -0.9027834, 2.776425, 0, 0, 0, 1, 1,
0.7750884, 0.3580649, 0.187974, 0, 0, 0, 1, 1,
0.7766373, -0.7940902, 2.735022, 0, 0, 0, 1, 1,
0.778227, -1.858365, 2.407714, 0, 0, 0, 1, 1,
0.779774, 1.36584, 0.5407619, 0, 0, 0, 1, 1,
0.7818322, 0.01581061, -0.59442, 0, 0, 0, 1, 1,
0.7865738, -0.1999955, 2.285032, 1, 1, 1, 1, 1,
0.7909947, -0.4538271, 0.5181251, 1, 1, 1, 1, 1,
0.7932346, 0.4295891, 1.364379, 1, 1, 1, 1, 1,
0.7945746, 0.9874585, 0.6745762, 1, 1, 1, 1, 1,
0.7981572, -0.354921, 2.759627, 1, 1, 1, 1, 1,
0.7999205, 1.279614, -1.151355, 1, 1, 1, 1, 1,
0.8026836, 0.4140537, 1.125459, 1, 1, 1, 1, 1,
0.8043076, 0.3565474, 2.802022, 1, 1, 1, 1, 1,
0.8057482, -0.5483177, 1.98801, 1, 1, 1, 1, 1,
0.8112478, -0.3816322, 1.702712, 1, 1, 1, 1, 1,
0.8149231, 0.5533878, 1.557613, 1, 1, 1, 1, 1,
0.8309709, -1.048735, 2.92783, 1, 1, 1, 1, 1,
0.831582, 0.2176781, 0.09574484, 1, 1, 1, 1, 1,
0.836606, -0.2931003, 1.131128, 1, 1, 1, 1, 1,
0.8413978, -0.8736058, 3.284559, 1, 1, 1, 1, 1,
0.8437895, 0.4589334, 0.9125887, 0, 0, 1, 1, 1,
0.8451831, -1.318357, 2.971011, 1, 0, 0, 1, 1,
0.857905, 2.367173, -2.329514, 1, 0, 0, 1, 1,
0.8607645, -0.7500667, 2.130703, 1, 0, 0, 1, 1,
0.8699613, 0.1629906, 2.256096, 1, 0, 0, 1, 1,
0.8720338, 1.049833, -0.07332377, 1, 0, 0, 1, 1,
0.8807648, -0.1236418, 0.9566209, 0, 0, 0, 1, 1,
0.8877487, 0.8152273, -0.1596653, 0, 0, 0, 1, 1,
0.8901294, 0.0116509, 1.070224, 0, 0, 0, 1, 1,
0.8921052, -0.9452205, 1.551831, 0, 0, 0, 1, 1,
0.8959475, 0.8194551, 0.7709239, 0, 0, 0, 1, 1,
0.8962218, -1.252882, 1.882402, 0, 0, 0, 1, 1,
0.8972497, -1.248305, 2.265489, 0, 0, 0, 1, 1,
0.8972746, -1.374321, 0.8519541, 1, 1, 1, 1, 1,
0.9010061, 0.2180485, -0.3527091, 1, 1, 1, 1, 1,
0.9022744, 0.9138662, 1.199581, 1, 1, 1, 1, 1,
0.9058385, -0.177156, 0.4720547, 1, 1, 1, 1, 1,
0.9065419, 0.8246003, -0.8939615, 1, 1, 1, 1, 1,
0.906583, 0.5885264, -0.1399006, 1, 1, 1, 1, 1,
0.906635, -1.031427, 4.71513, 1, 1, 1, 1, 1,
0.91046, 0.8432958, 1.285177, 1, 1, 1, 1, 1,
0.9124303, 0.6787308, 0.009977438, 1, 1, 1, 1, 1,
0.9251746, 0.2219044, 3.101971, 1, 1, 1, 1, 1,
0.9270171, 0.7254246, -0.9066485, 1, 1, 1, 1, 1,
0.9270942, 1.022354, -0.7619013, 1, 1, 1, 1, 1,
0.9342063, 0.06177999, 1.96241, 1, 1, 1, 1, 1,
0.9344891, -1.303747, 3.644505, 1, 1, 1, 1, 1,
0.936003, -0.1137059, 1.665564, 1, 1, 1, 1, 1,
0.937382, 0.3541433, 1.872115, 0, 0, 1, 1, 1,
0.9445835, 1.038858, 3.085789, 1, 0, 0, 1, 1,
0.9479303, 1.023112, 0.9857524, 1, 0, 0, 1, 1,
0.9479343, -0.2821998, 4.007574, 1, 0, 0, 1, 1,
0.9481001, 0.9607522, 1.177726, 1, 0, 0, 1, 1,
0.94812, 0.194882, 2.084175, 1, 0, 0, 1, 1,
0.9576838, 1.596914, 1.645136, 0, 0, 0, 1, 1,
0.9653671, -0.3945844, 1.50216, 0, 0, 0, 1, 1,
0.9678596, 0.745765, -0.0504505, 0, 0, 0, 1, 1,
0.9722351, -0.4570411, 2.646393, 0, 0, 0, 1, 1,
0.9777546, 1.396141, -1.047206, 0, 0, 0, 1, 1,
0.9800519, 0.3484684, 0.8054582, 0, 0, 0, 1, 1,
0.9820831, 0.1922974, 1.136808, 0, 0, 0, 1, 1,
0.9841485, -2.814028, 3.018228, 1, 1, 1, 1, 1,
0.985603, 0.09548433, 1.969584, 1, 1, 1, 1, 1,
0.9884254, -0.4550848, 3.241517, 1, 1, 1, 1, 1,
0.9907457, 0.2178992, 1.810452, 1, 1, 1, 1, 1,
0.9916056, -2.683636, 1.65854, 1, 1, 1, 1, 1,
0.9961879, -1.657052, 1.814454, 1, 1, 1, 1, 1,
0.9981936, 1.958495, 0.4139362, 1, 1, 1, 1, 1,
0.9997025, 0.2759061, 1.32722, 1, 1, 1, 1, 1,
1.001159, -0.8432467, 1.605543, 1, 1, 1, 1, 1,
1.003313, -0.1328975, 1.394692, 1, 1, 1, 1, 1,
1.03035, 0.4966528, 0.5747637, 1, 1, 1, 1, 1,
1.03396, -0.553418, 0.4407655, 1, 1, 1, 1, 1,
1.051498, -1.449179, 1.842094, 1, 1, 1, 1, 1,
1.052039, -0.826584, 3.425339, 1, 1, 1, 1, 1,
1.054207, 0.6286801, -0.3273805, 1, 1, 1, 1, 1,
1.059707, -1.050329, 2.857094, 0, 0, 1, 1, 1,
1.063194, 1.220563, -1.031176, 1, 0, 0, 1, 1,
1.07083, -0.8899823, 1.701864, 1, 0, 0, 1, 1,
1.072672, -2.709721, 3.381004, 1, 0, 0, 1, 1,
1.082081, -0.286768, 3.945536, 1, 0, 0, 1, 1,
1.092253, 1.249013, 1.84314, 1, 0, 0, 1, 1,
1.097603, 2.286524, 1.596818, 0, 0, 0, 1, 1,
1.102868, 0.7912352, -0.9443835, 0, 0, 0, 1, 1,
1.106968, 0.1500458, 1.118378, 0, 0, 0, 1, 1,
1.109409, -0.2392102, 0.179674, 0, 0, 0, 1, 1,
1.109478, -1.071489, 1.45168, 0, 0, 0, 1, 1,
1.119583, -0.618256, 2.521574, 0, 0, 0, 1, 1,
1.12334, 1.504732, 2.927886, 0, 0, 0, 1, 1,
1.125757, 0.9671018, 2.955784, 1, 1, 1, 1, 1,
1.131922, 0.2195425, 2.1556, 1, 1, 1, 1, 1,
1.133023, -1.715047, 1.74123, 1, 1, 1, 1, 1,
1.150655, -0.4424084, 1.319969, 1, 1, 1, 1, 1,
1.1509, 0.8922487, 1.286136, 1, 1, 1, 1, 1,
1.157893, 1.762215, -0.6505135, 1, 1, 1, 1, 1,
1.169133, -1.536598, 2.493471, 1, 1, 1, 1, 1,
1.172504, -0.5920581, 1.954174, 1, 1, 1, 1, 1,
1.192032, 0.3820212, 1.756958, 1, 1, 1, 1, 1,
1.197468, -0.2621228, 2.27691, 1, 1, 1, 1, 1,
1.198841, -0.478756, 1.529113, 1, 1, 1, 1, 1,
1.208333, -0.1143643, 1.766258, 1, 1, 1, 1, 1,
1.216941, 0.7821472, 1.8878, 1, 1, 1, 1, 1,
1.234469, -1.038844, 2.257864, 1, 1, 1, 1, 1,
1.239823, -0.9231892, 4.035057, 1, 1, 1, 1, 1,
1.240654, -1.021488, 3.382899, 0, 0, 1, 1, 1,
1.258803, -1.065774, 3.061674, 1, 0, 0, 1, 1,
1.268806, -0.9181181, 2.144665, 1, 0, 0, 1, 1,
1.26981, 0.360246, 2.013745, 1, 0, 0, 1, 1,
1.271638, 1.666459, 2.833763, 1, 0, 0, 1, 1,
1.284485, -0.2996149, 3.491364, 1, 0, 0, 1, 1,
1.298789, -0.9654121, 2.753391, 0, 0, 0, 1, 1,
1.311663, 1.142312, 0.9521614, 0, 0, 0, 1, 1,
1.320366, 1.71262, 2.064291, 0, 0, 0, 1, 1,
1.320856, -0.1218607, 0.4974202, 0, 0, 0, 1, 1,
1.323283, -0.09223992, -0.2077921, 0, 0, 0, 1, 1,
1.32517, -0.9900412, 1.722192, 0, 0, 0, 1, 1,
1.326353, 0.539121, 1.834302, 0, 0, 0, 1, 1,
1.328996, 0.06303955, 1.779841, 1, 1, 1, 1, 1,
1.32991, 1.456027, 1.253956, 1, 1, 1, 1, 1,
1.34099, 2.558112, 4.112368, 1, 1, 1, 1, 1,
1.347936, -1.409217, 1.600005, 1, 1, 1, 1, 1,
1.358125, -1.031191, 2.56292, 1, 1, 1, 1, 1,
1.371016, 0.1131153, 4.479696, 1, 1, 1, 1, 1,
1.374313, 2.012671, -0.6080758, 1, 1, 1, 1, 1,
1.375335, 0.8555367, 1.751616, 1, 1, 1, 1, 1,
1.379485, -0.8095456, 2.906271, 1, 1, 1, 1, 1,
1.384681, 1.125919, 3.377307, 1, 1, 1, 1, 1,
1.385575, 1.657084, 0.9014903, 1, 1, 1, 1, 1,
1.388037, -0.1387535, 1.575723, 1, 1, 1, 1, 1,
1.396426, -1.958713, 2.141019, 1, 1, 1, 1, 1,
1.402838, 0.7075927, 1.257699, 1, 1, 1, 1, 1,
1.408085, -1.554175, 3.879079, 1, 1, 1, 1, 1,
1.408755, -0.06925768, 0.5087333, 0, 0, 1, 1, 1,
1.411825, 1.051232, 0.01024229, 1, 0, 0, 1, 1,
1.433599, -1.017932, 2.991447, 1, 0, 0, 1, 1,
1.435791, -0.9897591, 1.70437, 1, 0, 0, 1, 1,
1.455093, -0.3770433, 2.357051, 1, 0, 0, 1, 1,
1.462388, -0.3831168, 2.025759, 1, 0, 0, 1, 1,
1.46925, -1.046892, 2.010798, 0, 0, 0, 1, 1,
1.469684, -2.037493, 2.879689, 0, 0, 0, 1, 1,
1.474761, 0.6486301, 2.957829, 0, 0, 0, 1, 1,
1.475034, 0.4931329, 0.818032, 0, 0, 0, 1, 1,
1.49889, 0.4393327, 0.3561913, 0, 0, 0, 1, 1,
1.504769, 1.795113, 0.7881994, 0, 0, 0, 1, 1,
1.506871, -0.6952599, 1.810841, 0, 0, 0, 1, 1,
1.520784, -1.073718, 2.790584, 1, 1, 1, 1, 1,
1.524915, -0.08040742, 0.5329446, 1, 1, 1, 1, 1,
1.536285, 1.52238, 0.7159361, 1, 1, 1, 1, 1,
1.551146, 1.227139, 0.2404555, 1, 1, 1, 1, 1,
1.561511, 1.111737, 1.022713, 1, 1, 1, 1, 1,
1.564816, 2.027213, -0.7821667, 1, 1, 1, 1, 1,
1.573995, -0.2497575, 1.899386, 1, 1, 1, 1, 1,
1.582429, -1.004546, 3.973628, 1, 1, 1, 1, 1,
1.591963, 1.197002, 0.937182, 1, 1, 1, 1, 1,
1.60764, 0.4168289, 0.8477828, 1, 1, 1, 1, 1,
1.608212, 0.2704297, 1.654205, 1, 1, 1, 1, 1,
1.627241, 0.5457898, 0.3305251, 1, 1, 1, 1, 1,
1.639053, -0.2471776, 2.514571, 1, 1, 1, 1, 1,
1.646945, -0.8456118, 1.814139, 1, 1, 1, 1, 1,
1.647288, 0.0850905, 2.500144, 1, 1, 1, 1, 1,
1.654202, 0.4521816, 0.9918153, 0, 0, 1, 1, 1,
1.655843, 1.192863, 0.2298243, 1, 0, 0, 1, 1,
1.663717, 0.9771128, 0.7587058, 1, 0, 0, 1, 1,
1.672354, -0.2099111, 1.343416, 1, 0, 0, 1, 1,
1.674099, 0.3102016, 2.158077, 1, 0, 0, 1, 1,
1.702969, 0.4091721, 2.067504, 1, 0, 0, 1, 1,
1.703718, -0.9115943, 3.522175, 0, 0, 0, 1, 1,
1.705719, -0.7554425, 2.631586, 0, 0, 0, 1, 1,
1.708777, -1.084722, 2.508067, 0, 0, 0, 1, 1,
1.728128, -0.2486217, 1.470853, 0, 0, 0, 1, 1,
1.744558, 0.8490276, -0.1632881, 0, 0, 0, 1, 1,
1.757277, 1.272061, 0.6461917, 0, 0, 0, 1, 1,
1.782807, -0.4291684, 2.038821, 0, 0, 0, 1, 1,
1.784498, -1.433318, 3.995143, 1, 1, 1, 1, 1,
1.803635, 0.3511312, 1.36518, 1, 1, 1, 1, 1,
1.879789, -0.2791426, 1.634892, 1, 1, 1, 1, 1,
1.904796, -0.6787383, 1.835261, 1, 1, 1, 1, 1,
1.914799, 0.8944665, 0.9565343, 1, 1, 1, 1, 1,
1.935261, -0.8434169, 4.532626, 1, 1, 1, 1, 1,
1.939029, 0.4438007, 2.892573, 1, 1, 1, 1, 1,
1.94054, -1.257087, 1.556306, 1, 1, 1, 1, 1,
1.956779, 1.315396, 0.586543, 1, 1, 1, 1, 1,
1.961414, 0.6745658, 1.724295, 1, 1, 1, 1, 1,
1.975518, -0.4731126, 2.050758, 1, 1, 1, 1, 1,
2.017735, -2.991465, 3.849457, 1, 1, 1, 1, 1,
2.039324, -0.442069, 3.279334, 1, 1, 1, 1, 1,
2.071245, 0.8940569, 1.452208, 1, 1, 1, 1, 1,
2.073732, -0.07410535, 2.486573, 1, 1, 1, 1, 1,
2.074678, 0.8248041, 1.94987, 0, 0, 1, 1, 1,
2.075587, 1.231707, 1.508841, 1, 0, 0, 1, 1,
2.080826, -0.4837801, 1.921384, 1, 0, 0, 1, 1,
2.083381, 0.7048808, 1.36085, 1, 0, 0, 1, 1,
2.110754, -0.03206281, 1.440147, 1, 0, 0, 1, 1,
2.12664, -0.4644724, 1.331225, 1, 0, 0, 1, 1,
2.165058, 0.8013079, 0.3350202, 0, 0, 0, 1, 1,
2.166147, -0.3024918, 2.924834, 0, 0, 0, 1, 1,
2.205776, -0.6776168, 0.7531198, 0, 0, 0, 1, 1,
2.208282, 1.487018, 1.222077, 0, 0, 0, 1, 1,
2.254534, 0.2705191, 1.044093, 0, 0, 0, 1, 1,
2.346344, 1.458315, 2.028171, 0, 0, 0, 1, 1,
2.370472, -0.236793, 1.250144, 0, 0, 0, 1, 1,
2.448779, -0.5671684, 1.189015, 1, 1, 1, 1, 1,
2.608738, -0.658406, 2.611129, 1, 1, 1, 1, 1,
2.693751, -0.9297063, 2.651988, 1, 1, 1, 1, 1,
2.798419, -0.1470972, 1.187735, 1, 1, 1, 1, 1,
2.824538, -0.532143, 0.8374742, 1, 1, 1, 1, 1,
2.963236, -0.4446005, 1.026973, 1, 1, 1, 1, 1,
3.090969, -0.1852729, 1.88548, 1, 1, 1, 1, 1
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
var radius = 9.731499;
var distance = 34.18148;
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
mvMatrix.translate( -0.1054368, 0.356601, 0.1497059 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18148);
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
