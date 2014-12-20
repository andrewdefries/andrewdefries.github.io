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
-3.123587, -0.3878969, -1.136438, 1, 0, 0, 1,
-2.665776, -1.537513, -2.067802, 1, 0.007843138, 0, 1,
-2.662957, 0.8291289, -1.251534, 1, 0.01176471, 0, 1,
-2.639469, -0.5186504, -2.373601, 1, 0.01960784, 0, 1,
-2.588071, -0.06730478, -3.453095, 1, 0.02352941, 0, 1,
-2.573478, 0.9559183, -0.7012448, 1, 0.03137255, 0, 1,
-2.406644, 0.6975484, -1.509765, 1, 0.03529412, 0, 1,
-2.350962, 0.3648673, -1.88626, 1, 0.04313726, 0, 1,
-2.286135, 1.221262, -1.563316, 1, 0.04705882, 0, 1,
-2.266673, 1.126768, -1.985656, 1, 0.05490196, 0, 1,
-2.156133, 1.256858, -0.9951174, 1, 0.05882353, 0, 1,
-2.132274, 0.7844302, -0.07595024, 1, 0.06666667, 0, 1,
-2.103041, 0.4592848, -2.168113, 1, 0.07058824, 0, 1,
-2.086702, -0.5640507, -2.617981, 1, 0.07843138, 0, 1,
-2.083731, 0.4079047, -0.5835652, 1, 0.08235294, 0, 1,
-2.022263, -1.330397, -1.562041, 1, 0.09019608, 0, 1,
-2.015489, -0.2563361, -2.789328, 1, 0.09411765, 0, 1,
-2.005715, -1.085196, -2.043303, 1, 0.1019608, 0, 1,
-1.99677, -0.2438572, -1.58472, 1, 0.1098039, 0, 1,
-1.962622, -0.556439, -2.979198, 1, 0.1137255, 0, 1,
-1.952214, -0.5068043, -1.535378, 1, 0.1215686, 0, 1,
-1.937934, -0.2605918, -0.3428215, 1, 0.1254902, 0, 1,
-1.918237, -0.5494137, -3.653638, 1, 0.1333333, 0, 1,
-1.912, -1.577888, -2.409905, 1, 0.1372549, 0, 1,
-1.868947, 0.006171751, -0.5200224, 1, 0.145098, 0, 1,
-1.867715, 0.2186835, -2.191972, 1, 0.1490196, 0, 1,
-1.861793, -0.7664622, -1.515871, 1, 0.1568628, 0, 1,
-1.840466, -0.7357331, -2.933576, 1, 0.1607843, 0, 1,
-1.832985, -1.782642, -0.9252577, 1, 0.1686275, 0, 1,
-1.812528, 0.7453237, -2.729966, 1, 0.172549, 0, 1,
-1.785676, 1.241598, -1.911594, 1, 0.1803922, 0, 1,
-1.771905, 0.3477288, -2.715529, 1, 0.1843137, 0, 1,
-1.764805, -0.1385933, -1.171721, 1, 0.1921569, 0, 1,
-1.76177, 0.01481207, 0.4817705, 1, 0.1960784, 0, 1,
-1.753063, 1.682412, -1.226415, 1, 0.2039216, 0, 1,
-1.750982, 0.02276558, -3.099836, 1, 0.2117647, 0, 1,
-1.727579, -0.8239216, -0.9306243, 1, 0.2156863, 0, 1,
-1.710927, -1.47558, -0.2923104, 1, 0.2235294, 0, 1,
-1.707345, 0.8545557, -0.7483646, 1, 0.227451, 0, 1,
-1.698859, -0.5283002, -1.192313, 1, 0.2352941, 0, 1,
-1.666283, 0.5151889, -0.79729, 1, 0.2392157, 0, 1,
-1.659111, -0.2645312, -2.701344, 1, 0.2470588, 0, 1,
-1.65722, 0.3819998, -1.710788, 1, 0.2509804, 0, 1,
-1.648191, 0.2046624, -1.275197, 1, 0.2588235, 0, 1,
-1.642164, -0.009365955, -0.1852506, 1, 0.2627451, 0, 1,
-1.627258, -1.259599, -1.289425, 1, 0.2705882, 0, 1,
-1.622056, -1.330221, -2.545577, 1, 0.2745098, 0, 1,
-1.601814, 0.6636216, -1.938638, 1, 0.282353, 0, 1,
-1.596762, 0.9378586, -3.141721, 1, 0.2862745, 0, 1,
-1.581417, 0.6905141, -1.21025, 1, 0.2941177, 0, 1,
-1.570974, 0.6662416, -1.113676, 1, 0.3019608, 0, 1,
-1.558203, -0.2483411, -2.147392, 1, 0.3058824, 0, 1,
-1.553709, 3.318528, -0.4264506, 1, 0.3137255, 0, 1,
-1.548153, 0.5489815, -2.317842, 1, 0.3176471, 0, 1,
-1.544912, 0.4567904, -0.8405582, 1, 0.3254902, 0, 1,
-1.54299, -1.752916, -3.105457, 1, 0.3294118, 0, 1,
-1.510249, 0.340646, -0.854342, 1, 0.3372549, 0, 1,
-1.508703, -1.448138, -0.6497729, 1, 0.3411765, 0, 1,
-1.494731, 1.28119, -2.911947, 1, 0.3490196, 0, 1,
-1.485977, -0.08436117, -0.1697389, 1, 0.3529412, 0, 1,
-1.484864, 0.9184574, -0.3663654, 1, 0.3607843, 0, 1,
-1.482872, 0.0169673, -1.668556, 1, 0.3647059, 0, 1,
-1.47679, -1.113831, -0.8566419, 1, 0.372549, 0, 1,
-1.474197, 1.767321, -1.452001, 1, 0.3764706, 0, 1,
-1.453749, -0.4140517, -2.255404, 1, 0.3843137, 0, 1,
-1.451254, -0.2065959, -1.291538, 1, 0.3882353, 0, 1,
-1.442129, -0.743019, -0.4214967, 1, 0.3960784, 0, 1,
-1.432914, 1.19029, -0.568339, 1, 0.4039216, 0, 1,
-1.427103, -1.505094, -2.655365, 1, 0.4078431, 0, 1,
-1.422062, 0.2847671, 0.5410357, 1, 0.4156863, 0, 1,
-1.412426, 0.370764, 0.2007827, 1, 0.4196078, 0, 1,
-1.410907, 0.3148746, -0.2701334, 1, 0.427451, 0, 1,
-1.40176, -1.886428, -1.283977, 1, 0.4313726, 0, 1,
-1.400732, -0.9314712, -1.897257, 1, 0.4392157, 0, 1,
-1.393182, 0.2231761, -1.99559, 1, 0.4431373, 0, 1,
-1.383061, 0.1397703, -3.349439, 1, 0.4509804, 0, 1,
-1.382165, 1.199944, -0.608054, 1, 0.454902, 0, 1,
-1.372118, 0.1983192, -0.7705759, 1, 0.4627451, 0, 1,
-1.369642, 1.096561, -0.3004312, 1, 0.4666667, 0, 1,
-1.367064, -0.1869517, -2.605473, 1, 0.4745098, 0, 1,
-1.364987, 0.09831743, -2.459328, 1, 0.4784314, 0, 1,
-1.362326, -0.7995399, -1.854003, 1, 0.4862745, 0, 1,
-1.358302, 1.407152, -0.6539294, 1, 0.4901961, 0, 1,
-1.354813, 1.118582, 0.6620243, 1, 0.4980392, 0, 1,
-1.347895, -1.669032, -1.754233, 1, 0.5058824, 0, 1,
-1.344164, 0.7613103, -1.275392, 1, 0.509804, 0, 1,
-1.342942, 1.337274, 0.3926695, 1, 0.5176471, 0, 1,
-1.34288, -0.08899552, 0.02000705, 1, 0.5215687, 0, 1,
-1.342339, -0.04034331, -2.269346, 1, 0.5294118, 0, 1,
-1.339073, 0.5922692, -1.247538, 1, 0.5333334, 0, 1,
-1.334628, 0.05237346, -0.084024, 1, 0.5411765, 0, 1,
-1.332209, 0.5323561, -1.226792, 1, 0.5450981, 0, 1,
-1.315505, -0.6694573, -2.029045, 1, 0.5529412, 0, 1,
-1.31536, 1.327133, -0.3987885, 1, 0.5568628, 0, 1,
-1.312674, 1.577958, -0.5504211, 1, 0.5647059, 0, 1,
-1.308593, -0.476832, -1.347942, 1, 0.5686275, 0, 1,
-1.307035, -1.683689, -3.603678, 1, 0.5764706, 0, 1,
-1.303191, -0.5020983, -1.16994, 1, 0.5803922, 0, 1,
-1.301615, -0.09887614, -2.826299, 1, 0.5882353, 0, 1,
-1.300715, -0.5539985, -2.850932, 1, 0.5921569, 0, 1,
-1.297202, 0.7324802, -1.627349, 1, 0.6, 0, 1,
-1.294144, -1.015309, -3.515627, 1, 0.6078432, 0, 1,
-1.293145, 0.1378117, -0.9888449, 1, 0.6117647, 0, 1,
-1.278038, -0.9428548, -0.7670298, 1, 0.6196079, 0, 1,
-1.269639, 0.5691324, -0.2099678, 1, 0.6235294, 0, 1,
-1.264511, -0.281232, -1.763795, 1, 0.6313726, 0, 1,
-1.262951, -0.5540867, -3.334356, 1, 0.6352941, 0, 1,
-1.252216, -0.3430294, -0.8493109, 1, 0.6431373, 0, 1,
-1.224771, -0.8707162, -1.999052, 1, 0.6470588, 0, 1,
-1.219009, -0.5337721, -3.352366, 1, 0.654902, 0, 1,
-1.19023, -0.1335663, -2.544372, 1, 0.6588235, 0, 1,
-1.188751, -0.9303988, -2.767691, 1, 0.6666667, 0, 1,
-1.18809, 0.2304909, -0.8997172, 1, 0.6705883, 0, 1,
-1.173481, -1.55408, -1.588764, 1, 0.6784314, 0, 1,
-1.170047, 0.0694884, -0.8003928, 1, 0.682353, 0, 1,
-1.167628, 0.7298958, -1.479227, 1, 0.6901961, 0, 1,
-1.166787, -0.1846414, -0.4954151, 1, 0.6941177, 0, 1,
-1.163236, 0.3282015, -1.58765, 1, 0.7019608, 0, 1,
-1.162127, 0.6391781, -0.8708658, 1, 0.7098039, 0, 1,
-1.147795, 0.3180169, -1.156296, 1, 0.7137255, 0, 1,
-1.145844, 0.6340817, -2.700072, 1, 0.7215686, 0, 1,
-1.144959, 0.5411109, -0.5384669, 1, 0.7254902, 0, 1,
-1.140654, 0.8449676, -0.6632902, 1, 0.7333333, 0, 1,
-1.133523, -0.4852155, -2.493058, 1, 0.7372549, 0, 1,
-1.131801, 0.2360249, -2.009747, 1, 0.7450981, 0, 1,
-1.121665, 0.07733685, -2.020103, 1, 0.7490196, 0, 1,
-1.117108, 0.2075401, -1.816104, 1, 0.7568628, 0, 1,
-1.114286, 0.4182143, -1.699826, 1, 0.7607843, 0, 1,
-1.106273, -0.4797605, -2.284547, 1, 0.7686275, 0, 1,
-1.103641, -0.7574831, -2.268355, 1, 0.772549, 0, 1,
-1.102656, -0.4022574, -1.906929, 1, 0.7803922, 0, 1,
-1.083227, 1.260963, 0.4086213, 1, 0.7843137, 0, 1,
-1.080579, 1.172423, -1.932506, 1, 0.7921569, 0, 1,
-1.079982, -0.007748717, -2.120684, 1, 0.7960784, 0, 1,
-1.072171, 0.3449507, -0.3076468, 1, 0.8039216, 0, 1,
-1.071554, -0.7733387, -2.720241, 1, 0.8117647, 0, 1,
-1.070685, -1.419879, -3.180104, 1, 0.8156863, 0, 1,
-1.068166, 1.718293, -0.5655348, 1, 0.8235294, 0, 1,
-1.066601, -1.767288, -3.437541, 1, 0.827451, 0, 1,
-1.065756, 0.9619335, -1.704132, 1, 0.8352941, 0, 1,
-1.061526, 0.9435539, 0.8701016, 1, 0.8392157, 0, 1,
-1.059206, -1.211116, -1.841687, 1, 0.8470588, 0, 1,
-1.055439, 0.1394874, -1.663638, 1, 0.8509804, 0, 1,
-1.051599, -0.5642005, -4.04762, 1, 0.8588235, 0, 1,
-1.042941, 0.7512133, -1.557934, 1, 0.8627451, 0, 1,
-1.038409, 0.5883113, -1.27212, 1, 0.8705882, 0, 1,
-1.034674, 0.7935278, -2.56612, 1, 0.8745098, 0, 1,
-1.032189, -2.776702, -3.170931, 1, 0.8823529, 0, 1,
-1.031973, -1.50289, -3.482483, 1, 0.8862745, 0, 1,
-1.023933, -1.841178, -3.197296, 1, 0.8941177, 0, 1,
-1.023558, -0.8487734, -2.123804, 1, 0.8980392, 0, 1,
-1.020212, -0.211523, -2.719809, 1, 0.9058824, 0, 1,
-1.019026, -1.334246, -3.017328, 1, 0.9137255, 0, 1,
-1.017154, 1.331157, -1.813012, 1, 0.9176471, 0, 1,
-1.010301, -1.108851, -2.247938, 1, 0.9254902, 0, 1,
-1.009485, 1.830218, -3.552755, 1, 0.9294118, 0, 1,
-1.007749, 0.9198624, -0.8077621, 1, 0.9372549, 0, 1,
-1.006889, -0.6486182, 0.4386834, 1, 0.9411765, 0, 1,
-0.999944, -0.3617209, -1.325701, 1, 0.9490196, 0, 1,
-0.9998953, -0.6951135, -2.128516, 1, 0.9529412, 0, 1,
-0.9977368, 0.08453111, -0.1277693, 1, 0.9607843, 0, 1,
-0.9921864, -0.1813691, -3.629018, 1, 0.9647059, 0, 1,
-0.9914742, 1.439328, -0.8513135, 1, 0.972549, 0, 1,
-0.9841486, 0.008216529, -1.197598, 1, 0.9764706, 0, 1,
-0.982711, 0.4486805, -0.4735908, 1, 0.9843137, 0, 1,
-0.9825874, 1.064026, -0.4821408, 1, 0.9882353, 0, 1,
-0.9818302, 1.276498, 0.04118241, 1, 0.9960784, 0, 1,
-0.9779031, -0.8861385, -3.48895, 0.9960784, 1, 0, 1,
-0.976684, 0.1892648, -0.9361283, 0.9921569, 1, 0, 1,
-0.9676659, -0.0412753, -1.163843, 0.9843137, 1, 0, 1,
-0.9674328, -0.5546252, -2.672174, 0.9803922, 1, 0, 1,
-0.9623669, -1.159913, -1.083429, 0.972549, 1, 0, 1,
-0.9584073, -0.7666982, -3.915362, 0.9686275, 1, 0, 1,
-0.9553007, -1.029513, -3.403723, 0.9607843, 1, 0, 1,
-0.9543318, 0.07723529, -1.289163, 0.9568627, 1, 0, 1,
-0.9523584, 0.5149437, 0.4620142, 0.9490196, 1, 0, 1,
-0.9506554, 0.8353826, -0.7427981, 0.945098, 1, 0, 1,
-0.9495907, -0.9666706, -2.987121, 0.9372549, 1, 0, 1,
-0.9486602, 1.16103, 0.3459146, 0.9333333, 1, 0, 1,
-0.9466939, -0.9817441, -0.8918393, 0.9254902, 1, 0, 1,
-0.9409504, 0.5438414, -1.512879, 0.9215686, 1, 0, 1,
-0.9311929, -1.593218, -2.265725, 0.9137255, 1, 0, 1,
-0.9286144, 0.03230355, -0.801616, 0.9098039, 1, 0, 1,
-0.9276965, -1.673502, -1.517848, 0.9019608, 1, 0, 1,
-0.9184287, 0.3799769, 0.04460419, 0.8941177, 1, 0, 1,
-0.9073496, -0.5861639, -1.526916, 0.8901961, 1, 0, 1,
-0.9071999, 0.3681393, 0.05994909, 0.8823529, 1, 0, 1,
-0.9068297, 1.355395, -0.08352175, 0.8784314, 1, 0, 1,
-0.8971827, -1.396418, -1.302721, 0.8705882, 1, 0, 1,
-0.8948739, -0.8707916, -3.172697, 0.8666667, 1, 0, 1,
-0.892902, -1.884254, -1.977015, 0.8588235, 1, 0, 1,
-0.8891423, -0.8873489, -3.934313, 0.854902, 1, 0, 1,
-0.8821194, -0.5652639, -1.663361, 0.8470588, 1, 0, 1,
-0.8789999, 0.879338, -0.1039101, 0.8431373, 1, 0, 1,
-0.8770134, 0.6994819, -0.6115984, 0.8352941, 1, 0, 1,
-0.8769341, 0.5459248, -3.096765, 0.8313726, 1, 0, 1,
-0.8698704, -0.05758028, -0.7039909, 0.8235294, 1, 0, 1,
-0.8688705, -2.580448, -1.334269, 0.8196079, 1, 0, 1,
-0.8602816, -0.6513708, -0.9334946, 0.8117647, 1, 0, 1,
-0.8565903, -0.06332135, -1.10779, 0.8078431, 1, 0, 1,
-0.8542994, -0.5027984, -1.446812, 0.8, 1, 0, 1,
-0.8525341, -0.9347013, -2.319112, 0.7921569, 1, 0, 1,
-0.8506295, 1.339134, -0.135684, 0.7882353, 1, 0, 1,
-0.8411515, -0.2491784, -1.054773, 0.7803922, 1, 0, 1,
-0.8404301, -0.3369018, -2.804589, 0.7764706, 1, 0, 1,
-0.8378959, -2.266444, -4.202512, 0.7686275, 1, 0, 1,
-0.8359256, 0.319581, -0.1759629, 0.7647059, 1, 0, 1,
-0.8347945, 0.1718401, -2.503378, 0.7568628, 1, 0, 1,
-0.8346915, -1.726163, -2.111771, 0.7529412, 1, 0, 1,
-0.833834, -0.2535388, -1.458706, 0.7450981, 1, 0, 1,
-0.8335648, 1.011763, -1.671032, 0.7411765, 1, 0, 1,
-0.8318549, -0.4053914, -0.5423525, 0.7333333, 1, 0, 1,
-0.8311586, -0.1193975, -4.829219, 0.7294118, 1, 0, 1,
-0.8311402, 0.9658696, -2.596952, 0.7215686, 1, 0, 1,
-0.8307434, -2.437372, -2.210268, 0.7176471, 1, 0, 1,
-0.8304362, 0.03655479, -0.534198, 0.7098039, 1, 0, 1,
-0.8256606, 0.02327263, -1.785277, 0.7058824, 1, 0, 1,
-0.8247666, 1.367397, -0.06743759, 0.6980392, 1, 0, 1,
-0.8217579, 0.07936002, -1.887859, 0.6901961, 1, 0, 1,
-0.8214774, -1.370396, -3.717345, 0.6862745, 1, 0, 1,
-0.8192027, -0.4209804, -2.130739, 0.6784314, 1, 0, 1,
-0.8184779, 0.257068, -0.009078433, 0.6745098, 1, 0, 1,
-0.816626, 0.2755551, -3.257048, 0.6666667, 1, 0, 1,
-0.8155249, 0.9773104, 0.9495522, 0.6627451, 1, 0, 1,
-0.8154243, -1.344983, -2.904494, 0.654902, 1, 0, 1,
-0.8143645, 1.187164, -0.144901, 0.6509804, 1, 0, 1,
-0.8093171, -0.06351, -1.276714, 0.6431373, 1, 0, 1,
-0.8089032, -1.673101, -2.973271, 0.6392157, 1, 0, 1,
-0.8023763, -0.1651616, 0.02275781, 0.6313726, 1, 0, 1,
-0.8016068, -1.198038, -3.078283, 0.627451, 1, 0, 1,
-0.7939064, -0.5488177, -1.32128, 0.6196079, 1, 0, 1,
-0.7929705, -0.2005761, -1.747602, 0.6156863, 1, 0, 1,
-0.7852172, -0.2938535, -1.439138, 0.6078432, 1, 0, 1,
-0.7849626, 1.158155, -1.466327, 0.6039216, 1, 0, 1,
-0.784215, 0.486758, 0.9426952, 0.5960785, 1, 0, 1,
-0.7808427, 0.8478039, 0.08176508, 0.5882353, 1, 0, 1,
-0.7780828, 0.9558579, -0.9353083, 0.5843138, 1, 0, 1,
-0.7696227, 0.6950457, 0.2836153, 0.5764706, 1, 0, 1,
-0.7689176, -1.149887, -2.812851, 0.572549, 1, 0, 1,
-0.7687783, 0.8369994, -1.872957, 0.5647059, 1, 0, 1,
-0.7667993, 1.105446, 1.030657, 0.5607843, 1, 0, 1,
-0.7583822, 1.344205, -0.3652486, 0.5529412, 1, 0, 1,
-0.7581894, 0.9634809, -1.571112, 0.5490196, 1, 0, 1,
-0.7496975, 0.7049926, -2.518685, 0.5411765, 1, 0, 1,
-0.7489704, -1.012517, -2.586443, 0.5372549, 1, 0, 1,
-0.7469381, 0.2797727, -0.4013591, 0.5294118, 1, 0, 1,
-0.7454385, 1.478309, -1.866717, 0.5254902, 1, 0, 1,
-0.7352027, 0.7262458, 0.2631131, 0.5176471, 1, 0, 1,
-0.7263143, -0.3005137, -2.209449, 0.5137255, 1, 0, 1,
-0.7244121, -0.02873271, -2.155339, 0.5058824, 1, 0, 1,
-0.7202276, 0.433535, -1.825052, 0.5019608, 1, 0, 1,
-0.7149069, 2.404222, 2.217453, 0.4941176, 1, 0, 1,
-0.7091834, -0.2439768, -1.632131, 0.4862745, 1, 0, 1,
-0.7051625, -0.06771307, -0.3724474, 0.4823529, 1, 0, 1,
-0.7051208, -0.4813995, -1.093968, 0.4745098, 1, 0, 1,
-0.7036086, -1.053055, -2.667444, 0.4705882, 1, 0, 1,
-0.7020512, -0.1683063, -0.1099565, 0.4627451, 1, 0, 1,
-0.701115, 0.6095988, -0.4671845, 0.4588235, 1, 0, 1,
-0.6980902, -1.949176, -1.942664, 0.4509804, 1, 0, 1,
-0.6891441, 1.402852, 0.3472314, 0.4470588, 1, 0, 1,
-0.6750898, -0.3069855, -2.868251, 0.4392157, 1, 0, 1,
-0.6749473, -0.826431, -0.1107275, 0.4352941, 1, 0, 1,
-0.6724371, 0.9059803, -1.168178, 0.427451, 1, 0, 1,
-0.6649193, 1.121394, 0.07487546, 0.4235294, 1, 0, 1,
-0.6624244, -0.8138916, -2.917442, 0.4156863, 1, 0, 1,
-0.6623852, 0.04390913, -0.9646747, 0.4117647, 1, 0, 1,
-0.6591833, -1.350697, -4.697775, 0.4039216, 1, 0, 1,
-0.6565257, 0.1228782, -1.919701, 0.3960784, 1, 0, 1,
-0.6552488, 1.975883, 0.05371045, 0.3921569, 1, 0, 1,
-0.6546999, -0.352435, -1.753695, 0.3843137, 1, 0, 1,
-0.6516831, -0.5912894, -1.929068, 0.3803922, 1, 0, 1,
-0.6496502, 0.4943967, -2.288249, 0.372549, 1, 0, 1,
-0.6489168, 0.2529329, -1.643814, 0.3686275, 1, 0, 1,
-0.6420875, -0.2883646, -2.449567, 0.3607843, 1, 0, 1,
-0.6328154, 2.516808, 0.5533432, 0.3568628, 1, 0, 1,
-0.631144, -0.7754685, -1.46238, 0.3490196, 1, 0, 1,
-0.6302129, -0.7403529, -1.878486, 0.345098, 1, 0, 1,
-0.6250563, 0.2422239, -1.278381, 0.3372549, 1, 0, 1,
-0.6220919, 0.5060578, -0.4826746, 0.3333333, 1, 0, 1,
-0.6186733, 2.797278, 1.981735, 0.3254902, 1, 0, 1,
-0.6153066, -0.3500917, -3.618081, 0.3215686, 1, 0, 1,
-0.6125822, 0.1845439, -0.4280397, 0.3137255, 1, 0, 1,
-0.61048, 0.903653, 0.09888784, 0.3098039, 1, 0, 1,
-0.6082672, -0.3011445, -1.351944, 0.3019608, 1, 0, 1,
-0.6013199, -0.2861001, -2.254972, 0.2941177, 1, 0, 1,
-0.6006774, -0.7412683, -0.3016062, 0.2901961, 1, 0, 1,
-0.5986582, -0.2452073, -3.159086, 0.282353, 1, 0, 1,
-0.5958743, 2.932174, 0.09574995, 0.2784314, 1, 0, 1,
-0.59342, 3.212528, -0.6650694, 0.2705882, 1, 0, 1,
-0.5927674, -0.5307696, -3.424487, 0.2666667, 1, 0, 1,
-0.5908217, -0.5788704, -3.747934, 0.2588235, 1, 0, 1,
-0.5905379, -0.1145931, -0.9333116, 0.254902, 1, 0, 1,
-0.5905071, 0.5573965, -1.887668, 0.2470588, 1, 0, 1,
-0.5871434, 1.511286, 0.07345144, 0.2431373, 1, 0, 1,
-0.5862644, -0.2798993, -2.586096, 0.2352941, 1, 0, 1,
-0.5793251, -1.589632, -5.146798, 0.2313726, 1, 0, 1,
-0.5786198, 0.8918251, -0.5550429, 0.2235294, 1, 0, 1,
-0.5778287, -0.721203, -1.021631, 0.2196078, 1, 0, 1,
-0.572614, -0.3757762, -1.724079, 0.2117647, 1, 0, 1,
-0.5663132, 0.5074666, -2.606396, 0.2078431, 1, 0, 1,
-0.5654448, 1.236802, -2.034014, 0.2, 1, 0, 1,
-0.5645211, 0.833932, -1.011277, 0.1921569, 1, 0, 1,
-0.5596151, -0.2326689, -1.762857, 0.1882353, 1, 0, 1,
-0.5565617, -0.6034984, -3.071248, 0.1803922, 1, 0, 1,
-0.5540863, 0.5780385, -0.6045454, 0.1764706, 1, 0, 1,
-0.5521747, 3.194706, 0.6482212, 0.1686275, 1, 0, 1,
-0.552048, 1.970073, -0.592006, 0.1647059, 1, 0, 1,
-0.549942, 0.9109179, -2.925884, 0.1568628, 1, 0, 1,
-0.5474313, 0.1932998, -1.040731, 0.1529412, 1, 0, 1,
-0.535715, -0.3996061, -2.307712, 0.145098, 1, 0, 1,
-0.535168, 0.9846744, -1.0145, 0.1411765, 1, 0, 1,
-0.5325074, 1.927976, -1.26103, 0.1333333, 1, 0, 1,
-0.5282081, -1.571181, -4.158431, 0.1294118, 1, 0, 1,
-0.5281185, -0.7091825, -1.816414, 0.1215686, 1, 0, 1,
-0.527548, 0.1903993, -1.939297, 0.1176471, 1, 0, 1,
-0.5243954, -0.4289553, -4.30432, 0.1098039, 1, 0, 1,
-0.5200043, 0.5253167, -0.07596269, 0.1058824, 1, 0, 1,
-0.5196093, 0.03113502, -1.12279, 0.09803922, 1, 0, 1,
-0.5175136, -0.5698684, -2.155426, 0.09019608, 1, 0, 1,
-0.515881, 0.277723, -1.955771, 0.08627451, 1, 0, 1,
-0.5142458, -1.436463, -3.44992, 0.07843138, 1, 0, 1,
-0.5095416, 0.6784698, 0.2790569, 0.07450981, 1, 0, 1,
-0.5007104, 1.653098, 1.017119, 0.06666667, 1, 0, 1,
-0.5005267, -0.2842008, -3.698947, 0.0627451, 1, 0, 1,
-0.4960293, 0.8942953, 0.1709815, 0.05490196, 1, 0, 1,
-0.4912862, 0.9665068, -1.871744, 0.05098039, 1, 0, 1,
-0.4868868, 0.9198476, -0.3853805, 0.04313726, 1, 0, 1,
-0.4864527, 1.099276, -0.9203308, 0.03921569, 1, 0, 1,
-0.4847244, 0.180311, 0.4008559, 0.03137255, 1, 0, 1,
-0.4830395, 1.22873, -1.019232, 0.02745098, 1, 0, 1,
-0.4812795, 0.9568021, -1.30904, 0.01960784, 1, 0, 1,
-0.4801959, 0.008599561, -3.4655, 0.01568628, 1, 0, 1,
-0.476841, 0.6999638, -0.8315208, 0.007843138, 1, 0, 1,
-0.4763145, -1.416593, -3.818955, 0.003921569, 1, 0, 1,
-0.4747722, -0.8374666, -3.081027, 0, 1, 0.003921569, 1,
-0.4740196, 0.3161275, 0.4503466, 0, 1, 0.01176471, 1,
-0.4698828, 1.379063, -0.6018231, 0, 1, 0.01568628, 1,
-0.4677193, 0.724241, 0.1542307, 0, 1, 0.02352941, 1,
-0.4626873, 0.8524669, -0.6236548, 0, 1, 0.02745098, 1,
-0.4620699, 0.7543519, 0.9484528, 0, 1, 0.03529412, 1,
-0.4599459, -0.2686584, -2.252761, 0, 1, 0.03921569, 1,
-0.4594341, 0.7173638, -0.4077764, 0, 1, 0.04705882, 1,
-0.4587932, 0.3962839, -1.386547, 0, 1, 0.05098039, 1,
-0.4578382, -0.7081949, -2.901589, 0, 1, 0.05882353, 1,
-0.4561646, 1.525617, 0.3363905, 0, 1, 0.0627451, 1,
-0.4524117, -1.472573, -2.647626, 0, 1, 0.07058824, 1,
-0.4511814, -0.7924913, -3.174537, 0, 1, 0.07450981, 1,
-0.4499364, -0.8230376, -2.960277, 0, 1, 0.08235294, 1,
-0.4492587, -1.192555, -1.976088, 0, 1, 0.08627451, 1,
-0.4492206, 0.2814216, -0.4674929, 0, 1, 0.09411765, 1,
-0.4479689, 1.335738, 0.6446284, 0, 1, 0.1019608, 1,
-0.4474659, 0.803512, -0.8906507, 0, 1, 0.1058824, 1,
-0.4443141, 1.501675, -0.7245507, 0, 1, 0.1137255, 1,
-0.4427284, 0.3300908, -0.6007677, 0, 1, 0.1176471, 1,
-0.4413429, -1.606961, -3.226069, 0, 1, 0.1254902, 1,
-0.4385451, 0.7747065, 0.3527471, 0, 1, 0.1294118, 1,
-0.4382466, -0.7564593, -1.914639, 0, 1, 0.1372549, 1,
-0.4349028, -0.4446833, -4.963646, 0, 1, 0.1411765, 1,
-0.427421, -0.4237952, -2.374106, 0, 1, 0.1490196, 1,
-0.4200404, -0.3898264, -2.470639, 0, 1, 0.1529412, 1,
-0.4196833, 0.4416467, -1.579123, 0, 1, 0.1607843, 1,
-0.4186072, 0.3806043, -1.429825, 0, 1, 0.1647059, 1,
-0.4120589, -0.5338529, -2.063398, 0, 1, 0.172549, 1,
-0.4082974, -0.07884052, -0.2533181, 0, 1, 0.1764706, 1,
-0.4045887, 0.07875625, -1.659455, 0, 1, 0.1843137, 1,
-0.4036212, -1.225244, -1.854744, 0, 1, 0.1882353, 1,
-0.3944632, 0.2643151, -0.667206, 0, 1, 0.1960784, 1,
-0.392516, 2.553725, 1.018888, 0, 1, 0.2039216, 1,
-0.3918073, 0.728933, -1.204516, 0, 1, 0.2078431, 1,
-0.3885371, 0.4528432, 0.8359106, 0, 1, 0.2156863, 1,
-0.3870206, 1.235998, -0.1162059, 0, 1, 0.2196078, 1,
-0.3856208, -0.7907388, -1.151044, 0, 1, 0.227451, 1,
-0.3853666, 0.0438889, -1.567829, 0, 1, 0.2313726, 1,
-0.3850333, -1.236379, -3.659221, 0, 1, 0.2392157, 1,
-0.3841843, 0.5285745, -0.6204769, 0, 1, 0.2431373, 1,
-0.3803846, 1.59117, -0.7279988, 0, 1, 0.2509804, 1,
-0.3794911, -0.5012137, -3.216558, 0, 1, 0.254902, 1,
-0.3735545, 1.103481, -0.7997286, 0, 1, 0.2627451, 1,
-0.3731219, -0.1278905, -2.826252, 0, 1, 0.2666667, 1,
-0.3720927, -2.416646, -3.010656, 0, 1, 0.2745098, 1,
-0.3687012, 0.1486551, -1.300921, 0, 1, 0.2784314, 1,
-0.3682632, -0.7164891, -2.905814, 0, 1, 0.2862745, 1,
-0.3669178, 0.7160825, -0.6231933, 0, 1, 0.2901961, 1,
-0.3647642, -0.5451518, -2.045757, 0, 1, 0.2980392, 1,
-0.3646551, -1.441606, -2.640417, 0, 1, 0.3058824, 1,
-0.3525666, 0.2360364, -1.936595, 0, 1, 0.3098039, 1,
-0.3490184, -0.9596453, -1.927327, 0, 1, 0.3176471, 1,
-0.344651, -0.2727313, -2.790219, 0, 1, 0.3215686, 1,
-0.3426208, -1.955272, -0.9481221, 0, 1, 0.3294118, 1,
-0.339771, 0.9971232, 0.6080813, 0, 1, 0.3333333, 1,
-0.3384871, -0.2122559, -1.960193, 0, 1, 0.3411765, 1,
-0.335584, -1.548769, -3.238298, 0, 1, 0.345098, 1,
-0.3343949, -0.2329489, -3.105653, 0, 1, 0.3529412, 1,
-0.3334005, 0.7147662, -0.3524697, 0, 1, 0.3568628, 1,
-0.3328714, -0.576635, -3.263839, 0, 1, 0.3647059, 1,
-0.3318277, -0.5064682, -2.354346, 0, 1, 0.3686275, 1,
-0.3307989, 1.865859, 0.4536473, 0, 1, 0.3764706, 1,
-0.3210742, 0.1123733, -2.036787, 0, 1, 0.3803922, 1,
-0.3181778, 0.3612979, -0.9781125, 0, 1, 0.3882353, 1,
-0.3177886, 0.1456937, -1.138018, 0, 1, 0.3921569, 1,
-0.3173684, -0.02190381, -1.754948, 0, 1, 0.4, 1,
-0.3171225, -0.007624266, -1.233811, 0, 1, 0.4078431, 1,
-0.3147117, -1.653436, -2.594528, 0, 1, 0.4117647, 1,
-0.312765, 0.03092177, -2.060327, 0, 1, 0.4196078, 1,
-0.3071762, -0.5176969, -3.469982, 0, 1, 0.4235294, 1,
-0.3068682, -0.2174628, -2.861002, 0, 1, 0.4313726, 1,
-0.3047092, -0.2073189, -1.420711, 0, 1, 0.4352941, 1,
-0.3014183, -0.2793178, -2.594743, 0, 1, 0.4431373, 1,
-0.2967087, -1.597173, -1.469383, 0, 1, 0.4470588, 1,
-0.2951497, 1.144121, -2.78145, 0, 1, 0.454902, 1,
-0.2944176, 0.8345723, -0.7246182, 0, 1, 0.4588235, 1,
-0.2908767, -0.4547536, -1.205384, 0, 1, 0.4666667, 1,
-0.2870726, -0.1373219, -2.922014, 0, 1, 0.4705882, 1,
-0.2853653, -0.295532, -1.712524, 0, 1, 0.4784314, 1,
-0.2852109, -0.09878224, -2.802619, 0, 1, 0.4823529, 1,
-0.2845639, -0.2577083, -0.8052222, 0, 1, 0.4901961, 1,
-0.2835317, 0.4856531, -0.5351406, 0, 1, 0.4941176, 1,
-0.2802387, 0.6721796, -0.1786642, 0, 1, 0.5019608, 1,
-0.2789473, 1.126686, 0.3420873, 0, 1, 0.509804, 1,
-0.2765905, -1.17362, -2.353193, 0, 1, 0.5137255, 1,
-0.2712909, 0.3678438, 0.3485831, 0, 1, 0.5215687, 1,
-0.2679528, 0.4675568, -2.142189, 0, 1, 0.5254902, 1,
-0.2649382, 1.187897, 1.177879, 0, 1, 0.5333334, 1,
-0.263763, -1.065853, -3.837384, 0, 1, 0.5372549, 1,
-0.2637576, -0.3455184, -2.394543, 0, 1, 0.5450981, 1,
-0.261048, 1.18845, -0.9247572, 0, 1, 0.5490196, 1,
-0.2587297, -0.3792435, -1.673889, 0, 1, 0.5568628, 1,
-0.2582336, -0.5575712, -2.168851, 0, 1, 0.5607843, 1,
-0.2555864, 0.416323, -0.8528211, 0, 1, 0.5686275, 1,
-0.2539146, 0.3361843, -0.8823584, 0, 1, 0.572549, 1,
-0.2529503, 1.285962, -1.823999, 0, 1, 0.5803922, 1,
-0.2526889, -0.5826508, -1.795586, 0, 1, 0.5843138, 1,
-0.2514064, -1.196641, -2.891824, 0, 1, 0.5921569, 1,
-0.2501807, -0.9648466, -2.225693, 0, 1, 0.5960785, 1,
-0.2490625, 1.99028, -0.7766327, 0, 1, 0.6039216, 1,
-0.2490147, -0.9795756, -4.307278, 0, 1, 0.6117647, 1,
-0.2458106, -1.180232, -4.288166, 0, 1, 0.6156863, 1,
-0.2439682, -0.07470373, -2.079305, 0, 1, 0.6235294, 1,
-0.2427754, 1.69047, 0.2931572, 0, 1, 0.627451, 1,
-0.2352047, -0.07221063, -1.294593, 0, 1, 0.6352941, 1,
-0.2332564, -0.8436804, -3.325547, 0, 1, 0.6392157, 1,
-0.2319075, -0.9744357, -2.153591, 0, 1, 0.6470588, 1,
-0.2280118, -0.03089549, -2.191017, 0, 1, 0.6509804, 1,
-0.2268374, -1.630718, -3.933126, 0, 1, 0.6588235, 1,
-0.2246258, -0.1239666, -2.156185, 0, 1, 0.6627451, 1,
-0.2242427, 0.2264931, -2.494423, 0, 1, 0.6705883, 1,
-0.2193051, 0.4944136, 0.2441532, 0, 1, 0.6745098, 1,
-0.2166303, -0.1707928, -4.009276, 0, 1, 0.682353, 1,
-0.2119403, 0.3930428, -1.620069, 0, 1, 0.6862745, 1,
-0.2064893, 0.856968, -0.6505888, 0, 1, 0.6941177, 1,
-0.2048267, 2.318451, 0.001894895, 0, 1, 0.7019608, 1,
-0.2032239, 0.6100031, 0.6890506, 0, 1, 0.7058824, 1,
-0.2021597, 0.2618446, 0.215885, 0, 1, 0.7137255, 1,
-0.2005063, -1.579386, -2.530853, 0, 1, 0.7176471, 1,
-0.2003533, -1.538518, -2.211725, 0, 1, 0.7254902, 1,
-0.1970624, -0.5494031, -2.610165, 0, 1, 0.7294118, 1,
-0.1967883, 0.5330889, -0.6074839, 0, 1, 0.7372549, 1,
-0.1914202, -1.56752, -4.890969, 0, 1, 0.7411765, 1,
-0.190116, -2.082828, -3.765969, 0, 1, 0.7490196, 1,
-0.1841881, 1.760732, 0.9310558, 0, 1, 0.7529412, 1,
-0.1814875, -0.8227034, -1.745538, 0, 1, 0.7607843, 1,
-0.1779159, -0.1334323, -2.170177, 0, 1, 0.7647059, 1,
-0.1774135, -1.545932, -4.063259, 0, 1, 0.772549, 1,
-0.1769148, -1.510224, -2.745403, 0, 1, 0.7764706, 1,
-0.1740231, -0.239093, -2.452614, 0, 1, 0.7843137, 1,
-0.1734075, -1.129575, -3.007826, 0, 1, 0.7882353, 1,
-0.1693519, 0.1427171, -2.125404, 0, 1, 0.7960784, 1,
-0.1689432, -0.1137329, -1.273434, 0, 1, 0.8039216, 1,
-0.1665863, 0.06068202, -1.772569, 0, 1, 0.8078431, 1,
-0.1664082, 1.634611, -0.6286128, 0, 1, 0.8156863, 1,
-0.1601532, 0.08966371, -0.548622, 0, 1, 0.8196079, 1,
-0.1597093, -0.5429557, -2.480238, 0, 1, 0.827451, 1,
-0.1570574, 0.6346588, -1.727634, 0, 1, 0.8313726, 1,
-0.1570135, -0.3900539, -3.414509, 0, 1, 0.8392157, 1,
-0.1561818, 0.01878692, -2.213374, 0, 1, 0.8431373, 1,
-0.1552005, 0.4877641, 0.4773509, 0, 1, 0.8509804, 1,
-0.155018, 0.5604718, -0.1166785, 0, 1, 0.854902, 1,
-0.151288, -0.3550008, -3.520295, 0, 1, 0.8627451, 1,
-0.1505655, 1.12254, 1.39825, 0, 1, 0.8666667, 1,
-0.1474997, 1.47588, -0.1794147, 0, 1, 0.8745098, 1,
-0.1472814, -0.1529718, -2.359504, 0, 1, 0.8784314, 1,
-0.1469555, 0.5606899, -0.05047443, 0, 1, 0.8862745, 1,
-0.1468234, 0.8564056, -1.474904, 0, 1, 0.8901961, 1,
-0.1391285, -1.225116, -2.843853, 0, 1, 0.8980392, 1,
-0.1330211, 0.8105015, -0.891176, 0, 1, 0.9058824, 1,
-0.1304204, -0.09032603, -1.996615, 0, 1, 0.9098039, 1,
-0.1286253, -2.025648, -3.44378, 0, 1, 0.9176471, 1,
-0.1282236, -0.4491119, -3.901263, 0, 1, 0.9215686, 1,
-0.1252349, 0.01131545, -2.418235, 0, 1, 0.9294118, 1,
-0.1222937, 0.1316051, 0.8146217, 0, 1, 0.9333333, 1,
-0.1211078, -1.288582, -3.210521, 0, 1, 0.9411765, 1,
-0.1133783, -1.302355, -1.969863, 0, 1, 0.945098, 1,
-0.1063681, -1.652584, -3.425838, 0, 1, 0.9529412, 1,
-0.1030669, 0.7016057, 0.06487232, 0, 1, 0.9568627, 1,
-0.09895987, -1.251377, -2.478379, 0, 1, 0.9647059, 1,
-0.0894837, -0.5986834, -2.138483, 0, 1, 0.9686275, 1,
-0.08923598, -0.2847289, -2.428672, 0, 1, 0.9764706, 1,
-0.08805466, 0.5535765, -0.3221141, 0, 1, 0.9803922, 1,
-0.08507589, -0.8197194, -5.267103, 0, 1, 0.9882353, 1,
-0.07806661, -0.5590292, -5.127226, 0, 1, 0.9921569, 1,
-0.07646659, -0.6207895, -1.954335, 0, 1, 1, 1,
-0.07607049, 0.3039509, -1.632221, 0, 0.9921569, 1, 1,
-0.06904958, 0.06709717, -2.33237, 0, 0.9882353, 1, 1,
-0.06868044, 0.8841866, -1.943799, 0, 0.9803922, 1, 1,
-0.06532402, -0.4726149, -3.473889, 0, 0.9764706, 1, 1,
-0.06292688, -2.236687, -3.569872, 0, 0.9686275, 1, 1,
-0.06110975, -0.9164521, -3.301604, 0, 0.9647059, 1, 1,
-0.06104581, 0.1416633, 0.8301435, 0, 0.9568627, 1, 1,
-0.06031229, -1.010661, -4.003274, 0, 0.9529412, 1, 1,
-0.06019041, 3.021781, -0.1513862, 0, 0.945098, 1, 1,
-0.05364275, -0.2796004, -2.311104, 0, 0.9411765, 1, 1,
-0.05347104, -1.292318, -2.20493, 0, 0.9333333, 1, 1,
-0.05253987, -0.3013406, -3.986768, 0, 0.9294118, 1, 1,
-0.05206612, 1.267464, 0.8726121, 0, 0.9215686, 1, 1,
-0.05180095, -0.2548771, -1.185889, 0, 0.9176471, 1, 1,
-0.04878308, 0.667559, 0.2431094, 0, 0.9098039, 1, 1,
-0.0444974, 0.2166584, -0.1300498, 0, 0.9058824, 1, 1,
-0.04377347, 0.1995351, 0.1359512, 0, 0.8980392, 1, 1,
-0.04344061, -1.676764, -6.152437, 0, 0.8901961, 1, 1,
-0.04278532, 1.707113, 1.030735, 0, 0.8862745, 1, 1,
-0.04084362, 0.5064387, 1.277867, 0, 0.8784314, 1, 1,
-0.03311097, -0.3161864, -2.8141, 0, 0.8745098, 1, 1,
-0.03153314, -0.8361883, -2.944763, 0, 0.8666667, 1, 1,
-0.03146173, 0.2021996, 0.7857246, 0, 0.8627451, 1, 1,
-0.02986117, -0.300155, -2.96441, 0, 0.854902, 1, 1,
-0.02930657, 0.41208, 0.8213544, 0, 0.8509804, 1, 1,
-0.02824855, 1.893466, 0.2753477, 0, 0.8431373, 1, 1,
-0.02555556, 2.076236, 1.10332, 0, 0.8392157, 1, 1,
-0.02282602, 0.9515766, 1.17192, 0, 0.8313726, 1, 1,
-0.02094288, 0.2551772, 0.8891788, 0, 0.827451, 1, 1,
-0.0184665, -0.8209121, -3.637149, 0, 0.8196079, 1, 1,
-0.01826313, 0.8636956, -0.3730887, 0, 0.8156863, 1, 1,
-0.01336947, -0.1018887, -3.406673, 0, 0.8078431, 1, 1,
-0.01209502, -1.557961, -3.941202, 0, 0.8039216, 1, 1,
-0.006759583, -1.43314, -4.053113, 0, 0.7960784, 1, 1,
-8.291223e-05, 0.6099071, -1.321996, 0, 0.7882353, 1, 1,
0.0001890342, 0.324167, -1.359159, 0, 0.7843137, 1, 1,
0.0006236481, 0.1170871, 1.31874, 0, 0.7764706, 1, 1,
0.002079799, -0.825014, 3.137324, 0, 0.772549, 1, 1,
0.003046326, 0.1087692, 0.03627918, 0, 0.7647059, 1, 1,
0.003836432, 1.181266, -0.09491979, 0, 0.7607843, 1, 1,
0.01867746, -0.5689017, 4.104239, 0, 0.7529412, 1, 1,
0.02382525, 0.2182504, -1.314672, 0, 0.7490196, 1, 1,
0.02420953, 0.1566588, 0.9059127, 0, 0.7411765, 1, 1,
0.0259355, -0.02765624, 3.820596, 0, 0.7372549, 1, 1,
0.03113174, 1.825123, 0.1794353, 0, 0.7294118, 1, 1,
0.031239, 1.293902, 0.6799458, 0, 0.7254902, 1, 1,
0.03386314, -0.1038957, 1.936422, 0, 0.7176471, 1, 1,
0.03531801, -1.579877, 5.571333, 0, 0.7137255, 1, 1,
0.03801102, -1.066224, 3.492456, 0, 0.7058824, 1, 1,
0.03843581, 1.149599, 0.1615724, 0, 0.6980392, 1, 1,
0.04228711, 0.2921942, 0.1985718, 0, 0.6941177, 1, 1,
0.04284783, -1.410337, 2.606982, 0, 0.6862745, 1, 1,
0.05010429, -0.5394734, 4.101451, 0, 0.682353, 1, 1,
0.05271588, -0.6873404, 2.606299, 0, 0.6745098, 1, 1,
0.05344448, -0.3838391, 2.567759, 0, 0.6705883, 1, 1,
0.06878323, 0.2270266, -0.2977636, 0, 0.6627451, 1, 1,
0.07039946, 0.6326118, -0.5357102, 0, 0.6588235, 1, 1,
0.07047813, 0.5003716, 2.210485, 0, 0.6509804, 1, 1,
0.07545082, -0.04582728, 2.834537, 0, 0.6470588, 1, 1,
0.07716899, -0.3087944, 0.9385371, 0, 0.6392157, 1, 1,
0.08177574, -0.5956844, 3.571763, 0, 0.6352941, 1, 1,
0.08249584, 1.553889, -0.6602128, 0, 0.627451, 1, 1,
0.08453381, -0.9083323, 0.4607755, 0, 0.6235294, 1, 1,
0.08654249, 1.658388, -0.4884205, 0, 0.6156863, 1, 1,
0.0871972, -0.3454527, 2.674648, 0, 0.6117647, 1, 1,
0.087961, -0.922116, 1.612775, 0, 0.6039216, 1, 1,
0.08870012, -0.3612623, 2.131746, 0, 0.5960785, 1, 1,
0.09027293, 1.664384, 1.252997, 0, 0.5921569, 1, 1,
0.0919467, 0.614296, 0.894786, 0, 0.5843138, 1, 1,
0.092626, -0.6033303, 3.657208, 0, 0.5803922, 1, 1,
0.09372125, -0.1203672, 2.467029, 0, 0.572549, 1, 1,
0.09485561, 0.8023207, 1.096573, 0, 0.5686275, 1, 1,
0.1029656, -0.2345169, 3.534309, 0, 0.5607843, 1, 1,
0.1032293, 0.9799151, -0.9065241, 0, 0.5568628, 1, 1,
0.1052314, 0.6643009, 0.5474503, 0, 0.5490196, 1, 1,
0.1060068, -1.948151, 2.741874, 0, 0.5450981, 1, 1,
0.1077766, 0.4988937, 0.2294238, 0, 0.5372549, 1, 1,
0.1079108, 0.3541179, -0.120438, 0, 0.5333334, 1, 1,
0.1080177, -0.43205, 3.727893, 0, 0.5254902, 1, 1,
0.1093975, -0.5546658, 2.037241, 0, 0.5215687, 1, 1,
0.1108891, 1.368151, 0.3944532, 0, 0.5137255, 1, 1,
0.1119563, -0.8995252, 2.973811, 0, 0.509804, 1, 1,
0.1238673, -0.8313543, 3.398581, 0, 0.5019608, 1, 1,
0.1246273, -0.2674243, 3.299453, 0, 0.4941176, 1, 1,
0.1253674, 0.446606, -0.1272542, 0, 0.4901961, 1, 1,
0.1279908, 0.3857342, 1.813694, 0, 0.4823529, 1, 1,
0.1336136, 1.156736, 0.8443842, 0, 0.4784314, 1, 1,
0.133744, 0.9083533, -1.509862, 0, 0.4705882, 1, 1,
0.1460557, 0.8477879, -1.277048, 0, 0.4666667, 1, 1,
0.1514282, 0.6338145, -0.8516517, 0, 0.4588235, 1, 1,
0.1557914, 0.4449251, 0.005581024, 0, 0.454902, 1, 1,
0.1558793, -1.275128, 3.017097, 0, 0.4470588, 1, 1,
0.1663356, -0.6329994, 4.215042, 0, 0.4431373, 1, 1,
0.1688901, -0.4036317, 2.337553, 0, 0.4352941, 1, 1,
0.169333, -0.6420439, 2.548646, 0, 0.4313726, 1, 1,
0.173946, 0.8100868, -2.244979, 0, 0.4235294, 1, 1,
0.1811437, -0.7550175, 3.775278, 0, 0.4196078, 1, 1,
0.1815077, 0.9629804, 0.3845225, 0, 0.4117647, 1, 1,
0.1881109, -0.3961148, 2.955195, 0, 0.4078431, 1, 1,
0.1894299, 0.05501856, -0.04738356, 0, 0.4, 1, 1,
0.1896552, 1.086018, 0.774215, 0, 0.3921569, 1, 1,
0.1902399, 2.042151, 0.09011891, 0, 0.3882353, 1, 1,
0.1902545, -1.328323, 3.840375, 0, 0.3803922, 1, 1,
0.1943331, -0.724023, 1.786967, 0, 0.3764706, 1, 1,
0.1994987, 2.521199, 0.6386974, 0, 0.3686275, 1, 1,
0.2061547, -1.668016, 2.167968, 0, 0.3647059, 1, 1,
0.2062955, -1.04692, 3.473256, 0, 0.3568628, 1, 1,
0.2078086, 1.736267, 0.4421477, 0, 0.3529412, 1, 1,
0.2098258, 2.446401, -0.08497565, 0, 0.345098, 1, 1,
0.2104071, 0.2729468, 1.210415, 0, 0.3411765, 1, 1,
0.2137583, 1.071352, -1.358039, 0, 0.3333333, 1, 1,
0.2164327, -0.7811738, 4.019421, 0, 0.3294118, 1, 1,
0.2228629, 0.1447681, 0.3868344, 0, 0.3215686, 1, 1,
0.2242914, 0.279664, 1.711844, 0, 0.3176471, 1, 1,
0.227458, -0.4734768, 2.032549, 0, 0.3098039, 1, 1,
0.2336044, 0.8494583, 0.4290877, 0, 0.3058824, 1, 1,
0.2349589, 1.071718, 0.2151502, 0, 0.2980392, 1, 1,
0.2396282, 0.03249422, 1.367801, 0, 0.2901961, 1, 1,
0.2410321, -0.6742392, 2.025563, 0, 0.2862745, 1, 1,
0.2416811, 1.131303, 0.3953259, 0, 0.2784314, 1, 1,
0.2460594, -1.170594, 3.421956, 0, 0.2745098, 1, 1,
0.2581, 0.9965269, 1.400186, 0, 0.2666667, 1, 1,
0.2583736, -0.830537, 1.980605, 0, 0.2627451, 1, 1,
0.2592529, -1.647678, 2.523094, 0, 0.254902, 1, 1,
0.2605609, -0.167227, 4.533494, 0, 0.2509804, 1, 1,
0.2613233, 0.9982243, -0.7519311, 0, 0.2431373, 1, 1,
0.2667861, 2.277218, 0.04420897, 0, 0.2392157, 1, 1,
0.2724322, 1.775735, 0.6121272, 0, 0.2313726, 1, 1,
0.2764242, -1.440551, 4.264167, 0, 0.227451, 1, 1,
0.2864985, -0.6443337, 3.932191, 0, 0.2196078, 1, 1,
0.2879318, 0.6320468, -1.546687, 0, 0.2156863, 1, 1,
0.2899131, -1.693357, 2.32681, 0, 0.2078431, 1, 1,
0.2937317, 0.3084809, -0.6144788, 0, 0.2039216, 1, 1,
0.2954742, -0.3148661, 2.138949, 0, 0.1960784, 1, 1,
0.3036115, -0.04000518, 2.035282, 0, 0.1882353, 1, 1,
0.3094296, 0.5484553, 0.3073461, 0, 0.1843137, 1, 1,
0.3094648, -0.8459905, 3.919757, 0, 0.1764706, 1, 1,
0.3106627, 0.8993957, 0.7681001, 0, 0.172549, 1, 1,
0.3110718, -0.7134037, 4.438318, 0, 0.1647059, 1, 1,
0.3160519, 0.2190937, -0.3599139, 0, 0.1607843, 1, 1,
0.316609, -0.5370772, 2.576661, 0, 0.1529412, 1, 1,
0.3196054, -1.683585, 5.065943, 0, 0.1490196, 1, 1,
0.321535, 1.638509, 0.5399984, 0, 0.1411765, 1, 1,
0.3220749, 0.1272434, 1.986269, 0, 0.1372549, 1, 1,
0.3239615, -0.9340755, 0.5786034, 0, 0.1294118, 1, 1,
0.3245244, -2.42444, 2.973704, 0, 0.1254902, 1, 1,
0.3249578, -0.1379224, 1.632322, 0, 0.1176471, 1, 1,
0.3249757, -3.036784, 5.683564, 0, 0.1137255, 1, 1,
0.3266605, -0.4362856, 2.560765, 0, 0.1058824, 1, 1,
0.3288039, -0.05741431, 1.619904, 0, 0.09803922, 1, 1,
0.3293946, -1.884273, 3.549412, 0, 0.09411765, 1, 1,
0.3325715, 0.2743773, 1.557856, 0, 0.08627451, 1, 1,
0.3359551, 1.62919, -2.158575, 0, 0.08235294, 1, 1,
0.3375049, 2.44974, -0.8546138, 0, 0.07450981, 1, 1,
0.3393334, 0.2655505, 0.3955711, 0, 0.07058824, 1, 1,
0.3434513, -0.7818257, 3.104074, 0, 0.0627451, 1, 1,
0.3457445, -0.4843626, 2.702826, 0, 0.05882353, 1, 1,
0.3460668, 0.04855141, 0.2626524, 0, 0.05098039, 1, 1,
0.350486, 1.361979, 0.1821313, 0, 0.04705882, 1, 1,
0.3528052, -0.7926818, 2.20929, 0, 0.03921569, 1, 1,
0.352847, 0.004473926, 3.327037, 0, 0.03529412, 1, 1,
0.3556584, -1.056895, 0.8254419, 0, 0.02745098, 1, 1,
0.3558977, -2.765981, 1.826187, 0, 0.02352941, 1, 1,
0.3608235, -0.7974945, 3.638415, 0, 0.01568628, 1, 1,
0.3609498, 0.07525208, -0.1047716, 0, 0.01176471, 1, 1,
0.3617999, 0.8502824, -0.4896563, 0, 0.003921569, 1, 1,
0.3625436, 1.183813, -0.699221, 0.003921569, 0, 1, 1,
0.3647812, 0.3891338, 1.435165, 0.007843138, 0, 1, 1,
0.3667792, 1.352918, -0.06658831, 0.01568628, 0, 1, 1,
0.3683764, -0.1074331, 2.735191, 0.01960784, 0, 1, 1,
0.3686532, 0.5455128, 1.22517, 0.02745098, 0, 1, 1,
0.3697908, -0.780865, 2.926083, 0.03137255, 0, 1, 1,
0.370172, 0.04250303, -0.09469872, 0.03921569, 0, 1, 1,
0.3732325, -1.115156, 1.625184, 0.04313726, 0, 1, 1,
0.3733868, 0.9138704, 0.5109601, 0.05098039, 0, 1, 1,
0.3749833, -0.3302792, 4.489436, 0.05490196, 0, 1, 1,
0.3799086, 1.048554, -0.5033886, 0.0627451, 0, 1, 1,
0.3810265, 0.2367672, 0.6135241, 0.06666667, 0, 1, 1,
0.3842108, 0.1807342, 1.130561, 0.07450981, 0, 1, 1,
0.3864495, 0.62246, 2.535441, 0.07843138, 0, 1, 1,
0.3875679, 0.06203381, 1.802199, 0.08627451, 0, 1, 1,
0.3876346, -0.2028761, 2.222971, 0.09019608, 0, 1, 1,
0.393425, -0.4415842, 1.877257, 0.09803922, 0, 1, 1,
0.3955015, 1.20781, -0.8386901, 0.1058824, 0, 1, 1,
0.3976554, -0.363871, 2.935162, 0.1098039, 0, 1, 1,
0.4030076, 2.165241, -1.34607, 0.1176471, 0, 1, 1,
0.4100472, 0.1092127, -0.3999283, 0.1215686, 0, 1, 1,
0.410133, 0.9009203, -0.5644653, 0.1294118, 0, 1, 1,
0.4118367, -0.4011765, 3.133396, 0.1333333, 0, 1, 1,
0.4149242, -1.097502, 1.778444, 0.1411765, 0, 1, 1,
0.4191725, 2.117261, -1.050621, 0.145098, 0, 1, 1,
0.4212145, -1.200848, 3.229465, 0.1529412, 0, 1, 1,
0.425406, 1.539841, -0.397728, 0.1568628, 0, 1, 1,
0.4265739, 0.2237979, 1.232806, 0.1647059, 0, 1, 1,
0.4276653, -1.16354, 2.926077, 0.1686275, 0, 1, 1,
0.4276726, -0.7865439, 3.410942, 0.1764706, 0, 1, 1,
0.4291417, 0.2499781, 0.8750281, 0.1803922, 0, 1, 1,
0.4441553, 1.709659, 0.7453586, 0.1882353, 0, 1, 1,
0.4449061, 0.3690278, -0.05698785, 0.1921569, 0, 1, 1,
0.4460172, -0.5387293, 1.872536, 0.2, 0, 1, 1,
0.4463323, 0.6545185, 1.280085, 0.2078431, 0, 1, 1,
0.4482602, -0.1187468, 3.034888, 0.2117647, 0, 1, 1,
0.4593296, -0.6524644, 3.843096, 0.2196078, 0, 1, 1,
0.4596838, -0.1416372, 1.65261, 0.2235294, 0, 1, 1,
0.4601581, -0.4449817, 0.6129709, 0.2313726, 0, 1, 1,
0.4637194, -0.7552359, 3.172325, 0.2352941, 0, 1, 1,
0.4787202, -1.496683, 3.784129, 0.2431373, 0, 1, 1,
0.483616, 0.1532093, 0.3441148, 0.2470588, 0, 1, 1,
0.4837142, -0.5230641, 1.956028, 0.254902, 0, 1, 1,
0.4840108, 1.906709, -0.7799709, 0.2588235, 0, 1, 1,
0.4849687, -0.5296546, 3.40004, 0.2666667, 0, 1, 1,
0.4893696, 0.5484222, 1.802565, 0.2705882, 0, 1, 1,
0.490682, 0.241353, -0.3261508, 0.2784314, 0, 1, 1,
0.4933014, 1.266721, 0.6856154, 0.282353, 0, 1, 1,
0.4971288, -0.1522948, 2.080219, 0.2901961, 0, 1, 1,
0.5046462, 0.6166082, 1.260244, 0.2941177, 0, 1, 1,
0.50748, 0.3079362, -0.0536008, 0.3019608, 0, 1, 1,
0.5094734, 0.3083691, -0.7322512, 0.3098039, 0, 1, 1,
0.5175449, 1.224713, 0.2127335, 0.3137255, 0, 1, 1,
0.5185607, -1.572127, 2.812519, 0.3215686, 0, 1, 1,
0.521658, -0.7729378, 2.526606, 0.3254902, 0, 1, 1,
0.5241429, 0.4478529, 0.3569978, 0.3333333, 0, 1, 1,
0.5292339, -0.7600989, 1.304219, 0.3372549, 0, 1, 1,
0.5294831, -0.4671114, 2.03703, 0.345098, 0, 1, 1,
0.5335515, 0.03554823, 1.968656, 0.3490196, 0, 1, 1,
0.5352714, -1.863819, 2.493033, 0.3568628, 0, 1, 1,
0.5372458, 0.470292, 1.130975, 0.3607843, 0, 1, 1,
0.5385005, 1.269594, 0.6887382, 0.3686275, 0, 1, 1,
0.5437037, 0.09214022, -0.1364275, 0.372549, 0, 1, 1,
0.5466028, 0.558378, 0.04482467, 0.3803922, 0, 1, 1,
0.5475104, 0.3528098, -0.637197, 0.3843137, 0, 1, 1,
0.54931, -0.5136847, 1.931041, 0.3921569, 0, 1, 1,
0.552502, -0.3986528, 3.702465, 0.3960784, 0, 1, 1,
0.5599288, 0.4503858, 0.3816493, 0.4039216, 0, 1, 1,
0.5607651, 0.509555, 0.3732563, 0.4117647, 0, 1, 1,
0.5617015, -0.9888156, 1.330306, 0.4156863, 0, 1, 1,
0.5666811, 0.2699079, 0.4915135, 0.4235294, 0, 1, 1,
0.5668857, -0.5592136, 2.653357, 0.427451, 0, 1, 1,
0.5740572, -0.2281085, 1.586691, 0.4352941, 0, 1, 1,
0.5769175, -1.173616, 2.574063, 0.4392157, 0, 1, 1,
0.5770729, -1.05296, 1.143439, 0.4470588, 0, 1, 1,
0.5816132, 0.8417658, 1.051909, 0.4509804, 0, 1, 1,
0.583126, -0.9623505, 3.677793, 0.4588235, 0, 1, 1,
0.5897855, -0.2735766, 2.836532, 0.4627451, 0, 1, 1,
0.5898378, -0.7896014, 1.956119, 0.4705882, 0, 1, 1,
0.5928476, 0.04949617, 0.2821723, 0.4745098, 0, 1, 1,
0.5975623, -0.4236834, 2.096504, 0.4823529, 0, 1, 1,
0.6005373, -1.865317, 2.631894, 0.4862745, 0, 1, 1,
0.6009495, 0.8820517, 2.271107, 0.4941176, 0, 1, 1,
0.6019039, -1.001481, 2.270085, 0.5019608, 0, 1, 1,
0.6025913, -0.004283093, 0.5075457, 0.5058824, 0, 1, 1,
0.6038123, -0.02353952, 2.809861, 0.5137255, 0, 1, 1,
0.6041717, 0.4633178, 1.454526, 0.5176471, 0, 1, 1,
0.6056387, 0.3407722, 0.01450152, 0.5254902, 0, 1, 1,
0.6092246, 0.7194579, 1.980258, 0.5294118, 0, 1, 1,
0.616272, 0.4554773, 0.9538749, 0.5372549, 0, 1, 1,
0.619269, 1.983539, 0.7230897, 0.5411765, 0, 1, 1,
0.62214, -0.9733959, 1.916018, 0.5490196, 0, 1, 1,
0.6245214, -1.4424, 3.599859, 0.5529412, 0, 1, 1,
0.6251447, 0.9841252, -0.5562897, 0.5607843, 0, 1, 1,
0.6263902, -1.642262, 5.239189, 0.5647059, 0, 1, 1,
0.6385068, 0.5091187, 1.633535, 0.572549, 0, 1, 1,
0.6407288, 2.126013, -1.647845, 0.5764706, 0, 1, 1,
0.6428217, -0.7886773, 4.21346, 0.5843138, 0, 1, 1,
0.6430618, -0.9492033, 1.556433, 0.5882353, 0, 1, 1,
0.6438962, -0.1677363, 0.965067, 0.5960785, 0, 1, 1,
0.6465308, 0.8417838, 2.20357, 0.6039216, 0, 1, 1,
0.6466396, -0.4892169, -0.3528821, 0.6078432, 0, 1, 1,
0.6475213, -1.537512, 3.725116, 0.6156863, 0, 1, 1,
0.6490859, 0.7433419, 0.5793327, 0.6196079, 0, 1, 1,
0.6507325, 2.208236, -0.6668078, 0.627451, 0, 1, 1,
0.6614669, -0.4921745, 3.276587, 0.6313726, 0, 1, 1,
0.662776, 0.07629408, 1.60831, 0.6392157, 0, 1, 1,
0.6632845, -0.7902631, 2.449892, 0.6431373, 0, 1, 1,
0.6656949, 0.701551, 1.533911, 0.6509804, 0, 1, 1,
0.6711445, 1.321642, 0.5986679, 0.654902, 0, 1, 1,
0.6717673, 0.664035, 0.05773676, 0.6627451, 0, 1, 1,
0.6725065, -0.7861681, 3.023549, 0.6666667, 0, 1, 1,
0.6735513, 0.4800159, 2.526882, 0.6745098, 0, 1, 1,
0.6812403, -0.3398915, 3.178295, 0.6784314, 0, 1, 1,
0.6828272, -1.169686, 1.088204, 0.6862745, 0, 1, 1,
0.6838651, 0.1492018, 0.4519153, 0.6901961, 0, 1, 1,
0.686944, 0.3805656, 2.089882, 0.6980392, 0, 1, 1,
0.6882424, 0.5680299, 2.168174, 0.7058824, 0, 1, 1,
0.6930298, 0.02197435, 2.702913, 0.7098039, 0, 1, 1,
0.6950567, -0.979987, 3.644589, 0.7176471, 0, 1, 1,
0.6954995, 0.7843358, 1.364204, 0.7215686, 0, 1, 1,
0.6963932, 2.088487, -0.2760746, 0.7294118, 0, 1, 1,
0.7001828, 0.1626532, 2.122536, 0.7333333, 0, 1, 1,
0.7016696, -0.443624, 2.206765, 0.7411765, 0, 1, 1,
0.7045751, 1.368403, 0.8379365, 0.7450981, 0, 1, 1,
0.7057459, -0.6453386, 2.265386, 0.7529412, 0, 1, 1,
0.7057681, -0.4536537, 3.050167, 0.7568628, 0, 1, 1,
0.7110448, 0.2240573, 1.02499, 0.7647059, 0, 1, 1,
0.7123265, -0.1900257, 1.174608, 0.7686275, 0, 1, 1,
0.7159802, -0.7623706, 1.612056, 0.7764706, 0, 1, 1,
0.7198992, -1.740307, 2.918182, 0.7803922, 0, 1, 1,
0.7221202, -1.189217, 2.683911, 0.7882353, 0, 1, 1,
0.7255374, -0.4095125, 3.585296, 0.7921569, 0, 1, 1,
0.7271582, 0.8249094, 0.8681545, 0.8, 0, 1, 1,
0.7277615, 2.171492, 1.577617, 0.8078431, 0, 1, 1,
0.7369476, 0.001250703, 0.8750769, 0.8117647, 0, 1, 1,
0.7372122, -1.237862, 3.580065, 0.8196079, 0, 1, 1,
0.7437246, -0.04952363, 0.1750723, 0.8235294, 0, 1, 1,
0.7484261, 1.559237, -1.37526, 0.8313726, 0, 1, 1,
0.7530192, 0.4742111, 0.9140369, 0.8352941, 0, 1, 1,
0.7554141, -1.983227, 3.250571, 0.8431373, 0, 1, 1,
0.7572359, -1.006514, 4.15975, 0.8470588, 0, 1, 1,
0.7779217, -1.437064, 2.968338, 0.854902, 0, 1, 1,
0.7796436, 0.03954294, 0.2615987, 0.8588235, 0, 1, 1,
0.7812719, -1.000063, 4.030146, 0.8666667, 0, 1, 1,
0.784202, -0.5763982, 1.295354, 0.8705882, 0, 1, 1,
0.7925029, 0.5431255, -0.04277421, 0.8784314, 0, 1, 1,
0.8055609, -0.530777, 2.080835, 0.8823529, 0, 1, 1,
0.8219407, -0.357433, 1.250079, 0.8901961, 0, 1, 1,
0.823333, -1.290574, 3.905183, 0.8941177, 0, 1, 1,
0.8258412, -1.862713, 1.92648, 0.9019608, 0, 1, 1,
0.8264756, 0.1746644, 0.03482222, 0.9098039, 0, 1, 1,
0.8303604, 0.896377, 0.7067785, 0.9137255, 0, 1, 1,
0.8376693, 1.570969, 0.1683179, 0.9215686, 0, 1, 1,
0.8561606, 0.1541965, 2.653014, 0.9254902, 0, 1, 1,
0.8565249, 1.282895, 2.602306, 0.9333333, 0, 1, 1,
0.8620045, -1.049885, 3.8248, 0.9372549, 0, 1, 1,
0.8687316, -0.8076412, 3.329383, 0.945098, 0, 1, 1,
0.8693315, -0.3139199, 0.004449997, 0.9490196, 0, 1, 1,
0.8732077, 0.785289, 0.3287544, 0.9568627, 0, 1, 1,
0.8774405, -1.438458, 2.505058, 0.9607843, 0, 1, 1,
0.8800464, -0.7811841, 2.716528, 0.9686275, 0, 1, 1,
0.8857616, 1.068985, 2.185905, 0.972549, 0, 1, 1,
0.8875326, -0.3225611, 1.309778, 0.9803922, 0, 1, 1,
0.8941348, -1.408091, 3.719543, 0.9843137, 0, 1, 1,
0.8946218, -1.303626, 2.814663, 0.9921569, 0, 1, 1,
0.8969457, -0.723416, 0.7485625, 0.9960784, 0, 1, 1,
0.9023489, 0.5777162, 0.4433521, 1, 0, 0.9960784, 1,
0.9101369, 1.490142, 0.1345736, 1, 0, 0.9882353, 1,
0.9196779, 0.7333212, 2.08913, 1, 0, 0.9843137, 1,
0.9268579, -0.04283709, 1.108991, 1, 0, 0.9764706, 1,
0.9295339, -0.524313, 3.185288, 1, 0, 0.972549, 1,
0.9302391, -0.6916825, 3.270198, 1, 0, 0.9647059, 1,
0.9400908, 0.3196704, 1.691071, 1, 0, 0.9607843, 1,
0.9431741, -0.3013537, 0.1782915, 1, 0, 0.9529412, 1,
0.9603319, -0.5252913, 1.172782, 1, 0, 0.9490196, 1,
0.9613464, 0.5235844, 2.702216, 1, 0, 0.9411765, 1,
0.9616994, 0.1252078, 0.9440118, 1, 0, 0.9372549, 1,
0.9666569, -1.55348, 2.212332, 1, 0, 0.9294118, 1,
0.9712567, -0.1826261, 1.922853, 1, 0, 0.9254902, 1,
0.9748943, -0.2988619, 0.90838, 1, 0, 0.9176471, 1,
0.9753709, -0.1219568, 2.776953, 1, 0, 0.9137255, 1,
0.9758924, 0.4052069, 1.211914, 1, 0, 0.9058824, 1,
0.9769861, -1.205866, 4.245795, 1, 0, 0.9019608, 1,
0.9832421, 0.3600575, 1.578499, 1, 0, 0.8941177, 1,
0.9869885, -1.492371, 3.491226, 1, 0, 0.8862745, 1,
0.9916763, -0.3786376, 2.445221, 1, 0, 0.8823529, 1,
0.992233, -0.3123474, 0.448157, 1, 0, 0.8745098, 1,
0.992568, -0.232109, 1.392338, 1, 0, 0.8705882, 1,
0.9958531, -0.715839, -0.08354049, 1, 0, 0.8627451, 1,
0.9976847, -0.5595416, 1.544142, 1, 0, 0.8588235, 1,
0.9992916, -1.068411, 2.415145, 1, 0, 0.8509804, 1,
1.002169, -0.8078458, 2.81209, 1, 0, 0.8470588, 1,
1.00699, 2.82729, -0.1122534, 1, 0, 0.8392157, 1,
1.013505, -0.8455616, 1.515385, 1, 0, 0.8352941, 1,
1.014816, -0.01088328, 1.856801, 1, 0, 0.827451, 1,
1.0164, 0.4627762, 1.012974, 1, 0, 0.8235294, 1,
1.018815, 0.4642798, 2.198658, 1, 0, 0.8156863, 1,
1.024132, -2.106565, 4.706354, 1, 0, 0.8117647, 1,
1.030104, -0.5262147, 1.59006, 1, 0, 0.8039216, 1,
1.042398, -0.9171039, 3.479268, 1, 0, 0.7960784, 1,
1.07323, -2.047268, 1.626485, 1, 0, 0.7921569, 1,
1.083024, -0.2611182, 0.9606491, 1, 0, 0.7843137, 1,
1.08382, 0.3738424, 0.6846997, 1, 0, 0.7803922, 1,
1.08834, 0.2869736, 2.46925, 1, 0, 0.772549, 1,
1.089797, 1.379253, 0.7727473, 1, 0, 0.7686275, 1,
1.090835, 1.004757, 0.6872671, 1, 0, 0.7607843, 1,
1.092437, 0.6049017, 1.584066, 1, 0, 0.7568628, 1,
1.092878, -0.4295495, 2.049027, 1, 0, 0.7490196, 1,
1.093614, 0.157892, 1.738053, 1, 0, 0.7450981, 1,
1.103583, -0.7461969, 2.169391, 1, 0, 0.7372549, 1,
1.104589, -2.002981, 3.152798, 1, 0, 0.7333333, 1,
1.112241, -1.180081, 1.215825, 1, 0, 0.7254902, 1,
1.116557, 0.07997741, 2.011845, 1, 0, 0.7215686, 1,
1.120312, -0.7387617, -0.189238, 1, 0, 0.7137255, 1,
1.120819, 0.677591, 1.285616, 1, 0, 0.7098039, 1,
1.121319, -0.4871535, 2.503629, 1, 0, 0.7019608, 1,
1.148584, 0.3910375, -0.06893104, 1, 0, 0.6941177, 1,
1.150481, -0.5455841, 1.930159, 1, 0, 0.6901961, 1,
1.153353, -1.64332, 2.813132, 1, 0, 0.682353, 1,
1.153681, 0.4577335, 0.3841449, 1, 0, 0.6784314, 1,
1.158725, -0.8322558, 3.337889, 1, 0, 0.6705883, 1,
1.167904, -0.2256501, 0.2806887, 1, 0, 0.6666667, 1,
1.16808, -0.4537896, 2.783627, 1, 0, 0.6588235, 1,
1.171374, 1.234546, 0.05981398, 1, 0, 0.654902, 1,
1.172093, 0.6664638, 1.394225, 1, 0, 0.6470588, 1,
1.172267, -0.2397258, 2.254338, 1, 0, 0.6431373, 1,
1.174031, -0.38159, 2.416282, 1, 0, 0.6352941, 1,
1.188829, -0.07124852, 1.636318, 1, 0, 0.6313726, 1,
1.190519, 1.528082, -0.4845511, 1, 0, 0.6235294, 1,
1.192447, 0.2844355, 2.128187, 1, 0, 0.6196079, 1,
1.193875, -2.09281, 4.066448, 1, 0, 0.6117647, 1,
1.195478, -0.138867, 1.512664, 1, 0, 0.6078432, 1,
1.200995, -0.8428864, 2.102495, 1, 0, 0.6, 1,
1.20289, 0.3428088, 2.309019, 1, 0, 0.5921569, 1,
1.206358, 1.419667, 1.602934, 1, 0, 0.5882353, 1,
1.206451, 0.5325908, 1.986084, 1, 0, 0.5803922, 1,
1.215056, -2.459491, 2.193888, 1, 0, 0.5764706, 1,
1.224395, 0.02782814, 1.758218, 1, 0, 0.5686275, 1,
1.229862, 0.7405381, 1.200344, 1, 0, 0.5647059, 1,
1.23144, 0.9635358, 1.343489, 1, 0, 0.5568628, 1,
1.241054, 0.27479, 3.270786, 1, 0, 0.5529412, 1,
1.24137, 0.5059135, 0.4684531, 1, 0, 0.5450981, 1,
1.243639, -0.141063, -0.08481854, 1, 0, 0.5411765, 1,
1.248273, 0.7112643, 1.754267, 1, 0, 0.5333334, 1,
1.24892, 0.09002856, 0.4481049, 1, 0, 0.5294118, 1,
1.253284, 0.4296921, 1.885707, 1, 0, 0.5215687, 1,
1.254651, 0.1724683, 1.220883, 1, 0, 0.5176471, 1,
1.275452, -0.8742464, 1.640872, 1, 0, 0.509804, 1,
1.284929, -0.8341199, 2.095055, 1, 0, 0.5058824, 1,
1.295582, 0.04423394, 1.491366, 1, 0, 0.4980392, 1,
1.297493, -0.635972, 0.181766, 1, 0, 0.4901961, 1,
1.30291, -0.8572829, 2.438591, 1, 0, 0.4862745, 1,
1.309281, 1.012498, 1.994434, 1, 0, 0.4784314, 1,
1.32893, -0.6842983, 0.9556776, 1, 0, 0.4745098, 1,
1.330523, 2.091319, 2.197538, 1, 0, 0.4666667, 1,
1.330558, -0.3144154, 3.05291, 1, 0, 0.4627451, 1,
1.331563, 0.7465989, 0.05418123, 1, 0, 0.454902, 1,
1.334623, -0.4706348, 1.836736, 1, 0, 0.4509804, 1,
1.334866, 1.907294, 1.623719, 1, 0, 0.4431373, 1,
1.356103, -0.1858819, 2.043615, 1, 0, 0.4392157, 1,
1.386224, 0.07789882, 0.7775878, 1, 0, 0.4313726, 1,
1.394805, 1.504725, 1.853793, 1, 0, 0.427451, 1,
1.397547, -1.013182, 2.029971, 1, 0, 0.4196078, 1,
1.401758, -0.5150648, 2.237012, 1, 0, 0.4156863, 1,
1.459963, 0.09804851, 1.466657, 1, 0, 0.4078431, 1,
1.469854, 1.316232, 0.3055893, 1, 0, 0.4039216, 1,
1.472741, -0.7681926, -0.05493942, 1, 0, 0.3960784, 1,
1.482376, -1.281097, 2.117784, 1, 0, 0.3882353, 1,
1.494291, 0.3825333, -0.2507377, 1, 0, 0.3843137, 1,
1.528058, 0.546918, -0.1534437, 1, 0, 0.3764706, 1,
1.53551, 1.220234, 0.9237878, 1, 0, 0.372549, 1,
1.552292, 0.2422324, 1.564888, 1, 0, 0.3647059, 1,
1.558847, 0.4254123, 0.8420603, 1, 0, 0.3607843, 1,
1.565002, -0.004350448, 2.386497, 1, 0, 0.3529412, 1,
1.570341, -0.4884234, 2.986406, 1, 0, 0.3490196, 1,
1.573933, 0.1796599, 2.432942, 1, 0, 0.3411765, 1,
1.576784, 2.07217, -0.3875112, 1, 0, 0.3372549, 1,
1.57682, -0.3972024, 1.737767, 1, 0, 0.3294118, 1,
1.579616, 1.604808, -0.124102, 1, 0, 0.3254902, 1,
1.581584, -1.023401, 4.447901, 1, 0, 0.3176471, 1,
1.584098, 2.100742, 0.5285987, 1, 0, 0.3137255, 1,
1.594627, -0.08873658, 2.032851, 1, 0, 0.3058824, 1,
1.596811, -0.3529438, 2.552857, 1, 0, 0.2980392, 1,
1.6047, -1.382365, 2.159719, 1, 0, 0.2941177, 1,
1.616138, -0.9311729, 3.54998, 1, 0, 0.2862745, 1,
1.638875, -1.054208, 2.060719, 1, 0, 0.282353, 1,
1.643943, -0.2313001, 2.487519, 1, 0, 0.2745098, 1,
1.652597, -1.720567, 1.373379, 1, 0, 0.2705882, 1,
1.660701, -0.9199503, 2.228122, 1, 0, 0.2627451, 1,
1.662225, -1.521326, 2.845829, 1, 0, 0.2588235, 1,
1.678002, -1.070505, 2.197873, 1, 0, 0.2509804, 1,
1.679196, -1.202445, 1.608782, 1, 0, 0.2470588, 1,
1.683506, -0.06514807, 1.908307, 1, 0, 0.2392157, 1,
1.688082, -0.4193428, 1.876124, 1, 0, 0.2352941, 1,
1.691862, -0.7580187, 2.488419, 1, 0, 0.227451, 1,
1.735735, -0.6467433, 1.034238, 1, 0, 0.2235294, 1,
1.743602, 0.4599645, 1.948718, 1, 0, 0.2156863, 1,
1.760856, 0.1880955, 1.843413, 1, 0, 0.2117647, 1,
1.764581, -1.320394, 2.896423, 1, 0, 0.2039216, 1,
1.765028, 0.5549757, 1.949087, 1, 0, 0.1960784, 1,
1.772713, -0.9905163, 3.304055, 1, 0, 0.1921569, 1,
1.773566, 0.9534128, 1.234568, 1, 0, 0.1843137, 1,
1.798669, 0.3555708, 1.483368, 1, 0, 0.1803922, 1,
1.805822, 0.02240418, 1.751822, 1, 0, 0.172549, 1,
1.829296, -2.090355, 3.004908, 1, 0, 0.1686275, 1,
1.87094, 1.193428, 1.01306, 1, 0, 0.1607843, 1,
1.886811, 1.249893, 0.9201283, 1, 0, 0.1568628, 1,
1.936517, -0.4856462, 1.031395, 1, 0, 0.1490196, 1,
1.955773, -0.01760942, 2.912978, 1, 0, 0.145098, 1,
1.99263, -0.3301034, 2.208218, 1, 0, 0.1372549, 1,
1.99263, -0.5624561, 1.684518, 1, 0, 0.1333333, 1,
2.016805, 0.0847325, 3.367319, 1, 0, 0.1254902, 1,
2.016956, 1.5458, -0.7360941, 1, 0, 0.1215686, 1,
2.042947, 1.099281, 0.8498082, 1, 0, 0.1137255, 1,
2.124688, -1.288303, 2.245444, 1, 0, 0.1098039, 1,
2.131319, 1.512274, 0.5007881, 1, 0, 0.1019608, 1,
2.19671, -0.381905, 2.216276, 1, 0, 0.09411765, 1,
2.249105, 1.530974, 1.704706, 1, 0, 0.09019608, 1,
2.253587, 0.5224044, 2.51228, 1, 0, 0.08235294, 1,
2.256523, 0.3384018, 0.2503725, 1, 0, 0.07843138, 1,
2.297895, -2.544674, 2.858897, 1, 0, 0.07058824, 1,
2.312499, 0.9632965, 2.648088, 1, 0, 0.06666667, 1,
2.360084, -0.5969, 1.553923, 1, 0, 0.05882353, 1,
2.368618, -0.3021344, 0.6842002, 1, 0, 0.05490196, 1,
2.433453, -0.246058, 1.702634, 1, 0, 0.04705882, 1,
2.49157, -0.4523833, 1.284724, 1, 0, 0.04313726, 1,
2.546581, 0.2289442, 1.823442, 1, 0, 0.03529412, 1,
2.561414, -0.4971633, 1.304904, 1, 0, 0.03137255, 1,
2.624233, -0.977158, 1.939314, 1, 0, 0.02352941, 1,
2.670491, -1.32652, 2.027997, 1, 0, 0.01960784, 1,
2.719592, 0.7135724, 1.917773, 1, 0, 0.01176471, 1,
3.407658, 1.217975, 0.3450881, 1, 0, 0.007843138, 1
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
0.1420355, -4.114009, -8.15864, 0, -0.5, 0.5, 0.5,
0.1420355, -4.114009, -8.15864, 1, -0.5, 0.5, 0.5,
0.1420355, -4.114009, -8.15864, 1, 1.5, 0.5, 0.5,
0.1420355, -4.114009, -8.15864, 0, 1.5, 0.5, 0.5
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
-4.230633, 0.140872, -8.15864, 0, -0.5, 0.5, 0.5,
-4.230633, 0.140872, -8.15864, 1, -0.5, 0.5, 0.5,
-4.230633, 0.140872, -8.15864, 1, 1.5, 0.5, 0.5,
-4.230633, 0.140872, -8.15864, 0, 1.5, 0.5, 0.5
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
-4.230633, -4.114009, -0.2344365, 0, -0.5, 0.5, 0.5,
-4.230633, -4.114009, -0.2344365, 1, -0.5, 0.5, 0.5,
-4.230633, -4.114009, -0.2344365, 1, 1.5, 0.5, 0.5,
-4.230633, -4.114009, -0.2344365, 0, 1.5, 0.5, 0.5
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
-3, -3.132113, -6.329977,
3, -3.132113, -6.329977,
-3, -3.132113, -6.329977,
-3, -3.295763, -6.634754,
-2, -3.132113, -6.329977,
-2, -3.295763, -6.634754,
-1, -3.132113, -6.329977,
-1, -3.295763, -6.634754,
0, -3.132113, -6.329977,
0, -3.295763, -6.634754,
1, -3.132113, -6.329977,
1, -3.295763, -6.634754,
2, -3.132113, -6.329977,
2, -3.295763, -6.634754,
3, -3.132113, -6.329977,
3, -3.295763, -6.634754
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
-3, -3.623061, -7.244308, 0, -0.5, 0.5, 0.5,
-3, -3.623061, -7.244308, 1, -0.5, 0.5, 0.5,
-3, -3.623061, -7.244308, 1, 1.5, 0.5, 0.5,
-3, -3.623061, -7.244308, 0, 1.5, 0.5, 0.5,
-2, -3.623061, -7.244308, 0, -0.5, 0.5, 0.5,
-2, -3.623061, -7.244308, 1, -0.5, 0.5, 0.5,
-2, -3.623061, -7.244308, 1, 1.5, 0.5, 0.5,
-2, -3.623061, -7.244308, 0, 1.5, 0.5, 0.5,
-1, -3.623061, -7.244308, 0, -0.5, 0.5, 0.5,
-1, -3.623061, -7.244308, 1, -0.5, 0.5, 0.5,
-1, -3.623061, -7.244308, 1, 1.5, 0.5, 0.5,
-1, -3.623061, -7.244308, 0, 1.5, 0.5, 0.5,
0, -3.623061, -7.244308, 0, -0.5, 0.5, 0.5,
0, -3.623061, -7.244308, 1, -0.5, 0.5, 0.5,
0, -3.623061, -7.244308, 1, 1.5, 0.5, 0.5,
0, -3.623061, -7.244308, 0, 1.5, 0.5, 0.5,
1, -3.623061, -7.244308, 0, -0.5, 0.5, 0.5,
1, -3.623061, -7.244308, 1, -0.5, 0.5, 0.5,
1, -3.623061, -7.244308, 1, 1.5, 0.5, 0.5,
1, -3.623061, -7.244308, 0, 1.5, 0.5, 0.5,
2, -3.623061, -7.244308, 0, -0.5, 0.5, 0.5,
2, -3.623061, -7.244308, 1, -0.5, 0.5, 0.5,
2, -3.623061, -7.244308, 1, 1.5, 0.5, 0.5,
2, -3.623061, -7.244308, 0, 1.5, 0.5, 0.5,
3, -3.623061, -7.244308, 0, -0.5, 0.5, 0.5,
3, -3.623061, -7.244308, 1, -0.5, 0.5, 0.5,
3, -3.623061, -7.244308, 1, 1.5, 0.5, 0.5,
3, -3.623061, -7.244308, 0, 1.5, 0.5, 0.5
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
-3.221556, -3, -6.329977,
-3.221556, 3, -6.329977,
-3.221556, -3, -6.329977,
-3.389735, -3, -6.634754,
-3.221556, -2, -6.329977,
-3.389735, -2, -6.634754,
-3.221556, -1, -6.329977,
-3.389735, -1, -6.634754,
-3.221556, 0, -6.329977,
-3.389735, 0, -6.634754,
-3.221556, 1, -6.329977,
-3.389735, 1, -6.634754,
-3.221556, 2, -6.329977,
-3.389735, 2, -6.634754,
-3.221556, 3, -6.329977,
-3.389735, 3, -6.634754
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
-3.726094, -3, -7.244308, 0, -0.5, 0.5, 0.5,
-3.726094, -3, -7.244308, 1, -0.5, 0.5, 0.5,
-3.726094, -3, -7.244308, 1, 1.5, 0.5, 0.5,
-3.726094, -3, -7.244308, 0, 1.5, 0.5, 0.5,
-3.726094, -2, -7.244308, 0, -0.5, 0.5, 0.5,
-3.726094, -2, -7.244308, 1, -0.5, 0.5, 0.5,
-3.726094, -2, -7.244308, 1, 1.5, 0.5, 0.5,
-3.726094, -2, -7.244308, 0, 1.5, 0.5, 0.5,
-3.726094, -1, -7.244308, 0, -0.5, 0.5, 0.5,
-3.726094, -1, -7.244308, 1, -0.5, 0.5, 0.5,
-3.726094, -1, -7.244308, 1, 1.5, 0.5, 0.5,
-3.726094, -1, -7.244308, 0, 1.5, 0.5, 0.5,
-3.726094, 0, -7.244308, 0, -0.5, 0.5, 0.5,
-3.726094, 0, -7.244308, 1, -0.5, 0.5, 0.5,
-3.726094, 0, -7.244308, 1, 1.5, 0.5, 0.5,
-3.726094, 0, -7.244308, 0, 1.5, 0.5, 0.5,
-3.726094, 1, -7.244308, 0, -0.5, 0.5, 0.5,
-3.726094, 1, -7.244308, 1, -0.5, 0.5, 0.5,
-3.726094, 1, -7.244308, 1, 1.5, 0.5, 0.5,
-3.726094, 1, -7.244308, 0, 1.5, 0.5, 0.5,
-3.726094, 2, -7.244308, 0, -0.5, 0.5, 0.5,
-3.726094, 2, -7.244308, 1, -0.5, 0.5, 0.5,
-3.726094, 2, -7.244308, 1, 1.5, 0.5, 0.5,
-3.726094, 2, -7.244308, 0, 1.5, 0.5, 0.5,
-3.726094, 3, -7.244308, 0, -0.5, 0.5, 0.5,
-3.726094, 3, -7.244308, 1, -0.5, 0.5, 0.5,
-3.726094, 3, -7.244308, 1, 1.5, 0.5, 0.5,
-3.726094, 3, -7.244308, 0, 1.5, 0.5, 0.5
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
-3.221556, -3.132113, -6,
-3.221556, -3.132113, 4,
-3.221556, -3.132113, -6,
-3.389735, -3.295763, -6,
-3.221556, -3.132113, -4,
-3.389735, -3.295763, -4,
-3.221556, -3.132113, -2,
-3.389735, -3.295763, -2,
-3.221556, -3.132113, 0,
-3.389735, -3.295763, 0,
-3.221556, -3.132113, 2,
-3.389735, -3.295763, 2,
-3.221556, -3.132113, 4,
-3.389735, -3.295763, 4
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
"-6",
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
-3.726094, -3.623061, -6, 0, -0.5, 0.5, 0.5,
-3.726094, -3.623061, -6, 1, -0.5, 0.5, 0.5,
-3.726094, -3.623061, -6, 1, 1.5, 0.5, 0.5,
-3.726094, -3.623061, -6, 0, 1.5, 0.5, 0.5,
-3.726094, -3.623061, -4, 0, -0.5, 0.5, 0.5,
-3.726094, -3.623061, -4, 1, -0.5, 0.5, 0.5,
-3.726094, -3.623061, -4, 1, 1.5, 0.5, 0.5,
-3.726094, -3.623061, -4, 0, 1.5, 0.5, 0.5,
-3.726094, -3.623061, -2, 0, -0.5, 0.5, 0.5,
-3.726094, -3.623061, -2, 1, -0.5, 0.5, 0.5,
-3.726094, -3.623061, -2, 1, 1.5, 0.5, 0.5,
-3.726094, -3.623061, -2, 0, 1.5, 0.5, 0.5,
-3.726094, -3.623061, 0, 0, -0.5, 0.5, 0.5,
-3.726094, -3.623061, 0, 1, -0.5, 0.5, 0.5,
-3.726094, -3.623061, 0, 1, 1.5, 0.5, 0.5,
-3.726094, -3.623061, 0, 0, 1.5, 0.5, 0.5,
-3.726094, -3.623061, 2, 0, -0.5, 0.5, 0.5,
-3.726094, -3.623061, 2, 1, -0.5, 0.5, 0.5,
-3.726094, -3.623061, 2, 1, 1.5, 0.5, 0.5,
-3.726094, -3.623061, 2, 0, 1.5, 0.5, 0.5,
-3.726094, -3.623061, 4, 0, -0.5, 0.5, 0.5,
-3.726094, -3.623061, 4, 1, -0.5, 0.5, 0.5,
-3.726094, -3.623061, 4, 1, 1.5, 0.5, 0.5,
-3.726094, -3.623061, 4, 0, 1.5, 0.5, 0.5
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
-3.221556, -3.132113, -6.329977,
-3.221556, 3.413857, -6.329977,
-3.221556, -3.132113, 5.861104,
-3.221556, 3.413857, 5.861104,
-3.221556, -3.132113, -6.329977,
-3.221556, -3.132113, 5.861104,
-3.221556, 3.413857, -6.329977,
-3.221556, 3.413857, 5.861104,
-3.221556, -3.132113, -6.329977,
3.505627, -3.132113, -6.329977,
-3.221556, -3.132113, 5.861104,
3.505627, -3.132113, 5.861104,
-3.221556, 3.413857, -6.329977,
3.505627, 3.413857, -6.329977,
-3.221556, 3.413857, 5.861104,
3.505627, 3.413857, 5.861104,
3.505627, -3.132113, -6.329977,
3.505627, 3.413857, -6.329977,
3.505627, -3.132113, 5.861104,
3.505627, 3.413857, 5.861104,
3.505627, -3.132113, -6.329977,
3.505627, -3.132113, 5.861104,
3.505627, 3.413857, -6.329977,
3.505627, 3.413857, 5.861104
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
var radius = 8.215794;
var distance = 36.55299;
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
mvMatrix.translate( -0.1420355, -0.140872, 0.2344365 );
mvMatrix.scale( 1.320475, 1.35703, 0.7286537 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.55299);
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
DOSANEX<-read.table("DOSANEX.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DOSANEX$V2
```

```
## Error in eval(expr, envir, enclos): object 'DOSANEX' not found
```

```r
y<-DOSANEX$V3
```

```
## Error in eval(expr, envir, enclos): object 'DOSANEX' not found
```

```r
z<-DOSANEX$V4
```

```
## Error in eval(expr, envir, enclos): object 'DOSANEX' not found
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
-3.123587, -0.3878969, -1.136438, 0, 0, 1, 1, 1,
-2.665776, -1.537513, -2.067802, 1, 0, 0, 1, 1,
-2.662957, 0.8291289, -1.251534, 1, 0, 0, 1, 1,
-2.639469, -0.5186504, -2.373601, 1, 0, 0, 1, 1,
-2.588071, -0.06730478, -3.453095, 1, 0, 0, 1, 1,
-2.573478, 0.9559183, -0.7012448, 1, 0, 0, 1, 1,
-2.406644, 0.6975484, -1.509765, 0, 0, 0, 1, 1,
-2.350962, 0.3648673, -1.88626, 0, 0, 0, 1, 1,
-2.286135, 1.221262, -1.563316, 0, 0, 0, 1, 1,
-2.266673, 1.126768, -1.985656, 0, 0, 0, 1, 1,
-2.156133, 1.256858, -0.9951174, 0, 0, 0, 1, 1,
-2.132274, 0.7844302, -0.07595024, 0, 0, 0, 1, 1,
-2.103041, 0.4592848, -2.168113, 0, 0, 0, 1, 1,
-2.086702, -0.5640507, -2.617981, 1, 1, 1, 1, 1,
-2.083731, 0.4079047, -0.5835652, 1, 1, 1, 1, 1,
-2.022263, -1.330397, -1.562041, 1, 1, 1, 1, 1,
-2.015489, -0.2563361, -2.789328, 1, 1, 1, 1, 1,
-2.005715, -1.085196, -2.043303, 1, 1, 1, 1, 1,
-1.99677, -0.2438572, -1.58472, 1, 1, 1, 1, 1,
-1.962622, -0.556439, -2.979198, 1, 1, 1, 1, 1,
-1.952214, -0.5068043, -1.535378, 1, 1, 1, 1, 1,
-1.937934, -0.2605918, -0.3428215, 1, 1, 1, 1, 1,
-1.918237, -0.5494137, -3.653638, 1, 1, 1, 1, 1,
-1.912, -1.577888, -2.409905, 1, 1, 1, 1, 1,
-1.868947, 0.006171751, -0.5200224, 1, 1, 1, 1, 1,
-1.867715, 0.2186835, -2.191972, 1, 1, 1, 1, 1,
-1.861793, -0.7664622, -1.515871, 1, 1, 1, 1, 1,
-1.840466, -0.7357331, -2.933576, 1, 1, 1, 1, 1,
-1.832985, -1.782642, -0.9252577, 0, 0, 1, 1, 1,
-1.812528, 0.7453237, -2.729966, 1, 0, 0, 1, 1,
-1.785676, 1.241598, -1.911594, 1, 0, 0, 1, 1,
-1.771905, 0.3477288, -2.715529, 1, 0, 0, 1, 1,
-1.764805, -0.1385933, -1.171721, 1, 0, 0, 1, 1,
-1.76177, 0.01481207, 0.4817705, 1, 0, 0, 1, 1,
-1.753063, 1.682412, -1.226415, 0, 0, 0, 1, 1,
-1.750982, 0.02276558, -3.099836, 0, 0, 0, 1, 1,
-1.727579, -0.8239216, -0.9306243, 0, 0, 0, 1, 1,
-1.710927, -1.47558, -0.2923104, 0, 0, 0, 1, 1,
-1.707345, 0.8545557, -0.7483646, 0, 0, 0, 1, 1,
-1.698859, -0.5283002, -1.192313, 0, 0, 0, 1, 1,
-1.666283, 0.5151889, -0.79729, 0, 0, 0, 1, 1,
-1.659111, -0.2645312, -2.701344, 1, 1, 1, 1, 1,
-1.65722, 0.3819998, -1.710788, 1, 1, 1, 1, 1,
-1.648191, 0.2046624, -1.275197, 1, 1, 1, 1, 1,
-1.642164, -0.009365955, -0.1852506, 1, 1, 1, 1, 1,
-1.627258, -1.259599, -1.289425, 1, 1, 1, 1, 1,
-1.622056, -1.330221, -2.545577, 1, 1, 1, 1, 1,
-1.601814, 0.6636216, -1.938638, 1, 1, 1, 1, 1,
-1.596762, 0.9378586, -3.141721, 1, 1, 1, 1, 1,
-1.581417, 0.6905141, -1.21025, 1, 1, 1, 1, 1,
-1.570974, 0.6662416, -1.113676, 1, 1, 1, 1, 1,
-1.558203, -0.2483411, -2.147392, 1, 1, 1, 1, 1,
-1.553709, 3.318528, -0.4264506, 1, 1, 1, 1, 1,
-1.548153, 0.5489815, -2.317842, 1, 1, 1, 1, 1,
-1.544912, 0.4567904, -0.8405582, 1, 1, 1, 1, 1,
-1.54299, -1.752916, -3.105457, 1, 1, 1, 1, 1,
-1.510249, 0.340646, -0.854342, 0, 0, 1, 1, 1,
-1.508703, -1.448138, -0.6497729, 1, 0, 0, 1, 1,
-1.494731, 1.28119, -2.911947, 1, 0, 0, 1, 1,
-1.485977, -0.08436117, -0.1697389, 1, 0, 0, 1, 1,
-1.484864, 0.9184574, -0.3663654, 1, 0, 0, 1, 1,
-1.482872, 0.0169673, -1.668556, 1, 0, 0, 1, 1,
-1.47679, -1.113831, -0.8566419, 0, 0, 0, 1, 1,
-1.474197, 1.767321, -1.452001, 0, 0, 0, 1, 1,
-1.453749, -0.4140517, -2.255404, 0, 0, 0, 1, 1,
-1.451254, -0.2065959, -1.291538, 0, 0, 0, 1, 1,
-1.442129, -0.743019, -0.4214967, 0, 0, 0, 1, 1,
-1.432914, 1.19029, -0.568339, 0, 0, 0, 1, 1,
-1.427103, -1.505094, -2.655365, 0, 0, 0, 1, 1,
-1.422062, 0.2847671, 0.5410357, 1, 1, 1, 1, 1,
-1.412426, 0.370764, 0.2007827, 1, 1, 1, 1, 1,
-1.410907, 0.3148746, -0.2701334, 1, 1, 1, 1, 1,
-1.40176, -1.886428, -1.283977, 1, 1, 1, 1, 1,
-1.400732, -0.9314712, -1.897257, 1, 1, 1, 1, 1,
-1.393182, 0.2231761, -1.99559, 1, 1, 1, 1, 1,
-1.383061, 0.1397703, -3.349439, 1, 1, 1, 1, 1,
-1.382165, 1.199944, -0.608054, 1, 1, 1, 1, 1,
-1.372118, 0.1983192, -0.7705759, 1, 1, 1, 1, 1,
-1.369642, 1.096561, -0.3004312, 1, 1, 1, 1, 1,
-1.367064, -0.1869517, -2.605473, 1, 1, 1, 1, 1,
-1.364987, 0.09831743, -2.459328, 1, 1, 1, 1, 1,
-1.362326, -0.7995399, -1.854003, 1, 1, 1, 1, 1,
-1.358302, 1.407152, -0.6539294, 1, 1, 1, 1, 1,
-1.354813, 1.118582, 0.6620243, 1, 1, 1, 1, 1,
-1.347895, -1.669032, -1.754233, 0, 0, 1, 1, 1,
-1.344164, 0.7613103, -1.275392, 1, 0, 0, 1, 1,
-1.342942, 1.337274, 0.3926695, 1, 0, 0, 1, 1,
-1.34288, -0.08899552, 0.02000705, 1, 0, 0, 1, 1,
-1.342339, -0.04034331, -2.269346, 1, 0, 0, 1, 1,
-1.339073, 0.5922692, -1.247538, 1, 0, 0, 1, 1,
-1.334628, 0.05237346, -0.084024, 0, 0, 0, 1, 1,
-1.332209, 0.5323561, -1.226792, 0, 0, 0, 1, 1,
-1.315505, -0.6694573, -2.029045, 0, 0, 0, 1, 1,
-1.31536, 1.327133, -0.3987885, 0, 0, 0, 1, 1,
-1.312674, 1.577958, -0.5504211, 0, 0, 0, 1, 1,
-1.308593, -0.476832, -1.347942, 0, 0, 0, 1, 1,
-1.307035, -1.683689, -3.603678, 0, 0, 0, 1, 1,
-1.303191, -0.5020983, -1.16994, 1, 1, 1, 1, 1,
-1.301615, -0.09887614, -2.826299, 1, 1, 1, 1, 1,
-1.300715, -0.5539985, -2.850932, 1, 1, 1, 1, 1,
-1.297202, 0.7324802, -1.627349, 1, 1, 1, 1, 1,
-1.294144, -1.015309, -3.515627, 1, 1, 1, 1, 1,
-1.293145, 0.1378117, -0.9888449, 1, 1, 1, 1, 1,
-1.278038, -0.9428548, -0.7670298, 1, 1, 1, 1, 1,
-1.269639, 0.5691324, -0.2099678, 1, 1, 1, 1, 1,
-1.264511, -0.281232, -1.763795, 1, 1, 1, 1, 1,
-1.262951, -0.5540867, -3.334356, 1, 1, 1, 1, 1,
-1.252216, -0.3430294, -0.8493109, 1, 1, 1, 1, 1,
-1.224771, -0.8707162, -1.999052, 1, 1, 1, 1, 1,
-1.219009, -0.5337721, -3.352366, 1, 1, 1, 1, 1,
-1.19023, -0.1335663, -2.544372, 1, 1, 1, 1, 1,
-1.188751, -0.9303988, -2.767691, 1, 1, 1, 1, 1,
-1.18809, 0.2304909, -0.8997172, 0, 0, 1, 1, 1,
-1.173481, -1.55408, -1.588764, 1, 0, 0, 1, 1,
-1.170047, 0.0694884, -0.8003928, 1, 0, 0, 1, 1,
-1.167628, 0.7298958, -1.479227, 1, 0, 0, 1, 1,
-1.166787, -0.1846414, -0.4954151, 1, 0, 0, 1, 1,
-1.163236, 0.3282015, -1.58765, 1, 0, 0, 1, 1,
-1.162127, 0.6391781, -0.8708658, 0, 0, 0, 1, 1,
-1.147795, 0.3180169, -1.156296, 0, 0, 0, 1, 1,
-1.145844, 0.6340817, -2.700072, 0, 0, 0, 1, 1,
-1.144959, 0.5411109, -0.5384669, 0, 0, 0, 1, 1,
-1.140654, 0.8449676, -0.6632902, 0, 0, 0, 1, 1,
-1.133523, -0.4852155, -2.493058, 0, 0, 0, 1, 1,
-1.131801, 0.2360249, -2.009747, 0, 0, 0, 1, 1,
-1.121665, 0.07733685, -2.020103, 1, 1, 1, 1, 1,
-1.117108, 0.2075401, -1.816104, 1, 1, 1, 1, 1,
-1.114286, 0.4182143, -1.699826, 1, 1, 1, 1, 1,
-1.106273, -0.4797605, -2.284547, 1, 1, 1, 1, 1,
-1.103641, -0.7574831, -2.268355, 1, 1, 1, 1, 1,
-1.102656, -0.4022574, -1.906929, 1, 1, 1, 1, 1,
-1.083227, 1.260963, 0.4086213, 1, 1, 1, 1, 1,
-1.080579, 1.172423, -1.932506, 1, 1, 1, 1, 1,
-1.079982, -0.007748717, -2.120684, 1, 1, 1, 1, 1,
-1.072171, 0.3449507, -0.3076468, 1, 1, 1, 1, 1,
-1.071554, -0.7733387, -2.720241, 1, 1, 1, 1, 1,
-1.070685, -1.419879, -3.180104, 1, 1, 1, 1, 1,
-1.068166, 1.718293, -0.5655348, 1, 1, 1, 1, 1,
-1.066601, -1.767288, -3.437541, 1, 1, 1, 1, 1,
-1.065756, 0.9619335, -1.704132, 1, 1, 1, 1, 1,
-1.061526, 0.9435539, 0.8701016, 0, 0, 1, 1, 1,
-1.059206, -1.211116, -1.841687, 1, 0, 0, 1, 1,
-1.055439, 0.1394874, -1.663638, 1, 0, 0, 1, 1,
-1.051599, -0.5642005, -4.04762, 1, 0, 0, 1, 1,
-1.042941, 0.7512133, -1.557934, 1, 0, 0, 1, 1,
-1.038409, 0.5883113, -1.27212, 1, 0, 0, 1, 1,
-1.034674, 0.7935278, -2.56612, 0, 0, 0, 1, 1,
-1.032189, -2.776702, -3.170931, 0, 0, 0, 1, 1,
-1.031973, -1.50289, -3.482483, 0, 0, 0, 1, 1,
-1.023933, -1.841178, -3.197296, 0, 0, 0, 1, 1,
-1.023558, -0.8487734, -2.123804, 0, 0, 0, 1, 1,
-1.020212, -0.211523, -2.719809, 0, 0, 0, 1, 1,
-1.019026, -1.334246, -3.017328, 0, 0, 0, 1, 1,
-1.017154, 1.331157, -1.813012, 1, 1, 1, 1, 1,
-1.010301, -1.108851, -2.247938, 1, 1, 1, 1, 1,
-1.009485, 1.830218, -3.552755, 1, 1, 1, 1, 1,
-1.007749, 0.9198624, -0.8077621, 1, 1, 1, 1, 1,
-1.006889, -0.6486182, 0.4386834, 1, 1, 1, 1, 1,
-0.999944, -0.3617209, -1.325701, 1, 1, 1, 1, 1,
-0.9998953, -0.6951135, -2.128516, 1, 1, 1, 1, 1,
-0.9977368, 0.08453111, -0.1277693, 1, 1, 1, 1, 1,
-0.9921864, -0.1813691, -3.629018, 1, 1, 1, 1, 1,
-0.9914742, 1.439328, -0.8513135, 1, 1, 1, 1, 1,
-0.9841486, 0.008216529, -1.197598, 1, 1, 1, 1, 1,
-0.982711, 0.4486805, -0.4735908, 1, 1, 1, 1, 1,
-0.9825874, 1.064026, -0.4821408, 1, 1, 1, 1, 1,
-0.9818302, 1.276498, 0.04118241, 1, 1, 1, 1, 1,
-0.9779031, -0.8861385, -3.48895, 1, 1, 1, 1, 1,
-0.976684, 0.1892648, -0.9361283, 0, 0, 1, 1, 1,
-0.9676659, -0.0412753, -1.163843, 1, 0, 0, 1, 1,
-0.9674328, -0.5546252, -2.672174, 1, 0, 0, 1, 1,
-0.9623669, -1.159913, -1.083429, 1, 0, 0, 1, 1,
-0.9584073, -0.7666982, -3.915362, 1, 0, 0, 1, 1,
-0.9553007, -1.029513, -3.403723, 1, 0, 0, 1, 1,
-0.9543318, 0.07723529, -1.289163, 0, 0, 0, 1, 1,
-0.9523584, 0.5149437, 0.4620142, 0, 0, 0, 1, 1,
-0.9506554, 0.8353826, -0.7427981, 0, 0, 0, 1, 1,
-0.9495907, -0.9666706, -2.987121, 0, 0, 0, 1, 1,
-0.9486602, 1.16103, 0.3459146, 0, 0, 0, 1, 1,
-0.9466939, -0.9817441, -0.8918393, 0, 0, 0, 1, 1,
-0.9409504, 0.5438414, -1.512879, 0, 0, 0, 1, 1,
-0.9311929, -1.593218, -2.265725, 1, 1, 1, 1, 1,
-0.9286144, 0.03230355, -0.801616, 1, 1, 1, 1, 1,
-0.9276965, -1.673502, -1.517848, 1, 1, 1, 1, 1,
-0.9184287, 0.3799769, 0.04460419, 1, 1, 1, 1, 1,
-0.9073496, -0.5861639, -1.526916, 1, 1, 1, 1, 1,
-0.9071999, 0.3681393, 0.05994909, 1, 1, 1, 1, 1,
-0.9068297, 1.355395, -0.08352175, 1, 1, 1, 1, 1,
-0.8971827, -1.396418, -1.302721, 1, 1, 1, 1, 1,
-0.8948739, -0.8707916, -3.172697, 1, 1, 1, 1, 1,
-0.892902, -1.884254, -1.977015, 1, 1, 1, 1, 1,
-0.8891423, -0.8873489, -3.934313, 1, 1, 1, 1, 1,
-0.8821194, -0.5652639, -1.663361, 1, 1, 1, 1, 1,
-0.8789999, 0.879338, -0.1039101, 1, 1, 1, 1, 1,
-0.8770134, 0.6994819, -0.6115984, 1, 1, 1, 1, 1,
-0.8769341, 0.5459248, -3.096765, 1, 1, 1, 1, 1,
-0.8698704, -0.05758028, -0.7039909, 0, 0, 1, 1, 1,
-0.8688705, -2.580448, -1.334269, 1, 0, 0, 1, 1,
-0.8602816, -0.6513708, -0.9334946, 1, 0, 0, 1, 1,
-0.8565903, -0.06332135, -1.10779, 1, 0, 0, 1, 1,
-0.8542994, -0.5027984, -1.446812, 1, 0, 0, 1, 1,
-0.8525341, -0.9347013, -2.319112, 1, 0, 0, 1, 1,
-0.8506295, 1.339134, -0.135684, 0, 0, 0, 1, 1,
-0.8411515, -0.2491784, -1.054773, 0, 0, 0, 1, 1,
-0.8404301, -0.3369018, -2.804589, 0, 0, 0, 1, 1,
-0.8378959, -2.266444, -4.202512, 0, 0, 0, 1, 1,
-0.8359256, 0.319581, -0.1759629, 0, 0, 0, 1, 1,
-0.8347945, 0.1718401, -2.503378, 0, 0, 0, 1, 1,
-0.8346915, -1.726163, -2.111771, 0, 0, 0, 1, 1,
-0.833834, -0.2535388, -1.458706, 1, 1, 1, 1, 1,
-0.8335648, 1.011763, -1.671032, 1, 1, 1, 1, 1,
-0.8318549, -0.4053914, -0.5423525, 1, 1, 1, 1, 1,
-0.8311586, -0.1193975, -4.829219, 1, 1, 1, 1, 1,
-0.8311402, 0.9658696, -2.596952, 1, 1, 1, 1, 1,
-0.8307434, -2.437372, -2.210268, 1, 1, 1, 1, 1,
-0.8304362, 0.03655479, -0.534198, 1, 1, 1, 1, 1,
-0.8256606, 0.02327263, -1.785277, 1, 1, 1, 1, 1,
-0.8247666, 1.367397, -0.06743759, 1, 1, 1, 1, 1,
-0.8217579, 0.07936002, -1.887859, 1, 1, 1, 1, 1,
-0.8214774, -1.370396, -3.717345, 1, 1, 1, 1, 1,
-0.8192027, -0.4209804, -2.130739, 1, 1, 1, 1, 1,
-0.8184779, 0.257068, -0.009078433, 1, 1, 1, 1, 1,
-0.816626, 0.2755551, -3.257048, 1, 1, 1, 1, 1,
-0.8155249, 0.9773104, 0.9495522, 1, 1, 1, 1, 1,
-0.8154243, -1.344983, -2.904494, 0, 0, 1, 1, 1,
-0.8143645, 1.187164, -0.144901, 1, 0, 0, 1, 1,
-0.8093171, -0.06351, -1.276714, 1, 0, 0, 1, 1,
-0.8089032, -1.673101, -2.973271, 1, 0, 0, 1, 1,
-0.8023763, -0.1651616, 0.02275781, 1, 0, 0, 1, 1,
-0.8016068, -1.198038, -3.078283, 1, 0, 0, 1, 1,
-0.7939064, -0.5488177, -1.32128, 0, 0, 0, 1, 1,
-0.7929705, -0.2005761, -1.747602, 0, 0, 0, 1, 1,
-0.7852172, -0.2938535, -1.439138, 0, 0, 0, 1, 1,
-0.7849626, 1.158155, -1.466327, 0, 0, 0, 1, 1,
-0.784215, 0.486758, 0.9426952, 0, 0, 0, 1, 1,
-0.7808427, 0.8478039, 0.08176508, 0, 0, 0, 1, 1,
-0.7780828, 0.9558579, -0.9353083, 0, 0, 0, 1, 1,
-0.7696227, 0.6950457, 0.2836153, 1, 1, 1, 1, 1,
-0.7689176, -1.149887, -2.812851, 1, 1, 1, 1, 1,
-0.7687783, 0.8369994, -1.872957, 1, 1, 1, 1, 1,
-0.7667993, 1.105446, 1.030657, 1, 1, 1, 1, 1,
-0.7583822, 1.344205, -0.3652486, 1, 1, 1, 1, 1,
-0.7581894, 0.9634809, -1.571112, 1, 1, 1, 1, 1,
-0.7496975, 0.7049926, -2.518685, 1, 1, 1, 1, 1,
-0.7489704, -1.012517, -2.586443, 1, 1, 1, 1, 1,
-0.7469381, 0.2797727, -0.4013591, 1, 1, 1, 1, 1,
-0.7454385, 1.478309, -1.866717, 1, 1, 1, 1, 1,
-0.7352027, 0.7262458, 0.2631131, 1, 1, 1, 1, 1,
-0.7263143, -0.3005137, -2.209449, 1, 1, 1, 1, 1,
-0.7244121, -0.02873271, -2.155339, 1, 1, 1, 1, 1,
-0.7202276, 0.433535, -1.825052, 1, 1, 1, 1, 1,
-0.7149069, 2.404222, 2.217453, 1, 1, 1, 1, 1,
-0.7091834, -0.2439768, -1.632131, 0, 0, 1, 1, 1,
-0.7051625, -0.06771307, -0.3724474, 1, 0, 0, 1, 1,
-0.7051208, -0.4813995, -1.093968, 1, 0, 0, 1, 1,
-0.7036086, -1.053055, -2.667444, 1, 0, 0, 1, 1,
-0.7020512, -0.1683063, -0.1099565, 1, 0, 0, 1, 1,
-0.701115, 0.6095988, -0.4671845, 1, 0, 0, 1, 1,
-0.6980902, -1.949176, -1.942664, 0, 0, 0, 1, 1,
-0.6891441, 1.402852, 0.3472314, 0, 0, 0, 1, 1,
-0.6750898, -0.3069855, -2.868251, 0, 0, 0, 1, 1,
-0.6749473, -0.826431, -0.1107275, 0, 0, 0, 1, 1,
-0.6724371, 0.9059803, -1.168178, 0, 0, 0, 1, 1,
-0.6649193, 1.121394, 0.07487546, 0, 0, 0, 1, 1,
-0.6624244, -0.8138916, -2.917442, 0, 0, 0, 1, 1,
-0.6623852, 0.04390913, -0.9646747, 1, 1, 1, 1, 1,
-0.6591833, -1.350697, -4.697775, 1, 1, 1, 1, 1,
-0.6565257, 0.1228782, -1.919701, 1, 1, 1, 1, 1,
-0.6552488, 1.975883, 0.05371045, 1, 1, 1, 1, 1,
-0.6546999, -0.352435, -1.753695, 1, 1, 1, 1, 1,
-0.6516831, -0.5912894, -1.929068, 1, 1, 1, 1, 1,
-0.6496502, 0.4943967, -2.288249, 1, 1, 1, 1, 1,
-0.6489168, 0.2529329, -1.643814, 1, 1, 1, 1, 1,
-0.6420875, -0.2883646, -2.449567, 1, 1, 1, 1, 1,
-0.6328154, 2.516808, 0.5533432, 1, 1, 1, 1, 1,
-0.631144, -0.7754685, -1.46238, 1, 1, 1, 1, 1,
-0.6302129, -0.7403529, -1.878486, 1, 1, 1, 1, 1,
-0.6250563, 0.2422239, -1.278381, 1, 1, 1, 1, 1,
-0.6220919, 0.5060578, -0.4826746, 1, 1, 1, 1, 1,
-0.6186733, 2.797278, 1.981735, 1, 1, 1, 1, 1,
-0.6153066, -0.3500917, -3.618081, 0, 0, 1, 1, 1,
-0.6125822, 0.1845439, -0.4280397, 1, 0, 0, 1, 1,
-0.61048, 0.903653, 0.09888784, 1, 0, 0, 1, 1,
-0.6082672, -0.3011445, -1.351944, 1, 0, 0, 1, 1,
-0.6013199, -0.2861001, -2.254972, 1, 0, 0, 1, 1,
-0.6006774, -0.7412683, -0.3016062, 1, 0, 0, 1, 1,
-0.5986582, -0.2452073, -3.159086, 0, 0, 0, 1, 1,
-0.5958743, 2.932174, 0.09574995, 0, 0, 0, 1, 1,
-0.59342, 3.212528, -0.6650694, 0, 0, 0, 1, 1,
-0.5927674, -0.5307696, -3.424487, 0, 0, 0, 1, 1,
-0.5908217, -0.5788704, -3.747934, 0, 0, 0, 1, 1,
-0.5905379, -0.1145931, -0.9333116, 0, 0, 0, 1, 1,
-0.5905071, 0.5573965, -1.887668, 0, 0, 0, 1, 1,
-0.5871434, 1.511286, 0.07345144, 1, 1, 1, 1, 1,
-0.5862644, -0.2798993, -2.586096, 1, 1, 1, 1, 1,
-0.5793251, -1.589632, -5.146798, 1, 1, 1, 1, 1,
-0.5786198, 0.8918251, -0.5550429, 1, 1, 1, 1, 1,
-0.5778287, -0.721203, -1.021631, 1, 1, 1, 1, 1,
-0.572614, -0.3757762, -1.724079, 1, 1, 1, 1, 1,
-0.5663132, 0.5074666, -2.606396, 1, 1, 1, 1, 1,
-0.5654448, 1.236802, -2.034014, 1, 1, 1, 1, 1,
-0.5645211, 0.833932, -1.011277, 1, 1, 1, 1, 1,
-0.5596151, -0.2326689, -1.762857, 1, 1, 1, 1, 1,
-0.5565617, -0.6034984, -3.071248, 1, 1, 1, 1, 1,
-0.5540863, 0.5780385, -0.6045454, 1, 1, 1, 1, 1,
-0.5521747, 3.194706, 0.6482212, 1, 1, 1, 1, 1,
-0.552048, 1.970073, -0.592006, 1, 1, 1, 1, 1,
-0.549942, 0.9109179, -2.925884, 1, 1, 1, 1, 1,
-0.5474313, 0.1932998, -1.040731, 0, 0, 1, 1, 1,
-0.535715, -0.3996061, -2.307712, 1, 0, 0, 1, 1,
-0.535168, 0.9846744, -1.0145, 1, 0, 0, 1, 1,
-0.5325074, 1.927976, -1.26103, 1, 0, 0, 1, 1,
-0.5282081, -1.571181, -4.158431, 1, 0, 0, 1, 1,
-0.5281185, -0.7091825, -1.816414, 1, 0, 0, 1, 1,
-0.527548, 0.1903993, -1.939297, 0, 0, 0, 1, 1,
-0.5243954, -0.4289553, -4.30432, 0, 0, 0, 1, 1,
-0.5200043, 0.5253167, -0.07596269, 0, 0, 0, 1, 1,
-0.5196093, 0.03113502, -1.12279, 0, 0, 0, 1, 1,
-0.5175136, -0.5698684, -2.155426, 0, 0, 0, 1, 1,
-0.515881, 0.277723, -1.955771, 0, 0, 0, 1, 1,
-0.5142458, -1.436463, -3.44992, 0, 0, 0, 1, 1,
-0.5095416, 0.6784698, 0.2790569, 1, 1, 1, 1, 1,
-0.5007104, 1.653098, 1.017119, 1, 1, 1, 1, 1,
-0.5005267, -0.2842008, -3.698947, 1, 1, 1, 1, 1,
-0.4960293, 0.8942953, 0.1709815, 1, 1, 1, 1, 1,
-0.4912862, 0.9665068, -1.871744, 1, 1, 1, 1, 1,
-0.4868868, 0.9198476, -0.3853805, 1, 1, 1, 1, 1,
-0.4864527, 1.099276, -0.9203308, 1, 1, 1, 1, 1,
-0.4847244, 0.180311, 0.4008559, 1, 1, 1, 1, 1,
-0.4830395, 1.22873, -1.019232, 1, 1, 1, 1, 1,
-0.4812795, 0.9568021, -1.30904, 1, 1, 1, 1, 1,
-0.4801959, 0.008599561, -3.4655, 1, 1, 1, 1, 1,
-0.476841, 0.6999638, -0.8315208, 1, 1, 1, 1, 1,
-0.4763145, -1.416593, -3.818955, 1, 1, 1, 1, 1,
-0.4747722, -0.8374666, -3.081027, 1, 1, 1, 1, 1,
-0.4740196, 0.3161275, 0.4503466, 1, 1, 1, 1, 1,
-0.4698828, 1.379063, -0.6018231, 0, 0, 1, 1, 1,
-0.4677193, 0.724241, 0.1542307, 1, 0, 0, 1, 1,
-0.4626873, 0.8524669, -0.6236548, 1, 0, 0, 1, 1,
-0.4620699, 0.7543519, 0.9484528, 1, 0, 0, 1, 1,
-0.4599459, -0.2686584, -2.252761, 1, 0, 0, 1, 1,
-0.4594341, 0.7173638, -0.4077764, 1, 0, 0, 1, 1,
-0.4587932, 0.3962839, -1.386547, 0, 0, 0, 1, 1,
-0.4578382, -0.7081949, -2.901589, 0, 0, 0, 1, 1,
-0.4561646, 1.525617, 0.3363905, 0, 0, 0, 1, 1,
-0.4524117, -1.472573, -2.647626, 0, 0, 0, 1, 1,
-0.4511814, -0.7924913, -3.174537, 0, 0, 0, 1, 1,
-0.4499364, -0.8230376, -2.960277, 0, 0, 0, 1, 1,
-0.4492587, -1.192555, -1.976088, 0, 0, 0, 1, 1,
-0.4492206, 0.2814216, -0.4674929, 1, 1, 1, 1, 1,
-0.4479689, 1.335738, 0.6446284, 1, 1, 1, 1, 1,
-0.4474659, 0.803512, -0.8906507, 1, 1, 1, 1, 1,
-0.4443141, 1.501675, -0.7245507, 1, 1, 1, 1, 1,
-0.4427284, 0.3300908, -0.6007677, 1, 1, 1, 1, 1,
-0.4413429, -1.606961, -3.226069, 1, 1, 1, 1, 1,
-0.4385451, 0.7747065, 0.3527471, 1, 1, 1, 1, 1,
-0.4382466, -0.7564593, -1.914639, 1, 1, 1, 1, 1,
-0.4349028, -0.4446833, -4.963646, 1, 1, 1, 1, 1,
-0.427421, -0.4237952, -2.374106, 1, 1, 1, 1, 1,
-0.4200404, -0.3898264, -2.470639, 1, 1, 1, 1, 1,
-0.4196833, 0.4416467, -1.579123, 1, 1, 1, 1, 1,
-0.4186072, 0.3806043, -1.429825, 1, 1, 1, 1, 1,
-0.4120589, -0.5338529, -2.063398, 1, 1, 1, 1, 1,
-0.4082974, -0.07884052, -0.2533181, 1, 1, 1, 1, 1,
-0.4045887, 0.07875625, -1.659455, 0, 0, 1, 1, 1,
-0.4036212, -1.225244, -1.854744, 1, 0, 0, 1, 1,
-0.3944632, 0.2643151, -0.667206, 1, 0, 0, 1, 1,
-0.392516, 2.553725, 1.018888, 1, 0, 0, 1, 1,
-0.3918073, 0.728933, -1.204516, 1, 0, 0, 1, 1,
-0.3885371, 0.4528432, 0.8359106, 1, 0, 0, 1, 1,
-0.3870206, 1.235998, -0.1162059, 0, 0, 0, 1, 1,
-0.3856208, -0.7907388, -1.151044, 0, 0, 0, 1, 1,
-0.3853666, 0.0438889, -1.567829, 0, 0, 0, 1, 1,
-0.3850333, -1.236379, -3.659221, 0, 0, 0, 1, 1,
-0.3841843, 0.5285745, -0.6204769, 0, 0, 0, 1, 1,
-0.3803846, 1.59117, -0.7279988, 0, 0, 0, 1, 1,
-0.3794911, -0.5012137, -3.216558, 0, 0, 0, 1, 1,
-0.3735545, 1.103481, -0.7997286, 1, 1, 1, 1, 1,
-0.3731219, -0.1278905, -2.826252, 1, 1, 1, 1, 1,
-0.3720927, -2.416646, -3.010656, 1, 1, 1, 1, 1,
-0.3687012, 0.1486551, -1.300921, 1, 1, 1, 1, 1,
-0.3682632, -0.7164891, -2.905814, 1, 1, 1, 1, 1,
-0.3669178, 0.7160825, -0.6231933, 1, 1, 1, 1, 1,
-0.3647642, -0.5451518, -2.045757, 1, 1, 1, 1, 1,
-0.3646551, -1.441606, -2.640417, 1, 1, 1, 1, 1,
-0.3525666, 0.2360364, -1.936595, 1, 1, 1, 1, 1,
-0.3490184, -0.9596453, -1.927327, 1, 1, 1, 1, 1,
-0.344651, -0.2727313, -2.790219, 1, 1, 1, 1, 1,
-0.3426208, -1.955272, -0.9481221, 1, 1, 1, 1, 1,
-0.339771, 0.9971232, 0.6080813, 1, 1, 1, 1, 1,
-0.3384871, -0.2122559, -1.960193, 1, 1, 1, 1, 1,
-0.335584, -1.548769, -3.238298, 1, 1, 1, 1, 1,
-0.3343949, -0.2329489, -3.105653, 0, 0, 1, 1, 1,
-0.3334005, 0.7147662, -0.3524697, 1, 0, 0, 1, 1,
-0.3328714, -0.576635, -3.263839, 1, 0, 0, 1, 1,
-0.3318277, -0.5064682, -2.354346, 1, 0, 0, 1, 1,
-0.3307989, 1.865859, 0.4536473, 1, 0, 0, 1, 1,
-0.3210742, 0.1123733, -2.036787, 1, 0, 0, 1, 1,
-0.3181778, 0.3612979, -0.9781125, 0, 0, 0, 1, 1,
-0.3177886, 0.1456937, -1.138018, 0, 0, 0, 1, 1,
-0.3173684, -0.02190381, -1.754948, 0, 0, 0, 1, 1,
-0.3171225, -0.007624266, -1.233811, 0, 0, 0, 1, 1,
-0.3147117, -1.653436, -2.594528, 0, 0, 0, 1, 1,
-0.312765, 0.03092177, -2.060327, 0, 0, 0, 1, 1,
-0.3071762, -0.5176969, -3.469982, 0, 0, 0, 1, 1,
-0.3068682, -0.2174628, -2.861002, 1, 1, 1, 1, 1,
-0.3047092, -0.2073189, -1.420711, 1, 1, 1, 1, 1,
-0.3014183, -0.2793178, -2.594743, 1, 1, 1, 1, 1,
-0.2967087, -1.597173, -1.469383, 1, 1, 1, 1, 1,
-0.2951497, 1.144121, -2.78145, 1, 1, 1, 1, 1,
-0.2944176, 0.8345723, -0.7246182, 1, 1, 1, 1, 1,
-0.2908767, -0.4547536, -1.205384, 1, 1, 1, 1, 1,
-0.2870726, -0.1373219, -2.922014, 1, 1, 1, 1, 1,
-0.2853653, -0.295532, -1.712524, 1, 1, 1, 1, 1,
-0.2852109, -0.09878224, -2.802619, 1, 1, 1, 1, 1,
-0.2845639, -0.2577083, -0.8052222, 1, 1, 1, 1, 1,
-0.2835317, 0.4856531, -0.5351406, 1, 1, 1, 1, 1,
-0.2802387, 0.6721796, -0.1786642, 1, 1, 1, 1, 1,
-0.2789473, 1.126686, 0.3420873, 1, 1, 1, 1, 1,
-0.2765905, -1.17362, -2.353193, 1, 1, 1, 1, 1,
-0.2712909, 0.3678438, 0.3485831, 0, 0, 1, 1, 1,
-0.2679528, 0.4675568, -2.142189, 1, 0, 0, 1, 1,
-0.2649382, 1.187897, 1.177879, 1, 0, 0, 1, 1,
-0.263763, -1.065853, -3.837384, 1, 0, 0, 1, 1,
-0.2637576, -0.3455184, -2.394543, 1, 0, 0, 1, 1,
-0.261048, 1.18845, -0.9247572, 1, 0, 0, 1, 1,
-0.2587297, -0.3792435, -1.673889, 0, 0, 0, 1, 1,
-0.2582336, -0.5575712, -2.168851, 0, 0, 0, 1, 1,
-0.2555864, 0.416323, -0.8528211, 0, 0, 0, 1, 1,
-0.2539146, 0.3361843, -0.8823584, 0, 0, 0, 1, 1,
-0.2529503, 1.285962, -1.823999, 0, 0, 0, 1, 1,
-0.2526889, -0.5826508, -1.795586, 0, 0, 0, 1, 1,
-0.2514064, -1.196641, -2.891824, 0, 0, 0, 1, 1,
-0.2501807, -0.9648466, -2.225693, 1, 1, 1, 1, 1,
-0.2490625, 1.99028, -0.7766327, 1, 1, 1, 1, 1,
-0.2490147, -0.9795756, -4.307278, 1, 1, 1, 1, 1,
-0.2458106, -1.180232, -4.288166, 1, 1, 1, 1, 1,
-0.2439682, -0.07470373, -2.079305, 1, 1, 1, 1, 1,
-0.2427754, 1.69047, 0.2931572, 1, 1, 1, 1, 1,
-0.2352047, -0.07221063, -1.294593, 1, 1, 1, 1, 1,
-0.2332564, -0.8436804, -3.325547, 1, 1, 1, 1, 1,
-0.2319075, -0.9744357, -2.153591, 1, 1, 1, 1, 1,
-0.2280118, -0.03089549, -2.191017, 1, 1, 1, 1, 1,
-0.2268374, -1.630718, -3.933126, 1, 1, 1, 1, 1,
-0.2246258, -0.1239666, -2.156185, 1, 1, 1, 1, 1,
-0.2242427, 0.2264931, -2.494423, 1, 1, 1, 1, 1,
-0.2193051, 0.4944136, 0.2441532, 1, 1, 1, 1, 1,
-0.2166303, -0.1707928, -4.009276, 1, 1, 1, 1, 1,
-0.2119403, 0.3930428, -1.620069, 0, 0, 1, 1, 1,
-0.2064893, 0.856968, -0.6505888, 1, 0, 0, 1, 1,
-0.2048267, 2.318451, 0.001894895, 1, 0, 0, 1, 1,
-0.2032239, 0.6100031, 0.6890506, 1, 0, 0, 1, 1,
-0.2021597, 0.2618446, 0.215885, 1, 0, 0, 1, 1,
-0.2005063, -1.579386, -2.530853, 1, 0, 0, 1, 1,
-0.2003533, -1.538518, -2.211725, 0, 0, 0, 1, 1,
-0.1970624, -0.5494031, -2.610165, 0, 0, 0, 1, 1,
-0.1967883, 0.5330889, -0.6074839, 0, 0, 0, 1, 1,
-0.1914202, -1.56752, -4.890969, 0, 0, 0, 1, 1,
-0.190116, -2.082828, -3.765969, 0, 0, 0, 1, 1,
-0.1841881, 1.760732, 0.9310558, 0, 0, 0, 1, 1,
-0.1814875, -0.8227034, -1.745538, 0, 0, 0, 1, 1,
-0.1779159, -0.1334323, -2.170177, 1, 1, 1, 1, 1,
-0.1774135, -1.545932, -4.063259, 1, 1, 1, 1, 1,
-0.1769148, -1.510224, -2.745403, 1, 1, 1, 1, 1,
-0.1740231, -0.239093, -2.452614, 1, 1, 1, 1, 1,
-0.1734075, -1.129575, -3.007826, 1, 1, 1, 1, 1,
-0.1693519, 0.1427171, -2.125404, 1, 1, 1, 1, 1,
-0.1689432, -0.1137329, -1.273434, 1, 1, 1, 1, 1,
-0.1665863, 0.06068202, -1.772569, 1, 1, 1, 1, 1,
-0.1664082, 1.634611, -0.6286128, 1, 1, 1, 1, 1,
-0.1601532, 0.08966371, -0.548622, 1, 1, 1, 1, 1,
-0.1597093, -0.5429557, -2.480238, 1, 1, 1, 1, 1,
-0.1570574, 0.6346588, -1.727634, 1, 1, 1, 1, 1,
-0.1570135, -0.3900539, -3.414509, 1, 1, 1, 1, 1,
-0.1561818, 0.01878692, -2.213374, 1, 1, 1, 1, 1,
-0.1552005, 0.4877641, 0.4773509, 1, 1, 1, 1, 1,
-0.155018, 0.5604718, -0.1166785, 0, 0, 1, 1, 1,
-0.151288, -0.3550008, -3.520295, 1, 0, 0, 1, 1,
-0.1505655, 1.12254, 1.39825, 1, 0, 0, 1, 1,
-0.1474997, 1.47588, -0.1794147, 1, 0, 0, 1, 1,
-0.1472814, -0.1529718, -2.359504, 1, 0, 0, 1, 1,
-0.1469555, 0.5606899, -0.05047443, 1, 0, 0, 1, 1,
-0.1468234, 0.8564056, -1.474904, 0, 0, 0, 1, 1,
-0.1391285, -1.225116, -2.843853, 0, 0, 0, 1, 1,
-0.1330211, 0.8105015, -0.891176, 0, 0, 0, 1, 1,
-0.1304204, -0.09032603, -1.996615, 0, 0, 0, 1, 1,
-0.1286253, -2.025648, -3.44378, 0, 0, 0, 1, 1,
-0.1282236, -0.4491119, -3.901263, 0, 0, 0, 1, 1,
-0.1252349, 0.01131545, -2.418235, 0, 0, 0, 1, 1,
-0.1222937, 0.1316051, 0.8146217, 1, 1, 1, 1, 1,
-0.1211078, -1.288582, -3.210521, 1, 1, 1, 1, 1,
-0.1133783, -1.302355, -1.969863, 1, 1, 1, 1, 1,
-0.1063681, -1.652584, -3.425838, 1, 1, 1, 1, 1,
-0.1030669, 0.7016057, 0.06487232, 1, 1, 1, 1, 1,
-0.09895987, -1.251377, -2.478379, 1, 1, 1, 1, 1,
-0.0894837, -0.5986834, -2.138483, 1, 1, 1, 1, 1,
-0.08923598, -0.2847289, -2.428672, 1, 1, 1, 1, 1,
-0.08805466, 0.5535765, -0.3221141, 1, 1, 1, 1, 1,
-0.08507589, -0.8197194, -5.267103, 1, 1, 1, 1, 1,
-0.07806661, -0.5590292, -5.127226, 1, 1, 1, 1, 1,
-0.07646659, -0.6207895, -1.954335, 1, 1, 1, 1, 1,
-0.07607049, 0.3039509, -1.632221, 1, 1, 1, 1, 1,
-0.06904958, 0.06709717, -2.33237, 1, 1, 1, 1, 1,
-0.06868044, 0.8841866, -1.943799, 1, 1, 1, 1, 1,
-0.06532402, -0.4726149, -3.473889, 0, 0, 1, 1, 1,
-0.06292688, -2.236687, -3.569872, 1, 0, 0, 1, 1,
-0.06110975, -0.9164521, -3.301604, 1, 0, 0, 1, 1,
-0.06104581, 0.1416633, 0.8301435, 1, 0, 0, 1, 1,
-0.06031229, -1.010661, -4.003274, 1, 0, 0, 1, 1,
-0.06019041, 3.021781, -0.1513862, 1, 0, 0, 1, 1,
-0.05364275, -0.2796004, -2.311104, 0, 0, 0, 1, 1,
-0.05347104, -1.292318, -2.20493, 0, 0, 0, 1, 1,
-0.05253987, -0.3013406, -3.986768, 0, 0, 0, 1, 1,
-0.05206612, 1.267464, 0.8726121, 0, 0, 0, 1, 1,
-0.05180095, -0.2548771, -1.185889, 0, 0, 0, 1, 1,
-0.04878308, 0.667559, 0.2431094, 0, 0, 0, 1, 1,
-0.0444974, 0.2166584, -0.1300498, 0, 0, 0, 1, 1,
-0.04377347, 0.1995351, 0.1359512, 1, 1, 1, 1, 1,
-0.04344061, -1.676764, -6.152437, 1, 1, 1, 1, 1,
-0.04278532, 1.707113, 1.030735, 1, 1, 1, 1, 1,
-0.04084362, 0.5064387, 1.277867, 1, 1, 1, 1, 1,
-0.03311097, -0.3161864, -2.8141, 1, 1, 1, 1, 1,
-0.03153314, -0.8361883, -2.944763, 1, 1, 1, 1, 1,
-0.03146173, 0.2021996, 0.7857246, 1, 1, 1, 1, 1,
-0.02986117, -0.300155, -2.96441, 1, 1, 1, 1, 1,
-0.02930657, 0.41208, 0.8213544, 1, 1, 1, 1, 1,
-0.02824855, 1.893466, 0.2753477, 1, 1, 1, 1, 1,
-0.02555556, 2.076236, 1.10332, 1, 1, 1, 1, 1,
-0.02282602, 0.9515766, 1.17192, 1, 1, 1, 1, 1,
-0.02094288, 0.2551772, 0.8891788, 1, 1, 1, 1, 1,
-0.0184665, -0.8209121, -3.637149, 1, 1, 1, 1, 1,
-0.01826313, 0.8636956, -0.3730887, 1, 1, 1, 1, 1,
-0.01336947, -0.1018887, -3.406673, 0, 0, 1, 1, 1,
-0.01209502, -1.557961, -3.941202, 1, 0, 0, 1, 1,
-0.006759583, -1.43314, -4.053113, 1, 0, 0, 1, 1,
-8.291223e-05, 0.6099071, -1.321996, 1, 0, 0, 1, 1,
0.0001890342, 0.324167, -1.359159, 1, 0, 0, 1, 1,
0.0006236481, 0.1170871, 1.31874, 1, 0, 0, 1, 1,
0.002079799, -0.825014, 3.137324, 0, 0, 0, 1, 1,
0.003046326, 0.1087692, 0.03627918, 0, 0, 0, 1, 1,
0.003836432, 1.181266, -0.09491979, 0, 0, 0, 1, 1,
0.01867746, -0.5689017, 4.104239, 0, 0, 0, 1, 1,
0.02382525, 0.2182504, -1.314672, 0, 0, 0, 1, 1,
0.02420953, 0.1566588, 0.9059127, 0, 0, 0, 1, 1,
0.0259355, -0.02765624, 3.820596, 0, 0, 0, 1, 1,
0.03113174, 1.825123, 0.1794353, 1, 1, 1, 1, 1,
0.031239, 1.293902, 0.6799458, 1, 1, 1, 1, 1,
0.03386314, -0.1038957, 1.936422, 1, 1, 1, 1, 1,
0.03531801, -1.579877, 5.571333, 1, 1, 1, 1, 1,
0.03801102, -1.066224, 3.492456, 1, 1, 1, 1, 1,
0.03843581, 1.149599, 0.1615724, 1, 1, 1, 1, 1,
0.04228711, 0.2921942, 0.1985718, 1, 1, 1, 1, 1,
0.04284783, -1.410337, 2.606982, 1, 1, 1, 1, 1,
0.05010429, -0.5394734, 4.101451, 1, 1, 1, 1, 1,
0.05271588, -0.6873404, 2.606299, 1, 1, 1, 1, 1,
0.05344448, -0.3838391, 2.567759, 1, 1, 1, 1, 1,
0.06878323, 0.2270266, -0.2977636, 1, 1, 1, 1, 1,
0.07039946, 0.6326118, -0.5357102, 1, 1, 1, 1, 1,
0.07047813, 0.5003716, 2.210485, 1, 1, 1, 1, 1,
0.07545082, -0.04582728, 2.834537, 1, 1, 1, 1, 1,
0.07716899, -0.3087944, 0.9385371, 0, 0, 1, 1, 1,
0.08177574, -0.5956844, 3.571763, 1, 0, 0, 1, 1,
0.08249584, 1.553889, -0.6602128, 1, 0, 0, 1, 1,
0.08453381, -0.9083323, 0.4607755, 1, 0, 0, 1, 1,
0.08654249, 1.658388, -0.4884205, 1, 0, 0, 1, 1,
0.0871972, -0.3454527, 2.674648, 1, 0, 0, 1, 1,
0.087961, -0.922116, 1.612775, 0, 0, 0, 1, 1,
0.08870012, -0.3612623, 2.131746, 0, 0, 0, 1, 1,
0.09027293, 1.664384, 1.252997, 0, 0, 0, 1, 1,
0.0919467, 0.614296, 0.894786, 0, 0, 0, 1, 1,
0.092626, -0.6033303, 3.657208, 0, 0, 0, 1, 1,
0.09372125, -0.1203672, 2.467029, 0, 0, 0, 1, 1,
0.09485561, 0.8023207, 1.096573, 0, 0, 0, 1, 1,
0.1029656, -0.2345169, 3.534309, 1, 1, 1, 1, 1,
0.1032293, 0.9799151, -0.9065241, 1, 1, 1, 1, 1,
0.1052314, 0.6643009, 0.5474503, 1, 1, 1, 1, 1,
0.1060068, -1.948151, 2.741874, 1, 1, 1, 1, 1,
0.1077766, 0.4988937, 0.2294238, 1, 1, 1, 1, 1,
0.1079108, 0.3541179, -0.120438, 1, 1, 1, 1, 1,
0.1080177, -0.43205, 3.727893, 1, 1, 1, 1, 1,
0.1093975, -0.5546658, 2.037241, 1, 1, 1, 1, 1,
0.1108891, 1.368151, 0.3944532, 1, 1, 1, 1, 1,
0.1119563, -0.8995252, 2.973811, 1, 1, 1, 1, 1,
0.1238673, -0.8313543, 3.398581, 1, 1, 1, 1, 1,
0.1246273, -0.2674243, 3.299453, 1, 1, 1, 1, 1,
0.1253674, 0.446606, -0.1272542, 1, 1, 1, 1, 1,
0.1279908, 0.3857342, 1.813694, 1, 1, 1, 1, 1,
0.1336136, 1.156736, 0.8443842, 1, 1, 1, 1, 1,
0.133744, 0.9083533, -1.509862, 0, 0, 1, 1, 1,
0.1460557, 0.8477879, -1.277048, 1, 0, 0, 1, 1,
0.1514282, 0.6338145, -0.8516517, 1, 0, 0, 1, 1,
0.1557914, 0.4449251, 0.005581024, 1, 0, 0, 1, 1,
0.1558793, -1.275128, 3.017097, 1, 0, 0, 1, 1,
0.1663356, -0.6329994, 4.215042, 1, 0, 0, 1, 1,
0.1688901, -0.4036317, 2.337553, 0, 0, 0, 1, 1,
0.169333, -0.6420439, 2.548646, 0, 0, 0, 1, 1,
0.173946, 0.8100868, -2.244979, 0, 0, 0, 1, 1,
0.1811437, -0.7550175, 3.775278, 0, 0, 0, 1, 1,
0.1815077, 0.9629804, 0.3845225, 0, 0, 0, 1, 1,
0.1881109, -0.3961148, 2.955195, 0, 0, 0, 1, 1,
0.1894299, 0.05501856, -0.04738356, 0, 0, 0, 1, 1,
0.1896552, 1.086018, 0.774215, 1, 1, 1, 1, 1,
0.1902399, 2.042151, 0.09011891, 1, 1, 1, 1, 1,
0.1902545, -1.328323, 3.840375, 1, 1, 1, 1, 1,
0.1943331, -0.724023, 1.786967, 1, 1, 1, 1, 1,
0.1994987, 2.521199, 0.6386974, 1, 1, 1, 1, 1,
0.2061547, -1.668016, 2.167968, 1, 1, 1, 1, 1,
0.2062955, -1.04692, 3.473256, 1, 1, 1, 1, 1,
0.2078086, 1.736267, 0.4421477, 1, 1, 1, 1, 1,
0.2098258, 2.446401, -0.08497565, 1, 1, 1, 1, 1,
0.2104071, 0.2729468, 1.210415, 1, 1, 1, 1, 1,
0.2137583, 1.071352, -1.358039, 1, 1, 1, 1, 1,
0.2164327, -0.7811738, 4.019421, 1, 1, 1, 1, 1,
0.2228629, 0.1447681, 0.3868344, 1, 1, 1, 1, 1,
0.2242914, 0.279664, 1.711844, 1, 1, 1, 1, 1,
0.227458, -0.4734768, 2.032549, 1, 1, 1, 1, 1,
0.2336044, 0.8494583, 0.4290877, 0, 0, 1, 1, 1,
0.2349589, 1.071718, 0.2151502, 1, 0, 0, 1, 1,
0.2396282, 0.03249422, 1.367801, 1, 0, 0, 1, 1,
0.2410321, -0.6742392, 2.025563, 1, 0, 0, 1, 1,
0.2416811, 1.131303, 0.3953259, 1, 0, 0, 1, 1,
0.2460594, -1.170594, 3.421956, 1, 0, 0, 1, 1,
0.2581, 0.9965269, 1.400186, 0, 0, 0, 1, 1,
0.2583736, -0.830537, 1.980605, 0, 0, 0, 1, 1,
0.2592529, -1.647678, 2.523094, 0, 0, 0, 1, 1,
0.2605609, -0.167227, 4.533494, 0, 0, 0, 1, 1,
0.2613233, 0.9982243, -0.7519311, 0, 0, 0, 1, 1,
0.2667861, 2.277218, 0.04420897, 0, 0, 0, 1, 1,
0.2724322, 1.775735, 0.6121272, 0, 0, 0, 1, 1,
0.2764242, -1.440551, 4.264167, 1, 1, 1, 1, 1,
0.2864985, -0.6443337, 3.932191, 1, 1, 1, 1, 1,
0.2879318, 0.6320468, -1.546687, 1, 1, 1, 1, 1,
0.2899131, -1.693357, 2.32681, 1, 1, 1, 1, 1,
0.2937317, 0.3084809, -0.6144788, 1, 1, 1, 1, 1,
0.2954742, -0.3148661, 2.138949, 1, 1, 1, 1, 1,
0.3036115, -0.04000518, 2.035282, 1, 1, 1, 1, 1,
0.3094296, 0.5484553, 0.3073461, 1, 1, 1, 1, 1,
0.3094648, -0.8459905, 3.919757, 1, 1, 1, 1, 1,
0.3106627, 0.8993957, 0.7681001, 1, 1, 1, 1, 1,
0.3110718, -0.7134037, 4.438318, 1, 1, 1, 1, 1,
0.3160519, 0.2190937, -0.3599139, 1, 1, 1, 1, 1,
0.316609, -0.5370772, 2.576661, 1, 1, 1, 1, 1,
0.3196054, -1.683585, 5.065943, 1, 1, 1, 1, 1,
0.321535, 1.638509, 0.5399984, 1, 1, 1, 1, 1,
0.3220749, 0.1272434, 1.986269, 0, 0, 1, 1, 1,
0.3239615, -0.9340755, 0.5786034, 1, 0, 0, 1, 1,
0.3245244, -2.42444, 2.973704, 1, 0, 0, 1, 1,
0.3249578, -0.1379224, 1.632322, 1, 0, 0, 1, 1,
0.3249757, -3.036784, 5.683564, 1, 0, 0, 1, 1,
0.3266605, -0.4362856, 2.560765, 1, 0, 0, 1, 1,
0.3288039, -0.05741431, 1.619904, 0, 0, 0, 1, 1,
0.3293946, -1.884273, 3.549412, 0, 0, 0, 1, 1,
0.3325715, 0.2743773, 1.557856, 0, 0, 0, 1, 1,
0.3359551, 1.62919, -2.158575, 0, 0, 0, 1, 1,
0.3375049, 2.44974, -0.8546138, 0, 0, 0, 1, 1,
0.3393334, 0.2655505, 0.3955711, 0, 0, 0, 1, 1,
0.3434513, -0.7818257, 3.104074, 0, 0, 0, 1, 1,
0.3457445, -0.4843626, 2.702826, 1, 1, 1, 1, 1,
0.3460668, 0.04855141, 0.2626524, 1, 1, 1, 1, 1,
0.350486, 1.361979, 0.1821313, 1, 1, 1, 1, 1,
0.3528052, -0.7926818, 2.20929, 1, 1, 1, 1, 1,
0.352847, 0.004473926, 3.327037, 1, 1, 1, 1, 1,
0.3556584, -1.056895, 0.8254419, 1, 1, 1, 1, 1,
0.3558977, -2.765981, 1.826187, 1, 1, 1, 1, 1,
0.3608235, -0.7974945, 3.638415, 1, 1, 1, 1, 1,
0.3609498, 0.07525208, -0.1047716, 1, 1, 1, 1, 1,
0.3617999, 0.8502824, -0.4896563, 1, 1, 1, 1, 1,
0.3625436, 1.183813, -0.699221, 1, 1, 1, 1, 1,
0.3647812, 0.3891338, 1.435165, 1, 1, 1, 1, 1,
0.3667792, 1.352918, -0.06658831, 1, 1, 1, 1, 1,
0.3683764, -0.1074331, 2.735191, 1, 1, 1, 1, 1,
0.3686532, 0.5455128, 1.22517, 1, 1, 1, 1, 1,
0.3697908, -0.780865, 2.926083, 0, 0, 1, 1, 1,
0.370172, 0.04250303, -0.09469872, 1, 0, 0, 1, 1,
0.3732325, -1.115156, 1.625184, 1, 0, 0, 1, 1,
0.3733868, 0.9138704, 0.5109601, 1, 0, 0, 1, 1,
0.3749833, -0.3302792, 4.489436, 1, 0, 0, 1, 1,
0.3799086, 1.048554, -0.5033886, 1, 0, 0, 1, 1,
0.3810265, 0.2367672, 0.6135241, 0, 0, 0, 1, 1,
0.3842108, 0.1807342, 1.130561, 0, 0, 0, 1, 1,
0.3864495, 0.62246, 2.535441, 0, 0, 0, 1, 1,
0.3875679, 0.06203381, 1.802199, 0, 0, 0, 1, 1,
0.3876346, -0.2028761, 2.222971, 0, 0, 0, 1, 1,
0.393425, -0.4415842, 1.877257, 0, 0, 0, 1, 1,
0.3955015, 1.20781, -0.8386901, 0, 0, 0, 1, 1,
0.3976554, -0.363871, 2.935162, 1, 1, 1, 1, 1,
0.4030076, 2.165241, -1.34607, 1, 1, 1, 1, 1,
0.4100472, 0.1092127, -0.3999283, 1, 1, 1, 1, 1,
0.410133, 0.9009203, -0.5644653, 1, 1, 1, 1, 1,
0.4118367, -0.4011765, 3.133396, 1, 1, 1, 1, 1,
0.4149242, -1.097502, 1.778444, 1, 1, 1, 1, 1,
0.4191725, 2.117261, -1.050621, 1, 1, 1, 1, 1,
0.4212145, -1.200848, 3.229465, 1, 1, 1, 1, 1,
0.425406, 1.539841, -0.397728, 1, 1, 1, 1, 1,
0.4265739, 0.2237979, 1.232806, 1, 1, 1, 1, 1,
0.4276653, -1.16354, 2.926077, 1, 1, 1, 1, 1,
0.4276726, -0.7865439, 3.410942, 1, 1, 1, 1, 1,
0.4291417, 0.2499781, 0.8750281, 1, 1, 1, 1, 1,
0.4441553, 1.709659, 0.7453586, 1, 1, 1, 1, 1,
0.4449061, 0.3690278, -0.05698785, 1, 1, 1, 1, 1,
0.4460172, -0.5387293, 1.872536, 0, 0, 1, 1, 1,
0.4463323, 0.6545185, 1.280085, 1, 0, 0, 1, 1,
0.4482602, -0.1187468, 3.034888, 1, 0, 0, 1, 1,
0.4593296, -0.6524644, 3.843096, 1, 0, 0, 1, 1,
0.4596838, -0.1416372, 1.65261, 1, 0, 0, 1, 1,
0.4601581, -0.4449817, 0.6129709, 1, 0, 0, 1, 1,
0.4637194, -0.7552359, 3.172325, 0, 0, 0, 1, 1,
0.4787202, -1.496683, 3.784129, 0, 0, 0, 1, 1,
0.483616, 0.1532093, 0.3441148, 0, 0, 0, 1, 1,
0.4837142, -0.5230641, 1.956028, 0, 0, 0, 1, 1,
0.4840108, 1.906709, -0.7799709, 0, 0, 0, 1, 1,
0.4849687, -0.5296546, 3.40004, 0, 0, 0, 1, 1,
0.4893696, 0.5484222, 1.802565, 0, 0, 0, 1, 1,
0.490682, 0.241353, -0.3261508, 1, 1, 1, 1, 1,
0.4933014, 1.266721, 0.6856154, 1, 1, 1, 1, 1,
0.4971288, -0.1522948, 2.080219, 1, 1, 1, 1, 1,
0.5046462, 0.6166082, 1.260244, 1, 1, 1, 1, 1,
0.50748, 0.3079362, -0.0536008, 1, 1, 1, 1, 1,
0.5094734, 0.3083691, -0.7322512, 1, 1, 1, 1, 1,
0.5175449, 1.224713, 0.2127335, 1, 1, 1, 1, 1,
0.5185607, -1.572127, 2.812519, 1, 1, 1, 1, 1,
0.521658, -0.7729378, 2.526606, 1, 1, 1, 1, 1,
0.5241429, 0.4478529, 0.3569978, 1, 1, 1, 1, 1,
0.5292339, -0.7600989, 1.304219, 1, 1, 1, 1, 1,
0.5294831, -0.4671114, 2.03703, 1, 1, 1, 1, 1,
0.5335515, 0.03554823, 1.968656, 1, 1, 1, 1, 1,
0.5352714, -1.863819, 2.493033, 1, 1, 1, 1, 1,
0.5372458, 0.470292, 1.130975, 1, 1, 1, 1, 1,
0.5385005, 1.269594, 0.6887382, 0, 0, 1, 1, 1,
0.5437037, 0.09214022, -0.1364275, 1, 0, 0, 1, 1,
0.5466028, 0.558378, 0.04482467, 1, 0, 0, 1, 1,
0.5475104, 0.3528098, -0.637197, 1, 0, 0, 1, 1,
0.54931, -0.5136847, 1.931041, 1, 0, 0, 1, 1,
0.552502, -0.3986528, 3.702465, 1, 0, 0, 1, 1,
0.5599288, 0.4503858, 0.3816493, 0, 0, 0, 1, 1,
0.5607651, 0.509555, 0.3732563, 0, 0, 0, 1, 1,
0.5617015, -0.9888156, 1.330306, 0, 0, 0, 1, 1,
0.5666811, 0.2699079, 0.4915135, 0, 0, 0, 1, 1,
0.5668857, -0.5592136, 2.653357, 0, 0, 0, 1, 1,
0.5740572, -0.2281085, 1.586691, 0, 0, 0, 1, 1,
0.5769175, -1.173616, 2.574063, 0, 0, 0, 1, 1,
0.5770729, -1.05296, 1.143439, 1, 1, 1, 1, 1,
0.5816132, 0.8417658, 1.051909, 1, 1, 1, 1, 1,
0.583126, -0.9623505, 3.677793, 1, 1, 1, 1, 1,
0.5897855, -0.2735766, 2.836532, 1, 1, 1, 1, 1,
0.5898378, -0.7896014, 1.956119, 1, 1, 1, 1, 1,
0.5928476, 0.04949617, 0.2821723, 1, 1, 1, 1, 1,
0.5975623, -0.4236834, 2.096504, 1, 1, 1, 1, 1,
0.6005373, -1.865317, 2.631894, 1, 1, 1, 1, 1,
0.6009495, 0.8820517, 2.271107, 1, 1, 1, 1, 1,
0.6019039, -1.001481, 2.270085, 1, 1, 1, 1, 1,
0.6025913, -0.004283093, 0.5075457, 1, 1, 1, 1, 1,
0.6038123, -0.02353952, 2.809861, 1, 1, 1, 1, 1,
0.6041717, 0.4633178, 1.454526, 1, 1, 1, 1, 1,
0.6056387, 0.3407722, 0.01450152, 1, 1, 1, 1, 1,
0.6092246, 0.7194579, 1.980258, 1, 1, 1, 1, 1,
0.616272, 0.4554773, 0.9538749, 0, 0, 1, 1, 1,
0.619269, 1.983539, 0.7230897, 1, 0, 0, 1, 1,
0.62214, -0.9733959, 1.916018, 1, 0, 0, 1, 1,
0.6245214, -1.4424, 3.599859, 1, 0, 0, 1, 1,
0.6251447, 0.9841252, -0.5562897, 1, 0, 0, 1, 1,
0.6263902, -1.642262, 5.239189, 1, 0, 0, 1, 1,
0.6385068, 0.5091187, 1.633535, 0, 0, 0, 1, 1,
0.6407288, 2.126013, -1.647845, 0, 0, 0, 1, 1,
0.6428217, -0.7886773, 4.21346, 0, 0, 0, 1, 1,
0.6430618, -0.9492033, 1.556433, 0, 0, 0, 1, 1,
0.6438962, -0.1677363, 0.965067, 0, 0, 0, 1, 1,
0.6465308, 0.8417838, 2.20357, 0, 0, 0, 1, 1,
0.6466396, -0.4892169, -0.3528821, 0, 0, 0, 1, 1,
0.6475213, -1.537512, 3.725116, 1, 1, 1, 1, 1,
0.6490859, 0.7433419, 0.5793327, 1, 1, 1, 1, 1,
0.6507325, 2.208236, -0.6668078, 1, 1, 1, 1, 1,
0.6614669, -0.4921745, 3.276587, 1, 1, 1, 1, 1,
0.662776, 0.07629408, 1.60831, 1, 1, 1, 1, 1,
0.6632845, -0.7902631, 2.449892, 1, 1, 1, 1, 1,
0.6656949, 0.701551, 1.533911, 1, 1, 1, 1, 1,
0.6711445, 1.321642, 0.5986679, 1, 1, 1, 1, 1,
0.6717673, 0.664035, 0.05773676, 1, 1, 1, 1, 1,
0.6725065, -0.7861681, 3.023549, 1, 1, 1, 1, 1,
0.6735513, 0.4800159, 2.526882, 1, 1, 1, 1, 1,
0.6812403, -0.3398915, 3.178295, 1, 1, 1, 1, 1,
0.6828272, -1.169686, 1.088204, 1, 1, 1, 1, 1,
0.6838651, 0.1492018, 0.4519153, 1, 1, 1, 1, 1,
0.686944, 0.3805656, 2.089882, 1, 1, 1, 1, 1,
0.6882424, 0.5680299, 2.168174, 0, 0, 1, 1, 1,
0.6930298, 0.02197435, 2.702913, 1, 0, 0, 1, 1,
0.6950567, -0.979987, 3.644589, 1, 0, 0, 1, 1,
0.6954995, 0.7843358, 1.364204, 1, 0, 0, 1, 1,
0.6963932, 2.088487, -0.2760746, 1, 0, 0, 1, 1,
0.7001828, 0.1626532, 2.122536, 1, 0, 0, 1, 1,
0.7016696, -0.443624, 2.206765, 0, 0, 0, 1, 1,
0.7045751, 1.368403, 0.8379365, 0, 0, 0, 1, 1,
0.7057459, -0.6453386, 2.265386, 0, 0, 0, 1, 1,
0.7057681, -0.4536537, 3.050167, 0, 0, 0, 1, 1,
0.7110448, 0.2240573, 1.02499, 0, 0, 0, 1, 1,
0.7123265, -0.1900257, 1.174608, 0, 0, 0, 1, 1,
0.7159802, -0.7623706, 1.612056, 0, 0, 0, 1, 1,
0.7198992, -1.740307, 2.918182, 1, 1, 1, 1, 1,
0.7221202, -1.189217, 2.683911, 1, 1, 1, 1, 1,
0.7255374, -0.4095125, 3.585296, 1, 1, 1, 1, 1,
0.7271582, 0.8249094, 0.8681545, 1, 1, 1, 1, 1,
0.7277615, 2.171492, 1.577617, 1, 1, 1, 1, 1,
0.7369476, 0.001250703, 0.8750769, 1, 1, 1, 1, 1,
0.7372122, -1.237862, 3.580065, 1, 1, 1, 1, 1,
0.7437246, -0.04952363, 0.1750723, 1, 1, 1, 1, 1,
0.7484261, 1.559237, -1.37526, 1, 1, 1, 1, 1,
0.7530192, 0.4742111, 0.9140369, 1, 1, 1, 1, 1,
0.7554141, -1.983227, 3.250571, 1, 1, 1, 1, 1,
0.7572359, -1.006514, 4.15975, 1, 1, 1, 1, 1,
0.7779217, -1.437064, 2.968338, 1, 1, 1, 1, 1,
0.7796436, 0.03954294, 0.2615987, 1, 1, 1, 1, 1,
0.7812719, -1.000063, 4.030146, 1, 1, 1, 1, 1,
0.784202, -0.5763982, 1.295354, 0, 0, 1, 1, 1,
0.7925029, 0.5431255, -0.04277421, 1, 0, 0, 1, 1,
0.8055609, -0.530777, 2.080835, 1, 0, 0, 1, 1,
0.8219407, -0.357433, 1.250079, 1, 0, 0, 1, 1,
0.823333, -1.290574, 3.905183, 1, 0, 0, 1, 1,
0.8258412, -1.862713, 1.92648, 1, 0, 0, 1, 1,
0.8264756, 0.1746644, 0.03482222, 0, 0, 0, 1, 1,
0.8303604, 0.896377, 0.7067785, 0, 0, 0, 1, 1,
0.8376693, 1.570969, 0.1683179, 0, 0, 0, 1, 1,
0.8561606, 0.1541965, 2.653014, 0, 0, 0, 1, 1,
0.8565249, 1.282895, 2.602306, 0, 0, 0, 1, 1,
0.8620045, -1.049885, 3.8248, 0, 0, 0, 1, 1,
0.8687316, -0.8076412, 3.329383, 0, 0, 0, 1, 1,
0.8693315, -0.3139199, 0.004449997, 1, 1, 1, 1, 1,
0.8732077, 0.785289, 0.3287544, 1, 1, 1, 1, 1,
0.8774405, -1.438458, 2.505058, 1, 1, 1, 1, 1,
0.8800464, -0.7811841, 2.716528, 1, 1, 1, 1, 1,
0.8857616, 1.068985, 2.185905, 1, 1, 1, 1, 1,
0.8875326, -0.3225611, 1.309778, 1, 1, 1, 1, 1,
0.8941348, -1.408091, 3.719543, 1, 1, 1, 1, 1,
0.8946218, -1.303626, 2.814663, 1, 1, 1, 1, 1,
0.8969457, -0.723416, 0.7485625, 1, 1, 1, 1, 1,
0.9023489, 0.5777162, 0.4433521, 1, 1, 1, 1, 1,
0.9101369, 1.490142, 0.1345736, 1, 1, 1, 1, 1,
0.9196779, 0.7333212, 2.08913, 1, 1, 1, 1, 1,
0.9268579, -0.04283709, 1.108991, 1, 1, 1, 1, 1,
0.9295339, -0.524313, 3.185288, 1, 1, 1, 1, 1,
0.9302391, -0.6916825, 3.270198, 1, 1, 1, 1, 1,
0.9400908, 0.3196704, 1.691071, 0, 0, 1, 1, 1,
0.9431741, -0.3013537, 0.1782915, 1, 0, 0, 1, 1,
0.9603319, -0.5252913, 1.172782, 1, 0, 0, 1, 1,
0.9613464, 0.5235844, 2.702216, 1, 0, 0, 1, 1,
0.9616994, 0.1252078, 0.9440118, 1, 0, 0, 1, 1,
0.9666569, -1.55348, 2.212332, 1, 0, 0, 1, 1,
0.9712567, -0.1826261, 1.922853, 0, 0, 0, 1, 1,
0.9748943, -0.2988619, 0.90838, 0, 0, 0, 1, 1,
0.9753709, -0.1219568, 2.776953, 0, 0, 0, 1, 1,
0.9758924, 0.4052069, 1.211914, 0, 0, 0, 1, 1,
0.9769861, -1.205866, 4.245795, 0, 0, 0, 1, 1,
0.9832421, 0.3600575, 1.578499, 0, 0, 0, 1, 1,
0.9869885, -1.492371, 3.491226, 0, 0, 0, 1, 1,
0.9916763, -0.3786376, 2.445221, 1, 1, 1, 1, 1,
0.992233, -0.3123474, 0.448157, 1, 1, 1, 1, 1,
0.992568, -0.232109, 1.392338, 1, 1, 1, 1, 1,
0.9958531, -0.715839, -0.08354049, 1, 1, 1, 1, 1,
0.9976847, -0.5595416, 1.544142, 1, 1, 1, 1, 1,
0.9992916, -1.068411, 2.415145, 1, 1, 1, 1, 1,
1.002169, -0.8078458, 2.81209, 1, 1, 1, 1, 1,
1.00699, 2.82729, -0.1122534, 1, 1, 1, 1, 1,
1.013505, -0.8455616, 1.515385, 1, 1, 1, 1, 1,
1.014816, -0.01088328, 1.856801, 1, 1, 1, 1, 1,
1.0164, 0.4627762, 1.012974, 1, 1, 1, 1, 1,
1.018815, 0.4642798, 2.198658, 1, 1, 1, 1, 1,
1.024132, -2.106565, 4.706354, 1, 1, 1, 1, 1,
1.030104, -0.5262147, 1.59006, 1, 1, 1, 1, 1,
1.042398, -0.9171039, 3.479268, 1, 1, 1, 1, 1,
1.07323, -2.047268, 1.626485, 0, 0, 1, 1, 1,
1.083024, -0.2611182, 0.9606491, 1, 0, 0, 1, 1,
1.08382, 0.3738424, 0.6846997, 1, 0, 0, 1, 1,
1.08834, 0.2869736, 2.46925, 1, 0, 0, 1, 1,
1.089797, 1.379253, 0.7727473, 1, 0, 0, 1, 1,
1.090835, 1.004757, 0.6872671, 1, 0, 0, 1, 1,
1.092437, 0.6049017, 1.584066, 0, 0, 0, 1, 1,
1.092878, -0.4295495, 2.049027, 0, 0, 0, 1, 1,
1.093614, 0.157892, 1.738053, 0, 0, 0, 1, 1,
1.103583, -0.7461969, 2.169391, 0, 0, 0, 1, 1,
1.104589, -2.002981, 3.152798, 0, 0, 0, 1, 1,
1.112241, -1.180081, 1.215825, 0, 0, 0, 1, 1,
1.116557, 0.07997741, 2.011845, 0, 0, 0, 1, 1,
1.120312, -0.7387617, -0.189238, 1, 1, 1, 1, 1,
1.120819, 0.677591, 1.285616, 1, 1, 1, 1, 1,
1.121319, -0.4871535, 2.503629, 1, 1, 1, 1, 1,
1.148584, 0.3910375, -0.06893104, 1, 1, 1, 1, 1,
1.150481, -0.5455841, 1.930159, 1, 1, 1, 1, 1,
1.153353, -1.64332, 2.813132, 1, 1, 1, 1, 1,
1.153681, 0.4577335, 0.3841449, 1, 1, 1, 1, 1,
1.158725, -0.8322558, 3.337889, 1, 1, 1, 1, 1,
1.167904, -0.2256501, 0.2806887, 1, 1, 1, 1, 1,
1.16808, -0.4537896, 2.783627, 1, 1, 1, 1, 1,
1.171374, 1.234546, 0.05981398, 1, 1, 1, 1, 1,
1.172093, 0.6664638, 1.394225, 1, 1, 1, 1, 1,
1.172267, -0.2397258, 2.254338, 1, 1, 1, 1, 1,
1.174031, -0.38159, 2.416282, 1, 1, 1, 1, 1,
1.188829, -0.07124852, 1.636318, 1, 1, 1, 1, 1,
1.190519, 1.528082, -0.4845511, 0, 0, 1, 1, 1,
1.192447, 0.2844355, 2.128187, 1, 0, 0, 1, 1,
1.193875, -2.09281, 4.066448, 1, 0, 0, 1, 1,
1.195478, -0.138867, 1.512664, 1, 0, 0, 1, 1,
1.200995, -0.8428864, 2.102495, 1, 0, 0, 1, 1,
1.20289, 0.3428088, 2.309019, 1, 0, 0, 1, 1,
1.206358, 1.419667, 1.602934, 0, 0, 0, 1, 1,
1.206451, 0.5325908, 1.986084, 0, 0, 0, 1, 1,
1.215056, -2.459491, 2.193888, 0, 0, 0, 1, 1,
1.224395, 0.02782814, 1.758218, 0, 0, 0, 1, 1,
1.229862, 0.7405381, 1.200344, 0, 0, 0, 1, 1,
1.23144, 0.9635358, 1.343489, 0, 0, 0, 1, 1,
1.241054, 0.27479, 3.270786, 0, 0, 0, 1, 1,
1.24137, 0.5059135, 0.4684531, 1, 1, 1, 1, 1,
1.243639, -0.141063, -0.08481854, 1, 1, 1, 1, 1,
1.248273, 0.7112643, 1.754267, 1, 1, 1, 1, 1,
1.24892, 0.09002856, 0.4481049, 1, 1, 1, 1, 1,
1.253284, 0.4296921, 1.885707, 1, 1, 1, 1, 1,
1.254651, 0.1724683, 1.220883, 1, 1, 1, 1, 1,
1.275452, -0.8742464, 1.640872, 1, 1, 1, 1, 1,
1.284929, -0.8341199, 2.095055, 1, 1, 1, 1, 1,
1.295582, 0.04423394, 1.491366, 1, 1, 1, 1, 1,
1.297493, -0.635972, 0.181766, 1, 1, 1, 1, 1,
1.30291, -0.8572829, 2.438591, 1, 1, 1, 1, 1,
1.309281, 1.012498, 1.994434, 1, 1, 1, 1, 1,
1.32893, -0.6842983, 0.9556776, 1, 1, 1, 1, 1,
1.330523, 2.091319, 2.197538, 1, 1, 1, 1, 1,
1.330558, -0.3144154, 3.05291, 1, 1, 1, 1, 1,
1.331563, 0.7465989, 0.05418123, 0, 0, 1, 1, 1,
1.334623, -0.4706348, 1.836736, 1, 0, 0, 1, 1,
1.334866, 1.907294, 1.623719, 1, 0, 0, 1, 1,
1.356103, -0.1858819, 2.043615, 1, 0, 0, 1, 1,
1.386224, 0.07789882, 0.7775878, 1, 0, 0, 1, 1,
1.394805, 1.504725, 1.853793, 1, 0, 0, 1, 1,
1.397547, -1.013182, 2.029971, 0, 0, 0, 1, 1,
1.401758, -0.5150648, 2.237012, 0, 0, 0, 1, 1,
1.459963, 0.09804851, 1.466657, 0, 0, 0, 1, 1,
1.469854, 1.316232, 0.3055893, 0, 0, 0, 1, 1,
1.472741, -0.7681926, -0.05493942, 0, 0, 0, 1, 1,
1.482376, -1.281097, 2.117784, 0, 0, 0, 1, 1,
1.494291, 0.3825333, -0.2507377, 0, 0, 0, 1, 1,
1.528058, 0.546918, -0.1534437, 1, 1, 1, 1, 1,
1.53551, 1.220234, 0.9237878, 1, 1, 1, 1, 1,
1.552292, 0.2422324, 1.564888, 1, 1, 1, 1, 1,
1.558847, 0.4254123, 0.8420603, 1, 1, 1, 1, 1,
1.565002, -0.004350448, 2.386497, 1, 1, 1, 1, 1,
1.570341, -0.4884234, 2.986406, 1, 1, 1, 1, 1,
1.573933, 0.1796599, 2.432942, 1, 1, 1, 1, 1,
1.576784, 2.07217, -0.3875112, 1, 1, 1, 1, 1,
1.57682, -0.3972024, 1.737767, 1, 1, 1, 1, 1,
1.579616, 1.604808, -0.124102, 1, 1, 1, 1, 1,
1.581584, -1.023401, 4.447901, 1, 1, 1, 1, 1,
1.584098, 2.100742, 0.5285987, 1, 1, 1, 1, 1,
1.594627, -0.08873658, 2.032851, 1, 1, 1, 1, 1,
1.596811, -0.3529438, 2.552857, 1, 1, 1, 1, 1,
1.6047, -1.382365, 2.159719, 1, 1, 1, 1, 1,
1.616138, -0.9311729, 3.54998, 0, 0, 1, 1, 1,
1.638875, -1.054208, 2.060719, 1, 0, 0, 1, 1,
1.643943, -0.2313001, 2.487519, 1, 0, 0, 1, 1,
1.652597, -1.720567, 1.373379, 1, 0, 0, 1, 1,
1.660701, -0.9199503, 2.228122, 1, 0, 0, 1, 1,
1.662225, -1.521326, 2.845829, 1, 0, 0, 1, 1,
1.678002, -1.070505, 2.197873, 0, 0, 0, 1, 1,
1.679196, -1.202445, 1.608782, 0, 0, 0, 1, 1,
1.683506, -0.06514807, 1.908307, 0, 0, 0, 1, 1,
1.688082, -0.4193428, 1.876124, 0, 0, 0, 1, 1,
1.691862, -0.7580187, 2.488419, 0, 0, 0, 1, 1,
1.735735, -0.6467433, 1.034238, 0, 0, 0, 1, 1,
1.743602, 0.4599645, 1.948718, 0, 0, 0, 1, 1,
1.760856, 0.1880955, 1.843413, 1, 1, 1, 1, 1,
1.764581, -1.320394, 2.896423, 1, 1, 1, 1, 1,
1.765028, 0.5549757, 1.949087, 1, 1, 1, 1, 1,
1.772713, -0.9905163, 3.304055, 1, 1, 1, 1, 1,
1.773566, 0.9534128, 1.234568, 1, 1, 1, 1, 1,
1.798669, 0.3555708, 1.483368, 1, 1, 1, 1, 1,
1.805822, 0.02240418, 1.751822, 1, 1, 1, 1, 1,
1.829296, -2.090355, 3.004908, 1, 1, 1, 1, 1,
1.87094, 1.193428, 1.01306, 1, 1, 1, 1, 1,
1.886811, 1.249893, 0.9201283, 1, 1, 1, 1, 1,
1.936517, -0.4856462, 1.031395, 1, 1, 1, 1, 1,
1.955773, -0.01760942, 2.912978, 1, 1, 1, 1, 1,
1.99263, -0.3301034, 2.208218, 1, 1, 1, 1, 1,
1.99263, -0.5624561, 1.684518, 1, 1, 1, 1, 1,
2.016805, 0.0847325, 3.367319, 1, 1, 1, 1, 1,
2.016956, 1.5458, -0.7360941, 0, 0, 1, 1, 1,
2.042947, 1.099281, 0.8498082, 1, 0, 0, 1, 1,
2.124688, -1.288303, 2.245444, 1, 0, 0, 1, 1,
2.131319, 1.512274, 0.5007881, 1, 0, 0, 1, 1,
2.19671, -0.381905, 2.216276, 1, 0, 0, 1, 1,
2.249105, 1.530974, 1.704706, 1, 0, 0, 1, 1,
2.253587, 0.5224044, 2.51228, 0, 0, 0, 1, 1,
2.256523, 0.3384018, 0.2503725, 0, 0, 0, 1, 1,
2.297895, -2.544674, 2.858897, 0, 0, 0, 1, 1,
2.312499, 0.9632965, 2.648088, 0, 0, 0, 1, 1,
2.360084, -0.5969, 1.553923, 0, 0, 0, 1, 1,
2.368618, -0.3021344, 0.6842002, 0, 0, 0, 1, 1,
2.433453, -0.246058, 1.702634, 0, 0, 0, 1, 1,
2.49157, -0.4523833, 1.284724, 1, 1, 1, 1, 1,
2.546581, 0.2289442, 1.823442, 1, 1, 1, 1, 1,
2.561414, -0.4971633, 1.304904, 1, 1, 1, 1, 1,
2.624233, -0.977158, 1.939314, 1, 1, 1, 1, 1,
2.670491, -1.32652, 2.027997, 1, 1, 1, 1, 1,
2.719592, 0.7135724, 1.917773, 1, 1, 1, 1, 1,
3.407658, 1.217975, 0.3450881, 1, 1, 1, 1, 1
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
var radius = 10.05204;
var distance = 35.30737;
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
mvMatrix.translate( -0.1420355, -0.140872, 0.2344365 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.30737);
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
