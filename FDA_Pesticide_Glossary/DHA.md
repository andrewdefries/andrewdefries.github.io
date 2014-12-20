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
-3.30411, -0.1003791, -1.860614, 1, 0, 0, 1,
-3.138113, -1.619387, -0.8858114, 1, 0.007843138, 0, 1,
-3.062667, 0.527886, -2.206613, 1, 0.01176471, 0, 1,
-2.961215, 1.537104, -0.6026905, 1, 0.01960784, 0, 1,
-2.952439, -1.193894, -2.716792, 1, 0.02352941, 0, 1,
-2.836808, 0.4488494, -2.203128, 1, 0.03137255, 0, 1,
-2.394702, -0.2834012, -1.19139, 1, 0.03529412, 0, 1,
-2.36752, -0.1910892, -3.177504, 1, 0.04313726, 0, 1,
-2.334376, 0.8838853, 0.5540947, 1, 0.04705882, 0, 1,
-2.320508, -1.113074, -2.310328, 1, 0.05490196, 0, 1,
-2.305404, -0.5434346, -2.439195, 1, 0.05882353, 0, 1,
-2.214393, 0.2204542, -2.564674, 1, 0.06666667, 0, 1,
-2.180437, 0.9569559, 0.1847864, 1, 0.07058824, 0, 1,
-2.170617, 2.099946, -0.7527152, 1, 0.07843138, 0, 1,
-2.053117, -0.5103527, -1.875016, 1, 0.08235294, 0, 1,
-2.043295, 0.7606337, -2.615926, 1, 0.09019608, 0, 1,
-2.023644, 0.4565535, -1.693812, 1, 0.09411765, 0, 1,
-1.999972, 0.9119568, -2.736765, 1, 0.1019608, 0, 1,
-1.995798, 0.5559043, -2.628301, 1, 0.1098039, 0, 1,
-1.959388, -0.3048955, -2.688459, 1, 0.1137255, 0, 1,
-1.940448, -0.593204, -2.815321, 1, 0.1215686, 0, 1,
-1.929671, -0.3694708, -3.26791, 1, 0.1254902, 0, 1,
-1.927013, -0.08357089, -2.556234, 1, 0.1333333, 0, 1,
-1.917109, -0.6818545, -2.005849, 1, 0.1372549, 0, 1,
-1.916063, 0.2671524, -2.273354, 1, 0.145098, 0, 1,
-1.910393, 0.3892775, -1.115064, 1, 0.1490196, 0, 1,
-1.904495, -0.5214436, -1.578788, 1, 0.1568628, 0, 1,
-1.89394, -0.7217806, -3.72483, 1, 0.1607843, 0, 1,
-1.88045, -0.7777598, -1.082342, 1, 0.1686275, 0, 1,
-1.877251, -0.121097, -3.416237, 1, 0.172549, 0, 1,
-1.862971, 0.6322056, -1.922332, 1, 0.1803922, 0, 1,
-1.841197, 1.805987, -1.716056, 1, 0.1843137, 0, 1,
-1.835548, -0.01741854, -2.559505, 1, 0.1921569, 0, 1,
-1.815472, -1.456793, -3.389502, 1, 0.1960784, 0, 1,
-1.771318, 0.1679213, -0.639029, 1, 0.2039216, 0, 1,
-1.76717, 0.6021013, -2.484396, 1, 0.2117647, 0, 1,
-1.728616, 0.2039123, -2.264917, 1, 0.2156863, 0, 1,
-1.717071, -0.5295639, -2.486063, 1, 0.2235294, 0, 1,
-1.716149, -0.2824785, -1.501721, 1, 0.227451, 0, 1,
-1.712463, -0.471662, -2.158581, 1, 0.2352941, 0, 1,
-1.706366, 0.05354284, -2.574664, 1, 0.2392157, 0, 1,
-1.664463, -0.424109, -0.5978586, 1, 0.2470588, 0, 1,
-1.64617, -0.4984013, -2.033152, 1, 0.2509804, 0, 1,
-1.643923, -0.3231623, -2.611273, 1, 0.2588235, 0, 1,
-1.630119, 0.2569509, -0.9382774, 1, 0.2627451, 0, 1,
-1.601715, 0.922444, -3.047985, 1, 0.2705882, 0, 1,
-1.600728, -1.354896, -3.251759, 1, 0.2745098, 0, 1,
-1.582038, -0.1567658, -1.21466, 1, 0.282353, 0, 1,
-1.574186, 0.3921669, -2.687377, 1, 0.2862745, 0, 1,
-1.573212, -0.5336663, -3.277834, 1, 0.2941177, 0, 1,
-1.569509, 0.5516133, -2.30835, 1, 0.3019608, 0, 1,
-1.566527, -1.375406, -0.8403013, 1, 0.3058824, 0, 1,
-1.560521, 0.3552971, -2.52807, 1, 0.3137255, 0, 1,
-1.546344, -0.7658315, -1.763228, 1, 0.3176471, 0, 1,
-1.543398, -0.8186499, -3.72589, 1, 0.3254902, 0, 1,
-1.542281, -1.035678, -0.6466336, 1, 0.3294118, 0, 1,
-1.535406, -0.3502776, -2.441348, 1, 0.3372549, 0, 1,
-1.513048, 0.4830092, -1.823236, 1, 0.3411765, 0, 1,
-1.511558, 0.1432763, -1.461347, 1, 0.3490196, 0, 1,
-1.50199, -0.162815, -3.179302, 1, 0.3529412, 0, 1,
-1.501547, 0.169304, -3.015949, 1, 0.3607843, 0, 1,
-1.496095, -1.053625, -0.1514226, 1, 0.3647059, 0, 1,
-1.476147, -1.670416, -1.913197, 1, 0.372549, 0, 1,
-1.451635, 2.043983, 0.6331667, 1, 0.3764706, 0, 1,
-1.442048, 0.8560754, -0.9067459, 1, 0.3843137, 0, 1,
-1.436431, 0.4614887, -0.8456719, 1, 0.3882353, 0, 1,
-1.429278, 0.1256612, -0.4252577, 1, 0.3960784, 0, 1,
-1.42902, -0.5123549, -1.473526, 1, 0.4039216, 0, 1,
-1.423585, 0.6714262, -2.149538, 1, 0.4078431, 0, 1,
-1.419318, -1.107414, -4.014361, 1, 0.4156863, 0, 1,
-1.414476, 0.03616087, -2.632081, 1, 0.4196078, 0, 1,
-1.402762, -0.5820967, -3.951687, 1, 0.427451, 0, 1,
-1.396425, -0.06866241, -1.698427, 1, 0.4313726, 0, 1,
-1.395193, 0.9698569, -0.3074889, 1, 0.4392157, 0, 1,
-1.392912, 0.9805291, -1.421448, 1, 0.4431373, 0, 1,
-1.384528, -0.5143387, -2.814576, 1, 0.4509804, 0, 1,
-1.382426, -0.4960168, -1.035355, 1, 0.454902, 0, 1,
-1.377726, 1.088459, -0.3838786, 1, 0.4627451, 0, 1,
-1.373684, -0.9050678, -1.181604, 1, 0.4666667, 0, 1,
-1.372568, -1.132275, -4.000213, 1, 0.4745098, 0, 1,
-1.372227, 0.6764185, -1.139285, 1, 0.4784314, 0, 1,
-1.365789, 0.6770355, 1.304804, 1, 0.4862745, 0, 1,
-1.361705, 0.3867106, 0.8525087, 1, 0.4901961, 0, 1,
-1.361659, 0.6660657, -0.3894884, 1, 0.4980392, 0, 1,
-1.360895, 0.9079841, -0.2191539, 1, 0.5058824, 0, 1,
-1.359212, 0.1477368, -1.667705, 1, 0.509804, 0, 1,
-1.35473, -0.4769855, -1.780915, 1, 0.5176471, 0, 1,
-1.350694, -3.544054, -1.58417, 1, 0.5215687, 0, 1,
-1.343673, -1.184344, -1.26696, 1, 0.5294118, 0, 1,
-1.342633, 0.8785908, -0.9365482, 1, 0.5333334, 0, 1,
-1.333357, -0.9431618, -3.204498, 1, 0.5411765, 0, 1,
-1.328913, 0.3236949, -0.1332838, 1, 0.5450981, 0, 1,
-1.314957, 0.5026318, -0.3991944, 1, 0.5529412, 0, 1,
-1.310585, 1.844913, 1.611179, 1, 0.5568628, 0, 1,
-1.309661, -1.120577, -2.793754, 1, 0.5647059, 0, 1,
-1.300293, -1.57871, -2.143377, 1, 0.5686275, 0, 1,
-1.292048, 1.292143, -0.3558509, 1, 0.5764706, 0, 1,
-1.290762, 0.4545227, -0.9257923, 1, 0.5803922, 0, 1,
-1.285493, 2.776024, 0.3074434, 1, 0.5882353, 0, 1,
-1.279163, 1.472262, -0.9002914, 1, 0.5921569, 0, 1,
-1.275103, -0.1429878, -2.735604, 1, 0.6, 0, 1,
-1.270933, -0.03891767, -2.402777, 1, 0.6078432, 0, 1,
-1.262156, -0.3323021, -0.399386, 1, 0.6117647, 0, 1,
-1.25547, 0.5092334, -2.274826, 1, 0.6196079, 0, 1,
-1.25098, -0.862859, -3.191798, 1, 0.6235294, 0, 1,
-1.249356, 0.1468234, -2.848452, 1, 0.6313726, 0, 1,
-1.247008, -0.01947249, -3.127096, 1, 0.6352941, 0, 1,
-1.241646, 0.3703345, -1.702539, 1, 0.6431373, 0, 1,
-1.241599, -0.3065995, -1.863417, 1, 0.6470588, 0, 1,
-1.238758, 1.079776, -1.571908, 1, 0.654902, 0, 1,
-1.235781, -0.2965878, -3.159861, 1, 0.6588235, 0, 1,
-1.234661, -0.3475253, -1.610705, 1, 0.6666667, 0, 1,
-1.226141, -0.9194292, -1.973655, 1, 0.6705883, 0, 1,
-1.224772, -0.6057753, -0.6490173, 1, 0.6784314, 0, 1,
-1.212105, 0.6761209, 0.2882632, 1, 0.682353, 0, 1,
-1.208691, -1.723676, -1.39405, 1, 0.6901961, 0, 1,
-1.207751, 1.759772, 0.9972578, 1, 0.6941177, 0, 1,
-1.206582, 0.3735485, -1.426415, 1, 0.7019608, 0, 1,
-1.180856, 1.577655, 0.256128, 1, 0.7098039, 0, 1,
-1.168932, 2.622602, 2.117804, 1, 0.7137255, 0, 1,
-1.165639, -0.3663135, -1.821861, 1, 0.7215686, 0, 1,
-1.162286, 0.3489818, -1.486184, 1, 0.7254902, 0, 1,
-1.157218, 1.276486, -2.254206, 1, 0.7333333, 0, 1,
-1.156726, -1.195718, -3.673288, 1, 0.7372549, 0, 1,
-1.155746, -1.812673, -3.198893, 1, 0.7450981, 0, 1,
-1.149887, 0.1353942, -3.580442, 1, 0.7490196, 0, 1,
-1.14498, -2.360405, -5.056472, 1, 0.7568628, 0, 1,
-1.139009, 0.4986241, -0.9431185, 1, 0.7607843, 0, 1,
-1.130166, -0.04335168, -0.7905703, 1, 0.7686275, 0, 1,
-1.129049, -0.9471762, -1.609438, 1, 0.772549, 0, 1,
-1.12873, -0.04881902, -2.203336, 1, 0.7803922, 0, 1,
-1.125008, -0.202477, -1.489497, 1, 0.7843137, 0, 1,
-1.121708, -0.693473, -2.177425, 1, 0.7921569, 0, 1,
-1.119338, 2.351852, -0.5517699, 1, 0.7960784, 0, 1,
-1.115099, 1.471686, -0.02569822, 1, 0.8039216, 0, 1,
-1.113531, 0.003573583, -2.353079, 1, 0.8117647, 0, 1,
-1.112972, -1.0545, -5.243707, 1, 0.8156863, 0, 1,
-1.112785, 2.537383, 0.227106, 1, 0.8235294, 0, 1,
-1.109441, -1.240079, -1.115602, 1, 0.827451, 0, 1,
-1.105633, -0.4995625, -1.620894, 1, 0.8352941, 0, 1,
-1.104282, 0.4744315, 1.611975, 1, 0.8392157, 0, 1,
-1.092359, -1.098413, -3.28971, 1, 0.8470588, 0, 1,
-1.091836, -1.552024, -2.337896, 1, 0.8509804, 0, 1,
-1.076178, 0.6433491, -0.5564106, 1, 0.8588235, 0, 1,
-1.073253, -1.579233, -3.387806, 1, 0.8627451, 0, 1,
-1.064994, -0.3495837, -0.9297248, 1, 0.8705882, 0, 1,
-1.059805, 0.257421, -0.9032192, 1, 0.8745098, 0, 1,
-1.054091, 1.01049, -1.270161, 1, 0.8823529, 0, 1,
-1.050461, 0.3939937, -2.163434, 1, 0.8862745, 0, 1,
-1.049726, 0.026949, -3.355681, 1, 0.8941177, 0, 1,
-1.046875, 0.5959392, 1.211776, 1, 0.8980392, 0, 1,
-1.038062, -0.1728304, -1.310566, 1, 0.9058824, 0, 1,
-1.033021, -0.5538927, -1.727683, 1, 0.9137255, 0, 1,
-1.032477, -0.6154824, -2.034563, 1, 0.9176471, 0, 1,
-1.026778, -0.3561292, -1.245701, 1, 0.9254902, 0, 1,
-1.026696, 0.3591157, -0.5196828, 1, 0.9294118, 0, 1,
-1.024134, 0.06637214, -0.4277252, 1, 0.9372549, 0, 1,
-1.018086, -0.8778533, -2.317235, 1, 0.9411765, 0, 1,
-1.007383, 0.6133485, -1.237367, 1, 0.9490196, 0, 1,
-1.006595, -2.047782, -2.913206, 1, 0.9529412, 0, 1,
-1.003584, -2.23656, -0.7716967, 1, 0.9607843, 0, 1,
-1.00236, -1.22935, -1.172636, 1, 0.9647059, 0, 1,
-0.9954717, -0.9580548, -1.170914, 1, 0.972549, 0, 1,
-0.9910154, -1.520436, -3.56491, 1, 0.9764706, 0, 1,
-0.9888833, -0.06613431, -2.452887, 1, 0.9843137, 0, 1,
-0.9716568, 1.05987, -0.532637, 1, 0.9882353, 0, 1,
-0.969315, -0.6251662, -1.832661, 1, 0.9960784, 0, 1,
-0.9691935, -0.6701685, -3.721991, 0.9960784, 1, 0, 1,
-0.9682059, -0.2141996, -2.077275, 0.9921569, 1, 0, 1,
-0.9675206, -0.1737992, -2.008148, 0.9843137, 1, 0, 1,
-0.9675075, -0.0503286, -2.459328, 0.9803922, 1, 0, 1,
-0.9659079, 0.08624028, -1.265342, 0.972549, 1, 0, 1,
-0.9593266, -0.9144014, -1.761662, 0.9686275, 1, 0, 1,
-0.948194, -0.204191, -1.312779, 0.9607843, 1, 0, 1,
-0.934437, -1.262505, -1.913007, 0.9568627, 1, 0, 1,
-0.9309409, 0.7675253, -0.04083289, 0.9490196, 1, 0, 1,
-0.9304814, 0.8745323, -0.8476083, 0.945098, 1, 0, 1,
-0.9261243, -1.23315, -3.490164, 0.9372549, 1, 0, 1,
-0.9252063, 0.740891, 0.6309845, 0.9333333, 1, 0, 1,
-0.9233943, -0.8748822, -3.863436, 0.9254902, 1, 0, 1,
-0.9187558, 2.119051, -0.6147905, 0.9215686, 1, 0, 1,
-0.9168294, 1.170405, -0.7324255, 0.9137255, 1, 0, 1,
-0.9164397, -0.8169464, -3.350103, 0.9098039, 1, 0, 1,
-0.9136401, -1.050378, -3.105655, 0.9019608, 1, 0, 1,
-0.9129862, 1.83667, 0.6821418, 0.8941177, 1, 0, 1,
-0.9023976, -0.3067062, -1.780129, 0.8901961, 1, 0, 1,
-0.9017714, -0.1603886, -0.4111122, 0.8823529, 1, 0, 1,
-0.9010019, 1.894718, -0.06874002, 0.8784314, 1, 0, 1,
-0.8979918, -1.566551, -2.630432, 0.8705882, 1, 0, 1,
-0.8979282, -0.8575245, -3.159667, 0.8666667, 1, 0, 1,
-0.8910596, -1.509624, -3.181412, 0.8588235, 1, 0, 1,
-0.8889437, 0.4611239, -2.990449, 0.854902, 1, 0, 1,
-0.8881462, 1.402308, -1.214583, 0.8470588, 1, 0, 1,
-0.8818225, 1.327924, 0.2593345, 0.8431373, 1, 0, 1,
-0.8793477, 1.09092, -0.6506608, 0.8352941, 1, 0, 1,
-0.8724114, -0.5714813, -2.906462, 0.8313726, 1, 0, 1,
-0.8679723, -1.30917, -1.616898, 0.8235294, 1, 0, 1,
-0.8605729, 1.035069, -1.428171, 0.8196079, 1, 0, 1,
-0.859795, 0.5468152, -2.965503, 0.8117647, 1, 0, 1,
-0.8564355, -0.2594192, -2.398277, 0.8078431, 1, 0, 1,
-0.8555294, -1.987069, -4.450517, 0.8, 1, 0, 1,
-0.853438, -1.523434, -1.268672, 0.7921569, 1, 0, 1,
-0.8523399, -2.028406, -1.662579, 0.7882353, 1, 0, 1,
-0.848994, 1.707062, -1.71372, 0.7803922, 1, 0, 1,
-0.8484687, -0.2419837, 0.4447481, 0.7764706, 1, 0, 1,
-0.8453423, 1.504047, -0.01596267, 0.7686275, 1, 0, 1,
-0.8412181, 0.2258125, -0.9189751, 0.7647059, 1, 0, 1,
-0.8405501, 0.849005, -0.1049832, 0.7568628, 1, 0, 1,
-0.8299978, -0.5656627, -2.266574, 0.7529412, 1, 0, 1,
-0.8227127, 0.9273543, 0.4405946, 0.7450981, 1, 0, 1,
-0.8222759, 0.0586339, -2.005413, 0.7411765, 1, 0, 1,
-0.8049831, 0.4903517, 0.1608165, 0.7333333, 1, 0, 1,
-0.7994921, -0.3901921, -4.053781, 0.7294118, 1, 0, 1,
-0.798761, 0.7391751, -2.265631, 0.7215686, 1, 0, 1,
-0.7921587, 1.208261, -0.588141, 0.7176471, 1, 0, 1,
-0.7895641, 0.9587251, -0.9422318, 0.7098039, 1, 0, 1,
-0.788607, 0.5731983, -0.3354999, 0.7058824, 1, 0, 1,
-0.7812186, -1.990118, -2.299559, 0.6980392, 1, 0, 1,
-0.7800383, 0.2912164, -0.02046429, 0.6901961, 1, 0, 1,
-0.7681302, -0.09229738, -1.97369, 0.6862745, 1, 0, 1,
-0.7645371, 0.008301686, -2.407595, 0.6784314, 1, 0, 1,
-0.7626817, -0.9634607, -3.09025, 0.6745098, 1, 0, 1,
-0.7615577, -0.3081347, -1.291585, 0.6666667, 1, 0, 1,
-0.756588, -0.789484, -2.663522, 0.6627451, 1, 0, 1,
-0.7553562, 0.737412, -2.604377, 0.654902, 1, 0, 1,
-0.7540027, 1.41034, 0.04968654, 0.6509804, 1, 0, 1,
-0.753575, 0.6281272, -0.7031693, 0.6431373, 1, 0, 1,
-0.7523839, -0.5933551, -1.715276, 0.6392157, 1, 0, 1,
-0.7519295, 0.2641048, 0.2381174, 0.6313726, 1, 0, 1,
-0.7500769, -0.1728836, -2.834592, 0.627451, 1, 0, 1,
-0.7488375, -1.314859, -0.6059855, 0.6196079, 1, 0, 1,
-0.7401331, 1.666803, -1.07791, 0.6156863, 1, 0, 1,
-0.7394248, 2.558337, -0.3354234, 0.6078432, 1, 0, 1,
-0.738944, -1.358535, -3.890599, 0.6039216, 1, 0, 1,
-0.733995, 1.422177, -1.152316, 0.5960785, 1, 0, 1,
-0.7291296, 0.5013376, -0.5258518, 0.5882353, 1, 0, 1,
-0.727631, 1.580261, 0.4108548, 0.5843138, 1, 0, 1,
-0.7188517, 0.3222062, 1.014255, 0.5764706, 1, 0, 1,
-0.7181354, 0.06513698, -0.1793132, 0.572549, 1, 0, 1,
-0.7157443, -0.878495, -2.426251, 0.5647059, 1, 0, 1,
-0.7108492, 1.228201, 2.255297, 0.5607843, 1, 0, 1,
-0.6999701, -0.152859, -2.865581, 0.5529412, 1, 0, 1,
-0.6988574, 0.3196045, -0.5851223, 0.5490196, 1, 0, 1,
-0.6964642, 0.1902224, 0.2241704, 0.5411765, 1, 0, 1,
-0.6915312, 0.7320755, -2.15647, 0.5372549, 1, 0, 1,
-0.6855561, 1.255172, -1.595614, 0.5294118, 1, 0, 1,
-0.6790117, 0.1723777, -1.090062, 0.5254902, 1, 0, 1,
-0.6773852, 0.7745174, 1.068311, 0.5176471, 1, 0, 1,
-0.6764997, -1.688182, -2.46867, 0.5137255, 1, 0, 1,
-0.6751198, -0.124097, -1.652536, 0.5058824, 1, 0, 1,
-0.6697937, -0.4131878, -1.031745, 0.5019608, 1, 0, 1,
-0.6640803, -0.6910908, -0.9174471, 0.4941176, 1, 0, 1,
-0.6546546, 0.3176079, -2.211655, 0.4862745, 1, 0, 1,
-0.6519639, -1.778762, -0.8533053, 0.4823529, 1, 0, 1,
-0.6494021, -0.8833005, -1.714681, 0.4745098, 1, 0, 1,
-0.6449131, 1.782384, -1.265128, 0.4705882, 1, 0, 1,
-0.6379065, 0.2859382, -0.8734513, 0.4627451, 1, 0, 1,
-0.6358626, 0.6240417, -2.032453, 0.4588235, 1, 0, 1,
-0.6324677, -0.5494941, -2.619035, 0.4509804, 1, 0, 1,
-0.6318432, 1.173548, -2.37855, 0.4470588, 1, 0, 1,
-0.6311241, -2.359328, -2.862206, 0.4392157, 1, 0, 1,
-0.6294277, 0.1562794, -2.603876, 0.4352941, 1, 0, 1,
-0.6254423, -3.199492, -3.188174, 0.427451, 1, 0, 1,
-0.6201715, 1.017483, 0.7904924, 0.4235294, 1, 0, 1,
-0.6192984, -1.622931, -1.574151, 0.4156863, 1, 0, 1,
-0.6192862, 0.1870453, -1.350606, 0.4117647, 1, 0, 1,
-0.6137325, -0.4016758, -3.623745, 0.4039216, 1, 0, 1,
-0.612938, 2.509369, -1.725018, 0.3960784, 1, 0, 1,
-0.609451, -0.4351909, -1.757215, 0.3921569, 1, 0, 1,
-0.60755, -0.6116367, -1.69133, 0.3843137, 1, 0, 1,
-0.6051149, -0.3378609, -2.426141, 0.3803922, 1, 0, 1,
-0.6025928, 0.60777, -0.7055138, 0.372549, 1, 0, 1,
-0.5964117, -0.8179762, -1.701688, 0.3686275, 1, 0, 1,
-0.5917729, -0.597902, -3.099128, 0.3607843, 1, 0, 1,
-0.5917392, -1.498521, -4.263385, 0.3568628, 1, 0, 1,
-0.5906293, -0.2452031, -2.847634, 0.3490196, 1, 0, 1,
-0.5895818, 1.792753, -0.850587, 0.345098, 1, 0, 1,
-0.5873002, -1.099727, -1.299721, 0.3372549, 1, 0, 1,
-0.5858337, 0.09752605, -3.050219, 0.3333333, 1, 0, 1,
-0.5850326, -1.202637, -2.829795, 0.3254902, 1, 0, 1,
-0.5838875, -0.6207868, -3.858712, 0.3215686, 1, 0, 1,
-0.5790454, 0.05701086, -2.268007, 0.3137255, 1, 0, 1,
-0.5735167, 0.2825221, -1.153308, 0.3098039, 1, 0, 1,
-0.5706154, 0.2732946, -0.5979632, 0.3019608, 1, 0, 1,
-0.5705516, -1.060834, -3.940717, 0.2941177, 1, 0, 1,
-0.5654802, -1.547488, -4.384388, 0.2901961, 1, 0, 1,
-0.5619446, -0.3077737, -3.039833, 0.282353, 1, 0, 1,
-0.5591909, -1.13742, -3.379744, 0.2784314, 1, 0, 1,
-0.5532157, -2.176953, -3.85287, 0.2705882, 1, 0, 1,
-0.550918, 0.6320562, -0.373288, 0.2666667, 1, 0, 1,
-0.5428178, -1.120055, -2.282455, 0.2588235, 1, 0, 1,
-0.5388945, 1.256115, 0.59074, 0.254902, 1, 0, 1,
-0.5386384, -0.3264174, -2.058861, 0.2470588, 1, 0, 1,
-0.5379695, 1.066482, -0.5865442, 0.2431373, 1, 0, 1,
-0.5372555, -0.7521847, -3.545084, 0.2352941, 1, 0, 1,
-0.5361376, 0.8101513, -2.868254, 0.2313726, 1, 0, 1,
-0.5342165, -1.923661, -3.639766, 0.2235294, 1, 0, 1,
-0.5318574, -0.3345682, -3.106666, 0.2196078, 1, 0, 1,
-0.5315635, 0.03729147, -1.963108, 0.2117647, 1, 0, 1,
-0.5310099, 0.4321162, -0.5313212, 0.2078431, 1, 0, 1,
-0.5309896, -1.402945, -4.575183, 0.2, 1, 0, 1,
-0.5272384, -0.4260078, -1.443335, 0.1921569, 1, 0, 1,
-0.526733, -0.3257171, -3.092807, 0.1882353, 1, 0, 1,
-0.5235031, 1.418352, 0.003027204, 0.1803922, 1, 0, 1,
-0.5132068, 0.4758074, -1.064633, 0.1764706, 1, 0, 1,
-0.510969, 1.072272, 2.529346, 0.1686275, 1, 0, 1,
-0.5107694, -0.7284123, -2.926248, 0.1647059, 1, 0, 1,
-0.5093697, 0.350772, -1.835596, 0.1568628, 1, 0, 1,
-0.5077958, 0.9763842, 0.05137444, 0.1529412, 1, 0, 1,
-0.5069488, -0.04060397, -1.665644, 0.145098, 1, 0, 1,
-0.4991412, 0.4012359, -0.3470332, 0.1411765, 1, 0, 1,
-0.4902569, -0.008724083, -2.013825, 0.1333333, 1, 0, 1,
-0.4873804, -0.3056961, -1.763562, 0.1294118, 1, 0, 1,
-0.4873115, -0.7236196, -2.406974, 0.1215686, 1, 0, 1,
-0.4860939, 1.037251, -0.1601942, 0.1176471, 1, 0, 1,
-0.4852467, 0.2721429, -1.258989, 0.1098039, 1, 0, 1,
-0.4843926, -0.5414038, -3.497957, 0.1058824, 1, 0, 1,
-0.484143, 0.7998785, 0.8811622, 0.09803922, 1, 0, 1,
-0.482022, -0.1330291, -0.5781638, 0.09019608, 1, 0, 1,
-0.4807784, 1.075441, 0.4985014, 0.08627451, 1, 0, 1,
-0.4788483, -0.1608552, -3.594206, 0.07843138, 1, 0, 1,
-0.4756939, -0.2759125, -2.081419, 0.07450981, 1, 0, 1,
-0.472838, 0.7505575, -1.210888, 0.06666667, 1, 0, 1,
-0.470946, 1.604857, -0.5605249, 0.0627451, 1, 0, 1,
-0.4703031, 0.0921514, -1.6921, 0.05490196, 1, 0, 1,
-0.4615082, 1.384653, -0.5680079, 0.05098039, 1, 0, 1,
-0.4577137, 0.4590687, -1.871372, 0.04313726, 1, 0, 1,
-0.4561141, 0.1972756, -1.858743, 0.03921569, 1, 0, 1,
-0.4487168, -0.718343, -2.666381, 0.03137255, 1, 0, 1,
-0.4460624, -0.4139994, -1.405324, 0.02745098, 1, 0, 1,
-0.4454841, -1.529562, -1.622763, 0.01960784, 1, 0, 1,
-0.4449757, 0.1517821, -1.098935, 0.01568628, 1, 0, 1,
-0.4423302, -0.06719569, -0.7447515, 0.007843138, 1, 0, 1,
-0.4422863, 1.333212, 1.266685, 0.003921569, 1, 0, 1,
-0.4381652, -1.553569, -3.123714, 0, 1, 0.003921569, 1,
-0.4379725, 0.8475794, -0.3365639, 0, 1, 0.01176471, 1,
-0.4371545, -0.7921808, -3.312165, 0, 1, 0.01568628, 1,
-0.4359439, -0.3220262, -1.145042, 0, 1, 0.02352941, 1,
-0.4313399, 1.485123, -0.7342739, 0, 1, 0.02745098, 1,
-0.4297867, -0.1073187, -2.600346, 0, 1, 0.03529412, 1,
-0.4163106, -1.657458, -2.29371, 0, 1, 0.03921569, 1,
-0.4155079, -0.5257525, -1.87496, 0, 1, 0.04705882, 1,
-0.4154575, 1.077864, -1.021528, 0, 1, 0.05098039, 1,
-0.4147586, -0.7778069, -3.483771, 0, 1, 0.05882353, 1,
-0.406449, -0.2947247, -1.992854, 0, 1, 0.0627451, 1,
-0.4023883, 1.104539, 0.06347925, 0, 1, 0.07058824, 1,
-0.3997787, 0.4613774, 2.107689, 0, 1, 0.07450981, 1,
-0.3876668, 1.457446, -1.396523, 0, 1, 0.08235294, 1,
-0.3871832, 0.3205123, -1.484425, 0, 1, 0.08627451, 1,
-0.3843038, 1.762157, 0.3440697, 0, 1, 0.09411765, 1,
-0.3812908, -2.046699, -1.727575, 0, 1, 0.1019608, 1,
-0.3810165, 1.945297, 0.7718804, 0, 1, 0.1058824, 1,
-0.378243, 2.061116, 0.4773814, 0, 1, 0.1137255, 1,
-0.3729022, -1.324872, -3.051071, 0, 1, 0.1176471, 1,
-0.3715538, 0.7723769, -0.462936, 0, 1, 0.1254902, 1,
-0.3689634, -0.5634369, -2.439415, 0, 1, 0.1294118, 1,
-0.3654877, -0.8465139, -3.008462, 0, 1, 0.1372549, 1,
-0.3642567, 0.647775, 0.2531568, 0, 1, 0.1411765, 1,
-0.3632555, 0.9026232, -1.103583, 0, 1, 0.1490196, 1,
-0.3621837, -0.382765, -3.160547, 0, 1, 0.1529412, 1,
-0.355134, -1.73186, -3.181814, 0, 1, 0.1607843, 1,
-0.350593, 0.4659606, -0.6011553, 0, 1, 0.1647059, 1,
-0.3481633, -0.7628443, -2.726087, 0, 1, 0.172549, 1,
-0.3415745, -0.3833818, -3.945897, 0, 1, 0.1764706, 1,
-0.3383363, -0.3312041, -1.319019, 0, 1, 0.1843137, 1,
-0.3352773, -0.4072101, -1.225736, 0, 1, 0.1882353, 1,
-0.3275134, 0.2357142, -1.240943, 0, 1, 0.1960784, 1,
-0.3274567, -0.5073196, -4.25722, 0, 1, 0.2039216, 1,
-0.325492, -1.014194, -2.916088, 0, 1, 0.2078431, 1,
-0.322527, 0.495767, 0.5197574, 0, 1, 0.2156863, 1,
-0.3198246, 1.226721, 0.2136821, 0, 1, 0.2196078, 1,
-0.316552, -0.08869543, -2.956604, 0, 1, 0.227451, 1,
-0.3132972, 1.982268, 0.1709457, 0, 1, 0.2313726, 1,
-0.3126329, 0.6604372, -0.252131, 0, 1, 0.2392157, 1,
-0.3118481, -0.5681883, -3.806853, 0, 1, 0.2431373, 1,
-0.3097154, 0.1782126, 0.9859604, 0, 1, 0.2509804, 1,
-0.3068955, 1.301399, -1.640596, 0, 1, 0.254902, 1,
-0.3047997, -0.2205218, -2.653727, 0, 1, 0.2627451, 1,
-0.3029703, 1.144539, 0.1132381, 0, 1, 0.2666667, 1,
-0.2995821, 0.8496064, -0.8593286, 0, 1, 0.2745098, 1,
-0.2932696, 1.401994, 0.293767, 0, 1, 0.2784314, 1,
-0.2925562, -0.2715281, -2.759801, 0, 1, 0.2862745, 1,
-0.2914345, -0.9295264, -2.72451, 0, 1, 0.2901961, 1,
-0.2891214, -0.5456043, -3.433252, 0, 1, 0.2980392, 1,
-0.2889967, 0.1373129, -0.3969642, 0, 1, 0.3058824, 1,
-0.2867608, 0.892083, -1.918491, 0, 1, 0.3098039, 1,
-0.2859893, 1.497792, -1.239549, 0, 1, 0.3176471, 1,
-0.2834154, 0.1709599, -2.361984, 0, 1, 0.3215686, 1,
-0.2824098, 0.1537612, -1.029327, 0, 1, 0.3294118, 1,
-0.281322, -0.05998444, -2.34752, 0, 1, 0.3333333, 1,
-0.277686, -1.332249, -1.932005, 0, 1, 0.3411765, 1,
-0.2770683, 1.188777, 0.6455784, 0, 1, 0.345098, 1,
-0.2765104, -0.07180358, -1.76972, 0, 1, 0.3529412, 1,
-0.2754712, -0.02730408, -1.122772, 0, 1, 0.3568628, 1,
-0.2754191, 0.9699718, -1.079144, 0, 1, 0.3647059, 1,
-0.2747363, -0.9570748, -3.800215, 0, 1, 0.3686275, 1,
-0.2735833, -0.2809058, -2.556902, 0, 1, 0.3764706, 1,
-0.2706563, -0.7785119, -3.624142, 0, 1, 0.3803922, 1,
-0.2705309, 1.707669, -1.008793, 0, 1, 0.3882353, 1,
-0.268238, 0.76865, 0.1977059, 0, 1, 0.3921569, 1,
-0.2673173, -0.02024712, -1.832891, 0, 1, 0.4, 1,
-0.2633632, -2.551784, -2.543475, 0, 1, 0.4078431, 1,
-0.2617911, 0.5028964, 1.107618, 0, 1, 0.4117647, 1,
-0.2518727, 0.5034578, 0.01326919, 0, 1, 0.4196078, 1,
-0.2461735, 1.285622, -2.001663, 0, 1, 0.4235294, 1,
-0.2460003, -1.217693, -1.970968, 0, 1, 0.4313726, 1,
-0.2452249, 0.4325974, 0.3571267, 0, 1, 0.4352941, 1,
-0.2373382, 1.456303, -1.643098, 0, 1, 0.4431373, 1,
-0.2373293, 1.251178, 0.7116341, 0, 1, 0.4470588, 1,
-0.2370156, -0.458719, -2.195455, 0, 1, 0.454902, 1,
-0.2363984, -1.033644, -2.936723, 0, 1, 0.4588235, 1,
-0.2282132, 1.335188, -1.489068, 0, 1, 0.4666667, 1,
-0.2223999, 1.586789, 0.4707638, 0, 1, 0.4705882, 1,
-0.2223855, -0.1049865, -0.4527133, 0, 1, 0.4784314, 1,
-0.222234, -0.2025694, -2.147142, 0, 1, 0.4823529, 1,
-0.2126321, 0.679006, -1.203936, 0, 1, 0.4901961, 1,
-0.2087357, -0.3620744, -1.192464, 0, 1, 0.4941176, 1,
-0.2083523, -1.110618, -3.532544, 0, 1, 0.5019608, 1,
-0.2047071, -0.5503684, -3.384716, 0, 1, 0.509804, 1,
-0.2020032, -1.188425, -3.510792, 0, 1, 0.5137255, 1,
-0.2000801, 0.2222178, 1.292391, 0, 1, 0.5215687, 1,
-0.1990507, -0.8312243, -4.365706, 0, 1, 0.5254902, 1,
-0.1953192, -0.7939287, -4.031354, 0, 1, 0.5333334, 1,
-0.1939976, 0.09119949, -0.8712198, 0, 1, 0.5372549, 1,
-0.1919159, -0.4725873, -3.176905, 0, 1, 0.5450981, 1,
-0.1905685, -0.2378908, -2.525954, 0, 1, 0.5490196, 1,
-0.1866284, 0.3199591, -1.238864, 0, 1, 0.5568628, 1,
-0.1858068, -0.6585872, -1.349417, 0, 1, 0.5607843, 1,
-0.1832815, -0.2444654, -2.595987, 0, 1, 0.5686275, 1,
-0.1758724, 0.3488838, -1.390954, 0, 1, 0.572549, 1,
-0.1726388, 1.468224, -1.087638, 0, 1, 0.5803922, 1,
-0.1694911, 0.3782438, 0.8122765, 0, 1, 0.5843138, 1,
-0.1683387, -0.8264969, -3.790005, 0, 1, 0.5921569, 1,
-0.1676105, 0.8854358, 0.3937553, 0, 1, 0.5960785, 1,
-0.1663275, -1.338275, -3.275221, 0, 1, 0.6039216, 1,
-0.1659755, -0.3972, -3.175346, 0, 1, 0.6117647, 1,
-0.1650413, 0.10075, 0.02136742, 0, 1, 0.6156863, 1,
-0.1601418, 0.8402056, 1.043342, 0, 1, 0.6235294, 1,
-0.1542798, -1.664308, -2.751093, 0, 1, 0.627451, 1,
-0.152329, 0.0757195, -1.895696, 0, 1, 0.6352941, 1,
-0.1511646, -1.487844, -3.440916, 0, 1, 0.6392157, 1,
-0.1511012, -0.8548916, -2.280995, 0, 1, 0.6470588, 1,
-0.1444293, 1.236913, 0.7355204, 0, 1, 0.6509804, 1,
-0.1425441, -0.09749042, -0.2190164, 0, 1, 0.6588235, 1,
-0.1395463, 1.591659, -0.2798462, 0, 1, 0.6627451, 1,
-0.1390379, -0.01703181, -2.271372, 0, 1, 0.6705883, 1,
-0.1386119, 0.8886828, -0.8679883, 0, 1, 0.6745098, 1,
-0.138241, -1.261571, -3.871015, 0, 1, 0.682353, 1,
-0.1339125, -0.6125233, -4.227933, 0, 1, 0.6862745, 1,
-0.1292347, -0.3689752, -2.729599, 0, 1, 0.6941177, 1,
-0.1273429, -2.33758, -2.111793, 0, 1, 0.7019608, 1,
-0.1239948, 1.533088, -0.8211097, 0, 1, 0.7058824, 1,
-0.1234917, 1.914011, 0.2307795, 0, 1, 0.7137255, 1,
-0.1216617, 1.259006, -0.6642106, 0, 1, 0.7176471, 1,
-0.1214853, -0.777231, -1.871363, 0, 1, 0.7254902, 1,
-0.1173312, 0.1216654, -0.3911085, 0, 1, 0.7294118, 1,
-0.1149484, -0.3582407, -1.623785, 0, 1, 0.7372549, 1,
-0.1123014, -0.3297648, -4.705091, 0, 1, 0.7411765, 1,
-0.1094651, 0.1454081, -0.1645585, 0, 1, 0.7490196, 1,
-0.107093, 0.1907138, 0.8931041, 0, 1, 0.7529412, 1,
-0.1044974, -0.05105738, -2.130856, 0, 1, 0.7607843, 1,
-0.1041436, -0.7264717, -3.093909, 0, 1, 0.7647059, 1,
-0.1019894, -1.938494, -2.836658, 0, 1, 0.772549, 1,
-0.10102, -2.662847, -3.449944, 0, 1, 0.7764706, 1,
-0.1006187, 0.2745784, 0.3925126, 0, 1, 0.7843137, 1,
-0.09902155, 1.285317, -1.213001, 0, 1, 0.7882353, 1,
-0.09795175, -1.815695, -2.910218, 0, 1, 0.7960784, 1,
-0.0953215, -0.06193373, -3.36097, 0, 1, 0.8039216, 1,
-0.09388533, 1.181611, 0.1919303, 0, 1, 0.8078431, 1,
-0.0937723, 1.548701, -1.070271, 0, 1, 0.8156863, 1,
-0.09226765, -1.980013, -1.956727, 0, 1, 0.8196079, 1,
-0.0904192, 0.7513129, -1.706637, 0, 1, 0.827451, 1,
-0.09021007, -1.319765, -2.177694, 0, 1, 0.8313726, 1,
-0.08841858, -0.2728524, -4.377908, 0, 1, 0.8392157, 1,
-0.08826135, -0.7874246, -3.027267, 0, 1, 0.8431373, 1,
-0.08741192, -1.547363, -2.564277, 0, 1, 0.8509804, 1,
-0.08656154, 1.660117, 1.068773, 0, 1, 0.854902, 1,
-0.08590692, 0.2945905, -0.2157433, 0, 1, 0.8627451, 1,
-0.08319099, -0.1663245, -4.151381, 0, 1, 0.8666667, 1,
-0.08121851, -0.252961, -2.82284, 0, 1, 0.8745098, 1,
-0.07676761, 0.3297485, -1.566579, 0, 1, 0.8784314, 1,
-0.07278761, -0.7546701, -2.366879, 0, 1, 0.8862745, 1,
-0.06618534, -0.1866323, -2.09418, 0, 1, 0.8901961, 1,
-0.06032315, 1.131943, -1.282594, 0, 1, 0.8980392, 1,
-0.05790221, 0.1317383, -1.830698, 0, 1, 0.9058824, 1,
-0.05077043, 1.766254, -1.125336, 0, 1, 0.9098039, 1,
-0.0493528, -0.9261841, -3.767677, 0, 1, 0.9176471, 1,
-0.04628706, 0.07729235, -0.5751348, 0, 1, 0.9215686, 1,
-0.04248858, -0.1169104, -4.238487, 0, 1, 0.9294118, 1,
-0.03899331, 0.03656691, 0.3263545, 0, 1, 0.9333333, 1,
-0.03699813, 0.9113084, 0.3453622, 0, 1, 0.9411765, 1,
-0.03278755, 0.5128837, 0.0905327, 0, 1, 0.945098, 1,
-0.02924614, -0.9557014, -2.235414, 0, 1, 0.9529412, 1,
-0.02730227, 1.077218, 0.4707915, 0, 1, 0.9568627, 1,
-0.02714881, 0.8260957, 0.8550152, 0, 1, 0.9647059, 1,
-0.0255079, 0.9332777, 0.1439983, 0, 1, 0.9686275, 1,
-0.02483125, -0.2383561, -1.875665, 0, 1, 0.9764706, 1,
-0.01710579, 0.1616291, -0.05102088, 0, 1, 0.9803922, 1,
-0.01481693, -1.169862, -2.553892, 0, 1, 0.9882353, 1,
-0.009433545, 0.5513772, -0.3775733, 0, 1, 0.9921569, 1,
-0.00783793, -1.185953, -2.821645, 0, 1, 1, 1,
-0.006400032, 0.24799, -1.290349, 0, 0.9921569, 1, 1,
-0.004557312, -0.1335398, -2.106692, 0, 0.9882353, 1, 1,
0.0003040532, 0.7261907, 0.1655149, 0, 0.9803922, 1, 1,
0.001261519, 1.348426, 1.756785, 0, 0.9764706, 1, 1,
0.004450597, -1.487772, 3.172372, 0, 0.9686275, 1, 1,
0.006926057, 1.009653, -1.305832, 0, 0.9647059, 1, 1,
0.01220684, 0.5318499, -2.40584, 0, 0.9568627, 1, 1,
0.01224778, 0.7906697, -0.7648158, 0, 0.9529412, 1, 1,
0.01362145, -0.06014994, 2.405688, 0, 0.945098, 1, 1,
0.01534488, -1.124644, 3.504661, 0, 0.9411765, 1, 1,
0.02338118, -0.1297642, 3.612124, 0, 0.9333333, 1, 1,
0.02453979, 1.096842, 0.5559419, 0, 0.9294118, 1, 1,
0.02530265, -0.3364014, 3.233819, 0, 0.9215686, 1, 1,
0.03737722, 1.039567, -0.2747138, 0, 0.9176471, 1, 1,
0.03957978, 0.694386, 0.5707756, 0, 0.9098039, 1, 1,
0.0423063, 0.6495906, 1.175563, 0, 0.9058824, 1, 1,
0.04689352, -0.5687028, 3.865297, 0, 0.8980392, 1, 1,
0.05287896, -0.2214406, 0.6434789, 0, 0.8901961, 1, 1,
0.05394089, -1.873194, 3.06889, 0, 0.8862745, 1, 1,
0.0544808, 0.2716933, -1.549923, 0, 0.8784314, 1, 1,
0.05941532, -0.7830386, 5.13581, 0, 0.8745098, 1, 1,
0.06162055, 0.1496561, 1.350721, 0, 0.8666667, 1, 1,
0.06203843, 1.243485, -0.3035721, 0, 0.8627451, 1, 1,
0.06486426, 0.6357376, 0.06504149, 0, 0.854902, 1, 1,
0.06529956, -0.2348993, 2.709789, 0, 0.8509804, 1, 1,
0.06530854, -1.058017, 3.124878, 0, 0.8431373, 1, 1,
0.06542827, -0.2197899, 2.355978, 0, 0.8392157, 1, 1,
0.06977673, 1.01023, 0.1459402, 0, 0.8313726, 1, 1,
0.07121463, -1.677514, 3.815346, 0, 0.827451, 1, 1,
0.07314518, -0.2078159, 3.312845, 0, 0.8196079, 1, 1,
0.08859921, -0.3454789, 3.008702, 0, 0.8156863, 1, 1,
0.1001286, -1.150933, 3.602277, 0, 0.8078431, 1, 1,
0.103044, -0.2563209, 2.737822, 0, 0.8039216, 1, 1,
0.1038705, 0.1623106, -0.1956606, 0, 0.7960784, 1, 1,
0.1084623, -0.9970816, 3.261404, 0, 0.7882353, 1, 1,
0.1115043, 0.1234544, 0.5112141, 0, 0.7843137, 1, 1,
0.1163086, 0.2489908, -0.4203927, 0, 0.7764706, 1, 1,
0.1216742, -0.6437883, 3.859162, 0, 0.772549, 1, 1,
0.1259654, -1.057542, 4.008686, 0, 0.7647059, 1, 1,
0.1265888, 0.5116858, -0.5872504, 0, 0.7607843, 1, 1,
0.1280173, 0.09932132, 0.9358072, 0, 0.7529412, 1, 1,
0.1315752, -1.556993, 1.412044, 0, 0.7490196, 1, 1,
0.1329163, -1.451014, 1.841602, 0, 0.7411765, 1, 1,
0.1330429, -1.031714, 4.096083, 0, 0.7372549, 1, 1,
0.1351091, -0.6270954, 4.118224, 0, 0.7294118, 1, 1,
0.141169, 0.7185075, -0.4342301, 0, 0.7254902, 1, 1,
0.141234, 0.2027086, -1.170968, 0, 0.7176471, 1, 1,
0.1425078, -2.082298, 4.417572, 0, 0.7137255, 1, 1,
0.1430359, 0.2191257, 0.7330673, 0, 0.7058824, 1, 1,
0.1437225, 0.06801427, -0.2999377, 0, 0.6980392, 1, 1,
0.1446826, -1.671208, 2.328539, 0, 0.6941177, 1, 1,
0.1454433, -0.04953422, 3.080909, 0, 0.6862745, 1, 1,
0.1477265, 0.08831892, -0.6166362, 0, 0.682353, 1, 1,
0.1490661, -0.01779225, 2.516137, 0, 0.6745098, 1, 1,
0.1529053, 2.967479, -0.3169074, 0, 0.6705883, 1, 1,
0.1529522, -1.386257, 4.416103, 0, 0.6627451, 1, 1,
0.1536368, 0.579208, -0.8114746, 0, 0.6588235, 1, 1,
0.1560977, -2.499744, 3.492899, 0, 0.6509804, 1, 1,
0.156182, 0.6124914, 0.1940219, 0, 0.6470588, 1, 1,
0.1576765, -1.107536, 2.604188, 0, 0.6392157, 1, 1,
0.1580933, 0.7094012, -0.3402861, 0, 0.6352941, 1, 1,
0.1641938, 2.156261, 0.3403776, 0, 0.627451, 1, 1,
0.1692252, 0.3999632, 0.6565411, 0, 0.6235294, 1, 1,
0.1701646, 0.6884554, 1.084417, 0, 0.6156863, 1, 1,
0.1706319, 1.38317, -1.327011, 0, 0.6117647, 1, 1,
0.1730073, -0.4187149, 1.789147, 0, 0.6039216, 1, 1,
0.1761868, -0.2492914, 2.616771, 0, 0.5960785, 1, 1,
0.1800193, 0.4072429, -0.3934959, 0, 0.5921569, 1, 1,
0.1838332, -0.3518258, 2.513121, 0, 0.5843138, 1, 1,
0.1842565, 0.969651, 1.147004, 0, 0.5803922, 1, 1,
0.1844907, 0.9969783, -0.08524804, 0, 0.572549, 1, 1,
0.1930364, 0.9396974, 2.398816, 0, 0.5686275, 1, 1,
0.1939809, -0.0307509, 1.953939, 0, 0.5607843, 1, 1,
0.198717, -0.003578844, -0.5429856, 0, 0.5568628, 1, 1,
0.1991108, 1.620999, -0.3054813, 0, 0.5490196, 1, 1,
0.2010251, 1.507093, -0.6357944, 0, 0.5450981, 1, 1,
0.2040959, 1.149969, -0.6981315, 0, 0.5372549, 1, 1,
0.20476, 0.2150146, 0.813758, 0, 0.5333334, 1, 1,
0.2065581, -0.1988178, 2.058375, 0, 0.5254902, 1, 1,
0.2067837, 0.2724889, 0.3380723, 0, 0.5215687, 1, 1,
0.2079779, 1.405404, -0.340248, 0, 0.5137255, 1, 1,
0.2095158, -0.3523605, 1.412405, 0, 0.509804, 1, 1,
0.2097311, 1.012147, -3.288404, 0, 0.5019608, 1, 1,
0.2136085, -0.09659222, 1.147291, 0, 0.4941176, 1, 1,
0.2169167, 1.309234, -0.6337222, 0, 0.4901961, 1, 1,
0.2220408, 0.5661896, 0.9483948, 0, 0.4823529, 1, 1,
0.2224239, 0.5686019, 0.3288022, 0, 0.4784314, 1, 1,
0.2240825, -0.2212054, 2.027213, 0, 0.4705882, 1, 1,
0.2267852, 0.992178, 1.183536, 0, 0.4666667, 1, 1,
0.2273848, -0.782123, 2.891789, 0, 0.4588235, 1, 1,
0.2314504, 0.7652646, 0.06195862, 0, 0.454902, 1, 1,
0.2329592, -1.532225, 3.562728, 0, 0.4470588, 1, 1,
0.2345829, 1.980767, 1.186734, 0, 0.4431373, 1, 1,
0.2444581, 0.3478613, -0.3789054, 0, 0.4352941, 1, 1,
0.2472577, -1.316604, 2.292639, 0, 0.4313726, 1, 1,
0.2501812, 0.9034206, 0.6972902, 0, 0.4235294, 1, 1,
0.2515039, 0.8517144, 0.1464016, 0, 0.4196078, 1, 1,
0.2515539, -0.5813673, 3.212406, 0, 0.4117647, 1, 1,
0.2531581, -2.188858, 3.029367, 0, 0.4078431, 1, 1,
0.2541863, -0.4651591, 2.991562, 0, 0.4, 1, 1,
0.2547103, -0.7739958, 3.230196, 0, 0.3921569, 1, 1,
0.2594244, 0.486422, 1.062623, 0, 0.3882353, 1, 1,
0.2596781, 0.3916218, 2.239322, 0, 0.3803922, 1, 1,
0.2611139, -0.9605836, 2.66381, 0, 0.3764706, 1, 1,
0.2675901, 0.9069032, 1.362856, 0, 0.3686275, 1, 1,
0.2721404, 0.5092974, 2.620051, 0, 0.3647059, 1, 1,
0.2811681, -0.6816353, 2.504293, 0, 0.3568628, 1, 1,
0.2900898, -1.344679, 3.844682, 0, 0.3529412, 1, 1,
0.2903594, 0.1270014, 1.960334, 0, 0.345098, 1, 1,
0.2906661, 1.64813, 1.52249, 0, 0.3411765, 1, 1,
0.2914104, -0.1249011, 1.401528, 0, 0.3333333, 1, 1,
0.2938963, -0.750735, 2.74402, 0, 0.3294118, 1, 1,
0.2995498, -0.2259266, 3.174028, 0, 0.3215686, 1, 1,
0.3002352, -0.9653016, 3.024835, 0, 0.3176471, 1, 1,
0.3009833, -0.01676269, 0.862048, 0, 0.3098039, 1, 1,
0.3070659, -0.6488904, 3.677542, 0, 0.3058824, 1, 1,
0.3088748, -0.9380007, 2.983272, 0, 0.2980392, 1, 1,
0.313007, -0.05676826, 2.390141, 0, 0.2901961, 1, 1,
0.3158542, -0.1289673, 1.809399, 0, 0.2862745, 1, 1,
0.3172688, -1.553267, 4.614556, 0, 0.2784314, 1, 1,
0.3223726, -0.1746038, 2.518391, 0, 0.2745098, 1, 1,
0.3265886, -0.9854284, 3.261068, 0, 0.2666667, 1, 1,
0.3321293, 0.9502749, 0.9916044, 0, 0.2627451, 1, 1,
0.3371909, -0.1464295, 1.930914, 0, 0.254902, 1, 1,
0.3398125, -0.4428988, 3.234428, 0, 0.2509804, 1, 1,
0.344721, 1.179168, 0.3892484, 0, 0.2431373, 1, 1,
0.349986, 0.9215335, -1.232105, 0, 0.2392157, 1, 1,
0.3502805, 0.6554963, 0.5762824, 0, 0.2313726, 1, 1,
0.3531567, -1.376827, 3.732479, 0, 0.227451, 1, 1,
0.3550622, 0.5112374, 0.6431097, 0, 0.2196078, 1, 1,
0.3634266, -0.2203338, 2.074264, 0, 0.2156863, 1, 1,
0.3642514, 1.07412, 0.6537649, 0, 0.2078431, 1, 1,
0.368376, -0.5142019, 2.028762, 0, 0.2039216, 1, 1,
0.3735574, 0.2688885, 2.278839, 0, 0.1960784, 1, 1,
0.3759955, 0.05202778, 2.469648, 0, 0.1882353, 1, 1,
0.3772387, 1.049279, 0.5061871, 0, 0.1843137, 1, 1,
0.3841001, -0.07851455, 0.2522011, 0, 0.1764706, 1, 1,
0.387546, 1.09959, 1.558639, 0, 0.172549, 1, 1,
0.3904856, -0.2158799, 1.907385, 0, 0.1647059, 1, 1,
0.3909286, -1.824332, 4.201781, 0, 0.1607843, 1, 1,
0.3931146, -0.2743026, 4.991524, 0, 0.1529412, 1, 1,
0.3933411, -1.105814, 3.06256, 0, 0.1490196, 1, 1,
0.3939076, 0.2839153, 0.2694898, 0, 0.1411765, 1, 1,
0.3955204, 0.07131717, 2.372892, 0, 0.1372549, 1, 1,
0.3960964, -0.3394193, 2.037786, 0, 0.1294118, 1, 1,
0.3965975, -0.8912436, 3.697125, 0, 0.1254902, 1, 1,
0.4094839, 1.212057, 0.5520862, 0, 0.1176471, 1, 1,
0.4107625, -1.023844, 3.083427, 0, 0.1137255, 1, 1,
0.4155256, 1.179339, 0.6591063, 0, 0.1058824, 1, 1,
0.4160618, -1.606768, 1.918296, 0, 0.09803922, 1, 1,
0.4164082, -1.042858, 3.334982, 0, 0.09411765, 1, 1,
0.4168731, 0.5982663, 0.5735798, 0, 0.08627451, 1, 1,
0.4169481, 0.1058853, 0.2151962, 0, 0.08235294, 1, 1,
0.4178746, -0.3611029, 4.206596, 0, 0.07450981, 1, 1,
0.4202526, 0.4018166, 0.6664664, 0, 0.07058824, 1, 1,
0.4217686, 0.637992, 0.5837641, 0, 0.0627451, 1, 1,
0.4222433, 0.1586439, 1.218976, 0, 0.05882353, 1, 1,
0.4259599, -0.2299892, 1.833571, 0, 0.05098039, 1, 1,
0.4275872, -0.5142428, 2.765705, 0, 0.04705882, 1, 1,
0.4315872, -2.680139, 2.423476, 0, 0.03921569, 1, 1,
0.4346299, -0.09455238, 1.998855, 0, 0.03529412, 1, 1,
0.4360898, -1.254803, 0.921725, 0, 0.02745098, 1, 1,
0.438959, -2.402136, 4.118986, 0, 0.02352941, 1, 1,
0.4410085, -0.8194289, 2.876507, 0, 0.01568628, 1, 1,
0.4419473, 1.169461, 0.9157867, 0, 0.01176471, 1, 1,
0.4422734, 0.04277023, 0.6554598, 0, 0.003921569, 1, 1,
0.442445, -0.378998, 1.51198, 0.003921569, 0, 1, 1,
0.4506519, 0.2337265, 1.640534, 0.007843138, 0, 1, 1,
0.4506848, -0.2107343, 1.863759, 0.01568628, 0, 1, 1,
0.4519742, -0.7729544, 0.7327069, 0.01960784, 0, 1, 1,
0.4531595, 0.4854172, 1.011987, 0.02745098, 0, 1, 1,
0.4542568, -1.003453, 2.242507, 0.03137255, 0, 1, 1,
0.4556539, 0.3698866, 0.6203964, 0.03921569, 0, 1, 1,
0.4569058, -0.169438, 1.994504, 0.04313726, 0, 1, 1,
0.4576124, 1.715355, -3.694191, 0.05098039, 0, 1, 1,
0.4591922, 2.071326, -1.147722, 0.05490196, 0, 1, 1,
0.4669202, 2.040876, 1.180582, 0.0627451, 0, 1, 1,
0.4808358, -1.082611, 3.261601, 0.06666667, 0, 1, 1,
0.481216, 1.990818, 0.05972538, 0.07450981, 0, 1, 1,
0.4815295, -0.2251362, 1.092687, 0.07843138, 0, 1, 1,
0.4938512, -0.912547, 1.717221, 0.08627451, 0, 1, 1,
0.4977491, 1.423055, 1.892034, 0.09019608, 0, 1, 1,
0.5052962, 0.9443439, 0.9798805, 0.09803922, 0, 1, 1,
0.5096908, 0.01993582, 1.492179, 0.1058824, 0, 1, 1,
0.5115443, 0.1732811, 3.902533, 0.1098039, 0, 1, 1,
0.5127801, -0.08208901, 1.453556, 0.1176471, 0, 1, 1,
0.512942, 0.02907738, 0.8816516, 0.1215686, 0, 1, 1,
0.5144318, 1.188729, -1.402755, 0.1294118, 0, 1, 1,
0.5147821, 2.267968, -1.342046, 0.1333333, 0, 1, 1,
0.5229526, -0.5009943, 2.342078, 0.1411765, 0, 1, 1,
0.5275744, -0.5047938, 2.079005, 0.145098, 0, 1, 1,
0.5296172, 1.155721, 2.523296, 0.1529412, 0, 1, 1,
0.5313786, 0.5968679, 0.9294207, 0.1568628, 0, 1, 1,
0.531652, 1.519767, -0.8321392, 0.1647059, 0, 1, 1,
0.5337325, 1.202433, 1.626569, 0.1686275, 0, 1, 1,
0.5351828, -1.921391, 3.959646, 0.1764706, 0, 1, 1,
0.5366788, 1.826234, 0.4121459, 0.1803922, 0, 1, 1,
0.5379744, -0.5355427, 3.401281, 0.1882353, 0, 1, 1,
0.5388238, 1.733837, -0.2868234, 0.1921569, 0, 1, 1,
0.5413614, -0.182064, 3.515071, 0.2, 0, 1, 1,
0.5420072, -1.754879, 4.744637, 0.2078431, 0, 1, 1,
0.5441864, 0.5385287, 0.9756874, 0.2117647, 0, 1, 1,
0.5453827, 0.0610941, 3.082785, 0.2196078, 0, 1, 1,
0.5556881, -0.5231989, 1.515282, 0.2235294, 0, 1, 1,
0.5559563, -1.931874, 3.496297, 0.2313726, 0, 1, 1,
0.5564927, -0.1234335, 2.865011, 0.2352941, 0, 1, 1,
0.5573865, -1.120891, 3.437561, 0.2431373, 0, 1, 1,
0.5652704, -0.5103192, 1.816324, 0.2470588, 0, 1, 1,
0.5748642, 0.9637803, 1.222975, 0.254902, 0, 1, 1,
0.5765285, -2.423228, 3.839759, 0.2588235, 0, 1, 1,
0.5777181, -0.6101655, 1.042936, 0.2666667, 0, 1, 1,
0.5800965, -1.060226, 1.026136, 0.2705882, 0, 1, 1,
0.5820028, -0.8107924, 1.555503, 0.2784314, 0, 1, 1,
0.5840217, -1.376857, 2.408175, 0.282353, 0, 1, 1,
0.5843759, -0.1555071, 1.907655, 0.2901961, 0, 1, 1,
0.5857839, 0.6439741, 0.1916752, 0.2941177, 0, 1, 1,
0.5897155, 0.109391, 0.3141599, 0.3019608, 0, 1, 1,
0.5917345, 0.748952, -1.701591, 0.3098039, 0, 1, 1,
0.5943239, -1.135092, 4.309151, 0.3137255, 0, 1, 1,
0.5966333, 0.858546, 1.651887, 0.3215686, 0, 1, 1,
0.5988365, 1.2711, -1.443253, 0.3254902, 0, 1, 1,
0.5997455, -0.3908941, 2.447138, 0.3333333, 0, 1, 1,
0.6010711, 1.664725, -0.4770069, 0.3372549, 0, 1, 1,
0.6020191, 0.8803983, -0.2662153, 0.345098, 0, 1, 1,
0.6033321, -0.1175969, 0.9114982, 0.3490196, 0, 1, 1,
0.6039088, -0.1152854, 1.406099, 0.3568628, 0, 1, 1,
0.6044508, 0.1444307, 2.327932, 0.3607843, 0, 1, 1,
0.6102811, 0.1222566, 0.9810522, 0.3686275, 0, 1, 1,
0.6157703, -0.3340972, 4.245158, 0.372549, 0, 1, 1,
0.6169634, 0.9179893, -0.6701695, 0.3803922, 0, 1, 1,
0.6203845, 0.5622224, 0.9200692, 0.3843137, 0, 1, 1,
0.6218362, -0.8876276, 1.392613, 0.3921569, 0, 1, 1,
0.6240741, -1.290024, 2.54495, 0.3960784, 0, 1, 1,
0.6300493, -0.9068912, 3.068694, 0.4039216, 0, 1, 1,
0.6304371, 2.066732, 1.601404, 0.4117647, 0, 1, 1,
0.6493463, 1.832296, -0.6894654, 0.4156863, 0, 1, 1,
0.6532944, -1.088997, 2.327969, 0.4235294, 0, 1, 1,
0.6572399, -0.115931, 1.706346, 0.427451, 0, 1, 1,
0.6582889, -0.03255549, 1.735804, 0.4352941, 0, 1, 1,
0.660226, 0.9603946, 0.1699868, 0.4392157, 0, 1, 1,
0.660804, 1.501535, -0.3981409, 0.4470588, 0, 1, 1,
0.6647982, 2.653645, 0.1697476, 0.4509804, 0, 1, 1,
0.6660618, 2.002855, 1.297435, 0.4588235, 0, 1, 1,
0.6681915, 0.8266939, 2.006762, 0.4627451, 0, 1, 1,
0.6695818, 0.7369016, 0.3846767, 0.4705882, 0, 1, 1,
0.6713547, -1.02041, 3.509521, 0.4745098, 0, 1, 1,
0.6726574, -0.6507376, 2.126718, 0.4823529, 0, 1, 1,
0.6775156, -0.006547245, 1.544455, 0.4862745, 0, 1, 1,
0.6789714, -0.1287891, 0.2014731, 0.4941176, 0, 1, 1,
0.682984, -0.8819395, 2.560571, 0.5019608, 0, 1, 1,
0.6850861, -0.4949688, 3.353454, 0.5058824, 0, 1, 1,
0.6890497, 1.537531, -0.255195, 0.5137255, 0, 1, 1,
0.6907668, 1.229564, -1.203044, 0.5176471, 0, 1, 1,
0.6927984, -0.9236165, 4.0312, 0.5254902, 0, 1, 1,
0.694361, 1.202226, -0.2752577, 0.5294118, 0, 1, 1,
0.6963001, 0.2291053, 3.550785, 0.5372549, 0, 1, 1,
0.6988683, -2.350102, 2.794199, 0.5411765, 0, 1, 1,
0.7002034, 0.2190392, 0.9688093, 0.5490196, 0, 1, 1,
0.7041333, 0.1941293, 1.943103, 0.5529412, 0, 1, 1,
0.7054329, -0.09148546, 1.596927, 0.5607843, 0, 1, 1,
0.7072513, -0.2835635, 2.596889, 0.5647059, 0, 1, 1,
0.7112195, -0.6533939, 3.847798, 0.572549, 0, 1, 1,
0.7114581, 0.1683518, 1.418842, 0.5764706, 0, 1, 1,
0.7137313, 0.01266434, 1.826526, 0.5843138, 0, 1, 1,
0.7146876, -1.375256, 3.271897, 0.5882353, 0, 1, 1,
0.7159561, -0.04769882, 2.091352, 0.5960785, 0, 1, 1,
0.7177792, -0.2769839, 2.997423, 0.6039216, 0, 1, 1,
0.7184773, 0.695439, 0.885881, 0.6078432, 0, 1, 1,
0.7255526, 0.5200563, 2.230006, 0.6156863, 0, 1, 1,
0.7284408, 0.6449754, 1.810179, 0.6196079, 0, 1, 1,
0.7300639, -1.277979, 3.500191, 0.627451, 0, 1, 1,
0.734451, -1.535509, 4.050093, 0.6313726, 0, 1, 1,
0.7346157, -0.4213836, 3.867594, 0.6392157, 0, 1, 1,
0.7350333, -1.29094, 4.320201, 0.6431373, 0, 1, 1,
0.7356762, -0.6826044, 1.685176, 0.6509804, 0, 1, 1,
0.7356915, 0.7385682, 1.290635, 0.654902, 0, 1, 1,
0.7431145, -0.2217536, 2.210624, 0.6627451, 0, 1, 1,
0.745414, 0.7238557, -0.1169636, 0.6666667, 0, 1, 1,
0.7480804, -1.133683, 3.004324, 0.6745098, 0, 1, 1,
0.7497039, 0.5212085, 0.7901091, 0.6784314, 0, 1, 1,
0.7516695, 0.144326, -0.005448525, 0.6862745, 0, 1, 1,
0.7555239, 0.7927675, -0.541737, 0.6901961, 0, 1, 1,
0.7578594, 0.5926143, -0.1153014, 0.6980392, 0, 1, 1,
0.7634797, 1.047615, 1.664919, 0.7058824, 0, 1, 1,
0.7644485, -1.138027, 0.6861105, 0.7098039, 0, 1, 1,
0.7658942, -0.3748634, 3.16542, 0.7176471, 0, 1, 1,
0.7735575, -0.1755752, 1.4326, 0.7215686, 0, 1, 1,
0.7793441, 1.739093, 1.061847, 0.7294118, 0, 1, 1,
0.7814889, 0.7051835, 0.9183668, 0.7333333, 0, 1, 1,
0.7824023, -0.3269001, 2.579622, 0.7411765, 0, 1, 1,
0.7849439, -2.09998, 2.26178, 0.7450981, 0, 1, 1,
0.7864801, -1.042866, 1.040544, 0.7529412, 0, 1, 1,
0.7877089, -0.1921099, 2.789275, 0.7568628, 0, 1, 1,
0.7965307, 1.487067, 0.8298398, 0.7647059, 0, 1, 1,
0.7971532, -1.285296, 1.83791, 0.7686275, 0, 1, 1,
0.8051578, 0.5074452, 0.8226153, 0.7764706, 0, 1, 1,
0.8053574, 0.5786502, -0.3637362, 0.7803922, 0, 1, 1,
0.809122, 0.2168785, 2.848705, 0.7882353, 0, 1, 1,
0.8153496, -1.454127, 1.48352, 0.7921569, 0, 1, 1,
0.8185225, -0.2339549, 1.608131, 0.8, 0, 1, 1,
0.8243933, 0.5616265, 0.3766498, 0.8078431, 0, 1, 1,
0.8269849, -0.9402118, 3.861902, 0.8117647, 0, 1, 1,
0.8271784, 1.657925, 1.854361, 0.8196079, 0, 1, 1,
0.8281714, 0.5080525, 0.9863057, 0.8235294, 0, 1, 1,
0.8315096, -0.3245661, 1.287927, 0.8313726, 0, 1, 1,
0.8376885, 0.4579149, 1.125624, 0.8352941, 0, 1, 1,
0.8376931, -1.442248, 2.012744, 0.8431373, 0, 1, 1,
0.8412948, -0.5844464, 1.296925, 0.8470588, 0, 1, 1,
0.8436554, -2.089522, 1.538706, 0.854902, 0, 1, 1,
0.843979, -0.992743, 2.874653, 0.8588235, 0, 1, 1,
0.8458861, -0.1311129, -0.8937289, 0.8666667, 0, 1, 1,
0.8458959, -0.08892705, 1.755317, 0.8705882, 0, 1, 1,
0.8484159, -1.293176, 2.533062, 0.8784314, 0, 1, 1,
0.8554449, -0.8872533, 1.227971, 0.8823529, 0, 1, 1,
0.8583643, 0.2872361, 0.6520001, 0.8901961, 0, 1, 1,
0.859354, 0.3025063, 2.494431, 0.8941177, 0, 1, 1,
0.8613381, -0.9597762, 2.336462, 0.9019608, 0, 1, 1,
0.8637547, -0.3216672, 0.5924477, 0.9098039, 0, 1, 1,
0.8673929, 0.6200902, 0.8029605, 0.9137255, 0, 1, 1,
0.8908278, 0.06826042, 2.41305, 0.9215686, 0, 1, 1,
0.892305, 0.2849873, 2.430939, 0.9254902, 0, 1, 1,
0.8973259, 0.9338754, 1.962868, 0.9333333, 0, 1, 1,
0.8985367, -0.4767072, 1.853406, 0.9372549, 0, 1, 1,
0.9057242, -1.266709, 0.8975269, 0.945098, 0, 1, 1,
0.9066948, -0.3215332, 0.963263, 0.9490196, 0, 1, 1,
0.9075497, 0.9752162, -1.32207, 0.9568627, 0, 1, 1,
0.9105953, 1.545958, -0.4924622, 0.9607843, 0, 1, 1,
0.9132027, -1.702572, 1.978074, 0.9686275, 0, 1, 1,
0.9171917, 0.8519104, 0.4147661, 0.972549, 0, 1, 1,
0.9225023, 0.2591772, -0.483162, 0.9803922, 0, 1, 1,
0.9239508, -0.8252713, 3.125589, 0.9843137, 0, 1, 1,
0.9273387, 0.4357627, 1.507933, 0.9921569, 0, 1, 1,
0.9282852, -1.141879, 0.9231029, 0.9960784, 0, 1, 1,
0.9290286, -1.781185, 4.174628, 1, 0, 0.9960784, 1,
0.9306964, 0.3381964, 3.165977, 1, 0, 0.9882353, 1,
0.9404032, -0.9404998, 1.811681, 1, 0, 0.9843137, 1,
0.9419012, -0.47844, 3.153144, 1, 0, 0.9764706, 1,
0.9434528, -1.487082, 4.042341, 1, 0, 0.972549, 1,
0.9445841, -1.694166, 2.067824, 1, 0, 0.9647059, 1,
0.9474609, -0.352837, 2.886875, 1, 0, 0.9607843, 1,
0.9496073, -1.644638, 2.309066, 1, 0, 0.9529412, 1,
0.9545278, -1.150793, 1.649787, 1, 0, 0.9490196, 1,
0.956369, 0.6531683, 0.8709555, 1, 0, 0.9411765, 1,
0.9616823, -0.5701325, 3.750769, 1, 0, 0.9372549, 1,
0.9630253, 0.4115752, 1.296956, 1, 0, 0.9294118, 1,
0.9631391, -0.0529595, 1.065099, 1, 0, 0.9254902, 1,
0.967265, -0.6292365, 2.588909, 1, 0, 0.9176471, 1,
0.9710873, 0.266019, 3.08603, 1, 0, 0.9137255, 1,
0.9716197, -1.858884, 4.547873, 1, 0, 0.9058824, 1,
0.9759114, 0.06311527, 1.846937, 1, 0, 0.9019608, 1,
0.9812499, 0.01807301, 0.9539791, 1, 0, 0.8941177, 1,
0.9835218, 2.060224, -0.1621969, 1, 0, 0.8862745, 1,
0.9851658, -0.7146254, 3.707894, 1, 0, 0.8823529, 1,
0.9851903, -1.20965, 3.431834, 1, 0, 0.8745098, 1,
0.9915318, -0.209201, 1.712781, 1, 0, 0.8705882, 1,
0.9938942, 2.057764, 0.4227096, 1, 0, 0.8627451, 1,
0.9966671, 0.1477054, 0.08188337, 1, 0, 0.8588235, 1,
0.9982604, 1.309489, 2.041701, 1, 0, 0.8509804, 1,
1.002293, 0.7889043, 1.047396, 1, 0, 0.8470588, 1,
1.003089, -0.9314914, 1.784213, 1, 0, 0.8392157, 1,
1.007365, 0.4996758, 2.085413, 1, 0, 0.8352941, 1,
1.010799, -0.3587925, 3.478746, 1, 0, 0.827451, 1,
1.011425, 0.6691068, 1.028843, 1, 0, 0.8235294, 1,
1.013083, 1.601056, 0.05688866, 1, 0, 0.8156863, 1,
1.018195, 0.4135052, 0.8851171, 1, 0, 0.8117647, 1,
1.026936, -0.08179956, 2.923573, 1, 0, 0.8039216, 1,
1.030163, 1.510188, -0.2468798, 1, 0, 0.7960784, 1,
1.040776, -2.439333, 2.996236, 1, 0, 0.7921569, 1,
1.048635, -0.2522776, 1.771662, 1, 0, 0.7843137, 1,
1.052313, -1.441113, 1.972158, 1, 0, 0.7803922, 1,
1.056997, 0.5013496, 0.6304486, 1, 0, 0.772549, 1,
1.06051, 0.9201195, 0.3386431, 1, 0, 0.7686275, 1,
1.063817, -0.060144, 1.450095, 1, 0, 0.7607843, 1,
1.064, 0.9936928, -0.4095088, 1, 0, 0.7568628, 1,
1.064066, -0.8425021, 2.584351, 1, 0, 0.7490196, 1,
1.065219, 0.700871, -0.1682343, 1, 0, 0.7450981, 1,
1.071076, -0.5205415, 1.766901, 1, 0, 0.7372549, 1,
1.073458, -0.4684281, 2.306092, 1, 0, 0.7333333, 1,
1.075652, 0.9352244, 2.644654, 1, 0, 0.7254902, 1,
1.083504, 0.3892525, 1.472527, 1, 0, 0.7215686, 1,
1.088242, 0.07788347, 0.0905832, 1, 0, 0.7137255, 1,
1.088769, 0.8762665, 1.696616, 1, 0, 0.7098039, 1,
1.090199, -2.749653, 2.764508, 1, 0, 0.7019608, 1,
1.105631, 1.399763, -0.0292422, 1, 0, 0.6941177, 1,
1.105763, 0.3158824, -0.8541911, 1, 0, 0.6901961, 1,
1.107753, 0.9509506, 1.056537, 1, 0, 0.682353, 1,
1.112072, 0.2892368, 1.059186, 1, 0, 0.6784314, 1,
1.112225, -1.084328, 1.789103, 1, 0, 0.6705883, 1,
1.116214, 0.1773082, 1.289079, 1, 0, 0.6666667, 1,
1.121801, -0.3079557, 2.256592, 1, 0, 0.6588235, 1,
1.126368, -0.3746871, 1.966599, 1, 0, 0.654902, 1,
1.134105, 0.6490798, 2.584834, 1, 0, 0.6470588, 1,
1.154562, -1.360375, 1.341842, 1, 0, 0.6431373, 1,
1.15495, -0.9958104, 1.323308, 1, 0, 0.6352941, 1,
1.157185, -1.306036, 2.940454, 1, 0, 0.6313726, 1,
1.158199, 0.4834669, 0.7024427, 1, 0, 0.6235294, 1,
1.167505, 0.8243508, 0.5605842, 1, 0, 0.6196079, 1,
1.177619, -2.634351, 1.547494, 1, 0, 0.6117647, 1,
1.17784, -1.653756, 1.656946, 1, 0, 0.6078432, 1,
1.186137, -0.5806301, 2.335766, 1, 0, 0.6, 1,
1.186156, 0.3586066, 0.8423795, 1, 0, 0.5921569, 1,
1.189661, 1.19554, -0.3083065, 1, 0, 0.5882353, 1,
1.197086, 1.238996, 0.4858199, 1, 0, 0.5803922, 1,
1.20309, 1.546872, 1.244505, 1, 0, 0.5764706, 1,
1.206626, -0.5179102, 2.560107, 1, 0, 0.5686275, 1,
1.253916, 1.266644, 0.05623818, 1, 0, 0.5647059, 1,
1.26383, 0.191947, 1.225381, 1, 0, 0.5568628, 1,
1.265, -0.5855306, 3.000895, 1, 0, 0.5529412, 1,
1.271147, -0.7902223, 3.668382, 1, 0, 0.5450981, 1,
1.276657, -0.2199196, 1.934424, 1, 0, 0.5411765, 1,
1.290334, 1.232732, 0.7706158, 1, 0, 0.5333334, 1,
1.298189, -0.9527786, 2.570426, 1, 0, 0.5294118, 1,
1.301304, -1.058719, 1.979653, 1, 0, 0.5215687, 1,
1.307766, -0.7568763, 1.97235, 1, 0, 0.5176471, 1,
1.319913, -0.8534426, 2.710039, 1, 0, 0.509804, 1,
1.324795, -1.264095, 3.369575, 1, 0, 0.5058824, 1,
1.326262, -0.5087687, 1.762364, 1, 0, 0.4980392, 1,
1.338787, 0.595679, 2.997994, 1, 0, 0.4901961, 1,
1.339184, -1.197248, 3.735554, 1, 0, 0.4862745, 1,
1.365396, -0.2561692, 1.868914, 1, 0, 0.4784314, 1,
1.367507, -2.064318, 3.995615, 1, 0, 0.4745098, 1,
1.385502, -0.6943619, 3.577778, 1, 0, 0.4666667, 1,
1.387325, -1.136325, 2.0697, 1, 0, 0.4627451, 1,
1.387821, 1.26399, 1.049366, 1, 0, 0.454902, 1,
1.393705, 0.9443509, -0.05804825, 1, 0, 0.4509804, 1,
1.401368, -0.08607817, 2.779226, 1, 0, 0.4431373, 1,
1.403239, 0.356243, 1.519917, 1, 0, 0.4392157, 1,
1.407842, 0.3336535, 2.263421, 1, 0, 0.4313726, 1,
1.408866, -0.04673729, 2.834307, 1, 0, 0.427451, 1,
1.416107, 0.1284294, 0.8951493, 1, 0, 0.4196078, 1,
1.448072, -1.348748, 2.787784, 1, 0, 0.4156863, 1,
1.456283, -1.36603, 1.735805, 1, 0, 0.4078431, 1,
1.466112, -1.527699, 2.390563, 1, 0, 0.4039216, 1,
1.470469, -1.185117, 0.6773931, 1, 0, 0.3960784, 1,
1.471305, 0.05402882, 1.387814, 1, 0, 0.3882353, 1,
1.48488, -0.3334718, 0.6200379, 1, 0, 0.3843137, 1,
1.485639, 0.5023116, 0.5341495, 1, 0, 0.3764706, 1,
1.510381, 0.8395781, 0.4025889, 1, 0, 0.372549, 1,
1.514103, -1.131622, 3.698693, 1, 0, 0.3647059, 1,
1.522352, -0.1869777, 2.027426, 1, 0, 0.3607843, 1,
1.524918, -0.5480629, 3.885221, 1, 0, 0.3529412, 1,
1.531243, 1.717699, 1.831012, 1, 0, 0.3490196, 1,
1.531669, -0.112085, 2.448407, 1, 0, 0.3411765, 1,
1.536624, -0.6364011, 0.5741298, 1, 0, 0.3372549, 1,
1.537061, -1.22013, 2.940059, 1, 0, 0.3294118, 1,
1.553081, 0.6401983, 1.930555, 1, 0, 0.3254902, 1,
1.557127, -0.3902299, 1.625572, 1, 0, 0.3176471, 1,
1.557866, -0.05453888, 1.708804, 1, 0, 0.3137255, 1,
1.581354, 0.5034829, 1.084858, 1, 0, 0.3058824, 1,
1.584028, 2.02587, 0.4620841, 1, 0, 0.2980392, 1,
1.593477, 0.2979668, 1.599676, 1, 0, 0.2941177, 1,
1.595959, 1.661298, 0.6111312, 1, 0, 0.2862745, 1,
1.599554, 0.642133, 0.2343272, 1, 0, 0.282353, 1,
1.600042, 0.4245218, 2.436316, 1, 0, 0.2745098, 1,
1.607939, 1.854698, -0.1403747, 1, 0, 0.2705882, 1,
1.609107, 1.094076, 0.09655053, 1, 0, 0.2627451, 1,
1.612771, 1.19872, 1.401821, 1, 0, 0.2588235, 1,
1.613225, -1.090573, 2.555901, 1, 0, 0.2509804, 1,
1.633435, 0.7611797, 2.877017, 1, 0, 0.2470588, 1,
1.646417, 1.313169, 2.795066, 1, 0, 0.2392157, 1,
1.654073, -0.3142462, 0.9550263, 1, 0, 0.2352941, 1,
1.663159, 0.4989884, 1.916925, 1, 0, 0.227451, 1,
1.679305, 0.1270668, 2.366645, 1, 0, 0.2235294, 1,
1.6846, -0.6142739, 2.998522, 1, 0, 0.2156863, 1,
1.703435, 1.522294, 0.8470827, 1, 0, 0.2117647, 1,
1.715726, 0.2720246, 1.495596, 1, 0, 0.2039216, 1,
1.719806, -1.039663, 1.669375, 1, 0, 0.1960784, 1,
1.720799, 0.7974727, -0.1076436, 1, 0, 0.1921569, 1,
1.727611, -1.016515, 2.458994, 1, 0, 0.1843137, 1,
1.747709, 1.470412, 0.5364223, 1, 0, 0.1803922, 1,
1.773583, -0.4372683, 1.936882, 1, 0, 0.172549, 1,
1.806489, -0.208455, 0.4108249, 1, 0, 0.1686275, 1,
1.807739, -1.311399, 1.248806, 1, 0, 0.1607843, 1,
1.821814, 2.190948, 0.07780122, 1, 0, 0.1568628, 1,
1.854666, 0.63572, 1.264964, 1, 0, 0.1490196, 1,
1.892516, 0.3167145, 0.04312155, 1, 0, 0.145098, 1,
1.897746, -0.4511152, 1.521924, 1, 0, 0.1372549, 1,
1.900955, 1.563412, 0.1183108, 1, 0, 0.1333333, 1,
1.905622, -0.6019691, 1.49338, 1, 0, 0.1254902, 1,
1.9402, -0.03201339, 1.971849, 1, 0, 0.1215686, 1,
1.954189, 2.402336, -0.6079867, 1, 0, 0.1137255, 1,
1.967029, 0.6361685, 0.4237719, 1, 0, 0.1098039, 1,
1.970309, -0.00601743, 0.8158882, 1, 0, 0.1019608, 1,
1.981391, 0.5025586, 1.609271, 1, 0, 0.09411765, 1,
1.996639, 0.7439456, -0.07164852, 1, 0, 0.09019608, 1,
2.021404, 0.02438296, 1.857296, 1, 0, 0.08235294, 1,
2.047395, 0.5437913, 0.4547929, 1, 0, 0.07843138, 1,
2.111252, 0.8282968, 1.595301, 1, 0, 0.07058824, 1,
2.125433, 1.997387, 1.95812, 1, 0, 0.06666667, 1,
2.151204, -1.880078, 1.294293, 1, 0, 0.05882353, 1,
2.202237, 1.954318, 0.3229662, 1, 0, 0.05490196, 1,
2.271623, 2.095611, 0.7776695, 1, 0, 0.04705882, 1,
2.414404, -1.656898, 2.601468, 1, 0, 0.04313726, 1,
2.421456, -1.065759, 1.7182, 1, 0, 0.03529412, 1,
2.492849, -0.5422705, 2.588753, 1, 0, 0.03137255, 1,
2.728203, -0.7200579, 0.6997242, 1, 0, 0.02352941, 1,
2.912643, -0.7140216, 1.953732, 1, 0, 0.01960784, 1,
3.056753, 0.03262466, 1.800094, 1, 0, 0.01176471, 1,
3.104702, -0.4169487, 3.505128, 1, 0, 0.007843138, 1
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
-0.09970379, -4.647758, -7.003035, 0, -0.5, 0.5, 0.5,
-0.09970379, -4.647758, -7.003035, 1, -0.5, 0.5, 0.5,
-0.09970379, -4.647758, -7.003035, 1, 1.5, 0.5, 0.5,
-0.09970379, -4.647758, -7.003035, 0, 1.5, 0.5, 0.5
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
-4.390403, -0.2882874, -7.003035, 0, -0.5, 0.5, 0.5,
-4.390403, -0.2882874, -7.003035, 1, -0.5, 0.5, 0.5,
-4.390403, -0.2882874, -7.003035, 1, 1.5, 0.5, 0.5,
-4.390403, -0.2882874, -7.003035, 0, 1.5, 0.5, 0.5
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
-4.390403, -4.647758, -0.05394816, 0, -0.5, 0.5, 0.5,
-4.390403, -4.647758, -0.05394816, 1, -0.5, 0.5, 0.5,
-4.390403, -4.647758, -0.05394816, 1, 1.5, 0.5, 0.5,
-4.390403, -4.647758, -0.05394816, 0, 1.5, 0.5, 0.5
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
-3, -3.641726, -5.399399,
3, -3.641726, -5.399399,
-3, -3.641726, -5.399399,
-3, -3.809398, -5.666672,
-2, -3.641726, -5.399399,
-2, -3.809398, -5.666672,
-1, -3.641726, -5.399399,
-1, -3.809398, -5.666672,
0, -3.641726, -5.399399,
0, -3.809398, -5.666672,
1, -3.641726, -5.399399,
1, -3.809398, -5.666672,
2, -3.641726, -5.399399,
2, -3.809398, -5.666672,
3, -3.641726, -5.399399,
3, -3.809398, -5.666672
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
-3, -4.144742, -6.201217, 0, -0.5, 0.5, 0.5,
-3, -4.144742, -6.201217, 1, -0.5, 0.5, 0.5,
-3, -4.144742, -6.201217, 1, 1.5, 0.5, 0.5,
-3, -4.144742, -6.201217, 0, 1.5, 0.5, 0.5,
-2, -4.144742, -6.201217, 0, -0.5, 0.5, 0.5,
-2, -4.144742, -6.201217, 1, -0.5, 0.5, 0.5,
-2, -4.144742, -6.201217, 1, 1.5, 0.5, 0.5,
-2, -4.144742, -6.201217, 0, 1.5, 0.5, 0.5,
-1, -4.144742, -6.201217, 0, -0.5, 0.5, 0.5,
-1, -4.144742, -6.201217, 1, -0.5, 0.5, 0.5,
-1, -4.144742, -6.201217, 1, 1.5, 0.5, 0.5,
-1, -4.144742, -6.201217, 0, 1.5, 0.5, 0.5,
0, -4.144742, -6.201217, 0, -0.5, 0.5, 0.5,
0, -4.144742, -6.201217, 1, -0.5, 0.5, 0.5,
0, -4.144742, -6.201217, 1, 1.5, 0.5, 0.5,
0, -4.144742, -6.201217, 0, 1.5, 0.5, 0.5,
1, -4.144742, -6.201217, 0, -0.5, 0.5, 0.5,
1, -4.144742, -6.201217, 1, -0.5, 0.5, 0.5,
1, -4.144742, -6.201217, 1, 1.5, 0.5, 0.5,
1, -4.144742, -6.201217, 0, 1.5, 0.5, 0.5,
2, -4.144742, -6.201217, 0, -0.5, 0.5, 0.5,
2, -4.144742, -6.201217, 1, -0.5, 0.5, 0.5,
2, -4.144742, -6.201217, 1, 1.5, 0.5, 0.5,
2, -4.144742, -6.201217, 0, 1.5, 0.5, 0.5,
3, -4.144742, -6.201217, 0, -0.5, 0.5, 0.5,
3, -4.144742, -6.201217, 1, -0.5, 0.5, 0.5,
3, -4.144742, -6.201217, 1, 1.5, 0.5, 0.5,
3, -4.144742, -6.201217, 0, 1.5, 0.5, 0.5
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
-3.400242, -3, -5.399399,
-3.400242, 2, -5.399399,
-3.400242, -3, -5.399399,
-3.565269, -3, -5.666672,
-3.400242, -2, -5.399399,
-3.565269, -2, -5.666672,
-3.400242, -1, -5.399399,
-3.565269, -1, -5.666672,
-3.400242, 0, -5.399399,
-3.565269, 0, -5.666672,
-3.400242, 1, -5.399399,
-3.565269, 1, -5.666672,
-3.400242, 2, -5.399399,
-3.565269, 2, -5.666672
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
-3.895322, -3, -6.201217, 0, -0.5, 0.5, 0.5,
-3.895322, -3, -6.201217, 1, -0.5, 0.5, 0.5,
-3.895322, -3, -6.201217, 1, 1.5, 0.5, 0.5,
-3.895322, -3, -6.201217, 0, 1.5, 0.5, 0.5,
-3.895322, -2, -6.201217, 0, -0.5, 0.5, 0.5,
-3.895322, -2, -6.201217, 1, -0.5, 0.5, 0.5,
-3.895322, -2, -6.201217, 1, 1.5, 0.5, 0.5,
-3.895322, -2, -6.201217, 0, 1.5, 0.5, 0.5,
-3.895322, -1, -6.201217, 0, -0.5, 0.5, 0.5,
-3.895322, -1, -6.201217, 1, -0.5, 0.5, 0.5,
-3.895322, -1, -6.201217, 1, 1.5, 0.5, 0.5,
-3.895322, -1, -6.201217, 0, 1.5, 0.5, 0.5,
-3.895322, 0, -6.201217, 0, -0.5, 0.5, 0.5,
-3.895322, 0, -6.201217, 1, -0.5, 0.5, 0.5,
-3.895322, 0, -6.201217, 1, 1.5, 0.5, 0.5,
-3.895322, 0, -6.201217, 0, 1.5, 0.5, 0.5,
-3.895322, 1, -6.201217, 0, -0.5, 0.5, 0.5,
-3.895322, 1, -6.201217, 1, -0.5, 0.5, 0.5,
-3.895322, 1, -6.201217, 1, 1.5, 0.5, 0.5,
-3.895322, 1, -6.201217, 0, 1.5, 0.5, 0.5,
-3.895322, 2, -6.201217, 0, -0.5, 0.5, 0.5,
-3.895322, 2, -6.201217, 1, -0.5, 0.5, 0.5,
-3.895322, 2, -6.201217, 1, 1.5, 0.5, 0.5,
-3.895322, 2, -6.201217, 0, 1.5, 0.5, 0.5
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
-3.400242, -3.641726, -4,
-3.400242, -3.641726, 4,
-3.400242, -3.641726, -4,
-3.565269, -3.809398, -4,
-3.400242, -3.641726, -2,
-3.565269, -3.809398, -2,
-3.400242, -3.641726, 0,
-3.565269, -3.809398, 0,
-3.400242, -3.641726, 2,
-3.565269, -3.809398, 2,
-3.400242, -3.641726, 4,
-3.565269, -3.809398, 4
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
-3.895322, -4.144742, -4, 0, -0.5, 0.5, 0.5,
-3.895322, -4.144742, -4, 1, -0.5, 0.5, 0.5,
-3.895322, -4.144742, -4, 1, 1.5, 0.5, 0.5,
-3.895322, -4.144742, -4, 0, 1.5, 0.5, 0.5,
-3.895322, -4.144742, -2, 0, -0.5, 0.5, 0.5,
-3.895322, -4.144742, -2, 1, -0.5, 0.5, 0.5,
-3.895322, -4.144742, -2, 1, 1.5, 0.5, 0.5,
-3.895322, -4.144742, -2, 0, 1.5, 0.5, 0.5,
-3.895322, -4.144742, 0, 0, -0.5, 0.5, 0.5,
-3.895322, -4.144742, 0, 1, -0.5, 0.5, 0.5,
-3.895322, -4.144742, 0, 1, 1.5, 0.5, 0.5,
-3.895322, -4.144742, 0, 0, 1.5, 0.5, 0.5,
-3.895322, -4.144742, 2, 0, -0.5, 0.5, 0.5,
-3.895322, -4.144742, 2, 1, -0.5, 0.5, 0.5,
-3.895322, -4.144742, 2, 1, 1.5, 0.5, 0.5,
-3.895322, -4.144742, 2, 0, 1.5, 0.5, 0.5,
-3.895322, -4.144742, 4, 0, -0.5, 0.5, 0.5,
-3.895322, -4.144742, 4, 1, -0.5, 0.5, 0.5,
-3.895322, -4.144742, 4, 1, 1.5, 0.5, 0.5,
-3.895322, -4.144742, 4, 0, 1.5, 0.5, 0.5
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
-3.400242, -3.641726, -5.399399,
-3.400242, 3.065152, -5.399399,
-3.400242, -3.641726, 5.291503,
-3.400242, 3.065152, 5.291503,
-3.400242, -3.641726, -5.399399,
-3.400242, -3.641726, 5.291503,
-3.400242, 3.065152, -5.399399,
-3.400242, 3.065152, 5.291503,
-3.400242, -3.641726, -5.399399,
3.200834, -3.641726, -5.399399,
-3.400242, -3.641726, 5.291503,
3.200834, -3.641726, 5.291503,
-3.400242, 3.065152, -5.399399,
3.200834, 3.065152, -5.399399,
-3.400242, 3.065152, 5.291503,
3.200834, 3.065152, 5.291503,
3.200834, -3.641726, -5.399399,
3.200834, 3.065152, -5.399399,
3.200834, -3.641726, 5.291503,
3.200834, 3.065152, 5.291503,
3.200834, -3.641726, -5.399399,
3.200834, -3.641726, 5.291503,
3.200834, 3.065152, -5.399399,
3.200834, 3.065152, 5.291503
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
var radius = 7.605275;
var distance = 33.83673;
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
mvMatrix.translate( 0.09970379, 0.2882874, 0.05394816 );
mvMatrix.scale( 1.245702, 1.226051, 0.769156 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.83673);
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
DHA<-read.table("DHA.xyz")
```

```
## Error in read.table("DHA.xyz"): no lines available in input
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
-3.30411, -0.1003791, -1.860614, 0, 0, 1, 1, 1,
-3.138113, -1.619387, -0.8858114, 1, 0, 0, 1, 1,
-3.062667, 0.527886, -2.206613, 1, 0, 0, 1, 1,
-2.961215, 1.537104, -0.6026905, 1, 0, 0, 1, 1,
-2.952439, -1.193894, -2.716792, 1, 0, 0, 1, 1,
-2.836808, 0.4488494, -2.203128, 1, 0, 0, 1, 1,
-2.394702, -0.2834012, -1.19139, 0, 0, 0, 1, 1,
-2.36752, -0.1910892, -3.177504, 0, 0, 0, 1, 1,
-2.334376, 0.8838853, 0.5540947, 0, 0, 0, 1, 1,
-2.320508, -1.113074, -2.310328, 0, 0, 0, 1, 1,
-2.305404, -0.5434346, -2.439195, 0, 0, 0, 1, 1,
-2.214393, 0.2204542, -2.564674, 0, 0, 0, 1, 1,
-2.180437, 0.9569559, 0.1847864, 0, 0, 0, 1, 1,
-2.170617, 2.099946, -0.7527152, 1, 1, 1, 1, 1,
-2.053117, -0.5103527, -1.875016, 1, 1, 1, 1, 1,
-2.043295, 0.7606337, -2.615926, 1, 1, 1, 1, 1,
-2.023644, 0.4565535, -1.693812, 1, 1, 1, 1, 1,
-1.999972, 0.9119568, -2.736765, 1, 1, 1, 1, 1,
-1.995798, 0.5559043, -2.628301, 1, 1, 1, 1, 1,
-1.959388, -0.3048955, -2.688459, 1, 1, 1, 1, 1,
-1.940448, -0.593204, -2.815321, 1, 1, 1, 1, 1,
-1.929671, -0.3694708, -3.26791, 1, 1, 1, 1, 1,
-1.927013, -0.08357089, -2.556234, 1, 1, 1, 1, 1,
-1.917109, -0.6818545, -2.005849, 1, 1, 1, 1, 1,
-1.916063, 0.2671524, -2.273354, 1, 1, 1, 1, 1,
-1.910393, 0.3892775, -1.115064, 1, 1, 1, 1, 1,
-1.904495, -0.5214436, -1.578788, 1, 1, 1, 1, 1,
-1.89394, -0.7217806, -3.72483, 1, 1, 1, 1, 1,
-1.88045, -0.7777598, -1.082342, 0, 0, 1, 1, 1,
-1.877251, -0.121097, -3.416237, 1, 0, 0, 1, 1,
-1.862971, 0.6322056, -1.922332, 1, 0, 0, 1, 1,
-1.841197, 1.805987, -1.716056, 1, 0, 0, 1, 1,
-1.835548, -0.01741854, -2.559505, 1, 0, 0, 1, 1,
-1.815472, -1.456793, -3.389502, 1, 0, 0, 1, 1,
-1.771318, 0.1679213, -0.639029, 0, 0, 0, 1, 1,
-1.76717, 0.6021013, -2.484396, 0, 0, 0, 1, 1,
-1.728616, 0.2039123, -2.264917, 0, 0, 0, 1, 1,
-1.717071, -0.5295639, -2.486063, 0, 0, 0, 1, 1,
-1.716149, -0.2824785, -1.501721, 0, 0, 0, 1, 1,
-1.712463, -0.471662, -2.158581, 0, 0, 0, 1, 1,
-1.706366, 0.05354284, -2.574664, 0, 0, 0, 1, 1,
-1.664463, -0.424109, -0.5978586, 1, 1, 1, 1, 1,
-1.64617, -0.4984013, -2.033152, 1, 1, 1, 1, 1,
-1.643923, -0.3231623, -2.611273, 1, 1, 1, 1, 1,
-1.630119, 0.2569509, -0.9382774, 1, 1, 1, 1, 1,
-1.601715, 0.922444, -3.047985, 1, 1, 1, 1, 1,
-1.600728, -1.354896, -3.251759, 1, 1, 1, 1, 1,
-1.582038, -0.1567658, -1.21466, 1, 1, 1, 1, 1,
-1.574186, 0.3921669, -2.687377, 1, 1, 1, 1, 1,
-1.573212, -0.5336663, -3.277834, 1, 1, 1, 1, 1,
-1.569509, 0.5516133, -2.30835, 1, 1, 1, 1, 1,
-1.566527, -1.375406, -0.8403013, 1, 1, 1, 1, 1,
-1.560521, 0.3552971, -2.52807, 1, 1, 1, 1, 1,
-1.546344, -0.7658315, -1.763228, 1, 1, 1, 1, 1,
-1.543398, -0.8186499, -3.72589, 1, 1, 1, 1, 1,
-1.542281, -1.035678, -0.6466336, 1, 1, 1, 1, 1,
-1.535406, -0.3502776, -2.441348, 0, 0, 1, 1, 1,
-1.513048, 0.4830092, -1.823236, 1, 0, 0, 1, 1,
-1.511558, 0.1432763, -1.461347, 1, 0, 0, 1, 1,
-1.50199, -0.162815, -3.179302, 1, 0, 0, 1, 1,
-1.501547, 0.169304, -3.015949, 1, 0, 0, 1, 1,
-1.496095, -1.053625, -0.1514226, 1, 0, 0, 1, 1,
-1.476147, -1.670416, -1.913197, 0, 0, 0, 1, 1,
-1.451635, 2.043983, 0.6331667, 0, 0, 0, 1, 1,
-1.442048, 0.8560754, -0.9067459, 0, 0, 0, 1, 1,
-1.436431, 0.4614887, -0.8456719, 0, 0, 0, 1, 1,
-1.429278, 0.1256612, -0.4252577, 0, 0, 0, 1, 1,
-1.42902, -0.5123549, -1.473526, 0, 0, 0, 1, 1,
-1.423585, 0.6714262, -2.149538, 0, 0, 0, 1, 1,
-1.419318, -1.107414, -4.014361, 1, 1, 1, 1, 1,
-1.414476, 0.03616087, -2.632081, 1, 1, 1, 1, 1,
-1.402762, -0.5820967, -3.951687, 1, 1, 1, 1, 1,
-1.396425, -0.06866241, -1.698427, 1, 1, 1, 1, 1,
-1.395193, 0.9698569, -0.3074889, 1, 1, 1, 1, 1,
-1.392912, 0.9805291, -1.421448, 1, 1, 1, 1, 1,
-1.384528, -0.5143387, -2.814576, 1, 1, 1, 1, 1,
-1.382426, -0.4960168, -1.035355, 1, 1, 1, 1, 1,
-1.377726, 1.088459, -0.3838786, 1, 1, 1, 1, 1,
-1.373684, -0.9050678, -1.181604, 1, 1, 1, 1, 1,
-1.372568, -1.132275, -4.000213, 1, 1, 1, 1, 1,
-1.372227, 0.6764185, -1.139285, 1, 1, 1, 1, 1,
-1.365789, 0.6770355, 1.304804, 1, 1, 1, 1, 1,
-1.361705, 0.3867106, 0.8525087, 1, 1, 1, 1, 1,
-1.361659, 0.6660657, -0.3894884, 1, 1, 1, 1, 1,
-1.360895, 0.9079841, -0.2191539, 0, 0, 1, 1, 1,
-1.359212, 0.1477368, -1.667705, 1, 0, 0, 1, 1,
-1.35473, -0.4769855, -1.780915, 1, 0, 0, 1, 1,
-1.350694, -3.544054, -1.58417, 1, 0, 0, 1, 1,
-1.343673, -1.184344, -1.26696, 1, 0, 0, 1, 1,
-1.342633, 0.8785908, -0.9365482, 1, 0, 0, 1, 1,
-1.333357, -0.9431618, -3.204498, 0, 0, 0, 1, 1,
-1.328913, 0.3236949, -0.1332838, 0, 0, 0, 1, 1,
-1.314957, 0.5026318, -0.3991944, 0, 0, 0, 1, 1,
-1.310585, 1.844913, 1.611179, 0, 0, 0, 1, 1,
-1.309661, -1.120577, -2.793754, 0, 0, 0, 1, 1,
-1.300293, -1.57871, -2.143377, 0, 0, 0, 1, 1,
-1.292048, 1.292143, -0.3558509, 0, 0, 0, 1, 1,
-1.290762, 0.4545227, -0.9257923, 1, 1, 1, 1, 1,
-1.285493, 2.776024, 0.3074434, 1, 1, 1, 1, 1,
-1.279163, 1.472262, -0.9002914, 1, 1, 1, 1, 1,
-1.275103, -0.1429878, -2.735604, 1, 1, 1, 1, 1,
-1.270933, -0.03891767, -2.402777, 1, 1, 1, 1, 1,
-1.262156, -0.3323021, -0.399386, 1, 1, 1, 1, 1,
-1.25547, 0.5092334, -2.274826, 1, 1, 1, 1, 1,
-1.25098, -0.862859, -3.191798, 1, 1, 1, 1, 1,
-1.249356, 0.1468234, -2.848452, 1, 1, 1, 1, 1,
-1.247008, -0.01947249, -3.127096, 1, 1, 1, 1, 1,
-1.241646, 0.3703345, -1.702539, 1, 1, 1, 1, 1,
-1.241599, -0.3065995, -1.863417, 1, 1, 1, 1, 1,
-1.238758, 1.079776, -1.571908, 1, 1, 1, 1, 1,
-1.235781, -0.2965878, -3.159861, 1, 1, 1, 1, 1,
-1.234661, -0.3475253, -1.610705, 1, 1, 1, 1, 1,
-1.226141, -0.9194292, -1.973655, 0, 0, 1, 1, 1,
-1.224772, -0.6057753, -0.6490173, 1, 0, 0, 1, 1,
-1.212105, 0.6761209, 0.2882632, 1, 0, 0, 1, 1,
-1.208691, -1.723676, -1.39405, 1, 0, 0, 1, 1,
-1.207751, 1.759772, 0.9972578, 1, 0, 0, 1, 1,
-1.206582, 0.3735485, -1.426415, 1, 0, 0, 1, 1,
-1.180856, 1.577655, 0.256128, 0, 0, 0, 1, 1,
-1.168932, 2.622602, 2.117804, 0, 0, 0, 1, 1,
-1.165639, -0.3663135, -1.821861, 0, 0, 0, 1, 1,
-1.162286, 0.3489818, -1.486184, 0, 0, 0, 1, 1,
-1.157218, 1.276486, -2.254206, 0, 0, 0, 1, 1,
-1.156726, -1.195718, -3.673288, 0, 0, 0, 1, 1,
-1.155746, -1.812673, -3.198893, 0, 0, 0, 1, 1,
-1.149887, 0.1353942, -3.580442, 1, 1, 1, 1, 1,
-1.14498, -2.360405, -5.056472, 1, 1, 1, 1, 1,
-1.139009, 0.4986241, -0.9431185, 1, 1, 1, 1, 1,
-1.130166, -0.04335168, -0.7905703, 1, 1, 1, 1, 1,
-1.129049, -0.9471762, -1.609438, 1, 1, 1, 1, 1,
-1.12873, -0.04881902, -2.203336, 1, 1, 1, 1, 1,
-1.125008, -0.202477, -1.489497, 1, 1, 1, 1, 1,
-1.121708, -0.693473, -2.177425, 1, 1, 1, 1, 1,
-1.119338, 2.351852, -0.5517699, 1, 1, 1, 1, 1,
-1.115099, 1.471686, -0.02569822, 1, 1, 1, 1, 1,
-1.113531, 0.003573583, -2.353079, 1, 1, 1, 1, 1,
-1.112972, -1.0545, -5.243707, 1, 1, 1, 1, 1,
-1.112785, 2.537383, 0.227106, 1, 1, 1, 1, 1,
-1.109441, -1.240079, -1.115602, 1, 1, 1, 1, 1,
-1.105633, -0.4995625, -1.620894, 1, 1, 1, 1, 1,
-1.104282, 0.4744315, 1.611975, 0, 0, 1, 1, 1,
-1.092359, -1.098413, -3.28971, 1, 0, 0, 1, 1,
-1.091836, -1.552024, -2.337896, 1, 0, 0, 1, 1,
-1.076178, 0.6433491, -0.5564106, 1, 0, 0, 1, 1,
-1.073253, -1.579233, -3.387806, 1, 0, 0, 1, 1,
-1.064994, -0.3495837, -0.9297248, 1, 0, 0, 1, 1,
-1.059805, 0.257421, -0.9032192, 0, 0, 0, 1, 1,
-1.054091, 1.01049, -1.270161, 0, 0, 0, 1, 1,
-1.050461, 0.3939937, -2.163434, 0, 0, 0, 1, 1,
-1.049726, 0.026949, -3.355681, 0, 0, 0, 1, 1,
-1.046875, 0.5959392, 1.211776, 0, 0, 0, 1, 1,
-1.038062, -0.1728304, -1.310566, 0, 0, 0, 1, 1,
-1.033021, -0.5538927, -1.727683, 0, 0, 0, 1, 1,
-1.032477, -0.6154824, -2.034563, 1, 1, 1, 1, 1,
-1.026778, -0.3561292, -1.245701, 1, 1, 1, 1, 1,
-1.026696, 0.3591157, -0.5196828, 1, 1, 1, 1, 1,
-1.024134, 0.06637214, -0.4277252, 1, 1, 1, 1, 1,
-1.018086, -0.8778533, -2.317235, 1, 1, 1, 1, 1,
-1.007383, 0.6133485, -1.237367, 1, 1, 1, 1, 1,
-1.006595, -2.047782, -2.913206, 1, 1, 1, 1, 1,
-1.003584, -2.23656, -0.7716967, 1, 1, 1, 1, 1,
-1.00236, -1.22935, -1.172636, 1, 1, 1, 1, 1,
-0.9954717, -0.9580548, -1.170914, 1, 1, 1, 1, 1,
-0.9910154, -1.520436, -3.56491, 1, 1, 1, 1, 1,
-0.9888833, -0.06613431, -2.452887, 1, 1, 1, 1, 1,
-0.9716568, 1.05987, -0.532637, 1, 1, 1, 1, 1,
-0.969315, -0.6251662, -1.832661, 1, 1, 1, 1, 1,
-0.9691935, -0.6701685, -3.721991, 1, 1, 1, 1, 1,
-0.9682059, -0.2141996, -2.077275, 0, 0, 1, 1, 1,
-0.9675206, -0.1737992, -2.008148, 1, 0, 0, 1, 1,
-0.9675075, -0.0503286, -2.459328, 1, 0, 0, 1, 1,
-0.9659079, 0.08624028, -1.265342, 1, 0, 0, 1, 1,
-0.9593266, -0.9144014, -1.761662, 1, 0, 0, 1, 1,
-0.948194, -0.204191, -1.312779, 1, 0, 0, 1, 1,
-0.934437, -1.262505, -1.913007, 0, 0, 0, 1, 1,
-0.9309409, 0.7675253, -0.04083289, 0, 0, 0, 1, 1,
-0.9304814, 0.8745323, -0.8476083, 0, 0, 0, 1, 1,
-0.9261243, -1.23315, -3.490164, 0, 0, 0, 1, 1,
-0.9252063, 0.740891, 0.6309845, 0, 0, 0, 1, 1,
-0.9233943, -0.8748822, -3.863436, 0, 0, 0, 1, 1,
-0.9187558, 2.119051, -0.6147905, 0, 0, 0, 1, 1,
-0.9168294, 1.170405, -0.7324255, 1, 1, 1, 1, 1,
-0.9164397, -0.8169464, -3.350103, 1, 1, 1, 1, 1,
-0.9136401, -1.050378, -3.105655, 1, 1, 1, 1, 1,
-0.9129862, 1.83667, 0.6821418, 1, 1, 1, 1, 1,
-0.9023976, -0.3067062, -1.780129, 1, 1, 1, 1, 1,
-0.9017714, -0.1603886, -0.4111122, 1, 1, 1, 1, 1,
-0.9010019, 1.894718, -0.06874002, 1, 1, 1, 1, 1,
-0.8979918, -1.566551, -2.630432, 1, 1, 1, 1, 1,
-0.8979282, -0.8575245, -3.159667, 1, 1, 1, 1, 1,
-0.8910596, -1.509624, -3.181412, 1, 1, 1, 1, 1,
-0.8889437, 0.4611239, -2.990449, 1, 1, 1, 1, 1,
-0.8881462, 1.402308, -1.214583, 1, 1, 1, 1, 1,
-0.8818225, 1.327924, 0.2593345, 1, 1, 1, 1, 1,
-0.8793477, 1.09092, -0.6506608, 1, 1, 1, 1, 1,
-0.8724114, -0.5714813, -2.906462, 1, 1, 1, 1, 1,
-0.8679723, -1.30917, -1.616898, 0, 0, 1, 1, 1,
-0.8605729, 1.035069, -1.428171, 1, 0, 0, 1, 1,
-0.859795, 0.5468152, -2.965503, 1, 0, 0, 1, 1,
-0.8564355, -0.2594192, -2.398277, 1, 0, 0, 1, 1,
-0.8555294, -1.987069, -4.450517, 1, 0, 0, 1, 1,
-0.853438, -1.523434, -1.268672, 1, 0, 0, 1, 1,
-0.8523399, -2.028406, -1.662579, 0, 0, 0, 1, 1,
-0.848994, 1.707062, -1.71372, 0, 0, 0, 1, 1,
-0.8484687, -0.2419837, 0.4447481, 0, 0, 0, 1, 1,
-0.8453423, 1.504047, -0.01596267, 0, 0, 0, 1, 1,
-0.8412181, 0.2258125, -0.9189751, 0, 0, 0, 1, 1,
-0.8405501, 0.849005, -0.1049832, 0, 0, 0, 1, 1,
-0.8299978, -0.5656627, -2.266574, 0, 0, 0, 1, 1,
-0.8227127, 0.9273543, 0.4405946, 1, 1, 1, 1, 1,
-0.8222759, 0.0586339, -2.005413, 1, 1, 1, 1, 1,
-0.8049831, 0.4903517, 0.1608165, 1, 1, 1, 1, 1,
-0.7994921, -0.3901921, -4.053781, 1, 1, 1, 1, 1,
-0.798761, 0.7391751, -2.265631, 1, 1, 1, 1, 1,
-0.7921587, 1.208261, -0.588141, 1, 1, 1, 1, 1,
-0.7895641, 0.9587251, -0.9422318, 1, 1, 1, 1, 1,
-0.788607, 0.5731983, -0.3354999, 1, 1, 1, 1, 1,
-0.7812186, -1.990118, -2.299559, 1, 1, 1, 1, 1,
-0.7800383, 0.2912164, -0.02046429, 1, 1, 1, 1, 1,
-0.7681302, -0.09229738, -1.97369, 1, 1, 1, 1, 1,
-0.7645371, 0.008301686, -2.407595, 1, 1, 1, 1, 1,
-0.7626817, -0.9634607, -3.09025, 1, 1, 1, 1, 1,
-0.7615577, -0.3081347, -1.291585, 1, 1, 1, 1, 1,
-0.756588, -0.789484, -2.663522, 1, 1, 1, 1, 1,
-0.7553562, 0.737412, -2.604377, 0, 0, 1, 1, 1,
-0.7540027, 1.41034, 0.04968654, 1, 0, 0, 1, 1,
-0.753575, 0.6281272, -0.7031693, 1, 0, 0, 1, 1,
-0.7523839, -0.5933551, -1.715276, 1, 0, 0, 1, 1,
-0.7519295, 0.2641048, 0.2381174, 1, 0, 0, 1, 1,
-0.7500769, -0.1728836, -2.834592, 1, 0, 0, 1, 1,
-0.7488375, -1.314859, -0.6059855, 0, 0, 0, 1, 1,
-0.7401331, 1.666803, -1.07791, 0, 0, 0, 1, 1,
-0.7394248, 2.558337, -0.3354234, 0, 0, 0, 1, 1,
-0.738944, -1.358535, -3.890599, 0, 0, 0, 1, 1,
-0.733995, 1.422177, -1.152316, 0, 0, 0, 1, 1,
-0.7291296, 0.5013376, -0.5258518, 0, 0, 0, 1, 1,
-0.727631, 1.580261, 0.4108548, 0, 0, 0, 1, 1,
-0.7188517, 0.3222062, 1.014255, 1, 1, 1, 1, 1,
-0.7181354, 0.06513698, -0.1793132, 1, 1, 1, 1, 1,
-0.7157443, -0.878495, -2.426251, 1, 1, 1, 1, 1,
-0.7108492, 1.228201, 2.255297, 1, 1, 1, 1, 1,
-0.6999701, -0.152859, -2.865581, 1, 1, 1, 1, 1,
-0.6988574, 0.3196045, -0.5851223, 1, 1, 1, 1, 1,
-0.6964642, 0.1902224, 0.2241704, 1, 1, 1, 1, 1,
-0.6915312, 0.7320755, -2.15647, 1, 1, 1, 1, 1,
-0.6855561, 1.255172, -1.595614, 1, 1, 1, 1, 1,
-0.6790117, 0.1723777, -1.090062, 1, 1, 1, 1, 1,
-0.6773852, 0.7745174, 1.068311, 1, 1, 1, 1, 1,
-0.6764997, -1.688182, -2.46867, 1, 1, 1, 1, 1,
-0.6751198, -0.124097, -1.652536, 1, 1, 1, 1, 1,
-0.6697937, -0.4131878, -1.031745, 1, 1, 1, 1, 1,
-0.6640803, -0.6910908, -0.9174471, 1, 1, 1, 1, 1,
-0.6546546, 0.3176079, -2.211655, 0, 0, 1, 1, 1,
-0.6519639, -1.778762, -0.8533053, 1, 0, 0, 1, 1,
-0.6494021, -0.8833005, -1.714681, 1, 0, 0, 1, 1,
-0.6449131, 1.782384, -1.265128, 1, 0, 0, 1, 1,
-0.6379065, 0.2859382, -0.8734513, 1, 0, 0, 1, 1,
-0.6358626, 0.6240417, -2.032453, 1, 0, 0, 1, 1,
-0.6324677, -0.5494941, -2.619035, 0, 0, 0, 1, 1,
-0.6318432, 1.173548, -2.37855, 0, 0, 0, 1, 1,
-0.6311241, -2.359328, -2.862206, 0, 0, 0, 1, 1,
-0.6294277, 0.1562794, -2.603876, 0, 0, 0, 1, 1,
-0.6254423, -3.199492, -3.188174, 0, 0, 0, 1, 1,
-0.6201715, 1.017483, 0.7904924, 0, 0, 0, 1, 1,
-0.6192984, -1.622931, -1.574151, 0, 0, 0, 1, 1,
-0.6192862, 0.1870453, -1.350606, 1, 1, 1, 1, 1,
-0.6137325, -0.4016758, -3.623745, 1, 1, 1, 1, 1,
-0.612938, 2.509369, -1.725018, 1, 1, 1, 1, 1,
-0.609451, -0.4351909, -1.757215, 1, 1, 1, 1, 1,
-0.60755, -0.6116367, -1.69133, 1, 1, 1, 1, 1,
-0.6051149, -0.3378609, -2.426141, 1, 1, 1, 1, 1,
-0.6025928, 0.60777, -0.7055138, 1, 1, 1, 1, 1,
-0.5964117, -0.8179762, -1.701688, 1, 1, 1, 1, 1,
-0.5917729, -0.597902, -3.099128, 1, 1, 1, 1, 1,
-0.5917392, -1.498521, -4.263385, 1, 1, 1, 1, 1,
-0.5906293, -0.2452031, -2.847634, 1, 1, 1, 1, 1,
-0.5895818, 1.792753, -0.850587, 1, 1, 1, 1, 1,
-0.5873002, -1.099727, -1.299721, 1, 1, 1, 1, 1,
-0.5858337, 0.09752605, -3.050219, 1, 1, 1, 1, 1,
-0.5850326, -1.202637, -2.829795, 1, 1, 1, 1, 1,
-0.5838875, -0.6207868, -3.858712, 0, 0, 1, 1, 1,
-0.5790454, 0.05701086, -2.268007, 1, 0, 0, 1, 1,
-0.5735167, 0.2825221, -1.153308, 1, 0, 0, 1, 1,
-0.5706154, 0.2732946, -0.5979632, 1, 0, 0, 1, 1,
-0.5705516, -1.060834, -3.940717, 1, 0, 0, 1, 1,
-0.5654802, -1.547488, -4.384388, 1, 0, 0, 1, 1,
-0.5619446, -0.3077737, -3.039833, 0, 0, 0, 1, 1,
-0.5591909, -1.13742, -3.379744, 0, 0, 0, 1, 1,
-0.5532157, -2.176953, -3.85287, 0, 0, 0, 1, 1,
-0.550918, 0.6320562, -0.373288, 0, 0, 0, 1, 1,
-0.5428178, -1.120055, -2.282455, 0, 0, 0, 1, 1,
-0.5388945, 1.256115, 0.59074, 0, 0, 0, 1, 1,
-0.5386384, -0.3264174, -2.058861, 0, 0, 0, 1, 1,
-0.5379695, 1.066482, -0.5865442, 1, 1, 1, 1, 1,
-0.5372555, -0.7521847, -3.545084, 1, 1, 1, 1, 1,
-0.5361376, 0.8101513, -2.868254, 1, 1, 1, 1, 1,
-0.5342165, -1.923661, -3.639766, 1, 1, 1, 1, 1,
-0.5318574, -0.3345682, -3.106666, 1, 1, 1, 1, 1,
-0.5315635, 0.03729147, -1.963108, 1, 1, 1, 1, 1,
-0.5310099, 0.4321162, -0.5313212, 1, 1, 1, 1, 1,
-0.5309896, -1.402945, -4.575183, 1, 1, 1, 1, 1,
-0.5272384, -0.4260078, -1.443335, 1, 1, 1, 1, 1,
-0.526733, -0.3257171, -3.092807, 1, 1, 1, 1, 1,
-0.5235031, 1.418352, 0.003027204, 1, 1, 1, 1, 1,
-0.5132068, 0.4758074, -1.064633, 1, 1, 1, 1, 1,
-0.510969, 1.072272, 2.529346, 1, 1, 1, 1, 1,
-0.5107694, -0.7284123, -2.926248, 1, 1, 1, 1, 1,
-0.5093697, 0.350772, -1.835596, 1, 1, 1, 1, 1,
-0.5077958, 0.9763842, 0.05137444, 0, 0, 1, 1, 1,
-0.5069488, -0.04060397, -1.665644, 1, 0, 0, 1, 1,
-0.4991412, 0.4012359, -0.3470332, 1, 0, 0, 1, 1,
-0.4902569, -0.008724083, -2.013825, 1, 0, 0, 1, 1,
-0.4873804, -0.3056961, -1.763562, 1, 0, 0, 1, 1,
-0.4873115, -0.7236196, -2.406974, 1, 0, 0, 1, 1,
-0.4860939, 1.037251, -0.1601942, 0, 0, 0, 1, 1,
-0.4852467, 0.2721429, -1.258989, 0, 0, 0, 1, 1,
-0.4843926, -0.5414038, -3.497957, 0, 0, 0, 1, 1,
-0.484143, 0.7998785, 0.8811622, 0, 0, 0, 1, 1,
-0.482022, -0.1330291, -0.5781638, 0, 0, 0, 1, 1,
-0.4807784, 1.075441, 0.4985014, 0, 0, 0, 1, 1,
-0.4788483, -0.1608552, -3.594206, 0, 0, 0, 1, 1,
-0.4756939, -0.2759125, -2.081419, 1, 1, 1, 1, 1,
-0.472838, 0.7505575, -1.210888, 1, 1, 1, 1, 1,
-0.470946, 1.604857, -0.5605249, 1, 1, 1, 1, 1,
-0.4703031, 0.0921514, -1.6921, 1, 1, 1, 1, 1,
-0.4615082, 1.384653, -0.5680079, 1, 1, 1, 1, 1,
-0.4577137, 0.4590687, -1.871372, 1, 1, 1, 1, 1,
-0.4561141, 0.1972756, -1.858743, 1, 1, 1, 1, 1,
-0.4487168, -0.718343, -2.666381, 1, 1, 1, 1, 1,
-0.4460624, -0.4139994, -1.405324, 1, 1, 1, 1, 1,
-0.4454841, -1.529562, -1.622763, 1, 1, 1, 1, 1,
-0.4449757, 0.1517821, -1.098935, 1, 1, 1, 1, 1,
-0.4423302, -0.06719569, -0.7447515, 1, 1, 1, 1, 1,
-0.4422863, 1.333212, 1.266685, 1, 1, 1, 1, 1,
-0.4381652, -1.553569, -3.123714, 1, 1, 1, 1, 1,
-0.4379725, 0.8475794, -0.3365639, 1, 1, 1, 1, 1,
-0.4371545, -0.7921808, -3.312165, 0, 0, 1, 1, 1,
-0.4359439, -0.3220262, -1.145042, 1, 0, 0, 1, 1,
-0.4313399, 1.485123, -0.7342739, 1, 0, 0, 1, 1,
-0.4297867, -0.1073187, -2.600346, 1, 0, 0, 1, 1,
-0.4163106, -1.657458, -2.29371, 1, 0, 0, 1, 1,
-0.4155079, -0.5257525, -1.87496, 1, 0, 0, 1, 1,
-0.4154575, 1.077864, -1.021528, 0, 0, 0, 1, 1,
-0.4147586, -0.7778069, -3.483771, 0, 0, 0, 1, 1,
-0.406449, -0.2947247, -1.992854, 0, 0, 0, 1, 1,
-0.4023883, 1.104539, 0.06347925, 0, 0, 0, 1, 1,
-0.3997787, 0.4613774, 2.107689, 0, 0, 0, 1, 1,
-0.3876668, 1.457446, -1.396523, 0, 0, 0, 1, 1,
-0.3871832, 0.3205123, -1.484425, 0, 0, 0, 1, 1,
-0.3843038, 1.762157, 0.3440697, 1, 1, 1, 1, 1,
-0.3812908, -2.046699, -1.727575, 1, 1, 1, 1, 1,
-0.3810165, 1.945297, 0.7718804, 1, 1, 1, 1, 1,
-0.378243, 2.061116, 0.4773814, 1, 1, 1, 1, 1,
-0.3729022, -1.324872, -3.051071, 1, 1, 1, 1, 1,
-0.3715538, 0.7723769, -0.462936, 1, 1, 1, 1, 1,
-0.3689634, -0.5634369, -2.439415, 1, 1, 1, 1, 1,
-0.3654877, -0.8465139, -3.008462, 1, 1, 1, 1, 1,
-0.3642567, 0.647775, 0.2531568, 1, 1, 1, 1, 1,
-0.3632555, 0.9026232, -1.103583, 1, 1, 1, 1, 1,
-0.3621837, -0.382765, -3.160547, 1, 1, 1, 1, 1,
-0.355134, -1.73186, -3.181814, 1, 1, 1, 1, 1,
-0.350593, 0.4659606, -0.6011553, 1, 1, 1, 1, 1,
-0.3481633, -0.7628443, -2.726087, 1, 1, 1, 1, 1,
-0.3415745, -0.3833818, -3.945897, 1, 1, 1, 1, 1,
-0.3383363, -0.3312041, -1.319019, 0, 0, 1, 1, 1,
-0.3352773, -0.4072101, -1.225736, 1, 0, 0, 1, 1,
-0.3275134, 0.2357142, -1.240943, 1, 0, 0, 1, 1,
-0.3274567, -0.5073196, -4.25722, 1, 0, 0, 1, 1,
-0.325492, -1.014194, -2.916088, 1, 0, 0, 1, 1,
-0.322527, 0.495767, 0.5197574, 1, 0, 0, 1, 1,
-0.3198246, 1.226721, 0.2136821, 0, 0, 0, 1, 1,
-0.316552, -0.08869543, -2.956604, 0, 0, 0, 1, 1,
-0.3132972, 1.982268, 0.1709457, 0, 0, 0, 1, 1,
-0.3126329, 0.6604372, -0.252131, 0, 0, 0, 1, 1,
-0.3118481, -0.5681883, -3.806853, 0, 0, 0, 1, 1,
-0.3097154, 0.1782126, 0.9859604, 0, 0, 0, 1, 1,
-0.3068955, 1.301399, -1.640596, 0, 0, 0, 1, 1,
-0.3047997, -0.2205218, -2.653727, 1, 1, 1, 1, 1,
-0.3029703, 1.144539, 0.1132381, 1, 1, 1, 1, 1,
-0.2995821, 0.8496064, -0.8593286, 1, 1, 1, 1, 1,
-0.2932696, 1.401994, 0.293767, 1, 1, 1, 1, 1,
-0.2925562, -0.2715281, -2.759801, 1, 1, 1, 1, 1,
-0.2914345, -0.9295264, -2.72451, 1, 1, 1, 1, 1,
-0.2891214, -0.5456043, -3.433252, 1, 1, 1, 1, 1,
-0.2889967, 0.1373129, -0.3969642, 1, 1, 1, 1, 1,
-0.2867608, 0.892083, -1.918491, 1, 1, 1, 1, 1,
-0.2859893, 1.497792, -1.239549, 1, 1, 1, 1, 1,
-0.2834154, 0.1709599, -2.361984, 1, 1, 1, 1, 1,
-0.2824098, 0.1537612, -1.029327, 1, 1, 1, 1, 1,
-0.281322, -0.05998444, -2.34752, 1, 1, 1, 1, 1,
-0.277686, -1.332249, -1.932005, 1, 1, 1, 1, 1,
-0.2770683, 1.188777, 0.6455784, 1, 1, 1, 1, 1,
-0.2765104, -0.07180358, -1.76972, 0, 0, 1, 1, 1,
-0.2754712, -0.02730408, -1.122772, 1, 0, 0, 1, 1,
-0.2754191, 0.9699718, -1.079144, 1, 0, 0, 1, 1,
-0.2747363, -0.9570748, -3.800215, 1, 0, 0, 1, 1,
-0.2735833, -0.2809058, -2.556902, 1, 0, 0, 1, 1,
-0.2706563, -0.7785119, -3.624142, 1, 0, 0, 1, 1,
-0.2705309, 1.707669, -1.008793, 0, 0, 0, 1, 1,
-0.268238, 0.76865, 0.1977059, 0, 0, 0, 1, 1,
-0.2673173, -0.02024712, -1.832891, 0, 0, 0, 1, 1,
-0.2633632, -2.551784, -2.543475, 0, 0, 0, 1, 1,
-0.2617911, 0.5028964, 1.107618, 0, 0, 0, 1, 1,
-0.2518727, 0.5034578, 0.01326919, 0, 0, 0, 1, 1,
-0.2461735, 1.285622, -2.001663, 0, 0, 0, 1, 1,
-0.2460003, -1.217693, -1.970968, 1, 1, 1, 1, 1,
-0.2452249, 0.4325974, 0.3571267, 1, 1, 1, 1, 1,
-0.2373382, 1.456303, -1.643098, 1, 1, 1, 1, 1,
-0.2373293, 1.251178, 0.7116341, 1, 1, 1, 1, 1,
-0.2370156, -0.458719, -2.195455, 1, 1, 1, 1, 1,
-0.2363984, -1.033644, -2.936723, 1, 1, 1, 1, 1,
-0.2282132, 1.335188, -1.489068, 1, 1, 1, 1, 1,
-0.2223999, 1.586789, 0.4707638, 1, 1, 1, 1, 1,
-0.2223855, -0.1049865, -0.4527133, 1, 1, 1, 1, 1,
-0.222234, -0.2025694, -2.147142, 1, 1, 1, 1, 1,
-0.2126321, 0.679006, -1.203936, 1, 1, 1, 1, 1,
-0.2087357, -0.3620744, -1.192464, 1, 1, 1, 1, 1,
-0.2083523, -1.110618, -3.532544, 1, 1, 1, 1, 1,
-0.2047071, -0.5503684, -3.384716, 1, 1, 1, 1, 1,
-0.2020032, -1.188425, -3.510792, 1, 1, 1, 1, 1,
-0.2000801, 0.2222178, 1.292391, 0, 0, 1, 1, 1,
-0.1990507, -0.8312243, -4.365706, 1, 0, 0, 1, 1,
-0.1953192, -0.7939287, -4.031354, 1, 0, 0, 1, 1,
-0.1939976, 0.09119949, -0.8712198, 1, 0, 0, 1, 1,
-0.1919159, -0.4725873, -3.176905, 1, 0, 0, 1, 1,
-0.1905685, -0.2378908, -2.525954, 1, 0, 0, 1, 1,
-0.1866284, 0.3199591, -1.238864, 0, 0, 0, 1, 1,
-0.1858068, -0.6585872, -1.349417, 0, 0, 0, 1, 1,
-0.1832815, -0.2444654, -2.595987, 0, 0, 0, 1, 1,
-0.1758724, 0.3488838, -1.390954, 0, 0, 0, 1, 1,
-0.1726388, 1.468224, -1.087638, 0, 0, 0, 1, 1,
-0.1694911, 0.3782438, 0.8122765, 0, 0, 0, 1, 1,
-0.1683387, -0.8264969, -3.790005, 0, 0, 0, 1, 1,
-0.1676105, 0.8854358, 0.3937553, 1, 1, 1, 1, 1,
-0.1663275, -1.338275, -3.275221, 1, 1, 1, 1, 1,
-0.1659755, -0.3972, -3.175346, 1, 1, 1, 1, 1,
-0.1650413, 0.10075, 0.02136742, 1, 1, 1, 1, 1,
-0.1601418, 0.8402056, 1.043342, 1, 1, 1, 1, 1,
-0.1542798, -1.664308, -2.751093, 1, 1, 1, 1, 1,
-0.152329, 0.0757195, -1.895696, 1, 1, 1, 1, 1,
-0.1511646, -1.487844, -3.440916, 1, 1, 1, 1, 1,
-0.1511012, -0.8548916, -2.280995, 1, 1, 1, 1, 1,
-0.1444293, 1.236913, 0.7355204, 1, 1, 1, 1, 1,
-0.1425441, -0.09749042, -0.2190164, 1, 1, 1, 1, 1,
-0.1395463, 1.591659, -0.2798462, 1, 1, 1, 1, 1,
-0.1390379, -0.01703181, -2.271372, 1, 1, 1, 1, 1,
-0.1386119, 0.8886828, -0.8679883, 1, 1, 1, 1, 1,
-0.138241, -1.261571, -3.871015, 1, 1, 1, 1, 1,
-0.1339125, -0.6125233, -4.227933, 0, 0, 1, 1, 1,
-0.1292347, -0.3689752, -2.729599, 1, 0, 0, 1, 1,
-0.1273429, -2.33758, -2.111793, 1, 0, 0, 1, 1,
-0.1239948, 1.533088, -0.8211097, 1, 0, 0, 1, 1,
-0.1234917, 1.914011, 0.2307795, 1, 0, 0, 1, 1,
-0.1216617, 1.259006, -0.6642106, 1, 0, 0, 1, 1,
-0.1214853, -0.777231, -1.871363, 0, 0, 0, 1, 1,
-0.1173312, 0.1216654, -0.3911085, 0, 0, 0, 1, 1,
-0.1149484, -0.3582407, -1.623785, 0, 0, 0, 1, 1,
-0.1123014, -0.3297648, -4.705091, 0, 0, 0, 1, 1,
-0.1094651, 0.1454081, -0.1645585, 0, 0, 0, 1, 1,
-0.107093, 0.1907138, 0.8931041, 0, 0, 0, 1, 1,
-0.1044974, -0.05105738, -2.130856, 0, 0, 0, 1, 1,
-0.1041436, -0.7264717, -3.093909, 1, 1, 1, 1, 1,
-0.1019894, -1.938494, -2.836658, 1, 1, 1, 1, 1,
-0.10102, -2.662847, -3.449944, 1, 1, 1, 1, 1,
-0.1006187, 0.2745784, 0.3925126, 1, 1, 1, 1, 1,
-0.09902155, 1.285317, -1.213001, 1, 1, 1, 1, 1,
-0.09795175, -1.815695, -2.910218, 1, 1, 1, 1, 1,
-0.0953215, -0.06193373, -3.36097, 1, 1, 1, 1, 1,
-0.09388533, 1.181611, 0.1919303, 1, 1, 1, 1, 1,
-0.0937723, 1.548701, -1.070271, 1, 1, 1, 1, 1,
-0.09226765, -1.980013, -1.956727, 1, 1, 1, 1, 1,
-0.0904192, 0.7513129, -1.706637, 1, 1, 1, 1, 1,
-0.09021007, -1.319765, -2.177694, 1, 1, 1, 1, 1,
-0.08841858, -0.2728524, -4.377908, 1, 1, 1, 1, 1,
-0.08826135, -0.7874246, -3.027267, 1, 1, 1, 1, 1,
-0.08741192, -1.547363, -2.564277, 1, 1, 1, 1, 1,
-0.08656154, 1.660117, 1.068773, 0, 0, 1, 1, 1,
-0.08590692, 0.2945905, -0.2157433, 1, 0, 0, 1, 1,
-0.08319099, -0.1663245, -4.151381, 1, 0, 0, 1, 1,
-0.08121851, -0.252961, -2.82284, 1, 0, 0, 1, 1,
-0.07676761, 0.3297485, -1.566579, 1, 0, 0, 1, 1,
-0.07278761, -0.7546701, -2.366879, 1, 0, 0, 1, 1,
-0.06618534, -0.1866323, -2.09418, 0, 0, 0, 1, 1,
-0.06032315, 1.131943, -1.282594, 0, 0, 0, 1, 1,
-0.05790221, 0.1317383, -1.830698, 0, 0, 0, 1, 1,
-0.05077043, 1.766254, -1.125336, 0, 0, 0, 1, 1,
-0.0493528, -0.9261841, -3.767677, 0, 0, 0, 1, 1,
-0.04628706, 0.07729235, -0.5751348, 0, 0, 0, 1, 1,
-0.04248858, -0.1169104, -4.238487, 0, 0, 0, 1, 1,
-0.03899331, 0.03656691, 0.3263545, 1, 1, 1, 1, 1,
-0.03699813, 0.9113084, 0.3453622, 1, 1, 1, 1, 1,
-0.03278755, 0.5128837, 0.0905327, 1, 1, 1, 1, 1,
-0.02924614, -0.9557014, -2.235414, 1, 1, 1, 1, 1,
-0.02730227, 1.077218, 0.4707915, 1, 1, 1, 1, 1,
-0.02714881, 0.8260957, 0.8550152, 1, 1, 1, 1, 1,
-0.0255079, 0.9332777, 0.1439983, 1, 1, 1, 1, 1,
-0.02483125, -0.2383561, -1.875665, 1, 1, 1, 1, 1,
-0.01710579, 0.1616291, -0.05102088, 1, 1, 1, 1, 1,
-0.01481693, -1.169862, -2.553892, 1, 1, 1, 1, 1,
-0.009433545, 0.5513772, -0.3775733, 1, 1, 1, 1, 1,
-0.00783793, -1.185953, -2.821645, 1, 1, 1, 1, 1,
-0.006400032, 0.24799, -1.290349, 1, 1, 1, 1, 1,
-0.004557312, -0.1335398, -2.106692, 1, 1, 1, 1, 1,
0.0003040532, 0.7261907, 0.1655149, 1, 1, 1, 1, 1,
0.001261519, 1.348426, 1.756785, 0, 0, 1, 1, 1,
0.004450597, -1.487772, 3.172372, 1, 0, 0, 1, 1,
0.006926057, 1.009653, -1.305832, 1, 0, 0, 1, 1,
0.01220684, 0.5318499, -2.40584, 1, 0, 0, 1, 1,
0.01224778, 0.7906697, -0.7648158, 1, 0, 0, 1, 1,
0.01362145, -0.06014994, 2.405688, 1, 0, 0, 1, 1,
0.01534488, -1.124644, 3.504661, 0, 0, 0, 1, 1,
0.02338118, -0.1297642, 3.612124, 0, 0, 0, 1, 1,
0.02453979, 1.096842, 0.5559419, 0, 0, 0, 1, 1,
0.02530265, -0.3364014, 3.233819, 0, 0, 0, 1, 1,
0.03737722, 1.039567, -0.2747138, 0, 0, 0, 1, 1,
0.03957978, 0.694386, 0.5707756, 0, 0, 0, 1, 1,
0.0423063, 0.6495906, 1.175563, 0, 0, 0, 1, 1,
0.04689352, -0.5687028, 3.865297, 1, 1, 1, 1, 1,
0.05287896, -0.2214406, 0.6434789, 1, 1, 1, 1, 1,
0.05394089, -1.873194, 3.06889, 1, 1, 1, 1, 1,
0.0544808, 0.2716933, -1.549923, 1, 1, 1, 1, 1,
0.05941532, -0.7830386, 5.13581, 1, 1, 1, 1, 1,
0.06162055, 0.1496561, 1.350721, 1, 1, 1, 1, 1,
0.06203843, 1.243485, -0.3035721, 1, 1, 1, 1, 1,
0.06486426, 0.6357376, 0.06504149, 1, 1, 1, 1, 1,
0.06529956, -0.2348993, 2.709789, 1, 1, 1, 1, 1,
0.06530854, -1.058017, 3.124878, 1, 1, 1, 1, 1,
0.06542827, -0.2197899, 2.355978, 1, 1, 1, 1, 1,
0.06977673, 1.01023, 0.1459402, 1, 1, 1, 1, 1,
0.07121463, -1.677514, 3.815346, 1, 1, 1, 1, 1,
0.07314518, -0.2078159, 3.312845, 1, 1, 1, 1, 1,
0.08859921, -0.3454789, 3.008702, 1, 1, 1, 1, 1,
0.1001286, -1.150933, 3.602277, 0, 0, 1, 1, 1,
0.103044, -0.2563209, 2.737822, 1, 0, 0, 1, 1,
0.1038705, 0.1623106, -0.1956606, 1, 0, 0, 1, 1,
0.1084623, -0.9970816, 3.261404, 1, 0, 0, 1, 1,
0.1115043, 0.1234544, 0.5112141, 1, 0, 0, 1, 1,
0.1163086, 0.2489908, -0.4203927, 1, 0, 0, 1, 1,
0.1216742, -0.6437883, 3.859162, 0, 0, 0, 1, 1,
0.1259654, -1.057542, 4.008686, 0, 0, 0, 1, 1,
0.1265888, 0.5116858, -0.5872504, 0, 0, 0, 1, 1,
0.1280173, 0.09932132, 0.9358072, 0, 0, 0, 1, 1,
0.1315752, -1.556993, 1.412044, 0, 0, 0, 1, 1,
0.1329163, -1.451014, 1.841602, 0, 0, 0, 1, 1,
0.1330429, -1.031714, 4.096083, 0, 0, 0, 1, 1,
0.1351091, -0.6270954, 4.118224, 1, 1, 1, 1, 1,
0.141169, 0.7185075, -0.4342301, 1, 1, 1, 1, 1,
0.141234, 0.2027086, -1.170968, 1, 1, 1, 1, 1,
0.1425078, -2.082298, 4.417572, 1, 1, 1, 1, 1,
0.1430359, 0.2191257, 0.7330673, 1, 1, 1, 1, 1,
0.1437225, 0.06801427, -0.2999377, 1, 1, 1, 1, 1,
0.1446826, -1.671208, 2.328539, 1, 1, 1, 1, 1,
0.1454433, -0.04953422, 3.080909, 1, 1, 1, 1, 1,
0.1477265, 0.08831892, -0.6166362, 1, 1, 1, 1, 1,
0.1490661, -0.01779225, 2.516137, 1, 1, 1, 1, 1,
0.1529053, 2.967479, -0.3169074, 1, 1, 1, 1, 1,
0.1529522, -1.386257, 4.416103, 1, 1, 1, 1, 1,
0.1536368, 0.579208, -0.8114746, 1, 1, 1, 1, 1,
0.1560977, -2.499744, 3.492899, 1, 1, 1, 1, 1,
0.156182, 0.6124914, 0.1940219, 1, 1, 1, 1, 1,
0.1576765, -1.107536, 2.604188, 0, 0, 1, 1, 1,
0.1580933, 0.7094012, -0.3402861, 1, 0, 0, 1, 1,
0.1641938, 2.156261, 0.3403776, 1, 0, 0, 1, 1,
0.1692252, 0.3999632, 0.6565411, 1, 0, 0, 1, 1,
0.1701646, 0.6884554, 1.084417, 1, 0, 0, 1, 1,
0.1706319, 1.38317, -1.327011, 1, 0, 0, 1, 1,
0.1730073, -0.4187149, 1.789147, 0, 0, 0, 1, 1,
0.1761868, -0.2492914, 2.616771, 0, 0, 0, 1, 1,
0.1800193, 0.4072429, -0.3934959, 0, 0, 0, 1, 1,
0.1838332, -0.3518258, 2.513121, 0, 0, 0, 1, 1,
0.1842565, 0.969651, 1.147004, 0, 0, 0, 1, 1,
0.1844907, 0.9969783, -0.08524804, 0, 0, 0, 1, 1,
0.1930364, 0.9396974, 2.398816, 0, 0, 0, 1, 1,
0.1939809, -0.0307509, 1.953939, 1, 1, 1, 1, 1,
0.198717, -0.003578844, -0.5429856, 1, 1, 1, 1, 1,
0.1991108, 1.620999, -0.3054813, 1, 1, 1, 1, 1,
0.2010251, 1.507093, -0.6357944, 1, 1, 1, 1, 1,
0.2040959, 1.149969, -0.6981315, 1, 1, 1, 1, 1,
0.20476, 0.2150146, 0.813758, 1, 1, 1, 1, 1,
0.2065581, -0.1988178, 2.058375, 1, 1, 1, 1, 1,
0.2067837, 0.2724889, 0.3380723, 1, 1, 1, 1, 1,
0.2079779, 1.405404, -0.340248, 1, 1, 1, 1, 1,
0.2095158, -0.3523605, 1.412405, 1, 1, 1, 1, 1,
0.2097311, 1.012147, -3.288404, 1, 1, 1, 1, 1,
0.2136085, -0.09659222, 1.147291, 1, 1, 1, 1, 1,
0.2169167, 1.309234, -0.6337222, 1, 1, 1, 1, 1,
0.2220408, 0.5661896, 0.9483948, 1, 1, 1, 1, 1,
0.2224239, 0.5686019, 0.3288022, 1, 1, 1, 1, 1,
0.2240825, -0.2212054, 2.027213, 0, 0, 1, 1, 1,
0.2267852, 0.992178, 1.183536, 1, 0, 0, 1, 1,
0.2273848, -0.782123, 2.891789, 1, 0, 0, 1, 1,
0.2314504, 0.7652646, 0.06195862, 1, 0, 0, 1, 1,
0.2329592, -1.532225, 3.562728, 1, 0, 0, 1, 1,
0.2345829, 1.980767, 1.186734, 1, 0, 0, 1, 1,
0.2444581, 0.3478613, -0.3789054, 0, 0, 0, 1, 1,
0.2472577, -1.316604, 2.292639, 0, 0, 0, 1, 1,
0.2501812, 0.9034206, 0.6972902, 0, 0, 0, 1, 1,
0.2515039, 0.8517144, 0.1464016, 0, 0, 0, 1, 1,
0.2515539, -0.5813673, 3.212406, 0, 0, 0, 1, 1,
0.2531581, -2.188858, 3.029367, 0, 0, 0, 1, 1,
0.2541863, -0.4651591, 2.991562, 0, 0, 0, 1, 1,
0.2547103, -0.7739958, 3.230196, 1, 1, 1, 1, 1,
0.2594244, 0.486422, 1.062623, 1, 1, 1, 1, 1,
0.2596781, 0.3916218, 2.239322, 1, 1, 1, 1, 1,
0.2611139, -0.9605836, 2.66381, 1, 1, 1, 1, 1,
0.2675901, 0.9069032, 1.362856, 1, 1, 1, 1, 1,
0.2721404, 0.5092974, 2.620051, 1, 1, 1, 1, 1,
0.2811681, -0.6816353, 2.504293, 1, 1, 1, 1, 1,
0.2900898, -1.344679, 3.844682, 1, 1, 1, 1, 1,
0.2903594, 0.1270014, 1.960334, 1, 1, 1, 1, 1,
0.2906661, 1.64813, 1.52249, 1, 1, 1, 1, 1,
0.2914104, -0.1249011, 1.401528, 1, 1, 1, 1, 1,
0.2938963, -0.750735, 2.74402, 1, 1, 1, 1, 1,
0.2995498, -0.2259266, 3.174028, 1, 1, 1, 1, 1,
0.3002352, -0.9653016, 3.024835, 1, 1, 1, 1, 1,
0.3009833, -0.01676269, 0.862048, 1, 1, 1, 1, 1,
0.3070659, -0.6488904, 3.677542, 0, 0, 1, 1, 1,
0.3088748, -0.9380007, 2.983272, 1, 0, 0, 1, 1,
0.313007, -0.05676826, 2.390141, 1, 0, 0, 1, 1,
0.3158542, -0.1289673, 1.809399, 1, 0, 0, 1, 1,
0.3172688, -1.553267, 4.614556, 1, 0, 0, 1, 1,
0.3223726, -0.1746038, 2.518391, 1, 0, 0, 1, 1,
0.3265886, -0.9854284, 3.261068, 0, 0, 0, 1, 1,
0.3321293, 0.9502749, 0.9916044, 0, 0, 0, 1, 1,
0.3371909, -0.1464295, 1.930914, 0, 0, 0, 1, 1,
0.3398125, -0.4428988, 3.234428, 0, 0, 0, 1, 1,
0.344721, 1.179168, 0.3892484, 0, 0, 0, 1, 1,
0.349986, 0.9215335, -1.232105, 0, 0, 0, 1, 1,
0.3502805, 0.6554963, 0.5762824, 0, 0, 0, 1, 1,
0.3531567, -1.376827, 3.732479, 1, 1, 1, 1, 1,
0.3550622, 0.5112374, 0.6431097, 1, 1, 1, 1, 1,
0.3634266, -0.2203338, 2.074264, 1, 1, 1, 1, 1,
0.3642514, 1.07412, 0.6537649, 1, 1, 1, 1, 1,
0.368376, -0.5142019, 2.028762, 1, 1, 1, 1, 1,
0.3735574, 0.2688885, 2.278839, 1, 1, 1, 1, 1,
0.3759955, 0.05202778, 2.469648, 1, 1, 1, 1, 1,
0.3772387, 1.049279, 0.5061871, 1, 1, 1, 1, 1,
0.3841001, -0.07851455, 0.2522011, 1, 1, 1, 1, 1,
0.387546, 1.09959, 1.558639, 1, 1, 1, 1, 1,
0.3904856, -0.2158799, 1.907385, 1, 1, 1, 1, 1,
0.3909286, -1.824332, 4.201781, 1, 1, 1, 1, 1,
0.3931146, -0.2743026, 4.991524, 1, 1, 1, 1, 1,
0.3933411, -1.105814, 3.06256, 1, 1, 1, 1, 1,
0.3939076, 0.2839153, 0.2694898, 1, 1, 1, 1, 1,
0.3955204, 0.07131717, 2.372892, 0, 0, 1, 1, 1,
0.3960964, -0.3394193, 2.037786, 1, 0, 0, 1, 1,
0.3965975, -0.8912436, 3.697125, 1, 0, 0, 1, 1,
0.4094839, 1.212057, 0.5520862, 1, 0, 0, 1, 1,
0.4107625, -1.023844, 3.083427, 1, 0, 0, 1, 1,
0.4155256, 1.179339, 0.6591063, 1, 0, 0, 1, 1,
0.4160618, -1.606768, 1.918296, 0, 0, 0, 1, 1,
0.4164082, -1.042858, 3.334982, 0, 0, 0, 1, 1,
0.4168731, 0.5982663, 0.5735798, 0, 0, 0, 1, 1,
0.4169481, 0.1058853, 0.2151962, 0, 0, 0, 1, 1,
0.4178746, -0.3611029, 4.206596, 0, 0, 0, 1, 1,
0.4202526, 0.4018166, 0.6664664, 0, 0, 0, 1, 1,
0.4217686, 0.637992, 0.5837641, 0, 0, 0, 1, 1,
0.4222433, 0.1586439, 1.218976, 1, 1, 1, 1, 1,
0.4259599, -0.2299892, 1.833571, 1, 1, 1, 1, 1,
0.4275872, -0.5142428, 2.765705, 1, 1, 1, 1, 1,
0.4315872, -2.680139, 2.423476, 1, 1, 1, 1, 1,
0.4346299, -0.09455238, 1.998855, 1, 1, 1, 1, 1,
0.4360898, -1.254803, 0.921725, 1, 1, 1, 1, 1,
0.438959, -2.402136, 4.118986, 1, 1, 1, 1, 1,
0.4410085, -0.8194289, 2.876507, 1, 1, 1, 1, 1,
0.4419473, 1.169461, 0.9157867, 1, 1, 1, 1, 1,
0.4422734, 0.04277023, 0.6554598, 1, 1, 1, 1, 1,
0.442445, -0.378998, 1.51198, 1, 1, 1, 1, 1,
0.4506519, 0.2337265, 1.640534, 1, 1, 1, 1, 1,
0.4506848, -0.2107343, 1.863759, 1, 1, 1, 1, 1,
0.4519742, -0.7729544, 0.7327069, 1, 1, 1, 1, 1,
0.4531595, 0.4854172, 1.011987, 1, 1, 1, 1, 1,
0.4542568, -1.003453, 2.242507, 0, 0, 1, 1, 1,
0.4556539, 0.3698866, 0.6203964, 1, 0, 0, 1, 1,
0.4569058, -0.169438, 1.994504, 1, 0, 0, 1, 1,
0.4576124, 1.715355, -3.694191, 1, 0, 0, 1, 1,
0.4591922, 2.071326, -1.147722, 1, 0, 0, 1, 1,
0.4669202, 2.040876, 1.180582, 1, 0, 0, 1, 1,
0.4808358, -1.082611, 3.261601, 0, 0, 0, 1, 1,
0.481216, 1.990818, 0.05972538, 0, 0, 0, 1, 1,
0.4815295, -0.2251362, 1.092687, 0, 0, 0, 1, 1,
0.4938512, -0.912547, 1.717221, 0, 0, 0, 1, 1,
0.4977491, 1.423055, 1.892034, 0, 0, 0, 1, 1,
0.5052962, 0.9443439, 0.9798805, 0, 0, 0, 1, 1,
0.5096908, 0.01993582, 1.492179, 0, 0, 0, 1, 1,
0.5115443, 0.1732811, 3.902533, 1, 1, 1, 1, 1,
0.5127801, -0.08208901, 1.453556, 1, 1, 1, 1, 1,
0.512942, 0.02907738, 0.8816516, 1, 1, 1, 1, 1,
0.5144318, 1.188729, -1.402755, 1, 1, 1, 1, 1,
0.5147821, 2.267968, -1.342046, 1, 1, 1, 1, 1,
0.5229526, -0.5009943, 2.342078, 1, 1, 1, 1, 1,
0.5275744, -0.5047938, 2.079005, 1, 1, 1, 1, 1,
0.5296172, 1.155721, 2.523296, 1, 1, 1, 1, 1,
0.5313786, 0.5968679, 0.9294207, 1, 1, 1, 1, 1,
0.531652, 1.519767, -0.8321392, 1, 1, 1, 1, 1,
0.5337325, 1.202433, 1.626569, 1, 1, 1, 1, 1,
0.5351828, -1.921391, 3.959646, 1, 1, 1, 1, 1,
0.5366788, 1.826234, 0.4121459, 1, 1, 1, 1, 1,
0.5379744, -0.5355427, 3.401281, 1, 1, 1, 1, 1,
0.5388238, 1.733837, -0.2868234, 1, 1, 1, 1, 1,
0.5413614, -0.182064, 3.515071, 0, 0, 1, 1, 1,
0.5420072, -1.754879, 4.744637, 1, 0, 0, 1, 1,
0.5441864, 0.5385287, 0.9756874, 1, 0, 0, 1, 1,
0.5453827, 0.0610941, 3.082785, 1, 0, 0, 1, 1,
0.5556881, -0.5231989, 1.515282, 1, 0, 0, 1, 1,
0.5559563, -1.931874, 3.496297, 1, 0, 0, 1, 1,
0.5564927, -0.1234335, 2.865011, 0, 0, 0, 1, 1,
0.5573865, -1.120891, 3.437561, 0, 0, 0, 1, 1,
0.5652704, -0.5103192, 1.816324, 0, 0, 0, 1, 1,
0.5748642, 0.9637803, 1.222975, 0, 0, 0, 1, 1,
0.5765285, -2.423228, 3.839759, 0, 0, 0, 1, 1,
0.5777181, -0.6101655, 1.042936, 0, 0, 0, 1, 1,
0.5800965, -1.060226, 1.026136, 0, 0, 0, 1, 1,
0.5820028, -0.8107924, 1.555503, 1, 1, 1, 1, 1,
0.5840217, -1.376857, 2.408175, 1, 1, 1, 1, 1,
0.5843759, -0.1555071, 1.907655, 1, 1, 1, 1, 1,
0.5857839, 0.6439741, 0.1916752, 1, 1, 1, 1, 1,
0.5897155, 0.109391, 0.3141599, 1, 1, 1, 1, 1,
0.5917345, 0.748952, -1.701591, 1, 1, 1, 1, 1,
0.5943239, -1.135092, 4.309151, 1, 1, 1, 1, 1,
0.5966333, 0.858546, 1.651887, 1, 1, 1, 1, 1,
0.5988365, 1.2711, -1.443253, 1, 1, 1, 1, 1,
0.5997455, -0.3908941, 2.447138, 1, 1, 1, 1, 1,
0.6010711, 1.664725, -0.4770069, 1, 1, 1, 1, 1,
0.6020191, 0.8803983, -0.2662153, 1, 1, 1, 1, 1,
0.6033321, -0.1175969, 0.9114982, 1, 1, 1, 1, 1,
0.6039088, -0.1152854, 1.406099, 1, 1, 1, 1, 1,
0.6044508, 0.1444307, 2.327932, 1, 1, 1, 1, 1,
0.6102811, 0.1222566, 0.9810522, 0, 0, 1, 1, 1,
0.6157703, -0.3340972, 4.245158, 1, 0, 0, 1, 1,
0.6169634, 0.9179893, -0.6701695, 1, 0, 0, 1, 1,
0.6203845, 0.5622224, 0.9200692, 1, 0, 0, 1, 1,
0.6218362, -0.8876276, 1.392613, 1, 0, 0, 1, 1,
0.6240741, -1.290024, 2.54495, 1, 0, 0, 1, 1,
0.6300493, -0.9068912, 3.068694, 0, 0, 0, 1, 1,
0.6304371, 2.066732, 1.601404, 0, 0, 0, 1, 1,
0.6493463, 1.832296, -0.6894654, 0, 0, 0, 1, 1,
0.6532944, -1.088997, 2.327969, 0, 0, 0, 1, 1,
0.6572399, -0.115931, 1.706346, 0, 0, 0, 1, 1,
0.6582889, -0.03255549, 1.735804, 0, 0, 0, 1, 1,
0.660226, 0.9603946, 0.1699868, 0, 0, 0, 1, 1,
0.660804, 1.501535, -0.3981409, 1, 1, 1, 1, 1,
0.6647982, 2.653645, 0.1697476, 1, 1, 1, 1, 1,
0.6660618, 2.002855, 1.297435, 1, 1, 1, 1, 1,
0.6681915, 0.8266939, 2.006762, 1, 1, 1, 1, 1,
0.6695818, 0.7369016, 0.3846767, 1, 1, 1, 1, 1,
0.6713547, -1.02041, 3.509521, 1, 1, 1, 1, 1,
0.6726574, -0.6507376, 2.126718, 1, 1, 1, 1, 1,
0.6775156, -0.006547245, 1.544455, 1, 1, 1, 1, 1,
0.6789714, -0.1287891, 0.2014731, 1, 1, 1, 1, 1,
0.682984, -0.8819395, 2.560571, 1, 1, 1, 1, 1,
0.6850861, -0.4949688, 3.353454, 1, 1, 1, 1, 1,
0.6890497, 1.537531, -0.255195, 1, 1, 1, 1, 1,
0.6907668, 1.229564, -1.203044, 1, 1, 1, 1, 1,
0.6927984, -0.9236165, 4.0312, 1, 1, 1, 1, 1,
0.694361, 1.202226, -0.2752577, 1, 1, 1, 1, 1,
0.6963001, 0.2291053, 3.550785, 0, 0, 1, 1, 1,
0.6988683, -2.350102, 2.794199, 1, 0, 0, 1, 1,
0.7002034, 0.2190392, 0.9688093, 1, 0, 0, 1, 1,
0.7041333, 0.1941293, 1.943103, 1, 0, 0, 1, 1,
0.7054329, -0.09148546, 1.596927, 1, 0, 0, 1, 1,
0.7072513, -0.2835635, 2.596889, 1, 0, 0, 1, 1,
0.7112195, -0.6533939, 3.847798, 0, 0, 0, 1, 1,
0.7114581, 0.1683518, 1.418842, 0, 0, 0, 1, 1,
0.7137313, 0.01266434, 1.826526, 0, 0, 0, 1, 1,
0.7146876, -1.375256, 3.271897, 0, 0, 0, 1, 1,
0.7159561, -0.04769882, 2.091352, 0, 0, 0, 1, 1,
0.7177792, -0.2769839, 2.997423, 0, 0, 0, 1, 1,
0.7184773, 0.695439, 0.885881, 0, 0, 0, 1, 1,
0.7255526, 0.5200563, 2.230006, 1, 1, 1, 1, 1,
0.7284408, 0.6449754, 1.810179, 1, 1, 1, 1, 1,
0.7300639, -1.277979, 3.500191, 1, 1, 1, 1, 1,
0.734451, -1.535509, 4.050093, 1, 1, 1, 1, 1,
0.7346157, -0.4213836, 3.867594, 1, 1, 1, 1, 1,
0.7350333, -1.29094, 4.320201, 1, 1, 1, 1, 1,
0.7356762, -0.6826044, 1.685176, 1, 1, 1, 1, 1,
0.7356915, 0.7385682, 1.290635, 1, 1, 1, 1, 1,
0.7431145, -0.2217536, 2.210624, 1, 1, 1, 1, 1,
0.745414, 0.7238557, -0.1169636, 1, 1, 1, 1, 1,
0.7480804, -1.133683, 3.004324, 1, 1, 1, 1, 1,
0.7497039, 0.5212085, 0.7901091, 1, 1, 1, 1, 1,
0.7516695, 0.144326, -0.005448525, 1, 1, 1, 1, 1,
0.7555239, 0.7927675, -0.541737, 1, 1, 1, 1, 1,
0.7578594, 0.5926143, -0.1153014, 1, 1, 1, 1, 1,
0.7634797, 1.047615, 1.664919, 0, 0, 1, 1, 1,
0.7644485, -1.138027, 0.6861105, 1, 0, 0, 1, 1,
0.7658942, -0.3748634, 3.16542, 1, 0, 0, 1, 1,
0.7735575, -0.1755752, 1.4326, 1, 0, 0, 1, 1,
0.7793441, 1.739093, 1.061847, 1, 0, 0, 1, 1,
0.7814889, 0.7051835, 0.9183668, 1, 0, 0, 1, 1,
0.7824023, -0.3269001, 2.579622, 0, 0, 0, 1, 1,
0.7849439, -2.09998, 2.26178, 0, 0, 0, 1, 1,
0.7864801, -1.042866, 1.040544, 0, 0, 0, 1, 1,
0.7877089, -0.1921099, 2.789275, 0, 0, 0, 1, 1,
0.7965307, 1.487067, 0.8298398, 0, 0, 0, 1, 1,
0.7971532, -1.285296, 1.83791, 0, 0, 0, 1, 1,
0.8051578, 0.5074452, 0.8226153, 0, 0, 0, 1, 1,
0.8053574, 0.5786502, -0.3637362, 1, 1, 1, 1, 1,
0.809122, 0.2168785, 2.848705, 1, 1, 1, 1, 1,
0.8153496, -1.454127, 1.48352, 1, 1, 1, 1, 1,
0.8185225, -0.2339549, 1.608131, 1, 1, 1, 1, 1,
0.8243933, 0.5616265, 0.3766498, 1, 1, 1, 1, 1,
0.8269849, -0.9402118, 3.861902, 1, 1, 1, 1, 1,
0.8271784, 1.657925, 1.854361, 1, 1, 1, 1, 1,
0.8281714, 0.5080525, 0.9863057, 1, 1, 1, 1, 1,
0.8315096, -0.3245661, 1.287927, 1, 1, 1, 1, 1,
0.8376885, 0.4579149, 1.125624, 1, 1, 1, 1, 1,
0.8376931, -1.442248, 2.012744, 1, 1, 1, 1, 1,
0.8412948, -0.5844464, 1.296925, 1, 1, 1, 1, 1,
0.8436554, -2.089522, 1.538706, 1, 1, 1, 1, 1,
0.843979, -0.992743, 2.874653, 1, 1, 1, 1, 1,
0.8458861, -0.1311129, -0.8937289, 1, 1, 1, 1, 1,
0.8458959, -0.08892705, 1.755317, 0, 0, 1, 1, 1,
0.8484159, -1.293176, 2.533062, 1, 0, 0, 1, 1,
0.8554449, -0.8872533, 1.227971, 1, 0, 0, 1, 1,
0.8583643, 0.2872361, 0.6520001, 1, 0, 0, 1, 1,
0.859354, 0.3025063, 2.494431, 1, 0, 0, 1, 1,
0.8613381, -0.9597762, 2.336462, 1, 0, 0, 1, 1,
0.8637547, -0.3216672, 0.5924477, 0, 0, 0, 1, 1,
0.8673929, 0.6200902, 0.8029605, 0, 0, 0, 1, 1,
0.8908278, 0.06826042, 2.41305, 0, 0, 0, 1, 1,
0.892305, 0.2849873, 2.430939, 0, 0, 0, 1, 1,
0.8973259, 0.9338754, 1.962868, 0, 0, 0, 1, 1,
0.8985367, -0.4767072, 1.853406, 0, 0, 0, 1, 1,
0.9057242, -1.266709, 0.8975269, 0, 0, 0, 1, 1,
0.9066948, -0.3215332, 0.963263, 1, 1, 1, 1, 1,
0.9075497, 0.9752162, -1.32207, 1, 1, 1, 1, 1,
0.9105953, 1.545958, -0.4924622, 1, 1, 1, 1, 1,
0.9132027, -1.702572, 1.978074, 1, 1, 1, 1, 1,
0.9171917, 0.8519104, 0.4147661, 1, 1, 1, 1, 1,
0.9225023, 0.2591772, -0.483162, 1, 1, 1, 1, 1,
0.9239508, -0.8252713, 3.125589, 1, 1, 1, 1, 1,
0.9273387, 0.4357627, 1.507933, 1, 1, 1, 1, 1,
0.9282852, -1.141879, 0.9231029, 1, 1, 1, 1, 1,
0.9290286, -1.781185, 4.174628, 1, 1, 1, 1, 1,
0.9306964, 0.3381964, 3.165977, 1, 1, 1, 1, 1,
0.9404032, -0.9404998, 1.811681, 1, 1, 1, 1, 1,
0.9419012, -0.47844, 3.153144, 1, 1, 1, 1, 1,
0.9434528, -1.487082, 4.042341, 1, 1, 1, 1, 1,
0.9445841, -1.694166, 2.067824, 1, 1, 1, 1, 1,
0.9474609, -0.352837, 2.886875, 0, 0, 1, 1, 1,
0.9496073, -1.644638, 2.309066, 1, 0, 0, 1, 1,
0.9545278, -1.150793, 1.649787, 1, 0, 0, 1, 1,
0.956369, 0.6531683, 0.8709555, 1, 0, 0, 1, 1,
0.9616823, -0.5701325, 3.750769, 1, 0, 0, 1, 1,
0.9630253, 0.4115752, 1.296956, 1, 0, 0, 1, 1,
0.9631391, -0.0529595, 1.065099, 0, 0, 0, 1, 1,
0.967265, -0.6292365, 2.588909, 0, 0, 0, 1, 1,
0.9710873, 0.266019, 3.08603, 0, 0, 0, 1, 1,
0.9716197, -1.858884, 4.547873, 0, 0, 0, 1, 1,
0.9759114, 0.06311527, 1.846937, 0, 0, 0, 1, 1,
0.9812499, 0.01807301, 0.9539791, 0, 0, 0, 1, 1,
0.9835218, 2.060224, -0.1621969, 0, 0, 0, 1, 1,
0.9851658, -0.7146254, 3.707894, 1, 1, 1, 1, 1,
0.9851903, -1.20965, 3.431834, 1, 1, 1, 1, 1,
0.9915318, -0.209201, 1.712781, 1, 1, 1, 1, 1,
0.9938942, 2.057764, 0.4227096, 1, 1, 1, 1, 1,
0.9966671, 0.1477054, 0.08188337, 1, 1, 1, 1, 1,
0.9982604, 1.309489, 2.041701, 1, 1, 1, 1, 1,
1.002293, 0.7889043, 1.047396, 1, 1, 1, 1, 1,
1.003089, -0.9314914, 1.784213, 1, 1, 1, 1, 1,
1.007365, 0.4996758, 2.085413, 1, 1, 1, 1, 1,
1.010799, -0.3587925, 3.478746, 1, 1, 1, 1, 1,
1.011425, 0.6691068, 1.028843, 1, 1, 1, 1, 1,
1.013083, 1.601056, 0.05688866, 1, 1, 1, 1, 1,
1.018195, 0.4135052, 0.8851171, 1, 1, 1, 1, 1,
1.026936, -0.08179956, 2.923573, 1, 1, 1, 1, 1,
1.030163, 1.510188, -0.2468798, 1, 1, 1, 1, 1,
1.040776, -2.439333, 2.996236, 0, 0, 1, 1, 1,
1.048635, -0.2522776, 1.771662, 1, 0, 0, 1, 1,
1.052313, -1.441113, 1.972158, 1, 0, 0, 1, 1,
1.056997, 0.5013496, 0.6304486, 1, 0, 0, 1, 1,
1.06051, 0.9201195, 0.3386431, 1, 0, 0, 1, 1,
1.063817, -0.060144, 1.450095, 1, 0, 0, 1, 1,
1.064, 0.9936928, -0.4095088, 0, 0, 0, 1, 1,
1.064066, -0.8425021, 2.584351, 0, 0, 0, 1, 1,
1.065219, 0.700871, -0.1682343, 0, 0, 0, 1, 1,
1.071076, -0.5205415, 1.766901, 0, 0, 0, 1, 1,
1.073458, -0.4684281, 2.306092, 0, 0, 0, 1, 1,
1.075652, 0.9352244, 2.644654, 0, 0, 0, 1, 1,
1.083504, 0.3892525, 1.472527, 0, 0, 0, 1, 1,
1.088242, 0.07788347, 0.0905832, 1, 1, 1, 1, 1,
1.088769, 0.8762665, 1.696616, 1, 1, 1, 1, 1,
1.090199, -2.749653, 2.764508, 1, 1, 1, 1, 1,
1.105631, 1.399763, -0.0292422, 1, 1, 1, 1, 1,
1.105763, 0.3158824, -0.8541911, 1, 1, 1, 1, 1,
1.107753, 0.9509506, 1.056537, 1, 1, 1, 1, 1,
1.112072, 0.2892368, 1.059186, 1, 1, 1, 1, 1,
1.112225, -1.084328, 1.789103, 1, 1, 1, 1, 1,
1.116214, 0.1773082, 1.289079, 1, 1, 1, 1, 1,
1.121801, -0.3079557, 2.256592, 1, 1, 1, 1, 1,
1.126368, -0.3746871, 1.966599, 1, 1, 1, 1, 1,
1.134105, 0.6490798, 2.584834, 1, 1, 1, 1, 1,
1.154562, -1.360375, 1.341842, 1, 1, 1, 1, 1,
1.15495, -0.9958104, 1.323308, 1, 1, 1, 1, 1,
1.157185, -1.306036, 2.940454, 1, 1, 1, 1, 1,
1.158199, 0.4834669, 0.7024427, 0, 0, 1, 1, 1,
1.167505, 0.8243508, 0.5605842, 1, 0, 0, 1, 1,
1.177619, -2.634351, 1.547494, 1, 0, 0, 1, 1,
1.17784, -1.653756, 1.656946, 1, 0, 0, 1, 1,
1.186137, -0.5806301, 2.335766, 1, 0, 0, 1, 1,
1.186156, 0.3586066, 0.8423795, 1, 0, 0, 1, 1,
1.189661, 1.19554, -0.3083065, 0, 0, 0, 1, 1,
1.197086, 1.238996, 0.4858199, 0, 0, 0, 1, 1,
1.20309, 1.546872, 1.244505, 0, 0, 0, 1, 1,
1.206626, -0.5179102, 2.560107, 0, 0, 0, 1, 1,
1.253916, 1.266644, 0.05623818, 0, 0, 0, 1, 1,
1.26383, 0.191947, 1.225381, 0, 0, 0, 1, 1,
1.265, -0.5855306, 3.000895, 0, 0, 0, 1, 1,
1.271147, -0.7902223, 3.668382, 1, 1, 1, 1, 1,
1.276657, -0.2199196, 1.934424, 1, 1, 1, 1, 1,
1.290334, 1.232732, 0.7706158, 1, 1, 1, 1, 1,
1.298189, -0.9527786, 2.570426, 1, 1, 1, 1, 1,
1.301304, -1.058719, 1.979653, 1, 1, 1, 1, 1,
1.307766, -0.7568763, 1.97235, 1, 1, 1, 1, 1,
1.319913, -0.8534426, 2.710039, 1, 1, 1, 1, 1,
1.324795, -1.264095, 3.369575, 1, 1, 1, 1, 1,
1.326262, -0.5087687, 1.762364, 1, 1, 1, 1, 1,
1.338787, 0.595679, 2.997994, 1, 1, 1, 1, 1,
1.339184, -1.197248, 3.735554, 1, 1, 1, 1, 1,
1.365396, -0.2561692, 1.868914, 1, 1, 1, 1, 1,
1.367507, -2.064318, 3.995615, 1, 1, 1, 1, 1,
1.385502, -0.6943619, 3.577778, 1, 1, 1, 1, 1,
1.387325, -1.136325, 2.0697, 1, 1, 1, 1, 1,
1.387821, 1.26399, 1.049366, 0, 0, 1, 1, 1,
1.393705, 0.9443509, -0.05804825, 1, 0, 0, 1, 1,
1.401368, -0.08607817, 2.779226, 1, 0, 0, 1, 1,
1.403239, 0.356243, 1.519917, 1, 0, 0, 1, 1,
1.407842, 0.3336535, 2.263421, 1, 0, 0, 1, 1,
1.408866, -0.04673729, 2.834307, 1, 0, 0, 1, 1,
1.416107, 0.1284294, 0.8951493, 0, 0, 0, 1, 1,
1.448072, -1.348748, 2.787784, 0, 0, 0, 1, 1,
1.456283, -1.36603, 1.735805, 0, 0, 0, 1, 1,
1.466112, -1.527699, 2.390563, 0, 0, 0, 1, 1,
1.470469, -1.185117, 0.6773931, 0, 0, 0, 1, 1,
1.471305, 0.05402882, 1.387814, 0, 0, 0, 1, 1,
1.48488, -0.3334718, 0.6200379, 0, 0, 0, 1, 1,
1.485639, 0.5023116, 0.5341495, 1, 1, 1, 1, 1,
1.510381, 0.8395781, 0.4025889, 1, 1, 1, 1, 1,
1.514103, -1.131622, 3.698693, 1, 1, 1, 1, 1,
1.522352, -0.1869777, 2.027426, 1, 1, 1, 1, 1,
1.524918, -0.5480629, 3.885221, 1, 1, 1, 1, 1,
1.531243, 1.717699, 1.831012, 1, 1, 1, 1, 1,
1.531669, -0.112085, 2.448407, 1, 1, 1, 1, 1,
1.536624, -0.6364011, 0.5741298, 1, 1, 1, 1, 1,
1.537061, -1.22013, 2.940059, 1, 1, 1, 1, 1,
1.553081, 0.6401983, 1.930555, 1, 1, 1, 1, 1,
1.557127, -0.3902299, 1.625572, 1, 1, 1, 1, 1,
1.557866, -0.05453888, 1.708804, 1, 1, 1, 1, 1,
1.581354, 0.5034829, 1.084858, 1, 1, 1, 1, 1,
1.584028, 2.02587, 0.4620841, 1, 1, 1, 1, 1,
1.593477, 0.2979668, 1.599676, 1, 1, 1, 1, 1,
1.595959, 1.661298, 0.6111312, 0, 0, 1, 1, 1,
1.599554, 0.642133, 0.2343272, 1, 0, 0, 1, 1,
1.600042, 0.4245218, 2.436316, 1, 0, 0, 1, 1,
1.607939, 1.854698, -0.1403747, 1, 0, 0, 1, 1,
1.609107, 1.094076, 0.09655053, 1, 0, 0, 1, 1,
1.612771, 1.19872, 1.401821, 1, 0, 0, 1, 1,
1.613225, -1.090573, 2.555901, 0, 0, 0, 1, 1,
1.633435, 0.7611797, 2.877017, 0, 0, 0, 1, 1,
1.646417, 1.313169, 2.795066, 0, 0, 0, 1, 1,
1.654073, -0.3142462, 0.9550263, 0, 0, 0, 1, 1,
1.663159, 0.4989884, 1.916925, 0, 0, 0, 1, 1,
1.679305, 0.1270668, 2.366645, 0, 0, 0, 1, 1,
1.6846, -0.6142739, 2.998522, 0, 0, 0, 1, 1,
1.703435, 1.522294, 0.8470827, 1, 1, 1, 1, 1,
1.715726, 0.2720246, 1.495596, 1, 1, 1, 1, 1,
1.719806, -1.039663, 1.669375, 1, 1, 1, 1, 1,
1.720799, 0.7974727, -0.1076436, 1, 1, 1, 1, 1,
1.727611, -1.016515, 2.458994, 1, 1, 1, 1, 1,
1.747709, 1.470412, 0.5364223, 1, 1, 1, 1, 1,
1.773583, -0.4372683, 1.936882, 1, 1, 1, 1, 1,
1.806489, -0.208455, 0.4108249, 1, 1, 1, 1, 1,
1.807739, -1.311399, 1.248806, 1, 1, 1, 1, 1,
1.821814, 2.190948, 0.07780122, 1, 1, 1, 1, 1,
1.854666, 0.63572, 1.264964, 1, 1, 1, 1, 1,
1.892516, 0.3167145, 0.04312155, 1, 1, 1, 1, 1,
1.897746, -0.4511152, 1.521924, 1, 1, 1, 1, 1,
1.900955, 1.563412, 0.1183108, 1, 1, 1, 1, 1,
1.905622, -0.6019691, 1.49338, 1, 1, 1, 1, 1,
1.9402, -0.03201339, 1.971849, 0, 0, 1, 1, 1,
1.954189, 2.402336, -0.6079867, 1, 0, 0, 1, 1,
1.967029, 0.6361685, 0.4237719, 1, 0, 0, 1, 1,
1.970309, -0.00601743, 0.8158882, 1, 0, 0, 1, 1,
1.981391, 0.5025586, 1.609271, 1, 0, 0, 1, 1,
1.996639, 0.7439456, -0.07164852, 1, 0, 0, 1, 1,
2.021404, 0.02438296, 1.857296, 0, 0, 0, 1, 1,
2.047395, 0.5437913, 0.4547929, 0, 0, 0, 1, 1,
2.111252, 0.8282968, 1.595301, 0, 0, 0, 1, 1,
2.125433, 1.997387, 1.95812, 0, 0, 0, 1, 1,
2.151204, -1.880078, 1.294293, 0, 0, 0, 1, 1,
2.202237, 1.954318, 0.3229662, 0, 0, 0, 1, 1,
2.271623, 2.095611, 0.7776695, 0, 0, 0, 1, 1,
2.414404, -1.656898, 2.601468, 1, 1, 1, 1, 1,
2.421456, -1.065759, 1.7182, 1, 1, 1, 1, 1,
2.492849, -0.5422705, 2.588753, 1, 1, 1, 1, 1,
2.728203, -0.7200579, 0.6997242, 1, 1, 1, 1, 1,
2.912643, -0.7140216, 1.953732, 1, 1, 1, 1, 1,
3.056753, 0.03262466, 1.800094, 1, 1, 1, 1, 1,
3.104702, -0.4169487, 3.505128, 1, 1, 1, 1, 1
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
var radius = 9.469057;
var distance = 33.25966;
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
mvMatrix.translate( 0.09970379, 0.2882874, 0.05394816 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.25966);
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
