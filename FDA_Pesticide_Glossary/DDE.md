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
-2.668715, 0.93958, -0.2458665, 1, 0, 0, 1,
-2.584732, 1.3093, -3.471754, 1, 0.007843138, 0, 1,
-2.489702, -2.221393, -2.502269, 1, 0.01176471, 0, 1,
-2.34601, -0.01301748, -2.004496, 1, 0.01960784, 0, 1,
-2.327961, 2.729932, -0.298698, 1, 0.02352941, 0, 1,
-2.313634, 1.35686, -1.875207, 1, 0.03137255, 0, 1,
-2.276812, -2.075705, -0.5536549, 1, 0.03529412, 0, 1,
-2.231803, -0.1674079, -1.905805, 1, 0.04313726, 0, 1,
-2.224552, -1.141253, -1.668193, 1, 0.04705882, 0, 1,
-2.186485, 1.456622, 0.1127108, 1, 0.05490196, 0, 1,
-2.107539, -1.906782, -3.105422, 1, 0.05882353, 0, 1,
-2.082371, 0.007710304, -2.044443, 1, 0.06666667, 0, 1,
-2.067996, -1.031607, -2.538331, 1, 0.07058824, 0, 1,
-2.065414, 2.054891, -2.878736, 1, 0.07843138, 0, 1,
-2.051239, 1.624176, -1.790321, 1, 0.08235294, 0, 1,
-2.042994, 0.9653355, -1.031531, 1, 0.09019608, 0, 1,
-2.03597, 0.1954798, -0.09117644, 1, 0.09411765, 0, 1,
-2.011977, 0.01714991, -0.2439895, 1, 0.1019608, 0, 1,
-1.999023, 0.4594108, -0.2567517, 1, 0.1098039, 0, 1,
-1.987038, -0.4062692, -2.851606, 1, 0.1137255, 0, 1,
-1.985278, -1.378423, -2.633021, 1, 0.1215686, 0, 1,
-1.969235, -0.06737417, -1.848723, 1, 0.1254902, 0, 1,
-1.945643, 0.2241646, -1.240005, 1, 0.1333333, 0, 1,
-1.940294, 1.341669, -0.3129848, 1, 0.1372549, 0, 1,
-1.920582, -1.560868, -2.433595, 1, 0.145098, 0, 1,
-1.900932, 0.9693239, -0.8806279, 1, 0.1490196, 0, 1,
-1.872936, 0.2954634, -0.8551528, 1, 0.1568628, 0, 1,
-1.871695, 0.8706888, -1.408373, 1, 0.1607843, 0, 1,
-1.856746, 1.0891, 0.3761487, 1, 0.1686275, 0, 1,
-1.849701, 0.914575, -0.06782463, 1, 0.172549, 0, 1,
-1.834986, -0.04411397, -1.373615, 1, 0.1803922, 0, 1,
-1.834343, 0.1775322, -1.084332, 1, 0.1843137, 0, 1,
-1.833898, -0.8758807, -2.854497, 1, 0.1921569, 0, 1,
-1.831319, -2.000928, -2.708863, 1, 0.1960784, 0, 1,
-1.830443, 0.293849, -1.378318, 1, 0.2039216, 0, 1,
-1.827034, -0.7083223, -2.514292, 1, 0.2117647, 0, 1,
-1.803991, 0.7048637, -0.2217861, 1, 0.2156863, 0, 1,
-1.796399, 1.050241, 0.8129867, 1, 0.2235294, 0, 1,
-1.794511, -0.9697148, -0.6925735, 1, 0.227451, 0, 1,
-1.790241, 2.365983, -0.9513915, 1, 0.2352941, 0, 1,
-1.760754, 0.7220117, 1.068786, 1, 0.2392157, 0, 1,
-1.749131, -1.658839, -2.536726, 1, 0.2470588, 0, 1,
-1.74867, -0.01852961, -2.16058, 1, 0.2509804, 0, 1,
-1.744827, -0.7840002, -0.4390177, 1, 0.2588235, 0, 1,
-1.738574, 0.8038218, -2.144881, 1, 0.2627451, 0, 1,
-1.735903, 0.002608314, -2.973796, 1, 0.2705882, 0, 1,
-1.727569, 0.5670272, -2.31828, 1, 0.2745098, 0, 1,
-1.725536, -0.9793036, -3.803927, 1, 0.282353, 0, 1,
-1.711924, -0.5463497, -2.065338, 1, 0.2862745, 0, 1,
-1.703142, -0.003026857, -0.4460053, 1, 0.2941177, 0, 1,
-1.69833, 0.7317804, -2.20331, 1, 0.3019608, 0, 1,
-1.697757, 0.06573714, -3.214959, 1, 0.3058824, 0, 1,
-1.697371, 0.3679412, -1.022266, 1, 0.3137255, 0, 1,
-1.656505, 0.4998376, -3.080397, 1, 0.3176471, 0, 1,
-1.643401, 0.3085529, -1.240041, 1, 0.3254902, 0, 1,
-1.636051, -0.5470161, -1.502008, 1, 0.3294118, 0, 1,
-1.6305, 0.8670591, -2.495766, 1, 0.3372549, 0, 1,
-1.609753, 0.6089994, -2.074501, 1, 0.3411765, 0, 1,
-1.596747, -1.81618, -3.439478, 1, 0.3490196, 0, 1,
-1.591003, 1.384978, -1.098962, 1, 0.3529412, 0, 1,
-1.582, 1.122958, -1.520534, 1, 0.3607843, 0, 1,
-1.557584, -0.8299235, -4.251681, 1, 0.3647059, 0, 1,
-1.545347, 2.297556, -0.5453234, 1, 0.372549, 0, 1,
-1.519942, 0.5108449, -0.7478098, 1, 0.3764706, 0, 1,
-1.512871, -0.911445, -3.51639, 1, 0.3843137, 0, 1,
-1.49834, -0.793216, -1.866439, 1, 0.3882353, 0, 1,
-1.488187, 2.445966, 0.9063249, 1, 0.3960784, 0, 1,
-1.485143, -1.383117, -2.577706, 1, 0.4039216, 0, 1,
-1.484087, -1.301101, -2.291209, 1, 0.4078431, 0, 1,
-1.482535, -1.110265, -1.072587, 1, 0.4156863, 0, 1,
-1.482373, -0.3482947, 0.2316777, 1, 0.4196078, 0, 1,
-1.472534, 0.1151168, -0.6913959, 1, 0.427451, 0, 1,
-1.466072, 1.465145, 0.9534842, 1, 0.4313726, 0, 1,
-1.455632, -1.398863, -2.675193, 1, 0.4392157, 0, 1,
-1.453415, -1.22233, -2.176156, 1, 0.4431373, 0, 1,
-1.44976, -0.6958356, -2.576339, 1, 0.4509804, 0, 1,
-1.444584, -0.3110168, -1.529743, 1, 0.454902, 0, 1,
-1.443332, -0.9742486, 0.8678319, 1, 0.4627451, 0, 1,
-1.44038, -0.8623685, -2.18423, 1, 0.4666667, 0, 1,
-1.439296, -0.9989484, -1.879515, 1, 0.4745098, 0, 1,
-1.430166, 0.6556337, -0.3134831, 1, 0.4784314, 0, 1,
-1.427988, -0.5575463, -1.603047, 1, 0.4862745, 0, 1,
-1.422482, 0.411332, -2.818568, 1, 0.4901961, 0, 1,
-1.422231, -0.5960214, -2.019814, 1, 0.4980392, 0, 1,
-1.412382, -2.586749, -3.239187, 1, 0.5058824, 0, 1,
-1.4113, -0.8104108, -0.7431312, 1, 0.509804, 0, 1,
-1.410217, 1.671244, 0.2366359, 1, 0.5176471, 0, 1,
-1.409334, 1.407209, -1.564628, 1, 0.5215687, 0, 1,
-1.398503, -0.6394757, -0.9619683, 1, 0.5294118, 0, 1,
-1.377215, 0.7422738, -0.2866401, 1, 0.5333334, 0, 1,
-1.351486, 1.340045, -1.34838, 1, 0.5411765, 0, 1,
-1.346131, 1.486962, -2.136351, 1, 0.5450981, 0, 1,
-1.345397, 0.5074027, -0.5867856, 1, 0.5529412, 0, 1,
-1.343299, -0.003435225, -1.204931, 1, 0.5568628, 0, 1,
-1.343207, -0.6876802, -3.776623, 1, 0.5647059, 0, 1,
-1.335694, 0.4353265, -1.700426, 1, 0.5686275, 0, 1,
-1.325678, 0.986922, -0.4792942, 1, 0.5764706, 0, 1,
-1.321958, -2.155723, -2.992016, 1, 0.5803922, 0, 1,
-1.320429, 0.0129081, 0.05879671, 1, 0.5882353, 0, 1,
-1.306741, 1.054041, -0.5105791, 1, 0.5921569, 0, 1,
-1.296284, -0.5189606, -4.445585, 1, 0.6, 0, 1,
-1.29357, -0.8035262, 0.1105814, 1, 0.6078432, 0, 1,
-1.290096, 1.891225, 0.2915489, 1, 0.6117647, 0, 1,
-1.286302, 1.361549, -2.04088, 1, 0.6196079, 0, 1,
-1.282339, 0.1487089, -1.714084, 1, 0.6235294, 0, 1,
-1.274006, 1.349125, 0.3095048, 1, 0.6313726, 0, 1,
-1.273117, 0.5603426, 0.4751836, 1, 0.6352941, 0, 1,
-1.26521, 0.01453404, -1.30306, 1, 0.6431373, 0, 1,
-1.257856, 0.4407537, -1.500217, 1, 0.6470588, 0, 1,
-1.247895, 0.2428331, 0.1299294, 1, 0.654902, 0, 1,
-1.243109, 0.7273939, -2.750304, 1, 0.6588235, 0, 1,
-1.232425, -0.1197798, 0.7253504, 1, 0.6666667, 0, 1,
-1.230759, 0.2714225, -0.647894, 1, 0.6705883, 0, 1,
-1.230676, 0.6211969, -0.00705765, 1, 0.6784314, 0, 1,
-1.225058, -0.5854667, -3.253831, 1, 0.682353, 0, 1,
-1.222305, 1.612313, -1.575652, 1, 0.6901961, 0, 1,
-1.214238, -1.948878, -2.369628, 1, 0.6941177, 0, 1,
-1.204444, 1.590669, -0.4919568, 1, 0.7019608, 0, 1,
-1.204364, -0.8165402, -1.635622, 1, 0.7098039, 0, 1,
-1.201466, -0.1738577, -3.091504, 1, 0.7137255, 0, 1,
-1.197958, -0.8473731, -0.1941688, 1, 0.7215686, 0, 1,
-1.191625, 0.3002315, -1.855664, 1, 0.7254902, 0, 1,
-1.18449, 0.2652171, -0.4702858, 1, 0.7333333, 0, 1,
-1.166104, -0.7932155, -1.92676, 1, 0.7372549, 0, 1,
-1.161357, -2.025345, -4.131389, 1, 0.7450981, 0, 1,
-1.159931, 0.01229471, -1.645157, 1, 0.7490196, 0, 1,
-1.154012, 0.8390566, 0.4875793, 1, 0.7568628, 0, 1,
-1.14363, 0.05401351, -1.133604, 1, 0.7607843, 0, 1,
-1.141311, -1.078814, -2.64276, 1, 0.7686275, 0, 1,
-1.136469, 1.488725, -1.853401, 1, 0.772549, 0, 1,
-1.134977, -1.231211, -2.234868, 1, 0.7803922, 0, 1,
-1.134737, -1.015067, -3.651364, 1, 0.7843137, 0, 1,
-1.119344, -0.09691183, -2.895609, 1, 0.7921569, 0, 1,
-1.112593, 0.6211245, -0.4880504, 1, 0.7960784, 0, 1,
-1.110872, -0.4541804, -1.174773, 1, 0.8039216, 0, 1,
-1.108387, 0.1682381, 0.2839682, 1, 0.8117647, 0, 1,
-1.101505, -0.4103537, -2.377567, 1, 0.8156863, 0, 1,
-1.097244, -0.7056394, -2.125598, 1, 0.8235294, 0, 1,
-1.082684, -0.07998913, -0.5599273, 1, 0.827451, 0, 1,
-1.080585, -0.3914748, -1.315828, 1, 0.8352941, 0, 1,
-1.078742, 0.694238, -1.243408, 1, 0.8392157, 0, 1,
-1.078525, -0.04992222, -1.334185, 1, 0.8470588, 0, 1,
-1.077618, -0.7695938, -2.226515, 1, 0.8509804, 0, 1,
-1.07733, -1.885967, -1.912212, 1, 0.8588235, 0, 1,
-1.075242, 0.3038993, -1.382608, 1, 0.8627451, 0, 1,
-1.073634, 0.9848844, 0.1539128, 1, 0.8705882, 0, 1,
-1.068311, -0.9812352, -1.170603, 1, 0.8745098, 0, 1,
-1.066788, 1.180276, -0.8052318, 1, 0.8823529, 0, 1,
-1.066386, -1.095456, -1.261091, 1, 0.8862745, 0, 1,
-1.051622, -0.5747445, -0.2065724, 1, 0.8941177, 0, 1,
-1.049196, 1.486983, 0.2603271, 1, 0.8980392, 0, 1,
-1.044922, 0.3153722, 0.3637267, 1, 0.9058824, 0, 1,
-1.042791, 1.580824, -0.316797, 1, 0.9137255, 0, 1,
-1.041818, -0.132196, -2.608418, 1, 0.9176471, 0, 1,
-1.040357, -0.06591627, -0.1031235, 1, 0.9254902, 0, 1,
-1.032876, 0.3831697, -1.313605, 1, 0.9294118, 0, 1,
-1.02036, 0.2024851, -0.2944838, 1, 0.9372549, 0, 1,
-1.017594, 1.5292, 0.8189358, 1, 0.9411765, 0, 1,
-1.017458, 0.1276671, -1.202551, 1, 0.9490196, 0, 1,
-1.008917, 0.09620114, 0.1254663, 1, 0.9529412, 0, 1,
-1.001901, 0.5650646, -1.203023, 1, 0.9607843, 0, 1,
-0.9977925, -0.03354815, -1.565718, 1, 0.9647059, 0, 1,
-0.9933315, 2.13256, -2.48235, 1, 0.972549, 0, 1,
-0.9932139, 1.424828, -0.5113294, 1, 0.9764706, 0, 1,
-0.9924001, 1.52969, -1.501632, 1, 0.9843137, 0, 1,
-0.9906595, 0.2294047, -0.5744838, 1, 0.9882353, 0, 1,
-0.9869582, 1.370459, 0.3401992, 1, 0.9960784, 0, 1,
-0.9866574, -1.628682, -3.069292, 0.9960784, 1, 0, 1,
-0.9810849, -2.545403, -4.005595, 0.9921569, 1, 0, 1,
-0.9799663, 1.302313, -2.993456, 0.9843137, 1, 0, 1,
-0.9746131, 0.3768066, -2.194473, 0.9803922, 1, 0, 1,
-0.973991, 2.296534, 0.4920274, 0.972549, 1, 0, 1,
-0.9694749, 0.2006444, -3.47411, 0.9686275, 1, 0, 1,
-0.9684766, 1.884714, 0.1286762, 0.9607843, 1, 0, 1,
-0.9589759, -1.423172, -3.763757, 0.9568627, 1, 0, 1,
-0.9516639, -1.338873, -3.024946, 0.9490196, 1, 0, 1,
-0.951017, 1.001572, -1.520071, 0.945098, 1, 0, 1,
-0.94785, 0.1463793, -0.8267304, 0.9372549, 1, 0, 1,
-0.9422212, 1.122971, 0.8496952, 0.9333333, 1, 0, 1,
-0.9404129, 0.3477573, -0.6934424, 0.9254902, 1, 0, 1,
-0.9387308, -1.648723, -2.121092, 0.9215686, 1, 0, 1,
-0.9378453, 0.01903837, -1.969278, 0.9137255, 1, 0, 1,
-0.9371637, 0.4094768, -2.28121, 0.9098039, 1, 0, 1,
-0.9360496, -0.5572025, -1.460785, 0.9019608, 1, 0, 1,
-0.931352, -0.2459432, -2.356772, 0.8941177, 1, 0, 1,
-0.9194627, -0.5349749, -2.210832, 0.8901961, 1, 0, 1,
-0.9152291, -0.2650075, -2.271885, 0.8823529, 1, 0, 1,
-0.9100246, 0.2380986, -1.553327, 0.8784314, 1, 0, 1,
-0.9051778, 0.3618761, -0.05750808, 0.8705882, 1, 0, 1,
-0.9036206, -0.8727743, -1.58752, 0.8666667, 1, 0, 1,
-0.9028928, 0.3491274, -0.6858722, 0.8588235, 1, 0, 1,
-0.9004295, 0.6020342, -1.316426, 0.854902, 1, 0, 1,
-0.8981785, -1.438237, -2.447153, 0.8470588, 1, 0, 1,
-0.8935981, -1.844903, 0.1918068, 0.8431373, 1, 0, 1,
-0.8913004, -0.57691, -1.071458, 0.8352941, 1, 0, 1,
-0.886497, -1.828426, -2.238975, 0.8313726, 1, 0, 1,
-0.8853635, 0.3665107, -2.264409, 0.8235294, 1, 0, 1,
-0.8843843, -0.7938641, -3.862285, 0.8196079, 1, 0, 1,
-0.8801611, -1.145608, -3.244922, 0.8117647, 1, 0, 1,
-0.8798884, 1.495526, -2.537335, 0.8078431, 1, 0, 1,
-0.8750479, 0.2435725, 0.03568922, 0.8, 1, 0, 1,
-0.8728659, 0.5597384, -0.9616109, 0.7921569, 1, 0, 1,
-0.8727593, 0.90001, -1.929206, 0.7882353, 1, 0, 1,
-0.8642019, 1.080079, -0.815269, 0.7803922, 1, 0, 1,
-0.8631654, 0.01350561, -0.5361301, 0.7764706, 1, 0, 1,
-0.8528426, -1.46499, -3.096485, 0.7686275, 1, 0, 1,
-0.8514135, 0.1558919, -1.23112, 0.7647059, 1, 0, 1,
-0.8473142, -1.192889, -1.696969, 0.7568628, 1, 0, 1,
-0.8468456, 0.04441336, -1.362591, 0.7529412, 1, 0, 1,
-0.8412473, 0.8515653, 0.1393971, 0.7450981, 1, 0, 1,
-0.839372, 0.9972193, -0.3628425, 0.7411765, 1, 0, 1,
-0.8378868, 0.93686, -0.4931292, 0.7333333, 1, 0, 1,
-0.8374674, -0.4113327, -1.618078, 0.7294118, 1, 0, 1,
-0.8355494, -0.03964503, -3.336157, 0.7215686, 1, 0, 1,
-0.8353162, -0.8630994, -2.490476, 0.7176471, 1, 0, 1,
-0.8313028, -0.5547804, -0.4573559, 0.7098039, 1, 0, 1,
-0.8262063, -0.6157452, -2.514229, 0.7058824, 1, 0, 1,
-0.8225387, 0.7359046, -0.1473484, 0.6980392, 1, 0, 1,
-0.8180435, -0.6596373, -2.454755, 0.6901961, 1, 0, 1,
-0.81754, 0.6244771, -1.820741, 0.6862745, 1, 0, 1,
-0.8171264, -0.003381263, -0.2059733, 0.6784314, 1, 0, 1,
-0.8165161, -0.4807245, -1.859066, 0.6745098, 1, 0, 1,
-0.8156378, -0.08028898, -1.302167, 0.6666667, 1, 0, 1,
-0.8146173, 2.290184, 0.06406899, 0.6627451, 1, 0, 1,
-0.8139077, 0.8266497, -0.3878428, 0.654902, 1, 0, 1,
-0.8131242, -0.7523135, -1.493954, 0.6509804, 1, 0, 1,
-0.8127233, 0.1271832, -1.898985, 0.6431373, 1, 0, 1,
-0.8113644, 1.254356, -1.411529, 0.6392157, 1, 0, 1,
-0.8090574, -2.166697, -2.041617, 0.6313726, 1, 0, 1,
-0.8089511, -0.8812174, -2.605303, 0.627451, 1, 0, 1,
-0.808547, -0.7029676, -2.323934, 0.6196079, 1, 0, 1,
-0.8067967, 0.6628722, -0.6388473, 0.6156863, 1, 0, 1,
-0.8005912, -0.03096448, 0.368049, 0.6078432, 1, 0, 1,
-0.7964923, -0.3878191, -1.871259, 0.6039216, 1, 0, 1,
-0.7902865, 0.8937401, -0.907887, 0.5960785, 1, 0, 1,
-0.786956, 0.1878632, -1.547245, 0.5882353, 1, 0, 1,
-0.7861685, 1.06687, -2.399263, 0.5843138, 1, 0, 1,
-0.7857226, 0.3252521, -2.062785, 0.5764706, 1, 0, 1,
-0.7842621, 0.533156, -0.8288094, 0.572549, 1, 0, 1,
-0.7833611, -0.00578437, 0.1364579, 0.5647059, 1, 0, 1,
-0.7806962, 0.9631447, -1.592474, 0.5607843, 1, 0, 1,
-0.7796538, -0.2329513, -1.711992, 0.5529412, 1, 0, 1,
-0.7724912, -0.8934629, -3.846723, 0.5490196, 1, 0, 1,
-0.7710876, 0.1760025, -0.5071417, 0.5411765, 1, 0, 1,
-0.7686083, -0.9550495, -3.100966, 0.5372549, 1, 0, 1,
-0.7651283, -1.170017, -1.84182, 0.5294118, 1, 0, 1,
-0.7638482, -1.831461, -1.58202, 0.5254902, 1, 0, 1,
-0.7535226, -0.5802062, -0.8687131, 0.5176471, 1, 0, 1,
-0.7510433, -1.795097, -2.486111, 0.5137255, 1, 0, 1,
-0.7423528, 0.5262138, -2.58426, 0.5058824, 1, 0, 1,
-0.7421728, 0.4513816, -1.726115, 0.5019608, 1, 0, 1,
-0.7412869, -1.856964, -3.684426, 0.4941176, 1, 0, 1,
-0.7253367, 0.3946891, -0.0005050797, 0.4862745, 1, 0, 1,
-0.7250639, 2.161732, -1.065954, 0.4823529, 1, 0, 1,
-0.7205085, 0.8957846, -0.9656412, 0.4745098, 1, 0, 1,
-0.7201812, -1.193498, -1.428295, 0.4705882, 1, 0, 1,
-0.7182347, 0.9470896, 0.7930294, 0.4627451, 1, 0, 1,
-0.7171138, -1.931611, -3.625401, 0.4588235, 1, 0, 1,
-0.7166243, -0.5733924, 0.183557, 0.4509804, 1, 0, 1,
-0.7139359, 0.5273255, -1.220333, 0.4470588, 1, 0, 1,
-0.7124825, 0.7404549, -0.7610387, 0.4392157, 1, 0, 1,
-0.7120159, -0.148803, -2.417911, 0.4352941, 1, 0, 1,
-0.711601, -1.161586, -2.301383, 0.427451, 1, 0, 1,
-0.7112483, 0.3820691, -1.688782, 0.4235294, 1, 0, 1,
-0.7106986, 0.1543426, -1.031003, 0.4156863, 1, 0, 1,
-0.7106915, -0.1523352, -0.4259609, 0.4117647, 1, 0, 1,
-0.7072822, 0.6280052, 0.3557721, 0.4039216, 1, 0, 1,
-0.7021263, 0.1037358, -0.8227623, 0.3960784, 1, 0, 1,
-0.700526, -0.3544089, -2.723614, 0.3921569, 1, 0, 1,
-0.6998125, -0.8035098, -3.269046, 0.3843137, 1, 0, 1,
-0.6947581, -1.268176, -3.288429, 0.3803922, 1, 0, 1,
-0.6935465, 0.3424097, -1.505393, 0.372549, 1, 0, 1,
-0.6907693, -1.090672, -3.917433, 0.3686275, 1, 0, 1,
-0.688756, -0.9019607, -0.7981185, 0.3607843, 1, 0, 1,
-0.68007, 0.320607, -1.385857, 0.3568628, 1, 0, 1,
-0.6697609, -0.9676105, -3.030631, 0.3490196, 1, 0, 1,
-0.6637068, 0.6205291, -2.15518, 0.345098, 1, 0, 1,
-0.6518142, -0.04065719, -2.4979, 0.3372549, 1, 0, 1,
-0.6510599, 0.2042517, -1.616335, 0.3333333, 1, 0, 1,
-0.6429902, -0.9316665, -3.576614, 0.3254902, 1, 0, 1,
-0.6413141, -1.980009, -2.857675, 0.3215686, 1, 0, 1,
-0.6397325, 0.4703646, -0.4368947, 0.3137255, 1, 0, 1,
-0.6373655, 1.421963, -1.214581, 0.3098039, 1, 0, 1,
-0.6275797, 0.05931756, -2.223209, 0.3019608, 1, 0, 1,
-0.625959, 0.6548989, -2.409656, 0.2941177, 1, 0, 1,
-0.6204419, 1.250403, -2.018965, 0.2901961, 1, 0, 1,
-0.618282, -0.04348318, -1.314009, 0.282353, 1, 0, 1,
-0.6180474, 1.575005, -1.165466, 0.2784314, 1, 0, 1,
-0.6106203, 0.637051, -1.058122, 0.2705882, 1, 0, 1,
-0.5964937, 1.51031, -1.466204, 0.2666667, 1, 0, 1,
-0.5906718, 1.974997, -1.740532, 0.2588235, 1, 0, 1,
-0.5899547, 0.379625, -3.547114, 0.254902, 1, 0, 1,
-0.587162, 0.7962489, -2.152786, 0.2470588, 1, 0, 1,
-0.5870765, 0.972981, 0.5531163, 0.2431373, 1, 0, 1,
-0.5864208, 0.004979322, -2.680913, 0.2352941, 1, 0, 1,
-0.5829601, -0.2873808, -0.1297259, 0.2313726, 1, 0, 1,
-0.5819976, -0.7225391, -4.188486, 0.2235294, 1, 0, 1,
-0.57729, 0.2912179, -3.342399, 0.2196078, 1, 0, 1,
-0.5737439, -1.700675, -2.311947, 0.2117647, 1, 0, 1,
-0.5668105, -1.066257, -1.450209, 0.2078431, 1, 0, 1,
-0.5635537, 0.07692698, -0.6557517, 0.2, 1, 0, 1,
-0.5620754, -0.1858785, -0.1027233, 0.1921569, 1, 0, 1,
-0.5584341, 1.644453, -0.09608326, 0.1882353, 1, 0, 1,
-0.557759, -0.5290172, -2.65607, 0.1803922, 1, 0, 1,
-0.5432957, -0.6826931, -2.998825, 0.1764706, 1, 0, 1,
-0.5413214, 0.6517155, -0.5903024, 0.1686275, 1, 0, 1,
-0.5390055, 1.035303, -0.5917164, 0.1647059, 1, 0, 1,
-0.5377367, 0.6769972, -0.480049, 0.1568628, 1, 0, 1,
-0.5344598, 1.161674, -0.09372816, 0.1529412, 1, 0, 1,
-0.5258847, -0.7511556, -2.898022, 0.145098, 1, 0, 1,
-0.5204496, -0.6783346, -1.226807, 0.1411765, 1, 0, 1,
-0.5177753, -2.573793, -3.691134, 0.1333333, 1, 0, 1,
-0.5175064, -0.5896637, -2.559936, 0.1294118, 1, 0, 1,
-0.5160525, -0.7317509, -2.875627, 0.1215686, 1, 0, 1,
-0.5149807, -0.1856692, -3.076826, 0.1176471, 1, 0, 1,
-0.5125486, -0.1581051, -3.660651, 0.1098039, 1, 0, 1,
-0.5124934, -0.2414389, -1.509514, 0.1058824, 1, 0, 1,
-0.5123302, -0.532583, -0.2017594, 0.09803922, 1, 0, 1,
-0.5085726, -1.28327, -2.845867, 0.09019608, 1, 0, 1,
-0.5078345, -1.017326, -1.605619, 0.08627451, 1, 0, 1,
-0.5064211, 0.9661509, -1.161925, 0.07843138, 1, 0, 1,
-0.5063183, -0.6861851, -3.919034, 0.07450981, 1, 0, 1,
-0.5036365, -1.172123, -4.755947, 0.06666667, 1, 0, 1,
-0.4976847, -1.28021, -3.315417, 0.0627451, 1, 0, 1,
-0.4970986, -0.05399182, -2.628, 0.05490196, 1, 0, 1,
-0.4954777, 1.193003, -1.079823, 0.05098039, 1, 0, 1,
-0.4920305, -1.686124, -2.537841, 0.04313726, 1, 0, 1,
-0.4894612, 0.5615793, 0.5297273, 0.03921569, 1, 0, 1,
-0.4891758, 0.01866411, -0.4405786, 0.03137255, 1, 0, 1,
-0.480673, 0.640869, 0.1728276, 0.02745098, 1, 0, 1,
-0.4784198, 0.02915372, -1.5361, 0.01960784, 1, 0, 1,
-0.4766879, 0.8255937, -0.179649, 0.01568628, 1, 0, 1,
-0.46998, 1.586151, -0.6946443, 0.007843138, 1, 0, 1,
-0.4649544, -0.4602296, -1.274059, 0.003921569, 1, 0, 1,
-0.464801, 1.202587, -0.1112551, 0, 1, 0.003921569, 1,
-0.4629967, 0.5179399, -1.27688, 0, 1, 0.01176471, 1,
-0.4628707, 0.07967651, -3.340281, 0, 1, 0.01568628, 1,
-0.4584045, 1.116349, 0.2691857, 0, 1, 0.02352941, 1,
-0.4557732, -0.9975739, -4.381058, 0, 1, 0.02745098, 1,
-0.4459946, 1.344784, -0.905963, 0, 1, 0.03529412, 1,
-0.4448842, -0.8258094, -2.038074, 0, 1, 0.03921569, 1,
-0.4431385, 0.3591967, -1.293777, 0, 1, 0.04705882, 1,
-0.4411143, 1.084383, -0.9414624, 0, 1, 0.05098039, 1,
-0.4391281, 0.6497781, 0.3518416, 0, 1, 0.05882353, 1,
-0.4327607, 0.5754684, -0.7060189, 0, 1, 0.0627451, 1,
-0.4309175, 1.13875, -0.4121608, 0, 1, 0.07058824, 1,
-0.4290895, -1.392218, -3.198395, 0, 1, 0.07450981, 1,
-0.4249246, 0.2885187, -0.5272153, 0, 1, 0.08235294, 1,
-0.4128256, 0.6991456, -0.9105665, 0, 1, 0.08627451, 1,
-0.4095951, -0.06532934, -0.5256056, 0, 1, 0.09411765, 1,
-0.4078062, -0.6311606, -3.792332, 0, 1, 0.1019608, 1,
-0.4069299, 0.02755722, -1.037289, 0, 1, 0.1058824, 1,
-0.3971488, -0.1856256, -1.242931, 0, 1, 0.1137255, 1,
-0.3969182, 2.14213, -0.007537505, 0, 1, 0.1176471, 1,
-0.3934498, -1.338734, -1.669489, 0, 1, 0.1254902, 1,
-0.3916394, -1.077516, -4.414782, 0, 1, 0.1294118, 1,
-0.3884639, 1.324651, -1.474466, 0, 1, 0.1372549, 1,
-0.3873983, 0.2097886, 0.5331187, 0, 1, 0.1411765, 1,
-0.3868751, -0.3814238, -1.092614, 0, 1, 0.1490196, 1,
-0.3859387, 0.08213089, -0.5989859, 0, 1, 0.1529412, 1,
-0.3831159, 0.6032312, -0.3747528, 0, 1, 0.1607843, 1,
-0.3822892, 1.034437, -1.755166, 0, 1, 0.1647059, 1,
-0.3815789, 1.461044, 0.0943962, 0, 1, 0.172549, 1,
-0.3798006, -1.094951, -3.321519, 0, 1, 0.1764706, 1,
-0.3786846, 0.7500865, -1.317298, 0, 1, 0.1843137, 1,
-0.374007, 0.01437811, -2.318704, 0, 1, 0.1882353, 1,
-0.3712434, -1.841231, -3.901281, 0, 1, 0.1960784, 1,
-0.3703077, -0.012946, -1.800764, 0, 1, 0.2039216, 1,
-0.3684014, -1.649236, -4.128693, 0, 1, 0.2078431, 1,
-0.3659269, 0.08707081, -2.911307, 0, 1, 0.2156863, 1,
-0.3633979, 0.7411185, -1.169438, 0, 1, 0.2196078, 1,
-0.3598635, -0.558427, -3.217879, 0, 1, 0.227451, 1,
-0.3557491, -0.5781766, -2.922484, 0, 1, 0.2313726, 1,
-0.3546442, -0.6481758, -1.959609, 0, 1, 0.2392157, 1,
-0.350439, -0.4766993, -1.461327, 0, 1, 0.2431373, 1,
-0.350371, -2.270842, -2.060687, 0, 1, 0.2509804, 1,
-0.3491656, -1.347744, -2.580393, 0, 1, 0.254902, 1,
-0.3393923, 1.472336, 0.9514217, 0, 1, 0.2627451, 1,
-0.3375444, 1.563151, -2.037222, 0, 1, 0.2666667, 1,
-0.3365156, 0.5063606, -1.660816, 0, 1, 0.2745098, 1,
-0.3360282, -0.03875385, -1.277939, 0, 1, 0.2784314, 1,
-0.3307154, 0.4054539, -2.022348, 0, 1, 0.2862745, 1,
-0.324847, -0.04732418, -3.445146, 0, 1, 0.2901961, 1,
-0.3234721, -0.2432307, -1.939561, 0, 1, 0.2980392, 1,
-0.3195205, -0.1680496, -1.714689, 0, 1, 0.3058824, 1,
-0.316102, 1.629686, -0.527625, 0, 1, 0.3098039, 1,
-0.3153657, 1.67529, 1.484459, 0, 1, 0.3176471, 1,
-0.3120429, -0.4168522, -3.934733, 0, 1, 0.3215686, 1,
-0.3105132, 0.5890895, 0.9635004, 0, 1, 0.3294118, 1,
-0.3075912, -0.9411641, -5.170644, 0, 1, 0.3333333, 1,
-0.3068741, -1.783373, -3.586979, 0, 1, 0.3411765, 1,
-0.3064653, 2.053771, 0.1203434, 0, 1, 0.345098, 1,
-0.3061015, -0.1281145, -1.726548, 0, 1, 0.3529412, 1,
-0.3018094, 0.2480906, -1.076984, 0, 1, 0.3568628, 1,
-0.3014808, -1.087355, -2.149823, 0, 1, 0.3647059, 1,
-0.2978765, 0.7324028, -0.9289521, 0, 1, 0.3686275, 1,
-0.2971291, -0.674153, -2.343716, 0, 1, 0.3764706, 1,
-0.2963766, -0.1975507, -1.601226, 0, 1, 0.3803922, 1,
-0.2956282, 1.159029, -1.230547, 0, 1, 0.3882353, 1,
-0.2955606, 1.568189, 0.08149122, 0, 1, 0.3921569, 1,
-0.2932676, -1.650913, -3.088621, 0, 1, 0.4, 1,
-0.2867654, -0.6166438, -3.378268, 0, 1, 0.4078431, 1,
-0.2824175, 1.436711, -0.1871379, 0, 1, 0.4117647, 1,
-0.282208, 1.267217, -0.6785136, 0, 1, 0.4196078, 1,
-0.2789779, 1.770894, -0.2050139, 0, 1, 0.4235294, 1,
-0.2756141, -0.8972825, -4.261361, 0, 1, 0.4313726, 1,
-0.2755976, 0.7780509, -1.507969, 0, 1, 0.4352941, 1,
-0.2715696, -0.2124438, -0.1143331, 0, 1, 0.4431373, 1,
-0.2697112, -0.945258, -2.009209, 0, 1, 0.4470588, 1,
-0.2673913, 1.389381, -0.4357767, 0, 1, 0.454902, 1,
-0.2649818, -1.029552, -2.549781, 0, 1, 0.4588235, 1,
-0.2647911, 2.296018, 0.09729673, 0, 1, 0.4666667, 1,
-0.2638267, -1.136084, -3.33957, 0, 1, 0.4705882, 1,
-0.2614617, -0.7590403, -3.317531, 0, 1, 0.4784314, 1,
-0.259837, -0.8146805, -4.339491, 0, 1, 0.4823529, 1,
-0.2575892, 0.9946312, -1.295861, 0, 1, 0.4901961, 1,
-0.2524877, 0.7736866, -0.1355052, 0, 1, 0.4941176, 1,
-0.252284, 2.201517, -0.5686207, 0, 1, 0.5019608, 1,
-0.2499502, -0.9598559, -1.677466, 0, 1, 0.509804, 1,
-0.2486556, -0.8474425, -3.396998, 0, 1, 0.5137255, 1,
-0.2431435, -0.4799896, -3.304651, 0, 1, 0.5215687, 1,
-0.2416355, -1.025821, -3.654922, 0, 1, 0.5254902, 1,
-0.2398201, -2.533568, -3.567027, 0, 1, 0.5333334, 1,
-0.236173, -0.7530217, -2.625299, 0, 1, 0.5372549, 1,
-0.2361666, -0.6417249, -4.489921, 0, 1, 0.5450981, 1,
-0.2359237, 0.5400152, 1.593817, 0, 1, 0.5490196, 1,
-0.2336387, -0.8269573, -2.015624, 0, 1, 0.5568628, 1,
-0.2302623, 0.6736528, -1.321456, 0, 1, 0.5607843, 1,
-0.226516, -0.9237325, -1.653703, 0, 1, 0.5686275, 1,
-0.2196141, -0.003584123, -2.60303, 0, 1, 0.572549, 1,
-0.2170662, 0.9652039, -0.1776041, 0, 1, 0.5803922, 1,
-0.2152582, 1.150146, -0.3529191, 0, 1, 0.5843138, 1,
-0.210638, -0.3097117, -1.865686, 0, 1, 0.5921569, 1,
-0.2068286, -0.4027835, -3.194141, 0, 1, 0.5960785, 1,
-0.2043229, 0.2694621, 0.3742357, 0, 1, 0.6039216, 1,
-0.1999378, -1.512975, -4.77577, 0, 1, 0.6117647, 1,
-0.198726, -1.051109, -1.402068, 0, 1, 0.6156863, 1,
-0.1980568, -0.6929119, -0.4796735, 0, 1, 0.6235294, 1,
-0.1950241, -0.9773515, -2.420944, 0, 1, 0.627451, 1,
-0.1912361, -0.05146401, -0.8849803, 0, 1, 0.6352941, 1,
-0.1899101, 0.03960784, 2.256814, 0, 1, 0.6392157, 1,
-0.1893903, 1.166107, 0.274962, 0, 1, 0.6470588, 1,
-0.1840541, -0.2443698, -2.917507, 0, 1, 0.6509804, 1,
-0.1820835, 1.442196, 0.6774461, 0, 1, 0.6588235, 1,
-0.1810953, -0.5469694, -3.245065, 0, 1, 0.6627451, 1,
-0.1778247, 0.1552329, 0.801592, 0, 1, 0.6705883, 1,
-0.1774387, 1.069327, -0.3581074, 0, 1, 0.6745098, 1,
-0.1763338, -2.095546, -3.428196, 0, 1, 0.682353, 1,
-0.1761642, -1.625362, -3.172595, 0, 1, 0.6862745, 1,
-0.1744307, -1.172062, -3.743955, 0, 1, 0.6941177, 1,
-0.1732429, 0.2333955, 0.129073, 0, 1, 0.7019608, 1,
-0.1717193, 0.3941815, -0.8605715, 0, 1, 0.7058824, 1,
-0.1699073, -0.8183179, -3.949044, 0, 1, 0.7137255, 1,
-0.168664, -1.355084, -4.193621, 0, 1, 0.7176471, 1,
-0.168415, -0.9586409, -2.701375, 0, 1, 0.7254902, 1,
-0.1615107, 1.508089, -0.182366, 0, 1, 0.7294118, 1,
-0.1607148, 0.194457, 0.7535422, 0, 1, 0.7372549, 1,
-0.1579471, -0.8438769, -3.806416, 0, 1, 0.7411765, 1,
-0.1571559, 0.7118469, 1.106285, 0, 1, 0.7490196, 1,
-0.1566243, 0.9999126, 0.4170017, 0, 1, 0.7529412, 1,
-0.1559853, -0.09960644, -2.677428, 0, 1, 0.7607843, 1,
-0.1551181, -0.1337126, -1.93587, 0, 1, 0.7647059, 1,
-0.1536318, -0.1139697, -1.815558, 0, 1, 0.772549, 1,
-0.1536153, -0.5061102, -2.046351, 0, 1, 0.7764706, 1,
-0.1512336, 0.0282514, 0.362294, 0, 1, 0.7843137, 1,
-0.1463431, -1.504829, -1.729792, 0, 1, 0.7882353, 1,
-0.1458074, -0.9982214, -1.669344, 0, 1, 0.7960784, 1,
-0.1441919, 0.3848748, -0.69726, 0, 1, 0.8039216, 1,
-0.1407383, -0.577856, -2.494872, 0, 1, 0.8078431, 1,
-0.139292, 0.002462119, -1.098696, 0, 1, 0.8156863, 1,
-0.1390047, 0.1965348, -0.1518776, 0, 1, 0.8196079, 1,
-0.1385946, 0.9988016, -0.06852399, 0, 1, 0.827451, 1,
-0.1384254, 0.3188111, 0.2000645, 0, 1, 0.8313726, 1,
-0.1384222, 0.09103061, -1.203187, 0, 1, 0.8392157, 1,
-0.136946, -0.07290304, -1.765855, 0, 1, 0.8431373, 1,
-0.1357504, -0.7105469, -3.667113, 0, 1, 0.8509804, 1,
-0.132716, -2.004148, -2.962564, 0, 1, 0.854902, 1,
-0.1319395, 0.5247309, 0.3515382, 0, 1, 0.8627451, 1,
-0.1311253, 0.6410165, -0.1526218, 0, 1, 0.8666667, 1,
-0.1283999, 0.2277259, -0.3442876, 0, 1, 0.8745098, 1,
-0.1261222, 0.1605077, -0.1396899, 0, 1, 0.8784314, 1,
-0.1216437, 0.01859627, -1.521162, 0, 1, 0.8862745, 1,
-0.119834, -0.7079275, -3.362427, 0, 1, 0.8901961, 1,
-0.1197088, -1.31309, -2.440941, 0, 1, 0.8980392, 1,
-0.1157424, -2.514787, -3.58452, 0, 1, 0.9058824, 1,
-0.1138486, 0.8396804, 2.737371, 0, 1, 0.9098039, 1,
-0.1132257, -2.058115, -4.176871, 0, 1, 0.9176471, 1,
-0.111926, -0.2488446, -1.843254, 0, 1, 0.9215686, 1,
-0.1113647, 0.3111767, -0.1854082, 0, 1, 0.9294118, 1,
-0.1111373, -1.097853, -1.568033, 0, 1, 0.9333333, 1,
-0.1110211, 0.4033116, 0.0456581, 0, 1, 0.9411765, 1,
-0.1100538, 0.05320482, -2.11683, 0, 1, 0.945098, 1,
-0.1087267, -0.9447291, -0.600247, 0, 1, 0.9529412, 1,
-0.1079454, 0.8431964, -0.4331643, 0, 1, 0.9568627, 1,
-0.1079153, -0.7325373, -2.023919, 0, 1, 0.9647059, 1,
-0.100081, 0.366088, 0.409339, 0, 1, 0.9686275, 1,
-0.09202439, 0.8014467, -0.1290493, 0, 1, 0.9764706, 1,
-0.09119458, 1.771722, -0.9195277, 0, 1, 0.9803922, 1,
-0.08499557, -1.317635, -3.725508, 0, 1, 0.9882353, 1,
-0.084833, 0.4434395, 1.214695, 0, 1, 0.9921569, 1,
-0.08374014, -0.8250061, -4.289401, 0, 1, 1, 1,
-0.08085351, 0.404177, 1.367054, 0, 0.9921569, 1, 1,
-0.07514142, 2.042642, -1.298953, 0, 0.9882353, 1, 1,
-0.06968778, -0.2275406, -2.760842, 0, 0.9803922, 1, 1,
-0.06546061, 1.59844, 0.14003, 0, 0.9764706, 1, 1,
-0.06446392, -0.692326, -3.26516, 0, 0.9686275, 1, 1,
-0.06181993, 0.4221837, -0.6110382, 0, 0.9647059, 1, 1,
-0.05883899, -2.882524, -2.276317, 0, 0.9568627, 1, 1,
-0.05273735, -0.4623419, -2.762231, 0, 0.9529412, 1, 1,
-0.05064817, 0.7158713, 0.8300887, 0, 0.945098, 1, 1,
-0.04623998, -2.065373, -5.029178, 0, 0.9411765, 1, 1,
-0.04593317, -1.015831, -1.901701, 0, 0.9333333, 1, 1,
-0.04001214, 0.9352638, 0.3876156, 0, 0.9294118, 1, 1,
-0.03721997, 1.810654, 0.6067784, 0, 0.9215686, 1, 1,
-0.03627682, 1.154694, -0.2471816, 0, 0.9176471, 1, 1,
-0.03423122, 1.235419, 0.393332, 0, 0.9098039, 1, 1,
-0.03124379, 0.5428588, -1.073585, 0, 0.9058824, 1, 1,
-0.02687304, -0.424877, -3.599017, 0, 0.8980392, 1, 1,
-0.02570682, -1.312079, -1.721897, 0, 0.8901961, 1, 1,
-0.0253924, 0.5484586, -1.416132, 0, 0.8862745, 1, 1,
-0.02120181, -0.2153133, -4.25703, 0, 0.8784314, 1, 1,
-0.01656843, -1.419196, -1.909968, 0, 0.8745098, 1, 1,
-0.01549641, 0.5962807, -2.223964, 0, 0.8666667, 1, 1,
-0.0145947, -0.8062762, -3.936435, 0, 0.8627451, 1, 1,
-0.01449625, 0.7984293, -0.5814065, 0, 0.854902, 1, 1,
-0.01253265, -1.112587, -3.217344, 0, 0.8509804, 1, 1,
-0.004348699, -0.2615359, -3.213909, 0, 0.8431373, 1, 1,
-0.0008980011, -0.7668256, -4.098846, 0, 0.8392157, 1, 1,
0.001879176, 1.808482, 1.440783, 0, 0.8313726, 1, 1,
0.00487039, 0.5621088, 0.3802634, 0, 0.827451, 1, 1,
0.007247886, 1.220327, 1.724217, 0, 0.8196079, 1, 1,
0.00860065, -1.523735, 2.804804, 0, 0.8156863, 1, 1,
0.01720617, -0.2352365, 5.029943, 0, 0.8078431, 1, 1,
0.01837233, -1.188628, 3.828031, 0, 0.8039216, 1, 1,
0.03141591, 0.05446242, -0.1659431, 0, 0.7960784, 1, 1,
0.03714448, -1.330545, 3.489329, 0, 0.7882353, 1, 1,
0.03786281, -0.4761827, 2.169941, 0, 0.7843137, 1, 1,
0.04341901, -0.7049755, 2.515125, 0, 0.7764706, 1, 1,
0.04421305, 0.7039459, 0.191162, 0, 0.772549, 1, 1,
0.04713186, -0.489048, 3.612886, 0, 0.7647059, 1, 1,
0.05166562, -2.522762, 1.562075, 0, 0.7607843, 1, 1,
0.05446849, -1.177983, 2.756424, 0, 0.7529412, 1, 1,
0.06130933, 0.3865995, 0.4165755, 0, 0.7490196, 1, 1,
0.06439562, 0.7586462, -0.3326216, 0, 0.7411765, 1, 1,
0.06513447, 1.394004, 0.6478667, 0, 0.7372549, 1, 1,
0.06517047, -0.931825, 1.552811, 0, 0.7294118, 1, 1,
0.06535241, -0.1777161, 3.458304, 0, 0.7254902, 1, 1,
0.06716894, -0.4728188, 2.981376, 0, 0.7176471, 1, 1,
0.06976453, -0.6521025, 3.177022, 0, 0.7137255, 1, 1,
0.0703597, 0.9085876, 0.1307487, 0, 0.7058824, 1, 1,
0.07318531, 0.4218738, -1.235033, 0, 0.6980392, 1, 1,
0.08394069, 0.9597058, -0.9404401, 0, 0.6941177, 1, 1,
0.08407235, -1.051969, 1.793642, 0, 0.6862745, 1, 1,
0.08558241, 1.361457, 1.01849, 0, 0.682353, 1, 1,
0.08757939, -0.4790466, 2.224165, 0, 0.6745098, 1, 1,
0.0943431, -0.5652963, 3.361306, 0, 0.6705883, 1, 1,
0.09470026, -1.670637, 3.16658, 0, 0.6627451, 1, 1,
0.09632821, -0.7489926, 3.044422, 0, 0.6588235, 1, 1,
0.1002953, 1.720907, -0.09637, 0, 0.6509804, 1, 1,
0.1079594, -0.3222773, 2.161498, 0, 0.6470588, 1, 1,
0.1099605, 2.029718, 0.8478332, 0, 0.6392157, 1, 1,
0.1102976, 1.237712, 0.05827061, 0, 0.6352941, 1, 1,
0.1125676, -0.2706905, 3.539793, 0, 0.627451, 1, 1,
0.1147737, 0.6464424, 1.273715, 0, 0.6235294, 1, 1,
0.1163455, -0.3279329, 3.183841, 0, 0.6156863, 1, 1,
0.1186862, 0.702046, -0.6655589, 0, 0.6117647, 1, 1,
0.1196378, 0.2251441, 1.929485, 0, 0.6039216, 1, 1,
0.120982, 1.014378, -1.462871, 0, 0.5960785, 1, 1,
0.1215477, -0.709564, 2.876568, 0, 0.5921569, 1, 1,
0.121884, 1.924753, 0.2146558, 0, 0.5843138, 1, 1,
0.1329152, 0.7531494, -0.002649073, 0, 0.5803922, 1, 1,
0.1346714, 1.613287, -1.236128, 0, 0.572549, 1, 1,
0.1348221, -0.1257277, 2.906533, 0, 0.5686275, 1, 1,
0.1414047, -1.070424, 1.749799, 0, 0.5607843, 1, 1,
0.1460813, 1.00756, -0.8618215, 0, 0.5568628, 1, 1,
0.1506962, -1.337326, 3.759308, 0, 0.5490196, 1, 1,
0.1529617, -0.7132491, 1.599253, 0, 0.5450981, 1, 1,
0.1549796, -0.557748, 3.136175, 0, 0.5372549, 1, 1,
0.1558958, 0.8770151, -0.1072756, 0, 0.5333334, 1, 1,
0.1617233, 1.211956, -1.125563, 0, 0.5254902, 1, 1,
0.162121, -1.843501, 3.053333, 0, 0.5215687, 1, 1,
0.1740384, 0.4373178, 0.6736668, 0, 0.5137255, 1, 1,
0.179692, -1.952442, 2.207221, 0, 0.509804, 1, 1,
0.1811461, 0.09298892, 1.332446, 0, 0.5019608, 1, 1,
0.1817399, 0.488939, -1.180842, 0, 0.4941176, 1, 1,
0.1834436, -1.085855, 4.047654, 0, 0.4901961, 1, 1,
0.1841813, 1.07492, 1.974899, 0, 0.4823529, 1, 1,
0.1843117, -1.201173, 3.288039, 0, 0.4784314, 1, 1,
0.1872139, 1.048547, 1.762516, 0, 0.4705882, 1, 1,
0.1889338, -1.090954, 2.380294, 0, 0.4666667, 1, 1,
0.1893006, -0.01963982, 2.399619, 0, 0.4588235, 1, 1,
0.1952599, 0.5618593, 0.3305025, 0, 0.454902, 1, 1,
0.1959862, 1.256143, -0.4560155, 0, 0.4470588, 1, 1,
0.1990602, 2.060452, -0.8284469, 0, 0.4431373, 1, 1,
0.2000324, -0.2692748, 1.887088, 0, 0.4352941, 1, 1,
0.2062076, 0.6713164, 0.3203006, 0, 0.4313726, 1, 1,
0.2062595, 1.017998, -0.1697342, 0, 0.4235294, 1, 1,
0.2100092, -1.559843, 3.876477, 0, 0.4196078, 1, 1,
0.2120065, 0.009808794, 1.112003, 0, 0.4117647, 1, 1,
0.2203683, -0.4237263, 2.148308, 0, 0.4078431, 1, 1,
0.2208886, -0.8818899, 2.679203, 0, 0.4, 1, 1,
0.2238303, -1.928271, 3.605772, 0, 0.3921569, 1, 1,
0.2239971, -0.02834725, 1.332603, 0, 0.3882353, 1, 1,
0.2302505, -0.01022142, 1.562228, 0, 0.3803922, 1, 1,
0.2494944, 0.2132187, 0.5389514, 0, 0.3764706, 1, 1,
0.2497804, 0.3033486, 1.807715, 0, 0.3686275, 1, 1,
0.2508203, -0.09516705, 2.030376, 0, 0.3647059, 1, 1,
0.2525095, 0.7616021, -0.1922272, 0, 0.3568628, 1, 1,
0.2536811, 0.1219352, 1.606001, 0, 0.3529412, 1, 1,
0.2572107, -0.716002, 4.26729, 0, 0.345098, 1, 1,
0.2604644, -0.04061007, 2.101861, 0, 0.3411765, 1, 1,
0.2605749, 0.4131076, 0.9646052, 0, 0.3333333, 1, 1,
0.2650267, -0.5621772, 3.252053, 0, 0.3294118, 1, 1,
0.2662137, 1.873561, 0.3683664, 0, 0.3215686, 1, 1,
0.2663837, -0.6075644, 2.459792, 0, 0.3176471, 1, 1,
0.2686868, 1.580746, 1.731004, 0, 0.3098039, 1, 1,
0.2707584, 0.9382885, 0.8095458, 0, 0.3058824, 1, 1,
0.2710498, 0.7460029, 1.31626, 0, 0.2980392, 1, 1,
0.2828119, 1.299657, 0.1702821, 0, 0.2901961, 1, 1,
0.2888491, -0.1089187, 0.8750118, 0, 0.2862745, 1, 1,
0.2947809, 1.414638, 1.010188, 0, 0.2784314, 1, 1,
0.2949699, 0.9607266, -0.2853806, 0, 0.2745098, 1, 1,
0.3000236, 1.315387, -2.244876, 0, 0.2666667, 1, 1,
0.3015279, -0.7359455, 3.206887, 0, 0.2627451, 1, 1,
0.302818, -0.8307665, 3.171594, 0, 0.254902, 1, 1,
0.3084106, -0.3796338, 1.822249, 0, 0.2509804, 1, 1,
0.3086871, 0.7287011, -1.05276, 0, 0.2431373, 1, 1,
0.3139135, -0.0950532, 3.020771, 0, 0.2392157, 1, 1,
0.3204412, 1.452335, 0.6944036, 0, 0.2313726, 1, 1,
0.3257942, 1.843503, -0.4215856, 0, 0.227451, 1, 1,
0.3284409, -0.5586188, 1.833735, 0, 0.2196078, 1, 1,
0.3290924, -0.6137325, 1.933664, 0, 0.2156863, 1, 1,
0.3344231, -1.703183, 2.893569, 0, 0.2078431, 1, 1,
0.3441072, -0.3787628, 2.633565, 0, 0.2039216, 1, 1,
0.3452916, 1.182222, 1.413562, 0, 0.1960784, 1, 1,
0.3457682, 1.807258, 1.352169, 0, 0.1882353, 1, 1,
0.3502576, -0.3839428, 1.938472, 0, 0.1843137, 1, 1,
0.3558461, -0.8569106, 4.025974, 0, 0.1764706, 1, 1,
0.355849, 0.6559664, 1.128753, 0, 0.172549, 1, 1,
0.3601854, 1.236086, -0.00605791, 0, 0.1647059, 1, 1,
0.3637146, 0.1484718, 0.4567451, 0, 0.1607843, 1, 1,
0.3687872, 0.8431214, 0.729402, 0, 0.1529412, 1, 1,
0.3714724, -1.002854, 2.439912, 0, 0.1490196, 1, 1,
0.3729715, 0.005339178, 1.876764, 0, 0.1411765, 1, 1,
0.3739813, 0.4265974, 1.936689, 0, 0.1372549, 1, 1,
0.3779314, 1.157487, -0.5712587, 0, 0.1294118, 1, 1,
0.3814671, -0.9656374, 3.315429, 0, 0.1254902, 1, 1,
0.3819483, -0.239093, 3.213078, 0, 0.1176471, 1, 1,
0.3827278, -0.2201743, 2.503694, 0, 0.1137255, 1, 1,
0.3902922, 0.1957204, 1.358848, 0, 0.1058824, 1, 1,
0.3928858, -0.8412073, 0.9328448, 0, 0.09803922, 1, 1,
0.3936742, -0.004738288, 2.866859, 0, 0.09411765, 1, 1,
0.3939913, -0.85371, 3.273906, 0, 0.08627451, 1, 1,
0.3944828, 0.3634931, 2.07788, 0, 0.08235294, 1, 1,
0.3971937, 1.195765, -0.5845225, 0, 0.07450981, 1, 1,
0.4030105, -0.9572522, 2.535608, 0, 0.07058824, 1, 1,
0.4032123, 1.039516, 1.874871, 0, 0.0627451, 1, 1,
0.4107744, -1.522442, 2.56429, 0, 0.05882353, 1, 1,
0.4140659, -0.2303099, 1.711884, 0, 0.05098039, 1, 1,
0.416662, 0.9123213, 2.562769, 0, 0.04705882, 1, 1,
0.4169286, 1.258473, -0.1503172, 0, 0.03921569, 1, 1,
0.4255196, -2.147427, 2.848017, 0, 0.03529412, 1, 1,
0.4271375, 0.7372234, -0.5765794, 0, 0.02745098, 1, 1,
0.428898, -0.5340641, 2.753818, 0, 0.02352941, 1, 1,
0.428921, -2.728627, 1.898093, 0, 0.01568628, 1, 1,
0.4290355, 0.2798482, 0.6850238, 0, 0.01176471, 1, 1,
0.4296202, 0.02927374, 1.750187, 0, 0.003921569, 1, 1,
0.4300736, -0.9263578, 2.538609, 0.003921569, 0, 1, 1,
0.4316389, -0.5094578, 0.2539947, 0.007843138, 0, 1, 1,
0.4348285, 0.2961387, 2.416392, 0.01568628, 0, 1, 1,
0.4355811, 0.03354814, 0.573328, 0.01960784, 0, 1, 1,
0.4421997, 1.632207, -0.8312315, 0.02745098, 0, 1, 1,
0.4456831, 0.2484276, 1.378566, 0.03137255, 0, 1, 1,
0.4466, 0.5261708, 1.176435, 0.03921569, 0, 1, 1,
0.4476913, -0.7256501, 3.248448, 0.04313726, 0, 1, 1,
0.4483801, 1.06493, -0.03442533, 0.05098039, 0, 1, 1,
0.4550815, 1.05469, 0.4621032, 0.05490196, 0, 1, 1,
0.4570466, 1.645279, 1.273946, 0.0627451, 0, 1, 1,
0.4571922, -0.6083761, 2.287108, 0.06666667, 0, 1, 1,
0.4603147, 0.08289872, 2.49098, 0.07450981, 0, 1, 1,
0.4604094, 1.41352, -0.3498772, 0.07843138, 0, 1, 1,
0.4679949, 0.8562686, 0.7776525, 0.08627451, 0, 1, 1,
0.4704657, -1.167218, 1.707679, 0.09019608, 0, 1, 1,
0.4714661, 2.257102, 0.2602166, 0.09803922, 0, 1, 1,
0.4737206, 1.721972, 0.2332329, 0.1058824, 0, 1, 1,
0.4764, 0.04975758, 1.290259, 0.1098039, 0, 1, 1,
0.4808833, 1.037697, -0.1690643, 0.1176471, 0, 1, 1,
0.4868067, -0.2925879, 2.755812, 0.1215686, 0, 1, 1,
0.4895517, -0.2477713, 0.6151462, 0.1294118, 0, 1, 1,
0.4909511, -0.02561617, 1.025985, 0.1333333, 0, 1, 1,
0.4923275, -0.2680727, 3.943686, 0.1411765, 0, 1, 1,
0.4945335, -0.7062197, 3.480047, 0.145098, 0, 1, 1,
0.4948991, 0.06898957, 1.38959, 0.1529412, 0, 1, 1,
0.4950444, 0.591734, 2.977077, 0.1568628, 0, 1, 1,
0.498694, 0.3807285, 0.5351772, 0.1647059, 0, 1, 1,
0.4989694, 0.03985976, 1.682283, 0.1686275, 0, 1, 1,
0.5003402, -0.7042714, 2.737688, 0.1764706, 0, 1, 1,
0.5027615, -1.354836, 2.539463, 0.1803922, 0, 1, 1,
0.5030246, -0.03013082, 2.456074, 0.1882353, 0, 1, 1,
0.5035143, 0.05110958, 1.565117, 0.1921569, 0, 1, 1,
0.5036497, -0.9095312, 1.49543, 0.2, 0, 1, 1,
0.507631, 1.249258, -1.013093, 0.2078431, 0, 1, 1,
0.5078679, -0.8083674, 2.992694, 0.2117647, 0, 1, 1,
0.5200381, 1.274444, -0.3973372, 0.2196078, 0, 1, 1,
0.5237513, -0.0330009, 1.177737, 0.2235294, 0, 1, 1,
0.5286474, -0.1906586, 1.556183, 0.2313726, 0, 1, 1,
0.5287627, 2.351346, 0.5291128, 0.2352941, 0, 1, 1,
0.5377529, 0.1104582, 2.899554, 0.2431373, 0, 1, 1,
0.5422281, -0.4536836, 2.892929, 0.2470588, 0, 1, 1,
0.5458788, -0.8877141, 2.624546, 0.254902, 0, 1, 1,
0.5458841, -0.08387823, 1.418219, 0.2588235, 0, 1, 1,
0.5515929, -3.08944, 4.084309, 0.2666667, 0, 1, 1,
0.5609491, 0.8820059, 0.8237345, 0.2705882, 0, 1, 1,
0.5610805, 0.03934261, 0.3651837, 0.2784314, 0, 1, 1,
0.5627604, 0.03344427, 0.959039, 0.282353, 0, 1, 1,
0.5656147, -0.5153856, 1.309592, 0.2901961, 0, 1, 1,
0.5672769, 0.1374004, 2.046215, 0.2941177, 0, 1, 1,
0.5689355, 1.481241, 0.6215324, 0.3019608, 0, 1, 1,
0.5691954, 0.8558292, 1.167457, 0.3098039, 0, 1, 1,
0.5766754, 1.939865, 0.6248025, 0.3137255, 0, 1, 1,
0.5774187, -0.2754252, 1.598462, 0.3215686, 0, 1, 1,
0.5823166, -0.3723401, 2.143474, 0.3254902, 0, 1, 1,
0.5835458, 0.231708, 2.199935, 0.3333333, 0, 1, 1,
0.5848472, -0.3671668, 3.065002, 0.3372549, 0, 1, 1,
0.5851055, -0.1199731, 0.1668391, 0.345098, 0, 1, 1,
0.5925354, -1.07429, 2.504127, 0.3490196, 0, 1, 1,
0.5930275, -0.6687166, 2.167661, 0.3568628, 0, 1, 1,
0.5931173, -1.562783, 2.306031, 0.3607843, 0, 1, 1,
0.5962405, 2.020539, -0.0007008634, 0.3686275, 0, 1, 1,
0.5978923, 1.345929, -0.0192686, 0.372549, 0, 1, 1,
0.5988591, -1.057286, 2.681316, 0.3803922, 0, 1, 1,
0.5988984, 0.1368766, 0.8565412, 0.3843137, 0, 1, 1,
0.6020301, 0.6623054, 0.5046825, 0.3921569, 0, 1, 1,
0.6024846, 1.25223, -0.6039801, 0.3960784, 0, 1, 1,
0.6111953, 2.156523, 1.033556, 0.4039216, 0, 1, 1,
0.6216606, 0.9225748, 1.588868, 0.4117647, 0, 1, 1,
0.6293974, -1.806545, 4.69607, 0.4156863, 0, 1, 1,
0.6340956, -1.247712, 2.87602, 0.4235294, 0, 1, 1,
0.6349648, 0.2295071, 1.886481, 0.427451, 0, 1, 1,
0.6353991, 1.557982, -1.794872, 0.4352941, 0, 1, 1,
0.6385187, 0.2145374, 0.5924527, 0.4392157, 0, 1, 1,
0.6388116, 0.02465213, 1.244807, 0.4470588, 0, 1, 1,
0.6419705, -0.2909873, 2.602284, 0.4509804, 0, 1, 1,
0.6483578, -0.7123973, 1.828987, 0.4588235, 0, 1, 1,
0.6502436, -1.427512, 4.752559, 0.4627451, 0, 1, 1,
0.6505263, -0.9917846, 1.055041, 0.4705882, 0, 1, 1,
0.6521139, 1.713302, -1.015095, 0.4745098, 0, 1, 1,
0.6528589, -0.4225855, 1.517366, 0.4823529, 0, 1, 1,
0.6555401, -0.3231939, 1.41744, 0.4862745, 0, 1, 1,
0.6617915, -0.001314131, 2.409765, 0.4941176, 0, 1, 1,
0.6676037, 0.2687477, 0.4780472, 0.5019608, 0, 1, 1,
0.6745753, -0.3424773, 3.273472, 0.5058824, 0, 1, 1,
0.6858448, -0.6192932, 1.877367, 0.5137255, 0, 1, 1,
0.6912313, 0.7679257, 1.015571, 0.5176471, 0, 1, 1,
0.69225, 1.27191, 0.6061642, 0.5254902, 0, 1, 1,
0.6933798, -1.065871, 4.057177, 0.5294118, 0, 1, 1,
0.6976994, 1.664126, -0.2620454, 0.5372549, 0, 1, 1,
0.6989986, 0.6141996, 0.9563447, 0.5411765, 0, 1, 1,
0.702485, -1.09547, 1.753388, 0.5490196, 0, 1, 1,
0.7065855, 1.002339, 2.14706, 0.5529412, 0, 1, 1,
0.7137186, -0.8423303, 3.58676, 0.5607843, 0, 1, 1,
0.7137971, -0.4102279, 2.086203, 0.5647059, 0, 1, 1,
0.7176976, -0.4549942, 1.328366, 0.572549, 0, 1, 1,
0.7274398, -0.1208923, 0.6691811, 0.5764706, 0, 1, 1,
0.7310397, 1.628379, -0.4712234, 0.5843138, 0, 1, 1,
0.7329145, 0.08073797, 1.163779, 0.5882353, 0, 1, 1,
0.7331867, -0.9604388, 1.916595, 0.5960785, 0, 1, 1,
0.7338741, 0.8787348, 0.7792611, 0.6039216, 0, 1, 1,
0.7345222, 0.7186348, -0.3329861, 0.6078432, 0, 1, 1,
0.7390664, 1.010423, 0.3033927, 0.6156863, 0, 1, 1,
0.7427616, -1.120292, 3.290344, 0.6196079, 0, 1, 1,
0.748099, 0.1476622, 2.020464, 0.627451, 0, 1, 1,
0.7491254, 1.147666, -0.2919331, 0.6313726, 0, 1, 1,
0.7503166, -0.4864731, 1.267641, 0.6392157, 0, 1, 1,
0.7528489, -0.206476, 2.725927, 0.6431373, 0, 1, 1,
0.7554312, 0.04699782, 0.2042756, 0.6509804, 0, 1, 1,
0.7583779, 1.100818, 0.1085475, 0.654902, 0, 1, 1,
0.7627829, -0.9729874, 1.422018, 0.6627451, 0, 1, 1,
0.7656147, -0.09388529, 2.42, 0.6666667, 0, 1, 1,
0.7685258, -0.1020521, 2.199076, 0.6745098, 0, 1, 1,
0.7781751, 0.9318459, 0.4295805, 0.6784314, 0, 1, 1,
0.7830685, 0.8146597, 1.403985, 0.6862745, 0, 1, 1,
0.7911179, -1.564365, 2.18732, 0.6901961, 0, 1, 1,
0.7936019, -0.2238247, 1.657778, 0.6980392, 0, 1, 1,
0.7958711, 1.260954, 1.801378, 0.7058824, 0, 1, 1,
0.8088568, 0.3447188, 1.856677, 0.7098039, 0, 1, 1,
0.8097302, -0.8252681, 5.279784, 0.7176471, 0, 1, 1,
0.818799, -1.290947, 1.155323, 0.7215686, 0, 1, 1,
0.8200799, -0.485084, 4.420975, 0.7294118, 0, 1, 1,
0.8203475, -0.1784462, 2.603359, 0.7333333, 0, 1, 1,
0.8219805, 1.917577, 0.5144058, 0.7411765, 0, 1, 1,
0.8269052, 0.8386649, -0.0526697, 0.7450981, 0, 1, 1,
0.8300059, -0.3843496, 3.868524, 0.7529412, 0, 1, 1,
0.8322181, 1.754783, 1.404295, 0.7568628, 0, 1, 1,
0.8324408, 0.4826136, 0.4250221, 0.7647059, 0, 1, 1,
0.8334813, -0.8479477, 1.0235, 0.7686275, 0, 1, 1,
0.8344557, -0.3956757, 2.206112, 0.7764706, 0, 1, 1,
0.8362815, -3.148614, 3.882539, 0.7803922, 0, 1, 1,
0.8425185, 0.9871266, 2.255256, 0.7882353, 0, 1, 1,
0.8451673, 0.5542542, 1.224283, 0.7921569, 0, 1, 1,
0.8459693, 0.04816538, 1.779674, 0.8, 0, 1, 1,
0.8484044, 1.291002, 0.8573159, 0.8078431, 0, 1, 1,
0.8589817, 1.990535, 0.4243508, 0.8117647, 0, 1, 1,
0.8701429, -0.2368247, 0.7879583, 0.8196079, 0, 1, 1,
0.8728858, 0.8895947, -0.6529651, 0.8235294, 0, 1, 1,
0.8740955, -1.928281, 4.321442, 0.8313726, 0, 1, 1,
0.8854588, -0.2148822, 2.088493, 0.8352941, 0, 1, 1,
0.8898088, -0.3376998, -0.9364182, 0.8431373, 0, 1, 1,
0.8993525, 0.9498718, 1.484168, 0.8470588, 0, 1, 1,
0.9010036, 0.2591033, 2.506408, 0.854902, 0, 1, 1,
0.9020135, 0.1284571, 2.98929, 0.8588235, 0, 1, 1,
0.9047368, 1.695929, 0.4190607, 0.8666667, 0, 1, 1,
0.9047671, 0.3570455, 1.708371, 0.8705882, 0, 1, 1,
0.9084243, -0.2372645, 2.13131, 0.8784314, 0, 1, 1,
0.9091967, -0.09254238, 2.053223, 0.8823529, 0, 1, 1,
0.9180058, -1.451745, 3.48626, 0.8901961, 0, 1, 1,
0.9185816, -0.9935973, 3.037683, 0.8941177, 0, 1, 1,
0.9190006, -1.199733, 2.020935, 0.9019608, 0, 1, 1,
0.9345316, -0.5223506, 1.517466, 0.9098039, 0, 1, 1,
0.9349486, -0.2076592, 2.113042, 0.9137255, 0, 1, 1,
0.942785, 0.7272432, -0.8393075, 0.9215686, 0, 1, 1,
0.9457043, 0.006276611, 0.1654137, 0.9254902, 0, 1, 1,
0.9492573, -0.5834865, 2.373907, 0.9333333, 0, 1, 1,
0.9620148, -1.735262, 3.290728, 0.9372549, 0, 1, 1,
0.9637898, -0.06193019, 0.5817491, 0.945098, 0, 1, 1,
0.9646139, 0.2433482, 1.177876, 0.9490196, 0, 1, 1,
0.9668791, -1.028693, 1.98132, 0.9568627, 0, 1, 1,
0.9668813, 0.633777, -0.9323296, 0.9607843, 0, 1, 1,
0.96841, 0.3044446, 0.9552795, 0.9686275, 0, 1, 1,
0.972417, 1.447036, 0.5525079, 0.972549, 0, 1, 1,
0.9766152, -1.703137, 1.993716, 0.9803922, 0, 1, 1,
0.9778619, 1.489194, -0.002589924, 0.9843137, 0, 1, 1,
0.9824777, 1.67448, 0.007486013, 0.9921569, 0, 1, 1,
0.9898944, 0.06493159, 1.694288, 0.9960784, 0, 1, 1,
0.9929907, -1.715695, 3.366204, 1, 0, 0.9960784, 1,
0.9958513, 1.060506, 0.9720134, 1, 0, 0.9882353, 1,
1.000171, 0.02465931, 0.1791067, 1, 0, 0.9843137, 1,
1.005152, -0.6988106, 4.622165, 1, 0, 0.9764706, 1,
1.013456, -0.4966747, 1.680519, 1, 0, 0.972549, 1,
1.013831, 0.6331799, 1.663227, 1, 0, 0.9647059, 1,
1.022923, 0.4422531, 0.9739376, 1, 0, 0.9607843, 1,
1.025553, 1.23965, 1.435907, 1, 0, 0.9529412, 1,
1.033945, 0.1882586, 3.075313, 1, 0, 0.9490196, 1,
1.040977, 1.079703, -1.668449, 1, 0, 0.9411765, 1,
1.041856, 1.194798, -1.264998, 1, 0, 0.9372549, 1,
1.044242, 0.8834503, -0.09037947, 1, 0, 0.9294118, 1,
1.047448, -0.3035146, 2.079189, 1, 0, 0.9254902, 1,
1.047871, 1.457345, -0.03338407, 1, 0, 0.9176471, 1,
1.048715, -0.533407, 3.900382, 1, 0, 0.9137255, 1,
1.053139, -0.129782, 2.699254, 1, 0, 0.9058824, 1,
1.053804, 0.06969551, 0.8011106, 1, 0, 0.9019608, 1,
1.065944, -0.6790679, 3.053653, 1, 0, 0.8941177, 1,
1.094844, -1.303707, 3.862726, 1, 0, 0.8862745, 1,
1.095276, 1.174852, 1.288051, 1, 0, 0.8823529, 1,
1.097133, -0.04473364, 1.014204, 1, 0, 0.8745098, 1,
1.097163, 1.023606, 1.945755, 1, 0, 0.8705882, 1,
1.105752, 0.6825585, -0.305721, 1, 0, 0.8627451, 1,
1.111377, 2.588826, -1.13856, 1, 0, 0.8588235, 1,
1.115244, 0.9496325, 2.317872, 1, 0, 0.8509804, 1,
1.132828, -0.9533556, 0.5634944, 1, 0, 0.8470588, 1,
1.141278, 0.3493097, 0.8872451, 1, 0, 0.8392157, 1,
1.161556, -0.9159424, 2.36908, 1, 0, 0.8352941, 1,
1.162631, 0.6951239, 2.099636, 1, 0, 0.827451, 1,
1.163104, -0.09895564, 1.771131, 1, 0, 0.8235294, 1,
1.173368, -1.212054, 2.256908, 1, 0, 0.8156863, 1,
1.175823, 0.03044941, 0.9665857, 1, 0, 0.8117647, 1,
1.176358, -0.1258237, 1.317527, 1, 0, 0.8039216, 1,
1.186952, -0.3575123, 3.515381, 1, 0, 0.7960784, 1,
1.187018, -1.022614, 2.739966, 1, 0, 0.7921569, 1,
1.207073, -1.008274, 0.9345567, 1, 0, 0.7843137, 1,
1.20865, 0.7493453, -0.05548695, 1, 0, 0.7803922, 1,
1.212172, -0.3518672, 1.0852, 1, 0, 0.772549, 1,
1.21423, 0.7877929, 1.172761, 1, 0, 0.7686275, 1,
1.215007, -0.4935222, 2.681144, 1, 0, 0.7607843, 1,
1.216638, -0.7279959, 3.64361, 1, 0, 0.7568628, 1,
1.220963, -1.438267, 2.591527, 1, 0, 0.7490196, 1,
1.224172, 0.849408, 1.996694, 1, 0, 0.7450981, 1,
1.224753, 0.2905185, -0.6310994, 1, 0, 0.7372549, 1,
1.228654, -0.6627237, 0.9082131, 1, 0, 0.7333333, 1,
1.230635, -1.424905, 2.704198, 1, 0, 0.7254902, 1,
1.236263, 0.8088422, -0.1722985, 1, 0, 0.7215686, 1,
1.253127, -1.200688, 2.412197, 1, 0, 0.7137255, 1,
1.267246, -0.8621674, 1.948717, 1, 0, 0.7098039, 1,
1.270512, 0.3154202, 1.686043, 1, 0, 0.7019608, 1,
1.281038, -0.3279481, 4.545344, 1, 0, 0.6941177, 1,
1.297017, 0.2220125, 2.408302, 1, 0, 0.6901961, 1,
1.30338, -0.8095396, 3.001606, 1, 0, 0.682353, 1,
1.307125, 1.453217, 1.72899, 1, 0, 0.6784314, 1,
1.309555, 0.9779259, 1.958294, 1, 0, 0.6705883, 1,
1.312258, -0.6526695, 2.633749, 1, 0, 0.6666667, 1,
1.315574, -0.6618915, 3.347934, 1, 0, 0.6588235, 1,
1.316174, -0.4107774, 1.168455, 1, 0, 0.654902, 1,
1.32178, 2.470913, 1.557921, 1, 0, 0.6470588, 1,
1.322149, 0.9715898, -0.2848428, 1, 0, 0.6431373, 1,
1.331583, 1.098149, 0.4573961, 1, 0, 0.6352941, 1,
1.332175, -0.4488083, 0.9020896, 1, 0, 0.6313726, 1,
1.33403, -0.6904227, 1.271731, 1, 0, 0.6235294, 1,
1.334459, 0.241276, 2.510458, 1, 0, 0.6196079, 1,
1.3345, 0.5799535, 0.01737797, 1, 0, 0.6117647, 1,
1.338792, -1.797001, 2.883131, 1, 0, 0.6078432, 1,
1.339081, 0.1948805, 1.760863, 1, 0, 0.6, 1,
1.343183, -0.5189487, 3.570463, 1, 0, 0.5921569, 1,
1.344562, 2.080962, -1.356164, 1, 0, 0.5882353, 1,
1.35272, 0.912704, 0.9021291, 1, 0, 0.5803922, 1,
1.357133, 0.2177131, -0.4717234, 1, 0, 0.5764706, 1,
1.357581, 1.620379, 0.5106353, 1, 0, 0.5686275, 1,
1.358428, -1.076547, 3.484474, 1, 0, 0.5647059, 1,
1.359433, -1.120543, 2.656033, 1, 0, 0.5568628, 1,
1.364728, -0.1562393, 0.8177455, 1, 0, 0.5529412, 1,
1.366337, 0.1562775, 3.233804, 1, 0, 0.5450981, 1,
1.371038, -1.93674, 3.871661, 1, 0, 0.5411765, 1,
1.391288, -0.5351513, 1.553673, 1, 0, 0.5333334, 1,
1.403427, 0.3094124, 0.4112419, 1, 0, 0.5294118, 1,
1.406739, -0.8945373, -0.6237137, 1, 0, 0.5215687, 1,
1.417136, -0.4978726, 3.538049, 1, 0, 0.5176471, 1,
1.425699, 0.4564918, 0.8285482, 1, 0, 0.509804, 1,
1.427693, 1.205823, 0.6207489, 1, 0, 0.5058824, 1,
1.432714, -0.2579764, 1.632403, 1, 0, 0.4980392, 1,
1.434611, -0.1549819, 0.2366595, 1, 0, 0.4901961, 1,
1.436481, 0.5611546, 2.222914, 1, 0, 0.4862745, 1,
1.439941, 1.580674, 0.6039881, 1, 0, 0.4784314, 1,
1.452247, 0.3258614, 2.896279, 1, 0, 0.4745098, 1,
1.457673, -1.013063, 1.523291, 1, 0, 0.4666667, 1,
1.460972, 2.316337, -0.4079112, 1, 0, 0.4627451, 1,
1.481564, -1.018027, 3.425493, 1, 0, 0.454902, 1,
1.488173, -0.6052345, 0.412802, 1, 0, 0.4509804, 1,
1.49608, -0.8430529, 2.106388, 1, 0, 0.4431373, 1,
1.497559, 0.6688879, 1.461637, 1, 0, 0.4392157, 1,
1.510573, 0.01796772, 1.455679, 1, 0, 0.4313726, 1,
1.5183, 0.3571304, 1.280772, 1, 0, 0.427451, 1,
1.527583, -1.21086, 2.709427, 1, 0, 0.4196078, 1,
1.53205, -1.142198, 3.098226, 1, 0, 0.4156863, 1,
1.539864, 0.3042653, 1.5667, 1, 0, 0.4078431, 1,
1.540074, -0.6014655, 2.099257, 1, 0, 0.4039216, 1,
1.549713, 0.03612101, 2.253181, 1, 0, 0.3960784, 1,
1.553496, 1.428444, -0.937781, 1, 0, 0.3882353, 1,
1.554988, 0.08006138, 1.923126, 1, 0, 0.3843137, 1,
1.571179, 1.323404, 1.809917, 1, 0, 0.3764706, 1,
1.574151, 0.4520786, 1.31604, 1, 0, 0.372549, 1,
1.579015, 1.483828, -0.761625, 1, 0, 0.3647059, 1,
1.586348, -1.225772, 2.888274, 1, 0, 0.3607843, 1,
1.593775, -1.05709, 2.872547, 1, 0, 0.3529412, 1,
1.597171, -0.8943163, 1.148885, 1, 0, 0.3490196, 1,
1.598349, 0.1249943, 2.115648, 1, 0, 0.3411765, 1,
1.608717, -0.3000776, 4.438754, 1, 0, 0.3372549, 1,
1.625077, 1.540995, 0.8029031, 1, 0, 0.3294118, 1,
1.626616, 1.477134, -1.606825, 1, 0, 0.3254902, 1,
1.648689, -0.875874, 3.71744, 1, 0, 0.3176471, 1,
1.651979, -0.630645, 1.621923, 1, 0, 0.3137255, 1,
1.653269, -1.12071, 0.5502279, 1, 0, 0.3058824, 1,
1.674623, -0.3688502, 2.632492, 1, 0, 0.2980392, 1,
1.680687, -0.3745455, 2.93794, 1, 0, 0.2941177, 1,
1.696371, 1.072003, 2.752494, 1, 0, 0.2862745, 1,
1.708873, -1.435101, 1.550149, 1, 0, 0.282353, 1,
1.713471, 0.02237055, 2.413731, 1, 0, 0.2745098, 1,
1.713907, -0.5568848, 0.8907384, 1, 0, 0.2705882, 1,
1.714282, -0.179155, 2.617201, 1, 0, 0.2627451, 1,
1.719471, -0.1943502, 0.3915896, 1, 0, 0.2588235, 1,
1.720957, 0.3916647, 3.353344, 1, 0, 0.2509804, 1,
1.741754, -0.8465908, 2.211146, 1, 0, 0.2470588, 1,
1.742934, -0.241929, 2.224209, 1, 0, 0.2392157, 1,
1.752429, -0.9150043, 1.700387, 1, 0, 0.2352941, 1,
1.767962, 1.415854, 0.4880292, 1, 0, 0.227451, 1,
1.787798, 0.9955856, 1.897153, 1, 0, 0.2235294, 1,
1.830119, 1.757874, 0.3580031, 1, 0, 0.2156863, 1,
1.839649, 0.5270876, 1.224428, 1, 0, 0.2117647, 1,
1.844292, -0.1860597, 1.934072, 1, 0, 0.2039216, 1,
1.84441, 0.3824807, 1.356825, 1, 0, 0.1960784, 1,
1.869332, -0.1899046, 2.981142, 1, 0, 0.1921569, 1,
1.881095, -1.386075, 2.349828, 1, 0, 0.1843137, 1,
1.896361, 0.7263625, 0.9666709, 1, 0, 0.1803922, 1,
1.899333, 0.0404901, 0.3630197, 1, 0, 0.172549, 1,
1.920662, 1.013554, 0.6759179, 1, 0, 0.1686275, 1,
1.94597, -0.3069702, 0.3212997, 1, 0, 0.1607843, 1,
1.950203, -0.4980982, 3.074641, 1, 0, 0.1568628, 1,
1.956997, -0.2825197, 1.577357, 1, 0, 0.1490196, 1,
1.959132, 0.7355994, 0.558651, 1, 0, 0.145098, 1,
1.965817, 1.155477, -0.04393538, 1, 0, 0.1372549, 1,
2.000134, 0.4951638, 3.57174, 1, 0, 0.1333333, 1,
2.027114, 0.1235979, 1.320455, 1, 0, 0.1254902, 1,
2.085523, 0.4280908, 3.158273, 1, 0, 0.1215686, 1,
2.092448, -1.134323, 2.385106, 1, 0, 0.1137255, 1,
2.118186, 0.612414, -0.8666002, 1, 0, 0.1098039, 1,
2.123714, 1.151532, 1.637887, 1, 0, 0.1019608, 1,
2.14727, -0.008703574, 2.694328, 1, 0, 0.09411765, 1,
2.272226, 1.011788, 0.2877253, 1, 0, 0.09019608, 1,
2.287588, 1.409143, 2.633199, 1, 0, 0.08235294, 1,
2.288619, 0.03683205, 2.938708, 1, 0, 0.07843138, 1,
2.306299, -0.3470661, 0.8054997, 1, 0, 0.07058824, 1,
2.312994, -2.195384, 0.6950551, 1, 0, 0.06666667, 1,
2.322975, 0.3313766, 1.121469, 1, 0, 0.05882353, 1,
2.347169, 1.911833, 0.5726895, 1, 0, 0.05490196, 1,
2.473166, -1.074712, 1.729403, 1, 0, 0.04705882, 1,
2.509687, 0.5887821, 1.827287, 1, 0, 0.04313726, 1,
2.521861, -1.399411, 2.877782, 1, 0, 0.03529412, 1,
2.572261, 1.667026, 0.06514478, 1, 0, 0.03137255, 1,
2.575451, 1.731341, 0.8318971, 1, 0, 0.02352941, 1,
2.623239, 1.169112, 1.838409, 1, 0, 0.01960784, 1,
2.933679, -0.2490712, 1.467658, 1, 0, 0.01176471, 1,
3.183813, 0.2607804, 0.8108783, 1, 0, 0.007843138, 1
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
0.2575492, -4.145028, -6.941992, 0, -0.5, 0.5, 0.5,
0.2575492, -4.145028, -6.941992, 1, -0.5, 0.5, 0.5,
0.2575492, -4.145028, -6.941992, 1, 1.5, 0.5, 0.5,
0.2575492, -4.145028, -6.941992, 0, 1.5, 0.5, 0.5
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
-3.660718, -0.2093413, -6.941992, 0, -0.5, 0.5, 0.5,
-3.660718, -0.2093413, -6.941992, 1, -0.5, 0.5, 0.5,
-3.660718, -0.2093413, -6.941992, 1, 1.5, 0.5, 0.5,
-3.660718, -0.2093413, -6.941992, 0, 1.5, 0.5, 0.5
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
-3.660718, -4.145028, 0.05456972, 0, -0.5, 0.5, 0.5,
-3.660718, -4.145028, 0.05456972, 1, -0.5, 0.5, 0.5,
-3.660718, -4.145028, 0.05456972, 1, 1.5, 0.5, 0.5,
-3.660718, -4.145028, 0.05456972, 0, 1.5, 0.5, 0.5
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
-2, -3.236793, -5.327401,
3, -3.236793, -5.327401,
-2, -3.236793, -5.327401,
-2, -3.388165, -5.596499,
-1, -3.236793, -5.327401,
-1, -3.388165, -5.596499,
0, -3.236793, -5.327401,
0, -3.388165, -5.596499,
1, -3.236793, -5.327401,
1, -3.388165, -5.596499,
2, -3.236793, -5.327401,
2, -3.388165, -5.596499,
3, -3.236793, -5.327401,
3, -3.388165, -5.596499
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
-2, -3.69091, -6.134696, 0, -0.5, 0.5, 0.5,
-2, -3.69091, -6.134696, 1, -0.5, 0.5, 0.5,
-2, -3.69091, -6.134696, 1, 1.5, 0.5, 0.5,
-2, -3.69091, -6.134696, 0, 1.5, 0.5, 0.5,
-1, -3.69091, -6.134696, 0, -0.5, 0.5, 0.5,
-1, -3.69091, -6.134696, 1, -0.5, 0.5, 0.5,
-1, -3.69091, -6.134696, 1, 1.5, 0.5, 0.5,
-1, -3.69091, -6.134696, 0, 1.5, 0.5, 0.5,
0, -3.69091, -6.134696, 0, -0.5, 0.5, 0.5,
0, -3.69091, -6.134696, 1, -0.5, 0.5, 0.5,
0, -3.69091, -6.134696, 1, 1.5, 0.5, 0.5,
0, -3.69091, -6.134696, 0, 1.5, 0.5, 0.5,
1, -3.69091, -6.134696, 0, -0.5, 0.5, 0.5,
1, -3.69091, -6.134696, 1, -0.5, 0.5, 0.5,
1, -3.69091, -6.134696, 1, 1.5, 0.5, 0.5,
1, -3.69091, -6.134696, 0, 1.5, 0.5, 0.5,
2, -3.69091, -6.134696, 0, -0.5, 0.5, 0.5,
2, -3.69091, -6.134696, 1, -0.5, 0.5, 0.5,
2, -3.69091, -6.134696, 1, 1.5, 0.5, 0.5,
2, -3.69091, -6.134696, 0, 1.5, 0.5, 0.5,
3, -3.69091, -6.134696, 0, -0.5, 0.5, 0.5,
3, -3.69091, -6.134696, 1, -0.5, 0.5, 0.5,
3, -3.69091, -6.134696, 1, 1.5, 0.5, 0.5,
3, -3.69091, -6.134696, 0, 1.5, 0.5, 0.5
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
-2.756502, -3, -5.327401,
-2.756502, 2, -5.327401,
-2.756502, -3, -5.327401,
-2.907205, -3, -5.596499,
-2.756502, -2, -5.327401,
-2.907205, -2, -5.596499,
-2.756502, -1, -5.327401,
-2.907205, -1, -5.596499,
-2.756502, 0, -5.327401,
-2.907205, 0, -5.596499,
-2.756502, 1, -5.327401,
-2.907205, 1, -5.596499,
-2.756502, 2, -5.327401,
-2.907205, 2, -5.596499
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
-3.20861, -3, -6.134696, 0, -0.5, 0.5, 0.5,
-3.20861, -3, -6.134696, 1, -0.5, 0.5, 0.5,
-3.20861, -3, -6.134696, 1, 1.5, 0.5, 0.5,
-3.20861, -3, -6.134696, 0, 1.5, 0.5, 0.5,
-3.20861, -2, -6.134696, 0, -0.5, 0.5, 0.5,
-3.20861, -2, -6.134696, 1, -0.5, 0.5, 0.5,
-3.20861, -2, -6.134696, 1, 1.5, 0.5, 0.5,
-3.20861, -2, -6.134696, 0, 1.5, 0.5, 0.5,
-3.20861, -1, -6.134696, 0, -0.5, 0.5, 0.5,
-3.20861, -1, -6.134696, 1, -0.5, 0.5, 0.5,
-3.20861, -1, -6.134696, 1, 1.5, 0.5, 0.5,
-3.20861, -1, -6.134696, 0, 1.5, 0.5, 0.5,
-3.20861, 0, -6.134696, 0, -0.5, 0.5, 0.5,
-3.20861, 0, -6.134696, 1, -0.5, 0.5, 0.5,
-3.20861, 0, -6.134696, 1, 1.5, 0.5, 0.5,
-3.20861, 0, -6.134696, 0, 1.5, 0.5, 0.5,
-3.20861, 1, -6.134696, 0, -0.5, 0.5, 0.5,
-3.20861, 1, -6.134696, 1, -0.5, 0.5, 0.5,
-3.20861, 1, -6.134696, 1, 1.5, 0.5, 0.5,
-3.20861, 1, -6.134696, 0, 1.5, 0.5, 0.5,
-3.20861, 2, -6.134696, 0, -0.5, 0.5, 0.5,
-3.20861, 2, -6.134696, 1, -0.5, 0.5, 0.5,
-3.20861, 2, -6.134696, 1, 1.5, 0.5, 0.5,
-3.20861, 2, -6.134696, 0, 1.5, 0.5, 0.5
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
-2.756502, -3.236793, -4,
-2.756502, -3.236793, 4,
-2.756502, -3.236793, -4,
-2.907205, -3.388165, -4,
-2.756502, -3.236793, -2,
-2.907205, -3.388165, -2,
-2.756502, -3.236793, 0,
-2.907205, -3.388165, 0,
-2.756502, -3.236793, 2,
-2.907205, -3.388165, 2,
-2.756502, -3.236793, 4,
-2.907205, -3.388165, 4
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
-3.20861, -3.69091, -4, 0, -0.5, 0.5, 0.5,
-3.20861, -3.69091, -4, 1, -0.5, 0.5, 0.5,
-3.20861, -3.69091, -4, 1, 1.5, 0.5, 0.5,
-3.20861, -3.69091, -4, 0, 1.5, 0.5, 0.5,
-3.20861, -3.69091, -2, 0, -0.5, 0.5, 0.5,
-3.20861, -3.69091, -2, 1, -0.5, 0.5, 0.5,
-3.20861, -3.69091, -2, 1, 1.5, 0.5, 0.5,
-3.20861, -3.69091, -2, 0, 1.5, 0.5, 0.5,
-3.20861, -3.69091, 0, 0, -0.5, 0.5, 0.5,
-3.20861, -3.69091, 0, 1, -0.5, 0.5, 0.5,
-3.20861, -3.69091, 0, 1, 1.5, 0.5, 0.5,
-3.20861, -3.69091, 0, 0, 1.5, 0.5, 0.5,
-3.20861, -3.69091, 2, 0, -0.5, 0.5, 0.5,
-3.20861, -3.69091, 2, 1, -0.5, 0.5, 0.5,
-3.20861, -3.69091, 2, 1, 1.5, 0.5, 0.5,
-3.20861, -3.69091, 2, 0, 1.5, 0.5, 0.5,
-3.20861, -3.69091, 4, 0, -0.5, 0.5, 0.5,
-3.20861, -3.69091, 4, 1, -0.5, 0.5, 0.5,
-3.20861, -3.69091, 4, 1, 1.5, 0.5, 0.5,
-3.20861, -3.69091, 4, 0, 1.5, 0.5, 0.5
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
-2.756502, -3.236793, -5.327401,
-2.756502, 2.81811, -5.327401,
-2.756502, -3.236793, 5.43654,
-2.756502, 2.81811, 5.43654,
-2.756502, -3.236793, -5.327401,
-2.756502, -3.236793, 5.43654,
-2.756502, 2.81811, -5.327401,
-2.756502, 2.81811, 5.43654,
-2.756502, -3.236793, -5.327401,
3.271601, -3.236793, -5.327401,
-2.756502, -3.236793, 5.43654,
3.271601, -3.236793, 5.43654,
-2.756502, 2.81811, -5.327401,
3.271601, 2.81811, -5.327401,
-2.756502, 2.81811, 5.43654,
3.271601, 2.81811, 5.43654,
3.271601, -3.236793, -5.327401,
3.271601, 2.81811, -5.327401,
3.271601, -3.236793, 5.43654,
3.271601, 2.81811, 5.43654,
3.271601, -3.236793, -5.327401,
3.271601, -3.236793, 5.43654,
3.271601, 2.81811, -5.327401,
3.271601, 2.81811, 5.43654
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
var radius = 7.338345;
var distance = 32.64912;
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
mvMatrix.translate( -0.2575492, 0.2093413, -0.05456972 );
mvMatrix.scale( 1.316229, 1.310403, 0.7371243 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.64912);
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
DDE<-read.table("DDE.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.668715, 0.93958, -0.2458665, 0, 0, 1, 1, 1,
-2.584732, 1.3093, -3.471754, 1, 0, 0, 1, 1,
-2.489702, -2.221393, -2.502269, 1, 0, 0, 1, 1,
-2.34601, -0.01301748, -2.004496, 1, 0, 0, 1, 1,
-2.327961, 2.729932, -0.298698, 1, 0, 0, 1, 1,
-2.313634, 1.35686, -1.875207, 1, 0, 0, 1, 1,
-2.276812, -2.075705, -0.5536549, 0, 0, 0, 1, 1,
-2.231803, -0.1674079, -1.905805, 0, 0, 0, 1, 1,
-2.224552, -1.141253, -1.668193, 0, 0, 0, 1, 1,
-2.186485, 1.456622, 0.1127108, 0, 0, 0, 1, 1,
-2.107539, -1.906782, -3.105422, 0, 0, 0, 1, 1,
-2.082371, 0.007710304, -2.044443, 0, 0, 0, 1, 1,
-2.067996, -1.031607, -2.538331, 0, 0, 0, 1, 1,
-2.065414, 2.054891, -2.878736, 1, 1, 1, 1, 1,
-2.051239, 1.624176, -1.790321, 1, 1, 1, 1, 1,
-2.042994, 0.9653355, -1.031531, 1, 1, 1, 1, 1,
-2.03597, 0.1954798, -0.09117644, 1, 1, 1, 1, 1,
-2.011977, 0.01714991, -0.2439895, 1, 1, 1, 1, 1,
-1.999023, 0.4594108, -0.2567517, 1, 1, 1, 1, 1,
-1.987038, -0.4062692, -2.851606, 1, 1, 1, 1, 1,
-1.985278, -1.378423, -2.633021, 1, 1, 1, 1, 1,
-1.969235, -0.06737417, -1.848723, 1, 1, 1, 1, 1,
-1.945643, 0.2241646, -1.240005, 1, 1, 1, 1, 1,
-1.940294, 1.341669, -0.3129848, 1, 1, 1, 1, 1,
-1.920582, -1.560868, -2.433595, 1, 1, 1, 1, 1,
-1.900932, 0.9693239, -0.8806279, 1, 1, 1, 1, 1,
-1.872936, 0.2954634, -0.8551528, 1, 1, 1, 1, 1,
-1.871695, 0.8706888, -1.408373, 1, 1, 1, 1, 1,
-1.856746, 1.0891, 0.3761487, 0, 0, 1, 1, 1,
-1.849701, 0.914575, -0.06782463, 1, 0, 0, 1, 1,
-1.834986, -0.04411397, -1.373615, 1, 0, 0, 1, 1,
-1.834343, 0.1775322, -1.084332, 1, 0, 0, 1, 1,
-1.833898, -0.8758807, -2.854497, 1, 0, 0, 1, 1,
-1.831319, -2.000928, -2.708863, 1, 0, 0, 1, 1,
-1.830443, 0.293849, -1.378318, 0, 0, 0, 1, 1,
-1.827034, -0.7083223, -2.514292, 0, 0, 0, 1, 1,
-1.803991, 0.7048637, -0.2217861, 0, 0, 0, 1, 1,
-1.796399, 1.050241, 0.8129867, 0, 0, 0, 1, 1,
-1.794511, -0.9697148, -0.6925735, 0, 0, 0, 1, 1,
-1.790241, 2.365983, -0.9513915, 0, 0, 0, 1, 1,
-1.760754, 0.7220117, 1.068786, 0, 0, 0, 1, 1,
-1.749131, -1.658839, -2.536726, 1, 1, 1, 1, 1,
-1.74867, -0.01852961, -2.16058, 1, 1, 1, 1, 1,
-1.744827, -0.7840002, -0.4390177, 1, 1, 1, 1, 1,
-1.738574, 0.8038218, -2.144881, 1, 1, 1, 1, 1,
-1.735903, 0.002608314, -2.973796, 1, 1, 1, 1, 1,
-1.727569, 0.5670272, -2.31828, 1, 1, 1, 1, 1,
-1.725536, -0.9793036, -3.803927, 1, 1, 1, 1, 1,
-1.711924, -0.5463497, -2.065338, 1, 1, 1, 1, 1,
-1.703142, -0.003026857, -0.4460053, 1, 1, 1, 1, 1,
-1.69833, 0.7317804, -2.20331, 1, 1, 1, 1, 1,
-1.697757, 0.06573714, -3.214959, 1, 1, 1, 1, 1,
-1.697371, 0.3679412, -1.022266, 1, 1, 1, 1, 1,
-1.656505, 0.4998376, -3.080397, 1, 1, 1, 1, 1,
-1.643401, 0.3085529, -1.240041, 1, 1, 1, 1, 1,
-1.636051, -0.5470161, -1.502008, 1, 1, 1, 1, 1,
-1.6305, 0.8670591, -2.495766, 0, 0, 1, 1, 1,
-1.609753, 0.6089994, -2.074501, 1, 0, 0, 1, 1,
-1.596747, -1.81618, -3.439478, 1, 0, 0, 1, 1,
-1.591003, 1.384978, -1.098962, 1, 0, 0, 1, 1,
-1.582, 1.122958, -1.520534, 1, 0, 0, 1, 1,
-1.557584, -0.8299235, -4.251681, 1, 0, 0, 1, 1,
-1.545347, 2.297556, -0.5453234, 0, 0, 0, 1, 1,
-1.519942, 0.5108449, -0.7478098, 0, 0, 0, 1, 1,
-1.512871, -0.911445, -3.51639, 0, 0, 0, 1, 1,
-1.49834, -0.793216, -1.866439, 0, 0, 0, 1, 1,
-1.488187, 2.445966, 0.9063249, 0, 0, 0, 1, 1,
-1.485143, -1.383117, -2.577706, 0, 0, 0, 1, 1,
-1.484087, -1.301101, -2.291209, 0, 0, 0, 1, 1,
-1.482535, -1.110265, -1.072587, 1, 1, 1, 1, 1,
-1.482373, -0.3482947, 0.2316777, 1, 1, 1, 1, 1,
-1.472534, 0.1151168, -0.6913959, 1, 1, 1, 1, 1,
-1.466072, 1.465145, 0.9534842, 1, 1, 1, 1, 1,
-1.455632, -1.398863, -2.675193, 1, 1, 1, 1, 1,
-1.453415, -1.22233, -2.176156, 1, 1, 1, 1, 1,
-1.44976, -0.6958356, -2.576339, 1, 1, 1, 1, 1,
-1.444584, -0.3110168, -1.529743, 1, 1, 1, 1, 1,
-1.443332, -0.9742486, 0.8678319, 1, 1, 1, 1, 1,
-1.44038, -0.8623685, -2.18423, 1, 1, 1, 1, 1,
-1.439296, -0.9989484, -1.879515, 1, 1, 1, 1, 1,
-1.430166, 0.6556337, -0.3134831, 1, 1, 1, 1, 1,
-1.427988, -0.5575463, -1.603047, 1, 1, 1, 1, 1,
-1.422482, 0.411332, -2.818568, 1, 1, 1, 1, 1,
-1.422231, -0.5960214, -2.019814, 1, 1, 1, 1, 1,
-1.412382, -2.586749, -3.239187, 0, 0, 1, 1, 1,
-1.4113, -0.8104108, -0.7431312, 1, 0, 0, 1, 1,
-1.410217, 1.671244, 0.2366359, 1, 0, 0, 1, 1,
-1.409334, 1.407209, -1.564628, 1, 0, 0, 1, 1,
-1.398503, -0.6394757, -0.9619683, 1, 0, 0, 1, 1,
-1.377215, 0.7422738, -0.2866401, 1, 0, 0, 1, 1,
-1.351486, 1.340045, -1.34838, 0, 0, 0, 1, 1,
-1.346131, 1.486962, -2.136351, 0, 0, 0, 1, 1,
-1.345397, 0.5074027, -0.5867856, 0, 0, 0, 1, 1,
-1.343299, -0.003435225, -1.204931, 0, 0, 0, 1, 1,
-1.343207, -0.6876802, -3.776623, 0, 0, 0, 1, 1,
-1.335694, 0.4353265, -1.700426, 0, 0, 0, 1, 1,
-1.325678, 0.986922, -0.4792942, 0, 0, 0, 1, 1,
-1.321958, -2.155723, -2.992016, 1, 1, 1, 1, 1,
-1.320429, 0.0129081, 0.05879671, 1, 1, 1, 1, 1,
-1.306741, 1.054041, -0.5105791, 1, 1, 1, 1, 1,
-1.296284, -0.5189606, -4.445585, 1, 1, 1, 1, 1,
-1.29357, -0.8035262, 0.1105814, 1, 1, 1, 1, 1,
-1.290096, 1.891225, 0.2915489, 1, 1, 1, 1, 1,
-1.286302, 1.361549, -2.04088, 1, 1, 1, 1, 1,
-1.282339, 0.1487089, -1.714084, 1, 1, 1, 1, 1,
-1.274006, 1.349125, 0.3095048, 1, 1, 1, 1, 1,
-1.273117, 0.5603426, 0.4751836, 1, 1, 1, 1, 1,
-1.26521, 0.01453404, -1.30306, 1, 1, 1, 1, 1,
-1.257856, 0.4407537, -1.500217, 1, 1, 1, 1, 1,
-1.247895, 0.2428331, 0.1299294, 1, 1, 1, 1, 1,
-1.243109, 0.7273939, -2.750304, 1, 1, 1, 1, 1,
-1.232425, -0.1197798, 0.7253504, 1, 1, 1, 1, 1,
-1.230759, 0.2714225, -0.647894, 0, 0, 1, 1, 1,
-1.230676, 0.6211969, -0.00705765, 1, 0, 0, 1, 1,
-1.225058, -0.5854667, -3.253831, 1, 0, 0, 1, 1,
-1.222305, 1.612313, -1.575652, 1, 0, 0, 1, 1,
-1.214238, -1.948878, -2.369628, 1, 0, 0, 1, 1,
-1.204444, 1.590669, -0.4919568, 1, 0, 0, 1, 1,
-1.204364, -0.8165402, -1.635622, 0, 0, 0, 1, 1,
-1.201466, -0.1738577, -3.091504, 0, 0, 0, 1, 1,
-1.197958, -0.8473731, -0.1941688, 0, 0, 0, 1, 1,
-1.191625, 0.3002315, -1.855664, 0, 0, 0, 1, 1,
-1.18449, 0.2652171, -0.4702858, 0, 0, 0, 1, 1,
-1.166104, -0.7932155, -1.92676, 0, 0, 0, 1, 1,
-1.161357, -2.025345, -4.131389, 0, 0, 0, 1, 1,
-1.159931, 0.01229471, -1.645157, 1, 1, 1, 1, 1,
-1.154012, 0.8390566, 0.4875793, 1, 1, 1, 1, 1,
-1.14363, 0.05401351, -1.133604, 1, 1, 1, 1, 1,
-1.141311, -1.078814, -2.64276, 1, 1, 1, 1, 1,
-1.136469, 1.488725, -1.853401, 1, 1, 1, 1, 1,
-1.134977, -1.231211, -2.234868, 1, 1, 1, 1, 1,
-1.134737, -1.015067, -3.651364, 1, 1, 1, 1, 1,
-1.119344, -0.09691183, -2.895609, 1, 1, 1, 1, 1,
-1.112593, 0.6211245, -0.4880504, 1, 1, 1, 1, 1,
-1.110872, -0.4541804, -1.174773, 1, 1, 1, 1, 1,
-1.108387, 0.1682381, 0.2839682, 1, 1, 1, 1, 1,
-1.101505, -0.4103537, -2.377567, 1, 1, 1, 1, 1,
-1.097244, -0.7056394, -2.125598, 1, 1, 1, 1, 1,
-1.082684, -0.07998913, -0.5599273, 1, 1, 1, 1, 1,
-1.080585, -0.3914748, -1.315828, 1, 1, 1, 1, 1,
-1.078742, 0.694238, -1.243408, 0, 0, 1, 1, 1,
-1.078525, -0.04992222, -1.334185, 1, 0, 0, 1, 1,
-1.077618, -0.7695938, -2.226515, 1, 0, 0, 1, 1,
-1.07733, -1.885967, -1.912212, 1, 0, 0, 1, 1,
-1.075242, 0.3038993, -1.382608, 1, 0, 0, 1, 1,
-1.073634, 0.9848844, 0.1539128, 1, 0, 0, 1, 1,
-1.068311, -0.9812352, -1.170603, 0, 0, 0, 1, 1,
-1.066788, 1.180276, -0.8052318, 0, 0, 0, 1, 1,
-1.066386, -1.095456, -1.261091, 0, 0, 0, 1, 1,
-1.051622, -0.5747445, -0.2065724, 0, 0, 0, 1, 1,
-1.049196, 1.486983, 0.2603271, 0, 0, 0, 1, 1,
-1.044922, 0.3153722, 0.3637267, 0, 0, 0, 1, 1,
-1.042791, 1.580824, -0.316797, 0, 0, 0, 1, 1,
-1.041818, -0.132196, -2.608418, 1, 1, 1, 1, 1,
-1.040357, -0.06591627, -0.1031235, 1, 1, 1, 1, 1,
-1.032876, 0.3831697, -1.313605, 1, 1, 1, 1, 1,
-1.02036, 0.2024851, -0.2944838, 1, 1, 1, 1, 1,
-1.017594, 1.5292, 0.8189358, 1, 1, 1, 1, 1,
-1.017458, 0.1276671, -1.202551, 1, 1, 1, 1, 1,
-1.008917, 0.09620114, 0.1254663, 1, 1, 1, 1, 1,
-1.001901, 0.5650646, -1.203023, 1, 1, 1, 1, 1,
-0.9977925, -0.03354815, -1.565718, 1, 1, 1, 1, 1,
-0.9933315, 2.13256, -2.48235, 1, 1, 1, 1, 1,
-0.9932139, 1.424828, -0.5113294, 1, 1, 1, 1, 1,
-0.9924001, 1.52969, -1.501632, 1, 1, 1, 1, 1,
-0.9906595, 0.2294047, -0.5744838, 1, 1, 1, 1, 1,
-0.9869582, 1.370459, 0.3401992, 1, 1, 1, 1, 1,
-0.9866574, -1.628682, -3.069292, 1, 1, 1, 1, 1,
-0.9810849, -2.545403, -4.005595, 0, 0, 1, 1, 1,
-0.9799663, 1.302313, -2.993456, 1, 0, 0, 1, 1,
-0.9746131, 0.3768066, -2.194473, 1, 0, 0, 1, 1,
-0.973991, 2.296534, 0.4920274, 1, 0, 0, 1, 1,
-0.9694749, 0.2006444, -3.47411, 1, 0, 0, 1, 1,
-0.9684766, 1.884714, 0.1286762, 1, 0, 0, 1, 1,
-0.9589759, -1.423172, -3.763757, 0, 0, 0, 1, 1,
-0.9516639, -1.338873, -3.024946, 0, 0, 0, 1, 1,
-0.951017, 1.001572, -1.520071, 0, 0, 0, 1, 1,
-0.94785, 0.1463793, -0.8267304, 0, 0, 0, 1, 1,
-0.9422212, 1.122971, 0.8496952, 0, 0, 0, 1, 1,
-0.9404129, 0.3477573, -0.6934424, 0, 0, 0, 1, 1,
-0.9387308, -1.648723, -2.121092, 0, 0, 0, 1, 1,
-0.9378453, 0.01903837, -1.969278, 1, 1, 1, 1, 1,
-0.9371637, 0.4094768, -2.28121, 1, 1, 1, 1, 1,
-0.9360496, -0.5572025, -1.460785, 1, 1, 1, 1, 1,
-0.931352, -0.2459432, -2.356772, 1, 1, 1, 1, 1,
-0.9194627, -0.5349749, -2.210832, 1, 1, 1, 1, 1,
-0.9152291, -0.2650075, -2.271885, 1, 1, 1, 1, 1,
-0.9100246, 0.2380986, -1.553327, 1, 1, 1, 1, 1,
-0.9051778, 0.3618761, -0.05750808, 1, 1, 1, 1, 1,
-0.9036206, -0.8727743, -1.58752, 1, 1, 1, 1, 1,
-0.9028928, 0.3491274, -0.6858722, 1, 1, 1, 1, 1,
-0.9004295, 0.6020342, -1.316426, 1, 1, 1, 1, 1,
-0.8981785, -1.438237, -2.447153, 1, 1, 1, 1, 1,
-0.8935981, -1.844903, 0.1918068, 1, 1, 1, 1, 1,
-0.8913004, -0.57691, -1.071458, 1, 1, 1, 1, 1,
-0.886497, -1.828426, -2.238975, 1, 1, 1, 1, 1,
-0.8853635, 0.3665107, -2.264409, 0, 0, 1, 1, 1,
-0.8843843, -0.7938641, -3.862285, 1, 0, 0, 1, 1,
-0.8801611, -1.145608, -3.244922, 1, 0, 0, 1, 1,
-0.8798884, 1.495526, -2.537335, 1, 0, 0, 1, 1,
-0.8750479, 0.2435725, 0.03568922, 1, 0, 0, 1, 1,
-0.8728659, 0.5597384, -0.9616109, 1, 0, 0, 1, 1,
-0.8727593, 0.90001, -1.929206, 0, 0, 0, 1, 1,
-0.8642019, 1.080079, -0.815269, 0, 0, 0, 1, 1,
-0.8631654, 0.01350561, -0.5361301, 0, 0, 0, 1, 1,
-0.8528426, -1.46499, -3.096485, 0, 0, 0, 1, 1,
-0.8514135, 0.1558919, -1.23112, 0, 0, 0, 1, 1,
-0.8473142, -1.192889, -1.696969, 0, 0, 0, 1, 1,
-0.8468456, 0.04441336, -1.362591, 0, 0, 0, 1, 1,
-0.8412473, 0.8515653, 0.1393971, 1, 1, 1, 1, 1,
-0.839372, 0.9972193, -0.3628425, 1, 1, 1, 1, 1,
-0.8378868, 0.93686, -0.4931292, 1, 1, 1, 1, 1,
-0.8374674, -0.4113327, -1.618078, 1, 1, 1, 1, 1,
-0.8355494, -0.03964503, -3.336157, 1, 1, 1, 1, 1,
-0.8353162, -0.8630994, -2.490476, 1, 1, 1, 1, 1,
-0.8313028, -0.5547804, -0.4573559, 1, 1, 1, 1, 1,
-0.8262063, -0.6157452, -2.514229, 1, 1, 1, 1, 1,
-0.8225387, 0.7359046, -0.1473484, 1, 1, 1, 1, 1,
-0.8180435, -0.6596373, -2.454755, 1, 1, 1, 1, 1,
-0.81754, 0.6244771, -1.820741, 1, 1, 1, 1, 1,
-0.8171264, -0.003381263, -0.2059733, 1, 1, 1, 1, 1,
-0.8165161, -0.4807245, -1.859066, 1, 1, 1, 1, 1,
-0.8156378, -0.08028898, -1.302167, 1, 1, 1, 1, 1,
-0.8146173, 2.290184, 0.06406899, 1, 1, 1, 1, 1,
-0.8139077, 0.8266497, -0.3878428, 0, 0, 1, 1, 1,
-0.8131242, -0.7523135, -1.493954, 1, 0, 0, 1, 1,
-0.8127233, 0.1271832, -1.898985, 1, 0, 0, 1, 1,
-0.8113644, 1.254356, -1.411529, 1, 0, 0, 1, 1,
-0.8090574, -2.166697, -2.041617, 1, 0, 0, 1, 1,
-0.8089511, -0.8812174, -2.605303, 1, 0, 0, 1, 1,
-0.808547, -0.7029676, -2.323934, 0, 0, 0, 1, 1,
-0.8067967, 0.6628722, -0.6388473, 0, 0, 0, 1, 1,
-0.8005912, -0.03096448, 0.368049, 0, 0, 0, 1, 1,
-0.7964923, -0.3878191, -1.871259, 0, 0, 0, 1, 1,
-0.7902865, 0.8937401, -0.907887, 0, 0, 0, 1, 1,
-0.786956, 0.1878632, -1.547245, 0, 0, 0, 1, 1,
-0.7861685, 1.06687, -2.399263, 0, 0, 0, 1, 1,
-0.7857226, 0.3252521, -2.062785, 1, 1, 1, 1, 1,
-0.7842621, 0.533156, -0.8288094, 1, 1, 1, 1, 1,
-0.7833611, -0.00578437, 0.1364579, 1, 1, 1, 1, 1,
-0.7806962, 0.9631447, -1.592474, 1, 1, 1, 1, 1,
-0.7796538, -0.2329513, -1.711992, 1, 1, 1, 1, 1,
-0.7724912, -0.8934629, -3.846723, 1, 1, 1, 1, 1,
-0.7710876, 0.1760025, -0.5071417, 1, 1, 1, 1, 1,
-0.7686083, -0.9550495, -3.100966, 1, 1, 1, 1, 1,
-0.7651283, -1.170017, -1.84182, 1, 1, 1, 1, 1,
-0.7638482, -1.831461, -1.58202, 1, 1, 1, 1, 1,
-0.7535226, -0.5802062, -0.8687131, 1, 1, 1, 1, 1,
-0.7510433, -1.795097, -2.486111, 1, 1, 1, 1, 1,
-0.7423528, 0.5262138, -2.58426, 1, 1, 1, 1, 1,
-0.7421728, 0.4513816, -1.726115, 1, 1, 1, 1, 1,
-0.7412869, -1.856964, -3.684426, 1, 1, 1, 1, 1,
-0.7253367, 0.3946891, -0.0005050797, 0, 0, 1, 1, 1,
-0.7250639, 2.161732, -1.065954, 1, 0, 0, 1, 1,
-0.7205085, 0.8957846, -0.9656412, 1, 0, 0, 1, 1,
-0.7201812, -1.193498, -1.428295, 1, 0, 0, 1, 1,
-0.7182347, 0.9470896, 0.7930294, 1, 0, 0, 1, 1,
-0.7171138, -1.931611, -3.625401, 1, 0, 0, 1, 1,
-0.7166243, -0.5733924, 0.183557, 0, 0, 0, 1, 1,
-0.7139359, 0.5273255, -1.220333, 0, 0, 0, 1, 1,
-0.7124825, 0.7404549, -0.7610387, 0, 0, 0, 1, 1,
-0.7120159, -0.148803, -2.417911, 0, 0, 0, 1, 1,
-0.711601, -1.161586, -2.301383, 0, 0, 0, 1, 1,
-0.7112483, 0.3820691, -1.688782, 0, 0, 0, 1, 1,
-0.7106986, 0.1543426, -1.031003, 0, 0, 0, 1, 1,
-0.7106915, -0.1523352, -0.4259609, 1, 1, 1, 1, 1,
-0.7072822, 0.6280052, 0.3557721, 1, 1, 1, 1, 1,
-0.7021263, 0.1037358, -0.8227623, 1, 1, 1, 1, 1,
-0.700526, -0.3544089, -2.723614, 1, 1, 1, 1, 1,
-0.6998125, -0.8035098, -3.269046, 1, 1, 1, 1, 1,
-0.6947581, -1.268176, -3.288429, 1, 1, 1, 1, 1,
-0.6935465, 0.3424097, -1.505393, 1, 1, 1, 1, 1,
-0.6907693, -1.090672, -3.917433, 1, 1, 1, 1, 1,
-0.688756, -0.9019607, -0.7981185, 1, 1, 1, 1, 1,
-0.68007, 0.320607, -1.385857, 1, 1, 1, 1, 1,
-0.6697609, -0.9676105, -3.030631, 1, 1, 1, 1, 1,
-0.6637068, 0.6205291, -2.15518, 1, 1, 1, 1, 1,
-0.6518142, -0.04065719, -2.4979, 1, 1, 1, 1, 1,
-0.6510599, 0.2042517, -1.616335, 1, 1, 1, 1, 1,
-0.6429902, -0.9316665, -3.576614, 1, 1, 1, 1, 1,
-0.6413141, -1.980009, -2.857675, 0, 0, 1, 1, 1,
-0.6397325, 0.4703646, -0.4368947, 1, 0, 0, 1, 1,
-0.6373655, 1.421963, -1.214581, 1, 0, 0, 1, 1,
-0.6275797, 0.05931756, -2.223209, 1, 0, 0, 1, 1,
-0.625959, 0.6548989, -2.409656, 1, 0, 0, 1, 1,
-0.6204419, 1.250403, -2.018965, 1, 0, 0, 1, 1,
-0.618282, -0.04348318, -1.314009, 0, 0, 0, 1, 1,
-0.6180474, 1.575005, -1.165466, 0, 0, 0, 1, 1,
-0.6106203, 0.637051, -1.058122, 0, 0, 0, 1, 1,
-0.5964937, 1.51031, -1.466204, 0, 0, 0, 1, 1,
-0.5906718, 1.974997, -1.740532, 0, 0, 0, 1, 1,
-0.5899547, 0.379625, -3.547114, 0, 0, 0, 1, 1,
-0.587162, 0.7962489, -2.152786, 0, 0, 0, 1, 1,
-0.5870765, 0.972981, 0.5531163, 1, 1, 1, 1, 1,
-0.5864208, 0.004979322, -2.680913, 1, 1, 1, 1, 1,
-0.5829601, -0.2873808, -0.1297259, 1, 1, 1, 1, 1,
-0.5819976, -0.7225391, -4.188486, 1, 1, 1, 1, 1,
-0.57729, 0.2912179, -3.342399, 1, 1, 1, 1, 1,
-0.5737439, -1.700675, -2.311947, 1, 1, 1, 1, 1,
-0.5668105, -1.066257, -1.450209, 1, 1, 1, 1, 1,
-0.5635537, 0.07692698, -0.6557517, 1, 1, 1, 1, 1,
-0.5620754, -0.1858785, -0.1027233, 1, 1, 1, 1, 1,
-0.5584341, 1.644453, -0.09608326, 1, 1, 1, 1, 1,
-0.557759, -0.5290172, -2.65607, 1, 1, 1, 1, 1,
-0.5432957, -0.6826931, -2.998825, 1, 1, 1, 1, 1,
-0.5413214, 0.6517155, -0.5903024, 1, 1, 1, 1, 1,
-0.5390055, 1.035303, -0.5917164, 1, 1, 1, 1, 1,
-0.5377367, 0.6769972, -0.480049, 1, 1, 1, 1, 1,
-0.5344598, 1.161674, -0.09372816, 0, 0, 1, 1, 1,
-0.5258847, -0.7511556, -2.898022, 1, 0, 0, 1, 1,
-0.5204496, -0.6783346, -1.226807, 1, 0, 0, 1, 1,
-0.5177753, -2.573793, -3.691134, 1, 0, 0, 1, 1,
-0.5175064, -0.5896637, -2.559936, 1, 0, 0, 1, 1,
-0.5160525, -0.7317509, -2.875627, 1, 0, 0, 1, 1,
-0.5149807, -0.1856692, -3.076826, 0, 0, 0, 1, 1,
-0.5125486, -0.1581051, -3.660651, 0, 0, 0, 1, 1,
-0.5124934, -0.2414389, -1.509514, 0, 0, 0, 1, 1,
-0.5123302, -0.532583, -0.2017594, 0, 0, 0, 1, 1,
-0.5085726, -1.28327, -2.845867, 0, 0, 0, 1, 1,
-0.5078345, -1.017326, -1.605619, 0, 0, 0, 1, 1,
-0.5064211, 0.9661509, -1.161925, 0, 0, 0, 1, 1,
-0.5063183, -0.6861851, -3.919034, 1, 1, 1, 1, 1,
-0.5036365, -1.172123, -4.755947, 1, 1, 1, 1, 1,
-0.4976847, -1.28021, -3.315417, 1, 1, 1, 1, 1,
-0.4970986, -0.05399182, -2.628, 1, 1, 1, 1, 1,
-0.4954777, 1.193003, -1.079823, 1, 1, 1, 1, 1,
-0.4920305, -1.686124, -2.537841, 1, 1, 1, 1, 1,
-0.4894612, 0.5615793, 0.5297273, 1, 1, 1, 1, 1,
-0.4891758, 0.01866411, -0.4405786, 1, 1, 1, 1, 1,
-0.480673, 0.640869, 0.1728276, 1, 1, 1, 1, 1,
-0.4784198, 0.02915372, -1.5361, 1, 1, 1, 1, 1,
-0.4766879, 0.8255937, -0.179649, 1, 1, 1, 1, 1,
-0.46998, 1.586151, -0.6946443, 1, 1, 1, 1, 1,
-0.4649544, -0.4602296, -1.274059, 1, 1, 1, 1, 1,
-0.464801, 1.202587, -0.1112551, 1, 1, 1, 1, 1,
-0.4629967, 0.5179399, -1.27688, 1, 1, 1, 1, 1,
-0.4628707, 0.07967651, -3.340281, 0, 0, 1, 1, 1,
-0.4584045, 1.116349, 0.2691857, 1, 0, 0, 1, 1,
-0.4557732, -0.9975739, -4.381058, 1, 0, 0, 1, 1,
-0.4459946, 1.344784, -0.905963, 1, 0, 0, 1, 1,
-0.4448842, -0.8258094, -2.038074, 1, 0, 0, 1, 1,
-0.4431385, 0.3591967, -1.293777, 1, 0, 0, 1, 1,
-0.4411143, 1.084383, -0.9414624, 0, 0, 0, 1, 1,
-0.4391281, 0.6497781, 0.3518416, 0, 0, 0, 1, 1,
-0.4327607, 0.5754684, -0.7060189, 0, 0, 0, 1, 1,
-0.4309175, 1.13875, -0.4121608, 0, 0, 0, 1, 1,
-0.4290895, -1.392218, -3.198395, 0, 0, 0, 1, 1,
-0.4249246, 0.2885187, -0.5272153, 0, 0, 0, 1, 1,
-0.4128256, 0.6991456, -0.9105665, 0, 0, 0, 1, 1,
-0.4095951, -0.06532934, -0.5256056, 1, 1, 1, 1, 1,
-0.4078062, -0.6311606, -3.792332, 1, 1, 1, 1, 1,
-0.4069299, 0.02755722, -1.037289, 1, 1, 1, 1, 1,
-0.3971488, -0.1856256, -1.242931, 1, 1, 1, 1, 1,
-0.3969182, 2.14213, -0.007537505, 1, 1, 1, 1, 1,
-0.3934498, -1.338734, -1.669489, 1, 1, 1, 1, 1,
-0.3916394, -1.077516, -4.414782, 1, 1, 1, 1, 1,
-0.3884639, 1.324651, -1.474466, 1, 1, 1, 1, 1,
-0.3873983, 0.2097886, 0.5331187, 1, 1, 1, 1, 1,
-0.3868751, -0.3814238, -1.092614, 1, 1, 1, 1, 1,
-0.3859387, 0.08213089, -0.5989859, 1, 1, 1, 1, 1,
-0.3831159, 0.6032312, -0.3747528, 1, 1, 1, 1, 1,
-0.3822892, 1.034437, -1.755166, 1, 1, 1, 1, 1,
-0.3815789, 1.461044, 0.0943962, 1, 1, 1, 1, 1,
-0.3798006, -1.094951, -3.321519, 1, 1, 1, 1, 1,
-0.3786846, 0.7500865, -1.317298, 0, 0, 1, 1, 1,
-0.374007, 0.01437811, -2.318704, 1, 0, 0, 1, 1,
-0.3712434, -1.841231, -3.901281, 1, 0, 0, 1, 1,
-0.3703077, -0.012946, -1.800764, 1, 0, 0, 1, 1,
-0.3684014, -1.649236, -4.128693, 1, 0, 0, 1, 1,
-0.3659269, 0.08707081, -2.911307, 1, 0, 0, 1, 1,
-0.3633979, 0.7411185, -1.169438, 0, 0, 0, 1, 1,
-0.3598635, -0.558427, -3.217879, 0, 0, 0, 1, 1,
-0.3557491, -0.5781766, -2.922484, 0, 0, 0, 1, 1,
-0.3546442, -0.6481758, -1.959609, 0, 0, 0, 1, 1,
-0.350439, -0.4766993, -1.461327, 0, 0, 0, 1, 1,
-0.350371, -2.270842, -2.060687, 0, 0, 0, 1, 1,
-0.3491656, -1.347744, -2.580393, 0, 0, 0, 1, 1,
-0.3393923, 1.472336, 0.9514217, 1, 1, 1, 1, 1,
-0.3375444, 1.563151, -2.037222, 1, 1, 1, 1, 1,
-0.3365156, 0.5063606, -1.660816, 1, 1, 1, 1, 1,
-0.3360282, -0.03875385, -1.277939, 1, 1, 1, 1, 1,
-0.3307154, 0.4054539, -2.022348, 1, 1, 1, 1, 1,
-0.324847, -0.04732418, -3.445146, 1, 1, 1, 1, 1,
-0.3234721, -0.2432307, -1.939561, 1, 1, 1, 1, 1,
-0.3195205, -0.1680496, -1.714689, 1, 1, 1, 1, 1,
-0.316102, 1.629686, -0.527625, 1, 1, 1, 1, 1,
-0.3153657, 1.67529, 1.484459, 1, 1, 1, 1, 1,
-0.3120429, -0.4168522, -3.934733, 1, 1, 1, 1, 1,
-0.3105132, 0.5890895, 0.9635004, 1, 1, 1, 1, 1,
-0.3075912, -0.9411641, -5.170644, 1, 1, 1, 1, 1,
-0.3068741, -1.783373, -3.586979, 1, 1, 1, 1, 1,
-0.3064653, 2.053771, 0.1203434, 1, 1, 1, 1, 1,
-0.3061015, -0.1281145, -1.726548, 0, 0, 1, 1, 1,
-0.3018094, 0.2480906, -1.076984, 1, 0, 0, 1, 1,
-0.3014808, -1.087355, -2.149823, 1, 0, 0, 1, 1,
-0.2978765, 0.7324028, -0.9289521, 1, 0, 0, 1, 1,
-0.2971291, -0.674153, -2.343716, 1, 0, 0, 1, 1,
-0.2963766, -0.1975507, -1.601226, 1, 0, 0, 1, 1,
-0.2956282, 1.159029, -1.230547, 0, 0, 0, 1, 1,
-0.2955606, 1.568189, 0.08149122, 0, 0, 0, 1, 1,
-0.2932676, -1.650913, -3.088621, 0, 0, 0, 1, 1,
-0.2867654, -0.6166438, -3.378268, 0, 0, 0, 1, 1,
-0.2824175, 1.436711, -0.1871379, 0, 0, 0, 1, 1,
-0.282208, 1.267217, -0.6785136, 0, 0, 0, 1, 1,
-0.2789779, 1.770894, -0.2050139, 0, 0, 0, 1, 1,
-0.2756141, -0.8972825, -4.261361, 1, 1, 1, 1, 1,
-0.2755976, 0.7780509, -1.507969, 1, 1, 1, 1, 1,
-0.2715696, -0.2124438, -0.1143331, 1, 1, 1, 1, 1,
-0.2697112, -0.945258, -2.009209, 1, 1, 1, 1, 1,
-0.2673913, 1.389381, -0.4357767, 1, 1, 1, 1, 1,
-0.2649818, -1.029552, -2.549781, 1, 1, 1, 1, 1,
-0.2647911, 2.296018, 0.09729673, 1, 1, 1, 1, 1,
-0.2638267, -1.136084, -3.33957, 1, 1, 1, 1, 1,
-0.2614617, -0.7590403, -3.317531, 1, 1, 1, 1, 1,
-0.259837, -0.8146805, -4.339491, 1, 1, 1, 1, 1,
-0.2575892, 0.9946312, -1.295861, 1, 1, 1, 1, 1,
-0.2524877, 0.7736866, -0.1355052, 1, 1, 1, 1, 1,
-0.252284, 2.201517, -0.5686207, 1, 1, 1, 1, 1,
-0.2499502, -0.9598559, -1.677466, 1, 1, 1, 1, 1,
-0.2486556, -0.8474425, -3.396998, 1, 1, 1, 1, 1,
-0.2431435, -0.4799896, -3.304651, 0, 0, 1, 1, 1,
-0.2416355, -1.025821, -3.654922, 1, 0, 0, 1, 1,
-0.2398201, -2.533568, -3.567027, 1, 0, 0, 1, 1,
-0.236173, -0.7530217, -2.625299, 1, 0, 0, 1, 1,
-0.2361666, -0.6417249, -4.489921, 1, 0, 0, 1, 1,
-0.2359237, 0.5400152, 1.593817, 1, 0, 0, 1, 1,
-0.2336387, -0.8269573, -2.015624, 0, 0, 0, 1, 1,
-0.2302623, 0.6736528, -1.321456, 0, 0, 0, 1, 1,
-0.226516, -0.9237325, -1.653703, 0, 0, 0, 1, 1,
-0.2196141, -0.003584123, -2.60303, 0, 0, 0, 1, 1,
-0.2170662, 0.9652039, -0.1776041, 0, 0, 0, 1, 1,
-0.2152582, 1.150146, -0.3529191, 0, 0, 0, 1, 1,
-0.210638, -0.3097117, -1.865686, 0, 0, 0, 1, 1,
-0.2068286, -0.4027835, -3.194141, 1, 1, 1, 1, 1,
-0.2043229, 0.2694621, 0.3742357, 1, 1, 1, 1, 1,
-0.1999378, -1.512975, -4.77577, 1, 1, 1, 1, 1,
-0.198726, -1.051109, -1.402068, 1, 1, 1, 1, 1,
-0.1980568, -0.6929119, -0.4796735, 1, 1, 1, 1, 1,
-0.1950241, -0.9773515, -2.420944, 1, 1, 1, 1, 1,
-0.1912361, -0.05146401, -0.8849803, 1, 1, 1, 1, 1,
-0.1899101, 0.03960784, 2.256814, 1, 1, 1, 1, 1,
-0.1893903, 1.166107, 0.274962, 1, 1, 1, 1, 1,
-0.1840541, -0.2443698, -2.917507, 1, 1, 1, 1, 1,
-0.1820835, 1.442196, 0.6774461, 1, 1, 1, 1, 1,
-0.1810953, -0.5469694, -3.245065, 1, 1, 1, 1, 1,
-0.1778247, 0.1552329, 0.801592, 1, 1, 1, 1, 1,
-0.1774387, 1.069327, -0.3581074, 1, 1, 1, 1, 1,
-0.1763338, -2.095546, -3.428196, 1, 1, 1, 1, 1,
-0.1761642, -1.625362, -3.172595, 0, 0, 1, 1, 1,
-0.1744307, -1.172062, -3.743955, 1, 0, 0, 1, 1,
-0.1732429, 0.2333955, 0.129073, 1, 0, 0, 1, 1,
-0.1717193, 0.3941815, -0.8605715, 1, 0, 0, 1, 1,
-0.1699073, -0.8183179, -3.949044, 1, 0, 0, 1, 1,
-0.168664, -1.355084, -4.193621, 1, 0, 0, 1, 1,
-0.168415, -0.9586409, -2.701375, 0, 0, 0, 1, 1,
-0.1615107, 1.508089, -0.182366, 0, 0, 0, 1, 1,
-0.1607148, 0.194457, 0.7535422, 0, 0, 0, 1, 1,
-0.1579471, -0.8438769, -3.806416, 0, 0, 0, 1, 1,
-0.1571559, 0.7118469, 1.106285, 0, 0, 0, 1, 1,
-0.1566243, 0.9999126, 0.4170017, 0, 0, 0, 1, 1,
-0.1559853, -0.09960644, -2.677428, 0, 0, 0, 1, 1,
-0.1551181, -0.1337126, -1.93587, 1, 1, 1, 1, 1,
-0.1536318, -0.1139697, -1.815558, 1, 1, 1, 1, 1,
-0.1536153, -0.5061102, -2.046351, 1, 1, 1, 1, 1,
-0.1512336, 0.0282514, 0.362294, 1, 1, 1, 1, 1,
-0.1463431, -1.504829, -1.729792, 1, 1, 1, 1, 1,
-0.1458074, -0.9982214, -1.669344, 1, 1, 1, 1, 1,
-0.1441919, 0.3848748, -0.69726, 1, 1, 1, 1, 1,
-0.1407383, -0.577856, -2.494872, 1, 1, 1, 1, 1,
-0.139292, 0.002462119, -1.098696, 1, 1, 1, 1, 1,
-0.1390047, 0.1965348, -0.1518776, 1, 1, 1, 1, 1,
-0.1385946, 0.9988016, -0.06852399, 1, 1, 1, 1, 1,
-0.1384254, 0.3188111, 0.2000645, 1, 1, 1, 1, 1,
-0.1384222, 0.09103061, -1.203187, 1, 1, 1, 1, 1,
-0.136946, -0.07290304, -1.765855, 1, 1, 1, 1, 1,
-0.1357504, -0.7105469, -3.667113, 1, 1, 1, 1, 1,
-0.132716, -2.004148, -2.962564, 0, 0, 1, 1, 1,
-0.1319395, 0.5247309, 0.3515382, 1, 0, 0, 1, 1,
-0.1311253, 0.6410165, -0.1526218, 1, 0, 0, 1, 1,
-0.1283999, 0.2277259, -0.3442876, 1, 0, 0, 1, 1,
-0.1261222, 0.1605077, -0.1396899, 1, 0, 0, 1, 1,
-0.1216437, 0.01859627, -1.521162, 1, 0, 0, 1, 1,
-0.119834, -0.7079275, -3.362427, 0, 0, 0, 1, 1,
-0.1197088, -1.31309, -2.440941, 0, 0, 0, 1, 1,
-0.1157424, -2.514787, -3.58452, 0, 0, 0, 1, 1,
-0.1138486, 0.8396804, 2.737371, 0, 0, 0, 1, 1,
-0.1132257, -2.058115, -4.176871, 0, 0, 0, 1, 1,
-0.111926, -0.2488446, -1.843254, 0, 0, 0, 1, 1,
-0.1113647, 0.3111767, -0.1854082, 0, 0, 0, 1, 1,
-0.1111373, -1.097853, -1.568033, 1, 1, 1, 1, 1,
-0.1110211, 0.4033116, 0.0456581, 1, 1, 1, 1, 1,
-0.1100538, 0.05320482, -2.11683, 1, 1, 1, 1, 1,
-0.1087267, -0.9447291, -0.600247, 1, 1, 1, 1, 1,
-0.1079454, 0.8431964, -0.4331643, 1, 1, 1, 1, 1,
-0.1079153, -0.7325373, -2.023919, 1, 1, 1, 1, 1,
-0.100081, 0.366088, 0.409339, 1, 1, 1, 1, 1,
-0.09202439, 0.8014467, -0.1290493, 1, 1, 1, 1, 1,
-0.09119458, 1.771722, -0.9195277, 1, 1, 1, 1, 1,
-0.08499557, -1.317635, -3.725508, 1, 1, 1, 1, 1,
-0.084833, 0.4434395, 1.214695, 1, 1, 1, 1, 1,
-0.08374014, -0.8250061, -4.289401, 1, 1, 1, 1, 1,
-0.08085351, 0.404177, 1.367054, 1, 1, 1, 1, 1,
-0.07514142, 2.042642, -1.298953, 1, 1, 1, 1, 1,
-0.06968778, -0.2275406, -2.760842, 1, 1, 1, 1, 1,
-0.06546061, 1.59844, 0.14003, 0, 0, 1, 1, 1,
-0.06446392, -0.692326, -3.26516, 1, 0, 0, 1, 1,
-0.06181993, 0.4221837, -0.6110382, 1, 0, 0, 1, 1,
-0.05883899, -2.882524, -2.276317, 1, 0, 0, 1, 1,
-0.05273735, -0.4623419, -2.762231, 1, 0, 0, 1, 1,
-0.05064817, 0.7158713, 0.8300887, 1, 0, 0, 1, 1,
-0.04623998, -2.065373, -5.029178, 0, 0, 0, 1, 1,
-0.04593317, -1.015831, -1.901701, 0, 0, 0, 1, 1,
-0.04001214, 0.9352638, 0.3876156, 0, 0, 0, 1, 1,
-0.03721997, 1.810654, 0.6067784, 0, 0, 0, 1, 1,
-0.03627682, 1.154694, -0.2471816, 0, 0, 0, 1, 1,
-0.03423122, 1.235419, 0.393332, 0, 0, 0, 1, 1,
-0.03124379, 0.5428588, -1.073585, 0, 0, 0, 1, 1,
-0.02687304, -0.424877, -3.599017, 1, 1, 1, 1, 1,
-0.02570682, -1.312079, -1.721897, 1, 1, 1, 1, 1,
-0.0253924, 0.5484586, -1.416132, 1, 1, 1, 1, 1,
-0.02120181, -0.2153133, -4.25703, 1, 1, 1, 1, 1,
-0.01656843, -1.419196, -1.909968, 1, 1, 1, 1, 1,
-0.01549641, 0.5962807, -2.223964, 1, 1, 1, 1, 1,
-0.0145947, -0.8062762, -3.936435, 1, 1, 1, 1, 1,
-0.01449625, 0.7984293, -0.5814065, 1, 1, 1, 1, 1,
-0.01253265, -1.112587, -3.217344, 1, 1, 1, 1, 1,
-0.004348699, -0.2615359, -3.213909, 1, 1, 1, 1, 1,
-0.0008980011, -0.7668256, -4.098846, 1, 1, 1, 1, 1,
0.001879176, 1.808482, 1.440783, 1, 1, 1, 1, 1,
0.00487039, 0.5621088, 0.3802634, 1, 1, 1, 1, 1,
0.007247886, 1.220327, 1.724217, 1, 1, 1, 1, 1,
0.00860065, -1.523735, 2.804804, 1, 1, 1, 1, 1,
0.01720617, -0.2352365, 5.029943, 0, 0, 1, 1, 1,
0.01837233, -1.188628, 3.828031, 1, 0, 0, 1, 1,
0.03141591, 0.05446242, -0.1659431, 1, 0, 0, 1, 1,
0.03714448, -1.330545, 3.489329, 1, 0, 0, 1, 1,
0.03786281, -0.4761827, 2.169941, 1, 0, 0, 1, 1,
0.04341901, -0.7049755, 2.515125, 1, 0, 0, 1, 1,
0.04421305, 0.7039459, 0.191162, 0, 0, 0, 1, 1,
0.04713186, -0.489048, 3.612886, 0, 0, 0, 1, 1,
0.05166562, -2.522762, 1.562075, 0, 0, 0, 1, 1,
0.05446849, -1.177983, 2.756424, 0, 0, 0, 1, 1,
0.06130933, 0.3865995, 0.4165755, 0, 0, 0, 1, 1,
0.06439562, 0.7586462, -0.3326216, 0, 0, 0, 1, 1,
0.06513447, 1.394004, 0.6478667, 0, 0, 0, 1, 1,
0.06517047, -0.931825, 1.552811, 1, 1, 1, 1, 1,
0.06535241, -0.1777161, 3.458304, 1, 1, 1, 1, 1,
0.06716894, -0.4728188, 2.981376, 1, 1, 1, 1, 1,
0.06976453, -0.6521025, 3.177022, 1, 1, 1, 1, 1,
0.0703597, 0.9085876, 0.1307487, 1, 1, 1, 1, 1,
0.07318531, 0.4218738, -1.235033, 1, 1, 1, 1, 1,
0.08394069, 0.9597058, -0.9404401, 1, 1, 1, 1, 1,
0.08407235, -1.051969, 1.793642, 1, 1, 1, 1, 1,
0.08558241, 1.361457, 1.01849, 1, 1, 1, 1, 1,
0.08757939, -0.4790466, 2.224165, 1, 1, 1, 1, 1,
0.0943431, -0.5652963, 3.361306, 1, 1, 1, 1, 1,
0.09470026, -1.670637, 3.16658, 1, 1, 1, 1, 1,
0.09632821, -0.7489926, 3.044422, 1, 1, 1, 1, 1,
0.1002953, 1.720907, -0.09637, 1, 1, 1, 1, 1,
0.1079594, -0.3222773, 2.161498, 1, 1, 1, 1, 1,
0.1099605, 2.029718, 0.8478332, 0, 0, 1, 1, 1,
0.1102976, 1.237712, 0.05827061, 1, 0, 0, 1, 1,
0.1125676, -0.2706905, 3.539793, 1, 0, 0, 1, 1,
0.1147737, 0.6464424, 1.273715, 1, 0, 0, 1, 1,
0.1163455, -0.3279329, 3.183841, 1, 0, 0, 1, 1,
0.1186862, 0.702046, -0.6655589, 1, 0, 0, 1, 1,
0.1196378, 0.2251441, 1.929485, 0, 0, 0, 1, 1,
0.120982, 1.014378, -1.462871, 0, 0, 0, 1, 1,
0.1215477, -0.709564, 2.876568, 0, 0, 0, 1, 1,
0.121884, 1.924753, 0.2146558, 0, 0, 0, 1, 1,
0.1329152, 0.7531494, -0.002649073, 0, 0, 0, 1, 1,
0.1346714, 1.613287, -1.236128, 0, 0, 0, 1, 1,
0.1348221, -0.1257277, 2.906533, 0, 0, 0, 1, 1,
0.1414047, -1.070424, 1.749799, 1, 1, 1, 1, 1,
0.1460813, 1.00756, -0.8618215, 1, 1, 1, 1, 1,
0.1506962, -1.337326, 3.759308, 1, 1, 1, 1, 1,
0.1529617, -0.7132491, 1.599253, 1, 1, 1, 1, 1,
0.1549796, -0.557748, 3.136175, 1, 1, 1, 1, 1,
0.1558958, 0.8770151, -0.1072756, 1, 1, 1, 1, 1,
0.1617233, 1.211956, -1.125563, 1, 1, 1, 1, 1,
0.162121, -1.843501, 3.053333, 1, 1, 1, 1, 1,
0.1740384, 0.4373178, 0.6736668, 1, 1, 1, 1, 1,
0.179692, -1.952442, 2.207221, 1, 1, 1, 1, 1,
0.1811461, 0.09298892, 1.332446, 1, 1, 1, 1, 1,
0.1817399, 0.488939, -1.180842, 1, 1, 1, 1, 1,
0.1834436, -1.085855, 4.047654, 1, 1, 1, 1, 1,
0.1841813, 1.07492, 1.974899, 1, 1, 1, 1, 1,
0.1843117, -1.201173, 3.288039, 1, 1, 1, 1, 1,
0.1872139, 1.048547, 1.762516, 0, 0, 1, 1, 1,
0.1889338, -1.090954, 2.380294, 1, 0, 0, 1, 1,
0.1893006, -0.01963982, 2.399619, 1, 0, 0, 1, 1,
0.1952599, 0.5618593, 0.3305025, 1, 0, 0, 1, 1,
0.1959862, 1.256143, -0.4560155, 1, 0, 0, 1, 1,
0.1990602, 2.060452, -0.8284469, 1, 0, 0, 1, 1,
0.2000324, -0.2692748, 1.887088, 0, 0, 0, 1, 1,
0.2062076, 0.6713164, 0.3203006, 0, 0, 0, 1, 1,
0.2062595, 1.017998, -0.1697342, 0, 0, 0, 1, 1,
0.2100092, -1.559843, 3.876477, 0, 0, 0, 1, 1,
0.2120065, 0.009808794, 1.112003, 0, 0, 0, 1, 1,
0.2203683, -0.4237263, 2.148308, 0, 0, 0, 1, 1,
0.2208886, -0.8818899, 2.679203, 0, 0, 0, 1, 1,
0.2238303, -1.928271, 3.605772, 1, 1, 1, 1, 1,
0.2239971, -0.02834725, 1.332603, 1, 1, 1, 1, 1,
0.2302505, -0.01022142, 1.562228, 1, 1, 1, 1, 1,
0.2494944, 0.2132187, 0.5389514, 1, 1, 1, 1, 1,
0.2497804, 0.3033486, 1.807715, 1, 1, 1, 1, 1,
0.2508203, -0.09516705, 2.030376, 1, 1, 1, 1, 1,
0.2525095, 0.7616021, -0.1922272, 1, 1, 1, 1, 1,
0.2536811, 0.1219352, 1.606001, 1, 1, 1, 1, 1,
0.2572107, -0.716002, 4.26729, 1, 1, 1, 1, 1,
0.2604644, -0.04061007, 2.101861, 1, 1, 1, 1, 1,
0.2605749, 0.4131076, 0.9646052, 1, 1, 1, 1, 1,
0.2650267, -0.5621772, 3.252053, 1, 1, 1, 1, 1,
0.2662137, 1.873561, 0.3683664, 1, 1, 1, 1, 1,
0.2663837, -0.6075644, 2.459792, 1, 1, 1, 1, 1,
0.2686868, 1.580746, 1.731004, 1, 1, 1, 1, 1,
0.2707584, 0.9382885, 0.8095458, 0, 0, 1, 1, 1,
0.2710498, 0.7460029, 1.31626, 1, 0, 0, 1, 1,
0.2828119, 1.299657, 0.1702821, 1, 0, 0, 1, 1,
0.2888491, -0.1089187, 0.8750118, 1, 0, 0, 1, 1,
0.2947809, 1.414638, 1.010188, 1, 0, 0, 1, 1,
0.2949699, 0.9607266, -0.2853806, 1, 0, 0, 1, 1,
0.3000236, 1.315387, -2.244876, 0, 0, 0, 1, 1,
0.3015279, -0.7359455, 3.206887, 0, 0, 0, 1, 1,
0.302818, -0.8307665, 3.171594, 0, 0, 0, 1, 1,
0.3084106, -0.3796338, 1.822249, 0, 0, 0, 1, 1,
0.3086871, 0.7287011, -1.05276, 0, 0, 0, 1, 1,
0.3139135, -0.0950532, 3.020771, 0, 0, 0, 1, 1,
0.3204412, 1.452335, 0.6944036, 0, 0, 0, 1, 1,
0.3257942, 1.843503, -0.4215856, 1, 1, 1, 1, 1,
0.3284409, -0.5586188, 1.833735, 1, 1, 1, 1, 1,
0.3290924, -0.6137325, 1.933664, 1, 1, 1, 1, 1,
0.3344231, -1.703183, 2.893569, 1, 1, 1, 1, 1,
0.3441072, -0.3787628, 2.633565, 1, 1, 1, 1, 1,
0.3452916, 1.182222, 1.413562, 1, 1, 1, 1, 1,
0.3457682, 1.807258, 1.352169, 1, 1, 1, 1, 1,
0.3502576, -0.3839428, 1.938472, 1, 1, 1, 1, 1,
0.3558461, -0.8569106, 4.025974, 1, 1, 1, 1, 1,
0.355849, 0.6559664, 1.128753, 1, 1, 1, 1, 1,
0.3601854, 1.236086, -0.00605791, 1, 1, 1, 1, 1,
0.3637146, 0.1484718, 0.4567451, 1, 1, 1, 1, 1,
0.3687872, 0.8431214, 0.729402, 1, 1, 1, 1, 1,
0.3714724, -1.002854, 2.439912, 1, 1, 1, 1, 1,
0.3729715, 0.005339178, 1.876764, 1, 1, 1, 1, 1,
0.3739813, 0.4265974, 1.936689, 0, 0, 1, 1, 1,
0.3779314, 1.157487, -0.5712587, 1, 0, 0, 1, 1,
0.3814671, -0.9656374, 3.315429, 1, 0, 0, 1, 1,
0.3819483, -0.239093, 3.213078, 1, 0, 0, 1, 1,
0.3827278, -0.2201743, 2.503694, 1, 0, 0, 1, 1,
0.3902922, 0.1957204, 1.358848, 1, 0, 0, 1, 1,
0.3928858, -0.8412073, 0.9328448, 0, 0, 0, 1, 1,
0.3936742, -0.004738288, 2.866859, 0, 0, 0, 1, 1,
0.3939913, -0.85371, 3.273906, 0, 0, 0, 1, 1,
0.3944828, 0.3634931, 2.07788, 0, 0, 0, 1, 1,
0.3971937, 1.195765, -0.5845225, 0, 0, 0, 1, 1,
0.4030105, -0.9572522, 2.535608, 0, 0, 0, 1, 1,
0.4032123, 1.039516, 1.874871, 0, 0, 0, 1, 1,
0.4107744, -1.522442, 2.56429, 1, 1, 1, 1, 1,
0.4140659, -0.2303099, 1.711884, 1, 1, 1, 1, 1,
0.416662, 0.9123213, 2.562769, 1, 1, 1, 1, 1,
0.4169286, 1.258473, -0.1503172, 1, 1, 1, 1, 1,
0.4255196, -2.147427, 2.848017, 1, 1, 1, 1, 1,
0.4271375, 0.7372234, -0.5765794, 1, 1, 1, 1, 1,
0.428898, -0.5340641, 2.753818, 1, 1, 1, 1, 1,
0.428921, -2.728627, 1.898093, 1, 1, 1, 1, 1,
0.4290355, 0.2798482, 0.6850238, 1, 1, 1, 1, 1,
0.4296202, 0.02927374, 1.750187, 1, 1, 1, 1, 1,
0.4300736, -0.9263578, 2.538609, 1, 1, 1, 1, 1,
0.4316389, -0.5094578, 0.2539947, 1, 1, 1, 1, 1,
0.4348285, 0.2961387, 2.416392, 1, 1, 1, 1, 1,
0.4355811, 0.03354814, 0.573328, 1, 1, 1, 1, 1,
0.4421997, 1.632207, -0.8312315, 1, 1, 1, 1, 1,
0.4456831, 0.2484276, 1.378566, 0, 0, 1, 1, 1,
0.4466, 0.5261708, 1.176435, 1, 0, 0, 1, 1,
0.4476913, -0.7256501, 3.248448, 1, 0, 0, 1, 1,
0.4483801, 1.06493, -0.03442533, 1, 0, 0, 1, 1,
0.4550815, 1.05469, 0.4621032, 1, 0, 0, 1, 1,
0.4570466, 1.645279, 1.273946, 1, 0, 0, 1, 1,
0.4571922, -0.6083761, 2.287108, 0, 0, 0, 1, 1,
0.4603147, 0.08289872, 2.49098, 0, 0, 0, 1, 1,
0.4604094, 1.41352, -0.3498772, 0, 0, 0, 1, 1,
0.4679949, 0.8562686, 0.7776525, 0, 0, 0, 1, 1,
0.4704657, -1.167218, 1.707679, 0, 0, 0, 1, 1,
0.4714661, 2.257102, 0.2602166, 0, 0, 0, 1, 1,
0.4737206, 1.721972, 0.2332329, 0, 0, 0, 1, 1,
0.4764, 0.04975758, 1.290259, 1, 1, 1, 1, 1,
0.4808833, 1.037697, -0.1690643, 1, 1, 1, 1, 1,
0.4868067, -0.2925879, 2.755812, 1, 1, 1, 1, 1,
0.4895517, -0.2477713, 0.6151462, 1, 1, 1, 1, 1,
0.4909511, -0.02561617, 1.025985, 1, 1, 1, 1, 1,
0.4923275, -0.2680727, 3.943686, 1, 1, 1, 1, 1,
0.4945335, -0.7062197, 3.480047, 1, 1, 1, 1, 1,
0.4948991, 0.06898957, 1.38959, 1, 1, 1, 1, 1,
0.4950444, 0.591734, 2.977077, 1, 1, 1, 1, 1,
0.498694, 0.3807285, 0.5351772, 1, 1, 1, 1, 1,
0.4989694, 0.03985976, 1.682283, 1, 1, 1, 1, 1,
0.5003402, -0.7042714, 2.737688, 1, 1, 1, 1, 1,
0.5027615, -1.354836, 2.539463, 1, 1, 1, 1, 1,
0.5030246, -0.03013082, 2.456074, 1, 1, 1, 1, 1,
0.5035143, 0.05110958, 1.565117, 1, 1, 1, 1, 1,
0.5036497, -0.9095312, 1.49543, 0, 0, 1, 1, 1,
0.507631, 1.249258, -1.013093, 1, 0, 0, 1, 1,
0.5078679, -0.8083674, 2.992694, 1, 0, 0, 1, 1,
0.5200381, 1.274444, -0.3973372, 1, 0, 0, 1, 1,
0.5237513, -0.0330009, 1.177737, 1, 0, 0, 1, 1,
0.5286474, -0.1906586, 1.556183, 1, 0, 0, 1, 1,
0.5287627, 2.351346, 0.5291128, 0, 0, 0, 1, 1,
0.5377529, 0.1104582, 2.899554, 0, 0, 0, 1, 1,
0.5422281, -0.4536836, 2.892929, 0, 0, 0, 1, 1,
0.5458788, -0.8877141, 2.624546, 0, 0, 0, 1, 1,
0.5458841, -0.08387823, 1.418219, 0, 0, 0, 1, 1,
0.5515929, -3.08944, 4.084309, 0, 0, 0, 1, 1,
0.5609491, 0.8820059, 0.8237345, 0, 0, 0, 1, 1,
0.5610805, 0.03934261, 0.3651837, 1, 1, 1, 1, 1,
0.5627604, 0.03344427, 0.959039, 1, 1, 1, 1, 1,
0.5656147, -0.5153856, 1.309592, 1, 1, 1, 1, 1,
0.5672769, 0.1374004, 2.046215, 1, 1, 1, 1, 1,
0.5689355, 1.481241, 0.6215324, 1, 1, 1, 1, 1,
0.5691954, 0.8558292, 1.167457, 1, 1, 1, 1, 1,
0.5766754, 1.939865, 0.6248025, 1, 1, 1, 1, 1,
0.5774187, -0.2754252, 1.598462, 1, 1, 1, 1, 1,
0.5823166, -0.3723401, 2.143474, 1, 1, 1, 1, 1,
0.5835458, 0.231708, 2.199935, 1, 1, 1, 1, 1,
0.5848472, -0.3671668, 3.065002, 1, 1, 1, 1, 1,
0.5851055, -0.1199731, 0.1668391, 1, 1, 1, 1, 1,
0.5925354, -1.07429, 2.504127, 1, 1, 1, 1, 1,
0.5930275, -0.6687166, 2.167661, 1, 1, 1, 1, 1,
0.5931173, -1.562783, 2.306031, 1, 1, 1, 1, 1,
0.5962405, 2.020539, -0.0007008634, 0, 0, 1, 1, 1,
0.5978923, 1.345929, -0.0192686, 1, 0, 0, 1, 1,
0.5988591, -1.057286, 2.681316, 1, 0, 0, 1, 1,
0.5988984, 0.1368766, 0.8565412, 1, 0, 0, 1, 1,
0.6020301, 0.6623054, 0.5046825, 1, 0, 0, 1, 1,
0.6024846, 1.25223, -0.6039801, 1, 0, 0, 1, 1,
0.6111953, 2.156523, 1.033556, 0, 0, 0, 1, 1,
0.6216606, 0.9225748, 1.588868, 0, 0, 0, 1, 1,
0.6293974, -1.806545, 4.69607, 0, 0, 0, 1, 1,
0.6340956, -1.247712, 2.87602, 0, 0, 0, 1, 1,
0.6349648, 0.2295071, 1.886481, 0, 0, 0, 1, 1,
0.6353991, 1.557982, -1.794872, 0, 0, 0, 1, 1,
0.6385187, 0.2145374, 0.5924527, 0, 0, 0, 1, 1,
0.6388116, 0.02465213, 1.244807, 1, 1, 1, 1, 1,
0.6419705, -0.2909873, 2.602284, 1, 1, 1, 1, 1,
0.6483578, -0.7123973, 1.828987, 1, 1, 1, 1, 1,
0.6502436, -1.427512, 4.752559, 1, 1, 1, 1, 1,
0.6505263, -0.9917846, 1.055041, 1, 1, 1, 1, 1,
0.6521139, 1.713302, -1.015095, 1, 1, 1, 1, 1,
0.6528589, -0.4225855, 1.517366, 1, 1, 1, 1, 1,
0.6555401, -0.3231939, 1.41744, 1, 1, 1, 1, 1,
0.6617915, -0.001314131, 2.409765, 1, 1, 1, 1, 1,
0.6676037, 0.2687477, 0.4780472, 1, 1, 1, 1, 1,
0.6745753, -0.3424773, 3.273472, 1, 1, 1, 1, 1,
0.6858448, -0.6192932, 1.877367, 1, 1, 1, 1, 1,
0.6912313, 0.7679257, 1.015571, 1, 1, 1, 1, 1,
0.69225, 1.27191, 0.6061642, 1, 1, 1, 1, 1,
0.6933798, -1.065871, 4.057177, 1, 1, 1, 1, 1,
0.6976994, 1.664126, -0.2620454, 0, 0, 1, 1, 1,
0.6989986, 0.6141996, 0.9563447, 1, 0, 0, 1, 1,
0.702485, -1.09547, 1.753388, 1, 0, 0, 1, 1,
0.7065855, 1.002339, 2.14706, 1, 0, 0, 1, 1,
0.7137186, -0.8423303, 3.58676, 1, 0, 0, 1, 1,
0.7137971, -0.4102279, 2.086203, 1, 0, 0, 1, 1,
0.7176976, -0.4549942, 1.328366, 0, 0, 0, 1, 1,
0.7274398, -0.1208923, 0.6691811, 0, 0, 0, 1, 1,
0.7310397, 1.628379, -0.4712234, 0, 0, 0, 1, 1,
0.7329145, 0.08073797, 1.163779, 0, 0, 0, 1, 1,
0.7331867, -0.9604388, 1.916595, 0, 0, 0, 1, 1,
0.7338741, 0.8787348, 0.7792611, 0, 0, 0, 1, 1,
0.7345222, 0.7186348, -0.3329861, 0, 0, 0, 1, 1,
0.7390664, 1.010423, 0.3033927, 1, 1, 1, 1, 1,
0.7427616, -1.120292, 3.290344, 1, 1, 1, 1, 1,
0.748099, 0.1476622, 2.020464, 1, 1, 1, 1, 1,
0.7491254, 1.147666, -0.2919331, 1, 1, 1, 1, 1,
0.7503166, -0.4864731, 1.267641, 1, 1, 1, 1, 1,
0.7528489, -0.206476, 2.725927, 1, 1, 1, 1, 1,
0.7554312, 0.04699782, 0.2042756, 1, 1, 1, 1, 1,
0.7583779, 1.100818, 0.1085475, 1, 1, 1, 1, 1,
0.7627829, -0.9729874, 1.422018, 1, 1, 1, 1, 1,
0.7656147, -0.09388529, 2.42, 1, 1, 1, 1, 1,
0.7685258, -0.1020521, 2.199076, 1, 1, 1, 1, 1,
0.7781751, 0.9318459, 0.4295805, 1, 1, 1, 1, 1,
0.7830685, 0.8146597, 1.403985, 1, 1, 1, 1, 1,
0.7911179, -1.564365, 2.18732, 1, 1, 1, 1, 1,
0.7936019, -0.2238247, 1.657778, 1, 1, 1, 1, 1,
0.7958711, 1.260954, 1.801378, 0, 0, 1, 1, 1,
0.8088568, 0.3447188, 1.856677, 1, 0, 0, 1, 1,
0.8097302, -0.8252681, 5.279784, 1, 0, 0, 1, 1,
0.818799, -1.290947, 1.155323, 1, 0, 0, 1, 1,
0.8200799, -0.485084, 4.420975, 1, 0, 0, 1, 1,
0.8203475, -0.1784462, 2.603359, 1, 0, 0, 1, 1,
0.8219805, 1.917577, 0.5144058, 0, 0, 0, 1, 1,
0.8269052, 0.8386649, -0.0526697, 0, 0, 0, 1, 1,
0.8300059, -0.3843496, 3.868524, 0, 0, 0, 1, 1,
0.8322181, 1.754783, 1.404295, 0, 0, 0, 1, 1,
0.8324408, 0.4826136, 0.4250221, 0, 0, 0, 1, 1,
0.8334813, -0.8479477, 1.0235, 0, 0, 0, 1, 1,
0.8344557, -0.3956757, 2.206112, 0, 0, 0, 1, 1,
0.8362815, -3.148614, 3.882539, 1, 1, 1, 1, 1,
0.8425185, 0.9871266, 2.255256, 1, 1, 1, 1, 1,
0.8451673, 0.5542542, 1.224283, 1, 1, 1, 1, 1,
0.8459693, 0.04816538, 1.779674, 1, 1, 1, 1, 1,
0.8484044, 1.291002, 0.8573159, 1, 1, 1, 1, 1,
0.8589817, 1.990535, 0.4243508, 1, 1, 1, 1, 1,
0.8701429, -0.2368247, 0.7879583, 1, 1, 1, 1, 1,
0.8728858, 0.8895947, -0.6529651, 1, 1, 1, 1, 1,
0.8740955, -1.928281, 4.321442, 1, 1, 1, 1, 1,
0.8854588, -0.2148822, 2.088493, 1, 1, 1, 1, 1,
0.8898088, -0.3376998, -0.9364182, 1, 1, 1, 1, 1,
0.8993525, 0.9498718, 1.484168, 1, 1, 1, 1, 1,
0.9010036, 0.2591033, 2.506408, 1, 1, 1, 1, 1,
0.9020135, 0.1284571, 2.98929, 1, 1, 1, 1, 1,
0.9047368, 1.695929, 0.4190607, 1, 1, 1, 1, 1,
0.9047671, 0.3570455, 1.708371, 0, 0, 1, 1, 1,
0.9084243, -0.2372645, 2.13131, 1, 0, 0, 1, 1,
0.9091967, -0.09254238, 2.053223, 1, 0, 0, 1, 1,
0.9180058, -1.451745, 3.48626, 1, 0, 0, 1, 1,
0.9185816, -0.9935973, 3.037683, 1, 0, 0, 1, 1,
0.9190006, -1.199733, 2.020935, 1, 0, 0, 1, 1,
0.9345316, -0.5223506, 1.517466, 0, 0, 0, 1, 1,
0.9349486, -0.2076592, 2.113042, 0, 0, 0, 1, 1,
0.942785, 0.7272432, -0.8393075, 0, 0, 0, 1, 1,
0.9457043, 0.006276611, 0.1654137, 0, 0, 0, 1, 1,
0.9492573, -0.5834865, 2.373907, 0, 0, 0, 1, 1,
0.9620148, -1.735262, 3.290728, 0, 0, 0, 1, 1,
0.9637898, -0.06193019, 0.5817491, 0, 0, 0, 1, 1,
0.9646139, 0.2433482, 1.177876, 1, 1, 1, 1, 1,
0.9668791, -1.028693, 1.98132, 1, 1, 1, 1, 1,
0.9668813, 0.633777, -0.9323296, 1, 1, 1, 1, 1,
0.96841, 0.3044446, 0.9552795, 1, 1, 1, 1, 1,
0.972417, 1.447036, 0.5525079, 1, 1, 1, 1, 1,
0.9766152, -1.703137, 1.993716, 1, 1, 1, 1, 1,
0.9778619, 1.489194, -0.002589924, 1, 1, 1, 1, 1,
0.9824777, 1.67448, 0.007486013, 1, 1, 1, 1, 1,
0.9898944, 0.06493159, 1.694288, 1, 1, 1, 1, 1,
0.9929907, -1.715695, 3.366204, 1, 1, 1, 1, 1,
0.9958513, 1.060506, 0.9720134, 1, 1, 1, 1, 1,
1.000171, 0.02465931, 0.1791067, 1, 1, 1, 1, 1,
1.005152, -0.6988106, 4.622165, 1, 1, 1, 1, 1,
1.013456, -0.4966747, 1.680519, 1, 1, 1, 1, 1,
1.013831, 0.6331799, 1.663227, 1, 1, 1, 1, 1,
1.022923, 0.4422531, 0.9739376, 0, 0, 1, 1, 1,
1.025553, 1.23965, 1.435907, 1, 0, 0, 1, 1,
1.033945, 0.1882586, 3.075313, 1, 0, 0, 1, 1,
1.040977, 1.079703, -1.668449, 1, 0, 0, 1, 1,
1.041856, 1.194798, -1.264998, 1, 0, 0, 1, 1,
1.044242, 0.8834503, -0.09037947, 1, 0, 0, 1, 1,
1.047448, -0.3035146, 2.079189, 0, 0, 0, 1, 1,
1.047871, 1.457345, -0.03338407, 0, 0, 0, 1, 1,
1.048715, -0.533407, 3.900382, 0, 0, 0, 1, 1,
1.053139, -0.129782, 2.699254, 0, 0, 0, 1, 1,
1.053804, 0.06969551, 0.8011106, 0, 0, 0, 1, 1,
1.065944, -0.6790679, 3.053653, 0, 0, 0, 1, 1,
1.094844, -1.303707, 3.862726, 0, 0, 0, 1, 1,
1.095276, 1.174852, 1.288051, 1, 1, 1, 1, 1,
1.097133, -0.04473364, 1.014204, 1, 1, 1, 1, 1,
1.097163, 1.023606, 1.945755, 1, 1, 1, 1, 1,
1.105752, 0.6825585, -0.305721, 1, 1, 1, 1, 1,
1.111377, 2.588826, -1.13856, 1, 1, 1, 1, 1,
1.115244, 0.9496325, 2.317872, 1, 1, 1, 1, 1,
1.132828, -0.9533556, 0.5634944, 1, 1, 1, 1, 1,
1.141278, 0.3493097, 0.8872451, 1, 1, 1, 1, 1,
1.161556, -0.9159424, 2.36908, 1, 1, 1, 1, 1,
1.162631, 0.6951239, 2.099636, 1, 1, 1, 1, 1,
1.163104, -0.09895564, 1.771131, 1, 1, 1, 1, 1,
1.173368, -1.212054, 2.256908, 1, 1, 1, 1, 1,
1.175823, 0.03044941, 0.9665857, 1, 1, 1, 1, 1,
1.176358, -0.1258237, 1.317527, 1, 1, 1, 1, 1,
1.186952, -0.3575123, 3.515381, 1, 1, 1, 1, 1,
1.187018, -1.022614, 2.739966, 0, 0, 1, 1, 1,
1.207073, -1.008274, 0.9345567, 1, 0, 0, 1, 1,
1.20865, 0.7493453, -0.05548695, 1, 0, 0, 1, 1,
1.212172, -0.3518672, 1.0852, 1, 0, 0, 1, 1,
1.21423, 0.7877929, 1.172761, 1, 0, 0, 1, 1,
1.215007, -0.4935222, 2.681144, 1, 0, 0, 1, 1,
1.216638, -0.7279959, 3.64361, 0, 0, 0, 1, 1,
1.220963, -1.438267, 2.591527, 0, 0, 0, 1, 1,
1.224172, 0.849408, 1.996694, 0, 0, 0, 1, 1,
1.224753, 0.2905185, -0.6310994, 0, 0, 0, 1, 1,
1.228654, -0.6627237, 0.9082131, 0, 0, 0, 1, 1,
1.230635, -1.424905, 2.704198, 0, 0, 0, 1, 1,
1.236263, 0.8088422, -0.1722985, 0, 0, 0, 1, 1,
1.253127, -1.200688, 2.412197, 1, 1, 1, 1, 1,
1.267246, -0.8621674, 1.948717, 1, 1, 1, 1, 1,
1.270512, 0.3154202, 1.686043, 1, 1, 1, 1, 1,
1.281038, -0.3279481, 4.545344, 1, 1, 1, 1, 1,
1.297017, 0.2220125, 2.408302, 1, 1, 1, 1, 1,
1.30338, -0.8095396, 3.001606, 1, 1, 1, 1, 1,
1.307125, 1.453217, 1.72899, 1, 1, 1, 1, 1,
1.309555, 0.9779259, 1.958294, 1, 1, 1, 1, 1,
1.312258, -0.6526695, 2.633749, 1, 1, 1, 1, 1,
1.315574, -0.6618915, 3.347934, 1, 1, 1, 1, 1,
1.316174, -0.4107774, 1.168455, 1, 1, 1, 1, 1,
1.32178, 2.470913, 1.557921, 1, 1, 1, 1, 1,
1.322149, 0.9715898, -0.2848428, 1, 1, 1, 1, 1,
1.331583, 1.098149, 0.4573961, 1, 1, 1, 1, 1,
1.332175, -0.4488083, 0.9020896, 1, 1, 1, 1, 1,
1.33403, -0.6904227, 1.271731, 0, 0, 1, 1, 1,
1.334459, 0.241276, 2.510458, 1, 0, 0, 1, 1,
1.3345, 0.5799535, 0.01737797, 1, 0, 0, 1, 1,
1.338792, -1.797001, 2.883131, 1, 0, 0, 1, 1,
1.339081, 0.1948805, 1.760863, 1, 0, 0, 1, 1,
1.343183, -0.5189487, 3.570463, 1, 0, 0, 1, 1,
1.344562, 2.080962, -1.356164, 0, 0, 0, 1, 1,
1.35272, 0.912704, 0.9021291, 0, 0, 0, 1, 1,
1.357133, 0.2177131, -0.4717234, 0, 0, 0, 1, 1,
1.357581, 1.620379, 0.5106353, 0, 0, 0, 1, 1,
1.358428, -1.076547, 3.484474, 0, 0, 0, 1, 1,
1.359433, -1.120543, 2.656033, 0, 0, 0, 1, 1,
1.364728, -0.1562393, 0.8177455, 0, 0, 0, 1, 1,
1.366337, 0.1562775, 3.233804, 1, 1, 1, 1, 1,
1.371038, -1.93674, 3.871661, 1, 1, 1, 1, 1,
1.391288, -0.5351513, 1.553673, 1, 1, 1, 1, 1,
1.403427, 0.3094124, 0.4112419, 1, 1, 1, 1, 1,
1.406739, -0.8945373, -0.6237137, 1, 1, 1, 1, 1,
1.417136, -0.4978726, 3.538049, 1, 1, 1, 1, 1,
1.425699, 0.4564918, 0.8285482, 1, 1, 1, 1, 1,
1.427693, 1.205823, 0.6207489, 1, 1, 1, 1, 1,
1.432714, -0.2579764, 1.632403, 1, 1, 1, 1, 1,
1.434611, -0.1549819, 0.2366595, 1, 1, 1, 1, 1,
1.436481, 0.5611546, 2.222914, 1, 1, 1, 1, 1,
1.439941, 1.580674, 0.6039881, 1, 1, 1, 1, 1,
1.452247, 0.3258614, 2.896279, 1, 1, 1, 1, 1,
1.457673, -1.013063, 1.523291, 1, 1, 1, 1, 1,
1.460972, 2.316337, -0.4079112, 1, 1, 1, 1, 1,
1.481564, -1.018027, 3.425493, 0, 0, 1, 1, 1,
1.488173, -0.6052345, 0.412802, 1, 0, 0, 1, 1,
1.49608, -0.8430529, 2.106388, 1, 0, 0, 1, 1,
1.497559, 0.6688879, 1.461637, 1, 0, 0, 1, 1,
1.510573, 0.01796772, 1.455679, 1, 0, 0, 1, 1,
1.5183, 0.3571304, 1.280772, 1, 0, 0, 1, 1,
1.527583, -1.21086, 2.709427, 0, 0, 0, 1, 1,
1.53205, -1.142198, 3.098226, 0, 0, 0, 1, 1,
1.539864, 0.3042653, 1.5667, 0, 0, 0, 1, 1,
1.540074, -0.6014655, 2.099257, 0, 0, 0, 1, 1,
1.549713, 0.03612101, 2.253181, 0, 0, 0, 1, 1,
1.553496, 1.428444, -0.937781, 0, 0, 0, 1, 1,
1.554988, 0.08006138, 1.923126, 0, 0, 0, 1, 1,
1.571179, 1.323404, 1.809917, 1, 1, 1, 1, 1,
1.574151, 0.4520786, 1.31604, 1, 1, 1, 1, 1,
1.579015, 1.483828, -0.761625, 1, 1, 1, 1, 1,
1.586348, -1.225772, 2.888274, 1, 1, 1, 1, 1,
1.593775, -1.05709, 2.872547, 1, 1, 1, 1, 1,
1.597171, -0.8943163, 1.148885, 1, 1, 1, 1, 1,
1.598349, 0.1249943, 2.115648, 1, 1, 1, 1, 1,
1.608717, -0.3000776, 4.438754, 1, 1, 1, 1, 1,
1.625077, 1.540995, 0.8029031, 1, 1, 1, 1, 1,
1.626616, 1.477134, -1.606825, 1, 1, 1, 1, 1,
1.648689, -0.875874, 3.71744, 1, 1, 1, 1, 1,
1.651979, -0.630645, 1.621923, 1, 1, 1, 1, 1,
1.653269, -1.12071, 0.5502279, 1, 1, 1, 1, 1,
1.674623, -0.3688502, 2.632492, 1, 1, 1, 1, 1,
1.680687, -0.3745455, 2.93794, 1, 1, 1, 1, 1,
1.696371, 1.072003, 2.752494, 0, 0, 1, 1, 1,
1.708873, -1.435101, 1.550149, 1, 0, 0, 1, 1,
1.713471, 0.02237055, 2.413731, 1, 0, 0, 1, 1,
1.713907, -0.5568848, 0.8907384, 1, 0, 0, 1, 1,
1.714282, -0.179155, 2.617201, 1, 0, 0, 1, 1,
1.719471, -0.1943502, 0.3915896, 1, 0, 0, 1, 1,
1.720957, 0.3916647, 3.353344, 0, 0, 0, 1, 1,
1.741754, -0.8465908, 2.211146, 0, 0, 0, 1, 1,
1.742934, -0.241929, 2.224209, 0, 0, 0, 1, 1,
1.752429, -0.9150043, 1.700387, 0, 0, 0, 1, 1,
1.767962, 1.415854, 0.4880292, 0, 0, 0, 1, 1,
1.787798, 0.9955856, 1.897153, 0, 0, 0, 1, 1,
1.830119, 1.757874, 0.3580031, 0, 0, 0, 1, 1,
1.839649, 0.5270876, 1.224428, 1, 1, 1, 1, 1,
1.844292, -0.1860597, 1.934072, 1, 1, 1, 1, 1,
1.84441, 0.3824807, 1.356825, 1, 1, 1, 1, 1,
1.869332, -0.1899046, 2.981142, 1, 1, 1, 1, 1,
1.881095, -1.386075, 2.349828, 1, 1, 1, 1, 1,
1.896361, 0.7263625, 0.9666709, 1, 1, 1, 1, 1,
1.899333, 0.0404901, 0.3630197, 1, 1, 1, 1, 1,
1.920662, 1.013554, 0.6759179, 1, 1, 1, 1, 1,
1.94597, -0.3069702, 0.3212997, 1, 1, 1, 1, 1,
1.950203, -0.4980982, 3.074641, 1, 1, 1, 1, 1,
1.956997, -0.2825197, 1.577357, 1, 1, 1, 1, 1,
1.959132, 0.7355994, 0.558651, 1, 1, 1, 1, 1,
1.965817, 1.155477, -0.04393538, 1, 1, 1, 1, 1,
2.000134, 0.4951638, 3.57174, 1, 1, 1, 1, 1,
2.027114, 0.1235979, 1.320455, 1, 1, 1, 1, 1,
2.085523, 0.4280908, 3.158273, 0, 0, 1, 1, 1,
2.092448, -1.134323, 2.385106, 1, 0, 0, 1, 1,
2.118186, 0.612414, -0.8666002, 1, 0, 0, 1, 1,
2.123714, 1.151532, 1.637887, 1, 0, 0, 1, 1,
2.14727, -0.008703574, 2.694328, 1, 0, 0, 1, 1,
2.272226, 1.011788, 0.2877253, 1, 0, 0, 1, 1,
2.287588, 1.409143, 2.633199, 0, 0, 0, 1, 1,
2.288619, 0.03683205, 2.938708, 0, 0, 0, 1, 1,
2.306299, -0.3470661, 0.8054997, 0, 0, 0, 1, 1,
2.312994, -2.195384, 0.6950551, 0, 0, 0, 1, 1,
2.322975, 0.3313766, 1.121469, 0, 0, 0, 1, 1,
2.347169, 1.911833, 0.5726895, 0, 0, 0, 1, 1,
2.473166, -1.074712, 1.729403, 0, 0, 0, 1, 1,
2.509687, 0.5887821, 1.827287, 1, 1, 1, 1, 1,
2.521861, -1.399411, 2.877782, 1, 1, 1, 1, 1,
2.572261, 1.667026, 0.06514478, 1, 1, 1, 1, 1,
2.575451, 1.731341, 0.8318971, 1, 1, 1, 1, 1,
2.623239, 1.169112, 1.838409, 1, 1, 1, 1, 1,
2.933679, -0.2490712, 1.467658, 1, 1, 1, 1, 1,
3.183813, 0.2607804, 0.8108783, 1, 1, 1, 1, 1
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
var radius = 9.182642;
var distance = 32.25364;
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
mvMatrix.translate( -0.2575493, 0.2093413, -0.05456972 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.25364);
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
