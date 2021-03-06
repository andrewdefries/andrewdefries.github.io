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
-3.195779, 0.1013886, -2.2949, 1, 0, 0, 1,
-3.189967, 1.338919, -1.687771, 1, 0.007843138, 0, 1,
-2.937441, -1.188742, -1.862823, 1, 0.01176471, 0, 1,
-2.817322, 0.398348, -2.562784, 1, 0.01960784, 0, 1,
-2.708874, -0.06346177, 0.4109454, 1, 0.02352941, 0, 1,
-2.470392, -1.748976, -0.05212289, 1, 0.03137255, 0, 1,
-2.427931, 0.8170802, -2.206866, 1, 0.03529412, 0, 1,
-2.419644, 0.2173907, -3.004494, 1, 0.04313726, 0, 1,
-2.418338, -0.6696204, -0.6566846, 1, 0.04705882, 0, 1,
-2.338709, -0.8788781, -0.4898311, 1, 0.05490196, 0, 1,
-2.324337, -1.245464, -3.253852, 1, 0.05882353, 0, 1,
-2.247034, -1.614661, -3.226365, 1, 0.06666667, 0, 1,
-2.192002, -0.1921199, -1.11434, 1, 0.07058824, 0, 1,
-2.1884, 1.21948, -0.735283, 1, 0.07843138, 0, 1,
-2.178149, 0.6313502, -0.4915352, 1, 0.08235294, 0, 1,
-2.135385, 0.5750583, -0.6078736, 1, 0.09019608, 0, 1,
-2.095114, -0.8519191, -3.450729, 1, 0.09411765, 0, 1,
-2.057278, 0.1120078, -1.951854, 1, 0.1019608, 0, 1,
-2.054925, -0.03126315, -0.8913136, 1, 0.1098039, 0, 1,
-2.051676, 0.9831881, -2.99133, 1, 0.1137255, 0, 1,
-2.017219, -1.385499, -1.987988, 1, 0.1215686, 0, 1,
-2.013741, -1.417176, -1.798185, 1, 0.1254902, 0, 1,
-2.002015, -0.8900134, -2.935997, 1, 0.1333333, 0, 1,
-1.993401, 0.4163588, -2.275526, 1, 0.1372549, 0, 1,
-1.975361, 0.6659915, -0.6141619, 1, 0.145098, 0, 1,
-1.970132, 0.9050773, 0.03082914, 1, 0.1490196, 0, 1,
-1.938008, -0.5457668, -3.3393, 1, 0.1568628, 0, 1,
-1.931372, -0.5591496, -2.618377, 1, 0.1607843, 0, 1,
-1.93066, 0.4484751, -1.30693, 1, 0.1686275, 0, 1,
-1.929974, -1.503436, -1.366536, 1, 0.172549, 0, 1,
-1.87428, -0.7843465, -3.227019, 1, 0.1803922, 0, 1,
-1.874024, -0.6328601, -2.517251, 1, 0.1843137, 0, 1,
-1.800415, -0.2872548, -0.7127326, 1, 0.1921569, 0, 1,
-1.79942, -0.2915855, -0.3774045, 1, 0.1960784, 0, 1,
-1.774448, 0.8691343, -1.140389, 1, 0.2039216, 0, 1,
-1.770644, 0.7808605, -0.06723939, 1, 0.2117647, 0, 1,
-1.708151, -1.731681, -2.611461, 1, 0.2156863, 0, 1,
-1.681776, -0.3186092, -2.159883, 1, 0.2235294, 0, 1,
-1.677276, 0.1080369, -0.3492797, 1, 0.227451, 0, 1,
-1.672888, -0.3527163, -2.195788, 1, 0.2352941, 0, 1,
-1.665425, -0.2032602, -0.6597421, 1, 0.2392157, 0, 1,
-1.663475, 0.6941034, -1.178828, 1, 0.2470588, 0, 1,
-1.661918, 1.025313, 0.1004989, 1, 0.2509804, 0, 1,
-1.661917, 1.009255, -0.802358, 1, 0.2588235, 0, 1,
-1.640328, 0.1159159, -1.081037, 1, 0.2627451, 0, 1,
-1.634264, -0.3649461, 1.22455, 1, 0.2705882, 0, 1,
-1.632594, 0.8553415, -0.7128034, 1, 0.2745098, 0, 1,
-1.627893, 0.1549312, -2.165334, 1, 0.282353, 0, 1,
-1.623344, 1.862007, -2.173467, 1, 0.2862745, 0, 1,
-1.622087, -1.503212, -2.543958, 1, 0.2941177, 0, 1,
-1.620217, 0.3996964, -0.5881042, 1, 0.3019608, 0, 1,
-1.616928, 0.1777142, -0.01644483, 1, 0.3058824, 0, 1,
-1.616662, 0.7861548, -0.5814198, 1, 0.3137255, 0, 1,
-1.608467, 1.459562, -1.610186, 1, 0.3176471, 0, 1,
-1.604339, 1.315124, -1.072855, 1, 0.3254902, 0, 1,
-1.58859, 1.576989, -0.8352993, 1, 0.3294118, 0, 1,
-1.584167, 0.6787034, -0.3396898, 1, 0.3372549, 0, 1,
-1.578573, 0.7208126, -0.7089303, 1, 0.3411765, 0, 1,
-1.576848, -1.604497, -1.64008, 1, 0.3490196, 0, 1,
-1.575111, 1.102942, -0.4833672, 1, 0.3529412, 0, 1,
-1.574468, 1.317451, -1.151216, 1, 0.3607843, 0, 1,
-1.571608, 0.4223786, -1.462327, 1, 0.3647059, 0, 1,
-1.571454, 0.1921566, -1.446268, 1, 0.372549, 0, 1,
-1.561476, -1.368302, -2.935265, 1, 0.3764706, 0, 1,
-1.542085, -1.738251, -3.089028, 1, 0.3843137, 0, 1,
-1.541317, -0.5164533, -2.326383, 1, 0.3882353, 0, 1,
-1.5354, 0.7862371, 1.407001, 1, 0.3960784, 0, 1,
-1.524785, -1.236509, -1.819665, 1, 0.4039216, 0, 1,
-1.5243, -1.407646, -1.698187, 1, 0.4078431, 0, 1,
-1.492288, 0.9973742, -1.858013, 1, 0.4156863, 0, 1,
-1.48187, 1.209639, -2.285332, 1, 0.4196078, 0, 1,
-1.478042, 0.580203, -0.5266665, 1, 0.427451, 0, 1,
-1.476374, 2.073672, -1.20124, 1, 0.4313726, 0, 1,
-1.466594, -0.7838148, -0.8809822, 1, 0.4392157, 0, 1,
-1.46602, 0.2785838, -0.9000309, 1, 0.4431373, 0, 1,
-1.455503, -2.973591, -1.475339, 1, 0.4509804, 0, 1,
-1.454179, -0.988714, -3.088237, 1, 0.454902, 0, 1,
-1.453443, -0.8744469, -1.58288, 1, 0.4627451, 0, 1,
-1.441772, -0.327046, -0.6659659, 1, 0.4666667, 0, 1,
-1.439606, -0.1672257, -2.052971, 1, 0.4745098, 0, 1,
-1.431857, -2.508966, -1.587173, 1, 0.4784314, 0, 1,
-1.43107, 0.5949486, -0.8742006, 1, 0.4862745, 0, 1,
-1.418508, 0.3422102, -1.182898, 1, 0.4901961, 0, 1,
-1.407525, -0.2946436, -2.188529, 1, 0.4980392, 0, 1,
-1.403224, 0.586631, -2.570056, 1, 0.5058824, 0, 1,
-1.392251, 0.3206027, 0.2102121, 1, 0.509804, 0, 1,
-1.361645, -0.2134408, -3.103428, 1, 0.5176471, 0, 1,
-1.354627, -0.3426696, -2.153567, 1, 0.5215687, 0, 1,
-1.346644, 0.4997205, -1.785571, 1, 0.5294118, 0, 1,
-1.33635, 0.201464, -0.8592275, 1, 0.5333334, 0, 1,
-1.332109, -0.3921078, -2.930151, 1, 0.5411765, 0, 1,
-1.327531, 2.434258, 0.8334916, 1, 0.5450981, 0, 1,
-1.320476, 0.2650848, -0.7883889, 1, 0.5529412, 0, 1,
-1.306335, -0.3466221, -1.035976, 1, 0.5568628, 0, 1,
-1.303993, -0.2653243, -0.2909848, 1, 0.5647059, 0, 1,
-1.297302, -0.2892573, -1.208096, 1, 0.5686275, 0, 1,
-1.295432, -0.8081713, -1.919055, 1, 0.5764706, 0, 1,
-1.275537, 0.7766585, -2.842302, 1, 0.5803922, 0, 1,
-1.264173, 2.370185, -0.4509358, 1, 0.5882353, 0, 1,
-1.259903, 0.8043641, -0.1944915, 1, 0.5921569, 0, 1,
-1.255539, 0.1057704, -1.067212, 1, 0.6, 0, 1,
-1.254513, -1.475388, -2.998095, 1, 0.6078432, 0, 1,
-1.247509, -0.1094665, -0.4352089, 1, 0.6117647, 0, 1,
-1.230566, -1.320919, -2.260383, 1, 0.6196079, 0, 1,
-1.219772, 0.8231101, -0.8577043, 1, 0.6235294, 0, 1,
-1.212319, 0.3831666, -1.196941, 1, 0.6313726, 0, 1,
-1.20386, 0.0806608, -3.425335, 1, 0.6352941, 0, 1,
-1.199394, -0.5273473, -2.991796, 1, 0.6431373, 0, 1,
-1.198951, 0.3160238, -1.908785, 1, 0.6470588, 0, 1,
-1.198049, 0.9102166, -1.946741, 1, 0.654902, 0, 1,
-1.197193, -0.323983, 0.5799829, 1, 0.6588235, 0, 1,
-1.192823, -0.1779504, -1.293736, 1, 0.6666667, 0, 1,
-1.19253, 0.5645664, -2.240862, 1, 0.6705883, 0, 1,
-1.1918, 0.3349534, -1.305293, 1, 0.6784314, 0, 1,
-1.189938, 0.7361696, -1.548541, 1, 0.682353, 0, 1,
-1.180081, 0.1182915, -1.522434, 1, 0.6901961, 0, 1,
-1.174071, -1.585408, -1.587655, 1, 0.6941177, 0, 1,
-1.162237, 0.6549124, -2.313301, 1, 0.7019608, 0, 1,
-1.161833, 0.1467074, -0.7973716, 1, 0.7098039, 0, 1,
-1.157887, 0.1562158, -1.262844, 1, 0.7137255, 0, 1,
-1.147788, 0.546695, -0.08666199, 1, 0.7215686, 0, 1,
-1.141298, 0.392234, 0.5704063, 1, 0.7254902, 0, 1,
-1.139297, -1.117252, -1.40366, 1, 0.7333333, 0, 1,
-1.138395, -1.433914, -3.522686, 1, 0.7372549, 0, 1,
-1.125568, -1.09698, -3.057828, 1, 0.7450981, 0, 1,
-1.117372, -0.31737, -1.381437, 1, 0.7490196, 0, 1,
-1.116138, 1.109063, -0.6694037, 1, 0.7568628, 0, 1,
-1.113183, 2.021857, -3.875748, 1, 0.7607843, 0, 1,
-1.111596, -0.6012422, -1.561895, 1, 0.7686275, 0, 1,
-1.102094, -0.2783618, -2.564532, 1, 0.772549, 0, 1,
-1.10133, 0.07201428, -0.7837392, 1, 0.7803922, 0, 1,
-1.099065, 0.1125387, -1.937226, 1, 0.7843137, 0, 1,
-1.091406, -0.9733969, -2.107885, 1, 0.7921569, 0, 1,
-1.089435, -1.156406, -1.944664, 1, 0.7960784, 0, 1,
-1.075095, -1.205397, -1.324923, 1, 0.8039216, 0, 1,
-1.071336, -1.28932, -1.6681, 1, 0.8117647, 0, 1,
-1.069588, 1.460172, -1.776711, 1, 0.8156863, 0, 1,
-1.065062, 0.794691, -1.528436, 1, 0.8235294, 0, 1,
-1.064408, 0.3400499, -0.8331431, 1, 0.827451, 0, 1,
-1.051516, 0.2142981, -2.426249, 1, 0.8352941, 0, 1,
-1.044499, -0.4567246, -2.85039, 1, 0.8392157, 0, 1,
-1.038086, 1.065063, -0.1639654, 1, 0.8470588, 0, 1,
-1.037576, -0.7735727, -2.353129, 1, 0.8509804, 0, 1,
-1.032472, 0.927415, 1.286434, 1, 0.8588235, 0, 1,
-1.031066, 2.008021, -1.331267, 1, 0.8627451, 0, 1,
-1.021697, -0.1337062, -2.807124, 1, 0.8705882, 0, 1,
-1.017908, -1.789502, -1.59793, 1, 0.8745098, 0, 1,
-1.012212, -0.9119738, -2.276441, 1, 0.8823529, 0, 1,
-1.002111, 1.476216, -1.635139, 1, 0.8862745, 0, 1,
-0.9999989, 0.5206009, -0.9405886, 1, 0.8941177, 0, 1,
-0.9989219, -0.5026672, -2.531298, 1, 0.8980392, 0, 1,
-0.9988325, -0.100606, -1.860569, 1, 0.9058824, 0, 1,
-0.997139, -0.3174479, -0.4262837, 1, 0.9137255, 0, 1,
-0.9857215, 0.9357651, -2.279354, 1, 0.9176471, 0, 1,
-0.9801657, -0.02205345, -1.630831, 1, 0.9254902, 0, 1,
-0.9778477, 0.2793158, -3.771432, 1, 0.9294118, 0, 1,
-0.9767748, -1.363808, -1.734199, 1, 0.9372549, 0, 1,
-0.9744404, 0.04690516, -1.260335, 1, 0.9411765, 0, 1,
-0.9632408, 1.085392, -0.9252535, 1, 0.9490196, 0, 1,
-0.9583144, -0.6391395, -4.040416, 1, 0.9529412, 0, 1,
-0.9525844, -1.51517, -4.427046, 1, 0.9607843, 0, 1,
-0.9492764, -0.09601559, -0.2862968, 1, 0.9647059, 0, 1,
-0.9491683, 1.028485, 0.1477926, 1, 0.972549, 0, 1,
-0.9406863, -0.2287829, -2.190806, 1, 0.9764706, 0, 1,
-0.9370713, 0.9641818, -1.327372, 1, 0.9843137, 0, 1,
-0.9359656, -0.186095, -1.350781, 1, 0.9882353, 0, 1,
-0.9349445, 0.06832273, -0.4240088, 1, 0.9960784, 0, 1,
-0.9319456, 1.027005, 0.7085072, 0.9960784, 1, 0, 1,
-0.9174386, -0.6473155, -2.155525, 0.9921569, 1, 0, 1,
-0.9127695, 0.168652, -1.768119, 0.9843137, 1, 0, 1,
-0.8869262, 0.2143638, -1.959384, 0.9803922, 1, 0, 1,
-0.8865984, 1.222553, -0.06410094, 0.972549, 1, 0, 1,
-0.8832083, -0.02767125, -1.735918, 0.9686275, 1, 0, 1,
-0.8806774, 1.334238, 1.498955, 0.9607843, 1, 0, 1,
-0.8800414, 0.1013049, -0.5930273, 0.9568627, 1, 0, 1,
-0.8778957, -0.04966114, -1.631283, 0.9490196, 1, 0, 1,
-0.874348, -0.4411246, -3.060693, 0.945098, 1, 0, 1,
-0.8697791, 1.751015, -0.3002733, 0.9372549, 1, 0, 1,
-0.868874, 1.126394, -0.3107486, 0.9333333, 1, 0, 1,
-0.8597433, 0.005878051, -2.297674, 0.9254902, 1, 0, 1,
-0.8579018, 1.806209, 0.1314515, 0.9215686, 1, 0, 1,
-0.8548435, -0.5139499, -0.9843579, 0.9137255, 1, 0, 1,
-0.8536158, -0.8359335, -1.8388, 0.9098039, 1, 0, 1,
-0.8465071, 1.071974, -0.4830304, 0.9019608, 1, 0, 1,
-0.8402402, -0.3212852, -0.6574748, 0.8941177, 1, 0, 1,
-0.8337308, 0.2893937, -2.183867, 0.8901961, 1, 0, 1,
-0.829976, -1.672254, -1.530929, 0.8823529, 1, 0, 1,
-0.8248305, -0.03007491, -0.2141473, 0.8784314, 1, 0, 1,
-0.8246416, 0.908685, -0.8829142, 0.8705882, 1, 0, 1,
-0.8218819, -0.3686064, -4.090145, 0.8666667, 1, 0, 1,
-0.821548, -1.464278, -3.429034, 0.8588235, 1, 0, 1,
-0.8215328, -0.5622095, -2.040542, 0.854902, 1, 0, 1,
-0.8195353, -0.0124622, -3.008927, 0.8470588, 1, 0, 1,
-0.8193404, 0.5895328, -0.8778923, 0.8431373, 1, 0, 1,
-0.8026264, 0.5620129, -2.438585, 0.8352941, 1, 0, 1,
-0.7905141, -0.6729559, -2.60499, 0.8313726, 1, 0, 1,
-0.7874495, 1.576291, -1.683766, 0.8235294, 1, 0, 1,
-0.7846516, 0.7706342, 0.2708782, 0.8196079, 1, 0, 1,
-0.7794325, -0.6115463, -0.8203019, 0.8117647, 1, 0, 1,
-0.7784933, -0.2007577, -3.064993, 0.8078431, 1, 0, 1,
-0.7780797, 0.196009, -3.773587, 0.8, 1, 0, 1,
-0.7780732, -0.5123255, -1.564659, 0.7921569, 1, 0, 1,
-0.7775767, 1.429032, 0.6763421, 0.7882353, 1, 0, 1,
-0.7706742, 1.128036, 0.6533704, 0.7803922, 1, 0, 1,
-0.76232, 0.5567433, -0.8241233, 0.7764706, 1, 0, 1,
-0.7555852, 0.2851419, -0.8529433, 0.7686275, 1, 0, 1,
-0.7543401, 0.3281943, -1.484179, 0.7647059, 1, 0, 1,
-0.751639, 0.3039799, -0.8167276, 0.7568628, 1, 0, 1,
-0.751614, -0.06744567, -1.268259, 0.7529412, 1, 0, 1,
-0.7509575, 1.09008, -1.817225, 0.7450981, 1, 0, 1,
-0.7466106, -1.082293, -3.968876, 0.7411765, 1, 0, 1,
-0.746331, -0.3635154, -3.064054, 0.7333333, 1, 0, 1,
-0.7446007, -0.5480209, -1.56215, 0.7294118, 1, 0, 1,
-0.7436783, 0.3146168, -1.35867, 0.7215686, 1, 0, 1,
-0.7392414, -0.3499441, -2.565811, 0.7176471, 1, 0, 1,
-0.7369492, -0.04488563, -2.700157, 0.7098039, 1, 0, 1,
-0.7347516, -0.5578656, -2.184148, 0.7058824, 1, 0, 1,
-0.7332551, 1.064037, -2.27385, 0.6980392, 1, 0, 1,
-0.7285796, -0.2119878, -1.568543, 0.6901961, 1, 0, 1,
-0.7258035, 0.7965993, -0.1909974, 0.6862745, 1, 0, 1,
-0.7248807, -1.512059, -2.846173, 0.6784314, 1, 0, 1,
-0.7233903, -0.5850776, -1.843919, 0.6745098, 1, 0, 1,
-0.720041, -0.372844, -1.814394, 0.6666667, 1, 0, 1,
-0.7154502, -0.9973433, -1.580147, 0.6627451, 1, 0, 1,
-0.7123183, -1.427396, -0.2044361, 0.654902, 1, 0, 1,
-0.7102774, 0.327865, -0.6485757, 0.6509804, 1, 0, 1,
-0.7042031, 0.5935434, -1.31474, 0.6431373, 1, 0, 1,
-0.701189, -1.164787, -3.668557, 0.6392157, 1, 0, 1,
-0.6964536, 0.2704192, -1.438692, 0.6313726, 1, 0, 1,
-0.6931219, -0.2355083, -3.350399, 0.627451, 1, 0, 1,
-0.6816443, -0.7325097, -0.8204653, 0.6196079, 1, 0, 1,
-0.6808913, 2.103616, 0.8457603, 0.6156863, 1, 0, 1,
-0.6790725, -0.4382517, -2.114607, 0.6078432, 1, 0, 1,
-0.6763094, -0.3013421, -1.804571, 0.6039216, 1, 0, 1,
-0.6747185, -0.2654996, -0.3522747, 0.5960785, 1, 0, 1,
-0.6712837, -0.8060917, -1.89647, 0.5882353, 1, 0, 1,
-0.6692718, -1.316884, -2.306861, 0.5843138, 1, 0, 1,
-0.6690482, 1.047307, -1.191301, 0.5764706, 1, 0, 1,
-0.6638702, 0.1619349, -0.9197389, 0.572549, 1, 0, 1,
-0.6586069, -0.3963034, -0.3922718, 0.5647059, 1, 0, 1,
-0.6555513, 1.99344, -1.560238, 0.5607843, 1, 0, 1,
-0.6553702, -0.08395807, -1.347312, 0.5529412, 1, 0, 1,
-0.6525365, -0.2394897, -1.303037, 0.5490196, 1, 0, 1,
-0.650869, -1.221272, -2.209715, 0.5411765, 1, 0, 1,
-0.6467599, 0.1793925, 0.1996776, 0.5372549, 1, 0, 1,
-0.6456316, -1.054585, -2.775357, 0.5294118, 1, 0, 1,
-0.6390772, 0.04331528, -0.2707258, 0.5254902, 1, 0, 1,
-0.633628, -0.8042282, -2.323078, 0.5176471, 1, 0, 1,
-0.6318825, 0.7468085, -2.162206, 0.5137255, 1, 0, 1,
-0.6234326, 2.294051, 0.5230951, 0.5058824, 1, 0, 1,
-0.6224756, -0.9512852, -1.430361, 0.5019608, 1, 0, 1,
-0.619722, 0.9907794, 0.06408642, 0.4941176, 1, 0, 1,
-0.6174948, -0.5105705, -2.848944, 0.4862745, 1, 0, 1,
-0.6150327, 0.3025377, -1.19688, 0.4823529, 1, 0, 1,
-0.6121021, -0.195158, -1.397399, 0.4745098, 1, 0, 1,
-0.6095868, 1.060814, 0.1546796, 0.4705882, 1, 0, 1,
-0.601977, -0.4610547, -1.475034, 0.4627451, 1, 0, 1,
-0.6011636, -0.7215657, -1.489098, 0.4588235, 1, 0, 1,
-0.5988897, -0.06207687, -0.4141666, 0.4509804, 1, 0, 1,
-0.5833427, -0.1762743, -2.964658, 0.4470588, 1, 0, 1,
-0.5792795, 1.384463, -1.937346, 0.4392157, 1, 0, 1,
-0.5792362, 1.469233, -2.2128, 0.4352941, 1, 0, 1,
-0.5781156, -0.06240025, -2.035987, 0.427451, 1, 0, 1,
-0.5741121, -0.1838032, -0.9545581, 0.4235294, 1, 0, 1,
-0.573396, -0.9224163, -3.218775, 0.4156863, 1, 0, 1,
-0.5732667, 0.4192432, -0.1947203, 0.4117647, 1, 0, 1,
-0.5644184, 1.219984, -1.65782, 0.4039216, 1, 0, 1,
-0.5637764, 2.224884, 1.9344, 0.3960784, 1, 0, 1,
-0.562892, -0.9198765, -4.166669, 0.3921569, 1, 0, 1,
-0.5564597, 0.6291056, 0.4994381, 0.3843137, 1, 0, 1,
-0.5557643, 1.66143, 0.3564568, 0.3803922, 1, 0, 1,
-0.5542488, -0.6890824, -2.662412, 0.372549, 1, 0, 1,
-0.5537659, 1.600703, -1.439242, 0.3686275, 1, 0, 1,
-0.5530715, 0.7005607, -0.8756923, 0.3607843, 1, 0, 1,
-0.5507358, 0.1277001, -1.256826, 0.3568628, 1, 0, 1,
-0.5404645, -0.8881393, -1.347303, 0.3490196, 1, 0, 1,
-0.539857, -0.09724206, -1.828928, 0.345098, 1, 0, 1,
-0.537962, 2.14941, 1.618024, 0.3372549, 1, 0, 1,
-0.53365, 0.06266994, -0.332323, 0.3333333, 1, 0, 1,
-0.5286306, 0.6276661, -0.5670767, 0.3254902, 1, 0, 1,
-0.5239804, 0.5890174, 0.3646786, 0.3215686, 1, 0, 1,
-0.5231726, 0.06612175, -0.2586465, 0.3137255, 1, 0, 1,
-0.5174102, 1.430438, -0.9102873, 0.3098039, 1, 0, 1,
-0.509223, 0.4639692, -1.242444, 0.3019608, 1, 0, 1,
-0.5083015, 1.618608, -1.433497, 0.2941177, 1, 0, 1,
-0.5032908, 0.5754474, -1.232447, 0.2901961, 1, 0, 1,
-0.5015395, 0.1991428, -0.9847728, 0.282353, 1, 0, 1,
-0.4969127, -1.017796, -1.425048, 0.2784314, 1, 0, 1,
-0.4959214, 1.172222, 1.100617, 0.2705882, 1, 0, 1,
-0.4883697, -0.2865828, -0.5485941, 0.2666667, 1, 0, 1,
-0.4863763, -1.302008, -4.118045, 0.2588235, 1, 0, 1,
-0.4816852, 0.4481003, -2.309323, 0.254902, 1, 0, 1,
-0.4815283, -1.391631, -3.860794, 0.2470588, 1, 0, 1,
-0.4781742, 0.8777658, -1.111347, 0.2431373, 1, 0, 1,
-0.473774, -0.09408034, -3.359909, 0.2352941, 1, 0, 1,
-0.4670753, 0.8640544, 1.326262, 0.2313726, 1, 0, 1,
-0.4570126, -0.1880389, -0.9079508, 0.2235294, 1, 0, 1,
-0.4566678, 0.08112844, -1.978779, 0.2196078, 1, 0, 1,
-0.4513203, 0.7156992, -1.706536, 0.2117647, 1, 0, 1,
-0.4447594, 1.219908, 0.4379779, 0.2078431, 1, 0, 1,
-0.4413874, -0.6112814, -4.978499, 0.2, 1, 0, 1,
-0.4397386, -0.2583367, -3.52115, 0.1921569, 1, 0, 1,
-0.4395705, 0.441406, 0.2608286, 0.1882353, 1, 0, 1,
-0.4359463, 2.217247, -1.491226, 0.1803922, 1, 0, 1,
-0.4347377, -0.205979, -2.551617, 0.1764706, 1, 0, 1,
-0.4267986, 0.3375876, -0.8631831, 0.1686275, 1, 0, 1,
-0.4234427, -1.638063, -4.647586, 0.1647059, 1, 0, 1,
-0.4212849, -0.08461131, -1.866256, 0.1568628, 1, 0, 1,
-0.417364, 0.7699329, 0.2201119, 0.1529412, 1, 0, 1,
-0.4091827, -1.033775, -3.987222, 0.145098, 1, 0, 1,
-0.4084719, 0.03156226, -1.496446, 0.1411765, 1, 0, 1,
-0.4073585, -0.3269035, -2.79707, 0.1333333, 1, 0, 1,
-0.3981954, -1.415868, -3.029789, 0.1294118, 1, 0, 1,
-0.3960481, -2.192295, -2.0486, 0.1215686, 1, 0, 1,
-0.396034, -0.3062959, -3.569004, 0.1176471, 1, 0, 1,
-0.3954354, 1.282318, -0.9039435, 0.1098039, 1, 0, 1,
-0.3947318, -1.575619, -4.432553, 0.1058824, 1, 0, 1,
-0.3942634, -0.2099715, -1.209737, 0.09803922, 1, 0, 1,
-0.3939469, -0.3102824, -2.885367, 0.09019608, 1, 0, 1,
-0.3916168, -0.9237837, -2.599829, 0.08627451, 1, 0, 1,
-0.3915449, -1.991867, -3.046337, 0.07843138, 1, 0, 1,
-0.3893421, -0.6385465, -3.738349, 0.07450981, 1, 0, 1,
-0.3856605, 0.3016362, -1.18523, 0.06666667, 1, 0, 1,
-0.385236, 1.801273, 0.09813403, 0.0627451, 1, 0, 1,
-0.3835669, 1.642394, -0.9189354, 0.05490196, 1, 0, 1,
-0.3769609, 0.3584509, -0.3844844, 0.05098039, 1, 0, 1,
-0.3758019, -1.914256, -3.904061, 0.04313726, 1, 0, 1,
-0.3752382, -0.1667884, -0.6496624, 0.03921569, 1, 0, 1,
-0.3745696, -1.511159, -3.470347, 0.03137255, 1, 0, 1,
-0.3741898, 0.8134213, -0.3820731, 0.02745098, 1, 0, 1,
-0.3725151, -0.0327638, -2.226109, 0.01960784, 1, 0, 1,
-0.3710373, -0.6667957, -4.203205, 0.01568628, 1, 0, 1,
-0.3575687, 0.2716655, -1.443109, 0.007843138, 1, 0, 1,
-0.354936, 0.01143613, -2.417883, 0.003921569, 1, 0, 1,
-0.352926, -0.2110329, -3.152232, 0, 1, 0.003921569, 1,
-0.3528291, -0.7596819, -2.50717, 0, 1, 0.01176471, 1,
-0.3504842, -1.149412, -2.117901, 0, 1, 0.01568628, 1,
-0.3478768, -0.3570244, -1.443104, 0, 1, 0.02352941, 1,
-0.3375007, 1.723897, 0.7408781, 0, 1, 0.02745098, 1,
-0.3373053, 0.2951718, -2.147965, 0, 1, 0.03529412, 1,
-0.3363906, 0.2497937, -0.01110824, 0, 1, 0.03921569, 1,
-0.3354639, 0.02079291, -3.045253, 0, 1, 0.04705882, 1,
-0.3326672, 2.657734, -1.517014, 0, 1, 0.05098039, 1,
-0.3311478, 0.07733443, -0.4831878, 0, 1, 0.05882353, 1,
-0.3280455, 0.8004598, -1.334567, 0, 1, 0.0627451, 1,
-0.3266144, -0.9169087, -2.484015, 0, 1, 0.07058824, 1,
-0.3263025, 0.6907929, -0.1246054, 0, 1, 0.07450981, 1,
-0.3260153, 1.091601, 0.5213079, 0, 1, 0.08235294, 1,
-0.3225015, 1.389374, 0.3415272, 0, 1, 0.08627451, 1,
-0.3218326, 2.37633, -1.098897, 0, 1, 0.09411765, 1,
-0.3208162, 2.153196, -0.9074131, 0, 1, 0.1019608, 1,
-0.3201377, -1.741818, -2.233464, 0, 1, 0.1058824, 1,
-0.3182258, 1.271905, 1.228342, 0, 1, 0.1137255, 1,
-0.3174314, -2.576582, -2.828859, 0, 1, 0.1176471, 1,
-0.3103787, -0.6970386, -1.960056, 0, 1, 0.1254902, 1,
-0.3099755, -0.4267918, -0.05555398, 0, 1, 0.1294118, 1,
-0.3079632, 1.141266, -0.967308, 0, 1, 0.1372549, 1,
-0.3066179, -1.442642, -2.815001, 0, 1, 0.1411765, 1,
-0.2996013, -0.6719251, -2.445156, 0, 1, 0.1490196, 1,
-0.2984096, -0.7735285, -4.501245, 0, 1, 0.1529412, 1,
-0.2967408, -0.6620284, -2.273212, 0, 1, 0.1607843, 1,
-0.2945088, 1.115093, -0.3721067, 0, 1, 0.1647059, 1,
-0.2926383, -0.873842, -2.485841, 0, 1, 0.172549, 1,
-0.2909656, 0.1266596, 0.5706121, 0, 1, 0.1764706, 1,
-0.2851624, 0.4328397, 0.1081298, 0, 1, 0.1843137, 1,
-0.2756322, 0.4589696, -0.3973482, 0, 1, 0.1882353, 1,
-0.2738095, -1.321014, -3.499887, 0, 1, 0.1960784, 1,
-0.2731788, -0.4926399, -2.389201, 0, 1, 0.2039216, 1,
-0.2668682, -0.4423421, -1.641329, 0, 1, 0.2078431, 1,
-0.264191, 1.093441, 0.2961625, 0, 1, 0.2156863, 1,
-0.2623074, 0.2407673, -1.166237, 0, 1, 0.2196078, 1,
-0.2617826, 2.032721, -0.4006518, 0, 1, 0.227451, 1,
-0.2608393, -1.450853, -0.7835155, 0, 1, 0.2313726, 1,
-0.2576958, 0.07894307, -1.980472, 0, 1, 0.2392157, 1,
-0.2507794, -0.9967365, -2.631463, 0, 1, 0.2431373, 1,
-0.2476521, -1.866645, -3.309993, 0, 1, 0.2509804, 1,
-0.2455067, 0.2850015, -0.9303806, 0, 1, 0.254902, 1,
-0.2452075, -0.2200642, -3.596356, 0, 1, 0.2627451, 1,
-0.2448699, 0.01383161, -0.9502448, 0, 1, 0.2666667, 1,
-0.239654, -1.239672, -2.940296, 0, 1, 0.2745098, 1,
-0.2396214, 0.6294438, 1.220051, 0, 1, 0.2784314, 1,
-0.2389709, 1.695737, 0.1153703, 0, 1, 0.2862745, 1,
-0.2387799, -0.7437353, -2.887765, 0, 1, 0.2901961, 1,
-0.2333753, 0.1829131, 0.4723511, 0, 1, 0.2980392, 1,
-0.2295229, -1.559951, -3.009807, 0, 1, 0.3058824, 1,
-0.2290733, 1.094208, -1.706173, 0, 1, 0.3098039, 1,
-0.2277519, 0.05812246, -2.307866, 0, 1, 0.3176471, 1,
-0.2249759, 1.587369, -0.2736057, 0, 1, 0.3215686, 1,
-0.224547, -0.8825853, -1.319788, 0, 1, 0.3294118, 1,
-0.2218382, -0.1322954, -2.689148, 0, 1, 0.3333333, 1,
-0.2214811, -1.534636, -3.428841, 0, 1, 0.3411765, 1,
-0.2185711, -1.928565, -3.183454, 0, 1, 0.345098, 1,
-0.2149938, 1.278999, 0.568857, 0, 1, 0.3529412, 1,
-0.2146627, 1.121305, -0.7880738, 0, 1, 0.3568628, 1,
-0.2145788, -0.8078139, -1.144578, 0, 1, 0.3647059, 1,
-0.2113228, 0.01412939, -0.5249512, 0, 1, 0.3686275, 1,
-0.2084525, -0.8487948, -3.345799, 0, 1, 0.3764706, 1,
-0.2071325, -0.3431914, -2.324812, 0, 1, 0.3803922, 1,
-0.2008657, 1.516963, -0.3890235, 0, 1, 0.3882353, 1,
-0.1990541, -1.736019, -3.034925, 0, 1, 0.3921569, 1,
-0.1974267, 0.3206028, 0.02065043, 0, 1, 0.4, 1,
-0.1972929, -0.6708279, -2.312102, 0, 1, 0.4078431, 1,
-0.1971476, -0.1667592, -4.077775, 0, 1, 0.4117647, 1,
-0.1969946, -1.349394, -5.089407, 0, 1, 0.4196078, 1,
-0.1961422, -0.8493236, -1.508696, 0, 1, 0.4235294, 1,
-0.1932476, -0.8343555, -4.744488, 0, 1, 0.4313726, 1,
-0.1930143, -1.172119, -4.758099, 0, 1, 0.4352941, 1,
-0.1927624, 0.4029528, -1.147523, 0, 1, 0.4431373, 1,
-0.1878731, 0.5760233, -1.193281, 0, 1, 0.4470588, 1,
-0.1867169, 1.332797, 1.107131, 0, 1, 0.454902, 1,
-0.1820419, 1.550407, 0.8029112, 0, 1, 0.4588235, 1,
-0.1817467, -1.64155, -2.62086, 0, 1, 0.4666667, 1,
-0.1804316, 0.7270173, -1.818461, 0, 1, 0.4705882, 1,
-0.1773882, -0.3877153, -3.625973, 0, 1, 0.4784314, 1,
-0.1754861, -1.487551, -4.056117, 0, 1, 0.4823529, 1,
-0.1745208, 0.4279682, -1.78076, 0, 1, 0.4901961, 1,
-0.1745159, -1.381238, -3.047965, 0, 1, 0.4941176, 1,
-0.1741631, -0.7949908, -3.775229, 0, 1, 0.5019608, 1,
-0.1695279, -0.8154615, -1.514048, 0, 1, 0.509804, 1,
-0.1678316, 0.4221971, 0.7741331, 0, 1, 0.5137255, 1,
-0.1653824, 1.235168, -0.622063, 0, 1, 0.5215687, 1,
-0.1621785, -0.5737675, -1.676721, 0, 1, 0.5254902, 1,
-0.1554931, -0.3090129, -3.967949, 0, 1, 0.5333334, 1,
-0.1553866, 0.4239473, -0.2555734, 0, 1, 0.5372549, 1,
-0.1521471, -1.918464, -3.096662, 0, 1, 0.5450981, 1,
-0.1510644, 0.5968435, -0.8873054, 0, 1, 0.5490196, 1,
-0.1491115, 2.386349, 0.138181, 0, 1, 0.5568628, 1,
-0.1478474, 0.8752911, -3.020692, 0, 1, 0.5607843, 1,
-0.1457178, -0.0471453, 0.006051668, 0, 1, 0.5686275, 1,
-0.141806, 1.545262, 0.8655387, 0, 1, 0.572549, 1,
-0.1410141, -0.9258848, -3.072104, 0, 1, 0.5803922, 1,
-0.1401488, 1.07773, 0.220946, 0, 1, 0.5843138, 1,
-0.1379464, -1.32717, -2.312608, 0, 1, 0.5921569, 1,
-0.1364373, 0.2301344, 0.4839695, 0, 1, 0.5960785, 1,
-0.1358511, 1.55322, 1.327216, 0, 1, 0.6039216, 1,
-0.1340643, -0.5822641, -2.175946, 0, 1, 0.6117647, 1,
-0.1325435, 0.02796327, -1.657417, 0, 1, 0.6156863, 1,
-0.1308467, 0.5752947, 1.00315, 0, 1, 0.6235294, 1,
-0.1288405, 0.7672158, -0.6886967, 0, 1, 0.627451, 1,
-0.1267283, 1.446754, 0.6226571, 0, 1, 0.6352941, 1,
-0.1263932, -1.389646, -2.076534, 0, 1, 0.6392157, 1,
-0.1252494, 0.2255297, -0.1175658, 0, 1, 0.6470588, 1,
-0.1184278, -1.078132, -2.734392, 0, 1, 0.6509804, 1,
-0.1172275, 0.7409816, 1.103631, 0, 1, 0.6588235, 1,
-0.1135848, -0.3120027, -2.421944, 0, 1, 0.6627451, 1,
-0.1114525, 0.201335, -1.431089, 0, 1, 0.6705883, 1,
-0.1107655, 0.7233747, -1.979525, 0, 1, 0.6745098, 1,
-0.1083452, 1.351761, -0.4664868, 0, 1, 0.682353, 1,
-0.1062201, 0.7411655, 0.2869541, 0, 1, 0.6862745, 1,
-0.1027943, 0.6949087, -0.06693241, 0, 1, 0.6941177, 1,
-0.09917275, -1.205569, -3.159168, 0, 1, 0.7019608, 1,
-0.09833588, 0.7919508, 0.04604718, 0, 1, 0.7058824, 1,
-0.0951907, 2.120958, -0.6225488, 0, 1, 0.7137255, 1,
-0.09421762, 0.1410705, -0.04631018, 0, 1, 0.7176471, 1,
-0.08793683, 0.8595396, -0.3293056, 0, 1, 0.7254902, 1,
-0.08499131, -0.7358426, -2.00645, 0, 1, 0.7294118, 1,
-0.08179725, -1.623587, -2.794004, 0, 1, 0.7372549, 1,
-0.08036485, 0.1829158, -0.6139145, 0, 1, 0.7411765, 1,
-0.07841103, 1.315035, 0.2968892, 0, 1, 0.7490196, 1,
-0.07827707, 1.310878, 0.1195545, 0, 1, 0.7529412, 1,
-0.07707448, 0.1136893, -0.7988008, 0, 1, 0.7607843, 1,
-0.07703156, 0.08637472, -0.0651667, 0, 1, 0.7647059, 1,
-0.06729089, -0.8473233, -3.731867, 0, 1, 0.772549, 1,
-0.06094364, 1.150401, 2.207205, 0, 1, 0.7764706, 1,
-0.05856469, -0.2932904, -2.702788, 0, 1, 0.7843137, 1,
-0.05795158, 1.398783, -0.4523515, 0, 1, 0.7882353, 1,
-0.05792588, 0.2972684, -0.3165085, 0, 1, 0.7960784, 1,
-0.05396193, 0.595009, -0.8617398, 0, 1, 0.8039216, 1,
-0.05350447, 0.6621445, 0.6526648, 0, 1, 0.8078431, 1,
-0.05102193, 0.5373244, 1.159083, 0, 1, 0.8156863, 1,
-0.05009105, -0.4657157, -2.504476, 0, 1, 0.8196079, 1,
-0.04516879, 0.8809073, -0.6720563, 0, 1, 0.827451, 1,
-0.04477696, 1.596846, -2.588556, 0, 1, 0.8313726, 1,
-0.04075189, 0.1682303, -0.4289288, 0, 1, 0.8392157, 1,
-0.03307888, -0.8781993, -2.186925, 0, 1, 0.8431373, 1,
-0.03127598, 1.039431, -0.2957016, 0, 1, 0.8509804, 1,
-0.03122876, 0.3431085, 0.01588539, 0, 1, 0.854902, 1,
-0.02594682, -0.3324565, -4.06733, 0, 1, 0.8627451, 1,
-0.02433898, 0.2305271, -0.544116, 0, 1, 0.8666667, 1,
-0.02394943, 1.105371, -0.702952, 0, 1, 0.8745098, 1,
-0.0217275, 0.8785312, 1.157612, 0, 1, 0.8784314, 1,
-0.02096314, -0.2961122, -3.325647, 0, 1, 0.8862745, 1,
-0.02062531, -0.1037835, -1.913504, 0, 1, 0.8901961, 1,
-0.02042426, 1.055913, 1.898574, 0, 1, 0.8980392, 1,
-0.02031976, 0.7545937, -0.7885877, 0, 1, 0.9058824, 1,
-0.01825332, 1.577448, -0.343202, 0, 1, 0.9098039, 1,
-0.01290312, -0.763125, -2.894406, 0, 1, 0.9176471, 1,
-0.01078348, 0.3602382, -0.8990493, 0, 1, 0.9215686, 1,
-0.0076326, 1.25859, 0.1699595, 0, 1, 0.9294118, 1,
-0.006241613, -1.239075, -3.613077, 0, 1, 0.9333333, 1,
-0.0008252195, -0.8137619, -2.776826, 0, 1, 0.9411765, 1,
0.001179005, 0.4598781, -2.263876, 0, 1, 0.945098, 1,
0.00343378, 1.111126, -0.7915087, 0, 1, 0.9529412, 1,
0.004556195, -0.1325657, 3.501417, 0, 1, 0.9568627, 1,
0.00580765, -0.360129, 4.149891, 0, 1, 0.9647059, 1,
0.006175699, 0.2041144, 0.5156071, 0, 1, 0.9686275, 1,
0.006536639, -1.124879, 3.373734, 0, 1, 0.9764706, 1,
0.008564838, 0.6539978, -0.5353997, 0, 1, 0.9803922, 1,
0.01108652, 1.136554, -0.07477915, 0, 1, 0.9882353, 1,
0.01209777, 1.500437, 0.6105457, 0, 1, 0.9921569, 1,
0.01848232, 0.001399469, 0.3179897, 0, 1, 1, 1,
0.01853011, -0.9061972, 2.41672, 0, 0.9921569, 1, 1,
0.02071392, -0.00388223, 1.495162, 0, 0.9882353, 1, 1,
0.02167396, -0.4404546, 2.58517, 0, 0.9803922, 1, 1,
0.02274217, -1.064117, 1.498436, 0, 0.9764706, 1, 1,
0.02616057, 0.1541706, 0.4802348, 0, 0.9686275, 1, 1,
0.02771812, 0.05841255, 0.2805673, 0, 0.9647059, 1, 1,
0.02918879, 0.7768377, -1.183045, 0, 0.9568627, 1, 1,
0.03003371, 1.51176, 0.6659459, 0, 0.9529412, 1, 1,
0.03310468, 1.202834, -0.05221737, 0, 0.945098, 1, 1,
0.0343013, 0.5078052, -1.31855, 0, 0.9411765, 1, 1,
0.03761386, -0.8324811, 3.570599, 0, 0.9333333, 1, 1,
0.03861148, 0.8758329, -2.70266, 0, 0.9294118, 1, 1,
0.04298143, -0.6425692, 3.302727, 0, 0.9215686, 1, 1,
0.04500685, 0.4263014, -1.468907, 0, 0.9176471, 1, 1,
0.04963572, 1.776185, 0.0538991, 0, 0.9098039, 1, 1,
0.05284336, 1.766875, -0.78042, 0, 0.9058824, 1, 1,
0.05501221, -1.987806, 2.279088, 0, 0.8980392, 1, 1,
0.05537998, -0.5326139, 2.454939, 0, 0.8901961, 1, 1,
0.05693882, 0.7657813, 0.385208, 0, 0.8862745, 1, 1,
0.05875285, -0.5605135, 3.955653, 0, 0.8784314, 1, 1,
0.0598686, 0.04024443, 0.6537901, 0, 0.8745098, 1, 1,
0.07041906, -1.014576, 2.333094, 0, 0.8666667, 1, 1,
0.07193549, 2.935909, -0.1131691, 0, 0.8627451, 1, 1,
0.0724685, 0.5268047, 0.8741502, 0, 0.854902, 1, 1,
0.07312736, 0.5028044, 2.839503, 0, 0.8509804, 1, 1,
0.08112657, -0.238713, 2.948191, 0, 0.8431373, 1, 1,
0.0821674, -0.06414814, 3.840495, 0, 0.8392157, 1, 1,
0.08465134, -0.978898, 2.845356, 0, 0.8313726, 1, 1,
0.08674227, -0.4032315, 2.591742, 0, 0.827451, 1, 1,
0.08919192, -0.2500663, 2.870335, 0, 0.8196079, 1, 1,
0.08953904, 1.040848, 0.2867633, 0, 0.8156863, 1, 1,
0.09465799, -1.470611, 2.823396, 0, 0.8078431, 1, 1,
0.09811413, 0.06606288, 0.234834, 0, 0.8039216, 1, 1,
0.09989155, 1.031853, -0.9795709, 0, 0.7960784, 1, 1,
0.1052495, -0.1390458, 3.219892, 0, 0.7882353, 1, 1,
0.1064888, 1.198046, 1.025782, 0, 0.7843137, 1, 1,
0.1068403, -0.3552468, 2.934749, 0, 0.7764706, 1, 1,
0.1104995, -0.8768689, 3.510964, 0, 0.772549, 1, 1,
0.1111817, -0.6044617, 1.74488, 0, 0.7647059, 1, 1,
0.1165069, -0.8837827, 4.604192, 0, 0.7607843, 1, 1,
0.1165428, -0.4447288, 2.117351, 0, 0.7529412, 1, 1,
0.1176309, 2.397998, -1.846916, 0, 0.7490196, 1, 1,
0.1254461, -1.304747, 4.788406, 0, 0.7411765, 1, 1,
0.1281312, 1.401107, -0.7920622, 0, 0.7372549, 1, 1,
0.1282786, 0.1211675, 0.8970637, 0, 0.7294118, 1, 1,
0.1451156, 0.7354785, -0.6585023, 0, 0.7254902, 1, 1,
0.1462697, -0.8629127, 2.247968, 0, 0.7176471, 1, 1,
0.152517, -0.3498017, 3.271502, 0, 0.7137255, 1, 1,
0.1527947, -0.1976015, 3.040154, 0, 0.7058824, 1, 1,
0.1542886, -0.1628646, 3.490752, 0, 0.6980392, 1, 1,
0.1543032, 1.856479, 0.01551632, 0, 0.6941177, 1, 1,
0.1577873, -0.1275959, 1.951277, 0, 0.6862745, 1, 1,
0.1613745, -0.6721412, 2.772019, 0, 0.682353, 1, 1,
0.1743091, 0.5504957, -0.748462, 0, 0.6745098, 1, 1,
0.1769079, -0.4917184, 2.670407, 0, 0.6705883, 1, 1,
0.1783495, -0.1448563, 2.357859, 0, 0.6627451, 1, 1,
0.1784839, 0.7793425, 2.421137, 0, 0.6588235, 1, 1,
0.1794308, 0.5732608, -0.801618, 0, 0.6509804, 1, 1,
0.1797436, -0.9472096, 5.266504, 0, 0.6470588, 1, 1,
0.1824228, 0.4809787, -0.2157858, 0, 0.6392157, 1, 1,
0.18401, 0.3759603, 0.1531904, 0, 0.6352941, 1, 1,
0.1868702, 0.6467462, 0.7179446, 0, 0.627451, 1, 1,
0.1881609, -0.6383485, 2.498518, 0, 0.6235294, 1, 1,
0.1906321, -1.406441, 3.076309, 0, 0.6156863, 1, 1,
0.1919623, 1.485719, 1.699788, 0, 0.6117647, 1, 1,
0.1942178, -0.06268964, 1.645462, 0, 0.6039216, 1, 1,
0.1947277, -1.456284, 3.11899, 0, 0.5960785, 1, 1,
0.2053996, 0.000775681, 2.990241, 0, 0.5921569, 1, 1,
0.2079533, -0.4682812, 1.788053, 0, 0.5843138, 1, 1,
0.2087552, -1.447003, 2.752943, 0, 0.5803922, 1, 1,
0.213185, 1.221941, -0.5639461, 0, 0.572549, 1, 1,
0.2199067, 0.3356358, 0.6429037, 0, 0.5686275, 1, 1,
0.220723, -0.362214, 3.878362, 0, 0.5607843, 1, 1,
0.2229373, -0.7224278, 3.004652, 0, 0.5568628, 1, 1,
0.2236762, 0.1254809, -0.7771735, 0, 0.5490196, 1, 1,
0.2293282, -0.1789527, 2.770638, 0, 0.5450981, 1, 1,
0.2390775, -1.021608, 4.286029, 0, 0.5372549, 1, 1,
0.2401576, 0.6819248, 2.169863, 0, 0.5333334, 1, 1,
0.2441398, 1.505294, 1.40814, 0, 0.5254902, 1, 1,
0.2453979, 0.1151666, 0.2824626, 0, 0.5215687, 1, 1,
0.2454508, 1.663095, 0.3440308, 0, 0.5137255, 1, 1,
0.2483815, 1.211809, -0.8427529, 0, 0.509804, 1, 1,
0.2500307, 0.1445253, 1.397651, 0, 0.5019608, 1, 1,
0.2506615, -0.1887903, 2.680335, 0, 0.4941176, 1, 1,
0.2575683, 1.012492, 1.455493, 0, 0.4901961, 1, 1,
0.2577073, -1.345329, 2.700558, 0, 0.4823529, 1, 1,
0.2584029, -0.6211687, 1.961663, 0, 0.4784314, 1, 1,
0.2602877, -0.2118332, 1.510676, 0, 0.4705882, 1, 1,
0.2604053, 0.898129, -0.4957365, 0, 0.4666667, 1, 1,
0.2625708, 1.899948, 0.210291, 0, 0.4588235, 1, 1,
0.2705272, -0.2682354, 3.065849, 0, 0.454902, 1, 1,
0.2757427, -1.201089, 3.570478, 0, 0.4470588, 1, 1,
0.2769626, -0.02446071, 2.099925, 0, 0.4431373, 1, 1,
0.2771145, -0.518236, 2.336995, 0, 0.4352941, 1, 1,
0.2825633, -0.1031563, 2.360595, 0, 0.4313726, 1, 1,
0.2846905, -0.6692401, 2.557829, 0, 0.4235294, 1, 1,
0.2859649, -1.367175, 4.288752, 0, 0.4196078, 1, 1,
0.2948382, -0.7124504, 2.94769, 0, 0.4117647, 1, 1,
0.2950449, 0.2929433, 0.508897, 0, 0.4078431, 1, 1,
0.2956446, -0.04625615, 1.588136, 0, 0.4, 1, 1,
0.2978358, 0.5827163, 0.2791945, 0, 0.3921569, 1, 1,
0.3037372, -0.3492162, 2.364318, 0, 0.3882353, 1, 1,
0.3049551, -1.514138, 2.414615, 0, 0.3803922, 1, 1,
0.3071981, 0.4186893, 0.8991686, 0, 0.3764706, 1, 1,
0.3100677, -1.81436, 2.106016, 0, 0.3686275, 1, 1,
0.3111901, 0.2365445, 2.67098, 0, 0.3647059, 1, 1,
0.3150438, 1.460267, -1.312681, 0, 0.3568628, 1, 1,
0.3232318, 1.530303, 1.146907, 0, 0.3529412, 1, 1,
0.3285821, 0.9566925, -0.2259273, 0, 0.345098, 1, 1,
0.3288674, 0.3835657, -0.176258, 0, 0.3411765, 1, 1,
0.332784, -0.2995385, 1.821016, 0, 0.3333333, 1, 1,
0.3349496, 0.7679937, 0.1042993, 0, 0.3294118, 1, 1,
0.3357887, 0.8608691, 0.05381712, 0, 0.3215686, 1, 1,
0.3400259, 0.5885648, -0.7941105, 0, 0.3176471, 1, 1,
0.3472088, 1.511443, 0.3341914, 0, 0.3098039, 1, 1,
0.3508089, 0.5711548, 1.316447, 0, 0.3058824, 1, 1,
0.3515739, 0.8069117, 0.1065306, 0, 0.2980392, 1, 1,
0.3600096, -2.758194, 2.982788, 0, 0.2901961, 1, 1,
0.3640102, 1.086152, 1.254509, 0, 0.2862745, 1, 1,
0.3669372, -0.5321467, 0.7849048, 0, 0.2784314, 1, 1,
0.3673471, -0.2343768, 1.643391, 0, 0.2745098, 1, 1,
0.3680983, 1.214288, 0.31616, 0, 0.2666667, 1, 1,
0.3688082, 0.337116, 1.720785, 0, 0.2627451, 1, 1,
0.3690504, -0.8791331, 3.988289, 0, 0.254902, 1, 1,
0.3753071, -0.4652103, 2.730914, 0, 0.2509804, 1, 1,
0.3755414, 1.195867, 0.03523559, 0, 0.2431373, 1, 1,
0.3768597, -0.6676965, 2.231225, 0, 0.2392157, 1, 1,
0.3790264, -1.502478, 3.521118, 0, 0.2313726, 1, 1,
0.3807186, 1.367586, 2.20373, 0, 0.227451, 1, 1,
0.3816015, -0.3933999, 4.981315, 0, 0.2196078, 1, 1,
0.3820592, -0.5462441, 4.188377, 0, 0.2156863, 1, 1,
0.3842533, 0.7090613, 1.046396, 0, 0.2078431, 1, 1,
0.3868797, -0.759995, 2.575566, 0, 0.2039216, 1, 1,
0.3888771, 1.307312, 1.678645, 0, 0.1960784, 1, 1,
0.3954076, 0.4193355, 1.569816, 0, 0.1882353, 1, 1,
0.4022127, 0.1075272, 2.130115, 0, 0.1843137, 1, 1,
0.403711, 0.1220087, 0.7720088, 0, 0.1764706, 1, 1,
0.403976, -2.101536, 4.014666, 0, 0.172549, 1, 1,
0.4044711, -0.5593885, 1.968932, 0, 0.1647059, 1, 1,
0.4093448, -1.301428, 4.706254, 0, 0.1607843, 1, 1,
0.4128644, -0.7661929, 4.112724, 0, 0.1529412, 1, 1,
0.4154001, -1.460407, 4.005217, 0, 0.1490196, 1, 1,
0.416205, -0.3567872, 0.2086751, 0, 0.1411765, 1, 1,
0.4162781, -0.8293502, 2.091055, 0, 0.1372549, 1, 1,
0.4169687, 0.1336272, 1.774521, 0, 0.1294118, 1, 1,
0.4189564, -1.870762, 5.098799, 0, 0.1254902, 1, 1,
0.4191815, 1.030968, -0.5095336, 0, 0.1176471, 1, 1,
0.4192741, -0.8454308, 3.382837, 0, 0.1137255, 1, 1,
0.422005, -0.1678143, 2.307059, 0, 0.1058824, 1, 1,
0.4231815, -0.9008664, 1.557528, 0, 0.09803922, 1, 1,
0.4252546, -0.4600852, 2.646777, 0, 0.09411765, 1, 1,
0.429832, -1.659538, 2.238112, 0, 0.08627451, 1, 1,
0.4318984, -0.4052564, 0.7371019, 0, 0.08235294, 1, 1,
0.444319, 2.589229, -1.588186, 0, 0.07450981, 1, 1,
0.4479035, 0.6891411, 1.58955, 0, 0.07058824, 1, 1,
0.4497918, 0.5962703, 0.09043385, 0, 0.0627451, 1, 1,
0.4561551, 0.08976002, 1.957759, 0, 0.05882353, 1, 1,
0.4688418, 1.489688, -0.4422389, 0, 0.05098039, 1, 1,
0.4689519, 0.1054993, 2.913065, 0, 0.04705882, 1, 1,
0.4695168, -0.2529521, 2.13427, 0, 0.03921569, 1, 1,
0.4701217, 1.909412, 0.08080407, 0, 0.03529412, 1, 1,
0.4704099, -1.305943, 3.378733, 0, 0.02745098, 1, 1,
0.471388, -0.4695152, 1.095251, 0, 0.02352941, 1, 1,
0.4794657, 0.1074896, 1.607041, 0, 0.01568628, 1, 1,
0.4797267, -1.533779, 1.498241, 0, 0.01176471, 1, 1,
0.4800245, -0.2562926, 2.295774, 0, 0.003921569, 1, 1,
0.4809751, 1.871885, -0.4532869, 0.003921569, 0, 1, 1,
0.4813632, 0.4349054, 2.621106, 0.007843138, 0, 1, 1,
0.4817932, 0.2465365, 1.646203, 0.01568628, 0, 1, 1,
0.4852474, 0.5679227, 0.5820512, 0.01960784, 0, 1, 1,
0.486898, 0.7481145, 0.7062156, 0.02745098, 0, 1, 1,
0.4874988, -1.066325, 3.391981, 0.03137255, 0, 1, 1,
0.4892568, 1.738734, -0.1939068, 0.03921569, 0, 1, 1,
0.4895142, 0.6789317, 1.169105, 0.04313726, 0, 1, 1,
0.4898002, 0.9381603, 1.378001, 0.05098039, 0, 1, 1,
0.4926569, -0.0606305, 0.2284052, 0.05490196, 0, 1, 1,
0.501481, -0.9964771, 2.98207, 0.0627451, 0, 1, 1,
0.5039397, -0.02848417, 1.535724, 0.06666667, 0, 1, 1,
0.5092496, 0.2566006, 2.013768, 0.07450981, 0, 1, 1,
0.519522, 0.5406232, -0.2971093, 0.07843138, 0, 1, 1,
0.5211225, -1.353539, 1.897865, 0.08627451, 0, 1, 1,
0.5211623, -0.7789783, 0.9010489, 0.09019608, 0, 1, 1,
0.5247582, -1.409447, 2.975004, 0.09803922, 0, 1, 1,
0.5263398, 1.592463, 0.08212031, 0.1058824, 0, 1, 1,
0.5267161, 1.09129, 0.3817771, 0.1098039, 0, 1, 1,
0.5285908, -1.039292, 1.872523, 0.1176471, 0, 1, 1,
0.5380806, -0.6096781, 1.606511, 0.1215686, 0, 1, 1,
0.5386461, 0.7179164, 0.5124447, 0.1294118, 0, 1, 1,
0.5412736, -1.323631, 4.250264, 0.1333333, 0, 1, 1,
0.54224, -1.851434, 4.131011, 0.1411765, 0, 1, 1,
0.5438132, 0.06453028, 1.570719, 0.145098, 0, 1, 1,
0.5467304, -1.09316, 1.614704, 0.1529412, 0, 1, 1,
0.550252, -0.2567738, 3.085628, 0.1568628, 0, 1, 1,
0.5544273, 1.670336, 0.727726, 0.1647059, 0, 1, 1,
0.5575548, -0.5412566, 3.791504, 0.1686275, 0, 1, 1,
0.5576256, 0.2622792, 2.319694, 0.1764706, 0, 1, 1,
0.5585482, 0.955665, 0.3540892, 0.1803922, 0, 1, 1,
0.5588012, -0.891485, 2.534688, 0.1882353, 0, 1, 1,
0.563167, 0.1907306, 1.145401, 0.1921569, 0, 1, 1,
0.564472, 0.786277, 0.307566, 0.2, 0, 1, 1,
0.5657256, -0.9403995, 3.145128, 0.2078431, 0, 1, 1,
0.5721173, -0.8125436, 2.818978, 0.2117647, 0, 1, 1,
0.5726908, 0.523232, 3.18235, 0.2196078, 0, 1, 1,
0.5753195, -0.2827065, 2.420235, 0.2235294, 0, 1, 1,
0.5803934, 0.9527634, 2.728243, 0.2313726, 0, 1, 1,
0.5920274, 0.237312, 1.225656, 0.2352941, 0, 1, 1,
0.5977442, 2.019549, -0.704968, 0.2431373, 0, 1, 1,
0.5991406, 0.7030414, -0.3835677, 0.2470588, 0, 1, 1,
0.6008305, -1.100484, 2.960551, 0.254902, 0, 1, 1,
0.6015266, 0.4426601, 2.257183, 0.2588235, 0, 1, 1,
0.6026001, -1.483201, 3.09001, 0.2666667, 0, 1, 1,
0.6057134, 0.4320086, 1.936518, 0.2705882, 0, 1, 1,
0.6057584, 1.061016, 2.5567, 0.2784314, 0, 1, 1,
0.6125948, -0.6223196, 3.26883, 0.282353, 0, 1, 1,
0.6152168, -0.8936976, 3.285433, 0.2901961, 0, 1, 1,
0.6176813, -0.5327409, 3.362667, 0.2941177, 0, 1, 1,
0.6183529, 0.4011857, 0.2204507, 0.3019608, 0, 1, 1,
0.6249293, 0.2192245, 2.583231, 0.3098039, 0, 1, 1,
0.6257346, 1.868547, 0.01013877, 0.3137255, 0, 1, 1,
0.6341385, -0.9901827, 2.199271, 0.3215686, 0, 1, 1,
0.6347921, -0.2076563, 1.440046, 0.3254902, 0, 1, 1,
0.638566, -0.6070945, 2.230733, 0.3333333, 0, 1, 1,
0.642166, 1.258562, 1.928965, 0.3372549, 0, 1, 1,
0.6423211, 0.5295463, 0.3526096, 0.345098, 0, 1, 1,
0.6425018, -0.3238376, 3.549175, 0.3490196, 0, 1, 1,
0.6426401, -0.1442327, 1.126131, 0.3568628, 0, 1, 1,
0.6449512, 0.8545746, 0.05170481, 0.3607843, 0, 1, 1,
0.6458834, -1.148305, 1.275855, 0.3686275, 0, 1, 1,
0.6474275, 0.7341549, 0.01840846, 0.372549, 0, 1, 1,
0.6507853, -1.04673, 3.47154, 0.3803922, 0, 1, 1,
0.6632781, 0.1774765, 2.584464, 0.3843137, 0, 1, 1,
0.6670376, 0.5558829, 1.411892, 0.3921569, 0, 1, 1,
0.6709117, 0.7730966, 1.964419, 0.3960784, 0, 1, 1,
0.6723711, -1.912579, 3.114864, 0.4039216, 0, 1, 1,
0.6776968, 0.08203926, 1.624346, 0.4117647, 0, 1, 1,
0.6777177, 0.3335144, 2.241938, 0.4156863, 0, 1, 1,
0.6846904, -1.510801, 1.026822, 0.4235294, 0, 1, 1,
0.6861476, -3.157314, 3.345194, 0.427451, 0, 1, 1,
0.6870264, -0.6152735, 2.867523, 0.4352941, 0, 1, 1,
0.687448, -0.2810539, 0.9950076, 0.4392157, 0, 1, 1,
0.6886933, 0.3584522, -0.5580947, 0.4470588, 0, 1, 1,
0.6887339, 0.1628167, 2.254006, 0.4509804, 0, 1, 1,
0.6894247, 0.1508353, 0.6391479, 0.4588235, 0, 1, 1,
0.6904619, -0.6479777, 3.715543, 0.4627451, 0, 1, 1,
0.6934514, -1.38914, 2.462252, 0.4705882, 0, 1, 1,
0.6948036, -0.3237596, 3.591479, 0.4745098, 0, 1, 1,
0.6980391, -0.6267133, 0.9165276, 0.4823529, 0, 1, 1,
0.7006432, -0.2598501, 3.087083, 0.4862745, 0, 1, 1,
0.7029479, -1.065524, 3.577852, 0.4941176, 0, 1, 1,
0.7131552, -1.176747, 2.534718, 0.5019608, 0, 1, 1,
0.7149925, -0.3013295, 0.411382, 0.5058824, 0, 1, 1,
0.7211045, 0.158485, 2.41136, 0.5137255, 0, 1, 1,
0.7291926, -1.164131, 0.2402556, 0.5176471, 0, 1, 1,
0.7299277, 1.022028, -0.2990943, 0.5254902, 0, 1, 1,
0.742213, -2.69837, 2.530959, 0.5294118, 0, 1, 1,
0.7426776, -0.7043638, 3.101665, 0.5372549, 0, 1, 1,
0.7432505, 0.6235188, 0.3474874, 0.5411765, 0, 1, 1,
0.7452406, 0.1914608, 0.7071968, 0.5490196, 0, 1, 1,
0.7498408, 0.09177754, 1.569898, 0.5529412, 0, 1, 1,
0.7500709, 0.2143906, 0.3229876, 0.5607843, 0, 1, 1,
0.7509248, 0.3739996, 0.7017252, 0.5647059, 0, 1, 1,
0.7525933, -0.449651, 2.197785, 0.572549, 0, 1, 1,
0.7543952, -0.8400115, 2.68194, 0.5764706, 0, 1, 1,
0.7558389, 0.126231, 1.68569, 0.5843138, 0, 1, 1,
0.7605129, 0.6315371, 1.109948, 0.5882353, 0, 1, 1,
0.7614726, -1.122636, 4.467369, 0.5960785, 0, 1, 1,
0.7634448, 2.079587, -0.5386453, 0.6039216, 0, 1, 1,
0.767585, 0.09831124, 3.287805, 0.6078432, 0, 1, 1,
0.7738844, -1.026734, 2.373396, 0.6156863, 0, 1, 1,
0.7780328, 0.3494194, -0.4163674, 0.6196079, 0, 1, 1,
0.7789753, 0.1319154, 1.995898, 0.627451, 0, 1, 1,
0.7828807, -0.9199443, 4.789779, 0.6313726, 0, 1, 1,
0.7838944, 0.7745182, -0.4567357, 0.6392157, 0, 1, 1,
0.7841269, 0.2350083, 2.692561, 0.6431373, 0, 1, 1,
0.7855642, -1.285424, 3.043888, 0.6509804, 0, 1, 1,
0.7868301, -0.475724, 4.128839, 0.654902, 0, 1, 1,
0.7921996, -0.6384682, 2.27747, 0.6627451, 0, 1, 1,
0.7924028, -0.3423826, 0.1609462, 0.6666667, 0, 1, 1,
0.7976359, 0.7412003, 1.018667, 0.6745098, 0, 1, 1,
0.8033299, 0.3283614, 1.313017, 0.6784314, 0, 1, 1,
0.8051428, 1.050825, 0.8644645, 0.6862745, 0, 1, 1,
0.8066465, 0.07407253, 2.696783, 0.6901961, 0, 1, 1,
0.8067792, -0.8845667, 0.6018686, 0.6980392, 0, 1, 1,
0.8068233, -2.108958, 5.524347, 0.7058824, 0, 1, 1,
0.8079209, 0.3470949, 1.72911, 0.7098039, 0, 1, 1,
0.809268, 0.09360398, 0.3763362, 0.7176471, 0, 1, 1,
0.8243419, -0.6177782, 2.314014, 0.7215686, 0, 1, 1,
0.8263197, -0.8807653, 2.550805, 0.7294118, 0, 1, 1,
0.8337492, 0.1396622, 1.384764, 0.7333333, 0, 1, 1,
0.8352802, -1.631992, 1.538861, 0.7411765, 0, 1, 1,
0.8356988, 1.286875, 0.884769, 0.7450981, 0, 1, 1,
0.8433509, -0.4674974, 1.141322, 0.7529412, 0, 1, 1,
0.8442643, -0.9703877, 1.752035, 0.7568628, 0, 1, 1,
0.8454905, -0.9056517, 3.271116, 0.7647059, 0, 1, 1,
0.8483217, 1.137721, 0.877941, 0.7686275, 0, 1, 1,
0.8484282, -0.06257588, 1.577118, 0.7764706, 0, 1, 1,
0.8489748, -1.427313, 4.223403, 0.7803922, 0, 1, 1,
0.8509298, -0.8743094, 3.972415, 0.7882353, 0, 1, 1,
0.8613852, -0.1697803, 2.225868, 0.7921569, 0, 1, 1,
0.8644124, 3.068705, -0.4484335, 0.8, 0, 1, 1,
0.8644279, 0.1290153, 1.090423, 0.8078431, 0, 1, 1,
0.8725089, 1.475156, -0.8519648, 0.8117647, 0, 1, 1,
0.8881708, -1.345128, 4.013461, 0.8196079, 0, 1, 1,
0.8979696, -0.199835, 3.914504, 0.8235294, 0, 1, 1,
0.9008969, -0.06249103, 2.744943, 0.8313726, 0, 1, 1,
0.9064011, 0.2632628, 0.8507164, 0.8352941, 0, 1, 1,
0.9072624, 0.5242596, 1.49612, 0.8431373, 0, 1, 1,
0.9109018, 0.5948482, 2.93193, 0.8470588, 0, 1, 1,
0.9127177, -1.246296, 3.640002, 0.854902, 0, 1, 1,
0.9139744, 0.3024131, 0.3361262, 0.8588235, 0, 1, 1,
0.9200726, -1.212907, 2.0592, 0.8666667, 0, 1, 1,
0.9273733, 0.9409478, 2.447773, 0.8705882, 0, 1, 1,
0.9347105, 0.2692701, 1.417089, 0.8784314, 0, 1, 1,
0.9383454, 1.30133, -0.4701064, 0.8823529, 0, 1, 1,
0.9441844, 0.8494962, 1.869592, 0.8901961, 0, 1, 1,
0.9484196, -1.771645, 4.68335, 0.8941177, 0, 1, 1,
0.9550452, 1.284927, 0.397819, 0.9019608, 0, 1, 1,
0.9574672, 0.320016, 0.9429499, 0.9098039, 0, 1, 1,
0.9596902, 0.07038311, 4.543393, 0.9137255, 0, 1, 1,
0.9642037, 1.971036, 1.076582, 0.9215686, 0, 1, 1,
0.9666538, 0.0868974, 3.561503, 0.9254902, 0, 1, 1,
0.9669068, 0.8877886, 1.393543, 0.9333333, 0, 1, 1,
0.9713118, -0.9375087, 2.000672, 0.9372549, 0, 1, 1,
0.971852, 0.6442474, 1.690936, 0.945098, 0, 1, 1,
0.9756547, 2.528981, -0.1408755, 0.9490196, 0, 1, 1,
0.9797524, 1.08995, -0.4922338, 0.9568627, 0, 1, 1,
0.98023, 1.227526, -0.09050033, 0.9607843, 0, 1, 1,
0.9816864, 0.7915018, 0.694828, 0.9686275, 0, 1, 1,
0.9827533, -0.2161188, 4.733397, 0.972549, 0, 1, 1,
0.9857134, 0.4410061, 0.7748314, 0.9803922, 0, 1, 1,
0.9885532, -0.1226598, 1.632098, 0.9843137, 0, 1, 1,
0.9919464, 0.6816441, 2.526161, 0.9921569, 0, 1, 1,
0.9950491, -0.5193219, 2.71778, 0.9960784, 0, 1, 1,
1.00472, -0.6325216, 2.557659, 1, 0, 0.9960784, 1,
1.006788, -0.791965, 2.911695, 1, 0, 0.9882353, 1,
1.00964, 0.005129499, 1.496014, 1, 0, 0.9843137, 1,
1.012353, -0.5277202, 1.977711, 1, 0, 0.9764706, 1,
1.021543, 1.108641, 0.07738698, 1, 0, 0.972549, 1,
1.023983, -1.170843, 1.85768, 1, 0, 0.9647059, 1,
1.04143, 1.145916, 1.124405, 1, 0, 0.9607843, 1,
1.041687, 0.2184824, -0.2719651, 1, 0, 0.9529412, 1,
1.044578, -0.805503, 3.98532, 1, 0, 0.9490196, 1,
1.049684, 1.121538, 1.001008, 1, 0, 0.9411765, 1,
1.054164, 0.07581383, 1.171717, 1, 0, 0.9372549, 1,
1.070304, 1.086894, -0.6080216, 1, 0, 0.9294118, 1,
1.077875, -1.449995, 4.569697, 1, 0, 0.9254902, 1,
1.080032, 1.377988, 2.823871, 1, 0, 0.9176471, 1,
1.084803, 0.7213904, 0.1220325, 1, 0, 0.9137255, 1,
1.084926, 0.2822188, 2.225224, 1, 0, 0.9058824, 1,
1.08808, 0.5450421, 1.257217, 1, 0, 0.9019608, 1,
1.09042, -0.9768382, 2.390969, 1, 0, 0.8941177, 1,
1.093434, 0.09620484, 0.1904321, 1, 0, 0.8862745, 1,
1.093516, -0.9880495, 1.212698, 1, 0, 0.8823529, 1,
1.098876, 0.2691447, 2.249394, 1, 0, 0.8745098, 1,
1.109515, 0.6395168, 1.267166, 1, 0, 0.8705882, 1,
1.11106, -0.4394002, 2.176513, 1, 0, 0.8627451, 1,
1.121522, 0.8288585, 0.5747807, 1, 0, 0.8588235, 1,
1.121965, 1.449039, 0.3542255, 1, 0, 0.8509804, 1,
1.126184, 0.6767026, -0.1014056, 1, 0, 0.8470588, 1,
1.129238, -0.6344221, 1.610838, 1, 0, 0.8392157, 1,
1.132611, -0.01233537, 0.6774166, 1, 0, 0.8352941, 1,
1.133274, 0.01394843, 0.6753876, 1, 0, 0.827451, 1,
1.148013, -0.279212, 1.882303, 1, 0, 0.8235294, 1,
1.149972, -0.6775708, 1.751672, 1, 0, 0.8156863, 1,
1.159755, 0.2375075, -0.3457176, 1, 0, 0.8117647, 1,
1.160431, 2.032293, 1.231848, 1, 0, 0.8039216, 1,
1.16525, -0.1887248, 3.263394, 1, 0, 0.7960784, 1,
1.165814, -0.3183795, 1.664153, 1, 0, 0.7921569, 1,
1.172642, -1.039739, 2.814873, 1, 0, 0.7843137, 1,
1.172948, -1.581714, 3.204928, 1, 0, 0.7803922, 1,
1.183121, 0.2356892, 1.965608, 1, 0, 0.772549, 1,
1.184096, -0.1969833, 2.349206, 1, 0, 0.7686275, 1,
1.189982, 1.525275, 0.8414485, 1, 0, 0.7607843, 1,
1.191492, 0.5761282, 0.847932, 1, 0, 0.7568628, 1,
1.193609, 2.326612, -0.8231715, 1, 0, 0.7490196, 1,
1.205077, 0.6287163, -0.6151248, 1, 0, 0.7450981, 1,
1.218358, -0.5126092, 0.8510277, 1, 0, 0.7372549, 1,
1.222873, 0.4062518, 0.5857526, 1, 0, 0.7333333, 1,
1.223996, -0.8697518, 1.976302, 1, 0, 0.7254902, 1,
1.228105, 0.508339, -0.3291644, 1, 0, 0.7215686, 1,
1.228622, -2.140951, 1.576474, 1, 0, 0.7137255, 1,
1.233106, -1.59533, 1.153345, 1, 0, 0.7098039, 1,
1.239003, -0.05206332, -0.4960558, 1, 0, 0.7019608, 1,
1.242893, 1.687535, 1.495149, 1, 0, 0.6941177, 1,
1.246433, 0.05815947, 1.022302, 1, 0, 0.6901961, 1,
1.246958, 0.136989, 0.8472602, 1, 0, 0.682353, 1,
1.249282, 0.875425, 3.385945, 1, 0, 0.6784314, 1,
1.2679, 0.3956394, 2.024346, 1, 0, 0.6705883, 1,
1.274864, 1.040529, 1.798044, 1, 0, 0.6666667, 1,
1.280381, 0.3020866, 1.479705, 1, 0, 0.6588235, 1,
1.285565, 0.6490238, -0.4483805, 1, 0, 0.654902, 1,
1.300616, 1.431445, 1.772658, 1, 0, 0.6470588, 1,
1.303545, 0.7828553, 0.9749415, 1, 0, 0.6431373, 1,
1.311758, -1.852293, 3.656425, 1, 0, 0.6352941, 1,
1.315578, -0.5181926, 2.528927, 1, 0, 0.6313726, 1,
1.324432, 0.2832619, 1.84045, 1, 0, 0.6235294, 1,
1.347079, 0.2262653, 2.042225, 1, 0, 0.6196079, 1,
1.354074, 0.05556865, 3.880709, 1, 0, 0.6117647, 1,
1.354395, 2.169477, 0.3765316, 1, 0, 0.6078432, 1,
1.356144, 0.3879238, -0.3377558, 1, 0, 0.6, 1,
1.361853, 0.5388989, 0.9159074, 1, 0, 0.5921569, 1,
1.365285, 2.063951, 1.060305, 1, 0, 0.5882353, 1,
1.367787, -0.3170924, 0.9682779, 1, 0, 0.5803922, 1,
1.370287, -2.148528, 2.049227, 1, 0, 0.5764706, 1,
1.388812, -0.1019907, 0.4788775, 1, 0, 0.5686275, 1,
1.390396, -0.4125785, 2.010072, 1, 0, 0.5647059, 1,
1.392469, 2.557451, 0.5538372, 1, 0, 0.5568628, 1,
1.412048, 0.2654842, 2.531821, 1, 0, 0.5529412, 1,
1.412474, 1.381502, -1.442349, 1, 0, 0.5450981, 1,
1.419859, -0.4528272, 1.363049, 1, 0, 0.5411765, 1,
1.43489, 0.02682543, 3.287995, 1, 0, 0.5333334, 1,
1.442303, 0.2111442, 0.7109796, 1, 0, 0.5294118, 1,
1.443141, -0.2477053, 4.119731, 1, 0, 0.5215687, 1,
1.448581, 0.09359652, 3.180945, 1, 0, 0.5176471, 1,
1.452959, -0.3021007, 2.991916, 1, 0, 0.509804, 1,
1.457543, 0.8011456, 0.9405494, 1, 0, 0.5058824, 1,
1.462728, -0.2883258, 1.724073, 1, 0, 0.4980392, 1,
1.467984, -1.311742, 3.128336, 1, 0, 0.4901961, 1,
1.482752, 0.1406913, 1.099222, 1, 0, 0.4862745, 1,
1.488254, 0.1911646, 1.464951, 1, 0, 0.4784314, 1,
1.497062, 1.211319, 1.412548, 1, 0, 0.4745098, 1,
1.511328, -0.07627615, 1.15379, 1, 0, 0.4666667, 1,
1.513557, -0.08535032, 2.054767, 1, 0, 0.4627451, 1,
1.516513, 2.277916, 0.3998277, 1, 0, 0.454902, 1,
1.524089, 0.4424104, 0.3772892, 1, 0, 0.4509804, 1,
1.545182, 0.6421045, 3.033209, 1, 0, 0.4431373, 1,
1.553655, 0.6866657, -0.004345669, 1, 0, 0.4392157, 1,
1.56742, 0.4695355, 2.397465, 1, 0, 0.4313726, 1,
1.582919, 0.3671872, 0.3807172, 1, 0, 0.427451, 1,
1.591167, 0.03945458, 2.396554, 1, 0, 0.4196078, 1,
1.598547, 1.187871, -0.7437401, 1, 0, 0.4156863, 1,
1.602664, -1.05022, 4.226032, 1, 0, 0.4078431, 1,
1.617952, 0.2114831, -0.9780889, 1, 0, 0.4039216, 1,
1.633224, 0.7123142, 2.957294, 1, 0, 0.3960784, 1,
1.637796, -1.639575, 3.150866, 1, 0, 0.3882353, 1,
1.642692, 0.5854034, 1.52754, 1, 0, 0.3843137, 1,
1.643567, 0.2313186, 1.393975, 1, 0, 0.3764706, 1,
1.654461, 1.518805, 2.22559, 1, 0, 0.372549, 1,
1.657767, -0.6492754, 2.755877, 1, 0, 0.3647059, 1,
1.666774, -1.207949, 1.076844, 1, 0, 0.3607843, 1,
1.69843, -0.8491158, 0.7898922, 1, 0, 0.3529412, 1,
1.718034, -2.125345, 1.432493, 1, 0, 0.3490196, 1,
1.735226, -0.7366831, 2.749658, 1, 0, 0.3411765, 1,
1.745206, -1.589731, 2.452505, 1, 0, 0.3372549, 1,
1.756247, 0.3769373, 1.319224, 1, 0, 0.3294118, 1,
1.757608, -0.7271903, 1.945362, 1, 0, 0.3254902, 1,
1.775769, -0.7318971, 1.908852, 1, 0, 0.3176471, 1,
1.802235, -0.1389248, 0.5595134, 1, 0, 0.3137255, 1,
1.804481, 0.4144289, 0.8953666, 1, 0, 0.3058824, 1,
1.807529, 0.3712351, 1.515375, 1, 0, 0.2980392, 1,
1.816254, 1.100903, 0.8091504, 1, 0, 0.2941177, 1,
1.833817, -1.181945, 1.814424, 1, 0, 0.2862745, 1,
1.836233, -0.8391156, 0.9212878, 1, 0, 0.282353, 1,
1.850856, -1.105537, 1.395668, 1, 0, 0.2745098, 1,
1.850876, 0.85674, 1.881266, 1, 0, 0.2705882, 1,
1.856584, 0.1213064, 3.703186, 1, 0, 0.2627451, 1,
1.873967, -1.492189, 2.136979, 1, 0, 0.2588235, 1,
1.874239, 1.176755, -0.2236746, 1, 0, 0.2509804, 1,
1.888441, -2.685185, 2.34543, 1, 0, 0.2470588, 1,
1.893685, 0.247595, 1.253689, 1, 0, 0.2392157, 1,
1.908763, -0.5798259, 1.606736, 1, 0, 0.2352941, 1,
1.916788, -1.462615, 2.003703, 1, 0, 0.227451, 1,
1.932172, -0.01907481, 1.173573, 1, 0, 0.2235294, 1,
1.934428, 1.427908, -0.3236362, 1, 0, 0.2156863, 1,
1.93493, 1.290027, 1.918526, 1, 0, 0.2117647, 1,
1.9737, -0.7202512, 1.809609, 1, 0, 0.2039216, 1,
1.984452, 0.1126857, 1.16922, 1, 0, 0.1960784, 1,
1.993518, -1.325529, 1.489604, 1, 0, 0.1921569, 1,
2.007665, -0.5665466, 2.523992, 1, 0, 0.1843137, 1,
2.008155, -0.153444, -0.7521583, 1, 0, 0.1803922, 1,
2.029853, 0.2667904, 2.786062, 1, 0, 0.172549, 1,
2.062612, -2.408912, 2.305751, 1, 0, 0.1686275, 1,
2.073707, -0.3344233, 1.831664, 1, 0, 0.1607843, 1,
2.077423, 0.9619521, 1.038483, 1, 0, 0.1568628, 1,
2.081383, 0.9599101, 1.730403, 1, 0, 0.1490196, 1,
2.090205, 0.6699715, 1.950877, 1, 0, 0.145098, 1,
2.09164, -1.412983, 2.810582, 1, 0, 0.1372549, 1,
2.101966, -0.7490733, 2.826609, 1, 0, 0.1333333, 1,
2.125882, 0.1538524, 2.321483, 1, 0, 0.1254902, 1,
2.142017, 1.802637, -0.1302536, 1, 0, 0.1215686, 1,
2.165462, 0.3840402, 0.9730467, 1, 0, 0.1137255, 1,
2.170192, 0.9641027, 3.138869, 1, 0, 0.1098039, 1,
2.184116, -0.207295, 2.133868, 1, 0, 0.1019608, 1,
2.244073, 0.2690134, 2.251871, 1, 0, 0.09411765, 1,
2.256255, 0.2960552, 1.668545, 1, 0, 0.09019608, 1,
2.260806, 0.06424679, -0.3444564, 1, 0, 0.08235294, 1,
2.268392, -1.580894, 1.816808, 1, 0, 0.07843138, 1,
2.275597, 0.438074, 2.434292, 1, 0, 0.07058824, 1,
2.413289, 1.296719, 3.000357, 1, 0, 0.06666667, 1,
2.429738, -0.04858042, 0.7450585, 1, 0, 0.05882353, 1,
2.430288, -1.91111, 4.090933, 1, 0, 0.05490196, 1,
2.500293, 0.5651094, 2.672071, 1, 0, 0.04705882, 1,
2.61293, 1.932429, -0.4645244, 1, 0, 0.04313726, 1,
2.66122, -0.9735953, 1.128553, 1, 0, 0.03529412, 1,
2.663667, 0.5740943, 2.322412, 1, 0, 0.03137255, 1,
2.698206, 0.02771839, 1.028987, 1, 0, 0.02352941, 1,
2.749157, -0.5026619, 2.53685, 1, 0, 0.01960784, 1,
2.974397, 0.6835275, 0.1426285, 1, 0, 0.01176471, 1,
3.06307, -1.839277, 1.718648, 1, 0, 0.007843138, 1
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
-0.06635416, -4.212624, -6.888439, 0, -0.5, 0.5, 0.5,
-0.06635416, -4.212624, -6.888439, 1, -0.5, 0.5, 0.5,
-0.06635416, -4.212624, -6.888439, 1, 1.5, 0.5, 0.5,
-0.06635416, -4.212624, -6.888439, 0, 1.5, 0.5, 0.5
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
-4.256653, -0.04430473, -6.888439, 0, -0.5, 0.5, 0.5,
-4.256653, -0.04430473, -6.888439, 1, -0.5, 0.5, 0.5,
-4.256653, -0.04430473, -6.888439, 1, 1.5, 0.5, 0.5,
-4.256653, -0.04430473, -6.888439, 0, 1.5, 0.5, 0.5
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
-4.256653, -4.212624, 0.2174699, 0, -0.5, 0.5, 0.5,
-4.256653, -4.212624, 0.2174699, 1, -0.5, 0.5, 0.5,
-4.256653, -4.212624, 0.2174699, 1, 1.5, 0.5, 0.5,
-4.256653, -4.212624, 0.2174699, 0, 1.5, 0.5, 0.5
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
-3, -3.250704, -5.248614,
3, -3.250704, -5.248614,
-3, -3.250704, -5.248614,
-3, -3.411024, -5.521918,
-2, -3.250704, -5.248614,
-2, -3.411024, -5.521918,
-1, -3.250704, -5.248614,
-1, -3.411024, -5.521918,
0, -3.250704, -5.248614,
0, -3.411024, -5.521918,
1, -3.250704, -5.248614,
1, -3.411024, -5.521918,
2, -3.250704, -5.248614,
2, -3.411024, -5.521918,
3, -3.250704, -5.248614,
3, -3.411024, -5.521918
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
-3, -3.731664, -6.068526, 0, -0.5, 0.5, 0.5,
-3, -3.731664, -6.068526, 1, -0.5, 0.5, 0.5,
-3, -3.731664, -6.068526, 1, 1.5, 0.5, 0.5,
-3, -3.731664, -6.068526, 0, 1.5, 0.5, 0.5,
-2, -3.731664, -6.068526, 0, -0.5, 0.5, 0.5,
-2, -3.731664, -6.068526, 1, -0.5, 0.5, 0.5,
-2, -3.731664, -6.068526, 1, 1.5, 0.5, 0.5,
-2, -3.731664, -6.068526, 0, 1.5, 0.5, 0.5,
-1, -3.731664, -6.068526, 0, -0.5, 0.5, 0.5,
-1, -3.731664, -6.068526, 1, -0.5, 0.5, 0.5,
-1, -3.731664, -6.068526, 1, 1.5, 0.5, 0.5,
-1, -3.731664, -6.068526, 0, 1.5, 0.5, 0.5,
0, -3.731664, -6.068526, 0, -0.5, 0.5, 0.5,
0, -3.731664, -6.068526, 1, -0.5, 0.5, 0.5,
0, -3.731664, -6.068526, 1, 1.5, 0.5, 0.5,
0, -3.731664, -6.068526, 0, 1.5, 0.5, 0.5,
1, -3.731664, -6.068526, 0, -0.5, 0.5, 0.5,
1, -3.731664, -6.068526, 1, -0.5, 0.5, 0.5,
1, -3.731664, -6.068526, 1, 1.5, 0.5, 0.5,
1, -3.731664, -6.068526, 0, 1.5, 0.5, 0.5,
2, -3.731664, -6.068526, 0, -0.5, 0.5, 0.5,
2, -3.731664, -6.068526, 1, -0.5, 0.5, 0.5,
2, -3.731664, -6.068526, 1, 1.5, 0.5, 0.5,
2, -3.731664, -6.068526, 0, 1.5, 0.5, 0.5,
3, -3.731664, -6.068526, 0, -0.5, 0.5, 0.5,
3, -3.731664, -6.068526, 1, -0.5, 0.5, 0.5,
3, -3.731664, -6.068526, 1, 1.5, 0.5, 0.5,
3, -3.731664, -6.068526, 0, 1.5, 0.5, 0.5
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
-3.289661, -3, -5.248614,
-3.289661, 3, -5.248614,
-3.289661, -3, -5.248614,
-3.450827, -3, -5.521918,
-3.289661, -2, -5.248614,
-3.450827, -2, -5.521918,
-3.289661, -1, -5.248614,
-3.450827, -1, -5.521918,
-3.289661, 0, -5.248614,
-3.450827, 0, -5.521918,
-3.289661, 1, -5.248614,
-3.450827, 1, -5.521918,
-3.289661, 2, -5.248614,
-3.450827, 2, -5.521918,
-3.289661, 3, -5.248614,
-3.450827, 3, -5.521918
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
-3.773157, -3, -6.068526, 0, -0.5, 0.5, 0.5,
-3.773157, -3, -6.068526, 1, -0.5, 0.5, 0.5,
-3.773157, -3, -6.068526, 1, 1.5, 0.5, 0.5,
-3.773157, -3, -6.068526, 0, 1.5, 0.5, 0.5,
-3.773157, -2, -6.068526, 0, -0.5, 0.5, 0.5,
-3.773157, -2, -6.068526, 1, -0.5, 0.5, 0.5,
-3.773157, -2, -6.068526, 1, 1.5, 0.5, 0.5,
-3.773157, -2, -6.068526, 0, 1.5, 0.5, 0.5,
-3.773157, -1, -6.068526, 0, -0.5, 0.5, 0.5,
-3.773157, -1, -6.068526, 1, -0.5, 0.5, 0.5,
-3.773157, -1, -6.068526, 1, 1.5, 0.5, 0.5,
-3.773157, -1, -6.068526, 0, 1.5, 0.5, 0.5,
-3.773157, 0, -6.068526, 0, -0.5, 0.5, 0.5,
-3.773157, 0, -6.068526, 1, -0.5, 0.5, 0.5,
-3.773157, 0, -6.068526, 1, 1.5, 0.5, 0.5,
-3.773157, 0, -6.068526, 0, 1.5, 0.5, 0.5,
-3.773157, 1, -6.068526, 0, -0.5, 0.5, 0.5,
-3.773157, 1, -6.068526, 1, -0.5, 0.5, 0.5,
-3.773157, 1, -6.068526, 1, 1.5, 0.5, 0.5,
-3.773157, 1, -6.068526, 0, 1.5, 0.5, 0.5,
-3.773157, 2, -6.068526, 0, -0.5, 0.5, 0.5,
-3.773157, 2, -6.068526, 1, -0.5, 0.5, 0.5,
-3.773157, 2, -6.068526, 1, 1.5, 0.5, 0.5,
-3.773157, 2, -6.068526, 0, 1.5, 0.5, 0.5,
-3.773157, 3, -6.068526, 0, -0.5, 0.5, 0.5,
-3.773157, 3, -6.068526, 1, -0.5, 0.5, 0.5,
-3.773157, 3, -6.068526, 1, 1.5, 0.5, 0.5,
-3.773157, 3, -6.068526, 0, 1.5, 0.5, 0.5
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
-3.289661, -3.250704, -4,
-3.289661, -3.250704, 4,
-3.289661, -3.250704, -4,
-3.450827, -3.411024, -4,
-3.289661, -3.250704, -2,
-3.450827, -3.411024, -2,
-3.289661, -3.250704, 0,
-3.450827, -3.411024, 0,
-3.289661, -3.250704, 2,
-3.450827, -3.411024, 2,
-3.289661, -3.250704, 4,
-3.450827, -3.411024, 4
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
-3.773157, -3.731664, -4, 0, -0.5, 0.5, 0.5,
-3.773157, -3.731664, -4, 1, -0.5, 0.5, 0.5,
-3.773157, -3.731664, -4, 1, 1.5, 0.5, 0.5,
-3.773157, -3.731664, -4, 0, 1.5, 0.5, 0.5,
-3.773157, -3.731664, -2, 0, -0.5, 0.5, 0.5,
-3.773157, -3.731664, -2, 1, -0.5, 0.5, 0.5,
-3.773157, -3.731664, -2, 1, 1.5, 0.5, 0.5,
-3.773157, -3.731664, -2, 0, 1.5, 0.5, 0.5,
-3.773157, -3.731664, 0, 0, -0.5, 0.5, 0.5,
-3.773157, -3.731664, 0, 1, -0.5, 0.5, 0.5,
-3.773157, -3.731664, 0, 1, 1.5, 0.5, 0.5,
-3.773157, -3.731664, 0, 0, 1.5, 0.5, 0.5,
-3.773157, -3.731664, 2, 0, -0.5, 0.5, 0.5,
-3.773157, -3.731664, 2, 1, -0.5, 0.5, 0.5,
-3.773157, -3.731664, 2, 1, 1.5, 0.5, 0.5,
-3.773157, -3.731664, 2, 0, 1.5, 0.5, 0.5,
-3.773157, -3.731664, 4, 0, -0.5, 0.5, 0.5,
-3.773157, -3.731664, 4, 1, -0.5, 0.5, 0.5,
-3.773157, -3.731664, 4, 1, 1.5, 0.5, 0.5,
-3.773157, -3.731664, 4, 0, 1.5, 0.5, 0.5
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
-3.289661, -3.250704, -5.248614,
-3.289661, 3.162095, -5.248614,
-3.289661, -3.250704, 5.683554,
-3.289661, 3.162095, 5.683554,
-3.289661, -3.250704, -5.248614,
-3.289661, -3.250704, 5.683554,
-3.289661, 3.162095, -5.248614,
-3.289661, 3.162095, 5.683554,
-3.289661, -3.250704, -5.248614,
3.156953, -3.250704, -5.248614,
-3.289661, -3.250704, 5.683554,
3.156953, -3.250704, 5.683554,
-3.289661, 3.162095, -5.248614,
3.156953, 3.162095, -5.248614,
-3.289661, 3.162095, 5.683554,
3.156953, 3.162095, 5.683554,
3.156953, -3.250704, -5.248614,
3.156953, 3.162095, -5.248614,
3.156953, -3.250704, 5.683554,
3.156953, 3.162095, 5.683554,
3.156953, -3.250704, -5.248614,
3.156953, -3.250704, 5.683554,
3.156953, 3.162095, -5.248614,
3.156953, 3.162095, 5.683554
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
var radius = 7.592954;
var distance = 33.78191;
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
mvMatrix.translate( 0.06635416, 0.04430473, -0.2174699 );
mvMatrix.scale( 1.273483, 1.280198, 0.7509628 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.78191);
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
DPA<-read.table("DPA.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DPA$V2
```

```
## Error in eval(expr, envir, enclos): object 'DPA' not found
```

```r
y<-DPA$V3
```

```
## Error in eval(expr, envir, enclos): object 'DPA' not found
```

```r
z<-DPA$V4
```

```
## Error in eval(expr, envir, enclos): object 'DPA' not found
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
-3.195779, 0.1013886, -2.2949, 0, 0, 1, 1, 1,
-3.189967, 1.338919, -1.687771, 1, 0, 0, 1, 1,
-2.937441, -1.188742, -1.862823, 1, 0, 0, 1, 1,
-2.817322, 0.398348, -2.562784, 1, 0, 0, 1, 1,
-2.708874, -0.06346177, 0.4109454, 1, 0, 0, 1, 1,
-2.470392, -1.748976, -0.05212289, 1, 0, 0, 1, 1,
-2.427931, 0.8170802, -2.206866, 0, 0, 0, 1, 1,
-2.419644, 0.2173907, -3.004494, 0, 0, 0, 1, 1,
-2.418338, -0.6696204, -0.6566846, 0, 0, 0, 1, 1,
-2.338709, -0.8788781, -0.4898311, 0, 0, 0, 1, 1,
-2.324337, -1.245464, -3.253852, 0, 0, 0, 1, 1,
-2.247034, -1.614661, -3.226365, 0, 0, 0, 1, 1,
-2.192002, -0.1921199, -1.11434, 0, 0, 0, 1, 1,
-2.1884, 1.21948, -0.735283, 1, 1, 1, 1, 1,
-2.178149, 0.6313502, -0.4915352, 1, 1, 1, 1, 1,
-2.135385, 0.5750583, -0.6078736, 1, 1, 1, 1, 1,
-2.095114, -0.8519191, -3.450729, 1, 1, 1, 1, 1,
-2.057278, 0.1120078, -1.951854, 1, 1, 1, 1, 1,
-2.054925, -0.03126315, -0.8913136, 1, 1, 1, 1, 1,
-2.051676, 0.9831881, -2.99133, 1, 1, 1, 1, 1,
-2.017219, -1.385499, -1.987988, 1, 1, 1, 1, 1,
-2.013741, -1.417176, -1.798185, 1, 1, 1, 1, 1,
-2.002015, -0.8900134, -2.935997, 1, 1, 1, 1, 1,
-1.993401, 0.4163588, -2.275526, 1, 1, 1, 1, 1,
-1.975361, 0.6659915, -0.6141619, 1, 1, 1, 1, 1,
-1.970132, 0.9050773, 0.03082914, 1, 1, 1, 1, 1,
-1.938008, -0.5457668, -3.3393, 1, 1, 1, 1, 1,
-1.931372, -0.5591496, -2.618377, 1, 1, 1, 1, 1,
-1.93066, 0.4484751, -1.30693, 0, 0, 1, 1, 1,
-1.929974, -1.503436, -1.366536, 1, 0, 0, 1, 1,
-1.87428, -0.7843465, -3.227019, 1, 0, 0, 1, 1,
-1.874024, -0.6328601, -2.517251, 1, 0, 0, 1, 1,
-1.800415, -0.2872548, -0.7127326, 1, 0, 0, 1, 1,
-1.79942, -0.2915855, -0.3774045, 1, 0, 0, 1, 1,
-1.774448, 0.8691343, -1.140389, 0, 0, 0, 1, 1,
-1.770644, 0.7808605, -0.06723939, 0, 0, 0, 1, 1,
-1.708151, -1.731681, -2.611461, 0, 0, 0, 1, 1,
-1.681776, -0.3186092, -2.159883, 0, 0, 0, 1, 1,
-1.677276, 0.1080369, -0.3492797, 0, 0, 0, 1, 1,
-1.672888, -0.3527163, -2.195788, 0, 0, 0, 1, 1,
-1.665425, -0.2032602, -0.6597421, 0, 0, 0, 1, 1,
-1.663475, 0.6941034, -1.178828, 1, 1, 1, 1, 1,
-1.661918, 1.025313, 0.1004989, 1, 1, 1, 1, 1,
-1.661917, 1.009255, -0.802358, 1, 1, 1, 1, 1,
-1.640328, 0.1159159, -1.081037, 1, 1, 1, 1, 1,
-1.634264, -0.3649461, 1.22455, 1, 1, 1, 1, 1,
-1.632594, 0.8553415, -0.7128034, 1, 1, 1, 1, 1,
-1.627893, 0.1549312, -2.165334, 1, 1, 1, 1, 1,
-1.623344, 1.862007, -2.173467, 1, 1, 1, 1, 1,
-1.622087, -1.503212, -2.543958, 1, 1, 1, 1, 1,
-1.620217, 0.3996964, -0.5881042, 1, 1, 1, 1, 1,
-1.616928, 0.1777142, -0.01644483, 1, 1, 1, 1, 1,
-1.616662, 0.7861548, -0.5814198, 1, 1, 1, 1, 1,
-1.608467, 1.459562, -1.610186, 1, 1, 1, 1, 1,
-1.604339, 1.315124, -1.072855, 1, 1, 1, 1, 1,
-1.58859, 1.576989, -0.8352993, 1, 1, 1, 1, 1,
-1.584167, 0.6787034, -0.3396898, 0, 0, 1, 1, 1,
-1.578573, 0.7208126, -0.7089303, 1, 0, 0, 1, 1,
-1.576848, -1.604497, -1.64008, 1, 0, 0, 1, 1,
-1.575111, 1.102942, -0.4833672, 1, 0, 0, 1, 1,
-1.574468, 1.317451, -1.151216, 1, 0, 0, 1, 1,
-1.571608, 0.4223786, -1.462327, 1, 0, 0, 1, 1,
-1.571454, 0.1921566, -1.446268, 0, 0, 0, 1, 1,
-1.561476, -1.368302, -2.935265, 0, 0, 0, 1, 1,
-1.542085, -1.738251, -3.089028, 0, 0, 0, 1, 1,
-1.541317, -0.5164533, -2.326383, 0, 0, 0, 1, 1,
-1.5354, 0.7862371, 1.407001, 0, 0, 0, 1, 1,
-1.524785, -1.236509, -1.819665, 0, 0, 0, 1, 1,
-1.5243, -1.407646, -1.698187, 0, 0, 0, 1, 1,
-1.492288, 0.9973742, -1.858013, 1, 1, 1, 1, 1,
-1.48187, 1.209639, -2.285332, 1, 1, 1, 1, 1,
-1.478042, 0.580203, -0.5266665, 1, 1, 1, 1, 1,
-1.476374, 2.073672, -1.20124, 1, 1, 1, 1, 1,
-1.466594, -0.7838148, -0.8809822, 1, 1, 1, 1, 1,
-1.46602, 0.2785838, -0.9000309, 1, 1, 1, 1, 1,
-1.455503, -2.973591, -1.475339, 1, 1, 1, 1, 1,
-1.454179, -0.988714, -3.088237, 1, 1, 1, 1, 1,
-1.453443, -0.8744469, -1.58288, 1, 1, 1, 1, 1,
-1.441772, -0.327046, -0.6659659, 1, 1, 1, 1, 1,
-1.439606, -0.1672257, -2.052971, 1, 1, 1, 1, 1,
-1.431857, -2.508966, -1.587173, 1, 1, 1, 1, 1,
-1.43107, 0.5949486, -0.8742006, 1, 1, 1, 1, 1,
-1.418508, 0.3422102, -1.182898, 1, 1, 1, 1, 1,
-1.407525, -0.2946436, -2.188529, 1, 1, 1, 1, 1,
-1.403224, 0.586631, -2.570056, 0, 0, 1, 1, 1,
-1.392251, 0.3206027, 0.2102121, 1, 0, 0, 1, 1,
-1.361645, -0.2134408, -3.103428, 1, 0, 0, 1, 1,
-1.354627, -0.3426696, -2.153567, 1, 0, 0, 1, 1,
-1.346644, 0.4997205, -1.785571, 1, 0, 0, 1, 1,
-1.33635, 0.201464, -0.8592275, 1, 0, 0, 1, 1,
-1.332109, -0.3921078, -2.930151, 0, 0, 0, 1, 1,
-1.327531, 2.434258, 0.8334916, 0, 0, 0, 1, 1,
-1.320476, 0.2650848, -0.7883889, 0, 0, 0, 1, 1,
-1.306335, -0.3466221, -1.035976, 0, 0, 0, 1, 1,
-1.303993, -0.2653243, -0.2909848, 0, 0, 0, 1, 1,
-1.297302, -0.2892573, -1.208096, 0, 0, 0, 1, 1,
-1.295432, -0.8081713, -1.919055, 0, 0, 0, 1, 1,
-1.275537, 0.7766585, -2.842302, 1, 1, 1, 1, 1,
-1.264173, 2.370185, -0.4509358, 1, 1, 1, 1, 1,
-1.259903, 0.8043641, -0.1944915, 1, 1, 1, 1, 1,
-1.255539, 0.1057704, -1.067212, 1, 1, 1, 1, 1,
-1.254513, -1.475388, -2.998095, 1, 1, 1, 1, 1,
-1.247509, -0.1094665, -0.4352089, 1, 1, 1, 1, 1,
-1.230566, -1.320919, -2.260383, 1, 1, 1, 1, 1,
-1.219772, 0.8231101, -0.8577043, 1, 1, 1, 1, 1,
-1.212319, 0.3831666, -1.196941, 1, 1, 1, 1, 1,
-1.20386, 0.0806608, -3.425335, 1, 1, 1, 1, 1,
-1.199394, -0.5273473, -2.991796, 1, 1, 1, 1, 1,
-1.198951, 0.3160238, -1.908785, 1, 1, 1, 1, 1,
-1.198049, 0.9102166, -1.946741, 1, 1, 1, 1, 1,
-1.197193, -0.323983, 0.5799829, 1, 1, 1, 1, 1,
-1.192823, -0.1779504, -1.293736, 1, 1, 1, 1, 1,
-1.19253, 0.5645664, -2.240862, 0, 0, 1, 1, 1,
-1.1918, 0.3349534, -1.305293, 1, 0, 0, 1, 1,
-1.189938, 0.7361696, -1.548541, 1, 0, 0, 1, 1,
-1.180081, 0.1182915, -1.522434, 1, 0, 0, 1, 1,
-1.174071, -1.585408, -1.587655, 1, 0, 0, 1, 1,
-1.162237, 0.6549124, -2.313301, 1, 0, 0, 1, 1,
-1.161833, 0.1467074, -0.7973716, 0, 0, 0, 1, 1,
-1.157887, 0.1562158, -1.262844, 0, 0, 0, 1, 1,
-1.147788, 0.546695, -0.08666199, 0, 0, 0, 1, 1,
-1.141298, 0.392234, 0.5704063, 0, 0, 0, 1, 1,
-1.139297, -1.117252, -1.40366, 0, 0, 0, 1, 1,
-1.138395, -1.433914, -3.522686, 0, 0, 0, 1, 1,
-1.125568, -1.09698, -3.057828, 0, 0, 0, 1, 1,
-1.117372, -0.31737, -1.381437, 1, 1, 1, 1, 1,
-1.116138, 1.109063, -0.6694037, 1, 1, 1, 1, 1,
-1.113183, 2.021857, -3.875748, 1, 1, 1, 1, 1,
-1.111596, -0.6012422, -1.561895, 1, 1, 1, 1, 1,
-1.102094, -0.2783618, -2.564532, 1, 1, 1, 1, 1,
-1.10133, 0.07201428, -0.7837392, 1, 1, 1, 1, 1,
-1.099065, 0.1125387, -1.937226, 1, 1, 1, 1, 1,
-1.091406, -0.9733969, -2.107885, 1, 1, 1, 1, 1,
-1.089435, -1.156406, -1.944664, 1, 1, 1, 1, 1,
-1.075095, -1.205397, -1.324923, 1, 1, 1, 1, 1,
-1.071336, -1.28932, -1.6681, 1, 1, 1, 1, 1,
-1.069588, 1.460172, -1.776711, 1, 1, 1, 1, 1,
-1.065062, 0.794691, -1.528436, 1, 1, 1, 1, 1,
-1.064408, 0.3400499, -0.8331431, 1, 1, 1, 1, 1,
-1.051516, 0.2142981, -2.426249, 1, 1, 1, 1, 1,
-1.044499, -0.4567246, -2.85039, 0, 0, 1, 1, 1,
-1.038086, 1.065063, -0.1639654, 1, 0, 0, 1, 1,
-1.037576, -0.7735727, -2.353129, 1, 0, 0, 1, 1,
-1.032472, 0.927415, 1.286434, 1, 0, 0, 1, 1,
-1.031066, 2.008021, -1.331267, 1, 0, 0, 1, 1,
-1.021697, -0.1337062, -2.807124, 1, 0, 0, 1, 1,
-1.017908, -1.789502, -1.59793, 0, 0, 0, 1, 1,
-1.012212, -0.9119738, -2.276441, 0, 0, 0, 1, 1,
-1.002111, 1.476216, -1.635139, 0, 0, 0, 1, 1,
-0.9999989, 0.5206009, -0.9405886, 0, 0, 0, 1, 1,
-0.9989219, -0.5026672, -2.531298, 0, 0, 0, 1, 1,
-0.9988325, -0.100606, -1.860569, 0, 0, 0, 1, 1,
-0.997139, -0.3174479, -0.4262837, 0, 0, 0, 1, 1,
-0.9857215, 0.9357651, -2.279354, 1, 1, 1, 1, 1,
-0.9801657, -0.02205345, -1.630831, 1, 1, 1, 1, 1,
-0.9778477, 0.2793158, -3.771432, 1, 1, 1, 1, 1,
-0.9767748, -1.363808, -1.734199, 1, 1, 1, 1, 1,
-0.9744404, 0.04690516, -1.260335, 1, 1, 1, 1, 1,
-0.9632408, 1.085392, -0.9252535, 1, 1, 1, 1, 1,
-0.9583144, -0.6391395, -4.040416, 1, 1, 1, 1, 1,
-0.9525844, -1.51517, -4.427046, 1, 1, 1, 1, 1,
-0.9492764, -0.09601559, -0.2862968, 1, 1, 1, 1, 1,
-0.9491683, 1.028485, 0.1477926, 1, 1, 1, 1, 1,
-0.9406863, -0.2287829, -2.190806, 1, 1, 1, 1, 1,
-0.9370713, 0.9641818, -1.327372, 1, 1, 1, 1, 1,
-0.9359656, -0.186095, -1.350781, 1, 1, 1, 1, 1,
-0.9349445, 0.06832273, -0.4240088, 1, 1, 1, 1, 1,
-0.9319456, 1.027005, 0.7085072, 1, 1, 1, 1, 1,
-0.9174386, -0.6473155, -2.155525, 0, 0, 1, 1, 1,
-0.9127695, 0.168652, -1.768119, 1, 0, 0, 1, 1,
-0.8869262, 0.2143638, -1.959384, 1, 0, 0, 1, 1,
-0.8865984, 1.222553, -0.06410094, 1, 0, 0, 1, 1,
-0.8832083, -0.02767125, -1.735918, 1, 0, 0, 1, 1,
-0.8806774, 1.334238, 1.498955, 1, 0, 0, 1, 1,
-0.8800414, 0.1013049, -0.5930273, 0, 0, 0, 1, 1,
-0.8778957, -0.04966114, -1.631283, 0, 0, 0, 1, 1,
-0.874348, -0.4411246, -3.060693, 0, 0, 0, 1, 1,
-0.8697791, 1.751015, -0.3002733, 0, 0, 0, 1, 1,
-0.868874, 1.126394, -0.3107486, 0, 0, 0, 1, 1,
-0.8597433, 0.005878051, -2.297674, 0, 0, 0, 1, 1,
-0.8579018, 1.806209, 0.1314515, 0, 0, 0, 1, 1,
-0.8548435, -0.5139499, -0.9843579, 1, 1, 1, 1, 1,
-0.8536158, -0.8359335, -1.8388, 1, 1, 1, 1, 1,
-0.8465071, 1.071974, -0.4830304, 1, 1, 1, 1, 1,
-0.8402402, -0.3212852, -0.6574748, 1, 1, 1, 1, 1,
-0.8337308, 0.2893937, -2.183867, 1, 1, 1, 1, 1,
-0.829976, -1.672254, -1.530929, 1, 1, 1, 1, 1,
-0.8248305, -0.03007491, -0.2141473, 1, 1, 1, 1, 1,
-0.8246416, 0.908685, -0.8829142, 1, 1, 1, 1, 1,
-0.8218819, -0.3686064, -4.090145, 1, 1, 1, 1, 1,
-0.821548, -1.464278, -3.429034, 1, 1, 1, 1, 1,
-0.8215328, -0.5622095, -2.040542, 1, 1, 1, 1, 1,
-0.8195353, -0.0124622, -3.008927, 1, 1, 1, 1, 1,
-0.8193404, 0.5895328, -0.8778923, 1, 1, 1, 1, 1,
-0.8026264, 0.5620129, -2.438585, 1, 1, 1, 1, 1,
-0.7905141, -0.6729559, -2.60499, 1, 1, 1, 1, 1,
-0.7874495, 1.576291, -1.683766, 0, 0, 1, 1, 1,
-0.7846516, 0.7706342, 0.2708782, 1, 0, 0, 1, 1,
-0.7794325, -0.6115463, -0.8203019, 1, 0, 0, 1, 1,
-0.7784933, -0.2007577, -3.064993, 1, 0, 0, 1, 1,
-0.7780797, 0.196009, -3.773587, 1, 0, 0, 1, 1,
-0.7780732, -0.5123255, -1.564659, 1, 0, 0, 1, 1,
-0.7775767, 1.429032, 0.6763421, 0, 0, 0, 1, 1,
-0.7706742, 1.128036, 0.6533704, 0, 0, 0, 1, 1,
-0.76232, 0.5567433, -0.8241233, 0, 0, 0, 1, 1,
-0.7555852, 0.2851419, -0.8529433, 0, 0, 0, 1, 1,
-0.7543401, 0.3281943, -1.484179, 0, 0, 0, 1, 1,
-0.751639, 0.3039799, -0.8167276, 0, 0, 0, 1, 1,
-0.751614, -0.06744567, -1.268259, 0, 0, 0, 1, 1,
-0.7509575, 1.09008, -1.817225, 1, 1, 1, 1, 1,
-0.7466106, -1.082293, -3.968876, 1, 1, 1, 1, 1,
-0.746331, -0.3635154, -3.064054, 1, 1, 1, 1, 1,
-0.7446007, -0.5480209, -1.56215, 1, 1, 1, 1, 1,
-0.7436783, 0.3146168, -1.35867, 1, 1, 1, 1, 1,
-0.7392414, -0.3499441, -2.565811, 1, 1, 1, 1, 1,
-0.7369492, -0.04488563, -2.700157, 1, 1, 1, 1, 1,
-0.7347516, -0.5578656, -2.184148, 1, 1, 1, 1, 1,
-0.7332551, 1.064037, -2.27385, 1, 1, 1, 1, 1,
-0.7285796, -0.2119878, -1.568543, 1, 1, 1, 1, 1,
-0.7258035, 0.7965993, -0.1909974, 1, 1, 1, 1, 1,
-0.7248807, -1.512059, -2.846173, 1, 1, 1, 1, 1,
-0.7233903, -0.5850776, -1.843919, 1, 1, 1, 1, 1,
-0.720041, -0.372844, -1.814394, 1, 1, 1, 1, 1,
-0.7154502, -0.9973433, -1.580147, 1, 1, 1, 1, 1,
-0.7123183, -1.427396, -0.2044361, 0, 0, 1, 1, 1,
-0.7102774, 0.327865, -0.6485757, 1, 0, 0, 1, 1,
-0.7042031, 0.5935434, -1.31474, 1, 0, 0, 1, 1,
-0.701189, -1.164787, -3.668557, 1, 0, 0, 1, 1,
-0.6964536, 0.2704192, -1.438692, 1, 0, 0, 1, 1,
-0.6931219, -0.2355083, -3.350399, 1, 0, 0, 1, 1,
-0.6816443, -0.7325097, -0.8204653, 0, 0, 0, 1, 1,
-0.6808913, 2.103616, 0.8457603, 0, 0, 0, 1, 1,
-0.6790725, -0.4382517, -2.114607, 0, 0, 0, 1, 1,
-0.6763094, -0.3013421, -1.804571, 0, 0, 0, 1, 1,
-0.6747185, -0.2654996, -0.3522747, 0, 0, 0, 1, 1,
-0.6712837, -0.8060917, -1.89647, 0, 0, 0, 1, 1,
-0.6692718, -1.316884, -2.306861, 0, 0, 0, 1, 1,
-0.6690482, 1.047307, -1.191301, 1, 1, 1, 1, 1,
-0.6638702, 0.1619349, -0.9197389, 1, 1, 1, 1, 1,
-0.6586069, -0.3963034, -0.3922718, 1, 1, 1, 1, 1,
-0.6555513, 1.99344, -1.560238, 1, 1, 1, 1, 1,
-0.6553702, -0.08395807, -1.347312, 1, 1, 1, 1, 1,
-0.6525365, -0.2394897, -1.303037, 1, 1, 1, 1, 1,
-0.650869, -1.221272, -2.209715, 1, 1, 1, 1, 1,
-0.6467599, 0.1793925, 0.1996776, 1, 1, 1, 1, 1,
-0.6456316, -1.054585, -2.775357, 1, 1, 1, 1, 1,
-0.6390772, 0.04331528, -0.2707258, 1, 1, 1, 1, 1,
-0.633628, -0.8042282, -2.323078, 1, 1, 1, 1, 1,
-0.6318825, 0.7468085, -2.162206, 1, 1, 1, 1, 1,
-0.6234326, 2.294051, 0.5230951, 1, 1, 1, 1, 1,
-0.6224756, -0.9512852, -1.430361, 1, 1, 1, 1, 1,
-0.619722, 0.9907794, 0.06408642, 1, 1, 1, 1, 1,
-0.6174948, -0.5105705, -2.848944, 0, 0, 1, 1, 1,
-0.6150327, 0.3025377, -1.19688, 1, 0, 0, 1, 1,
-0.6121021, -0.195158, -1.397399, 1, 0, 0, 1, 1,
-0.6095868, 1.060814, 0.1546796, 1, 0, 0, 1, 1,
-0.601977, -0.4610547, -1.475034, 1, 0, 0, 1, 1,
-0.6011636, -0.7215657, -1.489098, 1, 0, 0, 1, 1,
-0.5988897, -0.06207687, -0.4141666, 0, 0, 0, 1, 1,
-0.5833427, -0.1762743, -2.964658, 0, 0, 0, 1, 1,
-0.5792795, 1.384463, -1.937346, 0, 0, 0, 1, 1,
-0.5792362, 1.469233, -2.2128, 0, 0, 0, 1, 1,
-0.5781156, -0.06240025, -2.035987, 0, 0, 0, 1, 1,
-0.5741121, -0.1838032, -0.9545581, 0, 0, 0, 1, 1,
-0.573396, -0.9224163, -3.218775, 0, 0, 0, 1, 1,
-0.5732667, 0.4192432, -0.1947203, 1, 1, 1, 1, 1,
-0.5644184, 1.219984, -1.65782, 1, 1, 1, 1, 1,
-0.5637764, 2.224884, 1.9344, 1, 1, 1, 1, 1,
-0.562892, -0.9198765, -4.166669, 1, 1, 1, 1, 1,
-0.5564597, 0.6291056, 0.4994381, 1, 1, 1, 1, 1,
-0.5557643, 1.66143, 0.3564568, 1, 1, 1, 1, 1,
-0.5542488, -0.6890824, -2.662412, 1, 1, 1, 1, 1,
-0.5537659, 1.600703, -1.439242, 1, 1, 1, 1, 1,
-0.5530715, 0.7005607, -0.8756923, 1, 1, 1, 1, 1,
-0.5507358, 0.1277001, -1.256826, 1, 1, 1, 1, 1,
-0.5404645, -0.8881393, -1.347303, 1, 1, 1, 1, 1,
-0.539857, -0.09724206, -1.828928, 1, 1, 1, 1, 1,
-0.537962, 2.14941, 1.618024, 1, 1, 1, 1, 1,
-0.53365, 0.06266994, -0.332323, 1, 1, 1, 1, 1,
-0.5286306, 0.6276661, -0.5670767, 1, 1, 1, 1, 1,
-0.5239804, 0.5890174, 0.3646786, 0, 0, 1, 1, 1,
-0.5231726, 0.06612175, -0.2586465, 1, 0, 0, 1, 1,
-0.5174102, 1.430438, -0.9102873, 1, 0, 0, 1, 1,
-0.509223, 0.4639692, -1.242444, 1, 0, 0, 1, 1,
-0.5083015, 1.618608, -1.433497, 1, 0, 0, 1, 1,
-0.5032908, 0.5754474, -1.232447, 1, 0, 0, 1, 1,
-0.5015395, 0.1991428, -0.9847728, 0, 0, 0, 1, 1,
-0.4969127, -1.017796, -1.425048, 0, 0, 0, 1, 1,
-0.4959214, 1.172222, 1.100617, 0, 0, 0, 1, 1,
-0.4883697, -0.2865828, -0.5485941, 0, 0, 0, 1, 1,
-0.4863763, -1.302008, -4.118045, 0, 0, 0, 1, 1,
-0.4816852, 0.4481003, -2.309323, 0, 0, 0, 1, 1,
-0.4815283, -1.391631, -3.860794, 0, 0, 0, 1, 1,
-0.4781742, 0.8777658, -1.111347, 1, 1, 1, 1, 1,
-0.473774, -0.09408034, -3.359909, 1, 1, 1, 1, 1,
-0.4670753, 0.8640544, 1.326262, 1, 1, 1, 1, 1,
-0.4570126, -0.1880389, -0.9079508, 1, 1, 1, 1, 1,
-0.4566678, 0.08112844, -1.978779, 1, 1, 1, 1, 1,
-0.4513203, 0.7156992, -1.706536, 1, 1, 1, 1, 1,
-0.4447594, 1.219908, 0.4379779, 1, 1, 1, 1, 1,
-0.4413874, -0.6112814, -4.978499, 1, 1, 1, 1, 1,
-0.4397386, -0.2583367, -3.52115, 1, 1, 1, 1, 1,
-0.4395705, 0.441406, 0.2608286, 1, 1, 1, 1, 1,
-0.4359463, 2.217247, -1.491226, 1, 1, 1, 1, 1,
-0.4347377, -0.205979, -2.551617, 1, 1, 1, 1, 1,
-0.4267986, 0.3375876, -0.8631831, 1, 1, 1, 1, 1,
-0.4234427, -1.638063, -4.647586, 1, 1, 1, 1, 1,
-0.4212849, -0.08461131, -1.866256, 1, 1, 1, 1, 1,
-0.417364, 0.7699329, 0.2201119, 0, 0, 1, 1, 1,
-0.4091827, -1.033775, -3.987222, 1, 0, 0, 1, 1,
-0.4084719, 0.03156226, -1.496446, 1, 0, 0, 1, 1,
-0.4073585, -0.3269035, -2.79707, 1, 0, 0, 1, 1,
-0.3981954, -1.415868, -3.029789, 1, 0, 0, 1, 1,
-0.3960481, -2.192295, -2.0486, 1, 0, 0, 1, 1,
-0.396034, -0.3062959, -3.569004, 0, 0, 0, 1, 1,
-0.3954354, 1.282318, -0.9039435, 0, 0, 0, 1, 1,
-0.3947318, -1.575619, -4.432553, 0, 0, 0, 1, 1,
-0.3942634, -0.2099715, -1.209737, 0, 0, 0, 1, 1,
-0.3939469, -0.3102824, -2.885367, 0, 0, 0, 1, 1,
-0.3916168, -0.9237837, -2.599829, 0, 0, 0, 1, 1,
-0.3915449, -1.991867, -3.046337, 0, 0, 0, 1, 1,
-0.3893421, -0.6385465, -3.738349, 1, 1, 1, 1, 1,
-0.3856605, 0.3016362, -1.18523, 1, 1, 1, 1, 1,
-0.385236, 1.801273, 0.09813403, 1, 1, 1, 1, 1,
-0.3835669, 1.642394, -0.9189354, 1, 1, 1, 1, 1,
-0.3769609, 0.3584509, -0.3844844, 1, 1, 1, 1, 1,
-0.3758019, -1.914256, -3.904061, 1, 1, 1, 1, 1,
-0.3752382, -0.1667884, -0.6496624, 1, 1, 1, 1, 1,
-0.3745696, -1.511159, -3.470347, 1, 1, 1, 1, 1,
-0.3741898, 0.8134213, -0.3820731, 1, 1, 1, 1, 1,
-0.3725151, -0.0327638, -2.226109, 1, 1, 1, 1, 1,
-0.3710373, -0.6667957, -4.203205, 1, 1, 1, 1, 1,
-0.3575687, 0.2716655, -1.443109, 1, 1, 1, 1, 1,
-0.354936, 0.01143613, -2.417883, 1, 1, 1, 1, 1,
-0.352926, -0.2110329, -3.152232, 1, 1, 1, 1, 1,
-0.3528291, -0.7596819, -2.50717, 1, 1, 1, 1, 1,
-0.3504842, -1.149412, -2.117901, 0, 0, 1, 1, 1,
-0.3478768, -0.3570244, -1.443104, 1, 0, 0, 1, 1,
-0.3375007, 1.723897, 0.7408781, 1, 0, 0, 1, 1,
-0.3373053, 0.2951718, -2.147965, 1, 0, 0, 1, 1,
-0.3363906, 0.2497937, -0.01110824, 1, 0, 0, 1, 1,
-0.3354639, 0.02079291, -3.045253, 1, 0, 0, 1, 1,
-0.3326672, 2.657734, -1.517014, 0, 0, 0, 1, 1,
-0.3311478, 0.07733443, -0.4831878, 0, 0, 0, 1, 1,
-0.3280455, 0.8004598, -1.334567, 0, 0, 0, 1, 1,
-0.3266144, -0.9169087, -2.484015, 0, 0, 0, 1, 1,
-0.3263025, 0.6907929, -0.1246054, 0, 0, 0, 1, 1,
-0.3260153, 1.091601, 0.5213079, 0, 0, 0, 1, 1,
-0.3225015, 1.389374, 0.3415272, 0, 0, 0, 1, 1,
-0.3218326, 2.37633, -1.098897, 1, 1, 1, 1, 1,
-0.3208162, 2.153196, -0.9074131, 1, 1, 1, 1, 1,
-0.3201377, -1.741818, -2.233464, 1, 1, 1, 1, 1,
-0.3182258, 1.271905, 1.228342, 1, 1, 1, 1, 1,
-0.3174314, -2.576582, -2.828859, 1, 1, 1, 1, 1,
-0.3103787, -0.6970386, -1.960056, 1, 1, 1, 1, 1,
-0.3099755, -0.4267918, -0.05555398, 1, 1, 1, 1, 1,
-0.3079632, 1.141266, -0.967308, 1, 1, 1, 1, 1,
-0.3066179, -1.442642, -2.815001, 1, 1, 1, 1, 1,
-0.2996013, -0.6719251, -2.445156, 1, 1, 1, 1, 1,
-0.2984096, -0.7735285, -4.501245, 1, 1, 1, 1, 1,
-0.2967408, -0.6620284, -2.273212, 1, 1, 1, 1, 1,
-0.2945088, 1.115093, -0.3721067, 1, 1, 1, 1, 1,
-0.2926383, -0.873842, -2.485841, 1, 1, 1, 1, 1,
-0.2909656, 0.1266596, 0.5706121, 1, 1, 1, 1, 1,
-0.2851624, 0.4328397, 0.1081298, 0, 0, 1, 1, 1,
-0.2756322, 0.4589696, -0.3973482, 1, 0, 0, 1, 1,
-0.2738095, -1.321014, -3.499887, 1, 0, 0, 1, 1,
-0.2731788, -0.4926399, -2.389201, 1, 0, 0, 1, 1,
-0.2668682, -0.4423421, -1.641329, 1, 0, 0, 1, 1,
-0.264191, 1.093441, 0.2961625, 1, 0, 0, 1, 1,
-0.2623074, 0.2407673, -1.166237, 0, 0, 0, 1, 1,
-0.2617826, 2.032721, -0.4006518, 0, 0, 0, 1, 1,
-0.2608393, -1.450853, -0.7835155, 0, 0, 0, 1, 1,
-0.2576958, 0.07894307, -1.980472, 0, 0, 0, 1, 1,
-0.2507794, -0.9967365, -2.631463, 0, 0, 0, 1, 1,
-0.2476521, -1.866645, -3.309993, 0, 0, 0, 1, 1,
-0.2455067, 0.2850015, -0.9303806, 0, 0, 0, 1, 1,
-0.2452075, -0.2200642, -3.596356, 1, 1, 1, 1, 1,
-0.2448699, 0.01383161, -0.9502448, 1, 1, 1, 1, 1,
-0.239654, -1.239672, -2.940296, 1, 1, 1, 1, 1,
-0.2396214, 0.6294438, 1.220051, 1, 1, 1, 1, 1,
-0.2389709, 1.695737, 0.1153703, 1, 1, 1, 1, 1,
-0.2387799, -0.7437353, -2.887765, 1, 1, 1, 1, 1,
-0.2333753, 0.1829131, 0.4723511, 1, 1, 1, 1, 1,
-0.2295229, -1.559951, -3.009807, 1, 1, 1, 1, 1,
-0.2290733, 1.094208, -1.706173, 1, 1, 1, 1, 1,
-0.2277519, 0.05812246, -2.307866, 1, 1, 1, 1, 1,
-0.2249759, 1.587369, -0.2736057, 1, 1, 1, 1, 1,
-0.224547, -0.8825853, -1.319788, 1, 1, 1, 1, 1,
-0.2218382, -0.1322954, -2.689148, 1, 1, 1, 1, 1,
-0.2214811, -1.534636, -3.428841, 1, 1, 1, 1, 1,
-0.2185711, -1.928565, -3.183454, 1, 1, 1, 1, 1,
-0.2149938, 1.278999, 0.568857, 0, 0, 1, 1, 1,
-0.2146627, 1.121305, -0.7880738, 1, 0, 0, 1, 1,
-0.2145788, -0.8078139, -1.144578, 1, 0, 0, 1, 1,
-0.2113228, 0.01412939, -0.5249512, 1, 0, 0, 1, 1,
-0.2084525, -0.8487948, -3.345799, 1, 0, 0, 1, 1,
-0.2071325, -0.3431914, -2.324812, 1, 0, 0, 1, 1,
-0.2008657, 1.516963, -0.3890235, 0, 0, 0, 1, 1,
-0.1990541, -1.736019, -3.034925, 0, 0, 0, 1, 1,
-0.1974267, 0.3206028, 0.02065043, 0, 0, 0, 1, 1,
-0.1972929, -0.6708279, -2.312102, 0, 0, 0, 1, 1,
-0.1971476, -0.1667592, -4.077775, 0, 0, 0, 1, 1,
-0.1969946, -1.349394, -5.089407, 0, 0, 0, 1, 1,
-0.1961422, -0.8493236, -1.508696, 0, 0, 0, 1, 1,
-0.1932476, -0.8343555, -4.744488, 1, 1, 1, 1, 1,
-0.1930143, -1.172119, -4.758099, 1, 1, 1, 1, 1,
-0.1927624, 0.4029528, -1.147523, 1, 1, 1, 1, 1,
-0.1878731, 0.5760233, -1.193281, 1, 1, 1, 1, 1,
-0.1867169, 1.332797, 1.107131, 1, 1, 1, 1, 1,
-0.1820419, 1.550407, 0.8029112, 1, 1, 1, 1, 1,
-0.1817467, -1.64155, -2.62086, 1, 1, 1, 1, 1,
-0.1804316, 0.7270173, -1.818461, 1, 1, 1, 1, 1,
-0.1773882, -0.3877153, -3.625973, 1, 1, 1, 1, 1,
-0.1754861, -1.487551, -4.056117, 1, 1, 1, 1, 1,
-0.1745208, 0.4279682, -1.78076, 1, 1, 1, 1, 1,
-0.1745159, -1.381238, -3.047965, 1, 1, 1, 1, 1,
-0.1741631, -0.7949908, -3.775229, 1, 1, 1, 1, 1,
-0.1695279, -0.8154615, -1.514048, 1, 1, 1, 1, 1,
-0.1678316, 0.4221971, 0.7741331, 1, 1, 1, 1, 1,
-0.1653824, 1.235168, -0.622063, 0, 0, 1, 1, 1,
-0.1621785, -0.5737675, -1.676721, 1, 0, 0, 1, 1,
-0.1554931, -0.3090129, -3.967949, 1, 0, 0, 1, 1,
-0.1553866, 0.4239473, -0.2555734, 1, 0, 0, 1, 1,
-0.1521471, -1.918464, -3.096662, 1, 0, 0, 1, 1,
-0.1510644, 0.5968435, -0.8873054, 1, 0, 0, 1, 1,
-0.1491115, 2.386349, 0.138181, 0, 0, 0, 1, 1,
-0.1478474, 0.8752911, -3.020692, 0, 0, 0, 1, 1,
-0.1457178, -0.0471453, 0.006051668, 0, 0, 0, 1, 1,
-0.141806, 1.545262, 0.8655387, 0, 0, 0, 1, 1,
-0.1410141, -0.9258848, -3.072104, 0, 0, 0, 1, 1,
-0.1401488, 1.07773, 0.220946, 0, 0, 0, 1, 1,
-0.1379464, -1.32717, -2.312608, 0, 0, 0, 1, 1,
-0.1364373, 0.2301344, 0.4839695, 1, 1, 1, 1, 1,
-0.1358511, 1.55322, 1.327216, 1, 1, 1, 1, 1,
-0.1340643, -0.5822641, -2.175946, 1, 1, 1, 1, 1,
-0.1325435, 0.02796327, -1.657417, 1, 1, 1, 1, 1,
-0.1308467, 0.5752947, 1.00315, 1, 1, 1, 1, 1,
-0.1288405, 0.7672158, -0.6886967, 1, 1, 1, 1, 1,
-0.1267283, 1.446754, 0.6226571, 1, 1, 1, 1, 1,
-0.1263932, -1.389646, -2.076534, 1, 1, 1, 1, 1,
-0.1252494, 0.2255297, -0.1175658, 1, 1, 1, 1, 1,
-0.1184278, -1.078132, -2.734392, 1, 1, 1, 1, 1,
-0.1172275, 0.7409816, 1.103631, 1, 1, 1, 1, 1,
-0.1135848, -0.3120027, -2.421944, 1, 1, 1, 1, 1,
-0.1114525, 0.201335, -1.431089, 1, 1, 1, 1, 1,
-0.1107655, 0.7233747, -1.979525, 1, 1, 1, 1, 1,
-0.1083452, 1.351761, -0.4664868, 1, 1, 1, 1, 1,
-0.1062201, 0.7411655, 0.2869541, 0, 0, 1, 1, 1,
-0.1027943, 0.6949087, -0.06693241, 1, 0, 0, 1, 1,
-0.09917275, -1.205569, -3.159168, 1, 0, 0, 1, 1,
-0.09833588, 0.7919508, 0.04604718, 1, 0, 0, 1, 1,
-0.0951907, 2.120958, -0.6225488, 1, 0, 0, 1, 1,
-0.09421762, 0.1410705, -0.04631018, 1, 0, 0, 1, 1,
-0.08793683, 0.8595396, -0.3293056, 0, 0, 0, 1, 1,
-0.08499131, -0.7358426, -2.00645, 0, 0, 0, 1, 1,
-0.08179725, -1.623587, -2.794004, 0, 0, 0, 1, 1,
-0.08036485, 0.1829158, -0.6139145, 0, 0, 0, 1, 1,
-0.07841103, 1.315035, 0.2968892, 0, 0, 0, 1, 1,
-0.07827707, 1.310878, 0.1195545, 0, 0, 0, 1, 1,
-0.07707448, 0.1136893, -0.7988008, 0, 0, 0, 1, 1,
-0.07703156, 0.08637472, -0.0651667, 1, 1, 1, 1, 1,
-0.06729089, -0.8473233, -3.731867, 1, 1, 1, 1, 1,
-0.06094364, 1.150401, 2.207205, 1, 1, 1, 1, 1,
-0.05856469, -0.2932904, -2.702788, 1, 1, 1, 1, 1,
-0.05795158, 1.398783, -0.4523515, 1, 1, 1, 1, 1,
-0.05792588, 0.2972684, -0.3165085, 1, 1, 1, 1, 1,
-0.05396193, 0.595009, -0.8617398, 1, 1, 1, 1, 1,
-0.05350447, 0.6621445, 0.6526648, 1, 1, 1, 1, 1,
-0.05102193, 0.5373244, 1.159083, 1, 1, 1, 1, 1,
-0.05009105, -0.4657157, -2.504476, 1, 1, 1, 1, 1,
-0.04516879, 0.8809073, -0.6720563, 1, 1, 1, 1, 1,
-0.04477696, 1.596846, -2.588556, 1, 1, 1, 1, 1,
-0.04075189, 0.1682303, -0.4289288, 1, 1, 1, 1, 1,
-0.03307888, -0.8781993, -2.186925, 1, 1, 1, 1, 1,
-0.03127598, 1.039431, -0.2957016, 1, 1, 1, 1, 1,
-0.03122876, 0.3431085, 0.01588539, 0, 0, 1, 1, 1,
-0.02594682, -0.3324565, -4.06733, 1, 0, 0, 1, 1,
-0.02433898, 0.2305271, -0.544116, 1, 0, 0, 1, 1,
-0.02394943, 1.105371, -0.702952, 1, 0, 0, 1, 1,
-0.0217275, 0.8785312, 1.157612, 1, 0, 0, 1, 1,
-0.02096314, -0.2961122, -3.325647, 1, 0, 0, 1, 1,
-0.02062531, -0.1037835, -1.913504, 0, 0, 0, 1, 1,
-0.02042426, 1.055913, 1.898574, 0, 0, 0, 1, 1,
-0.02031976, 0.7545937, -0.7885877, 0, 0, 0, 1, 1,
-0.01825332, 1.577448, -0.343202, 0, 0, 0, 1, 1,
-0.01290312, -0.763125, -2.894406, 0, 0, 0, 1, 1,
-0.01078348, 0.3602382, -0.8990493, 0, 0, 0, 1, 1,
-0.0076326, 1.25859, 0.1699595, 0, 0, 0, 1, 1,
-0.006241613, -1.239075, -3.613077, 1, 1, 1, 1, 1,
-0.0008252195, -0.8137619, -2.776826, 1, 1, 1, 1, 1,
0.001179005, 0.4598781, -2.263876, 1, 1, 1, 1, 1,
0.00343378, 1.111126, -0.7915087, 1, 1, 1, 1, 1,
0.004556195, -0.1325657, 3.501417, 1, 1, 1, 1, 1,
0.00580765, -0.360129, 4.149891, 1, 1, 1, 1, 1,
0.006175699, 0.2041144, 0.5156071, 1, 1, 1, 1, 1,
0.006536639, -1.124879, 3.373734, 1, 1, 1, 1, 1,
0.008564838, 0.6539978, -0.5353997, 1, 1, 1, 1, 1,
0.01108652, 1.136554, -0.07477915, 1, 1, 1, 1, 1,
0.01209777, 1.500437, 0.6105457, 1, 1, 1, 1, 1,
0.01848232, 0.001399469, 0.3179897, 1, 1, 1, 1, 1,
0.01853011, -0.9061972, 2.41672, 1, 1, 1, 1, 1,
0.02071392, -0.00388223, 1.495162, 1, 1, 1, 1, 1,
0.02167396, -0.4404546, 2.58517, 1, 1, 1, 1, 1,
0.02274217, -1.064117, 1.498436, 0, 0, 1, 1, 1,
0.02616057, 0.1541706, 0.4802348, 1, 0, 0, 1, 1,
0.02771812, 0.05841255, 0.2805673, 1, 0, 0, 1, 1,
0.02918879, 0.7768377, -1.183045, 1, 0, 0, 1, 1,
0.03003371, 1.51176, 0.6659459, 1, 0, 0, 1, 1,
0.03310468, 1.202834, -0.05221737, 1, 0, 0, 1, 1,
0.0343013, 0.5078052, -1.31855, 0, 0, 0, 1, 1,
0.03761386, -0.8324811, 3.570599, 0, 0, 0, 1, 1,
0.03861148, 0.8758329, -2.70266, 0, 0, 0, 1, 1,
0.04298143, -0.6425692, 3.302727, 0, 0, 0, 1, 1,
0.04500685, 0.4263014, -1.468907, 0, 0, 0, 1, 1,
0.04963572, 1.776185, 0.0538991, 0, 0, 0, 1, 1,
0.05284336, 1.766875, -0.78042, 0, 0, 0, 1, 1,
0.05501221, -1.987806, 2.279088, 1, 1, 1, 1, 1,
0.05537998, -0.5326139, 2.454939, 1, 1, 1, 1, 1,
0.05693882, 0.7657813, 0.385208, 1, 1, 1, 1, 1,
0.05875285, -0.5605135, 3.955653, 1, 1, 1, 1, 1,
0.0598686, 0.04024443, 0.6537901, 1, 1, 1, 1, 1,
0.07041906, -1.014576, 2.333094, 1, 1, 1, 1, 1,
0.07193549, 2.935909, -0.1131691, 1, 1, 1, 1, 1,
0.0724685, 0.5268047, 0.8741502, 1, 1, 1, 1, 1,
0.07312736, 0.5028044, 2.839503, 1, 1, 1, 1, 1,
0.08112657, -0.238713, 2.948191, 1, 1, 1, 1, 1,
0.0821674, -0.06414814, 3.840495, 1, 1, 1, 1, 1,
0.08465134, -0.978898, 2.845356, 1, 1, 1, 1, 1,
0.08674227, -0.4032315, 2.591742, 1, 1, 1, 1, 1,
0.08919192, -0.2500663, 2.870335, 1, 1, 1, 1, 1,
0.08953904, 1.040848, 0.2867633, 1, 1, 1, 1, 1,
0.09465799, -1.470611, 2.823396, 0, 0, 1, 1, 1,
0.09811413, 0.06606288, 0.234834, 1, 0, 0, 1, 1,
0.09989155, 1.031853, -0.9795709, 1, 0, 0, 1, 1,
0.1052495, -0.1390458, 3.219892, 1, 0, 0, 1, 1,
0.1064888, 1.198046, 1.025782, 1, 0, 0, 1, 1,
0.1068403, -0.3552468, 2.934749, 1, 0, 0, 1, 1,
0.1104995, -0.8768689, 3.510964, 0, 0, 0, 1, 1,
0.1111817, -0.6044617, 1.74488, 0, 0, 0, 1, 1,
0.1165069, -0.8837827, 4.604192, 0, 0, 0, 1, 1,
0.1165428, -0.4447288, 2.117351, 0, 0, 0, 1, 1,
0.1176309, 2.397998, -1.846916, 0, 0, 0, 1, 1,
0.1254461, -1.304747, 4.788406, 0, 0, 0, 1, 1,
0.1281312, 1.401107, -0.7920622, 0, 0, 0, 1, 1,
0.1282786, 0.1211675, 0.8970637, 1, 1, 1, 1, 1,
0.1451156, 0.7354785, -0.6585023, 1, 1, 1, 1, 1,
0.1462697, -0.8629127, 2.247968, 1, 1, 1, 1, 1,
0.152517, -0.3498017, 3.271502, 1, 1, 1, 1, 1,
0.1527947, -0.1976015, 3.040154, 1, 1, 1, 1, 1,
0.1542886, -0.1628646, 3.490752, 1, 1, 1, 1, 1,
0.1543032, 1.856479, 0.01551632, 1, 1, 1, 1, 1,
0.1577873, -0.1275959, 1.951277, 1, 1, 1, 1, 1,
0.1613745, -0.6721412, 2.772019, 1, 1, 1, 1, 1,
0.1743091, 0.5504957, -0.748462, 1, 1, 1, 1, 1,
0.1769079, -0.4917184, 2.670407, 1, 1, 1, 1, 1,
0.1783495, -0.1448563, 2.357859, 1, 1, 1, 1, 1,
0.1784839, 0.7793425, 2.421137, 1, 1, 1, 1, 1,
0.1794308, 0.5732608, -0.801618, 1, 1, 1, 1, 1,
0.1797436, -0.9472096, 5.266504, 1, 1, 1, 1, 1,
0.1824228, 0.4809787, -0.2157858, 0, 0, 1, 1, 1,
0.18401, 0.3759603, 0.1531904, 1, 0, 0, 1, 1,
0.1868702, 0.6467462, 0.7179446, 1, 0, 0, 1, 1,
0.1881609, -0.6383485, 2.498518, 1, 0, 0, 1, 1,
0.1906321, -1.406441, 3.076309, 1, 0, 0, 1, 1,
0.1919623, 1.485719, 1.699788, 1, 0, 0, 1, 1,
0.1942178, -0.06268964, 1.645462, 0, 0, 0, 1, 1,
0.1947277, -1.456284, 3.11899, 0, 0, 0, 1, 1,
0.2053996, 0.000775681, 2.990241, 0, 0, 0, 1, 1,
0.2079533, -0.4682812, 1.788053, 0, 0, 0, 1, 1,
0.2087552, -1.447003, 2.752943, 0, 0, 0, 1, 1,
0.213185, 1.221941, -0.5639461, 0, 0, 0, 1, 1,
0.2199067, 0.3356358, 0.6429037, 0, 0, 0, 1, 1,
0.220723, -0.362214, 3.878362, 1, 1, 1, 1, 1,
0.2229373, -0.7224278, 3.004652, 1, 1, 1, 1, 1,
0.2236762, 0.1254809, -0.7771735, 1, 1, 1, 1, 1,
0.2293282, -0.1789527, 2.770638, 1, 1, 1, 1, 1,
0.2390775, -1.021608, 4.286029, 1, 1, 1, 1, 1,
0.2401576, 0.6819248, 2.169863, 1, 1, 1, 1, 1,
0.2441398, 1.505294, 1.40814, 1, 1, 1, 1, 1,
0.2453979, 0.1151666, 0.2824626, 1, 1, 1, 1, 1,
0.2454508, 1.663095, 0.3440308, 1, 1, 1, 1, 1,
0.2483815, 1.211809, -0.8427529, 1, 1, 1, 1, 1,
0.2500307, 0.1445253, 1.397651, 1, 1, 1, 1, 1,
0.2506615, -0.1887903, 2.680335, 1, 1, 1, 1, 1,
0.2575683, 1.012492, 1.455493, 1, 1, 1, 1, 1,
0.2577073, -1.345329, 2.700558, 1, 1, 1, 1, 1,
0.2584029, -0.6211687, 1.961663, 1, 1, 1, 1, 1,
0.2602877, -0.2118332, 1.510676, 0, 0, 1, 1, 1,
0.2604053, 0.898129, -0.4957365, 1, 0, 0, 1, 1,
0.2625708, 1.899948, 0.210291, 1, 0, 0, 1, 1,
0.2705272, -0.2682354, 3.065849, 1, 0, 0, 1, 1,
0.2757427, -1.201089, 3.570478, 1, 0, 0, 1, 1,
0.2769626, -0.02446071, 2.099925, 1, 0, 0, 1, 1,
0.2771145, -0.518236, 2.336995, 0, 0, 0, 1, 1,
0.2825633, -0.1031563, 2.360595, 0, 0, 0, 1, 1,
0.2846905, -0.6692401, 2.557829, 0, 0, 0, 1, 1,
0.2859649, -1.367175, 4.288752, 0, 0, 0, 1, 1,
0.2948382, -0.7124504, 2.94769, 0, 0, 0, 1, 1,
0.2950449, 0.2929433, 0.508897, 0, 0, 0, 1, 1,
0.2956446, -0.04625615, 1.588136, 0, 0, 0, 1, 1,
0.2978358, 0.5827163, 0.2791945, 1, 1, 1, 1, 1,
0.3037372, -0.3492162, 2.364318, 1, 1, 1, 1, 1,
0.3049551, -1.514138, 2.414615, 1, 1, 1, 1, 1,
0.3071981, 0.4186893, 0.8991686, 1, 1, 1, 1, 1,
0.3100677, -1.81436, 2.106016, 1, 1, 1, 1, 1,
0.3111901, 0.2365445, 2.67098, 1, 1, 1, 1, 1,
0.3150438, 1.460267, -1.312681, 1, 1, 1, 1, 1,
0.3232318, 1.530303, 1.146907, 1, 1, 1, 1, 1,
0.3285821, 0.9566925, -0.2259273, 1, 1, 1, 1, 1,
0.3288674, 0.3835657, -0.176258, 1, 1, 1, 1, 1,
0.332784, -0.2995385, 1.821016, 1, 1, 1, 1, 1,
0.3349496, 0.7679937, 0.1042993, 1, 1, 1, 1, 1,
0.3357887, 0.8608691, 0.05381712, 1, 1, 1, 1, 1,
0.3400259, 0.5885648, -0.7941105, 1, 1, 1, 1, 1,
0.3472088, 1.511443, 0.3341914, 1, 1, 1, 1, 1,
0.3508089, 0.5711548, 1.316447, 0, 0, 1, 1, 1,
0.3515739, 0.8069117, 0.1065306, 1, 0, 0, 1, 1,
0.3600096, -2.758194, 2.982788, 1, 0, 0, 1, 1,
0.3640102, 1.086152, 1.254509, 1, 0, 0, 1, 1,
0.3669372, -0.5321467, 0.7849048, 1, 0, 0, 1, 1,
0.3673471, -0.2343768, 1.643391, 1, 0, 0, 1, 1,
0.3680983, 1.214288, 0.31616, 0, 0, 0, 1, 1,
0.3688082, 0.337116, 1.720785, 0, 0, 0, 1, 1,
0.3690504, -0.8791331, 3.988289, 0, 0, 0, 1, 1,
0.3753071, -0.4652103, 2.730914, 0, 0, 0, 1, 1,
0.3755414, 1.195867, 0.03523559, 0, 0, 0, 1, 1,
0.3768597, -0.6676965, 2.231225, 0, 0, 0, 1, 1,
0.3790264, -1.502478, 3.521118, 0, 0, 0, 1, 1,
0.3807186, 1.367586, 2.20373, 1, 1, 1, 1, 1,
0.3816015, -0.3933999, 4.981315, 1, 1, 1, 1, 1,
0.3820592, -0.5462441, 4.188377, 1, 1, 1, 1, 1,
0.3842533, 0.7090613, 1.046396, 1, 1, 1, 1, 1,
0.3868797, -0.759995, 2.575566, 1, 1, 1, 1, 1,
0.3888771, 1.307312, 1.678645, 1, 1, 1, 1, 1,
0.3954076, 0.4193355, 1.569816, 1, 1, 1, 1, 1,
0.4022127, 0.1075272, 2.130115, 1, 1, 1, 1, 1,
0.403711, 0.1220087, 0.7720088, 1, 1, 1, 1, 1,
0.403976, -2.101536, 4.014666, 1, 1, 1, 1, 1,
0.4044711, -0.5593885, 1.968932, 1, 1, 1, 1, 1,
0.4093448, -1.301428, 4.706254, 1, 1, 1, 1, 1,
0.4128644, -0.7661929, 4.112724, 1, 1, 1, 1, 1,
0.4154001, -1.460407, 4.005217, 1, 1, 1, 1, 1,
0.416205, -0.3567872, 0.2086751, 1, 1, 1, 1, 1,
0.4162781, -0.8293502, 2.091055, 0, 0, 1, 1, 1,
0.4169687, 0.1336272, 1.774521, 1, 0, 0, 1, 1,
0.4189564, -1.870762, 5.098799, 1, 0, 0, 1, 1,
0.4191815, 1.030968, -0.5095336, 1, 0, 0, 1, 1,
0.4192741, -0.8454308, 3.382837, 1, 0, 0, 1, 1,
0.422005, -0.1678143, 2.307059, 1, 0, 0, 1, 1,
0.4231815, -0.9008664, 1.557528, 0, 0, 0, 1, 1,
0.4252546, -0.4600852, 2.646777, 0, 0, 0, 1, 1,
0.429832, -1.659538, 2.238112, 0, 0, 0, 1, 1,
0.4318984, -0.4052564, 0.7371019, 0, 0, 0, 1, 1,
0.444319, 2.589229, -1.588186, 0, 0, 0, 1, 1,
0.4479035, 0.6891411, 1.58955, 0, 0, 0, 1, 1,
0.4497918, 0.5962703, 0.09043385, 0, 0, 0, 1, 1,
0.4561551, 0.08976002, 1.957759, 1, 1, 1, 1, 1,
0.4688418, 1.489688, -0.4422389, 1, 1, 1, 1, 1,
0.4689519, 0.1054993, 2.913065, 1, 1, 1, 1, 1,
0.4695168, -0.2529521, 2.13427, 1, 1, 1, 1, 1,
0.4701217, 1.909412, 0.08080407, 1, 1, 1, 1, 1,
0.4704099, -1.305943, 3.378733, 1, 1, 1, 1, 1,
0.471388, -0.4695152, 1.095251, 1, 1, 1, 1, 1,
0.4794657, 0.1074896, 1.607041, 1, 1, 1, 1, 1,
0.4797267, -1.533779, 1.498241, 1, 1, 1, 1, 1,
0.4800245, -0.2562926, 2.295774, 1, 1, 1, 1, 1,
0.4809751, 1.871885, -0.4532869, 1, 1, 1, 1, 1,
0.4813632, 0.4349054, 2.621106, 1, 1, 1, 1, 1,
0.4817932, 0.2465365, 1.646203, 1, 1, 1, 1, 1,
0.4852474, 0.5679227, 0.5820512, 1, 1, 1, 1, 1,
0.486898, 0.7481145, 0.7062156, 1, 1, 1, 1, 1,
0.4874988, -1.066325, 3.391981, 0, 0, 1, 1, 1,
0.4892568, 1.738734, -0.1939068, 1, 0, 0, 1, 1,
0.4895142, 0.6789317, 1.169105, 1, 0, 0, 1, 1,
0.4898002, 0.9381603, 1.378001, 1, 0, 0, 1, 1,
0.4926569, -0.0606305, 0.2284052, 1, 0, 0, 1, 1,
0.501481, -0.9964771, 2.98207, 1, 0, 0, 1, 1,
0.5039397, -0.02848417, 1.535724, 0, 0, 0, 1, 1,
0.5092496, 0.2566006, 2.013768, 0, 0, 0, 1, 1,
0.519522, 0.5406232, -0.2971093, 0, 0, 0, 1, 1,
0.5211225, -1.353539, 1.897865, 0, 0, 0, 1, 1,
0.5211623, -0.7789783, 0.9010489, 0, 0, 0, 1, 1,
0.5247582, -1.409447, 2.975004, 0, 0, 0, 1, 1,
0.5263398, 1.592463, 0.08212031, 0, 0, 0, 1, 1,
0.5267161, 1.09129, 0.3817771, 1, 1, 1, 1, 1,
0.5285908, -1.039292, 1.872523, 1, 1, 1, 1, 1,
0.5380806, -0.6096781, 1.606511, 1, 1, 1, 1, 1,
0.5386461, 0.7179164, 0.5124447, 1, 1, 1, 1, 1,
0.5412736, -1.323631, 4.250264, 1, 1, 1, 1, 1,
0.54224, -1.851434, 4.131011, 1, 1, 1, 1, 1,
0.5438132, 0.06453028, 1.570719, 1, 1, 1, 1, 1,
0.5467304, -1.09316, 1.614704, 1, 1, 1, 1, 1,
0.550252, -0.2567738, 3.085628, 1, 1, 1, 1, 1,
0.5544273, 1.670336, 0.727726, 1, 1, 1, 1, 1,
0.5575548, -0.5412566, 3.791504, 1, 1, 1, 1, 1,
0.5576256, 0.2622792, 2.319694, 1, 1, 1, 1, 1,
0.5585482, 0.955665, 0.3540892, 1, 1, 1, 1, 1,
0.5588012, -0.891485, 2.534688, 1, 1, 1, 1, 1,
0.563167, 0.1907306, 1.145401, 1, 1, 1, 1, 1,
0.564472, 0.786277, 0.307566, 0, 0, 1, 1, 1,
0.5657256, -0.9403995, 3.145128, 1, 0, 0, 1, 1,
0.5721173, -0.8125436, 2.818978, 1, 0, 0, 1, 1,
0.5726908, 0.523232, 3.18235, 1, 0, 0, 1, 1,
0.5753195, -0.2827065, 2.420235, 1, 0, 0, 1, 1,
0.5803934, 0.9527634, 2.728243, 1, 0, 0, 1, 1,
0.5920274, 0.237312, 1.225656, 0, 0, 0, 1, 1,
0.5977442, 2.019549, -0.704968, 0, 0, 0, 1, 1,
0.5991406, 0.7030414, -0.3835677, 0, 0, 0, 1, 1,
0.6008305, -1.100484, 2.960551, 0, 0, 0, 1, 1,
0.6015266, 0.4426601, 2.257183, 0, 0, 0, 1, 1,
0.6026001, -1.483201, 3.09001, 0, 0, 0, 1, 1,
0.6057134, 0.4320086, 1.936518, 0, 0, 0, 1, 1,
0.6057584, 1.061016, 2.5567, 1, 1, 1, 1, 1,
0.6125948, -0.6223196, 3.26883, 1, 1, 1, 1, 1,
0.6152168, -0.8936976, 3.285433, 1, 1, 1, 1, 1,
0.6176813, -0.5327409, 3.362667, 1, 1, 1, 1, 1,
0.6183529, 0.4011857, 0.2204507, 1, 1, 1, 1, 1,
0.6249293, 0.2192245, 2.583231, 1, 1, 1, 1, 1,
0.6257346, 1.868547, 0.01013877, 1, 1, 1, 1, 1,
0.6341385, -0.9901827, 2.199271, 1, 1, 1, 1, 1,
0.6347921, -0.2076563, 1.440046, 1, 1, 1, 1, 1,
0.638566, -0.6070945, 2.230733, 1, 1, 1, 1, 1,
0.642166, 1.258562, 1.928965, 1, 1, 1, 1, 1,
0.6423211, 0.5295463, 0.3526096, 1, 1, 1, 1, 1,
0.6425018, -0.3238376, 3.549175, 1, 1, 1, 1, 1,
0.6426401, -0.1442327, 1.126131, 1, 1, 1, 1, 1,
0.6449512, 0.8545746, 0.05170481, 1, 1, 1, 1, 1,
0.6458834, -1.148305, 1.275855, 0, 0, 1, 1, 1,
0.6474275, 0.7341549, 0.01840846, 1, 0, 0, 1, 1,
0.6507853, -1.04673, 3.47154, 1, 0, 0, 1, 1,
0.6632781, 0.1774765, 2.584464, 1, 0, 0, 1, 1,
0.6670376, 0.5558829, 1.411892, 1, 0, 0, 1, 1,
0.6709117, 0.7730966, 1.964419, 1, 0, 0, 1, 1,
0.6723711, -1.912579, 3.114864, 0, 0, 0, 1, 1,
0.6776968, 0.08203926, 1.624346, 0, 0, 0, 1, 1,
0.6777177, 0.3335144, 2.241938, 0, 0, 0, 1, 1,
0.6846904, -1.510801, 1.026822, 0, 0, 0, 1, 1,
0.6861476, -3.157314, 3.345194, 0, 0, 0, 1, 1,
0.6870264, -0.6152735, 2.867523, 0, 0, 0, 1, 1,
0.687448, -0.2810539, 0.9950076, 0, 0, 0, 1, 1,
0.6886933, 0.3584522, -0.5580947, 1, 1, 1, 1, 1,
0.6887339, 0.1628167, 2.254006, 1, 1, 1, 1, 1,
0.6894247, 0.1508353, 0.6391479, 1, 1, 1, 1, 1,
0.6904619, -0.6479777, 3.715543, 1, 1, 1, 1, 1,
0.6934514, -1.38914, 2.462252, 1, 1, 1, 1, 1,
0.6948036, -0.3237596, 3.591479, 1, 1, 1, 1, 1,
0.6980391, -0.6267133, 0.9165276, 1, 1, 1, 1, 1,
0.7006432, -0.2598501, 3.087083, 1, 1, 1, 1, 1,
0.7029479, -1.065524, 3.577852, 1, 1, 1, 1, 1,
0.7131552, -1.176747, 2.534718, 1, 1, 1, 1, 1,
0.7149925, -0.3013295, 0.411382, 1, 1, 1, 1, 1,
0.7211045, 0.158485, 2.41136, 1, 1, 1, 1, 1,
0.7291926, -1.164131, 0.2402556, 1, 1, 1, 1, 1,
0.7299277, 1.022028, -0.2990943, 1, 1, 1, 1, 1,
0.742213, -2.69837, 2.530959, 1, 1, 1, 1, 1,
0.7426776, -0.7043638, 3.101665, 0, 0, 1, 1, 1,
0.7432505, 0.6235188, 0.3474874, 1, 0, 0, 1, 1,
0.7452406, 0.1914608, 0.7071968, 1, 0, 0, 1, 1,
0.7498408, 0.09177754, 1.569898, 1, 0, 0, 1, 1,
0.7500709, 0.2143906, 0.3229876, 1, 0, 0, 1, 1,
0.7509248, 0.3739996, 0.7017252, 1, 0, 0, 1, 1,
0.7525933, -0.449651, 2.197785, 0, 0, 0, 1, 1,
0.7543952, -0.8400115, 2.68194, 0, 0, 0, 1, 1,
0.7558389, 0.126231, 1.68569, 0, 0, 0, 1, 1,
0.7605129, 0.6315371, 1.109948, 0, 0, 0, 1, 1,
0.7614726, -1.122636, 4.467369, 0, 0, 0, 1, 1,
0.7634448, 2.079587, -0.5386453, 0, 0, 0, 1, 1,
0.767585, 0.09831124, 3.287805, 0, 0, 0, 1, 1,
0.7738844, -1.026734, 2.373396, 1, 1, 1, 1, 1,
0.7780328, 0.3494194, -0.4163674, 1, 1, 1, 1, 1,
0.7789753, 0.1319154, 1.995898, 1, 1, 1, 1, 1,
0.7828807, -0.9199443, 4.789779, 1, 1, 1, 1, 1,
0.7838944, 0.7745182, -0.4567357, 1, 1, 1, 1, 1,
0.7841269, 0.2350083, 2.692561, 1, 1, 1, 1, 1,
0.7855642, -1.285424, 3.043888, 1, 1, 1, 1, 1,
0.7868301, -0.475724, 4.128839, 1, 1, 1, 1, 1,
0.7921996, -0.6384682, 2.27747, 1, 1, 1, 1, 1,
0.7924028, -0.3423826, 0.1609462, 1, 1, 1, 1, 1,
0.7976359, 0.7412003, 1.018667, 1, 1, 1, 1, 1,
0.8033299, 0.3283614, 1.313017, 1, 1, 1, 1, 1,
0.8051428, 1.050825, 0.8644645, 1, 1, 1, 1, 1,
0.8066465, 0.07407253, 2.696783, 1, 1, 1, 1, 1,
0.8067792, -0.8845667, 0.6018686, 1, 1, 1, 1, 1,
0.8068233, -2.108958, 5.524347, 0, 0, 1, 1, 1,
0.8079209, 0.3470949, 1.72911, 1, 0, 0, 1, 1,
0.809268, 0.09360398, 0.3763362, 1, 0, 0, 1, 1,
0.8243419, -0.6177782, 2.314014, 1, 0, 0, 1, 1,
0.8263197, -0.8807653, 2.550805, 1, 0, 0, 1, 1,
0.8337492, 0.1396622, 1.384764, 1, 0, 0, 1, 1,
0.8352802, -1.631992, 1.538861, 0, 0, 0, 1, 1,
0.8356988, 1.286875, 0.884769, 0, 0, 0, 1, 1,
0.8433509, -0.4674974, 1.141322, 0, 0, 0, 1, 1,
0.8442643, -0.9703877, 1.752035, 0, 0, 0, 1, 1,
0.8454905, -0.9056517, 3.271116, 0, 0, 0, 1, 1,
0.8483217, 1.137721, 0.877941, 0, 0, 0, 1, 1,
0.8484282, -0.06257588, 1.577118, 0, 0, 0, 1, 1,
0.8489748, -1.427313, 4.223403, 1, 1, 1, 1, 1,
0.8509298, -0.8743094, 3.972415, 1, 1, 1, 1, 1,
0.8613852, -0.1697803, 2.225868, 1, 1, 1, 1, 1,
0.8644124, 3.068705, -0.4484335, 1, 1, 1, 1, 1,
0.8644279, 0.1290153, 1.090423, 1, 1, 1, 1, 1,
0.8725089, 1.475156, -0.8519648, 1, 1, 1, 1, 1,
0.8881708, -1.345128, 4.013461, 1, 1, 1, 1, 1,
0.8979696, -0.199835, 3.914504, 1, 1, 1, 1, 1,
0.9008969, -0.06249103, 2.744943, 1, 1, 1, 1, 1,
0.9064011, 0.2632628, 0.8507164, 1, 1, 1, 1, 1,
0.9072624, 0.5242596, 1.49612, 1, 1, 1, 1, 1,
0.9109018, 0.5948482, 2.93193, 1, 1, 1, 1, 1,
0.9127177, -1.246296, 3.640002, 1, 1, 1, 1, 1,
0.9139744, 0.3024131, 0.3361262, 1, 1, 1, 1, 1,
0.9200726, -1.212907, 2.0592, 1, 1, 1, 1, 1,
0.9273733, 0.9409478, 2.447773, 0, 0, 1, 1, 1,
0.9347105, 0.2692701, 1.417089, 1, 0, 0, 1, 1,
0.9383454, 1.30133, -0.4701064, 1, 0, 0, 1, 1,
0.9441844, 0.8494962, 1.869592, 1, 0, 0, 1, 1,
0.9484196, -1.771645, 4.68335, 1, 0, 0, 1, 1,
0.9550452, 1.284927, 0.397819, 1, 0, 0, 1, 1,
0.9574672, 0.320016, 0.9429499, 0, 0, 0, 1, 1,
0.9596902, 0.07038311, 4.543393, 0, 0, 0, 1, 1,
0.9642037, 1.971036, 1.076582, 0, 0, 0, 1, 1,
0.9666538, 0.0868974, 3.561503, 0, 0, 0, 1, 1,
0.9669068, 0.8877886, 1.393543, 0, 0, 0, 1, 1,
0.9713118, -0.9375087, 2.000672, 0, 0, 0, 1, 1,
0.971852, 0.6442474, 1.690936, 0, 0, 0, 1, 1,
0.9756547, 2.528981, -0.1408755, 1, 1, 1, 1, 1,
0.9797524, 1.08995, -0.4922338, 1, 1, 1, 1, 1,
0.98023, 1.227526, -0.09050033, 1, 1, 1, 1, 1,
0.9816864, 0.7915018, 0.694828, 1, 1, 1, 1, 1,
0.9827533, -0.2161188, 4.733397, 1, 1, 1, 1, 1,
0.9857134, 0.4410061, 0.7748314, 1, 1, 1, 1, 1,
0.9885532, -0.1226598, 1.632098, 1, 1, 1, 1, 1,
0.9919464, 0.6816441, 2.526161, 1, 1, 1, 1, 1,
0.9950491, -0.5193219, 2.71778, 1, 1, 1, 1, 1,
1.00472, -0.6325216, 2.557659, 1, 1, 1, 1, 1,
1.006788, -0.791965, 2.911695, 1, 1, 1, 1, 1,
1.00964, 0.005129499, 1.496014, 1, 1, 1, 1, 1,
1.012353, -0.5277202, 1.977711, 1, 1, 1, 1, 1,
1.021543, 1.108641, 0.07738698, 1, 1, 1, 1, 1,
1.023983, -1.170843, 1.85768, 1, 1, 1, 1, 1,
1.04143, 1.145916, 1.124405, 0, 0, 1, 1, 1,
1.041687, 0.2184824, -0.2719651, 1, 0, 0, 1, 1,
1.044578, -0.805503, 3.98532, 1, 0, 0, 1, 1,
1.049684, 1.121538, 1.001008, 1, 0, 0, 1, 1,
1.054164, 0.07581383, 1.171717, 1, 0, 0, 1, 1,
1.070304, 1.086894, -0.6080216, 1, 0, 0, 1, 1,
1.077875, -1.449995, 4.569697, 0, 0, 0, 1, 1,
1.080032, 1.377988, 2.823871, 0, 0, 0, 1, 1,
1.084803, 0.7213904, 0.1220325, 0, 0, 0, 1, 1,
1.084926, 0.2822188, 2.225224, 0, 0, 0, 1, 1,
1.08808, 0.5450421, 1.257217, 0, 0, 0, 1, 1,
1.09042, -0.9768382, 2.390969, 0, 0, 0, 1, 1,
1.093434, 0.09620484, 0.1904321, 0, 0, 0, 1, 1,
1.093516, -0.9880495, 1.212698, 1, 1, 1, 1, 1,
1.098876, 0.2691447, 2.249394, 1, 1, 1, 1, 1,
1.109515, 0.6395168, 1.267166, 1, 1, 1, 1, 1,
1.11106, -0.4394002, 2.176513, 1, 1, 1, 1, 1,
1.121522, 0.8288585, 0.5747807, 1, 1, 1, 1, 1,
1.121965, 1.449039, 0.3542255, 1, 1, 1, 1, 1,
1.126184, 0.6767026, -0.1014056, 1, 1, 1, 1, 1,
1.129238, -0.6344221, 1.610838, 1, 1, 1, 1, 1,
1.132611, -0.01233537, 0.6774166, 1, 1, 1, 1, 1,
1.133274, 0.01394843, 0.6753876, 1, 1, 1, 1, 1,
1.148013, -0.279212, 1.882303, 1, 1, 1, 1, 1,
1.149972, -0.6775708, 1.751672, 1, 1, 1, 1, 1,
1.159755, 0.2375075, -0.3457176, 1, 1, 1, 1, 1,
1.160431, 2.032293, 1.231848, 1, 1, 1, 1, 1,
1.16525, -0.1887248, 3.263394, 1, 1, 1, 1, 1,
1.165814, -0.3183795, 1.664153, 0, 0, 1, 1, 1,
1.172642, -1.039739, 2.814873, 1, 0, 0, 1, 1,
1.172948, -1.581714, 3.204928, 1, 0, 0, 1, 1,
1.183121, 0.2356892, 1.965608, 1, 0, 0, 1, 1,
1.184096, -0.1969833, 2.349206, 1, 0, 0, 1, 1,
1.189982, 1.525275, 0.8414485, 1, 0, 0, 1, 1,
1.191492, 0.5761282, 0.847932, 0, 0, 0, 1, 1,
1.193609, 2.326612, -0.8231715, 0, 0, 0, 1, 1,
1.205077, 0.6287163, -0.6151248, 0, 0, 0, 1, 1,
1.218358, -0.5126092, 0.8510277, 0, 0, 0, 1, 1,
1.222873, 0.4062518, 0.5857526, 0, 0, 0, 1, 1,
1.223996, -0.8697518, 1.976302, 0, 0, 0, 1, 1,
1.228105, 0.508339, -0.3291644, 0, 0, 0, 1, 1,
1.228622, -2.140951, 1.576474, 1, 1, 1, 1, 1,
1.233106, -1.59533, 1.153345, 1, 1, 1, 1, 1,
1.239003, -0.05206332, -0.4960558, 1, 1, 1, 1, 1,
1.242893, 1.687535, 1.495149, 1, 1, 1, 1, 1,
1.246433, 0.05815947, 1.022302, 1, 1, 1, 1, 1,
1.246958, 0.136989, 0.8472602, 1, 1, 1, 1, 1,
1.249282, 0.875425, 3.385945, 1, 1, 1, 1, 1,
1.2679, 0.3956394, 2.024346, 1, 1, 1, 1, 1,
1.274864, 1.040529, 1.798044, 1, 1, 1, 1, 1,
1.280381, 0.3020866, 1.479705, 1, 1, 1, 1, 1,
1.285565, 0.6490238, -0.4483805, 1, 1, 1, 1, 1,
1.300616, 1.431445, 1.772658, 1, 1, 1, 1, 1,
1.303545, 0.7828553, 0.9749415, 1, 1, 1, 1, 1,
1.311758, -1.852293, 3.656425, 1, 1, 1, 1, 1,
1.315578, -0.5181926, 2.528927, 1, 1, 1, 1, 1,
1.324432, 0.2832619, 1.84045, 0, 0, 1, 1, 1,
1.347079, 0.2262653, 2.042225, 1, 0, 0, 1, 1,
1.354074, 0.05556865, 3.880709, 1, 0, 0, 1, 1,
1.354395, 2.169477, 0.3765316, 1, 0, 0, 1, 1,
1.356144, 0.3879238, -0.3377558, 1, 0, 0, 1, 1,
1.361853, 0.5388989, 0.9159074, 1, 0, 0, 1, 1,
1.365285, 2.063951, 1.060305, 0, 0, 0, 1, 1,
1.367787, -0.3170924, 0.9682779, 0, 0, 0, 1, 1,
1.370287, -2.148528, 2.049227, 0, 0, 0, 1, 1,
1.388812, -0.1019907, 0.4788775, 0, 0, 0, 1, 1,
1.390396, -0.4125785, 2.010072, 0, 0, 0, 1, 1,
1.392469, 2.557451, 0.5538372, 0, 0, 0, 1, 1,
1.412048, 0.2654842, 2.531821, 0, 0, 0, 1, 1,
1.412474, 1.381502, -1.442349, 1, 1, 1, 1, 1,
1.419859, -0.4528272, 1.363049, 1, 1, 1, 1, 1,
1.43489, 0.02682543, 3.287995, 1, 1, 1, 1, 1,
1.442303, 0.2111442, 0.7109796, 1, 1, 1, 1, 1,
1.443141, -0.2477053, 4.119731, 1, 1, 1, 1, 1,
1.448581, 0.09359652, 3.180945, 1, 1, 1, 1, 1,
1.452959, -0.3021007, 2.991916, 1, 1, 1, 1, 1,
1.457543, 0.8011456, 0.9405494, 1, 1, 1, 1, 1,
1.462728, -0.2883258, 1.724073, 1, 1, 1, 1, 1,
1.467984, -1.311742, 3.128336, 1, 1, 1, 1, 1,
1.482752, 0.1406913, 1.099222, 1, 1, 1, 1, 1,
1.488254, 0.1911646, 1.464951, 1, 1, 1, 1, 1,
1.497062, 1.211319, 1.412548, 1, 1, 1, 1, 1,
1.511328, -0.07627615, 1.15379, 1, 1, 1, 1, 1,
1.513557, -0.08535032, 2.054767, 1, 1, 1, 1, 1,
1.516513, 2.277916, 0.3998277, 0, 0, 1, 1, 1,
1.524089, 0.4424104, 0.3772892, 1, 0, 0, 1, 1,
1.545182, 0.6421045, 3.033209, 1, 0, 0, 1, 1,
1.553655, 0.6866657, -0.004345669, 1, 0, 0, 1, 1,
1.56742, 0.4695355, 2.397465, 1, 0, 0, 1, 1,
1.582919, 0.3671872, 0.3807172, 1, 0, 0, 1, 1,
1.591167, 0.03945458, 2.396554, 0, 0, 0, 1, 1,
1.598547, 1.187871, -0.7437401, 0, 0, 0, 1, 1,
1.602664, -1.05022, 4.226032, 0, 0, 0, 1, 1,
1.617952, 0.2114831, -0.9780889, 0, 0, 0, 1, 1,
1.633224, 0.7123142, 2.957294, 0, 0, 0, 1, 1,
1.637796, -1.639575, 3.150866, 0, 0, 0, 1, 1,
1.642692, 0.5854034, 1.52754, 0, 0, 0, 1, 1,
1.643567, 0.2313186, 1.393975, 1, 1, 1, 1, 1,
1.654461, 1.518805, 2.22559, 1, 1, 1, 1, 1,
1.657767, -0.6492754, 2.755877, 1, 1, 1, 1, 1,
1.666774, -1.207949, 1.076844, 1, 1, 1, 1, 1,
1.69843, -0.8491158, 0.7898922, 1, 1, 1, 1, 1,
1.718034, -2.125345, 1.432493, 1, 1, 1, 1, 1,
1.735226, -0.7366831, 2.749658, 1, 1, 1, 1, 1,
1.745206, -1.589731, 2.452505, 1, 1, 1, 1, 1,
1.756247, 0.3769373, 1.319224, 1, 1, 1, 1, 1,
1.757608, -0.7271903, 1.945362, 1, 1, 1, 1, 1,
1.775769, -0.7318971, 1.908852, 1, 1, 1, 1, 1,
1.802235, -0.1389248, 0.5595134, 1, 1, 1, 1, 1,
1.804481, 0.4144289, 0.8953666, 1, 1, 1, 1, 1,
1.807529, 0.3712351, 1.515375, 1, 1, 1, 1, 1,
1.816254, 1.100903, 0.8091504, 1, 1, 1, 1, 1,
1.833817, -1.181945, 1.814424, 0, 0, 1, 1, 1,
1.836233, -0.8391156, 0.9212878, 1, 0, 0, 1, 1,
1.850856, -1.105537, 1.395668, 1, 0, 0, 1, 1,
1.850876, 0.85674, 1.881266, 1, 0, 0, 1, 1,
1.856584, 0.1213064, 3.703186, 1, 0, 0, 1, 1,
1.873967, -1.492189, 2.136979, 1, 0, 0, 1, 1,
1.874239, 1.176755, -0.2236746, 0, 0, 0, 1, 1,
1.888441, -2.685185, 2.34543, 0, 0, 0, 1, 1,
1.893685, 0.247595, 1.253689, 0, 0, 0, 1, 1,
1.908763, -0.5798259, 1.606736, 0, 0, 0, 1, 1,
1.916788, -1.462615, 2.003703, 0, 0, 0, 1, 1,
1.932172, -0.01907481, 1.173573, 0, 0, 0, 1, 1,
1.934428, 1.427908, -0.3236362, 0, 0, 0, 1, 1,
1.93493, 1.290027, 1.918526, 1, 1, 1, 1, 1,
1.9737, -0.7202512, 1.809609, 1, 1, 1, 1, 1,
1.984452, 0.1126857, 1.16922, 1, 1, 1, 1, 1,
1.993518, -1.325529, 1.489604, 1, 1, 1, 1, 1,
2.007665, -0.5665466, 2.523992, 1, 1, 1, 1, 1,
2.008155, -0.153444, -0.7521583, 1, 1, 1, 1, 1,
2.029853, 0.2667904, 2.786062, 1, 1, 1, 1, 1,
2.062612, -2.408912, 2.305751, 1, 1, 1, 1, 1,
2.073707, -0.3344233, 1.831664, 1, 1, 1, 1, 1,
2.077423, 0.9619521, 1.038483, 1, 1, 1, 1, 1,
2.081383, 0.9599101, 1.730403, 1, 1, 1, 1, 1,
2.090205, 0.6699715, 1.950877, 1, 1, 1, 1, 1,
2.09164, -1.412983, 2.810582, 1, 1, 1, 1, 1,
2.101966, -0.7490733, 2.826609, 1, 1, 1, 1, 1,
2.125882, 0.1538524, 2.321483, 1, 1, 1, 1, 1,
2.142017, 1.802637, -0.1302536, 0, 0, 1, 1, 1,
2.165462, 0.3840402, 0.9730467, 1, 0, 0, 1, 1,
2.170192, 0.9641027, 3.138869, 1, 0, 0, 1, 1,
2.184116, -0.207295, 2.133868, 1, 0, 0, 1, 1,
2.244073, 0.2690134, 2.251871, 1, 0, 0, 1, 1,
2.256255, 0.2960552, 1.668545, 1, 0, 0, 1, 1,
2.260806, 0.06424679, -0.3444564, 0, 0, 0, 1, 1,
2.268392, -1.580894, 1.816808, 0, 0, 0, 1, 1,
2.275597, 0.438074, 2.434292, 0, 0, 0, 1, 1,
2.413289, 1.296719, 3.000357, 0, 0, 0, 1, 1,
2.429738, -0.04858042, 0.7450585, 0, 0, 0, 1, 1,
2.430288, -1.91111, 4.090933, 0, 0, 0, 1, 1,
2.500293, 0.5651094, 2.672071, 0, 0, 0, 1, 1,
2.61293, 1.932429, -0.4645244, 1, 1, 1, 1, 1,
2.66122, -0.9735953, 1.128553, 1, 1, 1, 1, 1,
2.663667, 0.5740943, 2.322412, 1, 1, 1, 1, 1,
2.698206, 0.02771839, 1.028987, 1, 1, 1, 1, 1,
2.749157, -0.5026619, 2.53685, 1, 1, 1, 1, 1,
2.974397, 0.6835275, 0.1426285, 1, 1, 1, 1, 1,
3.06307, -1.839277, 1.718648, 1, 1, 1, 1, 1
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
var radius = 9.446285;
var distance = 33.17967;
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
mvMatrix.translate( 0.06635427, 0.04430485, -0.2174699 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17967);
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
