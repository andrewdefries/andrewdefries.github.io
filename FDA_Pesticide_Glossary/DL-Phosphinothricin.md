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
-3.083979, 0.4361468, 1.358806, 1, 0, 0, 1,
-2.873683, -0.5814188, -1.657068, 1, 0.007843138, 0, 1,
-2.873465, 0.3557681, -1.42354, 1, 0.01176471, 0, 1,
-2.847906, 0.3078028, -1.625385, 1, 0.01960784, 0, 1,
-2.783445, 0.5440438, -2.165618, 1, 0.02352941, 0, 1,
-2.765682, 1.511853, -1.517287, 1, 0.03137255, 0, 1,
-2.765018, 0.9764456, -0.2067182, 1, 0.03529412, 0, 1,
-2.743623, 0.4931604, -1.953177, 1, 0.04313726, 0, 1,
-2.694403, -1.197051, -2.454604, 1, 0.04705882, 0, 1,
-2.591456, -0.4419815, -2.714367, 1, 0.05490196, 0, 1,
-2.44305, -0.6887058, -2.892799, 1, 0.05882353, 0, 1,
-2.423244, -0.3476471, -0.4166577, 1, 0.06666667, 0, 1,
-2.415909, -1.038114, -2.59899, 1, 0.07058824, 0, 1,
-2.392186, 0.8386962, -3.198451, 1, 0.07843138, 0, 1,
-2.343844, 0.7106847, -2.590703, 1, 0.08235294, 0, 1,
-2.303222, 0.3966988, -0.546198, 1, 0.09019608, 0, 1,
-2.297421, -0.3175188, -2.163195, 1, 0.09411765, 0, 1,
-2.226864, -1.00586, -2.768743, 1, 0.1019608, 0, 1,
-2.185092, 1.072935, -1.598315, 1, 0.1098039, 0, 1,
-2.177531, -1.158928, -2.405232, 1, 0.1137255, 0, 1,
-2.174408, 0.08426661, -1.560107, 1, 0.1215686, 0, 1,
-2.158155, 0.8303238, -2.416445, 1, 0.1254902, 0, 1,
-2.153273, 0.02843954, -1.380741, 1, 0.1333333, 0, 1,
-2.100631, -0.4062679, -2.082514, 1, 0.1372549, 0, 1,
-2.0854, -1.014558, -2.06514, 1, 0.145098, 0, 1,
-2.057262, -1.326664, -2.909889, 1, 0.1490196, 0, 1,
-2.043485, 0.5185685, -0.5047038, 1, 0.1568628, 0, 1,
-2.003569, 0.4957254, -0.4843634, 1, 0.1607843, 0, 1,
-1.974214, 0.6575564, -2.61784, 1, 0.1686275, 0, 1,
-1.934981, 0.3902139, 0.2114901, 1, 0.172549, 0, 1,
-1.885447, 1.404342, -0.8258469, 1, 0.1803922, 0, 1,
-1.885425, -0.5542558, -3.730377, 1, 0.1843137, 0, 1,
-1.884871, 0.2868034, -1.623425, 1, 0.1921569, 0, 1,
-1.883168, 1.087089, -0.7370056, 1, 0.1960784, 0, 1,
-1.869322, -0.2893779, -1.817151, 1, 0.2039216, 0, 1,
-1.867741, -1.180721, -1.870761, 1, 0.2117647, 0, 1,
-1.863696, 2.438548, -0.6863655, 1, 0.2156863, 0, 1,
-1.85479, -0.726881, -3.17209, 1, 0.2235294, 0, 1,
-1.82129, 0.929208, -2.05879, 1, 0.227451, 0, 1,
-1.814091, -0.7478516, -1.876904, 1, 0.2352941, 0, 1,
-1.797985, -0.7194543, -3.873076, 1, 0.2392157, 0, 1,
-1.769721, 0.1258054, -0.06398571, 1, 0.2470588, 0, 1,
-1.760249, -0.06748591, -1.955046, 1, 0.2509804, 0, 1,
-1.752815, -1.045457, -1.770425, 1, 0.2588235, 0, 1,
-1.738297, 0.9697925, -0.5588151, 1, 0.2627451, 0, 1,
-1.731602, 1.24653, -1.179607, 1, 0.2705882, 0, 1,
-1.722933, -0.09566512, -1.266157, 1, 0.2745098, 0, 1,
-1.716519, 1.232756, -0.5381708, 1, 0.282353, 0, 1,
-1.706458, 0.4755205, -1.066446, 1, 0.2862745, 0, 1,
-1.694782, -0.8019568, -0.9022142, 1, 0.2941177, 0, 1,
-1.691048, 1.72278, -1.007386, 1, 0.3019608, 0, 1,
-1.681543, -1.571318, -2.044068, 1, 0.3058824, 0, 1,
-1.67183, 0.7553693, -2.042001, 1, 0.3137255, 0, 1,
-1.656161, 0.4131741, -2.174804, 1, 0.3176471, 0, 1,
-1.6457, -0.5904868, -1.238089, 1, 0.3254902, 0, 1,
-1.645591, -0.9474915, 1.131796, 1, 0.3294118, 0, 1,
-1.64232, -1.357971, -2.830541, 1, 0.3372549, 0, 1,
-1.640372, -2.121672, -2.729842, 1, 0.3411765, 0, 1,
-1.635132, -1.608994, -2.070987, 1, 0.3490196, 0, 1,
-1.634689, 0.3438732, -0.1692623, 1, 0.3529412, 0, 1,
-1.634501, 1.225292, 0.1809458, 1, 0.3607843, 0, 1,
-1.62353, 0.1848618, -0.5060695, 1, 0.3647059, 0, 1,
-1.606829, 0.3004795, -1.211515, 1, 0.372549, 0, 1,
-1.6066, 0.2247209, -0.3227892, 1, 0.3764706, 0, 1,
-1.598068, -1.529794, -3.394602, 1, 0.3843137, 0, 1,
-1.582966, -0.1024351, -0.06687105, 1, 0.3882353, 0, 1,
-1.57311, -1.046391, -3.317115, 1, 0.3960784, 0, 1,
-1.571018, -1.261988, -1.726379, 1, 0.4039216, 0, 1,
-1.566209, 0.3870804, 0.1894075, 1, 0.4078431, 0, 1,
-1.540582, -0.08377668, -2.042265, 1, 0.4156863, 0, 1,
-1.52231, 1.416807, -0.7457144, 1, 0.4196078, 0, 1,
-1.516022, 0.3091507, -1.537631, 1, 0.427451, 0, 1,
-1.509083, 0.9443203, 1.203304, 1, 0.4313726, 0, 1,
-1.504143, -0.6354885, -1.491793, 1, 0.4392157, 0, 1,
-1.50384, -0.1361933, -0.7476768, 1, 0.4431373, 0, 1,
-1.479209, -1.116661, -2.075078, 1, 0.4509804, 0, 1,
-1.476705, 0.6975458, -0.8265741, 1, 0.454902, 0, 1,
-1.474362, 1.694084, -1.376268, 1, 0.4627451, 0, 1,
-1.470738, -0.7199833, -0.7412767, 1, 0.4666667, 0, 1,
-1.437977, -1.030148, -0.6969348, 1, 0.4745098, 0, 1,
-1.430311, -0.7840305, -3.527769, 1, 0.4784314, 0, 1,
-1.429871, 0.2993155, -1.511257, 1, 0.4862745, 0, 1,
-1.423305, 0.1284362, -0.3278224, 1, 0.4901961, 0, 1,
-1.421803, -0.4977556, -0.9030672, 1, 0.4980392, 0, 1,
-1.417934, 0.2095119, -2.325311, 1, 0.5058824, 0, 1,
-1.415775, 0.5983892, -2.601858, 1, 0.509804, 0, 1,
-1.404077, -0.2555805, -0.9918564, 1, 0.5176471, 0, 1,
-1.397742, 1.348871, -1.200138, 1, 0.5215687, 0, 1,
-1.391605, 0.2422743, -1.407633, 1, 0.5294118, 0, 1,
-1.386793, -1.455167, -4.015489, 1, 0.5333334, 0, 1,
-1.381252, 0.5577381, 0.6964381, 1, 0.5411765, 0, 1,
-1.372112, -0.506403, -2.893072, 1, 0.5450981, 0, 1,
-1.371889, 1.448176, 0.3224871, 1, 0.5529412, 0, 1,
-1.370416, -0.8117493, -2.781602, 1, 0.5568628, 0, 1,
-1.367357, -0.5002494, -2.499641, 1, 0.5647059, 0, 1,
-1.35173, -0.05973807, -3.136981, 1, 0.5686275, 0, 1,
-1.342359, -0.339102, -2.79459, 1, 0.5764706, 0, 1,
-1.328648, -0.1145835, -1.597924, 1, 0.5803922, 0, 1,
-1.323763, 0.373639, -0.9185283, 1, 0.5882353, 0, 1,
-1.322118, -1.071895, -1.96045, 1, 0.5921569, 0, 1,
-1.306554, -0.5658627, -3.736316, 1, 0.6, 0, 1,
-1.303389, 0.7130471, -0.9283952, 1, 0.6078432, 0, 1,
-1.285084, -0.8243933, -1.307319, 1, 0.6117647, 0, 1,
-1.264075, -0.5663247, -3.095797, 1, 0.6196079, 0, 1,
-1.248253, 1.251386, -1.011021, 1, 0.6235294, 0, 1,
-1.246899, 0.2231569, -1.531774, 1, 0.6313726, 0, 1,
-1.233761, -1.281347, -3.588202, 1, 0.6352941, 0, 1,
-1.228567, -0.5978982, -1.393183, 1, 0.6431373, 0, 1,
-1.226197, 1.535971, -0.6566446, 1, 0.6470588, 0, 1,
-1.215607, 0.7461407, -1.285149, 1, 0.654902, 0, 1,
-1.212919, 0.246245, -1.985956, 1, 0.6588235, 0, 1,
-1.21075, 0.6804608, -0.6279583, 1, 0.6666667, 0, 1,
-1.204542, -0.9137793, -1.288666, 1, 0.6705883, 0, 1,
-1.186782, -0.03986192, -2.986295, 1, 0.6784314, 0, 1,
-1.182361, 2.094872, -0.07240252, 1, 0.682353, 0, 1,
-1.175479, 0.2240132, -1.709358, 1, 0.6901961, 0, 1,
-1.174579, 1.641426, -1.277102, 1, 0.6941177, 0, 1,
-1.171418, 1.874603, 1.323088, 1, 0.7019608, 0, 1,
-1.166992, -0.05842074, -0.08455471, 1, 0.7098039, 0, 1,
-1.152109, 0.6144015, -0.048419, 1, 0.7137255, 0, 1,
-1.150551, 1.502729, -1.536259, 1, 0.7215686, 0, 1,
-1.144567, 0.7780994, -0.2120136, 1, 0.7254902, 0, 1,
-1.137461, -1.179719, -1.743219, 1, 0.7333333, 0, 1,
-1.137237, -0.02864672, -1.300569, 1, 0.7372549, 0, 1,
-1.136319, -1.683172, -1.807913, 1, 0.7450981, 0, 1,
-1.135887, 0.633773, -1.754104, 1, 0.7490196, 0, 1,
-1.134141, -0.01631874, -1.800869, 1, 0.7568628, 0, 1,
-1.133248, 1.350665, -2.490641, 1, 0.7607843, 0, 1,
-1.125236, -0.404824, -1.899019, 1, 0.7686275, 0, 1,
-1.124777, 0.1068814, -0.2744566, 1, 0.772549, 0, 1,
-1.122847, -1.54028, -2.569545, 1, 0.7803922, 0, 1,
-1.122155, 0.6147905, -2.068397, 1, 0.7843137, 0, 1,
-1.121256, -0.07974304, -3.326529, 1, 0.7921569, 0, 1,
-1.118574, -0.8305007, -2.730334, 1, 0.7960784, 0, 1,
-1.112867, 0.7038665, 0.1066117, 1, 0.8039216, 0, 1,
-1.107908, 0.3354976, -0.4347734, 1, 0.8117647, 0, 1,
-1.10624, -1.223657, -1.506012, 1, 0.8156863, 0, 1,
-1.103818, -1.06788, -2.501538, 1, 0.8235294, 0, 1,
-1.10229, -1.099284, -2.774823, 1, 0.827451, 0, 1,
-1.10223, 0.03768006, -4.099246, 1, 0.8352941, 0, 1,
-1.078784, 2.424586, -0.4088985, 1, 0.8392157, 0, 1,
-1.075472, -0.3158868, -0.4925533, 1, 0.8470588, 0, 1,
-1.067028, 0.07540319, -1.617656, 1, 0.8509804, 0, 1,
-1.065969, -0.8689748, -1.844325, 1, 0.8588235, 0, 1,
-1.059618, 1.10187, 0.1943287, 1, 0.8627451, 0, 1,
-1.059101, 0.1828088, -3.631074, 1, 0.8705882, 0, 1,
-1.056206, 0.0984271, -0.518914, 1, 0.8745098, 0, 1,
-1.056019, 1.187743, -2.192033, 1, 0.8823529, 0, 1,
-1.053632, 0.9072108, -0.1381747, 1, 0.8862745, 0, 1,
-1.050099, 0.2576741, -2.636031, 1, 0.8941177, 0, 1,
-1.045449, 0.05249982, -0.6935046, 1, 0.8980392, 0, 1,
-1.042751, 0.05217275, 0.08811426, 1, 0.9058824, 0, 1,
-1.040323, -0.2869201, -0.5171742, 1, 0.9137255, 0, 1,
-1.038518, -1.122249, -2.192391, 1, 0.9176471, 0, 1,
-1.033715, -0.2317419, -2.080905, 1, 0.9254902, 0, 1,
-1.029962, 0.6562665, -1.614137, 1, 0.9294118, 0, 1,
-1.026371, 1.067011, -0.1959417, 1, 0.9372549, 0, 1,
-1.02293, 0.2537398, 0.01624562, 1, 0.9411765, 0, 1,
-1.018092, -1.841171, -1.456509, 1, 0.9490196, 0, 1,
-1.016368, -0.1608254, -0.5689203, 1, 0.9529412, 0, 1,
-1.015801, 0.2945619, -1.753548, 1, 0.9607843, 0, 1,
-1.013265, 0.8566733, 0.9843289, 1, 0.9647059, 0, 1,
-1.00857, -0.3333952, -3.396048, 1, 0.972549, 0, 1,
-0.9955872, 0.5394933, -2.223653, 1, 0.9764706, 0, 1,
-0.9940903, -0.679749, -2.619, 1, 0.9843137, 0, 1,
-0.9882081, -1.540861, -2.263431, 1, 0.9882353, 0, 1,
-0.9877324, -0.26223, -2.438148, 1, 0.9960784, 0, 1,
-0.9842932, 1.202239, -0.3748317, 0.9960784, 1, 0, 1,
-0.9785039, -1.137819, -1.82468, 0.9921569, 1, 0, 1,
-0.9719209, 0.08689966, 0.4383947, 0.9843137, 1, 0, 1,
-0.9610742, 0.891553, 0.4595578, 0.9803922, 1, 0, 1,
-0.9610571, -0.9327666, -1.687863, 0.972549, 1, 0, 1,
-0.9531024, 0.820847, -0.8240492, 0.9686275, 1, 0, 1,
-0.9529861, -0.5815459, -1.715633, 0.9607843, 1, 0, 1,
-0.9496881, 0.9652373, -0.2783643, 0.9568627, 1, 0, 1,
-0.9273679, -0.353774, -3.380689, 0.9490196, 1, 0, 1,
-0.9273103, 1.468149, -2.000201, 0.945098, 1, 0, 1,
-0.925976, 1.269837, 0.5423184, 0.9372549, 1, 0, 1,
-0.9214869, -0.02460294, -2.116621, 0.9333333, 1, 0, 1,
-0.9214178, -0.1386099, -0.5063816, 0.9254902, 1, 0, 1,
-0.920696, 0.2403735, -1.948522, 0.9215686, 1, 0, 1,
-0.9179897, 0.002956361, -1.774585, 0.9137255, 1, 0, 1,
-0.9112651, -0.6104825, -3.246815, 0.9098039, 1, 0, 1,
-0.9027568, -0.801292, -4.120064, 0.9019608, 1, 0, 1,
-0.9007734, -1.278833, -2.698357, 0.8941177, 1, 0, 1,
-0.8998858, 0.6072206, -1.913578, 0.8901961, 1, 0, 1,
-0.886022, -1.148325, -2.632388, 0.8823529, 1, 0, 1,
-0.8795313, -1.089421, -1.425046, 0.8784314, 1, 0, 1,
-0.8786109, -1.526789, -4.128512, 0.8705882, 1, 0, 1,
-0.8783202, -0.8936706, -2.149436, 0.8666667, 1, 0, 1,
-0.8746439, 0.09305997, -2.395716, 0.8588235, 1, 0, 1,
-0.8648586, 0.8359798, -0.8263125, 0.854902, 1, 0, 1,
-0.8468621, -0.3634715, -1.26285, 0.8470588, 1, 0, 1,
-0.8251822, 1.279809, -0.4571496, 0.8431373, 1, 0, 1,
-0.8220777, -0.2938534, -0.4522566, 0.8352941, 1, 0, 1,
-0.8213464, -0.7918389, -1.812156, 0.8313726, 1, 0, 1,
-0.8157563, 1.176463, -1.284059, 0.8235294, 1, 0, 1,
-0.8104346, -1.013232, -2.156389, 0.8196079, 1, 0, 1,
-0.7987137, -0.06607892, -3.683201, 0.8117647, 1, 0, 1,
-0.793131, 0.22995, -2.099915, 0.8078431, 1, 0, 1,
-0.7779099, 0.1176651, -1.249995, 0.8, 1, 0, 1,
-0.7758532, 1.25753, -0.7181906, 0.7921569, 1, 0, 1,
-0.7733879, 0.247177, -1.039507, 0.7882353, 1, 0, 1,
-0.7694818, -0.841278, -1.721058, 0.7803922, 1, 0, 1,
-0.7686408, 2.016773, -0.4119321, 0.7764706, 1, 0, 1,
-0.7686207, 0.9445946, -0.5595213, 0.7686275, 1, 0, 1,
-0.762888, 1.828331, -0.1838958, 0.7647059, 1, 0, 1,
-0.7626253, -0.3302087, -0.4191318, 0.7568628, 1, 0, 1,
-0.7605727, 0.3995752, -1.23044, 0.7529412, 1, 0, 1,
-0.7588146, -0.1177725, 0.3276964, 0.7450981, 1, 0, 1,
-0.7554787, -0.5896993, -2.211811, 0.7411765, 1, 0, 1,
-0.7534714, -0.5718137, -0.6142533, 0.7333333, 1, 0, 1,
-0.7521948, 0.9933403, -1.530029, 0.7294118, 1, 0, 1,
-0.7510728, 1.195571, 0.8586926, 0.7215686, 1, 0, 1,
-0.7490095, -1.28222, -3.250784, 0.7176471, 1, 0, 1,
-0.7480214, -0.01417837, -0.8938902, 0.7098039, 1, 0, 1,
-0.7472972, 0.656879, -0.968141, 0.7058824, 1, 0, 1,
-0.7465814, 1.307167, -0.4218521, 0.6980392, 1, 0, 1,
-0.7429454, 1.155982, -1.587447, 0.6901961, 1, 0, 1,
-0.7404874, -0.02778705, -3.171334, 0.6862745, 1, 0, 1,
-0.7396789, 0.01577663, -2.232422, 0.6784314, 1, 0, 1,
-0.7388546, -0.233611, -1.537355, 0.6745098, 1, 0, 1,
-0.7379133, -0.716696, -2.815069, 0.6666667, 1, 0, 1,
-0.737337, 0.3032341, -1.546267, 0.6627451, 1, 0, 1,
-0.7260196, -1.306335, -0.9977221, 0.654902, 1, 0, 1,
-0.7218521, -0.5071236, -2.301232, 0.6509804, 1, 0, 1,
-0.7183278, -1.099306, -1.674154, 0.6431373, 1, 0, 1,
-0.7155538, 0.1825528, -0.1433286, 0.6392157, 1, 0, 1,
-0.7139366, -0.2390278, -0.921227, 0.6313726, 1, 0, 1,
-0.7073372, 1.921814, -0.2207367, 0.627451, 1, 0, 1,
-0.7059426, 0.3416339, -0.5833133, 0.6196079, 1, 0, 1,
-0.704783, 0.847294, -0.9429144, 0.6156863, 1, 0, 1,
-0.6967397, 0.658954, -0.09086934, 0.6078432, 1, 0, 1,
-0.694034, -0.8524807, -1.973832, 0.6039216, 1, 0, 1,
-0.6928934, 0.09558126, -1.696692, 0.5960785, 1, 0, 1,
-0.6897838, -1.860061, -3.953615, 0.5882353, 1, 0, 1,
-0.6823534, -2.521367, -2.004123, 0.5843138, 1, 0, 1,
-0.6811504, -0.00187592, -0.9046952, 0.5764706, 1, 0, 1,
-0.6786686, 1.257066, -1.149978, 0.572549, 1, 0, 1,
-0.6758281, -0.437254, -2.373145, 0.5647059, 1, 0, 1,
-0.6743773, 0.6096156, 0.2105277, 0.5607843, 1, 0, 1,
-0.6698843, 0.08396333, -0.2057711, 0.5529412, 1, 0, 1,
-0.6662821, 0.9038213, -1.403456, 0.5490196, 1, 0, 1,
-0.6646003, -1.839189, -2.421629, 0.5411765, 1, 0, 1,
-0.6598074, -2.62344, -1.399353, 0.5372549, 1, 0, 1,
-0.6575437, -0.8023915, -1.596637, 0.5294118, 1, 0, 1,
-0.6515027, 0.9746501, -0.7407463, 0.5254902, 1, 0, 1,
-0.6446959, -0.1666797, -1.891721, 0.5176471, 1, 0, 1,
-0.6438079, 0.3287404, 0.4324571, 0.5137255, 1, 0, 1,
-0.6409432, -0.2084298, -1.75851, 0.5058824, 1, 0, 1,
-0.6382113, -0.7505762, -3.341407, 0.5019608, 1, 0, 1,
-0.6375313, 1.24004, 1.38915, 0.4941176, 1, 0, 1,
-0.6352293, 0.9930253, -0.7015159, 0.4862745, 1, 0, 1,
-0.6351442, 0.5049531, -0.3980897, 0.4823529, 1, 0, 1,
-0.6323865, 1.414894, -2.075099, 0.4745098, 1, 0, 1,
-0.629033, 0.4790514, -0.3242557, 0.4705882, 1, 0, 1,
-0.6223642, -2.068812, -2.589597, 0.4627451, 1, 0, 1,
-0.616307, -0.5229638, -2.425623, 0.4588235, 1, 0, 1,
-0.6090536, -0.7588649, -0.5589606, 0.4509804, 1, 0, 1,
-0.6084909, -0.06343812, -3.546493, 0.4470588, 1, 0, 1,
-0.6073688, 0.08585002, 0.5419804, 0.4392157, 1, 0, 1,
-0.6043155, 2.036981, 0.8898705, 0.4352941, 1, 0, 1,
-0.6024138, 0.4987342, -1.198441, 0.427451, 1, 0, 1,
-0.5973973, -0.03446407, -2.216353, 0.4235294, 1, 0, 1,
-0.5902997, -1.030712, -2.134733, 0.4156863, 1, 0, 1,
-0.5894448, -1.11614, -3.092981, 0.4117647, 1, 0, 1,
-0.5860423, -0.3865242, -1.711344, 0.4039216, 1, 0, 1,
-0.586006, 0.5812342, -1.03115, 0.3960784, 1, 0, 1,
-0.5826663, -0.5825218, -3.315618, 0.3921569, 1, 0, 1,
-0.5818614, -0.5658724, -4.686551, 0.3843137, 1, 0, 1,
-0.5807904, 0.1587853, 1.367859, 0.3803922, 1, 0, 1,
-0.5782292, 0.7954293, -1.662102, 0.372549, 1, 0, 1,
-0.5767072, 2.377488, 1.436062, 0.3686275, 1, 0, 1,
-0.5766085, -0.444963, -3.301862, 0.3607843, 1, 0, 1,
-0.5760052, -2.066124, -1.709281, 0.3568628, 1, 0, 1,
-0.5715107, 1.091499, -0.789318, 0.3490196, 1, 0, 1,
-0.5694976, 0.6962804, 0.1769028, 0.345098, 1, 0, 1,
-0.5689116, -1.420322, -3.290331, 0.3372549, 1, 0, 1,
-0.5655531, -0.4599117, -0.541399, 0.3333333, 1, 0, 1,
-0.5633715, 0.8100893, -1.649535, 0.3254902, 1, 0, 1,
-0.5600533, 0.5474577, -0.2636351, 0.3215686, 1, 0, 1,
-0.557819, 1.657788, -0.2737153, 0.3137255, 1, 0, 1,
-0.55136, 0.8042755, -1.173144, 0.3098039, 1, 0, 1,
-0.5507671, -1.841227, -3.237073, 0.3019608, 1, 0, 1,
-0.5487707, 0.9445685, -1.012278, 0.2941177, 1, 0, 1,
-0.5482869, 1.427805, 1.092571, 0.2901961, 1, 0, 1,
-0.5423343, 0.6642129, -0.01884867, 0.282353, 1, 0, 1,
-0.5377417, 1.74064, -0.5906392, 0.2784314, 1, 0, 1,
-0.5284361, -1.097842, -2.274911, 0.2705882, 1, 0, 1,
-0.5223503, 1.381793, -2.593975, 0.2666667, 1, 0, 1,
-0.5192576, -0.8986742, -3.265347, 0.2588235, 1, 0, 1,
-0.5178979, -0.04645995, 0.7580811, 0.254902, 1, 0, 1,
-0.5167147, 1.115261, 1.120893, 0.2470588, 1, 0, 1,
-0.512098, 1.18889, 1.376816, 0.2431373, 1, 0, 1,
-0.5095515, 0.361911, -1.460983, 0.2352941, 1, 0, 1,
-0.5091134, 0.2302175, -0.2423644, 0.2313726, 1, 0, 1,
-0.5029765, -0.8171683, -2.028803, 0.2235294, 1, 0, 1,
-0.5023855, 0.3177391, -1.725462, 0.2196078, 1, 0, 1,
-0.5020247, -0.3980244, -1.644519, 0.2117647, 1, 0, 1,
-0.5017848, -1.045232, -3.311752, 0.2078431, 1, 0, 1,
-0.4958714, 0.1776002, -0.4765957, 0.2, 1, 0, 1,
-0.4886572, 2.45047, -0.0046465, 0.1921569, 1, 0, 1,
-0.4882694, 0.6686937, -0.4638597, 0.1882353, 1, 0, 1,
-0.4861684, -0.378827, -2.698004, 0.1803922, 1, 0, 1,
-0.4861622, -0.829141, -1.002326, 0.1764706, 1, 0, 1,
-0.4848383, 0.4308467, -2.097537, 0.1686275, 1, 0, 1,
-0.4833486, 1.379009, -0.2501781, 0.1647059, 1, 0, 1,
-0.4825668, 0.1027761, -0.5147871, 0.1568628, 1, 0, 1,
-0.4788225, 0.2269834, -2.753017, 0.1529412, 1, 0, 1,
-0.4780576, 0.8712712, -0.9067883, 0.145098, 1, 0, 1,
-0.4673787, -0.2423104, -1.713058, 0.1411765, 1, 0, 1,
-0.4644341, -1.378964, -2.000127, 0.1333333, 1, 0, 1,
-0.4614793, 1.591073, -0.563978, 0.1294118, 1, 0, 1,
-0.4603858, 0.4258029, 0.1052188, 0.1215686, 1, 0, 1,
-0.4577482, -2.746175, -1.940885, 0.1176471, 1, 0, 1,
-0.4552787, -0.791506, -2.214373, 0.1098039, 1, 0, 1,
-0.4551348, 0.424168, -1.498672, 0.1058824, 1, 0, 1,
-0.4492589, 0.2444481, -1.698015, 0.09803922, 1, 0, 1,
-0.4486006, 0.8411488, -0.8709624, 0.09019608, 1, 0, 1,
-0.4398706, -1.40338, -3.226163, 0.08627451, 1, 0, 1,
-0.4326327, -0.9081779, -1.923345, 0.07843138, 1, 0, 1,
-0.4265682, -0.7439969, -3.597638, 0.07450981, 1, 0, 1,
-0.4260164, 0.7487049, -0.85013, 0.06666667, 1, 0, 1,
-0.4173947, 0.1575308, -0.4027432, 0.0627451, 1, 0, 1,
-0.4158777, 1.086626, 0.3784925, 0.05490196, 1, 0, 1,
-0.414356, -0.950481, -2.237863, 0.05098039, 1, 0, 1,
-0.4053653, 0.1838067, -0.6181979, 0.04313726, 1, 0, 1,
-0.4048791, 0.7910456, -0.1540082, 0.03921569, 1, 0, 1,
-0.4041193, -0.2720408, -3.50029, 0.03137255, 1, 0, 1,
-0.4024932, 0.2963333, -0.2399667, 0.02745098, 1, 0, 1,
-0.4022636, 0.4725767, 0.8164272, 0.01960784, 1, 0, 1,
-0.3997182, -0.433389, -3.173535, 0.01568628, 1, 0, 1,
-0.3973005, 0.9704826, -1.167212, 0.007843138, 1, 0, 1,
-0.3937394, 0.2567988, -0.8371527, 0.003921569, 1, 0, 1,
-0.3908652, -0.3601645, -1.478958, 0, 1, 0.003921569, 1,
-0.3902857, -0.3073198, -2.720349, 0, 1, 0.01176471, 1,
-0.3895541, -0.6680194, -3.054513, 0, 1, 0.01568628, 1,
-0.3883212, -1.149294, -2.120197, 0, 1, 0.02352941, 1,
-0.3870936, -0.09976782, -1.467948, 0, 1, 0.02745098, 1,
-0.3827747, -0.1941872, -2.170752, 0, 1, 0.03529412, 1,
-0.379519, 1.412045, 0.2154626, 0, 1, 0.03921569, 1,
-0.3774109, 0.7195584, -0.4557144, 0, 1, 0.04705882, 1,
-0.3758883, 0.60465, -0.7457418, 0, 1, 0.05098039, 1,
-0.3737288, -0.883434, -2.675231, 0, 1, 0.05882353, 1,
-0.3711166, 0.02127098, -3.225453, 0, 1, 0.0627451, 1,
-0.3708904, 1.883879, 1.059944, 0, 1, 0.07058824, 1,
-0.370641, 0.03635916, -3.387914, 0, 1, 0.07450981, 1,
-0.3680209, -0.9735586, -3.101588, 0, 1, 0.08235294, 1,
-0.3614939, -0.5813202, -3.301179, 0, 1, 0.08627451, 1,
-0.3609436, -0.2672028, -2.471096, 0, 1, 0.09411765, 1,
-0.3602868, 0.006085631, -1.341526, 0, 1, 0.1019608, 1,
-0.3584155, -0.9963917, -3.843751, 0, 1, 0.1058824, 1,
-0.358004, 0.3173833, 0.592081, 0, 1, 0.1137255, 1,
-0.3551148, -0.7225575, -2.366591, 0, 1, 0.1176471, 1,
-0.3543567, 2.612426, 0.2232825, 0, 1, 0.1254902, 1,
-0.3542893, -0.1164789, -1.560717, 0, 1, 0.1294118, 1,
-0.35373, -0.2152881, -0.3869271, 0, 1, 0.1372549, 1,
-0.3482604, 1.826144, -1.359756, 0, 1, 0.1411765, 1,
-0.3429531, -0.8431289, -1.683359, 0, 1, 0.1490196, 1,
-0.3406509, 0.4837505, 0.9202352, 0, 1, 0.1529412, 1,
-0.332783, -0.1783688, -2.136253, 0, 1, 0.1607843, 1,
-0.3293727, 0.01699414, -1.389702, 0, 1, 0.1647059, 1,
-0.3263384, 0.3196844, -0.04077467, 0, 1, 0.172549, 1,
-0.3227969, -1.128834, -3.9152, 0, 1, 0.1764706, 1,
-0.3106997, 0.675689, -1.298516, 0, 1, 0.1843137, 1,
-0.3085914, -0.9696688, -3.041452, 0, 1, 0.1882353, 1,
-0.3065018, 0.7856907, -0.2794138, 0, 1, 0.1960784, 1,
-0.3012855, -0.4213153, -3.161616, 0, 1, 0.2039216, 1,
-0.2994245, -0.2810122, -3.302089, 0, 1, 0.2078431, 1,
-0.2963059, 0.6087315, -0.3524046, 0, 1, 0.2156863, 1,
-0.2957111, -1.441345, -3.663205, 0, 1, 0.2196078, 1,
-0.2911613, -0.2381517, -2.318998, 0, 1, 0.227451, 1,
-0.288398, -1.298465, -2.287607, 0, 1, 0.2313726, 1,
-0.2856083, -0.9965782, -3.179028, 0, 1, 0.2392157, 1,
-0.2853214, -0.2875699, -3.58005, 0, 1, 0.2431373, 1,
-0.2850452, -1.436379, -5.044796, 0, 1, 0.2509804, 1,
-0.2805668, 0.7677534, 0.5754271, 0, 1, 0.254902, 1,
-0.2789575, -0.3119102, -2.715313, 0, 1, 0.2627451, 1,
-0.2784536, -0.8905825, -4.309806, 0, 1, 0.2666667, 1,
-0.2737968, 0.08212431, -1.635486, 0, 1, 0.2745098, 1,
-0.2717994, 1.802041, 0.09146049, 0, 1, 0.2784314, 1,
-0.2584856, 0.0467595, -1.388502, 0, 1, 0.2862745, 1,
-0.2571296, 0.3700603, 0.05158501, 0, 1, 0.2901961, 1,
-0.2568608, -1.091193, -1.738384, 0, 1, 0.2980392, 1,
-0.2566966, -0.2494002, -2.116366, 0, 1, 0.3058824, 1,
-0.2561706, 0.2298515, -1.130324, 0, 1, 0.3098039, 1,
-0.2558619, -2.312679, -3.206466, 0, 1, 0.3176471, 1,
-0.2550661, -2.030131, -3.290085, 0, 1, 0.3215686, 1,
-0.2545224, 0.9380575, -0.3982789, 0, 1, 0.3294118, 1,
-0.2521, -0.202195, 0.3103653, 0, 1, 0.3333333, 1,
-0.2444396, -0.2239281, -2.444747, 0, 1, 0.3411765, 1,
-0.2420364, 0.7869505, 1.870928, 0, 1, 0.345098, 1,
-0.2399963, 0.2426917, -1.979677, 0, 1, 0.3529412, 1,
-0.2398555, 0.1405424, -2.910574, 0, 1, 0.3568628, 1,
-0.2327614, 0.1562058, -0.9864156, 0, 1, 0.3647059, 1,
-0.2322308, -1.374685, -3.360137, 0, 1, 0.3686275, 1,
-0.2320948, -1.228716, -4.033558, 0, 1, 0.3764706, 1,
-0.2301146, 0.8434804, 0.5635399, 0, 1, 0.3803922, 1,
-0.229952, -1.350348, -2.115087, 0, 1, 0.3882353, 1,
-0.2286801, -1.339535, -5.037736, 0, 1, 0.3921569, 1,
-0.2232113, 0.206541, -1.992025, 0, 1, 0.4, 1,
-0.2226343, -0.2178782, -0.7959203, 0, 1, 0.4078431, 1,
-0.2220202, -0.7271227, -3.144023, 0, 1, 0.4117647, 1,
-0.2217851, -0.2278826, -3.198814, 0, 1, 0.4196078, 1,
-0.2208724, 1.782023, -0.5363922, 0, 1, 0.4235294, 1,
-0.2202086, -0.2984537, -2.956198, 0, 1, 0.4313726, 1,
-0.215311, 1.143001, -0.6825913, 0, 1, 0.4352941, 1,
-0.2096808, 0.7470326, -0.617278, 0, 1, 0.4431373, 1,
-0.2095732, 0.8320951, -0.7260966, 0, 1, 0.4470588, 1,
-0.1998186, 1.432159, -0.9753956, 0, 1, 0.454902, 1,
-0.1949186, -0.9114199, -3.148618, 0, 1, 0.4588235, 1,
-0.185439, 1.215363, 1.466397, 0, 1, 0.4666667, 1,
-0.1847807, -0.2228098, -3.336001, 0, 1, 0.4705882, 1,
-0.1823805, 0.7900082, -1.594882, 0, 1, 0.4784314, 1,
-0.1800038, 0.6865444, 1.074144, 0, 1, 0.4823529, 1,
-0.1786901, -0.8988431, -4.642138, 0, 1, 0.4901961, 1,
-0.1765079, 0.005502238, -0.08072892, 0, 1, 0.4941176, 1,
-0.1753161, -0.08568015, -1.002806, 0, 1, 0.5019608, 1,
-0.1710155, -1.274605, -3.464165, 0, 1, 0.509804, 1,
-0.1703445, -1.052593, -1.570702, 0, 1, 0.5137255, 1,
-0.1683876, -0.6534779, -3.157732, 0, 1, 0.5215687, 1,
-0.1638645, 0.9424962, -0.06030159, 0, 1, 0.5254902, 1,
-0.1620573, 0.1413437, -2.179228, 0, 1, 0.5333334, 1,
-0.1613186, 0.1389689, -1.059668, 0, 1, 0.5372549, 1,
-0.161132, -0.2434745, -0.6671391, 0, 1, 0.5450981, 1,
-0.1595014, 1.850134, 1.507128, 0, 1, 0.5490196, 1,
-0.1550381, 0.4777472, -0.04012421, 0, 1, 0.5568628, 1,
-0.1471795, 0.7429443, -0.1342104, 0, 1, 0.5607843, 1,
-0.1465375, 0.1636444, 1.381366, 0, 1, 0.5686275, 1,
-0.1422432, -0.1706523, -2.265668, 0, 1, 0.572549, 1,
-0.1365812, 0.7246509, 1.090286, 0, 1, 0.5803922, 1,
-0.1346775, -0.4488001, -2.739136, 0, 1, 0.5843138, 1,
-0.1325618, 0.6893197, 0.01305588, 0, 1, 0.5921569, 1,
-0.1311068, -1.199902, -4.46194, 0, 1, 0.5960785, 1,
-0.1307861, -1.373769, -0.2469442, 0, 1, 0.6039216, 1,
-0.1275908, -0.1097531, -1.840939, 0, 1, 0.6117647, 1,
-0.125142, -0.6094055, -4.205758, 0, 1, 0.6156863, 1,
-0.1244147, -0.8663865, -0.3461634, 0, 1, 0.6235294, 1,
-0.1239171, -1.912744, -4.970054, 0, 1, 0.627451, 1,
-0.1096511, -0.8405249, -3.072861, 0, 1, 0.6352941, 1,
-0.1061517, -0.7198271, -2.193819, 0, 1, 0.6392157, 1,
-0.1055508, 0.199919, -2.106763, 0, 1, 0.6470588, 1,
-0.103588, 0.03264493, -0.2301393, 0, 1, 0.6509804, 1,
-0.1035295, -0.4279638, -1.808457, 0, 1, 0.6588235, 1,
-0.09829643, -0.1870528, -3.720534, 0, 1, 0.6627451, 1,
-0.09680066, 3.559628, 0.4806789, 0, 1, 0.6705883, 1,
-0.08844979, 1.391354, -0.2752721, 0, 1, 0.6745098, 1,
-0.08700176, -2.529819, -2.586836, 0, 1, 0.682353, 1,
-0.08607986, 0.001921633, -0.5274383, 0, 1, 0.6862745, 1,
-0.08357179, -1.569083, -3.657489, 0, 1, 0.6941177, 1,
-0.08081861, 0.02955374, -0.5724935, 0, 1, 0.7019608, 1,
-0.07057674, -0.5081207, -1.532286, 0, 1, 0.7058824, 1,
-0.0694423, -1.869999, -2.453886, 0, 1, 0.7137255, 1,
-0.06891873, -0.1245184, -2.64289, 0, 1, 0.7176471, 1,
-0.06583105, 1.095228, -1.854705, 0, 1, 0.7254902, 1,
-0.06258871, 0.7697849, 0.7363673, 0, 1, 0.7294118, 1,
-0.06217008, 0.9810458, -2.360938, 0, 1, 0.7372549, 1,
-0.06061885, 0.9318503, 2.229549, 0, 1, 0.7411765, 1,
-0.059436, -1.431763, -2.228134, 0, 1, 0.7490196, 1,
-0.05834613, -0.087873, -1.450999, 0, 1, 0.7529412, 1,
-0.05765474, -1.292872, -3.114701, 0, 1, 0.7607843, 1,
-0.05078888, 0.5936177, 0.2302382, 0, 1, 0.7647059, 1,
-0.04686788, -0.6119791, -2.851414, 0, 1, 0.772549, 1,
-0.04668814, 0.425016, 1.155771, 0, 1, 0.7764706, 1,
-0.0459596, -2.612908, -1.762757, 0, 1, 0.7843137, 1,
-0.04238635, -1.293744, -2.355553, 0, 1, 0.7882353, 1,
-0.04178882, 0.08114666, 0.06690288, 0, 1, 0.7960784, 1,
-0.03761803, 0.2010334, 0.2919862, 0, 1, 0.8039216, 1,
-0.03645024, -1.793618, -1.871884, 0, 1, 0.8078431, 1,
-0.03529684, 0.5779715, 0.2052299, 0, 1, 0.8156863, 1,
-0.03529317, 0.2140149, -1.388789, 0, 1, 0.8196079, 1,
-0.0345182, -1.17912, -3.159614, 0, 1, 0.827451, 1,
-0.0335561, -0.5168856, -4.24555, 0, 1, 0.8313726, 1,
-0.03292457, 0.1108532, -2.865475, 0, 1, 0.8392157, 1,
-0.03242568, 0.3300001, -0.1724657, 0, 1, 0.8431373, 1,
-0.02511876, -0.8335306, -2.28955, 0, 1, 0.8509804, 1,
-0.02392944, -1.196998, -3.80514, 0, 1, 0.854902, 1,
-0.01917648, 0.1588813, -0.3390753, 0, 1, 0.8627451, 1,
-0.01760114, 0.8240433, -0.531287, 0, 1, 0.8666667, 1,
-0.01476601, -0.0125762, -2.085005, 0, 1, 0.8745098, 1,
-0.01326603, 1.423491, -1.922446, 0, 1, 0.8784314, 1,
-0.01264159, -0.5562717, -2.004205, 0, 1, 0.8862745, 1,
-0.007496863, -0.2791903, -3.554574, 0, 1, 0.8901961, 1,
-0.003364746, 0.8065622, 0.1864575, 0, 1, 0.8980392, 1,
-0.0006774421, 1.215606, -1.45012, 0, 1, 0.9058824, 1,
0.00236761, 1.59833, -0.5026786, 0, 1, 0.9098039, 1,
0.002927612, 1.427047, 1.453794, 0, 1, 0.9176471, 1,
0.003399501, -0.2699527, 3.585947, 0, 1, 0.9215686, 1,
0.00575691, 2.566741, 0.9217022, 0, 1, 0.9294118, 1,
0.00681829, -0.4029937, 3.663372, 0, 1, 0.9333333, 1,
0.007557218, -1.041489, 2.198612, 0, 1, 0.9411765, 1,
0.009177675, -0.2215492, 3.520021, 0, 1, 0.945098, 1,
0.01439082, -1.790058, 2.429399, 0, 1, 0.9529412, 1,
0.01461672, 0.1613927, 0.983128, 0, 1, 0.9568627, 1,
0.0148301, -1.505505, 2.13918, 0, 1, 0.9647059, 1,
0.01503876, 0.1863423, -0.5910019, 0, 1, 0.9686275, 1,
0.0169411, 1.997074, 0.6548287, 0, 1, 0.9764706, 1,
0.02036371, 2.349926, 0.6413769, 0, 1, 0.9803922, 1,
0.02120074, 1.142901, 0.9655433, 0, 1, 0.9882353, 1,
0.022034, 0.4686873, -0.279368, 0, 1, 0.9921569, 1,
0.02207065, 0.2918383, 1.074044, 0, 1, 1, 1,
0.02652488, 1.266937, 1.358135, 0, 0.9921569, 1, 1,
0.03069352, -0.66058, 4.184515, 0, 0.9882353, 1, 1,
0.03094225, 1.022284, 0.1300026, 0, 0.9803922, 1, 1,
0.03423771, 1.578389, -0.05102992, 0, 0.9764706, 1, 1,
0.03568836, 0.1453016, 1.550356, 0, 0.9686275, 1, 1,
0.03608928, 0.174533, 1.642396, 0, 0.9647059, 1, 1,
0.03974048, 0.499764, -1.470492, 0, 0.9568627, 1, 1,
0.04144972, 1.849828, -0.7590579, 0, 0.9529412, 1, 1,
0.04453409, 0.416896, -0.9777735, 0, 0.945098, 1, 1,
0.04696146, 0.4037448, 0.3293628, 0, 0.9411765, 1, 1,
0.04733896, -0.6280155, 3.985038, 0, 0.9333333, 1, 1,
0.05094586, -1.489511, 2.991249, 0, 0.9294118, 1, 1,
0.05123458, 0.5550542, -0.3929517, 0, 0.9215686, 1, 1,
0.05381564, -0.5447364, 2.907372, 0, 0.9176471, 1, 1,
0.05460326, -2.015656, 2.484683, 0, 0.9098039, 1, 1,
0.05483128, -0.2681695, 2.98933, 0, 0.9058824, 1, 1,
0.05515151, 0.690052, 0.8842654, 0, 0.8980392, 1, 1,
0.05750493, -0.6389502, 2.411899, 0, 0.8901961, 1, 1,
0.05757242, -0.06313845, 4.111868, 0, 0.8862745, 1, 1,
0.05873367, -0.5742018, 4.364751, 0, 0.8784314, 1, 1,
0.05988202, 0.3770536, -1.666413, 0, 0.8745098, 1, 1,
0.06204711, -0.02517046, 1.835261, 0, 0.8666667, 1, 1,
0.06456818, 1.53076, -1.359604, 0, 0.8627451, 1, 1,
0.06603839, -0.6554626, 2.464325, 0, 0.854902, 1, 1,
0.06952667, 0.1462573, 1.418503, 0, 0.8509804, 1, 1,
0.071203, 0.1946242, 2.423264, 0, 0.8431373, 1, 1,
0.0737717, 0.5454789, 0.4665444, 0, 0.8392157, 1, 1,
0.07388032, 0.01775662, -0.1652766, 0, 0.8313726, 1, 1,
0.07443439, -0.1338208, 1.952983, 0, 0.827451, 1, 1,
0.07465807, 0.1510648, -0.3217836, 0, 0.8196079, 1, 1,
0.07753306, 0.9626777, 1.111935, 0, 0.8156863, 1, 1,
0.07852169, -0.8829668, 4.441384, 0, 0.8078431, 1, 1,
0.08023779, -1.054956, 2.909048, 0, 0.8039216, 1, 1,
0.08128845, -0.81252, 2.025386, 0, 0.7960784, 1, 1,
0.09391867, 0.1164931, 1.122826, 0, 0.7882353, 1, 1,
0.09452757, -0.5655337, 4.892454, 0, 0.7843137, 1, 1,
0.09585034, -0.1433983, 2.132848, 0, 0.7764706, 1, 1,
0.09722631, 2.082448, -0.5018243, 0, 0.772549, 1, 1,
0.09781259, -0.6307799, 2.070454, 0, 0.7647059, 1, 1,
0.1030539, 0.3754362, 1.709948, 0, 0.7607843, 1, 1,
0.1035722, 1.760801, -0.1485169, 0, 0.7529412, 1, 1,
0.1061055, 1.92206, 0.5298918, 0, 0.7490196, 1, 1,
0.1062081, -0.9920756, 3.493158, 0, 0.7411765, 1, 1,
0.1070072, -1.772098, 3.686696, 0, 0.7372549, 1, 1,
0.1087082, -2.299897, 2.453513, 0, 0.7294118, 1, 1,
0.1104519, -1.488206, 5.474722, 0, 0.7254902, 1, 1,
0.1114409, -0.7891483, 3.630651, 0, 0.7176471, 1, 1,
0.1138242, -0.7994933, 4.410287, 0, 0.7137255, 1, 1,
0.1139188, 1.039373, 0.3656586, 0, 0.7058824, 1, 1,
0.1157995, 0.4371002, 0.3210497, 0, 0.6980392, 1, 1,
0.1169466, 1.898804, -0.7378526, 0, 0.6941177, 1, 1,
0.1179117, -0.8829745, 1.936002, 0, 0.6862745, 1, 1,
0.1179973, -1.135389, 3.283257, 0, 0.682353, 1, 1,
0.1180656, 0.4076489, 0.3561585, 0, 0.6745098, 1, 1,
0.1186625, 1.146011, 0.6199889, 0, 0.6705883, 1, 1,
0.1188527, -1.252123, 1.010424, 0, 0.6627451, 1, 1,
0.1209679, -0.5009274, 0.9775628, 0, 0.6588235, 1, 1,
0.1210925, 3.764299, -0.4781053, 0, 0.6509804, 1, 1,
0.1244774, 1.42608, 1.644523, 0, 0.6470588, 1, 1,
0.1319824, 0.922206, -0.5727084, 0, 0.6392157, 1, 1,
0.1329576, -0.8607992, 3.844701, 0, 0.6352941, 1, 1,
0.1354758, -0.4543756, 2.289391, 0, 0.627451, 1, 1,
0.1356891, 1.14863, 1.037587, 0, 0.6235294, 1, 1,
0.1379922, -0.1865982, 2.657618, 0, 0.6156863, 1, 1,
0.1465796, 0.1084478, 1.514863, 0, 0.6117647, 1, 1,
0.1469774, 0.3452292, 0.2534785, 0, 0.6039216, 1, 1,
0.1477666, -0.4022934, 4.451877, 0, 0.5960785, 1, 1,
0.1485126, -0.6893384, 3.665104, 0, 0.5921569, 1, 1,
0.1514301, -1.109437, 3.403904, 0, 0.5843138, 1, 1,
0.158472, -2.644846, 4.195351, 0, 0.5803922, 1, 1,
0.1604963, 0.6347347, 2.257195, 0, 0.572549, 1, 1,
0.1633765, 0.369009, 1.28236, 0, 0.5686275, 1, 1,
0.1650683, 0.138259, -0.44644, 0, 0.5607843, 1, 1,
0.1692309, 0.882692, -0.8942257, 0, 0.5568628, 1, 1,
0.1697594, 0.08052752, 2.241291, 0, 0.5490196, 1, 1,
0.1742608, -1.028686, 2.169494, 0, 0.5450981, 1, 1,
0.1768658, -0.2903815, 2.698066, 0, 0.5372549, 1, 1,
0.1784719, 0.6219137, -1.291983, 0, 0.5333334, 1, 1,
0.1792613, -0.1182774, 1.773523, 0, 0.5254902, 1, 1,
0.1805164, 1.997671, 0.4688498, 0, 0.5215687, 1, 1,
0.1812489, 0.5704507, 0.05952427, 0, 0.5137255, 1, 1,
0.1819381, -0.210982, 2.770626, 0, 0.509804, 1, 1,
0.182273, -1.180772, 3.425148, 0, 0.5019608, 1, 1,
0.1880016, -0.2848432, 2.345556, 0, 0.4941176, 1, 1,
0.196185, 0.4048698, -0.5742762, 0, 0.4901961, 1, 1,
0.1977566, -0.06536043, 2.993099, 0, 0.4823529, 1, 1,
0.1985182, 1.010168, 1.207182, 0, 0.4784314, 1, 1,
0.1990757, 0.7544443, 3.122468, 0, 0.4705882, 1, 1,
0.1991787, 0.5229123, 0.02020345, 0, 0.4666667, 1, 1,
0.203173, -0.8906125, 1.121928, 0, 0.4588235, 1, 1,
0.2047609, 1.396091, 0.772284, 0, 0.454902, 1, 1,
0.2099144, -0.1725981, 2.318897, 0, 0.4470588, 1, 1,
0.210567, -0.458525, 0.5286239, 0, 0.4431373, 1, 1,
0.2107886, 1.866855, 1.249045, 0, 0.4352941, 1, 1,
0.2114357, -0.2066063, -0.100802, 0, 0.4313726, 1, 1,
0.212644, 1.683015, 0.6518512, 0, 0.4235294, 1, 1,
0.2146385, 0.8989475, 2.871192, 0, 0.4196078, 1, 1,
0.2184571, 0.8757352, -0.6854972, 0, 0.4117647, 1, 1,
0.219426, 1.551947, -0.1727299, 0, 0.4078431, 1, 1,
0.2199614, 0.9825715, -0.3022575, 0, 0.4, 1, 1,
0.2309636, -0.06133014, 1.884546, 0, 0.3921569, 1, 1,
0.2310252, -1.275834, 2.396212, 0, 0.3882353, 1, 1,
0.2341151, -2.283779, 2.730283, 0, 0.3803922, 1, 1,
0.2359357, 0.11512, 1.690933, 0, 0.3764706, 1, 1,
0.2376344, -0.7883245, 3.310002, 0, 0.3686275, 1, 1,
0.2392918, 0.9202127, 0.9965514, 0, 0.3647059, 1, 1,
0.2446565, -0.7656894, 3.056033, 0, 0.3568628, 1, 1,
0.2502359, 1.535781, 1.400743, 0, 0.3529412, 1, 1,
0.2539121, -0.3548226, 1.960937, 0, 0.345098, 1, 1,
0.2550012, 0.3771254, 0.4573068, 0, 0.3411765, 1, 1,
0.2552231, -1.367079, 3.440647, 0, 0.3333333, 1, 1,
0.2553081, -0.8559445, 1.531392, 0, 0.3294118, 1, 1,
0.2560822, -0.9057031, 2.982793, 0, 0.3215686, 1, 1,
0.2609025, -0.1333018, 1.0668, 0, 0.3176471, 1, 1,
0.2612525, -1.695963, 2.683164, 0, 0.3098039, 1, 1,
0.2617853, 0.05252893, 1.390347, 0, 0.3058824, 1, 1,
0.2626417, 0.1947158, 2.68736, 0, 0.2980392, 1, 1,
0.2750915, 0.8435016, -0.0131768, 0, 0.2901961, 1, 1,
0.278479, 1.243104, -0.7113007, 0, 0.2862745, 1, 1,
0.2797892, 0.09643245, 1.381472, 0, 0.2784314, 1, 1,
0.2810194, 1.925551, 0.2618353, 0, 0.2745098, 1, 1,
0.2826203, -1.204194, 3.505001, 0, 0.2666667, 1, 1,
0.2854769, -0.4235357, 2.570354, 0, 0.2627451, 1, 1,
0.2865245, 1.785051, 0.1160605, 0, 0.254902, 1, 1,
0.2891833, -0.7710642, 4.435856, 0, 0.2509804, 1, 1,
0.2919418, 0.2473471, 1.729142, 0, 0.2431373, 1, 1,
0.2933172, -1.057179, 5.055696, 0, 0.2392157, 1, 1,
0.2997744, -0.4015093, 2.755379, 0, 0.2313726, 1, 1,
0.3012719, 0.5332845, 0.6193779, 0, 0.227451, 1, 1,
0.3020686, 0.219681, 2.145274, 0, 0.2196078, 1, 1,
0.3046957, -0.2397127, 2.447759, 0, 0.2156863, 1, 1,
0.3119685, 0.6322486, 1.243202, 0, 0.2078431, 1, 1,
0.3147211, -1.033496, 3.0907, 0, 0.2039216, 1, 1,
0.3151518, -2.013937, 2.533004, 0, 0.1960784, 1, 1,
0.3184284, -0.2742119, 2.458781, 0, 0.1882353, 1, 1,
0.3239219, 0.5644419, 0.7023396, 0, 0.1843137, 1, 1,
0.3247557, 0.2347266, -0.3900601, 0, 0.1764706, 1, 1,
0.3249696, -0.8374531, 3.074932, 0, 0.172549, 1, 1,
0.3250674, -0.7489598, 1.639806, 0, 0.1647059, 1, 1,
0.330388, 0.7380853, -0.4558563, 0, 0.1607843, 1, 1,
0.331673, 0.283346, 1.166399, 0, 0.1529412, 1, 1,
0.3369472, 1.064129, -0.707384, 0, 0.1490196, 1, 1,
0.3408787, 0.1480773, 0.8739077, 0, 0.1411765, 1, 1,
0.3420783, 0.4854508, 1.729403, 0, 0.1372549, 1, 1,
0.3426981, 0.1242874, 0.681092, 0, 0.1294118, 1, 1,
0.3443319, 1.237709, 0.5209451, 0, 0.1254902, 1, 1,
0.3449361, 0.3423045, 2.402129, 0, 0.1176471, 1, 1,
0.3464186, 1.2799, -1.182792, 0, 0.1137255, 1, 1,
0.3488557, 0.425749, -0.1440224, 0, 0.1058824, 1, 1,
0.3529941, -1.34425, 2.451858, 0, 0.09803922, 1, 1,
0.3549458, 0.003185284, 1.052177, 0, 0.09411765, 1, 1,
0.3560665, 0.8073897, -0.2503884, 0, 0.08627451, 1, 1,
0.3585238, 1.376185, 0.2625445, 0, 0.08235294, 1, 1,
0.3619584, 1.056833, 1.28139, 0, 0.07450981, 1, 1,
0.3627203, -0.8999477, 2.778538, 0, 0.07058824, 1, 1,
0.3637643, -1.171014, 2.19356, 0, 0.0627451, 1, 1,
0.3644265, 0.03735509, 1.922012, 0, 0.05882353, 1, 1,
0.3654226, 0.1542331, 1.929513, 0, 0.05098039, 1, 1,
0.3678048, 0.1077682, 0.759396, 0, 0.04705882, 1, 1,
0.3688902, -1.488972, 3.770022, 0, 0.03921569, 1, 1,
0.3802864, 1.585817, -1.406559, 0, 0.03529412, 1, 1,
0.3831365, 0.4220257, 0.9177153, 0, 0.02745098, 1, 1,
0.3878176, 0.4468251, 0.5404803, 0, 0.02352941, 1, 1,
0.3887936, 2.335841, 1.40176, 0, 0.01568628, 1, 1,
0.3901872, -0.5202734, 3.189446, 0, 0.01176471, 1, 1,
0.3914737, -0.9294237, 1.754934, 0, 0.003921569, 1, 1,
0.3928019, -1.450753, 3.076368, 0.003921569, 0, 1, 1,
0.3975013, -0.3468842, 1.826612, 0.007843138, 0, 1, 1,
0.3988081, 0.3095741, -0.1907853, 0.01568628, 0, 1, 1,
0.4016134, -1.315964, 3.933319, 0.01960784, 0, 1, 1,
0.4054876, 1.592373, 0.1759353, 0.02745098, 0, 1, 1,
0.4056315, 0.05862136, 3.748127, 0.03137255, 0, 1, 1,
0.4063321, 1.334034, 1.589196, 0.03921569, 0, 1, 1,
0.4067124, 0.4810429, 0.8063663, 0.04313726, 0, 1, 1,
0.4152305, 0.2080325, 0.7980863, 0.05098039, 0, 1, 1,
0.4175846, -0.9765359, 1.970002, 0.05490196, 0, 1, 1,
0.4209306, -0.4956927, 2.092037, 0.0627451, 0, 1, 1,
0.4237649, 1.008446, 1.222625, 0.06666667, 0, 1, 1,
0.426929, 0.6206465, -0.06910616, 0.07450981, 0, 1, 1,
0.4274776, -0.4752269, 1.506534, 0.07843138, 0, 1, 1,
0.4278263, 1.231403, 0.3137183, 0.08627451, 0, 1, 1,
0.4327778, -0.1811905, 2.212706, 0.09019608, 0, 1, 1,
0.4370587, -1.823042, 1.592711, 0.09803922, 0, 1, 1,
0.4373834, -0.04202535, 4.275822, 0.1058824, 0, 1, 1,
0.4419833, 0.3125088, 1.514477, 0.1098039, 0, 1, 1,
0.4528291, 0.6093388, 0.7034389, 0.1176471, 0, 1, 1,
0.4540329, -0.6063794, 4.46415, 0.1215686, 0, 1, 1,
0.4588045, -0.06602897, 0.1527267, 0.1294118, 0, 1, 1,
0.4591757, -0.2635822, 2.005354, 0.1333333, 0, 1, 1,
0.4597476, -0.7769989, 1.240103, 0.1411765, 0, 1, 1,
0.4643636, -0.2371346, 2.369374, 0.145098, 0, 1, 1,
0.4652866, 0.9335601, 0.01573308, 0.1529412, 0, 1, 1,
0.4686326, 0.3659065, 0.8585189, 0.1568628, 0, 1, 1,
0.4746488, 0.06535351, 3.142088, 0.1647059, 0, 1, 1,
0.4747418, -0.03721032, 1.77835, 0.1686275, 0, 1, 1,
0.4761769, -0.5476721, 3.92274, 0.1764706, 0, 1, 1,
0.4824103, -1.944665, 2.405348, 0.1803922, 0, 1, 1,
0.4884833, 0.7458867, -0.5183965, 0.1882353, 0, 1, 1,
0.4899653, 0.3346457, -0.3532557, 0.1921569, 0, 1, 1,
0.5016925, 0.3191223, 1.887681, 0.2, 0, 1, 1,
0.5025866, -0.3895516, 4.489481, 0.2078431, 0, 1, 1,
0.5038668, -0.3164534, 1.389451, 0.2117647, 0, 1, 1,
0.5094009, -0.3847695, 1.364377, 0.2196078, 0, 1, 1,
0.5145774, 0.7152358, 0.680658, 0.2235294, 0, 1, 1,
0.5153042, 0.1387976, -0.4692915, 0.2313726, 0, 1, 1,
0.5160301, 0.7717029, 1.354931, 0.2352941, 0, 1, 1,
0.5193917, 0.2544781, 1.138427, 0.2431373, 0, 1, 1,
0.5214708, 1.139613, 0.2069188, 0.2470588, 0, 1, 1,
0.5237069, -0.463949, 2.365535, 0.254902, 0, 1, 1,
0.528281, 0.6019896, 0.4898335, 0.2588235, 0, 1, 1,
0.530091, 0.4963427, 1.998785, 0.2666667, 0, 1, 1,
0.5406885, 1.011928, -0.2600957, 0.2705882, 0, 1, 1,
0.5420437, 0.1388146, 2.827556, 0.2784314, 0, 1, 1,
0.5631279, 0.3320305, 0.09601196, 0.282353, 0, 1, 1,
0.5868837, -0.7621881, 0.127418, 0.2901961, 0, 1, 1,
0.5910543, 0.7452831, -1.04863, 0.2941177, 0, 1, 1,
0.5938698, -0.7050258, 3.288638, 0.3019608, 0, 1, 1,
0.5976346, 1.538348, -0.4538506, 0.3098039, 0, 1, 1,
0.5983264, 0.5093999, -0.434698, 0.3137255, 0, 1, 1,
0.6002067, 0.08596335, 0.2515946, 0.3215686, 0, 1, 1,
0.6008517, -1.627003, 3.11131, 0.3254902, 0, 1, 1,
0.6039174, 0.6311771, 0.6810005, 0.3333333, 0, 1, 1,
0.6063121, -0.2426306, 2.000432, 0.3372549, 0, 1, 1,
0.6081572, -0.4409611, 2.378834, 0.345098, 0, 1, 1,
0.6119438, -0.6803342, 1.418349, 0.3490196, 0, 1, 1,
0.622369, -0.486499, 2.497607, 0.3568628, 0, 1, 1,
0.6233104, -0.6109254, 1.510415, 0.3607843, 0, 1, 1,
0.6239315, 0.09095018, 1.337879, 0.3686275, 0, 1, 1,
0.6261167, 0.7584689, 2.038733, 0.372549, 0, 1, 1,
0.626145, -0.03968498, 0.8467185, 0.3803922, 0, 1, 1,
0.6306667, 0.8132402, 1.026538, 0.3843137, 0, 1, 1,
0.635946, 2.38445, 0.7630019, 0.3921569, 0, 1, 1,
0.6360137, -0.004434101, 1.927422, 0.3960784, 0, 1, 1,
0.6382743, 0.5654455, 1.18656, 0.4039216, 0, 1, 1,
0.647854, -0.7664039, 2.558931, 0.4117647, 0, 1, 1,
0.6563402, -0.9286205, 3.472723, 0.4156863, 0, 1, 1,
0.6623414, 2.345029, 1.89228, 0.4235294, 0, 1, 1,
0.6628613, 0.5415489, 1.040558, 0.427451, 0, 1, 1,
0.6679441, -0.7654453, 2.334837, 0.4352941, 0, 1, 1,
0.6692055, -0.9739391, 3.111572, 0.4392157, 0, 1, 1,
0.6698551, 0.7515726, 1.052604, 0.4470588, 0, 1, 1,
0.672029, -1.295752, 2.913986, 0.4509804, 0, 1, 1,
0.6722384, -0.4384171, 2.830212, 0.4588235, 0, 1, 1,
0.6742551, 2.179131, 0.7446534, 0.4627451, 0, 1, 1,
0.6799411, 0.8912416, -0.8282626, 0.4705882, 0, 1, 1,
0.6812229, 1.46469, 2.469743, 0.4745098, 0, 1, 1,
0.6861182, -1.277309, 2.041474, 0.4823529, 0, 1, 1,
0.6889048, 0.4929323, 0.9961346, 0.4862745, 0, 1, 1,
0.6930652, 0.324363, 0.6099267, 0.4941176, 0, 1, 1,
0.6956616, -0.8148397, 3.300708, 0.5019608, 0, 1, 1,
0.6968622, 1.105486, -0.8716092, 0.5058824, 0, 1, 1,
0.6975957, 1.283657, 2.325818, 0.5137255, 0, 1, 1,
0.7022967, 0.2063948, 2.90166, 0.5176471, 0, 1, 1,
0.7025301, 0.6916019, 2.685277, 0.5254902, 0, 1, 1,
0.7057939, -2.160215, 3.859327, 0.5294118, 0, 1, 1,
0.7073751, 1.520503, -0.7180882, 0.5372549, 0, 1, 1,
0.7164325, 0.488832, 2.144458, 0.5411765, 0, 1, 1,
0.7194791, 0.9713023, 1.537349, 0.5490196, 0, 1, 1,
0.7220877, 0.9017936, 1.894103, 0.5529412, 0, 1, 1,
0.7224682, 1.625926, 0.5218351, 0.5607843, 0, 1, 1,
0.7256265, -1.107005, 0.9118456, 0.5647059, 0, 1, 1,
0.7274397, 1.326183, -0.4619001, 0.572549, 0, 1, 1,
0.7300072, -0.2047975, 1.670887, 0.5764706, 0, 1, 1,
0.7365734, -0.5613375, 2.058831, 0.5843138, 0, 1, 1,
0.7370359, -0.6852974, 1.748666, 0.5882353, 0, 1, 1,
0.7413407, 0.4165641, 2.285747, 0.5960785, 0, 1, 1,
0.7438235, -1.709823, 1.863215, 0.6039216, 0, 1, 1,
0.7448598, 0.7918388, 1.115438, 0.6078432, 0, 1, 1,
0.7455227, 0.08623087, 1.455704, 0.6156863, 0, 1, 1,
0.755109, 2.027762, 0.599618, 0.6196079, 0, 1, 1,
0.7570114, -0.8347468, 0.9114752, 0.627451, 0, 1, 1,
0.7572612, -0.7291566, 2.759321, 0.6313726, 0, 1, 1,
0.7580104, 0.09985207, 0.861907, 0.6392157, 0, 1, 1,
0.765615, 0.3516221, -0.8641793, 0.6431373, 0, 1, 1,
0.7705896, 1.315076, 1.761359, 0.6509804, 0, 1, 1,
0.7737197, 1.480029, 1.322963, 0.654902, 0, 1, 1,
0.7890118, -1.300995, 2.778758, 0.6627451, 0, 1, 1,
0.7931443, -1.121972, 1.979798, 0.6666667, 0, 1, 1,
0.7941723, 0.4463362, 0.6238229, 0.6745098, 0, 1, 1,
0.7956892, -0.8875929, 3.013927, 0.6784314, 0, 1, 1,
0.7974928, -0.05861495, 2.448594, 0.6862745, 0, 1, 1,
0.7975199, -0.2834436, 3.991249, 0.6901961, 0, 1, 1,
0.8035113, 0.7667915, -0.04519321, 0.6980392, 0, 1, 1,
0.8045423, 0.2858723, 2.252579, 0.7058824, 0, 1, 1,
0.8062292, 0.1897558, 1.69887, 0.7098039, 0, 1, 1,
0.8063712, -0.361953, 1.378873, 0.7176471, 0, 1, 1,
0.8066698, 0.2515324, -0.4373604, 0.7215686, 0, 1, 1,
0.8094127, 0.2563332, 1.265495, 0.7294118, 0, 1, 1,
0.8109018, -0.1830369, 1.897753, 0.7333333, 0, 1, 1,
0.8110408, -0.8832195, 2.651733, 0.7411765, 0, 1, 1,
0.8160816, -1.658424, 2.754674, 0.7450981, 0, 1, 1,
0.8178046, 0.2204001, 1.618429, 0.7529412, 0, 1, 1,
0.8189681, -0.2278202, 2.676054, 0.7568628, 0, 1, 1,
0.8193755, -0.3290238, 3.980998, 0.7647059, 0, 1, 1,
0.8202946, 0.7049177, 2.113003, 0.7686275, 0, 1, 1,
0.8218854, -1.035636, 2.164265, 0.7764706, 0, 1, 1,
0.8226393, -0.1137973, 1.821906, 0.7803922, 0, 1, 1,
0.8263699, 1.181923, 1.579229, 0.7882353, 0, 1, 1,
0.8280155, -0.7490504, 0.8552513, 0.7921569, 0, 1, 1,
0.8285322, 0.8395565, 1.386185, 0.8, 0, 1, 1,
0.8293757, 0.07685842, 1.487187, 0.8078431, 0, 1, 1,
0.8303391, -0.6276357, 4.268148, 0.8117647, 0, 1, 1,
0.8306523, 1.077678, 3.045446, 0.8196079, 0, 1, 1,
0.8339666, 0.6509897, 0.07285868, 0.8235294, 0, 1, 1,
0.8348994, -0.4188927, 1.022774, 0.8313726, 0, 1, 1,
0.836251, -0.7621408, 3.061249, 0.8352941, 0, 1, 1,
0.8462167, 0.7052538, 0.06246474, 0.8431373, 0, 1, 1,
0.8477337, -0.1909478, 2.313852, 0.8470588, 0, 1, 1,
0.8482274, 1.737358, 0.4239426, 0.854902, 0, 1, 1,
0.8486299, 1.647039, -0.318857, 0.8588235, 0, 1, 1,
0.8494139, -0.5739305, 1.542499, 0.8666667, 0, 1, 1,
0.8494576, -0.2540737, 3.129023, 0.8705882, 0, 1, 1,
0.8505206, 1.19479, 0.8978366, 0.8784314, 0, 1, 1,
0.8508893, -0.1194962, 1.305155, 0.8823529, 0, 1, 1,
0.8510483, -0.004752524, 0.8829542, 0.8901961, 0, 1, 1,
0.8514891, 0.2086303, 2.733712, 0.8941177, 0, 1, 1,
0.8574851, 0.2632607, -0.2435986, 0.9019608, 0, 1, 1,
0.8584446, 0.8458037, 1.163764, 0.9098039, 0, 1, 1,
0.8629982, 1.093862, -0.2893357, 0.9137255, 0, 1, 1,
0.87739, -0.2842457, 1.199307, 0.9215686, 0, 1, 1,
0.8856834, 1.07202, 0.5338438, 0.9254902, 0, 1, 1,
0.8880244, 1.009755, 0.707324, 0.9333333, 0, 1, 1,
0.8927833, 1.746862, -0.7459181, 0.9372549, 0, 1, 1,
0.9093317, -0.9855562, 3.809297, 0.945098, 0, 1, 1,
0.9114069, -0.8866788, 3.102606, 0.9490196, 0, 1, 1,
0.9114993, -1.573431, 2.824898, 0.9568627, 0, 1, 1,
0.9135177, -0.1818163, 3.992553, 0.9607843, 0, 1, 1,
0.9178051, -1.505085, 1.625296, 0.9686275, 0, 1, 1,
0.9182458, -0.4910495, 1.861851, 0.972549, 0, 1, 1,
0.9199575, 0.7646497, 1.579563, 0.9803922, 0, 1, 1,
0.9205817, 0.5878465, 0.1211028, 0.9843137, 0, 1, 1,
0.9247388, -0.8443772, 2.810455, 0.9921569, 0, 1, 1,
0.9284221, 0.6367745, 2.487856, 0.9960784, 0, 1, 1,
0.9284438, -1.267924, 3.035839, 1, 0, 0.9960784, 1,
0.9299495, -0.1652462, 3.272018, 1, 0, 0.9882353, 1,
0.934952, 0.2836111, 0.8104843, 1, 0, 0.9843137, 1,
0.9408912, 0.2679752, 1.237684, 1, 0, 0.9764706, 1,
0.9513835, 1.657032, -0.4171321, 1, 0, 0.972549, 1,
0.9521734, -2.182998, 0.8050789, 1, 0, 0.9647059, 1,
0.9527181, 1.742369, -0.3635367, 1, 0, 0.9607843, 1,
0.9587309, -0.505268, 0.8743005, 1, 0, 0.9529412, 1,
0.9654063, 0.3118095, 1.715607, 1, 0, 0.9490196, 1,
0.9713843, 2.064713, 0.6379672, 1, 0, 0.9411765, 1,
0.9755257, 0.2129385, 0.5614195, 1, 0, 0.9372549, 1,
0.9762611, 1.427424, -0.2592925, 1, 0, 0.9294118, 1,
0.9786144, -0.3354828, 2.219121, 1, 0, 0.9254902, 1,
0.9865642, -0.3005927, 1.978121, 1, 0, 0.9176471, 1,
0.992272, -1.602815, 1.364885, 1, 0, 0.9137255, 1,
0.9936337, -0.9426377, 1.133444, 1, 0, 0.9058824, 1,
1.006387, 0.3720857, 3.436724, 1, 0, 0.9019608, 1,
1.008517, 0.6425193, 0.1241929, 1, 0, 0.8941177, 1,
1.008798, -0.3680737, 4.0035, 1, 0, 0.8862745, 1,
1.015919, 1.131222, 1.491006, 1, 0, 0.8823529, 1,
1.029743, 0.1369922, 2.8226, 1, 0, 0.8745098, 1,
1.03188, -0.1944806, 3.379426, 1, 0, 0.8705882, 1,
1.033523, 0.9880428, -1.046551, 1, 0, 0.8627451, 1,
1.035746, 2.244208, 0.6071676, 1, 0, 0.8588235, 1,
1.036206, 0.3435084, 1.137313, 1, 0, 0.8509804, 1,
1.036428, 0.6789247, 1.221713, 1, 0, 0.8470588, 1,
1.038861, 1.423651, 0.05480501, 1, 0, 0.8392157, 1,
1.038944, 0.7849103, 0.09285372, 1, 0, 0.8352941, 1,
1.03917, -0.8033687, 2.762383, 1, 0, 0.827451, 1,
1.054831, -0.9114859, 0.8760455, 1, 0, 0.8235294, 1,
1.067103, 0.3289753, 0.9368563, 1, 0, 0.8156863, 1,
1.0733, 1.100459, 0.07811863, 1, 0, 0.8117647, 1,
1.074256, -0.08397987, 0.675503, 1, 0, 0.8039216, 1,
1.078882, 0.6499171, 0.5878293, 1, 0, 0.7960784, 1,
1.086602, 1.253956, 1.026844, 1, 0, 0.7921569, 1,
1.089135, 1.295325, 1.361462, 1, 0, 0.7843137, 1,
1.089325, 1.695445, -0.1238047, 1, 0, 0.7803922, 1,
1.095887, -1.161255, 2.408845, 1, 0, 0.772549, 1,
1.104178, -0.6166378, 2.250593, 1, 0, 0.7686275, 1,
1.114232, -0.2403816, 1.881403, 1, 0, 0.7607843, 1,
1.114526, 0.8640414, 0.8964339, 1, 0, 0.7568628, 1,
1.117178, 0.6100419, 1.602904, 1, 0, 0.7490196, 1,
1.133193, 0.190448, 1.37385, 1, 0, 0.7450981, 1,
1.14457, 1.716522, 1.15782, 1, 0, 0.7372549, 1,
1.146137, -0.1102293, 1.068373, 1, 0, 0.7333333, 1,
1.15493, -0.1745679, 1.196134, 1, 0, 0.7254902, 1,
1.155584, 0.2319868, 0.4266833, 1, 0, 0.7215686, 1,
1.157592, 0.04076991, 2.100076, 1, 0, 0.7137255, 1,
1.160943, -1.548661, 4.128241, 1, 0, 0.7098039, 1,
1.168781, -0.3309177, 2.122224, 1, 0, 0.7019608, 1,
1.170727, -1.279537, 2.939893, 1, 0, 0.6941177, 1,
1.176422, -2.252516, 1.744059, 1, 0, 0.6901961, 1,
1.177315, -0.07459518, -0.8488592, 1, 0, 0.682353, 1,
1.180703, -0.1361537, 1.652304, 1, 0, 0.6784314, 1,
1.182588, -1.570945, 4.045899, 1, 0, 0.6705883, 1,
1.183441, -0.3094372, 2.371623, 1, 0, 0.6666667, 1,
1.186759, 0.7826756, 1.400111, 1, 0, 0.6588235, 1,
1.187779, 1.229615, 0.1155901, 1, 0, 0.654902, 1,
1.188706, 0.3033063, 1.771898, 1, 0, 0.6470588, 1,
1.18978, -0.6429141, 1.415521, 1, 0, 0.6431373, 1,
1.192269, -0.9987459, 2.498071, 1, 0, 0.6352941, 1,
1.195611, -0.3373183, 1.506274, 1, 0, 0.6313726, 1,
1.204067, -0.9705493, 2.051025, 1, 0, 0.6235294, 1,
1.217184, -0.3516399, 0.7513605, 1, 0, 0.6196079, 1,
1.21882, -0.6869427, -0.1057262, 1, 0, 0.6117647, 1,
1.23044, 0.1279672, 2.210776, 1, 0, 0.6078432, 1,
1.232702, 1.288294, 1.201113, 1, 0, 0.6, 1,
1.239591, 0.7127627, 1.017866, 1, 0, 0.5921569, 1,
1.241897, 1.415473, -0.03764878, 1, 0, 0.5882353, 1,
1.245722, 0.3742146, 1.730244, 1, 0, 0.5803922, 1,
1.246456, -1.244558, 3.655787, 1, 0, 0.5764706, 1,
1.250344, -0.1822926, 0.8937162, 1, 0, 0.5686275, 1,
1.257116, 0.4686179, 2.160672, 1, 0, 0.5647059, 1,
1.257758, 0.1239522, 2.752136, 1, 0, 0.5568628, 1,
1.262587, 0.2172411, 1.661176, 1, 0, 0.5529412, 1,
1.264996, 0.1779649, 0.9641458, 1, 0, 0.5450981, 1,
1.294701, 1.213531, 2.318894, 1, 0, 0.5411765, 1,
1.308807, 0.05951413, 0.6500385, 1, 0, 0.5333334, 1,
1.32169, -0.1374249, 2.534391, 1, 0, 0.5294118, 1,
1.323062, 0.05217009, 1.12866, 1, 0, 0.5215687, 1,
1.326579, 1.093225, 1.428182, 1, 0, 0.5176471, 1,
1.343149, -0.3100104, 2.339821, 1, 0, 0.509804, 1,
1.352438, 1.797186, 0.9368792, 1, 0, 0.5058824, 1,
1.37468, 0.2365677, 0.915269, 1, 0, 0.4980392, 1,
1.376118, -0.9672382, 3.130368, 1, 0, 0.4901961, 1,
1.387246, -0.03169815, 1.461586, 1, 0, 0.4862745, 1,
1.392016, -0.5350332, 0.6343992, 1, 0, 0.4784314, 1,
1.392847, -0.005029805, 1.653341, 1, 0, 0.4745098, 1,
1.393727, -1.033487, 2.980185, 1, 0, 0.4666667, 1,
1.394608, -1.177548, 1.505953, 1, 0, 0.4627451, 1,
1.394613, -0.2512546, 3.021806, 1, 0, 0.454902, 1,
1.399228, 0.8786263, 1.148096, 1, 0, 0.4509804, 1,
1.399557, 0.05319748, -0.3744846, 1, 0, 0.4431373, 1,
1.400109, -1.29502, 3.731938, 1, 0, 0.4392157, 1,
1.401158, -0.4065341, 0.2474235, 1, 0, 0.4313726, 1,
1.421516, -0.7359782, 1.985823, 1, 0, 0.427451, 1,
1.426861, 0.5849664, 2.283677, 1, 0, 0.4196078, 1,
1.430434, 0.4798616, 1.233734, 1, 0, 0.4156863, 1,
1.443473, 0.6131896, 2.128803, 1, 0, 0.4078431, 1,
1.443685, 1.767386, 2.267558, 1, 0, 0.4039216, 1,
1.452657, -1.697478, 4.008176, 1, 0, 0.3960784, 1,
1.456541, 0.5363599, 2.038196, 1, 0, 0.3882353, 1,
1.475463, -0.6174132, 2.194897, 1, 0, 0.3843137, 1,
1.48987, 0.3527666, 0.8008879, 1, 0, 0.3764706, 1,
1.504715, 1.307875, 1.999528, 1, 0, 0.372549, 1,
1.521403, -0.8923546, 3.455828, 1, 0, 0.3647059, 1,
1.533431, -0.2744783, 1.467306, 1, 0, 0.3607843, 1,
1.548761, -1.521626, 1.09934, 1, 0, 0.3529412, 1,
1.549247, -0.007713334, 2.24626, 1, 0, 0.3490196, 1,
1.556604, -1.50907, 3.270672, 1, 0, 0.3411765, 1,
1.556984, -0.248169, 0.7058814, 1, 0, 0.3372549, 1,
1.562561, 0.1050647, 0.6573843, 1, 0, 0.3294118, 1,
1.563571, 0.9372279, 0.3864451, 1, 0, 0.3254902, 1,
1.568025, -0.144223, 4.125985, 1, 0, 0.3176471, 1,
1.577316, -0.829987, 0.9931107, 1, 0, 0.3137255, 1,
1.582786, -1.432028, 2.049273, 1, 0, 0.3058824, 1,
1.584509, 0.4604963, 1.873134, 1, 0, 0.2980392, 1,
1.597302, 0.1412866, 0.6094353, 1, 0, 0.2941177, 1,
1.608096, -2.289806, 3.403659, 1, 0, 0.2862745, 1,
1.614351, -0.6837869, 3.494131, 1, 0, 0.282353, 1,
1.614391, 1.417505, 0.27537, 1, 0, 0.2745098, 1,
1.619252, 0.4616597, 1.667578, 1, 0, 0.2705882, 1,
1.622932, -0.3054866, 0.658702, 1, 0, 0.2627451, 1,
1.653138, 0.09633454, 2.604551, 1, 0, 0.2588235, 1,
1.66767, -1.316897, 1.609302, 1, 0, 0.2509804, 1,
1.692158, 0.7850873, 1.592546, 1, 0, 0.2470588, 1,
1.720257, -0.3317015, 2.11731, 1, 0, 0.2392157, 1,
1.737098, 0.5336775, 0.5754911, 1, 0, 0.2352941, 1,
1.759174, 0.4353237, 2.023455, 1, 0, 0.227451, 1,
1.776632, 0.06318534, 1.619435, 1, 0, 0.2235294, 1,
1.790999, 1.346298, 2.516824, 1, 0, 0.2156863, 1,
1.800969, -0.6347471, 1.969208, 1, 0, 0.2117647, 1,
1.81819, 0.4146693, 1.760709, 1, 0, 0.2039216, 1,
1.861057, 0.8940111, 0.4894911, 1, 0, 0.1960784, 1,
1.868353, 0.08784386, 0.8525297, 1, 0, 0.1921569, 1,
1.873807, -0.4637415, 1.405895, 1, 0, 0.1843137, 1,
1.889569, -0.6494828, 1.039802, 1, 0, 0.1803922, 1,
1.898096, -0.2723284, 3.353787, 1, 0, 0.172549, 1,
1.908258, 0.04770504, 0.5722811, 1, 0, 0.1686275, 1,
1.937662, 0.7011836, 1.057986, 1, 0, 0.1607843, 1,
1.950535, -0.3577885, 2.002824, 1, 0, 0.1568628, 1,
1.957668, 1.066218, 0.9151108, 1, 0, 0.1490196, 1,
1.981436, 1.421345, 1.250943, 1, 0, 0.145098, 1,
1.982552, -0.2702941, 0.3340149, 1, 0, 0.1372549, 1,
2.000397, 0.825372, 2.749084, 1, 0, 0.1333333, 1,
2.001372, -0.03805799, 2.711157, 1, 0, 0.1254902, 1,
2.038178, -0.09617726, 2.084777, 1, 0, 0.1215686, 1,
2.075361, -0.515947, 1.919116, 1, 0, 0.1137255, 1,
2.095155, -0.7069675, 0.5855652, 1, 0, 0.1098039, 1,
2.131169, -0.8484414, 2.001021, 1, 0, 0.1019608, 1,
2.1532, -0.1116019, 1.315798, 1, 0, 0.09411765, 1,
2.239969, 0.001316913, 1.954777, 1, 0, 0.09019608, 1,
2.287833, 0.05355645, 0.4346508, 1, 0, 0.08235294, 1,
2.304041, 0.04033136, 2.614505, 1, 0, 0.07843138, 1,
2.395947, -0.439661, 2.089216, 1, 0, 0.07058824, 1,
2.477854, 0.4247193, 2.988347, 1, 0, 0.06666667, 1,
2.513867, -1.140039, 3.418325, 1, 0, 0.05882353, 1,
2.581122, 0.1026386, 3.112385, 1, 0, 0.05490196, 1,
2.631282, -0.6447942, 2.181983, 1, 0, 0.04705882, 1,
2.65545, -1.044575, 0.5606758, 1, 0, 0.04313726, 1,
2.727887, -0.9802952, 1.276635, 1, 0, 0.03529412, 1,
2.787141, 0.06593665, 1.904526, 1, 0, 0.03137255, 1,
2.825164, -1.180489, 2.363091, 1, 0, 0.02352941, 1,
2.825449, -0.4579785, 2.878509, 1, 0, 0.01960784, 1,
2.85043, -1.109675, 2.133762, 1, 0, 0.01176471, 1,
3.654177, -0.4794593, 1.637333, 1, 0, 0.007843138, 1
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
0.285099, -3.8497, -6.827854, 0, -0.5, 0.5, 0.5,
0.285099, -3.8497, -6.827854, 1, -0.5, 0.5, 0.5,
0.285099, -3.8497, -6.827854, 1, 1.5, 0.5, 0.5,
0.285099, -3.8497, -6.827854, 0, 1.5, 0.5, 0.5
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
-4.226096, 0.5090622, -6.827854, 0, -0.5, 0.5, 0.5,
-4.226096, 0.5090622, -6.827854, 1, -0.5, 0.5, 0.5,
-4.226096, 0.5090622, -6.827854, 1, 1.5, 0.5, 0.5,
-4.226096, 0.5090622, -6.827854, 0, 1.5, 0.5, 0.5
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
-4.226096, -3.8497, 0.2149632, 0, -0.5, 0.5, 0.5,
-4.226096, -3.8497, 0.2149632, 1, -0.5, 0.5, 0.5,
-4.226096, -3.8497, 0.2149632, 1, 1.5, 0.5, 0.5,
-4.226096, -3.8497, 0.2149632, 0, 1.5, 0.5, 0.5
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
-3, -2.843832, -5.202588,
3, -2.843832, -5.202588,
-3, -2.843832, -5.202588,
-3, -3.011477, -5.473466,
-2, -2.843832, -5.202588,
-2, -3.011477, -5.473466,
-1, -2.843832, -5.202588,
-1, -3.011477, -5.473466,
0, -2.843832, -5.202588,
0, -3.011477, -5.473466,
1, -2.843832, -5.202588,
1, -3.011477, -5.473466,
2, -2.843832, -5.202588,
2, -3.011477, -5.473466,
3, -2.843832, -5.202588,
3, -3.011477, -5.473466
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
-3, -3.346766, -6.015221, 0, -0.5, 0.5, 0.5,
-3, -3.346766, -6.015221, 1, -0.5, 0.5, 0.5,
-3, -3.346766, -6.015221, 1, 1.5, 0.5, 0.5,
-3, -3.346766, -6.015221, 0, 1.5, 0.5, 0.5,
-2, -3.346766, -6.015221, 0, -0.5, 0.5, 0.5,
-2, -3.346766, -6.015221, 1, -0.5, 0.5, 0.5,
-2, -3.346766, -6.015221, 1, 1.5, 0.5, 0.5,
-2, -3.346766, -6.015221, 0, 1.5, 0.5, 0.5,
-1, -3.346766, -6.015221, 0, -0.5, 0.5, 0.5,
-1, -3.346766, -6.015221, 1, -0.5, 0.5, 0.5,
-1, -3.346766, -6.015221, 1, 1.5, 0.5, 0.5,
-1, -3.346766, -6.015221, 0, 1.5, 0.5, 0.5,
0, -3.346766, -6.015221, 0, -0.5, 0.5, 0.5,
0, -3.346766, -6.015221, 1, -0.5, 0.5, 0.5,
0, -3.346766, -6.015221, 1, 1.5, 0.5, 0.5,
0, -3.346766, -6.015221, 0, 1.5, 0.5, 0.5,
1, -3.346766, -6.015221, 0, -0.5, 0.5, 0.5,
1, -3.346766, -6.015221, 1, -0.5, 0.5, 0.5,
1, -3.346766, -6.015221, 1, 1.5, 0.5, 0.5,
1, -3.346766, -6.015221, 0, 1.5, 0.5, 0.5,
2, -3.346766, -6.015221, 0, -0.5, 0.5, 0.5,
2, -3.346766, -6.015221, 1, -0.5, 0.5, 0.5,
2, -3.346766, -6.015221, 1, 1.5, 0.5, 0.5,
2, -3.346766, -6.015221, 0, 1.5, 0.5, 0.5,
3, -3.346766, -6.015221, 0, -0.5, 0.5, 0.5,
3, -3.346766, -6.015221, 1, -0.5, 0.5, 0.5,
3, -3.346766, -6.015221, 1, 1.5, 0.5, 0.5,
3, -3.346766, -6.015221, 0, 1.5, 0.5, 0.5
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
-3.185051, -2, -5.202588,
-3.185051, 3, -5.202588,
-3.185051, -2, -5.202588,
-3.358559, -2, -5.473466,
-3.185051, -1, -5.202588,
-3.358559, -1, -5.473466,
-3.185051, 0, -5.202588,
-3.358559, 0, -5.473466,
-3.185051, 1, -5.202588,
-3.358559, 1, -5.473466,
-3.185051, 2, -5.202588,
-3.358559, 2, -5.473466,
-3.185051, 3, -5.202588,
-3.358559, 3, -5.473466
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
-3.705574, -2, -6.015221, 0, -0.5, 0.5, 0.5,
-3.705574, -2, -6.015221, 1, -0.5, 0.5, 0.5,
-3.705574, -2, -6.015221, 1, 1.5, 0.5, 0.5,
-3.705574, -2, -6.015221, 0, 1.5, 0.5, 0.5,
-3.705574, -1, -6.015221, 0, -0.5, 0.5, 0.5,
-3.705574, -1, -6.015221, 1, -0.5, 0.5, 0.5,
-3.705574, -1, -6.015221, 1, 1.5, 0.5, 0.5,
-3.705574, -1, -6.015221, 0, 1.5, 0.5, 0.5,
-3.705574, 0, -6.015221, 0, -0.5, 0.5, 0.5,
-3.705574, 0, -6.015221, 1, -0.5, 0.5, 0.5,
-3.705574, 0, -6.015221, 1, 1.5, 0.5, 0.5,
-3.705574, 0, -6.015221, 0, 1.5, 0.5, 0.5,
-3.705574, 1, -6.015221, 0, -0.5, 0.5, 0.5,
-3.705574, 1, -6.015221, 1, -0.5, 0.5, 0.5,
-3.705574, 1, -6.015221, 1, 1.5, 0.5, 0.5,
-3.705574, 1, -6.015221, 0, 1.5, 0.5, 0.5,
-3.705574, 2, -6.015221, 0, -0.5, 0.5, 0.5,
-3.705574, 2, -6.015221, 1, -0.5, 0.5, 0.5,
-3.705574, 2, -6.015221, 1, 1.5, 0.5, 0.5,
-3.705574, 2, -6.015221, 0, 1.5, 0.5, 0.5,
-3.705574, 3, -6.015221, 0, -0.5, 0.5, 0.5,
-3.705574, 3, -6.015221, 1, -0.5, 0.5, 0.5,
-3.705574, 3, -6.015221, 1, 1.5, 0.5, 0.5,
-3.705574, 3, -6.015221, 0, 1.5, 0.5, 0.5
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
-3.185051, -2.843832, -4,
-3.185051, -2.843832, 4,
-3.185051, -2.843832, -4,
-3.358559, -3.011477, -4,
-3.185051, -2.843832, -2,
-3.358559, -3.011477, -2,
-3.185051, -2.843832, 0,
-3.358559, -3.011477, 0,
-3.185051, -2.843832, 2,
-3.358559, -3.011477, 2,
-3.185051, -2.843832, 4,
-3.358559, -3.011477, 4
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
-3.705574, -3.346766, -4, 0, -0.5, 0.5, 0.5,
-3.705574, -3.346766, -4, 1, -0.5, 0.5, 0.5,
-3.705574, -3.346766, -4, 1, 1.5, 0.5, 0.5,
-3.705574, -3.346766, -4, 0, 1.5, 0.5, 0.5,
-3.705574, -3.346766, -2, 0, -0.5, 0.5, 0.5,
-3.705574, -3.346766, -2, 1, -0.5, 0.5, 0.5,
-3.705574, -3.346766, -2, 1, 1.5, 0.5, 0.5,
-3.705574, -3.346766, -2, 0, 1.5, 0.5, 0.5,
-3.705574, -3.346766, 0, 0, -0.5, 0.5, 0.5,
-3.705574, -3.346766, 0, 1, -0.5, 0.5, 0.5,
-3.705574, -3.346766, 0, 1, 1.5, 0.5, 0.5,
-3.705574, -3.346766, 0, 0, 1.5, 0.5, 0.5,
-3.705574, -3.346766, 2, 0, -0.5, 0.5, 0.5,
-3.705574, -3.346766, 2, 1, -0.5, 0.5, 0.5,
-3.705574, -3.346766, 2, 1, 1.5, 0.5, 0.5,
-3.705574, -3.346766, 2, 0, 1.5, 0.5, 0.5,
-3.705574, -3.346766, 4, 0, -0.5, 0.5, 0.5,
-3.705574, -3.346766, 4, 1, -0.5, 0.5, 0.5,
-3.705574, -3.346766, 4, 1, 1.5, 0.5, 0.5,
-3.705574, -3.346766, 4, 0, 1.5, 0.5, 0.5
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
-3.185051, -2.843832, -5.202588,
-3.185051, 3.861957, -5.202588,
-3.185051, -2.843832, 5.632514,
-3.185051, 3.861957, 5.632514,
-3.185051, -2.843832, -5.202588,
-3.185051, -2.843832, 5.632514,
-3.185051, 3.861957, -5.202588,
-3.185051, 3.861957, 5.632514,
-3.185051, -2.843832, -5.202588,
3.755249, -2.843832, -5.202588,
-3.185051, -2.843832, 5.632514,
3.755249, -2.843832, 5.632514,
-3.185051, 3.861957, -5.202588,
3.755249, 3.861957, -5.202588,
-3.185051, 3.861957, 5.632514,
3.755249, 3.861957, 5.632514,
3.755249, -2.843832, -5.202588,
3.755249, 3.861957, -5.202588,
3.755249, -2.843832, 5.632514,
3.755249, 3.861957, 5.632514,
3.755249, -2.843832, -5.202588,
3.755249, -2.843832, 5.632514,
3.755249, 3.861957, -5.202588,
3.755249, 3.861957, 5.632514
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
var radius = 7.747961;
var distance = 34.47155;
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
mvMatrix.translate( -0.285099, -0.5090622, -0.2149632 );
mvMatrix.scale( 1.207044, 1.249256, 0.7731581 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.47155);
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
DL-Phosphinothricin<-read.table("DL-Phosphinothricin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DL-Phosphinothricin$V2
```

```
## Error in eval(expr, envir, enclos): object 'DL' not found
```

```r
y<-DL-Phosphinothricin$V3
```

```
## Error in eval(expr, envir, enclos): object 'DL' not found
```

```r
z<-DL-Phosphinothricin$V4
```

```
## Error in eval(expr, envir, enclos): object 'DL' not found
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
-3.083979, 0.4361468, 1.358806, 0, 0, 1, 1, 1,
-2.873683, -0.5814188, -1.657068, 1, 0, 0, 1, 1,
-2.873465, 0.3557681, -1.42354, 1, 0, 0, 1, 1,
-2.847906, 0.3078028, -1.625385, 1, 0, 0, 1, 1,
-2.783445, 0.5440438, -2.165618, 1, 0, 0, 1, 1,
-2.765682, 1.511853, -1.517287, 1, 0, 0, 1, 1,
-2.765018, 0.9764456, -0.2067182, 0, 0, 0, 1, 1,
-2.743623, 0.4931604, -1.953177, 0, 0, 0, 1, 1,
-2.694403, -1.197051, -2.454604, 0, 0, 0, 1, 1,
-2.591456, -0.4419815, -2.714367, 0, 0, 0, 1, 1,
-2.44305, -0.6887058, -2.892799, 0, 0, 0, 1, 1,
-2.423244, -0.3476471, -0.4166577, 0, 0, 0, 1, 1,
-2.415909, -1.038114, -2.59899, 0, 0, 0, 1, 1,
-2.392186, 0.8386962, -3.198451, 1, 1, 1, 1, 1,
-2.343844, 0.7106847, -2.590703, 1, 1, 1, 1, 1,
-2.303222, 0.3966988, -0.546198, 1, 1, 1, 1, 1,
-2.297421, -0.3175188, -2.163195, 1, 1, 1, 1, 1,
-2.226864, -1.00586, -2.768743, 1, 1, 1, 1, 1,
-2.185092, 1.072935, -1.598315, 1, 1, 1, 1, 1,
-2.177531, -1.158928, -2.405232, 1, 1, 1, 1, 1,
-2.174408, 0.08426661, -1.560107, 1, 1, 1, 1, 1,
-2.158155, 0.8303238, -2.416445, 1, 1, 1, 1, 1,
-2.153273, 0.02843954, -1.380741, 1, 1, 1, 1, 1,
-2.100631, -0.4062679, -2.082514, 1, 1, 1, 1, 1,
-2.0854, -1.014558, -2.06514, 1, 1, 1, 1, 1,
-2.057262, -1.326664, -2.909889, 1, 1, 1, 1, 1,
-2.043485, 0.5185685, -0.5047038, 1, 1, 1, 1, 1,
-2.003569, 0.4957254, -0.4843634, 1, 1, 1, 1, 1,
-1.974214, 0.6575564, -2.61784, 0, 0, 1, 1, 1,
-1.934981, 0.3902139, 0.2114901, 1, 0, 0, 1, 1,
-1.885447, 1.404342, -0.8258469, 1, 0, 0, 1, 1,
-1.885425, -0.5542558, -3.730377, 1, 0, 0, 1, 1,
-1.884871, 0.2868034, -1.623425, 1, 0, 0, 1, 1,
-1.883168, 1.087089, -0.7370056, 1, 0, 0, 1, 1,
-1.869322, -0.2893779, -1.817151, 0, 0, 0, 1, 1,
-1.867741, -1.180721, -1.870761, 0, 0, 0, 1, 1,
-1.863696, 2.438548, -0.6863655, 0, 0, 0, 1, 1,
-1.85479, -0.726881, -3.17209, 0, 0, 0, 1, 1,
-1.82129, 0.929208, -2.05879, 0, 0, 0, 1, 1,
-1.814091, -0.7478516, -1.876904, 0, 0, 0, 1, 1,
-1.797985, -0.7194543, -3.873076, 0, 0, 0, 1, 1,
-1.769721, 0.1258054, -0.06398571, 1, 1, 1, 1, 1,
-1.760249, -0.06748591, -1.955046, 1, 1, 1, 1, 1,
-1.752815, -1.045457, -1.770425, 1, 1, 1, 1, 1,
-1.738297, 0.9697925, -0.5588151, 1, 1, 1, 1, 1,
-1.731602, 1.24653, -1.179607, 1, 1, 1, 1, 1,
-1.722933, -0.09566512, -1.266157, 1, 1, 1, 1, 1,
-1.716519, 1.232756, -0.5381708, 1, 1, 1, 1, 1,
-1.706458, 0.4755205, -1.066446, 1, 1, 1, 1, 1,
-1.694782, -0.8019568, -0.9022142, 1, 1, 1, 1, 1,
-1.691048, 1.72278, -1.007386, 1, 1, 1, 1, 1,
-1.681543, -1.571318, -2.044068, 1, 1, 1, 1, 1,
-1.67183, 0.7553693, -2.042001, 1, 1, 1, 1, 1,
-1.656161, 0.4131741, -2.174804, 1, 1, 1, 1, 1,
-1.6457, -0.5904868, -1.238089, 1, 1, 1, 1, 1,
-1.645591, -0.9474915, 1.131796, 1, 1, 1, 1, 1,
-1.64232, -1.357971, -2.830541, 0, 0, 1, 1, 1,
-1.640372, -2.121672, -2.729842, 1, 0, 0, 1, 1,
-1.635132, -1.608994, -2.070987, 1, 0, 0, 1, 1,
-1.634689, 0.3438732, -0.1692623, 1, 0, 0, 1, 1,
-1.634501, 1.225292, 0.1809458, 1, 0, 0, 1, 1,
-1.62353, 0.1848618, -0.5060695, 1, 0, 0, 1, 1,
-1.606829, 0.3004795, -1.211515, 0, 0, 0, 1, 1,
-1.6066, 0.2247209, -0.3227892, 0, 0, 0, 1, 1,
-1.598068, -1.529794, -3.394602, 0, 0, 0, 1, 1,
-1.582966, -0.1024351, -0.06687105, 0, 0, 0, 1, 1,
-1.57311, -1.046391, -3.317115, 0, 0, 0, 1, 1,
-1.571018, -1.261988, -1.726379, 0, 0, 0, 1, 1,
-1.566209, 0.3870804, 0.1894075, 0, 0, 0, 1, 1,
-1.540582, -0.08377668, -2.042265, 1, 1, 1, 1, 1,
-1.52231, 1.416807, -0.7457144, 1, 1, 1, 1, 1,
-1.516022, 0.3091507, -1.537631, 1, 1, 1, 1, 1,
-1.509083, 0.9443203, 1.203304, 1, 1, 1, 1, 1,
-1.504143, -0.6354885, -1.491793, 1, 1, 1, 1, 1,
-1.50384, -0.1361933, -0.7476768, 1, 1, 1, 1, 1,
-1.479209, -1.116661, -2.075078, 1, 1, 1, 1, 1,
-1.476705, 0.6975458, -0.8265741, 1, 1, 1, 1, 1,
-1.474362, 1.694084, -1.376268, 1, 1, 1, 1, 1,
-1.470738, -0.7199833, -0.7412767, 1, 1, 1, 1, 1,
-1.437977, -1.030148, -0.6969348, 1, 1, 1, 1, 1,
-1.430311, -0.7840305, -3.527769, 1, 1, 1, 1, 1,
-1.429871, 0.2993155, -1.511257, 1, 1, 1, 1, 1,
-1.423305, 0.1284362, -0.3278224, 1, 1, 1, 1, 1,
-1.421803, -0.4977556, -0.9030672, 1, 1, 1, 1, 1,
-1.417934, 0.2095119, -2.325311, 0, 0, 1, 1, 1,
-1.415775, 0.5983892, -2.601858, 1, 0, 0, 1, 1,
-1.404077, -0.2555805, -0.9918564, 1, 0, 0, 1, 1,
-1.397742, 1.348871, -1.200138, 1, 0, 0, 1, 1,
-1.391605, 0.2422743, -1.407633, 1, 0, 0, 1, 1,
-1.386793, -1.455167, -4.015489, 1, 0, 0, 1, 1,
-1.381252, 0.5577381, 0.6964381, 0, 0, 0, 1, 1,
-1.372112, -0.506403, -2.893072, 0, 0, 0, 1, 1,
-1.371889, 1.448176, 0.3224871, 0, 0, 0, 1, 1,
-1.370416, -0.8117493, -2.781602, 0, 0, 0, 1, 1,
-1.367357, -0.5002494, -2.499641, 0, 0, 0, 1, 1,
-1.35173, -0.05973807, -3.136981, 0, 0, 0, 1, 1,
-1.342359, -0.339102, -2.79459, 0, 0, 0, 1, 1,
-1.328648, -0.1145835, -1.597924, 1, 1, 1, 1, 1,
-1.323763, 0.373639, -0.9185283, 1, 1, 1, 1, 1,
-1.322118, -1.071895, -1.96045, 1, 1, 1, 1, 1,
-1.306554, -0.5658627, -3.736316, 1, 1, 1, 1, 1,
-1.303389, 0.7130471, -0.9283952, 1, 1, 1, 1, 1,
-1.285084, -0.8243933, -1.307319, 1, 1, 1, 1, 1,
-1.264075, -0.5663247, -3.095797, 1, 1, 1, 1, 1,
-1.248253, 1.251386, -1.011021, 1, 1, 1, 1, 1,
-1.246899, 0.2231569, -1.531774, 1, 1, 1, 1, 1,
-1.233761, -1.281347, -3.588202, 1, 1, 1, 1, 1,
-1.228567, -0.5978982, -1.393183, 1, 1, 1, 1, 1,
-1.226197, 1.535971, -0.6566446, 1, 1, 1, 1, 1,
-1.215607, 0.7461407, -1.285149, 1, 1, 1, 1, 1,
-1.212919, 0.246245, -1.985956, 1, 1, 1, 1, 1,
-1.21075, 0.6804608, -0.6279583, 1, 1, 1, 1, 1,
-1.204542, -0.9137793, -1.288666, 0, 0, 1, 1, 1,
-1.186782, -0.03986192, -2.986295, 1, 0, 0, 1, 1,
-1.182361, 2.094872, -0.07240252, 1, 0, 0, 1, 1,
-1.175479, 0.2240132, -1.709358, 1, 0, 0, 1, 1,
-1.174579, 1.641426, -1.277102, 1, 0, 0, 1, 1,
-1.171418, 1.874603, 1.323088, 1, 0, 0, 1, 1,
-1.166992, -0.05842074, -0.08455471, 0, 0, 0, 1, 1,
-1.152109, 0.6144015, -0.048419, 0, 0, 0, 1, 1,
-1.150551, 1.502729, -1.536259, 0, 0, 0, 1, 1,
-1.144567, 0.7780994, -0.2120136, 0, 0, 0, 1, 1,
-1.137461, -1.179719, -1.743219, 0, 0, 0, 1, 1,
-1.137237, -0.02864672, -1.300569, 0, 0, 0, 1, 1,
-1.136319, -1.683172, -1.807913, 0, 0, 0, 1, 1,
-1.135887, 0.633773, -1.754104, 1, 1, 1, 1, 1,
-1.134141, -0.01631874, -1.800869, 1, 1, 1, 1, 1,
-1.133248, 1.350665, -2.490641, 1, 1, 1, 1, 1,
-1.125236, -0.404824, -1.899019, 1, 1, 1, 1, 1,
-1.124777, 0.1068814, -0.2744566, 1, 1, 1, 1, 1,
-1.122847, -1.54028, -2.569545, 1, 1, 1, 1, 1,
-1.122155, 0.6147905, -2.068397, 1, 1, 1, 1, 1,
-1.121256, -0.07974304, -3.326529, 1, 1, 1, 1, 1,
-1.118574, -0.8305007, -2.730334, 1, 1, 1, 1, 1,
-1.112867, 0.7038665, 0.1066117, 1, 1, 1, 1, 1,
-1.107908, 0.3354976, -0.4347734, 1, 1, 1, 1, 1,
-1.10624, -1.223657, -1.506012, 1, 1, 1, 1, 1,
-1.103818, -1.06788, -2.501538, 1, 1, 1, 1, 1,
-1.10229, -1.099284, -2.774823, 1, 1, 1, 1, 1,
-1.10223, 0.03768006, -4.099246, 1, 1, 1, 1, 1,
-1.078784, 2.424586, -0.4088985, 0, 0, 1, 1, 1,
-1.075472, -0.3158868, -0.4925533, 1, 0, 0, 1, 1,
-1.067028, 0.07540319, -1.617656, 1, 0, 0, 1, 1,
-1.065969, -0.8689748, -1.844325, 1, 0, 0, 1, 1,
-1.059618, 1.10187, 0.1943287, 1, 0, 0, 1, 1,
-1.059101, 0.1828088, -3.631074, 1, 0, 0, 1, 1,
-1.056206, 0.0984271, -0.518914, 0, 0, 0, 1, 1,
-1.056019, 1.187743, -2.192033, 0, 0, 0, 1, 1,
-1.053632, 0.9072108, -0.1381747, 0, 0, 0, 1, 1,
-1.050099, 0.2576741, -2.636031, 0, 0, 0, 1, 1,
-1.045449, 0.05249982, -0.6935046, 0, 0, 0, 1, 1,
-1.042751, 0.05217275, 0.08811426, 0, 0, 0, 1, 1,
-1.040323, -0.2869201, -0.5171742, 0, 0, 0, 1, 1,
-1.038518, -1.122249, -2.192391, 1, 1, 1, 1, 1,
-1.033715, -0.2317419, -2.080905, 1, 1, 1, 1, 1,
-1.029962, 0.6562665, -1.614137, 1, 1, 1, 1, 1,
-1.026371, 1.067011, -0.1959417, 1, 1, 1, 1, 1,
-1.02293, 0.2537398, 0.01624562, 1, 1, 1, 1, 1,
-1.018092, -1.841171, -1.456509, 1, 1, 1, 1, 1,
-1.016368, -0.1608254, -0.5689203, 1, 1, 1, 1, 1,
-1.015801, 0.2945619, -1.753548, 1, 1, 1, 1, 1,
-1.013265, 0.8566733, 0.9843289, 1, 1, 1, 1, 1,
-1.00857, -0.3333952, -3.396048, 1, 1, 1, 1, 1,
-0.9955872, 0.5394933, -2.223653, 1, 1, 1, 1, 1,
-0.9940903, -0.679749, -2.619, 1, 1, 1, 1, 1,
-0.9882081, -1.540861, -2.263431, 1, 1, 1, 1, 1,
-0.9877324, -0.26223, -2.438148, 1, 1, 1, 1, 1,
-0.9842932, 1.202239, -0.3748317, 1, 1, 1, 1, 1,
-0.9785039, -1.137819, -1.82468, 0, 0, 1, 1, 1,
-0.9719209, 0.08689966, 0.4383947, 1, 0, 0, 1, 1,
-0.9610742, 0.891553, 0.4595578, 1, 0, 0, 1, 1,
-0.9610571, -0.9327666, -1.687863, 1, 0, 0, 1, 1,
-0.9531024, 0.820847, -0.8240492, 1, 0, 0, 1, 1,
-0.9529861, -0.5815459, -1.715633, 1, 0, 0, 1, 1,
-0.9496881, 0.9652373, -0.2783643, 0, 0, 0, 1, 1,
-0.9273679, -0.353774, -3.380689, 0, 0, 0, 1, 1,
-0.9273103, 1.468149, -2.000201, 0, 0, 0, 1, 1,
-0.925976, 1.269837, 0.5423184, 0, 0, 0, 1, 1,
-0.9214869, -0.02460294, -2.116621, 0, 0, 0, 1, 1,
-0.9214178, -0.1386099, -0.5063816, 0, 0, 0, 1, 1,
-0.920696, 0.2403735, -1.948522, 0, 0, 0, 1, 1,
-0.9179897, 0.002956361, -1.774585, 1, 1, 1, 1, 1,
-0.9112651, -0.6104825, -3.246815, 1, 1, 1, 1, 1,
-0.9027568, -0.801292, -4.120064, 1, 1, 1, 1, 1,
-0.9007734, -1.278833, -2.698357, 1, 1, 1, 1, 1,
-0.8998858, 0.6072206, -1.913578, 1, 1, 1, 1, 1,
-0.886022, -1.148325, -2.632388, 1, 1, 1, 1, 1,
-0.8795313, -1.089421, -1.425046, 1, 1, 1, 1, 1,
-0.8786109, -1.526789, -4.128512, 1, 1, 1, 1, 1,
-0.8783202, -0.8936706, -2.149436, 1, 1, 1, 1, 1,
-0.8746439, 0.09305997, -2.395716, 1, 1, 1, 1, 1,
-0.8648586, 0.8359798, -0.8263125, 1, 1, 1, 1, 1,
-0.8468621, -0.3634715, -1.26285, 1, 1, 1, 1, 1,
-0.8251822, 1.279809, -0.4571496, 1, 1, 1, 1, 1,
-0.8220777, -0.2938534, -0.4522566, 1, 1, 1, 1, 1,
-0.8213464, -0.7918389, -1.812156, 1, 1, 1, 1, 1,
-0.8157563, 1.176463, -1.284059, 0, 0, 1, 1, 1,
-0.8104346, -1.013232, -2.156389, 1, 0, 0, 1, 1,
-0.7987137, -0.06607892, -3.683201, 1, 0, 0, 1, 1,
-0.793131, 0.22995, -2.099915, 1, 0, 0, 1, 1,
-0.7779099, 0.1176651, -1.249995, 1, 0, 0, 1, 1,
-0.7758532, 1.25753, -0.7181906, 1, 0, 0, 1, 1,
-0.7733879, 0.247177, -1.039507, 0, 0, 0, 1, 1,
-0.7694818, -0.841278, -1.721058, 0, 0, 0, 1, 1,
-0.7686408, 2.016773, -0.4119321, 0, 0, 0, 1, 1,
-0.7686207, 0.9445946, -0.5595213, 0, 0, 0, 1, 1,
-0.762888, 1.828331, -0.1838958, 0, 0, 0, 1, 1,
-0.7626253, -0.3302087, -0.4191318, 0, 0, 0, 1, 1,
-0.7605727, 0.3995752, -1.23044, 0, 0, 0, 1, 1,
-0.7588146, -0.1177725, 0.3276964, 1, 1, 1, 1, 1,
-0.7554787, -0.5896993, -2.211811, 1, 1, 1, 1, 1,
-0.7534714, -0.5718137, -0.6142533, 1, 1, 1, 1, 1,
-0.7521948, 0.9933403, -1.530029, 1, 1, 1, 1, 1,
-0.7510728, 1.195571, 0.8586926, 1, 1, 1, 1, 1,
-0.7490095, -1.28222, -3.250784, 1, 1, 1, 1, 1,
-0.7480214, -0.01417837, -0.8938902, 1, 1, 1, 1, 1,
-0.7472972, 0.656879, -0.968141, 1, 1, 1, 1, 1,
-0.7465814, 1.307167, -0.4218521, 1, 1, 1, 1, 1,
-0.7429454, 1.155982, -1.587447, 1, 1, 1, 1, 1,
-0.7404874, -0.02778705, -3.171334, 1, 1, 1, 1, 1,
-0.7396789, 0.01577663, -2.232422, 1, 1, 1, 1, 1,
-0.7388546, -0.233611, -1.537355, 1, 1, 1, 1, 1,
-0.7379133, -0.716696, -2.815069, 1, 1, 1, 1, 1,
-0.737337, 0.3032341, -1.546267, 1, 1, 1, 1, 1,
-0.7260196, -1.306335, -0.9977221, 0, 0, 1, 1, 1,
-0.7218521, -0.5071236, -2.301232, 1, 0, 0, 1, 1,
-0.7183278, -1.099306, -1.674154, 1, 0, 0, 1, 1,
-0.7155538, 0.1825528, -0.1433286, 1, 0, 0, 1, 1,
-0.7139366, -0.2390278, -0.921227, 1, 0, 0, 1, 1,
-0.7073372, 1.921814, -0.2207367, 1, 0, 0, 1, 1,
-0.7059426, 0.3416339, -0.5833133, 0, 0, 0, 1, 1,
-0.704783, 0.847294, -0.9429144, 0, 0, 0, 1, 1,
-0.6967397, 0.658954, -0.09086934, 0, 0, 0, 1, 1,
-0.694034, -0.8524807, -1.973832, 0, 0, 0, 1, 1,
-0.6928934, 0.09558126, -1.696692, 0, 0, 0, 1, 1,
-0.6897838, -1.860061, -3.953615, 0, 0, 0, 1, 1,
-0.6823534, -2.521367, -2.004123, 0, 0, 0, 1, 1,
-0.6811504, -0.00187592, -0.9046952, 1, 1, 1, 1, 1,
-0.6786686, 1.257066, -1.149978, 1, 1, 1, 1, 1,
-0.6758281, -0.437254, -2.373145, 1, 1, 1, 1, 1,
-0.6743773, 0.6096156, 0.2105277, 1, 1, 1, 1, 1,
-0.6698843, 0.08396333, -0.2057711, 1, 1, 1, 1, 1,
-0.6662821, 0.9038213, -1.403456, 1, 1, 1, 1, 1,
-0.6646003, -1.839189, -2.421629, 1, 1, 1, 1, 1,
-0.6598074, -2.62344, -1.399353, 1, 1, 1, 1, 1,
-0.6575437, -0.8023915, -1.596637, 1, 1, 1, 1, 1,
-0.6515027, 0.9746501, -0.7407463, 1, 1, 1, 1, 1,
-0.6446959, -0.1666797, -1.891721, 1, 1, 1, 1, 1,
-0.6438079, 0.3287404, 0.4324571, 1, 1, 1, 1, 1,
-0.6409432, -0.2084298, -1.75851, 1, 1, 1, 1, 1,
-0.6382113, -0.7505762, -3.341407, 1, 1, 1, 1, 1,
-0.6375313, 1.24004, 1.38915, 1, 1, 1, 1, 1,
-0.6352293, 0.9930253, -0.7015159, 0, 0, 1, 1, 1,
-0.6351442, 0.5049531, -0.3980897, 1, 0, 0, 1, 1,
-0.6323865, 1.414894, -2.075099, 1, 0, 0, 1, 1,
-0.629033, 0.4790514, -0.3242557, 1, 0, 0, 1, 1,
-0.6223642, -2.068812, -2.589597, 1, 0, 0, 1, 1,
-0.616307, -0.5229638, -2.425623, 1, 0, 0, 1, 1,
-0.6090536, -0.7588649, -0.5589606, 0, 0, 0, 1, 1,
-0.6084909, -0.06343812, -3.546493, 0, 0, 0, 1, 1,
-0.6073688, 0.08585002, 0.5419804, 0, 0, 0, 1, 1,
-0.6043155, 2.036981, 0.8898705, 0, 0, 0, 1, 1,
-0.6024138, 0.4987342, -1.198441, 0, 0, 0, 1, 1,
-0.5973973, -0.03446407, -2.216353, 0, 0, 0, 1, 1,
-0.5902997, -1.030712, -2.134733, 0, 0, 0, 1, 1,
-0.5894448, -1.11614, -3.092981, 1, 1, 1, 1, 1,
-0.5860423, -0.3865242, -1.711344, 1, 1, 1, 1, 1,
-0.586006, 0.5812342, -1.03115, 1, 1, 1, 1, 1,
-0.5826663, -0.5825218, -3.315618, 1, 1, 1, 1, 1,
-0.5818614, -0.5658724, -4.686551, 1, 1, 1, 1, 1,
-0.5807904, 0.1587853, 1.367859, 1, 1, 1, 1, 1,
-0.5782292, 0.7954293, -1.662102, 1, 1, 1, 1, 1,
-0.5767072, 2.377488, 1.436062, 1, 1, 1, 1, 1,
-0.5766085, -0.444963, -3.301862, 1, 1, 1, 1, 1,
-0.5760052, -2.066124, -1.709281, 1, 1, 1, 1, 1,
-0.5715107, 1.091499, -0.789318, 1, 1, 1, 1, 1,
-0.5694976, 0.6962804, 0.1769028, 1, 1, 1, 1, 1,
-0.5689116, -1.420322, -3.290331, 1, 1, 1, 1, 1,
-0.5655531, -0.4599117, -0.541399, 1, 1, 1, 1, 1,
-0.5633715, 0.8100893, -1.649535, 1, 1, 1, 1, 1,
-0.5600533, 0.5474577, -0.2636351, 0, 0, 1, 1, 1,
-0.557819, 1.657788, -0.2737153, 1, 0, 0, 1, 1,
-0.55136, 0.8042755, -1.173144, 1, 0, 0, 1, 1,
-0.5507671, -1.841227, -3.237073, 1, 0, 0, 1, 1,
-0.5487707, 0.9445685, -1.012278, 1, 0, 0, 1, 1,
-0.5482869, 1.427805, 1.092571, 1, 0, 0, 1, 1,
-0.5423343, 0.6642129, -0.01884867, 0, 0, 0, 1, 1,
-0.5377417, 1.74064, -0.5906392, 0, 0, 0, 1, 1,
-0.5284361, -1.097842, -2.274911, 0, 0, 0, 1, 1,
-0.5223503, 1.381793, -2.593975, 0, 0, 0, 1, 1,
-0.5192576, -0.8986742, -3.265347, 0, 0, 0, 1, 1,
-0.5178979, -0.04645995, 0.7580811, 0, 0, 0, 1, 1,
-0.5167147, 1.115261, 1.120893, 0, 0, 0, 1, 1,
-0.512098, 1.18889, 1.376816, 1, 1, 1, 1, 1,
-0.5095515, 0.361911, -1.460983, 1, 1, 1, 1, 1,
-0.5091134, 0.2302175, -0.2423644, 1, 1, 1, 1, 1,
-0.5029765, -0.8171683, -2.028803, 1, 1, 1, 1, 1,
-0.5023855, 0.3177391, -1.725462, 1, 1, 1, 1, 1,
-0.5020247, -0.3980244, -1.644519, 1, 1, 1, 1, 1,
-0.5017848, -1.045232, -3.311752, 1, 1, 1, 1, 1,
-0.4958714, 0.1776002, -0.4765957, 1, 1, 1, 1, 1,
-0.4886572, 2.45047, -0.0046465, 1, 1, 1, 1, 1,
-0.4882694, 0.6686937, -0.4638597, 1, 1, 1, 1, 1,
-0.4861684, -0.378827, -2.698004, 1, 1, 1, 1, 1,
-0.4861622, -0.829141, -1.002326, 1, 1, 1, 1, 1,
-0.4848383, 0.4308467, -2.097537, 1, 1, 1, 1, 1,
-0.4833486, 1.379009, -0.2501781, 1, 1, 1, 1, 1,
-0.4825668, 0.1027761, -0.5147871, 1, 1, 1, 1, 1,
-0.4788225, 0.2269834, -2.753017, 0, 0, 1, 1, 1,
-0.4780576, 0.8712712, -0.9067883, 1, 0, 0, 1, 1,
-0.4673787, -0.2423104, -1.713058, 1, 0, 0, 1, 1,
-0.4644341, -1.378964, -2.000127, 1, 0, 0, 1, 1,
-0.4614793, 1.591073, -0.563978, 1, 0, 0, 1, 1,
-0.4603858, 0.4258029, 0.1052188, 1, 0, 0, 1, 1,
-0.4577482, -2.746175, -1.940885, 0, 0, 0, 1, 1,
-0.4552787, -0.791506, -2.214373, 0, 0, 0, 1, 1,
-0.4551348, 0.424168, -1.498672, 0, 0, 0, 1, 1,
-0.4492589, 0.2444481, -1.698015, 0, 0, 0, 1, 1,
-0.4486006, 0.8411488, -0.8709624, 0, 0, 0, 1, 1,
-0.4398706, -1.40338, -3.226163, 0, 0, 0, 1, 1,
-0.4326327, -0.9081779, -1.923345, 0, 0, 0, 1, 1,
-0.4265682, -0.7439969, -3.597638, 1, 1, 1, 1, 1,
-0.4260164, 0.7487049, -0.85013, 1, 1, 1, 1, 1,
-0.4173947, 0.1575308, -0.4027432, 1, 1, 1, 1, 1,
-0.4158777, 1.086626, 0.3784925, 1, 1, 1, 1, 1,
-0.414356, -0.950481, -2.237863, 1, 1, 1, 1, 1,
-0.4053653, 0.1838067, -0.6181979, 1, 1, 1, 1, 1,
-0.4048791, 0.7910456, -0.1540082, 1, 1, 1, 1, 1,
-0.4041193, -0.2720408, -3.50029, 1, 1, 1, 1, 1,
-0.4024932, 0.2963333, -0.2399667, 1, 1, 1, 1, 1,
-0.4022636, 0.4725767, 0.8164272, 1, 1, 1, 1, 1,
-0.3997182, -0.433389, -3.173535, 1, 1, 1, 1, 1,
-0.3973005, 0.9704826, -1.167212, 1, 1, 1, 1, 1,
-0.3937394, 0.2567988, -0.8371527, 1, 1, 1, 1, 1,
-0.3908652, -0.3601645, -1.478958, 1, 1, 1, 1, 1,
-0.3902857, -0.3073198, -2.720349, 1, 1, 1, 1, 1,
-0.3895541, -0.6680194, -3.054513, 0, 0, 1, 1, 1,
-0.3883212, -1.149294, -2.120197, 1, 0, 0, 1, 1,
-0.3870936, -0.09976782, -1.467948, 1, 0, 0, 1, 1,
-0.3827747, -0.1941872, -2.170752, 1, 0, 0, 1, 1,
-0.379519, 1.412045, 0.2154626, 1, 0, 0, 1, 1,
-0.3774109, 0.7195584, -0.4557144, 1, 0, 0, 1, 1,
-0.3758883, 0.60465, -0.7457418, 0, 0, 0, 1, 1,
-0.3737288, -0.883434, -2.675231, 0, 0, 0, 1, 1,
-0.3711166, 0.02127098, -3.225453, 0, 0, 0, 1, 1,
-0.3708904, 1.883879, 1.059944, 0, 0, 0, 1, 1,
-0.370641, 0.03635916, -3.387914, 0, 0, 0, 1, 1,
-0.3680209, -0.9735586, -3.101588, 0, 0, 0, 1, 1,
-0.3614939, -0.5813202, -3.301179, 0, 0, 0, 1, 1,
-0.3609436, -0.2672028, -2.471096, 1, 1, 1, 1, 1,
-0.3602868, 0.006085631, -1.341526, 1, 1, 1, 1, 1,
-0.3584155, -0.9963917, -3.843751, 1, 1, 1, 1, 1,
-0.358004, 0.3173833, 0.592081, 1, 1, 1, 1, 1,
-0.3551148, -0.7225575, -2.366591, 1, 1, 1, 1, 1,
-0.3543567, 2.612426, 0.2232825, 1, 1, 1, 1, 1,
-0.3542893, -0.1164789, -1.560717, 1, 1, 1, 1, 1,
-0.35373, -0.2152881, -0.3869271, 1, 1, 1, 1, 1,
-0.3482604, 1.826144, -1.359756, 1, 1, 1, 1, 1,
-0.3429531, -0.8431289, -1.683359, 1, 1, 1, 1, 1,
-0.3406509, 0.4837505, 0.9202352, 1, 1, 1, 1, 1,
-0.332783, -0.1783688, -2.136253, 1, 1, 1, 1, 1,
-0.3293727, 0.01699414, -1.389702, 1, 1, 1, 1, 1,
-0.3263384, 0.3196844, -0.04077467, 1, 1, 1, 1, 1,
-0.3227969, -1.128834, -3.9152, 1, 1, 1, 1, 1,
-0.3106997, 0.675689, -1.298516, 0, 0, 1, 1, 1,
-0.3085914, -0.9696688, -3.041452, 1, 0, 0, 1, 1,
-0.3065018, 0.7856907, -0.2794138, 1, 0, 0, 1, 1,
-0.3012855, -0.4213153, -3.161616, 1, 0, 0, 1, 1,
-0.2994245, -0.2810122, -3.302089, 1, 0, 0, 1, 1,
-0.2963059, 0.6087315, -0.3524046, 1, 0, 0, 1, 1,
-0.2957111, -1.441345, -3.663205, 0, 0, 0, 1, 1,
-0.2911613, -0.2381517, -2.318998, 0, 0, 0, 1, 1,
-0.288398, -1.298465, -2.287607, 0, 0, 0, 1, 1,
-0.2856083, -0.9965782, -3.179028, 0, 0, 0, 1, 1,
-0.2853214, -0.2875699, -3.58005, 0, 0, 0, 1, 1,
-0.2850452, -1.436379, -5.044796, 0, 0, 0, 1, 1,
-0.2805668, 0.7677534, 0.5754271, 0, 0, 0, 1, 1,
-0.2789575, -0.3119102, -2.715313, 1, 1, 1, 1, 1,
-0.2784536, -0.8905825, -4.309806, 1, 1, 1, 1, 1,
-0.2737968, 0.08212431, -1.635486, 1, 1, 1, 1, 1,
-0.2717994, 1.802041, 0.09146049, 1, 1, 1, 1, 1,
-0.2584856, 0.0467595, -1.388502, 1, 1, 1, 1, 1,
-0.2571296, 0.3700603, 0.05158501, 1, 1, 1, 1, 1,
-0.2568608, -1.091193, -1.738384, 1, 1, 1, 1, 1,
-0.2566966, -0.2494002, -2.116366, 1, 1, 1, 1, 1,
-0.2561706, 0.2298515, -1.130324, 1, 1, 1, 1, 1,
-0.2558619, -2.312679, -3.206466, 1, 1, 1, 1, 1,
-0.2550661, -2.030131, -3.290085, 1, 1, 1, 1, 1,
-0.2545224, 0.9380575, -0.3982789, 1, 1, 1, 1, 1,
-0.2521, -0.202195, 0.3103653, 1, 1, 1, 1, 1,
-0.2444396, -0.2239281, -2.444747, 1, 1, 1, 1, 1,
-0.2420364, 0.7869505, 1.870928, 1, 1, 1, 1, 1,
-0.2399963, 0.2426917, -1.979677, 0, 0, 1, 1, 1,
-0.2398555, 0.1405424, -2.910574, 1, 0, 0, 1, 1,
-0.2327614, 0.1562058, -0.9864156, 1, 0, 0, 1, 1,
-0.2322308, -1.374685, -3.360137, 1, 0, 0, 1, 1,
-0.2320948, -1.228716, -4.033558, 1, 0, 0, 1, 1,
-0.2301146, 0.8434804, 0.5635399, 1, 0, 0, 1, 1,
-0.229952, -1.350348, -2.115087, 0, 0, 0, 1, 1,
-0.2286801, -1.339535, -5.037736, 0, 0, 0, 1, 1,
-0.2232113, 0.206541, -1.992025, 0, 0, 0, 1, 1,
-0.2226343, -0.2178782, -0.7959203, 0, 0, 0, 1, 1,
-0.2220202, -0.7271227, -3.144023, 0, 0, 0, 1, 1,
-0.2217851, -0.2278826, -3.198814, 0, 0, 0, 1, 1,
-0.2208724, 1.782023, -0.5363922, 0, 0, 0, 1, 1,
-0.2202086, -0.2984537, -2.956198, 1, 1, 1, 1, 1,
-0.215311, 1.143001, -0.6825913, 1, 1, 1, 1, 1,
-0.2096808, 0.7470326, -0.617278, 1, 1, 1, 1, 1,
-0.2095732, 0.8320951, -0.7260966, 1, 1, 1, 1, 1,
-0.1998186, 1.432159, -0.9753956, 1, 1, 1, 1, 1,
-0.1949186, -0.9114199, -3.148618, 1, 1, 1, 1, 1,
-0.185439, 1.215363, 1.466397, 1, 1, 1, 1, 1,
-0.1847807, -0.2228098, -3.336001, 1, 1, 1, 1, 1,
-0.1823805, 0.7900082, -1.594882, 1, 1, 1, 1, 1,
-0.1800038, 0.6865444, 1.074144, 1, 1, 1, 1, 1,
-0.1786901, -0.8988431, -4.642138, 1, 1, 1, 1, 1,
-0.1765079, 0.005502238, -0.08072892, 1, 1, 1, 1, 1,
-0.1753161, -0.08568015, -1.002806, 1, 1, 1, 1, 1,
-0.1710155, -1.274605, -3.464165, 1, 1, 1, 1, 1,
-0.1703445, -1.052593, -1.570702, 1, 1, 1, 1, 1,
-0.1683876, -0.6534779, -3.157732, 0, 0, 1, 1, 1,
-0.1638645, 0.9424962, -0.06030159, 1, 0, 0, 1, 1,
-0.1620573, 0.1413437, -2.179228, 1, 0, 0, 1, 1,
-0.1613186, 0.1389689, -1.059668, 1, 0, 0, 1, 1,
-0.161132, -0.2434745, -0.6671391, 1, 0, 0, 1, 1,
-0.1595014, 1.850134, 1.507128, 1, 0, 0, 1, 1,
-0.1550381, 0.4777472, -0.04012421, 0, 0, 0, 1, 1,
-0.1471795, 0.7429443, -0.1342104, 0, 0, 0, 1, 1,
-0.1465375, 0.1636444, 1.381366, 0, 0, 0, 1, 1,
-0.1422432, -0.1706523, -2.265668, 0, 0, 0, 1, 1,
-0.1365812, 0.7246509, 1.090286, 0, 0, 0, 1, 1,
-0.1346775, -0.4488001, -2.739136, 0, 0, 0, 1, 1,
-0.1325618, 0.6893197, 0.01305588, 0, 0, 0, 1, 1,
-0.1311068, -1.199902, -4.46194, 1, 1, 1, 1, 1,
-0.1307861, -1.373769, -0.2469442, 1, 1, 1, 1, 1,
-0.1275908, -0.1097531, -1.840939, 1, 1, 1, 1, 1,
-0.125142, -0.6094055, -4.205758, 1, 1, 1, 1, 1,
-0.1244147, -0.8663865, -0.3461634, 1, 1, 1, 1, 1,
-0.1239171, -1.912744, -4.970054, 1, 1, 1, 1, 1,
-0.1096511, -0.8405249, -3.072861, 1, 1, 1, 1, 1,
-0.1061517, -0.7198271, -2.193819, 1, 1, 1, 1, 1,
-0.1055508, 0.199919, -2.106763, 1, 1, 1, 1, 1,
-0.103588, 0.03264493, -0.2301393, 1, 1, 1, 1, 1,
-0.1035295, -0.4279638, -1.808457, 1, 1, 1, 1, 1,
-0.09829643, -0.1870528, -3.720534, 1, 1, 1, 1, 1,
-0.09680066, 3.559628, 0.4806789, 1, 1, 1, 1, 1,
-0.08844979, 1.391354, -0.2752721, 1, 1, 1, 1, 1,
-0.08700176, -2.529819, -2.586836, 1, 1, 1, 1, 1,
-0.08607986, 0.001921633, -0.5274383, 0, 0, 1, 1, 1,
-0.08357179, -1.569083, -3.657489, 1, 0, 0, 1, 1,
-0.08081861, 0.02955374, -0.5724935, 1, 0, 0, 1, 1,
-0.07057674, -0.5081207, -1.532286, 1, 0, 0, 1, 1,
-0.0694423, -1.869999, -2.453886, 1, 0, 0, 1, 1,
-0.06891873, -0.1245184, -2.64289, 1, 0, 0, 1, 1,
-0.06583105, 1.095228, -1.854705, 0, 0, 0, 1, 1,
-0.06258871, 0.7697849, 0.7363673, 0, 0, 0, 1, 1,
-0.06217008, 0.9810458, -2.360938, 0, 0, 0, 1, 1,
-0.06061885, 0.9318503, 2.229549, 0, 0, 0, 1, 1,
-0.059436, -1.431763, -2.228134, 0, 0, 0, 1, 1,
-0.05834613, -0.087873, -1.450999, 0, 0, 0, 1, 1,
-0.05765474, -1.292872, -3.114701, 0, 0, 0, 1, 1,
-0.05078888, 0.5936177, 0.2302382, 1, 1, 1, 1, 1,
-0.04686788, -0.6119791, -2.851414, 1, 1, 1, 1, 1,
-0.04668814, 0.425016, 1.155771, 1, 1, 1, 1, 1,
-0.0459596, -2.612908, -1.762757, 1, 1, 1, 1, 1,
-0.04238635, -1.293744, -2.355553, 1, 1, 1, 1, 1,
-0.04178882, 0.08114666, 0.06690288, 1, 1, 1, 1, 1,
-0.03761803, 0.2010334, 0.2919862, 1, 1, 1, 1, 1,
-0.03645024, -1.793618, -1.871884, 1, 1, 1, 1, 1,
-0.03529684, 0.5779715, 0.2052299, 1, 1, 1, 1, 1,
-0.03529317, 0.2140149, -1.388789, 1, 1, 1, 1, 1,
-0.0345182, -1.17912, -3.159614, 1, 1, 1, 1, 1,
-0.0335561, -0.5168856, -4.24555, 1, 1, 1, 1, 1,
-0.03292457, 0.1108532, -2.865475, 1, 1, 1, 1, 1,
-0.03242568, 0.3300001, -0.1724657, 1, 1, 1, 1, 1,
-0.02511876, -0.8335306, -2.28955, 1, 1, 1, 1, 1,
-0.02392944, -1.196998, -3.80514, 0, 0, 1, 1, 1,
-0.01917648, 0.1588813, -0.3390753, 1, 0, 0, 1, 1,
-0.01760114, 0.8240433, -0.531287, 1, 0, 0, 1, 1,
-0.01476601, -0.0125762, -2.085005, 1, 0, 0, 1, 1,
-0.01326603, 1.423491, -1.922446, 1, 0, 0, 1, 1,
-0.01264159, -0.5562717, -2.004205, 1, 0, 0, 1, 1,
-0.007496863, -0.2791903, -3.554574, 0, 0, 0, 1, 1,
-0.003364746, 0.8065622, 0.1864575, 0, 0, 0, 1, 1,
-0.0006774421, 1.215606, -1.45012, 0, 0, 0, 1, 1,
0.00236761, 1.59833, -0.5026786, 0, 0, 0, 1, 1,
0.002927612, 1.427047, 1.453794, 0, 0, 0, 1, 1,
0.003399501, -0.2699527, 3.585947, 0, 0, 0, 1, 1,
0.00575691, 2.566741, 0.9217022, 0, 0, 0, 1, 1,
0.00681829, -0.4029937, 3.663372, 1, 1, 1, 1, 1,
0.007557218, -1.041489, 2.198612, 1, 1, 1, 1, 1,
0.009177675, -0.2215492, 3.520021, 1, 1, 1, 1, 1,
0.01439082, -1.790058, 2.429399, 1, 1, 1, 1, 1,
0.01461672, 0.1613927, 0.983128, 1, 1, 1, 1, 1,
0.0148301, -1.505505, 2.13918, 1, 1, 1, 1, 1,
0.01503876, 0.1863423, -0.5910019, 1, 1, 1, 1, 1,
0.0169411, 1.997074, 0.6548287, 1, 1, 1, 1, 1,
0.02036371, 2.349926, 0.6413769, 1, 1, 1, 1, 1,
0.02120074, 1.142901, 0.9655433, 1, 1, 1, 1, 1,
0.022034, 0.4686873, -0.279368, 1, 1, 1, 1, 1,
0.02207065, 0.2918383, 1.074044, 1, 1, 1, 1, 1,
0.02652488, 1.266937, 1.358135, 1, 1, 1, 1, 1,
0.03069352, -0.66058, 4.184515, 1, 1, 1, 1, 1,
0.03094225, 1.022284, 0.1300026, 1, 1, 1, 1, 1,
0.03423771, 1.578389, -0.05102992, 0, 0, 1, 1, 1,
0.03568836, 0.1453016, 1.550356, 1, 0, 0, 1, 1,
0.03608928, 0.174533, 1.642396, 1, 0, 0, 1, 1,
0.03974048, 0.499764, -1.470492, 1, 0, 0, 1, 1,
0.04144972, 1.849828, -0.7590579, 1, 0, 0, 1, 1,
0.04453409, 0.416896, -0.9777735, 1, 0, 0, 1, 1,
0.04696146, 0.4037448, 0.3293628, 0, 0, 0, 1, 1,
0.04733896, -0.6280155, 3.985038, 0, 0, 0, 1, 1,
0.05094586, -1.489511, 2.991249, 0, 0, 0, 1, 1,
0.05123458, 0.5550542, -0.3929517, 0, 0, 0, 1, 1,
0.05381564, -0.5447364, 2.907372, 0, 0, 0, 1, 1,
0.05460326, -2.015656, 2.484683, 0, 0, 0, 1, 1,
0.05483128, -0.2681695, 2.98933, 0, 0, 0, 1, 1,
0.05515151, 0.690052, 0.8842654, 1, 1, 1, 1, 1,
0.05750493, -0.6389502, 2.411899, 1, 1, 1, 1, 1,
0.05757242, -0.06313845, 4.111868, 1, 1, 1, 1, 1,
0.05873367, -0.5742018, 4.364751, 1, 1, 1, 1, 1,
0.05988202, 0.3770536, -1.666413, 1, 1, 1, 1, 1,
0.06204711, -0.02517046, 1.835261, 1, 1, 1, 1, 1,
0.06456818, 1.53076, -1.359604, 1, 1, 1, 1, 1,
0.06603839, -0.6554626, 2.464325, 1, 1, 1, 1, 1,
0.06952667, 0.1462573, 1.418503, 1, 1, 1, 1, 1,
0.071203, 0.1946242, 2.423264, 1, 1, 1, 1, 1,
0.0737717, 0.5454789, 0.4665444, 1, 1, 1, 1, 1,
0.07388032, 0.01775662, -0.1652766, 1, 1, 1, 1, 1,
0.07443439, -0.1338208, 1.952983, 1, 1, 1, 1, 1,
0.07465807, 0.1510648, -0.3217836, 1, 1, 1, 1, 1,
0.07753306, 0.9626777, 1.111935, 1, 1, 1, 1, 1,
0.07852169, -0.8829668, 4.441384, 0, 0, 1, 1, 1,
0.08023779, -1.054956, 2.909048, 1, 0, 0, 1, 1,
0.08128845, -0.81252, 2.025386, 1, 0, 0, 1, 1,
0.09391867, 0.1164931, 1.122826, 1, 0, 0, 1, 1,
0.09452757, -0.5655337, 4.892454, 1, 0, 0, 1, 1,
0.09585034, -0.1433983, 2.132848, 1, 0, 0, 1, 1,
0.09722631, 2.082448, -0.5018243, 0, 0, 0, 1, 1,
0.09781259, -0.6307799, 2.070454, 0, 0, 0, 1, 1,
0.1030539, 0.3754362, 1.709948, 0, 0, 0, 1, 1,
0.1035722, 1.760801, -0.1485169, 0, 0, 0, 1, 1,
0.1061055, 1.92206, 0.5298918, 0, 0, 0, 1, 1,
0.1062081, -0.9920756, 3.493158, 0, 0, 0, 1, 1,
0.1070072, -1.772098, 3.686696, 0, 0, 0, 1, 1,
0.1087082, -2.299897, 2.453513, 1, 1, 1, 1, 1,
0.1104519, -1.488206, 5.474722, 1, 1, 1, 1, 1,
0.1114409, -0.7891483, 3.630651, 1, 1, 1, 1, 1,
0.1138242, -0.7994933, 4.410287, 1, 1, 1, 1, 1,
0.1139188, 1.039373, 0.3656586, 1, 1, 1, 1, 1,
0.1157995, 0.4371002, 0.3210497, 1, 1, 1, 1, 1,
0.1169466, 1.898804, -0.7378526, 1, 1, 1, 1, 1,
0.1179117, -0.8829745, 1.936002, 1, 1, 1, 1, 1,
0.1179973, -1.135389, 3.283257, 1, 1, 1, 1, 1,
0.1180656, 0.4076489, 0.3561585, 1, 1, 1, 1, 1,
0.1186625, 1.146011, 0.6199889, 1, 1, 1, 1, 1,
0.1188527, -1.252123, 1.010424, 1, 1, 1, 1, 1,
0.1209679, -0.5009274, 0.9775628, 1, 1, 1, 1, 1,
0.1210925, 3.764299, -0.4781053, 1, 1, 1, 1, 1,
0.1244774, 1.42608, 1.644523, 1, 1, 1, 1, 1,
0.1319824, 0.922206, -0.5727084, 0, 0, 1, 1, 1,
0.1329576, -0.8607992, 3.844701, 1, 0, 0, 1, 1,
0.1354758, -0.4543756, 2.289391, 1, 0, 0, 1, 1,
0.1356891, 1.14863, 1.037587, 1, 0, 0, 1, 1,
0.1379922, -0.1865982, 2.657618, 1, 0, 0, 1, 1,
0.1465796, 0.1084478, 1.514863, 1, 0, 0, 1, 1,
0.1469774, 0.3452292, 0.2534785, 0, 0, 0, 1, 1,
0.1477666, -0.4022934, 4.451877, 0, 0, 0, 1, 1,
0.1485126, -0.6893384, 3.665104, 0, 0, 0, 1, 1,
0.1514301, -1.109437, 3.403904, 0, 0, 0, 1, 1,
0.158472, -2.644846, 4.195351, 0, 0, 0, 1, 1,
0.1604963, 0.6347347, 2.257195, 0, 0, 0, 1, 1,
0.1633765, 0.369009, 1.28236, 0, 0, 0, 1, 1,
0.1650683, 0.138259, -0.44644, 1, 1, 1, 1, 1,
0.1692309, 0.882692, -0.8942257, 1, 1, 1, 1, 1,
0.1697594, 0.08052752, 2.241291, 1, 1, 1, 1, 1,
0.1742608, -1.028686, 2.169494, 1, 1, 1, 1, 1,
0.1768658, -0.2903815, 2.698066, 1, 1, 1, 1, 1,
0.1784719, 0.6219137, -1.291983, 1, 1, 1, 1, 1,
0.1792613, -0.1182774, 1.773523, 1, 1, 1, 1, 1,
0.1805164, 1.997671, 0.4688498, 1, 1, 1, 1, 1,
0.1812489, 0.5704507, 0.05952427, 1, 1, 1, 1, 1,
0.1819381, -0.210982, 2.770626, 1, 1, 1, 1, 1,
0.182273, -1.180772, 3.425148, 1, 1, 1, 1, 1,
0.1880016, -0.2848432, 2.345556, 1, 1, 1, 1, 1,
0.196185, 0.4048698, -0.5742762, 1, 1, 1, 1, 1,
0.1977566, -0.06536043, 2.993099, 1, 1, 1, 1, 1,
0.1985182, 1.010168, 1.207182, 1, 1, 1, 1, 1,
0.1990757, 0.7544443, 3.122468, 0, 0, 1, 1, 1,
0.1991787, 0.5229123, 0.02020345, 1, 0, 0, 1, 1,
0.203173, -0.8906125, 1.121928, 1, 0, 0, 1, 1,
0.2047609, 1.396091, 0.772284, 1, 0, 0, 1, 1,
0.2099144, -0.1725981, 2.318897, 1, 0, 0, 1, 1,
0.210567, -0.458525, 0.5286239, 1, 0, 0, 1, 1,
0.2107886, 1.866855, 1.249045, 0, 0, 0, 1, 1,
0.2114357, -0.2066063, -0.100802, 0, 0, 0, 1, 1,
0.212644, 1.683015, 0.6518512, 0, 0, 0, 1, 1,
0.2146385, 0.8989475, 2.871192, 0, 0, 0, 1, 1,
0.2184571, 0.8757352, -0.6854972, 0, 0, 0, 1, 1,
0.219426, 1.551947, -0.1727299, 0, 0, 0, 1, 1,
0.2199614, 0.9825715, -0.3022575, 0, 0, 0, 1, 1,
0.2309636, -0.06133014, 1.884546, 1, 1, 1, 1, 1,
0.2310252, -1.275834, 2.396212, 1, 1, 1, 1, 1,
0.2341151, -2.283779, 2.730283, 1, 1, 1, 1, 1,
0.2359357, 0.11512, 1.690933, 1, 1, 1, 1, 1,
0.2376344, -0.7883245, 3.310002, 1, 1, 1, 1, 1,
0.2392918, 0.9202127, 0.9965514, 1, 1, 1, 1, 1,
0.2446565, -0.7656894, 3.056033, 1, 1, 1, 1, 1,
0.2502359, 1.535781, 1.400743, 1, 1, 1, 1, 1,
0.2539121, -0.3548226, 1.960937, 1, 1, 1, 1, 1,
0.2550012, 0.3771254, 0.4573068, 1, 1, 1, 1, 1,
0.2552231, -1.367079, 3.440647, 1, 1, 1, 1, 1,
0.2553081, -0.8559445, 1.531392, 1, 1, 1, 1, 1,
0.2560822, -0.9057031, 2.982793, 1, 1, 1, 1, 1,
0.2609025, -0.1333018, 1.0668, 1, 1, 1, 1, 1,
0.2612525, -1.695963, 2.683164, 1, 1, 1, 1, 1,
0.2617853, 0.05252893, 1.390347, 0, 0, 1, 1, 1,
0.2626417, 0.1947158, 2.68736, 1, 0, 0, 1, 1,
0.2750915, 0.8435016, -0.0131768, 1, 0, 0, 1, 1,
0.278479, 1.243104, -0.7113007, 1, 0, 0, 1, 1,
0.2797892, 0.09643245, 1.381472, 1, 0, 0, 1, 1,
0.2810194, 1.925551, 0.2618353, 1, 0, 0, 1, 1,
0.2826203, -1.204194, 3.505001, 0, 0, 0, 1, 1,
0.2854769, -0.4235357, 2.570354, 0, 0, 0, 1, 1,
0.2865245, 1.785051, 0.1160605, 0, 0, 0, 1, 1,
0.2891833, -0.7710642, 4.435856, 0, 0, 0, 1, 1,
0.2919418, 0.2473471, 1.729142, 0, 0, 0, 1, 1,
0.2933172, -1.057179, 5.055696, 0, 0, 0, 1, 1,
0.2997744, -0.4015093, 2.755379, 0, 0, 0, 1, 1,
0.3012719, 0.5332845, 0.6193779, 1, 1, 1, 1, 1,
0.3020686, 0.219681, 2.145274, 1, 1, 1, 1, 1,
0.3046957, -0.2397127, 2.447759, 1, 1, 1, 1, 1,
0.3119685, 0.6322486, 1.243202, 1, 1, 1, 1, 1,
0.3147211, -1.033496, 3.0907, 1, 1, 1, 1, 1,
0.3151518, -2.013937, 2.533004, 1, 1, 1, 1, 1,
0.3184284, -0.2742119, 2.458781, 1, 1, 1, 1, 1,
0.3239219, 0.5644419, 0.7023396, 1, 1, 1, 1, 1,
0.3247557, 0.2347266, -0.3900601, 1, 1, 1, 1, 1,
0.3249696, -0.8374531, 3.074932, 1, 1, 1, 1, 1,
0.3250674, -0.7489598, 1.639806, 1, 1, 1, 1, 1,
0.330388, 0.7380853, -0.4558563, 1, 1, 1, 1, 1,
0.331673, 0.283346, 1.166399, 1, 1, 1, 1, 1,
0.3369472, 1.064129, -0.707384, 1, 1, 1, 1, 1,
0.3408787, 0.1480773, 0.8739077, 1, 1, 1, 1, 1,
0.3420783, 0.4854508, 1.729403, 0, 0, 1, 1, 1,
0.3426981, 0.1242874, 0.681092, 1, 0, 0, 1, 1,
0.3443319, 1.237709, 0.5209451, 1, 0, 0, 1, 1,
0.3449361, 0.3423045, 2.402129, 1, 0, 0, 1, 1,
0.3464186, 1.2799, -1.182792, 1, 0, 0, 1, 1,
0.3488557, 0.425749, -0.1440224, 1, 0, 0, 1, 1,
0.3529941, -1.34425, 2.451858, 0, 0, 0, 1, 1,
0.3549458, 0.003185284, 1.052177, 0, 0, 0, 1, 1,
0.3560665, 0.8073897, -0.2503884, 0, 0, 0, 1, 1,
0.3585238, 1.376185, 0.2625445, 0, 0, 0, 1, 1,
0.3619584, 1.056833, 1.28139, 0, 0, 0, 1, 1,
0.3627203, -0.8999477, 2.778538, 0, 0, 0, 1, 1,
0.3637643, -1.171014, 2.19356, 0, 0, 0, 1, 1,
0.3644265, 0.03735509, 1.922012, 1, 1, 1, 1, 1,
0.3654226, 0.1542331, 1.929513, 1, 1, 1, 1, 1,
0.3678048, 0.1077682, 0.759396, 1, 1, 1, 1, 1,
0.3688902, -1.488972, 3.770022, 1, 1, 1, 1, 1,
0.3802864, 1.585817, -1.406559, 1, 1, 1, 1, 1,
0.3831365, 0.4220257, 0.9177153, 1, 1, 1, 1, 1,
0.3878176, 0.4468251, 0.5404803, 1, 1, 1, 1, 1,
0.3887936, 2.335841, 1.40176, 1, 1, 1, 1, 1,
0.3901872, -0.5202734, 3.189446, 1, 1, 1, 1, 1,
0.3914737, -0.9294237, 1.754934, 1, 1, 1, 1, 1,
0.3928019, -1.450753, 3.076368, 1, 1, 1, 1, 1,
0.3975013, -0.3468842, 1.826612, 1, 1, 1, 1, 1,
0.3988081, 0.3095741, -0.1907853, 1, 1, 1, 1, 1,
0.4016134, -1.315964, 3.933319, 1, 1, 1, 1, 1,
0.4054876, 1.592373, 0.1759353, 1, 1, 1, 1, 1,
0.4056315, 0.05862136, 3.748127, 0, 0, 1, 1, 1,
0.4063321, 1.334034, 1.589196, 1, 0, 0, 1, 1,
0.4067124, 0.4810429, 0.8063663, 1, 0, 0, 1, 1,
0.4152305, 0.2080325, 0.7980863, 1, 0, 0, 1, 1,
0.4175846, -0.9765359, 1.970002, 1, 0, 0, 1, 1,
0.4209306, -0.4956927, 2.092037, 1, 0, 0, 1, 1,
0.4237649, 1.008446, 1.222625, 0, 0, 0, 1, 1,
0.426929, 0.6206465, -0.06910616, 0, 0, 0, 1, 1,
0.4274776, -0.4752269, 1.506534, 0, 0, 0, 1, 1,
0.4278263, 1.231403, 0.3137183, 0, 0, 0, 1, 1,
0.4327778, -0.1811905, 2.212706, 0, 0, 0, 1, 1,
0.4370587, -1.823042, 1.592711, 0, 0, 0, 1, 1,
0.4373834, -0.04202535, 4.275822, 0, 0, 0, 1, 1,
0.4419833, 0.3125088, 1.514477, 1, 1, 1, 1, 1,
0.4528291, 0.6093388, 0.7034389, 1, 1, 1, 1, 1,
0.4540329, -0.6063794, 4.46415, 1, 1, 1, 1, 1,
0.4588045, -0.06602897, 0.1527267, 1, 1, 1, 1, 1,
0.4591757, -0.2635822, 2.005354, 1, 1, 1, 1, 1,
0.4597476, -0.7769989, 1.240103, 1, 1, 1, 1, 1,
0.4643636, -0.2371346, 2.369374, 1, 1, 1, 1, 1,
0.4652866, 0.9335601, 0.01573308, 1, 1, 1, 1, 1,
0.4686326, 0.3659065, 0.8585189, 1, 1, 1, 1, 1,
0.4746488, 0.06535351, 3.142088, 1, 1, 1, 1, 1,
0.4747418, -0.03721032, 1.77835, 1, 1, 1, 1, 1,
0.4761769, -0.5476721, 3.92274, 1, 1, 1, 1, 1,
0.4824103, -1.944665, 2.405348, 1, 1, 1, 1, 1,
0.4884833, 0.7458867, -0.5183965, 1, 1, 1, 1, 1,
0.4899653, 0.3346457, -0.3532557, 1, 1, 1, 1, 1,
0.5016925, 0.3191223, 1.887681, 0, 0, 1, 1, 1,
0.5025866, -0.3895516, 4.489481, 1, 0, 0, 1, 1,
0.5038668, -0.3164534, 1.389451, 1, 0, 0, 1, 1,
0.5094009, -0.3847695, 1.364377, 1, 0, 0, 1, 1,
0.5145774, 0.7152358, 0.680658, 1, 0, 0, 1, 1,
0.5153042, 0.1387976, -0.4692915, 1, 0, 0, 1, 1,
0.5160301, 0.7717029, 1.354931, 0, 0, 0, 1, 1,
0.5193917, 0.2544781, 1.138427, 0, 0, 0, 1, 1,
0.5214708, 1.139613, 0.2069188, 0, 0, 0, 1, 1,
0.5237069, -0.463949, 2.365535, 0, 0, 0, 1, 1,
0.528281, 0.6019896, 0.4898335, 0, 0, 0, 1, 1,
0.530091, 0.4963427, 1.998785, 0, 0, 0, 1, 1,
0.5406885, 1.011928, -0.2600957, 0, 0, 0, 1, 1,
0.5420437, 0.1388146, 2.827556, 1, 1, 1, 1, 1,
0.5631279, 0.3320305, 0.09601196, 1, 1, 1, 1, 1,
0.5868837, -0.7621881, 0.127418, 1, 1, 1, 1, 1,
0.5910543, 0.7452831, -1.04863, 1, 1, 1, 1, 1,
0.5938698, -0.7050258, 3.288638, 1, 1, 1, 1, 1,
0.5976346, 1.538348, -0.4538506, 1, 1, 1, 1, 1,
0.5983264, 0.5093999, -0.434698, 1, 1, 1, 1, 1,
0.6002067, 0.08596335, 0.2515946, 1, 1, 1, 1, 1,
0.6008517, -1.627003, 3.11131, 1, 1, 1, 1, 1,
0.6039174, 0.6311771, 0.6810005, 1, 1, 1, 1, 1,
0.6063121, -0.2426306, 2.000432, 1, 1, 1, 1, 1,
0.6081572, -0.4409611, 2.378834, 1, 1, 1, 1, 1,
0.6119438, -0.6803342, 1.418349, 1, 1, 1, 1, 1,
0.622369, -0.486499, 2.497607, 1, 1, 1, 1, 1,
0.6233104, -0.6109254, 1.510415, 1, 1, 1, 1, 1,
0.6239315, 0.09095018, 1.337879, 0, 0, 1, 1, 1,
0.6261167, 0.7584689, 2.038733, 1, 0, 0, 1, 1,
0.626145, -0.03968498, 0.8467185, 1, 0, 0, 1, 1,
0.6306667, 0.8132402, 1.026538, 1, 0, 0, 1, 1,
0.635946, 2.38445, 0.7630019, 1, 0, 0, 1, 1,
0.6360137, -0.004434101, 1.927422, 1, 0, 0, 1, 1,
0.6382743, 0.5654455, 1.18656, 0, 0, 0, 1, 1,
0.647854, -0.7664039, 2.558931, 0, 0, 0, 1, 1,
0.6563402, -0.9286205, 3.472723, 0, 0, 0, 1, 1,
0.6623414, 2.345029, 1.89228, 0, 0, 0, 1, 1,
0.6628613, 0.5415489, 1.040558, 0, 0, 0, 1, 1,
0.6679441, -0.7654453, 2.334837, 0, 0, 0, 1, 1,
0.6692055, -0.9739391, 3.111572, 0, 0, 0, 1, 1,
0.6698551, 0.7515726, 1.052604, 1, 1, 1, 1, 1,
0.672029, -1.295752, 2.913986, 1, 1, 1, 1, 1,
0.6722384, -0.4384171, 2.830212, 1, 1, 1, 1, 1,
0.6742551, 2.179131, 0.7446534, 1, 1, 1, 1, 1,
0.6799411, 0.8912416, -0.8282626, 1, 1, 1, 1, 1,
0.6812229, 1.46469, 2.469743, 1, 1, 1, 1, 1,
0.6861182, -1.277309, 2.041474, 1, 1, 1, 1, 1,
0.6889048, 0.4929323, 0.9961346, 1, 1, 1, 1, 1,
0.6930652, 0.324363, 0.6099267, 1, 1, 1, 1, 1,
0.6956616, -0.8148397, 3.300708, 1, 1, 1, 1, 1,
0.6968622, 1.105486, -0.8716092, 1, 1, 1, 1, 1,
0.6975957, 1.283657, 2.325818, 1, 1, 1, 1, 1,
0.7022967, 0.2063948, 2.90166, 1, 1, 1, 1, 1,
0.7025301, 0.6916019, 2.685277, 1, 1, 1, 1, 1,
0.7057939, -2.160215, 3.859327, 1, 1, 1, 1, 1,
0.7073751, 1.520503, -0.7180882, 0, 0, 1, 1, 1,
0.7164325, 0.488832, 2.144458, 1, 0, 0, 1, 1,
0.7194791, 0.9713023, 1.537349, 1, 0, 0, 1, 1,
0.7220877, 0.9017936, 1.894103, 1, 0, 0, 1, 1,
0.7224682, 1.625926, 0.5218351, 1, 0, 0, 1, 1,
0.7256265, -1.107005, 0.9118456, 1, 0, 0, 1, 1,
0.7274397, 1.326183, -0.4619001, 0, 0, 0, 1, 1,
0.7300072, -0.2047975, 1.670887, 0, 0, 0, 1, 1,
0.7365734, -0.5613375, 2.058831, 0, 0, 0, 1, 1,
0.7370359, -0.6852974, 1.748666, 0, 0, 0, 1, 1,
0.7413407, 0.4165641, 2.285747, 0, 0, 0, 1, 1,
0.7438235, -1.709823, 1.863215, 0, 0, 0, 1, 1,
0.7448598, 0.7918388, 1.115438, 0, 0, 0, 1, 1,
0.7455227, 0.08623087, 1.455704, 1, 1, 1, 1, 1,
0.755109, 2.027762, 0.599618, 1, 1, 1, 1, 1,
0.7570114, -0.8347468, 0.9114752, 1, 1, 1, 1, 1,
0.7572612, -0.7291566, 2.759321, 1, 1, 1, 1, 1,
0.7580104, 0.09985207, 0.861907, 1, 1, 1, 1, 1,
0.765615, 0.3516221, -0.8641793, 1, 1, 1, 1, 1,
0.7705896, 1.315076, 1.761359, 1, 1, 1, 1, 1,
0.7737197, 1.480029, 1.322963, 1, 1, 1, 1, 1,
0.7890118, -1.300995, 2.778758, 1, 1, 1, 1, 1,
0.7931443, -1.121972, 1.979798, 1, 1, 1, 1, 1,
0.7941723, 0.4463362, 0.6238229, 1, 1, 1, 1, 1,
0.7956892, -0.8875929, 3.013927, 1, 1, 1, 1, 1,
0.7974928, -0.05861495, 2.448594, 1, 1, 1, 1, 1,
0.7975199, -0.2834436, 3.991249, 1, 1, 1, 1, 1,
0.8035113, 0.7667915, -0.04519321, 1, 1, 1, 1, 1,
0.8045423, 0.2858723, 2.252579, 0, 0, 1, 1, 1,
0.8062292, 0.1897558, 1.69887, 1, 0, 0, 1, 1,
0.8063712, -0.361953, 1.378873, 1, 0, 0, 1, 1,
0.8066698, 0.2515324, -0.4373604, 1, 0, 0, 1, 1,
0.8094127, 0.2563332, 1.265495, 1, 0, 0, 1, 1,
0.8109018, -0.1830369, 1.897753, 1, 0, 0, 1, 1,
0.8110408, -0.8832195, 2.651733, 0, 0, 0, 1, 1,
0.8160816, -1.658424, 2.754674, 0, 0, 0, 1, 1,
0.8178046, 0.2204001, 1.618429, 0, 0, 0, 1, 1,
0.8189681, -0.2278202, 2.676054, 0, 0, 0, 1, 1,
0.8193755, -0.3290238, 3.980998, 0, 0, 0, 1, 1,
0.8202946, 0.7049177, 2.113003, 0, 0, 0, 1, 1,
0.8218854, -1.035636, 2.164265, 0, 0, 0, 1, 1,
0.8226393, -0.1137973, 1.821906, 1, 1, 1, 1, 1,
0.8263699, 1.181923, 1.579229, 1, 1, 1, 1, 1,
0.8280155, -0.7490504, 0.8552513, 1, 1, 1, 1, 1,
0.8285322, 0.8395565, 1.386185, 1, 1, 1, 1, 1,
0.8293757, 0.07685842, 1.487187, 1, 1, 1, 1, 1,
0.8303391, -0.6276357, 4.268148, 1, 1, 1, 1, 1,
0.8306523, 1.077678, 3.045446, 1, 1, 1, 1, 1,
0.8339666, 0.6509897, 0.07285868, 1, 1, 1, 1, 1,
0.8348994, -0.4188927, 1.022774, 1, 1, 1, 1, 1,
0.836251, -0.7621408, 3.061249, 1, 1, 1, 1, 1,
0.8462167, 0.7052538, 0.06246474, 1, 1, 1, 1, 1,
0.8477337, -0.1909478, 2.313852, 1, 1, 1, 1, 1,
0.8482274, 1.737358, 0.4239426, 1, 1, 1, 1, 1,
0.8486299, 1.647039, -0.318857, 1, 1, 1, 1, 1,
0.8494139, -0.5739305, 1.542499, 1, 1, 1, 1, 1,
0.8494576, -0.2540737, 3.129023, 0, 0, 1, 1, 1,
0.8505206, 1.19479, 0.8978366, 1, 0, 0, 1, 1,
0.8508893, -0.1194962, 1.305155, 1, 0, 0, 1, 1,
0.8510483, -0.004752524, 0.8829542, 1, 0, 0, 1, 1,
0.8514891, 0.2086303, 2.733712, 1, 0, 0, 1, 1,
0.8574851, 0.2632607, -0.2435986, 1, 0, 0, 1, 1,
0.8584446, 0.8458037, 1.163764, 0, 0, 0, 1, 1,
0.8629982, 1.093862, -0.2893357, 0, 0, 0, 1, 1,
0.87739, -0.2842457, 1.199307, 0, 0, 0, 1, 1,
0.8856834, 1.07202, 0.5338438, 0, 0, 0, 1, 1,
0.8880244, 1.009755, 0.707324, 0, 0, 0, 1, 1,
0.8927833, 1.746862, -0.7459181, 0, 0, 0, 1, 1,
0.9093317, -0.9855562, 3.809297, 0, 0, 0, 1, 1,
0.9114069, -0.8866788, 3.102606, 1, 1, 1, 1, 1,
0.9114993, -1.573431, 2.824898, 1, 1, 1, 1, 1,
0.9135177, -0.1818163, 3.992553, 1, 1, 1, 1, 1,
0.9178051, -1.505085, 1.625296, 1, 1, 1, 1, 1,
0.9182458, -0.4910495, 1.861851, 1, 1, 1, 1, 1,
0.9199575, 0.7646497, 1.579563, 1, 1, 1, 1, 1,
0.9205817, 0.5878465, 0.1211028, 1, 1, 1, 1, 1,
0.9247388, -0.8443772, 2.810455, 1, 1, 1, 1, 1,
0.9284221, 0.6367745, 2.487856, 1, 1, 1, 1, 1,
0.9284438, -1.267924, 3.035839, 1, 1, 1, 1, 1,
0.9299495, -0.1652462, 3.272018, 1, 1, 1, 1, 1,
0.934952, 0.2836111, 0.8104843, 1, 1, 1, 1, 1,
0.9408912, 0.2679752, 1.237684, 1, 1, 1, 1, 1,
0.9513835, 1.657032, -0.4171321, 1, 1, 1, 1, 1,
0.9521734, -2.182998, 0.8050789, 1, 1, 1, 1, 1,
0.9527181, 1.742369, -0.3635367, 0, 0, 1, 1, 1,
0.9587309, -0.505268, 0.8743005, 1, 0, 0, 1, 1,
0.9654063, 0.3118095, 1.715607, 1, 0, 0, 1, 1,
0.9713843, 2.064713, 0.6379672, 1, 0, 0, 1, 1,
0.9755257, 0.2129385, 0.5614195, 1, 0, 0, 1, 1,
0.9762611, 1.427424, -0.2592925, 1, 0, 0, 1, 1,
0.9786144, -0.3354828, 2.219121, 0, 0, 0, 1, 1,
0.9865642, -0.3005927, 1.978121, 0, 0, 0, 1, 1,
0.992272, -1.602815, 1.364885, 0, 0, 0, 1, 1,
0.9936337, -0.9426377, 1.133444, 0, 0, 0, 1, 1,
1.006387, 0.3720857, 3.436724, 0, 0, 0, 1, 1,
1.008517, 0.6425193, 0.1241929, 0, 0, 0, 1, 1,
1.008798, -0.3680737, 4.0035, 0, 0, 0, 1, 1,
1.015919, 1.131222, 1.491006, 1, 1, 1, 1, 1,
1.029743, 0.1369922, 2.8226, 1, 1, 1, 1, 1,
1.03188, -0.1944806, 3.379426, 1, 1, 1, 1, 1,
1.033523, 0.9880428, -1.046551, 1, 1, 1, 1, 1,
1.035746, 2.244208, 0.6071676, 1, 1, 1, 1, 1,
1.036206, 0.3435084, 1.137313, 1, 1, 1, 1, 1,
1.036428, 0.6789247, 1.221713, 1, 1, 1, 1, 1,
1.038861, 1.423651, 0.05480501, 1, 1, 1, 1, 1,
1.038944, 0.7849103, 0.09285372, 1, 1, 1, 1, 1,
1.03917, -0.8033687, 2.762383, 1, 1, 1, 1, 1,
1.054831, -0.9114859, 0.8760455, 1, 1, 1, 1, 1,
1.067103, 0.3289753, 0.9368563, 1, 1, 1, 1, 1,
1.0733, 1.100459, 0.07811863, 1, 1, 1, 1, 1,
1.074256, -0.08397987, 0.675503, 1, 1, 1, 1, 1,
1.078882, 0.6499171, 0.5878293, 1, 1, 1, 1, 1,
1.086602, 1.253956, 1.026844, 0, 0, 1, 1, 1,
1.089135, 1.295325, 1.361462, 1, 0, 0, 1, 1,
1.089325, 1.695445, -0.1238047, 1, 0, 0, 1, 1,
1.095887, -1.161255, 2.408845, 1, 0, 0, 1, 1,
1.104178, -0.6166378, 2.250593, 1, 0, 0, 1, 1,
1.114232, -0.2403816, 1.881403, 1, 0, 0, 1, 1,
1.114526, 0.8640414, 0.8964339, 0, 0, 0, 1, 1,
1.117178, 0.6100419, 1.602904, 0, 0, 0, 1, 1,
1.133193, 0.190448, 1.37385, 0, 0, 0, 1, 1,
1.14457, 1.716522, 1.15782, 0, 0, 0, 1, 1,
1.146137, -0.1102293, 1.068373, 0, 0, 0, 1, 1,
1.15493, -0.1745679, 1.196134, 0, 0, 0, 1, 1,
1.155584, 0.2319868, 0.4266833, 0, 0, 0, 1, 1,
1.157592, 0.04076991, 2.100076, 1, 1, 1, 1, 1,
1.160943, -1.548661, 4.128241, 1, 1, 1, 1, 1,
1.168781, -0.3309177, 2.122224, 1, 1, 1, 1, 1,
1.170727, -1.279537, 2.939893, 1, 1, 1, 1, 1,
1.176422, -2.252516, 1.744059, 1, 1, 1, 1, 1,
1.177315, -0.07459518, -0.8488592, 1, 1, 1, 1, 1,
1.180703, -0.1361537, 1.652304, 1, 1, 1, 1, 1,
1.182588, -1.570945, 4.045899, 1, 1, 1, 1, 1,
1.183441, -0.3094372, 2.371623, 1, 1, 1, 1, 1,
1.186759, 0.7826756, 1.400111, 1, 1, 1, 1, 1,
1.187779, 1.229615, 0.1155901, 1, 1, 1, 1, 1,
1.188706, 0.3033063, 1.771898, 1, 1, 1, 1, 1,
1.18978, -0.6429141, 1.415521, 1, 1, 1, 1, 1,
1.192269, -0.9987459, 2.498071, 1, 1, 1, 1, 1,
1.195611, -0.3373183, 1.506274, 1, 1, 1, 1, 1,
1.204067, -0.9705493, 2.051025, 0, 0, 1, 1, 1,
1.217184, -0.3516399, 0.7513605, 1, 0, 0, 1, 1,
1.21882, -0.6869427, -0.1057262, 1, 0, 0, 1, 1,
1.23044, 0.1279672, 2.210776, 1, 0, 0, 1, 1,
1.232702, 1.288294, 1.201113, 1, 0, 0, 1, 1,
1.239591, 0.7127627, 1.017866, 1, 0, 0, 1, 1,
1.241897, 1.415473, -0.03764878, 0, 0, 0, 1, 1,
1.245722, 0.3742146, 1.730244, 0, 0, 0, 1, 1,
1.246456, -1.244558, 3.655787, 0, 0, 0, 1, 1,
1.250344, -0.1822926, 0.8937162, 0, 0, 0, 1, 1,
1.257116, 0.4686179, 2.160672, 0, 0, 0, 1, 1,
1.257758, 0.1239522, 2.752136, 0, 0, 0, 1, 1,
1.262587, 0.2172411, 1.661176, 0, 0, 0, 1, 1,
1.264996, 0.1779649, 0.9641458, 1, 1, 1, 1, 1,
1.294701, 1.213531, 2.318894, 1, 1, 1, 1, 1,
1.308807, 0.05951413, 0.6500385, 1, 1, 1, 1, 1,
1.32169, -0.1374249, 2.534391, 1, 1, 1, 1, 1,
1.323062, 0.05217009, 1.12866, 1, 1, 1, 1, 1,
1.326579, 1.093225, 1.428182, 1, 1, 1, 1, 1,
1.343149, -0.3100104, 2.339821, 1, 1, 1, 1, 1,
1.352438, 1.797186, 0.9368792, 1, 1, 1, 1, 1,
1.37468, 0.2365677, 0.915269, 1, 1, 1, 1, 1,
1.376118, -0.9672382, 3.130368, 1, 1, 1, 1, 1,
1.387246, -0.03169815, 1.461586, 1, 1, 1, 1, 1,
1.392016, -0.5350332, 0.6343992, 1, 1, 1, 1, 1,
1.392847, -0.005029805, 1.653341, 1, 1, 1, 1, 1,
1.393727, -1.033487, 2.980185, 1, 1, 1, 1, 1,
1.394608, -1.177548, 1.505953, 1, 1, 1, 1, 1,
1.394613, -0.2512546, 3.021806, 0, 0, 1, 1, 1,
1.399228, 0.8786263, 1.148096, 1, 0, 0, 1, 1,
1.399557, 0.05319748, -0.3744846, 1, 0, 0, 1, 1,
1.400109, -1.29502, 3.731938, 1, 0, 0, 1, 1,
1.401158, -0.4065341, 0.2474235, 1, 0, 0, 1, 1,
1.421516, -0.7359782, 1.985823, 1, 0, 0, 1, 1,
1.426861, 0.5849664, 2.283677, 0, 0, 0, 1, 1,
1.430434, 0.4798616, 1.233734, 0, 0, 0, 1, 1,
1.443473, 0.6131896, 2.128803, 0, 0, 0, 1, 1,
1.443685, 1.767386, 2.267558, 0, 0, 0, 1, 1,
1.452657, -1.697478, 4.008176, 0, 0, 0, 1, 1,
1.456541, 0.5363599, 2.038196, 0, 0, 0, 1, 1,
1.475463, -0.6174132, 2.194897, 0, 0, 0, 1, 1,
1.48987, 0.3527666, 0.8008879, 1, 1, 1, 1, 1,
1.504715, 1.307875, 1.999528, 1, 1, 1, 1, 1,
1.521403, -0.8923546, 3.455828, 1, 1, 1, 1, 1,
1.533431, -0.2744783, 1.467306, 1, 1, 1, 1, 1,
1.548761, -1.521626, 1.09934, 1, 1, 1, 1, 1,
1.549247, -0.007713334, 2.24626, 1, 1, 1, 1, 1,
1.556604, -1.50907, 3.270672, 1, 1, 1, 1, 1,
1.556984, -0.248169, 0.7058814, 1, 1, 1, 1, 1,
1.562561, 0.1050647, 0.6573843, 1, 1, 1, 1, 1,
1.563571, 0.9372279, 0.3864451, 1, 1, 1, 1, 1,
1.568025, -0.144223, 4.125985, 1, 1, 1, 1, 1,
1.577316, -0.829987, 0.9931107, 1, 1, 1, 1, 1,
1.582786, -1.432028, 2.049273, 1, 1, 1, 1, 1,
1.584509, 0.4604963, 1.873134, 1, 1, 1, 1, 1,
1.597302, 0.1412866, 0.6094353, 1, 1, 1, 1, 1,
1.608096, -2.289806, 3.403659, 0, 0, 1, 1, 1,
1.614351, -0.6837869, 3.494131, 1, 0, 0, 1, 1,
1.614391, 1.417505, 0.27537, 1, 0, 0, 1, 1,
1.619252, 0.4616597, 1.667578, 1, 0, 0, 1, 1,
1.622932, -0.3054866, 0.658702, 1, 0, 0, 1, 1,
1.653138, 0.09633454, 2.604551, 1, 0, 0, 1, 1,
1.66767, -1.316897, 1.609302, 0, 0, 0, 1, 1,
1.692158, 0.7850873, 1.592546, 0, 0, 0, 1, 1,
1.720257, -0.3317015, 2.11731, 0, 0, 0, 1, 1,
1.737098, 0.5336775, 0.5754911, 0, 0, 0, 1, 1,
1.759174, 0.4353237, 2.023455, 0, 0, 0, 1, 1,
1.776632, 0.06318534, 1.619435, 0, 0, 0, 1, 1,
1.790999, 1.346298, 2.516824, 0, 0, 0, 1, 1,
1.800969, -0.6347471, 1.969208, 1, 1, 1, 1, 1,
1.81819, 0.4146693, 1.760709, 1, 1, 1, 1, 1,
1.861057, 0.8940111, 0.4894911, 1, 1, 1, 1, 1,
1.868353, 0.08784386, 0.8525297, 1, 1, 1, 1, 1,
1.873807, -0.4637415, 1.405895, 1, 1, 1, 1, 1,
1.889569, -0.6494828, 1.039802, 1, 1, 1, 1, 1,
1.898096, -0.2723284, 3.353787, 1, 1, 1, 1, 1,
1.908258, 0.04770504, 0.5722811, 1, 1, 1, 1, 1,
1.937662, 0.7011836, 1.057986, 1, 1, 1, 1, 1,
1.950535, -0.3577885, 2.002824, 1, 1, 1, 1, 1,
1.957668, 1.066218, 0.9151108, 1, 1, 1, 1, 1,
1.981436, 1.421345, 1.250943, 1, 1, 1, 1, 1,
1.982552, -0.2702941, 0.3340149, 1, 1, 1, 1, 1,
2.000397, 0.825372, 2.749084, 1, 1, 1, 1, 1,
2.001372, -0.03805799, 2.711157, 1, 1, 1, 1, 1,
2.038178, -0.09617726, 2.084777, 0, 0, 1, 1, 1,
2.075361, -0.515947, 1.919116, 1, 0, 0, 1, 1,
2.095155, -0.7069675, 0.5855652, 1, 0, 0, 1, 1,
2.131169, -0.8484414, 2.001021, 1, 0, 0, 1, 1,
2.1532, -0.1116019, 1.315798, 1, 0, 0, 1, 1,
2.239969, 0.001316913, 1.954777, 1, 0, 0, 1, 1,
2.287833, 0.05355645, 0.4346508, 0, 0, 0, 1, 1,
2.304041, 0.04033136, 2.614505, 0, 0, 0, 1, 1,
2.395947, -0.439661, 2.089216, 0, 0, 0, 1, 1,
2.477854, 0.4247193, 2.988347, 0, 0, 0, 1, 1,
2.513867, -1.140039, 3.418325, 0, 0, 0, 1, 1,
2.581122, 0.1026386, 3.112385, 0, 0, 0, 1, 1,
2.631282, -0.6447942, 2.181983, 0, 0, 0, 1, 1,
2.65545, -1.044575, 0.5606758, 1, 1, 1, 1, 1,
2.727887, -0.9802952, 1.276635, 1, 1, 1, 1, 1,
2.787141, 0.06593665, 1.904526, 1, 1, 1, 1, 1,
2.825164, -1.180489, 2.363091, 1, 1, 1, 1, 1,
2.825449, -0.4579785, 2.878509, 1, 1, 1, 1, 1,
2.85043, -1.109675, 2.133762, 1, 1, 1, 1, 1,
3.654177, -0.4794593, 1.637333, 1, 1, 1, 1, 1
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
var radius = 9.613551;
var distance = 33.76719;
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
mvMatrix.translate( -0.285099, -0.5090622, -0.2149632 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76719);
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
