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
-3.33849, -0.1594439, -1.442483, 1, 0, 0, 1,
-2.765085, -0.660646, -1.525565, 1, 0.007843138, 0, 1,
-2.754844, 1.656529, -0.8409966, 1, 0.01176471, 0, 1,
-2.683569, -0.3438796, -2.107755, 1, 0.01960784, 0, 1,
-2.654678, 0.309196, -0.8359899, 1, 0.02352941, 0, 1,
-2.57291, 0.5918257, -2.591889, 1, 0.03137255, 0, 1,
-2.530428, -0.3567237, -2.449168, 1, 0.03529412, 0, 1,
-2.505399, 0.2942342, 1.42157, 1, 0.04313726, 0, 1,
-2.445604, 0.5352588, -2.210902, 1, 0.04705882, 0, 1,
-2.428457, 1.14379, 0.3203228, 1, 0.05490196, 0, 1,
-2.401767, -0.3239134, -1.199281, 1, 0.05882353, 0, 1,
-2.400032, -0.2943557, -1.892612, 1, 0.06666667, 0, 1,
-2.396349, 1.046315, -0.3014609, 1, 0.07058824, 0, 1,
-2.385803, -1.425381, -1.090588, 1, 0.07843138, 0, 1,
-2.361031, -1.107462, -3.576176, 1, 0.08235294, 0, 1,
-2.358044, 1.67119, -0.5424683, 1, 0.09019608, 0, 1,
-2.34294, -0.0395934, -2.258873, 1, 0.09411765, 0, 1,
-2.322914, -1.112041, -1.629547, 1, 0.1019608, 0, 1,
-2.264919, -0.3936309, -0.1733962, 1, 0.1098039, 0, 1,
-2.245728, -0.5856428, -2.533392, 1, 0.1137255, 0, 1,
-2.163893, -0.5927593, -2.643497, 1, 0.1215686, 0, 1,
-2.142492, 0.04199776, -1.165546, 1, 0.1254902, 0, 1,
-2.136637, 1.282531, 0.09333058, 1, 0.1333333, 0, 1,
-2.122807, -0.03528889, -1.529458, 1, 0.1372549, 0, 1,
-2.097605, -1.525104, -3.728774, 1, 0.145098, 0, 1,
-2.081634, -0.3314364, -1.890418, 1, 0.1490196, 0, 1,
-2.071135, -0.9492716, -2.114896, 1, 0.1568628, 0, 1,
-2.01862, 0.1079114, -1.514672, 1, 0.1607843, 0, 1,
-2.009376, -0.7987705, -3.877935, 1, 0.1686275, 0, 1,
-1.990779, 0.744256, -2.280443, 1, 0.172549, 0, 1,
-1.969943, -0.8465639, -1.450695, 1, 0.1803922, 0, 1,
-1.898425, -0.8030504, -1.502448, 1, 0.1843137, 0, 1,
-1.886531, 0.1864344, -2.787074, 1, 0.1921569, 0, 1,
-1.853951, 0.1567946, -1.038587, 1, 0.1960784, 0, 1,
-1.817108, -1.08857, -1.053204, 1, 0.2039216, 0, 1,
-1.763097, 0.713123, -3.001333, 1, 0.2117647, 0, 1,
-1.749876, -0.1442738, -0.3707992, 1, 0.2156863, 0, 1,
-1.744698, -0.162455, 0.1128648, 1, 0.2235294, 0, 1,
-1.740669, 1.94366, -0.7289841, 1, 0.227451, 0, 1,
-1.730982, -0.1717279, -1.843038, 1, 0.2352941, 0, 1,
-1.725069, 1.948281, -0.1759802, 1, 0.2392157, 0, 1,
-1.678602, 0.2803193, -0.8070367, 1, 0.2470588, 0, 1,
-1.644777, -0.1258448, -2.42924, 1, 0.2509804, 0, 1,
-1.641285, 1.071308, -1.64891, 1, 0.2588235, 0, 1,
-1.637198, -0.4920039, -0.4739481, 1, 0.2627451, 0, 1,
-1.60782, -0.3072192, 2.046562, 1, 0.2705882, 0, 1,
-1.586193, 0.9281602, -3.617262, 1, 0.2745098, 0, 1,
-1.586165, -2.129155, -3.097796, 1, 0.282353, 0, 1,
-1.584146, -1.197055, -0.805523, 1, 0.2862745, 0, 1,
-1.582322, 0.4290903, -0.007900428, 1, 0.2941177, 0, 1,
-1.57804, -0.5020484, -3.443881, 1, 0.3019608, 0, 1,
-1.565935, 0.9954236, 0.5710375, 1, 0.3058824, 0, 1,
-1.562984, 0.3238299, -3.363955, 1, 0.3137255, 0, 1,
-1.559784, -0.7880297, -2.090148, 1, 0.3176471, 0, 1,
-1.544086, -0.2380924, -1.055146, 1, 0.3254902, 0, 1,
-1.540906, 0.8971738, -1.414059, 1, 0.3294118, 0, 1,
-1.540802, -0.1356601, -2.13376, 1, 0.3372549, 0, 1,
-1.518077, 0.5213518, -2.541129, 1, 0.3411765, 0, 1,
-1.507522, 0.3531199, -1.338826, 1, 0.3490196, 0, 1,
-1.503795, -0.6020432, -2.120936, 1, 0.3529412, 0, 1,
-1.498788, 0.5677649, -3.075168, 1, 0.3607843, 0, 1,
-1.496458, 0.5283727, -0.545346, 1, 0.3647059, 0, 1,
-1.484231, -0.8275988, -2.474307, 1, 0.372549, 0, 1,
-1.483765, -1.657928, -2.675466, 1, 0.3764706, 0, 1,
-1.469406, -0.1694764, -1.686364, 1, 0.3843137, 0, 1,
-1.469179, 0.3230527, -1.283598, 1, 0.3882353, 0, 1,
-1.462459, -1.263758, -2.642767, 1, 0.3960784, 0, 1,
-1.45746, 0.7270015, -1.751775, 1, 0.4039216, 0, 1,
-1.451212, 0.2623891, -2.475417, 1, 0.4078431, 0, 1,
-1.446775, -2.602553, -2.27601, 1, 0.4156863, 0, 1,
-1.42972, 0.8712343, 0.4725616, 1, 0.4196078, 0, 1,
-1.427195, -0.5463173, -1.941609, 1, 0.427451, 0, 1,
-1.423387, 0.1373084, -0.06880101, 1, 0.4313726, 0, 1,
-1.395793, -0.2189263, -0.5445912, 1, 0.4392157, 0, 1,
-1.394745, 0.7826356, -1.877615, 1, 0.4431373, 0, 1,
-1.393159, 0.01767284, -2.701634, 1, 0.4509804, 0, 1,
-1.392742, -0.5413506, -2.102892, 1, 0.454902, 0, 1,
-1.379849, 1.5358, -1.138255, 1, 0.4627451, 0, 1,
-1.37893, 0.9913538, -2.179422, 1, 0.4666667, 0, 1,
-1.378893, -1.084379, -2.802562, 1, 0.4745098, 0, 1,
-1.377606, -0.5984536, -2.796317, 1, 0.4784314, 0, 1,
-1.357482, 0.9457043, 0.1080791, 1, 0.4862745, 0, 1,
-1.357461, 0.2479602, -0.587638, 1, 0.4901961, 0, 1,
-1.351932, -0.4374282, -2.397324, 1, 0.4980392, 0, 1,
-1.334168, 0.794265, -1.134237, 1, 0.5058824, 0, 1,
-1.328173, -0.01694774, -1.112358, 1, 0.509804, 0, 1,
-1.327936, -0.1509021, -3.398109, 1, 0.5176471, 0, 1,
-1.312517, -0.292396, -1.988984, 1, 0.5215687, 0, 1,
-1.309992, 1.514237, -1.762662, 1, 0.5294118, 0, 1,
-1.307634, -1.034474, -2.7622, 1, 0.5333334, 0, 1,
-1.297111, -0.4531156, -3.235635, 1, 0.5411765, 0, 1,
-1.296639, -0.5284727, -3.158946, 1, 0.5450981, 0, 1,
-1.294042, -0.5135531, -1.976458, 1, 0.5529412, 0, 1,
-1.288672, 0.4563972, -1.382995, 1, 0.5568628, 0, 1,
-1.278365, 1.475211, -0.7292014, 1, 0.5647059, 0, 1,
-1.266232, 0.1492946, -2.191046, 1, 0.5686275, 0, 1,
-1.237329, -1.916014, -3.529794, 1, 0.5764706, 0, 1,
-1.235327, 0.2311842, -0.7905077, 1, 0.5803922, 0, 1,
-1.226125, -0.2774567, 0.3068108, 1, 0.5882353, 0, 1,
-1.220398, 0.2893856, -3.421856, 1, 0.5921569, 0, 1,
-1.21106, 0.5321254, -0.4366201, 1, 0.6, 0, 1,
-1.207024, 0.7737035, -0.2914826, 1, 0.6078432, 0, 1,
-1.195181, 1.086395, -1.532713, 1, 0.6117647, 0, 1,
-1.194615, 0.4362069, -1.071753, 1, 0.6196079, 0, 1,
-1.19433, 1.445326, 1.178442, 1, 0.6235294, 0, 1,
-1.191669, -0.1715918, -1.696406, 1, 0.6313726, 0, 1,
-1.183044, 0.3776788, -1.6325, 1, 0.6352941, 0, 1,
-1.174876, -1.480604, -3.118451, 1, 0.6431373, 0, 1,
-1.174747, 1.485927, -0.4692907, 1, 0.6470588, 0, 1,
-1.163079, -0.4102381, -2.416297, 1, 0.654902, 0, 1,
-1.160569, 0.9430296, -1.004345, 1, 0.6588235, 0, 1,
-1.159152, -0.265109, -3.12765, 1, 0.6666667, 0, 1,
-1.140826, -1.999798, -1.740816, 1, 0.6705883, 0, 1,
-1.137676, 0.3055707, -0.1468553, 1, 0.6784314, 0, 1,
-1.132554, 1.544, 1.61185, 1, 0.682353, 0, 1,
-1.129961, -0.5368011, -2.261781, 1, 0.6901961, 0, 1,
-1.125371, -0.3833871, -0.8924124, 1, 0.6941177, 0, 1,
-1.123715, 0.03164581, 0.2327039, 1, 0.7019608, 0, 1,
-1.11962, -0.06360213, -2.008754, 1, 0.7098039, 0, 1,
-1.116118, -1.022458, -1.879673, 1, 0.7137255, 0, 1,
-1.106169, -0.9616417, -3.078261, 1, 0.7215686, 0, 1,
-1.105563, 0.7117268, -0.60359, 1, 0.7254902, 0, 1,
-1.101803, -0.3233126, -2.062274, 1, 0.7333333, 0, 1,
-1.076218, -0.1962506, 0.1274916, 1, 0.7372549, 0, 1,
-1.058549, -0.7509295, -1.901583, 1, 0.7450981, 0, 1,
-1.057927, -1.416477, -0.1196316, 1, 0.7490196, 0, 1,
-1.055095, -1.361897, -2.175673, 1, 0.7568628, 0, 1,
-1.042415, 0.8334177, -1.023327, 1, 0.7607843, 0, 1,
-1.036328, 0.2105501, -2.199453, 1, 0.7686275, 0, 1,
-1.031442, 1.151252, -1.438362, 1, 0.772549, 0, 1,
-1.03049, -0.5761576, -0.7190907, 1, 0.7803922, 0, 1,
-1.026734, 0.2290779, 0.1682414, 1, 0.7843137, 0, 1,
-1.025609, 0.2716954, 0.1421911, 1, 0.7921569, 0, 1,
-1.00914, 0.626766, 1.958426, 1, 0.7960784, 0, 1,
-1.002426, -0.416393, -3.043141, 1, 0.8039216, 0, 1,
-1.000849, 0.4174504, -1.200896, 1, 0.8117647, 0, 1,
-0.9963438, -1.741101, -3.864488, 1, 0.8156863, 0, 1,
-0.9932693, -0.9185265, -1.227351, 1, 0.8235294, 0, 1,
-0.9910827, 0.9686485, -0.790113, 1, 0.827451, 0, 1,
-0.98758, 1.282251, -2.065326, 1, 0.8352941, 0, 1,
-0.9830863, 1.4154, -2.157981, 1, 0.8392157, 0, 1,
-0.980849, -0.4913129, -2.108427, 1, 0.8470588, 0, 1,
-0.9801112, -0.137656, -3.254551, 1, 0.8509804, 0, 1,
-0.9754608, 1.093543, -0.07492538, 1, 0.8588235, 0, 1,
-0.9727879, -0.1363422, -1.698467, 1, 0.8627451, 0, 1,
-0.9712504, 0.08690993, -1.512905, 1, 0.8705882, 0, 1,
-0.9689471, -1.455554, -2.655701, 1, 0.8745098, 0, 1,
-0.9676234, -1.627354, -3.928651, 1, 0.8823529, 0, 1,
-0.96338, -0.3941715, -1.905049, 1, 0.8862745, 0, 1,
-0.9617758, -0.9665551, -1.135112, 1, 0.8941177, 0, 1,
-0.9590344, -0.583922, -3.654003, 1, 0.8980392, 0, 1,
-0.9584042, 1.023616, -0.9843435, 1, 0.9058824, 0, 1,
-0.9576664, -0.1805409, -1.564537, 1, 0.9137255, 0, 1,
-0.9560537, -0.05621329, -2.207108, 1, 0.9176471, 0, 1,
-0.9513315, 0.3460782, -0.08953766, 1, 0.9254902, 0, 1,
-0.944389, 0.4725759, -3.325096, 1, 0.9294118, 0, 1,
-0.9400356, -1.054362, -4.187315, 1, 0.9372549, 0, 1,
-0.9353676, -1.255993, -1.50277, 1, 0.9411765, 0, 1,
-0.9318784, 1.667122, 0.951362, 1, 0.9490196, 0, 1,
-0.9312731, -0.823606, -0.9172087, 1, 0.9529412, 0, 1,
-0.9303193, -2.593807, -2.601381, 1, 0.9607843, 0, 1,
-0.9293208, 1.263904, -1.157873, 1, 0.9647059, 0, 1,
-0.9242079, -0.2860141, -2.272857, 1, 0.972549, 0, 1,
-0.9211562, 0.0327489, -1.161382, 1, 0.9764706, 0, 1,
-0.9175634, 0.006146472, -1.865397, 1, 0.9843137, 0, 1,
-0.9077281, -0.32521, -1.857218, 1, 0.9882353, 0, 1,
-0.9051823, -0.3655414, -0.2250194, 1, 0.9960784, 0, 1,
-0.9040526, 0.9191875, -0.6927263, 0.9960784, 1, 0, 1,
-0.8910226, -0.4334218, -1.387363, 0.9921569, 1, 0, 1,
-0.8896864, -0.7976066, -1.824839, 0.9843137, 1, 0, 1,
-0.8877479, 1.267112, -1.238307, 0.9803922, 1, 0, 1,
-0.8857638, 0.3364655, -1.703875, 0.972549, 1, 0, 1,
-0.8851694, 0.7208465, -3.024908, 0.9686275, 1, 0, 1,
-0.8850959, 0.03832162, -0.004702723, 0.9607843, 1, 0, 1,
-0.8711159, 0.6705365, -1.563152, 0.9568627, 1, 0, 1,
-0.8681431, -0.5935227, -3.261038, 0.9490196, 1, 0, 1,
-0.862712, -1.956051, -3.754115, 0.945098, 1, 0, 1,
-0.8568517, 0.1642814, -1.797444, 0.9372549, 1, 0, 1,
-0.8539659, -1.036543, -1.961003, 0.9333333, 1, 0, 1,
-0.8531764, -0.1648342, 0.01617521, 0.9254902, 1, 0, 1,
-0.8530223, 0.7216791, 0.3778548, 0.9215686, 1, 0, 1,
-0.833458, -1.385718, -2.360185, 0.9137255, 1, 0, 1,
-0.825369, 0.1652267, -0.9098682, 0.9098039, 1, 0, 1,
-0.808082, 0.8772685, -0.7765474, 0.9019608, 1, 0, 1,
-0.8016462, 0.7745848, -0.083078, 0.8941177, 1, 0, 1,
-0.7991771, 0.1394338, -2.627469, 0.8901961, 1, 0, 1,
-0.7990601, 0.7462444, -0.8478886, 0.8823529, 1, 0, 1,
-0.7979766, -0.09327634, -2.069662, 0.8784314, 1, 0, 1,
-0.7964832, -1.276161, -2.840407, 0.8705882, 1, 0, 1,
-0.7927393, -0.6653079, -0.2078689, 0.8666667, 1, 0, 1,
-0.7923399, -2.168684, -0.7231823, 0.8588235, 1, 0, 1,
-0.7902828, -0.5273527, -2.614144, 0.854902, 1, 0, 1,
-0.7893323, 1.032858, -0.4839958, 0.8470588, 1, 0, 1,
-0.7825379, -0.2658903, 0.03961862, 0.8431373, 1, 0, 1,
-0.7792943, 1.009748, -0.2637181, 0.8352941, 1, 0, 1,
-0.7776764, -0.3711248, -0.5711321, 0.8313726, 1, 0, 1,
-0.7769734, -2.224671, -3.117998, 0.8235294, 1, 0, 1,
-0.7748801, 0.3380752, -0.9889389, 0.8196079, 1, 0, 1,
-0.7624578, -1.976997, -1.707585, 0.8117647, 1, 0, 1,
-0.7623444, -0.7547573, -1.712053, 0.8078431, 1, 0, 1,
-0.7622322, 1.010163, 1.040374, 0.8, 1, 0, 1,
-0.7552829, -0.7771791, -4.346877, 0.7921569, 1, 0, 1,
-0.7530803, -0.8213317, -3.50188, 0.7882353, 1, 0, 1,
-0.7515063, 0.5138726, 1.035011, 0.7803922, 1, 0, 1,
-0.7505318, 0.997616, -0.5506527, 0.7764706, 1, 0, 1,
-0.7474207, 0.4356634, -1.894521, 0.7686275, 1, 0, 1,
-0.7449762, 0.8383071, -1.037358, 0.7647059, 1, 0, 1,
-0.7446197, -0.03957121, -2.421064, 0.7568628, 1, 0, 1,
-0.7442287, 1.293173, -0.05311739, 0.7529412, 1, 0, 1,
-0.7404113, -0.7048998, -1.967651, 0.7450981, 1, 0, 1,
-0.7385517, -0.6301867, -3.334793, 0.7411765, 1, 0, 1,
-0.7359597, 1.125589, -1.061855, 0.7333333, 1, 0, 1,
-0.7351869, -1.536618, -3.862164, 0.7294118, 1, 0, 1,
-0.7263538, -0.7086852, -1.676188, 0.7215686, 1, 0, 1,
-0.7237498, -1.072241, -2.481343, 0.7176471, 1, 0, 1,
-0.7193581, 0.3220747, -2.250504, 0.7098039, 1, 0, 1,
-0.7153226, -1.179193, -2.575294, 0.7058824, 1, 0, 1,
-0.713594, -0.8883029, -2.345881, 0.6980392, 1, 0, 1,
-0.7116313, 0.0272688, -2.191307, 0.6901961, 1, 0, 1,
-0.7112437, 0.9582111, -1.106412, 0.6862745, 1, 0, 1,
-0.7074843, -0.3732592, -3.050129, 0.6784314, 1, 0, 1,
-0.7039548, 0.8802441, -1.329629, 0.6745098, 1, 0, 1,
-0.7036017, -0.04746951, -0.2833345, 0.6666667, 1, 0, 1,
-0.6991411, 0.2965471, -0.852101, 0.6627451, 1, 0, 1,
-0.6882773, -2.396691, -5.402658, 0.654902, 1, 0, 1,
-0.6821454, -0.2618742, -2.048894, 0.6509804, 1, 0, 1,
-0.6799233, 0.1289793, -0.1163181, 0.6431373, 1, 0, 1,
-0.677946, 0.9419581, -0.4306253, 0.6392157, 1, 0, 1,
-0.6701856, 0.6274117, 0.06117026, 0.6313726, 1, 0, 1,
-0.6684362, 0.4395188, -1.514744, 0.627451, 1, 0, 1,
-0.661091, 0.8533735, -1.862067, 0.6196079, 1, 0, 1,
-0.6595722, -0.2418415, -1.990831, 0.6156863, 1, 0, 1,
-0.6543508, 1.669505, 0.1360415, 0.6078432, 1, 0, 1,
-0.6530441, 1.731478, -0.4763656, 0.6039216, 1, 0, 1,
-0.6499568, 0.3088837, 0.257194, 0.5960785, 1, 0, 1,
-0.6490156, 1.544123, -1.286943, 0.5882353, 1, 0, 1,
-0.6426413, -2.404126, -3.663077, 0.5843138, 1, 0, 1,
-0.6306973, 0.2703632, -1.598528, 0.5764706, 1, 0, 1,
-0.6232315, -1.751189, -1.482277, 0.572549, 1, 0, 1,
-0.6229296, 0.3392876, -2.611856, 0.5647059, 1, 0, 1,
-0.6203112, -0.106399, -3.04642, 0.5607843, 1, 0, 1,
-0.6148685, 0.2672582, 0.3508083, 0.5529412, 1, 0, 1,
-0.6122428, 0.880933, -1.57922, 0.5490196, 1, 0, 1,
-0.6102977, -0.1746128, 0.8604964, 0.5411765, 1, 0, 1,
-0.6074012, -1.11544, -2.953855, 0.5372549, 1, 0, 1,
-0.6038833, -0.01144487, 0.3648141, 0.5294118, 1, 0, 1,
-0.6014708, 0.1400733, -0.7095838, 0.5254902, 1, 0, 1,
-0.5996158, -0.6388768, -2.570641, 0.5176471, 1, 0, 1,
-0.5959349, 1.161438, -0.2757473, 0.5137255, 1, 0, 1,
-0.5949761, 0.09284931, -0.2162695, 0.5058824, 1, 0, 1,
-0.593133, -1.498919, -2.948576, 0.5019608, 1, 0, 1,
-0.5904436, -0.1969598, -2.794598, 0.4941176, 1, 0, 1,
-0.5863494, 0.3619868, 0.6168513, 0.4862745, 1, 0, 1,
-0.574786, -1.293422, -2.343194, 0.4823529, 1, 0, 1,
-0.5741763, 0.008629716, -1.400002, 0.4745098, 1, 0, 1,
-0.5740573, 0.2332961, -0.7172161, 0.4705882, 1, 0, 1,
-0.5712829, -0.9378835, -2.27465, 0.4627451, 1, 0, 1,
-0.5699744, -0.4143167, -1.937475, 0.4588235, 1, 0, 1,
-0.5642929, 1.508426, -0.9206405, 0.4509804, 1, 0, 1,
-0.5638755, -1.866469, -3.738359, 0.4470588, 1, 0, 1,
-0.5618711, 0.5172761, -0.9230837, 0.4392157, 1, 0, 1,
-0.5604057, -0.4936616, -1.352158, 0.4352941, 1, 0, 1,
-0.5576011, -2.327438, -3.037323, 0.427451, 1, 0, 1,
-0.5569991, 0.2793518, -1.028835, 0.4235294, 1, 0, 1,
-0.5549067, -0.4078818, -1.825264, 0.4156863, 1, 0, 1,
-0.5538796, -0.4086612, -1.379318, 0.4117647, 1, 0, 1,
-0.5536719, -1.264382, -2.50949, 0.4039216, 1, 0, 1,
-0.5533074, 1.247148, -1.830772, 0.3960784, 1, 0, 1,
-0.5522053, 0.4183448, 0.7844866, 0.3921569, 1, 0, 1,
-0.5491123, -1.928556, -0.4387904, 0.3843137, 1, 0, 1,
-0.5471816, 1.459429, -0.6601444, 0.3803922, 1, 0, 1,
-0.5444141, -1.016142, -2.472487, 0.372549, 1, 0, 1,
-0.5405973, -1.004461, -3.354259, 0.3686275, 1, 0, 1,
-0.5400503, -0.3038669, -3.115118, 0.3607843, 1, 0, 1,
-0.5398405, -0.1676864, -2.266104, 0.3568628, 1, 0, 1,
-0.5385711, -1.456243, -3.248095, 0.3490196, 1, 0, 1,
-0.5379831, 0.3863287, -2.091815, 0.345098, 1, 0, 1,
-0.5329894, -0.5441114, -2.722677, 0.3372549, 1, 0, 1,
-0.5311716, -0.3109597, -1.76805, 0.3333333, 1, 0, 1,
-0.5214136, 0.7746441, -1.609682, 0.3254902, 1, 0, 1,
-0.5196384, 1.244768, -1.7544, 0.3215686, 1, 0, 1,
-0.516942, -0.1988851, -2.308716, 0.3137255, 1, 0, 1,
-0.5163339, 0.4066547, 0.05252865, 0.3098039, 1, 0, 1,
-0.5152324, -0.881023, -3.541925, 0.3019608, 1, 0, 1,
-0.5151003, 1.931505, -1.564779, 0.2941177, 1, 0, 1,
-0.5150096, -0.8965294, -0.789461, 0.2901961, 1, 0, 1,
-0.5110151, 1.13247, -1.7938, 0.282353, 1, 0, 1,
-0.5034949, -0.2720132, -1.361696, 0.2784314, 1, 0, 1,
-0.5016801, 0.4672864, 0.7973037, 0.2705882, 1, 0, 1,
-0.4936429, -1.038825, -2.70072, 0.2666667, 1, 0, 1,
-0.4912878, -1.197535, -1.696617, 0.2588235, 1, 0, 1,
-0.4902437, 0.3398291, -2.829828, 0.254902, 1, 0, 1,
-0.489774, -0.01027051, -2.047044, 0.2470588, 1, 0, 1,
-0.4813108, -1.13561, -1.984854, 0.2431373, 1, 0, 1,
-0.4792275, -0.8214857, -1.816331, 0.2352941, 1, 0, 1,
-0.4790842, -0.825495, -2.197237, 0.2313726, 1, 0, 1,
-0.4761307, -1.174294, -3.441511, 0.2235294, 1, 0, 1,
-0.4752197, 0.6719878, 0.1224868, 0.2196078, 1, 0, 1,
-0.4713836, -1.165998, -3.663409, 0.2117647, 1, 0, 1,
-0.4704927, 0.8362797, -1.65597, 0.2078431, 1, 0, 1,
-0.4650562, 0.9766495, -1.108454, 0.2, 1, 0, 1,
-0.4635514, 0.3445969, -1.481806, 0.1921569, 1, 0, 1,
-0.4573476, 1.166918, -0.6283536, 0.1882353, 1, 0, 1,
-0.4476748, -0.2496403, -2.071769, 0.1803922, 1, 0, 1,
-0.4473734, -0.8874184, -2.179066, 0.1764706, 1, 0, 1,
-0.4471185, -0.5561143, -3.986575, 0.1686275, 1, 0, 1,
-0.4465965, -0.6841781, -2.940163, 0.1647059, 1, 0, 1,
-0.4404226, 0.1884772, -3.092712, 0.1568628, 1, 0, 1,
-0.4399768, -2.417089, -2.997702, 0.1529412, 1, 0, 1,
-0.4395129, 0.1666276, -1.041724, 0.145098, 1, 0, 1,
-0.4387398, -0.752422, -3.169479, 0.1411765, 1, 0, 1,
-0.4385131, -0.1840102, -0.9727955, 0.1333333, 1, 0, 1,
-0.4375272, 0.3982454, -0.9292597, 0.1294118, 1, 0, 1,
-0.4344232, 0.02010741, -0.4310679, 0.1215686, 1, 0, 1,
-0.4278736, 0.526288, -1.250718, 0.1176471, 1, 0, 1,
-0.4169855, 1.263847, 2.539616, 0.1098039, 1, 0, 1,
-0.410052, 1.071293, -0.009332641, 0.1058824, 1, 0, 1,
-0.4059424, 0.1892416, -1.53355, 0.09803922, 1, 0, 1,
-0.4041681, 0.6348106, -1.017622, 0.09019608, 1, 0, 1,
-0.3991165, 0.07627008, -1.438946, 0.08627451, 1, 0, 1,
-0.3988629, 1.30851, -0.8604644, 0.07843138, 1, 0, 1,
-0.3929271, -0.3669295, -2.370809, 0.07450981, 1, 0, 1,
-0.3849723, 0.2513405, -0.486378, 0.06666667, 1, 0, 1,
-0.3804459, 0.280907, -2.130177, 0.0627451, 1, 0, 1,
-0.3757721, -0.006702456, -2.630647, 0.05490196, 1, 0, 1,
-0.3665427, -0.6143577, -4.464314, 0.05098039, 1, 0, 1,
-0.362929, 1.781174, 0.2394227, 0.04313726, 1, 0, 1,
-0.3572623, -0.603914, -3.246057, 0.03921569, 1, 0, 1,
-0.3568595, -0.9440749, -3.815503, 0.03137255, 1, 0, 1,
-0.3539788, -1.89382, -3.120258, 0.02745098, 1, 0, 1,
-0.352363, -1.006468, -2.694124, 0.01960784, 1, 0, 1,
-0.3519057, 0.1704899, -2.203532, 0.01568628, 1, 0, 1,
-0.3511502, -0.1723426, -0.8095734, 0.007843138, 1, 0, 1,
-0.3507454, -2.469625, -3.107653, 0.003921569, 1, 0, 1,
-0.3506705, 0.521827, -0.7567831, 0, 1, 0.003921569, 1,
-0.3433289, 0.1121251, -3.299652, 0, 1, 0.01176471, 1,
-0.3414229, 0.8460048, 0.8880643, 0, 1, 0.01568628, 1,
-0.3399071, 0.2782401, -0.5679688, 0, 1, 0.02352941, 1,
-0.3389399, 0.9580097, -1.669813, 0, 1, 0.02745098, 1,
-0.3384268, -0.3410431, -3.237102, 0, 1, 0.03529412, 1,
-0.3354861, -0.6384056, -1.542876, 0, 1, 0.03921569, 1,
-0.3299672, 2.22428, 0.04601624, 0, 1, 0.04705882, 1,
-0.3272305, 1.02328, 1.624235, 0, 1, 0.05098039, 1,
-0.3247357, -0.8616014, -2.155128, 0, 1, 0.05882353, 1,
-0.3207777, 0.05694138, -1.284469, 0, 1, 0.0627451, 1,
-0.3182522, -0.5071707, -3.682134, 0, 1, 0.07058824, 1,
-0.3157901, 0.8025848, -0.6369327, 0, 1, 0.07450981, 1,
-0.3139207, -1.240234, -4.376082, 0, 1, 0.08235294, 1,
-0.3070782, -1.076727, -2.012411, 0, 1, 0.08627451, 1,
-0.3057676, -0.6424171, -2.68281, 0, 1, 0.09411765, 1,
-0.3043242, -0.1096983, -2.899669, 0, 1, 0.1019608, 1,
-0.3035406, -0.4917643, -4.484327, 0, 1, 0.1058824, 1,
-0.3015955, -1.036181, -4.361259, 0, 1, 0.1137255, 1,
-0.2984399, 0.9685074, -1.638946, 0, 1, 0.1176471, 1,
-0.2959585, 0.8230232, -2.169497, 0, 1, 0.1254902, 1,
-0.2923382, -0.1878529, -3.403818, 0, 1, 0.1294118, 1,
-0.2847098, 0.6229588, -0.8745462, 0, 1, 0.1372549, 1,
-0.2798616, 0.05562335, -3.032629, 0, 1, 0.1411765, 1,
-0.2775732, -0.2180625, -2.761086, 0, 1, 0.1490196, 1,
-0.2696018, -0.872337, -3.595832, 0, 1, 0.1529412, 1,
-0.2688148, -1.334089, -2.241838, 0, 1, 0.1607843, 1,
-0.2613881, -0.3090945, -2.763731, 0, 1, 0.1647059, 1,
-0.2613391, -0.1267472, -2.867371, 0, 1, 0.172549, 1,
-0.2570354, -2.110186, -2.882575, 0, 1, 0.1764706, 1,
-0.2566387, 1.19354, 0.3067424, 0, 1, 0.1843137, 1,
-0.256323, -0.5546982, -3.928997, 0, 1, 0.1882353, 1,
-0.2552797, 2.21401, -0.9692857, 0, 1, 0.1960784, 1,
-0.251821, 1.104003, -0.2514987, 0, 1, 0.2039216, 1,
-0.2509233, 0.4068689, 0.06374836, 0, 1, 0.2078431, 1,
-0.2502514, -2.233404, -1.877131, 0, 1, 0.2156863, 1,
-0.2485576, -0.6109691, -3.056256, 0, 1, 0.2196078, 1,
-0.247005, -2.112815, -4.982943, 0, 1, 0.227451, 1,
-0.2443933, 1.267601, 2.733437, 0, 1, 0.2313726, 1,
-0.2424903, -1.522821, -2.961033, 0, 1, 0.2392157, 1,
-0.2384909, -0.05411931, -1.839582, 0, 1, 0.2431373, 1,
-0.2330328, 0.5771516, 0.2132698, 0, 1, 0.2509804, 1,
-0.2324167, 1.707378, -1.576339, 0, 1, 0.254902, 1,
-0.2223923, -0.6816314, -1.308061, 0, 1, 0.2627451, 1,
-0.2162153, -0.3322585, -2.994903, 0, 1, 0.2666667, 1,
-0.2141189, 0.6441127, -1.713441, 0, 1, 0.2745098, 1,
-0.213954, 0.07783615, -2.61431, 0, 1, 0.2784314, 1,
-0.2016442, -0.9031424, -1.951707, 0, 1, 0.2862745, 1,
-0.2014899, -0.6371166, -3.04884, 0, 1, 0.2901961, 1,
-0.1993459, 0.1383639, 0.1610187, 0, 1, 0.2980392, 1,
-0.199296, 1.251228, -1.877571, 0, 1, 0.3058824, 1,
-0.194957, -0.8253221, -3.720227, 0, 1, 0.3098039, 1,
-0.1921792, 0.9815212, 0.0757516, 0, 1, 0.3176471, 1,
-0.1908538, 0.9586993, 0.2398684, 0, 1, 0.3215686, 1,
-0.1867815, 0.07618794, -0.9493178, 0, 1, 0.3294118, 1,
-0.1865299, -0.85987, -3.220164, 0, 1, 0.3333333, 1,
-0.1846984, -0.1743209, -2.096498, 0, 1, 0.3411765, 1,
-0.1814237, -0.08542608, -1.594851, 0, 1, 0.345098, 1,
-0.1796775, 0.6531672, -0.8082511, 0, 1, 0.3529412, 1,
-0.1773502, 0.1706318, 0.2747108, 0, 1, 0.3568628, 1,
-0.1749311, -0.6630734, -1.980699, 0, 1, 0.3647059, 1,
-0.1715683, -0.6416484, -1.635953, 0, 1, 0.3686275, 1,
-0.1668258, -0.9221422, -0.7602413, 0, 1, 0.3764706, 1,
-0.1661014, -0.2087952, -3.863096, 0, 1, 0.3803922, 1,
-0.1601992, -0.9818991, -2.517857, 0, 1, 0.3882353, 1,
-0.1551697, 0.3468075, -0.5537493, 0, 1, 0.3921569, 1,
-0.1533024, -0.8968529, -2.392542, 0, 1, 0.4, 1,
-0.1524758, -1.265689, -2.55086, 0, 1, 0.4078431, 1,
-0.1501515, -0.6785229, -2.415788, 0, 1, 0.4117647, 1,
-0.1490339, 0.4376054, 0.518958, 0, 1, 0.4196078, 1,
-0.1468416, 0.488531, 0.5104755, 0, 1, 0.4235294, 1,
-0.1468043, 0.5956365, 0.3130919, 0, 1, 0.4313726, 1,
-0.1442459, 0.6323062, -1.31326, 0, 1, 0.4352941, 1,
-0.1432866, 0.03572134, -0.9692982, 0, 1, 0.4431373, 1,
-0.1431929, 0.5055064, 0.6884173, 0, 1, 0.4470588, 1,
-0.1427769, 0.9554749, -0.395774, 0, 1, 0.454902, 1,
-0.1421704, -1.573491, -4.732891, 0, 1, 0.4588235, 1,
-0.1415825, 0.3816648, -0.1308152, 0, 1, 0.4666667, 1,
-0.1339591, -1.1159, -3.891266, 0, 1, 0.4705882, 1,
-0.1333804, -0.301924, -2.755499, 0, 1, 0.4784314, 1,
-0.1303762, -0.1065473, -1.372144, 0, 1, 0.4823529, 1,
-0.1275227, 0.0482606, -0.2611976, 0, 1, 0.4901961, 1,
-0.1273578, -1.160833, -2.438929, 0, 1, 0.4941176, 1,
-0.1232781, 1.323566, 0.6917118, 0, 1, 0.5019608, 1,
-0.1211844, -0.7025278, -2.666358, 0, 1, 0.509804, 1,
-0.1161463, -0.8021251, -2.456105, 0, 1, 0.5137255, 1,
-0.1161302, 1.279942, 0.1677943, 0, 1, 0.5215687, 1,
-0.1142677, 0.452557, -2.149614, 0, 1, 0.5254902, 1,
-0.1140762, -0.7133293, -2.730681, 0, 1, 0.5333334, 1,
-0.1127643, -1.05338, -1.764123, 0, 1, 0.5372549, 1,
-0.1072701, 1.161618, 0.9165398, 0, 1, 0.5450981, 1,
-0.1035971, 0.6651894, -0.01481433, 0, 1, 0.5490196, 1,
-0.09700071, -1.289174, -4.848368, 0, 1, 0.5568628, 1,
-0.09559599, 0.2688089, -0.8322673, 0, 1, 0.5607843, 1,
-0.09421974, -0.4225767, -3.626477, 0, 1, 0.5686275, 1,
-0.09221021, 1.544758, -0.4834517, 0, 1, 0.572549, 1,
-0.09181945, -0.7227705, -3.681549, 0, 1, 0.5803922, 1,
-0.09141143, -0.1821466, -1.487514, 0, 1, 0.5843138, 1,
-0.08805721, -0.6025482, -4.757435, 0, 1, 0.5921569, 1,
-0.08701642, -0.1512983, -2.208449, 0, 1, 0.5960785, 1,
-0.08274872, 0.3411049, 0.1108762, 0, 1, 0.6039216, 1,
-0.08105314, -1.382276, -3.860875, 0, 1, 0.6117647, 1,
-0.07925904, -1.176772, -2.445243, 0, 1, 0.6156863, 1,
-0.07822616, -0.3767191, -2.820187, 0, 1, 0.6235294, 1,
-0.07771084, -0.8643526, -0.8923521, 0, 1, 0.627451, 1,
-0.07365085, -0.02912031, -1.20659, 0, 1, 0.6352941, 1,
-0.07221257, -0.6374401, -0.7454624, 0, 1, 0.6392157, 1,
-0.06692673, 0.6338947, 2.006229, 0, 1, 0.6470588, 1,
-0.06507642, 0.02032126, -1.482343, 0, 1, 0.6509804, 1,
-0.06377595, -0.3275807, -2.738251, 0, 1, 0.6588235, 1,
-0.05510727, -0.155986, -2.216594, 0, 1, 0.6627451, 1,
-0.05410281, 1.207355, 0.1666631, 0, 1, 0.6705883, 1,
-0.05286447, -0.07405902, -1.597531, 0, 1, 0.6745098, 1,
-0.04852367, 0.679095, 0.6564595, 0, 1, 0.682353, 1,
-0.04720795, 0.9097356, -2.303863, 0, 1, 0.6862745, 1,
-0.04624208, -0.2585538, -3.285887, 0, 1, 0.6941177, 1,
-0.04576258, 0.2666435, 0.6740907, 0, 1, 0.7019608, 1,
-0.03728415, -0.5006726, -3.634618, 0, 1, 0.7058824, 1,
-0.0352212, 0.7910478, 0.2599402, 0, 1, 0.7137255, 1,
-0.03267583, 2.473898, 0.4087484, 0, 1, 0.7176471, 1,
-0.03132267, 1.400431, -0.7046256, 0, 1, 0.7254902, 1,
-0.02753559, -0.426012, -3.947184, 0, 1, 0.7294118, 1,
-0.02532392, 1.127079, 2.89799, 0, 1, 0.7372549, 1,
-0.02447946, 0.1701056, -1.910521, 0, 1, 0.7411765, 1,
-0.02417269, 1.676198, 0.7979582, 0, 1, 0.7490196, 1,
-0.02305677, 0.1513234, -1.179705, 0, 1, 0.7529412, 1,
-0.01870479, 0.56726, -0.5392108, 0, 1, 0.7607843, 1,
-0.01837756, -0.2839588, -3.007035, 0, 1, 0.7647059, 1,
-0.01716015, -0.2210137, -1.175715, 0, 1, 0.772549, 1,
-0.01587817, -0.9050614, -2.320484, 0, 1, 0.7764706, 1,
-0.0135367, 0.6768693, 0.6702186, 0, 1, 0.7843137, 1,
-0.008107261, -0.2911132, -3.181364, 0, 1, 0.7882353, 1,
-0.005504093, -0.3714631, -3.702585, 0, 1, 0.7960784, 1,
-0.004967312, 0.7675503, -0.09034391, 0, 1, 0.8039216, 1,
-0.004634642, -0.1753802, -2.497359, 0, 1, 0.8078431, 1,
-0.001914013, -0.6205288, -1.2717, 0, 1, 0.8156863, 1,
-0.0009224231, 1.099601, -0.5565076, 0, 1, 0.8196079, 1,
0.003816162, 0.03406357, 0.4705578, 0, 1, 0.827451, 1,
0.004318478, -1.045272, 2.76481, 0, 1, 0.8313726, 1,
0.005250994, -0.683962, 2.931629, 0, 1, 0.8392157, 1,
0.007788358, 0.3546763, -0.4500087, 0, 1, 0.8431373, 1,
0.01187282, 0.01714278, 1.256622, 0, 1, 0.8509804, 1,
0.01627474, -0.7112319, 1.285639, 0, 1, 0.854902, 1,
0.01721191, 0.1802319, 1.81342, 0, 1, 0.8627451, 1,
0.01877993, 1.146067, 0.5520666, 0, 1, 0.8666667, 1,
0.01917224, -0.1190705, 3.530452, 0, 1, 0.8745098, 1,
0.02203244, 1.687011, 2.980945, 0, 1, 0.8784314, 1,
0.02264961, -2.172982, 4.213125, 0, 1, 0.8862745, 1,
0.02397424, -0.6347507, 4.269046, 0, 1, 0.8901961, 1,
0.02623796, 0.5376757, 2.09627, 0, 1, 0.8980392, 1,
0.03135092, 1.163092, -0.1231441, 0, 1, 0.9058824, 1,
0.03612253, 0.4359611, 2.645723, 0, 1, 0.9098039, 1,
0.03986447, -0.3248981, 3.693795, 0, 1, 0.9176471, 1,
0.04263994, -0.07006618, 2.365097, 0, 1, 0.9215686, 1,
0.04266439, -1.150528, 2.784499, 0, 1, 0.9294118, 1,
0.05312342, -0.9204137, 2.41672, 0, 1, 0.9333333, 1,
0.05688353, 2.035027, -0.7751338, 0, 1, 0.9411765, 1,
0.05895315, -2.65914, 4.666714, 0, 1, 0.945098, 1,
0.06545685, 0.2895603, -0.3039013, 0, 1, 0.9529412, 1,
0.06821831, 0.06441932, 0.1636896, 0, 1, 0.9568627, 1,
0.06926293, -0.9627723, 2.783238, 0, 1, 0.9647059, 1,
0.07135186, -1.764088, 1.575979, 0, 1, 0.9686275, 1,
0.07271417, 0.126123, 0.2705699, 0, 1, 0.9764706, 1,
0.07305327, 1.572525, -1.738606, 0, 1, 0.9803922, 1,
0.07370239, -1.355822, 3.18275, 0, 1, 0.9882353, 1,
0.07764663, 1.607098, -0.5094137, 0, 1, 0.9921569, 1,
0.07986685, 0.5521778, 0.5331492, 0, 1, 1, 1,
0.07990777, 0.1902972, 1.389823, 0, 0.9921569, 1, 1,
0.08019423, 0.5751236, 0.4521772, 0, 0.9882353, 1, 1,
0.08215807, -1.295595, 1.724271, 0, 0.9803922, 1, 1,
0.08313529, 1.251791, 1.296317, 0, 0.9764706, 1, 1,
0.08437801, -0.1214051, 1.968144, 0, 0.9686275, 1, 1,
0.0852228, -1.085713, 1.968793, 0, 0.9647059, 1, 1,
0.09028827, 0.3226564, -0.9507575, 0, 0.9568627, 1, 1,
0.09183165, -1.979219, 3.459282, 0, 0.9529412, 1, 1,
0.09235985, -0.6273673, 3.203008, 0, 0.945098, 1, 1,
0.09312851, 0.2545605, -0.7341893, 0, 0.9411765, 1, 1,
0.09506602, 0.319936, 0.9542264, 0, 0.9333333, 1, 1,
0.09704141, -0.8493403, 1.767609, 0, 0.9294118, 1, 1,
0.1009114, -0.1320383, 2.816299, 0, 0.9215686, 1, 1,
0.1061025, -0.710009, 3.323018, 0, 0.9176471, 1, 1,
0.1091854, -0.8426043, 2.885538, 0, 0.9098039, 1, 1,
0.1110593, -0.7873411, 2.799548, 0, 0.9058824, 1, 1,
0.1113075, -0.2799195, 3.002907, 0, 0.8980392, 1, 1,
0.1205841, 0.8818257, 0.8416474, 0, 0.8901961, 1, 1,
0.1215459, -1.106619, 4.971458, 0, 0.8862745, 1, 1,
0.1228633, -0.647243, 2.851321, 0, 0.8784314, 1, 1,
0.122882, 0.07009732, 0.9623807, 0, 0.8745098, 1, 1,
0.1258503, -0.0766372, 3.342, 0, 0.8666667, 1, 1,
0.126617, 1.135468, -0.9713369, 0, 0.8627451, 1, 1,
0.1272994, -0.4278144, 4.667426, 0, 0.854902, 1, 1,
0.1307318, -0.6943592, 2.048352, 0, 0.8509804, 1, 1,
0.1323479, -1.92587, 2.397583, 0, 0.8431373, 1, 1,
0.1383047, 0.3621251, 0.5421722, 0, 0.8392157, 1, 1,
0.1385262, -1.846286, 1.816851, 0, 0.8313726, 1, 1,
0.1412677, -1.714175, 4.030218, 0, 0.827451, 1, 1,
0.150887, -0.9316937, 2.326222, 0, 0.8196079, 1, 1,
0.1540039, 1.438085, -0.6714035, 0, 0.8156863, 1, 1,
0.1575462, 0.4814612, -0.2451184, 0, 0.8078431, 1, 1,
0.1662086, 0.7680134, -0.8228065, 0, 0.8039216, 1, 1,
0.1688045, -0.9949508, 4.187117, 0, 0.7960784, 1, 1,
0.1699647, -1.440622, 2.404492, 0, 0.7882353, 1, 1,
0.1744813, -0.9438724, 4.518921, 0, 0.7843137, 1, 1,
0.1758285, -0.1184434, 2.001924, 0, 0.7764706, 1, 1,
0.1765617, -0.7443141, 2.93428, 0, 0.772549, 1, 1,
0.1784773, -0.7472301, 2.731627, 0, 0.7647059, 1, 1,
0.1792267, -1.225103, 2.329066, 0, 0.7607843, 1, 1,
0.1808585, -0.879265, 3.876994, 0, 0.7529412, 1, 1,
0.1835341, -1.594723, 0.9567555, 0, 0.7490196, 1, 1,
0.1835774, -1.545415, 3.004211, 0, 0.7411765, 1, 1,
0.1848027, -0.6861575, 3.68979, 0, 0.7372549, 1, 1,
0.1857861, -0.9721144, 3.903943, 0, 0.7294118, 1, 1,
0.1863832, 0.4175544, -1.696273, 0, 0.7254902, 1, 1,
0.1865603, 0.06039651, 1.013578, 0, 0.7176471, 1, 1,
0.1870829, 0.7622645, 1.771954, 0, 0.7137255, 1, 1,
0.1895059, -0.3682489, 2.623745, 0, 0.7058824, 1, 1,
0.1918925, -0.5331421, 1.962425, 0, 0.6980392, 1, 1,
0.1949776, -0.4540202, 1.794378, 0, 0.6941177, 1, 1,
0.1952096, 1.610443, 1.341724, 0, 0.6862745, 1, 1,
0.1970873, 2.063599, -1.090135, 0, 0.682353, 1, 1,
0.1995927, -0.3412934, 2.082811, 0, 0.6745098, 1, 1,
0.2006198, -1.186163, 2.584806, 0, 0.6705883, 1, 1,
0.2030763, -0.7125052, 3.038234, 0, 0.6627451, 1, 1,
0.2224048, 0.07471545, 1.768533, 0, 0.6588235, 1, 1,
0.2266226, -1.215003, 4.797695, 0, 0.6509804, 1, 1,
0.2282517, -0.5003096, 2.769269, 0, 0.6470588, 1, 1,
0.2290014, 1.439056, 0.59248, 0, 0.6392157, 1, 1,
0.2292295, -0.6260624, 2.764848, 0, 0.6352941, 1, 1,
0.2375932, -0.4934107, 2.470285, 0, 0.627451, 1, 1,
0.2386858, 0.8946722, 1.425537, 0, 0.6235294, 1, 1,
0.2467318, -1.218551, 2.892801, 0, 0.6156863, 1, 1,
0.2471402, -0.07112735, 2.138169, 0, 0.6117647, 1, 1,
0.2583118, 1.621951, -0.7328494, 0, 0.6039216, 1, 1,
0.2615562, 2.688933, 0.05607132, 0, 0.5960785, 1, 1,
0.2673941, -0.8120816, 3.200834, 0, 0.5921569, 1, 1,
0.2723857, 0.6852614, 0.8399767, 0, 0.5843138, 1, 1,
0.2736383, 0.7372072, -0.1190239, 0, 0.5803922, 1, 1,
0.273771, -1.400743, 4.237764, 0, 0.572549, 1, 1,
0.2747103, -1.407327, 2.826573, 0, 0.5686275, 1, 1,
0.2772525, -1.221668, 1.867953, 0, 0.5607843, 1, 1,
0.2793815, -0.5438679, 3.829189, 0, 0.5568628, 1, 1,
0.2820652, -0.7597632, 2.759, 0, 0.5490196, 1, 1,
0.2861912, -0.7804336, 2.855121, 0, 0.5450981, 1, 1,
0.2893547, 1.227628, 0.5470928, 0, 0.5372549, 1, 1,
0.2896923, 0.3012914, 1.048795, 0, 0.5333334, 1, 1,
0.2919307, -2.257078, 2.192838, 0, 0.5254902, 1, 1,
0.2998342, -0.3924822, 1.861317, 0, 0.5215687, 1, 1,
0.3056304, 1.044584, 0.003861977, 0, 0.5137255, 1, 1,
0.3089765, 0.4578098, 1.000965, 0, 0.509804, 1, 1,
0.3125921, -0.07412858, 2.822654, 0, 0.5019608, 1, 1,
0.3126, 1.457852, -0.02916982, 0, 0.4941176, 1, 1,
0.3141068, 0.174417, 0.7422253, 0, 0.4901961, 1, 1,
0.3161508, 1.459118, 0.07624516, 0, 0.4823529, 1, 1,
0.3267929, 0.4676197, -0.9748487, 0, 0.4784314, 1, 1,
0.3300234, -0.8031725, 1.824061, 0, 0.4705882, 1, 1,
0.3356136, -0.730116, 3.34707, 0, 0.4666667, 1, 1,
0.3370097, 0.1077087, -0.2575336, 0, 0.4588235, 1, 1,
0.3398406, -0.2064872, 1.942402, 0, 0.454902, 1, 1,
0.3459021, -0.6265313, 2.799517, 0, 0.4470588, 1, 1,
0.3533991, 0.937527, -0.5399185, 0, 0.4431373, 1, 1,
0.3596917, 1.856559, -1.429215, 0, 0.4352941, 1, 1,
0.3600151, -0.8854461, 2.713513, 0, 0.4313726, 1, 1,
0.3600338, -0.2303997, 1.588653, 0, 0.4235294, 1, 1,
0.3630788, 0.8657625, 0.4085343, 0, 0.4196078, 1, 1,
0.3631331, 0.8452196, 0.3818908, 0, 0.4117647, 1, 1,
0.3688122, -2.364768, 2.903101, 0, 0.4078431, 1, 1,
0.3703981, -0.4802039, 1.69702, 0, 0.4, 1, 1,
0.3718061, -1.880451, 2.506238, 0, 0.3921569, 1, 1,
0.3722097, -0.3385562, 1.652311, 0, 0.3882353, 1, 1,
0.376777, 0.4059866, -1.1416, 0, 0.3803922, 1, 1,
0.3774884, -0.7326328, 1.695809, 0, 0.3764706, 1, 1,
0.3852876, 0.9210119, 1.019464, 0, 0.3686275, 1, 1,
0.3889663, -1.543442, 3.532405, 0, 0.3647059, 1, 1,
0.3925882, 0.09496615, 2.369387, 0, 0.3568628, 1, 1,
0.393528, 0.7349082, 0.8084633, 0, 0.3529412, 1, 1,
0.3974278, 1.505046, 2.439631, 0, 0.345098, 1, 1,
0.3991691, -0.471245, 2.203457, 0, 0.3411765, 1, 1,
0.3995981, -0.6212973, 0.9374405, 0, 0.3333333, 1, 1,
0.4026361, 0.533941, 1.660883, 0, 0.3294118, 1, 1,
0.4029582, -0.5095974, 2.341845, 0, 0.3215686, 1, 1,
0.4082775, -1.475213, 4.238961, 0, 0.3176471, 1, 1,
0.4087883, -0.8161991, 1.993795, 0, 0.3098039, 1, 1,
0.4122112, -1.361056, 1.578123, 0, 0.3058824, 1, 1,
0.4128242, 0.6811219, -0.6181362, 0, 0.2980392, 1, 1,
0.41328, -0.1218936, 1.43579, 0, 0.2901961, 1, 1,
0.4141691, 0.8852819, -0.7317932, 0, 0.2862745, 1, 1,
0.4158008, -0.1124764, 2.008346, 0, 0.2784314, 1, 1,
0.4158206, 0.8779973, 1.653007, 0, 0.2745098, 1, 1,
0.4158834, 0.9313284, 2.304631, 0, 0.2666667, 1, 1,
0.4191416, -0.04694797, 0.6975739, 0, 0.2627451, 1, 1,
0.4206437, 0.4906627, -0.6467764, 0, 0.254902, 1, 1,
0.4209431, 0.3377886, 1.683393, 0, 0.2509804, 1, 1,
0.4284826, -1.501185, 1.047763, 0, 0.2431373, 1, 1,
0.4328626, -1.856656, 3.220331, 0, 0.2392157, 1, 1,
0.4332981, 0.2319417, 2.792037, 0, 0.2313726, 1, 1,
0.4362997, 1.178624, 0.1581773, 0, 0.227451, 1, 1,
0.4377102, -0.1400249, 2.246929, 0, 0.2196078, 1, 1,
0.4378064, 0.2662766, -0.1306275, 0, 0.2156863, 1, 1,
0.4427027, 0.7147095, 1.235144, 0, 0.2078431, 1, 1,
0.4456744, 0.05597378, 1.748553, 0, 0.2039216, 1, 1,
0.4460486, -0.2663412, 2.571767, 0, 0.1960784, 1, 1,
0.4471267, -0.3772796, 1.003332, 0, 0.1882353, 1, 1,
0.4531606, -2.119659, 2.144089, 0, 0.1843137, 1, 1,
0.4540415, -1.135117, 3.956111, 0, 0.1764706, 1, 1,
0.4570153, -0.7338977, 0.3027941, 0, 0.172549, 1, 1,
0.4580241, 0.3590602, 0.1046224, 0, 0.1647059, 1, 1,
0.4603088, 1.846721, 0.7606294, 0, 0.1607843, 1, 1,
0.4606338, -1.996319, 2.103525, 0, 0.1529412, 1, 1,
0.460957, 0.478772, 1.562361, 0, 0.1490196, 1, 1,
0.4633175, 0.9981911, 1.582984, 0, 0.1411765, 1, 1,
0.4808136, -1.1425, 3.307411, 0, 0.1372549, 1, 1,
0.4833835, 0.358681, 0.5800911, 0, 0.1294118, 1, 1,
0.4843006, 0.8670869, 1.148168, 0, 0.1254902, 1, 1,
0.4843307, -0.9089431, 2.938467, 0, 0.1176471, 1, 1,
0.4879349, -0.3133391, 1.466441, 0, 0.1137255, 1, 1,
0.4898951, -0.7136138, 3.842799, 0, 0.1058824, 1, 1,
0.4938098, -1.323497, 3.224942, 0, 0.09803922, 1, 1,
0.4956892, -0.9116426, 3.866393, 0, 0.09411765, 1, 1,
0.4996986, 0.3344894, 0.2198348, 0, 0.08627451, 1, 1,
0.5048947, -0.9073984, 1.783972, 0, 0.08235294, 1, 1,
0.5069814, 0.1598688, 1.216935, 0, 0.07450981, 1, 1,
0.5095409, -0.7069383, 3.051119, 0, 0.07058824, 1, 1,
0.5096772, -1.016199, 3.819319, 0, 0.0627451, 1, 1,
0.5123022, -2.014582, 2.707938, 0, 0.05882353, 1, 1,
0.5139604, 1.350582, -0.3353676, 0, 0.05098039, 1, 1,
0.5142718, -1.190124, 2.787674, 0, 0.04705882, 1, 1,
0.5173803, 0.9334612, 1.316297, 0, 0.03921569, 1, 1,
0.521278, -1.283083, 2.651588, 0, 0.03529412, 1, 1,
0.5234035, -1.0508, 2.075153, 0, 0.02745098, 1, 1,
0.5241993, 0.914856, 0.9217744, 0, 0.02352941, 1, 1,
0.5242503, -0.3598274, 2.343524, 0, 0.01568628, 1, 1,
0.5245048, 0.4989457, 0.4567125, 0, 0.01176471, 1, 1,
0.5246702, 0.7081065, 0.4025108, 0, 0.003921569, 1, 1,
0.5327086, -0.8832471, 0.8594108, 0.003921569, 0, 1, 1,
0.5346528, -1.22251, 2.025137, 0.007843138, 0, 1, 1,
0.5349908, -0.1806321, 2.318777, 0.01568628, 0, 1, 1,
0.5357096, 0.1781991, -0.7712104, 0.01960784, 0, 1, 1,
0.5425673, 0.3828538, 1.299958, 0.02745098, 0, 1, 1,
0.5440852, -0.8480402, 3.212675, 0.03137255, 0, 1, 1,
0.5454258, -0.4932339, 1.887058, 0.03921569, 0, 1, 1,
0.5459941, 1.523497, 0.6807192, 0.04313726, 0, 1, 1,
0.5603272, -0.3744546, 1.219808, 0.05098039, 0, 1, 1,
0.5619864, -0.4575595, 2.893747, 0.05490196, 0, 1, 1,
0.5624226, 0.4664265, -0.5666506, 0.0627451, 0, 1, 1,
0.563692, 0.3728572, 2.621613, 0.06666667, 0, 1, 1,
0.5703908, 0.4415666, 1.202362, 0.07450981, 0, 1, 1,
0.5707166, 0.01626102, 1.155818, 0.07843138, 0, 1, 1,
0.572684, 1.089036, 1.156945, 0.08627451, 0, 1, 1,
0.5729559, 1.468225, 0.3344833, 0.09019608, 0, 1, 1,
0.5737567, 0.5170329, -0.2582862, 0.09803922, 0, 1, 1,
0.5763129, -0.9182129, 4.709414, 0.1058824, 0, 1, 1,
0.5786472, 0.6083996, 2.111767, 0.1098039, 0, 1, 1,
0.581337, -0.9384809, 3.905748, 0.1176471, 0, 1, 1,
0.583146, -0.593245, 0.4297325, 0.1215686, 0, 1, 1,
0.5931473, -0.3022618, 2.406784, 0.1294118, 0, 1, 1,
0.594256, -1.393209, 2.632172, 0.1333333, 0, 1, 1,
0.6084015, 1.196025, 1.489371, 0.1411765, 0, 1, 1,
0.6084969, -0.2869492, 2.27148, 0.145098, 0, 1, 1,
0.6128814, 0.6934136, -0.2208703, 0.1529412, 0, 1, 1,
0.6138617, -0.8090869, 2.781366, 0.1568628, 0, 1, 1,
0.6187512, -0.7869928, 1.920419, 0.1647059, 0, 1, 1,
0.6230426, -0.6083796, 2.340415, 0.1686275, 0, 1, 1,
0.6238634, 0.2860641, 2.790516, 0.1764706, 0, 1, 1,
0.6252768, -1.292368, 1.070978, 0.1803922, 0, 1, 1,
0.6253368, -0.1894206, 3.2997, 0.1882353, 0, 1, 1,
0.6276612, -1.6506, 3.286725, 0.1921569, 0, 1, 1,
0.6295471, -0.25234, 2.723512, 0.2, 0, 1, 1,
0.6296992, -1.608052, 4.679482, 0.2078431, 0, 1, 1,
0.6324137, 0.01420127, 1.149748, 0.2117647, 0, 1, 1,
0.6334391, -1.784379, 4.884737, 0.2196078, 0, 1, 1,
0.6339718, 0.417888, 0.99922, 0.2235294, 0, 1, 1,
0.6387306, 0.5387222, 2.483459, 0.2313726, 0, 1, 1,
0.6433048, 0.4820059, 2.075975, 0.2352941, 0, 1, 1,
0.6436574, -1.602256, 2.548814, 0.2431373, 0, 1, 1,
0.6438404, 0.6896671, 3.624138, 0.2470588, 0, 1, 1,
0.6441489, 0.1441291, 1.073012, 0.254902, 0, 1, 1,
0.6444059, -0.1342241, 1.260886, 0.2588235, 0, 1, 1,
0.6470233, 0.4373499, 0.2732114, 0.2666667, 0, 1, 1,
0.6485705, 1.177854, 2.251442, 0.2705882, 0, 1, 1,
0.6502067, 0.1047208, -0.09449877, 0.2784314, 0, 1, 1,
0.654696, 0.4558889, 0.9798523, 0.282353, 0, 1, 1,
0.6557555, -0.5083433, 1.114086, 0.2901961, 0, 1, 1,
0.6570621, -0.6265679, 2.262491, 0.2941177, 0, 1, 1,
0.6594653, -0.7706383, 1.868263, 0.3019608, 0, 1, 1,
0.6600814, 1.465748, 0.2669372, 0.3098039, 0, 1, 1,
0.6612292, -0.928827, 2.184732, 0.3137255, 0, 1, 1,
0.6638933, 0.9775833, 1.519509, 0.3215686, 0, 1, 1,
0.6640119, 2.341509, 0.01761444, 0.3254902, 0, 1, 1,
0.6657817, 1.061637, 0.4511047, 0.3333333, 0, 1, 1,
0.6733187, 0.1540278, 2.244948, 0.3372549, 0, 1, 1,
0.6782623, 0.6886887, 0.7080549, 0.345098, 0, 1, 1,
0.6961774, -0.1159973, 1.109317, 0.3490196, 0, 1, 1,
0.6991562, 1.330643, -1.611278, 0.3568628, 0, 1, 1,
0.7003669, -2.273107, 3.562165, 0.3607843, 0, 1, 1,
0.7010406, -0.6509919, 0.3170184, 0.3686275, 0, 1, 1,
0.7037556, 1.179063, -0.0009343373, 0.372549, 0, 1, 1,
0.7051879, 1.458944, -0.1367762, 0.3803922, 0, 1, 1,
0.7074816, 2.107914, 0.4587823, 0.3843137, 0, 1, 1,
0.7076835, 0.6497206, 1.628341, 0.3921569, 0, 1, 1,
0.7124341, -1.849501, 2.447871, 0.3960784, 0, 1, 1,
0.7173769, -0.224362, 1.678428, 0.4039216, 0, 1, 1,
0.7224448, 0.0612106, 1.268634, 0.4117647, 0, 1, 1,
0.7236574, 1.135506, 1.092118, 0.4156863, 0, 1, 1,
0.7247481, 0.6849366, 0.9645085, 0.4235294, 0, 1, 1,
0.72601, -3.292278, 2.234431, 0.427451, 0, 1, 1,
0.7294217, 0.9806226, 2.359304, 0.4352941, 0, 1, 1,
0.7297204, -0.508765, 0.5649471, 0.4392157, 0, 1, 1,
0.7300112, -0.6530849, 2.847547, 0.4470588, 0, 1, 1,
0.7323664, -0.77623, 2.435322, 0.4509804, 0, 1, 1,
0.7335235, 2.557624, 0.4080516, 0.4588235, 0, 1, 1,
0.7347262, -1.497789, 1.056643, 0.4627451, 0, 1, 1,
0.7349145, 0.7288759, 2.026801, 0.4705882, 0, 1, 1,
0.7358698, -0.9807724, 3.266575, 0.4745098, 0, 1, 1,
0.7389427, -1.152896, 2.306844, 0.4823529, 0, 1, 1,
0.7412862, 0.1975981, 0.9930457, 0.4862745, 0, 1, 1,
0.7449213, -1.176649, 4.90122, 0.4941176, 0, 1, 1,
0.7452147, -0.2047255, 2.913826, 0.5019608, 0, 1, 1,
0.7484631, 0.1743238, 0.6954681, 0.5058824, 0, 1, 1,
0.7494472, -1.101315, 2.245, 0.5137255, 0, 1, 1,
0.7507694, 0.4960171, 2.575015, 0.5176471, 0, 1, 1,
0.7537888, 0.6426596, 2.855869, 0.5254902, 0, 1, 1,
0.7551042, -0.2132386, 3.789449, 0.5294118, 0, 1, 1,
0.7554365, -0.75472, 3.60354, 0.5372549, 0, 1, 1,
0.766999, 0.2110654, 1.000826, 0.5411765, 0, 1, 1,
0.768545, 0.4619288, 1.451738, 0.5490196, 0, 1, 1,
0.771997, 0.2202281, -0.1528246, 0.5529412, 0, 1, 1,
0.7721492, -0.1309539, 1.7651, 0.5607843, 0, 1, 1,
0.7782949, 0.8170519, 0.8930197, 0.5647059, 0, 1, 1,
0.7831625, 0.3647922, 0.6778175, 0.572549, 0, 1, 1,
0.7910973, -0.2587621, 0.873617, 0.5764706, 0, 1, 1,
0.7912699, 0.6363408, 0.4976341, 0.5843138, 0, 1, 1,
0.7937695, 0.4833565, 1.945154, 0.5882353, 0, 1, 1,
0.8014186, 0.7913892, 0.299472, 0.5960785, 0, 1, 1,
0.8199463, 0.8158275, 1.360915, 0.6039216, 0, 1, 1,
0.8257192, -0.6631491, 1.608575, 0.6078432, 0, 1, 1,
0.8320193, -0.289744, 2.555012, 0.6156863, 0, 1, 1,
0.8423371, -0.4457124, 3.493194, 0.6196079, 0, 1, 1,
0.8429409, 1.169181, 1.386857, 0.627451, 0, 1, 1,
0.8443651, -0.8606421, 2.132396, 0.6313726, 0, 1, 1,
0.8445557, 1.764924, -0.05917602, 0.6392157, 0, 1, 1,
0.8549827, 1.114706, 0.729565, 0.6431373, 0, 1, 1,
0.8561442, -0.2331098, 1.511613, 0.6509804, 0, 1, 1,
0.8561506, -0.9858083, 3.305106, 0.654902, 0, 1, 1,
0.8573135, 1.121988, 1.269551, 0.6627451, 0, 1, 1,
0.8574553, -1.432744, 3.664145, 0.6666667, 0, 1, 1,
0.8578265, 0.5928744, 1.776325, 0.6745098, 0, 1, 1,
0.8595362, -1.742139, 2.109491, 0.6784314, 0, 1, 1,
0.8604107, 2.02925, 1.521301, 0.6862745, 0, 1, 1,
0.8615188, 1.160301, -0.4089111, 0.6901961, 0, 1, 1,
0.86332, 0.8435959, 1.907944, 0.6980392, 0, 1, 1,
0.8671573, -0.1374166, 0.9411046, 0.7058824, 0, 1, 1,
0.8687881, 0.6548437, 0.1893394, 0.7098039, 0, 1, 1,
0.8696633, 0.8251681, 1.764063, 0.7176471, 0, 1, 1,
0.8706761, -0.61487, 3.920805, 0.7215686, 0, 1, 1,
0.8718655, 0.7182429, 2.225501, 0.7294118, 0, 1, 1,
0.8761498, -0.09188013, 2.648575, 0.7333333, 0, 1, 1,
0.8810117, -1.498958, 2.553546, 0.7411765, 0, 1, 1,
0.8886564, 1.244474, 0.3845041, 0.7450981, 0, 1, 1,
0.8926165, 1.332901, 1.323269, 0.7529412, 0, 1, 1,
0.8944926, 1.02169, 0.6611022, 0.7568628, 0, 1, 1,
0.9064803, -0.1941255, -0.02827573, 0.7647059, 0, 1, 1,
0.9065481, -0.01169812, 1.668176, 0.7686275, 0, 1, 1,
0.9097304, 0.4978215, 0.4950928, 0.7764706, 0, 1, 1,
0.91197, -0.2936442, 3.758522, 0.7803922, 0, 1, 1,
0.9197128, 2.371264, 1.731743, 0.7882353, 0, 1, 1,
0.9201016, -0.378633, 1.133391, 0.7921569, 0, 1, 1,
0.9245818, -0.225723, 1.210277, 0.8, 0, 1, 1,
0.9246304, 2.142689, 0.8225029, 0.8078431, 0, 1, 1,
0.9417196, 1.032661, 1.176864, 0.8117647, 0, 1, 1,
0.9454724, -1.369599, 3.275526, 0.8196079, 0, 1, 1,
0.9455727, 0.1505702, 2.176247, 0.8235294, 0, 1, 1,
0.9485713, -0.6461632, 2.122166, 0.8313726, 0, 1, 1,
0.9603493, -0.5021858, 2.807574, 0.8352941, 0, 1, 1,
0.9644238, -0.2321222, 2.604055, 0.8431373, 0, 1, 1,
0.9690487, -1.107996, 2.847971, 0.8470588, 0, 1, 1,
0.9704323, 0.2554111, -0.06221729, 0.854902, 0, 1, 1,
0.9741752, -1.890486, 2.69006, 0.8588235, 0, 1, 1,
0.9768287, 1.555138, 1.309174, 0.8666667, 0, 1, 1,
0.9790638, -0.5700436, 1.630895, 0.8705882, 0, 1, 1,
0.9795164, -1.179797, 2.499855, 0.8784314, 0, 1, 1,
0.9797896, -0.03594317, 2.581901, 0.8823529, 0, 1, 1,
0.9851645, -0.7777317, 1.134591, 0.8901961, 0, 1, 1,
0.9869749, -0.8163495, 2.243803, 0.8941177, 0, 1, 1,
0.9944971, 1.468055, 0.2874353, 0.9019608, 0, 1, 1,
0.9951856, -0.2333714, 0.6430687, 0.9098039, 0, 1, 1,
1.00002, 0.09689204, 1.24112, 0.9137255, 0, 1, 1,
1.003008, 0.2615915, 2.165004, 0.9215686, 0, 1, 1,
1.003294, -0.7539489, 2.009083, 0.9254902, 0, 1, 1,
1.005448, 1.126143, -0.1442237, 0.9333333, 0, 1, 1,
1.010985, -0.5742354, 0.3579975, 0.9372549, 0, 1, 1,
1.011176, -0.4326483, 3.122561, 0.945098, 0, 1, 1,
1.013168, 0.02570738, 1.139571, 0.9490196, 0, 1, 1,
1.01694, -0.2400122, 1.973886, 0.9568627, 0, 1, 1,
1.019139, -1.074585, 1.510728, 0.9607843, 0, 1, 1,
1.021058, 1.372966, 2.11514, 0.9686275, 0, 1, 1,
1.02267, -0.4784977, 2.674623, 0.972549, 0, 1, 1,
1.029859, -1.129958, 1.98003, 0.9803922, 0, 1, 1,
1.035474, -0.9593133, 2.659025, 0.9843137, 0, 1, 1,
1.039417, -0.3637753, 3.079572, 0.9921569, 0, 1, 1,
1.042035, 0.4664309, 0.04997772, 0.9960784, 0, 1, 1,
1.043039, -0.07220772, 0.1077468, 1, 0, 0.9960784, 1,
1.04528, -1.772563, 1.28862, 1, 0, 0.9882353, 1,
1.053413, 0.991731, 3.468785, 1, 0, 0.9843137, 1,
1.056769, 0.1874961, 1.111055, 1, 0, 0.9764706, 1,
1.060112, 0.1418072, 0.02786316, 1, 0, 0.972549, 1,
1.083758, 0.9803072, -0.8747846, 1, 0, 0.9647059, 1,
1.087225, 0.6457607, 0.005479056, 1, 0, 0.9607843, 1,
1.093126, 0.7400708, 0.8845834, 1, 0, 0.9529412, 1,
1.093695, 0.3983382, 1.587806, 1, 0, 0.9490196, 1,
1.09748, -0.6820563, 2.681944, 1, 0, 0.9411765, 1,
1.100586, -0.3290069, 2.729805, 1, 0, 0.9372549, 1,
1.102113, 0.8946581, -1.033454, 1, 0, 0.9294118, 1,
1.110095, 0.35517, 0.3206559, 1, 0, 0.9254902, 1,
1.112059, -3.222283, 3.662677, 1, 0, 0.9176471, 1,
1.117827, -0.5912447, 1.703171, 1, 0, 0.9137255, 1,
1.125767, 0.01194027, 2.330652, 1, 0, 0.9058824, 1,
1.125878, -0.2133925, 0.9121287, 1, 0, 0.9019608, 1,
1.137899, -0.3249308, 1.979816, 1, 0, 0.8941177, 1,
1.142966, 0.6268904, 0.7834279, 1, 0, 0.8862745, 1,
1.14361, 1.655008, -0.2125673, 1, 0, 0.8823529, 1,
1.147738, -0.5955324, 3.799593, 1, 0, 0.8745098, 1,
1.148372, -1.04695, 2.488149, 1, 0, 0.8705882, 1,
1.148397, -0.1284105, 1.563776, 1, 0, 0.8627451, 1,
1.150055, 0.2403217, -0.07554105, 1, 0, 0.8588235, 1,
1.150128, -0.1309796, 0.8401368, 1, 0, 0.8509804, 1,
1.150897, -0.3597497, 3.241598, 1, 0, 0.8470588, 1,
1.15105, 0.1229985, 0.3239761, 1, 0, 0.8392157, 1,
1.154249, 1.234432, 0.6384253, 1, 0, 0.8352941, 1,
1.157988, 0.8435268, -0.00960314, 1, 0, 0.827451, 1,
1.163729, -0.1687436, 0.7746273, 1, 0, 0.8235294, 1,
1.167167, 0.1590918, 0.7803145, 1, 0, 0.8156863, 1,
1.17626, -0.237735, 1.140682, 1, 0, 0.8117647, 1,
1.177966, 2.759804, -0.6017222, 1, 0, 0.8039216, 1,
1.185306, -0.05920526, 2.850973, 1, 0, 0.7960784, 1,
1.194335, 1.405892, 1.741476, 1, 0, 0.7921569, 1,
1.197426, -0.4581253, 0.3797913, 1, 0, 0.7843137, 1,
1.19982, -0.613649, 1.645159, 1, 0, 0.7803922, 1,
1.20449, 0.9349108, 2.249845, 1, 0, 0.772549, 1,
1.206801, 0.7784911, 1.142943, 1, 0, 0.7686275, 1,
1.215497, -0.4498323, 3.170973, 1, 0, 0.7607843, 1,
1.220294, 0.4446088, -0.5205929, 1, 0, 0.7568628, 1,
1.224168, 0.1391818, -0.1657514, 1, 0, 0.7490196, 1,
1.229304, -0.2323755, 1.029262, 1, 0, 0.7450981, 1,
1.232213, 0.1078009, 0.2238681, 1, 0, 0.7372549, 1,
1.240893, 1.71954, 2.125102, 1, 0, 0.7333333, 1,
1.245185, 1.333297, 3.180436, 1, 0, 0.7254902, 1,
1.25382, -2.463965, 1.886068, 1, 0, 0.7215686, 1,
1.262992, -0.9483475, 0.7590616, 1, 0, 0.7137255, 1,
1.277494, 0.1242681, 1.038096, 1, 0, 0.7098039, 1,
1.277532, 0.2284881, 1.410907, 1, 0, 0.7019608, 1,
1.302649, -0.284766, 2.17418, 1, 0, 0.6941177, 1,
1.305883, -2.138172, 0.9556795, 1, 0, 0.6901961, 1,
1.31421, -0.7907417, 3.98748, 1, 0, 0.682353, 1,
1.32277, -0.3787919, 1.189582, 1, 0, 0.6784314, 1,
1.333367, 0.4825297, 1.481958, 1, 0, 0.6705883, 1,
1.334126, -1.271099, 3.643381, 1, 0, 0.6666667, 1,
1.336819, -0.4442686, 1.326643, 1, 0, 0.6588235, 1,
1.339416, -0.7600707, 0.9348212, 1, 0, 0.654902, 1,
1.343616, -0.8441316, 3.448309, 1, 0, 0.6470588, 1,
1.350478, 2.259047, 0.04757955, 1, 0, 0.6431373, 1,
1.358534, 2.308036, 1.885633, 1, 0, 0.6352941, 1,
1.375082, -1.0934, 2.174508, 1, 0, 0.6313726, 1,
1.375592, 0.4664401, -8.788541e-05, 1, 0, 0.6235294, 1,
1.396092, -1.212676, 2.858111, 1, 0, 0.6196079, 1,
1.399104, 0.7102743, -1.644915, 1, 0, 0.6117647, 1,
1.400416, 0.773719, 1.750267, 1, 0, 0.6078432, 1,
1.403144, 0.1697734, 1.568956, 1, 0, 0.6, 1,
1.409775, -0.0458842, 1.74298, 1, 0, 0.5921569, 1,
1.413945, 0.6232843, 1.155175, 1, 0, 0.5882353, 1,
1.414173, -1.836138, 2.445364, 1, 0, 0.5803922, 1,
1.427459, -0.04607451, 2.946184, 1, 0, 0.5764706, 1,
1.431666, 0.2247457, 0.2365753, 1, 0, 0.5686275, 1,
1.43231, -0.3203317, 1.834747, 1, 0, 0.5647059, 1,
1.445597, 1.258206, 1.024397, 1, 0, 0.5568628, 1,
1.458816, 1.114742, 1.015393, 1, 0, 0.5529412, 1,
1.463644, -0.153405, 0.8094391, 1, 0, 0.5450981, 1,
1.467108, 2.194742, -0.6561245, 1, 0, 0.5411765, 1,
1.476629, -0.1724745, 0.6260785, 1, 0, 0.5333334, 1,
1.483495, 0.4218584, 0.7743807, 1, 0, 0.5294118, 1,
1.485138, 0.4348763, 1.202093, 1, 0, 0.5215687, 1,
1.487833, 0.8657374, 0.6232576, 1, 0, 0.5176471, 1,
1.487981, -1.326675, 2.484002, 1, 0, 0.509804, 1,
1.492471, -0.3887622, 3.236409, 1, 0, 0.5058824, 1,
1.495962, -0.4048614, 1.383106, 1, 0, 0.4980392, 1,
1.514493, 1.920046, 0.08767132, 1, 0, 0.4901961, 1,
1.517496, -1.340779, 2.385993, 1, 0, 0.4862745, 1,
1.526274, -0.1344962, 1.654809, 1, 0, 0.4784314, 1,
1.538781, -0.1306306, 1.704185, 1, 0, 0.4745098, 1,
1.539845, 0.4898522, 0.6525437, 1, 0, 0.4666667, 1,
1.55569, -0.1688453, 1.533845, 1, 0, 0.4627451, 1,
1.569242, -1.699764, 3.289262, 1, 0, 0.454902, 1,
1.570353, 0.1913454, 0.2349879, 1, 0, 0.4509804, 1,
1.57125, -0.1005046, 1.949049, 1, 0, 0.4431373, 1,
1.576555, -0.3514631, 2.082018, 1, 0, 0.4392157, 1,
1.594311, -0.6770635, 2.272628, 1, 0, 0.4313726, 1,
1.609881, -1.555042, 3.902813, 1, 0, 0.427451, 1,
1.615342, -2.504284, 2.738827, 1, 0, 0.4196078, 1,
1.631049, 0.32542, 3.798163, 1, 0, 0.4156863, 1,
1.642584, 1.95697, 0.4665889, 1, 0, 0.4078431, 1,
1.649073, 0.1286922, 1.11325, 1, 0, 0.4039216, 1,
1.653998, 0.6883599, 2.100204, 1, 0, 0.3960784, 1,
1.663041, 1.238291, 1.7969, 1, 0, 0.3882353, 1,
1.677524, 0.2663683, 1.688016, 1, 0, 0.3843137, 1,
1.678338, -1.312906, 2.566492, 1, 0, 0.3764706, 1,
1.680725, -2.205458, 2.935824, 1, 0, 0.372549, 1,
1.68563, 1.836928, 0.5139479, 1, 0, 0.3647059, 1,
1.68932, -0.1647403, 2.356659, 1, 0, 0.3607843, 1,
1.699611, -1.297351, 0.9661514, 1, 0, 0.3529412, 1,
1.702435, -0.1225964, 3.271301, 1, 0, 0.3490196, 1,
1.70785, -0.08432426, 2.830572, 1, 0, 0.3411765, 1,
1.73251, 0.2188111, 2.081517, 1, 0, 0.3372549, 1,
1.737438, 0.5750492, 0.7331206, 1, 0, 0.3294118, 1,
1.743748, 0.4237731, 1.234749, 1, 0, 0.3254902, 1,
1.766548, 0.1713842, 3.178995, 1, 0, 0.3176471, 1,
1.769606, 0.2578934, 2.851372, 1, 0, 0.3137255, 1,
1.776469, -0.6267482, 0.09468424, 1, 0, 0.3058824, 1,
1.810539, -0.1527126, 2.923704, 1, 0, 0.2980392, 1,
1.818266, 1.035138, 1.208821, 1, 0, 0.2941177, 1,
1.840317, -0.5946878, 2.359128, 1, 0, 0.2862745, 1,
1.850011, -1.07079, 3.408973, 1, 0, 0.282353, 1,
1.856753, 1.730841, 0.3514747, 1, 0, 0.2745098, 1,
1.859232, -0.9694518, 1.352589, 1, 0, 0.2705882, 1,
1.862233, 0.2170241, 2.19916, 1, 0, 0.2627451, 1,
1.864448, 0.1766202, 1.493501, 1, 0, 0.2588235, 1,
1.869249, -0.004447477, 1.84183, 1, 0, 0.2509804, 1,
1.891429, 0.7519968, -0.07285836, 1, 0, 0.2470588, 1,
1.894986, 0.5296109, 2.421556, 1, 0, 0.2392157, 1,
1.89707, -1.294622, 2.155487, 1, 0, 0.2352941, 1,
1.909743, 2.121392, -0.2641622, 1, 0, 0.227451, 1,
1.967657, -0.6346712, 2.635563, 1, 0, 0.2235294, 1,
1.967913, -1.866314, 2.352064, 1, 0, 0.2156863, 1,
1.979381, -0.2595444, 2.080742, 1, 0, 0.2117647, 1,
1.986696, 1.512216, 0.7182607, 1, 0, 0.2039216, 1,
1.996677, 0.01717719, 1.534834, 1, 0, 0.1960784, 1,
2.03094, 0.3827762, 1.139953, 1, 0, 0.1921569, 1,
2.035347, 1.075903, 1.700025, 1, 0, 0.1843137, 1,
2.080255, -1.339321, 1.030291, 1, 0, 0.1803922, 1,
2.086118, -1.540544, 1.910436, 1, 0, 0.172549, 1,
2.094755, -1.041716, 2.751531, 1, 0, 0.1686275, 1,
2.10178, -0.8538316, 3.677711, 1, 0, 0.1607843, 1,
2.104438, 0.4663016, 1.467864, 1, 0, 0.1568628, 1,
2.104764, 0.611629, 0.74158, 1, 0, 0.1490196, 1,
2.106444, 0.7381942, 2.912512, 1, 0, 0.145098, 1,
2.126513, 0.5654174, 0.7498024, 1, 0, 0.1372549, 1,
2.140302, -1.022296, 1.800407, 1, 0, 0.1333333, 1,
2.178932, 0.158009, 2.396848, 1, 0, 0.1254902, 1,
2.179695, 0.173531, 1.722556, 1, 0, 0.1215686, 1,
2.184348, 0.5636511, 1.28294, 1, 0, 0.1137255, 1,
2.202941, 0.3719919, 0.4724343, 1, 0, 0.1098039, 1,
2.320505, -0.6847638, -0.3532199, 1, 0, 0.1019608, 1,
2.329484, -1.054241, 3.278024, 1, 0, 0.09411765, 1,
2.377746, 0.2235281, 0.3008809, 1, 0, 0.09019608, 1,
2.39831, -0.06157497, 1.111288, 1, 0, 0.08235294, 1,
2.406409, -1.954683, 2.646733, 1, 0, 0.07843138, 1,
2.414012, 1.492439, 2.257313, 1, 0, 0.07058824, 1,
2.464587, -0.4887043, 0.4659154, 1, 0, 0.06666667, 1,
2.520738, 0.7094826, 1.458205, 1, 0, 0.05882353, 1,
2.529422, -0.03525279, 0.4011461, 1, 0, 0.05490196, 1,
2.639316, 0.02558265, 1.012819, 1, 0, 0.04705882, 1,
2.641424, 0.03724238, 0.6335416, 1, 0, 0.04313726, 1,
2.8148, -0.675577, 0.9768769, 1, 0, 0.03529412, 1,
2.819977, 1.418847, 1.230272, 1, 0, 0.03137255, 1,
2.861687, 0.03999975, 2.233937, 1, 0, 0.02352941, 1,
2.871256, -0.8366498, -0.6081171, 1, 0, 0.01960784, 1,
2.901015, -0.4842364, 1.226868, 1, 0, 0.01176471, 1,
3.173092, 0.03698806, 1.263026, 1, 0, 0.007843138, 1
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
-0.08269882, -4.318106, -7.161071, 0, -0.5, 0.5, 0.5,
-0.08269882, -4.318106, -7.161071, 1, -0.5, 0.5, 0.5,
-0.08269882, -4.318106, -7.161071, 1, 1.5, 0.5, 0.5,
-0.08269882, -4.318106, -7.161071, 0, 1.5, 0.5, 0.5
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
-4.442203, -0.2662371, -7.161071, 0, -0.5, 0.5, 0.5,
-4.442203, -0.2662371, -7.161071, 1, -0.5, 0.5, 0.5,
-4.442203, -0.2662371, -7.161071, 1, 1.5, 0.5, 0.5,
-4.442203, -0.2662371, -7.161071, 0, 1.5, 0.5, 0.5
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
-4.442203, -4.318106, -0.2156, 0, -0.5, 0.5, 0.5,
-4.442203, -4.318106, -0.2156, 1, -0.5, 0.5, 0.5,
-4.442203, -4.318106, -0.2156, 1, 1.5, 0.5, 0.5,
-4.442203, -4.318106, -0.2156, 0, 1.5, 0.5, 0.5
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
-3, -3.383059, -5.55827,
3, -3.383059, -5.55827,
-3, -3.383059, -5.55827,
-3, -3.5389, -5.825404,
-2, -3.383059, -5.55827,
-2, -3.5389, -5.825404,
-1, -3.383059, -5.55827,
-1, -3.5389, -5.825404,
0, -3.383059, -5.55827,
0, -3.5389, -5.825404,
1, -3.383059, -5.55827,
1, -3.5389, -5.825404,
2, -3.383059, -5.55827,
2, -3.5389, -5.825404,
3, -3.383059, -5.55827,
3, -3.5389, -5.825404
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
-3, -3.850583, -6.359671, 0, -0.5, 0.5, 0.5,
-3, -3.850583, -6.359671, 1, -0.5, 0.5, 0.5,
-3, -3.850583, -6.359671, 1, 1.5, 0.5, 0.5,
-3, -3.850583, -6.359671, 0, 1.5, 0.5, 0.5,
-2, -3.850583, -6.359671, 0, -0.5, 0.5, 0.5,
-2, -3.850583, -6.359671, 1, -0.5, 0.5, 0.5,
-2, -3.850583, -6.359671, 1, 1.5, 0.5, 0.5,
-2, -3.850583, -6.359671, 0, 1.5, 0.5, 0.5,
-1, -3.850583, -6.359671, 0, -0.5, 0.5, 0.5,
-1, -3.850583, -6.359671, 1, -0.5, 0.5, 0.5,
-1, -3.850583, -6.359671, 1, 1.5, 0.5, 0.5,
-1, -3.850583, -6.359671, 0, 1.5, 0.5, 0.5,
0, -3.850583, -6.359671, 0, -0.5, 0.5, 0.5,
0, -3.850583, -6.359671, 1, -0.5, 0.5, 0.5,
0, -3.850583, -6.359671, 1, 1.5, 0.5, 0.5,
0, -3.850583, -6.359671, 0, 1.5, 0.5, 0.5,
1, -3.850583, -6.359671, 0, -0.5, 0.5, 0.5,
1, -3.850583, -6.359671, 1, -0.5, 0.5, 0.5,
1, -3.850583, -6.359671, 1, 1.5, 0.5, 0.5,
1, -3.850583, -6.359671, 0, 1.5, 0.5, 0.5,
2, -3.850583, -6.359671, 0, -0.5, 0.5, 0.5,
2, -3.850583, -6.359671, 1, -0.5, 0.5, 0.5,
2, -3.850583, -6.359671, 1, 1.5, 0.5, 0.5,
2, -3.850583, -6.359671, 0, 1.5, 0.5, 0.5,
3, -3.850583, -6.359671, 0, -0.5, 0.5, 0.5,
3, -3.850583, -6.359671, 1, -0.5, 0.5, 0.5,
3, -3.850583, -6.359671, 1, 1.5, 0.5, 0.5,
3, -3.850583, -6.359671, 0, 1.5, 0.5, 0.5
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
-3.436163, -3, -5.55827,
-3.436163, 2, -5.55827,
-3.436163, -3, -5.55827,
-3.603837, -3, -5.825404,
-3.436163, -2, -5.55827,
-3.603837, -2, -5.825404,
-3.436163, -1, -5.55827,
-3.603837, -1, -5.825404,
-3.436163, 0, -5.55827,
-3.603837, 0, -5.825404,
-3.436163, 1, -5.55827,
-3.603837, 1, -5.825404,
-3.436163, 2, -5.55827,
-3.603837, 2, -5.825404
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
-3.939183, -3, -6.359671, 0, -0.5, 0.5, 0.5,
-3.939183, -3, -6.359671, 1, -0.5, 0.5, 0.5,
-3.939183, -3, -6.359671, 1, 1.5, 0.5, 0.5,
-3.939183, -3, -6.359671, 0, 1.5, 0.5, 0.5,
-3.939183, -2, -6.359671, 0, -0.5, 0.5, 0.5,
-3.939183, -2, -6.359671, 1, -0.5, 0.5, 0.5,
-3.939183, -2, -6.359671, 1, 1.5, 0.5, 0.5,
-3.939183, -2, -6.359671, 0, 1.5, 0.5, 0.5,
-3.939183, -1, -6.359671, 0, -0.5, 0.5, 0.5,
-3.939183, -1, -6.359671, 1, -0.5, 0.5, 0.5,
-3.939183, -1, -6.359671, 1, 1.5, 0.5, 0.5,
-3.939183, -1, -6.359671, 0, 1.5, 0.5, 0.5,
-3.939183, 0, -6.359671, 0, -0.5, 0.5, 0.5,
-3.939183, 0, -6.359671, 1, -0.5, 0.5, 0.5,
-3.939183, 0, -6.359671, 1, 1.5, 0.5, 0.5,
-3.939183, 0, -6.359671, 0, 1.5, 0.5, 0.5,
-3.939183, 1, -6.359671, 0, -0.5, 0.5, 0.5,
-3.939183, 1, -6.359671, 1, -0.5, 0.5, 0.5,
-3.939183, 1, -6.359671, 1, 1.5, 0.5, 0.5,
-3.939183, 1, -6.359671, 0, 1.5, 0.5, 0.5,
-3.939183, 2, -6.359671, 0, -0.5, 0.5, 0.5,
-3.939183, 2, -6.359671, 1, -0.5, 0.5, 0.5,
-3.939183, 2, -6.359671, 1, 1.5, 0.5, 0.5,
-3.939183, 2, -6.359671, 0, 1.5, 0.5, 0.5
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
-3.436163, -3.383059, -4,
-3.436163, -3.383059, 4,
-3.436163, -3.383059, -4,
-3.603837, -3.5389, -4,
-3.436163, -3.383059, -2,
-3.603837, -3.5389, -2,
-3.436163, -3.383059, 0,
-3.603837, -3.5389, 0,
-3.436163, -3.383059, 2,
-3.603837, -3.5389, 2,
-3.436163, -3.383059, 4,
-3.603837, -3.5389, 4
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
-3.939183, -3.850583, -4, 0, -0.5, 0.5, 0.5,
-3.939183, -3.850583, -4, 1, -0.5, 0.5, 0.5,
-3.939183, -3.850583, -4, 1, 1.5, 0.5, 0.5,
-3.939183, -3.850583, -4, 0, 1.5, 0.5, 0.5,
-3.939183, -3.850583, -2, 0, -0.5, 0.5, 0.5,
-3.939183, -3.850583, -2, 1, -0.5, 0.5, 0.5,
-3.939183, -3.850583, -2, 1, 1.5, 0.5, 0.5,
-3.939183, -3.850583, -2, 0, 1.5, 0.5, 0.5,
-3.939183, -3.850583, 0, 0, -0.5, 0.5, 0.5,
-3.939183, -3.850583, 0, 1, -0.5, 0.5, 0.5,
-3.939183, -3.850583, 0, 1, 1.5, 0.5, 0.5,
-3.939183, -3.850583, 0, 0, 1.5, 0.5, 0.5,
-3.939183, -3.850583, 2, 0, -0.5, 0.5, 0.5,
-3.939183, -3.850583, 2, 1, -0.5, 0.5, 0.5,
-3.939183, -3.850583, 2, 1, 1.5, 0.5, 0.5,
-3.939183, -3.850583, 2, 0, 1.5, 0.5, 0.5,
-3.939183, -3.850583, 4, 0, -0.5, 0.5, 0.5,
-3.939183, -3.850583, 4, 1, -0.5, 0.5, 0.5,
-3.939183, -3.850583, 4, 1, 1.5, 0.5, 0.5,
-3.939183, -3.850583, 4, 0, 1.5, 0.5, 0.5
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
-3.436163, -3.383059, -5.55827,
-3.436163, 2.850585, -5.55827,
-3.436163, -3.383059, 5.12707,
-3.436163, 2.850585, 5.12707,
-3.436163, -3.383059, -5.55827,
-3.436163, -3.383059, 5.12707,
-3.436163, 2.850585, -5.55827,
-3.436163, 2.850585, 5.12707,
-3.436163, -3.383059, -5.55827,
3.270766, -3.383059, -5.55827,
-3.436163, -3.383059, 5.12707,
3.270766, -3.383059, 5.12707,
-3.436163, 2.850585, -5.55827,
3.270766, 2.850585, -5.55827,
-3.436163, 2.850585, 5.12707,
3.270766, 2.850585, 5.12707,
3.270766, -3.383059, -5.55827,
3.270766, 2.850585, -5.55827,
3.270766, -3.383059, 5.12707,
3.270766, 2.850585, 5.12707,
3.270766, -3.383059, -5.55827,
3.270766, -3.383059, 5.12707,
3.270766, 2.850585, -5.55827,
3.270766, 2.850585, 5.12707
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
var radius = 7.514109;
var distance = 33.43112;
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
mvMatrix.translate( 0.08269882, 0.2662371, 0.2156 );
mvMatrix.scale( 1.211345, 1.303315, 0.7603316 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.43112);
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
DELAn<-read.table("DELAn.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DELAn$V2
```

```
## Error in eval(expr, envir, enclos): object 'DELAn' not found
```

```r
y<-DELAn$V3
```

```
## Error in eval(expr, envir, enclos): object 'DELAn' not found
```

```r
z<-DELAn$V4
```

```
## Error in eval(expr, envir, enclos): object 'DELAn' not found
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
-3.33849, -0.1594439, -1.442483, 0, 0, 1, 1, 1,
-2.765085, -0.660646, -1.525565, 1, 0, 0, 1, 1,
-2.754844, 1.656529, -0.8409966, 1, 0, 0, 1, 1,
-2.683569, -0.3438796, -2.107755, 1, 0, 0, 1, 1,
-2.654678, 0.309196, -0.8359899, 1, 0, 0, 1, 1,
-2.57291, 0.5918257, -2.591889, 1, 0, 0, 1, 1,
-2.530428, -0.3567237, -2.449168, 0, 0, 0, 1, 1,
-2.505399, 0.2942342, 1.42157, 0, 0, 0, 1, 1,
-2.445604, 0.5352588, -2.210902, 0, 0, 0, 1, 1,
-2.428457, 1.14379, 0.3203228, 0, 0, 0, 1, 1,
-2.401767, -0.3239134, -1.199281, 0, 0, 0, 1, 1,
-2.400032, -0.2943557, -1.892612, 0, 0, 0, 1, 1,
-2.396349, 1.046315, -0.3014609, 0, 0, 0, 1, 1,
-2.385803, -1.425381, -1.090588, 1, 1, 1, 1, 1,
-2.361031, -1.107462, -3.576176, 1, 1, 1, 1, 1,
-2.358044, 1.67119, -0.5424683, 1, 1, 1, 1, 1,
-2.34294, -0.0395934, -2.258873, 1, 1, 1, 1, 1,
-2.322914, -1.112041, -1.629547, 1, 1, 1, 1, 1,
-2.264919, -0.3936309, -0.1733962, 1, 1, 1, 1, 1,
-2.245728, -0.5856428, -2.533392, 1, 1, 1, 1, 1,
-2.163893, -0.5927593, -2.643497, 1, 1, 1, 1, 1,
-2.142492, 0.04199776, -1.165546, 1, 1, 1, 1, 1,
-2.136637, 1.282531, 0.09333058, 1, 1, 1, 1, 1,
-2.122807, -0.03528889, -1.529458, 1, 1, 1, 1, 1,
-2.097605, -1.525104, -3.728774, 1, 1, 1, 1, 1,
-2.081634, -0.3314364, -1.890418, 1, 1, 1, 1, 1,
-2.071135, -0.9492716, -2.114896, 1, 1, 1, 1, 1,
-2.01862, 0.1079114, -1.514672, 1, 1, 1, 1, 1,
-2.009376, -0.7987705, -3.877935, 0, 0, 1, 1, 1,
-1.990779, 0.744256, -2.280443, 1, 0, 0, 1, 1,
-1.969943, -0.8465639, -1.450695, 1, 0, 0, 1, 1,
-1.898425, -0.8030504, -1.502448, 1, 0, 0, 1, 1,
-1.886531, 0.1864344, -2.787074, 1, 0, 0, 1, 1,
-1.853951, 0.1567946, -1.038587, 1, 0, 0, 1, 1,
-1.817108, -1.08857, -1.053204, 0, 0, 0, 1, 1,
-1.763097, 0.713123, -3.001333, 0, 0, 0, 1, 1,
-1.749876, -0.1442738, -0.3707992, 0, 0, 0, 1, 1,
-1.744698, -0.162455, 0.1128648, 0, 0, 0, 1, 1,
-1.740669, 1.94366, -0.7289841, 0, 0, 0, 1, 1,
-1.730982, -0.1717279, -1.843038, 0, 0, 0, 1, 1,
-1.725069, 1.948281, -0.1759802, 0, 0, 0, 1, 1,
-1.678602, 0.2803193, -0.8070367, 1, 1, 1, 1, 1,
-1.644777, -0.1258448, -2.42924, 1, 1, 1, 1, 1,
-1.641285, 1.071308, -1.64891, 1, 1, 1, 1, 1,
-1.637198, -0.4920039, -0.4739481, 1, 1, 1, 1, 1,
-1.60782, -0.3072192, 2.046562, 1, 1, 1, 1, 1,
-1.586193, 0.9281602, -3.617262, 1, 1, 1, 1, 1,
-1.586165, -2.129155, -3.097796, 1, 1, 1, 1, 1,
-1.584146, -1.197055, -0.805523, 1, 1, 1, 1, 1,
-1.582322, 0.4290903, -0.007900428, 1, 1, 1, 1, 1,
-1.57804, -0.5020484, -3.443881, 1, 1, 1, 1, 1,
-1.565935, 0.9954236, 0.5710375, 1, 1, 1, 1, 1,
-1.562984, 0.3238299, -3.363955, 1, 1, 1, 1, 1,
-1.559784, -0.7880297, -2.090148, 1, 1, 1, 1, 1,
-1.544086, -0.2380924, -1.055146, 1, 1, 1, 1, 1,
-1.540906, 0.8971738, -1.414059, 1, 1, 1, 1, 1,
-1.540802, -0.1356601, -2.13376, 0, 0, 1, 1, 1,
-1.518077, 0.5213518, -2.541129, 1, 0, 0, 1, 1,
-1.507522, 0.3531199, -1.338826, 1, 0, 0, 1, 1,
-1.503795, -0.6020432, -2.120936, 1, 0, 0, 1, 1,
-1.498788, 0.5677649, -3.075168, 1, 0, 0, 1, 1,
-1.496458, 0.5283727, -0.545346, 1, 0, 0, 1, 1,
-1.484231, -0.8275988, -2.474307, 0, 0, 0, 1, 1,
-1.483765, -1.657928, -2.675466, 0, 0, 0, 1, 1,
-1.469406, -0.1694764, -1.686364, 0, 0, 0, 1, 1,
-1.469179, 0.3230527, -1.283598, 0, 0, 0, 1, 1,
-1.462459, -1.263758, -2.642767, 0, 0, 0, 1, 1,
-1.45746, 0.7270015, -1.751775, 0, 0, 0, 1, 1,
-1.451212, 0.2623891, -2.475417, 0, 0, 0, 1, 1,
-1.446775, -2.602553, -2.27601, 1, 1, 1, 1, 1,
-1.42972, 0.8712343, 0.4725616, 1, 1, 1, 1, 1,
-1.427195, -0.5463173, -1.941609, 1, 1, 1, 1, 1,
-1.423387, 0.1373084, -0.06880101, 1, 1, 1, 1, 1,
-1.395793, -0.2189263, -0.5445912, 1, 1, 1, 1, 1,
-1.394745, 0.7826356, -1.877615, 1, 1, 1, 1, 1,
-1.393159, 0.01767284, -2.701634, 1, 1, 1, 1, 1,
-1.392742, -0.5413506, -2.102892, 1, 1, 1, 1, 1,
-1.379849, 1.5358, -1.138255, 1, 1, 1, 1, 1,
-1.37893, 0.9913538, -2.179422, 1, 1, 1, 1, 1,
-1.378893, -1.084379, -2.802562, 1, 1, 1, 1, 1,
-1.377606, -0.5984536, -2.796317, 1, 1, 1, 1, 1,
-1.357482, 0.9457043, 0.1080791, 1, 1, 1, 1, 1,
-1.357461, 0.2479602, -0.587638, 1, 1, 1, 1, 1,
-1.351932, -0.4374282, -2.397324, 1, 1, 1, 1, 1,
-1.334168, 0.794265, -1.134237, 0, 0, 1, 1, 1,
-1.328173, -0.01694774, -1.112358, 1, 0, 0, 1, 1,
-1.327936, -0.1509021, -3.398109, 1, 0, 0, 1, 1,
-1.312517, -0.292396, -1.988984, 1, 0, 0, 1, 1,
-1.309992, 1.514237, -1.762662, 1, 0, 0, 1, 1,
-1.307634, -1.034474, -2.7622, 1, 0, 0, 1, 1,
-1.297111, -0.4531156, -3.235635, 0, 0, 0, 1, 1,
-1.296639, -0.5284727, -3.158946, 0, 0, 0, 1, 1,
-1.294042, -0.5135531, -1.976458, 0, 0, 0, 1, 1,
-1.288672, 0.4563972, -1.382995, 0, 0, 0, 1, 1,
-1.278365, 1.475211, -0.7292014, 0, 0, 0, 1, 1,
-1.266232, 0.1492946, -2.191046, 0, 0, 0, 1, 1,
-1.237329, -1.916014, -3.529794, 0, 0, 0, 1, 1,
-1.235327, 0.2311842, -0.7905077, 1, 1, 1, 1, 1,
-1.226125, -0.2774567, 0.3068108, 1, 1, 1, 1, 1,
-1.220398, 0.2893856, -3.421856, 1, 1, 1, 1, 1,
-1.21106, 0.5321254, -0.4366201, 1, 1, 1, 1, 1,
-1.207024, 0.7737035, -0.2914826, 1, 1, 1, 1, 1,
-1.195181, 1.086395, -1.532713, 1, 1, 1, 1, 1,
-1.194615, 0.4362069, -1.071753, 1, 1, 1, 1, 1,
-1.19433, 1.445326, 1.178442, 1, 1, 1, 1, 1,
-1.191669, -0.1715918, -1.696406, 1, 1, 1, 1, 1,
-1.183044, 0.3776788, -1.6325, 1, 1, 1, 1, 1,
-1.174876, -1.480604, -3.118451, 1, 1, 1, 1, 1,
-1.174747, 1.485927, -0.4692907, 1, 1, 1, 1, 1,
-1.163079, -0.4102381, -2.416297, 1, 1, 1, 1, 1,
-1.160569, 0.9430296, -1.004345, 1, 1, 1, 1, 1,
-1.159152, -0.265109, -3.12765, 1, 1, 1, 1, 1,
-1.140826, -1.999798, -1.740816, 0, 0, 1, 1, 1,
-1.137676, 0.3055707, -0.1468553, 1, 0, 0, 1, 1,
-1.132554, 1.544, 1.61185, 1, 0, 0, 1, 1,
-1.129961, -0.5368011, -2.261781, 1, 0, 0, 1, 1,
-1.125371, -0.3833871, -0.8924124, 1, 0, 0, 1, 1,
-1.123715, 0.03164581, 0.2327039, 1, 0, 0, 1, 1,
-1.11962, -0.06360213, -2.008754, 0, 0, 0, 1, 1,
-1.116118, -1.022458, -1.879673, 0, 0, 0, 1, 1,
-1.106169, -0.9616417, -3.078261, 0, 0, 0, 1, 1,
-1.105563, 0.7117268, -0.60359, 0, 0, 0, 1, 1,
-1.101803, -0.3233126, -2.062274, 0, 0, 0, 1, 1,
-1.076218, -0.1962506, 0.1274916, 0, 0, 0, 1, 1,
-1.058549, -0.7509295, -1.901583, 0, 0, 0, 1, 1,
-1.057927, -1.416477, -0.1196316, 1, 1, 1, 1, 1,
-1.055095, -1.361897, -2.175673, 1, 1, 1, 1, 1,
-1.042415, 0.8334177, -1.023327, 1, 1, 1, 1, 1,
-1.036328, 0.2105501, -2.199453, 1, 1, 1, 1, 1,
-1.031442, 1.151252, -1.438362, 1, 1, 1, 1, 1,
-1.03049, -0.5761576, -0.7190907, 1, 1, 1, 1, 1,
-1.026734, 0.2290779, 0.1682414, 1, 1, 1, 1, 1,
-1.025609, 0.2716954, 0.1421911, 1, 1, 1, 1, 1,
-1.00914, 0.626766, 1.958426, 1, 1, 1, 1, 1,
-1.002426, -0.416393, -3.043141, 1, 1, 1, 1, 1,
-1.000849, 0.4174504, -1.200896, 1, 1, 1, 1, 1,
-0.9963438, -1.741101, -3.864488, 1, 1, 1, 1, 1,
-0.9932693, -0.9185265, -1.227351, 1, 1, 1, 1, 1,
-0.9910827, 0.9686485, -0.790113, 1, 1, 1, 1, 1,
-0.98758, 1.282251, -2.065326, 1, 1, 1, 1, 1,
-0.9830863, 1.4154, -2.157981, 0, 0, 1, 1, 1,
-0.980849, -0.4913129, -2.108427, 1, 0, 0, 1, 1,
-0.9801112, -0.137656, -3.254551, 1, 0, 0, 1, 1,
-0.9754608, 1.093543, -0.07492538, 1, 0, 0, 1, 1,
-0.9727879, -0.1363422, -1.698467, 1, 0, 0, 1, 1,
-0.9712504, 0.08690993, -1.512905, 1, 0, 0, 1, 1,
-0.9689471, -1.455554, -2.655701, 0, 0, 0, 1, 1,
-0.9676234, -1.627354, -3.928651, 0, 0, 0, 1, 1,
-0.96338, -0.3941715, -1.905049, 0, 0, 0, 1, 1,
-0.9617758, -0.9665551, -1.135112, 0, 0, 0, 1, 1,
-0.9590344, -0.583922, -3.654003, 0, 0, 0, 1, 1,
-0.9584042, 1.023616, -0.9843435, 0, 0, 0, 1, 1,
-0.9576664, -0.1805409, -1.564537, 0, 0, 0, 1, 1,
-0.9560537, -0.05621329, -2.207108, 1, 1, 1, 1, 1,
-0.9513315, 0.3460782, -0.08953766, 1, 1, 1, 1, 1,
-0.944389, 0.4725759, -3.325096, 1, 1, 1, 1, 1,
-0.9400356, -1.054362, -4.187315, 1, 1, 1, 1, 1,
-0.9353676, -1.255993, -1.50277, 1, 1, 1, 1, 1,
-0.9318784, 1.667122, 0.951362, 1, 1, 1, 1, 1,
-0.9312731, -0.823606, -0.9172087, 1, 1, 1, 1, 1,
-0.9303193, -2.593807, -2.601381, 1, 1, 1, 1, 1,
-0.9293208, 1.263904, -1.157873, 1, 1, 1, 1, 1,
-0.9242079, -0.2860141, -2.272857, 1, 1, 1, 1, 1,
-0.9211562, 0.0327489, -1.161382, 1, 1, 1, 1, 1,
-0.9175634, 0.006146472, -1.865397, 1, 1, 1, 1, 1,
-0.9077281, -0.32521, -1.857218, 1, 1, 1, 1, 1,
-0.9051823, -0.3655414, -0.2250194, 1, 1, 1, 1, 1,
-0.9040526, 0.9191875, -0.6927263, 1, 1, 1, 1, 1,
-0.8910226, -0.4334218, -1.387363, 0, 0, 1, 1, 1,
-0.8896864, -0.7976066, -1.824839, 1, 0, 0, 1, 1,
-0.8877479, 1.267112, -1.238307, 1, 0, 0, 1, 1,
-0.8857638, 0.3364655, -1.703875, 1, 0, 0, 1, 1,
-0.8851694, 0.7208465, -3.024908, 1, 0, 0, 1, 1,
-0.8850959, 0.03832162, -0.004702723, 1, 0, 0, 1, 1,
-0.8711159, 0.6705365, -1.563152, 0, 0, 0, 1, 1,
-0.8681431, -0.5935227, -3.261038, 0, 0, 0, 1, 1,
-0.862712, -1.956051, -3.754115, 0, 0, 0, 1, 1,
-0.8568517, 0.1642814, -1.797444, 0, 0, 0, 1, 1,
-0.8539659, -1.036543, -1.961003, 0, 0, 0, 1, 1,
-0.8531764, -0.1648342, 0.01617521, 0, 0, 0, 1, 1,
-0.8530223, 0.7216791, 0.3778548, 0, 0, 0, 1, 1,
-0.833458, -1.385718, -2.360185, 1, 1, 1, 1, 1,
-0.825369, 0.1652267, -0.9098682, 1, 1, 1, 1, 1,
-0.808082, 0.8772685, -0.7765474, 1, 1, 1, 1, 1,
-0.8016462, 0.7745848, -0.083078, 1, 1, 1, 1, 1,
-0.7991771, 0.1394338, -2.627469, 1, 1, 1, 1, 1,
-0.7990601, 0.7462444, -0.8478886, 1, 1, 1, 1, 1,
-0.7979766, -0.09327634, -2.069662, 1, 1, 1, 1, 1,
-0.7964832, -1.276161, -2.840407, 1, 1, 1, 1, 1,
-0.7927393, -0.6653079, -0.2078689, 1, 1, 1, 1, 1,
-0.7923399, -2.168684, -0.7231823, 1, 1, 1, 1, 1,
-0.7902828, -0.5273527, -2.614144, 1, 1, 1, 1, 1,
-0.7893323, 1.032858, -0.4839958, 1, 1, 1, 1, 1,
-0.7825379, -0.2658903, 0.03961862, 1, 1, 1, 1, 1,
-0.7792943, 1.009748, -0.2637181, 1, 1, 1, 1, 1,
-0.7776764, -0.3711248, -0.5711321, 1, 1, 1, 1, 1,
-0.7769734, -2.224671, -3.117998, 0, 0, 1, 1, 1,
-0.7748801, 0.3380752, -0.9889389, 1, 0, 0, 1, 1,
-0.7624578, -1.976997, -1.707585, 1, 0, 0, 1, 1,
-0.7623444, -0.7547573, -1.712053, 1, 0, 0, 1, 1,
-0.7622322, 1.010163, 1.040374, 1, 0, 0, 1, 1,
-0.7552829, -0.7771791, -4.346877, 1, 0, 0, 1, 1,
-0.7530803, -0.8213317, -3.50188, 0, 0, 0, 1, 1,
-0.7515063, 0.5138726, 1.035011, 0, 0, 0, 1, 1,
-0.7505318, 0.997616, -0.5506527, 0, 0, 0, 1, 1,
-0.7474207, 0.4356634, -1.894521, 0, 0, 0, 1, 1,
-0.7449762, 0.8383071, -1.037358, 0, 0, 0, 1, 1,
-0.7446197, -0.03957121, -2.421064, 0, 0, 0, 1, 1,
-0.7442287, 1.293173, -0.05311739, 0, 0, 0, 1, 1,
-0.7404113, -0.7048998, -1.967651, 1, 1, 1, 1, 1,
-0.7385517, -0.6301867, -3.334793, 1, 1, 1, 1, 1,
-0.7359597, 1.125589, -1.061855, 1, 1, 1, 1, 1,
-0.7351869, -1.536618, -3.862164, 1, 1, 1, 1, 1,
-0.7263538, -0.7086852, -1.676188, 1, 1, 1, 1, 1,
-0.7237498, -1.072241, -2.481343, 1, 1, 1, 1, 1,
-0.7193581, 0.3220747, -2.250504, 1, 1, 1, 1, 1,
-0.7153226, -1.179193, -2.575294, 1, 1, 1, 1, 1,
-0.713594, -0.8883029, -2.345881, 1, 1, 1, 1, 1,
-0.7116313, 0.0272688, -2.191307, 1, 1, 1, 1, 1,
-0.7112437, 0.9582111, -1.106412, 1, 1, 1, 1, 1,
-0.7074843, -0.3732592, -3.050129, 1, 1, 1, 1, 1,
-0.7039548, 0.8802441, -1.329629, 1, 1, 1, 1, 1,
-0.7036017, -0.04746951, -0.2833345, 1, 1, 1, 1, 1,
-0.6991411, 0.2965471, -0.852101, 1, 1, 1, 1, 1,
-0.6882773, -2.396691, -5.402658, 0, 0, 1, 1, 1,
-0.6821454, -0.2618742, -2.048894, 1, 0, 0, 1, 1,
-0.6799233, 0.1289793, -0.1163181, 1, 0, 0, 1, 1,
-0.677946, 0.9419581, -0.4306253, 1, 0, 0, 1, 1,
-0.6701856, 0.6274117, 0.06117026, 1, 0, 0, 1, 1,
-0.6684362, 0.4395188, -1.514744, 1, 0, 0, 1, 1,
-0.661091, 0.8533735, -1.862067, 0, 0, 0, 1, 1,
-0.6595722, -0.2418415, -1.990831, 0, 0, 0, 1, 1,
-0.6543508, 1.669505, 0.1360415, 0, 0, 0, 1, 1,
-0.6530441, 1.731478, -0.4763656, 0, 0, 0, 1, 1,
-0.6499568, 0.3088837, 0.257194, 0, 0, 0, 1, 1,
-0.6490156, 1.544123, -1.286943, 0, 0, 0, 1, 1,
-0.6426413, -2.404126, -3.663077, 0, 0, 0, 1, 1,
-0.6306973, 0.2703632, -1.598528, 1, 1, 1, 1, 1,
-0.6232315, -1.751189, -1.482277, 1, 1, 1, 1, 1,
-0.6229296, 0.3392876, -2.611856, 1, 1, 1, 1, 1,
-0.6203112, -0.106399, -3.04642, 1, 1, 1, 1, 1,
-0.6148685, 0.2672582, 0.3508083, 1, 1, 1, 1, 1,
-0.6122428, 0.880933, -1.57922, 1, 1, 1, 1, 1,
-0.6102977, -0.1746128, 0.8604964, 1, 1, 1, 1, 1,
-0.6074012, -1.11544, -2.953855, 1, 1, 1, 1, 1,
-0.6038833, -0.01144487, 0.3648141, 1, 1, 1, 1, 1,
-0.6014708, 0.1400733, -0.7095838, 1, 1, 1, 1, 1,
-0.5996158, -0.6388768, -2.570641, 1, 1, 1, 1, 1,
-0.5959349, 1.161438, -0.2757473, 1, 1, 1, 1, 1,
-0.5949761, 0.09284931, -0.2162695, 1, 1, 1, 1, 1,
-0.593133, -1.498919, -2.948576, 1, 1, 1, 1, 1,
-0.5904436, -0.1969598, -2.794598, 1, 1, 1, 1, 1,
-0.5863494, 0.3619868, 0.6168513, 0, 0, 1, 1, 1,
-0.574786, -1.293422, -2.343194, 1, 0, 0, 1, 1,
-0.5741763, 0.008629716, -1.400002, 1, 0, 0, 1, 1,
-0.5740573, 0.2332961, -0.7172161, 1, 0, 0, 1, 1,
-0.5712829, -0.9378835, -2.27465, 1, 0, 0, 1, 1,
-0.5699744, -0.4143167, -1.937475, 1, 0, 0, 1, 1,
-0.5642929, 1.508426, -0.9206405, 0, 0, 0, 1, 1,
-0.5638755, -1.866469, -3.738359, 0, 0, 0, 1, 1,
-0.5618711, 0.5172761, -0.9230837, 0, 0, 0, 1, 1,
-0.5604057, -0.4936616, -1.352158, 0, 0, 0, 1, 1,
-0.5576011, -2.327438, -3.037323, 0, 0, 0, 1, 1,
-0.5569991, 0.2793518, -1.028835, 0, 0, 0, 1, 1,
-0.5549067, -0.4078818, -1.825264, 0, 0, 0, 1, 1,
-0.5538796, -0.4086612, -1.379318, 1, 1, 1, 1, 1,
-0.5536719, -1.264382, -2.50949, 1, 1, 1, 1, 1,
-0.5533074, 1.247148, -1.830772, 1, 1, 1, 1, 1,
-0.5522053, 0.4183448, 0.7844866, 1, 1, 1, 1, 1,
-0.5491123, -1.928556, -0.4387904, 1, 1, 1, 1, 1,
-0.5471816, 1.459429, -0.6601444, 1, 1, 1, 1, 1,
-0.5444141, -1.016142, -2.472487, 1, 1, 1, 1, 1,
-0.5405973, -1.004461, -3.354259, 1, 1, 1, 1, 1,
-0.5400503, -0.3038669, -3.115118, 1, 1, 1, 1, 1,
-0.5398405, -0.1676864, -2.266104, 1, 1, 1, 1, 1,
-0.5385711, -1.456243, -3.248095, 1, 1, 1, 1, 1,
-0.5379831, 0.3863287, -2.091815, 1, 1, 1, 1, 1,
-0.5329894, -0.5441114, -2.722677, 1, 1, 1, 1, 1,
-0.5311716, -0.3109597, -1.76805, 1, 1, 1, 1, 1,
-0.5214136, 0.7746441, -1.609682, 1, 1, 1, 1, 1,
-0.5196384, 1.244768, -1.7544, 0, 0, 1, 1, 1,
-0.516942, -0.1988851, -2.308716, 1, 0, 0, 1, 1,
-0.5163339, 0.4066547, 0.05252865, 1, 0, 0, 1, 1,
-0.5152324, -0.881023, -3.541925, 1, 0, 0, 1, 1,
-0.5151003, 1.931505, -1.564779, 1, 0, 0, 1, 1,
-0.5150096, -0.8965294, -0.789461, 1, 0, 0, 1, 1,
-0.5110151, 1.13247, -1.7938, 0, 0, 0, 1, 1,
-0.5034949, -0.2720132, -1.361696, 0, 0, 0, 1, 1,
-0.5016801, 0.4672864, 0.7973037, 0, 0, 0, 1, 1,
-0.4936429, -1.038825, -2.70072, 0, 0, 0, 1, 1,
-0.4912878, -1.197535, -1.696617, 0, 0, 0, 1, 1,
-0.4902437, 0.3398291, -2.829828, 0, 0, 0, 1, 1,
-0.489774, -0.01027051, -2.047044, 0, 0, 0, 1, 1,
-0.4813108, -1.13561, -1.984854, 1, 1, 1, 1, 1,
-0.4792275, -0.8214857, -1.816331, 1, 1, 1, 1, 1,
-0.4790842, -0.825495, -2.197237, 1, 1, 1, 1, 1,
-0.4761307, -1.174294, -3.441511, 1, 1, 1, 1, 1,
-0.4752197, 0.6719878, 0.1224868, 1, 1, 1, 1, 1,
-0.4713836, -1.165998, -3.663409, 1, 1, 1, 1, 1,
-0.4704927, 0.8362797, -1.65597, 1, 1, 1, 1, 1,
-0.4650562, 0.9766495, -1.108454, 1, 1, 1, 1, 1,
-0.4635514, 0.3445969, -1.481806, 1, 1, 1, 1, 1,
-0.4573476, 1.166918, -0.6283536, 1, 1, 1, 1, 1,
-0.4476748, -0.2496403, -2.071769, 1, 1, 1, 1, 1,
-0.4473734, -0.8874184, -2.179066, 1, 1, 1, 1, 1,
-0.4471185, -0.5561143, -3.986575, 1, 1, 1, 1, 1,
-0.4465965, -0.6841781, -2.940163, 1, 1, 1, 1, 1,
-0.4404226, 0.1884772, -3.092712, 1, 1, 1, 1, 1,
-0.4399768, -2.417089, -2.997702, 0, 0, 1, 1, 1,
-0.4395129, 0.1666276, -1.041724, 1, 0, 0, 1, 1,
-0.4387398, -0.752422, -3.169479, 1, 0, 0, 1, 1,
-0.4385131, -0.1840102, -0.9727955, 1, 0, 0, 1, 1,
-0.4375272, 0.3982454, -0.9292597, 1, 0, 0, 1, 1,
-0.4344232, 0.02010741, -0.4310679, 1, 0, 0, 1, 1,
-0.4278736, 0.526288, -1.250718, 0, 0, 0, 1, 1,
-0.4169855, 1.263847, 2.539616, 0, 0, 0, 1, 1,
-0.410052, 1.071293, -0.009332641, 0, 0, 0, 1, 1,
-0.4059424, 0.1892416, -1.53355, 0, 0, 0, 1, 1,
-0.4041681, 0.6348106, -1.017622, 0, 0, 0, 1, 1,
-0.3991165, 0.07627008, -1.438946, 0, 0, 0, 1, 1,
-0.3988629, 1.30851, -0.8604644, 0, 0, 0, 1, 1,
-0.3929271, -0.3669295, -2.370809, 1, 1, 1, 1, 1,
-0.3849723, 0.2513405, -0.486378, 1, 1, 1, 1, 1,
-0.3804459, 0.280907, -2.130177, 1, 1, 1, 1, 1,
-0.3757721, -0.006702456, -2.630647, 1, 1, 1, 1, 1,
-0.3665427, -0.6143577, -4.464314, 1, 1, 1, 1, 1,
-0.362929, 1.781174, 0.2394227, 1, 1, 1, 1, 1,
-0.3572623, -0.603914, -3.246057, 1, 1, 1, 1, 1,
-0.3568595, -0.9440749, -3.815503, 1, 1, 1, 1, 1,
-0.3539788, -1.89382, -3.120258, 1, 1, 1, 1, 1,
-0.352363, -1.006468, -2.694124, 1, 1, 1, 1, 1,
-0.3519057, 0.1704899, -2.203532, 1, 1, 1, 1, 1,
-0.3511502, -0.1723426, -0.8095734, 1, 1, 1, 1, 1,
-0.3507454, -2.469625, -3.107653, 1, 1, 1, 1, 1,
-0.3506705, 0.521827, -0.7567831, 1, 1, 1, 1, 1,
-0.3433289, 0.1121251, -3.299652, 1, 1, 1, 1, 1,
-0.3414229, 0.8460048, 0.8880643, 0, 0, 1, 1, 1,
-0.3399071, 0.2782401, -0.5679688, 1, 0, 0, 1, 1,
-0.3389399, 0.9580097, -1.669813, 1, 0, 0, 1, 1,
-0.3384268, -0.3410431, -3.237102, 1, 0, 0, 1, 1,
-0.3354861, -0.6384056, -1.542876, 1, 0, 0, 1, 1,
-0.3299672, 2.22428, 0.04601624, 1, 0, 0, 1, 1,
-0.3272305, 1.02328, 1.624235, 0, 0, 0, 1, 1,
-0.3247357, -0.8616014, -2.155128, 0, 0, 0, 1, 1,
-0.3207777, 0.05694138, -1.284469, 0, 0, 0, 1, 1,
-0.3182522, -0.5071707, -3.682134, 0, 0, 0, 1, 1,
-0.3157901, 0.8025848, -0.6369327, 0, 0, 0, 1, 1,
-0.3139207, -1.240234, -4.376082, 0, 0, 0, 1, 1,
-0.3070782, -1.076727, -2.012411, 0, 0, 0, 1, 1,
-0.3057676, -0.6424171, -2.68281, 1, 1, 1, 1, 1,
-0.3043242, -0.1096983, -2.899669, 1, 1, 1, 1, 1,
-0.3035406, -0.4917643, -4.484327, 1, 1, 1, 1, 1,
-0.3015955, -1.036181, -4.361259, 1, 1, 1, 1, 1,
-0.2984399, 0.9685074, -1.638946, 1, 1, 1, 1, 1,
-0.2959585, 0.8230232, -2.169497, 1, 1, 1, 1, 1,
-0.2923382, -0.1878529, -3.403818, 1, 1, 1, 1, 1,
-0.2847098, 0.6229588, -0.8745462, 1, 1, 1, 1, 1,
-0.2798616, 0.05562335, -3.032629, 1, 1, 1, 1, 1,
-0.2775732, -0.2180625, -2.761086, 1, 1, 1, 1, 1,
-0.2696018, -0.872337, -3.595832, 1, 1, 1, 1, 1,
-0.2688148, -1.334089, -2.241838, 1, 1, 1, 1, 1,
-0.2613881, -0.3090945, -2.763731, 1, 1, 1, 1, 1,
-0.2613391, -0.1267472, -2.867371, 1, 1, 1, 1, 1,
-0.2570354, -2.110186, -2.882575, 1, 1, 1, 1, 1,
-0.2566387, 1.19354, 0.3067424, 0, 0, 1, 1, 1,
-0.256323, -0.5546982, -3.928997, 1, 0, 0, 1, 1,
-0.2552797, 2.21401, -0.9692857, 1, 0, 0, 1, 1,
-0.251821, 1.104003, -0.2514987, 1, 0, 0, 1, 1,
-0.2509233, 0.4068689, 0.06374836, 1, 0, 0, 1, 1,
-0.2502514, -2.233404, -1.877131, 1, 0, 0, 1, 1,
-0.2485576, -0.6109691, -3.056256, 0, 0, 0, 1, 1,
-0.247005, -2.112815, -4.982943, 0, 0, 0, 1, 1,
-0.2443933, 1.267601, 2.733437, 0, 0, 0, 1, 1,
-0.2424903, -1.522821, -2.961033, 0, 0, 0, 1, 1,
-0.2384909, -0.05411931, -1.839582, 0, 0, 0, 1, 1,
-0.2330328, 0.5771516, 0.2132698, 0, 0, 0, 1, 1,
-0.2324167, 1.707378, -1.576339, 0, 0, 0, 1, 1,
-0.2223923, -0.6816314, -1.308061, 1, 1, 1, 1, 1,
-0.2162153, -0.3322585, -2.994903, 1, 1, 1, 1, 1,
-0.2141189, 0.6441127, -1.713441, 1, 1, 1, 1, 1,
-0.213954, 0.07783615, -2.61431, 1, 1, 1, 1, 1,
-0.2016442, -0.9031424, -1.951707, 1, 1, 1, 1, 1,
-0.2014899, -0.6371166, -3.04884, 1, 1, 1, 1, 1,
-0.1993459, 0.1383639, 0.1610187, 1, 1, 1, 1, 1,
-0.199296, 1.251228, -1.877571, 1, 1, 1, 1, 1,
-0.194957, -0.8253221, -3.720227, 1, 1, 1, 1, 1,
-0.1921792, 0.9815212, 0.0757516, 1, 1, 1, 1, 1,
-0.1908538, 0.9586993, 0.2398684, 1, 1, 1, 1, 1,
-0.1867815, 0.07618794, -0.9493178, 1, 1, 1, 1, 1,
-0.1865299, -0.85987, -3.220164, 1, 1, 1, 1, 1,
-0.1846984, -0.1743209, -2.096498, 1, 1, 1, 1, 1,
-0.1814237, -0.08542608, -1.594851, 1, 1, 1, 1, 1,
-0.1796775, 0.6531672, -0.8082511, 0, 0, 1, 1, 1,
-0.1773502, 0.1706318, 0.2747108, 1, 0, 0, 1, 1,
-0.1749311, -0.6630734, -1.980699, 1, 0, 0, 1, 1,
-0.1715683, -0.6416484, -1.635953, 1, 0, 0, 1, 1,
-0.1668258, -0.9221422, -0.7602413, 1, 0, 0, 1, 1,
-0.1661014, -0.2087952, -3.863096, 1, 0, 0, 1, 1,
-0.1601992, -0.9818991, -2.517857, 0, 0, 0, 1, 1,
-0.1551697, 0.3468075, -0.5537493, 0, 0, 0, 1, 1,
-0.1533024, -0.8968529, -2.392542, 0, 0, 0, 1, 1,
-0.1524758, -1.265689, -2.55086, 0, 0, 0, 1, 1,
-0.1501515, -0.6785229, -2.415788, 0, 0, 0, 1, 1,
-0.1490339, 0.4376054, 0.518958, 0, 0, 0, 1, 1,
-0.1468416, 0.488531, 0.5104755, 0, 0, 0, 1, 1,
-0.1468043, 0.5956365, 0.3130919, 1, 1, 1, 1, 1,
-0.1442459, 0.6323062, -1.31326, 1, 1, 1, 1, 1,
-0.1432866, 0.03572134, -0.9692982, 1, 1, 1, 1, 1,
-0.1431929, 0.5055064, 0.6884173, 1, 1, 1, 1, 1,
-0.1427769, 0.9554749, -0.395774, 1, 1, 1, 1, 1,
-0.1421704, -1.573491, -4.732891, 1, 1, 1, 1, 1,
-0.1415825, 0.3816648, -0.1308152, 1, 1, 1, 1, 1,
-0.1339591, -1.1159, -3.891266, 1, 1, 1, 1, 1,
-0.1333804, -0.301924, -2.755499, 1, 1, 1, 1, 1,
-0.1303762, -0.1065473, -1.372144, 1, 1, 1, 1, 1,
-0.1275227, 0.0482606, -0.2611976, 1, 1, 1, 1, 1,
-0.1273578, -1.160833, -2.438929, 1, 1, 1, 1, 1,
-0.1232781, 1.323566, 0.6917118, 1, 1, 1, 1, 1,
-0.1211844, -0.7025278, -2.666358, 1, 1, 1, 1, 1,
-0.1161463, -0.8021251, -2.456105, 1, 1, 1, 1, 1,
-0.1161302, 1.279942, 0.1677943, 0, 0, 1, 1, 1,
-0.1142677, 0.452557, -2.149614, 1, 0, 0, 1, 1,
-0.1140762, -0.7133293, -2.730681, 1, 0, 0, 1, 1,
-0.1127643, -1.05338, -1.764123, 1, 0, 0, 1, 1,
-0.1072701, 1.161618, 0.9165398, 1, 0, 0, 1, 1,
-0.1035971, 0.6651894, -0.01481433, 1, 0, 0, 1, 1,
-0.09700071, -1.289174, -4.848368, 0, 0, 0, 1, 1,
-0.09559599, 0.2688089, -0.8322673, 0, 0, 0, 1, 1,
-0.09421974, -0.4225767, -3.626477, 0, 0, 0, 1, 1,
-0.09221021, 1.544758, -0.4834517, 0, 0, 0, 1, 1,
-0.09181945, -0.7227705, -3.681549, 0, 0, 0, 1, 1,
-0.09141143, -0.1821466, -1.487514, 0, 0, 0, 1, 1,
-0.08805721, -0.6025482, -4.757435, 0, 0, 0, 1, 1,
-0.08701642, -0.1512983, -2.208449, 1, 1, 1, 1, 1,
-0.08274872, 0.3411049, 0.1108762, 1, 1, 1, 1, 1,
-0.08105314, -1.382276, -3.860875, 1, 1, 1, 1, 1,
-0.07925904, -1.176772, -2.445243, 1, 1, 1, 1, 1,
-0.07822616, -0.3767191, -2.820187, 1, 1, 1, 1, 1,
-0.07771084, -0.8643526, -0.8923521, 1, 1, 1, 1, 1,
-0.07365085, -0.02912031, -1.20659, 1, 1, 1, 1, 1,
-0.07221257, -0.6374401, -0.7454624, 1, 1, 1, 1, 1,
-0.06692673, 0.6338947, 2.006229, 1, 1, 1, 1, 1,
-0.06507642, 0.02032126, -1.482343, 1, 1, 1, 1, 1,
-0.06377595, -0.3275807, -2.738251, 1, 1, 1, 1, 1,
-0.05510727, -0.155986, -2.216594, 1, 1, 1, 1, 1,
-0.05410281, 1.207355, 0.1666631, 1, 1, 1, 1, 1,
-0.05286447, -0.07405902, -1.597531, 1, 1, 1, 1, 1,
-0.04852367, 0.679095, 0.6564595, 1, 1, 1, 1, 1,
-0.04720795, 0.9097356, -2.303863, 0, 0, 1, 1, 1,
-0.04624208, -0.2585538, -3.285887, 1, 0, 0, 1, 1,
-0.04576258, 0.2666435, 0.6740907, 1, 0, 0, 1, 1,
-0.03728415, -0.5006726, -3.634618, 1, 0, 0, 1, 1,
-0.0352212, 0.7910478, 0.2599402, 1, 0, 0, 1, 1,
-0.03267583, 2.473898, 0.4087484, 1, 0, 0, 1, 1,
-0.03132267, 1.400431, -0.7046256, 0, 0, 0, 1, 1,
-0.02753559, -0.426012, -3.947184, 0, 0, 0, 1, 1,
-0.02532392, 1.127079, 2.89799, 0, 0, 0, 1, 1,
-0.02447946, 0.1701056, -1.910521, 0, 0, 0, 1, 1,
-0.02417269, 1.676198, 0.7979582, 0, 0, 0, 1, 1,
-0.02305677, 0.1513234, -1.179705, 0, 0, 0, 1, 1,
-0.01870479, 0.56726, -0.5392108, 0, 0, 0, 1, 1,
-0.01837756, -0.2839588, -3.007035, 1, 1, 1, 1, 1,
-0.01716015, -0.2210137, -1.175715, 1, 1, 1, 1, 1,
-0.01587817, -0.9050614, -2.320484, 1, 1, 1, 1, 1,
-0.0135367, 0.6768693, 0.6702186, 1, 1, 1, 1, 1,
-0.008107261, -0.2911132, -3.181364, 1, 1, 1, 1, 1,
-0.005504093, -0.3714631, -3.702585, 1, 1, 1, 1, 1,
-0.004967312, 0.7675503, -0.09034391, 1, 1, 1, 1, 1,
-0.004634642, -0.1753802, -2.497359, 1, 1, 1, 1, 1,
-0.001914013, -0.6205288, -1.2717, 1, 1, 1, 1, 1,
-0.0009224231, 1.099601, -0.5565076, 1, 1, 1, 1, 1,
0.003816162, 0.03406357, 0.4705578, 1, 1, 1, 1, 1,
0.004318478, -1.045272, 2.76481, 1, 1, 1, 1, 1,
0.005250994, -0.683962, 2.931629, 1, 1, 1, 1, 1,
0.007788358, 0.3546763, -0.4500087, 1, 1, 1, 1, 1,
0.01187282, 0.01714278, 1.256622, 1, 1, 1, 1, 1,
0.01627474, -0.7112319, 1.285639, 0, 0, 1, 1, 1,
0.01721191, 0.1802319, 1.81342, 1, 0, 0, 1, 1,
0.01877993, 1.146067, 0.5520666, 1, 0, 0, 1, 1,
0.01917224, -0.1190705, 3.530452, 1, 0, 0, 1, 1,
0.02203244, 1.687011, 2.980945, 1, 0, 0, 1, 1,
0.02264961, -2.172982, 4.213125, 1, 0, 0, 1, 1,
0.02397424, -0.6347507, 4.269046, 0, 0, 0, 1, 1,
0.02623796, 0.5376757, 2.09627, 0, 0, 0, 1, 1,
0.03135092, 1.163092, -0.1231441, 0, 0, 0, 1, 1,
0.03612253, 0.4359611, 2.645723, 0, 0, 0, 1, 1,
0.03986447, -0.3248981, 3.693795, 0, 0, 0, 1, 1,
0.04263994, -0.07006618, 2.365097, 0, 0, 0, 1, 1,
0.04266439, -1.150528, 2.784499, 0, 0, 0, 1, 1,
0.05312342, -0.9204137, 2.41672, 1, 1, 1, 1, 1,
0.05688353, 2.035027, -0.7751338, 1, 1, 1, 1, 1,
0.05895315, -2.65914, 4.666714, 1, 1, 1, 1, 1,
0.06545685, 0.2895603, -0.3039013, 1, 1, 1, 1, 1,
0.06821831, 0.06441932, 0.1636896, 1, 1, 1, 1, 1,
0.06926293, -0.9627723, 2.783238, 1, 1, 1, 1, 1,
0.07135186, -1.764088, 1.575979, 1, 1, 1, 1, 1,
0.07271417, 0.126123, 0.2705699, 1, 1, 1, 1, 1,
0.07305327, 1.572525, -1.738606, 1, 1, 1, 1, 1,
0.07370239, -1.355822, 3.18275, 1, 1, 1, 1, 1,
0.07764663, 1.607098, -0.5094137, 1, 1, 1, 1, 1,
0.07986685, 0.5521778, 0.5331492, 1, 1, 1, 1, 1,
0.07990777, 0.1902972, 1.389823, 1, 1, 1, 1, 1,
0.08019423, 0.5751236, 0.4521772, 1, 1, 1, 1, 1,
0.08215807, -1.295595, 1.724271, 1, 1, 1, 1, 1,
0.08313529, 1.251791, 1.296317, 0, 0, 1, 1, 1,
0.08437801, -0.1214051, 1.968144, 1, 0, 0, 1, 1,
0.0852228, -1.085713, 1.968793, 1, 0, 0, 1, 1,
0.09028827, 0.3226564, -0.9507575, 1, 0, 0, 1, 1,
0.09183165, -1.979219, 3.459282, 1, 0, 0, 1, 1,
0.09235985, -0.6273673, 3.203008, 1, 0, 0, 1, 1,
0.09312851, 0.2545605, -0.7341893, 0, 0, 0, 1, 1,
0.09506602, 0.319936, 0.9542264, 0, 0, 0, 1, 1,
0.09704141, -0.8493403, 1.767609, 0, 0, 0, 1, 1,
0.1009114, -0.1320383, 2.816299, 0, 0, 0, 1, 1,
0.1061025, -0.710009, 3.323018, 0, 0, 0, 1, 1,
0.1091854, -0.8426043, 2.885538, 0, 0, 0, 1, 1,
0.1110593, -0.7873411, 2.799548, 0, 0, 0, 1, 1,
0.1113075, -0.2799195, 3.002907, 1, 1, 1, 1, 1,
0.1205841, 0.8818257, 0.8416474, 1, 1, 1, 1, 1,
0.1215459, -1.106619, 4.971458, 1, 1, 1, 1, 1,
0.1228633, -0.647243, 2.851321, 1, 1, 1, 1, 1,
0.122882, 0.07009732, 0.9623807, 1, 1, 1, 1, 1,
0.1258503, -0.0766372, 3.342, 1, 1, 1, 1, 1,
0.126617, 1.135468, -0.9713369, 1, 1, 1, 1, 1,
0.1272994, -0.4278144, 4.667426, 1, 1, 1, 1, 1,
0.1307318, -0.6943592, 2.048352, 1, 1, 1, 1, 1,
0.1323479, -1.92587, 2.397583, 1, 1, 1, 1, 1,
0.1383047, 0.3621251, 0.5421722, 1, 1, 1, 1, 1,
0.1385262, -1.846286, 1.816851, 1, 1, 1, 1, 1,
0.1412677, -1.714175, 4.030218, 1, 1, 1, 1, 1,
0.150887, -0.9316937, 2.326222, 1, 1, 1, 1, 1,
0.1540039, 1.438085, -0.6714035, 1, 1, 1, 1, 1,
0.1575462, 0.4814612, -0.2451184, 0, 0, 1, 1, 1,
0.1662086, 0.7680134, -0.8228065, 1, 0, 0, 1, 1,
0.1688045, -0.9949508, 4.187117, 1, 0, 0, 1, 1,
0.1699647, -1.440622, 2.404492, 1, 0, 0, 1, 1,
0.1744813, -0.9438724, 4.518921, 1, 0, 0, 1, 1,
0.1758285, -0.1184434, 2.001924, 1, 0, 0, 1, 1,
0.1765617, -0.7443141, 2.93428, 0, 0, 0, 1, 1,
0.1784773, -0.7472301, 2.731627, 0, 0, 0, 1, 1,
0.1792267, -1.225103, 2.329066, 0, 0, 0, 1, 1,
0.1808585, -0.879265, 3.876994, 0, 0, 0, 1, 1,
0.1835341, -1.594723, 0.9567555, 0, 0, 0, 1, 1,
0.1835774, -1.545415, 3.004211, 0, 0, 0, 1, 1,
0.1848027, -0.6861575, 3.68979, 0, 0, 0, 1, 1,
0.1857861, -0.9721144, 3.903943, 1, 1, 1, 1, 1,
0.1863832, 0.4175544, -1.696273, 1, 1, 1, 1, 1,
0.1865603, 0.06039651, 1.013578, 1, 1, 1, 1, 1,
0.1870829, 0.7622645, 1.771954, 1, 1, 1, 1, 1,
0.1895059, -0.3682489, 2.623745, 1, 1, 1, 1, 1,
0.1918925, -0.5331421, 1.962425, 1, 1, 1, 1, 1,
0.1949776, -0.4540202, 1.794378, 1, 1, 1, 1, 1,
0.1952096, 1.610443, 1.341724, 1, 1, 1, 1, 1,
0.1970873, 2.063599, -1.090135, 1, 1, 1, 1, 1,
0.1995927, -0.3412934, 2.082811, 1, 1, 1, 1, 1,
0.2006198, -1.186163, 2.584806, 1, 1, 1, 1, 1,
0.2030763, -0.7125052, 3.038234, 1, 1, 1, 1, 1,
0.2224048, 0.07471545, 1.768533, 1, 1, 1, 1, 1,
0.2266226, -1.215003, 4.797695, 1, 1, 1, 1, 1,
0.2282517, -0.5003096, 2.769269, 1, 1, 1, 1, 1,
0.2290014, 1.439056, 0.59248, 0, 0, 1, 1, 1,
0.2292295, -0.6260624, 2.764848, 1, 0, 0, 1, 1,
0.2375932, -0.4934107, 2.470285, 1, 0, 0, 1, 1,
0.2386858, 0.8946722, 1.425537, 1, 0, 0, 1, 1,
0.2467318, -1.218551, 2.892801, 1, 0, 0, 1, 1,
0.2471402, -0.07112735, 2.138169, 1, 0, 0, 1, 1,
0.2583118, 1.621951, -0.7328494, 0, 0, 0, 1, 1,
0.2615562, 2.688933, 0.05607132, 0, 0, 0, 1, 1,
0.2673941, -0.8120816, 3.200834, 0, 0, 0, 1, 1,
0.2723857, 0.6852614, 0.8399767, 0, 0, 0, 1, 1,
0.2736383, 0.7372072, -0.1190239, 0, 0, 0, 1, 1,
0.273771, -1.400743, 4.237764, 0, 0, 0, 1, 1,
0.2747103, -1.407327, 2.826573, 0, 0, 0, 1, 1,
0.2772525, -1.221668, 1.867953, 1, 1, 1, 1, 1,
0.2793815, -0.5438679, 3.829189, 1, 1, 1, 1, 1,
0.2820652, -0.7597632, 2.759, 1, 1, 1, 1, 1,
0.2861912, -0.7804336, 2.855121, 1, 1, 1, 1, 1,
0.2893547, 1.227628, 0.5470928, 1, 1, 1, 1, 1,
0.2896923, 0.3012914, 1.048795, 1, 1, 1, 1, 1,
0.2919307, -2.257078, 2.192838, 1, 1, 1, 1, 1,
0.2998342, -0.3924822, 1.861317, 1, 1, 1, 1, 1,
0.3056304, 1.044584, 0.003861977, 1, 1, 1, 1, 1,
0.3089765, 0.4578098, 1.000965, 1, 1, 1, 1, 1,
0.3125921, -0.07412858, 2.822654, 1, 1, 1, 1, 1,
0.3126, 1.457852, -0.02916982, 1, 1, 1, 1, 1,
0.3141068, 0.174417, 0.7422253, 1, 1, 1, 1, 1,
0.3161508, 1.459118, 0.07624516, 1, 1, 1, 1, 1,
0.3267929, 0.4676197, -0.9748487, 1, 1, 1, 1, 1,
0.3300234, -0.8031725, 1.824061, 0, 0, 1, 1, 1,
0.3356136, -0.730116, 3.34707, 1, 0, 0, 1, 1,
0.3370097, 0.1077087, -0.2575336, 1, 0, 0, 1, 1,
0.3398406, -0.2064872, 1.942402, 1, 0, 0, 1, 1,
0.3459021, -0.6265313, 2.799517, 1, 0, 0, 1, 1,
0.3533991, 0.937527, -0.5399185, 1, 0, 0, 1, 1,
0.3596917, 1.856559, -1.429215, 0, 0, 0, 1, 1,
0.3600151, -0.8854461, 2.713513, 0, 0, 0, 1, 1,
0.3600338, -0.2303997, 1.588653, 0, 0, 0, 1, 1,
0.3630788, 0.8657625, 0.4085343, 0, 0, 0, 1, 1,
0.3631331, 0.8452196, 0.3818908, 0, 0, 0, 1, 1,
0.3688122, -2.364768, 2.903101, 0, 0, 0, 1, 1,
0.3703981, -0.4802039, 1.69702, 0, 0, 0, 1, 1,
0.3718061, -1.880451, 2.506238, 1, 1, 1, 1, 1,
0.3722097, -0.3385562, 1.652311, 1, 1, 1, 1, 1,
0.376777, 0.4059866, -1.1416, 1, 1, 1, 1, 1,
0.3774884, -0.7326328, 1.695809, 1, 1, 1, 1, 1,
0.3852876, 0.9210119, 1.019464, 1, 1, 1, 1, 1,
0.3889663, -1.543442, 3.532405, 1, 1, 1, 1, 1,
0.3925882, 0.09496615, 2.369387, 1, 1, 1, 1, 1,
0.393528, 0.7349082, 0.8084633, 1, 1, 1, 1, 1,
0.3974278, 1.505046, 2.439631, 1, 1, 1, 1, 1,
0.3991691, -0.471245, 2.203457, 1, 1, 1, 1, 1,
0.3995981, -0.6212973, 0.9374405, 1, 1, 1, 1, 1,
0.4026361, 0.533941, 1.660883, 1, 1, 1, 1, 1,
0.4029582, -0.5095974, 2.341845, 1, 1, 1, 1, 1,
0.4082775, -1.475213, 4.238961, 1, 1, 1, 1, 1,
0.4087883, -0.8161991, 1.993795, 1, 1, 1, 1, 1,
0.4122112, -1.361056, 1.578123, 0, 0, 1, 1, 1,
0.4128242, 0.6811219, -0.6181362, 1, 0, 0, 1, 1,
0.41328, -0.1218936, 1.43579, 1, 0, 0, 1, 1,
0.4141691, 0.8852819, -0.7317932, 1, 0, 0, 1, 1,
0.4158008, -0.1124764, 2.008346, 1, 0, 0, 1, 1,
0.4158206, 0.8779973, 1.653007, 1, 0, 0, 1, 1,
0.4158834, 0.9313284, 2.304631, 0, 0, 0, 1, 1,
0.4191416, -0.04694797, 0.6975739, 0, 0, 0, 1, 1,
0.4206437, 0.4906627, -0.6467764, 0, 0, 0, 1, 1,
0.4209431, 0.3377886, 1.683393, 0, 0, 0, 1, 1,
0.4284826, -1.501185, 1.047763, 0, 0, 0, 1, 1,
0.4328626, -1.856656, 3.220331, 0, 0, 0, 1, 1,
0.4332981, 0.2319417, 2.792037, 0, 0, 0, 1, 1,
0.4362997, 1.178624, 0.1581773, 1, 1, 1, 1, 1,
0.4377102, -0.1400249, 2.246929, 1, 1, 1, 1, 1,
0.4378064, 0.2662766, -0.1306275, 1, 1, 1, 1, 1,
0.4427027, 0.7147095, 1.235144, 1, 1, 1, 1, 1,
0.4456744, 0.05597378, 1.748553, 1, 1, 1, 1, 1,
0.4460486, -0.2663412, 2.571767, 1, 1, 1, 1, 1,
0.4471267, -0.3772796, 1.003332, 1, 1, 1, 1, 1,
0.4531606, -2.119659, 2.144089, 1, 1, 1, 1, 1,
0.4540415, -1.135117, 3.956111, 1, 1, 1, 1, 1,
0.4570153, -0.7338977, 0.3027941, 1, 1, 1, 1, 1,
0.4580241, 0.3590602, 0.1046224, 1, 1, 1, 1, 1,
0.4603088, 1.846721, 0.7606294, 1, 1, 1, 1, 1,
0.4606338, -1.996319, 2.103525, 1, 1, 1, 1, 1,
0.460957, 0.478772, 1.562361, 1, 1, 1, 1, 1,
0.4633175, 0.9981911, 1.582984, 1, 1, 1, 1, 1,
0.4808136, -1.1425, 3.307411, 0, 0, 1, 1, 1,
0.4833835, 0.358681, 0.5800911, 1, 0, 0, 1, 1,
0.4843006, 0.8670869, 1.148168, 1, 0, 0, 1, 1,
0.4843307, -0.9089431, 2.938467, 1, 0, 0, 1, 1,
0.4879349, -0.3133391, 1.466441, 1, 0, 0, 1, 1,
0.4898951, -0.7136138, 3.842799, 1, 0, 0, 1, 1,
0.4938098, -1.323497, 3.224942, 0, 0, 0, 1, 1,
0.4956892, -0.9116426, 3.866393, 0, 0, 0, 1, 1,
0.4996986, 0.3344894, 0.2198348, 0, 0, 0, 1, 1,
0.5048947, -0.9073984, 1.783972, 0, 0, 0, 1, 1,
0.5069814, 0.1598688, 1.216935, 0, 0, 0, 1, 1,
0.5095409, -0.7069383, 3.051119, 0, 0, 0, 1, 1,
0.5096772, -1.016199, 3.819319, 0, 0, 0, 1, 1,
0.5123022, -2.014582, 2.707938, 1, 1, 1, 1, 1,
0.5139604, 1.350582, -0.3353676, 1, 1, 1, 1, 1,
0.5142718, -1.190124, 2.787674, 1, 1, 1, 1, 1,
0.5173803, 0.9334612, 1.316297, 1, 1, 1, 1, 1,
0.521278, -1.283083, 2.651588, 1, 1, 1, 1, 1,
0.5234035, -1.0508, 2.075153, 1, 1, 1, 1, 1,
0.5241993, 0.914856, 0.9217744, 1, 1, 1, 1, 1,
0.5242503, -0.3598274, 2.343524, 1, 1, 1, 1, 1,
0.5245048, 0.4989457, 0.4567125, 1, 1, 1, 1, 1,
0.5246702, 0.7081065, 0.4025108, 1, 1, 1, 1, 1,
0.5327086, -0.8832471, 0.8594108, 1, 1, 1, 1, 1,
0.5346528, -1.22251, 2.025137, 1, 1, 1, 1, 1,
0.5349908, -0.1806321, 2.318777, 1, 1, 1, 1, 1,
0.5357096, 0.1781991, -0.7712104, 1, 1, 1, 1, 1,
0.5425673, 0.3828538, 1.299958, 1, 1, 1, 1, 1,
0.5440852, -0.8480402, 3.212675, 0, 0, 1, 1, 1,
0.5454258, -0.4932339, 1.887058, 1, 0, 0, 1, 1,
0.5459941, 1.523497, 0.6807192, 1, 0, 0, 1, 1,
0.5603272, -0.3744546, 1.219808, 1, 0, 0, 1, 1,
0.5619864, -0.4575595, 2.893747, 1, 0, 0, 1, 1,
0.5624226, 0.4664265, -0.5666506, 1, 0, 0, 1, 1,
0.563692, 0.3728572, 2.621613, 0, 0, 0, 1, 1,
0.5703908, 0.4415666, 1.202362, 0, 0, 0, 1, 1,
0.5707166, 0.01626102, 1.155818, 0, 0, 0, 1, 1,
0.572684, 1.089036, 1.156945, 0, 0, 0, 1, 1,
0.5729559, 1.468225, 0.3344833, 0, 0, 0, 1, 1,
0.5737567, 0.5170329, -0.2582862, 0, 0, 0, 1, 1,
0.5763129, -0.9182129, 4.709414, 0, 0, 0, 1, 1,
0.5786472, 0.6083996, 2.111767, 1, 1, 1, 1, 1,
0.581337, -0.9384809, 3.905748, 1, 1, 1, 1, 1,
0.583146, -0.593245, 0.4297325, 1, 1, 1, 1, 1,
0.5931473, -0.3022618, 2.406784, 1, 1, 1, 1, 1,
0.594256, -1.393209, 2.632172, 1, 1, 1, 1, 1,
0.6084015, 1.196025, 1.489371, 1, 1, 1, 1, 1,
0.6084969, -0.2869492, 2.27148, 1, 1, 1, 1, 1,
0.6128814, 0.6934136, -0.2208703, 1, 1, 1, 1, 1,
0.6138617, -0.8090869, 2.781366, 1, 1, 1, 1, 1,
0.6187512, -0.7869928, 1.920419, 1, 1, 1, 1, 1,
0.6230426, -0.6083796, 2.340415, 1, 1, 1, 1, 1,
0.6238634, 0.2860641, 2.790516, 1, 1, 1, 1, 1,
0.6252768, -1.292368, 1.070978, 1, 1, 1, 1, 1,
0.6253368, -0.1894206, 3.2997, 1, 1, 1, 1, 1,
0.6276612, -1.6506, 3.286725, 1, 1, 1, 1, 1,
0.6295471, -0.25234, 2.723512, 0, 0, 1, 1, 1,
0.6296992, -1.608052, 4.679482, 1, 0, 0, 1, 1,
0.6324137, 0.01420127, 1.149748, 1, 0, 0, 1, 1,
0.6334391, -1.784379, 4.884737, 1, 0, 0, 1, 1,
0.6339718, 0.417888, 0.99922, 1, 0, 0, 1, 1,
0.6387306, 0.5387222, 2.483459, 1, 0, 0, 1, 1,
0.6433048, 0.4820059, 2.075975, 0, 0, 0, 1, 1,
0.6436574, -1.602256, 2.548814, 0, 0, 0, 1, 1,
0.6438404, 0.6896671, 3.624138, 0, 0, 0, 1, 1,
0.6441489, 0.1441291, 1.073012, 0, 0, 0, 1, 1,
0.6444059, -0.1342241, 1.260886, 0, 0, 0, 1, 1,
0.6470233, 0.4373499, 0.2732114, 0, 0, 0, 1, 1,
0.6485705, 1.177854, 2.251442, 0, 0, 0, 1, 1,
0.6502067, 0.1047208, -0.09449877, 1, 1, 1, 1, 1,
0.654696, 0.4558889, 0.9798523, 1, 1, 1, 1, 1,
0.6557555, -0.5083433, 1.114086, 1, 1, 1, 1, 1,
0.6570621, -0.6265679, 2.262491, 1, 1, 1, 1, 1,
0.6594653, -0.7706383, 1.868263, 1, 1, 1, 1, 1,
0.6600814, 1.465748, 0.2669372, 1, 1, 1, 1, 1,
0.6612292, -0.928827, 2.184732, 1, 1, 1, 1, 1,
0.6638933, 0.9775833, 1.519509, 1, 1, 1, 1, 1,
0.6640119, 2.341509, 0.01761444, 1, 1, 1, 1, 1,
0.6657817, 1.061637, 0.4511047, 1, 1, 1, 1, 1,
0.6733187, 0.1540278, 2.244948, 1, 1, 1, 1, 1,
0.6782623, 0.6886887, 0.7080549, 1, 1, 1, 1, 1,
0.6961774, -0.1159973, 1.109317, 1, 1, 1, 1, 1,
0.6991562, 1.330643, -1.611278, 1, 1, 1, 1, 1,
0.7003669, -2.273107, 3.562165, 1, 1, 1, 1, 1,
0.7010406, -0.6509919, 0.3170184, 0, 0, 1, 1, 1,
0.7037556, 1.179063, -0.0009343373, 1, 0, 0, 1, 1,
0.7051879, 1.458944, -0.1367762, 1, 0, 0, 1, 1,
0.7074816, 2.107914, 0.4587823, 1, 0, 0, 1, 1,
0.7076835, 0.6497206, 1.628341, 1, 0, 0, 1, 1,
0.7124341, -1.849501, 2.447871, 1, 0, 0, 1, 1,
0.7173769, -0.224362, 1.678428, 0, 0, 0, 1, 1,
0.7224448, 0.0612106, 1.268634, 0, 0, 0, 1, 1,
0.7236574, 1.135506, 1.092118, 0, 0, 0, 1, 1,
0.7247481, 0.6849366, 0.9645085, 0, 0, 0, 1, 1,
0.72601, -3.292278, 2.234431, 0, 0, 0, 1, 1,
0.7294217, 0.9806226, 2.359304, 0, 0, 0, 1, 1,
0.7297204, -0.508765, 0.5649471, 0, 0, 0, 1, 1,
0.7300112, -0.6530849, 2.847547, 1, 1, 1, 1, 1,
0.7323664, -0.77623, 2.435322, 1, 1, 1, 1, 1,
0.7335235, 2.557624, 0.4080516, 1, 1, 1, 1, 1,
0.7347262, -1.497789, 1.056643, 1, 1, 1, 1, 1,
0.7349145, 0.7288759, 2.026801, 1, 1, 1, 1, 1,
0.7358698, -0.9807724, 3.266575, 1, 1, 1, 1, 1,
0.7389427, -1.152896, 2.306844, 1, 1, 1, 1, 1,
0.7412862, 0.1975981, 0.9930457, 1, 1, 1, 1, 1,
0.7449213, -1.176649, 4.90122, 1, 1, 1, 1, 1,
0.7452147, -0.2047255, 2.913826, 1, 1, 1, 1, 1,
0.7484631, 0.1743238, 0.6954681, 1, 1, 1, 1, 1,
0.7494472, -1.101315, 2.245, 1, 1, 1, 1, 1,
0.7507694, 0.4960171, 2.575015, 1, 1, 1, 1, 1,
0.7537888, 0.6426596, 2.855869, 1, 1, 1, 1, 1,
0.7551042, -0.2132386, 3.789449, 1, 1, 1, 1, 1,
0.7554365, -0.75472, 3.60354, 0, 0, 1, 1, 1,
0.766999, 0.2110654, 1.000826, 1, 0, 0, 1, 1,
0.768545, 0.4619288, 1.451738, 1, 0, 0, 1, 1,
0.771997, 0.2202281, -0.1528246, 1, 0, 0, 1, 1,
0.7721492, -0.1309539, 1.7651, 1, 0, 0, 1, 1,
0.7782949, 0.8170519, 0.8930197, 1, 0, 0, 1, 1,
0.7831625, 0.3647922, 0.6778175, 0, 0, 0, 1, 1,
0.7910973, -0.2587621, 0.873617, 0, 0, 0, 1, 1,
0.7912699, 0.6363408, 0.4976341, 0, 0, 0, 1, 1,
0.7937695, 0.4833565, 1.945154, 0, 0, 0, 1, 1,
0.8014186, 0.7913892, 0.299472, 0, 0, 0, 1, 1,
0.8199463, 0.8158275, 1.360915, 0, 0, 0, 1, 1,
0.8257192, -0.6631491, 1.608575, 0, 0, 0, 1, 1,
0.8320193, -0.289744, 2.555012, 1, 1, 1, 1, 1,
0.8423371, -0.4457124, 3.493194, 1, 1, 1, 1, 1,
0.8429409, 1.169181, 1.386857, 1, 1, 1, 1, 1,
0.8443651, -0.8606421, 2.132396, 1, 1, 1, 1, 1,
0.8445557, 1.764924, -0.05917602, 1, 1, 1, 1, 1,
0.8549827, 1.114706, 0.729565, 1, 1, 1, 1, 1,
0.8561442, -0.2331098, 1.511613, 1, 1, 1, 1, 1,
0.8561506, -0.9858083, 3.305106, 1, 1, 1, 1, 1,
0.8573135, 1.121988, 1.269551, 1, 1, 1, 1, 1,
0.8574553, -1.432744, 3.664145, 1, 1, 1, 1, 1,
0.8578265, 0.5928744, 1.776325, 1, 1, 1, 1, 1,
0.8595362, -1.742139, 2.109491, 1, 1, 1, 1, 1,
0.8604107, 2.02925, 1.521301, 1, 1, 1, 1, 1,
0.8615188, 1.160301, -0.4089111, 1, 1, 1, 1, 1,
0.86332, 0.8435959, 1.907944, 1, 1, 1, 1, 1,
0.8671573, -0.1374166, 0.9411046, 0, 0, 1, 1, 1,
0.8687881, 0.6548437, 0.1893394, 1, 0, 0, 1, 1,
0.8696633, 0.8251681, 1.764063, 1, 0, 0, 1, 1,
0.8706761, -0.61487, 3.920805, 1, 0, 0, 1, 1,
0.8718655, 0.7182429, 2.225501, 1, 0, 0, 1, 1,
0.8761498, -0.09188013, 2.648575, 1, 0, 0, 1, 1,
0.8810117, -1.498958, 2.553546, 0, 0, 0, 1, 1,
0.8886564, 1.244474, 0.3845041, 0, 0, 0, 1, 1,
0.8926165, 1.332901, 1.323269, 0, 0, 0, 1, 1,
0.8944926, 1.02169, 0.6611022, 0, 0, 0, 1, 1,
0.9064803, -0.1941255, -0.02827573, 0, 0, 0, 1, 1,
0.9065481, -0.01169812, 1.668176, 0, 0, 0, 1, 1,
0.9097304, 0.4978215, 0.4950928, 0, 0, 0, 1, 1,
0.91197, -0.2936442, 3.758522, 1, 1, 1, 1, 1,
0.9197128, 2.371264, 1.731743, 1, 1, 1, 1, 1,
0.9201016, -0.378633, 1.133391, 1, 1, 1, 1, 1,
0.9245818, -0.225723, 1.210277, 1, 1, 1, 1, 1,
0.9246304, 2.142689, 0.8225029, 1, 1, 1, 1, 1,
0.9417196, 1.032661, 1.176864, 1, 1, 1, 1, 1,
0.9454724, -1.369599, 3.275526, 1, 1, 1, 1, 1,
0.9455727, 0.1505702, 2.176247, 1, 1, 1, 1, 1,
0.9485713, -0.6461632, 2.122166, 1, 1, 1, 1, 1,
0.9603493, -0.5021858, 2.807574, 1, 1, 1, 1, 1,
0.9644238, -0.2321222, 2.604055, 1, 1, 1, 1, 1,
0.9690487, -1.107996, 2.847971, 1, 1, 1, 1, 1,
0.9704323, 0.2554111, -0.06221729, 1, 1, 1, 1, 1,
0.9741752, -1.890486, 2.69006, 1, 1, 1, 1, 1,
0.9768287, 1.555138, 1.309174, 1, 1, 1, 1, 1,
0.9790638, -0.5700436, 1.630895, 0, 0, 1, 1, 1,
0.9795164, -1.179797, 2.499855, 1, 0, 0, 1, 1,
0.9797896, -0.03594317, 2.581901, 1, 0, 0, 1, 1,
0.9851645, -0.7777317, 1.134591, 1, 0, 0, 1, 1,
0.9869749, -0.8163495, 2.243803, 1, 0, 0, 1, 1,
0.9944971, 1.468055, 0.2874353, 1, 0, 0, 1, 1,
0.9951856, -0.2333714, 0.6430687, 0, 0, 0, 1, 1,
1.00002, 0.09689204, 1.24112, 0, 0, 0, 1, 1,
1.003008, 0.2615915, 2.165004, 0, 0, 0, 1, 1,
1.003294, -0.7539489, 2.009083, 0, 0, 0, 1, 1,
1.005448, 1.126143, -0.1442237, 0, 0, 0, 1, 1,
1.010985, -0.5742354, 0.3579975, 0, 0, 0, 1, 1,
1.011176, -0.4326483, 3.122561, 0, 0, 0, 1, 1,
1.013168, 0.02570738, 1.139571, 1, 1, 1, 1, 1,
1.01694, -0.2400122, 1.973886, 1, 1, 1, 1, 1,
1.019139, -1.074585, 1.510728, 1, 1, 1, 1, 1,
1.021058, 1.372966, 2.11514, 1, 1, 1, 1, 1,
1.02267, -0.4784977, 2.674623, 1, 1, 1, 1, 1,
1.029859, -1.129958, 1.98003, 1, 1, 1, 1, 1,
1.035474, -0.9593133, 2.659025, 1, 1, 1, 1, 1,
1.039417, -0.3637753, 3.079572, 1, 1, 1, 1, 1,
1.042035, 0.4664309, 0.04997772, 1, 1, 1, 1, 1,
1.043039, -0.07220772, 0.1077468, 1, 1, 1, 1, 1,
1.04528, -1.772563, 1.28862, 1, 1, 1, 1, 1,
1.053413, 0.991731, 3.468785, 1, 1, 1, 1, 1,
1.056769, 0.1874961, 1.111055, 1, 1, 1, 1, 1,
1.060112, 0.1418072, 0.02786316, 1, 1, 1, 1, 1,
1.083758, 0.9803072, -0.8747846, 1, 1, 1, 1, 1,
1.087225, 0.6457607, 0.005479056, 0, 0, 1, 1, 1,
1.093126, 0.7400708, 0.8845834, 1, 0, 0, 1, 1,
1.093695, 0.3983382, 1.587806, 1, 0, 0, 1, 1,
1.09748, -0.6820563, 2.681944, 1, 0, 0, 1, 1,
1.100586, -0.3290069, 2.729805, 1, 0, 0, 1, 1,
1.102113, 0.8946581, -1.033454, 1, 0, 0, 1, 1,
1.110095, 0.35517, 0.3206559, 0, 0, 0, 1, 1,
1.112059, -3.222283, 3.662677, 0, 0, 0, 1, 1,
1.117827, -0.5912447, 1.703171, 0, 0, 0, 1, 1,
1.125767, 0.01194027, 2.330652, 0, 0, 0, 1, 1,
1.125878, -0.2133925, 0.9121287, 0, 0, 0, 1, 1,
1.137899, -0.3249308, 1.979816, 0, 0, 0, 1, 1,
1.142966, 0.6268904, 0.7834279, 0, 0, 0, 1, 1,
1.14361, 1.655008, -0.2125673, 1, 1, 1, 1, 1,
1.147738, -0.5955324, 3.799593, 1, 1, 1, 1, 1,
1.148372, -1.04695, 2.488149, 1, 1, 1, 1, 1,
1.148397, -0.1284105, 1.563776, 1, 1, 1, 1, 1,
1.150055, 0.2403217, -0.07554105, 1, 1, 1, 1, 1,
1.150128, -0.1309796, 0.8401368, 1, 1, 1, 1, 1,
1.150897, -0.3597497, 3.241598, 1, 1, 1, 1, 1,
1.15105, 0.1229985, 0.3239761, 1, 1, 1, 1, 1,
1.154249, 1.234432, 0.6384253, 1, 1, 1, 1, 1,
1.157988, 0.8435268, -0.00960314, 1, 1, 1, 1, 1,
1.163729, -0.1687436, 0.7746273, 1, 1, 1, 1, 1,
1.167167, 0.1590918, 0.7803145, 1, 1, 1, 1, 1,
1.17626, -0.237735, 1.140682, 1, 1, 1, 1, 1,
1.177966, 2.759804, -0.6017222, 1, 1, 1, 1, 1,
1.185306, -0.05920526, 2.850973, 1, 1, 1, 1, 1,
1.194335, 1.405892, 1.741476, 0, 0, 1, 1, 1,
1.197426, -0.4581253, 0.3797913, 1, 0, 0, 1, 1,
1.19982, -0.613649, 1.645159, 1, 0, 0, 1, 1,
1.20449, 0.9349108, 2.249845, 1, 0, 0, 1, 1,
1.206801, 0.7784911, 1.142943, 1, 0, 0, 1, 1,
1.215497, -0.4498323, 3.170973, 1, 0, 0, 1, 1,
1.220294, 0.4446088, -0.5205929, 0, 0, 0, 1, 1,
1.224168, 0.1391818, -0.1657514, 0, 0, 0, 1, 1,
1.229304, -0.2323755, 1.029262, 0, 0, 0, 1, 1,
1.232213, 0.1078009, 0.2238681, 0, 0, 0, 1, 1,
1.240893, 1.71954, 2.125102, 0, 0, 0, 1, 1,
1.245185, 1.333297, 3.180436, 0, 0, 0, 1, 1,
1.25382, -2.463965, 1.886068, 0, 0, 0, 1, 1,
1.262992, -0.9483475, 0.7590616, 1, 1, 1, 1, 1,
1.277494, 0.1242681, 1.038096, 1, 1, 1, 1, 1,
1.277532, 0.2284881, 1.410907, 1, 1, 1, 1, 1,
1.302649, -0.284766, 2.17418, 1, 1, 1, 1, 1,
1.305883, -2.138172, 0.9556795, 1, 1, 1, 1, 1,
1.31421, -0.7907417, 3.98748, 1, 1, 1, 1, 1,
1.32277, -0.3787919, 1.189582, 1, 1, 1, 1, 1,
1.333367, 0.4825297, 1.481958, 1, 1, 1, 1, 1,
1.334126, -1.271099, 3.643381, 1, 1, 1, 1, 1,
1.336819, -0.4442686, 1.326643, 1, 1, 1, 1, 1,
1.339416, -0.7600707, 0.9348212, 1, 1, 1, 1, 1,
1.343616, -0.8441316, 3.448309, 1, 1, 1, 1, 1,
1.350478, 2.259047, 0.04757955, 1, 1, 1, 1, 1,
1.358534, 2.308036, 1.885633, 1, 1, 1, 1, 1,
1.375082, -1.0934, 2.174508, 1, 1, 1, 1, 1,
1.375592, 0.4664401, -8.788541e-05, 0, 0, 1, 1, 1,
1.396092, -1.212676, 2.858111, 1, 0, 0, 1, 1,
1.399104, 0.7102743, -1.644915, 1, 0, 0, 1, 1,
1.400416, 0.773719, 1.750267, 1, 0, 0, 1, 1,
1.403144, 0.1697734, 1.568956, 1, 0, 0, 1, 1,
1.409775, -0.0458842, 1.74298, 1, 0, 0, 1, 1,
1.413945, 0.6232843, 1.155175, 0, 0, 0, 1, 1,
1.414173, -1.836138, 2.445364, 0, 0, 0, 1, 1,
1.427459, -0.04607451, 2.946184, 0, 0, 0, 1, 1,
1.431666, 0.2247457, 0.2365753, 0, 0, 0, 1, 1,
1.43231, -0.3203317, 1.834747, 0, 0, 0, 1, 1,
1.445597, 1.258206, 1.024397, 0, 0, 0, 1, 1,
1.458816, 1.114742, 1.015393, 0, 0, 0, 1, 1,
1.463644, -0.153405, 0.8094391, 1, 1, 1, 1, 1,
1.467108, 2.194742, -0.6561245, 1, 1, 1, 1, 1,
1.476629, -0.1724745, 0.6260785, 1, 1, 1, 1, 1,
1.483495, 0.4218584, 0.7743807, 1, 1, 1, 1, 1,
1.485138, 0.4348763, 1.202093, 1, 1, 1, 1, 1,
1.487833, 0.8657374, 0.6232576, 1, 1, 1, 1, 1,
1.487981, -1.326675, 2.484002, 1, 1, 1, 1, 1,
1.492471, -0.3887622, 3.236409, 1, 1, 1, 1, 1,
1.495962, -0.4048614, 1.383106, 1, 1, 1, 1, 1,
1.514493, 1.920046, 0.08767132, 1, 1, 1, 1, 1,
1.517496, -1.340779, 2.385993, 1, 1, 1, 1, 1,
1.526274, -0.1344962, 1.654809, 1, 1, 1, 1, 1,
1.538781, -0.1306306, 1.704185, 1, 1, 1, 1, 1,
1.539845, 0.4898522, 0.6525437, 1, 1, 1, 1, 1,
1.55569, -0.1688453, 1.533845, 1, 1, 1, 1, 1,
1.569242, -1.699764, 3.289262, 0, 0, 1, 1, 1,
1.570353, 0.1913454, 0.2349879, 1, 0, 0, 1, 1,
1.57125, -0.1005046, 1.949049, 1, 0, 0, 1, 1,
1.576555, -0.3514631, 2.082018, 1, 0, 0, 1, 1,
1.594311, -0.6770635, 2.272628, 1, 0, 0, 1, 1,
1.609881, -1.555042, 3.902813, 1, 0, 0, 1, 1,
1.615342, -2.504284, 2.738827, 0, 0, 0, 1, 1,
1.631049, 0.32542, 3.798163, 0, 0, 0, 1, 1,
1.642584, 1.95697, 0.4665889, 0, 0, 0, 1, 1,
1.649073, 0.1286922, 1.11325, 0, 0, 0, 1, 1,
1.653998, 0.6883599, 2.100204, 0, 0, 0, 1, 1,
1.663041, 1.238291, 1.7969, 0, 0, 0, 1, 1,
1.677524, 0.2663683, 1.688016, 0, 0, 0, 1, 1,
1.678338, -1.312906, 2.566492, 1, 1, 1, 1, 1,
1.680725, -2.205458, 2.935824, 1, 1, 1, 1, 1,
1.68563, 1.836928, 0.5139479, 1, 1, 1, 1, 1,
1.68932, -0.1647403, 2.356659, 1, 1, 1, 1, 1,
1.699611, -1.297351, 0.9661514, 1, 1, 1, 1, 1,
1.702435, -0.1225964, 3.271301, 1, 1, 1, 1, 1,
1.70785, -0.08432426, 2.830572, 1, 1, 1, 1, 1,
1.73251, 0.2188111, 2.081517, 1, 1, 1, 1, 1,
1.737438, 0.5750492, 0.7331206, 1, 1, 1, 1, 1,
1.743748, 0.4237731, 1.234749, 1, 1, 1, 1, 1,
1.766548, 0.1713842, 3.178995, 1, 1, 1, 1, 1,
1.769606, 0.2578934, 2.851372, 1, 1, 1, 1, 1,
1.776469, -0.6267482, 0.09468424, 1, 1, 1, 1, 1,
1.810539, -0.1527126, 2.923704, 1, 1, 1, 1, 1,
1.818266, 1.035138, 1.208821, 1, 1, 1, 1, 1,
1.840317, -0.5946878, 2.359128, 0, 0, 1, 1, 1,
1.850011, -1.07079, 3.408973, 1, 0, 0, 1, 1,
1.856753, 1.730841, 0.3514747, 1, 0, 0, 1, 1,
1.859232, -0.9694518, 1.352589, 1, 0, 0, 1, 1,
1.862233, 0.2170241, 2.19916, 1, 0, 0, 1, 1,
1.864448, 0.1766202, 1.493501, 1, 0, 0, 1, 1,
1.869249, -0.004447477, 1.84183, 0, 0, 0, 1, 1,
1.891429, 0.7519968, -0.07285836, 0, 0, 0, 1, 1,
1.894986, 0.5296109, 2.421556, 0, 0, 0, 1, 1,
1.89707, -1.294622, 2.155487, 0, 0, 0, 1, 1,
1.909743, 2.121392, -0.2641622, 0, 0, 0, 1, 1,
1.967657, -0.6346712, 2.635563, 0, 0, 0, 1, 1,
1.967913, -1.866314, 2.352064, 0, 0, 0, 1, 1,
1.979381, -0.2595444, 2.080742, 1, 1, 1, 1, 1,
1.986696, 1.512216, 0.7182607, 1, 1, 1, 1, 1,
1.996677, 0.01717719, 1.534834, 1, 1, 1, 1, 1,
2.03094, 0.3827762, 1.139953, 1, 1, 1, 1, 1,
2.035347, 1.075903, 1.700025, 1, 1, 1, 1, 1,
2.080255, -1.339321, 1.030291, 1, 1, 1, 1, 1,
2.086118, -1.540544, 1.910436, 1, 1, 1, 1, 1,
2.094755, -1.041716, 2.751531, 1, 1, 1, 1, 1,
2.10178, -0.8538316, 3.677711, 1, 1, 1, 1, 1,
2.104438, 0.4663016, 1.467864, 1, 1, 1, 1, 1,
2.104764, 0.611629, 0.74158, 1, 1, 1, 1, 1,
2.106444, 0.7381942, 2.912512, 1, 1, 1, 1, 1,
2.126513, 0.5654174, 0.7498024, 1, 1, 1, 1, 1,
2.140302, -1.022296, 1.800407, 1, 1, 1, 1, 1,
2.178932, 0.158009, 2.396848, 1, 1, 1, 1, 1,
2.179695, 0.173531, 1.722556, 0, 0, 1, 1, 1,
2.184348, 0.5636511, 1.28294, 1, 0, 0, 1, 1,
2.202941, 0.3719919, 0.4724343, 1, 0, 0, 1, 1,
2.320505, -0.6847638, -0.3532199, 1, 0, 0, 1, 1,
2.329484, -1.054241, 3.278024, 1, 0, 0, 1, 1,
2.377746, 0.2235281, 0.3008809, 1, 0, 0, 1, 1,
2.39831, -0.06157497, 1.111288, 0, 0, 0, 1, 1,
2.406409, -1.954683, 2.646733, 0, 0, 0, 1, 1,
2.414012, 1.492439, 2.257313, 0, 0, 0, 1, 1,
2.464587, -0.4887043, 0.4659154, 0, 0, 0, 1, 1,
2.520738, 0.7094826, 1.458205, 0, 0, 0, 1, 1,
2.529422, -0.03525279, 0.4011461, 0, 0, 0, 1, 1,
2.639316, 0.02558265, 1.012819, 0, 0, 0, 1, 1,
2.641424, 0.03724238, 0.6335416, 1, 1, 1, 1, 1,
2.8148, -0.675577, 0.9768769, 1, 1, 1, 1, 1,
2.819977, 1.418847, 1.230272, 1, 1, 1, 1, 1,
2.861687, 0.03999975, 2.233937, 1, 1, 1, 1, 1,
2.871256, -0.8366498, -0.6081171, 1, 1, 1, 1, 1,
2.901015, -0.4842364, 1.226868, 1, 1, 1, 1, 1,
3.173092, 0.03698806, 1.263026, 1, 1, 1, 1, 1
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
var radius = 9.372649;
var distance = 32.92103;
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
mvMatrix.translate( 0.08269882, 0.2662373, 0.2156 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.92103);
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
