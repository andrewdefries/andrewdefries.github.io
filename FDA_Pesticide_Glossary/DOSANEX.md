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
-3.404119, -0.04731914, -2.108736, 1, 0, 0, 1,
-3.029749, -0.7184653, -2.697848, 1, 0.007843138, 0, 1,
-2.763059, -0.4541439, -0.4945596, 1, 0.01176471, 0, 1,
-2.73613, -1.085453, -3.07773, 1, 0.01960784, 0, 1,
-2.718615, 1.032956, -1.545194, 1, 0.02352941, 0, 1,
-2.713016, 1.197558, -2.081189, 1, 0.03137255, 0, 1,
-2.553816, -0.2233788, 0.3530735, 1, 0.03529412, 0, 1,
-2.53266, -0.8797957, -1.981807, 1, 0.04313726, 0, 1,
-2.504888, 0.4119109, -0.5586283, 1, 0.04705882, 0, 1,
-2.483022, -1.023478, -0.3215466, 1, 0.05490196, 0, 1,
-2.444979, -0.8350726, -2.238244, 1, 0.05882353, 0, 1,
-2.400949, -0.3000846, -2.112231, 1, 0.06666667, 0, 1,
-2.376089, 0.08405676, -1.283741, 1, 0.07058824, 0, 1,
-2.299178, -0.5954816, -1.779892, 1, 0.07843138, 0, 1,
-2.262632, 1.277309, 0.6984737, 1, 0.08235294, 0, 1,
-2.254093, -0.2849723, -1.116386, 1, 0.09019608, 0, 1,
-2.23142, -0.96758, -3.135925, 1, 0.09411765, 0, 1,
-2.209111, -0.7685582, -1.266343, 1, 0.1019608, 0, 1,
-2.20503, -0.09767536, -0.7433926, 1, 0.1098039, 0, 1,
-2.189482, 1.791944, -0.9474079, 1, 0.1137255, 0, 1,
-2.186873, 1.680207, 0.0570775, 1, 0.1215686, 0, 1,
-2.15549, 2.050564, -0.2651013, 1, 0.1254902, 0, 1,
-2.107743, 0.1678612, -0.3709271, 1, 0.1333333, 0, 1,
-2.075809, -0.5329609, -2.605951, 1, 0.1372549, 0, 1,
-2.054058, 0.8204418, -1.537495, 1, 0.145098, 0, 1,
-2.021995, -0.1134574, -2.487654, 1, 0.1490196, 0, 1,
-1.981733, -1.372538, -2.42255, 1, 0.1568628, 0, 1,
-1.949566, 0.8377299, -2.008079, 1, 0.1607843, 0, 1,
-1.940702, 0.6905457, -0.3551833, 1, 0.1686275, 0, 1,
-1.939936, 0.4691545, -1.016888, 1, 0.172549, 0, 1,
-1.905738, 1.691018, -0.979775, 1, 0.1803922, 0, 1,
-1.873709, -0.5916619, -2.870983, 1, 0.1843137, 0, 1,
-1.857329, -0.006498182, -3.055662, 1, 0.1921569, 0, 1,
-1.850172, 0.481807, -2.422386, 1, 0.1960784, 0, 1,
-1.823256, 0.7385114, -1.350159, 1, 0.2039216, 0, 1,
-1.772007, -0.1023532, -1.22895, 1, 0.2117647, 0, 1,
-1.765835, 1.164361, -0.1265602, 1, 0.2156863, 0, 1,
-1.751096, 1.750068, -0.2323247, 1, 0.2235294, 0, 1,
-1.744168, 1.95005, -0.8717438, 1, 0.227451, 0, 1,
-1.738177, 0.244378, -1.895315, 1, 0.2352941, 0, 1,
-1.721409, 0.9845954, -1.158978, 1, 0.2392157, 0, 1,
-1.713815, 1.96146, -0.6027259, 1, 0.2470588, 0, 1,
-1.710739, 0.07335878, -3.246042, 1, 0.2509804, 0, 1,
-1.695866, -0.2982011, -2.001311, 1, 0.2588235, 0, 1,
-1.68599, 1.970977, -1.624775, 1, 0.2627451, 0, 1,
-1.680976, -0.2156652, -1.976014, 1, 0.2705882, 0, 1,
-1.680254, -0.2174119, -2.373188, 1, 0.2745098, 0, 1,
-1.671263, -0.264765, -2.175581, 1, 0.282353, 0, 1,
-1.66067, 0.5559731, -1.638966, 1, 0.2862745, 0, 1,
-1.653752, -1.002547, -1.75877, 1, 0.2941177, 0, 1,
-1.637975, 0.01875091, -2.694915, 1, 0.3019608, 0, 1,
-1.608904, 0.6186576, -0.5596862, 1, 0.3058824, 0, 1,
-1.607818, -0.2656751, -2.7315, 1, 0.3137255, 0, 1,
-1.595851, 0.3277159, -2.673569, 1, 0.3176471, 0, 1,
-1.595426, -0.3071877, -2.315187, 1, 0.3254902, 0, 1,
-1.583037, -1.126776, -1.316102, 1, 0.3294118, 0, 1,
-1.55693, -0.4914467, -1.855734, 1, 0.3372549, 0, 1,
-1.556594, 0.4338561, -1.990398, 1, 0.3411765, 0, 1,
-1.554591, 0.002018371, -1.208595, 1, 0.3490196, 0, 1,
-1.551816, -3.356711, -4.000337, 1, 0.3529412, 0, 1,
-1.544694, 0.3024912, -1.975314, 1, 0.3607843, 0, 1,
-1.524702, 0.2650863, -4.311457, 1, 0.3647059, 0, 1,
-1.505322, 0.07309529, -1.509079, 1, 0.372549, 0, 1,
-1.498328, 0.1003818, -2.363613, 1, 0.3764706, 0, 1,
-1.49832, -0.5646625, -0.6981351, 1, 0.3843137, 0, 1,
-1.49563, -0.003751945, -1.734028, 1, 0.3882353, 0, 1,
-1.495075, -0.9581454, -2.526566, 1, 0.3960784, 0, 1,
-1.494034, -0.6352263, -2.831766, 1, 0.4039216, 0, 1,
-1.485578, -0.63577, -3.388379, 1, 0.4078431, 0, 1,
-1.484477, 0.71785, -1.83548, 1, 0.4156863, 0, 1,
-1.472833, 0.4948737, 0.3563277, 1, 0.4196078, 0, 1,
-1.467601, 0.5800185, -1.652786, 1, 0.427451, 0, 1,
-1.467509, 0.5741084, -0.4923267, 1, 0.4313726, 0, 1,
-1.464612, 2.652063, -0.2996621, 1, 0.4392157, 0, 1,
-1.449205, -0.2152783, 0.01554553, 1, 0.4431373, 0, 1,
-1.448203, -0.06537585, 0.7155851, 1, 0.4509804, 0, 1,
-1.447477, 1.209033, 0.462051, 1, 0.454902, 0, 1,
-1.439505, -1.22724, -1.736761, 1, 0.4627451, 0, 1,
-1.438023, 1.195761, -1.259429, 1, 0.4666667, 0, 1,
-1.43005, 0.4990025, -0.9601662, 1, 0.4745098, 0, 1,
-1.428113, -1.949128, -0.4683596, 1, 0.4784314, 0, 1,
-1.422624, -0.01125202, -2.431984, 1, 0.4862745, 0, 1,
-1.421134, 0.487134, 0.02605547, 1, 0.4901961, 0, 1,
-1.420621, -0.154092, -2.56184, 1, 0.4980392, 0, 1,
-1.413205, -2.942998, -3.045985, 1, 0.5058824, 0, 1,
-1.398063, 0.0633633, -1.646196, 1, 0.509804, 0, 1,
-1.391882, 0.1108029, -1.449134, 1, 0.5176471, 0, 1,
-1.389192, 1.422848, 0.560642, 1, 0.5215687, 0, 1,
-1.387955, 0.1614765, -1.665909, 1, 0.5294118, 0, 1,
-1.376691, -2.232775, -1.497748, 1, 0.5333334, 0, 1,
-1.370622, -2.150509, -4.488011, 1, 0.5411765, 0, 1,
-1.359908, -0.9932582, -2.84344, 1, 0.5450981, 0, 1,
-1.359043, -1.157658, -5.19102, 1, 0.5529412, 0, 1,
-1.350307, -0.1483268, -1.518453, 1, 0.5568628, 0, 1,
-1.349503, -0.5525612, -1.945481, 1, 0.5647059, 0, 1,
-1.342589, 0.2335936, 0.5140135, 1, 0.5686275, 0, 1,
-1.340935, -0.8801424, -2.099032, 1, 0.5764706, 0, 1,
-1.339524, -0.7606909, -3.077179, 1, 0.5803922, 0, 1,
-1.339244, -0.9239531, -0.417809, 1, 0.5882353, 0, 1,
-1.335567, -1.589784, -1.560021, 1, 0.5921569, 0, 1,
-1.327082, -0.3070157, -1.825176, 1, 0.6, 0, 1,
-1.327016, 1.200198, -0.8654872, 1, 0.6078432, 0, 1,
-1.326539, -0.04894151, -0.3893615, 1, 0.6117647, 0, 1,
-1.324211, -1.414007, -1.244598, 1, 0.6196079, 0, 1,
-1.322279, 0.8352991, -2.752592, 1, 0.6235294, 0, 1,
-1.309046, -1.346473, -3.309579, 1, 0.6313726, 0, 1,
-1.305348, 0.4823512, -0.6017486, 1, 0.6352941, 0, 1,
-1.305064, 0.9598507, -1.260915, 1, 0.6431373, 0, 1,
-1.30432, -1.155255, -3.229656, 1, 0.6470588, 0, 1,
-1.300449, -0.2626469, -0.2704009, 1, 0.654902, 0, 1,
-1.295028, -0.1842376, -1.286262, 1, 0.6588235, 0, 1,
-1.286446, -0.4106235, -0.9176144, 1, 0.6666667, 0, 1,
-1.282704, 0.5080998, -1.924185, 1, 0.6705883, 0, 1,
-1.282099, 0.5788481, -1.699138, 1, 0.6784314, 0, 1,
-1.249383, -1.798881, -2.769222, 1, 0.682353, 0, 1,
-1.24818, -0.8612906, -1.509082, 1, 0.6901961, 0, 1,
-1.233448, -1.426128, -2.19454, 1, 0.6941177, 0, 1,
-1.18933, -0.8170122, -1.845121, 1, 0.7019608, 0, 1,
-1.180491, -0.720832, -1.984876, 1, 0.7098039, 0, 1,
-1.179461, 0.9787136, -1.609154, 1, 0.7137255, 0, 1,
-1.173176, 0.1664448, -3.78812, 1, 0.7215686, 0, 1,
-1.157709, -0.3379321, -2.024503, 1, 0.7254902, 0, 1,
-1.156279, -0.193516, -2.553507, 1, 0.7333333, 0, 1,
-1.155647, 0.598199, -3.419816, 1, 0.7372549, 0, 1,
-1.131589, 0.5733388, -0.2668218, 1, 0.7450981, 0, 1,
-1.127818, 1.708535, -0.7845097, 1, 0.7490196, 0, 1,
-1.126809, 0.07304558, -1.078207, 1, 0.7568628, 0, 1,
-1.126109, -0.8600553, -1.705114, 1, 0.7607843, 0, 1,
-1.124722, 0.9270408, -0.01517246, 1, 0.7686275, 0, 1,
-1.120038, 0.3147291, -2.142241, 1, 0.772549, 0, 1,
-1.117929, -0.8247431, -3.19752, 1, 0.7803922, 0, 1,
-1.113917, 0.4564672, -1.932346, 1, 0.7843137, 0, 1,
-1.112123, -1.129635, -0.2067778, 1, 0.7921569, 0, 1,
-1.109979, -0.694093, -1.976715, 1, 0.7960784, 0, 1,
-1.10829, 0.4901084, -2.643823, 1, 0.8039216, 0, 1,
-1.107537, -1.198616, -3.27719, 1, 0.8117647, 0, 1,
-1.104393, -1.481413, -0.7227378, 1, 0.8156863, 0, 1,
-1.099945, -0.05718221, -1.524745, 1, 0.8235294, 0, 1,
-1.09473, -0.4325185, -1.849472, 1, 0.827451, 0, 1,
-1.088322, -1.040189, -3.299267, 1, 0.8352941, 0, 1,
-1.083303, 1.651664, -1.480675, 1, 0.8392157, 0, 1,
-1.076373, -0.6373429, -3.111312, 1, 0.8470588, 0, 1,
-1.072622, 0.05576432, -1.474377, 1, 0.8509804, 0, 1,
-1.059277, -0.6001234, -1.70044, 1, 0.8588235, 0, 1,
-1.057464, -0.5581588, -1.262186, 1, 0.8627451, 0, 1,
-1.052219, -0.05562197, -0.06971113, 1, 0.8705882, 0, 1,
-1.049298, 0.8275618, -2.29969, 1, 0.8745098, 0, 1,
-1.046712, 0.6321769, -1.862513, 1, 0.8823529, 0, 1,
-1.038199, 1.682389, 0.2766477, 1, 0.8862745, 0, 1,
-1.024637, -1.887412, -2.117392, 1, 0.8941177, 0, 1,
-1.023879, 0.6993955, -0.3643223, 1, 0.8980392, 0, 1,
-1.02179, -0.4058077, -1.565827, 1, 0.9058824, 0, 1,
-1.016439, -0.1040319, -1.836255, 1, 0.9137255, 0, 1,
-1.010602, 0.4681188, -1.576533, 1, 0.9176471, 0, 1,
-1.007428, 0.1668814, -2.066989, 1, 0.9254902, 0, 1,
-1.004791, -0.5221552, -1.983998, 1, 0.9294118, 0, 1,
-1.004715, 0.4125536, -0.638375, 1, 0.9372549, 0, 1,
-1.001927, -0.6465415, -3.172224, 1, 0.9411765, 0, 1,
-0.9988371, -0.2272045, -1.2758, 1, 0.9490196, 0, 1,
-0.9953212, 0.2621191, -0.6230131, 1, 0.9529412, 0, 1,
-0.9919915, -0.6483417, -2.78449, 1, 0.9607843, 0, 1,
-0.9895468, -0.01537331, -0.5458803, 1, 0.9647059, 0, 1,
-0.9771983, -0.4851621, -4.165578, 1, 0.972549, 0, 1,
-0.9722342, 0.8752875, 0.530907, 1, 0.9764706, 0, 1,
-0.9717706, 0.5833436, -0.4467067, 1, 0.9843137, 0, 1,
-0.9648917, -1.37306, -2.374078, 1, 0.9882353, 0, 1,
-0.9610078, 1.097425, -0.4441169, 1, 0.9960784, 0, 1,
-0.9608639, -1.849381, -1.186998, 0.9960784, 1, 0, 1,
-0.9596451, 0.01253589, -1.947895, 0.9921569, 1, 0, 1,
-0.9570356, -0.1265879, -1.023269, 0.9843137, 1, 0, 1,
-0.9557061, 0.2481193, 0.3535462, 0.9803922, 1, 0, 1,
-0.9470268, -0.02096893, -1.205733, 0.972549, 1, 0, 1,
-0.9457129, 0.3755465, -1.823845, 0.9686275, 1, 0, 1,
-0.9439641, -0.01427328, -0.7576487, 0.9607843, 1, 0, 1,
-0.9398334, 1.237128, 0.005581278, 0.9568627, 1, 0, 1,
-0.9318893, 0.8124057, -1.095649, 0.9490196, 1, 0, 1,
-0.9219305, 0.6958479, -0.7887508, 0.945098, 1, 0, 1,
-0.9202552, -0.107664, -1.857977, 0.9372549, 1, 0, 1,
-0.9168909, 0.4315462, -0.2475203, 0.9333333, 1, 0, 1,
-0.9038742, 0.3804519, -0.1904911, 0.9254902, 1, 0, 1,
-0.9023659, 1.022256, -0.2759997, 0.9215686, 1, 0, 1,
-0.8979464, -0.1717603, -1.889729, 0.9137255, 1, 0, 1,
-0.8968266, -1.393064, -4.300552, 0.9098039, 1, 0, 1,
-0.8962944, -0.7546343, -1.886678, 0.9019608, 1, 0, 1,
-0.8940378, 0.4113843, -0.6811129, 0.8941177, 1, 0, 1,
-0.8829304, 1.622214, 1.627493, 0.8901961, 1, 0, 1,
-0.881805, 1.805881, -1.423315, 0.8823529, 1, 0, 1,
-0.8766279, -0.2932985, -2.071898, 0.8784314, 1, 0, 1,
-0.8762742, -0.4074283, -1.808589, 0.8705882, 1, 0, 1,
-0.8682742, 1.363172, -1.047529, 0.8666667, 1, 0, 1,
-0.8587396, 0.1489177, -2.683434, 0.8588235, 1, 0, 1,
-0.8559924, -0.03514098, -1.618894, 0.854902, 1, 0, 1,
-0.8522642, 0.6833206, -3.241736, 0.8470588, 1, 0, 1,
-0.8505285, 0.1614643, -0.6302142, 0.8431373, 1, 0, 1,
-0.8497808, 1.08546, -1.208447, 0.8352941, 1, 0, 1,
-0.8436373, -0.3027754, -2.626164, 0.8313726, 1, 0, 1,
-0.8429958, 1.240901, -1.252901, 0.8235294, 1, 0, 1,
-0.8363572, 0.1578351, -2.811598, 0.8196079, 1, 0, 1,
-0.8323709, 0.3746485, 0.1077221, 0.8117647, 1, 0, 1,
-0.827726, -1.593992, -3.732722, 0.8078431, 1, 0, 1,
-0.8273206, 1.468277, -2.461538, 0.8, 1, 0, 1,
-0.82485, 0.384035, -1.771408, 0.7921569, 1, 0, 1,
-0.822369, 1.339875, -0.6046937, 0.7882353, 1, 0, 1,
-0.8190644, 0.05656791, -1.843327, 0.7803922, 1, 0, 1,
-0.8186117, -0.2192051, -0.8669124, 0.7764706, 1, 0, 1,
-0.8112302, 0.3489608, -2.573441, 0.7686275, 1, 0, 1,
-0.8037945, -1.660377, -2.355474, 0.7647059, 1, 0, 1,
-0.795937, -2.510995, -2.499348, 0.7568628, 1, 0, 1,
-0.7958302, 1.844476, 0.1696782, 0.7529412, 1, 0, 1,
-0.7950493, 0.2436255, -0.9108838, 0.7450981, 1, 0, 1,
-0.7940313, -0.8377556, 0.1866001, 0.7411765, 1, 0, 1,
-0.7842137, 0.6972334, -1.855023, 0.7333333, 1, 0, 1,
-0.7783045, 1.241248, -0.4770984, 0.7294118, 1, 0, 1,
-0.7780542, -0.9737769, -1.214158, 0.7215686, 1, 0, 1,
-0.7743644, 0.536661, -0.02448405, 0.7176471, 1, 0, 1,
-0.7729806, 1.296627, -0.05468175, 0.7098039, 1, 0, 1,
-0.7728046, -0.9176422, -1.288862, 0.7058824, 1, 0, 1,
-0.7687468, -0.7453372, -3.814545, 0.6980392, 1, 0, 1,
-0.7679359, 0.2430056, -1.251592, 0.6901961, 1, 0, 1,
-0.7674965, 1.550063, -1.703352, 0.6862745, 1, 0, 1,
-0.7634988, 1.03165, -0.2519443, 0.6784314, 1, 0, 1,
-0.762245, 1.571163, 0.1047654, 0.6745098, 1, 0, 1,
-0.7607428, 0.2820592, -1.803562, 0.6666667, 1, 0, 1,
-0.7573555, -0.7973959, -4.849914, 0.6627451, 1, 0, 1,
-0.7497622, -0.5209855, -2.755827, 0.654902, 1, 0, 1,
-0.7493819, -0.6503647, -3.596633, 0.6509804, 1, 0, 1,
-0.749054, 0.7436175, -0.2682978, 0.6431373, 1, 0, 1,
-0.7479836, -0.0082934, -2.071301, 0.6392157, 1, 0, 1,
-0.7412799, 0.01928703, -2.633107, 0.6313726, 1, 0, 1,
-0.7355449, -0.1965615, 1.667969, 0.627451, 1, 0, 1,
-0.735352, 1.300235, -0.5607027, 0.6196079, 1, 0, 1,
-0.7257698, -0.1728545, -2.051868, 0.6156863, 1, 0, 1,
-0.7217551, 0.5474876, 0.331428, 0.6078432, 1, 0, 1,
-0.7164764, 0.6826644, 0.3805413, 0.6039216, 1, 0, 1,
-0.7133377, -0.4519809, -3.124157, 0.5960785, 1, 0, 1,
-0.7126885, -0.6817284, -2.082484, 0.5882353, 1, 0, 1,
-0.7076581, 0.8803749, -2.716396, 0.5843138, 1, 0, 1,
-0.7057016, 0.4709732, 1.303057, 0.5764706, 1, 0, 1,
-0.7029588, -0.3352388, -2.515931, 0.572549, 1, 0, 1,
-0.6996965, -0.1732546, -2.496184, 0.5647059, 1, 0, 1,
-0.6958675, -1.292083, -3.633491, 0.5607843, 1, 0, 1,
-0.6881133, -0.007259204, -2.206685, 0.5529412, 1, 0, 1,
-0.6869143, -2.553237, -2.298152, 0.5490196, 1, 0, 1,
-0.6835656, 0.05375144, -1.195465, 0.5411765, 1, 0, 1,
-0.6755258, 1.020282, 0.5111681, 0.5372549, 1, 0, 1,
-0.6730347, 1.120097, -0.9043531, 0.5294118, 1, 0, 1,
-0.6688949, 0.3165053, -1.185158, 0.5254902, 1, 0, 1,
-0.6649404, 0.4288121, -2.530471, 0.5176471, 1, 0, 1,
-0.663922, 2.110136, 1.046054, 0.5137255, 1, 0, 1,
-0.6628152, -0.5446789, -1.762096, 0.5058824, 1, 0, 1,
-0.6538429, -0.8729707, -2.443029, 0.5019608, 1, 0, 1,
-0.6492814, -1.084409, -2.503874, 0.4941176, 1, 0, 1,
-0.641436, 0.3475206, -1.144803, 0.4862745, 1, 0, 1,
-0.6379239, 0.2614276, -1.84379, 0.4823529, 1, 0, 1,
-0.6305445, 0.2565647, -3.588467, 0.4745098, 1, 0, 1,
-0.6269639, -0.2247594, -3.324655, 0.4705882, 1, 0, 1,
-0.6256412, -0.002416912, -0.3308027, 0.4627451, 1, 0, 1,
-0.6222408, -0.9983492, -2.607152, 0.4588235, 1, 0, 1,
-0.6221457, -1.424995, -0.7063324, 0.4509804, 1, 0, 1,
-0.6214543, 0.1292693, -0.8940585, 0.4470588, 1, 0, 1,
-0.6196604, -1.135109, -2.342816, 0.4392157, 1, 0, 1,
-0.619238, -0.1538478, -1.763055, 0.4352941, 1, 0, 1,
-0.6122335, -0.8346598, -2.722144, 0.427451, 1, 0, 1,
-0.6112316, -0.9979641, -1.182571, 0.4235294, 1, 0, 1,
-0.6071327, -2.100225, -3.173928, 0.4156863, 1, 0, 1,
-0.6066837, -0.4913133, -0.6554027, 0.4117647, 1, 0, 1,
-0.6059332, 0.07341926, -0.5760948, 0.4039216, 1, 0, 1,
-0.6055991, -2.771435, -2.346935, 0.3960784, 1, 0, 1,
-0.6021907, -0.8515038, -2.757021, 0.3921569, 1, 0, 1,
-0.6009917, -1.196048, -2.404006, 0.3843137, 1, 0, 1,
-0.6006309, 0.319047, -1.321746, 0.3803922, 1, 0, 1,
-0.5998819, -2.28986, -3.411139, 0.372549, 1, 0, 1,
-0.5980061, -1.000082, -2.262699, 0.3686275, 1, 0, 1,
-0.5959519, -0.8851649, -1.934416, 0.3607843, 1, 0, 1,
-0.5927948, 0.6410332, -2.033408, 0.3568628, 1, 0, 1,
-0.5922713, 1.511733, -1.03869, 0.3490196, 1, 0, 1,
-0.5911838, -0.612103, -2.744589, 0.345098, 1, 0, 1,
-0.5908955, 0.8254609, -0.6700851, 0.3372549, 1, 0, 1,
-0.5905874, 1.743669, -0.1149587, 0.3333333, 1, 0, 1,
-0.5896105, 2.038169, -1.230296, 0.3254902, 1, 0, 1,
-0.5836181, -0.4945616, -3.007898, 0.3215686, 1, 0, 1,
-0.5827025, 1.092638, 0.7517484, 0.3137255, 1, 0, 1,
-0.5819369, 1.396736, -0.3532093, 0.3098039, 1, 0, 1,
-0.5813663, 1.038913, -1.47835, 0.3019608, 1, 0, 1,
-0.5803264, 0.2691329, -2.024627, 0.2941177, 1, 0, 1,
-0.5785351, -0.3462195, -2.962697, 0.2901961, 1, 0, 1,
-0.5783701, 1.958424, 0.5257271, 0.282353, 1, 0, 1,
-0.5733699, -0.8657938, -1.429295, 0.2784314, 1, 0, 1,
-0.5632614, -0.3749115, -2.262274, 0.2705882, 1, 0, 1,
-0.5611699, 0.2925608, -2.565988, 0.2666667, 1, 0, 1,
-0.5598212, 0.06080615, -1.834176, 0.2588235, 1, 0, 1,
-0.5595664, 0.6848487, -0.8655602, 0.254902, 1, 0, 1,
-0.5586988, -0.3315717, -1.58354, 0.2470588, 1, 0, 1,
-0.5549418, -0.2195124, -1.790533, 0.2431373, 1, 0, 1,
-0.5543205, -1.057383, -2.264208, 0.2352941, 1, 0, 1,
-0.5531876, -0.614687, -2.104069, 0.2313726, 1, 0, 1,
-0.5504628, -0.1585264, -1.380843, 0.2235294, 1, 0, 1,
-0.5441896, 0.3433163, -2.207263, 0.2196078, 1, 0, 1,
-0.5401809, -0.3848543, -0.3201113, 0.2117647, 1, 0, 1,
-0.538213, 0.197248, -1.59436, 0.2078431, 1, 0, 1,
-0.5379535, -0.1888568, -2.588959, 0.2, 1, 0, 1,
-0.5353811, -1.073916, -2.95919, 0.1921569, 1, 0, 1,
-0.5345824, 0.8022367, -2.651998, 0.1882353, 1, 0, 1,
-0.5340321, -0.1510727, -0.6549265, 0.1803922, 1, 0, 1,
-0.5301102, 0.6913722, -1.510266, 0.1764706, 1, 0, 1,
-0.5209619, 1.085509, 0.2347819, 0.1686275, 1, 0, 1,
-0.5117655, -1.691843, -0.2016473, 0.1647059, 1, 0, 1,
-0.5101846, -0.5630605, -4.143388, 0.1568628, 1, 0, 1,
-0.5087877, 2.086493, -1.884427, 0.1529412, 1, 0, 1,
-0.5073813, 0.2052676, -1.062162, 0.145098, 1, 0, 1,
-0.5021479, 0.2196773, -0.7762254, 0.1411765, 1, 0, 1,
-0.5019712, 0.04259212, -2.69965, 0.1333333, 1, 0, 1,
-0.5009731, 0.4034012, 0.008918954, 0.1294118, 1, 0, 1,
-0.5002642, 1.062611, -1.188914, 0.1215686, 1, 0, 1,
-0.4999515, -0.2005366, -1.91836, 0.1176471, 1, 0, 1,
-0.4953677, 1.673542, 0.3429872, 0.1098039, 1, 0, 1,
-0.4925582, -0.1401703, -2.667358, 0.1058824, 1, 0, 1,
-0.4923232, 0.2273556, -0.8894987, 0.09803922, 1, 0, 1,
-0.4731482, -0.4728131, -1.215092, 0.09019608, 1, 0, 1,
-0.4730293, -0.8810319, -4.374104, 0.08627451, 1, 0, 1,
-0.4724684, -1.184584, -2.407714, 0.07843138, 1, 0, 1,
-0.4635011, -0.3609401, -0.6023294, 0.07450981, 1, 0, 1,
-0.4590923, 0.8114094, -0.6306578, 0.06666667, 1, 0, 1,
-0.4574805, -0.9526777, -4.599641, 0.0627451, 1, 0, 1,
-0.4544299, 0.3955465, -1.131591, 0.05490196, 1, 0, 1,
-0.4519186, 0.3216528, -1.361481, 0.05098039, 1, 0, 1,
-0.4512226, 0.305897, -1.155485, 0.04313726, 1, 0, 1,
-0.4504275, -0.9880049, -2.446208, 0.03921569, 1, 0, 1,
-0.4501405, -0.3121948, -0.1494206, 0.03137255, 1, 0, 1,
-0.4494624, 1.401469, 0.8414105, 0.02745098, 1, 0, 1,
-0.446254, 0.5901253, -2.063818, 0.01960784, 1, 0, 1,
-0.4432111, 0.2900273, -0.7408508, 0.01568628, 1, 0, 1,
-0.4400369, 0.1442534, -1.473996, 0.007843138, 1, 0, 1,
-0.4384474, -0.6647974, -2.848832, 0.003921569, 1, 0, 1,
-0.4380052, 0.3147461, -2.265213, 0, 1, 0.003921569, 1,
-0.4259606, -2.149518, -0.6625466, 0, 1, 0.01176471, 1,
-0.4245284, 1.256699, -1.001538, 0, 1, 0.01568628, 1,
-0.4244085, 0.2293922, -0.7359385, 0, 1, 0.02352941, 1,
-0.4200179, 0.308451, -1.24254, 0, 1, 0.02745098, 1,
-0.4172702, 1.944378, -0.2688822, 0, 1, 0.03529412, 1,
-0.4134596, -0.01161359, -2.023424, 0, 1, 0.03921569, 1,
-0.4128228, 0.9091589, -0.5940652, 0, 1, 0.04705882, 1,
-0.4095838, -0.6857317, -2.45068, 0, 1, 0.05098039, 1,
-0.4073962, -1.361313, -2.936766, 0, 1, 0.05882353, 1,
-0.4067073, -0.8775875, -3.091727, 0, 1, 0.0627451, 1,
-0.4041981, -0.6649611, -2.033362, 0, 1, 0.07058824, 1,
-0.4035279, -0.8212718, -2.547096, 0, 1, 0.07450981, 1,
-0.3937877, 0.7719463, 0.04782209, 0, 1, 0.08235294, 1,
-0.3913633, -0.1383069, 0.6049992, 0, 1, 0.08627451, 1,
-0.3896285, 0.7080194, -1.407028, 0, 1, 0.09411765, 1,
-0.3886124, -0.7499658, -4.13413, 0, 1, 0.1019608, 1,
-0.3838259, -0.4580677, -1.582021, 0, 1, 0.1058824, 1,
-0.3815721, -0.7637124, -3.636432, 0, 1, 0.1137255, 1,
-0.3743055, -1.590428, -1.025922, 0, 1, 0.1176471, 1,
-0.3738705, 1.508233, -0.6899801, 0, 1, 0.1254902, 1,
-0.3729168, -1.245501, -3.283579, 0, 1, 0.1294118, 1,
-0.3673919, 0.3705906, -3.191055, 0, 1, 0.1372549, 1,
-0.3661511, -0.2463688, 0.01163167, 0, 1, 0.1411765, 1,
-0.3646274, 0.6635578, 1.917444, 0, 1, 0.1490196, 1,
-0.3643689, -0.9404523, -4.386292, 0, 1, 0.1529412, 1,
-0.3635573, -0.5030553, -2.201238, 0, 1, 0.1607843, 1,
-0.3631385, -1.037897, -2.601975, 0, 1, 0.1647059, 1,
-0.3605579, 0.372638, -0.02548679, 0, 1, 0.172549, 1,
-0.3601856, 0.3403445, -2.228862, 0, 1, 0.1764706, 1,
-0.3581583, 0.008436713, -1.263511, 0, 1, 0.1843137, 1,
-0.3517986, 0.1810219, -0.647358, 0, 1, 0.1882353, 1,
-0.3515806, 0.3269969, -1.279008, 0, 1, 0.1960784, 1,
-0.3503636, 1.017192, 1.48468, 0, 1, 0.2039216, 1,
-0.3500463, 1.914394, 0.1664819, 0, 1, 0.2078431, 1,
-0.3497995, -0.4519642, -4.272332, 0, 1, 0.2156863, 1,
-0.3485659, -1.057655, -3.778773, 0, 1, 0.2196078, 1,
-0.3485325, -1.711548, -3.48772, 0, 1, 0.227451, 1,
-0.3469006, -0.9890932, -2.510429, 0, 1, 0.2313726, 1,
-0.3460956, -0.3498569, -1.639622, 0, 1, 0.2392157, 1,
-0.3443936, 0.2092911, -3.895186, 0, 1, 0.2431373, 1,
-0.3372234, 0.1300575, -3.044716, 0, 1, 0.2509804, 1,
-0.3370399, 1.200543, -1.308212, 0, 1, 0.254902, 1,
-0.3360016, 1.356597, -1.003539, 0, 1, 0.2627451, 1,
-0.3328331, -1.663487, -3.464772, 0, 1, 0.2666667, 1,
-0.3272142, -0.8028603, -2.482603, 0, 1, 0.2745098, 1,
-0.3186417, 1.138367, -0.1428567, 0, 1, 0.2784314, 1,
-0.3163314, 0.4613267, -1.011772, 0, 1, 0.2862745, 1,
-0.3161476, -0.3368911, -4.789687, 0, 1, 0.2901961, 1,
-0.3128321, -0.06170572, -1.333757, 0, 1, 0.2980392, 1,
-0.3020997, -0.425139, -2.747936, 0, 1, 0.3058824, 1,
-0.3006975, -0.196738, -3.83577, 0, 1, 0.3098039, 1,
-0.299605, 0.8025344, 0.210279, 0, 1, 0.3176471, 1,
-0.298364, 0.2284748, -1.59839, 0, 1, 0.3215686, 1,
-0.2961933, 1.062801, -1.146324, 0, 1, 0.3294118, 1,
-0.2896902, 1.342733, -1.33745, 0, 1, 0.3333333, 1,
-0.2887877, -0.1065127, -1.693075, 0, 1, 0.3411765, 1,
-0.2885869, -0.6202421, -1.152393, 0, 1, 0.345098, 1,
-0.2851249, -0.7995141, -1.782939, 0, 1, 0.3529412, 1,
-0.2832607, 0.9510572, -0.7478413, 0, 1, 0.3568628, 1,
-0.2772493, -0.3081174, -2.731947, 0, 1, 0.3647059, 1,
-0.269499, -0.4725702, -4.210163, 0, 1, 0.3686275, 1,
-0.2690581, 0.8674954, -0.4093038, 0, 1, 0.3764706, 1,
-0.2685737, 1.565733, 0.4748658, 0, 1, 0.3803922, 1,
-0.2598334, 1.434859, -1.147594, 0, 1, 0.3882353, 1,
-0.2592332, -1.234079, -4.796427, 0, 1, 0.3921569, 1,
-0.2589201, -1.20297, -3.255196, 0, 1, 0.4, 1,
-0.2455254, 0.279825, -1.424024, 0, 1, 0.4078431, 1,
-0.2437008, 1.903611, 0.5237717, 0, 1, 0.4117647, 1,
-0.2427813, 0.1978698, -0.1318648, 0, 1, 0.4196078, 1,
-0.241496, -0.9818231, -2.632606, 0, 1, 0.4235294, 1,
-0.2373548, -0.1387334, -2.265831, 0, 1, 0.4313726, 1,
-0.231628, 1.008379, 0.7013562, 0, 1, 0.4352941, 1,
-0.2272637, -0.3110222, -1.725392, 0, 1, 0.4431373, 1,
-0.2254655, 0.8502401, -0.6616832, 0, 1, 0.4470588, 1,
-0.2244386, -0.4200142, -1.698513, 0, 1, 0.454902, 1,
-0.2183331, -0.7555741, -1.991438, 0, 1, 0.4588235, 1,
-0.2151848, 2.335819, 0.1315339, 0, 1, 0.4666667, 1,
-0.2141966, 0.9435735, -0.8499498, 0, 1, 0.4705882, 1,
-0.2137089, 1.448664, -1.333493, 0, 1, 0.4784314, 1,
-0.2052625, 1.343472, -0.315698, 0, 1, 0.4823529, 1,
-0.1983907, 1.3384, -0.07242934, 0, 1, 0.4901961, 1,
-0.1951326, 0.3046998, -0.8264391, 0, 1, 0.4941176, 1,
-0.1944848, -0.02812428, -3.74845, 0, 1, 0.5019608, 1,
-0.1939668, -0.08456045, -3.544536, 0, 1, 0.509804, 1,
-0.1923531, -1.700242, -2.038859, 0, 1, 0.5137255, 1,
-0.190923, 1.684367, -0.6950217, 0, 1, 0.5215687, 1,
-0.1902916, 1.368572, 0.127166, 0, 1, 0.5254902, 1,
-0.1813965, 0.9100573, -0.6874226, 0, 1, 0.5333334, 1,
-0.1755361, 0.4279883, -1.692914, 0, 1, 0.5372549, 1,
-0.1746362, 0.1456997, -1.551951, 0, 1, 0.5450981, 1,
-0.1719233, 0.8753828, 0.8564638, 0, 1, 0.5490196, 1,
-0.1716414, 1.321967, -0.5689661, 0, 1, 0.5568628, 1,
-0.1710852, -0.1071307, -0.7769686, 0, 1, 0.5607843, 1,
-0.1688486, -0.0005430813, -1.341416, 0, 1, 0.5686275, 1,
-0.1682624, 1.431473, -1.01709, 0, 1, 0.572549, 1,
-0.1659353, -1.506865, -3.352442, 0, 1, 0.5803922, 1,
-0.1639812, -0.2704051, -3.64654, 0, 1, 0.5843138, 1,
-0.1617609, -0.825273, -3.31681, 0, 1, 0.5921569, 1,
-0.1615348, 0.6324047, -1.597498, 0, 1, 0.5960785, 1,
-0.1601761, 0.801584, -0.9258095, 0, 1, 0.6039216, 1,
-0.1588233, -0.2535721, -3.460006, 0, 1, 0.6117647, 1,
-0.158099, 0.1402422, -1.179301, 0, 1, 0.6156863, 1,
-0.1540575, 0.2024418, 0.2510716, 0, 1, 0.6235294, 1,
-0.1462966, -0.3995162, -4.045145, 0, 1, 0.627451, 1,
-0.1451909, -0.881695, -2.503229, 0, 1, 0.6352941, 1,
-0.1427965, 0.9532545, 0.09701259, 0, 1, 0.6392157, 1,
-0.1406406, -1.207308, -1.894607, 0, 1, 0.6470588, 1,
-0.1362825, 0.6072016, 1.358291, 0, 1, 0.6509804, 1,
-0.1309746, -0.986931, -2.290174, 0, 1, 0.6588235, 1,
-0.1239999, -0.08802693, -0.2045177, 0, 1, 0.6627451, 1,
-0.123468, -0.7620494, -2.287683, 0, 1, 0.6705883, 1,
-0.1179475, 0.8417561, 0.6655233, 0, 1, 0.6745098, 1,
-0.1114248, 0.8840333, -1.172079, 0, 1, 0.682353, 1,
-0.1072709, 2.034623, -1.184994, 0, 1, 0.6862745, 1,
-0.1029453, 1.138141, 1.413658, 0, 1, 0.6941177, 1,
-0.09685069, 0.4104282, -0.0179281, 0, 1, 0.7019608, 1,
-0.0960265, 1.474044, 0.1599485, 0, 1, 0.7058824, 1,
-0.09401434, -0.8625092, -4.457345, 0, 1, 0.7137255, 1,
-0.09333542, 0.52013, 0.9085233, 0, 1, 0.7176471, 1,
-0.09122239, -1.528142, -2.482283, 0, 1, 0.7254902, 1,
-0.09101645, 0.4097185, -1.920879, 0, 1, 0.7294118, 1,
-0.09048191, -1.288339, -2.742832, 0, 1, 0.7372549, 1,
-0.08897208, 1.753023, 0.6668462, 0, 1, 0.7411765, 1,
-0.08831084, 0.46425, 0.3311523, 0, 1, 0.7490196, 1,
-0.08712109, 1.532185, -0.6338891, 0, 1, 0.7529412, 1,
-0.08480511, 1.285841, -0.8019461, 0, 1, 0.7607843, 1,
-0.08260803, -0.8384976, -2.90731, 0, 1, 0.7647059, 1,
-0.08101463, 1.140155, 0.331424, 0, 1, 0.772549, 1,
-0.07419819, -0.3023102, -2.636593, 0, 1, 0.7764706, 1,
-0.06869269, 1.812127, -0.8255531, 0, 1, 0.7843137, 1,
-0.067422, -1.512184, -2.411344, 0, 1, 0.7882353, 1,
-0.06698394, 0.4855628, 1.588565, 0, 1, 0.7960784, 1,
-0.06635901, -1.336834, -2.914425, 0, 1, 0.8039216, 1,
-0.06249035, -1.449734, -3.527805, 0, 1, 0.8078431, 1,
-0.06107275, -0.7265121, -2.461867, 0, 1, 0.8156863, 1,
-0.06031327, -1.763723, -3.152104, 0, 1, 0.8196079, 1,
-0.05977646, 0.2896203, -1.74736, 0, 1, 0.827451, 1,
-0.05844145, 0.4335782, -1.070868, 0, 1, 0.8313726, 1,
-0.04931879, -0.5187634, -2.024241, 0, 1, 0.8392157, 1,
-0.04614966, 1.203847, -1.306013, 0, 1, 0.8431373, 1,
-0.04297406, 0.4457687, -0.155308, 0, 1, 0.8509804, 1,
-0.04163939, 0.4778777, 1.417163, 0, 1, 0.854902, 1,
-0.04010851, 0.06296761, -0.3576867, 0, 1, 0.8627451, 1,
-0.02613378, -1.386683, -2.411257, 0, 1, 0.8666667, 1,
-0.02555762, -0.988385, -4.055095, 0, 1, 0.8745098, 1,
-0.02349814, -1.520481, -3.279771, 0, 1, 0.8784314, 1,
-0.0206646, -0.03363699, -3.26221, 0, 1, 0.8862745, 1,
-0.01996087, 1.330354, -0.02196807, 0, 1, 0.8901961, 1,
-0.01210287, 1.225041, 0.5347221, 0, 1, 0.8980392, 1,
-0.009724553, -1.033405, -3.164097, 0, 1, 0.9058824, 1,
-0.009194827, 1.38731, 0.7977646, 0, 1, 0.9098039, 1,
-0.0005215897, -1.450536, -3.209722, 0, 1, 0.9176471, 1,
0.0008931568, 1.657097, 0.5620695, 0, 1, 0.9215686, 1,
0.001311532, -0.5223929, 3.745301, 0, 1, 0.9294118, 1,
0.001432457, -0.6139054, 3.611208, 0, 1, 0.9333333, 1,
0.002954886, 0.761229, 0.3631731, 0, 1, 0.9411765, 1,
0.004189505, -0.8833438, 3.457684, 0, 1, 0.945098, 1,
0.01240676, 0.5184491, 0.7121846, 0, 1, 0.9529412, 1,
0.01324275, 0.7735849, -0.5378352, 0, 1, 0.9568627, 1,
0.01952703, -1.702949, 3.260219, 0, 1, 0.9647059, 1,
0.02396716, -0.6836582, 4.214969, 0, 1, 0.9686275, 1,
0.02803404, 0.5950949, 0.985101, 0, 1, 0.9764706, 1,
0.02809382, 0.6671054, 2.147774, 0, 1, 0.9803922, 1,
0.03345879, 0.1533988, -1.663736, 0, 1, 0.9882353, 1,
0.03424355, -0.8006917, 3.357426, 0, 1, 0.9921569, 1,
0.03656935, 0.3272972, -2.503319, 0, 1, 1, 1,
0.03863961, 0.4525698, -0.400068, 0, 0.9921569, 1, 1,
0.04220055, 0.03736709, 0.5157019, 0, 0.9882353, 1, 1,
0.04295925, 0.07581409, 2.390167, 0, 0.9803922, 1, 1,
0.04584515, -0.5830975, 1.505946, 0, 0.9764706, 1, 1,
0.04892787, 0.1013705, 0.2202778, 0, 0.9686275, 1, 1,
0.04910719, -0.1488422, 2.463218, 0, 0.9647059, 1, 1,
0.05094174, 0.1125423, 1.747746, 0, 0.9568627, 1, 1,
0.05115291, -2.577696, 2.390799, 0, 0.9529412, 1, 1,
0.05303686, 1.107255, 0.2552695, 0, 0.945098, 1, 1,
0.05454903, 0.1501449, 1.296551, 0, 0.9411765, 1, 1,
0.05512891, 0.4932868, 2.455002, 0, 0.9333333, 1, 1,
0.05711141, 0.5519928, -1.338713, 0, 0.9294118, 1, 1,
0.06246303, -1.651423, 2.056155, 0, 0.9215686, 1, 1,
0.06569924, -2.511306, 1.511929, 0, 0.9176471, 1, 1,
0.06697767, 0.7152492, 0.4731517, 0, 0.9098039, 1, 1,
0.06764665, 1.04568, 1.405025, 0, 0.9058824, 1, 1,
0.06795661, -0.4735727, 3.633348, 0, 0.8980392, 1, 1,
0.06868123, -1.627921, 3.938355, 0, 0.8901961, 1, 1,
0.07009165, 1.677011, -1.314356, 0, 0.8862745, 1, 1,
0.075462, 1.313227, -0.6764774, 0, 0.8784314, 1, 1,
0.07571992, 0.08444599, 0.612455, 0, 0.8745098, 1, 1,
0.07751963, 0.4233334, 0.5358508, 0, 0.8666667, 1, 1,
0.08803006, 0.05535568, 2.073118, 0, 0.8627451, 1, 1,
0.08822788, 0.8734741, -0.3677077, 0, 0.854902, 1, 1,
0.09161196, -0.7347669, 3.626851, 0, 0.8509804, 1, 1,
0.09466777, -1.351533, 2.891002, 0, 0.8431373, 1, 1,
0.09499328, 0.6297577, 0.5981004, 0, 0.8392157, 1, 1,
0.09575869, 0.0408327, 0.9749395, 0, 0.8313726, 1, 1,
0.1005021, 1.761841, 1.989775, 0, 0.827451, 1, 1,
0.1011733, -0.2982186, 5.039416, 0, 0.8196079, 1, 1,
0.1060895, 0.5551947, 0.06357728, 0, 0.8156863, 1, 1,
0.1075488, -0.1076127, 3.017575, 0, 0.8078431, 1, 1,
0.1125989, -0.1133006, 2.605856, 0, 0.8039216, 1, 1,
0.1152413, 0.3698199, 1.169753, 0, 0.7960784, 1, 1,
0.1212897, -0.05483263, 3.541038, 0, 0.7882353, 1, 1,
0.1216437, -2.032871, 3.333174, 0, 0.7843137, 1, 1,
0.1232857, -0.008905595, 2.928538, 0, 0.7764706, 1, 1,
0.1249524, -1.389388, 3.240897, 0, 0.772549, 1, 1,
0.1249986, 0.3097536, 2.191871, 0, 0.7647059, 1, 1,
0.1252219, 2.398748, -0.9873284, 0, 0.7607843, 1, 1,
0.1285275, 0.01737362, 0.8074428, 0, 0.7529412, 1, 1,
0.1339594, -0.07605488, 2.730123, 0, 0.7490196, 1, 1,
0.1344234, 0.4931635, -0.2727108, 0, 0.7411765, 1, 1,
0.140251, -1.319536, 3.301181, 0, 0.7372549, 1, 1,
0.1404725, 0.985578, -1.021028, 0, 0.7294118, 1, 1,
0.1408655, 0.7113183, 1.637241, 0, 0.7254902, 1, 1,
0.1442153, -0.598702, 2.695475, 0, 0.7176471, 1, 1,
0.1537045, -1.778258, 3.650276, 0, 0.7137255, 1, 1,
0.1568249, 0.6345015, 0.8969062, 0, 0.7058824, 1, 1,
0.1573387, -1.895755, 4.561373, 0, 0.6980392, 1, 1,
0.1626066, 0.4260219, 2.072836, 0, 0.6941177, 1, 1,
0.1634953, 1.028278, -0.3308535, 0, 0.6862745, 1, 1,
0.166167, -0.5431033, 2.108089, 0, 0.682353, 1, 1,
0.1667093, -0.2275867, 3.528088, 0, 0.6745098, 1, 1,
0.1688153, -1.016698, 1.317346, 0, 0.6705883, 1, 1,
0.1707014, 0.7958318, -1.7078, 0, 0.6627451, 1, 1,
0.1716129, 0.5987878, 1.425118, 0, 0.6588235, 1, 1,
0.1751975, -0.8383784, 3.534053, 0, 0.6509804, 1, 1,
0.1757822, 0.3977554, -0.986317, 0, 0.6470588, 1, 1,
0.176526, 0.1873659, 0.398513, 0, 0.6392157, 1, 1,
0.1784742, 1.981965, 0.6656817, 0, 0.6352941, 1, 1,
0.1804906, -0.6662204, 4.018393, 0, 0.627451, 1, 1,
0.1879615, -0.2219079, 1.6737, 0, 0.6235294, 1, 1,
0.1979446, 1.52801, 0.547201, 0, 0.6156863, 1, 1,
0.2005843, -0.3405113, 2.723558, 0, 0.6117647, 1, 1,
0.2032256, 0.2563573, 1.644054, 0, 0.6039216, 1, 1,
0.2069793, 0.543868, -0.4636325, 0, 0.5960785, 1, 1,
0.207459, -1.868856, 1.836661, 0, 0.5921569, 1, 1,
0.2081611, 0.05162384, 0.4719198, 0, 0.5843138, 1, 1,
0.2083025, -0.05165153, 2.730829, 0, 0.5803922, 1, 1,
0.2096148, 0.1909045, 0.257341, 0, 0.572549, 1, 1,
0.214613, 0.6171376, -0.3472911, 0, 0.5686275, 1, 1,
0.2170867, -0.6569018, 2.462432, 0, 0.5607843, 1, 1,
0.2172732, 1.829813, -0.1307228, 0, 0.5568628, 1, 1,
0.2189024, 1.081696, 0.09760136, 0, 0.5490196, 1, 1,
0.2215707, 0.1117735, 0.0890305, 0, 0.5450981, 1, 1,
0.2243894, 1.540185, -0.4505318, 0, 0.5372549, 1, 1,
0.2244625, -1.134101, 0.7903736, 0, 0.5333334, 1, 1,
0.2315315, -0.5481107, 2.870262, 0, 0.5254902, 1, 1,
0.2364144, 0.4506585, 0.8959189, 0, 0.5215687, 1, 1,
0.2367781, 1.230849, 1.103816, 0, 0.5137255, 1, 1,
0.2383921, 0.9588251, -0.7038652, 0, 0.509804, 1, 1,
0.242715, 1.094145, 0.4861284, 0, 0.5019608, 1, 1,
0.242883, -1.361536, 2.187973, 0, 0.4941176, 1, 1,
0.2441725, 0.01763353, 2.012784, 0, 0.4901961, 1, 1,
0.2467888, 0.4397992, 1.04052, 0, 0.4823529, 1, 1,
0.2496432, -0.9869899, 1.016329, 0, 0.4784314, 1, 1,
0.2533995, 0.01493542, 1.926127, 0, 0.4705882, 1, 1,
0.253598, -0.1188615, 0.5062869, 0, 0.4666667, 1, 1,
0.2598524, -0.3595404, 4.770638, 0, 0.4588235, 1, 1,
0.2630762, -0.09855252, 2.114495, 0, 0.454902, 1, 1,
0.2653387, 0.7148241, -1.193723, 0, 0.4470588, 1, 1,
0.2676173, 1.287854, 1.798683, 0, 0.4431373, 1, 1,
0.2686218, 0.1821878, 3.19356, 0, 0.4352941, 1, 1,
0.2744118, 2.280342, -0.5346565, 0, 0.4313726, 1, 1,
0.279585, -0.8318055, 3.714545, 0, 0.4235294, 1, 1,
0.2867383, 0.2966363, -0.08680167, 0, 0.4196078, 1, 1,
0.2919342, -0.003363542, 2.226243, 0, 0.4117647, 1, 1,
0.2922542, -0.3586336, 1.39758, 0, 0.4078431, 1, 1,
0.2960317, 0.5010477, 0.1241482, 0, 0.4, 1, 1,
0.2964274, 1.425982, 0.4839145, 0, 0.3921569, 1, 1,
0.2978306, -0.590906, 2.79261, 0, 0.3882353, 1, 1,
0.2981702, 0.5066282, -1.178995, 0, 0.3803922, 1, 1,
0.3006019, -0.3966791, 4.402313, 0, 0.3764706, 1, 1,
0.3018342, 0.3611493, -0.2142122, 0, 0.3686275, 1, 1,
0.3020854, -0.8588833, 3.569311, 0, 0.3647059, 1, 1,
0.3089254, 1.111329, -0.5735193, 0, 0.3568628, 1, 1,
0.3099491, 3.021141, 0.3375842, 0, 0.3529412, 1, 1,
0.3100041, 0.3468755, 1.551454, 0, 0.345098, 1, 1,
0.3106776, 1.146622, 0.9549958, 0, 0.3411765, 1, 1,
0.3114333, -0.1781719, 1.589138, 0, 0.3333333, 1, 1,
0.3145109, -1.045504, 2.938623, 0, 0.3294118, 1, 1,
0.3147173, -0.7681699, 3.291626, 0, 0.3215686, 1, 1,
0.3167371, 1.446354, -0.3284746, 0, 0.3176471, 1, 1,
0.3180811, 1.537219, -0.6908479, 0, 0.3098039, 1, 1,
0.3243835, -0.1498581, 1.705623, 0, 0.3058824, 1, 1,
0.3284838, 1.104086, 1.16356, 0, 0.2980392, 1, 1,
0.3325023, -1.264871, 3.11583, 0, 0.2901961, 1, 1,
0.3325783, -0.1263416, 1.499028, 0, 0.2862745, 1, 1,
0.3335492, -0.07443975, 1.940083, 0, 0.2784314, 1, 1,
0.3342308, -0.7516384, 2.785588, 0, 0.2745098, 1, 1,
0.3371848, -0.2497558, 0.9389785, 0, 0.2666667, 1, 1,
0.339604, 0.4721461, 1.400897, 0, 0.2627451, 1, 1,
0.3419816, 0.8530986, 0.5802054, 0, 0.254902, 1, 1,
0.344639, -0.06236067, 2.027522, 0, 0.2509804, 1, 1,
0.345956, -0.3525985, 1.94773, 0, 0.2431373, 1, 1,
0.3577089, -0.9732392, 2.72546, 0, 0.2392157, 1, 1,
0.36114, 1.035256, -2.891707, 0, 0.2313726, 1, 1,
0.3716207, -0.3350898, 3.235457, 0, 0.227451, 1, 1,
0.3732888, -2.070286, 3.402914, 0, 0.2196078, 1, 1,
0.3736292, -0.5365468, 4.63324, 0, 0.2156863, 1, 1,
0.3750472, 1.003259, 0.9162577, 0, 0.2078431, 1, 1,
0.3751737, -0.0190214, 2.188434, 0, 0.2039216, 1, 1,
0.3754516, 0.3880233, 1.261497, 0, 0.1960784, 1, 1,
0.3755487, -0.6701654, 4.885416, 0, 0.1882353, 1, 1,
0.3811604, -0.698677, 2.955847, 0, 0.1843137, 1, 1,
0.3850905, 0.1641623, 0.8174242, 0, 0.1764706, 1, 1,
0.3862338, 0.9843717, 0.4770017, 0, 0.172549, 1, 1,
0.3935376, 0.6148331, 0.3303962, 0, 0.1647059, 1, 1,
0.394008, -0.2683436, 2.637117, 0, 0.1607843, 1, 1,
0.3957917, 0.6367904, 0.135448, 0, 0.1529412, 1, 1,
0.4000457, -0.1539507, 1.647907, 0, 0.1490196, 1, 1,
0.4009356, -0.2311202, 1.928914, 0, 0.1411765, 1, 1,
0.4057603, 1.331524, 0.7622119, 0, 0.1372549, 1, 1,
0.4059949, -0.7529994, 3.183809, 0, 0.1294118, 1, 1,
0.4066296, 0.4866035, -0.2911762, 0, 0.1254902, 1, 1,
0.4071982, 1.972793, -0.09349785, 0, 0.1176471, 1, 1,
0.4114689, -0.2920974, 3.46697, 0, 0.1137255, 1, 1,
0.4138227, 1.25351, -1.385238, 0, 0.1058824, 1, 1,
0.4163437, 0.8311457, 0.02561785, 0, 0.09803922, 1, 1,
0.4165693, -1.322655, 2.554209, 0, 0.09411765, 1, 1,
0.4204523, -0.07919244, 2.082944, 0, 0.08627451, 1, 1,
0.421532, 0.5748048, 0.2515457, 0, 0.08235294, 1, 1,
0.4224586, -0.06819987, 4.15025, 0, 0.07450981, 1, 1,
0.4314265, 0.6458303, 1.361111, 0, 0.07058824, 1, 1,
0.4322702, -2.245765, 4.097566, 0, 0.0627451, 1, 1,
0.4342442, -0.2533287, 4.143225, 0, 0.05882353, 1, 1,
0.4345494, 0.1802554, 1.207266, 0, 0.05098039, 1, 1,
0.4368739, 0.7197362, 0.9222579, 0, 0.04705882, 1, 1,
0.4378382, -0.4381222, 3.454092, 0, 0.03921569, 1, 1,
0.4389189, 0.2608694, 1.484532, 0, 0.03529412, 1, 1,
0.4483587, -0.3028749, 3.273039, 0, 0.02745098, 1, 1,
0.4504905, -1.016823, 2.186799, 0, 0.02352941, 1, 1,
0.4520107, -0.9671827, 2.909693, 0, 0.01568628, 1, 1,
0.4535748, 0.40217, -0.06080772, 0, 0.01176471, 1, 1,
0.456759, 1.288522, -0.9716756, 0, 0.003921569, 1, 1,
0.4630874, -0.7371535, 1.096018, 0.003921569, 0, 1, 1,
0.463354, -0.257671, 0.6787835, 0.007843138, 0, 1, 1,
0.4647198, -1.328906, 2.23397, 0.01568628, 0, 1, 1,
0.4696163, 1.516639, -1.057513, 0.01960784, 0, 1, 1,
0.4708258, -0.7728537, 4.11554, 0.02745098, 0, 1, 1,
0.474542, -0.8055353, 3.008575, 0.03137255, 0, 1, 1,
0.4773382, -1.248072, 3.071994, 0.03921569, 0, 1, 1,
0.4787985, -0.3497709, 2.164262, 0.04313726, 0, 1, 1,
0.4807211, -0.7278055, 3.57306, 0.05098039, 0, 1, 1,
0.4819924, -0.3687636, 3.532556, 0.05490196, 0, 1, 1,
0.4830988, 1.232662, -0.5778888, 0.0627451, 0, 1, 1,
0.4865497, -2.090499, 1.682446, 0.06666667, 0, 1, 1,
0.487494, 0.3544711, 1.932087, 0.07450981, 0, 1, 1,
0.4898793, 0.228411, 3.021223, 0.07843138, 0, 1, 1,
0.4902835, 1.355268, 1.33193, 0.08627451, 0, 1, 1,
0.4911347, 1.461609, -1.211321, 0.09019608, 0, 1, 1,
0.4924631, -2.236209, 2.91053, 0.09803922, 0, 1, 1,
0.4936564, 1.349803, 1.291303, 0.1058824, 0, 1, 1,
0.498554, -1.946234, 2.001918, 0.1098039, 0, 1, 1,
0.5026855, -1.380769, 3.22096, 0.1176471, 0, 1, 1,
0.5033055, 0.4862784, -0.4725732, 0.1215686, 0, 1, 1,
0.503536, 0.1729093, 0.9517876, 0.1294118, 0, 1, 1,
0.5134379, 1.962088, -0.9199489, 0.1333333, 0, 1, 1,
0.5165751, 0.1905401, 2.375679, 0.1411765, 0, 1, 1,
0.5175297, 0.6752566, -0.231164, 0.145098, 0, 1, 1,
0.5220352, 1.442588, -0.8435434, 0.1529412, 0, 1, 1,
0.5239638, -0.6307118, 2.074995, 0.1568628, 0, 1, 1,
0.5250818, 0.2953278, 0.8657963, 0.1647059, 0, 1, 1,
0.5254911, 0.1723341, 0.5346852, 0.1686275, 0, 1, 1,
0.5285428, -0.9556968, 2.891271, 0.1764706, 0, 1, 1,
0.5320908, -2.121436, 2.373204, 0.1803922, 0, 1, 1,
0.534745, -0.3773089, 3.648294, 0.1882353, 0, 1, 1,
0.536755, 2.607708, -0.6085292, 0.1921569, 0, 1, 1,
0.5387484, 0.4429029, 1.76585, 0.2, 0, 1, 1,
0.5585105, 1.518163, -0.3488063, 0.2078431, 0, 1, 1,
0.5605257, 0.5380159, -0.1014546, 0.2117647, 0, 1, 1,
0.5633864, -0.7882352, 3.248757, 0.2196078, 0, 1, 1,
0.5667102, -0.2052215, 2.846567, 0.2235294, 0, 1, 1,
0.567884, 0.3293011, 1.617708, 0.2313726, 0, 1, 1,
0.5724718, -2.270745, 2.333363, 0.2352941, 0, 1, 1,
0.5750916, 0.3863775, 0.8010567, 0.2431373, 0, 1, 1,
0.5767972, 0.02239443, 1.682895, 0.2470588, 0, 1, 1,
0.5769489, -1.582728, 2.961435, 0.254902, 0, 1, 1,
0.5786248, -0.5747355, 1.6307, 0.2588235, 0, 1, 1,
0.5808686, 0.6703449, 1.116327, 0.2666667, 0, 1, 1,
0.5841735, 1.451553, 0.08716884, 0.2705882, 0, 1, 1,
0.5849484, 0.09434173, 0.5304385, 0.2784314, 0, 1, 1,
0.5910258, 0.04107619, 0.9032979, 0.282353, 0, 1, 1,
0.5924047, -0.8665221, 2.594971, 0.2901961, 0, 1, 1,
0.5928348, -1.174069, 3.918108, 0.2941177, 0, 1, 1,
0.595584, 0.8325952, 2.018787, 0.3019608, 0, 1, 1,
0.601952, -0.2734543, 2.521203, 0.3098039, 0, 1, 1,
0.605531, -0.4741427, 3.792506, 0.3137255, 0, 1, 1,
0.6146601, 0.4452132, 0.9260903, 0.3215686, 0, 1, 1,
0.6146719, 0.3275116, 0.8632177, 0.3254902, 0, 1, 1,
0.6146826, 0.4982491, 0.8684675, 0.3333333, 0, 1, 1,
0.6156877, -1.024449, 3.297539, 0.3372549, 0, 1, 1,
0.6181388, -1.081561, 2.379611, 0.345098, 0, 1, 1,
0.6231972, -0.7987334, 2.98865, 0.3490196, 0, 1, 1,
0.6296226, 0.5005186, 2.686989, 0.3568628, 0, 1, 1,
0.6338074, -0.03494108, 1.565491, 0.3607843, 0, 1, 1,
0.6371474, 0.6112489, 0.9982693, 0.3686275, 0, 1, 1,
0.6384687, -0.03217273, 1.287434, 0.372549, 0, 1, 1,
0.6430187, 0.7647231, -0.4083757, 0.3803922, 0, 1, 1,
0.6529241, 0.7152629, 1.40911, 0.3843137, 0, 1, 1,
0.6538477, 1.39235, 1.836216, 0.3921569, 0, 1, 1,
0.6605458, 0.1785257, 1.547187, 0.3960784, 0, 1, 1,
0.6659937, 0.4032115, 1.287304, 0.4039216, 0, 1, 1,
0.6666737, -0.04404088, 0.9501251, 0.4117647, 0, 1, 1,
0.6719036, -1.189789, 2.080921, 0.4156863, 0, 1, 1,
0.6739628, 0.5745233, 1.125475, 0.4235294, 0, 1, 1,
0.6764411, 0.128012, -0.1185079, 0.427451, 0, 1, 1,
0.6797277, 0.523674, 3.333943, 0.4352941, 0, 1, 1,
0.684508, -0.3500316, 2.915938, 0.4392157, 0, 1, 1,
0.6848826, 1.115497, -0.1296534, 0.4470588, 0, 1, 1,
0.6925704, 0.3877687, 0.940714, 0.4509804, 0, 1, 1,
0.6941155, 0.8393865, 1.068491, 0.4588235, 0, 1, 1,
0.6955897, -1.352559, 4.090331, 0.4627451, 0, 1, 1,
0.699347, 1.714521, -0.06474382, 0.4705882, 0, 1, 1,
0.701259, 0.5123202, -0.9102086, 0.4745098, 0, 1, 1,
0.7035904, 0.7916697, 1.692268, 0.4823529, 0, 1, 1,
0.7087926, -0.8174782, 3.074723, 0.4862745, 0, 1, 1,
0.7111871, 2.334787, 0.6496503, 0.4941176, 0, 1, 1,
0.718937, -1.937964, 2.124906, 0.5019608, 0, 1, 1,
0.7193772, 0.2192821, 0.9035718, 0.5058824, 0, 1, 1,
0.7194548, 0.2509953, 1.146879, 0.5137255, 0, 1, 1,
0.7219355, -0.4057654, 2.229877, 0.5176471, 0, 1, 1,
0.7232746, 0.5172404, 2.191572, 0.5254902, 0, 1, 1,
0.7243268, -0.303481, 2.234565, 0.5294118, 0, 1, 1,
0.7245563, 1.945261, 1.725995, 0.5372549, 0, 1, 1,
0.7253095, 0.1013136, 1.699806, 0.5411765, 0, 1, 1,
0.7254229, 1.391415, -0.8454864, 0.5490196, 0, 1, 1,
0.7270243, -0.5506989, 1.752691, 0.5529412, 0, 1, 1,
0.7402067, -0.5085846, 2.26131, 0.5607843, 0, 1, 1,
0.7406818, -0.7330313, 1.819481, 0.5647059, 0, 1, 1,
0.7423902, 0.0298281, 2.291396, 0.572549, 0, 1, 1,
0.7437902, -0.06453807, 1.751218, 0.5764706, 0, 1, 1,
0.7493405, 0.7214513, -0.294731, 0.5843138, 0, 1, 1,
0.7529933, -0.7083, 2.513562, 0.5882353, 0, 1, 1,
0.7550588, 1.10057, 0.1228425, 0.5960785, 0, 1, 1,
0.7567061, 0.1341808, 1.205687, 0.6039216, 0, 1, 1,
0.7593141, -0.09076735, 1.881298, 0.6078432, 0, 1, 1,
0.7618697, -0.2444308, 0.5749683, 0.6156863, 0, 1, 1,
0.7625534, 0.7260529, 0.7814594, 0.6196079, 0, 1, 1,
0.7637755, 0.2880502, 1.312079, 0.627451, 0, 1, 1,
0.764267, -1.345841, 4.341788, 0.6313726, 0, 1, 1,
0.7657212, 1.193583, 1.617234, 0.6392157, 0, 1, 1,
0.7670287, 0.983108, 0.6577825, 0.6431373, 0, 1, 1,
0.7693942, -1.059788, 2.728152, 0.6509804, 0, 1, 1,
0.7739377, -0.6233037, 3.825028, 0.654902, 0, 1, 1,
0.7748931, 0.8632219, 1.324743, 0.6627451, 0, 1, 1,
0.7751313, 1.101639, 0.5885705, 0.6666667, 0, 1, 1,
0.7751706, 0.1023436, 1.744628, 0.6745098, 0, 1, 1,
0.7758064, 1.675171, 1.07908, 0.6784314, 0, 1, 1,
0.7795078, 0.03906183, 2.044769, 0.6862745, 0, 1, 1,
0.7837273, 0.1881451, 2.368857, 0.6901961, 0, 1, 1,
0.7841256, -1.086053, 1.234573, 0.6980392, 0, 1, 1,
0.7881112, 1.809813, 1.955338, 0.7058824, 0, 1, 1,
0.797101, 1.927515, -0.0005171408, 0.7098039, 0, 1, 1,
0.7981244, -1.260942, 1.945513, 0.7176471, 0, 1, 1,
0.8001388, 0.8189741, 0.3842083, 0.7215686, 0, 1, 1,
0.8041955, 0.06313726, 4.164126, 0.7294118, 0, 1, 1,
0.8103836, 1.658289, 1.213952, 0.7333333, 0, 1, 1,
0.8186927, 0.5316032, 3.31353, 0.7411765, 0, 1, 1,
0.8283784, -0.7834163, 2.238252, 0.7450981, 0, 1, 1,
0.8340324, 1.887653, -0.697448, 0.7529412, 0, 1, 1,
0.8417411, 0.05597875, 3.432521, 0.7568628, 0, 1, 1,
0.8475811, -0.9619032, 0.9611515, 0.7647059, 0, 1, 1,
0.8485627, -0.1891365, 0.9516933, 0.7686275, 0, 1, 1,
0.8539692, -1.971199, 2.824054, 0.7764706, 0, 1, 1,
0.8550289, -0.3427018, 3.641577, 0.7803922, 0, 1, 1,
0.8564277, -0.4888213, 1.120866, 0.7882353, 0, 1, 1,
0.8649479, 0.1922635, 1.800216, 0.7921569, 0, 1, 1,
0.8652305, -0.7773339, 4.055457, 0.8, 0, 1, 1,
0.869935, -1.418813, 3.063896, 0.8078431, 0, 1, 1,
0.8742095, 0.285353, 0.7933862, 0.8117647, 0, 1, 1,
0.8757964, 0.5557154, 0.9489102, 0.8196079, 0, 1, 1,
0.879838, 1.22229, 1.309734, 0.8235294, 0, 1, 1,
0.884225, -1.314992, 2.552845, 0.8313726, 0, 1, 1,
0.8882042, -0.4847484, 1.239274, 0.8352941, 0, 1, 1,
0.8893605, 0.5988737, 2.028249, 0.8431373, 0, 1, 1,
0.8897595, -0.4981062, 0.7989643, 0.8470588, 0, 1, 1,
0.8900395, -0.4548354, 2.58933, 0.854902, 0, 1, 1,
0.8923466, -0.0146497, 0.8998088, 0.8588235, 0, 1, 1,
0.8930666, 0.1978411, -0.2788049, 0.8666667, 0, 1, 1,
0.8950348, 0.5316761, 2.001322, 0.8705882, 0, 1, 1,
0.8980027, 0.7469628, 2.254099, 0.8784314, 0, 1, 1,
0.90033, -0.704758, 2.236414, 0.8823529, 0, 1, 1,
0.9103599, -0.07727899, 0.2844998, 0.8901961, 0, 1, 1,
0.9168983, -0.06273455, 2.880408, 0.8941177, 0, 1, 1,
0.9173201, -0.699192, 1.89073, 0.9019608, 0, 1, 1,
0.9211077, 0.6709626, 0.7351316, 0.9098039, 0, 1, 1,
0.9215453, 1.412856, 0.8582121, 0.9137255, 0, 1, 1,
0.922461, 1.41962, 0.9079989, 0.9215686, 0, 1, 1,
0.9342813, 2.015614, -0.3681981, 0.9254902, 0, 1, 1,
0.9475113, -0.5436587, 2.688333, 0.9333333, 0, 1, 1,
0.9481097, 0.1593933, 2.636564, 0.9372549, 0, 1, 1,
0.9532638, 0.05255106, 3.960032, 0.945098, 0, 1, 1,
0.9594015, -0.8632311, 0.8714355, 0.9490196, 0, 1, 1,
0.9598489, 0.3276491, 1.104961, 0.9568627, 0, 1, 1,
0.9614359, 0.6494448, 2.291567, 0.9607843, 0, 1, 1,
0.9645191, 1.117087, 0.256327, 0.9686275, 0, 1, 1,
0.9687313, 0.3206608, 1.148518, 0.972549, 0, 1, 1,
0.9691715, 0.5865594, -0.2277056, 0.9803922, 0, 1, 1,
0.9775033, -0.7139429, 2.708923, 0.9843137, 0, 1, 1,
0.9787344, -0.451139, 2.753442, 0.9921569, 0, 1, 1,
0.9810848, 0.3855608, 1.285728, 0.9960784, 0, 1, 1,
0.982084, -1.432649, 3.097282, 1, 0, 0.9960784, 1,
0.9895936, -0.8761244, 2.116232, 1, 0, 0.9882353, 1,
0.9898501, 0.7061302, 0.6943501, 1, 0, 0.9843137, 1,
0.993412, -0.4166828, 0.4034754, 1, 0, 0.9764706, 1,
0.9967841, 0.7358624, 1.906473, 1, 0, 0.972549, 1,
0.9996798, 0.1065245, 0.04184452, 1, 0, 0.9647059, 1,
1.000808, -0.3158089, 1.85014, 1, 0, 0.9607843, 1,
1.004108, -1.095745, 3.016243, 1, 0, 0.9529412, 1,
1.004714, -1.293505, 1.522176, 1, 0, 0.9490196, 1,
1.005549, 1.202651, 1.003973, 1, 0, 0.9411765, 1,
1.010459, -1.176323, 1.823277, 1, 0, 0.9372549, 1,
1.018364, -0.576944, 2.082105, 1, 0, 0.9294118, 1,
1.019396, -0.9730842, 2.954928, 1, 0, 0.9254902, 1,
1.026794, 0.2856242, 1.450032, 1, 0, 0.9176471, 1,
1.027381, -0.07847971, -0.7743965, 1, 0, 0.9137255, 1,
1.027881, -0.2721668, 2.703519, 1, 0, 0.9058824, 1,
1.028725, 0.1658107, 1.169333, 1, 0, 0.9019608, 1,
1.033722, 0.2623804, 1.864977, 1, 0, 0.8941177, 1,
1.053003, -0.1261393, 1.270934, 1, 0, 0.8862745, 1,
1.053238, -0.5660654, 3.061181, 1, 0, 0.8823529, 1,
1.053367, 0.657154, 1.094405, 1, 0, 0.8745098, 1,
1.056482, -0.6531249, 1.808055, 1, 0, 0.8705882, 1,
1.062415, -0.1488746, 1.345847, 1, 0, 0.8627451, 1,
1.065652, -1.108535, 1.900117, 1, 0, 0.8588235, 1,
1.075528, -0.3574052, 0.004863268, 1, 0, 0.8509804, 1,
1.078987, -0.2436162, 2.549478, 1, 0, 0.8470588, 1,
1.079767, 0.4609091, 0.4507416, 1, 0, 0.8392157, 1,
1.083816, 0.5364712, -0.7742128, 1, 0, 0.8352941, 1,
1.089334, -0.3329334, 1.524087, 1, 0, 0.827451, 1,
1.089531, 1.426107, 0.5395717, 1, 0, 0.8235294, 1,
1.107252, 0.6449441, 1.441553, 1, 0, 0.8156863, 1,
1.112359, -0.758638, 1.777577, 1, 0, 0.8117647, 1,
1.136851, -1.972996, 1.577318, 1, 0, 0.8039216, 1,
1.138979, -1.008253, 2.256501, 1, 0, 0.7960784, 1,
1.146449, -3.013917, 2.785491, 1, 0, 0.7921569, 1,
1.147226, 0.02557198, -0.1320772, 1, 0, 0.7843137, 1,
1.147243, 0.7885298, 0.2293263, 1, 0, 0.7803922, 1,
1.151126, -0.2587337, 0.3097518, 1, 0, 0.772549, 1,
1.159067, -1.460063, 3.257004, 1, 0, 0.7686275, 1,
1.163653, 1.185196, 0.9852704, 1, 0, 0.7607843, 1,
1.178294, 0.7685713, 2.296225, 1, 0, 0.7568628, 1,
1.178378, 0.1574644, 0.553977, 1, 0, 0.7490196, 1,
1.18075, 1.200604, 0.2762586, 1, 0, 0.7450981, 1,
1.181728, -0.9308167, 1.714501, 1, 0, 0.7372549, 1,
1.183869, -1.125622, 2.029203, 1, 0, 0.7333333, 1,
1.192877, -0.4130205, 1.065484, 1, 0, 0.7254902, 1,
1.196443, 0.009728556, 3.457539, 1, 0, 0.7215686, 1,
1.204347, 0.2626144, 1.330152, 1, 0, 0.7137255, 1,
1.207273, -1.822061, 4.420918, 1, 0, 0.7098039, 1,
1.209495, 0.00477398, 1.324006, 1, 0, 0.7019608, 1,
1.212182, -2.210377, 2.384708, 1, 0, 0.6941177, 1,
1.213029, 1.626588, 1.231907, 1, 0, 0.6901961, 1,
1.24253, -0.03323525, 2.592026, 1, 0, 0.682353, 1,
1.253028, 0.3554046, -0.17506, 1, 0, 0.6784314, 1,
1.268231, 0.2559382, 1.447194, 1, 0, 0.6705883, 1,
1.271124, 1.31246, 0.844315, 1, 0, 0.6666667, 1,
1.297794, 1.789959, 0.8954316, 1, 0, 0.6588235, 1,
1.304825, 0.9710017, 0.9195467, 1, 0, 0.654902, 1,
1.306021, -0.03751671, 3.51072, 1, 0, 0.6470588, 1,
1.313372, -0.6329716, 3.561065, 1, 0, 0.6431373, 1,
1.316181, -0.6261988, 1.981936, 1, 0, 0.6352941, 1,
1.316594, 1.620679, -0.3965168, 1, 0, 0.6313726, 1,
1.317204, -0.8271332, -0.4089794, 1, 0, 0.6235294, 1,
1.320429, 1.31409, 2.314563, 1, 0, 0.6196079, 1,
1.340767, 0.0667022, 1.539957, 1, 0, 0.6117647, 1,
1.341829, 0.08221029, 0.8166589, 1, 0, 0.6078432, 1,
1.343959, 0.06331656, 1.159371, 1, 0, 0.6, 1,
1.348754, 0.5206459, 3.873856, 1, 0, 0.5921569, 1,
1.354736, 1.339208, 0.3322671, 1, 0, 0.5882353, 1,
1.362204, 1.16371, 0.9255831, 1, 0, 0.5803922, 1,
1.367979, -1.23286, 2.968637, 1, 0, 0.5764706, 1,
1.375541, 0.6657091, 0.05565405, 1, 0, 0.5686275, 1,
1.375697, 0.2042008, 0.5143271, 1, 0, 0.5647059, 1,
1.377684, -2.353802, 1.027225, 1, 0, 0.5568628, 1,
1.384661, -0.9045588, 3.082631, 1, 0, 0.5529412, 1,
1.393622, -0.7612748, 2.49834, 1, 0, 0.5450981, 1,
1.394735, -0.1421549, 0.9448404, 1, 0, 0.5411765, 1,
1.395459, -0.490214, 0.726546, 1, 0, 0.5333334, 1,
1.406113, -1.893767, 2.445409, 1, 0, 0.5294118, 1,
1.407783, 0.9740326, 0.4275245, 1, 0, 0.5215687, 1,
1.416871, 0.1303922, 2.467218, 1, 0, 0.5176471, 1,
1.423709, -1.508334, 2.823274, 1, 0, 0.509804, 1,
1.434348, -0.01360022, 1.804744, 1, 0, 0.5058824, 1,
1.435443, -1.138047, 1.696632, 1, 0, 0.4980392, 1,
1.440309, -0.1859569, 2.080919, 1, 0, 0.4901961, 1,
1.446646, 0.04344166, 2.189296, 1, 0, 0.4862745, 1,
1.454364, 0.8097832, 1.237562, 1, 0, 0.4784314, 1,
1.456319, 1.090245, 0.3313708, 1, 0, 0.4745098, 1,
1.465883, -0.6635956, 1.66468, 1, 0, 0.4666667, 1,
1.466239, 0.601782, -0.08033826, 1, 0, 0.4627451, 1,
1.473529, 1.889519, 1.688993, 1, 0, 0.454902, 1,
1.475684, -2.48038, 3.158109, 1, 0, 0.4509804, 1,
1.478053, 1.784139, -0.03256376, 1, 0, 0.4431373, 1,
1.482658, 1.054538, 0.5951641, 1, 0, 0.4392157, 1,
1.492423, 1.652506, -1.23533, 1, 0, 0.4313726, 1,
1.494324, -0.9205148, 2.242372, 1, 0, 0.427451, 1,
1.4954, 0.1331177, 2.261036, 1, 0, 0.4196078, 1,
1.498642, 0.2850315, 0.7284793, 1, 0, 0.4156863, 1,
1.510772, 0.001429346, 4.119621, 1, 0, 0.4078431, 1,
1.52071, 0.595729, 1.26755, 1, 0, 0.4039216, 1,
1.529616, 0.4446329, 0.5810847, 1, 0, 0.3960784, 1,
1.533508, 0.3648201, 0.2904653, 1, 0, 0.3882353, 1,
1.53679, 1.223494, 0.375701, 1, 0, 0.3843137, 1,
1.545179, 1.155706, 1.173296, 1, 0, 0.3764706, 1,
1.562659, 0.9885616, 1.277618, 1, 0, 0.372549, 1,
1.579481, -0.6027378, 3.084476, 1, 0, 0.3647059, 1,
1.604975, 0.542514, 2.049767, 1, 0, 0.3607843, 1,
1.611206, -0.8534704, 1.782632, 1, 0, 0.3529412, 1,
1.615269, -0.2639822, 1.480511, 1, 0, 0.3490196, 1,
1.623056, 0.957807, 0.3004451, 1, 0, 0.3411765, 1,
1.6434, -0.07189237, 1.356824, 1, 0, 0.3372549, 1,
1.647473, 0.6947168, 0.7454423, 1, 0, 0.3294118, 1,
1.662212, -1.882761, 1.414828, 1, 0, 0.3254902, 1,
1.6749, -0.2937204, 2.486544, 1, 0, 0.3176471, 1,
1.675292, 0.5281306, 1.499575, 1, 0, 0.3137255, 1,
1.678963, 0.5370165, 0.5953339, 1, 0, 0.3058824, 1,
1.70779, 0.7491202, 0.2490672, 1, 0, 0.2980392, 1,
1.710046, -0.03131511, 1.244098, 1, 0, 0.2941177, 1,
1.730399, 0.6140546, 1.217875, 1, 0, 0.2862745, 1,
1.747426, -0.2777888, 3.654984, 1, 0, 0.282353, 1,
1.75002, 0.2369528, 1.526735, 1, 0, 0.2745098, 1,
1.758728, 0.132413, 2.893771, 1, 0, 0.2705882, 1,
1.762259, -1.14012, 2.53155, 1, 0, 0.2627451, 1,
1.779194, 0.4401797, 2.154705, 1, 0, 0.2588235, 1,
1.780743, -1.804141, 1.85192, 1, 0, 0.2509804, 1,
1.803011, -1.905544, 2.156694, 1, 0, 0.2470588, 1,
1.817565, 0.407271, 1.042791, 1, 0, 0.2392157, 1,
1.825437, 0.3850628, 1.060895, 1, 0, 0.2352941, 1,
1.825636, -1.078624, 0.8656269, 1, 0, 0.227451, 1,
1.837901, -0.3261535, 2.384064, 1, 0, 0.2235294, 1,
1.841941, 0.4471121, 1.40824, 1, 0, 0.2156863, 1,
1.853148, 2.614716, 0.1305838, 1, 0, 0.2117647, 1,
1.855333, -0.9609438, 2.295492, 1, 0, 0.2039216, 1,
1.874656, -1.609194, 2.258871, 1, 0, 0.1960784, 1,
1.885477, -0.8169563, 2.026369, 1, 0, 0.1921569, 1,
1.895402, 0.2640678, 0.3356709, 1, 0, 0.1843137, 1,
1.923677, 0.4602038, 1.662113, 1, 0, 0.1803922, 1,
1.927011, 1.096138, 1.153073, 1, 0, 0.172549, 1,
1.927274, 0.9007367, 1.05174, 1, 0, 0.1686275, 1,
1.944454, -3.226127, 2.834159, 1, 0, 0.1607843, 1,
1.947056, -1.489632, 1.457721, 1, 0, 0.1568628, 1,
1.982682, 1.359265, 2.452922, 1, 0, 0.1490196, 1,
2.004332, 1.417004, 1.624021, 1, 0, 0.145098, 1,
2.019454, 0.4352771, 3.084429, 1, 0, 0.1372549, 1,
2.025453, 0.960203, 1.425567, 1, 0, 0.1333333, 1,
2.026989, 0.9660251, 1.373539, 1, 0, 0.1254902, 1,
2.030158, -0.2043379, 0.4492503, 1, 0, 0.1215686, 1,
2.043209, -0.2293388, 1.845898, 1, 0, 0.1137255, 1,
2.057758, -0.5326704, 0.9222782, 1, 0, 0.1098039, 1,
2.069079, 1.370106, -0.2096422, 1, 0, 0.1019608, 1,
2.079422, -0.7645723, 4.368639, 1, 0, 0.09411765, 1,
2.086039, 0.9144741, 0.3653065, 1, 0, 0.09019608, 1,
2.122808, -0.5893557, 1.461174, 1, 0, 0.08235294, 1,
2.176131, 1.513557, -0.7175081, 1, 0, 0.07843138, 1,
2.253205, 1.267981, -0.2572254, 1, 0, 0.07058824, 1,
2.254565, -0.1608131, 0.5969456, 1, 0, 0.06666667, 1,
2.267619, 0.8887366, 0.9499471, 1, 0, 0.05882353, 1,
2.269573, 0.5788522, -0.1421151, 1, 0, 0.05490196, 1,
2.549127, -0.6911697, -0.2626229, 1, 0, 0.04705882, 1,
2.574816, 0.5621009, 3.062403, 1, 0, 0.04313726, 1,
2.593693, -1.473544, 2.285725, 1, 0, 0.03529412, 1,
2.673014, 0.5843054, 1.363584, 1, 0, 0.03137255, 1,
2.73992, -0.2535841, 2.289812, 1, 0, 0.02352941, 1,
3.36714, -1.26126, -0.07341654, 1, 0, 0.01960784, 1,
3.744504, -0.2204111, 3.357542, 1, 0, 0.01176471, 1,
3.973698, -0.4623958, 1.381236, 1, 0, 0.007843138, 1
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
0.2847896, -4.437757, -6.925078, 0, -0.5, 0.5, 0.5,
0.2847896, -4.437757, -6.925078, 1, -0.5, 0.5, 0.5,
0.2847896, -4.437757, -6.925078, 1, 1.5, 0.5, 0.5,
0.2847896, -4.437757, -6.925078, 0, 1.5, 0.5, 0.5
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
-4.654659, -0.1677848, -6.925078, 0, -0.5, 0.5, 0.5,
-4.654659, -0.1677848, -6.925078, 1, -0.5, 0.5, 0.5,
-4.654659, -0.1677848, -6.925078, 1, 1.5, 0.5, 0.5,
-4.654659, -0.1677848, -6.925078, 0, 1.5, 0.5, 0.5
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
-4.654659, -4.437757, -0.07580161, 0, -0.5, 0.5, 0.5,
-4.654659, -4.437757, -0.07580161, 1, -0.5, 0.5, 0.5,
-4.654659, -4.437757, -0.07580161, 1, 1.5, 0.5, 0.5,
-4.654659, -4.437757, -0.07580161, 0, 1.5, 0.5, 0.5
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
-2, -3.452379, -5.344476,
2, -3.452379, -5.344476,
-2, -3.452379, -5.344476,
-2, -3.616608, -5.60791,
0, -3.452379, -5.344476,
0, -3.616608, -5.60791,
2, -3.452379, -5.344476,
2, -3.616608, -5.60791
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
"0",
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
-2, -3.945068, -6.134777, 0, -0.5, 0.5, 0.5,
-2, -3.945068, -6.134777, 1, -0.5, 0.5, 0.5,
-2, -3.945068, -6.134777, 1, 1.5, 0.5, 0.5,
-2, -3.945068, -6.134777, 0, 1.5, 0.5, 0.5,
0, -3.945068, -6.134777, 0, -0.5, 0.5, 0.5,
0, -3.945068, -6.134777, 1, -0.5, 0.5, 0.5,
0, -3.945068, -6.134777, 1, 1.5, 0.5, 0.5,
0, -3.945068, -6.134777, 0, 1.5, 0.5, 0.5,
2, -3.945068, -6.134777, 0, -0.5, 0.5, 0.5,
2, -3.945068, -6.134777, 1, -0.5, 0.5, 0.5,
2, -3.945068, -6.134777, 1, 1.5, 0.5, 0.5,
2, -3.945068, -6.134777, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.514786, -3, -5.344476,
-3.514786, 3, -5.344476,
-3.514786, -3, -5.344476,
-3.704765, -3, -5.60791,
-3.514786, -2, -5.344476,
-3.704765, -2, -5.60791,
-3.514786, -1, -5.344476,
-3.704765, -1, -5.60791,
-3.514786, 0, -5.344476,
-3.704765, 0, -5.60791,
-3.514786, 1, -5.344476,
-3.704765, 1, -5.60791,
-3.514786, 2, -5.344476,
-3.704765, 2, -5.60791,
-3.514786, 3, -5.344476,
-3.704765, 3, -5.60791
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
-4.084723, -3, -6.134777, 0, -0.5, 0.5, 0.5,
-4.084723, -3, -6.134777, 1, -0.5, 0.5, 0.5,
-4.084723, -3, -6.134777, 1, 1.5, 0.5, 0.5,
-4.084723, -3, -6.134777, 0, 1.5, 0.5, 0.5,
-4.084723, -2, -6.134777, 0, -0.5, 0.5, 0.5,
-4.084723, -2, -6.134777, 1, -0.5, 0.5, 0.5,
-4.084723, -2, -6.134777, 1, 1.5, 0.5, 0.5,
-4.084723, -2, -6.134777, 0, 1.5, 0.5, 0.5,
-4.084723, -1, -6.134777, 0, -0.5, 0.5, 0.5,
-4.084723, -1, -6.134777, 1, -0.5, 0.5, 0.5,
-4.084723, -1, -6.134777, 1, 1.5, 0.5, 0.5,
-4.084723, -1, -6.134777, 0, 1.5, 0.5, 0.5,
-4.084723, 0, -6.134777, 0, -0.5, 0.5, 0.5,
-4.084723, 0, -6.134777, 1, -0.5, 0.5, 0.5,
-4.084723, 0, -6.134777, 1, 1.5, 0.5, 0.5,
-4.084723, 0, -6.134777, 0, 1.5, 0.5, 0.5,
-4.084723, 1, -6.134777, 0, -0.5, 0.5, 0.5,
-4.084723, 1, -6.134777, 1, -0.5, 0.5, 0.5,
-4.084723, 1, -6.134777, 1, 1.5, 0.5, 0.5,
-4.084723, 1, -6.134777, 0, 1.5, 0.5, 0.5,
-4.084723, 2, -6.134777, 0, -0.5, 0.5, 0.5,
-4.084723, 2, -6.134777, 1, -0.5, 0.5, 0.5,
-4.084723, 2, -6.134777, 1, 1.5, 0.5, 0.5,
-4.084723, 2, -6.134777, 0, 1.5, 0.5, 0.5,
-4.084723, 3, -6.134777, 0, -0.5, 0.5, 0.5,
-4.084723, 3, -6.134777, 1, -0.5, 0.5, 0.5,
-4.084723, 3, -6.134777, 1, 1.5, 0.5, 0.5,
-4.084723, 3, -6.134777, 0, 1.5, 0.5, 0.5
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
-3.514786, -3.452379, -4,
-3.514786, -3.452379, 4,
-3.514786, -3.452379, -4,
-3.704765, -3.616608, -4,
-3.514786, -3.452379, -2,
-3.704765, -3.616608, -2,
-3.514786, -3.452379, 0,
-3.704765, -3.616608, 0,
-3.514786, -3.452379, 2,
-3.704765, -3.616608, 2,
-3.514786, -3.452379, 4,
-3.704765, -3.616608, 4
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
-4.084723, -3.945068, -4, 0, -0.5, 0.5, 0.5,
-4.084723, -3.945068, -4, 1, -0.5, 0.5, 0.5,
-4.084723, -3.945068, -4, 1, 1.5, 0.5, 0.5,
-4.084723, -3.945068, -4, 0, 1.5, 0.5, 0.5,
-4.084723, -3.945068, -2, 0, -0.5, 0.5, 0.5,
-4.084723, -3.945068, -2, 1, -0.5, 0.5, 0.5,
-4.084723, -3.945068, -2, 1, 1.5, 0.5, 0.5,
-4.084723, -3.945068, -2, 0, 1.5, 0.5, 0.5,
-4.084723, -3.945068, 0, 0, -0.5, 0.5, 0.5,
-4.084723, -3.945068, 0, 1, -0.5, 0.5, 0.5,
-4.084723, -3.945068, 0, 1, 1.5, 0.5, 0.5,
-4.084723, -3.945068, 0, 0, 1.5, 0.5, 0.5,
-4.084723, -3.945068, 2, 0, -0.5, 0.5, 0.5,
-4.084723, -3.945068, 2, 1, -0.5, 0.5, 0.5,
-4.084723, -3.945068, 2, 1, 1.5, 0.5, 0.5,
-4.084723, -3.945068, 2, 0, 1.5, 0.5, 0.5,
-4.084723, -3.945068, 4, 0, -0.5, 0.5, 0.5,
-4.084723, -3.945068, 4, 1, -0.5, 0.5, 0.5,
-4.084723, -3.945068, 4, 1, 1.5, 0.5, 0.5,
-4.084723, -3.945068, 4, 0, 1.5, 0.5, 0.5
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
-3.514786, -3.452379, -5.344476,
-3.514786, 3.116809, -5.344476,
-3.514786, -3.452379, 5.192873,
-3.514786, 3.116809, 5.192873,
-3.514786, -3.452379, -5.344476,
-3.514786, -3.452379, 5.192873,
-3.514786, 3.116809, -5.344476,
-3.514786, 3.116809, 5.192873,
-3.514786, -3.452379, -5.344476,
4.084366, -3.452379, -5.344476,
-3.514786, -3.452379, 5.192873,
4.084366, -3.452379, 5.192873,
-3.514786, 3.116809, -5.344476,
4.084366, 3.116809, -5.344476,
-3.514786, 3.116809, 5.192873,
4.084366, 3.116809, 5.192873,
4.084366, -3.452379, -5.344476,
4.084366, 3.116809, -5.344476,
4.084366, -3.452379, 5.192873,
4.084366, 3.116809, 5.192873,
4.084366, -3.452379, -5.344476,
4.084366, -3.452379, 5.192873,
4.084366, 3.116809, -5.344476,
4.084366, 3.116809, 5.192873
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
var radius = 7.77372;
var distance = 34.58616;
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
mvMatrix.translate( -0.2847896, 0.1677848, 0.07580161 );
mvMatrix.scale( 1.106057, 1.279473, 0.7976484 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.58616);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
DOSANEX<-read.table("DOSANEX.xyz", skip=1)
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
-3.404119, -0.04731914, -2.108736, 0, 0, 1, 1, 1,
-3.029749, -0.7184653, -2.697848, 1, 0, 0, 1, 1,
-2.763059, -0.4541439, -0.4945596, 1, 0, 0, 1, 1,
-2.73613, -1.085453, -3.07773, 1, 0, 0, 1, 1,
-2.718615, 1.032956, -1.545194, 1, 0, 0, 1, 1,
-2.713016, 1.197558, -2.081189, 1, 0, 0, 1, 1,
-2.553816, -0.2233788, 0.3530735, 0, 0, 0, 1, 1,
-2.53266, -0.8797957, -1.981807, 0, 0, 0, 1, 1,
-2.504888, 0.4119109, -0.5586283, 0, 0, 0, 1, 1,
-2.483022, -1.023478, -0.3215466, 0, 0, 0, 1, 1,
-2.444979, -0.8350726, -2.238244, 0, 0, 0, 1, 1,
-2.400949, -0.3000846, -2.112231, 0, 0, 0, 1, 1,
-2.376089, 0.08405676, -1.283741, 0, 0, 0, 1, 1,
-2.299178, -0.5954816, -1.779892, 1, 1, 1, 1, 1,
-2.262632, 1.277309, 0.6984737, 1, 1, 1, 1, 1,
-2.254093, -0.2849723, -1.116386, 1, 1, 1, 1, 1,
-2.23142, -0.96758, -3.135925, 1, 1, 1, 1, 1,
-2.209111, -0.7685582, -1.266343, 1, 1, 1, 1, 1,
-2.20503, -0.09767536, -0.7433926, 1, 1, 1, 1, 1,
-2.189482, 1.791944, -0.9474079, 1, 1, 1, 1, 1,
-2.186873, 1.680207, 0.0570775, 1, 1, 1, 1, 1,
-2.15549, 2.050564, -0.2651013, 1, 1, 1, 1, 1,
-2.107743, 0.1678612, -0.3709271, 1, 1, 1, 1, 1,
-2.075809, -0.5329609, -2.605951, 1, 1, 1, 1, 1,
-2.054058, 0.8204418, -1.537495, 1, 1, 1, 1, 1,
-2.021995, -0.1134574, -2.487654, 1, 1, 1, 1, 1,
-1.981733, -1.372538, -2.42255, 1, 1, 1, 1, 1,
-1.949566, 0.8377299, -2.008079, 1, 1, 1, 1, 1,
-1.940702, 0.6905457, -0.3551833, 0, 0, 1, 1, 1,
-1.939936, 0.4691545, -1.016888, 1, 0, 0, 1, 1,
-1.905738, 1.691018, -0.979775, 1, 0, 0, 1, 1,
-1.873709, -0.5916619, -2.870983, 1, 0, 0, 1, 1,
-1.857329, -0.006498182, -3.055662, 1, 0, 0, 1, 1,
-1.850172, 0.481807, -2.422386, 1, 0, 0, 1, 1,
-1.823256, 0.7385114, -1.350159, 0, 0, 0, 1, 1,
-1.772007, -0.1023532, -1.22895, 0, 0, 0, 1, 1,
-1.765835, 1.164361, -0.1265602, 0, 0, 0, 1, 1,
-1.751096, 1.750068, -0.2323247, 0, 0, 0, 1, 1,
-1.744168, 1.95005, -0.8717438, 0, 0, 0, 1, 1,
-1.738177, 0.244378, -1.895315, 0, 0, 0, 1, 1,
-1.721409, 0.9845954, -1.158978, 0, 0, 0, 1, 1,
-1.713815, 1.96146, -0.6027259, 1, 1, 1, 1, 1,
-1.710739, 0.07335878, -3.246042, 1, 1, 1, 1, 1,
-1.695866, -0.2982011, -2.001311, 1, 1, 1, 1, 1,
-1.68599, 1.970977, -1.624775, 1, 1, 1, 1, 1,
-1.680976, -0.2156652, -1.976014, 1, 1, 1, 1, 1,
-1.680254, -0.2174119, -2.373188, 1, 1, 1, 1, 1,
-1.671263, -0.264765, -2.175581, 1, 1, 1, 1, 1,
-1.66067, 0.5559731, -1.638966, 1, 1, 1, 1, 1,
-1.653752, -1.002547, -1.75877, 1, 1, 1, 1, 1,
-1.637975, 0.01875091, -2.694915, 1, 1, 1, 1, 1,
-1.608904, 0.6186576, -0.5596862, 1, 1, 1, 1, 1,
-1.607818, -0.2656751, -2.7315, 1, 1, 1, 1, 1,
-1.595851, 0.3277159, -2.673569, 1, 1, 1, 1, 1,
-1.595426, -0.3071877, -2.315187, 1, 1, 1, 1, 1,
-1.583037, -1.126776, -1.316102, 1, 1, 1, 1, 1,
-1.55693, -0.4914467, -1.855734, 0, 0, 1, 1, 1,
-1.556594, 0.4338561, -1.990398, 1, 0, 0, 1, 1,
-1.554591, 0.002018371, -1.208595, 1, 0, 0, 1, 1,
-1.551816, -3.356711, -4.000337, 1, 0, 0, 1, 1,
-1.544694, 0.3024912, -1.975314, 1, 0, 0, 1, 1,
-1.524702, 0.2650863, -4.311457, 1, 0, 0, 1, 1,
-1.505322, 0.07309529, -1.509079, 0, 0, 0, 1, 1,
-1.498328, 0.1003818, -2.363613, 0, 0, 0, 1, 1,
-1.49832, -0.5646625, -0.6981351, 0, 0, 0, 1, 1,
-1.49563, -0.003751945, -1.734028, 0, 0, 0, 1, 1,
-1.495075, -0.9581454, -2.526566, 0, 0, 0, 1, 1,
-1.494034, -0.6352263, -2.831766, 0, 0, 0, 1, 1,
-1.485578, -0.63577, -3.388379, 0, 0, 0, 1, 1,
-1.484477, 0.71785, -1.83548, 1, 1, 1, 1, 1,
-1.472833, 0.4948737, 0.3563277, 1, 1, 1, 1, 1,
-1.467601, 0.5800185, -1.652786, 1, 1, 1, 1, 1,
-1.467509, 0.5741084, -0.4923267, 1, 1, 1, 1, 1,
-1.464612, 2.652063, -0.2996621, 1, 1, 1, 1, 1,
-1.449205, -0.2152783, 0.01554553, 1, 1, 1, 1, 1,
-1.448203, -0.06537585, 0.7155851, 1, 1, 1, 1, 1,
-1.447477, 1.209033, 0.462051, 1, 1, 1, 1, 1,
-1.439505, -1.22724, -1.736761, 1, 1, 1, 1, 1,
-1.438023, 1.195761, -1.259429, 1, 1, 1, 1, 1,
-1.43005, 0.4990025, -0.9601662, 1, 1, 1, 1, 1,
-1.428113, -1.949128, -0.4683596, 1, 1, 1, 1, 1,
-1.422624, -0.01125202, -2.431984, 1, 1, 1, 1, 1,
-1.421134, 0.487134, 0.02605547, 1, 1, 1, 1, 1,
-1.420621, -0.154092, -2.56184, 1, 1, 1, 1, 1,
-1.413205, -2.942998, -3.045985, 0, 0, 1, 1, 1,
-1.398063, 0.0633633, -1.646196, 1, 0, 0, 1, 1,
-1.391882, 0.1108029, -1.449134, 1, 0, 0, 1, 1,
-1.389192, 1.422848, 0.560642, 1, 0, 0, 1, 1,
-1.387955, 0.1614765, -1.665909, 1, 0, 0, 1, 1,
-1.376691, -2.232775, -1.497748, 1, 0, 0, 1, 1,
-1.370622, -2.150509, -4.488011, 0, 0, 0, 1, 1,
-1.359908, -0.9932582, -2.84344, 0, 0, 0, 1, 1,
-1.359043, -1.157658, -5.19102, 0, 0, 0, 1, 1,
-1.350307, -0.1483268, -1.518453, 0, 0, 0, 1, 1,
-1.349503, -0.5525612, -1.945481, 0, 0, 0, 1, 1,
-1.342589, 0.2335936, 0.5140135, 0, 0, 0, 1, 1,
-1.340935, -0.8801424, -2.099032, 0, 0, 0, 1, 1,
-1.339524, -0.7606909, -3.077179, 1, 1, 1, 1, 1,
-1.339244, -0.9239531, -0.417809, 1, 1, 1, 1, 1,
-1.335567, -1.589784, -1.560021, 1, 1, 1, 1, 1,
-1.327082, -0.3070157, -1.825176, 1, 1, 1, 1, 1,
-1.327016, 1.200198, -0.8654872, 1, 1, 1, 1, 1,
-1.326539, -0.04894151, -0.3893615, 1, 1, 1, 1, 1,
-1.324211, -1.414007, -1.244598, 1, 1, 1, 1, 1,
-1.322279, 0.8352991, -2.752592, 1, 1, 1, 1, 1,
-1.309046, -1.346473, -3.309579, 1, 1, 1, 1, 1,
-1.305348, 0.4823512, -0.6017486, 1, 1, 1, 1, 1,
-1.305064, 0.9598507, -1.260915, 1, 1, 1, 1, 1,
-1.30432, -1.155255, -3.229656, 1, 1, 1, 1, 1,
-1.300449, -0.2626469, -0.2704009, 1, 1, 1, 1, 1,
-1.295028, -0.1842376, -1.286262, 1, 1, 1, 1, 1,
-1.286446, -0.4106235, -0.9176144, 1, 1, 1, 1, 1,
-1.282704, 0.5080998, -1.924185, 0, 0, 1, 1, 1,
-1.282099, 0.5788481, -1.699138, 1, 0, 0, 1, 1,
-1.249383, -1.798881, -2.769222, 1, 0, 0, 1, 1,
-1.24818, -0.8612906, -1.509082, 1, 0, 0, 1, 1,
-1.233448, -1.426128, -2.19454, 1, 0, 0, 1, 1,
-1.18933, -0.8170122, -1.845121, 1, 0, 0, 1, 1,
-1.180491, -0.720832, -1.984876, 0, 0, 0, 1, 1,
-1.179461, 0.9787136, -1.609154, 0, 0, 0, 1, 1,
-1.173176, 0.1664448, -3.78812, 0, 0, 0, 1, 1,
-1.157709, -0.3379321, -2.024503, 0, 0, 0, 1, 1,
-1.156279, -0.193516, -2.553507, 0, 0, 0, 1, 1,
-1.155647, 0.598199, -3.419816, 0, 0, 0, 1, 1,
-1.131589, 0.5733388, -0.2668218, 0, 0, 0, 1, 1,
-1.127818, 1.708535, -0.7845097, 1, 1, 1, 1, 1,
-1.126809, 0.07304558, -1.078207, 1, 1, 1, 1, 1,
-1.126109, -0.8600553, -1.705114, 1, 1, 1, 1, 1,
-1.124722, 0.9270408, -0.01517246, 1, 1, 1, 1, 1,
-1.120038, 0.3147291, -2.142241, 1, 1, 1, 1, 1,
-1.117929, -0.8247431, -3.19752, 1, 1, 1, 1, 1,
-1.113917, 0.4564672, -1.932346, 1, 1, 1, 1, 1,
-1.112123, -1.129635, -0.2067778, 1, 1, 1, 1, 1,
-1.109979, -0.694093, -1.976715, 1, 1, 1, 1, 1,
-1.10829, 0.4901084, -2.643823, 1, 1, 1, 1, 1,
-1.107537, -1.198616, -3.27719, 1, 1, 1, 1, 1,
-1.104393, -1.481413, -0.7227378, 1, 1, 1, 1, 1,
-1.099945, -0.05718221, -1.524745, 1, 1, 1, 1, 1,
-1.09473, -0.4325185, -1.849472, 1, 1, 1, 1, 1,
-1.088322, -1.040189, -3.299267, 1, 1, 1, 1, 1,
-1.083303, 1.651664, -1.480675, 0, 0, 1, 1, 1,
-1.076373, -0.6373429, -3.111312, 1, 0, 0, 1, 1,
-1.072622, 0.05576432, -1.474377, 1, 0, 0, 1, 1,
-1.059277, -0.6001234, -1.70044, 1, 0, 0, 1, 1,
-1.057464, -0.5581588, -1.262186, 1, 0, 0, 1, 1,
-1.052219, -0.05562197, -0.06971113, 1, 0, 0, 1, 1,
-1.049298, 0.8275618, -2.29969, 0, 0, 0, 1, 1,
-1.046712, 0.6321769, -1.862513, 0, 0, 0, 1, 1,
-1.038199, 1.682389, 0.2766477, 0, 0, 0, 1, 1,
-1.024637, -1.887412, -2.117392, 0, 0, 0, 1, 1,
-1.023879, 0.6993955, -0.3643223, 0, 0, 0, 1, 1,
-1.02179, -0.4058077, -1.565827, 0, 0, 0, 1, 1,
-1.016439, -0.1040319, -1.836255, 0, 0, 0, 1, 1,
-1.010602, 0.4681188, -1.576533, 1, 1, 1, 1, 1,
-1.007428, 0.1668814, -2.066989, 1, 1, 1, 1, 1,
-1.004791, -0.5221552, -1.983998, 1, 1, 1, 1, 1,
-1.004715, 0.4125536, -0.638375, 1, 1, 1, 1, 1,
-1.001927, -0.6465415, -3.172224, 1, 1, 1, 1, 1,
-0.9988371, -0.2272045, -1.2758, 1, 1, 1, 1, 1,
-0.9953212, 0.2621191, -0.6230131, 1, 1, 1, 1, 1,
-0.9919915, -0.6483417, -2.78449, 1, 1, 1, 1, 1,
-0.9895468, -0.01537331, -0.5458803, 1, 1, 1, 1, 1,
-0.9771983, -0.4851621, -4.165578, 1, 1, 1, 1, 1,
-0.9722342, 0.8752875, 0.530907, 1, 1, 1, 1, 1,
-0.9717706, 0.5833436, -0.4467067, 1, 1, 1, 1, 1,
-0.9648917, -1.37306, -2.374078, 1, 1, 1, 1, 1,
-0.9610078, 1.097425, -0.4441169, 1, 1, 1, 1, 1,
-0.9608639, -1.849381, -1.186998, 1, 1, 1, 1, 1,
-0.9596451, 0.01253589, -1.947895, 0, 0, 1, 1, 1,
-0.9570356, -0.1265879, -1.023269, 1, 0, 0, 1, 1,
-0.9557061, 0.2481193, 0.3535462, 1, 0, 0, 1, 1,
-0.9470268, -0.02096893, -1.205733, 1, 0, 0, 1, 1,
-0.9457129, 0.3755465, -1.823845, 1, 0, 0, 1, 1,
-0.9439641, -0.01427328, -0.7576487, 1, 0, 0, 1, 1,
-0.9398334, 1.237128, 0.005581278, 0, 0, 0, 1, 1,
-0.9318893, 0.8124057, -1.095649, 0, 0, 0, 1, 1,
-0.9219305, 0.6958479, -0.7887508, 0, 0, 0, 1, 1,
-0.9202552, -0.107664, -1.857977, 0, 0, 0, 1, 1,
-0.9168909, 0.4315462, -0.2475203, 0, 0, 0, 1, 1,
-0.9038742, 0.3804519, -0.1904911, 0, 0, 0, 1, 1,
-0.9023659, 1.022256, -0.2759997, 0, 0, 0, 1, 1,
-0.8979464, -0.1717603, -1.889729, 1, 1, 1, 1, 1,
-0.8968266, -1.393064, -4.300552, 1, 1, 1, 1, 1,
-0.8962944, -0.7546343, -1.886678, 1, 1, 1, 1, 1,
-0.8940378, 0.4113843, -0.6811129, 1, 1, 1, 1, 1,
-0.8829304, 1.622214, 1.627493, 1, 1, 1, 1, 1,
-0.881805, 1.805881, -1.423315, 1, 1, 1, 1, 1,
-0.8766279, -0.2932985, -2.071898, 1, 1, 1, 1, 1,
-0.8762742, -0.4074283, -1.808589, 1, 1, 1, 1, 1,
-0.8682742, 1.363172, -1.047529, 1, 1, 1, 1, 1,
-0.8587396, 0.1489177, -2.683434, 1, 1, 1, 1, 1,
-0.8559924, -0.03514098, -1.618894, 1, 1, 1, 1, 1,
-0.8522642, 0.6833206, -3.241736, 1, 1, 1, 1, 1,
-0.8505285, 0.1614643, -0.6302142, 1, 1, 1, 1, 1,
-0.8497808, 1.08546, -1.208447, 1, 1, 1, 1, 1,
-0.8436373, -0.3027754, -2.626164, 1, 1, 1, 1, 1,
-0.8429958, 1.240901, -1.252901, 0, 0, 1, 1, 1,
-0.8363572, 0.1578351, -2.811598, 1, 0, 0, 1, 1,
-0.8323709, 0.3746485, 0.1077221, 1, 0, 0, 1, 1,
-0.827726, -1.593992, -3.732722, 1, 0, 0, 1, 1,
-0.8273206, 1.468277, -2.461538, 1, 0, 0, 1, 1,
-0.82485, 0.384035, -1.771408, 1, 0, 0, 1, 1,
-0.822369, 1.339875, -0.6046937, 0, 0, 0, 1, 1,
-0.8190644, 0.05656791, -1.843327, 0, 0, 0, 1, 1,
-0.8186117, -0.2192051, -0.8669124, 0, 0, 0, 1, 1,
-0.8112302, 0.3489608, -2.573441, 0, 0, 0, 1, 1,
-0.8037945, -1.660377, -2.355474, 0, 0, 0, 1, 1,
-0.795937, -2.510995, -2.499348, 0, 0, 0, 1, 1,
-0.7958302, 1.844476, 0.1696782, 0, 0, 0, 1, 1,
-0.7950493, 0.2436255, -0.9108838, 1, 1, 1, 1, 1,
-0.7940313, -0.8377556, 0.1866001, 1, 1, 1, 1, 1,
-0.7842137, 0.6972334, -1.855023, 1, 1, 1, 1, 1,
-0.7783045, 1.241248, -0.4770984, 1, 1, 1, 1, 1,
-0.7780542, -0.9737769, -1.214158, 1, 1, 1, 1, 1,
-0.7743644, 0.536661, -0.02448405, 1, 1, 1, 1, 1,
-0.7729806, 1.296627, -0.05468175, 1, 1, 1, 1, 1,
-0.7728046, -0.9176422, -1.288862, 1, 1, 1, 1, 1,
-0.7687468, -0.7453372, -3.814545, 1, 1, 1, 1, 1,
-0.7679359, 0.2430056, -1.251592, 1, 1, 1, 1, 1,
-0.7674965, 1.550063, -1.703352, 1, 1, 1, 1, 1,
-0.7634988, 1.03165, -0.2519443, 1, 1, 1, 1, 1,
-0.762245, 1.571163, 0.1047654, 1, 1, 1, 1, 1,
-0.7607428, 0.2820592, -1.803562, 1, 1, 1, 1, 1,
-0.7573555, -0.7973959, -4.849914, 1, 1, 1, 1, 1,
-0.7497622, -0.5209855, -2.755827, 0, 0, 1, 1, 1,
-0.7493819, -0.6503647, -3.596633, 1, 0, 0, 1, 1,
-0.749054, 0.7436175, -0.2682978, 1, 0, 0, 1, 1,
-0.7479836, -0.0082934, -2.071301, 1, 0, 0, 1, 1,
-0.7412799, 0.01928703, -2.633107, 1, 0, 0, 1, 1,
-0.7355449, -0.1965615, 1.667969, 1, 0, 0, 1, 1,
-0.735352, 1.300235, -0.5607027, 0, 0, 0, 1, 1,
-0.7257698, -0.1728545, -2.051868, 0, 0, 0, 1, 1,
-0.7217551, 0.5474876, 0.331428, 0, 0, 0, 1, 1,
-0.7164764, 0.6826644, 0.3805413, 0, 0, 0, 1, 1,
-0.7133377, -0.4519809, -3.124157, 0, 0, 0, 1, 1,
-0.7126885, -0.6817284, -2.082484, 0, 0, 0, 1, 1,
-0.7076581, 0.8803749, -2.716396, 0, 0, 0, 1, 1,
-0.7057016, 0.4709732, 1.303057, 1, 1, 1, 1, 1,
-0.7029588, -0.3352388, -2.515931, 1, 1, 1, 1, 1,
-0.6996965, -0.1732546, -2.496184, 1, 1, 1, 1, 1,
-0.6958675, -1.292083, -3.633491, 1, 1, 1, 1, 1,
-0.6881133, -0.007259204, -2.206685, 1, 1, 1, 1, 1,
-0.6869143, -2.553237, -2.298152, 1, 1, 1, 1, 1,
-0.6835656, 0.05375144, -1.195465, 1, 1, 1, 1, 1,
-0.6755258, 1.020282, 0.5111681, 1, 1, 1, 1, 1,
-0.6730347, 1.120097, -0.9043531, 1, 1, 1, 1, 1,
-0.6688949, 0.3165053, -1.185158, 1, 1, 1, 1, 1,
-0.6649404, 0.4288121, -2.530471, 1, 1, 1, 1, 1,
-0.663922, 2.110136, 1.046054, 1, 1, 1, 1, 1,
-0.6628152, -0.5446789, -1.762096, 1, 1, 1, 1, 1,
-0.6538429, -0.8729707, -2.443029, 1, 1, 1, 1, 1,
-0.6492814, -1.084409, -2.503874, 1, 1, 1, 1, 1,
-0.641436, 0.3475206, -1.144803, 0, 0, 1, 1, 1,
-0.6379239, 0.2614276, -1.84379, 1, 0, 0, 1, 1,
-0.6305445, 0.2565647, -3.588467, 1, 0, 0, 1, 1,
-0.6269639, -0.2247594, -3.324655, 1, 0, 0, 1, 1,
-0.6256412, -0.002416912, -0.3308027, 1, 0, 0, 1, 1,
-0.6222408, -0.9983492, -2.607152, 1, 0, 0, 1, 1,
-0.6221457, -1.424995, -0.7063324, 0, 0, 0, 1, 1,
-0.6214543, 0.1292693, -0.8940585, 0, 0, 0, 1, 1,
-0.6196604, -1.135109, -2.342816, 0, 0, 0, 1, 1,
-0.619238, -0.1538478, -1.763055, 0, 0, 0, 1, 1,
-0.6122335, -0.8346598, -2.722144, 0, 0, 0, 1, 1,
-0.6112316, -0.9979641, -1.182571, 0, 0, 0, 1, 1,
-0.6071327, -2.100225, -3.173928, 0, 0, 0, 1, 1,
-0.6066837, -0.4913133, -0.6554027, 1, 1, 1, 1, 1,
-0.6059332, 0.07341926, -0.5760948, 1, 1, 1, 1, 1,
-0.6055991, -2.771435, -2.346935, 1, 1, 1, 1, 1,
-0.6021907, -0.8515038, -2.757021, 1, 1, 1, 1, 1,
-0.6009917, -1.196048, -2.404006, 1, 1, 1, 1, 1,
-0.6006309, 0.319047, -1.321746, 1, 1, 1, 1, 1,
-0.5998819, -2.28986, -3.411139, 1, 1, 1, 1, 1,
-0.5980061, -1.000082, -2.262699, 1, 1, 1, 1, 1,
-0.5959519, -0.8851649, -1.934416, 1, 1, 1, 1, 1,
-0.5927948, 0.6410332, -2.033408, 1, 1, 1, 1, 1,
-0.5922713, 1.511733, -1.03869, 1, 1, 1, 1, 1,
-0.5911838, -0.612103, -2.744589, 1, 1, 1, 1, 1,
-0.5908955, 0.8254609, -0.6700851, 1, 1, 1, 1, 1,
-0.5905874, 1.743669, -0.1149587, 1, 1, 1, 1, 1,
-0.5896105, 2.038169, -1.230296, 1, 1, 1, 1, 1,
-0.5836181, -0.4945616, -3.007898, 0, 0, 1, 1, 1,
-0.5827025, 1.092638, 0.7517484, 1, 0, 0, 1, 1,
-0.5819369, 1.396736, -0.3532093, 1, 0, 0, 1, 1,
-0.5813663, 1.038913, -1.47835, 1, 0, 0, 1, 1,
-0.5803264, 0.2691329, -2.024627, 1, 0, 0, 1, 1,
-0.5785351, -0.3462195, -2.962697, 1, 0, 0, 1, 1,
-0.5783701, 1.958424, 0.5257271, 0, 0, 0, 1, 1,
-0.5733699, -0.8657938, -1.429295, 0, 0, 0, 1, 1,
-0.5632614, -0.3749115, -2.262274, 0, 0, 0, 1, 1,
-0.5611699, 0.2925608, -2.565988, 0, 0, 0, 1, 1,
-0.5598212, 0.06080615, -1.834176, 0, 0, 0, 1, 1,
-0.5595664, 0.6848487, -0.8655602, 0, 0, 0, 1, 1,
-0.5586988, -0.3315717, -1.58354, 0, 0, 0, 1, 1,
-0.5549418, -0.2195124, -1.790533, 1, 1, 1, 1, 1,
-0.5543205, -1.057383, -2.264208, 1, 1, 1, 1, 1,
-0.5531876, -0.614687, -2.104069, 1, 1, 1, 1, 1,
-0.5504628, -0.1585264, -1.380843, 1, 1, 1, 1, 1,
-0.5441896, 0.3433163, -2.207263, 1, 1, 1, 1, 1,
-0.5401809, -0.3848543, -0.3201113, 1, 1, 1, 1, 1,
-0.538213, 0.197248, -1.59436, 1, 1, 1, 1, 1,
-0.5379535, -0.1888568, -2.588959, 1, 1, 1, 1, 1,
-0.5353811, -1.073916, -2.95919, 1, 1, 1, 1, 1,
-0.5345824, 0.8022367, -2.651998, 1, 1, 1, 1, 1,
-0.5340321, -0.1510727, -0.6549265, 1, 1, 1, 1, 1,
-0.5301102, 0.6913722, -1.510266, 1, 1, 1, 1, 1,
-0.5209619, 1.085509, 0.2347819, 1, 1, 1, 1, 1,
-0.5117655, -1.691843, -0.2016473, 1, 1, 1, 1, 1,
-0.5101846, -0.5630605, -4.143388, 1, 1, 1, 1, 1,
-0.5087877, 2.086493, -1.884427, 0, 0, 1, 1, 1,
-0.5073813, 0.2052676, -1.062162, 1, 0, 0, 1, 1,
-0.5021479, 0.2196773, -0.7762254, 1, 0, 0, 1, 1,
-0.5019712, 0.04259212, -2.69965, 1, 0, 0, 1, 1,
-0.5009731, 0.4034012, 0.008918954, 1, 0, 0, 1, 1,
-0.5002642, 1.062611, -1.188914, 1, 0, 0, 1, 1,
-0.4999515, -0.2005366, -1.91836, 0, 0, 0, 1, 1,
-0.4953677, 1.673542, 0.3429872, 0, 0, 0, 1, 1,
-0.4925582, -0.1401703, -2.667358, 0, 0, 0, 1, 1,
-0.4923232, 0.2273556, -0.8894987, 0, 0, 0, 1, 1,
-0.4731482, -0.4728131, -1.215092, 0, 0, 0, 1, 1,
-0.4730293, -0.8810319, -4.374104, 0, 0, 0, 1, 1,
-0.4724684, -1.184584, -2.407714, 0, 0, 0, 1, 1,
-0.4635011, -0.3609401, -0.6023294, 1, 1, 1, 1, 1,
-0.4590923, 0.8114094, -0.6306578, 1, 1, 1, 1, 1,
-0.4574805, -0.9526777, -4.599641, 1, 1, 1, 1, 1,
-0.4544299, 0.3955465, -1.131591, 1, 1, 1, 1, 1,
-0.4519186, 0.3216528, -1.361481, 1, 1, 1, 1, 1,
-0.4512226, 0.305897, -1.155485, 1, 1, 1, 1, 1,
-0.4504275, -0.9880049, -2.446208, 1, 1, 1, 1, 1,
-0.4501405, -0.3121948, -0.1494206, 1, 1, 1, 1, 1,
-0.4494624, 1.401469, 0.8414105, 1, 1, 1, 1, 1,
-0.446254, 0.5901253, -2.063818, 1, 1, 1, 1, 1,
-0.4432111, 0.2900273, -0.7408508, 1, 1, 1, 1, 1,
-0.4400369, 0.1442534, -1.473996, 1, 1, 1, 1, 1,
-0.4384474, -0.6647974, -2.848832, 1, 1, 1, 1, 1,
-0.4380052, 0.3147461, -2.265213, 1, 1, 1, 1, 1,
-0.4259606, -2.149518, -0.6625466, 1, 1, 1, 1, 1,
-0.4245284, 1.256699, -1.001538, 0, 0, 1, 1, 1,
-0.4244085, 0.2293922, -0.7359385, 1, 0, 0, 1, 1,
-0.4200179, 0.308451, -1.24254, 1, 0, 0, 1, 1,
-0.4172702, 1.944378, -0.2688822, 1, 0, 0, 1, 1,
-0.4134596, -0.01161359, -2.023424, 1, 0, 0, 1, 1,
-0.4128228, 0.9091589, -0.5940652, 1, 0, 0, 1, 1,
-0.4095838, -0.6857317, -2.45068, 0, 0, 0, 1, 1,
-0.4073962, -1.361313, -2.936766, 0, 0, 0, 1, 1,
-0.4067073, -0.8775875, -3.091727, 0, 0, 0, 1, 1,
-0.4041981, -0.6649611, -2.033362, 0, 0, 0, 1, 1,
-0.4035279, -0.8212718, -2.547096, 0, 0, 0, 1, 1,
-0.3937877, 0.7719463, 0.04782209, 0, 0, 0, 1, 1,
-0.3913633, -0.1383069, 0.6049992, 0, 0, 0, 1, 1,
-0.3896285, 0.7080194, -1.407028, 1, 1, 1, 1, 1,
-0.3886124, -0.7499658, -4.13413, 1, 1, 1, 1, 1,
-0.3838259, -0.4580677, -1.582021, 1, 1, 1, 1, 1,
-0.3815721, -0.7637124, -3.636432, 1, 1, 1, 1, 1,
-0.3743055, -1.590428, -1.025922, 1, 1, 1, 1, 1,
-0.3738705, 1.508233, -0.6899801, 1, 1, 1, 1, 1,
-0.3729168, -1.245501, -3.283579, 1, 1, 1, 1, 1,
-0.3673919, 0.3705906, -3.191055, 1, 1, 1, 1, 1,
-0.3661511, -0.2463688, 0.01163167, 1, 1, 1, 1, 1,
-0.3646274, 0.6635578, 1.917444, 1, 1, 1, 1, 1,
-0.3643689, -0.9404523, -4.386292, 1, 1, 1, 1, 1,
-0.3635573, -0.5030553, -2.201238, 1, 1, 1, 1, 1,
-0.3631385, -1.037897, -2.601975, 1, 1, 1, 1, 1,
-0.3605579, 0.372638, -0.02548679, 1, 1, 1, 1, 1,
-0.3601856, 0.3403445, -2.228862, 1, 1, 1, 1, 1,
-0.3581583, 0.008436713, -1.263511, 0, 0, 1, 1, 1,
-0.3517986, 0.1810219, -0.647358, 1, 0, 0, 1, 1,
-0.3515806, 0.3269969, -1.279008, 1, 0, 0, 1, 1,
-0.3503636, 1.017192, 1.48468, 1, 0, 0, 1, 1,
-0.3500463, 1.914394, 0.1664819, 1, 0, 0, 1, 1,
-0.3497995, -0.4519642, -4.272332, 1, 0, 0, 1, 1,
-0.3485659, -1.057655, -3.778773, 0, 0, 0, 1, 1,
-0.3485325, -1.711548, -3.48772, 0, 0, 0, 1, 1,
-0.3469006, -0.9890932, -2.510429, 0, 0, 0, 1, 1,
-0.3460956, -0.3498569, -1.639622, 0, 0, 0, 1, 1,
-0.3443936, 0.2092911, -3.895186, 0, 0, 0, 1, 1,
-0.3372234, 0.1300575, -3.044716, 0, 0, 0, 1, 1,
-0.3370399, 1.200543, -1.308212, 0, 0, 0, 1, 1,
-0.3360016, 1.356597, -1.003539, 1, 1, 1, 1, 1,
-0.3328331, -1.663487, -3.464772, 1, 1, 1, 1, 1,
-0.3272142, -0.8028603, -2.482603, 1, 1, 1, 1, 1,
-0.3186417, 1.138367, -0.1428567, 1, 1, 1, 1, 1,
-0.3163314, 0.4613267, -1.011772, 1, 1, 1, 1, 1,
-0.3161476, -0.3368911, -4.789687, 1, 1, 1, 1, 1,
-0.3128321, -0.06170572, -1.333757, 1, 1, 1, 1, 1,
-0.3020997, -0.425139, -2.747936, 1, 1, 1, 1, 1,
-0.3006975, -0.196738, -3.83577, 1, 1, 1, 1, 1,
-0.299605, 0.8025344, 0.210279, 1, 1, 1, 1, 1,
-0.298364, 0.2284748, -1.59839, 1, 1, 1, 1, 1,
-0.2961933, 1.062801, -1.146324, 1, 1, 1, 1, 1,
-0.2896902, 1.342733, -1.33745, 1, 1, 1, 1, 1,
-0.2887877, -0.1065127, -1.693075, 1, 1, 1, 1, 1,
-0.2885869, -0.6202421, -1.152393, 1, 1, 1, 1, 1,
-0.2851249, -0.7995141, -1.782939, 0, 0, 1, 1, 1,
-0.2832607, 0.9510572, -0.7478413, 1, 0, 0, 1, 1,
-0.2772493, -0.3081174, -2.731947, 1, 0, 0, 1, 1,
-0.269499, -0.4725702, -4.210163, 1, 0, 0, 1, 1,
-0.2690581, 0.8674954, -0.4093038, 1, 0, 0, 1, 1,
-0.2685737, 1.565733, 0.4748658, 1, 0, 0, 1, 1,
-0.2598334, 1.434859, -1.147594, 0, 0, 0, 1, 1,
-0.2592332, -1.234079, -4.796427, 0, 0, 0, 1, 1,
-0.2589201, -1.20297, -3.255196, 0, 0, 0, 1, 1,
-0.2455254, 0.279825, -1.424024, 0, 0, 0, 1, 1,
-0.2437008, 1.903611, 0.5237717, 0, 0, 0, 1, 1,
-0.2427813, 0.1978698, -0.1318648, 0, 0, 0, 1, 1,
-0.241496, -0.9818231, -2.632606, 0, 0, 0, 1, 1,
-0.2373548, -0.1387334, -2.265831, 1, 1, 1, 1, 1,
-0.231628, 1.008379, 0.7013562, 1, 1, 1, 1, 1,
-0.2272637, -0.3110222, -1.725392, 1, 1, 1, 1, 1,
-0.2254655, 0.8502401, -0.6616832, 1, 1, 1, 1, 1,
-0.2244386, -0.4200142, -1.698513, 1, 1, 1, 1, 1,
-0.2183331, -0.7555741, -1.991438, 1, 1, 1, 1, 1,
-0.2151848, 2.335819, 0.1315339, 1, 1, 1, 1, 1,
-0.2141966, 0.9435735, -0.8499498, 1, 1, 1, 1, 1,
-0.2137089, 1.448664, -1.333493, 1, 1, 1, 1, 1,
-0.2052625, 1.343472, -0.315698, 1, 1, 1, 1, 1,
-0.1983907, 1.3384, -0.07242934, 1, 1, 1, 1, 1,
-0.1951326, 0.3046998, -0.8264391, 1, 1, 1, 1, 1,
-0.1944848, -0.02812428, -3.74845, 1, 1, 1, 1, 1,
-0.1939668, -0.08456045, -3.544536, 1, 1, 1, 1, 1,
-0.1923531, -1.700242, -2.038859, 1, 1, 1, 1, 1,
-0.190923, 1.684367, -0.6950217, 0, 0, 1, 1, 1,
-0.1902916, 1.368572, 0.127166, 1, 0, 0, 1, 1,
-0.1813965, 0.9100573, -0.6874226, 1, 0, 0, 1, 1,
-0.1755361, 0.4279883, -1.692914, 1, 0, 0, 1, 1,
-0.1746362, 0.1456997, -1.551951, 1, 0, 0, 1, 1,
-0.1719233, 0.8753828, 0.8564638, 1, 0, 0, 1, 1,
-0.1716414, 1.321967, -0.5689661, 0, 0, 0, 1, 1,
-0.1710852, -0.1071307, -0.7769686, 0, 0, 0, 1, 1,
-0.1688486, -0.0005430813, -1.341416, 0, 0, 0, 1, 1,
-0.1682624, 1.431473, -1.01709, 0, 0, 0, 1, 1,
-0.1659353, -1.506865, -3.352442, 0, 0, 0, 1, 1,
-0.1639812, -0.2704051, -3.64654, 0, 0, 0, 1, 1,
-0.1617609, -0.825273, -3.31681, 0, 0, 0, 1, 1,
-0.1615348, 0.6324047, -1.597498, 1, 1, 1, 1, 1,
-0.1601761, 0.801584, -0.9258095, 1, 1, 1, 1, 1,
-0.1588233, -0.2535721, -3.460006, 1, 1, 1, 1, 1,
-0.158099, 0.1402422, -1.179301, 1, 1, 1, 1, 1,
-0.1540575, 0.2024418, 0.2510716, 1, 1, 1, 1, 1,
-0.1462966, -0.3995162, -4.045145, 1, 1, 1, 1, 1,
-0.1451909, -0.881695, -2.503229, 1, 1, 1, 1, 1,
-0.1427965, 0.9532545, 0.09701259, 1, 1, 1, 1, 1,
-0.1406406, -1.207308, -1.894607, 1, 1, 1, 1, 1,
-0.1362825, 0.6072016, 1.358291, 1, 1, 1, 1, 1,
-0.1309746, -0.986931, -2.290174, 1, 1, 1, 1, 1,
-0.1239999, -0.08802693, -0.2045177, 1, 1, 1, 1, 1,
-0.123468, -0.7620494, -2.287683, 1, 1, 1, 1, 1,
-0.1179475, 0.8417561, 0.6655233, 1, 1, 1, 1, 1,
-0.1114248, 0.8840333, -1.172079, 1, 1, 1, 1, 1,
-0.1072709, 2.034623, -1.184994, 0, 0, 1, 1, 1,
-0.1029453, 1.138141, 1.413658, 1, 0, 0, 1, 1,
-0.09685069, 0.4104282, -0.0179281, 1, 0, 0, 1, 1,
-0.0960265, 1.474044, 0.1599485, 1, 0, 0, 1, 1,
-0.09401434, -0.8625092, -4.457345, 1, 0, 0, 1, 1,
-0.09333542, 0.52013, 0.9085233, 1, 0, 0, 1, 1,
-0.09122239, -1.528142, -2.482283, 0, 0, 0, 1, 1,
-0.09101645, 0.4097185, -1.920879, 0, 0, 0, 1, 1,
-0.09048191, -1.288339, -2.742832, 0, 0, 0, 1, 1,
-0.08897208, 1.753023, 0.6668462, 0, 0, 0, 1, 1,
-0.08831084, 0.46425, 0.3311523, 0, 0, 0, 1, 1,
-0.08712109, 1.532185, -0.6338891, 0, 0, 0, 1, 1,
-0.08480511, 1.285841, -0.8019461, 0, 0, 0, 1, 1,
-0.08260803, -0.8384976, -2.90731, 1, 1, 1, 1, 1,
-0.08101463, 1.140155, 0.331424, 1, 1, 1, 1, 1,
-0.07419819, -0.3023102, -2.636593, 1, 1, 1, 1, 1,
-0.06869269, 1.812127, -0.8255531, 1, 1, 1, 1, 1,
-0.067422, -1.512184, -2.411344, 1, 1, 1, 1, 1,
-0.06698394, 0.4855628, 1.588565, 1, 1, 1, 1, 1,
-0.06635901, -1.336834, -2.914425, 1, 1, 1, 1, 1,
-0.06249035, -1.449734, -3.527805, 1, 1, 1, 1, 1,
-0.06107275, -0.7265121, -2.461867, 1, 1, 1, 1, 1,
-0.06031327, -1.763723, -3.152104, 1, 1, 1, 1, 1,
-0.05977646, 0.2896203, -1.74736, 1, 1, 1, 1, 1,
-0.05844145, 0.4335782, -1.070868, 1, 1, 1, 1, 1,
-0.04931879, -0.5187634, -2.024241, 1, 1, 1, 1, 1,
-0.04614966, 1.203847, -1.306013, 1, 1, 1, 1, 1,
-0.04297406, 0.4457687, -0.155308, 1, 1, 1, 1, 1,
-0.04163939, 0.4778777, 1.417163, 0, 0, 1, 1, 1,
-0.04010851, 0.06296761, -0.3576867, 1, 0, 0, 1, 1,
-0.02613378, -1.386683, -2.411257, 1, 0, 0, 1, 1,
-0.02555762, -0.988385, -4.055095, 1, 0, 0, 1, 1,
-0.02349814, -1.520481, -3.279771, 1, 0, 0, 1, 1,
-0.0206646, -0.03363699, -3.26221, 1, 0, 0, 1, 1,
-0.01996087, 1.330354, -0.02196807, 0, 0, 0, 1, 1,
-0.01210287, 1.225041, 0.5347221, 0, 0, 0, 1, 1,
-0.009724553, -1.033405, -3.164097, 0, 0, 0, 1, 1,
-0.009194827, 1.38731, 0.7977646, 0, 0, 0, 1, 1,
-0.0005215897, -1.450536, -3.209722, 0, 0, 0, 1, 1,
0.0008931568, 1.657097, 0.5620695, 0, 0, 0, 1, 1,
0.001311532, -0.5223929, 3.745301, 0, 0, 0, 1, 1,
0.001432457, -0.6139054, 3.611208, 1, 1, 1, 1, 1,
0.002954886, 0.761229, 0.3631731, 1, 1, 1, 1, 1,
0.004189505, -0.8833438, 3.457684, 1, 1, 1, 1, 1,
0.01240676, 0.5184491, 0.7121846, 1, 1, 1, 1, 1,
0.01324275, 0.7735849, -0.5378352, 1, 1, 1, 1, 1,
0.01952703, -1.702949, 3.260219, 1, 1, 1, 1, 1,
0.02396716, -0.6836582, 4.214969, 1, 1, 1, 1, 1,
0.02803404, 0.5950949, 0.985101, 1, 1, 1, 1, 1,
0.02809382, 0.6671054, 2.147774, 1, 1, 1, 1, 1,
0.03345879, 0.1533988, -1.663736, 1, 1, 1, 1, 1,
0.03424355, -0.8006917, 3.357426, 1, 1, 1, 1, 1,
0.03656935, 0.3272972, -2.503319, 1, 1, 1, 1, 1,
0.03863961, 0.4525698, -0.400068, 1, 1, 1, 1, 1,
0.04220055, 0.03736709, 0.5157019, 1, 1, 1, 1, 1,
0.04295925, 0.07581409, 2.390167, 1, 1, 1, 1, 1,
0.04584515, -0.5830975, 1.505946, 0, 0, 1, 1, 1,
0.04892787, 0.1013705, 0.2202778, 1, 0, 0, 1, 1,
0.04910719, -0.1488422, 2.463218, 1, 0, 0, 1, 1,
0.05094174, 0.1125423, 1.747746, 1, 0, 0, 1, 1,
0.05115291, -2.577696, 2.390799, 1, 0, 0, 1, 1,
0.05303686, 1.107255, 0.2552695, 1, 0, 0, 1, 1,
0.05454903, 0.1501449, 1.296551, 0, 0, 0, 1, 1,
0.05512891, 0.4932868, 2.455002, 0, 0, 0, 1, 1,
0.05711141, 0.5519928, -1.338713, 0, 0, 0, 1, 1,
0.06246303, -1.651423, 2.056155, 0, 0, 0, 1, 1,
0.06569924, -2.511306, 1.511929, 0, 0, 0, 1, 1,
0.06697767, 0.7152492, 0.4731517, 0, 0, 0, 1, 1,
0.06764665, 1.04568, 1.405025, 0, 0, 0, 1, 1,
0.06795661, -0.4735727, 3.633348, 1, 1, 1, 1, 1,
0.06868123, -1.627921, 3.938355, 1, 1, 1, 1, 1,
0.07009165, 1.677011, -1.314356, 1, 1, 1, 1, 1,
0.075462, 1.313227, -0.6764774, 1, 1, 1, 1, 1,
0.07571992, 0.08444599, 0.612455, 1, 1, 1, 1, 1,
0.07751963, 0.4233334, 0.5358508, 1, 1, 1, 1, 1,
0.08803006, 0.05535568, 2.073118, 1, 1, 1, 1, 1,
0.08822788, 0.8734741, -0.3677077, 1, 1, 1, 1, 1,
0.09161196, -0.7347669, 3.626851, 1, 1, 1, 1, 1,
0.09466777, -1.351533, 2.891002, 1, 1, 1, 1, 1,
0.09499328, 0.6297577, 0.5981004, 1, 1, 1, 1, 1,
0.09575869, 0.0408327, 0.9749395, 1, 1, 1, 1, 1,
0.1005021, 1.761841, 1.989775, 1, 1, 1, 1, 1,
0.1011733, -0.2982186, 5.039416, 1, 1, 1, 1, 1,
0.1060895, 0.5551947, 0.06357728, 1, 1, 1, 1, 1,
0.1075488, -0.1076127, 3.017575, 0, 0, 1, 1, 1,
0.1125989, -0.1133006, 2.605856, 1, 0, 0, 1, 1,
0.1152413, 0.3698199, 1.169753, 1, 0, 0, 1, 1,
0.1212897, -0.05483263, 3.541038, 1, 0, 0, 1, 1,
0.1216437, -2.032871, 3.333174, 1, 0, 0, 1, 1,
0.1232857, -0.008905595, 2.928538, 1, 0, 0, 1, 1,
0.1249524, -1.389388, 3.240897, 0, 0, 0, 1, 1,
0.1249986, 0.3097536, 2.191871, 0, 0, 0, 1, 1,
0.1252219, 2.398748, -0.9873284, 0, 0, 0, 1, 1,
0.1285275, 0.01737362, 0.8074428, 0, 0, 0, 1, 1,
0.1339594, -0.07605488, 2.730123, 0, 0, 0, 1, 1,
0.1344234, 0.4931635, -0.2727108, 0, 0, 0, 1, 1,
0.140251, -1.319536, 3.301181, 0, 0, 0, 1, 1,
0.1404725, 0.985578, -1.021028, 1, 1, 1, 1, 1,
0.1408655, 0.7113183, 1.637241, 1, 1, 1, 1, 1,
0.1442153, -0.598702, 2.695475, 1, 1, 1, 1, 1,
0.1537045, -1.778258, 3.650276, 1, 1, 1, 1, 1,
0.1568249, 0.6345015, 0.8969062, 1, 1, 1, 1, 1,
0.1573387, -1.895755, 4.561373, 1, 1, 1, 1, 1,
0.1626066, 0.4260219, 2.072836, 1, 1, 1, 1, 1,
0.1634953, 1.028278, -0.3308535, 1, 1, 1, 1, 1,
0.166167, -0.5431033, 2.108089, 1, 1, 1, 1, 1,
0.1667093, -0.2275867, 3.528088, 1, 1, 1, 1, 1,
0.1688153, -1.016698, 1.317346, 1, 1, 1, 1, 1,
0.1707014, 0.7958318, -1.7078, 1, 1, 1, 1, 1,
0.1716129, 0.5987878, 1.425118, 1, 1, 1, 1, 1,
0.1751975, -0.8383784, 3.534053, 1, 1, 1, 1, 1,
0.1757822, 0.3977554, -0.986317, 1, 1, 1, 1, 1,
0.176526, 0.1873659, 0.398513, 0, 0, 1, 1, 1,
0.1784742, 1.981965, 0.6656817, 1, 0, 0, 1, 1,
0.1804906, -0.6662204, 4.018393, 1, 0, 0, 1, 1,
0.1879615, -0.2219079, 1.6737, 1, 0, 0, 1, 1,
0.1979446, 1.52801, 0.547201, 1, 0, 0, 1, 1,
0.2005843, -0.3405113, 2.723558, 1, 0, 0, 1, 1,
0.2032256, 0.2563573, 1.644054, 0, 0, 0, 1, 1,
0.2069793, 0.543868, -0.4636325, 0, 0, 0, 1, 1,
0.207459, -1.868856, 1.836661, 0, 0, 0, 1, 1,
0.2081611, 0.05162384, 0.4719198, 0, 0, 0, 1, 1,
0.2083025, -0.05165153, 2.730829, 0, 0, 0, 1, 1,
0.2096148, 0.1909045, 0.257341, 0, 0, 0, 1, 1,
0.214613, 0.6171376, -0.3472911, 0, 0, 0, 1, 1,
0.2170867, -0.6569018, 2.462432, 1, 1, 1, 1, 1,
0.2172732, 1.829813, -0.1307228, 1, 1, 1, 1, 1,
0.2189024, 1.081696, 0.09760136, 1, 1, 1, 1, 1,
0.2215707, 0.1117735, 0.0890305, 1, 1, 1, 1, 1,
0.2243894, 1.540185, -0.4505318, 1, 1, 1, 1, 1,
0.2244625, -1.134101, 0.7903736, 1, 1, 1, 1, 1,
0.2315315, -0.5481107, 2.870262, 1, 1, 1, 1, 1,
0.2364144, 0.4506585, 0.8959189, 1, 1, 1, 1, 1,
0.2367781, 1.230849, 1.103816, 1, 1, 1, 1, 1,
0.2383921, 0.9588251, -0.7038652, 1, 1, 1, 1, 1,
0.242715, 1.094145, 0.4861284, 1, 1, 1, 1, 1,
0.242883, -1.361536, 2.187973, 1, 1, 1, 1, 1,
0.2441725, 0.01763353, 2.012784, 1, 1, 1, 1, 1,
0.2467888, 0.4397992, 1.04052, 1, 1, 1, 1, 1,
0.2496432, -0.9869899, 1.016329, 1, 1, 1, 1, 1,
0.2533995, 0.01493542, 1.926127, 0, 0, 1, 1, 1,
0.253598, -0.1188615, 0.5062869, 1, 0, 0, 1, 1,
0.2598524, -0.3595404, 4.770638, 1, 0, 0, 1, 1,
0.2630762, -0.09855252, 2.114495, 1, 0, 0, 1, 1,
0.2653387, 0.7148241, -1.193723, 1, 0, 0, 1, 1,
0.2676173, 1.287854, 1.798683, 1, 0, 0, 1, 1,
0.2686218, 0.1821878, 3.19356, 0, 0, 0, 1, 1,
0.2744118, 2.280342, -0.5346565, 0, 0, 0, 1, 1,
0.279585, -0.8318055, 3.714545, 0, 0, 0, 1, 1,
0.2867383, 0.2966363, -0.08680167, 0, 0, 0, 1, 1,
0.2919342, -0.003363542, 2.226243, 0, 0, 0, 1, 1,
0.2922542, -0.3586336, 1.39758, 0, 0, 0, 1, 1,
0.2960317, 0.5010477, 0.1241482, 0, 0, 0, 1, 1,
0.2964274, 1.425982, 0.4839145, 1, 1, 1, 1, 1,
0.2978306, -0.590906, 2.79261, 1, 1, 1, 1, 1,
0.2981702, 0.5066282, -1.178995, 1, 1, 1, 1, 1,
0.3006019, -0.3966791, 4.402313, 1, 1, 1, 1, 1,
0.3018342, 0.3611493, -0.2142122, 1, 1, 1, 1, 1,
0.3020854, -0.8588833, 3.569311, 1, 1, 1, 1, 1,
0.3089254, 1.111329, -0.5735193, 1, 1, 1, 1, 1,
0.3099491, 3.021141, 0.3375842, 1, 1, 1, 1, 1,
0.3100041, 0.3468755, 1.551454, 1, 1, 1, 1, 1,
0.3106776, 1.146622, 0.9549958, 1, 1, 1, 1, 1,
0.3114333, -0.1781719, 1.589138, 1, 1, 1, 1, 1,
0.3145109, -1.045504, 2.938623, 1, 1, 1, 1, 1,
0.3147173, -0.7681699, 3.291626, 1, 1, 1, 1, 1,
0.3167371, 1.446354, -0.3284746, 1, 1, 1, 1, 1,
0.3180811, 1.537219, -0.6908479, 1, 1, 1, 1, 1,
0.3243835, -0.1498581, 1.705623, 0, 0, 1, 1, 1,
0.3284838, 1.104086, 1.16356, 1, 0, 0, 1, 1,
0.3325023, -1.264871, 3.11583, 1, 0, 0, 1, 1,
0.3325783, -0.1263416, 1.499028, 1, 0, 0, 1, 1,
0.3335492, -0.07443975, 1.940083, 1, 0, 0, 1, 1,
0.3342308, -0.7516384, 2.785588, 1, 0, 0, 1, 1,
0.3371848, -0.2497558, 0.9389785, 0, 0, 0, 1, 1,
0.339604, 0.4721461, 1.400897, 0, 0, 0, 1, 1,
0.3419816, 0.8530986, 0.5802054, 0, 0, 0, 1, 1,
0.344639, -0.06236067, 2.027522, 0, 0, 0, 1, 1,
0.345956, -0.3525985, 1.94773, 0, 0, 0, 1, 1,
0.3577089, -0.9732392, 2.72546, 0, 0, 0, 1, 1,
0.36114, 1.035256, -2.891707, 0, 0, 0, 1, 1,
0.3716207, -0.3350898, 3.235457, 1, 1, 1, 1, 1,
0.3732888, -2.070286, 3.402914, 1, 1, 1, 1, 1,
0.3736292, -0.5365468, 4.63324, 1, 1, 1, 1, 1,
0.3750472, 1.003259, 0.9162577, 1, 1, 1, 1, 1,
0.3751737, -0.0190214, 2.188434, 1, 1, 1, 1, 1,
0.3754516, 0.3880233, 1.261497, 1, 1, 1, 1, 1,
0.3755487, -0.6701654, 4.885416, 1, 1, 1, 1, 1,
0.3811604, -0.698677, 2.955847, 1, 1, 1, 1, 1,
0.3850905, 0.1641623, 0.8174242, 1, 1, 1, 1, 1,
0.3862338, 0.9843717, 0.4770017, 1, 1, 1, 1, 1,
0.3935376, 0.6148331, 0.3303962, 1, 1, 1, 1, 1,
0.394008, -0.2683436, 2.637117, 1, 1, 1, 1, 1,
0.3957917, 0.6367904, 0.135448, 1, 1, 1, 1, 1,
0.4000457, -0.1539507, 1.647907, 1, 1, 1, 1, 1,
0.4009356, -0.2311202, 1.928914, 1, 1, 1, 1, 1,
0.4057603, 1.331524, 0.7622119, 0, 0, 1, 1, 1,
0.4059949, -0.7529994, 3.183809, 1, 0, 0, 1, 1,
0.4066296, 0.4866035, -0.2911762, 1, 0, 0, 1, 1,
0.4071982, 1.972793, -0.09349785, 1, 0, 0, 1, 1,
0.4114689, -0.2920974, 3.46697, 1, 0, 0, 1, 1,
0.4138227, 1.25351, -1.385238, 1, 0, 0, 1, 1,
0.4163437, 0.8311457, 0.02561785, 0, 0, 0, 1, 1,
0.4165693, -1.322655, 2.554209, 0, 0, 0, 1, 1,
0.4204523, -0.07919244, 2.082944, 0, 0, 0, 1, 1,
0.421532, 0.5748048, 0.2515457, 0, 0, 0, 1, 1,
0.4224586, -0.06819987, 4.15025, 0, 0, 0, 1, 1,
0.4314265, 0.6458303, 1.361111, 0, 0, 0, 1, 1,
0.4322702, -2.245765, 4.097566, 0, 0, 0, 1, 1,
0.4342442, -0.2533287, 4.143225, 1, 1, 1, 1, 1,
0.4345494, 0.1802554, 1.207266, 1, 1, 1, 1, 1,
0.4368739, 0.7197362, 0.9222579, 1, 1, 1, 1, 1,
0.4378382, -0.4381222, 3.454092, 1, 1, 1, 1, 1,
0.4389189, 0.2608694, 1.484532, 1, 1, 1, 1, 1,
0.4483587, -0.3028749, 3.273039, 1, 1, 1, 1, 1,
0.4504905, -1.016823, 2.186799, 1, 1, 1, 1, 1,
0.4520107, -0.9671827, 2.909693, 1, 1, 1, 1, 1,
0.4535748, 0.40217, -0.06080772, 1, 1, 1, 1, 1,
0.456759, 1.288522, -0.9716756, 1, 1, 1, 1, 1,
0.4630874, -0.7371535, 1.096018, 1, 1, 1, 1, 1,
0.463354, -0.257671, 0.6787835, 1, 1, 1, 1, 1,
0.4647198, -1.328906, 2.23397, 1, 1, 1, 1, 1,
0.4696163, 1.516639, -1.057513, 1, 1, 1, 1, 1,
0.4708258, -0.7728537, 4.11554, 1, 1, 1, 1, 1,
0.474542, -0.8055353, 3.008575, 0, 0, 1, 1, 1,
0.4773382, -1.248072, 3.071994, 1, 0, 0, 1, 1,
0.4787985, -0.3497709, 2.164262, 1, 0, 0, 1, 1,
0.4807211, -0.7278055, 3.57306, 1, 0, 0, 1, 1,
0.4819924, -0.3687636, 3.532556, 1, 0, 0, 1, 1,
0.4830988, 1.232662, -0.5778888, 1, 0, 0, 1, 1,
0.4865497, -2.090499, 1.682446, 0, 0, 0, 1, 1,
0.487494, 0.3544711, 1.932087, 0, 0, 0, 1, 1,
0.4898793, 0.228411, 3.021223, 0, 0, 0, 1, 1,
0.4902835, 1.355268, 1.33193, 0, 0, 0, 1, 1,
0.4911347, 1.461609, -1.211321, 0, 0, 0, 1, 1,
0.4924631, -2.236209, 2.91053, 0, 0, 0, 1, 1,
0.4936564, 1.349803, 1.291303, 0, 0, 0, 1, 1,
0.498554, -1.946234, 2.001918, 1, 1, 1, 1, 1,
0.5026855, -1.380769, 3.22096, 1, 1, 1, 1, 1,
0.5033055, 0.4862784, -0.4725732, 1, 1, 1, 1, 1,
0.503536, 0.1729093, 0.9517876, 1, 1, 1, 1, 1,
0.5134379, 1.962088, -0.9199489, 1, 1, 1, 1, 1,
0.5165751, 0.1905401, 2.375679, 1, 1, 1, 1, 1,
0.5175297, 0.6752566, -0.231164, 1, 1, 1, 1, 1,
0.5220352, 1.442588, -0.8435434, 1, 1, 1, 1, 1,
0.5239638, -0.6307118, 2.074995, 1, 1, 1, 1, 1,
0.5250818, 0.2953278, 0.8657963, 1, 1, 1, 1, 1,
0.5254911, 0.1723341, 0.5346852, 1, 1, 1, 1, 1,
0.5285428, -0.9556968, 2.891271, 1, 1, 1, 1, 1,
0.5320908, -2.121436, 2.373204, 1, 1, 1, 1, 1,
0.534745, -0.3773089, 3.648294, 1, 1, 1, 1, 1,
0.536755, 2.607708, -0.6085292, 1, 1, 1, 1, 1,
0.5387484, 0.4429029, 1.76585, 0, 0, 1, 1, 1,
0.5585105, 1.518163, -0.3488063, 1, 0, 0, 1, 1,
0.5605257, 0.5380159, -0.1014546, 1, 0, 0, 1, 1,
0.5633864, -0.7882352, 3.248757, 1, 0, 0, 1, 1,
0.5667102, -0.2052215, 2.846567, 1, 0, 0, 1, 1,
0.567884, 0.3293011, 1.617708, 1, 0, 0, 1, 1,
0.5724718, -2.270745, 2.333363, 0, 0, 0, 1, 1,
0.5750916, 0.3863775, 0.8010567, 0, 0, 0, 1, 1,
0.5767972, 0.02239443, 1.682895, 0, 0, 0, 1, 1,
0.5769489, -1.582728, 2.961435, 0, 0, 0, 1, 1,
0.5786248, -0.5747355, 1.6307, 0, 0, 0, 1, 1,
0.5808686, 0.6703449, 1.116327, 0, 0, 0, 1, 1,
0.5841735, 1.451553, 0.08716884, 0, 0, 0, 1, 1,
0.5849484, 0.09434173, 0.5304385, 1, 1, 1, 1, 1,
0.5910258, 0.04107619, 0.9032979, 1, 1, 1, 1, 1,
0.5924047, -0.8665221, 2.594971, 1, 1, 1, 1, 1,
0.5928348, -1.174069, 3.918108, 1, 1, 1, 1, 1,
0.595584, 0.8325952, 2.018787, 1, 1, 1, 1, 1,
0.601952, -0.2734543, 2.521203, 1, 1, 1, 1, 1,
0.605531, -0.4741427, 3.792506, 1, 1, 1, 1, 1,
0.6146601, 0.4452132, 0.9260903, 1, 1, 1, 1, 1,
0.6146719, 0.3275116, 0.8632177, 1, 1, 1, 1, 1,
0.6146826, 0.4982491, 0.8684675, 1, 1, 1, 1, 1,
0.6156877, -1.024449, 3.297539, 1, 1, 1, 1, 1,
0.6181388, -1.081561, 2.379611, 1, 1, 1, 1, 1,
0.6231972, -0.7987334, 2.98865, 1, 1, 1, 1, 1,
0.6296226, 0.5005186, 2.686989, 1, 1, 1, 1, 1,
0.6338074, -0.03494108, 1.565491, 1, 1, 1, 1, 1,
0.6371474, 0.6112489, 0.9982693, 0, 0, 1, 1, 1,
0.6384687, -0.03217273, 1.287434, 1, 0, 0, 1, 1,
0.6430187, 0.7647231, -0.4083757, 1, 0, 0, 1, 1,
0.6529241, 0.7152629, 1.40911, 1, 0, 0, 1, 1,
0.6538477, 1.39235, 1.836216, 1, 0, 0, 1, 1,
0.6605458, 0.1785257, 1.547187, 1, 0, 0, 1, 1,
0.6659937, 0.4032115, 1.287304, 0, 0, 0, 1, 1,
0.6666737, -0.04404088, 0.9501251, 0, 0, 0, 1, 1,
0.6719036, -1.189789, 2.080921, 0, 0, 0, 1, 1,
0.6739628, 0.5745233, 1.125475, 0, 0, 0, 1, 1,
0.6764411, 0.128012, -0.1185079, 0, 0, 0, 1, 1,
0.6797277, 0.523674, 3.333943, 0, 0, 0, 1, 1,
0.684508, -0.3500316, 2.915938, 0, 0, 0, 1, 1,
0.6848826, 1.115497, -0.1296534, 1, 1, 1, 1, 1,
0.6925704, 0.3877687, 0.940714, 1, 1, 1, 1, 1,
0.6941155, 0.8393865, 1.068491, 1, 1, 1, 1, 1,
0.6955897, -1.352559, 4.090331, 1, 1, 1, 1, 1,
0.699347, 1.714521, -0.06474382, 1, 1, 1, 1, 1,
0.701259, 0.5123202, -0.9102086, 1, 1, 1, 1, 1,
0.7035904, 0.7916697, 1.692268, 1, 1, 1, 1, 1,
0.7087926, -0.8174782, 3.074723, 1, 1, 1, 1, 1,
0.7111871, 2.334787, 0.6496503, 1, 1, 1, 1, 1,
0.718937, -1.937964, 2.124906, 1, 1, 1, 1, 1,
0.7193772, 0.2192821, 0.9035718, 1, 1, 1, 1, 1,
0.7194548, 0.2509953, 1.146879, 1, 1, 1, 1, 1,
0.7219355, -0.4057654, 2.229877, 1, 1, 1, 1, 1,
0.7232746, 0.5172404, 2.191572, 1, 1, 1, 1, 1,
0.7243268, -0.303481, 2.234565, 1, 1, 1, 1, 1,
0.7245563, 1.945261, 1.725995, 0, 0, 1, 1, 1,
0.7253095, 0.1013136, 1.699806, 1, 0, 0, 1, 1,
0.7254229, 1.391415, -0.8454864, 1, 0, 0, 1, 1,
0.7270243, -0.5506989, 1.752691, 1, 0, 0, 1, 1,
0.7402067, -0.5085846, 2.26131, 1, 0, 0, 1, 1,
0.7406818, -0.7330313, 1.819481, 1, 0, 0, 1, 1,
0.7423902, 0.0298281, 2.291396, 0, 0, 0, 1, 1,
0.7437902, -0.06453807, 1.751218, 0, 0, 0, 1, 1,
0.7493405, 0.7214513, -0.294731, 0, 0, 0, 1, 1,
0.7529933, -0.7083, 2.513562, 0, 0, 0, 1, 1,
0.7550588, 1.10057, 0.1228425, 0, 0, 0, 1, 1,
0.7567061, 0.1341808, 1.205687, 0, 0, 0, 1, 1,
0.7593141, -0.09076735, 1.881298, 0, 0, 0, 1, 1,
0.7618697, -0.2444308, 0.5749683, 1, 1, 1, 1, 1,
0.7625534, 0.7260529, 0.7814594, 1, 1, 1, 1, 1,
0.7637755, 0.2880502, 1.312079, 1, 1, 1, 1, 1,
0.764267, -1.345841, 4.341788, 1, 1, 1, 1, 1,
0.7657212, 1.193583, 1.617234, 1, 1, 1, 1, 1,
0.7670287, 0.983108, 0.6577825, 1, 1, 1, 1, 1,
0.7693942, -1.059788, 2.728152, 1, 1, 1, 1, 1,
0.7739377, -0.6233037, 3.825028, 1, 1, 1, 1, 1,
0.7748931, 0.8632219, 1.324743, 1, 1, 1, 1, 1,
0.7751313, 1.101639, 0.5885705, 1, 1, 1, 1, 1,
0.7751706, 0.1023436, 1.744628, 1, 1, 1, 1, 1,
0.7758064, 1.675171, 1.07908, 1, 1, 1, 1, 1,
0.7795078, 0.03906183, 2.044769, 1, 1, 1, 1, 1,
0.7837273, 0.1881451, 2.368857, 1, 1, 1, 1, 1,
0.7841256, -1.086053, 1.234573, 1, 1, 1, 1, 1,
0.7881112, 1.809813, 1.955338, 0, 0, 1, 1, 1,
0.797101, 1.927515, -0.0005171408, 1, 0, 0, 1, 1,
0.7981244, -1.260942, 1.945513, 1, 0, 0, 1, 1,
0.8001388, 0.8189741, 0.3842083, 1, 0, 0, 1, 1,
0.8041955, 0.06313726, 4.164126, 1, 0, 0, 1, 1,
0.8103836, 1.658289, 1.213952, 1, 0, 0, 1, 1,
0.8186927, 0.5316032, 3.31353, 0, 0, 0, 1, 1,
0.8283784, -0.7834163, 2.238252, 0, 0, 0, 1, 1,
0.8340324, 1.887653, -0.697448, 0, 0, 0, 1, 1,
0.8417411, 0.05597875, 3.432521, 0, 0, 0, 1, 1,
0.8475811, -0.9619032, 0.9611515, 0, 0, 0, 1, 1,
0.8485627, -0.1891365, 0.9516933, 0, 0, 0, 1, 1,
0.8539692, -1.971199, 2.824054, 0, 0, 0, 1, 1,
0.8550289, -0.3427018, 3.641577, 1, 1, 1, 1, 1,
0.8564277, -0.4888213, 1.120866, 1, 1, 1, 1, 1,
0.8649479, 0.1922635, 1.800216, 1, 1, 1, 1, 1,
0.8652305, -0.7773339, 4.055457, 1, 1, 1, 1, 1,
0.869935, -1.418813, 3.063896, 1, 1, 1, 1, 1,
0.8742095, 0.285353, 0.7933862, 1, 1, 1, 1, 1,
0.8757964, 0.5557154, 0.9489102, 1, 1, 1, 1, 1,
0.879838, 1.22229, 1.309734, 1, 1, 1, 1, 1,
0.884225, -1.314992, 2.552845, 1, 1, 1, 1, 1,
0.8882042, -0.4847484, 1.239274, 1, 1, 1, 1, 1,
0.8893605, 0.5988737, 2.028249, 1, 1, 1, 1, 1,
0.8897595, -0.4981062, 0.7989643, 1, 1, 1, 1, 1,
0.8900395, -0.4548354, 2.58933, 1, 1, 1, 1, 1,
0.8923466, -0.0146497, 0.8998088, 1, 1, 1, 1, 1,
0.8930666, 0.1978411, -0.2788049, 1, 1, 1, 1, 1,
0.8950348, 0.5316761, 2.001322, 0, 0, 1, 1, 1,
0.8980027, 0.7469628, 2.254099, 1, 0, 0, 1, 1,
0.90033, -0.704758, 2.236414, 1, 0, 0, 1, 1,
0.9103599, -0.07727899, 0.2844998, 1, 0, 0, 1, 1,
0.9168983, -0.06273455, 2.880408, 1, 0, 0, 1, 1,
0.9173201, -0.699192, 1.89073, 1, 0, 0, 1, 1,
0.9211077, 0.6709626, 0.7351316, 0, 0, 0, 1, 1,
0.9215453, 1.412856, 0.8582121, 0, 0, 0, 1, 1,
0.922461, 1.41962, 0.9079989, 0, 0, 0, 1, 1,
0.9342813, 2.015614, -0.3681981, 0, 0, 0, 1, 1,
0.9475113, -0.5436587, 2.688333, 0, 0, 0, 1, 1,
0.9481097, 0.1593933, 2.636564, 0, 0, 0, 1, 1,
0.9532638, 0.05255106, 3.960032, 0, 0, 0, 1, 1,
0.9594015, -0.8632311, 0.8714355, 1, 1, 1, 1, 1,
0.9598489, 0.3276491, 1.104961, 1, 1, 1, 1, 1,
0.9614359, 0.6494448, 2.291567, 1, 1, 1, 1, 1,
0.9645191, 1.117087, 0.256327, 1, 1, 1, 1, 1,
0.9687313, 0.3206608, 1.148518, 1, 1, 1, 1, 1,
0.9691715, 0.5865594, -0.2277056, 1, 1, 1, 1, 1,
0.9775033, -0.7139429, 2.708923, 1, 1, 1, 1, 1,
0.9787344, -0.451139, 2.753442, 1, 1, 1, 1, 1,
0.9810848, 0.3855608, 1.285728, 1, 1, 1, 1, 1,
0.982084, -1.432649, 3.097282, 1, 1, 1, 1, 1,
0.9895936, -0.8761244, 2.116232, 1, 1, 1, 1, 1,
0.9898501, 0.7061302, 0.6943501, 1, 1, 1, 1, 1,
0.993412, -0.4166828, 0.4034754, 1, 1, 1, 1, 1,
0.9967841, 0.7358624, 1.906473, 1, 1, 1, 1, 1,
0.9996798, 0.1065245, 0.04184452, 1, 1, 1, 1, 1,
1.000808, -0.3158089, 1.85014, 0, 0, 1, 1, 1,
1.004108, -1.095745, 3.016243, 1, 0, 0, 1, 1,
1.004714, -1.293505, 1.522176, 1, 0, 0, 1, 1,
1.005549, 1.202651, 1.003973, 1, 0, 0, 1, 1,
1.010459, -1.176323, 1.823277, 1, 0, 0, 1, 1,
1.018364, -0.576944, 2.082105, 1, 0, 0, 1, 1,
1.019396, -0.9730842, 2.954928, 0, 0, 0, 1, 1,
1.026794, 0.2856242, 1.450032, 0, 0, 0, 1, 1,
1.027381, -0.07847971, -0.7743965, 0, 0, 0, 1, 1,
1.027881, -0.2721668, 2.703519, 0, 0, 0, 1, 1,
1.028725, 0.1658107, 1.169333, 0, 0, 0, 1, 1,
1.033722, 0.2623804, 1.864977, 0, 0, 0, 1, 1,
1.053003, -0.1261393, 1.270934, 0, 0, 0, 1, 1,
1.053238, -0.5660654, 3.061181, 1, 1, 1, 1, 1,
1.053367, 0.657154, 1.094405, 1, 1, 1, 1, 1,
1.056482, -0.6531249, 1.808055, 1, 1, 1, 1, 1,
1.062415, -0.1488746, 1.345847, 1, 1, 1, 1, 1,
1.065652, -1.108535, 1.900117, 1, 1, 1, 1, 1,
1.075528, -0.3574052, 0.004863268, 1, 1, 1, 1, 1,
1.078987, -0.2436162, 2.549478, 1, 1, 1, 1, 1,
1.079767, 0.4609091, 0.4507416, 1, 1, 1, 1, 1,
1.083816, 0.5364712, -0.7742128, 1, 1, 1, 1, 1,
1.089334, -0.3329334, 1.524087, 1, 1, 1, 1, 1,
1.089531, 1.426107, 0.5395717, 1, 1, 1, 1, 1,
1.107252, 0.6449441, 1.441553, 1, 1, 1, 1, 1,
1.112359, -0.758638, 1.777577, 1, 1, 1, 1, 1,
1.136851, -1.972996, 1.577318, 1, 1, 1, 1, 1,
1.138979, -1.008253, 2.256501, 1, 1, 1, 1, 1,
1.146449, -3.013917, 2.785491, 0, 0, 1, 1, 1,
1.147226, 0.02557198, -0.1320772, 1, 0, 0, 1, 1,
1.147243, 0.7885298, 0.2293263, 1, 0, 0, 1, 1,
1.151126, -0.2587337, 0.3097518, 1, 0, 0, 1, 1,
1.159067, -1.460063, 3.257004, 1, 0, 0, 1, 1,
1.163653, 1.185196, 0.9852704, 1, 0, 0, 1, 1,
1.178294, 0.7685713, 2.296225, 0, 0, 0, 1, 1,
1.178378, 0.1574644, 0.553977, 0, 0, 0, 1, 1,
1.18075, 1.200604, 0.2762586, 0, 0, 0, 1, 1,
1.181728, -0.9308167, 1.714501, 0, 0, 0, 1, 1,
1.183869, -1.125622, 2.029203, 0, 0, 0, 1, 1,
1.192877, -0.4130205, 1.065484, 0, 0, 0, 1, 1,
1.196443, 0.009728556, 3.457539, 0, 0, 0, 1, 1,
1.204347, 0.2626144, 1.330152, 1, 1, 1, 1, 1,
1.207273, -1.822061, 4.420918, 1, 1, 1, 1, 1,
1.209495, 0.00477398, 1.324006, 1, 1, 1, 1, 1,
1.212182, -2.210377, 2.384708, 1, 1, 1, 1, 1,
1.213029, 1.626588, 1.231907, 1, 1, 1, 1, 1,
1.24253, -0.03323525, 2.592026, 1, 1, 1, 1, 1,
1.253028, 0.3554046, -0.17506, 1, 1, 1, 1, 1,
1.268231, 0.2559382, 1.447194, 1, 1, 1, 1, 1,
1.271124, 1.31246, 0.844315, 1, 1, 1, 1, 1,
1.297794, 1.789959, 0.8954316, 1, 1, 1, 1, 1,
1.304825, 0.9710017, 0.9195467, 1, 1, 1, 1, 1,
1.306021, -0.03751671, 3.51072, 1, 1, 1, 1, 1,
1.313372, -0.6329716, 3.561065, 1, 1, 1, 1, 1,
1.316181, -0.6261988, 1.981936, 1, 1, 1, 1, 1,
1.316594, 1.620679, -0.3965168, 1, 1, 1, 1, 1,
1.317204, -0.8271332, -0.4089794, 0, 0, 1, 1, 1,
1.320429, 1.31409, 2.314563, 1, 0, 0, 1, 1,
1.340767, 0.0667022, 1.539957, 1, 0, 0, 1, 1,
1.341829, 0.08221029, 0.8166589, 1, 0, 0, 1, 1,
1.343959, 0.06331656, 1.159371, 1, 0, 0, 1, 1,
1.348754, 0.5206459, 3.873856, 1, 0, 0, 1, 1,
1.354736, 1.339208, 0.3322671, 0, 0, 0, 1, 1,
1.362204, 1.16371, 0.9255831, 0, 0, 0, 1, 1,
1.367979, -1.23286, 2.968637, 0, 0, 0, 1, 1,
1.375541, 0.6657091, 0.05565405, 0, 0, 0, 1, 1,
1.375697, 0.2042008, 0.5143271, 0, 0, 0, 1, 1,
1.377684, -2.353802, 1.027225, 0, 0, 0, 1, 1,
1.384661, -0.9045588, 3.082631, 0, 0, 0, 1, 1,
1.393622, -0.7612748, 2.49834, 1, 1, 1, 1, 1,
1.394735, -0.1421549, 0.9448404, 1, 1, 1, 1, 1,
1.395459, -0.490214, 0.726546, 1, 1, 1, 1, 1,
1.406113, -1.893767, 2.445409, 1, 1, 1, 1, 1,
1.407783, 0.9740326, 0.4275245, 1, 1, 1, 1, 1,
1.416871, 0.1303922, 2.467218, 1, 1, 1, 1, 1,
1.423709, -1.508334, 2.823274, 1, 1, 1, 1, 1,
1.434348, -0.01360022, 1.804744, 1, 1, 1, 1, 1,
1.435443, -1.138047, 1.696632, 1, 1, 1, 1, 1,
1.440309, -0.1859569, 2.080919, 1, 1, 1, 1, 1,
1.446646, 0.04344166, 2.189296, 1, 1, 1, 1, 1,
1.454364, 0.8097832, 1.237562, 1, 1, 1, 1, 1,
1.456319, 1.090245, 0.3313708, 1, 1, 1, 1, 1,
1.465883, -0.6635956, 1.66468, 1, 1, 1, 1, 1,
1.466239, 0.601782, -0.08033826, 1, 1, 1, 1, 1,
1.473529, 1.889519, 1.688993, 0, 0, 1, 1, 1,
1.475684, -2.48038, 3.158109, 1, 0, 0, 1, 1,
1.478053, 1.784139, -0.03256376, 1, 0, 0, 1, 1,
1.482658, 1.054538, 0.5951641, 1, 0, 0, 1, 1,
1.492423, 1.652506, -1.23533, 1, 0, 0, 1, 1,
1.494324, -0.9205148, 2.242372, 1, 0, 0, 1, 1,
1.4954, 0.1331177, 2.261036, 0, 0, 0, 1, 1,
1.498642, 0.2850315, 0.7284793, 0, 0, 0, 1, 1,
1.510772, 0.001429346, 4.119621, 0, 0, 0, 1, 1,
1.52071, 0.595729, 1.26755, 0, 0, 0, 1, 1,
1.529616, 0.4446329, 0.5810847, 0, 0, 0, 1, 1,
1.533508, 0.3648201, 0.2904653, 0, 0, 0, 1, 1,
1.53679, 1.223494, 0.375701, 0, 0, 0, 1, 1,
1.545179, 1.155706, 1.173296, 1, 1, 1, 1, 1,
1.562659, 0.9885616, 1.277618, 1, 1, 1, 1, 1,
1.579481, -0.6027378, 3.084476, 1, 1, 1, 1, 1,
1.604975, 0.542514, 2.049767, 1, 1, 1, 1, 1,
1.611206, -0.8534704, 1.782632, 1, 1, 1, 1, 1,
1.615269, -0.2639822, 1.480511, 1, 1, 1, 1, 1,
1.623056, 0.957807, 0.3004451, 1, 1, 1, 1, 1,
1.6434, -0.07189237, 1.356824, 1, 1, 1, 1, 1,
1.647473, 0.6947168, 0.7454423, 1, 1, 1, 1, 1,
1.662212, -1.882761, 1.414828, 1, 1, 1, 1, 1,
1.6749, -0.2937204, 2.486544, 1, 1, 1, 1, 1,
1.675292, 0.5281306, 1.499575, 1, 1, 1, 1, 1,
1.678963, 0.5370165, 0.5953339, 1, 1, 1, 1, 1,
1.70779, 0.7491202, 0.2490672, 1, 1, 1, 1, 1,
1.710046, -0.03131511, 1.244098, 1, 1, 1, 1, 1,
1.730399, 0.6140546, 1.217875, 0, 0, 1, 1, 1,
1.747426, -0.2777888, 3.654984, 1, 0, 0, 1, 1,
1.75002, 0.2369528, 1.526735, 1, 0, 0, 1, 1,
1.758728, 0.132413, 2.893771, 1, 0, 0, 1, 1,
1.762259, -1.14012, 2.53155, 1, 0, 0, 1, 1,
1.779194, 0.4401797, 2.154705, 1, 0, 0, 1, 1,
1.780743, -1.804141, 1.85192, 0, 0, 0, 1, 1,
1.803011, -1.905544, 2.156694, 0, 0, 0, 1, 1,
1.817565, 0.407271, 1.042791, 0, 0, 0, 1, 1,
1.825437, 0.3850628, 1.060895, 0, 0, 0, 1, 1,
1.825636, -1.078624, 0.8656269, 0, 0, 0, 1, 1,
1.837901, -0.3261535, 2.384064, 0, 0, 0, 1, 1,
1.841941, 0.4471121, 1.40824, 0, 0, 0, 1, 1,
1.853148, 2.614716, 0.1305838, 1, 1, 1, 1, 1,
1.855333, -0.9609438, 2.295492, 1, 1, 1, 1, 1,
1.874656, -1.609194, 2.258871, 1, 1, 1, 1, 1,
1.885477, -0.8169563, 2.026369, 1, 1, 1, 1, 1,
1.895402, 0.2640678, 0.3356709, 1, 1, 1, 1, 1,
1.923677, 0.4602038, 1.662113, 1, 1, 1, 1, 1,
1.927011, 1.096138, 1.153073, 1, 1, 1, 1, 1,
1.927274, 0.9007367, 1.05174, 1, 1, 1, 1, 1,
1.944454, -3.226127, 2.834159, 1, 1, 1, 1, 1,
1.947056, -1.489632, 1.457721, 1, 1, 1, 1, 1,
1.982682, 1.359265, 2.452922, 1, 1, 1, 1, 1,
2.004332, 1.417004, 1.624021, 1, 1, 1, 1, 1,
2.019454, 0.4352771, 3.084429, 1, 1, 1, 1, 1,
2.025453, 0.960203, 1.425567, 1, 1, 1, 1, 1,
2.026989, 0.9660251, 1.373539, 1, 1, 1, 1, 1,
2.030158, -0.2043379, 0.4492503, 0, 0, 1, 1, 1,
2.043209, -0.2293388, 1.845898, 1, 0, 0, 1, 1,
2.057758, -0.5326704, 0.9222782, 1, 0, 0, 1, 1,
2.069079, 1.370106, -0.2096422, 1, 0, 0, 1, 1,
2.079422, -0.7645723, 4.368639, 1, 0, 0, 1, 1,
2.086039, 0.9144741, 0.3653065, 1, 0, 0, 1, 1,
2.122808, -0.5893557, 1.461174, 0, 0, 0, 1, 1,
2.176131, 1.513557, -0.7175081, 0, 0, 0, 1, 1,
2.253205, 1.267981, -0.2572254, 0, 0, 0, 1, 1,
2.254565, -0.1608131, 0.5969456, 0, 0, 0, 1, 1,
2.267619, 0.8887366, 0.9499471, 0, 0, 0, 1, 1,
2.269573, 0.5788522, -0.1421151, 0, 0, 0, 1, 1,
2.549127, -0.6911697, -0.2626229, 0, 0, 0, 1, 1,
2.574816, 0.5621009, 3.062403, 1, 1, 1, 1, 1,
2.593693, -1.473544, 2.285725, 1, 1, 1, 1, 1,
2.673014, 0.5843054, 1.363584, 1, 1, 1, 1, 1,
2.73992, -0.2535841, 2.289812, 1, 1, 1, 1, 1,
3.36714, -1.26126, -0.07341654, 1, 1, 1, 1, 1,
3.744504, -0.2204111, 3.357542, 1, 1, 1, 1, 1,
3.973698, -0.4623958, 1.381236, 1, 1, 1, 1, 1
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
var radius = 9.648001;
var distance = 33.8882;
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
mvMatrix.translate( -0.2847896, 0.1677849, 0.07580161 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.8882);
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