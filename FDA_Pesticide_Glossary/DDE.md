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
-4.073378, -0.3122465, -2.375383, 1, 0, 0, 1,
-3.130976, -0.5354142, -0.3471711, 1, 0.007843138, 0, 1,
-3.101688, -1.321621, -0.8245281, 1, 0.01176471, 0, 1,
-2.989965, 2.057501, -0.6513158, 1, 0.01960784, 0, 1,
-2.964604, 0.3288809, -2.195696, 1, 0.02352941, 0, 1,
-2.843279, -1.975437, -2.62124, 1, 0.03137255, 0, 1,
-2.715597, -0.8290315, -1.785145, 1, 0.03529412, 0, 1,
-2.701453, -0.2190869, -1.572631, 1, 0.04313726, 0, 1,
-2.578751, 0.3125748, -0.6125491, 1, 0.04705882, 0, 1,
-2.48818, 0.1949076, -2.631367, 1, 0.05490196, 0, 1,
-2.427898, -1.933024, -3.052943, 1, 0.05882353, 0, 1,
-2.418114, 0.3687258, -2.37766, 1, 0.06666667, 0, 1,
-2.402064, -0.8418749, -3.239425, 1, 0.07058824, 0, 1,
-2.377889, 0.2752056, -0.3258057, 1, 0.07843138, 0, 1,
-2.273734, -0.4545137, -2.238853, 1, 0.08235294, 0, 1,
-2.25668, 0.8334766, -1.596565, 1, 0.09019608, 0, 1,
-2.233258, 0.8509619, -1.392822, 1, 0.09411765, 0, 1,
-2.225336, -0.3352634, -2.0956, 1, 0.1019608, 0, 1,
-2.20068, -0.902289, -2.112537, 1, 0.1098039, 0, 1,
-2.192203, 0.1646075, -1.870935, 1, 0.1137255, 0, 1,
-2.185648, 0.03794489, -1.71504, 1, 0.1215686, 0, 1,
-2.179488, -1.06731, -3.175725, 1, 0.1254902, 0, 1,
-2.151599, 0.9437216, -2.373638, 1, 0.1333333, 0, 1,
-2.144483, 0.1378622, -2.714981, 1, 0.1372549, 0, 1,
-2.132724, -0.549669, -1.249726, 1, 0.145098, 0, 1,
-2.09755, 2.391043, -0.3537404, 1, 0.1490196, 0, 1,
-2.048586, -0.178067, -0.8100173, 1, 0.1568628, 0, 1,
-2.035667, -1.107437, -1.064841, 1, 0.1607843, 0, 1,
-2.032613, 0.3558914, -1.688779, 1, 0.1686275, 0, 1,
-2.015376, 0.4206745, -0.7124496, 1, 0.172549, 0, 1,
-2.007125, 1.170128, -1.017152, 1, 0.1803922, 0, 1,
-1.960763, 1.116451, -1.766013, 1, 0.1843137, 0, 1,
-1.954525, -1.547568, -4.437925, 1, 0.1921569, 0, 1,
-1.944648, 0.9844181, -0.7916918, 1, 0.1960784, 0, 1,
-1.941595, -1.420353, -3.257902, 1, 0.2039216, 0, 1,
-1.925861, -1.574012, -3.63868, 1, 0.2117647, 0, 1,
-1.912845, -0.8178118, -1.565174, 1, 0.2156863, 0, 1,
-1.908347, 1.545633, 0.2650779, 1, 0.2235294, 0, 1,
-1.892006, 0.7377606, -2.325359, 1, 0.227451, 0, 1,
-1.890491, 0.6794261, 0.1370168, 1, 0.2352941, 0, 1,
-1.876868, 0.4155946, -1.81693, 1, 0.2392157, 0, 1,
-1.856474, -0.5164891, -2.14354, 1, 0.2470588, 0, 1,
-1.849126, 0.05919302, -1.052359, 1, 0.2509804, 0, 1,
-1.839144, -0.1913815, -1.479815, 1, 0.2588235, 0, 1,
-1.806005, 1.651706, -0.4433808, 1, 0.2627451, 0, 1,
-1.793832, -0.8088098, -3.56781, 1, 0.2705882, 0, 1,
-1.791001, -1.494134, -3.871756, 1, 0.2745098, 0, 1,
-1.781039, -0.5659849, -2.304331, 1, 0.282353, 0, 1,
-1.758972, 2.177217, -0.6301239, 1, 0.2862745, 0, 1,
-1.729084, -0.5307505, -2.103758, 1, 0.2941177, 0, 1,
-1.727079, 0.2056695, -1.634372, 1, 0.3019608, 0, 1,
-1.726927, -1.544449, -5.498095, 1, 0.3058824, 0, 1,
-1.703589, 1.298111, -1.053523, 1, 0.3137255, 0, 1,
-1.681347, 0.1044499, -1.954362, 1, 0.3176471, 0, 1,
-1.672553, 1.68472, 0.3128085, 1, 0.3254902, 0, 1,
-1.67154, -2.259608, -3.253298, 1, 0.3294118, 0, 1,
-1.668642, 1.533318, 0.3001332, 1, 0.3372549, 0, 1,
-1.668206, 0.4466153, -2.536586, 1, 0.3411765, 0, 1,
-1.646223, -0.3915717, -0.1645589, 1, 0.3490196, 0, 1,
-1.645002, -0.4612027, -2.832218, 1, 0.3529412, 0, 1,
-1.633901, 0.1106643, 0.5073622, 1, 0.3607843, 0, 1,
-1.614993, -0.1540871, -2.902964, 1, 0.3647059, 0, 1,
-1.607372, 0.4331577, -0.3467299, 1, 0.372549, 0, 1,
-1.606422, -0.2338201, -2.002001, 1, 0.3764706, 0, 1,
-1.606408, -0.2002795, 0.2669113, 1, 0.3843137, 0, 1,
-1.59592, -0.03868486, -1.046112, 1, 0.3882353, 0, 1,
-1.59263, -0.07328103, -2.592824, 1, 0.3960784, 0, 1,
-1.591285, 1.010543, -2.197197, 1, 0.4039216, 0, 1,
-1.588474, 0.01262412, -2.62813, 1, 0.4078431, 0, 1,
-1.585606, -0.8015906, -1.982393, 1, 0.4156863, 0, 1,
-1.585366, 0.2488883, -0.2405679, 1, 0.4196078, 0, 1,
-1.582859, 1.110736, -0.896765, 1, 0.427451, 0, 1,
-1.581648, 0.2474691, -2.325764, 1, 0.4313726, 0, 1,
-1.558115, -0.01666866, -1.605482, 1, 0.4392157, 0, 1,
-1.553183, 0.7942919, -1.068918, 1, 0.4431373, 0, 1,
-1.551659, 1.794619, -1.009516, 1, 0.4509804, 0, 1,
-1.551417, 0.5928125, 0.04679123, 1, 0.454902, 0, 1,
-1.538991, 0.941237, -0.682279, 1, 0.4627451, 0, 1,
-1.53307, -0.7767906, -4.314847, 1, 0.4666667, 0, 1,
-1.523473, 0.792111, -1.193269, 1, 0.4745098, 0, 1,
-1.51971, -1.086637, -2.057805, 1, 0.4784314, 0, 1,
-1.494509, 0.3213704, 1.040317, 1, 0.4862745, 0, 1,
-1.479466, 0.6851118, -0.9982119, 1, 0.4901961, 0, 1,
-1.478171, -1.505498, -4.078498, 1, 0.4980392, 0, 1,
-1.47505, 0.514108, 0.7999099, 1, 0.5058824, 0, 1,
-1.462799, 0.3578263, -1.769655, 1, 0.509804, 0, 1,
-1.457992, -0.7277462, -2.838863, 1, 0.5176471, 0, 1,
-1.449045, -0.7588467, -0.5716809, 1, 0.5215687, 0, 1,
-1.445503, -0.4168515, -1.56931, 1, 0.5294118, 0, 1,
-1.445083, 0.9804144, -0.3407201, 1, 0.5333334, 0, 1,
-1.430147, -1.625389, -2.399699, 1, 0.5411765, 0, 1,
-1.422351, 0.05550376, -1.443657, 1, 0.5450981, 0, 1,
-1.396889, 0.1858763, -1.479218, 1, 0.5529412, 0, 1,
-1.394246, 0.5262985, -1.371118, 1, 0.5568628, 0, 1,
-1.393165, 1.234211, -1.107412, 1, 0.5647059, 0, 1,
-1.392613, 0.6423829, -2.340636, 1, 0.5686275, 0, 1,
-1.389572, 0.4212379, -0.3319776, 1, 0.5764706, 0, 1,
-1.386209, -1.297458, -1.285418, 1, 0.5803922, 0, 1,
-1.383287, -0.1379644, -1.089121, 1, 0.5882353, 0, 1,
-1.380117, -0.7514015, -1.004888, 1, 0.5921569, 0, 1,
-1.378166, 1.046815, -4.083354, 1, 0.6, 0, 1,
-1.363356, -0.5965286, -2.58939, 1, 0.6078432, 0, 1,
-1.362937, -0.3946641, -2.708727, 1, 0.6117647, 0, 1,
-1.350152, -1.526725, -3.19593, 1, 0.6196079, 0, 1,
-1.348051, 0.1031234, -3.016103, 1, 0.6235294, 0, 1,
-1.34718, 0.6922956, 0.2077401, 1, 0.6313726, 0, 1,
-1.345435, 0.4142489, -0.6777204, 1, 0.6352941, 0, 1,
-1.341903, -0.5358433, -2.299343, 1, 0.6431373, 0, 1,
-1.333471, -0.4987403, -1.103569, 1, 0.6470588, 0, 1,
-1.333257, 0.001237236, -2.748128, 1, 0.654902, 0, 1,
-1.329889, 2.17556, -0.8621567, 1, 0.6588235, 0, 1,
-1.316327, 0.2635903, -0.2596874, 1, 0.6666667, 0, 1,
-1.313689, 0.01976582, -2.422329, 1, 0.6705883, 0, 1,
-1.308754, -0.7944487, -4.243845, 1, 0.6784314, 0, 1,
-1.29969, -1.390023, -2.112699, 1, 0.682353, 0, 1,
-1.276105, -0.02479865, -0.2107186, 1, 0.6901961, 0, 1,
-1.274163, -1.346424, -2.282676, 1, 0.6941177, 0, 1,
-1.271158, 1.091869, -1.796535, 1, 0.7019608, 0, 1,
-1.271095, 1.107095, -2.734554, 1, 0.7098039, 0, 1,
-1.265306, -0.8745749, -3.567521, 1, 0.7137255, 0, 1,
-1.262458, -0.5202309, -1.762935, 1, 0.7215686, 0, 1,
-1.261644, -1.363127, 0.0523984, 1, 0.7254902, 0, 1,
-1.26113, 0.166978, -1.621898, 1, 0.7333333, 0, 1,
-1.258194, -0.4988257, -2.999706, 1, 0.7372549, 0, 1,
-1.235564, 0.08952428, -0.713802, 1, 0.7450981, 0, 1,
-1.234524, -1.669898, -2.9717, 1, 0.7490196, 0, 1,
-1.231966, 0.683404, -1.049686, 1, 0.7568628, 0, 1,
-1.228201, 0.2138261, -2.091215, 1, 0.7607843, 0, 1,
-1.227404, 0.3194805, -1.634442, 1, 0.7686275, 0, 1,
-1.225157, -1.285627, -3.678798, 1, 0.772549, 0, 1,
-1.223135, 0.7168849, -0.7901928, 1, 0.7803922, 0, 1,
-1.221988, -1.313121, -1.590956, 1, 0.7843137, 0, 1,
-1.220882, 1.21533, -0.07439661, 1, 0.7921569, 0, 1,
-1.220067, 0.2360901, -1.301756, 1, 0.7960784, 0, 1,
-1.218177, -0.05672635, -2.219769, 1, 0.8039216, 0, 1,
-1.205721, -1.152262, -2.010312, 1, 0.8117647, 0, 1,
-1.204033, -1.206957, -1.232912, 1, 0.8156863, 0, 1,
-1.200945, 0.6114808, -2.278404, 1, 0.8235294, 0, 1,
-1.194218, 0.4283281, -3.530872, 1, 0.827451, 0, 1,
-1.19387, 0.7170846, -1.497539, 1, 0.8352941, 0, 1,
-1.193432, 1.882884, -1.220705, 1, 0.8392157, 0, 1,
-1.181719, 0.4587444, -2.077775, 1, 0.8470588, 0, 1,
-1.171199, -0.8637887, 0.7114629, 1, 0.8509804, 0, 1,
-1.169124, -0.2590617, -2.25058, 1, 0.8588235, 0, 1,
-1.166129, 0.1762928, -1.030026, 1, 0.8627451, 0, 1,
-1.161853, -1.191, -2.683514, 1, 0.8705882, 0, 1,
-1.159632, -0.4998514, -1.982367, 1, 0.8745098, 0, 1,
-1.158225, 0.7796665, -1.168978, 1, 0.8823529, 0, 1,
-1.156317, -0.7738363, -1.827414, 1, 0.8862745, 0, 1,
-1.152906, 1.70027, -0.3061495, 1, 0.8941177, 0, 1,
-1.145386, 1.235546, -1.737011, 1, 0.8980392, 0, 1,
-1.144222, 0.01849519, -1.560287, 1, 0.9058824, 0, 1,
-1.142914, 0.2007678, -0.8496442, 1, 0.9137255, 0, 1,
-1.136621, 1.029382, -0.1013089, 1, 0.9176471, 0, 1,
-1.135479, 0.5781442, -1.067593, 1, 0.9254902, 0, 1,
-1.13311, 0.234168, -1.970255, 1, 0.9294118, 0, 1,
-1.131451, -0.4804798, -1.203291, 1, 0.9372549, 0, 1,
-1.122967, -0.3253735, -3.205069, 1, 0.9411765, 0, 1,
-1.120371, -1.06666, -2.146867, 1, 0.9490196, 0, 1,
-1.114311, -0.3212053, -2.540482, 1, 0.9529412, 0, 1,
-1.085371, -0.6891257, -1.978505, 1, 0.9607843, 0, 1,
-1.085091, -1.199871, -0.4561161, 1, 0.9647059, 0, 1,
-1.074545, 0.8544129, -0.08816835, 1, 0.972549, 0, 1,
-1.074231, 0.4210094, -2.403969, 1, 0.9764706, 0, 1,
-1.071565, 0.3378557, -0.919517, 1, 0.9843137, 0, 1,
-1.070408, 0.2931096, -0.8101426, 1, 0.9882353, 0, 1,
-1.069892, 1.917151, -1.13816, 1, 0.9960784, 0, 1,
-1.069513, -0.4718821, -1.492794, 0.9960784, 1, 0, 1,
-1.063698, 1.030703, -0.7781798, 0.9921569, 1, 0, 1,
-1.055226, 0.0837699, 0.3917162, 0.9843137, 1, 0, 1,
-1.050579, -1.249501, -1.397306, 0.9803922, 1, 0, 1,
-1.048249, -0.5652003, -0.3467764, 0.972549, 1, 0, 1,
-1.047006, -0.7519338, -1.808321, 0.9686275, 1, 0, 1,
-1.039738, 1.145975, 1.155222, 0.9607843, 1, 0, 1,
-1.032387, 0.7246224, -2.417269, 0.9568627, 1, 0, 1,
-1.030479, -1.102346, -3.988925, 0.9490196, 1, 0, 1,
-1.015728, 1.12034, -1.191119, 0.945098, 1, 0, 1,
-1.015285, 0.2744879, -1.669549, 0.9372549, 1, 0, 1,
-1.013623, -1.209002, -2.241341, 0.9333333, 1, 0, 1,
-1.009701, -0.3181554, -2.220939, 0.9254902, 1, 0, 1,
-1.009207, 1.286127, -3.130429, 0.9215686, 1, 0, 1,
-1.005617, 0.8557803, 0.1161106, 0.9137255, 1, 0, 1,
-0.9999971, 0.8452685, -0.02727389, 0.9098039, 1, 0, 1,
-0.9804015, 0.4617029, -0.3836484, 0.9019608, 1, 0, 1,
-0.9771577, -0.5009274, -3.062108, 0.8941177, 1, 0, 1,
-0.9770826, 0.02091636, -1.600074, 0.8901961, 1, 0, 1,
-0.9769807, -1.808237, -2.571772, 0.8823529, 1, 0, 1,
-0.9647521, 0.03846699, 0.9139178, 0.8784314, 1, 0, 1,
-0.9618499, -2.302846, -2.642087, 0.8705882, 1, 0, 1,
-0.9603766, -0.1302141, -2.460253, 0.8666667, 1, 0, 1,
-0.957252, 1.99269, -1.491709, 0.8588235, 1, 0, 1,
-0.9568679, -0.739163, -0.4223807, 0.854902, 1, 0, 1,
-0.947556, 1.932875, -1.320461, 0.8470588, 1, 0, 1,
-0.9401865, -1.676336, -2.738132, 0.8431373, 1, 0, 1,
-0.9312006, -0.3954678, -0.3695696, 0.8352941, 1, 0, 1,
-0.928314, 0.8693595, -1.246824, 0.8313726, 1, 0, 1,
-0.9276574, -0.1795116, -3.470766, 0.8235294, 1, 0, 1,
-0.9274995, -1.274182, -3.633152, 0.8196079, 1, 0, 1,
-0.9115858, -2.082566, -2.263676, 0.8117647, 1, 0, 1,
-0.9058803, -1.410764, -3.019732, 0.8078431, 1, 0, 1,
-0.9013972, -0.4052147, -2.808941, 0.8, 1, 0, 1,
-0.9010134, -0.2645628, -0.2433842, 0.7921569, 1, 0, 1,
-0.896785, -0.6327487, -1.894342, 0.7882353, 1, 0, 1,
-0.8906481, 0.09759036, -2.493288, 0.7803922, 1, 0, 1,
-0.8887181, -0.2255069, -2.499348, 0.7764706, 1, 0, 1,
-0.8875307, -0.1832654, -1.132697, 0.7686275, 1, 0, 1,
-0.8875283, -0.5799543, -0.6581506, 0.7647059, 1, 0, 1,
-0.8809788, -1.385396, -4.41606, 0.7568628, 1, 0, 1,
-0.8797162, 0.396569, -3.08524, 0.7529412, 1, 0, 1,
-0.8688808, 1.144837, 1.099857, 0.7450981, 1, 0, 1,
-0.8624173, 0.9529379, -2.108051, 0.7411765, 1, 0, 1,
-0.8597926, -0.305733, -1.287791, 0.7333333, 1, 0, 1,
-0.8526798, -0.1081749, -1.731786, 0.7294118, 1, 0, 1,
-0.8523408, 0.3015009, 0.4352157, 0.7215686, 1, 0, 1,
-0.8517444, 0.06918634, -0.9588948, 0.7176471, 1, 0, 1,
-0.8496611, -0.394186, -2.717343, 0.7098039, 1, 0, 1,
-0.8306924, -0.06319764, -1.006691, 0.7058824, 1, 0, 1,
-0.829699, -0.06488407, -1.422816, 0.6980392, 1, 0, 1,
-0.8279134, -0.3715946, -0.8187921, 0.6901961, 1, 0, 1,
-0.8261217, -0.08462433, -3.732938, 0.6862745, 1, 0, 1,
-0.825038, 0.5500934, -0.668121, 0.6784314, 1, 0, 1,
-0.824491, 1.294337, 0.9975253, 0.6745098, 1, 0, 1,
-0.8164614, -0.1095162, -2.817342, 0.6666667, 1, 0, 1,
-0.8119545, -0.7594811, -4.308674, 0.6627451, 1, 0, 1,
-0.8088716, -0.3483598, -2.018486, 0.654902, 1, 0, 1,
-0.807723, -1.200995, -3.604777, 0.6509804, 1, 0, 1,
-0.8023326, -0.5581206, -1.3441, 0.6431373, 1, 0, 1,
-0.7981855, 0.5030518, -0.9542031, 0.6392157, 1, 0, 1,
-0.7833889, 0.4209857, -1.690157, 0.6313726, 1, 0, 1,
-0.7724882, -0.1462354, -1.497581, 0.627451, 1, 0, 1,
-0.7710438, -0.372939, -1.869714, 0.6196079, 1, 0, 1,
-0.7682186, -0.4639786, -1.398892, 0.6156863, 1, 0, 1,
-0.7678958, 0.8541223, -1.035202, 0.6078432, 1, 0, 1,
-0.7613207, -0.1588538, -1.29653, 0.6039216, 1, 0, 1,
-0.7572932, -0.1158518, -1.952942, 0.5960785, 1, 0, 1,
-0.7549565, 0.02148533, -0.5291404, 0.5882353, 1, 0, 1,
-0.7454305, -0.3349217, -0.3074723, 0.5843138, 1, 0, 1,
-0.741274, -0.106753, -3.370959, 0.5764706, 1, 0, 1,
-0.7339272, -0.2927762, -2.050153, 0.572549, 1, 0, 1,
-0.7311761, -0.4329617, -2.151759, 0.5647059, 1, 0, 1,
-0.7231047, -1.392985, -3.701147, 0.5607843, 1, 0, 1,
-0.7226621, 0.789573, -0.08796684, 0.5529412, 1, 0, 1,
-0.7198787, 0.5092033, -2.217309, 0.5490196, 1, 0, 1,
-0.7154769, 0.84841, -0.572134, 0.5411765, 1, 0, 1,
-0.7153063, -0.09258151, 0.7605062, 0.5372549, 1, 0, 1,
-0.7124179, -0.02337765, -1.404061, 0.5294118, 1, 0, 1,
-0.7101941, 0.64741, -1.416989, 0.5254902, 1, 0, 1,
-0.7090238, 2.313703, -1.207548, 0.5176471, 1, 0, 1,
-0.7079891, 0.0463881, -1.90441, 0.5137255, 1, 0, 1,
-0.7073249, 0.4604213, -0.3971225, 0.5058824, 1, 0, 1,
-0.7068976, 0.3873451, -1.119698, 0.5019608, 1, 0, 1,
-0.7029947, -0.3601533, -1.089273, 0.4941176, 1, 0, 1,
-0.702864, -1.012333, -2.866546, 0.4862745, 1, 0, 1,
-0.7005295, 0.9457396, 0.762868, 0.4823529, 1, 0, 1,
-0.6997294, -1.687831, -3.17219, 0.4745098, 1, 0, 1,
-0.6956226, -1.593477, -2.575059, 0.4705882, 1, 0, 1,
-0.6954378, 0.4046148, 0.9190672, 0.4627451, 1, 0, 1,
-0.694296, -0.6366861, -2.807199, 0.4588235, 1, 0, 1,
-0.6933455, 0.9742937, -2.486623, 0.4509804, 1, 0, 1,
-0.6925122, -0.6849659, -2.558738, 0.4470588, 1, 0, 1,
-0.6917652, 0.4800521, -0.8297769, 0.4392157, 1, 0, 1,
-0.6891945, 0.412281, -0.7562519, 0.4352941, 1, 0, 1,
-0.6887925, 1.24951, -0.3628048, 0.427451, 1, 0, 1,
-0.6884258, -1.677782, -4.900369, 0.4235294, 1, 0, 1,
-0.6761569, -1.062599, -2.579426, 0.4156863, 1, 0, 1,
-0.6760673, -0.752243, -3.212996, 0.4117647, 1, 0, 1,
-0.674918, 0.6212503, -1.713642, 0.4039216, 1, 0, 1,
-0.6721516, 1.859915, -1.192681, 0.3960784, 1, 0, 1,
-0.6712871, -0.5890003, -3.306933, 0.3921569, 1, 0, 1,
-0.6697167, -1.558171, -1.128607, 0.3843137, 1, 0, 1,
-0.6675145, -0.1894314, -2.139002, 0.3803922, 1, 0, 1,
-0.665512, -0.3825068, -2.527079, 0.372549, 1, 0, 1,
-0.6618491, 1.75026, 0.2844994, 0.3686275, 1, 0, 1,
-0.648348, 0.1169003, 0.01047649, 0.3607843, 1, 0, 1,
-0.6423806, -1.760093, -2.653668, 0.3568628, 1, 0, 1,
-0.637734, -1.455115, -0.5179964, 0.3490196, 1, 0, 1,
-0.6365271, 0.706576, 0.05043731, 0.345098, 1, 0, 1,
-0.6346778, 0.5605981, -0.1493213, 0.3372549, 1, 0, 1,
-0.6329295, 1.031846, -0.8873063, 0.3333333, 1, 0, 1,
-0.6257289, 1.988022, -0.1603318, 0.3254902, 1, 0, 1,
-0.6217741, 0.417503, 0.7652327, 0.3215686, 1, 0, 1,
-0.6197786, 0.55366, -1.532276, 0.3137255, 1, 0, 1,
-0.6170546, 1.603179, -0.4946438, 0.3098039, 1, 0, 1,
-0.6152157, -0.8312069, -1.857186, 0.3019608, 1, 0, 1,
-0.6150203, 1.069, 0.02368335, 0.2941177, 1, 0, 1,
-0.6133968, 2.378618, -0.1240315, 0.2901961, 1, 0, 1,
-0.6128015, 0.2621835, -0.7491575, 0.282353, 1, 0, 1,
-0.6078098, 0.1088931, -2.091988, 0.2784314, 1, 0, 1,
-0.6056779, -0.3139303, -1.221902, 0.2705882, 1, 0, 1,
-0.5971594, -1.432708, -2.829139, 0.2666667, 1, 0, 1,
-0.5964208, -0.7225036, -0.6069043, 0.2588235, 1, 0, 1,
-0.5921356, 0.1463487, -0.03353076, 0.254902, 1, 0, 1,
-0.5910183, -0.6303119, -3.172135, 0.2470588, 1, 0, 1,
-0.5881093, -2.256492, -1.244792, 0.2431373, 1, 0, 1,
-0.5815313, -1.231452, -2.414516, 0.2352941, 1, 0, 1,
-0.5804304, 0.77293, -0.4888484, 0.2313726, 1, 0, 1,
-0.5767277, -2.494966, -2.606705, 0.2235294, 1, 0, 1,
-0.5758825, -0.9783839, -3.546267, 0.2196078, 1, 0, 1,
-0.5721855, -0.6312243, -1.882384, 0.2117647, 1, 0, 1,
-0.5707058, 0.3200746, -1.573637, 0.2078431, 1, 0, 1,
-0.5696591, -0.4309779, -5.495615, 0.2, 1, 0, 1,
-0.568971, 0.1712577, -1.494687, 0.1921569, 1, 0, 1,
-0.5685707, -0.1488137, -3.21386, 0.1882353, 1, 0, 1,
-0.5673267, 0.5514199, -0.7155829, 0.1803922, 1, 0, 1,
-0.5671385, -0.7223632, -1.974165, 0.1764706, 1, 0, 1,
-0.5587341, 1.911628, -0.6070316, 0.1686275, 1, 0, 1,
-0.5568895, -0.7580411, -1.563058, 0.1647059, 1, 0, 1,
-0.5555757, 0.3661581, -0.2038511, 0.1568628, 1, 0, 1,
-0.5538949, 1.639464, 0.1008045, 0.1529412, 1, 0, 1,
-0.5512124, 0.2319338, -1.154981, 0.145098, 1, 0, 1,
-0.5510248, 0.2553844, -0.6964906, 0.1411765, 1, 0, 1,
-0.5510139, 0.378942, -0.8089671, 0.1333333, 1, 0, 1,
-0.5497456, 0.843067, 1.233251, 0.1294118, 1, 0, 1,
-0.5488658, 0.4533436, -0.07079, 0.1215686, 1, 0, 1,
-0.546902, -0.4363618, -3.389776, 0.1176471, 1, 0, 1,
-0.5427861, 0.6711407, -0.7591104, 0.1098039, 1, 0, 1,
-0.5392105, 0.3431397, -0.6298813, 0.1058824, 1, 0, 1,
-0.5371415, 1.136145, -0.8561432, 0.09803922, 1, 0, 1,
-0.5365104, -0.02107605, -3.335526, 0.09019608, 1, 0, 1,
-0.5319151, -0.03624432, -2.69495, 0.08627451, 1, 0, 1,
-0.5307834, -1.528779, -3.655002, 0.07843138, 1, 0, 1,
-0.5285754, -1.061808, -3.784512, 0.07450981, 1, 0, 1,
-0.5268909, -1.608659, -1.515883, 0.06666667, 1, 0, 1,
-0.5204691, -1.013645, -3.013077, 0.0627451, 1, 0, 1,
-0.5158203, 0.03321342, -0.9512422, 0.05490196, 1, 0, 1,
-0.5144691, -0.8354473, -3.765255, 0.05098039, 1, 0, 1,
-0.5120444, 3.37568, -0.9787188, 0.04313726, 1, 0, 1,
-0.5116202, 0.5509486, -2.719275, 0.03921569, 1, 0, 1,
-0.5053791, 1.260693, 0.5619002, 0.03137255, 1, 0, 1,
-0.5030554, -0.3218769, -1.192867, 0.02745098, 1, 0, 1,
-0.4980684, -0.6799415, -4.79756, 0.01960784, 1, 0, 1,
-0.4969645, 1.960524, -0.4860582, 0.01568628, 1, 0, 1,
-0.4949685, -0.2945199, -2.842721, 0.007843138, 1, 0, 1,
-0.4917682, 0.08437344, -1.575529, 0.003921569, 1, 0, 1,
-0.4892363, -0.5025106, -0.9959563, 0, 1, 0.003921569, 1,
-0.4888237, -0.3247618, -2.280514, 0, 1, 0.01176471, 1,
-0.4870754, 0.4875374, -1.46571, 0, 1, 0.01568628, 1,
-0.4869663, 0.3367785, -1.108811, 0, 1, 0.02352941, 1,
-0.4818651, 3.31707, -1.077888, 0, 1, 0.02745098, 1,
-0.4807547, 1.886349, 0.7911127, 0, 1, 0.03529412, 1,
-0.4749583, -1.316956, -3.014257, 0, 1, 0.03921569, 1,
-0.4749368, 1.031326, -0.8057625, 0, 1, 0.04705882, 1,
-0.47413, 0.9355249, 0.07062762, 0, 1, 0.05098039, 1,
-0.4717487, -0.2993199, -1.941258, 0, 1, 0.05882353, 1,
-0.4571951, -1.30394, -3.014305, 0, 1, 0.0627451, 1,
-0.4561022, -1.557919, -4.20051, 0, 1, 0.07058824, 1,
-0.4525067, 2.369458, 0.742499, 0, 1, 0.07450981, 1,
-0.4519478, -1.331285, -2.082943, 0, 1, 0.08235294, 1,
-0.4515476, -1.595769, -3.134822, 0, 1, 0.08627451, 1,
-0.4514301, 0.4565828, 0.9300097, 0, 1, 0.09411765, 1,
-0.4510104, -0.3729911, -0.6975849, 0, 1, 0.1019608, 1,
-0.4465708, 1.612484, 0.2725073, 0, 1, 0.1058824, 1,
-0.4442297, -0.2894202, -2.578653, 0, 1, 0.1137255, 1,
-0.440969, 0.4719814, 0.7844848, 0, 1, 0.1176471, 1,
-0.4317601, -0.5378501, -1.575463, 0, 1, 0.1254902, 1,
-0.4286107, -0.8245232, -1.614278, 0, 1, 0.1294118, 1,
-0.4286009, 1.035814, -2.011881, 0, 1, 0.1372549, 1,
-0.4245115, 1.38218, -1.141342, 0, 1, 0.1411765, 1,
-0.4227516, 1.224442, -2.825887, 0, 1, 0.1490196, 1,
-0.4221293, 1.643601, -2.305644, 0, 1, 0.1529412, 1,
-0.4127078, -1.379379, -5.367617, 0, 1, 0.1607843, 1,
-0.4124053, -0.4401754, -4.075924, 0, 1, 0.1647059, 1,
-0.4104248, -0.04303699, -2.909616, 0, 1, 0.172549, 1,
-0.4078383, 1.235314, -0.5167426, 0, 1, 0.1764706, 1,
-0.4074883, 0.05456364, 0.09995422, 0, 1, 0.1843137, 1,
-0.4042972, -0.2395114, -2.103351, 0, 1, 0.1882353, 1,
-0.4001226, 0.4948357, 0.05123577, 0, 1, 0.1960784, 1,
-0.3959286, -0.07968092, -2.965007, 0, 1, 0.2039216, 1,
-0.3914688, 1.466674, -1.640008, 0, 1, 0.2078431, 1,
-0.390434, 0.2912803, 0.616614, 0, 1, 0.2156863, 1,
-0.3866635, 0.2780205, -0.4726511, 0, 1, 0.2196078, 1,
-0.3798608, -0.06676741, -2.046966, 0, 1, 0.227451, 1,
-0.3792235, 0.7238383, -2.115582, 0, 1, 0.2313726, 1,
-0.3787581, -1.026844, -3.661228, 0, 1, 0.2392157, 1,
-0.3768391, 3.511832, -1.951482, 0, 1, 0.2431373, 1,
-0.3677022, -0.09699041, -0.7432005, 0, 1, 0.2509804, 1,
-0.3650645, -0.3636976, -3.740534, 0, 1, 0.254902, 1,
-0.3579354, -0.6671945, -3.925268, 0, 1, 0.2627451, 1,
-0.3567396, -0.5738702, -1.263149, 0, 1, 0.2666667, 1,
-0.356452, -1.38542, -2.9193, 0, 1, 0.2745098, 1,
-0.355435, 0.944409, 0.08905667, 0, 1, 0.2784314, 1,
-0.3549994, -0.1035272, -0.3581249, 0, 1, 0.2862745, 1,
-0.3549549, -0.1610014, -3.584494, 0, 1, 0.2901961, 1,
-0.3524818, 0.076906, -0.1532944, 0, 1, 0.2980392, 1,
-0.3518399, -0.350796, -3.090776, 0, 1, 0.3058824, 1,
-0.3456163, 0.3762125, -0.1423393, 0, 1, 0.3098039, 1,
-0.3422258, 0.1690241, -1.273643, 0, 1, 0.3176471, 1,
-0.3356205, 0.1199588, -1.050436, 0, 1, 0.3215686, 1,
-0.3348334, -0.1339764, -0.8909379, 0, 1, 0.3294118, 1,
-0.3346895, 1.287001, -2.638131, 0, 1, 0.3333333, 1,
-0.3253297, -1.805804, -1.420091, 0, 1, 0.3411765, 1,
-0.3197556, 0.6450146, 0.2513495, 0, 1, 0.345098, 1,
-0.3141592, 0.06006743, -0.9685408, 0, 1, 0.3529412, 1,
-0.3134095, 0.2354698, -1.581734, 0, 1, 0.3568628, 1,
-0.3096848, -0.09501523, -1.860939, 0, 1, 0.3647059, 1,
-0.3069643, -0.9346102, -4.619354, 0, 1, 0.3686275, 1,
-0.3049876, -2.449618, -3.818989, 0, 1, 0.3764706, 1,
-0.304758, -0.3313516, -2.636886, 0, 1, 0.3803922, 1,
-0.3015092, 0.1640533, -1.747398, 0, 1, 0.3882353, 1,
-0.3000003, 1.48825, 1.90703, 0, 1, 0.3921569, 1,
-0.2984263, -0.5613385, -0.9709848, 0, 1, 0.4, 1,
-0.2959554, -0.02622314, -1.261495, 0, 1, 0.4078431, 1,
-0.2934024, 1.049188, 0.6223111, 0, 1, 0.4117647, 1,
-0.2907617, -0.01552906, -1.646092, 0, 1, 0.4196078, 1,
-0.2821711, -0.4782518, -2.09069, 0, 1, 0.4235294, 1,
-0.2751921, 0.9310783, -1.40694, 0, 1, 0.4313726, 1,
-0.2692977, 1.105494, -0.1043706, 0, 1, 0.4352941, 1,
-0.2677545, -0.6625855, -3.716702, 0, 1, 0.4431373, 1,
-0.2664042, 0.2358714, -2.15007, 0, 1, 0.4470588, 1,
-0.2615111, 1.441134, 0.7355291, 0, 1, 0.454902, 1,
-0.2581523, 0.4067816, -2.034499, 0, 1, 0.4588235, 1,
-0.2580856, 0.9088282, 0.002562391, 0, 1, 0.4666667, 1,
-0.2533637, 0.5025744, -0.6644104, 0, 1, 0.4705882, 1,
-0.2524324, -0.361457, -0.1108771, 0, 1, 0.4784314, 1,
-0.244236, 0.1157151, -1.549804, 0, 1, 0.4823529, 1,
-0.2352384, -0.880784, -1.495756, 0, 1, 0.4901961, 1,
-0.2330365, 0.03708391, -1.48919, 0, 1, 0.4941176, 1,
-0.227046, 0.7000573, -0.9435163, 0, 1, 0.5019608, 1,
-0.2270394, 1.492694, 1.373846, 0, 1, 0.509804, 1,
-0.226046, 0.181355, -1.196024, 0, 1, 0.5137255, 1,
-0.220719, -0.2151153, 0.306354, 0, 1, 0.5215687, 1,
-0.2179209, 0.3715075, -0.6150095, 0, 1, 0.5254902, 1,
-0.2174901, 1.683141, -0.2362311, 0, 1, 0.5333334, 1,
-0.2163514, 0.9534504, -0.1831123, 0, 1, 0.5372549, 1,
-0.2119338, -0.6337953, -2.451961, 0, 1, 0.5450981, 1,
-0.2116163, 0.6614531, -1.406977, 0, 1, 0.5490196, 1,
-0.2103043, 1.058537, 2.151143, 0, 1, 0.5568628, 1,
-0.2100778, 0.2801766, -1.738698, 0, 1, 0.5607843, 1,
-0.2098414, -0.8034889, -4.083537, 0, 1, 0.5686275, 1,
-0.2084498, -0.906765, -3.495934, 0, 1, 0.572549, 1,
-0.2082015, -0.5319629, -1.125188, 0, 1, 0.5803922, 1,
-0.20816, 0.732039, -0.8908923, 0, 1, 0.5843138, 1,
-0.2045083, -0.5739463, -1.078414, 0, 1, 0.5921569, 1,
-0.1971868, 0.8637952, 0.4142237, 0, 1, 0.5960785, 1,
-0.1962912, -1.662859, -1.986338, 0, 1, 0.6039216, 1,
-0.1947707, 1.199687, 0.7542927, 0, 1, 0.6117647, 1,
-0.1919306, 0.0009040889, -2.998425, 0, 1, 0.6156863, 1,
-0.1915044, -1.376699, -5.705247, 0, 1, 0.6235294, 1,
-0.191294, 0.01948619, -1.498951, 0, 1, 0.627451, 1,
-0.1909953, -0.05858784, -0.3412956, 0, 1, 0.6352941, 1,
-0.1865979, -0.6104934, -4.425716, 0, 1, 0.6392157, 1,
-0.1831896, -0.8802679, -3.578506, 0, 1, 0.6470588, 1,
-0.1799146, -0.5039881, -2.885296, 0, 1, 0.6509804, 1,
-0.1753902, -0.1331217, -2.164634, 0, 1, 0.6588235, 1,
-0.1748934, -1.129011, -3.042014, 0, 1, 0.6627451, 1,
-0.1724584, -0.8547516, -4.460913, 0, 1, 0.6705883, 1,
-0.1697834, 0.6100149, -0.5298336, 0, 1, 0.6745098, 1,
-0.1697044, -0.7787313, -2.35452, 0, 1, 0.682353, 1,
-0.168861, -2.708059, -3.976528, 0, 1, 0.6862745, 1,
-0.163915, 1.083493, 0.3046334, 0, 1, 0.6941177, 1,
-0.1580264, 0.6073756, 0.7362446, 0, 1, 0.7019608, 1,
-0.1538902, -1.212071, -3.143958, 0, 1, 0.7058824, 1,
-0.1492511, 0.8005771, -0.8103718, 0, 1, 0.7137255, 1,
-0.1477075, 1.699299, 0.1668733, 0, 1, 0.7176471, 1,
-0.1443196, -0.03829758, -2.995398, 0, 1, 0.7254902, 1,
-0.1431925, 0.1076781, -0.9098452, 0, 1, 0.7294118, 1,
-0.1415266, 0.01956923, -2.457726, 0, 1, 0.7372549, 1,
-0.1412723, 0.3158847, -1.085283, 0, 1, 0.7411765, 1,
-0.1393712, -1.007868, -3.84721, 0, 1, 0.7490196, 1,
-0.1370711, 0.6713985, -0.007002329, 0, 1, 0.7529412, 1,
-0.1306522, -0.6495799, -1.201659, 0, 1, 0.7607843, 1,
-0.1290501, 0.1865705, -2.648028, 0, 1, 0.7647059, 1,
-0.12695, -0.4157075, -1.982754, 0, 1, 0.772549, 1,
-0.1265559, 0.1734235, -1.718943, 0, 1, 0.7764706, 1,
-0.1204682, -0.635491, -3.655786, 0, 1, 0.7843137, 1,
-0.1178693, -0.7175652, -2.716479, 0, 1, 0.7882353, 1,
-0.1161837, -0.145956, -3.337283, 0, 1, 0.7960784, 1,
-0.1156398, 1.422069, -0.7115785, 0, 1, 0.8039216, 1,
-0.1145662, 0.4218873, 0.7168218, 0, 1, 0.8078431, 1,
-0.1140144, -1.238512, -3.919025, 0, 1, 0.8156863, 1,
-0.1131854, -0.8877863, -2.439931, 0, 1, 0.8196079, 1,
-0.1092983, -1.604574, -2.942577, 0, 1, 0.827451, 1,
-0.1086157, -0.7585892, -4.761362, 0, 1, 0.8313726, 1,
-0.1021729, -0.8377073, -4.873436, 0, 1, 0.8392157, 1,
-0.09999862, -0.5546948, -3.286774, 0, 1, 0.8431373, 1,
-0.09928122, 0.809692, 1.931634, 0, 1, 0.8509804, 1,
-0.09862079, -0.639103, -1.144331, 0, 1, 0.854902, 1,
-0.09504113, -0.3390847, -2.252112, 0, 1, 0.8627451, 1,
-0.09327706, -0.3681243, -1.78241, 0, 1, 0.8666667, 1,
-0.08953451, 1.209404, 0.3123848, 0, 1, 0.8745098, 1,
-0.08200103, -2.33496, -3.721149, 0, 1, 0.8784314, 1,
-0.07762071, 2.458055, -0.2136769, 0, 1, 0.8862745, 1,
-0.07721972, -1.303432, -3.710924, 0, 1, 0.8901961, 1,
-0.07656316, -1.236099, -2.32322, 0, 1, 0.8980392, 1,
-0.07635789, 1.115675, 0.4604507, 0, 1, 0.9058824, 1,
-0.07624292, -1.439858, -1.76745, 0, 1, 0.9098039, 1,
-0.07166612, -0.7972316, -2.386874, 0, 1, 0.9176471, 1,
-0.07041078, -0.350362, -4.099888, 0, 1, 0.9215686, 1,
-0.06722458, 0.6685952, 1.322878, 0, 1, 0.9294118, 1,
-0.06280593, 0.8925435, -1.325128, 0, 1, 0.9333333, 1,
-0.06035058, -0.7342934, -4.65196, 0, 1, 0.9411765, 1,
-0.05629634, -0.5545042, -1.191877, 0, 1, 0.945098, 1,
-0.05250329, -0.3528212, -4.02995, 0, 1, 0.9529412, 1,
-0.05072864, 0.00981497, 0.3176693, 0, 1, 0.9568627, 1,
-0.04745898, 2.611723, -0.8167428, 0, 1, 0.9647059, 1,
-0.03755244, 0.02996489, -1.129757, 0, 1, 0.9686275, 1,
-0.03690419, 0.02456789, -0.5987659, 0, 1, 0.9764706, 1,
-0.03281706, 0.575022, 1.160132, 0, 1, 0.9803922, 1,
-0.03189574, -0.2951379, -3.191289, 0, 1, 0.9882353, 1,
-0.03047695, -0.9353237, -2.942999, 0, 1, 0.9921569, 1,
-0.02764351, 1.334032, -0.2116931, 0, 1, 1, 1,
-0.02656919, -0.8096691, -2.541866, 0, 0.9921569, 1, 1,
-0.02392254, -0.7017187, -1.08666, 0, 0.9882353, 1, 1,
-0.02058259, -0.0219621, -0.948226, 0, 0.9803922, 1, 1,
-0.01902837, -0.007298385, -1.405913, 0, 0.9764706, 1, 1,
-0.01894903, 2.766704, -0.09434397, 0, 0.9686275, 1, 1,
-0.01872718, 0.6319668, 0.847236, 0, 0.9647059, 1, 1,
-0.01673634, 2.305073, -0.5422733, 0, 0.9568627, 1, 1,
-0.0159694, 0.6692716, 0.9010681, 0, 0.9529412, 1, 1,
-0.01568898, -0.5988194, -2.836317, 0, 0.945098, 1, 1,
-0.01482634, 0.808186, 1.331277, 0, 0.9411765, 1, 1,
-0.01256507, -0.5060367, -3.395039, 0, 0.9333333, 1, 1,
-0.0103072, -0.5800974, -3.54841, 0, 0.9294118, 1, 1,
-0.00806277, -1.891553, -3.829058, 0, 0.9215686, 1, 1,
-0.007721771, 0.2483063, -1.269731, 0, 0.9176471, 1, 1,
-0.004664605, 0.4182481, -0.4807956, 0, 0.9098039, 1, 1,
-0.003190891, -0.5995088, -1.537617, 0, 0.9058824, 1, 1,
-0.001607982, -1.27919, -4.276216, 0, 0.8980392, 1, 1,
0.0002070501, 0.4080678, 0.5901543, 0, 0.8901961, 1, 1,
0.003648512, -0.9009496, 4.016342, 0, 0.8862745, 1, 1,
0.005175732, 1.454151, -0.5021178, 0, 0.8784314, 1, 1,
0.005321743, -0.3114535, 1.666376, 0, 0.8745098, 1, 1,
0.00832146, -1.174456, 4.425042, 0, 0.8666667, 1, 1,
0.01515555, -0.6781176, 2.016912, 0, 0.8627451, 1, 1,
0.01899755, 0.005822761, -0.1654646, 0, 0.854902, 1, 1,
0.02176126, -0.01862783, 0.612822, 0, 0.8509804, 1, 1,
0.02179071, -0.4530351, 3.77007, 0, 0.8431373, 1, 1,
0.02292693, 0.3076796, -1.224893, 0, 0.8392157, 1, 1,
0.02464706, 0.6692092, -0.04441456, 0, 0.8313726, 1, 1,
0.03211098, -1.213265, 3.245838, 0, 0.827451, 1, 1,
0.03370558, 0.3233824, 1.102318, 0, 0.8196079, 1, 1,
0.03377945, -0.5416607, 2.120437, 0, 0.8156863, 1, 1,
0.03715685, -0.1064545, 1.647204, 0, 0.8078431, 1, 1,
0.03871858, 1.043332, 0.5599388, 0, 0.8039216, 1, 1,
0.04075978, 0.5351353, 0.4377167, 0, 0.7960784, 1, 1,
0.04128398, 1.202496, -1.288963, 0, 0.7882353, 1, 1,
0.04392658, 0.8438596, -0.6727254, 0, 0.7843137, 1, 1,
0.04470931, -0.2062735, 2.091352, 0, 0.7764706, 1, 1,
0.04658752, -0.4810631, 2.006621, 0, 0.772549, 1, 1,
0.04832059, 2.722835, -0.1554792, 0, 0.7647059, 1, 1,
0.05168756, 0.9120127, 0.7623588, 0, 0.7607843, 1, 1,
0.05358011, -1.105733, 1.509593, 0, 0.7529412, 1, 1,
0.0539281, -0.5051934, 2.711546, 0, 0.7490196, 1, 1,
0.05440084, 0.5139759, 0.756894, 0, 0.7411765, 1, 1,
0.05471318, -0.2073945, 2.366112, 0, 0.7372549, 1, 1,
0.05664506, -0.8335578, 3.216142, 0, 0.7294118, 1, 1,
0.05741093, 0.06555121, 0.3903197, 0, 0.7254902, 1, 1,
0.06660365, -1.188426, 2.832394, 0, 0.7176471, 1, 1,
0.06814583, 0.09975613, 1.935124, 0, 0.7137255, 1, 1,
0.07629776, -0.4963576, 3.514697, 0, 0.7058824, 1, 1,
0.08301535, -0.9915587, 5.425385, 0, 0.6980392, 1, 1,
0.08454043, 0.08626667, 1.570992, 0, 0.6941177, 1, 1,
0.08558504, -0.1397136, 1.291545, 0, 0.6862745, 1, 1,
0.09303255, 0.4286331, 0.4062083, 0, 0.682353, 1, 1,
0.09406871, 0.5939769, -1.247651, 0, 0.6745098, 1, 1,
0.1005047, 1.431452, 0.6292313, 0, 0.6705883, 1, 1,
0.1025484, 0.8082925, 0.07425677, 0, 0.6627451, 1, 1,
0.1038032, 0.7841873, -1.811998, 0, 0.6588235, 1, 1,
0.1040075, -1.037524, 3.889868, 0, 0.6509804, 1, 1,
0.1047114, 1.133192, 0.7422265, 0, 0.6470588, 1, 1,
0.1094614, -0.6346679, 2.000514, 0, 0.6392157, 1, 1,
0.1187201, -1.135059, 3.324051, 0, 0.6352941, 1, 1,
0.1192405, 0.3744094, 0.5361204, 0, 0.627451, 1, 1,
0.1216922, -0.1899178, 3.43799, 0, 0.6235294, 1, 1,
0.1228367, 0.4488325, 0.9745641, 0, 0.6156863, 1, 1,
0.1249369, 0.7732027, -1.458048, 0, 0.6117647, 1, 1,
0.1263395, -1.443945, 2.955146, 0, 0.6039216, 1, 1,
0.12943, -1.209537, 3.086826, 0, 0.5960785, 1, 1,
0.1312513, 1.086676, 0.3471392, 0, 0.5921569, 1, 1,
0.1337393, 0.2016182, 0.828588, 0, 0.5843138, 1, 1,
0.1349239, -0.05669697, 0.5267431, 0, 0.5803922, 1, 1,
0.1350301, 1.785396, 0.3285913, 0, 0.572549, 1, 1,
0.1380287, 0.1631612, 0.5737618, 0, 0.5686275, 1, 1,
0.1398362, 0.640863, -0.002952877, 0, 0.5607843, 1, 1,
0.1433125, 1.150626, 2.00158, 0, 0.5568628, 1, 1,
0.1462793, 1.081948, 0.1600477, 0, 0.5490196, 1, 1,
0.1518507, -0.6703622, 4.823547, 0, 0.5450981, 1, 1,
0.1564774, -0.638126, 2.422142, 0, 0.5372549, 1, 1,
0.1589568, -0.584551, 2.925843, 0, 0.5333334, 1, 1,
0.1601717, 0.4178371, 0.277265, 0, 0.5254902, 1, 1,
0.1611827, -0.5336801, 1.258575, 0, 0.5215687, 1, 1,
0.1614202, 0.5493723, -0.5008038, 0, 0.5137255, 1, 1,
0.1671898, 0.8132442, -0.5109171, 0, 0.509804, 1, 1,
0.1672972, 0.03270949, 0.05086238, 0, 0.5019608, 1, 1,
0.1685156, 0.2473146, 2.131611, 0, 0.4941176, 1, 1,
0.1687693, -0.8100659, 4.622425, 0, 0.4901961, 1, 1,
0.1738901, 1.743045, 0.7342489, 0, 0.4823529, 1, 1,
0.1746205, 0.7807684, 0.1132567, 0, 0.4784314, 1, 1,
0.1768069, -0.1542347, 2.440819, 0, 0.4705882, 1, 1,
0.176888, 0.2718527, 1.674809, 0, 0.4666667, 1, 1,
0.1784395, 1.00934, 0.7667024, 0, 0.4588235, 1, 1,
0.1800194, 0.02577704, 1.274493, 0, 0.454902, 1, 1,
0.1856242, 1.039815, 0.4544042, 0, 0.4470588, 1, 1,
0.1954404, -1.204878, 0.01007829, 0, 0.4431373, 1, 1,
0.197334, -0.4739951, 3.529367, 0, 0.4352941, 1, 1,
0.1975866, -0.09257822, 1.01575, 0, 0.4313726, 1, 1,
0.1979677, 0.0009743118, -0.2736858, 0, 0.4235294, 1, 1,
0.1987964, -0.3895984, 2.557863, 0, 0.4196078, 1, 1,
0.1991116, -0.05292225, 3.138721, 0, 0.4117647, 1, 1,
0.200479, -1.077681, 1.362481, 0, 0.4078431, 1, 1,
0.2022161, 0.9855855, 0.9548295, 0, 0.4, 1, 1,
0.2064129, -0.6323323, 3.594738, 0, 0.3921569, 1, 1,
0.2089521, -1.226868, 4.718599, 0, 0.3882353, 1, 1,
0.216433, 0.2937308, 2.728112, 0, 0.3803922, 1, 1,
0.2234251, 0.0838329, 2.143546, 0, 0.3764706, 1, 1,
0.2234429, -0.286093, 0.9731588, 0, 0.3686275, 1, 1,
0.223928, 0.8096679, 0.5103273, 0, 0.3647059, 1, 1,
0.2239478, 0.658906, -1.484436, 0, 0.3568628, 1, 1,
0.2256123, -0.1734857, 2.493588, 0, 0.3529412, 1, 1,
0.2287039, -0.4413833, 2.243362, 0, 0.345098, 1, 1,
0.2295262, 0.9571925, -0.7083981, 0, 0.3411765, 1, 1,
0.2311048, 0.4186729, -0.6502065, 0, 0.3333333, 1, 1,
0.2375685, 1.61932, 0.5367006, 0, 0.3294118, 1, 1,
0.2399694, 0.8212644, -1.15749, 0, 0.3215686, 1, 1,
0.2409069, 0.1939053, -0.2021766, 0, 0.3176471, 1, 1,
0.2475398, -0.5783263, 1.951085, 0, 0.3098039, 1, 1,
0.249599, -0.9902676, 2.399242, 0, 0.3058824, 1, 1,
0.2509947, 1.217076, 1.561778, 0, 0.2980392, 1, 1,
0.2548042, -0.9435839, -0.7468178, 0, 0.2901961, 1, 1,
0.2561342, 1.581998, -0.1895358, 0, 0.2862745, 1, 1,
0.2579218, -1.159014, 1.581861, 0, 0.2784314, 1, 1,
0.2597292, 2.417277, 0.2945695, 0, 0.2745098, 1, 1,
0.2598343, 0.1176331, 2.314786, 0, 0.2666667, 1, 1,
0.2613889, -0.2349282, 1.394074, 0, 0.2627451, 1, 1,
0.2654233, -0.04005421, 3.641067, 0, 0.254902, 1, 1,
0.2659478, 1.995163, 0.326009, 0, 0.2509804, 1, 1,
0.266373, -0.6423447, 2.392089, 0, 0.2431373, 1, 1,
0.26792, -0.3870296, 3.049772, 0, 0.2392157, 1, 1,
0.285339, -0.7944767, 2.49184, 0, 0.2313726, 1, 1,
0.2859018, 0.5869725, 1.098358, 0, 0.227451, 1, 1,
0.2862999, -1.810707, 2.373168, 0, 0.2196078, 1, 1,
0.2919588, -0.1292159, 3.235666, 0, 0.2156863, 1, 1,
0.2956409, -1.01415, 3.73874, 0, 0.2078431, 1, 1,
0.2976069, -0.3158998, 0.3865495, 0, 0.2039216, 1, 1,
0.3067158, -0.2258998, 2.989002, 0, 0.1960784, 1, 1,
0.3077354, 0.6092669, 1.213449, 0, 0.1882353, 1, 1,
0.309186, 1.036096, -0.2932025, 0, 0.1843137, 1, 1,
0.3107823, -0.9749644, 2.64177, 0, 0.1764706, 1, 1,
0.311316, 1.345885, 0.33295, 0, 0.172549, 1, 1,
0.3123459, 1.205745, 0.3408664, 0, 0.1647059, 1, 1,
0.3138299, 0.264813, 2.04086, 0, 0.1607843, 1, 1,
0.3144125, -3.24199, 2.605793, 0, 0.1529412, 1, 1,
0.3188724, 1.180745, 0.2365172, 0, 0.1490196, 1, 1,
0.3203518, -2.276641, 2.87025, 0, 0.1411765, 1, 1,
0.3253674, 0.8658233, -0.2878132, 0, 0.1372549, 1, 1,
0.3284828, 0.02796856, 2.326473, 0, 0.1294118, 1, 1,
0.3287575, 0.3803104, -0.4449956, 0, 0.1254902, 1, 1,
0.3291588, 0.07742862, 1.740359, 0, 0.1176471, 1, 1,
0.3374698, 0.5041083, 1.383169, 0, 0.1137255, 1, 1,
0.3401864, -1.239846, 2.834061, 0, 0.1058824, 1, 1,
0.3402569, -0.3022565, 2.160347, 0, 0.09803922, 1, 1,
0.3450925, -0.1484395, 3.010589, 0, 0.09411765, 1, 1,
0.3479624, -0.6933074, 2.898292, 0, 0.08627451, 1, 1,
0.3488933, -0.8488821, 1.731687, 0, 0.08235294, 1, 1,
0.3498282, 0.500496, 1.192813, 0, 0.07450981, 1, 1,
0.3506882, 0.01702168, 0.2567022, 0, 0.07058824, 1, 1,
0.354227, -0.08381828, 1.770808, 0, 0.0627451, 1, 1,
0.354396, -0.2668087, 0.6080232, 0, 0.05882353, 1, 1,
0.357849, -0.3402941, 2.703013, 0, 0.05098039, 1, 1,
0.3580015, -0.6563635, 2.465835, 0, 0.04705882, 1, 1,
0.3582433, 0.9874859, -0.8077934, 0, 0.03921569, 1, 1,
0.3587627, 0.4597251, 1.190728, 0, 0.03529412, 1, 1,
0.3652207, 1.857431, -0.06994977, 0, 0.02745098, 1, 1,
0.3679423, 0.423423, 1.209486, 0, 0.02352941, 1, 1,
0.3685832, -1.264013, 1.295477, 0, 0.01568628, 1, 1,
0.3721954, -0.4821107, 2.854356, 0, 0.01176471, 1, 1,
0.372224, 0.5915934, 1.245239, 0, 0.003921569, 1, 1,
0.3730013, 0.3516526, 0.6145922, 0.003921569, 0, 1, 1,
0.3789547, -0.4432328, 2.634416, 0.007843138, 0, 1, 1,
0.3851957, -0.4211544, 3.644542, 0.01568628, 0, 1, 1,
0.3858034, 0.3426186, 0.8816961, 0.01960784, 0, 1, 1,
0.3882378, 0.5483244, -1.123122, 0.02745098, 0, 1, 1,
0.3897029, -0.350013, 1.644697, 0.03137255, 0, 1, 1,
0.3908299, 0.1691715, 1.116097, 0.03921569, 0, 1, 1,
0.3940841, -0.244771, 0.5631005, 0.04313726, 0, 1, 1,
0.3945468, -0.739683, 0.8652248, 0.05098039, 0, 1, 1,
0.3947012, 0.3758493, 0.5880906, 0.05490196, 0, 1, 1,
0.3957559, 0.5019071, 0.2147284, 0.0627451, 0, 1, 1,
0.396395, -0.05663006, 1.306233, 0.06666667, 0, 1, 1,
0.3968462, -2.391985, 2.799454, 0.07450981, 0, 1, 1,
0.3988024, 1.480438, -0.7856974, 0.07843138, 0, 1, 1,
0.4040583, 0.8030699, 1.047041, 0.08627451, 0, 1, 1,
0.4044869, 0.2987504, -0.1116659, 0.09019608, 0, 1, 1,
0.404909, 0.4416722, 1.297417, 0.09803922, 0, 1, 1,
0.4069026, 0.8941422, -0.7152005, 0.1058824, 0, 1, 1,
0.4071677, 0.1110655, 2.004955, 0.1098039, 0, 1, 1,
0.4095067, 1.213293, 1.319527, 0.1176471, 0, 1, 1,
0.4125772, 1.382371, 0.4691228, 0.1215686, 0, 1, 1,
0.4156899, 0.2924616, 2.096651, 0.1294118, 0, 1, 1,
0.4187149, -0.8406371, 1.246349, 0.1333333, 0, 1, 1,
0.4299, -0.2475092, 2.185711, 0.1411765, 0, 1, 1,
0.4299727, -0.28663, 2.215083, 0.145098, 0, 1, 1,
0.4320648, -2.946252, 4.531914, 0.1529412, 0, 1, 1,
0.4332666, -0.4882002, 1.807941, 0.1568628, 0, 1, 1,
0.4365944, 0.1969848, 0.4267254, 0.1647059, 0, 1, 1,
0.4397539, 2.315049, -0.8243251, 0.1686275, 0, 1, 1,
0.4444247, -0.2665656, 0.5464913, 0.1764706, 0, 1, 1,
0.4468823, -0.5280411, 1.484563, 0.1803922, 0, 1, 1,
0.448191, 0.7894952, 0.9229422, 0.1882353, 0, 1, 1,
0.4487672, 0.3873301, 0.7877887, 0.1921569, 0, 1, 1,
0.4514865, 0.3817745, 0.6337575, 0.2, 0, 1, 1,
0.4515411, -0.8601224, 4.00004, 0.2078431, 0, 1, 1,
0.455745, -0.007356421, 0.2144908, 0.2117647, 0, 1, 1,
0.4560241, 0.744742, 0.64327, 0.2196078, 0, 1, 1,
0.4590802, -1.195148, 1.258139, 0.2235294, 0, 1, 1,
0.4630331, 1.046642, -0.1904684, 0.2313726, 0, 1, 1,
0.4640322, -1.162714, 2.751442, 0.2352941, 0, 1, 1,
0.4670131, 1.033341, 1.004586, 0.2431373, 0, 1, 1,
0.4716549, -0.143931, 1.292215, 0.2470588, 0, 1, 1,
0.4870539, -0.2325063, 1.411609, 0.254902, 0, 1, 1,
0.4981561, -1.449992, 0.4179178, 0.2588235, 0, 1, 1,
0.4988845, -1.034807, 3.087505, 0.2666667, 0, 1, 1,
0.5050163, -0.8800238, 3.188258, 0.2705882, 0, 1, 1,
0.5067966, -0.03410983, 2.895112, 0.2784314, 0, 1, 1,
0.5084318, -0.7501084, 1.321792, 0.282353, 0, 1, 1,
0.5100176, -0.8481787, 2.875393, 0.2901961, 0, 1, 1,
0.5165602, 0.9487289, 1.736034, 0.2941177, 0, 1, 1,
0.5222298, -1.274258, 3.617195, 0.3019608, 0, 1, 1,
0.526055, 0.6633868, 1.118733, 0.3098039, 0, 1, 1,
0.5272374, -0.9120688, 0.8298332, 0.3137255, 0, 1, 1,
0.5309308, -0.16877, 0.2730079, 0.3215686, 0, 1, 1,
0.5330142, -2.045311, 4.215425, 0.3254902, 0, 1, 1,
0.5338131, -0.9849072, 1.833427, 0.3333333, 0, 1, 1,
0.5347654, -1.177137, 2.818624, 0.3372549, 0, 1, 1,
0.5356642, -0.5979752, 2.251065, 0.345098, 0, 1, 1,
0.537595, -1.830652, 4.755104, 0.3490196, 0, 1, 1,
0.5389412, 0.5913618, 1.053857, 0.3568628, 0, 1, 1,
0.5393634, -0.4199277, 2.369514, 0.3607843, 0, 1, 1,
0.540551, -0.8091443, 3.834729, 0.3686275, 0, 1, 1,
0.5407191, 0.3488867, 1.583324, 0.372549, 0, 1, 1,
0.5435236, -0.7193189, 1.891023, 0.3803922, 0, 1, 1,
0.5442805, 0.5631487, 2.243657, 0.3843137, 0, 1, 1,
0.5450276, 1.617937, 1.653122, 0.3921569, 0, 1, 1,
0.5547204, 1.093558, -1.31656, 0.3960784, 0, 1, 1,
0.5553684, 1.556608, -0.7451877, 0.4039216, 0, 1, 1,
0.5605754, 0.5340078, 0.5341248, 0.4117647, 0, 1, 1,
0.5606584, -1.641057, 4.012897, 0.4156863, 0, 1, 1,
0.5607286, 1.952461, -1.418983, 0.4235294, 0, 1, 1,
0.571457, -0.6176295, 3.456682, 0.427451, 0, 1, 1,
0.5741609, -1.298349, 1.993975, 0.4352941, 0, 1, 1,
0.5786363, -0.9087238, 1.947909, 0.4392157, 0, 1, 1,
0.5820569, 0.2246534, 2.716109, 0.4470588, 0, 1, 1,
0.585127, 0.7507722, -0.6217291, 0.4509804, 0, 1, 1,
0.5854105, -0.4545124, 1.551666, 0.4588235, 0, 1, 1,
0.5935402, -0.7125868, 2.332787, 0.4627451, 0, 1, 1,
0.5939115, -0.07811701, 2.377827, 0.4705882, 0, 1, 1,
0.5942674, 1.832619, -0.858411, 0.4745098, 0, 1, 1,
0.5952185, 1.17545, -0.2151267, 0.4823529, 0, 1, 1,
0.5961859, -0.9121754, 3.114553, 0.4862745, 0, 1, 1,
0.5970588, -0.07515909, 3.797149, 0.4941176, 0, 1, 1,
0.5984986, -0.466226, 3.111643, 0.5019608, 0, 1, 1,
0.5992765, -0.681325, 2.96406, 0.5058824, 0, 1, 1,
0.602488, -0.5582039, 3.379244, 0.5137255, 0, 1, 1,
0.6071926, -0.3907254, 1.189314, 0.5176471, 0, 1, 1,
0.6113377, 1.317861, 0.1863602, 0.5254902, 0, 1, 1,
0.6148095, 0.24655, 0.07590386, 0.5294118, 0, 1, 1,
0.6151549, 2.663253, 0.06521535, 0.5372549, 0, 1, 1,
0.6191488, -1.142099, 1.939189, 0.5411765, 0, 1, 1,
0.6214693, -0.07989518, 3.410043, 0.5490196, 0, 1, 1,
0.621905, 0.471822, 0.6720846, 0.5529412, 0, 1, 1,
0.6234365, -0.007446751, 1.473986, 0.5607843, 0, 1, 1,
0.6271568, 0.5756353, 0.6456093, 0.5647059, 0, 1, 1,
0.6275009, 0.7963328, 0.261198, 0.572549, 0, 1, 1,
0.6282341, 0.179369, -0.6056054, 0.5764706, 0, 1, 1,
0.6308106, 0.8328909, 1.664904, 0.5843138, 0, 1, 1,
0.6321122, 2.479302, -0.7632926, 0.5882353, 0, 1, 1,
0.6328019, 0.5735677, 0.600312, 0.5960785, 0, 1, 1,
0.6377852, -0.3126823, 3.363575, 0.6039216, 0, 1, 1,
0.6387343, 0.6590035, 0.6151246, 0.6078432, 0, 1, 1,
0.6398094, 2.240048, 0.4532141, 0.6156863, 0, 1, 1,
0.644505, -0.4761845, 3.019113, 0.6196079, 0, 1, 1,
0.6502169, 0.171808, 1.021155, 0.627451, 0, 1, 1,
0.6534272, -2.007061, 4.171084, 0.6313726, 0, 1, 1,
0.6555067, -1.358651, 3.095879, 0.6392157, 0, 1, 1,
0.6579403, 1.511865, 0.2198984, 0.6431373, 0, 1, 1,
0.6579747, 0.8995769, 2.29421, 0.6509804, 0, 1, 1,
0.6589989, -0.579928, 3.920877, 0.654902, 0, 1, 1,
0.6673726, -0.8509188, 2.901288, 0.6627451, 0, 1, 1,
0.6710805, 0.6718069, 1.906989, 0.6666667, 0, 1, 1,
0.6762174, -0.7200378, 2.773319, 0.6745098, 0, 1, 1,
0.6797872, 0.9261774, 0.04538026, 0.6784314, 0, 1, 1,
0.6822451, 1.406958, -1.94698, 0.6862745, 0, 1, 1,
0.6838374, -0.3337837, 0.8318048, 0.6901961, 0, 1, 1,
0.6848235, 0.838523, 0.5712425, 0.6980392, 0, 1, 1,
0.6904352, -1.844218, 2.422066, 0.7058824, 0, 1, 1,
0.6979339, 0.613043, 0.4285695, 0.7098039, 0, 1, 1,
0.701437, 0.3573216, -1.267034, 0.7176471, 0, 1, 1,
0.7034036, 0.2055568, 0.1564723, 0.7215686, 0, 1, 1,
0.7076169, -0.836189, 3.402074, 0.7294118, 0, 1, 1,
0.7113366, 0.9284137, 1.939531, 0.7333333, 0, 1, 1,
0.7294073, -0.575002, 3.482436, 0.7411765, 0, 1, 1,
0.7326797, 0.09789427, 3.052394, 0.7450981, 0, 1, 1,
0.7373426, -1.857723, 3.934102, 0.7529412, 0, 1, 1,
0.7417293, -0.1300922, 0.8460137, 0.7568628, 0, 1, 1,
0.74572, 0.4422357, 1.800371, 0.7647059, 0, 1, 1,
0.748437, 0.7029779, 1.791046, 0.7686275, 0, 1, 1,
0.7486597, 1.716391, 1.629921, 0.7764706, 0, 1, 1,
0.7503487, 0.04068885, 0.8827074, 0.7803922, 0, 1, 1,
0.7654675, -1.468028, 1.849306, 0.7882353, 0, 1, 1,
0.7786313, -0.3949626, 2.202796, 0.7921569, 0, 1, 1,
0.7891139, 0.4283404, 0.3943829, 0.8, 0, 1, 1,
0.7924834, 1.410564, -1.113901, 0.8078431, 0, 1, 1,
0.7949313, 0.1847587, 2.154156, 0.8117647, 0, 1, 1,
0.7983119, 0.02384144, 1.434283, 0.8196079, 0, 1, 1,
0.8049495, -0.4439475, 2.768514, 0.8235294, 0, 1, 1,
0.8060589, 0.5667323, 1.747809, 0.8313726, 0, 1, 1,
0.8094858, -0.6788213, 1.624471, 0.8352941, 0, 1, 1,
0.8114241, -0.8025549, 1.621698, 0.8431373, 0, 1, 1,
0.8128942, -0.1038618, 2.564428, 0.8470588, 0, 1, 1,
0.8138022, -1.977652, 2.16393, 0.854902, 0, 1, 1,
0.8143196, 0.4309229, 0.0640077, 0.8588235, 0, 1, 1,
0.8311192, 1.056635, 1.246397, 0.8666667, 0, 1, 1,
0.8311613, -0.8896519, 0.7404875, 0.8705882, 0, 1, 1,
0.8347493, -0.4886352, 2.909464, 0.8784314, 0, 1, 1,
0.8353803, 0.5389116, 0.009384315, 0.8823529, 0, 1, 1,
0.8391761, -0.2806644, 3.853551, 0.8901961, 0, 1, 1,
0.8438107, 2.026394, -0.1084926, 0.8941177, 0, 1, 1,
0.8452361, 0.4715403, 1.974722, 0.9019608, 0, 1, 1,
0.8455344, 0.06523862, 2.096313, 0.9098039, 0, 1, 1,
0.846899, 0.1589701, 0.8140099, 0.9137255, 0, 1, 1,
0.8546402, -0.2593721, 0.2051016, 0.9215686, 0, 1, 1,
0.8577043, 0.9406025, -0.7842865, 0.9254902, 0, 1, 1,
0.8617769, -0.05073553, 2.235692, 0.9333333, 0, 1, 1,
0.8633545, -1.893199, 1.420824, 0.9372549, 0, 1, 1,
0.8693507, 0.9660141, 0.3204399, 0.945098, 0, 1, 1,
0.8730221, -1.174864, 3.155946, 0.9490196, 0, 1, 1,
0.8733789, -1.623366, 0.9283068, 0.9568627, 0, 1, 1,
0.8845051, -0.3549131, 2.556408, 0.9607843, 0, 1, 1,
0.8886377, 0.32039, 0.2935396, 0.9686275, 0, 1, 1,
0.889484, -0.333901, 3.151389, 0.972549, 0, 1, 1,
0.8979083, -0.1238598, 0.4013681, 0.9803922, 0, 1, 1,
0.9049336, -1.370902, 2.039574, 0.9843137, 0, 1, 1,
0.9109917, -1.593603, 1.795001, 0.9921569, 0, 1, 1,
0.9147893, -0.07499336, 0.003834844, 0.9960784, 0, 1, 1,
0.917982, 0.397862, 1.034164, 1, 0, 0.9960784, 1,
0.9279943, 2.147074, -0.6762831, 1, 0, 0.9882353, 1,
0.930536, -0.7068161, 1.86793, 1, 0, 0.9843137, 1,
0.941215, -0.6210729, 2.410422, 1, 0, 0.9764706, 1,
0.9463037, -0.9657401, 1.737623, 1, 0, 0.972549, 1,
0.9466913, -0.6908151, 1.603441, 1, 0, 0.9647059, 1,
0.9484815, 0.2253836, 1.675149, 1, 0, 0.9607843, 1,
0.9493726, -1.824371, 1.778724, 1, 0, 0.9529412, 1,
0.9540759, -0.9045219, 3.349026, 1, 0, 0.9490196, 1,
0.9569805, -1.528089, 2.828734, 1, 0, 0.9411765, 1,
0.9596497, 0.2257858, 0.6911409, 1, 0, 0.9372549, 1,
0.9624824, -0.1743851, 1.764635, 1, 0, 0.9294118, 1,
0.964659, -0.272191, 1.31366, 1, 0, 0.9254902, 1,
0.9654386, 0.05135435, 3.81767, 1, 0, 0.9176471, 1,
0.973961, 0.2950734, -0.2380029, 1, 0, 0.9137255, 1,
0.975165, 1.378139, -0.3895662, 1, 0, 0.9058824, 1,
0.9762781, -0.5835358, 1.965497, 1, 0, 0.9019608, 1,
0.990047, 0.7585528, 1.19169, 1, 0, 0.8941177, 1,
0.9963958, -0.4937088, 1.845909, 1, 0, 0.8862745, 1,
1.005248, -0.2711135, 2.219305, 1, 0, 0.8823529, 1,
1.006667, 0.9661302, 0.09281195, 1, 0, 0.8745098, 1,
1.010438, -0.2988397, 2.744701, 1, 0, 0.8705882, 1,
1.026178, 0.6678019, 1.125593, 1, 0, 0.8627451, 1,
1.053099, 2.098473, 1.414614, 1, 0, 0.8588235, 1,
1.061542, 1.095427, 0.9480959, 1, 0, 0.8509804, 1,
1.065461, -0.09963747, 2.46887, 1, 0, 0.8470588, 1,
1.066928, 0.1771013, 1.374728, 1, 0, 0.8392157, 1,
1.067131, -2.045856, 3.065474, 1, 0, 0.8352941, 1,
1.074779, 0.3908723, 1.296203, 1, 0, 0.827451, 1,
1.07999, 0.6708497, 0.828328, 1, 0, 0.8235294, 1,
1.081237, -1.166848, 2.083333, 1, 0, 0.8156863, 1,
1.08201, 1.390959, 1.972715, 1, 0, 0.8117647, 1,
1.084738, 0.2257944, 0.8832372, 1, 0, 0.8039216, 1,
1.08661, -1.709721, 2.133234, 1, 0, 0.7960784, 1,
1.087657, -1.660927, 4.02722, 1, 0, 0.7921569, 1,
1.08779, 0.5214465, -0.01700384, 1, 0, 0.7843137, 1,
1.102939, 0.003373477, 2.875342, 1, 0, 0.7803922, 1,
1.103396, 1.168898, 0.3083622, 1, 0, 0.772549, 1,
1.105052, -1.935491, 2.694756, 1, 0, 0.7686275, 1,
1.119594, 0.3482219, 0.01131966, 1, 0, 0.7607843, 1,
1.121556, -0.426109, 0.9912741, 1, 0, 0.7568628, 1,
1.127157, 1.324644, 1.116766, 1, 0, 0.7490196, 1,
1.133249, 0.4522092, 1.065575, 1, 0, 0.7450981, 1,
1.136559, 1.71478, -0.7878226, 1, 0, 0.7372549, 1,
1.139773, 0.2454901, -0.489379, 1, 0, 0.7333333, 1,
1.14087, -0.1659727, 1.873929, 1, 0, 0.7254902, 1,
1.145694, -0.2406981, 3.287481, 1, 0, 0.7215686, 1,
1.148945, 0.09403374, 0.2044181, 1, 0, 0.7137255, 1,
1.154527, 0.5296174, 0.8576348, 1, 0, 0.7098039, 1,
1.164021, -0.8567075, 1.322509, 1, 0, 0.7019608, 1,
1.16801, -1.313177, 0.5800101, 1, 0, 0.6941177, 1,
1.168442, 0.7879456, -0.5321765, 1, 0, 0.6901961, 1,
1.169071, -1.11154, 3.615201, 1, 0, 0.682353, 1,
1.178695, 0.3920318, 0.900305, 1, 0, 0.6784314, 1,
1.186863, -1.318432, 2.851063, 1, 0, 0.6705883, 1,
1.191004, 0.2414964, 3.604047, 1, 0, 0.6666667, 1,
1.199327, 1.586537, 0.3287123, 1, 0, 0.6588235, 1,
1.207789, -2.553139, 1.918587, 1, 0, 0.654902, 1,
1.217092, 0.8888853, 0.09778982, 1, 0, 0.6470588, 1,
1.21919, -0.1375298, 0.4860518, 1, 0, 0.6431373, 1,
1.222578, -1.985945, 1.860501, 1, 0, 0.6352941, 1,
1.225749, -0.5151255, 1.652027, 1, 0, 0.6313726, 1,
1.229739, -0.3857787, 2.284105, 1, 0, 0.6235294, 1,
1.239535, 1.20166, 0.9293568, 1, 0, 0.6196079, 1,
1.244393, 1.422355, 0.7685912, 1, 0, 0.6117647, 1,
1.250176, -0.2530284, 0.9076139, 1, 0, 0.6078432, 1,
1.261579, 1.240741, 0.3738834, 1, 0, 0.6, 1,
1.261904, 0.2777674, 2.103262, 1, 0, 0.5921569, 1,
1.277692, 0.6352734, 1.275549, 1, 0, 0.5882353, 1,
1.279492, -1.452993, 1.921863, 1, 0, 0.5803922, 1,
1.28089, -0.6458975, 3.315175, 1, 0, 0.5764706, 1,
1.290914, 0.355868, 2.611352, 1, 0, 0.5686275, 1,
1.296848, 0.4660323, 1.528051, 1, 0, 0.5647059, 1,
1.298165, 1.112845, 2.68803, 1, 0, 0.5568628, 1,
1.299321, 0.9408187, 1.095603, 1, 0, 0.5529412, 1,
1.301638, -0.3565669, 1.782794, 1, 0, 0.5450981, 1,
1.307296, -0.5658553, 0.5819046, 1, 0, 0.5411765, 1,
1.31367, -0.5353784, 1.874756, 1, 0, 0.5333334, 1,
1.319328, 0.4842753, 0.8532976, 1, 0, 0.5294118, 1,
1.320259, -1.349434, 3.296401, 1, 0, 0.5215687, 1,
1.331267, 1.694051, 0.578227, 1, 0, 0.5176471, 1,
1.339378, -0.2925479, 0.6526496, 1, 0, 0.509804, 1,
1.345022, -0.2736488, 0.7939881, 1, 0, 0.5058824, 1,
1.352357, 0.2269234, -0.07354409, 1, 0, 0.4980392, 1,
1.365337, -0.2265681, 1.661851, 1, 0, 0.4901961, 1,
1.384676, 0.4883302, 0.1189225, 1, 0, 0.4862745, 1,
1.386901, 0.380875, 2.830516, 1, 0, 0.4784314, 1,
1.388619, -1.345067, 2.418831, 1, 0, 0.4745098, 1,
1.391065, -0.2678599, 1.494384, 1, 0, 0.4666667, 1,
1.391474, 2.096444, 0.2021039, 1, 0, 0.4627451, 1,
1.398237, 1.004853, 1.715122, 1, 0, 0.454902, 1,
1.424951, 0.1328405, 2.18168, 1, 0, 0.4509804, 1,
1.426939, -0.7165926, 2.622801, 1, 0, 0.4431373, 1,
1.434994, 0.9155002, 1.065336, 1, 0, 0.4392157, 1,
1.439186, 0.155204, 3.190417, 1, 0, 0.4313726, 1,
1.443682, 0.4131549, 0.7754151, 1, 0, 0.427451, 1,
1.450016, -1.791971, 3.279302, 1, 0, 0.4196078, 1,
1.467735, -2.257333, 1.853365, 1, 0, 0.4156863, 1,
1.475288, 0.8371537, 0.8068082, 1, 0, 0.4078431, 1,
1.478962, -1.873829, 3.668513, 1, 0, 0.4039216, 1,
1.481458, -0.2393888, 2.821615, 1, 0, 0.3960784, 1,
1.483364, -1.822623, 0.718513, 1, 0, 0.3882353, 1,
1.502982, -0.8123095, 3.081253, 1, 0, 0.3843137, 1,
1.508031, -0.2217837, 1.736088, 1, 0, 0.3764706, 1,
1.516274, 0.913604, 0.1136018, 1, 0, 0.372549, 1,
1.518522, 0.9900146, 2.862967, 1, 0, 0.3647059, 1,
1.525435, -0.8806792, 3.511863, 1, 0, 0.3607843, 1,
1.536922, -0.05050777, 1.753663, 1, 0, 0.3529412, 1,
1.540846, 0.5197209, 0.7692022, 1, 0, 0.3490196, 1,
1.573278, -0.4167861, 3.204396, 1, 0, 0.3411765, 1,
1.577543, -1.525405, 1.914793, 1, 0, 0.3372549, 1,
1.607955, 0.1209118, 1.177541, 1, 0, 0.3294118, 1,
1.638925, -1.850743, 3.634722, 1, 0, 0.3254902, 1,
1.639848, 0.6052682, 0.9330054, 1, 0, 0.3176471, 1,
1.641796, -1.676973, 3.479576, 1, 0, 0.3137255, 1,
1.663032, 0.1859783, 0.3967838, 1, 0, 0.3058824, 1,
1.663351, -0.6700029, 1.614622, 1, 0, 0.2980392, 1,
1.674588, -0.716202, 1.77256, 1, 0, 0.2941177, 1,
1.676037, 0.03477113, -0.3294531, 1, 0, 0.2862745, 1,
1.706007, 0.5620553, 0.9415317, 1, 0, 0.282353, 1,
1.706552, -1.521194, 3.590979, 1, 0, 0.2745098, 1,
1.713372, -0.650516, 3.30377, 1, 0, 0.2705882, 1,
1.720872, 0.1740597, 2.238916, 1, 0, 0.2627451, 1,
1.790384, -0.3263482, 0.971139, 1, 0, 0.2588235, 1,
1.799354, 1.556666, 1.764479, 1, 0, 0.2509804, 1,
1.827592, -0.2546265, 0.262143, 1, 0, 0.2470588, 1,
1.853857, -1.01153, 2.083143, 1, 0, 0.2392157, 1,
1.870298, 0.659045, 1.36505, 1, 0, 0.2352941, 1,
1.902413, 1.711348, 0.7385358, 1, 0, 0.227451, 1,
1.905354, -0.03044436, 1.827436, 1, 0, 0.2235294, 1,
1.937025, 2.415397, 1.355412, 1, 0, 0.2156863, 1,
1.949195, -0.2552606, 0.7197979, 1, 0, 0.2117647, 1,
1.952575, -1.171961, 2.075554, 1, 0, 0.2039216, 1,
1.970999, 0.3558217, 1.579865, 1, 0, 0.1960784, 1,
1.973267, -1.706787, 0.4900632, 1, 0, 0.1921569, 1,
1.976227, -0.5796407, 1.526399, 1, 0, 0.1843137, 1,
1.982004, -1.151241, 2.153765, 1, 0, 0.1803922, 1,
1.998354, 1.192371, 2.579304, 1, 0, 0.172549, 1,
1.999493, 0.7476476, 2.109063, 1, 0, 0.1686275, 1,
2.006022, -0.02877911, 2.637254, 1, 0, 0.1607843, 1,
2.100135, -0.7368273, 1.769279, 1, 0, 0.1568628, 1,
2.109549, -1.490647, 0.963452, 1, 0, 0.1490196, 1,
2.112845, 0.4601616, 1.64298, 1, 0, 0.145098, 1,
2.12985, 0.3578233, 1.062357, 1, 0, 0.1372549, 1,
2.141577, 0.01689015, 1.973813, 1, 0, 0.1333333, 1,
2.144891, -1.322821, 1.826564, 1, 0, 0.1254902, 1,
2.149083, 1.511105, 1.8293, 1, 0, 0.1215686, 1,
2.153428, -2.04974, 2.623226, 1, 0, 0.1137255, 1,
2.212651, -0.7809474, 1.287877, 1, 0, 0.1098039, 1,
2.215998, -0.6550756, 1.872804, 1, 0, 0.1019608, 1,
2.22805, -2.095178, 0.6531324, 1, 0, 0.09411765, 1,
2.243891, 1.420194, 1.787021, 1, 0, 0.09019608, 1,
2.254418, 0.1582166, 3.976418, 1, 0, 0.08235294, 1,
2.334719, -0.6588112, 0.985236, 1, 0, 0.07843138, 1,
2.340808, 0.5858325, 0.3166787, 1, 0, 0.07058824, 1,
2.390876, 1.383057, 0.003865268, 1, 0, 0.06666667, 1,
2.564314, -1.033809, 1.986283, 1, 0, 0.05882353, 1,
2.662879, -1.423853, 1.763156, 1, 0, 0.05490196, 1,
2.700344, -0.1324725, 2.118412, 1, 0, 0.04705882, 1,
2.776328, -1.475375, 3.11208, 1, 0, 0.04313726, 1,
2.788437, 1.413964, 0.8889923, 1, 0, 0.03529412, 1,
2.869024, -0.161069, 2.079868, 1, 0, 0.03137255, 1,
2.970076, 1.196762, 1.363674, 1, 0, 0.02352941, 1,
3.206696, -0.006087033, 0.6937606, 1, 0, 0.01960784, 1,
3.265602, -1.505821, 3.542118, 1, 0, 0.01176471, 1,
3.601588, 0.08971273, 1.161805, 1, 0, 0.007843138, 1
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
-0.2358949, -4.386763, -7.591889, 0, -0.5, 0.5, 0.5,
-0.2358949, -4.386763, -7.591889, 1, -0.5, 0.5, 0.5,
-0.2358949, -4.386763, -7.591889, 1, 1.5, 0.5, 0.5,
-0.2358949, -4.386763, -7.591889, 0, 1.5, 0.5, 0.5
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
-5.374284, 0.1349211, -7.591889, 0, -0.5, 0.5, 0.5,
-5.374284, 0.1349211, -7.591889, 1, -0.5, 0.5, 0.5,
-5.374284, 0.1349211, -7.591889, 1, 1.5, 0.5, 0.5,
-5.374284, 0.1349211, -7.591889, 0, 1.5, 0.5, 0.5
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
-5.374284, -4.386763, -0.1399312, 0, -0.5, 0.5, 0.5,
-5.374284, -4.386763, -0.1399312, 1, -0.5, 0.5, 0.5,
-5.374284, -4.386763, -0.1399312, 1, 1.5, 0.5, 0.5,
-5.374284, -4.386763, -0.1399312, 0, 1.5, 0.5, 0.5
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
-4, -3.343297, -5.872206,
2, -3.343297, -5.872206,
-4, -3.343297, -5.872206,
-4, -3.517208, -6.15882,
-2, -3.343297, -5.872206,
-2, -3.517208, -6.15882,
0, -3.343297, -5.872206,
0, -3.517208, -6.15882,
2, -3.343297, -5.872206,
2, -3.517208, -6.15882
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
"-4",
"-2",
"0",
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
-4, -3.86503, -6.732048, 0, -0.5, 0.5, 0.5,
-4, -3.86503, -6.732048, 1, -0.5, 0.5, 0.5,
-4, -3.86503, -6.732048, 1, 1.5, 0.5, 0.5,
-4, -3.86503, -6.732048, 0, 1.5, 0.5, 0.5,
-2, -3.86503, -6.732048, 0, -0.5, 0.5, 0.5,
-2, -3.86503, -6.732048, 1, -0.5, 0.5, 0.5,
-2, -3.86503, -6.732048, 1, 1.5, 0.5, 0.5,
-2, -3.86503, -6.732048, 0, 1.5, 0.5, 0.5,
0, -3.86503, -6.732048, 0, -0.5, 0.5, 0.5,
0, -3.86503, -6.732048, 1, -0.5, 0.5, 0.5,
0, -3.86503, -6.732048, 1, 1.5, 0.5, 0.5,
0, -3.86503, -6.732048, 0, 1.5, 0.5, 0.5,
2, -3.86503, -6.732048, 0, -0.5, 0.5, 0.5,
2, -3.86503, -6.732048, 1, -0.5, 0.5, 0.5,
2, -3.86503, -6.732048, 1, 1.5, 0.5, 0.5,
2, -3.86503, -6.732048, 0, 1.5, 0.5, 0.5
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
-4.188502, -3, -5.872206,
-4.188502, 3, -5.872206,
-4.188502, -3, -5.872206,
-4.386132, -3, -6.15882,
-4.188502, -2, -5.872206,
-4.386132, -2, -6.15882,
-4.188502, -1, -5.872206,
-4.386132, -1, -6.15882,
-4.188502, 0, -5.872206,
-4.386132, 0, -6.15882,
-4.188502, 1, -5.872206,
-4.386132, 1, -6.15882,
-4.188502, 2, -5.872206,
-4.386132, 2, -6.15882,
-4.188502, 3, -5.872206,
-4.386132, 3, -6.15882
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
-4.781393, -3, -6.732048, 0, -0.5, 0.5, 0.5,
-4.781393, -3, -6.732048, 1, -0.5, 0.5, 0.5,
-4.781393, -3, -6.732048, 1, 1.5, 0.5, 0.5,
-4.781393, -3, -6.732048, 0, 1.5, 0.5, 0.5,
-4.781393, -2, -6.732048, 0, -0.5, 0.5, 0.5,
-4.781393, -2, -6.732048, 1, -0.5, 0.5, 0.5,
-4.781393, -2, -6.732048, 1, 1.5, 0.5, 0.5,
-4.781393, -2, -6.732048, 0, 1.5, 0.5, 0.5,
-4.781393, -1, -6.732048, 0, -0.5, 0.5, 0.5,
-4.781393, -1, -6.732048, 1, -0.5, 0.5, 0.5,
-4.781393, -1, -6.732048, 1, 1.5, 0.5, 0.5,
-4.781393, -1, -6.732048, 0, 1.5, 0.5, 0.5,
-4.781393, 0, -6.732048, 0, -0.5, 0.5, 0.5,
-4.781393, 0, -6.732048, 1, -0.5, 0.5, 0.5,
-4.781393, 0, -6.732048, 1, 1.5, 0.5, 0.5,
-4.781393, 0, -6.732048, 0, 1.5, 0.5, 0.5,
-4.781393, 1, -6.732048, 0, -0.5, 0.5, 0.5,
-4.781393, 1, -6.732048, 1, -0.5, 0.5, 0.5,
-4.781393, 1, -6.732048, 1, 1.5, 0.5, 0.5,
-4.781393, 1, -6.732048, 0, 1.5, 0.5, 0.5,
-4.781393, 2, -6.732048, 0, -0.5, 0.5, 0.5,
-4.781393, 2, -6.732048, 1, -0.5, 0.5, 0.5,
-4.781393, 2, -6.732048, 1, 1.5, 0.5, 0.5,
-4.781393, 2, -6.732048, 0, 1.5, 0.5, 0.5,
-4.781393, 3, -6.732048, 0, -0.5, 0.5, 0.5,
-4.781393, 3, -6.732048, 1, -0.5, 0.5, 0.5,
-4.781393, 3, -6.732048, 1, 1.5, 0.5, 0.5,
-4.781393, 3, -6.732048, 0, 1.5, 0.5, 0.5
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
-4.188502, -3.343297, -4,
-4.188502, -3.343297, 4,
-4.188502, -3.343297, -4,
-4.386132, -3.517208, -4,
-4.188502, -3.343297, -2,
-4.386132, -3.517208, -2,
-4.188502, -3.343297, 0,
-4.386132, -3.517208, 0,
-4.188502, -3.343297, 2,
-4.386132, -3.517208, 2,
-4.188502, -3.343297, 4,
-4.386132, -3.517208, 4
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
-4.781393, -3.86503, -4, 0, -0.5, 0.5, 0.5,
-4.781393, -3.86503, -4, 1, -0.5, 0.5, 0.5,
-4.781393, -3.86503, -4, 1, 1.5, 0.5, 0.5,
-4.781393, -3.86503, -4, 0, 1.5, 0.5, 0.5,
-4.781393, -3.86503, -2, 0, -0.5, 0.5, 0.5,
-4.781393, -3.86503, -2, 1, -0.5, 0.5, 0.5,
-4.781393, -3.86503, -2, 1, 1.5, 0.5, 0.5,
-4.781393, -3.86503, -2, 0, 1.5, 0.5, 0.5,
-4.781393, -3.86503, 0, 0, -0.5, 0.5, 0.5,
-4.781393, -3.86503, 0, 1, -0.5, 0.5, 0.5,
-4.781393, -3.86503, 0, 1, 1.5, 0.5, 0.5,
-4.781393, -3.86503, 0, 0, 1.5, 0.5, 0.5,
-4.781393, -3.86503, 2, 0, -0.5, 0.5, 0.5,
-4.781393, -3.86503, 2, 1, -0.5, 0.5, 0.5,
-4.781393, -3.86503, 2, 1, 1.5, 0.5, 0.5,
-4.781393, -3.86503, 2, 0, 1.5, 0.5, 0.5,
-4.781393, -3.86503, 4, 0, -0.5, 0.5, 0.5,
-4.781393, -3.86503, 4, 1, -0.5, 0.5, 0.5,
-4.781393, -3.86503, 4, 1, 1.5, 0.5, 0.5,
-4.781393, -3.86503, 4, 0, 1.5, 0.5, 0.5
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
-4.188502, -3.343297, -5.872206,
-4.188502, 3.613139, -5.872206,
-4.188502, -3.343297, 5.592344,
-4.188502, 3.613139, 5.592344,
-4.188502, -3.343297, -5.872206,
-4.188502, -3.343297, 5.592344,
-4.188502, 3.613139, -5.872206,
-4.188502, 3.613139, 5.592344,
-4.188502, -3.343297, -5.872206,
3.716712, -3.343297, -5.872206,
-4.188502, -3.343297, 5.592344,
3.716712, -3.343297, 5.592344,
-4.188502, 3.613139, -5.872206,
3.716712, 3.613139, -5.872206,
-4.188502, 3.613139, 5.592344,
3.716712, 3.613139, 5.592344,
3.716712, -3.343297, -5.872206,
3.716712, 3.613139, -5.872206,
3.716712, -3.343297, 5.592344,
3.716712, 3.613139, 5.592344,
3.716712, -3.343297, -5.872206,
3.716712, -3.343297, 5.592344,
3.716712, 3.613139, -5.872206,
3.716712, 3.613139, 5.592344
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
var radius = 8.312284;
var distance = 36.98229;
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
mvMatrix.translate( 0.2358949, -0.1349211, 0.1399312 );
mvMatrix.scale( 1.136896, 1.291955, 0.78393 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.98229);
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
DDE<-read.table("DDE.xyz")
```

```
## Error in read.table("DDE.xyz"): no lines available in input
```

```r
x<-DDE$V2
```

```
## Error in eval(expr, envir, enclos): object 'DDE' not found
```

```r
y<-DDE$V3
```

```
## Error in eval(expr, envir, enclos): object 'DDE' not found
```

```r
z<-DDE$V4
```

```
## Error in eval(expr, envir, enclos): object 'DDE' not found
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
-4.073378, -0.3122465, -2.375383, 0, 0, 1, 1, 1,
-3.130976, -0.5354142, -0.3471711, 1, 0, 0, 1, 1,
-3.101688, -1.321621, -0.8245281, 1, 0, 0, 1, 1,
-2.989965, 2.057501, -0.6513158, 1, 0, 0, 1, 1,
-2.964604, 0.3288809, -2.195696, 1, 0, 0, 1, 1,
-2.843279, -1.975437, -2.62124, 1, 0, 0, 1, 1,
-2.715597, -0.8290315, -1.785145, 0, 0, 0, 1, 1,
-2.701453, -0.2190869, -1.572631, 0, 0, 0, 1, 1,
-2.578751, 0.3125748, -0.6125491, 0, 0, 0, 1, 1,
-2.48818, 0.1949076, -2.631367, 0, 0, 0, 1, 1,
-2.427898, -1.933024, -3.052943, 0, 0, 0, 1, 1,
-2.418114, 0.3687258, -2.37766, 0, 0, 0, 1, 1,
-2.402064, -0.8418749, -3.239425, 0, 0, 0, 1, 1,
-2.377889, 0.2752056, -0.3258057, 1, 1, 1, 1, 1,
-2.273734, -0.4545137, -2.238853, 1, 1, 1, 1, 1,
-2.25668, 0.8334766, -1.596565, 1, 1, 1, 1, 1,
-2.233258, 0.8509619, -1.392822, 1, 1, 1, 1, 1,
-2.225336, -0.3352634, -2.0956, 1, 1, 1, 1, 1,
-2.20068, -0.902289, -2.112537, 1, 1, 1, 1, 1,
-2.192203, 0.1646075, -1.870935, 1, 1, 1, 1, 1,
-2.185648, 0.03794489, -1.71504, 1, 1, 1, 1, 1,
-2.179488, -1.06731, -3.175725, 1, 1, 1, 1, 1,
-2.151599, 0.9437216, -2.373638, 1, 1, 1, 1, 1,
-2.144483, 0.1378622, -2.714981, 1, 1, 1, 1, 1,
-2.132724, -0.549669, -1.249726, 1, 1, 1, 1, 1,
-2.09755, 2.391043, -0.3537404, 1, 1, 1, 1, 1,
-2.048586, -0.178067, -0.8100173, 1, 1, 1, 1, 1,
-2.035667, -1.107437, -1.064841, 1, 1, 1, 1, 1,
-2.032613, 0.3558914, -1.688779, 0, 0, 1, 1, 1,
-2.015376, 0.4206745, -0.7124496, 1, 0, 0, 1, 1,
-2.007125, 1.170128, -1.017152, 1, 0, 0, 1, 1,
-1.960763, 1.116451, -1.766013, 1, 0, 0, 1, 1,
-1.954525, -1.547568, -4.437925, 1, 0, 0, 1, 1,
-1.944648, 0.9844181, -0.7916918, 1, 0, 0, 1, 1,
-1.941595, -1.420353, -3.257902, 0, 0, 0, 1, 1,
-1.925861, -1.574012, -3.63868, 0, 0, 0, 1, 1,
-1.912845, -0.8178118, -1.565174, 0, 0, 0, 1, 1,
-1.908347, 1.545633, 0.2650779, 0, 0, 0, 1, 1,
-1.892006, 0.7377606, -2.325359, 0, 0, 0, 1, 1,
-1.890491, 0.6794261, 0.1370168, 0, 0, 0, 1, 1,
-1.876868, 0.4155946, -1.81693, 0, 0, 0, 1, 1,
-1.856474, -0.5164891, -2.14354, 1, 1, 1, 1, 1,
-1.849126, 0.05919302, -1.052359, 1, 1, 1, 1, 1,
-1.839144, -0.1913815, -1.479815, 1, 1, 1, 1, 1,
-1.806005, 1.651706, -0.4433808, 1, 1, 1, 1, 1,
-1.793832, -0.8088098, -3.56781, 1, 1, 1, 1, 1,
-1.791001, -1.494134, -3.871756, 1, 1, 1, 1, 1,
-1.781039, -0.5659849, -2.304331, 1, 1, 1, 1, 1,
-1.758972, 2.177217, -0.6301239, 1, 1, 1, 1, 1,
-1.729084, -0.5307505, -2.103758, 1, 1, 1, 1, 1,
-1.727079, 0.2056695, -1.634372, 1, 1, 1, 1, 1,
-1.726927, -1.544449, -5.498095, 1, 1, 1, 1, 1,
-1.703589, 1.298111, -1.053523, 1, 1, 1, 1, 1,
-1.681347, 0.1044499, -1.954362, 1, 1, 1, 1, 1,
-1.672553, 1.68472, 0.3128085, 1, 1, 1, 1, 1,
-1.67154, -2.259608, -3.253298, 1, 1, 1, 1, 1,
-1.668642, 1.533318, 0.3001332, 0, 0, 1, 1, 1,
-1.668206, 0.4466153, -2.536586, 1, 0, 0, 1, 1,
-1.646223, -0.3915717, -0.1645589, 1, 0, 0, 1, 1,
-1.645002, -0.4612027, -2.832218, 1, 0, 0, 1, 1,
-1.633901, 0.1106643, 0.5073622, 1, 0, 0, 1, 1,
-1.614993, -0.1540871, -2.902964, 1, 0, 0, 1, 1,
-1.607372, 0.4331577, -0.3467299, 0, 0, 0, 1, 1,
-1.606422, -0.2338201, -2.002001, 0, 0, 0, 1, 1,
-1.606408, -0.2002795, 0.2669113, 0, 0, 0, 1, 1,
-1.59592, -0.03868486, -1.046112, 0, 0, 0, 1, 1,
-1.59263, -0.07328103, -2.592824, 0, 0, 0, 1, 1,
-1.591285, 1.010543, -2.197197, 0, 0, 0, 1, 1,
-1.588474, 0.01262412, -2.62813, 0, 0, 0, 1, 1,
-1.585606, -0.8015906, -1.982393, 1, 1, 1, 1, 1,
-1.585366, 0.2488883, -0.2405679, 1, 1, 1, 1, 1,
-1.582859, 1.110736, -0.896765, 1, 1, 1, 1, 1,
-1.581648, 0.2474691, -2.325764, 1, 1, 1, 1, 1,
-1.558115, -0.01666866, -1.605482, 1, 1, 1, 1, 1,
-1.553183, 0.7942919, -1.068918, 1, 1, 1, 1, 1,
-1.551659, 1.794619, -1.009516, 1, 1, 1, 1, 1,
-1.551417, 0.5928125, 0.04679123, 1, 1, 1, 1, 1,
-1.538991, 0.941237, -0.682279, 1, 1, 1, 1, 1,
-1.53307, -0.7767906, -4.314847, 1, 1, 1, 1, 1,
-1.523473, 0.792111, -1.193269, 1, 1, 1, 1, 1,
-1.51971, -1.086637, -2.057805, 1, 1, 1, 1, 1,
-1.494509, 0.3213704, 1.040317, 1, 1, 1, 1, 1,
-1.479466, 0.6851118, -0.9982119, 1, 1, 1, 1, 1,
-1.478171, -1.505498, -4.078498, 1, 1, 1, 1, 1,
-1.47505, 0.514108, 0.7999099, 0, 0, 1, 1, 1,
-1.462799, 0.3578263, -1.769655, 1, 0, 0, 1, 1,
-1.457992, -0.7277462, -2.838863, 1, 0, 0, 1, 1,
-1.449045, -0.7588467, -0.5716809, 1, 0, 0, 1, 1,
-1.445503, -0.4168515, -1.56931, 1, 0, 0, 1, 1,
-1.445083, 0.9804144, -0.3407201, 1, 0, 0, 1, 1,
-1.430147, -1.625389, -2.399699, 0, 0, 0, 1, 1,
-1.422351, 0.05550376, -1.443657, 0, 0, 0, 1, 1,
-1.396889, 0.1858763, -1.479218, 0, 0, 0, 1, 1,
-1.394246, 0.5262985, -1.371118, 0, 0, 0, 1, 1,
-1.393165, 1.234211, -1.107412, 0, 0, 0, 1, 1,
-1.392613, 0.6423829, -2.340636, 0, 0, 0, 1, 1,
-1.389572, 0.4212379, -0.3319776, 0, 0, 0, 1, 1,
-1.386209, -1.297458, -1.285418, 1, 1, 1, 1, 1,
-1.383287, -0.1379644, -1.089121, 1, 1, 1, 1, 1,
-1.380117, -0.7514015, -1.004888, 1, 1, 1, 1, 1,
-1.378166, 1.046815, -4.083354, 1, 1, 1, 1, 1,
-1.363356, -0.5965286, -2.58939, 1, 1, 1, 1, 1,
-1.362937, -0.3946641, -2.708727, 1, 1, 1, 1, 1,
-1.350152, -1.526725, -3.19593, 1, 1, 1, 1, 1,
-1.348051, 0.1031234, -3.016103, 1, 1, 1, 1, 1,
-1.34718, 0.6922956, 0.2077401, 1, 1, 1, 1, 1,
-1.345435, 0.4142489, -0.6777204, 1, 1, 1, 1, 1,
-1.341903, -0.5358433, -2.299343, 1, 1, 1, 1, 1,
-1.333471, -0.4987403, -1.103569, 1, 1, 1, 1, 1,
-1.333257, 0.001237236, -2.748128, 1, 1, 1, 1, 1,
-1.329889, 2.17556, -0.8621567, 1, 1, 1, 1, 1,
-1.316327, 0.2635903, -0.2596874, 1, 1, 1, 1, 1,
-1.313689, 0.01976582, -2.422329, 0, 0, 1, 1, 1,
-1.308754, -0.7944487, -4.243845, 1, 0, 0, 1, 1,
-1.29969, -1.390023, -2.112699, 1, 0, 0, 1, 1,
-1.276105, -0.02479865, -0.2107186, 1, 0, 0, 1, 1,
-1.274163, -1.346424, -2.282676, 1, 0, 0, 1, 1,
-1.271158, 1.091869, -1.796535, 1, 0, 0, 1, 1,
-1.271095, 1.107095, -2.734554, 0, 0, 0, 1, 1,
-1.265306, -0.8745749, -3.567521, 0, 0, 0, 1, 1,
-1.262458, -0.5202309, -1.762935, 0, 0, 0, 1, 1,
-1.261644, -1.363127, 0.0523984, 0, 0, 0, 1, 1,
-1.26113, 0.166978, -1.621898, 0, 0, 0, 1, 1,
-1.258194, -0.4988257, -2.999706, 0, 0, 0, 1, 1,
-1.235564, 0.08952428, -0.713802, 0, 0, 0, 1, 1,
-1.234524, -1.669898, -2.9717, 1, 1, 1, 1, 1,
-1.231966, 0.683404, -1.049686, 1, 1, 1, 1, 1,
-1.228201, 0.2138261, -2.091215, 1, 1, 1, 1, 1,
-1.227404, 0.3194805, -1.634442, 1, 1, 1, 1, 1,
-1.225157, -1.285627, -3.678798, 1, 1, 1, 1, 1,
-1.223135, 0.7168849, -0.7901928, 1, 1, 1, 1, 1,
-1.221988, -1.313121, -1.590956, 1, 1, 1, 1, 1,
-1.220882, 1.21533, -0.07439661, 1, 1, 1, 1, 1,
-1.220067, 0.2360901, -1.301756, 1, 1, 1, 1, 1,
-1.218177, -0.05672635, -2.219769, 1, 1, 1, 1, 1,
-1.205721, -1.152262, -2.010312, 1, 1, 1, 1, 1,
-1.204033, -1.206957, -1.232912, 1, 1, 1, 1, 1,
-1.200945, 0.6114808, -2.278404, 1, 1, 1, 1, 1,
-1.194218, 0.4283281, -3.530872, 1, 1, 1, 1, 1,
-1.19387, 0.7170846, -1.497539, 1, 1, 1, 1, 1,
-1.193432, 1.882884, -1.220705, 0, 0, 1, 1, 1,
-1.181719, 0.4587444, -2.077775, 1, 0, 0, 1, 1,
-1.171199, -0.8637887, 0.7114629, 1, 0, 0, 1, 1,
-1.169124, -0.2590617, -2.25058, 1, 0, 0, 1, 1,
-1.166129, 0.1762928, -1.030026, 1, 0, 0, 1, 1,
-1.161853, -1.191, -2.683514, 1, 0, 0, 1, 1,
-1.159632, -0.4998514, -1.982367, 0, 0, 0, 1, 1,
-1.158225, 0.7796665, -1.168978, 0, 0, 0, 1, 1,
-1.156317, -0.7738363, -1.827414, 0, 0, 0, 1, 1,
-1.152906, 1.70027, -0.3061495, 0, 0, 0, 1, 1,
-1.145386, 1.235546, -1.737011, 0, 0, 0, 1, 1,
-1.144222, 0.01849519, -1.560287, 0, 0, 0, 1, 1,
-1.142914, 0.2007678, -0.8496442, 0, 0, 0, 1, 1,
-1.136621, 1.029382, -0.1013089, 1, 1, 1, 1, 1,
-1.135479, 0.5781442, -1.067593, 1, 1, 1, 1, 1,
-1.13311, 0.234168, -1.970255, 1, 1, 1, 1, 1,
-1.131451, -0.4804798, -1.203291, 1, 1, 1, 1, 1,
-1.122967, -0.3253735, -3.205069, 1, 1, 1, 1, 1,
-1.120371, -1.06666, -2.146867, 1, 1, 1, 1, 1,
-1.114311, -0.3212053, -2.540482, 1, 1, 1, 1, 1,
-1.085371, -0.6891257, -1.978505, 1, 1, 1, 1, 1,
-1.085091, -1.199871, -0.4561161, 1, 1, 1, 1, 1,
-1.074545, 0.8544129, -0.08816835, 1, 1, 1, 1, 1,
-1.074231, 0.4210094, -2.403969, 1, 1, 1, 1, 1,
-1.071565, 0.3378557, -0.919517, 1, 1, 1, 1, 1,
-1.070408, 0.2931096, -0.8101426, 1, 1, 1, 1, 1,
-1.069892, 1.917151, -1.13816, 1, 1, 1, 1, 1,
-1.069513, -0.4718821, -1.492794, 1, 1, 1, 1, 1,
-1.063698, 1.030703, -0.7781798, 0, 0, 1, 1, 1,
-1.055226, 0.0837699, 0.3917162, 1, 0, 0, 1, 1,
-1.050579, -1.249501, -1.397306, 1, 0, 0, 1, 1,
-1.048249, -0.5652003, -0.3467764, 1, 0, 0, 1, 1,
-1.047006, -0.7519338, -1.808321, 1, 0, 0, 1, 1,
-1.039738, 1.145975, 1.155222, 1, 0, 0, 1, 1,
-1.032387, 0.7246224, -2.417269, 0, 0, 0, 1, 1,
-1.030479, -1.102346, -3.988925, 0, 0, 0, 1, 1,
-1.015728, 1.12034, -1.191119, 0, 0, 0, 1, 1,
-1.015285, 0.2744879, -1.669549, 0, 0, 0, 1, 1,
-1.013623, -1.209002, -2.241341, 0, 0, 0, 1, 1,
-1.009701, -0.3181554, -2.220939, 0, 0, 0, 1, 1,
-1.009207, 1.286127, -3.130429, 0, 0, 0, 1, 1,
-1.005617, 0.8557803, 0.1161106, 1, 1, 1, 1, 1,
-0.9999971, 0.8452685, -0.02727389, 1, 1, 1, 1, 1,
-0.9804015, 0.4617029, -0.3836484, 1, 1, 1, 1, 1,
-0.9771577, -0.5009274, -3.062108, 1, 1, 1, 1, 1,
-0.9770826, 0.02091636, -1.600074, 1, 1, 1, 1, 1,
-0.9769807, -1.808237, -2.571772, 1, 1, 1, 1, 1,
-0.9647521, 0.03846699, 0.9139178, 1, 1, 1, 1, 1,
-0.9618499, -2.302846, -2.642087, 1, 1, 1, 1, 1,
-0.9603766, -0.1302141, -2.460253, 1, 1, 1, 1, 1,
-0.957252, 1.99269, -1.491709, 1, 1, 1, 1, 1,
-0.9568679, -0.739163, -0.4223807, 1, 1, 1, 1, 1,
-0.947556, 1.932875, -1.320461, 1, 1, 1, 1, 1,
-0.9401865, -1.676336, -2.738132, 1, 1, 1, 1, 1,
-0.9312006, -0.3954678, -0.3695696, 1, 1, 1, 1, 1,
-0.928314, 0.8693595, -1.246824, 1, 1, 1, 1, 1,
-0.9276574, -0.1795116, -3.470766, 0, 0, 1, 1, 1,
-0.9274995, -1.274182, -3.633152, 1, 0, 0, 1, 1,
-0.9115858, -2.082566, -2.263676, 1, 0, 0, 1, 1,
-0.9058803, -1.410764, -3.019732, 1, 0, 0, 1, 1,
-0.9013972, -0.4052147, -2.808941, 1, 0, 0, 1, 1,
-0.9010134, -0.2645628, -0.2433842, 1, 0, 0, 1, 1,
-0.896785, -0.6327487, -1.894342, 0, 0, 0, 1, 1,
-0.8906481, 0.09759036, -2.493288, 0, 0, 0, 1, 1,
-0.8887181, -0.2255069, -2.499348, 0, 0, 0, 1, 1,
-0.8875307, -0.1832654, -1.132697, 0, 0, 0, 1, 1,
-0.8875283, -0.5799543, -0.6581506, 0, 0, 0, 1, 1,
-0.8809788, -1.385396, -4.41606, 0, 0, 0, 1, 1,
-0.8797162, 0.396569, -3.08524, 0, 0, 0, 1, 1,
-0.8688808, 1.144837, 1.099857, 1, 1, 1, 1, 1,
-0.8624173, 0.9529379, -2.108051, 1, 1, 1, 1, 1,
-0.8597926, -0.305733, -1.287791, 1, 1, 1, 1, 1,
-0.8526798, -0.1081749, -1.731786, 1, 1, 1, 1, 1,
-0.8523408, 0.3015009, 0.4352157, 1, 1, 1, 1, 1,
-0.8517444, 0.06918634, -0.9588948, 1, 1, 1, 1, 1,
-0.8496611, -0.394186, -2.717343, 1, 1, 1, 1, 1,
-0.8306924, -0.06319764, -1.006691, 1, 1, 1, 1, 1,
-0.829699, -0.06488407, -1.422816, 1, 1, 1, 1, 1,
-0.8279134, -0.3715946, -0.8187921, 1, 1, 1, 1, 1,
-0.8261217, -0.08462433, -3.732938, 1, 1, 1, 1, 1,
-0.825038, 0.5500934, -0.668121, 1, 1, 1, 1, 1,
-0.824491, 1.294337, 0.9975253, 1, 1, 1, 1, 1,
-0.8164614, -0.1095162, -2.817342, 1, 1, 1, 1, 1,
-0.8119545, -0.7594811, -4.308674, 1, 1, 1, 1, 1,
-0.8088716, -0.3483598, -2.018486, 0, 0, 1, 1, 1,
-0.807723, -1.200995, -3.604777, 1, 0, 0, 1, 1,
-0.8023326, -0.5581206, -1.3441, 1, 0, 0, 1, 1,
-0.7981855, 0.5030518, -0.9542031, 1, 0, 0, 1, 1,
-0.7833889, 0.4209857, -1.690157, 1, 0, 0, 1, 1,
-0.7724882, -0.1462354, -1.497581, 1, 0, 0, 1, 1,
-0.7710438, -0.372939, -1.869714, 0, 0, 0, 1, 1,
-0.7682186, -0.4639786, -1.398892, 0, 0, 0, 1, 1,
-0.7678958, 0.8541223, -1.035202, 0, 0, 0, 1, 1,
-0.7613207, -0.1588538, -1.29653, 0, 0, 0, 1, 1,
-0.7572932, -0.1158518, -1.952942, 0, 0, 0, 1, 1,
-0.7549565, 0.02148533, -0.5291404, 0, 0, 0, 1, 1,
-0.7454305, -0.3349217, -0.3074723, 0, 0, 0, 1, 1,
-0.741274, -0.106753, -3.370959, 1, 1, 1, 1, 1,
-0.7339272, -0.2927762, -2.050153, 1, 1, 1, 1, 1,
-0.7311761, -0.4329617, -2.151759, 1, 1, 1, 1, 1,
-0.7231047, -1.392985, -3.701147, 1, 1, 1, 1, 1,
-0.7226621, 0.789573, -0.08796684, 1, 1, 1, 1, 1,
-0.7198787, 0.5092033, -2.217309, 1, 1, 1, 1, 1,
-0.7154769, 0.84841, -0.572134, 1, 1, 1, 1, 1,
-0.7153063, -0.09258151, 0.7605062, 1, 1, 1, 1, 1,
-0.7124179, -0.02337765, -1.404061, 1, 1, 1, 1, 1,
-0.7101941, 0.64741, -1.416989, 1, 1, 1, 1, 1,
-0.7090238, 2.313703, -1.207548, 1, 1, 1, 1, 1,
-0.7079891, 0.0463881, -1.90441, 1, 1, 1, 1, 1,
-0.7073249, 0.4604213, -0.3971225, 1, 1, 1, 1, 1,
-0.7068976, 0.3873451, -1.119698, 1, 1, 1, 1, 1,
-0.7029947, -0.3601533, -1.089273, 1, 1, 1, 1, 1,
-0.702864, -1.012333, -2.866546, 0, 0, 1, 1, 1,
-0.7005295, 0.9457396, 0.762868, 1, 0, 0, 1, 1,
-0.6997294, -1.687831, -3.17219, 1, 0, 0, 1, 1,
-0.6956226, -1.593477, -2.575059, 1, 0, 0, 1, 1,
-0.6954378, 0.4046148, 0.9190672, 1, 0, 0, 1, 1,
-0.694296, -0.6366861, -2.807199, 1, 0, 0, 1, 1,
-0.6933455, 0.9742937, -2.486623, 0, 0, 0, 1, 1,
-0.6925122, -0.6849659, -2.558738, 0, 0, 0, 1, 1,
-0.6917652, 0.4800521, -0.8297769, 0, 0, 0, 1, 1,
-0.6891945, 0.412281, -0.7562519, 0, 0, 0, 1, 1,
-0.6887925, 1.24951, -0.3628048, 0, 0, 0, 1, 1,
-0.6884258, -1.677782, -4.900369, 0, 0, 0, 1, 1,
-0.6761569, -1.062599, -2.579426, 0, 0, 0, 1, 1,
-0.6760673, -0.752243, -3.212996, 1, 1, 1, 1, 1,
-0.674918, 0.6212503, -1.713642, 1, 1, 1, 1, 1,
-0.6721516, 1.859915, -1.192681, 1, 1, 1, 1, 1,
-0.6712871, -0.5890003, -3.306933, 1, 1, 1, 1, 1,
-0.6697167, -1.558171, -1.128607, 1, 1, 1, 1, 1,
-0.6675145, -0.1894314, -2.139002, 1, 1, 1, 1, 1,
-0.665512, -0.3825068, -2.527079, 1, 1, 1, 1, 1,
-0.6618491, 1.75026, 0.2844994, 1, 1, 1, 1, 1,
-0.648348, 0.1169003, 0.01047649, 1, 1, 1, 1, 1,
-0.6423806, -1.760093, -2.653668, 1, 1, 1, 1, 1,
-0.637734, -1.455115, -0.5179964, 1, 1, 1, 1, 1,
-0.6365271, 0.706576, 0.05043731, 1, 1, 1, 1, 1,
-0.6346778, 0.5605981, -0.1493213, 1, 1, 1, 1, 1,
-0.6329295, 1.031846, -0.8873063, 1, 1, 1, 1, 1,
-0.6257289, 1.988022, -0.1603318, 1, 1, 1, 1, 1,
-0.6217741, 0.417503, 0.7652327, 0, 0, 1, 1, 1,
-0.6197786, 0.55366, -1.532276, 1, 0, 0, 1, 1,
-0.6170546, 1.603179, -0.4946438, 1, 0, 0, 1, 1,
-0.6152157, -0.8312069, -1.857186, 1, 0, 0, 1, 1,
-0.6150203, 1.069, 0.02368335, 1, 0, 0, 1, 1,
-0.6133968, 2.378618, -0.1240315, 1, 0, 0, 1, 1,
-0.6128015, 0.2621835, -0.7491575, 0, 0, 0, 1, 1,
-0.6078098, 0.1088931, -2.091988, 0, 0, 0, 1, 1,
-0.6056779, -0.3139303, -1.221902, 0, 0, 0, 1, 1,
-0.5971594, -1.432708, -2.829139, 0, 0, 0, 1, 1,
-0.5964208, -0.7225036, -0.6069043, 0, 0, 0, 1, 1,
-0.5921356, 0.1463487, -0.03353076, 0, 0, 0, 1, 1,
-0.5910183, -0.6303119, -3.172135, 0, 0, 0, 1, 1,
-0.5881093, -2.256492, -1.244792, 1, 1, 1, 1, 1,
-0.5815313, -1.231452, -2.414516, 1, 1, 1, 1, 1,
-0.5804304, 0.77293, -0.4888484, 1, 1, 1, 1, 1,
-0.5767277, -2.494966, -2.606705, 1, 1, 1, 1, 1,
-0.5758825, -0.9783839, -3.546267, 1, 1, 1, 1, 1,
-0.5721855, -0.6312243, -1.882384, 1, 1, 1, 1, 1,
-0.5707058, 0.3200746, -1.573637, 1, 1, 1, 1, 1,
-0.5696591, -0.4309779, -5.495615, 1, 1, 1, 1, 1,
-0.568971, 0.1712577, -1.494687, 1, 1, 1, 1, 1,
-0.5685707, -0.1488137, -3.21386, 1, 1, 1, 1, 1,
-0.5673267, 0.5514199, -0.7155829, 1, 1, 1, 1, 1,
-0.5671385, -0.7223632, -1.974165, 1, 1, 1, 1, 1,
-0.5587341, 1.911628, -0.6070316, 1, 1, 1, 1, 1,
-0.5568895, -0.7580411, -1.563058, 1, 1, 1, 1, 1,
-0.5555757, 0.3661581, -0.2038511, 1, 1, 1, 1, 1,
-0.5538949, 1.639464, 0.1008045, 0, 0, 1, 1, 1,
-0.5512124, 0.2319338, -1.154981, 1, 0, 0, 1, 1,
-0.5510248, 0.2553844, -0.6964906, 1, 0, 0, 1, 1,
-0.5510139, 0.378942, -0.8089671, 1, 0, 0, 1, 1,
-0.5497456, 0.843067, 1.233251, 1, 0, 0, 1, 1,
-0.5488658, 0.4533436, -0.07079, 1, 0, 0, 1, 1,
-0.546902, -0.4363618, -3.389776, 0, 0, 0, 1, 1,
-0.5427861, 0.6711407, -0.7591104, 0, 0, 0, 1, 1,
-0.5392105, 0.3431397, -0.6298813, 0, 0, 0, 1, 1,
-0.5371415, 1.136145, -0.8561432, 0, 0, 0, 1, 1,
-0.5365104, -0.02107605, -3.335526, 0, 0, 0, 1, 1,
-0.5319151, -0.03624432, -2.69495, 0, 0, 0, 1, 1,
-0.5307834, -1.528779, -3.655002, 0, 0, 0, 1, 1,
-0.5285754, -1.061808, -3.784512, 1, 1, 1, 1, 1,
-0.5268909, -1.608659, -1.515883, 1, 1, 1, 1, 1,
-0.5204691, -1.013645, -3.013077, 1, 1, 1, 1, 1,
-0.5158203, 0.03321342, -0.9512422, 1, 1, 1, 1, 1,
-0.5144691, -0.8354473, -3.765255, 1, 1, 1, 1, 1,
-0.5120444, 3.37568, -0.9787188, 1, 1, 1, 1, 1,
-0.5116202, 0.5509486, -2.719275, 1, 1, 1, 1, 1,
-0.5053791, 1.260693, 0.5619002, 1, 1, 1, 1, 1,
-0.5030554, -0.3218769, -1.192867, 1, 1, 1, 1, 1,
-0.4980684, -0.6799415, -4.79756, 1, 1, 1, 1, 1,
-0.4969645, 1.960524, -0.4860582, 1, 1, 1, 1, 1,
-0.4949685, -0.2945199, -2.842721, 1, 1, 1, 1, 1,
-0.4917682, 0.08437344, -1.575529, 1, 1, 1, 1, 1,
-0.4892363, -0.5025106, -0.9959563, 1, 1, 1, 1, 1,
-0.4888237, -0.3247618, -2.280514, 1, 1, 1, 1, 1,
-0.4870754, 0.4875374, -1.46571, 0, 0, 1, 1, 1,
-0.4869663, 0.3367785, -1.108811, 1, 0, 0, 1, 1,
-0.4818651, 3.31707, -1.077888, 1, 0, 0, 1, 1,
-0.4807547, 1.886349, 0.7911127, 1, 0, 0, 1, 1,
-0.4749583, -1.316956, -3.014257, 1, 0, 0, 1, 1,
-0.4749368, 1.031326, -0.8057625, 1, 0, 0, 1, 1,
-0.47413, 0.9355249, 0.07062762, 0, 0, 0, 1, 1,
-0.4717487, -0.2993199, -1.941258, 0, 0, 0, 1, 1,
-0.4571951, -1.30394, -3.014305, 0, 0, 0, 1, 1,
-0.4561022, -1.557919, -4.20051, 0, 0, 0, 1, 1,
-0.4525067, 2.369458, 0.742499, 0, 0, 0, 1, 1,
-0.4519478, -1.331285, -2.082943, 0, 0, 0, 1, 1,
-0.4515476, -1.595769, -3.134822, 0, 0, 0, 1, 1,
-0.4514301, 0.4565828, 0.9300097, 1, 1, 1, 1, 1,
-0.4510104, -0.3729911, -0.6975849, 1, 1, 1, 1, 1,
-0.4465708, 1.612484, 0.2725073, 1, 1, 1, 1, 1,
-0.4442297, -0.2894202, -2.578653, 1, 1, 1, 1, 1,
-0.440969, 0.4719814, 0.7844848, 1, 1, 1, 1, 1,
-0.4317601, -0.5378501, -1.575463, 1, 1, 1, 1, 1,
-0.4286107, -0.8245232, -1.614278, 1, 1, 1, 1, 1,
-0.4286009, 1.035814, -2.011881, 1, 1, 1, 1, 1,
-0.4245115, 1.38218, -1.141342, 1, 1, 1, 1, 1,
-0.4227516, 1.224442, -2.825887, 1, 1, 1, 1, 1,
-0.4221293, 1.643601, -2.305644, 1, 1, 1, 1, 1,
-0.4127078, -1.379379, -5.367617, 1, 1, 1, 1, 1,
-0.4124053, -0.4401754, -4.075924, 1, 1, 1, 1, 1,
-0.4104248, -0.04303699, -2.909616, 1, 1, 1, 1, 1,
-0.4078383, 1.235314, -0.5167426, 1, 1, 1, 1, 1,
-0.4074883, 0.05456364, 0.09995422, 0, 0, 1, 1, 1,
-0.4042972, -0.2395114, -2.103351, 1, 0, 0, 1, 1,
-0.4001226, 0.4948357, 0.05123577, 1, 0, 0, 1, 1,
-0.3959286, -0.07968092, -2.965007, 1, 0, 0, 1, 1,
-0.3914688, 1.466674, -1.640008, 1, 0, 0, 1, 1,
-0.390434, 0.2912803, 0.616614, 1, 0, 0, 1, 1,
-0.3866635, 0.2780205, -0.4726511, 0, 0, 0, 1, 1,
-0.3798608, -0.06676741, -2.046966, 0, 0, 0, 1, 1,
-0.3792235, 0.7238383, -2.115582, 0, 0, 0, 1, 1,
-0.3787581, -1.026844, -3.661228, 0, 0, 0, 1, 1,
-0.3768391, 3.511832, -1.951482, 0, 0, 0, 1, 1,
-0.3677022, -0.09699041, -0.7432005, 0, 0, 0, 1, 1,
-0.3650645, -0.3636976, -3.740534, 0, 0, 0, 1, 1,
-0.3579354, -0.6671945, -3.925268, 1, 1, 1, 1, 1,
-0.3567396, -0.5738702, -1.263149, 1, 1, 1, 1, 1,
-0.356452, -1.38542, -2.9193, 1, 1, 1, 1, 1,
-0.355435, 0.944409, 0.08905667, 1, 1, 1, 1, 1,
-0.3549994, -0.1035272, -0.3581249, 1, 1, 1, 1, 1,
-0.3549549, -0.1610014, -3.584494, 1, 1, 1, 1, 1,
-0.3524818, 0.076906, -0.1532944, 1, 1, 1, 1, 1,
-0.3518399, -0.350796, -3.090776, 1, 1, 1, 1, 1,
-0.3456163, 0.3762125, -0.1423393, 1, 1, 1, 1, 1,
-0.3422258, 0.1690241, -1.273643, 1, 1, 1, 1, 1,
-0.3356205, 0.1199588, -1.050436, 1, 1, 1, 1, 1,
-0.3348334, -0.1339764, -0.8909379, 1, 1, 1, 1, 1,
-0.3346895, 1.287001, -2.638131, 1, 1, 1, 1, 1,
-0.3253297, -1.805804, -1.420091, 1, 1, 1, 1, 1,
-0.3197556, 0.6450146, 0.2513495, 1, 1, 1, 1, 1,
-0.3141592, 0.06006743, -0.9685408, 0, 0, 1, 1, 1,
-0.3134095, 0.2354698, -1.581734, 1, 0, 0, 1, 1,
-0.3096848, -0.09501523, -1.860939, 1, 0, 0, 1, 1,
-0.3069643, -0.9346102, -4.619354, 1, 0, 0, 1, 1,
-0.3049876, -2.449618, -3.818989, 1, 0, 0, 1, 1,
-0.304758, -0.3313516, -2.636886, 1, 0, 0, 1, 1,
-0.3015092, 0.1640533, -1.747398, 0, 0, 0, 1, 1,
-0.3000003, 1.48825, 1.90703, 0, 0, 0, 1, 1,
-0.2984263, -0.5613385, -0.9709848, 0, 0, 0, 1, 1,
-0.2959554, -0.02622314, -1.261495, 0, 0, 0, 1, 1,
-0.2934024, 1.049188, 0.6223111, 0, 0, 0, 1, 1,
-0.2907617, -0.01552906, -1.646092, 0, 0, 0, 1, 1,
-0.2821711, -0.4782518, -2.09069, 0, 0, 0, 1, 1,
-0.2751921, 0.9310783, -1.40694, 1, 1, 1, 1, 1,
-0.2692977, 1.105494, -0.1043706, 1, 1, 1, 1, 1,
-0.2677545, -0.6625855, -3.716702, 1, 1, 1, 1, 1,
-0.2664042, 0.2358714, -2.15007, 1, 1, 1, 1, 1,
-0.2615111, 1.441134, 0.7355291, 1, 1, 1, 1, 1,
-0.2581523, 0.4067816, -2.034499, 1, 1, 1, 1, 1,
-0.2580856, 0.9088282, 0.002562391, 1, 1, 1, 1, 1,
-0.2533637, 0.5025744, -0.6644104, 1, 1, 1, 1, 1,
-0.2524324, -0.361457, -0.1108771, 1, 1, 1, 1, 1,
-0.244236, 0.1157151, -1.549804, 1, 1, 1, 1, 1,
-0.2352384, -0.880784, -1.495756, 1, 1, 1, 1, 1,
-0.2330365, 0.03708391, -1.48919, 1, 1, 1, 1, 1,
-0.227046, 0.7000573, -0.9435163, 1, 1, 1, 1, 1,
-0.2270394, 1.492694, 1.373846, 1, 1, 1, 1, 1,
-0.226046, 0.181355, -1.196024, 1, 1, 1, 1, 1,
-0.220719, -0.2151153, 0.306354, 0, 0, 1, 1, 1,
-0.2179209, 0.3715075, -0.6150095, 1, 0, 0, 1, 1,
-0.2174901, 1.683141, -0.2362311, 1, 0, 0, 1, 1,
-0.2163514, 0.9534504, -0.1831123, 1, 0, 0, 1, 1,
-0.2119338, -0.6337953, -2.451961, 1, 0, 0, 1, 1,
-0.2116163, 0.6614531, -1.406977, 1, 0, 0, 1, 1,
-0.2103043, 1.058537, 2.151143, 0, 0, 0, 1, 1,
-0.2100778, 0.2801766, -1.738698, 0, 0, 0, 1, 1,
-0.2098414, -0.8034889, -4.083537, 0, 0, 0, 1, 1,
-0.2084498, -0.906765, -3.495934, 0, 0, 0, 1, 1,
-0.2082015, -0.5319629, -1.125188, 0, 0, 0, 1, 1,
-0.20816, 0.732039, -0.8908923, 0, 0, 0, 1, 1,
-0.2045083, -0.5739463, -1.078414, 0, 0, 0, 1, 1,
-0.1971868, 0.8637952, 0.4142237, 1, 1, 1, 1, 1,
-0.1962912, -1.662859, -1.986338, 1, 1, 1, 1, 1,
-0.1947707, 1.199687, 0.7542927, 1, 1, 1, 1, 1,
-0.1919306, 0.0009040889, -2.998425, 1, 1, 1, 1, 1,
-0.1915044, -1.376699, -5.705247, 1, 1, 1, 1, 1,
-0.191294, 0.01948619, -1.498951, 1, 1, 1, 1, 1,
-0.1909953, -0.05858784, -0.3412956, 1, 1, 1, 1, 1,
-0.1865979, -0.6104934, -4.425716, 1, 1, 1, 1, 1,
-0.1831896, -0.8802679, -3.578506, 1, 1, 1, 1, 1,
-0.1799146, -0.5039881, -2.885296, 1, 1, 1, 1, 1,
-0.1753902, -0.1331217, -2.164634, 1, 1, 1, 1, 1,
-0.1748934, -1.129011, -3.042014, 1, 1, 1, 1, 1,
-0.1724584, -0.8547516, -4.460913, 1, 1, 1, 1, 1,
-0.1697834, 0.6100149, -0.5298336, 1, 1, 1, 1, 1,
-0.1697044, -0.7787313, -2.35452, 1, 1, 1, 1, 1,
-0.168861, -2.708059, -3.976528, 0, 0, 1, 1, 1,
-0.163915, 1.083493, 0.3046334, 1, 0, 0, 1, 1,
-0.1580264, 0.6073756, 0.7362446, 1, 0, 0, 1, 1,
-0.1538902, -1.212071, -3.143958, 1, 0, 0, 1, 1,
-0.1492511, 0.8005771, -0.8103718, 1, 0, 0, 1, 1,
-0.1477075, 1.699299, 0.1668733, 1, 0, 0, 1, 1,
-0.1443196, -0.03829758, -2.995398, 0, 0, 0, 1, 1,
-0.1431925, 0.1076781, -0.9098452, 0, 0, 0, 1, 1,
-0.1415266, 0.01956923, -2.457726, 0, 0, 0, 1, 1,
-0.1412723, 0.3158847, -1.085283, 0, 0, 0, 1, 1,
-0.1393712, -1.007868, -3.84721, 0, 0, 0, 1, 1,
-0.1370711, 0.6713985, -0.007002329, 0, 0, 0, 1, 1,
-0.1306522, -0.6495799, -1.201659, 0, 0, 0, 1, 1,
-0.1290501, 0.1865705, -2.648028, 1, 1, 1, 1, 1,
-0.12695, -0.4157075, -1.982754, 1, 1, 1, 1, 1,
-0.1265559, 0.1734235, -1.718943, 1, 1, 1, 1, 1,
-0.1204682, -0.635491, -3.655786, 1, 1, 1, 1, 1,
-0.1178693, -0.7175652, -2.716479, 1, 1, 1, 1, 1,
-0.1161837, -0.145956, -3.337283, 1, 1, 1, 1, 1,
-0.1156398, 1.422069, -0.7115785, 1, 1, 1, 1, 1,
-0.1145662, 0.4218873, 0.7168218, 1, 1, 1, 1, 1,
-0.1140144, -1.238512, -3.919025, 1, 1, 1, 1, 1,
-0.1131854, -0.8877863, -2.439931, 1, 1, 1, 1, 1,
-0.1092983, -1.604574, -2.942577, 1, 1, 1, 1, 1,
-0.1086157, -0.7585892, -4.761362, 1, 1, 1, 1, 1,
-0.1021729, -0.8377073, -4.873436, 1, 1, 1, 1, 1,
-0.09999862, -0.5546948, -3.286774, 1, 1, 1, 1, 1,
-0.09928122, 0.809692, 1.931634, 1, 1, 1, 1, 1,
-0.09862079, -0.639103, -1.144331, 0, 0, 1, 1, 1,
-0.09504113, -0.3390847, -2.252112, 1, 0, 0, 1, 1,
-0.09327706, -0.3681243, -1.78241, 1, 0, 0, 1, 1,
-0.08953451, 1.209404, 0.3123848, 1, 0, 0, 1, 1,
-0.08200103, -2.33496, -3.721149, 1, 0, 0, 1, 1,
-0.07762071, 2.458055, -0.2136769, 1, 0, 0, 1, 1,
-0.07721972, -1.303432, -3.710924, 0, 0, 0, 1, 1,
-0.07656316, -1.236099, -2.32322, 0, 0, 0, 1, 1,
-0.07635789, 1.115675, 0.4604507, 0, 0, 0, 1, 1,
-0.07624292, -1.439858, -1.76745, 0, 0, 0, 1, 1,
-0.07166612, -0.7972316, -2.386874, 0, 0, 0, 1, 1,
-0.07041078, -0.350362, -4.099888, 0, 0, 0, 1, 1,
-0.06722458, 0.6685952, 1.322878, 0, 0, 0, 1, 1,
-0.06280593, 0.8925435, -1.325128, 1, 1, 1, 1, 1,
-0.06035058, -0.7342934, -4.65196, 1, 1, 1, 1, 1,
-0.05629634, -0.5545042, -1.191877, 1, 1, 1, 1, 1,
-0.05250329, -0.3528212, -4.02995, 1, 1, 1, 1, 1,
-0.05072864, 0.00981497, 0.3176693, 1, 1, 1, 1, 1,
-0.04745898, 2.611723, -0.8167428, 1, 1, 1, 1, 1,
-0.03755244, 0.02996489, -1.129757, 1, 1, 1, 1, 1,
-0.03690419, 0.02456789, -0.5987659, 1, 1, 1, 1, 1,
-0.03281706, 0.575022, 1.160132, 1, 1, 1, 1, 1,
-0.03189574, -0.2951379, -3.191289, 1, 1, 1, 1, 1,
-0.03047695, -0.9353237, -2.942999, 1, 1, 1, 1, 1,
-0.02764351, 1.334032, -0.2116931, 1, 1, 1, 1, 1,
-0.02656919, -0.8096691, -2.541866, 1, 1, 1, 1, 1,
-0.02392254, -0.7017187, -1.08666, 1, 1, 1, 1, 1,
-0.02058259, -0.0219621, -0.948226, 1, 1, 1, 1, 1,
-0.01902837, -0.007298385, -1.405913, 0, 0, 1, 1, 1,
-0.01894903, 2.766704, -0.09434397, 1, 0, 0, 1, 1,
-0.01872718, 0.6319668, 0.847236, 1, 0, 0, 1, 1,
-0.01673634, 2.305073, -0.5422733, 1, 0, 0, 1, 1,
-0.0159694, 0.6692716, 0.9010681, 1, 0, 0, 1, 1,
-0.01568898, -0.5988194, -2.836317, 1, 0, 0, 1, 1,
-0.01482634, 0.808186, 1.331277, 0, 0, 0, 1, 1,
-0.01256507, -0.5060367, -3.395039, 0, 0, 0, 1, 1,
-0.0103072, -0.5800974, -3.54841, 0, 0, 0, 1, 1,
-0.00806277, -1.891553, -3.829058, 0, 0, 0, 1, 1,
-0.007721771, 0.2483063, -1.269731, 0, 0, 0, 1, 1,
-0.004664605, 0.4182481, -0.4807956, 0, 0, 0, 1, 1,
-0.003190891, -0.5995088, -1.537617, 0, 0, 0, 1, 1,
-0.001607982, -1.27919, -4.276216, 1, 1, 1, 1, 1,
0.0002070501, 0.4080678, 0.5901543, 1, 1, 1, 1, 1,
0.003648512, -0.9009496, 4.016342, 1, 1, 1, 1, 1,
0.005175732, 1.454151, -0.5021178, 1, 1, 1, 1, 1,
0.005321743, -0.3114535, 1.666376, 1, 1, 1, 1, 1,
0.00832146, -1.174456, 4.425042, 1, 1, 1, 1, 1,
0.01515555, -0.6781176, 2.016912, 1, 1, 1, 1, 1,
0.01899755, 0.005822761, -0.1654646, 1, 1, 1, 1, 1,
0.02176126, -0.01862783, 0.612822, 1, 1, 1, 1, 1,
0.02179071, -0.4530351, 3.77007, 1, 1, 1, 1, 1,
0.02292693, 0.3076796, -1.224893, 1, 1, 1, 1, 1,
0.02464706, 0.6692092, -0.04441456, 1, 1, 1, 1, 1,
0.03211098, -1.213265, 3.245838, 1, 1, 1, 1, 1,
0.03370558, 0.3233824, 1.102318, 1, 1, 1, 1, 1,
0.03377945, -0.5416607, 2.120437, 1, 1, 1, 1, 1,
0.03715685, -0.1064545, 1.647204, 0, 0, 1, 1, 1,
0.03871858, 1.043332, 0.5599388, 1, 0, 0, 1, 1,
0.04075978, 0.5351353, 0.4377167, 1, 0, 0, 1, 1,
0.04128398, 1.202496, -1.288963, 1, 0, 0, 1, 1,
0.04392658, 0.8438596, -0.6727254, 1, 0, 0, 1, 1,
0.04470931, -0.2062735, 2.091352, 1, 0, 0, 1, 1,
0.04658752, -0.4810631, 2.006621, 0, 0, 0, 1, 1,
0.04832059, 2.722835, -0.1554792, 0, 0, 0, 1, 1,
0.05168756, 0.9120127, 0.7623588, 0, 0, 0, 1, 1,
0.05358011, -1.105733, 1.509593, 0, 0, 0, 1, 1,
0.0539281, -0.5051934, 2.711546, 0, 0, 0, 1, 1,
0.05440084, 0.5139759, 0.756894, 0, 0, 0, 1, 1,
0.05471318, -0.2073945, 2.366112, 0, 0, 0, 1, 1,
0.05664506, -0.8335578, 3.216142, 1, 1, 1, 1, 1,
0.05741093, 0.06555121, 0.3903197, 1, 1, 1, 1, 1,
0.06660365, -1.188426, 2.832394, 1, 1, 1, 1, 1,
0.06814583, 0.09975613, 1.935124, 1, 1, 1, 1, 1,
0.07629776, -0.4963576, 3.514697, 1, 1, 1, 1, 1,
0.08301535, -0.9915587, 5.425385, 1, 1, 1, 1, 1,
0.08454043, 0.08626667, 1.570992, 1, 1, 1, 1, 1,
0.08558504, -0.1397136, 1.291545, 1, 1, 1, 1, 1,
0.09303255, 0.4286331, 0.4062083, 1, 1, 1, 1, 1,
0.09406871, 0.5939769, -1.247651, 1, 1, 1, 1, 1,
0.1005047, 1.431452, 0.6292313, 1, 1, 1, 1, 1,
0.1025484, 0.8082925, 0.07425677, 1, 1, 1, 1, 1,
0.1038032, 0.7841873, -1.811998, 1, 1, 1, 1, 1,
0.1040075, -1.037524, 3.889868, 1, 1, 1, 1, 1,
0.1047114, 1.133192, 0.7422265, 1, 1, 1, 1, 1,
0.1094614, -0.6346679, 2.000514, 0, 0, 1, 1, 1,
0.1187201, -1.135059, 3.324051, 1, 0, 0, 1, 1,
0.1192405, 0.3744094, 0.5361204, 1, 0, 0, 1, 1,
0.1216922, -0.1899178, 3.43799, 1, 0, 0, 1, 1,
0.1228367, 0.4488325, 0.9745641, 1, 0, 0, 1, 1,
0.1249369, 0.7732027, -1.458048, 1, 0, 0, 1, 1,
0.1263395, -1.443945, 2.955146, 0, 0, 0, 1, 1,
0.12943, -1.209537, 3.086826, 0, 0, 0, 1, 1,
0.1312513, 1.086676, 0.3471392, 0, 0, 0, 1, 1,
0.1337393, 0.2016182, 0.828588, 0, 0, 0, 1, 1,
0.1349239, -0.05669697, 0.5267431, 0, 0, 0, 1, 1,
0.1350301, 1.785396, 0.3285913, 0, 0, 0, 1, 1,
0.1380287, 0.1631612, 0.5737618, 0, 0, 0, 1, 1,
0.1398362, 0.640863, -0.002952877, 1, 1, 1, 1, 1,
0.1433125, 1.150626, 2.00158, 1, 1, 1, 1, 1,
0.1462793, 1.081948, 0.1600477, 1, 1, 1, 1, 1,
0.1518507, -0.6703622, 4.823547, 1, 1, 1, 1, 1,
0.1564774, -0.638126, 2.422142, 1, 1, 1, 1, 1,
0.1589568, -0.584551, 2.925843, 1, 1, 1, 1, 1,
0.1601717, 0.4178371, 0.277265, 1, 1, 1, 1, 1,
0.1611827, -0.5336801, 1.258575, 1, 1, 1, 1, 1,
0.1614202, 0.5493723, -0.5008038, 1, 1, 1, 1, 1,
0.1671898, 0.8132442, -0.5109171, 1, 1, 1, 1, 1,
0.1672972, 0.03270949, 0.05086238, 1, 1, 1, 1, 1,
0.1685156, 0.2473146, 2.131611, 1, 1, 1, 1, 1,
0.1687693, -0.8100659, 4.622425, 1, 1, 1, 1, 1,
0.1738901, 1.743045, 0.7342489, 1, 1, 1, 1, 1,
0.1746205, 0.7807684, 0.1132567, 1, 1, 1, 1, 1,
0.1768069, -0.1542347, 2.440819, 0, 0, 1, 1, 1,
0.176888, 0.2718527, 1.674809, 1, 0, 0, 1, 1,
0.1784395, 1.00934, 0.7667024, 1, 0, 0, 1, 1,
0.1800194, 0.02577704, 1.274493, 1, 0, 0, 1, 1,
0.1856242, 1.039815, 0.4544042, 1, 0, 0, 1, 1,
0.1954404, -1.204878, 0.01007829, 1, 0, 0, 1, 1,
0.197334, -0.4739951, 3.529367, 0, 0, 0, 1, 1,
0.1975866, -0.09257822, 1.01575, 0, 0, 0, 1, 1,
0.1979677, 0.0009743118, -0.2736858, 0, 0, 0, 1, 1,
0.1987964, -0.3895984, 2.557863, 0, 0, 0, 1, 1,
0.1991116, -0.05292225, 3.138721, 0, 0, 0, 1, 1,
0.200479, -1.077681, 1.362481, 0, 0, 0, 1, 1,
0.2022161, 0.9855855, 0.9548295, 0, 0, 0, 1, 1,
0.2064129, -0.6323323, 3.594738, 1, 1, 1, 1, 1,
0.2089521, -1.226868, 4.718599, 1, 1, 1, 1, 1,
0.216433, 0.2937308, 2.728112, 1, 1, 1, 1, 1,
0.2234251, 0.0838329, 2.143546, 1, 1, 1, 1, 1,
0.2234429, -0.286093, 0.9731588, 1, 1, 1, 1, 1,
0.223928, 0.8096679, 0.5103273, 1, 1, 1, 1, 1,
0.2239478, 0.658906, -1.484436, 1, 1, 1, 1, 1,
0.2256123, -0.1734857, 2.493588, 1, 1, 1, 1, 1,
0.2287039, -0.4413833, 2.243362, 1, 1, 1, 1, 1,
0.2295262, 0.9571925, -0.7083981, 1, 1, 1, 1, 1,
0.2311048, 0.4186729, -0.6502065, 1, 1, 1, 1, 1,
0.2375685, 1.61932, 0.5367006, 1, 1, 1, 1, 1,
0.2399694, 0.8212644, -1.15749, 1, 1, 1, 1, 1,
0.2409069, 0.1939053, -0.2021766, 1, 1, 1, 1, 1,
0.2475398, -0.5783263, 1.951085, 1, 1, 1, 1, 1,
0.249599, -0.9902676, 2.399242, 0, 0, 1, 1, 1,
0.2509947, 1.217076, 1.561778, 1, 0, 0, 1, 1,
0.2548042, -0.9435839, -0.7468178, 1, 0, 0, 1, 1,
0.2561342, 1.581998, -0.1895358, 1, 0, 0, 1, 1,
0.2579218, -1.159014, 1.581861, 1, 0, 0, 1, 1,
0.2597292, 2.417277, 0.2945695, 1, 0, 0, 1, 1,
0.2598343, 0.1176331, 2.314786, 0, 0, 0, 1, 1,
0.2613889, -0.2349282, 1.394074, 0, 0, 0, 1, 1,
0.2654233, -0.04005421, 3.641067, 0, 0, 0, 1, 1,
0.2659478, 1.995163, 0.326009, 0, 0, 0, 1, 1,
0.266373, -0.6423447, 2.392089, 0, 0, 0, 1, 1,
0.26792, -0.3870296, 3.049772, 0, 0, 0, 1, 1,
0.285339, -0.7944767, 2.49184, 0, 0, 0, 1, 1,
0.2859018, 0.5869725, 1.098358, 1, 1, 1, 1, 1,
0.2862999, -1.810707, 2.373168, 1, 1, 1, 1, 1,
0.2919588, -0.1292159, 3.235666, 1, 1, 1, 1, 1,
0.2956409, -1.01415, 3.73874, 1, 1, 1, 1, 1,
0.2976069, -0.3158998, 0.3865495, 1, 1, 1, 1, 1,
0.3067158, -0.2258998, 2.989002, 1, 1, 1, 1, 1,
0.3077354, 0.6092669, 1.213449, 1, 1, 1, 1, 1,
0.309186, 1.036096, -0.2932025, 1, 1, 1, 1, 1,
0.3107823, -0.9749644, 2.64177, 1, 1, 1, 1, 1,
0.311316, 1.345885, 0.33295, 1, 1, 1, 1, 1,
0.3123459, 1.205745, 0.3408664, 1, 1, 1, 1, 1,
0.3138299, 0.264813, 2.04086, 1, 1, 1, 1, 1,
0.3144125, -3.24199, 2.605793, 1, 1, 1, 1, 1,
0.3188724, 1.180745, 0.2365172, 1, 1, 1, 1, 1,
0.3203518, -2.276641, 2.87025, 1, 1, 1, 1, 1,
0.3253674, 0.8658233, -0.2878132, 0, 0, 1, 1, 1,
0.3284828, 0.02796856, 2.326473, 1, 0, 0, 1, 1,
0.3287575, 0.3803104, -0.4449956, 1, 0, 0, 1, 1,
0.3291588, 0.07742862, 1.740359, 1, 0, 0, 1, 1,
0.3374698, 0.5041083, 1.383169, 1, 0, 0, 1, 1,
0.3401864, -1.239846, 2.834061, 1, 0, 0, 1, 1,
0.3402569, -0.3022565, 2.160347, 0, 0, 0, 1, 1,
0.3450925, -0.1484395, 3.010589, 0, 0, 0, 1, 1,
0.3479624, -0.6933074, 2.898292, 0, 0, 0, 1, 1,
0.3488933, -0.8488821, 1.731687, 0, 0, 0, 1, 1,
0.3498282, 0.500496, 1.192813, 0, 0, 0, 1, 1,
0.3506882, 0.01702168, 0.2567022, 0, 0, 0, 1, 1,
0.354227, -0.08381828, 1.770808, 0, 0, 0, 1, 1,
0.354396, -0.2668087, 0.6080232, 1, 1, 1, 1, 1,
0.357849, -0.3402941, 2.703013, 1, 1, 1, 1, 1,
0.3580015, -0.6563635, 2.465835, 1, 1, 1, 1, 1,
0.3582433, 0.9874859, -0.8077934, 1, 1, 1, 1, 1,
0.3587627, 0.4597251, 1.190728, 1, 1, 1, 1, 1,
0.3652207, 1.857431, -0.06994977, 1, 1, 1, 1, 1,
0.3679423, 0.423423, 1.209486, 1, 1, 1, 1, 1,
0.3685832, -1.264013, 1.295477, 1, 1, 1, 1, 1,
0.3721954, -0.4821107, 2.854356, 1, 1, 1, 1, 1,
0.372224, 0.5915934, 1.245239, 1, 1, 1, 1, 1,
0.3730013, 0.3516526, 0.6145922, 1, 1, 1, 1, 1,
0.3789547, -0.4432328, 2.634416, 1, 1, 1, 1, 1,
0.3851957, -0.4211544, 3.644542, 1, 1, 1, 1, 1,
0.3858034, 0.3426186, 0.8816961, 1, 1, 1, 1, 1,
0.3882378, 0.5483244, -1.123122, 1, 1, 1, 1, 1,
0.3897029, -0.350013, 1.644697, 0, 0, 1, 1, 1,
0.3908299, 0.1691715, 1.116097, 1, 0, 0, 1, 1,
0.3940841, -0.244771, 0.5631005, 1, 0, 0, 1, 1,
0.3945468, -0.739683, 0.8652248, 1, 0, 0, 1, 1,
0.3947012, 0.3758493, 0.5880906, 1, 0, 0, 1, 1,
0.3957559, 0.5019071, 0.2147284, 1, 0, 0, 1, 1,
0.396395, -0.05663006, 1.306233, 0, 0, 0, 1, 1,
0.3968462, -2.391985, 2.799454, 0, 0, 0, 1, 1,
0.3988024, 1.480438, -0.7856974, 0, 0, 0, 1, 1,
0.4040583, 0.8030699, 1.047041, 0, 0, 0, 1, 1,
0.4044869, 0.2987504, -0.1116659, 0, 0, 0, 1, 1,
0.404909, 0.4416722, 1.297417, 0, 0, 0, 1, 1,
0.4069026, 0.8941422, -0.7152005, 0, 0, 0, 1, 1,
0.4071677, 0.1110655, 2.004955, 1, 1, 1, 1, 1,
0.4095067, 1.213293, 1.319527, 1, 1, 1, 1, 1,
0.4125772, 1.382371, 0.4691228, 1, 1, 1, 1, 1,
0.4156899, 0.2924616, 2.096651, 1, 1, 1, 1, 1,
0.4187149, -0.8406371, 1.246349, 1, 1, 1, 1, 1,
0.4299, -0.2475092, 2.185711, 1, 1, 1, 1, 1,
0.4299727, -0.28663, 2.215083, 1, 1, 1, 1, 1,
0.4320648, -2.946252, 4.531914, 1, 1, 1, 1, 1,
0.4332666, -0.4882002, 1.807941, 1, 1, 1, 1, 1,
0.4365944, 0.1969848, 0.4267254, 1, 1, 1, 1, 1,
0.4397539, 2.315049, -0.8243251, 1, 1, 1, 1, 1,
0.4444247, -0.2665656, 0.5464913, 1, 1, 1, 1, 1,
0.4468823, -0.5280411, 1.484563, 1, 1, 1, 1, 1,
0.448191, 0.7894952, 0.9229422, 1, 1, 1, 1, 1,
0.4487672, 0.3873301, 0.7877887, 1, 1, 1, 1, 1,
0.4514865, 0.3817745, 0.6337575, 0, 0, 1, 1, 1,
0.4515411, -0.8601224, 4.00004, 1, 0, 0, 1, 1,
0.455745, -0.007356421, 0.2144908, 1, 0, 0, 1, 1,
0.4560241, 0.744742, 0.64327, 1, 0, 0, 1, 1,
0.4590802, -1.195148, 1.258139, 1, 0, 0, 1, 1,
0.4630331, 1.046642, -0.1904684, 1, 0, 0, 1, 1,
0.4640322, -1.162714, 2.751442, 0, 0, 0, 1, 1,
0.4670131, 1.033341, 1.004586, 0, 0, 0, 1, 1,
0.4716549, -0.143931, 1.292215, 0, 0, 0, 1, 1,
0.4870539, -0.2325063, 1.411609, 0, 0, 0, 1, 1,
0.4981561, -1.449992, 0.4179178, 0, 0, 0, 1, 1,
0.4988845, -1.034807, 3.087505, 0, 0, 0, 1, 1,
0.5050163, -0.8800238, 3.188258, 0, 0, 0, 1, 1,
0.5067966, -0.03410983, 2.895112, 1, 1, 1, 1, 1,
0.5084318, -0.7501084, 1.321792, 1, 1, 1, 1, 1,
0.5100176, -0.8481787, 2.875393, 1, 1, 1, 1, 1,
0.5165602, 0.9487289, 1.736034, 1, 1, 1, 1, 1,
0.5222298, -1.274258, 3.617195, 1, 1, 1, 1, 1,
0.526055, 0.6633868, 1.118733, 1, 1, 1, 1, 1,
0.5272374, -0.9120688, 0.8298332, 1, 1, 1, 1, 1,
0.5309308, -0.16877, 0.2730079, 1, 1, 1, 1, 1,
0.5330142, -2.045311, 4.215425, 1, 1, 1, 1, 1,
0.5338131, -0.9849072, 1.833427, 1, 1, 1, 1, 1,
0.5347654, -1.177137, 2.818624, 1, 1, 1, 1, 1,
0.5356642, -0.5979752, 2.251065, 1, 1, 1, 1, 1,
0.537595, -1.830652, 4.755104, 1, 1, 1, 1, 1,
0.5389412, 0.5913618, 1.053857, 1, 1, 1, 1, 1,
0.5393634, -0.4199277, 2.369514, 1, 1, 1, 1, 1,
0.540551, -0.8091443, 3.834729, 0, 0, 1, 1, 1,
0.5407191, 0.3488867, 1.583324, 1, 0, 0, 1, 1,
0.5435236, -0.7193189, 1.891023, 1, 0, 0, 1, 1,
0.5442805, 0.5631487, 2.243657, 1, 0, 0, 1, 1,
0.5450276, 1.617937, 1.653122, 1, 0, 0, 1, 1,
0.5547204, 1.093558, -1.31656, 1, 0, 0, 1, 1,
0.5553684, 1.556608, -0.7451877, 0, 0, 0, 1, 1,
0.5605754, 0.5340078, 0.5341248, 0, 0, 0, 1, 1,
0.5606584, -1.641057, 4.012897, 0, 0, 0, 1, 1,
0.5607286, 1.952461, -1.418983, 0, 0, 0, 1, 1,
0.571457, -0.6176295, 3.456682, 0, 0, 0, 1, 1,
0.5741609, -1.298349, 1.993975, 0, 0, 0, 1, 1,
0.5786363, -0.9087238, 1.947909, 0, 0, 0, 1, 1,
0.5820569, 0.2246534, 2.716109, 1, 1, 1, 1, 1,
0.585127, 0.7507722, -0.6217291, 1, 1, 1, 1, 1,
0.5854105, -0.4545124, 1.551666, 1, 1, 1, 1, 1,
0.5935402, -0.7125868, 2.332787, 1, 1, 1, 1, 1,
0.5939115, -0.07811701, 2.377827, 1, 1, 1, 1, 1,
0.5942674, 1.832619, -0.858411, 1, 1, 1, 1, 1,
0.5952185, 1.17545, -0.2151267, 1, 1, 1, 1, 1,
0.5961859, -0.9121754, 3.114553, 1, 1, 1, 1, 1,
0.5970588, -0.07515909, 3.797149, 1, 1, 1, 1, 1,
0.5984986, -0.466226, 3.111643, 1, 1, 1, 1, 1,
0.5992765, -0.681325, 2.96406, 1, 1, 1, 1, 1,
0.602488, -0.5582039, 3.379244, 1, 1, 1, 1, 1,
0.6071926, -0.3907254, 1.189314, 1, 1, 1, 1, 1,
0.6113377, 1.317861, 0.1863602, 1, 1, 1, 1, 1,
0.6148095, 0.24655, 0.07590386, 1, 1, 1, 1, 1,
0.6151549, 2.663253, 0.06521535, 0, 0, 1, 1, 1,
0.6191488, -1.142099, 1.939189, 1, 0, 0, 1, 1,
0.6214693, -0.07989518, 3.410043, 1, 0, 0, 1, 1,
0.621905, 0.471822, 0.6720846, 1, 0, 0, 1, 1,
0.6234365, -0.007446751, 1.473986, 1, 0, 0, 1, 1,
0.6271568, 0.5756353, 0.6456093, 1, 0, 0, 1, 1,
0.6275009, 0.7963328, 0.261198, 0, 0, 0, 1, 1,
0.6282341, 0.179369, -0.6056054, 0, 0, 0, 1, 1,
0.6308106, 0.8328909, 1.664904, 0, 0, 0, 1, 1,
0.6321122, 2.479302, -0.7632926, 0, 0, 0, 1, 1,
0.6328019, 0.5735677, 0.600312, 0, 0, 0, 1, 1,
0.6377852, -0.3126823, 3.363575, 0, 0, 0, 1, 1,
0.6387343, 0.6590035, 0.6151246, 0, 0, 0, 1, 1,
0.6398094, 2.240048, 0.4532141, 1, 1, 1, 1, 1,
0.644505, -0.4761845, 3.019113, 1, 1, 1, 1, 1,
0.6502169, 0.171808, 1.021155, 1, 1, 1, 1, 1,
0.6534272, -2.007061, 4.171084, 1, 1, 1, 1, 1,
0.6555067, -1.358651, 3.095879, 1, 1, 1, 1, 1,
0.6579403, 1.511865, 0.2198984, 1, 1, 1, 1, 1,
0.6579747, 0.8995769, 2.29421, 1, 1, 1, 1, 1,
0.6589989, -0.579928, 3.920877, 1, 1, 1, 1, 1,
0.6673726, -0.8509188, 2.901288, 1, 1, 1, 1, 1,
0.6710805, 0.6718069, 1.906989, 1, 1, 1, 1, 1,
0.6762174, -0.7200378, 2.773319, 1, 1, 1, 1, 1,
0.6797872, 0.9261774, 0.04538026, 1, 1, 1, 1, 1,
0.6822451, 1.406958, -1.94698, 1, 1, 1, 1, 1,
0.6838374, -0.3337837, 0.8318048, 1, 1, 1, 1, 1,
0.6848235, 0.838523, 0.5712425, 1, 1, 1, 1, 1,
0.6904352, -1.844218, 2.422066, 0, 0, 1, 1, 1,
0.6979339, 0.613043, 0.4285695, 1, 0, 0, 1, 1,
0.701437, 0.3573216, -1.267034, 1, 0, 0, 1, 1,
0.7034036, 0.2055568, 0.1564723, 1, 0, 0, 1, 1,
0.7076169, -0.836189, 3.402074, 1, 0, 0, 1, 1,
0.7113366, 0.9284137, 1.939531, 1, 0, 0, 1, 1,
0.7294073, -0.575002, 3.482436, 0, 0, 0, 1, 1,
0.7326797, 0.09789427, 3.052394, 0, 0, 0, 1, 1,
0.7373426, -1.857723, 3.934102, 0, 0, 0, 1, 1,
0.7417293, -0.1300922, 0.8460137, 0, 0, 0, 1, 1,
0.74572, 0.4422357, 1.800371, 0, 0, 0, 1, 1,
0.748437, 0.7029779, 1.791046, 0, 0, 0, 1, 1,
0.7486597, 1.716391, 1.629921, 0, 0, 0, 1, 1,
0.7503487, 0.04068885, 0.8827074, 1, 1, 1, 1, 1,
0.7654675, -1.468028, 1.849306, 1, 1, 1, 1, 1,
0.7786313, -0.3949626, 2.202796, 1, 1, 1, 1, 1,
0.7891139, 0.4283404, 0.3943829, 1, 1, 1, 1, 1,
0.7924834, 1.410564, -1.113901, 1, 1, 1, 1, 1,
0.7949313, 0.1847587, 2.154156, 1, 1, 1, 1, 1,
0.7983119, 0.02384144, 1.434283, 1, 1, 1, 1, 1,
0.8049495, -0.4439475, 2.768514, 1, 1, 1, 1, 1,
0.8060589, 0.5667323, 1.747809, 1, 1, 1, 1, 1,
0.8094858, -0.6788213, 1.624471, 1, 1, 1, 1, 1,
0.8114241, -0.8025549, 1.621698, 1, 1, 1, 1, 1,
0.8128942, -0.1038618, 2.564428, 1, 1, 1, 1, 1,
0.8138022, -1.977652, 2.16393, 1, 1, 1, 1, 1,
0.8143196, 0.4309229, 0.0640077, 1, 1, 1, 1, 1,
0.8311192, 1.056635, 1.246397, 1, 1, 1, 1, 1,
0.8311613, -0.8896519, 0.7404875, 0, 0, 1, 1, 1,
0.8347493, -0.4886352, 2.909464, 1, 0, 0, 1, 1,
0.8353803, 0.5389116, 0.009384315, 1, 0, 0, 1, 1,
0.8391761, -0.2806644, 3.853551, 1, 0, 0, 1, 1,
0.8438107, 2.026394, -0.1084926, 1, 0, 0, 1, 1,
0.8452361, 0.4715403, 1.974722, 1, 0, 0, 1, 1,
0.8455344, 0.06523862, 2.096313, 0, 0, 0, 1, 1,
0.846899, 0.1589701, 0.8140099, 0, 0, 0, 1, 1,
0.8546402, -0.2593721, 0.2051016, 0, 0, 0, 1, 1,
0.8577043, 0.9406025, -0.7842865, 0, 0, 0, 1, 1,
0.8617769, -0.05073553, 2.235692, 0, 0, 0, 1, 1,
0.8633545, -1.893199, 1.420824, 0, 0, 0, 1, 1,
0.8693507, 0.9660141, 0.3204399, 0, 0, 0, 1, 1,
0.8730221, -1.174864, 3.155946, 1, 1, 1, 1, 1,
0.8733789, -1.623366, 0.9283068, 1, 1, 1, 1, 1,
0.8845051, -0.3549131, 2.556408, 1, 1, 1, 1, 1,
0.8886377, 0.32039, 0.2935396, 1, 1, 1, 1, 1,
0.889484, -0.333901, 3.151389, 1, 1, 1, 1, 1,
0.8979083, -0.1238598, 0.4013681, 1, 1, 1, 1, 1,
0.9049336, -1.370902, 2.039574, 1, 1, 1, 1, 1,
0.9109917, -1.593603, 1.795001, 1, 1, 1, 1, 1,
0.9147893, -0.07499336, 0.003834844, 1, 1, 1, 1, 1,
0.917982, 0.397862, 1.034164, 1, 1, 1, 1, 1,
0.9279943, 2.147074, -0.6762831, 1, 1, 1, 1, 1,
0.930536, -0.7068161, 1.86793, 1, 1, 1, 1, 1,
0.941215, -0.6210729, 2.410422, 1, 1, 1, 1, 1,
0.9463037, -0.9657401, 1.737623, 1, 1, 1, 1, 1,
0.9466913, -0.6908151, 1.603441, 1, 1, 1, 1, 1,
0.9484815, 0.2253836, 1.675149, 0, 0, 1, 1, 1,
0.9493726, -1.824371, 1.778724, 1, 0, 0, 1, 1,
0.9540759, -0.9045219, 3.349026, 1, 0, 0, 1, 1,
0.9569805, -1.528089, 2.828734, 1, 0, 0, 1, 1,
0.9596497, 0.2257858, 0.6911409, 1, 0, 0, 1, 1,
0.9624824, -0.1743851, 1.764635, 1, 0, 0, 1, 1,
0.964659, -0.272191, 1.31366, 0, 0, 0, 1, 1,
0.9654386, 0.05135435, 3.81767, 0, 0, 0, 1, 1,
0.973961, 0.2950734, -0.2380029, 0, 0, 0, 1, 1,
0.975165, 1.378139, -0.3895662, 0, 0, 0, 1, 1,
0.9762781, -0.5835358, 1.965497, 0, 0, 0, 1, 1,
0.990047, 0.7585528, 1.19169, 0, 0, 0, 1, 1,
0.9963958, -0.4937088, 1.845909, 0, 0, 0, 1, 1,
1.005248, -0.2711135, 2.219305, 1, 1, 1, 1, 1,
1.006667, 0.9661302, 0.09281195, 1, 1, 1, 1, 1,
1.010438, -0.2988397, 2.744701, 1, 1, 1, 1, 1,
1.026178, 0.6678019, 1.125593, 1, 1, 1, 1, 1,
1.053099, 2.098473, 1.414614, 1, 1, 1, 1, 1,
1.061542, 1.095427, 0.9480959, 1, 1, 1, 1, 1,
1.065461, -0.09963747, 2.46887, 1, 1, 1, 1, 1,
1.066928, 0.1771013, 1.374728, 1, 1, 1, 1, 1,
1.067131, -2.045856, 3.065474, 1, 1, 1, 1, 1,
1.074779, 0.3908723, 1.296203, 1, 1, 1, 1, 1,
1.07999, 0.6708497, 0.828328, 1, 1, 1, 1, 1,
1.081237, -1.166848, 2.083333, 1, 1, 1, 1, 1,
1.08201, 1.390959, 1.972715, 1, 1, 1, 1, 1,
1.084738, 0.2257944, 0.8832372, 1, 1, 1, 1, 1,
1.08661, -1.709721, 2.133234, 1, 1, 1, 1, 1,
1.087657, -1.660927, 4.02722, 0, 0, 1, 1, 1,
1.08779, 0.5214465, -0.01700384, 1, 0, 0, 1, 1,
1.102939, 0.003373477, 2.875342, 1, 0, 0, 1, 1,
1.103396, 1.168898, 0.3083622, 1, 0, 0, 1, 1,
1.105052, -1.935491, 2.694756, 1, 0, 0, 1, 1,
1.119594, 0.3482219, 0.01131966, 1, 0, 0, 1, 1,
1.121556, -0.426109, 0.9912741, 0, 0, 0, 1, 1,
1.127157, 1.324644, 1.116766, 0, 0, 0, 1, 1,
1.133249, 0.4522092, 1.065575, 0, 0, 0, 1, 1,
1.136559, 1.71478, -0.7878226, 0, 0, 0, 1, 1,
1.139773, 0.2454901, -0.489379, 0, 0, 0, 1, 1,
1.14087, -0.1659727, 1.873929, 0, 0, 0, 1, 1,
1.145694, -0.2406981, 3.287481, 0, 0, 0, 1, 1,
1.148945, 0.09403374, 0.2044181, 1, 1, 1, 1, 1,
1.154527, 0.5296174, 0.8576348, 1, 1, 1, 1, 1,
1.164021, -0.8567075, 1.322509, 1, 1, 1, 1, 1,
1.16801, -1.313177, 0.5800101, 1, 1, 1, 1, 1,
1.168442, 0.7879456, -0.5321765, 1, 1, 1, 1, 1,
1.169071, -1.11154, 3.615201, 1, 1, 1, 1, 1,
1.178695, 0.3920318, 0.900305, 1, 1, 1, 1, 1,
1.186863, -1.318432, 2.851063, 1, 1, 1, 1, 1,
1.191004, 0.2414964, 3.604047, 1, 1, 1, 1, 1,
1.199327, 1.586537, 0.3287123, 1, 1, 1, 1, 1,
1.207789, -2.553139, 1.918587, 1, 1, 1, 1, 1,
1.217092, 0.8888853, 0.09778982, 1, 1, 1, 1, 1,
1.21919, -0.1375298, 0.4860518, 1, 1, 1, 1, 1,
1.222578, -1.985945, 1.860501, 1, 1, 1, 1, 1,
1.225749, -0.5151255, 1.652027, 1, 1, 1, 1, 1,
1.229739, -0.3857787, 2.284105, 0, 0, 1, 1, 1,
1.239535, 1.20166, 0.9293568, 1, 0, 0, 1, 1,
1.244393, 1.422355, 0.7685912, 1, 0, 0, 1, 1,
1.250176, -0.2530284, 0.9076139, 1, 0, 0, 1, 1,
1.261579, 1.240741, 0.3738834, 1, 0, 0, 1, 1,
1.261904, 0.2777674, 2.103262, 1, 0, 0, 1, 1,
1.277692, 0.6352734, 1.275549, 0, 0, 0, 1, 1,
1.279492, -1.452993, 1.921863, 0, 0, 0, 1, 1,
1.28089, -0.6458975, 3.315175, 0, 0, 0, 1, 1,
1.290914, 0.355868, 2.611352, 0, 0, 0, 1, 1,
1.296848, 0.4660323, 1.528051, 0, 0, 0, 1, 1,
1.298165, 1.112845, 2.68803, 0, 0, 0, 1, 1,
1.299321, 0.9408187, 1.095603, 0, 0, 0, 1, 1,
1.301638, -0.3565669, 1.782794, 1, 1, 1, 1, 1,
1.307296, -0.5658553, 0.5819046, 1, 1, 1, 1, 1,
1.31367, -0.5353784, 1.874756, 1, 1, 1, 1, 1,
1.319328, 0.4842753, 0.8532976, 1, 1, 1, 1, 1,
1.320259, -1.349434, 3.296401, 1, 1, 1, 1, 1,
1.331267, 1.694051, 0.578227, 1, 1, 1, 1, 1,
1.339378, -0.2925479, 0.6526496, 1, 1, 1, 1, 1,
1.345022, -0.2736488, 0.7939881, 1, 1, 1, 1, 1,
1.352357, 0.2269234, -0.07354409, 1, 1, 1, 1, 1,
1.365337, -0.2265681, 1.661851, 1, 1, 1, 1, 1,
1.384676, 0.4883302, 0.1189225, 1, 1, 1, 1, 1,
1.386901, 0.380875, 2.830516, 1, 1, 1, 1, 1,
1.388619, -1.345067, 2.418831, 1, 1, 1, 1, 1,
1.391065, -0.2678599, 1.494384, 1, 1, 1, 1, 1,
1.391474, 2.096444, 0.2021039, 1, 1, 1, 1, 1,
1.398237, 1.004853, 1.715122, 0, 0, 1, 1, 1,
1.424951, 0.1328405, 2.18168, 1, 0, 0, 1, 1,
1.426939, -0.7165926, 2.622801, 1, 0, 0, 1, 1,
1.434994, 0.9155002, 1.065336, 1, 0, 0, 1, 1,
1.439186, 0.155204, 3.190417, 1, 0, 0, 1, 1,
1.443682, 0.4131549, 0.7754151, 1, 0, 0, 1, 1,
1.450016, -1.791971, 3.279302, 0, 0, 0, 1, 1,
1.467735, -2.257333, 1.853365, 0, 0, 0, 1, 1,
1.475288, 0.8371537, 0.8068082, 0, 0, 0, 1, 1,
1.478962, -1.873829, 3.668513, 0, 0, 0, 1, 1,
1.481458, -0.2393888, 2.821615, 0, 0, 0, 1, 1,
1.483364, -1.822623, 0.718513, 0, 0, 0, 1, 1,
1.502982, -0.8123095, 3.081253, 0, 0, 0, 1, 1,
1.508031, -0.2217837, 1.736088, 1, 1, 1, 1, 1,
1.516274, 0.913604, 0.1136018, 1, 1, 1, 1, 1,
1.518522, 0.9900146, 2.862967, 1, 1, 1, 1, 1,
1.525435, -0.8806792, 3.511863, 1, 1, 1, 1, 1,
1.536922, -0.05050777, 1.753663, 1, 1, 1, 1, 1,
1.540846, 0.5197209, 0.7692022, 1, 1, 1, 1, 1,
1.573278, -0.4167861, 3.204396, 1, 1, 1, 1, 1,
1.577543, -1.525405, 1.914793, 1, 1, 1, 1, 1,
1.607955, 0.1209118, 1.177541, 1, 1, 1, 1, 1,
1.638925, -1.850743, 3.634722, 1, 1, 1, 1, 1,
1.639848, 0.6052682, 0.9330054, 1, 1, 1, 1, 1,
1.641796, -1.676973, 3.479576, 1, 1, 1, 1, 1,
1.663032, 0.1859783, 0.3967838, 1, 1, 1, 1, 1,
1.663351, -0.6700029, 1.614622, 1, 1, 1, 1, 1,
1.674588, -0.716202, 1.77256, 1, 1, 1, 1, 1,
1.676037, 0.03477113, -0.3294531, 0, 0, 1, 1, 1,
1.706007, 0.5620553, 0.9415317, 1, 0, 0, 1, 1,
1.706552, -1.521194, 3.590979, 1, 0, 0, 1, 1,
1.713372, -0.650516, 3.30377, 1, 0, 0, 1, 1,
1.720872, 0.1740597, 2.238916, 1, 0, 0, 1, 1,
1.790384, -0.3263482, 0.971139, 1, 0, 0, 1, 1,
1.799354, 1.556666, 1.764479, 0, 0, 0, 1, 1,
1.827592, -0.2546265, 0.262143, 0, 0, 0, 1, 1,
1.853857, -1.01153, 2.083143, 0, 0, 0, 1, 1,
1.870298, 0.659045, 1.36505, 0, 0, 0, 1, 1,
1.902413, 1.711348, 0.7385358, 0, 0, 0, 1, 1,
1.905354, -0.03044436, 1.827436, 0, 0, 0, 1, 1,
1.937025, 2.415397, 1.355412, 0, 0, 0, 1, 1,
1.949195, -0.2552606, 0.7197979, 1, 1, 1, 1, 1,
1.952575, -1.171961, 2.075554, 1, 1, 1, 1, 1,
1.970999, 0.3558217, 1.579865, 1, 1, 1, 1, 1,
1.973267, -1.706787, 0.4900632, 1, 1, 1, 1, 1,
1.976227, -0.5796407, 1.526399, 1, 1, 1, 1, 1,
1.982004, -1.151241, 2.153765, 1, 1, 1, 1, 1,
1.998354, 1.192371, 2.579304, 1, 1, 1, 1, 1,
1.999493, 0.7476476, 2.109063, 1, 1, 1, 1, 1,
2.006022, -0.02877911, 2.637254, 1, 1, 1, 1, 1,
2.100135, -0.7368273, 1.769279, 1, 1, 1, 1, 1,
2.109549, -1.490647, 0.963452, 1, 1, 1, 1, 1,
2.112845, 0.4601616, 1.64298, 1, 1, 1, 1, 1,
2.12985, 0.3578233, 1.062357, 1, 1, 1, 1, 1,
2.141577, 0.01689015, 1.973813, 1, 1, 1, 1, 1,
2.144891, -1.322821, 1.826564, 1, 1, 1, 1, 1,
2.149083, 1.511105, 1.8293, 0, 0, 1, 1, 1,
2.153428, -2.04974, 2.623226, 1, 0, 0, 1, 1,
2.212651, -0.7809474, 1.287877, 1, 0, 0, 1, 1,
2.215998, -0.6550756, 1.872804, 1, 0, 0, 1, 1,
2.22805, -2.095178, 0.6531324, 1, 0, 0, 1, 1,
2.243891, 1.420194, 1.787021, 1, 0, 0, 1, 1,
2.254418, 0.1582166, 3.976418, 0, 0, 0, 1, 1,
2.334719, -0.6588112, 0.985236, 0, 0, 0, 1, 1,
2.340808, 0.5858325, 0.3166787, 0, 0, 0, 1, 1,
2.390876, 1.383057, 0.003865268, 0, 0, 0, 1, 1,
2.564314, -1.033809, 1.986283, 0, 0, 0, 1, 1,
2.662879, -1.423853, 1.763156, 0, 0, 0, 1, 1,
2.700344, -0.1324725, 2.118412, 0, 0, 0, 1, 1,
2.776328, -1.475375, 3.11208, 1, 1, 1, 1, 1,
2.788437, 1.413964, 0.8889923, 1, 1, 1, 1, 1,
2.869024, -0.161069, 2.079868, 1, 1, 1, 1, 1,
2.970076, 1.196762, 1.363674, 1, 1, 1, 1, 1,
3.206696, -0.006087033, 0.6937606, 1, 1, 1, 1, 1,
3.265602, -1.505821, 3.542118, 1, 1, 1, 1, 1,
3.601588, 0.08971273, 1.161805, 1, 1, 1, 1, 1
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
var radius = 10.18091;
var distance = 35.76002;
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
mvMatrix.translate( 0.2358949, -0.1349211, 0.1399312 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.76002);
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
