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
-3.183589, 1.092915, -0.02518449, 1, 0, 0, 1,
-3.180373, 0.1060265, -1.81088, 1, 0.007843138, 0, 1,
-3.079284, 0.7508072, -0.06204493, 1, 0.01176471, 0, 1,
-3.069305, 0.7213953, -3.09412, 1, 0.01960784, 0, 1,
-2.796186, -0.7649373, -0.8481094, 1, 0.02352941, 0, 1,
-2.658266, 1.033696, 1.468587, 1, 0.03137255, 0, 1,
-2.473915, 0.2073341, -2.851526, 1, 0.03529412, 0, 1,
-2.397839, -0.2938442, -1.662287, 1, 0.04313726, 0, 1,
-2.352355, -0.3716722, -0.7085498, 1, 0.04705882, 0, 1,
-2.346329, 1.563852, -2.823196, 1, 0.05490196, 0, 1,
-2.313064, 0.7692537, 0.1990739, 1, 0.05882353, 0, 1,
-2.299861, 0.4348252, -2.049822, 1, 0.06666667, 0, 1,
-2.297674, -0.1629705, -0.5848717, 1, 0.07058824, 0, 1,
-2.263413, 0.2686022, -1.247163, 1, 0.07843138, 0, 1,
-2.244985, 0.78233, -0.3645676, 1, 0.08235294, 0, 1,
-2.231488, -0.2754165, -1.492499, 1, 0.09019608, 0, 1,
-2.227114, 1.03338, -0.01746442, 1, 0.09411765, 0, 1,
-2.22593, 0.9391609, 0.2312569, 1, 0.1019608, 0, 1,
-2.21859, -0.8295448, -2.060788, 1, 0.1098039, 0, 1,
-2.199472, 0.8140623, -0.9164967, 1, 0.1137255, 0, 1,
-2.187532, 0.9775326, 1.19189, 1, 0.1215686, 0, 1,
-2.167102, -0.5576828, -2.991875, 1, 0.1254902, 0, 1,
-2.149425, 1.044564, -1.537404, 1, 0.1333333, 0, 1,
-2.122385, -0.9758479, -2.049731, 1, 0.1372549, 0, 1,
-2.10731, 0.5996814, -2.320669, 1, 0.145098, 0, 1,
-2.076999, 0.3469944, -1.729106, 1, 0.1490196, 0, 1,
-2.0763, -0.6199681, -1.800942, 1, 0.1568628, 0, 1,
-2.063316, 2.096917, -0.1991796, 1, 0.1607843, 0, 1,
-2.057325, -0.3592933, -2.916077, 1, 0.1686275, 0, 1,
-2.030547, -0.4169891, -3.710522, 1, 0.172549, 0, 1,
-2.026616, -1.024941, -2.097464, 1, 0.1803922, 0, 1,
-2.014885, -1.353819, -0.9722352, 1, 0.1843137, 0, 1,
-1.965748, -0.3704373, -3.410634, 1, 0.1921569, 0, 1,
-1.916439, -1.481253, -1.673477, 1, 0.1960784, 0, 1,
-1.913983, -0.09012684, -2.300576, 1, 0.2039216, 0, 1,
-1.882858, -1.325018, -4.992206, 1, 0.2117647, 0, 1,
-1.880377, 0.3852519, -0.6982684, 1, 0.2156863, 0, 1,
-1.868018, 0.07906288, -1.69589, 1, 0.2235294, 0, 1,
-1.842794, -0.4131646, -1.225333, 1, 0.227451, 0, 1,
-1.821463, 0.6515853, -2.049339, 1, 0.2352941, 0, 1,
-1.821354, -1.334573, -2.663145, 1, 0.2392157, 0, 1,
-1.791166, 0.2335276, -1.422606, 1, 0.2470588, 0, 1,
-1.779384, 1.010744, -2.500586, 1, 0.2509804, 0, 1,
-1.77207, -0.3316178, -1.28106, 1, 0.2588235, 0, 1,
-1.758378, -0.038103, 0.3495382, 1, 0.2627451, 0, 1,
-1.755081, 1.073661, -1.541552, 1, 0.2705882, 0, 1,
-1.743908, -0.86238, -3.826632, 1, 0.2745098, 0, 1,
-1.720395, 0.7563524, -0.6033952, 1, 0.282353, 0, 1,
-1.710152, -0.8553115, -2.31759, 1, 0.2862745, 0, 1,
-1.704608, 0.2932705, -2.308711, 1, 0.2941177, 0, 1,
-1.682371, -0.0246801, -2.075498, 1, 0.3019608, 0, 1,
-1.676369, 1.734217, -1.988759, 1, 0.3058824, 0, 1,
-1.638353, -0.2565664, -0.9070055, 1, 0.3137255, 0, 1,
-1.630062, -0.7881896, -1.965052, 1, 0.3176471, 0, 1,
-1.627549, -0.6560934, -0.1542213, 1, 0.3254902, 0, 1,
-1.588091, -0.4439673, -1.357455, 1, 0.3294118, 0, 1,
-1.578714, -0.7634127, -1.582043, 1, 0.3372549, 0, 1,
-1.575423, 0.7164205, -1.836421, 1, 0.3411765, 0, 1,
-1.529898, -0.1808188, -3.40416, 1, 0.3490196, 0, 1,
-1.52466, -0.4098527, -0.2821917, 1, 0.3529412, 0, 1,
-1.502252, -1.205488, -4.287762, 1, 0.3607843, 0, 1,
-1.498116, -0.457552, -2.05257, 1, 0.3647059, 0, 1,
-1.491486, 0.6178036, -1.837346, 1, 0.372549, 0, 1,
-1.480984, -0.5540636, -1.540166, 1, 0.3764706, 0, 1,
-1.479046, -0.03756283, -0.7092478, 1, 0.3843137, 0, 1,
-1.476688, 0.4778385, 0.1126006, 1, 0.3882353, 0, 1,
-1.474157, 1.026956, -1.424188, 1, 0.3960784, 0, 1,
-1.473925, 0.5228105, -0.2817794, 1, 0.4039216, 0, 1,
-1.467113, -0.6885085, -0.9223524, 1, 0.4078431, 0, 1,
-1.45706, -0.3697814, -1.597255, 1, 0.4156863, 0, 1,
-1.43916, -0.2463313, -2.331471, 1, 0.4196078, 0, 1,
-1.438047, 0.5838138, -2.259689, 1, 0.427451, 0, 1,
-1.427724, -2.63297, -2.024603, 1, 0.4313726, 0, 1,
-1.415209, -1.793869, -2.766412, 1, 0.4392157, 0, 1,
-1.409522, -0.1389096, -1.221236, 1, 0.4431373, 0, 1,
-1.405795, 0.1211949, -3.525131, 1, 0.4509804, 0, 1,
-1.391817, 0.2388344, -2.530453, 1, 0.454902, 0, 1,
-1.373877, 2.394338, -1.814029, 1, 0.4627451, 0, 1,
-1.370129, 2.128088, -0.1928574, 1, 0.4666667, 0, 1,
-1.368696, 2.882076, 0.8379007, 1, 0.4745098, 0, 1,
-1.365244, -1.463333, -2.106836, 1, 0.4784314, 0, 1,
-1.361658, 1.877449, -2.127808, 1, 0.4862745, 0, 1,
-1.336668, -0.5112929, -2.696949, 1, 0.4901961, 0, 1,
-1.328051, -0.5961345, -2.035, 1, 0.4980392, 0, 1,
-1.322506, 1.053477, 0.007951441, 1, 0.5058824, 0, 1,
-1.31141, -0.3120009, -0.4782237, 1, 0.509804, 0, 1,
-1.310877, 0.4421038, -1.772679, 1, 0.5176471, 0, 1,
-1.308873, 0.813105, -2.111625, 1, 0.5215687, 0, 1,
-1.305093, -1.448096, -1.628196, 1, 0.5294118, 0, 1,
-1.301597, 0.9371765, -1.225415, 1, 0.5333334, 0, 1,
-1.296998, -0.09006836, -1.486589, 1, 0.5411765, 0, 1,
-1.28862, -0.6802866, -0.687274, 1, 0.5450981, 0, 1,
-1.275107, -1.56874, -3.702007, 1, 0.5529412, 0, 1,
-1.265856, -1.342027, -3.106208, 1, 0.5568628, 0, 1,
-1.265263, 1.068971, -1.316714, 1, 0.5647059, 0, 1,
-1.26461, -2.13426, -3.162613, 1, 0.5686275, 0, 1,
-1.264455, -2.092659, -2.243852, 1, 0.5764706, 0, 1,
-1.254021, -0.6471459, -2.22021, 1, 0.5803922, 0, 1,
-1.250656, -1.66024, -2.641666, 1, 0.5882353, 0, 1,
-1.249715, -0.2087485, -2.432584, 1, 0.5921569, 0, 1,
-1.249613, 0.3694277, -0.5361598, 1, 0.6, 0, 1,
-1.241941, -0.1371391, -1.136671, 1, 0.6078432, 0, 1,
-1.233277, -0.9885056, -2.567165, 1, 0.6117647, 0, 1,
-1.230396, 0.4381562, -0.5825107, 1, 0.6196079, 0, 1,
-1.228426, 0.5428236, -1.470613, 1, 0.6235294, 0, 1,
-1.222727, -0.3154123, -1.324113, 1, 0.6313726, 0, 1,
-1.207355, 1.171327, -0.08377996, 1, 0.6352941, 0, 1,
-1.200027, -0.7406099, -1.281598, 1, 0.6431373, 0, 1,
-1.193436, -1.22451, -2.649176, 1, 0.6470588, 0, 1,
-1.190281, 0.3009909, -0.8648114, 1, 0.654902, 0, 1,
-1.186418, 1.415764, 0.09505055, 1, 0.6588235, 0, 1,
-1.172952, -0.4759164, -3.114444, 1, 0.6666667, 0, 1,
-1.169402, 0.7730792, -2.218202, 1, 0.6705883, 0, 1,
-1.168576, -0.8864862, -2.908056, 1, 0.6784314, 0, 1,
-1.159955, 0.1906483, -1.23381, 1, 0.682353, 0, 1,
-1.151658, 0.2459679, -1.675075, 1, 0.6901961, 0, 1,
-1.143785, 0.6271123, -1.13798, 1, 0.6941177, 0, 1,
-1.139201, -0.7261734, -1.530024, 1, 0.7019608, 0, 1,
-1.136802, 0.4523971, 0.5676268, 1, 0.7098039, 0, 1,
-1.131727, 0.2466359, -1.444471, 1, 0.7137255, 0, 1,
-1.127754, -0.4166891, -2.752178, 1, 0.7215686, 0, 1,
-1.116275, -0.8235742, -2.487414, 1, 0.7254902, 0, 1,
-1.106909, 0.5839458, -1.544511, 1, 0.7333333, 0, 1,
-1.096915, -0.3933958, -1.855797, 1, 0.7372549, 0, 1,
-1.09444, 0.3380476, -2.074811, 1, 0.7450981, 0, 1,
-1.089019, 0.6254682, -2.442046, 1, 0.7490196, 0, 1,
-1.084891, -0.4752642, -3.73124, 1, 0.7568628, 0, 1,
-1.083251, -0.8717306, 0.6827328, 1, 0.7607843, 0, 1,
-1.066443, 0.7149485, -0.2994131, 1, 0.7686275, 0, 1,
-1.065016, 1.915863, -1.048776, 1, 0.772549, 0, 1,
-1.063831, 0.1735761, -0.9869351, 1, 0.7803922, 0, 1,
-1.052967, 0.317091, 0.6732829, 1, 0.7843137, 0, 1,
-1.052231, 0.7085432, -2.208829, 1, 0.7921569, 0, 1,
-1.051337, -0.1483777, -0.4692973, 1, 0.7960784, 0, 1,
-1.05086, 0.821636, -0.5238968, 1, 0.8039216, 0, 1,
-1.031169, 0.1531419, -1.768067, 1, 0.8117647, 0, 1,
-1.030644, -0.952393, -3.037227, 1, 0.8156863, 0, 1,
-1.030344, 1.560032, -0.9381565, 1, 0.8235294, 0, 1,
-1.025042, -1.156654, -1.865899, 1, 0.827451, 0, 1,
-1.020671, -1.821984, -0.6578234, 1, 0.8352941, 0, 1,
-1.019035, -0.06002438, -3.002597, 1, 0.8392157, 0, 1,
-1.01787, 1.315578, -0.1205458, 1, 0.8470588, 0, 1,
-1.016165, -0.3396817, -0.6482171, 1, 0.8509804, 0, 1,
-1.014275, -1.042294, -3.119119, 1, 0.8588235, 0, 1,
-1.01091, 0.5371361, -2.693877, 1, 0.8627451, 0, 1,
-1.005158, 0.6193202, 0.6554903, 1, 0.8705882, 0, 1,
-1.000083, -0.3046292, -3.504103, 1, 0.8745098, 0, 1,
-0.9926974, -0.3064001, -3.590228, 1, 0.8823529, 0, 1,
-0.9899999, 1.243936, -1.630077, 1, 0.8862745, 0, 1,
-0.9898197, 1.401564, -0.6149099, 1, 0.8941177, 0, 1,
-0.9797875, 1.016647, -1.09886, 1, 0.8980392, 0, 1,
-0.9772219, 1.913194, -3.766624, 1, 0.9058824, 0, 1,
-0.9768015, -1.516733, -2.809472, 1, 0.9137255, 0, 1,
-0.9698502, 1.422018, 0.3885231, 1, 0.9176471, 0, 1,
-0.9667819, 0.03953495, -0.8364623, 1, 0.9254902, 0, 1,
-0.9650757, -0.8602157, -1.90649, 1, 0.9294118, 0, 1,
-0.9650757, -0.05832233, -1.146519, 1, 0.9372549, 0, 1,
-0.9644867, 0.5739852, -1.551878, 1, 0.9411765, 0, 1,
-0.9576803, -2.426605, -2.645932, 1, 0.9490196, 0, 1,
-0.9546609, -0.4897831, -2.327308, 1, 0.9529412, 0, 1,
-0.9505258, 0.4898057, -2.236998, 1, 0.9607843, 0, 1,
-0.9461148, -0.3959211, -1.483462, 1, 0.9647059, 0, 1,
-0.9443743, 0.3124424, -0.4535036, 1, 0.972549, 0, 1,
-0.9379979, 0.7603551, 2.088796, 1, 0.9764706, 0, 1,
-0.9349712, -0.847864, 1.179083, 1, 0.9843137, 0, 1,
-0.9134394, 0.06142614, -1.421815, 1, 0.9882353, 0, 1,
-0.9099047, 0.5608417, -2.33987, 1, 0.9960784, 0, 1,
-0.9073533, 0.6760182, -0.1349905, 0.9960784, 1, 0, 1,
-0.9037051, 0.1856709, -4.081494, 0.9921569, 1, 0, 1,
-0.9017513, -0.7019822, -2.9829, 0.9843137, 1, 0, 1,
-0.8960363, 0.6726533, -0.9752135, 0.9803922, 1, 0, 1,
-0.8931717, -0.6175775, 0.01426625, 0.972549, 1, 0, 1,
-0.8930657, 2.359233, -1.165798, 0.9686275, 1, 0, 1,
-0.8857554, -1.451349, -1.768953, 0.9607843, 1, 0, 1,
-0.8799912, -0.1665766, -0.6597272, 0.9568627, 1, 0, 1,
-0.8775176, 0.3128736, -1.306853, 0.9490196, 1, 0, 1,
-0.87603, 1.462759, 1.744687, 0.945098, 1, 0, 1,
-0.8760065, 0.6685577, 0.1694705, 0.9372549, 1, 0, 1,
-0.8720145, 0.3203545, -2.186188, 0.9333333, 1, 0, 1,
-0.8706257, 0.3381775, -1.212975, 0.9254902, 1, 0, 1,
-0.861173, 2.064303, -0.6500137, 0.9215686, 1, 0, 1,
-0.8581868, 0.1722447, -0.2757157, 0.9137255, 1, 0, 1,
-0.8531656, 0.2156094, -2.643475, 0.9098039, 1, 0, 1,
-0.8527015, -0.5675193, -1.142011, 0.9019608, 1, 0, 1,
-0.8509681, -2.399372, -1.868506, 0.8941177, 1, 0, 1,
-0.8508739, 1.538723, -0.2739517, 0.8901961, 1, 0, 1,
-0.8465846, 0.8893546, -1.671244, 0.8823529, 1, 0, 1,
-0.8459128, 1.96991, -1.349581, 0.8784314, 1, 0, 1,
-0.8454951, 0.4914156, 0.8576665, 0.8705882, 1, 0, 1,
-0.8365288, 0.1759507, -1.494098, 0.8666667, 1, 0, 1,
-0.8310258, -0.9014511, -2.749383, 0.8588235, 1, 0, 1,
-0.8299093, 1.277739, -1.83259, 0.854902, 1, 0, 1,
-0.8285905, -0.03084332, -0.52694, 0.8470588, 1, 0, 1,
-0.8260211, 0.2800057, -1.009745, 0.8431373, 1, 0, 1,
-0.8248957, 0.8335944, -0.4318928, 0.8352941, 1, 0, 1,
-0.8241892, 0.2102025, -0.5887246, 0.8313726, 1, 0, 1,
-0.8184551, 3.042165, -0.751375, 0.8235294, 1, 0, 1,
-0.8169925, 0.8612567, -1.09524, 0.8196079, 1, 0, 1,
-0.7985637, -0.3678842, -2.066446, 0.8117647, 1, 0, 1,
-0.7943673, 0.6160046, -1.306502, 0.8078431, 1, 0, 1,
-0.7912912, 0.3623897, -0.2340325, 0.8, 1, 0, 1,
-0.7833, 2.358166, 0.5146607, 0.7921569, 1, 0, 1,
-0.7825571, 0.4344447, 0.6241284, 0.7882353, 1, 0, 1,
-0.7821245, -0.1980114, -1.908712, 0.7803922, 1, 0, 1,
-0.7700028, -0.4777542, -1.494951, 0.7764706, 1, 0, 1,
-0.7653128, -0.02180669, -1.843838, 0.7686275, 1, 0, 1,
-0.7605628, 0.1235819, -0.8122029, 0.7647059, 1, 0, 1,
-0.7582417, 1.201495, -0.5110628, 0.7568628, 1, 0, 1,
-0.7576829, 0.7899601, 0.2609787, 0.7529412, 1, 0, 1,
-0.7538002, 0.05952136, -0.6252609, 0.7450981, 1, 0, 1,
-0.7459413, -0.6473281, -2.003613, 0.7411765, 1, 0, 1,
-0.7383295, -0.3964808, -1.851263, 0.7333333, 1, 0, 1,
-0.7315028, -0.7160918, -1.946967, 0.7294118, 1, 0, 1,
-0.7216994, -1.499614, -2.975459, 0.7215686, 1, 0, 1,
-0.7160681, -1.168764, -3.091979, 0.7176471, 1, 0, 1,
-0.7149177, -0.3480256, -3.748813, 0.7098039, 1, 0, 1,
-0.7146511, -0.517958, -3.242675, 0.7058824, 1, 0, 1,
-0.7145811, 0.04100869, -1.33262, 0.6980392, 1, 0, 1,
-0.7093329, -0.002394365, -1.34294, 0.6901961, 1, 0, 1,
-0.7007344, 0.2011395, -1.656879, 0.6862745, 1, 0, 1,
-0.6983656, 0.4840172, -2.435494, 0.6784314, 1, 0, 1,
-0.6963946, -0.4012704, -0.9796652, 0.6745098, 1, 0, 1,
-0.6953788, 0.5210098, -0.6235551, 0.6666667, 1, 0, 1,
-0.6946254, 0.9497366, -2.643858, 0.6627451, 1, 0, 1,
-0.6863676, -0.3954732, -0.9528, 0.654902, 1, 0, 1,
-0.6786063, 1.007579, -0.6516839, 0.6509804, 1, 0, 1,
-0.6750138, 1.114683, -1.438971, 0.6431373, 1, 0, 1,
-0.6649663, -0.159503, -2.310697, 0.6392157, 1, 0, 1,
-0.6648328, -0.5528231, -0.9885026, 0.6313726, 1, 0, 1,
-0.6644521, -0.5359124, -2.410175, 0.627451, 1, 0, 1,
-0.6628986, 1.880419, 0.8172618, 0.6196079, 1, 0, 1,
-0.6623729, 0.8506831, -0.1049405, 0.6156863, 1, 0, 1,
-0.6488988, 0.9933053, 0.4050264, 0.6078432, 1, 0, 1,
-0.646848, 1.667872, 0.1336024, 0.6039216, 1, 0, 1,
-0.6453823, 1.787758, 1.001903, 0.5960785, 1, 0, 1,
-0.6450975, 1.005513, 1.293493, 0.5882353, 1, 0, 1,
-0.6444256, 0.5377404, -0.6769549, 0.5843138, 1, 0, 1,
-0.6400403, -0.7928845, -2.55822, 0.5764706, 1, 0, 1,
-0.6392702, -1.127, -3.560181, 0.572549, 1, 0, 1,
-0.6367562, 0.3975111, -0.1150513, 0.5647059, 1, 0, 1,
-0.6363918, 2.195266, 0.5477713, 0.5607843, 1, 0, 1,
-0.6323579, 0.3362236, -1.398173, 0.5529412, 1, 0, 1,
-0.6300851, -1.43562, -1.935236, 0.5490196, 1, 0, 1,
-0.6252561, 0.127087, -1.43299, 0.5411765, 1, 0, 1,
-0.6251075, -0.6741308, -2.684308, 0.5372549, 1, 0, 1,
-0.621659, 1.093922, -1.309816, 0.5294118, 1, 0, 1,
-0.6163717, -0.123378, -2.248515, 0.5254902, 1, 0, 1,
-0.6146125, 0.4663779, -1.628149, 0.5176471, 1, 0, 1,
-0.6137654, -0.5723361, -0.841846, 0.5137255, 1, 0, 1,
-0.6131118, 0.4540313, -1.237065, 0.5058824, 1, 0, 1,
-0.6099843, -0.5886645, -1.348937, 0.5019608, 1, 0, 1,
-0.6087559, -0.04201859, -0.6275159, 0.4941176, 1, 0, 1,
-0.6065931, -0.8453642, -2.729159, 0.4862745, 1, 0, 1,
-0.6065603, -0.268384, -1.8381, 0.4823529, 1, 0, 1,
-0.6058299, -0.9359549, -3.006978, 0.4745098, 1, 0, 1,
-0.5975859, -0.5938529, -3.350402, 0.4705882, 1, 0, 1,
-0.596895, 1.392092, -1.281516, 0.4627451, 1, 0, 1,
-0.5892495, 0.2707271, -0.5965032, 0.4588235, 1, 0, 1,
-0.5797129, 0.3614211, -1.904097, 0.4509804, 1, 0, 1,
-0.5781505, 0.2709162, -0.8537813, 0.4470588, 1, 0, 1,
-0.5768631, -2.493811, -2.584747, 0.4392157, 1, 0, 1,
-0.5727457, -0.09386925, -4.096276, 0.4352941, 1, 0, 1,
-0.5703884, 1.564084, 0.3964184, 0.427451, 1, 0, 1,
-0.5668755, 0.1750762, -2.71737, 0.4235294, 1, 0, 1,
-0.5650808, -1.2655, -1.623857, 0.4156863, 1, 0, 1,
-0.5649334, 0.4885324, 0.5602872, 0.4117647, 1, 0, 1,
-0.5633853, 0.4163515, -1.178612, 0.4039216, 1, 0, 1,
-0.563324, 0.6501012, -0.7041087, 0.3960784, 1, 0, 1,
-0.5631765, 0.08403639, -0.9315889, 0.3921569, 1, 0, 1,
-0.5620062, 0.6700065, -0.8566079, 0.3843137, 1, 0, 1,
-0.5599323, 0.8796635, -0.7047941, 0.3803922, 1, 0, 1,
-0.5594511, -1.59587, -3.916943, 0.372549, 1, 0, 1,
-0.5592096, 1.014397, 0.07841302, 0.3686275, 1, 0, 1,
-0.5565237, -0.3986017, -1.530584, 0.3607843, 1, 0, 1,
-0.5562246, 0.1902829, 0.2433261, 0.3568628, 1, 0, 1,
-0.5554771, 0.9909927, -0.4712592, 0.3490196, 1, 0, 1,
-0.5514691, -1.703074, -3.678831, 0.345098, 1, 0, 1,
-0.5484752, 0.3849644, -1.977081, 0.3372549, 1, 0, 1,
-0.5470834, -0.3018489, -2.344533, 0.3333333, 1, 0, 1,
-0.5445181, 0.2366993, -2.575265, 0.3254902, 1, 0, 1,
-0.5440267, -1.51646, -2.342683, 0.3215686, 1, 0, 1,
-0.5418704, -1.035333, -3.60152, 0.3137255, 1, 0, 1,
-0.5406627, -1.607896, -3.673075, 0.3098039, 1, 0, 1,
-0.5373654, 0.4500479, -2.173331, 0.3019608, 1, 0, 1,
-0.5366616, 0.6584618, -1.740237, 0.2941177, 1, 0, 1,
-0.5359191, 0.04153522, -1.450321, 0.2901961, 1, 0, 1,
-0.5277654, -2.036676, -3.734771, 0.282353, 1, 0, 1,
-0.5269979, 0.1933108, -0.2303498, 0.2784314, 1, 0, 1,
-0.5265521, 0.6311752, 0.380926, 0.2705882, 1, 0, 1,
-0.5242499, -0.6800473, -2.042423, 0.2666667, 1, 0, 1,
-0.5221626, 0.8315715, -2.192804, 0.2588235, 1, 0, 1,
-0.5187071, 0.6566975, 0.08435917, 0.254902, 1, 0, 1,
-0.5185044, 0.02957674, -1.491676, 0.2470588, 1, 0, 1,
-0.518312, -0.01337468, -2.565748, 0.2431373, 1, 0, 1,
-0.5136415, 0.2103685, -1.24913, 0.2352941, 1, 0, 1,
-0.5134594, -1.822287, -3.736201, 0.2313726, 1, 0, 1,
-0.5059695, -0.7618335, -2.931159, 0.2235294, 1, 0, 1,
-0.5053293, 1.378792, -1.407675, 0.2196078, 1, 0, 1,
-0.5020472, 0.1438852, 0.2698157, 0.2117647, 1, 0, 1,
-0.4986857, 0.2179508, 0.8760756, 0.2078431, 1, 0, 1,
-0.49667, 1.59348, -1.056503, 0.2, 1, 0, 1,
-0.4954508, -0.2045869, -1.604562, 0.1921569, 1, 0, 1,
-0.4874133, 0.2042217, -1.998395, 0.1882353, 1, 0, 1,
-0.4829056, 0.3756885, -0.9412344, 0.1803922, 1, 0, 1,
-0.4827569, 0.2807408, -0.7331448, 0.1764706, 1, 0, 1,
-0.4798632, -0.783294, -4.553097, 0.1686275, 1, 0, 1,
-0.4792873, 0.6060557, -0.721728, 0.1647059, 1, 0, 1,
-0.4777187, 0.3008475, -0.297005, 0.1568628, 1, 0, 1,
-0.4772608, -0.9717344, -4.32998, 0.1529412, 1, 0, 1,
-0.4747306, -0.893158, -0.4188865, 0.145098, 1, 0, 1,
-0.473658, -0.2565093, -0.7031945, 0.1411765, 1, 0, 1,
-0.4698436, -0.5419337, -4.117076, 0.1333333, 1, 0, 1,
-0.4690277, -1.15247, -2.441229, 0.1294118, 1, 0, 1,
-0.465659, -0.6099539, -1.80379, 0.1215686, 1, 0, 1,
-0.4651057, 0.9171786, -0.8964079, 0.1176471, 1, 0, 1,
-0.4613461, -0.224196, -1.553118, 0.1098039, 1, 0, 1,
-0.4600591, -0.1173835, -2.153102, 0.1058824, 1, 0, 1,
-0.4586427, 1.855341, -0.5937459, 0.09803922, 1, 0, 1,
-0.4586016, 0.5350262, -0.2897431, 0.09019608, 1, 0, 1,
-0.4427229, -0.1372621, 0.6881359, 0.08627451, 1, 0, 1,
-0.4377892, -0.2693996, -0.3519353, 0.07843138, 1, 0, 1,
-0.4358507, -1.372516, -2.835704, 0.07450981, 1, 0, 1,
-0.435408, 1.876775, 0.08417282, 0.06666667, 1, 0, 1,
-0.4330046, 2.778482, 0.3912099, 0.0627451, 1, 0, 1,
-0.4329293, 0.8011521, -0.8422149, 0.05490196, 1, 0, 1,
-0.4305698, 1.322384, -0.7485676, 0.05098039, 1, 0, 1,
-0.4291627, 0.475318, 0.1247985, 0.04313726, 1, 0, 1,
-0.4282226, -0.01176452, -1.553799, 0.03921569, 1, 0, 1,
-0.4220812, -1.564897, -3.888522, 0.03137255, 1, 0, 1,
-0.417339, 0.6800436, 0.8903813, 0.02745098, 1, 0, 1,
-0.4168822, 0.5436859, -0.7607977, 0.01960784, 1, 0, 1,
-0.4159483, 0.201651, -0.8858646, 0.01568628, 1, 0, 1,
-0.4083378, -0.6447251, -4.084903, 0.007843138, 1, 0, 1,
-0.4059158, 0.258132, -1.113577, 0.003921569, 1, 0, 1,
-0.3991548, 0.3663661, -0.4350645, 0, 1, 0.003921569, 1,
-0.3926824, 0.5695924, 0.5403343, 0, 1, 0.01176471, 1,
-0.3912376, 0.09601664, -2.514541, 0, 1, 0.01568628, 1,
-0.3849987, 0.3196644, -0.4738338, 0, 1, 0.02352941, 1,
-0.3843932, -1.444472, -1.371564, 0, 1, 0.02745098, 1,
-0.3842001, 0.3037038, -2.203856, 0, 1, 0.03529412, 1,
-0.3837034, 0.02875602, -1.355875, 0, 1, 0.03921569, 1,
-0.3825585, 0.1310988, -1.884928, 0, 1, 0.04705882, 1,
-0.379015, 0.2393507, -1.403246, 0, 1, 0.05098039, 1,
-0.3732433, 0.7650738, -0.5253002, 0, 1, 0.05882353, 1,
-0.3697282, 0.1859487, -0.9056216, 0, 1, 0.0627451, 1,
-0.369321, 0.6687712, -0.3038371, 0, 1, 0.07058824, 1,
-0.3658676, -1.079765, -1.979978, 0, 1, 0.07450981, 1,
-0.3650413, 0.2763843, -1.415309, 0, 1, 0.08235294, 1,
-0.3650115, 1.257152, -1.869951, 0, 1, 0.08627451, 1,
-0.3617505, 1.503181, -1.567927, 0, 1, 0.09411765, 1,
-0.3600554, 0.3807822, -1.713135, 0, 1, 0.1019608, 1,
-0.3584266, 0.2397229, 0.6719254, 0, 1, 0.1058824, 1,
-0.3566754, -0.6667309, -3.145154, 0, 1, 0.1137255, 1,
-0.3557462, -0.3126994, -0.288477, 0, 1, 0.1176471, 1,
-0.3544589, -0.9852673, -3.699525, 0, 1, 0.1254902, 1,
-0.353761, 0.5517542, -1.566437, 0, 1, 0.1294118, 1,
-0.3534461, 0.1029158, -1.861018, 0, 1, 0.1372549, 1,
-0.3508996, -1.160312, -2.840773, 0, 1, 0.1411765, 1,
-0.3479854, 0.6871482, -1.196214, 0, 1, 0.1490196, 1,
-0.3462137, 0.9793177, -1.285801, 0, 1, 0.1529412, 1,
-0.3449861, 0.9627171, -0.5591184, 0, 1, 0.1607843, 1,
-0.3445709, 1.036544, 1.00141, 0, 1, 0.1647059, 1,
-0.3444997, 1.399769, 0.2924218, 0, 1, 0.172549, 1,
-0.3444103, 0.05620971, -3.047209, 0, 1, 0.1764706, 1,
-0.3413075, 0.3256068, -1.97956, 0, 1, 0.1843137, 1,
-0.3388952, 1.752236, 1.715614, 0, 1, 0.1882353, 1,
-0.3365598, 0.7700942, -1.234175, 0, 1, 0.1960784, 1,
-0.3361609, -1.228928, -2.569164, 0, 1, 0.2039216, 1,
-0.3340126, -0.2824878, -1.803847, 0, 1, 0.2078431, 1,
-0.3330167, -1.228326, -2.882624, 0, 1, 0.2156863, 1,
-0.3325606, 0.4360935, -0.8720428, 0, 1, 0.2196078, 1,
-0.3307208, 1.259148, -0.7970462, 0, 1, 0.227451, 1,
-0.3306806, 0.8601118, -0.53419, 0, 1, 0.2313726, 1,
-0.3296597, 0.62045, -0.5301932, 0, 1, 0.2392157, 1,
-0.3294671, 1.182562, -1.01467, 0, 1, 0.2431373, 1,
-0.3272233, -0.3202812, -3.640833, 0, 1, 0.2509804, 1,
-0.3268057, 1.409242, -0.1894625, 0, 1, 0.254902, 1,
-0.3246934, -1.088841, -3.254478, 0, 1, 0.2627451, 1,
-0.3207582, -1.785016, -3.605199, 0, 1, 0.2666667, 1,
-0.3196297, 1.421131, -0.4231818, 0, 1, 0.2745098, 1,
-0.3191217, 0.9421562, -0.4078112, 0, 1, 0.2784314, 1,
-0.318656, 1.168785, -1.126811, 0, 1, 0.2862745, 1,
-0.3182586, -0.8480232, -4.055434, 0, 1, 0.2901961, 1,
-0.3172906, 2.116695, 0.6689418, 0, 1, 0.2980392, 1,
-0.3120694, -0.4560269, -1.95414, 0, 1, 0.3058824, 1,
-0.3109653, 1.614803, -0.321219, 0, 1, 0.3098039, 1,
-0.3067194, 0.08887797, -0.4179224, 0, 1, 0.3176471, 1,
-0.3043007, -1.90128, -4.161204, 0, 1, 0.3215686, 1,
-0.3021602, 0.8437116, -0.9040724, 0, 1, 0.3294118, 1,
-0.3003174, 0.6931879, -1.852436, 0, 1, 0.3333333, 1,
-0.2965778, 0.02224679, -1.325208, 0, 1, 0.3411765, 1,
-0.2960435, 0.326663, -0.1372894, 0, 1, 0.345098, 1,
-0.287836, 0.8503889, -0.8392552, 0, 1, 0.3529412, 1,
-0.2865337, -0.8807796, -1.791199, 0, 1, 0.3568628, 1,
-0.2862143, 1.032761, -0.3326617, 0, 1, 0.3647059, 1,
-0.2856815, 0.6225538, 1.13116, 0, 1, 0.3686275, 1,
-0.2843908, 0.2166263, -3.942526, 0, 1, 0.3764706, 1,
-0.2824617, -0.3997267, -1.665418, 0, 1, 0.3803922, 1,
-0.2771529, -0.6146095, -2.648541, 0, 1, 0.3882353, 1,
-0.2768363, -1.644475, -4.59933, 0, 1, 0.3921569, 1,
-0.2760214, 0.09012607, -0.8058988, 0, 1, 0.4, 1,
-0.2720884, -0.2135051, -2.243595, 0, 1, 0.4078431, 1,
-0.264257, -1.605546, -3.306112, 0, 1, 0.4117647, 1,
-0.2630907, -0.1017103, -0.9631093, 0, 1, 0.4196078, 1,
-0.2629465, -0.61813, -5.153388, 0, 1, 0.4235294, 1,
-0.2602073, -1.587341, -1.928846, 0, 1, 0.4313726, 1,
-0.2596934, 1.830658, -0.4722957, 0, 1, 0.4352941, 1,
-0.2595972, 2.626995, -1.650706, 0, 1, 0.4431373, 1,
-0.2591347, -0.4287858, -2.068949, 0, 1, 0.4470588, 1,
-0.2572004, 0.8409614, -0.4320878, 0, 1, 0.454902, 1,
-0.2543764, -1.048795, -2.249877, 0, 1, 0.4588235, 1,
-0.2541613, 0.3816161, 0.1699558, 0, 1, 0.4666667, 1,
-0.2460667, -1.311606, -4.066328, 0, 1, 0.4705882, 1,
-0.2437652, -1.386383, -1.685893, 0, 1, 0.4784314, 1,
-0.2361679, -0.05899161, -2.229854, 0, 1, 0.4823529, 1,
-0.235802, 0.5301835, -1.140078, 0, 1, 0.4901961, 1,
-0.2315887, -1.209484, -4.052498, 0, 1, 0.4941176, 1,
-0.231277, -0.5720758, -2.006465, 0, 1, 0.5019608, 1,
-0.231207, -1.767409, -3.104082, 0, 1, 0.509804, 1,
-0.2307607, -0.655025, -2.42272, 0, 1, 0.5137255, 1,
-0.2273137, 1.0105, 0.06667468, 0, 1, 0.5215687, 1,
-0.2249745, 1.198437, 0.5724695, 0, 1, 0.5254902, 1,
-0.2192462, 0.7354029, -1.07347, 0, 1, 0.5333334, 1,
-0.2190406, 0.5409259, 0.4321452, 0, 1, 0.5372549, 1,
-0.2152462, -0.5331032, -3.403376, 0, 1, 0.5450981, 1,
-0.2090978, 0.4604569, -0.2330222, 0, 1, 0.5490196, 1,
-0.2064197, -0.3220922, -1.618434, 0, 1, 0.5568628, 1,
-0.1937038, 0.7022916, -0.5866292, 0, 1, 0.5607843, 1,
-0.1871936, -0.1764783, -1.921557, 0, 1, 0.5686275, 1,
-0.1848378, -0.06304629, -3.704395, 0, 1, 0.572549, 1,
-0.1821557, 1.67834, -0.325985, 0, 1, 0.5803922, 1,
-0.1816536, 1.056644, -0.4689834, 0, 1, 0.5843138, 1,
-0.1738154, 1.242717, -1.436043, 0, 1, 0.5921569, 1,
-0.1709722, -0.07487649, -2.086855, 0, 1, 0.5960785, 1,
-0.1697226, -0.4713046, -3.880648, 0, 1, 0.6039216, 1,
-0.1679923, 0.04824212, -2.382805, 0, 1, 0.6117647, 1,
-0.1657547, -0.6553962, -3.630544, 0, 1, 0.6156863, 1,
-0.1604937, -1.901103, -2.456374, 0, 1, 0.6235294, 1,
-0.1595169, -0.9753444, -2.502724, 0, 1, 0.627451, 1,
-0.1588755, -0.1105199, -3.059928, 0, 1, 0.6352941, 1,
-0.1568637, -0.5184184, -3.468462, 0, 1, 0.6392157, 1,
-0.1531992, -0.05613436, -1.711738, 0, 1, 0.6470588, 1,
-0.1505937, 0.6804667, 0.9455646, 0, 1, 0.6509804, 1,
-0.1479636, 0.5163457, -0.107293, 0, 1, 0.6588235, 1,
-0.1466716, 0.8408777, -0.0850966, 0, 1, 0.6627451, 1,
-0.1465672, -1.015175, -3.20099, 0, 1, 0.6705883, 1,
-0.1424669, -0.8057069, -1.587526, 0, 1, 0.6745098, 1,
-0.1397132, 1.373868, -0.6175029, 0, 1, 0.682353, 1,
-0.1358875, 0.7379944, -0.01927443, 0, 1, 0.6862745, 1,
-0.1351734, -0.2948468, -1.253461, 0, 1, 0.6941177, 1,
-0.1326746, 1.832049, 0.06647536, 0, 1, 0.7019608, 1,
-0.1312944, -0.8236102, -2.344091, 0, 1, 0.7058824, 1,
-0.1266166, -1.284727, -2.563032, 0, 1, 0.7137255, 1,
-0.1236917, -0.8273191, -1.871355, 0, 1, 0.7176471, 1,
-0.1225901, 0.8886918, -0.0549031, 0, 1, 0.7254902, 1,
-0.1180466, -0.09211268, -2.333773, 0, 1, 0.7294118, 1,
-0.1143761, -0.7379934, -4.393632, 0, 1, 0.7372549, 1,
-0.1122743, 0.2860943, 0.2188162, 0, 1, 0.7411765, 1,
-0.106797, 0.103703, 0.05136738, 0, 1, 0.7490196, 1,
-0.1034869, -0.1667779, -2.875103, 0, 1, 0.7529412, 1,
-0.0996187, 0.7517566, 0.6464927, 0, 1, 0.7607843, 1,
-0.09027099, 0.1656294, -1.013144, 0, 1, 0.7647059, 1,
-0.08637282, -1.352438, -3.379108, 0, 1, 0.772549, 1,
-0.08499001, -1.543519, -2.859338, 0, 1, 0.7764706, 1,
-0.08022888, 0.3873035, -0.8299189, 0, 1, 0.7843137, 1,
-0.07759665, 0.07694004, -0.9278773, 0, 1, 0.7882353, 1,
-0.07441913, 0.1498317, 1.0594, 0, 1, 0.7960784, 1,
-0.06975829, -2.702547, -2.637064, 0, 1, 0.8039216, 1,
-0.06851291, 0.5909177, 0.5152972, 0, 1, 0.8078431, 1,
-0.06733451, 0.2950378, -1.212945, 0, 1, 0.8156863, 1,
-0.06045159, 0.07090107, -1.023271, 0, 1, 0.8196079, 1,
-0.05517154, -0.3145812, -2.206506, 0, 1, 0.827451, 1,
-0.05311988, 0.09794184, -0.7920494, 0, 1, 0.8313726, 1,
-0.0522261, -0.4776581, -4.256682, 0, 1, 0.8392157, 1,
-0.04890094, -0.5250055, -1.420012, 0, 1, 0.8431373, 1,
-0.0451255, 0.07578637, -0.8145943, 0, 1, 0.8509804, 1,
-0.04308709, 0.08367594, -0.9288949, 0, 1, 0.854902, 1,
-0.03486179, 0.9619579, 0.1937235, 0, 1, 0.8627451, 1,
-0.02845619, 0.1872943, -0.7465982, 0, 1, 0.8666667, 1,
-0.0280103, -2.54408, -3.481533, 0, 1, 0.8745098, 1,
-0.02773071, 1.207365, 0.267705, 0, 1, 0.8784314, 1,
-0.02062189, -1.736902, -4.189888, 0, 1, 0.8862745, 1,
-0.01901023, 0.4875779, 1.373231, 0, 1, 0.8901961, 1,
-0.01704286, -0.5290342, -2.748965, 0, 1, 0.8980392, 1,
-0.01636848, -0.4270152, -3.020915, 0, 1, 0.9058824, 1,
-0.01595714, 0.2320742, 0.4153633, 0, 1, 0.9098039, 1,
-0.01241731, 0.8162925, 0.3282446, 0, 1, 0.9176471, 1,
-0.01221956, 0.9461653, 0.002370846, 0, 1, 0.9215686, 1,
-0.01170563, -1.41024, -3.600687, 0, 1, 0.9294118, 1,
-0.009551422, -0.02292735, -2.490514, 0, 1, 0.9333333, 1,
-0.009058639, -1.077213, -2.177199, 0, 1, 0.9411765, 1,
-0.008299951, 1.455775, -1.9981, 0, 1, 0.945098, 1,
-0.008082542, -1.329013, -4.922771, 0, 1, 0.9529412, 1,
-0.005726649, 0.2905291, 0.4974067, 0, 1, 0.9568627, 1,
-0.001561685, 0.9017618, 0.3411494, 0, 1, 0.9647059, 1,
0.003714036, -0.5140381, 2.424788, 0, 1, 0.9686275, 1,
0.00404306, 2.057376, -0.2595311, 0, 1, 0.9764706, 1,
0.008488304, 0.1799438, 0.6305853, 0, 1, 0.9803922, 1,
0.0125235, 1.638266, -0.4944293, 0, 1, 0.9882353, 1,
0.01475009, 0.7388723, 2.599985, 0, 1, 0.9921569, 1,
0.01480001, -1.883958, 2.737001, 0, 1, 1, 1,
0.01529758, 0.9198747, -0.5582647, 0, 0.9921569, 1, 1,
0.01658201, 0.7508548, 1.500473, 0, 0.9882353, 1, 1,
0.02768533, -1.035074, 2.701779, 0, 0.9803922, 1, 1,
0.02770746, 0.4160125, 0.01689292, 0, 0.9764706, 1, 1,
0.02934301, -0.1900621, 3.394179, 0, 0.9686275, 1, 1,
0.03656332, 0.2791275, -0.8014284, 0, 0.9647059, 1, 1,
0.03669173, 1.069439, 1.202587, 0, 0.9568627, 1, 1,
0.04001299, -0.3114099, 1.63098, 0, 0.9529412, 1, 1,
0.04477377, -0.3641044, 1.644287, 0, 0.945098, 1, 1,
0.05109272, -0.8951162, 3.602995, 0, 0.9411765, 1, 1,
0.05123432, 1.408649, 1.843066, 0, 0.9333333, 1, 1,
0.0563504, 0.06366207, 0.938437, 0, 0.9294118, 1, 1,
0.05679478, 2.530264, -0.3785869, 0, 0.9215686, 1, 1,
0.06462616, -1.043411, 2.579158, 0, 0.9176471, 1, 1,
0.06662586, -0.8363565, 3.832932, 0, 0.9098039, 1, 1,
0.07122137, -0.8054966, 3.293969, 0, 0.9058824, 1, 1,
0.07324808, 0.9470885, 2.159075, 0, 0.8980392, 1, 1,
0.07414251, -0.239549, 3.2346, 0, 0.8901961, 1, 1,
0.07493407, -0.7707786, 2.691292, 0, 0.8862745, 1, 1,
0.07547724, -0.1606104, 4.504466, 0, 0.8784314, 1, 1,
0.07933149, -0.9539148, 2.815308, 0, 0.8745098, 1, 1,
0.08029278, 1.482474, -2.466017, 0, 0.8666667, 1, 1,
0.08083449, 0.8962193, -0.3085332, 0, 0.8627451, 1, 1,
0.08178637, -0.2839865, 3.775773, 0, 0.854902, 1, 1,
0.08749249, 0.7858396, -0.4236864, 0, 0.8509804, 1, 1,
0.08892317, 2.094717, 0.8923941, 0, 0.8431373, 1, 1,
0.09000094, -0.7683703, 1.382251, 0, 0.8392157, 1, 1,
0.0959586, -0.1281547, 3.998305, 0, 0.8313726, 1, 1,
0.09815113, 1.608087, -0.6752865, 0, 0.827451, 1, 1,
0.09819882, -1.646752, 1.338931, 0, 0.8196079, 1, 1,
0.09865786, 1.179061, 0.2525558, 0, 0.8156863, 1, 1,
0.09914801, -0.02890128, 1.185432, 0, 0.8078431, 1, 1,
0.10267, -0.2984207, 3.292971, 0, 0.8039216, 1, 1,
0.1030651, -0.6669745, 3.247391, 0, 0.7960784, 1, 1,
0.1034186, 0.6104149, -1.077191, 0, 0.7882353, 1, 1,
0.1044082, -1.048988, 4.215002, 0, 0.7843137, 1, 1,
0.1068733, 1.117568, 0.2227554, 0, 0.7764706, 1, 1,
0.109728, -1.129296, 4.044088, 0, 0.772549, 1, 1,
0.1152547, 0.1824534, -0.1172759, 0, 0.7647059, 1, 1,
0.117582, 1.594902, -0.1294405, 0, 0.7607843, 1, 1,
0.1181962, -1.766205, 4.347031, 0, 0.7529412, 1, 1,
0.1183205, 1.44988, -0.9783853, 0, 0.7490196, 1, 1,
0.1204062, 0.6044471, 0.6867238, 0, 0.7411765, 1, 1,
0.1216603, 0.6504681, -0.8411788, 0, 0.7372549, 1, 1,
0.1288742, -0.4828604, 2.519679, 0, 0.7294118, 1, 1,
0.129643, 1.720955, -0.3242561, 0, 0.7254902, 1, 1,
0.1334442, 1.773278, -0.01101805, 0, 0.7176471, 1, 1,
0.1385995, 0.05565775, 0.4048758, 0, 0.7137255, 1, 1,
0.1394936, -0.7061679, 2.241336, 0, 0.7058824, 1, 1,
0.1401641, -0.922372, 2.71871, 0, 0.6980392, 1, 1,
0.1409233, -1.333498, 2.228598, 0, 0.6941177, 1, 1,
0.1455436, -2.534382, 2.53856, 0, 0.6862745, 1, 1,
0.1484368, 0.3895628, -0.6447906, 0, 0.682353, 1, 1,
0.149147, 0.6512795, -0.7508876, 0, 0.6745098, 1, 1,
0.1496474, -0.6688629, 3.414656, 0, 0.6705883, 1, 1,
0.1511097, -0.9526052, 1.515278, 0, 0.6627451, 1, 1,
0.1629482, -0.9871737, 3.691686, 0, 0.6588235, 1, 1,
0.1633792, 1.24535, 1.017613, 0, 0.6509804, 1, 1,
0.1652163, -1.732376, 4.713339, 0, 0.6470588, 1, 1,
0.1677081, 0.3986541, -0.6746236, 0, 0.6392157, 1, 1,
0.1709273, -0.8953205, 1.803665, 0, 0.6352941, 1, 1,
0.1723142, 0.1254204, -0.6506402, 0, 0.627451, 1, 1,
0.1731899, -0.3125123, 1.048216, 0, 0.6235294, 1, 1,
0.1739525, -2.024258, 3.725119, 0, 0.6156863, 1, 1,
0.1756297, -0.5594124, 1.641523, 0, 0.6117647, 1, 1,
0.1843586, -1.313329, 1.805906, 0, 0.6039216, 1, 1,
0.1846901, -0.2548984, 1.685413, 0, 0.5960785, 1, 1,
0.190125, -0.4023113, 2.16542, 0, 0.5921569, 1, 1,
0.1927963, 1.177984, 2.283476, 0, 0.5843138, 1, 1,
0.1941761, -1.093576, 2.687638, 0, 0.5803922, 1, 1,
0.1945188, -0.941808, 2.164233, 0, 0.572549, 1, 1,
0.1970187, -0.4179448, 2.895138, 0, 0.5686275, 1, 1,
0.2040538, 0.01834582, 2.360564, 0, 0.5607843, 1, 1,
0.2047614, -0.4361627, 1.701775, 0, 0.5568628, 1, 1,
0.2107301, -0.5629346, 1.695184, 0, 0.5490196, 1, 1,
0.2108835, 1.504431, 1.268427, 0, 0.5450981, 1, 1,
0.2133948, -0.3294057, 0.8629284, 0, 0.5372549, 1, 1,
0.2157109, 0.2009801, 2.130179, 0, 0.5333334, 1, 1,
0.2162928, 0.1989876, 0.4432946, 0, 0.5254902, 1, 1,
0.2185177, -1.056019, 3.961225, 0, 0.5215687, 1, 1,
0.2194692, 0.09337436, 0.8650428, 0, 0.5137255, 1, 1,
0.2205284, 2.047126, -0.746461, 0, 0.509804, 1, 1,
0.2225841, 1.451243, -1.193112, 0, 0.5019608, 1, 1,
0.2248425, -1.164559, 3.824025, 0, 0.4941176, 1, 1,
0.2257329, 0.8466582, 0.9516198, 0, 0.4901961, 1, 1,
0.2268652, -1.100152, 1.535499, 0, 0.4823529, 1, 1,
0.2299176, -0.05468487, 2.900531, 0, 0.4784314, 1, 1,
0.2303934, 0.1925299, 1.437526, 0, 0.4705882, 1, 1,
0.2389468, -1.332262, 3.144235, 0, 0.4666667, 1, 1,
0.2404261, 0.7068983, 1.299467, 0, 0.4588235, 1, 1,
0.2420428, 1.696968, 0.6562138, 0, 0.454902, 1, 1,
0.2421589, 0.001963379, -0.1041206, 0, 0.4470588, 1, 1,
0.2446557, 1.180898, -0.7376712, 0, 0.4431373, 1, 1,
0.2459862, -1.400282, 2.081688, 0, 0.4352941, 1, 1,
0.2460342, 0.0127403, -0.1533173, 0, 0.4313726, 1, 1,
0.2513963, -0.2149093, 3.548887, 0, 0.4235294, 1, 1,
0.2514105, 0.4315286, 1.007797, 0, 0.4196078, 1, 1,
0.2525334, -0.6416754, 3.236338, 0, 0.4117647, 1, 1,
0.2527775, -0.496438, 1.540639, 0, 0.4078431, 1, 1,
0.2546007, -0.7807366, 2.856497, 0, 0.4, 1, 1,
0.2571425, 1.31249, 0.8498152, 0, 0.3921569, 1, 1,
0.2580228, -0.3439671, 3.195642, 0, 0.3882353, 1, 1,
0.2585136, -0.3527139, 2.907706, 0, 0.3803922, 1, 1,
0.2641995, 0.7955539, 1.173223, 0, 0.3764706, 1, 1,
0.2643799, 0.2260219, -0.6312857, 0, 0.3686275, 1, 1,
0.2657881, 0.814767, -0.2569956, 0, 0.3647059, 1, 1,
0.2726316, 0.6150707, 1.330126, 0, 0.3568628, 1, 1,
0.2775793, 0.3574451, 1.61438, 0, 0.3529412, 1, 1,
0.2794628, 1.141152, 0.9266362, 0, 0.345098, 1, 1,
0.2878505, -2.038005, 1.566936, 0, 0.3411765, 1, 1,
0.2925125, -0.5037529, 3.639215, 0, 0.3333333, 1, 1,
0.2937859, 0.8970317, 0.6035916, 0, 0.3294118, 1, 1,
0.2943821, -0.8242377, 3.482659, 0, 0.3215686, 1, 1,
0.3004235, 0.06812368, 1.201276, 0, 0.3176471, 1, 1,
0.3016516, 0.6793142, 1.237843, 0, 0.3098039, 1, 1,
0.3042891, 0.2955773, 1.52914, 0, 0.3058824, 1, 1,
0.3103721, -0.2980424, 4.49309, 0, 0.2980392, 1, 1,
0.3120962, 0.7090251, -0.7020753, 0, 0.2901961, 1, 1,
0.3123866, -0.5203886, 1.242427, 0, 0.2862745, 1, 1,
0.3155901, 0.3624627, 0.557961, 0, 0.2784314, 1, 1,
0.3257473, 0.4902644, 1.812835, 0, 0.2745098, 1, 1,
0.3264485, 0.04089326, 0.7681391, 0, 0.2666667, 1, 1,
0.3290536, 0.5881446, 0.791314, 0, 0.2627451, 1, 1,
0.3314083, -1.491768, 2.303526, 0, 0.254902, 1, 1,
0.3315747, -0.8657523, 3.223451, 0, 0.2509804, 1, 1,
0.3327742, -0.01077502, 3.654235, 0, 0.2431373, 1, 1,
0.3338254, 0.4939825, 1.899652, 0, 0.2392157, 1, 1,
0.3346291, 1.074718, -1.704922, 0, 0.2313726, 1, 1,
0.3347251, -1.181867, 3.70332, 0, 0.227451, 1, 1,
0.3373523, 0.05726999, 0.862919, 0, 0.2196078, 1, 1,
0.343844, -0.2247753, 2.735715, 0, 0.2156863, 1, 1,
0.3446909, -1.07915, 3.546748, 0, 0.2078431, 1, 1,
0.3447975, -0.5405335, 2.051182, 0, 0.2039216, 1, 1,
0.3459128, 1.882642, 0.3940397, 0, 0.1960784, 1, 1,
0.3483596, 0.2374588, 0.5800583, 0, 0.1882353, 1, 1,
0.3498784, -0.4050176, 1.285802, 0, 0.1843137, 1, 1,
0.354605, 0.821554, 0.2809895, 0, 0.1764706, 1, 1,
0.3548062, -0.266574, 1.647033, 0, 0.172549, 1, 1,
0.3548295, -1.391651, 3.80133, 0, 0.1647059, 1, 1,
0.3569352, -1.203854, 2.165002, 0, 0.1607843, 1, 1,
0.3581818, -0.1719971, 2.18374, 0, 0.1529412, 1, 1,
0.3584929, -0.395173, -0.3407594, 0, 0.1490196, 1, 1,
0.3634847, 1.80438, -0.2457534, 0, 0.1411765, 1, 1,
0.3693134, 0.0136344, 2.398618, 0, 0.1372549, 1, 1,
0.3695144, -0.1584504, 2.079859, 0, 0.1294118, 1, 1,
0.3749044, 1.332454, 1.045607, 0, 0.1254902, 1, 1,
0.3796559, 1.365298, 0.3514779, 0, 0.1176471, 1, 1,
0.3809647, 0.2315071, -0.02293616, 0, 0.1137255, 1, 1,
0.3836246, 0.5685825, -1.460021, 0, 0.1058824, 1, 1,
0.3878867, 0.5077908, 0.8733296, 0, 0.09803922, 1, 1,
0.3879268, 0.8638948, 0.08753004, 0, 0.09411765, 1, 1,
0.3902141, 1.673454, -0.5509708, 0, 0.08627451, 1, 1,
0.3920071, 0.9399965, -0.7097245, 0, 0.08235294, 1, 1,
0.3962983, -0.4092594, 1.414978, 0, 0.07450981, 1, 1,
0.3998517, 0.760444, 0.8904404, 0, 0.07058824, 1, 1,
0.4002806, 1.099364, 1.18839, 0, 0.0627451, 1, 1,
0.40154, -0.06681524, 0.3443822, 0, 0.05882353, 1, 1,
0.4015462, -0.0571436, 2.043617, 0, 0.05098039, 1, 1,
0.4015572, 0.8030932, 2.711691, 0, 0.04705882, 1, 1,
0.4094293, 0.4086313, 0.6550661, 0, 0.03921569, 1, 1,
0.4116564, 1.036917, 0.6708509, 0, 0.03529412, 1, 1,
0.4125805, -0.9914289, 2.9235, 0, 0.02745098, 1, 1,
0.4179889, -0.3009052, 2.730866, 0, 0.02352941, 1, 1,
0.4221284, -0.04886043, 3.584745, 0, 0.01568628, 1, 1,
0.4239127, 0.2476551, 1.308905, 0, 0.01176471, 1, 1,
0.4296851, -0.4737639, 2.122049, 0, 0.003921569, 1, 1,
0.4312955, 0.1207937, 1.3832, 0.003921569, 0, 1, 1,
0.4357131, -0.6833306, 2.029852, 0.007843138, 0, 1, 1,
0.4363038, 0.6138543, 0.1636614, 0.01568628, 0, 1, 1,
0.438976, -0.4668559, 2.159472, 0.01960784, 0, 1, 1,
0.4491614, -1.260472, 2.502794, 0.02745098, 0, 1, 1,
0.4523951, 0.1273922, 0.4949328, 0.03137255, 0, 1, 1,
0.4525727, -1.486712, 1.743408, 0.03921569, 0, 1, 1,
0.4583609, -0.3654982, 1.783893, 0.04313726, 0, 1, 1,
0.4669999, -0.1792451, 2.039811, 0.05098039, 0, 1, 1,
0.4714112, -0.9883218, 3.188636, 0.05490196, 0, 1, 1,
0.4734986, 0.434092, 0.8889678, 0.0627451, 0, 1, 1,
0.4744634, 0.08783047, 1.497132, 0.06666667, 0, 1, 1,
0.4780273, 1.152722, 0.7955321, 0.07450981, 0, 1, 1,
0.4857087, 0.791477, 1.079232, 0.07843138, 0, 1, 1,
0.4882239, -0.6065795, 3.000926, 0.08627451, 0, 1, 1,
0.4906496, 0.6113737, -0.2195422, 0.09019608, 0, 1, 1,
0.4982835, 1.394121, 1.397032, 0.09803922, 0, 1, 1,
0.4986794, -0.1024457, 2.276386, 0.1058824, 0, 1, 1,
0.500139, -0.3467624, 1.89922, 0.1098039, 0, 1, 1,
0.5003671, 1.71126, 0.6873788, 0.1176471, 0, 1, 1,
0.5059563, 0.9547412, -0.2709334, 0.1215686, 0, 1, 1,
0.5082108, 0.6287231, 0.1949047, 0.1294118, 0, 1, 1,
0.5097374, -0.8368474, 3.281257, 0.1333333, 0, 1, 1,
0.5110385, -0.05360245, 2.3989, 0.1411765, 0, 1, 1,
0.5185068, -2.09048, 4.509161, 0.145098, 0, 1, 1,
0.5188352, 0.0448212, 2.800287, 0.1529412, 0, 1, 1,
0.5193572, -0.7388397, 2.517656, 0.1568628, 0, 1, 1,
0.5194274, 0.1821068, 0.5219361, 0.1647059, 0, 1, 1,
0.5202709, 0.4561018, 0.5898826, 0.1686275, 0, 1, 1,
0.5211042, -0.5124878, 4.338076, 0.1764706, 0, 1, 1,
0.5248204, -1.465848, 2.314039, 0.1803922, 0, 1, 1,
0.5255764, 0.7698718, -0.1962059, 0.1882353, 0, 1, 1,
0.52683, -0.1446833, 3.370354, 0.1921569, 0, 1, 1,
0.5272818, -0.01057717, 0.572293, 0.2, 0, 1, 1,
0.5326716, 0.7480057, 1.3945, 0.2078431, 0, 1, 1,
0.535355, 0.7651075, 1.110243, 0.2117647, 0, 1, 1,
0.5356571, 0.6354431, -0.1708833, 0.2196078, 0, 1, 1,
0.5377249, 0.7157695, -0.4844311, 0.2235294, 0, 1, 1,
0.5423557, 0.07262493, 1.671333, 0.2313726, 0, 1, 1,
0.5426005, 1.251558, 2.49174, 0.2352941, 0, 1, 1,
0.5460857, 0.5196339, 0.08949146, 0.2431373, 0, 1, 1,
0.546796, 0.6825101, 0.1676154, 0.2470588, 0, 1, 1,
0.5488939, -1.061501, 3.052775, 0.254902, 0, 1, 1,
0.5491905, 0.496978, 1.475546, 0.2588235, 0, 1, 1,
0.5553102, -0.3436585, 0.7166539, 0.2666667, 0, 1, 1,
0.556273, -1.095628, 3.323433, 0.2705882, 0, 1, 1,
0.5572723, -0.57121, 0.7917821, 0.2784314, 0, 1, 1,
0.5593266, -0.1760356, 2.243423, 0.282353, 0, 1, 1,
0.5646334, 0.9723019, -1.740959, 0.2901961, 0, 1, 1,
0.5662093, -0.1718909, 2.371232, 0.2941177, 0, 1, 1,
0.5681447, -1.465533, 1.573847, 0.3019608, 0, 1, 1,
0.569618, -1.333621, 3.542612, 0.3098039, 0, 1, 1,
0.5725533, -0.5293808, 3.731858, 0.3137255, 0, 1, 1,
0.5732768, 0.7022951, 0.2685115, 0.3215686, 0, 1, 1,
0.5733839, -0.1050592, 1.870733, 0.3254902, 0, 1, 1,
0.5745079, -0.4551937, 3.100545, 0.3333333, 0, 1, 1,
0.5768728, -1.038112, 2.934066, 0.3372549, 0, 1, 1,
0.5828393, 0.2077614, 1.211593, 0.345098, 0, 1, 1,
0.5853783, 0.3429614, 0.2910919, 0.3490196, 0, 1, 1,
0.5859649, -0.07635571, 2.620086, 0.3568628, 0, 1, 1,
0.5868217, -0.09243411, 0.7992002, 0.3607843, 0, 1, 1,
0.5892268, -0.1897022, 1.276845, 0.3686275, 0, 1, 1,
0.5946031, -0.1329086, 1.15531, 0.372549, 0, 1, 1,
0.5964502, -0.8950831, 4.239793, 0.3803922, 0, 1, 1,
0.5990712, 0.3353778, 1.308855, 0.3843137, 0, 1, 1,
0.6037146, 0.9318566, 0.645576, 0.3921569, 0, 1, 1,
0.6110449, -0.08930595, 3.597596, 0.3960784, 0, 1, 1,
0.6116989, -0.7095076, -0.05656208, 0.4039216, 0, 1, 1,
0.6140047, -0.01664741, 3.201322, 0.4117647, 0, 1, 1,
0.6141926, -0.8378625, 2.552866, 0.4156863, 0, 1, 1,
0.615375, -0.1198922, 1.700232, 0.4235294, 0, 1, 1,
0.6156946, -0.4897141, 1.026746, 0.427451, 0, 1, 1,
0.615802, -0.6002677, 1.639521, 0.4352941, 0, 1, 1,
0.6175987, -0.5765296, 1.547462, 0.4392157, 0, 1, 1,
0.6178887, 1.756413, 0.6485828, 0.4470588, 0, 1, 1,
0.6185477, -0.02438639, 2.835659, 0.4509804, 0, 1, 1,
0.6289171, 0.004823144, 0.796732, 0.4588235, 0, 1, 1,
0.6337108, -0.9957261, 3.936063, 0.4627451, 0, 1, 1,
0.6350565, -0.3792039, 2.285139, 0.4705882, 0, 1, 1,
0.6440685, -1.227027, 3.395524, 0.4745098, 0, 1, 1,
0.6470564, -0.3144013, 1.015054, 0.4823529, 0, 1, 1,
0.6538278, 0.3791318, 2.104576, 0.4862745, 0, 1, 1,
0.6583219, -0.4413654, 1.606583, 0.4941176, 0, 1, 1,
0.6592335, 0.9100042, 0.94209, 0.5019608, 0, 1, 1,
0.6605398, -1.718793, 1.809104, 0.5058824, 0, 1, 1,
0.6652637, 0.6719775, 0.4104032, 0.5137255, 0, 1, 1,
0.6667966, 0.2738656, -0.1148432, 0.5176471, 0, 1, 1,
0.6723221, 0.5846658, 2.469005, 0.5254902, 0, 1, 1,
0.6727073, 1.948349, 0.8569729, 0.5294118, 0, 1, 1,
0.6732717, -0.3329846, 3.515695, 0.5372549, 0, 1, 1,
0.6789016, -0.5424857, 0.1287251, 0.5411765, 0, 1, 1,
0.6826714, 1.65135, -0.4622286, 0.5490196, 0, 1, 1,
0.6846044, -0.9059645, 1.159419, 0.5529412, 0, 1, 1,
0.6940016, -0.6301321, 0.3566109, 0.5607843, 0, 1, 1,
0.6964911, 0.6624519, 2.831578, 0.5647059, 0, 1, 1,
0.7007759, -2.043865, 1.903623, 0.572549, 0, 1, 1,
0.7067473, -2.449582, 1.20807, 0.5764706, 0, 1, 1,
0.7086899, 0.2971389, 1.596121, 0.5843138, 0, 1, 1,
0.7139059, 0.1404458, -0.3312174, 0.5882353, 0, 1, 1,
0.7159411, -1.341996, 1.544727, 0.5960785, 0, 1, 1,
0.7172452, -0.4947639, 1.328286, 0.6039216, 0, 1, 1,
0.7174852, -0.1184067, 2.497893, 0.6078432, 0, 1, 1,
0.7233906, -1.572978, 1.961287, 0.6156863, 0, 1, 1,
0.7244643, -0.7682606, 1.341483, 0.6196079, 0, 1, 1,
0.7283803, 0.03094355, 2.260368, 0.627451, 0, 1, 1,
0.7321163, -1.635967, 4.263465, 0.6313726, 0, 1, 1,
0.73589, 0.3831298, 1.58321, 0.6392157, 0, 1, 1,
0.7362811, 1.07905, 1.935601, 0.6431373, 0, 1, 1,
0.7384822, 0.4485086, -1.210758, 0.6509804, 0, 1, 1,
0.749015, 1.409465, 0.8925312, 0.654902, 0, 1, 1,
0.7553117, 1.300988, 0.6832735, 0.6627451, 0, 1, 1,
0.757618, 1.35664, -0.09314936, 0.6666667, 0, 1, 1,
0.7601175, 0.1567351, 0.8756009, 0.6745098, 0, 1, 1,
0.7693512, -0.0487312, 2.610638, 0.6784314, 0, 1, 1,
0.7716081, -0.5377927, 2.566135, 0.6862745, 0, 1, 1,
0.7726309, -0.5939741, 1.586642, 0.6901961, 0, 1, 1,
0.7760301, -0.841689, 3.517359, 0.6980392, 0, 1, 1,
0.783369, 0.06206378, 1.272403, 0.7058824, 0, 1, 1,
0.7931589, -0.08004948, 1.485212, 0.7098039, 0, 1, 1,
0.7931938, -0.802034, 1.99122, 0.7176471, 0, 1, 1,
0.7934158, -0.1548717, 1.932794, 0.7215686, 0, 1, 1,
0.7936555, 1.068748, 0.6101384, 0.7294118, 0, 1, 1,
0.7944849, -0.3303659, 2.812573, 0.7333333, 0, 1, 1,
0.7974902, 0.4343205, 2.252656, 0.7411765, 0, 1, 1,
0.7981556, -0.3848368, 1.232695, 0.7450981, 0, 1, 1,
0.798798, -1.106725, 0.5397238, 0.7529412, 0, 1, 1,
0.8021585, 0.2102437, 0.04387811, 0.7568628, 0, 1, 1,
0.8058742, -1.432115, 2.637631, 0.7647059, 0, 1, 1,
0.8080869, 0.04946015, 1.785592, 0.7686275, 0, 1, 1,
0.8099276, 1.002548, 1.503343, 0.7764706, 0, 1, 1,
0.8147644, -0.4433599, 2.727265, 0.7803922, 0, 1, 1,
0.8166478, -1.387272, 2.801531, 0.7882353, 0, 1, 1,
0.8180042, 0.04990765, 2.888055, 0.7921569, 0, 1, 1,
0.8231122, 0.4695545, -0.1330124, 0.8, 0, 1, 1,
0.8244081, -0.1814711, -0.8190312, 0.8078431, 0, 1, 1,
0.8252079, -0.9743649, 2.837849, 0.8117647, 0, 1, 1,
0.829259, -0.9687438, 1.125606, 0.8196079, 0, 1, 1,
0.8308803, -0.7314733, 3.02896, 0.8235294, 0, 1, 1,
0.8329371, 1.53484, -0.1570033, 0.8313726, 0, 1, 1,
0.8370541, -0.4521504, 2.190644, 0.8352941, 0, 1, 1,
0.840201, -0.551189, 1.890445, 0.8431373, 0, 1, 1,
0.8406954, -2.048736, 3.946256, 0.8470588, 0, 1, 1,
0.8407744, 1.573179, -0.5018962, 0.854902, 0, 1, 1,
0.8501412, 2.320754, -0.4518136, 0.8588235, 0, 1, 1,
0.8507566, 0.4525493, 1.666603, 0.8666667, 0, 1, 1,
0.8508619, 0.527377, 0.1011046, 0.8705882, 0, 1, 1,
0.8516487, -0.2748853, 1.87228, 0.8784314, 0, 1, 1,
0.8575385, 0.7331582, -0.3738914, 0.8823529, 0, 1, 1,
0.8580799, 0.4605103, 0.07512885, 0.8901961, 0, 1, 1,
0.863864, 0.7425724, 1.098738, 0.8941177, 0, 1, 1,
0.8641179, 0.6222499, 1.273334, 0.9019608, 0, 1, 1,
0.8653836, -1.090519, 3.789382, 0.9098039, 0, 1, 1,
0.8689045, 0.7134332, 3.099379, 0.9137255, 0, 1, 1,
0.871778, 0.3810725, -0.2752836, 0.9215686, 0, 1, 1,
0.8773343, 0.9530883, 0.6067643, 0.9254902, 0, 1, 1,
0.8780618, 1.352261, 1.566557, 0.9333333, 0, 1, 1,
0.8787909, -0.2328121, 2.757852, 0.9372549, 0, 1, 1,
0.8822869, -0.6563115, 1.944568, 0.945098, 0, 1, 1,
0.8839685, -0.8796237, 1.886995, 0.9490196, 0, 1, 1,
0.8979488, -1.779526, 2.080747, 0.9568627, 0, 1, 1,
0.8992812, -0.7731742, 2.394587, 0.9607843, 0, 1, 1,
0.9007961, -2.591431, 4.070058, 0.9686275, 0, 1, 1,
0.905205, -1.613939, 2.59246, 0.972549, 0, 1, 1,
0.9086558, -0.4196344, 1.073276, 0.9803922, 0, 1, 1,
0.9133161, 1.859884, -1.216007, 0.9843137, 0, 1, 1,
0.9153765, 0.9588503, 0.1514118, 0.9921569, 0, 1, 1,
0.9184574, 0.725086, 1.181336, 0.9960784, 0, 1, 1,
0.9191825, 0.3421565, 1.940656, 1, 0, 0.9960784, 1,
0.9206815, 0.385236, 1.577836, 1, 0, 0.9882353, 1,
0.9214971, 2.525256, 1.438356, 1, 0, 0.9843137, 1,
0.9241587, 0.1993067, 1.517383, 1, 0, 0.9764706, 1,
0.9279272, -0.2738929, 1.636763, 1, 0, 0.972549, 1,
0.928894, 0.01969583, 0.7536303, 1, 0, 0.9647059, 1,
0.9432173, 0.1401359, 0.5489684, 1, 0, 0.9607843, 1,
0.9564126, -0.7044805, 0.9612756, 1, 0, 0.9529412, 1,
0.9577045, -0.1749068, 1.305047, 1, 0, 0.9490196, 1,
0.9589975, -1.135473, 4.334941, 1, 0, 0.9411765, 1,
0.9597429, -0.4759629, 1.239711, 1, 0, 0.9372549, 1,
0.9622371, -0.7612306, 1.422174, 1, 0, 0.9294118, 1,
0.963578, -0.5328544, 2.772737, 1, 0, 0.9254902, 1,
0.9712113, -0.512006, 3.404577, 1, 0, 0.9176471, 1,
0.9793411, 0.5250847, 0.07029352, 1, 0, 0.9137255, 1,
0.9844899, 1.10759, 0.6456012, 1, 0, 0.9058824, 1,
0.9885218, 1.238933, 1.283152, 1, 0, 0.9019608, 1,
0.9954396, -0.2150689, -0.02332029, 1, 0, 0.8941177, 1,
0.9983094, 0.7948323, 1.217832, 1, 0, 0.8862745, 1,
1.000788, -1.257476, 2.260326, 1, 0, 0.8823529, 1,
1.001391, 2.098774, -0.2308818, 1, 0, 0.8745098, 1,
1.004516, 0.6966598, 1.159875, 1, 0, 0.8705882, 1,
1.005708, 0.6384181, 0.224204, 1, 0, 0.8627451, 1,
1.013359, -0.8079118, 1.79151, 1, 0, 0.8588235, 1,
1.014838, 0.3946321, 0.7749423, 1, 0, 0.8509804, 1,
1.030332, -0.5849634, 2.071355, 1, 0, 0.8470588, 1,
1.03428, -1.102091, 1.468395, 1, 0, 0.8392157, 1,
1.045473, 1.460303, 0.2095633, 1, 0, 0.8352941, 1,
1.056666, 0.2684363, 3.038228, 1, 0, 0.827451, 1,
1.067218, 0.2264008, 2.628374, 1, 0, 0.8235294, 1,
1.067723, -0.6412316, 2.303076, 1, 0, 0.8156863, 1,
1.071313, -0.531452, 1.97713, 1, 0, 0.8117647, 1,
1.078365, -0.01685553, 2.249315, 1, 0, 0.8039216, 1,
1.080651, 0.1109434, 2.580857, 1, 0, 0.7960784, 1,
1.082943, 1.152315, 1.698936, 1, 0, 0.7921569, 1,
1.084567, 1.155612, 1.09446, 1, 0, 0.7843137, 1,
1.09454, 1.054677, 0.1953691, 1, 0, 0.7803922, 1,
1.099951, -0.08080552, 2.746377, 1, 0, 0.772549, 1,
1.10334, -0.5667562, 3.070358, 1, 0, 0.7686275, 1,
1.111019, 1.490301, 0.9082435, 1, 0, 0.7607843, 1,
1.121115, -0.2524965, 1.15916, 1, 0, 0.7568628, 1,
1.12557, 0.3257818, -0.3349281, 1, 0, 0.7490196, 1,
1.13355, 0.3893372, 0.6164001, 1, 0, 0.7450981, 1,
1.13496, -1.126829, 3.117535, 1, 0, 0.7372549, 1,
1.146171, -0.1905839, 1.258987, 1, 0, 0.7333333, 1,
1.15566, 0.565142, 0.8273986, 1, 0, 0.7254902, 1,
1.156093, -1.76884, 4.021691, 1, 0, 0.7215686, 1,
1.163347, -0.325101, 4.037028, 1, 0, 0.7137255, 1,
1.17343, -0.4662612, 3.157021, 1, 0, 0.7098039, 1,
1.173951, -0.244299, 0.8592977, 1, 0, 0.7019608, 1,
1.180999, 0.04947674, 1.107167, 1, 0, 0.6941177, 1,
1.184732, -2.0936, 1.230724, 1, 0, 0.6901961, 1,
1.19199, 0.7687023, 0.409159, 1, 0, 0.682353, 1,
1.196839, 0.6067533, 0.2275021, 1, 0, 0.6784314, 1,
1.215501, -0.7041758, 1.438102, 1, 0, 0.6705883, 1,
1.218042, 0.8386283, 1.573734, 1, 0, 0.6666667, 1,
1.218564, -0.140795, 0.8672152, 1, 0, 0.6588235, 1,
1.229086, -1.239601, 3.015004, 1, 0, 0.654902, 1,
1.235856, 1.108618, 1.057266, 1, 0, 0.6470588, 1,
1.239992, 1.188799, 0.8742769, 1, 0, 0.6431373, 1,
1.240453, 0.5703212, 1.768018, 1, 0, 0.6352941, 1,
1.240532, -0.1429439, 0.9514004, 1, 0, 0.6313726, 1,
1.242123, -0.06539596, 1.729214, 1, 0, 0.6235294, 1,
1.247334, 0.1282009, 0.7268846, 1, 0, 0.6196079, 1,
1.25354, -0.07349363, 1.176427, 1, 0, 0.6117647, 1,
1.256016, 1.633658, 1.3375, 1, 0, 0.6078432, 1,
1.257647, -0.200636, 2.539887, 1, 0, 0.6, 1,
1.261114, -2.226178, 1.868825, 1, 0, 0.5921569, 1,
1.266627, 0.9673397, 1.299697, 1, 0, 0.5882353, 1,
1.270562, -1.315855, 1.23417, 1, 0, 0.5803922, 1,
1.280746, 1.790704, 0.4853067, 1, 0, 0.5764706, 1,
1.285088, -1.062123, 1.978796, 1, 0, 0.5686275, 1,
1.2918, 1.326484, 2.354839, 1, 0, 0.5647059, 1,
1.297801, -1.163019, 2.232576, 1, 0, 0.5568628, 1,
1.30944, -1.322975, 2.346932, 1, 0, 0.5529412, 1,
1.311193, -0.2080161, 1.283067, 1, 0, 0.5450981, 1,
1.325831, -0.8866179, 2.073939, 1, 0, 0.5411765, 1,
1.327608, -1.477668, 3.482661, 1, 0, 0.5333334, 1,
1.340592, 1.078791, -1.016834, 1, 0, 0.5294118, 1,
1.357131, -0.3741906, 4.434286, 1, 0, 0.5215687, 1,
1.364467, -0.973798, 3.266114, 1, 0, 0.5176471, 1,
1.369677, -1.380998, 2.325275, 1, 0, 0.509804, 1,
1.374454, 1.246992, 0.3252294, 1, 0, 0.5058824, 1,
1.405042, -1.069276, 2.371531, 1, 0, 0.4980392, 1,
1.405695, -0.7122216, 2.563251, 1, 0, 0.4901961, 1,
1.40972, 0.3878634, 0.6494779, 1, 0, 0.4862745, 1,
1.417282, 0.8470708, -0.373612, 1, 0, 0.4784314, 1,
1.428073, 0.2563824, 3.128683, 1, 0, 0.4745098, 1,
1.43064, 1.118066, 0.4497936, 1, 0, 0.4666667, 1,
1.439795, -0.3477869, 2.785847, 1, 0, 0.4627451, 1,
1.447976, -0.5192115, 2.877375, 1, 0, 0.454902, 1,
1.451872, 0.9726995, -1.209054, 1, 0, 0.4509804, 1,
1.454721, -0.8593485, 3.801232, 1, 0, 0.4431373, 1,
1.457298, -0.1605505, 2.167039, 1, 0, 0.4392157, 1,
1.462901, -0.01739592, 1.638619, 1, 0, 0.4313726, 1,
1.476287, -0.01309113, -0.4138892, 1, 0, 0.427451, 1,
1.476808, -0.03909197, 3.213944, 1, 0, 0.4196078, 1,
1.480828, -1.488941, 3.025493, 1, 0, 0.4156863, 1,
1.484543, 0.4764264, 0.7172299, 1, 0, 0.4078431, 1,
1.530789, -0.3676299, 2.743611, 1, 0, 0.4039216, 1,
1.538167, 0.2188866, 0.351623, 1, 0, 0.3960784, 1,
1.53894, 0.05786538, 0.9449891, 1, 0, 0.3882353, 1,
1.544814, -0.3159355, 1.784299, 1, 0, 0.3843137, 1,
1.580495, -0.7530831, 3.878817, 1, 0, 0.3764706, 1,
1.593697, 0.01298242, 1.447763, 1, 0, 0.372549, 1,
1.623735, -0.111473, 0.7323065, 1, 0, 0.3647059, 1,
1.633377, 0.4325392, 2.34824, 1, 0, 0.3607843, 1,
1.641161, -0.1550744, -1.18641, 1, 0, 0.3529412, 1,
1.64237, -0.1503435, 2.160627, 1, 0, 0.3490196, 1,
1.64846, 1.465349, 1.535083, 1, 0, 0.3411765, 1,
1.665135, 0.1471871, 2.527093, 1, 0, 0.3372549, 1,
1.668398, -1.184874, 2.608713, 1, 0, 0.3294118, 1,
1.683087, -0.1654707, 2.709844, 1, 0, 0.3254902, 1,
1.683604, -0.09129748, 1.384627, 1, 0, 0.3176471, 1,
1.69709, -0.2549075, 1.714686, 1, 0, 0.3137255, 1,
1.7149, 0.08292967, 2.680772, 1, 0, 0.3058824, 1,
1.723012, 0.06201712, 0.549727, 1, 0, 0.2980392, 1,
1.72376, 0.1240585, 0.4331959, 1, 0, 0.2941177, 1,
1.738654, -0.02653848, -0.1654358, 1, 0, 0.2862745, 1,
1.739019, -1.604145, 1.994254, 1, 0, 0.282353, 1,
1.753129, -0.9390981, 1.805504, 1, 0, 0.2745098, 1,
1.76748, -1.484043, 3.645112, 1, 0, 0.2705882, 1,
1.768076, -0.6292369, 3.343078, 1, 0, 0.2627451, 1,
1.768117, 0.07821597, 2.485164, 1, 0, 0.2588235, 1,
1.779682, -0.6210576, 1.836204, 1, 0, 0.2509804, 1,
1.786357, 1.397051, 2.014537, 1, 0, 0.2470588, 1,
1.844514, 0.6581103, 0.5788805, 1, 0, 0.2392157, 1,
1.864591, 0.03989929, 2.612201, 1, 0, 0.2352941, 1,
1.86878, 0.1042429, 0.04411908, 1, 0, 0.227451, 1,
1.872958, -1.402653, 0.2148058, 1, 0, 0.2235294, 1,
1.906025, -1.092499, 1.902776, 1, 0, 0.2156863, 1,
1.907701, -2.14195, 2.280808, 1, 0, 0.2117647, 1,
1.931008, -1.606799, 2.82592, 1, 0, 0.2039216, 1,
1.934257, 1.303968, 0.1957911, 1, 0, 0.1960784, 1,
1.962934, -0.07982266, 1.991739, 1, 0, 0.1921569, 1,
1.972869, -0.04073929, 3.540725, 1, 0, 0.1843137, 1,
1.978356, 0.6684401, 2.148156, 1, 0, 0.1803922, 1,
1.984325, -0.8457531, 1.912967, 1, 0, 0.172549, 1,
1.999941, -1.529089, 4.415, 1, 0, 0.1686275, 1,
2.000235, 0.6420665, 1.765815, 1, 0, 0.1607843, 1,
2.008542, -0.0381756, 1.274926, 1, 0, 0.1568628, 1,
2.013062, 0.9135137, 3.393971, 1, 0, 0.1490196, 1,
2.022592, 0.02709944, 2.3409, 1, 0, 0.145098, 1,
2.040398, -0.8001736, 1.400806, 1, 0, 0.1372549, 1,
2.065279, 0.7431079, 0.4308839, 1, 0, 0.1333333, 1,
2.088212, 1.820494, 0.8468865, 1, 0, 0.1254902, 1,
2.104285, 0.7092766, 1.164028, 1, 0, 0.1215686, 1,
2.104689, -0.09759039, -0.5340186, 1, 0, 0.1137255, 1,
2.114684, 0.6607971, 2.558503, 1, 0, 0.1098039, 1,
2.128979, 2.692878, -0.3989435, 1, 0, 0.1019608, 1,
2.130476, 0.356308, 1.320149, 1, 0, 0.09411765, 1,
2.22177, 0.9353749, 0.3757954, 1, 0, 0.09019608, 1,
2.267884, 0.4473071, 3.16371, 1, 0, 0.08235294, 1,
2.330955, 0.9031713, 2.37129, 1, 0, 0.07843138, 1,
2.365895, 0.7651244, 0.1141991, 1, 0, 0.07058824, 1,
2.430761, -0.8071043, 3.07064, 1, 0, 0.06666667, 1,
2.50675, 0.30885, 2.190654, 1, 0, 0.05882353, 1,
2.515958, 1.142398, 1.386712, 1, 0, 0.05490196, 1,
2.58133, 0.5218396, 1.48541, 1, 0, 0.04705882, 1,
2.585628, -0.9304812, 2.427675, 1, 0, 0.04313726, 1,
2.59437, -0.4911974, 1.096872, 1, 0, 0.03529412, 1,
2.635327, -0.3472979, 3.041163, 1, 0, 0.03137255, 1,
2.691236, -0.4630706, 2.932408, 1, 0, 0.02352941, 1,
2.739105, -0.9275908, 1.7372, 1, 0, 0.01960784, 1,
2.754344, -2.21603, 2.846724, 1, 0, 0.01176471, 1,
2.94405, 0.3698418, 2.833478, 1, 0, 0.007843138, 1
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
-0.1197695, -3.676276, -6.825798, 0, -0.5, 0.5, 0.5,
-0.1197695, -3.676276, -6.825798, 1, -0.5, 0.5, 0.5,
-0.1197695, -3.676276, -6.825798, 1, 1.5, 0.5, 0.5,
-0.1197695, -3.676276, -6.825798, 0, 1.5, 0.5, 0.5
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
-4.222223, 0.1698089, -6.825798, 0, -0.5, 0.5, 0.5,
-4.222223, 0.1698089, -6.825798, 1, -0.5, 0.5, 0.5,
-4.222223, 0.1698089, -6.825798, 1, 1.5, 0.5, 0.5,
-4.222223, 0.1698089, -6.825798, 0, 1.5, 0.5, 0.5
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
-4.222223, -3.676276, -0.2200241, 0, -0.5, 0.5, 0.5,
-4.222223, -3.676276, -0.2200241, 1, -0.5, 0.5, 0.5,
-4.222223, -3.676276, -0.2200241, 1, 1.5, 0.5, 0.5,
-4.222223, -3.676276, -0.2200241, 0, 1.5, 0.5, 0.5
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
-3, -2.788718, -5.301388,
2, -2.788718, -5.301388,
-3, -2.788718, -5.301388,
-3, -2.936644, -5.555457,
-2, -2.788718, -5.301388,
-2, -2.936644, -5.555457,
-1, -2.788718, -5.301388,
-1, -2.936644, -5.555457,
0, -2.788718, -5.301388,
0, -2.936644, -5.555457,
1, -2.788718, -5.301388,
1, -2.936644, -5.555457,
2, -2.788718, -5.301388,
2, -2.936644, -5.555457
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
-3, -3.232497, -6.063593, 0, -0.5, 0.5, 0.5,
-3, -3.232497, -6.063593, 1, -0.5, 0.5, 0.5,
-3, -3.232497, -6.063593, 1, 1.5, 0.5, 0.5,
-3, -3.232497, -6.063593, 0, 1.5, 0.5, 0.5,
-2, -3.232497, -6.063593, 0, -0.5, 0.5, 0.5,
-2, -3.232497, -6.063593, 1, -0.5, 0.5, 0.5,
-2, -3.232497, -6.063593, 1, 1.5, 0.5, 0.5,
-2, -3.232497, -6.063593, 0, 1.5, 0.5, 0.5,
-1, -3.232497, -6.063593, 0, -0.5, 0.5, 0.5,
-1, -3.232497, -6.063593, 1, -0.5, 0.5, 0.5,
-1, -3.232497, -6.063593, 1, 1.5, 0.5, 0.5,
-1, -3.232497, -6.063593, 0, 1.5, 0.5, 0.5,
0, -3.232497, -6.063593, 0, -0.5, 0.5, 0.5,
0, -3.232497, -6.063593, 1, -0.5, 0.5, 0.5,
0, -3.232497, -6.063593, 1, 1.5, 0.5, 0.5,
0, -3.232497, -6.063593, 0, 1.5, 0.5, 0.5,
1, -3.232497, -6.063593, 0, -0.5, 0.5, 0.5,
1, -3.232497, -6.063593, 1, -0.5, 0.5, 0.5,
1, -3.232497, -6.063593, 1, 1.5, 0.5, 0.5,
1, -3.232497, -6.063593, 0, 1.5, 0.5, 0.5,
2, -3.232497, -6.063593, 0, -0.5, 0.5, 0.5,
2, -3.232497, -6.063593, 1, -0.5, 0.5, 0.5,
2, -3.232497, -6.063593, 1, 1.5, 0.5, 0.5,
2, -3.232497, -6.063593, 0, 1.5, 0.5, 0.5
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
-3.275503, -2, -5.301388,
-3.275503, 3, -5.301388,
-3.275503, -2, -5.301388,
-3.43329, -2, -5.555457,
-3.275503, -1, -5.301388,
-3.43329, -1, -5.555457,
-3.275503, 0, -5.301388,
-3.43329, 0, -5.555457,
-3.275503, 1, -5.301388,
-3.43329, 1, -5.555457,
-3.275503, 2, -5.301388,
-3.43329, 2, -5.555457,
-3.275503, 3, -5.301388,
-3.43329, 3, -5.555457
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
-3.748863, -2, -6.063593, 0, -0.5, 0.5, 0.5,
-3.748863, -2, -6.063593, 1, -0.5, 0.5, 0.5,
-3.748863, -2, -6.063593, 1, 1.5, 0.5, 0.5,
-3.748863, -2, -6.063593, 0, 1.5, 0.5, 0.5,
-3.748863, -1, -6.063593, 0, -0.5, 0.5, 0.5,
-3.748863, -1, -6.063593, 1, -0.5, 0.5, 0.5,
-3.748863, -1, -6.063593, 1, 1.5, 0.5, 0.5,
-3.748863, -1, -6.063593, 0, 1.5, 0.5, 0.5,
-3.748863, 0, -6.063593, 0, -0.5, 0.5, 0.5,
-3.748863, 0, -6.063593, 1, -0.5, 0.5, 0.5,
-3.748863, 0, -6.063593, 1, 1.5, 0.5, 0.5,
-3.748863, 0, -6.063593, 0, 1.5, 0.5, 0.5,
-3.748863, 1, -6.063593, 0, -0.5, 0.5, 0.5,
-3.748863, 1, -6.063593, 1, -0.5, 0.5, 0.5,
-3.748863, 1, -6.063593, 1, 1.5, 0.5, 0.5,
-3.748863, 1, -6.063593, 0, 1.5, 0.5, 0.5,
-3.748863, 2, -6.063593, 0, -0.5, 0.5, 0.5,
-3.748863, 2, -6.063593, 1, -0.5, 0.5, 0.5,
-3.748863, 2, -6.063593, 1, 1.5, 0.5, 0.5,
-3.748863, 2, -6.063593, 0, 1.5, 0.5, 0.5,
-3.748863, 3, -6.063593, 0, -0.5, 0.5, 0.5,
-3.748863, 3, -6.063593, 1, -0.5, 0.5, 0.5,
-3.748863, 3, -6.063593, 1, 1.5, 0.5, 0.5,
-3.748863, 3, -6.063593, 0, 1.5, 0.5, 0.5
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
-3.275503, -2.788718, -4,
-3.275503, -2.788718, 4,
-3.275503, -2.788718, -4,
-3.43329, -2.936644, -4,
-3.275503, -2.788718, -2,
-3.43329, -2.936644, -2,
-3.275503, -2.788718, 0,
-3.43329, -2.936644, 0,
-3.275503, -2.788718, 2,
-3.43329, -2.936644, 2,
-3.275503, -2.788718, 4,
-3.43329, -2.936644, 4
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
-3.748863, -3.232497, -4, 0, -0.5, 0.5, 0.5,
-3.748863, -3.232497, -4, 1, -0.5, 0.5, 0.5,
-3.748863, -3.232497, -4, 1, 1.5, 0.5, 0.5,
-3.748863, -3.232497, -4, 0, 1.5, 0.5, 0.5,
-3.748863, -3.232497, -2, 0, -0.5, 0.5, 0.5,
-3.748863, -3.232497, -2, 1, -0.5, 0.5, 0.5,
-3.748863, -3.232497, -2, 1, 1.5, 0.5, 0.5,
-3.748863, -3.232497, -2, 0, 1.5, 0.5, 0.5,
-3.748863, -3.232497, 0, 0, -0.5, 0.5, 0.5,
-3.748863, -3.232497, 0, 1, -0.5, 0.5, 0.5,
-3.748863, -3.232497, 0, 1, 1.5, 0.5, 0.5,
-3.748863, -3.232497, 0, 0, 1.5, 0.5, 0.5,
-3.748863, -3.232497, 2, 0, -0.5, 0.5, 0.5,
-3.748863, -3.232497, 2, 1, -0.5, 0.5, 0.5,
-3.748863, -3.232497, 2, 1, 1.5, 0.5, 0.5,
-3.748863, -3.232497, 2, 0, 1.5, 0.5, 0.5,
-3.748863, -3.232497, 4, 0, -0.5, 0.5, 0.5,
-3.748863, -3.232497, 4, 1, -0.5, 0.5, 0.5,
-3.748863, -3.232497, 4, 1, 1.5, 0.5, 0.5,
-3.748863, -3.232497, 4, 0, 1.5, 0.5, 0.5
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
-3.275503, -2.788718, -5.301388,
-3.275503, 3.128336, -5.301388,
-3.275503, -2.788718, 4.86134,
-3.275503, 3.128336, 4.86134,
-3.275503, -2.788718, -5.301388,
-3.275503, -2.788718, 4.86134,
-3.275503, 3.128336, -5.301388,
-3.275503, 3.128336, 4.86134,
-3.275503, -2.788718, -5.301388,
3.035964, -2.788718, -5.301388,
-3.275503, -2.788718, 4.86134,
3.035964, -2.788718, 4.86134,
-3.275503, 3.128336, -5.301388,
3.035964, 3.128336, -5.301388,
-3.275503, 3.128336, 4.86134,
3.035964, 3.128336, 4.86134,
3.035964, -2.788718, -5.301388,
3.035964, 3.128336, -5.301388,
3.035964, -2.788718, 4.86134,
3.035964, 3.128336, 4.86134,
3.035964, -2.788718, -5.301388,
3.035964, -2.788718, 4.86134,
3.035964, 3.128336, -5.301388,
3.035964, 3.128336, 4.86134
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
var radius = 7.126735;
var distance = 31.70765;
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
mvMatrix.translate( 0.1197695, -0.1698089, 0.2200241 );
mvMatrix.scale( 1.220883, 1.302264, 0.7582181 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.70765);
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
DELAn<-read.table("DELAn.xyz", skip=1)
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
-3.183589, 1.092915, -0.02518449, 0, 0, 1, 1, 1,
-3.180373, 0.1060265, -1.81088, 1, 0, 0, 1, 1,
-3.079284, 0.7508072, -0.06204493, 1, 0, 0, 1, 1,
-3.069305, 0.7213953, -3.09412, 1, 0, 0, 1, 1,
-2.796186, -0.7649373, -0.8481094, 1, 0, 0, 1, 1,
-2.658266, 1.033696, 1.468587, 1, 0, 0, 1, 1,
-2.473915, 0.2073341, -2.851526, 0, 0, 0, 1, 1,
-2.397839, -0.2938442, -1.662287, 0, 0, 0, 1, 1,
-2.352355, -0.3716722, -0.7085498, 0, 0, 0, 1, 1,
-2.346329, 1.563852, -2.823196, 0, 0, 0, 1, 1,
-2.313064, 0.7692537, 0.1990739, 0, 0, 0, 1, 1,
-2.299861, 0.4348252, -2.049822, 0, 0, 0, 1, 1,
-2.297674, -0.1629705, -0.5848717, 0, 0, 0, 1, 1,
-2.263413, 0.2686022, -1.247163, 1, 1, 1, 1, 1,
-2.244985, 0.78233, -0.3645676, 1, 1, 1, 1, 1,
-2.231488, -0.2754165, -1.492499, 1, 1, 1, 1, 1,
-2.227114, 1.03338, -0.01746442, 1, 1, 1, 1, 1,
-2.22593, 0.9391609, 0.2312569, 1, 1, 1, 1, 1,
-2.21859, -0.8295448, -2.060788, 1, 1, 1, 1, 1,
-2.199472, 0.8140623, -0.9164967, 1, 1, 1, 1, 1,
-2.187532, 0.9775326, 1.19189, 1, 1, 1, 1, 1,
-2.167102, -0.5576828, -2.991875, 1, 1, 1, 1, 1,
-2.149425, 1.044564, -1.537404, 1, 1, 1, 1, 1,
-2.122385, -0.9758479, -2.049731, 1, 1, 1, 1, 1,
-2.10731, 0.5996814, -2.320669, 1, 1, 1, 1, 1,
-2.076999, 0.3469944, -1.729106, 1, 1, 1, 1, 1,
-2.0763, -0.6199681, -1.800942, 1, 1, 1, 1, 1,
-2.063316, 2.096917, -0.1991796, 1, 1, 1, 1, 1,
-2.057325, -0.3592933, -2.916077, 0, 0, 1, 1, 1,
-2.030547, -0.4169891, -3.710522, 1, 0, 0, 1, 1,
-2.026616, -1.024941, -2.097464, 1, 0, 0, 1, 1,
-2.014885, -1.353819, -0.9722352, 1, 0, 0, 1, 1,
-1.965748, -0.3704373, -3.410634, 1, 0, 0, 1, 1,
-1.916439, -1.481253, -1.673477, 1, 0, 0, 1, 1,
-1.913983, -0.09012684, -2.300576, 0, 0, 0, 1, 1,
-1.882858, -1.325018, -4.992206, 0, 0, 0, 1, 1,
-1.880377, 0.3852519, -0.6982684, 0, 0, 0, 1, 1,
-1.868018, 0.07906288, -1.69589, 0, 0, 0, 1, 1,
-1.842794, -0.4131646, -1.225333, 0, 0, 0, 1, 1,
-1.821463, 0.6515853, -2.049339, 0, 0, 0, 1, 1,
-1.821354, -1.334573, -2.663145, 0, 0, 0, 1, 1,
-1.791166, 0.2335276, -1.422606, 1, 1, 1, 1, 1,
-1.779384, 1.010744, -2.500586, 1, 1, 1, 1, 1,
-1.77207, -0.3316178, -1.28106, 1, 1, 1, 1, 1,
-1.758378, -0.038103, 0.3495382, 1, 1, 1, 1, 1,
-1.755081, 1.073661, -1.541552, 1, 1, 1, 1, 1,
-1.743908, -0.86238, -3.826632, 1, 1, 1, 1, 1,
-1.720395, 0.7563524, -0.6033952, 1, 1, 1, 1, 1,
-1.710152, -0.8553115, -2.31759, 1, 1, 1, 1, 1,
-1.704608, 0.2932705, -2.308711, 1, 1, 1, 1, 1,
-1.682371, -0.0246801, -2.075498, 1, 1, 1, 1, 1,
-1.676369, 1.734217, -1.988759, 1, 1, 1, 1, 1,
-1.638353, -0.2565664, -0.9070055, 1, 1, 1, 1, 1,
-1.630062, -0.7881896, -1.965052, 1, 1, 1, 1, 1,
-1.627549, -0.6560934, -0.1542213, 1, 1, 1, 1, 1,
-1.588091, -0.4439673, -1.357455, 1, 1, 1, 1, 1,
-1.578714, -0.7634127, -1.582043, 0, 0, 1, 1, 1,
-1.575423, 0.7164205, -1.836421, 1, 0, 0, 1, 1,
-1.529898, -0.1808188, -3.40416, 1, 0, 0, 1, 1,
-1.52466, -0.4098527, -0.2821917, 1, 0, 0, 1, 1,
-1.502252, -1.205488, -4.287762, 1, 0, 0, 1, 1,
-1.498116, -0.457552, -2.05257, 1, 0, 0, 1, 1,
-1.491486, 0.6178036, -1.837346, 0, 0, 0, 1, 1,
-1.480984, -0.5540636, -1.540166, 0, 0, 0, 1, 1,
-1.479046, -0.03756283, -0.7092478, 0, 0, 0, 1, 1,
-1.476688, 0.4778385, 0.1126006, 0, 0, 0, 1, 1,
-1.474157, 1.026956, -1.424188, 0, 0, 0, 1, 1,
-1.473925, 0.5228105, -0.2817794, 0, 0, 0, 1, 1,
-1.467113, -0.6885085, -0.9223524, 0, 0, 0, 1, 1,
-1.45706, -0.3697814, -1.597255, 1, 1, 1, 1, 1,
-1.43916, -0.2463313, -2.331471, 1, 1, 1, 1, 1,
-1.438047, 0.5838138, -2.259689, 1, 1, 1, 1, 1,
-1.427724, -2.63297, -2.024603, 1, 1, 1, 1, 1,
-1.415209, -1.793869, -2.766412, 1, 1, 1, 1, 1,
-1.409522, -0.1389096, -1.221236, 1, 1, 1, 1, 1,
-1.405795, 0.1211949, -3.525131, 1, 1, 1, 1, 1,
-1.391817, 0.2388344, -2.530453, 1, 1, 1, 1, 1,
-1.373877, 2.394338, -1.814029, 1, 1, 1, 1, 1,
-1.370129, 2.128088, -0.1928574, 1, 1, 1, 1, 1,
-1.368696, 2.882076, 0.8379007, 1, 1, 1, 1, 1,
-1.365244, -1.463333, -2.106836, 1, 1, 1, 1, 1,
-1.361658, 1.877449, -2.127808, 1, 1, 1, 1, 1,
-1.336668, -0.5112929, -2.696949, 1, 1, 1, 1, 1,
-1.328051, -0.5961345, -2.035, 1, 1, 1, 1, 1,
-1.322506, 1.053477, 0.007951441, 0, 0, 1, 1, 1,
-1.31141, -0.3120009, -0.4782237, 1, 0, 0, 1, 1,
-1.310877, 0.4421038, -1.772679, 1, 0, 0, 1, 1,
-1.308873, 0.813105, -2.111625, 1, 0, 0, 1, 1,
-1.305093, -1.448096, -1.628196, 1, 0, 0, 1, 1,
-1.301597, 0.9371765, -1.225415, 1, 0, 0, 1, 1,
-1.296998, -0.09006836, -1.486589, 0, 0, 0, 1, 1,
-1.28862, -0.6802866, -0.687274, 0, 0, 0, 1, 1,
-1.275107, -1.56874, -3.702007, 0, 0, 0, 1, 1,
-1.265856, -1.342027, -3.106208, 0, 0, 0, 1, 1,
-1.265263, 1.068971, -1.316714, 0, 0, 0, 1, 1,
-1.26461, -2.13426, -3.162613, 0, 0, 0, 1, 1,
-1.264455, -2.092659, -2.243852, 0, 0, 0, 1, 1,
-1.254021, -0.6471459, -2.22021, 1, 1, 1, 1, 1,
-1.250656, -1.66024, -2.641666, 1, 1, 1, 1, 1,
-1.249715, -0.2087485, -2.432584, 1, 1, 1, 1, 1,
-1.249613, 0.3694277, -0.5361598, 1, 1, 1, 1, 1,
-1.241941, -0.1371391, -1.136671, 1, 1, 1, 1, 1,
-1.233277, -0.9885056, -2.567165, 1, 1, 1, 1, 1,
-1.230396, 0.4381562, -0.5825107, 1, 1, 1, 1, 1,
-1.228426, 0.5428236, -1.470613, 1, 1, 1, 1, 1,
-1.222727, -0.3154123, -1.324113, 1, 1, 1, 1, 1,
-1.207355, 1.171327, -0.08377996, 1, 1, 1, 1, 1,
-1.200027, -0.7406099, -1.281598, 1, 1, 1, 1, 1,
-1.193436, -1.22451, -2.649176, 1, 1, 1, 1, 1,
-1.190281, 0.3009909, -0.8648114, 1, 1, 1, 1, 1,
-1.186418, 1.415764, 0.09505055, 1, 1, 1, 1, 1,
-1.172952, -0.4759164, -3.114444, 1, 1, 1, 1, 1,
-1.169402, 0.7730792, -2.218202, 0, 0, 1, 1, 1,
-1.168576, -0.8864862, -2.908056, 1, 0, 0, 1, 1,
-1.159955, 0.1906483, -1.23381, 1, 0, 0, 1, 1,
-1.151658, 0.2459679, -1.675075, 1, 0, 0, 1, 1,
-1.143785, 0.6271123, -1.13798, 1, 0, 0, 1, 1,
-1.139201, -0.7261734, -1.530024, 1, 0, 0, 1, 1,
-1.136802, 0.4523971, 0.5676268, 0, 0, 0, 1, 1,
-1.131727, 0.2466359, -1.444471, 0, 0, 0, 1, 1,
-1.127754, -0.4166891, -2.752178, 0, 0, 0, 1, 1,
-1.116275, -0.8235742, -2.487414, 0, 0, 0, 1, 1,
-1.106909, 0.5839458, -1.544511, 0, 0, 0, 1, 1,
-1.096915, -0.3933958, -1.855797, 0, 0, 0, 1, 1,
-1.09444, 0.3380476, -2.074811, 0, 0, 0, 1, 1,
-1.089019, 0.6254682, -2.442046, 1, 1, 1, 1, 1,
-1.084891, -0.4752642, -3.73124, 1, 1, 1, 1, 1,
-1.083251, -0.8717306, 0.6827328, 1, 1, 1, 1, 1,
-1.066443, 0.7149485, -0.2994131, 1, 1, 1, 1, 1,
-1.065016, 1.915863, -1.048776, 1, 1, 1, 1, 1,
-1.063831, 0.1735761, -0.9869351, 1, 1, 1, 1, 1,
-1.052967, 0.317091, 0.6732829, 1, 1, 1, 1, 1,
-1.052231, 0.7085432, -2.208829, 1, 1, 1, 1, 1,
-1.051337, -0.1483777, -0.4692973, 1, 1, 1, 1, 1,
-1.05086, 0.821636, -0.5238968, 1, 1, 1, 1, 1,
-1.031169, 0.1531419, -1.768067, 1, 1, 1, 1, 1,
-1.030644, -0.952393, -3.037227, 1, 1, 1, 1, 1,
-1.030344, 1.560032, -0.9381565, 1, 1, 1, 1, 1,
-1.025042, -1.156654, -1.865899, 1, 1, 1, 1, 1,
-1.020671, -1.821984, -0.6578234, 1, 1, 1, 1, 1,
-1.019035, -0.06002438, -3.002597, 0, 0, 1, 1, 1,
-1.01787, 1.315578, -0.1205458, 1, 0, 0, 1, 1,
-1.016165, -0.3396817, -0.6482171, 1, 0, 0, 1, 1,
-1.014275, -1.042294, -3.119119, 1, 0, 0, 1, 1,
-1.01091, 0.5371361, -2.693877, 1, 0, 0, 1, 1,
-1.005158, 0.6193202, 0.6554903, 1, 0, 0, 1, 1,
-1.000083, -0.3046292, -3.504103, 0, 0, 0, 1, 1,
-0.9926974, -0.3064001, -3.590228, 0, 0, 0, 1, 1,
-0.9899999, 1.243936, -1.630077, 0, 0, 0, 1, 1,
-0.9898197, 1.401564, -0.6149099, 0, 0, 0, 1, 1,
-0.9797875, 1.016647, -1.09886, 0, 0, 0, 1, 1,
-0.9772219, 1.913194, -3.766624, 0, 0, 0, 1, 1,
-0.9768015, -1.516733, -2.809472, 0, 0, 0, 1, 1,
-0.9698502, 1.422018, 0.3885231, 1, 1, 1, 1, 1,
-0.9667819, 0.03953495, -0.8364623, 1, 1, 1, 1, 1,
-0.9650757, -0.8602157, -1.90649, 1, 1, 1, 1, 1,
-0.9650757, -0.05832233, -1.146519, 1, 1, 1, 1, 1,
-0.9644867, 0.5739852, -1.551878, 1, 1, 1, 1, 1,
-0.9576803, -2.426605, -2.645932, 1, 1, 1, 1, 1,
-0.9546609, -0.4897831, -2.327308, 1, 1, 1, 1, 1,
-0.9505258, 0.4898057, -2.236998, 1, 1, 1, 1, 1,
-0.9461148, -0.3959211, -1.483462, 1, 1, 1, 1, 1,
-0.9443743, 0.3124424, -0.4535036, 1, 1, 1, 1, 1,
-0.9379979, 0.7603551, 2.088796, 1, 1, 1, 1, 1,
-0.9349712, -0.847864, 1.179083, 1, 1, 1, 1, 1,
-0.9134394, 0.06142614, -1.421815, 1, 1, 1, 1, 1,
-0.9099047, 0.5608417, -2.33987, 1, 1, 1, 1, 1,
-0.9073533, 0.6760182, -0.1349905, 1, 1, 1, 1, 1,
-0.9037051, 0.1856709, -4.081494, 0, 0, 1, 1, 1,
-0.9017513, -0.7019822, -2.9829, 1, 0, 0, 1, 1,
-0.8960363, 0.6726533, -0.9752135, 1, 0, 0, 1, 1,
-0.8931717, -0.6175775, 0.01426625, 1, 0, 0, 1, 1,
-0.8930657, 2.359233, -1.165798, 1, 0, 0, 1, 1,
-0.8857554, -1.451349, -1.768953, 1, 0, 0, 1, 1,
-0.8799912, -0.1665766, -0.6597272, 0, 0, 0, 1, 1,
-0.8775176, 0.3128736, -1.306853, 0, 0, 0, 1, 1,
-0.87603, 1.462759, 1.744687, 0, 0, 0, 1, 1,
-0.8760065, 0.6685577, 0.1694705, 0, 0, 0, 1, 1,
-0.8720145, 0.3203545, -2.186188, 0, 0, 0, 1, 1,
-0.8706257, 0.3381775, -1.212975, 0, 0, 0, 1, 1,
-0.861173, 2.064303, -0.6500137, 0, 0, 0, 1, 1,
-0.8581868, 0.1722447, -0.2757157, 1, 1, 1, 1, 1,
-0.8531656, 0.2156094, -2.643475, 1, 1, 1, 1, 1,
-0.8527015, -0.5675193, -1.142011, 1, 1, 1, 1, 1,
-0.8509681, -2.399372, -1.868506, 1, 1, 1, 1, 1,
-0.8508739, 1.538723, -0.2739517, 1, 1, 1, 1, 1,
-0.8465846, 0.8893546, -1.671244, 1, 1, 1, 1, 1,
-0.8459128, 1.96991, -1.349581, 1, 1, 1, 1, 1,
-0.8454951, 0.4914156, 0.8576665, 1, 1, 1, 1, 1,
-0.8365288, 0.1759507, -1.494098, 1, 1, 1, 1, 1,
-0.8310258, -0.9014511, -2.749383, 1, 1, 1, 1, 1,
-0.8299093, 1.277739, -1.83259, 1, 1, 1, 1, 1,
-0.8285905, -0.03084332, -0.52694, 1, 1, 1, 1, 1,
-0.8260211, 0.2800057, -1.009745, 1, 1, 1, 1, 1,
-0.8248957, 0.8335944, -0.4318928, 1, 1, 1, 1, 1,
-0.8241892, 0.2102025, -0.5887246, 1, 1, 1, 1, 1,
-0.8184551, 3.042165, -0.751375, 0, 0, 1, 1, 1,
-0.8169925, 0.8612567, -1.09524, 1, 0, 0, 1, 1,
-0.7985637, -0.3678842, -2.066446, 1, 0, 0, 1, 1,
-0.7943673, 0.6160046, -1.306502, 1, 0, 0, 1, 1,
-0.7912912, 0.3623897, -0.2340325, 1, 0, 0, 1, 1,
-0.7833, 2.358166, 0.5146607, 1, 0, 0, 1, 1,
-0.7825571, 0.4344447, 0.6241284, 0, 0, 0, 1, 1,
-0.7821245, -0.1980114, -1.908712, 0, 0, 0, 1, 1,
-0.7700028, -0.4777542, -1.494951, 0, 0, 0, 1, 1,
-0.7653128, -0.02180669, -1.843838, 0, 0, 0, 1, 1,
-0.7605628, 0.1235819, -0.8122029, 0, 0, 0, 1, 1,
-0.7582417, 1.201495, -0.5110628, 0, 0, 0, 1, 1,
-0.7576829, 0.7899601, 0.2609787, 0, 0, 0, 1, 1,
-0.7538002, 0.05952136, -0.6252609, 1, 1, 1, 1, 1,
-0.7459413, -0.6473281, -2.003613, 1, 1, 1, 1, 1,
-0.7383295, -0.3964808, -1.851263, 1, 1, 1, 1, 1,
-0.7315028, -0.7160918, -1.946967, 1, 1, 1, 1, 1,
-0.7216994, -1.499614, -2.975459, 1, 1, 1, 1, 1,
-0.7160681, -1.168764, -3.091979, 1, 1, 1, 1, 1,
-0.7149177, -0.3480256, -3.748813, 1, 1, 1, 1, 1,
-0.7146511, -0.517958, -3.242675, 1, 1, 1, 1, 1,
-0.7145811, 0.04100869, -1.33262, 1, 1, 1, 1, 1,
-0.7093329, -0.002394365, -1.34294, 1, 1, 1, 1, 1,
-0.7007344, 0.2011395, -1.656879, 1, 1, 1, 1, 1,
-0.6983656, 0.4840172, -2.435494, 1, 1, 1, 1, 1,
-0.6963946, -0.4012704, -0.9796652, 1, 1, 1, 1, 1,
-0.6953788, 0.5210098, -0.6235551, 1, 1, 1, 1, 1,
-0.6946254, 0.9497366, -2.643858, 1, 1, 1, 1, 1,
-0.6863676, -0.3954732, -0.9528, 0, 0, 1, 1, 1,
-0.6786063, 1.007579, -0.6516839, 1, 0, 0, 1, 1,
-0.6750138, 1.114683, -1.438971, 1, 0, 0, 1, 1,
-0.6649663, -0.159503, -2.310697, 1, 0, 0, 1, 1,
-0.6648328, -0.5528231, -0.9885026, 1, 0, 0, 1, 1,
-0.6644521, -0.5359124, -2.410175, 1, 0, 0, 1, 1,
-0.6628986, 1.880419, 0.8172618, 0, 0, 0, 1, 1,
-0.6623729, 0.8506831, -0.1049405, 0, 0, 0, 1, 1,
-0.6488988, 0.9933053, 0.4050264, 0, 0, 0, 1, 1,
-0.646848, 1.667872, 0.1336024, 0, 0, 0, 1, 1,
-0.6453823, 1.787758, 1.001903, 0, 0, 0, 1, 1,
-0.6450975, 1.005513, 1.293493, 0, 0, 0, 1, 1,
-0.6444256, 0.5377404, -0.6769549, 0, 0, 0, 1, 1,
-0.6400403, -0.7928845, -2.55822, 1, 1, 1, 1, 1,
-0.6392702, -1.127, -3.560181, 1, 1, 1, 1, 1,
-0.6367562, 0.3975111, -0.1150513, 1, 1, 1, 1, 1,
-0.6363918, 2.195266, 0.5477713, 1, 1, 1, 1, 1,
-0.6323579, 0.3362236, -1.398173, 1, 1, 1, 1, 1,
-0.6300851, -1.43562, -1.935236, 1, 1, 1, 1, 1,
-0.6252561, 0.127087, -1.43299, 1, 1, 1, 1, 1,
-0.6251075, -0.6741308, -2.684308, 1, 1, 1, 1, 1,
-0.621659, 1.093922, -1.309816, 1, 1, 1, 1, 1,
-0.6163717, -0.123378, -2.248515, 1, 1, 1, 1, 1,
-0.6146125, 0.4663779, -1.628149, 1, 1, 1, 1, 1,
-0.6137654, -0.5723361, -0.841846, 1, 1, 1, 1, 1,
-0.6131118, 0.4540313, -1.237065, 1, 1, 1, 1, 1,
-0.6099843, -0.5886645, -1.348937, 1, 1, 1, 1, 1,
-0.6087559, -0.04201859, -0.6275159, 1, 1, 1, 1, 1,
-0.6065931, -0.8453642, -2.729159, 0, 0, 1, 1, 1,
-0.6065603, -0.268384, -1.8381, 1, 0, 0, 1, 1,
-0.6058299, -0.9359549, -3.006978, 1, 0, 0, 1, 1,
-0.5975859, -0.5938529, -3.350402, 1, 0, 0, 1, 1,
-0.596895, 1.392092, -1.281516, 1, 0, 0, 1, 1,
-0.5892495, 0.2707271, -0.5965032, 1, 0, 0, 1, 1,
-0.5797129, 0.3614211, -1.904097, 0, 0, 0, 1, 1,
-0.5781505, 0.2709162, -0.8537813, 0, 0, 0, 1, 1,
-0.5768631, -2.493811, -2.584747, 0, 0, 0, 1, 1,
-0.5727457, -0.09386925, -4.096276, 0, 0, 0, 1, 1,
-0.5703884, 1.564084, 0.3964184, 0, 0, 0, 1, 1,
-0.5668755, 0.1750762, -2.71737, 0, 0, 0, 1, 1,
-0.5650808, -1.2655, -1.623857, 0, 0, 0, 1, 1,
-0.5649334, 0.4885324, 0.5602872, 1, 1, 1, 1, 1,
-0.5633853, 0.4163515, -1.178612, 1, 1, 1, 1, 1,
-0.563324, 0.6501012, -0.7041087, 1, 1, 1, 1, 1,
-0.5631765, 0.08403639, -0.9315889, 1, 1, 1, 1, 1,
-0.5620062, 0.6700065, -0.8566079, 1, 1, 1, 1, 1,
-0.5599323, 0.8796635, -0.7047941, 1, 1, 1, 1, 1,
-0.5594511, -1.59587, -3.916943, 1, 1, 1, 1, 1,
-0.5592096, 1.014397, 0.07841302, 1, 1, 1, 1, 1,
-0.5565237, -0.3986017, -1.530584, 1, 1, 1, 1, 1,
-0.5562246, 0.1902829, 0.2433261, 1, 1, 1, 1, 1,
-0.5554771, 0.9909927, -0.4712592, 1, 1, 1, 1, 1,
-0.5514691, -1.703074, -3.678831, 1, 1, 1, 1, 1,
-0.5484752, 0.3849644, -1.977081, 1, 1, 1, 1, 1,
-0.5470834, -0.3018489, -2.344533, 1, 1, 1, 1, 1,
-0.5445181, 0.2366993, -2.575265, 1, 1, 1, 1, 1,
-0.5440267, -1.51646, -2.342683, 0, 0, 1, 1, 1,
-0.5418704, -1.035333, -3.60152, 1, 0, 0, 1, 1,
-0.5406627, -1.607896, -3.673075, 1, 0, 0, 1, 1,
-0.5373654, 0.4500479, -2.173331, 1, 0, 0, 1, 1,
-0.5366616, 0.6584618, -1.740237, 1, 0, 0, 1, 1,
-0.5359191, 0.04153522, -1.450321, 1, 0, 0, 1, 1,
-0.5277654, -2.036676, -3.734771, 0, 0, 0, 1, 1,
-0.5269979, 0.1933108, -0.2303498, 0, 0, 0, 1, 1,
-0.5265521, 0.6311752, 0.380926, 0, 0, 0, 1, 1,
-0.5242499, -0.6800473, -2.042423, 0, 0, 0, 1, 1,
-0.5221626, 0.8315715, -2.192804, 0, 0, 0, 1, 1,
-0.5187071, 0.6566975, 0.08435917, 0, 0, 0, 1, 1,
-0.5185044, 0.02957674, -1.491676, 0, 0, 0, 1, 1,
-0.518312, -0.01337468, -2.565748, 1, 1, 1, 1, 1,
-0.5136415, 0.2103685, -1.24913, 1, 1, 1, 1, 1,
-0.5134594, -1.822287, -3.736201, 1, 1, 1, 1, 1,
-0.5059695, -0.7618335, -2.931159, 1, 1, 1, 1, 1,
-0.5053293, 1.378792, -1.407675, 1, 1, 1, 1, 1,
-0.5020472, 0.1438852, 0.2698157, 1, 1, 1, 1, 1,
-0.4986857, 0.2179508, 0.8760756, 1, 1, 1, 1, 1,
-0.49667, 1.59348, -1.056503, 1, 1, 1, 1, 1,
-0.4954508, -0.2045869, -1.604562, 1, 1, 1, 1, 1,
-0.4874133, 0.2042217, -1.998395, 1, 1, 1, 1, 1,
-0.4829056, 0.3756885, -0.9412344, 1, 1, 1, 1, 1,
-0.4827569, 0.2807408, -0.7331448, 1, 1, 1, 1, 1,
-0.4798632, -0.783294, -4.553097, 1, 1, 1, 1, 1,
-0.4792873, 0.6060557, -0.721728, 1, 1, 1, 1, 1,
-0.4777187, 0.3008475, -0.297005, 1, 1, 1, 1, 1,
-0.4772608, -0.9717344, -4.32998, 0, 0, 1, 1, 1,
-0.4747306, -0.893158, -0.4188865, 1, 0, 0, 1, 1,
-0.473658, -0.2565093, -0.7031945, 1, 0, 0, 1, 1,
-0.4698436, -0.5419337, -4.117076, 1, 0, 0, 1, 1,
-0.4690277, -1.15247, -2.441229, 1, 0, 0, 1, 1,
-0.465659, -0.6099539, -1.80379, 1, 0, 0, 1, 1,
-0.4651057, 0.9171786, -0.8964079, 0, 0, 0, 1, 1,
-0.4613461, -0.224196, -1.553118, 0, 0, 0, 1, 1,
-0.4600591, -0.1173835, -2.153102, 0, 0, 0, 1, 1,
-0.4586427, 1.855341, -0.5937459, 0, 0, 0, 1, 1,
-0.4586016, 0.5350262, -0.2897431, 0, 0, 0, 1, 1,
-0.4427229, -0.1372621, 0.6881359, 0, 0, 0, 1, 1,
-0.4377892, -0.2693996, -0.3519353, 0, 0, 0, 1, 1,
-0.4358507, -1.372516, -2.835704, 1, 1, 1, 1, 1,
-0.435408, 1.876775, 0.08417282, 1, 1, 1, 1, 1,
-0.4330046, 2.778482, 0.3912099, 1, 1, 1, 1, 1,
-0.4329293, 0.8011521, -0.8422149, 1, 1, 1, 1, 1,
-0.4305698, 1.322384, -0.7485676, 1, 1, 1, 1, 1,
-0.4291627, 0.475318, 0.1247985, 1, 1, 1, 1, 1,
-0.4282226, -0.01176452, -1.553799, 1, 1, 1, 1, 1,
-0.4220812, -1.564897, -3.888522, 1, 1, 1, 1, 1,
-0.417339, 0.6800436, 0.8903813, 1, 1, 1, 1, 1,
-0.4168822, 0.5436859, -0.7607977, 1, 1, 1, 1, 1,
-0.4159483, 0.201651, -0.8858646, 1, 1, 1, 1, 1,
-0.4083378, -0.6447251, -4.084903, 1, 1, 1, 1, 1,
-0.4059158, 0.258132, -1.113577, 1, 1, 1, 1, 1,
-0.3991548, 0.3663661, -0.4350645, 1, 1, 1, 1, 1,
-0.3926824, 0.5695924, 0.5403343, 1, 1, 1, 1, 1,
-0.3912376, 0.09601664, -2.514541, 0, 0, 1, 1, 1,
-0.3849987, 0.3196644, -0.4738338, 1, 0, 0, 1, 1,
-0.3843932, -1.444472, -1.371564, 1, 0, 0, 1, 1,
-0.3842001, 0.3037038, -2.203856, 1, 0, 0, 1, 1,
-0.3837034, 0.02875602, -1.355875, 1, 0, 0, 1, 1,
-0.3825585, 0.1310988, -1.884928, 1, 0, 0, 1, 1,
-0.379015, 0.2393507, -1.403246, 0, 0, 0, 1, 1,
-0.3732433, 0.7650738, -0.5253002, 0, 0, 0, 1, 1,
-0.3697282, 0.1859487, -0.9056216, 0, 0, 0, 1, 1,
-0.369321, 0.6687712, -0.3038371, 0, 0, 0, 1, 1,
-0.3658676, -1.079765, -1.979978, 0, 0, 0, 1, 1,
-0.3650413, 0.2763843, -1.415309, 0, 0, 0, 1, 1,
-0.3650115, 1.257152, -1.869951, 0, 0, 0, 1, 1,
-0.3617505, 1.503181, -1.567927, 1, 1, 1, 1, 1,
-0.3600554, 0.3807822, -1.713135, 1, 1, 1, 1, 1,
-0.3584266, 0.2397229, 0.6719254, 1, 1, 1, 1, 1,
-0.3566754, -0.6667309, -3.145154, 1, 1, 1, 1, 1,
-0.3557462, -0.3126994, -0.288477, 1, 1, 1, 1, 1,
-0.3544589, -0.9852673, -3.699525, 1, 1, 1, 1, 1,
-0.353761, 0.5517542, -1.566437, 1, 1, 1, 1, 1,
-0.3534461, 0.1029158, -1.861018, 1, 1, 1, 1, 1,
-0.3508996, -1.160312, -2.840773, 1, 1, 1, 1, 1,
-0.3479854, 0.6871482, -1.196214, 1, 1, 1, 1, 1,
-0.3462137, 0.9793177, -1.285801, 1, 1, 1, 1, 1,
-0.3449861, 0.9627171, -0.5591184, 1, 1, 1, 1, 1,
-0.3445709, 1.036544, 1.00141, 1, 1, 1, 1, 1,
-0.3444997, 1.399769, 0.2924218, 1, 1, 1, 1, 1,
-0.3444103, 0.05620971, -3.047209, 1, 1, 1, 1, 1,
-0.3413075, 0.3256068, -1.97956, 0, 0, 1, 1, 1,
-0.3388952, 1.752236, 1.715614, 1, 0, 0, 1, 1,
-0.3365598, 0.7700942, -1.234175, 1, 0, 0, 1, 1,
-0.3361609, -1.228928, -2.569164, 1, 0, 0, 1, 1,
-0.3340126, -0.2824878, -1.803847, 1, 0, 0, 1, 1,
-0.3330167, -1.228326, -2.882624, 1, 0, 0, 1, 1,
-0.3325606, 0.4360935, -0.8720428, 0, 0, 0, 1, 1,
-0.3307208, 1.259148, -0.7970462, 0, 0, 0, 1, 1,
-0.3306806, 0.8601118, -0.53419, 0, 0, 0, 1, 1,
-0.3296597, 0.62045, -0.5301932, 0, 0, 0, 1, 1,
-0.3294671, 1.182562, -1.01467, 0, 0, 0, 1, 1,
-0.3272233, -0.3202812, -3.640833, 0, 0, 0, 1, 1,
-0.3268057, 1.409242, -0.1894625, 0, 0, 0, 1, 1,
-0.3246934, -1.088841, -3.254478, 1, 1, 1, 1, 1,
-0.3207582, -1.785016, -3.605199, 1, 1, 1, 1, 1,
-0.3196297, 1.421131, -0.4231818, 1, 1, 1, 1, 1,
-0.3191217, 0.9421562, -0.4078112, 1, 1, 1, 1, 1,
-0.318656, 1.168785, -1.126811, 1, 1, 1, 1, 1,
-0.3182586, -0.8480232, -4.055434, 1, 1, 1, 1, 1,
-0.3172906, 2.116695, 0.6689418, 1, 1, 1, 1, 1,
-0.3120694, -0.4560269, -1.95414, 1, 1, 1, 1, 1,
-0.3109653, 1.614803, -0.321219, 1, 1, 1, 1, 1,
-0.3067194, 0.08887797, -0.4179224, 1, 1, 1, 1, 1,
-0.3043007, -1.90128, -4.161204, 1, 1, 1, 1, 1,
-0.3021602, 0.8437116, -0.9040724, 1, 1, 1, 1, 1,
-0.3003174, 0.6931879, -1.852436, 1, 1, 1, 1, 1,
-0.2965778, 0.02224679, -1.325208, 1, 1, 1, 1, 1,
-0.2960435, 0.326663, -0.1372894, 1, 1, 1, 1, 1,
-0.287836, 0.8503889, -0.8392552, 0, 0, 1, 1, 1,
-0.2865337, -0.8807796, -1.791199, 1, 0, 0, 1, 1,
-0.2862143, 1.032761, -0.3326617, 1, 0, 0, 1, 1,
-0.2856815, 0.6225538, 1.13116, 1, 0, 0, 1, 1,
-0.2843908, 0.2166263, -3.942526, 1, 0, 0, 1, 1,
-0.2824617, -0.3997267, -1.665418, 1, 0, 0, 1, 1,
-0.2771529, -0.6146095, -2.648541, 0, 0, 0, 1, 1,
-0.2768363, -1.644475, -4.59933, 0, 0, 0, 1, 1,
-0.2760214, 0.09012607, -0.8058988, 0, 0, 0, 1, 1,
-0.2720884, -0.2135051, -2.243595, 0, 0, 0, 1, 1,
-0.264257, -1.605546, -3.306112, 0, 0, 0, 1, 1,
-0.2630907, -0.1017103, -0.9631093, 0, 0, 0, 1, 1,
-0.2629465, -0.61813, -5.153388, 0, 0, 0, 1, 1,
-0.2602073, -1.587341, -1.928846, 1, 1, 1, 1, 1,
-0.2596934, 1.830658, -0.4722957, 1, 1, 1, 1, 1,
-0.2595972, 2.626995, -1.650706, 1, 1, 1, 1, 1,
-0.2591347, -0.4287858, -2.068949, 1, 1, 1, 1, 1,
-0.2572004, 0.8409614, -0.4320878, 1, 1, 1, 1, 1,
-0.2543764, -1.048795, -2.249877, 1, 1, 1, 1, 1,
-0.2541613, 0.3816161, 0.1699558, 1, 1, 1, 1, 1,
-0.2460667, -1.311606, -4.066328, 1, 1, 1, 1, 1,
-0.2437652, -1.386383, -1.685893, 1, 1, 1, 1, 1,
-0.2361679, -0.05899161, -2.229854, 1, 1, 1, 1, 1,
-0.235802, 0.5301835, -1.140078, 1, 1, 1, 1, 1,
-0.2315887, -1.209484, -4.052498, 1, 1, 1, 1, 1,
-0.231277, -0.5720758, -2.006465, 1, 1, 1, 1, 1,
-0.231207, -1.767409, -3.104082, 1, 1, 1, 1, 1,
-0.2307607, -0.655025, -2.42272, 1, 1, 1, 1, 1,
-0.2273137, 1.0105, 0.06667468, 0, 0, 1, 1, 1,
-0.2249745, 1.198437, 0.5724695, 1, 0, 0, 1, 1,
-0.2192462, 0.7354029, -1.07347, 1, 0, 0, 1, 1,
-0.2190406, 0.5409259, 0.4321452, 1, 0, 0, 1, 1,
-0.2152462, -0.5331032, -3.403376, 1, 0, 0, 1, 1,
-0.2090978, 0.4604569, -0.2330222, 1, 0, 0, 1, 1,
-0.2064197, -0.3220922, -1.618434, 0, 0, 0, 1, 1,
-0.1937038, 0.7022916, -0.5866292, 0, 0, 0, 1, 1,
-0.1871936, -0.1764783, -1.921557, 0, 0, 0, 1, 1,
-0.1848378, -0.06304629, -3.704395, 0, 0, 0, 1, 1,
-0.1821557, 1.67834, -0.325985, 0, 0, 0, 1, 1,
-0.1816536, 1.056644, -0.4689834, 0, 0, 0, 1, 1,
-0.1738154, 1.242717, -1.436043, 0, 0, 0, 1, 1,
-0.1709722, -0.07487649, -2.086855, 1, 1, 1, 1, 1,
-0.1697226, -0.4713046, -3.880648, 1, 1, 1, 1, 1,
-0.1679923, 0.04824212, -2.382805, 1, 1, 1, 1, 1,
-0.1657547, -0.6553962, -3.630544, 1, 1, 1, 1, 1,
-0.1604937, -1.901103, -2.456374, 1, 1, 1, 1, 1,
-0.1595169, -0.9753444, -2.502724, 1, 1, 1, 1, 1,
-0.1588755, -0.1105199, -3.059928, 1, 1, 1, 1, 1,
-0.1568637, -0.5184184, -3.468462, 1, 1, 1, 1, 1,
-0.1531992, -0.05613436, -1.711738, 1, 1, 1, 1, 1,
-0.1505937, 0.6804667, 0.9455646, 1, 1, 1, 1, 1,
-0.1479636, 0.5163457, -0.107293, 1, 1, 1, 1, 1,
-0.1466716, 0.8408777, -0.0850966, 1, 1, 1, 1, 1,
-0.1465672, -1.015175, -3.20099, 1, 1, 1, 1, 1,
-0.1424669, -0.8057069, -1.587526, 1, 1, 1, 1, 1,
-0.1397132, 1.373868, -0.6175029, 1, 1, 1, 1, 1,
-0.1358875, 0.7379944, -0.01927443, 0, 0, 1, 1, 1,
-0.1351734, -0.2948468, -1.253461, 1, 0, 0, 1, 1,
-0.1326746, 1.832049, 0.06647536, 1, 0, 0, 1, 1,
-0.1312944, -0.8236102, -2.344091, 1, 0, 0, 1, 1,
-0.1266166, -1.284727, -2.563032, 1, 0, 0, 1, 1,
-0.1236917, -0.8273191, -1.871355, 1, 0, 0, 1, 1,
-0.1225901, 0.8886918, -0.0549031, 0, 0, 0, 1, 1,
-0.1180466, -0.09211268, -2.333773, 0, 0, 0, 1, 1,
-0.1143761, -0.7379934, -4.393632, 0, 0, 0, 1, 1,
-0.1122743, 0.2860943, 0.2188162, 0, 0, 0, 1, 1,
-0.106797, 0.103703, 0.05136738, 0, 0, 0, 1, 1,
-0.1034869, -0.1667779, -2.875103, 0, 0, 0, 1, 1,
-0.0996187, 0.7517566, 0.6464927, 0, 0, 0, 1, 1,
-0.09027099, 0.1656294, -1.013144, 1, 1, 1, 1, 1,
-0.08637282, -1.352438, -3.379108, 1, 1, 1, 1, 1,
-0.08499001, -1.543519, -2.859338, 1, 1, 1, 1, 1,
-0.08022888, 0.3873035, -0.8299189, 1, 1, 1, 1, 1,
-0.07759665, 0.07694004, -0.9278773, 1, 1, 1, 1, 1,
-0.07441913, 0.1498317, 1.0594, 1, 1, 1, 1, 1,
-0.06975829, -2.702547, -2.637064, 1, 1, 1, 1, 1,
-0.06851291, 0.5909177, 0.5152972, 1, 1, 1, 1, 1,
-0.06733451, 0.2950378, -1.212945, 1, 1, 1, 1, 1,
-0.06045159, 0.07090107, -1.023271, 1, 1, 1, 1, 1,
-0.05517154, -0.3145812, -2.206506, 1, 1, 1, 1, 1,
-0.05311988, 0.09794184, -0.7920494, 1, 1, 1, 1, 1,
-0.0522261, -0.4776581, -4.256682, 1, 1, 1, 1, 1,
-0.04890094, -0.5250055, -1.420012, 1, 1, 1, 1, 1,
-0.0451255, 0.07578637, -0.8145943, 1, 1, 1, 1, 1,
-0.04308709, 0.08367594, -0.9288949, 0, 0, 1, 1, 1,
-0.03486179, 0.9619579, 0.1937235, 1, 0, 0, 1, 1,
-0.02845619, 0.1872943, -0.7465982, 1, 0, 0, 1, 1,
-0.0280103, -2.54408, -3.481533, 1, 0, 0, 1, 1,
-0.02773071, 1.207365, 0.267705, 1, 0, 0, 1, 1,
-0.02062189, -1.736902, -4.189888, 1, 0, 0, 1, 1,
-0.01901023, 0.4875779, 1.373231, 0, 0, 0, 1, 1,
-0.01704286, -0.5290342, -2.748965, 0, 0, 0, 1, 1,
-0.01636848, -0.4270152, -3.020915, 0, 0, 0, 1, 1,
-0.01595714, 0.2320742, 0.4153633, 0, 0, 0, 1, 1,
-0.01241731, 0.8162925, 0.3282446, 0, 0, 0, 1, 1,
-0.01221956, 0.9461653, 0.002370846, 0, 0, 0, 1, 1,
-0.01170563, -1.41024, -3.600687, 0, 0, 0, 1, 1,
-0.009551422, -0.02292735, -2.490514, 1, 1, 1, 1, 1,
-0.009058639, -1.077213, -2.177199, 1, 1, 1, 1, 1,
-0.008299951, 1.455775, -1.9981, 1, 1, 1, 1, 1,
-0.008082542, -1.329013, -4.922771, 1, 1, 1, 1, 1,
-0.005726649, 0.2905291, 0.4974067, 1, 1, 1, 1, 1,
-0.001561685, 0.9017618, 0.3411494, 1, 1, 1, 1, 1,
0.003714036, -0.5140381, 2.424788, 1, 1, 1, 1, 1,
0.00404306, 2.057376, -0.2595311, 1, 1, 1, 1, 1,
0.008488304, 0.1799438, 0.6305853, 1, 1, 1, 1, 1,
0.0125235, 1.638266, -0.4944293, 1, 1, 1, 1, 1,
0.01475009, 0.7388723, 2.599985, 1, 1, 1, 1, 1,
0.01480001, -1.883958, 2.737001, 1, 1, 1, 1, 1,
0.01529758, 0.9198747, -0.5582647, 1, 1, 1, 1, 1,
0.01658201, 0.7508548, 1.500473, 1, 1, 1, 1, 1,
0.02768533, -1.035074, 2.701779, 1, 1, 1, 1, 1,
0.02770746, 0.4160125, 0.01689292, 0, 0, 1, 1, 1,
0.02934301, -0.1900621, 3.394179, 1, 0, 0, 1, 1,
0.03656332, 0.2791275, -0.8014284, 1, 0, 0, 1, 1,
0.03669173, 1.069439, 1.202587, 1, 0, 0, 1, 1,
0.04001299, -0.3114099, 1.63098, 1, 0, 0, 1, 1,
0.04477377, -0.3641044, 1.644287, 1, 0, 0, 1, 1,
0.05109272, -0.8951162, 3.602995, 0, 0, 0, 1, 1,
0.05123432, 1.408649, 1.843066, 0, 0, 0, 1, 1,
0.0563504, 0.06366207, 0.938437, 0, 0, 0, 1, 1,
0.05679478, 2.530264, -0.3785869, 0, 0, 0, 1, 1,
0.06462616, -1.043411, 2.579158, 0, 0, 0, 1, 1,
0.06662586, -0.8363565, 3.832932, 0, 0, 0, 1, 1,
0.07122137, -0.8054966, 3.293969, 0, 0, 0, 1, 1,
0.07324808, 0.9470885, 2.159075, 1, 1, 1, 1, 1,
0.07414251, -0.239549, 3.2346, 1, 1, 1, 1, 1,
0.07493407, -0.7707786, 2.691292, 1, 1, 1, 1, 1,
0.07547724, -0.1606104, 4.504466, 1, 1, 1, 1, 1,
0.07933149, -0.9539148, 2.815308, 1, 1, 1, 1, 1,
0.08029278, 1.482474, -2.466017, 1, 1, 1, 1, 1,
0.08083449, 0.8962193, -0.3085332, 1, 1, 1, 1, 1,
0.08178637, -0.2839865, 3.775773, 1, 1, 1, 1, 1,
0.08749249, 0.7858396, -0.4236864, 1, 1, 1, 1, 1,
0.08892317, 2.094717, 0.8923941, 1, 1, 1, 1, 1,
0.09000094, -0.7683703, 1.382251, 1, 1, 1, 1, 1,
0.0959586, -0.1281547, 3.998305, 1, 1, 1, 1, 1,
0.09815113, 1.608087, -0.6752865, 1, 1, 1, 1, 1,
0.09819882, -1.646752, 1.338931, 1, 1, 1, 1, 1,
0.09865786, 1.179061, 0.2525558, 1, 1, 1, 1, 1,
0.09914801, -0.02890128, 1.185432, 0, 0, 1, 1, 1,
0.10267, -0.2984207, 3.292971, 1, 0, 0, 1, 1,
0.1030651, -0.6669745, 3.247391, 1, 0, 0, 1, 1,
0.1034186, 0.6104149, -1.077191, 1, 0, 0, 1, 1,
0.1044082, -1.048988, 4.215002, 1, 0, 0, 1, 1,
0.1068733, 1.117568, 0.2227554, 1, 0, 0, 1, 1,
0.109728, -1.129296, 4.044088, 0, 0, 0, 1, 1,
0.1152547, 0.1824534, -0.1172759, 0, 0, 0, 1, 1,
0.117582, 1.594902, -0.1294405, 0, 0, 0, 1, 1,
0.1181962, -1.766205, 4.347031, 0, 0, 0, 1, 1,
0.1183205, 1.44988, -0.9783853, 0, 0, 0, 1, 1,
0.1204062, 0.6044471, 0.6867238, 0, 0, 0, 1, 1,
0.1216603, 0.6504681, -0.8411788, 0, 0, 0, 1, 1,
0.1288742, -0.4828604, 2.519679, 1, 1, 1, 1, 1,
0.129643, 1.720955, -0.3242561, 1, 1, 1, 1, 1,
0.1334442, 1.773278, -0.01101805, 1, 1, 1, 1, 1,
0.1385995, 0.05565775, 0.4048758, 1, 1, 1, 1, 1,
0.1394936, -0.7061679, 2.241336, 1, 1, 1, 1, 1,
0.1401641, -0.922372, 2.71871, 1, 1, 1, 1, 1,
0.1409233, -1.333498, 2.228598, 1, 1, 1, 1, 1,
0.1455436, -2.534382, 2.53856, 1, 1, 1, 1, 1,
0.1484368, 0.3895628, -0.6447906, 1, 1, 1, 1, 1,
0.149147, 0.6512795, -0.7508876, 1, 1, 1, 1, 1,
0.1496474, -0.6688629, 3.414656, 1, 1, 1, 1, 1,
0.1511097, -0.9526052, 1.515278, 1, 1, 1, 1, 1,
0.1629482, -0.9871737, 3.691686, 1, 1, 1, 1, 1,
0.1633792, 1.24535, 1.017613, 1, 1, 1, 1, 1,
0.1652163, -1.732376, 4.713339, 1, 1, 1, 1, 1,
0.1677081, 0.3986541, -0.6746236, 0, 0, 1, 1, 1,
0.1709273, -0.8953205, 1.803665, 1, 0, 0, 1, 1,
0.1723142, 0.1254204, -0.6506402, 1, 0, 0, 1, 1,
0.1731899, -0.3125123, 1.048216, 1, 0, 0, 1, 1,
0.1739525, -2.024258, 3.725119, 1, 0, 0, 1, 1,
0.1756297, -0.5594124, 1.641523, 1, 0, 0, 1, 1,
0.1843586, -1.313329, 1.805906, 0, 0, 0, 1, 1,
0.1846901, -0.2548984, 1.685413, 0, 0, 0, 1, 1,
0.190125, -0.4023113, 2.16542, 0, 0, 0, 1, 1,
0.1927963, 1.177984, 2.283476, 0, 0, 0, 1, 1,
0.1941761, -1.093576, 2.687638, 0, 0, 0, 1, 1,
0.1945188, -0.941808, 2.164233, 0, 0, 0, 1, 1,
0.1970187, -0.4179448, 2.895138, 0, 0, 0, 1, 1,
0.2040538, 0.01834582, 2.360564, 1, 1, 1, 1, 1,
0.2047614, -0.4361627, 1.701775, 1, 1, 1, 1, 1,
0.2107301, -0.5629346, 1.695184, 1, 1, 1, 1, 1,
0.2108835, 1.504431, 1.268427, 1, 1, 1, 1, 1,
0.2133948, -0.3294057, 0.8629284, 1, 1, 1, 1, 1,
0.2157109, 0.2009801, 2.130179, 1, 1, 1, 1, 1,
0.2162928, 0.1989876, 0.4432946, 1, 1, 1, 1, 1,
0.2185177, -1.056019, 3.961225, 1, 1, 1, 1, 1,
0.2194692, 0.09337436, 0.8650428, 1, 1, 1, 1, 1,
0.2205284, 2.047126, -0.746461, 1, 1, 1, 1, 1,
0.2225841, 1.451243, -1.193112, 1, 1, 1, 1, 1,
0.2248425, -1.164559, 3.824025, 1, 1, 1, 1, 1,
0.2257329, 0.8466582, 0.9516198, 1, 1, 1, 1, 1,
0.2268652, -1.100152, 1.535499, 1, 1, 1, 1, 1,
0.2299176, -0.05468487, 2.900531, 1, 1, 1, 1, 1,
0.2303934, 0.1925299, 1.437526, 0, 0, 1, 1, 1,
0.2389468, -1.332262, 3.144235, 1, 0, 0, 1, 1,
0.2404261, 0.7068983, 1.299467, 1, 0, 0, 1, 1,
0.2420428, 1.696968, 0.6562138, 1, 0, 0, 1, 1,
0.2421589, 0.001963379, -0.1041206, 1, 0, 0, 1, 1,
0.2446557, 1.180898, -0.7376712, 1, 0, 0, 1, 1,
0.2459862, -1.400282, 2.081688, 0, 0, 0, 1, 1,
0.2460342, 0.0127403, -0.1533173, 0, 0, 0, 1, 1,
0.2513963, -0.2149093, 3.548887, 0, 0, 0, 1, 1,
0.2514105, 0.4315286, 1.007797, 0, 0, 0, 1, 1,
0.2525334, -0.6416754, 3.236338, 0, 0, 0, 1, 1,
0.2527775, -0.496438, 1.540639, 0, 0, 0, 1, 1,
0.2546007, -0.7807366, 2.856497, 0, 0, 0, 1, 1,
0.2571425, 1.31249, 0.8498152, 1, 1, 1, 1, 1,
0.2580228, -0.3439671, 3.195642, 1, 1, 1, 1, 1,
0.2585136, -0.3527139, 2.907706, 1, 1, 1, 1, 1,
0.2641995, 0.7955539, 1.173223, 1, 1, 1, 1, 1,
0.2643799, 0.2260219, -0.6312857, 1, 1, 1, 1, 1,
0.2657881, 0.814767, -0.2569956, 1, 1, 1, 1, 1,
0.2726316, 0.6150707, 1.330126, 1, 1, 1, 1, 1,
0.2775793, 0.3574451, 1.61438, 1, 1, 1, 1, 1,
0.2794628, 1.141152, 0.9266362, 1, 1, 1, 1, 1,
0.2878505, -2.038005, 1.566936, 1, 1, 1, 1, 1,
0.2925125, -0.5037529, 3.639215, 1, 1, 1, 1, 1,
0.2937859, 0.8970317, 0.6035916, 1, 1, 1, 1, 1,
0.2943821, -0.8242377, 3.482659, 1, 1, 1, 1, 1,
0.3004235, 0.06812368, 1.201276, 1, 1, 1, 1, 1,
0.3016516, 0.6793142, 1.237843, 1, 1, 1, 1, 1,
0.3042891, 0.2955773, 1.52914, 0, 0, 1, 1, 1,
0.3103721, -0.2980424, 4.49309, 1, 0, 0, 1, 1,
0.3120962, 0.7090251, -0.7020753, 1, 0, 0, 1, 1,
0.3123866, -0.5203886, 1.242427, 1, 0, 0, 1, 1,
0.3155901, 0.3624627, 0.557961, 1, 0, 0, 1, 1,
0.3257473, 0.4902644, 1.812835, 1, 0, 0, 1, 1,
0.3264485, 0.04089326, 0.7681391, 0, 0, 0, 1, 1,
0.3290536, 0.5881446, 0.791314, 0, 0, 0, 1, 1,
0.3314083, -1.491768, 2.303526, 0, 0, 0, 1, 1,
0.3315747, -0.8657523, 3.223451, 0, 0, 0, 1, 1,
0.3327742, -0.01077502, 3.654235, 0, 0, 0, 1, 1,
0.3338254, 0.4939825, 1.899652, 0, 0, 0, 1, 1,
0.3346291, 1.074718, -1.704922, 0, 0, 0, 1, 1,
0.3347251, -1.181867, 3.70332, 1, 1, 1, 1, 1,
0.3373523, 0.05726999, 0.862919, 1, 1, 1, 1, 1,
0.343844, -0.2247753, 2.735715, 1, 1, 1, 1, 1,
0.3446909, -1.07915, 3.546748, 1, 1, 1, 1, 1,
0.3447975, -0.5405335, 2.051182, 1, 1, 1, 1, 1,
0.3459128, 1.882642, 0.3940397, 1, 1, 1, 1, 1,
0.3483596, 0.2374588, 0.5800583, 1, 1, 1, 1, 1,
0.3498784, -0.4050176, 1.285802, 1, 1, 1, 1, 1,
0.354605, 0.821554, 0.2809895, 1, 1, 1, 1, 1,
0.3548062, -0.266574, 1.647033, 1, 1, 1, 1, 1,
0.3548295, -1.391651, 3.80133, 1, 1, 1, 1, 1,
0.3569352, -1.203854, 2.165002, 1, 1, 1, 1, 1,
0.3581818, -0.1719971, 2.18374, 1, 1, 1, 1, 1,
0.3584929, -0.395173, -0.3407594, 1, 1, 1, 1, 1,
0.3634847, 1.80438, -0.2457534, 1, 1, 1, 1, 1,
0.3693134, 0.0136344, 2.398618, 0, 0, 1, 1, 1,
0.3695144, -0.1584504, 2.079859, 1, 0, 0, 1, 1,
0.3749044, 1.332454, 1.045607, 1, 0, 0, 1, 1,
0.3796559, 1.365298, 0.3514779, 1, 0, 0, 1, 1,
0.3809647, 0.2315071, -0.02293616, 1, 0, 0, 1, 1,
0.3836246, 0.5685825, -1.460021, 1, 0, 0, 1, 1,
0.3878867, 0.5077908, 0.8733296, 0, 0, 0, 1, 1,
0.3879268, 0.8638948, 0.08753004, 0, 0, 0, 1, 1,
0.3902141, 1.673454, -0.5509708, 0, 0, 0, 1, 1,
0.3920071, 0.9399965, -0.7097245, 0, 0, 0, 1, 1,
0.3962983, -0.4092594, 1.414978, 0, 0, 0, 1, 1,
0.3998517, 0.760444, 0.8904404, 0, 0, 0, 1, 1,
0.4002806, 1.099364, 1.18839, 0, 0, 0, 1, 1,
0.40154, -0.06681524, 0.3443822, 1, 1, 1, 1, 1,
0.4015462, -0.0571436, 2.043617, 1, 1, 1, 1, 1,
0.4015572, 0.8030932, 2.711691, 1, 1, 1, 1, 1,
0.4094293, 0.4086313, 0.6550661, 1, 1, 1, 1, 1,
0.4116564, 1.036917, 0.6708509, 1, 1, 1, 1, 1,
0.4125805, -0.9914289, 2.9235, 1, 1, 1, 1, 1,
0.4179889, -0.3009052, 2.730866, 1, 1, 1, 1, 1,
0.4221284, -0.04886043, 3.584745, 1, 1, 1, 1, 1,
0.4239127, 0.2476551, 1.308905, 1, 1, 1, 1, 1,
0.4296851, -0.4737639, 2.122049, 1, 1, 1, 1, 1,
0.4312955, 0.1207937, 1.3832, 1, 1, 1, 1, 1,
0.4357131, -0.6833306, 2.029852, 1, 1, 1, 1, 1,
0.4363038, 0.6138543, 0.1636614, 1, 1, 1, 1, 1,
0.438976, -0.4668559, 2.159472, 1, 1, 1, 1, 1,
0.4491614, -1.260472, 2.502794, 1, 1, 1, 1, 1,
0.4523951, 0.1273922, 0.4949328, 0, 0, 1, 1, 1,
0.4525727, -1.486712, 1.743408, 1, 0, 0, 1, 1,
0.4583609, -0.3654982, 1.783893, 1, 0, 0, 1, 1,
0.4669999, -0.1792451, 2.039811, 1, 0, 0, 1, 1,
0.4714112, -0.9883218, 3.188636, 1, 0, 0, 1, 1,
0.4734986, 0.434092, 0.8889678, 1, 0, 0, 1, 1,
0.4744634, 0.08783047, 1.497132, 0, 0, 0, 1, 1,
0.4780273, 1.152722, 0.7955321, 0, 0, 0, 1, 1,
0.4857087, 0.791477, 1.079232, 0, 0, 0, 1, 1,
0.4882239, -0.6065795, 3.000926, 0, 0, 0, 1, 1,
0.4906496, 0.6113737, -0.2195422, 0, 0, 0, 1, 1,
0.4982835, 1.394121, 1.397032, 0, 0, 0, 1, 1,
0.4986794, -0.1024457, 2.276386, 0, 0, 0, 1, 1,
0.500139, -0.3467624, 1.89922, 1, 1, 1, 1, 1,
0.5003671, 1.71126, 0.6873788, 1, 1, 1, 1, 1,
0.5059563, 0.9547412, -0.2709334, 1, 1, 1, 1, 1,
0.5082108, 0.6287231, 0.1949047, 1, 1, 1, 1, 1,
0.5097374, -0.8368474, 3.281257, 1, 1, 1, 1, 1,
0.5110385, -0.05360245, 2.3989, 1, 1, 1, 1, 1,
0.5185068, -2.09048, 4.509161, 1, 1, 1, 1, 1,
0.5188352, 0.0448212, 2.800287, 1, 1, 1, 1, 1,
0.5193572, -0.7388397, 2.517656, 1, 1, 1, 1, 1,
0.5194274, 0.1821068, 0.5219361, 1, 1, 1, 1, 1,
0.5202709, 0.4561018, 0.5898826, 1, 1, 1, 1, 1,
0.5211042, -0.5124878, 4.338076, 1, 1, 1, 1, 1,
0.5248204, -1.465848, 2.314039, 1, 1, 1, 1, 1,
0.5255764, 0.7698718, -0.1962059, 1, 1, 1, 1, 1,
0.52683, -0.1446833, 3.370354, 1, 1, 1, 1, 1,
0.5272818, -0.01057717, 0.572293, 0, 0, 1, 1, 1,
0.5326716, 0.7480057, 1.3945, 1, 0, 0, 1, 1,
0.535355, 0.7651075, 1.110243, 1, 0, 0, 1, 1,
0.5356571, 0.6354431, -0.1708833, 1, 0, 0, 1, 1,
0.5377249, 0.7157695, -0.4844311, 1, 0, 0, 1, 1,
0.5423557, 0.07262493, 1.671333, 1, 0, 0, 1, 1,
0.5426005, 1.251558, 2.49174, 0, 0, 0, 1, 1,
0.5460857, 0.5196339, 0.08949146, 0, 0, 0, 1, 1,
0.546796, 0.6825101, 0.1676154, 0, 0, 0, 1, 1,
0.5488939, -1.061501, 3.052775, 0, 0, 0, 1, 1,
0.5491905, 0.496978, 1.475546, 0, 0, 0, 1, 1,
0.5553102, -0.3436585, 0.7166539, 0, 0, 0, 1, 1,
0.556273, -1.095628, 3.323433, 0, 0, 0, 1, 1,
0.5572723, -0.57121, 0.7917821, 1, 1, 1, 1, 1,
0.5593266, -0.1760356, 2.243423, 1, 1, 1, 1, 1,
0.5646334, 0.9723019, -1.740959, 1, 1, 1, 1, 1,
0.5662093, -0.1718909, 2.371232, 1, 1, 1, 1, 1,
0.5681447, -1.465533, 1.573847, 1, 1, 1, 1, 1,
0.569618, -1.333621, 3.542612, 1, 1, 1, 1, 1,
0.5725533, -0.5293808, 3.731858, 1, 1, 1, 1, 1,
0.5732768, 0.7022951, 0.2685115, 1, 1, 1, 1, 1,
0.5733839, -0.1050592, 1.870733, 1, 1, 1, 1, 1,
0.5745079, -0.4551937, 3.100545, 1, 1, 1, 1, 1,
0.5768728, -1.038112, 2.934066, 1, 1, 1, 1, 1,
0.5828393, 0.2077614, 1.211593, 1, 1, 1, 1, 1,
0.5853783, 0.3429614, 0.2910919, 1, 1, 1, 1, 1,
0.5859649, -0.07635571, 2.620086, 1, 1, 1, 1, 1,
0.5868217, -0.09243411, 0.7992002, 1, 1, 1, 1, 1,
0.5892268, -0.1897022, 1.276845, 0, 0, 1, 1, 1,
0.5946031, -0.1329086, 1.15531, 1, 0, 0, 1, 1,
0.5964502, -0.8950831, 4.239793, 1, 0, 0, 1, 1,
0.5990712, 0.3353778, 1.308855, 1, 0, 0, 1, 1,
0.6037146, 0.9318566, 0.645576, 1, 0, 0, 1, 1,
0.6110449, -0.08930595, 3.597596, 1, 0, 0, 1, 1,
0.6116989, -0.7095076, -0.05656208, 0, 0, 0, 1, 1,
0.6140047, -0.01664741, 3.201322, 0, 0, 0, 1, 1,
0.6141926, -0.8378625, 2.552866, 0, 0, 0, 1, 1,
0.615375, -0.1198922, 1.700232, 0, 0, 0, 1, 1,
0.6156946, -0.4897141, 1.026746, 0, 0, 0, 1, 1,
0.615802, -0.6002677, 1.639521, 0, 0, 0, 1, 1,
0.6175987, -0.5765296, 1.547462, 0, 0, 0, 1, 1,
0.6178887, 1.756413, 0.6485828, 1, 1, 1, 1, 1,
0.6185477, -0.02438639, 2.835659, 1, 1, 1, 1, 1,
0.6289171, 0.004823144, 0.796732, 1, 1, 1, 1, 1,
0.6337108, -0.9957261, 3.936063, 1, 1, 1, 1, 1,
0.6350565, -0.3792039, 2.285139, 1, 1, 1, 1, 1,
0.6440685, -1.227027, 3.395524, 1, 1, 1, 1, 1,
0.6470564, -0.3144013, 1.015054, 1, 1, 1, 1, 1,
0.6538278, 0.3791318, 2.104576, 1, 1, 1, 1, 1,
0.6583219, -0.4413654, 1.606583, 1, 1, 1, 1, 1,
0.6592335, 0.9100042, 0.94209, 1, 1, 1, 1, 1,
0.6605398, -1.718793, 1.809104, 1, 1, 1, 1, 1,
0.6652637, 0.6719775, 0.4104032, 1, 1, 1, 1, 1,
0.6667966, 0.2738656, -0.1148432, 1, 1, 1, 1, 1,
0.6723221, 0.5846658, 2.469005, 1, 1, 1, 1, 1,
0.6727073, 1.948349, 0.8569729, 1, 1, 1, 1, 1,
0.6732717, -0.3329846, 3.515695, 0, 0, 1, 1, 1,
0.6789016, -0.5424857, 0.1287251, 1, 0, 0, 1, 1,
0.6826714, 1.65135, -0.4622286, 1, 0, 0, 1, 1,
0.6846044, -0.9059645, 1.159419, 1, 0, 0, 1, 1,
0.6940016, -0.6301321, 0.3566109, 1, 0, 0, 1, 1,
0.6964911, 0.6624519, 2.831578, 1, 0, 0, 1, 1,
0.7007759, -2.043865, 1.903623, 0, 0, 0, 1, 1,
0.7067473, -2.449582, 1.20807, 0, 0, 0, 1, 1,
0.7086899, 0.2971389, 1.596121, 0, 0, 0, 1, 1,
0.7139059, 0.1404458, -0.3312174, 0, 0, 0, 1, 1,
0.7159411, -1.341996, 1.544727, 0, 0, 0, 1, 1,
0.7172452, -0.4947639, 1.328286, 0, 0, 0, 1, 1,
0.7174852, -0.1184067, 2.497893, 0, 0, 0, 1, 1,
0.7233906, -1.572978, 1.961287, 1, 1, 1, 1, 1,
0.7244643, -0.7682606, 1.341483, 1, 1, 1, 1, 1,
0.7283803, 0.03094355, 2.260368, 1, 1, 1, 1, 1,
0.7321163, -1.635967, 4.263465, 1, 1, 1, 1, 1,
0.73589, 0.3831298, 1.58321, 1, 1, 1, 1, 1,
0.7362811, 1.07905, 1.935601, 1, 1, 1, 1, 1,
0.7384822, 0.4485086, -1.210758, 1, 1, 1, 1, 1,
0.749015, 1.409465, 0.8925312, 1, 1, 1, 1, 1,
0.7553117, 1.300988, 0.6832735, 1, 1, 1, 1, 1,
0.757618, 1.35664, -0.09314936, 1, 1, 1, 1, 1,
0.7601175, 0.1567351, 0.8756009, 1, 1, 1, 1, 1,
0.7693512, -0.0487312, 2.610638, 1, 1, 1, 1, 1,
0.7716081, -0.5377927, 2.566135, 1, 1, 1, 1, 1,
0.7726309, -0.5939741, 1.586642, 1, 1, 1, 1, 1,
0.7760301, -0.841689, 3.517359, 1, 1, 1, 1, 1,
0.783369, 0.06206378, 1.272403, 0, 0, 1, 1, 1,
0.7931589, -0.08004948, 1.485212, 1, 0, 0, 1, 1,
0.7931938, -0.802034, 1.99122, 1, 0, 0, 1, 1,
0.7934158, -0.1548717, 1.932794, 1, 0, 0, 1, 1,
0.7936555, 1.068748, 0.6101384, 1, 0, 0, 1, 1,
0.7944849, -0.3303659, 2.812573, 1, 0, 0, 1, 1,
0.7974902, 0.4343205, 2.252656, 0, 0, 0, 1, 1,
0.7981556, -0.3848368, 1.232695, 0, 0, 0, 1, 1,
0.798798, -1.106725, 0.5397238, 0, 0, 0, 1, 1,
0.8021585, 0.2102437, 0.04387811, 0, 0, 0, 1, 1,
0.8058742, -1.432115, 2.637631, 0, 0, 0, 1, 1,
0.8080869, 0.04946015, 1.785592, 0, 0, 0, 1, 1,
0.8099276, 1.002548, 1.503343, 0, 0, 0, 1, 1,
0.8147644, -0.4433599, 2.727265, 1, 1, 1, 1, 1,
0.8166478, -1.387272, 2.801531, 1, 1, 1, 1, 1,
0.8180042, 0.04990765, 2.888055, 1, 1, 1, 1, 1,
0.8231122, 0.4695545, -0.1330124, 1, 1, 1, 1, 1,
0.8244081, -0.1814711, -0.8190312, 1, 1, 1, 1, 1,
0.8252079, -0.9743649, 2.837849, 1, 1, 1, 1, 1,
0.829259, -0.9687438, 1.125606, 1, 1, 1, 1, 1,
0.8308803, -0.7314733, 3.02896, 1, 1, 1, 1, 1,
0.8329371, 1.53484, -0.1570033, 1, 1, 1, 1, 1,
0.8370541, -0.4521504, 2.190644, 1, 1, 1, 1, 1,
0.840201, -0.551189, 1.890445, 1, 1, 1, 1, 1,
0.8406954, -2.048736, 3.946256, 1, 1, 1, 1, 1,
0.8407744, 1.573179, -0.5018962, 1, 1, 1, 1, 1,
0.8501412, 2.320754, -0.4518136, 1, 1, 1, 1, 1,
0.8507566, 0.4525493, 1.666603, 1, 1, 1, 1, 1,
0.8508619, 0.527377, 0.1011046, 0, 0, 1, 1, 1,
0.8516487, -0.2748853, 1.87228, 1, 0, 0, 1, 1,
0.8575385, 0.7331582, -0.3738914, 1, 0, 0, 1, 1,
0.8580799, 0.4605103, 0.07512885, 1, 0, 0, 1, 1,
0.863864, 0.7425724, 1.098738, 1, 0, 0, 1, 1,
0.8641179, 0.6222499, 1.273334, 1, 0, 0, 1, 1,
0.8653836, -1.090519, 3.789382, 0, 0, 0, 1, 1,
0.8689045, 0.7134332, 3.099379, 0, 0, 0, 1, 1,
0.871778, 0.3810725, -0.2752836, 0, 0, 0, 1, 1,
0.8773343, 0.9530883, 0.6067643, 0, 0, 0, 1, 1,
0.8780618, 1.352261, 1.566557, 0, 0, 0, 1, 1,
0.8787909, -0.2328121, 2.757852, 0, 0, 0, 1, 1,
0.8822869, -0.6563115, 1.944568, 0, 0, 0, 1, 1,
0.8839685, -0.8796237, 1.886995, 1, 1, 1, 1, 1,
0.8979488, -1.779526, 2.080747, 1, 1, 1, 1, 1,
0.8992812, -0.7731742, 2.394587, 1, 1, 1, 1, 1,
0.9007961, -2.591431, 4.070058, 1, 1, 1, 1, 1,
0.905205, -1.613939, 2.59246, 1, 1, 1, 1, 1,
0.9086558, -0.4196344, 1.073276, 1, 1, 1, 1, 1,
0.9133161, 1.859884, -1.216007, 1, 1, 1, 1, 1,
0.9153765, 0.9588503, 0.1514118, 1, 1, 1, 1, 1,
0.9184574, 0.725086, 1.181336, 1, 1, 1, 1, 1,
0.9191825, 0.3421565, 1.940656, 1, 1, 1, 1, 1,
0.9206815, 0.385236, 1.577836, 1, 1, 1, 1, 1,
0.9214971, 2.525256, 1.438356, 1, 1, 1, 1, 1,
0.9241587, 0.1993067, 1.517383, 1, 1, 1, 1, 1,
0.9279272, -0.2738929, 1.636763, 1, 1, 1, 1, 1,
0.928894, 0.01969583, 0.7536303, 1, 1, 1, 1, 1,
0.9432173, 0.1401359, 0.5489684, 0, 0, 1, 1, 1,
0.9564126, -0.7044805, 0.9612756, 1, 0, 0, 1, 1,
0.9577045, -0.1749068, 1.305047, 1, 0, 0, 1, 1,
0.9589975, -1.135473, 4.334941, 1, 0, 0, 1, 1,
0.9597429, -0.4759629, 1.239711, 1, 0, 0, 1, 1,
0.9622371, -0.7612306, 1.422174, 1, 0, 0, 1, 1,
0.963578, -0.5328544, 2.772737, 0, 0, 0, 1, 1,
0.9712113, -0.512006, 3.404577, 0, 0, 0, 1, 1,
0.9793411, 0.5250847, 0.07029352, 0, 0, 0, 1, 1,
0.9844899, 1.10759, 0.6456012, 0, 0, 0, 1, 1,
0.9885218, 1.238933, 1.283152, 0, 0, 0, 1, 1,
0.9954396, -0.2150689, -0.02332029, 0, 0, 0, 1, 1,
0.9983094, 0.7948323, 1.217832, 0, 0, 0, 1, 1,
1.000788, -1.257476, 2.260326, 1, 1, 1, 1, 1,
1.001391, 2.098774, -0.2308818, 1, 1, 1, 1, 1,
1.004516, 0.6966598, 1.159875, 1, 1, 1, 1, 1,
1.005708, 0.6384181, 0.224204, 1, 1, 1, 1, 1,
1.013359, -0.8079118, 1.79151, 1, 1, 1, 1, 1,
1.014838, 0.3946321, 0.7749423, 1, 1, 1, 1, 1,
1.030332, -0.5849634, 2.071355, 1, 1, 1, 1, 1,
1.03428, -1.102091, 1.468395, 1, 1, 1, 1, 1,
1.045473, 1.460303, 0.2095633, 1, 1, 1, 1, 1,
1.056666, 0.2684363, 3.038228, 1, 1, 1, 1, 1,
1.067218, 0.2264008, 2.628374, 1, 1, 1, 1, 1,
1.067723, -0.6412316, 2.303076, 1, 1, 1, 1, 1,
1.071313, -0.531452, 1.97713, 1, 1, 1, 1, 1,
1.078365, -0.01685553, 2.249315, 1, 1, 1, 1, 1,
1.080651, 0.1109434, 2.580857, 1, 1, 1, 1, 1,
1.082943, 1.152315, 1.698936, 0, 0, 1, 1, 1,
1.084567, 1.155612, 1.09446, 1, 0, 0, 1, 1,
1.09454, 1.054677, 0.1953691, 1, 0, 0, 1, 1,
1.099951, -0.08080552, 2.746377, 1, 0, 0, 1, 1,
1.10334, -0.5667562, 3.070358, 1, 0, 0, 1, 1,
1.111019, 1.490301, 0.9082435, 1, 0, 0, 1, 1,
1.121115, -0.2524965, 1.15916, 0, 0, 0, 1, 1,
1.12557, 0.3257818, -0.3349281, 0, 0, 0, 1, 1,
1.13355, 0.3893372, 0.6164001, 0, 0, 0, 1, 1,
1.13496, -1.126829, 3.117535, 0, 0, 0, 1, 1,
1.146171, -0.1905839, 1.258987, 0, 0, 0, 1, 1,
1.15566, 0.565142, 0.8273986, 0, 0, 0, 1, 1,
1.156093, -1.76884, 4.021691, 0, 0, 0, 1, 1,
1.163347, -0.325101, 4.037028, 1, 1, 1, 1, 1,
1.17343, -0.4662612, 3.157021, 1, 1, 1, 1, 1,
1.173951, -0.244299, 0.8592977, 1, 1, 1, 1, 1,
1.180999, 0.04947674, 1.107167, 1, 1, 1, 1, 1,
1.184732, -2.0936, 1.230724, 1, 1, 1, 1, 1,
1.19199, 0.7687023, 0.409159, 1, 1, 1, 1, 1,
1.196839, 0.6067533, 0.2275021, 1, 1, 1, 1, 1,
1.215501, -0.7041758, 1.438102, 1, 1, 1, 1, 1,
1.218042, 0.8386283, 1.573734, 1, 1, 1, 1, 1,
1.218564, -0.140795, 0.8672152, 1, 1, 1, 1, 1,
1.229086, -1.239601, 3.015004, 1, 1, 1, 1, 1,
1.235856, 1.108618, 1.057266, 1, 1, 1, 1, 1,
1.239992, 1.188799, 0.8742769, 1, 1, 1, 1, 1,
1.240453, 0.5703212, 1.768018, 1, 1, 1, 1, 1,
1.240532, -0.1429439, 0.9514004, 1, 1, 1, 1, 1,
1.242123, -0.06539596, 1.729214, 0, 0, 1, 1, 1,
1.247334, 0.1282009, 0.7268846, 1, 0, 0, 1, 1,
1.25354, -0.07349363, 1.176427, 1, 0, 0, 1, 1,
1.256016, 1.633658, 1.3375, 1, 0, 0, 1, 1,
1.257647, -0.200636, 2.539887, 1, 0, 0, 1, 1,
1.261114, -2.226178, 1.868825, 1, 0, 0, 1, 1,
1.266627, 0.9673397, 1.299697, 0, 0, 0, 1, 1,
1.270562, -1.315855, 1.23417, 0, 0, 0, 1, 1,
1.280746, 1.790704, 0.4853067, 0, 0, 0, 1, 1,
1.285088, -1.062123, 1.978796, 0, 0, 0, 1, 1,
1.2918, 1.326484, 2.354839, 0, 0, 0, 1, 1,
1.297801, -1.163019, 2.232576, 0, 0, 0, 1, 1,
1.30944, -1.322975, 2.346932, 0, 0, 0, 1, 1,
1.311193, -0.2080161, 1.283067, 1, 1, 1, 1, 1,
1.325831, -0.8866179, 2.073939, 1, 1, 1, 1, 1,
1.327608, -1.477668, 3.482661, 1, 1, 1, 1, 1,
1.340592, 1.078791, -1.016834, 1, 1, 1, 1, 1,
1.357131, -0.3741906, 4.434286, 1, 1, 1, 1, 1,
1.364467, -0.973798, 3.266114, 1, 1, 1, 1, 1,
1.369677, -1.380998, 2.325275, 1, 1, 1, 1, 1,
1.374454, 1.246992, 0.3252294, 1, 1, 1, 1, 1,
1.405042, -1.069276, 2.371531, 1, 1, 1, 1, 1,
1.405695, -0.7122216, 2.563251, 1, 1, 1, 1, 1,
1.40972, 0.3878634, 0.6494779, 1, 1, 1, 1, 1,
1.417282, 0.8470708, -0.373612, 1, 1, 1, 1, 1,
1.428073, 0.2563824, 3.128683, 1, 1, 1, 1, 1,
1.43064, 1.118066, 0.4497936, 1, 1, 1, 1, 1,
1.439795, -0.3477869, 2.785847, 1, 1, 1, 1, 1,
1.447976, -0.5192115, 2.877375, 0, 0, 1, 1, 1,
1.451872, 0.9726995, -1.209054, 1, 0, 0, 1, 1,
1.454721, -0.8593485, 3.801232, 1, 0, 0, 1, 1,
1.457298, -0.1605505, 2.167039, 1, 0, 0, 1, 1,
1.462901, -0.01739592, 1.638619, 1, 0, 0, 1, 1,
1.476287, -0.01309113, -0.4138892, 1, 0, 0, 1, 1,
1.476808, -0.03909197, 3.213944, 0, 0, 0, 1, 1,
1.480828, -1.488941, 3.025493, 0, 0, 0, 1, 1,
1.484543, 0.4764264, 0.7172299, 0, 0, 0, 1, 1,
1.530789, -0.3676299, 2.743611, 0, 0, 0, 1, 1,
1.538167, 0.2188866, 0.351623, 0, 0, 0, 1, 1,
1.53894, 0.05786538, 0.9449891, 0, 0, 0, 1, 1,
1.544814, -0.3159355, 1.784299, 0, 0, 0, 1, 1,
1.580495, -0.7530831, 3.878817, 1, 1, 1, 1, 1,
1.593697, 0.01298242, 1.447763, 1, 1, 1, 1, 1,
1.623735, -0.111473, 0.7323065, 1, 1, 1, 1, 1,
1.633377, 0.4325392, 2.34824, 1, 1, 1, 1, 1,
1.641161, -0.1550744, -1.18641, 1, 1, 1, 1, 1,
1.64237, -0.1503435, 2.160627, 1, 1, 1, 1, 1,
1.64846, 1.465349, 1.535083, 1, 1, 1, 1, 1,
1.665135, 0.1471871, 2.527093, 1, 1, 1, 1, 1,
1.668398, -1.184874, 2.608713, 1, 1, 1, 1, 1,
1.683087, -0.1654707, 2.709844, 1, 1, 1, 1, 1,
1.683604, -0.09129748, 1.384627, 1, 1, 1, 1, 1,
1.69709, -0.2549075, 1.714686, 1, 1, 1, 1, 1,
1.7149, 0.08292967, 2.680772, 1, 1, 1, 1, 1,
1.723012, 0.06201712, 0.549727, 1, 1, 1, 1, 1,
1.72376, 0.1240585, 0.4331959, 1, 1, 1, 1, 1,
1.738654, -0.02653848, -0.1654358, 0, 0, 1, 1, 1,
1.739019, -1.604145, 1.994254, 1, 0, 0, 1, 1,
1.753129, -0.9390981, 1.805504, 1, 0, 0, 1, 1,
1.76748, -1.484043, 3.645112, 1, 0, 0, 1, 1,
1.768076, -0.6292369, 3.343078, 1, 0, 0, 1, 1,
1.768117, 0.07821597, 2.485164, 1, 0, 0, 1, 1,
1.779682, -0.6210576, 1.836204, 0, 0, 0, 1, 1,
1.786357, 1.397051, 2.014537, 0, 0, 0, 1, 1,
1.844514, 0.6581103, 0.5788805, 0, 0, 0, 1, 1,
1.864591, 0.03989929, 2.612201, 0, 0, 0, 1, 1,
1.86878, 0.1042429, 0.04411908, 0, 0, 0, 1, 1,
1.872958, -1.402653, 0.2148058, 0, 0, 0, 1, 1,
1.906025, -1.092499, 1.902776, 0, 0, 0, 1, 1,
1.907701, -2.14195, 2.280808, 1, 1, 1, 1, 1,
1.931008, -1.606799, 2.82592, 1, 1, 1, 1, 1,
1.934257, 1.303968, 0.1957911, 1, 1, 1, 1, 1,
1.962934, -0.07982266, 1.991739, 1, 1, 1, 1, 1,
1.972869, -0.04073929, 3.540725, 1, 1, 1, 1, 1,
1.978356, 0.6684401, 2.148156, 1, 1, 1, 1, 1,
1.984325, -0.8457531, 1.912967, 1, 1, 1, 1, 1,
1.999941, -1.529089, 4.415, 1, 1, 1, 1, 1,
2.000235, 0.6420665, 1.765815, 1, 1, 1, 1, 1,
2.008542, -0.0381756, 1.274926, 1, 1, 1, 1, 1,
2.013062, 0.9135137, 3.393971, 1, 1, 1, 1, 1,
2.022592, 0.02709944, 2.3409, 1, 1, 1, 1, 1,
2.040398, -0.8001736, 1.400806, 1, 1, 1, 1, 1,
2.065279, 0.7431079, 0.4308839, 1, 1, 1, 1, 1,
2.088212, 1.820494, 0.8468865, 1, 1, 1, 1, 1,
2.104285, 0.7092766, 1.164028, 0, 0, 1, 1, 1,
2.104689, -0.09759039, -0.5340186, 1, 0, 0, 1, 1,
2.114684, 0.6607971, 2.558503, 1, 0, 0, 1, 1,
2.128979, 2.692878, -0.3989435, 1, 0, 0, 1, 1,
2.130476, 0.356308, 1.320149, 1, 0, 0, 1, 1,
2.22177, 0.9353749, 0.3757954, 1, 0, 0, 1, 1,
2.267884, 0.4473071, 3.16371, 0, 0, 0, 1, 1,
2.330955, 0.9031713, 2.37129, 0, 0, 0, 1, 1,
2.365895, 0.7651244, 0.1141991, 0, 0, 0, 1, 1,
2.430761, -0.8071043, 3.07064, 0, 0, 0, 1, 1,
2.50675, 0.30885, 2.190654, 0, 0, 0, 1, 1,
2.515958, 1.142398, 1.386712, 0, 0, 0, 1, 1,
2.58133, 0.5218396, 1.48541, 0, 0, 0, 1, 1,
2.585628, -0.9304812, 2.427675, 1, 1, 1, 1, 1,
2.59437, -0.4911974, 1.096872, 1, 1, 1, 1, 1,
2.635327, -0.3472979, 3.041163, 1, 1, 1, 1, 1,
2.691236, -0.4630706, 2.932408, 1, 1, 1, 1, 1,
2.739105, -0.9275908, 1.7372, 1, 1, 1, 1, 1,
2.754344, -2.21603, 2.846724, 1, 1, 1, 1, 1,
2.94405, 0.3698418, 2.833478, 1, 1, 1, 1, 1
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
var radius = 8.984689;
var distance = 31.55834;
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
mvMatrix.translate( 0.1197696, -0.1698087, 0.2200241 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.55834);
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
