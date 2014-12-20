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
-3.040798, 1.960179, -0.5137113, 1, 0, 0, 1,
-2.78728, 1.047359, -2.207526, 1, 0.007843138, 0, 1,
-2.614473, -0.3893211, -2.231064, 1, 0.01176471, 0, 1,
-2.58608, -1.471691, -2.063429, 1, 0.01960784, 0, 1,
-2.527661, 0.5063749, -1.012488, 1, 0.02352941, 0, 1,
-2.512542, -0.03751708, -1.708767, 1, 0.03137255, 0, 1,
-2.459146, -0.6140658, -2.020162, 1, 0.03529412, 0, 1,
-2.424773, 0.4535109, -4.718097, 1, 0.04313726, 0, 1,
-2.39825, -0.6532458, -1.477705, 1, 0.04705882, 0, 1,
-2.396449, -0.845251, -0.75269, 1, 0.05490196, 0, 1,
-2.390271, -0.3010479, -2.673166, 1, 0.05882353, 0, 1,
-2.356925, -1.856105, -1.516234, 1, 0.06666667, 0, 1,
-2.311373, -0.1351568, -1.402717, 1, 0.07058824, 0, 1,
-2.263655, -0.5960578, -1.297846, 1, 0.07843138, 0, 1,
-2.250138, -1.29599, -1.327706, 1, 0.08235294, 0, 1,
-2.249825, -0.9896116, -1.414525, 1, 0.09019608, 0, 1,
-2.128539, 1.086913, -1.162592, 1, 0.09411765, 0, 1,
-2.120988, 1.082696, -2.483786, 1, 0.1019608, 0, 1,
-2.041798, -1.28118, -1.902214, 1, 0.1098039, 0, 1,
-2.009855, -1.307492, -3.705385, 1, 0.1137255, 0, 1,
-2.005188, -1.075932, -2.138175, 1, 0.1215686, 0, 1,
-1.950426, 0.1603656, 0.4003619, 1, 0.1254902, 0, 1,
-1.933207, -2.256423, -3.256108, 1, 0.1333333, 0, 1,
-1.914668, 0.5570729, -0.3555708, 1, 0.1372549, 0, 1,
-1.882632, -0.9357294, -3.252882, 1, 0.145098, 0, 1,
-1.868424, 1.629454, -0.9649669, 1, 0.1490196, 0, 1,
-1.859472, 0.4659204, -1.296562, 1, 0.1568628, 0, 1,
-1.850906, 0.2573174, -1.992662, 1, 0.1607843, 0, 1,
-1.842233, 0.5743505, -0.2052508, 1, 0.1686275, 0, 1,
-1.837272, -0.4267345, -2.805083, 1, 0.172549, 0, 1,
-1.791282, -2.13135, -2.192428, 1, 0.1803922, 0, 1,
-1.790908, -2.040818, -2.399746, 1, 0.1843137, 0, 1,
-1.776471, 1.431648, -1.528418, 1, 0.1921569, 0, 1,
-1.767966, -1.093558, -1.398546, 1, 0.1960784, 0, 1,
-1.755776, -0.04698255, -3.373717, 1, 0.2039216, 0, 1,
-1.754698, -0.02577136, -0.7588013, 1, 0.2117647, 0, 1,
-1.751457, -0.467627, -2.165695, 1, 0.2156863, 0, 1,
-1.737394, -0.520447, -3.530663, 1, 0.2235294, 0, 1,
-1.718299, 0.1736199, -2.008031, 1, 0.227451, 0, 1,
-1.702923, 0.2973422, -1.685594, 1, 0.2352941, 0, 1,
-1.683343, 1.335874, 2.418548, 1, 0.2392157, 0, 1,
-1.669068, 0.5516099, -1.215696, 1, 0.2470588, 0, 1,
-1.64321, 0.2765471, -0.4807356, 1, 0.2509804, 0, 1,
-1.638037, -1.981009, -2.116917, 1, 0.2588235, 0, 1,
-1.633755, 0.8339885, -0.2791325, 1, 0.2627451, 0, 1,
-1.629744, -0.0210415, -1.850022, 1, 0.2705882, 0, 1,
-1.624088, 0.2299219, -0.05703409, 1, 0.2745098, 0, 1,
-1.620862, -1.123057, -1.957618, 1, 0.282353, 0, 1,
-1.617481, -0.7248534, -1.597437, 1, 0.2862745, 0, 1,
-1.61125, -1.268385, -3.168172, 1, 0.2941177, 0, 1,
-1.606128, 0.6929573, -1.039396, 1, 0.3019608, 0, 1,
-1.604457, -0.5965715, -2.177991, 1, 0.3058824, 0, 1,
-1.596215, 0.5050735, -1.583202, 1, 0.3137255, 0, 1,
-1.585469, -2.075386, -2.350274, 1, 0.3176471, 0, 1,
-1.54993, 0.2313021, -2.887413, 1, 0.3254902, 0, 1,
-1.544924, -1.500828, -4.209399, 1, 0.3294118, 0, 1,
-1.523794, 0.1743932, -1.130443, 1, 0.3372549, 0, 1,
-1.521586, 0.8946124, -0.6458545, 1, 0.3411765, 0, 1,
-1.513473, -0.4177907, -1.099793, 1, 0.3490196, 0, 1,
-1.499564, -0.8186813, -1.212076, 1, 0.3529412, 0, 1,
-1.493299, -0.6735421, -3.068789, 1, 0.3607843, 0, 1,
-1.488128, 0.1003094, -2.16247, 1, 0.3647059, 0, 1,
-1.476988, -0.8655009, -3.920677, 1, 0.372549, 0, 1,
-1.456225, 0.6034573, -0.990096, 1, 0.3764706, 0, 1,
-1.455659, 0.1131282, -0.9606584, 1, 0.3843137, 0, 1,
-1.45177, -0.1613742, -0.9441792, 1, 0.3882353, 0, 1,
-1.431556, -0.1738899, -3.835459, 1, 0.3960784, 0, 1,
-1.426116, -0.5160611, -2.162889, 1, 0.4039216, 0, 1,
-1.424946, 0.8956611, -2.982089, 1, 0.4078431, 0, 1,
-1.420123, 0.4480751, -1.599701, 1, 0.4156863, 0, 1,
-1.419773, 0.04049249, -3.33158, 1, 0.4196078, 0, 1,
-1.413395, 0.01966075, -1.112219, 1, 0.427451, 0, 1,
-1.39731, 1.066496, -0.2091806, 1, 0.4313726, 0, 1,
-1.393973, -0.5566513, -2.974296, 1, 0.4392157, 0, 1,
-1.392043, -0.3702857, -4.177665, 1, 0.4431373, 0, 1,
-1.388335, 0.2984436, -1.494434, 1, 0.4509804, 0, 1,
-1.382538, -0.04221658, -2.574324, 1, 0.454902, 0, 1,
-1.367848, -1.368555, -3.047783, 1, 0.4627451, 0, 1,
-1.362232, 0.2468442, -1.376797, 1, 0.4666667, 0, 1,
-1.361783, -0.2616336, -0.8529657, 1, 0.4745098, 0, 1,
-1.358599, -0.1141959, -1.523563, 1, 0.4784314, 0, 1,
-1.349673, 0.7918203, -0.1434297, 1, 0.4862745, 0, 1,
-1.344017, 1.501022, -0.5777352, 1, 0.4901961, 0, 1,
-1.312493, 0.3864549, -2.506564, 1, 0.4980392, 0, 1,
-1.307978, -0.2977295, -1.488737, 1, 0.5058824, 0, 1,
-1.305476, 0.7055026, 0.1969489, 1, 0.509804, 0, 1,
-1.304291, -0.8154982, -2.786247, 1, 0.5176471, 0, 1,
-1.298262, -1.796346, -1.087651, 1, 0.5215687, 0, 1,
-1.274074, -0.6431368, -0.7402454, 1, 0.5294118, 0, 1,
-1.262453, 0.3450946, -0.3131381, 1, 0.5333334, 0, 1,
-1.261799, 0.2991405, -0.2947115, 1, 0.5411765, 0, 1,
-1.244168, 0.5698181, -1.956893, 1, 0.5450981, 0, 1,
-1.228058, -0.5467522, -3.124332, 1, 0.5529412, 0, 1,
-1.217074, -1.525203, -0.7561338, 1, 0.5568628, 0, 1,
-1.198823, 2.012086, -1.984194, 1, 0.5647059, 0, 1,
-1.198796, 0.1110729, -1.664204, 1, 0.5686275, 0, 1,
-1.198436, -0.5191063, -2.756101, 1, 0.5764706, 0, 1,
-1.196168, 0.2901096, 0.7804241, 1, 0.5803922, 0, 1,
-1.19084, 0.954919, -0.5362003, 1, 0.5882353, 0, 1,
-1.183176, 0.4475516, -1.438298, 1, 0.5921569, 0, 1,
-1.169879, -1.392932, -0.9703868, 1, 0.6, 0, 1,
-1.162881, 0.2776917, -1.714367, 1, 0.6078432, 0, 1,
-1.157204, -0.3837125, -1.467238, 1, 0.6117647, 0, 1,
-1.150831, -0.4347116, -0.03698038, 1, 0.6196079, 0, 1,
-1.143929, -0.2888515, -1.932558, 1, 0.6235294, 0, 1,
-1.136427, -0.2813341, -1.436929, 1, 0.6313726, 0, 1,
-1.131698, 1.231233, 0.5811918, 1, 0.6352941, 0, 1,
-1.128963, -1.745814, -1.814912, 1, 0.6431373, 0, 1,
-1.128218, -1.469284, -0.7552957, 1, 0.6470588, 0, 1,
-1.12781, 0.2939948, -1.592139, 1, 0.654902, 0, 1,
-1.119785, 0.3718143, 0.8154899, 1, 0.6588235, 0, 1,
-1.119453, -0.3085329, -1.22382, 1, 0.6666667, 0, 1,
-1.115389, 0.883543, -1.379745, 1, 0.6705883, 0, 1,
-1.109508, -1.847322, -3.229194, 1, 0.6784314, 0, 1,
-1.107402, 0.6487764, -1.38054, 1, 0.682353, 0, 1,
-1.102325, 0.6340998, 1.743931, 1, 0.6901961, 0, 1,
-1.093954, 0.03422229, -0.3273937, 1, 0.6941177, 0, 1,
-1.093794, 0.815254, -0.7977396, 1, 0.7019608, 0, 1,
-1.092626, 1.284033, -0.9833723, 1, 0.7098039, 0, 1,
-1.089849, 1.512443, -2.561275, 1, 0.7137255, 0, 1,
-1.079413, -1.855123, -2.811857, 1, 0.7215686, 0, 1,
-1.078359, -1.560208, -2.139874, 1, 0.7254902, 0, 1,
-1.075247, 0.09243351, -2.863247, 1, 0.7333333, 0, 1,
-1.074164, -1.5945, -2.904735, 1, 0.7372549, 0, 1,
-1.072727, -0.1014782, -3.580138, 1, 0.7450981, 0, 1,
-1.061106, 1.05074, 0.3013117, 1, 0.7490196, 0, 1,
-1.059803, 1.081543, -1.663315, 1, 0.7568628, 0, 1,
-1.0434, -0.2082676, -2.277841, 1, 0.7607843, 0, 1,
-1.037444, 0.6398694, -1.09393, 1, 0.7686275, 0, 1,
-1.034115, -0.1379256, -0.2944606, 1, 0.772549, 0, 1,
-1.021754, -0.8792977, -4.759078, 1, 0.7803922, 0, 1,
-1.019484, -0.4143141, -0.7449057, 1, 0.7843137, 0, 1,
-1.019295, -2.011358, -3.055922, 1, 0.7921569, 0, 1,
-1.007686, 0.4583831, -2.804592, 1, 0.7960784, 0, 1,
-0.9986231, -1.058754, -2.258652, 1, 0.8039216, 0, 1,
-0.9978537, -0.4031686, -2.582313, 1, 0.8117647, 0, 1,
-0.997409, 0.4174602, -2.124899, 1, 0.8156863, 0, 1,
-0.9973789, -0.04604023, -2.040254, 1, 0.8235294, 0, 1,
-0.9956469, -1.235692, -1.948158, 1, 0.827451, 0, 1,
-0.9933914, -0.3517303, -3.229722, 1, 0.8352941, 0, 1,
-0.992189, 0.5681615, -0.5437365, 1, 0.8392157, 0, 1,
-0.9846646, 0.8739396, -1.060409, 1, 0.8470588, 0, 1,
-0.9799861, 1.67503, 0.2775502, 1, 0.8509804, 0, 1,
-0.977213, -0.1889765, -2.206172, 1, 0.8588235, 0, 1,
-0.9769499, 0.5205702, 0.3533534, 1, 0.8627451, 0, 1,
-0.9736026, 1.098737, -0.6409875, 1, 0.8705882, 0, 1,
-0.9729761, 0.219231, -3.487662, 1, 0.8745098, 0, 1,
-0.9700924, -0.1183174, -1.40605, 1, 0.8823529, 0, 1,
-0.9654428, 0.7484732, -1.261573, 1, 0.8862745, 0, 1,
-0.9640878, 1.6186, 0.1319662, 1, 0.8941177, 0, 1,
-0.9560877, -1.814192, -1.254647, 1, 0.8980392, 0, 1,
-0.9438807, -1.05125, -3.797007, 1, 0.9058824, 0, 1,
-0.9352891, -1.049595, -2.938363, 1, 0.9137255, 0, 1,
-0.9200828, 1.183541, -1.646103, 1, 0.9176471, 0, 1,
-0.9186615, 1.653008, -0.7917349, 1, 0.9254902, 0, 1,
-0.9165523, 0.3422869, -0.8605444, 1, 0.9294118, 0, 1,
-0.916173, -0.5017787, -1.070299, 1, 0.9372549, 0, 1,
-0.914651, 0.6908579, -1.781569, 1, 0.9411765, 0, 1,
-0.910129, -0.4244264, -4.359932, 1, 0.9490196, 0, 1,
-0.9021087, 0.03276074, 0.6592223, 1, 0.9529412, 0, 1,
-0.9013358, -0.5427561, -2.073209, 1, 0.9607843, 0, 1,
-0.9000747, -0.4591865, -0.2764852, 1, 0.9647059, 0, 1,
-0.8964137, -0.3971124, -2.423996, 1, 0.972549, 0, 1,
-0.8815148, -0.8940102, -1.337299, 1, 0.9764706, 0, 1,
-0.8805685, 0.09455319, -2.990065, 1, 0.9843137, 0, 1,
-0.8785446, 0.4205226, -1.231703, 1, 0.9882353, 0, 1,
-0.878535, -0.9179773, -2.928208, 1, 0.9960784, 0, 1,
-0.8785248, 1.687063, -1.189744, 0.9960784, 1, 0, 1,
-0.8769217, -0.282008, -0.03874818, 0.9921569, 1, 0, 1,
-0.8730771, 0.8479413, -1.24866, 0.9843137, 1, 0, 1,
-0.8693618, -0.9384162, -2.448986, 0.9803922, 1, 0, 1,
-0.8577554, 0.1639517, -0.05254639, 0.972549, 1, 0, 1,
-0.8576115, -0.8319546, -2.238581, 0.9686275, 1, 0, 1,
-0.857424, 0.05323528, -0.01277897, 0.9607843, 1, 0, 1,
-0.8532206, 0.296457, -0.5822242, 0.9568627, 1, 0, 1,
-0.848398, -1.485988, -3.108717, 0.9490196, 1, 0, 1,
-0.8383355, -1.282615, -2.44888, 0.945098, 1, 0, 1,
-0.8383001, 1.038846, -1.101036, 0.9372549, 1, 0, 1,
-0.8358657, -0.353949, -1.648231, 0.9333333, 1, 0, 1,
-0.8345244, 0.704141, -1.068571, 0.9254902, 1, 0, 1,
-0.8330009, 0.2166674, -1.589005, 0.9215686, 1, 0, 1,
-0.8309993, 0.7537005, 1.060757, 0.9137255, 1, 0, 1,
-0.8249186, -0.642993, -1.239767, 0.9098039, 1, 0, 1,
-0.8227407, -0.5073101, -3.10123, 0.9019608, 1, 0, 1,
-0.8218976, 1.978185, -0.1896521, 0.8941177, 1, 0, 1,
-0.8181482, 0.4604522, -0.05011903, 0.8901961, 1, 0, 1,
-0.8167443, 1.112727, -0.7549492, 0.8823529, 1, 0, 1,
-0.8161651, 0.8649979, 0.3047664, 0.8784314, 1, 0, 1,
-0.8121865, 1.293955, -1.416408, 0.8705882, 1, 0, 1,
-0.8110594, 0.1214081, -1.159691, 0.8666667, 1, 0, 1,
-0.809504, 0.3140486, -0.9597619, 0.8588235, 1, 0, 1,
-0.807462, -0.9895741, -2.495035, 0.854902, 1, 0, 1,
-0.794411, 0.9489226, -0.5833433, 0.8470588, 1, 0, 1,
-0.7933094, 1.312287, 0.2142574, 0.8431373, 1, 0, 1,
-0.7903528, 0.2491703, -2.703739, 0.8352941, 1, 0, 1,
-0.7901507, -1.085833, -1.720086, 0.8313726, 1, 0, 1,
-0.785451, 0.6190999, -0.6006156, 0.8235294, 1, 0, 1,
-0.7826488, -1.018221, -3.460494, 0.8196079, 1, 0, 1,
-0.7795759, -1.195389, -1.587214, 0.8117647, 1, 0, 1,
-0.7773776, -0.6425627, -1.926141, 0.8078431, 1, 0, 1,
-0.7757962, 0.02049424, -1.609962, 0.8, 1, 0, 1,
-0.7755641, 1.183586, -0.9685871, 0.7921569, 1, 0, 1,
-0.7617071, -2.264493, -4.580633, 0.7882353, 1, 0, 1,
-0.7577956, -0.4624252, -1.342819, 0.7803922, 1, 0, 1,
-0.7574372, -0.9649611, -1.374624, 0.7764706, 1, 0, 1,
-0.749393, -0.4397331, -1.751109, 0.7686275, 1, 0, 1,
-0.7456034, 0.1961562, -2.224605, 0.7647059, 1, 0, 1,
-0.7450833, -1.075225, -1.053012, 0.7568628, 1, 0, 1,
-0.7392895, -1.264642, -2.682419, 0.7529412, 1, 0, 1,
-0.7289414, 0.4141075, -1.919934, 0.7450981, 1, 0, 1,
-0.7281409, -0.6836561, -2.109305, 0.7411765, 1, 0, 1,
-0.7204138, -0.9542437, -1.470972, 0.7333333, 1, 0, 1,
-0.7170442, -0.2141179, -2.586257, 0.7294118, 1, 0, 1,
-0.715582, -0.01602159, -2.13913, 0.7215686, 1, 0, 1,
-0.7110748, 0.1225549, -2.674087, 0.7176471, 1, 0, 1,
-0.707902, 0.4927602, 0.1027677, 0.7098039, 1, 0, 1,
-0.7044286, -1.679171, -3.225599, 0.7058824, 1, 0, 1,
-0.6977172, -1.057501, -2.23209, 0.6980392, 1, 0, 1,
-0.6955894, -0.7977313, -1.458043, 0.6901961, 1, 0, 1,
-0.6921148, 1.129924, 0.4363975, 0.6862745, 1, 0, 1,
-0.6827278, -0.3163844, -2.034574, 0.6784314, 1, 0, 1,
-0.6730214, 1.318594, -0.130658, 0.6745098, 1, 0, 1,
-0.6714939, -1.806229, -4.027239, 0.6666667, 1, 0, 1,
-0.6703267, 0.3154614, -0.1850822, 0.6627451, 1, 0, 1,
-0.6688016, 0.2008968, -0.9496769, 0.654902, 1, 0, 1,
-0.6674393, 0.9809676, -0.3843343, 0.6509804, 1, 0, 1,
-0.6667851, -2.01121, -3.198745, 0.6431373, 1, 0, 1,
-0.6656712, 0.1117249, -1.494616, 0.6392157, 1, 0, 1,
-0.6631283, -1.752673, -2.717136, 0.6313726, 1, 0, 1,
-0.6628827, -1.834663, -2.207847, 0.627451, 1, 0, 1,
-0.6521574, 0.8740051, 0.02575196, 0.6196079, 1, 0, 1,
-0.6505834, -0.007829206, -1.636275, 0.6156863, 1, 0, 1,
-0.6497736, -0.1792406, -3.048966, 0.6078432, 1, 0, 1,
-0.6444224, -3.118376, -3.444601, 0.6039216, 1, 0, 1,
-0.6422656, 0.6433606, -0.3527431, 0.5960785, 1, 0, 1,
-0.6411433, -0.1030315, -1.511488, 0.5882353, 1, 0, 1,
-0.6404777, -0.7920784, -3.601584, 0.5843138, 1, 0, 1,
-0.6404496, 1.289365, 0.496211, 0.5764706, 1, 0, 1,
-0.6391931, -2.797363, -2.875731, 0.572549, 1, 0, 1,
-0.6373908, -0.8961357, -1.221241, 0.5647059, 1, 0, 1,
-0.6365349, -0.0305383, -2.399367, 0.5607843, 1, 0, 1,
-0.632544, 0.9699206, -0.2332807, 0.5529412, 1, 0, 1,
-0.6305733, 0.277894, -0.3639233, 0.5490196, 1, 0, 1,
-0.6298857, -0.4807047, -0.4144039, 0.5411765, 1, 0, 1,
-0.6249155, -1.506765, -2.333012, 0.5372549, 1, 0, 1,
-0.6192346, 0.0008758102, -2.3307, 0.5294118, 1, 0, 1,
-0.6154681, 1.375772, 0.3014419, 0.5254902, 1, 0, 1,
-0.6150896, 0.004563297, -0.3319653, 0.5176471, 1, 0, 1,
-0.6132001, 1.219488, -2.35128, 0.5137255, 1, 0, 1,
-0.6110818, -1.320696, -2.37489, 0.5058824, 1, 0, 1,
-0.6092222, -0.6936939, -2.75419, 0.5019608, 1, 0, 1,
-0.6062152, 0.5962885, -2.773541, 0.4941176, 1, 0, 1,
-0.6012282, -0.4584143, -2.382568, 0.4862745, 1, 0, 1,
-0.5974041, 0.6129183, -1.935563, 0.4823529, 1, 0, 1,
-0.5944142, 0.3866931, 1.361461, 0.4745098, 1, 0, 1,
-0.5854509, -0.4462391, -0.9705538, 0.4705882, 1, 0, 1,
-0.5848656, 0.03379127, -1.542246, 0.4627451, 1, 0, 1,
-0.5815655, -0.2572221, -1.678684, 0.4588235, 1, 0, 1,
-0.5799286, -0.6783946, -2.528867, 0.4509804, 1, 0, 1,
-0.5654132, 1.127913, -1.608889, 0.4470588, 1, 0, 1,
-0.5651536, 0.1408532, -0.3128073, 0.4392157, 1, 0, 1,
-0.5614841, -1.754662, -2.792737, 0.4352941, 1, 0, 1,
-0.5609683, 0.1673037, -0.7432696, 0.427451, 1, 0, 1,
-0.5607977, 0.8972057, -0.2022224, 0.4235294, 1, 0, 1,
-0.558248, 0.822939, -0.669831, 0.4156863, 1, 0, 1,
-0.5573053, -0.9933806, -0.5862507, 0.4117647, 1, 0, 1,
-0.5507789, 0.5602835, -0.8864526, 0.4039216, 1, 0, 1,
-0.5502664, -0.2347631, -1.819301, 0.3960784, 1, 0, 1,
-0.542845, 0.5517453, -0.2946361, 0.3921569, 1, 0, 1,
-0.5421245, -0.8547809, -1.788581, 0.3843137, 1, 0, 1,
-0.5392252, -2.752849, -5.172135, 0.3803922, 1, 0, 1,
-0.5327379, 0.1610715, -1.828196, 0.372549, 1, 0, 1,
-0.5295941, 0.5709636, -1.286308, 0.3686275, 1, 0, 1,
-0.5270136, -0.2585912, -1.063147, 0.3607843, 1, 0, 1,
-0.5169076, 1.143647, 0.5855321, 0.3568628, 1, 0, 1,
-0.515426, 0.9165893, -1.237605, 0.3490196, 1, 0, 1,
-0.5133185, 0.5783303, 0.08048052, 0.345098, 1, 0, 1,
-0.5111552, -0.5915443, -0.9715063, 0.3372549, 1, 0, 1,
-0.5105878, 1.136015, -0.4317305, 0.3333333, 1, 0, 1,
-0.5060855, 0.6360169, 0.042312, 0.3254902, 1, 0, 1,
-0.5042264, 0.3360141, 0.5622089, 0.3215686, 1, 0, 1,
-0.5021591, 1.005843, 1.073798, 0.3137255, 1, 0, 1,
-0.5021117, -1.594585, -3.840969, 0.3098039, 1, 0, 1,
-0.5011765, 0.869015, -0.5084428, 0.3019608, 1, 0, 1,
-0.4979509, 0.1797947, -0.2707959, 0.2941177, 1, 0, 1,
-0.4778403, -1.017121, -1.477119, 0.2901961, 1, 0, 1,
-0.4773873, 0.1370884, -1.124537, 0.282353, 1, 0, 1,
-0.4685552, -0.6302042, -2.451821, 0.2784314, 1, 0, 1,
-0.4655957, 0.274123, -1.43678, 0.2705882, 1, 0, 1,
-0.4652014, -0.7081246, -0.9250719, 0.2666667, 1, 0, 1,
-0.4637068, 0.6190448, -0.2196075, 0.2588235, 1, 0, 1,
-0.4606321, -0.159386, -1.512429, 0.254902, 1, 0, 1,
-0.4583181, 0.9996714, -1.074201, 0.2470588, 1, 0, 1,
-0.4570976, -0.4879226, -2.361674, 0.2431373, 1, 0, 1,
-0.4569565, 0.4010594, -0.8165143, 0.2352941, 1, 0, 1,
-0.4567109, -1.757729, -1.726828, 0.2313726, 1, 0, 1,
-0.4493343, -0.04762396, -0.1609969, 0.2235294, 1, 0, 1,
-0.4492321, 0.3329218, -1.941236, 0.2196078, 1, 0, 1,
-0.4419794, -0.005161069, -1.192798, 0.2117647, 1, 0, 1,
-0.4398449, -0.5304442, -1.884136, 0.2078431, 1, 0, 1,
-0.4376259, -0.6385674, -3.637433, 0.2, 1, 0, 1,
-0.435062, 0.644601, -0.3838397, 0.1921569, 1, 0, 1,
-0.4318593, 1.636886, 0.3396723, 0.1882353, 1, 0, 1,
-0.4307611, 0.3032052, -0.8663511, 0.1803922, 1, 0, 1,
-0.420196, -1.335311, -2.178711, 0.1764706, 1, 0, 1,
-0.4196806, 0.7469053, -1.318069, 0.1686275, 1, 0, 1,
-0.4108376, -0.6647743, -2.598762, 0.1647059, 1, 0, 1,
-0.4083047, 1.13745, 0.5427763, 0.1568628, 1, 0, 1,
-0.4056979, 0.4554991, -0.6663176, 0.1529412, 1, 0, 1,
-0.4051827, -0.8176906, -2.800991, 0.145098, 1, 0, 1,
-0.4022428, 0.7043478, -1.366676, 0.1411765, 1, 0, 1,
-0.4015726, -1.202538, -1.463469, 0.1333333, 1, 0, 1,
-0.4011721, 0.01949594, 0.04063225, 0.1294118, 1, 0, 1,
-0.3993997, 0.4264924, -2.002376, 0.1215686, 1, 0, 1,
-0.3985251, -0.1986389, -2.336837, 0.1176471, 1, 0, 1,
-0.3972159, 0.2187574, 0.05250082, 0.1098039, 1, 0, 1,
-0.3966329, 1.14898, -0.4802892, 0.1058824, 1, 0, 1,
-0.3909684, 0.7709304, -2.304781, 0.09803922, 1, 0, 1,
-0.3865897, -1.863819, -2.955742, 0.09019608, 1, 0, 1,
-0.3771394, 1.004483, -0.1833147, 0.08627451, 1, 0, 1,
-0.3749134, -1.453218, -4.404128, 0.07843138, 1, 0, 1,
-0.3718379, -1.723689, -2.168317, 0.07450981, 1, 0, 1,
-0.3711929, -0.2048729, -1.044547, 0.06666667, 1, 0, 1,
-0.3707172, -1.125438, -3.761221, 0.0627451, 1, 0, 1,
-0.3706629, 1.208078, 2.118042, 0.05490196, 1, 0, 1,
-0.3638242, 0.6998144, -0.5141255, 0.05098039, 1, 0, 1,
-0.3624035, -0.01425668, -2.545144, 0.04313726, 1, 0, 1,
-0.3608961, 1.596718, -0.1610752, 0.03921569, 1, 0, 1,
-0.3526033, 1.822429, -1.913162, 0.03137255, 1, 0, 1,
-0.351294, -0.653109, -2.373285, 0.02745098, 1, 0, 1,
-0.3509686, -0.06771524, -2.190143, 0.01960784, 1, 0, 1,
-0.3509292, 2.234838, -0.1267646, 0.01568628, 1, 0, 1,
-0.3495078, 0.9874044, -1.473225, 0.007843138, 1, 0, 1,
-0.3487855, -0.823732, -2.532613, 0.003921569, 1, 0, 1,
-0.3464905, -0.381301, -4.143789, 0, 1, 0.003921569, 1,
-0.3434477, 0.4112488, 0.007995888, 0, 1, 0.01176471, 1,
-0.3411233, -1.00685, -4.916791, 0, 1, 0.01568628, 1,
-0.3396882, -1.010616, -2.06906, 0, 1, 0.02352941, 1,
-0.3343048, -0.4391921, -1.39685, 0, 1, 0.02745098, 1,
-0.3309458, -0.5264531, -2.523911, 0, 1, 0.03529412, 1,
-0.330918, -0.1740906, -1.396201, 0, 1, 0.03921569, 1,
-0.3267742, 0.3478257, -0.6345827, 0, 1, 0.04705882, 1,
-0.3165207, 0.6589003, 0.2131707, 0, 1, 0.05098039, 1,
-0.3114603, 0.5130138, -0.05930128, 0, 1, 0.05882353, 1,
-0.3099816, -0.1784922, -1.71424, 0, 1, 0.0627451, 1,
-0.3090697, -1.194426, -2.561517, 0, 1, 0.07058824, 1,
-0.2988764, -0.703168, -3.891316, 0, 1, 0.07450981, 1,
-0.2960828, -0.8227736, -3.518135, 0, 1, 0.08235294, 1,
-0.2901616, -0.5336564, -1.560022, 0, 1, 0.08627451, 1,
-0.2891252, 0.4205612, 0.5457678, 0, 1, 0.09411765, 1,
-0.2863055, 1.804044, -0.2116264, 0, 1, 0.1019608, 1,
-0.2833676, 0.6985442, -0.08452762, 0, 1, 0.1058824, 1,
-0.2833201, -1.027164, -3.347948, 0, 1, 0.1137255, 1,
-0.2802496, -0.1208437, -1.789817, 0, 1, 0.1176471, 1,
-0.2786154, 0.1258337, -1.578106, 0, 1, 0.1254902, 1,
-0.278538, 1.127329, -0.8295727, 0, 1, 0.1294118, 1,
-0.2720183, -0.4046215, -3.200298, 0, 1, 0.1372549, 1,
-0.2717368, -0.3122088, -3.16568, 0, 1, 0.1411765, 1,
-0.2702668, -0.3576337, -2.642714, 0, 1, 0.1490196, 1,
-0.2644386, 1.614516, 1.474742, 0, 1, 0.1529412, 1,
-0.2638858, 1.01821, -1.217622, 0, 1, 0.1607843, 1,
-0.2633902, -1.883275, -2.940149, 0, 1, 0.1647059, 1,
-0.2631986, -0.2686293, -1.46924, 0, 1, 0.172549, 1,
-0.2616452, 1.114471, -1.061876, 0, 1, 0.1764706, 1,
-0.261335, 1.289716, 0.7985945, 0, 1, 0.1843137, 1,
-0.2586833, 0.6110855, -3.227954, 0, 1, 0.1882353, 1,
-0.248267, -0.3333949, -3.191984, 0, 1, 0.1960784, 1,
-0.2449963, -1.70384, -0.5664605, 0, 1, 0.2039216, 1,
-0.244229, 0.9858471, 0.8355803, 0, 1, 0.2078431, 1,
-0.2386931, -0.123286, -1.629738, 0, 1, 0.2156863, 1,
-0.2353811, 0.114192, -1.546645, 0, 1, 0.2196078, 1,
-0.2345804, -0.5440641, -1.901809, 0, 1, 0.227451, 1,
-0.2339224, 0.124245, -2.170234, 0, 1, 0.2313726, 1,
-0.2323655, -0.1320328, -2.876621, 0, 1, 0.2392157, 1,
-0.2256799, -1.276066, -3.239909, 0, 1, 0.2431373, 1,
-0.2242766, 0.827143, 1.663744, 0, 1, 0.2509804, 1,
-0.2236013, -0.2426974, -2.38881, 0, 1, 0.254902, 1,
-0.223361, 2.977399, -1.000885, 0, 1, 0.2627451, 1,
-0.2160677, -1.172619, -2.753069, 0, 1, 0.2666667, 1,
-0.2083435, 0.03513307, -0.2775009, 0, 1, 0.2745098, 1,
-0.2048433, -1.120999, -3.260065, 0, 1, 0.2784314, 1,
-0.1965721, -0.9189025, -4.17244, 0, 1, 0.2862745, 1,
-0.1955484, -0.4624015, -1.16037, 0, 1, 0.2901961, 1,
-0.1858689, 2.403331, 0.8542904, 0, 1, 0.2980392, 1,
-0.1805925, 0.9204565, -1.454093, 0, 1, 0.3058824, 1,
-0.180277, -0.8553351, -4.404129, 0, 1, 0.3098039, 1,
-0.1717294, -0.6614858, -3.210695, 0, 1, 0.3176471, 1,
-0.1715688, 0.3370082, -1.461447, 0, 1, 0.3215686, 1,
-0.1706169, -0.1315522, -2.374969, 0, 1, 0.3294118, 1,
-0.1696838, 0.0724204, -1.139038, 0, 1, 0.3333333, 1,
-0.1678117, 0.26979, 0.5485084, 0, 1, 0.3411765, 1,
-0.1677127, -0.1242396, -0.9180239, 0, 1, 0.345098, 1,
-0.1673401, 1.249496, -1.021218, 0, 1, 0.3529412, 1,
-0.1657568, -0.8966797, -4.840563, 0, 1, 0.3568628, 1,
-0.1653442, -0.2072454, -2.576808, 0, 1, 0.3647059, 1,
-0.1650033, 0.70151, 0.450836, 0, 1, 0.3686275, 1,
-0.1641917, -0.1020105, -2.139096, 0, 1, 0.3764706, 1,
-0.1595912, -1.404995, -3.558299, 0, 1, 0.3803922, 1,
-0.1590838, 0.6901399, -0.5546041, 0, 1, 0.3882353, 1,
-0.1511268, -0.7741274, -3.109222, 0, 1, 0.3921569, 1,
-0.1470319, 2.447109, -0.02697739, 0, 1, 0.4, 1,
-0.1413288, 0.01658331, -1.457369, 0, 1, 0.4078431, 1,
-0.1329121, 0.9241985, 0.4549304, 0, 1, 0.4117647, 1,
-0.1276924, -1.537907, -2.952369, 0, 1, 0.4196078, 1,
-0.1258541, 1.825499, 1.085179, 0, 1, 0.4235294, 1,
-0.1257659, -0.9869143, -3.766628, 0, 1, 0.4313726, 1,
-0.1257423, 1.058709, -0.2906238, 0, 1, 0.4352941, 1,
-0.1250921, 0.2271559, -0.3205885, 0, 1, 0.4431373, 1,
-0.1249499, 0.9811813, 0.2442579, 0, 1, 0.4470588, 1,
-0.1233494, -1.386492, -2.278811, 0, 1, 0.454902, 1,
-0.1169322, -2.0777, -2.437259, 0, 1, 0.4588235, 1,
-0.1155928, 1.354931, 2.21755, 0, 1, 0.4666667, 1,
-0.1136614, 0.1336556, -2.294821, 0, 1, 0.4705882, 1,
-0.1099222, -0.097154, -2.172757, 0, 1, 0.4784314, 1,
-0.1086239, -1.171624, -3.160656, 0, 1, 0.4823529, 1,
-0.1066403, 0.1354419, -0.7207527, 0, 1, 0.4901961, 1,
-0.1061151, -0.8665593, -4.09617, 0, 1, 0.4941176, 1,
-0.104675, 1.059828, 0.883825, 0, 1, 0.5019608, 1,
-0.1033271, 1.629677, -0.1557607, 0, 1, 0.509804, 1,
-0.1016659, 0.7224147, -0.753783, 0, 1, 0.5137255, 1,
-0.1014794, 0.1294709, -1.826077, 0, 1, 0.5215687, 1,
-0.09979384, 0.5046856, -0.6473686, 0, 1, 0.5254902, 1,
-0.09497353, 0.4454033, -0.9316856, 0, 1, 0.5333334, 1,
-0.09257871, 0.8754001, -1.350776, 0, 1, 0.5372549, 1,
-0.09093489, -0.7243292, -1.666001, 0, 1, 0.5450981, 1,
-0.08890962, -1.19499, -1.918316, 0, 1, 0.5490196, 1,
-0.08850181, 0.6613088, -0.1533566, 0, 1, 0.5568628, 1,
-0.08055675, -0.0559417, -2.019352, 0, 1, 0.5607843, 1,
-0.07239419, 2.107799, 0.3140874, 0, 1, 0.5686275, 1,
-0.06626725, 0.8278299, -0.1973962, 0, 1, 0.572549, 1,
-0.06571708, -0.08580481, -5.043768, 0, 1, 0.5803922, 1,
-0.05634016, 1.412657, 0.1390633, 0, 1, 0.5843138, 1,
-0.05226216, -0.1369612, -3.010133, 0, 1, 0.5921569, 1,
-0.0518889, 0.01041931, -1.957244, 0, 1, 0.5960785, 1,
-0.05003001, -0.5781285, -3.170594, 0, 1, 0.6039216, 1,
-0.04878285, 1.356821, -2.231412, 0, 1, 0.6117647, 1,
-0.04597733, -0.5256791, -3.362988, 0, 1, 0.6156863, 1,
-0.04223513, -2.943166, -2.521796, 0, 1, 0.6235294, 1,
-0.04200915, -0.100414, -1.127964, 0, 1, 0.627451, 1,
-0.03104222, 1.353704, -0.7000645, 0, 1, 0.6352941, 1,
-0.02951675, 1.678036, 0.1879523, 0, 1, 0.6392157, 1,
-0.02568709, -0.7708319, -5.499234, 0, 1, 0.6470588, 1,
-0.02375551, -1.252914, -3.276394, 0, 1, 0.6509804, 1,
-0.02372158, -0.8121993, -4.557011, 0, 1, 0.6588235, 1,
-0.02068691, 0.2829382, 0.8531432, 0, 1, 0.6627451, 1,
-0.01561084, 0.1042062, -0.5544775, 0, 1, 0.6705883, 1,
-0.0108042, -0.4067168, -2.28279, 0, 1, 0.6745098, 1,
-0.01047402, -1.482939, -4.094781, 0, 1, 0.682353, 1,
-0.008218489, -0.07878803, -2.902822, 0, 1, 0.6862745, 1,
-0.007862709, 0.3124499, 2.011917, 0, 1, 0.6941177, 1,
-0.003834591, -0.3120912, -2.068647, 0, 1, 0.7019608, 1,
-0.003724263, -1.655777, -3.55092, 0, 1, 0.7058824, 1,
-0.00265864, -1.399264, -3.946401, 0, 1, 0.7137255, 1,
0.001782288, -0.3897244, 2.240011, 0, 1, 0.7176471, 1,
0.006659246, -0.1741967, 2.345324, 0, 1, 0.7254902, 1,
0.00881461, 0.6274234, -0.4243748, 0, 1, 0.7294118, 1,
0.008817253, -1.161341, 2.003377, 0, 1, 0.7372549, 1,
0.008912471, 0.3542297, -0.9142489, 0, 1, 0.7411765, 1,
0.0090094, -0.2540002, 1.444777, 0, 1, 0.7490196, 1,
0.009272297, -1.469554, 4.507864, 0, 1, 0.7529412, 1,
0.01798167, -2.400094, 3.281334, 0, 1, 0.7607843, 1,
0.01960634, 0.3011816, 1.49032, 0, 1, 0.7647059, 1,
0.01998298, -0.5987687, 3.308918, 0, 1, 0.772549, 1,
0.02122242, 0.04804692, -1.519009, 0, 1, 0.7764706, 1,
0.02252471, 0.7948244, 0.9459968, 0, 1, 0.7843137, 1,
0.02368576, -2.089577, 3.101647, 0, 1, 0.7882353, 1,
0.02607882, 1.003026, -0.2972407, 0, 1, 0.7960784, 1,
0.02910592, 0.4247307, -1.615795, 0, 1, 0.8039216, 1,
0.03074992, 0.2595313, 1.808905, 0, 1, 0.8078431, 1,
0.0309884, -1.129935, 3.444051, 0, 1, 0.8156863, 1,
0.03659858, 0.8605964, -1.702598, 0, 1, 0.8196079, 1,
0.03697586, -0.01231309, 1.624915, 0, 1, 0.827451, 1,
0.04030097, -1.247, 3.337793, 0, 1, 0.8313726, 1,
0.04166402, 0.5186514, 2.337428, 0, 1, 0.8392157, 1,
0.04298135, 1.536309, 0.02258474, 0, 1, 0.8431373, 1,
0.04305789, -1.194627, 4.745122, 0, 1, 0.8509804, 1,
0.04486676, -0.690124, 3.696509, 0, 1, 0.854902, 1,
0.05450539, 0.3713896, 0.4541393, 0, 1, 0.8627451, 1,
0.05653444, -2.738162, 4.450417, 0, 1, 0.8666667, 1,
0.0565852, -0.432143, 2.345581, 0, 1, 0.8745098, 1,
0.05691961, -0.245889, 2.060049, 0, 1, 0.8784314, 1,
0.05702115, -0.1368096, 2.993913, 0, 1, 0.8862745, 1,
0.06185886, -0.8712192, 2.368625, 0, 1, 0.8901961, 1,
0.06261345, -0.04396296, 1.600063, 0, 1, 0.8980392, 1,
0.06637025, 1.600625, 0.4083785, 0, 1, 0.9058824, 1,
0.0764242, -1.09945, 4.331238, 0, 1, 0.9098039, 1,
0.07952482, -1.507411, 3.979911, 0, 1, 0.9176471, 1,
0.08010784, 0.6273341, 0.1799121, 0, 1, 0.9215686, 1,
0.08322366, -1.098862, 2.480824, 0, 1, 0.9294118, 1,
0.08351862, -0.4469895, 3.289149, 0, 1, 0.9333333, 1,
0.08707082, 0.1607261, 0.6320308, 0, 1, 0.9411765, 1,
0.09101709, 0.5214316, 1.559653, 0, 1, 0.945098, 1,
0.09279524, -0.8832506, 3.283049, 0, 1, 0.9529412, 1,
0.09415013, 1.485402, 0.5398009, 0, 1, 0.9568627, 1,
0.09431363, -0.05210895, 2.422091, 0, 1, 0.9647059, 1,
0.09470188, 0.9285764, 1.059264, 0, 1, 0.9686275, 1,
0.09597716, -0.2402358, 2.164915, 0, 1, 0.9764706, 1,
0.09873729, 0.302542, -0.5367094, 0, 1, 0.9803922, 1,
0.1015639, 0.02141711, 0.2586792, 0, 1, 0.9882353, 1,
0.1019692, 1.253125, 0.2511754, 0, 1, 0.9921569, 1,
0.1029758, -1.136055, 1.523075, 0, 1, 1, 1,
0.1050545, -1.094946, 3.859792, 0, 0.9921569, 1, 1,
0.1062096, 0.5078346, 1.365683, 0, 0.9882353, 1, 1,
0.1067092, -0.6020685, 3.012465, 0, 0.9803922, 1, 1,
0.1073544, -0.0004135231, 2.650421, 0, 0.9764706, 1, 1,
0.1100508, -0.3150155, 4.037018, 0, 0.9686275, 1, 1,
0.1148762, -0.544931, 2.366051, 0, 0.9647059, 1, 1,
0.1160068, -0.9292108, 4.6997, 0, 0.9568627, 1, 1,
0.1176252, 0.1910014, 1.696805, 0, 0.9529412, 1, 1,
0.125915, -2.138145, 0.8010387, 0, 0.945098, 1, 1,
0.1289618, -1.825126, 3.662787, 0, 0.9411765, 1, 1,
0.1299082, -1.19898, 2.982832, 0, 0.9333333, 1, 1,
0.134744, -0.6735327, 3.025215, 0, 0.9294118, 1, 1,
0.13665, 0.09915061, 1.247364, 0, 0.9215686, 1, 1,
0.1368375, 1.442175, 0.6700839, 0, 0.9176471, 1, 1,
0.137358, -1.418624, 3.563847, 0, 0.9098039, 1, 1,
0.1434962, 0.2422018, 2.147176, 0, 0.9058824, 1, 1,
0.1440643, -1.239816, 2.546343, 0, 0.8980392, 1, 1,
0.1444317, 0.5510193, -0.9383149, 0, 0.8901961, 1, 1,
0.1556347, -0.9426447, 3.703149, 0, 0.8862745, 1, 1,
0.1608873, -0.02956838, 2.632843, 0, 0.8784314, 1, 1,
0.1616399, 2.075238, -0.8084726, 0, 0.8745098, 1, 1,
0.1656404, -0.2375149, 2.535962, 0, 0.8666667, 1, 1,
0.1657438, -1.017503, 3.025359, 0, 0.8627451, 1, 1,
0.1683934, -0.3591409, 3.486999, 0, 0.854902, 1, 1,
0.1699934, 0.4296429, -1.352042, 0, 0.8509804, 1, 1,
0.1779293, 0.2045268, 1.693004, 0, 0.8431373, 1, 1,
0.1817195, 0.2299655, 0.5899069, 0, 0.8392157, 1, 1,
0.1898853, 0.8405532, -0.004669423, 0, 0.8313726, 1, 1,
0.1972985, 1.023461, -0.09123549, 0, 0.827451, 1, 1,
0.1995032, -0.7754658, 1.147424, 0, 0.8196079, 1, 1,
0.2000917, 0.3169308, 0.329132, 0, 0.8156863, 1, 1,
0.2071076, 0.356288, 0.8916597, 0, 0.8078431, 1, 1,
0.2078023, -0.5532101, 2.138293, 0, 0.8039216, 1, 1,
0.2091399, 1.403835, 0.00678223, 0, 0.7960784, 1, 1,
0.2097896, 0.08459163, 2.402449, 0, 0.7882353, 1, 1,
0.2108449, -0.9777205, 2.222773, 0, 0.7843137, 1, 1,
0.2121595, 1.014302, 0.2620071, 0, 0.7764706, 1, 1,
0.2132084, -0.5941951, 2.637549, 0, 0.772549, 1, 1,
0.214239, -1.431612, 1.449043, 0, 0.7647059, 1, 1,
0.2162826, -0.9533836, 2.962956, 0, 0.7607843, 1, 1,
0.21726, -1.068654, 4.30572, 0, 0.7529412, 1, 1,
0.2183492, -0.8992431, 4.122177, 0, 0.7490196, 1, 1,
0.2210751, 0.6883386, 0.05452863, 0, 0.7411765, 1, 1,
0.2262212, 1.082134, 2.185934, 0, 0.7372549, 1, 1,
0.2273189, -0.7099436, 3.350638, 0, 0.7294118, 1, 1,
0.2286838, -1.258525, 3.540023, 0, 0.7254902, 1, 1,
0.2299861, -0.5797943, 2.151861, 0, 0.7176471, 1, 1,
0.2301762, -1.583563, 1.765738, 0, 0.7137255, 1, 1,
0.2356126, -0.7689333, 3.714419, 0, 0.7058824, 1, 1,
0.2392884, 0.2339608, 0.8495859, 0, 0.6980392, 1, 1,
0.2418547, -0.5591503, 3.85936, 0, 0.6941177, 1, 1,
0.244347, -0.6988436, 1.896512, 0, 0.6862745, 1, 1,
0.2477618, 0.9542205, -0.3581473, 0, 0.682353, 1, 1,
0.2482571, -1.839525, 3.134172, 0, 0.6745098, 1, 1,
0.24927, 0.685077, -0.2903117, 0, 0.6705883, 1, 1,
0.2506761, -1.36227, 3.877982, 0, 0.6627451, 1, 1,
0.2550584, 1.288056, 0.4749137, 0, 0.6588235, 1, 1,
0.2575549, 0.5154108, 1.677278, 0, 0.6509804, 1, 1,
0.2578375, -1.17998, 3.037767, 0, 0.6470588, 1, 1,
0.2586959, -0.3808339, 3.053286, 0, 0.6392157, 1, 1,
0.2608662, -1.027562, 2.759461, 0, 0.6352941, 1, 1,
0.2609559, 2.136744, -1.474503, 0, 0.627451, 1, 1,
0.2616991, -0.9783742, 4.838736, 0, 0.6235294, 1, 1,
0.2644872, 1.940445, 1.005305, 0, 0.6156863, 1, 1,
0.2647362, 0.3107027, 2.127677, 0, 0.6117647, 1, 1,
0.2651491, -0.9738217, 1.152569, 0, 0.6039216, 1, 1,
0.2686915, -0.161475, 2.655071, 0, 0.5960785, 1, 1,
0.2780913, 0.4216373, -1.111004, 0, 0.5921569, 1, 1,
0.2790861, 2.918459, 1.272327, 0, 0.5843138, 1, 1,
0.2835731, 0.5998917, 1.789347, 0, 0.5803922, 1, 1,
0.2847757, -1.296139, 3.821204, 0, 0.572549, 1, 1,
0.2856719, -2.061023, 1.734442, 0, 0.5686275, 1, 1,
0.2862017, 0.5029448, 0.9562427, 0, 0.5607843, 1, 1,
0.288589, 0.5649077, 0.1211878, 0, 0.5568628, 1, 1,
0.2935153, -0.7502695, 2.005325, 0, 0.5490196, 1, 1,
0.294626, 0.8625164, 1.708787, 0, 0.5450981, 1, 1,
0.2950876, 0.4441885, -0.2627873, 0, 0.5372549, 1, 1,
0.2994176, -1.793103, 1.484272, 0, 0.5333334, 1, 1,
0.2994358, -2.164055, 2.174278, 0, 0.5254902, 1, 1,
0.3035085, 1.823101, -0.3319313, 0, 0.5215687, 1, 1,
0.3068411, -0.9730008, 3.531101, 0, 0.5137255, 1, 1,
0.3118614, 0.5723921, 0.2616815, 0, 0.509804, 1, 1,
0.3207076, -1.080518, 4.741162, 0, 0.5019608, 1, 1,
0.3222458, -0.2690263, 3.799523, 0, 0.4941176, 1, 1,
0.3250955, -0.6566342, 2.520616, 0, 0.4901961, 1, 1,
0.3283122, -1.402483, 4.163688, 0, 0.4823529, 1, 1,
0.3285716, -1.816626, 3.007186, 0, 0.4784314, 1, 1,
0.3295342, -0.1915053, 3.038546, 0, 0.4705882, 1, 1,
0.330973, -0.02364564, 1.130855, 0, 0.4666667, 1, 1,
0.3318195, 0.1203006, 2.303124, 0, 0.4588235, 1, 1,
0.3363573, -0.2282742, 2.165769, 0, 0.454902, 1, 1,
0.3392562, 1.046952, 1.059046, 0, 0.4470588, 1, 1,
0.3412665, -0.8953961, 3.462639, 0, 0.4431373, 1, 1,
0.3432193, 1.967847, -1.859566, 0, 0.4352941, 1, 1,
0.3464683, 0.6193616, 1.236866, 0, 0.4313726, 1, 1,
0.3482697, -0.03919247, 1.090025, 0, 0.4235294, 1, 1,
0.3517566, 0.1442457, 1.635208, 0, 0.4196078, 1, 1,
0.3524599, -1.399714, 2.695457, 0, 0.4117647, 1, 1,
0.3594745, 0.6997877, -1.072328, 0, 0.4078431, 1, 1,
0.3634053, 0.3255469, 0.7809001, 0, 0.4, 1, 1,
0.3634419, -0.4701318, 2.060327, 0, 0.3921569, 1, 1,
0.3649357, -0.4871087, 2.039698, 0, 0.3882353, 1, 1,
0.3675918, 1.613165, 0.7305925, 0, 0.3803922, 1, 1,
0.3682675, 0.2788365, -0.499077, 0, 0.3764706, 1, 1,
0.3695549, 0.09113355, 2.085113, 0, 0.3686275, 1, 1,
0.3713305, 1.239471, 2.121794, 0, 0.3647059, 1, 1,
0.3751028, -0.5016394, 0.7991883, 0, 0.3568628, 1, 1,
0.37815, 1.885883, 1.346647, 0, 0.3529412, 1, 1,
0.379905, 0.05123286, 0.3190064, 0, 0.345098, 1, 1,
0.3841521, 0.9658096, -0.5978621, 0, 0.3411765, 1, 1,
0.3865832, 0.289172, 1.313108, 0, 0.3333333, 1, 1,
0.3906048, -0.6154512, 0.6659669, 0, 0.3294118, 1, 1,
0.3917292, 0.4324405, 1.827098, 0, 0.3215686, 1, 1,
0.397971, -0.9077232, 4.199488, 0, 0.3176471, 1, 1,
0.4000735, -1.105398, 4.591701, 0, 0.3098039, 1, 1,
0.4017876, 0.8007838, 0.4894081, 0, 0.3058824, 1, 1,
0.402031, 1.817379, 1.398556, 0, 0.2980392, 1, 1,
0.4029773, 0.1705469, 3.155903, 0, 0.2901961, 1, 1,
0.4038721, 0.5928969, 0.6095741, 0, 0.2862745, 1, 1,
0.4042435, -1.064321, 1.095145, 0, 0.2784314, 1, 1,
0.405332, -1.731036, 4.162827, 0, 0.2745098, 1, 1,
0.4054488, -0.184527, 5.087508, 0, 0.2666667, 1, 1,
0.4122249, 0.3840744, 2.066099, 0, 0.2627451, 1, 1,
0.4181644, 1.504627, 0.03772833, 0, 0.254902, 1, 1,
0.4193164, 1.272834, 0.489255, 0, 0.2509804, 1, 1,
0.4274879, -1.573375, 2.452457, 0, 0.2431373, 1, 1,
0.4290339, -1.262144, 3.013754, 0, 0.2392157, 1, 1,
0.4323722, 0.1234828, -0.5911362, 0, 0.2313726, 1, 1,
0.4355336, 1.065813, 1.83335, 0, 0.227451, 1, 1,
0.4377417, 0.08787673, 1.169174, 0, 0.2196078, 1, 1,
0.4378107, 0.2300913, 0.8300015, 0, 0.2156863, 1, 1,
0.4381147, -0.723507, 2.161649, 0, 0.2078431, 1, 1,
0.4395749, 1.896074, 0.5082421, 0, 0.2039216, 1, 1,
0.4401526, 0.04084868, 1.719745, 0, 0.1960784, 1, 1,
0.4431005, 0.8894818, -0.2608124, 0, 0.1882353, 1, 1,
0.4443778, -0.9196471, 1.959797, 0, 0.1843137, 1, 1,
0.446268, -0.4951531, 1.15403, 0, 0.1764706, 1, 1,
0.4549146, 1.256924, 0.8365573, 0, 0.172549, 1, 1,
0.4558254, -0.395631, 2.989797, 0, 0.1647059, 1, 1,
0.457051, -1.10259, 4.358081, 0, 0.1607843, 1, 1,
0.4589133, -0.03287566, 1.323314, 0, 0.1529412, 1, 1,
0.4598067, -0.6769577, 4.96675, 0, 0.1490196, 1, 1,
0.4629016, -0.9200013, 1.45095, 0, 0.1411765, 1, 1,
0.4687289, 1.563352, 0.6238191, 0, 0.1372549, 1, 1,
0.474085, 0.7030716, 0.8990088, 0, 0.1294118, 1, 1,
0.4751135, -0.9647577, 2.163151, 0, 0.1254902, 1, 1,
0.475119, 0.2951011, -0.5680283, 0, 0.1176471, 1, 1,
0.4767922, -0.4078765, 1.053737, 0, 0.1137255, 1, 1,
0.4827332, -0.3734311, 0.6937109, 0, 0.1058824, 1, 1,
0.4850038, 0.003222307, 0.910308, 0, 0.09803922, 1, 1,
0.4880802, -0.4012166, 1.901986, 0, 0.09411765, 1, 1,
0.4889545, -0.8989523, 2.198459, 0, 0.08627451, 1, 1,
0.4905235, 0.8022255, 0.8243933, 0, 0.08235294, 1, 1,
0.4941649, 0.6281413, 2.095708, 0, 0.07450981, 1, 1,
0.4946615, -1.450527, 2.130352, 0, 0.07058824, 1, 1,
0.4947611, -0.2001128, 3.097456, 0, 0.0627451, 1, 1,
0.4950733, 0.1036763, 3.079753, 0, 0.05882353, 1, 1,
0.4975894, 0.5726075, -1.268445, 0, 0.05098039, 1, 1,
0.4978801, 0.03082251, 1.634478, 0, 0.04705882, 1, 1,
0.498056, 0.3752225, 2.065618, 0, 0.03921569, 1, 1,
0.5004247, 0.006490061, 3.098729, 0, 0.03529412, 1, 1,
0.5008141, 1.268435, 0.959034, 0, 0.02745098, 1, 1,
0.508755, -0.2568597, 2.559315, 0, 0.02352941, 1, 1,
0.5092159, 0.7547277, -0.113127, 0, 0.01568628, 1, 1,
0.5108205, 0.6259084, -0.4725134, 0, 0.01176471, 1, 1,
0.5128114, 0.8247437, 2.213583, 0, 0.003921569, 1, 1,
0.5165725, 0.5212625, 0.2733712, 0.003921569, 0, 1, 1,
0.5174111, 0.50158, 2.083689, 0.007843138, 0, 1, 1,
0.5198943, -0.7761787, 1.645537, 0.01568628, 0, 1, 1,
0.5206873, 1.167391, 0.6790663, 0.01960784, 0, 1, 1,
0.5297637, -0.4620912, 1.590566, 0.02745098, 0, 1, 1,
0.5365497, 0.4985775, 1.708088, 0.03137255, 0, 1, 1,
0.5373566, 1.527148, 0.2759471, 0.03921569, 0, 1, 1,
0.5424153, -0.6798214, 1.227059, 0.04313726, 0, 1, 1,
0.5442277, -1.11961, 2.842255, 0.05098039, 0, 1, 1,
0.5443138, -0.2704712, -0.3705845, 0.05490196, 0, 1, 1,
0.5461335, -0.5004331, 4.27807, 0.0627451, 0, 1, 1,
0.5499679, 1.003015, 0.3700964, 0.06666667, 0, 1, 1,
0.5520816, 0.4643263, -0.7957082, 0.07450981, 0, 1, 1,
0.5538899, 1.029073, 2.32848, 0.07843138, 0, 1, 1,
0.5557157, -1.970279, 2.500477, 0.08627451, 0, 1, 1,
0.5563636, 0.1966279, 2.181336, 0.09019608, 0, 1, 1,
0.5599096, 0.3391753, 0.6869484, 0.09803922, 0, 1, 1,
0.5625536, -1.286849, 3.231076, 0.1058824, 0, 1, 1,
0.5647672, -1.687129, 3.29155, 0.1098039, 0, 1, 1,
0.5668302, -0.5869175, 2.83364, 0.1176471, 0, 1, 1,
0.5675343, 0.1866187, 0.261998, 0.1215686, 0, 1, 1,
0.5682849, -0.3077801, 2.345442, 0.1294118, 0, 1, 1,
0.5696974, -1.121329, 2.618179, 0.1333333, 0, 1, 1,
0.5714422, -0.3865458, 2.504578, 0.1411765, 0, 1, 1,
0.5722791, 1.031213, 0.3950004, 0.145098, 0, 1, 1,
0.5777172, 1.00812, 0.5637569, 0.1529412, 0, 1, 1,
0.5778283, -2.079058, 3.265571, 0.1568628, 0, 1, 1,
0.5797337, -0.5391945, 2.243594, 0.1647059, 0, 1, 1,
0.5862237, -0.8758177, 1.667489, 0.1686275, 0, 1, 1,
0.5896096, 0.8747764, 2.317425, 0.1764706, 0, 1, 1,
0.5906953, 0.4295401, -0.6009691, 0.1803922, 0, 1, 1,
0.592315, -1.019775, 1.678978, 0.1882353, 0, 1, 1,
0.5931703, 0.5056906, 0.5727832, 0.1921569, 0, 1, 1,
0.5953342, 0.489946, -0.1908705, 0.2, 0, 1, 1,
0.5996739, 0.1378397, -0.2846257, 0.2078431, 0, 1, 1,
0.606986, -0.7983934, 1.929568, 0.2117647, 0, 1, 1,
0.6070175, 0.3113717, -0.1081711, 0.2196078, 0, 1, 1,
0.6082783, 2.185578, 0.2045767, 0.2235294, 0, 1, 1,
0.6104144, -0.4709562, 3.088006, 0.2313726, 0, 1, 1,
0.6156071, 0.5596349, -0.9402052, 0.2352941, 0, 1, 1,
0.6298683, -0.4740356, 3.701295, 0.2431373, 0, 1, 1,
0.6311063, -0.3714815, 3.850659, 0.2470588, 0, 1, 1,
0.632567, -0.8077972, 3.112997, 0.254902, 0, 1, 1,
0.6343333, -0.6970081, 3.634678, 0.2588235, 0, 1, 1,
0.6371748, 2.705999, 0.8942645, 0.2666667, 0, 1, 1,
0.637702, -1.570521, 3.481624, 0.2705882, 0, 1, 1,
0.639662, -0.4213371, 1.800308, 0.2784314, 0, 1, 1,
0.6402565, -1.424616, 2.320239, 0.282353, 0, 1, 1,
0.6421175, -0.001753108, 0.3268412, 0.2901961, 0, 1, 1,
0.64666, 0.9180431, 0.7739303, 0.2941177, 0, 1, 1,
0.6468714, 0.7994627, 1.928539, 0.3019608, 0, 1, 1,
0.6516087, -0.36318, 1.929209, 0.3098039, 0, 1, 1,
0.6528918, 0.4721221, -0.1239515, 0.3137255, 0, 1, 1,
0.6553146, -0.3138886, 1.751416, 0.3215686, 0, 1, 1,
0.6623343, -1.510755, 1.590893, 0.3254902, 0, 1, 1,
0.6690906, -1.478054, 3.092477, 0.3333333, 0, 1, 1,
0.6704928, 0.4660179, 0.4807575, 0.3372549, 0, 1, 1,
0.6712697, 0.9011756, 1.17865, 0.345098, 0, 1, 1,
0.6740507, 0.9586179, -0.3209986, 0.3490196, 0, 1, 1,
0.6812747, 0.5021791, 1.269344, 0.3568628, 0, 1, 1,
0.6832826, -0.05588648, 2.895844, 0.3607843, 0, 1, 1,
0.6894401, -0.493717, 1.207513, 0.3686275, 0, 1, 1,
0.6911598, 0.6993438, 0.2967033, 0.372549, 0, 1, 1,
0.6922296, -0.3279362, 2.852398, 0.3803922, 0, 1, 1,
0.6967152, -1.320894, 3.113448, 0.3843137, 0, 1, 1,
0.7073689, -0.2413822, 1.697523, 0.3921569, 0, 1, 1,
0.7126673, 0.1769002, 0.6080775, 0.3960784, 0, 1, 1,
0.7133281, 0.6950115, 0.989265, 0.4039216, 0, 1, 1,
0.7222825, -1.423702, 3.107147, 0.4117647, 0, 1, 1,
0.7235799, -2.943513, 0.9792916, 0.4156863, 0, 1, 1,
0.7241495, 0.9558572, 2.221215, 0.4235294, 0, 1, 1,
0.7278515, 0.4326276, 1.208468, 0.427451, 0, 1, 1,
0.7284319, -0.4874927, 3.587818, 0.4352941, 0, 1, 1,
0.7297619, 0.9649093, -0.9252116, 0.4392157, 0, 1, 1,
0.7303742, -0.6305097, 1.787706, 0.4470588, 0, 1, 1,
0.7340558, -1.050827, 3.429199, 0.4509804, 0, 1, 1,
0.7345138, -0.6778605, 2.482152, 0.4588235, 0, 1, 1,
0.7350896, 0.2388359, 1.121649, 0.4627451, 0, 1, 1,
0.7357569, 0.9881852, 0.3969384, 0.4705882, 0, 1, 1,
0.746677, 0.5742321, -0.1995098, 0.4745098, 0, 1, 1,
0.7520509, -0.2755332, 1.526746, 0.4823529, 0, 1, 1,
0.7529703, -1.049611, 0.9139526, 0.4862745, 0, 1, 1,
0.7538688, 1.000877, 1.774283, 0.4941176, 0, 1, 1,
0.7581111, -1.247249, 2.659763, 0.5019608, 0, 1, 1,
0.7706791, -0.5165486, 2.676943, 0.5058824, 0, 1, 1,
0.7714788, -1.210779, 1.135197, 0.5137255, 0, 1, 1,
0.7723416, 0.5452375, -0.7088608, 0.5176471, 0, 1, 1,
0.775628, 1.169692, 1.051812, 0.5254902, 0, 1, 1,
0.7806103, -1.875065, 1.953569, 0.5294118, 0, 1, 1,
0.7817088, 0.4562493, 2.52734, 0.5372549, 0, 1, 1,
0.7899089, -0.9562733, 2.741812, 0.5411765, 0, 1, 1,
0.7900535, 1.768697, 1.293754, 0.5490196, 0, 1, 1,
0.7951006, 0.9937616, 1.24533, 0.5529412, 0, 1, 1,
0.7988926, -1.476914, 3.137759, 0.5607843, 0, 1, 1,
0.8008695, 0.7294697, 1.126426, 0.5647059, 0, 1, 1,
0.8009193, -0.7370285, 2.523221, 0.572549, 0, 1, 1,
0.8151522, 1.374968, -0.2363738, 0.5764706, 0, 1, 1,
0.8209136, 0.07067179, 1.954136, 0.5843138, 0, 1, 1,
0.8239383, -0.9998547, 4.146256, 0.5882353, 0, 1, 1,
0.8273781, -0.7059995, 1.71242, 0.5960785, 0, 1, 1,
0.8353225, 1.415299, -0.3999543, 0.6039216, 0, 1, 1,
0.8354461, -0.1003697, 2.234051, 0.6078432, 0, 1, 1,
0.8384692, -0.8696727, 2.791879, 0.6156863, 0, 1, 1,
0.8489855, -0.8161225, 2.13693, 0.6196079, 0, 1, 1,
0.8514901, -0.1549236, 2.618601, 0.627451, 0, 1, 1,
0.8546266, 0.3631325, 0.2370274, 0.6313726, 0, 1, 1,
0.858164, -0.4809028, 2.415605, 0.6392157, 0, 1, 1,
0.870506, -0.8665165, 2.815993, 0.6431373, 0, 1, 1,
0.8725913, -0.45558, 1.62642, 0.6509804, 0, 1, 1,
0.8763139, -0.1655822, -0.2061683, 0.654902, 0, 1, 1,
0.8772857, 0.308691, 2.308179, 0.6627451, 0, 1, 1,
0.8823637, 1.322141, 1.595811, 0.6666667, 0, 1, 1,
0.8873543, 0.003640723, 2.945574, 0.6745098, 0, 1, 1,
0.887466, 0.8291696, 0.78542, 0.6784314, 0, 1, 1,
0.8877309, -0.07074985, 1.211382, 0.6862745, 0, 1, 1,
0.8880354, 1.665236, -0.3515039, 0.6901961, 0, 1, 1,
0.8892622, -0.6469787, 3.013169, 0.6980392, 0, 1, 1,
0.8921371, 0.8800345, 1.668067, 0.7058824, 0, 1, 1,
0.8983945, -1.07301, 2.501874, 0.7098039, 0, 1, 1,
0.9022381, 0.004818296, 1.725734, 0.7176471, 0, 1, 1,
0.9141958, -0.2329253, 0.762884, 0.7215686, 0, 1, 1,
0.9149767, -0.4185933, 1.454165, 0.7294118, 0, 1, 1,
0.9179689, 2.064109, 0.9279349, 0.7333333, 0, 1, 1,
0.9199879, -0.4451838, 1.57627, 0.7411765, 0, 1, 1,
0.9251114, 0.5803823, 1.549893, 0.7450981, 0, 1, 1,
0.9270549, -0.02707489, 1.076571, 0.7529412, 0, 1, 1,
0.9321433, 2.330633, -0.4572756, 0.7568628, 0, 1, 1,
0.9377673, -1.506407, 3.370572, 0.7647059, 0, 1, 1,
0.9474677, -0.5244319, 1.103027, 0.7686275, 0, 1, 1,
0.9487876, -1.421506, 3.05779, 0.7764706, 0, 1, 1,
0.9517792, -1.392775, 2.214019, 0.7803922, 0, 1, 1,
0.9538449, -1.708704, 1.963589, 0.7882353, 0, 1, 1,
0.9610549, 0.866891, -0.7405105, 0.7921569, 0, 1, 1,
0.9611411, -0.08432223, 2.864452, 0.8, 0, 1, 1,
0.9620821, 1.131142, -0.6379576, 0.8078431, 0, 1, 1,
0.9621458, -0.03714208, 0.7236411, 0.8117647, 0, 1, 1,
0.9673635, -0.5837399, 2.205179, 0.8196079, 0, 1, 1,
0.9687046, -1.226413, 3.742926, 0.8235294, 0, 1, 1,
0.9873383, -0.1839726, 3.843811, 0.8313726, 0, 1, 1,
0.9906031, 0.9727963, 0.7165571, 0.8352941, 0, 1, 1,
0.9965148, 0.1489649, 1.379893, 0.8431373, 0, 1, 1,
0.9976657, 1.122024, 1.629297, 0.8470588, 0, 1, 1,
1.002533, -0.08771751, 2.241001, 0.854902, 0, 1, 1,
1.00306, 0.05135363, 0.01385961, 0.8588235, 0, 1, 1,
1.003548, -0.2823203, -0.02809472, 0.8666667, 0, 1, 1,
1.00405, 0.6732857, 0.5275464, 0.8705882, 0, 1, 1,
1.009704, -0.605559, 1.211001, 0.8784314, 0, 1, 1,
1.010154, 0.1833391, 2.076426, 0.8823529, 0, 1, 1,
1.031496, -1.125329, 1.425136, 0.8901961, 0, 1, 1,
1.036107, -0.005682051, 2.941294, 0.8941177, 0, 1, 1,
1.036365, 0.8569683, -0.03403452, 0.9019608, 0, 1, 1,
1.037215, -1.559863, 3.998579, 0.9098039, 0, 1, 1,
1.039414, 0.08614485, -0.4001612, 0.9137255, 0, 1, 1,
1.041204, 0.1861206, 1.829255, 0.9215686, 0, 1, 1,
1.052819, -0.08061968, 1.062732, 0.9254902, 0, 1, 1,
1.053564, 0.6959996, 1.397559, 0.9333333, 0, 1, 1,
1.054842, -0.8212333, 1.463746, 0.9372549, 0, 1, 1,
1.063825, 0.6140462, 1.072977, 0.945098, 0, 1, 1,
1.065966, 1.27005, -0.3816923, 0.9490196, 0, 1, 1,
1.070145, 0.418971, 3.402916, 0.9568627, 0, 1, 1,
1.076026, -0.498071, 2.631873, 0.9607843, 0, 1, 1,
1.078392, 1.294089, 0.3124001, 0.9686275, 0, 1, 1,
1.079464, -0.4273007, 1.359897, 0.972549, 0, 1, 1,
1.090588, 0.7873725, -0.7065459, 0.9803922, 0, 1, 1,
1.100384, -0.845296, 0.745109, 0.9843137, 0, 1, 1,
1.100648, 0.6435371, -2.631556, 0.9921569, 0, 1, 1,
1.105637, 1.420492, 2.216398, 0.9960784, 0, 1, 1,
1.114334, -1.863394, 1.704774, 1, 0, 0.9960784, 1,
1.132551, -0.8725621, 0.6257473, 1, 0, 0.9882353, 1,
1.136487, -0.4872461, 1.285282, 1, 0, 0.9843137, 1,
1.148484, 0.8535714, 0.924195, 1, 0, 0.9764706, 1,
1.15374, 0.2171208, 2.113388, 1, 0, 0.972549, 1,
1.155864, 0.3550319, 0.9980198, 1, 0, 0.9647059, 1,
1.160665, 0.2664497, 2.138045, 1, 0, 0.9607843, 1,
1.163595, -0.1667568, 1.602522, 1, 0, 0.9529412, 1,
1.166524, -0.2555277, 1.036509, 1, 0, 0.9490196, 1,
1.167444, 2.009963, -2.133545, 1, 0, 0.9411765, 1,
1.175615, 1.352246, 0.1703609, 1, 0, 0.9372549, 1,
1.179102, 0.3834305, 2.37791, 1, 0, 0.9294118, 1,
1.189724, 1.086648, 1.049606, 1, 0, 0.9254902, 1,
1.194504, 1.21777, 2.076224, 1, 0, 0.9176471, 1,
1.195644, -1.3602, 3.0091, 1, 0, 0.9137255, 1,
1.208188, 0.4264989, 1.299347, 1, 0, 0.9058824, 1,
1.208712, 1.430318, -0.5850548, 1, 0, 0.9019608, 1,
1.208959, -0.7338702, 0.9908529, 1, 0, 0.8941177, 1,
1.211977, 0.6005815, -0.01631555, 1, 0, 0.8862745, 1,
1.213994, -0.3995773, 1.211128, 1, 0, 0.8823529, 1,
1.223605, -0.2207397, 1.274179, 1, 0, 0.8745098, 1,
1.229391, -0.9560241, 2.36156, 1, 0, 0.8705882, 1,
1.23306, 1.167936, -0.09959852, 1, 0, 0.8627451, 1,
1.237595, -0.7937554, 2.500901, 1, 0, 0.8588235, 1,
1.239925, 0.3781123, 0.3144726, 1, 0, 0.8509804, 1,
1.243129, 0.522965, 0.6590879, 1, 0, 0.8470588, 1,
1.244634, -0.7559264, 0.6638757, 1, 0, 0.8392157, 1,
1.247028, -0.2012175, 1.494186, 1, 0, 0.8352941, 1,
1.276075, -0.6252015, 2.080076, 1, 0, 0.827451, 1,
1.282268, 1.888142, -0.09157783, 1, 0, 0.8235294, 1,
1.294387, 0.2447974, 1.503299, 1, 0, 0.8156863, 1,
1.297539, -1.287947, 1.866798, 1, 0, 0.8117647, 1,
1.298821, 0.5519021, 3.029769, 1, 0, 0.8039216, 1,
1.301123, -0.1769724, 1.112491, 1, 0, 0.7960784, 1,
1.304153, 0.08831561, 2.406335, 1, 0, 0.7921569, 1,
1.305392, -1.346688, 2.818719, 1, 0, 0.7843137, 1,
1.307542, -0.4250768, 1.030509, 1, 0, 0.7803922, 1,
1.310945, -0.2426519, 2.519712, 1, 0, 0.772549, 1,
1.312372, -0.7473065, 2.709261, 1, 0, 0.7686275, 1,
1.313194, 0.5757773, -0.6177579, 1, 0, 0.7607843, 1,
1.31574, 1.06238, 1.523624, 1, 0, 0.7568628, 1,
1.316326, 1.175689, -0.1400089, 1, 0, 0.7490196, 1,
1.319827, -0.09374188, 0.0527602, 1, 0, 0.7450981, 1,
1.325725, 0.1175602, 0.8374152, 1, 0, 0.7372549, 1,
1.329997, -1.691152, 1.306108, 1, 0, 0.7333333, 1,
1.331847, -1.265311, 1.098833, 1, 0, 0.7254902, 1,
1.339653, 0.4152595, 1.079634, 1, 0, 0.7215686, 1,
1.352839, -0.7698668, 2.808123, 1, 0, 0.7137255, 1,
1.358266, 0.7396334, 2.899278, 1, 0, 0.7098039, 1,
1.36077, -1.066139, 2.444184, 1, 0, 0.7019608, 1,
1.364759, 0.5182728, 0.9234226, 1, 0, 0.6941177, 1,
1.367185, 1.502575, 0.4477654, 1, 0, 0.6901961, 1,
1.367284, -1.793006, 3.337894, 1, 0, 0.682353, 1,
1.377301, 0.4769405, -0.4788626, 1, 0, 0.6784314, 1,
1.377782, -0.1970736, 0.6333502, 1, 0, 0.6705883, 1,
1.379989, -0.7883312, 2.959753, 1, 0, 0.6666667, 1,
1.387177, 1.165959, 0.9407728, 1, 0, 0.6588235, 1,
1.390255, -0.6575695, 2.832126, 1, 0, 0.654902, 1,
1.396997, 0.1031164, -0.4124042, 1, 0, 0.6470588, 1,
1.404797, 0.09307016, 0.6497262, 1, 0, 0.6431373, 1,
1.406014, -0.09032615, 2.80625, 1, 0, 0.6352941, 1,
1.43113, 1.54885, 1.011428, 1, 0, 0.6313726, 1,
1.435152, -0.02217491, 1.275375, 1, 0, 0.6235294, 1,
1.437149, 0.4892695, 1.930214, 1, 0, 0.6196079, 1,
1.438169, -0.4271668, 0.8277229, 1, 0, 0.6117647, 1,
1.440245, -0.20324, 1.173999, 1, 0, 0.6078432, 1,
1.456423, 0.8357323, 0.15339, 1, 0, 0.6, 1,
1.464642, -0.8371359, 1.582306, 1, 0, 0.5921569, 1,
1.470283, 1.333989, 1.581334, 1, 0, 0.5882353, 1,
1.472121, 1.341518, 0.7513561, 1, 0, 0.5803922, 1,
1.492879, 1.18688, 2.397403, 1, 0, 0.5764706, 1,
1.493375, -0.7680168, 1.696816, 1, 0, 0.5686275, 1,
1.49385, 0.4726496, 0.6923746, 1, 0, 0.5647059, 1,
1.50451, -2.046875, 3.281865, 1, 0, 0.5568628, 1,
1.505667, 0.3922821, 1.601096, 1, 0, 0.5529412, 1,
1.510387, -0.1853282, 0.07471062, 1, 0, 0.5450981, 1,
1.522053, -0.09446047, 1.608903, 1, 0, 0.5411765, 1,
1.525207, -0.4364987, 0.9733638, 1, 0, 0.5333334, 1,
1.527885, -0.6057473, 3.544393, 1, 0, 0.5294118, 1,
1.529882, -1.282038, 3.032308, 1, 0, 0.5215687, 1,
1.539157, -0.2697873, 1.93173, 1, 0, 0.5176471, 1,
1.546099, 1.189471, 1.164909, 1, 0, 0.509804, 1,
1.547024, 0.7623713, 0.7389699, 1, 0, 0.5058824, 1,
1.547037, 0.6290907, 0.6160102, 1, 0, 0.4980392, 1,
1.547279, 2.110046, 1.44252, 1, 0, 0.4901961, 1,
1.55848, 0.4054591, 2.114777, 1, 0, 0.4862745, 1,
1.55954, -0.4381757, 2.187958, 1, 0, 0.4784314, 1,
1.560221, 0.7591719, 0.9408743, 1, 0, 0.4745098, 1,
1.560581, 1.958503, 1.62558, 1, 0, 0.4666667, 1,
1.564515, 1.599262, 1.670045, 1, 0, 0.4627451, 1,
1.571907, -0.7633813, 0.475654, 1, 0, 0.454902, 1,
1.573862, -0.5714237, 2.35291, 1, 0, 0.4509804, 1,
1.591626, 0.9062129, 0.03883122, 1, 0, 0.4431373, 1,
1.595904, -1.299786, 2.697278, 1, 0, 0.4392157, 1,
1.599779, -2.723791, 3.814727, 1, 0, 0.4313726, 1,
1.607557, 0.50476, 1.295887, 1, 0, 0.427451, 1,
1.609111, 0.6592384, 1.971072, 1, 0, 0.4196078, 1,
1.614999, 0.3064871, 0.4913056, 1, 0, 0.4156863, 1,
1.622943, -0.2874892, 0.003865506, 1, 0, 0.4078431, 1,
1.624934, -0.1573968, 4.362848, 1, 0, 0.4039216, 1,
1.637964, -0.01590207, 0.4633863, 1, 0, 0.3960784, 1,
1.640236, -2.284904, 0.8367103, 1, 0, 0.3882353, 1,
1.647296, -1.351291, 2.007431, 1, 0, 0.3843137, 1,
1.650224, -2.004395, 2.981182, 1, 0, 0.3764706, 1,
1.657827, -1.234232, 2.087799, 1, 0, 0.372549, 1,
1.658811, 0.3034811, 1.550054, 1, 0, 0.3647059, 1,
1.660669, 0.07657129, 0.7083622, 1, 0, 0.3607843, 1,
1.662476, 0.7238102, 2.073754, 1, 0, 0.3529412, 1,
1.668024, -0.97682, 3.454046, 1, 0, 0.3490196, 1,
1.668995, 0.2884724, -0.2289174, 1, 0, 0.3411765, 1,
1.670473, 1.380652, 1.400346, 1, 0, 0.3372549, 1,
1.689755, -0.1953778, 3.02231, 1, 0, 0.3294118, 1,
1.691528, 0.3862266, 1.19005, 1, 0, 0.3254902, 1,
1.729208, -0.6539756, 0.7864742, 1, 0, 0.3176471, 1,
1.734053, 1.609641, 1.850021, 1, 0, 0.3137255, 1,
1.738108, 0.4097081, 0.3712625, 1, 0, 0.3058824, 1,
1.750746, 0.197299, 0.2405079, 1, 0, 0.2980392, 1,
1.756707, -0.4552718, 1.773052, 1, 0, 0.2941177, 1,
1.763618, 0.8846833, 2.543516, 1, 0, 0.2862745, 1,
1.791324, -0.5365112, 1.790986, 1, 0, 0.282353, 1,
1.868372, -0.3368226, 1.543285, 1, 0, 0.2745098, 1,
1.870824, 1.058702, -0.01596762, 1, 0, 0.2705882, 1,
1.902784, -0.6969423, 1.623945, 1, 0, 0.2627451, 1,
1.925434, 0.03723044, 1.631273, 1, 0, 0.2588235, 1,
1.939831, -1.577267, 0.7482708, 1, 0, 0.2509804, 1,
1.941396, -0.7551394, 1.29179, 1, 0, 0.2470588, 1,
1.955092, -0.2633214, 1.142879, 1, 0, 0.2392157, 1,
1.970442, 0.5407909, 1.390267, 1, 0, 0.2352941, 1,
2.013409, -0.4610661, 3.167469, 1, 0, 0.227451, 1,
2.023862, 1.370274, 0.7890038, 1, 0, 0.2235294, 1,
2.026874, -1.090216, 1.732523, 1, 0, 0.2156863, 1,
2.046096, -1.383081, 1.652032, 1, 0, 0.2117647, 1,
2.049708, -1.312476, 3.942101, 1, 0, 0.2039216, 1,
2.062321, -1.665716, 2.769076, 1, 0, 0.1960784, 1,
2.066792, -1.279601, 2.23766, 1, 0, 0.1921569, 1,
2.072884, -0.113132, 2.094939, 1, 0, 0.1843137, 1,
2.080684, 1.557902, 0.2311241, 1, 0, 0.1803922, 1,
2.109208, 0.7665204, 0.6858445, 1, 0, 0.172549, 1,
2.112193, 0.5217828, 1.449516, 1, 0, 0.1686275, 1,
2.134094, -0.2049867, 3.119878, 1, 0, 0.1607843, 1,
2.144658, 0.4951674, 1.620647, 1, 0, 0.1568628, 1,
2.186653, -1.92706, 3.164913, 1, 0, 0.1490196, 1,
2.195918, -1.555508, 1.749348, 1, 0, 0.145098, 1,
2.209782, 0.8904483, 0.8461297, 1, 0, 0.1372549, 1,
2.21709, -0.6277378, 0.3624445, 1, 0, 0.1333333, 1,
2.218947, -0.735531, -0.173564, 1, 0, 0.1254902, 1,
2.226901, 0.2316126, 1.20726, 1, 0, 0.1215686, 1,
2.253536, -1.040271, 1.240151, 1, 0, 0.1137255, 1,
2.259789, -0.1696112, 2.301559, 1, 0, 0.1098039, 1,
2.270052, 0.1968086, 3.131285, 1, 0, 0.1019608, 1,
2.277462, -0.8119488, 1.790349, 1, 0, 0.09411765, 1,
2.288639, -0.06367692, 2.447941, 1, 0, 0.09019608, 1,
2.31806, 0.2157291, 1.999861, 1, 0, 0.08235294, 1,
2.319867, 1.474681, 1.727809, 1, 0, 0.07843138, 1,
2.325598, 2.183302, 0.5462467, 1, 0, 0.07058824, 1,
2.328501, -1.006945, 2.774441, 1, 0, 0.06666667, 1,
2.335206, 3.523722, -0.4993486, 1, 0, 0.05882353, 1,
2.342762, -0.9555291, 3.924537, 1, 0, 0.05490196, 1,
2.357548, -0.1479065, 2.131095, 1, 0, 0.04705882, 1,
2.38043, 2.093861, 1.174663, 1, 0, 0.04313726, 1,
2.44848, -0.6221957, 2.403437, 1, 0, 0.03529412, 1,
2.661051, 0.7332606, 0.2771404, 1, 0, 0.03137255, 1,
2.678865, -0.1846855, 1.21381, 1, 0, 0.02352941, 1,
2.702482, 0.9783522, 1.819697, 1, 0, 0.01960784, 1,
2.871535, 0.7972167, 0.5021992, 1, 0, 0.01176471, 1,
3.282678, 2.097615, -0.6054271, 1, 0, 0.007843138, 1
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
0.1209401, -4.244212, -7.293687, 0, -0.5, 0.5, 0.5,
0.1209401, -4.244212, -7.293687, 1, -0.5, 0.5, 0.5,
0.1209401, -4.244212, -7.293687, 1, 1.5, 0.5, 0.5,
0.1209401, -4.244212, -7.293687, 0, 1.5, 0.5, 0.5
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
-4.112627, 0.2026731, -7.293687, 0, -0.5, 0.5, 0.5,
-4.112627, 0.2026731, -7.293687, 1, -0.5, 0.5, 0.5,
-4.112627, 0.2026731, -7.293687, 1, 1.5, 0.5, 0.5,
-4.112627, 0.2026731, -7.293687, 0, 1.5, 0.5, 0.5
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
-4.112627, -4.244212, -0.205863, 0, -0.5, 0.5, 0.5,
-4.112627, -4.244212, -0.205863, 1, -0.5, 0.5, 0.5,
-4.112627, -4.244212, -0.205863, 1, 1.5, 0.5, 0.5,
-4.112627, -4.244212, -0.205863, 0, 1.5, 0.5, 0.5
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
-3, -3.218008, -5.658035,
3, -3.218008, -5.658035,
-3, -3.218008, -5.658035,
-3, -3.389041, -5.930644,
-2, -3.218008, -5.658035,
-2, -3.389041, -5.930644,
-1, -3.218008, -5.658035,
-1, -3.389041, -5.930644,
0, -3.218008, -5.658035,
0, -3.389041, -5.930644,
1, -3.218008, -5.658035,
1, -3.389041, -5.930644,
2, -3.218008, -5.658035,
2, -3.389041, -5.930644,
3, -3.218008, -5.658035,
3, -3.389041, -5.930644
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
-3, -3.73111, -6.475861, 0, -0.5, 0.5, 0.5,
-3, -3.73111, -6.475861, 1, -0.5, 0.5, 0.5,
-3, -3.73111, -6.475861, 1, 1.5, 0.5, 0.5,
-3, -3.73111, -6.475861, 0, 1.5, 0.5, 0.5,
-2, -3.73111, -6.475861, 0, -0.5, 0.5, 0.5,
-2, -3.73111, -6.475861, 1, -0.5, 0.5, 0.5,
-2, -3.73111, -6.475861, 1, 1.5, 0.5, 0.5,
-2, -3.73111, -6.475861, 0, 1.5, 0.5, 0.5,
-1, -3.73111, -6.475861, 0, -0.5, 0.5, 0.5,
-1, -3.73111, -6.475861, 1, -0.5, 0.5, 0.5,
-1, -3.73111, -6.475861, 1, 1.5, 0.5, 0.5,
-1, -3.73111, -6.475861, 0, 1.5, 0.5, 0.5,
0, -3.73111, -6.475861, 0, -0.5, 0.5, 0.5,
0, -3.73111, -6.475861, 1, -0.5, 0.5, 0.5,
0, -3.73111, -6.475861, 1, 1.5, 0.5, 0.5,
0, -3.73111, -6.475861, 0, 1.5, 0.5, 0.5,
1, -3.73111, -6.475861, 0, -0.5, 0.5, 0.5,
1, -3.73111, -6.475861, 1, -0.5, 0.5, 0.5,
1, -3.73111, -6.475861, 1, 1.5, 0.5, 0.5,
1, -3.73111, -6.475861, 0, 1.5, 0.5, 0.5,
2, -3.73111, -6.475861, 0, -0.5, 0.5, 0.5,
2, -3.73111, -6.475861, 1, -0.5, 0.5, 0.5,
2, -3.73111, -6.475861, 1, 1.5, 0.5, 0.5,
2, -3.73111, -6.475861, 0, 1.5, 0.5, 0.5,
3, -3.73111, -6.475861, 0, -0.5, 0.5, 0.5,
3, -3.73111, -6.475861, 1, -0.5, 0.5, 0.5,
3, -3.73111, -6.475861, 1, 1.5, 0.5, 0.5,
3, -3.73111, -6.475861, 0, 1.5, 0.5, 0.5
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
-3.13565, -3, -5.658035,
-3.13565, 3, -5.658035,
-3.13565, -3, -5.658035,
-3.29848, -3, -5.930644,
-3.13565, -2, -5.658035,
-3.29848, -2, -5.930644,
-3.13565, -1, -5.658035,
-3.29848, -1, -5.930644,
-3.13565, 0, -5.658035,
-3.29848, 0, -5.930644,
-3.13565, 1, -5.658035,
-3.29848, 1, -5.930644,
-3.13565, 2, -5.658035,
-3.29848, 2, -5.930644,
-3.13565, 3, -5.658035,
-3.29848, 3, -5.930644
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
-3.624139, -3, -6.475861, 0, -0.5, 0.5, 0.5,
-3.624139, -3, -6.475861, 1, -0.5, 0.5, 0.5,
-3.624139, -3, -6.475861, 1, 1.5, 0.5, 0.5,
-3.624139, -3, -6.475861, 0, 1.5, 0.5, 0.5,
-3.624139, -2, -6.475861, 0, -0.5, 0.5, 0.5,
-3.624139, -2, -6.475861, 1, -0.5, 0.5, 0.5,
-3.624139, -2, -6.475861, 1, 1.5, 0.5, 0.5,
-3.624139, -2, -6.475861, 0, 1.5, 0.5, 0.5,
-3.624139, -1, -6.475861, 0, -0.5, 0.5, 0.5,
-3.624139, -1, -6.475861, 1, -0.5, 0.5, 0.5,
-3.624139, -1, -6.475861, 1, 1.5, 0.5, 0.5,
-3.624139, -1, -6.475861, 0, 1.5, 0.5, 0.5,
-3.624139, 0, -6.475861, 0, -0.5, 0.5, 0.5,
-3.624139, 0, -6.475861, 1, -0.5, 0.5, 0.5,
-3.624139, 0, -6.475861, 1, 1.5, 0.5, 0.5,
-3.624139, 0, -6.475861, 0, 1.5, 0.5, 0.5,
-3.624139, 1, -6.475861, 0, -0.5, 0.5, 0.5,
-3.624139, 1, -6.475861, 1, -0.5, 0.5, 0.5,
-3.624139, 1, -6.475861, 1, 1.5, 0.5, 0.5,
-3.624139, 1, -6.475861, 0, 1.5, 0.5, 0.5,
-3.624139, 2, -6.475861, 0, -0.5, 0.5, 0.5,
-3.624139, 2, -6.475861, 1, -0.5, 0.5, 0.5,
-3.624139, 2, -6.475861, 1, 1.5, 0.5, 0.5,
-3.624139, 2, -6.475861, 0, 1.5, 0.5, 0.5,
-3.624139, 3, -6.475861, 0, -0.5, 0.5, 0.5,
-3.624139, 3, -6.475861, 1, -0.5, 0.5, 0.5,
-3.624139, 3, -6.475861, 1, 1.5, 0.5, 0.5,
-3.624139, 3, -6.475861, 0, 1.5, 0.5, 0.5
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
-3.13565, -3.218008, -4,
-3.13565, -3.218008, 4,
-3.13565, -3.218008, -4,
-3.29848, -3.389041, -4,
-3.13565, -3.218008, -2,
-3.29848, -3.389041, -2,
-3.13565, -3.218008, 0,
-3.29848, -3.389041, 0,
-3.13565, -3.218008, 2,
-3.29848, -3.389041, 2,
-3.13565, -3.218008, 4,
-3.29848, -3.389041, 4
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
-3.624139, -3.73111, -4, 0, -0.5, 0.5, 0.5,
-3.624139, -3.73111, -4, 1, -0.5, 0.5, 0.5,
-3.624139, -3.73111, -4, 1, 1.5, 0.5, 0.5,
-3.624139, -3.73111, -4, 0, 1.5, 0.5, 0.5,
-3.624139, -3.73111, -2, 0, -0.5, 0.5, 0.5,
-3.624139, -3.73111, -2, 1, -0.5, 0.5, 0.5,
-3.624139, -3.73111, -2, 1, 1.5, 0.5, 0.5,
-3.624139, -3.73111, -2, 0, 1.5, 0.5, 0.5,
-3.624139, -3.73111, 0, 0, -0.5, 0.5, 0.5,
-3.624139, -3.73111, 0, 1, -0.5, 0.5, 0.5,
-3.624139, -3.73111, 0, 1, 1.5, 0.5, 0.5,
-3.624139, -3.73111, 0, 0, 1.5, 0.5, 0.5,
-3.624139, -3.73111, 2, 0, -0.5, 0.5, 0.5,
-3.624139, -3.73111, 2, 1, -0.5, 0.5, 0.5,
-3.624139, -3.73111, 2, 1, 1.5, 0.5, 0.5,
-3.624139, -3.73111, 2, 0, 1.5, 0.5, 0.5,
-3.624139, -3.73111, 4, 0, -0.5, 0.5, 0.5,
-3.624139, -3.73111, 4, 1, -0.5, 0.5, 0.5,
-3.624139, -3.73111, 4, 1, 1.5, 0.5, 0.5,
-3.624139, -3.73111, 4, 0, 1.5, 0.5, 0.5
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
-3.13565, -3.218008, -5.658035,
-3.13565, 3.623354, -5.658035,
-3.13565, -3.218008, 5.246309,
-3.13565, 3.623354, 5.246309,
-3.13565, -3.218008, -5.658035,
-3.13565, -3.218008, 5.246309,
-3.13565, 3.623354, -5.658035,
-3.13565, 3.623354, 5.246309,
-3.13565, -3.218008, -5.658035,
3.37753, -3.218008, -5.658035,
-3.13565, -3.218008, 5.246309,
3.37753, -3.218008, 5.246309,
-3.13565, 3.623354, -5.658035,
3.37753, 3.623354, -5.658035,
-3.13565, 3.623354, 5.246309,
3.37753, 3.623354, 5.246309,
3.37753, -3.218008, -5.658035,
3.37753, 3.623354, -5.658035,
3.37753, -3.218008, 5.246309,
3.37753, 3.623354, 5.246309,
3.37753, -3.218008, -5.658035,
3.37753, -3.218008, 5.246309,
3.37753, 3.623354, -5.658035,
3.37753, 3.623354, 5.246309
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
var radius = 7.703592;
var distance = 34.27415;
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
mvMatrix.translate( -0.1209401, -0.2026731, 0.205863 );
mvMatrix.scale( 1.278834, 1.217488, 0.7638492 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.27415);
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
DDT<-read.table("DDT.xyz")
```

```
## Error in read.table("DDT.xyz"): no lines available in input
```

```r
x<-DDT$V2
```

```
## Error in eval(expr, envir, enclos): object 'DDT' not found
```

```r
y<-DDT$V3
```

```
## Error in eval(expr, envir, enclos): object 'DDT' not found
```

```r
z<-DDT$V4
```

```
## Error in eval(expr, envir, enclos): object 'DDT' not found
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
-3.040798, 1.960179, -0.5137113, 0, 0, 1, 1, 1,
-2.78728, 1.047359, -2.207526, 1, 0, 0, 1, 1,
-2.614473, -0.3893211, -2.231064, 1, 0, 0, 1, 1,
-2.58608, -1.471691, -2.063429, 1, 0, 0, 1, 1,
-2.527661, 0.5063749, -1.012488, 1, 0, 0, 1, 1,
-2.512542, -0.03751708, -1.708767, 1, 0, 0, 1, 1,
-2.459146, -0.6140658, -2.020162, 0, 0, 0, 1, 1,
-2.424773, 0.4535109, -4.718097, 0, 0, 0, 1, 1,
-2.39825, -0.6532458, -1.477705, 0, 0, 0, 1, 1,
-2.396449, -0.845251, -0.75269, 0, 0, 0, 1, 1,
-2.390271, -0.3010479, -2.673166, 0, 0, 0, 1, 1,
-2.356925, -1.856105, -1.516234, 0, 0, 0, 1, 1,
-2.311373, -0.1351568, -1.402717, 0, 0, 0, 1, 1,
-2.263655, -0.5960578, -1.297846, 1, 1, 1, 1, 1,
-2.250138, -1.29599, -1.327706, 1, 1, 1, 1, 1,
-2.249825, -0.9896116, -1.414525, 1, 1, 1, 1, 1,
-2.128539, 1.086913, -1.162592, 1, 1, 1, 1, 1,
-2.120988, 1.082696, -2.483786, 1, 1, 1, 1, 1,
-2.041798, -1.28118, -1.902214, 1, 1, 1, 1, 1,
-2.009855, -1.307492, -3.705385, 1, 1, 1, 1, 1,
-2.005188, -1.075932, -2.138175, 1, 1, 1, 1, 1,
-1.950426, 0.1603656, 0.4003619, 1, 1, 1, 1, 1,
-1.933207, -2.256423, -3.256108, 1, 1, 1, 1, 1,
-1.914668, 0.5570729, -0.3555708, 1, 1, 1, 1, 1,
-1.882632, -0.9357294, -3.252882, 1, 1, 1, 1, 1,
-1.868424, 1.629454, -0.9649669, 1, 1, 1, 1, 1,
-1.859472, 0.4659204, -1.296562, 1, 1, 1, 1, 1,
-1.850906, 0.2573174, -1.992662, 1, 1, 1, 1, 1,
-1.842233, 0.5743505, -0.2052508, 0, 0, 1, 1, 1,
-1.837272, -0.4267345, -2.805083, 1, 0, 0, 1, 1,
-1.791282, -2.13135, -2.192428, 1, 0, 0, 1, 1,
-1.790908, -2.040818, -2.399746, 1, 0, 0, 1, 1,
-1.776471, 1.431648, -1.528418, 1, 0, 0, 1, 1,
-1.767966, -1.093558, -1.398546, 1, 0, 0, 1, 1,
-1.755776, -0.04698255, -3.373717, 0, 0, 0, 1, 1,
-1.754698, -0.02577136, -0.7588013, 0, 0, 0, 1, 1,
-1.751457, -0.467627, -2.165695, 0, 0, 0, 1, 1,
-1.737394, -0.520447, -3.530663, 0, 0, 0, 1, 1,
-1.718299, 0.1736199, -2.008031, 0, 0, 0, 1, 1,
-1.702923, 0.2973422, -1.685594, 0, 0, 0, 1, 1,
-1.683343, 1.335874, 2.418548, 0, 0, 0, 1, 1,
-1.669068, 0.5516099, -1.215696, 1, 1, 1, 1, 1,
-1.64321, 0.2765471, -0.4807356, 1, 1, 1, 1, 1,
-1.638037, -1.981009, -2.116917, 1, 1, 1, 1, 1,
-1.633755, 0.8339885, -0.2791325, 1, 1, 1, 1, 1,
-1.629744, -0.0210415, -1.850022, 1, 1, 1, 1, 1,
-1.624088, 0.2299219, -0.05703409, 1, 1, 1, 1, 1,
-1.620862, -1.123057, -1.957618, 1, 1, 1, 1, 1,
-1.617481, -0.7248534, -1.597437, 1, 1, 1, 1, 1,
-1.61125, -1.268385, -3.168172, 1, 1, 1, 1, 1,
-1.606128, 0.6929573, -1.039396, 1, 1, 1, 1, 1,
-1.604457, -0.5965715, -2.177991, 1, 1, 1, 1, 1,
-1.596215, 0.5050735, -1.583202, 1, 1, 1, 1, 1,
-1.585469, -2.075386, -2.350274, 1, 1, 1, 1, 1,
-1.54993, 0.2313021, -2.887413, 1, 1, 1, 1, 1,
-1.544924, -1.500828, -4.209399, 1, 1, 1, 1, 1,
-1.523794, 0.1743932, -1.130443, 0, 0, 1, 1, 1,
-1.521586, 0.8946124, -0.6458545, 1, 0, 0, 1, 1,
-1.513473, -0.4177907, -1.099793, 1, 0, 0, 1, 1,
-1.499564, -0.8186813, -1.212076, 1, 0, 0, 1, 1,
-1.493299, -0.6735421, -3.068789, 1, 0, 0, 1, 1,
-1.488128, 0.1003094, -2.16247, 1, 0, 0, 1, 1,
-1.476988, -0.8655009, -3.920677, 0, 0, 0, 1, 1,
-1.456225, 0.6034573, -0.990096, 0, 0, 0, 1, 1,
-1.455659, 0.1131282, -0.9606584, 0, 0, 0, 1, 1,
-1.45177, -0.1613742, -0.9441792, 0, 0, 0, 1, 1,
-1.431556, -0.1738899, -3.835459, 0, 0, 0, 1, 1,
-1.426116, -0.5160611, -2.162889, 0, 0, 0, 1, 1,
-1.424946, 0.8956611, -2.982089, 0, 0, 0, 1, 1,
-1.420123, 0.4480751, -1.599701, 1, 1, 1, 1, 1,
-1.419773, 0.04049249, -3.33158, 1, 1, 1, 1, 1,
-1.413395, 0.01966075, -1.112219, 1, 1, 1, 1, 1,
-1.39731, 1.066496, -0.2091806, 1, 1, 1, 1, 1,
-1.393973, -0.5566513, -2.974296, 1, 1, 1, 1, 1,
-1.392043, -0.3702857, -4.177665, 1, 1, 1, 1, 1,
-1.388335, 0.2984436, -1.494434, 1, 1, 1, 1, 1,
-1.382538, -0.04221658, -2.574324, 1, 1, 1, 1, 1,
-1.367848, -1.368555, -3.047783, 1, 1, 1, 1, 1,
-1.362232, 0.2468442, -1.376797, 1, 1, 1, 1, 1,
-1.361783, -0.2616336, -0.8529657, 1, 1, 1, 1, 1,
-1.358599, -0.1141959, -1.523563, 1, 1, 1, 1, 1,
-1.349673, 0.7918203, -0.1434297, 1, 1, 1, 1, 1,
-1.344017, 1.501022, -0.5777352, 1, 1, 1, 1, 1,
-1.312493, 0.3864549, -2.506564, 1, 1, 1, 1, 1,
-1.307978, -0.2977295, -1.488737, 0, 0, 1, 1, 1,
-1.305476, 0.7055026, 0.1969489, 1, 0, 0, 1, 1,
-1.304291, -0.8154982, -2.786247, 1, 0, 0, 1, 1,
-1.298262, -1.796346, -1.087651, 1, 0, 0, 1, 1,
-1.274074, -0.6431368, -0.7402454, 1, 0, 0, 1, 1,
-1.262453, 0.3450946, -0.3131381, 1, 0, 0, 1, 1,
-1.261799, 0.2991405, -0.2947115, 0, 0, 0, 1, 1,
-1.244168, 0.5698181, -1.956893, 0, 0, 0, 1, 1,
-1.228058, -0.5467522, -3.124332, 0, 0, 0, 1, 1,
-1.217074, -1.525203, -0.7561338, 0, 0, 0, 1, 1,
-1.198823, 2.012086, -1.984194, 0, 0, 0, 1, 1,
-1.198796, 0.1110729, -1.664204, 0, 0, 0, 1, 1,
-1.198436, -0.5191063, -2.756101, 0, 0, 0, 1, 1,
-1.196168, 0.2901096, 0.7804241, 1, 1, 1, 1, 1,
-1.19084, 0.954919, -0.5362003, 1, 1, 1, 1, 1,
-1.183176, 0.4475516, -1.438298, 1, 1, 1, 1, 1,
-1.169879, -1.392932, -0.9703868, 1, 1, 1, 1, 1,
-1.162881, 0.2776917, -1.714367, 1, 1, 1, 1, 1,
-1.157204, -0.3837125, -1.467238, 1, 1, 1, 1, 1,
-1.150831, -0.4347116, -0.03698038, 1, 1, 1, 1, 1,
-1.143929, -0.2888515, -1.932558, 1, 1, 1, 1, 1,
-1.136427, -0.2813341, -1.436929, 1, 1, 1, 1, 1,
-1.131698, 1.231233, 0.5811918, 1, 1, 1, 1, 1,
-1.128963, -1.745814, -1.814912, 1, 1, 1, 1, 1,
-1.128218, -1.469284, -0.7552957, 1, 1, 1, 1, 1,
-1.12781, 0.2939948, -1.592139, 1, 1, 1, 1, 1,
-1.119785, 0.3718143, 0.8154899, 1, 1, 1, 1, 1,
-1.119453, -0.3085329, -1.22382, 1, 1, 1, 1, 1,
-1.115389, 0.883543, -1.379745, 0, 0, 1, 1, 1,
-1.109508, -1.847322, -3.229194, 1, 0, 0, 1, 1,
-1.107402, 0.6487764, -1.38054, 1, 0, 0, 1, 1,
-1.102325, 0.6340998, 1.743931, 1, 0, 0, 1, 1,
-1.093954, 0.03422229, -0.3273937, 1, 0, 0, 1, 1,
-1.093794, 0.815254, -0.7977396, 1, 0, 0, 1, 1,
-1.092626, 1.284033, -0.9833723, 0, 0, 0, 1, 1,
-1.089849, 1.512443, -2.561275, 0, 0, 0, 1, 1,
-1.079413, -1.855123, -2.811857, 0, 0, 0, 1, 1,
-1.078359, -1.560208, -2.139874, 0, 0, 0, 1, 1,
-1.075247, 0.09243351, -2.863247, 0, 0, 0, 1, 1,
-1.074164, -1.5945, -2.904735, 0, 0, 0, 1, 1,
-1.072727, -0.1014782, -3.580138, 0, 0, 0, 1, 1,
-1.061106, 1.05074, 0.3013117, 1, 1, 1, 1, 1,
-1.059803, 1.081543, -1.663315, 1, 1, 1, 1, 1,
-1.0434, -0.2082676, -2.277841, 1, 1, 1, 1, 1,
-1.037444, 0.6398694, -1.09393, 1, 1, 1, 1, 1,
-1.034115, -0.1379256, -0.2944606, 1, 1, 1, 1, 1,
-1.021754, -0.8792977, -4.759078, 1, 1, 1, 1, 1,
-1.019484, -0.4143141, -0.7449057, 1, 1, 1, 1, 1,
-1.019295, -2.011358, -3.055922, 1, 1, 1, 1, 1,
-1.007686, 0.4583831, -2.804592, 1, 1, 1, 1, 1,
-0.9986231, -1.058754, -2.258652, 1, 1, 1, 1, 1,
-0.9978537, -0.4031686, -2.582313, 1, 1, 1, 1, 1,
-0.997409, 0.4174602, -2.124899, 1, 1, 1, 1, 1,
-0.9973789, -0.04604023, -2.040254, 1, 1, 1, 1, 1,
-0.9956469, -1.235692, -1.948158, 1, 1, 1, 1, 1,
-0.9933914, -0.3517303, -3.229722, 1, 1, 1, 1, 1,
-0.992189, 0.5681615, -0.5437365, 0, 0, 1, 1, 1,
-0.9846646, 0.8739396, -1.060409, 1, 0, 0, 1, 1,
-0.9799861, 1.67503, 0.2775502, 1, 0, 0, 1, 1,
-0.977213, -0.1889765, -2.206172, 1, 0, 0, 1, 1,
-0.9769499, 0.5205702, 0.3533534, 1, 0, 0, 1, 1,
-0.9736026, 1.098737, -0.6409875, 1, 0, 0, 1, 1,
-0.9729761, 0.219231, -3.487662, 0, 0, 0, 1, 1,
-0.9700924, -0.1183174, -1.40605, 0, 0, 0, 1, 1,
-0.9654428, 0.7484732, -1.261573, 0, 0, 0, 1, 1,
-0.9640878, 1.6186, 0.1319662, 0, 0, 0, 1, 1,
-0.9560877, -1.814192, -1.254647, 0, 0, 0, 1, 1,
-0.9438807, -1.05125, -3.797007, 0, 0, 0, 1, 1,
-0.9352891, -1.049595, -2.938363, 0, 0, 0, 1, 1,
-0.9200828, 1.183541, -1.646103, 1, 1, 1, 1, 1,
-0.9186615, 1.653008, -0.7917349, 1, 1, 1, 1, 1,
-0.9165523, 0.3422869, -0.8605444, 1, 1, 1, 1, 1,
-0.916173, -0.5017787, -1.070299, 1, 1, 1, 1, 1,
-0.914651, 0.6908579, -1.781569, 1, 1, 1, 1, 1,
-0.910129, -0.4244264, -4.359932, 1, 1, 1, 1, 1,
-0.9021087, 0.03276074, 0.6592223, 1, 1, 1, 1, 1,
-0.9013358, -0.5427561, -2.073209, 1, 1, 1, 1, 1,
-0.9000747, -0.4591865, -0.2764852, 1, 1, 1, 1, 1,
-0.8964137, -0.3971124, -2.423996, 1, 1, 1, 1, 1,
-0.8815148, -0.8940102, -1.337299, 1, 1, 1, 1, 1,
-0.8805685, 0.09455319, -2.990065, 1, 1, 1, 1, 1,
-0.8785446, 0.4205226, -1.231703, 1, 1, 1, 1, 1,
-0.878535, -0.9179773, -2.928208, 1, 1, 1, 1, 1,
-0.8785248, 1.687063, -1.189744, 1, 1, 1, 1, 1,
-0.8769217, -0.282008, -0.03874818, 0, 0, 1, 1, 1,
-0.8730771, 0.8479413, -1.24866, 1, 0, 0, 1, 1,
-0.8693618, -0.9384162, -2.448986, 1, 0, 0, 1, 1,
-0.8577554, 0.1639517, -0.05254639, 1, 0, 0, 1, 1,
-0.8576115, -0.8319546, -2.238581, 1, 0, 0, 1, 1,
-0.857424, 0.05323528, -0.01277897, 1, 0, 0, 1, 1,
-0.8532206, 0.296457, -0.5822242, 0, 0, 0, 1, 1,
-0.848398, -1.485988, -3.108717, 0, 0, 0, 1, 1,
-0.8383355, -1.282615, -2.44888, 0, 0, 0, 1, 1,
-0.8383001, 1.038846, -1.101036, 0, 0, 0, 1, 1,
-0.8358657, -0.353949, -1.648231, 0, 0, 0, 1, 1,
-0.8345244, 0.704141, -1.068571, 0, 0, 0, 1, 1,
-0.8330009, 0.2166674, -1.589005, 0, 0, 0, 1, 1,
-0.8309993, 0.7537005, 1.060757, 1, 1, 1, 1, 1,
-0.8249186, -0.642993, -1.239767, 1, 1, 1, 1, 1,
-0.8227407, -0.5073101, -3.10123, 1, 1, 1, 1, 1,
-0.8218976, 1.978185, -0.1896521, 1, 1, 1, 1, 1,
-0.8181482, 0.4604522, -0.05011903, 1, 1, 1, 1, 1,
-0.8167443, 1.112727, -0.7549492, 1, 1, 1, 1, 1,
-0.8161651, 0.8649979, 0.3047664, 1, 1, 1, 1, 1,
-0.8121865, 1.293955, -1.416408, 1, 1, 1, 1, 1,
-0.8110594, 0.1214081, -1.159691, 1, 1, 1, 1, 1,
-0.809504, 0.3140486, -0.9597619, 1, 1, 1, 1, 1,
-0.807462, -0.9895741, -2.495035, 1, 1, 1, 1, 1,
-0.794411, 0.9489226, -0.5833433, 1, 1, 1, 1, 1,
-0.7933094, 1.312287, 0.2142574, 1, 1, 1, 1, 1,
-0.7903528, 0.2491703, -2.703739, 1, 1, 1, 1, 1,
-0.7901507, -1.085833, -1.720086, 1, 1, 1, 1, 1,
-0.785451, 0.6190999, -0.6006156, 0, 0, 1, 1, 1,
-0.7826488, -1.018221, -3.460494, 1, 0, 0, 1, 1,
-0.7795759, -1.195389, -1.587214, 1, 0, 0, 1, 1,
-0.7773776, -0.6425627, -1.926141, 1, 0, 0, 1, 1,
-0.7757962, 0.02049424, -1.609962, 1, 0, 0, 1, 1,
-0.7755641, 1.183586, -0.9685871, 1, 0, 0, 1, 1,
-0.7617071, -2.264493, -4.580633, 0, 0, 0, 1, 1,
-0.7577956, -0.4624252, -1.342819, 0, 0, 0, 1, 1,
-0.7574372, -0.9649611, -1.374624, 0, 0, 0, 1, 1,
-0.749393, -0.4397331, -1.751109, 0, 0, 0, 1, 1,
-0.7456034, 0.1961562, -2.224605, 0, 0, 0, 1, 1,
-0.7450833, -1.075225, -1.053012, 0, 0, 0, 1, 1,
-0.7392895, -1.264642, -2.682419, 0, 0, 0, 1, 1,
-0.7289414, 0.4141075, -1.919934, 1, 1, 1, 1, 1,
-0.7281409, -0.6836561, -2.109305, 1, 1, 1, 1, 1,
-0.7204138, -0.9542437, -1.470972, 1, 1, 1, 1, 1,
-0.7170442, -0.2141179, -2.586257, 1, 1, 1, 1, 1,
-0.715582, -0.01602159, -2.13913, 1, 1, 1, 1, 1,
-0.7110748, 0.1225549, -2.674087, 1, 1, 1, 1, 1,
-0.707902, 0.4927602, 0.1027677, 1, 1, 1, 1, 1,
-0.7044286, -1.679171, -3.225599, 1, 1, 1, 1, 1,
-0.6977172, -1.057501, -2.23209, 1, 1, 1, 1, 1,
-0.6955894, -0.7977313, -1.458043, 1, 1, 1, 1, 1,
-0.6921148, 1.129924, 0.4363975, 1, 1, 1, 1, 1,
-0.6827278, -0.3163844, -2.034574, 1, 1, 1, 1, 1,
-0.6730214, 1.318594, -0.130658, 1, 1, 1, 1, 1,
-0.6714939, -1.806229, -4.027239, 1, 1, 1, 1, 1,
-0.6703267, 0.3154614, -0.1850822, 1, 1, 1, 1, 1,
-0.6688016, 0.2008968, -0.9496769, 0, 0, 1, 1, 1,
-0.6674393, 0.9809676, -0.3843343, 1, 0, 0, 1, 1,
-0.6667851, -2.01121, -3.198745, 1, 0, 0, 1, 1,
-0.6656712, 0.1117249, -1.494616, 1, 0, 0, 1, 1,
-0.6631283, -1.752673, -2.717136, 1, 0, 0, 1, 1,
-0.6628827, -1.834663, -2.207847, 1, 0, 0, 1, 1,
-0.6521574, 0.8740051, 0.02575196, 0, 0, 0, 1, 1,
-0.6505834, -0.007829206, -1.636275, 0, 0, 0, 1, 1,
-0.6497736, -0.1792406, -3.048966, 0, 0, 0, 1, 1,
-0.6444224, -3.118376, -3.444601, 0, 0, 0, 1, 1,
-0.6422656, 0.6433606, -0.3527431, 0, 0, 0, 1, 1,
-0.6411433, -0.1030315, -1.511488, 0, 0, 0, 1, 1,
-0.6404777, -0.7920784, -3.601584, 0, 0, 0, 1, 1,
-0.6404496, 1.289365, 0.496211, 1, 1, 1, 1, 1,
-0.6391931, -2.797363, -2.875731, 1, 1, 1, 1, 1,
-0.6373908, -0.8961357, -1.221241, 1, 1, 1, 1, 1,
-0.6365349, -0.0305383, -2.399367, 1, 1, 1, 1, 1,
-0.632544, 0.9699206, -0.2332807, 1, 1, 1, 1, 1,
-0.6305733, 0.277894, -0.3639233, 1, 1, 1, 1, 1,
-0.6298857, -0.4807047, -0.4144039, 1, 1, 1, 1, 1,
-0.6249155, -1.506765, -2.333012, 1, 1, 1, 1, 1,
-0.6192346, 0.0008758102, -2.3307, 1, 1, 1, 1, 1,
-0.6154681, 1.375772, 0.3014419, 1, 1, 1, 1, 1,
-0.6150896, 0.004563297, -0.3319653, 1, 1, 1, 1, 1,
-0.6132001, 1.219488, -2.35128, 1, 1, 1, 1, 1,
-0.6110818, -1.320696, -2.37489, 1, 1, 1, 1, 1,
-0.6092222, -0.6936939, -2.75419, 1, 1, 1, 1, 1,
-0.6062152, 0.5962885, -2.773541, 1, 1, 1, 1, 1,
-0.6012282, -0.4584143, -2.382568, 0, 0, 1, 1, 1,
-0.5974041, 0.6129183, -1.935563, 1, 0, 0, 1, 1,
-0.5944142, 0.3866931, 1.361461, 1, 0, 0, 1, 1,
-0.5854509, -0.4462391, -0.9705538, 1, 0, 0, 1, 1,
-0.5848656, 0.03379127, -1.542246, 1, 0, 0, 1, 1,
-0.5815655, -0.2572221, -1.678684, 1, 0, 0, 1, 1,
-0.5799286, -0.6783946, -2.528867, 0, 0, 0, 1, 1,
-0.5654132, 1.127913, -1.608889, 0, 0, 0, 1, 1,
-0.5651536, 0.1408532, -0.3128073, 0, 0, 0, 1, 1,
-0.5614841, -1.754662, -2.792737, 0, 0, 0, 1, 1,
-0.5609683, 0.1673037, -0.7432696, 0, 0, 0, 1, 1,
-0.5607977, 0.8972057, -0.2022224, 0, 0, 0, 1, 1,
-0.558248, 0.822939, -0.669831, 0, 0, 0, 1, 1,
-0.5573053, -0.9933806, -0.5862507, 1, 1, 1, 1, 1,
-0.5507789, 0.5602835, -0.8864526, 1, 1, 1, 1, 1,
-0.5502664, -0.2347631, -1.819301, 1, 1, 1, 1, 1,
-0.542845, 0.5517453, -0.2946361, 1, 1, 1, 1, 1,
-0.5421245, -0.8547809, -1.788581, 1, 1, 1, 1, 1,
-0.5392252, -2.752849, -5.172135, 1, 1, 1, 1, 1,
-0.5327379, 0.1610715, -1.828196, 1, 1, 1, 1, 1,
-0.5295941, 0.5709636, -1.286308, 1, 1, 1, 1, 1,
-0.5270136, -0.2585912, -1.063147, 1, 1, 1, 1, 1,
-0.5169076, 1.143647, 0.5855321, 1, 1, 1, 1, 1,
-0.515426, 0.9165893, -1.237605, 1, 1, 1, 1, 1,
-0.5133185, 0.5783303, 0.08048052, 1, 1, 1, 1, 1,
-0.5111552, -0.5915443, -0.9715063, 1, 1, 1, 1, 1,
-0.5105878, 1.136015, -0.4317305, 1, 1, 1, 1, 1,
-0.5060855, 0.6360169, 0.042312, 1, 1, 1, 1, 1,
-0.5042264, 0.3360141, 0.5622089, 0, 0, 1, 1, 1,
-0.5021591, 1.005843, 1.073798, 1, 0, 0, 1, 1,
-0.5021117, -1.594585, -3.840969, 1, 0, 0, 1, 1,
-0.5011765, 0.869015, -0.5084428, 1, 0, 0, 1, 1,
-0.4979509, 0.1797947, -0.2707959, 1, 0, 0, 1, 1,
-0.4778403, -1.017121, -1.477119, 1, 0, 0, 1, 1,
-0.4773873, 0.1370884, -1.124537, 0, 0, 0, 1, 1,
-0.4685552, -0.6302042, -2.451821, 0, 0, 0, 1, 1,
-0.4655957, 0.274123, -1.43678, 0, 0, 0, 1, 1,
-0.4652014, -0.7081246, -0.9250719, 0, 0, 0, 1, 1,
-0.4637068, 0.6190448, -0.2196075, 0, 0, 0, 1, 1,
-0.4606321, -0.159386, -1.512429, 0, 0, 0, 1, 1,
-0.4583181, 0.9996714, -1.074201, 0, 0, 0, 1, 1,
-0.4570976, -0.4879226, -2.361674, 1, 1, 1, 1, 1,
-0.4569565, 0.4010594, -0.8165143, 1, 1, 1, 1, 1,
-0.4567109, -1.757729, -1.726828, 1, 1, 1, 1, 1,
-0.4493343, -0.04762396, -0.1609969, 1, 1, 1, 1, 1,
-0.4492321, 0.3329218, -1.941236, 1, 1, 1, 1, 1,
-0.4419794, -0.005161069, -1.192798, 1, 1, 1, 1, 1,
-0.4398449, -0.5304442, -1.884136, 1, 1, 1, 1, 1,
-0.4376259, -0.6385674, -3.637433, 1, 1, 1, 1, 1,
-0.435062, 0.644601, -0.3838397, 1, 1, 1, 1, 1,
-0.4318593, 1.636886, 0.3396723, 1, 1, 1, 1, 1,
-0.4307611, 0.3032052, -0.8663511, 1, 1, 1, 1, 1,
-0.420196, -1.335311, -2.178711, 1, 1, 1, 1, 1,
-0.4196806, 0.7469053, -1.318069, 1, 1, 1, 1, 1,
-0.4108376, -0.6647743, -2.598762, 1, 1, 1, 1, 1,
-0.4083047, 1.13745, 0.5427763, 1, 1, 1, 1, 1,
-0.4056979, 0.4554991, -0.6663176, 0, 0, 1, 1, 1,
-0.4051827, -0.8176906, -2.800991, 1, 0, 0, 1, 1,
-0.4022428, 0.7043478, -1.366676, 1, 0, 0, 1, 1,
-0.4015726, -1.202538, -1.463469, 1, 0, 0, 1, 1,
-0.4011721, 0.01949594, 0.04063225, 1, 0, 0, 1, 1,
-0.3993997, 0.4264924, -2.002376, 1, 0, 0, 1, 1,
-0.3985251, -0.1986389, -2.336837, 0, 0, 0, 1, 1,
-0.3972159, 0.2187574, 0.05250082, 0, 0, 0, 1, 1,
-0.3966329, 1.14898, -0.4802892, 0, 0, 0, 1, 1,
-0.3909684, 0.7709304, -2.304781, 0, 0, 0, 1, 1,
-0.3865897, -1.863819, -2.955742, 0, 0, 0, 1, 1,
-0.3771394, 1.004483, -0.1833147, 0, 0, 0, 1, 1,
-0.3749134, -1.453218, -4.404128, 0, 0, 0, 1, 1,
-0.3718379, -1.723689, -2.168317, 1, 1, 1, 1, 1,
-0.3711929, -0.2048729, -1.044547, 1, 1, 1, 1, 1,
-0.3707172, -1.125438, -3.761221, 1, 1, 1, 1, 1,
-0.3706629, 1.208078, 2.118042, 1, 1, 1, 1, 1,
-0.3638242, 0.6998144, -0.5141255, 1, 1, 1, 1, 1,
-0.3624035, -0.01425668, -2.545144, 1, 1, 1, 1, 1,
-0.3608961, 1.596718, -0.1610752, 1, 1, 1, 1, 1,
-0.3526033, 1.822429, -1.913162, 1, 1, 1, 1, 1,
-0.351294, -0.653109, -2.373285, 1, 1, 1, 1, 1,
-0.3509686, -0.06771524, -2.190143, 1, 1, 1, 1, 1,
-0.3509292, 2.234838, -0.1267646, 1, 1, 1, 1, 1,
-0.3495078, 0.9874044, -1.473225, 1, 1, 1, 1, 1,
-0.3487855, -0.823732, -2.532613, 1, 1, 1, 1, 1,
-0.3464905, -0.381301, -4.143789, 1, 1, 1, 1, 1,
-0.3434477, 0.4112488, 0.007995888, 1, 1, 1, 1, 1,
-0.3411233, -1.00685, -4.916791, 0, 0, 1, 1, 1,
-0.3396882, -1.010616, -2.06906, 1, 0, 0, 1, 1,
-0.3343048, -0.4391921, -1.39685, 1, 0, 0, 1, 1,
-0.3309458, -0.5264531, -2.523911, 1, 0, 0, 1, 1,
-0.330918, -0.1740906, -1.396201, 1, 0, 0, 1, 1,
-0.3267742, 0.3478257, -0.6345827, 1, 0, 0, 1, 1,
-0.3165207, 0.6589003, 0.2131707, 0, 0, 0, 1, 1,
-0.3114603, 0.5130138, -0.05930128, 0, 0, 0, 1, 1,
-0.3099816, -0.1784922, -1.71424, 0, 0, 0, 1, 1,
-0.3090697, -1.194426, -2.561517, 0, 0, 0, 1, 1,
-0.2988764, -0.703168, -3.891316, 0, 0, 0, 1, 1,
-0.2960828, -0.8227736, -3.518135, 0, 0, 0, 1, 1,
-0.2901616, -0.5336564, -1.560022, 0, 0, 0, 1, 1,
-0.2891252, 0.4205612, 0.5457678, 1, 1, 1, 1, 1,
-0.2863055, 1.804044, -0.2116264, 1, 1, 1, 1, 1,
-0.2833676, 0.6985442, -0.08452762, 1, 1, 1, 1, 1,
-0.2833201, -1.027164, -3.347948, 1, 1, 1, 1, 1,
-0.2802496, -0.1208437, -1.789817, 1, 1, 1, 1, 1,
-0.2786154, 0.1258337, -1.578106, 1, 1, 1, 1, 1,
-0.278538, 1.127329, -0.8295727, 1, 1, 1, 1, 1,
-0.2720183, -0.4046215, -3.200298, 1, 1, 1, 1, 1,
-0.2717368, -0.3122088, -3.16568, 1, 1, 1, 1, 1,
-0.2702668, -0.3576337, -2.642714, 1, 1, 1, 1, 1,
-0.2644386, 1.614516, 1.474742, 1, 1, 1, 1, 1,
-0.2638858, 1.01821, -1.217622, 1, 1, 1, 1, 1,
-0.2633902, -1.883275, -2.940149, 1, 1, 1, 1, 1,
-0.2631986, -0.2686293, -1.46924, 1, 1, 1, 1, 1,
-0.2616452, 1.114471, -1.061876, 1, 1, 1, 1, 1,
-0.261335, 1.289716, 0.7985945, 0, 0, 1, 1, 1,
-0.2586833, 0.6110855, -3.227954, 1, 0, 0, 1, 1,
-0.248267, -0.3333949, -3.191984, 1, 0, 0, 1, 1,
-0.2449963, -1.70384, -0.5664605, 1, 0, 0, 1, 1,
-0.244229, 0.9858471, 0.8355803, 1, 0, 0, 1, 1,
-0.2386931, -0.123286, -1.629738, 1, 0, 0, 1, 1,
-0.2353811, 0.114192, -1.546645, 0, 0, 0, 1, 1,
-0.2345804, -0.5440641, -1.901809, 0, 0, 0, 1, 1,
-0.2339224, 0.124245, -2.170234, 0, 0, 0, 1, 1,
-0.2323655, -0.1320328, -2.876621, 0, 0, 0, 1, 1,
-0.2256799, -1.276066, -3.239909, 0, 0, 0, 1, 1,
-0.2242766, 0.827143, 1.663744, 0, 0, 0, 1, 1,
-0.2236013, -0.2426974, -2.38881, 0, 0, 0, 1, 1,
-0.223361, 2.977399, -1.000885, 1, 1, 1, 1, 1,
-0.2160677, -1.172619, -2.753069, 1, 1, 1, 1, 1,
-0.2083435, 0.03513307, -0.2775009, 1, 1, 1, 1, 1,
-0.2048433, -1.120999, -3.260065, 1, 1, 1, 1, 1,
-0.1965721, -0.9189025, -4.17244, 1, 1, 1, 1, 1,
-0.1955484, -0.4624015, -1.16037, 1, 1, 1, 1, 1,
-0.1858689, 2.403331, 0.8542904, 1, 1, 1, 1, 1,
-0.1805925, 0.9204565, -1.454093, 1, 1, 1, 1, 1,
-0.180277, -0.8553351, -4.404129, 1, 1, 1, 1, 1,
-0.1717294, -0.6614858, -3.210695, 1, 1, 1, 1, 1,
-0.1715688, 0.3370082, -1.461447, 1, 1, 1, 1, 1,
-0.1706169, -0.1315522, -2.374969, 1, 1, 1, 1, 1,
-0.1696838, 0.0724204, -1.139038, 1, 1, 1, 1, 1,
-0.1678117, 0.26979, 0.5485084, 1, 1, 1, 1, 1,
-0.1677127, -0.1242396, -0.9180239, 1, 1, 1, 1, 1,
-0.1673401, 1.249496, -1.021218, 0, 0, 1, 1, 1,
-0.1657568, -0.8966797, -4.840563, 1, 0, 0, 1, 1,
-0.1653442, -0.2072454, -2.576808, 1, 0, 0, 1, 1,
-0.1650033, 0.70151, 0.450836, 1, 0, 0, 1, 1,
-0.1641917, -0.1020105, -2.139096, 1, 0, 0, 1, 1,
-0.1595912, -1.404995, -3.558299, 1, 0, 0, 1, 1,
-0.1590838, 0.6901399, -0.5546041, 0, 0, 0, 1, 1,
-0.1511268, -0.7741274, -3.109222, 0, 0, 0, 1, 1,
-0.1470319, 2.447109, -0.02697739, 0, 0, 0, 1, 1,
-0.1413288, 0.01658331, -1.457369, 0, 0, 0, 1, 1,
-0.1329121, 0.9241985, 0.4549304, 0, 0, 0, 1, 1,
-0.1276924, -1.537907, -2.952369, 0, 0, 0, 1, 1,
-0.1258541, 1.825499, 1.085179, 0, 0, 0, 1, 1,
-0.1257659, -0.9869143, -3.766628, 1, 1, 1, 1, 1,
-0.1257423, 1.058709, -0.2906238, 1, 1, 1, 1, 1,
-0.1250921, 0.2271559, -0.3205885, 1, 1, 1, 1, 1,
-0.1249499, 0.9811813, 0.2442579, 1, 1, 1, 1, 1,
-0.1233494, -1.386492, -2.278811, 1, 1, 1, 1, 1,
-0.1169322, -2.0777, -2.437259, 1, 1, 1, 1, 1,
-0.1155928, 1.354931, 2.21755, 1, 1, 1, 1, 1,
-0.1136614, 0.1336556, -2.294821, 1, 1, 1, 1, 1,
-0.1099222, -0.097154, -2.172757, 1, 1, 1, 1, 1,
-0.1086239, -1.171624, -3.160656, 1, 1, 1, 1, 1,
-0.1066403, 0.1354419, -0.7207527, 1, 1, 1, 1, 1,
-0.1061151, -0.8665593, -4.09617, 1, 1, 1, 1, 1,
-0.104675, 1.059828, 0.883825, 1, 1, 1, 1, 1,
-0.1033271, 1.629677, -0.1557607, 1, 1, 1, 1, 1,
-0.1016659, 0.7224147, -0.753783, 1, 1, 1, 1, 1,
-0.1014794, 0.1294709, -1.826077, 0, 0, 1, 1, 1,
-0.09979384, 0.5046856, -0.6473686, 1, 0, 0, 1, 1,
-0.09497353, 0.4454033, -0.9316856, 1, 0, 0, 1, 1,
-0.09257871, 0.8754001, -1.350776, 1, 0, 0, 1, 1,
-0.09093489, -0.7243292, -1.666001, 1, 0, 0, 1, 1,
-0.08890962, -1.19499, -1.918316, 1, 0, 0, 1, 1,
-0.08850181, 0.6613088, -0.1533566, 0, 0, 0, 1, 1,
-0.08055675, -0.0559417, -2.019352, 0, 0, 0, 1, 1,
-0.07239419, 2.107799, 0.3140874, 0, 0, 0, 1, 1,
-0.06626725, 0.8278299, -0.1973962, 0, 0, 0, 1, 1,
-0.06571708, -0.08580481, -5.043768, 0, 0, 0, 1, 1,
-0.05634016, 1.412657, 0.1390633, 0, 0, 0, 1, 1,
-0.05226216, -0.1369612, -3.010133, 0, 0, 0, 1, 1,
-0.0518889, 0.01041931, -1.957244, 1, 1, 1, 1, 1,
-0.05003001, -0.5781285, -3.170594, 1, 1, 1, 1, 1,
-0.04878285, 1.356821, -2.231412, 1, 1, 1, 1, 1,
-0.04597733, -0.5256791, -3.362988, 1, 1, 1, 1, 1,
-0.04223513, -2.943166, -2.521796, 1, 1, 1, 1, 1,
-0.04200915, -0.100414, -1.127964, 1, 1, 1, 1, 1,
-0.03104222, 1.353704, -0.7000645, 1, 1, 1, 1, 1,
-0.02951675, 1.678036, 0.1879523, 1, 1, 1, 1, 1,
-0.02568709, -0.7708319, -5.499234, 1, 1, 1, 1, 1,
-0.02375551, -1.252914, -3.276394, 1, 1, 1, 1, 1,
-0.02372158, -0.8121993, -4.557011, 1, 1, 1, 1, 1,
-0.02068691, 0.2829382, 0.8531432, 1, 1, 1, 1, 1,
-0.01561084, 0.1042062, -0.5544775, 1, 1, 1, 1, 1,
-0.0108042, -0.4067168, -2.28279, 1, 1, 1, 1, 1,
-0.01047402, -1.482939, -4.094781, 1, 1, 1, 1, 1,
-0.008218489, -0.07878803, -2.902822, 0, 0, 1, 1, 1,
-0.007862709, 0.3124499, 2.011917, 1, 0, 0, 1, 1,
-0.003834591, -0.3120912, -2.068647, 1, 0, 0, 1, 1,
-0.003724263, -1.655777, -3.55092, 1, 0, 0, 1, 1,
-0.00265864, -1.399264, -3.946401, 1, 0, 0, 1, 1,
0.001782288, -0.3897244, 2.240011, 1, 0, 0, 1, 1,
0.006659246, -0.1741967, 2.345324, 0, 0, 0, 1, 1,
0.00881461, 0.6274234, -0.4243748, 0, 0, 0, 1, 1,
0.008817253, -1.161341, 2.003377, 0, 0, 0, 1, 1,
0.008912471, 0.3542297, -0.9142489, 0, 0, 0, 1, 1,
0.0090094, -0.2540002, 1.444777, 0, 0, 0, 1, 1,
0.009272297, -1.469554, 4.507864, 0, 0, 0, 1, 1,
0.01798167, -2.400094, 3.281334, 0, 0, 0, 1, 1,
0.01960634, 0.3011816, 1.49032, 1, 1, 1, 1, 1,
0.01998298, -0.5987687, 3.308918, 1, 1, 1, 1, 1,
0.02122242, 0.04804692, -1.519009, 1, 1, 1, 1, 1,
0.02252471, 0.7948244, 0.9459968, 1, 1, 1, 1, 1,
0.02368576, -2.089577, 3.101647, 1, 1, 1, 1, 1,
0.02607882, 1.003026, -0.2972407, 1, 1, 1, 1, 1,
0.02910592, 0.4247307, -1.615795, 1, 1, 1, 1, 1,
0.03074992, 0.2595313, 1.808905, 1, 1, 1, 1, 1,
0.0309884, -1.129935, 3.444051, 1, 1, 1, 1, 1,
0.03659858, 0.8605964, -1.702598, 1, 1, 1, 1, 1,
0.03697586, -0.01231309, 1.624915, 1, 1, 1, 1, 1,
0.04030097, -1.247, 3.337793, 1, 1, 1, 1, 1,
0.04166402, 0.5186514, 2.337428, 1, 1, 1, 1, 1,
0.04298135, 1.536309, 0.02258474, 1, 1, 1, 1, 1,
0.04305789, -1.194627, 4.745122, 1, 1, 1, 1, 1,
0.04486676, -0.690124, 3.696509, 0, 0, 1, 1, 1,
0.05450539, 0.3713896, 0.4541393, 1, 0, 0, 1, 1,
0.05653444, -2.738162, 4.450417, 1, 0, 0, 1, 1,
0.0565852, -0.432143, 2.345581, 1, 0, 0, 1, 1,
0.05691961, -0.245889, 2.060049, 1, 0, 0, 1, 1,
0.05702115, -0.1368096, 2.993913, 1, 0, 0, 1, 1,
0.06185886, -0.8712192, 2.368625, 0, 0, 0, 1, 1,
0.06261345, -0.04396296, 1.600063, 0, 0, 0, 1, 1,
0.06637025, 1.600625, 0.4083785, 0, 0, 0, 1, 1,
0.0764242, -1.09945, 4.331238, 0, 0, 0, 1, 1,
0.07952482, -1.507411, 3.979911, 0, 0, 0, 1, 1,
0.08010784, 0.6273341, 0.1799121, 0, 0, 0, 1, 1,
0.08322366, -1.098862, 2.480824, 0, 0, 0, 1, 1,
0.08351862, -0.4469895, 3.289149, 1, 1, 1, 1, 1,
0.08707082, 0.1607261, 0.6320308, 1, 1, 1, 1, 1,
0.09101709, 0.5214316, 1.559653, 1, 1, 1, 1, 1,
0.09279524, -0.8832506, 3.283049, 1, 1, 1, 1, 1,
0.09415013, 1.485402, 0.5398009, 1, 1, 1, 1, 1,
0.09431363, -0.05210895, 2.422091, 1, 1, 1, 1, 1,
0.09470188, 0.9285764, 1.059264, 1, 1, 1, 1, 1,
0.09597716, -0.2402358, 2.164915, 1, 1, 1, 1, 1,
0.09873729, 0.302542, -0.5367094, 1, 1, 1, 1, 1,
0.1015639, 0.02141711, 0.2586792, 1, 1, 1, 1, 1,
0.1019692, 1.253125, 0.2511754, 1, 1, 1, 1, 1,
0.1029758, -1.136055, 1.523075, 1, 1, 1, 1, 1,
0.1050545, -1.094946, 3.859792, 1, 1, 1, 1, 1,
0.1062096, 0.5078346, 1.365683, 1, 1, 1, 1, 1,
0.1067092, -0.6020685, 3.012465, 1, 1, 1, 1, 1,
0.1073544, -0.0004135231, 2.650421, 0, 0, 1, 1, 1,
0.1100508, -0.3150155, 4.037018, 1, 0, 0, 1, 1,
0.1148762, -0.544931, 2.366051, 1, 0, 0, 1, 1,
0.1160068, -0.9292108, 4.6997, 1, 0, 0, 1, 1,
0.1176252, 0.1910014, 1.696805, 1, 0, 0, 1, 1,
0.125915, -2.138145, 0.8010387, 1, 0, 0, 1, 1,
0.1289618, -1.825126, 3.662787, 0, 0, 0, 1, 1,
0.1299082, -1.19898, 2.982832, 0, 0, 0, 1, 1,
0.134744, -0.6735327, 3.025215, 0, 0, 0, 1, 1,
0.13665, 0.09915061, 1.247364, 0, 0, 0, 1, 1,
0.1368375, 1.442175, 0.6700839, 0, 0, 0, 1, 1,
0.137358, -1.418624, 3.563847, 0, 0, 0, 1, 1,
0.1434962, 0.2422018, 2.147176, 0, 0, 0, 1, 1,
0.1440643, -1.239816, 2.546343, 1, 1, 1, 1, 1,
0.1444317, 0.5510193, -0.9383149, 1, 1, 1, 1, 1,
0.1556347, -0.9426447, 3.703149, 1, 1, 1, 1, 1,
0.1608873, -0.02956838, 2.632843, 1, 1, 1, 1, 1,
0.1616399, 2.075238, -0.8084726, 1, 1, 1, 1, 1,
0.1656404, -0.2375149, 2.535962, 1, 1, 1, 1, 1,
0.1657438, -1.017503, 3.025359, 1, 1, 1, 1, 1,
0.1683934, -0.3591409, 3.486999, 1, 1, 1, 1, 1,
0.1699934, 0.4296429, -1.352042, 1, 1, 1, 1, 1,
0.1779293, 0.2045268, 1.693004, 1, 1, 1, 1, 1,
0.1817195, 0.2299655, 0.5899069, 1, 1, 1, 1, 1,
0.1898853, 0.8405532, -0.004669423, 1, 1, 1, 1, 1,
0.1972985, 1.023461, -0.09123549, 1, 1, 1, 1, 1,
0.1995032, -0.7754658, 1.147424, 1, 1, 1, 1, 1,
0.2000917, 0.3169308, 0.329132, 1, 1, 1, 1, 1,
0.2071076, 0.356288, 0.8916597, 0, 0, 1, 1, 1,
0.2078023, -0.5532101, 2.138293, 1, 0, 0, 1, 1,
0.2091399, 1.403835, 0.00678223, 1, 0, 0, 1, 1,
0.2097896, 0.08459163, 2.402449, 1, 0, 0, 1, 1,
0.2108449, -0.9777205, 2.222773, 1, 0, 0, 1, 1,
0.2121595, 1.014302, 0.2620071, 1, 0, 0, 1, 1,
0.2132084, -0.5941951, 2.637549, 0, 0, 0, 1, 1,
0.214239, -1.431612, 1.449043, 0, 0, 0, 1, 1,
0.2162826, -0.9533836, 2.962956, 0, 0, 0, 1, 1,
0.21726, -1.068654, 4.30572, 0, 0, 0, 1, 1,
0.2183492, -0.8992431, 4.122177, 0, 0, 0, 1, 1,
0.2210751, 0.6883386, 0.05452863, 0, 0, 0, 1, 1,
0.2262212, 1.082134, 2.185934, 0, 0, 0, 1, 1,
0.2273189, -0.7099436, 3.350638, 1, 1, 1, 1, 1,
0.2286838, -1.258525, 3.540023, 1, 1, 1, 1, 1,
0.2299861, -0.5797943, 2.151861, 1, 1, 1, 1, 1,
0.2301762, -1.583563, 1.765738, 1, 1, 1, 1, 1,
0.2356126, -0.7689333, 3.714419, 1, 1, 1, 1, 1,
0.2392884, 0.2339608, 0.8495859, 1, 1, 1, 1, 1,
0.2418547, -0.5591503, 3.85936, 1, 1, 1, 1, 1,
0.244347, -0.6988436, 1.896512, 1, 1, 1, 1, 1,
0.2477618, 0.9542205, -0.3581473, 1, 1, 1, 1, 1,
0.2482571, -1.839525, 3.134172, 1, 1, 1, 1, 1,
0.24927, 0.685077, -0.2903117, 1, 1, 1, 1, 1,
0.2506761, -1.36227, 3.877982, 1, 1, 1, 1, 1,
0.2550584, 1.288056, 0.4749137, 1, 1, 1, 1, 1,
0.2575549, 0.5154108, 1.677278, 1, 1, 1, 1, 1,
0.2578375, -1.17998, 3.037767, 1, 1, 1, 1, 1,
0.2586959, -0.3808339, 3.053286, 0, 0, 1, 1, 1,
0.2608662, -1.027562, 2.759461, 1, 0, 0, 1, 1,
0.2609559, 2.136744, -1.474503, 1, 0, 0, 1, 1,
0.2616991, -0.9783742, 4.838736, 1, 0, 0, 1, 1,
0.2644872, 1.940445, 1.005305, 1, 0, 0, 1, 1,
0.2647362, 0.3107027, 2.127677, 1, 0, 0, 1, 1,
0.2651491, -0.9738217, 1.152569, 0, 0, 0, 1, 1,
0.2686915, -0.161475, 2.655071, 0, 0, 0, 1, 1,
0.2780913, 0.4216373, -1.111004, 0, 0, 0, 1, 1,
0.2790861, 2.918459, 1.272327, 0, 0, 0, 1, 1,
0.2835731, 0.5998917, 1.789347, 0, 0, 0, 1, 1,
0.2847757, -1.296139, 3.821204, 0, 0, 0, 1, 1,
0.2856719, -2.061023, 1.734442, 0, 0, 0, 1, 1,
0.2862017, 0.5029448, 0.9562427, 1, 1, 1, 1, 1,
0.288589, 0.5649077, 0.1211878, 1, 1, 1, 1, 1,
0.2935153, -0.7502695, 2.005325, 1, 1, 1, 1, 1,
0.294626, 0.8625164, 1.708787, 1, 1, 1, 1, 1,
0.2950876, 0.4441885, -0.2627873, 1, 1, 1, 1, 1,
0.2994176, -1.793103, 1.484272, 1, 1, 1, 1, 1,
0.2994358, -2.164055, 2.174278, 1, 1, 1, 1, 1,
0.3035085, 1.823101, -0.3319313, 1, 1, 1, 1, 1,
0.3068411, -0.9730008, 3.531101, 1, 1, 1, 1, 1,
0.3118614, 0.5723921, 0.2616815, 1, 1, 1, 1, 1,
0.3207076, -1.080518, 4.741162, 1, 1, 1, 1, 1,
0.3222458, -0.2690263, 3.799523, 1, 1, 1, 1, 1,
0.3250955, -0.6566342, 2.520616, 1, 1, 1, 1, 1,
0.3283122, -1.402483, 4.163688, 1, 1, 1, 1, 1,
0.3285716, -1.816626, 3.007186, 1, 1, 1, 1, 1,
0.3295342, -0.1915053, 3.038546, 0, 0, 1, 1, 1,
0.330973, -0.02364564, 1.130855, 1, 0, 0, 1, 1,
0.3318195, 0.1203006, 2.303124, 1, 0, 0, 1, 1,
0.3363573, -0.2282742, 2.165769, 1, 0, 0, 1, 1,
0.3392562, 1.046952, 1.059046, 1, 0, 0, 1, 1,
0.3412665, -0.8953961, 3.462639, 1, 0, 0, 1, 1,
0.3432193, 1.967847, -1.859566, 0, 0, 0, 1, 1,
0.3464683, 0.6193616, 1.236866, 0, 0, 0, 1, 1,
0.3482697, -0.03919247, 1.090025, 0, 0, 0, 1, 1,
0.3517566, 0.1442457, 1.635208, 0, 0, 0, 1, 1,
0.3524599, -1.399714, 2.695457, 0, 0, 0, 1, 1,
0.3594745, 0.6997877, -1.072328, 0, 0, 0, 1, 1,
0.3634053, 0.3255469, 0.7809001, 0, 0, 0, 1, 1,
0.3634419, -0.4701318, 2.060327, 1, 1, 1, 1, 1,
0.3649357, -0.4871087, 2.039698, 1, 1, 1, 1, 1,
0.3675918, 1.613165, 0.7305925, 1, 1, 1, 1, 1,
0.3682675, 0.2788365, -0.499077, 1, 1, 1, 1, 1,
0.3695549, 0.09113355, 2.085113, 1, 1, 1, 1, 1,
0.3713305, 1.239471, 2.121794, 1, 1, 1, 1, 1,
0.3751028, -0.5016394, 0.7991883, 1, 1, 1, 1, 1,
0.37815, 1.885883, 1.346647, 1, 1, 1, 1, 1,
0.379905, 0.05123286, 0.3190064, 1, 1, 1, 1, 1,
0.3841521, 0.9658096, -0.5978621, 1, 1, 1, 1, 1,
0.3865832, 0.289172, 1.313108, 1, 1, 1, 1, 1,
0.3906048, -0.6154512, 0.6659669, 1, 1, 1, 1, 1,
0.3917292, 0.4324405, 1.827098, 1, 1, 1, 1, 1,
0.397971, -0.9077232, 4.199488, 1, 1, 1, 1, 1,
0.4000735, -1.105398, 4.591701, 1, 1, 1, 1, 1,
0.4017876, 0.8007838, 0.4894081, 0, 0, 1, 1, 1,
0.402031, 1.817379, 1.398556, 1, 0, 0, 1, 1,
0.4029773, 0.1705469, 3.155903, 1, 0, 0, 1, 1,
0.4038721, 0.5928969, 0.6095741, 1, 0, 0, 1, 1,
0.4042435, -1.064321, 1.095145, 1, 0, 0, 1, 1,
0.405332, -1.731036, 4.162827, 1, 0, 0, 1, 1,
0.4054488, -0.184527, 5.087508, 0, 0, 0, 1, 1,
0.4122249, 0.3840744, 2.066099, 0, 0, 0, 1, 1,
0.4181644, 1.504627, 0.03772833, 0, 0, 0, 1, 1,
0.4193164, 1.272834, 0.489255, 0, 0, 0, 1, 1,
0.4274879, -1.573375, 2.452457, 0, 0, 0, 1, 1,
0.4290339, -1.262144, 3.013754, 0, 0, 0, 1, 1,
0.4323722, 0.1234828, -0.5911362, 0, 0, 0, 1, 1,
0.4355336, 1.065813, 1.83335, 1, 1, 1, 1, 1,
0.4377417, 0.08787673, 1.169174, 1, 1, 1, 1, 1,
0.4378107, 0.2300913, 0.8300015, 1, 1, 1, 1, 1,
0.4381147, -0.723507, 2.161649, 1, 1, 1, 1, 1,
0.4395749, 1.896074, 0.5082421, 1, 1, 1, 1, 1,
0.4401526, 0.04084868, 1.719745, 1, 1, 1, 1, 1,
0.4431005, 0.8894818, -0.2608124, 1, 1, 1, 1, 1,
0.4443778, -0.9196471, 1.959797, 1, 1, 1, 1, 1,
0.446268, -0.4951531, 1.15403, 1, 1, 1, 1, 1,
0.4549146, 1.256924, 0.8365573, 1, 1, 1, 1, 1,
0.4558254, -0.395631, 2.989797, 1, 1, 1, 1, 1,
0.457051, -1.10259, 4.358081, 1, 1, 1, 1, 1,
0.4589133, -0.03287566, 1.323314, 1, 1, 1, 1, 1,
0.4598067, -0.6769577, 4.96675, 1, 1, 1, 1, 1,
0.4629016, -0.9200013, 1.45095, 1, 1, 1, 1, 1,
0.4687289, 1.563352, 0.6238191, 0, 0, 1, 1, 1,
0.474085, 0.7030716, 0.8990088, 1, 0, 0, 1, 1,
0.4751135, -0.9647577, 2.163151, 1, 0, 0, 1, 1,
0.475119, 0.2951011, -0.5680283, 1, 0, 0, 1, 1,
0.4767922, -0.4078765, 1.053737, 1, 0, 0, 1, 1,
0.4827332, -0.3734311, 0.6937109, 1, 0, 0, 1, 1,
0.4850038, 0.003222307, 0.910308, 0, 0, 0, 1, 1,
0.4880802, -0.4012166, 1.901986, 0, 0, 0, 1, 1,
0.4889545, -0.8989523, 2.198459, 0, 0, 0, 1, 1,
0.4905235, 0.8022255, 0.8243933, 0, 0, 0, 1, 1,
0.4941649, 0.6281413, 2.095708, 0, 0, 0, 1, 1,
0.4946615, -1.450527, 2.130352, 0, 0, 0, 1, 1,
0.4947611, -0.2001128, 3.097456, 0, 0, 0, 1, 1,
0.4950733, 0.1036763, 3.079753, 1, 1, 1, 1, 1,
0.4975894, 0.5726075, -1.268445, 1, 1, 1, 1, 1,
0.4978801, 0.03082251, 1.634478, 1, 1, 1, 1, 1,
0.498056, 0.3752225, 2.065618, 1, 1, 1, 1, 1,
0.5004247, 0.006490061, 3.098729, 1, 1, 1, 1, 1,
0.5008141, 1.268435, 0.959034, 1, 1, 1, 1, 1,
0.508755, -0.2568597, 2.559315, 1, 1, 1, 1, 1,
0.5092159, 0.7547277, -0.113127, 1, 1, 1, 1, 1,
0.5108205, 0.6259084, -0.4725134, 1, 1, 1, 1, 1,
0.5128114, 0.8247437, 2.213583, 1, 1, 1, 1, 1,
0.5165725, 0.5212625, 0.2733712, 1, 1, 1, 1, 1,
0.5174111, 0.50158, 2.083689, 1, 1, 1, 1, 1,
0.5198943, -0.7761787, 1.645537, 1, 1, 1, 1, 1,
0.5206873, 1.167391, 0.6790663, 1, 1, 1, 1, 1,
0.5297637, -0.4620912, 1.590566, 1, 1, 1, 1, 1,
0.5365497, 0.4985775, 1.708088, 0, 0, 1, 1, 1,
0.5373566, 1.527148, 0.2759471, 1, 0, 0, 1, 1,
0.5424153, -0.6798214, 1.227059, 1, 0, 0, 1, 1,
0.5442277, -1.11961, 2.842255, 1, 0, 0, 1, 1,
0.5443138, -0.2704712, -0.3705845, 1, 0, 0, 1, 1,
0.5461335, -0.5004331, 4.27807, 1, 0, 0, 1, 1,
0.5499679, 1.003015, 0.3700964, 0, 0, 0, 1, 1,
0.5520816, 0.4643263, -0.7957082, 0, 0, 0, 1, 1,
0.5538899, 1.029073, 2.32848, 0, 0, 0, 1, 1,
0.5557157, -1.970279, 2.500477, 0, 0, 0, 1, 1,
0.5563636, 0.1966279, 2.181336, 0, 0, 0, 1, 1,
0.5599096, 0.3391753, 0.6869484, 0, 0, 0, 1, 1,
0.5625536, -1.286849, 3.231076, 0, 0, 0, 1, 1,
0.5647672, -1.687129, 3.29155, 1, 1, 1, 1, 1,
0.5668302, -0.5869175, 2.83364, 1, 1, 1, 1, 1,
0.5675343, 0.1866187, 0.261998, 1, 1, 1, 1, 1,
0.5682849, -0.3077801, 2.345442, 1, 1, 1, 1, 1,
0.5696974, -1.121329, 2.618179, 1, 1, 1, 1, 1,
0.5714422, -0.3865458, 2.504578, 1, 1, 1, 1, 1,
0.5722791, 1.031213, 0.3950004, 1, 1, 1, 1, 1,
0.5777172, 1.00812, 0.5637569, 1, 1, 1, 1, 1,
0.5778283, -2.079058, 3.265571, 1, 1, 1, 1, 1,
0.5797337, -0.5391945, 2.243594, 1, 1, 1, 1, 1,
0.5862237, -0.8758177, 1.667489, 1, 1, 1, 1, 1,
0.5896096, 0.8747764, 2.317425, 1, 1, 1, 1, 1,
0.5906953, 0.4295401, -0.6009691, 1, 1, 1, 1, 1,
0.592315, -1.019775, 1.678978, 1, 1, 1, 1, 1,
0.5931703, 0.5056906, 0.5727832, 1, 1, 1, 1, 1,
0.5953342, 0.489946, -0.1908705, 0, 0, 1, 1, 1,
0.5996739, 0.1378397, -0.2846257, 1, 0, 0, 1, 1,
0.606986, -0.7983934, 1.929568, 1, 0, 0, 1, 1,
0.6070175, 0.3113717, -0.1081711, 1, 0, 0, 1, 1,
0.6082783, 2.185578, 0.2045767, 1, 0, 0, 1, 1,
0.6104144, -0.4709562, 3.088006, 1, 0, 0, 1, 1,
0.6156071, 0.5596349, -0.9402052, 0, 0, 0, 1, 1,
0.6298683, -0.4740356, 3.701295, 0, 0, 0, 1, 1,
0.6311063, -0.3714815, 3.850659, 0, 0, 0, 1, 1,
0.632567, -0.8077972, 3.112997, 0, 0, 0, 1, 1,
0.6343333, -0.6970081, 3.634678, 0, 0, 0, 1, 1,
0.6371748, 2.705999, 0.8942645, 0, 0, 0, 1, 1,
0.637702, -1.570521, 3.481624, 0, 0, 0, 1, 1,
0.639662, -0.4213371, 1.800308, 1, 1, 1, 1, 1,
0.6402565, -1.424616, 2.320239, 1, 1, 1, 1, 1,
0.6421175, -0.001753108, 0.3268412, 1, 1, 1, 1, 1,
0.64666, 0.9180431, 0.7739303, 1, 1, 1, 1, 1,
0.6468714, 0.7994627, 1.928539, 1, 1, 1, 1, 1,
0.6516087, -0.36318, 1.929209, 1, 1, 1, 1, 1,
0.6528918, 0.4721221, -0.1239515, 1, 1, 1, 1, 1,
0.6553146, -0.3138886, 1.751416, 1, 1, 1, 1, 1,
0.6623343, -1.510755, 1.590893, 1, 1, 1, 1, 1,
0.6690906, -1.478054, 3.092477, 1, 1, 1, 1, 1,
0.6704928, 0.4660179, 0.4807575, 1, 1, 1, 1, 1,
0.6712697, 0.9011756, 1.17865, 1, 1, 1, 1, 1,
0.6740507, 0.9586179, -0.3209986, 1, 1, 1, 1, 1,
0.6812747, 0.5021791, 1.269344, 1, 1, 1, 1, 1,
0.6832826, -0.05588648, 2.895844, 1, 1, 1, 1, 1,
0.6894401, -0.493717, 1.207513, 0, 0, 1, 1, 1,
0.6911598, 0.6993438, 0.2967033, 1, 0, 0, 1, 1,
0.6922296, -0.3279362, 2.852398, 1, 0, 0, 1, 1,
0.6967152, -1.320894, 3.113448, 1, 0, 0, 1, 1,
0.7073689, -0.2413822, 1.697523, 1, 0, 0, 1, 1,
0.7126673, 0.1769002, 0.6080775, 1, 0, 0, 1, 1,
0.7133281, 0.6950115, 0.989265, 0, 0, 0, 1, 1,
0.7222825, -1.423702, 3.107147, 0, 0, 0, 1, 1,
0.7235799, -2.943513, 0.9792916, 0, 0, 0, 1, 1,
0.7241495, 0.9558572, 2.221215, 0, 0, 0, 1, 1,
0.7278515, 0.4326276, 1.208468, 0, 0, 0, 1, 1,
0.7284319, -0.4874927, 3.587818, 0, 0, 0, 1, 1,
0.7297619, 0.9649093, -0.9252116, 0, 0, 0, 1, 1,
0.7303742, -0.6305097, 1.787706, 1, 1, 1, 1, 1,
0.7340558, -1.050827, 3.429199, 1, 1, 1, 1, 1,
0.7345138, -0.6778605, 2.482152, 1, 1, 1, 1, 1,
0.7350896, 0.2388359, 1.121649, 1, 1, 1, 1, 1,
0.7357569, 0.9881852, 0.3969384, 1, 1, 1, 1, 1,
0.746677, 0.5742321, -0.1995098, 1, 1, 1, 1, 1,
0.7520509, -0.2755332, 1.526746, 1, 1, 1, 1, 1,
0.7529703, -1.049611, 0.9139526, 1, 1, 1, 1, 1,
0.7538688, 1.000877, 1.774283, 1, 1, 1, 1, 1,
0.7581111, -1.247249, 2.659763, 1, 1, 1, 1, 1,
0.7706791, -0.5165486, 2.676943, 1, 1, 1, 1, 1,
0.7714788, -1.210779, 1.135197, 1, 1, 1, 1, 1,
0.7723416, 0.5452375, -0.7088608, 1, 1, 1, 1, 1,
0.775628, 1.169692, 1.051812, 1, 1, 1, 1, 1,
0.7806103, -1.875065, 1.953569, 1, 1, 1, 1, 1,
0.7817088, 0.4562493, 2.52734, 0, 0, 1, 1, 1,
0.7899089, -0.9562733, 2.741812, 1, 0, 0, 1, 1,
0.7900535, 1.768697, 1.293754, 1, 0, 0, 1, 1,
0.7951006, 0.9937616, 1.24533, 1, 0, 0, 1, 1,
0.7988926, -1.476914, 3.137759, 1, 0, 0, 1, 1,
0.8008695, 0.7294697, 1.126426, 1, 0, 0, 1, 1,
0.8009193, -0.7370285, 2.523221, 0, 0, 0, 1, 1,
0.8151522, 1.374968, -0.2363738, 0, 0, 0, 1, 1,
0.8209136, 0.07067179, 1.954136, 0, 0, 0, 1, 1,
0.8239383, -0.9998547, 4.146256, 0, 0, 0, 1, 1,
0.8273781, -0.7059995, 1.71242, 0, 0, 0, 1, 1,
0.8353225, 1.415299, -0.3999543, 0, 0, 0, 1, 1,
0.8354461, -0.1003697, 2.234051, 0, 0, 0, 1, 1,
0.8384692, -0.8696727, 2.791879, 1, 1, 1, 1, 1,
0.8489855, -0.8161225, 2.13693, 1, 1, 1, 1, 1,
0.8514901, -0.1549236, 2.618601, 1, 1, 1, 1, 1,
0.8546266, 0.3631325, 0.2370274, 1, 1, 1, 1, 1,
0.858164, -0.4809028, 2.415605, 1, 1, 1, 1, 1,
0.870506, -0.8665165, 2.815993, 1, 1, 1, 1, 1,
0.8725913, -0.45558, 1.62642, 1, 1, 1, 1, 1,
0.8763139, -0.1655822, -0.2061683, 1, 1, 1, 1, 1,
0.8772857, 0.308691, 2.308179, 1, 1, 1, 1, 1,
0.8823637, 1.322141, 1.595811, 1, 1, 1, 1, 1,
0.8873543, 0.003640723, 2.945574, 1, 1, 1, 1, 1,
0.887466, 0.8291696, 0.78542, 1, 1, 1, 1, 1,
0.8877309, -0.07074985, 1.211382, 1, 1, 1, 1, 1,
0.8880354, 1.665236, -0.3515039, 1, 1, 1, 1, 1,
0.8892622, -0.6469787, 3.013169, 1, 1, 1, 1, 1,
0.8921371, 0.8800345, 1.668067, 0, 0, 1, 1, 1,
0.8983945, -1.07301, 2.501874, 1, 0, 0, 1, 1,
0.9022381, 0.004818296, 1.725734, 1, 0, 0, 1, 1,
0.9141958, -0.2329253, 0.762884, 1, 0, 0, 1, 1,
0.9149767, -0.4185933, 1.454165, 1, 0, 0, 1, 1,
0.9179689, 2.064109, 0.9279349, 1, 0, 0, 1, 1,
0.9199879, -0.4451838, 1.57627, 0, 0, 0, 1, 1,
0.9251114, 0.5803823, 1.549893, 0, 0, 0, 1, 1,
0.9270549, -0.02707489, 1.076571, 0, 0, 0, 1, 1,
0.9321433, 2.330633, -0.4572756, 0, 0, 0, 1, 1,
0.9377673, -1.506407, 3.370572, 0, 0, 0, 1, 1,
0.9474677, -0.5244319, 1.103027, 0, 0, 0, 1, 1,
0.9487876, -1.421506, 3.05779, 0, 0, 0, 1, 1,
0.9517792, -1.392775, 2.214019, 1, 1, 1, 1, 1,
0.9538449, -1.708704, 1.963589, 1, 1, 1, 1, 1,
0.9610549, 0.866891, -0.7405105, 1, 1, 1, 1, 1,
0.9611411, -0.08432223, 2.864452, 1, 1, 1, 1, 1,
0.9620821, 1.131142, -0.6379576, 1, 1, 1, 1, 1,
0.9621458, -0.03714208, 0.7236411, 1, 1, 1, 1, 1,
0.9673635, -0.5837399, 2.205179, 1, 1, 1, 1, 1,
0.9687046, -1.226413, 3.742926, 1, 1, 1, 1, 1,
0.9873383, -0.1839726, 3.843811, 1, 1, 1, 1, 1,
0.9906031, 0.9727963, 0.7165571, 1, 1, 1, 1, 1,
0.9965148, 0.1489649, 1.379893, 1, 1, 1, 1, 1,
0.9976657, 1.122024, 1.629297, 1, 1, 1, 1, 1,
1.002533, -0.08771751, 2.241001, 1, 1, 1, 1, 1,
1.00306, 0.05135363, 0.01385961, 1, 1, 1, 1, 1,
1.003548, -0.2823203, -0.02809472, 1, 1, 1, 1, 1,
1.00405, 0.6732857, 0.5275464, 0, 0, 1, 1, 1,
1.009704, -0.605559, 1.211001, 1, 0, 0, 1, 1,
1.010154, 0.1833391, 2.076426, 1, 0, 0, 1, 1,
1.031496, -1.125329, 1.425136, 1, 0, 0, 1, 1,
1.036107, -0.005682051, 2.941294, 1, 0, 0, 1, 1,
1.036365, 0.8569683, -0.03403452, 1, 0, 0, 1, 1,
1.037215, -1.559863, 3.998579, 0, 0, 0, 1, 1,
1.039414, 0.08614485, -0.4001612, 0, 0, 0, 1, 1,
1.041204, 0.1861206, 1.829255, 0, 0, 0, 1, 1,
1.052819, -0.08061968, 1.062732, 0, 0, 0, 1, 1,
1.053564, 0.6959996, 1.397559, 0, 0, 0, 1, 1,
1.054842, -0.8212333, 1.463746, 0, 0, 0, 1, 1,
1.063825, 0.6140462, 1.072977, 0, 0, 0, 1, 1,
1.065966, 1.27005, -0.3816923, 1, 1, 1, 1, 1,
1.070145, 0.418971, 3.402916, 1, 1, 1, 1, 1,
1.076026, -0.498071, 2.631873, 1, 1, 1, 1, 1,
1.078392, 1.294089, 0.3124001, 1, 1, 1, 1, 1,
1.079464, -0.4273007, 1.359897, 1, 1, 1, 1, 1,
1.090588, 0.7873725, -0.7065459, 1, 1, 1, 1, 1,
1.100384, -0.845296, 0.745109, 1, 1, 1, 1, 1,
1.100648, 0.6435371, -2.631556, 1, 1, 1, 1, 1,
1.105637, 1.420492, 2.216398, 1, 1, 1, 1, 1,
1.114334, -1.863394, 1.704774, 1, 1, 1, 1, 1,
1.132551, -0.8725621, 0.6257473, 1, 1, 1, 1, 1,
1.136487, -0.4872461, 1.285282, 1, 1, 1, 1, 1,
1.148484, 0.8535714, 0.924195, 1, 1, 1, 1, 1,
1.15374, 0.2171208, 2.113388, 1, 1, 1, 1, 1,
1.155864, 0.3550319, 0.9980198, 1, 1, 1, 1, 1,
1.160665, 0.2664497, 2.138045, 0, 0, 1, 1, 1,
1.163595, -0.1667568, 1.602522, 1, 0, 0, 1, 1,
1.166524, -0.2555277, 1.036509, 1, 0, 0, 1, 1,
1.167444, 2.009963, -2.133545, 1, 0, 0, 1, 1,
1.175615, 1.352246, 0.1703609, 1, 0, 0, 1, 1,
1.179102, 0.3834305, 2.37791, 1, 0, 0, 1, 1,
1.189724, 1.086648, 1.049606, 0, 0, 0, 1, 1,
1.194504, 1.21777, 2.076224, 0, 0, 0, 1, 1,
1.195644, -1.3602, 3.0091, 0, 0, 0, 1, 1,
1.208188, 0.4264989, 1.299347, 0, 0, 0, 1, 1,
1.208712, 1.430318, -0.5850548, 0, 0, 0, 1, 1,
1.208959, -0.7338702, 0.9908529, 0, 0, 0, 1, 1,
1.211977, 0.6005815, -0.01631555, 0, 0, 0, 1, 1,
1.213994, -0.3995773, 1.211128, 1, 1, 1, 1, 1,
1.223605, -0.2207397, 1.274179, 1, 1, 1, 1, 1,
1.229391, -0.9560241, 2.36156, 1, 1, 1, 1, 1,
1.23306, 1.167936, -0.09959852, 1, 1, 1, 1, 1,
1.237595, -0.7937554, 2.500901, 1, 1, 1, 1, 1,
1.239925, 0.3781123, 0.3144726, 1, 1, 1, 1, 1,
1.243129, 0.522965, 0.6590879, 1, 1, 1, 1, 1,
1.244634, -0.7559264, 0.6638757, 1, 1, 1, 1, 1,
1.247028, -0.2012175, 1.494186, 1, 1, 1, 1, 1,
1.276075, -0.6252015, 2.080076, 1, 1, 1, 1, 1,
1.282268, 1.888142, -0.09157783, 1, 1, 1, 1, 1,
1.294387, 0.2447974, 1.503299, 1, 1, 1, 1, 1,
1.297539, -1.287947, 1.866798, 1, 1, 1, 1, 1,
1.298821, 0.5519021, 3.029769, 1, 1, 1, 1, 1,
1.301123, -0.1769724, 1.112491, 1, 1, 1, 1, 1,
1.304153, 0.08831561, 2.406335, 0, 0, 1, 1, 1,
1.305392, -1.346688, 2.818719, 1, 0, 0, 1, 1,
1.307542, -0.4250768, 1.030509, 1, 0, 0, 1, 1,
1.310945, -0.2426519, 2.519712, 1, 0, 0, 1, 1,
1.312372, -0.7473065, 2.709261, 1, 0, 0, 1, 1,
1.313194, 0.5757773, -0.6177579, 1, 0, 0, 1, 1,
1.31574, 1.06238, 1.523624, 0, 0, 0, 1, 1,
1.316326, 1.175689, -0.1400089, 0, 0, 0, 1, 1,
1.319827, -0.09374188, 0.0527602, 0, 0, 0, 1, 1,
1.325725, 0.1175602, 0.8374152, 0, 0, 0, 1, 1,
1.329997, -1.691152, 1.306108, 0, 0, 0, 1, 1,
1.331847, -1.265311, 1.098833, 0, 0, 0, 1, 1,
1.339653, 0.4152595, 1.079634, 0, 0, 0, 1, 1,
1.352839, -0.7698668, 2.808123, 1, 1, 1, 1, 1,
1.358266, 0.7396334, 2.899278, 1, 1, 1, 1, 1,
1.36077, -1.066139, 2.444184, 1, 1, 1, 1, 1,
1.364759, 0.5182728, 0.9234226, 1, 1, 1, 1, 1,
1.367185, 1.502575, 0.4477654, 1, 1, 1, 1, 1,
1.367284, -1.793006, 3.337894, 1, 1, 1, 1, 1,
1.377301, 0.4769405, -0.4788626, 1, 1, 1, 1, 1,
1.377782, -0.1970736, 0.6333502, 1, 1, 1, 1, 1,
1.379989, -0.7883312, 2.959753, 1, 1, 1, 1, 1,
1.387177, 1.165959, 0.9407728, 1, 1, 1, 1, 1,
1.390255, -0.6575695, 2.832126, 1, 1, 1, 1, 1,
1.396997, 0.1031164, -0.4124042, 1, 1, 1, 1, 1,
1.404797, 0.09307016, 0.6497262, 1, 1, 1, 1, 1,
1.406014, -0.09032615, 2.80625, 1, 1, 1, 1, 1,
1.43113, 1.54885, 1.011428, 1, 1, 1, 1, 1,
1.435152, -0.02217491, 1.275375, 0, 0, 1, 1, 1,
1.437149, 0.4892695, 1.930214, 1, 0, 0, 1, 1,
1.438169, -0.4271668, 0.8277229, 1, 0, 0, 1, 1,
1.440245, -0.20324, 1.173999, 1, 0, 0, 1, 1,
1.456423, 0.8357323, 0.15339, 1, 0, 0, 1, 1,
1.464642, -0.8371359, 1.582306, 1, 0, 0, 1, 1,
1.470283, 1.333989, 1.581334, 0, 0, 0, 1, 1,
1.472121, 1.341518, 0.7513561, 0, 0, 0, 1, 1,
1.492879, 1.18688, 2.397403, 0, 0, 0, 1, 1,
1.493375, -0.7680168, 1.696816, 0, 0, 0, 1, 1,
1.49385, 0.4726496, 0.6923746, 0, 0, 0, 1, 1,
1.50451, -2.046875, 3.281865, 0, 0, 0, 1, 1,
1.505667, 0.3922821, 1.601096, 0, 0, 0, 1, 1,
1.510387, -0.1853282, 0.07471062, 1, 1, 1, 1, 1,
1.522053, -0.09446047, 1.608903, 1, 1, 1, 1, 1,
1.525207, -0.4364987, 0.9733638, 1, 1, 1, 1, 1,
1.527885, -0.6057473, 3.544393, 1, 1, 1, 1, 1,
1.529882, -1.282038, 3.032308, 1, 1, 1, 1, 1,
1.539157, -0.2697873, 1.93173, 1, 1, 1, 1, 1,
1.546099, 1.189471, 1.164909, 1, 1, 1, 1, 1,
1.547024, 0.7623713, 0.7389699, 1, 1, 1, 1, 1,
1.547037, 0.6290907, 0.6160102, 1, 1, 1, 1, 1,
1.547279, 2.110046, 1.44252, 1, 1, 1, 1, 1,
1.55848, 0.4054591, 2.114777, 1, 1, 1, 1, 1,
1.55954, -0.4381757, 2.187958, 1, 1, 1, 1, 1,
1.560221, 0.7591719, 0.9408743, 1, 1, 1, 1, 1,
1.560581, 1.958503, 1.62558, 1, 1, 1, 1, 1,
1.564515, 1.599262, 1.670045, 1, 1, 1, 1, 1,
1.571907, -0.7633813, 0.475654, 0, 0, 1, 1, 1,
1.573862, -0.5714237, 2.35291, 1, 0, 0, 1, 1,
1.591626, 0.9062129, 0.03883122, 1, 0, 0, 1, 1,
1.595904, -1.299786, 2.697278, 1, 0, 0, 1, 1,
1.599779, -2.723791, 3.814727, 1, 0, 0, 1, 1,
1.607557, 0.50476, 1.295887, 1, 0, 0, 1, 1,
1.609111, 0.6592384, 1.971072, 0, 0, 0, 1, 1,
1.614999, 0.3064871, 0.4913056, 0, 0, 0, 1, 1,
1.622943, -0.2874892, 0.003865506, 0, 0, 0, 1, 1,
1.624934, -0.1573968, 4.362848, 0, 0, 0, 1, 1,
1.637964, -0.01590207, 0.4633863, 0, 0, 0, 1, 1,
1.640236, -2.284904, 0.8367103, 0, 0, 0, 1, 1,
1.647296, -1.351291, 2.007431, 0, 0, 0, 1, 1,
1.650224, -2.004395, 2.981182, 1, 1, 1, 1, 1,
1.657827, -1.234232, 2.087799, 1, 1, 1, 1, 1,
1.658811, 0.3034811, 1.550054, 1, 1, 1, 1, 1,
1.660669, 0.07657129, 0.7083622, 1, 1, 1, 1, 1,
1.662476, 0.7238102, 2.073754, 1, 1, 1, 1, 1,
1.668024, -0.97682, 3.454046, 1, 1, 1, 1, 1,
1.668995, 0.2884724, -0.2289174, 1, 1, 1, 1, 1,
1.670473, 1.380652, 1.400346, 1, 1, 1, 1, 1,
1.689755, -0.1953778, 3.02231, 1, 1, 1, 1, 1,
1.691528, 0.3862266, 1.19005, 1, 1, 1, 1, 1,
1.729208, -0.6539756, 0.7864742, 1, 1, 1, 1, 1,
1.734053, 1.609641, 1.850021, 1, 1, 1, 1, 1,
1.738108, 0.4097081, 0.3712625, 1, 1, 1, 1, 1,
1.750746, 0.197299, 0.2405079, 1, 1, 1, 1, 1,
1.756707, -0.4552718, 1.773052, 1, 1, 1, 1, 1,
1.763618, 0.8846833, 2.543516, 0, 0, 1, 1, 1,
1.791324, -0.5365112, 1.790986, 1, 0, 0, 1, 1,
1.868372, -0.3368226, 1.543285, 1, 0, 0, 1, 1,
1.870824, 1.058702, -0.01596762, 1, 0, 0, 1, 1,
1.902784, -0.6969423, 1.623945, 1, 0, 0, 1, 1,
1.925434, 0.03723044, 1.631273, 1, 0, 0, 1, 1,
1.939831, -1.577267, 0.7482708, 0, 0, 0, 1, 1,
1.941396, -0.7551394, 1.29179, 0, 0, 0, 1, 1,
1.955092, -0.2633214, 1.142879, 0, 0, 0, 1, 1,
1.970442, 0.5407909, 1.390267, 0, 0, 0, 1, 1,
2.013409, -0.4610661, 3.167469, 0, 0, 0, 1, 1,
2.023862, 1.370274, 0.7890038, 0, 0, 0, 1, 1,
2.026874, -1.090216, 1.732523, 0, 0, 0, 1, 1,
2.046096, -1.383081, 1.652032, 1, 1, 1, 1, 1,
2.049708, -1.312476, 3.942101, 1, 1, 1, 1, 1,
2.062321, -1.665716, 2.769076, 1, 1, 1, 1, 1,
2.066792, -1.279601, 2.23766, 1, 1, 1, 1, 1,
2.072884, -0.113132, 2.094939, 1, 1, 1, 1, 1,
2.080684, 1.557902, 0.2311241, 1, 1, 1, 1, 1,
2.109208, 0.7665204, 0.6858445, 1, 1, 1, 1, 1,
2.112193, 0.5217828, 1.449516, 1, 1, 1, 1, 1,
2.134094, -0.2049867, 3.119878, 1, 1, 1, 1, 1,
2.144658, 0.4951674, 1.620647, 1, 1, 1, 1, 1,
2.186653, -1.92706, 3.164913, 1, 1, 1, 1, 1,
2.195918, -1.555508, 1.749348, 1, 1, 1, 1, 1,
2.209782, 0.8904483, 0.8461297, 1, 1, 1, 1, 1,
2.21709, -0.6277378, 0.3624445, 1, 1, 1, 1, 1,
2.218947, -0.735531, -0.173564, 1, 1, 1, 1, 1,
2.226901, 0.2316126, 1.20726, 0, 0, 1, 1, 1,
2.253536, -1.040271, 1.240151, 1, 0, 0, 1, 1,
2.259789, -0.1696112, 2.301559, 1, 0, 0, 1, 1,
2.270052, 0.1968086, 3.131285, 1, 0, 0, 1, 1,
2.277462, -0.8119488, 1.790349, 1, 0, 0, 1, 1,
2.288639, -0.06367692, 2.447941, 1, 0, 0, 1, 1,
2.31806, 0.2157291, 1.999861, 0, 0, 0, 1, 1,
2.319867, 1.474681, 1.727809, 0, 0, 0, 1, 1,
2.325598, 2.183302, 0.5462467, 0, 0, 0, 1, 1,
2.328501, -1.006945, 2.774441, 0, 0, 0, 1, 1,
2.335206, 3.523722, -0.4993486, 0, 0, 0, 1, 1,
2.342762, -0.9555291, 3.924537, 0, 0, 0, 1, 1,
2.357548, -0.1479065, 2.131095, 0, 0, 0, 1, 1,
2.38043, 2.093861, 1.174663, 1, 1, 1, 1, 1,
2.44848, -0.6221957, 2.403437, 1, 1, 1, 1, 1,
2.661051, 0.7332606, 0.2771404, 1, 1, 1, 1, 1,
2.678865, -0.1846855, 1.21381, 1, 1, 1, 1, 1,
2.702482, 0.9783522, 1.819697, 1, 1, 1, 1, 1,
2.871535, 0.7972167, 0.5021992, 1, 1, 1, 1, 1,
3.282678, 2.097615, -0.6054271, 1, 1, 1, 1, 1
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
var radius = 9.564185;
var distance = 33.5938;
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
mvMatrix.translate( -0.12094, -0.2026732, 0.205863 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.5938);
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
