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
-3.077506, 0.1481953, 0.2539396, 1, 0, 0, 1,
-2.920171, -0.4842156, -2.275544, 1, 0.007843138, 0, 1,
-2.682231, 3.210091, 0.2217078, 1, 0.01176471, 0, 1,
-2.672856, -0.8881438, -3.028386, 1, 0.01960784, 0, 1,
-2.556802, -0.2249826, -3.677002, 1, 0.02352941, 0, 1,
-2.546982, -0.3800868, -0.4511894, 1, 0.03137255, 0, 1,
-2.425362, 0.04388115, -2.467121, 1, 0.03529412, 0, 1,
-2.397185, 2.121084, -0.1093955, 1, 0.04313726, 0, 1,
-2.377745, -0.2790391, -0.5427454, 1, 0.04705882, 0, 1,
-2.34925, -0.3842803, 0.7495742, 1, 0.05490196, 0, 1,
-2.272132, -0.4297805, -1.324757, 1, 0.05882353, 0, 1,
-2.260128, 1.019985, -1.128868, 1, 0.06666667, 0, 1,
-2.225899, 0.684306, -1.374024, 1, 0.07058824, 0, 1,
-2.195222, -0.6997321, -1.235216, 1, 0.07843138, 0, 1,
-2.190955, 0.2114373, -3.016043, 1, 0.08235294, 0, 1,
-2.167012, 0.8787187, -2.81614, 1, 0.09019608, 0, 1,
-2.134583, 0.002099054, -0.9728132, 1, 0.09411765, 0, 1,
-2.111674, -1.589708, -2.214933, 1, 0.1019608, 0, 1,
-2.10743, -0.97721, -1.443623, 1, 0.1098039, 0, 1,
-2.089959, -0.8511266, -1.593848, 1, 0.1137255, 0, 1,
-2.081962, 2.094513, -1.865263, 1, 0.1215686, 0, 1,
-2.043062, -0.8956142, -0.6658133, 1, 0.1254902, 0, 1,
-2.012376, 0.1146504, -1.071889, 1, 0.1333333, 0, 1,
-1.989511, -0.9847454, -2.064093, 1, 0.1372549, 0, 1,
-1.98761, 0.3187686, -0.7214399, 1, 0.145098, 0, 1,
-1.985781, 0.3681401, -2.402517, 1, 0.1490196, 0, 1,
-1.921465, -0.6547266, -1.936029, 1, 0.1568628, 0, 1,
-1.916678, -0.4675571, -1.125642, 1, 0.1607843, 0, 1,
-1.889182, 1.21414, -0.635151, 1, 0.1686275, 0, 1,
-1.885872, -0.2679179, -1.042731, 1, 0.172549, 0, 1,
-1.877424, 0.4171742, -2.161229, 1, 0.1803922, 0, 1,
-1.876511, -1.501251, -2.580173, 1, 0.1843137, 0, 1,
-1.87569, -0.128187, -1.144964, 1, 0.1921569, 0, 1,
-1.860361, -0.07117835, -1.54376, 1, 0.1960784, 0, 1,
-1.819486, 0.1486032, -3.236061, 1, 0.2039216, 0, 1,
-1.795474, -0.4766978, -3.102403, 1, 0.2117647, 0, 1,
-1.791635, 0.9682941, -1.648983, 1, 0.2156863, 0, 1,
-1.777237, 0.4005075, -2.672028, 1, 0.2235294, 0, 1,
-1.762557, 0.3437167, -1.109456, 1, 0.227451, 0, 1,
-1.759915, 0.0091513, -1.752776, 1, 0.2352941, 0, 1,
-1.730737, 0.9462351, -0.1936801, 1, 0.2392157, 0, 1,
-1.724042, -0.2039264, -2.286078, 1, 0.2470588, 0, 1,
-1.72259, -0.2929858, -2.30612, 1, 0.2509804, 0, 1,
-1.692317, -1.329815, -3.2155, 1, 0.2588235, 0, 1,
-1.672002, 1.073633, -1.24612, 1, 0.2627451, 0, 1,
-1.665755, -1.361334, -3.027481, 1, 0.2705882, 0, 1,
-1.662151, 0.824362, 0.03887477, 1, 0.2745098, 0, 1,
-1.632334, 0.07292642, -2.160912, 1, 0.282353, 0, 1,
-1.622321, 3.190142, -0.7858905, 1, 0.2862745, 0, 1,
-1.610534, 1.16041, -0.4532632, 1, 0.2941177, 0, 1,
-1.58579, 0.2750811, -1.050794, 1, 0.3019608, 0, 1,
-1.574017, -0.7225036, -0.4973411, 1, 0.3058824, 0, 1,
-1.571365, 0.9485286, -0.7710904, 1, 0.3137255, 0, 1,
-1.553477, -0.9790609, -3.802845, 1, 0.3176471, 0, 1,
-1.55224, -0.4412521, -2.849145, 1, 0.3254902, 0, 1,
-1.537074, -0.262012, -0.9137915, 1, 0.3294118, 0, 1,
-1.531786, -0.571205, -2.667239, 1, 0.3372549, 0, 1,
-1.530719, 2.011393, -0.3924132, 1, 0.3411765, 0, 1,
-1.528789, -0.7678153, -2.635725, 1, 0.3490196, 0, 1,
-1.507004, 0.4349016, -2.474711, 1, 0.3529412, 0, 1,
-1.496323, 1.027125, -1.947421, 1, 0.3607843, 0, 1,
-1.496321, 0.1467783, -1.759448, 1, 0.3647059, 0, 1,
-1.490141, -0.3846388, -2.784999, 1, 0.372549, 0, 1,
-1.486083, -0.1883132, -0.6597686, 1, 0.3764706, 0, 1,
-1.480315, -0.1598726, -4.191422, 1, 0.3843137, 0, 1,
-1.479384, 0.2120236, -2.276803, 1, 0.3882353, 0, 1,
-1.472458, 1.332272, 0.2635853, 1, 0.3960784, 0, 1,
-1.436916, -0.3398135, -0.6109138, 1, 0.4039216, 0, 1,
-1.436607, -1.836887, -3.117695, 1, 0.4078431, 0, 1,
-1.430066, 0.4160407, -2.560612, 1, 0.4156863, 0, 1,
-1.429795, 1.539414, -1.294168, 1, 0.4196078, 0, 1,
-1.428275, 0.8393294, 0.08579132, 1, 0.427451, 0, 1,
-1.427884, 0.01115036, -0.5394598, 1, 0.4313726, 0, 1,
-1.424883, 1.808652, -0.3858792, 1, 0.4392157, 0, 1,
-1.40686, -0.6517638, -1.033337, 1, 0.4431373, 0, 1,
-1.393703, 0.06435373, -2.727023, 1, 0.4509804, 0, 1,
-1.388787, -0.400723, -1.365471, 1, 0.454902, 0, 1,
-1.378349, -1.099634, -2.729843, 1, 0.4627451, 0, 1,
-1.375829, -1.328975, -1.352245, 1, 0.4666667, 0, 1,
-1.369305, -0.0526128, -0.2933261, 1, 0.4745098, 0, 1,
-1.366752, -1.4494, -2.977034, 1, 0.4784314, 0, 1,
-1.356603, -0.002199032, -2.311527, 1, 0.4862745, 0, 1,
-1.356405, -1.90684, -3.0565, 1, 0.4901961, 0, 1,
-1.352439, 0.3690172, -1.03835, 1, 0.4980392, 0, 1,
-1.352143, -0.7975869, -0.767615, 1, 0.5058824, 0, 1,
-1.332223, -2.366195, -2.205135, 1, 0.509804, 0, 1,
-1.32533, 0.4942726, -2.254969, 1, 0.5176471, 0, 1,
-1.323646, -1.320168, -2.27387, 1, 0.5215687, 0, 1,
-1.323494, 0.4032905, -1.886241, 1, 0.5294118, 0, 1,
-1.290601, 0.3298674, -1.829215, 1, 0.5333334, 0, 1,
-1.285436, 0.42707, -3.795979, 1, 0.5411765, 0, 1,
-1.282988, -0.5396355, -0.6069757, 1, 0.5450981, 0, 1,
-1.281453, -1.884623, -3.73232, 1, 0.5529412, 0, 1,
-1.27611, 0.9722464, 0.0225088, 1, 0.5568628, 0, 1,
-1.274006, -3.341097, -3.097208, 1, 0.5647059, 0, 1,
-1.270558, 0.7883137, -0.3234979, 1, 0.5686275, 0, 1,
-1.265094, 0.6662537, -1.309052, 1, 0.5764706, 0, 1,
-1.261789, -1.929905, -4.232017, 1, 0.5803922, 0, 1,
-1.244917, 1.009904, -2.362529, 1, 0.5882353, 0, 1,
-1.242344, -1.727868, -3.010533, 1, 0.5921569, 0, 1,
-1.234475, -0.2056909, -3.206297, 1, 0.6, 0, 1,
-1.23124, -0.1363403, -0.9949778, 1, 0.6078432, 0, 1,
-1.230649, 0.1402354, -0.894915, 1, 0.6117647, 0, 1,
-1.228608, 0.4846832, -0.2721367, 1, 0.6196079, 0, 1,
-1.225471, -0.8270062, -1.255821, 1, 0.6235294, 0, 1,
-1.218518, -0.6534385, -1.422456, 1, 0.6313726, 0, 1,
-1.214283, -0.6195673, -3.330788, 1, 0.6352941, 0, 1,
-1.212465, 1.188194, 0.05761532, 1, 0.6431373, 0, 1,
-1.210176, -1.148558, -2.327496, 1, 0.6470588, 0, 1,
-1.201251, 1.11036, -0.3943526, 1, 0.654902, 0, 1,
-1.196401, 0.8141973, 0.4151239, 1, 0.6588235, 0, 1,
-1.196325, 1.442183, 0.7555756, 1, 0.6666667, 0, 1,
-1.192562, -0.30283, -2.742014, 1, 0.6705883, 0, 1,
-1.191985, 1.090148, 0.2869281, 1, 0.6784314, 0, 1,
-1.191361, -0.09287868, -3.62544, 1, 0.682353, 0, 1,
-1.186245, 3.120103, 0.7107848, 1, 0.6901961, 0, 1,
-1.184433, 0.8102548, 0.6384409, 1, 0.6941177, 0, 1,
-1.183384, -0.4009241, -1.6666, 1, 0.7019608, 0, 1,
-1.181009, -0.4186229, -0.9578553, 1, 0.7098039, 0, 1,
-1.17906, 1.26142, -0.7916802, 1, 0.7137255, 0, 1,
-1.176682, -0.3134176, -0.6163992, 1, 0.7215686, 0, 1,
-1.175063, -0.210275, -1.389846, 1, 0.7254902, 0, 1,
-1.168342, 0.8876866, -0.7836471, 1, 0.7333333, 0, 1,
-1.165834, -0.4663872, -2.387762, 1, 0.7372549, 0, 1,
-1.159796, -0.1914783, -3.009621, 1, 0.7450981, 0, 1,
-1.156932, -0.2063162, -1.682514, 1, 0.7490196, 0, 1,
-1.149872, 1.221879, 0.3898711, 1, 0.7568628, 0, 1,
-1.144093, -0.5015039, 0.7503125, 1, 0.7607843, 0, 1,
-1.127032, 0.3768751, -2.093876, 1, 0.7686275, 0, 1,
-1.12698, -1.281079, -3.612742, 1, 0.772549, 0, 1,
-1.12662, 2.523068, -1.302642, 1, 0.7803922, 0, 1,
-1.120783, 0.5251454, -2.231373, 1, 0.7843137, 0, 1,
-1.120422, 1.132832, -1.543915, 1, 0.7921569, 0, 1,
-1.118361, 0.2041992, -0.3041469, 1, 0.7960784, 0, 1,
-1.118243, -1.428406, -3.037323, 1, 0.8039216, 0, 1,
-1.118026, -0.8853662, 0.3112117, 1, 0.8117647, 0, 1,
-1.108838, -0.2343898, -2.000599, 1, 0.8156863, 0, 1,
-1.095734, 0.2614124, -0.7385798, 1, 0.8235294, 0, 1,
-1.093653, 0.1683516, -2.75328, 1, 0.827451, 0, 1,
-1.087021, -1.500745, -1.421923, 1, 0.8352941, 0, 1,
-1.077349, 0.1136478, -2.812654, 1, 0.8392157, 0, 1,
-1.069628, 1.108007, -1.49355, 1, 0.8470588, 0, 1,
-1.069472, 0.309014, -1.717467, 1, 0.8509804, 0, 1,
-1.067789, 1.750825, 1.73741, 1, 0.8588235, 0, 1,
-1.053687, -1.91231, -3.265919, 1, 0.8627451, 0, 1,
-1.051784, -0.270867, -2.895594, 1, 0.8705882, 0, 1,
-1.051349, 0.3992329, -1.5322, 1, 0.8745098, 0, 1,
-1.049333, 0.05230806, -1.816304, 1, 0.8823529, 0, 1,
-1.048428, 0.6286012, -1.900364, 1, 0.8862745, 0, 1,
-1.042287, -0.7368989, -2.397308, 1, 0.8941177, 0, 1,
-1.038664, -0.8244382, -3.836939, 1, 0.8980392, 0, 1,
-1.031054, 0.501027, -0.9349747, 1, 0.9058824, 0, 1,
-1.02392, 0.3346021, -3.925853, 1, 0.9137255, 0, 1,
-1.009537, 0.6649849, -2.759395, 1, 0.9176471, 0, 1,
-1.007483, 0.7354117, 1.093493, 1, 0.9254902, 0, 1,
-1.007132, -0.2503039, -0.4064491, 1, 0.9294118, 0, 1,
-1.006231, -0.05221219, -1.375236, 1, 0.9372549, 0, 1,
-0.9988355, 0.2807173, -0.3942683, 1, 0.9411765, 0, 1,
-0.9988015, 0.5951148, -0.596672, 1, 0.9490196, 0, 1,
-0.9930619, 0.3537119, 0.002265555, 1, 0.9529412, 0, 1,
-0.9891267, 0.1486002, -2.08859, 1, 0.9607843, 0, 1,
-0.9810671, 0.6574567, -1.096606, 1, 0.9647059, 0, 1,
-0.9810157, -0.5575913, -1.798949, 1, 0.972549, 0, 1,
-0.973578, 0.7584029, -0.6968907, 1, 0.9764706, 0, 1,
-0.9717872, 0.3878013, -2.227552, 1, 0.9843137, 0, 1,
-0.967418, 1.014269, -2.415324, 1, 0.9882353, 0, 1,
-0.9640606, -0.9127331, -2.366056, 1, 0.9960784, 0, 1,
-0.963503, 0.3136806, -1.393945, 0.9960784, 1, 0, 1,
-0.9571762, -1.644813, -2.859253, 0.9921569, 1, 0, 1,
-0.9504429, 2.337527, -0.06851567, 0.9843137, 1, 0, 1,
-0.9486115, 0.7609821, -2.014456, 0.9803922, 1, 0, 1,
-0.9434133, -1.072589, 0.4323414, 0.972549, 1, 0, 1,
-0.9432733, -1.389482, -3.011306, 0.9686275, 1, 0, 1,
-0.9370514, -0.8236936, -1.411035, 0.9607843, 1, 0, 1,
-0.9296095, -0.6243602, -3.024365, 0.9568627, 1, 0, 1,
-0.9293436, 0.07944726, -0.9545473, 0.9490196, 1, 0, 1,
-0.9289502, -0.2563929, -3.562074, 0.945098, 1, 0, 1,
-0.9239752, -0.6344579, -2.127783, 0.9372549, 1, 0, 1,
-0.921434, -0.8546422, -1.598127, 0.9333333, 1, 0, 1,
-0.9210269, 0.163196, -0.7226254, 0.9254902, 1, 0, 1,
-0.9196903, -0.7288229, -2.809594, 0.9215686, 1, 0, 1,
-0.9073288, -0.4868493, -3.270713, 0.9137255, 1, 0, 1,
-0.9061402, 0.5537347, -0.07592692, 0.9098039, 1, 0, 1,
-0.9043242, 0.6044858, -2.789377, 0.9019608, 1, 0, 1,
-0.9038393, 0.7120377, -0.4173453, 0.8941177, 1, 0, 1,
-0.9008347, 0.3190689, -2.132088, 0.8901961, 1, 0, 1,
-0.8904213, 1.748067, 0.4885597, 0.8823529, 1, 0, 1,
-0.8900054, 0.6579534, -1.528503, 0.8784314, 1, 0, 1,
-0.8894879, -0.6152276, -2.822959, 0.8705882, 1, 0, 1,
-0.8863461, -1.07013, -3.720538, 0.8666667, 1, 0, 1,
-0.8862189, -0.7971768, -2.381451, 0.8588235, 1, 0, 1,
-0.8860333, -0.7451822, -4.2249, 0.854902, 1, 0, 1,
-0.8795015, -0.9736191, -2.732014, 0.8470588, 1, 0, 1,
-0.8759367, -0.779128, -2.002854, 0.8431373, 1, 0, 1,
-0.8644596, 0.7386471, 0.7008963, 0.8352941, 1, 0, 1,
-0.8633536, -2.423726, -2.748265, 0.8313726, 1, 0, 1,
-0.8632619, -0.1536246, -2.773052, 0.8235294, 1, 0, 1,
-0.8546491, -0.2597442, -1.078896, 0.8196079, 1, 0, 1,
-0.8503059, -0.6949255, -2.422751, 0.8117647, 1, 0, 1,
-0.8443629, -1.051625, -0.4841127, 0.8078431, 1, 0, 1,
-0.8379557, 0.9339847, -1.039045, 0.8, 1, 0, 1,
-0.837651, 1.355111, 0.8190433, 0.7921569, 1, 0, 1,
-0.8342751, 0.413561, 0.3807994, 0.7882353, 1, 0, 1,
-0.8320857, 0.6788375, 0.2367134, 0.7803922, 1, 0, 1,
-0.8285717, -0.6350331, -1.374367, 0.7764706, 1, 0, 1,
-0.8172886, 0.8238967, 0.8881298, 0.7686275, 1, 0, 1,
-0.8163319, 0.1457012, -1.724117, 0.7647059, 1, 0, 1,
-0.8124567, 0.9539329, -0.7574583, 0.7568628, 1, 0, 1,
-0.811244, -0.5155284, -3.53766, 0.7529412, 1, 0, 1,
-0.8098866, -1.053542, -0.9553023, 0.7450981, 1, 0, 1,
-0.8091142, -0.9965684, -1.066227, 0.7411765, 1, 0, 1,
-0.807814, 0.898952, -0.7785163, 0.7333333, 1, 0, 1,
-0.8007492, -0.8101906, -2.120882, 0.7294118, 1, 0, 1,
-0.7984532, 0.08783759, -1.670872, 0.7215686, 1, 0, 1,
-0.7976221, 0.4313788, -1.420868, 0.7176471, 1, 0, 1,
-0.7929069, -1.755492, -2.513361, 0.7098039, 1, 0, 1,
-0.7916006, 1.659431, -0.7778357, 0.7058824, 1, 0, 1,
-0.7806805, 0.5524495, 0.05610478, 0.6980392, 1, 0, 1,
-0.7744617, 0.8473276, -0.8369791, 0.6901961, 1, 0, 1,
-0.7692589, -1.087246, -1.198275, 0.6862745, 1, 0, 1,
-0.7691607, -0.8862447, -2.555251, 0.6784314, 1, 0, 1,
-0.7673367, -0.6968553, -0.2011275, 0.6745098, 1, 0, 1,
-0.7662386, -0.9737086, -2.091692, 0.6666667, 1, 0, 1,
-0.7549718, 0.7046145, -0.02429786, 0.6627451, 1, 0, 1,
-0.7483741, 1.064581, 0.1102535, 0.654902, 1, 0, 1,
-0.7480899, 1.035842, -1.642393, 0.6509804, 1, 0, 1,
-0.7470465, -0.2690223, -0.892842, 0.6431373, 1, 0, 1,
-0.7458949, -0.4590568, -1.813006, 0.6392157, 1, 0, 1,
-0.7426594, 2.813967, -0.8622364, 0.6313726, 1, 0, 1,
-0.737954, -0.8187373, -1.312357, 0.627451, 1, 0, 1,
-0.7370816, 0.8648168, -0.8185745, 0.6196079, 1, 0, 1,
-0.7350654, 0.06787225, -1.073309, 0.6156863, 1, 0, 1,
-0.7329841, 0.2904611, -0.5691341, 0.6078432, 1, 0, 1,
-0.7298059, 0.3444277, -0.01411867, 0.6039216, 1, 0, 1,
-0.7257067, -0.1632048, -0.5307004, 0.5960785, 1, 0, 1,
-0.7235032, -0.07121858, -2.850689, 0.5882353, 1, 0, 1,
-0.7132251, -0.7754305, -1.438999, 0.5843138, 1, 0, 1,
-0.7005705, 0.4568583, -2.35306, 0.5764706, 1, 0, 1,
-0.6976522, 0.5488148, 0.414051, 0.572549, 1, 0, 1,
-0.6950188, -1.619073, -3.674397, 0.5647059, 1, 0, 1,
-0.6942792, 1.436845, -1.651799, 0.5607843, 1, 0, 1,
-0.6825868, 0.3109848, 0.3611906, 0.5529412, 1, 0, 1,
-0.6814522, 0.6187582, -1.445088, 0.5490196, 1, 0, 1,
-0.6812955, -0.1109619, -1.118176, 0.5411765, 1, 0, 1,
-0.6745089, 1.092817, 0.3771536, 0.5372549, 1, 0, 1,
-0.6686335, 0.9366091, 0.1281763, 0.5294118, 1, 0, 1,
-0.6619312, 0.2252004, -0.2564225, 0.5254902, 1, 0, 1,
-0.6618839, -0.8689811, -2.722608, 0.5176471, 1, 0, 1,
-0.648154, 0.5752961, -0.4239444, 0.5137255, 1, 0, 1,
-0.646768, -0.5456453, -0.1148171, 0.5058824, 1, 0, 1,
-0.6463886, 0.06590876, -0.9643747, 0.5019608, 1, 0, 1,
-0.6440388, 0.04957573, -1.980374, 0.4941176, 1, 0, 1,
-0.643275, -1.65483, -1.803621, 0.4862745, 1, 0, 1,
-0.6384019, -0.3164724, -2.838085, 0.4823529, 1, 0, 1,
-0.6314701, -2.514037, -2.969543, 0.4745098, 1, 0, 1,
-0.6162178, 0.106901, -2.327769, 0.4705882, 1, 0, 1,
-0.6151103, -0.2627432, -2.767153, 0.4627451, 1, 0, 1,
-0.6149004, -0.9773762, -0.3685415, 0.4588235, 1, 0, 1,
-0.6116133, 0.9427822, -0.8426822, 0.4509804, 1, 0, 1,
-0.60988, 0.8940076, -0.515815, 0.4470588, 1, 0, 1,
-0.6028597, -0.5204279, -1.772564, 0.4392157, 1, 0, 1,
-0.5983236, -0.7285768, -3.701647, 0.4352941, 1, 0, 1,
-0.5968553, -0.2692167, -4.996012, 0.427451, 1, 0, 1,
-0.5961849, -0.2768513, -2.935878, 0.4235294, 1, 0, 1,
-0.5923743, 0.6380671, -0.1482012, 0.4156863, 1, 0, 1,
-0.5850531, -1.02497, -3.732092, 0.4117647, 1, 0, 1,
-0.5791675, -0.8721771, -2.510731, 0.4039216, 1, 0, 1,
-0.5785877, -1.337202, -2.010775, 0.3960784, 1, 0, 1,
-0.5738936, -0.6875225, -3.326286, 0.3921569, 1, 0, 1,
-0.5724454, 1.377741, 0.2606072, 0.3843137, 1, 0, 1,
-0.5718262, -1.050998, -2.570067, 0.3803922, 1, 0, 1,
-0.5682653, -1.22011, -3.454994, 0.372549, 1, 0, 1,
-0.5632579, -0.2417421, -1.885306, 0.3686275, 1, 0, 1,
-0.5629588, -0.7127528, -2.739202, 0.3607843, 1, 0, 1,
-0.5613303, 0.6042339, -1.339368, 0.3568628, 1, 0, 1,
-0.5593255, 0.9161013, -0.7481313, 0.3490196, 1, 0, 1,
-0.5592327, -0.7579431, -2.659278, 0.345098, 1, 0, 1,
-0.5577022, 0.4873464, -1.610791, 0.3372549, 1, 0, 1,
-0.5567621, -1.412014, -4.235055, 0.3333333, 1, 0, 1,
-0.5541225, -0.2047486, -3.549574, 0.3254902, 1, 0, 1,
-0.5520037, 0.1222337, -1.71339, 0.3215686, 1, 0, 1,
-0.550213, -0.4796855, -2.712704, 0.3137255, 1, 0, 1,
-0.5495471, 1.092651, 0.6198806, 0.3098039, 1, 0, 1,
-0.5486674, -0.5573956, 0.1479854, 0.3019608, 1, 0, 1,
-0.5429212, -0.5918675, -1.796125, 0.2941177, 1, 0, 1,
-0.5394587, 2.862289, 0.7204069, 0.2901961, 1, 0, 1,
-0.5392177, -0.7501543, -3.9355, 0.282353, 1, 0, 1,
-0.529856, 1.850892, -1.275609, 0.2784314, 1, 0, 1,
-0.5293496, 1.16146, -0.3214994, 0.2705882, 1, 0, 1,
-0.5276312, -0.8207014, -0.2991071, 0.2666667, 1, 0, 1,
-0.527342, 0.2121623, -0.8435001, 0.2588235, 1, 0, 1,
-0.5264518, -1.10012, -2.7787, 0.254902, 1, 0, 1,
-0.5256273, 0.6287776, 0.1059918, 0.2470588, 1, 0, 1,
-0.5226327, -0.2592927, -2.500723, 0.2431373, 1, 0, 1,
-0.5205103, -0.7070283, -1.960794, 0.2352941, 1, 0, 1,
-0.51792, 0.3979801, -1.279569, 0.2313726, 1, 0, 1,
-0.5171016, 0.6371832, -0.153036, 0.2235294, 1, 0, 1,
-0.5162434, -0.4782262, -3.950565, 0.2196078, 1, 0, 1,
-0.5159748, 0.7517349, 0.4197265, 0.2117647, 1, 0, 1,
-0.5132625, -1.005716, -2.440829, 0.2078431, 1, 0, 1,
-0.5103227, -1.52213, -2.670831, 0.2, 1, 0, 1,
-0.510092, 1.05787, 0.2549273, 0.1921569, 1, 0, 1,
-0.5097246, -0.01211615, -2.298692, 0.1882353, 1, 0, 1,
-0.5093838, -1.488591, -2.094573, 0.1803922, 1, 0, 1,
-0.5087324, 0.4001546, -1.886432, 0.1764706, 1, 0, 1,
-0.5082575, 1.9381, 0.2284012, 0.1686275, 1, 0, 1,
-0.5052102, -0.2168441, -2.598063, 0.1647059, 1, 0, 1,
-0.5035929, 0.02628557, -0.7352313, 0.1568628, 1, 0, 1,
-0.5028739, 2.22082, -1.50739, 0.1529412, 1, 0, 1,
-0.5001305, 0.04763487, -0.8747447, 0.145098, 1, 0, 1,
-0.4988201, -1.821998, -1.244575, 0.1411765, 1, 0, 1,
-0.4969163, 0.1941166, 0.7142032, 0.1333333, 1, 0, 1,
-0.4945569, -1.480306, -2.655301, 0.1294118, 1, 0, 1,
-0.4877256, 0.8282977, -1.380528, 0.1215686, 1, 0, 1,
-0.4865143, 0.5409151, -0.6759616, 0.1176471, 1, 0, 1,
-0.4854848, 0.7735453, -0.7620404, 0.1098039, 1, 0, 1,
-0.4854439, -0.3503935, -1.968882, 0.1058824, 1, 0, 1,
-0.4849302, 0.1317403, -0.5163977, 0.09803922, 1, 0, 1,
-0.4805273, -0.08184466, -1.276447, 0.09019608, 1, 0, 1,
-0.4778448, -0.7877503, -1.587488, 0.08627451, 1, 0, 1,
-0.4773486, 1.813966, 0.568985, 0.07843138, 1, 0, 1,
-0.4730644, 0.6548907, 0.8337096, 0.07450981, 1, 0, 1,
-0.4708766, 0.408316, -1.936581, 0.06666667, 1, 0, 1,
-0.4626946, -0.4890741, -2.908334, 0.0627451, 1, 0, 1,
-0.4620371, 0.1172255, 0.3911756, 0.05490196, 1, 0, 1,
-0.461567, 0.6374955, -0.08074164, 0.05098039, 1, 0, 1,
-0.4607822, 0.2881803, -0.2808507, 0.04313726, 1, 0, 1,
-0.4562, 0.8768058, 0.5937579, 0.03921569, 1, 0, 1,
-0.4531195, -0.4632739, -2.919862, 0.03137255, 1, 0, 1,
-0.4529444, 1.07523, -1.457855, 0.02745098, 1, 0, 1,
-0.4489493, -0.3413205, -3.684921, 0.01960784, 1, 0, 1,
-0.4440279, 2.795757, 1.122206, 0.01568628, 1, 0, 1,
-0.4435305, -0.5906261, -1.522962, 0.007843138, 1, 0, 1,
-0.4400794, 0.6570342, -0.7373379, 0.003921569, 1, 0, 1,
-0.4366047, -0.685362, -1.63656, 0, 1, 0.003921569, 1,
-0.435718, -1.542379, -2.806986, 0, 1, 0.01176471, 1,
-0.4349051, 0.03001072, -1.174364, 0, 1, 0.01568628, 1,
-0.4309935, 0.6820013, -1.829685, 0, 1, 0.02352941, 1,
-0.4275026, 1.291194, -1.432815, 0, 1, 0.02745098, 1,
-0.4265303, -0.5419105, -2.647086, 0, 1, 0.03529412, 1,
-0.4229737, 0.2351849, -0.7075551, 0, 1, 0.03921569, 1,
-0.4226576, 0.1829363, 0.8615405, 0, 1, 0.04705882, 1,
-0.4198694, 0.01556639, -0.05634614, 0, 1, 0.05098039, 1,
-0.4190826, -1.015827, -1.763076, 0, 1, 0.05882353, 1,
-0.4189073, 1.605724, 0.01768142, 0, 1, 0.0627451, 1,
-0.4127225, 0.9719573, -1.480029, 0, 1, 0.07058824, 1,
-0.4111046, 0.16806, -2.357688, 0, 1, 0.07450981, 1,
-0.4079539, 0.4911923, -1.721711, 0, 1, 0.08235294, 1,
-0.4065564, 0.8269446, -0.4640395, 0, 1, 0.08627451, 1,
-0.4046032, 1.331728, -1.543048, 0, 1, 0.09411765, 1,
-0.3973545, -1.702844, -2.204784, 0, 1, 0.1019608, 1,
-0.3969527, 1.307023, -0.144276, 0, 1, 0.1058824, 1,
-0.3962862, 0.05850333, -2.468553, 0, 1, 0.1137255, 1,
-0.3955901, -1.29514, -2.480545, 0, 1, 0.1176471, 1,
-0.3937334, 0.4345049, -1.723653, 0, 1, 0.1254902, 1,
-0.3918843, -0.9234591, -0.6600708, 0, 1, 0.1294118, 1,
-0.3901524, 0.04749554, -0.02408271, 0, 1, 0.1372549, 1,
-0.3843701, 1.042962, -0.3524077, 0, 1, 0.1411765, 1,
-0.383725, -0.9582267, -3.038578, 0, 1, 0.1490196, 1,
-0.3826838, 0.8474277, -0.1770457, 0, 1, 0.1529412, 1,
-0.3825994, 0.03857542, -0.6107983, 0, 1, 0.1607843, 1,
-0.3823668, -0.7563545, -3.401634, 0, 1, 0.1647059, 1,
-0.3811508, -0.2874237, -0.06835611, 0, 1, 0.172549, 1,
-0.3783943, 0.4019495, -0.3786551, 0, 1, 0.1764706, 1,
-0.3751898, 1.217445, -0.5307307, 0, 1, 0.1843137, 1,
-0.3745867, -1.144567, -2.295103, 0, 1, 0.1882353, 1,
-0.3739842, -0.7708264, -0.7439801, 0, 1, 0.1960784, 1,
-0.3727845, -1.060491, -2.993665, 0, 1, 0.2039216, 1,
-0.3601805, 1.003337, 0.2792327, 0, 1, 0.2078431, 1,
-0.3594274, -0.9416703, -3.016155, 0, 1, 0.2156863, 1,
-0.3541227, 0.3201135, -2.009953, 0, 1, 0.2196078, 1,
-0.3519996, 0.3387698, -1.993632, 0, 1, 0.227451, 1,
-0.3517036, 0.2447558, -0.885426, 0, 1, 0.2313726, 1,
-0.3515763, -0.2044473, -2.365098, 0, 1, 0.2392157, 1,
-0.3481801, -0.6536001, -2.071494, 0, 1, 0.2431373, 1,
-0.3436618, -0.8840104, -3.179001, 0, 1, 0.2509804, 1,
-0.3428898, 0.265894, -1.16239, 0, 1, 0.254902, 1,
-0.3427932, -0.04230339, -2.738324, 0, 1, 0.2627451, 1,
-0.3393494, -0.5664678, -3.079927, 0, 1, 0.2666667, 1,
-0.3312882, 0.09765382, -2.278974, 0, 1, 0.2745098, 1,
-0.3307565, 1.374693, -1.861991, 0, 1, 0.2784314, 1,
-0.3264811, -0.8173379, -1.922655, 0, 1, 0.2862745, 1,
-0.3242203, -0.2395135, -2.009878, 0, 1, 0.2901961, 1,
-0.3217273, -0.5676907, -3.329654, 0, 1, 0.2980392, 1,
-0.3204998, 0.9651747, 0.9801462, 0, 1, 0.3058824, 1,
-0.3186313, 1.951973, -1.034071, 0, 1, 0.3098039, 1,
-0.3164361, -1.563633, -4.678202, 0, 1, 0.3176471, 1,
-0.3105945, 1.148901, 0.4215283, 0, 1, 0.3215686, 1,
-0.3053775, -0.8315188, -1.862178, 0, 1, 0.3294118, 1,
-0.3021772, -0.8688471, -3.520042, 0, 1, 0.3333333, 1,
-0.3008885, 1.310401, -0.2108275, 0, 1, 0.3411765, 1,
-0.2962406, -2.027037, -2.584673, 0, 1, 0.345098, 1,
-0.2938045, 0.168403, -2.437834, 0, 1, 0.3529412, 1,
-0.2923591, 0.1773391, -1.509671, 0, 1, 0.3568628, 1,
-0.2911909, 0.6527969, -0.4249758, 0, 1, 0.3647059, 1,
-0.2895338, -1.146632, -3.637635, 0, 1, 0.3686275, 1,
-0.2889511, -1.546736, -2.808515, 0, 1, 0.3764706, 1,
-0.2868746, -0.3348938, -1.831801, 0, 1, 0.3803922, 1,
-0.2853928, 1.859324, 0.5083395, 0, 1, 0.3882353, 1,
-0.2809251, -0.1100005, -4.371053, 0, 1, 0.3921569, 1,
-0.2805023, -0.1924752, -1.010461, 0, 1, 0.4, 1,
-0.2790202, -0.3418729, -2.422879, 0, 1, 0.4078431, 1,
-0.2734834, -1.375422, -1.598411, 0, 1, 0.4117647, 1,
-0.2718383, -0.2050815, -1.940167, 0, 1, 0.4196078, 1,
-0.2707011, 0.4828027, -0.1372753, 0, 1, 0.4235294, 1,
-0.2694291, -0.3333351, -1.227381, 0, 1, 0.4313726, 1,
-0.2682357, -0.9103776, -1.622503, 0, 1, 0.4352941, 1,
-0.2574604, -0.5628983, -5.435524, 0, 1, 0.4431373, 1,
-0.2569, 0.2165854, -0.3840517, 0, 1, 0.4470588, 1,
-0.2430637, 0.6084318, -0.5509624, 0, 1, 0.454902, 1,
-0.2425808, 0.1251944, 0.8130724, 0, 1, 0.4588235, 1,
-0.24247, -1.723222, -2.065938, 0, 1, 0.4666667, 1,
-0.2412288, -0.9019161, -2.807108, 0, 1, 0.4705882, 1,
-0.2374355, 0.1778278, 0.5673432, 0, 1, 0.4784314, 1,
-0.2356133, -0.2945053, -3.675744, 0, 1, 0.4823529, 1,
-0.2325511, 0.2751416, -0.2297194, 0, 1, 0.4901961, 1,
-0.2324323, 1.882271, -0.1732049, 0, 1, 0.4941176, 1,
-0.2323265, -0.1786006, -2.461154, 0, 1, 0.5019608, 1,
-0.2318238, -1.244914, -2.9919, 0, 1, 0.509804, 1,
-0.2311159, 1.796246, 0.1349618, 0, 1, 0.5137255, 1,
-0.2296518, -0.7865712, -4.209012, 0, 1, 0.5215687, 1,
-0.2283367, -0.1049806, -1.595763, 0, 1, 0.5254902, 1,
-0.2259158, -0.6346629, -2.644759, 0, 1, 0.5333334, 1,
-0.2231924, -1.152526, -3.183947, 0, 1, 0.5372549, 1,
-0.2220634, -0.188995, 0.3110457, 0, 1, 0.5450981, 1,
-0.2217865, 0.03198748, -0.582033, 0, 1, 0.5490196, 1,
-0.2195818, -1.54641, -1.178017, 0, 1, 0.5568628, 1,
-0.2184522, -0.05549138, -1.790375, 0, 1, 0.5607843, 1,
-0.2182875, -0.2400718, -3.962396, 0, 1, 0.5686275, 1,
-0.218214, 0.2549716, -0.01899316, 0, 1, 0.572549, 1,
-0.2129679, -0.1836336, -2.160273, 0, 1, 0.5803922, 1,
-0.211704, -1.581015, -2.443457, 0, 1, 0.5843138, 1,
-0.2034981, 1.152583, 1.215437, 0, 1, 0.5921569, 1,
-0.2032901, 0.3418449, 0.4024361, 0, 1, 0.5960785, 1,
-0.1981047, -0.352679, -1.979983, 0, 1, 0.6039216, 1,
-0.1949856, -1.107631, -1.751849, 0, 1, 0.6117647, 1,
-0.193945, 0.06964144, -4.336755, 0, 1, 0.6156863, 1,
-0.1897407, 0.8293778, 0.1895207, 0, 1, 0.6235294, 1,
-0.1880026, 1.54704, 1.231729, 0, 1, 0.627451, 1,
-0.1839732, -0.6511298, -3.115847, 0, 1, 0.6352941, 1,
-0.1796252, -0.4992289, -2.093208, 0, 1, 0.6392157, 1,
-0.1759809, -0.6320723, -1.100782, 0, 1, 0.6470588, 1,
-0.1713115, 1.018793, 0.2068424, 0, 1, 0.6509804, 1,
-0.1701543, 0.6169741, -0.2733805, 0, 1, 0.6588235, 1,
-0.1697347, -0.2470604, -3.187654, 0, 1, 0.6627451, 1,
-0.1687096, 0.2352487, -1.273396, 0, 1, 0.6705883, 1,
-0.1544799, -0.138809, -1.760776, 0, 1, 0.6745098, 1,
-0.1538619, -0.4687046, -1.885472, 0, 1, 0.682353, 1,
-0.1538091, 0.08592071, -0.5257811, 0, 1, 0.6862745, 1,
-0.1525583, -0.865985, -1.274939, 0, 1, 0.6941177, 1,
-0.1502412, 0.03680481, -0.740205, 0, 1, 0.7019608, 1,
-0.1480028, -0.3165098, -1.54174, 0, 1, 0.7058824, 1,
-0.1462431, -1.150839, -1.702981, 0, 1, 0.7137255, 1,
-0.1452156, 0.4845878, -1.56178, 0, 1, 0.7176471, 1,
-0.1439902, 0.1434996, -0.1151195, 0, 1, 0.7254902, 1,
-0.1421711, 0.197925, 0.6986731, 0, 1, 0.7294118, 1,
-0.1413749, 1.849067, 0.7424148, 0, 1, 0.7372549, 1,
-0.1395234, 0.6024662, -1.085836, 0, 1, 0.7411765, 1,
-0.137604, 1.782679, -0.1459204, 0, 1, 0.7490196, 1,
-0.1326657, 0.03231996, -0.7945114, 0, 1, 0.7529412, 1,
-0.1321437, -0.6822005, -1.869925, 0, 1, 0.7607843, 1,
-0.129038, 0.4347366, 0.8178514, 0, 1, 0.7647059, 1,
-0.1276754, -0.1850844, -3.423553, 0, 1, 0.772549, 1,
-0.1267126, -0.5541317, -1.311397, 0, 1, 0.7764706, 1,
-0.1232049, 0.396888, 0.3044848, 0, 1, 0.7843137, 1,
-0.1203127, -0.4984813, -2.908915, 0, 1, 0.7882353, 1,
-0.1155336, -1.023297, -2.783602, 0, 1, 0.7960784, 1,
-0.1144549, 0.6003495, -1.476979, 0, 1, 0.8039216, 1,
-0.1113078, -1.10102, -2.070723, 0, 1, 0.8078431, 1,
-0.1063117, -0.7715944, -4.156363, 0, 1, 0.8156863, 1,
-0.1044726, 0.8068875, 0.5626596, 0, 1, 0.8196079, 1,
-0.1029326, 0.2001601, 0.5223041, 0, 1, 0.827451, 1,
-0.09938039, -0.4709307, -4.133785, 0, 1, 0.8313726, 1,
-0.09400562, 0.231565, 2.181589, 0, 1, 0.8392157, 1,
-0.09140962, -1.088611, -2.532791, 0, 1, 0.8431373, 1,
-0.0846711, -0.5004861, -2.043895, 0, 1, 0.8509804, 1,
-0.08262219, 0.2507097, -0.6328828, 0, 1, 0.854902, 1,
-0.0821316, -0.8910093, -4.160125, 0, 1, 0.8627451, 1,
-0.08169242, -0.1162896, -4.033904, 0, 1, 0.8666667, 1,
-0.07624893, 2.304288, 0.768645, 0, 1, 0.8745098, 1,
-0.07569266, 1.269714, 0.1213199, 0, 1, 0.8784314, 1,
-0.0750339, -1.362878, -3.633122, 0, 1, 0.8862745, 1,
-0.07389484, -0.3354673, -2.432714, 0, 1, 0.8901961, 1,
-0.07381852, 0.4318212, 2.925555, 0, 1, 0.8980392, 1,
-0.07191543, 0.06410766, -0.5859411, 0, 1, 0.9058824, 1,
-0.06975253, 0.07962468, -0.8123769, 0, 1, 0.9098039, 1,
-0.06695333, -0.03891297, 0.154122, 0, 1, 0.9176471, 1,
-0.06587141, 0.6520117, 0.09869491, 0, 1, 0.9215686, 1,
-0.06401831, 0.6420485, 0.1888569, 0, 1, 0.9294118, 1,
-0.06331128, 1.357522, 0.04780884, 0, 1, 0.9333333, 1,
-0.05488583, 0.8253125, -0.4897205, 0, 1, 0.9411765, 1,
-0.04846568, -0.7549834, -3.638797, 0, 1, 0.945098, 1,
-0.04711422, 0.3396463, -0.8628899, 0, 1, 0.9529412, 1,
-0.04651126, 0.05897462, -1.7103, 0, 1, 0.9568627, 1,
-0.04605661, 0.9303024, 0.7126767, 0, 1, 0.9647059, 1,
-0.04533143, 0.1234267, 1.181716, 0, 1, 0.9686275, 1,
-0.04494015, 0.6598253, -2.097935, 0, 1, 0.9764706, 1,
-0.04423303, 0.61458, 0.1598832, 0, 1, 0.9803922, 1,
-0.04291302, 0.5476231, -0.4695159, 0, 1, 0.9882353, 1,
-0.04248938, -0.4025167, -2.661548, 0, 1, 0.9921569, 1,
-0.04008061, -0.3319561, -2.155273, 0, 1, 1, 1,
-0.03740887, 0.7131307, -0.3565322, 0, 0.9921569, 1, 1,
-0.02865995, 0.1344909, 0.6939642, 0, 0.9882353, 1, 1,
-0.02332732, -0.4996098, -4.14759, 0, 0.9803922, 1, 1,
-0.0226994, 0.7383059, 0.2247916, 0, 0.9764706, 1, 1,
-0.02075384, 0.1393569, 0.3684103, 0, 0.9686275, 1, 1,
-0.0162475, -1.463802, -3.225382, 0, 0.9647059, 1, 1,
-0.01531241, -1.635564, -4.726238, 0, 0.9568627, 1, 1,
-0.01431038, -1.71431, -2.953648, 0, 0.9529412, 1, 1,
-0.01383827, 0.06283458, -0.02499564, 0, 0.945098, 1, 1,
-0.01255531, 0.1859268, -0.9859976, 0, 0.9411765, 1, 1,
-0.01164002, -1.546304, -2.257054, 0, 0.9333333, 1, 1,
-0.01057581, -0.9959123, -2.317451, 0, 0.9294118, 1, 1,
-0.01016131, 1.293671, -1.16356, 0, 0.9215686, 1, 1,
-0.00978218, -0.7146049, -1.845017, 0, 0.9176471, 1, 1,
-0.008485115, -1.923371, -2.98915, 0, 0.9098039, 1, 1,
-0.007119853, 0.8251446, -0.4524933, 0, 0.9058824, 1, 1,
-0.004231898, 0.5376968, 1.232391, 0, 0.8980392, 1, 1,
-0.003542044, 0.4631318, -1.825311, 0, 0.8901961, 1, 1,
-0.0006405148, -1.00255, -2.870454, 0, 0.8862745, 1, 1,
0.001708277, -0.2276726, 1.300582, 0, 0.8784314, 1, 1,
0.003710549, -0.005462029, 3.17264, 0, 0.8745098, 1, 1,
0.005400026, -1.51312, 4.759012, 0, 0.8666667, 1, 1,
0.01026458, 0.01129328, 1.622374, 0, 0.8627451, 1, 1,
0.0161254, 0.6846156, 0.9000374, 0, 0.854902, 1, 1,
0.01686781, -0.1518987, 1.81317, 0, 0.8509804, 1, 1,
0.01719736, 2.300949, 0.6215941, 0, 0.8431373, 1, 1,
0.0181885, -1.58498, 4.786135, 0, 0.8392157, 1, 1,
0.01846646, 1.569916, 1.218074, 0, 0.8313726, 1, 1,
0.01895088, 0.2071219, -0.09438016, 0, 0.827451, 1, 1,
0.02413323, 0.3062437, 0.2858759, 0, 0.8196079, 1, 1,
0.02473388, -1.415724, 2.360517, 0, 0.8156863, 1, 1,
0.02526447, -0.7127881, 4.314635, 0, 0.8078431, 1, 1,
0.028721, -0.0109565, 1.82871, 0, 0.8039216, 1, 1,
0.02955614, -1.275443, 3.476579, 0, 0.7960784, 1, 1,
0.03576022, -2.67169, 2.041529, 0, 0.7882353, 1, 1,
0.04298713, 0.2165081, -1.523906, 0, 0.7843137, 1, 1,
0.04532925, -0.186462, 0.4873521, 0, 0.7764706, 1, 1,
0.04591963, 0.9741934, 1.392889, 0, 0.772549, 1, 1,
0.05555553, 0.01582931, 0.9547677, 0, 0.7647059, 1, 1,
0.06149741, -0.2594258, 2.752238, 0, 0.7607843, 1, 1,
0.07264535, 0.1611616, -1.022232, 0, 0.7529412, 1, 1,
0.07539865, 0.4650548, 0.7828883, 0, 0.7490196, 1, 1,
0.07757597, -0.1130471, 4.655736, 0, 0.7411765, 1, 1,
0.0796257, -0.2163168, 4.662014, 0, 0.7372549, 1, 1,
0.08530318, -0.4532868, 1.864208, 0, 0.7294118, 1, 1,
0.08619343, 0.1055413, -0.5139709, 0, 0.7254902, 1, 1,
0.08775996, -1.371436, 4.57985, 0, 0.7176471, 1, 1,
0.08982848, -0.124919, 2.618694, 0, 0.7137255, 1, 1,
0.09564299, 1.240225, 0.1907542, 0, 0.7058824, 1, 1,
0.1020096, 1.169977, 1.409514, 0, 0.6980392, 1, 1,
0.1117874, 2.791334, -0.3809638, 0, 0.6941177, 1, 1,
0.1118513, -0.09661166, 3.544975, 0, 0.6862745, 1, 1,
0.1136291, -1.009122, 4.518233, 0, 0.682353, 1, 1,
0.113821, 1.49748, 0.312891, 0, 0.6745098, 1, 1,
0.1143929, 0.2753035, -0.1338925, 0, 0.6705883, 1, 1,
0.1154698, 0.235542, -1.253091, 0, 0.6627451, 1, 1,
0.1191775, 2.130569, -0.9806221, 0, 0.6588235, 1, 1,
0.1200096, -0.6597033, 3.44893, 0, 0.6509804, 1, 1,
0.1212287, -1.607391, 2.046938, 0, 0.6470588, 1, 1,
0.1277075, -1.454597, 2.732604, 0, 0.6392157, 1, 1,
0.1367804, -1.548488, 3.67964, 0, 0.6352941, 1, 1,
0.1393665, -1.061745, 3.19363, 0, 0.627451, 1, 1,
0.149506, 0.1984698, 0.36445, 0, 0.6235294, 1, 1,
0.1521305, -1.93449, 2.133061, 0, 0.6156863, 1, 1,
0.1522176, 0.4378096, 0.4142831, 0, 0.6117647, 1, 1,
0.1582641, -0.1540279, 3.293405, 0, 0.6039216, 1, 1,
0.1612364, 1.516181, -0.3644044, 0, 0.5960785, 1, 1,
0.1626737, 0.263751, 1.622835, 0, 0.5921569, 1, 1,
0.1628097, 0.1716833, 1.13293, 0, 0.5843138, 1, 1,
0.174021, 0.6138552, -2.56202, 0, 0.5803922, 1, 1,
0.177604, -0.3077022, 3.706621, 0, 0.572549, 1, 1,
0.180528, 0.2111441, 0.3396272, 0, 0.5686275, 1, 1,
0.1834743, -0.421561, -0.09513551, 0, 0.5607843, 1, 1,
0.1869188, -0.0997447, 1.303901, 0, 0.5568628, 1, 1,
0.1881682, -0.6655014, 3.981263, 0, 0.5490196, 1, 1,
0.1924637, 1.173056, -0.3833336, 0, 0.5450981, 1, 1,
0.193675, 1.083997, -0.06655128, 0, 0.5372549, 1, 1,
0.1942053, 1.168441, 0.6637714, 0, 0.5333334, 1, 1,
0.1979706, -0.9932477, 2.755186, 0, 0.5254902, 1, 1,
0.1991296, 0.001739386, 3.102252, 0, 0.5215687, 1, 1,
0.2011963, -1.229726, 2.6029, 0, 0.5137255, 1, 1,
0.2016899, -0.5987546, 1.65576, 0, 0.509804, 1, 1,
0.2157031, 1.691796, 0.4580029, 0, 0.5019608, 1, 1,
0.2184246, -1.925759, 3.178722, 0, 0.4941176, 1, 1,
0.2185571, 0.1162055, 0.5474918, 0, 0.4901961, 1, 1,
0.2192169, 0.3025392, -1.078599, 0, 0.4823529, 1, 1,
0.2192498, 0.07565649, 1.168905, 0, 0.4784314, 1, 1,
0.2192792, 1.983847, -0.1416525, 0, 0.4705882, 1, 1,
0.2242655, 0.1113119, 2.102706, 0, 0.4666667, 1, 1,
0.2305471, 1.514411, 1.193254, 0, 0.4588235, 1, 1,
0.2310312, -0.6094451, 1.376344, 0, 0.454902, 1, 1,
0.2311165, -0.1808413, 2.739432, 0, 0.4470588, 1, 1,
0.2365231, -1.070854, 4.048428, 0, 0.4431373, 1, 1,
0.2375856, -0.3390108, 2.885427, 0, 0.4352941, 1, 1,
0.2401237, -0.4334606, 2.891192, 0, 0.4313726, 1, 1,
0.2416236, 0.9819763, 1.433025, 0, 0.4235294, 1, 1,
0.2419321, 0.6565323, -0.3386313, 0, 0.4196078, 1, 1,
0.2460703, -0.5722961, 2.57054, 0, 0.4117647, 1, 1,
0.247576, -1.416633, 3.584716, 0, 0.4078431, 1, 1,
0.2477228, 0.6353375, 0.1636035, 0, 0.4, 1, 1,
0.2500596, 1.691832, 0.3553641, 0, 0.3921569, 1, 1,
0.2556463, -0.9195094, 1.953337, 0, 0.3882353, 1, 1,
0.2563761, 0.1616059, 0.5563474, 0, 0.3803922, 1, 1,
0.2581078, 1.271545, 1.081316, 0, 0.3764706, 1, 1,
0.2592005, 0.1551678, 1.948622, 0, 0.3686275, 1, 1,
0.264779, -2.183449, 4.221349, 0, 0.3647059, 1, 1,
0.2692537, -0.9276493, 2.329492, 0, 0.3568628, 1, 1,
0.270543, -2.128935, 2.918752, 0, 0.3529412, 1, 1,
0.2739165, -2.009554, 2.764229, 0, 0.345098, 1, 1,
0.2754501, 0.1487535, -0.6442388, 0, 0.3411765, 1, 1,
0.2810594, -1.327228, 3.49182, 0, 0.3333333, 1, 1,
0.2944925, 0.3172008, 0.8316671, 0, 0.3294118, 1, 1,
0.2949004, -1.260101, 3.11548, 0, 0.3215686, 1, 1,
0.2952887, 0.2905025, 0.3525732, 0, 0.3176471, 1, 1,
0.2974071, -1.643899, 2.995792, 0, 0.3098039, 1, 1,
0.3036869, -0.1375018, 2.770906, 0, 0.3058824, 1, 1,
0.3069538, -0.2048059, 0.9509123, 0, 0.2980392, 1, 1,
0.31025, -0.5031871, 4.53023, 0, 0.2901961, 1, 1,
0.3119963, 0.2737673, 1.204745, 0, 0.2862745, 1, 1,
0.3142136, -0.9152958, 3.20502, 0, 0.2784314, 1, 1,
0.3198638, 0.4203092, 0.7530872, 0, 0.2745098, 1, 1,
0.3276458, 0.1671817, 0.5168142, 0, 0.2666667, 1, 1,
0.3286234, 0.6497135, -0.2623545, 0, 0.2627451, 1, 1,
0.3311415, 0.004460006, 3.21814, 0, 0.254902, 1, 1,
0.3318926, 0.2249392, 1.810011, 0, 0.2509804, 1, 1,
0.3372328, 0.5689723, 1.331334, 0, 0.2431373, 1, 1,
0.3385954, 0.6923376, -0.1881294, 0, 0.2392157, 1, 1,
0.339436, 1.245269, -1.047202, 0, 0.2313726, 1, 1,
0.3397031, 0.9188778, -1.853599, 0, 0.227451, 1, 1,
0.3408161, 0.4430588, 1.718613, 0, 0.2196078, 1, 1,
0.3438576, -0.3194843, 3.309961, 0, 0.2156863, 1, 1,
0.3478087, -0.03673493, 1.658336, 0, 0.2078431, 1, 1,
0.3505625, -1.612999, 2.533831, 0, 0.2039216, 1, 1,
0.3520194, -2.497966, 3.168293, 0, 0.1960784, 1, 1,
0.3533638, -2.097434, 2.068867, 0, 0.1882353, 1, 1,
0.3551979, -0.1336354, 1.527584, 0, 0.1843137, 1, 1,
0.3615902, 0.3196406, 0.679965, 0, 0.1764706, 1, 1,
0.3671049, -0.04696152, 3.542745, 0, 0.172549, 1, 1,
0.3673055, 0.9887009, 0.5064322, 0, 0.1647059, 1, 1,
0.3684629, -0.619406, 2.99013, 0, 0.1607843, 1, 1,
0.3698291, 1.693363, -0.3275189, 0, 0.1529412, 1, 1,
0.3711706, -0.9272628, 2.539037, 0, 0.1490196, 1, 1,
0.381856, 0.6772493, -0.4776947, 0, 0.1411765, 1, 1,
0.3830614, -1.324474, 2.900307, 0, 0.1372549, 1, 1,
0.3952126, 0.6715585, 1.449974, 0, 0.1294118, 1, 1,
0.3978063, 1.135449, 0.02505351, 0, 0.1254902, 1, 1,
0.3982293, 0.6652638, 0.5163457, 0, 0.1176471, 1, 1,
0.3995646, -1.058257, 3.915093, 0, 0.1137255, 1, 1,
0.4026434, -0.03470002, 1.515689, 0, 0.1058824, 1, 1,
0.4069242, -1.809089, 1.968989, 0, 0.09803922, 1, 1,
0.4093889, -0.8128889, 2.429229, 0, 0.09411765, 1, 1,
0.4145297, -1.603494, 2.05918, 0, 0.08627451, 1, 1,
0.4154962, -1.449097, 2.780616, 0, 0.08235294, 1, 1,
0.4160435, 0.1764968, 1.204906, 0, 0.07450981, 1, 1,
0.4169085, 0.3943936, 0.234733, 0, 0.07058824, 1, 1,
0.4197811, 0.4771337, 1.818209, 0, 0.0627451, 1, 1,
0.4202301, 1.525143, 2.663103, 0, 0.05882353, 1, 1,
0.4204155, -0.0003479327, 1.193053, 0, 0.05098039, 1, 1,
0.4230577, -0.2283177, 2.604825, 0, 0.04705882, 1, 1,
0.4246645, 1.006439, 1.825352, 0, 0.03921569, 1, 1,
0.4271753, -0.075795, 0.8196193, 0, 0.03529412, 1, 1,
0.4291543, 0.3292776, 2.277565, 0, 0.02745098, 1, 1,
0.4354928, 0.938472, 0.09688311, 0, 0.02352941, 1, 1,
0.4368519, -0.6313891, 3.006508, 0, 0.01568628, 1, 1,
0.4386071, -1.900759, 2.826987, 0, 0.01176471, 1, 1,
0.439393, -0.3933744, 2.553768, 0, 0.003921569, 1, 1,
0.441916, -0.09365995, 2.610616, 0.003921569, 0, 1, 1,
0.4450336, 1.680553, -0.09308004, 0.007843138, 0, 1, 1,
0.4519801, 0.9106337, 0.8592616, 0.01568628, 0, 1, 1,
0.4523638, 0.7553791, 0.5389805, 0.01960784, 0, 1, 1,
0.4564106, -0.4779264, 2.874583, 0.02745098, 0, 1, 1,
0.4585405, 0.9573963, 2.484982, 0.03137255, 0, 1, 1,
0.4631924, -0.1453475, 2.161861, 0.03921569, 0, 1, 1,
0.4633487, 0.04204859, 2.711378, 0.04313726, 0, 1, 1,
0.4638504, -0.5399569, 3.266525, 0.05098039, 0, 1, 1,
0.4640425, -0.3358969, 2.145418, 0.05490196, 0, 1, 1,
0.4731399, 0.0151392, 0.7202221, 0.0627451, 0, 1, 1,
0.473192, -0.1346017, 2.336336, 0.06666667, 0, 1, 1,
0.4748979, 1.119378, 1.128462, 0.07450981, 0, 1, 1,
0.4762142, 0.53892, 1.07533, 0.07843138, 0, 1, 1,
0.4780355, -0.50383, 1.504094, 0.08627451, 0, 1, 1,
0.4819469, -0.2051548, 2.049823, 0.09019608, 0, 1, 1,
0.486564, 1.469607, 0.0776462, 0.09803922, 0, 1, 1,
0.4866061, -0.1403694, 2.429071, 0.1058824, 0, 1, 1,
0.4879129, -1.587109, 0.5749296, 0.1098039, 0, 1, 1,
0.4932738, -0.3286089, 1.262902, 0.1176471, 0, 1, 1,
0.497034, -0.4479389, 0.373841, 0.1215686, 0, 1, 1,
0.5003914, 1.990765, -0.2739697, 0.1294118, 0, 1, 1,
0.5012718, 1.388842, -0.1502637, 0.1333333, 0, 1, 1,
0.5017021, -0.4953563, 2.947199, 0.1411765, 0, 1, 1,
0.5034481, -0.250268, 2.75179, 0.145098, 0, 1, 1,
0.5073952, 1.523331, 1.631183, 0.1529412, 0, 1, 1,
0.5104997, 0.3501109, 1.849015, 0.1568628, 0, 1, 1,
0.5158247, -1.479992, 3.329668, 0.1647059, 0, 1, 1,
0.5205007, -0.245962, 2.293314, 0.1686275, 0, 1, 1,
0.5256151, -0.5629635, 2.290883, 0.1764706, 0, 1, 1,
0.527934, 0.5443272, 0.7869858, 0.1803922, 0, 1, 1,
0.5308986, 0.9589276, -0.4795477, 0.1882353, 0, 1, 1,
0.531863, -0.701681, 4.171707, 0.1921569, 0, 1, 1,
0.5327626, 0.2289908, 2.329804, 0.2, 0, 1, 1,
0.5330507, 1.154993, -0.8909398, 0.2078431, 0, 1, 1,
0.5339392, -0.1618423, 2.145508, 0.2117647, 0, 1, 1,
0.5346965, -0.2174522, 0.6643562, 0.2196078, 0, 1, 1,
0.543552, 0.7612174, -0.137896, 0.2235294, 0, 1, 1,
0.5446062, 0.1408112, 0.2268266, 0.2313726, 0, 1, 1,
0.5492133, -1.505387, 2.602293, 0.2352941, 0, 1, 1,
0.5508132, 0.414919, 0.3986807, 0.2431373, 0, 1, 1,
0.5512915, 0.2732852, 0.9691771, 0.2470588, 0, 1, 1,
0.5524327, -1.544258, 4.216073, 0.254902, 0, 1, 1,
0.5536369, 0.5526648, 1.983648, 0.2588235, 0, 1, 1,
0.558466, -0.3836766, 1.093388, 0.2666667, 0, 1, 1,
0.5590474, 0.1030858, 1.318582, 0.2705882, 0, 1, 1,
0.5684642, 0.2874506, 1.399813, 0.2784314, 0, 1, 1,
0.5698177, -1.731493, 1.473875, 0.282353, 0, 1, 1,
0.5700102, 0.3003128, -0.4968883, 0.2901961, 0, 1, 1,
0.5755575, 0.1716716, 2.129355, 0.2941177, 0, 1, 1,
0.5775254, -0.08898059, 1.273813, 0.3019608, 0, 1, 1,
0.5776951, -1.424788, 2.795131, 0.3098039, 0, 1, 1,
0.5821687, 0.9277235, 0.4544243, 0.3137255, 0, 1, 1,
0.5828858, -0.4167303, 2.61186, 0.3215686, 0, 1, 1,
0.5844296, 0.1098017, 1.115041, 0.3254902, 0, 1, 1,
0.590987, 0.2926276, 2.013181, 0.3333333, 0, 1, 1,
0.5940405, -0.0752359, 1.739803, 0.3372549, 0, 1, 1,
0.594654, -0.8577991, 3.921591, 0.345098, 0, 1, 1,
0.5986127, 0.6036677, 0.6013126, 0.3490196, 0, 1, 1,
0.6034338, 1.21481, 0.1876695, 0.3568628, 0, 1, 1,
0.6065295, -1.40488, 2.265349, 0.3607843, 0, 1, 1,
0.607402, -0.06490713, 1.451639, 0.3686275, 0, 1, 1,
0.6117083, -0.8041664, 1.727552, 0.372549, 0, 1, 1,
0.6119248, 0.00249339, 1.95246, 0.3803922, 0, 1, 1,
0.6221951, 0.5639397, 1.88525, 0.3843137, 0, 1, 1,
0.622781, 0.815363, 0.2604282, 0.3921569, 0, 1, 1,
0.6269821, 0.4346018, 0.5536844, 0.3960784, 0, 1, 1,
0.6273585, -1.128565, 3.775279, 0.4039216, 0, 1, 1,
0.6309541, 0.3661992, 1.485618, 0.4117647, 0, 1, 1,
0.6349799, -1.514324, 1.326575, 0.4156863, 0, 1, 1,
0.6416937, -0.4820046, 3.581153, 0.4235294, 0, 1, 1,
0.6450698, 2.00951, 1.134535, 0.427451, 0, 1, 1,
0.6537054, -0.135806, -0.02282977, 0.4352941, 0, 1, 1,
0.6618567, 0.5628354, -1.008703, 0.4392157, 0, 1, 1,
0.6632513, -0.1313754, 4.170278, 0.4470588, 0, 1, 1,
0.6661482, 0.5278257, 1.140984, 0.4509804, 0, 1, 1,
0.6720144, 2.40242, 1.611125, 0.4588235, 0, 1, 1,
0.6779001, 0.1683329, -0.4970513, 0.4627451, 0, 1, 1,
0.6822035, 1.429275, 1.360152, 0.4705882, 0, 1, 1,
0.6823546, 0.346019, 0.7336206, 0.4745098, 0, 1, 1,
0.6835846, -0.6162763, 0.7971374, 0.4823529, 0, 1, 1,
0.6844281, -1.345883, 3.882612, 0.4862745, 0, 1, 1,
0.694781, -1.30543, 3.482393, 0.4941176, 0, 1, 1,
0.6968355, -0.780782, 2.895215, 0.5019608, 0, 1, 1,
0.6995212, 0.5283121, 1.094047, 0.5058824, 0, 1, 1,
0.7021037, -0.6560159, 2.54567, 0.5137255, 0, 1, 1,
0.7048791, -1.1362, 1.983565, 0.5176471, 0, 1, 1,
0.7056406, 0.3741908, 0.6719574, 0.5254902, 0, 1, 1,
0.708131, 0.4093576, -0.006707702, 0.5294118, 0, 1, 1,
0.7140874, 0.1840055, 2.010978, 0.5372549, 0, 1, 1,
0.7180986, 1.035225, 1.980962, 0.5411765, 0, 1, 1,
0.719935, -0.2809712, 0.3250416, 0.5490196, 0, 1, 1,
0.7228038, 0.5595125, -0.06217882, 0.5529412, 0, 1, 1,
0.7282361, 0.2934675, 0.1825623, 0.5607843, 0, 1, 1,
0.7291088, 0.2969095, -0.7583086, 0.5647059, 0, 1, 1,
0.7323495, 0.1143549, 1.727297, 0.572549, 0, 1, 1,
0.7330103, 1.715562, 1.52741, 0.5764706, 0, 1, 1,
0.7351111, 1.331309, 0.8186256, 0.5843138, 0, 1, 1,
0.7374765, -0.1473705, 2.780907, 0.5882353, 0, 1, 1,
0.7404986, 1.637548, 0.4681583, 0.5960785, 0, 1, 1,
0.7410679, 1.000345, 0.8993504, 0.6039216, 0, 1, 1,
0.7461938, 0.6246456, 0.9665939, 0.6078432, 0, 1, 1,
0.7466949, 0.1916683, 0.4727769, 0.6156863, 0, 1, 1,
0.7489028, -1.204149, 3.307418, 0.6196079, 0, 1, 1,
0.7527457, -0.260375, 2.868062, 0.627451, 0, 1, 1,
0.7553563, 0.4327092, 1.045224, 0.6313726, 0, 1, 1,
0.7555532, -0.9210629, 0.850336, 0.6392157, 0, 1, 1,
0.7555781, 1.957163, 0.3569979, 0.6431373, 0, 1, 1,
0.7583524, -0.3742347, 3.345731, 0.6509804, 0, 1, 1,
0.7613726, 0.8370989, 1.311978, 0.654902, 0, 1, 1,
0.7613904, -1.140901, 4.836789, 0.6627451, 0, 1, 1,
0.7630215, -0.4992938, 3.376128, 0.6666667, 0, 1, 1,
0.7631991, 0.8171324, 1.629534, 0.6745098, 0, 1, 1,
0.7705937, 0.7466729, 0.6932206, 0.6784314, 0, 1, 1,
0.7789975, -0.184352, 0.7264996, 0.6862745, 0, 1, 1,
0.7809253, 0.3829807, -0.354743, 0.6901961, 0, 1, 1,
0.790966, 0.7627647, 0.5055099, 0.6980392, 0, 1, 1,
0.7963774, 0.8422913, 0.4016451, 0.7058824, 0, 1, 1,
0.8026271, 0.362233, 0.7629491, 0.7098039, 0, 1, 1,
0.8045271, 0.09782699, 1.574526, 0.7176471, 0, 1, 1,
0.8046913, 0.7356479, 0.4885153, 0.7215686, 0, 1, 1,
0.8066176, 0.5360169, -0.2585382, 0.7294118, 0, 1, 1,
0.8135363, 0.0900291, 1.402392, 0.7333333, 0, 1, 1,
0.8174155, 1.568005, 0.7259002, 0.7411765, 0, 1, 1,
0.8178222, 0.1685717, -0.5963583, 0.7450981, 0, 1, 1,
0.8199651, -0.5864094, 3.447029, 0.7529412, 0, 1, 1,
0.8216604, 1.010476, -0.1262522, 0.7568628, 0, 1, 1,
0.8228771, -0.7570953, 1.877436, 0.7647059, 0, 1, 1,
0.8290393, 0.5162988, 0.3778899, 0.7686275, 0, 1, 1,
0.8323572, 0.7261947, -0.0003807811, 0.7764706, 0, 1, 1,
0.8386042, 0.5863309, -0.3954727, 0.7803922, 0, 1, 1,
0.8438458, -0.2527612, 1.97264, 0.7882353, 0, 1, 1,
0.8454114, -1.531333, 3.0037, 0.7921569, 0, 1, 1,
0.8461687, 0.05484251, 2.080834, 0.8, 0, 1, 1,
0.8473893, 0.1567268, 0.483773, 0.8078431, 0, 1, 1,
0.849642, 1.504823, -1.759992, 0.8117647, 0, 1, 1,
0.8599299, 0.8204687, 0.4372958, 0.8196079, 0, 1, 1,
0.8600349, -1.126336, 2.786111, 0.8235294, 0, 1, 1,
0.8643406, 0.4554685, -0.02734803, 0.8313726, 0, 1, 1,
0.8696647, 0.7734123, 2.486546, 0.8352941, 0, 1, 1,
0.8735178, -0.2813832, 0.921238, 0.8431373, 0, 1, 1,
0.8770538, -0.8459169, 1.60512, 0.8470588, 0, 1, 1,
0.8783092, -0.684112, 0.9858308, 0.854902, 0, 1, 1,
0.8818856, 0.2120136, 0.4490496, 0.8588235, 0, 1, 1,
0.8855329, -1.951205, 1.549431, 0.8666667, 0, 1, 1,
0.8896616, -0.3717431, 2.50953, 0.8705882, 0, 1, 1,
0.8949536, 0.760035, 0.5763671, 0.8784314, 0, 1, 1,
0.8962884, -0.863791, 2.536757, 0.8823529, 0, 1, 1,
0.8965249, 0.5102761, 2.418034, 0.8901961, 0, 1, 1,
0.8985012, -1.060511, 2.204956, 0.8941177, 0, 1, 1,
0.8996412, 0.1003526, 1.126895, 0.9019608, 0, 1, 1,
0.9006113, -0.4420348, 3.564068, 0.9098039, 0, 1, 1,
0.9030649, -0.0917088, 3.150764, 0.9137255, 0, 1, 1,
0.9046516, -0.6909973, 3.352155, 0.9215686, 0, 1, 1,
0.905041, -0.330265, 1.304988, 0.9254902, 0, 1, 1,
0.9069484, -2.177531, 2.537299, 0.9333333, 0, 1, 1,
0.9083879, 0.5886968, 3.119045, 0.9372549, 0, 1, 1,
0.9159474, -1.015618, 3.836966, 0.945098, 0, 1, 1,
0.9213712, -1.185586, 1.550135, 0.9490196, 0, 1, 1,
0.9220556, 1.623924, 0.6073548, 0.9568627, 0, 1, 1,
0.9249727, 1.239473, 1.752214, 0.9607843, 0, 1, 1,
0.9256727, 0.2002058, 2.945632, 0.9686275, 0, 1, 1,
0.9276577, -0.2244566, 1.797989, 0.972549, 0, 1, 1,
0.9285189, -0.5296617, 2.652743, 0.9803922, 0, 1, 1,
0.9321953, 0.510443, 0.6126402, 0.9843137, 0, 1, 1,
0.9341892, 0.8115972, 0.306771, 0.9921569, 0, 1, 1,
0.9352415, 0.2235497, 1.172079, 0.9960784, 0, 1, 1,
0.9383295, -1.445216, 4.368154, 1, 0, 0.9960784, 1,
0.9423678, 1.223609, -1.920847, 1, 0, 0.9882353, 1,
0.9434751, 1.766686, 0.222407, 1, 0, 0.9843137, 1,
0.947953, 0.08182509, 2.495766, 1, 0, 0.9764706, 1,
0.9484513, 0.5179185, -0.04472081, 1, 0, 0.972549, 1,
0.9496494, -0.8753609, 1.241307, 1, 0, 0.9647059, 1,
0.949945, -0.2104828, 1.66179, 1, 0, 0.9607843, 1,
0.9526018, 0.2279856, 2.207148, 1, 0, 0.9529412, 1,
0.9572846, -0.01463578, 0.7604861, 1, 0, 0.9490196, 1,
0.9599723, -0.1082954, 0.8378755, 1, 0, 0.9411765, 1,
0.9676235, 1.937294, 1.319755, 1, 0, 0.9372549, 1,
0.967887, 1.816069, -0.8132688, 1, 0, 0.9294118, 1,
0.9686059, -1.658082, 1.80174, 1, 0, 0.9254902, 1,
0.9699565, -0.7309335, 2.277624, 1, 0, 0.9176471, 1,
0.9717615, -0.9432941, 3.094285, 1, 0, 0.9137255, 1,
0.9756441, -0.6904545, 2.808527, 1, 0, 0.9058824, 1,
0.976187, -0.3670517, 1.780455, 1, 0, 0.9019608, 1,
0.9776365, 1.488087, 0.7065675, 1, 0, 0.8941177, 1,
0.9802239, 0.6385366, 0.5064796, 1, 0, 0.8862745, 1,
0.9817899, 0.5104738, 1.527125, 1, 0, 0.8823529, 1,
0.9851565, -0.0329041, 2.896893, 1, 0, 0.8745098, 1,
0.988263, 0.02195475, 2.737665, 1, 0, 0.8705882, 1,
1.002777, -0.5545568, 2.940033, 1, 0, 0.8627451, 1,
1.00285, -0.3371194, 1.923478, 1, 0, 0.8588235, 1,
1.010453, -0.4382152, 0.5006667, 1, 0, 0.8509804, 1,
1.014116, 0.5075107, 2.082823, 1, 0, 0.8470588, 1,
1.018738, -1.401149, 1.170928, 1, 0, 0.8392157, 1,
1.020376, -0.3143491, 0.5648647, 1, 0, 0.8352941, 1,
1.02167, 0.9069591, -0.1094527, 1, 0, 0.827451, 1,
1.022104, 1.574993, 0.09403002, 1, 0, 0.8235294, 1,
1.042289, 0.7673963, 2.872105, 1, 0, 0.8156863, 1,
1.046488, -0.3599137, 1.837878, 1, 0, 0.8117647, 1,
1.053128, -0.4546221, 4.187747, 1, 0, 0.8039216, 1,
1.05399, -1.163781, 1.731017, 1, 0, 0.7960784, 1,
1.066428, -0.3422889, 1.878438, 1, 0, 0.7921569, 1,
1.070593, -0.1462779, 1.950384, 1, 0, 0.7843137, 1,
1.074448, 0.2324513, 1.752147, 1, 0, 0.7803922, 1,
1.080259, -0.04555194, 1.450254, 1, 0, 0.772549, 1,
1.083748, 0.3439927, 2.478657, 1, 0, 0.7686275, 1,
1.089892, 0.1420794, 2.0646, 1, 0, 0.7607843, 1,
1.092306, 0.9060508, -1.405639, 1, 0, 0.7568628, 1,
1.097595, 1.266718, 0.295239, 1, 0, 0.7490196, 1,
1.098091, 0.4228427, 0.4951411, 1, 0, 0.7450981, 1,
1.106941, 1.383067, -1.052832, 1, 0, 0.7372549, 1,
1.107613, 1.170292, 1.107533, 1, 0, 0.7333333, 1,
1.107665, -0.5665157, 1.425343, 1, 0, 0.7254902, 1,
1.112538, 0.5226993, 1.224026, 1, 0, 0.7215686, 1,
1.116122, 0.5993404, 1.421832, 1, 0, 0.7137255, 1,
1.127746, -0.1777115, 2.486944, 1, 0, 0.7098039, 1,
1.128038, 0.408702, -0.1103634, 1, 0, 0.7019608, 1,
1.152817, 0.8485971, 0.292368, 1, 0, 0.6941177, 1,
1.153589, -0.9996319, 0.6120899, 1, 0, 0.6901961, 1,
1.158132, 0.3908049, 1.65046, 1, 0, 0.682353, 1,
1.166615, -0.6089849, 2.65511, 1, 0, 0.6784314, 1,
1.16878, -1.46574, 2.534041, 1, 0, 0.6705883, 1,
1.188476, -0.5823481, 1.981117, 1, 0, 0.6666667, 1,
1.192163, 1.102132, -0.4807179, 1, 0, 0.6588235, 1,
1.192805, 0.4712518, 0.8287314, 1, 0, 0.654902, 1,
1.194145, -0.6003748, 3.040078, 1, 0, 0.6470588, 1,
1.19478, 0.7020665, 1.247458, 1, 0, 0.6431373, 1,
1.197647, -0.8552235, 2.532863, 1, 0, 0.6352941, 1,
1.199036, 1.403096, -0.85487, 1, 0, 0.6313726, 1,
1.210179, -0.4271167, 2.243695, 1, 0, 0.6235294, 1,
1.215246, 1.463275, -1.273115, 1, 0, 0.6196079, 1,
1.236835, 0.4130788, 0.9810281, 1, 0, 0.6117647, 1,
1.240008, -0.9304163, 3.830899, 1, 0, 0.6078432, 1,
1.240302, -0.9474502, 0.7276239, 1, 0, 0.6, 1,
1.245378, -0.4559122, 2.588522, 1, 0, 0.5921569, 1,
1.24908, 1.630245, 1.381479, 1, 0, 0.5882353, 1,
1.250664, 0.3078735, 0.8589736, 1, 0, 0.5803922, 1,
1.253634, -0.7471408, 3.240133, 1, 0, 0.5764706, 1,
1.253775, 1.192095, 0.4747185, 1, 0, 0.5686275, 1,
1.255518, 0.383976, 1.899545, 1, 0, 0.5647059, 1,
1.257347, 1.034768, 0.4378762, 1, 0, 0.5568628, 1,
1.26077, -2.200261, 3.499753, 1, 0, 0.5529412, 1,
1.263957, 0.3045924, 0.3806228, 1, 0, 0.5450981, 1,
1.266856, 1.348256, -0.1727169, 1, 0, 0.5411765, 1,
1.280375, -0.0900855, 2.614382, 1, 0, 0.5333334, 1,
1.283017, -1.11218, 1.109467, 1, 0, 0.5294118, 1,
1.285733, 1.488376, -0.5308155, 1, 0, 0.5215687, 1,
1.287518, -0.3999719, 1.640885, 1, 0, 0.5176471, 1,
1.289434, -0.7441697, 2.918413, 1, 0, 0.509804, 1,
1.291481, 0.8460317, 3.233067, 1, 0, 0.5058824, 1,
1.318604, -0.5013595, 1.907363, 1, 0, 0.4980392, 1,
1.318838, -0.2864055, 2.030005, 1, 0, 0.4901961, 1,
1.318927, -1.976535, 2.64282, 1, 0, 0.4862745, 1,
1.321883, -0.1234657, 2.607737, 1, 0, 0.4784314, 1,
1.336737, -0.745774, 2.158146, 1, 0, 0.4745098, 1,
1.337253, -2.534486, 2.851124, 1, 0, 0.4666667, 1,
1.338878, -0.02653557, 1.168008, 1, 0, 0.4627451, 1,
1.362299, -1.370632, 2.421208, 1, 0, 0.454902, 1,
1.374777, 0.6016431, 2.204683, 1, 0, 0.4509804, 1,
1.375708, -0.03635086, 2.699938, 1, 0, 0.4431373, 1,
1.383418, -0.9621807, 2.030661, 1, 0, 0.4392157, 1,
1.401199, 1.762015, 1.767345, 1, 0, 0.4313726, 1,
1.409184, 0.1799399, 2.876412, 1, 0, 0.427451, 1,
1.416219, -0.7126195, 2.85881, 1, 0, 0.4196078, 1,
1.41622, -1.199281, 2.058074, 1, 0, 0.4156863, 1,
1.429866, -0.5411442, 3.439109, 1, 0, 0.4078431, 1,
1.443952, -0.4676697, 3.781023, 1, 0, 0.4039216, 1,
1.462921, 0.3423015, 2.206612, 1, 0, 0.3960784, 1,
1.463732, 1.706787, 1.366605, 1, 0, 0.3882353, 1,
1.49254, 0.2866529, 1.441145, 1, 0, 0.3843137, 1,
1.503664, 0.1383475, -0.1308822, 1, 0, 0.3764706, 1,
1.525413, 0.4970525, 3.655358, 1, 0, 0.372549, 1,
1.528851, -1.382736, 2.945608, 1, 0, 0.3647059, 1,
1.537097, 1.282008, 0.8132471, 1, 0, 0.3607843, 1,
1.543183, -0.002857304, 1.223116, 1, 0, 0.3529412, 1,
1.550354, 1.495619, 0.221231, 1, 0, 0.3490196, 1,
1.55678, -0.4663497, 2.895238, 1, 0, 0.3411765, 1,
1.563184, -0.2294313, 1.661489, 1, 0, 0.3372549, 1,
1.572582, 0.2572477, 0.617286, 1, 0, 0.3294118, 1,
1.57371, 1.022942, 0.2815352, 1, 0, 0.3254902, 1,
1.583176, -1.868907, 3.763973, 1, 0, 0.3176471, 1,
1.587643, -0.7761669, 2.454948, 1, 0, 0.3137255, 1,
1.590474, -1.257071, 3.274294, 1, 0, 0.3058824, 1,
1.606864, -0.2277329, 1.436978, 1, 0, 0.2980392, 1,
1.610137, -0.2351812, 1.618726, 1, 0, 0.2941177, 1,
1.622718, 2.03162, 0.5134853, 1, 0, 0.2862745, 1,
1.633631, -1.366061, 3.02938, 1, 0, 0.282353, 1,
1.636754, -0.4205664, 2.186473, 1, 0, 0.2745098, 1,
1.642538, 1.116398, 1.783976, 1, 0, 0.2705882, 1,
1.647963, -1.54152, 2.35057, 1, 0, 0.2627451, 1,
1.654725, 0.6297202, 1.487952, 1, 0, 0.2588235, 1,
1.667683, -1.638032, 3.231793, 1, 0, 0.2509804, 1,
1.701597, -1.321214, 2.502601, 1, 0, 0.2470588, 1,
1.725312, 1.010689, 1.123942, 1, 0, 0.2392157, 1,
1.737915, -1.636248, 2.526049, 1, 0, 0.2352941, 1,
1.738001, -1.418728, 2.394596, 1, 0, 0.227451, 1,
1.772045, -0.2725616, 1.496175, 1, 0, 0.2235294, 1,
1.784404, 1.250773, -0.6957036, 1, 0, 0.2156863, 1,
1.819586, 1.054083, 1.196381, 1, 0, 0.2117647, 1,
1.828775, -1.352089, 0.7862977, 1, 0, 0.2039216, 1,
1.833129, 1.499045, -0.3425647, 1, 0, 0.1960784, 1,
1.83399, -0.5716925, 2.198298, 1, 0, 0.1921569, 1,
1.844898, 0.5900881, 1.495495, 1, 0, 0.1843137, 1,
1.902784, 0.3711758, 0.7573728, 1, 0, 0.1803922, 1,
1.913329, -1.453798, 1.834788, 1, 0, 0.172549, 1,
1.925214, 1.433023, -0.1437301, 1, 0, 0.1686275, 1,
1.933872, 1.057572, 0.6558738, 1, 0, 0.1607843, 1,
1.965351, 1.290067, 2.171, 1, 0, 0.1568628, 1,
1.965465, 0.5034865, 1.052573, 1, 0, 0.1490196, 1,
1.972454, -0.2553077, 2.936342, 1, 0, 0.145098, 1,
1.976938, 0.2881222, 0.3174832, 1, 0, 0.1372549, 1,
1.984505, 0.5314161, 2.278328, 1, 0, 0.1333333, 1,
1.986837, -1.011848, 1.029037, 1, 0, 0.1254902, 1,
2.013386, -1.903225, 2.471066, 1, 0, 0.1215686, 1,
2.026895, 0.9207023, 1.349757, 1, 0, 0.1137255, 1,
2.032114, -0.7421262, 0.9055554, 1, 0, 0.1098039, 1,
2.038074, -1.602395, 1.605914, 1, 0, 0.1019608, 1,
2.136117, 0.3894798, 0.2897131, 1, 0, 0.09411765, 1,
2.151533, -0.4752117, 2.902512, 1, 0, 0.09019608, 1,
2.176914, -0.3340448, 1.928674, 1, 0, 0.08235294, 1,
2.191038, -0.2660235, 2.157966, 1, 0, 0.07843138, 1,
2.225815, -0.9399153, 0.4624757, 1, 0, 0.07058824, 1,
2.279972, 2.577366, -0.9674642, 1, 0, 0.06666667, 1,
2.295233, -0.3169802, 1.223157, 1, 0, 0.05882353, 1,
2.299576, -0.4033815, 1.915451, 1, 0, 0.05490196, 1,
2.307495, 1.20131, -0.3501601, 1, 0, 0.04705882, 1,
2.471678, -0.9274054, 1.551668, 1, 0, 0.04313726, 1,
2.582486, 0.4953246, 1.114914, 1, 0, 0.03529412, 1,
2.590829, -0.79542, 0.537215, 1, 0, 0.03137255, 1,
2.60892, -0.4888635, 0.759895, 1, 0, 0.02352941, 1,
2.628867, -0.8920975, 3.884511, 1, 0, 0.01960784, 1,
2.643252, -1.322949, 1.876262, 1, 0, 0.01176471, 1,
2.834661, -1.476747, 2.076669, 1, 0, 0.007843138, 1
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
-0.1214223, -4.451523, -7.176682, 0, -0.5, 0.5, 0.5,
-0.1214223, -4.451523, -7.176682, 1, -0.5, 0.5, 0.5,
-0.1214223, -4.451523, -7.176682, 1, 1.5, 0.5, 0.5,
-0.1214223, -4.451523, -7.176682, 0, 1.5, 0.5, 0.5
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
-4.079618, -0.06550312, -7.176682, 0, -0.5, 0.5, 0.5,
-4.079618, -0.06550312, -7.176682, 1, -0.5, 0.5, 0.5,
-4.079618, -0.06550312, -7.176682, 1, 1.5, 0.5, 0.5,
-4.079618, -0.06550312, -7.176682, 0, 1.5, 0.5, 0.5
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
-4.079618, -4.451523, -0.2993677, 0, -0.5, 0.5, 0.5,
-4.079618, -4.451523, -0.2993677, 1, -0.5, 0.5, 0.5,
-4.079618, -4.451523, -0.2993677, 1, 1.5, 0.5, 0.5,
-4.079618, -4.451523, -0.2993677, 0, 1.5, 0.5, 0.5
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
-3, -3.439365, -5.589609,
2, -3.439365, -5.589609,
-3, -3.439365, -5.589609,
-3, -3.608058, -5.854121,
-2, -3.439365, -5.589609,
-2, -3.608058, -5.854121,
-1, -3.439365, -5.589609,
-1, -3.608058, -5.854121,
0, -3.439365, -5.589609,
0, -3.608058, -5.854121,
1, -3.439365, -5.589609,
1, -3.608058, -5.854121,
2, -3.439365, -5.589609,
2, -3.608058, -5.854121
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
-3, -3.945444, -6.383145, 0, -0.5, 0.5, 0.5,
-3, -3.945444, -6.383145, 1, -0.5, 0.5, 0.5,
-3, -3.945444, -6.383145, 1, 1.5, 0.5, 0.5,
-3, -3.945444, -6.383145, 0, 1.5, 0.5, 0.5,
-2, -3.945444, -6.383145, 0, -0.5, 0.5, 0.5,
-2, -3.945444, -6.383145, 1, -0.5, 0.5, 0.5,
-2, -3.945444, -6.383145, 1, 1.5, 0.5, 0.5,
-2, -3.945444, -6.383145, 0, 1.5, 0.5, 0.5,
-1, -3.945444, -6.383145, 0, -0.5, 0.5, 0.5,
-1, -3.945444, -6.383145, 1, -0.5, 0.5, 0.5,
-1, -3.945444, -6.383145, 1, 1.5, 0.5, 0.5,
-1, -3.945444, -6.383145, 0, 1.5, 0.5, 0.5,
0, -3.945444, -6.383145, 0, -0.5, 0.5, 0.5,
0, -3.945444, -6.383145, 1, -0.5, 0.5, 0.5,
0, -3.945444, -6.383145, 1, 1.5, 0.5, 0.5,
0, -3.945444, -6.383145, 0, 1.5, 0.5, 0.5,
1, -3.945444, -6.383145, 0, -0.5, 0.5, 0.5,
1, -3.945444, -6.383145, 1, -0.5, 0.5, 0.5,
1, -3.945444, -6.383145, 1, 1.5, 0.5, 0.5,
1, -3.945444, -6.383145, 0, 1.5, 0.5, 0.5,
2, -3.945444, -6.383145, 0, -0.5, 0.5, 0.5,
2, -3.945444, -6.383145, 1, -0.5, 0.5, 0.5,
2, -3.945444, -6.383145, 1, 1.5, 0.5, 0.5,
2, -3.945444, -6.383145, 0, 1.5, 0.5, 0.5
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
-3.166188, -3, -5.589609,
-3.166188, 3, -5.589609,
-3.166188, -3, -5.589609,
-3.318426, -3, -5.854121,
-3.166188, -2, -5.589609,
-3.318426, -2, -5.854121,
-3.166188, -1, -5.589609,
-3.318426, -1, -5.854121,
-3.166188, 0, -5.589609,
-3.318426, 0, -5.854121,
-3.166188, 1, -5.589609,
-3.318426, 1, -5.854121,
-3.166188, 2, -5.589609,
-3.318426, 2, -5.854121,
-3.166188, 3, -5.589609,
-3.318426, 3, -5.854121
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
-3.622903, -3, -6.383145, 0, -0.5, 0.5, 0.5,
-3.622903, -3, -6.383145, 1, -0.5, 0.5, 0.5,
-3.622903, -3, -6.383145, 1, 1.5, 0.5, 0.5,
-3.622903, -3, -6.383145, 0, 1.5, 0.5, 0.5,
-3.622903, -2, -6.383145, 0, -0.5, 0.5, 0.5,
-3.622903, -2, -6.383145, 1, -0.5, 0.5, 0.5,
-3.622903, -2, -6.383145, 1, 1.5, 0.5, 0.5,
-3.622903, -2, -6.383145, 0, 1.5, 0.5, 0.5,
-3.622903, -1, -6.383145, 0, -0.5, 0.5, 0.5,
-3.622903, -1, -6.383145, 1, -0.5, 0.5, 0.5,
-3.622903, -1, -6.383145, 1, 1.5, 0.5, 0.5,
-3.622903, -1, -6.383145, 0, 1.5, 0.5, 0.5,
-3.622903, 0, -6.383145, 0, -0.5, 0.5, 0.5,
-3.622903, 0, -6.383145, 1, -0.5, 0.5, 0.5,
-3.622903, 0, -6.383145, 1, 1.5, 0.5, 0.5,
-3.622903, 0, -6.383145, 0, 1.5, 0.5, 0.5,
-3.622903, 1, -6.383145, 0, -0.5, 0.5, 0.5,
-3.622903, 1, -6.383145, 1, -0.5, 0.5, 0.5,
-3.622903, 1, -6.383145, 1, 1.5, 0.5, 0.5,
-3.622903, 1, -6.383145, 0, 1.5, 0.5, 0.5,
-3.622903, 2, -6.383145, 0, -0.5, 0.5, 0.5,
-3.622903, 2, -6.383145, 1, -0.5, 0.5, 0.5,
-3.622903, 2, -6.383145, 1, 1.5, 0.5, 0.5,
-3.622903, 2, -6.383145, 0, 1.5, 0.5, 0.5,
-3.622903, 3, -6.383145, 0, -0.5, 0.5, 0.5,
-3.622903, 3, -6.383145, 1, -0.5, 0.5, 0.5,
-3.622903, 3, -6.383145, 1, 1.5, 0.5, 0.5,
-3.622903, 3, -6.383145, 0, 1.5, 0.5, 0.5
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
-3.166188, -3.439365, -4,
-3.166188, -3.439365, 4,
-3.166188, -3.439365, -4,
-3.318426, -3.608058, -4,
-3.166188, -3.439365, -2,
-3.318426, -3.608058, -2,
-3.166188, -3.439365, 0,
-3.318426, -3.608058, 0,
-3.166188, -3.439365, 2,
-3.318426, -3.608058, 2,
-3.166188, -3.439365, 4,
-3.318426, -3.608058, 4
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
-3.622903, -3.945444, -4, 0, -0.5, 0.5, 0.5,
-3.622903, -3.945444, -4, 1, -0.5, 0.5, 0.5,
-3.622903, -3.945444, -4, 1, 1.5, 0.5, 0.5,
-3.622903, -3.945444, -4, 0, 1.5, 0.5, 0.5,
-3.622903, -3.945444, -2, 0, -0.5, 0.5, 0.5,
-3.622903, -3.945444, -2, 1, -0.5, 0.5, 0.5,
-3.622903, -3.945444, -2, 1, 1.5, 0.5, 0.5,
-3.622903, -3.945444, -2, 0, 1.5, 0.5, 0.5,
-3.622903, -3.945444, 0, 0, -0.5, 0.5, 0.5,
-3.622903, -3.945444, 0, 1, -0.5, 0.5, 0.5,
-3.622903, -3.945444, 0, 1, 1.5, 0.5, 0.5,
-3.622903, -3.945444, 0, 0, 1.5, 0.5, 0.5,
-3.622903, -3.945444, 2, 0, -0.5, 0.5, 0.5,
-3.622903, -3.945444, 2, 1, -0.5, 0.5, 0.5,
-3.622903, -3.945444, 2, 1, 1.5, 0.5, 0.5,
-3.622903, -3.945444, 2, 0, 1.5, 0.5, 0.5,
-3.622903, -3.945444, 4, 0, -0.5, 0.5, 0.5,
-3.622903, -3.945444, 4, 1, -0.5, 0.5, 0.5,
-3.622903, -3.945444, 4, 1, 1.5, 0.5, 0.5,
-3.622903, -3.945444, 4, 0, 1.5, 0.5, 0.5
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
-3.166188, -3.439365, -5.589609,
-3.166188, 3.308358, -5.589609,
-3.166188, -3.439365, 4.990874,
-3.166188, 3.308358, 4.990874,
-3.166188, -3.439365, -5.589609,
-3.166188, -3.439365, 4.990874,
-3.166188, 3.308358, -5.589609,
-3.166188, 3.308358, 4.990874,
-3.166188, -3.439365, -5.589609,
2.923343, -3.439365, -5.589609,
-3.166188, -3.439365, 4.990874,
2.923343, -3.439365, 4.990874,
-3.166188, 3.308358, -5.589609,
2.923343, 3.308358, -5.589609,
-3.166188, 3.308358, 4.990874,
2.923343, 3.308358, 4.990874,
2.923343, -3.439365, -5.589609,
2.923343, 3.308358, -5.589609,
2.923343, -3.439365, 4.990874,
2.923343, 3.308358, 4.990874,
2.923343, -3.439365, -5.589609,
2.923343, -3.439365, 4.990874,
2.923343, 3.308358, -5.589609,
2.923343, 3.308358, 4.990874
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
var radius = 7.448231;
var distance = 33.13802;
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
mvMatrix.translate( 0.1214223, 0.06550312, 0.2993677 );
mvMatrix.scale( 1.322462, 1.193465, 0.7611347 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.13802);
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
DDT<-read.table("DDT.xyz")
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
-3.077506, 0.1481953, 0.2539396, 0, 0, 1, 1, 1,
-2.920171, -0.4842156, -2.275544, 1, 0, 0, 1, 1,
-2.682231, 3.210091, 0.2217078, 1, 0, 0, 1, 1,
-2.672856, -0.8881438, -3.028386, 1, 0, 0, 1, 1,
-2.556802, -0.2249826, -3.677002, 1, 0, 0, 1, 1,
-2.546982, -0.3800868, -0.4511894, 1, 0, 0, 1, 1,
-2.425362, 0.04388115, -2.467121, 0, 0, 0, 1, 1,
-2.397185, 2.121084, -0.1093955, 0, 0, 0, 1, 1,
-2.377745, -0.2790391, -0.5427454, 0, 0, 0, 1, 1,
-2.34925, -0.3842803, 0.7495742, 0, 0, 0, 1, 1,
-2.272132, -0.4297805, -1.324757, 0, 0, 0, 1, 1,
-2.260128, 1.019985, -1.128868, 0, 0, 0, 1, 1,
-2.225899, 0.684306, -1.374024, 0, 0, 0, 1, 1,
-2.195222, -0.6997321, -1.235216, 1, 1, 1, 1, 1,
-2.190955, 0.2114373, -3.016043, 1, 1, 1, 1, 1,
-2.167012, 0.8787187, -2.81614, 1, 1, 1, 1, 1,
-2.134583, 0.002099054, -0.9728132, 1, 1, 1, 1, 1,
-2.111674, -1.589708, -2.214933, 1, 1, 1, 1, 1,
-2.10743, -0.97721, -1.443623, 1, 1, 1, 1, 1,
-2.089959, -0.8511266, -1.593848, 1, 1, 1, 1, 1,
-2.081962, 2.094513, -1.865263, 1, 1, 1, 1, 1,
-2.043062, -0.8956142, -0.6658133, 1, 1, 1, 1, 1,
-2.012376, 0.1146504, -1.071889, 1, 1, 1, 1, 1,
-1.989511, -0.9847454, -2.064093, 1, 1, 1, 1, 1,
-1.98761, 0.3187686, -0.7214399, 1, 1, 1, 1, 1,
-1.985781, 0.3681401, -2.402517, 1, 1, 1, 1, 1,
-1.921465, -0.6547266, -1.936029, 1, 1, 1, 1, 1,
-1.916678, -0.4675571, -1.125642, 1, 1, 1, 1, 1,
-1.889182, 1.21414, -0.635151, 0, 0, 1, 1, 1,
-1.885872, -0.2679179, -1.042731, 1, 0, 0, 1, 1,
-1.877424, 0.4171742, -2.161229, 1, 0, 0, 1, 1,
-1.876511, -1.501251, -2.580173, 1, 0, 0, 1, 1,
-1.87569, -0.128187, -1.144964, 1, 0, 0, 1, 1,
-1.860361, -0.07117835, -1.54376, 1, 0, 0, 1, 1,
-1.819486, 0.1486032, -3.236061, 0, 0, 0, 1, 1,
-1.795474, -0.4766978, -3.102403, 0, 0, 0, 1, 1,
-1.791635, 0.9682941, -1.648983, 0, 0, 0, 1, 1,
-1.777237, 0.4005075, -2.672028, 0, 0, 0, 1, 1,
-1.762557, 0.3437167, -1.109456, 0, 0, 0, 1, 1,
-1.759915, 0.0091513, -1.752776, 0, 0, 0, 1, 1,
-1.730737, 0.9462351, -0.1936801, 0, 0, 0, 1, 1,
-1.724042, -0.2039264, -2.286078, 1, 1, 1, 1, 1,
-1.72259, -0.2929858, -2.30612, 1, 1, 1, 1, 1,
-1.692317, -1.329815, -3.2155, 1, 1, 1, 1, 1,
-1.672002, 1.073633, -1.24612, 1, 1, 1, 1, 1,
-1.665755, -1.361334, -3.027481, 1, 1, 1, 1, 1,
-1.662151, 0.824362, 0.03887477, 1, 1, 1, 1, 1,
-1.632334, 0.07292642, -2.160912, 1, 1, 1, 1, 1,
-1.622321, 3.190142, -0.7858905, 1, 1, 1, 1, 1,
-1.610534, 1.16041, -0.4532632, 1, 1, 1, 1, 1,
-1.58579, 0.2750811, -1.050794, 1, 1, 1, 1, 1,
-1.574017, -0.7225036, -0.4973411, 1, 1, 1, 1, 1,
-1.571365, 0.9485286, -0.7710904, 1, 1, 1, 1, 1,
-1.553477, -0.9790609, -3.802845, 1, 1, 1, 1, 1,
-1.55224, -0.4412521, -2.849145, 1, 1, 1, 1, 1,
-1.537074, -0.262012, -0.9137915, 1, 1, 1, 1, 1,
-1.531786, -0.571205, -2.667239, 0, 0, 1, 1, 1,
-1.530719, 2.011393, -0.3924132, 1, 0, 0, 1, 1,
-1.528789, -0.7678153, -2.635725, 1, 0, 0, 1, 1,
-1.507004, 0.4349016, -2.474711, 1, 0, 0, 1, 1,
-1.496323, 1.027125, -1.947421, 1, 0, 0, 1, 1,
-1.496321, 0.1467783, -1.759448, 1, 0, 0, 1, 1,
-1.490141, -0.3846388, -2.784999, 0, 0, 0, 1, 1,
-1.486083, -0.1883132, -0.6597686, 0, 0, 0, 1, 1,
-1.480315, -0.1598726, -4.191422, 0, 0, 0, 1, 1,
-1.479384, 0.2120236, -2.276803, 0, 0, 0, 1, 1,
-1.472458, 1.332272, 0.2635853, 0, 0, 0, 1, 1,
-1.436916, -0.3398135, -0.6109138, 0, 0, 0, 1, 1,
-1.436607, -1.836887, -3.117695, 0, 0, 0, 1, 1,
-1.430066, 0.4160407, -2.560612, 1, 1, 1, 1, 1,
-1.429795, 1.539414, -1.294168, 1, 1, 1, 1, 1,
-1.428275, 0.8393294, 0.08579132, 1, 1, 1, 1, 1,
-1.427884, 0.01115036, -0.5394598, 1, 1, 1, 1, 1,
-1.424883, 1.808652, -0.3858792, 1, 1, 1, 1, 1,
-1.40686, -0.6517638, -1.033337, 1, 1, 1, 1, 1,
-1.393703, 0.06435373, -2.727023, 1, 1, 1, 1, 1,
-1.388787, -0.400723, -1.365471, 1, 1, 1, 1, 1,
-1.378349, -1.099634, -2.729843, 1, 1, 1, 1, 1,
-1.375829, -1.328975, -1.352245, 1, 1, 1, 1, 1,
-1.369305, -0.0526128, -0.2933261, 1, 1, 1, 1, 1,
-1.366752, -1.4494, -2.977034, 1, 1, 1, 1, 1,
-1.356603, -0.002199032, -2.311527, 1, 1, 1, 1, 1,
-1.356405, -1.90684, -3.0565, 1, 1, 1, 1, 1,
-1.352439, 0.3690172, -1.03835, 1, 1, 1, 1, 1,
-1.352143, -0.7975869, -0.767615, 0, 0, 1, 1, 1,
-1.332223, -2.366195, -2.205135, 1, 0, 0, 1, 1,
-1.32533, 0.4942726, -2.254969, 1, 0, 0, 1, 1,
-1.323646, -1.320168, -2.27387, 1, 0, 0, 1, 1,
-1.323494, 0.4032905, -1.886241, 1, 0, 0, 1, 1,
-1.290601, 0.3298674, -1.829215, 1, 0, 0, 1, 1,
-1.285436, 0.42707, -3.795979, 0, 0, 0, 1, 1,
-1.282988, -0.5396355, -0.6069757, 0, 0, 0, 1, 1,
-1.281453, -1.884623, -3.73232, 0, 0, 0, 1, 1,
-1.27611, 0.9722464, 0.0225088, 0, 0, 0, 1, 1,
-1.274006, -3.341097, -3.097208, 0, 0, 0, 1, 1,
-1.270558, 0.7883137, -0.3234979, 0, 0, 0, 1, 1,
-1.265094, 0.6662537, -1.309052, 0, 0, 0, 1, 1,
-1.261789, -1.929905, -4.232017, 1, 1, 1, 1, 1,
-1.244917, 1.009904, -2.362529, 1, 1, 1, 1, 1,
-1.242344, -1.727868, -3.010533, 1, 1, 1, 1, 1,
-1.234475, -0.2056909, -3.206297, 1, 1, 1, 1, 1,
-1.23124, -0.1363403, -0.9949778, 1, 1, 1, 1, 1,
-1.230649, 0.1402354, -0.894915, 1, 1, 1, 1, 1,
-1.228608, 0.4846832, -0.2721367, 1, 1, 1, 1, 1,
-1.225471, -0.8270062, -1.255821, 1, 1, 1, 1, 1,
-1.218518, -0.6534385, -1.422456, 1, 1, 1, 1, 1,
-1.214283, -0.6195673, -3.330788, 1, 1, 1, 1, 1,
-1.212465, 1.188194, 0.05761532, 1, 1, 1, 1, 1,
-1.210176, -1.148558, -2.327496, 1, 1, 1, 1, 1,
-1.201251, 1.11036, -0.3943526, 1, 1, 1, 1, 1,
-1.196401, 0.8141973, 0.4151239, 1, 1, 1, 1, 1,
-1.196325, 1.442183, 0.7555756, 1, 1, 1, 1, 1,
-1.192562, -0.30283, -2.742014, 0, 0, 1, 1, 1,
-1.191985, 1.090148, 0.2869281, 1, 0, 0, 1, 1,
-1.191361, -0.09287868, -3.62544, 1, 0, 0, 1, 1,
-1.186245, 3.120103, 0.7107848, 1, 0, 0, 1, 1,
-1.184433, 0.8102548, 0.6384409, 1, 0, 0, 1, 1,
-1.183384, -0.4009241, -1.6666, 1, 0, 0, 1, 1,
-1.181009, -0.4186229, -0.9578553, 0, 0, 0, 1, 1,
-1.17906, 1.26142, -0.7916802, 0, 0, 0, 1, 1,
-1.176682, -0.3134176, -0.6163992, 0, 0, 0, 1, 1,
-1.175063, -0.210275, -1.389846, 0, 0, 0, 1, 1,
-1.168342, 0.8876866, -0.7836471, 0, 0, 0, 1, 1,
-1.165834, -0.4663872, -2.387762, 0, 0, 0, 1, 1,
-1.159796, -0.1914783, -3.009621, 0, 0, 0, 1, 1,
-1.156932, -0.2063162, -1.682514, 1, 1, 1, 1, 1,
-1.149872, 1.221879, 0.3898711, 1, 1, 1, 1, 1,
-1.144093, -0.5015039, 0.7503125, 1, 1, 1, 1, 1,
-1.127032, 0.3768751, -2.093876, 1, 1, 1, 1, 1,
-1.12698, -1.281079, -3.612742, 1, 1, 1, 1, 1,
-1.12662, 2.523068, -1.302642, 1, 1, 1, 1, 1,
-1.120783, 0.5251454, -2.231373, 1, 1, 1, 1, 1,
-1.120422, 1.132832, -1.543915, 1, 1, 1, 1, 1,
-1.118361, 0.2041992, -0.3041469, 1, 1, 1, 1, 1,
-1.118243, -1.428406, -3.037323, 1, 1, 1, 1, 1,
-1.118026, -0.8853662, 0.3112117, 1, 1, 1, 1, 1,
-1.108838, -0.2343898, -2.000599, 1, 1, 1, 1, 1,
-1.095734, 0.2614124, -0.7385798, 1, 1, 1, 1, 1,
-1.093653, 0.1683516, -2.75328, 1, 1, 1, 1, 1,
-1.087021, -1.500745, -1.421923, 1, 1, 1, 1, 1,
-1.077349, 0.1136478, -2.812654, 0, 0, 1, 1, 1,
-1.069628, 1.108007, -1.49355, 1, 0, 0, 1, 1,
-1.069472, 0.309014, -1.717467, 1, 0, 0, 1, 1,
-1.067789, 1.750825, 1.73741, 1, 0, 0, 1, 1,
-1.053687, -1.91231, -3.265919, 1, 0, 0, 1, 1,
-1.051784, -0.270867, -2.895594, 1, 0, 0, 1, 1,
-1.051349, 0.3992329, -1.5322, 0, 0, 0, 1, 1,
-1.049333, 0.05230806, -1.816304, 0, 0, 0, 1, 1,
-1.048428, 0.6286012, -1.900364, 0, 0, 0, 1, 1,
-1.042287, -0.7368989, -2.397308, 0, 0, 0, 1, 1,
-1.038664, -0.8244382, -3.836939, 0, 0, 0, 1, 1,
-1.031054, 0.501027, -0.9349747, 0, 0, 0, 1, 1,
-1.02392, 0.3346021, -3.925853, 0, 0, 0, 1, 1,
-1.009537, 0.6649849, -2.759395, 1, 1, 1, 1, 1,
-1.007483, 0.7354117, 1.093493, 1, 1, 1, 1, 1,
-1.007132, -0.2503039, -0.4064491, 1, 1, 1, 1, 1,
-1.006231, -0.05221219, -1.375236, 1, 1, 1, 1, 1,
-0.9988355, 0.2807173, -0.3942683, 1, 1, 1, 1, 1,
-0.9988015, 0.5951148, -0.596672, 1, 1, 1, 1, 1,
-0.9930619, 0.3537119, 0.002265555, 1, 1, 1, 1, 1,
-0.9891267, 0.1486002, -2.08859, 1, 1, 1, 1, 1,
-0.9810671, 0.6574567, -1.096606, 1, 1, 1, 1, 1,
-0.9810157, -0.5575913, -1.798949, 1, 1, 1, 1, 1,
-0.973578, 0.7584029, -0.6968907, 1, 1, 1, 1, 1,
-0.9717872, 0.3878013, -2.227552, 1, 1, 1, 1, 1,
-0.967418, 1.014269, -2.415324, 1, 1, 1, 1, 1,
-0.9640606, -0.9127331, -2.366056, 1, 1, 1, 1, 1,
-0.963503, 0.3136806, -1.393945, 1, 1, 1, 1, 1,
-0.9571762, -1.644813, -2.859253, 0, 0, 1, 1, 1,
-0.9504429, 2.337527, -0.06851567, 1, 0, 0, 1, 1,
-0.9486115, 0.7609821, -2.014456, 1, 0, 0, 1, 1,
-0.9434133, -1.072589, 0.4323414, 1, 0, 0, 1, 1,
-0.9432733, -1.389482, -3.011306, 1, 0, 0, 1, 1,
-0.9370514, -0.8236936, -1.411035, 1, 0, 0, 1, 1,
-0.9296095, -0.6243602, -3.024365, 0, 0, 0, 1, 1,
-0.9293436, 0.07944726, -0.9545473, 0, 0, 0, 1, 1,
-0.9289502, -0.2563929, -3.562074, 0, 0, 0, 1, 1,
-0.9239752, -0.6344579, -2.127783, 0, 0, 0, 1, 1,
-0.921434, -0.8546422, -1.598127, 0, 0, 0, 1, 1,
-0.9210269, 0.163196, -0.7226254, 0, 0, 0, 1, 1,
-0.9196903, -0.7288229, -2.809594, 0, 0, 0, 1, 1,
-0.9073288, -0.4868493, -3.270713, 1, 1, 1, 1, 1,
-0.9061402, 0.5537347, -0.07592692, 1, 1, 1, 1, 1,
-0.9043242, 0.6044858, -2.789377, 1, 1, 1, 1, 1,
-0.9038393, 0.7120377, -0.4173453, 1, 1, 1, 1, 1,
-0.9008347, 0.3190689, -2.132088, 1, 1, 1, 1, 1,
-0.8904213, 1.748067, 0.4885597, 1, 1, 1, 1, 1,
-0.8900054, 0.6579534, -1.528503, 1, 1, 1, 1, 1,
-0.8894879, -0.6152276, -2.822959, 1, 1, 1, 1, 1,
-0.8863461, -1.07013, -3.720538, 1, 1, 1, 1, 1,
-0.8862189, -0.7971768, -2.381451, 1, 1, 1, 1, 1,
-0.8860333, -0.7451822, -4.2249, 1, 1, 1, 1, 1,
-0.8795015, -0.9736191, -2.732014, 1, 1, 1, 1, 1,
-0.8759367, -0.779128, -2.002854, 1, 1, 1, 1, 1,
-0.8644596, 0.7386471, 0.7008963, 1, 1, 1, 1, 1,
-0.8633536, -2.423726, -2.748265, 1, 1, 1, 1, 1,
-0.8632619, -0.1536246, -2.773052, 0, 0, 1, 1, 1,
-0.8546491, -0.2597442, -1.078896, 1, 0, 0, 1, 1,
-0.8503059, -0.6949255, -2.422751, 1, 0, 0, 1, 1,
-0.8443629, -1.051625, -0.4841127, 1, 0, 0, 1, 1,
-0.8379557, 0.9339847, -1.039045, 1, 0, 0, 1, 1,
-0.837651, 1.355111, 0.8190433, 1, 0, 0, 1, 1,
-0.8342751, 0.413561, 0.3807994, 0, 0, 0, 1, 1,
-0.8320857, 0.6788375, 0.2367134, 0, 0, 0, 1, 1,
-0.8285717, -0.6350331, -1.374367, 0, 0, 0, 1, 1,
-0.8172886, 0.8238967, 0.8881298, 0, 0, 0, 1, 1,
-0.8163319, 0.1457012, -1.724117, 0, 0, 0, 1, 1,
-0.8124567, 0.9539329, -0.7574583, 0, 0, 0, 1, 1,
-0.811244, -0.5155284, -3.53766, 0, 0, 0, 1, 1,
-0.8098866, -1.053542, -0.9553023, 1, 1, 1, 1, 1,
-0.8091142, -0.9965684, -1.066227, 1, 1, 1, 1, 1,
-0.807814, 0.898952, -0.7785163, 1, 1, 1, 1, 1,
-0.8007492, -0.8101906, -2.120882, 1, 1, 1, 1, 1,
-0.7984532, 0.08783759, -1.670872, 1, 1, 1, 1, 1,
-0.7976221, 0.4313788, -1.420868, 1, 1, 1, 1, 1,
-0.7929069, -1.755492, -2.513361, 1, 1, 1, 1, 1,
-0.7916006, 1.659431, -0.7778357, 1, 1, 1, 1, 1,
-0.7806805, 0.5524495, 0.05610478, 1, 1, 1, 1, 1,
-0.7744617, 0.8473276, -0.8369791, 1, 1, 1, 1, 1,
-0.7692589, -1.087246, -1.198275, 1, 1, 1, 1, 1,
-0.7691607, -0.8862447, -2.555251, 1, 1, 1, 1, 1,
-0.7673367, -0.6968553, -0.2011275, 1, 1, 1, 1, 1,
-0.7662386, -0.9737086, -2.091692, 1, 1, 1, 1, 1,
-0.7549718, 0.7046145, -0.02429786, 1, 1, 1, 1, 1,
-0.7483741, 1.064581, 0.1102535, 0, 0, 1, 1, 1,
-0.7480899, 1.035842, -1.642393, 1, 0, 0, 1, 1,
-0.7470465, -0.2690223, -0.892842, 1, 0, 0, 1, 1,
-0.7458949, -0.4590568, -1.813006, 1, 0, 0, 1, 1,
-0.7426594, 2.813967, -0.8622364, 1, 0, 0, 1, 1,
-0.737954, -0.8187373, -1.312357, 1, 0, 0, 1, 1,
-0.7370816, 0.8648168, -0.8185745, 0, 0, 0, 1, 1,
-0.7350654, 0.06787225, -1.073309, 0, 0, 0, 1, 1,
-0.7329841, 0.2904611, -0.5691341, 0, 0, 0, 1, 1,
-0.7298059, 0.3444277, -0.01411867, 0, 0, 0, 1, 1,
-0.7257067, -0.1632048, -0.5307004, 0, 0, 0, 1, 1,
-0.7235032, -0.07121858, -2.850689, 0, 0, 0, 1, 1,
-0.7132251, -0.7754305, -1.438999, 0, 0, 0, 1, 1,
-0.7005705, 0.4568583, -2.35306, 1, 1, 1, 1, 1,
-0.6976522, 0.5488148, 0.414051, 1, 1, 1, 1, 1,
-0.6950188, -1.619073, -3.674397, 1, 1, 1, 1, 1,
-0.6942792, 1.436845, -1.651799, 1, 1, 1, 1, 1,
-0.6825868, 0.3109848, 0.3611906, 1, 1, 1, 1, 1,
-0.6814522, 0.6187582, -1.445088, 1, 1, 1, 1, 1,
-0.6812955, -0.1109619, -1.118176, 1, 1, 1, 1, 1,
-0.6745089, 1.092817, 0.3771536, 1, 1, 1, 1, 1,
-0.6686335, 0.9366091, 0.1281763, 1, 1, 1, 1, 1,
-0.6619312, 0.2252004, -0.2564225, 1, 1, 1, 1, 1,
-0.6618839, -0.8689811, -2.722608, 1, 1, 1, 1, 1,
-0.648154, 0.5752961, -0.4239444, 1, 1, 1, 1, 1,
-0.646768, -0.5456453, -0.1148171, 1, 1, 1, 1, 1,
-0.6463886, 0.06590876, -0.9643747, 1, 1, 1, 1, 1,
-0.6440388, 0.04957573, -1.980374, 1, 1, 1, 1, 1,
-0.643275, -1.65483, -1.803621, 0, 0, 1, 1, 1,
-0.6384019, -0.3164724, -2.838085, 1, 0, 0, 1, 1,
-0.6314701, -2.514037, -2.969543, 1, 0, 0, 1, 1,
-0.6162178, 0.106901, -2.327769, 1, 0, 0, 1, 1,
-0.6151103, -0.2627432, -2.767153, 1, 0, 0, 1, 1,
-0.6149004, -0.9773762, -0.3685415, 1, 0, 0, 1, 1,
-0.6116133, 0.9427822, -0.8426822, 0, 0, 0, 1, 1,
-0.60988, 0.8940076, -0.515815, 0, 0, 0, 1, 1,
-0.6028597, -0.5204279, -1.772564, 0, 0, 0, 1, 1,
-0.5983236, -0.7285768, -3.701647, 0, 0, 0, 1, 1,
-0.5968553, -0.2692167, -4.996012, 0, 0, 0, 1, 1,
-0.5961849, -0.2768513, -2.935878, 0, 0, 0, 1, 1,
-0.5923743, 0.6380671, -0.1482012, 0, 0, 0, 1, 1,
-0.5850531, -1.02497, -3.732092, 1, 1, 1, 1, 1,
-0.5791675, -0.8721771, -2.510731, 1, 1, 1, 1, 1,
-0.5785877, -1.337202, -2.010775, 1, 1, 1, 1, 1,
-0.5738936, -0.6875225, -3.326286, 1, 1, 1, 1, 1,
-0.5724454, 1.377741, 0.2606072, 1, 1, 1, 1, 1,
-0.5718262, -1.050998, -2.570067, 1, 1, 1, 1, 1,
-0.5682653, -1.22011, -3.454994, 1, 1, 1, 1, 1,
-0.5632579, -0.2417421, -1.885306, 1, 1, 1, 1, 1,
-0.5629588, -0.7127528, -2.739202, 1, 1, 1, 1, 1,
-0.5613303, 0.6042339, -1.339368, 1, 1, 1, 1, 1,
-0.5593255, 0.9161013, -0.7481313, 1, 1, 1, 1, 1,
-0.5592327, -0.7579431, -2.659278, 1, 1, 1, 1, 1,
-0.5577022, 0.4873464, -1.610791, 1, 1, 1, 1, 1,
-0.5567621, -1.412014, -4.235055, 1, 1, 1, 1, 1,
-0.5541225, -0.2047486, -3.549574, 1, 1, 1, 1, 1,
-0.5520037, 0.1222337, -1.71339, 0, 0, 1, 1, 1,
-0.550213, -0.4796855, -2.712704, 1, 0, 0, 1, 1,
-0.5495471, 1.092651, 0.6198806, 1, 0, 0, 1, 1,
-0.5486674, -0.5573956, 0.1479854, 1, 0, 0, 1, 1,
-0.5429212, -0.5918675, -1.796125, 1, 0, 0, 1, 1,
-0.5394587, 2.862289, 0.7204069, 1, 0, 0, 1, 1,
-0.5392177, -0.7501543, -3.9355, 0, 0, 0, 1, 1,
-0.529856, 1.850892, -1.275609, 0, 0, 0, 1, 1,
-0.5293496, 1.16146, -0.3214994, 0, 0, 0, 1, 1,
-0.5276312, -0.8207014, -0.2991071, 0, 0, 0, 1, 1,
-0.527342, 0.2121623, -0.8435001, 0, 0, 0, 1, 1,
-0.5264518, -1.10012, -2.7787, 0, 0, 0, 1, 1,
-0.5256273, 0.6287776, 0.1059918, 0, 0, 0, 1, 1,
-0.5226327, -0.2592927, -2.500723, 1, 1, 1, 1, 1,
-0.5205103, -0.7070283, -1.960794, 1, 1, 1, 1, 1,
-0.51792, 0.3979801, -1.279569, 1, 1, 1, 1, 1,
-0.5171016, 0.6371832, -0.153036, 1, 1, 1, 1, 1,
-0.5162434, -0.4782262, -3.950565, 1, 1, 1, 1, 1,
-0.5159748, 0.7517349, 0.4197265, 1, 1, 1, 1, 1,
-0.5132625, -1.005716, -2.440829, 1, 1, 1, 1, 1,
-0.5103227, -1.52213, -2.670831, 1, 1, 1, 1, 1,
-0.510092, 1.05787, 0.2549273, 1, 1, 1, 1, 1,
-0.5097246, -0.01211615, -2.298692, 1, 1, 1, 1, 1,
-0.5093838, -1.488591, -2.094573, 1, 1, 1, 1, 1,
-0.5087324, 0.4001546, -1.886432, 1, 1, 1, 1, 1,
-0.5082575, 1.9381, 0.2284012, 1, 1, 1, 1, 1,
-0.5052102, -0.2168441, -2.598063, 1, 1, 1, 1, 1,
-0.5035929, 0.02628557, -0.7352313, 1, 1, 1, 1, 1,
-0.5028739, 2.22082, -1.50739, 0, 0, 1, 1, 1,
-0.5001305, 0.04763487, -0.8747447, 1, 0, 0, 1, 1,
-0.4988201, -1.821998, -1.244575, 1, 0, 0, 1, 1,
-0.4969163, 0.1941166, 0.7142032, 1, 0, 0, 1, 1,
-0.4945569, -1.480306, -2.655301, 1, 0, 0, 1, 1,
-0.4877256, 0.8282977, -1.380528, 1, 0, 0, 1, 1,
-0.4865143, 0.5409151, -0.6759616, 0, 0, 0, 1, 1,
-0.4854848, 0.7735453, -0.7620404, 0, 0, 0, 1, 1,
-0.4854439, -0.3503935, -1.968882, 0, 0, 0, 1, 1,
-0.4849302, 0.1317403, -0.5163977, 0, 0, 0, 1, 1,
-0.4805273, -0.08184466, -1.276447, 0, 0, 0, 1, 1,
-0.4778448, -0.7877503, -1.587488, 0, 0, 0, 1, 1,
-0.4773486, 1.813966, 0.568985, 0, 0, 0, 1, 1,
-0.4730644, 0.6548907, 0.8337096, 1, 1, 1, 1, 1,
-0.4708766, 0.408316, -1.936581, 1, 1, 1, 1, 1,
-0.4626946, -0.4890741, -2.908334, 1, 1, 1, 1, 1,
-0.4620371, 0.1172255, 0.3911756, 1, 1, 1, 1, 1,
-0.461567, 0.6374955, -0.08074164, 1, 1, 1, 1, 1,
-0.4607822, 0.2881803, -0.2808507, 1, 1, 1, 1, 1,
-0.4562, 0.8768058, 0.5937579, 1, 1, 1, 1, 1,
-0.4531195, -0.4632739, -2.919862, 1, 1, 1, 1, 1,
-0.4529444, 1.07523, -1.457855, 1, 1, 1, 1, 1,
-0.4489493, -0.3413205, -3.684921, 1, 1, 1, 1, 1,
-0.4440279, 2.795757, 1.122206, 1, 1, 1, 1, 1,
-0.4435305, -0.5906261, -1.522962, 1, 1, 1, 1, 1,
-0.4400794, 0.6570342, -0.7373379, 1, 1, 1, 1, 1,
-0.4366047, -0.685362, -1.63656, 1, 1, 1, 1, 1,
-0.435718, -1.542379, -2.806986, 1, 1, 1, 1, 1,
-0.4349051, 0.03001072, -1.174364, 0, 0, 1, 1, 1,
-0.4309935, 0.6820013, -1.829685, 1, 0, 0, 1, 1,
-0.4275026, 1.291194, -1.432815, 1, 0, 0, 1, 1,
-0.4265303, -0.5419105, -2.647086, 1, 0, 0, 1, 1,
-0.4229737, 0.2351849, -0.7075551, 1, 0, 0, 1, 1,
-0.4226576, 0.1829363, 0.8615405, 1, 0, 0, 1, 1,
-0.4198694, 0.01556639, -0.05634614, 0, 0, 0, 1, 1,
-0.4190826, -1.015827, -1.763076, 0, 0, 0, 1, 1,
-0.4189073, 1.605724, 0.01768142, 0, 0, 0, 1, 1,
-0.4127225, 0.9719573, -1.480029, 0, 0, 0, 1, 1,
-0.4111046, 0.16806, -2.357688, 0, 0, 0, 1, 1,
-0.4079539, 0.4911923, -1.721711, 0, 0, 0, 1, 1,
-0.4065564, 0.8269446, -0.4640395, 0, 0, 0, 1, 1,
-0.4046032, 1.331728, -1.543048, 1, 1, 1, 1, 1,
-0.3973545, -1.702844, -2.204784, 1, 1, 1, 1, 1,
-0.3969527, 1.307023, -0.144276, 1, 1, 1, 1, 1,
-0.3962862, 0.05850333, -2.468553, 1, 1, 1, 1, 1,
-0.3955901, -1.29514, -2.480545, 1, 1, 1, 1, 1,
-0.3937334, 0.4345049, -1.723653, 1, 1, 1, 1, 1,
-0.3918843, -0.9234591, -0.6600708, 1, 1, 1, 1, 1,
-0.3901524, 0.04749554, -0.02408271, 1, 1, 1, 1, 1,
-0.3843701, 1.042962, -0.3524077, 1, 1, 1, 1, 1,
-0.383725, -0.9582267, -3.038578, 1, 1, 1, 1, 1,
-0.3826838, 0.8474277, -0.1770457, 1, 1, 1, 1, 1,
-0.3825994, 0.03857542, -0.6107983, 1, 1, 1, 1, 1,
-0.3823668, -0.7563545, -3.401634, 1, 1, 1, 1, 1,
-0.3811508, -0.2874237, -0.06835611, 1, 1, 1, 1, 1,
-0.3783943, 0.4019495, -0.3786551, 1, 1, 1, 1, 1,
-0.3751898, 1.217445, -0.5307307, 0, 0, 1, 1, 1,
-0.3745867, -1.144567, -2.295103, 1, 0, 0, 1, 1,
-0.3739842, -0.7708264, -0.7439801, 1, 0, 0, 1, 1,
-0.3727845, -1.060491, -2.993665, 1, 0, 0, 1, 1,
-0.3601805, 1.003337, 0.2792327, 1, 0, 0, 1, 1,
-0.3594274, -0.9416703, -3.016155, 1, 0, 0, 1, 1,
-0.3541227, 0.3201135, -2.009953, 0, 0, 0, 1, 1,
-0.3519996, 0.3387698, -1.993632, 0, 0, 0, 1, 1,
-0.3517036, 0.2447558, -0.885426, 0, 0, 0, 1, 1,
-0.3515763, -0.2044473, -2.365098, 0, 0, 0, 1, 1,
-0.3481801, -0.6536001, -2.071494, 0, 0, 0, 1, 1,
-0.3436618, -0.8840104, -3.179001, 0, 0, 0, 1, 1,
-0.3428898, 0.265894, -1.16239, 0, 0, 0, 1, 1,
-0.3427932, -0.04230339, -2.738324, 1, 1, 1, 1, 1,
-0.3393494, -0.5664678, -3.079927, 1, 1, 1, 1, 1,
-0.3312882, 0.09765382, -2.278974, 1, 1, 1, 1, 1,
-0.3307565, 1.374693, -1.861991, 1, 1, 1, 1, 1,
-0.3264811, -0.8173379, -1.922655, 1, 1, 1, 1, 1,
-0.3242203, -0.2395135, -2.009878, 1, 1, 1, 1, 1,
-0.3217273, -0.5676907, -3.329654, 1, 1, 1, 1, 1,
-0.3204998, 0.9651747, 0.9801462, 1, 1, 1, 1, 1,
-0.3186313, 1.951973, -1.034071, 1, 1, 1, 1, 1,
-0.3164361, -1.563633, -4.678202, 1, 1, 1, 1, 1,
-0.3105945, 1.148901, 0.4215283, 1, 1, 1, 1, 1,
-0.3053775, -0.8315188, -1.862178, 1, 1, 1, 1, 1,
-0.3021772, -0.8688471, -3.520042, 1, 1, 1, 1, 1,
-0.3008885, 1.310401, -0.2108275, 1, 1, 1, 1, 1,
-0.2962406, -2.027037, -2.584673, 1, 1, 1, 1, 1,
-0.2938045, 0.168403, -2.437834, 0, 0, 1, 1, 1,
-0.2923591, 0.1773391, -1.509671, 1, 0, 0, 1, 1,
-0.2911909, 0.6527969, -0.4249758, 1, 0, 0, 1, 1,
-0.2895338, -1.146632, -3.637635, 1, 0, 0, 1, 1,
-0.2889511, -1.546736, -2.808515, 1, 0, 0, 1, 1,
-0.2868746, -0.3348938, -1.831801, 1, 0, 0, 1, 1,
-0.2853928, 1.859324, 0.5083395, 0, 0, 0, 1, 1,
-0.2809251, -0.1100005, -4.371053, 0, 0, 0, 1, 1,
-0.2805023, -0.1924752, -1.010461, 0, 0, 0, 1, 1,
-0.2790202, -0.3418729, -2.422879, 0, 0, 0, 1, 1,
-0.2734834, -1.375422, -1.598411, 0, 0, 0, 1, 1,
-0.2718383, -0.2050815, -1.940167, 0, 0, 0, 1, 1,
-0.2707011, 0.4828027, -0.1372753, 0, 0, 0, 1, 1,
-0.2694291, -0.3333351, -1.227381, 1, 1, 1, 1, 1,
-0.2682357, -0.9103776, -1.622503, 1, 1, 1, 1, 1,
-0.2574604, -0.5628983, -5.435524, 1, 1, 1, 1, 1,
-0.2569, 0.2165854, -0.3840517, 1, 1, 1, 1, 1,
-0.2430637, 0.6084318, -0.5509624, 1, 1, 1, 1, 1,
-0.2425808, 0.1251944, 0.8130724, 1, 1, 1, 1, 1,
-0.24247, -1.723222, -2.065938, 1, 1, 1, 1, 1,
-0.2412288, -0.9019161, -2.807108, 1, 1, 1, 1, 1,
-0.2374355, 0.1778278, 0.5673432, 1, 1, 1, 1, 1,
-0.2356133, -0.2945053, -3.675744, 1, 1, 1, 1, 1,
-0.2325511, 0.2751416, -0.2297194, 1, 1, 1, 1, 1,
-0.2324323, 1.882271, -0.1732049, 1, 1, 1, 1, 1,
-0.2323265, -0.1786006, -2.461154, 1, 1, 1, 1, 1,
-0.2318238, -1.244914, -2.9919, 1, 1, 1, 1, 1,
-0.2311159, 1.796246, 0.1349618, 1, 1, 1, 1, 1,
-0.2296518, -0.7865712, -4.209012, 0, 0, 1, 1, 1,
-0.2283367, -0.1049806, -1.595763, 1, 0, 0, 1, 1,
-0.2259158, -0.6346629, -2.644759, 1, 0, 0, 1, 1,
-0.2231924, -1.152526, -3.183947, 1, 0, 0, 1, 1,
-0.2220634, -0.188995, 0.3110457, 1, 0, 0, 1, 1,
-0.2217865, 0.03198748, -0.582033, 1, 0, 0, 1, 1,
-0.2195818, -1.54641, -1.178017, 0, 0, 0, 1, 1,
-0.2184522, -0.05549138, -1.790375, 0, 0, 0, 1, 1,
-0.2182875, -0.2400718, -3.962396, 0, 0, 0, 1, 1,
-0.218214, 0.2549716, -0.01899316, 0, 0, 0, 1, 1,
-0.2129679, -0.1836336, -2.160273, 0, 0, 0, 1, 1,
-0.211704, -1.581015, -2.443457, 0, 0, 0, 1, 1,
-0.2034981, 1.152583, 1.215437, 0, 0, 0, 1, 1,
-0.2032901, 0.3418449, 0.4024361, 1, 1, 1, 1, 1,
-0.1981047, -0.352679, -1.979983, 1, 1, 1, 1, 1,
-0.1949856, -1.107631, -1.751849, 1, 1, 1, 1, 1,
-0.193945, 0.06964144, -4.336755, 1, 1, 1, 1, 1,
-0.1897407, 0.8293778, 0.1895207, 1, 1, 1, 1, 1,
-0.1880026, 1.54704, 1.231729, 1, 1, 1, 1, 1,
-0.1839732, -0.6511298, -3.115847, 1, 1, 1, 1, 1,
-0.1796252, -0.4992289, -2.093208, 1, 1, 1, 1, 1,
-0.1759809, -0.6320723, -1.100782, 1, 1, 1, 1, 1,
-0.1713115, 1.018793, 0.2068424, 1, 1, 1, 1, 1,
-0.1701543, 0.6169741, -0.2733805, 1, 1, 1, 1, 1,
-0.1697347, -0.2470604, -3.187654, 1, 1, 1, 1, 1,
-0.1687096, 0.2352487, -1.273396, 1, 1, 1, 1, 1,
-0.1544799, -0.138809, -1.760776, 1, 1, 1, 1, 1,
-0.1538619, -0.4687046, -1.885472, 1, 1, 1, 1, 1,
-0.1538091, 0.08592071, -0.5257811, 0, 0, 1, 1, 1,
-0.1525583, -0.865985, -1.274939, 1, 0, 0, 1, 1,
-0.1502412, 0.03680481, -0.740205, 1, 0, 0, 1, 1,
-0.1480028, -0.3165098, -1.54174, 1, 0, 0, 1, 1,
-0.1462431, -1.150839, -1.702981, 1, 0, 0, 1, 1,
-0.1452156, 0.4845878, -1.56178, 1, 0, 0, 1, 1,
-0.1439902, 0.1434996, -0.1151195, 0, 0, 0, 1, 1,
-0.1421711, 0.197925, 0.6986731, 0, 0, 0, 1, 1,
-0.1413749, 1.849067, 0.7424148, 0, 0, 0, 1, 1,
-0.1395234, 0.6024662, -1.085836, 0, 0, 0, 1, 1,
-0.137604, 1.782679, -0.1459204, 0, 0, 0, 1, 1,
-0.1326657, 0.03231996, -0.7945114, 0, 0, 0, 1, 1,
-0.1321437, -0.6822005, -1.869925, 0, 0, 0, 1, 1,
-0.129038, 0.4347366, 0.8178514, 1, 1, 1, 1, 1,
-0.1276754, -0.1850844, -3.423553, 1, 1, 1, 1, 1,
-0.1267126, -0.5541317, -1.311397, 1, 1, 1, 1, 1,
-0.1232049, 0.396888, 0.3044848, 1, 1, 1, 1, 1,
-0.1203127, -0.4984813, -2.908915, 1, 1, 1, 1, 1,
-0.1155336, -1.023297, -2.783602, 1, 1, 1, 1, 1,
-0.1144549, 0.6003495, -1.476979, 1, 1, 1, 1, 1,
-0.1113078, -1.10102, -2.070723, 1, 1, 1, 1, 1,
-0.1063117, -0.7715944, -4.156363, 1, 1, 1, 1, 1,
-0.1044726, 0.8068875, 0.5626596, 1, 1, 1, 1, 1,
-0.1029326, 0.2001601, 0.5223041, 1, 1, 1, 1, 1,
-0.09938039, -0.4709307, -4.133785, 1, 1, 1, 1, 1,
-0.09400562, 0.231565, 2.181589, 1, 1, 1, 1, 1,
-0.09140962, -1.088611, -2.532791, 1, 1, 1, 1, 1,
-0.0846711, -0.5004861, -2.043895, 1, 1, 1, 1, 1,
-0.08262219, 0.2507097, -0.6328828, 0, 0, 1, 1, 1,
-0.0821316, -0.8910093, -4.160125, 1, 0, 0, 1, 1,
-0.08169242, -0.1162896, -4.033904, 1, 0, 0, 1, 1,
-0.07624893, 2.304288, 0.768645, 1, 0, 0, 1, 1,
-0.07569266, 1.269714, 0.1213199, 1, 0, 0, 1, 1,
-0.0750339, -1.362878, -3.633122, 1, 0, 0, 1, 1,
-0.07389484, -0.3354673, -2.432714, 0, 0, 0, 1, 1,
-0.07381852, 0.4318212, 2.925555, 0, 0, 0, 1, 1,
-0.07191543, 0.06410766, -0.5859411, 0, 0, 0, 1, 1,
-0.06975253, 0.07962468, -0.8123769, 0, 0, 0, 1, 1,
-0.06695333, -0.03891297, 0.154122, 0, 0, 0, 1, 1,
-0.06587141, 0.6520117, 0.09869491, 0, 0, 0, 1, 1,
-0.06401831, 0.6420485, 0.1888569, 0, 0, 0, 1, 1,
-0.06331128, 1.357522, 0.04780884, 1, 1, 1, 1, 1,
-0.05488583, 0.8253125, -0.4897205, 1, 1, 1, 1, 1,
-0.04846568, -0.7549834, -3.638797, 1, 1, 1, 1, 1,
-0.04711422, 0.3396463, -0.8628899, 1, 1, 1, 1, 1,
-0.04651126, 0.05897462, -1.7103, 1, 1, 1, 1, 1,
-0.04605661, 0.9303024, 0.7126767, 1, 1, 1, 1, 1,
-0.04533143, 0.1234267, 1.181716, 1, 1, 1, 1, 1,
-0.04494015, 0.6598253, -2.097935, 1, 1, 1, 1, 1,
-0.04423303, 0.61458, 0.1598832, 1, 1, 1, 1, 1,
-0.04291302, 0.5476231, -0.4695159, 1, 1, 1, 1, 1,
-0.04248938, -0.4025167, -2.661548, 1, 1, 1, 1, 1,
-0.04008061, -0.3319561, -2.155273, 1, 1, 1, 1, 1,
-0.03740887, 0.7131307, -0.3565322, 1, 1, 1, 1, 1,
-0.02865995, 0.1344909, 0.6939642, 1, 1, 1, 1, 1,
-0.02332732, -0.4996098, -4.14759, 1, 1, 1, 1, 1,
-0.0226994, 0.7383059, 0.2247916, 0, 0, 1, 1, 1,
-0.02075384, 0.1393569, 0.3684103, 1, 0, 0, 1, 1,
-0.0162475, -1.463802, -3.225382, 1, 0, 0, 1, 1,
-0.01531241, -1.635564, -4.726238, 1, 0, 0, 1, 1,
-0.01431038, -1.71431, -2.953648, 1, 0, 0, 1, 1,
-0.01383827, 0.06283458, -0.02499564, 1, 0, 0, 1, 1,
-0.01255531, 0.1859268, -0.9859976, 0, 0, 0, 1, 1,
-0.01164002, -1.546304, -2.257054, 0, 0, 0, 1, 1,
-0.01057581, -0.9959123, -2.317451, 0, 0, 0, 1, 1,
-0.01016131, 1.293671, -1.16356, 0, 0, 0, 1, 1,
-0.00978218, -0.7146049, -1.845017, 0, 0, 0, 1, 1,
-0.008485115, -1.923371, -2.98915, 0, 0, 0, 1, 1,
-0.007119853, 0.8251446, -0.4524933, 0, 0, 0, 1, 1,
-0.004231898, 0.5376968, 1.232391, 1, 1, 1, 1, 1,
-0.003542044, 0.4631318, -1.825311, 1, 1, 1, 1, 1,
-0.0006405148, -1.00255, -2.870454, 1, 1, 1, 1, 1,
0.001708277, -0.2276726, 1.300582, 1, 1, 1, 1, 1,
0.003710549, -0.005462029, 3.17264, 1, 1, 1, 1, 1,
0.005400026, -1.51312, 4.759012, 1, 1, 1, 1, 1,
0.01026458, 0.01129328, 1.622374, 1, 1, 1, 1, 1,
0.0161254, 0.6846156, 0.9000374, 1, 1, 1, 1, 1,
0.01686781, -0.1518987, 1.81317, 1, 1, 1, 1, 1,
0.01719736, 2.300949, 0.6215941, 1, 1, 1, 1, 1,
0.0181885, -1.58498, 4.786135, 1, 1, 1, 1, 1,
0.01846646, 1.569916, 1.218074, 1, 1, 1, 1, 1,
0.01895088, 0.2071219, -0.09438016, 1, 1, 1, 1, 1,
0.02413323, 0.3062437, 0.2858759, 1, 1, 1, 1, 1,
0.02473388, -1.415724, 2.360517, 1, 1, 1, 1, 1,
0.02526447, -0.7127881, 4.314635, 0, 0, 1, 1, 1,
0.028721, -0.0109565, 1.82871, 1, 0, 0, 1, 1,
0.02955614, -1.275443, 3.476579, 1, 0, 0, 1, 1,
0.03576022, -2.67169, 2.041529, 1, 0, 0, 1, 1,
0.04298713, 0.2165081, -1.523906, 1, 0, 0, 1, 1,
0.04532925, -0.186462, 0.4873521, 1, 0, 0, 1, 1,
0.04591963, 0.9741934, 1.392889, 0, 0, 0, 1, 1,
0.05555553, 0.01582931, 0.9547677, 0, 0, 0, 1, 1,
0.06149741, -0.2594258, 2.752238, 0, 0, 0, 1, 1,
0.07264535, 0.1611616, -1.022232, 0, 0, 0, 1, 1,
0.07539865, 0.4650548, 0.7828883, 0, 0, 0, 1, 1,
0.07757597, -0.1130471, 4.655736, 0, 0, 0, 1, 1,
0.0796257, -0.2163168, 4.662014, 0, 0, 0, 1, 1,
0.08530318, -0.4532868, 1.864208, 1, 1, 1, 1, 1,
0.08619343, 0.1055413, -0.5139709, 1, 1, 1, 1, 1,
0.08775996, -1.371436, 4.57985, 1, 1, 1, 1, 1,
0.08982848, -0.124919, 2.618694, 1, 1, 1, 1, 1,
0.09564299, 1.240225, 0.1907542, 1, 1, 1, 1, 1,
0.1020096, 1.169977, 1.409514, 1, 1, 1, 1, 1,
0.1117874, 2.791334, -0.3809638, 1, 1, 1, 1, 1,
0.1118513, -0.09661166, 3.544975, 1, 1, 1, 1, 1,
0.1136291, -1.009122, 4.518233, 1, 1, 1, 1, 1,
0.113821, 1.49748, 0.312891, 1, 1, 1, 1, 1,
0.1143929, 0.2753035, -0.1338925, 1, 1, 1, 1, 1,
0.1154698, 0.235542, -1.253091, 1, 1, 1, 1, 1,
0.1191775, 2.130569, -0.9806221, 1, 1, 1, 1, 1,
0.1200096, -0.6597033, 3.44893, 1, 1, 1, 1, 1,
0.1212287, -1.607391, 2.046938, 1, 1, 1, 1, 1,
0.1277075, -1.454597, 2.732604, 0, 0, 1, 1, 1,
0.1367804, -1.548488, 3.67964, 1, 0, 0, 1, 1,
0.1393665, -1.061745, 3.19363, 1, 0, 0, 1, 1,
0.149506, 0.1984698, 0.36445, 1, 0, 0, 1, 1,
0.1521305, -1.93449, 2.133061, 1, 0, 0, 1, 1,
0.1522176, 0.4378096, 0.4142831, 1, 0, 0, 1, 1,
0.1582641, -0.1540279, 3.293405, 0, 0, 0, 1, 1,
0.1612364, 1.516181, -0.3644044, 0, 0, 0, 1, 1,
0.1626737, 0.263751, 1.622835, 0, 0, 0, 1, 1,
0.1628097, 0.1716833, 1.13293, 0, 0, 0, 1, 1,
0.174021, 0.6138552, -2.56202, 0, 0, 0, 1, 1,
0.177604, -0.3077022, 3.706621, 0, 0, 0, 1, 1,
0.180528, 0.2111441, 0.3396272, 0, 0, 0, 1, 1,
0.1834743, -0.421561, -0.09513551, 1, 1, 1, 1, 1,
0.1869188, -0.0997447, 1.303901, 1, 1, 1, 1, 1,
0.1881682, -0.6655014, 3.981263, 1, 1, 1, 1, 1,
0.1924637, 1.173056, -0.3833336, 1, 1, 1, 1, 1,
0.193675, 1.083997, -0.06655128, 1, 1, 1, 1, 1,
0.1942053, 1.168441, 0.6637714, 1, 1, 1, 1, 1,
0.1979706, -0.9932477, 2.755186, 1, 1, 1, 1, 1,
0.1991296, 0.001739386, 3.102252, 1, 1, 1, 1, 1,
0.2011963, -1.229726, 2.6029, 1, 1, 1, 1, 1,
0.2016899, -0.5987546, 1.65576, 1, 1, 1, 1, 1,
0.2157031, 1.691796, 0.4580029, 1, 1, 1, 1, 1,
0.2184246, -1.925759, 3.178722, 1, 1, 1, 1, 1,
0.2185571, 0.1162055, 0.5474918, 1, 1, 1, 1, 1,
0.2192169, 0.3025392, -1.078599, 1, 1, 1, 1, 1,
0.2192498, 0.07565649, 1.168905, 1, 1, 1, 1, 1,
0.2192792, 1.983847, -0.1416525, 0, 0, 1, 1, 1,
0.2242655, 0.1113119, 2.102706, 1, 0, 0, 1, 1,
0.2305471, 1.514411, 1.193254, 1, 0, 0, 1, 1,
0.2310312, -0.6094451, 1.376344, 1, 0, 0, 1, 1,
0.2311165, -0.1808413, 2.739432, 1, 0, 0, 1, 1,
0.2365231, -1.070854, 4.048428, 1, 0, 0, 1, 1,
0.2375856, -0.3390108, 2.885427, 0, 0, 0, 1, 1,
0.2401237, -0.4334606, 2.891192, 0, 0, 0, 1, 1,
0.2416236, 0.9819763, 1.433025, 0, 0, 0, 1, 1,
0.2419321, 0.6565323, -0.3386313, 0, 0, 0, 1, 1,
0.2460703, -0.5722961, 2.57054, 0, 0, 0, 1, 1,
0.247576, -1.416633, 3.584716, 0, 0, 0, 1, 1,
0.2477228, 0.6353375, 0.1636035, 0, 0, 0, 1, 1,
0.2500596, 1.691832, 0.3553641, 1, 1, 1, 1, 1,
0.2556463, -0.9195094, 1.953337, 1, 1, 1, 1, 1,
0.2563761, 0.1616059, 0.5563474, 1, 1, 1, 1, 1,
0.2581078, 1.271545, 1.081316, 1, 1, 1, 1, 1,
0.2592005, 0.1551678, 1.948622, 1, 1, 1, 1, 1,
0.264779, -2.183449, 4.221349, 1, 1, 1, 1, 1,
0.2692537, -0.9276493, 2.329492, 1, 1, 1, 1, 1,
0.270543, -2.128935, 2.918752, 1, 1, 1, 1, 1,
0.2739165, -2.009554, 2.764229, 1, 1, 1, 1, 1,
0.2754501, 0.1487535, -0.6442388, 1, 1, 1, 1, 1,
0.2810594, -1.327228, 3.49182, 1, 1, 1, 1, 1,
0.2944925, 0.3172008, 0.8316671, 1, 1, 1, 1, 1,
0.2949004, -1.260101, 3.11548, 1, 1, 1, 1, 1,
0.2952887, 0.2905025, 0.3525732, 1, 1, 1, 1, 1,
0.2974071, -1.643899, 2.995792, 1, 1, 1, 1, 1,
0.3036869, -0.1375018, 2.770906, 0, 0, 1, 1, 1,
0.3069538, -0.2048059, 0.9509123, 1, 0, 0, 1, 1,
0.31025, -0.5031871, 4.53023, 1, 0, 0, 1, 1,
0.3119963, 0.2737673, 1.204745, 1, 0, 0, 1, 1,
0.3142136, -0.9152958, 3.20502, 1, 0, 0, 1, 1,
0.3198638, 0.4203092, 0.7530872, 1, 0, 0, 1, 1,
0.3276458, 0.1671817, 0.5168142, 0, 0, 0, 1, 1,
0.3286234, 0.6497135, -0.2623545, 0, 0, 0, 1, 1,
0.3311415, 0.004460006, 3.21814, 0, 0, 0, 1, 1,
0.3318926, 0.2249392, 1.810011, 0, 0, 0, 1, 1,
0.3372328, 0.5689723, 1.331334, 0, 0, 0, 1, 1,
0.3385954, 0.6923376, -0.1881294, 0, 0, 0, 1, 1,
0.339436, 1.245269, -1.047202, 0, 0, 0, 1, 1,
0.3397031, 0.9188778, -1.853599, 1, 1, 1, 1, 1,
0.3408161, 0.4430588, 1.718613, 1, 1, 1, 1, 1,
0.3438576, -0.3194843, 3.309961, 1, 1, 1, 1, 1,
0.3478087, -0.03673493, 1.658336, 1, 1, 1, 1, 1,
0.3505625, -1.612999, 2.533831, 1, 1, 1, 1, 1,
0.3520194, -2.497966, 3.168293, 1, 1, 1, 1, 1,
0.3533638, -2.097434, 2.068867, 1, 1, 1, 1, 1,
0.3551979, -0.1336354, 1.527584, 1, 1, 1, 1, 1,
0.3615902, 0.3196406, 0.679965, 1, 1, 1, 1, 1,
0.3671049, -0.04696152, 3.542745, 1, 1, 1, 1, 1,
0.3673055, 0.9887009, 0.5064322, 1, 1, 1, 1, 1,
0.3684629, -0.619406, 2.99013, 1, 1, 1, 1, 1,
0.3698291, 1.693363, -0.3275189, 1, 1, 1, 1, 1,
0.3711706, -0.9272628, 2.539037, 1, 1, 1, 1, 1,
0.381856, 0.6772493, -0.4776947, 1, 1, 1, 1, 1,
0.3830614, -1.324474, 2.900307, 0, 0, 1, 1, 1,
0.3952126, 0.6715585, 1.449974, 1, 0, 0, 1, 1,
0.3978063, 1.135449, 0.02505351, 1, 0, 0, 1, 1,
0.3982293, 0.6652638, 0.5163457, 1, 0, 0, 1, 1,
0.3995646, -1.058257, 3.915093, 1, 0, 0, 1, 1,
0.4026434, -0.03470002, 1.515689, 1, 0, 0, 1, 1,
0.4069242, -1.809089, 1.968989, 0, 0, 0, 1, 1,
0.4093889, -0.8128889, 2.429229, 0, 0, 0, 1, 1,
0.4145297, -1.603494, 2.05918, 0, 0, 0, 1, 1,
0.4154962, -1.449097, 2.780616, 0, 0, 0, 1, 1,
0.4160435, 0.1764968, 1.204906, 0, 0, 0, 1, 1,
0.4169085, 0.3943936, 0.234733, 0, 0, 0, 1, 1,
0.4197811, 0.4771337, 1.818209, 0, 0, 0, 1, 1,
0.4202301, 1.525143, 2.663103, 1, 1, 1, 1, 1,
0.4204155, -0.0003479327, 1.193053, 1, 1, 1, 1, 1,
0.4230577, -0.2283177, 2.604825, 1, 1, 1, 1, 1,
0.4246645, 1.006439, 1.825352, 1, 1, 1, 1, 1,
0.4271753, -0.075795, 0.8196193, 1, 1, 1, 1, 1,
0.4291543, 0.3292776, 2.277565, 1, 1, 1, 1, 1,
0.4354928, 0.938472, 0.09688311, 1, 1, 1, 1, 1,
0.4368519, -0.6313891, 3.006508, 1, 1, 1, 1, 1,
0.4386071, -1.900759, 2.826987, 1, 1, 1, 1, 1,
0.439393, -0.3933744, 2.553768, 1, 1, 1, 1, 1,
0.441916, -0.09365995, 2.610616, 1, 1, 1, 1, 1,
0.4450336, 1.680553, -0.09308004, 1, 1, 1, 1, 1,
0.4519801, 0.9106337, 0.8592616, 1, 1, 1, 1, 1,
0.4523638, 0.7553791, 0.5389805, 1, 1, 1, 1, 1,
0.4564106, -0.4779264, 2.874583, 1, 1, 1, 1, 1,
0.4585405, 0.9573963, 2.484982, 0, 0, 1, 1, 1,
0.4631924, -0.1453475, 2.161861, 1, 0, 0, 1, 1,
0.4633487, 0.04204859, 2.711378, 1, 0, 0, 1, 1,
0.4638504, -0.5399569, 3.266525, 1, 0, 0, 1, 1,
0.4640425, -0.3358969, 2.145418, 1, 0, 0, 1, 1,
0.4731399, 0.0151392, 0.7202221, 1, 0, 0, 1, 1,
0.473192, -0.1346017, 2.336336, 0, 0, 0, 1, 1,
0.4748979, 1.119378, 1.128462, 0, 0, 0, 1, 1,
0.4762142, 0.53892, 1.07533, 0, 0, 0, 1, 1,
0.4780355, -0.50383, 1.504094, 0, 0, 0, 1, 1,
0.4819469, -0.2051548, 2.049823, 0, 0, 0, 1, 1,
0.486564, 1.469607, 0.0776462, 0, 0, 0, 1, 1,
0.4866061, -0.1403694, 2.429071, 0, 0, 0, 1, 1,
0.4879129, -1.587109, 0.5749296, 1, 1, 1, 1, 1,
0.4932738, -0.3286089, 1.262902, 1, 1, 1, 1, 1,
0.497034, -0.4479389, 0.373841, 1, 1, 1, 1, 1,
0.5003914, 1.990765, -0.2739697, 1, 1, 1, 1, 1,
0.5012718, 1.388842, -0.1502637, 1, 1, 1, 1, 1,
0.5017021, -0.4953563, 2.947199, 1, 1, 1, 1, 1,
0.5034481, -0.250268, 2.75179, 1, 1, 1, 1, 1,
0.5073952, 1.523331, 1.631183, 1, 1, 1, 1, 1,
0.5104997, 0.3501109, 1.849015, 1, 1, 1, 1, 1,
0.5158247, -1.479992, 3.329668, 1, 1, 1, 1, 1,
0.5205007, -0.245962, 2.293314, 1, 1, 1, 1, 1,
0.5256151, -0.5629635, 2.290883, 1, 1, 1, 1, 1,
0.527934, 0.5443272, 0.7869858, 1, 1, 1, 1, 1,
0.5308986, 0.9589276, -0.4795477, 1, 1, 1, 1, 1,
0.531863, -0.701681, 4.171707, 1, 1, 1, 1, 1,
0.5327626, 0.2289908, 2.329804, 0, 0, 1, 1, 1,
0.5330507, 1.154993, -0.8909398, 1, 0, 0, 1, 1,
0.5339392, -0.1618423, 2.145508, 1, 0, 0, 1, 1,
0.5346965, -0.2174522, 0.6643562, 1, 0, 0, 1, 1,
0.543552, 0.7612174, -0.137896, 1, 0, 0, 1, 1,
0.5446062, 0.1408112, 0.2268266, 1, 0, 0, 1, 1,
0.5492133, -1.505387, 2.602293, 0, 0, 0, 1, 1,
0.5508132, 0.414919, 0.3986807, 0, 0, 0, 1, 1,
0.5512915, 0.2732852, 0.9691771, 0, 0, 0, 1, 1,
0.5524327, -1.544258, 4.216073, 0, 0, 0, 1, 1,
0.5536369, 0.5526648, 1.983648, 0, 0, 0, 1, 1,
0.558466, -0.3836766, 1.093388, 0, 0, 0, 1, 1,
0.5590474, 0.1030858, 1.318582, 0, 0, 0, 1, 1,
0.5684642, 0.2874506, 1.399813, 1, 1, 1, 1, 1,
0.5698177, -1.731493, 1.473875, 1, 1, 1, 1, 1,
0.5700102, 0.3003128, -0.4968883, 1, 1, 1, 1, 1,
0.5755575, 0.1716716, 2.129355, 1, 1, 1, 1, 1,
0.5775254, -0.08898059, 1.273813, 1, 1, 1, 1, 1,
0.5776951, -1.424788, 2.795131, 1, 1, 1, 1, 1,
0.5821687, 0.9277235, 0.4544243, 1, 1, 1, 1, 1,
0.5828858, -0.4167303, 2.61186, 1, 1, 1, 1, 1,
0.5844296, 0.1098017, 1.115041, 1, 1, 1, 1, 1,
0.590987, 0.2926276, 2.013181, 1, 1, 1, 1, 1,
0.5940405, -0.0752359, 1.739803, 1, 1, 1, 1, 1,
0.594654, -0.8577991, 3.921591, 1, 1, 1, 1, 1,
0.5986127, 0.6036677, 0.6013126, 1, 1, 1, 1, 1,
0.6034338, 1.21481, 0.1876695, 1, 1, 1, 1, 1,
0.6065295, -1.40488, 2.265349, 1, 1, 1, 1, 1,
0.607402, -0.06490713, 1.451639, 0, 0, 1, 1, 1,
0.6117083, -0.8041664, 1.727552, 1, 0, 0, 1, 1,
0.6119248, 0.00249339, 1.95246, 1, 0, 0, 1, 1,
0.6221951, 0.5639397, 1.88525, 1, 0, 0, 1, 1,
0.622781, 0.815363, 0.2604282, 1, 0, 0, 1, 1,
0.6269821, 0.4346018, 0.5536844, 1, 0, 0, 1, 1,
0.6273585, -1.128565, 3.775279, 0, 0, 0, 1, 1,
0.6309541, 0.3661992, 1.485618, 0, 0, 0, 1, 1,
0.6349799, -1.514324, 1.326575, 0, 0, 0, 1, 1,
0.6416937, -0.4820046, 3.581153, 0, 0, 0, 1, 1,
0.6450698, 2.00951, 1.134535, 0, 0, 0, 1, 1,
0.6537054, -0.135806, -0.02282977, 0, 0, 0, 1, 1,
0.6618567, 0.5628354, -1.008703, 0, 0, 0, 1, 1,
0.6632513, -0.1313754, 4.170278, 1, 1, 1, 1, 1,
0.6661482, 0.5278257, 1.140984, 1, 1, 1, 1, 1,
0.6720144, 2.40242, 1.611125, 1, 1, 1, 1, 1,
0.6779001, 0.1683329, -0.4970513, 1, 1, 1, 1, 1,
0.6822035, 1.429275, 1.360152, 1, 1, 1, 1, 1,
0.6823546, 0.346019, 0.7336206, 1, 1, 1, 1, 1,
0.6835846, -0.6162763, 0.7971374, 1, 1, 1, 1, 1,
0.6844281, -1.345883, 3.882612, 1, 1, 1, 1, 1,
0.694781, -1.30543, 3.482393, 1, 1, 1, 1, 1,
0.6968355, -0.780782, 2.895215, 1, 1, 1, 1, 1,
0.6995212, 0.5283121, 1.094047, 1, 1, 1, 1, 1,
0.7021037, -0.6560159, 2.54567, 1, 1, 1, 1, 1,
0.7048791, -1.1362, 1.983565, 1, 1, 1, 1, 1,
0.7056406, 0.3741908, 0.6719574, 1, 1, 1, 1, 1,
0.708131, 0.4093576, -0.006707702, 1, 1, 1, 1, 1,
0.7140874, 0.1840055, 2.010978, 0, 0, 1, 1, 1,
0.7180986, 1.035225, 1.980962, 1, 0, 0, 1, 1,
0.719935, -0.2809712, 0.3250416, 1, 0, 0, 1, 1,
0.7228038, 0.5595125, -0.06217882, 1, 0, 0, 1, 1,
0.7282361, 0.2934675, 0.1825623, 1, 0, 0, 1, 1,
0.7291088, 0.2969095, -0.7583086, 1, 0, 0, 1, 1,
0.7323495, 0.1143549, 1.727297, 0, 0, 0, 1, 1,
0.7330103, 1.715562, 1.52741, 0, 0, 0, 1, 1,
0.7351111, 1.331309, 0.8186256, 0, 0, 0, 1, 1,
0.7374765, -0.1473705, 2.780907, 0, 0, 0, 1, 1,
0.7404986, 1.637548, 0.4681583, 0, 0, 0, 1, 1,
0.7410679, 1.000345, 0.8993504, 0, 0, 0, 1, 1,
0.7461938, 0.6246456, 0.9665939, 0, 0, 0, 1, 1,
0.7466949, 0.1916683, 0.4727769, 1, 1, 1, 1, 1,
0.7489028, -1.204149, 3.307418, 1, 1, 1, 1, 1,
0.7527457, -0.260375, 2.868062, 1, 1, 1, 1, 1,
0.7553563, 0.4327092, 1.045224, 1, 1, 1, 1, 1,
0.7555532, -0.9210629, 0.850336, 1, 1, 1, 1, 1,
0.7555781, 1.957163, 0.3569979, 1, 1, 1, 1, 1,
0.7583524, -0.3742347, 3.345731, 1, 1, 1, 1, 1,
0.7613726, 0.8370989, 1.311978, 1, 1, 1, 1, 1,
0.7613904, -1.140901, 4.836789, 1, 1, 1, 1, 1,
0.7630215, -0.4992938, 3.376128, 1, 1, 1, 1, 1,
0.7631991, 0.8171324, 1.629534, 1, 1, 1, 1, 1,
0.7705937, 0.7466729, 0.6932206, 1, 1, 1, 1, 1,
0.7789975, -0.184352, 0.7264996, 1, 1, 1, 1, 1,
0.7809253, 0.3829807, -0.354743, 1, 1, 1, 1, 1,
0.790966, 0.7627647, 0.5055099, 1, 1, 1, 1, 1,
0.7963774, 0.8422913, 0.4016451, 0, 0, 1, 1, 1,
0.8026271, 0.362233, 0.7629491, 1, 0, 0, 1, 1,
0.8045271, 0.09782699, 1.574526, 1, 0, 0, 1, 1,
0.8046913, 0.7356479, 0.4885153, 1, 0, 0, 1, 1,
0.8066176, 0.5360169, -0.2585382, 1, 0, 0, 1, 1,
0.8135363, 0.0900291, 1.402392, 1, 0, 0, 1, 1,
0.8174155, 1.568005, 0.7259002, 0, 0, 0, 1, 1,
0.8178222, 0.1685717, -0.5963583, 0, 0, 0, 1, 1,
0.8199651, -0.5864094, 3.447029, 0, 0, 0, 1, 1,
0.8216604, 1.010476, -0.1262522, 0, 0, 0, 1, 1,
0.8228771, -0.7570953, 1.877436, 0, 0, 0, 1, 1,
0.8290393, 0.5162988, 0.3778899, 0, 0, 0, 1, 1,
0.8323572, 0.7261947, -0.0003807811, 0, 0, 0, 1, 1,
0.8386042, 0.5863309, -0.3954727, 1, 1, 1, 1, 1,
0.8438458, -0.2527612, 1.97264, 1, 1, 1, 1, 1,
0.8454114, -1.531333, 3.0037, 1, 1, 1, 1, 1,
0.8461687, 0.05484251, 2.080834, 1, 1, 1, 1, 1,
0.8473893, 0.1567268, 0.483773, 1, 1, 1, 1, 1,
0.849642, 1.504823, -1.759992, 1, 1, 1, 1, 1,
0.8599299, 0.8204687, 0.4372958, 1, 1, 1, 1, 1,
0.8600349, -1.126336, 2.786111, 1, 1, 1, 1, 1,
0.8643406, 0.4554685, -0.02734803, 1, 1, 1, 1, 1,
0.8696647, 0.7734123, 2.486546, 1, 1, 1, 1, 1,
0.8735178, -0.2813832, 0.921238, 1, 1, 1, 1, 1,
0.8770538, -0.8459169, 1.60512, 1, 1, 1, 1, 1,
0.8783092, -0.684112, 0.9858308, 1, 1, 1, 1, 1,
0.8818856, 0.2120136, 0.4490496, 1, 1, 1, 1, 1,
0.8855329, -1.951205, 1.549431, 1, 1, 1, 1, 1,
0.8896616, -0.3717431, 2.50953, 0, 0, 1, 1, 1,
0.8949536, 0.760035, 0.5763671, 1, 0, 0, 1, 1,
0.8962884, -0.863791, 2.536757, 1, 0, 0, 1, 1,
0.8965249, 0.5102761, 2.418034, 1, 0, 0, 1, 1,
0.8985012, -1.060511, 2.204956, 1, 0, 0, 1, 1,
0.8996412, 0.1003526, 1.126895, 1, 0, 0, 1, 1,
0.9006113, -0.4420348, 3.564068, 0, 0, 0, 1, 1,
0.9030649, -0.0917088, 3.150764, 0, 0, 0, 1, 1,
0.9046516, -0.6909973, 3.352155, 0, 0, 0, 1, 1,
0.905041, -0.330265, 1.304988, 0, 0, 0, 1, 1,
0.9069484, -2.177531, 2.537299, 0, 0, 0, 1, 1,
0.9083879, 0.5886968, 3.119045, 0, 0, 0, 1, 1,
0.9159474, -1.015618, 3.836966, 0, 0, 0, 1, 1,
0.9213712, -1.185586, 1.550135, 1, 1, 1, 1, 1,
0.9220556, 1.623924, 0.6073548, 1, 1, 1, 1, 1,
0.9249727, 1.239473, 1.752214, 1, 1, 1, 1, 1,
0.9256727, 0.2002058, 2.945632, 1, 1, 1, 1, 1,
0.9276577, -0.2244566, 1.797989, 1, 1, 1, 1, 1,
0.9285189, -0.5296617, 2.652743, 1, 1, 1, 1, 1,
0.9321953, 0.510443, 0.6126402, 1, 1, 1, 1, 1,
0.9341892, 0.8115972, 0.306771, 1, 1, 1, 1, 1,
0.9352415, 0.2235497, 1.172079, 1, 1, 1, 1, 1,
0.9383295, -1.445216, 4.368154, 1, 1, 1, 1, 1,
0.9423678, 1.223609, -1.920847, 1, 1, 1, 1, 1,
0.9434751, 1.766686, 0.222407, 1, 1, 1, 1, 1,
0.947953, 0.08182509, 2.495766, 1, 1, 1, 1, 1,
0.9484513, 0.5179185, -0.04472081, 1, 1, 1, 1, 1,
0.9496494, -0.8753609, 1.241307, 1, 1, 1, 1, 1,
0.949945, -0.2104828, 1.66179, 0, 0, 1, 1, 1,
0.9526018, 0.2279856, 2.207148, 1, 0, 0, 1, 1,
0.9572846, -0.01463578, 0.7604861, 1, 0, 0, 1, 1,
0.9599723, -0.1082954, 0.8378755, 1, 0, 0, 1, 1,
0.9676235, 1.937294, 1.319755, 1, 0, 0, 1, 1,
0.967887, 1.816069, -0.8132688, 1, 0, 0, 1, 1,
0.9686059, -1.658082, 1.80174, 0, 0, 0, 1, 1,
0.9699565, -0.7309335, 2.277624, 0, 0, 0, 1, 1,
0.9717615, -0.9432941, 3.094285, 0, 0, 0, 1, 1,
0.9756441, -0.6904545, 2.808527, 0, 0, 0, 1, 1,
0.976187, -0.3670517, 1.780455, 0, 0, 0, 1, 1,
0.9776365, 1.488087, 0.7065675, 0, 0, 0, 1, 1,
0.9802239, 0.6385366, 0.5064796, 0, 0, 0, 1, 1,
0.9817899, 0.5104738, 1.527125, 1, 1, 1, 1, 1,
0.9851565, -0.0329041, 2.896893, 1, 1, 1, 1, 1,
0.988263, 0.02195475, 2.737665, 1, 1, 1, 1, 1,
1.002777, -0.5545568, 2.940033, 1, 1, 1, 1, 1,
1.00285, -0.3371194, 1.923478, 1, 1, 1, 1, 1,
1.010453, -0.4382152, 0.5006667, 1, 1, 1, 1, 1,
1.014116, 0.5075107, 2.082823, 1, 1, 1, 1, 1,
1.018738, -1.401149, 1.170928, 1, 1, 1, 1, 1,
1.020376, -0.3143491, 0.5648647, 1, 1, 1, 1, 1,
1.02167, 0.9069591, -0.1094527, 1, 1, 1, 1, 1,
1.022104, 1.574993, 0.09403002, 1, 1, 1, 1, 1,
1.042289, 0.7673963, 2.872105, 1, 1, 1, 1, 1,
1.046488, -0.3599137, 1.837878, 1, 1, 1, 1, 1,
1.053128, -0.4546221, 4.187747, 1, 1, 1, 1, 1,
1.05399, -1.163781, 1.731017, 1, 1, 1, 1, 1,
1.066428, -0.3422889, 1.878438, 0, 0, 1, 1, 1,
1.070593, -0.1462779, 1.950384, 1, 0, 0, 1, 1,
1.074448, 0.2324513, 1.752147, 1, 0, 0, 1, 1,
1.080259, -0.04555194, 1.450254, 1, 0, 0, 1, 1,
1.083748, 0.3439927, 2.478657, 1, 0, 0, 1, 1,
1.089892, 0.1420794, 2.0646, 1, 0, 0, 1, 1,
1.092306, 0.9060508, -1.405639, 0, 0, 0, 1, 1,
1.097595, 1.266718, 0.295239, 0, 0, 0, 1, 1,
1.098091, 0.4228427, 0.4951411, 0, 0, 0, 1, 1,
1.106941, 1.383067, -1.052832, 0, 0, 0, 1, 1,
1.107613, 1.170292, 1.107533, 0, 0, 0, 1, 1,
1.107665, -0.5665157, 1.425343, 0, 0, 0, 1, 1,
1.112538, 0.5226993, 1.224026, 0, 0, 0, 1, 1,
1.116122, 0.5993404, 1.421832, 1, 1, 1, 1, 1,
1.127746, -0.1777115, 2.486944, 1, 1, 1, 1, 1,
1.128038, 0.408702, -0.1103634, 1, 1, 1, 1, 1,
1.152817, 0.8485971, 0.292368, 1, 1, 1, 1, 1,
1.153589, -0.9996319, 0.6120899, 1, 1, 1, 1, 1,
1.158132, 0.3908049, 1.65046, 1, 1, 1, 1, 1,
1.166615, -0.6089849, 2.65511, 1, 1, 1, 1, 1,
1.16878, -1.46574, 2.534041, 1, 1, 1, 1, 1,
1.188476, -0.5823481, 1.981117, 1, 1, 1, 1, 1,
1.192163, 1.102132, -0.4807179, 1, 1, 1, 1, 1,
1.192805, 0.4712518, 0.8287314, 1, 1, 1, 1, 1,
1.194145, -0.6003748, 3.040078, 1, 1, 1, 1, 1,
1.19478, 0.7020665, 1.247458, 1, 1, 1, 1, 1,
1.197647, -0.8552235, 2.532863, 1, 1, 1, 1, 1,
1.199036, 1.403096, -0.85487, 1, 1, 1, 1, 1,
1.210179, -0.4271167, 2.243695, 0, 0, 1, 1, 1,
1.215246, 1.463275, -1.273115, 1, 0, 0, 1, 1,
1.236835, 0.4130788, 0.9810281, 1, 0, 0, 1, 1,
1.240008, -0.9304163, 3.830899, 1, 0, 0, 1, 1,
1.240302, -0.9474502, 0.7276239, 1, 0, 0, 1, 1,
1.245378, -0.4559122, 2.588522, 1, 0, 0, 1, 1,
1.24908, 1.630245, 1.381479, 0, 0, 0, 1, 1,
1.250664, 0.3078735, 0.8589736, 0, 0, 0, 1, 1,
1.253634, -0.7471408, 3.240133, 0, 0, 0, 1, 1,
1.253775, 1.192095, 0.4747185, 0, 0, 0, 1, 1,
1.255518, 0.383976, 1.899545, 0, 0, 0, 1, 1,
1.257347, 1.034768, 0.4378762, 0, 0, 0, 1, 1,
1.26077, -2.200261, 3.499753, 0, 0, 0, 1, 1,
1.263957, 0.3045924, 0.3806228, 1, 1, 1, 1, 1,
1.266856, 1.348256, -0.1727169, 1, 1, 1, 1, 1,
1.280375, -0.0900855, 2.614382, 1, 1, 1, 1, 1,
1.283017, -1.11218, 1.109467, 1, 1, 1, 1, 1,
1.285733, 1.488376, -0.5308155, 1, 1, 1, 1, 1,
1.287518, -0.3999719, 1.640885, 1, 1, 1, 1, 1,
1.289434, -0.7441697, 2.918413, 1, 1, 1, 1, 1,
1.291481, 0.8460317, 3.233067, 1, 1, 1, 1, 1,
1.318604, -0.5013595, 1.907363, 1, 1, 1, 1, 1,
1.318838, -0.2864055, 2.030005, 1, 1, 1, 1, 1,
1.318927, -1.976535, 2.64282, 1, 1, 1, 1, 1,
1.321883, -0.1234657, 2.607737, 1, 1, 1, 1, 1,
1.336737, -0.745774, 2.158146, 1, 1, 1, 1, 1,
1.337253, -2.534486, 2.851124, 1, 1, 1, 1, 1,
1.338878, -0.02653557, 1.168008, 1, 1, 1, 1, 1,
1.362299, -1.370632, 2.421208, 0, 0, 1, 1, 1,
1.374777, 0.6016431, 2.204683, 1, 0, 0, 1, 1,
1.375708, -0.03635086, 2.699938, 1, 0, 0, 1, 1,
1.383418, -0.9621807, 2.030661, 1, 0, 0, 1, 1,
1.401199, 1.762015, 1.767345, 1, 0, 0, 1, 1,
1.409184, 0.1799399, 2.876412, 1, 0, 0, 1, 1,
1.416219, -0.7126195, 2.85881, 0, 0, 0, 1, 1,
1.41622, -1.199281, 2.058074, 0, 0, 0, 1, 1,
1.429866, -0.5411442, 3.439109, 0, 0, 0, 1, 1,
1.443952, -0.4676697, 3.781023, 0, 0, 0, 1, 1,
1.462921, 0.3423015, 2.206612, 0, 0, 0, 1, 1,
1.463732, 1.706787, 1.366605, 0, 0, 0, 1, 1,
1.49254, 0.2866529, 1.441145, 0, 0, 0, 1, 1,
1.503664, 0.1383475, -0.1308822, 1, 1, 1, 1, 1,
1.525413, 0.4970525, 3.655358, 1, 1, 1, 1, 1,
1.528851, -1.382736, 2.945608, 1, 1, 1, 1, 1,
1.537097, 1.282008, 0.8132471, 1, 1, 1, 1, 1,
1.543183, -0.002857304, 1.223116, 1, 1, 1, 1, 1,
1.550354, 1.495619, 0.221231, 1, 1, 1, 1, 1,
1.55678, -0.4663497, 2.895238, 1, 1, 1, 1, 1,
1.563184, -0.2294313, 1.661489, 1, 1, 1, 1, 1,
1.572582, 0.2572477, 0.617286, 1, 1, 1, 1, 1,
1.57371, 1.022942, 0.2815352, 1, 1, 1, 1, 1,
1.583176, -1.868907, 3.763973, 1, 1, 1, 1, 1,
1.587643, -0.7761669, 2.454948, 1, 1, 1, 1, 1,
1.590474, -1.257071, 3.274294, 1, 1, 1, 1, 1,
1.606864, -0.2277329, 1.436978, 1, 1, 1, 1, 1,
1.610137, -0.2351812, 1.618726, 1, 1, 1, 1, 1,
1.622718, 2.03162, 0.5134853, 0, 0, 1, 1, 1,
1.633631, -1.366061, 3.02938, 1, 0, 0, 1, 1,
1.636754, -0.4205664, 2.186473, 1, 0, 0, 1, 1,
1.642538, 1.116398, 1.783976, 1, 0, 0, 1, 1,
1.647963, -1.54152, 2.35057, 1, 0, 0, 1, 1,
1.654725, 0.6297202, 1.487952, 1, 0, 0, 1, 1,
1.667683, -1.638032, 3.231793, 0, 0, 0, 1, 1,
1.701597, -1.321214, 2.502601, 0, 0, 0, 1, 1,
1.725312, 1.010689, 1.123942, 0, 0, 0, 1, 1,
1.737915, -1.636248, 2.526049, 0, 0, 0, 1, 1,
1.738001, -1.418728, 2.394596, 0, 0, 0, 1, 1,
1.772045, -0.2725616, 1.496175, 0, 0, 0, 1, 1,
1.784404, 1.250773, -0.6957036, 0, 0, 0, 1, 1,
1.819586, 1.054083, 1.196381, 1, 1, 1, 1, 1,
1.828775, -1.352089, 0.7862977, 1, 1, 1, 1, 1,
1.833129, 1.499045, -0.3425647, 1, 1, 1, 1, 1,
1.83399, -0.5716925, 2.198298, 1, 1, 1, 1, 1,
1.844898, 0.5900881, 1.495495, 1, 1, 1, 1, 1,
1.902784, 0.3711758, 0.7573728, 1, 1, 1, 1, 1,
1.913329, -1.453798, 1.834788, 1, 1, 1, 1, 1,
1.925214, 1.433023, -0.1437301, 1, 1, 1, 1, 1,
1.933872, 1.057572, 0.6558738, 1, 1, 1, 1, 1,
1.965351, 1.290067, 2.171, 1, 1, 1, 1, 1,
1.965465, 0.5034865, 1.052573, 1, 1, 1, 1, 1,
1.972454, -0.2553077, 2.936342, 1, 1, 1, 1, 1,
1.976938, 0.2881222, 0.3174832, 1, 1, 1, 1, 1,
1.984505, 0.5314161, 2.278328, 1, 1, 1, 1, 1,
1.986837, -1.011848, 1.029037, 1, 1, 1, 1, 1,
2.013386, -1.903225, 2.471066, 0, 0, 1, 1, 1,
2.026895, 0.9207023, 1.349757, 1, 0, 0, 1, 1,
2.032114, -0.7421262, 0.9055554, 1, 0, 0, 1, 1,
2.038074, -1.602395, 1.605914, 1, 0, 0, 1, 1,
2.136117, 0.3894798, 0.2897131, 1, 0, 0, 1, 1,
2.151533, -0.4752117, 2.902512, 1, 0, 0, 1, 1,
2.176914, -0.3340448, 1.928674, 0, 0, 0, 1, 1,
2.191038, -0.2660235, 2.157966, 0, 0, 0, 1, 1,
2.225815, -0.9399153, 0.4624757, 0, 0, 0, 1, 1,
2.279972, 2.577366, -0.9674642, 0, 0, 0, 1, 1,
2.295233, -0.3169802, 1.223157, 0, 0, 0, 1, 1,
2.299576, -0.4033815, 1.915451, 0, 0, 0, 1, 1,
2.307495, 1.20131, -0.3501601, 0, 0, 0, 1, 1,
2.471678, -0.9274054, 1.551668, 1, 1, 1, 1, 1,
2.582486, 0.4953246, 1.114914, 1, 1, 1, 1, 1,
2.590829, -0.79542, 0.537215, 1, 1, 1, 1, 1,
2.60892, -0.4888635, 0.759895, 1, 1, 1, 1, 1,
2.628867, -0.8920975, 3.884511, 1, 1, 1, 1, 1,
2.643252, -1.322949, 1.876262, 1, 1, 1, 1, 1,
2.834661, -1.476747, 2.076669, 1, 1, 1, 1, 1
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
var radius = 9.306788;
var distance = 32.6897;
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
mvMatrix.translate( 0.1214223, 0.06550312, 0.2993677 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.6897);
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
