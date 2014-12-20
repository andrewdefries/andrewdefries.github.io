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
-2.721255, -2.399116, -1.886836, 1, 0, 0, 1,
-2.615591, -1.098593, -2.190156, 1, 0.007843138, 0, 1,
-2.566783, 2.27658, -1.748368, 1, 0.01176471, 0, 1,
-2.433626, -0.1955769, -1.660106, 1, 0.01960784, 0, 1,
-2.397476, 0.06792189, -0.9106816, 1, 0.02352941, 0, 1,
-2.376606, 0.1185431, -0.6405399, 1, 0.03137255, 0, 1,
-2.357847, 0.6849532, -1.08937, 1, 0.03529412, 0, 1,
-2.319377, 0.1448585, -0.758598, 1, 0.04313726, 0, 1,
-2.26648, 0.6342614, -0.2563938, 1, 0.04705882, 0, 1,
-2.252142, 1.734855, 0.05203358, 1, 0.05490196, 0, 1,
-2.206672, -0.6779895, -0.2572842, 1, 0.05882353, 0, 1,
-2.203722, -0.0389791, -0.1410682, 1, 0.06666667, 0, 1,
-2.148518, -1.143702, -1.693084, 1, 0.07058824, 0, 1,
-2.126463, -0.8196885, 0.3776723, 1, 0.07843138, 0, 1,
-2.12464, -0.1969533, 0.1978271, 1, 0.08235294, 0, 1,
-2.122551, 0.7396374, -2.884727, 1, 0.09019608, 0, 1,
-2.10591, 0.6861527, -2.136678, 1, 0.09411765, 0, 1,
-2.09085, -0.2196203, -1.028179, 1, 0.1019608, 0, 1,
-2.089539, 1.329331, -0.9922481, 1, 0.1098039, 0, 1,
-2.074416, 0.929831, -3.324898, 1, 0.1137255, 0, 1,
-2.052882, 0.9701132, 0.03402835, 1, 0.1215686, 0, 1,
-1.999355, 2.07075, -1.538181, 1, 0.1254902, 0, 1,
-1.993952, -0.1636401, -3.201487, 1, 0.1333333, 0, 1,
-1.993208, 0.2194791, -1.826714, 1, 0.1372549, 0, 1,
-1.975124, 0.4477886, -2.89928, 1, 0.145098, 0, 1,
-1.970054, -1.219089, -1.005399, 1, 0.1490196, 0, 1,
-1.96751, -0.3499125, -0.679146, 1, 0.1568628, 0, 1,
-1.958672, 0.3518848, -1.581421, 1, 0.1607843, 0, 1,
-1.957697, -0.3835265, -1.411167, 1, 0.1686275, 0, 1,
-1.954461, 1.227811, 1.359011, 1, 0.172549, 0, 1,
-1.953453, -0.9534252, -3.42565, 1, 0.1803922, 0, 1,
-1.935505, 2.139908, -0.9643858, 1, 0.1843137, 0, 1,
-1.89927, -2.098305, -3.357048, 1, 0.1921569, 0, 1,
-1.894747, -0.2801583, -0.8895007, 1, 0.1960784, 0, 1,
-1.891341, 1.314627, 0.2003847, 1, 0.2039216, 0, 1,
-1.890743, -0.05947502, -1.18577, 1, 0.2117647, 0, 1,
-1.86974, -0.7531406, -1.408224, 1, 0.2156863, 0, 1,
-1.863584, 0.6873516, -2.438761, 1, 0.2235294, 0, 1,
-1.832129, -0.3222517, -1.138215, 1, 0.227451, 0, 1,
-1.831231, 0.3556474, -2.168461, 1, 0.2352941, 0, 1,
-1.828967, -0.7181632, -1.328777, 1, 0.2392157, 0, 1,
-1.81868, -1.235759, -4.898692, 1, 0.2470588, 0, 1,
-1.812705, 1.084785, -0.9134534, 1, 0.2509804, 0, 1,
-1.791302, 0.8982741, -1.466435, 1, 0.2588235, 0, 1,
-1.765436, -0.1614788, -1.96524, 1, 0.2627451, 0, 1,
-1.760131, -0.04498341, -1.09044, 1, 0.2705882, 0, 1,
-1.757737, -0.4795389, -0.6624542, 1, 0.2745098, 0, 1,
-1.736359, 0.8910108, -1.351102, 1, 0.282353, 0, 1,
-1.736193, 0.07630523, 1.275462, 1, 0.2862745, 0, 1,
-1.716969, 1.179569, -2.683067, 1, 0.2941177, 0, 1,
-1.707475, -0.2396848, -2.428211, 1, 0.3019608, 0, 1,
-1.699216, -0.6194953, -2.803462, 1, 0.3058824, 0, 1,
-1.691507, 1.476341, -2.576528, 1, 0.3137255, 0, 1,
-1.681559, -0.7903128, -2.586404, 1, 0.3176471, 0, 1,
-1.665059, 0.1387639, -1.399209, 1, 0.3254902, 0, 1,
-1.663387, -0.1224173, -1.321451, 1, 0.3294118, 0, 1,
-1.650096, 0.2546143, -1.24628, 1, 0.3372549, 0, 1,
-1.649161, 0.3180182, -0.895911, 1, 0.3411765, 0, 1,
-1.640893, -0.9696949, -1.060455, 1, 0.3490196, 0, 1,
-1.632617, 0.07068568, 0.4127348, 1, 0.3529412, 0, 1,
-1.625059, -1.207255, -0.6838577, 1, 0.3607843, 0, 1,
-1.608654, 0.2226098, -1.943991, 1, 0.3647059, 0, 1,
-1.598635, -1.880318, -3.336232, 1, 0.372549, 0, 1,
-1.596474, 0.168455, -2.300097, 1, 0.3764706, 0, 1,
-1.595232, -0.09651452, -0.9047195, 1, 0.3843137, 0, 1,
-1.588598, 0.8706356, -0.6181463, 1, 0.3882353, 0, 1,
-1.580457, -0.4679263, -1.862536, 1, 0.3960784, 0, 1,
-1.576406, 0.4086865, -2.064111, 1, 0.4039216, 0, 1,
-1.560614, -2.017791, -1.967103, 1, 0.4078431, 0, 1,
-1.554381, 0.318433, -1.931144, 1, 0.4156863, 0, 1,
-1.545382, 1.081545, -0.8182296, 1, 0.4196078, 0, 1,
-1.541479, 0.6508132, -0.4500001, 1, 0.427451, 0, 1,
-1.53832, -1.02398, -0.8813565, 1, 0.4313726, 0, 1,
-1.520899, -0.2465772, -2.06025, 1, 0.4392157, 0, 1,
-1.50921, -0.1178256, -2.062505, 1, 0.4431373, 0, 1,
-1.507899, 0.03935634, -2.102855, 1, 0.4509804, 0, 1,
-1.504051, -0.2628827, -1.142911, 1, 0.454902, 0, 1,
-1.500405, 1.159004, -1.272713, 1, 0.4627451, 0, 1,
-1.496568, 0.4421953, -1.412403, 1, 0.4666667, 0, 1,
-1.495989, 0.7030149, -1.561165, 1, 0.4745098, 0, 1,
-1.484627, 1.387383, -0.3970818, 1, 0.4784314, 0, 1,
-1.46282, 1.735307, -0.381499, 1, 0.4862745, 0, 1,
-1.454446, 0.6921039, -2.898093, 1, 0.4901961, 0, 1,
-1.435862, 0.7780973, -2.808932, 1, 0.4980392, 0, 1,
-1.404842, 1.043596, -0.132958, 1, 0.5058824, 0, 1,
-1.391031, -0.4902732, -0.7995026, 1, 0.509804, 0, 1,
-1.38747, -0.2583349, -1.050299, 1, 0.5176471, 0, 1,
-1.380849, 0.4265618, -1.388759, 1, 0.5215687, 0, 1,
-1.357903, -0.09293857, -2.230819, 1, 0.5294118, 0, 1,
-1.357508, 1.536992, 1.136648, 1, 0.5333334, 0, 1,
-1.356296, -0.7644602, -3.563555, 1, 0.5411765, 0, 1,
-1.35574, 0.6988475, -0.3373679, 1, 0.5450981, 0, 1,
-1.355439, -1.425097, -4.371278, 1, 0.5529412, 0, 1,
-1.351076, 0.5117907, -1.760608, 1, 0.5568628, 0, 1,
-1.346346, -1.341775, -3.398551, 1, 0.5647059, 0, 1,
-1.34505, 0.5104442, 0.1672674, 1, 0.5686275, 0, 1,
-1.343338, 1.579766, -0.02415224, 1, 0.5764706, 0, 1,
-1.342778, 1.147113, -1.199258, 1, 0.5803922, 0, 1,
-1.339205, 0.09498262, -3.063025, 1, 0.5882353, 0, 1,
-1.333987, 1.736808, 0.3231082, 1, 0.5921569, 0, 1,
-1.328233, -0.3704531, -0.6397468, 1, 0.6, 0, 1,
-1.31449, 0.02519708, -1.668289, 1, 0.6078432, 0, 1,
-1.310993, -0.1886689, -1.819905, 1, 0.6117647, 0, 1,
-1.308145, 1.849592, -0.5271549, 1, 0.6196079, 0, 1,
-1.304375, 1.975085, -0.9236616, 1, 0.6235294, 0, 1,
-1.30266, 1.267629, -1.114083, 1, 0.6313726, 0, 1,
-1.297546, -0.8426117, -3.023599, 1, 0.6352941, 0, 1,
-1.291754, -0.2114054, -4.449253, 1, 0.6431373, 0, 1,
-1.291517, -1.086215, -1.824971, 1, 0.6470588, 0, 1,
-1.286924, -2.13333, -2.755103, 1, 0.654902, 0, 1,
-1.279465, -1.012424, -2.76874, 1, 0.6588235, 0, 1,
-1.27789, -0.5938395, -2.351363, 1, 0.6666667, 0, 1,
-1.275461, 0.350623, -1.288255, 1, 0.6705883, 0, 1,
-1.27273, -1.178078, -2.120654, 1, 0.6784314, 0, 1,
-1.270629, 0.4164969, -3.6334, 1, 0.682353, 0, 1,
-1.266324, -0.731023, -1.303718, 1, 0.6901961, 0, 1,
-1.25661, 1.152041, -0.2829592, 1, 0.6941177, 0, 1,
-1.25592, -0.09419549, -2.152951, 1, 0.7019608, 0, 1,
-1.255575, 0.5601772, -0.6209639, 1, 0.7098039, 0, 1,
-1.243545, 0.008508124, 1.354913, 1, 0.7137255, 0, 1,
-1.240546, 1.112853, -1.171563, 1, 0.7215686, 0, 1,
-1.237581, 1.270376, -1.623634, 1, 0.7254902, 0, 1,
-1.22948, -0.7110121, -2.883312, 1, 0.7333333, 0, 1,
-1.228371, -0.720371, -3.767265, 1, 0.7372549, 0, 1,
-1.227824, 0.1568401, -0.8870019, 1, 0.7450981, 0, 1,
-1.216176, 0.04955451, 0.005165142, 1, 0.7490196, 0, 1,
-1.215544, 0.8519139, 0.4335073, 1, 0.7568628, 0, 1,
-1.215145, 1.507577, -0.6891705, 1, 0.7607843, 0, 1,
-1.208741, -0.1565234, -0.3416741, 1, 0.7686275, 0, 1,
-1.206977, -0.01728634, -0.9983512, 1, 0.772549, 0, 1,
-1.192899, 0.9279846, -1.204855, 1, 0.7803922, 0, 1,
-1.155155, 1.109205, -2.477607, 1, 0.7843137, 0, 1,
-1.155007, -0.8256313, -4.096958, 1, 0.7921569, 0, 1,
-1.153396, -0.5693121, -1.585423, 1, 0.7960784, 0, 1,
-1.151186, -1.366252, -1.417468, 1, 0.8039216, 0, 1,
-1.148703, -0.0292003, -1.546407, 1, 0.8117647, 0, 1,
-1.148004, -0.5159646, -2.716223, 1, 0.8156863, 0, 1,
-1.142927, 0.3091331, -2.225111, 1, 0.8235294, 0, 1,
-1.142917, -0.7008359, -1.927901, 1, 0.827451, 0, 1,
-1.137128, 2.734782, -1.169377, 1, 0.8352941, 0, 1,
-1.134014, 0.01059884, -2.702134, 1, 0.8392157, 0, 1,
-1.132715, -1.842219, -1.58334, 1, 0.8470588, 0, 1,
-1.13116, -0.7627261, -1.347911, 1, 0.8509804, 0, 1,
-1.131029, 0.3674048, -2.263133, 1, 0.8588235, 0, 1,
-1.128383, -1.084356, -3.459858, 1, 0.8627451, 0, 1,
-1.12606, 1.325853, -1.153455, 1, 0.8705882, 0, 1,
-1.108889, 1.090666, -0.561394, 1, 0.8745098, 0, 1,
-1.090066, -0.01071201, 1.10226, 1, 0.8823529, 0, 1,
-1.086212, -0.3589601, -1.817353, 1, 0.8862745, 0, 1,
-1.05661, 1.652471, 0.7161031, 1, 0.8941177, 0, 1,
-1.055053, 0.6624909, -2.506258, 1, 0.8980392, 0, 1,
-1.051721, -0.0801667, -1.949889, 1, 0.9058824, 0, 1,
-1.049878, -0.2321077, -2.593414, 1, 0.9137255, 0, 1,
-1.045908, -0.09065361, 0.4638286, 1, 0.9176471, 0, 1,
-1.045723, 0.5070871, -1.912653, 1, 0.9254902, 0, 1,
-1.028233, -0.7601, -2.491139, 1, 0.9294118, 0, 1,
-1.028185, -0.05323308, -0.8473794, 1, 0.9372549, 0, 1,
-1.016444, 1.767881, 0.2182266, 1, 0.9411765, 0, 1,
-1.012177, -0.3131846, -1.505273, 1, 0.9490196, 0, 1,
-1.001183, 0.5347695, -3.430853, 1, 0.9529412, 0, 1,
-0.9911674, -1.202756, -2.173477, 1, 0.9607843, 0, 1,
-0.9860736, -0.9680294, -1.456, 1, 0.9647059, 0, 1,
-0.9841758, 1.374553, -0.4421954, 1, 0.972549, 0, 1,
-0.9788256, -0.1918446, -1.170857, 1, 0.9764706, 0, 1,
-0.9786277, 0.8479724, 0.8139143, 1, 0.9843137, 0, 1,
-0.9780577, 0.7061018, -2.023231, 1, 0.9882353, 0, 1,
-0.9775372, 2.664224, -0.09256543, 1, 0.9960784, 0, 1,
-0.9762309, 0.1274501, -1.585052, 0.9960784, 1, 0, 1,
-0.9739734, -1.751926, -3.597802, 0.9921569, 1, 0, 1,
-0.9684455, 0.2218812, -1.53779, 0.9843137, 1, 0, 1,
-0.9644353, 0.01472917, -3.070935, 0.9803922, 1, 0, 1,
-0.9634965, -0.304598, 1.363271, 0.972549, 1, 0, 1,
-0.9630311, -0.2660458, -1.926017, 0.9686275, 1, 0, 1,
-0.9560685, 1.990063, 1.08997, 0.9607843, 1, 0, 1,
-0.950113, -0.4627242, -2.732675, 0.9568627, 1, 0, 1,
-0.9472988, 1.058078, -1.007564, 0.9490196, 1, 0, 1,
-0.9423641, -0.7018026, -2.108714, 0.945098, 1, 0, 1,
-0.9416978, 1.084409, -1.865881, 0.9372549, 1, 0, 1,
-0.9351599, 2.034521, -0.3101121, 0.9333333, 1, 0, 1,
-0.9338163, -1.839722, -1.512323, 0.9254902, 1, 0, 1,
-0.9297051, 1.277319, 0.5278388, 0.9215686, 1, 0, 1,
-0.9271728, -0.8915566, -1.83283, 0.9137255, 1, 0, 1,
-0.919208, -0.8616294, -1.655423, 0.9098039, 1, 0, 1,
-0.9153767, 0.3670311, -0.668931, 0.9019608, 1, 0, 1,
-0.9109712, -2.222364, -2.213439, 0.8941177, 1, 0, 1,
-0.9094667, -0.1625636, -2.114419, 0.8901961, 1, 0, 1,
-0.9064186, -0.7460609, -1.337493, 0.8823529, 1, 0, 1,
-0.9063593, 0.4741812, -1.763871, 0.8784314, 1, 0, 1,
-0.9043926, 1.885595, -0.9177431, 0.8705882, 1, 0, 1,
-0.9018478, -1.318304, -2.026015, 0.8666667, 1, 0, 1,
-0.8989001, -2.898068, -2.564175, 0.8588235, 1, 0, 1,
-0.896804, 1.996192, -0.6404078, 0.854902, 1, 0, 1,
-0.8934198, -0.687082, -2.468459, 0.8470588, 1, 0, 1,
-0.8843659, 1.572596, -0.7173423, 0.8431373, 1, 0, 1,
-0.8750759, -0.06018306, -2.600716, 0.8352941, 1, 0, 1,
-0.8677943, 0.03186431, -0.6891703, 0.8313726, 1, 0, 1,
-0.8671293, -2.08445, -5.002012, 0.8235294, 1, 0, 1,
-0.8595635, -0.8632409, -3.046885, 0.8196079, 1, 0, 1,
-0.8523406, -0.1196361, -0.542766, 0.8117647, 1, 0, 1,
-0.8482891, 1.185311, -1.334114, 0.8078431, 1, 0, 1,
-0.8480642, 0.4769576, -0.1667247, 0.8, 1, 0, 1,
-0.84764, 1.607476, 0.5706401, 0.7921569, 1, 0, 1,
-0.8459707, -0.1965682, -1.340265, 0.7882353, 1, 0, 1,
-0.8436897, 0.8025213, -0.9423811, 0.7803922, 1, 0, 1,
-0.8403007, -0.1393232, -1.31909, 0.7764706, 1, 0, 1,
-0.8301958, -2.731483, -3.480396, 0.7686275, 1, 0, 1,
-0.8242664, -0.0829634, -0.6296674, 0.7647059, 1, 0, 1,
-0.8213079, -1.653458, -1.761889, 0.7568628, 1, 0, 1,
-0.8100041, -0.3095351, -2.134457, 0.7529412, 1, 0, 1,
-0.8073601, -0.5285043, -0.659144, 0.7450981, 1, 0, 1,
-0.8063639, 1.366018, -0.9562824, 0.7411765, 1, 0, 1,
-0.8058614, 1.339052, -0.3206308, 0.7333333, 1, 0, 1,
-0.7975952, 1.029806, 0.9805632, 0.7294118, 1, 0, 1,
-0.7924249, -1.758251, -3.194423, 0.7215686, 1, 0, 1,
-0.7867635, -0.4757664, -2.380162, 0.7176471, 1, 0, 1,
-0.7864988, 0.6367105, -0.7112005, 0.7098039, 1, 0, 1,
-0.7859777, -0.3352638, -1.598677, 0.7058824, 1, 0, 1,
-0.7845433, 1.556531, -1.093358, 0.6980392, 1, 0, 1,
-0.7821869, -1.303828, -2.684638, 0.6901961, 1, 0, 1,
-0.7749386, -0.2990823, -2.241108, 0.6862745, 1, 0, 1,
-0.769051, 0.0487745, 0.3986709, 0.6784314, 1, 0, 1,
-0.7689579, -0.5765654, -3.536742, 0.6745098, 1, 0, 1,
-0.7682774, -0.2931371, -1.085038, 0.6666667, 1, 0, 1,
-0.7663672, -0.4895152, -0.9567652, 0.6627451, 1, 0, 1,
-0.755273, 1.922287, -2.603945, 0.654902, 1, 0, 1,
-0.754591, -0.2711327, -0.9089984, 0.6509804, 1, 0, 1,
-0.7471921, -0.009251383, -1.434747, 0.6431373, 1, 0, 1,
-0.7420833, 0.7698765, -1.771803, 0.6392157, 1, 0, 1,
-0.7412225, -0.4889695, -1.456783, 0.6313726, 1, 0, 1,
-0.739921, -0.03367031, -2.404286, 0.627451, 1, 0, 1,
-0.7394766, -1.426627, -2.411527, 0.6196079, 1, 0, 1,
-0.7367608, -0.788384, -0.5122814, 0.6156863, 1, 0, 1,
-0.7341115, 0.5325316, -0.4016106, 0.6078432, 1, 0, 1,
-0.7305661, 0.4228717, -0.7487852, 0.6039216, 1, 0, 1,
-0.7276291, -1.655312, -1.669984, 0.5960785, 1, 0, 1,
-0.7243285, 0.3639772, -0.4622654, 0.5882353, 1, 0, 1,
-0.7218323, 0.9957877, -1.686353, 0.5843138, 1, 0, 1,
-0.7204079, -1.063043, -2.46693, 0.5764706, 1, 0, 1,
-0.7174793, -0.5364454, -2.076728, 0.572549, 1, 0, 1,
-0.7143362, 0.5331762, -1.050447, 0.5647059, 1, 0, 1,
-0.7125182, -0.2695234, -1.742872, 0.5607843, 1, 0, 1,
-0.7119235, -2.115699, -0.9712613, 0.5529412, 1, 0, 1,
-0.7113298, -1.705147, -3.058164, 0.5490196, 1, 0, 1,
-0.7110958, -1.421151, -1.684927, 0.5411765, 1, 0, 1,
-0.7108471, -0.4737561, -0.4747361, 0.5372549, 1, 0, 1,
-0.7088154, -0.1257781, -1.837517, 0.5294118, 1, 0, 1,
-0.7059662, 1.277731, -1.099969, 0.5254902, 1, 0, 1,
-0.7005331, -0.3595294, -1.704359, 0.5176471, 1, 0, 1,
-0.6820287, -1.865061, -2.908383, 0.5137255, 1, 0, 1,
-0.6731121, 0.5861461, -0.6280287, 0.5058824, 1, 0, 1,
-0.6717416, -0.4582454, -4.388171, 0.5019608, 1, 0, 1,
-0.6697142, 0.2150169, -1.538419, 0.4941176, 1, 0, 1,
-0.6670929, -1.070904, -1.990698, 0.4862745, 1, 0, 1,
-0.66456, -0.362784, -2.571938, 0.4823529, 1, 0, 1,
-0.6635868, 0.5174429, -1.672035, 0.4745098, 1, 0, 1,
-0.6587359, 1.008676, 0.4187862, 0.4705882, 1, 0, 1,
-0.6560132, -0.1327571, -1.55916, 0.4627451, 1, 0, 1,
-0.6513482, -0.3909121, -2.334991, 0.4588235, 1, 0, 1,
-0.6506975, 1.112391, -0.2939988, 0.4509804, 1, 0, 1,
-0.6497948, -1.08733, -2.472291, 0.4470588, 1, 0, 1,
-0.6476243, 0.2243984, -1.892938, 0.4392157, 1, 0, 1,
-0.6435629, 0.9795269, -0.469109, 0.4352941, 1, 0, 1,
-0.6427627, 0.03941914, -2.963888, 0.427451, 1, 0, 1,
-0.6413372, -0.9997322, -2.092822, 0.4235294, 1, 0, 1,
-0.6397528, -0.6169036, -2.506812, 0.4156863, 1, 0, 1,
-0.6375957, -0.9530104, -2.746067, 0.4117647, 1, 0, 1,
-0.637238, 0.6933377, -1.243706, 0.4039216, 1, 0, 1,
-0.6332136, 0.307647, -0.4005817, 0.3960784, 1, 0, 1,
-0.6328577, -1.219841, -1.299938, 0.3921569, 1, 0, 1,
-0.6275744, 1.097753, -0.02747758, 0.3843137, 1, 0, 1,
-0.6245828, 0.2797649, -0.8289667, 0.3803922, 1, 0, 1,
-0.6202937, 0.3883265, -1.866452, 0.372549, 1, 0, 1,
-0.6200165, -0.444399, -2.335693, 0.3686275, 1, 0, 1,
-0.6113348, -0.9442891, -3.972553, 0.3607843, 1, 0, 1,
-0.6102813, 0.4304929, 0.5768939, 0.3568628, 1, 0, 1,
-0.6085439, 0.8982876, -0.1299805, 0.3490196, 1, 0, 1,
-0.6054285, -0.03213973, -2.070261, 0.345098, 1, 0, 1,
-0.6020526, 0.9163731, -0.3801123, 0.3372549, 1, 0, 1,
-0.6003529, -0.3248104, -2.055273, 0.3333333, 1, 0, 1,
-0.5999022, -1.380097, -2.201559, 0.3254902, 1, 0, 1,
-0.5961465, -0.5781783, -2.553153, 0.3215686, 1, 0, 1,
-0.5925783, -0.01958189, 0.1382299, 0.3137255, 1, 0, 1,
-0.5889991, -1.043776, -3.944187, 0.3098039, 1, 0, 1,
-0.5883984, -0.5655593, -1.608865, 0.3019608, 1, 0, 1,
-0.5820883, -1.058094, -1.464529, 0.2941177, 1, 0, 1,
-0.5715402, 0.3077054, -1.490438, 0.2901961, 1, 0, 1,
-0.5668898, 0.09393342, -0.7498106, 0.282353, 1, 0, 1,
-0.5667767, -1.228356, -3.63668, 0.2784314, 1, 0, 1,
-0.564356, 0.3826776, -2.635692, 0.2705882, 1, 0, 1,
-0.5587586, -0.6272043, -1.206079, 0.2666667, 1, 0, 1,
-0.5568156, -0.5050874, -4.022799, 0.2588235, 1, 0, 1,
-0.550903, 1.202584, 2.348571, 0.254902, 1, 0, 1,
-0.5442861, 0.5933129, -1.851345, 0.2470588, 1, 0, 1,
-0.543546, 1.36095, -0.7224702, 0.2431373, 1, 0, 1,
-0.5415758, 0.2725508, -1.162785, 0.2352941, 1, 0, 1,
-0.5409204, -0.1409592, -2.223367, 0.2313726, 1, 0, 1,
-0.5390064, -0.2483909, -1.150164, 0.2235294, 1, 0, 1,
-0.5377184, -0.7063071, -2.258131, 0.2196078, 1, 0, 1,
-0.5334457, -0.7828087, -4.369011, 0.2117647, 1, 0, 1,
-0.5305098, 0.367142, 0.6876242, 0.2078431, 1, 0, 1,
-0.5229425, 0.52683, -2.252433, 0.2, 1, 0, 1,
-0.5224618, 0.5658808, -0.1562702, 0.1921569, 1, 0, 1,
-0.5198783, 1.243643, -0.9423404, 0.1882353, 1, 0, 1,
-0.5118376, 0.2391242, -0.3533545, 0.1803922, 1, 0, 1,
-0.508864, 0.4718057, -2.153763, 0.1764706, 1, 0, 1,
-0.5071209, 2.039674, -0.6109881, 0.1686275, 1, 0, 1,
-0.505513, -0.7152049, -2.848086, 0.1647059, 1, 0, 1,
-0.5045716, -0.08518415, -1.884748, 0.1568628, 1, 0, 1,
-0.5042731, -1.746402, -3.05479, 0.1529412, 1, 0, 1,
-0.4974758, -0.01928092, -1.980741, 0.145098, 1, 0, 1,
-0.4945154, 0.06953622, -1.269875, 0.1411765, 1, 0, 1,
-0.4922195, -0.247236, -3.17634, 0.1333333, 1, 0, 1,
-0.4872361, 0.356624, -1.229936, 0.1294118, 1, 0, 1,
-0.4724528, 0.1631679, -0.875071, 0.1215686, 1, 0, 1,
-0.469114, -0.6456851, 0.2233313, 0.1176471, 1, 0, 1,
-0.4667244, -0.1671113, -3.780856, 0.1098039, 1, 0, 1,
-0.4630623, 1.050795, 0.5292543, 0.1058824, 1, 0, 1,
-0.4608738, -0.7857351, -4.200355, 0.09803922, 1, 0, 1,
-0.4559928, -0.1127573, -2.975752, 0.09019608, 1, 0, 1,
-0.4518717, 1.373133, -0.6612265, 0.08627451, 1, 0, 1,
-0.4489599, 1.302554, -1.230582, 0.07843138, 1, 0, 1,
-0.4463036, 0.5212486, 0.4647846, 0.07450981, 1, 0, 1,
-0.4442562, 0.2631164, -2.06855, 0.06666667, 1, 0, 1,
-0.4402196, 0.6935905, -2.410292, 0.0627451, 1, 0, 1,
-0.4363903, -0.3849324, -3.38338, 0.05490196, 1, 0, 1,
-0.4296021, 0.4150444, -0.7937451, 0.05098039, 1, 0, 1,
-0.4270904, -0.8098098, -2.758048, 0.04313726, 1, 0, 1,
-0.425252, 0.6885436, -0.4291263, 0.03921569, 1, 0, 1,
-0.4247615, 2.069996, 1.999422, 0.03137255, 1, 0, 1,
-0.4189709, 0.7977339, -1.499322, 0.02745098, 1, 0, 1,
-0.4181387, 2.045083, -0.6689631, 0.01960784, 1, 0, 1,
-0.4157098, -1.311804, -2.404546, 0.01568628, 1, 0, 1,
-0.415294, 0.9685799, 1.777955, 0.007843138, 1, 0, 1,
-0.4135997, -1.024639, -3.134749, 0.003921569, 1, 0, 1,
-0.4116054, -1.146197, -2.846645, 0, 1, 0.003921569, 1,
-0.4089521, -0.2233848, -1.813134, 0, 1, 0.01176471, 1,
-0.4071847, 0.3237452, -2.604654, 0, 1, 0.01568628, 1,
-0.4053345, -1.72191, -1.291305, 0, 1, 0.02352941, 1,
-0.4020635, -1.540681, -0.7203614, 0, 1, 0.02745098, 1,
-0.4015778, -0.2272747, -0.9384956, 0, 1, 0.03529412, 1,
-0.3985468, 0.1943975, 0.6748776, 0, 1, 0.03921569, 1,
-0.3980828, -0.2157108, -1.772313, 0, 1, 0.04705882, 1,
-0.3966354, -0.745322, -1.676961, 0, 1, 0.05098039, 1,
-0.3961728, -0.1220594, -1.576471, 0, 1, 0.05882353, 1,
-0.3949867, 0.5351113, -1.084963, 0, 1, 0.0627451, 1,
-0.393063, -0.1694652, -3.739691, 0, 1, 0.07058824, 1,
-0.3866596, 0.2354242, -0.9349476, 0, 1, 0.07450981, 1,
-0.3848261, -1.727089, -3.106678, 0, 1, 0.08235294, 1,
-0.3823453, -1.535721, -4.517897, 0, 1, 0.08627451, 1,
-0.3805024, 0.1183892, -2.214949, 0, 1, 0.09411765, 1,
-0.3804928, -0.7892126, 0.1721905, 0, 1, 0.1019608, 1,
-0.3780987, -0.6457553, -2.278459, 0, 1, 0.1058824, 1,
-0.3779367, -1.527008, -3.771911, 0, 1, 0.1137255, 1,
-0.3766177, 0.7554867, -0.3828605, 0, 1, 0.1176471, 1,
-0.3738435, 0.378307, -0.7275465, 0, 1, 0.1254902, 1,
-0.371267, -1.074299, -2.598889, 0, 1, 0.1294118, 1,
-0.3699049, -0.2872389, -3.648193, 0, 1, 0.1372549, 1,
-0.3698847, -0.8366805, -1.722145, 0, 1, 0.1411765, 1,
-0.3661385, 2.450875, -2.223195, 0, 1, 0.1490196, 1,
-0.3643052, 0.1094217, -1.27369, 0, 1, 0.1529412, 1,
-0.3616513, 1.343736, -0.8409073, 0, 1, 0.1607843, 1,
-0.3600423, -0.6353609, -2.422399, 0, 1, 0.1647059, 1,
-0.3578689, 0.6519959, -0.8918516, 0, 1, 0.172549, 1,
-0.3546667, 1.07103, -0.8755163, 0, 1, 0.1764706, 1,
-0.3530196, 0.5238646, -0.5966669, 0, 1, 0.1843137, 1,
-0.3527364, -1.466336, -2.353105, 0, 1, 0.1882353, 1,
-0.3502727, -0.8931249, -2.81805, 0, 1, 0.1960784, 1,
-0.3500117, -1.391466, -3.078296, 0, 1, 0.2039216, 1,
-0.3496835, -2.390719, -2.301964, 0, 1, 0.2078431, 1,
-0.3488862, 0.02152984, -1.113813, 0, 1, 0.2156863, 1,
-0.343285, 1.157436, -0.4220352, 0, 1, 0.2196078, 1,
-0.3417601, 0.1590483, -1.122033, 0, 1, 0.227451, 1,
-0.3396769, 0.2568916, -0.7242268, 0, 1, 0.2313726, 1,
-0.3393338, -1.601265, -2.72466, 0, 1, 0.2392157, 1,
-0.3360982, -0.8902866, -2.480539, 0, 1, 0.2431373, 1,
-0.3301224, -0.6174437, -2.650639, 0, 1, 0.2509804, 1,
-0.32831, 1.673126, -1.450848, 0, 1, 0.254902, 1,
-0.3282914, -2.398057, -4.706678, 0, 1, 0.2627451, 1,
-0.328288, 1.00291, 0.2118939, 0, 1, 0.2666667, 1,
-0.3259696, -0.4852685, -1.788917, 0, 1, 0.2745098, 1,
-0.3251788, -0.2797021, -1.382419, 0, 1, 0.2784314, 1,
-0.3225228, 1.65613, -1.969067, 0, 1, 0.2862745, 1,
-0.312008, 1.617319, -1.038896, 0, 1, 0.2901961, 1,
-0.3087516, 0.7118946, 0.8127064, 0, 1, 0.2980392, 1,
-0.3032554, 0.557758, -1.991863, 0, 1, 0.3058824, 1,
-0.3027871, -0.8732761, -2.514727, 0, 1, 0.3098039, 1,
-0.3020319, -0.4637464, -3.623636, 0, 1, 0.3176471, 1,
-0.2981282, 0.5944079, -0.6295882, 0, 1, 0.3215686, 1,
-0.2970915, -0.2024234, -2.372192, 0, 1, 0.3294118, 1,
-0.2927195, 2.293252, -0.9764665, 0, 1, 0.3333333, 1,
-0.2909245, 1.862319, -0.2420882, 0, 1, 0.3411765, 1,
-0.288848, 1.239782, -0.6646149, 0, 1, 0.345098, 1,
-0.2875781, 0.03344851, -1.252472, 0, 1, 0.3529412, 1,
-0.2822421, -1.295168, -2.456048, 0, 1, 0.3568628, 1,
-0.2797125, -0.4555036, -3.113694, 0, 1, 0.3647059, 1,
-0.2768779, -0.338811, -3.303355, 0, 1, 0.3686275, 1,
-0.2573881, 1.955997, 0.5739814, 0, 1, 0.3764706, 1,
-0.256293, 0.4023354, 0.1236674, 0, 1, 0.3803922, 1,
-0.2524846, 1.000447, 0.1280109, 0, 1, 0.3882353, 1,
-0.2372428, -0.1778086, -2.159483, 0, 1, 0.3921569, 1,
-0.2368968, 0.6463724, 0.7999852, 0, 1, 0.4, 1,
-0.2276699, -0.3425352, -4.627007, 0, 1, 0.4078431, 1,
-0.226171, 0.03857665, -2.76882, 0, 1, 0.4117647, 1,
-0.2254438, 2.468915, -0.5326775, 0, 1, 0.4196078, 1,
-0.2237123, -1.155908, -3.904776, 0, 1, 0.4235294, 1,
-0.2212411, -0.7351461, -2.414283, 0, 1, 0.4313726, 1,
-0.2191459, -0.1435475, -2.959465, 0, 1, 0.4352941, 1,
-0.2138608, 0.5997584, -0.4448769, 0, 1, 0.4431373, 1,
-0.2123586, 0.4832036, -0.3148677, 0, 1, 0.4470588, 1,
-0.2107332, 0.4339411, 1.26522, 0, 1, 0.454902, 1,
-0.2023603, 0.5101269, 0.2344919, 0, 1, 0.4588235, 1,
-0.2021486, 0.7652857, -0.1237961, 0, 1, 0.4666667, 1,
-0.1952469, -2.42757, -4.13555, 0, 1, 0.4705882, 1,
-0.1945236, 1.869844, -0.8437706, 0, 1, 0.4784314, 1,
-0.1902334, -1.390272, -3.091178, 0, 1, 0.4823529, 1,
-0.1857505, 0.8306666, -1.395428, 0, 1, 0.4901961, 1,
-0.1839563, -2.031536, -1.739733, 0, 1, 0.4941176, 1,
-0.18302, -0.7488788, -3.535348, 0, 1, 0.5019608, 1,
-0.1790826, 0.0770316, -1.35836, 0, 1, 0.509804, 1,
-0.1784394, -0.1694176, -2.407763, 0, 1, 0.5137255, 1,
-0.1778028, 0.6982923, -1.052487, 0, 1, 0.5215687, 1,
-0.1767358, -1.178511, -3.768891, 0, 1, 0.5254902, 1,
-0.1731623, 1.464807, -0.4402344, 0, 1, 0.5333334, 1,
-0.1677394, 1.353439, -0.2890113, 0, 1, 0.5372549, 1,
-0.1672354, 0.6485566, 0.8943934, 0, 1, 0.5450981, 1,
-0.1590901, 0.4022204, -2.412769, 0, 1, 0.5490196, 1,
-0.1543865, -0.5868345, -2.270225, 0, 1, 0.5568628, 1,
-0.1529998, -1.253037, -4.129609, 0, 1, 0.5607843, 1,
-0.149174, -0.4165186, -3.529878, 0, 1, 0.5686275, 1,
-0.1410812, 0.7688599, 0.9786673, 0, 1, 0.572549, 1,
-0.1278649, 2.456526, 0.5379586, 0, 1, 0.5803922, 1,
-0.1263124, -0.8818999, -3.551922, 0, 1, 0.5843138, 1,
-0.1257638, -0.6046746, -2.194124, 0, 1, 0.5921569, 1,
-0.1238129, -0.1558598, -1.802601, 0, 1, 0.5960785, 1,
-0.1232773, -0.7355893, -3.442822, 0, 1, 0.6039216, 1,
-0.1184483, -1.92882, -2.268154, 0, 1, 0.6117647, 1,
-0.1134398, 0.02533093, 0.3209911, 0, 1, 0.6156863, 1,
-0.1126485, 1.17102, 2.335076, 0, 1, 0.6235294, 1,
-0.1118612, -0.4982596, -2.016822, 0, 1, 0.627451, 1,
-0.1106717, -0.4133597, -5.20535, 0, 1, 0.6352941, 1,
-0.1097066, -1.587719, -1.732478, 0, 1, 0.6392157, 1,
-0.1094113, 0.3546081, 0.2015858, 0, 1, 0.6470588, 1,
-0.1070927, -0.319328, -1.562895, 0, 1, 0.6509804, 1,
-0.1054878, -0.8147314, -4.835206, 0, 1, 0.6588235, 1,
-0.09986088, 0.6518745, 1.880957, 0, 1, 0.6627451, 1,
-0.09976592, -1.116198, -4.071241, 0, 1, 0.6705883, 1,
-0.09853385, 3.728095, -0.3523679, 0, 1, 0.6745098, 1,
-0.09293944, 1.486249, -1.246838, 0, 1, 0.682353, 1,
-0.09066981, -0.1999725, -3.431453, 0, 1, 0.6862745, 1,
-0.082499, 1.197106, 1.437581, 0, 1, 0.6941177, 1,
-0.08180644, -0.3893246, -3.422439, 0, 1, 0.7019608, 1,
-0.08149566, -1.561956, -2.898765, 0, 1, 0.7058824, 1,
-0.07921965, 1.953248, 0.5141738, 0, 1, 0.7137255, 1,
-0.070545, 0.02139254, -1.435286, 0, 1, 0.7176471, 1,
-0.06996638, 0.204804, -2.129911, 0, 1, 0.7254902, 1,
-0.06973438, 0.3722852, 0.4161945, 0, 1, 0.7294118, 1,
-0.06891029, -1.70142, -2.731141, 0, 1, 0.7372549, 1,
-0.06825571, -1.281772, -2.074658, 0, 1, 0.7411765, 1,
-0.06599496, 1.654847, -0.1466425, 0, 1, 0.7490196, 1,
-0.06533284, 0.9463959, -0.3700075, 0, 1, 0.7529412, 1,
-0.06499263, 0.1345988, 0.1935556, 0, 1, 0.7607843, 1,
-0.06290875, -0.4784752, -2.893848, 0, 1, 0.7647059, 1,
-0.06061719, -1.653442, -1.691071, 0, 1, 0.772549, 1,
-0.05944888, -0.4583061, -4.28662, 0, 1, 0.7764706, 1,
-0.05709664, 0.1906864, 0.5920718, 0, 1, 0.7843137, 1,
-0.05642965, 0.1842186, -1.056738, 0, 1, 0.7882353, 1,
-0.05638546, 1.831823, 0.614102, 0, 1, 0.7960784, 1,
-0.05603452, 0.8871632, 1.151663, 0, 1, 0.8039216, 1,
-0.0556442, 0.4724931, 0.7616925, 0, 1, 0.8078431, 1,
-0.05563324, 0.4791128, 1.907975, 0, 1, 0.8156863, 1,
-0.05300206, 1.247185, 0.4177287, 0, 1, 0.8196079, 1,
-0.05033766, 1.597422, -1.330339, 0, 1, 0.827451, 1,
-0.04943088, 0.06007345, 0.1186139, 0, 1, 0.8313726, 1,
-0.04609511, 1.471633, 1.399373, 0, 1, 0.8392157, 1,
-0.04455334, -1.501916, -2.533144, 0, 1, 0.8431373, 1,
-0.03573217, -0.02701013, -2.357116, 0, 1, 0.8509804, 1,
-0.02511761, 0.6339861, -0.5526658, 0, 1, 0.854902, 1,
-0.02195473, 0.2735134, 1.266685, 0, 1, 0.8627451, 1,
-0.02119518, 0.935309, -0.6037386, 0, 1, 0.8666667, 1,
-0.02084521, -1.389393, -3.153384, 0, 1, 0.8745098, 1,
-0.02059167, -0.2411807, -3.823384, 0, 1, 0.8784314, 1,
-0.02059057, -0.6867823, -2.789108, 0, 1, 0.8862745, 1,
-0.01855398, -1.009461, -4.409275, 0, 1, 0.8901961, 1,
-0.01107984, -0.629476, -3.365762, 0, 1, 0.8980392, 1,
-0.01026715, 2.393058, -1.094799, 0, 1, 0.9058824, 1,
-0.009878777, 0.2223266, -2.915225, 0, 1, 0.9098039, 1,
-0.008400475, 0.849964, 0.9306718, 0, 1, 0.9176471, 1,
-0.00331432, -1.265557, -2.31704, 0, 1, 0.9215686, 1,
-0.001030975, -1.214024, -3.591485, 0, 1, 0.9294118, 1,
0.004936049, 1.293981, 0.2344668, 0, 1, 0.9333333, 1,
0.005365686, 0.5319911, 0.4573141, 0, 1, 0.9411765, 1,
0.00540066, 1.388033, 1.627671, 0, 1, 0.945098, 1,
0.01126473, 0.01076985, 0.4794337, 0, 1, 0.9529412, 1,
0.01343976, -1.321857, 1.927864, 0, 1, 0.9568627, 1,
0.01471436, 0.7735826, 0.06988128, 0, 1, 0.9647059, 1,
0.01800022, -0.5822525, 4.56409, 0, 1, 0.9686275, 1,
0.01819355, -0.4612044, 2.017741, 0, 1, 0.9764706, 1,
0.01923323, 1.533296, 0.5038112, 0, 1, 0.9803922, 1,
0.02115185, -0.296577, 4.280752, 0, 1, 0.9882353, 1,
0.022891, 0.4924715, 1.00889, 0, 1, 0.9921569, 1,
0.02309643, 0.2047293, 0.8728128, 0, 1, 1, 1,
0.02865796, -0.1758827, 3.497038, 0, 0.9921569, 1, 1,
0.02963085, -0.9546158, 4.159584, 0, 0.9882353, 1, 1,
0.03684308, -0.3978237, 2.531872, 0, 0.9803922, 1, 1,
0.03782556, 0.2574522, -1.01137, 0, 0.9764706, 1, 1,
0.03935947, -1.539626, 3.636855, 0, 0.9686275, 1, 1,
0.04112361, -1.762566, 2.718435, 0, 0.9647059, 1, 1,
0.04149818, -0.7697918, 1.781767, 0, 0.9568627, 1, 1,
0.04186485, 0.4741784, 1.330321, 0, 0.9529412, 1, 1,
0.04689744, -1.006114, 3.062485, 0, 0.945098, 1, 1,
0.0497941, -1.003554, 2.665314, 0, 0.9411765, 1, 1,
0.0513573, -0.7866521, 2.519588, 0, 0.9333333, 1, 1,
0.05263654, -1.234836, 2.520001, 0, 0.9294118, 1, 1,
0.05374176, 0.2582881, 0.2306768, 0, 0.9215686, 1, 1,
0.05486496, -1.73192, 2.426836, 0, 0.9176471, 1, 1,
0.0558901, -2.150992, 4.213662, 0, 0.9098039, 1, 1,
0.05697722, 1.493235, 0.5187081, 0, 0.9058824, 1, 1,
0.05966796, -0.952274, 1.481387, 0, 0.8980392, 1, 1,
0.06287827, -0.2229355, 4.41383, 0, 0.8901961, 1, 1,
0.06314491, -0.8110977, 2.61366, 0, 0.8862745, 1, 1,
0.0715597, 0.5343941, -0.4783263, 0, 0.8784314, 1, 1,
0.07163616, -0.958276, 3.359302, 0, 0.8745098, 1, 1,
0.07572022, -0.1098552, 1.605469, 0, 0.8666667, 1, 1,
0.07663321, -0.4475698, 3.457408, 0, 0.8627451, 1, 1,
0.08090316, 1.336875, 1.094516, 0, 0.854902, 1, 1,
0.08361338, -2.341149, 1.805468, 0, 0.8509804, 1, 1,
0.08718403, -0.1423414, 4.579445, 0, 0.8431373, 1, 1,
0.09040272, -1.071922, 3.505802, 0, 0.8392157, 1, 1,
0.09584079, 2.098365, 0.1910388, 0, 0.8313726, 1, 1,
0.09679818, -0.5250142, 2.729728, 0, 0.827451, 1, 1,
0.09733464, 0.02745826, 1.331995, 0, 0.8196079, 1, 1,
0.09877224, 0.09348409, 0.09103458, 0, 0.8156863, 1, 1,
0.09989227, -1.664648, 3.194899, 0, 0.8078431, 1, 1,
0.1093945, 1.417654, 0.8677337, 0, 0.8039216, 1, 1,
0.1137558, -0.5633807, 3.680877, 0, 0.7960784, 1, 1,
0.1161119, 0.3484426, -2.020474, 0, 0.7882353, 1, 1,
0.1181755, 0.2637607, 0.6972976, 0, 0.7843137, 1, 1,
0.1223236, 2.020204, -0.3562199, 0, 0.7764706, 1, 1,
0.1257899, -1.726459, 2.126899, 0, 0.772549, 1, 1,
0.1287529, 1.788854, 0.02620945, 0, 0.7647059, 1, 1,
0.1294061, 0.9521962, -0.3502794, 0, 0.7607843, 1, 1,
0.130437, -0.9677854, 4.040961, 0, 0.7529412, 1, 1,
0.1325419, -0.9929447, 0.7845152, 0, 0.7490196, 1, 1,
0.1381018, -1.356932, 1.395417, 0, 0.7411765, 1, 1,
0.1394188, 0.0706146, 2.264862, 0, 0.7372549, 1, 1,
0.1422786, -0.4634741, 1.646015, 0, 0.7294118, 1, 1,
0.1441416, 0.2492197, -0.6722473, 0, 0.7254902, 1, 1,
0.1462513, -0.3737302, 3.452654, 0, 0.7176471, 1, 1,
0.1468497, 0.2496702, -0.7292544, 0, 0.7137255, 1, 1,
0.1476244, 0.5961488, 0.03723627, 0, 0.7058824, 1, 1,
0.147955, -0.9113265, 1.835723, 0, 0.6980392, 1, 1,
0.1501119, 1.118145, -1.138418, 0, 0.6941177, 1, 1,
0.1525751, -0.6820179, 2.267817, 0, 0.6862745, 1, 1,
0.1533011, -1.203611, 3.644394, 0, 0.682353, 1, 1,
0.1545775, 1.001388, 0.4609079, 0, 0.6745098, 1, 1,
0.1580885, -1.159836, 0.5819486, 0, 0.6705883, 1, 1,
0.1618518, 0.7481733, -0.1646379, 0, 0.6627451, 1, 1,
0.1631473, -0.6408415, 4.183527, 0, 0.6588235, 1, 1,
0.1633609, -1.349431, 4.522946, 0, 0.6509804, 1, 1,
0.1643768, -0.7840813, 3.26626, 0, 0.6470588, 1, 1,
0.1670939, 1.187156, 0.002709077, 0, 0.6392157, 1, 1,
0.1672121, 1.36409, 0.2650381, 0, 0.6352941, 1, 1,
0.1740115, 1.373009, -0.6800902, 0, 0.627451, 1, 1,
0.1772948, 0.1156548, 0.1083605, 0, 0.6235294, 1, 1,
0.1787824, 0.4914435, -0.02959777, 0, 0.6156863, 1, 1,
0.1789928, -0.8053996, 3.8766, 0, 0.6117647, 1, 1,
0.1818843, 2.056607, -0.9709479, 0, 0.6039216, 1, 1,
0.188778, 0.5628732, 0.7438457, 0, 0.5960785, 1, 1,
0.1929366, -0.6686397, 3.173537, 0, 0.5921569, 1, 1,
0.1946842, 0.599162, -0.0821659, 0, 0.5843138, 1, 1,
0.1951009, 1.444226, 0.4177112, 0, 0.5803922, 1, 1,
0.1995153, -1.096831, 4.556075, 0, 0.572549, 1, 1,
0.2000341, 0.2639858, 0.03714422, 0, 0.5686275, 1, 1,
0.202799, 0.3775847, 0.6870006, 0, 0.5607843, 1, 1,
0.2064764, -0.1091813, 0.9215443, 0, 0.5568628, 1, 1,
0.211621, 0.7693197, 0.06603332, 0, 0.5490196, 1, 1,
0.214087, -0.8828008, 2.843346, 0, 0.5450981, 1, 1,
0.2145777, 0.4511422, 0.735211, 0, 0.5372549, 1, 1,
0.2172508, 0.2659739, 0.6728208, 0, 0.5333334, 1, 1,
0.219453, 0.07254215, 1.484216, 0, 0.5254902, 1, 1,
0.2260883, 0.9479499, 1.072769, 0, 0.5215687, 1, 1,
0.2275824, -0.2778582, 0.9311089, 0, 0.5137255, 1, 1,
0.2313873, 0.6986033, -0.7942973, 0, 0.509804, 1, 1,
0.2376567, -0.5351837, 2.638563, 0, 0.5019608, 1, 1,
0.241254, -0.02886715, 1.278031, 0, 0.4941176, 1, 1,
0.2425843, -1.568578, 3.66033, 0, 0.4901961, 1, 1,
0.2443702, 0.1924569, 1.201617, 0, 0.4823529, 1, 1,
0.2469062, -0.1548923, 1.587223, 0, 0.4784314, 1, 1,
0.247174, 0.7288306, -1.362629, 0, 0.4705882, 1, 1,
0.2495934, 1.233939, -0.5638514, 0, 0.4666667, 1, 1,
0.2571051, -0.0003704807, 1.308383, 0, 0.4588235, 1, 1,
0.2586812, -1.595379, 4.371642, 0, 0.454902, 1, 1,
0.2596827, 0.005608311, 1.59303, 0, 0.4470588, 1, 1,
0.2610973, -0.1761652, 2.565021, 0, 0.4431373, 1, 1,
0.2615121, -0.4599793, 3.009184, 0, 0.4352941, 1, 1,
0.2656323, -0.04613383, 1.715129, 0, 0.4313726, 1, 1,
0.2696545, -0.08035266, 2.607436, 0, 0.4235294, 1, 1,
0.2698134, -0.4451939, 2.555982, 0, 0.4196078, 1, 1,
0.2761182, 1.118596, -0.3821606, 0, 0.4117647, 1, 1,
0.2791373, -0.796848, 2.74384, 0, 0.4078431, 1, 1,
0.2831859, 1.252894, -1.84248, 0, 0.4, 1, 1,
0.2858856, -0.7846708, 2.041865, 0, 0.3921569, 1, 1,
0.2872775, 1.493874, -1.381008, 0, 0.3882353, 1, 1,
0.287436, 0.1596957, 0.5539823, 0, 0.3803922, 1, 1,
0.296438, 0.5294088, -0.8488268, 0, 0.3764706, 1, 1,
0.2966734, 0.7127132, -1.383254, 0, 0.3686275, 1, 1,
0.2968494, 1.165423, -0.4274192, 0, 0.3647059, 1, 1,
0.3000731, -2.278115, 1.072731, 0, 0.3568628, 1, 1,
0.3064447, -0.2870544, 2.364019, 0, 0.3529412, 1, 1,
0.3079463, 0.1995038, 1.022948, 0, 0.345098, 1, 1,
0.308403, -0.2563482, 1.811315, 0, 0.3411765, 1, 1,
0.3165259, 0.6042717, 1.133122, 0, 0.3333333, 1, 1,
0.316532, -2.097988, 2.980392, 0, 0.3294118, 1, 1,
0.3179197, -0.3944987, 2.111014, 0, 0.3215686, 1, 1,
0.3188161, 0.8633672, -0.03355917, 0, 0.3176471, 1, 1,
0.3261128, -0.4526359, -0.4354407, 0, 0.3098039, 1, 1,
0.330316, 0.558908, 1.182523, 0, 0.3058824, 1, 1,
0.3326539, -0.8562421, 1.59314, 0, 0.2980392, 1, 1,
0.3399644, -0.6575842, 2.183524, 0, 0.2901961, 1, 1,
0.3426334, -0.02300353, 1.107981, 0, 0.2862745, 1, 1,
0.3502342, -0.5642717, 1.878623, 0, 0.2784314, 1, 1,
0.3522335, -0.3724018, 1.482099, 0, 0.2745098, 1, 1,
0.3551154, 0.7766533, 1.508224, 0, 0.2666667, 1, 1,
0.3600167, 1.221448, 0.9514646, 0, 0.2627451, 1, 1,
0.3711637, -1.103176, 2.703136, 0, 0.254902, 1, 1,
0.3713705, 0.7580478, 1.096297, 0, 0.2509804, 1, 1,
0.3767789, 1.607582, -0.2015514, 0, 0.2431373, 1, 1,
0.3773088, 0.09281535, -0.5407991, 0, 0.2392157, 1, 1,
0.382053, 0.5409785, 0.4789899, 0, 0.2313726, 1, 1,
0.3823074, 0.6265467, 1.440196, 0, 0.227451, 1, 1,
0.3826339, -0.201924, 1.560905, 0, 0.2196078, 1, 1,
0.3868227, 0.9091094, 0.7869809, 0, 0.2156863, 1, 1,
0.388314, -1.756164, 1.602393, 0, 0.2078431, 1, 1,
0.3940443, 1.009861, -1.266352, 0, 0.2039216, 1, 1,
0.3951972, 1.109921, -0.9373564, 0, 0.1960784, 1, 1,
0.3957229, -0.8550639, 2.65808, 0, 0.1882353, 1, 1,
0.4071518, -1.149087, 2.707677, 0, 0.1843137, 1, 1,
0.410116, -0.645966, 3.456513, 0, 0.1764706, 1, 1,
0.4103952, 0.8108793, -0.02602448, 0, 0.172549, 1, 1,
0.4115179, -0.6736983, 2.048134, 0, 0.1647059, 1, 1,
0.4159082, 0.2747368, 0.298455, 0, 0.1607843, 1, 1,
0.4169179, 1.395185, 0.2642416, 0, 0.1529412, 1, 1,
0.4171969, -0.958118, 2.07072, 0, 0.1490196, 1, 1,
0.4176228, -3.041678, 3.25223, 0, 0.1411765, 1, 1,
0.4178129, -0.5811625, 1.745619, 0, 0.1372549, 1, 1,
0.426523, 1.060179, -0.5403057, 0, 0.1294118, 1, 1,
0.4300268, 1.367173, 1.962377, 0, 0.1254902, 1, 1,
0.4332188, -0.7695551, 3.049639, 0, 0.1176471, 1, 1,
0.4353007, 0.163434, 1.151731, 0, 0.1137255, 1, 1,
0.4463481, -0.7519498, 3.249696, 0, 0.1058824, 1, 1,
0.4473037, -0.1401285, 0.690042, 0, 0.09803922, 1, 1,
0.4500463, -0.3892268, 1.733126, 0, 0.09411765, 1, 1,
0.4502608, -1.773605, 2.278823, 0, 0.08627451, 1, 1,
0.4503811, 0.2083796, 1.230333, 0, 0.08235294, 1, 1,
0.4551373, -0.02262788, 1.833937, 0, 0.07450981, 1, 1,
0.4554662, -1.362008, 2.54891, 0, 0.07058824, 1, 1,
0.4571772, -0.2588048, 1.97964, 0, 0.0627451, 1, 1,
0.4595948, 0.1085077, -0.3687997, 0, 0.05882353, 1, 1,
0.4639526, 1.117291, -0.4534727, 0, 0.05098039, 1, 1,
0.4643675, -1.545431, 2.312241, 0, 0.04705882, 1, 1,
0.464397, 1.254483, 2.924755, 0, 0.03921569, 1, 1,
0.4648903, 0.6369781, -0.03319745, 0, 0.03529412, 1, 1,
0.465165, 0.07190536, 2.801378, 0, 0.02745098, 1, 1,
0.4656452, 0.279766, 0.572455, 0, 0.02352941, 1, 1,
0.4688243, -1.073266, 1.832832, 0, 0.01568628, 1, 1,
0.4710689, -0.6429618, 3.491974, 0, 0.01176471, 1, 1,
0.4728517, -0.08509039, 0.06953166, 0, 0.003921569, 1, 1,
0.4729647, 0.3030048, 2.190759, 0.003921569, 0, 1, 1,
0.4736526, 0.5754406, -0.4288808, 0.007843138, 0, 1, 1,
0.4762904, 0.661409, 0.4119996, 0.01568628, 0, 1, 1,
0.4792277, 0.9169409, -0.1047186, 0.01960784, 0, 1, 1,
0.4939758, 1.988167, 0.4279692, 0.02745098, 0, 1, 1,
0.4984801, 0.2759727, 1.130825, 0.03137255, 0, 1, 1,
0.5006645, 0.09221675, 1.906844, 0.03921569, 0, 1, 1,
0.5050637, -1.3696, 1.986437, 0.04313726, 0, 1, 1,
0.5072421, -0.7695723, 2.698514, 0.05098039, 0, 1, 1,
0.5083669, -2.426211, 2.648718, 0.05490196, 0, 1, 1,
0.5109616, -1.882125, 3.127876, 0.0627451, 0, 1, 1,
0.5117776, -0.5592906, 3.740969, 0.06666667, 0, 1, 1,
0.5147207, 0.7390495, 1.68733, 0.07450981, 0, 1, 1,
0.5170116, -0.8809391, 3.103618, 0.07843138, 0, 1, 1,
0.5205283, -1.245132, 2.385923, 0.08627451, 0, 1, 1,
0.5243334, 1.356665, 0.5964266, 0.09019608, 0, 1, 1,
0.5264439, 0.6764256, -0.9200867, 0.09803922, 0, 1, 1,
0.5359527, -0.8337539, 1.999319, 0.1058824, 0, 1, 1,
0.5437408, -0.01327915, 1.71021, 0.1098039, 0, 1, 1,
0.545562, -0.829565, 2.573769, 0.1176471, 0, 1, 1,
0.5472577, 0.03631148, 0.5396553, 0.1215686, 0, 1, 1,
0.5486174, 0.5254943, 1.10326, 0.1294118, 0, 1, 1,
0.5493189, 2.014558, 0.7091736, 0.1333333, 0, 1, 1,
0.5501248, -1.70655, 3.210645, 0.1411765, 0, 1, 1,
0.5514476, -0.3219187, 2.257418, 0.145098, 0, 1, 1,
0.5533679, -0.4146808, 2.130519, 0.1529412, 0, 1, 1,
0.5541561, -0.420689, 2.489668, 0.1568628, 0, 1, 1,
0.5574122, -1.42213, 2.661923, 0.1647059, 0, 1, 1,
0.557934, -1.696264, 2.595406, 0.1686275, 0, 1, 1,
0.5592127, -0.7039539, 1.272745, 0.1764706, 0, 1, 1,
0.563312, -1.390338, 3.241898, 0.1803922, 0, 1, 1,
0.5669731, 0.5226644, 1.252232, 0.1882353, 0, 1, 1,
0.5709455, -1.802979, 3.013354, 0.1921569, 0, 1, 1,
0.5733282, -0.04184, 1.343007, 0.2, 0, 1, 1,
0.5747968, -1.590508, 4.502674, 0.2078431, 0, 1, 1,
0.5753259, -0.3302604, 1.716502, 0.2117647, 0, 1, 1,
0.5767386, 2.084534, 0.0715671, 0.2196078, 0, 1, 1,
0.5798612, 0.1390371, 0.2234359, 0.2235294, 0, 1, 1,
0.5800549, 0.3505511, 1.71365, 0.2313726, 0, 1, 1,
0.5812243, 0.1978671, -0.5469893, 0.2352941, 0, 1, 1,
0.5863076, 0.255345, -0.7602605, 0.2431373, 0, 1, 1,
0.6007257, 0.3810927, 1.079321, 0.2470588, 0, 1, 1,
0.6026114, 0.0955629, 0.6832668, 0.254902, 0, 1, 1,
0.6030773, 0.07756921, 1.013844, 0.2588235, 0, 1, 1,
0.6122191, -1.660071, 3.276928, 0.2666667, 0, 1, 1,
0.6156026, 0.5645784, 2.715956, 0.2705882, 0, 1, 1,
0.6163441, 0.7930356, -0.08274029, 0.2784314, 0, 1, 1,
0.6191115, -0.3031656, 1.592705, 0.282353, 0, 1, 1,
0.6271341, 0.4401798, -0.1735374, 0.2901961, 0, 1, 1,
0.6292035, -0.1171938, 1.261028, 0.2941177, 0, 1, 1,
0.6326616, -1.033348, 2.545781, 0.3019608, 0, 1, 1,
0.6334099, -0.9954473, 3.189608, 0.3098039, 0, 1, 1,
0.6351106, 0.4014748, 2.466442, 0.3137255, 0, 1, 1,
0.6380762, -0.4879811, 0.6144331, 0.3215686, 0, 1, 1,
0.6459721, 0.9666658, 0.6791006, 0.3254902, 0, 1, 1,
0.6493957, 0.3290768, 0.8098647, 0.3333333, 0, 1, 1,
0.6497132, -0.9709277, 2.772738, 0.3372549, 0, 1, 1,
0.6513743, 1.301035, 0.8617716, 0.345098, 0, 1, 1,
0.6569179, -0.5614016, 2.2838, 0.3490196, 0, 1, 1,
0.6573862, -0.9861271, 3.397986, 0.3568628, 0, 1, 1,
0.6635148, 0.6798866, -0.3322128, 0.3607843, 0, 1, 1,
0.663525, 0.8317748, 0.4234151, 0.3686275, 0, 1, 1,
0.6667992, 0.3770486, -0.1428901, 0.372549, 0, 1, 1,
0.6791248, 1.93337, -0.3169763, 0.3803922, 0, 1, 1,
0.6831058, 1.256951, -0.3886477, 0.3843137, 0, 1, 1,
0.6863788, -0.8597158, 3.335814, 0.3921569, 0, 1, 1,
0.6873499, -0.7067193, 4.07791, 0.3960784, 0, 1, 1,
0.6881002, -0.3111227, 3.081949, 0.4039216, 0, 1, 1,
0.6973656, -0.8850582, 1.699595, 0.4117647, 0, 1, 1,
0.7005879, -0.6214723, 1.714034, 0.4156863, 0, 1, 1,
0.7081767, 1.70788, -1.137482, 0.4235294, 0, 1, 1,
0.7135262, 0.2684835, 0.8265904, 0.427451, 0, 1, 1,
0.7203616, 0.01138904, 2.380206, 0.4352941, 0, 1, 1,
0.7206878, 0.4550274, 1.112301, 0.4392157, 0, 1, 1,
0.7211329, -0.3642218, 1.433269, 0.4470588, 0, 1, 1,
0.7224581, -0.8074192, 2.729797, 0.4509804, 0, 1, 1,
0.7299086, -0.3586828, 3.731944, 0.4588235, 0, 1, 1,
0.7329679, 1.369039, 1.499347, 0.4627451, 0, 1, 1,
0.7351872, 1.017397, 2.581435, 0.4705882, 0, 1, 1,
0.7380168, 1.46077, 1.080465, 0.4745098, 0, 1, 1,
0.7475985, -0.5488467, 3.553631, 0.4823529, 0, 1, 1,
0.7538681, 1.203672, 3.215106, 0.4862745, 0, 1, 1,
0.7540852, 0.8184131, 0.760518, 0.4941176, 0, 1, 1,
0.7551468, 1.730859, -1.578619, 0.5019608, 0, 1, 1,
0.756285, -0.3698743, 1.573449, 0.5058824, 0, 1, 1,
0.7571833, 1.074504, 2.432796, 0.5137255, 0, 1, 1,
0.7623914, -1.165486, 3.817947, 0.5176471, 0, 1, 1,
0.7665884, -1.248142, 4.285224, 0.5254902, 0, 1, 1,
0.7679982, 0.2801714, -0.2614059, 0.5294118, 0, 1, 1,
0.7712665, 0.7074657, 2.510423, 0.5372549, 0, 1, 1,
0.7754921, -0.3013605, -0.5536935, 0.5411765, 0, 1, 1,
0.7758193, -1.350489, 2.768628, 0.5490196, 0, 1, 1,
0.7826979, -1.127908, 3.468833, 0.5529412, 0, 1, 1,
0.7978031, -0.842353, 2.868567, 0.5607843, 0, 1, 1,
0.7988759, 0.3545645, 1.216439, 0.5647059, 0, 1, 1,
0.8022823, 0.4942262, 0.9064153, 0.572549, 0, 1, 1,
0.802754, -1.929633, 0.3716094, 0.5764706, 0, 1, 1,
0.8040307, 1.516927, -0.1610345, 0.5843138, 0, 1, 1,
0.8137506, 1.257277, 2.175683, 0.5882353, 0, 1, 1,
0.8166158, -0.1103427, 1.487042, 0.5960785, 0, 1, 1,
0.8177109, -0.2518987, 2.740912, 0.6039216, 0, 1, 1,
0.8187002, -1.307184, 1.919672, 0.6078432, 0, 1, 1,
0.8211228, -0.6883389, 3.218297, 0.6156863, 0, 1, 1,
0.8259004, -1.278282, 3.550102, 0.6196079, 0, 1, 1,
0.8453961, 1.568787, 0.735112, 0.627451, 0, 1, 1,
0.8458509, 0.7429776, 0.2022588, 0.6313726, 0, 1, 1,
0.8469766, -0.3160969, 2.296735, 0.6392157, 0, 1, 1,
0.8489687, -0.4751959, 1.529399, 0.6431373, 0, 1, 1,
0.8520131, 0.3692073, -0.2031902, 0.6509804, 0, 1, 1,
0.8582047, -0.5586205, 2.776335, 0.654902, 0, 1, 1,
0.8590921, 1.349221, 0.5803323, 0.6627451, 0, 1, 1,
0.8713517, -0.2662205, 1.545622, 0.6666667, 0, 1, 1,
0.8723322, -0.0901617, 0.6342111, 0.6745098, 0, 1, 1,
0.8748187, -0.3696402, 0.5357814, 0.6784314, 0, 1, 1,
0.8752971, -0.143557, 1.02964, 0.6862745, 0, 1, 1,
0.8761011, -3.033338, 2.542989, 0.6901961, 0, 1, 1,
0.8789792, 0.07832248, 0.3416798, 0.6980392, 0, 1, 1,
0.8817428, 0.8124419, -0.265405, 0.7058824, 0, 1, 1,
0.882233, 0.4550034, 0.1104836, 0.7098039, 0, 1, 1,
0.8829029, 0.6477566, 2.350901, 0.7176471, 0, 1, 1,
0.8898369, 0.543761, 0.2389438, 0.7215686, 0, 1, 1,
0.8951128, 0.2081476, 0.9094005, 0.7294118, 0, 1, 1,
0.8962482, -0.1348951, 0.4164229, 0.7333333, 0, 1, 1,
0.9058282, 0.003614531, 1.077826, 0.7411765, 0, 1, 1,
0.9111535, 0.6821364, 1.365803, 0.7450981, 0, 1, 1,
0.9112864, -0.4170069, 2.636093, 0.7529412, 0, 1, 1,
0.9128178, 0.5970698, 2.682652, 0.7568628, 0, 1, 1,
0.9167663, 0.416462, 1.879744, 0.7647059, 0, 1, 1,
0.9169744, -1.011052, 1.987947, 0.7686275, 0, 1, 1,
0.917606, -0.4671985, 2.587059, 0.7764706, 0, 1, 1,
0.9183298, 0.6829007, 0.285486, 0.7803922, 0, 1, 1,
0.9209856, 1.044811, 1.030176, 0.7882353, 0, 1, 1,
0.9225053, 1.355617, 2.26127, 0.7921569, 0, 1, 1,
0.9227287, -1.804482, 1.920616, 0.8, 0, 1, 1,
0.9236821, -0.6906707, 2.202774, 0.8078431, 0, 1, 1,
0.9245433, -0.2982046, 2.054811, 0.8117647, 0, 1, 1,
0.9276341, 0.5246558, -0.1967954, 0.8196079, 0, 1, 1,
0.9314391, 0.1921865, 1.626069, 0.8235294, 0, 1, 1,
0.9408023, 0.8141162, -0.7406552, 0.8313726, 0, 1, 1,
0.9424211, -0.2757067, 1.716399, 0.8352941, 0, 1, 1,
0.9547276, -0.1968224, 1.575956, 0.8431373, 0, 1, 1,
0.9557309, -1.533212, 2.535426, 0.8470588, 0, 1, 1,
0.956333, 4.348846, 0.6825383, 0.854902, 0, 1, 1,
0.9586174, 0.4040824, 1.800843, 0.8588235, 0, 1, 1,
0.9594123, 0.5140486, 2.116036, 0.8666667, 0, 1, 1,
0.9600989, -0.1950722, 1.934824, 0.8705882, 0, 1, 1,
0.9605433, 0.173671, 2.252171, 0.8784314, 0, 1, 1,
0.9612274, 0.2709161, 0.9282369, 0.8823529, 0, 1, 1,
0.9621637, 0.2733414, 1.827812, 0.8901961, 0, 1, 1,
0.972863, 0.6572853, 0.7961313, 0.8941177, 0, 1, 1,
0.9805567, 0.4909636, 1.109189, 0.9019608, 0, 1, 1,
0.9815781, 1.047672, 0.1521494, 0.9098039, 0, 1, 1,
0.983856, -1.333878, 4.759364, 0.9137255, 0, 1, 1,
0.9861199, 0.1819481, 1.662867, 0.9215686, 0, 1, 1,
0.9910798, -0.2905869, 0.7882729, 0.9254902, 0, 1, 1,
0.9967139, -1.560419, 1.49368, 0.9333333, 0, 1, 1,
1.000615, -0.3582662, 2.771332, 0.9372549, 0, 1, 1,
1.013459, 0.3983742, 1.1519, 0.945098, 0, 1, 1,
1.01414, 0.15312, 0.7778291, 0.9490196, 0, 1, 1,
1.017059, 1.660906, -1.511257, 0.9568627, 0, 1, 1,
1.018976, 1.192672, 2.262572, 0.9607843, 0, 1, 1,
1.024734, 1.241343, 1.828625, 0.9686275, 0, 1, 1,
1.024939, -1.767146, 3.154262, 0.972549, 0, 1, 1,
1.032659, -0.6563468, 2.107029, 0.9803922, 0, 1, 1,
1.03484, -0.1241799, -0.2915048, 0.9843137, 0, 1, 1,
1.036201, -0.4160832, 1.475042, 0.9921569, 0, 1, 1,
1.056089, -0.06566295, 2.405686, 0.9960784, 0, 1, 1,
1.057621, -0.5472831, 1.649085, 1, 0, 0.9960784, 1,
1.057884, 0.7080238, 0.8700898, 1, 0, 0.9882353, 1,
1.062753, 0.06063851, 1.249099, 1, 0, 0.9843137, 1,
1.064175, -1.139056, 0.7680665, 1, 0, 0.9764706, 1,
1.064998, 2.438849, -0.4264481, 1, 0, 0.972549, 1,
1.066288, -0.1778304, 0.9067828, 1, 0, 0.9647059, 1,
1.073686, -2.272362, 2.794987, 1, 0, 0.9607843, 1,
1.094041, -1.661962, 1.794502, 1, 0, 0.9529412, 1,
1.101489, 0.3951367, 2.393108, 1, 0, 0.9490196, 1,
1.107609, -1.039308, 2.678019, 1, 0, 0.9411765, 1,
1.107992, 0.4963011, 2.125692, 1, 0, 0.9372549, 1,
1.110895, -0.4561885, 1.064364, 1, 0, 0.9294118, 1,
1.112178, 0.812028, 0.3946034, 1, 0, 0.9254902, 1,
1.117788, -0.0295868, 2.55816, 1, 0, 0.9176471, 1,
1.120173, -1.146658, 2.378913, 1, 0, 0.9137255, 1,
1.122292, -1.588578, 1.994121, 1, 0, 0.9058824, 1,
1.123054, 1.221406, -1.637185, 1, 0, 0.9019608, 1,
1.124285, 0.902654, -0.1018059, 1, 0, 0.8941177, 1,
1.125619, 1.637714, 0.003603641, 1, 0, 0.8862745, 1,
1.13848, -0.1098585, 0.73548, 1, 0, 0.8823529, 1,
1.146068, 0.1091857, 1.517929, 1, 0, 0.8745098, 1,
1.147476, 0.002365249, 3.523777, 1, 0, 0.8705882, 1,
1.148714, 1.116757, 0.6402805, 1, 0, 0.8627451, 1,
1.149148, 0.2307667, 1.084333, 1, 0, 0.8588235, 1,
1.152574, -1.383823, 1.587293, 1, 0, 0.8509804, 1,
1.154245, 0.7267712, 1.637524, 1, 0, 0.8470588, 1,
1.162673, -3.204464, 2.06413, 1, 0, 0.8392157, 1,
1.16283, -1.719122, 1.378783, 1, 0, 0.8352941, 1,
1.169868, 0.8618, 0.6471486, 1, 0, 0.827451, 1,
1.171913, 0.9760181, 0.5114397, 1, 0, 0.8235294, 1,
1.175979, 0.62234, 0.6012967, 1, 0, 0.8156863, 1,
1.176251, -1.34437, 3.339157, 1, 0, 0.8117647, 1,
1.19056, -1.028874, 2.42421, 1, 0, 0.8039216, 1,
1.199962, 1.525837, -0.5598902, 1, 0, 0.7960784, 1,
1.200677, 0.02571038, 3.308555, 1, 0, 0.7921569, 1,
1.201385, -1.499269, 2.942192, 1, 0, 0.7843137, 1,
1.202053, -1.034648, 1.205732, 1, 0, 0.7803922, 1,
1.208073, -1.957351, 2.492075, 1, 0, 0.772549, 1,
1.216387, 0.3259139, 0.0843389, 1, 0, 0.7686275, 1,
1.223624, -0.977791, 2.111445, 1, 0, 0.7607843, 1,
1.228811, 0.05966975, 0.6423603, 1, 0, 0.7568628, 1,
1.251643, 1.836451, 1.242207, 1, 0, 0.7490196, 1,
1.25481, 0.413631, 0.4900777, 1, 0, 0.7450981, 1,
1.263638, 0.4624231, 0.9650536, 1, 0, 0.7372549, 1,
1.265004, 1.023828, 2.816873, 1, 0, 0.7333333, 1,
1.265909, 0.06347656, 2.5743, 1, 0, 0.7254902, 1,
1.274458, -0.9468389, 3.462254, 1, 0, 0.7215686, 1,
1.277793, -0.1481269, 0.1054687, 1, 0, 0.7137255, 1,
1.280132, 0.1536386, 2.624242, 1, 0, 0.7098039, 1,
1.286393, -0.1316139, 3.651141, 1, 0, 0.7019608, 1,
1.286722, -1.095385, 2.868013, 1, 0, 0.6941177, 1,
1.286828, -1.365649, 0.5270426, 1, 0, 0.6901961, 1,
1.287894, -0.9900827, 1.552369, 1, 0, 0.682353, 1,
1.292109, -1.378015, 1.95752, 1, 0, 0.6784314, 1,
1.293392, -0.2364388, 1.329182, 1, 0, 0.6705883, 1,
1.306858, -1.314019, 0.6821447, 1, 0, 0.6666667, 1,
1.312436, 0.1847498, 0.9228294, 1, 0, 0.6588235, 1,
1.316695, 0.07456694, 1.057895, 1, 0, 0.654902, 1,
1.319982, 0.1566667, 2.042494, 1, 0, 0.6470588, 1,
1.322302, -0.2997752, 1.258248, 1, 0, 0.6431373, 1,
1.322496, -0.7052192, 2.092351, 1, 0, 0.6352941, 1,
1.326957, -0.9592139, 2.567972, 1, 0, 0.6313726, 1,
1.331777, -0.1209977, 1.158168, 1, 0, 0.6235294, 1,
1.333211, -0.791989, 3.308243, 1, 0, 0.6196079, 1,
1.334356, -1.324168, 1.453812, 1, 0, 0.6117647, 1,
1.334371, -1.930251, 3.732676, 1, 0, 0.6078432, 1,
1.337221, 0.8452563, 2.135866, 1, 0, 0.6, 1,
1.339897, 0.8514696, 0.367498, 1, 0, 0.5921569, 1,
1.343929, -0.8462855, 2.701232, 1, 0, 0.5882353, 1,
1.355433, -1.679146, 2.754375, 1, 0, 0.5803922, 1,
1.357455, -0.3323918, 1.316001, 1, 0, 0.5764706, 1,
1.358192, 0.5823311, 1.165628, 1, 0, 0.5686275, 1,
1.360094, 1.458162, 1.277545, 1, 0, 0.5647059, 1,
1.362288, -0.5714445, 2.529884, 1, 0, 0.5568628, 1,
1.365582, -0.8090618, 1.328626, 1, 0, 0.5529412, 1,
1.374598, -0.7636926, 1.667422, 1, 0, 0.5450981, 1,
1.378041, 1.14762, 1.108528, 1, 0, 0.5411765, 1,
1.391612, 0.8781256, 1.853421, 1, 0, 0.5333334, 1,
1.39995, -0.4307724, 3.242889, 1, 0, 0.5294118, 1,
1.401582, -1.612933, 0.8509151, 1, 0, 0.5215687, 1,
1.405279, -0.6451676, 0.7977601, 1, 0, 0.5176471, 1,
1.409539, -1.263731, 2.847758, 1, 0, 0.509804, 1,
1.410712, -0.1166594, 2.074479, 1, 0, 0.5058824, 1,
1.412688, 0.1035376, 1.148646, 1, 0, 0.4980392, 1,
1.413058, 0.4594609, 3.450752, 1, 0, 0.4901961, 1,
1.413175, -0.2887114, 1.727115, 1, 0, 0.4862745, 1,
1.420179, 0.9254468, 2.364194, 1, 0, 0.4784314, 1,
1.420325, 1.092536, 0.9025654, 1, 0, 0.4745098, 1,
1.421706, -0.4798294, 3.805961, 1, 0, 0.4666667, 1,
1.424044, 1.230593, -0.5756918, 1, 0, 0.4627451, 1,
1.427261, 0.08947471, 0.6374679, 1, 0, 0.454902, 1,
1.42846, 0.3353116, 1.952415, 1, 0, 0.4509804, 1,
1.446486, -0.1820971, 2.686747, 1, 0, 0.4431373, 1,
1.459959, 0.2142746, 1.136205, 1, 0, 0.4392157, 1,
1.462213, 0.3433966, 3.30775, 1, 0, 0.4313726, 1,
1.465557, -0.9350947, 1.701381, 1, 0, 0.427451, 1,
1.468169, 0.9269748, 2.471855, 1, 0, 0.4196078, 1,
1.471479, 0.5970401, 1.673573, 1, 0, 0.4156863, 1,
1.477755, -0.1983481, 1.501451, 1, 0, 0.4078431, 1,
1.47913, -1.670254, 3.132705, 1, 0, 0.4039216, 1,
1.488378, 0.18122, 0.9962974, 1, 0, 0.3960784, 1,
1.494573, 0.1507173, 1.29324, 1, 0, 0.3882353, 1,
1.495206, -1.509435, 2.444014, 1, 0, 0.3843137, 1,
1.507327, 0.4990343, 0.7883837, 1, 0, 0.3764706, 1,
1.510353, 0.6997754, -0.2215875, 1, 0, 0.372549, 1,
1.523121, -0.06569761, -1.009555, 1, 0, 0.3647059, 1,
1.532145, 0.8484856, 2.982086, 1, 0, 0.3607843, 1,
1.53961, -2.045093, 4.083266, 1, 0, 0.3529412, 1,
1.562864, 1.155896, 0.3063687, 1, 0, 0.3490196, 1,
1.581605, -0.5291666, 1.950002, 1, 0, 0.3411765, 1,
1.589417, -1.3094, 2.115354, 1, 0, 0.3372549, 1,
1.607649, 0.7383782, 0.5584202, 1, 0, 0.3294118, 1,
1.612164, -1.307131, 1.809104, 1, 0, 0.3254902, 1,
1.6211, -0.2818409, 1.033793, 1, 0, 0.3176471, 1,
1.635799, 0.8068485, 0.8395395, 1, 0, 0.3137255, 1,
1.648136, 1.853703, -0.5383358, 1, 0, 0.3058824, 1,
1.648407, -1.066539, 3.011677, 1, 0, 0.2980392, 1,
1.653928, 0.5161176, 1.820125, 1, 0, 0.2941177, 1,
1.655882, -2.286581, 3.677438, 1, 0, 0.2862745, 1,
1.677861, 0.7133182, 1.328918, 1, 0, 0.282353, 1,
1.677936, 0.2846694, 1.956746, 1, 0, 0.2745098, 1,
1.679571, -0.04789129, 0.4984714, 1, 0, 0.2705882, 1,
1.68005, 0.5691035, 1.491658, 1, 0, 0.2627451, 1,
1.698249, -1.467548, 3.720942, 1, 0, 0.2588235, 1,
1.699856, 1.231803, 0.0801121, 1, 0, 0.2509804, 1,
1.749099, -0.7696905, 1.247154, 1, 0, 0.2470588, 1,
1.750439, 0.4603868, 1.095456, 1, 0, 0.2392157, 1,
1.782783, -0.4078521, 2.831906, 1, 0, 0.2352941, 1,
1.792556, 0.7146218, 2.333402, 1, 0, 0.227451, 1,
1.794997, -1.224789, 3.259868, 1, 0, 0.2235294, 1,
1.795423, -1.321979, 2.401303, 1, 0, 0.2156863, 1,
1.801666, 1.296585, 1.700605, 1, 0, 0.2117647, 1,
1.826057, 1.732334, -0.1605581, 1, 0, 0.2039216, 1,
1.831607, -1.181792, 2.296562, 1, 0, 0.1960784, 1,
1.846456, 0.1451595, 1.979083, 1, 0, 0.1921569, 1,
1.848774, -0.2467213, 0.9786322, 1, 0, 0.1843137, 1,
1.850301, 1.40838, 1.965051, 1, 0, 0.1803922, 1,
1.866205, -0.3864719, 0.7562315, 1, 0, 0.172549, 1,
1.869242, 0.1186658, 2.772584, 1, 0, 0.1686275, 1,
1.872905, 1.261782, 0.4103481, 1, 0, 0.1607843, 1,
1.920291, -0.3233605, 1.925927, 1, 0, 0.1568628, 1,
1.923681, -1.095634, 1.209577, 1, 0, 0.1490196, 1,
1.954133, 0.1362271, 1.566447, 1, 0, 0.145098, 1,
1.97742, -0.5084943, 2.129714, 1, 0, 0.1372549, 1,
1.988089, 0.3011035, 0.9152424, 1, 0, 0.1333333, 1,
2.023567, -0.4078989, 0.975265, 1, 0, 0.1254902, 1,
2.051503, 0.1708555, 1.019207, 1, 0, 0.1215686, 1,
2.060809, -0.2518232, 0.9340476, 1, 0, 0.1137255, 1,
2.068932, -0.1897209, 1.480472, 1, 0, 0.1098039, 1,
2.094311, 1.003569, 2.067208, 1, 0, 0.1019608, 1,
2.120934, 0.5979399, -0.09915131, 1, 0, 0.09411765, 1,
2.158911, -0.05342632, 2.490107, 1, 0, 0.09019608, 1,
2.198215, 1.467963, 1.841916, 1, 0, 0.08235294, 1,
2.201105, -0.8641937, 0.6033493, 1, 0, 0.07843138, 1,
2.207936, 0.6717911, -1.183134, 1, 0, 0.07058824, 1,
2.224906, 0.4047067, 1.853739, 1, 0, 0.06666667, 1,
2.272167, 0.4795337, -0.3307111, 1, 0, 0.05882353, 1,
2.296694, 0.02210169, 4.016346, 1, 0, 0.05490196, 1,
2.367374, -0.9515179, 2.868814, 1, 0, 0.04705882, 1,
2.374183, -0.01075923, 1.72489, 1, 0, 0.04313726, 1,
2.433184, 1.284071, 1.163944, 1, 0, 0.03529412, 1,
2.46088, 0.2696076, 0.1286083, 1, 0, 0.03137255, 1,
2.516855, -0.6321533, 1.477922, 1, 0, 0.02352941, 1,
2.67511, -1.020334, 1.115444, 1, 0, 0.01960784, 1,
2.960788, 0.9911637, 0.5986882, 1, 0, 0.01176471, 1,
3.209383, 0.6574193, 0.9341245, 1, 0, 0.007843138, 1
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
0.2440637, -4.48475, -6.89437, 0, -0.5, 0.5, 0.5,
0.2440637, -4.48475, -6.89437, 1, -0.5, 0.5, 0.5,
0.2440637, -4.48475, -6.89437, 1, 1.5, 0.5, 0.5,
0.2440637, -4.48475, -6.89437, 0, 1.5, 0.5, 0.5
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
-3.726498, 0.572191, -6.89437, 0, -0.5, 0.5, 0.5,
-3.726498, 0.572191, -6.89437, 1, -0.5, 0.5, 0.5,
-3.726498, 0.572191, -6.89437, 1, 1.5, 0.5, 0.5,
-3.726498, 0.572191, -6.89437, 0, 1.5, 0.5, 0.5
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
-3.726498, -4.48475, -0.2229934, 0, -0.5, 0.5, 0.5,
-3.726498, -4.48475, -0.2229934, 1, -0.5, 0.5, 0.5,
-3.726498, -4.48475, -0.2229934, 1, 1.5, 0.5, 0.5,
-3.726498, -4.48475, -0.2229934, 0, 1.5, 0.5, 0.5
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
-2, -3.317764, -5.354821,
3, -3.317764, -5.354821,
-2, -3.317764, -5.354821,
-2, -3.512261, -5.611413,
-1, -3.317764, -5.354821,
-1, -3.512261, -5.611413,
0, -3.317764, -5.354821,
0, -3.512261, -5.611413,
1, -3.317764, -5.354821,
1, -3.512261, -5.611413,
2, -3.317764, -5.354821,
2, -3.512261, -5.611413,
3, -3.317764, -5.354821,
3, -3.512261, -5.611413
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
-2, -3.901257, -6.124595, 0, -0.5, 0.5, 0.5,
-2, -3.901257, -6.124595, 1, -0.5, 0.5, 0.5,
-2, -3.901257, -6.124595, 1, 1.5, 0.5, 0.5,
-2, -3.901257, -6.124595, 0, 1.5, 0.5, 0.5,
-1, -3.901257, -6.124595, 0, -0.5, 0.5, 0.5,
-1, -3.901257, -6.124595, 1, -0.5, 0.5, 0.5,
-1, -3.901257, -6.124595, 1, 1.5, 0.5, 0.5,
-1, -3.901257, -6.124595, 0, 1.5, 0.5, 0.5,
0, -3.901257, -6.124595, 0, -0.5, 0.5, 0.5,
0, -3.901257, -6.124595, 1, -0.5, 0.5, 0.5,
0, -3.901257, -6.124595, 1, 1.5, 0.5, 0.5,
0, -3.901257, -6.124595, 0, 1.5, 0.5, 0.5,
1, -3.901257, -6.124595, 0, -0.5, 0.5, 0.5,
1, -3.901257, -6.124595, 1, -0.5, 0.5, 0.5,
1, -3.901257, -6.124595, 1, 1.5, 0.5, 0.5,
1, -3.901257, -6.124595, 0, 1.5, 0.5, 0.5,
2, -3.901257, -6.124595, 0, -0.5, 0.5, 0.5,
2, -3.901257, -6.124595, 1, -0.5, 0.5, 0.5,
2, -3.901257, -6.124595, 1, 1.5, 0.5, 0.5,
2, -3.901257, -6.124595, 0, 1.5, 0.5, 0.5,
3, -3.901257, -6.124595, 0, -0.5, 0.5, 0.5,
3, -3.901257, -6.124595, 1, -0.5, 0.5, 0.5,
3, -3.901257, -6.124595, 1, 1.5, 0.5, 0.5,
3, -3.901257, -6.124595, 0, 1.5, 0.5, 0.5
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
-2.810215, -2, -5.354821,
-2.810215, 4, -5.354821,
-2.810215, -2, -5.354821,
-2.962929, -2, -5.611413,
-2.810215, 0, -5.354821,
-2.962929, 0, -5.611413,
-2.810215, 2, -5.354821,
-2.962929, 2, -5.611413,
-2.810215, 4, -5.354821,
-2.962929, 4, -5.611413
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
"0",
"2",
"4"
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
-3.268357, -2, -6.124595, 0, -0.5, 0.5, 0.5,
-3.268357, -2, -6.124595, 1, -0.5, 0.5, 0.5,
-3.268357, -2, -6.124595, 1, 1.5, 0.5, 0.5,
-3.268357, -2, -6.124595, 0, 1.5, 0.5, 0.5,
-3.268357, 0, -6.124595, 0, -0.5, 0.5, 0.5,
-3.268357, 0, -6.124595, 1, -0.5, 0.5, 0.5,
-3.268357, 0, -6.124595, 1, 1.5, 0.5, 0.5,
-3.268357, 0, -6.124595, 0, 1.5, 0.5, 0.5,
-3.268357, 2, -6.124595, 0, -0.5, 0.5, 0.5,
-3.268357, 2, -6.124595, 1, -0.5, 0.5, 0.5,
-3.268357, 2, -6.124595, 1, 1.5, 0.5, 0.5,
-3.268357, 2, -6.124595, 0, 1.5, 0.5, 0.5,
-3.268357, 4, -6.124595, 0, -0.5, 0.5, 0.5,
-3.268357, 4, -6.124595, 1, -0.5, 0.5, 0.5,
-3.268357, 4, -6.124595, 1, 1.5, 0.5, 0.5,
-3.268357, 4, -6.124595, 0, 1.5, 0.5, 0.5
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
-2.810215, -3.317764, -4,
-2.810215, -3.317764, 4,
-2.810215, -3.317764, -4,
-2.962929, -3.512261, -4,
-2.810215, -3.317764, -2,
-2.962929, -3.512261, -2,
-2.810215, -3.317764, 0,
-2.962929, -3.512261, 0,
-2.810215, -3.317764, 2,
-2.962929, -3.512261, 2,
-2.810215, -3.317764, 4,
-2.962929, -3.512261, 4
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
-3.268357, -3.901257, -4, 0, -0.5, 0.5, 0.5,
-3.268357, -3.901257, -4, 1, -0.5, 0.5, 0.5,
-3.268357, -3.901257, -4, 1, 1.5, 0.5, 0.5,
-3.268357, -3.901257, -4, 0, 1.5, 0.5, 0.5,
-3.268357, -3.901257, -2, 0, -0.5, 0.5, 0.5,
-3.268357, -3.901257, -2, 1, -0.5, 0.5, 0.5,
-3.268357, -3.901257, -2, 1, 1.5, 0.5, 0.5,
-3.268357, -3.901257, -2, 0, 1.5, 0.5, 0.5,
-3.268357, -3.901257, 0, 0, -0.5, 0.5, 0.5,
-3.268357, -3.901257, 0, 1, -0.5, 0.5, 0.5,
-3.268357, -3.901257, 0, 1, 1.5, 0.5, 0.5,
-3.268357, -3.901257, 0, 0, 1.5, 0.5, 0.5,
-3.268357, -3.901257, 2, 0, -0.5, 0.5, 0.5,
-3.268357, -3.901257, 2, 1, -0.5, 0.5, 0.5,
-3.268357, -3.901257, 2, 1, 1.5, 0.5, 0.5,
-3.268357, -3.901257, 2, 0, 1.5, 0.5, 0.5,
-3.268357, -3.901257, 4, 0, -0.5, 0.5, 0.5,
-3.268357, -3.901257, 4, 1, -0.5, 0.5, 0.5,
-3.268357, -3.901257, 4, 1, 1.5, 0.5, 0.5,
-3.268357, -3.901257, 4, 0, 1.5, 0.5, 0.5
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
-2.810215, -3.317764, -5.354821,
-2.810215, 4.462146, -5.354821,
-2.810215, -3.317764, 4.908834,
-2.810215, 4.462146, 4.908834,
-2.810215, -3.317764, -5.354821,
-2.810215, -3.317764, 4.908834,
-2.810215, 4.462146, -5.354821,
-2.810215, 4.462146, 4.908834,
-2.810215, -3.317764, -5.354821,
3.298342, -3.317764, -5.354821,
-2.810215, -3.317764, 4.908834,
3.298342, -3.317764, 4.908834,
-2.810215, 4.462146, -5.354821,
3.298342, 4.462146, -5.354821,
-2.810215, 4.462146, 4.908834,
3.298342, 4.462146, 4.908834,
3.298342, -3.317764, -5.354821,
3.298342, 4.462146, -5.354821,
3.298342, -3.317764, 4.908834,
3.298342, 4.462146, 4.908834,
3.298342, -3.317764, -5.354821,
3.298342, -3.317764, 4.908834,
3.298342, 4.462146, -5.354821,
3.298342, 4.462146, 4.908834
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
var radius = 7.611501;
var distance = 33.86443;
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
mvMatrix.translate( -0.2440637, -0.572191, 0.2229934 );
mvMatrix.scale( 1.347242, 1.057815, 0.8018297 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.86443);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
DHA<-read.table("DHA.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DHA$V2
```

```
## Error in eval(expr, envir, enclos): object 'DHA' not found
```

```r
y<-DHA$V3
```

```
## Error in eval(expr, envir, enclos): object 'DHA' not found
```

```r
z<-DHA$V4
```

```
## Error in eval(expr, envir, enclos): object 'DHA' not found
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
-2.721255, -2.399116, -1.886836, 0, 0, 1, 1, 1,
-2.615591, -1.098593, -2.190156, 1, 0, 0, 1, 1,
-2.566783, 2.27658, -1.748368, 1, 0, 0, 1, 1,
-2.433626, -0.1955769, -1.660106, 1, 0, 0, 1, 1,
-2.397476, 0.06792189, -0.9106816, 1, 0, 0, 1, 1,
-2.376606, 0.1185431, -0.6405399, 1, 0, 0, 1, 1,
-2.357847, 0.6849532, -1.08937, 0, 0, 0, 1, 1,
-2.319377, 0.1448585, -0.758598, 0, 0, 0, 1, 1,
-2.26648, 0.6342614, -0.2563938, 0, 0, 0, 1, 1,
-2.252142, 1.734855, 0.05203358, 0, 0, 0, 1, 1,
-2.206672, -0.6779895, -0.2572842, 0, 0, 0, 1, 1,
-2.203722, -0.0389791, -0.1410682, 0, 0, 0, 1, 1,
-2.148518, -1.143702, -1.693084, 0, 0, 0, 1, 1,
-2.126463, -0.8196885, 0.3776723, 1, 1, 1, 1, 1,
-2.12464, -0.1969533, 0.1978271, 1, 1, 1, 1, 1,
-2.122551, 0.7396374, -2.884727, 1, 1, 1, 1, 1,
-2.10591, 0.6861527, -2.136678, 1, 1, 1, 1, 1,
-2.09085, -0.2196203, -1.028179, 1, 1, 1, 1, 1,
-2.089539, 1.329331, -0.9922481, 1, 1, 1, 1, 1,
-2.074416, 0.929831, -3.324898, 1, 1, 1, 1, 1,
-2.052882, 0.9701132, 0.03402835, 1, 1, 1, 1, 1,
-1.999355, 2.07075, -1.538181, 1, 1, 1, 1, 1,
-1.993952, -0.1636401, -3.201487, 1, 1, 1, 1, 1,
-1.993208, 0.2194791, -1.826714, 1, 1, 1, 1, 1,
-1.975124, 0.4477886, -2.89928, 1, 1, 1, 1, 1,
-1.970054, -1.219089, -1.005399, 1, 1, 1, 1, 1,
-1.96751, -0.3499125, -0.679146, 1, 1, 1, 1, 1,
-1.958672, 0.3518848, -1.581421, 1, 1, 1, 1, 1,
-1.957697, -0.3835265, -1.411167, 0, 0, 1, 1, 1,
-1.954461, 1.227811, 1.359011, 1, 0, 0, 1, 1,
-1.953453, -0.9534252, -3.42565, 1, 0, 0, 1, 1,
-1.935505, 2.139908, -0.9643858, 1, 0, 0, 1, 1,
-1.89927, -2.098305, -3.357048, 1, 0, 0, 1, 1,
-1.894747, -0.2801583, -0.8895007, 1, 0, 0, 1, 1,
-1.891341, 1.314627, 0.2003847, 0, 0, 0, 1, 1,
-1.890743, -0.05947502, -1.18577, 0, 0, 0, 1, 1,
-1.86974, -0.7531406, -1.408224, 0, 0, 0, 1, 1,
-1.863584, 0.6873516, -2.438761, 0, 0, 0, 1, 1,
-1.832129, -0.3222517, -1.138215, 0, 0, 0, 1, 1,
-1.831231, 0.3556474, -2.168461, 0, 0, 0, 1, 1,
-1.828967, -0.7181632, -1.328777, 0, 0, 0, 1, 1,
-1.81868, -1.235759, -4.898692, 1, 1, 1, 1, 1,
-1.812705, 1.084785, -0.9134534, 1, 1, 1, 1, 1,
-1.791302, 0.8982741, -1.466435, 1, 1, 1, 1, 1,
-1.765436, -0.1614788, -1.96524, 1, 1, 1, 1, 1,
-1.760131, -0.04498341, -1.09044, 1, 1, 1, 1, 1,
-1.757737, -0.4795389, -0.6624542, 1, 1, 1, 1, 1,
-1.736359, 0.8910108, -1.351102, 1, 1, 1, 1, 1,
-1.736193, 0.07630523, 1.275462, 1, 1, 1, 1, 1,
-1.716969, 1.179569, -2.683067, 1, 1, 1, 1, 1,
-1.707475, -0.2396848, -2.428211, 1, 1, 1, 1, 1,
-1.699216, -0.6194953, -2.803462, 1, 1, 1, 1, 1,
-1.691507, 1.476341, -2.576528, 1, 1, 1, 1, 1,
-1.681559, -0.7903128, -2.586404, 1, 1, 1, 1, 1,
-1.665059, 0.1387639, -1.399209, 1, 1, 1, 1, 1,
-1.663387, -0.1224173, -1.321451, 1, 1, 1, 1, 1,
-1.650096, 0.2546143, -1.24628, 0, 0, 1, 1, 1,
-1.649161, 0.3180182, -0.895911, 1, 0, 0, 1, 1,
-1.640893, -0.9696949, -1.060455, 1, 0, 0, 1, 1,
-1.632617, 0.07068568, 0.4127348, 1, 0, 0, 1, 1,
-1.625059, -1.207255, -0.6838577, 1, 0, 0, 1, 1,
-1.608654, 0.2226098, -1.943991, 1, 0, 0, 1, 1,
-1.598635, -1.880318, -3.336232, 0, 0, 0, 1, 1,
-1.596474, 0.168455, -2.300097, 0, 0, 0, 1, 1,
-1.595232, -0.09651452, -0.9047195, 0, 0, 0, 1, 1,
-1.588598, 0.8706356, -0.6181463, 0, 0, 0, 1, 1,
-1.580457, -0.4679263, -1.862536, 0, 0, 0, 1, 1,
-1.576406, 0.4086865, -2.064111, 0, 0, 0, 1, 1,
-1.560614, -2.017791, -1.967103, 0, 0, 0, 1, 1,
-1.554381, 0.318433, -1.931144, 1, 1, 1, 1, 1,
-1.545382, 1.081545, -0.8182296, 1, 1, 1, 1, 1,
-1.541479, 0.6508132, -0.4500001, 1, 1, 1, 1, 1,
-1.53832, -1.02398, -0.8813565, 1, 1, 1, 1, 1,
-1.520899, -0.2465772, -2.06025, 1, 1, 1, 1, 1,
-1.50921, -0.1178256, -2.062505, 1, 1, 1, 1, 1,
-1.507899, 0.03935634, -2.102855, 1, 1, 1, 1, 1,
-1.504051, -0.2628827, -1.142911, 1, 1, 1, 1, 1,
-1.500405, 1.159004, -1.272713, 1, 1, 1, 1, 1,
-1.496568, 0.4421953, -1.412403, 1, 1, 1, 1, 1,
-1.495989, 0.7030149, -1.561165, 1, 1, 1, 1, 1,
-1.484627, 1.387383, -0.3970818, 1, 1, 1, 1, 1,
-1.46282, 1.735307, -0.381499, 1, 1, 1, 1, 1,
-1.454446, 0.6921039, -2.898093, 1, 1, 1, 1, 1,
-1.435862, 0.7780973, -2.808932, 1, 1, 1, 1, 1,
-1.404842, 1.043596, -0.132958, 0, 0, 1, 1, 1,
-1.391031, -0.4902732, -0.7995026, 1, 0, 0, 1, 1,
-1.38747, -0.2583349, -1.050299, 1, 0, 0, 1, 1,
-1.380849, 0.4265618, -1.388759, 1, 0, 0, 1, 1,
-1.357903, -0.09293857, -2.230819, 1, 0, 0, 1, 1,
-1.357508, 1.536992, 1.136648, 1, 0, 0, 1, 1,
-1.356296, -0.7644602, -3.563555, 0, 0, 0, 1, 1,
-1.35574, 0.6988475, -0.3373679, 0, 0, 0, 1, 1,
-1.355439, -1.425097, -4.371278, 0, 0, 0, 1, 1,
-1.351076, 0.5117907, -1.760608, 0, 0, 0, 1, 1,
-1.346346, -1.341775, -3.398551, 0, 0, 0, 1, 1,
-1.34505, 0.5104442, 0.1672674, 0, 0, 0, 1, 1,
-1.343338, 1.579766, -0.02415224, 0, 0, 0, 1, 1,
-1.342778, 1.147113, -1.199258, 1, 1, 1, 1, 1,
-1.339205, 0.09498262, -3.063025, 1, 1, 1, 1, 1,
-1.333987, 1.736808, 0.3231082, 1, 1, 1, 1, 1,
-1.328233, -0.3704531, -0.6397468, 1, 1, 1, 1, 1,
-1.31449, 0.02519708, -1.668289, 1, 1, 1, 1, 1,
-1.310993, -0.1886689, -1.819905, 1, 1, 1, 1, 1,
-1.308145, 1.849592, -0.5271549, 1, 1, 1, 1, 1,
-1.304375, 1.975085, -0.9236616, 1, 1, 1, 1, 1,
-1.30266, 1.267629, -1.114083, 1, 1, 1, 1, 1,
-1.297546, -0.8426117, -3.023599, 1, 1, 1, 1, 1,
-1.291754, -0.2114054, -4.449253, 1, 1, 1, 1, 1,
-1.291517, -1.086215, -1.824971, 1, 1, 1, 1, 1,
-1.286924, -2.13333, -2.755103, 1, 1, 1, 1, 1,
-1.279465, -1.012424, -2.76874, 1, 1, 1, 1, 1,
-1.27789, -0.5938395, -2.351363, 1, 1, 1, 1, 1,
-1.275461, 0.350623, -1.288255, 0, 0, 1, 1, 1,
-1.27273, -1.178078, -2.120654, 1, 0, 0, 1, 1,
-1.270629, 0.4164969, -3.6334, 1, 0, 0, 1, 1,
-1.266324, -0.731023, -1.303718, 1, 0, 0, 1, 1,
-1.25661, 1.152041, -0.2829592, 1, 0, 0, 1, 1,
-1.25592, -0.09419549, -2.152951, 1, 0, 0, 1, 1,
-1.255575, 0.5601772, -0.6209639, 0, 0, 0, 1, 1,
-1.243545, 0.008508124, 1.354913, 0, 0, 0, 1, 1,
-1.240546, 1.112853, -1.171563, 0, 0, 0, 1, 1,
-1.237581, 1.270376, -1.623634, 0, 0, 0, 1, 1,
-1.22948, -0.7110121, -2.883312, 0, 0, 0, 1, 1,
-1.228371, -0.720371, -3.767265, 0, 0, 0, 1, 1,
-1.227824, 0.1568401, -0.8870019, 0, 0, 0, 1, 1,
-1.216176, 0.04955451, 0.005165142, 1, 1, 1, 1, 1,
-1.215544, 0.8519139, 0.4335073, 1, 1, 1, 1, 1,
-1.215145, 1.507577, -0.6891705, 1, 1, 1, 1, 1,
-1.208741, -0.1565234, -0.3416741, 1, 1, 1, 1, 1,
-1.206977, -0.01728634, -0.9983512, 1, 1, 1, 1, 1,
-1.192899, 0.9279846, -1.204855, 1, 1, 1, 1, 1,
-1.155155, 1.109205, -2.477607, 1, 1, 1, 1, 1,
-1.155007, -0.8256313, -4.096958, 1, 1, 1, 1, 1,
-1.153396, -0.5693121, -1.585423, 1, 1, 1, 1, 1,
-1.151186, -1.366252, -1.417468, 1, 1, 1, 1, 1,
-1.148703, -0.0292003, -1.546407, 1, 1, 1, 1, 1,
-1.148004, -0.5159646, -2.716223, 1, 1, 1, 1, 1,
-1.142927, 0.3091331, -2.225111, 1, 1, 1, 1, 1,
-1.142917, -0.7008359, -1.927901, 1, 1, 1, 1, 1,
-1.137128, 2.734782, -1.169377, 1, 1, 1, 1, 1,
-1.134014, 0.01059884, -2.702134, 0, 0, 1, 1, 1,
-1.132715, -1.842219, -1.58334, 1, 0, 0, 1, 1,
-1.13116, -0.7627261, -1.347911, 1, 0, 0, 1, 1,
-1.131029, 0.3674048, -2.263133, 1, 0, 0, 1, 1,
-1.128383, -1.084356, -3.459858, 1, 0, 0, 1, 1,
-1.12606, 1.325853, -1.153455, 1, 0, 0, 1, 1,
-1.108889, 1.090666, -0.561394, 0, 0, 0, 1, 1,
-1.090066, -0.01071201, 1.10226, 0, 0, 0, 1, 1,
-1.086212, -0.3589601, -1.817353, 0, 0, 0, 1, 1,
-1.05661, 1.652471, 0.7161031, 0, 0, 0, 1, 1,
-1.055053, 0.6624909, -2.506258, 0, 0, 0, 1, 1,
-1.051721, -0.0801667, -1.949889, 0, 0, 0, 1, 1,
-1.049878, -0.2321077, -2.593414, 0, 0, 0, 1, 1,
-1.045908, -0.09065361, 0.4638286, 1, 1, 1, 1, 1,
-1.045723, 0.5070871, -1.912653, 1, 1, 1, 1, 1,
-1.028233, -0.7601, -2.491139, 1, 1, 1, 1, 1,
-1.028185, -0.05323308, -0.8473794, 1, 1, 1, 1, 1,
-1.016444, 1.767881, 0.2182266, 1, 1, 1, 1, 1,
-1.012177, -0.3131846, -1.505273, 1, 1, 1, 1, 1,
-1.001183, 0.5347695, -3.430853, 1, 1, 1, 1, 1,
-0.9911674, -1.202756, -2.173477, 1, 1, 1, 1, 1,
-0.9860736, -0.9680294, -1.456, 1, 1, 1, 1, 1,
-0.9841758, 1.374553, -0.4421954, 1, 1, 1, 1, 1,
-0.9788256, -0.1918446, -1.170857, 1, 1, 1, 1, 1,
-0.9786277, 0.8479724, 0.8139143, 1, 1, 1, 1, 1,
-0.9780577, 0.7061018, -2.023231, 1, 1, 1, 1, 1,
-0.9775372, 2.664224, -0.09256543, 1, 1, 1, 1, 1,
-0.9762309, 0.1274501, -1.585052, 1, 1, 1, 1, 1,
-0.9739734, -1.751926, -3.597802, 0, 0, 1, 1, 1,
-0.9684455, 0.2218812, -1.53779, 1, 0, 0, 1, 1,
-0.9644353, 0.01472917, -3.070935, 1, 0, 0, 1, 1,
-0.9634965, -0.304598, 1.363271, 1, 0, 0, 1, 1,
-0.9630311, -0.2660458, -1.926017, 1, 0, 0, 1, 1,
-0.9560685, 1.990063, 1.08997, 1, 0, 0, 1, 1,
-0.950113, -0.4627242, -2.732675, 0, 0, 0, 1, 1,
-0.9472988, 1.058078, -1.007564, 0, 0, 0, 1, 1,
-0.9423641, -0.7018026, -2.108714, 0, 0, 0, 1, 1,
-0.9416978, 1.084409, -1.865881, 0, 0, 0, 1, 1,
-0.9351599, 2.034521, -0.3101121, 0, 0, 0, 1, 1,
-0.9338163, -1.839722, -1.512323, 0, 0, 0, 1, 1,
-0.9297051, 1.277319, 0.5278388, 0, 0, 0, 1, 1,
-0.9271728, -0.8915566, -1.83283, 1, 1, 1, 1, 1,
-0.919208, -0.8616294, -1.655423, 1, 1, 1, 1, 1,
-0.9153767, 0.3670311, -0.668931, 1, 1, 1, 1, 1,
-0.9109712, -2.222364, -2.213439, 1, 1, 1, 1, 1,
-0.9094667, -0.1625636, -2.114419, 1, 1, 1, 1, 1,
-0.9064186, -0.7460609, -1.337493, 1, 1, 1, 1, 1,
-0.9063593, 0.4741812, -1.763871, 1, 1, 1, 1, 1,
-0.9043926, 1.885595, -0.9177431, 1, 1, 1, 1, 1,
-0.9018478, -1.318304, -2.026015, 1, 1, 1, 1, 1,
-0.8989001, -2.898068, -2.564175, 1, 1, 1, 1, 1,
-0.896804, 1.996192, -0.6404078, 1, 1, 1, 1, 1,
-0.8934198, -0.687082, -2.468459, 1, 1, 1, 1, 1,
-0.8843659, 1.572596, -0.7173423, 1, 1, 1, 1, 1,
-0.8750759, -0.06018306, -2.600716, 1, 1, 1, 1, 1,
-0.8677943, 0.03186431, -0.6891703, 1, 1, 1, 1, 1,
-0.8671293, -2.08445, -5.002012, 0, 0, 1, 1, 1,
-0.8595635, -0.8632409, -3.046885, 1, 0, 0, 1, 1,
-0.8523406, -0.1196361, -0.542766, 1, 0, 0, 1, 1,
-0.8482891, 1.185311, -1.334114, 1, 0, 0, 1, 1,
-0.8480642, 0.4769576, -0.1667247, 1, 0, 0, 1, 1,
-0.84764, 1.607476, 0.5706401, 1, 0, 0, 1, 1,
-0.8459707, -0.1965682, -1.340265, 0, 0, 0, 1, 1,
-0.8436897, 0.8025213, -0.9423811, 0, 0, 0, 1, 1,
-0.8403007, -0.1393232, -1.31909, 0, 0, 0, 1, 1,
-0.8301958, -2.731483, -3.480396, 0, 0, 0, 1, 1,
-0.8242664, -0.0829634, -0.6296674, 0, 0, 0, 1, 1,
-0.8213079, -1.653458, -1.761889, 0, 0, 0, 1, 1,
-0.8100041, -0.3095351, -2.134457, 0, 0, 0, 1, 1,
-0.8073601, -0.5285043, -0.659144, 1, 1, 1, 1, 1,
-0.8063639, 1.366018, -0.9562824, 1, 1, 1, 1, 1,
-0.8058614, 1.339052, -0.3206308, 1, 1, 1, 1, 1,
-0.7975952, 1.029806, 0.9805632, 1, 1, 1, 1, 1,
-0.7924249, -1.758251, -3.194423, 1, 1, 1, 1, 1,
-0.7867635, -0.4757664, -2.380162, 1, 1, 1, 1, 1,
-0.7864988, 0.6367105, -0.7112005, 1, 1, 1, 1, 1,
-0.7859777, -0.3352638, -1.598677, 1, 1, 1, 1, 1,
-0.7845433, 1.556531, -1.093358, 1, 1, 1, 1, 1,
-0.7821869, -1.303828, -2.684638, 1, 1, 1, 1, 1,
-0.7749386, -0.2990823, -2.241108, 1, 1, 1, 1, 1,
-0.769051, 0.0487745, 0.3986709, 1, 1, 1, 1, 1,
-0.7689579, -0.5765654, -3.536742, 1, 1, 1, 1, 1,
-0.7682774, -0.2931371, -1.085038, 1, 1, 1, 1, 1,
-0.7663672, -0.4895152, -0.9567652, 1, 1, 1, 1, 1,
-0.755273, 1.922287, -2.603945, 0, 0, 1, 1, 1,
-0.754591, -0.2711327, -0.9089984, 1, 0, 0, 1, 1,
-0.7471921, -0.009251383, -1.434747, 1, 0, 0, 1, 1,
-0.7420833, 0.7698765, -1.771803, 1, 0, 0, 1, 1,
-0.7412225, -0.4889695, -1.456783, 1, 0, 0, 1, 1,
-0.739921, -0.03367031, -2.404286, 1, 0, 0, 1, 1,
-0.7394766, -1.426627, -2.411527, 0, 0, 0, 1, 1,
-0.7367608, -0.788384, -0.5122814, 0, 0, 0, 1, 1,
-0.7341115, 0.5325316, -0.4016106, 0, 0, 0, 1, 1,
-0.7305661, 0.4228717, -0.7487852, 0, 0, 0, 1, 1,
-0.7276291, -1.655312, -1.669984, 0, 0, 0, 1, 1,
-0.7243285, 0.3639772, -0.4622654, 0, 0, 0, 1, 1,
-0.7218323, 0.9957877, -1.686353, 0, 0, 0, 1, 1,
-0.7204079, -1.063043, -2.46693, 1, 1, 1, 1, 1,
-0.7174793, -0.5364454, -2.076728, 1, 1, 1, 1, 1,
-0.7143362, 0.5331762, -1.050447, 1, 1, 1, 1, 1,
-0.7125182, -0.2695234, -1.742872, 1, 1, 1, 1, 1,
-0.7119235, -2.115699, -0.9712613, 1, 1, 1, 1, 1,
-0.7113298, -1.705147, -3.058164, 1, 1, 1, 1, 1,
-0.7110958, -1.421151, -1.684927, 1, 1, 1, 1, 1,
-0.7108471, -0.4737561, -0.4747361, 1, 1, 1, 1, 1,
-0.7088154, -0.1257781, -1.837517, 1, 1, 1, 1, 1,
-0.7059662, 1.277731, -1.099969, 1, 1, 1, 1, 1,
-0.7005331, -0.3595294, -1.704359, 1, 1, 1, 1, 1,
-0.6820287, -1.865061, -2.908383, 1, 1, 1, 1, 1,
-0.6731121, 0.5861461, -0.6280287, 1, 1, 1, 1, 1,
-0.6717416, -0.4582454, -4.388171, 1, 1, 1, 1, 1,
-0.6697142, 0.2150169, -1.538419, 1, 1, 1, 1, 1,
-0.6670929, -1.070904, -1.990698, 0, 0, 1, 1, 1,
-0.66456, -0.362784, -2.571938, 1, 0, 0, 1, 1,
-0.6635868, 0.5174429, -1.672035, 1, 0, 0, 1, 1,
-0.6587359, 1.008676, 0.4187862, 1, 0, 0, 1, 1,
-0.6560132, -0.1327571, -1.55916, 1, 0, 0, 1, 1,
-0.6513482, -0.3909121, -2.334991, 1, 0, 0, 1, 1,
-0.6506975, 1.112391, -0.2939988, 0, 0, 0, 1, 1,
-0.6497948, -1.08733, -2.472291, 0, 0, 0, 1, 1,
-0.6476243, 0.2243984, -1.892938, 0, 0, 0, 1, 1,
-0.6435629, 0.9795269, -0.469109, 0, 0, 0, 1, 1,
-0.6427627, 0.03941914, -2.963888, 0, 0, 0, 1, 1,
-0.6413372, -0.9997322, -2.092822, 0, 0, 0, 1, 1,
-0.6397528, -0.6169036, -2.506812, 0, 0, 0, 1, 1,
-0.6375957, -0.9530104, -2.746067, 1, 1, 1, 1, 1,
-0.637238, 0.6933377, -1.243706, 1, 1, 1, 1, 1,
-0.6332136, 0.307647, -0.4005817, 1, 1, 1, 1, 1,
-0.6328577, -1.219841, -1.299938, 1, 1, 1, 1, 1,
-0.6275744, 1.097753, -0.02747758, 1, 1, 1, 1, 1,
-0.6245828, 0.2797649, -0.8289667, 1, 1, 1, 1, 1,
-0.6202937, 0.3883265, -1.866452, 1, 1, 1, 1, 1,
-0.6200165, -0.444399, -2.335693, 1, 1, 1, 1, 1,
-0.6113348, -0.9442891, -3.972553, 1, 1, 1, 1, 1,
-0.6102813, 0.4304929, 0.5768939, 1, 1, 1, 1, 1,
-0.6085439, 0.8982876, -0.1299805, 1, 1, 1, 1, 1,
-0.6054285, -0.03213973, -2.070261, 1, 1, 1, 1, 1,
-0.6020526, 0.9163731, -0.3801123, 1, 1, 1, 1, 1,
-0.6003529, -0.3248104, -2.055273, 1, 1, 1, 1, 1,
-0.5999022, -1.380097, -2.201559, 1, 1, 1, 1, 1,
-0.5961465, -0.5781783, -2.553153, 0, 0, 1, 1, 1,
-0.5925783, -0.01958189, 0.1382299, 1, 0, 0, 1, 1,
-0.5889991, -1.043776, -3.944187, 1, 0, 0, 1, 1,
-0.5883984, -0.5655593, -1.608865, 1, 0, 0, 1, 1,
-0.5820883, -1.058094, -1.464529, 1, 0, 0, 1, 1,
-0.5715402, 0.3077054, -1.490438, 1, 0, 0, 1, 1,
-0.5668898, 0.09393342, -0.7498106, 0, 0, 0, 1, 1,
-0.5667767, -1.228356, -3.63668, 0, 0, 0, 1, 1,
-0.564356, 0.3826776, -2.635692, 0, 0, 0, 1, 1,
-0.5587586, -0.6272043, -1.206079, 0, 0, 0, 1, 1,
-0.5568156, -0.5050874, -4.022799, 0, 0, 0, 1, 1,
-0.550903, 1.202584, 2.348571, 0, 0, 0, 1, 1,
-0.5442861, 0.5933129, -1.851345, 0, 0, 0, 1, 1,
-0.543546, 1.36095, -0.7224702, 1, 1, 1, 1, 1,
-0.5415758, 0.2725508, -1.162785, 1, 1, 1, 1, 1,
-0.5409204, -0.1409592, -2.223367, 1, 1, 1, 1, 1,
-0.5390064, -0.2483909, -1.150164, 1, 1, 1, 1, 1,
-0.5377184, -0.7063071, -2.258131, 1, 1, 1, 1, 1,
-0.5334457, -0.7828087, -4.369011, 1, 1, 1, 1, 1,
-0.5305098, 0.367142, 0.6876242, 1, 1, 1, 1, 1,
-0.5229425, 0.52683, -2.252433, 1, 1, 1, 1, 1,
-0.5224618, 0.5658808, -0.1562702, 1, 1, 1, 1, 1,
-0.5198783, 1.243643, -0.9423404, 1, 1, 1, 1, 1,
-0.5118376, 0.2391242, -0.3533545, 1, 1, 1, 1, 1,
-0.508864, 0.4718057, -2.153763, 1, 1, 1, 1, 1,
-0.5071209, 2.039674, -0.6109881, 1, 1, 1, 1, 1,
-0.505513, -0.7152049, -2.848086, 1, 1, 1, 1, 1,
-0.5045716, -0.08518415, -1.884748, 1, 1, 1, 1, 1,
-0.5042731, -1.746402, -3.05479, 0, 0, 1, 1, 1,
-0.4974758, -0.01928092, -1.980741, 1, 0, 0, 1, 1,
-0.4945154, 0.06953622, -1.269875, 1, 0, 0, 1, 1,
-0.4922195, -0.247236, -3.17634, 1, 0, 0, 1, 1,
-0.4872361, 0.356624, -1.229936, 1, 0, 0, 1, 1,
-0.4724528, 0.1631679, -0.875071, 1, 0, 0, 1, 1,
-0.469114, -0.6456851, 0.2233313, 0, 0, 0, 1, 1,
-0.4667244, -0.1671113, -3.780856, 0, 0, 0, 1, 1,
-0.4630623, 1.050795, 0.5292543, 0, 0, 0, 1, 1,
-0.4608738, -0.7857351, -4.200355, 0, 0, 0, 1, 1,
-0.4559928, -0.1127573, -2.975752, 0, 0, 0, 1, 1,
-0.4518717, 1.373133, -0.6612265, 0, 0, 0, 1, 1,
-0.4489599, 1.302554, -1.230582, 0, 0, 0, 1, 1,
-0.4463036, 0.5212486, 0.4647846, 1, 1, 1, 1, 1,
-0.4442562, 0.2631164, -2.06855, 1, 1, 1, 1, 1,
-0.4402196, 0.6935905, -2.410292, 1, 1, 1, 1, 1,
-0.4363903, -0.3849324, -3.38338, 1, 1, 1, 1, 1,
-0.4296021, 0.4150444, -0.7937451, 1, 1, 1, 1, 1,
-0.4270904, -0.8098098, -2.758048, 1, 1, 1, 1, 1,
-0.425252, 0.6885436, -0.4291263, 1, 1, 1, 1, 1,
-0.4247615, 2.069996, 1.999422, 1, 1, 1, 1, 1,
-0.4189709, 0.7977339, -1.499322, 1, 1, 1, 1, 1,
-0.4181387, 2.045083, -0.6689631, 1, 1, 1, 1, 1,
-0.4157098, -1.311804, -2.404546, 1, 1, 1, 1, 1,
-0.415294, 0.9685799, 1.777955, 1, 1, 1, 1, 1,
-0.4135997, -1.024639, -3.134749, 1, 1, 1, 1, 1,
-0.4116054, -1.146197, -2.846645, 1, 1, 1, 1, 1,
-0.4089521, -0.2233848, -1.813134, 1, 1, 1, 1, 1,
-0.4071847, 0.3237452, -2.604654, 0, 0, 1, 1, 1,
-0.4053345, -1.72191, -1.291305, 1, 0, 0, 1, 1,
-0.4020635, -1.540681, -0.7203614, 1, 0, 0, 1, 1,
-0.4015778, -0.2272747, -0.9384956, 1, 0, 0, 1, 1,
-0.3985468, 0.1943975, 0.6748776, 1, 0, 0, 1, 1,
-0.3980828, -0.2157108, -1.772313, 1, 0, 0, 1, 1,
-0.3966354, -0.745322, -1.676961, 0, 0, 0, 1, 1,
-0.3961728, -0.1220594, -1.576471, 0, 0, 0, 1, 1,
-0.3949867, 0.5351113, -1.084963, 0, 0, 0, 1, 1,
-0.393063, -0.1694652, -3.739691, 0, 0, 0, 1, 1,
-0.3866596, 0.2354242, -0.9349476, 0, 0, 0, 1, 1,
-0.3848261, -1.727089, -3.106678, 0, 0, 0, 1, 1,
-0.3823453, -1.535721, -4.517897, 0, 0, 0, 1, 1,
-0.3805024, 0.1183892, -2.214949, 1, 1, 1, 1, 1,
-0.3804928, -0.7892126, 0.1721905, 1, 1, 1, 1, 1,
-0.3780987, -0.6457553, -2.278459, 1, 1, 1, 1, 1,
-0.3779367, -1.527008, -3.771911, 1, 1, 1, 1, 1,
-0.3766177, 0.7554867, -0.3828605, 1, 1, 1, 1, 1,
-0.3738435, 0.378307, -0.7275465, 1, 1, 1, 1, 1,
-0.371267, -1.074299, -2.598889, 1, 1, 1, 1, 1,
-0.3699049, -0.2872389, -3.648193, 1, 1, 1, 1, 1,
-0.3698847, -0.8366805, -1.722145, 1, 1, 1, 1, 1,
-0.3661385, 2.450875, -2.223195, 1, 1, 1, 1, 1,
-0.3643052, 0.1094217, -1.27369, 1, 1, 1, 1, 1,
-0.3616513, 1.343736, -0.8409073, 1, 1, 1, 1, 1,
-0.3600423, -0.6353609, -2.422399, 1, 1, 1, 1, 1,
-0.3578689, 0.6519959, -0.8918516, 1, 1, 1, 1, 1,
-0.3546667, 1.07103, -0.8755163, 1, 1, 1, 1, 1,
-0.3530196, 0.5238646, -0.5966669, 0, 0, 1, 1, 1,
-0.3527364, -1.466336, -2.353105, 1, 0, 0, 1, 1,
-0.3502727, -0.8931249, -2.81805, 1, 0, 0, 1, 1,
-0.3500117, -1.391466, -3.078296, 1, 0, 0, 1, 1,
-0.3496835, -2.390719, -2.301964, 1, 0, 0, 1, 1,
-0.3488862, 0.02152984, -1.113813, 1, 0, 0, 1, 1,
-0.343285, 1.157436, -0.4220352, 0, 0, 0, 1, 1,
-0.3417601, 0.1590483, -1.122033, 0, 0, 0, 1, 1,
-0.3396769, 0.2568916, -0.7242268, 0, 0, 0, 1, 1,
-0.3393338, -1.601265, -2.72466, 0, 0, 0, 1, 1,
-0.3360982, -0.8902866, -2.480539, 0, 0, 0, 1, 1,
-0.3301224, -0.6174437, -2.650639, 0, 0, 0, 1, 1,
-0.32831, 1.673126, -1.450848, 0, 0, 0, 1, 1,
-0.3282914, -2.398057, -4.706678, 1, 1, 1, 1, 1,
-0.328288, 1.00291, 0.2118939, 1, 1, 1, 1, 1,
-0.3259696, -0.4852685, -1.788917, 1, 1, 1, 1, 1,
-0.3251788, -0.2797021, -1.382419, 1, 1, 1, 1, 1,
-0.3225228, 1.65613, -1.969067, 1, 1, 1, 1, 1,
-0.312008, 1.617319, -1.038896, 1, 1, 1, 1, 1,
-0.3087516, 0.7118946, 0.8127064, 1, 1, 1, 1, 1,
-0.3032554, 0.557758, -1.991863, 1, 1, 1, 1, 1,
-0.3027871, -0.8732761, -2.514727, 1, 1, 1, 1, 1,
-0.3020319, -0.4637464, -3.623636, 1, 1, 1, 1, 1,
-0.2981282, 0.5944079, -0.6295882, 1, 1, 1, 1, 1,
-0.2970915, -0.2024234, -2.372192, 1, 1, 1, 1, 1,
-0.2927195, 2.293252, -0.9764665, 1, 1, 1, 1, 1,
-0.2909245, 1.862319, -0.2420882, 1, 1, 1, 1, 1,
-0.288848, 1.239782, -0.6646149, 1, 1, 1, 1, 1,
-0.2875781, 0.03344851, -1.252472, 0, 0, 1, 1, 1,
-0.2822421, -1.295168, -2.456048, 1, 0, 0, 1, 1,
-0.2797125, -0.4555036, -3.113694, 1, 0, 0, 1, 1,
-0.2768779, -0.338811, -3.303355, 1, 0, 0, 1, 1,
-0.2573881, 1.955997, 0.5739814, 1, 0, 0, 1, 1,
-0.256293, 0.4023354, 0.1236674, 1, 0, 0, 1, 1,
-0.2524846, 1.000447, 0.1280109, 0, 0, 0, 1, 1,
-0.2372428, -0.1778086, -2.159483, 0, 0, 0, 1, 1,
-0.2368968, 0.6463724, 0.7999852, 0, 0, 0, 1, 1,
-0.2276699, -0.3425352, -4.627007, 0, 0, 0, 1, 1,
-0.226171, 0.03857665, -2.76882, 0, 0, 0, 1, 1,
-0.2254438, 2.468915, -0.5326775, 0, 0, 0, 1, 1,
-0.2237123, -1.155908, -3.904776, 0, 0, 0, 1, 1,
-0.2212411, -0.7351461, -2.414283, 1, 1, 1, 1, 1,
-0.2191459, -0.1435475, -2.959465, 1, 1, 1, 1, 1,
-0.2138608, 0.5997584, -0.4448769, 1, 1, 1, 1, 1,
-0.2123586, 0.4832036, -0.3148677, 1, 1, 1, 1, 1,
-0.2107332, 0.4339411, 1.26522, 1, 1, 1, 1, 1,
-0.2023603, 0.5101269, 0.2344919, 1, 1, 1, 1, 1,
-0.2021486, 0.7652857, -0.1237961, 1, 1, 1, 1, 1,
-0.1952469, -2.42757, -4.13555, 1, 1, 1, 1, 1,
-0.1945236, 1.869844, -0.8437706, 1, 1, 1, 1, 1,
-0.1902334, -1.390272, -3.091178, 1, 1, 1, 1, 1,
-0.1857505, 0.8306666, -1.395428, 1, 1, 1, 1, 1,
-0.1839563, -2.031536, -1.739733, 1, 1, 1, 1, 1,
-0.18302, -0.7488788, -3.535348, 1, 1, 1, 1, 1,
-0.1790826, 0.0770316, -1.35836, 1, 1, 1, 1, 1,
-0.1784394, -0.1694176, -2.407763, 1, 1, 1, 1, 1,
-0.1778028, 0.6982923, -1.052487, 0, 0, 1, 1, 1,
-0.1767358, -1.178511, -3.768891, 1, 0, 0, 1, 1,
-0.1731623, 1.464807, -0.4402344, 1, 0, 0, 1, 1,
-0.1677394, 1.353439, -0.2890113, 1, 0, 0, 1, 1,
-0.1672354, 0.6485566, 0.8943934, 1, 0, 0, 1, 1,
-0.1590901, 0.4022204, -2.412769, 1, 0, 0, 1, 1,
-0.1543865, -0.5868345, -2.270225, 0, 0, 0, 1, 1,
-0.1529998, -1.253037, -4.129609, 0, 0, 0, 1, 1,
-0.149174, -0.4165186, -3.529878, 0, 0, 0, 1, 1,
-0.1410812, 0.7688599, 0.9786673, 0, 0, 0, 1, 1,
-0.1278649, 2.456526, 0.5379586, 0, 0, 0, 1, 1,
-0.1263124, -0.8818999, -3.551922, 0, 0, 0, 1, 1,
-0.1257638, -0.6046746, -2.194124, 0, 0, 0, 1, 1,
-0.1238129, -0.1558598, -1.802601, 1, 1, 1, 1, 1,
-0.1232773, -0.7355893, -3.442822, 1, 1, 1, 1, 1,
-0.1184483, -1.92882, -2.268154, 1, 1, 1, 1, 1,
-0.1134398, 0.02533093, 0.3209911, 1, 1, 1, 1, 1,
-0.1126485, 1.17102, 2.335076, 1, 1, 1, 1, 1,
-0.1118612, -0.4982596, -2.016822, 1, 1, 1, 1, 1,
-0.1106717, -0.4133597, -5.20535, 1, 1, 1, 1, 1,
-0.1097066, -1.587719, -1.732478, 1, 1, 1, 1, 1,
-0.1094113, 0.3546081, 0.2015858, 1, 1, 1, 1, 1,
-0.1070927, -0.319328, -1.562895, 1, 1, 1, 1, 1,
-0.1054878, -0.8147314, -4.835206, 1, 1, 1, 1, 1,
-0.09986088, 0.6518745, 1.880957, 1, 1, 1, 1, 1,
-0.09976592, -1.116198, -4.071241, 1, 1, 1, 1, 1,
-0.09853385, 3.728095, -0.3523679, 1, 1, 1, 1, 1,
-0.09293944, 1.486249, -1.246838, 1, 1, 1, 1, 1,
-0.09066981, -0.1999725, -3.431453, 0, 0, 1, 1, 1,
-0.082499, 1.197106, 1.437581, 1, 0, 0, 1, 1,
-0.08180644, -0.3893246, -3.422439, 1, 0, 0, 1, 1,
-0.08149566, -1.561956, -2.898765, 1, 0, 0, 1, 1,
-0.07921965, 1.953248, 0.5141738, 1, 0, 0, 1, 1,
-0.070545, 0.02139254, -1.435286, 1, 0, 0, 1, 1,
-0.06996638, 0.204804, -2.129911, 0, 0, 0, 1, 1,
-0.06973438, 0.3722852, 0.4161945, 0, 0, 0, 1, 1,
-0.06891029, -1.70142, -2.731141, 0, 0, 0, 1, 1,
-0.06825571, -1.281772, -2.074658, 0, 0, 0, 1, 1,
-0.06599496, 1.654847, -0.1466425, 0, 0, 0, 1, 1,
-0.06533284, 0.9463959, -0.3700075, 0, 0, 0, 1, 1,
-0.06499263, 0.1345988, 0.1935556, 0, 0, 0, 1, 1,
-0.06290875, -0.4784752, -2.893848, 1, 1, 1, 1, 1,
-0.06061719, -1.653442, -1.691071, 1, 1, 1, 1, 1,
-0.05944888, -0.4583061, -4.28662, 1, 1, 1, 1, 1,
-0.05709664, 0.1906864, 0.5920718, 1, 1, 1, 1, 1,
-0.05642965, 0.1842186, -1.056738, 1, 1, 1, 1, 1,
-0.05638546, 1.831823, 0.614102, 1, 1, 1, 1, 1,
-0.05603452, 0.8871632, 1.151663, 1, 1, 1, 1, 1,
-0.0556442, 0.4724931, 0.7616925, 1, 1, 1, 1, 1,
-0.05563324, 0.4791128, 1.907975, 1, 1, 1, 1, 1,
-0.05300206, 1.247185, 0.4177287, 1, 1, 1, 1, 1,
-0.05033766, 1.597422, -1.330339, 1, 1, 1, 1, 1,
-0.04943088, 0.06007345, 0.1186139, 1, 1, 1, 1, 1,
-0.04609511, 1.471633, 1.399373, 1, 1, 1, 1, 1,
-0.04455334, -1.501916, -2.533144, 1, 1, 1, 1, 1,
-0.03573217, -0.02701013, -2.357116, 1, 1, 1, 1, 1,
-0.02511761, 0.6339861, -0.5526658, 0, 0, 1, 1, 1,
-0.02195473, 0.2735134, 1.266685, 1, 0, 0, 1, 1,
-0.02119518, 0.935309, -0.6037386, 1, 0, 0, 1, 1,
-0.02084521, -1.389393, -3.153384, 1, 0, 0, 1, 1,
-0.02059167, -0.2411807, -3.823384, 1, 0, 0, 1, 1,
-0.02059057, -0.6867823, -2.789108, 1, 0, 0, 1, 1,
-0.01855398, -1.009461, -4.409275, 0, 0, 0, 1, 1,
-0.01107984, -0.629476, -3.365762, 0, 0, 0, 1, 1,
-0.01026715, 2.393058, -1.094799, 0, 0, 0, 1, 1,
-0.009878777, 0.2223266, -2.915225, 0, 0, 0, 1, 1,
-0.008400475, 0.849964, 0.9306718, 0, 0, 0, 1, 1,
-0.00331432, -1.265557, -2.31704, 0, 0, 0, 1, 1,
-0.001030975, -1.214024, -3.591485, 0, 0, 0, 1, 1,
0.004936049, 1.293981, 0.2344668, 1, 1, 1, 1, 1,
0.005365686, 0.5319911, 0.4573141, 1, 1, 1, 1, 1,
0.00540066, 1.388033, 1.627671, 1, 1, 1, 1, 1,
0.01126473, 0.01076985, 0.4794337, 1, 1, 1, 1, 1,
0.01343976, -1.321857, 1.927864, 1, 1, 1, 1, 1,
0.01471436, 0.7735826, 0.06988128, 1, 1, 1, 1, 1,
0.01800022, -0.5822525, 4.56409, 1, 1, 1, 1, 1,
0.01819355, -0.4612044, 2.017741, 1, 1, 1, 1, 1,
0.01923323, 1.533296, 0.5038112, 1, 1, 1, 1, 1,
0.02115185, -0.296577, 4.280752, 1, 1, 1, 1, 1,
0.022891, 0.4924715, 1.00889, 1, 1, 1, 1, 1,
0.02309643, 0.2047293, 0.8728128, 1, 1, 1, 1, 1,
0.02865796, -0.1758827, 3.497038, 1, 1, 1, 1, 1,
0.02963085, -0.9546158, 4.159584, 1, 1, 1, 1, 1,
0.03684308, -0.3978237, 2.531872, 1, 1, 1, 1, 1,
0.03782556, 0.2574522, -1.01137, 0, 0, 1, 1, 1,
0.03935947, -1.539626, 3.636855, 1, 0, 0, 1, 1,
0.04112361, -1.762566, 2.718435, 1, 0, 0, 1, 1,
0.04149818, -0.7697918, 1.781767, 1, 0, 0, 1, 1,
0.04186485, 0.4741784, 1.330321, 1, 0, 0, 1, 1,
0.04689744, -1.006114, 3.062485, 1, 0, 0, 1, 1,
0.0497941, -1.003554, 2.665314, 0, 0, 0, 1, 1,
0.0513573, -0.7866521, 2.519588, 0, 0, 0, 1, 1,
0.05263654, -1.234836, 2.520001, 0, 0, 0, 1, 1,
0.05374176, 0.2582881, 0.2306768, 0, 0, 0, 1, 1,
0.05486496, -1.73192, 2.426836, 0, 0, 0, 1, 1,
0.0558901, -2.150992, 4.213662, 0, 0, 0, 1, 1,
0.05697722, 1.493235, 0.5187081, 0, 0, 0, 1, 1,
0.05966796, -0.952274, 1.481387, 1, 1, 1, 1, 1,
0.06287827, -0.2229355, 4.41383, 1, 1, 1, 1, 1,
0.06314491, -0.8110977, 2.61366, 1, 1, 1, 1, 1,
0.0715597, 0.5343941, -0.4783263, 1, 1, 1, 1, 1,
0.07163616, -0.958276, 3.359302, 1, 1, 1, 1, 1,
0.07572022, -0.1098552, 1.605469, 1, 1, 1, 1, 1,
0.07663321, -0.4475698, 3.457408, 1, 1, 1, 1, 1,
0.08090316, 1.336875, 1.094516, 1, 1, 1, 1, 1,
0.08361338, -2.341149, 1.805468, 1, 1, 1, 1, 1,
0.08718403, -0.1423414, 4.579445, 1, 1, 1, 1, 1,
0.09040272, -1.071922, 3.505802, 1, 1, 1, 1, 1,
0.09584079, 2.098365, 0.1910388, 1, 1, 1, 1, 1,
0.09679818, -0.5250142, 2.729728, 1, 1, 1, 1, 1,
0.09733464, 0.02745826, 1.331995, 1, 1, 1, 1, 1,
0.09877224, 0.09348409, 0.09103458, 1, 1, 1, 1, 1,
0.09989227, -1.664648, 3.194899, 0, 0, 1, 1, 1,
0.1093945, 1.417654, 0.8677337, 1, 0, 0, 1, 1,
0.1137558, -0.5633807, 3.680877, 1, 0, 0, 1, 1,
0.1161119, 0.3484426, -2.020474, 1, 0, 0, 1, 1,
0.1181755, 0.2637607, 0.6972976, 1, 0, 0, 1, 1,
0.1223236, 2.020204, -0.3562199, 1, 0, 0, 1, 1,
0.1257899, -1.726459, 2.126899, 0, 0, 0, 1, 1,
0.1287529, 1.788854, 0.02620945, 0, 0, 0, 1, 1,
0.1294061, 0.9521962, -0.3502794, 0, 0, 0, 1, 1,
0.130437, -0.9677854, 4.040961, 0, 0, 0, 1, 1,
0.1325419, -0.9929447, 0.7845152, 0, 0, 0, 1, 1,
0.1381018, -1.356932, 1.395417, 0, 0, 0, 1, 1,
0.1394188, 0.0706146, 2.264862, 0, 0, 0, 1, 1,
0.1422786, -0.4634741, 1.646015, 1, 1, 1, 1, 1,
0.1441416, 0.2492197, -0.6722473, 1, 1, 1, 1, 1,
0.1462513, -0.3737302, 3.452654, 1, 1, 1, 1, 1,
0.1468497, 0.2496702, -0.7292544, 1, 1, 1, 1, 1,
0.1476244, 0.5961488, 0.03723627, 1, 1, 1, 1, 1,
0.147955, -0.9113265, 1.835723, 1, 1, 1, 1, 1,
0.1501119, 1.118145, -1.138418, 1, 1, 1, 1, 1,
0.1525751, -0.6820179, 2.267817, 1, 1, 1, 1, 1,
0.1533011, -1.203611, 3.644394, 1, 1, 1, 1, 1,
0.1545775, 1.001388, 0.4609079, 1, 1, 1, 1, 1,
0.1580885, -1.159836, 0.5819486, 1, 1, 1, 1, 1,
0.1618518, 0.7481733, -0.1646379, 1, 1, 1, 1, 1,
0.1631473, -0.6408415, 4.183527, 1, 1, 1, 1, 1,
0.1633609, -1.349431, 4.522946, 1, 1, 1, 1, 1,
0.1643768, -0.7840813, 3.26626, 1, 1, 1, 1, 1,
0.1670939, 1.187156, 0.002709077, 0, 0, 1, 1, 1,
0.1672121, 1.36409, 0.2650381, 1, 0, 0, 1, 1,
0.1740115, 1.373009, -0.6800902, 1, 0, 0, 1, 1,
0.1772948, 0.1156548, 0.1083605, 1, 0, 0, 1, 1,
0.1787824, 0.4914435, -0.02959777, 1, 0, 0, 1, 1,
0.1789928, -0.8053996, 3.8766, 1, 0, 0, 1, 1,
0.1818843, 2.056607, -0.9709479, 0, 0, 0, 1, 1,
0.188778, 0.5628732, 0.7438457, 0, 0, 0, 1, 1,
0.1929366, -0.6686397, 3.173537, 0, 0, 0, 1, 1,
0.1946842, 0.599162, -0.0821659, 0, 0, 0, 1, 1,
0.1951009, 1.444226, 0.4177112, 0, 0, 0, 1, 1,
0.1995153, -1.096831, 4.556075, 0, 0, 0, 1, 1,
0.2000341, 0.2639858, 0.03714422, 0, 0, 0, 1, 1,
0.202799, 0.3775847, 0.6870006, 1, 1, 1, 1, 1,
0.2064764, -0.1091813, 0.9215443, 1, 1, 1, 1, 1,
0.211621, 0.7693197, 0.06603332, 1, 1, 1, 1, 1,
0.214087, -0.8828008, 2.843346, 1, 1, 1, 1, 1,
0.2145777, 0.4511422, 0.735211, 1, 1, 1, 1, 1,
0.2172508, 0.2659739, 0.6728208, 1, 1, 1, 1, 1,
0.219453, 0.07254215, 1.484216, 1, 1, 1, 1, 1,
0.2260883, 0.9479499, 1.072769, 1, 1, 1, 1, 1,
0.2275824, -0.2778582, 0.9311089, 1, 1, 1, 1, 1,
0.2313873, 0.6986033, -0.7942973, 1, 1, 1, 1, 1,
0.2376567, -0.5351837, 2.638563, 1, 1, 1, 1, 1,
0.241254, -0.02886715, 1.278031, 1, 1, 1, 1, 1,
0.2425843, -1.568578, 3.66033, 1, 1, 1, 1, 1,
0.2443702, 0.1924569, 1.201617, 1, 1, 1, 1, 1,
0.2469062, -0.1548923, 1.587223, 1, 1, 1, 1, 1,
0.247174, 0.7288306, -1.362629, 0, 0, 1, 1, 1,
0.2495934, 1.233939, -0.5638514, 1, 0, 0, 1, 1,
0.2571051, -0.0003704807, 1.308383, 1, 0, 0, 1, 1,
0.2586812, -1.595379, 4.371642, 1, 0, 0, 1, 1,
0.2596827, 0.005608311, 1.59303, 1, 0, 0, 1, 1,
0.2610973, -0.1761652, 2.565021, 1, 0, 0, 1, 1,
0.2615121, -0.4599793, 3.009184, 0, 0, 0, 1, 1,
0.2656323, -0.04613383, 1.715129, 0, 0, 0, 1, 1,
0.2696545, -0.08035266, 2.607436, 0, 0, 0, 1, 1,
0.2698134, -0.4451939, 2.555982, 0, 0, 0, 1, 1,
0.2761182, 1.118596, -0.3821606, 0, 0, 0, 1, 1,
0.2791373, -0.796848, 2.74384, 0, 0, 0, 1, 1,
0.2831859, 1.252894, -1.84248, 0, 0, 0, 1, 1,
0.2858856, -0.7846708, 2.041865, 1, 1, 1, 1, 1,
0.2872775, 1.493874, -1.381008, 1, 1, 1, 1, 1,
0.287436, 0.1596957, 0.5539823, 1, 1, 1, 1, 1,
0.296438, 0.5294088, -0.8488268, 1, 1, 1, 1, 1,
0.2966734, 0.7127132, -1.383254, 1, 1, 1, 1, 1,
0.2968494, 1.165423, -0.4274192, 1, 1, 1, 1, 1,
0.3000731, -2.278115, 1.072731, 1, 1, 1, 1, 1,
0.3064447, -0.2870544, 2.364019, 1, 1, 1, 1, 1,
0.3079463, 0.1995038, 1.022948, 1, 1, 1, 1, 1,
0.308403, -0.2563482, 1.811315, 1, 1, 1, 1, 1,
0.3165259, 0.6042717, 1.133122, 1, 1, 1, 1, 1,
0.316532, -2.097988, 2.980392, 1, 1, 1, 1, 1,
0.3179197, -0.3944987, 2.111014, 1, 1, 1, 1, 1,
0.3188161, 0.8633672, -0.03355917, 1, 1, 1, 1, 1,
0.3261128, -0.4526359, -0.4354407, 1, 1, 1, 1, 1,
0.330316, 0.558908, 1.182523, 0, 0, 1, 1, 1,
0.3326539, -0.8562421, 1.59314, 1, 0, 0, 1, 1,
0.3399644, -0.6575842, 2.183524, 1, 0, 0, 1, 1,
0.3426334, -0.02300353, 1.107981, 1, 0, 0, 1, 1,
0.3502342, -0.5642717, 1.878623, 1, 0, 0, 1, 1,
0.3522335, -0.3724018, 1.482099, 1, 0, 0, 1, 1,
0.3551154, 0.7766533, 1.508224, 0, 0, 0, 1, 1,
0.3600167, 1.221448, 0.9514646, 0, 0, 0, 1, 1,
0.3711637, -1.103176, 2.703136, 0, 0, 0, 1, 1,
0.3713705, 0.7580478, 1.096297, 0, 0, 0, 1, 1,
0.3767789, 1.607582, -0.2015514, 0, 0, 0, 1, 1,
0.3773088, 0.09281535, -0.5407991, 0, 0, 0, 1, 1,
0.382053, 0.5409785, 0.4789899, 0, 0, 0, 1, 1,
0.3823074, 0.6265467, 1.440196, 1, 1, 1, 1, 1,
0.3826339, -0.201924, 1.560905, 1, 1, 1, 1, 1,
0.3868227, 0.9091094, 0.7869809, 1, 1, 1, 1, 1,
0.388314, -1.756164, 1.602393, 1, 1, 1, 1, 1,
0.3940443, 1.009861, -1.266352, 1, 1, 1, 1, 1,
0.3951972, 1.109921, -0.9373564, 1, 1, 1, 1, 1,
0.3957229, -0.8550639, 2.65808, 1, 1, 1, 1, 1,
0.4071518, -1.149087, 2.707677, 1, 1, 1, 1, 1,
0.410116, -0.645966, 3.456513, 1, 1, 1, 1, 1,
0.4103952, 0.8108793, -0.02602448, 1, 1, 1, 1, 1,
0.4115179, -0.6736983, 2.048134, 1, 1, 1, 1, 1,
0.4159082, 0.2747368, 0.298455, 1, 1, 1, 1, 1,
0.4169179, 1.395185, 0.2642416, 1, 1, 1, 1, 1,
0.4171969, -0.958118, 2.07072, 1, 1, 1, 1, 1,
0.4176228, -3.041678, 3.25223, 1, 1, 1, 1, 1,
0.4178129, -0.5811625, 1.745619, 0, 0, 1, 1, 1,
0.426523, 1.060179, -0.5403057, 1, 0, 0, 1, 1,
0.4300268, 1.367173, 1.962377, 1, 0, 0, 1, 1,
0.4332188, -0.7695551, 3.049639, 1, 0, 0, 1, 1,
0.4353007, 0.163434, 1.151731, 1, 0, 0, 1, 1,
0.4463481, -0.7519498, 3.249696, 1, 0, 0, 1, 1,
0.4473037, -0.1401285, 0.690042, 0, 0, 0, 1, 1,
0.4500463, -0.3892268, 1.733126, 0, 0, 0, 1, 1,
0.4502608, -1.773605, 2.278823, 0, 0, 0, 1, 1,
0.4503811, 0.2083796, 1.230333, 0, 0, 0, 1, 1,
0.4551373, -0.02262788, 1.833937, 0, 0, 0, 1, 1,
0.4554662, -1.362008, 2.54891, 0, 0, 0, 1, 1,
0.4571772, -0.2588048, 1.97964, 0, 0, 0, 1, 1,
0.4595948, 0.1085077, -0.3687997, 1, 1, 1, 1, 1,
0.4639526, 1.117291, -0.4534727, 1, 1, 1, 1, 1,
0.4643675, -1.545431, 2.312241, 1, 1, 1, 1, 1,
0.464397, 1.254483, 2.924755, 1, 1, 1, 1, 1,
0.4648903, 0.6369781, -0.03319745, 1, 1, 1, 1, 1,
0.465165, 0.07190536, 2.801378, 1, 1, 1, 1, 1,
0.4656452, 0.279766, 0.572455, 1, 1, 1, 1, 1,
0.4688243, -1.073266, 1.832832, 1, 1, 1, 1, 1,
0.4710689, -0.6429618, 3.491974, 1, 1, 1, 1, 1,
0.4728517, -0.08509039, 0.06953166, 1, 1, 1, 1, 1,
0.4729647, 0.3030048, 2.190759, 1, 1, 1, 1, 1,
0.4736526, 0.5754406, -0.4288808, 1, 1, 1, 1, 1,
0.4762904, 0.661409, 0.4119996, 1, 1, 1, 1, 1,
0.4792277, 0.9169409, -0.1047186, 1, 1, 1, 1, 1,
0.4939758, 1.988167, 0.4279692, 1, 1, 1, 1, 1,
0.4984801, 0.2759727, 1.130825, 0, 0, 1, 1, 1,
0.5006645, 0.09221675, 1.906844, 1, 0, 0, 1, 1,
0.5050637, -1.3696, 1.986437, 1, 0, 0, 1, 1,
0.5072421, -0.7695723, 2.698514, 1, 0, 0, 1, 1,
0.5083669, -2.426211, 2.648718, 1, 0, 0, 1, 1,
0.5109616, -1.882125, 3.127876, 1, 0, 0, 1, 1,
0.5117776, -0.5592906, 3.740969, 0, 0, 0, 1, 1,
0.5147207, 0.7390495, 1.68733, 0, 0, 0, 1, 1,
0.5170116, -0.8809391, 3.103618, 0, 0, 0, 1, 1,
0.5205283, -1.245132, 2.385923, 0, 0, 0, 1, 1,
0.5243334, 1.356665, 0.5964266, 0, 0, 0, 1, 1,
0.5264439, 0.6764256, -0.9200867, 0, 0, 0, 1, 1,
0.5359527, -0.8337539, 1.999319, 0, 0, 0, 1, 1,
0.5437408, -0.01327915, 1.71021, 1, 1, 1, 1, 1,
0.545562, -0.829565, 2.573769, 1, 1, 1, 1, 1,
0.5472577, 0.03631148, 0.5396553, 1, 1, 1, 1, 1,
0.5486174, 0.5254943, 1.10326, 1, 1, 1, 1, 1,
0.5493189, 2.014558, 0.7091736, 1, 1, 1, 1, 1,
0.5501248, -1.70655, 3.210645, 1, 1, 1, 1, 1,
0.5514476, -0.3219187, 2.257418, 1, 1, 1, 1, 1,
0.5533679, -0.4146808, 2.130519, 1, 1, 1, 1, 1,
0.5541561, -0.420689, 2.489668, 1, 1, 1, 1, 1,
0.5574122, -1.42213, 2.661923, 1, 1, 1, 1, 1,
0.557934, -1.696264, 2.595406, 1, 1, 1, 1, 1,
0.5592127, -0.7039539, 1.272745, 1, 1, 1, 1, 1,
0.563312, -1.390338, 3.241898, 1, 1, 1, 1, 1,
0.5669731, 0.5226644, 1.252232, 1, 1, 1, 1, 1,
0.5709455, -1.802979, 3.013354, 1, 1, 1, 1, 1,
0.5733282, -0.04184, 1.343007, 0, 0, 1, 1, 1,
0.5747968, -1.590508, 4.502674, 1, 0, 0, 1, 1,
0.5753259, -0.3302604, 1.716502, 1, 0, 0, 1, 1,
0.5767386, 2.084534, 0.0715671, 1, 0, 0, 1, 1,
0.5798612, 0.1390371, 0.2234359, 1, 0, 0, 1, 1,
0.5800549, 0.3505511, 1.71365, 1, 0, 0, 1, 1,
0.5812243, 0.1978671, -0.5469893, 0, 0, 0, 1, 1,
0.5863076, 0.255345, -0.7602605, 0, 0, 0, 1, 1,
0.6007257, 0.3810927, 1.079321, 0, 0, 0, 1, 1,
0.6026114, 0.0955629, 0.6832668, 0, 0, 0, 1, 1,
0.6030773, 0.07756921, 1.013844, 0, 0, 0, 1, 1,
0.6122191, -1.660071, 3.276928, 0, 0, 0, 1, 1,
0.6156026, 0.5645784, 2.715956, 0, 0, 0, 1, 1,
0.6163441, 0.7930356, -0.08274029, 1, 1, 1, 1, 1,
0.6191115, -0.3031656, 1.592705, 1, 1, 1, 1, 1,
0.6271341, 0.4401798, -0.1735374, 1, 1, 1, 1, 1,
0.6292035, -0.1171938, 1.261028, 1, 1, 1, 1, 1,
0.6326616, -1.033348, 2.545781, 1, 1, 1, 1, 1,
0.6334099, -0.9954473, 3.189608, 1, 1, 1, 1, 1,
0.6351106, 0.4014748, 2.466442, 1, 1, 1, 1, 1,
0.6380762, -0.4879811, 0.6144331, 1, 1, 1, 1, 1,
0.6459721, 0.9666658, 0.6791006, 1, 1, 1, 1, 1,
0.6493957, 0.3290768, 0.8098647, 1, 1, 1, 1, 1,
0.6497132, -0.9709277, 2.772738, 1, 1, 1, 1, 1,
0.6513743, 1.301035, 0.8617716, 1, 1, 1, 1, 1,
0.6569179, -0.5614016, 2.2838, 1, 1, 1, 1, 1,
0.6573862, -0.9861271, 3.397986, 1, 1, 1, 1, 1,
0.6635148, 0.6798866, -0.3322128, 1, 1, 1, 1, 1,
0.663525, 0.8317748, 0.4234151, 0, 0, 1, 1, 1,
0.6667992, 0.3770486, -0.1428901, 1, 0, 0, 1, 1,
0.6791248, 1.93337, -0.3169763, 1, 0, 0, 1, 1,
0.6831058, 1.256951, -0.3886477, 1, 0, 0, 1, 1,
0.6863788, -0.8597158, 3.335814, 1, 0, 0, 1, 1,
0.6873499, -0.7067193, 4.07791, 1, 0, 0, 1, 1,
0.6881002, -0.3111227, 3.081949, 0, 0, 0, 1, 1,
0.6973656, -0.8850582, 1.699595, 0, 0, 0, 1, 1,
0.7005879, -0.6214723, 1.714034, 0, 0, 0, 1, 1,
0.7081767, 1.70788, -1.137482, 0, 0, 0, 1, 1,
0.7135262, 0.2684835, 0.8265904, 0, 0, 0, 1, 1,
0.7203616, 0.01138904, 2.380206, 0, 0, 0, 1, 1,
0.7206878, 0.4550274, 1.112301, 0, 0, 0, 1, 1,
0.7211329, -0.3642218, 1.433269, 1, 1, 1, 1, 1,
0.7224581, -0.8074192, 2.729797, 1, 1, 1, 1, 1,
0.7299086, -0.3586828, 3.731944, 1, 1, 1, 1, 1,
0.7329679, 1.369039, 1.499347, 1, 1, 1, 1, 1,
0.7351872, 1.017397, 2.581435, 1, 1, 1, 1, 1,
0.7380168, 1.46077, 1.080465, 1, 1, 1, 1, 1,
0.7475985, -0.5488467, 3.553631, 1, 1, 1, 1, 1,
0.7538681, 1.203672, 3.215106, 1, 1, 1, 1, 1,
0.7540852, 0.8184131, 0.760518, 1, 1, 1, 1, 1,
0.7551468, 1.730859, -1.578619, 1, 1, 1, 1, 1,
0.756285, -0.3698743, 1.573449, 1, 1, 1, 1, 1,
0.7571833, 1.074504, 2.432796, 1, 1, 1, 1, 1,
0.7623914, -1.165486, 3.817947, 1, 1, 1, 1, 1,
0.7665884, -1.248142, 4.285224, 1, 1, 1, 1, 1,
0.7679982, 0.2801714, -0.2614059, 1, 1, 1, 1, 1,
0.7712665, 0.7074657, 2.510423, 0, 0, 1, 1, 1,
0.7754921, -0.3013605, -0.5536935, 1, 0, 0, 1, 1,
0.7758193, -1.350489, 2.768628, 1, 0, 0, 1, 1,
0.7826979, -1.127908, 3.468833, 1, 0, 0, 1, 1,
0.7978031, -0.842353, 2.868567, 1, 0, 0, 1, 1,
0.7988759, 0.3545645, 1.216439, 1, 0, 0, 1, 1,
0.8022823, 0.4942262, 0.9064153, 0, 0, 0, 1, 1,
0.802754, -1.929633, 0.3716094, 0, 0, 0, 1, 1,
0.8040307, 1.516927, -0.1610345, 0, 0, 0, 1, 1,
0.8137506, 1.257277, 2.175683, 0, 0, 0, 1, 1,
0.8166158, -0.1103427, 1.487042, 0, 0, 0, 1, 1,
0.8177109, -0.2518987, 2.740912, 0, 0, 0, 1, 1,
0.8187002, -1.307184, 1.919672, 0, 0, 0, 1, 1,
0.8211228, -0.6883389, 3.218297, 1, 1, 1, 1, 1,
0.8259004, -1.278282, 3.550102, 1, 1, 1, 1, 1,
0.8453961, 1.568787, 0.735112, 1, 1, 1, 1, 1,
0.8458509, 0.7429776, 0.2022588, 1, 1, 1, 1, 1,
0.8469766, -0.3160969, 2.296735, 1, 1, 1, 1, 1,
0.8489687, -0.4751959, 1.529399, 1, 1, 1, 1, 1,
0.8520131, 0.3692073, -0.2031902, 1, 1, 1, 1, 1,
0.8582047, -0.5586205, 2.776335, 1, 1, 1, 1, 1,
0.8590921, 1.349221, 0.5803323, 1, 1, 1, 1, 1,
0.8713517, -0.2662205, 1.545622, 1, 1, 1, 1, 1,
0.8723322, -0.0901617, 0.6342111, 1, 1, 1, 1, 1,
0.8748187, -0.3696402, 0.5357814, 1, 1, 1, 1, 1,
0.8752971, -0.143557, 1.02964, 1, 1, 1, 1, 1,
0.8761011, -3.033338, 2.542989, 1, 1, 1, 1, 1,
0.8789792, 0.07832248, 0.3416798, 1, 1, 1, 1, 1,
0.8817428, 0.8124419, -0.265405, 0, 0, 1, 1, 1,
0.882233, 0.4550034, 0.1104836, 1, 0, 0, 1, 1,
0.8829029, 0.6477566, 2.350901, 1, 0, 0, 1, 1,
0.8898369, 0.543761, 0.2389438, 1, 0, 0, 1, 1,
0.8951128, 0.2081476, 0.9094005, 1, 0, 0, 1, 1,
0.8962482, -0.1348951, 0.4164229, 1, 0, 0, 1, 1,
0.9058282, 0.003614531, 1.077826, 0, 0, 0, 1, 1,
0.9111535, 0.6821364, 1.365803, 0, 0, 0, 1, 1,
0.9112864, -0.4170069, 2.636093, 0, 0, 0, 1, 1,
0.9128178, 0.5970698, 2.682652, 0, 0, 0, 1, 1,
0.9167663, 0.416462, 1.879744, 0, 0, 0, 1, 1,
0.9169744, -1.011052, 1.987947, 0, 0, 0, 1, 1,
0.917606, -0.4671985, 2.587059, 0, 0, 0, 1, 1,
0.9183298, 0.6829007, 0.285486, 1, 1, 1, 1, 1,
0.9209856, 1.044811, 1.030176, 1, 1, 1, 1, 1,
0.9225053, 1.355617, 2.26127, 1, 1, 1, 1, 1,
0.9227287, -1.804482, 1.920616, 1, 1, 1, 1, 1,
0.9236821, -0.6906707, 2.202774, 1, 1, 1, 1, 1,
0.9245433, -0.2982046, 2.054811, 1, 1, 1, 1, 1,
0.9276341, 0.5246558, -0.1967954, 1, 1, 1, 1, 1,
0.9314391, 0.1921865, 1.626069, 1, 1, 1, 1, 1,
0.9408023, 0.8141162, -0.7406552, 1, 1, 1, 1, 1,
0.9424211, -0.2757067, 1.716399, 1, 1, 1, 1, 1,
0.9547276, -0.1968224, 1.575956, 1, 1, 1, 1, 1,
0.9557309, -1.533212, 2.535426, 1, 1, 1, 1, 1,
0.956333, 4.348846, 0.6825383, 1, 1, 1, 1, 1,
0.9586174, 0.4040824, 1.800843, 1, 1, 1, 1, 1,
0.9594123, 0.5140486, 2.116036, 1, 1, 1, 1, 1,
0.9600989, -0.1950722, 1.934824, 0, 0, 1, 1, 1,
0.9605433, 0.173671, 2.252171, 1, 0, 0, 1, 1,
0.9612274, 0.2709161, 0.9282369, 1, 0, 0, 1, 1,
0.9621637, 0.2733414, 1.827812, 1, 0, 0, 1, 1,
0.972863, 0.6572853, 0.7961313, 1, 0, 0, 1, 1,
0.9805567, 0.4909636, 1.109189, 1, 0, 0, 1, 1,
0.9815781, 1.047672, 0.1521494, 0, 0, 0, 1, 1,
0.983856, -1.333878, 4.759364, 0, 0, 0, 1, 1,
0.9861199, 0.1819481, 1.662867, 0, 0, 0, 1, 1,
0.9910798, -0.2905869, 0.7882729, 0, 0, 0, 1, 1,
0.9967139, -1.560419, 1.49368, 0, 0, 0, 1, 1,
1.000615, -0.3582662, 2.771332, 0, 0, 0, 1, 1,
1.013459, 0.3983742, 1.1519, 0, 0, 0, 1, 1,
1.01414, 0.15312, 0.7778291, 1, 1, 1, 1, 1,
1.017059, 1.660906, -1.511257, 1, 1, 1, 1, 1,
1.018976, 1.192672, 2.262572, 1, 1, 1, 1, 1,
1.024734, 1.241343, 1.828625, 1, 1, 1, 1, 1,
1.024939, -1.767146, 3.154262, 1, 1, 1, 1, 1,
1.032659, -0.6563468, 2.107029, 1, 1, 1, 1, 1,
1.03484, -0.1241799, -0.2915048, 1, 1, 1, 1, 1,
1.036201, -0.4160832, 1.475042, 1, 1, 1, 1, 1,
1.056089, -0.06566295, 2.405686, 1, 1, 1, 1, 1,
1.057621, -0.5472831, 1.649085, 1, 1, 1, 1, 1,
1.057884, 0.7080238, 0.8700898, 1, 1, 1, 1, 1,
1.062753, 0.06063851, 1.249099, 1, 1, 1, 1, 1,
1.064175, -1.139056, 0.7680665, 1, 1, 1, 1, 1,
1.064998, 2.438849, -0.4264481, 1, 1, 1, 1, 1,
1.066288, -0.1778304, 0.9067828, 1, 1, 1, 1, 1,
1.073686, -2.272362, 2.794987, 0, 0, 1, 1, 1,
1.094041, -1.661962, 1.794502, 1, 0, 0, 1, 1,
1.101489, 0.3951367, 2.393108, 1, 0, 0, 1, 1,
1.107609, -1.039308, 2.678019, 1, 0, 0, 1, 1,
1.107992, 0.4963011, 2.125692, 1, 0, 0, 1, 1,
1.110895, -0.4561885, 1.064364, 1, 0, 0, 1, 1,
1.112178, 0.812028, 0.3946034, 0, 0, 0, 1, 1,
1.117788, -0.0295868, 2.55816, 0, 0, 0, 1, 1,
1.120173, -1.146658, 2.378913, 0, 0, 0, 1, 1,
1.122292, -1.588578, 1.994121, 0, 0, 0, 1, 1,
1.123054, 1.221406, -1.637185, 0, 0, 0, 1, 1,
1.124285, 0.902654, -0.1018059, 0, 0, 0, 1, 1,
1.125619, 1.637714, 0.003603641, 0, 0, 0, 1, 1,
1.13848, -0.1098585, 0.73548, 1, 1, 1, 1, 1,
1.146068, 0.1091857, 1.517929, 1, 1, 1, 1, 1,
1.147476, 0.002365249, 3.523777, 1, 1, 1, 1, 1,
1.148714, 1.116757, 0.6402805, 1, 1, 1, 1, 1,
1.149148, 0.2307667, 1.084333, 1, 1, 1, 1, 1,
1.152574, -1.383823, 1.587293, 1, 1, 1, 1, 1,
1.154245, 0.7267712, 1.637524, 1, 1, 1, 1, 1,
1.162673, -3.204464, 2.06413, 1, 1, 1, 1, 1,
1.16283, -1.719122, 1.378783, 1, 1, 1, 1, 1,
1.169868, 0.8618, 0.6471486, 1, 1, 1, 1, 1,
1.171913, 0.9760181, 0.5114397, 1, 1, 1, 1, 1,
1.175979, 0.62234, 0.6012967, 1, 1, 1, 1, 1,
1.176251, -1.34437, 3.339157, 1, 1, 1, 1, 1,
1.19056, -1.028874, 2.42421, 1, 1, 1, 1, 1,
1.199962, 1.525837, -0.5598902, 1, 1, 1, 1, 1,
1.200677, 0.02571038, 3.308555, 0, 0, 1, 1, 1,
1.201385, -1.499269, 2.942192, 1, 0, 0, 1, 1,
1.202053, -1.034648, 1.205732, 1, 0, 0, 1, 1,
1.208073, -1.957351, 2.492075, 1, 0, 0, 1, 1,
1.216387, 0.3259139, 0.0843389, 1, 0, 0, 1, 1,
1.223624, -0.977791, 2.111445, 1, 0, 0, 1, 1,
1.228811, 0.05966975, 0.6423603, 0, 0, 0, 1, 1,
1.251643, 1.836451, 1.242207, 0, 0, 0, 1, 1,
1.25481, 0.413631, 0.4900777, 0, 0, 0, 1, 1,
1.263638, 0.4624231, 0.9650536, 0, 0, 0, 1, 1,
1.265004, 1.023828, 2.816873, 0, 0, 0, 1, 1,
1.265909, 0.06347656, 2.5743, 0, 0, 0, 1, 1,
1.274458, -0.9468389, 3.462254, 0, 0, 0, 1, 1,
1.277793, -0.1481269, 0.1054687, 1, 1, 1, 1, 1,
1.280132, 0.1536386, 2.624242, 1, 1, 1, 1, 1,
1.286393, -0.1316139, 3.651141, 1, 1, 1, 1, 1,
1.286722, -1.095385, 2.868013, 1, 1, 1, 1, 1,
1.286828, -1.365649, 0.5270426, 1, 1, 1, 1, 1,
1.287894, -0.9900827, 1.552369, 1, 1, 1, 1, 1,
1.292109, -1.378015, 1.95752, 1, 1, 1, 1, 1,
1.293392, -0.2364388, 1.329182, 1, 1, 1, 1, 1,
1.306858, -1.314019, 0.6821447, 1, 1, 1, 1, 1,
1.312436, 0.1847498, 0.9228294, 1, 1, 1, 1, 1,
1.316695, 0.07456694, 1.057895, 1, 1, 1, 1, 1,
1.319982, 0.1566667, 2.042494, 1, 1, 1, 1, 1,
1.322302, -0.2997752, 1.258248, 1, 1, 1, 1, 1,
1.322496, -0.7052192, 2.092351, 1, 1, 1, 1, 1,
1.326957, -0.9592139, 2.567972, 1, 1, 1, 1, 1,
1.331777, -0.1209977, 1.158168, 0, 0, 1, 1, 1,
1.333211, -0.791989, 3.308243, 1, 0, 0, 1, 1,
1.334356, -1.324168, 1.453812, 1, 0, 0, 1, 1,
1.334371, -1.930251, 3.732676, 1, 0, 0, 1, 1,
1.337221, 0.8452563, 2.135866, 1, 0, 0, 1, 1,
1.339897, 0.8514696, 0.367498, 1, 0, 0, 1, 1,
1.343929, -0.8462855, 2.701232, 0, 0, 0, 1, 1,
1.355433, -1.679146, 2.754375, 0, 0, 0, 1, 1,
1.357455, -0.3323918, 1.316001, 0, 0, 0, 1, 1,
1.358192, 0.5823311, 1.165628, 0, 0, 0, 1, 1,
1.360094, 1.458162, 1.277545, 0, 0, 0, 1, 1,
1.362288, -0.5714445, 2.529884, 0, 0, 0, 1, 1,
1.365582, -0.8090618, 1.328626, 0, 0, 0, 1, 1,
1.374598, -0.7636926, 1.667422, 1, 1, 1, 1, 1,
1.378041, 1.14762, 1.108528, 1, 1, 1, 1, 1,
1.391612, 0.8781256, 1.853421, 1, 1, 1, 1, 1,
1.39995, -0.4307724, 3.242889, 1, 1, 1, 1, 1,
1.401582, -1.612933, 0.8509151, 1, 1, 1, 1, 1,
1.405279, -0.6451676, 0.7977601, 1, 1, 1, 1, 1,
1.409539, -1.263731, 2.847758, 1, 1, 1, 1, 1,
1.410712, -0.1166594, 2.074479, 1, 1, 1, 1, 1,
1.412688, 0.1035376, 1.148646, 1, 1, 1, 1, 1,
1.413058, 0.4594609, 3.450752, 1, 1, 1, 1, 1,
1.413175, -0.2887114, 1.727115, 1, 1, 1, 1, 1,
1.420179, 0.9254468, 2.364194, 1, 1, 1, 1, 1,
1.420325, 1.092536, 0.9025654, 1, 1, 1, 1, 1,
1.421706, -0.4798294, 3.805961, 1, 1, 1, 1, 1,
1.424044, 1.230593, -0.5756918, 1, 1, 1, 1, 1,
1.427261, 0.08947471, 0.6374679, 0, 0, 1, 1, 1,
1.42846, 0.3353116, 1.952415, 1, 0, 0, 1, 1,
1.446486, -0.1820971, 2.686747, 1, 0, 0, 1, 1,
1.459959, 0.2142746, 1.136205, 1, 0, 0, 1, 1,
1.462213, 0.3433966, 3.30775, 1, 0, 0, 1, 1,
1.465557, -0.9350947, 1.701381, 1, 0, 0, 1, 1,
1.468169, 0.9269748, 2.471855, 0, 0, 0, 1, 1,
1.471479, 0.5970401, 1.673573, 0, 0, 0, 1, 1,
1.477755, -0.1983481, 1.501451, 0, 0, 0, 1, 1,
1.47913, -1.670254, 3.132705, 0, 0, 0, 1, 1,
1.488378, 0.18122, 0.9962974, 0, 0, 0, 1, 1,
1.494573, 0.1507173, 1.29324, 0, 0, 0, 1, 1,
1.495206, -1.509435, 2.444014, 0, 0, 0, 1, 1,
1.507327, 0.4990343, 0.7883837, 1, 1, 1, 1, 1,
1.510353, 0.6997754, -0.2215875, 1, 1, 1, 1, 1,
1.523121, -0.06569761, -1.009555, 1, 1, 1, 1, 1,
1.532145, 0.8484856, 2.982086, 1, 1, 1, 1, 1,
1.53961, -2.045093, 4.083266, 1, 1, 1, 1, 1,
1.562864, 1.155896, 0.3063687, 1, 1, 1, 1, 1,
1.581605, -0.5291666, 1.950002, 1, 1, 1, 1, 1,
1.589417, -1.3094, 2.115354, 1, 1, 1, 1, 1,
1.607649, 0.7383782, 0.5584202, 1, 1, 1, 1, 1,
1.612164, -1.307131, 1.809104, 1, 1, 1, 1, 1,
1.6211, -0.2818409, 1.033793, 1, 1, 1, 1, 1,
1.635799, 0.8068485, 0.8395395, 1, 1, 1, 1, 1,
1.648136, 1.853703, -0.5383358, 1, 1, 1, 1, 1,
1.648407, -1.066539, 3.011677, 1, 1, 1, 1, 1,
1.653928, 0.5161176, 1.820125, 1, 1, 1, 1, 1,
1.655882, -2.286581, 3.677438, 0, 0, 1, 1, 1,
1.677861, 0.7133182, 1.328918, 1, 0, 0, 1, 1,
1.677936, 0.2846694, 1.956746, 1, 0, 0, 1, 1,
1.679571, -0.04789129, 0.4984714, 1, 0, 0, 1, 1,
1.68005, 0.5691035, 1.491658, 1, 0, 0, 1, 1,
1.698249, -1.467548, 3.720942, 1, 0, 0, 1, 1,
1.699856, 1.231803, 0.0801121, 0, 0, 0, 1, 1,
1.749099, -0.7696905, 1.247154, 0, 0, 0, 1, 1,
1.750439, 0.4603868, 1.095456, 0, 0, 0, 1, 1,
1.782783, -0.4078521, 2.831906, 0, 0, 0, 1, 1,
1.792556, 0.7146218, 2.333402, 0, 0, 0, 1, 1,
1.794997, -1.224789, 3.259868, 0, 0, 0, 1, 1,
1.795423, -1.321979, 2.401303, 0, 0, 0, 1, 1,
1.801666, 1.296585, 1.700605, 1, 1, 1, 1, 1,
1.826057, 1.732334, -0.1605581, 1, 1, 1, 1, 1,
1.831607, -1.181792, 2.296562, 1, 1, 1, 1, 1,
1.846456, 0.1451595, 1.979083, 1, 1, 1, 1, 1,
1.848774, -0.2467213, 0.9786322, 1, 1, 1, 1, 1,
1.850301, 1.40838, 1.965051, 1, 1, 1, 1, 1,
1.866205, -0.3864719, 0.7562315, 1, 1, 1, 1, 1,
1.869242, 0.1186658, 2.772584, 1, 1, 1, 1, 1,
1.872905, 1.261782, 0.4103481, 1, 1, 1, 1, 1,
1.920291, -0.3233605, 1.925927, 1, 1, 1, 1, 1,
1.923681, -1.095634, 1.209577, 1, 1, 1, 1, 1,
1.954133, 0.1362271, 1.566447, 1, 1, 1, 1, 1,
1.97742, -0.5084943, 2.129714, 1, 1, 1, 1, 1,
1.988089, 0.3011035, 0.9152424, 1, 1, 1, 1, 1,
2.023567, -0.4078989, 0.975265, 1, 1, 1, 1, 1,
2.051503, 0.1708555, 1.019207, 0, 0, 1, 1, 1,
2.060809, -0.2518232, 0.9340476, 1, 0, 0, 1, 1,
2.068932, -0.1897209, 1.480472, 1, 0, 0, 1, 1,
2.094311, 1.003569, 2.067208, 1, 0, 0, 1, 1,
2.120934, 0.5979399, -0.09915131, 1, 0, 0, 1, 1,
2.158911, -0.05342632, 2.490107, 1, 0, 0, 1, 1,
2.198215, 1.467963, 1.841916, 0, 0, 0, 1, 1,
2.201105, -0.8641937, 0.6033493, 0, 0, 0, 1, 1,
2.207936, 0.6717911, -1.183134, 0, 0, 0, 1, 1,
2.224906, 0.4047067, 1.853739, 0, 0, 0, 1, 1,
2.272167, 0.4795337, -0.3307111, 0, 0, 0, 1, 1,
2.296694, 0.02210169, 4.016346, 0, 0, 0, 1, 1,
2.367374, -0.9515179, 2.868814, 0, 0, 0, 1, 1,
2.374183, -0.01075923, 1.72489, 1, 1, 1, 1, 1,
2.433184, 1.284071, 1.163944, 1, 1, 1, 1, 1,
2.46088, 0.2696076, 0.1286083, 1, 1, 1, 1, 1,
2.516855, -0.6321533, 1.477922, 1, 1, 1, 1, 1,
2.67511, -1.020334, 1.115444, 1, 1, 1, 1, 1,
2.960788, 0.9911637, 0.5986882, 1, 1, 1, 1, 1,
3.209383, 0.6574193, 0.9341245, 1, 1, 1, 1, 1
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
var radius = 9.483556;
var distance = 33.31059;
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
mvMatrix.translate( -0.2440639, -0.572191, 0.2229934 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31059);
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
