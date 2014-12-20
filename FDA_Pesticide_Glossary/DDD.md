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
-3.05144, 1.198239, -1.189921, 1, 0, 0, 1,
-2.722653, -0.1626255, -0.6194033, 1, 0.007843138, 0, 1,
-2.688822, 1.27728, -1.158855, 1, 0.01176471, 0, 1,
-2.563554, -0.09843615, -1.438542, 1, 0.01960784, 0, 1,
-2.521308, 0.6584125, -1.52999, 1, 0.02352941, 0, 1,
-2.492144, 1.272959, -0.1632855, 1, 0.03137255, 0, 1,
-2.48858, 0.4758841, -3.456712, 1, 0.03529412, 0, 1,
-2.482476, -1.890772, -1.638046, 1, 0.04313726, 0, 1,
-2.340693, -0.6022518, -1.276058, 1, 0.04705882, 0, 1,
-2.316722, 0.7636974, -0.4528793, 1, 0.05490196, 0, 1,
-2.313854, 0.05148448, -2.630799, 1, 0.05882353, 0, 1,
-2.301497, 1.735194, 1.476079, 1, 0.06666667, 0, 1,
-2.299938, 0.830525, -1.439893, 1, 0.07058824, 0, 1,
-2.262229, 0.2515479, -0.7313719, 1, 0.07843138, 0, 1,
-2.241068, -1.193621, -3.383197, 1, 0.08235294, 0, 1,
-2.14386, -0.01211367, -0.1926077, 1, 0.09019608, 0, 1,
-2.128739, -0.7183816, -1.374107, 1, 0.09411765, 0, 1,
-2.116478, -0.894836, -2.250277, 1, 0.1019608, 0, 1,
-2.112499, -0.6566874, -2.691419, 1, 0.1098039, 0, 1,
-2.107953, 0.572686, -0.5309088, 1, 0.1137255, 0, 1,
-2.06635, 1.848975, -1.09296, 1, 0.1215686, 0, 1,
-2.049874, -0.3458741, -1.563104, 1, 0.1254902, 0, 1,
-2.033672, 0.5554657, -0.5016291, 1, 0.1333333, 0, 1,
-1.979002, -1.015913, -1.55425, 1, 0.1372549, 0, 1,
-1.963395, -0.1804465, -0.5798152, 1, 0.145098, 0, 1,
-1.919697, -0.347087, -0.8311706, 1, 0.1490196, 0, 1,
-1.912188, -0.5560965, -2.205511, 1, 0.1568628, 0, 1,
-1.906734, 0.7898267, -1.840517, 1, 0.1607843, 0, 1,
-1.872308, 2.183304, -0.7289295, 1, 0.1686275, 0, 1,
-1.870866, 0.1399912, 0.1237492, 1, 0.172549, 0, 1,
-1.870255, 1.419154, -0.5992743, 1, 0.1803922, 0, 1,
-1.858472, -0.721943, -0.64774, 1, 0.1843137, 0, 1,
-1.850407, 0.8308283, 0.1796658, 1, 0.1921569, 0, 1,
-1.842852, 0.928809, -2.184879, 1, 0.1960784, 0, 1,
-1.840097, 0.8603789, -0.5278379, 1, 0.2039216, 0, 1,
-1.835264, 0.6475999, -1.429395, 1, 0.2117647, 0, 1,
-1.82296, 0.4429296, -1.544652, 1, 0.2156863, 0, 1,
-1.793099, 0.3238221, -1.46746, 1, 0.2235294, 0, 1,
-1.781878, -0.9252824, -1.621974, 1, 0.227451, 0, 1,
-1.777306, 0.5673296, -2.493235, 1, 0.2352941, 0, 1,
-1.769982, 1.610104, 1.271242, 1, 0.2392157, 0, 1,
-1.764175, -0.4981582, -1.891456, 1, 0.2470588, 0, 1,
-1.764147, -0.04416252, -1.885008, 1, 0.2509804, 0, 1,
-1.763836, 0.06809422, -2.073644, 1, 0.2588235, 0, 1,
-1.760592, 0.5443373, -1.284678, 1, 0.2627451, 0, 1,
-1.74614, -0.003279027, -2.154144, 1, 0.2705882, 0, 1,
-1.740376, -1.360088, -4.569755, 1, 0.2745098, 0, 1,
-1.72388, -1.247198, -3.516962, 1, 0.282353, 0, 1,
-1.710117, 0.6442043, -0.03065324, 1, 0.2862745, 0, 1,
-1.701148, -0.8836014, -1.670644, 1, 0.2941177, 0, 1,
-1.695925, -0.9160786, -2.795663, 1, 0.3019608, 0, 1,
-1.681263, -0.9663655, -3.097312, 1, 0.3058824, 0, 1,
-1.666853, -0.6418623, -1.870604, 1, 0.3137255, 0, 1,
-1.662401, -2.717093, -1.689216, 1, 0.3176471, 0, 1,
-1.65545, -0.4826495, -1.696579, 1, 0.3254902, 0, 1,
-1.65452, 1.57737, 1.384489, 1, 0.3294118, 0, 1,
-1.653283, -0.9184158, 0.009638314, 1, 0.3372549, 0, 1,
-1.636636, -0.007651007, -2.693665, 1, 0.3411765, 0, 1,
-1.626365, 1.000598, -2.269211, 1, 0.3490196, 0, 1,
-1.613309, 0.2289632, -1.477136, 1, 0.3529412, 0, 1,
-1.609916, -0.4087333, -1.010229, 1, 0.3607843, 0, 1,
-1.60838, 0.1396191, -0.4048898, 1, 0.3647059, 0, 1,
-1.604171, 0.1041662, -1.722786, 1, 0.372549, 0, 1,
-1.596199, 0.2677579, -0.4703197, 1, 0.3764706, 0, 1,
-1.578981, 0.01267979, -2.778845, 1, 0.3843137, 0, 1,
-1.549004, -0.009903089, -0.5299702, 1, 0.3882353, 0, 1,
-1.543265, -0.9551474, -1.449861, 1, 0.3960784, 0, 1,
-1.530715, -2.342845, -1.849122, 1, 0.4039216, 0, 1,
-1.523686, 1.416712, -0.6406459, 1, 0.4078431, 0, 1,
-1.521527, 0.2666469, -1.766258, 1, 0.4156863, 0, 1,
-1.516727, -0.3069558, -1.130519, 1, 0.4196078, 0, 1,
-1.510909, 1.35792, -1.028088, 1, 0.427451, 0, 1,
-1.510842, 0.2585361, -2.524574, 1, 0.4313726, 0, 1,
-1.506774, 0.4034154, -1.713136, 1, 0.4392157, 0, 1,
-1.502742, -0.6428642, -2.356719, 1, 0.4431373, 0, 1,
-1.498405, 1.257321, -1.753132, 1, 0.4509804, 0, 1,
-1.498048, 0.1652031, -1.686256, 1, 0.454902, 0, 1,
-1.485273, 1.366364, -0.6961666, 1, 0.4627451, 0, 1,
-1.47779, 0.5118347, -0.3989348, 1, 0.4666667, 0, 1,
-1.474335, 1.492157, -0.9976383, 1, 0.4745098, 0, 1,
-1.474071, -1.153098, -3.272746, 1, 0.4784314, 0, 1,
-1.453218, -0.9447522, -1.599543, 1, 0.4862745, 0, 1,
-1.448327, 0.5711261, -1.257434, 1, 0.4901961, 0, 1,
-1.44715, -1.171329, -0.3055493, 1, 0.4980392, 0, 1,
-1.445574, 0.9645238, -2.961667, 1, 0.5058824, 0, 1,
-1.44246, -0.5953252, -2.030989, 1, 0.509804, 0, 1,
-1.426469, 0.6049293, -0.4731947, 1, 0.5176471, 0, 1,
-1.413575, -0.08638545, -2.763694, 1, 0.5215687, 0, 1,
-1.411236, 2.076462, 1.041745, 1, 0.5294118, 0, 1,
-1.410902, 0.4930103, 0.4317892, 1, 0.5333334, 0, 1,
-1.388628, -0.3318244, 0.4506994, 1, 0.5411765, 0, 1,
-1.387247, 0.5217116, -2.437216, 1, 0.5450981, 0, 1,
-1.386304, -1.009875, -1.305379, 1, 0.5529412, 0, 1,
-1.381811, 0.3498215, -1.769491, 1, 0.5568628, 0, 1,
-1.362594, 0.06670959, -1.071476, 1, 0.5647059, 0, 1,
-1.361355, -0.4022397, -1.673622, 1, 0.5686275, 0, 1,
-1.35919, 0.5470104, -0.8167751, 1, 0.5764706, 0, 1,
-1.354004, 0.7864359, -2.880747, 1, 0.5803922, 0, 1,
-1.353455, 0.6724255, -1.784141, 1, 0.5882353, 0, 1,
-1.347864, 0.2362088, -0.6694333, 1, 0.5921569, 0, 1,
-1.344107, 0.2627069, -0.4302007, 1, 0.6, 0, 1,
-1.336367, 0.07794452, -1.887832, 1, 0.6078432, 0, 1,
-1.328893, 0.4441675, -2.652378, 1, 0.6117647, 0, 1,
-1.318805, 0.539027, -0.200175, 1, 0.6196079, 0, 1,
-1.317263, 0.3716331, -0.9478161, 1, 0.6235294, 0, 1,
-1.315173, -0.3751159, -1.120034, 1, 0.6313726, 0, 1,
-1.308864, -0.7882754, -2.523092, 1, 0.6352941, 0, 1,
-1.308675, -0.6290022, -1.881943, 1, 0.6431373, 0, 1,
-1.302803, 1.134525, -0.1067333, 1, 0.6470588, 0, 1,
-1.299296, -0.8294694, -0.7601299, 1, 0.654902, 0, 1,
-1.297052, -0.5268347, -2.219792, 1, 0.6588235, 0, 1,
-1.290454, -1.453451, -1.830933, 1, 0.6666667, 0, 1,
-1.289932, 2.337791, -0.4326816, 1, 0.6705883, 0, 1,
-1.285102, 0.8773227, -2.186295, 1, 0.6784314, 0, 1,
-1.283852, 0.3819526, -3.000259, 1, 0.682353, 0, 1,
-1.281719, -0.1992903, -1.412253, 1, 0.6901961, 0, 1,
-1.274891, 0.2534359, -0.2223638, 1, 0.6941177, 0, 1,
-1.273864, 0.1462224, -1.042691, 1, 0.7019608, 0, 1,
-1.271158, -0.0880679, -2.601024, 1, 0.7098039, 0, 1,
-1.268766, -0.715396, -3.999972, 1, 0.7137255, 0, 1,
-1.266915, 1.184766, -0.33321, 1, 0.7215686, 0, 1,
-1.266892, -1.042321, -1.963527, 1, 0.7254902, 0, 1,
-1.263504, -0.3043237, -1.432299, 1, 0.7333333, 0, 1,
-1.257205, 0.01253804, -3.208534, 1, 0.7372549, 0, 1,
-1.251916, 0.7033659, -1.429053, 1, 0.7450981, 0, 1,
-1.250915, -0.0682687, -2.006796, 1, 0.7490196, 0, 1,
-1.250006, 0.04367822, -2.032872, 1, 0.7568628, 0, 1,
-1.243953, 1.065837, -3.118008, 1, 0.7607843, 0, 1,
-1.240772, 0.4802344, -0.6737046, 1, 0.7686275, 0, 1,
-1.237607, -1.024427, -2.927683, 1, 0.772549, 0, 1,
-1.236967, -1.722806, -2.692559, 1, 0.7803922, 0, 1,
-1.226922, -1.698388, -2.11961, 1, 0.7843137, 0, 1,
-1.223278, 0.4931158, -0.7591513, 1, 0.7921569, 0, 1,
-1.221611, -0.2335044, -2.795653, 1, 0.7960784, 0, 1,
-1.216659, 1.39795, -0.04157153, 1, 0.8039216, 0, 1,
-1.216345, -0.1576852, -2.198244, 1, 0.8117647, 0, 1,
-1.209835, -0.5978115, -2.649424, 1, 0.8156863, 0, 1,
-1.209584, 0.6024551, 0.7848155, 1, 0.8235294, 0, 1,
-1.208855, -0.5082548, -2.613378, 1, 0.827451, 0, 1,
-1.206433, -1.97704, -3.456202, 1, 0.8352941, 0, 1,
-1.205406, -0.4683672, -3.580855, 1, 0.8392157, 0, 1,
-1.202027, -0.3577, -1.89781, 1, 0.8470588, 0, 1,
-1.200834, -0.3277275, -1.949062, 1, 0.8509804, 0, 1,
-1.200122, -0.168439, -1.27048, 1, 0.8588235, 0, 1,
-1.198065, -0.03049445, -2.871875, 1, 0.8627451, 0, 1,
-1.188692, -0.9039648, -2.860148, 1, 0.8705882, 0, 1,
-1.185958, -0.971136, -3.247388, 1, 0.8745098, 0, 1,
-1.182958, 1.570864, -0.6520939, 1, 0.8823529, 0, 1,
-1.182768, 0.8131751, -2.208722, 1, 0.8862745, 0, 1,
-1.174187, -1.884451, -2.867771, 1, 0.8941177, 0, 1,
-1.172919, -0.08351727, -2.586705, 1, 0.8980392, 0, 1,
-1.156836, -0.7386586, -1.591003, 1, 0.9058824, 0, 1,
-1.144234, -0.575735, -1.50438, 1, 0.9137255, 0, 1,
-1.133338, 0.9058974, -0.6563155, 1, 0.9176471, 0, 1,
-1.132949, -0.4366178, -0.3576652, 1, 0.9254902, 0, 1,
-1.118205, 0.2885663, -1.908223, 1, 0.9294118, 0, 1,
-1.116661, -0.271692, -3.211059, 1, 0.9372549, 0, 1,
-1.111722, 1.155338, -0.07605629, 1, 0.9411765, 0, 1,
-1.108544, 0.8738835, -0.4417276, 1, 0.9490196, 0, 1,
-1.107371, -1.20111, -4.156835, 1, 0.9529412, 0, 1,
-1.105693, 1.993562, 0.8880401, 1, 0.9607843, 0, 1,
-1.103456, 1.594845, -0.5564858, 1, 0.9647059, 0, 1,
-1.101912, 0.3806215, -0.9109023, 1, 0.972549, 0, 1,
-1.095085, 0.04371397, -1.824791, 1, 0.9764706, 0, 1,
-1.09173, -0.7996595, -1.180968, 1, 0.9843137, 0, 1,
-1.083338, -0.04338834, -1.817287, 1, 0.9882353, 0, 1,
-1.081155, 0.4253916, -1.282208, 1, 0.9960784, 0, 1,
-1.0624, -0.1326418, -2.34422, 0.9960784, 1, 0, 1,
-1.053647, 1.189543, -0.3306249, 0.9921569, 1, 0, 1,
-1.051007, 1.074209, 0.5140824, 0.9843137, 1, 0, 1,
-1.049077, 0.7195028, -0.7201388, 0.9803922, 1, 0, 1,
-1.047848, -0.8595007, -0.6702873, 0.972549, 1, 0, 1,
-1.046364, 0.0700253, -2.102408, 0.9686275, 1, 0, 1,
-1.03107, 0.5844172, -0.547175, 0.9607843, 1, 0, 1,
-1.023147, -0.3932287, -2.776401, 0.9568627, 1, 0, 1,
-1.023063, 0.4511197, -0.8799529, 0.9490196, 1, 0, 1,
-1.012464, 0.364764, -2.799957, 0.945098, 1, 0, 1,
-1.007974, 0.03450154, -1.700082, 0.9372549, 1, 0, 1,
-1.001808, 0.5765455, 0.08150079, 0.9333333, 1, 0, 1,
-1.001256, 1.050556, -0.431243, 0.9254902, 1, 0, 1,
-1.001026, 1.364254, -0.5765281, 0.9215686, 1, 0, 1,
-0.9949073, -0.4086221, -1.95628, 0.9137255, 1, 0, 1,
-0.9943286, 0.5098897, -1.477762, 0.9098039, 1, 0, 1,
-0.9866284, -1.501954, -2.49253, 0.9019608, 1, 0, 1,
-0.9830033, -1.031724, -3.706833, 0.8941177, 1, 0, 1,
-0.9722632, -0.8043373, -3.809199, 0.8901961, 1, 0, 1,
-0.9710751, -1.159179, -1.745942, 0.8823529, 1, 0, 1,
-0.9677218, 0.6295173, 0.3187341, 0.8784314, 1, 0, 1,
-0.9633983, -0.5338992, -2.118831, 0.8705882, 1, 0, 1,
-0.9577951, -0.1786682, -0.7538031, 0.8666667, 1, 0, 1,
-0.9566829, -0.7469276, -2.86728, 0.8588235, 1, 0, 1,
-0.9556594, -1.545983, -3.726517, 0.854902, 1, 0, 1,
-0.9550749, -0.08179104, -1.634737, 0.8470588, 1, 0, 1,
-0.9497153, -0.8914385, -2.731019, 0.8431373, 1, 0, 1,
-0.9447064, 0.2963514, -2.398161, 0.8352941, 1, 0, 1,
-0.9396495, 0.952114, -2.430147, 0.8313726, 1, 0, 1,
-0.9393015, 0.8397394, -1.865867, 0.8235294, 1, 0, 1,
-0.9375325, -0.98345, -3.368617, 0.8196079, 1, 0, 1,
-0.9314783, -0.8764197, -2.846162, 0.8117647, 1, 0, 1,
-0.9272859, -1.103648, -1.470132, 0.8078431, 1, 0, 1,
-0.9219907, 0.3556551, 0.3610601, 0.8, 1, 0, 1,
-0.9158942, -0.550583, -3.054118, 0.7921569, 1, 0, 1,
-0.9145672, -0.1569263, -2.100047, 0.7882353, 1, 0, 1,
-0.9099356, 0.4504249, -0.8007123, 0.7803922, 1, 0, 1,
-0.9043907, -0.000323113, -0.9809744, 0.7764706, 1, 0, 1,
-0.8820116, 0.6834059, 0.9817241, 0.7686275, 1, 0, 1,
-0.8810953, -1.783919, -3.482784, 0.7647059, 1, 0, 1,
-0.8749363, -1.248945, -0.8741486, 0.7568628, 1, 0, 1,
-0.874276, -0.2863305, -2.502255, 0.7529412, 1, 0, 1,
-0.8687874, -0.1573696, -1.245202, 0.7450981, 1, 0, 1,
-0.8672751, 0.03941288, -0.5184229, 0.7411765, 1, 0, 1,
-0.8609781, 0.4656536, -0.1513951, 0.7333333, 1, 0, 1,
-0.8576092, 0.7061208, -1.318901, 0.7294118, 1, 0, 1,
-0.855924, 0.8639697, -0.9555105, 0.7215686, 1, 0, 1,
-0.8549832, -0.3418844, -1.963179, 0.7176471, 1, 0, 1,
-0.8537529, -0.1132536, -0.8896892, 0.7098039, 1, 0, 1,
-0.8514276, 0.7545656, -2.422481, 0.7058824, 1, 0, 1,
-0.8509573, 1.639609, -2.328174, 0.6980392, 1, 0, 1,
-0.8502995, -0.7486632, -1.996953, 0.6901961, 1, 0, 1,
-0.848797, -0.9680598, -1.445387, 0.6862745, 1, 0, 1,
-0.8485057, 2.047371, 0.7939034, 0.6784314, 1, 0, 1,
-0.8477703, -0.3589893, -1.912849, 0.6745098, 1, 0, 1,
-0.8442084, -0.3721763, -3.308591, 0.6666667, 1, 0, 1,
-0.8431024, 0.1443108, -1.423875, 0.6627451, 1, 0, 1,
-0.8426001, 0.3395309, 0.199549, 0.654902, 1, 0, 1,
-0.8411788, -0.6647825, -0.7493566, 0.6509804, 1, 0, 1,
-0.831491, -0.4570997, -2.171896, 0.6431373, 1, 0, 1,
-0.8235271, 0.1229565, -1.569039, 0.6392157, 1, 0, 1,
-0.8170264, 0.04986293, 0.6367903, 0.6313726, 1, 0, 1,
-0.8150933, -2.338101, -4.712082, 0.627451, 1, 0, 1,
-0.8150511, 0.7063642, 0.1414909, 0.6196079, 1, 0, 1,
-0.8149681, -0.07706833, -3.751086, 0.6156863, 1, 0, 1,
-0.8108147, 0.884621, -2.993871, 0.6078432, 1, 0, 1,
-0.8029565, -0.03563352, -1.374982, 0.6039216, 1, 0, 1,
-0.7991844, -0.04875743, -0.08966433, 0.5960785, 1, 0, 1,
-0.7980811, 0.4622327, -0.6785629, 0.5882353, 1, 0, 1,
-0.7975172, 0.3408985, -2.000553, 0.5843138, 1, 0, 1,
-0.7923703, 0.2572126, -1.962639, 0.5764706, 1, 0, 1,
-0.7820798, -1.438813, -3.593156, 0.572549, 1, 0, 1,
-0.7815806, 0.3371834, -0.3047224, 0.5647059, 1, 0, 1,
-0.7799149, -0.5320104, -1.283982, 0.5607843, 1, 0, 1,
-0.775747, 1.526781, -0.9768336, 0.5529412, 1, 0, 1,
-0.7753134, -0.004109362, -3.565756, 0.5490196, 1, 0, 1,
-0.7606266, -0.4180923, -1.986294, 0.5411765, 1, 0, 1,
-0.7405374, -1.019427, -4.67275, 0.5372549, 1, 0, 1,
-0.7376405, -1.047341, -1.951409, 0.5294118, 1, 0, 1,
-0.7320147, 0.7434843, -1.199656, 0.5254902, 1, 0, 1,
-0.7289649, 0.2547643, -0.9407918, 0.5176471, 1, 0, 1,
-0.7239645, 0.06036161, -0.6983088, 0.5137255, 1, 0, 1,
-0.7157009, 0.009218745, -1.453626, 0.5058824, 1, 0, 1,
-0.7061732, -1.338659, -3.510633, 0.5019608, 1, 0, 1,
-0.7049483, -1.229459, -3.68903, 0.4941176, 1, 0, 1,
-0.7015613, -0.455197, -3.555987, 0.4862745, 1, 0, 1,
-0.69743, 0.1737121, -1.60416, 0.4823529, 1, 0, 1,
-0.6973528, -0.7147416, -3.311826, 0.4745098, 1, 0, 1,
-0.693889, -0.7114444, -1.526514, 0.4705882, 1, 0, 1,
-0.6852598, 0.1731014, -2.459376, 0.4627451, 1, 0, 1,
-0.6796322, 0.7903682, -1.246263, 0.4588235, 1, 0, 1,
-0.6783329, -0.004457034, -1.27938, 0.4509804, 1, 0, 1,
-0.6729021, 1.424639, 0.9342098, 0.4470588, 1, 0, 1,
-0.6721038, 1.281363, -1.226354, 0.4392157, 1, 0, 1,
-0.6663115, -2.19245, -2.889267, 0.4352941, 1, 0, 1,
-0.6657979, 1.203933, -1.855524, 0.427451, 1, 0, 1,
-0.6649209, 1.036486, -0.1185082, 0.4235294, 1, 0, 1,
-0.6600412, -0.8758967, -0.9235179, 0.4156863, 1, 0, 1,
-0.6595657, -0.05189732, -3.044568, 0.4117647, 1, 0, 1,
-0.6449722, -0.4452139, -0.7254947, 0.4039216, 1, 0, 1,
-0.6410496, -0.6748889, -3.672549, 0.3960784, 1, 0, 1,
-0.6396962, -0.4183234, -2.907966, 0.3921569, 1, 0, 1,
-0.6378132, 0.7341963, -0.9578097, 0.3843137, 1, 0, 1,
-0.6367108, 0.3701188, -2.721919, 0.3803922, 1, 0, 1,
-0.6359575, -1.412115, -3.742241, 0.372549, 1, 0, 1,
-0.6345571, 0.3400714, -1.677122, 0.3686275, 1, 0, 1,
-0.6339148, -0.176927, -2.464549, 0.3607843, 1, 0, 1,
-0.6338917, -0.4146339, -2.150781, 0.3568628, 1, 0, 1,
-0.6334294, -0.1494868, -1.300514, 0.3490196, 1, 0, 1,
-0.6325188, -1.335886, -1.76563, 0.345098, 1, 0, 1,
-0.6311499, 0.5306311, -1.581476, 0.3372549, 1, 0, 1,
-0.6199756, 1.647233, -2.200958, 0.3333333, 1, 0, 1,
-0.618907, -0.03857015, -1.219077, 0.3254902, 1, 0, 1,
-0.6147811, -0.7371836, -1.727245, 0.3215686, 1, 0, 1,
-0.6118158, 0.7149566, -0.1112786, 0.3137255, 1, 0, 1,
-0.6091973, -0.9204846, -2.021939, 0.3098039, 1, 0, 1,
-0.6063294, 1.119057, -3.261262, 0.3019608, 1, 0, 1,
-0.5979494, -1.087353, -1.861291, 0.2941177, 1, 0, 1,
-0.597845, 0.3579895, -0.6619754, 0.2901961, 1, 0, 1,
-0.5969289, 0.6338708, 0.3324061, 0.282353, 1, 0, 1,
-0.5956667, 1.321988, -1.221142, 0.2784314, 1, 0, 1,
-0.5891235, 1.535078, -0.856331, 0.2705882, 1, 0, 1,
-0.5887214, 1.000228, -1.348014, 0.2666667, 1, 0, 1,
-0.5855516, -1.363138, -1.833149, 0.2588235, 1, 0, 1,
-0.5854129, -1.079391, -2.748132, 0.254902, 1, 0, 1,
-0.5787661, 0.05793275, 0.4325281, 0.2470588, 1, 0, 1,
-0.5774, 0.1627633, -1.5626, 0.2431373, 1, 0, 1,
-0.5725288, 0.998273, -0.749767, 0.2352941, 1, 0, 1,
-0.5648636, -0.3366635, -1.8076, 0.2313726, 1, 0, 1,
-0.5631289, 1.036146, -0.4689127, 0.2235294, 1, 0, 1,
-0.5573024, -0.9756369, -1.38459, 0.2196078, 1, 0, 1,
-0.5565427, -0.3416393, -0.9043484, 0.2117647, 1, 0, 1,
-0.5526428, 0.4448833, -0.3168958, 0.2078431, 1, 0, 1,
-0.5497729, -1.232547, -2.610282, 0.2, 1, 0, 1,
-0.5478907, -0.05587401, -1.697936, 0.1921569, 1, 0, 1,
-0.5471229, 0.1220976, 0.8309399, 0.1882353, 1, 0, 1,
-0.5461378, 1.341603, -2.458991, 0.1803922, 1, 0, 1,
-0.5449852, -1.966375, -3.090899, 0.1764706, 1, 0, 1,
-0.542348, 0.5859697, -0.3933971, 0.1686275, 1, 0, 1,
-0.5399289, 0.872209, -0.5364492, 0.1647059, 1, 0, 1,
-0.533212, 2.520756, -0.8552315, 0.1568628, 1, 0, 1,
-0.5304527, 0.5179669, -0.3861134, 0.1529412, 1, 0, 1,
-0.5280752, 0.07728703, -2.706418, 0.145098, 1, 0, 1,
-0.5253259, -0.7336501, -1.893376, 0.1411765, 1, 0, 1,
-0.518585, 0.4403507, 0.03630437, 0.1333333, 1, 0, 1,
-0.5159283, 0.02366258, -1.533416, 0.1294118, 1, 0, 1,
-0.5134153, -0.7035456, -1.767599, 0.1215686, 1, 0, 1,
-0.5045594, 0.6026595, -0.7313644, 0.1176471, 1, 0, 1,
-0.5042209, 1.37103, 1.009126, 0.1098039, 1, 0, 1,
-0.5030031, 0.920108, 0.1855981, 0.1058824, 1, 0, 1,
-0.5029526, 0.7065143, -0.118447, 0.09803922, 1, 0, 1,
-0.4995409, -0.7337989, -2.35488, 0.09019608, 1, 0, 1,
-0.4992931, 0.07906169, -3.208331, 0.08627451, 1, 0, 1,
-0.4966293, 1.506514, 0.6317902, 0.07843138, 1, 0, 1,
-0.4932256, 0.3509733, -2.642938, 0.07450981, 1, 0, 1,
-0.4913194, -0.838496, -2.09149, 0.06666667, 1, 0, 1,
-0.4913082, 1.068828, 0.1324396, 0.0627451, 1, 0, 1,
-0.4880728, 1.400079, -0.5489386, 0.05490196, 1, 0, 1,
-0.4876788, -1.195036, -3.564694, 0.05098039, 1, 0, 1,
-0.4871556, 0.07690662, -1.395484, 0.04313726, 1, 0, 1,
-0.4839257, 1.970156, -1.60551, 0.03921569, 1, 0, 1,
-0.4801367, 0.8419151, -1.5216, 0.03137255, 1, 0, 1,
-0.4791129, 0.7700055, 0.4733795, 0.02745098, 1, 0, 1,
-0.4783502, -0.5580893, -3.258507, 0.01960784, 1, 0, 1,
-0.4735491, -0.4204684, -2.197577, 0.01568628, 1, 0, 1,
-0.4727648, -0.8568356, -3.378014, 0.007843138, 1, 0, 1,
-0.4719549, 0.8347459, -0.050648, 0.003921569, 1, 0, 1,
-0.4712189, 1.369869, -1.589377, 0, 1, 0.003921569, 1,
-0.4654969, 0.8648919, 0.5208905, 0, 1, 0.01176471, 1,
-0.4601792, 1.00526, -0.3275161, 0, 1, 0.01568628, 1,
-0.4585261, 0.0409807, -0.851427, 0, 1, 0.02352941, 1,
-0.4538025, 0.9196087, -0.5014173, 0, 1, 0.02745098, 1,
-0.4532486, 1.028844, -1.489501, 0, 1, 0.03529412, 1,
-0.4502398, -0.222599, -2.374299, 0, 1, 0.03921569, 1,
-0.4467866, 1.069123, -0.05606713, 0, 1, 0.04705882, 1,
-0.4410912, 1.087172, -1.992312, 0, 1, 0.05098039, 1,
-0.4383509, -0.9706853, -3.580447, 0, 1, 0.05882353, 1,
-0.438232, 0.08286842, -1.289937, 0, 1, 0.0627451, 1,
-0.435948, 0.6094567, -1.036331, 0, 1, 0.07058824, 1,
-0.435708, 0.1114882, -2.366257, 0, 1, 0.07450981, 1,
-0.4334565, 1.096638, 0.723537, 0, 1, 0.08235294, 1,
-0.4330199, -0.06009318, -1.923722, 0, 1, 0.08627451, 1,
-0.4299349, 0.1973511, -0.893296, 0, 1, 0.09411765, 1,
-0.4247243, 0.5756828, -0.2326515, 0, 1, 0.1019608, 1,
-0.4241472, 1.02186, 0.2864656, 0, 1, 0.1058824, 1,
-0.4237574, -0.06974447, -0.6196158, 0, 1, 0.1137255, 1,
-0.4167592, -0.8248647, -0.8756632, 0, 1, 0.1176471, 1,
-0.4166751, -1.297926, -3.612588, 0, 1, 0.1254902, 1,
-0.4120829, 2.471081, 1.169483, 0, 1, 0.1294118, 1,
-0.4107092, -0.460552, -2.840067, 0, 1, 0.1372549, 1,
-0.4101763, -1.087975, -3.665447, 0, 1, 0.1411765, 1,
-0.4092814, 0.5412561, 0.6016494, 0, 1, 0.1490196, 1,
-0.4084666, 1.280885, -2.515121, 0, 1, 0.1529412, 1,
-0.4083597, -0.8935543, -1.157454, 0, 1, 0.1607843, 1,
-0.4074981, 0.1636742, -0.4790385, 0, 1, 0.1647059, 1,
-0.4067486, -0.6484311, -3.54889, 0, 1, 0.172549, 1,
-0.4061419, 0.2102081, -1.871648, 0, 1, 0.1764706, 1,
-0.4019345, -0.3475858, -1.414703, 0, 1, 0.1843137, 1,
-0.4011598, 0.6575658, -0.8566735, 0, 1, 0.1882353, 1,
-0.4003098, 3.112437, 0.3748562, 0, 1, 0.1960784, 1,
-0.3935234, 0.2587698, -0.1317859, 0, 1, 0.2039216, 1,
-0.3912446, -1.286587, -3.092497, 0, 1, 0.2078431, 1,
-0.390796, 0.04444593, -1.317572, 0, 1, 0.2156863, 1,
-0.3885063, 0.2800712, -0.770551, 0, 1, 0.2196078, 1,
-0.3871959, -0.197662, -1.817625, 0, 1, 0.227451, 1,
-0.383154, -0.2170493, -1.154495, 0, 1, 0.2313726, 1,
-0.3795504, -1.046053, -1.964943, 0, 1, 0.2392157, 1,
-0.379012, -0.3619888, -1.86815, 0, 1, 0.2431373, 1,
-0.375824, 1.044069, -0.300611, 0, 1, 0.2509804, 1,
-0.3737684, -1.119719, -1.922238, 0, 1, 0.254902, 1,
-0.3681519, 1.337399, 0.04431736, 0, 1, 0.2627451, 1,
-0.365344, 1.333234, 1.010864, 0, 1, 0.2666667, 1,
-0.3645554, -0.1229463, -2.193259, 0, 1, 0.2745098, 1,
-0.3639792, -0.2693834, -0.9540725, 0, 1, 0.2784314, 1,
-0.3636121, -1.066455, -3.441355, 0, 1, 0.2862745, 1,
-0.357864, 0.7567748, 0.3544034, 0, 1, 0.2901961, 1,
-0.356438, -0.03939898, -2.474503, 0, 1, 0.2980392, 1,
-0.3562716, -0.06030964, -2.330686, 0, 1, 0.3058824, 1,
-0.3553632, -0.622133, -1.311179, 0, 1, 0.3098039, 1,
-0.3506327, 0.00200758, -2.006524, 0, 1, 0.3176471, 1,
-0.344009, 0.02481855, -2.500296, 0, 1, 0.3215686, 1,
-0.342362, 1.262628, -0.4173325, 0, 1, 0.3294118, 1,
-0.3390166, -0.2201359, -3.053706, 0, 1, 0.3333333, 1,
-0.3234653, 1.554627, -0.7082579, 0, 1, 0.3411765, 1,
-0.3203239, -0.7522067, -3.200654, 0, 1, 0.345098, 1,
-0.3160484, -0.8287954, -4.804641, 0, 1, 0.3529412, 1,
-0.3108456, -1.536808, -3.746706, 0, 1, 0.3568628, 1,
-0.3092598, 0.393507, 1.896834, 0, 1, 0.3647059, 1,
-0.3070454, -0.0122944, -1.030753, 0, 1, 0.3686275, 1,
-0.3033604, -1.634443, -0.5399458, 0, 1, 0.3764706, 1,
-0.3021809, -1.187719, -3.023195, 0, 1, 0.3803922, 1,
-0.3002194, -0.9882491, -2.747007, 0, 1, 0.3882353, 1,
-0.2979527, -1.190033, -3.359998, 0, 1, 0.3921569, 1,
-0.2927861, 0.3379627, -0.839005, 0, 1, 0.4, 1,
-0.2912215, -0.8570263, -3.026246, 0, 1, 0.4078431, 1,
-0.2897715, -0.8597882, -3.14434, 0, 1, 0.4117647, 1,
-0.2891098, 0.4180394, 0.1991426, 0, 1, 0.4196078, 1,
-0.2869183, 0.5105607, -2.788167, 0, 1, 0.4235294, 1,
-0.2867031, -0.9552253, -3.080972, 0, 1, 0.4313726, 1,
-0.2850136, 0.5593821, -0.7129374, 0, 1, 0.4352941, 1,
-0.2791966, 0.1752447, -0.9357765, 0, 1, 0.4431373, 1,
-0.2761594, -0.3530504, -2.853231, 0, 1, 0.4470588, 1,
-0.2703767, 0.2000178, -2.68811, 0, 1, 0.454902, 1,
-0.2632081, 0.8516477, -1.151914, 0, 1, 0.4588235, 1,
-0.2629017, -0.4364069, -1.487498, 0, 1, 0.4666667, 1,
-0.2608682, -0.5756693, -2.293906, 0, 1, 0.4705882, 1,
-0.2591082, -0.5139472, -2.98949, 0, 1, 0.4784314, 1,
-0.2564478, -1.670267, -2.748267, 0, 1, 0.4823529, 1,
-0.2563626, -0.4799668, -1.751365, 0, 1, 0.4901961, 1,
-0.2522534, 2.667818, -0.9072676, 0, 1, 0.4941176, 1,
-0.2497155, -0.1721214, -1.918066, 0, 1, 0.5019608, 1,
-0.248342, 0.1760239, -1.525362, 0, 1, 0.509804, 1,
-0.2478824, 0.67665, 0.7931746, 0, 1, 0.5137255, 1,
-0.2465641, -0.9751979, -1.674925, 0, 1, 0.5215687, 1,
-0.2448473, -0.6059539, -3.993784, 0, 1, 0.5254902, 1,
-0.2442964, -0.1486171, -2.129198, 0, 1, 0.5333334, 1,
-0.2402464, 1.150837, -0.4485662, 0, 1, 0.5372549, 1,
-0.2378115, 0.874277, -0.09118921, 0, 1, 0.5450981, 1,
-0.2328693, 0.7200137, 0.7053024, 0, 1, 0.5490196, 1,
-0.2322864, -0.2233839, -3.172025, 0, 1, 0.5568628, 1,
-0.2319441, 0.68151, -0.08243829, 0, 1, 0.5607843, 1,
-0.2307205, 0.5113979, -1.00499, 0, 1, 0.5686275, 1,
-0.228686, -0.2110728, -2.048738, 0, 1, 0.572549, 1,
-0.2259153, 0.5687962, 1.145611, 0, 1, 0.5803922, 1,
-0.2255593, 0.6144415, -0.6165965, 0, 1, 0.5843138, 1,
-0.2237981, -1.021711, -2.732057, 0, 1, 0.5921569, 1,
-0.2211169, 0.09152753, -2.447415, 0, 1, 0.5960785, 1,
-0.2192845, -1.551034, -2.120417, 0, 1, 0.6039216, 1,
-0.2185611, 1.599636, 0.629733, 0, 1, 0.6117647, 1,
-0.2174513, 1.234761, -0.6748533, 0, 1, 0.6156863, 1,
-0.2153604, 0.3916845, -1.205124, 0, 1, 0.6235294, 1,
-0.2138953, -0.3537819, -2.530125, 0, 1, 0.627451, 1,
-0.2126704, -1.663295, -3.185685, 0, 1, 0.6352941, 1,
-0.2120387, 1.892898, -1.525131, 0, 1, 0.6392157, 1,
-0.2106135, -0.5638804, -2.554718, 0, 1, 0.6470588, 1,
-0.2095424, 1.224853, 0.9677066, 0, 1, 0.6509804, 1,
-0.2073296, -1.476177, -3.749519, 0, 1, 0.6588235, 1,
-0.19779, 0.03241765, -1.965995, 0, 1, 0.6627451, 1,
-0.1962928, -0.9306405, -2.878695, 0, 1, 0.6705883, 1,
-0.1917852, 1.472749, -0.7430487, 0, 1, 0.6745098, 1,
-0.191427, 0.6710586, -2.107664, 0, 1, 0.682353, 1,
-0.1911871, -0.3909111, -2.808941, 0, 1, 0.6862745, 1,
-0.1908094, 0.4284337, 0.204053, 0, 1, 0.6941177, 1,
-0.1904017, 2.558609, -0.06225532, 0, 1, 0.7019608, 1,
-0.1853272, -0.4580092, -2.194347, 0, 1, 0.7058824, 1,
-0.1840792, -0.5666015, -2.448203, 0, 1, 0.7137255, 1,
-0.1822112, 0.8556351, -2.833062, 0, 1, 0.7176471, 1,
-0.1791034, 1.227425, -0.1846691, 0, 1, 0.7254902, 1,
-0.1776665, 0.4331603, 1.522935, 0, 1, 0.7294118, 1,
-0.1745729, 0.08704913, -0.05528176, 0, 1, 0.7372549, 1,
-0.1741391, 0.5565941, 0.4271227, 0, 1, 0.7411765, 1,
-0.1734815, 0.4044282, -1.072207, 0, 1, 0.7490196, 1,
-0.1664357, -0.8083507, -2.572659, 0, 1, 0.7529412, 1,
-0.164412, 0.6305146, -1.82659, 0, 1, 0.7607843, 1,
-0.1630285, -0.5499641, -2.975811, 0, 1, 0.7647059, 1,
-0.1620838, 0.8648846, 1.251671, 0, 1, 0.772549, 1,
-0.1593204, 0.3910974, -2.800924, 0, 1, 0.7764706, 1,
-0.157227, 0.4460779, -0.00361746, 0, 1, 0.7843137, 1,
-0.1537828, -0.2677463, -3.806646, 0, 1, 0.7882353, 1,
-0.1494971, 0.2805846, -1.529222, 0, 1, 0.7960784, 1,
-0.14777, -0.8203037, -3.654923, 0, 1, 0.8039216, 1,
-0.1471924, 1.160283, -1.841691, 0, 1, 0.8078431, 1,
-0.143466, -1.184289, -3.554341, 0, 1, 0.8156863, 1,
-0.1322191, 2.11125, 2.331394, 0, 1, 0.8196079, 1,
-0.1314332, -1.627471, -4.649589, 0, 1, 0.827451, 1,
-0.1282798, 0.383938, -0.1866874, 0, 1, 0.8313726, 1,
-0.1268774, -0.3850706, -1.984297, 0, 1, 0.8392157, 1,
-0.1256959, 0.7633026, -0.7306387, 0, 1, 0.8431373, 1,
-0.1230276, -0.1832257, -1.926547, 0, 1, 0.8509804, 1,
-0.1177724, -0.744801, -2.592329, 0, 1, 0.854902, 1,
-0.1173139, -0.2176886, -2.159605, 0, 1, 0.8627451, 1,
-0.1120725, 0.5075621, -0.2303381, 0, 1, 0.8666667, 1,
-0.1117655, -0.7033855, -3.908715, 0, 1, 0.8745098, 1,
-0.1117049, 0.312264, 0.1387231, 0, 1, 0.8784314, 1,
-0.1115264, -0.4204789, -2.25861, 0, 1, 0.8862745, 1,
-0.1103148, 1.150428, 0.6624361, 0, 1, 0.8901961, 1,
-0.109299, -0.5640827, -2.727922, 0, 1, 0.8980392, 1,
-0.1081569, -0.33272, -0.6042076, 0, 1, 0.9058824, 1,
-0.1078091, 2.146783, 0.0511606, 0, 1, 0.9098039, 1,
-0.1074736, -2.227875, -3.30887, 0, 1, 0.9176471, 1,
-0.1041362, -0.2365584, -2.834654, 0, 1, 0.9215686, 1,
-0.1022661, 0.5261917, 1.081059, 0, 1, 0.9294118, 1,
-0.1014833, 1.533014, 0.4078492, 0, 1, 0.9333333, 1,
-0.09979266, -0.0042717, -0.4020608, 0, 1, 0.9411765, 1,
-0.09889459, 0.1311566, -1.664401, 0, 1, 0.945098, 1,
-0.09767843, -0.09122632, -2.330469, 0, 1, 0.9529412, 1,
-0.0929115, -0.7241235, -3.243636, 0, 1, 0.9568627, 1,
-0.08926747, -0.6977893, -2.60024, 0, 1, 0.9647059, 1,
-0.08076584, -0.6028752, -3.445226, 0, 1, 0.9686275, 1,
-0.07989042, 1.138026, 0.7696457, 0, 1, 0.9764706, 1,
-0.07741002, 0.4048104, -0.2073644, 0, 1, 0.9803922, 1,
-0.07565894, -0.2154205, -2.271657, 0, 1, 0.9882353, 1,
-0.07003125, -1.449575, -3.231353, 0, 1, 0.9921569, 1,
-0.06720005, -0.05128739, -0.2324963, 0, 1, 1, 1,
-0.06365797, -0.2644735, -4.245446, 0, 0.9921569, 1, 1,
-0.06322268, -0.6632397, -0.4344521, 0, 0.9882353, 1, 1,
-0.0598578, -0.1899417, -0.7990311, 0, 0.9803922, 1, 1,
-0.05879376, 0.4883036, -2.663161, 0, 0.9764706, 1, 1,
-0.0559923, -1.604489, -1.435478, 0, 0.9686275, 1, 1,
-0.04938293, -1.425673, -3.262071, 0, 0.9647059, 1, 1,
-0.04894977, 1.449454, -0.3451084, 0, 0.9568627, 1, 1,
-0.04568074, -1.62161, -3.535001, 0, 0.9529412, 1, 1,
-0.04383344, -1.193353, -1.817007, 0, 0.945098, 1, 1,
-0.03719971, 1.607053, -0.3217229, 0, 0.9411765, 1, 1,
-0.03612884, 1.821975, 1.101663, 0, 0.9333333, 1, 1,
-0.02567147, 0.448372, -0.1865769, 0, 0.9294118, 1, 1,
-0.02270026, -0.503481, -4.082897, 0, 0.9215686, 1, 1,
-0.01729185, 1.890074, -2.106921, 0, 0.9176471, 1, 1,
-0.01688192, 0.7112803, 1.828174, 0, 0.9098039, 1, 1,
-0.01625239, -1.114736, -3.679734, 0, 0.9058824, 1, 1,
-0.01401832, -0.2122373, -3.490327, 0, 0.8980392, 1, 1,
-0.008793726, -0.4397178, -4.917101, 0, 0.8901961, 1, 1,
-0.007691976, 1.953622, -0.4430903, 0, 0.8862745, 1, 1,
-0.007348944, -1.484841, -2.422769, 0, 0.8784314, 1, 1,
-0.006305, -0.7470122, -4.294282, 0, 0.8745098, 1, 1,
-0.00597825, 0.3703557, 0.04540289, 0, 0.8666667, 1, 1,
-0.005356524, 0.5419698, -1.038471, 0, 0.8627451, 1, 1,
-0.004303596, 0.4879698, -0.8875098, 0, 0.854902, 1, 1,
-0.002260139, 0.6420863, -0.8736492, 0, 0.8509804, 1, 1,
-0.001846622, 1.058849, -0.2528644, 0, 0.8431373, 1, 1,
-0.001232542, -1.862305, -1.215288, 0, 0.8392157, 1, 1,
-0.0001053409, 0.9056868, -0.9401414, 0, 0.8313726, 1, 1,
0.005570003, 1.072528, -0.5955731, 0, 0.827451, 1, 1,
0.006090009, -0.3903266, 1.981058, 0, 0.8196079, 1, 1,
0.006278013, 0.6409139, -0.4555736, 0, 0.8156863, 1, 1,
0.006583012, 0.368867, -0.9197687, 0, 0.8078431, 1, 1,
0.006926239, -0.9280333, 4.181098, 0, 0.8039216, 1, 1,
0.009520559, 0.3169079, 1.051249, 0, 0.7960784, 1, 1,
0.01249592, 0.5856469, 0.007580054, 0, 0.7882353, 1, 1,
0.02152929, -0.9423597, 1.921643, 0, 0.7843137, 1, 1,
0.02560288, -0.4345143, 3.082688, 0, 0.7764706, 1, 1,
0.04051468, 1.598033, -0.7638624, 0, 0.772549, 1, 1,
0.04055284, -0.2482892, 3.671014, 0, 0.7647059, 1, 1,
0.0406637, -0.6420375, 2.867251, 0, 0.7607843, 1, 1,
0.04849729, -0.8098897, 3.818613, 0, 0.7529412, 1, 1,
0.04867461, -0.1327032, 4.445895, 0, 0.7490196, 1, 1,
0.04879125, -0.2142682, 2.63508, 0, 0.7411765, 1, 1,
0.04951452, -1.160344, 2.01802, 0, 0.7372549, 1, 1,
0.04999827, -0.9356406, 4.881865, 0, 0.7294118, 1, 1,
0.05419223, -0.9649511, 2.770631, 0, 0.7254902, 1, 1,
0.05457727, 0.2173109, -1.164181, 0, 0.7176471, 1, 1,
0.05656074, -0.6737322, 2.856654, 0, 0.7137255, 1, 1,
0.06651437, -1.177624, 2.785327, 0, 0.7058824, 1, 1,
0.07085413, 1.90159, -0.335161, 0, 0.6980392, 1, 1,
0.07091284, -0.6188182, 3.00391, 0, 0.6941177, 1, 1,
0.07165713, 0.2995972, 2.247185, 0, 0.6862745, 1, 1,
0.0733653, -0.4349442, 4.204733, 0, 0.682353, 1, 1,
0.08062972, -0.646919, 2.02146, 0, 0.6745098, 1, 1,
0.08311675, 0.4448421, 0.4464253, 0, 0.6705883, 1, 1,
0.08469313, -1.04258, 2.461471, 0, 0.6627451, 1, 1,
0.08725742, -0.4688353, 2.032143, 0, 0.6588235, 1, 1,
0.08818367, -1.481269, 4.207485, 0, 0.6509804, 1, 1,
0.0885426, -1.204283, 4.592426, 0, 0.6470588, 1, 1,
0.0921243, 0.6154802, -1.45506, 0, 0.6392157, 1, 1,
0.09239047, 1.568217, 0.6600562, 0, 0.6352941, 1, 1,
0.09410824, -0.5955532, 3.757214, 0, 0.627451, 1, 1,
0.0993636, 0.8004615, 0.3585733, 0, 0.6235294, 1, 1,
0.1000395, -1.014486, 2.772703, 0, 0.6156863, 1, 1,
0.1004593, 2.762713, 0.1515326, 0, 0.6117647, 1, 1,
0.1007352, 0.6724817, -0.2384352, 0, 0.6039216, 1, 1,
0.1024345, 0.3707851, 0.987483, 0, 0.5960785, 1, 1,
0.1037398, -1.454262, 2.35423, 0, 0.5921569, 1, 1,
0.1045398, 1.295459, 0.793814, 0, 0.5843138, 1, 1,
0.1132805, -0.8284724, 3.854219, 0, 0.5803922, 1, 1,
0.1189076, -0.1761544, 3.425869, 0, 0.572549, 1, 1,
0.1193133, 0.4683557, 1.280318, 0, 0.5686275, 1, 1,
0.1240454, -0.7974765, 2.299667, 0, 0.5607843, 1, 1,
0.124711, 1.752238, -0.1752073, 0, 0.5568628, 1, 1,
0.130014, -0.1865202, 4.150738, 0, 0.5490196, 1, 1,
0.1311341, 0.2736783, -0.02365347, 0, 0.5450981, 1, 1,
0.1368974, -0.4884055, 2.673101, 0, 0.5372549, 1, 1,
0.137523, 0.7286027, 0.6995175, 0, 0.5333334, 1, 1,
0.1394241, 0.8176374, -0.09246858, 0, 0.5254902, 1, 1,
0.1457862, -0.3800961, 1.573795, 0, 0.5215687, 1, 1,
0.1462909, 0.1639498, 1.208756, 0, 0.5137255, 1, 1,
0.1466607, 0.6749647, 0.2406706, 0, 0.509804, 1, 1,
0.1492942, 1.136269, -0.4305324, 0, 0.5019608, 1, 1,
0.1499489, -1.19334, 2.654613, 0, 0.4941176, 1, 1,
0.1523702, 0.4808205, 0.5128786, 0, 0.4901961, 1, 1,
0.15342, -0.1588472, 1.340324, 0, 0.4823529, 1, 1,
0.1588046, -0.2556871, 1.447576, 0, 0.4784314, 1, 1,
0.1594103, -0.03078174, 1.24382, 0, 0.4705882, 1, 1,
0.161234, -0.7788514, 2.158726, 0, 0.4666667, 1, 1,
0.1615751, 2.549042, 0.5489329, 0, 0.4588235, 1, 1,
0.1630571, -1.324299, 3.402622, 0, 0.454902, 1, 1,
0.1653158, -0.7681947, 2.738832, 0, 0.4470588, 1, 1,
0.1675148, 0.008243274, 1.282358, 0, 0.4431373, 1, 1,
0.1697388, 0.6218762, -0.4905434, 0, 0.4352941, 1, 1,
0.170198, -0.5008391, 3.571718, 0, 0.4313726, 1, 1,
0.1721471, -2.559558, 3.446398, 0, 0.4235294, 1, 1,
0.1736385, -0.7415538, 3.684949, 0, 0.4196078, 1, 1,
0.1794702, -0.7325329, 2.066997, 0, 0.4117647, 1, 1,
0.1825115, -1.226445, 4.295469, 0, 0.4078431, 1, 1,
0.1827083, 0.4475397, 0.3545673, 0, 0.4, 1, 1,
0.1867824, 0.7457479, 1.474389, 0, 0.3921569, 1, 1,
0.1869674, 1.091323, -0.3785855, 0, 0.3882353, 1, 1,
0.1873452, -0.5022445, 3.603094, 0, 0.3803922, 1, 1,
0.1877749, 0.4266011, -0.658243, 0, 0.3764706, 1, 1,
0.1906385, 1.380175, -0.9819223, 0, 0.3686275, 1, 1,
0.1926186, -0.0526225, 1.437525, 0, 0.3647059, 1, 1,
0.196321, -0.6940447, 2.911561, 0, 0.3568628, 1, 1,
0.1993294, 2.063768, 0.4281355, 0, 0.3529412, 1, 1,
0.2105299, -0.5924191, 2.42455, 0, 0.345098, 1, 1,
0.2113173, 0.6881052, -0.5534068, 0, 0.3411765, 1, 1,
0.2162522, 0.8408537, 0.2016554, 0, 0.3333333, 1, 1,
0.2183604, -0.5142404, 3.020953, 0, 0.3294118, 1, 1,
0.2186057, 0.7413938, -1.464496, 0, 0.3215686, 1, 1,
0.2198285, -0.2813796, 3.4623, 0, 0.3176471, 1, 1,
0.2200756, -0.7096846, 3.510284, 0, 0.3098039, 1, 1,
0.2200826, -0.3713542, 3.040972, 0, 0.3058824, 1, 1,
0.223136, -0.6292251, 4.242167, 0, 0.2980392, 1, 1,
0.2244361, -0.6977543, 0.9761274, 0, 0.2901961, 1, 1,
0.2260962, -0.16624, 0.2438495, 0, 0.2862745, 1, 1,
0.227407, -0.2265399, 2.482832, 0, 0.2784314, 1, 1,
0.2280492, -1.645015, 2.736137, 0, 0.2745098, 1, 1,
0.2287557, -0.6991054, 4.071676, 0, 0.2666667, 1, 1,
0.2290428, 1.914365, 0.7753159, 0, 0.2627451, 1, 1,
0.2303112, 0.9231392, -1.127307, 0, 0.254902, 1, 1,
0.2325641, 1.118358, 1.255867, 0, 0.2509804, 1, 1,
0.2344622, -0.2028181, 2.008145, 0, 0.2431373, 1, 1,
0.2349938, -0.5424563, 1.493286, 0, 0.2392157, 1, 1,
0.2352337, 1.602024, 0.5714379, 0, 0.2313726, 1, 1,
0.2357211, 0.9858209, 1.296396, 0, 0.227451, 1, 1,
0.2361257, -0.1823275, 1.778535, 0, 0.2196078, 1, 1,
0.2393643, 0.4155878, 0.1963806, 0, 0.2156863, 1, 1,
0.2431903, 0.7960963, 0.5325878, 0, 0.2078431, 1, 1,
0.2439798, -0.3905267, 1.362369, 0, 0.2039216, 1, 1,
0.2442715, 0.1692994, 0.5116397, 0, 0.1960784, 1, 1,
0.2443882, -0.4304944, 1.904842, 0, 0.1882353, 1, 1,
0.2460337, 0.1495168, 1.129091, 0, 0.1843137, 1, 1,
0.2497233, -0.1940806, 2.237375, 0, 0.1764706, 1, 1,
0.2514302, 0.7933265, 0.1979085, 0, 0.172549, 1, 1,
0.2585016, -0.1138888, 3.010909, 0, 0.1647059, 1, 1,
0.2592311, -0.2267368, 2.242669, 0, 0.1607843, 1, 1,
0.2633398, -0.471577, 2.549908, 0, 0.1529412, 1, 1,
0.2656795, -1.391759, 2.588066, 0, 0.1490196, 1, 1,
0.2690141, 0.07147571, 0.5664725, 0, 0.1411765, 1, 1,
0.2741042, 0.299505, 1.4038, 0, 0.1372549, 1, 1,
0.2768511, -0.2539105, 1.283375, 0, 0.1294118, 1, 1,
0.2778248, -0.6582752, 2.955691, 0, 0.1254902, 1, 1,
0.2837256, 0.6227441, 2.955411, 0, 0.1176471, 1, 1,
0.288755, -0.3481188, 2.747082, 0, 0.1137255, 1, 1,
0.289555, 0.5325158, 0.7369384, 0, 0.1058824, 1, 1,
0.2915635, 1.576609, 0.3797697, 0, 0.09803922, 1, 1,
0.2977267, -0.7146026, 2.015659, 0, 0.09411765, 1, 1,
0.3012176, -0.3171831, 2.416208, 0, 0.08627451, 1, 1,
0.30311, -1.009673, 2.231065, 0, 0.08235294, 1, 1,
0.3034, -0.8177086, 2.434243, 0, 0.07450981, 1, 1,
0.3042732, -0.09279933, 1.378034, 0, 0.07058824, 1, 1,
0.3094517, 0.0381908, 0.2598738, 0, 0.0627451, 1, 1,
0.3117141, -0.3562063, 1.72155, 0, 0.05882353, 1, 1,
0.3122936, 0.2446223, 2.529581, 0, 0.05098039, 1, 1,
0.3186938, 0.4936868, 0.8283607, 0, 0.04705882, 1, 1,
0.3206338, 0.0191081, 0.728965, 0, 0.03921569, 1, 1,
0.3244316, -0.8171091, 2.212606, 0, 0.03529412, 1, 1,
0.3253981, -0.5590972, 2.423637, 0, 0.02745098, 1, 1,
0.3336829, -0.2900052, 3.285476, 0, 0.02352941, 1, 1,
0.3448936, 0.9572137, -0.4600472, 0, 0.01568628, 1, 1,
0.3476472, -0.1631977, 1.838947, 0, 0.01176471, 1, 1,
0.3485841, -0.3052382, 1.756178, 0, 0.003921569, 1, 1,
0.3524128, 0.485473, 1.609657, 0.003921569, 0, 1, 1,
0.3527377, 0.2004836, 0.5332423, 0.007843138, 0, 1, 1,
0.3544779, -0.6125815, 1.735124, 0.01568628, 0, 1, 1,
0.3598212, -0.8115905, 1.326745, 0.01960784, 0, 1, 1,
0.3642827, 1.481022, 3.391251, 0.02745098, 0, 1, 1,
0.3682938, -0.2251387, 2.422426, 0.03137255, 0, 1, 1,
0.3705744, 1.005113, -0.3045587, 0.03921569, 0, 1, 1,
0.3799336, -0.07057191, 2.810719, 0.04313726, 0, 1, 1,
0.3813657, -0.9986429, 1.183786, 0.05098039, 0, 1, 1,
0.3816645, -0.3500001, 2.151541, 0.05490196, 0, 1, 1,
0.3850801, -0.5021268, 0.8648723, 0.0627451, 0, 1, 1,
0.3867383, 1.637202, -0.2318546, 0.06666667, 0, 1, 1,
0.3871354, -0.6704854, 3.421045, 0.07450981, 0, 1, 1,
0.3871976, 0.4555742, 1.111993, 0.07843138, 0, 1, 1,
0.396734, -0.4962994, 1.604111, 0.08627451, 0, 1, 1,
0.4000663, 1.492047, 0.0217269, 0.09019608, 0, 1, 1,
0.4051741, -0.6599603, 1.219316, 0.09803922, 0, 1, 1,
0.4061238, 0.8989488, -0.7166691, 0.1058824, 0, 1, 1,
0.4125417, 0.2289033, 2.011446, 0.1098039, 0, 1, 1,
0.4149361, 1.123175, -1.155916, 0.1176471, 0, 1, 1,
0.4202156, 0.8813312, 1.296204, 0.1215686, 0, 1, 1,
0.4225901, -1.62458, 5.347823, 0.1294118, 0, 1, 1,
0.4298754, 0.3752853, 0.932645, 0.1333333, 0, 1, 1,
0.4352696, 0.5794322, -1.268797, 0.1411765, 0, 1, 1,
0.4360216, -0.2424794, 2.737646, 0.145098, 0, 1, 1,
0.4422159, 1.870254, 1.154177, 0.1529412, 0, 1, 1,
0.4426711, 0.9959167, 0.6726274, 0.1568628, 0, 1, 1,
0.4450704, -0.224688, 1.881909, 0.1647059, 0, 1, 1,
0.4490506, -1.427515, 2.207878, 0.1686275, 0, 1, 1,
0.4573133, 1.422477, 0.1493544, 0.1764706, 0, 1, 1,
0.4579165, 0.2077636, 0.09605233, 0.1803922, 0, 1, 1,
0.4614061, -0.1312803, 0.9886283, 0.1882353, 0, 1, 1,
0.4614209, -1.559289, 2.129582, 0.1921569, 0, 1, 1,
0.4639684, -0.2167736, 1.151246, 0.2, 0, 1, 1,
0.4672815, 0.06074899, 0.6804378, 0.2078431, 0, 1, 1,
0.4733766, 0.3803634, -0.6738818, 0.2117647, 0, 1, 1,
0.4748765, -1.608435, 2.198364, 0.2196078, 0, 1, 1,
0.4787964, 0.6942675, 1.749313, 0.2235294, 0, 1, 1,
0.4814115, 0.1029724, 1.993002, 0.2313726, 0, 1, 1,
0.4856162, 0.114237, 2.464675, 0.2352941, 0, 1, 1,
0.5003001, 1.250094, 0.4668331, 0.2431373, 0, 1, 1,
0.5004128, -0.4530221, 2.613237, 0.2470588, 0, 1, 1,
0.500462, -0.7880611, 5.240302, 0.254902, 0, 1, 1,
0.5007398, 0.9476553, 0.7580351, 0.2588235, 0, 1, 1,
0.5058981, -0.5267576, 0.6899217, 0.2666667, 0, 1, 1,
0.5080457, -0.9788846, 1.646065, 0.2705882, 0, 1, 1,
0.5123553, -0.5516613, 3.50365, 0.2784314, 0, 1, 1,
0.514295, 0.2319171, 0.5477231, 0.282353, 0, 1, 1,
0.5167088, 1.013887, -0.3761859, 0.2901961, 0, 1, 1,
0.5218232, 0.2437361, 0.38202, 0.2941177, 0, 1, 1,
0.5272506, 1.642174, -0.1248795, 0.3019608, 0, 1, 1,
0.5348169, -2.331758, 3.903675, 0.3098039, 0, 1, 1,
0.5356397, -0.1626574, 0.1411609, 0.3137255, 0, 1, 1,
0.5365892, 1.737774, 0.02551341, 0.3215686, 0, 1, 1,
0.5395982, -1.635147, 3.15971, 0.3254902, 0, 1, 1,
0.5409883, -0.6608876, 3.171038, 0.3333333, 0, 1, 1,
0.5420229, -1.651795, 2.199608, 0.3372549, 0, 1, 1,
0.5447648, 0.5799361, 1.65978, 0.345098, 0, 1, 1,
0.5464278, -0.1750657, 2.574583, 0.3490196, 0, 1, 1,
0.5524649, -1.656375, 2.596492, 0.3568628, 0, 1, 1,
0.5540063, -0.5452349, 2.598996, 0.3607843, 0, 1, 1,
0.5559136, -0.5255482, 2.11631, 0.3686275, 0, 1, 1,
0.5560383, 0.549951, -1.032584, 0.372549, 0, 1, 1,
0.5597437, 1.164993, -1.064551, 0.3803922, 0, 1, 1,
0.566895, -0.4873532, 1.895774, 0.3843137, 0, 1, 1,
0.567106, -0.3958459, 1.944721, 0.3921569, 0, 1, 1,
0.5676735, -1.891972, 3.015399, 0.3960784, 0, 1, 1,
0.5716196, -0.01065178, 2.999613, 0.4039216, 0, 1, 1,
0.5789686, -0.02131571, 0.9002014, 0.4117647, 0, 1, 1,
0.581401, 0.7499999, -0.8965921, 0.4156863, 0, 1, 1,
0.5843269, 1.005231, 0.3437577, 0.4235294, 0, 1, 1,
0.5879261, -0.2496326, 1.121721, 0.427451, 0, 1, 1,
0.590517, -0.2969728, 2.009616, 0.4352941, 0, 1, 1,
0.5914877, -1.071955, 3.135601, 0.4392157, 0, 1, 1,
0.6010157, 0.394061, 1.333854, 0.4470588, 0, 1, 1,
0.6027011, -0.5307423, 2.866834, 0.4509804, 0, 1, 1,
0.6036745, 1.311558, -0.3404596, 0.4588235, 0, 1, 1,
0.6037325, 1.452491, 0.2957524, 0.4627451, 0, 1, 1,
0.6061297, -2.607706, 3.783759, 0.4705882, 0, 1, 1,
0.6071745, 1.855328, 0.6232638, 0.4745098, 0, 1, 1,
0.6162018, -1.200768, 2.993178, 0.4823529, 0, 1, 1,
0.6229394, 0.1854503, 0.8468893, 0.4862745, 0, 1, 1,
0.6231859, 0.0923742, 1.988864, 0.4941176, 0, 1, 1,
0.625371, 1.030456, 1.100987, 0.5019608, 0, 1, 1,
0.6260531, 0.7774823, 0.845675, 0.5058824, 0, 1, 1,
0.6267247, 0.05965722, 0.9195918, 0.5137255, 0, 1, 1,
0.6328109, -0.3675076, 0.1757211, 0.5176471, 0, 1, 1,
0.6334451, -0.8001911, 1.891157, 0.5254902, 0, 1, 1,
0.6404441, 0.8532801, -0.04096966, 0.5294118, 0, 1, 1,
0.6419153, -1.056538, 1.630206, 0.5372549, 0, 1, 1,
0.642118, 0.6150184, 1.196116, 0.5411765, 0, 1, 1,
0.6449233, 1.106836, 0.08814482, 0.5490196, 0, 1, 1,
0.6456406, -0.1117837, 1.781896, 0.5529412, 0, 1, 1,
0.6477281, 0.2246169, -0.3846842, 0.5607843, 0, 1, 1,
0.6501818, 0.8845227, -1.391529, 0.5647059, 0, 1, 1,
0.6519207, 0.6798947, 0.09528371, 0.572549, 0, 1, 1,
0.6537067, -0.6383998, 3.452739, 0.5764706, 0, 1, 1,
0.6550119, -0.1489806, 2.625719, 0.5843138, 0, 1, 1,
0.6577017, 0.128263, 1.286248, 0.5882353, 0, 1, 1,
0.6605591, -0.4209968, 1.002493, 0.5960785, 0, 1, 1,
0.6653951, 0.7599276, 1.291169, 0.6039216, 0, 1, 1,
0.6745543, 1.181475, 0.1367927, 0.6078432, 0, 1, 1,
0.6752399, -0.6855925, 2.737417, 0.6156863, 0, 1, 1,
0.6784448, -0.8560284, 3.89321, 0.6196079, 0, 1, 1,
0.6817554, -1.220137, 1.369781, 0.627451, 0, 1, 1,
0.6834956, -0.2284876, 1.979779, 0.6313726, 0, 1, 1,
0.6862915, -0.4737531, 2.015995, 0.6392157, 0, 1, 1,
0.6891467, -2.038288, 3.028739, 0.6431373, 0, 1, 1,
0.6937291, -1.315436, 3.951263, 0.6509804, 0, 1, 1,
0.7018815, 1.520521, 0.522316, 0.654902, 0, 1, 1,
0.7029828, -0.05263575, 1.302344, 0.6627451, 0, 1, 1,
0.7058075, -0.3334986, 2.406888, 0.6666667, 0, 1, 1,
0.722225, 1.189613, 1.590394, 0.6745098, 0, 1, 1,
0.723157, 0.6676416, 1.081132, 0.6784314, 0, 1, 1,
0.7247059, 1.279322, 1.728572, 0.6862745, 0, 1, 1,
0.7251191, -0.7314144, 3.492546, 0.6901961, 0, 1, 1,
0.7254878, -0.7595334, 2.371006, 0.6980392, 0, 1, 1,
0.7355267, -0.7044579, 1.840438, 0.7058824, 0, 1, 1,
0.7373844, 1.959787, 0.4103307, 0.7098039, 0, 1, 1,
0.7399526, -0.6259014, 2.461878, 0.7176471, 0, 1, 1,
0.7409055, 0.3338956, 1.621168, 0.7215686, 0, 1, 1,
0.7420028, -0.1821381, 2.855813, 0.7294118, 0, 1, 1,
0.7558442, 0.2211722, 1.416852, 0.7333333, 0, 1, 1,
0.7575386, -0.9819843, 1.282435, 0.7411765, 0, 1, 1,
0.7594582, 0.8492075, 0.2793348, 0.7450981, 0, 1, 1,
0.7613022, 0.3247648, -1.60743, 0.7529412, 0, 1, 1,
0.7615179, -1.054989, 2.13691, 0.7568628, 0, 1, 1,
0.7617062, 0.9871917, -0.1987654, 0.7647059, 0, 1, 1,
0.7628372, -0.1435324, 4.64399, 0.7686275, 0, 1, 1,
0.7649033, -0.6613335, 2.390067, 0.7764706, 0, 1, 1,
0.7656954, -0.5813051, 1.69792, 0.7803922, 0, 1, 1,
0.7696669, -0.4227535, 0.8102022, 0.7882353, 0, 1, 1,
0.7755253, -0.5594363, 3.700082, 0.7921569, 0, 1, 1,
0.7873005, -0.5905919, 2.356375, 0.8, 0, 1, 1,
0.7895389, -0.04988267, -1.047032, 0.8078431, 0, 1, 1,
0.7905037, -0.6882637, 1.830284, 0.8117647, 0, 1, 1,
0.8006209, 0.1232385, 2.033191, 0.8196079, 0, 1, 1,
0.8017635, -0.5779845, 3.426027, 0.8235294, 0, 1, 1,
0.8068103, -0.3281646, 0.8194771, 0.8313726, 0, 1, 1,
0.8112047, 0.01141639, 1.449605, 0.8352941, 0, 1, 1,
0.813998, 0.4519908, 0.1210029, 0.8431373, 0, 1, 1,
0.8140074, -0.6216814, 1.558353, 0.8470588, 0, 1, 1,
0.8184421, -0.03811917, 1.975637, 0.854902, 0, 1, 1,
0.8350569, 0.04222953, 1.299046, 0.8588235, 0, 1, 1,
0.8353513, 0.6670802, 1.055451, 0.8666667, 0, 1, 1,
0.8418243, -0.3091893, 2.254758, 0.8705882, 0, 1, 1,
0.8462914, 1.899196, 1.483871, 0.8784314, 0, 1, 1,
0.8474094, 1.038676, 0.5490101, 0.8823529, 0, 1, 1,
0.8490428, 1.678958, 0.8988373, 0.8901961, 0, 1, 1,
0.8512923, 0.03471293, -0.1970716, 0.8941177, 0, 1, 1,
0.8586709, -0.6195416, 3.371607, 0.9019608, 0, 1, 1,
0.8608524, 0.9908932, 1.057109, 0.9098039, 0, 1, 1,
0.8631265, 1.2618, -1.357537, 0.9137255, 0, 1, 1,
0.8633825, 0.2900848, 1.793998, 0.9215686, 0, 1, 1,
0.8657195, -0.674245, 1.343236, 0.9254902, 0, 1, 1,
0.8672091, 0.02220586, 2.457989, 0.9333333, 0, 1, 1,
0.8684657, -0.3843598, 4.025773, 0.9372549, 0, 1, 1,
0.8724959, 0.7400593, -0.7539994, 0.945098, 0, 1, 1,
0.8759221, 1.863901, 2.148931, 0.9490196, 0, 1, 1,
0.8783567, -0.4935916, 0.8494429, 0.9568627, 0, 1, 1,
0.8803549, 0.5089145, 2.129957, 0.9607843, 0, 1, 1,
0.8811812, 0.6359778, 0.7508161, 0.9686275, 0, 1, 1,
0.8868987, -0.2376943, 1.257957, 0.972549, 0, 1, 1,
0.8900335, 0.8291167, 0.6148834, 0.9803922, 0, 1, 1,
0.8912578, -0.1786755, 2.18627, 0.9843137, 0, 1, 1,
0.9007669, 1.625538, -0.7236004, 0.9921569, 0, 1, 1,
0.9031039, -1.460784, 2.771448, 0.9960784, 0, 1, 1,
0.9107817, 0.57643, 0.5117664, 1, 0, 0.9960784, 1,
0.9167406, 0.07587543, 2.742412, 1, 0, 0.9882353, 1,
0.917162, -0.1781411, 1.905762, 1, 0, 0.9843137, 1,
0.9209939, 0.3480357, 0.4790252, 1, 0, 0.9764706, 1,
0.9233643, 1.294441, 0.9217637, 1, 0, 0.972549, 1,
0.9245752, -1.533245, 1.014246, 1, 0, 0.9647059, 1,
0.930833, -1.257326, 2.635266, 1, 0, 0.9607843, 1,
0.9310729, 0.6396356, 2.300593, 1, 0, 0.9529412, 1,
0.9353889, 0.5767996, 2.681087, 1, 0, 0.9490196, 1,
0.9359117, -1.158545, 1.738905, 1, 0, 0.9411765, 1,
0.9435955, -0.125338, 1.529266, 1, 0, 0.9372549, 1,
0.9436269, -2.177164, 1.446141, 1, 0, 0.9294118, 1,
0.94608, -1.223112, 0.6106899, 1, 0, 0.9254902, 1,
0.9490697, 1.58933, 0.2258194, 1, 0, 0.9176471, 1,
0.9616645, 1.560698, 1.671351, 1, 0, 0.9137255, 1,
0.9670575, -3.481305, 2.567333, 1, 0, 0.9058824, 1,
0.9745607, -0.4780649, 4.301868, 1, 0, 0.9019608, 1,
0.982639, -0.8591421, 1.862668, 1, 0, 0.8941177, 1,
0.9834183, -1.022531, 2.04127, 1, 0, 0.8862745, 1,
0.9863203, -0.5188664, 1.280291, 1, 0, 0.8823529, 1,
0.9905519, 2.418764, 0.5164474, 1, 0, 0.8745098, 1,
0.9991369, 0.4242778, 2.262141, 1, 0, 0.8705882, 1,
1.003788, 0.2825565, 1.658194, 1, 0, 0.8627451, 1,
1.003828, -0.2411222, 0.474507, 1, 0, 0.8588235, 1,
1.007359, -1.140795, 2.549495, 1, 0, 0.8509804, 1,
1.03018, -0.8412542, 2.116572, 1, 0, 0.8470588, 1,
1.034126, 0.315963, 0.3683979, 1, 0, 0.8392157, 1,
1.038503, -1.283058, 2.430639, 1, 0, 0.8352941, 1,
1.039136, 0.807927, 0.4166099, 1, 0, 0.827451, 1,
1.042242, 1.350317, -0.661491, 1, 0, 0.8235294, 1,
1.048743, -0.02083446, 1.977701, 1, 0, 0.8156863, 1,
1.048993, -0.8268284, 1.241714, 1, 0, 0.8117647, 1,
1.052749, 0.3869412, 0.1626513, 1, 0, 0.8039216, 1,
1.069134, -1.713196, 2.295814, 1, 0, 0.7960784, 1,
1.078003, 1.605674, 0.6653557, 1, 0, 0.7921569, 1,
1.081354, 0.9498425, 0.9244817, 1, 0, 0.7843137, 1,
1.081734, 0.9154046, 0.7966225, 1, 0, 0.7803922, 1,
1.088631, 1.043424, 1.835184, 1, 0, 0.772549, 1,
1.089229, 0.5179108, 1.582487, 1, 0, 0.7686275, 1,
1.104261, -0.4066844, 4.149051, 1, 0, 0.7607843, 1,
1.109088, 1.051359, 0.5820629, 1, 0, 0.7568628, 1,
1.109989, -0.5896516, 2.416667, 1, 0, 0.7490196, 1,
1.122066, -2.101148, 3.613753, 1, 0, 0.7450981, 1,
1.126061, 1.847267, -1.037653, 1, 0, 0.7372549, 1,
1.126115, 0.8165488, 1.067245, 1, 0, 0.7333333, 1,
1.128996, 0.5465106, 1.652373, 1, 0, 0.7254902, 1,
1.132654, -1.082304, 2.026241, 1, 0, 0.7215686, 1,
1.134944, 1.731465, 2.072594, 1, 0, 0.7137255, 1,
1.139904, 0.5061367, 1.601202, 1, 0, 0.7098039, 1,
1.141845, 1.318497, 1.497774, 1, 0, 0.7019608, 1,
1.142194, -1.373803, 2.365729, 1, 0, 0.6941177, 1,
1.143279, 0.9160943, -0.1869118, 1, 0, 0.6901961, 1,
1.145716, -1.285772, 1.813361, 1, 0, 0.682353, 1,
1.149585, 1.085875, 0.2627161, 1, 0, 0.6784314, 1,
1.150722, -1.212549, 1.576327, 1, 0, 0.6705883, 1,
1.156766, 0.7639472, 0.6558659, 1, 0, 0.6666667, 1,
1.160032, -2.017159, 1.934553, 1, 0, 0.6588235, 1,
1.162872, -0.2420335, 2.34915, 1, 0, 0.654902, 1,
1.165924, -1.009729, 2.383264, 1, 0, 0.6470588, 1,
1.171442, -1.143906, 0.6049786, 1, 0, 0.6431373, 1,
1.173629, 0.8077874, 1.011087, 1, 0, 0.6352941, 1,
1.174866, -1.160656, 2.030709, 1, 0, 0.6313726, 1,
1.177939, 0.6757072, 1.018706, 1, 0, 0.6235294, 1,
1.181272, -0.8655619, 0.794598, 1, 0, 0.6196079, 1,
1.183495, 0.9246107, 0.008661984, 1, 0, 0.6117647, 1,
1.186813, -0.9098222, 2.195295, 1, 0, 0.6078432, 1,
1.189453, 0.7829794, 1.685132, 1, 0, 0.6, 1,
1.193711, -0.1407509, 2.470215, 1, 0, 0.5921569, 1,
1.204675, 0.6830474, 4.073023, 1, 0, 0.5882353, 1,
1.20706, -2.830226, 1.93593, 1, 0, 0.5803922, 1,
1.226552, 0.5788243, 2.215708, 1, 0, 0.5764706, 1,
1.244245, -1.006496, 3.598965, 1, 0, 0.5686275, 1,
1.247241, 1.303405, 1.882436, 1, 0, 0.5647059, 1,
1.265571, 0.2183072, 1.729198, 1, 0, 0.5568628, 1,
1.267861, 0.7128676, 1.743107, 1, 0, 0.5529412, 1,
1.277531, -1.103158, 1.397017, 1, 0, 0.5450981, 1,
1.283015, -0.0136007, 1.957076, 1, 0, 0.5411765, 1,
1.302657, 1.690156, 0.5794927, 1, 0, 0.5333334, 1,
1.304835, -0.4612736, 2.590675, 1, 0, 0.5294118, 1,
1.305806, 1.190881, 2.381872, 1, 0, 0.5215687, 1,
1.32344, 2.241384, -0.2715725, 1, 0, 0.5176471, 1,
1.343554, -0.6828202, 3.589792, 1, 0, 0.509804, 1,
1.364667, -1.674561, 1.804194, 1, 0, 0.5058824, 1,
1.407689, -1.094005, 4.155353, 1, 0, 0.4980392, 1,
1.424629, 0.6117984, 0.9795372, 1, 0, 0.4901961, 1,
1.426518, 0.05998605, 0.762772, 1, 0, 0.4862745, 1,
1.42965, 1.001823, 0.1147932, 1, 0, 0.4784314, 1,
1.435727, 0.1233418, 1.657699, 1, 0, 0.4745098, 1,
1.447412, 0.4682862, 0.4096499, 1, 0, 0.4666667, 1,
1.454269, -0.5205304, 1.671969, 1, 0, 0.4627451, 1,
1.462, -0.7230896, 2.791604, 1, 0, 0.454902, 1,
1.472299, 0.3407724, 2.700203, 1, 0, 0.4509804, 1,
1.473943, -0.4684406, 1.357941, 1, 0, 0.4431373, 1,
1.483037, -3.099866, 2.452555, 1, 0, 0.4392157, 1,
1.48558, 0.1749607, 1.348665, 1, 0, 0.4313726, 1,
1.498085, -0.1558337, 0.5068431, 1, 0, 0.427451, 1,
1.49867, -0.4070393, 0.3294371, 1, 0, 0.4196078, 1,
1.499727, -1.284867, 0.979107, 1, 0, 0.4156863, 1,
1.504478, 0.05146958, 1.880344, 1, 0, 0.4078431, 1,
1.509019, -0.5976928, 1.722769, 1, 0, 0.4039216, 1,
1.509521, 0.7540584, 0.8741272, 1, 0, 0.3960784, 1,
1.515974, -1.205073, 1.188091, 1, 0, 0.3882353, 1,
1.518736, -0.685792, 3.186373, 1, 0, 0.3843137, 1,
1.52197, -0.9522673, 2.300163, 1, 0, 0.3764706, 1,
1.532817, 0.09458128, 0.6433768, 1, 0, 0.372549, 1,
1.533561, -2.50751, 3.404493, 1, 0, 0.3647059, 1,
1.540755, 0.5559924, 2.566975, 1, 0, 0.3607843, 1,
1.551089, 0.5453418, 2.272778, 1, 0, 0.3529412, 1,
1.566358, 0.9188102, 1.800761, 1, 0, 0.3490196, 1,
1.574837, -0.7027432, 2.728759, 1, 0, 0.3411765, 1,
1.608951, -0.5178432, 1.826717, 1, 0, 0.3372549, 1,
1.618414, 0.4878265, 2.553613, 1, 0, 0.3294118, 1,
1.622689, -0.08665769, 2.467464, 1, 0, 0.3254902, 1,
1.627441, 0.62544, 1.18139, 1, 0, 0.3176471, 1,
1.630719, 0.284473, 0.5823027, 1, 0, 0.3137255, 1,
1.631976, -0.8034236, 0.02724581, 1, 0, 0.3058824, 1,
1.631998, -0.4936983, 1.772241, 1, 0, 0.2980392, 1,
1.637245, -1.585495, 3.807218, 1, 0, 0.2941177, 1,
1.64496, 0.6033635, 0.5380053, 1, 0, 0.2862745, 1,
1.647139, 1.11901, 0.6212758, 1, 0, 0.282353, 1,
1.649019, -0.512396, 1.287245, 1, 0, 0.2745098, 1,
1.669906, 1.203379, 0.1300737, 1, 0, 0.2705882, 1,
1.683224, 0.003669807, 1.787709, 1, 0, 0.2627451, 1,
1.685459, 1.164154, 1.309025, 1, 0, 0.2588235, 1,
1.685847, -0.9509844, 0.4025379, 1, 0, 0.2509804, 1,
1.689249, -0.8440077, 1.729126, 1, 0, 0.2470588, 1,
1.702698, 0.3009723, 2.367461, 1, 0, 0.2392157, 1,
1.706725, 0.5760136, 1.169818, 1, 0, 0.2352941, 1,
1.714901, 0.9416766, -0.07987466, 1, 0, 0.227451, 1,
1.737068, -0.1964109, 2.520108, 1, 0, 0.2235294, 1,
1.744285, -1.527878, 1.519845, 1, 0, 0.2156863, 1,
1.748099, -0.5382624, 3.622466, 1, 0, 0.2117647, 1,
1.75086, -0.6171415, 3.410597, 1, 0, 0.2039216, 1,
1.77795, 0.4997835, 0.4793324, 1, 0, 0.1960784, 1,
1.784075, -0.8561998, 2.47937, 1, 0, 0.1921569, 1,
1.785589, -0.5211705, 3.499315, 1, 0, 0.1843137, 1,
1.791131, -0.6506956, 1.351084, 1, 0, 0.1803922, 1,
1.797928, 2.510374, 0.1805163, 1, 0, 0.172549, 1,
1.807105, 0.1164819, 2.397816, 1, 0, 0.1686275, 1,
1.83738, 0.7284691, 2.048955, 1, 0, 0.1607843, 1,
1.84948, -0.3063228, 2.103154, 1, 0, 0.1568628, 1,
1.857368, -0.2508421, 1.532069, 1, 0, 0.1490196, 1,
1.857725, -0.4970841, 1.07252, 1, 0, 0.145098, 1,
1.869444, -0.6794794, 2.176272, 1, 0, 0.1372549, 1,
1.889062, 2.773421, 0.1901912, 1, 0, 0.1333333, 1,
1.942626, 2.227839, 0.006257106, 1, 0, 0.1254902, 1,
1.949204, -1.207605, 2.945743, 1, 0, 0.1215686, 1,
1.985798, 1.085689, 1.114917, 1, 0, 0.1137255, 1,
2.086674, 0.1458199, 2.515995, 1, 0, 0.1098039, 1,
2.11397, -0.7736214, 2.032777, 1, 0, 0.1019608, 1,
2.183175, 1.112503, 3.413592, 1, 0, 0.09411765, 1,
2.213225, 0.1607847, 0.09212486, 1, 0, 0.09019608, 1,
2.244105, 0.4148859, 1.060739, 1, 0, 0.08235294, 1,
2.251349, 0.4686317, 0.5738936, 1, 0, 0.07843138, 1,
2.256891, -0.7818418, 1.098501, 1, 0, 0.07058824, 1,
2.279091, -0.2188539, 0.7995417, 1, 0, 0.06666667, 1,
2.312466, -1.054059, 1.716274, 1, 0, 0.05882353, 1,
2.344973, -1.075641, 4.283003, 1, 0, 0.05490196, 1,
2.389558, -0.9476141, 0.5585637, 1, 0, 0.04705882, 1,
2.409315, -2.193871, 1.164296, 1, 0, 0.04313726, 1,
2.431386, -0.4047115, 1.947906, 1, 0, 0.03529412, 1,
2.436928, -1.290018, 2.718509, 1, 0, 0.03137255, 1,
2.532441, 1.68915, 0.8038827, 1, 0, 0.02352941, 1,
2.681149, -2.091857, 1.73882, 1, 0, 0.01960784, 1,
3.032768, 0.7027597, 1.758185, 1, 0, 0.01176471, 1,
3.137727, 1.020599, 0.5082799, 1, 0, 0.007843138, 1
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
0.04314351, -4.598945, -6.657006, 0, -0.5, 0.5, 0.5,
0.04314351, -4.598945, -6.657006, 1, -0.5, 0.5, 0.5,
0.04314351, -4.598945, -6.657006, 1, 1.5, 0.5, 0.5,
0.04314351, -4.598945, -6.657006, 0, 1.5, 0.5, 0.5
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
-4.100504, -0.1844343, -6.657006, 0, -0.5, 0.5, 0.5,
-4.100504, -0.1844343, -6.657006, 1, -0.5, 0.5, 0.5,
-4.100504, -0.1844343, -6.657006, 1, 1.5, 0.5, 0.5,
-4.100504, -0.1844343, -6.657006, 0, 1.5, 0.5, 0.5
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
-4.100504, -4.598945, 0.2153606, 0, -0.5, 0.5, 0.5,
-4.100504, -4.598945, 0.2153606, 1, -0.5, 0.5, 0.5,
-4.100504, -4.598945, 0.2153606, 1, 1.5, 0.5, 0.5,
-4.100504, -4.598945, 0.2153606, 0, 1.5, 0.5, 0.5
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
-3, -3.580211, -5.071075,
3, -3.580211, -5.071075,
-3, -3.580211, -5.071075,
-3, -3.75, -5.335397,
-2, -3.580211, -5.071075,
-2, -3.75, -5.335397,
-1, -3.580211, -5.071075,
-1, -3.75, -5.335397,
0, -3.580211, -5.071075,
0, -3.75, -5.335397,
1, -3.580211, -5.071075,
1, -3.75, -5.335397,
2, -3.580211, -5.071075,
2, -3.75, -5.335397,
3, -3.580211, -5.071075,
3, -3.75, -5.335397
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
-3, -4.089578, -5.864041, 0, -0.5, 0.5, 0.5,
-3, -4.089578, -5.864041, 1, -0.5, 0.5, 0.5,
-3, -4.089578, -5.864041, 1, 1.5, 0.5, 0.5,
-3, -4.089578, -5.864041, 0, 1.5, 0.5, 0.5,
-2, -4.089578, -5.864041, 0, -0.5, 0.5, 0.5,
-2, -4.089578, -5.864041, 1, -0.5, 0.5, 0.5,
-2, -4.089578, -5.864041, 1, 1.5, 0.5, 0.5,
-2, -4.089578, -5.864041, 0, 1.5, 0.5, 0.5,
-1, -4.089578, -5.864041, 0, -0.5, 0.5, 0.5,
-1, -4.089578, -5.864041, 1, -0.5, 0.5, 0.5,
-1, -4.089578, -5.864041, 1, 1.5, 0.5, 0.5,
-1, -4.089578, -5.864041, 0, 1.5, 0.5, 0.5,
0, -4.089578, -5.864041, 0, -0.5, 0.5, 0.5,
0, -4.089578, -5.864041, 1, -0.5, 0.5, 0.5,
0, -4.089578, -5.864041, 1, 1.5, 0.5, 0.5,
0, -4.089578, -5.864041, 0, 1.5, 0.5, 0.5,
1, -4.089578, -5.864041, 0, -0.5, 0.5, 0.5,
1, -4.089578, -5.864041, 1, -0.5, 0.5, 0.5,
1, -4.089578, -5.864041, 1, 1.5, 0.5, 0.5,
1, -4.089578, -5.864041, 0, 1.5, 0.5, 0.5,
2, -4.089578, -5.864041, 0, -0.5, 0.5, 0.5,
2, -4.089578, -5.864041, 1, -0.5, 0.5, 0.5,
2, -4.089578, -5.864041, 1, 1.5, 0.5, 0.5,
2, -4.089578, -5.864041, 0, 1.5, 0.5, 0.5,
3, -4.089578, -5.864041, 0, -0.5, 0.5, 0.5,
3, -4.089578, -5.864041, 1, -0.5, 0.5, 0.5,
3, -4.089578, -5.864041, 1, 1.5, 0.5, 0.5,
3, -4.089578, -5.864041, 0, 1.5, 0.5, 0.5
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
-3.144278, -3, -5.071075,
-3.144278, 3, -5.071075,
-3.144278, -3, -5.071075,
-3.303648, -3, -5.335397,
-3.144278, -2, -5.071075,
-3.303648, -2, -5.335397,
-3.144278, -1, -5.071075,
-3.303648, -1, -5.335397,
-3.144278, 0, -5.071075,
-3.303648, 0, -5.335397,
-3.144278, 1, -5.071075,
-3.303648, 1, -5.335397,
-3.144278, 2, -5.071075,
-3.303648, 2, -5.335397,
-3.144278, 3, -5.071075,
-3.303648, 3, -5.335397
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
-3.622391, -3, -5.864041, 0, -0.5, 0.5, 0.5,
-3.622391, -3, -5.864041, 1, -0.5, 0.5, 0.5,
-3.622391, -3, -5.864041, 1, 1.5, 0.5, 0.5,
-3.622391, -3, -5.864041, 0, 1.5, 0.5, 0.5,
-3.622391, -2, -5.864041, 0, -0.5, 0.5, 0.5,
-3.622391, -2, -5.864041, 1, -0.5, 0.5, 0.5,
-3.622391, -2, -5.864041, 1, 1.5, 0.5, 0.5,
-3.622391, -2, -5.864041, 0, 1.5, 0.5, 0.5,
-3.622391, -1, -5.864041, 0, -0.5, 0.5, 0.5,
-3.622391, -1, -5.864041, 1, -0.5, 0.5, 0.5,
-3.622391, -1, -5.864041, 1, 1.5, 0.5, 0.5,
-3.622391, -1, -5.864041, 0, 1.5, 0.5, 0.5,
-3.622391, 0, -5.864041, 0, -0.5, 0.5, 0.5,
-3.622391, 0, -5.864041, 1, -0.5, 0.5, 0.5,
-3.622391, 0, -5.864041, 1, 1.5, 0.5, 0.5,
-3.622391, 0, -5.864041, 0, 1.5, 0.5, 0.5,
-3.622391, 1, -5.864041, 0, -0.5, 0.5, 0.5,
-3.622391, 1, -5.864041, 1, -0.5, 0.5, 0.5,
-3.622391, 1, -5.864041, 1, 1.5, 0.5, 0.5,
-3.622391, 1, -5.864041, 0, 1.5, 0.5, 0.5,
-3.622391, 2, -5.864041, 0, -0.5, 0.5, 0.5,
-3.622391, 2, -5.864041, 1, -0.5, 0.5, 0.5,
-3.622391, 2, -5.864041, 1, 1.5, 0.5, 0.5,
-3.622391, 2, -5.864041, 0, 1.5, 0.5, 0.5,
-3.622391, 3, -5.864041, 0, -0.5, 0.5, 0.5,
-3.622391, 3, -5.864041, 1, -0.5, 0.5, 0.5,
-3.622391, 3, -5.864041, 1, 1.5, 0.5, 0.5,
-3.622391, 3, -5.864041, 0, 1.5, 0.5, 0.5
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
-3.144278, -3.580211, -4,
-3.144278, -3.580211, 4,
-3.144278, -3.580211, -4,
-3.303648, -3.75, -4,
-3.144278, -3.580211, -2,
-3.303648, -3.75, -2,
-3.144278, -3.580211, 0,
-3.303648, -3.75, 0,
-3.144278, -3.580211, 2,
-3.303648, -3.75, 2,
-3.144278, -3.580211, 4,
-3.303648, -3.75, 4
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
-3.622391, -4.089578, -4, 0, -0.5, 0.5, 0.5,
-3.622391, -4.089578, -4, 1, -0.5, 0.5, 0.5,
-3.622391, -4.089578, -4, 1, 1.5, 0.5, 0.5,
-3.622391, -4.089578, -4, 0, 1.5, 0.5, 0.5,
-3.622391, -4.089578, -2, 0, -0.5, 0.5, 0.5,
-3.622391, -4.089578, -2, 1, -0.5, 0.5, 0.5,
-3.622391, -4.089578, -2, 1, 1.5, 0.5, 0.5,
-3.622391, -4.089578, -2, 0, 1.5, 0.5, 0.5,
-3.622391, -4.089578, 0, 0, -0.5, 0.5, 0.5,
-3.622391, -4.089578, 0, 1, -0.5, 0.5, 0.5,
-3.622391, -4.089578, 0, 1, 1.5, 0.5, 0.5,
-3.622391, -4.089578, 0, 0, 1.5, 0.5, 0.5,
-3.622391, -4.089578, 2, 0, -0.5, 0.5, 0.5,
-3.622391, -4.089578, 2, 1, -0.5, 0.5, 0.5,
-3.622391, -4.089578, 2, 1, 1.5, 0.5, 0.5,
-3.622391, -4.089578, 2, 0, 1.5, 0.5, 0.5,
-3.622391, -4.089578, 4, 0, -0.5, 0.5, 0.5,
-3.622391, -4.089578, 4, 1, -0.5, 0.5, 0.5,
-3.622391, -4.089578, 4, 1, 1.5, 0.5, 0.5,
-3.622391, -4.089578, 4, 0, 1.5, 0.5, 0.5
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
-3.144278, -3.580211, -5.071075,
-3.144278, 3.211343, -5.071075,
-3.144278, -3.580211, 5.501797,
-3.144278, 3.211343, 5.501797,
-3.144278, -3.580211, -5.071075,
-3.144278, -3.580211, 5.501797,
-3.144278, 3.211343, -5.071075,
-3.144278, 3.211343, 5.501797,
-3.144278, -3.580211, -5.071075,
3.230565, -3.580211, -5.071075,
-3.144278, -3.580211, 5.501797,
3.230565, -3.580211, 5.501797,
-3.144278, 3.211343, -5.071075,
3.230565, 3.211343, -5.071075,
-3.144278, 3.211343, 5.501797,
3.230565, 3.211343, 5.501797,
3.230565, -3.580211, -5.071075,
3.230565, 3.211343, -5.071075,
3.230565, -3.580211, 5.501797,
3.230565, 3.211343, 5.501797,
3.230565, -3.580211, -5.071075,
3.230565, -3.580211, 5.501797,
3.230565, 3.211343, -5.071075,
3.230565, 3.211343, 5.501797
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
var radius = 7.524191;
var distance = 33.47598;
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
mvMatrix.translate( -0.04314351, 0.1844343, -0.2153606 );
mvMatrix.scale( 1.276157, 1.197856, 0.7694506 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.47598);
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
DDD<-read.table("DDD.xyz")
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
-3.05144, 1.198239, -1.189921, 0, 0, 1, 1, 1,
-2.722653, -0.1626255, -0.6194033, 1, 0, 0, 1, 1,
-2.688822, 1.27728, -1.158855, 1, 0, 0, 1, 1,
-2.563554, -0.09843615, -1.438542, 1, 0, 0, 1, 1,
-2.521308, 0.6584125, -1.52999, 1, 0, 0, 1, 1,
-2.492144, 1.272959, -0.1632855, 1, 0, 0, 1, 1,
-2.48858, 0.4758841, -3.456712, 0, 0, 0, 1, 1,
-2.482476, -1.890772, -1.638046, 0, 0, 0, 1, 1,
-2.340693, -0.6022518, -1.276058, 0, 0, 0, 1, 1,
-2.316722, 0.7636974, -0.4528793, 0, 0, 0, 1, 1,
-2.313854, 0.05148448, -2.630799, 0, 0, 0, 1, 1,
-2.301497, 1.735194, 1.476079, 0, 0, 0, 1, 1,
-2.299938, 0.830525, -1.439893, 0, 0, 0, 1, 1,
-2.262229, 0.2515479, -0.7313719, 1, 1, 1, 1, 1,
-2.241068, -1.193621, -3.383197, 1, 1, 1, 1, 1,
-2.14386, -0.01211367, -0.1926077, 1, 1, 1, 1, 1,
-2.128739, -0.7183816, -1.374107, 1, 1, 1, 1, 1,
-2.116478, -0.894836, -2.250277, 1, 1, 1, 1, 1,
-2.112499, -0.6566874, -2.691419, 1, 1, 1, 1, 1,
-2.107953, 0.572686, -0.5309088, 1, 1, 1, 1, 1,
-2.06635, 1.848975, -1.09296, 1, 1, 1, 1, 1,
-2.049874, -0.3458741, -1.563104, 1, 1, 1, 1, 1,
-2.033672, 0.5554657, -0.5016291, 1, 1, 1, 1, 1,
-1.979002, -1.015913, -1.55425, 1, 1, 1, 1, 1,
-1.963395, -0.1804465, -0.5798152, 1, 1, 1, 1, 1,
-1.919697, -0.347087, -0.8311706, 1, 1, 1, 1, 1,
-1.912188, -0.5560965, -2.205511, 1, 1, 1, 1, 1,
-1.906734, 0.7898267, -1.840517, 1, 1, 1, 1, 1,
-1.872308, 2.183304, -0.7289295, 0, 0, 1, 1, 1,
-1.870866, 0.1399912, 0.1237492, 1, 0, 0, 1, 1,
-1.870255, 1.419154, -0.5992743, 1, 0, 0, 1, 1,
-1.858472, -0.721943, -0.64774, 1, 0, 0, 1, 1,
-1.850407, 0.8308283, 0.1796658, 1, 0, 0, 1, 1,
-1.842852, 0.928809, -2.184879, 1, 0, 0, 1, 1,
-1.840097, 0.8603789, -0.5278379, 0, 0, 0, 1, 1,
-1.835264, 0.6475999, -1.429395, 0, 0, 0, 1, 1,
-1.82296, 0.4429296, -1.544652, 0, 0, 0, 1, 1,
-1.793099, 0.3238221, -1.46746, 0, 0, 0, 1, 1,
-1.781878, -0.9252824, -1.621974, 0, 0, 0, 1, 1,
-1.777306, 0.5673296, -2.493235, 0, 0, 0, 1, 1,
-1.769982, 1.610104, 1.271242, 0, 0, 0, 1, 1,
-1.764175, -0.4981582, -1.891456, 1, 1, 1, 1, 1,
-1.764147, -0.04416252, -1.885008, 1, 1, 1, 1, 1,
-1.763836, 0.06809422, -2.073644, 1, 1, 1, 1, 1,
-1.760592, 0.5443373, -1.284678, 1, 1, 1, 1, 1,
-1.74614, -0.003279027, -2.154144, 1, 1, 1, 1, 1,
-1.740376, -1.360088, -4.569755, 1, 1, 1, 1, 1,
-1.72388, -1.247198, -3.516962, 1, 1, 1, 1, 1,
-1.710117, 0.6442043, -0.03065324, 1, 1, 1, 1, 1,
-1.701148, -0.8836014, -1.670644, 1, 1, 1, 1, 1,
-1.695925, -0.9160786, -2.795663, 1, 1, 1, 1, 1,
-1.681263, -0.9663655, -3.097312, 1, 1, 1, 1, 1,
-1.666853, -0.6418623, -1.870604, 1, 1, 1, 1, 1,
-1.662401, -2.717093, -1.689216, 1, 1, 1, 1, 1,
-1.65545, -0.4826495, -1.696579, 1, 1, 1, 1, 1,
-1.65452, 1.57737, 1.384489, 1, 1, 1, 1, 1,
-1.653283, -0.9184158, 0.009638314, 0, 0, 1, 1, 1,
-1.636636, -0.007651007, -2.693665, 1, 0, 0, 1, 1,
-1.626365, 1.000598, -2.269211, 1, 0, 0, 1, 1,
-1.613309, 0.2289632, -1.477136, 1, 0, 0, 1, 1,
-1.609916, -0.4087333, -1.010229, 1, 0, 0, 1, 1,
-1.60838, 0.1396191, -0.4048898, 1, 0, 0, 1, 1,
-1.604171, 0.1041662, -1.722786, 0, 0, 0, 1, 1,
-1.596199, 0.2677579, -0.4703197, 0, 0, 0, 1, 1,
-1.578981, 0.01267979, -2.778845, 0, 0, 0, 1, 1,
-1.549004, -0.009903089, -0.5299702, 0, 0, 0, 1, 1,
-1.543265, -0.9551474, -1.449861, 0, 0, 0, 1, 1,
-1.530715, -2.342845, -1.849122, 0, 0, 0, 1, 1,
-1.523686, 1.416712, -0.6406459, 0, 0, 0, 1, 1,
-1.521527, 0.2666469, -1.766258, 1, 1, 1, 1, 1,
-1.516727, -0.3069558, -1.130519, 1, 1, 1, 1, 1,
-1.510909, 1.35792, -1.028088, 1, 1, 1, 1, 1,
-1.510842, 0.2585361, -2.524574, 1, 1, 1, 1, 1,
-1.506774, 0.4034154, -1.713136, 1, 1, 1, 1, 1,
-1.502742, -0.6428642, -2.356719, 1, 1, 1, 1, 1,
-1.498405, 1.257321, -1.753132, 1, 1, 1, 1, 1,
-1.498048, 0.1652031, -1.686256, 1, 1, 1, 1, 1,
-1.485273, 1.366364, -0.6961666, 1, 1, 1, 1, 1,
-1.47779, 0.5118347, -0.3989348, 1, 1, 1, 1, 1,
-1.474335, 1.492157, -0.9976383, 1, 1, 1, 1, 1,
-1.474071, -1.153098, -3.272746, 1, 1, 1, 1, 1,
-1.453218, -0.9447522, -1.599543, 1, 1, 1, 1, 1,
-1.448327, 0.5711261, -1.257434, 1, 1, 1, 1, 1,
-1.44715, -1.171329, -0.3055493, 1, 1, 1, 1, 1,
-1.445574, 0.9645238, -2.961667, 0, 0, 1, 1, 1,
-1.44246, -0.5953252, -2.030989, 1, 0, 0, 1, 1,
-1.426469, 0.6049293, -0.4731947, 1, 0, 0, 1, 1,
-1.413575, -0.08638545, -2.763694, 1, 0, 0, 1, 1,
-1.411236, 2.076462, 1.041745, 1, 0, 0, 1, 1,
-1.410902, 0.4930103, 0.4317892, 1, 0, 0, 1, 1,
-1.388628, -0.3318244, 0.4506994, 0, 0, 0, 1, 1,
-1.387247, 0.5217116, -2.437216, 0, 0, 0, 1, 1,
-1.386304, -1.009875, -1.305379, 0, 0, 0, 1, 1,
-1.381811, 0.3498215, -1.769491, 0, 0, 0, 1, 1,
-1.362594, 0.06670959, -1.071476, 0, 0, 0, 1, 1,
-1.361355, -0.4022397, -1.673622, 0, 0, 0, 1, 1,
-1.35919, 0.5470104, -0.8167751, 0, 0, 0, 1, 1,
-1.354004, 0.7864359, -2.880747, 1, 1, 1, 1, 1,
-1.353455, 0.6724255, -1.784141, 1, 1, 1, 1, 1,
-1.347864, 0.2362088, -0.6694333, 1, 1, 1, 1, 1,
-1.344107, 0.2627069, -0.4302007, 1, 1, 1, 1, 1,
-1.336367, 0.07794452, -1.887832, 1, 1, 1, 1, 1,
-1.328893, 0.4441675, -2.652378, 1, 1, 1, 1, 1,
-1.318805, 0.539027, -0.200175, 1, 1, 1, 1, 1,
-1.317263, 0.3716331, -0.9478161, 1, 1, 1, 1, 1,
-1.315173, -0.3751159, -1.120034, 1, 1, 1, 1, 1,
-1.308864, -0.7882754, -2.523092, 1, 1, 1, 1, 1,
-1.308675, -0.6290022, -1.881943, 1, 1, 1, 1, 1,
-1.302803, 1.134525, -0.1067333, 1, 1, 1, 1, 1,
-1.299296, -0.8294694, -0.7601299, 1, 1, 1, 1, 1,
-1.297052, -0.5268347, -2.219792, 1, 1, 1, 1, 1,
-1.290454, -1.453451, -1.830933, 1, 1, 1, 1, 1,
-1.289932, 2.337791, -0.4326816, 0, 0, 1, 1, 1,
-1.285102, 0.8773227, -2.186295, 1, 0, 0, 1, 1,
-1.283852, 0.3819526, -3.000259, 1, 0, 0, 1, 1,
-1.281719, -0.1992903, -1.412253, 1, 0, 0, 1, 1,
-1.274891, 0.2534359, -0.2223638, 1, 0, 0, 1, 1,
-1.273864, 0.1462224, -1.042691, 1, 0, 0, 1, 1,
-1.271158, -0.0880679, -2.601024, 0, 0, 0, 1, 1,
-1.268766, -0.715396, -3.999972, 0, 0, 0, 1, 1,
-1.266915, 1.184766, -0.33321, 0, 0, 0, 1, 1,
-1.266892, -1.042321, -1.963527, 0, 0, 0, 1, 1,
-1.263504, -0.3043237, -1.432299, 0, 0, 0, 1, 1,
-1.257205, 0.01253804, -3.208534, 0, 0, 0, 1, 1,
-1.251916, 0.7033659, -1.429053, 0, 0, 0, 1, 1,
-1.250915, -0.0682687, -2.006796, 1, 1, 1, 1, 1,
-1.250006, 0.04367822, -2.032872, 1, 1, 1, 1, 1,
-1.243953, 1.065837, -3.118008, 1, 1, 1, 1, 1,
-1.240772, 0.4802344, -0.6737046, 1, 1, 1, 1, 1,
-1.237607, -1.024427, -2.927683, 1, 1, 1, 1, 1,
-1.236967, -1.722806, -2.692559, 1, 1, 1, 1, 1,
-1.226922, -1.698388, -2.11961, 1, 1, 1, 1, 1,
-1.223278, 0.4931158, -0.7591513, 1, 1, 1, 1, 1,
-1.221611, -0.2335044, -2.795653, 1, 1, 1, 1, 1,
-1.216659, 1.39795, -0.04157153, 1, 1, 1, 1, 1,
-1.216345, -0.1576852, -2.198244, 1, 1, 1, 1, 1,
-1.209835, -0.5978115, -2.649424, 1, 1, 1, 1, 1,
-1.209584, 0.6024551, 0.7848155, 1, 1, 1, 1, 1,
-1.208855, -0.5082548, -2.613378, 1, 1, 1, 1, 1,
-1.206433, -1.97704, -3.456202, 1, 1, 1, 1, 1,
-1.205406, -0.4683672, -3.580855, 0, 0, 1, 1, 1,
-1.202027, -0.3577, -1.89781, 1, 0, 0, 1, 1,
-1.200834, -0.3277275, -1.949062, 1, 0, 0, 1, 1,
-1.200122, -0.168439, -1.27048, 1, 0, 0, 1, 1,
-1.198065, -0.03049445, -2.871875, 1, 0, 0, 1, 1,
-1.188692, -0.9039648, -2.860148, 1, 0, 0, 1, 1,
-1.185958, -0.971136, -3.247388, 0, 0, 0, 1, 1,
-1.182958, 1.570864, -0.6520939, 0, 0, 0, 1, 1,
-1.182768, 0.8131751, -2.208722, 0, 0, 0, 1, 1,
-1.174187, -1.884451, -2.867771, 0, 0, 0, 1, 1,
-1.172919, -0.08351727, -2.586705, 0, 0, 0, 1, 1,
-1.156836, -0.7386586, -1.591003, 0, 0, 0, 1, 1,
-1.144234, -0.575735, -1.50438, 0, 0, 0, 1, 1,
-1.133338, 0.9058974, -0.6563155, 1, 1, 1, 1, 1,
-1.132949, -0.4366178, -0.3576652, 1, 1, 1, 1, 1,
-1.118205, 0.2885663, -1.908223, 1, 1, 1, 1, 1,
-1.116661, -0.271692, -3.211059, 1, 1, 1, 1, 1,
-1.111722, 1.155338, -0.07605629, 1, 1, 1, 1, 1,
-1.108544, 0.8738835, -0.4417276, 1, 1, 1, 1, 1,
-1.107371, -1.20111, -4.156835, 1, 1, 1, 1, 1,
-1.105693, 1.993562, 0.8880401, 1, 1, 1, 1, 1,
-1.103456, 1.594845, -0.5564858, 1, 1, 1, 1, 1,
-1.101912, 0.3806215, -0.9109023, 1, 1, 1, 1, 1,
-1.095085, 0.04371397, -1.824791, 1, 1, 1, 1, 1,
-1.09173, -0.7996595, -1.180968, 1, 1, 1, 1, 1,
-1.083338, -0.04338834, -1.817287, 1, 1, 1, 1, 1,
-1.081155, 0.4253916, -1.282208, 1, 1, 1, 1, 1,
-1.0624, -0.1326418, -2.34422, 1, 1, 1, 1, 1,
-1.053647, 1.189543, -0.3306249, 0, 0, 1, 1, 1,
-1.051007, 1.074209, 0.5140824, 1, 0, 0, 1, 1,
-1.049077, 0.7195028, -0.7201388, 1, 0, 0, 1, 1,
-1.047848, -0.8595007, -0.6702873, 1, 0, 0, 1, 1,
-1.046364, 0.0700253, -2.102408, 1, 0, 0, 1, 1,
-1.03107, 0.5844172, -0.547175, 1, 0, 0, 1, 1,
-1.023147, -0.3932287, -2.776401, 0, 0, 0, 1, 1,
-1.023063, 0.4511197, -0.8799529, 0, 0, 0, 1, 1,
-1.012464, 0.364764, -2.799957, 0, 0, 0, 1, 1,
-1.007974, 0.03450154, -1.700082, 0, 0, 0, 1, 1,
-1.001808, 0.5765455, 0.08150079, 0, 0, 0, 1, 1,
-1.001256, 1.050556, -0.431243, 0, 0, 0, 1, 1,
-1.001026, 1.364254, -0.5765281, 0, 0, 0, 1, 1,
-0.9949073, -0.4086221, -1.95628, 1, 1, 1, 1, 1,
-0.9943286, 0.5098897, -1.477762, 1, 1, 1, 1, 1,
-0.9866284, -1.501954, -2.49253, 1, 1, 1, 1, 1,
-0.9830033, -1.031724, -3.706833, 1, 1, 1, 1, 1,
-0.9722632, -0.8043373, -3.809199, 1, 1, 1, 1, 1,
-0.9710751, -1.159179, -1.745942, 1, 1, 1, 1, 1,
-0.9677218, 0.6295173, 0.3187341, 1, 1, 1, 1, 1,
-0.9633983, -0.5338992, -2.118831, 1, 1, 1, 1, 1,
-0.9577951, -0.1786682, -0.7538031, 1, 1, 1, 1, 1,
-0.9566829, -0.7469276, -2.86728, 1, 1, 1, 1, 1,
-0.9556594, -1.545983, -3.726517, 1, 1, 1, 1, 1,
-0.9550749, -0.08179104, -1.634737, 1, 1, 1, 1, 1,
-0.9497153, -0.8914385, -2.731019, 1, 1, 1, 1, 1,
-0.9447064, 0.2963514, -2.398161, 1, 1, 1, 1, 1,
-0.9396495, 0.952114, -2.430147, 1, 1, 1, 1, 1,
-0.9393015, 0.8397394, -1.865867, 0, 0, 1, 1, 1,
-0.9375325, -0.98345, -3.368617, 1, 0, 0, 1, 1,
-0.9314783, -0.8764197, -2.846162, 1, 0, 0, 1, 1,
-0.9272859, -1.103648, -1.470132, 1, 0, 0, 1, 1,
-0.9219907, 0.3556551, 0.3610601, 1, 0, 0, 1, 1,
-0.9158942, -0.550583, -3.054118, 1, 0, 0, 1, 1,
-0.9145672, -0.1569263, -2.100047, 0, 0, 0, 1, 1,
-0.9099356, 0.4504249, -0.8007123, 0, 0, 0, 1, 1,
-0.9043907, -0.000323113, -0.9809744, 0, 0, 0, 1, 1,
-0.8820116, 0.6834059, 0.9817241, 0, 0, 0, 1, 1,
-0.8810953, -1.783919, -3.482784, 0, 0, 0, 1, 1,
-0.8749363, -1.248945, -0.8741486, 0, 0, 0, 1, 1,
-0.874276, -0.2863305, -2.502255, 0, 0, 0, 1, 1,
-0.8687874, -0.1573696, -1.245202, 1, 1, 1, 1, 1,
-0.8672751, 0.03941288, -0.5184229, 1, 1, 1, 1, 1,
-0.8609781, 0.4656536, -0.1513951, 1, 1, 1, 1, 1,
-0.8576092, 0.7061208, -1.318901, 1, 1, 1, 1, 1,
-0.855924, 0.8639697, -0.9555105, 1, 1, 1, 1, 1,
-0.8549832, -0.3418844, -1.963179, 1, 1, 1, 1, 1,
-0.8537529, -0.1132536, -0.8896892, 1, 1, 1, 1, 1,
-0.8514276, 0.7545656, -2.422481, 1, 1, 1, 1, 1,
-0.8509573, 1.639609, -2.328174, 1, 1, 1, 1, 1,
-0.8502995, -0.7486632, -1.996953, 1, 1, 1, 1, 1,
-0.848797, -0.9680598, -1.445387, 1, 1, 1, 1, 1,
-0.8485057, 2.047371, 0.7939034, 1, 1, 1, 1, 1,
-0.8477703, -0.3589893, -1.912849, 1, 1, 1, 1, 1,
-0.8442084, -0.3721763, -3.308591, 1, 1, 1, 1, 1,
-0.8431024, 0.1443108, -1.423875, 1, 1, 1, 1, 1,
-0.8426001, 0.3395309, 0.199549, 0, 0, 1, 1, 1,
-0.8411788, -0.6647825, -0.7493566, 1, 0, 0, 1, 1,
-0.831491, -0.4570997, -2.171896, 1, 0, 0, 1, 1,
-0.8235271, 0.1229565, -1.569039, 1, 0, 0, 1, 1,
-0.8170264, 0.04986293, 0.6367903, 1, 0, 0, 1, 1,
-0.8150933, -2.338101, -4.712082, 1, 0, 0, 1, 1,
-0.8150511, 0.7063642, 0.1414909, 0, 0, 0, 1, 1,
-0.8149681, -0.07706833, -3.751086, 0, 0, 0, 1, 1,
-0.8108147, 0.884621, -2.993871, 0, 0, 0, 1, 1,
-0.8029565, -0.03563352, -1.374982, 0, 0, 0, 1, 1,
-0.7991844, -0.04875743, -0.08966433, 0, 0, 0, 1, 1,
-0.7980811, 0.4622327, -0.6785629, 0, 0, 0, 1, 1,
-0.7975172, 0.3408985, -2.000553, 0, 0, 0, 1, 1,
-0.7923703, 0.2572126, -1.962639, 1, 1, 1, 1, 1,
-0.7820798, -1.438813, -3.593156, 1, 1, 1, 1, 1,
-0.7815806, 0.3371834, -0.3047224, 1, 1, 1, 1, 1,
-0.7799149, -0.5320104, -1.283982, 1, 1, 1, 1, 1,
-0.775747, 1.526781, -0.9768336, 1, 1, 1, 1, 1,
-0.7753134, -0.004109362, -3.565756, 1, 1, 1, 1, 1,
-0.7606266, -0.4180923, -1.986294, 1, 1, 1, 1, 1,
-0.7405374, -1.019427, -4.67275, 1, 1, 1, 1, 1,
-0.7376405, -1.047341, -1.951409, 1, 1, 1, 1, 1,
-0.7320147, 0.7434843, -1.199656, 1, 1, 1, 1, 1,
-0.7289649, 0.2547643, -0.9407918, 1, 1, 1, 1, 1,
-0.7239645, 0.06036161, -0.6983088, 1, 1, 1, 1, 1,
-0.7157009, 0.009218745, -1.453626, 1, 1, 1, 1, 1,
-0.7061732, -1.338659, -3.510633, 1, 1, 1, 1, 1,
-0.7049483, -1.229459, -3.68903, 1, 1, 1, 1, 1,
-0.7015613, -0.455197, -3.555987, 0, 0, 1, 1, 1,
-0.69743, 0.1737121, -1.60416, 1, 0, 0, 1, 1,
-0.6973528, -0.7147416, -3.311826, 1, 0, 0, 1, 1,
-0.693889, -0.7114444, -1.526514, 1, 0, 0, 1, 1,
-0.6852598, 0.1731014, -2.459376, 1, 0, 0, 1, 1,
-0.6796322, 0.7903682, -1.246263, 1, 0, 0, 1, 1,
-0.6783329, -0.004457034, -1.27938, 0, 0, 0, 1, 1,
-0.6729021, 1.424639, 0.9342098, 0, 0, 0, 1, 1,
-0.6721038, 1.281363, -1.226354, 0, 0, 0, 1, 1,
-0.6663115, -2.19245, -2.889267, 0, 0, 0, 1, 1,
-0.6657979, 1.203933, -1.855524, 0, 0, 0, 1, 1,
-0.6649209, 1.036486, -0.1185082, 0, 0, 0, 1, 1,
-0.6600412, -0.8758967, -0.9235179, 0, 0, 0, 1, 1,
-0.6595657, -0.05189732, -3.044568, 1, 1, 1, 1, 1,
-0.6449722, -0.4452139, -0.7254947, 1, 1, 1, 1, 1,
-0.6410496, -0.6748889, -3.672549, 1, 1, 1, 1, 1,
-0.6396962, -0.4183234, -2.907966, 1, 1, 1, 1, 1,
-0.6378132, 0.7341963, -0.9578097, 1, 1, 1, 1, 1,
-0.6367108, 0.3701188, -2.721919, 1, 1, 1, 1, 1,
-0.6359575, -1.412115, -3.742241, 1, 1, 1, 1, 1,
-0.6345571, 0.3400714, -1.677122, 1, 1, 1, 1, 1,
-0.6339148, -0.176927, -2.464549, 1, 1, 1, 1, 1,
-0.6338917, -0.4146339, -2.150781, 1, 1, 1, 1, 1,
-0.6334294, -0.1494868, -1.300514, 1, 1, 1, 1, 1,
-0.6325188, -1.335886, -1.76563, 1, 1, 1, 1, 1,
-0.6311499, 0.5306311, -1.581476, 1, 1, 1, 1, 1,
-0.6199756, 1.647233, -2.200958, 1, 1, 1, 1, 1,
-0.618907, -0.03857015, -1.219077, 1, 1, 1, 1, 1,
-0.6147811, -0.7371836, -1.727245, 0, 0, 1, 1, 1,
-0.6118158, 0.7149566, -0.1112786, 1, 0, 0, 1, 1,
-0.6091973, -0.9204846, -2.021939, 1, 0, 0, 1, 1,
-0.6063294, 1.119057, -3.261262, 1, 0, 0, 1, 1,
-0.5979494, -1.087353, -1.861291, 1, 0, 0, 1, 1,
-0.597845, 0.3579895, -0.6619754, 1, 0, 0, 1, 1,
-0.5969289, 0.6338708, 0.3324061, 0, 0, 0, 1, 1,
-0.5956667, 1.321988, -1.221142, 0, 0, 0, 1, 1,
-0.5891235, 1.535078, -0.856331, 0, 0, 0, 1, 1,
-0.5887214, 1.000228, -1.348014, 0, 0, 0, 1, 1,
-0.5855516, -1.363138, -1.833149, 0, 0, 0, 1, 1,
-0.5854129, -1.079391, -2.748132, 0, 0, 0, 1, 1,
-0.5787661, 0.05793275, 0.4325281, 0, 0, 0, 1, 1,
-0.5774, 0.1627633, -1.5626, 1, 1, 1, 1, 1,
-0.5725288, 0.998273, -0.749767, 1, 1, 1, 1, 1,
-0.5648636, -0.3366635, -1.8076, 1, 1, 1, 1, 1,
-0.5631289, 1.036146, -0.4689127, 1, 1, 1, 1, 1,
-0.5573024, -0.9756369, -1.38459, 1, 1, 1, 1, 1,
-0.5565427, -0.3416393, -0.9043484, 1, 1, 1, 1, 1,
-0.5526428, 0.4448833, -0.3168958, 1, 1, 1, 1, 1,
-0.5497729, -1.232547, -2.610282, 1, 1, 1, 1, 1,
-0.5478907, -0.05587401, -1.697936, 1, 1, 1, 1, 1,
-0.5471229, 0.1220976, 0.8309399, 1, 1, 1, 1, 1,
-0.5461378, 1.341603, -2.458991, 1, 1, 1, 1, 1,
-0.5449852, -1.966375, -3.090899, 1, 1, 1, 1, 1,
-0.542348, 0.5859697, -0.3933971, 1, 1, 1, 1, 1,
-0.5399289, 0.872209, -0.5364492, 1, 1, 1, 1, 1,
-0.533212, 2.520756, -0.8552315, 1, 1, 1, 1, 1,
-0.5304527, 0.5179669, -0.3861134, 0, 0, 1, 1, 1,
-0.5280752, 0.07728703, -2.706418, 1, 0, 0, 1, 1,
-0.5253259, -0.7336501, -1.893376, 1, 0, 0, 1, 1,
-0.518585, 0.4403507, 0.03630437, 1, 0, 0, 1, 1,
-0.5159283, 0.02366258, -1.533416, 1, 0, 0, 1, 1,
-0.5134153, -0.7035456, -1.767599, 1, 0, 0, 1, 1,
-0.5045594, 0.6026595, -0.7313644, 0, 0, 0, 1, 1,
-0.5042209, 1.37103, 1.009126, 0, 0, 0, 1, 1,
-0.5030031, 0.920108, 0.1855981, 0, 0, 0, 1, 1,
-0.5029526, 0.7065143, -0.118447, 0, 0, 0, 1, 1,
-0.4995409, -0.7337989, -2.35488, 0, 0, 0, 1, 1,
-0.4992931, 0.07906169, -3.208331, 0, 0, 0, 1, 1,
-0.4966293, 1.506514, 0.6317902, 0, 0, 0, 1, 1,
-0.4932256, 0.3509733, -2.642938, 1, 1, 1, 1, 1,
-0.4913194, -0.838496, -2.09149, 1, 1, 1, 1, 1,
-0.4913082, 1.068828, 0.1324396, 1, 1, 1, 1, 1,
-0.4880728, 1.400079, -0.5489386, 1, 1, 1, 1, 1,
-0.4876788, -1.195036, -3.564694, 1, 1, 1, 1, 1,
-0.4871556, 0.07690662, -1.395484, 1, 1, 1, 1, 1,
-0.4839257, 1.970156, -1.60551, 1, 1, 1, 1, 1,
-0.4801367, 0.8419151, -1.5216, 1, 1, 1, 1, 1,
-0.4791129, 0.7700055, 0.4733795, 1, 1, 1, 1, 1,
-0.4783502, -0.5580893, -3.258507, 1, 1, 1, 1, 1,
-0.4735491, -0.4204684, -2.197577, 1, 1, 1, 1, 1,
-0.4727648, -0.8568356, -3.378014, 1, 1, 1, 1, 1,
-0.4719549, 0.8347459, -0.050648, 1, 1, 1, 1, 1,
-0.4712189, 1.369869, -1.589377, 1, 1, 1, 1, 1,
-0.4654969, 0.8648919, 0.5208905, 1, 1, 1, 1, 1,
-0.4601792, 1.00526, -0.3275161, 0, 0, 1, 1, 1,
-0.4585261, 0.0409807, -0.851427, 1, 0, 0, 1, 1,
-0.4538025, 0.9196087, -0.5014173, 1, 0, 0, 1, 1,
-0.4532486, 1.028844, -1.489501, 1, 0, 0, 1, 1,
-0.4502398, -0.222599, -2.374299, 1, 0, 0, 1, 1,
-0.4467866, 1.069123, -0.05606713, 1, 0, 0, 1, 1,
-0.4410912, 1.087172, -1.992312, 0, 0, 0, 1, 1,
-0.4383509, -0.9706853, -3.580447, 0, 0, 0, 1, 1,
-0.438232, 0.08286842, -1.289937, 0, 0, 0, 1, 1,
-0.435948, 0.6094567, -1.036331, 0, 0, 0, 1, 1,
-0.435708, 0.1114882, -2.366257, 0, 0, 0, 1, 1,
-0.4334565, 1.096638, 0.723537, 0, 0, 0, 1, 1,
-0.4330199, -0.06009318, -1.923722, 0, 0, 0, 1, 1,
-0.4299349, 0.1973511, -0.893296, 1, 1, 1, 1, 1,
-0.4247243, 0.5756828, -0.2326515, 1, 1, 1, 1, 1,
-0.4241472, 1.02186, 0.2864656, 1, 1, 1, 1, 1,
-0.4237574, -0.06974447, -0.6196158, 1, 1, 1, 1, 1,
-0.4167592, -0.8248647, -0.8756632, 1, 1, 1, 1, 1,
-0.4166751, -1.297926, -3.612588, 1, 1, 1, 1, 1,
-0.4120829, 2.471081, 1.169483, 1, 1, 1, 1, 1,
-0.4107092, -0.460552, -2.840067, 1, 1, 1, 1, 1,
-0.4101763, -1.087975, -3.665447, 1, 1, 1, 1, 1,
-0.4092814, 0.5412561, 0.6016494, 1, 1, 1, 1, 1,
-0.4084666, 1.280885, -2.515121, 1, 1, 1, 1, 1,
-0.4083597, -0.8935543, -1.157454, 1, 1, 1, 1, 1,
-0.4074981, 0.1636742, -0.4790385, 1, 1, 1, 1, 1,
-0.4067486, -0.6484311, -3.54889, 1, 1, 1, 1, 1,
-0.4061419, 0.2102081, -1.871648, 1, 1, 1, 1, 1,
-0.4019345, -0.3475858, -1.414703, 0, 0, 1, 1, 1,
-0.4011598, 0.6575658, -0.8566735, 1, 0, 0, 1, 1,
-0.4003098, 3.112437, 0.3748562, 1, 0, 0, 1, 1,
-0.3935234, 0.2587698, -0.1317859, 1, 0, 0, 1, 1,
-0.3912446, -1.286587, -3.092497, 1, 0, 0, 1, 1,
-0.390796, 0.04444593, -1.317572, 1, 0, 0, 1, 1,
-0.3885063, 0.2800712, -0.770551, 0, 0, 0, 1, 1,
-0.3871959, -0.197662, -1.817625, 0, 0, 0, 1, 1,
-0.383154, -0.2170493, -1.154495, 0, 0, 0, 1, 1,
-0.3795504, -1.046053, -1.964943, 0, 0, 0, 1, 1,
-0.379012, -0.3619888, -1.86815, 0, 0, 0, 1, 1,
-0.375824, 1.044069, -0.300611, 0, 0, 0, 1, 1,
-0.3737684, -1.119719, -1.922238, 0, 0, 0, 1, 1,
-0.3681519, 1.337399, 0.04431736, 1, 1, 1, 1, 1,
-0.365344, 1.333234, 1.010864, 1, 1, 1, 1, 1,
-0.3645554, -0.1229463, -2.193259, 1, 1, 1, 1, 1,
-0.3639792, -0.2693834, -0.9540725, 1, 1, 1, 1, 1,
-0.3636121, -1.066455, -3.441355, 1, 1, 1, 1, 1,
-0.357864, 0.7567748, 0.3544034, 1, 1, 1, 1, 1,
-0.356438, -0.03939898, -2.474503, 1, 1, 1, 1, 1,
-0.3562716, -0.06030964, -2.330686, 1, 1, 1, 1, 1,
-0.3553632, -0.622133, -1.311179, 1, 1, 1, 1, 1,
-0.3506327, 0.00200758, -2.006524, 1, 1, 1, 1, 1,
-0.344009, 0.02481855, -2.500296, 1, 1, 1, 1, 1,
-0.342362, 1.262628, -0.4173325, 1, 1, 1, 1, 1,
-0.3390166, -0.2201359, -3.053706, 1, 1, 1, 1, 1,
-0.3234653, 1.554627, -0.7082579, 1, 1, 1, 1, 1,
-0.3203239, -0.7522067, -3.200654, 1, 1, 1, 1, 1,
-0.3160484, -0.8287954, -4.804641, 0, 0, 1, 1, 1,
-0.3108456, -1.536808, -3.746706, 1, 0, 0, 1, 1,
-0.3092598, 0.393507, 1.896834, 1, 0, 0, 1, 1,
-0.3070454, -0.0122944, -1.030753, 1, 0, 0, 1, 1,
-0.3033604, -1.634443, -0.5399458, 1, 0, 0, 1, 1,
-0.3021809, -1.187719, -3.023195, 1, 0, 0, 1, 1,
-0.3002194, -0.9882491, -2.747007, 0, 0, 0, 1, 1,
-0.2979527, -1.190033, -3.359998, 0, 0, 0, 1, 1,
-0.2927861, 0.3379627, -0.839005, 0, 0, 0, 1, 1,
-0.2912215, -0.8570263, -3.026246, 0, 0, 0, 1, 1,
-0.2897715, -0.8597882, -3.14434, 0, 0, 0, 1, 1,
-0.2891098, 0.4180394, 0.1991426, 0, 0, 0, 1, 1,
-0.2869183, 0.5105607, -2.788167, 0, 0, 0, 1, 1,
-0.2867031, -0.9552253, -3.080972, 1, 1, 1, 1, 1,
-0.2850136, 0.5593821, -0.7129374, 1, 1, 1, 1, 1,
-0.2791966, 0.1752447, -0.9357765, 1, 1, 1, 1, 1,
-0.2761594, -0.3530504, -2.853231, 1, 1, 1, 1, 1,
-0.2703767, 0.2000178, -2.68811, 1, 1, 1, 1, 1,
-0.2632081, 0.8516477, -1.151914, 1, 1, 1, 1, 1,
-0.2629017, -0.4364069, -1.487498, 1, 1, 1, 1, 1,
-0.2608682, -0.5756693, -2.293906, 1, 1, 1, 1, 1,
-0.2591082, -0.5139472, -2.98949, 1, 1, 1, 1, 1,
-0.2564478, -1.670267, -2.748267, 1, 1, 1, 1, 1,
-0.2563626, -0.4799668, -1.751365, 1, 1, 1, 1, 1,
-0.2522534, 2.667818, -0.9072676, 1, 1, 1, 1, 1,
-0.2497155, -0.1721214, -1.918066, 1, 1, 1, 1, 1,
-0.248342, 0.1760239, -1.525362, 1, 1, 1, 1, 1,
-0.2478824, 0.67665, 0.7931746, 1, 1, 1, 1, 1,
-0.2465641, -0.9751979, -1.674925, 0, 0, 1, 1, 1,
-0.2448473, -0.6059539, -3.993784, 1, 0, 0, 1, 1,
-0.2442964, -0.1486171, -2.129198, 1, 0, 0, 1, 1,
-0.2402464, 1.150837, -0.4485662, 1, 0, 0, 1, 1,
-0.2378115, 0.874277, -0.09118921, 1, 0, 0, 1, 1,
-0.2328693, 0.7200137, 0.7053024, 1, 0, 0, 1, 1,
-0.2322864, -0.2233839, -3.172025, 0, 0, 0, 1, 1,
-0.2319441, 0.68151, -0.08243829, 0, 0, 0, 1, 1,
-0.2307205, 0.5113979, -1.00499, 0, 0, 0, 1, 1,
-0.228686, -0.2110728, -2.048738, 0, 0, 0, 1, 1,
-0.2259153, 0.5687962, 1.145611, 0, 0, 0, 1, 1,
-0.2255593, 0.6144415, -0.6165965, 0, 0, 0, 1, 1,
-0.2237981, -1.021711, -2.732057, 0, 0, 0, 1, 1,
-0.2211169, 0.09152753, -2.447415, 1, 1, 1, 1, 1,
-0.2192845, -1.551034, -2.120417, 1, 1, 1, 1, 1,
-0.2185611, 1.599636, 0.629733, 1, 1, 1, 1, 1,
-0.2174513, 1.234761, -0.6748533, 1, 1, 1, 1, 1,
-0.2153604, 0.3916845, -1.205124, 1, 1, 1, 1, 1,
-0.2138953, -0.3537819, -2.530125, 1, 1, 1, 1, 1,
-0.2126704, -1.663295, -3.185685, 1, 1, 1, 1, 1,
-0.2120387, 1.892898, -1.525131, 1, 1, 1, 1, 1,
-0.2106135, -0.5638804, -2.554718, 1, 1, 1, 1, 1,
-0.2095424, 1.224853, 0.9677066, 1, 1, 1, 1, 1,
-0.2073296, -1.476177, -3.749519, 1, 1, 1, 1, 1,
-0.19779, 0.03241765, -1.965995, 1, 1, 1, 1, 1,
-0.1962928, -0.9306405, -2.878695, 1, 1, 1, 1, 1,
-0.1917852, 1.472749, -0.7430487, 1, 1, 1, 1, 1,
-0.191427, 0.6710586, -2.107664, 1, 1, 1, 1, 1,
-0.1911871, -0.3909111, -2.808941, 0, 0, 1, 1, 1,
-0.1908094, 0.4284337, 0.204053, 1, 0, 0, 1, 1,
-0.1904017, 2.558609, -0.06225532, 1, 0, 0, 1, 1,
-0.1853272, -0.4580092, -2.194347, 1, 0, 0, 1, 1,
-0.1840792, -0.5666015, -2.448203, 1, 0, 0, 1, 1,
-0.1822112, 0.8556351, -2.833062, 1, 0, 0, 1, 1,
-0.1791034, 1.227425, -0.1846691, 0, 0, 0, 1, 1,
-0.1776665, 0.4331603, 1.522935, 0, 0, 0, 1, 1,
-0.1745729, 0.08704913, -0.05528176, 0, 0, 0, 1, 1,
-0.1741391, 0.5565941, 0.4271227, 0, 0, 0, 1, 1,
-0.1734815, 0.4044282, -1.072207, 0, 0, 0, 1, 1,
-0.1664357, -0.8083507, -2.572659, 0, 0, 0, 1, 1,
-0.164412, 0.6305146, -1.82659, 0, 0, 0, 1, 1,
-0.1630285, -0.5499641, -2.975811, 1, 1, 1, 1, 1,
-0.1620838, 0.8648846, 1.251671, 1, 1, 1, 1, 1,
-0.1593204, 0.3910974, -2.800924, 1, 1, 1, 1, 1,
-0.157227, 0.4460779, -0.00361746, 1, 1, 1, 1, 1,
-0.1537828, -0.2677463, -3.806646, 1, 1, 1, 1, 1,
-0.1494971, 0.2805846, -1.529222, 1, 1, 1, 1, 1,
-0.14777, -0.8203037, -3.654923, 1, 1, 1, 1, 1,
-0.1471924, 1.160283, -1.841691, 1, 1, 1, 1, 1,
-0.143466, -1.184289, -3.554341, 1, 1, 1, 1, 1,
-0.1322191, 2.11125, 2.331394, 1, 1, 1, 1, 1,
-0.1314332, -1.627471, -4.649589, 1, 1, 1, 1, 1,
-0.1282798, 0.383938, -0.1866874, 1, 1, 1, 1, 1,
-0.1268774, -0.3850706, -1.984297, 1, 1, 1, 1, 1,
-0.1256959, 0.7633026, -0.7306387, 1, 1, 1, 1, 1,
-0.1230276, -0.1832257, -1.926547, 1, 1, 1, 1, 1,
-0.1177724, -0.744801, -2.592329, 0, 0, 1, 1, 1,
-0.1173139, -0.2176886, -2.159605, 1, 0, 0, 1, 1,
-0.1120725, 0.5075621, -0.2303381, 1, 0, 0, 1, 1,
-0.1117655, -0.7033855, -3.908715, 1, 0, 0, 1, 1,
-0.1117049, 0.312264, 0.1387231, 1, 0, 0, 1, 1,
-0.1115264, -0.4204789, -2.25861, 1, 0, 0, 1, 1,
-0.1103148, 1.150428, 0.6624361, 0, 0, 0, 1, 1,
-0.109299, -0.5640827, -2.727922, 0, 0, 0, 1, 1,
-0.1081569, -0.33272, -0.6042076, 0, 0, 0, 1, 1,
-0.1078091, 2.146783, 0.0511606, 0, 0, 0, 1, 1,
-0.1074736, -2.227875, -3.30887, 0, 0, 0, 1, 1,
-0.1041362, -0.2365584, -2.834654, 0, 0, 0, 1, 1,
-0.1022661, 0.5261917, 1.081059, 0, 0, 0, 1, 1,
-0.1014833, 1.533014, 0.4078492, 1, 1, 1, 1, 1,
-0.09979266, -0.0042717, -0.4020608, 1, 1, 1, 1, 1,
-0.09889459, 0.1311566, -1.664401, 1, 1, 1, 1, 1,
-0.09767843, -0.09122632, -2.330469, 1, 1, 1, 1, 1,
-0.0929115, -0.7241235, -3.243636, 1, 1, 1, 1, 1,
-0.08926747, -0.6977893, -2.60024, 1, 1, 1, 1, 1,
-0.08076584, -0.6028752, -3.445226, 1, 1, 1, 1, 1,
-0.07989042, 1.138026, 0.7696457, 1, 1, 1, 1, 1,
-0.07741002, 0.4048104, -0.2073644, 1, 1, 1, 1, 1,
-0.07565894, -0.2154205, -2.271657, 1, 1, 1, 1, 1,
-0.07003125, -1.449575, -3.231353, 1, 1, 1, 1, 1,
-0.06720005, -0.05128739, -0.2324963, 1, 1, 1, 1, 1,
-0.06365797, -0.2644735, -4.245446, 1, 1, 1, 1, 1,
-0.06322268, -0.6632397, -0.4344521, 1, 1, 1, 1, 1,
-0.0598578, -0.1899417, -0.7990311, 1, 1, 1, 1, 1,
-0.05879376, 0.4883036, -2.663161, 0, 0, 1, 1, 1,
-0.0559923, -1.604489, -1.435478, 1, 0, 0, 1, 1,
-0.04938293, -1.425673, -3.262071, 1, 0, 0, 1, 1,
-0.04894977, 1.449454, -0.3451084, 1, 0, 0, 1, 1,
-0.04568074, -1.62161, -3.535001, 1, 0, 0, 1, 1,
-0.04383344, -1.193353, -1.817007, 1, 0, 0, 1, 1,
-0.03719971, 1.607053, -0.3217229, 0, 0, 0, 1, 1,
-0.03612884, 1.821975, 1.101663, 0, 0, 0, 1, 1,
-0.02567147, 0.448372, -0.1865769, 0, 0, 0, 1, 1,
-0.02270026, -0.503481, -4.082897, 0, 0, 0, 1, 1,
-0.01729185, 1.890074, -2.106921, 0, 0, 0, 1, 1,
-0.01688192, 0.7112803, 1.828174, 0, 0, 0, 1, 1,
-0.01625239, -1.114736, -3.679734, 0, 0, 0, 1, 1,
-0.01401832, -0.2122373, -3.490327, 1, 1, 1, 1, 1,
-0.008793726, -0.4397178, -4.917101, 1, 1, 1, 1, 1,
-0.007691976, 1.953622, -0.4430903, 1, 1, 1, 1, 1,
-0.007348944, -1.484841, -2.422769, 1, 1, 1, 1, 1,
-0.006305, -0.7470122, -4.294282, 1, 1, 1, 1, 1,
-0.00597825, 0.3703557, 0.04540289, 1, 1, 1, 1, 1,
-0.005356524, 0.5419698, -1.038471, 1, 1, 1, 1, 1,
-0.004303596, 0.4879698, -0.8875098, 1, 1, 1, 1, 1,
-0.002260139, 0.6420863, -0.8736492, 1, 1, 1, 1, 1,
-0.001846622, 1.058849, -0.2528644, 1, 1, 1, 1, 1,
-0.001232542, -1.862305, -1.215288, 1, 1, 1, 1, 1,
-0.0001053409, 0.9056868, -0.9401414, 1, 1, 1, 1, 1,
0.005570003, 1.072528, -0.5955731, 1, 1, 1, 1, 1,
0.006090009, -0.3903266, 1.981058, 1, 1, 1, 1, 1,
0.006278013, 0.6409139, -0.4555736, 1, 1, 1, 1, 1,
0.006583012, 0.368867, -0.9197687, 0, 0, 1, 1, 1,
0.006926239, -0.9280333, 4.181098, 1, 0, 0, 1, 1,
0.009520559, 0.3169079, 1.051249, 1, 0, 0, 1, 1,
0.01249592, 0.5856469, 0.007580054, 1, 0, 0, 1, 1,
0.02152929, -0.9423597, 1.921643, 1, 0, 0, 1, 1,
0.02560288, -0.4345143, 3.082688, 1, 0, 0, 1, 1,
0.04051468, 1.598033, -0.7638624, 0, 0, 0, 1, 1,
0.04055284, -0.2482892, 3.671014, 0, 0, 0, 1, 1,
0.0406637, -0.6420375, 2.867251, 0, 0, 0, 1, 1,
0.04849729, -0.8098897, 3.818613, 0, 0, 0, 1, 1,
0.04867461, -0.1327032, 4.445895, 0, 0, 0, 1, 1,
0.04879125, -0.2142682, 2.63508, 0, 0, 0, 1, 1,
0.04951452, -1.160344, 2.01802, 0, 0, 0, 1, 1,
0.04999827, -0.9356406, 4.881865, 1, 1, 1, 1, 1,
0.05419223, -0.9649511, 2.770631, 1, 1, 1, 1, 1,
0.05457727, 0.2173109, -1.164181, 1, 1, 1, 1, 1,
0.05656074, -0.6737322, 2.856654, 1, 1, 1, 1, 1,
0.06651437, -1.177624, 2.785327, 1, 1, 1, 1, 1,
0.07085413, 1.90159, -0.335161, 1, 1, 1, 1, 1,
0.07091284, -0.6188182, 3.00391, 1, 1, 1, 1, 1,
0.07165713, 0.2995972, 2.247185, 1, 1, 1, 1, 1,
0.0733653, -0.4349442, 4.204733, 1, 1, 1, 1, 1,
0.08062972, -0.646919, 2.02146, 1, 1, 1, 1, 1,
0.08311675, 0.4448421, 0.4464253, 1, 1, 1, 1, 1,
0.08469313, -1.04258, 2.461471, 1, 1, 1, 1, 1,
0.08725742, -0.4688353, 2.032143, 1, 1, 1, 1, 1,
0.08818367, -1.481269, 4.207485, 1, 1, 1, 1, 1,
0.0885426, -1.204283, 4.592426, 1, 1, 1, 1, 1,
0.0921243, 0.6154802, -1.45506, 0, 0, 1, 1, 1,
0.09239047, 1.568217, 0.6600562, 1, 0, 0, 1, 1,
0.09410824, -0.5955532, 3.757214, 1, 0, 0, 1, 1,
0.0993636, 0.8004615, 0.3585733, 1, 0, 0, 1, 1,
0.1000395, -1.014486, 2.772703, 1, 0, 0, 1, 1,
0.1004593, 2.762713, 0.1515326, 1, 0, 0, 1, 1,
0.1007352, 0.6724817, -0.2384352, 0, 0, 0, 1, 1,
0.1024345, 0.3707851, 0.987483, 0, 0, 0, 1, 1,
0.1037398, -1.454262, 2.35423, 0, 0, 0, 1, 1,
0.1045398, 1.295459, 0.793814, 0, 0, 0, 1, 1,
0.1132805, -0.8284724, 3.854219, 0, 0, 0, 1, 1,
0.1189076, -0.1761544, 3.425869, 0, 0, 0, 1, 1,
0.1193133, 0.4683557, 1.280318, 0, 0, 0, 1, 1,
0.1240454, -0.7974765, 2.299667, 1, 1, 1, 1, 1,
0.124711, 1.752238, -0.1752073, 1, 1, 1, 1, 1,
0.130014, -0.1865202, 4.150738, 1, 1, 1, 1, 1,
0.1311341, 0.2736783, -0.02365347, 1, 1, 1, 1, 1,
0.1368974, -0.4884055, 2.673101, 1, 1, 1, 1, 1,
0.137523, 0.7286027, 0.6995175, 1, 1, 1, 1, 1,
0.1394241, 0.8176374, -0.09246858, 1, 1, 1, 1, 1,
0.1457862, -0.3800961, 1.573795, 1, 1, 1, 1, 1,
0.1462909, 0.1639498, 1.208756, 1, 1, 1, 1, 1,
0.1466607, 0.6749647, 0.2406706, 1, 1, 1, 1, 1,
0.1492942, 1.136269, -0.4305324, 1, 1, 1, 1, 1,
0.1499489, -1.19334, 2.654613, 1, 1, 1, 1, 1,
0.1523702, 0.4808205, 0.5128786, 1, 1, 1, 1, 1,
0.15342, -0.1588472, 1.340324, 1, 1, 1, 1, 1,
0.1588046, -0.2556871, 1.447576, 1, 1, 1, 1, 1,
0.1594103, -0.03078174, 1.24382, 0, 0, 1, 1, 1,
0.161234, -0.7788514, 2.158726, 1, 0, 0, 1, 1,
0.1615751, 2.549042, 0.5489329, 1, 0, 0, 1, 1,
0.1630571, -1.324299, 3.402622, 1, 0, 0, 1, 1,
0.1653158, -0.7681947, 2.738832, 1, 0, 0, 1, 1,
0.1675148, 0.008243274, 1.282358, 1, 0, 0, 1, 1,
0.1697388, 0.6218762, -0.4905434, 0, 0, 0, 1, 1,
0.170198, -0.5008391, 3.571718, 0, 0, 0, 1, 1,
0.1721471, -2.559558, 3.446398, 0, 0, 0, 1, 1,
0.1736385, -0.7415538, 3.684949, 0, 0, 0, 1, 1,
0.1794702, -0.7325329, 2.066997, 0, 0, 0, 1, 1,
0.1825115, -1.226445, 4.295469, 0, 0, 0, 1, 1,
0.1827083, 0.4475397, 0.3545673, 0, 0, 0, 1, 1,
0.1867824, 0.7457479, 1.474389, 1, 1, 1, 1, 1,
0.1869674, 1.091323, -0.3785855, 1, 1, 1, 1, 1,
0.1873452, -0.5022445, 3.603094, 1, 1, 1, 1, 1,
0.1877749, 0.4266011, -0.658243, 1, 1, 1, 1, 1,
0.1906385, 1.380175, -0.9819223, 1, 1, 1, 1, 1,
0.1926186, -0.0526225, 1.437525, 1, 1, 1, 1, 1,
0.196321, -0.6940447, 2.911561, 1, 1, 1, 1, 1,
0.1993294, 2.063768, 0.4281355, 1, 1, 1, 1, 1,
0.2105299, -0.5924191, 2.42455, 1, 1, 1, 1, 1,
0.2113173, 0.6881052, -0.5534068, 1, 1, 1, 1, 1,
0.2162522, 0.8408537, 0.2016554, 1, 1, 1, 1, 1,
0.2183604, -0.5142404, 3.020953, 1, 1, 1, 1, 1,
0.2186057, 0.7413938, -1.464496, 1, 1, 1, 1, 1,
0.2198285, -0.2813796, 3.4623, 1, 1, 1, 1, 1,
0.2200756, -0.7096846, 3.510284, 1, 1, 1, 1, 1,
0.2200826, -0.3713542, 3.040972, 0, 0, 1, 1, 1,
0.223136, -0.6292251, 4.242167, 1, 0, 0, 1, 1,
0.2244361, -0.6977543, 0.9761274, 1, 0, 0, 1, 1,
0.2260962, -0.16624, 0.2438495, 1, 0, 0, 1, 1,
0.227407, -0.2265399, 2.482832, 1, 0, 0, 1, 1,
0.2280492, -1.645015, 2.736137, 1, 0, 0, 1, 1,
0.2287557, -0.6991054, 4.071676, 0, 0, 0, 1, 1,
0.2290428, 1.914365, 0.7753159, 0, 0, 0, 1, 1,
0.2303112, 0.9231392, -1.127307, 0, 0, 0, 1, 1,
0.2325641, 1.118358, 1.255867, 0, 0, 0, 1, 1,
0.2344622, -0.2028181, 2.008145, 0, 0, 0, 1, 1,
0.2349938, -0.5424563, 1.493286, 0, 0, 0, 1, 1,
0.2352337, 1.602024, 0.5714379, 0, 0, 0, 1, 1,
0.2357211, 0.9858209, 1.296396, 1, 1, 1, 1, 1,
0.2361257, -0.1823275, 1.778535, 1, 1, 1, 1, 1,
0.2393643, 0.4155878, 0.1963806, 1, 1, 1, 1, 1,
0.2431903, 0.7960963, 0.5325878, 1, 1, 1, 1, 1,
0.2439798, -0.3905267, 1.362369, 1, 1, 1, 1, 1,
0.2442715, 0.1692994, 0.5116397, 1, 1, 1, 1, 1,
0.2443882, -0.4304944, 1.904842, 1, 1, 1, 1, 1,
0.2460337, 0.1495168, 1.129091, 1, 1, 1, 1, 1,
0.2497233, -0.1940806, 2.237375, 1, 1, 1, 1, 1,
0.2514302, 0.7933265, 0.1979085, 1, 1, 1, 1, 1,
0.2585016, -0.1138888, 3.010909, 1, 1, 1, 1, 1,
0.2592311, -0.2267368, 2.242669, 1, 1, 1, 1, 1,
0.2633398, -0.471577, 2.549908, 1, 1, 1, 1, 1,
0.2656795, -1.391759, 2.588066, 1, 1, 1, 1, 1,
0.2690141, 0.07147571, 0.5664725, 1, 1, 1, 1, 1,
0.2741042, 0.299505, 1.4038, 0, 0, 1, 1, 1,
0.2768511, -0.2539105, 1.283375, 1, 0, 0, 1, 1,
0.2778248, -0.6582752, 2.955691, 1, 0, 0, 1, 1,
0.2837256, 0.6227441, 2.955411, 1, 0, 0, 1, 1,
0.288755, -0.3481188, 2.747082, 1, 0, 0, 1, 1,
0.289555, 0.5325158, 0.7369384, 1, 0, 0, 1, 1,
0.2915635, 1.576609, 0.3797697, 0, 0, 0, 1, 1,
0.2977267, -0.7146026, 2.015659, 0, 0, 0, 1, 1,
0.3012176, -0.3171831, 2.416208, 0, 0, 0, 1, 1,
0.30311, -1.009673, 2.231065, 0, 0, 0, 1, 1,
0.3034, -0.8177086, 2.434243, 0, 0, 0, 1, 1,
0.3042732, -0.09279933, 1.378034, 0, 0, 0, 1, 1,
0.3094517, 0.0381908, 0.2598738, 0, 0, 0, 1, 1,
0.3117141, -0.3562063, 1.72155, 1, 1, 1, 1, 1,
0.3122936, 0.2446223, 2.529581, 1, 1, 1, 1, 1,
0.3186938, 0.4936868, 0.8283607, 1, 1, 1, 1, 1,
0.3206338, 0.0191081, 0.728965, 1, 1, 1, 1, 1,
0.3244316, -0.8171091, 2.212606, 1, 1, 1, 1, 1,
0.3253981, -0.5590972, 2.423637, 1, 1, 1, 1, 1,
0.3336829, -0.2900052, 3.285476, 1, 1, 1, 1, 1,
0.3448936, 0.9572137, -0.4600472, 1, 1, 1, 1, 1,
0.3476472, -0.1631977, 1.838947, 1, 1, 1, 1, 1,
0.3485841, -0.3052382, 1.756178, 1, 1, 1, 1, 1,
0.3524128, 0.485473, 1.609657, 1, 1, 1, 1, 1,
0.3527377, 0.2004836, 0.5332423, 1, 1, 1, 1, 1,
0.3544779, -0.6125815, 1.735124, 1, 1, 1, 1, 1,
0.3598212, -0.8115905, 1.326745, 1, 1, 1, 1, 1,
0.3642827, 1.481022, 3.391251, 1, 1, 1, 1, 1,
0.3682938, -0.2251387, 2.422426, 0, 0, 1, 1, 1,
0.3705744, 1.005113, -0.3045587, 1, 0, 0, 1, 1,
0.3799336, -0.07057191, 2.810719, 1, 0, 0, 1, 1,
0.3813657, -0.9986429, 1.183786, 1, 0, 0, 1, 1,
0.3816645, -0.3500001, 2.151541, 1, 0, 0, 1, 1,
0.3850801, -0.5021268, 0.8648723, 1, 0, 0, 1, 1,
0.3867383, 1.637202, -0.2318546, 0, 0, 0, 1, 1,
0.3871354, -0.6704854, 3.421045, 0, 0, 0, 1, 1,
0.3871976, 0.4555742, 1.111993, 0, 0, 0, 1, 1,
0.396734, -0.4962994, 1.604111, 0, 0, 0, 1, 1,
0.4000663, 1.492047, 0.0217269, 0, 0, 0, 1, 1,
0.4051741, -0.6599603, 1.219316, 0, 0, 0, 1, 1,
0.4061238, 0.8989488, -0.7166691, 0, 0, 0, 1, 1,
0.4125417, 0.2289033, 2.011446, 1, 1, 1, 1, 1,
0.4149361, 1.123175, -1.155916, 1, 1, 1, 1, 1,
0.4202156, 0.8813312, 1.296204, 1, 1, 1, 1, 1,
0.4225901, -1.62458, 5.347823, 1, 1, 1, 1, 1,
0.4298754, 0.3752853, 0.932645, 1, 1, 1, 1, 1,
0.4352696, 0.5794322, -1.268797, 1, 1, 1, 1, 1,
0.4360216, -0.2424794, 2.737646, 1, 1, 1, 1, 1,
0.4422159, 1.870254, 1.154177, 1, 1, 1, 1, 1,
0.4426711, 0.9959167, 0.6726274, 1, 1, 1, 1, 1,
0.4450704, -0.224688, 1.881909, 1, 1, 1, 1, 1,
0.4490506, -1.427515, 2.207878, 1, 1, 1, 1, 1,
0.4573133, 1.422477, 0.1493544, 1, 1, 1, 1, 1,
0.4579165, 0.2077636, 0.09605233, 1, 1, 1, 1, 1,
0.4614061, -0.1312803, 0.9886283, 1, 1, 1, 1, 1,
0.4614209, -1.559289, 2.129582, 1, 1, 1, 1, 1,
0.4639684, -0.2167736, 1.151246, 0, 0, 1, 1, 1,
0.4672815, 0.06074899, 0.6804378, 1, 0, 0, 1, 1,
0.4733766, 0.3803634, -0.6738818, 1, 0, 0, 1, 1,
0.4748765, -1.608435, 2.198364, 1, 0, 0, 1, 1,
0.4787964, 0.6942675, 1.749313, 1, 0, 0, 1, 1,
0.4814115, 0.1029724, 1.993002, 1, 0, 0, 1, 1,
0.4856162, 0.114237, 2.464675, 0, 0, 0, 1, 1,
0.5003001, 1.250094, 0.4668331, 0, 0, 0, 1, 1,
0.5004128, -0.4530221, 2.613237, 0, 0, 0, 1, 1,
0.500462, -0.7880611, 5.240302, 0, 0, 0, 1, 1,
0.5007398, 0.9476553, 0.7580351, 0, 0, 0, 1, 1,
0.5058981, -0.5267576, 0.6899217, 0, 0, 0, 1, 1,
0.5080457, -0.9788846, 1.646065, 0, 0, 0, 1, 1,
0.5123553, -0.5516613, 3.50365, 1, 1, 1, 1, 1,
0.514295, 0.2319171, 0.5477231, 1, 1, 1, 1, 1,
0.5167088, 1.013887, -0.3761859, 1, 1, 1, 1, 1,
0.5218232, 0.2437361, 0.38202, 1, 1, 1, 1, 1,
0.5272506, 1.642174, -0.1248795, 1, 1, 1, 1, 1,
0.5348169, -2.331758, 3.903675, 1, 1, 1, 1, 1,
0.5356397, -0.1626574, 0.1411609, 1, 1, 1, 1, 1,
0.5365892, 1.737774, 0.02551341, 1, 1, 1, 1, 1,
0.5395982, -1.635147, 3.15971, 1, 1, 1, 1, 1,
0.5409883, -0.6608876, 3.171038, 1, 1, 1, 1, 1,
0.5420229, -1.651795, 2.199608, 1, 1, 1, 1, 1,
0.5447648, 0.5799361, 1.65978, 1, 1, 1, 1, 1,
0.5464278, -0.1750657, 2.574583, 1, 1, 1, 1, 1,
0.5524649, -1.656375, 2.596492, 1, 1, 1, 1, 1,
0.5540063, -0.5452349, 2.598996, 1, 1, 1, 1, 1,
0.5559136, -0.5255482, 2.11631, 0, 0, 1, 1, 1,
0.5560383, 0.549951, -1.032584, 1, 0, 0, 1, 1,
0.5597437, 1.164993, -1.064551, 1, 0, 0, 1, 1,
0.566895, -0.4873532, 1.895774, 1, 0, 0, 1, 1,
0.567106, -0.3958459, 1.944721, 1, 0, 0, 1, 1,
0.5676735, -1.891972, 3.015399, 1, 0, 0, 1, 1,
0.5716196, -0.01065178, 2.999613, 0, 0, 0, 1, 1,
0.5789686, -0.02131571, 0.9002014, 0, 0, 0, 1, 1,
0.581401, 0.7499999, -0.8965921, 0, 0, 0, 1, 1,
0.5843269, 1.005231, 0.3437577, 0, 0, 0, 1, 1,
0.5879261, -0.2496326, 1.121721, 0, 0, 0, 1, 1,
0.590517, -0.2969728, 2.009616, 0, 0, 0, 1, 1,
0.5914877, -1.071955, 3.135601, 0, 0, 0, 1, 1,
0.6010157, 0.394061, 1.333854, 1, 1, 1, 1, 1,
0.6027011, -0.5307423, 2.866834, 1, 1, 1, 1, 1,
0.6036745, 1.311558, -0.3404596, 1, 1, 1, 1, 1,
0.6037325, 1.452491, 0.2957524, 1, 1, 1, 1, 1,
0.6061297, -2.607706, 3.783759, 1, 1, 1, 1, 1,
0.6071745, 1.855328, 0.6232638, 1, 1, 1, 1, 1,
0.6162018, -1.200768, 2.993178, 1, 1, 1, 1, 1,
0.6229394, 0.1854503, 0.8468893, 1, 1, 1, 1, 1,
0.6231859, 0.0923742, 1.988864, 1, 1, 1, 1, 1,
0.625371, 1.030456, 1.100987, 1, 1, 1, 1, 1,
0.6260531, 0.7774823, 0.845675, 1, 1, 1, 1, 1,
0.6267247, 0.05965722, 0.9195918, 1, 1, 1, 1, 1,
0.6328109, -0.3675076, 0.1757211, 1, 1, 1, 1, 1,
0.6334451, -0.8001911, 1.891157, 1, 1, 1, 1, 1,
0.6404441, 0.8532801, -0.04096966, 1, 1, 1, 1, 1,
0.6419153, -1.056538, 1.630206, 0, 0, 1, 1, 1,
0.642118, 0.6150184, 1.196116, 1, 0, 0, 1, 1,
0.6449233, 1.106836, 0.08814482, 1, 0, 0, 1, 1,
0.6456406, -0.1117837, 1.781896, 1, 0, 0, 1, 1,
0.6477281, 0.2246169, -0.3846842, 1, 0, 0, 1, 1,
0.6501818, 0.8845227, -1.391529, 1, 0, 0, 1, 1,
0.6519207, 0.6798947, 0.09528371, 0, 0, 0, 1, 1,
0.6537067, -0.6383998, 3.452739, 0, 0, 0, 1, 1,
0.6550119, -0.1489806, 2.625719, 0, 0, 0, 1, 1,
0.6577017, 0.128263, 1.286248, 0, 0, 0, 1, 1,
0.6605591, -0.4209968, 1.002493, 0, 0, 0, 1, 1,
0.6653951, 0.7599276, 1.291169, 0, 0, 0, 1, 1,
0.6745543, 1.181475, 0.1367927, 0, 0, 0, 1, 1,
0.6752399, -0.6855925, 2.737417, 1, 1, 1, 1, 1,
0.6784448, -0.8560284, 3.89321, 1, 1, 1, 1, 1,
0.6817554, -1.220137, 1.369781, 1, 1, 1, 1, 1,
0.6834956, -0.2284876, 1.979779, 1, 1, 1, 1, 1,
0.6862915, -0.4737531, 2.015995, 1, 1, 1, 1, 1,
0.6891467, -2.038288, 3.028739, 1, 1, 1, 1, 1,
0.6937291, -1.315436, 3.951263, 1, 1, 1, 1, 1,
0.7018815, 1.520521, 0.522316, 1, 1, 1, 1, 1,
0.7029828, -0.05263575, 1.302344, 1, 1, 1, 1, 1,
0.7058075, -0.3334986, 2.406888, 1, 1, 1, 1, 1,
0.722225, 1.189613, 1.590394, 1, 1, 1, 1, 1,
0.723157, 0.6676416, 1.081132, 1, 1, 1, 1, 1,
0.7247059, 1.279322, 1.728572, 1, 1, 1, 1, 1,
0.7251191, -0.7314144, 3.492546, 1, 1, 1, 1, 1,
0.7254878, -0.7595334, 2.371006, 1, 1, 1, 1, 1,
0.7355267, -0.7044579, 1.840438, 0, 0, 1, 1, 1,
0.7373844, 1.959787, 0.4103307, 1, 0, 0, 1, 1,
0.7399526, -0.6259014, 2.461878, 1, 0, 0, 1, 1,
0.7409055, 0.3338956, 1.621168, 1, 0, 0, 1, 1,
0.7420028, -0.1821381, 2.855813, 1, 0, 0, 1, 1,
0.7558442, 0.2211722, 1.416852, 1, 0, 0, 1, 1,
0.7575386, -0.9819843, 1.282435, 0, 0, 0, 1, 1,
0.7594582, 0.8492075, 0.2793348, 0, 0, 0, 1, 1,
0.7613022, 0.3247648, -1.60743, 0, 0, 0, 1, 1,
0.7615179, -1.054989, 2.13691, 0, 0, 0, 1, 1,
0.7617062, 0.9871917, -0.1987654, 0, 0, 0, 1, 1,
0.7628372, -0.1435324, 4.64399, 0, 0, 0, 1, 1,
0.7649033, -0.6613335, 2.390067, 0, 0, 0, 1, 1,
0.7656954, -0.5813051, 1.69792, 1, 1, 1, 1, 1,
0.7696669, -0.4227535, 0.8102022, 1, 1, 1, 1, 1,
0.7755253, -0.5594363, 3.700082, 1, 1, 1, 1, 1,
0.7873005, -0.5905919, 2.356375, 1, 1, 1, 1, 1,
0.7895389, -0.04988267, -1.047032, 1, 1, 1, 1, 1,
0.7905037, -0.6882637, 1.830284, 1, 1, 1, 1, 1,
0.8006209, 0.1232385, 2.033191, 1, 1, 1, 1, 1,
0.8017635, -0.5779845, 3.426027, 1, 1, 1, 1, 1,
0.8068103, -0.3281646, 0.8194771, 1, 1, 1, 1, 1,
0.8112047, 0.01141639, 1.449605, 1, 1, 1, 1, 1,
0.813998, 0.4519908, 0.1210029, 1, 1, 1, 1, 1,
0.8140074, -0.6216814, 1.558353, 1, 1, 1, 1, 1,
0.8184421, -0.03811917, 1.975637, 1, 1, 1, 1, 1,
0.8350569, 0.04222953, 1.299046, 1, 1, 1, 1, 1,
0.8353513, 0.6670802, 1.055451, 1, 1, 1, 1, 1,
0.8418243, -0.3091893, 2.254758, 0, 0, 1, 1, 1,
0.8462914, 1.899196, 1.483871, 1, 0, 0, 1, 1,
0.8474094, 1.038676, 0.5490101, 1, 0, 0, 1, 1,
0.8490428, 1.678958, 0.8988373, 1, 0, 0, 1, 1,
0.8512923, 0.03471293, -0.1970716, 1, 0, 0, 1, 1,
0.8586709, -0.6195416, 3.371607, 1, 0, 0, 1, 1,
0.8608524, 0.9908932, 1.057109, 0, 0, 0, 1, 1,
0.8631265, 1.2618, -1.357537, 0, 0, 0, 1, 1,
0.8633825, 0.2900848, 1.793998, 0, 0, 0, 1, 1,
0.8657195, -0.674245, 1.343236, 0, 0, 0, 1, 1,
0.8672091, 0.02220586, 2.457989, 0, 0, 0, 1, 1,
0.8684657, -0.3843598, 4.025773, 0, 0, 0, 1, 1,
0.8724959, 0.7400593, -0.7539994, 0, 0, 0, 1, 1,
0.8759221, 1.863901, 2.148931, 1, 1, 1, 1, 1,
0.8783567, -0.4935916, 0.8494429, 1, 1, 1, 1, 1,
0.8803549, 0.5089145, 2.129957, 1, 1, 1, 1, 1,
0.8811812, 0.6359778, 0.7508161, 1, 1, 1, 1, 1,
0.8868987, -0.2376943, 1.257957, 1, 1, 1, 1, 1,
0.8900335, 0.8291167, 0.6148834, 1, 1, 1, 1, 1,
0.8912578, -0.1786755, 2.18627, 1, 1, 1, 1, 1,
0.9007669, 1.625538, -0.7236004, 1, 1, 1, 1, 1,
0.9031039, -1.460784, 2.771448, 1, 1, 1, 1, 1,
0.9107817, 0.57643, 0.5117664, 1, 1, 1, 1, 1,
0.9167406, 0.07587543, 2.742412, 1, 1, 1, 1, 1,
0.917162, -0.1781411, 1.905762, 1, 1, 1, 1, 1,
0.9209939, 0.3480357, 0.4790252, 1, 1, 1, 1, 1,
0.9233643, 1.294441, 0.9217637, 1, 1, 1, 1, 1,
0.9245752, -1.533245, 1.014246, 1, 1, 1, 1, 1,
0.930833, -1.257326, 2.635266, 0, 0, 1, 1, 1,
0.9310729, 0.6396356, 2.300593, 1, 0, 0, 1, 1,
0.9353889, 0.5767996, 2.681087, 1, 0, 0, 1, 1,
0.9359117, -1.158545, 1.738905, 1, 0, 0, 1, 1,
0.9435955, -0.125338, 1.529266, 1, 0, 0, 1, 1,
0.9436269, -2.177164, 1.446141, 1, 0, 0, 1, 1,
0.94608, -1.223112, 0.6106899, 0, 0, 0, 1, 1,
0.9490697, 1.58933, 0.2258194, 0, 0, 0, 1, 1,
0.9616645, 1.560698, 1.671351, 0, 0, 0, 1, 1,
0.9670575, -3.481305, 2.567333, 0, 0, 0, 1, 1,
0.9745607, -0.4780649, 4.301868, 0, 0, 0, 1, 1,
0.982639, -0.8591421, 1.862668, 0, 0, 0, 1, 1,
0.9834183, -1.022531, 2.04127, 0, 0, 0, 1, 1,
0.9863203, -0.5188664, 1.280291, 1, 1, 1, 1, 1,
0.9905519, 2.418764, 0.5164474, 1, 1, 1, 1, 1,
0.9991369, 0.4242778, 2.262141, 1, 1, 1, 1, 1,
1.003788, 0.2825565, 1.658194, 1, 1, 1, 1, 1,
1.003828, -0.2411222, 0.474507, 1, 1, 1, 1, 1,
1.007359, -1.140795, 2.549495, 1, 1, 1, 1, 1,
1.03018, -0.8412542, 2.116572, 1, 1, 1, 1, 1,
1.034126, 0.315963, 0.3683979, 1, 1, 1, 1, 1,
1.038503, -1.283058, 2.430639, 1, 1, 1, 1, 1,
1.039136, 0.807927, 0.4166099, 1, 1, 1, 1, 1,
1.042242, 1.350317, -0.661491, 1, 1, 1, 1, 1,
1.048743, -0.02083446, 1.977701, 1, 1, 1, 1, 1,
1.048993, -0.8268284, 1.241714, 1, 1, 1, 1, 1,
1.052749, 0.3869412, 0.1626513, 1, 1, 1, 1, 1,
1.069134, -1.713196, 2.295814, 1, 1, 1, 1, 1,
1.078003, 1.605674, 0.6653557, 0, 0, 1, 1, 1,
1.081354, 0.9498425, 0.9244817, 1, 0, 0, 1, 1,
1.081734, 0.9154046, 0.7966225, 1, 0, 0, 1, 1,
1.088631, 1.043424, 1.835184, 1, 0, 0, 1, 1,
1.089229, 0.5179108, 1.582487, 1, 0, 0, 1, 1,
1.104261, -0.4066844, 4.149051, 1, 0, 0, 1, 1,
1.109088, 1.051359, 0.5820629, 0, 0, 0, 1, 1,
1.109989, -0.5896516, 2.416667, 0, 0, 0, 1, 1,
1.122066, -2.101148, 3.613753, 0, 0, 0, 1, 1,
1.126061, 1.847267, -1.037653, 0, 0, 0, 1, 1,
1.126115, 0.8165488, 1.067245, 0, 0, 0, 1, 1,
1.128996, 0.5465106, 1.652373, 0, 0, 0, 1, 1,
1.132654, -1.082304, 2.026241, 0, 0, 0, 1, 1,
1.134944, 1.731465, 2.072594, 1, 1, 1, 1, 1,
1.139904, 0.5061367, 1.601202, 1, 1, 1, 1, 1,
1.141845, 1.318497, 1.497774, 1, 1, 1, 1, 1,
1.142194, -1.373803, 2.365729, 1, 1, 1, 1, 1,
1.143279, 0.9160943, -0.1869118, 1, 1, 1, 1, 1,
1.145716, -1.285772, 1.813361, 1, 1, 1, 1, 1,
1.149585, 1.085875, 0.2627161, 1, 1, 1, 1, 1,
1.150722, -1.212549, 1.576327, 1, 1, 1, 1, 1,
1.156766, 0.7639472, 0.6558659, 1, 1, 1, 1, 1,
1.160032, -2.017159, 1.934553, 1, 1, 1, 1, 1,
1.162872, -0.2420335, 2.34915, 1, 1, 1, 1, 1,
1.165924, -1.009729, 2.383264, 1, 1, 1, 1, 1,
1.171442, -1.143906, 0.6049786, 1, 1, 1, 1, 1,
1.173629, 0.8077874, 1.011087, 1, 1, 1, 1, 1,
1.174866, -1.160656, 2.030709, 1, 1, 1, 1, 1,
1.177939, 0.6757072, 1.018706, 0, 0, 1, 1, 1,
1.181272, -0.8655619, 0.794598, 1, 0, 0, 1, 1,
1.183495, 0.9246107, 0.008661984, 1, 0, 0, 1, 1,
1.186813, -0.9098222, 2.195295, 1, 0, 0, 1, 1,
1.189453, 0.7829794, 1.685132, 1, 0, 0, 1, 1,
1.193711, -0.1407509, 2.470215, 1, 0, 0, 1, 1,
1.204675, 0.6830474, 4.073023, 0, 0, 0, 1, 1,
1.20706, -2.830226, 1.93593, 0, 0, 0, 1, 1,
1.226552, 0.5788243, 2.215708, 0, 0, 0, 1, 1,
1.244245, -1.006496, 3.598965, 0, 0, 0, 1, 1,
1.247241, 1.303405, 1.882436, 0, 0, 0, 1, 1,
1.265571, 0.2183072, 1.729198, 0, 0, 0, 1, 1,
1.267861, 0.7128676, 1.743107, 0, 0, 0, 1, 1,
1.277531, -1.103158, 1.397017, 1, 1, 1, 1, 1,
1.283015, -0.0136007, 1.957076, 1, 1, 1, 1, 1,
1.302657, 1.690156, 0.5794927, 1, 1, 1, 1, 1,
1.304835, -0.4612736, 2.590675, 1, 1, 1, 1, 1,
1.305806, 1.190881, 2.381872, 1, 1, 1, 1, 1,
1.32344, 2.241384, -0.2715725, 1, 1, 1, 1, 1,
1.343554, -0.6828202, 3.589792, 1, 1, 1, 1, 1,
1.364667, -1.674561, 1.804194, 1, 1, 1, 1, 1,
1.407689, -1.094005, 4.155353, 1, 1, 1, 1, 1,
1.424629, 0.6117984, 0.9795372, 1, 1, 1, 1, 1,
1.426518, 0.05998605, 0.762772, 1, 1, 1, 1, 1,
1.42965, 1.001823, 0.1147932, 1, 1, 1, 1, 1,
1.435727, 0.1233418, 1.657699, 1, 1, 1, 1, 1,
1.447412, 0.4682862, 0.4096499, 1, 1, 1, 1, 1,
1.454269, -0.5205304, 1.671969, 1, 1, 1, 1, 1,
1.462, -0.7230896, 2.791604, 0, 0, 1, 1, 1,
1.472299, 0.3407724, 2.700203, 1, 0, 0, 1, 1,
1.473943, -0.4684406, 1.357941, 1, 0, 0, 1, 1,
1.483037, -3.099866, 2.452555, 1, 0, 0, 1, 1,
1.48558, 0.1749607, 1.348665, 1, 0, 0, 1, 1,
1.498085, -0.1558337, 0.5068431, 1, 0, 0, 1, 1,
1.49867, -0.4070393, 0.3294371, 0, 0, 0, 1, 1,
1.499727, -1.284867, 0.979107, 0, 0, 0, 1, 1,
1.504478, 0.05146958, 1.880344, 0, 0, 0, 1, 1,
1.509019, -0.5976928, 1.722769, 0, 0, 0, 1, 1,
1.509521, 0.7540584, 0.8741272, 0, 0, 0, 1, 1,
1.515974, -1.205073, 1.188091, 0, 0, 0, 1, 1,
1.518736, -0.685792, 3.186373, 0, 0, 0, 1, 1,
1.52197, -0.9522673, 2.300163, 1, 1, 1, 1, 1,
1.532817, 0.09458128, 0.6433768, 1, 1, 1, 1, 1,
1.533561, -2.50751, 3.404493, 1, 1, 1, 1, 1,
1.540755, 0.5559924, 2.566975, 1, 1, 1, 1, 1,
1.551089, 0.5453418, 2.272778, 1, 1, 1, 1, 1,
1.566358, 0.9188102, 1.800761, 1, 1, 1, 1, 1,
1.574837, -0.7027432, 2.728759, 1, 1, 1, 1, 1,
1.608951, -0.5178432, 1.826717, 1, 1, 1, 1, 1,
1.618414, 0.4878265, 2.553613, 1, 1, 1, 1, 1,
1.622689, -0.08665769, 2.467464, 1, 1, 1, 1, 1,
1.627441, 0.62544, 1.18139, 1, 1, 1, 1, 1,
1.630719, 0.284473, 0.5823027, 1, 1, 1, 1, 1,
1.631976, -0.8034236, 0.02724581, 1, 1, 1, 1, 1,
1.631998, -0.4936983, 1.772241, 1, 1, 1, 1, 1,
1.637245, -1.585495, 3.807218, 1, 1, 1, 1, 1,
1.64496, 0.6033635, 0.5380053, 0, 0, 1, 1, 1,
1.647139, 1.11901, 0.6212758, 1, 0, 0, 1, 1,
1.649019, -0.512396, 1.287245, 1, 0, 0, 1, 1,
1.669906, 1.203379, 0.1300737, 1, 0, 0, 1, 1,
1.683224, 0.003669807, 1.787709, 1, 0, 0, 1, 1,
1.685459, 1.164154, 1.309025, 1, 0, 0, 1, 1,
1.685847, -0.9509844, 0.4025379, 0, 0, 0, 1, 1,
1.689249, -0.8440077, 1.729126, 0, 0, 0, 1, 1,
1.702698, 0.3009723, 2.367461, 0, 0, 0, 1, 1,
1.706725, 0.5760136, 1.169818, 0, 0, 0, 1, 1,
1.714901, 0.9416766, -0.07987466, 0, 0, 0, 1, 1,
1.737068, -0.1964109, 2.520108, 0, 0, 0, 1, 1,
1.744285, -1.527878, 1.519845, 0, 0, 0, 1, 1,
1.748099, -0.5382624, 3.622466, 1, 1, 1, 1, 1,
1.75086, -0.6171415, 3.410597, 1, 1, 1, 1, 1,
1.77795, 0.4997835, 0.4793324, 1, 1, 1, 1, 1,
1.784075, -0.8561998, 2.47937, 1, 1, 1, 1, 1,
1.785589, -0.5211705, 3.499315, 1, 1, 1, 1, 1,
1.791131, -0.6506956, 1.351084, 1, 1, 1, 1, 1,
1.797928, 2.510374, 0.1805163, 1, 1, 1, 1, 1,
1.807105, 0.1164819, 2.397816, 1, 1, 1, 1, 1,
1.83738, 0.7284691, 2.048955, 1, 1, 1, 1, 1,
1.84948, -0.3063228, 2.103154, 1, 1, 1, 1, 1,
1.857368, -0.2508421, 1.532069, 1, 1, 1, 1, 1,
1.857725, -0.4970841, 1.07252, 1, 1, 1, 1, 1,
1.869444, -0.6794794, 2.176272, 1, 1, 1, 1, 1,
1.889062, 2.773421, 0.1901912, 1, 1, 1, 1, 1,
1.942626, 2.227839, 0.006257106, 1, 1, 1, 1, 1,
1.949204, -1.207605, 2.945743, 0, 0, 1, 1, 1,
1.985798, 1.085689, 1.114917, 1, 0, 0, 1, 1,
2.086674, 0.1458199, 2.515995, 1, 0, 0, 1, 1,
2.11397, -0.7736214, 2.032777, 1, 0, 0, 1, 1,
2.183175, 1.112503, 3.413592, 1, 0, 0, 1, 1,
2.213225, 0.1607847, 0.09212486, 1, 0, 0, 1, 1,
2.244105, 0.4148859, 1.060739, 0, 0, 0, 1, 1,
2.251349, 0.4686317, 0.5738936, 0, 0, 0, 1, 1,
2.256891, -0.7818418, 1.098501, 0, 0, 0, 1, 1,
2.279091, -0.2188539, 0.7995417, 0, 0, 0, 1, 1,
2.312466, -1.054059, 1.716274, 0, 0, 0, 1, 1,
2.344973, -1.075641, 4.283003, 0, 0, 0, 1, 1,
2.389558, -0.9476141, 0.5585637, 0, 0, 0, 1, 1,
2.409315, -2.193871, 1.164296, 1, 1, 1, 1, 1,
2.431386, -0.4047115, 1.947906, 1, 1, 1, 1, 1,
2.436928, -1.290018, 2.718509, 1, 1, 1, 1, 1,
2.532441, 1.68915, 0.8038827, 1, 1, 1, 1, 1,
2.681149, -2.091857, 1.73882, 1, 1, 1, 1, 1,
3.032768, 0.7027597, 1.758185, 1, 1, 1, 1, 1,
3.137727, 1.020599, 0.5082799, 1, 1, 1, 1, 1
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
var radius = 9.387828;
var distance = 32.97435;
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
mvMatrix.translate( -0.04314327, 0.1844342, -0.2153606 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97435);
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
