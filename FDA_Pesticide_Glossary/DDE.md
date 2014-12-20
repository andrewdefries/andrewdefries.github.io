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
-3.604431, -0.1722067, -0.9784849, 1, 0, 0, 1,
-2.787325, 0.9143752, -1.71596, 1, 0.007843138, 0, 1,
-2.663109, -0.3332441, -1.340708, 1, 0.01176471, 0, 1,
-2.487128, -0.7412581, -0.6329559, 1, 0.01960784, 0, 1,
-2.482018, 0.3279076, -1.063516, 1, 0.02352941, 0, 1,
-2.43236, -0.01371209, -2.292313, 1, 0.03137255, 0, 1,
-2.295562, -0.007487817, -2.356606, 1, 0.03529412, 0, 1,
-2.261384, -0.1998461, -1.803948, 1, 0.04313726, 0, 1,
-2.184318, 1.400171, -2.396138, 1, 0.04705882, 0, 1,
-2.160637, -1.186024, -0.7262641, 1, 0.05490196, 0, 1,
-2.085281, 0.8195069, -0.1554103, 1, 0.05882353, 0, 1,
-2.029294, 1.645397, -0.6999942, 1, 0.06666667, 0, 1,
-2.022897, -0.8556642, -0.9061329, 1, 0.07058824, 0, 1,
-2.021979, 0.1550738, -0.5728232, 1, 0.07843138, 0, 1,
-2.004602, -0.151099, -2.068154, 1, 0.08235294, 0, 1,
-1.979585, -0.002217907, -2.671269, 1, 0.09019608, 0, 1,
-1.912329, 0.8332496, -0.5583489, 1, 0.09411765, 0, 1,
-1.909553, 0.4315008, 0.1935534, 1, 0.1019608, 0, 1,
-1.90638, -2.161895, -1.981708, 1, 0.1098039, 0, 1,
-1.902388, 1.283051, -1.6435, 1, 0.1137255, 0, 1,
-1.895241, 0.7139088, -1.497366, 1, 0.1215686, 0, 1,
-1.884914, 0.6324616, -2.324883, 1, 0.1254902, 0, 1,
-1.869619, -1.202403, -4.302618, 1, 0.1333333, 0, 1,
-1.859414, -1.083318, -2.221851, 1, 0.1372549, 0, 1,
-1.853775, 1.215426, -0.4084023, 1, 0.145098, 0, 1,
-1.852731, 0.6259738, -1.498411, 1, 0.1490196, 0, 1,
-1.82297, 0.9768686, 0.4661027, 1, 0.1568628, 0, 1,
-1.816854, 0.8262171, -0.6605366, 1, 0.1607843, 0, 1,
-1.799089, 0.665796, -0.7537183, 1, 0.1686275, 0, 1,
-1.797101, -0.9790029, -3.256895, 1, 0.172549, 0, 1,
-1.797011, -0.510727, -2.43979, 1, 0.1803922, 0, 1,
-1.796853, 1.126221, -1.760493, 1, 0.1843137, 0, 1,
-1.776801, -1.781343, -2.899619, 1, 0.1921569, 0, 1,
-1.773783, 0.1781907, -2.095452, 1, 0.1960784, 0, 1,
-1.764622, 0.6034847, -1.520624, 1, 0.2039216, 0, 1,
-1.752149, -1.845916, -1.026539, 1, 0.2117647, 0, 1,
-1.744065, 1.163826, -2.26868, 1, 0.2156863, 0, 1,
-1.705766, -0.04282937, -0.9453428, 1, 0.2235294, 0, 1,
-1.69519, 0.4219903, -0.5497951, 1, 0.227451, 0, 1,
-1.693207, 0.8635629, -0.6429738, 1, 0.2352941, 0, 1,
-1.672441, -0.3847249, -1.675269, 1, 0.2392157, 0, 1,
-1.671849, -1.663151, -2.803372, 1, 0.2470588, 0, 1,
-1.669971, -0.4499063, -1.361182, 1, 0.2509804, 0, 1,
-1.657816, 0.6082075, -2.296306, 1, 0.2588235, 0, 1,
-1.650781, 0.1366596, -0.9487606, 1, 0.2627451, 0, 1,
-1.648606, 0.703215, -0.3124194, 1, 0.2705882, 0, 1,
-1.6455, 0.6080142, -1.042065, 1, 0.2745098, 0, 1,
-1.639223, -0.06406195, -1.37208, 1, 0.282353, 0, 1,
-1.623575, -0.4656605, -1.395563, 1, 0.2862745, 0, 1,
-1.608983, -0.01947785, -1.518552, 1, 0.2941177, 0, 1,
-1.599636, -1.61829, -2.88122, 1, 0.3019608, 0, 1,
-1.58324, -2.914803, -1.28275, 1, 0.3058824, 0, 1,
-1.578387, -0.01585001, -0.9120859, 1, 0.3137255, 0, 1,
-1.576083, 0.1287663, -1.93826, 1, 0.3176471, 0, 1,
-1.575333, -0.1133184, -3.871264, 1, 0.3254902, 0, 1,
-1.570788, -2.059505, -3.902692, 1, 0.3294118, 0, 1,
-1.5683, -0.7801796, -1.816112, 1, 0.3372549, 0, 1,
-1.562818, 0.5498021, -1.545084, 1, 0.3411765, 0, 1,
-1.561588, 2.318247, -1.955804, 1, 0.3490196, 0, 1,
-1.558099, 1.248389, 0.779195, 1, 0.3529412, 0, 1,
-1.557466, -0.2296893, -1.608588, 1, 0.3607843, 0, 1,
-1.555306, 2.151859, -1.229439, 1, 0.3647059, 0, 1,
-1.554418, -1.510735, -3.4174, 1, 0.372549, 0, 1,
-1.553035, -0.5230535, -0.8724965, 1, 0.3764706, 0, 1,
-1.550899, -0.9612228, -2.675583, 1, 0.3843137, 0, 1,
-1.531998, 1.524747, -1.813021, 1, 0.3882353, 0, 1,
-1.52656, -0.9424084, -2.298744, 1, 0.3960784, 0, 1,
-1.510494, -1.21705, -1.746681, 1, 0.4039216, 0, 1,
-1.508226, -0.8839466, -2.701792, 1, 0.4078431, 0, 1,
-1.507709, -2.815875, -3.440944, 1, 0.4156863, 0, 1,
-1.507057, 0.03464862, -0.9684986, 1, 0.4196078, 0, 1,
-1.502984, 0.2073188, -1.759736, 1, 0.427451, 0, 1,
-1.50184, -1.169621, -2.779091, 1, 0.4313726, 0, 1,
-1.499602, 0.9690993, -0.7524992, 1, 0.4392157, 0, 1,
-1.494745, 0.9938404, -1.24038, 1, 0.4431373, 0, 1,
-1.492739, 0.4136848, -0.3970692, 1, 0.4509804, 0, 1,
-1.473328, -0.3537788, -3.69976, 1, 0.454902, 0, 1,
-1.463647, -0.2319049, 0.6406707, 1, 0.4627451, 0, 1,
-1.459396, 1.028545, 0.04329826, 1, 0.4666667, 0, 1,
-1.456602, -0.9322615, -1.370144, 1, 0.4745098, 0, 1,
-1.456084, 0.7564551, 0.4014145, 1, 0.4784314, 0, 1,
-1.45583, 0.7302438, -0.6080756, 1, 0.4862745, 0, 1,
-1.453232, 0.5770275, -1.176681, 1, 0.4901961, 0, 1,
-1.453145, -0.2497381, -1.087541, 1, 0.4980392, 0, 1,
-1.449708, 0.3038846, -0.2306083, 1, 0.5058824, 0, 1,
-1.433832, -1.63682, -1.898696, 1, 0.509804, 0, 1,
-1.423492, -0.2667621, -0.960353, 1, 0.5176471, 0, 1,
-1.421636, -0.04847961, -3.466597, 1, 0.5215687, 0, 1,
-1.415791, 1.002668, -4.091259, 1, 0.5294118, 0, 1,
-1.412779, -0.7048476, -1.377333, 1, 0.5333334, 0, 1,
-1.409807, -1.819561, -3.212791, 1, 0.5411765, 0, 1,
-1.399961, -0.06185775, -1.708559, 1, 0.5450981, 0, 1,
-1.399583, 1.594269, -2.525107, 1, 0.5529412, 0, 1,
-1.386648, 0.4288373, -1.758988, 1, 0.5568628, 0, 1,
-1.377271, -0.4197071, -3.258703, 1, 0.5647059, 0, 1,
-1.367909, -1.678503, -2.454687, 1, 0.5686275, 0, 1,
-1.351383, -0.757885, -1.544315, 1, 0.5764706, 0, 1,
-1.341236, 1.35009, -2.791913, 1, 0.5803922, 0, 1,
-1.338953, -0.4434893, -1.235814, 1, 0.5882353, 0, 1,
-1.331288, 0.8268201, -0.08962457, 1, 0.5921569, 0, 1,
-1.329966, -1.534263, -2.386799, 1, 0.6, 0, 1,
-1.322963, 0.5173815, -0.8147696, 1, 0.6078432, 0, 1,
-1.321745, -0.5988294, -1.531131, 1, 0.6117647, 0, 1,
-1.310365, 2.086411, -1.548344, 1, 0.6196079, 0, 1,
-1.309223, 0.3299984, 1.461707, 1, 0.6235294, 0, 1,
-1.304126, -0.5946657, 0.1772712, 1, 0.6313726, 0, 1,
-1.300213, -0.5959162, -2.940398, 1, 0.6352941, 0, 1,
-1.295198, -0.6305528, -0.5906327, 1, 0.6431373, 0, 1,
-1.293966, 0.1116355, -0.744635, 1, 0.6470588, 0, 1,
-1.293624, 0.4444481, -1.13325, 1, 0.654902, 0, 1,
-1.280663, -2.472842, -0.99072, 1, 0.6588235, 0, 1,
-1.272617, 1.183035, 0.1516551, 1, 0.6666667, 0, 1,
-1.271886, 0.6666606, 0.6232759, 1, 0.6705883, 0, 1,
-1.249557, -0.7479948, -2.682368, 1, 0.6784314, 0, 1,
-1.245115, 0.8539258, -1.280313, 1, 0.682353, 0, 1,
-1.241869, -1.930427, -0.9431607, 1, 0.6901961, 0, 1,
-1.239571, -0.4437515, -1.360597, 1, 0.6941177, 0, 1,
-1.23136, -0.7857945, -2.339118, 1, 0.7019608, 0, 1,
-1.219808, 0.1134299, -0.6870484, 1, 0.7098039, 0, 1,
-1.218141, -0.3748026, -3.051908, 1, 0.7137255, 0, 1,
-1.205646, 0.534139, -0.7724661, 1, 0.7215686, 0, 1,
-1.196018, -1.963713, -0.7997069, 1, 0.7254902, 0, 1,
-1.192693, -0.8281954, -2.325111, 1, 0.7333333, 0, 1,
-1.183881, -0.9910821, -3.269238, 1, 0.7372549, 0, 1,
-1.180614, 0.5304492, 0.03609738, 1, 0.7450981, 0, 1,
-1.177988, -0.7833564, -2.243882, 1, 0.7490196, 0, 1,
-1.175833, -1.119171, -3.099128, 1, 0.7568628, 0, 1,
-1.175425, -0.5348736, -2.592355, 1, 0.7607843, 0, 1,
-1.167249, 0.8691799, 1.309018, 1, 0.7686275, 0, 1,
-1.16606, -1.362138, -2.25576, 1, 0.772549, 0, 1,
-1.16263, -0.4488256, -0.6679655, 1, 0.7803922, 0, 1,
-1.159895, 0.1823041, -2.636781, 1, 0.7843137, 0, 1,
-1.156804, -0.6729089, -3.226947, 1, 0.7921569, 0, 1,
-1.154835, 0.9800357, -0.6735835, 1, 0.7960784, 0, 1,
-1.152903, 1.957796, 0.3847468, 1, 0.8039216, 0, 1,
-1.152082, 0.04522097, -2.078171, 1, 0.8117647, 0, 1,
-1.149575, 0.5651655, 0.01077904, 1, 0.8156863, 0, 1,
-1.149076, 0.3675521, -2.335482, 1, 0.8235294, 0, 1,
-1.136147, 2.05936, 0.7429325, 1, 0.827451, 0, 1,
-1.134607, 0.2145114, -2.564527, 1, 0.8352941, 0, 1,
-1.129762, 0.808571, -1.23008, 1, 0.8392157, 0, 1,
-1.11593, 1.577216, -0.03466799, 1, 0.8470588, 0, 1,
-1.112454, -1.462533, -2.66684, 1, 0.8509804, 0, 1,
-1.1122, -0.7562016, -3.38378, 1, 0.8588235, 0, 1,
-1.105071, -0.456035, -2.671881, 1, 0.8627451, 0, 1,
-1.10119, 1.7683, -0.7362473, 1, 0.8705882, 0, 1,
-1.097602, 1.763916, -1.638262, 1, 0.8745098, 0, 1,
-1.085591, 0.2333895, -1.140186, 1, 0.8823529, 0, 1,
-1.085317, 1.103412, -0.6774434, 1, 0.8862745, 0, 1,
-1.077149, -1.281094, -1.922706, 1, 0.8941177, 0, 1,
-1.060543, -0.9139374, -0.9800066, 1, 0.8980392, 0, 1,
-1.051986, -1.968211, -0.2916868, 1, 0.9058824, 0, 1,
-1.05163, 0.2412669, -1.493719, 1, 0.9137255, 0, 1,
-1.04837, -0.09000836, -1.679545, 1, 0.9176471, 0, 1,
-1.041328, -0.3149323, -3.41666, 1, 0.9254902, 0, 1,
-1.041137, 0.2121927, -0.0145179, 1, 0.9294118, 0, 1,
-1.037414, -0.3948807, -0.9262707, 1, 0.9372549, 0, 1,
-1.033826, 2.700926, -0.9100105, 1, 0.9411765, 0, 1,
-1.032785, -0.5491284, -1.144563, 1, 0.9490196, 0, 1,
-1.021573, 0.7574465, -1.066022, 1, 0.9529412, 0, 1,
-1.021416, 0.2095817, -1.226789, 1, 0.9607843, 0, 1,
-1.020554, -0.1268441, -0.4322236, 1, 0.9647059, 0, 1,
-1.017696, -0.717155, -1.870471, 1, 0.972549, 0, 1,
-1.008299, 0.7667516, -0.438959, 1, 0.9764706, 0, 1,
-1.001507, 0.2639168, -1.215721, 1, 0.9843137, 0, 1,
-0.9962816, 0.684877, -2.90012, 1, 0.9882353, 0, 1,
-0.9950067, -0.02926293, -0.5569335, 1, 0.9960784, 0, 1,
-0.983461, -0.006592842, 0.2900407, 0.9960784, 1, 0, 1,
-0.974788, 0.3441072, -2.003264, 0.9921569, 1, 0, 1,
-0.9701956, -1.477656, -1.810448, 0.9843137, 1, 0, 1,
-0.9676958, -2.132796, -2.743798, 0.9803922, 1, 0, 1,
-0.9642838, 0.3166835, -1.293844, 0.972549, 1, 0, 1,
-0.9629176, -0.4131183, -3.343264, 0.9686275, 1, 0, 1,
-0.9613296, -0.7338093, -2.845344, 0.9607843, 1, 0, 1,
-0.9453535, -1.182594, -2.923167, 0.9568627, 1, 0, 1,
-0.9429001, -0.1399079, -3.002696, 0.9490196, 1, 0, 1,
-0.9428411, -1.228169, -2.837789, 0.945098, 1, 0, 1,
-0.936913, 0.6151768, -1.291475, 0.9372549, 1, 0, 1,
-0.9349419, -0.7164494, -1.792216, 0.9333333, 1, 0, 1,
-0.9282379, -0.5060413, 0.05273933, 0.9254902, 1, 0, 1,
-0.9279023, -1.742412, -3.743715, 0.9215686, 1, 0, 1,
-0.9269748, -1.041095, -2.801925, 0.9137255, 1, 0, 1,
-0.9140138, -1.17844, -0.7394593, 0.9098039, 1, 0, 1,
-0.9102944, 0.0439876, -0.8833394, 0.9019608, 1, 0, 1,
-0.9077911, -1.037899, -1.525725, 0.8941177, 1, 0, 1,
-0.904421, -0.0213613, -1.568877, 0.8901961, 1, 0, 1,
-0.9040706, -0.5678309, -1.866435, 0.8823529, 1, 0, 1,
-0.9029358, -0.328494, -3.763391, 0.8784314, 1, 0, 1,
-0.9007605, 1.343516, -1.634457, 0.8705882, 1, 0, 1,
-0.8989178, -0.2099248, -2.798519, 0.8666667, 1, 0, 1,
-0.8953711, 1.720905, -0.5686476, 0.8588235, 1, 0, 1,
-0.8935223, 0.7700629, -1.164292, 0.854902, 1, 0, 1,
-0.8852646, 1.108971, 0.6864462, 0.8470588, 1, 0, 1,
-0.8812872, 1.536685, -0.3553694, 0.8431373, 1, 0, 1,
-0.8807419, 0.7686162, -0.2755666, 0.8352941, 1, 0, 1,
-0.8782594, 1.28746, 0.09853323, 0.8313726, 1, 0, 1,
-0.8720879, -1.556763, -3.351671, 0.8235294, 1, 0, 1,
-0.8708105, 1.478518, -1.099564, 0.8196079, 1, 0, 1,
-0.8631893, -2.048283, -2.626916, 0.8117647, 1, 0, 1,
-0.8630325, 0.7038782, -1.596095, 0.8078431, 1, 0, 1,
-0.8627939, 0.5713279, -0.6073696, 0.8, 1, 0, 1,
-0.8522042, 0.9478177, -0.0004265658, 0.7921569, 1, 0, 1,
-0.851845, -0.6643356, -4.523193, 0.7882353, 1, 0, 1,
-0.8463032, 1.897635, 0.4141177, 0.7803922, 1, 0, 1,
-0.8457881, 0.6592022, -2.349221, 0.7764706, 1, 0, 1,
-0.8446895, -0.02935965, -1.598845, 0.7686275, 1, 0, 1,
-0.8432152, -0.4349359, -1.886819, 0.7647059, 1, 0, 1,
-0.8375874, -0.1136509, -2.467512, 0.7568628, 1, 0, 1,
-0.8374048, 0.6127493, -1.871131, 0.7529412, 1, 0, 1,
-0.8364845, -0.3632372, -1.080731, 0.7450981, 1, 0, 1,
-0.835766, -0.2646136, 0.8998058, 0.7411765, 1, 0, 1,
-0.8288468, -1.271309, -2.164641, 0.7333333, 1, 0, 1,
-0.8287469, 0.7797295, -0.5254933, 0.7294118, 1, 0, 1,
-0.8257758, 0.1123102, -1.336432, 0.7215686, 1, 0, 1,
-0.8257533, 0.5186412, -0.1764913, 0.7176471, 1, 0, 1,
-0.8248619, 0.9180375, -0.5914264, 0.7098039, 1, 0, 1,
-0.8240374, -0.7667267, -2.585942, 0.7058824, 1, 0, 1,
-0.8201692, -0.01257932, 0.1910469, 0.6980392, 1, 0, 1,
-0.8185945, 0.09304939, -0.4503931, 0.6901961, 1, 0, 1,
-0.8164679, 1.318884, -0.7675757, 0.6862745, 1, 0, 1,
-0.8116229, 0.05804173, -0.7355374, 0.6784314, 1, 0, 1,
-0.8097389, 1.019179, -0.129158, 0.6745098, 1, 0, 1,
-0.8073902, 0.04588104, -0.8071476, 0.6666667, 1, 0, 1,
-0.8071242, -1.118728, -2.400143, 0.6627451, 1, 0, 1,
-0.8071156, -0.144804, -0.5235046, 0.654902, 1, 0, 1,
-0.8054177, -1.378994, -1.528998, 0.6509804, 1, 0, 1,
-0.8042622, 0.04232137, -1.791176, 0.6431373, 1, 0, 1,
-0.7999089, -0.06247092, -1.362922, 0.6392157, 1, 0, 1,
-0.7978625, -0.6194206, -0.9259309, 0.6313726, 1, 0, 1,
-0.790068, 0.547684, -0.397455, 0.627451, 1, 0, 1,
-0.7893394, -1.948315, -2.427863, 0.6196079, 1, 0, 1,
-0.786235, 0.9381402, -1.414088, 0.6156863, 1, 0, 1,
-0.7752345, 0.4909382, -0.3405462, 0.6078432, 1, 0, 1,
-0.7617403, 0.7447108, -0.7613434, 0.6039216, 1, 0, 1,
-0.7595394, 1.397015, -0.054374, 0.5960785, 1, 0, 1,
-0.7591318, -1.687391, -3.361818, 0.5882353, 1, 0, 1,
-0.7509868, 1.175261, 0.2355004, 0.5843138, 1, 0, 1,
-0.7500229, -0.101243, -0.9536254, 0.5764706, 1, 0, 1,
-0.7480314, -1.377943, -2.873698, 0.572549, 1, 0, 1,
-0.7461406, -1.343132, -2.981395, 0.5647059, 1, 0, 1,
-0.7396585, -0.3579499, -3.794983, 0.5607843, 1, 0, 1,
-0.7380933, 0.5813097, -2.073201, 0.5529412, 1, 0, 1,
-0.7321678, -0.9440949, -0.8865742, 0.5490196, 1, 0, 1,
-0.7318662, 1.510512, -0.1497205, 0.5411765, 1, 0, 1,
-0.7311842, 0.3452953, -1.454325, 0.5372549, 1, 0, 1,
-0.7309135, 0.573458, -0.08014573, 0.5294118, 1, 0, 1,
-0.7222158, -2.860836, -2.830253, 0.5254902, 1, 0, 1,
-0.7166427, 0.06478627, -1.926884, 0.5176471, 1, 0, 1,
-0.7157956, 0.1642924, -0.5761602, 0.5137255, 1, 0, 1,
-0.7127497, -0.6947173, -2.951894, 0.5058824, 1, 0, 1,
-0.7106457, -0.5965939, -1.960818, 0.5019608, 1, 0, 1,
-0.7095393, 2.874326, -0.1800527, 0.4941176, 1, 0, 1,
-0.7088845, -0.06567381, -2.505253, 0.4862745, 1, 0, 1,
-0.7086287, 0.05139662, 0.2790169, 0.4823529, 1, 0, 1,
-0.7004715, -0.650707, -2.314281, 0.4745098, 1, 0, 1,
-0.6988224, 2.86166, 0.02909011, 0.4705882, 1, 0, 1,
-0.6893874, 1.426831, -0.6564547, 0.4627451, 1, 0, 1,
-0.6870257, 1.15668, 0.7583935, 0.4588235, 1, 0, 1,
-0.6837362, -0.5815443, -3.821423, 0.4509804, 1, 0, 1,
-0.6830786, 1.242237, 0.06472196, 0.4470588, 1, 0, 1,
-0.6792555, -0.3956205, -0.08656466, 0.4392157, 1, 0, 1,
-0.6772391, -1.889042, -4.868706, 0.4352941, 1, 0, 1,
-0.6709045, -0.7869694, -0.8200731, 0.427451, 1, 0, 1,
-0.6697637, -1.160637, -3.445446, 0.4235294, 1, 0, 1,
-0.6592481, -0.5724985, -3.32445, 0.4156863, 1, 0, 1,
-0.6573667, 0.01397389, -1.251269, 0.4117647, 1, 0, 1,
-0.6502306, -0.2291027, 0.1611842, 0.4039216, 1, 0, 1,
-0.6494322, 0.8701305, 0.6627142, 0.3960784, 1, 0, 1,
-0.6489649, 1.585722, -0.8174723, 0.3921569, 1, 0, 1,
-0.6487595, 0.9216385, 1.359179, 0.3843137, 1, 0, 1,
-0.6486725, -0.3226092, -3.508824, 0.3803922, 1, 0, 1,
-0.6480608, 0.3295679, 0.1717671, 0.372549, 1, 0, 1,
-0.6475699, 0.5225539, 0.290746, 0.3686275, 1, 0, 1,
-0.6465329, -2.017349, -2.487407, 0.3607843, 1, 0, 1,
-0.6450142, 0.4018906, -0.874877, 0.3568628, 1, 0, 1,
-0.644087, 1.361877, -1.289069, 0.3490196, 1, 0, 1,
-0.6423419, 0.919726, -2.478267, 0.345098, 1, 0, 1,
-0.642141, -1.654182, -1.222989, 0.3372549, 1, 0, 1,
-0.6372806, 1.70379, 0.7857698, 0.3333333, 1, 0, 1,
-0.6315849, 1.159276, -1.412511, 0.3254902, 1, 0, 1,
-0.6311078, -0.8101853, -1.143077, 0.3215686, 1, 0, 1,
-0.6285013, -1.316836, -2.457153, 0.3137255, 1, 0, 1,
-0.6234952, 1.007736, -1.048709, 0.3098039, 1, 0, 1,
-0.6211696, -0.3179803, -3.029258, 0.3019608, 1, 0, 1,
-0.6211041, 0.8663454, -2.232689, 0.2941177, 1, 0, 1,
-0.6185303, -0.9991913, -3.029625, 0.2901961, 1, 0, 1,
-0.6183015, -0.8642196, -2.508769, 0.282353, 1, 0, 1,
-0.6161631, 1.879662, -1.475249, 0.2784314, 1, 0, 1,
-0.6115075, 0.3148681, -0.2588866, 0.2705882, 1, 0, 1,
-0.608295, -0.6474399, -1.861918, 0.2666667, 1, 0, 1,
-0.6047999, -1.191712, -2.449675, 0.2588235, 1, 0, 1,
-0.5980627, 1.77222, -0.4495154, 0.254902, 1, 0, 1,
-0.597841, 3.525645, 1.318805, 0.2470588, 1, 0, 1,
-0.597577, 0.2661032, -2.048148, 0.2431373, 1, 0, 1,
-0.5935225, -1.015336, -3.529707, 0.2352941, 1, 0, 1,
-0.5927852, 1.468952, 1.227854, 0.2313726, 1, 0, 1,
-0.5898076, 1.513832, 0.2565388, 0.2235294, 1, 0, 1,
-0.586857, -0.7707661, -1.998306, 0.2196078, 1, 0, 1,
-0.5838308, -0.2812514, -2.532098, 0.2117647, 1, 0, 1,
-0.5833676, 0.8410797, -0.7709675, 0.2078431, 1, 0, 1,
-0.5808229, 0.8898057, -2.094182, 0.2, 1, 0, 1,
-0.5805757, -0.4940964, -2.5797, 0.1921569, 1, 0, 1,
-0.5790262, 0.5947812, 0.4142191, 0.1882353, 1, 0, 1,
-0.5741245, 0.8484629, -0.3958597, 0.1803922, 1, 0, 1,
-0.5738065, 2.121242, -0.4459568, 0.1764706, 1, 0, 1,
-0.5657958, 0.9134576, 0.7402164, 0.1686275, 1, 0, 1,
-0.5656595, -0.7122594, -2.080993, 0.1647059, 1, 0, 1,
-0.557603, -0.3786184, -2.309063, 0.1568628, 1, 0, 1,
-0.5564973, -0.1093186, -0.5011982, 0.1529412, 1, 0, 1,
-0.5544684, 2.624645, 0.03963269, 0.145098, 1, 0, 1,
-0.5538691, 0.7249599, 0.775133, 0.1411765, 1, 0, 1,
-0.5508714, -0.91526, -2.42022, 0.1333333, 1, 0, 1,
-0.5498497, -1.146383, -2.587006, 0.1294118, 1, 0, 1,
-0.5459038, 1.144083, -0.9407347, 0.1215686, 1, 0, 1,
-0.5436451, -1.980392, -1.376284, 0.1176471, 1, 0, 1,
-0.5433747, -0.7461635, -2.612565, 0.1098039, 1, 0, 1,
-0.5411304, -1.067331, -2.433112, 0.1058824, 1, 0, 1,
-0.5398319, 0.2371749, -1.238588, 0.09803922, 1, 0, 1,
-0.5377597, 0.1371035, -1.920564, 0.09019608, 1, 0, 1,
-0.5376821, -0.6959708, -2.859994, 0.08627451, 1, 0, 1,
-0.5183212, -0.01721722, 0.7708454, 0.07843138, 1, 0, 1,
-0.5155121, 1.707455, -1.477306, 0.07450981, 1, 0, 1,
-0.5142843, -0.1599467, -2.891623, 0.06666667, 1, 0, 1,
-0.5075597, 2.181982, -1.086014, 0.0627451, 1, 0, 1,
-0.4998085, -0.211809, -2.237918, 0.05490196, 1, 0, 1,
-0.4977396, -0.7431201, -3.549161, 0.05098039, 1, 0, 1,
-0.4926578, 0.2205928, -1.064784, 0.04313726, 1, 0, 1,
-0.4918915, -0.592805, -3.061016, 0.03921569, 1, 0, 1,
-0.4916295, 0.4395229, -0.1493435, 0.03137255, 1, 0, 1,
-0.490202, 0.3313175, -1.326177, 0.02745098, 1, 0, 1,
-0.4771584, -0.1946546, -2.186618, 0.01960784, 1, 0, 1,
-0.475782, -0.7097483, -2.868359, 0.01568628, 1, 0, 1,
-0.4683245, 1.66127, 0.3759071, 0.007843138, 1, 0, 1,
-0.4668435, -1.334252, -3.677739, 0.003921569, 1, 0, 1,
-0.4642255, 0.4888242, 0.6554647, 0, 1, 0.003921569, 1,
-0.4599457, 1.230501, 1.080813, 0, 1, 0.01176471, 1,
-0.4597016, 1.640443, -0.7855258, 0, 1, 0.01568628, 1,
-0.4586789, 0.4078438, -0.363472, 0, 1, 0.02352941, 1,
-0.4533279, -0.6099353, -2.151207, 0, 1, 0.02745098, 1,
-0.4530576, -0.8317371, -2.591773, 0, 1, 0.03529412, 1,
-0.449971, -0.557893, -3.064306, 0, 1, 0.03921569, 1,
-0.4456992, -0.6082557, -1.298071, 0, 1, 0.04705882, 1,
-0.445696, 0.04899616, -0.321206, 0, 1, 0.05098039, 1,
-0.4455708, 0.4618081, -0.5309979, 0, 1, 0.05882353, 1,
-0.4442854, -1.150205, -1.199564, 0, 1, 0.0627451, 1,
-0.4431356, 1.172617, 0.3462226, 0, 1, 0.07058824, 1,
-0.4428441, -1.111209, -0.9761274, 0, 1, 0.07450981, 1,
-0.4391405, 0.509473, -1.41444, 0, 1, 0.08235294, 1,
-0.4384933, 0.4647011, -1.069618, 0, 1, 0.08627451, 1,
-0.437429, 0.4621097, -0.5584355, 0, 1, 0.09411765, 1,
-0.4343206, -1.371992, -2.490359, 0, 1, 0.1019608, 1,
-0.430772, -0.1162357, -1.031486, 0, 1, 0.1058824, 1,
-0.4293019, -1.521343, -3.721391, 0, 1, 0.1137255, 1,
-0.4283484, -0.8734323, -3.596365, 0, 1, 0.1176471, 1,
-0.4271886, 1.380242, 0.9018388, 0, 1, 0.1254902, 1,
-0.4201286, -1.788457, -3.934172, 0, 1, 0.1294118, 1,
-0.4174189, -0.2539949, -4.002802, 0, 1, 0.1372549, 1,
-0.4173067, 0.5266795, 0.743226, 0, 1, 0.1411765, 1,
-0.4159397, 1.114083, 0.007882403, 0, 1, 0.1490196, 1,
-0.4158321, -0.5678985, -2.902321, 0, 1, 0.1529412, 1,
-0.4142199, 0.5231952, -1.467859, 0, 1, 0.1607843, 1,
-0.4138698, -0.1468505, -1.502973, 0, 1, 0.1647059, 1,
-0.4048126, -0.9840258, -3.182481, 0, 1, 0.172549, 1,
-0.4017088, -0.7214018, -0.735153, 0, 1, 0.1764706, 1,
-0.3856694, -0.2435857, -2.463006, 0, 1, 0.1843137, 1,
-0.3849772, -0.03554214, -0.9329991, 0, 1, 0.1882353, 1,
-0.3849016, -0.04069491, -0.1714829, 0, 1, 0.1960784, 1,
-0.3827231, -0.5980346, -3.255449, 0, 1, 0.2039216, 1,
-0.3805458, -1.834233, -2.836428, 0, 1, 0.2078431, 1,
-0.3794756, -0.9706895, -2.550337, 0, 1, 0.2156863, 1,
-0.3775624, 1.563627, 0.09916297, 0, 1, 0.2196078, 1,
-0.3768423, 1.208319, 0.4506948, 0, 1, 0.227451, 1,
-0.3737934, -0.2795902, -3.045725, 0, 1, 0.2313726, 1,
-0.3717341, 0.9334275, -0.5710956, 0, 1, 0.2392157, 1,
-0.3673656, -1.893167, -3.394906, 0, 1, 0.2431373, 1,
-0.3633916, -2.24351, -2.953705, 0, 1, 0.2509804, 1,
-0.3621772, -1.563492, -1.724967, 0, 1, 0.254902, 1,
-0.361742, 0.7953057, 0.1169737, 0, 1, 0.2627451, 1,
-0.3616113, -1.491938, -3.008258, 0, 1, 0.2666667, 1,
-0.3613791, -1.527059, -3.047536, 0, 1, 0.2745098, 1,
-0.3468652, -0.7590337, -0.5933676, 0, 1, 0.2784314, 1,
-0.3409411, 1.854171, -0.1388227, 0, 1, 0.2862745, 1,
-0.3408303, 0.3532788, 0.3720157, 0, 1, 0.2901961, 1,
-0.3375953, 0.7995034, 0.2102741, 0, 1, 0.2980392, 1,
-0.3300785, 1.184242, -1.509194, 0, 1, 0.3058824, 1,
-0.3293486, -0.8745562, -2.530502, 0, 1, 0.3098039, 1,
-0.3285531, 1.30301, 0.2930634, 0, 1, 0.3176471, 1,
-0.3254924, -0.2316274, -2.273142, 0, 1, 0.3215686, 1,
-0.3225928, -0.6017445, -3.271288, 0, 1, 0.3294118, 1,
-0.3225854, -0.4525055, -3.417836, 0, 1, 0.3333333, 1,
-0.322179, -0.3625312, -2.314892, 0, 1, 0.3411765, 1,
-0.3216903, 1.026406, -1.855291, 0, 1, 0.345098, 1,
-0.3171828, 0.8276498, 0.151105, 0, 1, 0.3529412, 1,
-0.3134718, 0.4338641, -0.5059953, 0, 1, 0.3568628, 1,
-0.3118503, -0.4869668, 0.2960648, 0, 1, 0.3647059, 1,
-0.3074872, 0.4289609, -1.061521, 0, 1, 0.3686275, 1,
-0.3030305, -0.797424, -3.312726, 0, 1, 0.3764706, 1,
-0.3010209, 1.404286, -1.272466, 0, 1, 0.3803922, 1,
-0.300698, -0.7325783, -2.365238, 0, 1, 0.3882353, 1,
-0.3001575, 0.6444104, -0.9785626, 0, 1, 0.3921569, 1,
-0.2992209, -0.3886069, -2.124241, 0, 1, 0.4, 1,
-0.2985708, 0.0650991, -2.680687, 0, 1, 0.4078431, 1,
-0.2960087, -0.4652421, -1.470955, 0, 1, 0.4117647, 1,
-0.2941065, 0.3077778, -1.346509, 0, 1, 0.4196078, 1,
-0.2912216, -1.414508, -3.325752, 0, 1, 0.4235294, 1,
-0.2865837, 0.5679243, -1.326662, 0, 1, 0.4313726, 1,
-0.2860947, -0.2197307, -1.910696, 0, 1, 0.4352941, 1,
-0.2859721, 0.8701194, -0.6827903, 0, 1, 0.4431373, 1,
-0.278118, 1.879747, 0.2322469, 0, 1, 0.4470588, 1,
-0.2764346, -0.7016929, -1.896777, 0, 1, 0.454902, 1,
-0.2737139, 0.4870797, -1.640375, 0, 1, 0.4588235, 1,
-0.26878, 0.08387195, -1.201334, 0, 1, 0.4666667, 1,
-0.2679379, -1.062965, -5.791804, 0, 1, 0.4705882, 1,
-0.2666817, -2.276241, -2.884492, 0, 1, 0.4784314, 1,
-0.2666308, 1.019622, -0.8515559, 0, 1, 0.4823529, 1,
-0.2650256, 0.3027878, -0.02040922, 0, 1, 0.4901961, 1,
-0.2608121, 0.2339363, -0.580797, 0, 1, 0.4941176, 1,
-0.258088, -0.6528204, -2.639706, 0, 1, 0.5019608, 1,
-0.2511561, 0.2674781, -1.440466, 0, 1, 0.509804, 1,
-0.2489744, -0.8320702, -2.177266, 0, 1, 0.5137255, 1,
-0.2396726, 0.7804143, 0.1666784, 0, 1, 0.5215687, 1,
-0.2350643, 0.3852626, 0.06646746, 0, 1, 0.5254902, 1,
-0.2328319, -1.632406, -4.069359, 0, 1, 0.5333334, 1,
-0.2297806, -0.5124967, -3.488125, 0, 1, 0.5372549, 1,
-0.2257955, 0.4332749, -1.607167, 0, 1, 0.5450981, 1,
-0.2255848, -0.2027531, -2.054466, 0, 1, 0.5490196, 1,
-0.2245958, 0.1962085, -1.175009, 0, 1, 0.5568628, 1,
-0.2236014, -1.919867, -2.108354, 0, 1, 0.5607843, 1,
-0.2162813, -0.1994728, -3.334206, 0, 1, 0.5686275, 1,
-0.2111417, -0.1171103, -1.803196, 0, 1, 0.572549, 1,
-0.2107685, 0.03871418, -1.100397, 0, 1, 0.5803922, 1,
-0.2088259, -1.097176, -2.862145, 0, 1, 0.5843138, 1,
-0.2031771, 0.4781244, -1.431192, 0, 1, 0.5921569, 1,
-0.2027922, -0.889151, -4.171953, 0, 1, 0.5960785, 1,
-0.1982469, 0.776267, -1.439412, 0, 1, 0.6039216, 1,
-0.1959884, 0.6515815, 0.1529684, 0, 1, 0.6117647, 1,
-0.1948292, -0.2532747, -3.751171, 0, 1, 0.6156863, 1,
-0.1895066, -0.01753519, -1.358506, 0, 1, 0.6235294, 1,
-0.1831944, -0.0453058, -1.741606, 0, 1, 0.627451, 1,
-0.182094, -1.198065, -1.510279, 0, 1, 0.6352941, 1,
-0.1813602, -0.8373846, -2.688036, 0, 1, 0.6392157, 1,
-0.1801915, 0.4429557, 0.829874, 0, 1, 0.6470588, 1,
-0.1793909, -0.4541646, -2.856794, 0, 1, 0.6509804, 1,
-0.1775335, -0.4099324, -0.9954132, 0, 1, 0.6588235, 1,
-0.1771015, -1.157021, -3.086705, 0, 1, 0.6627451, 1,
-0.1767193, -0.2553727, -0.7770337, 0, 1, 0.6705883, 1,
-0.1755783, -1.71378, -4.014607, 0, 1, 0.6745098, 1,
-0.175336, -0.1505461, -3.617559, 0, 1, 0.682353, 1,
-0.1746995, 0.08074717, -1.749967, 0, 1, 0.6862745, 1,
-0.1705855, 1.187627, -0.9345738, 0, 1, 0.6941177, 1,
-0.1683437, 0.5234091, 0.5841585, 0, 1, 0.7019608, 1,
-0.1636724, -0.005279341, -3.000012, 0, 1, 0.7058824, 1,
-0.1612972, 0.1893845, -1.711148, 0, 1, 0.7137255, 1,
-0.1579715, -0.8468242, -3.206114, 0, 1, 0.7176471, 1,
-0.1579549, -0.5044249, -0.8683968, 0, 1, 0.7254902, 1,
-0.1571971, 0.8259524, 1.714069, 0, 1, 0.7294118, 1,
-0.1539173, -0.8329619, -3.574605, 0, 1, 0.7372549, 1,
-0.1443025, -1.134463, -3.403935, 0, 1, 0.7411765, 1,
-0.1439057, 0.4081656, 0.8231357, 0, 1, 0.7490196, 1,
-0.1425354, -0.6670192, -4.345844, 0, 1, 0.7529412, 1,
-0.1422431, 1.004404, 1.767386, 0, 1, 0.7607843, 1,
-0.1415792, 0.9383096, 0.6855684, 0, 1, 0.7647059, 1,
-0.1406699, 1.695023, 0.07487054, 0, 1, 0.772549, 1,
-0.1402264, -0.9826648, -3.252026, 0, 1, 0.7764706, 1,
-0.1373068, 1.072341, -0.1732301, 0, 1, 0.7843137, 1,
-0.1372738, -2.112543, -1.882123, 0, 1, 0.7882353, 1,
-0.1366612, -0.1499001, -1.809159, 0, 1, 0.7960784, 1,
-0.1354164, -0.4310702, -2.210418, 0, 1, 0.8039216, 1,
-0.1350743, -0.06156427, -0.6846125, 0, 1, 0.8078431, 1,
-0.1324107, 0.57743, -0.4558716, 0, 1, 0.8156863, 1,
-0.1315053, -0.4425862, -2.408293, 0, 1, 0.8196079, 1,
-0.1305669, 1.507882, -0.5425526, 0, 1, 0.827451, 1,
-0.1286706, -2.818048, -0.8858346, 0, 1, 0.8313726, 1,
-0.1245365, -1.544024, -3.892359, 0, 1, 0.8392157, 1,
-0.1235113, 1.330424, 0.910346, 0, 1, 0.8431373, 1,
-0.1225904, -0.4658478, -2.18609, 0, 1, 0.8509804, 1,
-0.1214173, 0.9852796, -0.1327433, 0, 1, 0.854902, 1,
-0.1167276, 1.302804, 0.1324882, 0, 1, 0.8627451, 1,
-0.1158612, -0.5529996, -2.84018, 0, 1, 0.8666667, 1,
-0.112024, -1.251854, -2.310682, 0, 1, 0.8745098, 1,
-0.1115565, 0.8578684, -0.1610469, 0, 1, 0.8784314, 1,
-0.1111126, 0.8373818, 1.413622, 0, 1, 0.8862745, 1,
-0.1062359, 2.185247, -1.395086, 0, 1, 0.8901961, 1,
-0.1057806, 0.5640988, 0.9427738, 0, 1, 0.8980392, 1,
-0.1029806, -0.304913, -3.041127, 0, 1, 0.9058824, 1,
-0.1023001, 1.758555, 1.552347, 0, 1, 0.9098039, 1,
-0.1021003, -1.716151, -2.119043, 0, 1, 0.9176471, 1,
-0.1003941, 1.18923, 0.2150494, 0, 1, 0.9215686, 1,
-0.09115645, 0.5796532, -0.5775109, 0, 1, 0.9294118, 1,
-0.09033947, -1.700999, -2.287544, 0, 1, 0.9333333, 1,
-0.0889337, -1.898315, -3.24177, 0, 1, 0.9411765, 1,
-0.08886382, -0.8677834, -3.623278, 0, 1, 0.945098, 1,
-0.08834068, -0.1970683, -3.029209, 0, 1, 0.9529412, 1,
-0.08674861, 3.01061, 1.60201, 0, 1, 0.9568627, 1,
-0.07826429, 1.177124, 1.450691, 0, 1, 0.9647059, 1,
-0.07604483, -0.08106866, -2.66272, 0, 1, 0.9686275, 1,
-0.06319217, -1.163559, -4.956537, 0, 1, 0.9764706, 1,
-0.06251583, 0.9894018, -0.8655295, 0, 1, 0.9803922, 1,
-0.06175936, 0.8490642, -1.806935, 0, 1, 0.9882353, 1,
-0.05713168, -0.5809169, -0.9949487, 0, 1, 0.9921569, 1,
-0.05457389, -0.509258, -4.146854, 0, 1, 1, 1,
-0.0544726, -1.782687, -3.10988, 0, 0.9921569, 1, 1,
-0.05128024, 0.4906476, 0.7375535, 0, 0.9882353, 1, 1,
-0.04933332, 1.827138, 0.8557685, 0, 0.9803922, 1, 1,
-0.04555124, 0.1864736, 0.3624493, 0, 0.9764706, 1, 1,
-0.04462849, 0.1934727, -0.5969145, 0, 0.9686275, 1, 1,
-0.04392445, 1.361146, -1.154895, 0, 0.9647059, 1, 1,
-0.04212969, -0.304341, -2.06905, 0, 0.9568627, 1, 1,
-0.0369004, -0.03935145, -1.549936, 0, 0.9529412, 1, 1,
-0.03662121, 0.6639329, 0.4545213, 0, 0.945098, 1, 1,
-0.03509618, 2.097824, 2.333187, 0, 0.9411765, 1, 1,
-0.03414757, 1.007007, 0.5780871, 0, 0.9333333, 1, 1,
-0.03293188, -0.580108, -0.8560814, 0, 0.9294118, 1, 1,
-0.02364238, 0.1973651, -0.1904077, 0, 0.9215686, 1, 1,
-0.02214932, 0.4924636, -0.7249612, 0, 0.9176471, 1, 1,
-0.02163819, 0.4452792, -0.6014769, 0, 0.9098039, 1, 1,
-0.01926321, -3.032548, -3.518914, 0, 0.9058824, 1, 1,
-0.01847523, -1.652649, -2.914903, 0, 0.8980392, 1, 1,
-0.01078164, 0.36342, 1.698486, 0, 0.8901961, 1, 1,
-0.009472458, -0.6681439, -2.917414, 0, 0.8862745, 1, 1,
-0.004445766, -0.8498745, -2.446108, 0, 0.8784314, 1, 1,
0.005039075, 0.8744554, -0.6490945, 0, 0.8745098, 1, 1,
0.01227268, 1.968395, -0.1331899, 0, 0.8666667, 1, 1,
0.01348905, -0.2070225, 2.527498, 0, 0.8627451, 1, 1,
0.01444597, 1.07047, 0.2079755, 0, 0.854902, 1, 1,
0.01665928, 0.1382467, 0.2683462, 0, 0.8509804, 1, 1,
0.01741044, -1.289474, 2.602825, 0, 0.8431373, 1, 1,
0.02011632, 0.3485397, -0.9639722, 0, 0.8392157, 1, 1,
0.02388564, 1.104242, 0.4022253, 0, 0.8313726, 1, 1,
0.02486253, 1.232608, -1.081062, 0, 0.827451, 1, 1,
0.03238333, 0.182272, 0.2288619, 0, 0.8196079, 1, 1,
0.03293204, 0.2147977, 0.4579781, 0, 0.8156863, 1, 1,
0.03680779, -0.6488544, 3.440643, 0, 0.8078431, 1, 1,
0.03872424, 0.4773304, -0.1366601, 0, 0.8039216, 1, 1,
0.0387535, 0.8557855, -0.2980955, 0, 0.7960784, 1, 1,
0.04277746, -2.433896, 2.997191, 0, 0.7882353, 1, 1,
0.04364424, 1.207949, 0.3473732, 0, 0.7843137, 1, 1,
0.046225, 0.236695, 0.03156934, 0, 0.7764706, 1, 1,
0.04808573, -0.06872217, 2.689797, 0, 0.772549, 1, 1,
0.04965338, -0.1441872, 3.225232, 0, 0.7647059, 1, 1,
0.05552415, -1.27988, 5.54952, 0, 0.7607843, 1, 1,
0.05591108, 0.6145502, 0.02285315, 0, 0.7529412, 1, 1,
0.05778712, -0.06744266, 2.222588, 0, 0.7490196, 1, 1,
0.05789856, -1.073892, 1.481833, 0, 0.7411765, 1, 1,
0.06050731, -0.8054295, 3.523, 0, 0.7372549, 1, 1,
0.06322911, -1.081997, 2.742274, 0, 0.7294118, 1, 1,
0.0693213, -1.165012, 1.312128, 0, 0.7254902, 1, 1,
0.07141354, -0.3576828, 3.116333, 0, 0.7176471, 1, 1,
0.07456306, 0.03760567, 1.624658, 0, 0.7137255, 1, 1,
0.07501493, 1.240993, -0.1984879, 0, 0.7058824, 1, 1,
0.07607161, 1.882605, 0.633524, 0, 0.6980392, 1, 1,
0.07649035, -0.6076615, 1.711936, 0, 0.6941177, 1, 1,
0.07809862, -0.2802093, 2.371305, 0, 0.6862745, 1, 1,
0.07910793, 0.04109759, -0.9961811, 0, 0.682353, 1, 1,
0.08218167, -0.2821642, 4.810847, 0, 0.6745098, 1, 1,
0.08403188, 1.796208, 0.4961788, 0, 0.6705883, 1, 1,
0.0859271, 0.989795, 0.7993039, 0, 0.6627451, 1, 1,
0.08649331, 0.08209007, -0.02681789, 0, 0.6588235, 1, 1,
0.08681752, -0.8791139, 2.392945, 0, 0.6509804, 1, 1,
0.088265, 1.291763, -0.05333626, 0, 0.6470588, 1, 1,
0.09340951, 0.2434034, 0.6633191, 0, 0.6392157, 1, 1,
0.09970932, -0.0795031, 0.798487, 0, 0.6352941, 1, 1,
0.1000265, -0.5089725, 1.284009, 0, 0.627451, 1, 1,
0.1055663, 0.3363649, 1.238856, 0, 0.6235294, 1, 1,
0.1081354, -0.4699983, 1.336084, 0, 0.6156863, 1, 1,
0.110815, 0.2411467, 1.009887, 0, 0.6117647, 1, 1,
0.11188, -0.4763398, 3.709759, 0, 0.6039216, 1, 1,
0.1119266, -0.33044, 2.304347, 0, 0.5960785, 1, 1,
0.1152866, -1.252653, 2.056499, 0, 0.5921569, 1, 1,
0.1161578, -1.675496, 3.674808, 0, 0.5843138, 1, 1,
0.1264664, -0.9869624, 3.501135, 0, 0.5803922, 1, 1,
0.1285268, 0.08377766, 1.26414, 0, 0.572549, 1, 1,
0.1298088, 0.6119297, -0.1094636, 0, 0.5686275, 1, 1,
0.1334757, -0.7789443, 1.49813, 0, 0.5607843, 1, 1,
0.1340974, 1.756501, -0.6052036, 0, 0.5568628, 1, 1,
0.1402754, -0.5175307, 3.003096, 0, 0.5490196, 1, 1,
0.1405069, -1.017803, 4.465403, 0, 0.5450981, 1, 1,
0.1438925, -0.8938036, 3.127173, 0, 0.5372549, 1, 1,
0.1449285, 0.2252741, 1.110188, 0, 0.5333334, 1, 1,
0.1490391, -0.5212693, 2.117037, 0, 0.5254902, 1, 1,
0.1509742, -0.4365179, 3.519768, 0, 0.5215687, 1, 1,
0.1548094, 0.8268729, 0.4345134, 0, 0.5137255, 1, 1,
0.155098, -1.595569, 3.059097, 0, 0.509804, 1, 1,
0.1561641, -0.2204684, 3.201703, 0, 0.5019608, 1, 1,
0.1598568, -0.281237, 3.267609, 0, 0.4941176, 1, 1,
0.1610143, -1.420119, 4.607653, 0, 0.4901961, 1, 1,
0.1628114, -0.5990085, 2.343603, 0, 0.4823529, 1, 1,
0.1628726, 0.2998577, -0.1322655, 0, 0.4784314, 1, 1,
0.1645772, -0.688858, 3.234508, 0, 0.4705882, 1, 1,
0.1654396, -0.2304936, 4.517121, 0, 0.4666667, 1, 1,
0.1684157, -0.2266553, 2.971557, 0, 0.4588235, 1, 1,
0.1766579, 0.06537576, 0.8864012, 0, 0.454902, 1, 1,
0.1783615, -0.5482398, 2.626421, 0, 0.4470588, 1, 1,
0.1810004, 0.452409, 1.224796, 0, 0.4431373, 1, 1,
0.1816961, 2.1073, -0.1258894, 0, 0.4352941, 1, 1,
0.1838107, -0.1306431, 1.720966, 0, 0.4313726, 1, 1,
0.1873057, -0.5466051, 1.936028, 0, 0.4235294, 1, 1,
0.1923864, 1.653154, -0.1728461, 0, 0.4196078, 1, 1,
0.1935648, -1.642553, 3.855087, 0, 0.4117647, 1, 1,
0.2006615, 1.056024, -0.1459158, 0, 0.4078431, 1, 1,
0.2020044, -0.8011464, 3.972994, 0, 0.4, 1, 1,
0.2039028, 1.382112, 1.571626, 0, 0.3921569, 1, 1,
0.2051765, 0.5064988, 0.4472204, 0, 0.3882353, 1, 1,
0.2161711, 0.7925559, -0.4955629, 0, 0.3803922, 1, 1,
0.2165904, 0.9297433, -0.5080596, 0, 0.3764706, 1, 1,
0.216673, 1.414301, 0.3313035, 0, 0.3686275, 1, 1,
0.2174587, -2.083756, 3.45797, 0, 0.3647059, 1, 1,
0.2219433, 1.600294, 0.1386843, 0, 0.3568628, 1, 1,
0.2225939, 0.4942835, -0.3814385, 0, 0.3529412, 1, 1,
0.2238028, -2.43183, 3.481289, 0, 0.345098, 1, 1,
0.2275422, -0.03546977, 2.433766, 0, 0.3411765, 1, 1,
0.227636, 1.553872, 0.42757, 0, 0.3333333, 1, 1,
0.2296757, -0.6281343, 2.288284, 0, 0.3294118, 1, 1,
0.2382239, 0.04590112, 2.723511, 0, 0.3215686, 1, 1,
0.2395383, 1.531986, -0.9895539, 0, 0.3176471, 1, 1,
0.2441342, 0.1021851, -0.8910474, 0, 0.3098039, 1, 1,
0.2460933, 1.05959, -0.6810189, 0, 0.3058824, 1, 1,
0.2503975, -0.1478307, 1.744518, 0, 0.2980392, 1, 1,
0.2507555, -0.1693284, 3.180979, 0, 0.2901961, 1, 1,
0.2544039, 1.151043, 1.367337, 0, 0.2862745, 1, 1,
0.2558033, -0.1461814, 0.9016957, 0, 0.2784314, 1, 1,
0.2560892, -0.3072669, 3.347754, 0, 0.2745098, 1, 1,
0.2602794, 0.2359805, 2.03662, 0, 0.2666667, 1, 1,
0.2614661, 0.9502168, -0.9485552, 0, 0.2627451, 1, 1,
0.2654413, 1.309845, 0.05669298, 0, 0.254902, 1, 1,
0.2731942, -0.5594222, 1.958097, 0, 0.2509804, 1, 1,
0.2755447, -0.05571027, -0.02740853, 0, 0.2431373, 1, 1,
0.2786036, 0.9226351, 0.3033256, 0, 0.2392157, 1, 1,
0.2790236, 1.056062, 1.919914, 0, 0.2313726, 1, 1,
0.2794888, 1.098469, -1.849779, 0, 0.227451, 1, 1,
0.2831388, 0.1979647, -0.4663801, 0, 0.2196078, 1, 1,
0.2834228, -0.6936135, 4.04566, 0, 0.2156863, 1, 1,
0.2860038, 0.09994943, 2.258721, 0, 0.2078431, 1, 1,
0.289953, -1.723979, 2.593988, 0, 0.2039216, 1, 1,
0.2962821, 1.415427, 0.7152854, 0, 0.1960784, 1, 1,
0.2964781, 1.0471, -0.0009110043, 0, 0.1882353, 1, 1,
0.3003487, -0.2910065, 3.792995, 0, 0.1843137, 1, 1,
0.3044542, -0.03864075, 3.330944, 0, 0.1764706, 1, 1,
0.3051338, -0.07501, 3.302247, 0, 0.172549, 1, 1,
0.3100507, 0.2742649, -0.8764463, 0, 0.1647059, 1, 1,
0.3128665, -0.4161826, 2.751785, 0, 0.1607843, 1, 1,
0.3147918, 2.147989, 0.5228471, 0, 0.1529412, 1, 1,
0.3167479, -0.3610451, 3.619769, 0, 0.1490196, 1, 1,
0.3212524, 0.3356176, -0.8077947, 0, 0.1411765, 1, 1,
0.3374783, -0.9575086, 2.12881, 0, 0.1372549, 1, 1,
0.339006, 1.11687, 0.9315596, 0, 0.1294118, 1, 1,
0.3428297, -1.161699, 2.471969, 0, 0.1254902, 1, 1,
0.3442265, -1.267408, 3.624149, 0, 0.1176471, 1, 1,
0.3471745, -0.8090305, 4.461272, 0, 0.1137255, 1, 1,
0.3497513, -0.1442046, 2.189536, 0, 0.1058824, 1, 1,
0.3521546, 1.210217, -0.3803847, 0, 0.09803922, 1, 1,
0.352664, -0.0260135, 1.62385, 0, 0.09411765, 1, 1,
0.3540157, -0.5875654, 2.522915, 0, 0.08627451, 1, 1,
0.3541764, -0.9846683, 1.673138, 0, 0.08235294, 1, 1,
0.3556312, -0.4976633, 1.861786, 0, 0.07450981, 1, 1,
0.3582472, -0.3223423, 2.24518, 0, 0.07058824, 1, 1,
0.3603847, -0.05089265, 2.274271, 0, 0.0627451, 1, 1,
0.3619025, -0.7109565, 3.23056, 0, 0.05882353, 1, 1,
0.3620832, 0.04938823, 0.1793175, 0, 0.05098039, 1, 1,
0.3630457, -0.2700456, 2.791624, 0, 0.04705882, 1, 1,
0.3639767, -0.967212, 4.514122, 0, 0.03921569, 1, 1,
0.3643, -0.7230362, 2.016284, 0, 0.03529412, 1, 1,
0.3664288, -0.5056229, 2.224603, 0, 0.02745098, 1, 1,
0.372737, 0.9534984, 0.8648174, 0, 0.02352941, 1, 1,
0.3766432, 0.06421651, 1.780105, 0, 0.01568628, 1, 1,
0.3911814, 1.312837, 0.4338391, 0, 0.01176471, 1, 1,
0.3913543, 0.6710438, -0.040611, 0, 0.003921569, 1, 1,
0.3926106, -0.274981, 4.033549, 0.003921569, 0, 1, 1,
0.3950722, 0.8409442, -0.1648342, 0.007843138, 0, 1, 1,
0.3957131, -0.06978616, 0.9104071, 0.01568628, 0, 1, 1,
0.401244, -0.5744312, 0.1049575, 0.01960784, 0, 1, 1,
0.4012885, -1.060458, 2.314959, 0.02745098, 0, 1, 1,
0.40275, -1.723765, 2.550926, 0.03137255, 0, 1, 1,
0.4050149, 0.5750548, 0.870174, 0.03921569, 0, 1, 1,
0.4073277, 0.1004098, 0.5611627, 0.04313726, 0, 1, 1,
0.4093563, 0.445487, 0.1928291, 0.05098039, 0, 1, 1,
0.4126455, -0.7486664, 3.727445, 0.05490196, 0, 1, 1,
0.4157813, 0.3487226, 0.0006812197, 0.0627451, 0, 1, 1,
0.4187872, -1.153838, 2.780683, 0.06666667, 0, 1, 1,
0.4265916, -1.740283, 3.316094, 0.07450981, 0, 1, 1,
0.427889, -1.643913, 4.370517, 0.07843138, 0, 1, 1,
0.4291843, -0.020336, 1.734665, 0.08627451, 0, 1, 1,
0.4319712, -0.1282957, 0.85137, 0.09019608, 0, 1, 1,
0.4386604, 0.303208, -0.8297523, 0.09803922, 0, 1, 1,
0.4414019, 0.1735618, -0.4888935, 0.1058824, 0, 1, 1,
0.4437048, -1.282758, 1.832103, 0.1098039, 0, 1, 1,
0.4441415, 0.3223718, 3.387535, 0.1176471, 0, 1, 1,
0.4482054, -0.1915958, 1.590245, 0.1215686, 0, 1, 1,
0.4486867, 0.3315656, 0.4969274, 0.1294118, 0, 1, 1,
0.4524247, 1.597483, 0.3980603, 0.1333333, 0, 1, 1,
0.4547807, -0.7009839, 0.7649047, 0.1411765, 0, 1, 1,
0.4562811, -0.5216268, 2.641838, 0.145098, 0, 1, 1,
0.4632574, 1.346473, -0.48253, 0.1529412, 0, 1, 1,
0.4691893, -0.2654077, 1.212059, 0.1568628, 0, 1, 1,
0.472649, -0.7796304, 2.331233, 0.1647059, 0, 1, 1,
0.4747868, -0.6778626, 4.204552, 0.1686275, 0, 1, 1,
0.4755009, 0.9326817, 0.3903891, 0.1764706, 0, 1, 1,
0.4813347, -1.020707, 1.521754, 0.1803922, 0, 1, 1,
0.4829376, -1.589939, 2.604428, 0.1882353, 0, 1, 1,
0.4896106, 0.5035181, 1.976863, 0.1921569, 0, 1, 1,
0.4937205, 1.122436, 0.4647062, 0.2, 0, 1, 1,
0.4991784, 0.9809204, 1.804661, 0.2078431, 0, 1, 1,
0.4996885, -0.382641, 2.109224, 0.2117647, 0, 1, 1,
0.5019163, 0.02027607, 1.647561, 0.2196078, 0, 1, 1,
0.5125957, 0.03791875, 1.531638, 0.2235294, 0, 1, 1,
0.519419, -0.7992673, 1.271347, 0.2313726, 0, 1, 1,
0.5270917, -1.503448, 1.753404, 0.2352941, 0, 1, 1,
0.5294845, 0.5494205, 0.1104233, 0.2431373, 0, 1, 1,
0.5319712, 0.8045857, 0.06612464, 0.2470588, 0, 1, 1,
0.5328405, -0.9921864, 2.915015, 0.254902, 0, 1, 1,
0.5330124, -1.554836, 3.129631, 0.2588235, 0, 1, 1,
0.5466374, -0.1553471, 0.6781141, 0.2666667, 0, 1, 1,
0.5481611, -0.5797054, 2.198734, 0.2705882, 0, 1, 1,
0.5517215, 0.6357979, 1.777048, 0.2784314, 0, 1, 1,
0.5530235, 1.827112, 0.8583087, 0.282353, 0, 1, 1,
0.5551319, 0.3228967, 1.908204, 0.2901961, 0, 1, 1,
0.5558352, 0.2299879, 2.012247, 0.2941177, 0, 1, 1,
0.5571776, 0.3329256, 1.784371, 0.3019608, 0, 1, 1,
0.5594312, 1.796566, -1.870979, 0.3098039, 0, 1, 1,
0.5640091, 0.3699193, 0.6294574, 0.3137255, 0, 1, 1,
0.5648351, -1.349841, 2.709938, 0.3215686, 0, 1, 1,
0.5699394, 0.2775804, 0.5322466, 0.3254902, 0, 1, 1,
0.5717958, 0.09471359, -0.02302599, 0.3333333, 0, 1, 1,
0.5725865, 0.9988876, -0.5226241, 0.3372549, 0, 1, 1,
0.5733719, -1.683426, 3.902475, 0.345098, 0, 1, 1,
0.5757433, 0.6138264, 1.143491, 0.3490196, 0, 1, 1,
0.5767084, -0.01888641, 1.003526, 0.3568628, 0, 1, 1,
0.5818688, 0.5480387, 0.2688548, 0.3607843, 0, 1, 1,
0.5822173, 0.6958095, -0.5130274, 0.3686275, 0, 1, 1,
0.5853867, 1.734978, -0.7298113, 0.372549, 0, 1, 1,
0.5940704, -1.218714, 2.120849, 0.3803922, 0, 1, 1,
0.6011174, -1.356702, 1.926516, 0.3843137, 0, 1, 1,
0.6060324, -0.6551811, 0.6125038, 0.3921569, 0, 1, 1,
0.606463, 0.06702722, 3.703834, 0.3960784, 0, 1, 1,
0.6094404, -0.4494002, 1.528965, 0.4039216, 0, 1, 1,
0.6131842, -1.372769, 1.737967, 0.4117647, 0, 1, 1,
0.613508, 0.1921766, 3.171134, 0.4156863, 0, 1, 1,
0.6137258, -0.8157082, 2.933737, 0.4235294, 0, 1, 1,
0.6226647, 0.09727984, 0.2335822, 0.427451, 0, 1, 1,
0.6273201, 0.1369904, 0.8267478, 0.4352941, 0, 1, 1,
0.6290982, -0.7307962, 2.090624, 0.4392157, 0, 1, 1,
0.6303349, 2.028607, -0.4209496, 0.4470588, 0, 1, 1,
0.6380016, -1.078372, 1.900387, 0.4509804, 0, 1, 1,
0.6464309, 0.04144201, 1.419836, 0.4588235, 0, 1, 1,
0.6561671, 1.038527, 0.09866448, 0.4627451, 0, 1, 1,
0.6612808, 0.8738821, 0.1413301, 0.4705882, 0, 1, 1,
0.6618281, 1.901501, -1.238778, 0.4745098, 0, 1, 1,
0.6627646, 1.062135, 0.5638617, 0.4823529, 0, 1, 1,
0.6645938, 1.111106, 1.601054, 0.4862745, 0, 1, 1,
0.6695464, 1.009555, -0.7421118, 0.4941176, 0, 1, 1,
0.6737652, -1.009376, 3.183229, 0.5019608, 0, 1, 1,
0.6757992, 1.116701, -0.8244826, 0.5058824, 0, 1, 1,
0.6766697, -0.2738397, 2.275719, 0.5137255, 0, 1, 1,
0.6799968, 0.5363634, 0.6200606, 0.5176471, 0, 1, 1,
0.6804566, -2.052633, 2.798907, 0.5254902, 0, 1, 1,
0.6904041, -0.5544756, 2.062424, 0.5294118, 0, 1, 1,
0.6905336, 0.2012742, 0.9112197, 0.5372549, 0, 1, 1,
0.6919306, 0.1771229, -0.3332319, 0.5411765, 0, 1, 1,
0.6927826, 0.8338329, -0.06971081, 0.5490196, 0, 1, 1,
0.6952552, 0.06169309, 0.6989765, 0.5529412, 0, 1, 1,
0.7013204, 1.389658, -0.6962968, 0.5607843, 0, 1, 1,
0.7033421, -0.5252732, 3.305916, 0.5647059, 0, 1, 1,
0.7035942, -0.6299074, 1.46132, 0.572549, 0, 1, 1,
0.7054839, -0.1567478, 2.827857, 0.5764706, 0, 1, 1,
0.7075993, -0.593293, 4.536966, 0.5843138, 0, 1, 1,
0.708124, 0.5964337, 3.711071, 0.5882353, 0, 1, 1,
0.7112876, -8.878126e-05, 2.971308, 0.5960785, 0, 1, 1,
0.7120609, -0.5810565, 2.386373, 0.6039216, 0, 1, 1,
0.7194667, -1.150239, 1.994578, 0.6078432, 0, 1, 1,
0.7201727, -0.8051891, 3.789194, 0.6156863, 0, 1, 1,
0.7207123, -0.9031879, 1.194082, 0.6196079, 0, 1, 1,
0.7267481, 0.2397534, 1.882982, 0.627451, 0, 1, 1,
0.7315049, 0.6851932, -0.4536223, 0.6313726, 0, 1, 1,
0.7363403, -1.544367, 2.784304, 0.6392157, 0, 1, 1,
0.7423037, -1.094401, 3.755174, 0.6431373, 0, 1, 1,
0.747199, -0.05358954, 1.887221, 0.6509804, 0, 1, 1,
0.7500314, 0.2355929, -0.4954401, 0.654902, 0, 1, 1,
0.7506911, 1.428342, 0.9596909, 0.6627451, 0, 1, 1,
0.7511483, 0.8913314, -0.1495946, 0.6666667, 0, 1, 1,
0.7541878, -0.5753796, 1.524028, 0.6745098, 0, 1, 1,
0.7575196, 1.021646, 2.297969, 0.6784314, 0, 1, 1,
0.7579877, -1.124098, 2.683182, 0.6862745, 0, 1, 1,
0.7608054, 0.4441723, 1.714557, 0.6901961, 0, 1, 1,
0.7611379, -0.4560513, 1.734001, 0.6980392, 0, 1, 1,
0.761829, 0.2985293, 1.329033, 0.7058824, 0, 1, 1,
0.7622722, -0.1818962, 1.74315, 0.7098039, 0, 1, 1,
0.76432, 0.2755274, -0.1628429, 0.7176471, 0, 1, 1,
0.764668, 1.126416, 1.455022, 0.7215686, 0, 1, 1,
0.7742807, -1.56807, 3.373782, 0.7294118, 0, 1, 1,
0.7764087, 0.8988789, -0.9302205, 0.7333333, 0, 1, 1,
0.7809359, 0.785962, 0.7524642, 0.7411765, 0, 1, 1,
0.7861171, -0.02255083, -0.1061125, 0.7450981, 0, 1, 1,
0.7862056, 0.2488886, -0.01066332, 0.7529412, 0, 1, 1,
0.786408, 1.676849, 2.190302, 0.7568628, 0, 1, 1,
0.7884123, 1.624559, 1.906575, 0.7647059, 0, 1, 1,
0.794686, 0.827153, 0.2336274, 0.7686275, 0, 1, 1,
0.8053282, -2.038695, 2.611822, 0.7764706, 0, 1, 1,
0.8056856, -0.2880614, 2.882508, 0.7803922, 0, 1, 1,
0.8074399, -0.8684365, 0.9206892, 0.7882353, 0, 1, 1,
0.8154908, 1.086814, -0.1314535, 0.7921569, 0, 1, 1,
0.8246879, 0.267984, 0.8092014, 0.8, 0, 1, 1,
0.8334235, -0.8275881, 2.125859, 0.8078431, 0, 1, 1,
0.83462, 2.018166, -0.1364785, 0.8117647, 0, 1, 1,
0.8404962, 1.588948, 1.368493, 0.8196079, 0, 1, 1,
0.841854, -0.4297143, 2.318359, 0.8235294, 0, 1, 1,
0.8473495, -0.5219519, 2.4726, 0.8313726, 0, 1, 1,
0.8503861, 1.090107, 1.45624, 0.8352941, 0, 1, 1,
0.8517354, 0.01818396, 1.50224, 0.8431373, 0, 1, 1,
0.8580727, 0.03875201, 1.839027, 0.8470588, 0, 1, 1,
0.8683141, 0.3403135, 0.3820816, 0.854902, 0, 1, 1,
0.8719649, -0.6069282, 3.419675, 0.8588235, 0, 1, 1,
0.8728451, 0.04038988, 1.717094, 0.8666667, 0, 1, 1,
0.8807631, -0.7321613, 1.437769, 0.8705882, 0, 1, 1,
0.880952, -1.076121, 3.463189, 0.8784314, 0, 1, 1,
0.8828508, -0.3389303, 1.104734, 0.8823529, 0, 1, 1,
0.8831648, 1.672691, 0.6391269, 0.8901961, 0, 1, 1,
0.8833305, 0.2631977, 0.3517015, 0.8941177, 0, 1, 1,
0.8906603, -0.8938357, 1.067095, 0.9019608, 0, 1, 1,
0.8913155, -0.299494, 1.034183, 0.9098039, 0, 1, 1,
0.8968849, 1.601847, 0.8307211, 0.9137255, 0, 1, 1,
0.9001742, 0.4056434, 0.3837152, 0.9215686, 0, 1, 1,
0.9026631, 0.1020899, 0.8451416, 0.9254902, 0, 1, 1,
0.9031773, 1.010395, -1.067213, 0.9333333, 0, 1, 1,
0.9041464, 0.137686, 2.942979, 0.9372549, 0, 1, 1,
0.9070106, 0.6967939, 0.6835272, 0.945098, 0, 1, 1,
0.9095665, 0.1610528, 1.53218, 0.9490196, 0, 1, 1,
0.9096215, 1.105605, -0.3085219, 0.9568627, 0, 1, 1,
0.9169304, -0.6186942, 1.107875, 0.9607843, 0, 1, 1,
0.9213772, -1.313632, 1.667673, 0.9686275, 0, 1, 1,
0.9272977, 0.3261289, 1.545296, 0.972549, 0, 1, 1,
0.929087, -1.386714, 4.413222, 0.9803922, 0, 1, 1,
0.9314032, 1.641068, 0.5994729, 0.9843137, 0, 1, 1,
0.9377305, 0.2847538, 0.8387033, 0.9921569, 0, 1, 1,
0.9393519, -1.788326, 1.9128, 0.9960784, 0, 1, 1,
0.9446284, -0.5517784, 2.654168, 1, 0, 0.9960784, 1,
0.9453661, 0.3138008, 0.844569, 1, 0, 0.9882353, 1,
0.9453869, 0.2246876, 3.599348, 1, 0, 0.9843137, 1,
0.9509974, 0.1611779, 1.462789, 1, 0, 0.9764706, 1,
0.9511419, 0.9897218, 0.4056829, 1, 0, 0.972549, 1,
0.9517562, -0.3056882, 2.839097, 1, 0, 0.9647059, 1,
0.9532889, 1.058683, 0.6958981, 1, 0, 0.9607843, 1,
0.9548583, 0.4573072, 0.7197732, 1, 0, 0.9529412, 1,
0.9570259, -0.03683505, 0.2494628, 1, 0, 0.9490196, 1,
0.9575109, 1.82947, 0.05191762, 1, 0, 0.9411765, 1,
0.9603665, -0.7483734, 3.656896, 1, 0, 0.9372549, 1,
0.9701445, 1.012146, 0.4646419, 1, 0, 0.9294118, 1,
0.9770512, 0.02919752, 1.405219, 1, 0, 0.9254902, 1,
0.9817407, 0.8354092, -0.435243, 1, 0, 0.9176471, 1,
0.9849579, 0.8323638, 1.694585, 1, 0, 0.9137255, 1,
0.9856016, -0.4583504, 2.805028, 1, 0, 0.9058824, 1,
0.9864323, 1.284667, 0.7001588, 1, 0, 0.9019608, 1,
0.9864648, 1.295178, -1.176834, 1, 0, 0.8941177, 1,
0.987222, 0.4067886, 1.365195, 1, 0, 0.8862745, 1,
0.987393, 0.59883, -0.08835629, 1, 0, 0.8823529, 1,
0.9884654, 0.5832235, -1.555155, 1, 0, 0.8745098, 1,
0.9979821, -1.243124, 3.124562, 1, 0, 0.8705882, 1,
1.019223, 0.644402, 1.20483, 1, 0, 0.8627451, 1,
1.019857, -1.584852, 1.721147, 1, 0, 0.8588235, 1,
1.023308, 1.740737, -0.2769989, 1, 0, 0.8509804, 1,
1.023533, -0.4438428, 2.034373, 1, 0, 0.8470588, 1,
1.023995, 0.7695122, 3.375335, 1, 0, 0.8392157, 1,
1.026092, 0.6353063, 0.4199231, 1, 0, 0.8352941, 1,
1.031225, 1.498013, -0.3983114, 1, 0, 0.827451, 1,
1.034039, 0.6327209, 1.762147, 1, 0, 0.8235294, 1,
1.039778, -2.314612, 2.5284, 1, 0, 0.8156863, 1,
1.055733, 1.646664, 1.184897, 1, 0, 0.8117647, 1,
1.056518, -0.4149844, 1.686766, 1, 0, 0.8039216, 1,
1.056574, -1.040633, 1.922555, 1, 0, 0.7960784, 1,
1.058864, 1.260631, 1.15178, 1, 0, 0.7921569, 1,
1.065121, 0.4425623, 1.78123, 1, 0, 0.7843137, 1,
1.074814, 0.4593599, 0.8715024, 1, 0, 0.7803922, 1,
1.074816, -0.3624547, 2.653195, 1, 0, 0.772549, 1,
1.075701, 0.4550849, 0.8698834, 1, 0, 0.7686275, 1,
1.077946, 0.342723, 0.5472195, 1, 0, 0.7607843, 1,
1.079603, -2.158969, 1.447017, 1, 0, 0.7568628, 1,
1.079928, 2.023246, 0.5835443, 1, 0, 0.7490196, 1,
1.080769, -1.790794, 4.34081, 1, 0, 0.7450981, 1,
1.086077, 0.9743474, 0.7023163, 1, 0, 0.7372549, 1,
1.087348, -0.2629582, 2.41988, 1, 0, 0.7333333, 1,
1.093844, 1.556982, 2.017228, 1, 0, 0.7254902, 1,
1.099342, -1.169346, 2.257182, 1, 0, 0.7215686, 1,
1.099963, -0.6763057, 2.220213, 1, 0, 0.7137255, 1,
1.110539, 0.9668402, 0.7637819, 1, 0, 0.7098039, 1,
1.112772, 1.516015, 1.708209, 1, 0, 0.7019608, 1,
1.113849, -1.41108, 0.7307919, 1, 0, 0.6941177, 1,
1.114326, 0.8860475, 1.819733, 1, 0, 0.6901961, 1,
1.129405, 1.070044, 1.254338, 1, 0, 0.682353, 1,
1.143453, -0.9505771, 3.477017, 1, 0, 0.6784314, 1,
1.150106, 1.551094, 0.9129096, 1, 0, 0.6705883, 1,
1.170272, 1.117768, 0.02638973, 1, 0, 0.6666667, 1,
1.173482, -0.2456058, -0.8922362, 1, 0, 0.6588235, 1,
1.175118, -0.2320214, 1.309797, 1, 0, 0.654902, 1,
1.177051, 0.2337842, 0.2684022, 1, 0, 0.6470588, 1,
1.185259, -1.085763, 1.453098, 1, 0, 0.6431373, 1,
1.192655, 0.6444607, 1.639618, 1, 0, 0.6352941, 1,
1.208769, -0.0864463, 1.372568, 1, 0, 0.6313726, 1,
1.214727, -1.178157, 1.986482, 1, 0, 0.6235294, 1,
1.224155, 0.08032758, 4.095153, 1, 0, 0.6196079, 1,
1.225437, -0.2263676, 1.877743, 1, 0, 0.6117647, 1,
1.232145, 1.147314, 0.9915337, 1, 0, 0.6078432, 1,
1.232652, -0.9903778, 3.405493, 1, 0, 0.6, 1,
1.235031, -1.218441, 2.689597, 1, 0, 0.5921569, 1,
1.235491, 0.6906305, -0.3048927, 1, 0, 0.5882353, 1,
1.237197, 0.5790425, -0.2903809, 1, 0, 0.5803922, 1,
1.238294, 0.6081961, 0.8255386, 1, 0, 0.5764706, 1,
1.242514, 0.2848962, 1.330669, 1, 0, 0.5686275, 1,
1.250267, 1.765576, -0.1900643, 1, 0, 0.5647059, 1,
1.265584, 0.3956391, 2.329293, 1, 0, 0.5568628, 1,
1.27377, -1.150841, 3.206112, 1, 0, 0.5529412, 1,
1.275841, -0.5145619, 3.955539, 1, 0, 0.5450981, 1,
1.278147, -0.3425802, 1.512899, 1, 0, 0.5411765, 1,
1.283921, 1.576263, 1.493597, 1, 0, 0.5333334, 1,
1.285135, -0.447887, 2.078145, 1, 0, 0.5294118, 1,
1.285834, 0.1467468, 0.8971692, 1, 0, 0.5215687, 1,
1.304904, 0.05030579, 1.367157, 1, 0, 0.5176471, 1,
1.321846, 1.899243, 0.8877932, 1, 0, 0.509804, 1,
1.334576, 0.7585158, 1.957666, 1, 0, 0.5058824, 1,
1.336302, 0.7018651, 0.733045, 1, 0, 0.4980392, 1,
1.353868, -0.03452922, 0.7216802, 1, 0, 0.4901961, 1,
1.354447, -0.712723, 1.731079, 1, 0, 0.4862745, 1,
1.357039, -0.4177825, 1.863276, 1, 0, 0.4784314, 1,
1.363033, -0.01828126, 0.6151289, 1, 0, 0.4745098, 1,
1.36359, -0.5411096, 0.3383155, 1, 0, 0.4666667, 1,
1.370329, -0.4305776, 1.988612, 1, 0, 0.4627451, 1,
1.373116, 1.106446, 2.136845, 1, 0, 0.454902, 1,
1.38651, 1.566615, 0.3012283, 1, 0, 0.4509804, 1,
1.388202, -0.6941952, 1.947392, 1, 0, 0.4431373, 1,
1.399102, -1.081009, 3.689052, 1, 0, 0.4392157, 1,
1.403486, -0.9621966, 4.972666, 1, 0, 0.4313726, 1,
1.405752, 1.25811, 2.253363, 1, 0, 0.427451, 1,
1.412151, -0.3821674, 2.080694, 1, 0, 0.4196078, 1,
1.418955, 0.07131034, 1.031006, 1, 0, 0.4156863, 1,
1.421394, 1.176565, 1.004736, 1, 0, 0.4078431, 1,
1.427541, -0.1145967, 2.746337, 1, 0, 0.4039216, 1,
1.448386, 0.0217841, 1.810864, 1, 0, 0.3960784, 1,
1.459422, -0.9406648, 1.114918, 1, 0, 0.3882353, 1,
1.468256, -0.3433136, 2.134942, 1, 0, 0.3843137, 1,
1.474441, 1.384115, 1.015325, 1, 0, 0.3764706, 1,
1.480145, 0.08430532, 1.981345, 1, 0, 0.372549, 1,
1.480645, -0.1724066, 1.596779, 1, 0, 0.3647059, 1,
1.481207, -1.360803, 1.953483, 1, 0, 0.3607843, 1,
1.481474, -0.3046239, 1.609159, 1, 0, 0.3529412, 1,
1.481819, 1.553111, -0.1539327, 1, 0, 0.3490196, 1,
1.485155, 0.7643601, 2.026941, 1, 0, 0.3411765, 1,
1.513502, 0.9104984, 0.3796925, 1, 0, 0.3372549, 1,
1.518145, 1.107603, -0.3832062, 1, 0, 0.3294118, 1,
1.525451, -2.402504, 3.608115, 1, 0, 0.3254902, 1,
1.527067, -0.5117946, 0.3183763, 1, 0, 0.3176471, 1,
1.528562, 1.161896, 1.23045, 1, 0, 0.3137255, 1,
1.532753, -0.3857964, 1.319649, 1, 0, 0.3058824, 1,
1.550165, 1.970505, -0.518627, 1, 0, 0.2980392, 1,
1.559441, 0.03756374, 3.273539, 1, 0, 0.2941177, 1,
1.578628, -1.272283, 2.649555, 1, 0, 0.2862745, 1,
1.583975, 0.6341084, 1.340808, 1, 0, 0.282353, 1,
1.591179, -0.01436325, 2.562729, 1, 0, 0.2745098, 1,
1.600304, -0.3130464, 1.554566, 1, 0, 0.2705882, 1,
1.616911, -1.475585, 1.413196, 1, 0, 0.2627451, 1,
1.629363, 0.1611876, 1.525064, 1, 0, 0.2588235, 1,
1.640898, -1.731495, 3.312115, 1, 0, 0.2509804, 1,
1.643351, 0.1560554, 2.429694, 1, 0, 0.2470588, 1,
1.647798, 2.135908, 0.3958277, 1, 0, 0.2392157, 1,
1.65285, 0.6580303, 0.0945659, 1, 0, 0.2352941, 1,
1.663713, 0.10277, 1.505856, 1, 0, 0.227451, 1,
1.664168, -0.7793801, 1.745206, 1, 0, 0.2235294, 1,
1.669241, -0.1388299, 1.153923, 1, 0, 0.2156863, 1,
1.681167, -0.7981481, 1.981772, 1, 0, 0.2117647, 1,
1.684854, -1.135062, 2.499789, 1, 0, 0.2039216, 1,
1.702458, 0.212427, 0.8344725, 1, 0, 0.1960784, 1,
1.708851, 0.7792822, 0.3788444, 1, 0, 0.1921569, 1,
1.74628, -0.2076849, 0.2277142, 1, 0, 0.1843137, 1,
1.747115, -0.2976642, 4.160293, 1, 0, 0.1803922, 1,
1.765572, 0.8138082, 0.9000034, 1, 0, 0.172549, 1,
1.768387, 2.154547, 2.731704, 1, 0, 0.1686275, 1,
1.792076, 0.7661783, 0.2056356, 1, 0, 0.1607843, 1,
1.807887, -0.1758055, 2.046006, 1, 0, 0.1568628, 1,
1.808304, -0.5731696, 0.2992098, 1, 0, 0.1490196, 1,
1.833265, -0.3737833, 3.59005, 1, 0, 0.145098, 1,
1.851906, -0.3883288, 0.1280329, 1, 0, 0.1372549, 1,
1.861784, -0.8456267, 1.795219, 1, 0, 0.1333333, 1,
1.888805, 0.508888, 1.775328, 1, 0, 0.1254902, 1,
1.901521, 1.370508, 1.534001, 1, 0, 0.1215686, 1,
1.903646, -0.9094911, 1.594037, 1, 0, 0.1137255, 1,
1.905309, 0.02155536, 1.098676, 1, 0, 0.1098039, 1,
1.912609, -2.317898, 2.747497, 1, 0, 0.1019608, 1,
1.953104, -0.4539301, 3.402772, 1, 0, 0.09411765, 1,
2.045686, -0.6133562, 2.247097, 1, 0, 0.09019608, 1,
2.049311, -0.9993626, 1.883361, 1, 0, 0.08235294, 1,
2.063074, -0.6302222, 2.471189, 1, 0, 0.07843138, 1,
2.066459, 1.07621, 1.416642, 1, 0, 0.07058824, 1,
2.072379, -0.43614, 0.7440763, 1, 0, 0.06666667, 1,
2.099697, -0.4328043, 2.43971, 1, 0, 0.05882353, 1,
2.103464, -1.027673, 1.854339, 1, 0, 0.05490196, 1,
2.236711, -0.4105287, 2.162706, 1, 0, 0.04705882, 1,
2.241146, -1.093896, 4.577764, 1, 0, 0.04313726, 1,
2.310677, 1.539045, 2.022093, 1, 0, 0.03529412, 1,
2.359166, 1.297046, -0.06966119, 1, 0, 0.03137255, 1,
2.373396, 0.7303364, 1.873872, 1, 0, 0.02352941, 1,
2.374911, -0.6912597, 2.097242, 1, 0, 0.01960784, 1,
2.533721, 0.3923676, 2.066127, 1, 0, 0.01176471, 1,
3.438803, -0.6357323, 0.8135529, 1, 0, 0.007843138, 1
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
-0.0828141, -4.144161, -7.714159, 0, -0.5, 0.5, 0.5,
-0.0828141, -4.144161, -7.714159, 1, -0.5, 0.5, 0.5,
-0.0828141, -4.144161, -7.714159, 1, 1.5, 0.5, 0.5,
-0.0828141, -4.144161, -7.714159, 0, 1.5, 0.5, 0.5
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
-4.79826, 0.2465484, -7.714159, 0, -0.5, 0.5, 0.5,
-4.79826, 0.2465484, -7.714159, 1, -0.5, 0.5, 0.5,
-4.79826, 0.2465484, -7.714159, 1, 1.5, 0.5, 0.5,
-4.79826, 0.2465484, -7.714159, 0, 1.5, 0.5, 0.5
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
-4.79826, -4.144161, -0.1211421, 0, -0.5, 0.5, 0.5,
-4.79826, -4.144161, -0.1211421, 1, -0.5, 0.5, 0.5,
-4.79826, -4.144161, -0.1211421, 1, 1.5, 0.5, 0.5,
-4.79826, -4.144161, -0.1211421, 0, 1.5, 0.5, 0.5
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
-2, -3.130921, -5.961924,
2, -3.130921, -5.961924,
-2, -3.130921, -5.961924,
-2, -3.299794, -6.253963,
0, -3.130921, -5.961924,
0, -3.299794, -6.253963,
2, -3.130921, -5.961924,
2, -3.299794, -6.253963
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
-2, -3.637541, -6.838041, 0, -0.5, 0.5, 0.5,
-2, -3.637541, -6.838041, 1, -0.5, 0.5, 0.5,
-2, -3.637541, -6.838041, 1, 1.5, 0.5, 0.5,
-2, -3.637541, -6.838041, 0, 1.5, 0.5, 0.5,
0, -3.637541, -6.838041, 0, -0.5, 0.5, 0.5,
0, -3.637541, -6.838041, 1, -0.5, 0.5, 0.5,
0, -3.637541, -6.838041, 1, 1.5, 0.5, 0.5,
0, -3.637541, -6.838041, 0, 1.5, 0.5, 0.5,
2, -3.637541, -6.838041, 0, -0.5, 0.5, 0.5,
2, -3.637541, -6.838041, 1, -0.5, 0.5, 0.5,
2, -3.637541, -6.838041, 1, 1.5, 0.5, 0.5,
2, -3.637541, -6.838041, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.71008, -3, -5.961924,
-3.71008, 3, -5.961924,
-3.71008, -3, -5.961924,
-3.891443, -3, -6.253963,
-3.71008, -2, -5.961924,
-3.891443, -2, -6.253963,
-3.71008, -1, -5.961924,
-3.891443, -1, -6.253963,
-3.71008, 0, -5.961924,
-3.891443, 0, -6.253963,
-3.71008, 1, -5.961924,
-3.891443, 1, -6.253963,
-3.71008, 2, -5.961924,
-3.891443, 2, -6.253963,
-3.71008, 3, -5.961924,
-3.891443, 3, -6.253963
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
-4.25417, -3, -6.838041, 0, -0.5, 0.5, 0.5,
-4.25417, -3, -6.838041, 1, -0.5, 0.5, 0.5,
-4.25417, -3, -6.838041, 1, 1.5, 0.5, 0.5,
-4.25417, -3, -6.838041, 0, 1.5, 0.5, 0.5,
-4.25417, -2, -6.838041, 0, -0.5, 0.5, 0.5,
-4.25417, -2, -6.838041, 1, -0.5, 0.5, 0.5,
-4.25417, -2, -6.838041, 1, 1.5, 0.5, 0.5,
-4.25417, -2, -6.838041, 0, 1.5, 0.5, 0.5,
-4.25417, -1, -6.838041, 0, -0.5, 0.5, 0.5,
-4.25417, -1, -6.838041, 1, -0.5, 0.5, 0.5,
-4.25417, -1, -6.838041, 1, 1.5, 0.5, 0.5,
-4.25417, -1, -6.838041, 0, 1.5, 0.5, 0.5,
-4.25417, 0, -6.838041, 0, -0.5, 0.5, 0.5,
-4.25417, 0, -6.838041, 1, -0.5, 0.5, 0.5,
-4.25417, 0, -6.838041, 1, 1.5, 0.5, 0.5,
-4.25417, 0, -6.838041, 0, 1.5, 0.5, 0.5,
-4.25417, 1, -6.838041, 0, -0.5, 0.5, 0.5,
-4.25417, 1, -6.838041, 1, -0.5, 0.5, 0.5,
-4.25417, 1, -6.838041, 1, 1.5, 0.5, 0.5,
-4.25417, 1, -6.838041, 0, 1.5, 0.5, 0.5,
-4.25417, 2, -6.838041, 0, -0.5, 0.5, 0.5,
-4.25417, 2, -6.838041, 1, -0.5, 0.5, 0.5,
-4.25417, 2, -6.838041, 1, 1.5, 0.5, 0.5,
-4.25417, 2, -6.838041, 0, 1.5, 0.5, 0.5,
-4.25417, 3, -6.838041, 0, -0.5, 0.5, 0.5,
-4.25417, 3, -6.838041, 1, -0.5, 0.5, 0.5,
-4.25417, 3, -6.838041, 1, 1.5, 0.5, 0.5,
-4.25417, 3, -6.838041, 0, 1.5, 0.5, 0.5
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
-3.71008, -3.130921, -4,
-3.71008, -3.130921, 4,
-3.71008, -3.130921, -4,
-3.891443, -3.299794, -4,
-3.71008, -3.130921, -2,
-3.891443, -3.299794, -2,
-3.71008, -3.130921, 0,
-3.891443, -3.299794, 0,
-3.71008, -3.130921, 2,
-3.891443, -3.299794, 2,
-3.71008, -3.130921, 4,
-3.891443, -3.299794, 4
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
-4.25417, -3.637541, -4, 0, -0.5, 0.5, 0.5,
-4.25417, -3.637541, -4, 1, -0.5, 0.5, 0.5,
-4.25417, -3.637541, -4, 1, 1.5, 0.5, 0.5,
-4.25417, -3.637541, -4, 0, 1.5, 0.5, 0.5,
-4.25417, -3.637541, -2, 0, -0.5, 0.5, 0.5,
-4.25417, -3.637541, -2, 1, -0.5, 0.5, 0.5,
-4.25417, -3.637541, -2, 1, 1.5, 0.5, 0.5,
-4.25417, -3.637541, -2, 0, 1.5, 0.5, 0.5,
-4.25417, -3.637541, 0, 0, -0.5, 0.5, 0.5,
-4.25417, -3.637541, 0, 1, -0.5, 0.5, 0.5,
-4.25417, -3.637541, 0, 1, 1.5, 0.5, 0.5,
-4.25417, -3.637541, 0, 0, 1.5, 0.5, 0.5,
-4.25417, -3.637541, 2, 0, -0.5, 0.5, 0.5,
-4.25417, -3.637541, 2, 1, -0.5, 0.5, 0.5,
-4.25417, -3.637541, 2, 1, 1.5, 0.5, 0.5,
-4.25417, -3.637541, 2, 0, 1.5, 0.5, 0.5,
-4.25417, -3.637541, 4, 0, -0.5, 0.5, 0.5,
-4.25417, -3.637541, 4, 1, -0.5, 0.5, 0.5,
-4.25417, -3.637541, 4, 1, 1.5, 0.5, 0.5,
-4.25417, -3.637541, 4, 0, 1.5, 0.5, 0.5
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
-3.71008, -3.130921, -5.961924,
-3.71008, 3.624017, -5.961924,
-3.71008, -3.130921, 5.71964,
-3.71008, 3.624017, 5.71964,
-3.71008, -3.130921, -5.961924,
-3.71008, -3.130921, 5.71964,
-3.71008, 3.624017, -5.961924,
-3.71008, 3.624017, 5.71964,
-3.71008, -3.130921, -5.961924,
3.544452, -3.130921, -5.961924,
-3.71008, -3.130921, 5.71964,
3.544452, -3.130921, 5.71964,
-3.71008, 3.624017, -5.961924,
3.544452, 3.624017, -5.961924,
-3.71008, 3.624017, 5.71964,
3.544452, 3.624017, 5.71964,
3.544452, -3.130921, -5.961924,
3.544452, 3.624017, -5.961924,
3.544452, -3.130921, 5.71964,
3.544452, 3.624017, 5.71964,
3.544452, -3.130921, -5.961924,
3.544452, -3.130921, 5.71964,
3.544452, 3.624017, -5.961924,
3.544452, 3.624017, 5.71964
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
var radius = 8.180826;
var distance = 36.39742;
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
mvMatrix.translate( 0.0828141, -0.2465484, 0.1211421 );
mvMatrix.scale( 1.219275, 1.309452, 0.757199 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.39742);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
-3.604431, -0.1722067, -0.9784849, 0, 0, 1, 1, 1,
-2.787325, 0.9143752, -1.71596, 1, 0, 0, 1, 1,
-2.663109, -0.3332441, -1.340708, 1, 0, 0, 1, 1,
-2.487128, -0.7412581, -0.6329559, 1, 0, 0, 1, 1,
-2.482018, 0.3279076, -1.063516, 1, 0, 0, 1, 1,
-2.43236, -0.01371209, -2.292313, 1, 0, 0, 1, 1,
-2.295562, -0.007487817, -2.356606, 0, 0, 0, 1, 1,
-2.261384, -0.1998461, -1.803948, 0, 0, 0, 1, 1,
-2.184318, 1.400171, -2.396138, 0, 0, 0, 1, 1,
-2.160637, -1.186024, -0.7262641, 0, 0, 0, 1, 1,
-2.085281, 0.8195069, -0.1554103, 0, 0, 0, 1, 1,
-2.029294, 1.645397, -0.6999942, 0, 0, 0, 1, 1,
-2.022897, -0.8556642, -0.9061329, 0, 0, 0, 1, 1,
-2.021979, 0.1550738, -0.5728232, 1, 1, 1, 1, 1,
-2.004602, -0.151099, -2.068154, 1, 1, 1, 1, 1,
-1.979585, -0.002217907, -2.671269, 1, 1, 1, 1, 1,
-1.912329, 0.8332496, -0.5583489, 1, 1, 1, 1, 1,
-1.909553, 0.4315008, 0.1935534, 1, 1, 1, 1, 1,
-1.90638, -2.161895, -1.981708, 1, 1, 1, 1, 1,
-1.902388, 1.283051, -1.6435, 1, 1, 1, 1, 1,
-1.895241, 0.7139088, -1.497366, 1, 1, 1, 1, 1,
-1.884914, 0.6324616, -2.324883, 1, 1, 1, 1, 1,
-1.869619, -1.202403, -4.302618, 1, 1, 1, 1, 1,
-1.859414, -1.083318, -2.221851, 1, 1, 1, 1, 1,
-1.853775, 1.215426, -0.4084023, 1, 1, 1, 1, 1,
-1.852731, 0.6259738, -1.498411, 1, 1, 1, 1, 1,
-1.82297, 0.9768686, 0.4661027, 1, 1, 1, 1, 1,
-1.816854, 0.8262171, -0.6605366, 1, 1, 1, 1, 1,
-1.799089, 0.665796, -0.7537183, 0, 0, 1, 1, 1,
-1.797101, -0.9790029, -3.256895, 1, 0, 0, 1, 1,
-1.797011, -0.510727, -2.43979, 1, 0, 0, 1, 1,
-1.796853, 1.126221, -1.760493, 1, 0, 0, 1, 1,
-1.776801, -1.781343, -2.899619, 1, 0, 0, 1, 1,
-1.773783, 0.1781907, -2.095452, 1, 0, 0, 1, 1,
-1.764622, 0.6034847, -1.520624, 0, 0, 0, 1, 1,
-1.752149, -1.845916, -1.026539, 0, 0, 0, 1, 1,
-1.744065, 1.163826, -2.26868, 0, 0, 0, 1, 1,
-1.705766, -0.04282937, -0.9453428, 0, 0, 0, 1, 1,
-1.69519, 0.4219903, -0.5497951, 0, 0, 0, 1, 1,
-1.693207, 0.8635629, -0.6429738, 0, 0, 0, 1, 1,
-1.672441, -0.3847249, -1.675269, 0, 0, 0, 1, 1,
-1.671849, -1.663151, -2.803372, 1, 1, 1, 1, 1,
-1.669971, -0.4499063, -1.361182, 1, 1, 1, 1, 1,
-1.657816, 0.6082075, -2.296306, 1, 1, 1, 1, 1,
-1.650781, 0.1366596, -0.9487606, 1, 1, 1, 1, 1,
-1.648606, 0.703215, -0.3124194, 1, 1, 1, 1, 1,
-1.6455, 0.6080142, -1.042065, 1, 1, 1, 1, 1,
-1.639223, -0.06406195, -1.37208, 1, 1, 1, 1, 1,
-1.623575, -0.4656605, -1.395563, 1, 1, 1, 1, 1,
-1.608983, -0.01947785, -1.518552, 1, 1, 1, 1, 1,
-1.599636, -1.61829, -2.88122, 1, 1, 1, 1, 1,
-1.58324, -2.914803, -1.28275, 1, 1, 1, 1, 1,
-1.578387, -0.01585001, -0.9120859, 1, 1, 1, 1, 1,
-1.576083, 0.1287663, -1.93826, 1, 1, 1, 1, 1,
-1.575333, -0.1133184, -3.871264, 1, 1, 1, 1, 1,
-1.570788, -2.059505, -3.902692, 1, 1, 1, 1, 1,
-1.5683, -0.7801796, -1.816112, 0, 0, 1, 1, 1,
-1.562818, 0.5498021, -1.545084, 1, 0, 0, 1, 1,
-1.561588, 2.318247, -1.955804, 1, 0, 0, 1, 1,
-1.558099, 1.248389, 0.779195, 1, 0, 0, 1, 1,
-1.557466, -0.2296893, -1.608588, 1, 0, 0, 1, 1,
-1.555306, 2.151859, -1.229439, 1, 0, 0, 1, 1,
-1.554418, -1.510735, -3.4174, 0, 0, 0, 1, 1,
-1.553035, -0.5230535, -0.8724965, 0, 0, 0, 1, 1,
-1.550899, -0.9612228, -2.675583, 0, 0, 0, 1, 1,
-1.531998, 1.524747, -1.813021, 0, 0, 0, 1, 1,
-1.52656, -0.9424084, -2.298744, 0, 0, 0, 1, 1,
-1.510494, -1.21705, -1.746681, 0, 0, 0, 1, 1,
-1.508226, -0.8839466, -2.701792, 0, 0, 0, 1, 1,
-1.507709, -2.815875, -3.440944, 1, 1, 1, 1, 1,
-1.507057, 0.03464862, -0.9684986, 1, 1, 1, 1, 1,
-1.502984, 0.2073188, -1.759736, 1, 1, 1, 1, 1,
-1.50184, -1.169621, -2.779091, 1, 1, 1, 1, 1,
-1.499602, 0.9690993, -0.7524992, 1, 1, 1, 1, 1,
-1.494745, 0.9938404, -1.24038, 1, 1, 1, 1, 1,
-1.492739, 0.4136848, -0.3970692, 1, 1, 1, 1, 1,
-1.473328, -0.3537788, -3.69976, 1, 1, 1, 1, 1,
-1.463647, -0.2319049, 0.6406707, 1, 1, 1, 1, 1,
-1.459396, 1.028545, 0.04329826, 1, 1, 1, 1, 1,
-1.456602, -0.9322615, -1.370144, 1, 1, 1, 1, 1,
-1.456084, 0.7564551, 0.4014145, 1, 1, 1, 1, 1,
-1.45583, 0.7302438, -0.6080756, 1, 1, 1, 1, 1,
-1.453232, 0.5770275, -1.176681, 1, 1, 1, 1, 1,
-1.453145, -0.2497381, -1.087541, 1, 1, 1, 1, 1,
-1.449708, 0.3038846, -0.2306083, 0, 0, 1, 1, 1,
-1.433832, -1.63682, -1.898696, 1, 0, 0, 1, 1,
-1.423492, -0.2667621, -0.960353, 1, 0, 0, 1, 1,
-1.421636, -0.04847961, -3.466597, 1, 0, 0, 1, 1,
-1.415791, 1.002668, -4.091259, 1, 0, 0, 1, 1,
-1.412779, -0.7048476, -1.377333, 1, 0, 0, 1, 1,
-1.409807, -1.819561, -3.212791, 0, 0, 0, 1, 1,
-1.399961, -0.06185775, -1.708559, 0, 0, 0, 1, 1,
-1.399583, 1.594269, -2.525107, 0, 0, 0, 1, 1,
-1.386648, 0.4288373, -1.758988, 0, 0, 0, 1, 1,
-1.377271, -0.4197071, -3.258703, 0, 0, 0, 1, 1,
-1.367909, -1.678503, -2.454687, 0, 0, 0, 1, 1,
-1.351383, -0.757885, -1.544315, 0, 0, 0, 1, 1,
-1.341236, 1.35009, -2.791913, 1, 1, 1, 1, 1,
-1.338953, -0.4434893, -1.235814, 1, 1, 1, 1, 1,
-1.331288, 0.8268201, -0.08962457, 1, 1, 1, 1, 1,
-1.329966, -1.534263, -2.386799, 1, 1, 1, 1, 1,
-1.322963, 0.5173815, -0.8147696, 1, 1, 1, 1, 1,
-1.321745, -0.5988294, -1.531131, 1, 1, 1, 1, 1,
-1.310365, 2.086411, -1.548344, 1, 1, 1, 1, 1,
-1.309223, 0.3299984, 1.461707, 1, 1, 1, 1, 1,
-1.304126, -0.5946657, 0.1772712, 1, 1, 1, 1, 1,
-1.300213, -0.5959162, -2.940398, 1, 1, 1, 1, 1,
-1.295198, -0.6305528, -0.5906327, 1, 1, 1, 1, 1,
-1.293966, 0.1116355, -0.744635, 1, 1, 1, 1, 1,
-1.293624, 0.4444481, -1.13325, 1, 1, 1, 1, 1,
-1.280663, -2.472842, -0.99072, 1, 1, 1, 1, 1,
-1.272617, 1.183035, 0.1516551, 1, 1, 1, 1, 1,
-1.271886, 0.6666606, 0.6232759, 0, 0, 1, 1, 1,
-1.249557, -0.7479948, -2.682368, 1, 0, 0, 1, 1,
-1.245115, 0.8539258, -1.280313, 1, 0, 0, 1, 1,
-1.241869, -1.930427, -0.9431607, 1, 0, 0, 1, 1,
-1.239571, -0.4437515, -1.360597, 1, 0, 0, 1, 1,
-1.23136, -0.7857945, -2.339118, 1, 0, 0, 1, 1,
-1.219808, 0.1134299, -0.6870484, 0, 0, 0, 1, 1,
-1.218141, -0.3748026, -3.051908, 0, 0, 0, 1, 1,
-1.205646, 0.534139, -0.7724661, 0, 0, 0, 1, 1,
-1.196018, -1.963713, -0.7997069, 0, 0, 0, 1, 1,
-1.192693, -0.8281954, -2.325111, 0, 0, 0, 1, 1,
-1.183881, -0.9910821, -3.269238, 0, 0, 0, 1, 1,
-1.180614, 0.5304492, 0.03609738, 0, 0, 0, 1, 1,
-1.177988, -0.7833564, -2.243882, 1, 1, 1, 1, 1,
-1.175833, -1.119171, -3.099128, 1, 1, 1, 1, 1,
-1.175425, -0.5348736, -2.592355, 1, 1, 1, 1, 1,
-1.167249, 0.8691799, 1.309018, 1, 1, 1, 1, 1,
-1.16606, -1.362138, -2.25576, 1, 1, 1, 1, 1,
-1.16263, -0.4488256, -0.6679655, 1, 1, 1, 1, 1,
-1.159895, 0.1823041, -2.636781, 1, 1, 1, 1, 1,
-1.156804, -0.6729089, -3.226947, 1, 1, 1, 1, 1,
-1.154835, 0.9800357, -0.6735835, 1, 1, 1, 1, 1,
-1.152903, 1.957796, 0.3847468, 1, 1, 1, 1, 1,
-1.152082, 0.04522097, -2.078171, 1, 1, 1, 1, 1,
-1.149575, 0.5651655, 0.01077904, 1, 1, 1, 1, 1,
-1.149076, 0.3675521, -2.335482, 1, 1, 1, 1, 1,
-1.136147, 2.05936, 0.7429325, 1, 1, 1, 1, 1,
-1.134607, 0.2145114, -2.564527, 1, 1, 1, 1, 1,
-1.129762, 0.808571, -1.23008, 0, 0, 1, 1, 1,
-1.11593, 1.577216, -0.03466799, 1, 0, 0, 1, 1,
-1.112454, -1.462533, -2.66684, 1, 0, 0, 1, 1,
-1.1122, -0.7562016, -3.38378, 1, 0, 0, 1, 1,
-1.105071, -0.456035, -2.671881, 1, 0, 0, 1, 1,
-1.10119, 1.7683, -0.7362473, 1, 0, 0, 1, 1,
-1.097602, 1.763916, -1.638262, 0, 0, 0, 1, 1,
-1.085591, 0.2333895, -1.140186, 0, 0, 0, 1, 1,
-1.085317, 1.103412, -0.6774434, 0, 0, 0, 1, 1,
-1.077149, -1.281094, -1.922706, 0, 0, 0, 1, 1,
-1.060543, -0.9139374, -0.9800066, 0, 0, 0, 1, 1,
-1.051986, -1.968211, -0.2916868, 0, 0, 0, 1, 1,
-1.05163, 0.2412669, -1.493719, 0, 0, 0, 1, 1,
-1.04837, -0.09000836, -1.679545, 1, 1, 1, 1, 1,
-1.041328, -0.3149323, -3.41666, 1, 1, 1, 1, 1,
-1.041137, 0.2121927, -0.0145179, 1, 1, 1, 1, 1,
-1.037414, -0.3948807, -0.9262707, 1, 1, 1, 1, 1,
-1.033826, 2.700926, -0.9100105, 1, 1, 1, 1, 1,
-1.032785, -0.5491284, -1.144563, 1, 1, 1, 1, 1,
-1.021573, 0.7574465, -1.066022, 1, 1, 1, 1, 1,
-1.021416, 0.2095817, -1.226789, 1, 1, 1, 1, 1,
-1.020554, -0.1268441, -0.4322236, 1, 1, 1, 1, 1,
-1.017696, -0.717155, -1.870471, 1, 1, 1, 1, 1,
-1.008299, 0.7667516, -0.438959, 1, 1, 1, 1, 1,
-1.001507, 0.2639168, -1.215721, 1, 1, 1, 1, 1,
-0.9962816, 0.684877, -2.90012, 1, 1, 1, 1, 1,
-0.9950067, -0.02926293, -0.5569335, 1, 1, 1, 1, 1,
-0.983461, -0.006592842, 0.2900407, 1, 1, 1, 1, 1,
-0.974788, 0.3441072, -2.003264, 0, 0, 1, 1, 1,
-0.9701956, -1.477656, -1.810448, 1, 0, 0, 1, 1,
-0.9676958, -2.132796, -2.743798, 1, 0, 0, 1, 1,
-0.9642838, 0.3166835, -1.293844, 1, 0, 0, 1, 1,
-0.9629176, -0.4131183, -3.343264, 1, 0, 0, 1, 1,
-0.9613296, -0.7338093, -2.845344, 1, 0, 0, 1, 1,
-0.9453535, -1.182594, -2.923167, 0, 0, 0, 1, 1,
-0.9429001, -0.1399079, -3.002696, 0, 0, 0, 1, 1,
-0.9428411, -1.228169, -2.837789, 0, 0, 0, 1, 1,
-0.936913, 0.6151768, -1.291475, 0, 0, 0, 1, 1,
-0.9349419, -0.7164494, -1.792216, 0, 0, 0, 1, 1,
-0.9282379, -0.5060413, 0.05273933, 0, 0, 0, 1, 1,
-0.9279023, -1.742412, -3.743715, 0, 0, 0, 1, 1,
-0.9269748, -1.041095, -2.801925, 1, 1, 1, 1, 1,
-0.9140138, -1.17844, -0.7394593, 1, 1, 1, 1, 1,
-0.9102944, 0.0439876, -0.8833394, 1, 1, 1, 1, 1,
-0.9077911, -1.037899, -1.525725, 1, 1, 1, 1, 1,
-0.904421, -0.0213613, -1.568877, 1, 1, 1, 1, 1,
-0.9040706, -0.5678309, -1.866435, 1, 1, 1, 1, 1,
-0.9029358, -0.328494, -3.763391, 1, 1, 1, 1, 1,
-0.9007605, 1.343516, -1.634457, 1, 1, 1, 1, 1,
-0.8989178, -0.2099248, -2.798519, 1, 1, 1, 1, 1,
-0.8953711, 1.720905, -0.5686476, 1, 1, 1, 1, 1,
-0.8935223, 0.7700629, -1.164292, 1, 1, 1, 1, 1,
-0.8852646, 1.108971, 0.6864462, 1, 1, 1, 1, 1,
-0.8812872, 1.536685, -0.3553694, 1, 1, 1, 1, 1,
-0.8807419, 0.7686162, -0.2755666, 1, 1, 1, 1, 1,
-0.8782594, 1.28746, 0.09853323, 1, 1, 1, 1, 1,
-0.8720879, -1.556763, -3.351671, 0, 0, 1, 1, 1,
-0.8708105, 1.478518, -1.099564, 1, 0, 0, 1, 1,
-0.8631893, -2.048283, -2.626916, 1, 0, 0, 1, 1,
-0.8630325, 0.7038782, -1.596095, 1, 0, 0, 1, 1,
-0.8627939, 0.5713279, -0.6073696, 1, 0, 0, 1, 1,
-0.8522042, 0.9478177, -0.0004265658, 1, 0, 0, 1, 1,
-0.851845, -0.6643356, -4.523193, 0, 0, 0, 1, 1,
-0.8463032, 1.897635, 0.4141177, 0, 0, 0, 1, 1,
-0.8457881, 0.6592022, -2.349221, 0, 0, 0, 1, 1,
-0.8446895, -0.02935965, -1.598845, 0, 0, 0, 1, 1,
-0.8432152, -0.4349359, -1.886819, 0, 0, 0, 1, 1,
-0.8375874, -0.1136509, -2.467512, 0, 0, 0, 1, 1,
-0.8374048, 0.6127493, -1.871131, 0, 0, 0, 1, 1,
-0.8364845, -0.3632372, -1.080731, 1, 1, 1, 1, 1,
-0.835766, -0.2646136, 0.8998058, 1, 1, 1, 1, 1,
-0.8288468, -1.271309, -2.164641, 1, 1, 1, 1, 1,
-0.8287469, 0.7797295, -0.5254933, 1, 1, 1, 1, 1,
-0.8257758, 0.1123102, -1.336432, 1, 1, 1, 1, 1,
-0.8257533, 0.5186412, -0.1764913, 1, 1, 1, 1, 1,
-0.8248619, 0.9180375, -0.5914264, 1, 1, 1, 1, 1,
-0.8240374, -0.7667267, -2.585942, 1, 1, 1, 1, 1,
-0.8201692, -0.01257932, 0.1910469, 1, 1, 1, 1, 1,
-0.8185945, 0.09304939, -0.4503931, 1, 1, 1, 1, 1,
-0.8164679, 1.318884, -0.7675757, 1, 1, 1, 1, 1,
-0.8116229, 0.05804173, -0.7355374, 1, 1, 1, 1, 1,
-0.8097389, 1.019179, -0.129158, 1, 1, 1, 1, 1,
-0.8073902, 0.04588104, -0.8071476, 1, 1, 1, 1, 1,
-0.8071242, -1.118728, -2.400143, 1, 1, 1, 1, 1,
-0.8071156, -0.144804, -0.5235046, 0, 0, 1, 1, 1,
-0.8054177, -1.378994, -1.528998, 1, 0, 0, 1, 1,
-0.8042622, 0.04232137, -1.791176, 1, 0, 0, 1, 1,
-0.7999089, -0.06247092, -1.362922, 1, 0, 0, 1, 1,
-0.7978625, -0.6194206, -0.9259309, 1, 0, 0, 1, 1,
-0.790068, 0.547684, -0.397455, 1, 0, 0, 1, 1,
-0.7893394, -1.948315, -2.427863, 0, 0, 0, 1, 1,
-0.786235, 0.9381402, -1.414088, 0, 0, 0, 1, 1,
-0.7752345, 0.4909382, -0.3405462, 0, 0, 0, 1, 1,
-0.7617403, 0.7447108, -0.7613434, 0, 0, 0, 1, 1,
-0.7595394, 1.397015, -0.054374, 0, 0, 0, 1, 1,
-0.7591318, -1.687391, -3.361818, 0, 0, 0, 1, 1,
-0.7509868, 1.175261, 0.2355004, 0, 0, 0, 1, 1,
-0.7500229, -0.101243, -0.9536254, 1, 1, 1, 1, 1,
-0.7480314, -1.377943, -2.873698, 1, 1, 1, 1, 1,
-0.7461406, -1.343132, -2.981395, 1, 1, 1, 1, 1,
-0.7396585, -0.3579499, -3.794983, 1, 1, 1, 1, 1,
-0.7380933, 0.5813097, -2.073201, 1, 1, 1, 1, 1,
-0.7321678, -0.9440949, -0.8865742, 1, 1, 1, 1, 1,
-0.7318662, 1.510512, -0.1497205, 1, 1, 1, 1, 1,
-0.7311842, 0.3452953, -1.454325, 1, 1, 1, 1, 1,
-0.7309135, 0.573458, -0.08014573, 1, 1, 1, 1, 1,
-0.7222158, -2.860836, -2.830253, 1, 1, 1, 1, 1,
-0.7166427, 0.06478627, -1.926884, 1, 1, 1, 1, 1,
-0.7157956, 0.1642924, -0.5761602, 1, 1, 1, 1, 1,
-0.7127497, -0.6947173, -2.951894, 1, 1, 1, 1, 1,
-0.7106457, -0.5965939, -1.960818, 1, 1, 1, 1, 1,
-0.7095393, 2.874326, -0.1800527, 1, 1, 1, 1, 1,
-0.7088845, -0.06567381, -2.505253, 0, 0, 1, 1, 1,
-0.7086287, 0.05139662, 0.2790169, 1, 0, 0, 1, 1,
-0.7004715, -0.650707, -2.314281, 1, 0, 0, 1, 1,
-0.6988224, 2.86166, 0.02909011, 1, 0, 0, 1, 1,
-0.6893874, 1.426831, -0.6564547, 1, 0, 0, 1, 1,
-0.6870257, 1.15668, 0.7583935, 1, 0, 0, 1, 1,
-0.6837362, -0.5815443, -3.821423, 0, 0, 0, 1, 1,
-0.6830786, 1.242237, 0.06472196, 0, 0, 0, 1, 1,
-0.6792555, -0.3956205, -0.08656466, 0, 0, 0, 1, 1,
-0.6772391, -1.889042, -4.868706, 0, 0, 0, 1, 1,
-0.6709045, -0.7869694, -0.8200731, 0, 0, 0, 1, 1,
-0.6697637, -1.160637, -3.445446, 0, 0, 0, 1, 1,
-0.6592481, -0.5724985, -3.32445, 0, 0, 0, 1, 1,
-0.6573667, 0.01397389, -1.251269, 1, 1, 1, 1, 1,
-0.6502306, -0.2291027, 0.1611842, 1, 1, 1, 1, 1,
-0.6494322, 0.8701305, 0.6627142, 1, 1, 1, 1, 1,
-0.6489649, 1.585722, -0.8174723, 1, 1, 1, 1, 1,
-0.6487595, 0.9216385, 1.359179, 1, 1, 1, 1, 1,
-0.6486725, -0.3226092, -3.508824, 1, 1, 1, 1, 1,
-0.6480608, 0.3295679, 0.1717671, 1, 1, 1, 1, 1,
-0.6475699, 0.5225539, 0.290746, 1, 1, 1, 1, 1,
-0.6465329, -2.017349, -2.487407, 1, 1, 1, 1, 1,
-0.6450142, 0.4018906, -0.874877, 1, 1, 1, 1, 1,
-0.644087, 1.361877, -1.289069, 1, 1, 1, 1, 1,
-0.6423419, 0.919726, -2.478267, 1, 1, 1, 1, 1,
-0.642141, -1.654182, -1.222989, 1, 1, 1, 1, 1,
-0.6372806, 1.70379, 0.7857698, 1, 1, 1, 1, 1,
-0.6315849, 1.159276, -1.412511, 1, 1, 1, 1, 1,
-0.6311078, -0.8101853, -1.143077, 0, 0, 1, 1, 1,
-0.6285013, -1.316836, -2.457153, 1, 0, 0, 1, 1,
-0.6234952, 1.007736, -1.048709, 1, 0, 0, 1, 1,
-0.6211696, -0.3179803, -3.029258, 1, 0, 0, 1, 1,
-0.6211041, 0.8663454, -2.232689, 1, 0, 0, 1, 1,
-0.6185303, -0.9991913, -3.029625, 1, 0, 0, 1, 1,
-0.6183015, -0.8642196, -2.508769, 0, 0, 0, 1, 1,
-0.6161631, 1.879662, -1.475249, 0, 0, 0, 1, 1,
-0.6115075, 0.3148681, -0.2588866, 0, 0, 0, 1, 1,
-0.608295, -0.6474399, -1.861918, 0, 0, 0, 1, 1,
-0.6047999, -1.191712, -2.449675, 0, 0, 0, 1, 1,
-0.5980627, 1.77222, -0.4495154, 0, 0, 0, 1, 1,
-0.597841, 3.525645, 1.318805, 0, 0, 0, 1, 1,
-0.597577, 0.2661032, -2.048148, 1, 1, 1, 1, 1,
-0.5935225, -1.015336, -3.529707, 1, 1, 1, 1, 1,
-0.5927852, 1.468952, 1.227854, 1, 1, 1, 1, 1,
-0.5898076, 1.513832, 0.2565388, 1, 1, 1, 1, 1,
-0.586857, -0.7707661, -1.998306, 1, 1, 1, 1, 1,
-0.5838308, -0.2812514, -2.532098, 1, 1, 1, 1, 1,
-0.5833676, 0.8410797, -0.7709675, 1, 1, 1, 1, 1,
-0.5808229, 0.8898057, -2.094182, 1, 1, 1, 1, 1,
-0.5805757, -0.4940964, -2.5797, 1, 1, 1, 1, 1,
-0.5790262, 0.5947812, 0.4142191, 1, 1, 1, 1, 1,
-0.5741245, 0.8484629, -0.3958597, 1, 1, 1, 1, 1,
-0.5738065, 2.121242, -0.4459568, 1, 1, 1, 1, 1,
-0.5657958, 0.9134576, 0.7402164, 1, 1, 1, 1, 1,
-0.5656595, -0.7122594, -2.080993, 1, 1, 1, 1, 1,
-0.557603, -0.3786184, -2.309063, 1, 1, 1, 1, 1,
-0.5564973, -0.1093186, -0.5011982, 0, 0, 1, 1, 1,
-0.5544684, 2.624645, 0.03963269, 1, 0, 0, 1, 1,
-0.5538691, 0.7249599, 0.775133, 1, 0, 0, 1, 1,
-0.5508714, -0.91526, -2.42022, 1, 0, 0, 1, 1,
-0.5498497, -1.146383, -2.587006, 1, 0, 0, 1, 1,
-0.5459038, 1.144083, -0.9407347, 1, 0, 0, 1, 1,
-0.5436451, -1.980392, -1.376284, 0, 0, 0, 1, 1,
-0.5433747, -0.7461635, -2.612565, 0, 0, 0, 1, 1,
-0.5411304, -1.067331, -2.433112, 0, 0, 0, 1, 1,
-0.5398319, 0.2371749, -1.238588, 0, 0, 0, 1, 1,
-0.5377597, 0.1371035, -1.920564, 0, 0, 0, 1, 1,
-0.5376821, -0.6959708, -2.859994, 0, 0, 0, 1, 1,
-0.5183212, -0.01721722, 0.7708454, 0, 0, 0, 1, 1,
-0.5155121, 1.707455, -1.477306, 1, 1, 1, 1, 1,
-0.5142843, -0.1599467, -2.891623, 1, 1, 1, 1, 1,
-0.5075597, 2.181982, -1.086014, 1, 1, 1, 1, 1,
-0.4998085, -0.211809, -2.237918, 1, 1, 1, 1, 1,
-0.4977396, -0.7431201, -3.549161, 1, 1, 1, 1, 1,
-0.4926578, 0.2205928, -1.064784, 1, 1, 1, 1, 1,
-0.4918915, -0.592805, -3.061016, 1, 1, 1, 1, 1,
-0.4916295, 0.4395229, -0.1493435, 1, 1, 1, 1, 1,
-0.490202, 0.3313175, -1.326177, 1, 1, 1, 1, 1,
-0.4771584, -0.1946546, -2.186618, 1, 1, 1, 1, 1,
-0.475782, -0.7097483, -2.868359, 1, 1, 1, 1, 1,
-0.4683245, 1.66127, 0.3759071, 1, 1, 1, 1, 1,
-0.4668435, -1.334252, -3.677739, 1, 1, 1, 1, 1,
-0.4642255, 0.4888242, 0.6554647, 1, 1, 1, 1, 1,
-0.4599457, 1.230501, 1.080813, 1, 1, 1, 1, 1,
-0.4597016, 1.640443, -0.7855258, 0, 0, 1, 1, 1,
-0.4586789, 0.4078438, -0.363472, 1, 0, 0, 1, 1,
-0.4533279, -0.6099353, -2.151207, 1, 0, 0, 1, 1,
-0.4530576, -0.8317371, -2.591773, 1, 0, 0, 1, 1,
-0.449971, -0.557893, -3.064306, 1, 0, 0, 1, 1,
-0.4456992, -0.6082557, -1.298071, 1, 0, 0, 1, 1,
-0.445696, 0.04899616, -0.321206, 0, 0, 0, 1, 1,
-0.4455708, 0.4618081, -0.5309979, 0, 0, 0, 1, 1,
-0.4442854, -1.150205, -1.199564, 0, 0, 0, 1, 1,
-0.4431356, 1.172617, 0.3462226, 0, 0, 0, 1, 1,
-0.4428441, -1.111209, -0.9761274, 0, 0, 0, 1, 1,
-0.4391405, 0.509473, -1.41444, 0, 0, 0, 1, 1,
-0.4384933, 0.4647011, -1.069618, 0, 0, 0, 1, 1,
-0.437429, 0.4621097, -0.5584355, 1, 1, 1, 1, 1,
-0.4343206, -1.371992, -2.490359, 1, 1, 1, 1, 1,
-0.430772, -0.1162357, -1.031486, 1, 1, 1, 1, 1,
-0.4293019, -1.521343, -3.721391, 1, 1, 1, 1, 1,
-0.4283484, -0.8734323, -3.596365, 1, 1, 1, 1, 1,
-0.4271886, 1.380242, 0.9018388, 1, 1, 1, 1, 1,
-0.4201286, -1.788457, -3.934172, 1, 1, 1, 1, 1,
-0.4174189, -0.2539949, -4.002802, 1, 1, 1, 1, 1,
-0.4173067, 0.5266795, 0.743226, 1, 1, 1, 1, 1,
-0.4159397, 1.114083, 0.007882403, 1, 1, 1, 1, 1,
-0.4158321, -0.5678985, -2.902321, 1, 1, 1, 1, 1,
-0.4142199, 0.5231952, -1.467859, 1, 1, 1, 1, 1,
-0.4138698, -0.1468505, -1.502973, 1, 1, 1, 1, 1,
-0.4048126, -0.9840258, -3.182481, 1, 1, 1, 1, 1,
-0.4017088, -0.7214018, -0.735153, 1, 1, 1, 1, 1,
-0.3856694, -0.2435857, -2.463006, 0, 0, 1, 1, 1,
-0.3849772, -0.03554214, -0.9329991, 1, 0, 0, 1, 1,
-0.3849016, -0.04069491, -0.1714829, 1, 0, 0, 1, 1,
-0.3827231, -0.5980346, -3.255449, 1, 0, 0, 1, 1,
-0.3805458, -1.834233, -2.836428, 1, 0, 0, 1, 1,
-0.3794756, -0.9706895, -2.550337, 1, 0, 0, 1, 1,
-0.3775624, 1.563627, 0.09916297, 0, 0, 0, 1, 1,
-0.3768423, 1.208319, 0.4506948, 0, 0, 0, 1, 1,
-0.3737934, -0.2795902, -3.045725, 0, 0, 0, 1, 1,
-0.3717341, 0.9334275, -0.5710956, 0, 0, 0, 1, 1,
-0.3673656, -1.893167, -3.394906, 0, 0, 0, 1, 1,
-0.3633916, -2.24351, -2.953705, 0, 0, 0, 1, 1,
-0.3621772, -1.563492, -1.724967, 0, 0, 0, 1, 1,
-0.361742, 0.7953057, 0.1169737, 1, 1, 1, 1, 1,
-0.3616113, -1.491938, -3.008258, 1, 1, 1, 1, 1,
-0.3613791, -1.527059, -3.047536, 1, 1, 1, 1, 1,
-0.3468652, -0.7590337, -0.5933676, 1, 1, 1, 1, 1,
-0.3409411, 1.854171, -0.1388227, 1, 1, 1, 1, 1,
-0.3408303, 0.3532788, 0.3720157, 1, 1, 1, 1, 1,
-0.3375953, 0.7995034, 0.2102741, 1, 1, 1, 1, 1,
-0.3300785, 1.184242, -1.509194, 1, 1, 1, 1, 1,
-0.3293486, -0.8745562, -2.530502, 1, 1, 1, 1, 1,
-0.3285531, 1.30301, 0.2930634, 1, 1, 1, 1, 1,
-0.3254924, -0.2316274, -2.273142, 1, 1, 1, 1, 1,
-0.3225928, -0.6017445, -3.271288, 1, 1, 1, 1, 1,
-0.3225854, -0.4525055, -3.417836, 1, 1, 1, 1, 1,
-0.322179, -0.3625312, -2.314892, 1, 1, 1, 1, 1,
-0.3216903, 1.026406, -1.855291, 1, 1, 1, 1, 1,
-0.3171828, 0.8276498, 0.151105, 0, 0, 1, 1, 1,
-0.3134718, 0.4338641, -0.5059953, 1, 0, 0, 1, 1,
-0.3118503, -0.4869668, 0.2960648, 1, 0, 0, 1, 1,
-0.3074872, 0.4289609, -1.061521, 1, 0, 0, 1, 1,
-0.3030305, -0.797424, -3.312726, 1, 0, 0, 1, 1,
-0.3010209, 1.404286, -1.272466, 1, 0, 0, 1, 1,
-0.300698, -0.7325783, -2.365238, 0, 0, 0, 1, 1,
-0.3001575, 0.6444104, -0.9785626, 0, 0, 0, 1, 1,
-0.2992209, -0.3886069, -2.124241, 0, 0, 0, 1, 1,
-0.2985708, 0.0650991, -2.680687, 0, 0, 0, 1, 1,
-0.2960087, -0.4652421, -1.470955, 0, 0, 0, 1, 1,
-0.2941065, 0.3077778, -1.346509, 0, 0, 0, 1, 1,
-0.2912216, -1.414508, -3.325752, 0, 0, 0, 1, 1,
-0.2865837, 0.5679243, -1.326662, 1, 1, 1, 1, 1,
-0.2860947, -0.2197307, -1.910696, 1, 1, 1, 1, 1,
-0.2859721, 0.8701194, -0.6827903, 1, 1, 1, 1, 1,
-0.278118, 1.879747, 0.2322469, 1, 1, 1, 1, 1,
-0.2764346, -0.7016929, -1.896777, 1, 1, 1, 1, 1,
-0.2737139, 0.4870797, -1.640375, 1, 1, 1, 1, 1,
-0.26878, 0.08387195, -1.201334, 1, 1, 1, 1, 1,
-0.2679379, -1.062965, -5.791804, 1, 1, 1, 1, 1,
-0.2666817, -2.276241, -2.884492, 1, 1, 1, 1, 1,
-0.2666308, 1.019622, -0.8515559, 1, 1, 1, 1, 1,
-0.2650256, 0.3027878, -0.02040922, 1, 1, 1, 1, 1,
-0.2608121, 0.2339363, -0.580797, 1, 1, 1, 1, 1,
-0.258088, -0.6528204, -2.639706, 1, 1, 1, 1, 1,
-0.2511561, 0.2674781, -1.440466, 1, 1, 1, 1, 1,
-0.2489744, -0.8320702, -2.177266, 1, 1, 1, 1, 1,
-0.2396726, 0.7804143, 0.1666784, 0, 0, 1, 1, 1,
-0.2350643, 0.3852626, 0.06646746, 1, 0, 0, 1, 1,
-0.2328319, -1.632406, -4.069359, 1, 0, 0, 1, 1,
-0.2297806, -0.5124967, -3.488125, 1, 0, 0, 1, 1,
-0.2257955, 0.4332749, -1.607167, 1, 0, 0, 1, 1,
-0.2255848, -0.2027531, -2.054466, 1, 0, 0, 1, 1,
-0.2245958, 0.1962085, -1.175009, 0, 0, 0, 1, 1,
-0.2236014, -1.919867, -2.108354, 0, 0, 0, 1, 1,
-0.2162813, -0.1994728, -3.334206, 0, 0, 0, 1, 1,
-0.2111417, -0.1171103, -1.803196, 0, 0, 0, 1, 1,
-0.2107685, 0.03871418, -1.100397, 0, 0, 0, 1, 1,
-0.2088259, -1.097176, -2.862145, 0, 0, 0, 1, 1,
-0.2031771, 0.4781244, -1.431192, 0, 0, 0, 1, 1,
-0.2027922, -0.889151, -4.171953, 1, 1, 1, 1, 1,
-0.1982469, 0.776267, -1.439412, 1, 1, 1, 1, 1,
-0.1959884, 0.6515815, 0.1529684, 1, 1, 1, 1, 1,
-0.1948292, -0.2532747, -3.751171, 1, 1, 1, 1, 1,
-0.1895066, -0.01753519, -1.358506, 1, 1, 1, 1, 1,
-0.1831944, -0.0453058, -1.741606, 1, 1, 1, 1, 1,
-0.182094, -1.198065, -1.510279, 1, 1, 1, 1, 1,
-0.1813602, -0.8373846, -2.688036, 1, 1, 1, 1, 1,
-0.1801915, 0.4429557, 0.829874, 1, 1, 1, 1, 1,
-0.1793909, -0.4541646, -2.856794, 1, 1, 1, 1, 1,
-0.1775335, -0.4099324, -0.9954132, 1, 1, 1, 1, 1,
-0.1771015, -1.157021, -3.086705, 1, 1, 1, 1, 1,
-0.1767193, -0.2553727, -0.7770337, 1, 1, 1, 1, 1,
-0.1755783, -1.71378, -4.014607, 1, 1, 1, 1, 1,
-0.175336, -0.1505461, -3.617559, 1, 1, 1, 1, 1,
-0.1746995, 0.08074717, -1.749967, 0, 0, 1, 1, 1,
-0.1705855, 1.187627, -0.9345738, 1, 0, 0, 1, 1,
-0.1683437, 0.5234091, 0.5841585, 1, 0, 0, 1, 1,
-0.1636724, -0.005279341, -3.000012, 1, 0, 0, 1, 1,
-0.1612972, 0.1893845, -1.711148, 1, 0, 0, 1, 1,
-0.1579715, -0.8468242, -3.206114, 1, 0, 0, 1, 1,
-0.1579549, -0.5044249, -0.8683968, 0, 0, 0, 1, 1,
-0.1571971, 0.8259524, 1.714069, 0, 0, 0, 1, 1,
-0.1539173, -0.8329619, -3.574605, 0, 0, 0, 1, 1,
-0.1443025, -1.134463, -3.403935, 0, 0, 0, 1, 1,
-0.1439057, 0.4081656, 0.8231357, 0, 0, 0, 1, 1,
-0.1425354, -0.6670192, -4.345844, 0, 0, 0, 1, 1,
-0.1422431, 1.004404, 1.767386, 0, 0, 0, 1, 1,
-0.1415792, 0.9383096, 0.6855684, 1, 1, 1, 1, 1,
-0.1406699, 1.695023, 0.07487054, 1, 1, 1, 1, 1,
-0.1402264, -0.9826648, -3.252026, 1, 1, 1, 1, 1,
-0.1373068, 1.072341, -0.1732301, 1, 1, 1, 1, 1,
-0.1372738, -2.112543, -1.882123, 1, 1, 1, 1, 1,
-0.1366612, -0.1499001, -1.809159, 1, 1, 1, 1, 1,
-0.1354164, -0.4310702, -2.210418, 1, 1, 1, 1, 1,
-0.1350743, -0.06156427, -0.6846125, 1, 1, 1, 1, 1,
-0.1324107, 0.57743, -0.4558716, 1, 1, 1, 1, 1,
-0.1315053, -0.4425862, -2.408293, 1, 1, 1, 1, 1,
-0.1305669, 1.507882, -0.5425526, 1, 1, 1, 1, 1,
-0.1286706, -2.818048, -0.8858346, 1, 1, 1, 1, 1,
-0.1245365, -1.544024, -3.892359, 1, 1, 1, 1, 1,
-0.1235113, 1.330424, 0.910346, 1, 1, 1, 1, 1,
-0.1225904, -0.4658478, -2.18609, 1, 1, 1, 1, 1,
-0.1214173, 0.9852796, -0.1327433, 0, 0, 1, 1, 1,
-0.1167276, 1.302804, 0.1324882, 1, 0, 0, 1, 1,
-0.1158612, -0.5529996, -2.84018, 1, 0, 0, 1, 1,
-0.112024, -1.251854, -2.310682, 1, 0, 0, 1, 1,
-0.1115565, 0.8578684, -0.1610469, 1, 0, 0, 1, 1,
-0.1111126, 0.8373818, 1.413622, 1, 0, 0, 1, 1,
-0.1062359, 2.185247, -1.395086, 0, 0, 0, 1, 1,
-0.1057806, 0.5640988, 0.9427738, 0, 0, 0, 1, 1,
-0.1029806, -0.304913, -3.041127, 0, 0, 0, 1, 1,
-0.1023001, 1.758555, 1.552347, 0, 0, 0, 1, 1,
-0.1021003, -1.716151, -2.119043, 0, 0, 0, 1, 1,
-0.1003941, 1.18923, 0.2150494, 0, 0, 0, 1, 1,
-0.09115645, 0.5796532, -0.5775109, 0, 0, 0, 1, 1,
-0.09033947, -1.700999, -2.287544, 1, 1, 1, 1, 1,
-0.0889337, -1.898315, -3.24177, 1, 1, 1, 1, 1,
-0.08886382, -0.8677834, -3.623278, 1, 1, 1, 1, 1,
-0.08834068, -0.1970683, -3.029209, 1, 1, 1, 1, 1,
-0.08674861, 3.01061, 1.60201, 1, 1, 1, 1, 1,
-0.07826429, 1.177124, 1.450691, 1, 1, 1, 1, 1,
-0.07604483, -0.08106866, -2.66272, 1, 1, 1, 1, 1,
-0.06319217, -1.163559, -4.956537, 1, 1, 1, 1, 1,
-0.06251583, 0.9894018, -0.8655295, 1, 1, 1, 1, 1,
-0.06175936, 0.8490642, -1.806935, 1, 1, 1, 1, 1,
-0.05713168, -0.5809169, -0.9949487, 1, 1, 1, 1, 1,
-0.05457389, -0.509258, -4.146854, 1, 1, 1, 1, 1,
-0.0544726, -1.782687, -3.10988, 1, 1, 1, 1, 1,
-0.05128024, 0.4906476, 0.7375535, 1, 1, 1, 1, 1,
-0.04933332, 1.827138, 0.8557685, 1, 1, 1, 1, 1,
-0.04555124, 0.1864736, 0.3624493, 0, 0, 1, 1, 1,
-0.04462849, 0.1934727, -0.5969145, 1, 0, 0, 1, 1,
-0.04392445, 1.361146, -1.154895, 1, 0, 0, 1, 1,
-0.04212969, -0.304341, -2.06905, 1, 0, 0, 1, 1,
-0.0369004, -0.03935145, -1.549936, 1, 0, 0, 1, 1,
-0.03662121, 0.6639329, 0.4545213, 1, 0, 0, 1, 1,
-0.03509618, 2.097824, 2.333187, 0, 0, 0, 1, 1,
-0.03414757, 1.007007, 0.5780871, 0, 0, 0, 1, 1,
-0.03293188, -0.580108, -0.8560814, 0, 0, 0, 1, 1,
-0.02364238, 0.1973651, -0.1904077, 0, 0, 0, 1, 1,
-0.02214932, 0.4924636, -0.7249612, 0, 0, 0, 1, 1,
-0.02163819, 0.4452792, -0.6014769, 0, 0, 0, 1, 1,
-0.01926321, -3.032548, -3.518914, 0, 0, 0, 1, 1,
-0.01847523, -1.652649, -2.914903, 1, 1, 1, 1, 1,
-0.01078164, 0.36342, 1.698486, 1, 1, 1, 1, 1,
-0.009472458, -0.6681439, -2.917414, 1, 1, 1, 1, 1,
-0.004445766, -0.8498745, -2.446108, 1, 1, 1, 1, 1,
0.005039075, 0.8744554, -0.6490945, 1, 1, 1, 1, 1,
0.01227268, 1.968395, -0.1331899, 1, 1, 1, 1, 1,
0.01348905, -0.2070225, 2.527498, 1, 1, 1, 1, 1,
0.01444597, 1.07047, 0.2079755, 1, 1, 1, 1, 1,
0.01665928, 0.1382467, 0.2683462, 1, 1, 1, 1, 1,
0.01741044, -1.289474, 2.602825, 1, 1, 1, 1, 1,
0.02011632, 0.3485397, -0.9639722, 1, 1, 1, 1, 1,
0.02388564, 1.104242, 0.4022253, 1, 1, 1, 1, 1,
0.02486253, 1.232608, -1.081062, 1, 1, 1, 1, 1,
0.03238333, 0.182272, 0.2288619, 1, 1, 1, 1, 1,
0.03293204, 0.2147977, 0.4579781, 1, 1, 1, 1, 1,
0.03680779, -0.6488544, 3.440643, 0, 0, 1, 1, 1,
0.03872424, 0.4773304, -0.1366601, 1, 0, 0, 1, 1,
0.0387535, 0.8557855, -0.2980955, 1, 0, 0, 1, 1,
0.04277746, -2.433896, 2.997191, 1, 0, 0, 1, 1,
0.04364424, 1.207949, 0.3473732, 1, 0, 0, 1, 1,
0.046225, 0.236695, 0.03156934, 1, 0, 0, 1, 1,
0.04808573, -0.06872217, 2.689797, 0, 0, 0, 1, 1,
0.04965338, -0.1441872, 3.225232, 0, 0, 0, 1, 1,
0.05552415, -1.27988, 5.54952, 0, 0, 0, 1, 1,
0.05591108, 0.6145502, 0.02285315, 0, 0, 0, 1, 1,
0.05778712, -0.06744266, 2.222588, 0, 0, 0, 1, 1,
0.05789856, -1.073892, 1.481833, 0, 0, 0, 1, 1,
0.06050731, -0.8054295, 3.523, 0, 0, 0, 1, 1,
0.06322911, -1.081997, 2.742274, 1, 1, 1, 1, 1,
0.0693213, -1.165012, 1.312128, 1, 1, 1, 1, 1,
0.07141354, -0.3576828, 3.116333, 1, 1, 1, 1, 1,
0.07456306, 0.03760567, 1.624658, 1, 1, 1, 1, 1,
0.07501493, 1.240993, -0.1984879, 1, 1, 1, 1, 1,
0.07607161, 1.882605, 0.633524, 1, 1, 1, 1, 1,
0.07649035, -0.6076615, 1.711936, 1, 1, 1, 1, 1,
0.07809862, -0.2802093, 2.371305, 1, 1, 1, 1, 1,
0.07910793, 0.04109759, -0.9961811, 1, 1, 1, 1, 1,
0.08218167, -0.2821642, 4.810847, 1, 1, 1, 1, 1,
0.08403188, 1.796208, 0.4961788, 1, 1, 1, 1, 1,
0.0859271, 0.989795, 0.7993039, 1, 1, 1, 1, 1,
0.08649331, 0.08209007, -0.02681789, 1, 1, 1, 1, 1,
0.08681752, -0.8791139, 2.392945, 1, 1, 1, 1, 1,
0.088265, 1.291763, -0.05333626, 1, 1, 1, 1, 1,
0.09340951, 0.2434034, 0.6633191, 0, 0, 1, 1, 1,
0.09970932, -0.0795031, 0.798487, 1, 0, 0, 1, 1,
0.1000265, -0.5089725, 1.284009, 1, 0, 0, 1, 1,
0.1055663, 0.3363649, 1.238856, 1, 0, 0, 1, 1,
0.1081354, -0.4699983, 1.336084, 1, 0, 0, 1, 1,
0.110815, 0.2411467, 1.009887, 1, 0, 0, 1, 1,
0.11188, -0.4763398, 3.709759, 0, 0, 0, 1, 1,
0.1119266, -0.33044, 2.304347, 0, 0, 0, 1, 1,
0.1152866, -1.252653, 2.056499, 0, 0, 0, 1, 1,
0.1161578, -1.675496, 3.674808, 0, 0, 0, 1, 1,
0.1264664, -0.9869624, 3.501135, 0, 0, 0, 1, 1,
0.1285268, 0.08377766, 1.26414, 0, 0, 0, 1, 1,
0.1298088, 0.6119297, -0.1094636, 0, 0, 0, 1, 1,
0.1334757, -0.7789443, 1.49813, 1, 1, 1, 1, 1,
0.1340974, 1.756501, -0.6052036, 1, 1, 1, 1, 1,
0.1402754, -0.5175307, 3.003096, 1, 1, 1, 1, 1,
0.1405069, -1.017803, 4.465403, 1, 1, 1, 1, 1,
0.1438925, -0.8938036, 3.127173, 1, 1, 1, 1, 1,
0.1449285, 0.2252741, 1.110188, 1, 1, 1, 1, 1,
0.1490391, -0.5212693, 2.117037, 1, 1, 1, 1, 1,
0.1509742, -0.4365179, 3.519768, 1, 1, 1, 1, 1,
0.1548094, 0.8268729, 0.4345134, 1, 1, 1, 1, 1,
0.155098, -1.595569, 3.059097, 1, 1, 1, 1, 1,
0.1561641, -0.2204684, 3.201703, 1, 1, 1, 1, 1,
0.1598568, -0.281237, 3.267609, 1, 1, 1, 1, 1,
0.1610143, -1.420119, 4.607653, 1, 1, 1, 1, 1,
0.1628114, -0.5990085, 2.343603, 1, 1, 1, 1, 1,
0.1628726, 0.2998577, -0.1322655, 1, 1, 1, 1, 1,
0.1645772, -0.688858, 3.234508, 0, 0, 1, 1, 1,
0.1654396, -0.2304936, 4.517121, 1, 0, 0, 1, 1,
0.1684157, -0.2266553, 2.971557, 1, 0, 0, 1, 1,
0.1766579, 0.06537576, 0.8864012, 1, 0, 0, 1, 1,
0.1783615, -0.5482398, 2.626421, 1, 0, 0, 1, 1,
0.1810004, 0.452409, 1.224796, 1, 0, 0, 1, 1,
0.1816961, 2.1073, -0.1258894, 0, 0, 0, 1, 1,
0.1838107, -0.1306431, 1.720966, 0, 0, 0, 1, 1,
0.1873057, -0.5466051, 1.936028, 0, 0, 0, 1, 1,
0.1923864, 1.653154, -0.1728461, 0, 0, 0, 1, 1,
0.1935648, -1.642553, 3.855087, 0, 0, 0, 1, 1,
0.2006615, 1.056024, -0.1459158, 0, 0, 0, 1, 1,
0.2020044, -0.8011464, 3.972994, 0, 0, 0, 1, 1,
0.2039028, 1.382112, 1.571626, 1, 1, 1, 1, 1,
0.2051765, 0.5064988, 0.4472204, 1, 1, 1, 1, 1,
0.2161711, 0.7925559, -0.4955629, 1, 1, 1, 1, 1,
0.2165904, 0.9297433, -0.5080596, 1, 1, 1, 1, 1,
0.216673, 1.414301, 0.3313035, 1, 1, 1, 1, 1,
0.2174587, -2.083756, 3.45797, 1, 1, 1, 1, 1,
0.2219433, 1.600294, 0.1386843, 1, 1, 1, 1, 1,
0.2225939, 0.4942835, -0.3814385, 1, 1, 1, 1, 1,
0.2238028, -2.43183, 3.481289, 1, 1, 1, 1, 1,
0.2275422, -0.03546977, 2.433766, 1, 1, 1, 1, 1,
0.227636, 1.553872, 0.42757, 1, 1, 1, 1, 1,
0.2296757, -0.6281343, 2.288284, 1, 1, 1, 1, 1,
0.2382239, 0.04590112, 2.723511, 1, 1, 1, 1, 1,
0.2395383, 1.531986, -0.9895539, 1, 1, 1, 1, 1,
0.2441342, 0.1021851, -0.8910474, 1, 1, 1, 1, 1,
0.2460933, 1.05959, -0.6810189, 0, 0, 1, 1, 1,
0.2503975, -0.1478307, 1.744518, 1, 0, 0, 1, 1,
0.2507555, -0.1693284, 3.180979, 1, 0, 0, 1, 1,
0.2544039, 1.151043, 1.367337, 1, 0, 0, 1, 1,
0.2558033, -0.1461814, 0.9016957, 1, 0, 0, 1, 1,
0.2560892, -0.3072669, 3.347754, 1, 0, 0, 1, 1,
0.2602794, 0.2359805, 2.03662, 0, 0, 0, 1, 1,
0.2614661, 0.9502168, -0.9485552, 0, 0, 0, 1, 1,
0.2654413, 1.309845, 0.05669298, 0, 0, 0, 1, 1,
0.2731942, -0.5594222, 1.958097, 0, 0, 0, 1, 1,
0.2755447, -0.05571027, -0.02740853, 0, 0, 0, 1, 1,
0.2786036, 0.9226351, 0.3033256, 0, 0, 0, 1, 1,
0.2790236, 1.056062, 1.919914, 0, 0, 0, 1, 1,
0.2794888, 1.098469, -1.849779, 1, 1, 1, 1, 1,
0.2831388, 0.1979647, -0.4663801, 1, 1, 1, 1, 1,
0.2834228, -0.6936135, 4.04566, 1, 1, 1, 1, 1,
0.2860038, 0.09994943, 2.258721, 1, 1, 1, 1, 1,
0.289953, -1.723979, 2.593988, 1, 1, 1, 1, 1,
0.2962821, 1.415427, 0.7152854, 1, 1, 1, 1, 1,
0.2964781, 1.0471, -0.0009110043, 1, 1, 1, 1, 1,
0.3003487, -0.2910065, 3.792995, 1, 1, 1, 1, 1,
0.3044542, -0.03864075, 3.330944, 1, 1, 1, 1, 1,
0.3051338, -0.07501, 3.302247, 1, 1, 1, 1, 1,
0.3100507, 0.2742649, -0.8764463, 1, 1, 1, 1, 1,
0.3128665, -0.4161826, 2.751785, 1, 1, 1, 1, 1,
0.3147918, 2.147989, 0.5228471, 1, 1, 1, 1, 1,
0.3167479, -0.3610451, 3.619769, 1, 1, 1, 1, 1,
0.3212524, 0.3356176, -0.8077947, 1, 1, 1, 1, 1,
0.3374783, -0.9575086, 2.12881, 0, 0, 1, 1, 1,
0.339006, 1.11687, 0.9315596, 1, 0, 0, 1, 1,
0.3428297, -1.161699, 2.471969, 1, 0, 0, 1, 1,
0.3442265, -1.267408, 3.624149, 1, 0, 0, 1, 1,
0.3471745, -0.8090305, 4.461272, 1, 0, 0, 1, 1,
0.3497513, -0.1442046, 2.189536, 1, 0, 0, 1, 1,
0.3521546, 1.210217, -0.3803847, 0, 0, 0, 1, 1,
0.352664, -0.0260135, 1.62385, 0, 0, 0, 1, 1,
0.3540157, -0.5875654, 2.522915, 0, 0, 0, 1, 1,
0.3541764, -0.9846683, 1.673138, 0, 0, 0, 1, 1,
0.3556312, -0.4976633, 1.861786, 0, 0, 0, 1, 1,
0.3582472, -0.3223423, 2.24518, 0, 0, 0, 1, 1,
0.3603847, -0.05089265, 2.274271, 0, 0, 0, 1, 1,
0.3619025, -0.7109565, 3.23056, 1, 1, 1, 1, 1,
0.3620832, 0.04938823, 0.1793175, 1, 1, 1, 1, 1,
0.3630457, -0.2700456, 2.791624, 1, 1, 1, 1, 1,
0.3639767, -0.967212, 4.514122, 1, 1, 1, 1, 1,
0.3643, -0.7230362, 2.016284, 1, 1, 1, 1, 1,
0.3664288, -0.5056229, 2.224603, 1, 1, 1, 1, 1,
0.372737, 0.9534984, 0.8648174, 1, 1, 1, 1, 1,
0.3766432, 0.06421651, 1.780105, 1, 1, 1, 1, 1,
0.3911814, 1.312837, 0.4338391, 1, 1, 1, 1, 1,
0.3913543, 0.6710438, -0.040611, 1, 1, 1, 1, 1,
0.3926106, -0.274981, 4.033549, 1, 1, 1, 1, 1,
0.3950722, 0.8409442, -0.1648342, 1, 1, 1, 1, 1,
0.3957131, -0.06978616, 0.9104071, 1, 1, 1, 1, 1,
0.401244, -0.5744312, 0.1049575, 1, 1, 1, 1, 1,
0.4012885, -1.060458, 2.314959, 1, 1, 1, 1, 1,
0.40275, -1.723765, 2.550926, 0, 0, 1, 1, 1,
0.4050149, 0.5750548, 0.870174, 1, 0, 0, 1, 1,
0.4073277, 0.1004098, 0.5611627, 1, 0, 0, 1, 1,
0.4093563, 0.445487, 0.1928291, 1, 0, 0, 1, 1,
0.4126455, -0.7486664, 3.727445, 1, 0, 0, 1, 1,
0.4157813, 0.3487226, 0.0006812197, 1, 0, 0, 1, 1,
0.4187872, -1.153838, 2.780683, 0, 0, 0, 1, 1,
0.4265916, -1.740283, 3.316094, 0, 0, 0, 1, 1,
0.427889, -1.643913, 4.370517, 0, 0, 0, 1, 1,
0.4291843, -0.020336, 1.734665, 0, 0, 0, 1, 1,
0.4319712, -0.1282957, 0.85137, 0, 0, 0, 1, 1,
0.4386604, 0.303208, -0.8297523, 0, 0, 0, 1, 1,
0.4414019, 0.1735618, -0.4888935, 0, 0, 0, 1, 1,
0.4437048, -1.282758, 1.832103, 1, 1, 1, 1, 1,
0.4441415, 0.3223718, 3.387535, 1, 1, 1, 1, 1,
0.4482054, -0.1915958, 1.590245, 1, 1, 1, 1, 1,
0.4486867, 0.3315656, 0.4969274, 1, 1, 1, 1, 1,
0.4524247, 1.597483, 0.3980603, 1, 1, 1, 1, 1,
0.4547807, -0.7009839, 0.7649047, 1, 1, 1, 1, 1,
0.4562811, -0.5216268, 2.641838, 1, 1, 1, 1, 1,
0.4632574, 1.346473, -0.48253, 1, 1, 1, 1, 1,
0.4691893, -0.2654077, 1.212059, 1, 1, 1, 1, 1,
0.472649, -0.7796304, 2.331233, 1, 1, 1, 1, 1,
0.4747868, -0.6778626, 4.204552, 1, 1, 1, 1, 1,
0.4755009, 0.9326817, 0.3903891, 1, 1, 1, 1, 1,
0.4813347, -1.020707, 1.521754, 1, 1, 1, 1, 1,
0.4829376, -1.589939, 2.604428, 1, 1, 1, 1, 1,
0.4896106, 0.5035181, 1.976863, 1, 1, 1, 1, 1,
0.4937205, 1.122436, 0.4647062, 0, 0, 1, 1, 1,
0.4991784, 0.9809204, 1.804661, 1, 0, 0, 1, 1,
0.4996885, -0.382641, 2.109224, 1, 0, 0, 1, 1,
0.5019163, 0.02027607, 1.647561, 1, 0, 0, 1, 1,
0.5125957, 0.03791875, 1.531638, 1, 0, 0, 1, 1,
0.519419, -0.7992673, 1.271347, 1, 0, 0, 1, 1,
0.5270917, -1.503448, 1.753404, 0, 0, 0, 1, 1,
0.5294845, 0.5494205, 0.1104233, 0, 0, 0, 1, 1,
0.5319712, 0.8045857, 0.06612464, 0, 0, 0, 1, 1,
0.5328405, -0.9921864, 2.915015, 0, 0, 0, 1, 1,
0.5330124, -1.554836, 3.129631, 0, 0, 0, 1, 1,
0.5466374, -0.1553471, 0.6781141, 0, 0, 0, 1, 1,
0.5481611, -0.5797054, 2.198734, 0, 0, 0, 1, 1,
0.5517215, 0.6357979, 1.777048, 1, 1, 1, 1, 1,
0.5530235, 1.827112, 0.8583087, 1, 1, 1, 1, 1,
0.5551319, 0.3228967, 1.908204, 1, 1, 1, 1, 1,
0.5558352, 0.2299879, 2.012247, 1, 1, 1, 1, 1,
0.5571776, 0.3329256, 1.784371, 1, 1, 1, 1, 1,
0.5594312, 1.796566, -1.870979, 1, 1, 1, 1, 1,
0.5640091, 0.3699193, 0.6294574, 1, 1, 1, 1, 1,
0.5648351, -1.349841, 2.709938, 1, 1, 1, 1, 1,
0.5699394, 0.2775804, 0.5322466, 1, 1, 1, 1, 1,
0.5717958, 0.09471359, -0.02302599, 1, 1, 1, 1, 1,
0.5725865, 0.9988876, -0.5226241, 1, 1, 1, 1, 1,
0.5733719, -1.683426, 3.902475, 1, 1, 1, 1, 1,
0.5757433, 0.6138264, 1.143491, 1, 1, 1, 1, 1,
0.5767084, -0.01888641, 1.003526, 1, 1, 1, 1, 1,
0.5818688, 0.5480387, 0.2688548, 1, 1, 1, 1, 1,
0.5822173, 0.6958095, -0.5130274, 0, 0, 1, 1, 1,
0.5853867, 1.734978, -0.7298113, 1, 0, 0, 1, 1,
0.5940704, -1.218714, 2.120849, 1, 0, 0, 1, 1,
0.6011174, -1.356702, 1.926516, 1, 0, 0, 1, 1,
0.6060324, -0.6551811, 0.6125038, 1, 0, 0, 1, 1,
0.606463, 0.06702722, 3.703834, 1, 0, 0, 1, 1,
0.6094404, -0.4494002, 1.528965, 0, 0, 0, 1, 1,
0.6131842, -1.372769, 1.737967, 0, 0, 0, 1, 1,
0.613508, 0.1921766, 3.171134, 0, 0, 0, 1, 1,
0.6137258, -0.8157082, 2.933737, 0, 0, 0, 1, 1,
0.6226647, 0.09727984, 0.2335822, 0, 0, 0, 1, 1,
0.6273201, 0.1369904, 0.8267478, 0, 0, 0, 1, 1,
0.6290982, -0.7307962, 2.090624, 0, 0, 0, 1, 1,
0.6303349, 2.028607, -0.4209496, 1, 1, 1, 1, 1,
0.6380016, -1.078372, 1.900387, 1, 1, 1, 1, 1,
0.6464309, 0.04144201, 1.419836, 1, 1, 1, 1, 1,
0.6561671, 1.038527, 0.09866448, 1, 1, 1, 1, 1,
0.6612808, 0.8738821, 0.1413301, 1, 1, 1, 1, 1,
0.6618281, 1.901501, -1.238778, 1, 1, 1, 1, 1,
0.6627646, 1.062135, 0.5638617, 1, 1, 1, 1, 1,
0.6645938, 1.111106, 1.601054, 1, 1, 1, 1, 1,
0.6695464, 1.009555, -0.7421118, 1, 1, 1, 1, 1,
0.6737652, -1.009376, 3.183229, 1, 1, 1, 1, 1,
0.6757992, 1.116701, -0.8244826, 1, 1, 1, 1, 1,
0.6766697, -0.2738397, 2.275719, 1, 1, 1, 1, 1,
0.6799968, 0.5363634, 0.6200606, 1, 1, 1, 1, 1,
0.6804566, -2.052633, 2.798907, 1, 1, 1, 1, 1,
0.6904041, -0.5544756, 2.062424, 1, 1, 1, 1, 1,
0.6905336, 0.2012742, 0.9112197, 0, 0, 1, 1, 1,
0.6919306, 0.1771229, -0.3332319, 1, 0, 0, 1, 1,
0.6927826, 0.8338329, -0.06971081, 1, 0, 0, 1, 1,
0.6952552, 0.06169309, 0.6989765, 1, 0, 0, 1, 1,
0.7013204, 1.389658, -0.6962968, 1, 0, 0, 1, 1,
0.7033421, -0.5252732, 3.305916, 1, 0, 0, 1, 1,
0.7035942, -0.6299074, 1.46132, 0, 0, 0, 1, 1,
0.7054839, -0.1567478, 2.827857, 0, 0, 0, 1, 1,
0.7075993, -0.593293, 4.536966, 0, 0, 0, 1, 1,
0.708124, 0.5964337, 3.711071, 0, 0, 0, 1, 1,
0.7112876, -8.878126e-05, 2.971308, 0, 0, 0, 1, 1,
0.7120609, -0.5810565, 2.386373, 0, 0, 0, 1, 1,
0.7194667, -1.150239, 1.994578, 0, 0, 0, 1, 1,
0.7201727, -0.8051891, 3.789194, 1, 1, 1, 1, 1,
0.7207123, -0.9031879, 1.194082, 1, 1, 1, 1, 1,
0.7267481, 0.2397534, 1.882982, 1, 1, 1, 1, 1,
0.7315049, 0.6851932, -0.4536223, 1, 1, 1, 1, 1,
0.7363403, -1.544367, 2.784304, 1, 1, 1, 1, 1,
0.7423037, -1.094401, 3.755174, 1, 1, 1, 1, 1,
0.747199, -0.05358954, 1.887221, 1, 1, 1, 1, 1,
0.7500314, 0.2355929, -0.4954401, 1, 1, 1, 1, 1,
0.7506911, 1.428342, 0.9596909, 1, 1, 1, 1, 1,
0.7511483, 0.8913314, -0.1495946, 1, 1, 1, 1, 1,
0.7541878, -0.5753796, 1.524028, 1, 1, 1, 1, 1,
0.7575196, 1.021646, 2.297969, 1, 1, 1, 1, 1,
0.7579877, -1.124098, 2.683182, 1, 1, 1, 1, 1,
0.7608054, 0.4441723, 1.714557, 1, 1, 1, 1, 1,
0.7611379, -0.4560513, 1.734001, 1, 1, 1, 1, 1,
0.761829, 0.2985293, 1.329033, 0, 0, 1, 1, 1,
0.7622722, -0.1818962, 1.74315, 1, 0, 0, 1, 1,
0.76432, 0.2755274, -0.1628429, 1, 0, 0, 1, 1,
0.764668, 1.126416, 1.455022, 1, 0, 0, 1, 1,
0.7742807, -1.56807, 3.373782, 1, 0, 0, 1, 1,
0.7764087, 0.8988789, -0.9302205, 1, 0, 0, 1, 1,
0.7809359, 0.785962, 0.7524642, 0, 0, 0, 1, 1,
0.7861171, -0.02255083, -0.1061125, 0, 0, 0, 1, 1,
0.7862056, 0.2488886, -0.01066332, 0, 0, 0, 1, 1,
0.786408, 1.676849, 2.190302, 0, 0, 0, 1, 1,
0.7884123, 1.624559, 1.906575, 0, 0, 0, 1, 1,
0.794686, 0.827153, 0.2336274, 0, 0, 0, 1, 1,
0.8053282, -2.038695, 2.611822, 0, 0, 0, 1, 1,
0.8056856, -0.2880614, 2.882508, 1, 1, 1, 1, 1,
0.8074399, -0.8684365, 0.9206892, 1, 1, 1, 1, 1,
0.8154908, 1.086814, -0.1314535, 1, 1, 1, 1, 1,
0.8246879, 0.267984, 0.8092014, 1, 1, 1, 1, 1,
0.8334235, -0.8275881, 2.125859, 1, 1, 1, 1, 1,
0.83462, 2.018166, -0.1364785, 1, 1, 1, 1, 1,
0.8404962, 1.588948, 1.368493, 1, 1, 1, 1, 1,
0.841854, -0.4297143, 2.318359, 1, 1, 1, 1, 1,
0.8473495, -0.5219519, 2.4726, 1, 1, 1, 1, 1,
0.8503861, 1.090107, 1.45624, 1, 1, 1, 1, 1,
0.8517354, 0.01818396, 1.50224, 1, 1, 1, 1, 1,
0.8580727, 0.03875201, 1.839027, 1, 1, 1, 1, 1,
0.8683141, 0.3403135, 0.3820816, 1, 1, 1, 1, 1,
0.8719649, -0.6069282, 3.419675, 1, 1, 1, 1, 1,
0.8728451, 0.04038988, 1.717094, 1, 1, 1, 1, 1,
0.8807631, -0.7321613, 1.437769, 0, 0, 1, 1, 1,
0.880952, -1.076121, 3.463189, 1, 0, 0, 1, 1,
0.8828508, -0.3389303, 1.104734, 1, 0, 0, 1, 1,
0.8831648, 1.672691, 0.6391269, 1, 0, 0, 1, 1,
0.8833305, 0.2631977, 0.3517015, 1, 0, 0, 1, 1,
0.8906603, -0.8938357, 1.067095, 1, 0, 0, 1, 1,
0.8913155, -0.299494, 1.034183, 0, 0, 0, 1, 1,
0.8968849, 1.601847, 0.8307211, 0, 0, 0, 1, 1,
0.9001742, 0.4056434, 0.3837152, 0, 0, 0, 1, 1,
0.9026631, 0.1020899, 0.8451416, 0, 0, 0, 1, 1,
0.9031773, 1.010395, -1.067213, 0, 0, 0, 1, 1,
0.9041464, 0.137686, 2.942979, 0, 0, 0, 1, 1,
0.9070106, 0.6967939, 0.6835272, 0, 0, 0, 1, 1,
0.9095665, 0.1610528, 1.53218, 1, 1, 1, 1, 1,
0.9096215, 1.105605, -0.3085219, 1, 1, 1, 1, 1,
0.9169304, -0.6186942, 1.107875, 1, 1, 1, 1, 1,
0.9213772, -1.313632, 1.667673, 1, 1, 1, 1, 1,
0.9272977, 0.3261289, 1.545296, 1, 1, 1, 1, 1,
0.929087, -1.386714, 4.413222, 1, 1, 1, 1, 1,
0.9314032, 1.641068, 0.5994729, 1, 1, 1, 1, 1,
0.9377305, 0.2847538, 0.8387033, 1, 1, 1, 1, 1,
0.9393519, -1.788326, 1.9128, 1, 1, 1, 1, 1,
0.9446284, -0.5517784, 2.654168, 1, 1, 1, 1, 1,
0.9453661, 0.3138008, 0.844569, 1, 1, 1, 1, 1,
0.9453869, 0.2246876, 3.599348, 1, 1, 1, 1, 1,
0.9509974, 0.1611779, 1.462789, 1, 1, 1, 1, 1,
0.9511419, 0.9897218, 0.4056829, 1, 1, 1, 1, 1,
0.9517562, -0.3056882, 2.839097, 1, 1, 1, 1, 1,
0.9532889, 1.058683, 0.6958981, 0, 0, 1, 1, 1,
0.9548583, 0.4573072, 0.7197732, 1, 0, 0, 1, 1,
0.9570259, -0.03683505, 0.2494628, 1, 0, 0, 1, 1,
0.9575109, 1.82947, 0.05191762, 1, 0, 0, 1, 1,
0.9603665, -0.7483734, 3.656896, 1, 0, 0, 1, 1,
0.9701445, 1.012146, 0.4646419, 1, 0, 0, 1, 1,
0.9770512, 0.02919752, 1.405219, 0, 0, 0, 1, 1,
0.9817407, 0.8354092, -0.435243, 0, 0, 0, 1, 1,
0.9849579, 0.8323638, 1.694585, 0, 0, 0, 1, 1,
0.9856016, -0.4583504, 2.805028, 0, 0, 0, 1, 1,
0.9864323, 1.284667, 0.7001588, 0, 0, 0, 1, 1,
0.9864648, 1.295178, -1.176834, 0, 0, 0, 1, 1,
0.987222, 0.4067886, 1.365195, 0, 0, 0, 1, 1,
0.987393, 0.59883, -0.08835629, 1, 1, 1, 1, 1,
0.9884654, 0.5832235, -1.555155, 1, 1, 1, 1, 1,
0.9979821, -1.243124, 3.124562, 1, 1, 1, 1, 1,
1.019223, 0.644402, 1.20483, 1, 1, 1, 1, 1,
1.019857, -1.584852, 1.721147, 1, 1, 1, 1, 1,
1.023308, 1.740737, -0.2769989, 1, 1, 1, 1, 1,
1.023533, -0.4438428, 2.034373, 1, 1, 1, 1, 1,
1.023995, 0.7695122, 3.375335, 1, 1, 1, 1, 1,
1.026092, 0.6353063, 0.4199231, 1, 1, 1, 1, 1,
1.031225, 1.498013, -0.3983114, 1, 1, 1, 1, 1,
1.034039, 0.6327209, 1.762147, 1, 1, 1, 1, 1,
1.039778, -2.314612, 2.5284, 1, 1, 1, 1, 1,
1.055733, 1.646664, 1.184897, 1, 1, 1, 1, 1,
1.056518, -0.4149844, 1.686766, 1, 1, 1, 1, 1,
1.056574, -1.040633, 1.922555, 1, 1, 1, 1, 1,
1.058864, 1.260631, 1.15178, 0, 0, 1, 1, 1,
1.065121, 0.4425623, 1.78123, 1, 0, 0, 1, 1,
1.074814, 0.4593599, 0.8715024, 1, 0, 0, 1, 1,
1.074816, -0.3624547, 2.653195, 1, 0, 0, 1, 1,
1.075701, 0.4550849, 0.8698834, 1, 0, 0, 1, 1,
1.077946, 0.342723, 0.5472195, 1, 0, 0, 1, 1,
1.079603, -2.158969, 1.447017, 0, 0, 0, 1, 1,
1.079928, 2.023246, 0.5835443, 0, 0, 0, 1, 1,
1.080769, -1.790794, 4.34081, 0, 0, 0, 1, 1,
1.086077, 0.9743474, 0.7023163, 0, 0, 0, 1, 1,
1.087348, -0.2629582, 2.41988, 0, 0, 0, 1, 1,
1.093844, 1.556982, 2.017228, 0, 0, 0, 1, 1,
1.099342, -1.169346, 2.257182, 0, 0, 0, 1, 1,
1.099963, -0.6763057, 2.220213, 1, 1, 1, 1, 1,
1.110539, 0.9668402, 0.7637819, 1, 1, 1, 1, 1,
1.112772, 1.516015, 1.708209, 1, 1, 1, 1, 1,
1.113849, -1.41108, 0.7307919, 1, 1, 1, 1, 1,
1.114326, 0.8860475, 1.819733, 1, 1, 1, 1, 1,
1.129405, 1.070044, 1.254338, 1, 1, 1, 1, 1,
1.143453, -0.9505771, 3.477017, 1, 1, 1, 1, 1,
1.150106, 1.551094, 0.9129096, 1, 1, 1, 1, 1,
1.170272, 1.117768, 0.02638973, 1, 1, 1, 1, 1,
1.173482, -0.2456058, -0.8922362, 1, 1, 1, 1, 1,
1.175118, -0.2320214, 1.309797, 1, 1, 1, 1, 1,
1.177051, 0.2337842, 0.2684022, 1, 1, 1, 1, 1,
1.185259, -1.085763, 1.453098, 1, 1, 1, 1, 1,
1.192655, 0.6444607, 1.639618, 1, 1, 1, 1, 1,
1.208769, -0.0864463, 1.372568, 1, 1, 1, 1, 1,
1.214727, -1.178157, 1.986482, 0, 0, 1, 1, 1,
1.224155, 0.08032758, 4.095153, 1, 0, 0, 1, 1,
1.225437, -0.2263676, 1.877743, 1, 0, 0, 1, 1,
1.232145, 1.147314, 0.9915337, 1, 0, 0, 1, 1,
1.232652, -0.9903778, 3.405493, 1, 0, 0, 1, 1,
1.235031, -1.218441, 2.689597, 1, 0, 0, 1, 1,
1.235491, 0.6906305, -0.3048927, 0, 0, 0, 1, 1,
1.237197, 0.5790425, -0.2903809, 0, 0, 0, 1, 1,
1.238294, 0.6081961, 0.8255386, 0, 0, 0, 1, 1,
1.242514, 0.2848962, 1.330669, 0, 0, 0, 1, 1,
1.250267, 1.765576, -0.1900643, 0, 0, 0, 1, 1,
1.265584, 0.3956391, 2.329293, 0, 0, 0, 1, 1,
1.27377, -1.150841, 3.206112, 0, 0, 0, 1, 1,
1.275841, -0.5145619, 3.955539, 1, 1, 1, 1, 1,
1.278147, -0.3425802, 1.512899, 1, 1, 1, 1, 1,
1.283921, 1.576263, 1.493597, 1, 1, 1, 1, 1,
1.285135, -0.447887, 2.078145, 1, 1, 1, 1, 1,
1.285834, 0.1467468, 0.8971692, 1, 1, 1, 1, 1,
1.304904, 0.05030579, 1.367157, 1, 1, 1, 1, 1,
1.321846, 1.899243, 0.8877932, 1, 1, 1, 1, 1,
1.334576, 0.7585158, 1.957666, 1, 1, 1, 1, 1,
1.336302, 0.7018651, 0.733045, 1, 1, 1, 1, 1,
1.353868, -0.03452922, 0.7216802, 1, 1, 1, 1, 1,
1.354447, -0.712723, 1.731079, 1, 1, 1, 1, 1,
1.357039, -0.4177825, 1.863276, 1, 1, 1, 1, 1,
1.363033, -0.01828126, 0.6151289, 1, 1, 1, 1, 1,
1.36359, -0.5411096, 0.3383155, 1, 1, 1, 1, 1,
1.370329, -0.4305776, 1.988612, 1, 1, 1, 1, 1,
1.373116, 1.106446, 2.136845, 0, 0, 1, 1, 1,
1.38651, 1.566615, 0.3012283, 1, 0, 0, 1, 1,
1.388202, -0.6941952, 1.947392, 1, 0, 0, 1, 1,
1.399102, -1.081009, 3.689052, 1, 0, 0, 1, 1,
1.403486, -0.9621966, 4.972666, 1, 0, 0, 1, 1,
1.405752, 1.25811, 2.253363, 1, 0, 0, 1, 1,
1.412151, -0.3821674, 2.080694, 0, 0, 0, 1, 1,
1.418955, 0.07131034, 1.031006, 0, 0, 0, 1, 1,
1.421394, 1.176565, 1.004736, 0, 0, 0, 1, 1,
1.427541, -0.1145967, 2.746337, 0, 0, 0, 1, 1,
1.448386, 0.0217841, 1.810864, 0, 0, 0, 1, 1,
1.459422, -0.9406648, 1.114918, 0, 0, 0, 1, 1,
1.468256, -0.3433136, 2.134942, 0, 0, 0, 1, 1,
1.474441, 1.384115, 1.015325, 1, 1, 1, 1, 1,
1.480145, 0.08430532, 1.981345, 1, 1, 1, 1, 1,
1.480645, -0.1724066, 1.596779, 1, 1, 1, 1, 1,
1.481207, -1.360803, 1.953483, 1, 1, 1, 1, 1,
1.481474, -0.3046239, 1.609159, 1, 1, 1, 1, 1,
1.481819, 1.553111, -0.1539327, 1, 1, 1, 1, 1,
1.485155, 0.7643601, 2.026941, 1, 1, 1, 1, 1,
1.513502, 0.9104984, 0.3796925, 1, 1, 1, 1, 1,
1.518145, 1.107603, -0.3832062, 1, 1, 1, 1, 1,
1.525451, -2.402504, 3.608115, 1, 1, 1, 1, 1,
1.527067, -0.5117946, 0.3183763, 1, 1, 1, 1, 1,
1.528562, 1.161896, 1.23045, 1, 1, 1, 1, 1,
1.532753, -0.3857964, 1.319649, 1, 1, 1, 1, 1,
1.550165, 1.970505, -0.518627, 1, 1, 1, 1, 1,
1.559441, 0.03756374, 3.273539, 1, 1, 1, 1, 1,
1.578628, -1.272283, 2.649555, 0, 0, 1, 1, 1,
1.583975, 0.6341084, 1.340808, 1, 0, 0, 1, 1,
1.591179, -0.01436325, 2.562729, 1, 0, 0, 1, 1,
1.600304, -0.3130464, 1.554566, 1, 0, 0, 1, 1,
1.616911, -1.475585, 1.413196, 1, 0, 0, 1, 1,
1.629363, 0.1611876, 1.525064, 1, 0, 0, 1, 1,
1.640898, -1.731495, 3.312115, 0, 0, 0, 1, 1,
1.643351, 0.1560554, 2.429694, 0, 0, 0, 1, 1,
1.647798, 2.135908, 0.3958277, 0, 0, 0, 1, 1,
1.65285, 0.6580303, 0.0945659, 0, 0, 0, 1, 1,
1.663713, 0.10277, 1.505856, 0, 0, 0, 1, 1,
1.664168, -0.7793801, 1.745206, 0, 0, 0, 1, 1,
1.669241, -0.1388299, 1.153923, 0, 0, 0, 1, 1,
1.681167, -0.7981481, 1.981772, 1, 1, 1, 1, 1,
1.684854, -1.135062, 2.499789, 1, 1, 1, 1, 1,
1.702458, 0.212427, 0.8344725, 1, 1, 1, 1, 1,
1.708851, 0.7792822, 0.3788444, 1, 1, 1, 1, 1,
1.74628, -0.2076849, 0.2277142, 1, 1, 1, 1, 1,
1.747115, -0.2976642, 4.160293, 1, 1, 1, 1, 1,
1.765572, 0.8138082, 0.9000034, 1, 1, 1, 1, 1,
1.768387, 2.154547, 2.731704, 1, 1, 1, 1, 1,
1.792076, 0.7661783, 0.2056356, 1, 1, 1, 1, 1,
1.807887, -0.1758055, 2.046006, 1, 1, 1, 1, 1,
1.808304, -0.5731696, 0.2992098, 1, 1, 1, 1, 1,
1.833265, -0.3737833, 3.59005, 1, 1, 1, 1, 1,
1.851906, -0.3883288, 0.1280329, 1, 1, 1, 1, 1,
1.861784, -0.8456267, 1.795219, 1, 1, 1, 1, 1,
1.888805, 0.508888, 1.775328, 1, 1, 1, 1, 1,
1.901521, 1.370508, 1.534001, 0, 0, 1, 1, 1,
1.903646, -0.9094911, 1.594037, 1, 0, 0, 1, 1,
1.905309, 0.02155536, 1.098676, 1, 0, 0, 1, 1,
1.912609, -2.317898, 2.747497, 1, 0, 0, 1, 1,
1.953104, -0.4539301, 3.402772, 1, 0, 0, 1, 1,
2.045686, -0.6133562, 2.247097, 1, 0, 0, 1, 1,
2.049311, -0.9993626, 1.883361, 0, 0, 0, 1, 1,
2.063074, -0.6302222, 2.471189, 0, 0, 0, 1, 1,
2.066459, 1.07621, 1.416642, 0, 0, 0, 1, 1,
2.072379, -0.43614, 0.7440763, 0, 0, 0, 1, 1,
2.099697, -0.4328043, 2.43971, 0, 0, 0, 1, 1,
2.103464, -1.027673, 1.854339, 0, 0, 0, 1, 1,
2.236711, -0.4105287, 2.162706, 0, 0, 0, 1, 1,
2.241146, -1.093896, 4.577764, 1, 1, 1, 1, 1,
2.310677, 1.539045, 2.022093, 1, 1, 1, 1, 1,
2.359166, 1.297046, -0.06966119, 1, 1, 1, 1, 1,
2.373396, 0.7303364, 1.873872, 1, 1, 1, 1, 1,
2.374911, -0.6912597, 2.097242, 1, 1, 1, 1, 1,
2.533721, 0.3923676, 2.066127, 1, 1, 1, 1, 1,
3.438803, -0.6357323, 0.8135529, 1, 1, 1, 1, 1
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
var radius = 10.03676;
var distance = 35.25371;
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
mvMatrix.translate( 0.08281398, -0.2465482, 0.1211421 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.25371);
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
