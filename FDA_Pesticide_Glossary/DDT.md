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
-3.358865, 1.054732, -2.785922, 1, 0, 0, 1,
-3.137269, 1.470503, -1.364409, 1, 0.007843138, 0, 1,
-2.950682, -1.442341, -2.884207, 1, 0.01176471, 0, 1,
-2.77761, -0.2136935, -3.749297, 1, 0.01960784, 0, 1,
-2.735062, -1.632577, -1.963589, 1, 0.02352941, 0, 1,
-2.704268, 0.7644632, -0.785269, 1, 0.03137255, 0, 1,
-2.621763, -0.3634326, -1.976288, 1, 0.03529412, 0, 1,
-2.510003, -1.119789, -1.058328, 1, 0.04313726, 0, 1,
-2.457392, -1.775867, -0.9422703, 1, 0.04705882, 0, 1,
-2.316339, 0.662477, -1.844796, 1, 0.05490196, 0, 1,
-2.303189, 0.4212438, -0.9263463, 1, 0.05882353, 0, 1,
-2.264274, 0.8558616, -1.112783, 1, 0.06666667, 0, 1,
-2.237563, -0.5969195, -2.68117, 1, 0.07058824, 0, 1,
-2.22644, 0.008239896, -0.1369001, 1, 0.07843138, 0, 1,
-2.182443, -2.503215, -3.441062, 1, 0.08235294, 0, 1,
-2.175892, -0.4007368, -1.835313, 1, 0.09019608, 0, 1,
-2.151137, 0.4055254, -0.2210765, 1, 0.09411765, 0, 1,
-2.144643, -1.237071, -3.235635, 1, 0.1019608, 0, 1,
-2.138914, -1.184607, -2.735732, 1, 0.1098039, 0, 1,
-2.103164, 1.091438, -0.9537968, 1, 0.1137255, 0, 1,
-2.08701, 0.3132219, -2.562084, 1, 0.1215686, 0, 1,
-2.04029, -0.6625547, -1.202803, 1, 0.1254902, 0, 1,
-2.031322, 0.4793086, -1.83437, 1, 0.1333333, 0, 1,
-1.96107, -0.8019326, -2.545594, 1, 0.1372549, 0, 1,
-1.954645, 0.5104185, -1.454488, 1, 0.145098, 0, 1,
-1.921164, -0.3367321, 0.3177901, 1, 0.1490196, 0, 1,
-1.889594, 1.180612, -0.8813941, 1, 0.1568628, 0, 1,
-1.857983, -1.060575, -3.25529, 1, 0.1607843, 0, 1,
-1.847339, 0.6177955, -2.025075, 1, 0.1686275, 0, 1,
-1.800925, 1.13801, -0.6443526, 1, 0.172549, 0, 1,
-1.794445, -1.236265, -2.133289, 1, 0.1803922, 0, 1,
-1.783204, 0.07614911, -2.703907, 1, 0.1843137, 0, 1,
-1.76869, 0.9364203, -1.462247, 1, 0.1921569, 0, 1,
-1.735754, -0.3779847, -2.469875, 1, 0.1960784, 0, 1,
-1.719196, 1.448916, -1.064163, 1, 0.2039216, 0, 1,
-1.679115, -0.0307738, -0.3292104, 1, 0.2117647, 0, 1,
-1.673651, 0.376278, -1.998816, 1, 0.2156863, 0, 1,
-1.644265, -0.1703359, -0.3752814, 1, 0.2235294, 0, 1,
-1.64289, -0.3345023, -1.382442, 1, 0.227451, 0, 1,
-1.640997, -0.724736, -2.592999, 1, 0.2352941, 0, 1,
-1.614381, 0.9967839, 0.0294816, 1, 0.2392157, 0, 1,
-1.609649, 0.6975317, -0.6715572, 1, 0.2470588, 0, 1,
-1.581881, -1.624679, -1.540117, 1, 0.2509804, 0, 1,
-1.581583, -0.08485437, -1.853597, 1, 0.2588235, 0, 1,
-1.575083, 0.6943554, -0.6308, 1, 0.2627451, 0, 1,
-1.570544, -2.210207, -1.358787, 1, 0.2705882, 0, 1,
-1.54722, 0.7253223, -2.436484, 1, 0.2745098, 0, 1,
-1.536472, -0.384567, -0.7812064, 1, 0.282353, 0, 1,
-1.534044, 0.9008455, -1.46527, 1, 0.2862745, 0, 1,
-1.533745, 0.9977617, -0.6493635, 1, 0.2941177, 0, 1,
-1.533366, -0.817493, -1.860428, 1, 0.3019608, 0, 1,
-1.532577, -0.9170939, -0.5395239, 1, 0.3058824, 0, 1,
-1.51821, 1.225056, 0.3503389, 1, 0.3137255, 0, 1,
-1.501494, 1.23827, 0.9001365, 1, 0.3176471, 0, 1,
-1.497131, -0.2591086, -3.880052, 1, 0.3254902, 0, 1,
-1.494947, 2.505135, -0.5221404, 1, 0.3294118, 0, 1,
-1.494236, -1.029147, -2.250807, 1, 0.3372549, 0, 1,
-1.49363, 1.462773, -0.5628743, 1, 0.3411765, 0, 1,
-1.490398, 1.596597, -1.45445, 1, 0.3490196, 0, 1,
-1.488862, 0.9630523, -1.777744, 1, 0.3529412, 0, 1,
-1.485348, -1.260643, -1.474381, 1, 0.3607843, 0, 1,
-1.484511, 0.7368219, -1.196997, 1, 0.3647059, 0, 1,
-1.483277, -0.07480083, 0.6170235, 1, 0.372549, 0, 1,
-1.482785, 0.348968, 0.3690612, 1, 0.3764706, 0, 1,
-1.460184, 1.241816, -2.27325, 1, 0.3843137, 0, 1,
-1.452721, 0.5485152, 0.283431, 1, 0.3882353, 0, 1,
-1.447217, -0.04377722, -1.30557, 1, 0.3960784, 0, 1,
-1.439075, -0.009134514, -0.7809952, 1, 0.4039216, 0, 1,
-1.430838, 0.9437237, -1.774585, 1, 0.4078431, 0, 1,
-1.416574, 0.7974425, -0.220033, 1, 0.4156863, 0, 1,
-1.401924, -1.42356, -3.036222, 1, 0.4196078, 0, 1,
-1.394022, -0.3680063, -3.073732, 1, 0.427451, 0, 1,
-1.391863, -1.584222, -2.282326, 1, 0.4313726, 0, 1,
-1.385153, -0.8843403, -3.31774, 1, 0.4392157, 0, 1,
-1.383971, 0.1328252, -0.3574618, 1, 0.4431373, 0, 1,
-1.364258, 1.11338, -1.601704, 1, 0.4509804, 0, 1,
-1.355895, -0.4322858, -1.399233, 1, 0.454902, 0, 1,
-1.349664, 1.25291, 0.2450787, 1, 0.4627451, 0, 1,
-1.344605, 1.367342, -4.545789, 1, 0.4666667, 0, 1,
-1.341581, 0.7994378, 0.2690791, 1, 0.4745098, 0, 1,
-1.327047, -1.060808, -1.333283, 1, 0.4784314, 0, 1,
-1.311432, 1.350032, 0.5554226, 1, 0.4862745, 0, 1,
-1.306436, 1.261187, -0.3045389, 1, 0.4901961, 0, 1,
-1.29183, -0.6439478, -3.050148, 1, 0.4980392, 0, 1,
-1.277351, -1.534863, -3.767578, 1, 0.5058824, 0, 1,
-1.261839, 0.9742767, -1.758392, 1, 0.509804, 0, 1,
-1.260211, -1.709959, -3.042271, 1, 0.5176471, 0, 1,
-1.243598, -0.2652081, -1.96447, 1, 0.5215687, 0, 1,
-1.239487, 0.5770281, -1.819176, 1, 0.5294118, 0, 1,
-1.22827, 1.720323, -0.2211137, 1, 0.5333334, 0, 1,
-1.222022, -2.228844, -4.972336, 1, 0.5411765, 0, 1,
-1.215941, 0.5412759, -0.5231685, 1, 0.5450981, 0, 1,
-1.210458, -1.082715, -0.9551649, 1, 0.5529412, 0, 1,
-1.205929, 1.02105, -0.4984498, 1, 0.5568628, 0, 1,
-1.201074, -0.5583367, -2.629982, 1, 0.5647059, 0, 1,
-1.1962, 0.05201282, -1.293639, 1, 0.5686275, 0, 1,
-1.191158, 0.3672036, -0.7689168, 1, 0.5764706, 0, 1,
-1.190691, 0.8519738, -0.2680864, 1, 0.5803922, 0, 1,
-1.185023, 0.730789, -1.671777, 1, 0.5882353, 0, 1,
-1.179412, -0.02938564, -1.509793, 1, 0.5921569, 0, 1,
-1.177086, -0.6944458, -2.780845, 1, 0.6, 0, 1,
-1.172385, -1.054624, -2.482888, 1, 0.6078432, 0, 1,
-1.167759, 0.2386741, -2.789293, 1, 0.6117647, 0, 1,
-1.167364, 0.02519339, -0.8991852, 1, 0.6196079, 0, 1,
-1.162276, -1.213085, -4.93627, 1, 0.6235294, 0, 1,
-1.162157, 0.0907419, -1.090415, 1, 0.6313726, 0, 1,
-1.156552, -1.214076, -2.503585, 1, 0.6352941, 0, 1,
-1.153138, 1.009534, -0.5832593, 1, 0.6431373, 0, 1,
-1.13985, -0.2006159, -2.19364, 1, 0.6470588, 0, 1,
-1.138808, 1.312575, 0.3357313, 1, 0.654902, 0, 1,
-1.133334, -1.541788, -3.327632, 1, 0.6588235, 0, 1,
-1.132553, 1.515714, -1.769352, 1, 0.6666667, 0, 1,
-1.123416, -0.8490288, -2.164176, 1, 0.6705883, 0, 1,
-1.122345, -0.1217959, -0.8000511, 1, 0.6784314, 0, 1,
-1.11947, 0.6237993, -1.222036, 1, 0.682353, 0, 1,
-1.119193, -1.127521, 0.1657958, 1, 0.6901961, 0, 1,
-1.115147, 1.699389, -1.704792, 1, 0.6941177, 0, 1,
-1.113617, -0.8224655, -2.583159, 1, 0.7019608, 0, 1,
-1.104372, 0.4023139, -1.934262, 1, 0.7098039, 0, 1,
-1.100927, 0.09941581, 0.5140252, 1, 0.7137255, 0, 1,
-1.098386, -0.6678366, -2.011855, 1, 0.7215686, 0, 1,
-1.096696, 0.9809116, -0.8899331, 1, 0.7254902, 0, 1,
-1.095914, -0.5627841, -2.067893, 1, 0.7333333, 0, 1,
-1.092679, -0.3221084, -2.311128, 1, 0.7372549, 0, 1,
-1.089791, -1.686625, -4.617874, 1, 0.7450981, 0, 1,
-1.085539, -1.69939, -1.555214, 1, 0.7490196, 0, 1,
-1.084676, 1.947906, 0.6437541, 1, 0.7568628, 0, 1,
-1.078626, 0.7300841, -1.209393, 1, 0.7607843, 0, 1,
-1.077174, -0.620268, -0.7570146, 1, 0.7686275, 0, 1,
-1.074012, 0.07009668, -1.078477, 1, 0.772549, 0, 1,
-1.068659, 0.4723197, -0.07456619, 1, 0.7803922, 0, 1,
-1.065392, -1.37287, -1.354521, 1, 0.7843137, 0, 1,
-1.060567, 0.976709, -0.4037271, 1, 0.7921569, 0, 1,
-1.060453, 0.7608316, -1.237672, 1, 0.7960784, 0, 1,
-1.059066, 0.1237055, -1.689848, 1, 0.8039216, 0, 1,
-1.058518, -1.10465, -3.811187, 1, 0.8117647, 0, 1,
-1.057804, 1.63949, -0.7689762, 1, 0.8156863, 0, 1,
-1.054016, 0.6221376, 0.4676441, 1, 0.8235294, 0, 1,
-1.053776, -0.9906485, -2.148275, 1, 0.827451, 0, 1,
-1.045973, -1.634038, -2.461874, 1, 0.8352941, 0, 1,
-1.04359, -2.313434, -3.124326, 1, 0.8392157, 0, 1,
-1.043258, 1.009979, -2.150717, 1, 0.8470588, 0, 1,
-1.041963, 0.4614862, -1.99784, 1, 0.8509804, 0, 1,
-1.041842, 1.402358, -0.01014012, 1, 0.8588235, 0, 1,
-1.030519, 0.520789, -1.4693, 1, 0.8627451, 0, 1,
-1.011168, -0.572223, -1.740439, 1, 0.8705882, 0, 1,
-1.008391, -0.1570284, -4.567545, 1, 0.8745098, 0, 1,
-1.002913, 0.3220075, -2.924675, 1, 0.8823529, 0, 1,
-1.00075, 0.3234388, 0.51783, 1, 0.8862745, 0, 1,
-0.9997163, -0.4651582, -0.0299088, 1, 0.8941177, 0, 1,
-0.9982136, -0.1336422, -1.243472, 1, 0.8980392, 0, 1,
-0.9972227, 0.3950823, -2.29278, 1, 0.9058824, 0, 1,
-0.9964057, -0.8400585, -0.7561509, 1, 0.9137255, 0, 1,
-0.9881754, 1.191702, -0.622635, 1, 0.9176471, 0, 1,
-0.9854216, -0.1824556, -0.7694026, 1, 0.9254902, 0, 1,
-0.9819284, 1.358675, -1.910307, 1, 0.9294118, 0, 1,
-0.9752597, -0.8187848, -2.568789, 1, 0.9372549, 0, 1,
-0.9748908, 0.4865127, -1.242413, 1, 0.9411765, 0, 1,
-0.9702949, 0.691314, -0.4471897, 1, 0.9490196, 0, 1,
-0.9618627, -0.5677699, -1.375069, 1, 0.9529412, 0, 1,
-0.9615446, 0.2342099, -0.3064758, 1, 0.9607843, 0, 1,
-0.9610565, 1.094334, -0.7974654, 1, 0.9647059, 0, 1,
-0.958602, 0.2149034, -2.023657, 1, 0.972549, 0, 1,
-0.954751, -0.2614672, -2.929185, 1, 0.9764706, 0, 1,
-0.9537794, 1.250204, -0.1206251, 1, 0.9843137, 0, 1,
-0.9483894, 0.004750392, -3.312463, 1, 0.9882353, 0, 1,
-0.9443759, -0.587211, -2.329544, 1, 0.9960784, 0, 1,
-0.9427649, 0.7904298, -1.17186, 0.9960784, 1, 0, 1,
-0.9392182, -0.06055748, -1.87714, 0.9921569, 1, 0, 1,
-0.9343934, -0.5068791, -2.310656, 0.9843137, 1, 0, 1,
-0.9236183, 2.988258, -0.1294381, 0.9803922, 1, 0, 1,
-0.9228634, -1.186133, -0.4825218, 0.972549, 1, 0, 1,
-0.9209346, 0.6947263, -0.7712097, 0.9686275, 1, 0, 1,
-0.92018, 1.481403, -0.2232397, 0.9607843, 1, 0, 1,
-0.9155436, -1.738755, -1.442044, 0.9568627, 1, 0, 1,
-0.9142405, -1.311233, -3.9969, 0.9490196, 1, 0, 1,
-0.9123065, -1.885367, -2.464154, 0.945098, 1, 0, 1,
-0.9034811, -1.408931, -1.568492, 0.9372549, 1, 0, 1,
-0.8955798, -0.5379623, -3.400007, 0.9333333, 1, 0, 1,
-0.8941603, 0.1878602, 0.0856106, 0.9254902, 1, 0, 1,
-0.8792518, -1.395115, -4.232533, 0.9215686, 1, 0, 1,
-0.8792406, -0.8378987, -2.815005, 0.9137255, 1, 0, 1,
-0.8785608, 0.3124515, -1.380883, 0.9098039, 1, 0, 1,
-0.8753271, 0.3125483, 0.1101048, 0.9019608, 1, 0, 1,
-0.8693315, -0.6953902, -1.944517, 0.8941177, 1, 0, 1,
-0.8689256, 0.08910146, -2.175038, 0.8901961, 1, 0, 1,
-0.8684698, -0.2640279, -2.17789, 0.8823529, 1, 0, 1,
-0.8650315, 0.1020714, -2.073498, 0.8784314, 1, 0, 1,
-0.8626082, -1.853348, -2.250906, 0.8705882, 1, 0, 1,
-0.8611996, -0.6330823, -0.1589826, 0.8666667, 1, 0, 1,
-0.8601648, -0.4878489, -2.717436, 0.8588235, 1, 0, 1,
-0.8576155, -0.09436987, -0.7075031, 0.854902, 1, 0, 1,
-0.8472102, 0.0008187474, -2.198419, 0.8470588, 1, 0, 1,
-0.8387956, -0.6113544, -2.449852, 0.8431373, 1, 0, 1,
-0.8353266, 0.06025759, -2.397129, 0.8352941, 1, 0, 1,
-0.8337132, 0.6991186, -1.933001, 0.8313726, 1, 0, 1,
-0.8257574, 0.05934869, -1.602365, 0.8235294, 1, 0, 1,
-0.8233899, 0.01452447, -1.587946, 0.8196079, 1, 0, 1,
-0.8138524, 1.396457, -0.2759404, 0.8117647, 1, 0, 1,
-0.812521, -1.896632, -1.753369, 0.8078431, 1, 0, 1,
-0.8117818, 1.484913, 0.992436, 0.8, 1, 0, 1,
-0.8102039, 1.481921, 0.463803, 0.7921569, 1, 0, 1,
-0.8051847, 0.7120529, -0.1530841, 0.7882353, 1, 0, 1,
-0.8030281, -0.9999323, -3.332751, 0.7803922, 1, 0, 1,
-0.8009893, 0.6887614, -1.416462, 0.7764706, 1, 0, 1,
-0.7960971, -0.9939584, -4.561749, 0.7686275, 1, 0, 1,
-0.791668, -0.5999715, -1.69628, 0.7647059, 1, 0, 1,
-0.7872114, -1.290164, -1.580271, 0.7568628, 1, 0, 1,
-0.7857208, -0.2098008, -2.402426, 0.7529412, 1, 0, 1,
-0.7763456, -0.6478626, -1.332164, 0.7450981, 1, 0, 1,
-0.7762884, -1.46306, -3.333529, 0.7411765, 1, 0, 1,
-0.7732728, 0.6186375, -0.4937982, 0.7333333, 1, 0, 1,
-0.7708511, -0.795705, -2.723648, 0.7294118, 1, 0, 1,
-0.7698608, -0.1348147, -1.071818, 0.7215686, 1, 0, 1,
-0.7635739, -0.5228664, -2.177054, 0.7176471, 1, 0, 1,
-0.7631038, -0.4403897, -3.077517, 0.7098039, 1, 0, 1,
-0.7593524, -0.2879386, -3.614442, 0.7058824, 1, 0, 1,
-0.7526822, -0.5601557, -2.198582, 0.6980392, 1, 0, 1,
-0.7523434, -1.320349, -3.73158, 0.6901961, 1, 0, 1,
-0.7516968, 1.110304, 0.7147433, 0.6862745, 1, 0, 1,
-0.7510403, 0.1874112, -2.111336, 0.6784314, 1, 0, 1,
-0.7491749, 0.3826239, -1.310101, 0.6745098, 1, 0, 1,
-0.7479112, -2.176656, -2.347745, 0.6666667, 1, 0, 1,
-0.7476999, 1.150608, -0.3456106, 0.6627451, 1, 0, 1,
-0.7476553, -0.8717195, -2.03839, 0.654902, 1, 0, 1,
-0.7474558, 0.03338519, -2.520443, 0.6509804, 1, 0, 1,
-0.7430533, 0.005400561, -1.188367, 0.6431373, 1, 0, 1,
-0.7269362, 0.009243657, -2.066258, 0.6392157, 1, 0, 1,
-0.7268808, 1.167306, -0.09366407, 0.6313726, 1, 0, 1,
-0.7236757, -0.3343914, -0.4216058, 0.627451, 1, 0, 1,
-0.718971, 0.6238605, -1.211831, 0.6196079, 1, 0, 1,
-0.7152846, -0.7999259, -2.783333, 0.6156863, 1, 0, 1,
-0.7152733, 2.406888, -0.6672778, 0.6078432, 1, 0, 1,
-0.7135333, -0.1623003, -0.8859661, 0.6039216, 1, 0, 1,
-0.7121512, 0.7379709, -2.350514, 0.5960785, 1, 0, 1,
-0.7114333, 0.3636284, -3.67689, 0.5882353, 1, 0, 1,
-0.7101774, 0.09904519, -0.599782, 0.5843138, 1, 0, 1,
-0.7094817, 2.494328, 0.6266013, 0.5764706, 1, 0, 1,
-0.6978151, -0.803549, -1.9028, 0.572549, 1, 0, 1,
-0.6955975, 1.085563, -0.8743873, 0.5647059, 1, 0, 1,
-0.68678, -0.3720807, -3.858043, 0.5607843, 1, 0, 1,
-0.6840877, -0.1821059, -1.487137, 0.5529412, 1, 0, 1,
-0.6835783, 1.965603, -1.511759, 0.5490196, 1, 0, 1,
-0.6800925, 1.105841, -0.1966465, 0.5411765, 1, 0, 1,
-0.6785836, -0.4106586, -2.553886, 0.5372549, 1, 0, 1,
-0.6785022, 1.500455, -0.5551548, 0.5294118, 1, 0, 1,
-0.6746113, 0.316223, -1.704663, 0.5254902, 1, 0, 1,
-0.6685898, 0.6208604, 0.06740644, 0.5176471, 1, 0, 1,
-0.663177, -0.7165591, -0.7954873, 0.5137255, 1, 0, 1,
-0.6581502, 0.1437963, -1.054221, 0.5058824, 1, 0, 1,
-0.6506365, 0.8857509, -0.7743617, 0.5019608, 1, 0, 1,
-0.6500696, -0.5693167, -1.971505, 0.4941176, 1, 0, 1,
-0.6491627, -0.7779335, -2.521284, 0.4862745, 1, 0, 1,
-0.647743, 0.9415983, -0.3202447, 0.4823529, 1, 0, 1,
-0.6473661, -1.85844, -3.028113, 0.4745098, 1, 0, 1,
-0.6463555, -0.630767, -2.637939, 0.4705882, 1, 0, 1,
-0.6410674, -0.06403191, -1.501184, 0.4627451, 1, 0, 1,
-0.6372482, -1.415147, -1.954718, 0.4588235, 1, 0, 1,
-0.6351218, -0.702567, -4.422698, 0.4509804, 1, 0, 1,
-0.6328016, -1.392448, -1.168012, 0.4470588, 1, 0, 1,
-0.63192, 0.2154359, -1.142238, 0.4392157, 1, 0, 1,
-0.6295866, -0.4422508, -2.139604, 0.4352941, 1, 0, 1,
-0.6274551, -0.6591507, -1.46795, 0.427451, 1, 0, 1,
-0.6273578, 0.5629504, -1.252986, 0.4235294, 1, 0, 1,
-0.6198871, -0.5371465, -2.85211, 0.4156863, 1, 0, 1,
-0.6148293, 0.9827809, -0.4835213, 0.4117647, 1, 0, 1,
-0.6147897, 1.055235, -0.9508868, 0.4039216, 1, 0, 1,
-0.6121396, -1.870767, -3.268752, 0.3960784, 1, 0, 1,
-0.6096302, 0.4860655, -1.626592, 0.3921569, 1, 0, 1,
-0.6084543, 0.0930143, -0.6121972, 0.3843137, 1, 0, 1,
-0.6066068, 1.499694, 0.2408012, 0.3803922, 1, 0, 1,
-0.604528, -1.598425, -2.730525, 0.372549, 1, 0, 1,
-0.6011413, -0.8702423, -3.303538, 0.3686275, 1, 0, 1,
-0.6010438, -1.033871, -2.712267, 0.3607843, 1, 0, 1,
-0.5977753, -0.2898974, -2.368162, 0.3568628, 1, 0, 1,
-0.5879868, 0.3125754, 0.5405852, 0.3490196, 1, 0, 1,
-0.5869333, -0.3543769, -0.0006977949, 0.345098, 1, 0, 1,
-0.5816018, -0.7239392, -1.524384, 0.3372549, 1, 0, 1,
-0.5790753, -0.1441595, -1.29292, 0.3333333, 1, 0, 1,
-0.5787645, -0.2684208, -1.826471, 0.3254902, 1, 0, 1,
-0.5747531, 0.3176427, -1.09145, 0.3215686, 1, 0, 1,
-0.5745019, 0.7004529, -0.3709601, 0.3137255, 1, 0, 1,
-0.5731333, -1.477802, -1.855827, 0.3098039, 1, 0, 1,
-0.5711959, 0.7622151, -2.24617, 0.3019608, 1, 0, 1,
-0.5690861, 1.919302, -1.001948, 0.2941177, 1, 0, 1,
-0.5621921, -0.5251408, -3.08571, 0.2901961, 1, 0, 1,
-0.5542073, 0.5298162, -1.012225, 0.282353, 1, 0, 1,
-0.5484774, 1.852965, -0.430989, 0.2784314, 1, 0, 1,
-0.5419552, 0.07688844, -1.248117, 0.2705882, 1, 0, 1,
-0.5390156, 1.748671, 1.001192, 0.2666667, 1, 0, 1,
-0.5378195, -2.718917, -2.331041, 0.2588235, 1, 0, 1,
-0.5354516, -1.409613, -2.765444, 0.254902, 1, 0, 1,
-0.5249065, -0.326187, -3.500894, 0.2470588, 1, 0, 1,
-0.5220446, -1.703255, -1.822063, 0.2431373, 1, 0, 1,
-0.521962, 0.6167761, 0.1653848, 0.2352941, 1, 0, 1,
-0.5187783, 0.2968659, -1.77542, 0.2313726, 1, 0, 1,
-0.5174525, -0.02853905, -3.246486, 0.2235294, 1, 0, 1,
-0.5105569, -0.9802965, -1.938208, 0.2196078, 1, 0, 1,
-0.5040342, 0.04991069, -1.654093, 0.2117647, 1, 0, 1,
-0.4951506, -1.14117, -1.088928, 0.2078431, 1, 0, 1,
-0.4935441, 0.4063243, -1.008338, 0.2, 1, 0, 1,
-0.4902859, 0.129468, -0.4730508, 0.1921569, 1, 0, 1,
-0.4884442, 0.9891097, -0.7943454, 0.1882353, 1, 0, 1,
-0.4879136, 1.397311, -0.6206287, 0.1803922, 1, 0, 1,
-0.48757, 0.8286987, -0.7846498, 0.1764706, 1, 0, 1,
-0.4869705, 0.3501808, -1.711645, 0.1686275, 1, 0, 1,
-0.4860409, 0.2950638, -2.795377, 0.1647059, 1, 0, 1,
-0.4816151, 0.920163, 2.148192, 0.1568628, 1, 0, 1,
-0.4813805, 1.750816, 0.1222809, 0.1529412, 1, 0, 1,
-0.4782048, 0.940547, -0.2500339, 0.145098, 1, 0, 1,
-0.4764, 0.5542466, 0.6420163, 0.1411765, 1, 0, 1,
-0.4750891, 1.974455, 1.66479, 0.1333333, 1, 0, 1,
-0.4726131, 0.2828407, -2.006038, 0.1294118, 1, 0, 1,
-0.4724605, -0.3537245, -2.170234, 0.1215686, 1, 0, 1,
-0.4680902, 0.8212761, -0.4643148, 0.1176471, 1, 0, 1,
-0.4622197, -0.9819336, -2.691369, 0.1098039, 1, 0, 1,
-0.4606004, -0.4652371, -2.012215, 0.1058824, 1, 0, 1,
-0.4576396, 1.211012, 0.8160796, 0.09803922, 1, 0, 1,
-0.4561368, 0.1566861, 0.6380957, 0.09019608, 1, 0, 1,
-0.4559106, 1.348878, 1.179733, 0.08627451, 1, 0, 1,
-0.4538455, 0.1146366, -0.07549009, 0.07843138, 1, 0, 1,
-0.4522176, 2.306398, -0.1263976, 0.07450981, 1, 0, 1,
-0.4509152, -1.478804, -4.013046, 0.06666667, 1, 0, 1,
-0.4499954, -0.9774544, -2.911182, 0.0627451, 1, 0, 1,
-0.4321398, -0.5503233, -1.774359, 0.05490196, 1, 0, 1,
-0.4320974, -0.4685788, -2.680649, 0.05098039, 1, 0, 1,
-0.4283485, 0.2308877, -0.4935976, 0.04313726, 1, 0, 1,
-0.4280343, 0.6657643, -2.072825, 0.03921569, 1, 0, 1,
-0.4268695, 0.1518253, -2.407905, 0.03137255, 1, 0, 1,
-0.4263546, -0.7642492, -3.821333, 0.02745098, 1, 0, 1,
-0.4235489, 0.2851394, -0.6306137, 0.01960784, 1, 0, 1,
-0.4148953, -0.4905159, -3.582728, 0.01568628, 1, 0, 1,
-0.4141173, 0.868506, -0.7739007, 0.007843138, 1, 0, 1,
-0.4120967, -1.983879, -2.842479, 0.003921569, 1, 0, 1,
-0.4113315, 0.02794815, -1.772513, 0, 1, 0.003921569, 1,
-0.4106838, 0.0915449, -0.2051124, 0, 1, 0.01176471, 1,
-0.4099799, 0.4456538, -1.028924, 0, 1, 0.01568628, 1,
-0.4078727, 0.1870279, -0.3760569, 0, 1, 0.02352941, 1,
-0.4011944, -0.2033846, -3.427483, 0, 1, 0.02745098, 1,
-0.3964465, 2.030116, -0.8430375, 0, 1, 0.03529412, 1,
-0.3893588, -2.667769, -1.664439, 0, 1, 0.03921569, 1,
-0.3863762, -0.3224783, -1.704973, 0, 1, 0.04705882, 1,
-0.3857367, 1.549794, -1.38249, 0, 1, 0.05098039, 1,
-0.3841797, -0.6453171, -2.346094, 0, 1, 0.05882353, 1,
-0.3835177, 0.282546, -0.4142922, 0, 1, 0.0627451, 1,
-0.3832102, -1.061678, -3.345837, 0, 1, 0.07058824, 1,
-0.3828713, 1.609627, -1.900842, 0, 1, 0.07450981, 1,
-0.377567, 1.336062, -0.284336, 0, 1, 0.08235294, 1,
-0.3752247, 0.6881177, -0.6848358, 0, 1, 0.08627451, 1,
-0.3737451, -0.2484594, -1.570185, 0, 1, 0.09411765, 1,
-0.3735328, -0.727342, -2.612628, 0, 1, 0.1019608, 1,
-0.3684399, 0.04467556, -0.4925, 0, 1, 0.1058824, 1,
-0.3682984, -0.7620307, -3.924406, 0, 1, 0.1137255, 1,
-0.3677908, -1.308103, -2.545052, 0, 1, 0.1176471, 1,
-0.3631942, -3.178706, -2.003117, 0, 1, 0.1254902, 1,
-0.360402, 0.3391827, -0.5595264, 0, 1, 0.1294118, 1,
-0.3596202, 1.327093, 1.787465, 0, 1, 0.1372549, 1,
-0.3549706, 0.9589216, -1.321661, 0, 1, 0.1411765, 1,
-0.3533176, 0.8655024, -1.897768, 0, 1, 0.1490196, 1,
-0.3495491, -0.302259, -1.960991, 0, 1, 0.1529412, 1,
-0.3452794, -0.7230582, -4.089174, 0, 1, 0.1607843, 1,
-0.3423713, 1.080099, -0.5256761, 0, 1, 0.1647059, 1,
-0.3396533, 0.6443363, -2.052088, 0, 1, 0.172549, 1,
-0.3359517, -0.9895044, -3.346863, 0, 1, 0.1764706, 1,
-0.334615, -0.2945304, -4.73989, 0, 1, 0.1843137, 1,
-0.3341039, -2.352105, -3.703123, 0, 1, 0.1882353, 1,
-0.3306176, -0.3003079, -2.88552, 0, 1, 0.1960784, 1,
-0.3285839, 0.1119275, -0.7995666, 0, 1, 0.2039216, 1,
-0.3270919, -0.406049, -1.664171, 0, 1, 0.2078431, 1,
-0.325737, 0.5392059, -1.465341, 0, 1, 0.2156863, 1,
-0.3235999, 0.01167854, -0.8613323, 0, 1, 0.2196078, 1,
-0.3232758, 0.06035901, -1.160554, 0, 1, 0.227451, 1,
-0.3216908, 0.1626559, -3.480272, 0, 1, 0.2313726, 1,
-0.3139809, 1.479467, 0.6499513, 0, 1, 0.2392157, 1,
-0.3123937, 0.8646087, -0.2450077, 0, 1, 0.2431373, 1,
-0.3110754, 0.5366297, 0.2387071, 0, 1, 0.2509804, 1,
-0.3082987, 0.2507387, -0.8893484, 0, 1, 0.254902, 1,
-0.3079077, -0.423279, -1.875622, 0, 1, 0.2627451, 1,
-0.3042148, -0.2674312, -3.136656, 0, 1, 0.2666667, 1,
-0.3013347, 1.569517, 1.185763, 0, 1, 0.2745098, 1,
-0.2964328, -0.06503627, -1.143804, 0, 1, 0.2784314, 1,
-0.2961485, 0.871819, -0.2127544, 0, 1, 0.2862745, 1,
-0.2894941, 1.260297, -1.341084, 0, 1, 0.2901961, 1,
-0.2813457, 0.8341123, 0.2047191, 0, 1, 0.2980392, 1,
-0.2746091, 0.57166, -1.225449, 0, 1, 0.3058824, 1,
-0.2725371, -0.7558288, -4.204278, 0, 1, 0.3098039, 1,
-0.2705764, 0.9427599, 0.7504441, 0, 1, 0.3176471, 1,
-0.2620218, -0.9896523, -2.43551, 0, 1, 0.3215686, 1,
-0.2601469, -0.6677065, -3.463976, 0, 1, 0.3294118, 1,
-0.2595059, 0.05906506, -3.056429, 0, 1, 0.3333333, 1,
-0.2579572, 0.3450895, 0.475487, 0, 1, 0.3411765, 1,
-0.2562121, -1.518908, -1.763235, 0, 1, 0.345098, 1,
-0.2547084, 0.420305, -0.4016665, 0, 1, 0.3529412, 1,
-0.2499281, 1.087547, 0.7202153, 0, 1, 0.3568628, 1,
-0.2494565, 0.6716279, -1.751912, 0, 1, 0.3647059, 1,
-0.2468812, -1.489791, -2.9922, 0, 1, 0.3686275, 1,
-0.2459059, 0.1039053, -2.186353, 0, 1, 0.3764706, 1,
-0.2449409, 1.908199, -0.4463302, 0, 1, 0.3803922, 1,
-0.2439676, -0.857906, -3.309862, 0, 1, 0.3882353, 1,
-0.2425888, 0.1095012, -1.835832, 0, 1, 0.3921569, 1,
-0.2393119, -1.56525, -3.647893, 0, 1, 0.4, 1,
-0.2334531, 0.1257816, -0.3575833, 0, 1, 0.4078431, 1,
-0.2319602, 0.8881742, 0.02111057, 0, 1, 0.4117647, 1,
-0.2311662, 1.295251, 0.2771741, 0, 1, 0.4196078, 1,
-0.2307844, 0.115837, -1.714981, 0, 1, 0.4235294, 1,
-0.2301605, 2.394468, -0.5583121, 0, 1, 0.4313726, 1,
-0.2253067, 0.02417883, -3.21485, 0, 1, 0.4352941, 1,
-0.2224534, 1.044276, -0.8953418, 0, 1, 0.4431373, 1,
-0.2129024, 1.806169, -0.7346189, 0, 1, 0.4470588, 1,
-0.2095829, 0.8491177, 0.3920813, 0, 1, 0.454902, 1,
-0.209118, 1.450785, -0.2010095, 0, 1, 0.4588235, 1,
-0.206763, -0.02173069, -2.75443, 0, 1, 0.4666667, 1,
-0.2061771, -0.4334589, -2.553033, 0, 1, 0.4705882, 1,
-0.2054552, 1.072107, 1.696074, 0, 1, 0.4784314, 1,
-0.2051601, -1.489437, -3.582883, 0, 1, 0.4823529, 1,
-0.2047412, 0.7929898, 0.1360289, 0, 1, 0.4901961, 1,
-0.2042909, -0.770387, -2.562354, 0, 1, 0.4941176, 1,
-0.2034444, 0.06979585, -0.7940015, 0, 1, 0.5019608, 1,
-0.2025896, -0.2923715, -3.193308, 0, 1, 0.509804, 1,
-0.2025472, -1.376695, -2.839087, 0, 1, 0.5137255, 1,
-0.197646, -0.7351955, -3.297988, 0, 1, 0.5215687, 1,
-0.1972591, -1.841352, -4.905065, 0, 1, 0.5254902, 1,
-0.195183, -1.15298, -2.534574, 0, 1, 0.5333334, 1,
-0.1947675, -1.148054, -2.73655, 0, 1, 0.5372549, 1,
-0.1945415, -0.6899722, -1.849346, 0, 1, 0.5450981, 1,
-0.1915728, -0.4707019, -3.320325, 0, 1, 0.5490196, 1,
-0.1825268, -0.2583561, -2.063187, 0, 1, 0.5568628, 1,
-0.1778326, -1.067109, -1.037851, 0, 1, 0.5607843, 1,
-0.1770212, 0.01859588, -0.9619564, 0, 1, 0.5686275, 1,
-0.1759915, 0.1017684, -1.944956, 0, 1, 0.572549, 1,
-0.173259, -0.7446366, -3.113323, 0, 1, 0.5803922, 1,
-0.1717113, 1.010396, 0.615055, 0, 1, 0.5843138, 1,
-0.1708966, -0.8545508, -2.521508, 0, 1, 0.5921569, 1,
-0.1704399, -0.5007508, -2.595786, 0, 1, 0.5960785, 1,
-0.1679088, -0.2419347, -2.648824, 0, 1, 0.6039216, 1,
-0.1652087, -1.06891, -5.315328, 0, 1, 0.6117647, 1,
-0.1626402, -2.046798, -3.849503, 0, 1, 0.6156863, 1,
-0.1609729, -1.201381, -2.599383, 0, 1, 0.6235294, 1,
-0.1608024, -0.1506155, -2.181642, 0, 1, 0.627451, 1,
-0.1590354, -0.6723093, -0.7275838, 0, 1, 0.6352941, 1,
-0.1585218, -0.1363311, -1.586226, 0, 1, 0.6392157, 1,
-0.1569932, 1.369324, 1.043291, 0, 1, 0.6470588, 1,
-0.1538162, 0.9968573, 1.260996, 0, 1, 0.6509804, 1,
-0.1470618, 0.465986, -2.195776, 0, 1, 0.6588235, 1,
-0.1457634, 1.094053, 1.172458, 0, 1, 0.6627451, 1,
-0.1213458, 0.07622569, -0.8055385, 0, 1, 0.6705883, 1,
-0.1201474, 0.296402, -0.6747869, 0, 1, 0.6745098, 1,
-0.1196912, 1.088696, -0.8208897, 0, 1, 0.682353, 1,
-0.1168905, 0.2645214, -0.07207844, 0, 1, 0.6862745, 1,
-0.1154827, 1.360131, -1.461643, 0, 1, 0.6941177, 1,
-0.1092079, 0.4464137, 0.2884615, 0, 1, 0.7019608, 1,
-0.1040567, 0.1478137, 0.08306932, 0, 1, 0.7058824, 1,
-0.1002209, -0.3098088, -3.330489, 0, 1, 0.7137255, 1,
-0.09980894, -0.6769692, -2.317941, 0, 1, 0.7176471, 1,
-0.09591629, 0.498426, 0.8064075, 0, 1, 0.7254902, 1,
-0.09503865, 0.3197693, 0.09964874, 0, 1, 0.7294118, 1,
-0.09328859, 2.191715, 0.1266244, 0, 1, 0.7372549, 1,
-0.09220105, -0.2477603, -4.080227, 0, 1, 0.7411765, 1,
-0.09135996, -2.101854, -3.34857, 0, 1, 0.7490196, 1,
-0.09027027, 1.032385, 1.076367, 0, 1, 0.7529412, 1,
-0.0896256, 0.4671658, -1.866233, 0, 1, 0.7607843, 1,
-0.08691898, 1.273196, -0.9460821, 0, 1, 0.7647059, 1,
-0.08366077, -0.07506131, -1.654306, 0, 1, 0.772549, 1,
-0.08167244, -1.501336, -2.242913, 0, 1, 0.7764706, 1,
-0.08114538, 1.198348, 0.2568882, 0, 1, 0.7843137, 1,
-0.08074102, 1.465314, 0.3223364, 0, 1, 0.7882353, 1,
-0.07414753, -0.5874723, -4.473995, 0, 1, 0.7960784, 1,
-0.06952984, -0.3724056, -3.027741, 0, 1, 0.8039216, 1,
-0.06858322, 0.5567229, 1.047344, 0, 1, 0.8078431, 1,
-0.06713314, -1.124874, -1.59773, 0, 1, 0.8156863, 1,
-0.06647272, -0.4166608, -1.209196, 0, 1, 0.8196079, 1,
-0.06437618, -1.181872, -2.516711, 0, 1, 0.827451, 1,
-0.05878953, -1.152246, -2.722943, 0, 1, 0.8313726, 1,
-0.05799912, -0.5811642, -3.051956, 0, 1, 0.8392157, 1,
-0.05727415, -0.3842896, -4.136922, 0, 1, 0.8431373, 1,
-0.05282967, -0.3170574, -2.345017, 0, 1, 0.8509804, 1,
-0.05267493, -1.256135, -3.876406, 0, 1, 0.854902, 1,
-0.05213616, 0.4745934, 0.9293884, 0, 1, 0.8627451, 1,
-0.05134796, 0.6457219, 1.358538, 0, 1, 0.8666667, 1,
-0.04382414, 1.076009, -0.06557847, 0, 1, 0.8745098, 1,
-0.03990157, -1.06717, -3.421704, 0, 1, 0.8784314, 1,
-0.0390832, 0.6460789, 0.02910372, 0, 1, 0.8862745, 1,
-0.03511286, 0.1243334, -2.076176, 0, 1, 0.8901961, 1,
-0.03094748, -1.982874, -4.173572, 0, 1, 0.8980392, 1,
-0.02742758, -1.762228, -4.312647, 0, 1, 0.9058824, 1,
-0.02728458, -1.516326, -4.401485, 0, 1, 0.9098039, 1,
-0.02668601, 1.764719, 1.104167, 0, 1, 0.9176471, 1,
-0.02649916, 0.4909782, -0.7601638, 0, 1, 0.9215686, 1,
-0.02519562, 0.3954884, -1.239155, 0, 1, 0.9294118, 1,
-0.02495245, 0.4334106, -0.1154608, 0, 1, 0.9333333, 1,
-0.02445538, -0.7165695, -4.517615, 0, 1, 0.9411765, 1,
-0.02221727, -0.2130649, -1.635932, 0, 1, 0.945098, 1,
-0.02188608, 0.5728315, 0.8560246, 0, 1, 0.9529412, 1,
-0.02058498, 0.2675914, 0.2216452, 0, 1, 0.9568627, 1,
-0.01563068, 1.200836, -0.4240031, 0, 1, 0.9647059, 1,
-0.01190305, 1.528504, 1.110832, 0, 1, 0.9686275, 1,
-0.01186508, 0.8945885, 0.3931022, 0, 1, 0.9764706, 1,
-0.004251849, -0.5991852, -2.270793, 0, 1, 0.9803922, 1,
-0.003559598, -3.202493, -3.830376, 0, 1, 0.9882353, 1,
-0.002930679, -0.1093136, -2.970968, 0, 1, 0.9921569, 1,
-0.002614039, 0.5409955, -1.819697, 0, 1, 1, 1,
-0.002419008, -1.397168, -2.144374, 0, 0.9921569, 1, 1,
0.0005419932, 1.654622, -0.08000611, 0, 0.9882353, 1, 1,
0.0007693919, 1.255876, 0.4955881, 0, 0.9803922, 1, 1,
0.006731097, 1.113224, -0.3713327, 0, 0.9764706, 1, 1,
0.008733895, -1.313059, 2.331065, 0, 0.9686275, 1, 1,
0.01215723, -0.4535706, 4.180842, 0, 0.9647059, 1, 1,
0.01500806, -0.9926309, 3.431152, 0, 0.9568627, 1, 1,
0.01553885, -1.438145, 2.658635, 0, 0.9529412, 1, 1,
0.02047079, 1.168365, 0.1943616, 0, 0.945098, 1, 1,
0.02502349, -0.8057274, 3.137328, 0, 0.9411765, 1, 1,
0.02559013, 0.8745148, 1.390571, 0, 0.9333333, 1, 1,
0.02677332, -2.254553, 4.044187, 0, 0.9294118, 1, 1,
0.03092729, 0.3105884, -0.2168861, 0, 0.9215686, 1, 1,
0.03305509, -0.01885416, 2.66449, 0, 0.9176471, 1, 1,
0.03559151, 1.0601, 0.2045839, 0, 0.9098039, 1, 1,
0.03831402, -0.5755101, 3.563308, 0, 0.9058824, 1, 1,
0.03890358, -1.445753, 2.366066, 0, 0.8980392, 1, 1,
0.03960296, 1.380051, 0.1315419, 0, 0.8901961, 1, 1,
0.04012046, 0.6707987, -0.319281, 0, 0.8862745, 1, 1,
0.04508284, -0.2465904, 1.434351, 0, 0.8784314, 1, 1,
0.04559691, 0.3805756, -1.110628, 0, 0.8745098, 1, 1,
0.04688255, -1.369317, 2.787405, 0, 0.8666667, 1, 1,
0.0476076, -1.379451, 3.191926, 0, 0.8627451, 1, 1,
0.04821359, -1.950438, 3.016352, 0, 0.854902, 1, 1,
0.05644455, 0.01519833, 1.424616, 0, 0.8509804, 1, 1,
0.05848363, 1.251443, 0.631496, 0, 0.8431373, 1, 1,
0.06104076, 0.9999438, 0.03775611, 0, 0.8392157, 1, 1,
0.06694086, -0.3877574, 2.870325, 0, 0.8313726, 1, 1,
0.07236499, 0.5915889, -1.852493, 0, 0.827451, 1, 1,
0.07268324, 1.394445, 0.1582594, 0, 0.8196079, 1, 1,
0.0750712, 0.8609867, 0.2276943, 0, 0.8156863, 1, 1,
0.07688816, 0.141278, 1.053811, 0, 0.8078431, 1, 1,
0.07943414, -0.02646046, 0.6138625, 0, 0.8039216, 1, 1,
0.08376917, 1.103626, -0.6510453, 0, 0.7960784, 1, 1,
0.09062675, -1.167017, 2.335582, 0, 0.7882353, 1, 1,
0.09340104, -0.9471383, 2.939732, 0, 0.7843137, 1, 1,
0.09654129, 1.30198, 0.756087, 0, 0.7764706, 1, 1,
0.1036499, 0.6257143, -1.330941, 0, 0.772549, 1, 1,
0.1046304, 0.1880502, 0.6569915, 0, 0.7647059, 1, 1,
0.1069218, 0.699415, -0.272296, 0, 0.7607843, 1, 1,
0.1075913, 0.3183491, 0.4510501, 0, 0.7529412, 1, 1,
0.1128975, -1.880588, 3.4795, 0, 0.7490196, 1, 1,
0.116966, 0.1993653, -0.6449337, 0, 0.7411765, 1, 1,
0.1223672, 0.6867113, -0.129418, 0, 0.7372549, 1, 1,
0.1356753, -0.5948716, 4.718875, 0, 0.7294118, 1, 1,
0.1362815, -1.232916, 3.124356, 0, 0.7254902, 1, 1,
0.1415214, 0.5488718, -2.562444, 0, 0.7176471, 1, 1,
0.1416563, -0.2728148, 3.622714, 0, 0.7137255, 1, 1,
0.1443861, 1.895451, 1.286093, 0, 0.7058824, 1, 1,
0.1449041, 0.8759443, 0.3258327, 0, 0.6980392, 1, 1,
0.1464728, -0.1112741, 2.908491, 0, 0.6941177, 1, 1,
0.1469733, 0.6921321, -0.9218822, 0, 0.6862745, 1, 1,
0.1510852, -1.482716, 2.1686, 0, 0.682353, 1, 1,
0.15337, 1.196618, -0.4088458, 0, 0.6745098, 1, 1,
0.1538817, -0.3428106, 2.249951, 0, 0.6705883, 1, 1,
0.1557298, -1.500137, 2.173738, 0, 0.6627451, 1, 1,
0.1614568, 3.206629, -0.6229697, 0, 0.6588235, 1, 1,
0.1653611, 0.9048011, 0.9725727, 0, 0.6509804, 1, 1,
0.1723623, -0.4166417, 4.260595, 0, 0.6470588, 1, 1,
0.1755062, -0.2980786, 2.461759, 0, 0.6392157, 1, 1,
0.176866, 0.8671675, -0.1861329, 0, 0.6352941, 1, 1,
0.1789353, 1.644019, -0.5008518, 0, 0.627451, 1, 1,
0.1802938, 0.8061547, -0.01135565, 0, 0.6235294, 1, 1,
0.1858026, 0.8886883, -1.265247, 0, 0.6156863, 1, 1,
0.1927859, -0.7653152, 1.129485, 0, 0.6117647, 1, 1,
0.1959591, -0.1628051, 3.15519, 0, 0.6039216, 1, 1,
0.1962151, 1.393321, -0.6860296, 0, 0.5960785, 1, 1,
0.2045962, -0.8854524, 2.19695, 0, 0.5921569, 1, 1,
0.2115945, -2.415684, 2.885469, 0, 0.5843138, 1, 1,
0.219377, 0.8467568, 1.296242, 0, 0.5803922, 1, 1,
0.2292545, -1.147625, 2.740656, 0, 0.572549, 1, 1,
0.2298927, -0.586441, 2.686372, 0, 0.5686275, 1, 1,
0.2303961, -1.194892, 0.9288123, 0, 0.5607843, 1, 1,
0.2306387, 2.259888, -2.052391, 0, 0.5568628, 1, 1,
0.2360896, 0.5619968, 0.04360367, 0, 0.5490196, 1, 1,
0.2406603, 0.3371603, 0.3330302, 0, 0.5450981, 1, 1,
0.2407028, 0.8979861, -0.3479579, 0, 0.5372549, 1, 1,
0.2434267, 1.017032, -1.524628, 0, 0.5333334, 1, 1,
0.2435078, 0.797314, 0.4677763, 0, 0.5254902, 1, 1,
0.2439695, -0.6498407, 3.254741, 0, 0.5215687, 1, 1,
0.2548583, 0.001348933, 1.413156, 0, 0.5137255, 1, 1,
0.2629015, -1.686906, 2.301791, 0, 0.509804, 1, 1,
0.2671578, -1.347014, 2.9482, 0, 0.5019608, 1, 1,
0.2674577, 1.174643, -0.720024, 0, 0.4941176, 1, 1,
0.2677449, -0.4388439, 3.499289, 0, 0.4901961, 1, 1,
0.2693343, 0.351565, 0.5329832, 0, 0.4823529, 1, 1,
0.2704393, 1.559682, 0.2341057, 0, 0.4784314, 1, 1,
0.2704432, 0.4211397, 1.135742, 0, 0.4705882, 1, 1,
0.2712294, 0.6349365, 0.3235887, 0, 0.4666667, 1, 1,
0.2712785, 1.908643, 1.854157, 0, 0.4588235, 1, 1,
0.2718585, 0.7487271, 0.4831268, 0, 0.454902, 1, 1,
0.2745415, -0.5178057, 1.465037, 0, 0.4470588, 1, 1,
0.2757761, -1.433831, 2.679302, 0, 0.4431373, 1, 1,
0.2762726, 0.6404755, 0.03767669, 0, 0.4352941, 1, 1,
0.2769823, -0.4063866, 4.022063, 0, 0.4313726, 1, 1,
0.2825182, -1.829481, 1.781318, 0, 0.4235294, 1, 1,
0.2846774, 0.6604016, 0.7562917, 0, 0.4196078, 1, 1,
0.2858186, -0.4228349, 3.519399, 0, 0.4117647, 1, 1,
0.2859561, -0.9229116, 1.723519, 0, 0.4078431, 1, 1,
0.2902849, -0.8758392, 1.755814, 0, 0.4, 1, 1,
0.2936988, -0.8769224, 2.835785, 0, 0.3921569, 1, 1,
0.2938719, 0.5789801, 0.7815619, 0, 0.3882353, 1, 1,
0.2944147, -1.45755, 2.641307, 0, 0.3803922, 1, 1,
0.296018, -1.351172, 3.916283, 0, 0.3764706, 1, 1,
0.3039842, 0.01638277, 1.16206, 0, 0.3686275, 1, 1,
0.3056748, -1.87151, 2.162063, 0, 0.3647059, 1, 1,
0.306866, -1.077221, 0.3606556, 0, 0.3568628, 1, 1,
0.3072056, -0.4139135, 2.964988, 0, 0.3529412, 1, 1,
0.3121486, -0.7120233, 3.803587, 0, 0.345098, 1, 1,
0.3144413, -0.6489017, 1.869727, 0, 0.3411765, 1, 1,
0.3250424, -1.088644, 3.059048, 0, 0.3333333, 1, 1,
0.3256995, 0.1548093, 1.172342, 0, 0.3294118, 1, 1,
0.3257141, -1.174519, 2.118683, 0, 0.3215686, 1, 1,
0.3258747, 0.1541852, 1.778223, 0, 0.3176471, 1, 1,
0.3270384, -1.166308, 4.69082, 0, 0.3098039, 1, 1,
0.3279389, -0.3672289, 1.874043, 0, 0.3058824, 1, 1,
0.3316788, 1.959534, 0.3401914, 0, 0.2980392, 1, 1,
0.3365563, -0.8032888, 4.298952, 0, 0.2901961, 1, 1,
0.3384408, -0.9555902, 2.191858, 0, 0.2862745, 1, 1,
0.340142, -0.9555917, 3.060097, 0, 0.2784314, 1, 1,
0.3402877, 0.201857, 1.236213, 0, 0.2745098, 1, 1,
0.3412, -0.2663957, 2.764689, 0, 0.2666667, 1, 1,
0.342993, 0.7150396, -0.07229965, 0, 0.2627451, 1, 1,
0.3440152, 0.2596143, 1.565621, 0, 0.254902, 1, 1,
0.3448662, -0.5550808, 3.669275, 0, 0.2509804, 1, 1,
0.3508471, -0.05801662, 1.936094, 0, 0.2431373, 1, 1,
0.3529762, -0.1106895, 2.046683, 0, 0.2392157, 1, 1,
0.3539246, -0.8539383, 3.037214, 0, 0.2313726, 1, 1,
0.3720294, -0.5388576, 3.768444, 0, 0.227451, 1, 1,
0.3722377, -1.209033, 2.212052, 0, 0.2196078, 1, 1,
0.3738369, -0.8502376, 2.762466, 0, 0.2156863, 1, 1,
0.376647, -0.8345218, 3.3108, 0, 0.2078431, 1, 1,
0.3850565, 1.362504, 1.496561, 0, 0.2039216, 1, 1,
0.3863454, 0.862958, -0.1259182, 0, 0.1960784, 1, 1,
0.3885215, 0.9742883, 0.5216554, 0, 0.1882353, 1, 1,
0.3892198, 1.658205, -0.942189, 0, 0.1843137, 1, 1,
0.3918936, -0.2147308, 3.090721, 0, 0.1764706, 1, 1,
0.3931075, -1.045384, 3.52184, 0, 0.172549, 1, 1,
0.3950218, 0.2349552, -0.4512098, 0, 0.1647059, 1, 1,
0.3987297, 0.1559947, 2.45265, 0, 0.1607843, 1, 1,
0.3994397, 0.4372612, 0.254395, 0, 0.1529412, 1, 1,
0.4007883, 1.548091, 0.06176421, 0, 0.1490196, 1, 1,
0.4015217, 1.078737, 0.7987267, 0, 0.1411765, 1, 1,
0.4022604, 1.118498, 0.3672845, 0, 0.1372549, 1, 1,
0.4041092, -0.006775144, 1.329463, 0, 0.1294118, 1, 1,
0.4062132, 1.013118, 0.9932572, 0, 0.1254902, 1, 1,
0.4066547, -0.3723781, 3.727807, 0, 0.1176471, 1, 1,
0.4189099, -0.2168366, 0.7162482, 0, 0.1137255, 1, 1,
0.4253162, 0.5402083, 0.1048139, 0, 0.1058824, 1, 1,
0.4269263, 0.4477481, -0.4190581, 0, 0.09803922, 1, 1,
0.4274039, -1.108726, 3.478662, 0, 0.09411765, 1, 1,
0.4285735, 0.2878564, 0.6716467, 0, 0.08627451, 1, 1,
0.4288737, 0.2825596, 0.873755, 0, 0.08235294, 1, 1,
0.4293616, -0.8450972, 2.516542, 0, 0.07450981, 1, 1,
0.4316798, 0.6858727, 0.5936104, 0, 0.07058824, 1, 1,
0.4371846, 1.627903, -0.1248059, 0, 0.0627451, 1, 1,
0.4417784, 1.199538, -0.003390501, 0, 0.05882353, 1, 1,
0.4463037, 1.002735, 1.075882, 0, 0.05098039, 1, 1,
0.4513026, -2.425313, 3.074464, 0, 0.04705882, 1, 1,
0.4517486, 2.051536, 0.2744791, 0, 0.03921569, 1, 1,
0.4605698, -1.096541, 1.766663, 0, 0.03529412, 1, 1,
0.4628956, 1.167166, 0.2944234, 0, 0.02745098, 1, 1,
0.4645295, 0.3417266, 0.3116059, 0, 0.02352941, 1, 1,
0.4671434, -1.018345, 2.551564, 0, 0.01568628, 1, 1,
0.4679342, 1.160272, -1.279569, 0, 0.01176471, 1, 1,
0.468376, 0.7576792, 2.107999, 0, 0.003921569, 1, 1,
0.4697512, 0.08015196, 2.668851, 0.003921569, 0, 1, 1,
0.4739438, -1.025248, 2.307104, 0.007843138, 0, 1, 1,
0.4772886, 0.4399081, -0.7033835, 0.01568628, 0, 1, 1,
0.4781138, -0.3636387, 2.197181, 0.01960784, 0, 1, 1,
0.4797339, 0.6599072, 1.463485, 0.02745098, 0, 1, 1,
0.4885117, -0.3294025, 2.146661, 0.03137255, 0, 1, 1,
0.4917196, -0.3096876, 2.704496, 0.03921569, 0, 1, 1,
0.4936942, -1.770305, 1.031206, 0.04313726, 0, 1, 1,
0.4978207, 0.1479051, -0.173282, 0.05098039, 0, 1, 1,
0.5035545, 0.2747193, 0.9001327, 0.05490196, 0, 1, 1,
0.5065385, -0.257516, 2.934337, 0.0627451, 0, 1, 1,
0.5106506, 1.230674, 1.74981, 0.06666667, 0, 1, 1,
0.5130541, -2.093794, 1.836269, 0.07450981, 0, 1, 1,
0.513958, -0.2187587, 1.783826, 0.07843138, 0, 1, 1,
0.5170086, 0.1140033, 1.093827, 0.08627451, 0, 1, 1,
0.5176601, 1.348285, 0.5988788, 0.09019608, 0, 1, 1,
0.5197486, 0.3451476, 0.7254731, 0.09803922, 0, 1, 1,
0.5213119, 0.4936782, 0.9878576, 0.1058824, 0, 1, 1,
0.5237014, 0.09209812, 2.363348, 0.1098039, 0, 1, 1,
0.5282134, -0.2986014, 1.260117, 0.1176471, 0, 1, 1,
0.5296316, -0.5067881, 1.758988, 0.1215686, 0, 1, 1,
0.5315336, -1.111016, 2.498591, 0.1294118, 0, 1, 1,
0.533967, 1.373785, 0.5672736, 0.1333333, 0, 1, 1,
0.5351129, -0.8728976, 3.26614, 0.1411765, 0, 1, 1,
0.5371498, 0.6644656, 2.45023, 0.145098, 0, 1, 1,
0.5396786, 0.8060056, 1.08064, 0.1529412, 0, 1, 1,
0.5404414, 0.837288, 0.4423391, 0.1568628, 0, 1, 1,
0.5407954, 0.9489405, 0.07670638, 0.1647059, 0, 1, 1,
0.5446157, -0.2802137, 2.953823, 0.1686275, 0, 1, 1,
0.5480046, -0.2621205, 2.937276, 0.1764706, 0, 1, 1,
0.5568732, 0.3644928, -1.358989, 0.1803922, 0, 1, 1,
0.5602558, -1.006648, 3.50087, 0.1882353, 0, 1, 1,
0.5616515, 0.2653124, -0.5337033, 0.1921569, 0, 1, 1,
0.5636809, -1.458605, 1.942998, 0.2, 0, 1, 1,
0.5706019, -0.2355008, 3.103277, 0.2078431, 0, 1, 1,
0.5736969, -0.2224327, 0.1251218, 0.2117647, 0, 1, 1,
0.5805299, 1.579827, 2.173182, 0.2196078, 0, 1, 1,
0.5876281, 0.6146999, 1.680794, 0.2235294, 0, 1, 1,
0.5954115, 0.223597, 1.324608, 0.2313726, 0, 1, 1,
0.5976607, -0.1620701, -0.037368, 0.2352941, 0, 1, 1,
0.5977402, -0.4321724, 2.218827, 0.2431373, 0, 1, 1,
0.6030041, 0.4265267, 0.8546755, 0.2470588, 0, 1, 1,
0.6102104, 2.017582, 0.8068658, 0.254902, 0, 1, 1,
0.6112649, -0.7930012, 1.783879, 0.2588235, 0, 1, 1,
0.6192979, 0.06114981, 1.872507, 0.2666667, 0, 1, 1,
0.6213109, -0.2848455, 1.227468, 0.2705882, 0, 1, 1,
0.6217877, -0.8857356, 1.79048, 0.2784314, 0, 1, 1,
0.6278806, -0.9586756, 3.498765, 0.282353, 0, 1, 1,
0.6295811, 1.918548, 0.778783, 0.2901961, 0, 1, 1,
0.6304614, 0.6789123, 0.5369247, 0.2941177, 0, 1, 1,
0.6326792, -0.9995314, 3.243788, 0.3019608, 0, 1, 1,
0.6376248, 0.9871437, 0.1640499, 0.3098039, 0, 1, 1,
0.6435112, 0.3424384, 0.967769, 0.3137255, 0, 1, 1,
0.6463996, 1.082907, -0.6302303, 0.3215686, 0, 1, 1,
0.6481829, -0.16932, 3.512764, 0.3254902, 0, 1, 1,
0.6492573, 0.4308843, 0.9990707, 0.3333333, 0, 1, 1,
0.650781, -0.5372653, 1.90461, 0.3372549, 0, 1, 1,
0.6568381, 0.1044054, 0.4551249, 0.345098, 0, 1, 1,
0.6579226, 1.061984, 1.41903, 0.3490196, 0, 1, 1,
0.6596354, 1.492707, -0.6652188, 0.3568628, 0, 1, 1,
0.6671818, -1.629749, 2.942051, 0.3607843, 0, 1, 1,
0.6706232, -1.023506, 3.709091, 0.3686275, 0, 1, 1,
0.6728095, -2.34335, 3.042615, 0.372549, 0, 1, 1,
0.6729719, 0.1538589, 1.390228, 0.3803922, 0, 1, 1,
0.6731594, 1.179742, -0.6793399, 0.3843137, 0, 1, 1,
0.6732434, 1.028691, 1.580551, 0.3921569, 0, 1, 1,
0.6738415, -2.639494, 2.58832, 0.3960784, 0, 1, 1,
0.6777985, 0.945877, -0.9030631, 0.4039216, 0, 1, 1,
0.6799512, 2.000513, -0.8696824, 0.4117647, 0, 1, 1,
0.6836601, -0.7634093, 2.45382, 0.4156863, 0, 1, 1,
0.6849372, -0.3247578, 2.793206, 0.4235294, 0, 1, 1,
0.6876219, 0.4941578, 0.5792387, 0.427451, 0, 1, 1,
0.6876484, -1.457644, 1.687699, 0.4352941, 0, 1, 1,
0.6896346, 0.3153074, 0.8616443, 0.4392157, 0, 1, 1,
0.6910608, -0.04730502, -0.3485493, 0.4470588, 0, 1, 1,
0.6930994, -0.02838146, 0.8745563, 0.4509804, 0, 1, 1,
0.6966969, 0.3501668, 0.7252551, 0.4588235, 0, 1, 1,
0.7036066, 0.883777, -0.6640583, 0.4627451, 0, 1, 1,
0.7051539, 0.5644992, 1.934922, 0.4705882, 0, 1, 1,
0.7054122, -1.015351, 2.625814, 0.4745098, 0, 1, 1,
0.7054412, -0.2640781, 0.739925, 0.4823529, 0, 1, 1,
0.7055262, -1.303138, 1.669034, 0.4862745, 0, 1, 1,
0.706894, 0.218323, 0.2801056, 0.4941176, 0, 1, 1,
0.7082336, 0.2398132, 2.640785, 0.5019608, 0, 1, 1,
0.7119338, 1.267706, -0.02876222, 0.5058824, 0, 1, 1,
0.7158444, -1.423601, 3.29108, 0.5137255, 0, 1, 1,
0.7195243, -0.3620931, 2.569167, 0.5176471, 0, 1, 1,
0.7209181, 0.1171648, 0.8592814, 0.5254902, 0, 1, 1,
0.7211314, 1.83898, 0.09435464, 0.5294118, 0, 1, 1,
0.7332303, 1.739171, -0.07816359, 0.5372549, 0, 1, 1,
0.7395629, 0.6780407, 1.797919, 0.5411765, 0, 1, 1,
0.7440417, 0.9944949, 0.8536933, 0.5490196, 0, 1, 1,
0.7449363, 0.01860047, -0.4716595, 0.5529412, 0, 1, 1,
0.745195, 0.07246116, 0.650223, 0.5607843, 0, 1, 1,
0.7453261, 0.3064143, 0.5430953, 0.5647059, 0, 1, 1,
0.7457117, 0.4076501, -0.9176888, 0.572549, 0, 1, 1,
0.7524087, -0.1736327, 0.351652, 0.5764706, 0, 1, 1,
0.7527685, 0.4963542, 2.222493, 0.5843138, 0, 1, 1,
0.7568571, 0.8657545, -0.09718853, 0.5882353, 0, 1, 1,
0.7826014, -0.4409803, 1.474811, 0.5960785, 0, 1, 1,
0.7852451, 0.484711, 1.831201, 0.6039216, 0, 1, 1,
0.7900146, -0.7426736, 1.32386, 0.6078432, 0, 1, 1,
0.7901317, 0.2629943, 1.272334, 0.6156863, 0, 1, 1,
0.796677, 0.3656439, 1.632644, 0.6196079, 0, 1, 1,
0.7999068, 0.6168033, 1.485367, 0.627451, 0, 1, 1,
0.8005729, -1.543802, 3.801454, 0.6313726, 0, 1, 1,
0.8164312, 0.319443, 1.869963, 0.6392157, 0, 1, 1,
0.825039, -1.254874, 2.607898, 0.6431373, 0, 1, 1,
0.8258867, -0.6328239, 2.171421, 0.6509804, 0, 1, 1,
0.8277712, 0.0611041, 1.06841, 0.654902, 0, 1, 1,
0.8302915, -2.534701, 3.407676, 0.6627451, 0, 1, 1,
0.831681, 1.591845, 0.8839059, 0.6666667, 0, 1, 1,
0.8342336, -1.239241, 3.26079, 0.6745098, 0, 1, 1,
0.8353756, 0.8975599, -0.1243646, 0.6784314, 0, 1, 1,
0.8357357, 1.183732, 1.425223, 0.6862745, 0, 1, 1,
0.8361567, -0.862089, 3.6224, 0.6901961, 0, 1, 1,
0.8462176, 0.6089175, 1.647132, 0.6980392, 0, 1, 1,
0.8469626, 0.8263636, 1.067624, 0.7058824, 0, 1, 1,
0.8480603, -0.06808893, 1.652958, 0.7098039, 0, 1, 1,
0.8522851, -0.2255273, 1.847106, 0.7176471, 0, 1, 1,
0.8550191, 0.04771497, -0.1084124, 0.7215686, 0, 1, 1,
0.85773, -0.2235001, 1.799299, 0.7294118, 0, 1, 1,
0.8609746, 1.400955, 0.1273296, 0.7333333, 0, 1, 1,
0.862583, 1.461222, -1.315449, 0.7411765, 0, 1, 1,
0.8639485, 0.6301529, 0.6400136, 0.7450981, 0, 1, 1,
0.8707551, 0.05550633, 1.76058, 0.7529412, 0, 1, 1,
0.8850293, 0.6028509, 1.054338, 0.7568628, 0, 1, 1,
0.888013, 0.5100709, 1.173295, 0.7647059, 0, 1, 1,
0.8885682, -1.370735, 2.788169, 0.7686275, 0, 1, 1,
0.8915089, 0.3455369, 2.707966, 0.7764706, 0, 1, 1,
0.892271, 1.073319, -0.2096068, 0.7803922, 0, 1, 1,
0.9091834, 0.3693919, 2.286026, 0.7882353, 0, 1, 1,
0.9114994, 0.05262545, 2.545397, 0.7921569, 0, 1, 1,
0.912767, -0.4555019, 0.4979144, 0.8, 0, 1, 1,
0.9131062, -0.4709065, 1.931065, 0.8078431, 0, 1, 1,
0.9141808, 0.1064818, 0.6218865, 0.8117647, 0, 1, 1,
0.919201, -0.3763949, 1.847384, 0.8196079, 0, 1, 1,
0.9197339, 1.064209, 0.1940186, 0.8235294, 0, 1, 1,
0.9201967, 1.305797, 0.06172078, 0.8313726, 0, 1, 1,
0.9239867, 0.6950176, 1.338807, 0.8352941, 0, 1, 1,
0.9258132, 0.7175115, 0.4663023, 0.8431373, 0, 1, 1,
0.9312846, 1.130748, 1.002923, 0.8470588, 0, 1, 1,
0.9330886, -0.5794189, 2.061137, 0.854902, 0, 1, 1,
0.9386339, 0.9760196, 0.07932207, 0.8588235, 0, 1, 1,
0.9397007, 0.8969977, 0.5699317, 0.8666667, 0, 1, 1,
0.9520285, 0.1130028, 0.4258618, 0.8705882, 0, 1, 1,
0.9594749, -0.3134185, 1.254373, 0.8784314, 0, 1, 1,
0.9595832, 1.645322, -0.006725261, 0.8823529, 0, 1, 1,
0.9624289, -0.1944754, 1.440821, 0.8901961, 0, 1, 1,
0.9634948, 0.5012874, 1.107358, 0.8941177, 0, 1, 1,
0.9684809, -1.802794, 3.379116, 0.9019608, 0, 1, 1,
0.9694061, -0.3382331, 1.957477, 0.9098039, 0, 1, 1,
0.9781508, -0.01946172, 1.265383, 0.9137255, 0, 1, 1,
0.9791923, 0.739679, 1.83268, 0.9215686, 0, 1, 1,
0.9820457, -0.798836, 0.6985136, 0.9254902, 0, 1, 1,
0.9831634, 2.131147, 0.754495, 0.9333333, 0, 1, 1,
0.9909276, -0.6893667, 1.277016, 0.9372549, 0, 1, 1,
0.9939406, -1.557416, 2.301926, 0.945098, 0, 1, 1,
0.9955417, -2.24131, 3.931453, 0.9490196, 0, 1, 1,
1.007399, 0.2681095, 1.37506, 0.9568627, 0, 1, 1,
1.010795, 0.3828223, 2.061886, 0.9607843, 0, 1, 1,
1.011143, -0.1099622, 2.552895, 0.9686275, 0, 1, 1,
1.024826, 0.1254362, 1.708037, 0.972549, 0, 1, 1,
1.026337, -0.1713582, 0.7954005, 0.9803922, 0, 1, 1,
1.026448, 0.3308934, 0.1932378, 0.9843137, 0, 1, 1,
1.027754, -2.053203, 1.076782, 0.9921569, 0, 1, 1,
1.039222, 0.0692661, 1.847269, 0.9960784, 0, 1, 1,
1.052958, -0.4577763, 4.041638, 1, 0, 0.9960784, 1,
1.05317, -1.922787, 2.529549, 1, 0, 0.9882353, 1,
1.055841, 0.8676081, 2.368291, 1, 0, 0.9843137, 1,
1.058006, 0.3599443, 1.418959, 1, 0, 0.9764706, 1,
1.059254, -0.6899238, 1.262278, 1, 0, 0.972549, 1,
1.0659, -0.005615519, 2.302031, 1, 0, 0.9647059, 1,
1.067287, -0.09272819, 2.183866, 1, 0, 0.9607843, 1,
1.070668, 0.6670318, 0.5464745, 1, 0, 0.9529412, 1,
1.072472, 0.08366415, 2.191214, 1, 0, 0.9490196, 1,
1.073619, -0.8096008, 2.774701, 1, 0, 0.9411765, 1,
1.074207, 0.1757427, 1.867671, 1, 0, 0.9372549, 1,
1.074929, -0.4912481, 3.040457, 1, 0, 0.9294118, 1,
1.085058, -0.3394697, 3.361018, 1, 0, 0.9254902, 1,
1.093068, -0.2953441, 3.377338, 1, 0, 0.9176471, 1,
1.096779, 1.148688, -0.2591207, 1, 0, 0.9137255, 1,
1.100179, 1.041192, 2.256078, 1, 0, 0.9058824, 1,
1.104497, -0.5692748, 0.7343155, 1, 0, 0.9019608, 1,
1.111038, -0.01082676, 1.562876, 1, 0, 0.8941177, 1,
1.112172, -0.9669687, 1.504906, 1, 0, 0.8862745, 1,
1.120359, 0.3363874, 1.418834, 1, 0, 0.8823529, 1,
1.121275, 0.9110649, 2.006794, 1, 0, 0.8745098, 1,
1.122272, 1.132912, 0.07450939, 1, 0, 0.8705882, 1,
1.126324, 0.9337084, 0.1758763, 1, 0, 0.8627451, 1,
1.131077, -0.1565998, 3.172838, 1, 0, 0.8588235, 1,
1.137451, 0.2196886, 2.086345, 1, 0, 0.8509804, 1,
1.149031, -0.1466567, -0.3431389, 1, 0, 0.8470588, 1,
1.150229, 0.229068, 0.7891595, 1, 0, 0.8392157, 1,
1.15042, 1.626523, -0.3880921, 1, 0, 0.8352941, 1,
1.15073, -1.483301, 1.124676, 1, 0, 0.827451, 1,
1.151215, -1.334262, 0.3276409, 1, 0, 0.8235294, 1,
1.153144, 0.7381712, 0.3096198, 1, 0, 0.8156863, 1,
1.154677, 0.6333264, -1.153348, 1, 0, 0.8117647, 1,
1.155713, -1.598163, 1.487926, 1, 0, 0.8039216, 1,
1.157426, 0.4409192, 1.667774, 1, 0, 0.7960784, 1,
1.160889, 1.099408, -1.489624, 1, 0, 0.7921569, 1,
1.173339, 0.6783041, 0.3320339, 1, 0, 0.7843137, 1,
1.175514, -0.2513802, 1.967202, 1, 0, 0.7803922, 1,
1.178524, -0.499987, 1.608632, 1, 0, 0.772549, 1,
1.190911, 0.7366413, 1.304223, 1, 0, 0.7686275, 1,
1.203908, 0.08204871, 0.9503694, 1, 0, 0.7607843, 1,
1.204457, -0.8846128, 2.227041, 1, 0, 0.7568628, 1,
1.215503, 1.220093, -0.04777356, 1, 0, 0.7490196, 1,
1.228083, -1.973086, 3.128535, 1, 0, 0.7450981, 1,
1.232696, 0.7300613, 1.898106, 1, 0, 0.7372549, 1,
1.245975, -0.9367738, 1.385017, 1, 0, 0.7333333, 1,
1.247929, -0.9178421, 3.020601, 1, 0, 0.7254902, 1,
1.266191, 1.080885, -0.8405474, 1, 0, 0.7215686, 1,
1.267193, 0.3869755, 1.595199, 1, 0, 0.7137255, 1,
1.267535, -1.75755, 2.386423, 1, 0, 0.7098039, 1,
1.268393, 1.049607, 2.89769, 1, 0, 0.7019608, 1,
1.275432, 0.1246758, 1.86131, 1, 0, 0.6941177, 1,
1.276262, -0.5538486, 3.692565, 1, 0, 0.6901961, 1,
1.27812, -1.184304, 2.151232, 1, 0, 0.682353, 1,
1.289262, 0.3227859, 0.01504732, 1, 0, 0.6784314, 1,
1.296937, -0.8443313, 4.277987, 1, 0, 0.6705883, 1,
1.299432, 1.261953, 1.062104, 1, 0, 0.6666667, 1,
1.303831, -0.5109363, 0.004203258, 1, 0, 0.6588235, 1,
1.304203, 0.8162866, 1.412139, 1, 0, 0.654902, 1,
1.309934, 1.301132, -0.2712823, 1, 0, 0.6470588, 1,
1.321673, -0.8970587, 2.167728, 1, 0, 0.6431373, 1,
1.339973, -0.381905, 1.360485, 1, 0, 0.6352941, 1,
1.352849, 0.6435857, 3.004144, 1, 0, 0.6313726, 1,
1.359977, -0.4435172, 2.855785, 1, 0, 0.6235294, 1,
1.367342, 1.793441, -0.8142864, 1, 0, 0.6196079, 1,
1.367453, -0.7352228, 1.779738, 1, 0, 0.6117647, 1,
1.369369, -0.2459488, 3.00907, 1, 0, 0.6078432, 1,
1.3769, 0.4621333, 3.163158, 1, 0, 0.6, 1,
1.378809, 0.1890137, 2.279338, 1, 0, 0.5921569, 1,
1.380866, 0.3082525, 1.155278, 1, 0, 0.5882353, 1,
1.391568, 0.2149239, 0.9153484, 1, 0, 0.5803922, 1,
1.399407, -0.7947981, 0.317739, 1, 0, 0.5764706, 1,
1.402877, -0.1702795, 2.143402, 1, 0, 0.5686275, 1,
1.418545, 2.644391, 0.337212, 1, 0, 0.5647059, 1,
1.435874, 0.3452266, 1.34099, 1, 0, 0.5568628, 1,
1.436481, -0.9354831, 1.987951, 1, 0, 0.5529412, 1,
1.45719, -0.01388946, 0.960045, 1, 0, 0.5450981, 1,
1.461774, -1.436305, 4.060599, 1, 0, 0.5411765, 1,
1.463685, -0.05204108, -0.5462323, 1, 0, 0.5333334, 1,
1.471042, -0.03603893, 2.664175, 1, 0, 0.5294118, 1,
1.478288, -1.755899, 2.495509, 1, 0, 0.5215687, 1,
1.503538, 0.7940283, 1.234701, 1, 0, 0.5176471, 1,
1.520407, -0.005532295, -0.9839621, 1, 0, 0.509804, 1,
1.525115, -1.052172, 2.270424, 1, 0, 0.5058824, 1,
1.531946, 1.241578, 0.2520868, 1, 0, 0.4980392, 1,
1.533249, -0.8105484, 3.493196, 1, 0, 0.4901961, 1,
1.534273, 0.5618466, 0.1767295, 1, 0, 0.4862745, 1,
1.539292, -0.6147588, 1.960883, 1, 0, 0.4784314, 1,
1.539832, 0.1544309, 1.654361, 1, 0, 0.4745098, 1,
1.54157, 0.2033111, 1.275219, 1, 0, 0.4666667, 1,
1.54789, -0.4560062, 1.07535, 1, 0, 0.4627451, 1,
1.548377, -1.534826, 2.627628, 1, 0, 0.454902, 1,
1.548888, -0.4032281, 0.8587973, 1, 0, 0.4509804, 1,
1.556818, 0.1530236, 2.138562, 1, 0, 0.4431373, 1,
1.556921, -0.1372632, 0.469867, 1, 0, 0.4392157, 1,
1.58111, 1.257481, -0.9074927, 1, 0, 0.4313726, 1,
1.582068, -1.343752, 4.140051, 1, 0, 0.427451, 1,
1.587175, 1.81031, 1.558301, 1, 0, 0.4196078, 1,
1.588252, 0.1348585, 2.567028, 1, 0, 0.4156863, 1,
1.592697, -1.249584, 1.146528, 1, 0, 0.4078431, 1,
1.628588, 0.7442484, 2.369596, 1, 0, 0.4039216, 1,
1.629838, 1.30169, 0.4479746, 1, 0, 0.3960784, 1,
1.643082, -0.9101425, 1.188568, 1, 0, 0.3882353, 1,
1.648473, -0.9695048, 1.907043, 1, 0, 0.3843137, 1,
1.651996, -0.6946559, 1.760128, 1, 0, 0.3764706, 1,
1.670932, -0.8828843, 1.667753, 1, 0, 0.372549, 1,
1.675815, -0.7975244, 0.4986691, 1, 0, 0.3647059, 1,
1.677323, 0.7089171, 0.3586372, 1, 0, 0.3607843, 1,
1.679372, -1.381629, 2.843502, 1, 0, 0.3529412, 1,
1.693306, -0.280867, 1.596911, 1, 0, 0.3490196, 1,
1.694027, -0.3060514, 2.068437, 1, 0, 0.3411765, 1,
1.69607, 1.479331, 1.93705, 1, 0, 0.3372549, 1,
1.706576, 0.8226918, 1.928836, 1, 0, 0.3294118, 1,
1.710685, 0.9313792, 0.4081263, 1, 0, 0.3254902, 1,
1.717397, -0.6249472, 1.465017, 1, 0, 0.3176471, 1,
1.727719, 1.507009, 1.250043, 1, 0, 0.3137255, 1,
1.729782, 0.1007894, 1.459908, 1, 0, 0.3058824, 1,
1.730037, -0.574806, 2.010012, 1, 0, 0.2980392, 1,
1.730964, -0.2831958, 0.2175366, 1, 0, 0.2941177, 1,
1.731181, 0.5773671, 1.154192, 1, 0, 0.2862745, 1,
1.749673, -1.123049, 2.296862, 1, 0, 0.282353, 1,
1.762115, 0.0878633, 1.231117, 1, 0, 0.2745098, 1,
1.767078, -1.739278, 3.937208, 1, 0, 0.2705882, 1,
1.767821, 0.083484, -0.3998703, 1, 0, 0.2627451, 1,
1.777007, 0.7322267, 2.498997, 1, 0, 0.2588235, 1,
1.779092, 1.656593, 0.5322584, 1, 0, 0.2509804, 1,
1.784478, -0.3357399, 0.9869355, 1, 0, 0.2470588, 1,
1.796667, -0.07091589, 1.095273, 1, 0, 0.2392157, 1,
1.796987, -0.1715408, 0.9035407, 1, 0, 0.2352941, 1,
1.797816, -2.115166, 1.601712, 1, 0, 0.227451, 1,
1.812783, -0.877947, 2.209276, 1, 0, 0.2235294, 1,
1.813989, 0.9576957, -1.108636, 1, 0, 0.2156863, 1,
1.820345, 0.8508936, 1.329301, 1, 0, 0.2117647, 1,
1.862387, -0.9468535, 2.080879, 1, 0, 0.2039216, 1,
1.87467, -1.700009, 2.90351, 1, 0, 0.1960784, 1,
1.878895, -0.138458, 1.129401, 1, 0, 0.1921569, 1,
1.883617, 0.4552328, 2.614311, 1, 0, 0.1843137, 1,
1.890947, -1.063091, 2.255016, 1, 0, 0.1803922, 1,
1.898168, -0.05224319, 1.889435, 1, 0, 0.172549, 1,
1.909196, -1.113094, 3.223031, 1, 0, 0.1686275, 1,
1.954166, -0.2566719, 2.504349, 1, 0, 0.1607843, 1,
1.956029, -0.5075818, 1.997841, 1, 0, 0.1568628, 1,
1.977698, 1.644335, 1.563123, 1, 0, 0.1490196, 1,
1.985771, -0.08354926, 1.488033, 1, 0, 0.145098, 1,
2.031566, -0.7084027, 0.2631243, 1, 0, 0.1372549, 1,
2.054608, 0.6877238, -1.225094, 1, 0, 0.1333333, 1,
2.070763, 0.2054367, 2.002289, 1, 0, 0.1254902, 1,
2.079216, 1.158877, 1.076744, 1, 0, 0.1215686, 1,
2.117874, 0.3512848, 0.9579576, 1, 0, 0.1137255, 1,
2.137038, 0.8764536, 2.254177, 1, 0, 0.1098039, 1,
2.140777, -0.6042331, 2.525267, 1, 0, 0.1019608, 1,
2.165373, -1.652026, 2.142939, 1, 0, 0.09411765, 1,
2.179243, -0.01780347, 1.236641, 1, 0, 0.09019608, 1,
2.222722, 0.2655733, 2.245368, 1, 0, 0.08235294, 1,
2.277355, -0.4532768, 3.192364, 1, 0, 0.07843138, 1,
2.337908, -0.4349798, 1.163308, 1, 0, 0.07058824, 1,
2.41523, 0.1598461, 1.544775, 1, 0, 0.06666667, 1,
2.438781, 0.0225011, 1.133162, 1, 0, 0.05882353, 1,
2.501872, 0.712245, -0.1806778, 1, 0, 0.05490196, 1,
2.534987, -1.310015, 1.998349, 1, 0, 0.04705882, 1,
2.552036, -1.350557, 2.194267, 1, 0, 0.04313726, 1,
2.558277, -0.567001, 0.01820008, 1, 0, 0.03529412, 1,
2.624661, -0.431156, 0.7194555, 1, 0, 0.03137255, 1,
2.722801, 0.9645447, 1.153387, 1, 0, 0.02352941, 1,
2.891378, 0.2176121, -0.3040448, 1, 0, 0.01960784, 1,
3.110375, -1.908728, 0.9887866, 1, 0, 0.01176471, 1,
3.37423, 0.2597405, 3.110748, 1, 0, 0.007843138, 1
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
0.007682085, -4.288839, -7.016125, 0, -0.5, 0.5, 0.5,
0.007682085, -4.288839, -7.016125, 1, -0.5, 0.5, 0.5,
0.007682085, -4.288839, -7.016125, 1, 1.5, 0.5, 0.5,
0.007682085, -4.288839, -7.016125, 0, 1.5, 0.5, 0.5
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
-4.500125, 0.002067804, -7.016125, 0, -0.5, 0.5, 0.5,
-4.500125, 0.002067804, -7.016125, 1, -0.5, 0.5, 0.5,
-4.500125, 0.002067804, -7.016125, 1, 1.5, 0.5, 0.5,
-4.500125, 0.002067804, -7.016125, 0, 1.5, 0.5, 0.5
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
-4.500125, -4.288839, -0.2982264, 0, -0.5, 0.5, 0.5,
-4.500125, -4.288839, -0.2982264, 1, -0.5, 0.5, 0.5,
-4.500125, -4.288839, -0.2982264, 1, 1.5, 0.5, 0.5,
-4.500125, -4.288839, -0.2982264, 0, 1.5, 0.5, 0.5
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
-3, -3.29863, -5.465841,
3, -3.29863, -5.465841,
-3, -3.29863, -5.465841,
-3, -3.463665, -5.724221,
-2, -3.29863, -5.465841,
-2, -3.463665, -5.724221,
-1, -3.29863, -5.465841,
-1, -3.463665, -5.724221,
0, -3.29863, -5.465841,
0, -3.463665, -5.724221,
1, -3.29863, -5.465841,
1, -3.463665, -5.724221,
2, -3.29863, -5.465841,
2, -3.463665, -5.724221,
3, -3.29863, -5.465841,
3, -3.463665, -5.724221
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
-3, -3.793734, -6.240983, 0, -0.5, 0.5, 0.5,
-3, -3.793734, -6.240983, 1, -0.5, 0.5, 0.5,
-3, -3.793734, -6.240983, 1, 1.5, 0.5, 0.5,
-3, -3.793734, -6.240983, 0, 1.5, 0.5, 0.5,
-2, -3.793734, -6.240983, 0, -0.5, 0.5, 0.5,
-2, -3.793734, -6.240983, 1, -0.5, 0.5, 0.5,
-2, -3.793734, -6.240983, 1, 1.5, 0.5, 0.5,
-2, -3.793734, -6.240983, 0, 1.5, 0.5, 0.5,
-1, -3.793734, -6.240983, 0, -0.5, 0.5, 0.5,
-1, -3.793734, -6.240983, 1, -0.5, 0.5, 0.5,
-1, -3.793734, -6.240983, 1, 1.5, 0.5, 0.5,
-1, -3.793734, -6.240983, 0, 1.5, 0.5, 0.5,
0, -3.793734, -6.240983, 0, -0.5, 0.5, 0.5,
0, -3.793734, -6.240983, 1, -0.5, 0.5, 0.5,
0, -3.793734, -6.240983, 1, 1.5, 0.5, 0.5,
0, -3.793734, -6.240983, 0, 1.5, 0.5, 0.5,
1, -3.793734, -6.240983, 0, -0.5, 0.5, 0.5,
1, -3.793734, -6.240983, 1, -0.5, 0.5, 0.5,
1, -3.793734, -6.240983, 1, 1.5, 0.5, 0.5,
1, -3.793734, -6.240983, 0, 1.5, 0.5, 0.5,
2, -3.793734, -6.240983, 0, -0.5, 0.5, 0.5,
2, -3.793734, -6.240983, 1, -0.5, 0.5, 0.5,
2, -3.793734, -6.240983, 1, 1.5, 0.5, 0.5,
2, -3.793734, -6.240983, 0, 1.5, 0.5, 0.5,
3, -3.793734, -6.240983, 0, -0.5, 0.5, 0.5,
3, -3.793734, -6.240983, 1, -0.5, 0.5, 0.5,
3, -3.793734, -6.240983, 1, 1.5, 0.5, 0.5,
3, -3.793734, -6.240983, 0, 1.5, 0.5, 0.5
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
-3.459862, -3, -5.465841,
-3.459862, 3, -5.465841,
-3.459862, -3, -5.465841,
-3.633239, -3, -5.724221,
-3.459862, -2, -5.465841,
-3.633239, -2, -5.724221,
-3.459862, -1, -5.465841,
-3.633239, -1, -5.724221,
-3.459862, 0, -5.465841,
-3.633239, 0, -5.724221,
-3.459862, 1, -5.465841,
-3.633239, 1, -5.724221,
-3.459862, 2, -5.465841,
-3.633239, 2, -5.724221,
-3.459862, 3, -5.465841,
-3.633239, 3, -5.724221
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
-3.979994, -3, -6.240983, 0, -0.5, 0.5, 0.5,
-3.979994, -3, -6.240983, 1, -0.5, 0.5, 0.5,
-3.979994, -3, -6.240983, 1, 1.5, 0.5, 0.5,
-3.979994, -3, -6.240983, 0, 1.5, 0.5, 0.5,
-3.979994, -2, -6.240983, 0, -0.5, 0.5, 0.5,
-3.979994, -2, -6.240983, 1, -0.5, 0.5, 0.5,
-3.979994, -2, -6.240983, 1, 1.5, 0.5, 0.5,
-3.979994, -2, -6.240983, 0, 1.5, 0.5, 0.5,
-3.979994, -1, -6.240983, 0, -0.5, 0.5, 0.5,
-3.979994, -1, -6.240983, 1, -0.5, 0.5, 0.5,
-3.979994, -1, -6.240983, 1, 1.5, 0.5, 0.5,
-3.979994, -1, -6.240983, 0, 1.5, 0.5, 0.5,
-3.979994, 0, -6.240983, 0, -0.5, 0.5, 0.5,
-3.979994, 0, -6.240983, 1, -0.5, 0.5, 0.5,
-3.979994, 0, -6.240983, 1, 1.5, 0.5, 0.5,
-3.979994, 0, -6.240983, 0, 1.5, 0.5, 0.5,
-3.979994, 1, -6.240983, 0, -0.5, 0.5, 0.5,
-3.979994, 1, -6.240983, 1, -0.5, 0.5, 0.5,
-3.979994, 1, -6.240983, 1, 1.5, 0.5, 0.5,
-3.979994, 1, -6.240983, 0, 1.5, 0.5, 0.5,
-3.979994, 2, -6.240983, 0, -0.5, 0.5, 0.5,
-3.979994, 2, -6.240983, 1, -0.5, 0.5, 0.5,
-3.979994, 2, -6.240983, 1, 1.5, 0.5, 0.5,
-3.979994, 2, -6.240983, 0, 1.5, 0.5, 0.5,
-3.979994, 3, -6.240983, 0, -0.5, 0.5, 0.5,
-3.979994, 3, -6.240983, 1, -0.5, 0.5, 0.5,
-3.979994, 3, -6.240983, 1, 1.5, 0.5, 0.5,
-3.979994, 3, -6.240983, 0, 1.5, 0.5, 0.5
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
-3.459862, -3.29863, -4,
-3.459862, -3.29863, 4,
-3.459862, -3.29863, -4,
-3.633239, -3.463665, -4,
-3.459862, -3.29863, -2,
-3.633239, -3.463665, -2,
-3.459862, -3.29863, 0,
-3.633239, -3.463665, 0,
-3.459862, -3.29863, 2,
-3.633239, -3.463665, 2,
-3.459862, -3.29863, 4,
-3.633239, -3.463665, 4
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
-3.979994, -3.793734, -4, 0, -0.5, 0.5, 0.5,
-3.979994, -3.793734, -4, 1, -0.5, 0.5, 0.5,
-3.979994, -3.793734, -4, 1, 1.5, 0.5, 0.5,
-3.979994, -3.793734, -4, 0, 1.5, 0.5, 0.5,
-3.979994, -3.793734, -2, 0, -0.5, 0.5, 0.5,
-3.979994, -3.793734, -2, 1, -0.5, 0.5, 0.5,
-3.979994, -3.793734, -2, 1, 1.5, 0.5, 0.5,
-3.979994, -3.793734, -2, 0, 1.5, 0.5, 0.5,
-3.979994, -3.793734, 0, 0, -0.5, 0.5, 0.5,
-3.979994, -3.793734, 0, 1, -0.5, 0.5, 0.5,
-3.979994, -3.793734, 0, 1, 1.5, 0.5, 0.5,
-3.979994, -3.793734, 0, 0, 1.5, 0.5, 0.5,
-3.979994, -3.793734, 2, 0, -0.5, 0.5, 0.5,
-3.979994, -3.793734, 2, 1, -0.5, 0.5, 0.5,
-3.979994, -3.793734, 2, 1, 1.5, 0.5, 0.5,
-3.979994, -3.793734, 2, 0, 1.5, 0.5, 0.5,
-3.979994, -3.793734, 4, 0, -0.5, 0.5, 0.5,
-3.979994, -3.793734, 4, 1, -0.5, 0.5, 0.5,
-3.979994, -3.793734, 4, 1, 1.5, 0.5, 0.5,
-3.979994, -3.793734, 4, 0, 1.5, 0.5, 0.5
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
-3.459862, -3.29863, -5.465841,
-3.459862, 3.302765, -5.465841,
-3.459862, -3.29863, 4.869388,
-3.459862, 3.302765, 4.869388,
-3.459862, -3.29863, -5.465841,
-3.459862, -3.29863, 4.869388,
-3.459862, 3.302765, -5.465841,
-3.459862, 3.302765, 4.869388,
-3.459862, -3.29863, -5.465841,
3.475226, -3.29863, -5.465841,
-3.459862, -3.29863, 4.869388,
3.475226, -3.29863, 4.869388,
-3.459862, 3.302765, -5.465841,
3.475226, 3.302765, -5.465841,
-3.459862, 3.302765, 4.869388,
3.475226, 3.302765, 4.869388,
3.475226, -3.29863, -5.465841,
3.475226, 3.302765, -5.465841,
3.475226, -3.29863, 4.869388,
3.475226, 3.302765, 4.869388,
3.475226, -3.29863, -5.465841,
3.475226, -3.29863, 4.869388,
3.475226, 3.302765, -5.465841,
3.475226, 3.302765, 4.869388
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
var radius = 7.52308;
var distance = 33.47104;
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
mvMatrix.translate( -0.007682085, -0.002067804, 0.2982264 );
mvMatrix.scale( 1.172891, 1.232179, 0.7870268 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.47104);
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
DDT<-read.table("DDT.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.358865, 1.054732, -2.785922, 0, 0, 1, 1, 1,
-3.137269, 1.470503, -1.364409, 1, 0, 0, 1, 1,
-2.950682, -1.442341, -2.884207, 1, 0, 0, 1, 1,
-2.77761, -0.2136935, -3.749297, 1, 0, 0, 1, 1,
-2.735062, -1.632577, -1.963589, 1, 0, 0, 1, 1,
-2.704268, 0.7644632, -0.785269, 1, 0, 0, 1, 1,
-2.621763, -0.3634326, -1.976288, 0, 0, 0, 1, 1,
-2.510003, -1.119789, -1.058328, 0, 0, 0, 1, 1,
-2.457392, -1.775867, -0.9422703, 0, 0, 0, 1, 1,
-2.316339, 0.662477, -1.844796, 0, 0, 0, 1, 1,
-2.303189, 0.4212438, -0.9263463, 0, 0, 0, 1, 1,
-2.264274, 0.8558616, -1.112783, 0, 0, 0, 1, 1,
-2.237563, -0.5969195, -2.68117, 0, 0, 0, 1, 1,
-2.22644, 0.008239896, -0.1369001, 1, 1, 1, 1, 1,
-2.182443, -2.503215, -3.441062, 1, 1, 1, 1, 1,
-2.175892, -0.4007368, -1.835313, 1, 1, 1, 1, 1,
-2.151137, 0.4055254, -0.2210765, 1, 1, 1, 1, 1,
-2.144643, -1.237071, -3.235635, 1, 1, 1, 1, 1,
-2.138914, -1.184607, -2.735732, 1, 1, 1, 1, 1,
-2.103164, 1.091438, -0.9537968, 1, 1, 1, 1, 1,
-2.08701, 0.3132219, -2.562084, 1, 1, 1, 1, 1,
-2.04029, -0.6625547, -1.202803, 1, 1, 1, 1, 1,
-2.031322, 0.4793086, -1.83437, 1, 1, 1, 1, 1,
-1.96107, -0.8019326, -2.545594, 1, 1, 1, 1, 1,
-1.954645, 0.5104185, -1.454488, 1, 1, 1, 1, 1,
-1.921164, -0.3367321, 0.3177901, 1, 1, 1, 1, 1,
-1.889594, 1.180612, -0.8813941, 1, 1, 1, 1, 1,
-1.857983, -1.060575, -3.25529, 1, 1, 1, 1, 1,
-1.847339, 0.6177955, -2.025075, 0, 0, 1, 1, 1,
-1.800925, 1.13801, -0.6443526, 1, 0, 0, 1, 1,
-1.794445, -1.236265, -2.133289, 1, 0, 0, 1, 1,
-1.783204, 0.07614911, -2.703907, 1, 0, 0, 1, 1,
-1.76869, 0.9364203, -1.462247, 1, 0, 0, 1, 1,
-1.735754, -0.3779847, -2.469875, 1, 0, 0, 1, 1,
-1.719196, 1.448916, -1.064163, 0, 0, 0, 1, 1,
-1.679115, -0.0307738, -0.3292104, 0, 0, 0, 1, 1,
-1.673651, 0.376278, -1.998816, 0, 0, 0, 1, 1,
-1.644265, -0.1703359, -0.3752814, 0, 0, 0, 1, 1,
-1.64289, -0.3345023, -1.382442, 0, 0, 0, 1, 1,
-1.640997, -0.724736, -2.592999, 0, 0, 0, 1, 1,
-1.614381, 0.9967839, 0.0294816, 0, 0, 0, 1, 1,
-1.609649, 0.6975317, -0.6715572, 1, 1, 1, 1, 1,
-1.581881, -1.624679, -1.540117, 1, 1, 1, 1, 1,
-1.581583, -0.08485437, -1.853597, 1, 1, 1, 1, 1,
-1.575083, 0.6943554, -0.6308, 1, 1, 1, 1, 1,
-1.570544, -2.210207, -1.358787, 1, 1, 1, 1, 1,
-1.54722, 0.7253223, -2.436484, 1, 1, 1, 1, 1,
-1.536472, -0.384567, -0.7812064, 1, 1, 1, 1, 1,
-1.534044, 0.9008455, -1.46527, 1, 1, 1, 1, 1,
-1.533745, 0.9977617, -0.6493635, 1, 1, 1, 1, 1,
-1.533366, -0.817493, -1.860428, 1, 1, 1, 1, 1,
-1.532577, -0.9170939, -0.5395239, 1, 1, 1, 1, 1,
-1.51821, 1.225056, 0.3503389, 1, 1, 1, 1, 1,
-1.501494, 1.23827, 0.9001365, 1, 1, 1, 1, 1,
-1.497131, -0.2591086, -3.880052, 1, 1, 1, 1, 1,
-1.494947, 2.505135, -0.5221404, 1, 1, 1, 1, 1,
-1.494236, -1.029147, -2.250807, 0, 0, 1, 1, 1,
-1.49363, 1.462773, -0.5628743, 1, 0, 0, 1, 1,
-1.490398, 1.596597, -1.45445, 1, 0, 0, 1, 1,
-1.488862, 0.9630523, -1.777744, 1, 0, 0, 1, 1,
-1.485348, -1.260643, -1.474381, 1, 0, 0, 1, 1,
-1.484511, 0.7368219, -1.196997, 1, 0, 0, 1, 1,
-1.483277, -0.07480083, 0.6170235, 0, 0, 0, 1, 1,
-1.482785, 0.348968, 0.3690612, 0, 0, 0, 1, 1,
-1.460184, 1.241816, -2.27325, 0, 0, 0, 1, 1,
-1.452721, 0.5485152, 0.283431, 0, 0, 0, 1, 1,
-1.447217, -0.04377722, -1.30557, 0, 0, 0, 1, 1,
-1.439075, -0.009134514, -0.7809952, 0, 0, 0, 1, 1,
-1.430838, 0.9437237, -1.774585, 0, 0, 0, 1, 1,
-1.416574, 0.7974425, -0.220033, 1, 1, 1, 1, 1,
-1.401924, -1.42356, -3.036222, 1, 1, 1, 1, 1,
-1.394022, -0.3680063, -3.073732, 1, 1, 1, 1, 1,
-1.391863, -1.584222, -2.282326, 1, 1, 1, 1, 1,
-1.385153, -0.8843403, -3.31774, 1, 1, 1, 1, 1,
-1.383971, 0.1328252, -0.3574618, 1, 1, 1, 1, 1,
-1.364258, 1.11338, -1.601704, 1, 1, 1, 1, 1,
-1.355895, -0.4322858, -1.399233, 1, 1, 1, 1, 1,
-1.349664, 1.25291, 0.2450787, 1, 1, 1, 1, 1,
-1.344605, 1.367342, -4.545789, 1, 1, 1, 1, 1,
-1.341581, 0.7994378, 0.2690791, 1, 1, 1, 1, 1,
-1.327047, -1.060808, -1.333283, 1, 1, 1, 1, 1,
-1.311432, 1.350032, 0.5554226, 1, 1, 1, 1, 1,
-1.306436, 1.261187, -0.3045389, 1, 1, 1, 1, 1,
-1.29183, -0.6439478, -3.050148, 1, 1, 1, 1, 1,
-1.277351, -1.534863, -3.767578, 0, 0, 1, 1, 1,
-1.261839, 0.9742767, -1.758392, 1, 0, 0, 1, 1,
-1.260211, -1.709959, -3.042271, 1, 0, 0, 1, 1,
-1.243598, -0.2652081, -1.96447, 1, 0, 0, 1, 1,
-1.239487, 0.5770281, -1.819176, 1, 0, 0, 1, 1,
-1.22827, 1.720323, -0.2211137, 1, 0, 0, 1, 1,
-1.222022, -2.228844, -4.972336, 0, 0, 0, 1, 1,
-1.215941, 0.5412759, -0.5231685, 0, 0, 0, 1, 1,
-1.210458, -1.082715, -0.9551649, 0, 0, 0, 1, 1,
-1.205929, 1.02105, -0.4984498, 0, 0, 0, 1, 1,
-1.201074, -0.5583367, -2.629982, 0, 0, 0, 1, 1,
-1.1962, 0.05201282, -1.293639, 0, 0, 0, 1, 1,
-1.191158, 0.3672036, -0.7689168, 0, 0, 0, 1, 1,
-1.190691, 0.8519738, -0.2680864, 1, 1, 1, 1, 1,
-1.185023, 0.730789, -1.671777, 1, 1, 1, 1, 1,
-1.179412, -0.02938564, -1.509793, 1, 1, 1, 1, 1,
-1.177086, -0.6944458, -2.780845, 1, 1, 1, 1, 1,
-1.172385, -1.054624, -2.482888, 1, 1, 1, 1, 1,
-1.167759, 0.2386741, -2.789293, 1, 1, 1, 1, 1,
-1.167364, 0.02519339, -0.8991852, 1, 1, 1, 1, 1,
-1.162276, -1.213085, -4.93627, 1, 1, 1, 1, 1,
-1.162157, 0.0907419, -1.090415, 1, 1, 1, 1, 1,
-1.156552, -1.214076, -2.503585, 1, 1, 1, 1, 1,
-1.153138, 1.009534, -0.5832593, 1, 1, 1, 1, 1,
-1.13985, -0.2006159, -2.19364, 1, 1, 1, 1, 1,
-1.138808, 1.312575, 0.3357313, 1, 1, 1, 1, 1,
-1.133334, -1.541788, -3.327632, 1, 1, 1, 1, 1,
-1.132553, 1.515714, -1.769352, 1, 1, 1, 1, 1,
-1.123416, -0.8490288, -2.164176, 0, 0, 1, 1, 1,
-1.122345, -0.1217959, -0.8000511, 1, 0, 0, 1, 1,
-1.11947, 0.6237993, -1.222036, 1, 0, 0, 1, 1,
-1.119193, -1.127521, 0.1657958, 1, 0, 0, 1, 1,
-1.115147, 1.699389, -1.704792, 1, 0, 0, 1, 1,
-1.113617, -0.8224655, -2.583159, 1, 0, 0, 1, 1,
-1.104372, 0.4023139, -1.934262, 0, 0, 0, 1, 1,
-1.100927, 0.09941581, 0.5140252, 0, 0, 0, 1, 1,
-1.098386, -0.6678366, -2.011855, 0, 0, 0, 1, 1,
-1.096696, 0.9809116, -0.8899331, 0, 0, 0, 1, 1,
-1.095914, -0.5627841, -2.067893, 0, 0, 0, 1, 1,
-1.092679, -0.3221084, -2.311128, 0, 0, 0, 1, 1,
-1.089791, -1.686625, -4.617874, 0, 0, 0, 1, 1,
-1.085539, -1.69939, -1.555214, 1, 1, 1, 1, 1,
-1.084676, 1.947906, 0.6437541, 1, 1, 1, 1, 1,
-1.078626, 0.7300841, -1.209393, 1, 1, 1, 1, 1,
-1.077174, -0.620268, -0.7570146, 1, 1, 1, 1, 1,
-1.074012, 0.07009668, -1.078477, 1, 1, 1, 1, 1,
-1.068659, 0.4723197, -0.07456619, 1, 1, 1, 1, 1,
-1.065392, -1.37287, -1.354521, 1, 1, 1, 1, 1,
-1.060567, 0.976709, -0.4037271, 1, 1, 1, 1, 1,
-1.060453, 0.7608316, -1.237672, 1, 1, 1, 1, 1,
-1.059066, 0.1237055, -1.689848, 1, 1, 1, 1, 1,
-1.058518, -1.10465, -3.811187, 1, 1, 1, 1, 1,
-1.057804, 1.63949, -0.7689762, 1, 1, 1, 1, 1,
-1.054016, 0.6221376, 0.4676441, 1, 1, 1, 1, 1,
-1.053776, -0.9906485, -2.148275, 1, 1, 1, 1, 1,
-1.045973, -1.634038, -2.461874, 1, 1, 1, 1, 1,
-1.04359, -2.313434, -3.124326, 0, 0, 1, 1, 1,
-1.043258, 1.009979, -2.150717, 1, 0, 0, 1, 1,
-1.041963, 0.4614862, -1.99784, 1, 0, 0, 1, 1,
-1.041842, 1.402358, -0.01014012, 1, 0, 0, 1, 1,
-1.030519, 0.520789, -1.4693, 1, 0, 0, 1, 1,
-1.011168, -0.572223, -1.740439, 1, 0, 0, 1, 1,
-1.008391, -0.1570284, -4.567545, 0, 0, 0, 1, 1,
-1.002913, 0.3220075, -2.924675, 0, 0, 0, 1, 1,
-1.00075, 0.3234388, 0.51783, 0, 0, 0, 1, 1,
-0.9997163, -0.4651582, -0.0299088, 0, 0, 0, 1, 1,
-0.9982136, -0.1336422, -1.243472, 0, 0, 0, 1, 1,
-0.9972227, 0.3950823, -2.29278, 0, 0, 0, 1, 1,
-0.9964057, -0.8400585, -0.7561509, 0, 0, 0, 1, 1,
-0.9881754, 1.191702, -0.622635, 1, 1, 1, 1, 1,
-0.9854216, -0.1824556, -0.7694026, 1, 1, 1, 1, 1,
-0.9819284, 1.358675, -1.910307, 1, 1, 1, 1, 1,
-0.9752597, -0.8187848, -2.568789, 1, 1, 1, 1, 1,
-0.9748908, 0.4865127, -1.242413, 1, 1, 1, 1, 1,
-0.9702949, 0.691314, -0.4471897, 1, 1, 1, 1, 1,
-0.9618627, -0.5677699, -1.375069, 1, 1, 1, 1, 1,
-0.9615446, 0.2342099, -0.3064758, 1, 1, 1, 1, 1,
-0.9610565, 1.094334, -0.7974654, 1, 1, 1, 1, 1,
-0.958602, 0.2149034, -2.023657, 1, 1, 1, 1, 1,
-0.954751, -0.2614672, -2.929185, 1, 1, 1, 1, 1,
-0.9537794, 1.250204, -0.1206251, 1, 1, 1, 1, 1,
-0.9483894, 0.004750392, -3.312463, 1, 1, 1, 1, 1,
-0.9443759, -0.587211, -2.329544, 1, 1, 1, 1, 1,
-0.9427649, 0.7904298, -1.17186, 1, 1, 1, 1, 1,
-0.9392182, -0.06055748, -1.87714, 0, 0, 1, 1, 1,
-0.9343934, -0.5068791, -2.310656, 1, 0, 0, 1, 1,
-0.9236183, 2.988258, -0.1294381, 1, 0, 0, 1, 1,
-0.9228634, -1.186133, -0.4825218, 1, 0, 0, 1, 1,
-0.9209346, 0.6947263, -0.7712097, 1, 0, 0, 1, 1,
-0.92018, 1.481403, -0.2232397, 1, 0, 0, 1, 1,
-0.9155436, -1.738755, -1.442044, 0, 0, 0, 1, 1,
-0.9142405, -1.311233, -3.9969, 0, 0, 0, 1, 1,
-0.9123065, -1.885367, -2.464154, 0, 0, 0, 1, 1,
-0.9034811, -1.408931, -1.568492, 0, 0, 0, 1, 1,
-0.8955798, -0.5379623, -3.400007, 0, 0, 0, 1, 1,
-0.8941603, 0.1878602, 0.0856106, 0, 0, 0, 1, 1,
-0.8792518, -1.395115, -4.232533, 0, 0, 0, 1, 1,
-0.8792406, -0.8378987, -2.815005, 1, 1, 1, 1, 1,
-0.8785608, 0.3124515, -1.380883, 1, 1, 1, 1, 1,
-0.8753271, 0.3125483, 0.1101048, 1, 1, 1, 1, 1,
-0.8693315, -0.6953902, -1.944517, 1, 1, 1, 1, 1,
-0.8689256, 0.08910146, -2.175038, 1, 1, 1, 1, 1,
-0.8684698, -0.2640279, -2.17789, 1, 1, 1, 1, 1,
-0.8650315, 0.1020714, -2.073498, 1, 1, 1, 1, 1,
-0.8626082, -1.853348, -2.250906, 1, 1, 1, 1, 1,
-0.8611996, -0.6330823, -0.1589826, 1, 1, 1, 1, 1,
-0.8601648, -0.4878489, -2.717436, 1, 1, 1, 1, 1,
-0.8576155, -0.09436987, -0.7075031, 1, 1, 1, 1, 1,
-0.8472102, 0.0008187474, -2.198419, 1, 1, 1, 1, 1,
-0.8387956, -0.6113544, -2.449852, 1, 1, 1, 1, 1,
-0.8353266, 0.06025759, -2.397129, 1, 1, 1, 1, 1,
-0.8337132, 0.6991186, -1.933001, 1, 1, 1, 1, 1,
-0.8257574, 0.05934869, -1.602365, 0, 0, 1, 1, 1,
-0.8233899, 0.01452447, -1.587946, 1, 0, 0, 1, 1,
-0.8138524, 1.396457, -0.2759404, 1, 0, 0, 1, 1,
-0.812521, -1.896632, -1.753369, 1, 0, 0, 1, 1,
-0.8117818, 1.484913, 0.992436, 1, 0, 0, 1, 1,
-0.8102039, 1.481921, 0.463803, 1, 0, 0, 1, 1,
-0.8051847, 0.7120529, -0.1530841, 0, 0, 0, 1, 1,
-0.8030281, -0.9999323, -3.332751, 0, 0, 0, 1, 1,
-0.8009893, 0.6887614, -1.416462, 0, 0, 0, 1, 1,
-0.7960971, -0.9939584, -4.561749, 0, 0, 0, 1, 1,
-0.791668, -0.5999715, -1.69628, 0, 0, 0, 1, 1,
-0.7872114, -1.290164, -1.580271, 0, 0, 0, 1, 1,
-0.7857208, -0.2098008, -2.402426, 0, 0, 0, 1, 1,
-0.7763456, -0.6478626, -1.332164, 1, 1, 1, 1, 1,
-0.7762884, -1.46306, -3.333529, 1, 1, 1, 1, 1,
-0.7732728, 0.6186375, -0.4937982, 1, 1, 1, 1, 1,
-0.7708511, -0.795705, -2.723648, 1, 1, 1, 1, 1,
-0.7698608, -0.1348147, -1.071818, 1, 1, 1, 1, 1,
-0.7635739, -0.5228664, -2.177054, 1, 1, 1, 1, 1,
-0.7631038, -0.4403897, -3.077517, 1, 1, 1, 1, 1,
-0.7593524, -0.2879386, -3.614442, 1, 1, 1, 1, 1,
-0.7526822, -0.5601557, -2.198582, 1, 1, 1, 1, 1,
-0.7523434, -1.320349, -3.73158, 1, 1, 1, 1, 1,
-0.7516968, 1.110304, 0.7147433, 1, 1, 1, 1, 1,
-0.7510403, 0.1874112, -2.111336, 1, 1, 1, 1, 1,
-0.7491749, 0.3826239, -1.310101, 1, 1, 1, 1, 1,
-0.7479112, -2.176656, -2.347745, 1, 1, 1, 1, 1,
-0.7476999, 1.150608, -0.3456106, 1, 1, 1, 1, 1,
-0.7476553, -0.8717195, -2.03839, 0, 0, 1, 1, 1,
-0.7474558, 0.03338519, -2.520443, 1, 0, 0, 1, 1,
-0.7430533, 0.005400561, -1.188367, 1, 0, 0, 1, 1,
-0.7269362, 0.009243657, -2.066258, 1, 0, 0, 1, 1,
-0.7268808, 1.167306, -0.09366407, 1, 0, 0, 1, 1,
-0.7236757, -0.3343914, -0.4216058, 1, 0, 0, 1, 1,
-0.718971, 0.6238605, -1.211831, 0, 0, 0, 1, 1,
-0.7152846, -0.7999259, -2.783333, 0, 0, 0, 1, 1,
-0.7152733, 2.406888, -0.6672778, 0, 0, 0, 1, 1,
-0.7135333, -0.1623003, -0.8859661, 0, 0, 0, 1, 1,
-0.7121512, 0.7379709, -2.350514, 0, 0, 0, 1, 1,
-0.7114333, 0.3636284, -3.67689, 0, 0, 0, 1, 1,
-0.7101774, 0.09904519, -0.599782, 0, 0, 0, 1, 1,
-0.7094817, 2.494328, 0.6266013, 1, 1, 1, 1, 1,
-0.6978151, -0.803549, -1.9028, 1, 1, 1, 1, 1,
-0.6955975, 1.085563, -0.8743873, 1, 1, 1, 1, 1,
-0.68678, -0.3720807, -3.858043, 1, 1, 1, 1, 1,
-0.6840877, -0.1821059, -1.487137, 1, 1, 1, 1, 1,
-0.6835783, 1.965603, -1.511759, 1, 1, 1, 1, 1,
-0.6800925, 1.105841, -0.1966465, 1, 1, 1, 1, 1,
-0.6785836, -0.4106586, -2.553886, 1, 1, 1, 1, 1,
-0.6785022, 1.500455, -0.5551548, 1, 1, 1, 1, 1,
-0.6746113, 0.316223, -1.704663, 1, 1, 1, 1, 1,
-0.6685898, 0.6208604, 0.06740644, 1, 1, 1, 1, 1,
-0.663177, -0.7165591, -0.7954873, 1, 1, 1, 1, 1,
-0.6581502, 0.1437963, -1.054221, 1, 1, 1, 1, 1,
-0.6506365, 0.8857509, -0.7743617, 1, 1, 1, 1, 1,
-0.6500696, -0.5693167, -1.971505, 1, 1, 1, 1, 1,
-0.6491627, -0.7779335, -2.521284, 0, 0, 1, 1, 1,
-0.647743, 0.9415983, -0.3202447, 1, 0, 0, 1, 1,
-0.6473661, -1.85844, -3.028113, 1, 0, 0, 1, 1,
-0.6463555, -0.630767, -2.637939, 1, 0, 0, 1, 1,
-0.6410674, -0.06403191, -1.501184, 1, 0, 0, 1, 1,
-0.6372482, -1.415147, -1.954718, 1, 0, 0, 1, 1,
-0.6351218, -0.702567, -4.422698, 0, 0, 0, 1, 1,
-0.6328016, -1.392448, -1.168012, 0, 0, 0, 1, 1,
-0.63192, 0.2154359, -1.142238, 0, 0, 0, 1, 1,
-0.6295866, -0.4422508, -2.139604, 0, 0, 0, 1, 1,
-0.6274551, -0.6591507, -1.46795, 0, 0, 0, 1, 1,
-0.6273578, 0.5629504, -1.252986, 0, 0, 0, 1, 1,
-0.6198871, -0.5371465, -2.85211, 0, 0, 0, 1, 1,
-0.6148293, 0.9827809, -0.4835213, 1, 1, 1, 1, 1,
-0.6147897, 1.055235, -0.9508868, 1, 1, 1, 1, 1,
-0.6121396, -1.870767, -3.268752, 1, 1, 1, 1, 1,
-0.6096302, 0.4860655, -1.626592, 1, 1, 1, 1, 1,
-0.6084543, 0.0930143, -0.6121972, 1, 1, 1, 1, 1,
-0.6066068, 1.499694, 0.2408012, 1, 1, 1, 1, 1,
-0.604528, -1.598425, -2.730525, 1, 1, 1, 1, 1,
-0.6011413, -0.8702423, -3.303538, 1, 1, 1, 1, 1,
-0.6010438, -1.033871, -2.712267, 1, 1, 1, 1, 1,
-0.5977753, -0.2898974, -2.368162, 1, 1, 1, 1, 1,
-0.5879868, 0.3125754, 0.5405852, 1, 1, 1, 1, 1,
-0.5869333, -0.3543769, -0.0006977949, 1, 1, 1, 1, 1,
-0.5816018, -0.7239392, -1.524384, 1, 1, 1, 1, 1,
-0.5790753, -0.1441595, -1.29292, 1, 1, 1, 1, 1,
-0.5787645, -0.2684208, -1.826471, 1, 1, 1, 1, 1,
-0.5747531, 0.3176427, -1.09145, 0, 0, 1, 1, 1,
-0.5745019, 0.7004529, -0.3709601, 1, 0, 0, 1, 1,
-0.5731333, -1.477802, -1.855827, 1, 0, 0, 1, 1,
-0.5711959, 0.7622151, -2.24617, 1, 0, 0, 1, 1,
-0.5690861, 1.919302, -1.001948, 1, 0, 0, 1, 1,
-0.5621921, -0.5251408, -3.08571, 1, 0, 0, 1, 1,
-0.5542073, 0.5298162, -1.012225, 0, 0, 0, 1, 1,
-0.5484774, 1.852965, -0.430989, 0, 0, 0, 1, 1,
-0.5419552, 0.07688844, -1.248117, 0, 0, 0, 1, 1,
-0.5390156, 1.748671, 1.001192, 0, 0, 0, 1, 1,
-0.5378195, -2.718917, -2.331041, 0, 0, 0, 1, 1,
-0.5354516, -1.409613, -2.765444, 0, 0, 0, 1, 1,
-0.5249065, -0.326187, -3.500894, 0, 0, 0, 1, 1,
-0.5220446, -1.703255, -1.822063, 1, 1, 1, 1, 1,
-0.521962, 0.6167761, 0.1653848, 1, 1, 1, 1, 1,
-0.5187783, 0.2968659, -1.77542, 1, 1, 1, 1, 1,
-0.5174525, -0.02853905, -3.246486, 1, 1, 1, 1, 1,
-0.5105569, -0.9802965, -1.938208, 1, 1, 1, 1, 1,
-0.5040342, 0.04991069, -1.654093, 1, 1, 1, 1, 1,
-0.4951506, -1.14117, -1.088928, 1, 1, 1, 1, 1,
-0.4935441, 0.4063243, -1.008338, 1, 1, 1, 1, 1,
-0.4902859, 0.129468, -0.4730508, 1, 1, 1, 1, 1,
-0.4884442, 0.9891097, -0.7943454, 1, 1, 1, 1, 1,
-0.4879136, 1.397311, -0.6206287, 1, 1, 1, 1, 1,
-0.48757, 0.8286987, -0.7846498, 1, 1, 1, 1, 1,
-0.4869705, 0.3501808, -1.711645, 1, 1, 1, 1, 1,
-0.4860409, 0.2950638, -2.795377, 1, 1, 1, 1, 1,
-0.4816151, 0.920163, 2.148192, 1, 1, 1, 1, 1,
-0.4813805, 1.750816, 0.1222809, 0, 0, 1, 1, 1,
-0.4782048, 0.940547, -0.2500339, 1, 0, 0, 1, 1,
-0.4764, 0.5542466, 0.6420163, 1, 0, 0, 1, 1,
-0.4750891, 1.974455, 1.66479, 1, 0, 0, 1, 1,
-0.4726131, 0.2828407, -2.006038, 1, 0, 0, 1, 1,
-0.4724605, -0.3537245, -2.170234, 1, 0, 0, 1, 1,
-0.4680902, 0.8212761, -0.4643148, 0, 0, 0, 1, 1,
-0.4622197, -0.9819336, -2.691369, 0, 0, 0, 1, 1,
-0.4606004, -0.4652371, -2.012215, 0, 0, 0, 1, 1,
-0.4576396, 1.211012, 0.8160796, 0, 0, 0, 1, 1,
-0.4561368, 0.1566861, 0.6380957, 0, 0, 0, 1, 1,
-0.4559106, 1.348878, 1.179733, 0, 0, 0, 1, 1,
-0.4538455, 0.1146366, -0.07549009, 0, 0, 0, 1, 1,
-0.4522176, 2.306398, -0.1263976, 1, 1, 1, 1, 1,
-0.4509152, -1.478804, -4.013046, 1, 1, 1, 1, 1,
-0.4499954, -0.9774544, -2.911182, 1, 1, 1, 1, 1,
-0.4321398, -0.5503233, -1.774359, 1, 1, 1, 1, 1,
-0.4320974, -0.4685788, -2.680649, 1, 1, 1, 1, 1,
-0.4283485, 0.2308877, -0.4935976, 1, 1, 1, 1, 1,
-0.4280343, 0.6657643, -2.072825, 1, 1, 1, 1, 1,
-0.4268695, 0.1518253, -2.407905, 1, 1, 1, 1, 1,
-0.4263546, -0.7642492, -3.821333, 1, 1, 1, 1, 1,
-0.4235489, 0.2851394, -0.6306137, 1, 1, 1, 1, 1,
-0.4148953, -0.4905159, -3.582728, 1, 1, 1, 1, 1,
-0.4141173, 0.868506, -0.7739007, 1, 1, 1, 1, 1,
-0.4120967, -1.983879, -2.842479, 1, 1, 1, 1, 1,
-0.4113315, 0.02794815, -1.772513, 1, 1, 1, 1, 1,
-0.4106838, 0.0915449, -0.2051124, 1, 1, 1, 1, 1,
-0.4099799, 0.4456538, -1.028924, 0, 0, 1, 1, 1,
-0.4078727, 0.1870279, -0.3760569, 1, 0, 0, 1, 1,
-0.4011944, -0.2033846, -3.427483, 1, 0, 0, 1, 1,
-0.3964465, 2.030116, -0.8430375, 1, 0, 0, 1, 1,
-0.3893588, -2.667769, -1.664439, 1, 0, 0, 1, 1,
-0.3863762, -0.3224783, -1.704973, 1, 0, 0, 1, 1,
-0.3857367, 1.549794, -1.38249, 0, 0, 0, 1, 1,
-0.3841797, -0.6453171, -2.346094, 0, 0, 0, 1, 1,
-0.3835177, 0.282546, -0.4142922, 0, 0, 0, 1, 1,
-0.3832102, -1.061678, -3.345837, 0, 0, 0, 1, 1,
-0.3828713, 1.609627, -1.900842, 0, 0, 0, 1, 1,
-0.377567, 1.336062, -0.284336, 0, 0, 0, 1, 1,
-0.3752247, 0.6881177, -0.6848358, 0, 0, 0, 1, 1,
-0.3737451, -0.2484594, -1.570185, 1, 1, 1, 1, 1,
-0.3735328, -0.727342, -2.612628, 1, 1, 1, 1, 1,
-0.3684399, 0.04467556, -0.4925, 1, 1, 1, 1, 1,
-0.3682984, -0.7620307, -3.924406, 1, 1, 1, 1, 1,
-0.3677908, -1.308103, -2.545052, 1, 1, 1, 1, 1,
-0.3631942, -3.178706, -2.003117, 1, 1, 1, 1, 1,
-0.360402, 0.3391827, -0.5595264, 1, 1, 1, 1, 1,
-0.3596202, 1.327093, 1.787465, 1, 1, 1, 1, 1,
-0.3549706, 0.9589216, -1.321661, 1, 1, 1, 1, 1,
-0.3533176, 0.8655024, -1.897768, 1, 1, 1, 1, 1,
-0.3495491, -0.302259, -1.960991, 1, 1, 1, 1, 1,
-0.3452794, -0.7230582, -4.089174, 1, 1, 1, 1, 1,
-0.3423713, 1.080099, -0.5256761, 1, 1, 1, 1, 1,
-0.3396533, 0.6443363, -2.052088, 1, 1, 1, 1, 1,
-0.3359517, -0.9895044, -3.346863, 1, 1, 1, 1, 1,
-0.334615, -0.2945304, -4.73989, 0, 0, 1, 1, 1,
-0.3341039, -2.352105, -3.703123, 1, 0, 0, 1, 1,
-0.3306176, -0.3003079, -2.88552, 1, 0, 0, 1, 1,
-0.3285839, 0.1119275, -0.7995666, 1, 0, 0, 1, 1,
-0.3270919, -0.406049, -1.664171, 1, 0, 0, 1, 1,
-0.325737, 0.5392059, -1.465341, 1, 0, 0, 1, 1,
-0.3235999, 0.01167854, -0.8613323, 0, 0, 0, 1, 1,
-0.3232758, 0.06035901, -1.160554, 0, 0, 0, 1, 1,
-0.3216908, 0.1626559, -3.480272, 0, 0, 0, 1, 1,
-0.3139809, 1.479467, 0.6499513, 0, 0, 0, 1, 1,
-0.3123937, 0.8646087, -0.2450077, 0, 0, 0, 1, 1,
-0.3110754, 0.5366297, 0.2387071, 0, 0, 0, 1, 1,
-0.3082987, 0.2507387, -0.8893484, 0, 0, 0, 1, 1,
-0.3079077, -0.423279, -1.875622, 1, 1, 1, 1, 1,
-0.3042148, -0.2674312, -3.136656, 1, 1, 1, 1, 1,
-0.3013347, 1.569517, 1.185763, 1, 1, 1, 1, 1,
-0.2964328, -0.06503627, -1.143804, 1, 1, 1, 1, 1,
-0.2961485, 0.871819, -0.2127544, 1, 1, 1, 1, 1,
-0.2894941, 1.260297, -1.341084, 1, 1, 1, 1, 1,
-0.2813457, 0.8341123, 0.2047191, 1, 1, 1, 1, 1,
-0.2746091, 0.57166, -1.225449, 1, 1, 1, 1, 1,
-0.2725371, -0.7558288, -4.204278, 1, 1, 1, 1, 1,
-0.2705764, 0.9427599, 0.7504441, 1, 1, 1, 1, 1,
-0.2620218, -0.9896523, -2.43551, 1, 1, 1, 1, 1,
-0.2601469, -0.6677065, -3.463976, 1, 1, 1, 1, 1,
-0.2595059, 0.05906506, -3.056429, 1, 1, 1, 1, 1,
-0.2579572, 0.3450895, 0.475487, 1, 1, 1, 1, 1,
-0.2562121, -1.518908, -1.763235, 1, 1, 1, 1, 1,
-0.2547084, 0.420305, -0.4016665, 0, 0, 1, 1, 1,
-0.2499281, 1.087547, 0.7202153, 1, 0, 0, 1, 1,
-0.2494565, 0.6716279, -1.751912, 1, 0, 0, 1, 1,
-0.2468812, -1.489791, -2.9922, 1, 0, 0, 1, 1,
-0.2459059, 0.1039053, -2.186353, 1, 0, 0, 1, 1,
-0.2449409, 1.908199, -0.4463302, 1, 0, 0, 1, 1,
-0.2439676, -0.857906, -3.309862, 0, 0, 0, 1, 1,
-0.2425888, 0.1095012, -1.835832, 0, 0, 0, 1, 1,
-0.2393119, -1.56525, -3.647893, 0, 0, 0, 1, 1,
-0.2334531, 0.1257816, -0.3575833, 0, 0, 0, 1, 1,
-0.2319602, 0.8881742, 0.02111057, 0, 0, 0, 1, 1,
-0.2311662, 1.295251, 0.2771741, 0, 0, 0, 1, 1,
-0.2307844, 0.115837, -1.714981, 0, 0, 0, 1, 1,
-0.2301605, 2.394468, -0.5583121, 1, 1, 1, 1, 1,
-0.2253067, 0.02417883, -3.21485, 1, 1, 1, 1, 1,
-0.2224534, 1.044276, -0.8953418, 1, 1, 1, 1, 1,
-0.2129024, 1.806169, -0.7346189, 1, 1, 1, 1, 1,
-0.2095829, 0.8491177, 0.3920813, 1, 1, 1, 1, 1,
-0.209118, 1.450785, -0.2010095, 1, 1, 1, 1, 1,
-0.206763, -0.02173069, -2.75443, 1, 1, 1, 1, 1,
-0.2061771, -0.4334589, -2.553033, 1, 1, 1, 1, 1,
-0.2054552, 1.072107, 1.696074, 1, 1, 1, 1, 1,
-0.2051601, -1.489437, -3.582883, 1, 1, 1, 1, 1,
-0.2047412, 0.7929898, 0.1360289, 1, 1, 1, 1, 1,
-0.2042909, -0.770387, -2.562354, 1, 1, 1, 1, 1,
-0.2034444, 0.06979585, -0.7940015, 1, 1, 1, 1, 1,
-0.2025896, -0.2923715, -3.193308, 1, 1, 1, 1, 1,
-0.2025472, -1.376695, -2.839087, 1, 1, 1, 1, 1,
-0.197646, -0.7351955, -3.297988, 0, 0, 1, 1, 1,
-0.1972591, -1.841352, -4.905065, 1, 0, 0, 1, 1,
-0.195183, -1.15298, -2.534574, 1, 0, 0, 1, 1,
-0.1947675, -1.148054, -2.73655, 1, 0, 0, 1, 1,
-0.1945415, -0.6899722, -1.849346, 1, 0, 0, 1, 1,
-0.1915728, -0.4707019, -3.320325, 1, 0, 0, 1, 1,
-0.1825268, -0.2583561, -2.063187, 0, 0, 0, 1, 1,
-0.1778326, -1.067109, -1.037851, 0, 0, 0, 1, 1,
-0.1770212, 0.01859588, -0.9619564, 0, 0, 0, 1, 1,
-0.1759915, 0.1017684, -1.944956, 0, 0, 0, 1, 1,
-0.173259, -0.7446366, -3.113323, 0, 0, 0, 1, 1,
-0.1717113, 1.010396, 0.615055, 0, 0, 0, 1, 1,
-0.1708966, -0.8545508, -2.521508, 0, 0, 0, 1, 1,
-0.1704399, -0.5007508, -2.595786, 1, 1, 1, 1, 1,
-0.1679088, -0.2419347, -2.648824, 1, 1, 1, 1, 1,
-0.1652087, -1.06891, -5.315328, 1, 1, 1, 1, 1,
-0.1626402, -2.046798, -3.849503, 1, 1, 1, 1, 1,
-0.1609729, -1.201381, -2.599383, 1, 1, 1, 1, 1,
-0.1608024, -0.1506155, -2.181642, 1, 1, 1, 1, 1,
-0.1590354, -0.6723093, -0.7275838, 1, 1, 1, 1, 1,
-0.1585218, -0.1363311, -1.586226, 1, 1, 1, 1, 1,
-0.1569932, 1.369324, 1.043291, 1, 1, 1, 1, 1,
-0.1538162, 0.9968573, 1.260996, 1, 1, 1, 1, 1,
-0.1470618, 0.465986, -2.195776, 1, 1, 1, 1, 1,
-0.1457634, 1.094053, 1.172458, 1, 1, 1, 1, 1,
-0.1213458, 0.07622569, -0.8055385, 1, 1, 1, 1, 1,
-0.1201474, 0.296402, -0.6747869, 1, 1, 1, 1, 1,
-0.1196912, 1.088696, -0.8208897, 1, 1, 1, 1, 1,
-0.1168905, 0.2645214, -0.07207844, 0, 0, 1, 1, 1,
-0.1154827, 1.360131, -1.461643, 1, 0, 0, 1, 1,
-0.1092079, 0.4464137, 0.2884615, 1, 0, 0, 1, 1,
-0.1040567, 0.1478137, 0.08306932, 1, 0, 0, 1, 1,
-0.1002209, -0.3098088, -3.330489, 1, 0, 0, 1, 1,
-0.09980894, -0.6769692, -2.317941, 1, 0, 0, 1, 1,
-0.09591629, 0.498426, 0.8064075, 0, 0, 0, 1, 1,
-0.09503865, 0.3197693, 0.09964874, 0, 0, 0, 1, 1,
-0.09328859, 2.191715, 0.1266244, 0, 0, 0, 1, 1,
-0.09220105, -0.2477603, -4.080227, 0, 0, 0, 1, 1,
-0.09135996, -2.101854, -3.34857, 0, 0, 0, 1, 1,
-0.09027027, 1.032385, 1.076367, 0, 0, 0, 1, 1,
-0.0896256, 0.4671658, -1.866233, 0, 0, 0, 1, 1,
-0.08691898, 1.273196, -0.9460821, 1, 1, 1, 1, 1,
-0.08366077, -0.07506131, -1.654306, 1, 1, 1, 1, 1,
-0.08167244, -1.501336, -2.242913, 1, 1, 1, 1, 1,
-0.08114538, 1.198348, 0.2568882, 1, 1, 1, 1, 1,
-0.08074102, 1.465314, 0.3223364, 1, 1, 1, 1, 1,
-0.07414753, -0.5874723, -4.473995, 1, 1, 1, 1, 1,
-0.06952984, -0.3724056, -3.027741, 1, 1, 1, 1, 1,
-0.06858322, 0.5567229, 1.047344, 1, 1, 1, 1, 1,
-0.06713314, -1.124874, -1.59773, 1, 1, 1, 1, 1,
-0.06647272, -0.4166608, -1.209196, 1, 1, 1, 1, 1,
-0.06437618, -1.181872, -2.516711, 1, 1, 1, 1, 1,
-0.05878953, -1.152246, -2.722943, 1, 1, 1, 1, 1,
-0.05799912, -0.5811642, -3.051956, 1, 1, 1, 1, 1,
-0.05727415, -0.3842896, -4.136922, 1, 1, 1, 1, 1,
-0.05282967, -0.3170574, -2.345017, 1, 1, 1, 1, 1,
-0.05267493, -1.256135, -3.876406, 0, 0, 1, 1, 1,
-0.05213616, 0.4745934, 0.9293884, 1, 0, 0, 1, 1,
-0.05134796, 0.6457219, 1.358538, 1, 0, 0, 1, 1,
-0.04382414, 1.076009, -0.06557847, 1, 0, 0, 1, 1,
-0.03990157, -1.06717, -3.421704, 1, 0, 0, 1, 1,
-0.0390832, 0.6460789, 0.02910372, 1, 0, 0, 1, 1,
-0.03511286, 0.1243334, -2.076176, 0, 0, 0, 1, 1,
-0.03094748, -1.982874, -4.173572, 0, 0, 0, 1, 1,
-0.02742758, -1.762228, -4.312647, 0, 0, 0, 1, 1,
-0.02728458, -1.516326, -4.401485, 0, 0, 0, 1, 1,
-0.02668601, 1.764719, 1.104167, 0, 0, 0, 1, 1,
-0.02649916, 0.4909782, -0.7601638, 0, 0, 0, 1, 1,
-0.02519562, 0.3954884, -1.239155, 0, 0, 0, 1, 1,
-0.02495245, 0.4334106, -0.1154608, 1, 1, 1, 1, 1,
-0.02445538, -0.7165695, -4.517615, 1, 1, 1, 1, 1,
-0.02221727, -0.2130649, -1.635932, 1, 1, 1, 1, 1,
-0.02188608, 0.5728315, 0.8560246, 1, 1, 1, 1, 1,
-0.02058498, 0.2675914, 0.2216452, 1, 1, 1, 1, 1,
-0.01563068, 1.200836, -0.4240031, 1, 1, 1, 1, 1,
-0.01190305, 1.528504, 1.110832, 1, 1, 1, 1, 1,
-0.01186508, 0.8945885, 0.3931022, 1, 1, 1, 1, 1,
-0.004251849, -0.5991852, -2.270793, 1, 1, 1, 1, 1,
-0.003559598, -3.202493, -3.830376, 1, 1, 1, 1, 1,
-0.002930679, -0.1093136, -2.970968, 1, 1, 1, 1, 1,
-0.002614039, 0.5409955, -1.819697, 1, 1, 1, 1, 1,
-0.002419008, -1.397168, -2.144374, 1, 1, 1, 1, 1,
0.0005419932, 1.654622, -0.08000611, 1, 1, 1, 1, 1,
0.0007693919, 1.255876, 0.4955881, 1, 1, 1, 1, 1,
0.006731097, 1.113224, -0.3713327, 0, 0, 1, 1, 1,
0.008733895, -1.313059, 2.331065, 1, 0, 0, 1, 1,
0.01215723, -0.4535706, 4.180842, 1, 0, 0, 1, 1,
0.01500806, -0.9926309, 3.431152, 1, 0, 0, 1, 1,
0.01553885, -1.438145, 2.658635, 1, 0, 0, 1, 1,
0.02047079, 1.168365, 0.1943616, 1, 0, 0, 1, 1,
0.02502349, -0.8057274, 3.137328, 0, 0, 0, 1, 1,
0.02559013, 0.8745148, 1.390571, 0, 0, 0, 1, 1,
0.02677332, -2.254553, 4.044187, 0, 0, 0, 1, 1,
0.03092729, 0.3105884, -0.2168861, 0, 0, 0, 1, 1,
0.03305509, -0.01885416, 2.66449, 0, 0, 0, 1, 1,
0.03559151, 1.0601, 0.2045839, 0, 0, 0, 1, 1,
0.03831402, -0.5755101, 3.563308, 0, 0, 0, 1, 1,
0.03890358, -1.445753, 2.366066, 1, 1, 1, 1, 1,
0.03960296, 1.380051, 0.1315419, 1, 1, 1, 1, 1,
0.04012046, 0.6707987, -0.319281, 1, 1, 1, 1, 1,
0.04508284, -0.2465904, 1.434351, 1, 1, 1, 1, 1,
0.04559691, 0.3805756, -1.110628, 1, 1, 1, 1, 1,
0.04688255, -1.369317, 2.787405, 1, 1, 1, 1, 1,
0.0476076, -1.379451, 3.191926, 1, 1, 1, 1, 1,
0.04821359, -1.950438, 3.016352, 1, 1, 1, 1, 1,
0.05644455, 0.01519833, 1.424616, 1, 1, 1, 1, 1,
0.05848363, 1.251443, 0.631496, 1, 1, 1, 1, 1,
0.06104076, 0.9999438, 0.03775611, 1, 1, 1, 1, 1,
0.06694086, -0.3877574, 2.870325, 1, 1, 1, 1, 1,
0.07236499, 0.5915889, -1.852493, 1, 1, 1, 1, 1,
0.07268324, 1.394445, 0.1582594, 1, 1, 1, 1, 1,
0.0750712, 0.8609867, 0.2276943, 1, 1, 1, 1, 1,
0.07688816, 0.141278, 1.053811, 0, 0, 1, 1, 1,
0.07943414, -0.02646046, 0.6138625, 1, 0, 0, 1, 1,
0.08376917, 1.103626, -0.6510453, 1, 0, 0, 1, 1,
0.09062675, -1.167017, 2.335582, 1, 0, 0, 1, 1,
0.09340104, -0.9471383, 2.939732, 1, 0, 0, 1, 1,
0.09654129, 1.30198, 0.756087, 1, 0, 0, 1, 1,
0.1036499, 0.6257143, -1.330941, 0, 0, 0, 1, 1,
0.1046304, 0.1880502, 0.6569915, 0, 0, 0, 1, 1,
0.1069218, 0.699415, -0.272296, 0, 0, 0, 1, 1,
0.1075913, 0.3183491, 0.4510501, 0, 0, 0, 1, 1,
0.1128975, -1.880588, 3.4795, 0, 0, 0, 1, 1,
0.116966, 0.1993653, -0.6449337, 0, 0, 0, 1, 1,
0.1223672, 0.6867113, -0.129418, 0, 0, 0, 1, 1,
0.1356753, -0.5948716, 4.718875, 1, 1, 1, 1, 1,
0.1362815, -1.232916, 3.124356, 1, 1, 1, 1, 1,
0.1415214, 0.5488718, -2.562444, 1, 1, 1, 1, 1,
0.1416563, -0.2728148, 3.622714, 1, 1, 1, 1, 1,
0.1443861, 1.895451, 1.286093, 1, 1, 1, 1, 1,
0.1449041, 0.8759443, 0.3258327, 1, 1, 1, 1, 1,
0.1464728, -0.1112741, 2.908491, 1, 1, 1, 1, 1,
0.1469733, 0.6921321, -0.9218822, 1, 1, 1, 1, 1,
0.1510852, -1.482716, 2.1686, 1, 1, 1, 1, 1,
0.15337, 1.196618, -0.4088458, 1, 1, 1, 1, 1,
0.1538817, -0.3428106, 2.249951, 1, 1, 1, 1, 1,
0.1557298, -1.500137, 2.173738, 1, 1, 1, 1, 1,
0.1614568, 3.206629, -0.6229697, 1, 1, 1, 1, 1,
0.1653611, 0.9048011, 0.9725727, 1, 1, 1, 1, 1,
0.1723623, -0.4166417, 4.260595, 1, 1, 1, 1, 1,
0.1755062, -0.2980786, 2.461759, 0, 0, 1, 1, 1,
0.176866, 0.8671675, -0.1861329, 1, 0, 0, 1, 1,
0.1789353, 1.644019, -0.5008518, 1, 0, 0, 1, 1,
0.1802938, 0.8061547, -0.01135565, 1, 0, 0, 1, 1,
0.1858026, 0.8886883, -1.265247, 1, 0, 0, 1, 1,
0.1927859, -0.7653152, 1.129485, 1, 0, 0, 1, 1,
0.1959591, -0.1628051, 3.15519, 0, 0, 0, 1, 1,
0.1962151, 1.393321, -0.6860296, 0, 0, 0, 1, 1,
0.2045962, -0.8854524, 2.19695, 0, 0, 0, 1, 1,
0.2115945, -2.415684, 2.885469, 0, 0, 0, 1, 1,
0.219377, 0.8467568, 1.296242, 0, 0, 0, 1, 1,
0.2292545, -1.147625, 2.740656, 0, 0, 0, 1, 1,
0.2298927, -0.586441, 2.686372, 0, 0, 0, 1, 1,
0.2303961, -1.194892, 0.9288123, 1, 1, 1, 1, 1,
0.2306387, 2.259888, -2.052391, 1, 1, 1, 1, 1,
0.2360896, 0.5619968, 0.04360367, 1, 1, 1, 1, 1,
0.2406603, 0.3371603, 0.3330302, 1, 1, 1, 1, 1,
0.2407028, 0.8979861, -0.3479579, 1, 1, 1, 1, 1,
0.2434267, 1.017032, -1.524628, 1, 1, 1, 1, 1,
0.2435078, 0.797314, 0.4677763, 1, 1, 1, 1, 1,
0.2439695, -0.6498407, 3.254741, 1, 1, 1, 1, 1,
0.2548583, 0.001348933, 1.413156, 1, 1, 1, 1, 1,
0.2629015, -1.686906, 2.301791, 1, 1, 1, 1, 1,
0.2671578, -1.347014, 2.9482, 1, 1, 1, 1, 1,
0.2674577, 1.174643, -0.720024, 1, 1, 1, 1, 1,
0.2677449, -0.4388439, 3.499289, 1, 1, 1, 1, 1,
0.2693343, 0.351565, 0.5329832, 1, 1, 1, 1, 1,
0.2704393, 1.559682, 0.2341057, 1, 1, 1, 1, 1,
0.2704432, 0.4211397, 1.135742, 0, 0, 1, 1, 1,
0.2712294, 0.6349365, 0.3235887, 1, 0, 0, 1, 1,
0.2712785, 1.908643, 1.854157, 1, 0, 0, 1, 1,
0.2718585, 0.7487271, 0.4831268, 1, 0, 0, 1, 1,
0.2745415, -0.5178057, 1.465037, 1, 0, 0, 1, 1,
0.2757761, -1.433831, 2.679302, 1, 0, 0, 1, 1,
0.2762726, 0.6404755, 0.03767669, 0, 0, 0, 1, 1,
0.2769823, -0.4063866, 4.022063, 0, 0, 0, 1, 1,
0.2825182, -1.829481, 1.781318, 0, 0, 0, 1, 1,
0.2846774, 0.6604016, 0.7562917, 0, 0, 0, 1, 1,
0.2858186, -0.4228349, 3.519399, 0, 0, 0, 1, 1,
0.2859561, -0.9229116, 1.723519, 0, 0, 0, 1, 1,
0.2902849, -0.8758392, 1.755814, 0, 0, 0, 1, 1,
0.2936988, -0.8769224, 2.835785, 1, 1, 1, 1, 1,
0.2938719, 0.5789801, 0.7815619, 1, 1, 1, 1, 1,
0.2944147, -1.45755, 2.641307, 1, 1, 1, 1, 1,
0.296018, -1.351172, 3.916283, 1, 1, 1, 1, 1,
0.3039842, 0.01638277, 1.16206, 1, 1, 1, 1, 1,
0.3056748, -1.87151, 2.162063, 1, 1, 1, 1, 1,
0.306866, -1.077221, 0.3606556, 1, 1, 1, 1, 1,
0.3072056, -0.4139135, 2.964988, 1, 1, 1, 1, 1,
0.3121486, -0.7120233, 3.803587, 1, 1, 1, 1, 1,
0.3144413, -0.6489017, 1.869727, 1, 1, 1, 1, 1,
0.3250424, -1.088644, 3.059048, 1, 1, 1, 1, 1,
0.3256995, 0.1548093, 1.172342, 1, 1, 1, 1, 1,
0.3257141, -1.174519, 2.118683, 1, 1, 1, 1, 1,
0.3258747, 0.1541852, 1.778223, 1, 1, 1, 1, 1,
0.3270384, -1.166308, 4.69082, 1, 1, 1, 1, 1,
0.3279389, -0.3672289, 1.874043, 0, 0, 1, 1, 1,
0.3316788, 1.959534, 0.3401914, 1, 0, 0, 1, 1,
0.3365563, -0.8032888, 4.298952, 1, 0, 0, 1, 1,
0.3384408, -0.9555902, 2.191858, 1, 0, 0, 1, 1,
0.340142, -0.9555917, 3.060097, 1, 0, 0, 1, 1,
0.3402877, 0.201857, 1.236213, 1, 0, 0, 1, 1,
0.3412, -0.2663957, 2.764689, 0, 0, 0, 1, 1,
0.342993, 0.7150396, -0.07229965, 0, 0, 0, 1, 1,
0.3440152, 0.2596143, 1.565621, 0, 0, 0, 1, 1,
0.3448662, -0.5550808, 3.669275, 0, 0, 0, 1, 1,
0.3508471, -0.05801662, 1.936094, 0, 0, 0, 1, 1,
0.3529762, -0.1106895, 2.046683, 0, 0, 0, 1, 1,
0.3539246, -0.8539383, 3.037214, 0, 0, 0, 1, 1,
0.3720294, -0.5388576, 3.768444, 1, 1, 1, 1, 1,
0.3722377, -1.209033, 2.212052, 1, 1, 1, 1, 1,
0.3738369, -0.8502376, 2.762466, 1, 1, 1, 1, 1,
0.376647, -0.8345218, 3.3108, 1, 1, 1, 1, 1,
0.3850565, 1.362504, 1.496561, 1, 1, 1, 1, 1,
0.3863454, 0.862958, -0.1259182, 1, 1, 1, 1, 1,
0.3885215, 0.9742883, 0.5216554, 1, 1, 1, 1, 1,
0.3892198, 1.658205, -0.942189, 1, 1, 1, 1, 1,
0.3918936, -0.2147308, 3.090721, 1, 1, 1, 1, 1,
0.3931075, -1.045384, 3.52184, 1, 1, 1, 1, 1,
0.3950218, 0.2349552, -0.4512098, 1, 1, 1, 1, 1,
0.3987297, 0.1559947, 2.45265, 1, 1, 1, 1, 1,
0.3994397, 0.4372612, 0.254395, 1, 1, 1, 1, 1,
0.4007883, 1.548091, 0.06176421, 1, 1, 1, 1, 1,
0.4015217, 1.078737, 0.7987267, 1, 1, 1, 1, 1,
0.4022604, 1.118498, 0.3672845, 0, 0, 1, 1, 1,
0.4041092, -0.006775144, 1.329463, 1, 0, 0, 1, 1,
0.4062132, 1.013118, 0.9932572, 1, 0, 0, 1, 1,
0.4066547, -0.3723781, 3.727807, 1, 0, 0, 1, 1,
0.4189099, -0.2168366, 0.7162482, 1, 0, 0, 1, 1,
0.4253162, 0.5402083, 0.1048139, 1, 0, 0, 1, 1,
0.4269263, 0.4477481, -0.4190581, 0, 0, 0, 1, 1,
0.4274039, -1.108726, 3.478662, 0, 0, 0, 1, 1,
0.4285735, 0.2878564, 0.6716467, 0, 0, 0, 1, 1,
0.4288737, 0.2825596, 0.873755, 0, 0, 0, 1, 1,
0.4293616, -0.8450972, 2.516542, 0, 0, 0, 1, 1,
0.4316798, 0.6858727, 0.5936104, 0, 0, 0, 1, 1,
0.4371846, 1.627903, -0.1248059, 0, 0, 0, 1, 1,
0.4417784, 1.199538, -0.003390501, 1, 1, 1, 1, 1,
0.4463037, 1.002735, 1.075882, 1, 1, 1, 1, 1,
0.4513026, -2.425313, 3.074464, 1, 1, 1, 1, 1,
0.4517486, 2.051536, 0.2744791, 1, 1, 1, 1, 1,
0.4605698, -1.096541, 1.766663, 1, 1, 1, 1, 1,
0.4628956, 1.167166, 0.2944234, 1, 1, 1, 1, 1,
0.4645295, 0.3417266, 0.3116059, 1, 1, 1, 1, 1,
0.4671434, -1.018345, 2.551564, 1, 1, 1, 1, 1,
0.4679342, 1.160272, -1.279569, 1, 1, 1, 1, 1,
0.468376, 0.7576792, 2.107999, 1, 1, 1, 1, 1,
0.4697512, 0.08015196, 2.668851, 1, 1, 1, 1, 1,
0.4739438, -1.025248, 2.307104, 1, 1, 1, 1, 1,
0.4772886, 0.4399081, -0.7033835, 1, 1, 1, 1, 1,
0.4781138, -0.3636387, 2.197181, 1, 1, 1, 1, 1,
0.4797339, 0.6599072, 1.463485, 1, 1, 1, 1, 1,
0.4885117, -0.3294025, 2.146661, 0, 0, 1, 1, 1,
0.4917196, -0.3096876, 2.704496, 1, 0, 0, 1, 1,
0.4936942, -1.770305, 1.031206, 1, 0, 0, 1, 1,
0.4978207, 0.1479051, -0.173282, 1, 0, 0, 1, 1,
0.5035545, 0.2747193, 0.9001327, 1, 0, 0, 1, 1,
0.5065385, -0.257516, 2.934337, 1, 0, 0, 1, 1,
0.5106506, 1.230674, 1.74981, 0, 0, 0, 1, 1,
0.5130541, -2.093794, 1.836269, 0, 0, 0, 1, 1,
0.513958, -0.2187587, 1.783826, 0, 0, 0, 1, 1,
0.5170086, 0.1140033, 1.093827, 0, 0, 0, 1, 1,
0.5176601, 1.348285, 0.5988788, 0, 0, 0, 1, 1,
0.5197486, 0.3451476, 0.7254731, 0, 0, 0, 1, 1,
0.5213119, 0.4936782, 0.9878576, 0, 0, 0, 1, 1,
0.5237014, 0.09209812, 2.363348, 1, 1, 1, 1, 1,
0.5282134, -0.2986014, 1.260117, 1, 1, 1, 1, 1,
0.5296316, -0.5067881, 1.758988, 1, 1, 1, 1, 1,
0.5315336, -1.111016, 2.498591, 1, 1, 1, 1, 1,
0.533967, 1.373785, 0.5672736, 1, 1, 1, 1, 1,
0.5351129, -0.8728976, 3.26614, 1, 1, 1, 1, 1,
0.5371498, 0.6644656, 2.45023, 1, 1, 1, 1, 1,
0.5396786, 0.8060056, 1.08064, 1, 1, 1, 1, 1,
0.5404414, 0.837288, 0.4423391, 1, 1, 1, 1, 1,
0.5407954, 0.9489405, 0.07670638, 1, 1, 1, 1, 1,
0.5446157, -0.2802137, 2.953823, 1, 1, 1, 1, 1,
0.5480046, -0.2621205, 2.937276, 1, 1, 1, 1, 1,
0.5568732, 0.3644928, -1.358989, 1, 1, 1, 1, 1,
0.5602558, -1.006648, 3.50087, 1, 1, 1, 1, 1,
0.5616515, 0.2653124, -0.5337033, 1, 1, 1, 1, 1,
0.5636809, -1.458605, 1.942998, 0, 0, 1, 1, 1,
0.5706019, -0.2355008, 3.103277, 1, 0, 0, 1, 1,
0.5736969, -0.2224327, 0.1251218, 1, 0, 0, 1, 1,
0.5805299, 1.579827, 2.173182, 1, 0, 0, 1, 1,
0.5876281, 0.6146999, 1.680794, 1, 0, 0, 1, 1,
0.5954115, 0.223597, 1.324608, 1, 0, 0, 1, 1,
0.5976607, -0.1620701, -0.037368, 0, 0, 0, 1, 1,
0.5977402, -0.4321724, 2.218827, 0, 0, 0, 1, 1,
0.6030041, 0.4265267, 0.8546755, 0, 0, 0, 1, 1,
0.6102104, 2.017582, 0.8068658, 0, 0, 0, 1, 1,
0.6112649, -0.7930012, 1.783879, 0, 0, 0, 1, 1,
0.6192979, 0.06114981, 1.872507, 0, 0, 0, 1, 1,
0.6213109, -0.2848455, 1.227468, 0, 0, 0, 1, 1,
0.6217877, -0.8857356, 1.79048, 1, 1, 1, 1, 1,
0.6278806, -0.9586756, 3.498765, 1, 1, 1, 1, 1,
0.6295811, 1.918548, 0.778783, 1, 1, 1, 1, 1,
0.6304614, 0.6789123, 0.5369247, 1, 1, 1, 1, 1,
0.6326792, -0.9995314, 3.243788, 1, 1, 1, 1, 1,
0.6376248, 0.9871437, 0.1640499, 1, 1, 1, 1, 1,
0.6435112, 0.3424384, 0.967769, 1, 1, 1, 1, 1,
0.6463996, 1.082907, -0.6302303, 1, 1, 1, 1, 1,
0.6481829, -0.16932, 3.512764, 1, 1, 1, 1, 1,
0.6492573, 0.4308843, 0.9990707, 1, 1, 1, 1, 1,
0.650781, -0.5372653, 1.90461, 1, 1, 1, 1, 1,
0.6568381, 0.1044054, 0.4551249, 1, 1, 1, 1, 1,
0.6579226, 1.061984, 1.41903, 1, 1, 1, 1, 1,
0.6596354, 1.492707, -0.6652188, 1, 1, 1, 1, 1,
0.6671818, -1.629749, 2.942051, 1, 1, 1, 1, 1,
0.6706232, -1.023506, 3.709091, 0, 0, 1, 1, 1,
0.6728095, -2.34335, 3.042615, 1, 0, 0, 1, 1,
0.6729719, 0.1538589, 1.390228, 1, 0, 0, 1, 1,
0.6731594, 1.179742, -0.6793399, 1, 0, 0, 1, 1,
0.6732434, 1.028691, 1.580551, 1, 0, 0, 1, 1,
0.6738415, -2.639494, 2.58832, 1, 0, 0, 1, 1,
0.6777985, 0.945877, -0.9030631, 0, 0, 0, 1, 1,
0.6799512, 2.000513, -0.8696824, 0, 0, 0, 1, 1,
0.6836601, -0.7634093, 2.45382, 0, 0, 0, 1, 1,
0.6849372, -0.3247578, 2.793206, 0, 0, 0, 1, 1,
0.6876219, 0.4941578, 0.5792387, 0, 0, 0, 1, 1,
0.6876484, -1.457644, 1.687699, 0, 0, 0, 1, 1,
0.6896346, 0.3153074, 0.8616443, 0, 0, 0, 1, 1,
0.6910608, -0.04730502, -0.3485493, 1, 1, 1, 1, 1,
0.6930994, -0.02838146, 0.8745563, 1, 1, 1, 1, 1,
0.6966969, 0.3501668, 0.7252551, 1, 1, 1, 1, 1,
0.7036066, 0.883777, -0.6640583, 1, 1, 1, 1, 1,
0.7051539, 0.5644992, 1.934922, 1, 1, 1, 1, 1,
0.7054122, -1.015351, 2.625814, 1, 1, 1, 1, 1,
0.7054412, -0.2640781, 0.739925, 1, 1, 1, 1, 1,
0.7055262, -1.303138, 1.669034, 1, 1, 1, 1, 1,
0.706894, 0.218323, 0.2801056, 1, 1, 1, 1, 1,
0.7082336, 0.2398132, 2.640785, 1, 1, 1, 1, 1,
0.7119338, 1.267706, -0.02876222, 1, 1, 1, 1, 1,
0.7158444, -1.423601, 3.29108, 1, 1, 1, 1, 1,
0.7195243, -0.3620931, 2.569167, 1, 1, 1, 1, 1,
0.7209181, 0.1171648, 0.8592814, 1, 1, 1, 1, 1,
0.7211314, 1.83898, 0.09435464, 1, 1, 1, 1, 1,
0.7332303, 1.739171, -0.07816359, 0, 0, 1, 1, 1,
0.7395629, 0.6780407, 1.797919, 1, 0, 0, 1, 1,
0.7440417, 0.9944949, 0.8536933, 1, 0, 0, 1, 1,
0.7449363, 0.01860047, -0.4716595, 1, 0, 0, 1, 1,
0.745195, 0.07246116, 0.650223, 1, 0, 0, 1, 1,
0.7453261, 0.3064143, 0.5430953, 1, 0, 0, 1, 1,
0.7457117, 0.4076501, -0.9176888, 0, 0, 0, 1, 1,
0.7524087, -0.1736327, 0.351652, 0, 0, 0, 1, 1,
0.7527685, 0.4963542, 2.222493, 0, 0, 0, 1, 1,
0.7568571, 0.8657545, -0.09718853, 0, 0, 0, 1, 1,
0.7826014, -0.4409803, 1.474811, 0, 0, 0, 1, 1,
0.7852451, 0.484711, 1.831201, 0, 0, 0, 1, 1,
0.7900146, -0.7426736, 1.32386, 0, 0, 0, 1, 1,
0.7901317, 0.2629943, 1.272334, 1, 1, 1, 1, 1,
0.796677, 0.3656439, 1.632644, 1, 1, 1, 1, 1,
0.7999068, 0.6168033, 1.485367, 1, 1, 1, 1, 1,
0.8005729, -1.543802, 3.801454, 1, 1, 1, 1, 1,
0.8164312, 0.319443, 1.869963, 1, 1, 1, 1, 1,
0.825039, -1.254874, 2.607898, 1, 1, 1, 1, 1,
0.8258867, -0.6328239, 2.171421, 1, 1, 1, 1, 1,
0.8277712, 0.0611041, 1.06841, 1, 1, 1, 1, 1,
0.8302915, -2.534701, 3.407676, 1, 1, 1, 1, 1,
0.831681, 1.591845, 0.8839059, 1, 1, 1, 1, 1,
0.8342336, -1.239241, 3.26079, 1, 1, 1, 1, 1,
0.8353756, 0.8975599, -0.1243646, 1, 1, 1, 1, 1,
0.8357357, 1.183732, 1.425223, 1, 1, 1, 1, 1,
0.8361567, -0.862089, 3.6224, 1, 1, 1, 1, 1,
0.8462176, 0.6089175, 1.647132, 1, 1, 1, 1, 1,
0.8469626, 0.8263636, 1.067624, 0, 0, 1, 1, 1,
0.8480603, -0.06808893, 1.652958, 1, 0, 0, 1, 1,
0.8522851, -0.2255273, 1.847106, 1, 0, 0, 1, 1,
0.8550191, 0.04771497, -0.1084124, 1, 0, 0, 1, 1,
0.85773, -0.2235001, 1.799299, 1, 0, 0, 1, 1,
0.8609746, 1.400955, 0.1273296, 1, 0, 0, 1, 1,
0.862583, 1.461222, -1.315449, 0, 0, 0, 1, 1,
0.8639485, 0.6301529, 0.6400136, 0, 0, 0, 1, 1,
0.8707551, 0.05550633, 1.76058, 0, 0, 0, 1, 1,
0.8850293, 0.6028509, 1.054338, 0, 0, 0, 1, 1,
0.888013, 0.5100709, 1.173295, 0, 0, 0, 1, 1,
0.8885682, -1.370735, 2.788169, 0, 0, 0, 1, 1,
0.8915089, 0.3455369, 2.707966, 0, 0, 0, 1, 1,
0.892271, 1.073319, -0.2096068, 1, 1, 1, 1, 1,
0.9091834, 0.3693919, 2.286026, 1, 1, 1, 1, 1,
0.9114994, 0.05262545, 2.545397, 1, 1, 1, 1, 1,
0.912767, -0.4555019, 0.4979144, 1, 1, 1, 1, 1,
0.9131062, -0.4709065, 1.931065, 1, 1, 1, 1, 1,
0.9141808, 0.1064818, 0.6218865, 1, 1, 1, 1, 1,
0.919201, -0.3763949, 1.847384, 1, 1, 1, 1, 1,
0.9197339, 1.064209, 0.1940186, 1, 1, 1, 1, 1,
0.9201967, 1.305797, 0.06172078, 1, 1, 1, 1, 1,
0.9239867, 0.6950176, 1.338807, 1, 1, 1, 1, 1,
0.9258132, 0.7175115, 0.4663023, 1, 1, 1, 1, 1,
0.9312846, 1.130748, 1.002923, 1, 1, 1, 1, 1,
0.9330886, -0.5794189, 2.061137, 1, 1, 1, 1, 1,
0.9386339, 0.9760196, 0.07932207, 1, 1, 1, 1, 1,
0.9397007, 0.8969977, 0.5699317, 1, 1, 1, 1, 1,
0.9520285, 0.1130028, 0.4258618, 0, 0, 1, 1, 1,
0.9594749, -0.3134185, 1.254373, 1, 0, 0, 1, 1,
0.9595832, 1.645322, -0.006725261, 1, 0, 0, 1, 1,
0.9624289, -0.1944754, 1.440821, 1, 0, 0, 1, 1,
0.9634948, 0.5012874, 1.107358, 1, 0, 0, 1, 1,
0.9684809, -1.802794, 3.379116, 1, 0, 0, 1, 1,
0.9694061, -0.3382331, 1.957477, 0, 0, 0, 1, 1,
0.9781508, -0.01946172, 1.265383, 0, 0, 0, 1, 1,
0.9791923, 0.739679, 1.83268, 0, 0, 0, 1, 1,
0.9820457, -0.798836, 0.6985136, 0, 0, 0, 1, 1,
0.9831634, 2.131147, 0.754495, 0, 0, 0, 1, 1,
0.9909276, -0.6893667, 1.277016, 0, 0, 0, 1, 1,
0.9939406, -1.557416, 2.301926, 0, 0, 0, 1, 1,
0.9955417, -2.24131, 3.931453, 1, 1, 1, 1, 1,
1.007399, 0.2681095, 1.37506, 1, 1, 1, 1, 1,
1.010795, 0.3828223, 2.061886, 1, 1, 1, 1, 1,
1.011143, -0.1099622, 2.552895, 1, 1, 1, 1, 1,
1.024826, 0.1254362, 1.708037, 1, 1, 1, 1, 1,
1.026337, -0.1713582, 0.7954005, 1, 1, 1, 1, 1,
1.026448, 0.3308934, 0.1932378, 1, 1, 1, 1, 1,
1.027754, -2.053203, 1.076782, 1, 1, 1, 1, 1,
1.039222, 0.0692661, 1.847269, 1, 1, 1, 1, 1,
1.052958, -0.4577763, 4.041638, 1, 1, 1, 1, 1,
1.05317, -1.922787, 2.529549, 1, 1, 1, 1, 1,
1.055841, 0.8676081, 2.368291, 1, 1, 1, 1, 1,
1.058006, 0.3599443, 1.418959, 1, 1, 1, 1, 1,
1.059254, -0.6899238, 1.262278, 1, 1, 1, 1, 1,
1.0659, -0.005615519, 2.302031, 1, 1, 1, 1, 1,
1.067287, -0.09272819, 2.183866, 0, 0, 1, 1, 1,
1.070668, 0.6670318, 0.5464745, 1, 0, 0, 1, 1,
1.072472, 0.08366415, 2.191214, 1, 0, 0, 1, 1,
1.073619, -0.8096008, 2.774701, 1, 0, 0, 1, 1,
1.074207, 0.1757427, 1.867671, 1, 0, 0, 1, 1,
1.074929, -0.4912481, 3.040457, 1, 0, 0, 1, 1,
1.085058, -0.3394697, 3.361018, 0, 0, 0, 1, 1,
1.093068, -0.2953441, 3.377338, 0, 0, 0, 1, 1,
1.096779, 1.148688, -0.2591207, 0, 0, 0, 1, 1,
1.100179, 1.041192, 2.256078, 0, 0, 0, 1, 1,
1.104497, -0.5692748, 0.7343155, 0, 0, 0, 1, 1,
1.111038, -0.01082676, 1.562876, 0, 0, 0, 1, 1,
1.112172, -0.9669687, 1.504906, 0, 0, 0, 1, 1,
1.120359, 0.3363874, 1.418834, 1, 1, 1, 1, 1,
1.121275, 0.9110649, 2.006794, 1, 1, 1, 1, 1,
1.122272, 1.132912, 0.07450939, 1, 1, 1, 1, 1,
1.126324, 0.9337084, 0.1758763, 1, 1, 1, 1, 1,
1.131077, -0.1565998, 3.172838, 1, 1, 1, 1, 1,
1.137451, 0.2196886, 2.086345, 1, 1, 1, 1, 1,
1.149031, -0.1466567, -0.3431389, 1, 1, 1, 1, 1,
1.150229, 0.229068, 0.7891595, 1, 1, 1, 1, 1,
1.15042, 1.626523, -0.3880921, 1, 1, 1, 1, 1,
1.15073, -1.483301, 1.124676, 1, 1, 1, 1, 1,
1.151215, -1.334262, 0.3276409, 1, 1, 1, 1, 1,
1.153144, 0.7381712, 0.3096198, 1, 1, 1, 1, 1,
1.154677, 0.6333264, -1.153348, 1, 1, 1, 1, 1,
1.155713, -1.598163, 1.487926, 1, 1, 1, 1, 1,
1.157426, 0.4409192, 1.667774, 1, 1, 1, 1, 1,
1.160889, 1.099408, -1.489624, 0, 0, 1, 1, 1,
1.173339, 0.6783041, 0.3320339, 1, 0, 0, 1, 1,
1.175514, -0.2513802, 1.967202, 1, 0, 0, 1, 1,
1.178524, -0.499987, 1.608632, 1, 0, 0, 1, 1,
1.190911, 0.7366413, 1.304223, 1, 0, 0, 1, 1,
1.203908, 0.08204871, 0.9503694, 1, 0, 0, 1, 1,
1.204457, -0.8846128, 2.227041, 0, 0, 0, 1, 1,
1.215503, 1.220093, -0.04777356, 0, 0, 0, 1, 1,
1.228083, -1.973086, 3.128535, 0, 0, 0, 1, 1,
1.232696, 0.7300613, 1.898106, 0, 0, 0, 1, 1,
1.245975, -0.9367738, 1.385017, 0, 0, 0, 1, 1,
1.247929, -0.9178421, 3.020601, 0, 0, 0, 1, 1,
1.266191, 1.080885, -0.8405474, 0, 0, 0, 1, 1,
1.267193, 0.3869755, 1.595199, 1, 1, 1, 1, 1,
1.267535, -1.75755, 2.386423, 1, 1, 1, 1, 1,
1.268393, 1.049607, 2.89769, 1, 1, 1, 1, 1,
1.275432, 0.1246758, 1.86131, 1, 1, 1, 1, 1,
1.276262, -0.5538486, 3.692565, 1, 1, 1, 1, 1,
1.27812, -1.184304, 2.151232, 1, 1, 1, 1, 1,
1.289262, 0.3227859, 0.01504732, 1, 1, 1, 1, 1,
1.296937, -0.8443313, 4.277987, 1, 1, 1, 1, 1,
1.299432, 1.261953, 1.062104, 1, 1, 1, 1, 1,
1.303831, -0.5109363, 0.004203258, 1, 1, 1, 1, 1,
1.304203, 0.8162866, 1.412139, 1, 1, 1, 1, 1,
1.309934, 1.301132, -0.2712823, 1, 1, 1, 1, 1,
1.321673, -0.8970587, 2.167728, 1, 1, 1, 1, 1,
1.339973, -0.381905, 1.360485, 1, 1, 1, 1, 1,
1.352849, 0.6435857, 3.004144, 1, 1, 1, 1, 1,
1.359977, -0.4435172, 2.855785, 0, 0, 1, 1, 1,
1.367342, 1.793441, -0.8142864, 1, 0, 0, 1, 1,
1.367453, -0.7352228, 1.779738, 1, 0, 0, 1, 1,
1.369369, -0.2459488, 3.00907, 1, 0, 0, 1, 1,
1.3769, 0.4621333, 3.163158, 1, 0, 0, 1, 1,
1.378809, 0.1890137, 2.279338, 1, 0, 0, 1, 1,
1.380866, 0.3082525, 1.155278, 0, 0, 0, 1, 1,
1.391568, 0.2149239, 0.9153484, 0, 0, 0, 1, 1,
1.399407, -0.7947981, 0.317739, 0, 0, 0, 1, 1,
1.402877, -0.1702795, 2.143402, 0, 0, 0, 1, 1,
1.418545, 2.644391, 0.337212, 0, 0, 0, 1, 1,
1.435874, 0.3452266, 1.34099, 0, 0, 0, 1, 1,
1.436481, -0.9354831, 1.987951, 0, 0, 0, 1, 1,
1.45719, -0.01388946, 0.960045, 1, 1, 1, 1, 1,
1.461774, -1.436305, 4.060599, 1, 1, 1, 1, 1,
1.463685, -0.05204108, -0.5462323, 1, 1, 1, 1, 1,
1.471042, -0.03603893, 2.664175, 1, 1, 1, 1, 1,
1.478288, -1.755899, 2.495509, 1, 1, 1, 1, 1,
1.503538, 0.7940283, 1.234701, 1, 1, 1, 1, 1,
1.520407, -0.005532295, -0.9839621, 1, 1, 1, 1, 1,
1.525115, -1.052172, 2.270424, 1, 1, 1, 1, 1,
1.531946, 1.241578, 0.2520868, 1, 1, 1, 1, 1,
1.533249, -0.8105484, 3.493196, 1, 1, 1, 1, 1,
1.534273, 0.5618466, 0.1767295, 1, 1, 1, 1, 1,
1.539292, -0.6147588, 1.960883, 1, 1, 1, 1, 1,
1.539832, 0.1544309, 1.654361, 1, 1, 1, 1, 1,
1.54157, 0.2033111, 1.275219, 1, 1, 1, 1, 1,
1.54789, -0.4560062, 1.07535, 1, 1, 1, 1, 1,
1.548377, -1.534826, 2.627628, 0, 0, 1, 1, 1,
1.548888, -0.4032281, 0.8587973, 1, 0, 0, 1, 1,
1.556818, 0.1530236, 2.138562, 1, 0, 0, 1, 1,
1.556921, -0.1372632, 0.469867, 1, 0, 0, 1, 1,
1.58111, 1.257481, -0.9074927, 1, 0, 0, 1, 1,
1.582068, -1.343752, 4.140051, 1, 0, 0, 1, 1,
1.587175, 1.81031, 1.558301, 0, 0, 0, 1, 1,
1.588252, 0.1348585, 2.567028, 0, 0, 0, 1, 1,
1.592697, -1.249584, 1.146528, 0, 0, 0, 1, 1,
1.628588, 0.7442484, 2.369596, 0, 0, 0, 1, 1,
1.629838, 1.30169, 0.4479746, 0, 0, 0, 1, 1,
1.643082, -0.9101425, 1.188568, 0, 0, 0, 1, 1,
1.648473, -0.9695048, 1.907043, 0, 0, 0, 1, 1,
1.651996, -0.6946559, 1.760128, 1, 1, 1, 1, 1,
1.670932, -0.8828843, 1.667753, 1, 1, 1, 1, 1,
1.675815, -0.7975244, 0.4986691, 1, 1, 1, 1, 1,
1.677323, 0.7089171, 0.3586372, 1, 1, 1, 1, 1,
1.679372, -1.381629, 2.843502, 1, 1, 1, 1, 1,
1.693306, -0.280867, 1.596911, 1, 1, 1, 1, 1,
1.694027, -0.3060514, 2.068437, 1, 1, 1, 1, 1,
1.69607, 1.479331, 1.93705, 1, 1, 1, 1, 1,
1.706576, 0.8226918, 1.928836, 1, 1, 1, 1, 1,
1.710685, 0.9313792, 0.4081263, 1, 1, 1, 1, 1,
1.717397, -0.6249472, 1.465017, 1, 1, 1, 1, 1,
1.727719, 1.507009, 1.250043, 1, 1, 1, 1, 1,
1.729782, 0.1007894, 1.459908, 1, 1, 1, 1, 1,
1.730037, -0.574806, 2.010012, 1, 1, 1, 1, 1,
1.730964, -0.2831958, 0.2175366, 1, 1, 1, 1, 1,
1.731181, 0.5773671, 1.154192, 0, 0, 1, 1, 1,
1.749673, -1.123049, 2.296862, 1, 0, 0, 1, 1,
1.762115, 0.0878633, 1.231117, 1, 0, 0, 1, 1,
1.767078, -1.739278, 3.937208, 1, 0, 0, 1, 1,
1.767821, 0.083484, -0.3998703, 1, 0, 0, 1, 1,
1.777007, 0.7322267, 2.498997, 1, 0, 0, 1, 1,
1.779092, 1.656593, 0.5322584, 0, 0, 0, 1, 1,
1.784478, -0.3357399, 0.9869355, 0, 0, 0, 1, 1,
1.796667, -0.07091589, 1.095273, 0, 0, 0, 1, 1,
1.796987, -0.1715408, 0.9035407, 0, 0, 0, 1, 1,
1.797816, -2.115166, 1.601712, 0, 0, 0, 1, 1,
1.812783, -0.877947, 2.209276, 0, 0, 0, 1, 1,
1.813989, 0.9576957, -1.108636, 0, 0, 0, 1, 1,
1.820345, 0.8508936, 1.329301, 1, 1, 1, 1, 1,
1.862387, -0.9468535, 2.080879, 1, 1, 1, 1, 1,
1.87467, -1.700009, 2.90351, 1, 1, 1, 1, 1,
1.878895, -0.138458, 1.129401, 1, 1, 1, 1, 1,
1.883617, 0.4552328, 2.614311, 1, 1, 1, 1, 1,
1.890947, -1.063091, 2.255016, 1, 1, 1, 1, 1,
1.898168, -0.05224319, 1.889435, 1, 1, 1, 1, 1,
1.909196, -1.113094, 3.223031, 1, 1, 1, 1, 1,
1.954166, -0.2566719, 2.504349, 1, 1, 1, 1, 1,
1.956029, -0.5075818, 1.997841, 1, 1, 1, 1, 1,
1.977698, 1.644335, 1.563123, 1, 1, 1, 1, 1,
1.985771, -0.08354926, 1.488033, 1, 1, 1, 1, 1,
2.031566, -0.7084027, 0.2631243, 1, 1, 1, 1, 1,
2.054608, 0.6877238, -1.225094, 1, 1, 1, 1, 1,
2.070763, 0.2054367, 2.002289, 1, 1, 1, 1, 1,
2.079216, 1.158877, 1.076744, 0, 0, 1, 1, 1,
2.117874, 0.3512848, 0.9579576, 1, 0, 0, 1, 1,
2.137038, 0.8764536, 2.254177, 1, 0, 0, 1, 1,
2.140777, -0.6042331, 2.525267, 1, 0, 0, 1, 1,
2.165373, -1.652026, 2.142939, 1, 0, 0, 1, 1,
2.179243, -0.01780347, 1.236641, 1, 0, 0, 1, 1,
2.222722, 0.2655733, 2.245368, 0, 0, 0, 1, 1,
2.277355, -0.4532768, 3.192364, 0, 0, 0, 1, 1,
2.337908, -0.4349798, 1.163308, 0, 0, 0, 1, 1,
2.41523, 0.1598461, 1.544775, 0, 0, 0, 1, 1,
2.438781, 0.0225011, 1.133162, 0, 0, 0, 1, 1,
2.501872, 0.712245, -0.1806778, 0, 0, 0, 1, 1,
2.534987, -1.310015, 1.998349, 0, 0, 0, 1, 1,
2.552036, -1.350557, 2.194267, 1, 1, 1, 1, 1,
2.558277, -0.567001, 0.01820008, 1, 1, 1, 1, 1,
2.624661, -0.431156, 0.7194555, 1, 1, 1, 1, 1,
2.722801, 0.9645447, 1.153387, 1, 1, 1, 1, 1,
2.891378, 0.2176121, -0.3040448, 1, 1, 1, 1, 1,
3.110375, -1.908728, 0.9887866, 1, 1, 1, 1, 1,
3.37423, 0.2597405, 3.110748, 1, 1, 1, 1, 1
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
var radius = 9.395222;
var distance = 33.00032;
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
mvMatrix.translate( -0.007681847, -0.002068043, 0.2982264 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.00032);
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
