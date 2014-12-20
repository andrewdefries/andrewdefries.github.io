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
-3.032471, -0.4503158, -1.99046, 1, 0, 0, 1,
-2.729609, 0.3059235, -1.478294, 1, 0.007843138, 0, 1,
-2.723113, -0.5698876, -1.546157, 1, 0.01176471, 0, 1,
-2.595872, 0.5439935, -0.7548484, 1, 0.01960784, 0, 1,
-2.587544, 2.366412, -1.606871, 1, 0.02352941, 0, 1,
-2.497084, 0.08208919, -0.7680284, 1, 0.03137255, 0, 1,
-2.430866, 1.321351, 1.157469, 1, 0.03529412, 0, 1,
-2.414541, 0.1692064, -1.169987, 1, 0.04313726, 0, 1,
-2.357888, 1.24053, -0.1378163, 1, 0.04705882, 0, 1,
-2.355544, 1.179015, -1.217082, 1, 0.05490196, 0, 1,
-2.345166, 2.229075, -0.2831045, 1, 0.05882353, 0, 1,
-2.264658, -0.6845431, -0.7016128, 1, 0.06666667, 0, 1,
-2.258417, 0.9648099, -2.382751, 1, 0.07058824, 0, 1,
-2.253479, -1.701216, -1.125923, 1, 0.07843138, 0, 1,
-2.224181, -0.4718732, -0.5469633, 1, 0.08235294, 0, 1,
-2.157317, 1.404204, -0.5422624, 1, 0.09019608, 0, 1,
-2.129577, -0.4007396, -1.123155, 1, 0.09411765, 0, 1,
-2.122906, -0.2026366, -1.900211, 1, 0.1019608, 0, 1,
-2.110179, -0.5758794, -1.854421, 1, 0.1098039, 0, 1,
-2.104677, -0.08419239, -1.592534, 1, 0.1137255, 0, 1,
-2.104389, -0.3157989, -1.993014, 1, 0.1215686, 0, 1,
-2.055703, 0.537519, -1.845385, 1, 0.1254902, 0, 1,
-1.972058, 0.3184036, -1.642991, 1, 0.1333333, 0, 1,
-1.967422, -0.1980267, -1.534347, 1, 0.1372549, 0, 1,
-1.966617, 0.001208878, -2.616731, 1, 0.145098, 0, 1,
-1.964187, -1.574127, -2.399609, 1, 0.1490196, 0, 1,
-1.941063, -1.149915, -3.147397, 1, 0.1568628, 0, 1,
-1.915303, -0.4920522, 0.2801164, 1, 0.1607843, 0, 1,
-1.912633, -1.022366, -1.901196, 1, 0.1686275, 0, 1,
-1.855578, -1.984897, -2.654707, 1, 0.172549, 0, 1,
-1.840271, -0.6253544, -3.803198, 1, 0.1803922, 0, 1,
-1.838195, -1.299811, -1.089148, 1, 0.1843137, 0, 1,
-1.83284, 1.018789, -2.996552, 1, 0.1921569, 0, 1,
-1.829707, -1.050606, -2.933475, 1, 0.1960784, 0, 1,
-1.81299, -1.10925, -3.116752, 1, 0.2039216, 0, 1,
-1.799967, 1.946784, -1.123364, 1, 0.2117647, 0, 1,
-1.799058, 0.1136213, 0.08516726, 1, 0.2156863, 0, 1,
-1.768548, -0.3179468, -2.579428, 1, 0.2235294, 0, 1,
-1.766402, 0.2658632, -1.465936, 1, 0.227451, 0, 1,
-1.733079, -0.4479266, -2.944105, 1, 0.2352941, 0, 1,
-1.726408, -0.01052574, -1.04976, 1, 0.2392157, 0, 1,
-1.702072, -2.215205, -3.407886, 1, 0.2470588, 0, 1,
-1.698784, -0.6760953, -0.5757303, 1, 0.2509804, 0, 1,
-1.692467, -0.1733689, -2.404713, 1, 0.2588235, 0, 1,
-1.691548, -0.5165213, -2.123724, 1, 0.2627451, 0, 1,
-1.688693, 0.7826625, -2.984325, 1, 0.2705882, 0, 1,
-1.683831, -0.5084992, -0.7294441, 1, 0.2745098, 0, 1,
-1.680045, 0.3650638, -2.362171, 1, 0.282353, 0, 1,
-1.659444, -1.181529, -2.986953, 1, 0.2862745, 0, 1,
-1.65648, -1.166356, -2.418471, 1, 0.2941177, 0, 1,
-1.651414, -1.111522, -3.805646, 1, 0.3019608, 0, 1,
-1.635615, -0.5440597, -1.218773, 1, 0.3058824, 0, 1,
-1.627813, 1.06558, -0.404695, 1, 0.3137255, 0, 1,
-1.624519, -0.9810191, -2.838443, 1, 0.3176471, 0, 1,
-1.624014, -0.05691889, -2.151187, 1, 0.3254902, 0, 1,
-1.595342, 1.108814, -1.559731, 1, 0.3294118, 0, 1,
-1.592982, 0.286432, -3.52325, 1, 0.3372549, 0, 1,
-1.589271, 0.5613184, -0.5435715, 1, 0.3411765, 0, 1,
-1.58648, -0.0540072, -1.136223, 1, 0.3490196, 0, 1,
-1.584907, 0.1772457, 0.1042928, 1, 0.3529412, 0, 1,
-1.579631, 0.9159099, -0.6824871, 1, 0.3607843, 0, 1,
-1.522357, -1.644076, -2.094032, 1, 0.3647059, 0, 1,
-1.503603, 1.901178, -2.027235, 1, 0.372549, 0, 1,
-1.481715, -0.4248955, -2.542815, 1, 0.3764706, 0, 1,
-1.479503, 0.02061325, -2.383099, 1, 0.3843137, 0, 1,
-1.473249, 1.911342, 0.845759, 1, 0.3882353, 0, 1,
-1.468341, 0.4275317, -2.714065, 1, 0.3960784, 0, 1,
-1.46444, -0.1501552, -2.089783, 1, 0.4039216, 0, 1,
-1.455612, 0.3447334, -1.823473, 1, 0.4078431, 0, 1,
-1.446548, 1.341904, -0.9431543, 1, 0.4156863, 0, 1,
-1.445369, 0.1813834, -1.813985, 1, 0.4196078, 0, 1,
-1.442819, 1.589397, -0.6625732, 1, 0.427451, 0, 1,
-1.441925, -0.1365765, -2.167797, 1, 0.4313726, 0, 1,
-1.440495, 0.4343771, -1.456518, 1, 0.4392157, 0, 1,
-1.436177, 1.787602, -0.8023041, 1, 0.4431373, 0, 1,
-1.435035, -0.4570092, -1.413997, 1, 0.4509804, 0, 1,
-1.418791, 1.206451, -1.870818, 1, 0.454902, 0, 1,
-1.414306, -0.2472917, -2.451026, 1, 0.4627451, 0, 1,
-1.407524, 0.9721453, 0.2590344, 1, 0.4666667, 0, 1,
-1.388014, -1.977716, -3.704732, 1, 0.4745098, 0, 1,
-1.386477, -0.7587316, -3.35734, 1, 0.4784314, 0, 1,
-1.379626, -1.623383, -2.557101, 1, 0.4862745, 0, 1,
-1.378371, -1.446068, -3.680486, 1, 0.4901961, 0, 1,
-1.375811, -1.472464, -4.531041, 1, 0.4980392, 0, 1,
-1.375771, -0.8413063, -1.678635, 1, 0.5058824, 0, 1,
-1.371331, -0.8039648, -2.01582, 1, 0.509804, 0, 1,
-1.370025, -1.285162, -2.988333, 1, 0.5176471, 0, 1,
-1.358171, -0.1718768, -1.383435, 1, 0.5215687, 0, 1,
-1.345936, -1.730697, -2.677074, 1, 0.5294118, 0, 1,
-1.336421, 1.615178, 0.7351124, 1, 0.5333334, 0, 1,
-1.333784, -1.426593, -1.895058, 1, 0.5411765, 0, 1,
-1.329116, 0.8356006, -0.01569611, 1, 0.5450981, 0, 1,
-1.315882, -1.306746, -2.421605, 1, 0.5529412, 0, 1,
-1.301571, 0.1615535, -0.6963515, 1, 0.5568628, 0, 1,
-1.300034, 0.2751027, -0.2962244, 1, 0.5647059, 0, 1,
-1.282991, 0.9534001, -2.216196, 1, 0.5686275, 0, 1,
-1.282065, -0.766553, -0.1421556, 1, 0.5764706, 0, 1,
-1.279795, -0.2629893, -0.5812188, 1, 0.5803922, 0, 1,
-1.275178, -0.4302346, -1.697659, 1, 0.5882353, 0, 1,
-1.2599, 0.4957692, -2.099724, 1, 0.5921569, 0, 1,
-1.252831, 0.6262382, -1.614265, 1, 0.6, 0, 1,
-1.251571, 0.3619283, -3.670311, 1, 0.6078432, 0, 1,
-1.243766, -0.03220802, 0.2555434, 1, 0.6117647, 0, 1,
-1.238683, -0.8053834, -1.487305, 1, 0.6196079, 0, 1,
-1.2354, -1.729547, -2.779813, 1, 0.6235294, 0, 1,
-1.234183, 0.8432043, -1.918611, 1, 0.6313726, 0, 1,
-1.217447, 2.035155, -0.229572, 1, 0.6352941, 0, 1,
-1.2174, 0.3584624, -1.14239, 1, 0.6431373, 0, 1,
-1.204332, -1.039832, -1.609625, 1, 0.6470588, 0, 1,
-1.197041, -0.4529615, 0.2648114, 1, 0.654902, 0, 1,
-1.191736, -0.4437603, -3.148959, 1, 0.6588235, 0, 1,
-1.191542, 0.568132, -1.898884, 1, 0.6666667, 0, 1,
-1.191349, -0.1893596, -2.077024, 1, 0.6705883, 0, 1,
-1.189026, 0.4514028, -0.7543117, 1, 0.6784314, 0, 1,
-1.183998, -0.2866547, -2.10291, 1, 0.682353, 0, 1,
-1.181422, 0.2908795, 0.8908529, 1, 0.6901961, 0, 1,
-1.180988, 0.3139531, -3.223407, 1, 0.6941177, 0, 1,
-1.164661, 0.3231913, -0.7601886, 1, 0.7019608, 0, 1,
-1.163441, 0.5756128, -0.4957239, 1, 0.7098039, 0, 1,
-1.163368, -0.8004901, -4.183875, 1, 0.7137255, 0, 1,
-1.156729, 1.674417, -1.197567, 1, 0.7215686, 0, 1,
-1.15178, -1.499931, -2.423258, 1, 0.7254902, 0, 1,
-1.148455, 0.1435797, 0.3267183, 1, 0.7333333, 0, 1,
-1.146355, 1.113662, -0.9852179, 1, 0.7372549, 0, 1,
-1.144221, -0.1018638, -3.21578, 1, 0.7450981, 0, 1,
-1.134273, -0.8774229, -3.509784, 1, 0.7490196, 0, 1,
-1.131836, 0.1548806, -1.59929, 1, 0.7568628, 0, 1,
-1.122216, -0.7140632, -0.8880304, 1, 0.7607843, 0, 1,
-1.114485, -0.05040913, -0.426998, 1, 0.7686275, 0, 1,
-1.112192, 0.4637069, -1.713439, 1, 0.772549, 0, 1,
-1.106295, -0.1605064, -2.818177, 1, 0.7803922, 0, 1,
-1.095814, -0.5765254, -2.292427, 1, 0.7843137, 0, 1,
-1.081911, -0.02414879, -0.5800569, 1, 0.7921569, 0, 1,
-1.081869, -1.749596, -1.443761, 1, 0.7960784, 0, 1,
-1.078964, -0.4790784, -1.246431, 1, 0.8039216, 0, 1,
-1.059402, 0.2157129, -0.7146906, 1, 0.8117647, 0, 1,
-1.053788, -0.8528621, -3.438234, 1, 0.8156863, 0, 1,
-1.047628, 1.176589, -1.121781, 1, 0.8235294, 0, 1,
-1.045002, -0.6433326, -2.091835, 1, 0.827451, 0, 1,
-1.04354, 0.8160576, -0.5922908, 1, 0.8352941, 0, 1,
-1.039098, 0.2428927, -1.833012, 1, 0.8392157, 0, 1,
-1.03035, 0.3009852, -1.203964, 1, 0.8470588, 0, 1,
-1.024685, 0.5400942, -0.935271, 1, 0.8509804, 0, 1,
-1.024227, 1.146881, -0.1072676, 1, 0.8588235, 0, 1,
-1.02213, -1.053046, -1.219898, 1, 0.8627451, 0, 1,
-1.016941, 0.8346896, -1.772684, 1, 0.8705882, 0, 1,
-1.015898, -0.735616, -1.517479, 1, 0.8745098, 0, 1,
-0.9961726, -0.7080606, -3.655268, 1, 0.8823529, 0, 1,
-0.9930028, 0.631192, -1.110559, 1, 0.8862745, 0, 1,
-0.9927848, -0.1211613, -0.6825945, 1, 0.8941177, 0, 1,
-0.9898164, -1.039784, -3.959779, 1, 0.8980392, 0, 1,
-0.9890868, -1.232487, -3.178138, 1, 0.9058824, 0, 1,
-0.9810922, -0.3872852, -1.396645, 1, 0.9137255, 0, 1,
-0.980184, -1.356036, -1.201771, 1, 0.9176471, 0, 1,
-0.9787646, -0.3717391, -2.049645, 1, 0.9254902, 0, 1,
-0.9769619, 0.7439033, -0.1779208, 1, 0.9294118, 0, 1,
-0.9758784, 0.7592229, -1.029856, 1, 0.9372549, 0, 1,
-0.9733732, 0.3622441, -1.65425, 1, 0.9411765, 0, 1,
-0.9653246, 1.781302, 0.06581238, 1, 0.9490196, 0, 1,
-0.9652675, 0.8204343, -0.4956592, 1, 0.9529412, 0, 1,
-0.9643815, -0.8132556, -3.256523, 1, 0.9607843, 0, 1,
-0.9627683, -0.3646618, -1.961871, 1, 0.9647059, 0, 1,
-0.9612956, -0.1621807, -0.7088371, 1, 0.972549, 0, 1,
-0.961153, 2.045894, 0.2580492, 1, 0.9764706, 0, 1,
-0.9584428, -2.107203, -2.325976, 1, 0.9843137, 0, 1,
-0.9482701, 0.4237327, -2.259792, 1, 0.9882353, 0, 1,
-0.9452198, 0.3852788, 0.2747263, 1, 0.9960784, 0, 1,
-0.9397237, -1.577231, -2.001169, 0.9960784, 1, 0, 1,
-0.9327478, -0.1181629, -1.600145, 0.9921569, 1, 0, 1,
-0.9247622, -0.6066787, -1.219771, 0.9843137, 1, 0, 1,
-0.9175027, 0.2483319, -1.844825, 0.9803922, 1, 0, 1,
-0.9102063, 0.005600419, -0.574333, 0.972549, 1, 0, 1,
-0.9100791, 0.9432319, -1.705023, 0.9686275, 1, 0, 1,
-0.9091549, 0.06148922, -2.07426, 0.9607843, 1, 0, 1,
-0.903267, -0.8069077, -1.406095, 0.9568627, 1, 0, 1,
-0.8819917, -1.087525, -2.452915, 0.9490196, 1, 0, 1,
-0.8750379, -0.07865883, -1.86983, 0.945098, 1, 0, 1,
-0.8735518, 0.6482772, -1.752532, 0.9372549, 1, 0, 1,
-0.8727465, -2.113178, -2.683395, 0.9333333, 1, 0, 1,
-0.8671909, 0.4671198, -0.4942614, 0.9254902, 1, 0, 1,
-0.8651448, 1.764913, -0.334293, 0.9215686, 1, 0, 1,
-0.8569388, 1.085348, -2.717757, 0.9137255, 1, 0, 1,
-0.8541474, 0.3746056, -1.718989, 0.9098039, 1, 0, 1,
-0.8512517, 0.5056527, 1.336067, 0.9019608, 1, 0, 1,
-0.8437834, -0.1908799, -1.90167, 0.8941177, 1, 0, 1,
-0.8431729, 0.8381631, -2.162312, 0.8901961, 1, 0, 1,
-0.8399934, 0.304421, -2.498692, 0.8823529, 1, 0, 1,
-0.8397435, -1.558117, -3.308168, 0.8784314, 1, 0, 1,
-0.8393064, -1.059145, -3.699054, 0.8705882, 1, 0, 1,
-0.8388001, 0.3770354, -1.752804, 0.8666667, 1, 0, 1,
-0.8386382, -0.4617802, -2.57061, 0.8588235, 1, 0, 1,
-0.8364197, 1.918245, -0.716476, 0.854902, 1, 0, 1,
-0.8289775, 0.7754631, -0.8480902, 0.8470588, 1, 0, 1,
-0.8282921, -0.4455699, -2.915228, 0.8431373, 1, 0, 1,
-0.828261, -1.083302, -0.8956227, 0.8352941, 1, 0, 1,
-0.8264624, 0.3905989, -0.5397167, 0.8313726, 1, 0, 1,
-0.8210173, 0.8704756, 1.196654, 0.8235294, 1, 0, 1,
-0.8174747, 0.3295487, -0.7572947, 0.8196079, 1, 0, 1,
-0.8172599, 1.174452, -2.619479, 0.8117647, 1, 0, 1,
-0.8168765, -0.1952196, -1.921183, 0.8078431, 1, 0, 1,
-0.8160775, 0.9285311, -1.340078, 0.8, 1, 0, 1,
-0.810954, 0.1212384, -1.941119, 0.7921569, 1, 0, 1,
-0.8090128, 0.2211432, 1.103235, 0.7882353, 1, 0, 1,
-0.8090004, 0.649202, -2.2238, 0.7803922, 1, 0, 1,
-0.8089817, 0.1306392, -1.867386, 0.7764706, 1, 0, 1,
-0.8081197, 0.1049318, -3.276591, 0.7686275, 1, 0, 1,
-0.8074852, 2.04793, -0.8874171, 0.7647059, 1, 0, 1,
-0.8019215, -0.4403721, -3.119488, 0.7568628, 1, 0, 1,
-0.7990456, -0.3793757, -2.794038, 0.7529412, 1, 0, 1,
-0.793359, 0.2742006, -2.950986, 0.7450981, 1, 0, 1,
-0.7926043, 0.5826722, -2.87125, 0.7411765, 1, 0, 1,
-0.7903978, 1.935504, 3.191904, 0.7333333, 1, 0, 1,
-0.7896212, 0.1549904, -2.016928, 0.7294118, 1, 0, 1,
-0.7807361, 0.3249045, -2.624292, 0.7215686, 1, 0, 1,
-0.7748833, 0.3745343, -1.191411, 0.7176471, 1, 0, 1,
-0.7743618, -0.6410177, -1.08076, 0.7098039, 1, 0, 1,
-0.7725605, 0.2281193, -0.3763838, 0.7058824, 1, 0, 1,
-0.7654973, -0.1160521, -1.704654, 0.6980392, 1, 0, 1,
-0.7585144, -1.939226, -1.495319, 0.6901961, 1, 0, 1,
-0.7470078, -0.7733877, -0.008335925, 0.6862745, 1, 0, 1,
-0.742457, 0.01767923, -3.291389, 0.6784314, 1, 0, 1,
-0.7398521, -0.3164824, -2.486996, 0.6745098, 1, 0, 1,
-0.7312667, 0.6553246, -0.8046698, 0.6666667, 1, 0, 1,
-0.7271896, 0.2448156, 1.361986, 0.6627451, 1, 0, 1,
-0.7252409, 1.141435, -0.58943, 0.654902, 1, 0, 1,
-0.7212911, 0.1454456, -2.260739, 0.6509804, 1, 0, 1,
-0.7175712, -2.047498, -4.117187, 0.6431373, 1, 0, 1,
-0.7169667, -1.247087, -3.495634, 0.6392157, 1, 0, 1,
-0.7154236, 0.5332559, -0.8411086, 0.6313726, 1, 0, 1,
-0.7154209, 1.111501, 0.2002385, 0.627451, 1, 0, 1,
-0.7093356, -0.9029695, -2.47462, 0.6196079, 1, 0, 1,
-0.7091657, 0.7657078, -1.660372, 0.6156863, 1, 0, 1,
-0.7075772, -2.27207, -2.131218, 0.6078432, 1, 0, 1,
-0.7075634, -2.281702, -2.574511, 0.6039216, 1, 0, 1,
-0.70314, 1.204573, -0.6103613, 0.5960785, 1, 0, 1,
-0.6992115, -1.142056, -3.452259, 0.5882353, 1, 0, 1,
-0.6991823, 0.2608219, -1.847362, 0.5843138, 1, 0, 1,
-0.6978582, -0.2230207, -2.211535, 0.5764706, 1, 0, 1,
-0.6874428, -1.22132, -1.970197, 0.572549, 1, 0, 1,
-0.6846403, -0.5806841, -2.431897, 0.5647059, 1, 0, 1,
-0.671762, 0.236507, -0.6193619, 0.5607843, 1, 0, 1,
-0.6633205, 0.1221677, -1.181185, 0.5529412, 1, 0, 1,
-0.6582394, 0.75696, -0.2309484, 0.5490196, 1, 0, 1,
-0.6568201, 0.2961234, -1.456711, 0.5411765, 1, 0, 1,
-0.6529151, 0.9157335, -0.3194334, 0.5372549, 1, 0, 1,
-0.6462573, -0.1746683, -2.779373, 0.5294118, 1, 0, 1,
-0.6416463, 0.1287819, -1.872385, 0.5254902, 1, 0, 1,
-0.6404366, -0.9803305, -0.2891077, 0.5176471, 1, 0, 1,
-0.6390296, -0.2105869, 0.2154323, 0.5137255, 1, 0, 1,
-0.6352455, -0.6327391, -1.819066, 0.5058824, 1, 0, 1,
-0.6335703, 0.891839, -0.1614865, 0.5019608, 1, 0, 1,
-0.6265093, 0.3349505, -0.8209578, 0.4941176, 1, 0, 1,
-0.6259286, 0.1269781, -0.3475337, 0.4862745, 1, 0, 1,
-0.6240711, 0.5573816, -3.431182, 0.4823529, 1, 0, 1,
-0.6237668, 0.2103435, -2.284913, 0.4745098, 1, 0, 1,
-0.6236526, -0.2298034, -0.4267495, 0.4705882, 1, 0, 1,
-0.6235666, -0.6255253, -2.138345, 0.4627451, 1, 0, 1,
-0.6229819, 1.409727, -0.3790897, 0.4588235, 1, 0, 1,
-0.6128739, -1.231226, -4.607985, 0.4509804, 1, 0, 1,
-0.6080644, 1.004479, 0.358489, 0.4470588, 1, 0, 1,
-0.6056882, -1.018411, -1.680024, 0.4392157, 1, 0, 1,
-0.6040474, -0.3572494, -0.3350301, 0.4352941, 1, 0, 1,
-0.5975631, 0.5426516, -3.049452, 0.427451, 1, 0, 1,
-0.5969849, -0.2824837, -1.903802, 0.4235294, 1, 0, 1,
-0.5937759, -0.5488902, -1.457687, 0.4156863, 1, 0, 1,
-0.5899829, 1.820037, -1.349314, 0.4117647, 1, 0, 1,
-0.5897347, -2.14277, -2.797875, 0.4039216, 1, 0, 1,
-0.5826616, 1.443691, -0.4419611, 0.3960784, 1, 0, 1,
-0.580796, -0.4011686, -1.866208, 0.3921569, 1, 0, 1,
-0.5793278, 0.627775, -2.555339, 0.3843137, 1, 0, 1,
-0.5767686, 1.411239, -2.617769, 0.3803922, 1, 0, 1,
-0.5755487, 0.9831282, 0.7918278, 0.372549, 1, 0, 1,
-0.5751033, -1.932225, -5.227089, 0.3686275, 1, 0, 1,
-0.5740175, -0.09674617, -1.239472, 0.3607843, 1, 0, 1,
-0.573363, -0.9067714, -2.368892, 0.3568628, 1, 0, 1,
-0.5615295, -1.550044, -2.002003, 0.3490196, 1, 0, 1,
-0.5596519, -0.04161475, -1.736491, 0.345098, 1, 0, 1,
-0.5575192, 0.2608125, -1.49193, 0.3372549, 1, 0, 1,
-0.5567126, 0.6177846, 1.197664, 0.3333333, 1, 0, 1,
-0.5435097, 0.1770703, -1.868249, 0.3254902, 1, 0, 1,
-0.5412245, 0.8078589, -1.185708, 0.3215686, 1, 0, 1,
-0.5403479, -0.4140169, -1.669109, 0.3137255, 1, 0, 1,
-0.5369991, 0.5721446, 1.366949, 0.3098039, 1, 0, 1,
-0.5348293, -1.642781, -4.554136, 0.3019608, 1, 0, 1,
-0.5341146, 0.8856794, -0.5928585, 0.2941177, 1, 0, 1,
-0.5324394, -0.04964869, -0.8799793, 0.2901961, 1, 0, 1,
-0.532364, -0.207059, -1.638025, 0.282353, 1, 0, 1,
-0.5289593, -0.8712792, -3.052536, 0.2784314, 1, 0, 1,
-0.5286865, 1.324674, 0.7509509, 0.2705882, 1, 0, 1,
-0.5219094, -0.6344535, -0.8848485, 0.2666667, 1, 0, 1,
-0.5187748, 0.09364329, -0.4131472, 0.2588235, 1, 0, 1,
-0.5168264, -0.3435596, -2.712106, 0.254902, 1, 0, 1,
-0.5157546, -0.4163466, -2.672955, 0.2470588, 1, 0, 1,
-0.5139613, 0.9458816, 0.3571055, 0.2431373, 1, 0, 1,
-0.5138723, -0.03683843, -0.354455, 0.2352941, 1, 0, 1,
-0.5089763, -1.501034, -1.416028, 0.2313726, 1, 0, 1,
-0.5089648, -0.7161685, -1.998664, 0.2235294, 1, 0, 1,
-0.5011618, 0.4711632, -0.1766312, 0.2196078, 1, 0, 1,
-0.4961314, 0.9894868, 0.7125325, 0.2117647, 1, 0, 1,
-0.4949651, 0.570973, -2.086189, 0.2078431, 1, 0, 1,
-0.4922692, 0.2914466, -1.914651, 0.2, 1, 0, 1,
-0.488478, -1.51929, -3.283438, 0.1921569, 1, 0, 1,
-0.4870661, -1.171534, -0.8229659, 0.1882353, 1, 0, 1,
-0.48463, -1.308061, -3.520095, 0.1803922, 1, 0, 1,
-0.4793967, -1.410076, -2.19114, 0.1764706, 1, 0, 1,
-0.477984, -0.2241352, -1.058032, 0.1686275, 1, 0, 1,
-0.4771953, 0.7680249, -1.703483, 0.1647059, 1, 0, 1,
-0.475659, 1.162695, 0.9784043, 0.1568628, 1, 0, 1,
-0.4705177, 0.5505285, -2.228604, 0.1529412, 1, 0, 1,
-0.4693605, -0.2904735, -2.999754, 0.145098, 1, 0, 1,
-0.4630474, 0.7505019, -0.5718372, 0.1411765, 1, 0, 1,
-0.4606408, -0.3999737, -1.76803, 0.1333333, 1, 0, 1,
-0.4537677, -0.1418252, -0.8568571, 0.1294118, 1, 0, 1,
-0.4532457, 1.686118, 0.2343426, 0.1215686, 1, 0, 1,
-0.4459557, 0.6718336, -0.4074889, 0.1176471, 1, 0, 1,
-0.4448298, 0.3843003, -0.7045281, 0.1098039, 1, 0, 1,
-0.4433337, 1.316518, -1.764511, 0.1058824, 1, 0, 1,
-0.4419572, -0.3439989, -2.958646, 0.09803922, 1, 0, 1,
-0.4379093, 1.042649, -1.185185, 0.09019608, 1, 0, 1,
-0.4378176, 2.797618, -0.2521282, 0.08627451, 1, 0, 1,
-0.4333864, 0.2968165, -0.6967044, 0.07843138, 1, 0, 1,
-0.4322182, 0.2404368, -1.786165, 0.07450981, 1, 0, 1,
-0.4285181, -0.6919984, -1.725655, 0.06666667, 1, 0, 1,
-0.4264733, -1.35843, -2.715664, 0.0627451, 1, 0, 1,
-0.4241111, 1.07094, -1.894945, 0.05490196, 1, 0, 1,
-0.4222129, 0.7963079, -0.8340734, 0.05098039, 1, 0, 1,
-0.4195342, 0.5394391, 0.5101062, 0.04313726, 1, 0, 1,
-0.4194161, -1.034273, -3.579551, 0.03921569, 1, 0, 1,
-0.4171146, 1.196343, -0.7169849, 0.03137255, 1, 0, 1,
-0.412813, -2.507875, -1.81107, 0.02745098, 1, 0, 1,
-0.4115471, -0.8322855, -2.292998, 0.01960784, 1, 0, 1,
-0.4106422, 0.2091797, -0.4579067, 0.01568628, 1, 0, 1,
-0.4101373, -0.3860333, -2.470453, 0.007843138, 1, 0, 1,
-0.4049872, -0.7178224, -2.526195, 0.003921569, 1, 0, 1,
-0.4001192, -0.03574786, -0.7813317, 0, 1, 0.003921569, 1,
-0.3966355, 0.6727525, -1.610754, 0, 1, 0.01176471, 1,
-0.3876435, -1.088111, -3.943906, 0, 1, 0.01568628, 1,
-0.3874326, 0.1860773, 0.1384375, 0, 1, 0.02352941, 1,
-0.3869331, 0.8777537, -1.160115, 0, 1, 0.02745098, 1,
-0.386007, 1.126889, 0.8393746, 0, 1, 0.03529412, 1,
-0.3798749, 1.028617, 0.2033306, 0, 1, 0.03921569, 1,
-0.3682795, -0.1268368, -2.104054, 0, 1, 0.04705882, 1,
-0.3655123, -1.320338, -1.650094, 0, 1, 0.05098039, 1,
-0.3624492, 0.1123639, -0.287318, 0, 1, 0.05882353, 1,
-0.358036, -0.0971368, -2.104451, 0, 1, 0.0627451, 1,
-0.3523847, 0.8138875, -0.3219588, 0, 1, 0.07058824, 1,
-0.3507307, 0.3260716, 0.1562787, 0, 1, 0.07450981, 1,
-0.3386906, 1.189898, -0.6637736, 0, 1, 0.08235294, 1,
-0.3380185, 1.033016, -0.2046347, 0, 1, 0.08627451, 1,
-0.3368863, -1.366881, -3.547137, 0, 1, 0.09411765, 1,
-0.3359421, 1.577897, 1.267931, 0, 1, 0.1019608, 1,
-0.3358881, -1.101089, -2.73095, 0, 1, 0.1058824, 1,
-0.333604, 0.5814097, -0.7536427, 0, 1, 0.1137255, 1,
-0.3325747, 1.039654, -2.319423, 0, 1, 0.1176471, 1,
-0.3311906, -0.9325449, -3.100499, 0, 1, 0.1254902, 1,
-0.3269264, -0.007686113, -2.082253, 0, 1, 0.1294118, 1,
-0.3267862, -1.811015, -3.413231, 0, 1, 0.1372549, 1,
-0.326717, -0.532185, -3.533566, 0, 1, 0.1411765, 1,
-0.3261831, -0.1542797, -0.8111698, 0, 1, 0.1490196, 1,
-0.325809, -1.580432, -3.831107, 0, 1, 0.1529412, 1,
-0.3247042, -0.3945571, -2.767368, 0, 1, 0.1607843, 1,
-0.3228822, -0.01812729, 0.3142929, 0, 1, 0.1647059, 1,
-0.3185708, -0.8297018, -1.967916, 0, 1, 0.172549, 1,
-0.3145258, 0.6503403, -0.5290881, 0, 1, 0.1764706, 1,
-0.3123309, 0.430441, 0.03214722, 0, 1, 0.1843137, 1,
-0.3123246, -0.4493923, -3.213017, 0, 1, 0.1882353, 1,
-0.3099259, -0.1638208, -2.428891, 0, 1, 0.1960784, 1,
-0.3041449, -0.07219483, -2.162861, 0, 1, 0.2039216, 1,
-0.2998872, -0.5598189, -3.087914, 0, 1, 0.2078431, 1,
-0.2988472, -0.6740078, -5.058389, 0, 1, 0.2156863, 1,
-0.2984365, -0.6252474, -3.633651, 0, 1, 0.2196078, 1,
-0.2963997, 0.952789, 0.5526301, 0, 1, 0.227451, 1,
-0.295485, 0.9500619, 0.09574705, 0, 1, 0.2313726, 1,
-0.2954095, 1.296361, 0.3441538, 0, 1, 0.2392157, 1,
-0.2938348, 1.302052, 0.4378569, 0, 1, 0.2431373, 1,
-0.289811, -0.9248652, -3.458588, 0, 1, 0.2509804, 1,
-0.2887878, -1.287222, -2.55778, 0, 1, 0.254902, 1,
-0.287102, 1.308724, 0.3032498, 0, 1, 0.2627451, 1,
-0.2861924, -0.1354846, -2.240383, 0, 1, 0.2666667, 1,
-0.2839051, -1.606224, -2.921524, 0, 1, 0.2745098, 1,
-0.2778595, -0.190672, -2.530476, 0, 1, 0.2784314, 1,
-0.2762342, -0.9013972, -3.097835, 0, 1, 0.2862745, 1,
-0.2745111, -0.6927592, -4.512216, 0, 1, 0.2901961, 1,
-0.2719187, 0.1605149, -0.08134826, 0, 1, 0.2980392, 1,
-0.270321, -0.7790995, -2.248957, 0, 1, 0.3058824, 1,
-0.2675848, -0.9497783, -4.096764, 0, 1, 0.3098039, 1,
-0.2673101, -0.2860117, -2.003599, 0, 1, 0.3176471, 1,
-0.2664141, -1.186519, -2.865113, 0, 1, 0.3215686, 1,
-0.265888, -0.2024991, -1.516863, 0, 1, 0.3294118, 1,
-0.2656235, -0.7966342, -5.037132, 0, 1, 0.3333333, 1,
-0.2609856, -0.211568, -1.53694, 0, 1, 0.3411765, 1,
-0.2599852, -0.9904621, -1.416784, 0, 1, 0.345098, 1,
-0.2503467, -0.510444, -4.82964, 0, 1, 0.3529412, 1,
-0.2427947, -0.1799913, -1.119237, 0, 1, 0.3568628, 1,
-0.2417542, -0.4524592, -2.256996, 0, 1, 0.3647059, 1,
-0.2414237, -1.324431, -3.417425, 0, 1, 0.3686275, 1,
-0.2349304, 0.06575817, -0.4936686, 0, 1, 0.3764706, 1,
-0.2318628, -0.73675, -1.543065, 0, 1, 0.3803922, 1,
-0.2317094, 0.3625352, -0.8223218, 0, 1, 0.3882353, 1,
-0.2316694, -1.286069, -3.56775, 0, 1, 0.3921569, 1,
-0.2257375, -1.201124, -1.538545, 0, 1, 0.4, 1,
-0.2254984, -0.2355022, -0.3708716, 0, 1, 0.4078431, 1,
-0.214576, 1.423515, 0.3912403, 0, 1, 0.4117647, 1,
-0.2133028, -0.1599019, -1.146633, 0, 1, 0.4196078, 1,
-0.2131223, 0.006498319, -2.143536, 0, 1, 0.4235294, 1,
-0.2099888, -0.4123449, -4.12392, 0, 1, 0.4313726, 1,
-0.2081308, -0.3478678, -2.957678, 0, 1, 0.4352941, 1,
-0.2079058, 1.417738, -2.605268, 0, 1, 0.4431373, 1,
-0.2074958, -0.4172817, -3.57967, 0, 1, 0.4470588, 1,
-0.2021209, 0.4479649, -0.5145664, 0, 1, 0.454902, 1,
-0.1982302, 1.954126, 0.9720845, 0, 1, 0.4588235, 1,
-0.1950561, -1.661398, -3.52882, 0, 1, 0.4666667, 1,
-0.1941722, 0.7069982, 0.6457533, 0, 1, 0.4705882, 1,
-0.1904514, -0.6028646, -1.366627, 0, 1, 0.4784314, 1,
-0.1893154, 0.8133834, 2.408113, 0, 1, 0.4823529, 1,
-0.1874843, 2.035351, -0.9212735, 0, 1, 0.4901961, 1,
-0.1853692, -0.2695473, -4.132808, 0, 1, 0.4941176, 1,
-0.1839417, 0.8860049, -0.583176, 0, 1, 0.5019608, 1,
-0.1819054, -0.5865834, -2.504764, 0, 1, 0.509804, 1,
-0.1760248, -0.2698215, -0.9421847, 0, 1, 0.5137255, 1,
-0.17278, -0.8945467, -2.184638, 0, 1, 0.5215687, 1,
-0.1725735, 0.5669188, 0.9819322, 0, 1, 0.5254902, 1,
-0.171816, -1.288471, -3.65342, 0, 1, 0.5333334, 1,
-0.1668544, 2.949037, -0.9512768, 0, 1, 0.5372549, 1,
-0.1662223, 0.8264927, -1.462504, 0, 1, 0.5450981, 1,
-0.1584369, 0.9583991, -2.576477, 0, 1, 0.5490196, 1,
-0.1517539, 0.1395997, -0.5011026, 0, 1, 0.5568628, 1,
-0.1507915, 1.652474, 1.747816, 0, 1, 0.5607843, 1,
-0.1483731, -0.551351, -5.122698, 0, 1, 0.5686275, 1,
-0.1461445, 0.537503, -1.019186, 0, 1, 0.572549, 1,
-0.1434561, -0.191314, -2.883139, 0, 1, 0.5803922, 1,
-0.1401818, 0.353786, 0.01193032, 0, 1, 0.5843138, 1,
-0.1393954, 0.0386877, -2.095362, 0, 1, 0.5921569, 1,
-0.1357562, -0.6886678, -3.029967, 0, 1, 0.5960785, 1,
-0.1316586, 0.7526183, -1.081704, 0, 1, 0.6039216, 1,
-0.1311291, -0.2907557, -4.156423, 0, 1, 0.6117647, 1,
-0.1280963, -1.525817, -3.30915, 0, 1, 0.6156863, 1,
-0.1267319, 1.292981, 0.138719, 0, 1, 0.6235294, 1,
-0.1257511, -0.7302484, -4.125907, 0, 1, 0.627451, 1,
-0.1231874, 1.506142, 1.82571, 0, 1, 0.6352941, 1,
-0.1145156, -0.3871048, -2.579367, 0, 1, 0.6392157, 1,
-0.1139512, 0.9230861, -0.9829167, 0, 1, 0.6470588, 1,
-0.113788, -0.7330082, -3.521598, 0, 1, 0.6509804, 1,
-0.112188, 0.05857657, -1.114379, 0, 1, 0.6588235, 1,
-0.1116708, -0.9437096, -2.064655, 0, 1, 0.6627451, 1,
-0.1046243, -3.115764, -3.583368, 0, 1, 0.6705883, 1,
-0.1028543, 1.034156, 0.2554951, 0, 1, 0.6745098, 1,
-0.1021066, -1.160994, -2.752357, 0, 1, 0.682353, 1,
-0.09858978, 1.221927, 0.02927168, 0, 1, 0.6862745, 1,
-0.09745815, 0.3539109, -1.519071, 0, 1, 0.6941177, 1,
-0.09155122, 1.380825, -0.9822723, 0, 1, 0.7019608, 1,
-0.08922483, -0.07534174, -1.201794, 0, 1, 0.7058824, 1,
-0.08912694, -0.06971789, -2.287457, 0, 1, 0.7137255, 1,
-0.08530462, -0.8695915, -2.164311, 0, 1, 0.7176471, 1,
-0.08463718, -0.9877169, -3.585591, 0, 1, 0.7254902, 1,
-0.08007262, 0.8303981, -0.3006693, 0, 1, 0.7294118, 1,
-0.06840985, 1.279284, -0.6630841, 0, 1, 0.7372549, 1,
-0.06781817, 0.09271384, -1.085763, 0, 1, 0.7411765, 1,
-0.06558985, -2.239452, -4.647666, 0, 1, 0.7490196, 1,
-0.06264672, -1.413362, -3.689505, 0, 1, 0.7529412, 1,
-0.05791621, -0.1545847, -1.347152, 0, 1, 0.7607843, 1,
-0.05684268, -0.9767267, -3.516177, 0, 1, 0.7647059, 1,
-0.05440109, -0.3969108, -4.569487, 0, 1, 0.772549, 1,
-0.04879981, -2.800612, -3.352628, 0, 1, 0.7764706, 1,
-0.0469006, 1.268582, 1.162178, 0, 1, 0.7843137, 1,
-0.0440101, -0.1800536, -2.117083, 0, 1, 0.7882353, 1,
-0.0381178, 0.6237943, 1.173872, 0, 1, 0.7960784, 1,
-0.03760462, -0.732862, -3.706992, 0, 1, 0.8039216, 1,
-0.0369554, -1.066935, -2.379909, 0, 1, 0.8078431, 1,
-0.0357535, -0.6822735, -3.321378, 0, 1, 0.8156863, 1,
-0.02995752, 1.416672, -0.08940517, 0, 1, 0.8196079, 1,
-0.02892115, 0.007068426, -2.622065, 0, 1, 0.827451, 1,
-0.02756377, -1.974509, -3.2534, 0, 1, 0.8313726, 1,
-0.02750031, -0.5752567, -5.361316, 0, 1, 0.8392157, 1,
-0.02093563, -0.4885918, -1.905531, 0, 1, 0.8431373, 1,
-0.02070198, 1.183255, -0.6018536, 0, 1, 0.8509804, 1,
-0.01947309, 1.971861, 0.1043194, 0, 1, 0.854902, 1,
-0.01023124, -1.067975, -3.266659, 0, 1, 0.8627451, 1,
-0.006656564, -1.4824, -2.994042, 0, 1, 0.8666667, 1,
-0.003844892, -0.008352001, -1.172199, 0, 1, 0.8745098, 1,
-0.003540168, -1.111549, -4.129264, 0, 1, 0.8784314, 1,
0.001023445, -2.664937, 1.116711, 0, 1, 0.8862745, 1,
0.003211847, -0.6701871, 2.795732, 0, 1, 0.8901961, 1,
0.006278255, 0.1297177, -0.2888856, 0, 1, 0.8980392, 1,
0.006363833, 1.321169, 0.02512013, 0, 1, 0.9058824, 1,
0.009916814, 0.4230232, 0.1333573, 0, 1, 0.9098039, 1,
0.01075934, -1.370434, 3.130934, 0, 1, 0.9176471, 1,
0.01480105, 1.14697, 1.09263, 0, 1, 0.9215686, 1,
0.01733165, -1.471186, 5.280359, 0, 1, 0.9294118, 1,
0.0199125, 0.8542151, -1.351697, 0, 1, 0.9333333, 1,
0.02860139, 1.359485, -0.4004974, 0, 1, 0.9411765, 1,
0.0306447, 1.019544, 0.26911, 0, 1, 0.945098, 1,
0.03219325, 2.432645, -0.7085217, 0, 1, 0.9529412, 1,
0.0346253, -0.3010221, 2.542198, 0, 1, 0.9568627, 1,
0.03736408, 0.4297719, -0.5778236, 0, 1, 0.9647059, 1,
0.03835765, -1.896518, 2.974924, 0, 1, 0.9686275, 1,
0.04007141, -0.1208752, 3.674196, 0, 1, 0.9764706, 1,
0.04478519, -0.6217879, 2.989336, 0, 1, 0.9803922, 1,
0.04526844, -0.3804798, 4.901419, 0, 1, 0.9882353, 1,
0.04973439, -0.9176505, 0.7765424, 0, 1, 0.9921569, 1,
0.05740668, 0.238793, -0.6996381, 0, 1, 1, 1,
0.06021211, 0.4921368, -1.47427, 0, 0.9921569, 1, 1,
0.06053873, 1.399483, -2.106742, 0, 0.9882353, 1, 1,
0.06060029, -0.08785415, 2.815787, 0, 0.9803922, 1, 1,
0.06436504, -1.124518, 2.511876, 0, 0.9764706, 1, 1,
0.06485602, 0.849748, -1.234272, 0, 0.9686275, 1, 1,
0.06519989, 1.392552, -0.6839081, 0, 0.9647059, 1, 1,
0.06525233, -0.1369645, 3.468501, 0, 0.9568627, 1, 1,
0.0674007, 0.9592817, -0.7953178, 0, 0.9529412, 1, 1,
0.0683168, 1.311021, -1.181049, 0, 0.945098, 1, 1,
0.06940235, 0.1605625, 2.351675, 0, 0.9411765, 1, 1,
0.06955044, -2.149394, 1.587209, 0, 0.9333333, 1, 1,
0.07047039, 1.113384, -0.9777582, 0, 0.9294118, 1, 1,
0.07075421, -0.7092211, 3.973323, 0, 0.9215686, 1, 1,
0.07171189, -2.50987, 4.764797, 0, 0.9176471, 1, 1,
0.07761719, 2.094461, 0.3786224, 0, 0.9098039, 1, 1,
0.0776654, -0.1722684, 0.1530752, 0, 0.9058824, 1, 1,
0.07776065, 0.6882743, 0.2954945, 0, 0.8980392, 1, 1,
0.07925607, -1.12412, 2.38895, 0, 0.8901961, 1, 1,
0.08368249, 0.2447897, 1.895965, 0, 0.8862745, 1, 1,
0.08398418, 0.5757663, -1.43212, 0, 0.8784314, 1, 1,
0.0861386, -2.28606, 4.126587, 0, 0.8745098, 1, 1,
0.08850709, 0.3264574, -0.9261671, 0, 0.8666667, 1, 1,
0.08891775, -0.8018323, 3.235409, 0, 0.8627451, 1, 1,
0.09025179, 1.412633, -0.2011176, 0, 0.854902, 1, 1,
0.09446523, 0.1217516, 0.1229837, 0, 0.8509804, 1, 1,
0.09916659, 0.05097379, 1.844242, 0, 0.8431373, 1, 1,
0.1000737, -1.402317, 3.714177, 0, 0.8392157, 1, 1,
0.1004042, -0.3613353, 0.9045784, 0, 0.8313726, 1, 1,
0.100899, -0.3422666, 2.911839, 0, 0.827451, 1, 1,
0.1052045, -1.264154, 4.370549, 0, 0.8196079, 1, 1,
0.1077464, -2.175128, 3.421522, 0, 0.8156863, 1, 1,
0.1078585, -2.03509, 3.150923, 0, 0.8078431, 1, 1,
0.1091197, 0.3820127, 1.009313, 0, 0.8039216, 1, 1,
0.1105851, 0.1889943, -0.1512436, 0, 0.7960784, 1, 1,
0.1152483, -1.139471, 2.988588, 0, 0.7882353, 1, 1,
0.1168053, -0.494185, 2.98579, 0, 0.7843137, 1, 1,
0.118154, 1.131572, -1.729625, 0, 0.7764706, 1, 1,
0.1183091, -0.07652189, 0.5588186, 0, 0.772549, 1, 1,
0.1273328, -0.3205487, 2.953784, 0, 0.7647059, 1, 1,
0.1280282, 0.4441883, 0.3595723, 0, 0.7607843, 1, 1,
0.1291098, 0.5175385, 0.481775, 0, 0.7529412, 1, 1,
0.1310254, 0.3664528, 0.4667444, 0, 0.7490196, 1, 1,
0.131107, -0.6391009, 3.608846, 0, 0.7411765, 1, 1,
0.1324274, 0.216886, 0.8624515, 0, 0.7372549, 1, 1,
0.1324702, 0.8746496, 1.503738, 0, 0.7294118, 1, 1,
0.1325069, 0.234801, 0.6455351, 0, 0.7254902, 1, 1,
0.1350784, -0.07247166, 1.227285, 0, 0.7176471, 1, 1,
0.1357189, -1.29341, 4.418899, 0, 0.7137255, 1, 1,
0.1365863, -0.8255973, 2.088883, 0, 0.7058824, 1, 1,
0.1379332, 1.836521, 0.07029174, 0, 0.6980392, 1, 1,
0.1389451, -0.9295886, 2.730041, 0, 0.6941177, 1, 1,
0.1402194, -1.049023, 4.258292, 0, 0.6862745, 1, 1,
0.1436624, -0.1053222, 2.211641, 0, 0.682353, 1, 1,
0.1465486, 0.2427698, 0.1565246, 0, 0.6745098, 1, 1,
0.1481602, -0.2107952, 3.580107, 0, 0.6705883, 1, 1,
0.1495694, -0.2393729, 1.474231, 0, 0.6627451, 1, 1,
0.1496106, -1.162097, 1.543461, 0, 0.6588235, 1, 1,
0.1512165, 1.327945, -0.8108457, 0, 0.6509804, 1, 1,
0.1541664, 1.189025, 1.779209, 0, 0.6470588, 1, 1,
0.1554402, -0.3033899, 3.525749, 0, 0.6392157, 1, 1,
0.1555873, -0.1167082, 3.470492, 0, 0.6352941, 1, 1,
0.1573256, -1.07321, 1.818308, 0, 0.627451, 1, 1,
0.1579683, 0.8923102, 1.302935, 0, 0.6235294, 1, 1,
0.1614743, 0.8292046, -1.208501, 0, 0.6156863, 1, 1,
0.1690033, 1.245018, 0.8971811, 0, 0.6117647, 1, 1,
0.17113, 0.162974, 3.283362, 0, 0.6039216, 1, 1,
0.1778485, 0.4477353, 1.519943, 0, 0.5960785, 1, 1,
0.1801398, -0.8387344, 4.690393, 0, 0.5921569, 1, 1,
0.1804421, -0.9633075, 4.311705, 0, 0.5843138, 1, 1,
0.1819792, -0.1823328, 1.879976, 0, 0.5803922, 1, 1,
0.1843675, 1.061543, 1.967703, 0, 0.572549, 1, 1,
0.1900275, -1.527387, 4.118042, 0, 0.5686275, 1, 1,
0.192919, -1.188853, 2.084587, 0, 0.5607843, 1, 1,
0.1984676, 1.442852, -0.2325659, 0, 0.5568628, 1, 1,
0.2057916, 1.827814, 1.179494, 0, 0.5490196, 1, 1,
0.2164259, -1.04727, 2.420791, 0, 0.5450981, 1, 1,
0.2167682, -0.2560232, 3.734896, 0, 0.5372549, 1, 1,
0.2186889, -0.3335302, 0.6795711, 0, 0.5333334, 1, 1,
0.2200074, -0.2316884, 2.17398, 0, 0.5254902, 1, 1,
0.2249612, 0.1101633, 1.449343, 0, 0.5215687, 1, 1,
0.2283354, 0.4397134, 0.1979019, 0, 0.5137255, 1, 1,
0.2339902, 0.2432805, 0.2790974, 0, 0.509804, 1, 1,
0.2355174, 0.6162074, 1.279865, 0, 0.5019608, 1, 1,
0.2401497, -0.5907269, 2.59737, 0, 0.4941176, 1, 1,
0.2403081, -1.005615, 1.72497, 0, 0.4901961, 1, 1,
0.240973, 0.2510842, 0.2977048, 0, 0.4823529, 1, 1,
0.2410535, -1.596765, 1.583035, 0, 0.4784314, 1, 1,
0.2414849, -0.5566431, 1.258833, 0, 0.4705882, 1, 1,
0.2440492, -0.4149474, 2.656029, 0, 0.4666667, 1, 1,
0.245855, 1.333892, 0.8230298, 0, 0.4588235, 1, 1,
0.2517566, 0.747097, -0.1717406, 0, 0.454902, 1, 1,
0.2551397, 0.7520669, 0.6274374, 0, 0.4470588, 1, 1,
0.2558794, 0.9999754, 0.4584363, 0, 0.4431373, 1, 1,
0.2572497, -0.009660078, 1.761026, 0, 0.4352941, 1, 1,
0.2585277, 0.9701833, 2.440347, 0, 0.4313726, 1, 1,
0.272104, -0.7066331, 3.343667, 0, 0.4235294, 1, 1,
0.2752398, 1.988183, 0.6913537, 0, 0.4196078, 1, 1,
0.2806905, 1.301831, -1.894044, 0, 0.4117647, 1, 1,
0.2841401, 0.8941565, 0.1071456, 0, 0.4078431, 1, 1,
0.2856442, 1.609014, -0.6392925, 0, 0.4, 1, 1,
0.2884194, 0.9604938, 0.7275664, 0, 0.3921569, 1, 1,
0.2920955, -2.035186, 4.037838, 0, 0.3882353, 1, 1,
0.2942459, -1.556675, 3.105151, 0, 0.3803922, 1, 1,
0.2952119, -0.5069503, 4.01114, 0, 0.3764706, 1, 1,
0.3000696, -0.2349382, 2.218126, 0, 0.3686275, 1, 1,
0.3055972, 0.1251171, 0.2990346, 0, 0.3647059, 1, 1,
0.3103951, -0.950926, 3.597173, 0, 0.3568628, 1, 1,
0.311901, -0.8874298, 2.050406, 0, 0.3529412, 1, 1,
0.3138814, 2.346095, 1.006921, 0, 0.345098, 1, 1,
0.3155541, 1.74813, 0.6027924, 0, 0.3411765, 1, 1,
0.323727, 0.2031319, 2.234796, 0, 0.3333333, 1, 1,
0.3268025, -0.05168479, 1.109312, 0, 0.3294118, 1, 1,
0.3290584, 1.228506, 0.490103, 0, 0.3215686, 1, 1,
0.3299963, -0.6206869, 2.545428, 0, 0.3176471, 1, 1,
0.33869, -1.678139, 2.596505, 0, 0.3098039, 1, 1,
0.3395037, -0.1601814, 0.7358468, 0, 0.3058824, 1, 1,
0.3446945, -0.4052677, 0.2186766, 0, 0.2980392, 1, 1,
0.3451731, 0.007126444, 1.816377, 0, 0.2901961, 1, 1,
0.3480802, -0.09246702, 0.8752061, 0, 0.2862745, 1, 1,
0.3515048, -0.2544622, 2.608922, 0, 0.2784314, 1, 1,
0.35693, -0.5793912, 1.595995, 0, 0.2745098, 1, 1,
0.3592357, -0.9654708, 1.961092, 0, 0.2666667, 1, 1,
0.3596266, -0.3348566, 3.939207, 0, 0.2627451, 1, 1,
0.3600067, -0.05628049, 1.57521, 0, 0.254902, 1, 1,
0.3640709, -0.02883591, 0.7561712, 0, 0.2509804, 1, 1,
0.3654058, -1.546331, 3.410777, 0, 0.2431373, 1, 1,
0.3698933, -1.663376, 4.403572, 0, 0.2392157, 1, 1,
0.3700852, 0.4239476, 0.1268788, 0, 0.2313726, 1, 1,
0.3766996, 1.171189, 0.3723751, 0, 0.227451, 1, 1,
0.3811273, -0.5321475, 2.379435, 0, 0.2196078, 1, 1,
0.3840021, -0.9288144, 3.718093, 0, 0.2156863, 1, 1,
0.38425, 0.2485866, 0.2243601, 0, 0.2078431, 1, 1,
0.3872123, -0.9113708, 0.7032122, 0, 0.2039216, 1, 1,
0.3873394, 1.058453, 0.9300401, 0, 0.1960784, 1, 1,
0.3886722, -1.208817, 3.022376, 0, 0.1882353, 1, 1,
0.3967088, -0.4797194, 1.167211, 0, 0.1843137, 1, 1,
0.3970504, 0.2231565, 1.883452, 0, 0.1764706, 1, 1,
0.3973402, -1.056696, 4.306031, 0, 0.172549, 1, 1,
0.3975002, 1.954765, 0.7980288, 0, 0.1647059, 1, 1,
0.3992873, 0.6917467, 0.1660414, 0, 0.1607843, 1, 1,
0.4046437, -1.518457, 3.718457, 0, 0.1529412, 1, 1,
0.4055792, -0.4860019, 2.058618, 0, 0.1490196, 1, 1,
0.4058193, 0.5755312, 1.92245, 0, 0.1411765, 1, 1,
0.4072839, -0.4404159, 2.100175, 0, 0.1372549, 1, 1,
0.4080889, 0.6629494, 0.4481707, 0, 0.1294118, 1, 1,
0.4124997, -0.2728669, 1.916193, 0, 0.1254902, 1, 1,
0.4133342, -1.004286, 1.590117, 0, 0.1176471, 1, 1,
0.4203341, -2.076848, 1.951855, 0, 0.1137255, 1, 1,
0.4224772, 0.04061352, 1.206568, 0, 0.1058824, 1, 1,
0.4230748, -1.718749, 4.061536, 0, 0.09803922, 1, 1,
0.4261297, 0.5204798, 0.6788964, 0, 0.09411765, 1, 1,
0.4271223, -0.7981114, 1.339218, 0, 0.08627451, 1, 1,
0.4277081, 0.5336894, -0.1906283, 0, 0.08235294, 1, 1,
0.431717, 1.638086, 0.1463944, 0, 0.07450981, 1, 1,
0.4320342, 0.1940587, 1.312634, 0, 0.07058824, 1, 1,
0.4332661, -0.04584609, 2.023259, 0, 0.0627451, 1, 1,
0.4335987, -0.6563972, 1.591368, 0, 0.05882353, 1, 1,
0.4351586, -0.7224196, 1.741643, 0, 0.05098039, 1, 1,
0.4355652, -0.2588552, 0.9986928, 0, 0.04705882, 1, 1,
0.4360527, -1.266988, 2.294041, 0, 0.03921569, 1, 1,
0.4385343, -1.525485, 3.511654, 0, 0.03529412, 1, 1,
0.4444318, 0.03783719, 0.3229291, 0, 0.02745098, 1, 1,
0.4455741, -0.1426263, 3.865408, 0, 0.02352941, 1, 1,
0.4513698, 0.6257012, 0.8495528, 0, 0.01568628, 1, 1,
0.4542122, -1.567261, 5.653001, 0, 0.01176471, 1, 1,
0.4546224, 0.4343286, 2.208352, 0, 0.003921569, 1, 1,
0.457194, 0.1030337, 1.148396, 0.003921569, 0, 1, 1,
0.4579621, -0.310542, 2.352725, 0.007843138, 0, 1, 1,
0.459119, -0.376478, 2.674419, 0.01568628, 0, 1, 1,
0.461901, 1.038736, 1.830412, 0.01960784, 0, 1, 1,
0.4633949, 1.02818, -0.5558846, 0.02745098, 0, 1, 1,
0.4659178, 0.9972649, -1.058414, 0.03137255, 0, 1, 1,
0.4680817, -0.2342133, 2.14566, 0.03921569, 0, 1, 1,
0.4709614, -0.2275431, 1.598457, 0.04313726, 0, 1, 1,
0.4794073, 1.452279, 0.1673424, 0.05098039, 0, 1, 1,
0.4795619, -1.058702, 2.871001, 0.05490196, 0, 1, 1,
0.4810731, -0.3025706, 3.948134, 0.0627451, 0, 1, 1,
0.4832862, 0.378852, 1.86289, 0.06666667, 0, 1, 1,
0.4840306, 0.4174756, 1.227322, 0.07450981, 0, 1, 1,
0.4871562, 0.3213556, 1.651154, 0.07843138, 0, 1, 1,
0.4906585, 1.094525, 2.117001, 0.08627451, 0, 1, 1,
0.4909327, 0.8655763, 1.969967, 0.09019608, 0, 1, 1,
0.4948199, -1.522096, 3.03411, 0.09803922, 0, 1, 1,
0.4999339, 0.1126597, 0.8207282, 0.1058824, 0, 1, 1,
0.5026566, 0.1136747, 1.447273, 0.1098039, 0, 1, 1,
0.5058309, -2.315382, 2.816035, 0.1176471, 0, 1, 1,
0.5073347, 0.4648057, 0.1199736, 0.1215686, 0, 1, 1,
0.5116818, 0.4864656, -0.4858575, 0.1294118, 0, 1, 1,
0.5138589, -0.9223967, 1.49711, 0.1333333, 0, 1, 1,
0.5150238, -3.159313, 4.591414, 0.1411765, 0, 1, 1,
0.5162477, -0.4343545, 2.768217, 0.145098, 0, 1, 1,
0.5216553, -0.7114121, 1.065405, 0.1529412, 0, 1, 1,
0.522096, -0.6959479, 0.2853128, 0.1568628, 0, 1, 1,
0.5221852, 0.1108165, -0.08546413, 0.1647059, 0, 1, 1,
0.5246282, -0.5694022, 2.626563, 0.1686275, 0, 1, 1,
0.5249951, 2.222155, -0.4506561, 0.1764706, 0, 1, 1,
0.527924, 0.256247, 2.03931, 0.1803922, 0, 1, 1,
0.5284101, -0.3980938, 1.932931, 0.1882353, 0, 1, 1,
0.5287336, 0.8517298, -0.7698315, 0.1921569, 0, 1, 1,
0.5303524, 2.134015, 0.6251549, 0.2, 0, 1, 1,
0.531724, -0.3265285, 1.091853, 0.2078431, 0, 1, 1,
0.5468696, -0.1743014, 2.036707, 0.2117647, 0, 1, 1,
0.5500658, 1.304274, 1.455973, 0.2196078, 0, 1, 1,
0.5539542, 0.01106501, 1.179187, 0.2235294, 0, 1, 1,
0.5543306, 1.366493, 1.018075, 0.2313726, 0, 1, 1,
0.5556085, -0.4400436, 3.465072, 0.2352941, 0, 1, 1,
0.559145, 0.7557455, 1.207615, 0.2431373, 0, 1, 1,
0.5667379, -0.1097971, 1.899687, 0.2470588, 0, 1, 1,
0.5685779, -1.339796, 2.999834, 0.254902, 0, 1, 1,
0.5692731, 0.1058836, 0.8988059, 0.2588235, 0, 1, 1,
0.5708849, -0.86773, 3.212234, 0.2666667, 0, 1, 1,
0.5727264, 0.1133384, 1.094891, 0.2705882, 0, 1, 1,
0.5745358, -0.3034581, 3.356698, 0.2784314, 0, 1, 1,
0.5783466, -2.129011, 3.44098, 0.282353, 0, 1, 1,
0.5785205, 0.7707018, 1.062363, 0.2901961, 0, 1, 1,
0.5802613, -1.013971, 1.922468, 0.2941177, 0, 1, 1,
0.5814067, -0.5439426, 3.333218, 0.3019608, 0, 1, 1,
0.5841668, -0.4526068, 2.03941, 0.3098039, 0, 1, 1,
0.5880568, -0.3012085, 2.261062, 0.3137255, 0, 1, 1,
0.5886281, 0.3516367, 1.710154, 0.3215686, 0, 1, 1,
0.5919577, 1.338103, 0.9461517, 0.3254902, 0, 1, 1,
0.5934061, 0.07101601, 1.464326, 0.3333333, 0, 1, 1,
0.5934623, -0.6114463, 2.871613, 0.3372549, 0, 1, 1,
0.5943436, 0.2599135, 0.8165, 0.345098, 0, 1, 1,
0.5949377, -0.2573453, 3.423284, 0.3490196, 0, 1, 1,
0.6005064, 0.6750599, 1.55645, 0.3568628, 0, 1, 1,
0.6022407, -0.5512511, 1.971744, 0.3607843, 0, 1, 1,
0.6059064, -0.1173953, 3.439227, 0.3686275, 0, 1, 1,
0.6081069, -0.0791462, 0.9644234, 0.372549, 0, 1, 1,
0.6103054, -0.6026486, 1.58568, 0.3803922, 0, 1, 1,
0.610603, 0.7673894, 0.8566357, 0.3843137, 0, 1, 1,
0.613014, -0.5672646, 3.477326, 0.3921569, 0, 1, 1,
0.6241716, -0.5543476, 2.529966, 0.3960784, 0, 1, 1,
0.6262617, -1.043363, 2.56679, 0.4039216, 0, 1, 1,
0.6276452, 1.102399, 1.126642, 0.4117647, 0, 1, 1,
0.6277164, 0.9022383, -0.6373104, 0.4156863, 0, 1, 1,
0.634474, -0.07006282, 1.959954, 0.4235294, 0, 1, 1,
0.6361865, -1.310382, 3.29559, 0.427451, 0, 1, 1,
0.6432107, 0.02542431, 1.361402, 0.4352941, 0, 1, 1,
0.6452992, 1.885615, 0.8707751, 0.4392157, 0, 1, 1,
0.6510098, 0.9771704, 2.174685, 0.4470588, 0, 1, 1,
0.6529416, -0.06324176, 1.001621, 0.4509804, 0, 1, 1,
0.6542619, -1.339839, 3.878692, 0.4588235, 0, 1, 1,
0.6596324, 0.8785923, 0.7583634, 0.4627451, 0, 1, 1,
0.6649256, 0.5978587, -0.6817153, 0.4705882, 0, 1, 1,
0.6669402, 1.901992, -0.06137039, 0.4745098, 0, 1, 1,
0.6703246, -1.135724, 1.684216, 0.4823529, 0, 1, 1,
0.6711845, 0.1311408, 2.193244, 0.4862745, 0, 1, 1,
0.675491, -0.3435791, 1.688774, 0.4941176, 0, 1, 1,
0.6785141, 1.517547, 0.3797127, 0.5019608, 0, 1, 1,
0.6788712, 1.021862, 1.519406, 0.5058824, 0, 1, 1,
0.6802676, 0.0295956, 0.8749265, 0.5137255, 0, 1, 1,
0.6809075, -0.7656173, 2.744202, 0.5176471, 0, 1, 1,
0.68091, -0.3818368, 1.79626, 0.5254902, 0, 1, 1,
0.6815484, 1.486985, 0.6842886, 0.5294118, 0, 1, 1,
0.6822327, 0.1874399, 2.171505, 0.5372549, 0, 1, 1,
0.6963811, 0.3064163, 0.5879275, 0.5411765, 0, 1, 1,
0.6964449, 0.07369971, 0.1765975, 0.5490196, 0, 1, 1,
0.7009188, -0.514428, 1.280445, 0.5529412, 0, 1, 1,
0.7024884, 1.329505, 0.3807787, 0.5607843, 0, 1, 1,
0.7040822, -1.654837, 3.641259, 0.5647059, 0, 1, 1,
0.7048882, 1.233853, 0.8658818, 0.572549, 0, 1, 1,
0.7161047, -0.472865, 0.3168394, 0.5764706, 0, 1, 1,
0.7205505, -0.8472424, 3.45172, 0.5843138, 0, 1, 1,
0.7233157, -0.5305451, 1.568268, 0.5882353, 0, 1, 1,
0.7234031, -0.0592228, 1.756244, 0.5960785, 0, 1, 1,
0.7258763, -1.026226, 1.257386, 0.6039216, 0, 1, 1,
0.7367016, 0.6338322, 0.2181318, 0.6078432, 0, 1, 1,
0.7369768, 0.09502555, 3.322985, 0.6156863, 0, 1, 1,
0.7536215, 0.6532212, 1.016938, 0.6196079, 0, 1, 1,
0.7563769, 0.2479186, 1.192893, 0.627451, 0, 1, 1,
0.7586693, 0.377412, 2.262913, 0.6313726, 0, 1, 1,
0.7587309, 0.6801152, 1.210542, 0.6392157, 0, 1, 1,
0.7625695, 0.8356466, 0.7460364, 0.6431373, 0, 1, 1,
0.7675674, -0.04777073, 0.6333925, 0.6509804, 0, 1, 1,
0.7729601, 1.711424, -0.7835568, 0.654902, 0, 1, 1,
0.7766351, -0.5030103, 2.696268, 0.6627451, 0, 1, 1,
0.7779561, -0.6119279, 1.990635, 0.6666667, 0, 1, 1,
0.779575, -0.2198171, 1.803076, 0.6745098, 0, 1, 1,
0.782474, 0.1449383, 0.492251, 0.6784314, 0, 1, 1,
0.7858071, -1.597071, 4.445677, 0.6862745, 0, 1, 1,
0.7947703, -0.6972753, 1.040451, 0.6901961, 0, 1, 1,
0.796932, 0.442873, 1.297499, 0.6980392, 0, 1, 1,
0.800779, -0.7195213, 1.245255, 0.7058824, 0, 1, 1,
0.8016721, -0.2860014, 2.310459, 0.7098039, 0, 1, 1,
0.8031443, 0.2607729, 1.045102, 0.7176471, 0, 1, 1,
0.8055435, -0.02031006, -0.6302343, 0.7215686, 0, 1, 1,
0.8057104, -0.02875808, 3.175102, 0.7294118, 0, 1, 1,
0.8068448, 0.002939696, 1.208508, 0.7333333, 0, 1, 1,
0.8080496, -0.460204, 0.1102984, 0.7411765, 0, 1, 1,
0.8192763, -0.4059299, 1.594374, 0.7450981, 0, 1, 1,
0.8200696, 1.655706, -0.277774, 0.7529412, 0, 1, 1,
0.8215443, 0.3992295, -1.781048, 0.7568628, 0, 1, 1,
0.8216916, 0.3228849, 2.122054, 0.7647059, 0, 1, 1,
0.8225103, 0.5283196, 2.69298, 0.7686275, 0, 1, 1,
0.8264575, -0.5855201, 2.124836, 0.7764706, 0, 1, 1,
0.8310819, 1.174081, 1.292593, 0.7803922, 0, 1, 1,
0.8311918, 1.636933, 1.609174, 0.7882353, 0, 1, 1,
0.8408172, -0.349013, 2.314508, 0.7921569, 0, 1, 1,
0.8454942, -1.27934, 1.629183, 0.8, 0, 1, 1,
0.8463787, -2.362734, 3.076741, 0.8078431, 0, 1, 1,
0.8474597, 0.8199579, -0.6084331, 0.8117647, 0, 1, 1,
0.8568677, 1.06256, 0.3429924, 0.8196079, 0, 1, 1,
0.862287, 1.69688, -0.5344817, 0.8235294, 0, 1, 1,
0.8648053, -0.1249113, 0.9062336, 0.8313726, 0, 1, 1,
0.8657141, -0.6621275, 1.000852, 0.8352941, 0, 1, 1,
0.8659288, -0.7190467, 1.934705, 0.8431373, 0, 1, 1,
0.8730095, 0.2130129, 0.3468182, 0.8470588, 0, 1, 1,
0.8753551, 0.9356008, 2.794627, 0.854902, 0, 1, 1,
0.8842444, 1.288222, 1.698642, 0.8588235, 0, 1, 1,
0.8871718, 0.5441757, 0.4693683, 0.8666667, 0, 1, 1,
0.8967869, -2.412653, 3.046681, 0.8705882, 0, 1, 1,
0.8995999, -0.9557279, 4.159459, 0.8784314, 0, 1, 1,
0.9138985, 0.1842757, -0.1488208, 0.8823529, 0, 1, 1,
0.9152206, 1.323438, 0.7158269, 0.8901961, 0, 1, 1,
0.9157823, 0.1812435, 1.389299, 0.8941177, 0, 1, 1,
0.9241241, -0.5505698, 1.937283, 0.9019608, 0, 1, 1,
0.9292254, 0.6563293, 0.8251093, 0.9098039, 0, 1, 1,
0.931125, -1.017437, 2.564849, 0.9137255, 0, 1, 1,
0.93356, -0.4451755, 3.207748, 0.9215686, 0, 1, 1,
0.9393709, 0.6349738, 0.9056239, 0.9254902, 0, 1, 1,
0.9399256, -0.2805614, 2.701637, 0.9333333, 0, 1, 1,
0.9448747, -0.04980539, 1.783289, 0.9372549, 0, 1, 1,
0.9461909, 1.227126, 1.220788, 0.945098, 0, 1, 1,
0.9514223, 0.6708142, -0.7130681, 0.9490196, 0, 1, 1,
0.9519144, 0.994284, -1.115305, 0.9568627, 0, 1, 1,
0.953846, -1.117958, 2.855857, 0.9607843, 0, 1, 1,
0.9617389, -1.419559, 3.829645, 0.9686275, 0, 1, 1,
0.9619521, 0.508183, 0.6497604, 0.972549, 0, 1, 1,
0.9697628, -1.280431, 3.180854, 0.9803922, 0, 1, 1,
0.9825007, 0.8809446, 1.373039, 0.9843137, 0, 1, 1,
0.9878566, 2.115236, 0.8348899, 0.9921569, 0, 1, 1,
0.9922711, -2.025049, 1.593115, 0.9960784, 0, 1, 1,
0.9990742, -0.2789688, 0.7126529, 1, 0, 0.9960784, 1,
1.007044, -0.6570733, 1.955668, 1, 0, 0.9882353, 1,
1.009106, -0.1930698, 2.609246, 1, 0, 0.9843137, 1,
1.010841, -0.3658603, 4.195424, 1, 0, 0.9764706, 1,
1.021661, 0.8664401, 0.9179876, 1, 0, 0.972549, 1,
1.023694, 1.087538, -0.6558183, 1, 0, 0.9647059, 1,
1.023745, 1.396364, -1.773124, 1, 0, 0.9607843, 1,
1.025978, -1.470747, 2.733023, 1, 0, 0.9529412, 1,
1.026179, 0.52876, 1.941387, 1, 0, 0.9490196, 1,
1.026722, 1.202458, 0.5032378, 1, 0, 0.9411765, 1,
1.028705, 1.792575, -1.029239, 1, 0, 0.9372549, 1,
1.030036, 0.6683382, -0.7849277, 1, 0, 0.9294118, 1,
1.030181, -0.4832901, 1.639162, 1, 0, 0.9254902, 1,
1.034068, -1.14088, 2.380937, 1, 0, 0.9176471, 1,
1.041705, 0.7400991, 0.3273046, 1, 0, 0.9137255, 1,
1.044469, 0.02390446, 2.008554, 1, 0, 0.9058824, 1,
1.055573, 0.8104035, 0.7312593, 1, 0, 0.9019608, 1,
1.059646, 0.2522081, 1.737156, 1, 0, 0.8941177, 1,
1.060672, 0.114364, 0.2099983, 1, 0, 0.8862745, 1,
1.062271, 1.438269, 0.2680612, 1, 0, 0.8823529, 1,
1.063493, -0.7720459, 2.170314, 1, 0, 0.8745098, 1,
1.064161, -1.306026, 4.172947, 1, 0, 0.8705882, 1,
1.064666, -0.3963755, 2.496101, 1, 0, 0.8627451, 1,
1.066378, 0.9326944, 1.088961, 1, 0, 0.8588235, 1,
1.066963, -0.6065214, 2.736923, 1, 0, 0.8509804, 1,
1.067712, 0.6277545, 1.412807, 1, 0, 0.8470588, 1,
1.071704, 1.268901, 3.018821, 1, 0, 0.8392157, 1,
1.072976, 0.6327533, 0.9485505, 1, 0, 0.8352941, 1,
1.075227, 0.8499522, 1.208635, 1, 0, 0.827451, 1,
1.076086, 1.803415, 0.1619258, 1, 0, 0.8235294, 1,
1.080828, -1.700019, 3.952742, 1, 0, 0.8156863, 1,
1.08784, 0.1796103, 2.456629, 1, 0, 0.8117647, 1,
1.090312, 0.1656451, -0.8490811, 1, 0, 0.8039216, 1,
1.093684, 2.082042, 0.9019862, 1, 0, 0.7960784, 1,
1.093815, -2.414008, 1.992145, 1, 0, 0.7921569, 1,
1.098146, 0.7122851, 1.608384, 1, 0, 0.7843137, 1,
1.101667, 0.6556634, 1.205395, 1, 0, 0.7803922, 1,
1.105057, -0.226885, -0.1042157, 1, 0, 0.772549, 1,
1.105719, -0.01435356, 1.53887, 1, 0, 0.7686275, 1,
1.107478, 0.9834761, 1.850725, 1, 0, 0.7607843, 1,
1.113425, -0.3193503, 0.4716699, 1, 0, 0.7568628, 1,
1.114165, -0.3600877, 1.70068, 1, 0, 0.7490196, 1,
1.116386, -0.1081112, 3.760281, 1, 0, 0.7450981, 1,
1.117035, -0.9800508, 2.737263, 1, 0, 0.7372549, 1,
1.118172, -0.1797862, 1.309868, 1, 0, 0.7333333, 1,
1.127141, -0.3145572, 2.958837, 1, 0, 0.7254902, 1,
1.128804, 1.32208, -0.4043638, 1, 0, 0.7215686, 1,
1.141625, 0.4152631, 0.6797487, 1, 0, 0.7137255, 1,
1.152031, -1.120302, 3.446314, 1, 0, 0.7098039, 1,
1.154642, 1.855622, -0.3576563, 1, 0, 0.7019608, 1,
1.15483, -0.6987138, 1.102695, 1, 0, 0.6941177, 1,
1.159258, -0.7635375, 3.282061, 1, 0, 0.6901961, 1,
1.161377, 1.703084, -0.3933626, 1, 0, 0.682353, 1,
1.16487, -0.2140084, 1.802583, 1, 0, 0.6784314, 1,
1.167846, -0.7680973, 1.898515, 1, 0, 0.6705883, 1,
1.177734, -0.9695247, 2.025525, 1, 0, 0.6666667, 1,
1.179415, 0.1960477, -0.32654, 1, 0, 0.6588235, 1,
1.181498, -0.310699, 1.353963, 1, 0, 0.654902, 1,
1.184009, -0.115832, 3.485274, 1, 0, 0.6470588, 1,
1.185787, -0.1559679, 4.384529, 1, 0, 0.6431373, 1,
1.188315, 1.032992, -0.6800721, 1, 0, 0.6352941, 1,
1.19177, -0.07397932, 0.6323213, 1, 0, 0.6313726, 1,
1.194535, -0.07669647, 1.272278, 1, 0, 0.6235294, 1,
1.195759, -0.4025736, 2.298043, 1, 0, 0.6196079, 1,
1.196239, 0.624227, 0.3170004, 1, 0, 0.6117647, 1,
1.209439, -0.4286011, 2.448964, 1, 0, 0.6078432, 1,
1.216406, 0.4469021, 2.854507, 1, 0, 0.6, 1,
1.219772, 0.3712554, 1.42117, 1, 0, 0.5921569, 1,
1.235834, 1.046126, 0.1585624, 1, 0, 0.5882353, 1,
1.23823, 1.277507, 0.814173, 1, 0, 0.5803922, 1,
1.24212, -0.8748056, 2.354701, 1, 0, 0.5764706, 1,
1.242655, -2.783663, 1.053179, 1, 0, 0.5686275, 1,
1.244012, 0.4276429, 0.1296068, 1, 0, 0.5647059, 1,
1.24538, 0.8578981, 1.550101, 1, 0, 0.5568628, 1,
1.267018, 0.3049579, 1.277272, 1, 0, 0.5529412, 1,
1.286843, -0.09606108, 1.775215, 1, 0, 0.5450981, 1,
1.289812, -1.218496, 1.163396, 1, 0, 0.5411765, 1,
1.293131, -0.8886293, 3.11624, 1, 0, 0.5333334, 1,
1.30463, -1.053019, 2.660555, 1, 0, 0.5294118, 1,
1.306387, 0.4069757, 0.8206863, 1, 0, 0.5215687, 1,
1.318375, 0.2721161, -0.2668128, 1, 0, 0.5176471, 1,
1.320739, 0.8255463, -0.05049033, 1, 0, 0.509804, 1,
1.32988, 0.773683, 0.5898443, 1, 0, 0.5058824, 1,
1.332738, -0.3682503, 3.788449, 1, 0, 0.4980392, 1,
1.336042, -0.8374808, 3.412242, 1, 0, 0.4901961, 1,
1.340724, -0.7412772, 2.675718, 1, 0, 0.4862745, 1,
1.355372, 0.3229113, 1.279196, 1, 0, 0.4784314, 1,
1.374899, 0.7968281, -0.383893, 1, 0, 0.4745098, 1,
1.40323, 0.866322, 1.192266, 1, 0, 0.4666667, 1,
1.405652, -0.6262087, 1.559546, 1, 0, 0.4627451, 1,
1.417322, -0.3023066, 2.474539, 1, 0, 0.454902, 1,
1.433077, 0.1082841, 0.8556518, 1, 0, 0.4509804, 1,
1.439834, -0.2219691, 2.807953, 1, 0, 0.4431373, 1,
1.447612, 0.07093658, 2.43569, 1, 0, 0.4392157, 1,
1.448795, 0.3062185, 1.387157, 1, 0, 0.4313726, 1,
1.448839, -1.065101, 3.184394, 1, 0, 0.427451, 1,
1.45443, -1.321889, 2.814236, 1, 0, 0.4196078, 1,
1.458782, -0.3480774, 2.101028, 1, 0, 0.4156863, 1,
1.472253, -1.597263, 1.080539, 1, 0, 0.4078431, 1,
1.47942, -0.01062577, 0.3021544, 1, 0, 0.4039216, 1,
1.488331, -1.017842, 1.848662, 1, 0, 0.3960784, 1,
1.505963, -0.1266206, 1.020654, 1, 0, 0.3882353, 1,
1.507561, -0.0247004, 1.734809, 1, 0, 0.3843137, 1,
1.525549, -1.214725, 3.468037, 1, 0, 0.3764706, 1,
1.53123, 0.3042443, 1.346199, 1, 0, 0.372549, 1,
1.53849, 1.254834, 2.764538, 1, 0, 0.3647059, 1,
1.541446, 0.5584938, 1.523509, 1, 0, 0.3607843, 1,
1.556417, 0.541045, 2.808574, 1, 0, 0.3529412, 1,
1.557661, 2.263, 0.5706966, 1, 0, 0.3490196, 1,
1.559274, 0.2468411, 2.13536, 1, 0, 0.3411765, 1,
1.55996, -1.172858, 2.237996, 1, 0, 0.3372549, 1,
1.57018, 0.7017614, 2.435961, 1, 0, 0.3294118, 1,
1.588528, -1.438687, 2.204858, 1, 0, 0.3254902, 1,
1.592663, -0.889262, 0.7148623, 1, 0, 0.3176471, 1,
1.607689, 0.5468222, 1.915235, 1, 0, 0.3137255, 1,
1.613412, 0.633075, 1.849205, 1, 0, 0.3058824, 1,
1.615665, 0.6196544, 1.237561, 1, 0, 0.2980392, 1,
1.628801, 0.4412653, 1.292445, 1, 0, 0.2941177, 1,
1.644572, -0.7473898, 1.103735, 1, 0, 0.2862745, 1,
1.652793, -0.82537, 2.760661, 1, 0, 0.282353, 1,
1.663354, -1.139073, 1.817259, 1, 0, 0.2745098, 1,
1.671708, -0.7341832, 1.249325, 1, 0, 0.2705882, 1,
1.688517, 0.4222612, 2.479502, 1, 0, 0.2627451, 1,
1.693976, -0.3265459, 0.7175089, 1, 0, 0.2588235, 1,
1.702498, -1.245824, 2.436031, 1, 0, 0.2509804, 1,
1.716797, -0.1336652, 1.68411, 1, 0, 0.2470588, 1,
1.732703, 0.9525399, -0.4561403, 1, 0, 0.2392157, 1,
1.739091, -1.17329, 2.407634, 1, 0, 0.2352941, 1,
1.751065, -1.04586, 2.57772, 1, 0, 0.227451, 1,
1.77688, 1.162747, 1.605451, 1, 0, 0.2235294, 1,
1.795818, 3.098346, 1.610764, 1, 0, 0.2156863, 1,
1.817059, 1.086222, 0.8680661, 1, 0, 0.2117647, 1,
1.829782, -1.500418, 1.930717, 1, 0, 0.2039216, 1,
1.837574, -0.08929511, 2.640224, 1, 0, 0.1960784, 1,
1.849581, -0.6577874, 0.8190383, 1, 0, 0.1921569, 1,
1.88003, -0.1089975, 1.94143, 1, 0, 0.1843137, 1,
1.886115, 1.070765, 1.121561, 1, 0, 0.1803922, 1,
1.886405, -0.06079525, 2.372489, 1, 0, 0.172549, 1,
1.893649, 1.167266, -0.518622, 1, 0, 0.1686275, 1,
1.902164, -0.591712, 2.504447, 1, 0, 0.1607843, 1,
1.913021, -1.574144, 2.868544, 1, 0, 0.1568628, 1,
1.923698, 0.2426496, -0.04853735, 1, 0, 0.1490196, 1,
1.939187, -0.02258739, 1.360973, 1, 0, 0.145098, 1,
1.944033, 0.999439, 1.714645, 1, 0, 0.1372549, 1,
1.9485, 0.246539, -0.2355862, 1, 0, 0.1333333, 1,
2.002137, -0.2720875, 2.043203, 1, 0, 0.1254902, 1,
2.093078, 0.5579016, 0.6021457, 1, 0, 0.1215686, 1,
2.105394, 0.4329467, 0.978663, 1, 0, 0.1137255, 1,
2.141148, 0.3265205, 1.11994, 1, 0, 0.1098039, 1,
2.166152, -0.04656116, 1.746201, 1, 0, 0.1019608, 1,
2.232864, 1.101588, 2.030954, 1, 0, 0.09411765, 1,
2.241005, -2.53051, 2.398668, 1, 0, 0.09019608, 1,
2.276827, 0.5145952, 2.52111, 1, 0, 0.08235294, 1,
2.28822, -0.4399229, 2.314911, 1, 0, 0.07843138, 1,
2.295956, 1.033674, 1.224349, 1, 0, 0.07058824, 1,
2.311743, -0.7794505, 2.318617, 1, 0, 0.06666667, 1,
2.372066, 0.5450382, 1.484615, 1, 0, 0.05882353, 1,
2.40575, 0.0890602, 3.208673, 1, 0, 0.05490196, 1,
2.556655, -1.125069, 1.831681, 1, 0, 0.04705882, 1,
2.706752, 0.6844828, 1.263602, 1, 0, 0.04313726, 1,
2.706864, -1.197506, 2.129737, 1, 0, 0.03529412, 1,
2.789245, -1.482555, 2.949683, 1, 0, 0.03137255, 1,
2.827244, 1.231264, -0.0879361, 1, 0, 0.02352941, 1,
2.843999, 0.441927, 2.035786, 1, 0, 0.01960784, 1,
3.045209, -1.229403, 0.8337283, 1, 0, 0.01176471, 1,
3.130075, -1.225235, 1.982564, 1, 0, 0.007843138, 1
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
0.04880202, -4.219986, -7.228243, 0, -0.5, 0.5, 0.5,
0.04880202, -4.219986, -7.228243, 1, -0.5, 0.5, 0.5,
0.04880202, -4.219986, -7.228243, 1, 1.5, 0.5, 0.5,
0.04880202, -4.219986, -7.228243, 0, 1.5, 0.5, 0.5
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
-4.077023, -0.03048384, -7.228243, 0, -0.5, 0.5, 0.5,
-4.077023, -0.03048384, -7.228243, 1, -0.5, 0.5, 0.5,
-4.077023, -0.03048384, -7.228243, 1, 1.5, 0.5, 0.5,
-4.077023, -0.03048384, -7.228243, 0, 1.5, 0.5, 0.5
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
-4.077023, -4.219986, 0.1458426, 0, -0.5, 0.5, 0.5,
-4.077023, -4.219986, 0.1458426, 1, -0.5, 0.5, 0.5,
-4.077023, -4.219986, 0.1458426, 1, 1.5, 0.5, 0.5,
-4.077023, -4.219986, 0.1458426, 0, 1.5, 0.5, 0.5
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
-3, -3.253178, -5.526531,
3, -3.253178, -5.526531,
-3, -3.253178, -5.526531,
-3, -3.414313, -5.81015,
-2, -3.253178, -5.526531,
-2, -3.414313, -5.81015,
-1, -3.253178, -5.526531,
-1, -3.414313, -5.81015,
0, -3.253178, -5.526531,
0, -3.414313, -5.81015,
1, -3.253178, -5.526531,
1, -3.414313, -5.81015,
2, -3.253178, -5.526531,
2, -3.414313, -5.81015,
3, -3.253178, -5.526531,
3, -3.414313, -5.81015
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
-3, -3.736582, -6.377387, 0, -0.5, 0.5, 0.5,
-3, -3.736582, -6.377387, 1, -0.5, 0.5, 0.5,
-3, -3.736582, -6.377387, 1, 1.5, 0.5, 0.5,
-3, -3.736582, -6.377387, 0, 1.5, 0.5, 0.5,
-2, -3.736582, -6.377387, 0, -0.5, 0.5, 0.5,
-2, -3.736582, -6.377387, 1, -0.5, 0.5, 0.5,
-2, -3.736582, -6.377387, 1, 1.5, 0.5, 0.5,
-2, -3.736582, -6.377387, 0, 1.5, 0.5, 0.5,
-1, -3.736582, -6.377387, 0, -0.5, 0.5, 0.5,
-1, -3.736582, -6.377387, 1, -0.5, 0.5, 0.5,
-1, -3.736582, -6.377387, 1, 1.5, 0.5, 0.5,
-1, -3.736582, -6.377387, 0, 1.5, 0.5, 0.5,
0, -3.736582, -6.377387, 0, -0.5, 0.5, 0.5,
0, -3.736582, -6.377387, 1, -0.5, 0.5, 0.5,
0, -3.736582, -6.377387, 1, 1.5, 0.5, 0.5,
0, -3.736582, -6.377387, 0, 1.5, 0.5, 0.5,
1, -3.736582, -6.377387, 0, -0.5, 0.5, 0.5,
1, -3.736582, -6.377387, 1, -0.5, 0.5, 0.5,
1, -3.736582, -6.377387, 1, 1.5, 0.5, 0.5,
1, -3.736582, -6.377387, 0, 1.5, 0.5, 0.5,
2, -3.736582, -6.377387, 0, -0.5, 0.5, 0.5,
2, -3.736582, -6.377387, 1, -0.5, 0.5, 0.5,
2, -3.736582, -6.377387, 1, 1.5, 0.5, 0.5,
2, -3.736582, -6.377387, 0, 1.5, 0.5, 0.5,
3, -3.736582, -6.377387, 0, -0.5, 0.5, 0.5,
3, -3.736582, -6.377387, 1, -0.5, 0.5, 0.5,
3, -3.736582, -6.377387, 1, 1.5, 0.5, 0.5,
3, -3.736582, -6.377387, 0, 1.5, 0.5, 0.5
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
-3.12491, -3, -5.526531,
-3.12491, 3, -5.526531,
-3.12491, -3, -5.526531,
-3.283595, -3, -5.81015,
-3.12491, -2, -5.526531,
-3.283595, -2, -5.81015,
-3.12491, -1, -5.526531,
-3.283595, -1, -5.81015,
-3.12491, 0, -5.526531,
-3.283595, 0, -5.81015,
-3.12491, 1, -5.526531,
-3.283595, 1, -5.81015,
-3.12491, 2, -5.526531,
-3.283595, 2, -5.81015,
-3.12491, 3, -5.526531,
-3.283595, 3, -5.81015
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
-3.600966, -3, -6.377387, 0, -0.5, 0.5, 0.5,
-3.600966, -3, -6.377387, 1, -0.5, 0.5, 0.5,
-3.600966, -3, -6.377387, 1, 1.5, 0.5, 0.5,
-3.600966, -3, -6.377387, 0, 1.5, 0.5, 0.5,
-3.600966, -2, -6.377387, 0, -0.5, 0.5, 0.5,
-3.600966, -2, -6.377387, 1, -0.5, 0.5, 0.5,
-3.600966, -2, -6.377387, 1, 1.5, 0.5, 0.5,
-3.600966, -2, -6.377387, 0, 1.5, 0.5, 0.5,
-3.600966, -1, -6.377387, 0, -0.5, 0.5, 0.5,
-3.600966, -1, -6.377387, 1, -0.5, 0.5, 0.5,
-3.600966, -1, -6.377387, 1, 1.5, 0.5, 0.5,
-3.600966, -1, -6.377387, 0, 1.5, 0.5, 0.5,
-3.600966, 0, -6.377387, 0, -0.5, 0.5, 0.5,
-3.600966, 0, -6.377387, 1, -0.5, 0.5, 0.5,
-3.600966, 0, -6.377387, 1, 1.5, 0.5, 0.5,
-3.600966, 0, -6.377387, 0, 1.5, 0.5, 0.5,
-3.600966, 1, -6.377387, 0, -0.5, 0.5, 0.5,
-3.600966, 1, -6.377387, 1, -0.5, 0.5, 0.5,
-3.600966, 1, -6.377387, 1, 1.5, 0.5, 0.5,
-3.600966, 1, -6.377387, 0, 1.5, 0.5, 0.5,
-3.600966, 2, -6.377387, 0, -0.5, 0.5, 0.5,
-3.600966, 2, -6.377387, 1, -0.5, 0.5, 0.5,
-3.600966, 2, -6.377387, 1, 1.5, 0.5, 0.5,
-3.600966, 2, -6.377387, 0, 1.5, 0.5, 0.5,
-3.600966, 3, -6.377387, 0, -0.5, 0.5, 0.5,
-3.600966, 3, -6.377387, 1, -0.5, 0.5, 0.5,
-3.600966, 3, -6.377387, 1, 1.5, 0.5, 0.5,
-3.600966, 3, -6.377387, 0, 1.5, 0.5, 0.5
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
-3.12491, -3.253178, -4,
-3.12491, -3.253178, 4,
-3.12491, -3.253178, -4,
-3.283595, -3.414313, -4,
-3.12491, -3.253178, -2,
-3.283595, -3.414313, -2,
-3.12491, -3.253178, 0,
-3.283595, -3.414313, 0,
-3.12491, -3.253178, 2,
-3.283595, -3.414313, 2,
-3.12491, -3.253178, 4,
-3.283595, -3.414313, 4
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
-3.600966, -3.736582, -4, 0, -0.5, 0.5, 0.5,
-3.600966, -3.736582, -4, 1, -0.5, 0.5, 0.5,
-3.600966, -3.736582, -4, 1, 1.5, 0.5, 0.5,
-3.600966, -3.736582, -4, 0, 1.5, 0.5, 0.5,
-3.600966, -3.736582, -2, 0, -0.5, 0.5, 0.5,
-3.600966, -3.736582, -2, 1, -0.5, 0.5, 0.5,
-3.600966, -3.736582, -2, 1, 1.5, 0.5, 0.5,
-3.600966, -3.736582, -2, 0, 1.5, 0.5, 0.5,
-3.600966, -3.736582, 0, 0, -0.5, 0.5, 0.5,
-3.600966, -3.736582, 0, 1, -0.5, 0.5, 0.5,
-3.600966, -3.736582, 0, 1, 1.5, 0.5, 0.5,
-3.600966, -3.736582, 0, 0, 1.5, 0.5, 0.5,
-3.600966, -3.736582, 2, 0, -0.5, 0.5, 0.5,
-3.600966, -3.736582, 2, 1, -0.5, 0.5, 0.5,
-3.600966, -3.736582, 2, 1, 1.5, 0.5, 0.5,
-3.600966, -3.736582, 2, 0, 1.5, 0.5, 0.5,
-3.600966, -3.736582, 4, 0, -0.5, 0.5, 0.5,
-3.600966, -3.736582, 4, 1, -0.5, 0.5, 0.5,
-3.600966, -3.736582, 4, 1, 1.5, 0.5, 0.5,
-3.600966, -3.736582, 4, 0, 1.5, 0.5, 0.5
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
-3.12491, -3.253178, -5.526531,
-3.12491, 3.19221, -5.526531,
-3.12491, -3.253178, 5.818216,
-3.12491, 3.19221, 5.818216,
-3.12491, -3.253178, -5.526531,
-3.12491, -3.253178, 5.818216,
-3.12491, 3.19221, -5.526531,
-3.12491, 3.19221, 5.818216,
-3.12491, -3.253178, -5.526531,
3.222514, -3.253178, -5.526531,
-3.12491, -3.253178, 5.818216,
3.222514, -3.253178, 5.818216,
-3.12491, 3.19221, -5.526531,
3.222514, 3.19221, -5.526531,
-3.12491, 3.19221, 5.818216,
3.222514, 3.19221, 5.818216,
3.222514, -3.253178, -5.526531,
3.222514, 3.19221, -5.526531,
3.222514, -3.253178, 5.818216,
3.222514, 3.19221, 5.818216,
3.222514, -3.253178, -5.526531,
3.222514, -3.253178, 5.818216,
3.222514, 3.19221, -5.526531,
3.222514, 3.19221, 5.818216
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
var radius = 7.747985;
var distance = 34.47166;
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
mvMatrix.translate( -0.04880202, 0.03048384, -0.1458426 );
mvMatrix.scale( 1.319791, 1.299731, 0.7384275 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.47166);
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
DDD<-read.table("DDD.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DDD$V2
```

```
## Error in eval(expr, envir, enclos): object 'DDD' not found
```

```r
y<-DDD$V3
```

```
## Error in eval(expr, envir, enclos): object 'DDD' not found
```

```r
z<-DDD$V4
```

```
## Error in eval(expr, envir, enclos): object 'DDD' not found
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
-3.032471, -0.4503158, -1.99046, 0, 0, 1, 1, 1,
-2.729609, 0.3059235, -1.478294, 1, 0, 0, 1, 1,
-2.723113, -0.5698876, -1.546157, 1, 0, 0, 1, 1,
-2.595872, 0.5439935, -0.7548484, 1, 0, 0, 1, 1,
-2.587544, 2.366412, -1.606871, 1, 0, 0, 1, 1,
-2.497084, 0.08208919, -0.7680284, 1, 0, 0, 1, 1,
-2.430866, 1.321351, 1.157469, 0, 0, 0, 1, 1,
-2.414541, 0.1692064, -1.169987, 0, 0, 0, 1, 1,
-2.357888, 1.24053, -0.1378163, 0, 0, 0, 1, 1,
-2.355544, 1.179015, -1.217082, 0, 0, 0, 1, 1,
-2.345166, 2.229075, -0.2831045, 0, 0, 0, 1, 1,
-2.264658, -0.6845431, -0.7016128, 0, 0, 0, 1, 1,
-2.258417, 0.9648099, -2.382751, 0, 0, 0, 1, 1,
-2.253479, -1.701216, -1.125923, 1, 1, 1, 1, 1,
-2.224181, -0.4718732, -0.5469633, 1, 1, 1, 1, 1,
-2.157317, 1.404204, -0.5422624, 1, 1, 1, 1, 1,
-2.129577, -0.4007396, -1.123155, 1, 1, 1, 1, 1,
-2.122906, -0.2026366, -1.900211, 1, 1, 1, 1, 1,
-2.110179, -0.5758794, -1.854421, 1, 1, 1, 1, 1,
-2.104677, -0.08419239, -1.592534, 1, 1, 1, 1, 1,
-2.104389, -0.3157989, -1.993014, 1, 1, 1, 1, 1,
-2.055703, 0.537519, -1.845385, 1, 1, 1, 1, 1,
-1.972058, 0.3184036, -1.642991, 1, 1, 1, 1, 1,
-1.967422, -0.1980267, -1.534347, 1, 1, 1, 1, 1,
-1.966617, 0.001208878, -2.616731, 1, 1, 1, 1, 1,
-1.964187, -1.574127, -2.399609, 1, 1, 1, 1, 1,
-1.941063, -1.149915, -3.147397, 1, 1, 1, 1, 1,
-1.915303, -0.4920522, 0.2801164, 1, 1, 1, 1, 1,
-1.912633, -1.022366, -1.901196, 0, 0, 1, 1, 1,
-1.855578, -1.984897, -2.654707, 1, 0, 0, 1, 1,
-1.840271, -0.6253544, -3.803198, 1, 0, 0, 1, 1,
-1.838195, -1.299811, -1.089148, 1, 0, 0, 1, 1,
-1.83284, 1.018789, -2.996552, 1, 0, 0, 1, 1,
-1.829707, -1.050606, -2.933475, 1, 0, 0, 1, 1,
-1.81299, -1.10925, -3.116752, 0, 0, 0, 1, 1,
-1.799967, 1.946784, -1.123364, 0, 0, 0, 1, 1,
-1.799058, 0.1136213, 0.08516726, 0, 0, 0, 1, 1,
-1.768548, -0.3179468, -2.579428, 0, 0, 0, 1, 1,
-1.766402, 0.2658632, -1.465936, 0, 0, 0, 1, 1,
-1.733079, -0.4479266, -2.944105, 0, 0, 0, 1, 1,
-1.726408, -0.01052574, -1.04976, 0, 0, 0, 1, 1,
-1.702072, -2.215205, -3.407886, 1, 1, 1, 1, 1,
-1.698784, -0.6760953, -0.5757303, 1, 1, 1, 1, 1,
-1.692467, -0.1733689, -2.404713, 1, 1, 1, 1, 1,
-1.691548, -0.5165213, -2.123724, 1, 1, 1, 1, 1,
-1.688693, 0.7826625, -2.984325, 1, 1, 1, 1, 1,
-1.683831, -0.5084992, -0.7294441, 1, 1, 1, 1, 1,
-1.680045, 0.3650638, -2.362171, 1, 1, 1, 1, 1,
-1.659444, -1.181529, -2.986953, 1, 1, 1, 1, 1,
-1.65648, -1.166356, -2.418471, 1, 1, 1, 1, 1,
-1.651414, -1.111522, -3.805646, 1, 1, 1, 1, 1,
-1.635615, -0.5440597, -1.218773, 1, 1, 1, 1, 1,
-1.627813, 1.06558, -0.404695, 1, 1, 1, 1, 1,
-1.624519, -0.9810191, -2.838443, 1, 1, 1, 1, 1,
-1.624014, -0.05691889, -2.151187, 1, 1, 1, 1, 1,
-1.595342, 1.108814, -1.559731, 1, 1, 1, 1, 1,
-1.592982, 0.286432, -3.52325, 0, 0, 1, 1, 1,
-1.589271, 0.5613184, -0.5435715, 1, 0, 0, 1, 1,
-1.58648, -0.0540072, -1.136223, 1, 0, 0, 1, 1,
-1.584907, 0.1772457, 0.1042928, 1, 0, 0, 1, 1,
-1.579631, 0.9159099, -0.6824871, 1, 0, 0, 1, 1,
-1.522357, -1.644076, -2.094032, 1, 0, 0, 1, 1,
-1.503603, 1.901178, -2.027235, 0, 0, 0, 1, 1,
-1.481715, -0.4248955, -2.542815, 0, 0, 0, 1, 1,
-1.479503, 0.02061325, -2.383099, 0, 0, 0, 1, 1,
-1.473249, 1.911342, 0.845759, 0, 0, 0, 1, 1,
-1.468341, 0.4275317, -2.714065, 0, 0, 0, 1, 1,
-1.46444, -0.1501552, -2.089783, 0, 0, 0, 1, 1,
-1.455612, 0.3447334, -1.823473, 0, 0, 0, 1, 1,
-1.446548, 1.341904, -0.9431543, 1, 1, 1, 1, 1,
-1.445369, 0.1813834, -1.813985, 1, 1, 1, 1, 1,
-1.442819, 1.589397, -0.6625732, 1, 1, 1, 1, 1,
-1.441925, -0.1365765, -2.167797, 1, 1, 1, 1, 1,
-1.440495, 0.4343771, -1.456518, 1, 1, 1, 1, 1,
-1.436177, 1.787602, -0.8023041, 1, 1, 1, 1, 1,
-1.435035, -0.4570092, -1.413997, 1, 1, 1, 1, 1,
-1.418791, 1.206451, -1.870818, 1, 1, 1, 1, 1,
-1.414306, -0.2472917, -2.451026, 1, 1, 1, 1, 1,
-1.407524, 0.9721453, 0.2590344, 1, 1, 1, 1, 1,
-1.388014, -1.977716, -3.704732, 1, 1, 1, 1, 1,
-1.386477, -0.7587316, -3.35734, 1, 1, 1, 1, 1,
-1.379626, -1.623383, -2.557101, 1, 1, 1, 1, 1,
-1.378371, -1.446068, -3.680486, 1, 1, 1, 1, 1,
-1.375811, -1.472464, -4.531041, 1, 1, 1, 1, 1,
-1.375771, -0.8413063, -1.678635, 0, 0, 1, 1, 1,
-1.371331, -0.8039648, -2.01582, 1, 0, 0, 1, 1,
-1.370025, -1.285162, -2.988333, 1, 0, 0, 1, 1,
-1.358171, -0.1718768, -1.383435, 1, 0, 0, 1, 1,
-1.345936, -1.730697, -2.677074, 1, 0, 0, 1, 1,
-1.336421, 1.615178, 0.7351124, 1, 0, 0, 1, 1,
-1.333784, -1.426593, -1.895058, 0, 0, 0, 1, 1,
-1.329116, 0.8356006, -0.01569611, 0, 0, 0, 1, 1,
-1.315882, -1.306746, -2.421605, 0, 0, 0, 1, 1,
-1.301571, 0.1615535, -0.6963515, 0, 0, 0, 1, 1,
-1.300034, 0.2751027, -0.2962244, 0, 0, 0, 1, 1,
-1.282991, 0.9534001, -2.216196, 0, 0, 0, 1, 1,
-1.282065, -0.766553, -0.1421556, 0, 0, 0, 1, 1,
-1.279795, -0.2629893, -0.5812188, 1, 1, 1, 1, 1,
-1.275178, -0.4302346, -1.697659, 1, 1, 1, 1, 1,
-1.2599, 0.4957692, -2.099724, 1, 1, 1, 1, 1,
-1.252831, 0.6262382, -1.614265, 1, 1, 1, 1, 1,
-1.251571, 0.3619283, -3.670311, 1, 1, 1, 1, 1,
-1.243766, -0.03220802, 0.2555434, 1, 1, 1, 1, 1,
-1.238683, -0.8053834, -1.487305, 1, 1, 1, 1, 1,
-1.2354, -1.729547, -2.779813, 1, 1, 1, 1, 1,
-1.234183, 0.8432043, -1.918611, 1, 1, 1, 1, 1,
-1.217447, 2.035155, -0.229572, 1, 1, 1, 1, 1,
-1.2174, 0.3584624, -1.14239, 1, 1, 1, 1, 1,
-1.204332, -1.039832, -1.609625, 1, 1, 1, 1, 1,
-1.197041, -0.4529615, 0.2648114, 1, 1, 1, 1, 1,
-1.191736, -0.4437603, -3.148959, 1, 1, 1, 1, 1,
-1.191542, 0.568132, -1.898884, 1, 1, 1, 1, 1,
-1.191349, -0.1893596, -2.077024, 0, 0, 1, 1, 1,
-1.189026, 0.4514028, -0.7543117, 1, 0, 0, 1, 1,
-1.183998, -0.2866547, -2.10291, 1, 0, 0, 1, 1,
-1.181422, 0.2908795, 0.8908529, 1, 0, 0, 1, 1,
-1.180988, 0.3139531, -3.223407, 1, 0, 0, 1, 1,
-1.164661, 0.3231913, -0.7601886, 1, 0, 0, 1, 1,
-1.163441, 0.5756128, -0.4957239, 0, 0, 0, 1, 1,
-1.163368, -0.8004901, -4.183875, 0, 0, 0, 1, 1,
-1.156729, 1.674417, -1.197567, 0, 0, 0, 1, 1,
-1.15178, -1.499931, -2.423258, 0, 0, 0, 1, 1,
-1.148455, 0.1435797, 0.3267183, 0, 0, 0, 1, 1,
-1.146355, 1.113662, -0.9852179, 0, 0, 0, 1, 1,
-1.144221, -0.1018638, -3.21578, 0, 0, 0, 1, 1,
-1.134273, -0.8774229, -3.509784, 1, 1, 1, 1, 1,
-1.131836, 0.1548806, -1.59929, 1, 1, 1, 1, 1,
-1.122216, -0.7140632, -0.8880304, 1, 1, 1, 1, 1,
-1.114485, -0.05040913, -0.426998, 1, 1, 1, 1, 1,
-1.112192, 0.4637069, -1.713439, 1, 1, 1, 1, 1,
-1.106295, -0.1605064, -2.818177, 1, 1, 1, 1, 1,
-1.095814, -0.5765254, -2.292427, 1, 1, 1, 1, 1,
-1.081911, -0.02414879, -0.5800569, 1, 1, 1, 1, 1,
-1.081869, -1.749596, -1.443761, 1, 1, 1, 1, 1,
-1.078964, -0.4790784, -1.246431, 1, 1, 1, 1, 1,
-1.059402, 0.2157129, -0.7146906, 1, 1, 1, 1, 1,
-1.053788, -0.8528621, -3.438234, 1, 1, 1, 1, 1,
-1.047628, 1.176589, -1.121781, 1, 1, 1, 1, 1,
-1.045002, -0.6433326, -2.091835, 1, 1, 1, 1, 1,
-1.04354, 0.8160576, -0.5922908, 1, 1, 1, 1, 1,
-1.039098, 0.2428927, -1.833012, 0, 0, 1, 1, 1,
-1.03035, 0.3009852, -1.203964, 1, 0, 0, 1, 1,
-1.024685, 0.5400942, -0.935271, 1, 0, 0, 1, 1,
-1.024227, 1.146881, -0.1072676, 1, 0, 0, 1, 1,
-1.02213, -1.053046, -1.219898, 1, 0, 0, 1, 1,
-1.016941, 0.8346896, -1.772684, 1, 0, 0, 1, 1,
-1.015898, -0.735616, -1.517479, 0, 0, 0, 1, 1,
-0.9961726, -0.7080606, -3.655268, 0, 0, 0, 1, 1,
-0.9930028, 0.631192, -1.110559, 0, 0, 0, 1, 1,
-0.9927848, -0.1211613, -0.6825945, 0, 0, 0, 1, 1,
-0.9898164, -1.039784, -3.959779, 0, 0, 0, 1, 1,
-0.9890868, -1.232487, -3.178138, 0, 0, 0, 1, 1,
-0.9810922, -0.3872852, -1.396645, 0, 0, 0, 1, 1,
-0.980184, -1.356036, -1.201771, 1, 1, 1, 1, 1,
-0.9787646, -0.3717391, -2.049645, 1, 1, 1, 1, 1,
-0.9769619, 0.7439033, -0.1779208, 1, 1, 1, 1, 1,
-0.9758784, 0.7592229, -1.029856, 1, 1, 1, 1, 1,
-0.9733732, 0.3622441, -1.65425, 1, 1, 1, 1, 1,
-0.9653246, 1.781302, 0.06581238, 1, 1, 1, 1, 1,
-0.9652675, 0.8204343, -0.4956592, 1, 1, 1, 1, 1,
-0.9643815, -0.8132556, -3.256523, 1, 1, 1, 1, 1,
-0.9627683, -0.3646618, -1.961871, 1, 1, 1, 1, 1,
-0.9612956, -0.1621807, -0.7088371, 1, 1, 1, 1, 1,
-0.961153, 2.045894, 0.2580492, 1, 1, 1, 1, 1,
-0.9584428, -2.107203, -2.325976, 1, 1, 1, 1, 1,
-0.9482701, 0.4237327, -2.259792, 1, 1, 1, 1, 1,
-0.9452198, 0.3852788, 0.2747263, 1, 1, 1, 1, 1,
-0.9397237, -1.577231, -2.001169, 1, 1, 1, 1, 1,
-0.9327478, -0.1181629, -1.600145, 0, 0, 1, 1, 1,
-0.9247622, -0.6066787, -1.219771, 1, 0, 0, 1, 1,
-0.9175027, 0.2483319, -1.844825, 1, 0, 0, 1, 1,
-0.9102063, 0.005600419, -0.574333, 1, 0, 0, 1, 1,
-0.9100791, 0.9432319, -1.705023, 1, 0, 0, 1, 1,
-0.9091549, 0.06148922, -2.07426, 1, 0, 0, 1, 1,
-0.903267, -0.8069077, -1.406095, 0, 0, 0, 1, 1,
-0.8819917, -1.087525, -2.452915, 0, 0, 0, 1, 1,
-0.8750379, -0.07865883, -1.86983, 0, 0, 0, 1, 1,
-0.8735518, 0.6482772, -1.752532, 0, 0, 0, 1, 1,
-0.8727465, -2.113178, -2.683395, 0, 0, 0, 1, 1,
-0.8671909, 0.4671198, -0.4942614, 0, 0, 0, 1, 1,
-0.8651448, 1.764913, -0.334293, 0, 0, 0, 1, 1,
-0.8569388, 1.085348, -2.717757, 1, 1, 1, 1, 1,
-0.8541474, 0.3746056, -1.718989, 1, 1, 1, 1, 1,
-0.8512517, 0.5056527, 1.336067, 1, 1, 1, 1, 1,
-0.8437834, -0.1908799, -1.90167, 1, 1, 1, 1, 1,
-0.8431729, 0.8381631, -2.162312, 1, 1, 1, 1, 1,
-0.8399934, 0.304421, -2.498692, 1, 1, 1, 1, 1,
-0.8397435, -1.558117, -3.308168, 1, 1, 1, 1, 1,
-0.8393064, -1.059145, -3.699054, 1, 1, 1, 1, 1,
-0.8388001, 0.3770354, -1.752804, 1, 1, 1, 1, 1,
-0.8386382, -0.4617802, -2.57061, 1, 1, 1, 1, 1,
-0.8364197, 1.918245, -0.716476, 1, 1, 1, 1, 1,
-0.8289775, 0.7754631, -0.8480902, 1, 1, 1, 1, 1,
-0.8282921, -0.4455699, -2.915228, 1, 1, 1, 1, 1,
-0.828261, -1.083302, -0.8956227, 1, 1, 1, 1, 1,
-0.8264624, 0.3905989, -0.5397167, 1, 1, 1, 1, 1,
-0.8210173, 0.8704756, 1.196654, 0, 0, 1, 1, 1,
-0.8174747, 0.3295487, -0.7572947, 1, 0, 0, 1, 1,
-0.8172599, 1.174452, -2.619479, 1, 0, 0, 1, 1,
-0.8168765, -0.1952196, -1.921183, 1, 0, 0, 1, 1,
-0.8160775, 0.9285311, -1.340078, 1, 0, 0, 1, 1,
-0.810954, 0.1212384, -1.941119, 1, 0, 0, 1, 1,
-0.8090128, 0.2211432, 1.103235, 0, 0, 0, 1, 1,
-0.8090004, 0.649202, -2.2238, 0, 0, 0, 1, 1,
-0.8089817, 0.1306392, -1.867386, 0, 0, 0, 1, 1,
-0.8081197, 0.1049318, -3.276591, 0, 0, 0, 1, 1,
-0.8074852, 2.04793, -0.8874171, 0, 0, 0, 1, 1,
-0.8019215, -0.4403721, -3.119488, 0, 0, 0, 1, 1,
-0.7990456, -0.3793757, -2.794038, 0, 0, 0, 1, 1,
-0.793359, 0.2742006, -2.950986, 1, 1, 1, 1, 1,
-0.7926043, 0.5826722, -2.87125, 1, 1, 1, 1, 1,
-0.7903978, 1.935504, 3.191904, 1, 1, 1, 1, 1,
-0.7896212, 0.1549904, -2.016928, 1, 1, 1, 1, 1,
-0.7807361, 0.3249045, -2.624292, 1, 1, 1, 1, 1,
-0.7748833, 0.3745343, -1.191411, 1, 1, 1, 1, 1,
-0.7743618, -0.6410177, -1.08076, 1, 1, 1, 1, 1,
-0.7725605, 0.2281193, -0.3763838, 1, 1, 1, 1, 1,
-0.7654973, -0.1160521, -1.704654, 1, 1, 1, 1, 1,
-0.7585144, -1.939226, -1.495319, 1, 1, 1, 1, 1,
-0.7470078, -0.7733877, -0.008335925, 1, 1, 1, 1, 1,
-0.742457, 0.01767923, -3.291389, 1, 1, 1, 1, 1,
-0.7398521, -0.3164824, -2.486996, 1, 1, 1, 1, 1,
-0.7312667, 0.6553246, -0.8046698, 1, 1, 1, 1, 1,
-0.7271896, 0.2448156, 1.361986, 1, 1, 1, 1, 1,
-0.7252409, 1.141435, -0.58943, 0, 0, 1, 1, 1,
-0.7212911, 0.1454456, -2.260739, 1, 0, 0, 1, 1,
-0.7175712, -2.047498, -4.117187, 1, 0, 0, 1, 1,
-0.7169667, -1.247087, -3.495634, 1, 0, 0, 1, 1,
-0.7154236, 0.5332559, -0.8411086, 1, 0, 0, 1, 1,
-0.7154209, 1.111501, 0.2002385, 1, 0, 0, 1, 1,
-0.7093356, -0.9029695, -2.47462, 0, 0, 0, 1, 1,
-0.7091657, 0.7657078, -1.660372, 0, 0, 0, 1, 1,
-0.7075772, -2.27207, -2.131218, 0, 0, 0, 1, 1,
-0.7075634, -2.281702, -2.574511, 0, 0, 0, 1, 1,
-0.70314, 1.204573, -0.6103613, 0, 0, 0, 1, 1,
-0.6992115, -1.142056, -3.452259, 0, 0, 0, 1, 1,
-0.6991823, 0.2608219, -1.847362, 0, 0, 0, 1, 1,
-0.6978582, -0.2230207, -2.211535, 1, 1, 1, 1, 1,
-0.6874428, -1.22132, -1.970197, 1, 1, 1, 1, 1,
-0.6846403, -0.5806841, -2.431897, 1, 1, 1, 1, 1,
-0.671762, 0.236507, -0.6193619, 1, 1, 1, 1, 1,
-0.6633205, 0.1221677, -1.181185, 1, 1, 1, 1, 1,
-0.6582394, 0.75696, -0.2309484, 1, 1, 1, 1, 1,
-0.6568201, 0.2961234, -1.456711, 1, 1, 1, 1, 1,
-0.6529151, 0.9157335, -0.3194334, 1, 1, 1, 1, 1,
-0.6462573, -0.1746683, -2.779373, 1, 1, 1, 1, 1,
-0.6416463, 0.1287819, -1.872385, 1, 1, 1, 1, 1,
-0.6404366, -0.9803305, -0.2891077, 1, 1, 1, 1, 1,
-0.6390296, -0.2105869, 0.2154323, 1, 1, 1, 1, 1,
-0.6352455, -0.6327391, -1.819066, 1, 1, 1, 1, 1,
-0.6335703, 0.891839, -0.1614865, 1, 1, 1, 1, 1,
-0.6265093, 0.3349505, -0.8209578, 1, 1, 1, 1, 1,
-0.6259286, 0.1269781, -0.3475337, 0, 0, 1, 1, 1,
-0.6240711, 0.5573816, -3.431182, 1, 0, 0, 1, 1,
-0.6237668, 0.2103435, -2.284913, 1, 0, 0, 1, 1,
-0.6236526, -0.2298034, -0.4267495, 1, 0, 0, 1, 1,
-0.6235666, -0.6255253, -2.138345, 1, 0, 0, 1, 1,
-0.6229819, 1.409727, -0.3790897, 1, 0, 0, 1, 1,
-0.6128739, -1.231226, -4.607985, 0, 0, 0, 1, 1,
-0.6080644, 1.004479, 0.358489, 0, 0, 0, 1, 1,
-0.6056882, -1.018411, -1.680024, 0, 0, 0, 1, 1,
-0.6040474, -0.3572494, -0.3350301, 0, 0, 0, 1, 1,
-0.5975631, 0.5426516, -3.049452, 0, 0, 0, 1, 1,
-0.5969849, -0.2824837, -1.903802, 0, 0, 0, 1, 1,
-0.5937759, -0.5488902, -1.457687, 0, 0, 0, 1, 1,
-0.5899829, 1.820037, -1.349314, 1, 1, 1, 1, 1,
-0.5897347, -2.14277, -2.797875, 1, 1, 1, 1, 1,
-0.5826616, 1.443691, -0.4419611, 1, 1, 1, 1, 1,
-0.580796, -0.4011686, -1.866208, 1, 1, 1, 1, 1,
-0.5793278, 0.627775, -2.555339, 1, 1, 1, 1, 1,
-0.5767686, 1.411239, -2.617769, 1, 1, 1, 1, 1,
-0.5755487, 0.9831282, 0.7918278, 1, 1, 1, 1, 1,
-0.5751033, -1.932225, -5.227089, 1, 1, 1, 1, 1,
-0.5740175, -0.09674617, -1.239472, 1, 1, 1, 1, 1,
-0.573363, -0.9067714, -2.368892, 1, 1, 1, 1, 1,
-0.5615295, -1.550044, -2.002003, 1, 1, 1, 1, 1,
-0.5596519, -0.04161475, -1.736491, 1, 1, 1, 1, 1,
-0.5575192, 0.2608125, -1.49193, 1, 1, 1, 1, 1,
-0.5567126, 0.6177846, 1.197664, 1, 1, 1, 1, 1,
-0.5435097, 0.1770703, -1.868249, 1, 1, 1, 1, 1,
-0.5412245, 0.8078589, -1.185708, 0, 0, 1, 1, 1,
-0.5403479, -0.4140169, -1.669109, 1, 0, 0, 1, 1,
-0.5369991, 0.5721446, 1.366949, 1, 0, 0, 1, 1,
-0.5348293, -1.642781, -4.554136, 1, 0, 0, 1, 1,
-0.5341146, 0.8856794, -0.5928585, 1, 0, 0, 1, 1,
-0.5324394, -0.04964869, -0.8799793, 1, 0, 0, 1, 1,
-0.532364, -0.207059, -1.638025, 0, 0, 0, 1, 1,
-0.5289593, -0.8712792, -3.052536, 0, 0, 0, 1, 1,
-0.5286865, 1.324674, 0.7509509, 0, 0, 0, 1, 1,
-0.5219094, -0.6344535, -0.8848485, 0, 0, 0, 1, 1,
-0.5187748, 0.09364329, -0.4131472, 0, 0, 0, 1, 1,
-0.5168264, -0.3435596, -2.712106, 0, 0, 0, 1, 1,
-0.5157546, -0.4163466, -2.672955, 0, 0, 0, 1, 1,
-0.5139613, 0.9458816, 0.3571055, 1, 1, 1, 1, 1,
-0.5138723, -0.03683843, -0.354455, 1, 1, 1, 1, 1,
-0.5089763, -1.501034, -1.416028, 1, 1, 1, 1, 1,
-0.5089648, -0.7161685, -1.998664, 1, 1, 1, 1, 1,
-0.5011618, 0.4711632, -0.1766312, 1, 1, 1, 1, 1,
-0.4961314, 0.9894868, 0.7125325, 1, 1, 1, 1, 1,
-0.4949651, 0.570973, -2.086189, 1, 1, 1, 1, 1,
-0.4922692, 0.2914466, -1.914651, 1, 1, 1, 1, 1,
-0.488478, -1.51929, -3.283438, 1, 1, 1, 1, 1,
-0.4870661, -1.171534, -0.8229659, 1, 1, 1, 1, 1,
-0.48463, -1.308061, -3.520095, 1, 1, 1, 1, 1,
-0.4793967, -1.410076, -2.19114, 1, 1, 1, 1, 1,
-0.477984, -0.2241352, -1.058032, 1, 1, 1, 1, 1,
-0.4771953, 0.7680249, -1.703483, 1, 1, 1, 1, 1,
-0.475659, 1.162695, 0.9784043, 1, 1, 1, 1, 1,
-0.4705177, 0.5505285, -2.228604, 0, 0, 1, 1, 1,
-0.4693605, -0.2904735, -2.999754, 1, 0, 0, 1, 1,
-0.4630474, 0.7505019, -0.5718372, 1, 0, 0, 1, 1,
-0.4606408, -0.3999737, -1.76803, 1, 0, 0, 1, 1,
-0.4537677, -0.1418252, -0.8568571, 1, 0, 0, 1, 1,
-0.4532457, 1.686118, 0.2343426, 1, 0, 0, 1, 1,
-0.4459557, 0.6718336, -0.4074889, 0, 0, 0, 1, 1,
-0.4448298, 0.3843003, -0.7045281, 0, 0, 0, 1, 1,
-0.4433337, 1.316518, -1.764511, 0, 0, 0, 1, 1,
-0.4419572, -0.3439989, -2.958646, 0, 0, 0, 1, 1,
-0.4379093, 1.042649, -1.185185, 0, 0, 0, 1, 1,
-0.4378176, 2.797618, -0.2521282, 0, 0, 0, 1, 1,
-0.4333864, 0.2968165, -0.6967044, 0, 0, 0, 1, 1,
-0.4322182, 0.2404368, -1.786165, 1, 1, 1, 1, 1,
-0.4285181, -0.6919984, -1.725655, 1, 1, 1, 1, 1,
-0.4264733, -1.35843, -2.715664, 1, 1, 1, 1, 1,
-0.4241111, 1.07094, -1.894945, 1, 1, 1, 1, 1,
-0.4222129, 0.7963079, -0.8340734, 1, 1, 1, 1, 1,
-0.4195342, 0.5394391, 0.5101062, 1, 1, 1, 1, 1,
-0.4194161, -1.034273, -3.579551, 1, 1, 1, 1, 1,
-0.4171146, 1.196343, -0.7169849, 1, 1, 1, 1, 1,
-0.412813, -2.507875, -1.81107, 1, 1, 1, 1, 1,
-0.4115471, -0.8322855, -2.292998, 1, 1, 1, 1, 1,
-0.4106422, 0.2091797, -0.4579067, 1, 1, 1, 1, 1,
-0.4101373, -0.3860333, -2.470453, 1, 1, 1, 1, 1,
-0.4049872, -0.7178224, -2.526195, 1, 1, 1, 1, 1,
-0.4001192, -0.03574786, -0.7813317, 1, 1, 1, 1, 1,
-0.3966355, 0.6727525, -1.610754, 1, 1, 1, 1, 1,
-0.3876435, -1.088111, -3.943906, 0, 0, 1, 1, 1,
-0.3874326, 0.1860773, 0.1384375, 1, 0, 0, 1, 1,
-0.3869331, 0.8777537, -1.160115, 1, 0, 0, 1, 1,
-0.386007, 1.126889, 0.8393746, 1, 0, 0, 1, 1,
-0.3798749, 1.028617, 0.2033306, 1, 0, 0, 1, 1,
-0.3682795, -0.1268368, -2.104054, 1, 0, 0, 1, 1,
-0.3655123, -1.320338, -1.650094, 0, 0, 0, 1, 1,
-0.3624492, 0.1123639, -0.287318, 0, 0, 0, 1, 1,
-0.358036, -0.0971368, -2.104451, 0, 0, 0, 1, 1,
-0.3523847, 0.8138875, -0.3219588, 0, 0, 0, 1, 1,
-0.3507307, 0.3260716, 0.1562787, 0, 0, 0, 1, 1,
-0.3386906, 1.189898, -0.6637736, 0, 0, 0, 1, 1,
-0.3380185, 1.033016, -0.2046347, 0, 0, 0, 1, 1,
-0.3368863, -1.366881, -3.547137, 1, 1, 1, 1, 1,
-0.3359421, 1.577897, 1.267931, 1, 1, 1, 1, 1,
-0.3358881, -1.101089, -2.73095, 1, 1, 1, 1, 1,
-0.333604, 0.5814097, -0.7536427, 1, 1, 1, 1, 1,
-0.3325747, 1.039654, -2.319423, 1, 1, 1, 1, 1,
-0.3311906, -0.9325449, -3.100499, 1, 1, 1, 1, 1,
-0.3269264, -0.007686113, -2.082253, 1, 1, 1, 1, 1,
-0.3267862, -1.811015, -3.413231, 1, 1, 1, 1, 1,
-0.326717, -0.532185, -3.533566, 1, 1, 1, 1, 1,
-0.3261831, -0.1542797, -0.8111698, 1, 1, 1, 1, 1,
-0.325809, -1.580432, -3.831107, 1, 1, 1, 1, 1,
-0.3247042, -0.3945571, -2.767368, 1, 1, 1, 1, 1,
-0.3228822, -0.01812729, 0.3142929, 1, 1, 1, 1, 1,
-0.3185708, -0.8297018, -1.967916, 1, 1, 1, 1, 1,
-0.3145258, 0.6503403, -0.5290881, 1, 1, 1, 1, 1,
-0.3123309, 0.430441, 0.03214722, 0, 0, 1, 1, 1,
-0.3123246, -0.4493923, -3.213017, 1, 0, 0, 1, 1,
-0.3099259, -0.1638208, -2.428891, 1, 0, 0, 1, 1,
-0.3041449, -0.07219483, -2.162861, 1, 0, 0, 1, 1,
-0.2998872, -0.5598189, -3.087914, 1, 0, 0, 1, 1,
-0.2988472, -0.6740078, -5.058389, 1, 0, 0, 1, 1,
-0.2984365, -0.6252474, -3.633651, 0, 0, 0, 1, 1,
-0.2963997, 0.952789, 0.5526301, 0, 0, 0, 1, 1,
-0.295485, 0.9500619, 0.09574705, 0, 0, 0, 1, 1,
-0.2954095, 1.296361, 0.3441538, 0, 0, 0, 1, 1,
-0.2938348, 1.302052, 0.4378569, 0, 0, 0, 1, 1,
-0.289811, -0.9248652, -3.458588, 0, 0, 0, 1, 1,
-0.2887878, -1.287222, -2.55778, 0, 0, 0, 1, 1,
-0.287102, 1.308724, 0.3032498, 1, 1, 1, 1, 1,
-0.2861924, -0.1354846, -2.240383, 1, 1, 1, 1, 1,
-0.2839051, -1.606224, -2.921524, 1, 1, 1, 1, 1,
-0.2778595, -0.190672, -2.530476, 1, 1, 1, 1, 1,
-0.2762342, -0.9013972, -3.097835, 1, 1, 1, 1, 1,
-0.2745111, -0.6927592, -4.512216, 1, 1, 1, 1, 1,
-0.2719187, 0.1605149, -0.08134826, 1, 1, 1, 1, 1,
-0.270321, -0.7790995, -2.248957, 1, 1, 1, 1, 1,
-0.2675848, -0.9497783, -4.096764, 1, 1, 1, 1, 1,
-0.2673101, -0.2860117, -2.003599, 1, 1, 1, 1, 1,
-0.2664141, -1.186519, -2.865113, 1, 1, 1, 1, 1,
-0.265888, -0.2024991, -1.516863, 1, 1, 1, 1, 1,
-0.2656235, -0.7966342, -5.037132, 1, 1, 1, 1, 1,
-0.2609856, -0.211568, -1.53694, 1, 1, 1, 1, 1,
-0.2599852, -0.9904621, -1.416784, 1, 1, 1, 1, 1,
-0.2503467, -0.510444, -4.82964, 0, 0, 1, 1, 1,
-0.2427947, -0.1799913, -1.119237, 1, 0, 0, 1, 1,
-0.2417542, -0.4524592, -2.256996, 1, 0, 0, 1, 1,
-0.2414237, -1.324431, -3.417425, 1, 0, 0, 1, 1,
-0.2349304, 0.06575817, -0.4936686, 1, 0, 0, 1, 1,
-0.2318628, -0.73675, -1.543065, 1, 0, 0, 1, 1,
-0.2317094, 0.3625352, -0.8223218, 0, 0, 0, 1, 1,
-0.2316694, -1.286069, -3.56775, 0, 0, 0, 1, 1,
-0.2257375, -1.201124, -1.538545, 0, 0, 0, 1, 1,
-0.2254984, -0.2355022, -0.3708716, 0, 0, 0, 1, 1,
-0.214576, 1.423515, 0.3912403, 0, 0, 0, 1, 1,
-0.2133028, -0.1599019, -1.146633, 0, 0, 0, 1, 1,
-0.2131223, 0.006498319, -2.143536, 0, 0, 0, 1, 1,
-0.2099888, -0.4123449, -4.12392, 1, 1, 1, 1, 1,
-0.2081308, -0.3478678, -2.957678, 1, 1, 1, 1, 1,
-0.2079058, 1.417738, -2.605268, 1, 1, 1, 1, 1,
-0.2074958, -0.4172817, -3.57967, 1, 1, 1, 1, 1,
-0.2021209, 0.4479649, -0.5145664, 1, 1, 1, 1, 1,
-0.1982302, 1.954126, 0.9720845, 1, 1, 1, 1, 1,
-0.1950561, -1.661398, -3.52882, 1, 1, 1, 1, 1,
-0.1941722, 0.7069982, 0.6457533, 1, 1, 1, 1, 1,
-0.1904514, -0.6028646, -1.366627, 1, 1, 1, 1, 1,
-0.1893154, 0.8133834, 2.408113, 1, 1, 1, 1, 1,
-0.1874843, 2.035351, -0.9212735, 1, 1, 1, 1, 1,
-0.1853692, -0.2695473, -4.132808, 1, 1, 1, 1, 1,
-0.1839417, 0.8860049, -0.583176, 1, 1, 1, 1, 1,
-0.1819054, -0.5865834, -2.504764, 1, 1, 1, 1, 1,
-0.1760248, -0.2698215, -0.9421847, 1, 1, 1, 1, 1,
-0.17278, -0.8945467, -2.184638, 0, 0, 1, 1, 1,
-0.1725735, 0.5669188, 0.9819322, 1, 0, 0, 1, 1,
-0.171816, -1.288471, -3.65342, 1, 0, 0, 1, 1,
-0.1668544, 2.949037, -0.9512768, 1, 0, 0, 1, 1,
-0.1662223, 0.8264927, -1.462504, 1, 0, 0, 1, 1,
-0.1584369, 0.9583991, -2.576477, 1, 0, 0, 1, 1,
-0.1517539, 0.1395997, -0.5011026, 0, 0, 0, 1, 1,
-0.1507915, 1.652474, 1.747816, 0, 0, 0, 1, 1,
-0.1483731, -0.551351, -5.122698, 0, 0, 0, 1, 1,
-0.1461445, 0.537503, -1.019186, 0, 0, 0, 1, 1,
-0.1434561, -0.191314, -2.883139, 0, 0, 0, 1, 1,
-0.1401818, 0.353786, 0.01193032, 0, 0, 0, 1, 1,
-0.1393954, 0.0386877, -2.095362, 0, 0, 0, 1, 1,
-0.1357562, -0.6886678, -3.029967, 1, 1, 1, 1, 1,
-0.1316586, 0.7526183, -1.081704, 1, 1, 1, 1, 1,
-0.1311291, -0.2907557, -4.156423, 1, 1, 1, 1, 1,
-0.1280963, -1.525817, -3.30915, 1, 1, 1, 1, 1,
-0.1267319, 1.292981, 0.138719, 1, 1, 1, 1, 1,
-0.1257511, -0.7302484, -4.125907, 1, 1, 1, 1, 1,
-0.1231874, 1.506142, 1.82571, 1, 1, 1, 1, 1,
-0.1145156, -0.3871048, -2.579367, 1, 1, 1, 1, 1,
-0.1139512, 0.9230861, -0.9829167, 1, 1, 1, 1, 1,
-0.113788, -0.7330082, -3.521598, 1, 1, 1, 1, 1,
-0.112188, 0.05857657, -1.114379, 1, 1, 1, 1, 1,
-0.1116708, -0.9437096, -2.064655, 1, 1, 1, 1, 1,
-0.1046243, -3.115764, -3.583368, 1, 1, 1, 1, 1,
-0.1028543, 1.034156, 0.2554951, 1, 1, 1, 1, 1,
-0.1021066, -1.160994, -2.752357, 1, 1, 1, 1, 1,
-0.09858978, 1.221927, 0.02927168, 0, 0, 1, 1, 1,
-0.09745815, 0.3539109, -1.519071, 1, 0, 0, 1, 1,
-0.09155122, 1.380825, -0.9822723, 1, 0, 0, 1, 1,
-0.08922483, -0.07534174, -1.201794, 1, 0, 0, 1, 1,
-0.08912694, -0.06971789, -2.287457, 1, 0, 0, 1, 1,
-0.08530462, -0.8695915, -2.164311, 1, 0, 0, 1, 1,
-0.08463718, -0.9877169, -3.585591, 0, 0, 0, 1, 1,
-0.08007262, 0.8303981, -0.3006693, 0, 0, 0, 1, 1,
-0.06840985, 1.279284, -0.6630841, 0, 0, 0, 1, 1,
-0.06781817, 0.09271384, -1.085763, 0, 0, 0, 1, 1,
-0.06558985, -2.239452, -4.647666, 0, 0, 0, 1, 1,
-0.06264672, -1.413362, -3.689505, 0, 0, 0, 1, 1,
-0.05791621, -0.1545847, -1.347152, 0, 0, 0, 1, 1,
-0.05684268, -0.9767267, -3.516177, 1, 1, 1, 1, 1,
-0.05440109, -0.3969108, -4.569487, 1, 1, 1, 1, 1,
-0.04879981, -2.800612, -3.352628, 1, 1, 1, 1, 1,
-0.0469006, 1.268582, 1.162178, 1, 1, 1, 1, 1,
-0.0440101, -0.1800536, -2.117083, 1, 1, 1, 1, 1,
-0.0381178, 0.6237943, 1.173872, 1, 1, 1, 1, 1,
-0.03760462, -0.732862, -3.706992, 1, 1, 1, 1, 1,
-0.0369554, -1.066935, -2.379909, 1, 1, 1, 1, 1,
-0.0357535, -0.6822735, -3.321378, 1, 1, 1, 1, 1,
-0.02995752, 1.416672, -0.08940517, 1, 1, 1, 1, 1,
-0.02892115, 0.007068426, -2.622065, 1, 1, 1, 1, 1,
-0.02756377, -1.974509, -3.2534, 1, 1, 1, 1, 1,
-0.02750031, -0.5752567, -5.361316, 1, 1, 1, 1, 1,
-0.02093563, -0.4885918, -1.905531, 1, 1, 1, 1, 1,
-0.02070198, 1.183255, -0.6018536, 1, 1, 1, 1, 1,
-0.01947309, 1.971861, 0.1043194, 0, 0, 1, 1, 1,
-0.01023124, -1.067975, -3.266659, 1, 0, 0, 1, 1,
-0.006656564, -1.4824, -2.994042, 1, 0, 0, 1, 1,
-0.003844892, -0.008352001, -1.172199, 1, 0, 0, 1, 1,
-0.003540168, -1.111549, -4.129264, 1, 0, 0, 1, 1,
0.001023445, -2.664937, 1.116711, 1, 0, 0, 1, 1,
0.003211847, -0.6701871, 2.795732, 0, 0, 0, 1, 1,
0.006278255, 0.1297177, -0.2888856, 0, 0, 0, 1, 1,
0.006363833, 1.321169, 0.02512013, 0, 0, 0, 1, 1,
0.009916814, 0.4230232, 0.1333573, 0, 0, 0, 1, 1,
0.01075934, -1.370434, 3.130934, 0, 0, 0, 1, 1,
0.01480105, 1.14697, 1.09263, 0, 0, 0, 1, 1,
0.01733165, -1.471186, 5.280359, 0, 0, 0, 1, 1,
0.0199125, 0.8542151, -1.351697, 1, 1, 1, 1, 1,
0.02860139, 1.359485, -0.4004974, 1, 1, 1, 1, 1,
0.0306447, 1.019544, 0.26911, 1, 1, 1, 1, 1,
0.03219325, 2.432645, -0.7085217, 1, 1, 1, 1, 1,
0.0346253, -0.3010221, 2.542198, 1, 1, 1, 1, 1,
0.03736408, 0.4297719, -0.5778236, 1, 1, 1, 1, 1,
0.03835765, -1.896518, 2.974924, 1, 1, 1, 1, 1,
0.04007141, -0.1208752, 3.674196, 1, 1, 1, 1, 1,
0.04478519, -0.6217879, 2.989336, 1, 1, 1, 1, 1,
0.04526844, -0.3804798, 4.901419, 1, 1, 1, 1, 1,
0.04973439, -0.9176505, 0.7765424, 1, 1, 1, 1, 1,
0.05740668, 0.238793, -0.6996381, 1, 1, 1, 1, 1,
0.06021211, 0.4921368, -1.47427, 1, 1, 1, 1, 1,
0.06053873, 1.399483, -2.106742, 1, 1, 1, 1, 1,
0.06060029, -0.08785415, 2.815787, 1, 1, 1, 1, 1,
0.06436504, -1.124518, 2.511876, 0, 0, 1, 1, 1,
0.06485602, 0.849748, -1.234272, 1, 0, 0, 1, 1,
0.06519989, 1.392552, -0.6839081, 1, 0, 0, 1, 1,
0.06525233, -0.1369645, 3.468501, 1, 0, 0, 1, 1,
0.0674007, 0.9592817, -0.7953178, 1, 0, 0, 1, 1,
0.0683168, 1.311021, -1.181049, 1, 0, 0, 1, 1,
0.06940235, 0.1605625, 2.351675, 0, 0, 0, 1, 1,
0.06955044, -2.149394, 1.587209, 0, 0, 0, 1, 1,
0.07047039, 1.113384, -0.9777582, 0, 0, 0, 1, 1,
0.07075421, -0.7092211, 3.973323, 0, 0, 0, 1, 1,
0.07171189, -2.50987, 4.764797, 0, 0, 0, 1, 1,
0.07761719, 2.094461, 0.3786224, 0, 0, 0, 1, 1,
0.0776654, -0.1722684, 0.1530752, 0, 0, 0, 1, 1,
0.07776065, 0.6882743, 0.2954945, 1, 1, 1, 1, 1,
0.07925607, -1.12412, 2.38895, 1, 1, 1, 1, 1,
0.08368249, 0.2447897, 1.895965, 1, 1, 1, 1, 1,
0.08398418, 0.5757663, -1.43212, 1, 1, 1, 1, 1,
0.0861386, -2.28606, 4.126587, 1, 1, 1, 1, 1,
0.08850709, 0.3264574, -0.9261671, 1, 1, 1, 1, 1,
0.08891775, -0.8018323, 3.235409, 1, 1, 1, 1, 1,
0.09025179, 1.412633, -0.2011176, 1, 1, 1, 1, 1,
0.09446523, 0.1217516, 0.1229837, 1, 1, 1, 1, 1,
0.09916659, 0.05097379, 1.844242, 1, 1, 1, 1, 1,
0.1000737, -1.402317, 3.714177, 1, 1, 1, 1, 1,
0.1004042, -0.3613353, 0.9045784, 1, 1, 1, 1, 1,
0.100899, -0.3422666, 2.911839, 1, 1, 1, 1, 1,
0.1052045, -1.264154, 4.370549, 1, 1, 1, 1, 1,
0.1077464, -2.175128, 3.421522, 1, 1, 1, 1, 1,
0.1078585, -2.03509, 3.150923, 0, 0, 1, 1, 1,
0.1091197, 0.3820127, 1.009313, 1, 0, 0, 1, 1,
0.1105851, 0.1889943, -0.1512436, 1, 0, 0, 1, 1,
0.1152483, -1.139471, 2.988588, 1, 0, 0, 1, 1,
0.1168053, -0.494185, 2.98579, 1, 0, 0, 1, 1,
0.118154, 1.131572, -1.729625, 1, 0, 0, 1, 1,
0.1183091, -0.07652189, 0.5588186, 0, 0, 0, 1, 1,
0.1273328, -0.3205487, 2.953784, 0, 0, 0, 1, 1,
0.1280282, 0.4441883, 0.3595723, 0, 0, 0, 1, 1,
0.1291098, 0.5175385, 0.481775, 0, 0, 0, 1, 1,
0.1310254, 0.3664528, 0.4667444, 0, 0, 0, 1, 1,
0.131107, -0.6391009, 3.608846, 0, 0, 0, 1, 1,
0.1324274, 0.216886, 0.8624515, 0, 0, 0, 1, 1,
0.1324702, 0.8746496, 1.503738, 1, 1, 1, 1, 1,
0.1325069, 0.234801, 0.6455351, 1, 1, 1, 1, 1,
0.1350784, -0.07247166, 1.227285, 1, 1, 1, 1, 1,
0.1357189, -1.29341, 4.418899, 1, 1, 1, 1, 1,
0.1365863, -0.8255973, 2.088883, 1, 1, 1, 1, 1,
0.1379332, 1.836521, 0.07029174, 1, 1, 1, 1, 1,
0.1389451, -0.9295886, 2.730041, 1, 1, 1, 1, 1,
0.1402194, -1.049023, 4.258292, 1, 1, 1, 1, 1,
0.1436624, -0.1053222, 2.211641, 1, 1, 1, 1, 1,
0.1465486, 0.2427698, 0.1565246, 1, 1, 1, 1, 1,
0.1481602, -0.2107952, 3.580107, 1, 1, 1, 1, 1,
0.1495694, -0.2393729, 1.474231, 1, 1, 1, 1, 1,
0.1496106, -1.162097, 1.543461, 1, 1, 1, 1, 1,
0.1512165, 1.327945, -0.8108457, 1, 1, 1, 1, 1,
0.1541664, 1.189025, 1.779209, 1, 1, 1, 1, 1,
0.1554402, -0.3033899, 3.525749, 0, 0, 1, 1, 1,
0.1555873, -0.1167082, 3.470492, 1, 0, 0, 1, 1,
0.1573256, -1.07321, 1.818308, 1, 0, 0, 1, 1,
0.1579683, 0.8923102, 1.302935, 1, 0, 0, 1, 1,
0.1614743, 0.8292046, -1.208501, 1, 0, 0, 1, 1,
0.1690033, 1.245018, 0.8971811, 1, 0, 0, 1, 1,
0.17113, 0.162974, 3.283362, 0, 0, 0, 1, 1,
0.1778485, 0.4477353, 1.519943, 0, 0, 0, 1, 1,
0.1801398, -0.8387344, 4.690393, 0, 0, 0, 1, 1,
0.1804421, -0.9633075, 4.311705, 0, 0, 0, 1, 1,
0.1819792, -0.1823328, 1.879976, 0, 0, 0, 1, 1,
0.1843675, 1.061543, 1.967703, 0, 0, 0, 1, 1,
0.1900275, -1.527387, 4.118042, 0, 0, 0, 1, 1,
0.192919, -1.188853, 2.084587, 1, 1, 1, 1, 1,
0.1984676, 1.442852, -0.2325659, 1, 1, 1, 1, 1,
0.2057916, 1.827814, 1.179494, 1, 1, 1, 1, 1,
0.2164259, -1.04727, 2.420791, 1, 1, 1, 1, 1,
0.2167682, -0.2560232, 3.734896, 1, 1, 1, 1, 1,
0.2186889, -0.3335302, 0.6795711, 1, 1, 1, 1, 1,
0.2200074, -0.2316884, 2.17398, 1, 1, 1, 1, 1,
0.2249612, 0.1101633, 1.449343, 1, 1, 1, 1, 1,
0.2283354, 0.4397134, 0.1979019, 1, 1, 1, 1, 1,
0.2339902, 0.2432805, 0.2790974, 1, 1, 1, 1, 1,
0.2355174, 0.6162074, 1.279865, 1, 1, 1, 1, 1,
0.2401497, -0.5907269, 2.59737, 1, 1, 1, 1, 1,
0.2403081, -1.005615, 1.72497, 1, 1, 1, 1, 1,
0.240973, 0.2510842, 0.2977048, 1, 1, 1, 1, 1,
0.2410535, -1.596765, 1.583035, 1, 1, 1, 1, 1,
0.2414849, -0.5566431, 1.258833, 0, 0, 1, 1, 1,
0.2440492, -0.4149474, 2.656029, 1, 0, 0, 1, 1,
0.245855, 1.333892, 0.8230298, 1, 0, 0, 1, 1,
0.2517566, 0.747097, -0.1717406, 1, 0, 0, 1, 1,
0.2551397, 0.7520669, 0.6274374, 1, 0, 0, 1, 1,
0.2558794, 0.9999754, 0.4584363, 1, 0, 0, 1, 1,
0.2572497, -0.009660078, 1.761026, 0, 0, 0, 1, 1,
0.2585277, 0.9701833, 2.440347, 0, 0, 0, 1, 1,
0.272104, -0.7066331, 3.343667, 0, 0, 0, 1, 1,
0.2752398, 1.988183, 0.6913537, 0, 0, 0, 1, 1,
0.2806905, 1.301831, -1.894044, 0, 0, 0, 1, 1,
0.2841401, 0.8941565, 0.1071456, 0, 0, 0, 1, 1,
0.2856442, 1.609014, -0.6392925, 0, 0, 0, 1, 1,
0.2884194, 0.9604938, 0.7275664, 1, 1, 1, 1, 1,
0.2920955, -2.035186, 4.037838, 1, 1, 1, 1, 1,
0.2942459, -1.556675, 3.105151, 1, 1, 1, 1, 1,
0.2952119, -0.5069503, 4.01114, 1, 1, 1, 1, 1,
0.3000696, -0.2349382, 2.218126, 1, 1, 1, 1, 1,
0.3055972, 0.1251171, 0.2990346, 1, 1, 1, 1, 1,
0.3103951, -0.950926, 3.597173, 1, 1, 1, 1, 1,
0.311901, -0.8874298, 2.050406, 1, 1, 1, 1, 1,
0.3138814, 2.346095, 1.006921, 1, 1, 1, 1, 1,
0.3155541, 1.74813, 0.6027924, 1, 1, 1, 1, 1,
0.323727, 0.2031319, 2.234796, 1, 1, 1, 1, 1,
0.3268025, -0.05168479, 1.109312, 1, 1, 1, 1, 1,
0.3290584, 1.228506, 0.490103, 1, 1, 1, 1, 1,
0.3299963, -0.6206869, 2.545428, 1, 1, 1, 1, 1,
0.33869, -1.678139, 2.596505, 1, 1, 1, 1, 1,
0.3395037, -0.1601814, 0.7358468, 0, 0, 1, 1, 1,
0.3446945, -0.4052677, 0.2186766, 1, 0, 0, 1, 1,
0.3451731, 0.007126444, 1.816377, 1, 0, 0, 1, 1,
0.3480802, -0.09246702, 0.8752061, 1, 0, 0, 1, 1,
0.3515048, -0.2544622, 2.608922, 1, 0, 0, 1, 1,
0.35693, -0.5793912, 1.595995, 1, 0, 0, 1, 1,
0.3592357, -0.9654708, 1.961092, 0, 0, 0, 1, 1,
0.3596266, -0.3348566, 3.939207, 0, 0, 0, 1, 1,
0.3600067, -0.05628049, 1.57521, 0, 0, 0, 1, 1,
0.3640709, -0.02883591, 0.7561712, 0, 0, 0, 1, 1,
0.3654058, -1.546331, 3.410777, 0, 0, 0, 1, 1,
0.3698933, -1.663376, 4.403572, 0, 0, 0, 1, 1,
0.3700852, 0.4239476, 0.1268788, 0, 0, 0, 1, 1,
0.3766996, 1.171189, 0.3723751, 1, 1, 1, 1, 1,
0.3811273, -0.5321475, 2.379435, 1, 1, 1, 1, 1,
0.3840021, -0.9288144, 3.718093, 1, 1, 1, 1, 1,
0.38425, 0.2485866, 0.2243601, 1, 1, 1, 1, 1,
0.3872123, -0.9113708, 0.7032122, 1, 1, 1, 1, 1,
0.3873394, 1.058453, 0.9300401, 1, 1, 1, 1, 1,
0.3886722, -1.208817, 3.022376, 1, 1, 1, 1, 1,
0.3967088, -0.4797194, 1.167211, 1, 1, 1, 1, 1,
0.3970504, 0.2231565, 1.883452, 1, 1, 1, 1, 1,
0.3973402, -1.056696, 4.306031, 1, 1, 1, 1, 1,
0.3975002, 1.954765, 0.7980288, 1, 1, 1, 1, 1,
0.3992873, 0.6917467, 0.1660414, 1, 1, 1, 1, 1,
0.4046437, -1.518457, 3.718457, 1, 1, 1, 1, 1,
0.4055792, -0.4860019, 2.058618, 1, 1, 1, 1, 1,
0.4058193, 0.5755312, 1.92245, 1, 1, 1, 1, 1,
0.4072839, -0.4404159, 2.100175, 0, 0, 1, 1, 1,
0.4080889, 0.6629494, 0.4481707, 1, 0, 0, 1, 1,
0.4124997, -0.2728669, 1.916193, 1, 0, 0, 1, 1,
0.4133342, -1.004286, 1.590117, 1, 0, 0, 1, 1,
0.4203341, -2.076848, 1.951855, 1, 0, 0, 1, 1,
0.4224772, 0.04061352, 1.206568, 1, 0, 0, 1, 1,
0.4230748, -1.718749, 4.061536, 0, 0, 0, 1, 1,
0.4261297, 0.5204798, 0.6788964, 0, 0, 0, 1, 1,
0.4271223, -0.7981114, 1.339218, 0, 0, 0, 1, 1,
0.4277081, 0.5336894, -0.1906283, 0, 0, 0, 1, 1,
0.431717, 1.638086, 0.1463944, 0, 0, 0, 1, 1,
0.4320342, 0.1940587, 1.312634, 0, 0, 0, 1, 1,
0.4332661, -0.04584609, 2.023259, 0, 0, 0, 1, 1,
0.4335987, -0.6563972, 1.591368, 1, 1, 1, 1, 1,
0.4351586, -0.7224196, 1.741643, 1, 1, 1, 1, 1,
0.4355652, -0.2588552, 0.9986928, 1, 1, 1, 1, 1,
0.4360527, -1.266988, 2.294041, 1, 1, 1, 1, 1,
0.4385343, -1.525485, 3.511654, 1, 1, 1, 1, 1,
0.4444318, 0.03783719, 0.3229291, 1, 1, 1, 1, 1,
0.4455741, -0.1426263, 3.865408, 1, 1, 1, 1, 1,
0.4513698, 0.6257012, 0.8495528, 1, 1, 1, 1, 1,
0.4542122, -1.567261, 5.653001, 1, 1, 1, 1, 1,
0.4546224, 0.4343286, 2.208352, 1, 1, 1, 1, 1,
0.457194, 0.1030337, 1.148396, 1, 1, 1, 1, 1,
0.4579621, -0.310542, 2.352725, 1, 1, 1, 1, 1,
0.459119, -0.376478, 2.674419, 1, 1, 1, 1, 1,
0.461901, 1.038736, 1.830412, 1, 1, 1, 1, 1,
0.4633949, 1.02818, -0.5558846, 1, 1, 1, 1, 1,
0.4659178, 0.9972649, -1.058414, 0, 0, 1, 1, 1,
0.4680817, -0.2342133, 2.14566, 1, 0, 0, 1, 1,
0.4709614, -0.2275431, 1.598457, 1, 0, 0, 1, 1,
0.4794073, 1.452279, 0.1673424, 1, 0, 0, 1, 1,
0.4795619, -1.058702, 2.871001, 1, 0, 0, 1, 1,
0.4810731, -0.3025706, 3.948134, 1, 0, 0, 1, 1,
0.4832862, 0.378852, 1.86289, 0, 0, 0, 1, 1,
0.4840306, 0.4174756, 1.227322, 0, 0, 0, 1, 1,
0.4871562, 0.3213556, 1.651154, 0, 0, 0, 1, 1,
0.4906585, 1.094525, 2.117001, 0, 0, 0, 1, 1,
0.4909327, 0.8655763, 1.969967, 0, 0, 0, 1, 1,
0.4948199, -1.522096, 3.03411, 0, 0, 0, 1, 1,
0.4999339, 0.1126597, 0.8207282, 0, 0, 0, 1, 1,
0.5026566, 0.1136747, 1.447273, 1, 1, 1, 1, 1,
0.5058309, -2.315382, 2.816035, 1, 1, 1, 1, 1,
0.5073347, 0.4648057, 0.1199736, 1, 1, 1, 1, 1,
0.5116818, 0.4864656, -0.4858575, 1, 1, 1, 1, 1,
0.5138589, -0.9223967, 1.49711, 1, 1, 1, 1, 1,
0.5150238, -3.159313, 4.591414, 1, 1, 1, 1, 1,
0.5162477, -0.4343545, 2.768217, 1, 1, 1, 1, 1,
0.5216553, -0.7114121, 1.065405, 1, 1, 1, 1, 1,
0.522096, -0.6959479, 0.2853128, 1, 1, 1, 1, 1,
0.5221852, 0.1108165, -0.08546413, 1, 1, 1, 1, 1,
0.5246282, -0.5694022, 2.626563, 1, 1, 1, 1, 1,
0.5249951, 2.222155, -0.4506561, 1, 1, 1, 1, 1,
0.527924, 0.256247, 2.03931, 1, 1, 1, 1, 1,
0.5284101, -0.3980938, 1.932931, 1, 1, 1, 1, 1,
0.5287336, 0.8517298, -0.7698315, 1, 1, 1, 1, 1,
0.5303524, 2.134015, 0.6251549, 0, 0, 1, 1, 1,
0.531724, -0.3265285, 1.091853, 1, 0, 0, 1, 1,
0.5468696, -0.1743014, 2.036707, 1, 0, 0, 1, 1,
0.5500658, 1.304274, 1.455973, 1, 0, 0, 1, 1,
0.5539542, 0.01106501, 1.179187, 1, 0, 0, 1, 1,
0.5543306, 1.366493, 1.018075, 1, 0, 0, 1, 1,
0.5556085, -0.4400436, 3.465072, 0, 0, 0, 1, 1,
0.559145, 0.7557455, 1.207615, 0, 0, 0, 1, 1,
0.5667379, -0.1097971, 1.899687, 0, 0, 0, 1, 1,
0.5685779, -1.339796, 2.999834, 0, 0, 0, 1, 1,
0.5692731, 0.1058836, 0.8988059, 0, 0, 0, 1, 1,
0.5708849, -0.86773, 3.212234, 0, 0, 0, 1, 1,
0.5727264, 0.1133384, 1.094891, 0, 0, 0, 1, 1,
0.5745358, -0.3034581, 3.356698, 1, 1, 1, 1, 1,
0.5783466, -2.129011, 3.44098, 1, 1, 1, 1, 1,
0.5785205, 0.7707018, 1.062363, 1, 1, 1, 1, 1,
0.5802613, -1.013971, 1.922468, 1, 1, 1, 1, 1,
0.5814067, -0.5439426, 3.333218, 1, 1, 1, 1, 1,
0.5841668, -0.4526068, 2.03941, 1, 1, 1, 1, 1,
0.5880568, -0.3012085, 2.261062, 1, 1, 1, 1, 1,
0.5886281, 0.3516367, 1.710154, 1, 1, 1, 1, 1,
0.5919577, 1.338103, 0.9461517, 1, 1, 1, 1, 1,
0.5934061, 0.07101601, 1.464326, 1, 1, 1, 1, 1,
0.5934623, -0.6114463, 2.871613, 1, 1, 1, 1, 1,
0.5943436, 0.2599135, 0.8165, 1, 1, 1, 1, 1,
0.5949377, -0.2573453, 3.423284, 1, 1, 1, 1, 1,
0.6005064, 0.6750599, 1.55645, 1, 1, 1, 1, 1,
0.6022407, -0.5512511, 1.971744, 1, 1, 1, 1, 1,
0.6059064, -0.1173953, 3.439227, 0, 0, 1, 1, 1,
0.6081069, -0.0791462, 0.9644234, 1, 0, 0, 1, 1,
0.6103054, -0.6026486, 1.58568, 1, 0, 0, 1, 1,
0.610603, 0.7673894, 0.8566357, 1, 0, 0, 1, 1,
0.613014, -0.5672646, 3.477326, 1, 0, 0, 1, 1,
0.6241716, -0.5543476, 2.529966, 1, 0, 0, 1, 1,
0.6262617, -1.043363, 2.56679, 0, 0, 0, 1, 1,
0.6276452, 1.102399, 1.126642, 0, 0, 0, 1, 1,
0.6277164, 0.9022383, -0.6373104, 0, 0, 0, 1, 1,
0.634474, -0.07006282, 1.959954, 0, 0, 0, 1, 1,
0.6361865, -1.310382, 3.29559, 0, 0, 0, 1, 1,
0.6432107, 0.02542431, 1.361402, 0, 0, 0, 1, 1,
0.6452992, 1.885615, 0.8707751, 0, 0, 0, 1, 1,
0.6510098, 0.9771704, 2.174685, 1, 1, 1, 1, 1,
0.6529416, -0.06324176, 1.001621, 1, 1, 1, 1, 1,
0.6542619, -1.339839, 3.878692, 1, 1, 1, 1, 1,
0.6596324, 0.8785923, 0.7583634, 1, 1, 1, 1, 1,
0.6649256, 0.5978587, -0.6817153, 1, 1, 1, 1, 1,
0.6669402, 1.901992, -0.06137039, 1, 1, 1, 1, 1,
0.6703246, -1.135724, 1.684216, 1, 1, 1, 1, 1,
0.6711845, 0.1311408, 2.193244, 1, 1, 1, 1, 1,
0.675491, -0.3435791, 1.688774, 1, 1, 1, 1, 1,
0.6785141, 1.517547, 0.3797127, 1, 1, 1, 1, 1,
0.6788712, 1.021862, 1.519406, 1, 1, 1, 1, 1,
0.6802676, 0.0295956, 0.8749265, 1, 1, 1, 1, 1,
0.6809075, -0.7656173, 2.744202, 1, 1, 1, 1, 1,
0.68091, -0.3818368, 1.79626, 1, 1, 1, 1, 1,
0.6815484, 1.486985, 0.6842886, 1, 1, 1, 1, 1,
0.6822327, 0.1874399, 2.171505, 0, 0, 1, 1, 1,
0.6963811, 0.3064163, 0.5879275, 1, 0, 0, 1, 1,
0.6964449, 0.07369971, 0.1765975, 1, 0, 0, 1, 1,
0.7009188, -0.514428, 1.280445, 1, 0, 0, 1, 1,
0.7024884, 1.329505, 0.3807787, 1, 0, 0, 1, 1,
0.7040822, -1.654837, 3.641259, 1, 0, 0, 1, 1,
0.7048882, 1.233853, 0.8658818, 0, 0, 0, 1, 1,
0.7161047, -0.472865, 0.3168394, 0, 0, 0, 1, 1,
0.7205505, -0.8472424, 3.45172, 0, 0, 0, 1, 1,
0.7233157, -0.5305451, 1.568268, 0, 0, 0, 1, 1,
0.7234031, -0.0592228, 1.756244, 0, 0, 0, 1, 1,
0.7258763, -1.026226, 1.257386, 0, 0, 0, 1, 1,
0.7367016, 0.6338322, 0.2181318, 0, 0, 0, 1, 1,
0.7369768, 0.09502555, 3.322985, 1, 1, 1, 1, 1,
0.7536215, 0.6532212, 1.016938, 1, 1, 1, 1, 1,
0.7563769, 0.2479186, 1.192893, 1, 1, 1, 1, 1,
0.7586693, 0.377412, 2.262913, 1, 1, 1, 1, 1,
0.7587309, 0.6801152, 1.210542, 1, 1, 1, 1, 1,
0.7625695, 0.8356466, 0.7460364, 1, 1, 1, 1, 1,
0.7675674, -0.04777073, 0.6333925, 1, 1, 1, 1, 1,
0.7729601, 1.711424, -0.7835568, 1, 1, 1, 1, 1,
0.7766351, -0.5030103, 2.696268, 1, 1, 1, 1, 1,
0.7779561, -0.6119279, 1.990635, 1, 1, 1, 1, 1,
0.779575, -0.2198171, 1.803076, 1, 1, 1, 1, 1,
0.782474, 0.1449383, 0.492251, 1, 1, 1, 1, 1,
0.7858071, -1.597071, 4.445677, 1, 1, 1, 1, 1,
0.7947703, -0.6972753, 1.040451, 1, 1, 1, 1, 1,
0.796932, 0.442873, 1.297499, 1, 1, 1, 1, 1,
0.800779, -0.7195213, 1.245255, 0, 0, 1, 1, 1,
0.8016721, -0.2860014, 2.310459, 1, 0, 0, 1, 1,
0.8031443, 0.2607729, 1.045102, 1, 0, 0, 1, 1,
0.8055435, -0.02031006, -0.6302343, 1, 0, 0, 1, 1,
0.8057104, -0.02875808, 3.175102, 1, 0, 0, 1, 1,
0.8068448, 0.002939696, 1.208508, 1, 0, 0, 1, 1,
0.8080496, -0.460204, 0.1102984, 0, 0, 0, 1, 1,
0.8192763, -0.4059299, 1.594374, 0, 0, 0, 1, 1,
0.8200696, 1.655706, -0.277774, 0, 0, 0, 1, 1,
0.8215443, 0.3992295, -1.781048, 0, 0, 0, 1, 1,
0.8216916, 0.3228849, 2.122054, 0, 0, 0, 1, 1,
0.8225103, 0.5283196, 2.69298, 0, 0, 0, 1, 1,
0.8264575, -0.5855201, 2.124836, 0, 0, 0, 1, 1,
0.8310819, 1.174081, 1.292593, 1, 1, 1, 1, 1,
0.8311918, 1.636933, 1.609174, 1, 1, 1, 1, 1,
0.8408172, -0.349013, 2.314508, 1, 1, 1, 1, 1,
0.8454942, -1.27934, 1.629183, 1, 1, 1, 1, 1,
0.8463787, -2.362734, 3.076741, 1, 1, 1, 1, 1,
0.8474597, 0.8199579, -0.6084331, 1, 1, 1, 1, 1,
0.8568677, 1.06256, 0.3429924, 1, 1, 1, 1, 1,
0.862287, 1.69688, -0.5344817, 1, 1, 1, 1, 1,
0.8648053, -0.1249113, 0.9062336, 1, 1, 1, 1, 1,
0.8657141, -0.6621275, 1.000852, 1, 1, 1, 1, 1,
0.8659288, -0.7190467, 1.934705, 1, 1, 1, 1, 1,
0.8730095, 0.2130129, 0.3468182, 1, 1, 1, 1, 1,
0.8753551, 0.9356008, 2.794627, 1, 1, 1, 1, 1,
0.8842444, 1.288222, 1.698642, 1, 1, 1, 1, 1,
0.8871718, 0.5441757, 0.4693683, 1, 1, 1, 1, 1,
0.8967869, -2.412653, 3.046681, 0, 0, 1, 1, 1,
0.8995999, -0.9557279, 4.159459, 1, 0, 0, 1, 1,
0.9138985, 0.1842757, -0.1488208, 1, 0, 0, 1, 1,
0.9152206, 1.323438, 0.7158269, 1, 0, 0, 1, 1,
0.9157823, 0.1812435, 1.389299, 1, 0, 0, 1, 1,
0.9241241, -0.5505698, 1.937283, 1, 0, 0, 1, 1,
0.9292254, 0.6563293, 0.8251093, 0, 0, 0, 1, 1,
0.931125, -1.017437, 2.564849, 0, 0, 0, 1, 1,
0.93356, -0.4451755, 3.207748, 0, 0, 0, 1, 1,
0.9393709, 0.6349738, 0.9056239, 0, 0, 0, 1, 1,
0.9399256, -0.2805614, 2.701637, 0, 0, 0, 1, 1,
0.9448747, -0.04980539, 1.783289, 0, 0, 0, 1, 1,
0.9461909, 1.227126, 1.220788, 0, 0, 0, 1, 1,
0.9514223, 0.6708142, -0.7130681, 1, 1, 1, 1, 1,
0.9519144, 0.994284, -1.115305, 1, 1, 1, 1, 1,
0.953846, -1.117958, 2.855857, 1, 1, 1, 1, 1,
0.9617389, -1.419559, 3.829645, 1, 1, 1, 1, 1,
0.9619521, 0.508183, 0.6497604, 1, 1, 1, 1, 1,
0.9697628, -1.280431, 3.180854, 1, 1, 1, 1, 1,
0.9825007, 0.8809446, 1.373039, 1, 1, 1, 1, 1,
0.9878566, 2.115236, 0.8348899, 1, 1, 1, 1, 1,
0.9922711, -2.025049, 1.593115, 1, 1, 1, 1, 1,
0.9990742, -0.2789688, 0.7126529, 1, 1, 1, 1, 1,
1.007044, -0.6570733, 1.955668, 1, 1, 1, 1, 1,
1.009106, -0.1930698, 2.609246, 1, 1, 1, 1, 1,
1.010841, -0.3658603, 4.195424, 1, 1, 1, 1, 1,
1.021661, 0.8664401, 0.9179876, 1, 1, 1, 1, 1,
1.023694, 1.087538, -0.6558183, 1, 1, 1, 1, 1,
1.023745, 1.396364, -1.773124, 0, 0, 1, 1, 1,
1.025978, -1.470747, 2.733023, 1, 0, 0, 1, 1,
1.026179, 0.52876, 1.941387, 1, 0, 0, 1, 1,
1.026722, 1.202458, 0.5032378, 1, 0, 0, 1, 1,
1.028705, 1.792575, -1.029239, 1, 0, 0, 1, 1,
1.030036, 0.6683382, -0.7849277, 1, 0, 0, 1, 1,
1.030181, -0.4832901, 1.639162, 0, 0, 0, 1, 1,
1.034068, -1.14088, 2.380937, 0, 0, 0, 1, 1,
1.041705, 0.7400991, 0.3273046, 0, 0, 0, 1, 1,
1.044469, 0.02390446, 2.008554, 0, 0, 0, 1, 1,
1.055573, 0.8104035, 0.7312593, 0, 0, 0, 1, 1,
1.059646, 0.2522081, 1.737156, 0, 0, 0, 1, 1,
1.060672, 0.114364, 0.2099983, 0, 0, 0, 1, 1,
1.062271, 1.438269, 0.2680612, 1, 1, 1, 1, 1,
1.063493, -0.7720459, 2.170314, 1, 1, 1, 1, 1,
1.064161, -1.306026, 4.172947, 1, 1, 1, 1, 1,
1.064666, -0.3963755, 2.496101, 1, 1, 1, 1, 1,
1.066378, 0.9326944, 1.088961, 1, 1, 1, 1, 1,
1.066963, -0.6065214, 2.736923, 1, 1, 1, 1, 1,
1.067712, 0.6277545, 1.412807, 1, 1, 1, 1, 1,
1.071704, 1.268901, 3.018821, 1, 1, 1, 1, 1,
1.072976, 0.6327533, 0.9485505, 1, 1, 1, 1, 1,
1.075227, 0.8499522, 1.208635, 1, 1, 1, 1, 1,
1.076086, 1.803415, 0.1619258, 1, 1, 1, 1, 1,
1.080828, -1.700019, 3.952742, 1, 1, 1, 1, 1,
1.08784, 0.1796103, 2.456629, 1, 1, 1, 1, 1,
1.090312, 0.1656451, -0.8490811, 1, 1, 1, 1, 1,
1.093684, 2.082042, 0.9019862, 1, 1, 1, 1, 1,
1.093815, -2.414008, 1.992145, 0, 0, 1, 1, 1,
1.098146, 0.7122851, 1.608384, 1, 0, 0, 1, 1,
1.101667, 0.6556634, 1.205395, 1, 0, 0, 1, 1,
1.105057, -0.226885, -0.1042157, 1, 0, 0, 1, 1,
1.105719, -0.01435356, 1.53887, 1, 0, 0, 1, 1,
1.107478, 0.9834761, 1.850725, 1, 0, 0, 1, 1,
1.113425, -0.3193503, 0.4716699, 0, 0, 0, 1, 1,
1.114165, -0.3600877, 1.70068, 0, 0, 0, 1, 1,
1.116386, -0.1081112, 3.760281, 0, 0, 0, 1, 1,
1.117035, -0.9800508, 2.737263, 0, 0, 0, 1, 1,
1.118172, -0.1797862, 1.309868, 0, 0, 0, 1, 1,
1.127141, -0.3145572, 2.958837, 0, 0, 0, 1, 1,
1.128804, 1.32208, -0.4043638, 0, 0, 0, 1, 1,
1.141625, 0.4152631, 0.6797487, 1, 1, 1, 1, 1,
1.152031, -1.120302, 3.446314, 1, 1, 1, 1, 1,
1.154642, 1.855622, -0.3576563, 1, 1, 1, 1, 1,
1.15483, -0.6987138, 1.102695, 1, 1, 1, 1, 1,
1.159258, -0.7635375, 3.282061, 1, 1, 1, 1, 1,
1.161377, 1.703084, -0.3933626, 1, 1, 1, 1, 1,
1.16487, -0.2140084, 1.802583, 1, 1, 1, 1, 1,
1.167846, -0.7680973, 1.898515, 1, 1, 1, 1, 1,
1.177734, -0.9695247, 2.025525, 1, 1, 1, 1, 1,
1.179415, 0.1960477, -0.32654, 1, 1, 1, 1, 1,
1.181498, -0.310699, 1.353963, 1, 1, 1, 1, 1,
1.184009, -0.115832, 3.485274, 1, 1, 1, 1, 1,
1.185787, -0.1559679, 4.384529, 1, 1, 1, 1, 1,
1.188315, 1.032992, -0.6800721, 1, 1, 1, 1, 1,
1.19177, -0.07397932, 0.6323213, 1, 1, 1, 1, 1,
1.194535, -0.07669647, 1.272278, 0, 0, 1, 1, 1,
1.195759, -0.4025736, 2.298043, 1, 0, 0, 1, 1,
1.196239, 0.624227, 0.3170004, 1, 0, 0, 1, 1,
1.209439, -0.4286011, 2.448964, 1, 0, 0, 1, 1,
1.216406, 0.4469021, 2.854507, 1, 0, 0, 1, 1,
1.219772, 0.3712554, 1.42117, 1, 0, 0, 1, 1,
1.235834, 1.046126, 0.1585624, 0, 0, 0, 1, 1,
1.23823, 1.277507, 0.814173, 0, 0, 0, 1, 1,
1.24212, -0.8748056, 2.354701, 0, 0, 0, 1, 1,
1.242655, -2.783663, 1.053179, 0, 0, 0, 1, 1,
1.244012, 0.4276429, 0.1296068, 0, 0, 0, 1, 1,
1.24538, 0.8578981, 1.550101, 0, 0, 0, 1, 1,
1.267018, 0.3049579, 1.277272, 0, 0, 0, 1, 1,
1.286843, -0.09606108, 1.775215, 1, 1, 1, 1, 1,
1.289812, -1.218496, 1.163396, 1, 1, 1, 1, 1,
1.293131, -0.8886293, 3.11624, 1, 1, 1, 1, 1,
1.30463, -1.053019, 2.660555, 1, 1, 1, 1, 1,
1.306387, 0.4069757, 0.8206863, 1, 1, 1, 1, 1,
1.318375, 0.2721161, -0.2668128, 1, 1, 1, 1, 1,
1.320739, 0.8255463, -0.05049033, 1, 1, 1, 1, 1,
1.32988, 0.773683, 0.5898443, 1, 1, 1, 1, 1,
1.332738, -0.3682503, 3.788449, 1, 1, 1, 1, 1,
1.336042, -0.8374808, 3.412242, 1, 1, 1, 1, 1,
1.340724, -0.7412772, 2.675718, 1, 1, 1, 1, 1,
1.355372, 0.3229113, 1.279196, 1, 1, 1, 1, 1,
1.374899, 0.7968281, -0.383893, 1, 1, 1, 1, 1,
1.40323, 0.866322, 1.192266, 1, 1, 1, 1, 1,
1.405652, -0.6262087, 1.559546, 1, 1, 1, 1, 1,
1.417322, -0.3023066, 2.474539, 0, 0, 1, 1, 1,
1.433077, 0.1082841, 0.8556518, 1, 0, 0, 1, 1,
1.439834, -0.2219691, 2.807953, 1, 0, 0, 1, 1,
1.447612, 0.07093658, 2.43569, 1, 0, 0, 1, 1,
1.448795, 0.3062185, 1.387157, 1, 0, 0, 1, 1,
1.448839, -1.065101, 3.184394, 1, 0, 0, 1, 1,
1.45443, -1.321889, 2.814236, 0, 0, 0, 1, 1,
1.458782, -0.3480774, 2.101028, 0, 0, 0, 1, 1,
1.472253, -1.597263, 1.080539, 0, 0, 0, 1, 1,
1.47942, -0.01062577, 0.3021544, 0, 0, 0, 1, 1,
1.488331, -1.017842, 1.848662, 0, 0, 0, 1, 1,
1.505963, -0.1266206, 1.020654, 0, 0, 0, 1, 1,
1.507561, -0.0247004, 1.734809, 0, 0, 0, 1, 1,
1.525549, -1.214725, 3.468037, 1, 1, 1, 1, 1,
1.53123, 0.3042443, 1.346199, 1, 1, 1, 1, 1,
1.53849, 1.254834, 2.764538, 1, 1, 1, 1, 1,
1.541446, 0.5584938, 1.523509, 1, 1, 1, 1, 1,
1.556417, 0.541045, 2.808574, 1, 1, 1, 1, 1,
1.557661, 2.263, 0.5706966, 1, 1, 1, 1, 1,
1.559274, 0.2468411, 2.13536, 1, 1, 1, 1, 1,
1.55996, -1.172858, 2.237996, 1, 1, 1, 1, 1,
1.57018, 0.7017614, 2.435961, 1, 1, 1, 1, 1,
1.588528, -1.438687, 2.204858, 1, 1, 1, 1, 1,
1.592663, -0.889262, 0.7148623, 1, 1, 1, 1, 1,
1.607689, 0.5468222, 1.915235, 1, 1, 1, 1, 1,
1.613412, 0.633075, 1.849205, 1, 1, 1, 1, 1,
1.615665, 0.6196544, 1.237561, 1, 1, 1, 1, 1,
1.628801, 0.4412653, 1.292445, 1, 1, 1, 1, 1,
1.644572, -0.7473898, 1.103735, 0, 0, 1, 1, 1,
1.652793, -0.82537, 2.760661, 1, 0, 0, 1, 1,
1.663354, -1.139073, 1.817259, 1, 0, 0, 1, 1,
1.671708, -0.7341832, 1.249325, 1, 0, 0, 1, 1,
1.688517, 0.4222612, 2.479502, 1, 0, 0, 1, 1,
1.693976, -0.3265459, 0.7175089, 1, 0, 0, 1, 1,
1.702498, -1.245824, 2.436031, 0, 0, 0, 1, 1,
1.716797, -0.1336652, 1.68411, 0, 0, 0, 1, 1,
1.732703, 0.9525399, -0.4561403, 0, 0, 0, 1, 1,
1.739091, -1.17329, 2.407634, 0, 0, 0, 1, 1,
1.751065, -1.04586, 2.57772, 0, 0, 0, 1, 1,
1.77688, 1.162747, 1.605451, 0, 0, 0, 1, 1,
1.795818, 3.098346, 1.610764, 0, 0, 0, 1, 1,
1.817059, 1.086222, 0.8680661, 1, 1, 1, 1, 1,
1.829782, -1.500418, 1.930717, 1, 1, 1, 1, 1,
1.837574, -0.08929511, 2.640224, 1, 1, 1, 1, 1,
1.849581, -0.6577874, 0.8190383, 1, 1, 1, 1, 1,
1.88003, -0.1089975, 1.94143, 1, 1, 1, 1, 1,
1.886115, 1.070765, 1.121561, 1, 1, 1, 1, 1,
1.886405, -0.06079525, 2.372489, 1, 1, 1, 1, 1,
1.893649, 1.167266, -0.518622, 1, 1, 1, 1, 1,
1.902164, -0.591712, 2.504447, 1, 1, 1, 1, 1,
1.913021, -1.574144, 2.868544, 1, 1, 1, 1, 1,
1.923698, 0.2426496, -0.04853735, 1, 1, 1, 1, 1,
1.939187, -0.02258739, 1.360973, 1, 1, 1, 1, 1,
1.944033, 0.999439, 1.714645, 1, 1, 1, 1, 1,
1.9485, 0.246539, -0.2355862, 1, 1, 1, 1, 1,
2.002137, -0.2720875, 2.043203, 1, 1, 1, 1, 1,
2.093078, 0.5579016, 0.6021457, 0, 0, 1, 1, 1,
2.105394, 0.4329467, 0.978663, 1, 0, 0, 1, 1,
2.141148, 0.3265205, 1.11994, 1, 0, 0, 1, 1,
2.166152, -0.04656116, 1.746201, 1, 0, 0, 1, 1,
2.232864, 1.101588, 2.030954, 1, 0, 0, 1, 1,
2.241005, -2.53051, 2.398668, 1, 0, 0, 1, 1,
2.276827, 0.5145952, 2.52111, 0, 0, 0, 1, 1,
2.28822, -0.4399229, 2.314911, 0, 0, 0, 1, 1,
2.295956, 1.033674, 1.224349, 0, 0, 0, 1, 1,
2.311743, -0.7794505, 2.318617, 0, 0, 0, 1, 1,
2.372066, 0.5450382, 1.484615, 0, 0, 0, 1, 1,
2.40575, 0.0890602, 3.208673, 0, 0, 0, 1, 1,
2.556655, -1.125069, 1.831681, 0, 0, 0, 1, 1,
2.706752, 0.6844828, 1.263602, 1, 1, 1, 1, 1,
2.706864, -1.197506, 2.129737, 1, 1, 1, 1, 1,
2.789245, -1.482555, 2.949683, 1, 1, 1, 1, 1,
2.827244, 1.231264, -0.0879361, 1, 1, 1, 1, 1,
2.843999, 0.441927, 2.035786, 1, 1, 1, 1, 1,
3.045209, -1.229403, 0.8337283, 1, 1, 1, 1, 1,
3.130075, -1.225235, 1.982564, 1, 1, 1, 1, 1
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
var radius = 9.592551;
var distance = 33.69343;
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
mvMatrix.translate( -0.0488019, 0.03048372, -0.1458426 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.69343);
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
