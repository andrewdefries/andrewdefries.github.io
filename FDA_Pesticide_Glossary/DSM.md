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
-3.287038, -1.69997, -2.229246, 1, 0, 0, 1,
-2.935409, 1.348464, -1.446414, 1, 0.007843138, 0, 1,
-2.788495, 0.4240254, -0.3389089, 1, 0.01176471, 0, 1,
-2.732462, 0.6765079, -2.321595, 1, 0.01960784, 0, 1,
-2.705554, -0.02930362, -1.948948, 1, 0.02352941, 0, 1,
-2.599146, -0.6381096, -2.537309, 1, 0.03137255, 0, 1,
-2.411817, -0.114398, -0.4278108, 1, 0.03529412, 0, 1,
-2.347045, -0.5390941, -2.532124, 1, 0.04313726, 0, 1,
-2.323091, -1.658282, -2.428341, 1, 0.04705882, 0, 1,
-2.304816, 0.7129443, -2.065999, 1, 0.05490196, 0, 1,
-2.23998, -0.4558351, -3.074831, 1, 0.05882353, 0, 1,
-2.217204, -0.7812018, -2.149179, 1, 0.06666667, 0, 1,
-2.129691, 0.2070547, -0.9758486, 1, 0.07058824, 0, 1,
-2.11622, 0.163423, -0.595887, 1, 0.07843138, 0, 1,
-2.093779, 1.027251, -1.605385, 1, 0.08235294, 0, 1,
-2.087329, 0.0005753345, -1.453272, 1, 0.09019608, 0, 1,
-2.02854, -0.2119042, 0.1735251, 1, 0.09411765, 0, 1,
-2.01955, -1.823416, -2.13421, 1, 0.1019608, 0, 1,
-2.016325, -0.021359, -1.044777, 1, 0.1098039, 0, 1,
-2.008601, 1.661786, -1.424343, 1, 0.1137255, 0, 1,
-1.99371, 1.098106, -2.489449, 1, 0.1215686, 0, 1,
-1.974538, 0.9700189, -1.425286, 1, 0.1254902, 0, 1,
-1.967437, -0.4979124, -1.170594, 1, 0.1333333, 0, 1,
-1.92028, 0.6380596, -1.929039, 1, 0.1372549, 0, 1,
-1.899759, 1.08113, 0.4753264, 1, 0.145098, 0, 1,
-1.899176, -0.1839248, -1.19424, 1, 0.1490196, 0, 1,
-1.892989, -0.5612933, -0.1244301, 1, 0.1568628, 0, 1,
-1.891944, 0.02993491, -2.334491, 1, 0.1607843, 0, 1,
-1.873995, -0.0330141, -1.123619, 1, 0.1686275, 0, 1,
-1.872652, 1.471641, -1.674085, 1, 0.172549, 0, 1,
-1.8701, -0.1938375, -1.423511, 1, 0.1803922, 0, 1,
-1.867537, 0.6291788, -3.793631, 1, 0.1843137, 0, 1,
-1.820147, -2.112137, -1.878382, 1, 0.1921569, 0, 1,
-1.812677, 0.5176183, -0.2308443, 1, 0.1960784, 0, 1,
-1.810873, -1.087475, -1.518703, 1, 0.2039216, 0, 1,
-1.80376, -0.9128396, -3.289797, 1, 0.2117647, 0, 1,
-1.789901, 0.3380613, -0.7458643, 1, 0.2156863, 0, 1,
-1.789722, -1.907963, -0.9118885, 1, 0.2235294, 0, 1,
-1.781677, 1.28541, -1.118006, 1, 0.227451, 0, 1,
-1.780589, -1.456155, -2.665232, 1, 0.2352941, 0, 1,
-1.776835, -2.845229, -1.955708, 1, 0.2392157, 0, 1,
-1.776362, 0.5254555, -2.670436, 1, 0.2470588, 0, 1,
-1.773864, 2.047162, 0.1475658, 1, 0.2509804, 0, 1,
-1.772788, -0.2469659, -0.4951985, 1, 0.2588235, 0, 1,
-1.766841, -0.2222146, -3.595301, 1, 0.2627451, 0, 1,
-1.762925, 1.125403, -2.806376, 1, 0.2705882, 0, 1,
-1.73205, 0.8406487, -2.122583, 1, 0.2745098, 0, 1,
-1.720359, 0.9334725, 1.284349, 1, 0.282353, 0, 1,
-1.711776, 1.020204, -0.9225086, 1, 0.2862745, 0, 1,
-1.704422, 0.8398645, -2.363597, 1, 0.2941177, 0, 1,
-1.703755, 0.8642358, -2.481592, 1, 0.3019608, 0, 1,
-1.703734, 1.383661, 0.9091523, 1, 0.3058824, 0, 1,
-1.692438, 0.7137727, -0.5005604, 1, 0.3137255, 0, 1,
-1.686019, -0.7351745, -2.533308, 1, 0.3176471, 0, 1,
-1.682411, 1.249248, -1.520193, 1, 0.3254902, 0, 1,
-1.668802, 1.029042, -0.9388258, 1, 0.3294118, 0, 1,
-1.661192, 0.5045896, 0.9972629, 1, 0.3372549, 0, 1,
-1.658254, -0.3442687, -0.9975015, 1, 0.3411765, 0, 1,
-1.654243, 0.8051065, -0.4965788, 1, 0.3490196, 0, 1,
-1.639423, -0.4026389, -1.565753, 1, 0.3529412, 0, 1,
-1.625889, -0.8692783, -1.36892, 1, 0.3607843, 0, 1,
-1.61998, -0.01977473, -3.726473, 1, 0.3647059, 0, 1,
-1.607695, 0.1266355, -3.446884, 1, 0.372549, 0, 1,
-1.6043, -1.328926, -2.465594, 1, 0.3764706, 0, 1,
-1.602335, -0.03311137, -1.422289, 1, 0.3843137, 0, 1,
-1.599284, 0.5870686, -1.490649, 1, 0.3882353, 0, 1,
-1.595037, 0.6489961, -4.04503, 1, 0.3960784, 0, 1,
-1.591153, -0.008000678, -0.476853, 1, 0.4039216, 0, 1,
-1.588036, -0.0131688, -1.069502, 1, 0.4078431, 0, 1,
-1.573021, -0.3803911, -1.968054, 1, 0.4156863, 0, 1,
-1.57067, 0.3594851, -1.367438, 1, 0.4196078, 0, 1,
-1.565725, 0.5149024, -0.6518436, 1, 0.427451, 0, 1,
-1.541485, -1.018257, -1.804747, 1, 0.4313726, 0, 1,
-1.53768, -0.5759383, -1.896857, 1, 0.4392157, 0, 1,
-1.525314, -1.192714, -1.541088, 1, 0.4431373, 0, 1,
-1.52171, 1.229896, -2.656595, 1, 0.4509804, 0, 1,
-1.509892, 0.1442529, -2.520916, 1, 0.454902, 0, 1,
-1.503056, 0.002908888, -1.123134, 1, 0.4627451, 0, 1,
-1.498197, 0.4571086, -0.9565964, 1, 0.4666667, 0, 1,
-1.490348, 0.1285138, -0.6856749, 1, 0.4745098, 0, 1,
-1.485663, 0.9590471, 0.09646247, 1, 0.4784314, 0, 1,
-1.470885, -1.164175, -2.387384, 1, 0.4862745, 0, 1,
-1.446256, 0.8283191, -1.364663, 1, 0.4901961, 0, 1,
-1.439089, -0.8496037, -2.377373, 1, 0.4980392, 0, 1,
-1.436993, -0.02044137, -2.091749, 1, 0.5058824, 0, 1,
-1.436652, 0.3344619, -0.7756119, 1, 0.509804, 0, 1,
-1.42229, 0.405459, -2.696831, 1, 0.5176471, 0, 1,
-1.407018, 0.09916582, -4.030611, 1, 0.5215687, 0, 1,
-1.405072, 0.3664088, -2.50174, 1, 0.5294118, 0, 1,
-1.400421, 0.1101736, 0.5284886, 1, 0.5333334, 0, 1,
-1.396472, 0.5752054, -0.5988631, 1, 0.5411765, 0, 1,
-1.387539, 0.6619996, -3.139537, 1, 0.5450981, 0, 1,
-1.376861, 1.916874, -0.525185, 1, 0.5529412, 0, 1,
-1.373942, -0.09176372, -2.397805, 1, 0.5568628, 0, 1,
-1.361697, 1.158269, -0.8555144, 1, 0.5647059, 0, 1,
-1.351375, 1.504608, -1.091783, 1, 0.5686275, 0, 1,
-1.349627, 0.5421209, -0.4315459, 1, 0.5764706, 0, 1,
-1.34553, 0.8461871, -1.72095, 1, 0.5803922, 0, 1,
-1.337391, -0.05588407, -2.017323, 1, 0.5882353, 0, 1,
-1.335465, 0.4600627, -1.675407, 1, 0.5921569, 0, 1,
-1.326457, 1.016953, 1.486137, 1, 0.6, 0, 1,
-1.316812, 0.2532802, -2.114589, 1, 0.6078432, 0, 1,
-1.30578, 0.8264707, -0.8343297, 1, 0.6117647, 0, 1,
-1.30383, 2.621901, 0.2329302, 1, 0.6196079, 0, 1,
-1.303673, 1.116733, -1.667582, 1, 0.6235294, 0, 1,
-1.302781, 0.007131808, -1.397486, 1, 0.6313726, 0, 1,
-1.297094, -0.5358731, -2.074078, 1, 0.6352941, 0, 1,
-1.296354, 0.2078569, -1.677212, 1, 0.6431373, 0, 1,
-1.285114, -0.9432103, -2.073245, 1, 0.6470588, 0, 1,
-1.28248, -0.01778238, -1.932814, 1, 0.654902, 0, 1,
-1.281206, 0.462772, -0.6848797, 1, 0.6588235, 0, 1,
-1.278321, 0.1165878, -2.406703, 1, 0.6666667, 0, 1,
-1.270588, 2.033469, -2.424118, 1, 0.6705883, 0, 1,
-1.261568, -0.2336976, -1.708228, 1, 0.6784314, 0, 1,
-1.246108, -0.1724849, -1.740511, 1, 0.682353, 0, 1,
-1.243915, -0.4634193, -1.350356, 1, 0.6901961, 0, 1,
-1.242646, 1.635763, -1.769527, 1, 0.6941177, 0, 1,
-1.236498, 0.8528251, -2.311208, 1, 0.7019608, 0, 1,
-1.236103, -0.4629299, -1.261555, 1, 0.7098039, 0, 1,
-1.224326, -0.7050769, -2.931219, 1, 0.7137255, 0, 1,
-1.220391, -1.25476, -3.51583, 1, 0.7215686, 0, 1,
-1.220149, 2.072317, -0.2225728, 1, 0.7254902, 0, 1,
-1.220045, -1.283854, -4.869933, 1, 0.7333333, 0, 1,
-1.208934, -0.6668741, -3.761292, 1, 0.7372549, 0, 1,
-1.201918, -0.502667, -3.649134, 1, 0.7450981, 0, 1,
-1.200593, 0.1935908, -2.10721, 1, 0.7490196, 0, 1,
-1.178625, -0.375302, -0.9233633, 1, 0.7568628, 0, 1,
-1.176319, 0.6095015, -1.281142, 1, 0.7607843, 0, 1,
-1.173998, 1.239549, -2.553348, 1, 0.7686275, 0, 1,
-1.171123, 0.3455222, -1.829072, 1, 0.772549, 0, 1,
-1.169309, -1.417864, -2.747232, 1, 0.7803922, 0, 1,
-1.167142, 1.228478, 0.3828386, 1, 0.7843137, 0, 1,
-1.157126, 0.1465182, -0.9780075, 1, 0.7921569, 0, 1,
-1.145052, 1.36964, -2.124732, 1, 0.7960784, 0, 1,
-1.144054, -0.07783093, -0.5583614, 1, 0.8039216, 0, 1,
-1.139001, -0.4318962, -1.875118, 1, 0.8117647, 0, 1,
-1.137035, 0.1546223, -3.848391, 1, 0.8156863, 0, 1,
-1.121995, 0.3145255, -3.883651, 1, 0.8235294, 0, 1,
-1.113478, -0.94981, 0.586973, 1, 0.827451, 0, 1,
-1.107675, 0.2129417, -1.662358, 1, 0.8352941, 0, 1,
-1.099596, -0.6936005, -1.448728, 1, 0.8392157, 0, 1,
-1.088882, 0.1278653, -2.007499, 1, 0.8470588, 0, 1,
-1.082584, 0.835307, -1.301129, 1, 0.8509804, 0, 1,
-1.07529, -0.4768103, -3.137422, 1, 0.8588235, 0, 1,
-1.07496, -0.5148945, -1.984139, 1, 0.8627451, 0, 1,
-1.074579, -0.6040398, -3.70357, 1, 0.8705882, 0, 1,
-1.074206, -0.9712769, -2.23196, 1, 0.8745098, 0, 1,
-1.069752, -0.230974, -2.344615, 1, 0.8823529, 0, 1,
-1.069207, 1.22308, -0.9955651, 1, 0.8862745, 0, 1,
-1.068756, -0.6051285, -0.9607474, 1, 0.8941177, 0, 1,
-1.068293, 0.3872825, 0.2262074, 1, 0.8980392, 0, 1,
-1.059688, -1.54131, -2.194528, 1, 0.9058824, 0, 1,
-1.057449, -0.5238116, -3.126734, 1, 0.9137255, 0, 1,
-1.057173, 0.6445029, -0.06352799, 1, 0.9176471, 0, 1,
-1.053176, -1.417738, -3.476643, 1, 0.9254902, 0, 1,
-1.049112, 0.9175386, -1.669819, 1, 0.9294118, 0, 1,
-1.042699, 1.533049, -1.998589, 1, 0.9372549, 0, 1,
-1.038905, -0.1301975, -1.881093, 1, 0.9411765, 0, 1,
-1.032409, 0.04441717, -2.456076, 1, 0.9490196, 0, 1,
-1.027196, 0.2400054, -0.8728626, 1, 0.9529412, 0, 1,
-1.022774, -0.316242, -1.529965, 1, 0.9607843, 0, 1,
-1.022039, 0.7501127, -1.441449, 1, 0.9647059, 0, 1,
-1.019691, -1.179304, -2.57001, 1, 0.972549, 0, 1,
-1.003271, -2.574972, -2.130015, 1, 0.9764706, 0, 1,
-0.9973209, -0.3697523, -2.760113, 1, 0.9843137, 0, 1,
-0.9950407, -0.6221996, -2.615316, 1, 0.9882353, 0, 1,
-0.992467, -0.3245386, -0.9181055, 1, 0.9960784, 0, 1,
-0.9924617, 0.9917073, -1.403057, 0.9960784, 1, 0, 1,
-0.9828685, -0.06577433, -1.782685, 0.9921569, 1, 0, 1,
-0.9792005, 0.002478079, -1.527997, 0.9843137, 1, 0, 1,
-0.9783594, -0.7308509, -2.05019, 0.9803922, 1, 0, 1,
-0.9749013, -2.045301, -4.376618, 0.972549, 1, 0, 1,
-0.97371, -0.5861828, -0.007946785, 0.9686275, 1, 0, 1,
-0.970147, 1.628297, -1.923677, 0.9607843, 1, 0, 1,
-0.9666352, 0.7172729, -1.368549, 0.9568627, 1, 0, 1,
-0.9663614, -0.6678007, -1.37489, 0.9490196, 1, 0, 1,
-0.961445, 0.1532497, -2.890176, 0.945098, 1, 0, 1,
-0.9531095, -0.2124267, -1.988079, 0.9372549, 1, 0, 1,
-0.9519759, -0.2756959, -1.627699, 0.9333333, 1, 0, 1,
-0.943865, 0.183534, -2.083809, 0.9254902, 1, 0, 1,
-0.9384842, -2.361675, -1.603364, 0.9215686, 1, 0, 1,
-0.9359835, 2.152842, -0.08432419, 0.9137255, 1, 0, 1,
-0.9287642, 0.8721757, -1.66764, 0.9098039, 1, 0, 1,
-0.9252587, -0.8249224, -1.220459, 0.9019608, 1, 0, 1,
-0.9247779, 1.194782, -0.1194618, 0.8941177, 1, 0, 1,
-0.9247651, 0.1156641, 0.4845031, 0.8901961, 1, 0, 1,
-0.9193946, 0.1453273, -2.63786, 0.8823529, 1, 0, 1,
-0.9191974, -0.1961679, -1.773249, 0.8784314, 1, 0, 1,
-0.9186649, -0.5623101, -2.593564, 0.8705882, 1, 0, 1,
-0.9097989, 0.9528286, -2.260587, 0.8666667, 1, 0, 1,
-0.9032577, -1.760517, -1.982891, 0.8588235, 1, 0, 1,
-0.9006271, 0.7881573, -1.128529, 0.854902, 1, 0, 1,
-0.8982717, -0.4651147, -2.281389, 0.8470588, 1, 0, 1,
-0.8938665, -0.8312188, -1.022053, 0.8431373, 1, 0, 1,
-0.8852662, 0.5573027, -1.844063, 0.8352941, 1, 0, 1,
-0.8795034, -0.8183224, -1.786175, 0.8313726, 1, 0, 1,
-0.8790354, 0.2924233, -1.358219, 0.8235294, 1, 0, 1,
-0.8733972, -0.3195571, -2.892049, 0.8196079, 1, 0, 1,
-0.8718847, -0.8388072, -1.343301, 0.8117647, 1, 0, 1,
-0.8691391, 0.1237039, -2.005765, 0.8078431, 1, 0, 1,
-0.8689279, 0.1751706, -1.910868, 0.8, 1, 0, 1,
-0.8682631, 0.01378742, -1.145932, 0.7921569, 1, 0, 1,
-0.8647221, -1.491423, -2.819241, 0.7882353, 1, 0, 1,
-0.8581707, -0.861784, -1.284253, 0.7803922, 1, 0, 1,
-0.8540246, 0.8421725, -0.2300088, 0.7764706, 1, 0, 1,
-0.8446332, -0.5521726, -1.571474, 0.7686275, 1, 0, 1,
-0.8369395, 1.185513, 0.2204996, 0.7647059, 1, 0, 1,
-0.8331555, 0.01606446, -1.26691, 0.7568628, 1, 0, 1,
-0.8292279, -2.641108, -3.896994, 0.7529412, 1, 0, 1,
-0.8257957, 0.5895456, -0.003106694, 0.7450981, 1, 0, 1,
-0.825003, -0.4405873, -3.982713, 0.7411765, 1, 0, 1,
-0.8213896, -0.1341193, -1.657131, 0.7333333, 1, 0, 1,
-0.8172408, 0.196284, 0.3019697, 0.7294118, 1, 0, 1,
-0.8164654, -1.270964, -1.852705, 0.7215686, 1, 0, 1,
-0.8138478, -0.3952871, -1.58382, 0.7176471, 1, 0, 1,
-0.8135509, 0.01622637, -2.218868, 0.7098039, 1, 0, 1,
-0.8071468, 1.242343, 0.4717511, 0.7058824, 1, 0, 1,
-0.8053759, -0.1365031, -2.479783, 0.6980392, 1, 0, 1,
-0.8035184, 1.963933, 0.371854, 0.6901961, 1, 0, 1,
-0.7993881, 1.169104, 0.0846008, 0.6862745, 1, 0, 1,
-0.7931337, -1.425872, -3.637771, 0.6784314, 1, 0, 1,
-0.7927467, -1.683275, -2.028972, 0.6745098, 1, 0, 1,
-0.7912348, -0.8015324, -4.269378, 0.6666667, 1, 0, 1,
-0.7879074, 0.1076195, -3.009906, 0.6627451, 1, 0, 1,
-0.7858981, -0.5166556, -2.997281, 0.654902, 1, 0, 1,
-0.7850381, 0.4625317, -0.3946085, 0.6509804, 1, 0, 1,
-0.7842144, -0.5400059, -3.521408, 0.6431373, 1, 0, 1,
-0.7811592, 0.5131373, -1.72062, 0.6392157, 1, 0, 1,
-0.7786557, 1.166698, -1.54337, 0.6313726, 1, 0, 1,
-0.7772571, -0.4559295, -1.653821, 0.627451, 1, 0, 1,
-0.7656163, -0.3352001, -1.819894, 0.6196079, 1, 0, 1,
-0.7645336, 2.813983, -0.8261394, 0.6156863, 1, 0, 1,
-0.7536095, 1.538864, -0.7939414, 0.6078432, 1, 0, 1,
-0.747512, -0.2076313, -1.972373, 0.6039216, 1, 0, 1,
-0.7463628, -0.6243589, -0.9221066, 0.5960785, 1, 0, 1,
-0.7450944, 0.4728931, -1.27122, 0.5882353, 1, 0, 1,
-0.74436, -1.008619, -2.096482, 0.5843138, 1, 0, 1,
-0.7427331, 0.2996458, -0.5543246, 0.5764706, 1, 0, 1,
-0.7415115, -0.8886508, -2.582662, 0.572549, 1, 0, 1,
-0.7363098, 0.654008, 1.703965, 0.5647059, 1, 0, 1,
-0.7318815, 0.09740442, -1.038355, 0.5607843, 1, 0, 1,
-0.7296591, -0.3706858, -2.141736, 0.5529412, 1, 0, 1,
-0.717007, 0.6148311, -0.8359641, 0.5490196, 1, 0, 1,
-0.7162613, -0.7463669, -1.869251, 0.5411765, 1, 0, 1,
-0.7144252, 0.1440726, -1.957037, 0.5372549, 1, 0, 1,
-0.7135683, -0.7717696, -4.151383, 0.5294118, 1, 0, 1,
-0.712486, 0.7305629, -1.155009, 0.5254902, 1, 0, 1,
-0.7115095, 0.1970786, -1.3113, 0.5176471, 1, 0, 1,
-0.71104, 1.291429, 0.6208375, 0.5137255, 1, 0, 1,
-0.7094255, -0.786172, -2.817472, 0.5058824, 1, 0, 1,
-0.7089683, -0.7765402, -1.448754, 0.5019608, 1, 0, 1,
-0.7066361, 0.1140783, -0.8916935, 0.4941176, 1, 0, 1,
-0.7044109, -0.1139705, -0.4020023, 0.4862745, 1, 0, 1,
-0.6858852, 1.475886, 1.208205, 0.4823529, 1, 0, 1,
-0.6853138, -0.2147242, -1.762111, 0.4745098, 1, 0, 1,
-0.6818587, -0.1551643, -1.912234, 0.4705882, 1, 0, 1,
-0.6722461, -2.220938, -1.856991, 0.4627451, 1, 0, 1,
-0.6712629, -1.02226, -2.078476, 0.4588235, 1, 0, 1,
-0.6684887, 1.611446, 0.2109033, 0.4509804, 1, 0, 1,
-0.6682431, -1.843742, -3.710376, 0.4470588, 1, 0, 1,
-0.6636333, -0.2108316, -2.195029, 0.4392157, 1, 0, 1,
-0.6598388, -0.318014, -0.7180052, 0.4352941, 1, 0, 1,
-0.6595269, 0.5569742, 0.170099, 0.427451, 1, 0, 1,
-0.6587934, -1.672042, -3.060113, 0.4235294, 1, 0, 1,
-0.6571307, -1.919987, -2.570435, 0.4156863, 1, 0, 1,
-0.6569596, 1.780632, -0.552642, 0.4117647, 1, 0, 1,
-0.6568553, 0.7213554, 0.2574022, 0.4039216, 1, 0, 1,
-0.6555346, -3.077483, -3.249971, 0.3960784, 1, 0, 1,
-0.6548554, -1.931849, -4.192993, 0.3921569, 1, 0, 1,
-0.654553, -0.3794633, -2.409583, 0.3843137, 1, 0, 1,
-0.6539188, -0.1524572, -2.62529, 0.3803922, 1, 0, 1,
-0.6498019, -1.840896, -2.394035, 0.372549, 1, 0, 1,
-0.6461447, 0.9459578, -3.258425, 0.3686275, 1, 0, 1,
-0.6418798, 1.063179, 1.231105, 0.3607843, 1, 0, 1,
-0.6415955, -0.7090421, -2.869952, 0.3568628, 1, 0, 1,
-0.6396807, -0.674808, -2.819044, 0.3490196, 1, 0, 1,
-0.6370215, 0.5399218, -0.7773426, 0.345098, 1, 0, 1,
-0.6365839, -0.3171943, -1.000181, 0.3372549, 1, 0, 1,
-0.6326187, -1.254594, -1.362619, 0.3333333, 1, 0, 1,
-0.6275167, 1.012211, -0.3224058, 0.3254902, 1, 0, 1,
-0.6250458, -0.74332, -2.394943, 0.3215686, 1, 0, 1,
-0.6175802, 2.788319, -0.1183495, 0.3137255, 1, 0, 1,
-0.6175121, -0.09468939, -1.179019, 0.3098039, 1, 0, 1,
-0.6145148, 0.1863046, -2.430763, 0.3019608, 1, 0, 1,
-0.6137679, 0.7265232, -1.652383, 0.2941177, 1, 0, 1,
-0.613442, 0.2036354, -1.046319, 0.2901961, 1, 0, 1,
-0.61067, 1.130666, 0.2002456, 0.282353, 1, 0, 1,
-0.6089571, -0.009019624, -3.139297, 0.2784314, 1, 0, 1,
-0.6086699, 0.5987698, -2.680687, 0.2705882, 1, 0, 1,
-0.6070028, 0.4092127, -1.325967, 0.2666667, 1, 0, 1,
-0.6026247, 0.3270452, -1.660718, 0.2588235, 1, 0, 1,
-0.6016024, -0.649609, -3.21453, 0.254902, 1, 0, 1,
-0.6014326, -1.500422, -3.030777, 0.2470588, 1, 0, 1,
-0.6003589, -0.1212055, -2.107881, 0.2431373, 1, 0, 1,
-0.5960918, -0.9412019, -2.821373, 0.2352941, 1, 0, 1,
-0.5948139, -2.936495, -3.892524, 0.2313726, 1, 0, 1,
-0.5914493, 1.569647, -1.103056, 0.2235294, 1, 0, 1,
-0.5810633, -0.8191446, -3.583996, 0.2196078, 1, 0, 1,
-0.5763656, 1.971637, 0.08304939, 0.2117647, 1, 0, 1,
-0.5716121, -0.4021356, -1.623232, 0.2078431, 1, 0, 1,
-0.5692707, 1.195232, -0.8434129, 0.2, 1, 0, 1,
-0.5676613, 0.410875, -0.2705417, 0.1921569, 1, 0, 1,
-0.5645126, 0.7427731, 0.2378049, 0.1882353, 1, 0, 1,
-0.5639383, -0.7021046, -4.796553, 0.1803922, 1, 0, 1,
-0.5637525, -0.6576386, -2.148152, 0.1764706, 1, 0, 1,
-0.5619334, -1.688917, -3.636649, 0.1686275, 1, 0, 1,
-0.552671, 1.142237, 0.3840533, 0.1647059, 1, 0, 1,
-0.5503392, 0.4408786, 0.0975785, 0.1568628, 1, 0, 1,
-0.5470751, -1.111129, -3.361151, 0.1529412, 1, 0, 1,
-0.5433226, -0.6570793, -1.752993, 0.145098, 1, 0, 1,
-0.539499, 0.3130497, 0.1987372, 0.1411765, 1, 0, 1,
-0.5386007, 0.441846, -2.127756, 0.1333333, 1, 0, 1,
-0.5346754, -1.460162, -2.17271, 0.1294118, 1, 0, 1,
-0.531471, -0.7678434, -1.534549, 0.1215686, 1, 0, 1,
-0.5314626, -0.03120949, -1.358008, 0.1176471, 1, 0, 1,
-0.525601, 0.8027444, 0.2515219, 0.1098039, 1, 0, 1,
-0.5250261, -0.6234044, -2.193023, 0.1058824, 1, 0, 1,
-0.5232388, 0.7313039, -0.9987965, 0.09803922, 1, 0, 1,
-0.522961, 0.5663311, -0.5226859, 0.09019608, 1, 0, 1,
-0.5194345, -0.8615341, -1.758627, 0.08627451, 1, 0, 1,
-0.5156536, 1.475979, -1.558306, 0.07843138, 1, 0, 1,
-0.5114599, 0.002999925, -3.019784, 0.07450981, 1, 0, 1,
-0.5105595, -0.0833669, -1.825807, 0.06666667, 1, 0, 1,
-0.4972911, 1.666435, 0.4130566, 0.0627451, 1, 0, 1,
-0.4965315, 0.5517902, -0.5252724, 0.05490196, 1, 0, 1,
-0.4893668, 0.9291075, -2.26457, 0.05098039, 1, 0, 1,
-0.4878648, 0.5964985, -0.676972, 0.04313726, 1, 0, 1,
-0.48669, -1.364819, -2.857858, 0.03921569, 1, 0, 1,
-0.4858158, -0.9586505, -2.289685, 0.03137255, 1, 0, 1,
-0.481288, -1.813855, -1.834445, 0.02745098, 1, 0, 1,
-0.4703317, -1.172046, -3.229064, 0.01960784, 1, 0, 1,
-0.4673817, -0.4690823, -2.23678, 0.01568628, 1, 0, 1,
-0.4658956, -0.2635942, -3.264556, 0.007843138, 1, 0, 1,
-0.461562, 2.180802, -0.5432802, 0.003921569, 1, 0, 1,
-0.460038, 0.4444772, 0.6286057, 0, 1, 0.003921569, 1,
-0.4591644, 0.4798876, 0.1020232, 0, 1, 0.01176471, 1,
-0.4580201, -0.8920898, -3.132296, 0, 1, 0.01568628, 1,
-0.4574342, 1.37465, 0.8286095, 0, 1, 0.02352941, 1,
-0.4559587, 2.03791, 0.5811967, 0, 1, 0.02745098, 1,
-0.4529761, -0.5859303, -4.149398, 0, 1, 0.03529412, 1,
-0.4504402, -2.141492, -3.29796, 0, 1, 0.03921569, 1,
-0.4495801, -0.424393, -4.133432, 0, 1, 0.04705882, 1,
-0.4468237, 1.247247, -0.04626684, 0, 1, 0.05098039, 1,
-0.4419098, 0.3626747, -2.146229, 0, 1, 0.05882353, 1,
-0.4380832, -1.171676, -3.02309, 0, 1, 0.0627451, 1,
-0.4342761, -1.497113, -3.697594, 0, 1, 0.07058824, 1,
-0.4334541, 0.8258256, 0.5372592, 0, 1, 0.07450981, 1,
-0.4296175, 1.718294, -0.9040219, 0, 1, 0.08235294, 1,
-0.428172, -0.1450943, -3.921948, 0, 1, 0.08627451, 1,
-0.4211692, -0.4255715, -3.578557, 0, 1, 0.09411765, 1,
-0.4178465, -0.1677541, -3.549135, 0, 1, 0.1019608, 1,
-0.4162318, 0.08626153, 0.7254153, 0, 1, 0.1058824, 1,
-0.4144989, -1.941776, -3.565887, 0, 1, 0.1137255, 1,
-0.4131544, -0.1442578, -1.564121, 0, 1, 0.1176471, 1,
-0.4124607, 0.09729206, -0.7821001, 0, 1, 0.1254902, 1,
-0.412243, 2.326255, -0.1572204, 0, 1, 0.1294118, 1,
-0.4121539, -0.6760316, -3.334546, 0, 1, 0.1372549, 1,
-0.4106676, 0.06966913, -0.9769142, 0, 1, 0.1411765, 1,
-0.4060808, 0.02488415, 0.09793177, 0, 1, 0.1490196, 1,
-0.3988867, -0.2903971, -0.6958973, 0, 1, 0.1529412, 1,
-0.3935874, 2.498549, 0.1900933, 0, 1, 0.1607843, 1,
-0.3906562, -0.5105316, -2.576923, 0, 1, 0.1647059, 1,
-0.3851746, 0.8084033, 1.719914, 0, 1, 0.172549, 1,
-0.383905, 0.2653535, 0.5016501, 0, 1, 0.1764706, 1,
-0.3827129, -0.06409366, -1.550542, 0, 1, 0.1843137, 1,
-0.3810854, 0.2265283, -1.190562, 0, 1, 0.1882353, 1,
-0.37978, 0.6400781, 0.105207, 0, 1, 0.1960784, 1,
-0.3797293, 0.4717227, 1.212688, 0, 1, 0.2039216, 1,
-0.3789299, -1.595634, -4.114279, 0, 1, 0.2078431, 1,
-0.3788215, 0.386851, -0.02693352, 0, 1, 0.2156863, 1,
-0.3742024, 0.4716745, 0.07348976, 0, 1, 0.2196078, 1,
-0.3732761, 0.7524492, -1.456346, 0, 1, 0.227451, 1,
-0.3731318, -0.02126145, -1.845504, 0, 1, 0.2313726, 1,
-0.3703671, -1.401713, -2.585773, 0, 1, 0.2392157, 1,
-0.3699267, 0.7989833, 0.333699, 0, 1, 0.2431373, 1,
-0.3663222, -1.748289, -3.40496, 0, 1, 0.2509804, 1,
-0.3601071, -0.3898332, -0.7623159, 0, 1, 0.254902, 1,
-0.3578135, 0.8524711, -0.4146129, 0, 1, 0.2627451, 1,
-0.3577143, 1.38687, -0.5709182, 0, 1, 0.2666667, 1,
-0.357343, 0.3805928, -1.109714, 0, 1, 0.2745098, 1,
-0.357019, 1.257515, -0.5548694, 0, 1, 0.2784314, 1,
-0.3544547, 1.738529, 0.189985, 0, 1, 0.2862745, 1,
-0.3524069, -0.2527625, -3.337137, 0, 1, 0.2901961, 1,
-0.3448271, -0.8515115, -3.893808, 0, 1, 0.2980392, 1,
-0.3442723, -0.3255022, -1.146668, 0, 1, 0.3058824, 1,
-0.3359172, -0.01836019, -1.610812, 0, 1, 0.3098039, 1,
-0.3343405, 0.6070808, -1.439562, 0, 1, 0.3176471, 1,
-0.3245871, 0.3316379, -0.6090805, 0, 1, 0.3215686, 1,
-0.3226474, -0.9159452, -2.320624, 0, 1, 0.3294118, 1,
-0.3202897, -1.189006, -3.657098, 0, 1, 0.3333333, 1,
-0.3176701, -0.5672495, 0.5866882, 0, 1, 0.3411765, 1,
-0.3147754, -0.7759284, -1.746969, 0, 1, 0.345098, 1,
-0.3135403, -0.68479, -3.979789, 0, 1, 0.3529412, 1,
-0.3096966, -1.873123, -4.517134, 0, 1, 0.3568628, 1,
-0.3051517, 0.4914145, 0.1884482, 0, 1, 0.3647059, 1,
-0.3039058, 0.1617708, -0.566481, 0, 1, 0.3686275, 1,
-0.3022163, -1.92052, -1.867221, 0, 1, 0.3764706, 1,
-0.2954919, -0.01179893, -1.998812, 0, 1, 0.3803922, 1,
-0.2941469, -0.2895299, -2.829993, 0, 1, 0.3882353, 1,
-0.2868394, -1.985807, -3.002638, 0, 1, 0.3921569, 1,
-0.2839951, -0.3865477, -0.7583526, 0, 1, 0.4, 1,
-0.2805245, -1.783949, -4.350136, 0, 1, 0.4078431, 1,
-0.2803578, 0.2974951, 0.3474517, 0, 1, 0.4117647, 1,
-0.2790619, 1.659853, 1.712843, 0, 1, 0.4196078, 1,
-0.2760767, 0.1975121, -0.06000705, 0, 1, 0.4235294, 1,
-0.2733834, 1.060965, 0.8272904, 0, 1, 0.4313726, 1,
-0.2728703, 1.124334, -0.9775256, 0, 1, 0.4352941, 1,
-0.2713441, -0.9016408, -2.641698, 0, 1, 0.4431373, 1,
-0.2710921, 0.225518, -0.8567056, 0, 1, 0.4470588, 1,
-0.2688356, -0.005541753, -1.850071, 0, 1, 0.454902, 1,
-0.2685746, -0.4521014, -2.790926, 0, 1, 0.4588235, 1,
-0.2659183, 0.296708, -2.302298, 0, 1, 0.4666667, 1,
-0.265486, -0.3047857, -1.743915, 0, 1, 0.4705882, 1,
-0.2650705, 0.3690975, 0.6407984, 0, 1, 0.4784314, 1,
-0.2637295, 2.157166, -0.380101, 0, 1, 0.4823529, 1,
-0.2546486, -0.1990591, -2.87762, 0, 1, 0.4901961, 1,
-0.2470487, 0.3542463, -2.112242, 0, 1, 0.4941176, 1,
-0.2420697, 0.08056781, -1.544008, 0, 1, 0.5019608, 1,
-0.2415769, -0.375548, -2.463655, 0, 1, 0.509804, 1,
-0.2396214, -1.337883, -3.895779, 0, 1, 0.5137255, 1,
-0.2377386, 0.9908752, -0.1007807, 0, 1, 0.5215687, 1,
-0.2374178, 0.09559584, -2.133931, 0, 1, 0.5254902, 1,
-0.227192, 1.794218, -0.4050179, 0, 1, 0.5333334, 1,
-0.2189276, -0.6516123, -2.726689, 0, 1, 0.5372549, 1,
-0.2179224, -0.141154, -2.238114, 0, 1, 0.5450981, 1,
-0.2137158, -0.3754356, -3.55375, 0, 1, 0.5490196, 1,
-0.2097348, -0.1168679, -1.618205, 0, 1, 0.5568628, 1,
-0.2029334, 0.2580478, 1.070301, 0, 1, 0.5607843, 1,
-0.2009837, 0.5619377, -0.9907325, 0, 1, 0.5686275, 1,
-0.2002306, 0.04425668, -1.843699, 0, 1, 0.572549, 1,
-0.1993809, -0.4944927, -3.288891, 0, 1, 0.5803922, 1,
-0.1984737, 0.2392833, 0.6665817, 0, 1, 0.5843138, 1,
-0.196299, -0.445435, -1.435436, 0, 1, 0.5921569, 1,
-0.188783, 0.4259568, -0.07719059, 0, 1, 0.5960785, 1,
-0.188499, 0.1941298, -2.023839, 0, 1, 0.6039216, 1,
-0.1884342, 0.3574148, -1.696663, 0, 1, 0.6117647, 1,
-0.1881323, -0.2961423, -2.742046, 0, 1, 0.6156863, 1,
-0.1876631, 1.762331, -1.163208, 0, 1, 0.6235294, 1,
-0.187145, -0.3856025, -0.9673433, 0, 1, 0.627451, 1,
-0.1845335, 0.09043528, -2.309788, 0, 1, 0.6352941, 1,
-0.1790731, 0.3373778, -1.12186, 0, 1, 0.6392157, 1,
-0.17424, 1.841175, 0.5780069, 0, 1, 0.6470588, 1,
-0.1732899, 1.136821, 0.3185694, 0, 1, 0.6509804, 1,
-0.1718503, 2.270842, 0.7705603, 0, 1, 0.6588235, 1,
-0.1670974, 0.6842542, -1.192816, 0, 1, 0.6627451, 1,
-0.1644784, -0.1784822, -2.96926, 0, 1, 0.6705883, 1,
-0.1615767, -1.303472, -3.761611, 0, 1, 0.6745098, 1,
-0.1570786, -0.2335794, -1.828166, 0, 1, 0.682353, 1,
-0.1565034, 0.8860382, 1.055921, 0, 1, 0.6862745, 1,
-0.1523248, -0.01366407, -1.445682, 0, 1, 0.6941177, 1,
-0.1434101, 1.011972, -0.5559461, 0, 1, 0.7019608, 1,
-0.1428914, 1.273545, -0.2851138, 0, 1, 0.7058824, 1,
-0.1396101, -0.00579889, -1.365328, 0, 1, 0.7137255, 1,
-0.1344364, -1.475865, -2.408903, 0, 1, 0.7176471, 1,
-0.1187571, 1.041023, 0.1099879, 0, 1, 0.7254902, 1,
-0.118057, -0.7558984, -2.111076, 0, 1, 0.7294118, 1,
-0.1175517, 0.8987661, -0.5767877, 0, 1, 0.7372549, 1,
-0.1113477, -0.6906095, -4.174769, 0, 1, 0.7411765, 1,
-0.109009, 0.09892311, -1.944329, 0, 1, 0.7490196, 1,
-0.1062891, 1.29155, -1.32611, 0, 1, 0.7529412, 1,
-0.104297, 0.8730557, 0.6299756, 0, 1, 0.7607843, 1,
-0.1015289, 0.9405661, -1.321515, 0, 1, 0.7647059, 1,
-0.09797785, 0.5225892, 0.1843861, 0, 1, 0.772549, 1,
-0.09333974, 0.9943174, 0.9606583, 0, 1, 0.7764706, 1,
-0.09301483, 0.4904636, -1.583051, 0, 1, 0.7843137, 1,
-0.09241977, -0.4390968, -1.245493, 0, 1, 0.7882353, 1,
-0.09221126, -1.206673, -5.924909, 0, 1, 0.7960784, 1,
-0.09059951, 0.816146, -0.6749452, 0, 1, 0.8039216, 1,
-0.08854818, -0.02524392, -1.878691, 0, 1, 0.8078431, 1,
-0.08828062, 1.851146, 0.3211724, 0, 1, 0.8156863, 1,
-0.08193818, 0.4494168, -1.5571, 0, 1, 0.8196079, 1,
-0.08011955, -0.336594, -3.316678, 0, 1, 0.827451, 1,
-0.07984475, -1.339412, -4.002892, 0, 1, 0.8313726, 1,
-0.07953136, -0.3945118, -3.118565, 0, 1, 0.8392157, 1,
-0.0756499, -0.2516826, -1.494026, 0, 1, 0.8431373, 1,
-0.07072489, -0.8044279, -3.762972, 0, 1, 0.8509804, 1,
-0.06652094, -0.4054303, -3.608489, 0, 1, 0.854902, 1,
-0.06533185, 0.6302375, -0.4683611, 0, 1, 0.8627451, 1,
-0.06455804, -0.5872308, -2.647465, 0, 1, 0.8666667, 1,
-0.05864322, -0.925294, -4.106884, 0, 1, 0.8745098, 1,
-0.0555434, 0.2516806, 0.2180061, 0, 1, 0.8784314, 1,
-0.05538264, -0.5863402, -2.445775, 0, 1, 0.8862745, 1,
-0.05416601, 0.2224014, 0.372314, 0, 1, 0.8901961, 1,
-0.05109831, 0.2824944, 0.113735, 0, 1, 0.8980392, 1,
-0.05018347, -0.5570571, -5.357866, 0, 1, 0.9058824, 1,
-0.04684238, -0.04136942, -2.264778, 0, 1, 0.9098039, 1,
-0.04304115, -0.1882066, -3.062003, 0, 1, 0.9176471, 1,
-0.0419593, 0.8740646, -0.4541583, 0, 1, 0.9215686, 1,
-0.04074053, 0.4806257, 1.658227, 0, 1, 0.9294118, 1,
-0.03713096, -0.9106106, -2.582689, 0, 1, 0.9333333, 1,
-0.03490033, 0.2606913, 1.004857, 0, 1, 0.9411765, 1,
-0.03168303, -0.5927511, -4.023727, 0, 1, 0.945098, 1,
-0.02844611, 0.966129, -0.5341872, 0, 1, 0.9529412, 1,
-0.02132482, -1.112216, -1.997141, 0, 1, 0.9568627, 1,
-0.01991586, -0.1145515, -2.939477, 0, 1, 0.9647059, 1,
-0.0139566, 0.8844634, 0.4360378, 0, 1, 0.9686275, 1,
-0.01253543, -0.3350087, -2.873362, 0, 1, 0.9764706, 1,
-0.006980774, -1.05646, -1.999292, 0, 1, 0.9803922, 1,
-0.006871059, 0.1661191, 0.5987027, 0, 1, 0.9882353, 1,
-0.00605033, -0.901468, -1.939154, 0, 1, 0.9921569, 1,
-0.005313198, -0.1504484, -4.56677, 0, 1, 1, 1,
-0.001750595, -1.677017, -1.291809, 0, 0.9921569, 1, 1,
0.001556467, -0.6786669, 3.310397, 0, 0.9882353, 1, 1,
0.007076291, -1.781633, 1.904877, 0, 0.9803922, 1, 1,
0.01078337, 0.8081372, 0.2197477, 0, 0.9764706, 1, 1,
0.01996945, -0.4466394, 2.368459, 0, 0.9686275, 1, 1,
0.0250866, 0.563546, 1.20465, 0, 0.9647059, 1, 1,
0.03487308, 1.016312, 0.3615009, 0, 0.9568627, 1, 1,
0.03506034, -1.343111, 2.652164, 0, 0.9529412, 1, 1,
0.0374372, -0.3440817, 3.55145, 0, 0.945098, 1, 1,
0.03854685, -0.1559589, 3.326861, 0, 0.9411765, 1, 1,
0.03860581, 0.6479905, 1.340573, 0, 0.9333333, 1, 1,
0.03977202, 0.207009, 0.8670049, 0, 0.9294118, 1, 1,
0.0420627, 1.041891, -0.8104682, 0, 0.9215686, 1, 1,
0.04476151, 1.193419, -0.6310017, 0, 0.9176471, 1, 1,
0.04580349, -2.020113, 4.75184, 0, 0.9098039, 1, 1,
0.04776274, 0.5797468, 2.187689, 0, 0.9058824, 1, 1,
0.05301394, 0.6657696, -0.1860055, 0, 0.8980392, 1, 1,
0.06125782, 0.1742526, 0.5222808, 0, 0.8901961, 1, 1,
0.06206567, 1.19297, -0.6936915, 0, 0.8862745, 1, 1,
0.06415366, -1.16899, 3.526351, 0, 0.8784314, 1, 1,
0.06516467, -1.371619, 4.47037, 0, 0.8745098, 1, 1,
0.07135627, -0.04166015, 1.760403, 0, 0.8666667, 1, 1,
0.0746958, 2.164273, 0.3806809, 0, 0.8627451, 1, 1,
0.0752141, 0.3163296, -0.5864476, 0, 0.854902, 1, 1,
0.07660683, 0.110861, 1.868141, 0, 0.8509804, 1, 1,
0.07713384, -1.092026, 1.948707, 0, 0.8431373, 1, 1,
0.08020562, 0.3040157, -0.8391044, 0, 0.8392157, 1, 1,
0.08107883, 0.8389421, -1.191843, 0, 0.8313726, 1, 1,
0.08524273, 0.6391279, 1.337784, 0, 0.827451, 1, 1,
0.08561131, 2.105395, -0.568727, 0, 0.8196079, 1, 1,
0.09007167, 0.03016459, 1.221363, 0, 0.8156863, 1, 1,
0.09232407, 1.574598, 0.8336329, 0, 0.8078431, 1, 1,
0.09289662, -0.7977228, 3.005258, 0, 0.8039216, 1, 1,
0.09342729, 1.304969, 0.3644575, 0, 0.7960784, 1, 1,
0.09988593, -0.7634506, 2.768873, 0, 0.7882353, 1, 1,
0.1004478, -0.1125366, 1.090526, 0, 0.7843137, 1, 1,
0.1066446, 0.1154413, 1.456599, 0, 0.7764706, 1, 1,
0.1101275, 0.2262018, 1.639892, 0, 0.772549, 1, 1,
0.1119332, -1.325831, 2.919852, 0, 0.7647059, 1, 1,
0.1122289, 0.5001704, -1.036313, 0, 0.7607843, 1, 1,
0.1127349, 0.1764591, -1.019291, 0, 0.7529412, 1, 1,
0.1195827, 0.06393797, 0.8073887, 0, 0.7490196, 1, 1,
0.1261972, -0.2384596, 2.917318, 0, 0.7411765, 1, 1,
0.1315827, 2.033175, -0.06288608, 0, 0.7372549, 1, 1,
0.1330169, -1.042922, 3.08245, 0, 0.7294118, 1, 1,
0.1336987, 0.6969883, 1.089542, 0, 0.7254902, 1, 1,
0.1383489, -1.919593, 2.647749, 0, 0.7176471, 1, 1,
0.1397498, -2.418981, 1.729729, 0, 0.7137255, 1, 1,
0.1433914, 1.154272, -0.5012866, 0, 0.7058824, 1, 1,
0.1446749, -1.067304, 2.276869, 0, 0.6980392, 1, 1,
0.1447757, 0.02575613, 1.323623, 0, 0.6941177, 1, 1,
0.1476012, 1.454891, 0.4860287, 0, 0.6862745, 1, 1,
0.1516273, -0.8797756, 2.988073, 0, 0.682353, 1, 1,
0.1518236, 0.9340065, -0.2358669, 0, 0.6745098, 1, 1,
0.1518693, 0.1937372, 0.9251865, 0, 0.6705883, 1, 1,
0.1524584, 0.4134921, 0.6690618, 0, 0.6627451, 1, 1,
0.1595551, -0.3923879, 1.628897, 0, 0.6588235, 1, 1,
0.1671481, 0.3032866, 1.0897, 0, 0.6509804, 1, 1,
0.1688536, -0.2398433, 2.00758, 0, 0.6470588, 1, 1,
0.1694483, -1.134951, 1.536356, 0, 0.6392157, 1, 1,
0.171459, 1.210801, -0.2847898, 0, 0.6352941, 1, 1,
0.1738496, 1.607978, 1.834218, 0, 0.627451, 1, 1,
0.1777849, 0.05865394, 1.224201, 0, 0.6235294, 1, 1,
0.179779, -1.722169, 2.34498, 0, 0.6156863, 1, 1,
0.1811077, 0.06873804, 0.9352328, 0, 0.6117647, 1, 1,
0.1818536, 0.7727852, -0.8941659, 0, 0.6039216, 1, 1,
0.1831674, -0.2876543, 3.174491, 0, 0.5960785, 1, 1,
0.1838148, 0.8511337, -0.6992018, 0, 0.5921569, 1, 1,
0.1870959, 0.1660507, -0.7031408, 0, 0.5843138, 1, 1,
0.1875474, -1.469625, 0.9575146, 0, 0.5803922, 1, 1,
0.1892029, -0.233545, 2.558937, 0, 0.572549, 1, 1,
0.1900514, 1.699062, 0.7041252, 0, 0.5686275, 1, 1,
0.1905373, 1.188664, 1.712012, 0, 0.5607843, 1, 1,
0.2015823, 0.01926583, 3.075431, 0, 0.5568628, 1, 1,
0.2043504, -1.449521, 3.020149, 0, 0.5490196, 1, 1,
0.204436, 0.6610749, -1.042781, 0, 0.5450981, 1, 1,
0.2089693, 1.938691, 0.991195, 0, 0.5372549, 1, 1,
0.2129811, -1.242876, 0.7016658, 0, 0.5333334, 1, 1,
0.2146527, -0.2664775, 2.437307, 0, 0.5254902, 1, 1,
0.216338, 0.1848659, -0.9131672, 0, 0.5215687, 1, 1,
0.2172588, 0.6347968, -0.4793021, 0, 0.5137255, 1, 1,
0.219457, 0.3999016, 0.05049684, 0, 0.509804, 1, 1,
0.2198434, -0.1947345, 1.165204, 0, 0.5019608, 1, 1,
0.2199181, 0.6515172, 0.6514707, 0, 0.4941176, 1, 1,
0.2207379, 0.6259158, -0.3243953, 0, 0.4901961, 1, 1,
0.2210514, -0.2042441, 2.13234, 0, 0.4823529, 1, 1,
0.2277838, 2.178957, -0.8889678, 0, 0.4784314, 1, 1,
0.2301831, 0.9321022, 0.2329625, 0, 0.4705882, 1, 1,
0.2327428, 0.6918789, 1.383688, 0, 0.4666667, 1, 1,
0.234151, 0.1587641, 1.069521, 0, 0.4588235, 1, 1,
0.2348933, -0.1747388, 1.830806, 0, 0.454902, 1, 1,
0.2350309, -0.7868118, 3.061848, 0, 0.4470588, 1, 1,
0.2373034, 0.08416932, 1.460703, 0, 0.4431373, 1, 1,
0.2399819, -0.4545028, 3.027535, 0, 0.4352941, 1, 1,
0.2438344, -0.02123706, 2.495779, 0, 0.4313726, 1, 1,
0.2449306, 1.570752, 0.3730324, 0, 0.4235294, 1, 1,
0.2468379, 0.1870281, 0.7702275, 0, 0.4196078, 1, 1,
0.2481731, -0.559183, 0.8156192, 0, 0.4117647, 1, 1,
0.2503865, -0.573699, 2.826211, 0, 0.4078431, 1, 1,
0.2524492, 0.1866874, 1.732044, 0, 0.4, 1, 1,
0.255788, 1.081758, 1.715286, 0, 0.3921569, 1, 1,
0.2577545, -0.05499389, 2.378769, 0, 0.3882353, 1, 1,
0.2599494, 0.7363605, 0.5623878, 0, 0.3803922, 1, 1,
0.2638726, -1.988369, 3.917168, 0, 0.3764706, 1, 1,
0.2654686, -0.1517397, 4.44234, 0, 0.3686275, 1, 1,
0.2674373, 0.07513219, 1.00794, 0, 0.3647059, 1, 1,
0.2705985, 0.602036, 0.7143906, 0, 0.3568628, 1, 1,
0.2723869, 1.132542, 1.246276, 0, 0.3529412, 1, 1,
0.2726257, -0.2021024, 0.9625941, 0, 0.345098, 1, 1,
0.2737678, -0.2261941, 2.957601, 0, 0.3411765, 1, 1,
0.2738776, 0.9954842, 1.152305, 0, 0.3333333, 1, 1,
0.2774389, 1.619428, -0.5926969, 0, 0.3294118, 1, 1,
0.2797779, -0.4371044, 1.680891, 0, 0.3215686, 1, 1,
0.2817689, -0.07772162, 2.024885, 0, 0.3176471, 1, 1,
0.2845896, 1.649608, 0.7803327, 0, 0.3098039, 1, 1,
0.2860878, -0.1372328, 3.610629, 0, 0.3058824, 1, 1,
0.2900108, -0.06456427, 1.058455, 0, 0.2980392, 1, 1,
0.2900771, -0.2606921, 2.309823, 0, 0.2901961, 1, 1,
0.2941146, -1.219554, 0.9765781, 0, 0.2862745, 1, 1,
0.294386, 0.9461816, 1.849376, 0, 0.2784314, 1, 1,
0.2944119, -0.1831787, 2.823729, 0, 0.2745098, 1, 1,
0.2966821, -1.302737, 2.079835, 0, 0.2666667, 1, 1,
0.3074696, 0.5298585, 0.8403936, 0, 0.2627451, 1, 1,
0.3087732, 0.8096688, 1.152961, 0, 0.254902, 1, 1,
0.3194135, -0.3055947, 1.11599, 0, 0.2509804, 1, 1,
0.3195257, 0.2360247, 1.077789, 0, 0.2431373, 1, 1,
0.3212371, -0.1515366, 2.307243, 0, 0.2392157, 1, 1,
0.3239523, 1.402722, -1.4216, 0, 0.2313726, 1, 1,
0.3358332, -2.171089, 3.940053, 0, 0.227451, 1, 1,
0.3360762, 0.9218693, -0.5414982, 0, 0.2196078, 1, 1,
0.3397643, -1.652875, 2.410351, 0, 0.2156863, 1, 1,
0.3472012, 0.8710145, 0.04284479, 0, 0.2078431, 1, 1,
0.3494557, 2.349832, -0.2769554, 0, 0.2039216, 1, 1,
0.3637566, -0.2417569, 2.788337, 0, 0.1960784, 1, 1,
0.3677487, 1.339239, 0.06171655, 0, 0.1882353, 1, 1,
0.3714824, 0.3337379, 1.745696, 0, 0.1843137, 1, 1,
0.3747861, 1.491912, 0.7508388, 0, 0.1764706, 1, 1,
0.3781865, 1.384259, -0.6614206, 0, 0.172549, 1, 1,
0.3793128, -0.4010421, 2.149775, 0, 0.1647059, 1, 1,
0.3826106, -1.045995, 2.895216, 0, 0.1607843, 1, 1,
0.385194, 0.3856564, 2.076608, 0, 0.1529412, 1, 1,
0.3854474, 0.2571122, -0.06412712, 0, 0.1490196, 1, 1,
0.3954705, 0.3269845, 2.398646, 0, 0.1411765, 1, 1,
0.3970653, -1.079628, 3.273495, 0, 0.1372549, 1, 1,
0.4076742, -0.3783538, 2.772229, 0, 0.1294118, 1, 1,
0.4085574, 0.8295635, 1.635402, 0, 0.1254902, 1, 1,
0.4108858, -0.3310433, 3.02032, 0, 0.1176471, 1, 1,
0.4109571, -0.7432402, 2.345341, 0, 0.1137255, 1, 1,
0.4146191, -1.384513, 2.229043, 0, 0.1058824, 1, 1,
0.4160604, -0.1176103, 2.023876, 0, 0.09803922, 1, 1,
0.4172206, -0.8903012, 0.8372886, 0, 0.09411765, 1, 1,
0.4191651, -0.4813023, 1.446226, 0, 0.08627451, 1, 1,
0.4197859, 0.4071348, -0.07000792, 0, 0.08235294, 1, 1,
0.4212052, -0.5597576, 2.479898, 0, 0.07450981, 1, 1,
0.425787, 0.3798801, -0.8348542, 0, 0.07058824, 1, 1,
0.4285021, -0.4470276, 0.5968414, 0, 0.0627451, 1, 1,
0.429952, -2.064316, 3.44047, 0, 0.05882353, 1, 1,
0.4309618, -0.6086426, 2.388508, 0, 0.05098039, 1, 1,
0.4359816, -2.231028, 3.125843, 0, 0.04705882, 1, 1,
0.4401594, -1.874041, 2.113212, 0, 0.03921569, 1, 1,
0.4415532, -0.5832956, 2.986562, 0, 0.03529412, 1, 1,
0.4425686, -0.1733198, 0.9784667, 0, 0.02745098, 1, 1,
0.4446194, 0.5555741, 0.5090392, 0, 0.02352941, 1, 1,
0.4473797, -1.36724, 4.53441, 0, 0.01568628, 1, 1,
0.4480656, 0.04390869, 1.410787, 0, 0.01176471, 1, 1,
0.4510714, -0.3257759, 2.55236, 0, 0.003921569, 1, 1,
0.4517352, 0.4585423, -0.1157646, 0.003921569, 0, 1, 1,
0.4526726, 1.418421, -0.3436157, 0.007843138, 0, 1, 1,
0.4541517, -0.5716829, 2.515778, 0.01568628, 0, 1, 1,
0.4551367, 0.5271122, 0.9710318, 0.01960784, 0, 1, 1,
0.4563163, -1.192762, 4.463839, 0.02745098, 0, 1, 1,
0.456555, 1.059391, 0.8408152, 0.03137255, 0, 1, 1,
0.4590784, 0.09115875, 0.844442, 0.03921569, 0, 1, 1,
0.4693203, 1.342811, 2.163004, 0.04313726, 0, 1, 1,
0.4704078, 0.2316874, 1.804177, 0.05098039, 0, 1, 1,
0.4730154, -1.432681, 2.182623, 0.05490196, 0, 1, 1,
0.4773028, 0.211543, 1.991048, 0.0627451, 0, 1, 1,
0.4793491, -0.6449889, 2.908865, 0.06666667, 0, 1, 1,
0.4799742, -0.1519798, 2.672209, 0.07450981, 0, 1, 1,
0.4799774, -0.08887515, 1.56756, 0.07843138, 0, 1, 1,
0.4804976, 1.444472, 0.6220092, 0.08627451, 0, 1, 1,
0.4811589, -0.6455679, 2.612304, 0.09019608, 0, 1, 1,
0.4834158, -0.2642798, 1.612224, 0.09803922, 0, 1, 1,
0.4843122, 0.920208, -1.553212, 0.1058824, 0, 1, 1,
0.4879783, 1.394135, 0.1790004, 0.1098039, 0, 1, 1,
0.4908022, 1.041823, 1.671808, 0.1176471, 0, 1, 1,
0.4931439, 0.07597496, 1.674804, 0.1215686, 0, 1, 1,
0.4973493, -1.142138, 2.699879, 0.1294118, 0, 1, 1,
0.4981025, 3.300383, -0.09609047, 0.1333333, 0, 1, 1,
0.4981836, 1.459689, 1.343014, 0.1411765, 0, 1, 1,
0.500756, 0.205649, -0.03336312, 0.145098, 0, 1, 1,
0.506131, 0.7137026, 1.046879, 0.1529412, 0, 1, 1,
0.5071504, 1.647453, 0.2437069, 0.1568628, 0, 1, 1,
0.5096884, 2.107746, 1.925682, 0.1647059, 0, 1, 1,
0.5149061, 1.505844, -0.9548669, 0.1686275, 0, 1, 1,
0.5152362, -1.735907, 2.763353, 0.1764706, 0, 1, 1,
0.5189379, -2.832503, 1.948219, 0.1803922, 0, 1, 1,
0.5279242, 1.638895, 1.769148, 0.1882353, 0, 1, 1,
0.5445293, 0.5106791, 0.8369516, 0.1921569, 0, 1, 1,
0.5527762, 0.8459353, 1.811402, 0.2, 0, 1, 1,
0.5550774, 2.204515, 0.3444139, 0.2078431, 0, 1, 1,
0.5562661, -0.3776498, 1.917554, 0.2117647, 0, 1, 1,
0.5614495, -0.434682, 0.8987486, 0.2196078, 0, 1, 1,
0.5635803, -1.114502, 2.01745, 0.2235294, 0, 1, 1,
0.563926, -0.7247329, 3.208334, 0.2313726, 0, 1, 1,
0.5647146, -0.3710023, 2.770309, 0.2352941, 0, 1, 1,
0.5656224, 0.5309663, 0.947824, 0.2431373, 0, 1, 1,
0.5657379, -0.1279378, 1.814007, 0.2470588, 0, 1, 1,
0.5660459, -0.8051966, 1.886666, 0.254902, 0, 1, 1,
0.5671083, 0.7029041, 0.0414455, 0.2588235, 0, 1, 1,
0.5696002, -0.8795153, 1.888033, 0.2666667, 0, 1, 1,
0.5814356, -1.088861, 2.490283, 0.2705882, 0, 1, 1,
0.5835471, -0.1234146, -0.001778173, 0.2784314, 0, 1, 1,
0.5856813, 0.1352588, 2.291168, 0.282353, 0, 1, 1,
0.5869249, 1.555822, -0.2720197, 0.2901961, 0, 1, 1,
0.5876731, 0.1088212, 3.213665, 0.2941177, 0, 1, 1,
0.5901974, -1.02053, 2.592543, 0.3019608, 0, 1, 1,
0.5910802, -2.649471, 2.411995, 0.3098039, 0, 1, 1,
0.593131, 0.6249704, 1.623301, 0.3137255, 0, 1, 1,
0.5960953, -1.543135, 1.244076, 0.3215686, 0, 1, 1,
0.5973232, 0.8424012, 0.4441586, 0.3254902, 0, 1, 1,
0.6030242, -0.8427544, 1.82851, 0.3333333, 0, 1, 1,
0.607695, -1.260629, 3.807094, 0.3372549, 0, 1, 1,
0.6088498, 0.3386945, -0.7144433, 0.345098, 0, 1, 1,
0.6142091, -0.7574358, 2.60645, 0.3490196, 0, 1, 1,
0.6149526, -1.153101, 1.216753, 0.3568628, 0, 1, 1,
0.6149788, 0.5077441, 2.563765, 0.3607843, 0, 1, 1,
0.6160552, -1.185271, 3.920331, 0.3686275, 0, 1, 1,
0.6195542, -1.198866, 4.498913, 0.372549, 0, 1, 1,
0.6264422, -0.5054189, 1.658858, 0.3803922, 0, 1, 1,
0.6296967, -0.944042, 3.351087, 0.3843137, 0, 1, 1,
0.6341978, -0.4367721, 1.913123, 0.3921569, 0, 1, 1,
0.6351932, 1.50785, -0.08217501, 0.3960784, 0, 1, 1,
0.6362759, -1.382849, 1.429183, 0.4039216, 0, 1, 1,
0.6374461, 0.8528722, 0.4439024, 0.4117647, 0, 1, 1,
0.6403655, -0.372141, 1.833747, 0.4156863, 0, 1, 1,
0.6407183, 0.5967691, 1.056257, 0.4235294, 0, 1, 1,
0.6417081, -0.5468216, 1.289171, 0.427451, 0, 1, 1,
0.6420239, 0.1573429, 3.897939, 0.4352941, 0, 1, 1,
0.6433378, -1.141247, 3.326406, 0.4392157, 0, 1, 1,
0.6464726, 0.6562203, -0.8895488, 0.4470588, 0, 1, 1,
0.6478288, 0.5473168, 1.321371, 0.4509804, 0, 1, 1,
0.6553742, 0.9831929, 0.816054, 0.4588235, 0, 1, 1,
0.655688, 0.4621504, 1.619724, 0.4627451, 0, 1, 1,
0.6569833, -0.1047006, 1.213887, 0.4705882, 0, 1, 1,
0.6581164, -0.6553685, 2.696624, 0.4745098, 0, 1, 1,
0.6587581, -0.5784302, 1.692461, 0.4823529, 0, 1, 1,
0.6721113, -0.3684153, 1.701615, 0.4862745, 0, 1, 1,
0.6721908, 1.387635, 0.5159951, 0.4941176, 0, 1, 1,
0.6829134, -1.878167, 2.968749, 0.5019608, 0, 1, 1,
0.6853478, 0.6540445, 0.01816225, 0.5058824, 0, 1, 1,
0.690634, 0.4128797, -0.8330469, 0.5137255, 0, 1, 1,
0.6950401, -0.9686229, 3.716776, 0.5176471, 0, 1, 1,
0.6967479, -0.8514839, 2.614937, 0.5254902, 0, 1, 1,
0.7008935, -0.5240549, 1.183182, 0.5294118, 0, 1, 1,
0.7035483, -0.4983352, 3.848621, 0.5372549, 0, 1, 1,
0.7073886, 0.01684794, 1.708319, 0.5411765, 0, 1, 1,
0.7109845, 2.632489, -1.170374, 0.5490196, 0, 1, 1,
0.7144354, 0.9032837, 0.523322, 0.5529412, 0, 1, 1,
0.715001, 0.2875397, 0.7033877, 0.5607843, 0, 1, 1,
0.7266116, 0.1290107, 2.222708, 0.5647059, 0, 1, 1,
0.7288734, 0.3892588, 1.772218, 0.572549, 0, 1, 1,
0.7333001, 0.5109, 1.898634, 0.5764706, 0, 1, 1,
0.7350281, 0.4644475, 0.02078781, 0.5843138, 0, 1, 1,
0.740105, -1.567458, 2.17502, 0.5882353, 0, 1, 1,
0.7477236, 0.7028698, 1.328742, 0.5960785, 0, 1, 1,
0.7527937, 0.52932, 0.8963806, 0.6039216, 0, 1, 1,
0.7551679, -0.4934122, 1.667529, 0.6078432, 0, 1, 1,
0.7576026, 0.6804147, 0.5719298, 0.6156863, 0, 1, 1,
0.7597098, 0.2377726, 0.8246812, 0.6196079, 0, 1, 1,
0.7608078, -0.8189331, 1.336248, 0.627451, 0, 1, 1,
0.7650621, -0.771548, 1.89553, 0.6313726, 0, 1, 1,
0.7684882, -0.3843317, 1.852604, 0.6392157, 0, 1, 1,
0.7687943, 1.310142, 0.34863, 0.6431373, 0, 1, 1,
0.7703151, 2.360496, 0.428967, 0.6509804, 0, 1, 1,
0.7768866, 1.692727, -0.4183914, 0.654902, 0, 1, 1,
0.7771907, -1.268603, 3.185972, 0.6627451, 0, 1, 1,
0.7980832, -1.323408, 3.629741, 0.6666667, 0, 1, 1,
0.7984038, 0.5206946, 1.243045, 0.6745098, 0, 1, 1,
0.7996562, 0.6898867, 1.790395, 0.6784314, 0, 1, 1,
0.8001748, 0.4798506, 0.820134, 0.6862745, 0, 1, 1,
0.8004128, 0.0323857, 1.863395, 0.6901961, 0, 1, 1,
0.8043784, -0.7474733, 3.16111, 0.6980392, 0, 1, 1,
0.8055384, -0.5866719, 1.404245, 0.7058824, 0, 1, 1,
0.8087243, 0.04771045, -0.2101809, 0.7098039, 0, 1, 1,
0.8099191, 0.5022088, 1.77253, 0.7176471, 0, 1, 1,
0.8126741, -1.269226, 3.060897, 0.7215686, 0, 1, 1,
0.8148904, -1.864233, 1.693839, 0.7294118, 0, 1, 1,
0.8194057, -0.2539317, 2.031925, 0.7333333, 0, 1, 1,
0.8209981, 0.9384125, 0.7660708, 0.7411765, 0, 1, 1,
0.8275953, 0.9907843, 2.096229, 0.7450981, 0, 1, 1,
0.8295467, 0.3119672, 0.3630655, 0.7529412, 0, 1, 1,
0.8320261, -0.2622871, 2.046548, 0.7568628, 0, 1, 1,
0.834103, 0.838443, -0.155733, 0.7647059, 0, 1, 1,
0.835874, -0.1822991, -0.05489477, 0.7686275, 0, 1, 1,
0.8370628, -0.3312584, 2.211291, 0.7764706, 0, 1, 1,
0.8441848, -1.074686, 3.103996, 0.7803922, 0, 1, 1,
0.8478354, 0.3406128, 2.282377, 0.7882353, 0, 1, 1,
0.8506349, 1.599751, 1.203601, 0.7921569, 0, 1, 1,
0.8555685, 0.5932788, 1.597484, 0.8, 0, 1, 1,
0.8576212, -0.4396646, 2.547029, 0.8078431, 0, 1, 1,
0.8582947, -1.569294, 2.462018, 0.8117647, 0, 1, 1,
0.8636978, -1.385821, 1.977843, 0.8196079, 0, 1, 1,
0.8705252, 0.9338014, 0.2554711, 0.8235294, 0, 1, 1,
0.8713613, -1.255542, 0.6909129, 0.8313726, 0, 1, 1,
0.8827075, 1.390415, 1.940115, 0.8352941, 0, 1, 1,
0.8935847, 0.69455, 0.8035221, 0.8431373, 0, 1, 1,
0.8944674, -1.233013, 3.177168, 0.8470588, 0, 1, 1,
0.9001901, -0.9644931, 3.121819, 0.854902, 0, 1, 1,
0.9009086, 0.6505873, 0.1576238, 0.8588235, 0, 1, 1,
0.9053044, 0.8176237, 0.02745289, 0.8666667, 0, 1, 1,
0.9057605, 1.465524, 0.7797446, 0.8705882, 0, 1, 1,
0.9124507, -0.4864398, 2.535969, 0.8784314, 0, 1, 1,
0.9254243, -0.748759, 2.530717, 0.8823529, 0, 1, 1,
0.9296303, 0.7634266, 0.2266789, 0.8901961, 0, 1, 1,
0.9338437, -1.014389, 1.601003, 0.8941177, 0, 1, 1,
0.9372467, 0.9894094, 1.04107, 0.9019608, 0, 1, 1,
0.9402274, 0.8120667, 0.2177524, 0.9098039, 0, 1, 1,
0.9444572, -0.3099098, 2.62558, 0.9137255, 0, 1, 1,
0.9468977, 2.64628, -0.709334, 0.9215686, 0, 1, 1,
0.9508063, -0.545719, 1.337253, 0.9254902, 0, 1, 1,
0.9515661, 0.1926043, 0.6165667, 0.9333333, 0, 1, 1,
0.9555327, -0.1243263, 2.105489, 0.9372549, 0, 1, 1,
0.9555961, 0.3649006, 0.8106871, 0.945098, 0, 1, 1,
0.9610726, 0.09794737, 1.783757, 0.9490196, 0, 1, 1,
0.9614153, -2.289622, 0.95904, 0.9568627, 0, 1, 1,
0.9657173, 0.4942766, 1.250601, 0.9607843, 0, 1, 1,
0.97426, 1.085358, 0.02468972, 0.9686275, 0, 1, 1,
0.9761204, 0.2251302, 0.44336, 0.972549, 0, 1, 1,
0.9875886, -1.55465, 2.047082, 0.9803922, 0, 1, 1,
0.989113, 0.1820985, 1.134587, 0.9843137, 0, 1, 1,
0.9995356, -0.6357817, 2.25109, 0.9921569, 0, 1, 1,
0.9996949, -0.2482723, 0.942026, 0.9960784, 0, 1, 1,
1.002754, -0.3021477, 2.745228, 1, 0, 0.9960784, 1,
1.010962, -1.972243, 3.277082, 1, 0, 0.9882353, 1,
1.015239, 0.1101163, 0.634539, 1, 0, 0.9843137, 1,
1.016712, 0.4446667, 2.005456, 1, 0, 0.9764706, 1,
1.021042, -0.4767455, 2.473162, 1, 0, 0.972549, 1,
1.022133, -1.962547, 3.059753, 1, 0, 0.9647059, 1,
1.027933, -0.4218298, 0.9686303, 1, 0, 0.9607843, 1,
1.031599, 1.280333, -0.3297738, 1, 0, 0.9529412, 1,
1.03161, 0.06492923, 1.254797, 1, 0, 0.9490196, 1,
1.032265, -0.6258309, 0.6800426, 1, 0, 0.9411765, 1,
1.032597, 0.4819816, 0.972435, 1, 0, 0.9372549, 1,
1.037315, -0.5675871, 1.623402, 1, 0, 0.9294118, 1,
1.040904, -0.188604, 0.4487891, 1, 0, 0.9254902, 1,
1.041139, -2.304431, 3.601049, 1, 0, 0.9176471, 1,
1.043411, 1.632705, 1.059684, 1, 0, 0.9137255, 1,
1.051418, -1.714755, 0.652303, 1, 0, 0.9058824, 1,
1.05511, 0.01067493, 1.534996, 1, 0, 0.9019608, 1,
1.06085, 2.268457, 0.8293427, 1, 0, 0.8941177, 1,
1.068744, -1.533062, 1.844964, 1, 0, 0.8862745, 1,
1.07494, -0.1004919, 1.757069, 1, 0, 0.8823529, 1,
1.078209, 1.969468, 0.7901783, 1, 0, 0.8745098, 1,
1.079868, -1.150861, 2.47118, 1, 0, 0.8705882, 1,
1.084569, 0.6743301, 1.371343, 1, 0, 0.8627451, 1,
1.08653, -1.159672, 2.992917, 1, 0, 0.8588235, 1,
1.087514, -0.03770521, 2.673385, 1, 0, 0.8509804, 1,
1.094252, -1.399804, -0.7297311, 1, 0, 0.8470588, 1,
1.101703, 0.2815058, 1.782269, 1, 0, 0.8392157, 1,
1.105036, 0.2170478, 0.6456678, 1, 0, 0.8352941, 1,
1.106121, -0.9043383, 0.7240776, 1, 0, 0.827451, 1,
1.110585, -0.5528438, 2.316263, 1, 0, 0.8235294, 1,
1.114594, 1.495581, -0.1844369, 1, 0, 0.8156863, 1,
1.114767, 0.6505962, 0.4508614, 1, 0, 0.8117647, 1,
1.115116, -0.9929602, 3.068385, 1, 0, 0.8039216, 1,
1.115352, 0.2341276, -0.9775391, 1, 0, 0.7960784, 1,
1.11871, -0.05116192, 2.367579, 1, 0, 0.7921569, 1,
1.121491, -0.5307285, 3.529849, 1, 0, 0.7843137, 1,
1.128423, -0.9490173, 3.017398, 1, 0, 0.7803922, 1,
1.151605, -0.599773, 0.5930433, 1, 0, 0.772549, 1,
1.158589, 0.7473218, 0.5563182, 1, 0, 0.7686275, 1,
1.159472, 1.662655, 0.4066899, 1, 0, 0.7607843, 1,
1.166629, -0.9777222, 2.86281, 1, 0, 0.7568628, 1,
1.178345, 0.6558037, 2.188076, 1, 0, 0.7490196, 1,
1.184228, -1.005836, 2.285606, 1, 0, 0.7450981, 1,
1.185485, 1.274131, 1.629052, 1, 0, 0.7372549, 1,
1.190109, 0.4206301, 2.131387, 1, 0, 0.7333333, 1,
1.192847, -0.2072279, 1.421567, 1, 0, 0.7254902, 1,
1.19886, -1.425131, 3.261482, 1, 0, 0.7215686, 1,
1.201632, -0.8830619, 1.184667, 1, 0, 0.7137255, 1,
1.205838, -0.8142254, 1.873919, 1, 0, 0.7098039, 1,
1.212146, 1.142779, -0.2569964, 1, 0, 0.7019608, 1,
1.216769, 0.2530601, -0.1162976, 1, 0, 0.6941177, 1,
1.217069, -0.611199, 2.005339, 1, 0, 0.6901961, 1,
1.219094, -0.5817022, 1.590538, 1, 0, 0.682353, 1,
1.224858, 0.5801139, 3.403173, 1, 0, 0.6784314, 1,
1.230104, -0.6268061, 0.8556972, 1, 0, 0.6705883, 1,
1.232002, -1.900766, 1.590948, 1, 0, 0.6666667, 1,
1.236928, -0.2574501, 1.172401, 1, 0, 0.6588235, 1,
1.24089, -0.4055456, 0.6377903, 1, 0, 0.654902, 1,
1.264766, 0.5061237, 1.214832, 1, 0, 0.6470588, 1,
1.276849, 0.4338577, 1.963399, 1, 0, 0.6431373, 1,
1.278501, 0.3826287, 1.883699, 1, 0, 0.6352941, 1,
1.282631, 1.840279, 0.02387388, 1, 0, 0.6313726, 1,
1.292805, 0.4743274, 1.41454, 1, 0, 0.6235294, 1,
1.300107, -0.0233256, 1.82162, 1, 0, 0.6196079, 1,
1.300499, 1.673854, 1.68058, 1, 0, 0.6117647, 1,
1.302361, 0.4265015, 0.172469, 1, 0, 0.6078432, 1,
1.303983, 0.1728087, -0.215276, 1, 0, 0.6, 1,
1.307272, 0.7594259, 1.308193, 1, 0, 0.5921569, 1,
1.312635, 1.033165, 0.18289, 1, 0, 0.5882353, 1,
1.319789, -0.7231801, 3.398961, 1, 0, 0.5803922, 1,
1.345224, 0.1888899, 0.4311607, 1, 0, 0.5764706, 1,
1.347513, -0.1264237, 0.238035, 1, 0, 0.5686275, 1,
1.356207, -0.4915659, 2.094379, 1, 0, 0.5647059, 1,
1.374292, 0.81442, 0.6211461, 1, 0, 0.5568628, 1,
1.377376, -2.079849, 2.273859, 1, 0, 0.5529412, 1,
1.380735, 1.044333, 0.6850457, 1, 0, 0.5450981, 1,
1.386482, 0.1099652, 3.167133, 1, 0, 0.5411765, 1,
1.390852, 0.5848358, 1.882402, 1, 0, 0.5333334, 1,
1.39193, -1.198291, -0.09255466, 1, 0, 0.5294118, 1,
1.396904, -2.453595, 1.324529, 1, 0, 0.5215687, 1,
1.398944, -0.4302148, 2.444871, 1, 0, 0.5176471, 1,
1.401388, 0.02482703, 0.5534996, 1, 0, 0.509804, 1,
1.408551, 0.879166, 0.4974196, 1, 0, 0.5058824, 1,
1.411474, -0.7896236, 1.226504, 1, 0, 0.4980392, 1,
1.413868, 0.764861, -0.06942482, 1, 0, 0.4901961, 1,
1.414618, -0.9251679, 2.282824, 1, 0, 0.4862745, 1,
1.415563, 1.067616, 2.277315, 1, 0, 0.4784314, 1,
1.419954, -1.567902, 0.2381707, 1, 0, 0.4745098, 1,
1.424404, -1.057433, 2.481096, 1, 0, 0.4666667, 1,
1.432218, -0.3820596, 0.543439, 1, 0, 0.4627451, 1,
1.447752, 0.1660035, 1.994571, 1, 0, 0.454902, 1,
1.449762, -0.2662222, 2.611857, 1, 0, 0.4509804, 1,
1.455473, 0.6254932, -0.1687132, 1, 0, 0.4431373, 1,
1.459504, -1.153537, 1.274954, 1, 0, 0.4392157, 1,
1.46331, 0.7586144, 1.020813, 1, 0, 0.4313726, 1,
1.46352, -0.1457575, 0.6901021, 1, 0, 0.427451, 1,
1.469617, -0.4418155, 3.871876, 1, 0, 0.4196078, 1,
1.476632, 0.02910757, 1.306083, 1, 0, 0.4156863, 1,
1.489675, 1.169766, 0.1913272, 1, 0, 0.4078431, 1,
1.502042, 1.287278, -1.099703, 1, 0, 0.4039216, 1,
1.503286, -0.4780374, 1.446283, 1, 0, 0.3960784, 1,
1.511422, -0.446764, 1.905425, 1, 0, 0.3882353, 1,
1.524259, -0.5045189, 1.459392, 1, 0, 0.3843137, 1,
1.525781, -0.1903515, 1.94588, 1, 0, 0.3764706, 1,
1.535553, -0.979974, 1.93958, 1, 0, 0.372549, 1,
1.541055, -0.2290977, 2.159659, 1, 0, 0.3647059, 1,
1.556587, -0.1062551, -0.9011509, 1, 0, 0.3607843, 1,
1.561803, 1.66208, 0.1343158, 1, 0, 0.3529412, 1,
1.569556, 0.486396, 2.143324, 1, 0, 0.3490196, 1,
1.572436, -0.6236724, 1.423875, 1, 0, 0.3411765, 1,
1.57817, 0.7175254, 0.5859768, 1, 0, 0.3372549, 1,
1.585441, -0.5543576, 1.11402, 1, 0, 0.3294118, 1,
1.586244, -2.415434, 2.072438, 1, 0, 0.3254902, 1,
1.58846, -0.1329493, 3.605419, 1, 0, 0.3176471, 1,
1.603104, -1.133122, 2.776743, 1, 0, 0.3137255, 1,
1.612649, -0.1211634, 1.142541, 1, 0, 0.3058824, 1,
1.618866, 0.8479192, 0.1741343, 1, 0, 0.2980392, 1,
1.621754, -0.06289884, 3.33824, 1, 0, 0.2941177, 1,
1.648526, 2.060924, 0.07941819, 1, 0, 0.2862745, 1,
1.661465, -0.2469276, 1.43428, 1, 0, 0.282353, 1,
1.664803, -0.461758, 1.953644, 1, 0, 0.2745098, 1,
1.670141, -0.8554584, 1.765997, 1, 0, 0.2705882, 1,
1.673243, 0.1258557, 1.047698, 1, 0, 0.2627451, 1,
1.692221, 0.2566055, 1.948133, 1, 0, 0.2588235, 1,
1.708238, -0.4722043, 3.872283, 1, 0, 0.2509804, 1,
1.714932, 1.314252, 0.7070271, 1, 0, 0.2470588, 1,
1.753167, -0.8926667, 1.297007, 1, 0, 0.2392157, 1,
1.753347, 0.4475346, 1.24846, 1, 0, 0.2352941, 1,
1.75995, 0.268534, 1.280445, 1, 0, 0.227451, 1,
1.796755, 0.9296899, 0.562084, 1, 0, 0.2235294, 1,
1.81152, -0.684567, 1.456555, 1, 0, 0.2156863, 1,
1.81384, -1.068895, 3.120325, 1, 0, 0.2117647, 1,
1.8331, 0.8862039, 1.321335, 1, 0, 0.2039216, 1,
1.834981, 0.881871, 0.1709503, 1, 0, 0.1960784, 1,
1.853081, -0.9891801, 1.496488, 1, 0, 0.1921569, 1,
1.869548, 0.9835584, 1.299294, 1, 0, 0.1843137, 1,
1.879348, -0.9338114, 2.214873, 1, 0, 0.1803922, 1,
1.919098, -0.2866516, 0.6556934, 1, 0, 0.172549, 1,
1.954873, -2.008236, 1.431085, 1, 0, 0.1686275, 1,
1.95825, -1.466187, -1.001277, 1, 0, 0.1607843, 1,
2.016245, 0.1890135, 0.174586, 1, 0, 0.1568628, 1,
2.030274, -0.2485147, 0.8468744, 1, 0, 0.1490196, 1,
2.046701, 0.7695326, 1.57037, 1, 0, 0.145098, 1,
2.063739, -0.5104886, 2.894394, 1, 0, 0.1372549, 1,
2.084841, -2.473334, 4.05115, 1, 0, 0.1333333, 1,
2.095217, -0.99297, 1.818408, 1, 0, 0.1254902, 1,
2.09915, 1.677133, 0.5248297, 1, 0, 0.1215686, 1,
2.107957, 1.106748, 2.059296, 1, 0, 0.1137255, 1,
2.128629, 0.8540376, 2.027115, 1, 0, 0.1098039, 1,
2.145818, -1.112171, 3.339844, 1, 0, 0.1019608, 1,
2.158387, 0.1326326, 0.4486646, 1, 0, 0.09411765, 1,
2.183355, 1.014278, 0.7630666, 1, 0, 0.09019608, 1,
2.265598, -0.05958837, 1.204531, 1, 0, 0.08235294, 1,
2.270798, 1.732454, -0.8233865, 1, 0, 0.07843138, 1,
2.295179, 0.1056627, 2.499281, 1, 0, 0.07058824, 1,
2.332086, -0.07715407, 1.913777, 1, 0, 0.06666667, 1,
2.377141, 0.8775401, 2.437079, 1, 0, 0.05882353, 1,
2.403183, -1.039044, 3.640858, 1, 0, 0.05490196, 1,
2.466342, 0.5627273, 0.002967213, 1, 0, 0.04705882, 1,
2.512259, -0.2358148, 2.741406, 1, 0, 0.04313726, 1,
2.531798, -2.140158, 1.998424, 1, 0, 0.03529412, 1,
2.573147, -1.61248, 3.407048, 1, 0, 0.03137255, 1,
2.576184, -2.03582, 2.353506, 1, 0, 0.02352941, 1,
2.661588, -0.3337896, 0.005825603, 1, 0, 0.01960784, 1,
2.744077, 0.8749413, 0.869787, 1, 0, 0.01176471, 1,
3.045881, -0.2417517, 1.146314, 1, 0, 0.007843138, 1
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
-0.1205783, -4.158531, -7.734618, 0, -0.5, 0.5, 0.5,
-0.1205783, -4.158531, -7.734618, 1, -0.5, 0.5, 0.5,
-0.1205783, -4.158531, -7.734618, 1, 1.5, 0.5, 0.5,
-0.1205783, -4.158531, -7.734618, 0, 1.5, 0.5, 0.5
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
-4.360467, 0.1114498, -7.734618, 0, -0.5, 0.5, 0.5,
-4.360467, 0.1114498, -7.734618, 1, -0.5, 0.5, 0.5,
-4.360467, 0.1114498, -7.734618, 1, 1.5, 0.5, 0.5,
-4.360467, 0.1114498, -7.734618, 0, 1.5, 0.5, 0.5
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
-4.360467, -4.158531, -0.5865345, 0, -0.5, 0.5, 0.5,
-4.360467, -4.158531, -0.5865345, 1, -0.5, 0.5, 0.5,
-4.360467, -4.158531, -0.5865345, 1, 1.5, 0.5, 0.5,
-4.360467, -4.158531, -0.5865345, 0, 1.5, 0.5, 0.5
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
-3, -3.173151, -6.08506,
3, -3.173151, -6.08506,
-3, -3.173151, -6.08506,
-3, -3.337381, -6.359987,
-2, -3.173151, -6.08506,
-2, -3.337381, -6.359987,
-1, -3.173151, -6.08506,
-1, -3.337381, -6.359987,
0, -3.173151, -6.08506,
0, -3.337381, -6.359987,
1, -3.173151, -6.08506,
1, -3.337381, -6.359987,
2, -3.173151, -6.08506,
2, -3.337381, -6.359987,
3, -3.173151, -6.08506,
3, -3.337381, -6.359987
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
-3, -3.665841, -6.909839, 0, -0.5, 0.5, 0.5,
-3, -3.665841, -6.909839, 1, -0.5, 0.5, 0.5,
-3, -3.665841, -6.909839, 1, 1.5, 0.5, 0.5,
-3, -3.665841, -6.909839, 0, 1.5, 0.5, 0.5,
-2, -3.665841, -6.909839, 0, -0.5, 0.5, 0.5,
-2, -3.665841, -6.909839, 1, -0.5, 0.5, 0.5,
-2, -3.665841, -6.909839, 1, 1.5, 0.5, 0.5,
-2, -3.665841, -6.909839, 0, 1.5, 0.5, 0.5,
-1, -3.665841, -6.909839, 0, -0.5, 0.5, 0.5,
-1, -3.665841, -6.909839, 1, -0.5, 0.5, 0.5,
-1, -3.665841, -6.909839, 1, 1.5, 0.5, 0.5,
-1, -3.665841, -6.909839, 0, 1.5, 0.5, 0.5,
0, -3.665841, -6.909839, 0, -0.5, 0.5, 0.5,
0, -3.665841, -6.909839, 1, -0.5, 0.5, 0.5,
0, -3.665841, -6.909839, 1, 1.5, 0.5, 0.5,
0, -3.665841, -6.909839, 0, 1.5, 0.5, 0.5,
1, -3.665841, -6.909839, 0, -0.5, 0.5, 0.5,
1, -3.665841, -6.909839, 1, -0.5, 0.5, 0.5,
1, -3.665841, -6.909839, 1, 1.5, 0.5, 0.5,
1, -3.665841, -6.909839, 0, 1.5, 0.5, 0.5,
2, -3.665841, -6.909839, 0, -0.5, 0.5, 0.5,
2, -3.665841, -6.909839, 1, -0.5, 0.5, 0.5,
2, -3.665841, -6.909839, 1, 1.5, 0.5, 0.5,
2, -3.665841, -6.909839, 0, 1.5, 0.5, 0.5,
3, -3.665841, -6.909839, 0, -0.5, 0.5, 0.5,
3, -3.665841, -6.909839, 1, -0.5, 0.5, 0.5,
3, -3.665841, -6.909839, 1, 1.5, 0.5, 0.5,
3, -3.665841, -6.909839, 0, 1.5, 0.5, 0.5
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
-3.382032, -3, -6.08506,
-3.382032, 3, -6.08506,
-3.382032, -3, -6.08506,
-3.545104, -3, -6.359987,
-3.382032, -2, -6.08506,
-3.545104, -2, -6.359987,
-3.382032, -1, -6.08506,
-3.545104, -1, -6.359987,
-3.382032, 0, -6.08506,
-3.545104, 0, -6.359987,
-3.382032, 1, -6.08506,
-3.545104, 1, -6.359987,
-3.382032, 2, -6.08506,
-3.545104, 2, -6.359987,
-3.382032, 3, -6.08506,
-3.545104, 3, -6.359987
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
-3.87125, -3, -6.909839, 0, -0.5, 0.5, 0.5,
-3.87125, -3, -6.909839, 1, -0.5, 0.5, 0.5,
-3.87125, -3, -6.909839, 1, 1.5, 0.5, 0.5,
-3.87125, -3, -6.909839, 0, 1.5, 0.5, 0.5,
-3.87125, -2, -6.909839, 0, -0.5, 0.5, 0.5,
-3.87125, -2, -6.909839, 1, -0.5, 0.5, 0.5,
-3.87125, -2, -6.909839, 1, 1.5, 0.5, 0.5,
-3.87125, -2, -6.909839, 0, 1.5, 0.5, 0.5,
-3.87125, -1, -6.909839, 0, -0.5, 0.5, 0.5,
-3.87125, -1, -6.909839, 1, -0.5, 0.5, 0.5,
-3.87125, -1, -6.909839, 1, 1.5, 0.5, 0.5,
-3.87125, -1, -6.909839, 0, 1.5, 0.5, 0.5,
-3.87125, 0, -6.909839, 0, -0.5, 0.5, 0.5,
-3.87125, 0, -6.909839, 1, -0.5, 0.5, 0.5,
-3.87125, 0, -6.909839, 1, 1.5, 0.5, 0.5,
-3.87125, 0, -6.909839, 0, 1.5, 0.5, 0.5,
-3.87125, 1, -6.909839, 0, -0.5, 0.5, 0.5,
-3.87125, 1, -6.909839, 1, -0.5, 0.5, 0.5,
-3.87125, 1, -6.909839, 1, 1.5, 0.5, 0.5,
-3.87125, 1, -6.909839, 0, 1.5, 0.5, 0.5,
-3.87125, 2, -6.909839, 0, -0.5, 0.5, 0.5,
-3.87125, 2, -6.909839, 1, -0.5, 0.5, 0.5,
-3.87125, 2, -6.909839, 1, 1.5, 0.5, 0.5,
-3.87125, 2, -6.909839, 0, 1.5, 0.5, 0.5,
-3.87125, 3, -6.909839, 0, -0.5, 0.5, 0.5,
-3.87125, 3, -6.909839, 1, -0.5, 0.5, 0.5,
-3.87125, 3, -6.909839, 1, 1.5, 0.5, 0.5,
-3.87125, 3, -6.909839, 0, 1.5, 0.5, 0.5
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
-3.382032, -3.173151, -4,
-3.382032, -3.173151, 4,
-3.382032, -3.173151, -4,
-3.545104, -3.337381, -4,
-3.382032, -3.173151, -2,
-3.545104, -3.337381, -2,
-3.382032, -3.173151, 0,
-3.545104, -3.337381, 0,
-3.382032, -3.173151, 2,
-3.545104, -3.337381, 2,
-3.382032, -3.173151, 4,
-3.545104, -3.337381, 4
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
-3.87125, -3.665841, -4, 0, -0.5, 0.5, 0.5,
-3.87125, -3.665841, -4, 1, -0.5, 0.5, 0.5,
-3.87125, -3.665841, -4, 1, 1.5, 0.5, 0.5,
-3.87125, -3.665841, -4, 0, 1.5, 0.5, 0.5,
-3.87125, -3.665841, -2, 0, -0.5, 0.5, 0.5,
-3.87125, -3.665841, -2, 1, -0.5, 0.5, 0.5,
-3.87125, -3.665841, -2, 1, 1.5, 0.5, 0.5,
-3.87125, -3.665841, -2, 0, 1.5, 0.5, 0.5,
-3.87125, -3.665841, 0, 0, -0.5, 0.5, 0.5,
-3.87125, -3.665841, 0, 1, -0.5, 0.5, 0.5,
-3.87125, -3.665841, 0, 1, 1.5, 0.5, 0.5,
-3.87125, -3.665841, 0, 0, 1.5, 0.5, 0.5,
-3.87125, -3.665841, 2, 0, -0.5, 0.5, 0.5,
-3.87125, -3.665841, 2, 1, -0.5, 0.5, 0.5,
-3.87125, -3.665841, 2, 1, 1.5, 0.5, 0.5,
-3.87125, -3.665841, 2, 0, 1.5, 0.5, 0.5,
-3.87125, -3.665841, 4, 0, -0.5, 0.5, 0.5,
-3.87125, -3.665841, 4, 1, -0.5, 0.5, 0.5,
-3.87125, -3.665841, 4, 1, 1.5, 0.5, 0.5,
-3.87125, -3.665841, 4, 0, 1.5, 0.5, 0.5
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
-3.382032, -3.173151, -6.08506,
-3.382032, 3.396051, -6.08506,
-3.382032, -3.173151, 4.911991,
-3.382032, 3.396051, 4.911991,
-3.382032, -3.173151, -6.08506,
-3.382032, -3.173151, 4.911991,
-3.382032, 3.396051, -6.08506,
-3.382032, 3.396051, 4.911991,
-3.382032, -3.173151, -6.08506,
3.140875, -3.173151, -6.08506,
-3.382032, -3.173151, 4.911991,
3.140875, -3.173151, 4.911991,
-3.382032, 3.396051, -6.08506,
3.140875, 3.396051, -6.08506,
-3.382032, 3.396051, 4.911991,
3.140875, 3.396051, 4.911991,
3.140875, -3.173151, -6.08506,
3.140875, 3.396051, -6.08506,
3.140875, -3.173151, 4.911991,
3.140875, 3.396051, 4.911991,
3.140875, -3.173151, -6.08506,
3.140875, -3.173151, 4.911991,
3.140875, 3.396051, -6.08506,
3.140875, 3.396051, 4.911991
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
var radius = 7.67592;
var distance = 34.15104;
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
mvMatrix.translate( 0.1205783, -0.1114498, 0.5865345 );
mvMatrix.scale( 1.27234, 1.263373, 0.7546891 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.15104);
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
DSM<-read.table("DSM.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-DSM$V2
```

```
## Error in eval(expr, envir, enclos): object 'DSM' not found
```

```r
y<-DSM$V3
```

```
## Error in eval(expr, envir, enclos): object 'DSM' not found
```

```r
z<-DSM$V4
```

```
## Error in eval(expr, envir, enclos): object 'DSM' not found
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
-3.287038, -1.69997, -2.229246, 0, 0, 1, 1, 1,
-2.935409, 1.348464, -1.446414, 1, 0, 0, 1, 1,
-2.788495, 0.4240254, -0.3389089, 1, 0, 0, 1, 1,
-2.732462, 0.6765079, -2.321595, 1, 0, 0, 1, 1,
-2.705554, -0.02930362, -1.948948, 1, 0, 0, 1, 1,
-2.599146, -0.6381096, -2.537309, 1, 0, 0, 1, 1,
-2.411817, -0.114398, -0.4278108, 0, 0, 0, 1, 1,
-2.347045, -0.5390941, -2.532124, 0, 0, 0, 1, 1,
-2.323091, -1.658282, -2.428341, 0, 0, 0, 1, 1,
-2.304816, 0.7129443, -2.065999, 0, 0, 0, 1, 1,
-2.23998, -0.4558351, -3.074831, 0, 0, 0, 1, 1,
-2.217204, -0.7812018, -2.149179, 0, 0, 0, 1, 1,
-2.129691, 0.2070547, -0.9758486, 0, 0, 0, 1, 1,
-2.11622, 0.163423, -0.595887, 1, 1, 1, 1, 1,
-2.093779, 1.027251, -1.605385, 1, 1, 1, 1, 1,
-2.087329, 0.0005753345, -1.453272, 1, 1, 1, 1, 1,
-2.02854, -0.2119042, 0.1735251, 1, 1, 1, 1, 1,
-2.01955, -1.823416, -2.13421, 1, 1, 1, 1, 1,
-2.016325, -0.021359, -1.044777, 1, 1, 1, 1, 1,
-2.008601, 1.661786, -1.424343, 1, 1, 1, 1, 1,
-1.99371, 1.098106, -2.489449, 1, 1, 1, 1, 1,
-1.974538, 0.9700189, -1.425286, 1, 1, 1, 1, 1,
-1.967437, -0.4979124, -1.170594, 1, 1, 1, 1, 1,
-1.92028, 0.6380596, -1.929039, 1, 1, 1, 1, 1,
-1.899759, 1.08113, 0.4753264, 1, 1, 1, 1, 1,
-1.899176, -0.1839248, -1.19424, 1, 1, 1, 1, 1,
-1.892989, -0.5612933, -0.1244301, 1, 1, 1, 1, 1,
-1.891944, 0.02993491, -2.334491, 1, 1, 1, 1, 1,
-1.873995, -0.0330141, -1.123619, 0, 0, 1, 1, 1,
-1.872652, 1.471641, -1.674085, 1, 0, 0, 1, 1,
-1.8701, -0.1938375, -1.423511, 1, 0, 0, 1, 1,
-1.867537, 0.6291788, -3.793631, 1, 0, 0, 1, 1,
-1.820147, -2.112137, -1.878382, 1, 0, 0, 1, 1,
-1.812677, 0.5176183, -0.2308443, 1, 0, 0, 1, 1,
-1.810873, -1.087475, -1.518703, 0, 0, 0, 1, 1,
-1.80376, -0.9128396, -3.289797, 0, 0, 0, 1, 1,
-1.789901, 0.3380613, -0.7458643, 0, 0, 0, 1, 1,
-1.789722, -1.907963, -0.9118885, 0, 0, 0, 1, 1,
-1.781677, 1.28541, -1.118006, 0, 0, 0, 1, 1,
-1.780589, -1.456155, -2.665232, 0, 0, 0, 1, 1,
-1.776835, -2.845229, -1.955708, 0, 0, 0, 1, 1,
-1.776362, 0.5254555, -2.670436, 1, 1, 1, 1, 1,
-1.773864, 2.047162, 0.1475658, 1, 1, 1, 1, 1,
-1.772788, -0.2469659, -0.4951985, 1, 1, 1, 1, 1,
-1.766841, -0.2222146, -3.595301, 1, 1, 1, 1, 1,
-1.762925, 1.125403, -2.806376, 1, 1, 1, 1, 1,
-1.73205, 0.8406487, -2.122583, 1, 1, 1, 1, 1,
-1.720359, 0.9334725, 1.284349, 1, 1, 1, 1, 1,
-1.711776, 1.020204, -0.9225086, 1, 1, 1, 1, 1,
-1.704422, 0.8398645, -2.363597, 1, 1, 1, 1, 1,
-1.703755, 0.8642358, -2.481592, 1, 1, 1, 1, 1,
-1.703734, 1.383661, 0.9091523, 1, 1, 1, 1, 1,
-1.692438, 0.7137727, -0.5005604, 1, 1, 1, 1, 1,
-1.686019, -0.7351745, -2.533308, 1, 1, 1, 1, 1,
-1.682411, 1.249248, -1.520193, 1, 1, 1, 1, 1,
-1.668802, 1.029042, -0.9388258, 1, 1, 1, 1, 1,
-1.661192, 0.5045896, 0.9972629, 0, 0, 1, 1, 1,
-1.658254, -0.3442687, -0.9975015, 1, 0, 0, 1, 1,
-1.654243, 0.8051065, -0.4965788, 1, 0, 0, 1, 1,
-1.639423, -0.4026389, -1.565753, 1, 0, 0, 1, 1,
-1.625889, -0.8692783, -1.36892, 1, 0, 0, 1, 1,
-1.61998, -0.01977473, -3.726473, 1, 0, 0, 1, 1,
-1.607695, 0.1266355, -3.446884, 0, 0, 0, 1, 1,
-1.6043, -1.328926, -2.465594, 0, 0, 0, 1, 1,
-1.602335, -0.03311137, -1.422289, 0, 0, 0, 1, 1,
-1.599284, 0.5870686, -1.490649, 0, 0, 0, 1, 1,
-1.595037, 0.6489961, -4.04503, 0, 0, 0, 1, 1,
-1.591153, -0.008000678, -0.476853, 0, 0, 0, 1, 1,
-1.588036, -0.0131688, -1.069502, 0, 0, 0, 1, 1,
-1.573021, -0.3803911, -1.968054, 1, 1, 1, 1, 1,
-1.57067, 0.3594851, -1.367438, 1, 1, 1, 1, 1,
-1.565725, 0.5149024, -0.6518436, 1, 1, 1, 1, 1,
-1.541485, -1.018257, -1.804747, 1, 1, 1, 1, 1,
-1.53768, -0.5759383, -1.896857, 1, 1, 1, 1, 1,
-1.525314, -1.192714, -1.541088, 1, 1, 1, 1, 1,
-1.52171, 1.229896, -2.656595, 1, 1, 1, 1, 1,
-1.509892, 0.1442529, -2.520916, 1, 1, 1, 1, 1,
-1.503056, 0.002908888, -1.123134, 1, 1, 1, 1, 1,
-1.498197, 0.4571086, -0.9565964, 1, 1, 1, 1, 1,
-1.490348, 0.1285138, -0.6856749, 1, 1, 1, 1, 1,
-1.485663, 0.9590471, 0.09646247, 1, 1, 1, 1, 1,
-1.470885, -1.164175, -2.387384, 1, 1, 1, 1, 1,
-1.446256, 0.8283191, -1.364663, 1, 1, 1, 1, 1,
-1.439089, -0.8496037, -2.377373, 1, 1, 1, 1, 1,
-1.436993, -0.02044137, -2.091749, 0, 0, 1, 1, 1,
-1.436652, 0.3344619, -0.7756119, 1, 0, 0, 1, 1,
-1.42229, 0.405459, -2.696831, 1, 0, 0, 1, 1,
-1.407018, 0.09916582, -4.030611, 1, 0, 0, 1, 1,
-1.405072, 0.3664088, -2.50174, 1, 0, 0, 1, 1,
-1.400421, 0.1101736, 0.5284886, 1, 0, 0, 1, 1,
-1.396472, 0.5752054, -0.5988631, 0, 0, 0, 1, 1,
-1.387539, 0.6619996, -3.139537, 0, 0, 0, 1, 1,
-1.376861, 1.916874, -0.525185, 0, 0, 0, 1, 1,
-1.373942, -0.09176372, -2.397805, 0, 0, 0, 1, 1,
-1.361697, 1.158269, -0.8555144, 0, 0, 0, 1, 1,
-1.351375, 1.504608, -1.091783, 0, 0, 0, 1, 1,
-1.349627, 0.5421209, -0.4315459, 0, 0, 0, 1, 1,
-1.34553, 0.8461871, -1.72095, 1, 1, 1, 1, 1,
-1.337391, -0.05588407, -2.017323, 1, 1, 1, 1, 1,
-1.335465, 0.4600627, -1.675407, 1, 1, 1, 1, 1,
-1.326457, 1.016953, 1.486137, 1, 1, 1, 1, 1,
-1.316812, 0.2532802, -2.114589, 1, 1, 1, 1, 1,
-1.30578, 0.8264707, -0.8343297, 1, 1, 1, 1, 1,
-1.30383, 2.621901, 0.2329302, 1, 1, 1, 1, 1,
-1.303673, 1.116733, -1.667582, 1, 1, 1, 1, 1,
-1.302781, 0.007131808, -1.397486, 1, 1, 1, 1, 1,
-1.297094, -0.5358731, -2.074078, 1, 1, 1, 1, 1,
-1.296354, 0.2078569, -1.677212, 1, 1, 1, 1, 1,
-1.285114, -0.9432103, -2.073245, 1, 1, 1, 1, 1,
-1.28248, -0.01778238, -1.932814, 1, 1, 1, 1, 1,
-1.281206, 0.462772, -0.6848797, 1, 1, 1, 1, 1,
-1.278321, 0.1165878, -2.406703, 1, 1, 1, 1, 1,
-1.270588, 2.033469, -2.424118, 0, 0, 1, 1, 1,
-1.261568, -0.2336976, -1.708228, 1, 0, 0, 1, 1,
-1.246108, -0.1724849, -1.740511, 1, 0, 0, 1, 1,
-1.243915, -0.4634193, -1.350356, 1, 0, 0, 1, 1,
-1.242646, 1.635763, -1.769527, 1, 0, 0, 1, 1,
-1.236498, 0.8528251, -2.311208, 1, 0, 0, 1, 1,
-1.236103, -0.4629299, -1.261555, 0, 0, 0, 1, 1,
-1.224326, -0.7050769, -2.931219, 0, 0, 0, 1, 1,
-1.220391, -1.25476, -3.51583, 0, 0, 0, 1, 1,
-1.220149, 2.072317, -0.2225728, 0, 0, 0, 1, 1,
-1.220045, -1.283854, -4.869933, 0, 0, 0, 1, 1,
-1.208934, -0.6668741, -3.761292, 0, 0, 0, 1, 1,
-1.201918, -0.502667, -3.649134, 0, 0, 0, 1, 1,
-1.200593, 0.1935908, -2.10721, 1, 1, 1, 1, 1,
-1.178625, -0.375302, -0.9233633, 1, 1, 1, 1, 1,
-1.176319, 0.6095015, -1.281142, 1, 1, 1, 1, 1,
-1.173998, 1.239549, -2.553348, 1, 1, 1, 1, 1,
-1.171123, 0.3455222, -1.829072, 1, 1, 1, 1, 1,
-1.169309, -1.417864, -2.747232, 1, 1, 1, 1, 1,
-1.167142, 1.228478, 0.3828386, 1, 1, 1, 1, 1,
-1.157126, 0.1465182, -0.9780075, 1, 1, 1, 1, 1,
-1.145052, 1.36964, -2.124732, 1, 1, 1, 1, 1,
-1.144054, -0.07783093, -0.5583614, 1, 1, 1, 1, 1,
-1.139001, -0.4318962, -1.875118, 1, 1, 1, 1, 1,
-1.137035, 0.1546223, -3.848391, 1, 1, 1, 1, 1,
-1.121995, 0.3145255, -3.883651, 1, 1, 1, 1, 1,
-1.113478, -0.94981, 0.586973, 1, 1, 1, 1, 1,
-1.107675, 0.2129417, -1.662358, 1, 1, 1, 1, 1,
-1.099596, -0.6936005, -1.448728, 0, 0, 1, 1, 1,
-1.088882, 0.1278653, -2.007499, 1, 0, 0, 1, 1,
-1.082584, 0.835307, -1.301129, 1, 0, 0, 1, 1,
-1.07529, -0.4768103, -3.137422, 1, 0, 0, 1, 1,
-1.07496, -0.5148945, -1.984139, 1, 0, 0, 1, 1,
-1.074579, -0.6040398, -3.70357, 1, 0, 0, 1, 1,
-1.074206, -0.9712769, -2.23196, 0, 0, 0, 1, 1,
-1.069752, -0.230974, -2.344615, 0, 0, 0, 1, 1,
-1.069207, 1.22308, -0.9955651, 0, 0, 0, 1, 1,
-1.068756, -0.6051285, -0.9607474, 0, 0, 0, 1, 1,
-1.068293, 0.3872825, 0.2262074, 0, 0, 0, 1, 1,
-1.059688, -1.54131, -2.194528, 0, 0, 0, 1, 1,
-1.057449, -0.5238116, -3.126734, 0, 0, 0, 1, 1,
-1.057173, 0.6445029, -0.06352799, 1, 1, 1, 1, 1,
-1.053176, -1.417738, -3.476643, 1, 1, 1, 1, 1,
-1.049112, 0.9175386, -1.669819, 1, 1, 1, 1, 1,
-1.042699, 1.533049, -1.998589, 1, 1, 1, 1, 1,
-1.038905, -0.1301975, -1.881093, 1, 1, 1, 1, 1,
-1.032409, 0.04441717, -2.456076, 1, 1, 1, 1, 1,
-1.027196, 0.2400054, -0.8728626, 1, 1, 1, 1, 1,
-1.022774, -0.316242, -1.529965, 1, 1, 1, 1, 1,
-1.022039, 0.7501127, -1.441449, 1, 1, 1, 1, 1,
-1.019691, -1.179304, -2.57001, 1, 1, 1, 1, 1,
-1.003271, -2.574972, -2.130015, 1, 1, 1, 1, 1,
-0.9973209, -0.3697523, -2.760113, 1, 1, 1, 1, 1,
-0.9950407, -0.6221996, -2.615316, 1, 1, 1, 1, 1,
-0.992467, -0.3245386, -0.9181055, 1, 1, 1, 1, 1,
-0.9924617, 0.9917073, -1.403057, 1, 1, 1, 1, 1,
-0.9828685, -0.06577433, -1.782685, 0, 0, 1, 1, 1,
-0.9792005, 0.002478079, -1.527997, 1, 0, 0, 1, 1,
-0.9783594, -0.7308509, -2.05019, 1, 0, 0, 1, 1,
-0.9749013, -2.045301, -4.376618, 1, 0, 0, 1, 1,
-0.97371, -0.5861828, -0.007946785, 1, 0, 0, 1, 1,
-0.970147, 1.628297, -1.923677, 1, 0, 0, 1, 1,
-0.9666352, 0.7172729, -1.368549, 0, 0, 0, 1, 1,
-0.9663614, -0.6678007, -1.37489, 0, 0, 0, 1, 1,
-0.961445, 0.1532497, -2.890176, 0, 0, 0, 1, 1,
-0.9531095, -0.2124267, -1.988079, 0, 0, 0, 1, 1,
-0.9519759, -0.2756959, -1.627699, 0, 0, 0, 1, 1,
-0.943865, 0.183534, -2.083809, 0, 0, 0, 1, 1,
-0.9384842, -2.361675, -1.603364, 0, 0, 0, 1, 1,
-0.9359835, 2.152842, -0.08432419, 1, 1, 1, 1, 1,
-0.9287642, 0.8721757, -1.66764, 1, 1, 1, 1, 1,
-0.9252587, -0.8249224, -1.220459, 1, 1, 1, 1, 1,
-0.9247779, 1.194782, -0.1194618, 1, 1, 1, 1, 1,
-0.9247651, 0.1156641, 0.4845031, 1, 1, 1, 1, 1,
-0.9193946, 0.1453273, -2.63786, 1, 1, 1, 1, 1,
-0.9191974, -0.1961679, -1.773249, 1, 1, 1, 1, 1,
-0.9186649, -0.5623101, -2.593564, 1, 1, 1, 1, 1,
-0.9097989, 0.9528286, -2.260587, 1, 1, 1, 1, 1,
-0.9032577, -1.760517, -1.982891, 1, 1, 1, 1, 1,
-0.9006271, 0.7881573, -1.128529, 1, 1, 1, 1, 1,
-0.8982717, -0.4651147, -2.281389, 1, 1, 1, 1, 1,
-0.8938665, -0.8312188, -1.022053, 1, 1, 1, 1, 1,
-0.8852662, 0.5573027, -1.844063, 1, 1, 1, 1, 1,
-0.8795034, -0.8183224, -1.786175, 1, 1, 1, 1, 1,
-0.8790354, 0.2924233, -1.358219, 0, 0, 1, 1, 1,
-0.8733972, -0.3195571, -2.892049, 1, 0, 0, 1, 1,
-0.8718847, -0.8388072, -1.343301, 1, 0, 0, 1, 1,
-0.8691391, 0.1237039, -2.005765, 1, 0, 0, 1, 1,
-0.8689279, 0.1751706, -1.910868, 1, 0, 0, 1, 1,
-0.8682631, 0.01378742, -1.145932, 1, 0, 0, 1, 1,
-0.8647221, -1.491423, -2.819241, 0, 0, 0, 1, 1,
-0.8581707, -0.861784, -1.284253, 0, 0, 0, 1, 1,
-0.8540246, 0.8421725, -0.2300088, 0, 0, 0, 1, 1,
-0.8446332, -0.5521726, -1.571474, 0, 0, 0, 1, 1,
-0.8369395, 1.185513, 0.2204996, 0, 0, 0, 1, 1,
-0.8331555, 0.01606446, -1.26691, 0, 0, 0, 1, 1,
-0.8292279, -2.641108, -3.896994, 0, 0, 0, 1, 1,
-0.8257957, 0.5895456, -0.003106694, 1, 1, 1, 1, 1,
-0.825003, -0.4405873, -3.982713, 1, 1, 1, 1, 1,
-0.8213896, -0.1341193, -1.657131, 1, 1, 1, 1, 1,
-0.8172408, 0.196284, 0.3019697, 1, 1, 1, 1, 1,
-0.8164654, -1.270964, -1.852705, 1, 1, 1, 1, 1,
-0.8138478, -0.3952871, -1.58382, 1, 1, 1, 1, 1,
-0.8135509, 0.01622637, -2.218868, 1, 1, 1, 1, 1,
-0.8071468, 1.242343, 0.4717511, 1, 1, 1, 1, 1,
-0.8053759, -0.1365031, -2.479783, 1, 1, 1, 1, 1,
-0.8035184, 1.963933, 0.371854, 1, 1, 1, 1, 1,
-0.7993881, 1.169104, 0.0846008, 1, 1, 1, 1, 1,
-0.7931337, -1.425872, -3.637771, 1, 1, 1, 1, 1,
-0.7927467, -1.683275, -2.028972, 1, 1, 1, 1, 1,
-0.7912348, -0.8015324, -4.269378, 1, 1, 1, 1, 1,
-0.7879074, 0.1076195, -3.009906, 1, 1, 1, 1, 1,
-0.7858981, -0.5166556, -2.997281, 0, 0, 1, 1, 1,
-0.7850381, 0.4625317, -0.3946085, 1, 0, 0, 1, 1,
-0.7842144, -0.5400059, -3.521408, 1, 0, 0, 1, 1,
-0.7811592, 0.5131373, -1.72062, 1, 0, 0, 1, 1,
-0.7786557, 1.166698, -1.54337, 1, 0, 0, 1, 1,
-0.7772571, -0.4559295, -1.653821, 1, 0, 0, 1, 1,
-0.7656163, -0.3352001, -1.819894, 0, 0, 0, 1, 1,
-0.7645336, 2.813983, -0.8261394, 0, 0, 0, 1, 1,
-0.7536095, 1.538864, -0.7939414, 0, 0, 0, 1, 1,
-0.747512, -0.2076313, -1.972373, 0, 0, 0, 1, 1,
-0.7463628, -0.6243589, -0.9221066, 0, 0, 0, 1, 1,
-0.7450944, 0.4728931, -1.27122, 0, 0, 0, 1, 1,
-0.74436, -1.008619, -2.096482, 0, 0, 0, 1, 1,
-0.7427331, 0.2996458, -0.5543246, 1, 1, 1, 1, 1,
-0.7415115, -0.8886508, -2.582662, 1, 1, 1, 1, 1,
-0.7363098, 0.654008, 1.703965, 1, 1, 1, 1, 1,
-0.7318815, 0.09740442, -1.038355, 1, 1, 1, 1, 1,
-0.7296591, -0.3706858, -2.141736, 1, 1, 1, 1, 1,
-0.717007, 0.6148311, -0.8359641, 1, 1, 1, 1, 1,
-0.7162613, -0.7463669, -1.869251, 1, 1, 1, 1, 1,
-0.7144252, 0.1440726, -1.957037, 1, 1, 1, 1, 1,
-0.7135683, -0.7717696, -4.151383, 1, 1, 1, 1, 1,
-0.712486, 0.7305629, -1.155009, 1, 1, 1, 1, 1,
-0.7115095, 0.1970786, -1.3113, 1, 1, 1, 1, 1,
-0.71104, 1.291429, 0.6208375, 1, 1, 1, 1, 1,
-0.7094255, -0.786172, -2.817472, 1, 1, 1, 1, 1,
-0.7089683, -0.7765402, -1.448754, 1, 1, 1, 1, 1,
-0.7066361, 0.1140783, -0.8916935, 1, 1, 1, 1, 1,
-0.7044109, -0.1139705, -0.4020023, 0, 0, 1, 1, 1,
-0.6858852, 1.475886, 1.208205, 1, 0, 0, 1, 1,
-0.6853138, -0.2147242, -1.762111, 1, 0, 0, 1, 1,
-0.6818587, -0.1551643, -1.912234, 1, 0, 0, 1, 1,
-0.6722461, -2.220938, -1.856991, 1, 0, 0, 1, 1,
-0.6712629, -1.02226, -2.078476, 1, 0, 0, 1, 1,
-0.6684887, 1.611446, 0.2109033, 0, 0, 0, 1, 1,
-0.6682431, -1.843742, -3.710376, 0, 0, 0, 1, 1,
-0.6636333, -0.2108316, -2.195029, 0, 0, 0, 1, 1,
-0.6598388, -0.318014, -0.7180052, 0, 0, 0, 1, 1,
-0.6595269, 0.5569742, 0.170099, 0, 0, 0, 1, 1,
-0.6587934, -1.672042, -3.060113, 0, 0, 0, 1, 1,
-0.6571307, -1.919987, -2.570435, 0, 0, 0, 1, 1,
-0.6569596, 1.780632, -0.552642, 1, 1, 1, 1, 1,
-0.6568553, 0.7213554, 0.2574022, 1, 1, 1, 1, 1,
-0.6555346, -3.077483, -3.249971, 1, 1, 1, 1, 1,
-0.6548554, -1.931849, -4.192993, 1, 1, 1, 1, 1,
-0.654553, -0.3794633, -2.409583, 1, 1, 1, 1, 1,
-0.6539188, -0.1524572, -2.62529, 1, 1, 1, 1, 1,
-0.6498019, -1.840896, -2.394035, 1, 1, 1, 1, 1,
-0.6461447, 0.9459578, -3.258425, 1, 1, 1, 1, 1,
-0.6418798, 1.063179, 1.231105, 1, 1, 1, 1, 1,
-0.6415955, -0.7090421, -2.869952, 1, 1, 1, 1, 1,
-0.6396807, -0.674808, -2.819044, 1, 1, 1, 1, 1,
-0.6370215, 0.5399218, -0.7773426, 1, 1, 1, 1, 1,
-0.6365839, -0.3171943, -1.000181, 1, 1, 1, 1, 1,
-0.6326187, -1.254594, -1.362619, 1, 1, 1, 1, 1,
-0.6275167, 1.012211, -0.3224058, 1, 1, 1, 1, 1,
-0.6250458, -0.74332, -2.394943, 0, 0, 1, 1, 1,
-0.6175802, 2.788319, -0.1183495, 1, 0, 0, 1, 1,
-0.6175121, -0.09468939, -1.179019, 1, 0, 0, 1, 1,
-0.6145148, 0.1863046, -2.430763, 1, 0, 0, 1, 1,
-0.6137679, 0.7265232, -1.652383, 1, 0, 0, 1, 1,
-0.613442, 0.2036354, -1.046319, 1, 0, 0, 1, 1,
-0.61067, 1.130666, 0.2002456, 0, 0, 0, 1, 1,
-0.6089571, -0.009019624, -3.139297, 0, 0, 0, 1, 1,
-0.6086699, 0.5987698, -2.680687, 0, 0, 0, 1, 1,
-0.6070028, 0.4092127, -1.325967, 0, 0, 0, 1, 1,
-0.6026247, 0.3270452, -1.660718, 0, 0, 0, 1, 1,
-0.6016024, -0.649609, -3.21453, 0, 0, 0, 1, 1,
-0.6014326, -1.500422, -3.030777, 0, 0, 0, 1, 1,
-0.6003589, -0.1212055, -2.107881, 1, 1, 1, 1, 1,
-0.5960918, -0.9412019, -2.821373, 1, 1, 1, 1, 1,
-0.5948139, -2.936495, -3.892524, 1, 1, 1, 1, 1,
-0.5914493, 1.569647, -1.103056, 1, 1, 1, 1, 1,
-0.5810633, -0.8191446, -3.583996, 1, 1, 1, 1, 1,
-0.5763656, 1.971637, 0.08304939, 1, 1, 1, 1, 1,
-0.5716121, -0.4021356, -1.623232, 1, 1, 1, 1, 1,
-0.5692707, 1.195232, -0.8434129, 1, 1, 1, 1, 1,
-0.5676613, 0.410875, -0.2705417, 1, 1, 1, 1, 1,
-0.5645126, 0.7427731, 0.2378049, 1, 1, 1, 1, 1,
-0.5639383, -0.7021046, -4.796553, 1, 1, 1, 1, 1,
-0.5637525, -0.6576386, -2.148152, 1, 1, 1, 1, 1,
-0.5619334, -1.688917, -3.636649, 1, 1, 1, 1, 1,
-0.552671, 1.142237, 0.3840533, 1, 1, 1, 1, 1,
-0.5503392, 0.4408786, 0.0975785, 1, 1, 1, 1, 1,
-0.5470751, -1.111129, -3.361151, 0, 0, 1, 1, 1,
-0.5433226, -0.6570793, -1.752993, 1, 0, 0, 1, 1,
-0.539499, 0.3130497, 0.1987372, 1, 0, 0, 1, 1,
-0.5386007, 0.441846, -2.127756, 1, 0, 0, 1, 1,
-0.5346754, -1.460162, -2.17271, 1, 0, 0, 1, 1,
-0.531471, -0.7678434, -1.534549, 1, 0, 0, 1, 1,
-0.5314626, -0.03120949, -1.358008, 0, 0, 0, 1, 1,
-0.525601, 0.8027444, 0.2515219, 0, 0, 0, 1, 1,
-0.5250261, -0.6234044, -2.193023, 0, 0, 0, 1, 1,
-0.5232388, 0.7313039, -0.9987965, 0, 0, 0, 1, 1,
-0.522961, 0.5663311, -0.5226859, 0, 0, 0, 1, 1,
-0.5194345, -0.8615341, -1.758627, 0, 0, 0, 1, 1,
-0.5156536, 1.475979, -1.558306, 0, 0, 0, 1, 1,
-0.5114599, 0.002999925, -3.019784, 1, 1, 1, 1, 1,
-0.5105595, -0.0833669, -1.825807, 1, 1, 1, 1, 1,
-0.4972911, 1.666435, 0.4130566, 1, 1, 1, 1, 1,
-0.4965315, 0.5517902, -0.5252724, 1, 1, 1, 1, 1,
-0.4893668, 0.9291075, -2.26457, 1, 1, 1, 1, 1,
-0.4878648, 0.5964985, -0.676972, 1, 1, 1, 1, 1,
-0.48669, -1.364819, -2.857858, 1, 1, 1, 1, 1,
-0.4858158, -0.9586505, -2.289685, 1, 1, 1, 1, 1,
-0.481288, -1.813855, -1.834445, 1, 1, 1, 1, 1,
-0.4703317, -1.172046, -3.229064, 1, 1, 1, 1, 1,
-0.4673817, -0.4690823, -2.23678, 1, 1, 1, 1, 1,
-0.4658956, -0.2635942, -3.264556, 1, 1, 1, 1, 1,
-0.461562, 2.180802, -0.5432802, 1, 1, 1, 1, 1,
-0.460038, 0.4444772, 0.6286057, 1, 1, 1, 1, 1,
-0.4591644, 0.4798876, 0.1020232, 1, 1, 1, 1, 1,
-0.4580201, -0.8920898, -3.132296, 0, 0, 1, 1, 1,
-0.4574342, 1.37465, 0.8286095, 1, 0, 0, 1, 1,
-0.4559587, 2.03791, 0.5811967, 1, 0, 0, 1, 1,
-0.4529761, -0.5859303, -4.149398, 1, 0, 0, 1, 1,
-0.4504402, -2.141492, -3.29796, 1, 0, 0, 1, 1,
-0.4495801, -0.424393, -4.133432, 1, 0, 0, 1, 1,
-0.4468237, 1.247247, -0.04626684, 0, 0, 0, 1, 1,
-0.4419098, 0.3626747, -2.146229, 0, 0, 0, 1, 1,
-0.4380832, -1.171676, -3.02309, 0, 0, 0, 1, 1,
-0.4342761, -1.497113, -3.697594, 0, 0, 0, 1, 1,
-0.4334541, 0.8258256, 0.5372592, 0, 0, 0, 1, 1,
-0.4296175, 1.718294, -0.9040219, 0, 0, 0, 1, 1,
-0.428172, -0.1450943, -3.921948, 0, 0, 0, 1, 1,
-0.4211692, -0.4255715, -3.578557, 1, 1, 1, 1, 1,
-0.4178465, -0.1677541, -3.549135, 1, 1, 1, 1, 1,
-0.4162318, 0.08626153, 0.7254153, 1, 1, 1, 1, 1,
-0.4144989, -1.941776, -3.565887, 1, 1, 1, 1, 1,
-0.4131544, -0.1442578, -1.564121, 1, 1, 1, 1, 1,
-0.4124607, 0.09729206, -0.7821001, 1, 1, 1, 1, 1,
-0.412243, 2.326255, -0.1572204, 1, 1, 1, 1, 1,
-0.4121539, -0.6760316, -3.334546, 1, 1, 1, 1, 1,
-0.4106676, 0.06966913, -0.9769142, 1, 1, 1, 1, 1,
-0.4060808, 0.02488415, 0.09793177, 1, 1, 1, 1, 1,
-0.3988867, -0.2903971, -0.6958973, 1, 1, 1, 1, 1,
-0.3935874, 2.498549, 0.1900933, 1, 1, 1, 1, 1,
-0.3906562, -0.5105316, -2.576923, 1, 1, 1, 1, 1,
-0.3851746, 0.8084033, 1.719914, 1, 1, 1, 1, 1,
-0.383905, 0.2653535, 0.5016501, 1, 1, 1, 1, 1,
-0.3827129, -0.06409366, -1.550542, 0, 0, 1, 1, 1,
-0.3810854, 0.2265283, -1.190562, 1, 0, 0, 1, 1,
-0.37978, 0.6400781, 0.105207, 1, 0, 0, 1, 1,
-0.3797293, 0.4717227, 1.212688, 1, 0, 0, 1, 1,
-0.3789299, -1.595634, -4.114279, 1, 0, 0, 1, 1,
-0.3788215, 0.386851, -0.02693352, 1, 0, 0, 1, 1,
-0.3742024, 0.4716745, 0.07348976, 0, 0, 0, 1, 1,
-0.3732761, 0.7524492, -1.456346, 0, 0, 0, 1, 1,
-0.3731318, -0.02126145, -1.845504, 0, 0, 0, 1, 1,
-0.3703671, -1.401713, -2.585773, 0, 0, 0, 1, 1,
-0.3699267, 0.7989833, 0.333699, 0, 0, 0, 1, 1,
-0.3663222, -1.748289, -3.40496, 0, 0, 0, 1, 1,
-0.3601071, -0.3898332, -0.7623159, 0, 0, 0, 1, 1,
-0.3578135, 0.8524711, -0.4146129, 1, 1, 1, 1, 1,
-0.3577143, 1.38687, -0.5709182, 1, 1, 1, 1, 1,
-0.357343, 0.3805928, -1.109714, 1, 1, 1, 1, 1,
-0.357019, 1.257515, -0.5548694, 1, 1, 1, 1, 1,
-0.3544547, 1.738529, 0.189985, 1, 1, 1, 1, 1,
-0.3524069, -0.2527625, -3.337137, 1, 1, 1, 1, 1,
-0.3448271, -0.8515115, -3.893808, 1, 1, 1, 1, 1,
-0.3442723, -0.3255022, -1.146668, 1, 1, 1, 1, 1,
-0.3359172, -0.01836019, -1.610812, 1, 1, 1, 1, 1,
-0.3343405, 0.6070808, -1.439562, 1, 1, 1, 1, 1,
-0.3245871, 0.3316379, -0.6090805, 1, 1, 1, 1, 1,
-0.3226474, -0.9159452, -2.320624, 1, 1, 1, 1, 1,
-0.3202897, -1.189006, -3.657098, 1, 1, 1, 1, 1,
-0.3176701, -0.5672495, 0.5866882, 1, 1, 1, 1, 1,
-0.3147754, -0.7759284, -1.746969, 1, 1, 1, 1, 1,
-0.3135403, -0.68479, -3.979789, 0, 0, 1, 1, 1,
-0.3096966, -1.873123, -4.517134, 1, 0, 0, 1, 1,
-0.3051517, 0.4914145, 0.1884482, 1, 0, 0, 1, 1,
-0.3039058, 0.1617708, -0.566481, 1, 0, 0, 1, 1,
-0.3022163, -1.92052, -1.867221, 1, 0, 0, 1, 1,
-0.2954919, -0.01179893, -1.998812, 1, 0, 0, 1, 1,
-0.2941469, -0.2895299, -2.829993, 0, 0, 0, 1, 1,
-0.2868394, -1.985807, -3.002638, 0, 0, 0, 1, 1,
-0.2839951, -0.3865477, -0.7583526, 0, 0, 0, 1, 1,
-0.2805245, -1.783949, -4.350136, 0, 0, 0, 1, 1,
-0.2803578, 0.2974951, 0.3474517, 0, 0, 0, 1, 1,
-0.2790619, 1.659853, 1.712843, 0, 0, 0, 1, 1,
-0.2760767, 0.1975121, -0.06000705, 0, 0, 0, 1, 1,
-0.2733834, 1.060965, 0.8272904, 1, 1, 1, 1, 1,
-0.2728703, 1.124334, -0.9775256, 1, 1, 1, 1, 1,
-0.2713441, -0.9016408, -2.641698, 1, 1, 1, 1, 1,
-0.2710921, 0.225518, -0.8567056, 1, 1, 1, 1, 1,
-0.2688356, -0.005541753, -1.850071, 1, 1, 1, 1, 1,
-0.2685746, -0.4521014, -2.790926, 1, 1, 1, 1, 1,
-0.2659183, 0.296708, -2.302298, 1, 1, 1, 1, 1,
-0.265486, -0.3047857, -1.743915, 1, 1, 1, 1, 1,
-0.2650705, 0.3690975, 0.6407984, 1, 1, 1, 1, 1,
-0.2637295, 2.157166, -0.380101, 1, 1, 1, 1, 1,
-0.2546486, -0.1990591, -2.87762, 1, 1, 1, 1, 1,
-0.2470487, 0.3542463, -2.112242, 1, 1, 1, 1, 1,
-0.2420697, 0.08056781, -1.544008, 1, 1, 1, 1, 1,
-0.2415769, -0.375548, -2.463655, 1, 1, 1, 1, 1,
-0.2396214, -1.337883, -3.895779, 1, 1, 1, 1, 1,
-0.2377386, 0.9908752, -0.1007807, 0, 0, 1, 1, 1,
-0.2374178, 0.09559584, -2.133931, 1, 0, 0, 1, 1,
-0.227192, 1.794218, -0.4050179, 1, 0, 0, 1, 1,
-0.2189276, -0.6516123, -2.726689, 1, 0, 0, 1, 1,
-0.2179224, -0.141154, -2.238114, 1, 0, 0, 1, 1,
-0.2137158, -0.3754356, -3.55375, 1, 0, 0, 1, 1,
-0.2097348, -0.1168679, -1.618205, 0, 0, 0, 1, 1,
-0.2029334, 0.2580478, 1.070301, 0, 0, 0, 1, 1,
-0.2009837, 0.5619377, -0.9907325, 0, 0, 0, 1, 1,
-0.2002306, 0.04425668, -1.843699, 0, 0, 0, 1, 1,
-0.1993809, -0.4944927, -3.288891, 0, 0, 0, 1, 1,
-0.1984737, 0.2392833, 0.6665817, 0, 0, 0, 1, 1,
-0.196299, -0.445435, -1.435436, 0, 0, 0, 1, 1,
-0.188783, 0.4259568, -0.07719059, 1, 1, 1, 1, 1,
-0.188499, 0.1941298, -2.023839, 1, 1, 1, 1, 1,
-0.1884342, 0.3574148, -1.696663, 1, 1, 1, 1, 1,
-0.1881323, -0.2961423, -2.742046, 1, 1, 1, 1, 1,
-0.1876631, 1.762331, -1.163208, 1, 1, 1, 1, 1,
-0.187145, -0.3856025, -0.9673433, 1, 1, 1, 1, 1,
-0.1845335, 0.09043528, -2.309788, 1, 1, 1, 1, 1,
-0.1790731, 0.3373778, -1.12186, 1, 1, 1, 1, 1,
-0.17424, 1.841175, 0.5780069, 1, 1, 1, 1, 1,
-0.1732899, 1.136821, 0.3185694, 1, 1, 1, 1, 1,
-0.1718503, 2.270842, 0.7705603, 1, 1, 1, 1, 1,
-0.1670974, 0.6842542, -1.192816, 1, 1, 1, 1, 1,
-0.1644784, -0.1784822, -2.96926, 1, 1, 1, 1, 1,
-0.1615767, -1.303472, -3.761611, 1, 1, 1, 1, 1,
-0.1570786, -0.2335794, -1.828166, 1, 1, 1, 1, 1,
-0.1565034, 0.8860382, 1.055921, 0, 0, 1, 1, 1,
-0.1523248, -0.01366407, -1.445682, 1, 0, 0, 1, 1,
-0.1434101, 1.011972, -0.5559461, 1, 0, 0, 1, 1,
-0.1428914, 1.273545, -0.2851138, 1, 0, 0, 1, 1,
-0.1396101, -0.00579889, -1.365328, 1, 0, 0, 1, 1,
-0.1344364, -1.475865, -2.408903, 1, 0, 0, 1, 1,
-0.1187571, 1.041023, 0.1099879, 0, 0, 0, 1, 1,
-0.118057, -0.7558984, -2.111076, 0, 0, 0, 1, 1,
-0.1175517, 0.8987661, -0.5767877, 0, 0, 0, 1, 1,
-0.1113477, -0.6906095, -4.174769, 0, 0, 0, 1, 1,
-0.109009, 0.09892311, -1.944329, 0, 0, 0, 1, 1,
-0.1062891, 1.29155, -1.32611, 0, 0, 0, 1, 1,
-0.104297, 0.8730557, 0.6299756, 0, 0, 0, 1, 1,
-0.1015289, 0.9405661, -1.321515, 1, 1, 1, 1, 1,
-0.09797785, 0.5225892, 0.1843861, 1, 1, 1, 1, 1,
-0.09333974, 0.9943174, 0.9606583, 1, 1, 1, 1, 1,
-0.09301483, 0.4904636, -1.583051, 1, 1, 1, 1, 1,
-0.09241977, -0.4390968, -1.245493, 1, 1, 1, 1, 1,
-0.09221126, -1.206673, -5.924909, 1, 1, 1, 1, 1,
-0.09059951, 0.816146, -0.6749452, 1, 1, 1, 1, 1,
-0.08854818, -0.02524392, -1.878691, 1, 1, 1, 1, 1,
-0.08828062, 1.851146, 0.3211724, 1, 1, 1, 1, 1,
-0.08193818, 0.4494168, -1.5571, 1, 1, 1, 1, 1,
-0.08011955, -0.336594, -3.316678, 1, 1, 1, 1, 1,
-0.07984475, -1.339412, -4.002892, 1, 1, 1, 1, 1,
-0.07953136, -0.3945118, -3.118565, 1, 1, 1, 1, 1,
-0.0756499, -0.2516826, -1.494026, 1, 1, 1, 1, 1,
-0.07072489, -0.8044279, -3.762972, 1, 1, 1, 1, 1,
-0.06652094, -0.4054303, -3.608489, 0, 0, 1, 1, 1,
-0.06533185, 0.6302375, -0.4683611, 1, 0, 0, 1, 1,
-0.06455804, -0.5872308, -2.647465, 1, 0, 0, 1, 1,
-0.05864322, -0.925294, -4.106884, 1, 0, 0, 1, 1,
-0.0555434, 0.2516806, 0.2180061, 1, 0, 0, 1, 1,
-0.05538264, -0.5863402, -2.445775, 1, 0, 0, 1, 1,
-0.05416601, 0.2224014, 0.372314, 0, 0, 0, 1, 1,
-0.05109831, 0.2824944, 0.113735, 0, 0, 0, 1, 1,
-0.05018347, -0.5570571, -5.357866, 0, 0, 0, 1, 1,
-0.04684238, -0.04136942, -2.264778, 0, 0, 0, 1, 1,
-0.04304115, -0.1882066, -3.062003, 0, 0, 0, 1, 1,
-0.0419593, 0.8740646, -0.4541583, 0, 0, 0, 1, 1,
-0.04074053, 0.4806257, 1.658227, 0, 0, 0, 1, 1,
-0.03713096, -0.9106106, -2.582689, 1, 1, 1, 1, 1,
-0.03490033, 0.2606913, 1.004857, 1, 1, 1, 1, 1,
-0.03168303, -0.5927511, -4.023727, 1, 1, 1, 1, 1,
-0.02844611, 0.966129, -0.5341872, 1, 1, 1, 1, 1,
-0.02132482, -1.112216, -1.997141, 1, 1, 1, 1, 1,
-0.01991586, -0.1145515, -2.939477, 1, 1, 1, 1, 1,
-0.0139566, 0.8844634, 0.4360378, 1, 1, 1, 1, 1,
-0.01253543, -0.3350087, -2.873362, 1, 1, 1, 1, 1,
-0.006980774, -1.05646, -1.999292, 1, 1, 1, 1, 1,
-0.006871059, 0.1661191, 0.5987027, 1, 1, 1, 1, 1,
-0.00605033, -0.901468, -1.939154, 1, 1, 1, 1, 1,
-0.005313198, -0.1504484, -4.56677, 1, 1, 1, 1, 1,
-0.001750595, -1.677017, -1.291809, 1, 1, 1, 1, 1,
0.001556467, -0.6786669, 3.310397, 1, 1, 1, 1, 1,
0.007076291, -1.781633, 1.904877, 1, 1, 1, 1, 1,
0.01078337, 0.8081372, 0.2197477, 0, 0, 1, 1, 1,
0.01996945, -0.4466394, 2.368459, 1, 0, 0, 1, 1,
0.0250866, 0.563546, 1.20465, 1, 0, 0, 1, 1,
0.03487308, 1.016312, 0.3615009, 1, 0, 0, 1, 1,
0.03506034, -1.343111, 2.652164, 1, 0, 0, 1, 1,
0.0374372, -0.3440817, 3.55145, 1, 0, 0, 1, 1,
0.03854685, -0.1559589, 3.326861, 0, 0, 0, 1, 1,
0.03860581, 0.6479905, 1.340573, 0, 0, 0, 1, 1,
0.03977202, 0.207009, 0.8670049, 0, 0, 0, 1, 1,
0.0420627, 1.041891, -0.8104682, 0, 0, 0, 1, 1,
0.04476151, 1.193419, -0.6310017, 0, 0, 0, 1, 1,
0.04580349, -2.020113, 4.75184, 0, 0, 0, 1, 1,
0.04776274, 0.5797468, 2.187689, 0, 0, 0, 1, 1,
0.05301394, 0.6657696, -0.1860055, 1, 1, 1, 1, 1,
0.06125782, 0.1742526, 0.5222808, 1, 1, 1, 1, 1,
0.06206567, 1.19297, -0.6936915, 1, 1, 1, 1, 1,
0.06415366, -1.16899, 3.526351, 1, 1, 1, 1, 1,
0.06516467, -1.371619, 4.47037, 1, 1, 1, 1, 1,
0.07135627, -0.04166015, 1.760403, 1, 1, 1, 1, 1,
0.0746958, 2.164273, 0.3806809, 1, 1, 1, 1, 1,
0.0752141, 0.3163296, -0.5864476, 1, 1, 1, 1, 1,
0.07660683, 0.110861, 1.868141, 1, 1, 1, 1, 1,
0.07713384, -1.092026, 1.948707, 1, 1, 1, 1, 1,
0.08020562, 0.3040157, -0.8391044, 1, 1, 1, 1, 1,
0.08107883, 0.8389421, -1.191843, 1, 1, 1, 1, 1,
0.08524273, 0.6391279, 1.337784, 1, 1, 1, 1, 1,
0.08561131, 2.105395, -0.568727, 1, 1, 1, 1, 1,
0.09007167, 0.03016459, 1.221363, 1, 1, 1, 1, 1,
0.09232407, 1.574598, 0.8336329, 0, 0, 1, 1, 1,
0.09289662, -0.7977228, 3.005258, 1, 0, 0, 1, 1,
0.09342729, 1.304969, 0.3644575, 1, 0, 0, 1, 1,
0.09988593, -0.7634506, 2.768873, 1, 0, 0, 1, 1,
0.1004478, -0.1125366, 1.090526, 1, 0, 0, 1, 1,
0.1066446, 0.1154413, 1.456599, 1, 0, 0, 1, 1,
0.1101275, 0.2262018, 1.639892, 0, 0, 0, 1, 1,
0.1119332, -1.325831, 2.919852, 0, 0, 0, 1, 1,
0.1122289, 0.5001704, -1.036313, 0, 0, 0, 1, 1,
0.1127349, 0.1764591, -1.019291, 0, 0, 0, 1, 1,
0.1195827, 0.06393797, 0.8073887, 0, 0, 0, 1, 1,
0.1261972, -0.2384596, 2.917318, 0, 0, 0, 1, 1,
0.1315827, 2.033175, -0.06288608, 0, 0, 0, 1, 1,
0.1330169, -1.042922, 3.08245, 1, 1, 1, 1, 1,
0.1336987, 0.6969883, 1.089542, 1, 1, 1, 1, 1,
0.1383489, -1.919593, 2.647749, 1, 1, 1, 1, 1,
0.1397498, -2.418981, 1.729729, 1, 1, 1, 1, 1,
0.1433914, 1.154272, -0.5012866, 1, 1, 1, 1, 1,
0.1446749, -1.067304, 2.276869, 1, 1, 1, 1, 1,
0.1447757, 0.02575613, 1.323623, 1, 1, 1, 1, 1,
0.1476012, 1.454891, 0.4860287, 1, 1, 1, 1, 1,
0.1516273, -0.8797756, 2.988073, 1, 1, 1, 1, 1,
0.1518236, 0.9340065, -0.2358669, 1, 1, 1, 1, 1,
0.1518693, 0.1937372, 0.9251865, 1, 1, 1, 1, 1,
0.1524584, 0.4134921, 0.6690618, 1, 1, 1, 1, 1,
0.1595551, -0.3923879, 1.628897, 1, 1, 1, 1, 1,
0.1671481, 0.3032866, 1.0897, 1, 1, 1, 1, 1,
0.1688536, -0.2398433, 2.00758, 1, 1, 1, 1, 1,
0.1694483, -1.134951, 1.536356, 0, 0, 1, 1, 1,
0.171459, 1.210801, -0.2847898, 1, 0, 0, 1, 1,
0.1738496, 1.607978, 1.834218, 1, 0, 0, 1, 1,
0.1777849, 0.05865394, 1.224201, 1, 0, 0, 1, 1,
0.179779, -1.722169, 2.34498, 1, 0, 0, 1, 1,
0.1811077, 0.06873804, 0.9352328, 1, 0, 0, 1, 1,
0.1818536, 0.7727852, -0.8941659, 0, 0, 0, 1, 1,
0.1831674, -0.2876543, 3.174491, 0, 0, 0, 1, 1,
0.1838148, 0.8511337, -0.6992018, 0, 0, 0, 1, 1,
0.1870959, 0.1660507, -0.7031408, 0, 0, 0, 1, 1,
0.1875474, -1.469625, 0.9575146, 0, 0, 0, 1, 1,
0.1892029, -0.233545, 2.558937, 0, 0, 0, 1, 1,
0.1900514, 1.699062, 0.7041252, 0, 0, 0, 1, 1,
0.1905373, 1.188664, 1.712012, 1, 1, 1, 1, 1,
0.2015823, 0.01926583, 3.075431, 1, 1, 1, 1, 1,
0.2043504, -1.449521, 3.020149, 1, 1, 1, 1, 1,
0.204436, 0.6610749, -1.042781, 1, 1, 1, 1, 1,
0.2089693, 1.938691, 0.991195, 1, 1, 1, 1, 1,
0.2129811, -1.242876, 0.7016658, 1, 1, 1, 1, 1,
0.2146527, -0.2664775, 2.437307, 1, 1, 1, 1, 1,
0.216338, 0.1848659, -0.9131672, 1, 1, 1, 1, 1,
0.2172588, 0.6347968, -0.4793021, 1, 1, 1, 1, 1,
0.219457, 0.3999016, 0.05049684, 1, 1, 1, 1, 1,
0.2198434, -0.1947345, 1.165204, 1, 1, 1, 1, 1,
0.2199181, 0.6515172, 0.6514707, 1, 1, 1, 1, 1,
0.2207379, 0.6259158, -0.3243953, 1, 1, 1, 1, 1,
0.2210514, -0.2042441, 2.13234, 1, 1, 1, 1, 1,
0.2277838, 2.178957, -0.8889678, 1, 1, 1, 1, 1,
0.2301831, 0.9321022, 0.2329625, 0, 0, 1, 1, 1,
0.2327428, 0.6918789, 1.383688, 1, 0, 0, 1, 1,
0.234151, 0.1587641, 1.069521, 1, 0, 0, 1, 1,
0.2348933, -0.1747388, 1.830806, 1, 0, 0, 1, 1,
0.2350309, -0.7868118, 3.061848, 1, 0, 0, 1, 1,
0.2373034, 0.08416932, 1.460703, 1, 0, 0, 1, 1,
0.2399819, -0.4545028, 3.027535, 0, 0, 0, 1, 1,
0.2438344, -0.02123706, 2.495779, 0, 0, 0, 1, 1,
0.2449306, 1.570752, 0.3730324, 0, 0, 0, 1, 1,
0.2468379, 0.1870281, 0.7702275, 0, 0, 0, 1, 1,
0.2481731, -0.559183, 0.8156192, 0, 0, 0, 1, 1,
0.2503865, -0.573699, 2.826211, 0, 0, 0, 1, 1,
0.2524492, 0.1866874, 1.732044, 0, 0, 0, 1, 1,
0.255788, 1.081758, 1.715286, 1, 1, 1, 1, 1,
0.2577545, -0.05499389, 2.378769, 1, 1, 1, 1, 1,
0.2599494, 0.7363605, 0.5623878, 1, 1, 1, 1, 1,
0.2638726, -1.988369, 3.917168, 1, 1, 1, 1, 1,
0.2654686, -0.1517397, 4.44234, 1, 1, 1, 1, 1,
0.2674373, 0.07513219, 1.00794, 1, 1, 1, 1, 1,
0.2705985, 0.602036, 0.7143906, 1, 1, 1, 1, 1,
0.2723869, 1.132542, 1.246276, 1, 1, 1, 1, 1,
0.2726257, -0.2021024, 0.9625941, 1, 1, 1, 1, 1,
0.2737678, -0.2261941, 2.957601, 1, 1, 1, 1, 1,
0.2738776, 0.9954842, 1.152305, 1, 1, 1, 1, 1,
0.2774389, 1.619428, -0.5926969, 1, 1, 1, 1, 1,
0.2797779, -0.4371044, 1.680891, 1, 1, 1, 1, 1,
0.2817689, -0.07772162, 2.024885, 1, 1, 1, 1, 1,
0.2845896, 1.649608, 0.7803327, 1, 1, 1, 1, 1,
0.2860878, -0.1372328, 3.610629, 0, 0, 1, 1, 1,
0.2900108, -0.06456427, 1.058455, 1, 0, 0, 1, 1,
0.2900771, -0.2606921, 2.309823, 1, 0, 0, 1, 1,
0.2941146, -1.219554, 0.9765781, 1, 0, 0, 1, 1,
0.294386, 0.9461816, 1.849376, 1, 0, 0, 1, 1,
0.2944119, -0.1831787, 2.823729, 1, 0, 0, 1, 1,
0.2966821, -1.302737, 2.079835, 0, 0, 0, 1, 1,
0.3074696, 0.5298585, 0.8403936, 0, 0, 0, 1, 1,
0.3087732, 0.8096688, 1.152961, 0, 0, 0, 1, 1,
0.3194135, -0.3055947, 1.11599, 0, 0, 0, 1, 1,
0.3195257, 0.2360247, 1.077789, 0, 0, 0, 1, 1,
0.3212371, -0.1515366, 2.307243, 0, 0, 0, 1, 1,
0.3239523, 1.402722, -1.4216, 0, 0, 0, 1, 1,
0.3358332, -2.171089, 3.940053, 1, 1, 1, 1, 1,
0.3360762, 0.9218693, -0.5414982, 1, 1, 1, 1, 1,
0.3397643, -1.652875, 2.410351, 1, 1, 1, 1, 1,
0.3472012, 0.8710145, 0.04284479, 1, 1, 1, 1, 1,
0.3494557, 2.349832, -0.2769554, 1, 1, 1, 1, 1,
0.3637566, -0.2417569, 2.788337, 1, 1, 1, 1, 1,
0.3677487, 1.339239, 0.06171655, 1, 1, 1, 1, 1,
0.3714824, 0.3337379, 1.745696, 1, 1, 1, 1, 1,
0.3747861, 1.491912, 0.7508388, 1, 1, 1, 1, 1,
0.3781865, 1.384259, -0.6614206, 1, 1, 1, 1, 1,
0.3793128, -0.4010421, 2.149775, 1, 1, 1, 1, 1,
0.3826106, -1.045995, 2.895216, 1, 1, 1, 1, 1,
0.385194, 0.3856564, 2.076608, 1, 1, 1, 1, 1,
0.3854474, 0.2571122, -0.06412712, 1, 1, 1, 1, 1,
0.3954705, 0.3269845, 2.398646, 1, 1, 1, 1, 1,
0.3970653, -1.079628, 3.273495, 0, 0, 1, 1, 1,
0.4076742, -0.3783538, 2.772229, 1, 0, 0, 1, 1,
0.4085574, 0.8295635, 1.635402, 1, 0, 0, 1, 1,
0.4108858, -0.3310433, 3.02032, 1, 0, 0, 1, 1,
0.4109571, -0.7432402, 2.345341, 1, 0, 0, 1, 1,
0.4146191, -1.384513, 2.229043, 1, 0, 0, 1, 1,
0.4160604, -0.1176103, 2.023876, 0, 0, 0, 1, 1,
0.4172206, -0.8903012, 0.8372886, 0, 0, 0, 1, 1,
0.4191651, -0.4813023, 1.446226, 0, 0, 0, 1, 1,
0.4197859, 0.4071348, -0.07000792, 0, 0, 0, 1, 1,
0.4212052, -0.5597576, 2.479898, 0, 0, 0, 1, 1,
0.425787, 0.3798801, -0.8348542, 0, 0, 0, 1, 1,
0.4285021, -0.4470276, 0.5968414, 0, 0, 0, 1, 1,
0.429952, -2.064316, 3.44047, 1, 1, 1, 1, 1,
0.4309618, -0.6086426, 2.388508, 1, 1, 1, 1, 1,
0.4359816, -2.231028, 3.125843, 1, 1, 1, 1, 1,
0.4401594, -1.874041, 2.113212, 1, 1, 1, 1, 1,
0.4415532, -0.5832956, 2.986562, 1, 1, 1, 1, 1,
0.4425686, -0.1733198, 0.9784667, 1, 1, 1, 1, 1,
0.4446194, 0.5555741, 0.5090392, 1, 1, 1, 1, 1,
0.4473797, -1.36724, 4.53441, 1, 1, 1, 1, 1,
0.4480656, 0.04390869, 1.410787, 1, 1, 1, 1, 1,
0.4510714, -0.3257759, 2.55236, 1, 1, 1, 1, 1,
0.4517352, 0.4585423, -0.1157646, 1, 1, 1, 1, 1,
0.4526726, 1.418421, -0.3436157, 1, 1, 1, 1, 1,
0.4541517, -0.5716829, 2.515778, 1, 1, 1, 1, 1,
0.4551367, 0.5271122, 0.9710318, 1, 1, 1, 1, 1,
0.4563163, -1.192762, 4.463839, 1, 1, 1, 1, 1,
0.456555, 1.059391, 0.8408152, 0, 0, 1, 1, 1,
0.4590784, 0.09115875, 0.844442, 1, 0, 0, 1, 1,
0.4693203, 1.342811, 2.163004, 1, 0, 0, 1, 1,
0.4704078, 0.2316874, 1.804177, 1, 0, 0, 1, 1,
0.4730154, -1.432681, 2.182623, 1, 0, 0, 1, 1,
0.4773028, 0.211543, 1.991048, 1, 0, 0, 1, 1,
0.4793491, -0.6449889, 2.908865, 0, 0, 0, 1, 1,
0.4799742, -0.1519798, 2.672209, 0, 0, 0, 1, 1,
0.4799774, -0.08887515, 1.56756, 0, 0, 0, 1, 1,
0.4804976, 1.444472, 0.6220092, 0, 0, 0, 1, 1,
0.4811589, -0.6455679, 2.612304, 0, 0, 0, 1, 1,
0.4834158, -0.2642798, 1.612224, 0, 0, 0, 1, 1,
0.4843122, 0.920208, -1.553212, 0, 0, 0, 1, 1,
0.4879783, 1.394135, 0.1790004, 1, 1, 1, 1, 1,
0.4908022, 1.041823, 1.671808, 1, 1, 1, 1, 1,
0.4931439, 0.07597496, 1.674804, 1, 1, 1, 1, 1,
0.4973493, -1.142138, 2.699879, 1, 1, 1, 1, 1,
0.4981025, 3.300383, -0.09609047, 1, 1, 1, 1, 1,
0.4981836, 1.459689, 1.343014, 1, 1, 1, 1, 1,
0.500756, 0.205649, -0.03336312, 1, 1, 1, 1, 1,
0.506131, 0.7137026, 1.046879, 1, 1, 1, 1, 1,
0.5071504, 1.647453, 0.2437069, 1, 1, 1, 1, 1,
0.5096884, 2.107746, 1.925682, 1, 1, 1, 1, 1,
0.5149061, 1.505844, -0.9548669, 1, 1, 1, 1, 1,
0.5152362, -1.735907, 2.763353, 1, 1, 1, 1, 1,
0.5189379, -2.832503, 1.948219, 1, 1, 1, 1, 1,
0.5279242, 1.638895, 1.769148, 1, 1, 1, 1, 1,
0.5445293, 0.5106791, 0.8369516, 1, 1, 1, 1, 1,
0.5527762, 0.8459353, 1.811402, 0, 0, 1, 1, 1,
0.5550774, 2.204515, 0.3444139, 1, 0, 0, 1, 1,
0.5562661, -0.3776498, 1.917554, 1, 0, 0, 1, 1,
0.5614495, -0.434682, 0.8987486, 1, 0, 0, 1, 1,
0.5635803, -1.114502, 2.01745, 1, 0, 0, 1, 1,
0.563926, -0.7247329, 3.208334, 1, 0, 0, 1, 1,
0.5647146, -0.3710023, 2.770309, 0, 0, 0, 1, 1,
0.5656224, 0.5309663, 0.947824, 0, 0, 0, 1, 1,
0.5657379, -0.1279378, 1.814007, 0, 0, 0, 1, 1,
0.5660459, -0.8051966, 1.886666, 0, 0, 0, 1, 1,
0.5671083, 0.7029041, 0.0414455, 0, 0, 0, 1, 1,
0.5696002, -0.8795153, 1.888033, 0, 0, 0, 1, 1,
0.5814356, -1.088861, 2.490283, 0, 0, 0, 1, 1,
0.5835471, -0.1234146, -0.001778173, 1, 1, 1, 1, 1,
0.5856813, 0.1352588, 2.291168, 1, 1, 1, 1, 1,
0.5869249, 1.555822, -0.2720197, 1, 1, 1, 1, 1,
0.5876731, 0.1088212, 3.213665, 1, 1, 1, 1, 1,
0.5901974, -1.02053, 2.592543, 1, 1, 1, 1, 1,
0.5910802, -2.649471, 2.411995, 1, 1, 1, 1, 1,
0.593131, 0.6249704, 1.623301, 1, 1, 1, 1, 1,
0.5960953, -1.543135, 1.244076, 1, 1, 1, 1, 1,
0.5973232, 0.8424012, 0.4441586, 1, 1, 1, 1, 1,
0.6030242, -0.8427544, 1.82851, 1, 1, 1, 1, 1,
0.607695, -1.260629, 3.807094, 1, 1, 1, 1, 1,
0.6088498, 0.3386945, -0.7144433, 1, 1, 1, 1, 1,
0.6142091, -0.7574358, 2.60645, 1, 1, 1, 1, 1,
0.6149526, -1.153101, 1.216753, 1, 1, 1, 1, 1,
0.6149788, 0.5077441, 2.563765, 1, 1, 1, 1, 1,
0.6160552, -1.185271, 3.920331, 0, 0, 1, 1, 1,
0.6195542, -1.198866, 4.498913, 1, 0, 0, 1, 1,
0.6264422, -0.5054189, 1.658858, 1, 0, 0, 1, 1,
0.6296967, -0.944042, 3.351087, 1, 0, 0, 1, 1,
0.6341978, -0.4367721, 1.913123, 1, 0, 0, 1, 1,
0.6351932, 1.50785, -0.08217501, 1, 0, 0, 1, 1,
0.6362759, -1.382849, 1.429183, 0, 0, 0, 1, 1,
0.6374461, 0.8528722, 0.4439024, 0, 0, 0, 1, 1,
0.6403655, -0.372141, 1.833747, 0, 0, 0, 1, 1,
0.6407183, 0.5967691, 1.056257, 0, 0, 0, 1, 1,
0.6417081, -0.5468216, 1.289171, 0, 0, 0, 1, 1,
0.6420239, 0.1573429, 3.897939, 0, 0, 0, 1, 1,
0.6433378, -1.141247, 3.326406, 0, 0, 0, 1, 1,
0.6464726, 0.6562203, -0.8895488, 1, 1, 1, 1, 1,
0.6478288, 0.5473168, 1.321371, 1, 1, 1, 1, 1,
0.6553742, 0.9831929, 0.816054, 1, 1, 1, 1, 1,
0.655688, 0.4621504, 1.619724, 1, 1, 1, 1, 1,
0.6569833, -0.1047006, 1.213887, 1, 1, 1, 1, 1,
0.6581164, -0.6553685, 2.696624, 1, 1, 1, 1, 1,
0.6587581, -0.5784302, 1.692461, 1, 1, 1, 1, 1,
0.6721113, -0.3684153, 1.701615, 1, 1, 1, 1, 1,
0.6721908, 1.387635, 0.5159951, 1, 1, 1, 1, 1,
0.6829134, -1.878167, 2.968749, 1, 1, 1, 1, 1,
0.6853478, 0.6540445, 0.01816225, 1, 1, 1, 1, 1,
0.690634, 0.4128797, -0.8330469, 1, 1, 1, 1, 1,
0.6950401, -0.9686229, 3.716776, 1, 1, 1, 1, 1,
0.6967479, -0.8514839, 2.614937, 1, 1, 1, 1, 1,
0.7008935, -0.5240549, 1.183182, 1, 1, 1, 1, 1,
0.7035483, -0.4983352, 3.848621, 0, 0, 1, 1, 1,
0.7073886, 0.01684794, 1.708319, 1, 0, 0, 1, 1,
0.7109845, 2.632489, -1.170374, 1, 0, 0, 1, 1,
0.7144354, 0.9032837, 0.523322, 1, 0, 0, 1, 1,
0.715001, 0.2875397, 0.7033877, 1, 0, 0, 1, 1,
0.7266116, 0.1290107, 2.222708, 1, 0, 0, 1, 1,
0.7288734, 0.3892588, 1.772218, 0, 0, 0, 1, 1,
0.7333001, 0.5109, 1.898634, 0, 0, 0, 1, 1,
0.7350281, 0.4644475, 0.02078781, 0, 0, 0, 1, 1,
0.740105, -1.567458, 2.17502, 0, 0, 0, 1, 1,
0.7477236, 0.7028698, 1.328742, 0, 0, 0, 1, 1,
0.7527937, 0.52932, 0.8963806, 0, 0, 0, 1, 1,
0.7551679, -0.4934122, 1.667529, 0, 0, 0, 1, 1,
0.7576026, 0.6804147, 0.5719298, 1, 1, 1, 1, 1,
0.7597098, 0.2377726, 0.8246812, 1, 1, 1, 1, 1,
0.7608078, -0.8189331, 1.336248, 1, 1, 1, 1, 1,
0.7650621, -0.771548, 1.89553, 1, 1, 1, 1, 1,
0.7684882, -0.3843317, 1.852604, 1, 1, 1, 1, 1,
0.7687943, 1.310142, 0.34863, 1, 1, 1, 1, 1,
0.7703151, 2.360496, 0.428967, 1, 1, 1, 1, 1,
0.7768866, 1.692727, -0.4183914, 1, 1, 1, 1, 1,
0.7771907, -1.268603, 3.185972, 1, 1, 1, 1, 1,
0.7980832, -1.323408, 3.629741, 1, 1, 1, 1, 1,
0.7984038, 0.5206946, 1.243045, 1, 1, 1, 1, 1,
0.7996562, 0.6898867, 1.790395, 1, 1, 1, 1, 1,
0.8001748, 0.4798506, 0.820134, 1, 1, 1, 1, 1,
0.8004128, 0.0323857, 1.863395, 1, 1, 1, 1, 1,
0.8043784, -0.7474733, 3.16111, 1, 1, 1, 1, 1,
0.8055384, -0.5866719, 1.404245, 0, 0, 1, 1, 1,
0.8087243, 0.04771045, -0.2101809, 1, 0, 0, 1, 1,
0.8099191, 0.5022088, 1.77253, 1, 0, 0, 1, 1,
0.8126741, -1.269226, 3.060897, 1, 0, 0, 1, 1,
0.8148904, -1.864233, 1.693839, 1, 0, 0, 1, 1,
0.8194057, -0.2539317, 2.031925, 1, 0, 0, 1, 1,
0.8209981, 0.9384125, 0.7660708, 0, 0, 0, 1, 1,
0.8275953, 0.9907843, 2.096229, 0, 0, 0, 1, 1,
0.8295467, 0.3119672, 0.3630655, 0, 0, 0, 1, 1,
0.8320261, -0.2622871, 2.046548, 0, 0, 0, 1, 1,
0.834103, 0.838443, -0.155733, 0, 0, 0, 1, 1,
0.835874, -0.1822991, -0.05489477, 0, 0, 0, 1, 1,
0.8370628, -0.3312584, 2.211291, 0, 0, 0, 1, 1,
0.8441848, -1.074686, 3.103996, 1, 1, 1, 1, 1,
0.8478354, 0.3406128, 2.282377, 1, 1, 1, 1, 1,
0.8506349, 1.599751, 1.203601, 1, 1, 1, 1, 1,
0.8555685, 0.5932788, 1.597484, 1, 1, 1, 1, 1,
0.8576212, -0.4396646, 2.547029, 1, 1, 1, 1, 1,
0.8582947, -1.569294, 2.462018, 1, 1, 1, 1, 1,
0.8636978, -1.385821, 1.977843, 1, 1, 1, 1, 1,
0.8705252, 0.9338014, 0.2554711, 1, 1, 1, 1, 1,
0.8713613, -1.255542, 0.6909129, 1, 1, 1, 1, 1,
0.8827075, 1.390415, 1.940115, 1, 1, 1, 1, 1,
0.8935847, 0.69455, 0.8035221, 1, 1, 1, 1, 1,
0.8944674, -1.233013, 3.177168, 1, 1, 1, 1, 1,
0.9001901, -0.9644931, 3.121819, 1, 1, 1, 1, 1,
0.9009086, 0.6505873, 0.1576238, 1, 1, 1, 1, 1,
0.9053044, 0.8176237, 0.02745289, 1, 1, 1, 1, 1,
0.9057605, 1.465524, 0.7797446, 0, 0, 1, 1, 1,
0.9124507, -0.4864398, 2.535969, 1, 0, 0, 1, 1,
0.9254243, -0.748759, 2.530717, 1, 0, 0, 1, 1,
0.9296303, 0.7634266, 0.2266789, 1, 0, 0, 1, 1,
0.9338437, -1.014389, 1.601003, 1, 0, 0, 1, 1,
0.9372467, 0.9894094, 1.04107, 1, 0, 0, 1, 1,
0.9402274, 0.8120667, 0.2177524, 0, 0, 0, 1, 1,
0.9444572, -0.3099098, 2.62558, 0, 0, 0, 1, 1,
0.9468977, 2.64628, -0.709334, 0, 0, 0, 1, 1,
0.9508063, -0.545719, 1.337253, 0, 0, 0, 1, 1,
0.9515661, 0.1926043, 0.6165667, 0, 0, 0, 1, 1,
0.9555327, -0.1243263, 2.105489, 0, 0, 0, 1, 1,
0.9555961, 0.3649006, 0.8106871, 0, 0, 0, 1, 1,
0.9610726, 0.09794737, 1.783757, 1, 1, 1, 1, 1,
0.9614153, -2.289622, 0.95904, 1, 1, 1, 1, 1,
0.9657173, 0.4942766, 1.250601, 1, 1, 1, 1, 1,
0.97426, 1.085358, 0.02468972, 1, 1, 1, 1, 1,
0.9761204, 0.2251302, 0.44336, 1, 1, 1, 1, 1,
0.9875886, -1.55465, 2.047082, 1, 1, 1, 1, 1,
0.989113, 0.1820985, 1.134587, 1, 1, 1, 1, 1,
0.9995356, -0.6357817, 2.25109, 1, 1, 1, 1, 1,
0.9996949, -0.2482723, 0.942026, 1, 1, 1, 1, 1,
1.002754, -0.3021477, 2.745228, 1, 1, 1, 1, 1,
1.010962, -1.972243, 3.277082, 1, 1, 1, 1, 1,
1.015239, 0.1101163, 0.634539, 1, 1, 1, 1, 1,
1.016712, 0.4446667, 2.005456, 1, 1, 1, 1, 1,
1.021042, -0.4767455, 2.473162, 1, 1, 1, 1, 1,
1.022133, -1.962547, 3.059753, 1, 1, 1, 1, 1,
1.027933, -0.4218298, 0.9686303, 0, 0, 1, 1, 1,
1.031599, 1.280333, -0.3297738, 1, 0, 0, 1, 1,
1.03161, 0.06492923, 1.254797, 1, 0, 0, 1, 1,
1.032265, -0.6258309, 0.6800426, 1, 0, 0, 1, 1,
1.032597, 0.4819816, 0.972435, 1, 0, 0, 1, 1,
1.037315, -0.5675871, 1.623402, 1, 0, 0, 1, 1,
1.040904, -0.188604, 0.4487891, 0, 0, 0, 1, 1,
1.041139, -2.304431, 3.601049, 0, 0, 0, 1, 1,
1.043411, 1.632705, 1.059684, 0, 0, 0, 1, 1,
1.051418, -1.714755, 0.652303, 0, 0, 0, 1, 1,
1.05511, 0.01067493, 1.534996, 0, 0, 0, 1, 1,
1.06085, 2.268457, 0.8293427, 0, 0, 0, 1, 1,
1.068744, -1.533062, 1.844964, 0, 0, 0, 1, 1,
1.07494, -0.1004919, 1.757069, 1, 1, 1, 1, 1,
1.078209, 1.969468, 0.7901783, 1, 1, 1, 1, 1,
1.079868, -1.150861, 2.47118, 1, 1, 1, 1, 1,
1.084569, 0.6743301, 1.371343, 1, 1, 1, 1, 1,
1.08653, -1.159672, 2.992917, 1, 1, 1, 1, 1,
1.087514, -0.03770521, 2.673385, 1, 1, 1, 1, 1,
1.094252, -1.399804, -0.7297311, 1, 1, 1, 1, 1,
1.101703, 0.2815058, 1.782269, 1, 1, 1, 1, 1,
1.105036, 0.2170478, 0.6456678, 1, 1, 1, 1, 1,
1.106121, -0.9043383, 0.7240776, 1, 1, 1, 1, 1,
1.110585, -0.5528438, 2.316263, 1, 1, 1, 1, 1,
1.114594, 1.495581, -0.1844369, 1, 1, 1, 1, 1,
1.114767, 0.6505962, 0.4508614, 1, 1, 1, 1, 1,
1.115116, -0.9929602, 3.068385, 1, 1, 1, 1, 1,
1.115352, 0.2341276, -0.9775391, 1, 1, 1, 1, 1,
1.11871, -0.05116192, 2.367579, 0, 0, 1, 1, 1,
1.121491, -0.5307285, 3.529849, 1, 0, 0, 1, 1,
1.128423, -0.9490173, 3.017398, 1, 0, 0, 1, 1,
1.151605, -0.599773, 0.5930433, 1, 0, 0, 1, 1,
1.158589, 0.7473218, 0.5563182, 1, 0, 0, 1, 1,
1.159472, 1.662655, 0.4066899, 1, 0, 0, 1, 1,
1.166629, -0.9777222, 2.86281, 0, 0, 0, 1, 1,
1.178345, 0.6558037, 2.188076, 0, 0, 0, 1, 1,
1.184228, -1.005836, 2.285606, 0, 0, 0, 1, 1,
1.185485, 1.274131, 1.629052, 0, 0, 0, 1, 1,
1.190109, 0.4206301, 2.131387, 0, 0, 0, 1, 1,
1.192847, -0.2072279, 1.421567, 0, 0, 0, 1, 1,
1.19886, -1.425131, 3.261482, 0, 0, 0, 1, 1,
1.201632, -0.8830619, 1.184667, 1, 1, 1, 1, 1,
1.205838, -0.8142254, 1.873919, 1, 1, 1, 1, 1,
1.212146, 1.142779, -0.2569964, 1, 1, 1, 1, 1,
1.216769, 0.2530601, -0.1162976, 1, 1, 1, 1, 1,
1.217069, -0.611199, 2.005339, 1, 1, 1, 1, 1,
1.219094, -0.5817022, 1.590538, 1, 1, 1, 1, 1,
1.224858, 0.5801139, 3.403173, 1, 1, 1, 1, 1,
1.230104, -0.6268061, 0.8556972, 1, 1, 1, 1, 1,
1.232002, -1.900766, 1.590948, 1, 1, 1, 1, 1,
1.236928, -0.2574501, 1.172401, 1, 1, 1, 1, 1,
1.24089, -0.4055456, 0.6377903, 1, 1, 1, 1, 1,
1.264766, 0.5061237, 1.214832, 1, 1, 1, 1, 1,
1.276849, 0.4338577, 1.963399, 1, 1, 1, 1, 1,
1.278501, 0.3826287, 1.883699, 1, 1, 1, 1, 1,
1.282631, 1.840279, 0.02387388, 1, 1, 1, 1, 1,
1.292805, 0.4743274, 1.41454, 0, 0, 1, 1, 1,
1.300107, -0.0233256, 1.82162, 1, 0, 0, 1, 1,
1.300499, 1.673854, 1.68058, 1, 0, 0, 1, 1,
1.302361, 0.4265015, 0.172469, 1, 0, 0, 1, 1,
1.303983, 0.1728087, -0.215276, 1, 0, 0, 1, 1,
1.307272, 0.7594259, 1.308193, 1, 0, 0, 1, 1,
1.312635, 1.033165, 0.18289, 0, 0, 0, 1, 1,
1.319789, -0.7231801, 3.398961, 0, 0, 0, 1, 1,
1.345224, 0.1888899, 0.4311607, 0, 0, 0, 1, 1,
1.347513, -0.1264237, 0.238035, 0, 0, 0, 1, 1,
1.356207, -0.4915659, 2.094379, 0, 0, 0, 1, 1,
1.374292, 0.81442, 0.6211461, 0, 0, 0, 1, 1,
1.377376, -2.079849, 2.273859, 0, 0, 0, 1, 1,
1.380735, 1.044333, 0.6850457, 1, 1, 1, 1, 1,
1.386482, 0.1099652, 3.167133, 1, 1, 1, 1, 1,
1.390852, 0.5848358, 1.882402, 1, 1, 1, 1, 1,
1.39193, -1.198291, -0.09255466, 1, 1, 1, 1, 1,
1.396904, -2.453595, 1.324529, 1, 1, 1, 1, 1,
1.398944, -0.4302148, 2.444871, 1, 1, 1, 1, 1,
1.401388, 0.02482703, 0.5534996, 1, 1, 1, 1, 1,
1.408551, 0.879166, 0.4974196, 1, 1, 1, 1, 1,
1.411474, -0.7896236, 1.226504, 1, 1, 1, 1, 1,
1.413868, 0.764861, -0.06942482, 1, 1, 1, 1, 1,
1.414618, -0.9251679, 2.282824, 1, 1, 1, 1, 1,
1.415563, 1.067616, 2.277315, 1, 1, 1, 1, 1,
1.419954, -1.567902, 0.2381707, 1, 1, 1, 1, 1,
1.424404, -1.057433, 2.481096, 1, 1, 1, 1, 1,
1.432218, -0.3820596, 0.543439, 1, 1, 1, 1, 1,
1.447752, 0.1660035, 1.994571, 0, 0, 1, 1, 1,
1.449762, -0.2662222, 2.611857, 1, 0, 0, 1, 1,
1.455473, 0.6254932, -0.1687132, 1, 0, 0, 1, 1,
1.459504, -1.153537, 1.274954, 1, 0, 0, 1, 1,
1.46331, 0.7586144, 1.020813, 1, 0, 0, 1, 1,
1.46352, -0.1457575, 0.6901021, 1, 0, 0, 1, 1,
1.469617, -0.4418155, 3.871876, 0, 0, 0, 1, 1,
1.476632, 0.02910757, 1.306083, 0, 0, 0, 1, 1,
1.489675, 1.169766, 0.1913272, 0, 0, 0, 1, 1,
1.502042, 1.287278, -1.099703, 0, 0, 0, 1, 1,
1.503286, -0.4780374, 1.446283, 0, 0, 0, 1, 1,
1.511422, -0.446764, 1.905425, 0, 0, 0, 1, 1,
1.524259, -0.5045189, 1.459392, 0, 0, 0, 1, 1,
1.525781, -0.1903515, 1.94588, 1, 1, 1, 1, 1,
1.535553, -0.979974, 1.93958, 1, 1, 1, 1, 1,
1.541055, -0.2290977, 2.159659, 1, 1, 1, 1, 1,
1.556587, -0.1062551, -0.9011509, 1, 1, 1, 1, 1,
1.561803, 1.66208, 0.1343158, 1, 1, 1, 1, 1,
1.569556, 0.486396, 2.143324, 1, 1, 1, 1, 1,
1.572436, -0.6236724, 1.423875, 1, 1, 1, 1, 1,
1.57817, 0.7175254, 0.5859768, 1, 1, 1, 1, 1,
1.585441, -0.5543576, 1.11402, 1, 1, 1, 1, 1,
1.586244, -2.415434, 2.072438, 1, 1, 1, 1, 1,
1.58846, -0.1329493, 3.605419, 1, 1, 1, 1, 1,
1.603104, -1.133122, 2.776743, 1, 1, 1, 1, 1,
1.612649, -0.1211634, 1.142541, 1, 1, 1, 1, 1,
1.618866, 0.8479192, 0.1741343, 1, 1, 1, 1, 1,
1.621754, -0.06289884, 3.33824, 1, 1, 1, 1, 1,
1.648526, 2.060924, 0.07941819, 0, 0, 1, 1, 1,
1.661465, -0.2469276, 1.43428, 1, 0, 0, 1, 1,
1.664803, -0.461758, 1.953644, 1, 0, 0, 1, 1,
1.670141, -0.8554584, 1.765997, 1, 0, 0, 1, 1,
1.673243, 0.1258557, 1.047698, 1, 0, 0, 1, 1,
1.692221, 0.2566055, 1.948133, 1, 0, 0, 1, 1,
1.708238, -0.4722043, 3.872283, 0, 0, 0, 1, 1,
1.714932, 1.314252, 0.7070271, 0, 0, 0, 1, 1,
1.753167, -0.8926667, 1.297007, 0, 0, 0, 1, 1,
1.753347, 0.4475346, 1.24846, 0, 0, 0, 1, 1,
1.75995, 0.268534, 1.280445, 0, 0, 0, 1, 1,
1.796755, 0.9296899, 0.562084, 0, 0, 0, 1, 1,
1.81152, -0.684567, 1.456555, 0, 0, 0, 1, 1,
1.81384, -1.068895, 3.120325, 1, 1, 1, 1, 1,
1.8331, 0.8862039, 1.321335, 1, 1, 1, 1, 1,
1.834981, 0.881871, 0.1709503, 1, 1, 1, 1, 1,
1.853081, -0.9891801, 1.496488, 1, 1, 1, 1, 1,
1.869548, 0.9835584, 1.299294, 1, 1, 1, 1, 1,
1.879348, -0.9338114, 2.214873, 1, 1, 1, 1, 1,
1.919098, -0.2866516, 0.6556934, 1, 1, 1, 1, 1,
1.954873, -2.008236, 1.431085, 1, 1, 1, 1, 1,
1.95825, -1.466187, -1.001277, 1, 1, 1, 1, 1,
2.016245, 0.1890135, 0.174586, 1, 1, 1, 1, 1,
2.030274, -0.2485147, 0.8468744, 1, 1, 1, 1, 1,
2.046701, 0.7695326, 1.57037, 1, 1, 1, 1, 1,
2.063739, -0.5104886, 2.894394, 1, 1, 1, 1, 1,
2.084841, -2.473334, 4.05115, 1, 1, 1, 1, 1,
2.095217, -0.99297, 1.818408, 1, 1, 1, 1, 1,
2.09915, 1.677133, 0.5248297, 0, 0, 1, 1, 1,
2.107957, 1.106748, 2.059296, 1, 0, 0, 1, 1,
2.128629, 0.8540376, 2.027115, 1, 0, 0, 1, 1,
2.145818, -1.112171, 3.339844, 1, 0, 0, 1, 1,
2.158387, 0.1326326, 0.4486646, 1, 0, 0, 1, 1,
2.183355, 1.014278, 0.7630666, 1, 0, 0, 1, 1,
2.265598, -0.05958837, 1.204531, 0, 0, 0, 1, 1,
2.270798, 1.732454, -0.8233865, 0, 0, 0, 1, 1,
2.295179, 0.1056627, 2.499281, 0, 0, 0, 1, 1,
2.332086, -0.07715407, 1.913777, 0, 0, 0, 1, 1,
2.377141, 0.8775401, 2.437079, 0, 0, 0, 1, 1,
2.403183, -1.039044, 3.640858, 0, 0, 0, 1, 1,
2.466342, 0.5627273, 0.002967213, 0, 0, 0, 1, 1,
2.512259, -0.2358148, 2.741406, 1, 1, 1, 1, 1,
2.531798, -2.140158, 1.998424, 1, 1, 1, 1, 1,
2.573147, -1.61248, 3.407048, 1, 1, 1, 1, 1,
2.576184, -2.03582, 2.353506, 1, 1, 1, 1, 1,
2.661588, -0.3337896, 0.005825603, 1, 1, 1, 1, 1,
2.744077, 0.8749413, 0.869787, 1, 1, 1, 1, 1,
3.045881, -0.2417517, 1.146314, 1, 1, 1, 1, 1
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
var radius = 9.531456;
var distance = 33.47884;
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
mvMatrix.translate( 0.1205783, -0.1114497, 0.5865345 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47884);
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
