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
-2.83892, -0.8259296, -1.204921, 1, 0, 0, 1,
-2.698586, -1.571887, -2.393041, 1, 0.007843138, 0, 1,
-2.632559, -0.5673813, -1.682072, 1, 0.01176471, 0, 1,
-2.487065, 0.7650932, -0.2988061, 1, 0.01960784, 0, 1,
-2.461828, 0.8163617, 0.6153641, 1, 0.02352941, 0, 1,
-2.452847, -1.29135, -2.16629, 1, 0.03137255, 0, 1,
-2.427775, 0.8413312, -1.133759, 1, 0.03529412, 0, 1,
-2.423702, -1.484407, -2.507674, 1, 0.04313726, 0, 1,
-2.390777, -0.3442435, -0.2366949, 1, 0.04705882, 0, 1,
-2.266746, -0.1517321, -3.172839, 1, 0.05490196, 0, 1,
-2.251025, 0.01011319, -3.169967, 1, 0.05882353, 0, 1,
-2.246375, 1.26065, 0.4952039, 1, 0.06666667, 0, 1,
-2.214862, 0.4721033, -1.579979, 1, 0.07058824, 0, 1,
-2.202676, -0.003293009, -1.786272, 1, 0.07843138, 0, 1,
-2.171138, -0.04285415, -1.750238, 1, 0.08235294, 0, 1,
-2.170955, -1.355002, -1.364431, 1, 0.09019608, 0, 1,
-2.15918, -1.514968, -1.485022, 1, 0.09411765, 0, 1,
-2.156042, 0.4546941, -1.568024, 1, 0.1019608, 0, 1,
-2.154313, 0.1141512, -1.006311, 1, 0.1098039, 0, 1,
-2.153119, 0.1707839, -0.8758537, 1, 0.1137255, 0, 1,
-2.107918, -0.5444519, -1.018857, 1, 0.1215686, 0, 1,
-2.059223, 1.779508, -0.3346092, 1, 0.1254902, 0, 1,
-2.039172, 0.7057831, -1.540596, 1, 0.1333333, 0, 1,
-2.013097, 0.6110904, -2.486679, 1, 0.1372549, 0, 1,
-1.981024, 0.1203616, -2.436706, 1, 0.145098, 0, 1,
-1.973661, 1.530607, -1.082728, 1, 0.1490196, 0, 1,
-1.967094, 0.6023929, -1.233803, 1, 0.1568628, 0, 1,
-1.966038, 1.472707, -2.290606, 1, 0.1607843, 0, 1,
-1.929671, 0.7412997, -2.141296, 1, 0.1686275, 0, 1,
-1.916349, 0.7481205, -2.315924, 1, 0.172549, 0, 1,
-1.91415, 0.3805228, -0.1333787, 1, 0.1803922, 0, 1,
-1.88933, -1.597298, -4.332398, 1, 0.1843137, 0, 1,
-1.864656, 0.5417426, -0.1204627, 1, 0.1921569, 0, 1,
-1.852092, -0.7758439, -3.433722, 1, 0.1960784, 0, 1,
-1.812807, -0.4911099, -3.697698, 1, 0.2039216, 0, 1,
-1.811195, -1.384352, -3.001539, 1, 0.2117647, 0, 1,
-1.799357, 0.67088, -1.713611, 1, 0.2156863, 0, 1,
-1.789386, -1.890329, -1.76918, 1, 0.2235294, 0, 1,
-1.769254, -0.4657995, -1.68569, 1, 0.227451, 0, 1,
-1.761855, 1.074965, -1.197594, 1, 0.2352941, 0, 1,
-1.734762, -1.325104, -3.207014, 1, 0.2392157, 0, 1,
-1.731787, 1.192829, -1.673995, 1, 0.2470588, 0, 1,
-1.731211, -0.7500696, -2.776238, 1, 0.2509804, 0, 1,
-1.720435, -0.4116059, -2.233304, 1, 0.2588235, 0, 1,
-1.714005, 0.2470682, -0.7033996, 1, 0.2627451, 0, 1,
-1.696319, 1.063591, -0.2009572, 1, 0.2705882, 0, 1,
-1.694476, -0.649873, -2.452589, 1, 0.2745098, 0, 1,
-1.694127, 0.3916045, -2.25273, 1, 0.282353, 0, 1,
-1.690771, -0.623043, -3.42283, 1, 0.2862745, 0, 1,
-1.688662, 1.017748, -0.5310197, 1, 0.2941177, 0, 1,
-1.685699, -0.247772, -1.152662, 1, 0.3019608, 0, 1,
-1.682573, 0.557329, -1.405728, 1, 0.3058824, 0, 1,
-1.677914, 0.7982458, -0.9183195, 1, 0.3137255, 0, 1,
-1.64585, -1.392819, -1.026878, 1, 0.3176471, 0, 1,
-1.635088, -0.8148048, -1.091465, 1, 0.3254902, 0, 1,
-1.62141, -0.9533933, -2.603321, 1, 0.3294118, 0, 1,
-1.597976, 0.2989204, -3.254724, 1, 0.3372549, 0, 1,
-1.581957, 1.015396, -0.03535723, 1, 0.3411765, 0, 1,
-1.579467, -0.5726717, -1.771038, 1, 0.3490196, 0, 1,
-1.568058, 1.040073, -1.73387, 1, 0.3529412, 0, 1,
-1.560522, -2.224372, -1.6655, 1, 0.3607843, 0, 1,
-1.537759, -1.149354, -3.495105, 1, 0.3647059, 0, 1,
-1.535333, 0.7553792, -0.247396, 1, 0.372549, 0, 1,
-1.53526, 1.647584, -0.4165745, 1, 0.3764706, 0, 1,
-1.527983, 1.105097, -0.9674498, 1, 0.3843137, 0, 1,
-1.52081, -0.6638812, -1.738411, 1, 0.3882353, 0, 1,
-1.520285, -0.05454779, -1.156575, 1, 0.3960784, 0, 1,
-1.51631, -1.34055, -3.131176, 1, 0.4039216, 0, 1,
-1.516203, -0.04990323, -1.701487, 1, 0.4078431, 0, 1,
-1.50674, -0.2716396, -1.643057, 1, 0.4156863, 0, 1,
-1.484648, 1.574343, -1.844276, 1, 0.4196078, 0, 1,
-1.476488, 0.4623576, -1.746079, 1, 0.427451, 0, 1,
-1.475052, -0.1472088, -1.633843, 1, 0.4313726, 0, 1,
-1.463411, 0.1419186, -1.609813, 1, 0.4392157, 0, 1,
-1.456898, -0.3045672, -2.648332, 1, 0.4431373, 0, 1,
-1.45655, -1.451742, -2.679916, 1, 0.4509804, 0, 1,
-1.44213, 0.545512, -0.39719, 1, 0.454902, 0, 1,
-1.437593, 1.498747, -0.2843249, 1, 0.4627451, 0, 1,
-1.430251, -0.2044988, -3.101399, 1, 0.4666667, 0, 1,
-1.416923, 0.04987115, -1.525431, 1, 0.4745098, 0, 1,
-1.416792, -1.020738, -3.108485, 1, 0.4784314, 0, 1,
-1.414174, -1.343891, -2.34572, 1, 0.4862745, 0, 1,
-1.405596, -1.984717, -2.435552, 1, 0.4901961, 0, 1,
-1.400282, 1.068558, -2.134023, 1, 0.4980392, 0, 1,
-1.394857, 0.6027673, -2.198427, 1, 0.5058824, 0, 1,
-1.392888, 0.6617102, -1.192107, 1, 0.509804, 0, 1,
-1.392599, 0.05922723, -2.654251, 1, 0.5176471, 0, 1,
-1.385647, -0.2065797, -2.606745, 1, 0.5215687, 0, 1,
-1.381112, 0.5728616, -1.756468, 1, 0.5294118, 0, 1,
-1.378602, -0.4402157, -1.781166, 1, 0.5333334, 0, 1,
-1.377174, 0.9730839, -1.259327, 1, 0.5411765, 0, 1,
-1.374796, -2.056621, -2.531708, 1, 0.5450981, 0, 1,
-1.374118, -1.541775, -0.6763847, 1, 0.5529412, 0, 1,
-1.373538, -0.1697465, -1.168891, 1, 0.5568628, 0, 1,
-1.365201, 0.1950624, 0.1780328, 1, 0.5647059, 0, 1,
-1.36457, 0.2171754, -0.6011867, 1, 0.5686275, 0, 1,
-1.364337, -0.5308363, -2.874512, 1, 0.5764706, 0, 1,
-1.360849, -0.3073169, 0.6975406, 1, 0.5803922, 0, 1,
-1.359398, 0.750106, 1.007309, 1, 0.5882353, 0, 1,
-1.352648, -1.08293, -0.6874352, 1, 0.5921569, 0, 1,
-1.349522, -1.232252, -1.442089, 1, 0.6, 0, 1,
-1.348541, -1.221402, -2.030498, 1, 0.6078432, 0, 1,
-1.337135, 2.518113, -0.4198102, 1, 0.6117647, 0, 1,
-1.32481, -1.75577, -1.152324, 1, 0.6196079, 0, 1,
-1.323033, 0.02495053, -2.629641, 1, 0.6235294, 0, 1,
-1.318616, -1.889151, -3.682507, 1, 0.6313726, 0, 1,
-1.309662, -0.6805046, -3.806317, 1, 0.6352941, 0, 1,
-1.305782, 0.8165781, 0.1474755, 1, 0.6431373, 0, 1,
-1.293658, -1.783774, -4.43921, 1, 0.6470588, 0, 1,
-1.290418, 1.578424, -0.4912818, 1, 0.654902, 0, 1,
-1.285991, -0.6899903, -2.31022, 1, 0.6588235, 0, 1,
-1.278865, 0.06762983, -0.2425562, 1, 0.6666667, 0, 1,
-1.275282, 0.3364117, -0.7862751, 1, 0.6705883, 0, 1,
-1.273265, -0.02072073, -0.8892081, 1, 0.6784314, 0, 1,
-1.264555, -0.5691203, -2.096724, 1, 0.682353, 0, 1,
-1.260274, 2.470039, -0.9850075, 1, 0.6901961, 0, 1,
-1.254556, 1.464714, 0.3262773, 1, 0.6941177, 0, 1,
-1.252068, 0.7431688, -0.9690728, 1, 0.7019608, 0, 1,
-1.248685, 0.0477858, -0.1805084, 1, 0.7098039, 0, 1,
-1.237653, 0.9738473, -0.5916905, 1, 0.7137255, 0, 1,
-1.235822, -0.07544494, -2.436241, 1, 0.7215686, 0, 1,
-1.229614, -1.697954, -1.755691, 1, 0.7254902, 0, 1,
-1.20456, -0.6401019, -2.017751, 1, 0.7333333, 0, 1,
-1.189085, -0.8475376, -2.277042, 1, 0.7372549, 0, 1,
-1.183392, -0.3675671, -2.91975, 1, 0.7450981, 0, 1,
-1.177704, 0.6396528, -0.4545548, 1, 0.7490196, 0, 1,
-1.175862, -0.6723963, -2.210538, 1, 0.7568628, 0, 1,
-1.169129, 0.3872294, -1.241716, 1, 0.7607843, 0, 1,
-1.16308, 0.06329407, -2.161734, 1, 0.7686275, 0, 1,
-1.162077, -0.6839565, -1.373046, 1, 0.772549, 0, 1,
-1.160075, -1.776364, -2.444109, 1, 0.7803922, 0, 1,
-1.158555, -0.1230881, -0.7562472, 1, 0.7843137, 0, 1,
-1.158232, 0.7298412, -0.2793585, 1, 0.7921569, 0, 1,
-1.15644, 0.9271289, -1.101006, 1, 0.7960784, 0, 1,
-1.153561, 0.1377682, -2.654815, 1, 0.8039216, 0, 1,
-1.151465, 0.3458985, 0.6541733, 1, 0.8117647, 0, 1,
-1.150941, 0.3471225, -1.860998, 1, 0.8156863, 0, 1,
-1.149058, -0.1471853, -1.665426, 1, 0.8235294, 0, 1,
-1.147428, -1.168462, -1.733752, 1, 0.827451, 0, 1,
-1.130535, -1.095727, -2.569003, 1, 0.8352941, 0, 1,
-1.130415, 0.4715236, -0.2634703, 1, 0.8392157, 0, 1,
-1.129125, -0.4972903, -2.15507, 1, 0.8470588, 0, 1,
-1.126396, 0.8035141, -1.385695, 1, 0.8509804, 0, 1,
-1.117495, -0.9549479, -3.798389, 1, 0.8588235, 0, 1,
-1.108295, 0.09573051, -1.083952, 1, 0.8627451, 0, 1,
-1.105807, 0.2764171, -1.396329, 1, 0.8705882, 0, 1,
-1.094169, -0.6216499, -1.737266, 1, 0.8745098, 0, 1,
-1.094061, -0.6207074, -2.458259, 1, 0.8823529, 0, 1,
-1.081329, 0.2939056, -0.4575033, 1, 0.8862745, 0, 1,
-1.081285, 1.21099, -3.142756, 1, 0.8941177, 0, 1,
-1.080015, 0.8482741, -0.3626256, 1, 0.8980392, 0, 1,
-1.07954, 1.537937, -1.803548, 1, 0.9058824, 0, 1,
-1.076789, 0.325367, -2.42787, 1, 0.9137255, 0, 1,
-1.072132, -1.157334, -2.034809, 1, 0.9176471, 0, 1,
-1.061848, -0.3929816, -0.970849, 1, 0.9254902, 0, 1,
-1.060306, 2.146074, -0.4668134, 1, 0.9294118, 0, 1,
-1.056433, -0.008762047, -0.5218842, 1, 0.9372549, 0, 1,
-1.052527, -2.293856, -2.455262, 1, 0.9411765, 0, 1,
-1.051203, -0.7111155, -1.495001, 1, 0.9490196, 0, 1,
-1.049157, -0.1267109, -0.5746242, 1, 0.9529412, 0, 1,
-1.048976, 1.652765, 0.6323977, 1, 0.9607843, 0, 1,
-1.045941, -0.4957714, -3.129056, 1, 0.9647059, 0, 1,
-1.045587, -0.4435975, -2.078494, 1, 0.972549, 0, 1,
-1.039258, -0.6092068, -3.226361, 1, 0.9764706, 0, 1,
-1.030361, 3.016436, -1.021363, 1, 0.9843137, 0, 1,
-1.017777, 2.101586, -0.1769595, 1, 0.9882353, 0, 1,
-1.017671, 0.2081154, 0.0701207, 1, 0.9960784, 0, 1,
-1.016534, -0.1308754, -0.8512428, 0.9960784, 1, 0, 1,
-1.011917, 0.8099777, -1.67634, 0.9921569, 1, 0, 1,
-1.009088, -0.4919522, -0.973433, 0.9843137, 1, 0, 1,
-1.007378, -0.2871949, -3.022732, 0.9803922, 1, 0, 1,
-1.006924, 0.03831015, -2.016183, 0.972549, 1, 0, 1,
-1.004701, -2.285724, -3.015446, 0.9686275, 1, 0, 1,
-1.002292, 0.2282031, -0.976436, 0.9607843, 1, 0, 1,
-1.000414, 1.052082, -1.296348, 0.9568627, 1, 0, 1,
-0.9984528, -0.2432696, -3.480358, 0.9490196, 1, 0, 1,
-0.9974727, -1.201628, -3.190646, 0.945098, 1, 0, 1,
-0.9869417, 1.433071, -0.1587707, 0.9372549, 1, 0, 1,
-0.9863778, 2.442588, 1.833983, 0.9333333, 1, 0, 1,
-0.9837527, -1.290189, -3.956135, 0.9254902, 1, 0, 1,
-0.9797467, -0.9530134, -0.939119, 0.9215686, 1, 0, 1,
-0.9673039, 1.798233, -0.5862178, 0.9137255, 1, 0, 1,
-0.9620972, -0.6305162, -3.59774, 0.9098039, 1, 0, 1,
-0.9618745, -0.6726474, -3.972125, 0.9019608, 1, 0, 1,
-0.961423, -1.620496, -3.506327, 0.8941177, 1, 0, 1,
-0.9607697, 0.6234598, -2.250277, 0.8901961, 1, 0, 1,
-0.9558029, -0.9061712, -2.470233, 0.8823529, 1, 0, 1,
-0.9528233, -1.460624, -2.675696, 0.8784314, 1, 0, 1,
-0.9506778, 1.072582, -0.02367228, 0.8705882, 1, 0, 1,
-0.948391, 1.220971, -0.3973418, 0.8666667, 1, 0, 1,
-0.9370149, -1.143007, -3.28013, 0.8588235, 1, 0, 1,
-0.9231284, 0.372715, -1.665345, 0.854902, 1, 0, 1,
-0.9214839, -0.8581825, -0.7154084, 0.8470588, 1, 0, 1,
-0.9167654, -1.114633, -0.5483487, 0.8431373, 1, 0, 1,
-0.9150407, 2.944146, -0.7073663, 0.8352941, 1, 0, 1,
-0.9133445, 0.8908623, -2.152126, 0.8313726, 1, 0, 1,
-0.9128799, -1.54679, -3.228557, 0.8235294, 1, 0, 1,
-0.910342, -0.9188985, -2.549288, 0.8196079, 1, 0, 1,
-0.9016033, 0.4657525, -2.163426, 0.8117647, 1, 0, 1,
-0.9003747, -0.2029433, -3.59698, 0.8078431, 1, 0, 1,
-0.8984852, 0.3256033, -0.8070089, 0.8, 1, 0, 1,
-0.8972467, 1.772013, -0.521744, 0.7921569, 1, 0, 1,
-0.8938336, -1.431616, -2.948632, 0.7882353, 1, 0, 1,
-0.8935924, -0.4253452, -2.061598, 0.7803922, 1, 0, 1,
-0.8905894, -1.423258, -2.179828, 0.7764706, 1, 0, 1,
-0.8897356, -1.203535, -2.851734, 0.7686275, 1, 0, 1,
-0.8885816, 2.122778, -0.4140066, 0.7647059, 1, 0, 1,
-0.8770518, -1.787092, -3.082989, 0.7568628, 1, 0, 1,
-0.8764097, -0.1404173, -2.632064, 0.7529412, 1, 0, 1,
-0.8722334, -1.036192, -2.866126, 0.7450981, 1, 0, 1,
-0.8692723, -0.2959486, -1.391863, 0.7411765, 1, 0, 1,
-0.8684689, 0.1063431, -1.2153, 0.7333333, 1, 0, 1,
-0.8492216, 0.4009442, -0.4864631, 0.7294118, 1, 0, 1,
-0.8478636, 1.006185, -1.730754, 0.7215686, 1, 0, 1,
-0.844304, -0.3366894, -5.475331, 0.7176471, 1, 0, 1,
-0.8415472, -0.3471767, -1.46249, 0.7098039, 1, 0, 1,
-0.8275014, -1.052017, -0.8570473, 0.7058824, 1, 0, 1,
-0.8199032, -1.039252, -1.533703, 0.6980392, 1, 0, 1,
-0.818647, 0.9678409, -0.5209049, 0.6901961, 1, 0, 1,
-0.8165456, -0.340774, -2.479226, 0.6862745, 1, 0, 1,
-0.8131481, 2.007297, 0.1614832, 0.6784314, 1, 0, 1,
-0.8120509, -0.06723193, -1.558489, 0.6745098, 1, 0, 1,
-0.8111862, -0.1811518, -1.04204, 0.6666667, 1, 0, 1,
-0.8072745, -1.310365, -0.9278997, 0.6627451, 1, 0, 1,
-0.8068315, -1.208182, -2.109087, 0.654902, 1, 0, 1,
-0.8021484, 0.8457323, -0.6345363, 0.6509804, 1, 0, 1,
-0.8021337, -0.4086859, -2.537085, 0.6431373, 1, 0, 1,
-0.7992135, 2.368793, 0.6430924, 0.6392157, 1, 0, 1,
-0.7991912, 0.9959641, -0.6370937, 0.6313726, 1, 0, 1,
-0.7906937, -0.7276886, -3.632849, 0.627451, 1, 0, 1,
-0.7892098, -0.484685, -1.697779, 0.6196079, 1, 0, 1,
-0.7858552, -1.605468, -0.2182361, 0.6156863, 1, 0, 1,
-0.782683, 0.3017667, 0.03373339, 0.6078432, 1, 0, 1,
-0.7755476, 0.01110039, -1.709114, 0.6039216, 1, 0, 1,
-0.7749743, 0.3731974, -0.2102655, 0.5960785, 1, 0, 1,
-0.7738218, -1.990092, -2.16224, 0.5882353, 1, 0, 1,
-0.761224, 1.127142, -0.2207299, 0.5843138, 1, 0, 1,
-0.7562401, -1.699215, -2.617857, 0.5764706, 1, 0, 1,
-0.7562153, -1.951237, -2.034222, 0.572549, 1, 0, 1,
-0.7532765, -0.3498749, -2.525433, 0.5647059, 1, 0, 1,
-0.749835, -0.2756722, -2.660577, 0.5607843, 1, 0, 1,
-0.7430567, -1.013656, -1.712536, 0.5529412, 1, 0, 1,
-0.7428282, 1.357225, -0.3359157, 0.5490196, 1, 0, 1,
-0.7381458, 1.53987, -1.096954, 0.5411765, 1, 0, 1,
-0.7336003, -1.421302, -4.294794, 0.5372549, 1, 0, 1,
-0.7310402, 0.07511751, -0.1174486, 0.5294118, 1, 0, 1,
-0.729439, -0.8398247, -3.418667, 0.5254902, 1, 0, 1,
-0.7202045, -1.417177, -4.660493, 0.5176471, 1, 0, 1,
-0.7125247, -0.7916464, -3.026632, 0.5137255, 1, 0, 1,
-0.7095399, -0.1918216, -2.428559, 0.5058824, 1, 0, 1,
-0.7085569, 0.484793, -0.03294394, 0.5019608, 1, 0, 1,
-0.7069587, -0.4118374, -3.094613, 0.4941176, 1, 0, 1,
-0.7056759, -0.1814876, -4.315337, 0.4862745, 1, 0, 1,
-0.7021255, -0.6242748, -2.794353, 0.4823529, 1, 0, 1,
-0.6951719, 1.569774, -0.4692432, 0.4745098, 1, 0, 1,
-0.6800684, -1.779048, -1.807352, 0.4705882, 1, 0, 1,
-0.6793139, -1.578785, -2.775153, 0.4627451, 1, 0, 1,
-0.67586, -1.753419, -3.030647, 0.4588235, 1, 0, 1,
-0.6755299, -1.087066, -2.058477, 0.4509804, 1, 0, 1,
-0.6741251, -0.6941782, -3.58931, 0.4470588, 1, 0, 1,
-0.6714574, -0.1054402, -1.147845, 0.4392157, 1, 0, 1,
-0.6662791, 0.7228473, -0.7164694, 0.4352941, 1, 0, 1,
-0.6658077, 0.1758281, -2.849099, 0.427451, 1, 0, 1,
-0.665236, -0.08140805, -1.072441, 0.4235294, 1, 0, 1,
-0.664609, 0.06450514, -0.2903205, 0.4156863, 1, 0, 1,
-0.6634876, -0.2935862, -0.7231358, 0.4117647, 1, 0, 1,
-0.6629397, -1.75073, -2.59672, 0.4039216, 1, 0, 1,
-0.6617748, 0.7390823, -0.2376153, 0.3960784, 1, 0, 1,
-0.6612907, 0.9217206, -1.89383, 0.3921569, 1, 0, 1,
-0.6601645, 1.201047, -0.4060894, 0.3843137, 1, 0, 1,
-0.6500364, -0.6337989, -2.555201, 0.3803922, 1, 0, 1,
-0.635514, -0.3201556, -0.8972197, 0.372549, 1, 0, 1,
-0.6353587, -0.1716294, -1.639425, 0.3686275, 1, 0, 1,
-0.6335885, 0.4534998, -1.037706, 0.3607843, 1, 0, 1,
-0.6309224, -0.5901728, -2.285031, 0.3568628, 1, 0, 1,
-0.6308482, -2.161951, -1.763698, 0.3490196, 1, 0, 1,
-0.6271194, 0.5550866, 0.471008, 0.345098, 1, 0, 1,
-0.6251941, -0.2644277, -2.029615, 0.3372549, 1, 0, 1,
-0.6220419, -0.4225556, -2.952239, 0.3333333, 1, 0, 1,
-0.6216541, 1.736464, -1.011005, 0.3254902, 1, 0, 1,
-0.6156866, 0.08216063, -3.260096, 0.3215686, 1, 0, 1,
-0.6082665, -0.8747838, -3.108102, 0.3137255, 1, 0, 1,
-0.6072016, -0.2453958, -2.485836, 0.3098039, 1, 0, 1,
-0.6050764, 1.534873, 2.425054, 0.3019608, 1, 0, 1,
-0.5992253, -0.1526768, -1.905279, 0.2941177, 1, 0, 1,
-0.5982422, -0.1626131, -0.494682, 0.2901961, 1, 0, 1,
-0.5971921, 1.015676, 1.338823, 0.282353, 1, 0, 1,
-0.5955482, -1.336153, -2.008055, 0.2784314, 1, 0, 1,
-0.5913202, -1.350376, -1.891747, 0.2705882, 1, 0, 1,
-0.589636, -1.139484, -0.5115701, 0.2666667, 1, 0, 1,
-0.5885434, 1.114821, -0.931159, 0.2588235, 1, 0, 1,
-0.578623, 0.8791868, 0.5747117, 0.254902, 1, 0, 1,
-0.5735226, 0.6938198, -1.798103, 0.2470588, 1, 0, 1,
-0.5716474, 1.781921, -0.8931836, 0.2431373, 1, 0, 1,
-0.5714021, -1.520711, -2.636564, 0.2352941, 1, 0, 1,
-0.5688919, 0.902878, 0.6837562, 0.2313726, 1, 0, 1,
-0.5671759, -2.038127, -1.634017, 0.2235294, 1, 0, 1,
-0.566054, 1.430882, 0.4620298, 0.2196078, 1, 0, 1,
-0.5615596, 0.04756361, 0.07616452, 0.2117647, 1, 0, 1,
-0.5608556, 1.792711, -1.750885, 0.2078431, 1, 0, 1,
-0.5607721, 0.08784483, -1.707296, 0.2, 1, 0, 1,
-0.5474092, -1.587067, -2.31801, 0.1921569, 1, 0, 1,
-0.5465981, -0.9777319, -1.928551, 0.1882353, 1, 0, 1,
-0.5411268, 0.3944488, -2.443331, 0.1803922, 1, 0, 1,
-0.5387558, -2.17538, -2.229619, 0.1764706, 1, 0, 1,
-0.5284688, 0.08801919, -1.976098, 0.1686275, 1, 0, 1,
-0.525678, 0.3144481, -2.371437, 0.1647059, 1, 0, 1,
-0.5233256, 0.5230267, -1.787681, 0.1568628, 1, 0, 1,
-0.519865, 0.4253352, -0.8906231, 0.1529412, 1, 0, 1,
-0.5148321, 1.591241, 0.5980939, 0.145098, 1, 0, 1,
-0.513515, -0.08248122, -3.082296, 0.1411765, 1, 0, 1,
-0.5111624, 1.389539, -0.6798709, 0.1333333, 1, 0, 1,
-0.5107723, 0.9021341, -0.4952509, 0.1294118, 1, 0, 1,
-0.5069666, -0.8613729, -2.053146, 0.1215686, 1, 0, 1,
-0.5029325, 1.216698, -1.263675, 0.1176471, 1, 0, 1,
-0.5014266, -0.6054399, -2.744256, 0.1098039, 1, 0, 1,
-0.5012938, 2.877903, 1.8197, 0.1058824, 1, 0, 1,
-0.5006354, 0.711316, 0.5930685, 0.09803922, 1, 0, 1,
-0.4968772, -0.890727, -3.480582, 0.09019608, 1, 0, 1,
-0.4932529, 0.5021319, -0.8110078, 0.08627451, 1, 0, 1,
-0.4892201, 0.3221205, -1.057569, 0.07843138, 1, 0, 1,
-0.488575, -0.5989426, -1.919899, 0.07450981, 1, 0, 1,
-0.4880511, -0.4013146, -3.016328, 0.06666667, 1, 0, 1,
-0.4876949, -0.4457332, -3.115673, 0.0627451, 1, 0, 1,
-0.4867448, 0.3868262, 0.6253532, 0.05490196, 1, 0, 1,
-0.4846979, 0.8426974, -2.280016, 0.05098039, 1, 0, 1,
-0.48091, 1.249106, 0.6991069, 0.04313726, 1, 0, 1,
-0.4775868, -0.1251431, -0.3223288, 0.03921569, 1, 0, 1,
-0.4714914, 0.009904085, -1.52168, 0.03137255, 1, 0, 1,
-0.4710395, -1.002216, -3.007298, 0.02745098, 1, 0, 1,
-0.469696, -1.139805, -1.152543, 0.01960784, 1, 0, 1,
-0.4674489, -0.933917, -3.000326, 0.01568628, 1, 0, 1,
-0.4674176, 0.7471713, -1.25152, 0.007843138, 1, 0, 1,
-0.4664582, 0.9906572, -0.1859076, 0.003921569, 1, 0, 1,
-0.4659225, 0.2323818, -2.64599, 0, 1, 0.003921569, 1,
-0.4658422, -0.6539919, -3.265344, 0, 1, 0.01176471, 1,
-0.4592575, 0.4676137, 0.1748742, 0, 1, 0.01568628, 1,
-0.4571292, -0.9575086, -3.856954, 0, 1, 0.02352941, 1,
-0.4567665, -2.276185, -3.664787, 0, 1, 0.02745098, 1,
-0.4560312, 0.1126433, -1.796616, 0, 1, 0.03529412, 1,
-0.4556125, 1.713283, -2.477323, 0, 1, 0.03921569, 1,
-0.4511978, -0.6785247, -2.782787, 0, 1, 0.04705882, 1,
-0.449856, -1.491092, -4.851375, 0, 1, 0.05098039, 1,
-0.4496974, 1.627859, -0.5164373, 0, 1, 0.05882353, 1,
-0.4462644, 0.6660006, -1.401505, 0, 1, 0.0627451, 1,
-0.4448509, 0.6022761, -0.8769784, 0, 1, 0.07058824, 1,
-0.4446625, 0.5998799, -0.0442066, 0, 1, 0.07450981, 1,
-0.4390975, 0.2675395, -0.5514492, 0, 1, 0.08235294, 1,
-0.4377127, 0.614475, -0.9711898, 0, 1, 0.08627451, 1,
-0.4346221, -1.265959, -2.56861, 0, 1, 0.09411765, 1,
-0.4298652, -0.1112869, -2.197075, 0, 1, 0.1019608, 1,
-0.4250203, -0.3419552, -1.092787, 0, 1, 0.1058824, 1,
-0.4168235, 0.6233426, -0.2845205, 0, 1, 0.1137255, 1,
-0.4147152, -0.2263802, -2.929445, 0, 1, 0.1176471, 1,
-0.4147068, -1.18407, -3.800621, 0, 1, 0.1254902, 1,
-0.4106279, -0.01394332, -0.9306142, 0, 1, 0.1294118, 1,
-0.4089553, -0.9984182, -2.798677, 0, 1, 0.1372549, 1,
-0.4052097, 0.01762776, -1.048688, 0, 1, 0.1411765, 1,
-0.4044588, 1.294991, -0.384442, 0, 1, 0.1490196, 1,
-0.403233, 0.5456002, -0.9289339, 0, 1, 0.1529412, 1,
-0.3998092, 0.4672543, -1.713969, 0, 1, 0.1607843, 1,
-0.3985686, -0.7299176, -1.026761, 0, 1, 0.1647059, 1,
-0.3974416, -1.853634, -4.187551, 0, 1, 0.172549, 1,
-0.3972526, 0.3459516, -1.751106, 0, 1, 0.1764706, 1,
-0.3962819, 0.8651001, 0.555201, 0, 1, 0.1843137, 1,
-0.3950687, -0.4624343, -3.69678, 0, 1, 0.1882353, 1,
-0.3949305, 0.7036447, -1.406564, 0, 1, 0.1960784, 1,
-0.3949245, -0.7949209, -3.559729, 0, 1, 0.2039216, 1,
-0.3894884, -1.885868, -2.987451, 0, 1, 0.2078431, 1,
-0.3892974, -0.4843671, -2.310103, 0, 1, 0.2156863, 1,
-0.3856245, -0.6985703, -3.028551, 0, 1, 0.2196078, 1,
-0.3846762, -1.796317, -1.096935, 0, 1, 0.227451, 1,
-0.3800763, -0.4445224, -1.945372, 0, 1, 0.2313726, 1,
-0.3788246, -0.4421096, -1.924145, 0, 1, 0.2392157, 1,
-0.3760216, 0.9142339, -0.332533, 0, 1, 0.2431373, 1,
-0.3722985, -0.3888594, -3.267347, 0, 1, 0.2509804, 1,
-0.3706443, -0.4152886, -3.449208, 0, 1, 0.254902, 1,
-0.3689305, 0.5648637, -0.272001, 0, 1, 0.2627451, 1,
-0.3671006, 1.007083, 0.4536066, 0, 1, 0.2666667, 1,
-0.3669945, 0.3122037, -0.872196, 0, 1, 0.2745098, 1,
-0.3667608, 1.207163, 0.9222256, 0, 1, 0.2784314, 1,
-0.3522516, -0.8314493, -1.954958, 0, 1, 0.2862745, 1,
-0.3504332, -0.6416507, -4.008175, 0, 1, 0.2901961, 1,
-0.3487302, -0.9058875, -5.31577, 0, 1, 0.2980392, 1,
-0.3404731, 0.7360963, -3.405228, 0, 1, 0.3058824, 1,
-0.340165, -0.7768481, -1.614258, 0, 1, 0.3098039, 1,
-0.3393996, -0.1012111, -1.592252, 0, 1, 0.3176471, 1,
-0.3320234, -0.2915341, -2.170032, 0, 1, 0.3215686, 1,
-0.3290354, 1.789186, 1.259245, 0, 1, 0.3294118, 1,
-0.3277929, -0.3662494, -1.977814, 0, 1, 0.3333333, 1,
-0.3254613, -0.462734, -2.338806, 0, 1, 0.3411765, 1,
-0.3237217, -0.4459612, -2.644256, 0, 1, 0.345098, 1,
-0.3237017, -0.1547972, -4.188975, 0, 1, 0.3529412, 1,
-0.3208999, -1.659479, -4.232301, 0, 1, 0.3568628, 1,
-0.3206637, -0.4788159, -2.990307, 0, 1, 0.3647059, 1,
-0.3115725, 1.039336, 0.3114154, 0, 1, 0.3686275, 1,
-0.3096458, -0.6018451, -2.429447, 0, 1, 0.3764706, 1,
-0.3069261, -1.379652, -2.852755, 0, 1, 0.3803922, 1,
-0.3057783, -1.355798, -2.583816, 0, 1, 0.3882353, 1,
-0.3056779, -0.5857794, -1.536905, 0, 1, 0.3921569, 1,
-0.3030531, 0.09684724, -1.833044, 0, 1, 0.4, 1,
-0.3001407, 0.4676362, -1.120781, 0, 1, 0.4078431, 1,
-0.2908891, -0.1777805, -1.807107, 0, 1, 0.4117647, 1,
-0.2901899, 0.810427, 0.02841856, 0, 1, 0.4196078, 1,
-0.2878692, -0.7820051, -2.466532, 0, 1, 0.4235294, 1,
-0.2871574, -0.1883438, -2.893005, 0, 1, 0.4313726, 1,
-0.2866905, -0.9902416, -1.718998, 0, 1, 0.4352941, 1,
-0.2819313, -0.2806651, -2.842901, 0, 1, 0.4431373, 1,
-0.2788733, -0.3058002, -1.836385, 0, 1, 0.4470588, 1,
-0.2739038, -1.284979, -3.293371, 0, 1, 0.454902, 1,
-0.2725856, -1.081643, -2.448411, 0, 1, 0.4588235, 1,
-0.2718791, -1.275173, -2.841336, 0, 1, 0.4666667, 1,
-0.2716787, 0.9842006, 0.3275136, 0, 1, 0.4705882, 1,
-0.2681613, 0.01133223, -3.128713, 0, 1, 0.4784314, 1,
-0.2634976, -1.893584, -4.761446, 0, 1, 0.4823529, 1,
-0.2516533, -0.4870002, -1.88872, 0, 1, 0.4901961, 1,
-0.2503951, 2.852167, 0.1223774, 0, 1, 0.4941176, 1,
-0.2499001, 1.698345, -0.8330517, 0, 1, 0.5019608, 1,
-0.2490336, 0.05743634, 0.9300336, 0, 1, 0.509804, 1,
-0.2469255, 0.5990774, 0.7720405, 0, 1, 0.5137255, 1,
-0.2462771, 0.5512449, 0.5928723, 0, 1, 0.5215687, 1,
-0.2450125, 0.08826808, -1.575414, 0, 1, 0.5254902, 1,
-0.2442798, -0.2917622, -2.63642, 0, 1, 0.5333334, 1,
-0.2441533, -1.422372, -2.728681, 0, 1, 0.5372549, 1,
-0.2421088, 0.2765711, 0.3021424, 0, 1, 0.5450981, 1,
-0.2407364, -0.3565748, -2.028008, 0, 1, 0.5490196, 1,
-0.2399368, -0.773918, -1.708877, 0, 1, 0.5568628, 1,
-0.2397114, -0.4733054, -2.670332, 0, 1, 0.5607843, 1,
-0.2333363, 0.4084011, -0.4368292, 0, 1, 0.5686275, 1,
-0.22956, 0.4220915, -1.196008, 0, 1, 0.572549, 1,
-0.2288211, 1.723267, 1.916897, 0, 1, 0.5803922, 1,
-0.2283015, 1.337183, 0.7595161, 0, 1, 0.5843138, 1,
-0.2275872, -0.8735937, -2.931107, 0, 1, 0.5921569, 1,
-0.2267977, -1.683746, -1.329878, 0, 1, 0.5960785, 1,
-0.2259558, 0.8721316, -1.675833, 0, 1, 0.6039216, 1,
-0.2180551, -0.5754908, -2.211046, 0, 1, 0.6117647, 1,
-0.2178101, -1.224672, -0.9561872, 0, 1, 0.6156863, 1,
-0.2167658, -0.8740634, -4.07407, 0, 1, 0.6235294, 1,
-0.2161483, 2.405234, -1.299178, 0, 1, 0.627451, 1,
-0.2158226, 0.4715999, -0.3984648, 0, 1, 0.6352941, 1,
-0.2102472, 0.4091085, 0.5239828, 0, 1, 0.6392157, 1,
-0.202692, -1.044368, -3.086682, 0, 1, 0.6470588, 1,
-0.2010747, -0.322131, -1.943629, 0, 1, 0.6509804, 1,
-0.2003056, -1.485165, -3.930909, 0, 1, 0.6588235, 1,
-0.1988382, -0.6129602, -1.575163, 0, 1, 0.6627451, 1,
-0.1912642, 0.3795755, -1.444315, 0, 1, 0.6705883, 1,
-0.1893967, -0.8300363, -4.283815, 0, 1, 0.6745098, 1,
-0.1875634, 0.6455156, -0.3510228, 0, 1, 0.682353, 1,
-0.1837787, 1.606866, -0.323701, 0, 1, 0.6862745, 1,
-0.181773, 1.140998, -0.5940682, 0, 1, 0.6941177, 1,
-0.1811895, 1.054859, 1.153881, 0, 1, 0.7019608, 1,
-0.1762258, 0.1706648, -0.2957594, 0, 1, 0.7058824, 1,
-0.1741788, -1.181296, -4.185117, 0, 1, 0.7137255, 1,
-0.1741754, -0.08518609, -0.5494688, 0, 1, 0.7176471, 1,
-0.1729627, -0.4300237, -2.95742, 0, 1, 0.7254902, 1,
-0.1692923, -0.4402447, -2.793318, 0, 1, 0.7294118, 1,
-0.1673007, -0.08164931, -2.975751, 0, 1, 0.7372549, 1,
-0.1667054, -0.3287831, -1.499771, 0, 1, 0.7411765, 1,
-0.1657674, -0.8873806, -2.600327, 0, 1, 0.7490196, 1,
-0.1617956, -0.732884, -2.232733, 0, 1, 0.7529412, 1,
-0.159247, 0.05665325, -0.6374983, 0, 1, 0.7607843, 1,
-0.152954, -0.03917747, -2.560153, 0, 1, 0.7647059, 1,
-0.1526824, 0.08705625, -0.4614187, 0, 1, 0.772549, 1,
-0.1446782, -0.3863509, -2.554368, 0, 1, 0.7764706, 1,
-0.1440405, 0.119871, -1.797675, 0, 1, 0.7843137, 1,
-0.1439346, -0.2357425, -1.410426, 0, 1, 0.7882353, 1,
-0.1433679, 0.9837828, -1.55234, 0, 1, 0.7960784, 1,
-0.1430136, 0.4280436, 0.7546939, 0, 1, 0.8039216, 1,
-0.1370082, -0.2773733, -3.293208, 0, 1, 0.8078431, 1,
-0.1316548, -0.6889734, -3.397419, 0, 1, 0.8156863, 1,
-0.1296852, -0.6112829, 0.2081303, 0, 1, 0.8196079, 1,
-0.1266326, -0.2023588, -2.650302, 0, 1, 0.827451, 1,
-0.1237897, 1.127933, 1.191582, 0, 1, 0.8313726, 1,
-0.1222484, -0.5833984, -2.182256, 0, 1, 0.8392157, 1,
-0.1184915, -0.6179791, -2.932892, 0, 1, 0.8431373, 1,
-0.1168163, -0.5153015, -1.066343, 0, 1, 0.8509804, 1,
-0.1161563, 0.07886188, 0.1318101, 0, 1, 0.854902, 1,
-0.1072463, 0.000828434, -1.245536, 0, 1, 0.8627451, 1,
-0.106494, 0.6301968, 0.8764988, 0, 1, 0.8666667, 1,
-0.1019791, -0.5821233, -3.296669, 0, 1, 0.8745098, 1,
-0.09705883, 1.626607, 1.505583, 0, 1, 0.8784314, 1,
-0.09446257, 1.105891, -1.274754, 0, 1, 0.8862745, 1,
-0.09357653, 1.45105, 0.8607987, 0, 1, 0.8901961, 1,
-0.09258342, -1.217698, -1.762883, 0, 1, 0.8980392, 1,
-0.09154534, 1.042512, 1.59305, 0, 1, 0.9058824, 1,
-0.08830318, -0.6103846, -3.937123, 0, 1, 0.9098039, 1,
-0.08706587, 1.169958, 0.652049, 0, 1, 0.9176471, 1,
-0.08670598, 0.9992993, -1.405657, 0, 1, 0.9215686, 1,
-0.08602525, -0.1567473, -4.574144, 0, 1, 0.9294118, 1,
-0.08571729, 3.042688, -1.330149, 0, 1, 0.9333333, 1,
-0.0817289, 1.187662, -0.8204029, 0, 1, 0.9411765, 1,
-0.07289537, 1.099164, -1.068891, 0, 1, 0.945098, 1,
-0.06939298, 0.8627828, -2.158897, 0, 1, 0.9529412, 1,
-0.06394923, 0.1950165, -0.3915593, 0, 1, 0.9568627, 1,
-0.06335624, 0.4920197, -0.1096579, 0, 1, 0.9647059, 1,
-0.05987414, -1.730563, -3.455736, 0, 1, 0.9686275, 1,
-0.05889957, -1.161268, -2.778152, 0, 1, 0.9764706, 1,
-0.0580855, -1.054597, -3.614677, 0, 1, 0.9803922, 1,
-0.05801543, 0.4658618, -0.2238518, 0, 1, 0.9882353, 1,
-0.05742622, -1.272947, -1.881701, 0, 1, 0.9921569, 1,
-0.05732258, 0.1870003, 0.649442, 0, 1, 1, 1,
-0.05208165, -0.06861424, -4.391441, 0, 0.9921569, 1, 1,
-0.05018477, 1.141534, -0.2682185, 0, 0.9882353, 1, 1,
-0.04679739, 0.6516352, 0.3837814, 0, 0.9803922, 1, 1,
-0.04480505, -0.02327739, -1.392159, 0, 0.9764706, 1, 1,
-0.04413285, -0.01124772, -2.248374, 0, 0.9686275, 1, 1,
-0.04022387, 1.971456, -0.5839379, 0, 0.9647059, 1, 1,
-0.03932959, 0.5663499, 1.374157, 0, 0.9568627, 1, 1,
-0.03872351, -1.434813, -4.09269, 0, 0.9529412, 1, 1,
-0.03313483, 0.08402074, -0.01209245, 0, 0.945098, 1, 1,
-0.03110712, -1.87831, -3.211426, 0, 0.9411765, 1, 1,
-0.0242258, -0.2892824, -1.2327, 0, 0.9333333, 1, 1,
-0.01394969, 1.346439, -0.0101611, 0, 0.9294118, 1, 1,
-0.004872114, 1.21878, 0.8348618, 0, 0.9215686, 1, 1,
-0.001479761, 0.6114635, 0.6790698, 0, 0.9176471, 1, 1,
-0.001042214, 0.6942027, -1.255908, 0, 0.9098039, 1, 1,
0.005345846, -0.79248, 1.410688, 0, 0.9058824, 1, 1,
0.01099798, -0.667056, 2.883246, 0, 0.8980392, 1, 1,
0.01288008, 1.942594, -1.058705, 0, 0.8901961, 1, 1,
0.01375088, 1.836255, -1.012315, 0, 0.8862745, 1, 1,
0.01558438, -0.03767549, 4.706569, 0, 0.8784314, 1, 1,
0.01586834, 0.7221312, -0.8173915, 0, 0.8745098, 1, 1,
0.01900431, -0.6664099, 1.929094, 0, 0.8666667, 1, 1,
0.02251397, 0.747849, 0.01701931, 0, 0.8627451, 1, 1,
0.02357898, -0.5491797, 2.917896, 0, 0.854902, 1, 1,
0.0260757, 0.1341117, -0.5781506, 0, 0.8509804, 1, 1,
0.03004193, 0.8472793, 1.052935, 0, 0.8431373, 1, 1,
0.04450514, -0.3421584, 2.645133, 0, 0.8392157, 1, 1,
0.04451175, 0.6528956, -0.8445019, 0, 0.8313726, 1, 1,
0.04965182, 2.344589, -0.8803784, 0, 0.827451, 1, 1,
0.05058166, -1.531299, 3.650386, 0, 0.8196079, 1, 1,
0.05080967, -0.6147931, 3.409839, 0, 0.8156863, 1, 1,
0.05162035, -0.1168544, 0.5541893, 0, 0.8078431, 1, 1,
0.0567145, -0.4032883, 3.815766, 0, 0.8039216, 1, 1,
0.05851686, 1.114609, -1.100811, 0, 0.7960784, 1, 1,
0.06481273, -0.06747799, 1.779688, 0, 0.7882353, 1, 1,
0.08016884, -0.4754625, 3.349586, 0, 0.7843137, 1, 1,
0.08150592, -1.048828, 4.293071, 0, 0.7764706, 1, 1,
0.08427808, 0.8281588, 0.7496182, 0, 0.772549, 1, 1,
0.08597072, -0.7952135, 2.942533, 0, 0.7647059, 1, 1,
0.08833796, -1.633721, 3.144119, 0, 0.7607843, 1, 1,
0.09143221, 0.02306067, 0.6271722, 0, 0.7529412, 1, 1,
0.09338365, 0.014488, -0.5158156, 0, 0.7490196, 1, 1,
0.09379017, 1.344701, 0.7897997, 0, 0.7411765, 1, 1,
0.09427924, 0.8479422, 0.09346154, 0, 0.7372549, 1, 1,
0.09445632, 1.428765, 0.2245189, 0, 0.7294118, 1, 1,
0.0949383, 1.397106, 0.9564781, 0, 0.7254902, 1, 1,
0.09917166, -0.2339815, 3.476531, 0, 0.7176471, 1, 1,
0.1019565, -0.8649224, 2.717228, 0, 0.7137255, 1, 1,
0.1071002, -1.072415, 4.431277, 0, 0.7058824, 1, 1,
0.1093847, 0.2927798, 0.945253, 0, 0.6980392, 1, 1,
0.1131355, 1.241454, 0.05638246, 0, 0.6941177, 1, 1,
0.1150665, 1.156775, 0.3215724, 0, 0.6862745, 1, 1,
0.1150921, -0.1952669, 2.744176, 0, 0.682353, 1, 1,
0.1200456, -0.2498714, 2.059088, 0, 0.6745098, 1, 1,
0.1201314, -1.08847, 4.42183, 0, 0.6705883, 1, 1,
0.1273187, 1.278151, 0.2153203, 0, 0.6627451, 1, 1,
0.1302216, -0.6788098, 1.998087, 0, 0.6588235, 1, 1,
0.1341336, -2.76044, 3.548133, 0, 0.6509804, 1, 1,
0.1342253, -0.07835754, 2.08501, 0, 0.6470588, 1, 1,
0.1346717, -1.04241, 2.779169, 0, 0.6392157, 1, 1,
0.1402937, 1.736406, 1.551685, 0, 0.6352941, 1, 1,
0.1403257, -0.1565399, 2.465799, 0, 0.627451, 1, 1,
0.1408509, -0.3469099, 2.105246, 0, 0.6235294, 1, 1,
0.1410162, 0.8115773, 0.8835473, 0, 0.6156863, 1, 1,
0.1431987, -2.821126, 3.343467, 0, 0.6117647, 1, 1,
0.1465795, 1.216854, 1.249898, 0, 0.6039216, 1, 1,
0.1553814, -0.5699924, 2.877095, 0, 0.5960785, 1, 1,
0.156907, -0.1948725, 2.88462, 0, 0.5921569, 1, 1,
0.160001, 1.635654, 0.4006121, 0, 0.5843138, 1, 1,
0.1677298, 0.9124581, 0.167835, 0, 0.5803922, 1, 1,
0.1703336, 1.091931, -0.2693397, 0, 0.572549, 1, 1,
0.1800349, -1.124721, 3.536846, 0, 0.5686275, 1, 1,
0.1814763, 0.2039448, 0.9970986, 0, 0.5607843, 1, 1,
0.1819275, 1.512694, 1.100376, 0, 0.5568628, 1, 1,
0.1819525, 0.5953134, 1.614426, 0, 0.5490196, 1, 1,
0.1830026, -0.6590781, 2.739408, 0, 0.5450981, 1, 1,
0.1831988, -0.2597648, 1.211883, 0, 0.5372549, 1, 1,
0.1845291, -0.7408592, 0.2821362, 0, 0.5333334, 1, 1,
0.1900412, -0.4687427, 1.930619, 0, 0.5254902, 1, 1,
0.1921133, 1.963569, -0.9890257, 0, 0.5215687, 1, 1,
0.194026, 0.570514, -0.4187503, 0, 0.5137255, 1, 1,
0.197284, 0.01849547, 1.207345, 0, 0.509804, 1, 1,
0.1980581, 0.4196776, 0.3136287, 0, 0.5019608, 1, 1,
0.1983475, 0.456117, 0.755064, 0, 0.4941176, 1, 1,
0.2005096, 0.142545, -0.9194177, 0, 0.4901961, 1, 1,
0.202436, 0.9882634, -0.176068, 0, 0.4823529, 1, 1,
0.2044682, -1.837359, 2.657778, 0, 0.4784314, 1, 1,
0.2063873, -0.3938572, 3.419773, 0, 0.4705882, 1, 1,
0.2074823, -1.082018, 2.615684, 0, 0.4666667, 1, 1,
0.207506, 0.5594202, -0.2663135, 0, 0.4588235, 1, 1,
0.2078375, 0.3466265, 0.670536, 0, 0.454902, 1, 1,
0.2081603, -0.9303348, 3.572324, 0, 0.4470588, 1, 1,
0.2121485, 0.9669975, -0.04248958, 0, 0.4431373, 1, 1,
0.2136465, 0.6486038, 1.101344, 0, 0.4352941, 1, 1,
0.2181107, -0.610851, 4.843631, 0, 0.4313726, 1, 1,
0.2241344, 0.5295909, -1.884987, 0, 0.4235294, 1, 1,
0.2306649, -0.138482, 2.042518, 0, 0.4196078, 1, 1,
0.2446651, 0.4560845, -0.06641807, 0, 0.4117647, 1, 1,
0.247536, 1.076309, 0.9439034, 0, 0.4078431, 1, 1,
0.2495321, -0.2230401, 0.9321964, 0, 0.4, 1, 1,
0.2508652, 0.7589399, -0.9287874, 0, 0.3921569, 1, 1,
0.250924, 0.9929754, 0.03837298, 0, 0.3882353, 1, 1,
0.2510568, -1.117393, 0.6406642, 0, 0.3803922, 1, 1,
0.2545577, 1.756014, -1.158667, 0, 0.3764706, 1, 1,
0.2615082, 0.2333632, 2.799029, 0, 0.3686275, 1, 1,
0.2627621, 1.129395, 2.19203, 0, 0.3647059, 1, 1,
0.2685015, -1.26303, 3.173161, 0, 0.3568628, 1, 1,
0.270453, -0.3687745, -0.3579428, 0, 0.3529412, 1, 1,
0.2709811, 0.2072924, 1.458784, 0, 0.345098, 1, 1,
0.271925, -1.567014, 0.2422554, 0, 0.3411765, 1, 1,
0.2722266, -0.7723427, 4.036514, 0, 0.3333333, 1, 1,
0.2742969, 0.04278361, 0.9926326, 0, 0.3294118, 1, 1,
0.2840941, -0.3619012, 2.425807, 0, 0.3215686, 1, 1,
0.2908452, 0.4951483, -1.26813, 0, 0.3176471, 1, 1,
0.2952544, -0.5188035, 3.61151, 0, 0.3098039, 1, 1,
0.2954518, -0.8870368, 2.701026, 0, 0.3058824, 1, 1,
0.2964673, -0.974619, 2.50792, 0, 0.2980392, 1, 1,
0.301998, -1.598292, 3.889403, 0, 0.2901961, 1, 1,
0.3038879, 2.070667, 0.5805978, 0, 0.2862745, 1, 1,
0.3065511, -0.2943872, 3.036226, 0, 0.2784314, 1, 1,
0.3077267, -2.161033, 3.599087, 0, 0.2745098, 1, 1,
0.3078575, -0.3040589, 2.79699, 0, 0.2666667, 1, 1,
0.3202941, -0.1594622, 0.7651452, 0, 0.2627451, 1, 1,
0.3211578, 0.4026241, -0.3835143, 0, 0.254902, 1, 1,
0.3283945, 0.721377, -0.3482957, 0, 0.2509804, 1, 1,
0.3290433, 0.3448415, 0.04660772, 0, 0.2431373, 1, 1,
0.3291698, 0.5093271, -0.2875597, 0, 0.2392157, 1, 1,
0.3301169, -1.542725, 3.009886, 0, 0.2313726, 1, 1,
0.3347805, -0.08077713, 0.9221717, 0, 0.227451, 1, 1,
0.3361316, 0.9090282, 2.067323, 0, 0.2196078, 1, 1,
0.34162, -0.2258135, 2.424709, 0, 0.2156863, 1, 1,
0.347757, -0.9531397, 2.651459, 0, 0.2078431, 1, 1,
0.3568273, 0.5031079, 1.86801, 0, 0.2039216, 1, 1,
0.359903, 0.80642, 0.1839015, 0, 0.1960784, 1, 1,
0.3654909, 1.740061, -0.2578254, 0, 0.1882353, 1, 1,
0.3683042, 0.556081, 0.2124072, 0, 0.1843137, 1, 1,
0.3697586, -0.7420369, 2.018051, 0, 0.1764706, 1, 1,
0.3708275, 0.3299331, 1.476536, 0, 0.172549, 1, 1,
0.3736857, 0.6751825, 0.511268, 0, 0.1647059, 1, 1,
0.3750283, 0.6504548, 0.07290294, 0, 0.1607843, 1, 1,
0.3765607, 0.04246969, -0.3429239, 0, 0.1529412, 1, 1,
0.378134, 0.8285258, 1.66635, 0, 0.1490196, 1, 1,
0.3844613, 0.1147071, 1.700006, 0, 0.1411765, 1, 1,
0.3938559, -0.01924608, 3.518982, 0, 0.1372549, 1, 1,
0.3969159, -2.343905, 3.104598, 0, 0.1294118, 1, 1,
0.3983119, -0.1681838, 1.232313, 0, 0.1254902, 1, 1,
0.4040897, 0.7032942, 1.521384, 0, 0.1176471, 1, 1,
0.4042567, -0.2622674, 1.056339, 0, 0.1137255, 1, 1,
0.4051285, 0.2824399, 2.39757, 0, 0.1058824, 1, 1,
0.407488, 0.1196441, 0.4357507, 0, 0.09803922, 1, 1,
0.4109448, -2.49441, 1.99358, 0, 0.09411765, 1, 1,
0.4164247, 0.4353271, 0.2042483, 0, 0.08627451, 1, 1,
0.4184446, 0.6414325, -0.4064576, 0, 0.08235294, 1, 1,
0.4207009, 0.04792386, 2.628064, 0, 0.07450981, 1, 1,
0.4213219, 1.311213, 1.679162, 0, 0.07058824, 1, 1,
0.42423, 2.470494, -0.300465, 0, 0.0627451, 1, 1,
0.4248912, -0.7907899, 4.241198, 0, 0.05882353, 1, 1,
0.4263591, 0.4332507, 0.4214753, 0, 0.05098039, 1, 1,
0.4281915, 0.641053, 0.8473051, 0, 0.04705882, 1, 1,
0.431831, 0.09597383, 2.087048, 0, 0.03921569, 1, 1,
0.4358456, 0.610965, 1.597156, 0, 0.03529412, 1, 1,
0.4372647, -0.295466, 1.808444, 0, 0.02745098, 1, 1,
0.4423192, -1.001903, 3.975136, 0, 0.02352941, 1, 1,
0.4426354, -0.4306004, 2.924974, 0, 0.01568628, 1, 1,
0.4437997, 0.3421113, 0.3784625, 0, 0.01176471, 1, 1,
0.4444163, 0.5244001, 2.053474, 0, 0.003921569, 1, 1,
0.4444713, 0.07553363, 0.2715338, 0.003921569, 0, 1, 1,
0.4476515, 0.1039625, 1.08366, 0.007843138, 0, 1, 1,
0.4478644, 0.8417446, 1.153144, 0.01568628, 0, 1, 1,
0.4482417, -0.05656188, 0.3706363, 0.01960784, 0, 1, 1,
0.4551537, 0.3725988, 2.096518, 0.02745098, 0, 1, 1,
0.45575, 0.2307176, 0.8159407, 0.03137255, 0, 1, 1,
0.4557863, -0.6561671, 1.892158, 0.03921569, 0, 1, 1,
0.4578615, -0.3661174, 2.194927, 0.04313726, 0, 1, 1,
0.4598699, -0.831815, 2.99707, 0.05098039, 0, 1, 1,
0.4604838, 0.6565889, 0.6165668, 0.05490196, 0, 1, 1,
0.4616073, -0.1305296, 3.091467, 0.0627451, 0, 1, 1,
0.4644022, 1.047089, 2.046891, 0.06666667, 0, 1, 1,
0.4645149, 2.320882, -0.6655751, 0.07450981, 0, 1, 1,
0.4668591, -0.7199086, 4.658301, 0.07843138, 0, 1, 1,
0.4700895, 0.02858303, -0.1556711, 0.08627451, 0, 1, 1,
0.4747925, -0.5628873, 2.89701, 0.09019608, 0, 1, 1,
0.4769125, 0.6199388, 2.525189, 0.09803922, 0, 1, 1,
0.4775876, -1.811265, 3.454694, 0.1058824, 0, 1, 1,
0.479575, 2.02188, 1.30742, 0.1098039, 0, 1, 1,
0.4800241, 1.227067, -0.4171421, 0.1176471, 0, 1, 1,
0.4841404, -0.8457842, 4.675264, 0.1215686, 0, 1, 1,
0.4875892, -0.3396131, 4.519659, 0.1294118, 0, 1, 1,
0.4892819, -0.8873045, 1.342365, 0.1333333, 0, 1, 1,
0.4901845, 0.001930832, 1.092533, 0.1411765, 0, 1, 1,
0.4902821, -1.099752, 2.053352, 0.145098, 0, 1, 1,
0.4907306, 0.198386, -1.536445, 0.1529412, 0, 1, 1,
0.4927449, 0.2482726, -0.2889861, 0.1568628, 0, 1, 1,
0.4951799, 0.3180412, 0.9321095, 0.1647059, 0, 1, 1,
0.5018427, -0.7019864, 2.03287, 0.1686275, 0, 1, 1,
0.5029949, -0.1001841, 2.064271, 0.1764706, 0, 1, 1,
0.5056029, 0.6095899, 0.292725, 0.1803922, 0, 1, 1,
0.5100295, -0.2422092, 1.47729, 0.1882353, 0, 1, 1,
0.5150267, 0.3503141, 1.160618, 0.1921569, 0, 1, 1,
0.5209235, -0.2304695, 1.107618, 0.2, 0, 1, 1,
0.5290184, 0.1047723, 0.9543627, 0.2078431, 0, 1, 1,
0.5323572, -0.3656089, 2.925027, 0.2117647, 0, 1, 1,
0.5348555, 0.2495223, 1.316269, 0.2196078, 0, 1, 1,
0.5368666, -0.1106881, 1.772586, 0.2235294, 0, 1, 1,
0.5379505, -0.2787947, 2.594453, 0.2313726, 0, 1, 1,
0.5379645, -1.311887, 3.976219, 0.2352941, 0, 1, 1,
0.5454421, -0.3002304, 1.886286, 0.2431373, 0, 1, 1,
0.5505449, 0.3770743, 3.037377, 0.2470588, 0, 1, 1,
0.553194, -0.09063796, 1.445915, 0.254902, 0, 1, 1,
0.5596089, 0.5956152, 1.02774, 0.2588235, 0, 1, 1,
0.5609519, 0.3150284, 2.785377, 0.2666667, 0, 1, 1,
0.5644598, 1.331088, 0.5344127, 0.2705882, 0, 1, 1,
0.564795, 0.4612953, -0.0413585, 0.2784314, 0, 1, 1,
0.5705715, -1.376256, 2.861492, 0.282353, 0, 1, 1,
0.5706169, 1.083007, -0.07112357, 0.2901961, 0, 1, 1,
0.5712, 0.7418493, -1.398812, 0.2941177, 0, 1, 1,
0.5712146, -1.297939, 1.24739, 0.3019608, 0, 1, 1,
0.5729569, 0.748833, -1.158828, 0.3098039, 0, 1, 1,
0.5729774, 1.748621, -0.1539376, 0.3137255, 0, 1, 1,
0.57298, 1.109746, 2.412097, 0.3215686, 0, 1, 1,
0.5731523, 1.588403, -1.033163, 0.3254902, 0, 1, 1,
0.5741024, 2.31715, -0.8934516, 0.3333333, 0, 1, 1,
0.5744863, 1.029149, -0.8486634, 0.3372549, 0, 1, 1,
0.5750574, -1.226352, 3.912584, 0.345098, 0, 1, 1,
0.5767411, 1.469454, 1.007369, 0.3490196, 0, 1, 1,
0.5791338, 0.08326668, 1.885735, 0.3568628, 0, 1, 1,
0.5805497, -0.2030414, 2.53352, 0.3607843, 0, 1, 1,
0.5832757, -0.0675021, 1.599318, 0.3686275, 0, 1, 1,
0.583447, -2.160283, 4.582972, 0.372549, 0, 1, 1,
0.5847866, 0.2879497, 1.837264, 0.3803922, 0, 1, 1,
0.5854368, 1.167409, 0.4135763, 0.3843137, 0, 1, 1,
0.5936456, 1.016146, 0.8765851, 0.3921569, 0, 1, 1,
0.5937293, 0.08449581, 3.061996, 0.3960784, 0, 1, 1,
0.5950544, 0.7842222, 0.751443, 0.4039216, 0, 1, 1,
0.5975211, -1.290252, 1.018652, 0.4117647, 0, 1, 1,
0.5978313, 0.430562, 0.1409901, 0.4156863, 0, 1, 1,
0.5991244, -0.6071552, 2.798149, 0.4235294, 0, 1, 1,
0.5995381, -0.3864758, 1.458028, 0.427451, 0, 1, 1,
0.6009188, -1.953864, 3.773827, 0.4352941, 0, 1, 1,
0.6031327, 0.7118036, -0.2465627, 0.4392157, 0, 1, 1,
0.6045614, -0.7805343, 1.857092, 0.4470588, 0, 1, 1,
0.6057362, -0.6415565, 1.524924, 0.4509804, 0, 1, 1,
0.612229, -0.550153, 3.776987, 0.4588235, 0, 1, 1,
0.6146094, 0.620575, 1.401956, 0.4627451, 0, 1, 1,
0.6221707, 1.896493, 0.4005036, 0.4705882, 0, 1, 1,
0.6354077, -0.8717713, 0.7402484, 0.4745098, 0, 1, 1,
0.6365678, -0.117067, 1.077826, 0.4823529, 0, 1, 1,
0.6386337, -1.672337, 2.035949, 0.4862745, 0, 1, 1,
0.6452335, 1.837826, 1.0156, 0.4941176, 0, 1, 1,
0.647643, -0.1834439, 1.226366, 0.5019608, 0, 1, 1,
0.6489372, 1.958231, -0.5642292, 0.5058824, 0, 1, 1,
0.6525086, 1.03187, 1.562098, 0.5137255, 0, 1, 1,
0.6531642, 0.06637993, 0.80187, 0.5176471, 0, 1, 1,
0.654742, -1.226304, 3.505328, 0.5254902, 0, 1, 1,
0.6577708, -0.3185272, 3.542127, 0.5294118, 0, 1, 1,
0.6624166, 0.2402668, 1.161407, 0.5372549, 0, 1, 1,
0.6624714, -0.9160957, 2.837859, 0.5411765, 0, 1, 1,
0.6751806, -0.07958771, 1.675358, 0.5490196, 0, 1, 1,
0.6792704, -0.8912826, 0.2362545, 0.5529412, 0, 1, 1,
0.679888, 1.022552, -0.851751, 0.5607843, 0, 1, 1,
0.6806204, -0.8665413, 2.193927, 0.5647059, 0, 1, 1,
0.6842163, 0.5446971, 2.350391, 0.572549, 0, 1, 1,
0.6845936, 0.4948306, 0.5553962, 0.5764706, 0, 1, 1,
0.690456, 1.752928, -0.9842733, 0.5843138, 0, 1, 1,
0.6952797, -0.8437997, 2.213972, 0.5882353, 0, 1, 1,
0.698239, 0.2075664, 3.043682, 0.5960785, 0, 1, 1,
0.7005779, -0.1785204, 1.4736, 0.6039216, 0, 1, 1,
0.7007177, 1.932733, -0.7917266, 0.6078432, 0, 1, 1,
0.7030989, -0.4602511, 1.83849, 0.6156863, 0, 1, 1,
0.7135443, -0.3078606, 2.594784, 0.6196079, 0, 1, 1,
0.7190172, 0.588196, 2.567313, 0.627451, 0, 1, 1,
0.7279417, -0.3864524, 0.3536411, 0.6313726, 0, 1, 1,
0.7281154, -0.9379812, 3.915506, 0.6392157, 0, 1, 1,
0.7323058, -0.1314397, 0.8389177, 0.6431373, 0, 1, 1,
0.7363554, -0.2217404, 3.025793, 0.6509804, 0, 1, 1,
0.7376437, 0.57511, 0.5505224, 0.654902, 0, 1, 1,
0.7423422, -0.6344454, 0.5963445, 0.6627451, 0, 1, 1,
0.7459802, -1.311767, 2.68398, 0.6666667, 0, 1, 1,
0.7520766, 1.128406, 1.170669, 0.6745098, 0, 1, 1,
0.7558063, 0.4038521, -0.2377295, 0.6784314, 0, 1, 1,
0.7560099, 0.9356868, 1.699958, 0.6862745, 0, 1, 1,
0.7574033, 1.159026, -1.415796, 0.6901961, 0, 1, 1,
0.7578672, -1.952142, 2.948176, 0.6980392, 0, 1, 1,
0.7590645, -1.506951, 3.362571, 0.7058824, 0, 1, 1,
0.7609938, 1.500437, 2.058525, 0.7098039, 0, 1, 1,
0.7624466, -0.1584871, 2.074558, 0.7176471, 0, 1, 1,
0.7735218, 0.6387578, -0.05228595, 0.7215686, 0, 1, 1,
0.7747146, -1.32048, 1.402156, 0.7294118, 0, 1, 1,
0.7765458, 0.6817038, -0.797928, 0.7333333, 0, 1, 1,
0.7766173, 1.444284, 1.404252, 0.7411765, 0, 1, 1,
0.7778417, -0.8111157, 0.9605125, 0.7450981, 0, 1, 1,
0.7780594, -1.073268, 2.553398, 0.7529412, 0, 1, 1,
0.7934515, -0.3043887, 2.470196, 0.7568628, 0, 1, 1,
0.795772, -1.596022, 1.046112, 0.7647059, 0, 1, 1,
0.8071393, 0.2201069, 0.567068, 0.7686275, 0, 1, 1,
0.809343, -1.086376, 5.130222, 0.7764706, 0, 1, 1,
0.8099956, -0.1351053, 2.162298, 0.7803922, 0, 1, 1,
0.8155098, -0.2580044, 2.62673, 0.7882353, 0, 1, 1,
0.829234, 0.03291064, 1.589663, 0.7921569, 0, 1, 1,
0.8318385, -1.305692, 1.153019, 0.8, 0, 1, 1,
0.8320056, 0.4533253, 1.639268, 0.8078431, 0, 1, 1,
0.8320485, 0.4834355, -0.3748577, 0.8117647, 0, 1, 1,
0.8334344, 1.337073, -1.002884, 0.8196079, 0, 1, 1,
0.8343105, -0.7865435, 2.123619, 0.8235294, 0, 1, 1,
0.8345249, -0.2508056, 1.232175, 0.8313726, 0, 1, 1,
0.8539005, -0.6867678, 0.7249953, 0.8352941, 0, 1, 1,
0.8617429, -0.3770956, 6.089363, 0.8431373, 0, 1, 1,
0.8652495, -0.8628135, 2.836794, 0.8470588, 0, 1, 1,
0.8673684, -0.7549667, 3.151604, 0.854902, 0, 1, 1,
0.8708511, -1.250193, 1.334183, 0.8588235, 0, 1, 1,
0.8831598, 0.1290618, 0.9550575, 0.8666667, 0, 1, 1,
0.8861838, -0.3171248, 1.037813, 0.8705882, 0, 1, 1,
0.8880234, -0.4969909, 0.8882945, 0.8784314, 0, 1, 1,
0.9004551, -1.964941, 1.595611, 0.8823529, 0, 1, 1,
0.9042813, 0.2964938, 3.514858, 0.8901961, 0, 1, 1,
0.907923, -0.7219101, 0.6869422, 0.8941177, 0, 1, 1,
0.9118612, -0.4278734, 2.712671, 0.9019608, 0, 1, 1,
0.9148473, -1.033503, 3.603091, 0.9098039, 0, 1, 1,
0.9231831, 0.69693, 1.986533, 0.9137255, 0, 1, 1,
0.9290461, -0.5762095, 2.017425, 0.9215686, 0, 1, 1,
0.9339257, -0.976142, 2.48709, 0.9254902, 0, 1, 1,
0.9404007, 0.5629784, 2.746306, 0.9333333, 0, 1, 1,
0.9408745, 1.044159, 1.776408, 0.9372549, 0, 1, 1,
0.947267, -0.04593093, 1.843655, 0.945098, 0, 1, 1,
0.9511951, 3.105971, 0.4338222, 0.9490196, 0, 1, 1,
0.9536011, 0.3152097, 0.6000711, 0.9568627, 0, 1, 1,
0.9665686, 3.140656, 0.5345021, 0.9607843, 0, 1, 1,
0.973856, 0.006668234, 0.7193989, 0.9686275, 0, 1, 1,
0.979051, -1.00853, 2.725144, 0.972549, 0, 1, 1,
0.9806344, -0.8965924, 3.097497, 0.9803922, 0, 1, 1,
0.9810296, 1.552637, 2.669507, 0.9843137, 0, 1, 1,
0.9813973, -0.7829294, 2.641075, 0.9921569, 0, 1, 1,
0.9825669, 1.261945, 1.36571, 0.9960784, 0, 1, 1,
0.9834021, 1.724973, -1.95235, 1, 0, 0.9960784, 1,
0.9855614, 0.4689728, -0.08712775, 1, 0, 0.9882353, 1,
1.005991, 1.331674, -0.1892093, 1, 0, 0.9843137, 1,
1.012606, 1.262707, -0.566368, 1, 0, 0.9764706, 1,
1.014569, -0.7787444, 1.323492, 1, 0, 0.972549, 1,
1.020809, -1.644325, 2.513095, 1, 0, 0.9647059, 1,
1.031397, 0.07066115, 1.666337, 1, 0, 0.9607843, 1,
1.031431, 0.274435, 2.586902, 1, 0, 0.9529412, 1,
1.033654, -0.2503431, 2.016136, 1, 0, 0.9490196, 1,
1.036019, -0.6473737, 2.810441, 1, 0, 0.9411765, 1,
1.036108, -1.893635, 2.676489, 1, 0, 0.9372549, 1,
1.03905, 0.114536, 1.759491, 1, 0, 0.9294118, 1,
1.039845, 0.9055725, 3.781746, 1, 0, 0.9254902, 1,
1.046255, 1.670148, 2.076512, 1, 0, 0.9176471, 1,
1.048432, -1.400813, 2.292666, 1, 0, 0.9137255, 1,
1.05155, 1.207219, 1.825802, 1, 0, 0.9058824, 1,
1.05451, 0.6137936, 0.9967981, 1, 0, 0.9019608, 1,
1.054644, 0.8137011, 1.686705, 1, 0, 0.8941177, 1,
1.063749, -0.3178064, 1.587799, 1, 0, 0.8862745, 1,
1.06539, -0.9806331, 2.014953, 1, 0, 0.8823529, 1,
1.066, 0.4186151, 0.5446615, 1, 0, 0.8745098, 1,
1.078681, 1.22224, 0.3617779, 1, 0, 0.8705882, 1,
1.087189, -1.235903, 2.260112, 1, 0, 0.8627451, 1,
1.088503, 0.9186079, 1.625399, 1, 0, 0.8588235, 1,
1.10207, 0.430627, 2.049911, 1, 0, 0.8509804, 1,
1.111192, -1.195388, 1.493752, 1, 0, 0.8470588, 1,
1.117646, -1.48016, 2.095089, 1, 0, 0.8392157, 1,
1.118234, -0.08549246, 1.993958, 1, 0, 0.8352941, 1,
1.124231, 0.6497269, 0.6115066, 1, 0, 0.827451, 1,
1.129971, -0.2607422, 1.992789, 1, 0, 0.8235294, 1,
1.149495, -0.415144, 2.326664, 1, 0, 0.8156863, 1,
1.151047, -2.040744, 3.993007, 1, 0, 0.8117647, 1,
1.16506, 2.285727, -0.3405295, 1, 0, 0.8039216, 1,
1.169628, 1.180799, 2.154726, 1, 0, 0.7960784, 1,
1.17183, -0.9524264, 1.82069, 1, 0, 0.7921569, 1,
1.175543, 1.11147, -0.2239192, 1, 0, 0.7843137, 1,
1.175572, -0.3971888, 1.194136, 1, 0, 0.7803922, 1,
1.177808, 3.294515, -0.7065762, 1, 0, 0.772549, 1,
1.181771, 1.436752, 2.003673, 1, 0, 0.7686275, 1,
1.185418, -0.8634598, 1.976521, 1, 0, 0.7607843, 1,
1.186564, -1.054717, 1.983807, 1, 0, 0.7568628, 1,
1.192206, 0.9578794, 2.953693, 1, 0, 0.7490196, 1,
1.209837, -0.5800004, 2.992804, 1, 0, 0.7450981, 1,
1.211574, 0.8994018, -0.4695061, 1, 0, 0.7372549, 1,
1.215367, -0.6231936, 1.378005, 1, 0, 0.7333333, 1,
1.221765, 0.2176546, 0.4529604, 1, 0, 0.7254902, 1,
1.223211, 1.216203, -0.2493534, 1, 0, 0.7215686, 1,
1.23293, -0.3992918, 0.6949801, 1, 0, 0.7137255, 1,
1.235877, -0.5965064, -0.02057754, 1, 0, 0.7098039, 1,
1.236669, 0.4680878, 1.3516, 1, 0, 0.7019608, 1,
1.238529, -0.7706223, 1.624767, 1, 0, 0.6941177, 1,
1.244168, 0.5468999, 1.374417, 1, 0, 0.6901961, 1,
1.251904, -0.7632121, 0.5045984, 1, 0, 0.682353, 1,
1.264727, 0.4346018, 1.702204, 1, 0, 0.6784314, 1,
1.274538, 0.5020276, 1.49872, 1, 0, 0.6705883, 1,
1.28291, -1.306503, 1.684592, 1, 0, 0.6666667, 1,
1.292747, 0.6425532, 0.8086052, 1, 0, 0.6588235, 1,
1.293348, -0.4729536, 2.537286, 1, 0, 0.654902, 1,
1.294006, 0.7399548, 1.172867, 1, 0, 0.6470588, 1,
1.29833, -0.5995564, 2.015198, 1, 0, 0.6431373, 1,
1.300698, 0.5328768, 0.2521362, 1, 0, 0.6352941, 1,
1.304858, -0.620294, 1.971789, 1, 0, 0.6313726, 1,
1.309351, -0.7489104, 2.642832, 1, 0, 0.6235294, 1,
1.312024, 0.1653023, 2.794794, 1, 0, 0.6196079, 1,
1.317413, 1.438542, 1.610788, 1, 0, 0.6117647, 1,
1.31824, -0.03355932, 2.191839, 1, 0, 0.6078432, 1,
1.324292, 0.4083897, 0.6137108, 1, 0, 0.6, 1,
1.330596, -1.045986, 1.277495, 1, 0, 0.5921569, 1,
1.337771, -0.2376103, 1.101461, 1, 0, 0.5882353, 1,
1.343226, 0.1227691, -0.1269898, 1, 0, 0.5803922, 1,
1.355453, -0.9416205, 2.253801, 1, 0, 0.5764706, 1,
1.364352, -1.418574, 4.173875, 1, 0, 0.5686275, 1,
1.370455, 0.9411148, 0.7302986, 1, 0, 0.5647059, 1,
1.388937, 1.336219, 1.961776, 1, 0, 0.5568628, 1,
1.394228, -1.047857, 1.473042, 1, 0, 0.5529412, 1,
1.41602, -0.3976604, 0.6719009, 1, 0, 0.5450981, 1,
1.416307, 1.1009, 1.443975, 1, 0, 0.5411765, 1,
1.418821, 0.317185, 2.667386, 1, 0, 0.5333334, 1,
1.421615, -1.636129, 0.6658509, 1, 0, 0.5294118, 1,
1.421979, -0.5106397, 1.340882, 1, 0, 0.5215687, 1,
1.447172, 1.03856, 0.2139709, 1, 0, 0.5176471, 1,
1.452394, -1.046443, 1.426836, 1, 0, 0.509804, 1,
1.456682, 0.3037354, -0.9472663, 1, 0, 0.5058824, 1,
1.459996, 1.056194, 0.8900278, 1, 0, 0.4980392, 1,
1.466807, 0.5759479, 2.035523, 1, 0, 0.4901961, 1,
1.470247, -1.235479, 1.472017, 1, 0, 0.4862745, 1,
1.473254, 0.01463428, 0.01554587, 1, 0, 0.4784314, 1,
1.476432, 0.447669, 0.2871782, 1, 0, 0.4745098, 1,
1.482901, 1.436446, 0.9576212, 1, 0, 0.4666667, 1,
1.484824, 0.3998701, 1.509115, 1, 0, 0.4627451, 1,
1.499555, 0.8146986, -0.4750884, 1, 0, 0.454902, 1,
1.504594, -1.144281, 2.867939, 1, 0, 0.4509804, 1,
1.509695, -0.7982652, 2.330941, 1, 0, 0.4431373, 1,
1.524436, 0.09703494, 0.8080266, 1, 0, 0.4392157, 1,
1.530284, 0.02799278, 0.6399907, 1, 0, 0.4313726, 1,
1.533848, 0.01368254, 1.788196, 1, 0, 0.427451, 1,
1.535048, -0.7757509, 1.964761, 1, 0, 0.4196078, 1,
1.543267, 1.7142, -0.570065, 1, 0, 0.4156863, 1,
1.549823, 0.6582026, 2.047875, 1, 0, 0.4078431, 1,
1.550581, 1.763146, 2.651809, 1, 0, 0.4039216, 1,
1.566591, 2.097826, -1.520679, 1, 0, 0.3960784, 1,
1.573577, -0.8257151, 0.7844387, 1, 0, 0.3882353, 1,
1.590425, 0.0446934, 1.819635, 1, 0, 0.3843137, 1,
1.598719, 0.3201889, 0.2037224, 1, 0, 0.3764706, 1,
1.609434, 0.9968977, 0.2944526, 1, 0, 0.372549, 1,
1.641132, 1.325368, -1.053834, 1, 0, 0.3647059, 1,
1.643483, -0.2211294, 1.902187, 1, 0, 0.3607843, 1,
1.65609, 0.5561517, 1.688861, 1, 0, 0.3529412, 1,
1.657267, -1.646695, 1.912574, 1, 0, 0.3490196, 1,
1.660969, 0.5831498, 0.998229, 1, 0, 0.3411765, 1,
1.668805, -0.3646069, 1.249915, 1, 0, 0.3372549, 1,
1.702859, -0.468161, 3.079145, 1, 0, 0.3294118, 1,
1.719251, -0.4483914, 1.76525, 1, 0, 0.3254902, 1,
1.725467, -2.579595, 0.7240278, 1, 0, 0.3176471, 1,
1.727399, 1.403461, 1.26417, 1, 0, 0.3137255, 1,
1.729368, 0.1065169, -0.04430091, 1, 0, 0.3058824, 1,
1.730313, -0.2038381, 2.386046, 1, 0, 0.2980392, 1,
1.740007, 0.7816742, 0.9962421, 1, 0, 0.2941177, 1,
1.740334, -0.3509978, 2.367065, 1, 0, 0.2862745, 1,
1.762829, 0.1008121, 3.728752, 1, 0, 0.282353, 1,
1.76859, 2.607181, 0.4802494, 1, 0, 0.2745098, 1,
1.774113, -1.819347, 2.249556, 1, 0, 0.2705882, 1,
1.790092, -1.461033, 3.089554, 1, 0, 0.2627451, 1,
1.798883, 0.213124, 0.5044225, 1, 0, 0.2588235, 1,
1.824183, -0.131329, 0.650748, 1, 0, 0.2509804, 1,
1.837449, 1.142406, 0.7977192, 1, 0, 0.2470588, 1,
1.882867, -0.6308045, 1.413549, 1, 0, 0.2392157, 1,
1.897216, -1.251828, 0.2859901, 1, 0, 0.2352941, 1,
1.897992, 0.4354911, 2.405434, 1, 0, 0.227451, 1,
1.908116, 0.3737808, 2.689266, 1, 0, 0.2235294, 1,
1.91018, 1.420064, 1.405419, 1, 0, 0.2156863, 1,
1.918962, 1.458722, -0.5655023, 1, 0, 0.2117647, 1,
1.929017, -0.8030384, 2.408263, 1, 0, 0.2039216, 1,
1.929564, 0.2112962, 1.48458, 1, 0, 0.1960784, 1,
1.930926, 0.3971628, -0.4452373, 1, 0, 0.1921569, 1,
1.960909, -0.9435676, 2.410618, 1, 0, 0.1843137, 1,
1.96966, 0.0931793, 1.643739, 1, 0, 0.1803922, 1,
1.979962, -0.7092004, 5.106467, 1, 0, 0.172549, 1,
1.982524, 0.4802825, 2.739163, 1, 0, 0.1686275, 1,
2.003095, 0.4245378, 1.488596, 1, 0, 0.1607843, 1,
2.003232, 0.511716, 2.920907, 1, 0, 0.1568628, 1,
2.04443, -1.188345, 1.964785, 1, 0, 0.1490196, 1,
2.111629, 0.5489374, 1.906218, 1, 0, 0.145098, 1,
2.168956, 1.19763, 1.380582, 1, 0, 0.1372549, 1,
2.212101, 1.660925, 0.292277, 1, 0, 0.1333333, 1,
2.226771, -0.8289868, 1.810441, 1, 0, 0.1254902, 1,
2.269696, -2.315589, 0.9306623, 1, 0, 0.1215686, 1,
2.294312, 0.6244928, 3.168416, 1, 0, 0.1137255, 1,
2.348523, 1.241806, 1.255625, 1, 0, 0.1098039, 1,
2.38201, -0.003927493, 1.41268, 1, 0, 0.1019608, 1,
2.426094, 0.4801932, 2.344104, 1, 0, 0.09411765, 1,
2.452277, 0.8965901, 1.425114, 1, 0, 0.09019608, 1,
2.452916, 1.306158, 0.706692, 1, 0, 0.08235294, 1,
2.510778, -0.2542181, 0.8199521, 1, 0, 0.07843138, 1,
2.516601, 1.560022, 2.901677, 1, 0, 0.07058824, 1,
2.535246, 0.8681423, 1.098065, 1, 0, 0.06666667, 1,
2.601847, -2.145176, 3.360653, 1, 0, 0.05882353, 1,
2.633461, 0.9278269, 1.548454, 1, 0, 0.05490196, 1,
2.707841, 1.447427, -0.4590577, 1, 0, 0.04705882, 1,
2.74164, 1.61814, 0.9613833, 1, 0, 0.04313726, 1,
2.779186, 0.03555574, 0.7101102, 1, 0, 0.03529412, 1,
2.814066, 1.12491, 1.28714, 1, 0, 0.03137255, 1,
2.961592, 0.1681954, 2.27374, 1, 0, 0.02352941, 1,
3.034408, 1.698234, -1.794887, 1, 0, 0.01960784, 1,
3.069996, -0.2741614, 2.65929, 1, 0, 0.01176471, 1,
3.238847, 0.7878606, 3.273907, 1, 0, 0.007843138, 1
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
0.1999636, -3.857727, -7.435547, 0, -0.5, 0.5, 0.5,
0.1999636, -3.857727, -7.435547, 1, -0.5, 0.5, 0.5,
0.1999636, -3.857727, -7.435547, 1, 1.5, 0.5, 0.5,
0.1999636, -3.857727, -7.435547, 0, 1.5, 0.5, 0.5
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
-3.869101, 0.2366948, -7.435547, 0, -0.5, 0.5, 0.5,
-3.869101, 0.2366948, -7.435547, 1, -0.5, 0.5, 0.5,
-3.869101, 0.2366948, -7.435547, 1, 1.5, 0.5, 0.5,
-3.869101, 0.2366948, -7.435547, 0, 1.5, 0.5, 0.5
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
-3.869101, -3.857727, 0.3070157, 0, -0.5, 0.5, 0.5,
-3.869101, -3.857727, 0.3070157, 1, -0.5, 0.5, 0.5,
-3.869101, -3.857727, 0.3070157, 1, 1.5, 0.5, 0.5,
-3.869101, -3.857727, 0.3070157, 0, 1.5, 0.5, 0.5
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
-2, -2.91286, -5.648802,
3, -2.91286, -5.648802,
-2, -2.91286, -5.648802,
-2, -3.070338, -5.946593,
-1, -2.91286, -5.648802,
-1, -3.070338, -5.946593,
0, -2.91286, -5.648802,
0, -3.070338, -5.946593,
1, -2.91286, -5.648802,
1, -3.070338, -5.946593,
2, -2.91286, -5.648802,
2, -3.070338, -5.946593,
3, -2.91286, -5.648802,
3, -3.070338, -5.946593
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
-2, -3.385294, -6.542174, 0, -0.5, 0.5, 0.5,
-2, -3.385294, -6.542174, 1, -0.5, 0.5, 0.5,
-2, -3.385294, -6.542174, 1, 1.5, 0.5, 0.5,
-2, -3.385294, -6.542174, 0, 1.5, 0.5, 0.5,
-1, -3.385294, -6.542174, 0, -0.5, 0.5, 0.5,
-1, -3.385294, -6.542174, 1, -0.5, 0.5, 0.5,
-1, -3.385294, -6.542174, 1, 1.5, 0.5, 0.5,
-1, -3.385294, -6.542174, 0, 1.5, 0.5, 0.5,
0, -3.385294, -6.542174, 0, -0.5, 0.5, 0.5,
0, -3.385294, -6.542174, 1, -0.5, 0.5, 0.5,
0, -3.385294, -6.542174, 1, 1.5, 0.5, 0.5,
0, -3.385294, -6.542174, 0, 1.5, 0.5, 0.5,
1, -3.385294, -6.542174, 0, -0.5, 0.5, 0.5,
1, -3.385294, -6.542174, 1, -0.5, 0.5, 0.5,
1, -3.385294, -6.542174, 1, 1.5, 0.5, 0.5,
1, -3.385294, -6.542174, 0, 1.5, 0.5, 0.5,
2, -3.385294, -6.542174, 0, -0.5, 0.5, 0.5,
2, -3.385294, -6.542174, 1, -0.5, 0.5, 0.5,
2, -3.385294, -6.542174, 1, 1.5, 0.5, 0.5,
2, -3.385294, -6.542174, 0, 1.5, 0.5, 0.5,
3, -3.385294, -6.542174, 0, -0.5, 0.5, 0.5,
3, -3.385294, -6.542174, 1, -0.5, 0.5, 0.5,
3, -3.385294, -6.542174, 1, 1.5, 0.5, 0.5,
3, -3.385294, -6.542174, 0, 1.5, 0.5, 0.5
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
-2.930086, -2, -5.648802,
-2.930086, 3, -5.648802,
-2.930086, -2, -5.648802,
-3.086589, -2, -5.946593,
-2.930086, -1, -5.648802,
-3.086589, -1, -5.946593,
-2.930086, 0, -5.648802,
-3.086589, 0, -5.946593,
-2.930086, 1, -5.648802,
-3.086589, 1, -5.946593,
-2.930086, 2, -5.648802,
-3.086589, 2, -5.946593,
-2.930086, 3, -5.648802,
-3.086589, 3, -5.946593
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
-3.399594, -2, -6.542174, 0, -0.5, 0.5, 0.5,
-3.399594, -2, -6.542174, 1, -0.5, 0.5, 0.5,
-3.399594, -2, -6.542174, 1, 1.5, 0.5, 0.5,
-3.399594, -2, -6.542174, 0, 1.5, 0.5, 0.5,
-3.399594, -1, -6.542174, 0, -0.5, 0.5, 0.5,
-3.399594, -1, -6.542174, 1, -0.5, 0.5, 0.5,
-3.399594, -1, -6.542174, 1, 1.5, 0.5, 0.5,
-3.399594, -1, -6.542174, 0, 1.5, 0.5, 0.5,
-3.399594, 0, -6.542174, 0, -0.5, 0.5, 0.5,
-3.399594, 0, -6.542174, 1, -0.5, 0.5, 0.5,
-3.399594, 0, -6.542174, 1, 1.5, 0.5, 0.5,
-3.399594, 0, -6.542174, 0, 1.5, 0.5, 0.5,
-3.399594, 1, -6.542174, 0, -0.5, 0.5, 0.5,
-3.399594, 1, -6.542174, 1, -0.5, 0.5, 0.5,
-3.399594, 1, -6.542174, 1, 1.5, 0.5, 0.5,
-3.399594, 1, -6.542174, 0, 1.5, 0.5, 0.5,
-3.399594, 2, -6.542174, 0, -0.5, 0.5, 0.5,
-3.399594, 2, -6.542174, 1, -0.5, 0.5, 0.5,
-3.399594, 2, -6.542174, 1, 1.5, 0.5, 0.5,
-3.399594, 2, -6.542174, 0, 1.5, 0.5, 0.5,
-3.399594, 3, -6.542174, 0, -0.5, 0.5, 0.5,
-3.399594, 3, -6.542174, 1, -0.5, 0.5, 0.5,
-3.399594, 3, -6.542174, 1, 1.5, 0.5, 0.5,
-3.399594, 3, -6.542174, 0, 1.5, 0.5, 0.5
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
-2.930086, -2.91286, -4,
-2.930086, -2.91286, 6,
-2.930086, -2.91286, -4,
-3.086589, -3.070338, -4,
-2.930086, -2.91286, -2,
-3.086589, -3.070338, -2,
-2.930086, -2.91286, 0,
-3.086589, -3.070338, 0,
-2.930086, -2.91286, 2,
-3.086589, -3.070338, 2,
-2.930086, -2.91286, 4,
-3.086589, -3.070338, 4,
-2.930086, -2.91286, 6,
-3.086589, -3.070338, 6
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
"4",
"6"
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
-3.399594, -3.385294, -4, 0, -0.5, 0.5, 0.5,
-3.399594, -3.385294, -4, 1, -0.5, 0.5, 0.5,
-3.399594, -3.385294, -4, 1, 1.5, 0.5, 0.5,
-3.399594, -3.385294, -4, 0, 1.5, 0.5, 0.5,
-3.399594, -3.385294, -2, 0, -0.5, 0.5, 0.5,
-3.399594, -3.385294, -2, 1, -0.5, 0.5, 0.5,
-3.399594, -3.385294, -2, 1, 1.5, 0.5, 0.5,
-3.399594, -3.385294, -2, 0, 1.5, 0.5, 0.5,
-3.399594, -3.385294, 0, 0, -0.5, 0.5, 0.5,
-3.399594, -3.385294, 0, 1, -0.5, 0.5, 0.5,
-3.399594, -3.385294, 0, 1, 1.5, 0.5, 0.5,
-3.399594, -3.385294, 0, 0, 1.5, 0.5, 0.5,
-3.399594, -3.385294, 2, 0, -0.5, 0.5, 0.5,
-3.399594, -3.385294, 2, 1, -0.5, 0.5, 0.5,
-3.399594, -3.385294, 2, 1, 1.5, 0.5, 0.5,
-3.399594, -3.385294, 2, 0, 1.5, 0.5, 0.5,
-3.399594, -3.385294, 4, 0, -0.5, 0.5, 0.5,
-3.399594, -3.385294, 4, 1, -0.5, 0.5, 0.5,
-3.399594, -3.385294, 4, 1, 1.5, 0.5, 0.5,
-3.399594, -3.385294, 4, 0, 1.5, 0.5, 0.5,
-3.399594, -3.385294, 6, 0, -0.5, 0.5, 0.5,
-3.399594, -3.385294, 6, 1, -0.5, 0.5, 0.5,
-3.399594, -3.385294, 6, 1, 1.5, 0.5, 0.5,
-3.399594, -3.385294, 6, 0, 1.5, 0.5, 0.5
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
-2.930086, -2.91286, -5.648802,
-2.930086, 3.38625, -5.648802,
-2.930086, -2.91286, 6.262833,
-2.930086, 3.38625, 6.262833,
-2.930086, -2.91286, -5.648802,
-2.930086, -2.91286, 6.262833,
-2.930086, 3.38625, -5.648802,
-2.930086, 3.38625, 6.262833,
-2.930086, -2.91286, -5.648802,
3.330014, -2.91286, -5.648802,
-2.930086, -2.91286, 6.262833,
3.330014, -2.91286, 6.262833,
-2.930086, 3.38625, -5.648802,
3.330014, 3.38625, -5.648802,
-2.930086, 3.38625, 6.262833,
3.330014, 3.38625, 6.262833,
3.330014, -2.91286, -5.648802,
3.330014, 3.38625, -5.648802,
3.330014, -2.91286, 6.262833,
3.330014, 3.38625, 6.262833,
3.330014, -2.91286, -5.648802,
3.330014, -2.91286, 6.262833,
3.330014, 3.38625, -5.648802,
3.330014, 3.38625, 6.262833
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
var radius = 7.933785;
var distance = 35.29831;
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
mvMatrix.translate( -0.1999636, -0.2366948, -0.3070157 );
mvMatrix.scale( 1.370292, 1.361806, 0.72015 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.29831);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
DL-Phosphinothricin<-read.table("DL-Phosphinothricin.xyz")
```

```
## Error in read.table("DL-Phosphinothricin.xyz"): no lines available in input
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
-2.83892, -0.8259296, -1.204921, 0, 0, 1, 1, 1,
-2.698586, -1.571887, -2.393041, 1, 0, 0, 1, 1,
-2.632559, -0.5673813, -1.682072, 1, 0, 0, 1, 1,
-2.487065, 0.7650932, -0.2988061, 1, 0, 0, 1, 1,
-2.461828, 0.8163617, 0.6153641, 1, 0, 0, 1, 1,
-2.452847, -1.29135, -2.16629, 1, 0, 0, 1, 1,
-2.427775, 0.8413312, -1.133759, 0, 0, 0, 1, 1,
-2.423702, -1.484407, -2.507674, 0, 0, 0, 1, 1,
-2.390777, -0.3442435, -0.2366949, 0, 0, 0, 1, 1,
-2.266746, -0.1517321, -3.172839, 0, 0, 0, 1, 1,
-2.251025, 0.01011319, -3.169967, 0, 0, 0, 1, 1,
-2.246375, 1.26065, 0.4952039, 0, 0, 0, 1, 1,
-2.214862, 0.4721033, -1.579979, 0, 0, 0, 1, 1,
-2.202676, -0.003293009, -1.786272, 1, 1, 1, 1, 1,
-2.171138, -0.04285415, -1.750238, 1, 1, 1, 1, 1,
-2.170955, -1.355002, -1.364431, 1, 1, 1, 1, 1,
-2.15918, -1.514968, -1.485022, 1, 1, 1, 1, 1,
-2.156042, 0.4546941, -1.568024, 1, 1, 1, 1, 1,
-2.154313, 0.1141512, -1.006311, 1, 1, 1, 1, 1,
-2.153119, 0.1707839, -0.8758537, 1, 1, 1, 1, 1,
-2.107918, -0.5444519, -1.018857, 1, 1, 1, 1, 1,
-2.059223, 1.779508, -0.3346092, 1, 1, 1, 1, 1,
-2.039172, 0.7057831, -1.540596, 1, 1, 1, 1, 1,
-2.013097, 0.6110904, -2.486679, 1, 1, 1, 1, 1,
-1.981024, 0.1203616, -2.436706, 1, 1, 1, 1, 1,
-1.973661, 1.530607, -1.082728, 1, 1, 1, 1, 1,
-1.967094, 0.6023929, -1.233803, 1, 1, 1, 1, 1,
-1.966038, 1.472707, -2.290606, 1, 1, 1, 1, 1,
-1.929671, 0.7412997, -2.141296, 0, 0, 1, 1, 1,
-1.916349, 0.7481205, -2.315924, 1, 0, 0, 1, 1,
-1.91415, 0.3805228, -0.1333787, 1, 0, 0, 1, 1,
-1.88933, -1.597298, -4.332398, 1, 0, 0, 1, 1,
-1.864656, 0.5417426, -0.1204627, 1, 0, 0, 1, 1,
-1.852092, -0.7758439, -3.433722, 1, 0, 0, 1, 1,
-1.812807, -0.4911099, -3.697698, 0, 0, 0, 1, 1,
-1.811195, -1.384352, -3.001539, 0, 0, 0, 1, 1,
-1.799357, 0.67088, -1.713611, 0, 0, 0, 1, 1,
-1.789386, -1.890329, -1.76918, 0, 0, 0, 1, 1,
-1.769254, -0.4657995, -1.68569, 0, 0, 0, 1, 1,
-1.761855, 1.074965, -1.197594, 0, 0, 0, 1, 1,
-1.734762, -1.325104, -3.207014, 0, 0, 0, 1, 1,
-1.731787, 1.192829, -1.673995, 1, 1, 1, 1, 1,
-1.731211, -0.7500696, -2.776238, 1, 1, 1, 1, 1,
-1.720435, -0.4116059, -2.233304, 1, 1, 1, 1, 1,
-1.714005, 0.2470682, -0.7033996, 1, 1, 1, 1, 1,
-1.696319, 1.063591, -0.2009572, 1, 1, 1, 1, 1,
-1.694476, -0.649873, -2.452589, 1, 1, 1, 1, 1,
-1.694127, 0.3916045, -2.25273, 1, 1, 1, 1, 1,
-1.690771, -0.623043, -3.42283, 1, 1, 1, 1, 1,
-1.688662, 1.017748, -0.5310197, 1, 1, 1, 1, 1,
-1.685699, -0.247772, -1.152662, 1, 1, 1, 1, 1,
-1.682573, 0.557329, -1.405728, 1, 1, 1, 1, 1,
-1.677914, 0.7982458, -0.9183195, 1, 1, 1, 1, 1,
-1.64585, -1.392819, -1.026878, 1, 1, 1, 1, 1,
-1.635088, -0.8148048, -1.091465, 1, 1, 1, 1, 1,
-1.62141, -0.9533933, -2.603321, 1, 1, 1, 1, 1,
-1.597976, 0.2989204, -3.254724, 0, 0, 1, 1, 1,
-1.581957, 1.015396, -0.03535723, 1, 0, 0, 1, 1,
-1.579467, -0.5726717, -1.771038, 1, 0, 0, 1, 1,
-1.568058, 1.040073, -1.73387, 1, 0, 0, 1, 1,
-1.560522, -2.224372, -1.6655, 1, 0, 0, 1, 1,
-1.537759, -1.149354, -3.495105, 1, 0, 0, 1, 1,
-1.535333, 0.7553792, -0.247396, 0, 0, 0, 1, 1,
-1.53526, 1.647584, -0.4165745, 0, 0, 0, 1, 1,
-1.527983, 1.105097, -0.9674498, 0, 0, 0, 1, 1,
-1.52081, -0.6638812, -1.738411, 0, 0, 0, 1, 1,
-1.520285, -0.05454779, -1.156575, 0, 0, 0, 1, 1,
-1.51631, -1.34055, -3.131176, 0, 0, 0, 1, 1,
-1.516203, -0.04990323, -1.701487, 0, 0, 0, 1, 1,
-1.50674, -0.2716396, -1.643057, 1, 1, 1, 1, 1,
-1.484648, 1.574343, -1.844276, 1, 1, 1, 1, 1,
-1.476488, 0.4623576, -1.746079, 1, 1, 1, 1, 1,
-1.475052, -0.1472088, -1.633843, 1, 1, 1, 1, 1,
-1.463411, 0.1419186, -1.609813, 1, 1, 1, 1, 1,
-1.456898, -0.3045672, -2.648332, 1, 1, 1, 1, 1,
-1.45655, -1.451742, -2.679916, 1, 1, 1, 1, 1,
-1.44213, 0.545512, -0.39719, 1, 1, 1, 1, 1,
-1.437593, 1.498747, -0.2843249, 1, 1, 1, 1, 1,
-1.430251, -0.2044988, -3.101399, 1, 1, 1, 1, 1,
-1.416923, 0.04987115, -1.525431, 1, 1, 1, 1, 1,
-1.416792, -1.020738, -3.108485, 1, 1, 1, 1, 1,
-1.414174, -1.343891, -2.34572, 1, 1, 1, 1, 1,
-1.405596, -1.984717, -2.435552, 1, 1, 1, 1, 1,
-1.400282, 1.068558, -2.134023, 1, 1, 1, 1, 1,
-1.394857, 0.6027673, -2.198427, 0, 0, 1, 1, 1,
-1.392888, 0.6617102, -1.192107, 1, 0, 0, 1, 1,
-1.392599, 0.05922723, -2.654251, 1, 0, 0, 1, 1,
-1.385647, -0.2065797, -2.606745, 1, 0, 0, 1, 1,
-1.381112, 0.5728616, -1.756468, 1, 0, 0, 1, 1,
-1.378602, -0.4402157, -1.781166, 1, 0, 0, 1, 1,
-1.377174, 0.9730839, -1.259327, 0, 0, 0, 1, 1,
-1.374796, -2.056621, -2.531708, 0, 0, 0, 1, 1,
-1.374118, -1.541775, -0.6763847, 0, 0, 0, 1, 1,
-1.373538, -0.1697465, -1.168891, 0, 0, 0, 1, 1,
-1.365201, 0.1950624, 0.1780328, 0, 0, 0, 1, 1,
-1.36457, 0.2171754, -0.6011867, 0, 0, 0, 1, 1,
-1.364337, -0.5308363, -2.874512, 0, 0, 0, 1, 1,
-1.360849, -0.3073169, 0.6975406, 1, 1, 1, 1, 1,
-1.359398, 0.750106, 1.007309, 1, 1, 1, 1, 1,
-1.352648, -1.08293, -0.6874352, 1, 1, 1, 1, 1,
-1.349522, -1.232252, -1.442089, 1, 1, 1, 1, 1,
-1.348541, -1.221402, -2.030498, 1, 1, 1, 1, 1,
-1.337135, 2.518113, -0.4198102, 1, 1, 1, 1, 1,
-1.32481, -1.75577, -1.152324, 1, 1, 1, 1, 1,
-1.323033, 0.02495053, -2.629641, 1, 1, 1, 1, 1,
-1.318616, -1.889151, -3.682507, 1, 1, 1, 1, 1,
-1.309662, -0.6805046, -3.806317, 1, 1, 1, 1, 1,
-1.305782, 0.8165781, 0.1474755, 1, 1, 1, 1, 1,
-1.293658, -1.783774, -4.43921, 1, 1, 1, 1, 1,
-1.290418, 1.578424, -0.4912818, 1, 1, 1, 1, 1,
-1.285991, -0.6899903, -2.31022, 1, 1, 1, 1, 1,
-1.278865, 0.06762983, -0.2425562, 1, 1, 1, 1, 1,
-1.275282, 0.3364117, -0.7862751, 0, 0, 1, 1, 1,
-1.273265, -0.02072073, -0.8892081, 1, 0, 0, 1, 1,
-1.264555, -0.5691203, -2.096724, 1, 0, 0, 1, 1,
-1.260274, 2.470039, -0.9850075, 1, 0, 0, 1, 1,
-1.254556, 1.464714, 0.3262773, 1, 0, 0, 1, 1,
-1.252068, 0.7431688, -0.9690728, 1, 0, 0, 1, 1,
-1.248685, 0.0477858, -0.1805084, 0, 0, 0, 1, 1,
-1.237653, 0.9738473, -0.5916905, 0, 0, 0, 1, 1,
-1.235822, -0.07544494, -2.436241, 0, 0, 0, 1, 1,
-1.229614, -1.697954, -1.755691, 0, 0, 0, 1, 1,
-1.20456, -0.6401019, -2.017751, 0, 0, 0, 1, 1,
-1.189085, -0.8475376, -2.277042, 0, 0, 0, 1, 1,
-1.183392, -0.3675671, -2.91975, 0, 0, 0, 1, 1,
-1.177704, 0.6396528, -0.4545548, 1, 1, 1, 1, 1,
-1.175862, -0.6723963, -2.210538, 1, 1, 1, 1, 1,
-1.169129, 0.3872294, -1.241716, 1, 1, 1, 1, 1,
-1.16308, 0.06329407, -2.161734, 1, 1, 1, 1, 1,
-1.162077, -0.6839565, -1.373046, 1, 1, 1, 1, 1,
-1.160075, -1.776364, -2.444109, 1, 1, 1, 1, 1,
-1.158555, -0.1230881, -0.7562472, 1, 1, 1, 1, 1,
-1.158232, 0.7298412, -0.2793585, 1, 1, 1, 1, 1,
-1.15644, 0.9271289, -1.101006, 1, 1, 1, 1, 1,
-1.153561, 0.1377682, -2.654815, 1, 1, 1, 1, 1,
-1.151465, 0.3458985, 0.6541733, 1, 1, 1, 1, 1,
-1.150941, 0.3471225, -1.860998, 1, 1, 1, 1, 1,
-1.149058, -0.1471853, -1.665426, 1, 1, 1, 1, 1,
-1.147428, -1.168462, -1.733752, 1, 1, 1, 1, 1,
-1.130535, -1.095727, -2.569003, 1, 1, 1, 1, 1,
-1.130415, 0.4715236, -0.2634703, 0, 0, 1, 1, 1,
-1.129125, -0.4972903, -2.15507, 1, 0, 0, 1, 1,
-1.126396, 0.8035141, -1.385695, 1, 0, 0, 1, 1,
-1.117495, -0.9549479, -3.798389, 1, 0, 0, 1, 1,
-1.108295, 0.09573051, -1.083952, 1, 0, 0, 1, 1,
-1.105807, 0.2764171, -1.396329, 1, 0, 0, 1, 1,
-1.094169, -0.6216499, -1.737266, 0, 0, 0, 1, 1,
-1.094061, -0.6207074, -2.458259, 0, 0, 0, 1, 1,
-1.081329, 0.2939056, -0.4575033, 0, 0, 0, 1, 1,
-1.081285, 1.21099, -3.142756, 0, 0, 0, 1, 1,
-1.080015, 0.8482741, -0.3626256, 0, 0, 0, 1, 1,
-1.07954, 1.537937, -1.803548, 0, 0, 0, 1, 1,
-1.076789, 0.325367, -2.42787, 0, 0, 0, 1, 1,
-1.072132, -1.157334, -2.034809, 1, 1, 1, 1, 1,
-1.061848, -0.3929816, -0.970849, 1, 1, 1, 1, 1,
-1.060306, 2.146074, -0.4668134, 1, 1, 1, 1, 1,
-1.056433, -0.008762047, -0.5218842, 1, 1, 1, 1, 1,
-1.052527, -2.293856, -2.455262, 1, 1, 1, 1, 1,
-1.051203, -0.7111155, -1.495001, 1, 1, 1, 1, 1,
-1.049157, -0.1267109, -0.5746242, 1, 1, 1, 1, 1,
-1.048976, 1.652765, 0.6323977, 1, 1, 1, 1, 1,
-1.045941, -0.4957714, -3.129056, 1, 1, 1, 1, 1,
-1.045587, -0.4435975, -2.078494, 1, 1, 1, 1, 1,
-1.039258, -0.6092068, -3.226361, 1, 1, 1, 1, 1,
-1.030361, 3.016436, -1.021363, 1, 1, 1, 1, 1,
-1.017777, 2.101586, -0.1769595, 1, 1, 1, 1, 1,
-1.017671, 0.2081154, 0.0701207, 1, 1, 1, 1, 1,
-1.016534, -0.1308754, -0.8512428, 1, 1, 1, 1, 1,
-1.011917, 0.8099777, -1.67634, 0, 0, 1, 1, 1,
-1.009088, -0.4919522, -0.973433, 1, 0, 0, 1, 1,
-1.007378, -0.2871949, -3.022732, 1, 0, 0, 1, 1,
-1.006924, 0.03831015, -2.016183, 1, 0, 0, 1, 1,
-1.004701, -2.285724, -3.015446, 1, 0, 0, 1, 1,
-1.002292, 0.2282031, -0.976436, 1, 0, 0, 1, 1,
-1.000414, 1.052082, -1.296348, 0, 0, 0, 1, 1,
-0.9984528, -0.2432696, -3.480358, 0, 0, 0, 1, 1,
-0.9974727, -1.201628, -3.190646, 0, 0, 0, 1, 1,
-0.9869417, 1.433071, -0.1587707, 0, 0, 0, 1, 1,
-0.9863778, 2.442588, 1.833983, 0, 0, 0, 1, 1,
-0.9837527, -1.290189, -3.956135, 0, 0, 0, 1, 1,
-0.9797467, -0.9530134, -0.939119, 0, 0, 0, 1, 1,
-0.9673039, 1.798233, -0.5862178, 1, 1, 1, 1, 1,
-0.9620972, -0.6305162, -3.59774, 1, 1, 1, 1, 1,
-0.9618745, -0.6726474, -3.972125, 1, 1, 1, 1, 1,
-0.961423, -1.620496, -3.506327, 1, 1, 1, 1, 1,
-0.9607697, 0.6234598, -2.250277, 1, 1, 1, 1, 1,
-0.9558029, -0.9061712, -2.470233, 1, 1, 1, 1, 1,
-0.9528233, -1.460624, -2.675696, 1, 1, 1, 1, 1,
-0.9506778, 1.072582, -0.02367228, 1, 1, 1, 1, 1,
-0.948391, 1.220971, -0.3973418, 1, 1, 1, 1, 1,
-0.9370149, -1.143007, -3.28013, 1, 1, 1, 1, 1,
-0.9231284, 0.372715, -1.665345, 1, 1, 1, 1, 1,
-0.9214839, -0.8581825, -0.7154084, 1, 1, 1, 1, 1,
-0.9167654, -1.114633, -0.5483487, 1, 1, 1, 1, 1,
-0.9150407, 2.944146, -0.7073663, 1, 1, 1, 1, 1,
-0.9133445, 0.8908623, -2.152126, 1, 1, 1, 1, 1,
-0.9128799, -1.54679, -3.228557, 0, 0, 1, 1, 1,
-0.910342, -0.9188985, -2.549288, 1, 0, 0, 1, 1,
-0.9016033, 0.4657525, -2.163426, 1, 0, 0, 1, 1,
-0.9003747, -0.2029433, -3.59698, 1, 0, 0, 1, 1,
-0.8984852, 0.3256033, -0.8070089, 1, 0, 0, 1, 1,
-0.8972467, 1.772013, -0.521744, 1, 0, 0, 1, 1,
-0.8938336, -1.431616, -2.948632, 0, 0, 0, 1, 1,
-0.8935924, -0.4253452, -2.061598, 0, 0, 0, 1, 1,
-0.8905894, -1.423258, -2.179828, 0, 0, 0, 1, 1,
-0.8897356, -1.203535, -2.851734, 0, 0, 0, 1, 1,
-0.8885816, 2.122778, -0.4140066, 0, 0, 0, 1, 1,
-0.8770518, -1.787092, -3.082989, 0, 0, 0, 1, 1,
-0.8764097, -0.1404173, -2.632064, 0, 0, 0, 1, 1,
-0.8722334, -1.036192, -2.866126, 1, 1, 1, 1, 1,
-0.8692723, -0.2959486, -1.391863, 1, 1, 1, 1, 1,
-0.8684689, 0.1063431, -1.2153, 1, 1, 1, 1, 1,
-0.8492216, 0.4009442, -0.4864631, 1, 1, 1, 1, 1,
-0.8478636, 1.006185, -1.730754, 1, 1, 1, 1, 1,
-0.844304, -0.3366894, -5.475331, 1, 1, 1, 1, 1,
-0.8415472, -0.3471767, -1.46249, 1, 1, 1, 1, 1,
-0.8275014, -1.052017, -0.8570473, 1, 1, 1, 1, 1,
-0.8199032, -1.039252, -1.533703, 1, 1, 1, 1, 1,
-0.818647, 0.9678409, -0.5209049, 1, 1, 1, 1, 1,
-0.8165456, -0.340774, -2.479226, 1, 1, 1, 1, 1,
-0.8131481, 2.007297, 0.1614832, 1, 1, 1, 1, 1,
-0.8120509, -0.06723193, -1.558489, 1, 1, 1, 1, 1,
-0.8111862, -0.1811518, -1.04204, 1, 1, 1, 1, 1,
-0.8072745, -1.310365, -0.9278997, 1, 1, 1, 1, 1,
-0.8068315, -1.208182, -2.109087, 0, 0, 1, 1, 1,
-0.8021484, 0.8457323, -0.6345363, 1, 0, 0, 1, 1,
-0.8021337, -0.4086859, -2.537085, 1, 0, 0, 1, 1,
-0.7992135, 2.368793, 0.6430924, 1, 0, 0, 1, 1,
-0.7991912, 0.9959641, -0.6370937, 1, 0, 0, 1, 1,
-0.7906937, -0.7276886, -3.632849, 1, 0, 0, 1, 1,
-0.7892098, -0.484685, -1.697779, 0, 0, 0, 1, 1,
-0.7858552, -1.605468, -0.2182361, 0, 0, 0, 1, 1,
-0.782683, 0.3017667, 0.03373339, 0, 0, 0, 1, 1,
-0.7755476, 0.01110039, -1.709114, 0, 0, 0, 1, 1,
-0.7749743, 0.3731974, -0.2102655, 0, 0, 0, 1, 1,
-0.7738218, -1.990092, -2.16224, 0, 0, 0, 1, 1,
-0.761224, 1.127142, -0.2207299, 0, 0, 0, 1, 1,
-0.7562401, -1.699215, -2.617857, 1, 1, 1, 1, 1,
-0.7562153, -1.951237, -2.034222, 1, 1, 1, 1, 1,
-0.7532765, -0.3498749, -2.525433, 1, 1, 1, 1, 1,
-0.749835, -0.2756722, -2.660577, 1, 1, 1, 1, 1,
-0.7430567, -1.013656, -1.712536, 1, 1, 1, 1, 1,
-0.7428282, 1.357225, -0.3359157, 1, 1, 1, 1, 1,
-0.7381458, 1.53987, -1.096954, 1, 1, 1, 1, 1,
-0.7336003, -1.421302, -4.294794, 1, 1, 1, 1, 1,
-0.7310402, 0.07511751, -0.1174486, 1, 1, 1, 1, 1,
-0.729439, -0.8398247, -3.418667, 1, 1, 1, 1, 1,
-0.7202045, -1.417177, -4.660493, 1, 1, 1, 1, 1,
-0.7125247, -0.7916464, -3.026632, 1, 1, 1, 1, 1,
-0.7095399, -0.1918216, -2.428559, 1, 1, 1, 1, 1,
-0.7085569, 0.484793, -0.03294394, 1, 1, 1, 1, 1,
-0.7069587, -0.4118374, -3.094613, 1, 1, 1, 1, 1,
-0.7056759, -0.1814876, -4.315337, 0, 0, 1, 1, 1,
-0.7021255, -0.6242748, -2.794353, 1, 0, 0, 1, 1,
-0.6951719, 1.569774, -0.4692432, 1, 0, 0, 1, 1,
-0.6800684, -1.779048, -1.807352, 1, 0, 0, 1, 1,
-0.6793139, -1.578785, -2.775153, 1, 0, 0, 1, 1,
-0.67586, -1.753419, -3.030647, 1, 0, 0, 1, 1,
-0.6755299, -1.087066, -2.058477, 0, 0, 0, 1, 1,
-0.6741251, -0.6941782, -3.58931, 0, 0, 0, 1, 1,
-0.6714574, -0.1054402, -1.147845, 0, 0, 0, 1, 1,
-0.6662791, 0.7228473, -0.7164694, 0, 0, 0, 1, 1,
-0.6658077, 0.1758281, -2.849099, 0, 0, 0, 1, 1,
-0.665236, -0.08140805, -1.072441, 0, 0, 0, 1, 1,
-0.664609, 0.06450514, -0.2903205, 0, 0, 0, 1, 1,
-0.6634876, -0.2935862, -0.7231358, 1, 1, 1, 1, 1,
-0.6629397, -1.75073, -2.59672, 1, 1, 1, 1, 1,
-0.6617748, 0.7390823, -0.2376153, 1, 1, 1, 1, 1,
-0.6612907, 0.9217206, -1.89383, 1, 1, 1, 1, 1,
-0.6601645, 1.201047, -0.4060894, 1, 1, 1, 1, 1,
-0.6500364, -0.6337989, -2.555201, 1, 1, 1, 1, 1,
-0.635514, -0.3201556, -0.8972197, 1, 1, 1, 1, 1,
-0.6353587, -0.1716294, -1.639425, 1, 1, 1, 1, 1,
-0.6335885, 0.4534998, -1.037706, 1, 1, 1, 1, 1,
-0.6309224, -0.5901728, -2.285031, 1, 1, 1, 1, 1,
-0.6308482, -2.161951, -1.763698, 1, 1, 1, 1, 1,
-0.6271194, 0.5550866, 0.471008, 1, 1, 1, 1, 1,
-0.6251941, -0.2644277, -2.029615, 1, 1, 1, 1, 1,
-0.6220419, -0.4225556, -2.952239, 1, 1, 1, 1, 1,
-0.6216541, 1.736464, -1.011005, 1, 1, 1, 1, 1,
-0.6156866, 0.08216063, -3.260096, 0, 0, 1, 1, 1,
-0.6082665, -0.8747838, -3.108102, 1, 0, 0, 1, 1,
-0.6072016, -0.2453958, -2.485836, 1, 0, 0, 1, 1,
-0.6050764, 1.534873, 2.425054, 1, 0, 0, 1, 1,
-0.5992253, -0.1526768, -1.905279, 1, 0, 0, 1, 1,
-0.5982422, -0.1626131, -0.494682, 1, 0, 0, 1, 1,
-0.5971921, 1.015676, 1.338823, 0, 0, 0, 1, 1,
-0.5955482, -1.336153, -2.008055, 0, 0, 0, 1, 1,
-0.5913202, -1.350376, -1.891747, 0, 0, 0, 1, 1,
-0.589636, -1.139484, -0.5115701, 0, 0, 0, 1, 1,
-0.5885434, 1.114821, -0.931159, 0, 0, 0, 1, 1,
-0.578623, 0.8791868, 0.5747117, 0, 0, 0, 1, 1,
-0.5735226, 0.6938198, -1.798103, 0, 0, 0, 1, 1,
-0.5716474, 1.781921, -0.8931836, 1, 1, 1, 1, 1,
-0.5714021, -1.520711, -2.636564, 1, 1, 1, 1, 1,
-0.5688919, 0.902878, 0.6837562, 1, 1, 1, 1, 1,
-0.5671759, -2.038127, -1.634017, 1, 1, 1, 1, 1,
-0.566054, 1.430882, 0.4620298, 1, 1, 1, 1, 1,
-0.5615596, 0.04756361, 0.07616452, 1, 1, 1, 1, 1,
-0.5608556, 1.792711, -1.750885, 1, 1, 1, 1, 1,
-0.5607721, 0.08784483, -1.707296, 1, 1, 1, 1, 1,
-0.5474092, -1.587067, -2.31801, 1, 1, 1, 1, 1,
-0.5465981, -0.9777319, -1.928551, 1, 1, 1, 1, 1,
-0.5411268, 0.3944488, -2.443331, 1, 1, 1, 1, 1,
-0.5387558, -2.17538, -2.229619, 1, 1, 1, 1, 1,
-0.5284688, 0.08801919, -1.976098, 1, 1, 1, 1, 1,
-0.525678, 0.3144481, -2.371437, 1, 1, 1, 1, 1,
-0.5233256, 0.5230267, -1.787681, 1, 1, 1, 1, 1,
-0.519865, 0.4253352, -0.8906231, 0, 0, 1, 1, 1,
-0.5148321, 1.591241, 0.5980939, 1, 0, 0, 1, 1,
-0.513515, -0.08248122, -3.082296, 1, 0, 0, 1, 1,
-0.5111624, 1.389539, -0.6798709, 1, 0, 0, 1, 1,
-0.5107723, 0.9021341, -0.4952509, 1, 0, 0, 1, 1,
-0.5069666, -0.8613729, -2.053146, 1, 0, 0, 1, 1,
-0.5029325, 1.216698, -1.263675, 0, 0, 0, 1, 1,
-0.5014266, -0.6054399, -2.744256, 0, 0, 0, 1, 1,
-0.5012938, 2.877903, 1.8197, 0, 0, 0, 1, 1,
-0.5006354, 0.711316, 0.5930685, 0, 0, 0, 1, 1,
-0.4968772, -0.890727, -3.480582, 0, 0, 0, 1, 1,
-0.4932529, 0.5021319, -0.8110078, 0, 0, 0, 1, 1,
-0.4892201, 0.3221205, -1.057569, 0, 0, 0, 1, 1,
-0.488575, -0.5989426, -1.919899, 1, 1, 1, 1, 1,
-0.4880511, -0.4013146, -3.016328, 1, 1, 1, 1, 1,
-0.4876949, -0.4457332, -3.115673, 1, 1, 1, 1, 1,
-0.4867448, 0.3868262, 0.6253532, 1, 1, 1, 1, 1,
-0.4846979, 0.8426974, -2.280016, 1, 1, 1, 1, 1,
-0.48091, 1.249106, 0.6991069, 1, 1, 1, 1, 1,
-0.4775868, -0.1251431, -0.3223288, 1, 1, 1, 1, 1,
-0.4714914, 0.009904085, -1.52168, 1, 1, 1, 1, 1,
-0.4710395, -1.002216, -3.007298, 1, 1, 1, 1, 1,
-0.469696, -1.139805, -1.152543, 1, 1, 1, 1, 1,
-0.4674489, -0.933917, -3.000326, 1, 1, 1, 1, 1,
-0.4674176, 0.7471713, -1.25152, 1, 1, 1, 1, 1,
-0.4664582, 0.9906572, -0.1859076, 1, 1, 1, 1, 1,
-0.4659225, 0.2323818, -2.64599, 1, 1, 1, 1, 1,
-0.4658422, -0.6539919, -3.265344, 1, 1, 1, 1, 1,
-0.4592575, 0.4676137, 0.1748742, 0, 0, 1, 1, 1,
-0.4571292, -0.9575086, -3.856954, 1, 0, 0, 1, 1,
-0.4567665, -2.276185, -3.664787, 1, 0, 0, 1, 1,
-0.4560312, 0.1126433, -1.796616, 1, 0, 0, 1, 1,
-0.4556125, 1.713283, -2.477323, 1, 0, 0, 1, 1,
-0.4511978, -0.6785247, -2.782787, 1, 0, 0, 1, 1,
-0.449856, -1.491092, -4.851375, 0, 0, 0, 1, 1,
-0.4496974, 1.627859, -0.5164373, 0, 0, 0, 1, 1,
-0.4462644, 0.6660006, -1.401505, 0, 0, 0, 1, 1,
-0.4448509, 0.6022761, -0.8769784, 0, 0, 0, 1, 1,
-0.4446625, 0.5998799, -0.0442066, 0, 0, 0, 1, 1,
-0.4390975, 0.2675395, -0.5514492, 0, 0, 0, 1, 1,
-0.4377127, 0.614475, -0.9711898, 0, 0, 0, 1, 1,
-0.4346221, -1.265959, -2.56861, 1, 1, 1, 1, 1,
-0.4298652, -0.1112869, -2.197075, 1, 1, 1, 1, 1,
-0.4250203, -0.3419552, -1.092787, 1, 1, 1, 1, 1,
-0.4168235, 0.6233426, -0.2845205, 1, 1, 1, 1, 1,
-0.4147152, -0.2263802, -2.929445, 1, 1, 1, 1, 1,
-0.4147068, -1.18407, -3.800621, 1, 1, 1, 1, 1,
-0.4106279, -0.01394332, -0.9306142, 1, 1, 1, 1, 1,
-0.4089553, -0.9984182, -2.798677, 1, 1, 1, 1, 1,
-0.4052097, 0.01762776, -1.048688, 1, 1, 1, 1, 1,
-0.4044588, 1.294991, -0.384442, 1, 1, 1, 1, 1,
-0.403233, 0.5456002, -0.9289339, 1, 1, 1, 1, 1,
-0.3998092, 0.4672543, -1.713969, 1, 1, 1, 1, 1,
-0.3985686, -0.7299176, -1.026761, 1, 1, 1, 1, 1,
-0.3974416, -1.853634, -4.187551, 1, 1, 1, 1, 1,
-0.3972526, 0.3459516, -1.751106, 1, 1, 1, 1, 1,
-0.3962819, 0.8651001, 0.555201, 0, 0, 1, 1, 1,
-0.3950687, -0.4624343, -3.69678, 1, 0, 0, 1, 1,
-0.3949305, 0.7036447, -1.406564, 1, 0, 0, 1, 1,
-0.3949245, -0.7949209, -3.559729, 1, 0, 0, 1, 1,
-0.3894884, -1.885868, -2.987451, 1, 0, 0, 1, 1,
-0.3892974, -0.4843671, -2.310103, 1, 0, 0, 1, 1,
-0.3856245, -0.6985703, -3.028551, 0, 0, 0, 1, 1,
-0.3846762, -1.796317, -1.096935, 0, 0, 0, 1, 1,
-0.3800763, -0.4445224, -1.945372, 0, 0, 0, 1, 1,
-0.3788246, -0.4421096, -1.924145, 0, 0, 0, 1, 1,
-0.3760216, 0.9142339, -0.332533, 0, 0, 0, 1, 1,
-0.3722985, -0.3888594, -3.267347, 0, 0, 0, 1, 1,
-0.3706443, -0.4152886, -3.449208, 0, 0, 0, 1, 1,
-0.3689305, 0.5648637, -0.272001, 1, 1, 1, 1, 1,
-0.3671006, 1.007083, 0.4536066, 1, 1, 1, 1, 1,
-0.3669945, 0.3122037, -0.872196, 1, 1, 1, 1, 1,
-0.3667608, 1.207163, 0.9222256, 1, 1, 1, 1, 1,
-0.3522516, -0.8314493, -1.954958, 1, 1, 1, 1, 1,
-0.3504332, -0.6416507, -4.008175, 1, 1, 1, 1, 1,
-0.3487302, -0.9058875, -5.31577, 1, 1, 1, 1, 1,
-0.3404731, 0.7360963, -3.405228, 1, 1, 1, 1, 1,
-0.340165, -0.7768481, -1.614258, 1, 1, 1, 1, 1,
-0.3393996, -0.1012111, -1.592252, 1, 1, 1, 1, 1,
-0.3320234, -0.2915341, -2.170032, 1, 1, 1, 1, 1,
-0.3290354, 1.789186, 1.259245, 1, 1, 1, 1, 1,
-0.3277929, -0.3662494, -1.977814, 1, 1, 1, 1, 1,
-0.3254613, -0.462734, -2.338806, 1, 1, 1, 1, 1,
-0.3237217, -0.4459612, -2.644256, 1, 1, 1, 1, 1,
-0.3237017, -0.1547972, -4.188975, 0, 0, 1, 1, 1,
-0.3208999, -1.659479, -4.232301, 1, 0, 0, 1, 1,
-0.3206637, -0.4788159, -2.990307, 1, 0, 0, 1, 1,
-0.3115725, 1.039336, 0.3114154, 1, 0, 0, 1, 1,
-0.3096458, -0.6018451, -2.429447, 1, 0, 0, 1, 1,
-0.3069261, -1.379652, -2.852755, 1, 0, 0, 1, 1,
-0.3057783, -1.355798, -2.583816, 0, 0, 0, 1, 1,
-0.3056779, -0.5857794, -1.536905, 0, 0, 0, 1, 1,
-0.3030531, 0.09684724, -1.833044, 0, 0, 0, 1, 1,
-0.3001407, 0.4676362, -1.120781, 0, 0, 0, 1, 1,
-0.2908891, -0.1777805, -1.807107, 0, 0, 0, 1, 1,
-0.2901899, 0.810427, 0.02841856, 0, 0, 0, 1, 1,
-0.2878692, -0.7820051, -2.466532, 0, 0, 0, 1, 1,
-0.2871574, -0.1883438, -2.893005, 1, 1, 1, 1, 1,
-0.2866905, -0.9902416, -1.718998, 1, 1, 1, 1, 1,
-0.2819313, -0.2806651, -2.842901, 1, 1, 1, 1, 1,
-0.2788733, -0.3058002, -1.836385, 1, 1, 1, 1, 1,
-0.2739038, -1.284979, -3.293371, 1, 1, 1, 1, 1,
-0.2725856, -1.081643, -2.448411, 1, 1, 1, 1, 1,
-0.2718791, -1.275173, -2.841336, 1, 1, 1, 1, 1,
-0.2716787, 0.9842006, 0.3275136, 1, 1, 1, 1, 1,
-0.2681613, 0.01133223, -3.128713, 1, 1, 1, 1, 1,
-0.2634976, -1.893584, -4.761446, 1, 1, 1, 1, 1,
-0.2516533, -0.4870002, -1.88872, 1, 1, 1, 1, 1,
-0.2503951, 2.852167, 0.1223774, 1, 1, 1, 1, 1,
-0.2499001, 1.698345, -0.8330517, 1, 1, 1, 1, 1,
-0.2490336, 0.05743634, 0.9300336, 1, 1, 1, 1, 1,
-0.2469255, 0.5990774, 0.7720405, 1, 1, 1, 1, 1,
-0.2462771, 0.5512449, 0.5928723, 0, 0, 1, 1, 1,
-0.2450125, 0.08826808, -1.575414, 1, 0, 0, 1, 1,
-0.2442798, -0.2917622, -2.63642, 1, 0, 0, 1, 1,
-0.2441533, -1.422372, -2.728681, 1, 0, 0, 1, 1,
-0.2421088, 0.2765711, 0.3021424, 1, 0, 0, 1, 1,
-0.2407364, -0.3565748, -2.028008, 1, 0, 0, 1, 1,
-0.2399368, -0.773918, -1.708877, 0, 0, 0, 1, 1,
-0.2397114, -0.4733054, -2.670332, 0, 0, 0, 1, 1,
-0.2333363, 0.4084011, -0.4368292, 0, 0, 0, 1, 1,
-0.22956, 0.4220915, -1.196008, 0, 0, 0, 1, 1,
-0.2288211, 1.723267, 1.916897, 0, 0, 0, 1, 1,
-0.2283015, 1.337183, 0.7595161, 0, 0, 0, 1, 1,
-0.2275872, -0.8735937, -2.931107, 0, 0, 0, 1, 1,
-0.2267977, -1.683746, -1.329878, 1, 1, 1, 1, 1,
-0.2259558, 0.8721316, -1.675833, 1, 1, 1, 1, 1,
-0.2180551, -0.5754908, -2.211046, 1, 1, 1, 1, 1,
-0.2178101, -1.224672, -0.9561872, 1, 1, 1, 1, 1,
-0.2167658, -0.8740634, -4.07407, 1, 1, 1, 1, 1,
-0.2161483, 2.405234, -1.299178, 1, 1, 1, 1, 1,
-0.2158226, 0.4715999, -0.3984648, 1, 1, 1, 1, 1,
-0.2102472, 0.4091085, 0.5239828, 1, 1, 1, 1, 1,
-0.202692, -1.044368, -3.086682, 1, 1, 1, 1, 1,
-0.2010747, -0.322131, -1.943629, 1, 1, 1, 1, 1,
-0.2003056, -1.485165, -3.930909, 1, 1, 1, 1, 1,
-0.1988382, -0.6129602, -1.575163, 1, 1, 1, 1, 1,
-0.1912642, 0.3795755, -1.444315, 1, 1, 1, 1, 1,
-0.1893967, -0.8300363, -4.283815, 1, 1, 1, 1, 1,
-0.1875634, 0.6455156, -0.3510228, 1, 1, 1, 1, 1,
-0.1837787, 1.606866, -0.323701, 0, 0, 1, 1, 1,
-0.181773, 1.140998, -0.5940682, 1, 0, 0, 1, 1,
-0.1811895, 1.054859, 1.153881, 1, 0, 0, 1, 1,
-0.1762258, 0.1706648, -0.2957594, 1, 0, 0, 1, 1,
-0.1741788, -1.181296, -4.185117, 1, 0, 0, 1, 1,
-0.1741754, -0.08518609, -0.5494688, 1, 0, 0, 1, 1,
-0.1729627, -0.4300237, -2.95742, 0, 0, 0, 1, 1,
-0.1692923, -0.4402447, -2.793318, 0, 0, 0, 1, 1,
-0.1673007, -0.08164931, -2.975751, 0, 0, 0, 1, 1,
-0.1667054, -0.3287831, -1.499771, 0, 0, 0, 1, 1,
-0.1657674, -0.8873806, -2.600327, 0, 0, 0, 1, 1,
-0.1617956, -0.732884, -2.232733, 0, 0, 0, 1, 1,
-0.159247, 0.05665325, -0.6374983, 0, 0, 0, 1, 1,
-0.152954, -0.03917747, -2.560153, 1, 1, 1, 1, 1,
-0.1526824, 0.08705625, -0.4614187, 1, 1, 1, 1, 1,
-0.1446782, -0.3863509, -2.554368, 1, 1, 1, 1, 1,
-0.1440405, 0.119871, -1.797675, 1, 1, 1, 1, 1,
-0.1439346, -0.2357425, -1.410426, 1, 1, 1, 1, 1,
-0.1433679, 0.9837828, -1.55234, 1, 1, 1, 1, 1,
-0.1430136, 0.4280436, 0.7546939, 1, 1, 1, 1, 1,
-0.1370082, -0.2773733, -3.293208, 1, 1, 1, 1, 1,
-0.1316548, -0.6889734, -3.397419, 1, 1, 1, 1, 1,
-0.1296852, -0.6112829, 0.2081303, 1, 1, 1, 1, 1,
-0.1266326, -0.2023588, -2.650302, 1, 1, 1, 1, 1,
-0.1237897, 1.127933, 1.191582, 1, 1, 1, 1, 1,
-0.1222484, -0.5833984, -2.182256, 1, 1, 1, 1, 1,
-0.1184915, -0.6179791, -2.932892, 1, 1, 1, 1, 1,
-0.1168163, -0.5153015, -1.066343, 1, 1, 1, 1, 1,
-0.1161563, 0.07886188, 0.1318101, 0, 0, 1, 1, 1,
-0.1072463, 0.000828434, -1.245536, 1, 0, 0, 1, 1,
-0.106494, 0.6301968, 0.8764988, 1, 0, 0, 1, 1,
-0.1019791, -0.5821233, -3.296669, 1, 0, 0, 1, 1,
-0.09705883, 1.626607, 1.505583, 1, 0, 0, 1, 1,
-0.09446257, 1.105891, -1.274754, 1, 0, 0, 1, 1,
-0.09357653, 1.45105, 0.8607987, 0, 0, 0, 1, 1,
-0.09258342, -1.217698, -1.762883, 0, 0, 0, 1, 1,
-0.09154534, 1.042512, 1.59305, 0, 0, 0, 1, 1,
-0.08830318, -0.6103846, -3.937123, 0, 0, 0, 1, 1,
-0.08706587, 1.169958, 0.652049, 0, 0, 0, 1, 1,
-0.08670598, 0.9992993, -1.405657, 0, 0, 0, 1, 1,
-0.08602525, -0.1567473, -4.574144, 0, 0, 0, 1, 1,
-0.08571729, 3.042688, -1.330149, 1, 1, 1, 1, 1,
-0.0817289, 1.187662, -0.8204029, 1, 1, 1, 1, 1,
-0.07289537, 1.099164, -1.068891, 1, 1, 1, 1, 1,
-0.06939298, 0.8627828, -2.158897, 1, 1, 1, 1, 1,
-0.06394923, 0.1950165, -0.3915593, 1, 1, 1, 1, 1,
-0.06335624, 0.4920197, -0.1096579, 1, 1, 1, 1, 1,
-0.05987414, -1.730563, -3.455736, 1, 1, 1, 1, 1,
-0.05889957, -1.161268, -2.778152, 1, 1, 1, 1, 1,
-0.0580855, -1.054597, -3.614677, 1, 1, 1, 1, 1,
-0.05801543, 0.4658618, -0.2238518, 1, 1, 1, 1, 1,
-0.05742622, -1.272947, -1.881701, 1, 1, 1, 1, 1,
-0.05732258, 0.1870003, 0.649442, 1, 1, 1, 1, 1,
-0.05208165, -0.06861424, -4.391441, 1, 1, 1, 1, 1,
-0.05018477, 1.141534, -0.2682185, 1, 1, 1, 1, 1,
-0.04679739, 0.6516352, 0.3837814, 1, 1, 1, 1, 1,
-0.04480505, -0.02327739, -1.392159, 0, 0, 1, 1, 1,
-0.04413285, -0.01124772, -2.248374, 1, 0, 0, 1, 1,
-0.04022387, 1.971456, -0.5839379, 1, 0, 0, 1, 1,
-0.03932959, 0.5663499, 1.374157, 1, 0, 0, 1, 1,
-0.03872351, -1.434813, -4.09269, 1, 0, 0, 1, 1,
-0.03313483, 0.08402074, -0.01209245, 1, 0, 0, 1, 1,
-0.03110712, -1.87831, -3.211426, 0, 0, 0, 1, 1,
-0.0242258, -0.2892824, -1.2327, 0, 0, 0, 1, 1,
-0.01394969, 1.346439, -0.0101611, 0, 0, 0, 1, 1,
-0.004872114, 1.21878, 0.8348618, 0, 0, 0, 1, 1,
-0.001479761, 0.6114635, 0.6790698, 0, 0, 0, 1, 1,
-0.001042214, 0.6942027, -1.255908, 0, 0, 0, 1, 1,
0.005345846, -0.79248, 1.410688, 0, 0, 0, 1, 1,
0.01099798, -0.667056, 2.883246, 1, 1, 1, 1, 1,
0.01288008, 1.942594, -1.058705, 1, 1, 1, 1, 1,
0.01375088, 1.836255, -1.012315, 1, 1, 1, 1, 1,
0.01558438, -0.03767549, 4.706569, 1, 1, 1, 1, 1,
0.01586834, 0.7221312, -0.8173915, 1, 1, 1, 1, 1,
0.01900431, -0.6664099, 1.929094, 1, 1, 1, 1, 1,
0.02251397, 0.747849, 0.01701931, 1, 1, 1, 1, 1,
0.02357898, -0.5491797, 2.917896, 1, 1, 1, 1, 1,
0.0260757, 0.1341117, -0.5781506, 1, 1, 1, 1, 1,
0.03004193, 0.8472793, 1.052935, 1, 1, 1, 1, 1,
0.04450514, -0.3421584, 2.645133, 1, 1, 1, 1, 1,
0.04451175, 0.6528956, -0.8445019, 1, 1, 1, 1, 1,
0.04965182, 2.344589, -0.8803784, 1, 1, 1, 1, 1,
0.05058166, -1.531299, 3.650386, 1, 1, 1, 1, 1,
0.05080967, -0.6147931, 3.409839, 1, 1, 1, 1, 1,
0.05162035, -0.1168544, 0.5541893, 0, 0, 1, 1, 1,
0.0567145, -0.4032883, 3.815766, 1, 0, 0, 1, 1,
0.05851686, 1.114609, -1.100811, 1, 0, 0, 1, 1,
0.06481273, -0.06747799, 1.779688, 1, 0, 0, 1, 1,
0.08016884, -0.4754625, 3.349586, 1, 0, 0, 1, 1,
0.08150592, -1.048828, 4.293071, 1, 0, 0, 1, 1,
0.08427808, 0.8281588, 0.7496182, 0, 0, 0, 1, 1,
0.08597072, -0.7952135, 2.942533, 0, 0, 0, 1, 1,
0.08833796, -1.633721, 3.144119, 0, 0, 0, 1, 1,
0.09143221, 0.02306067, 0.6271722, 0, 0, 0, 1, 1,
0.09338365, 0.014488, -0.5158156, 0, 0, 0, 1, 1,
0.09379017, 1.344701, 0.7897997, 0, 0, 0, 1, 1,
0.09427924, 0.8479422, 0.09346154, 0, 0, 0, 1, 1,
0.09445632, 1.428765, 0.2245189, 1, 1, 1, 1, 1,
0.0949383, 1.397106, 0.9564781, 1, 1, 1, 1, 1,
0.09917166, -0.2339815, 3.476531, 1, 1, 1, 1, 1,
0.1019565, -0.8649224, 2.717228, 1, 1, 1, 1, 1,
0.1071002, -1.072415, 4.431277, 1, 1, 1, 1, 1,
0.1093847, 0.2927798, 0.945253, 1, 1, 1, 1, 1,
0.1131355, 1.241454, 0.05638246, 1, 1, 1, 1, 1,
0.1150665, 1.156775, 0.3215724, 1, 1, 1, 1, 1,
0.1150921, -0.1952669, 2.744176, 1, 1, 1, 1, 1,
0.1200456, -0.2498714, 2.059088, 1, 1, 1, 1, 1,
0.1201314, -1.08847, 4.42183, 1, 1, 1, 1, 1,
0.1273187, 1.278151, 0.2153203, 1, 1, 1, 1, 1,
0.1302216, -0.6788098, 1.998087, 1, 1, 1, 1, 1,
0.1341336, -2.76044, 3.548133, 1, 1, 1, 1, 1,
0.1342253, -0.07835754, 2.08501, 1, 1, 1, 1, 1,
0.1346717, -1.04241, 2.779169, 0, 0, 1, 1, 1,
0.1402937, 1.736406, 1.551685, 1, 0, 0, 1, 1,
0.1403257, -0.1565399, 2.465799, 1, 0, 0, 1, 1,
0.1408509, -0.3469099, 2.105246, 1, 0, 0, 1, 1,
0.1410162, 0.8115773, 0.8835473, 1, 0, 0, 1, 1,
0.1431987, -2.821126, 3.343467, 1, 0, 0, 1, 1,
0.1465795, 1.216854, 1.249898, 0, 0, 0, 1, 1,
0.1553814, -0.5699924, 2.877095, 0, 0, 0, 1, 1,
0.156907, -0.1948725, 2.88462, 0, 0, 0, 1, 1,
0.160001, 1.635654, 0.4006121, 0, 0, 0, 1, 1,
0.1677298, 0.9124581, 0.167835, 0, 0, 0, 1, 1,
0.1703336, 1.091931, -0.2693397, 0, 0, 0, 1, 1,
0.1800349, -1.124721, 3.536846, 0, 0, 0, 1, 1,
0.1814763, 0.2039448, 0.9970986, 1, 1, 1, 1, 1,
0.1819275, 1.512694, 1.100376, 1, 1, 1, 1, 1,
0.1819525, 0.5953134, 1.614426, 1, 1, 1, 1, 1,
0.1830026, -0.6590781, 2.739408, 1, 1, 1, 1, 1,
0.1831988, -0.2597648, 1.211883, 1, 1, 1, 1, 1,
0.1845291, -0.7408592, 0.2821362, 1, 1, 1, 1, 1,
0.1900412, -0.4687427, 1.930619, 1, 1, 1, 1, 1,
0.1921133, 1.963569, -0.9890257, 1, 1, 1, 1, 1,
0.194026, 0.570514, -0.4187503, 1, 1, 1, 1, 1,
0.197284, 0.01849547, 1.207345, 1, 1, 1, 1, 1,
0.1980581, 0.4196776, 0.3136287, 1, 1, 1, 1, 1,
0.1983475, 0.456117, 0.755064, 1, 1, 1, 1, 1,
0.2005096, 0.142545, -0.9194177, 1, 1, 1, 1, 1,
0.202436, 0.9882634, -0.176068, 1, 1, 1, 1, 1,
0.2044682, -1.837359, 2.657778, 1, 1, 1, 1, 1,
0.2063873, -0.3938572, 3.419773, 0, 0, 1, 1, 1,
0.2074823, -1.082018, 2.615684, 1, 0, 0, 1, 1,
0.207506, 0.5594202, -0.2663135, 1, 0, 0, 1, 1,
0.2078375, 0.3466265, 0.670536, 1, 0, 0, 1, 1,
0.2081603, -0.9303348, 3.572324, 1, 0, 0, 1, 1,
0.2121485, 0.9669975, -0.04248958, 1, 0, 0, 1, 1,
0.2136465, 0.6486038, 1.101344, 0, 0, 0, 1, 1,
0.2181107, -0.610851, 4.843631, 0, 0, 0, 1, 1,
0.2241344, 0.5295909, -1.884987, 0, 0, 0, 1, 1,
0.2306649, -0.138482, 2.042518, 0, 0, 0, 1, 1,
0.2446651, 0.4560845, -0.06641807, 0, 0, 0, 1, 1,
0.247536, 1.076309, 0.9439034, 0, 0, 0, 1, 1,
0.2495321, -0.2230401, 0.9321964, 0, 0, 0, 1, 1,
0.2508652, 0.7589399, -0.9287874, 1, 1, 1, 1, 1,
0.250924, 0.9929754, 0.03837298, 1, 1, 1, 1, 1,
0.2510568, -1.117393, 0.6406642, 1, 1, 1, 1, 1,
0.2545577, 1.756014, -1.158667, 1, 1, 1, 1, 1,
0.2615082, 0.2333632, 2.799029, 1, 1, 1, 1, 1,
0.2627621, 1.129395, 2.19203, 1, 1, 1, 1, 1,
0.2685015, -1.26303, 3.173161, 1, 1, 1, 1, 1,
0.270453, -0.3687745, -0.3579428, 1, 1, 1, 1, 1,
0.2709811, 0.2072924, 1.458784, 1, 1, 1, 1, 1,
0.271925, -1.567014, 0.2422554, 1, 1, 1, 1, 1,
0.2722266, -0.7723427, 4.036514, 1, 1, 1, 1, 1,
0.2742969, 0.04278361, 0.9926326, 1, 1, 1, 1, 1,
0.2840941, -0.3619012, 2.425807, 1, 1, 1, 1, 1,
0.2908452, 0.4951483, -1.26813, 1, 1, 1, 1, 1,
0.2952544, -0.5188035, 3.61151, 1, 1, 1, 1, 1,
0.2954518, -0.8870368, 2.701026, 0, 0, 1, 1, 1,
0.2964673, -0.974619, 2.50792, 1, 0, 0, 1, 1,
0.301998, -1.598292, 3.889403, 1, 0, 0, 1, 1,
0.3038879, 2.070667, 0.5805978, 1, 0, 0, 1, 1,
0.3065511, -0.2943872, 3.036226, 1, 0, 0, 1, 1,
0.3077267, -2.161033, 3.599087, 1, 0, 0, 1, 1,
0.3078575, -0.3040589, 2.79699, 0, 0, 0, 1, 1,
0.3202941, -0.1594622, 0.7651452, 0, 0, 0, 1, 1,
0.3211578, 0.4026241, -0.3835143, 0, 0, 0, 1, 1,
0.3283945, 0.721377, -0.3482957, 0, 0, 0, 1, 1,
0.3290433, 0.3448415, 0.04660772, 0, 0, 0, 1, 1,
0.3291698, 0.5093271, -0.2875597, 0, 0, 0, 1, 1,
0.3301169, -1.542725, 3.009886, 0, 0, 0, 1, 1,
0.3347805, -0.08077713, 0.9221717, 1, 1, 1, 1, 1,
0.3361316, 0.9090282, 2.067323, 1, 1, 1, 1, 1,
0.34162, -0.2258135, 2.424709, 1, 1, 1, 1, 1,
0.347757, -0.9531397, 2.651459, 1, 1, 1, 1, 1,
0.3568273, 0.5031079, 1.86801, 1, 1, 1, 1, 1,
0.359903, 0.80642, 0.1839015, 1, 1, 1, 1, 1,
0.3654909, 1.740061, -0.2578254, 1, 1, 1, 1, 1,
0.3683042, 0.556081, 0.2124072, 1, 1, 1, 1, 1,
0.3697586, -0.7420369, 2.018051, 1, 1, 1, 1, 1,
0.3708275, 0.3299331, 1.476536, 1, 1, 1, 1, 1,
0.3736857, 0.6751825, 0.511268, 1, 1, 1, 1, 1,
0.3750283, 0.6504548, 0.07290294, 1, 1, 1, 1, 1,
0.3765607, 0.04246969, -0.3429239, 1, 1, 1, 1, 1,
0.378134, 0.8285258, 1.66635, 1, 1, 1, 1, 1,
0.3844613, 0.1147071, 1.700006, 1, 1, 1, 1, 1,
0.3938559, -0.01924608, 3.518982, 0, 0, 1, 1, 1,
0.3969159, -2.343905, 3.104598, 1, 0, 0, 1, 1,
0.3983119, -0.1681838, 1.232313, 1, 0, 0, 1, 1,
0.4040897, 0.7032942, 1.521384, 1, 0, 0, 1, 1,
0.4042567, -0.2622674, 1.056339, 1, 0, 0, 1, 1,
0.4051285, 0.2824399, 2.39757, 1, 0, 0, 1, 1,
0.407488, 0.1196441, 0.4357507, 0, 0, 0, 1, 1,
0.4109448, -2.49441, 1.99358, 0, 0, 0, 1, 1,
0.4164247, 0.4353271, 0.2042483, 0, 0, 0, 1, 1,
0.4184446, 0.6414325, -0.4064576, 0, 0, 0, 1, 1,
0.4207009, 0.04792386, 2.628064, 0, 0, 0, 1, 1,
0.4213219, 1.311213, 1.679162, 0, 0, 0, 1, 1,
0.42423, 2.470494, -0.300465, 0, 0, 0, 1, 1,
0.4248912, -0.7907899, 4.241198, 1, 1, 1, 1, 1,
0.4263591, 0.4332507, 0.4214753, 1, 1, 1, 1, 1,
0.4281915, 0.641053, 0.8473051, 1, 1, 1, 1, 1,
0.431831, 0.09597383, 2.087048, 1, 1, 1, 1, 1,
0.4358456, 0.610965, 1.597156, 1, 1, 1, 1, 1,
0.4372647, -0.295466, 1.808444, 1, 1, 1, 1, 1,
0.4423192, -1.001903, 3.975136, 1, 1, 1, 1, 1,
0.4426354, -0.4306004, 2.924974, 1, 1, 1, 1, 1,
0.4437997, 0.3421113, 0.3784625, 1, 1, 1, 1, 1,
0.4444163, 0.5244001, 2.053474, 1, 1, 1, 1, 1,
0.4444713, 0.07553363, 0.2715338, 1, 1, 1, 1, 1,
0.4476515, 0.1039625, 1.08366, 1, 1, 1, 1, 1,
0.4478644, 0.8417446, 1.153144, 1, 1, 1, 1, 1,
0.4482417, -0.05656188, 0.3706363, 1, 1, 1, 1, 1,
0.4551537, 0.3725988, 2.096518, 1, 1, 1, 1, 1,
0.45575, 0.2307176, 0.8159407, 0, 0, 1, 1, 1,
0.4557863, -0.6561671, 1.892158, 1, 0, 0, 1, 1,
0.4578615, -0.3661174, 2.194927, 1, 0, 0, 1, 1,
0.4598699, -0.831815, 2.99707, 1, 0, 0, 1, 1,
0.4604838, 0.6565889, 0.6165668, 1, 0, 0, 1, 1,
0.4616073, -0.1305296, 3.091467, 1, 0, 0, 1, 1,
0.4644022, 1.047089, 2.046891, 0, 0, 0, 1, 1,
0.4645149, 2.320882, -0.6655751, 0, 0, 0, 1, 1,
0.4668591, -0.7199086, 4.658301, 0, 0, 0, 1, 1,
0.4700895, 0.02858303, -0.1556711, 0, 0, 0, 1, 1,
0.4747925, -0.5628873, 2.89701, 0, 0, 0, 1, 1,
0.4769125, 0.6199388, 2.525189, 0, 0, 0, 1, 1,
0.4775876, -1.811265, 3.454694, 0, 0, 0, 1, 1,
0.479575, 2.02188, 1.30742, 1, 1, 1, 1, 1,
0.4800241, 1.227067, -0.4171421, 1, 1, 1, 1, 1,
0.4841404, -0.8457842, 4.675264, 1, 1, 1, 1, 1,
0.4875892, -0.3396131, 4.519659, 1, 1, 1, 1, 1,
0.4892819, -0.8873045, 1.342365, 1, 1, 1, 1, 1,
0.4901845, 0.001930832, 1.092533, 1, 1, 1, 1, 1,
0.4902821, -1.099752, 2.053352, 1, 1, 1, 1, 1,
0.4907306, 0.198386, -1.536445, 1, 1, 1, 1, 1,
0.4927449, 0.2482726, -0.2889861, 1, 1, 1, 1, 1,
0.4951799, 0.3180412, 0.9321095, 1, 1, 1, 1, 1,
0.5018427, -0.7019864, 2.03287, 1, 1, 1, 1, 1,
0.5029949, -0.1001841, 2.064271, 1, 1, 1, 1, 1,
0.5056029, 0.6095899, 0.292725, 1, 1, 1, 1, 1,
0.5100295, -0.2422092, 1.47729, 1, 1, 1, 1, 1,
0.5150267, 0.3503141, 1.160618, 1, 1, 1, 1, 1,
0.5209235, -0.2304695, 1.107618, 0, 0, 1, 1, 1,
0.5290184, 0.1047723, 0.9543627, 1, 0, 0, 1, 1,
0.5323572, -0.3656089, 2.925027, 1, 0, 0, 1, 1,
0.5348555, 0.2495223, 1.316269, 1, 0, 0, 1, 1,
0.5368666, -0.1106881, 1.772586, 1, 0, 0, 1, 1,
0.5379505, -0.2787947, 2.594453, 1, 0, 0, 1, 1,
0.5379645, -1.311887, 3.976219, 0, 0, 0, 1, 1,
0.5454421, -0.3002304, 1.886286, 0, 0, 0, 1, 1,
0.5505449, 0.3770743, 3.037377, 0, 0, 0, 1, 1,
0.553194, -0.09063796, 1.445915, 0, 0, 0, 1, 1,
0.5596089, 0.5956152, 1.02774, 0, 0, 0, 1, 1,
0.5609519, 0.3150284, 2.785377, 0, 0, 0, 1, 1,
0.5644598, 1.331088, 0.5344127, 0, 0, 0, 1, 1,
0.564795, 0.4612953, -0.0413585, 1, 1, 1, 1, 1,
0.5705715, -1.376256, 2.861492, 1, 1, 1, 1, 1,
0.5706169, 1.083007, -0.07112357, 1, 1, 1, 1, 1,
0.5712, 0.7418493, -1.398812, 1, 1, 1, 1, 1,
0.5712146, -1.297939, 1.24739, 1, 1, 1, 1, 1,
0.5729569, 0.748833, -1.158828, 1, 1, 1, 1, 1,
0.5729774, 1.748621, -0.1539376, 1, 1, 1, 1, 1,
0.57298, 1.109746, 2.412097, 1, 1, 1, 1, 1,
0.5731523, 1.588403, -1.033163, 1, 1, 1, 1, 1,
0.5741024, 2.31715, -0.8934516, 1, 1, 1, 1, 1,
0.5744863, 1.029149, -0.8486634, 1, 1, 1, 1, 1,
0.5750574, -1.226352, 3.912584, 1, 1, 1, 1, 1,
0.5767411, 1.469454, 1.007369, 1, 1, 1, 1, 1,
0.5791338, 0.08326668, 1.885735, 1, 1, 1, 1, 1,
0.5805497, -0.2030414, 2.53352, 1, 1, 1, 1, 1,
0.5832757, -0.0675021, 1.599318, 0, 0, 1, 1, 1,
0.583447, -2.160283, 4.582972, 1, 0, 0, 1, 1,
0.5847866, 0.2879497, 1.837264, 1, 0, 0, 1, 1,
0.5854368, 1.167409, 0.4135763, 1, 0, 0, 1, 1,
0.5936456, 1.016146, 0.8765851, 1, 0, 0, 1, 1,
0.5937293, 0.08449581, 3.061996, 1, 0, 0, 1, 1,
0.5950544, 0.7842222, 0.751443, 0, 0, 0, 1, 1,
0.5975211, -1.290252, 1.018652, 0, 0, 0, 1, 1,
0.5978313, 0.430562, 0.1409901, 0, 0, 0, 1, 1,
0.5991244, -0.6071552, 2.798149, 0, 0, 0, 1, 1,
0.5995381, -0.3864758, 1.458028, 0, 0, 0, 1, 1,
0.6009188, -1.953864, 3.773827, 0, 0, 0, 1, 1,
0.6031327, 0.7118036, -0.2465627, 0, 0, 0, 1, 1,
0.6045614, -0.7805343, 1.857092, 1, 1, 1, 1, 1,
0.6057362, -0.6415565, 1.524924, 1, 1, 1, 1, 1,
0.612229, -0.550153, 3.776987, 1, 1, 1, 1, 1,
0.6146094, 0.620575, 1.401956, 1, 1, 1, 1, 1,
0.6221707, 1.896493, 0.4005036, 1, 1, 1, 1, 1,
0.6354077, -0.8717713, 0.7402484, 1, 1, 1, 1, 1,
0.6365678, -0.117067, 1.077826, 1, 1, 1, 1, 1,
0.6386337, -1.672337, 2.035949, 1, 1, 1, 1, 1,
0.6452335, 1.837826, 1.0156, 1, 1, 1, 1, 1,
0.647643, -0.1834439, 1.226366, 1, 1, 1, 1, 1,
0.6489372, 1.958231, -0.5642292, 1, 1, 1, 1, 1,
0.6525086, 1.03187, 1.562098, 1, 1, 1, 1, 1,
0.6531642, 0.06637993, 0.80187, 1, 1, 1, 1, 1,
0.654742, -1.226304, 3.505328, 1, 1, 1, 1, 1,
0.6577708, -0.3185272, 3.542127, 1, 1, 1, 1, 1,
0.6624166, 0.2402668, 1.161407, 0, 0, 1, 1, 1,
0.6624714, -0.9160957, 2.837859, 1, 0, 0, 1, 1,
0.6751806, -0.07958771, 1.675358, 1, 0, 0, 1, 1,
0.6792704, -0.8912826, 0.2362545, 1, 0, 0, 1, 1,
0.679888, 1.022552, -0.851751, 1, 0, 0, 1, 1,
0.6806204, -0.8665413, 2.193927, 1, 0, 0, 1, 1,
0.6842163, 0.5446971, 2.350391, 0, 0, 0, 1, 1,
0.6845936, 0.4948306, 0.5553962, 0, 0, 0, 1, 1,
0.690456, 1.752928, -0.9842733, 0, 0, 0, 1, 1,
0.6952797, -0.8437997, 2.213972, 0, 0, 0, 1, 1,
0.698239, 0.2075664, 3.043682, 0, 0, 0, 1, 1,
0.7005779, -0.1785204, 1.4736, 0, 0, 0, 1, 1,
0.7007177, 1.932733, -0.7917266, 0, 0, 0, 1, 1,
0.7030989, -0.4602511, 1.83849, 1, 1, 1, 1, 1,
0.7135443, -0.3078606, 2.594784, 1, 1, 1, 1, 1,
0.7190172, 0.588196, 2.567313, 1, 1, 1, 1, 1,
0.7279417, -0.3864524, 0.3536411, 1, 1, 1, 1, 1,
0.7281154, -0.9379812, 3.915506, 1, 1, 1, 1, 1,
0.7323058, -0.1314397, 0.8389177, 1, 1, 1, 1, 1,
0.7363554, -0.2217404, 3.025793, 1, 1, 1, 1, 1,
0.7376437, 0.57511, 0.5505224, 1, 1, 1, 1, 1,
0.7423422, -0.6344454, 0.5963445, 1, 1, 1, 1, 1,
0.7459802, -1.311767, 2.68398, 1, 1, 1, 1, 1,
0.7520766, 1.128406, 1.170669, 1, 1, 1, 1, 1,
0.7558063, 0.4038521, -0.2377295, 1, 1, 1, 1, 1,
0.7560099, 0.9356868, 1.699958, 1, 1, 1, 1, 1,
0.7574033, 1.159026, -1.415796, 1, 1, 1, 1, 1,
0.7578672, -1.952142, 2.948176, 1, 1, 1, 1, 1,
0.7590645, -1.506951, 3.362571, 0, 0, 1, 1, 1,
0.7609938, 1.500437, 2.058525, 1, 0, 0, 1, 1,
0.7624466, -0.1584871, 2.074558, 1, 0, 0, 1, 1,
0.7735218, 0.6387578, -0.05228595, 1, 0, 0, 1, 1,
0.7747146, -1.32048, 1.402156, 1, 0, 0, 1, 1,
0.7765458, 0.6817038, -0.797928, 1, 0, 0, 1, 1,
0.7766173, 1.444284, 1.404252, 0, 0, 0, 1, 1,
0.7778417, -0.8111157, 0.9605125, 0, 0, 0, 1, 1,
0.7780594, -1.073268, 2.553398, 0, 0, 0, 1, 1,
0.7934515, -0.3043887, 2.470196, 0, 0, 0, 1, 1,
0.795772, -1.596022, 1.046112, 0, 0, 0, 1, 1,
0.8071393, 0.2201069, 0.567068, 0, 0, 0, 1, 1,
0.809343, -1.086376, 5.130222, 0, 0, 0, 1, 1,
0.8099956, -0.1351053, 2.162298, 1, 1, 1, 1, 1,
0.8155098, -0.2580044, 2.62673, 1, 1, 1, 1, 1,
0.829234, 0.03291064, 1.589663, 1, 1, 1, 1, 1,
0.8318385, -1.305692, 1.153019, 1, 1, 1, 1, 1,
0.8320056, 0.4533253, 1.639268, 1, 1, 1, 1, 1,
0.8320485, 0.4834355, -0.3748577, 1, 1, 1, 1, 1,
0.8334344, 1.337073, -1.002884, 1, 1, 1, 1, 1,
0.8343105, -0.7865435, 2.123619, 1, 1, 1, 1, 1,
0.8345249, -0.2508056, 1.232175, 1, 1, 1, 1, 1,
0.8539005, -0.6867678, 0.7249953, 1, 1, 1, 1, 1,
0.8617429, -0.3770956, 6.089363, 1, 1, 1, 1, 1,
0.8652495, -0.8628135, 2.836794, 1, 1, 1, 1, 1,
0.8673684, -0.7549667, 3.151604, 1, 1, 1, 1, 1,
0.8708511, -1.250193, 1.334183, 1, 1, 1, 1, 1,
0.8831598, 0.1290618, 0.9550575, 1, 1, 1, 1, 1,
0.8861838, -0.3171248, 1.037813, 0, 0, 1, 1, 1,
0.8880234, -0.4969909, 0.8882945, 1, 0, 0, 1, 1,
0.9004551, -1.964941, 1.595611, 1, 0, 0, 1, 1,
0.9042813, 0.2964938, 3.514858, 1, 0, 0, 1, 1,
0.907923, -0.7219101, 0.6869422, 1, 0, 0, 1, 1,
0.9118612, -0.4278734, 2.712671, 1, 0, 0, 1, 1,
0.9148473, -1.033503, 3.603091, 0, 0, 0, 1, 1,
0.9231831, 0.69693, 1.986533, 0, 0, 0, 1, 1,
0.9290461, -0.5762095, 2.017425, 0, 0, 0, 1, 1,
0.9339257, -0.976142, 2.48709, 0, 0, 0, 1, 1,
0.9404007, 0.5629784, 2.746306, 0, 0, 0, 1, 1,
0.9408745, 1.044159, 1.776408, 0, 0, 0, 1, 1,
0.947267, -0.04593093, 1.843655, 0, 0, 0, 1, 1,
0.9511951, 3.105971, 0.4338222, 1, 1, 1, 1, 1,
0.9536011, 0.3152097, 0.6000711, 1, 1, 1, 1, 1,
0.9665686, 3.140656, 0.5345021, 1, 1, 1, 1, 1,
0.973856, 0.006668234, 0.7193989, 1, 1, 1, 1, 1,
0.979051, -1.00853, 2.725144, 1, 1, 1, 1, 1,
0.9806344, -0.8965924, 3.097497, 1, 1, 1, 1, 1,
0.9810296, 1.552637, 2.669507, 1, 1, 1, 1, 1,
0.9813973, -0.7829294, 2.641075, 1, 1, 1, 1, 1,
0.9825669, 1.261945, 1.36571, 1, 1, 1, 1, 1,
0.9834021, 1.724973, -1.95235, 1, 1, 1, 1, 1,
0.9855614, 0.4689728, -0.08712775, 1, 1, 1, 1, 1,
1.005991, 1.331674, -0.1892093, 1, 1, 1, 1, 1,
1.012606, 1.262707, -0.566368, 1, 1, 1, 1, 1,
1.014569, -0.7787444, 1.323492, 1, 1, 1, 1, 1,
1.020809, -1.644325, 2.513095, 1, 1, 1, 1, 1,
1.031397, 0.07066115, 1.666337, 0, 0, 1, 1, 1,
1.031431, 0.274435, 2.586902, 1, 0, 0, 1, 1,
1.033654, -0.2503431, 2.016136, 1, 0, 0, 1, 1,
1.036019, -0.6473737, 2.810441, 1, 0, 0, 1, 1,
1.036108, -1.893635, 2.676489, 1, 0, 0, 1, 1,
1.03905, 0.114536, 1.759491, 1, 0, 0, 1, 1,
1.039845, 0.9055725, 3.781746, 0, 0, 0, 1, 1,
1.046255, 1.670148, 2.076512, 0, 0, 0, 1, 1,
1.048432, -1.400813, 2.292666, 0, 0, 0, 1, 1,
1.05155, 1.207219, 1.825802, 0, 0, 0, 1, 1,
1.05451, 0.6137936, 0.9967981, 0, 0, 0, 1, 1,
1.054644, 0.8137011, 1.686705, 0, 0, 0, 1, 1,
1.063749, -0.3178064, 1.587799, 0, 0, 0, 1, 1,
1.06539, -0.9806331, 2.014953, 1, 1, 1, 1, 1,
1.066, 0.4186151, 0.5446615, 1, 1, 1, 1, 1,
1.078681, 1.22224, 0.3617779, 1, 1, 1, 1, 1,
1.087189, -1.235903, 2.260112, 1, 1, 1, 1, 1,
1.088503, 0.9186079, 1.625399, 1, 1, 1, 1, 1,
1.10207, 0.430627, 2.049911, 1, 1, 1, 1, 1,
1.111192, -1.195388, 1.493752, 1, 1, 1, 1, 1,
1.117646, -1.48016, 2.095089, 1, 1, 1, 1, 1,
1.118234, -0.08549246, 1.993958, 1, 1, 1, 1, 1,
1.124231, 0.6497269, 0.6115066, 1, 1, 1, 1, 1,
1.129971, -0.2607422, 1.992789, 1, 1, 1, 1, 1,
1.149495, -0.415144, 2.326664, 1, 1, 1, 1, 1,
1.151047, -2.040744, 3.993007, 1, 1, 1, 1, 1,
1.16506, 2.285727, -0.3405295, 1, 1, 1, 1, 1,
1.169628, 1.180799, 2.154726, 1, 1, 1, 1, 1,
1.17183, -0.9524264, 1.82069, 0, 0, 1, 1, 1,
1.175543, 1.11147, -0.2239192, 1, 0, 0, 1, 1,
1.175572, -0.3971888, 1.194136, 1, 0, 0, 1, 1,
1.177808, 3.294515, -0.7065762, 1, 0, 0, 1, 1,
1.181771, 1.436752, 2.003673, 1, 0, 0, 1, 1,
1.185418, -0.8634598, 1.976521, 1, 0, 0, 1, 1,
1.186564, -1.054717, 1.983807, 0, 0, 0, 1, 1,
1.192206, 0.9578794, 2.953693, 0, 0, 0, 1, 1,
1.209837, -0.5800004, 2.992804, 0, 0, 0, 1, 1,
1.211574, 0.8994018, -0.4695061, 0, 0, 0, 1, 1,
1.215367, -0.6231936, 1.378005, 0, 0, 0, 1, 1,
1.221765, 0.2176546, 0.4529604, 0, 0, 0, 1, 1,
1.223211, 1.216203, -0.2493534, 0, 0, 0, 1, 1,
1.23293, -0.3992918, 0.6949801, 1, 1, 1, 1, 1,
1.235877, -0.5965064, -0.02057754, 1, 1, 1, 1, 1,
1.236669, 0.4680878, 1.3516, 1, 1, 1, 1, 1,
1.238529, -0.7706223, 1.624767, 1, 1, 1, 1, 1,
1.244168, 0.5468999, 1.374417, 1, 1, 1, 1, 1,
1.251904, -0.7632121, 0.5045984, 1, 1, 1, 1, 1,
1.264727, 0.4346018, 1.702204, 1, 1, 1, 1, 1,
1.274538, 0.5020276, 1.49872, 1, 1, 1, 1, 1,
1.28291, -1.306503, 1.684592, 1, 1, 1, 1, 1,
1.292747, 0.6425532, 0.8086052, 1, 1, 1, 1, 1,
1.293348, -0.4729536, 2.537286, 1, 1, 1, 1, 1,
1.294006, 0.7399548, 1.172867, 1, 1, 1, 1, 1,
1.29833, -0.5995564, 2.015198, 1, 1, 1, 1, 1,
1.300698, 0.5328768, 0.2521362, 1, 1, 1, 1, 1,
1.304858, -0.620294, 1.971789, 1, 1, 1, 1, 1,
1.309351, -0.7489104, 2.642832, 0, 0, 1, 1, 1,
1.312024, 0.1653023, 2.794794, 1, 0, 0, 1, 1,
1.317413, 1.438542, 1.610788, 1, 0, 0, 1, 1,
1.31824, -0.03355932, 2.191839, 1, 0, 0, 1, 1,
1.324292, 0.4083897, 0.6137108, 1, 0, 0, 1, 1,
1.330596, -1.045986, 1.277495, 1, 0, 0, 1, 1,
1.337771, -0.2376103, 1.101461, 0, 0, 0, 1, 1,
1.343226, 0.1227691, -0.1269898, 0, 0, 0, 1, 1,
1.355453, -0.9416205, 2.253801, 0, 0, 0, 1, 1,
1.364352, -1.418574, 4.173875, 0, 0, 0, 1, 1,
1.370455, 0.9411148, 0.7302986, 0, 0, 0, 1, 1,
1.388937, 1.336219, 1.961776, 0, 0, 0, 1, 1,
1.394228, -1.047857, 1.473042, 0, 0, 0, 1, 1,
1.41602, -0.3976604, 0.6719009, 1, 1, 1, 1, 1,
1.416307, 1.1009, 1.443975, 1, 1, 1, 1, 1,
1.418821, 0.317185, 2.667386, 1, 1, 1, 1, 1,
1.421615, -1.636129, 0.6658509, 1, 1, 1, 1, 1,
1.421979, -0.5106397, 1.340882, 1, 1, 1, 1, 1,
1.447172, 1.03856, 0.2139709, 1, 1, 1, 1, 1,
1.452394, -1.046443, 1.426836, 1, 1, 1, 1, 1,
1.456682, 0.3037354, -0.9472663, 1, 1, 1, 1, 1,
1.459996, 1.056194, 0.8900278, 1, 1, 1, 1, 1,
1.466807, 0.5759479, 2.035523, 1, 1, 1, 1, 1,
1.470247, -1.235479, 1.472017, 1, 1, 1, 1, 1,
1.473254, 0.01463428, 0.01554587, 1, 1, 1, 1, 1,
1.476432, 0.447669, 0.2871782, 1, 1, 1, 1, 1,
1.482901, 1.436446, 0.9576212, 1, 1, 1, 1, 1,
1.484824, 0.3998701, 1.509115, 1, 1, 1, 1, 1,
1.499555, 0.8146986, -0.4750884, 0, 0, 1, 1, 1,
1.504594, -1.144281, 2.867939, 1, 0, 0, 1, 1,
1.509695, -0.7982652, 2.330941, 1, 0, 0, 1, 1,
1.524436, 0.09703494, 0.8080266, 1, 0, 0, 1, 1,
1.530284, 0.02799278, 0.6399907, 1, 0, 0, 1, 1,
1.533848, 0.01368254, 1.788196, 1, 0, 0, 1, 1,
1.535048, -0.7757509, 1.964761, 0, 0, 0, 1, 1,
1.543267, 1.7142, -0.570065, 0, 0, 0, 1, 1,
1.549823, 0.6582026, 2.047875, 0, 0, 0, 1, 1,
1.550581, 1.763146, 2.651809, 0, 0, 0, 1, 1,
1.566591, 2.097826, -1.520679, 0, 0, 0, 1, 1,
1.573577, -0.8257151, 0.7844387, 0, 0, 0, 1, 1,
1.590425, 0.0446934, 1.819635, 0, 0, 0, 1, 1,
1.598719, 0.3201889, 0.2037224, 1, 1, 1, 1, 1,
1.609434, 0.9968977, 0.2944526, 1, 1, 1, 1, 1,
1.641132, 1.325368, -1.053834, 1, 1, 1, 1, 1,
1.643483, -0.2211294, 1.902187, 1, 1, 1, 1, 1,
1.65609, 0.5561517, 1.688861, 1, 1, 1, 1, 1,
1.657267, -1.646695, 1.912574, 1, 1, 1, 1, 1,
1.660969, 0.5831498, 0.998229, 1, 1, 1, 1, 1,
1.668805, -0.3646069, 1.249915, 1, 1, 1, 1, 1,
1.702859, -0.468161, 3.079145, 1, 1, 1, 1, 1,
1.719251, -0.4483914, 1.76525, 1, 1, 1, 1, 1,
1.725467, -2.579595, 0.7240278, 1, 1, 1, 1, 1,
1.727399, 1.403461, 1.26417, 1, 1, 1, 1, 1,
1.729368, 0.1065169, -0.04430091, 1, 1, 1, 1, 1,
1.730313, -0.2038381, 2.386046, 1, 1, 1, 1, 1,
1.740007, 0.7816742, 0.9962421, 1, 1, 1, 1, 1,
1.740334, -0.3509978, 2.367065, 0, 0, 1, 1, 1,
1.762829, 0.1008121, 3.728752, 1, 0, 0, 1, 1,
1.76859, 2.607181, 0.4802494, 1, 0, 0, 1, 1,
1.774113, -1.819347, 2.249556, 1, 0, 0, 1, 1,
1.790092, -1.461033, 3.089554, 1, 0, 0, 1, 1,
1.798883, 0.213124, 0.5044225, 1, 0, 0, 1, 1,
1.824183, -0.131329, 0.650748, 0, 0, 0, 1, 1,
1.837449, 1.142406, 0.7977192, 0, 0, 0, 1, 1,
1.882867, -0.6308045, 1.413549, 0, 0, 0, 1, 1,
1.897216, -1.251828, 0.2859901, 0, 0, 0, 1, 1,
1.897992, 0.4354911, 2.405434, 0, 0, 0, 1, 1,
1.908116, 0.3737808, 2.689266, 0, 0, 0, 1, 1,
1.91018, 1.420064, 1.405419, 0, 0, 0, 1, 1,
1.918962, 1.458722, -0.5655023, 1, 1, 1, 1, 1,
1.929017, -0.8030384, 2.408263, 1, 1, 1, 1, 1,
1.929564, 0.2112962, 1.48458, 1, 1, 1, 1, 1,
1.930926, 0.3971628, -0.4452373, 1, 1, 1, 1, 1,
1.960909, -0.9435676, 2.410618, 1, 1, 1, 1, 1,
1.96966, 0.0931793, 1.643739, 1, 1, 1, 1, 1,
1.979962, -0.7092004, 5.106467, 1, 1, 1, 1, 1,
1.982524, 0.4802825, 2.739163, 1, 1, 1, 1, 1,
2.003095, 0.4245378, 1.488596, 1, 1, 1, 1, 1,
2.003232, 0.511716, 2.920907, 1, 1, 1, 1, 1,
2.04443, -1.188345, 1.964785, 1, 1, 1, 1, 1,
2.111629, 0.5489374, 1.906218, 1, 1, 1, 1, 1,
2.168956, 1.19763, 1.380582, 1, 1, 1, 1, 1,
2.212101, 1.660925, 0.292277, 1, 1, 1, 1, 1,
2.226771, -0.8289868, 1.810441, 1, 1, 1, 1, 1,
2.269696, -2.315589, 0.9306623, 0, 0, 1, 1, 1,
2.294312, 0.6244928, 3.168416, 1, 0, 0, 1, 1,
2.348523, 1.241806, 1.255625, 1, 0, 0, 1, 1,
2.38201, -0.003927493, 1.41268, 1, 0, 0, 1, 1,
2.426094, 0.4801932, 2.344104, 1, 0, 0, 1, 1,
2.452277, 0.8965901, 1.425114, 1, 0, 0, 1, 1,
2.452916, 1.306158, 0.706692, 0, 0, 0, 1, 1,
2.510778, -0.2542181, 0.8199521, 0, 0, 0, 1, 1,
2.516601, 1.560022, 2.901677, 0, 0, 0, 1, 1,
2.535246, 0.8681423, 1.098065, 0, 0, 0, 1, 1,
2.601847, -2.145176, 3.360653, 0, 0, 0, 1, 1,
2.633461, 0.9278269, 1.548454, 0, 0, 0, 1, 1,
2.707841, 1.447427, -0.4590577, 0, 0, 0, 1, 1,
2.74164, 1.61814, 0.9613833, 1, 1, 1, 1, 1,
2.779186, 0.03555574, 0.7101102, 1, 1, 1, 1, 1,
2.814066, 1.12491, 1.28714, 1, 1, 1, 1, 1,
2.961592, 0.1681954, 2.27374, 1, 1, 1, 1, 1,
3.034408, 1.698234, -1.794887, 1, 1, 1, 1, 1,
3.069996, -0.2741614, 2.65929, 1, 1, 1, 1, 1,
3.238847, 0.7878606, 3.273907, 1, 1, 1, 1, 1
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
var radius = 9.763311;
var distance = 34.29322;
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
mvMatrix.translate( -0.1999635, -0.2366949, -0.3070157 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.29322);
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
