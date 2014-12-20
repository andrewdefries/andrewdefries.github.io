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
-3.047242, -1.316988, -1.252323, 1, 0, 0, 1,
-2.86363, 0.1247374, -2.492481, 1, 0.007843138, 0, 1,
-2.518154, -1.171744, -1.27505, 1, 0.01176471, 0, 1,
-2.489519, 1.893989, -0.01252712, 1, 0.01960784, 0, 1,
-2.486275, 1.277285, -0.6308002, 1, 0.02352941, 0, 1,
-2.413662, 1.950099, -0.6901884, 1, 0.03137255, 0, 1,
-2.377185, 2.495846, -0.3019909, 1, 0.03529412, 0, 1,
-2.292441, -0.5073504, -2.854802, 1, 0.04313726, 0, 1,
-2.284693, -1.320283, -1.333203, 1, 0.04705882, 0, 1,
-2.283707, -0.3971486, -3.653451, 1, 0.05490196, 0, 1,
-2.278713, 0.216582, -2.467251, 1, 0.05882353, 0, 1,
-2.269321, 1.55668, -0.01415334, 1, 0.06666667, 0, 1,
-2.235483, -0.3407207, -0.06399751, 1, 0.07058824, 0, 1,
-2.187203, 1.76083, -2.039096, 1, 0.07843138, 0, 1,
-2.183746, 1.926904, -0.03214038, 1, 0.08235294, 0, 1,
-2.141208, -1.528221, -3.73073, 1, 0.09019608, 0, 1,
-2.136683, 0.3101594, -0.1183125, 1, 0.09411765, 0, 1,
-2.103836, 1.291665, -2.815578, 1, 0.1019608, 0, 1,
-2.07693, -0.7479848, -2.421352, 1, 0.1098039, 0, 1,
-2.004776, -1.69542, -1.045074, 1, 0.1137255, 0, 1,
-1.992012, 0.1296791, -2.054985, 1, 0.1215686, 0, 1,
-1.990661, 1.307392, -1.104741, 1, 0.1254902, 0, 1,
-1.986058, 0.9111951, -1.00827, 1, 0.1333333, 0, 1,
-1.982899, 2.593194, -1.525014, 1, 0.1372549, 0, 1,
-1.978438, 0.9794664, -1.294937, 1, 0.145098, 0, 1,
-1.93497, 0.8154933, -1.916632, 1, 0.1490196, 0, 1,
-1.887878, 0.3539958, -2.432512, 1, 0.1568628, 0, 1,
-1.887872, -0.453503, -2.263566, 1, 0.1607843, 0, 1,
-1.870159, 1.025842, 0.5755793, 1, 0.1686275, 0, 1,
-1.867727, 0.9292533, -1.703028, 1, 0.172549, 0, 1,
-1.862909, 1.192098, -1.703582, 1, 0.1803922, 0, 1,
-1.857458, 0.03223481, -1.065258, 1, 0.1843137, 0, 1,
-1.847573, -0.7361678, -1.905499, 1, 0.1921569, 0, 1,
-1.818457, 1.495812, -1.508587, 1, 0.1960784, 0, 1,
-1.817325, -2.282146, -3.821763, 1, 0.2039216, 0, 1,
-1.815974, 0.05541773, -1.653917, 1, 0.2117647, 0, 1,
-1.814637, 0.7645988, -2.435685, 1, 0.2156863, 0, 1,
-1.812554, -0.1717508, 0.3596231, 1, 0.2235294, 0, 1,
-1.797808, -0.9481647, -2.630772, 1, 0.227451, 0, 1,
-1.781626, -0.1478077, 1.309312, 1, 0.2352941, 0, 1,
-1.769333, -1.258932, -3.984761, 1, 0.2392157, 0, 1,
-1.75643, -0.04723548, -0.4952576, 1, 0.2470588, 0, 1,
-1.737404, -0.3384548, -2.503332, 1, 0.2509804, 0, 1,
-1.730507, -0.4045591, -1.136454, 1, 0.2588235, 0, 1,
-1.719851, -0.2246723, -1.736019, 1, 0.2627451, 0, 1,
-1.719279, -1.23578, 0.06917562, 1, 0.2705882, 0, 1,
-1.710423, 1.151587, -1.500851, 1, 0.2745098, 0, 1,
-1.674206, -1.213708, -2.174265, 1, 0.282353, 0, 1,
-1.648132, -0.8544003, -2.168898, 1, 0.2862745, 0, 1,
-1.645229, -0.6387378, -3.777414, 1, 0.2941177, 0, 1,
-1.628394, 0.2472058, -1.349005, 1, 0.3019608, 0, 1,
-1.628115, -0.3913954, -0.8783107, 1, 0.3058824, 0, 1,
-1.618532, -2.031951, -2.786957, 1, 0.3137255, 0, 1,
-1.618097, -0.07741033, -1.051995, 1, 0.3176471, 0, 1,
-1.610836, 1.208501, -0.1996966, 1, 0.3254902, 0, 1,
-1.603181, 1.189629, -0.37024, 1, 0.3294118, 0, 1,
-1.60215, -0.6605774, -1.983601, 1, 0.3372549, 0, 1,
-1.598545, -0.2502061, -1.273947, 1, 0.3411765, 0, 1,
-1.587097, -0.4623906, -1.828433, 1, 0.3490196, 0, 1,
-1.573364, -0.04045268, -1.87229, 1, 0.3529412, 0, 1,
-1.55899, 0.2166655, -1.269877, 1, 0.3607843, 0, 1,
-1.557659, -1.735879, -3.019121, 1, 0.3647059, 0, 1,
-1.552341, 0.1544185, -1.444297, 1, 0.372549, 0, 1,
-1.537292, 1.711738, -2.351846, 1, 0.3764706, 0, 1,
-1.536113, -0.6142597, -2.038987, 1, 0.3843137, 0, 1,
-1.53569, 1.935374, -1.196276, 1, 0.3882353, 0, 1,
-1.535357, 1.824004, 0.8696648, 1, 0.3960784, 0, 1,
-1.526426, -0.8823979, -1.830581, 1, 0.4039216, 0, 1,
-1.526303, -0.4741361, -2.570727, 1, 0.4078431, 0, 1,
-1.500148, -0.8732056, -1.8068, 1, 0.4156863, 0, 1,
-1.489543, -0.1202529, -1.776165, 1, 0.4196078, 0, 1,
-1.486531, -0.3988802, -3.623926, 1, 0.427451, 0, 1,
-1.471976, -0.8763311, -2.19249, 1, 0.4313726, 0, 1,
-1.46719, 0.4095847, -0.7440842, 1, 0.4392157, 0, 1,
-1.465456, 2.225154, -1.356458, 1, 0.4431373, 0, 1,
-1.458741, -0.1110376, -1.446983, 1, 0.4509804, 0, 1,
-1.457328, 0.7633351, -2.764593, 1, 0.454902, 0, 1,
-1.452249, -0.2986491, -3.111734, 1, 0.4627451, 0, 1,
-1.451438, 0.4698726, -0.9460043, 1, 0.4666667, 0, 1,
-1.445023, 0.534009, -0.5712907, 1, 0.4745098, 0, 1,
-1.437567, -2.516046, -1.634552, 1, 0.4784314, 0, 1,
-1.433434, -0.5126271, -3.546635, 1, 0.4862745, 0, 1,
-1.427068, -1.084293, -1.153119, 1, 0.4901961, 0, 1,
-1.421418, -0.7107911, -2.016034, 1, 0.4980392, 0, 1,
-1.4127, -0.008428765, -1.302985, 1, 0.5058824, 0, 1,
-1.411511, 1.753913, -1.474145, 1, 0.509804, 0, 1,
-1.410541, -0.7724763, -2.792941, 1, 0.5176471, 0, 1,
-1.402343, -0.01258884, -2.55355, 1, 0.5215687, 0, 1,
-1.391894, -0.7292125, -2.094922, 1, 0.5294118, 0, 1,
-1.389362, -0.1405941, -0.4429945, 1, 0.5333334, 0, 1,
-1.386538, 1.700802, -0.06256069, 1, 0.5411765, 0, 1,
-1.385214, -1.154794, -1.815987, 1, 0.5450981, 0, 1,
-1.380766, -0.6921703, -2.236008, 1, 0.5529412, 0, 1,
-1.379136, -1.008213, -2.404462, 1, 0.5568628, 0, 1,
-1.373223, -0.5888031, -3.249049, 1, 0.5647059, 0, 1,
-1.361611, -0.207173, -2.66569, 1, 0.5686275, 0, 1,
-1.354195, -2.97119, -2.315381, 1, 0.5764706, 0, 1,
-1.353292, -2.144321, -2.146346, 1, 0.5803922, 0, 1,
-1.35175, -0.04468978, -3.635886, 1, 0.5882353, 0, 1,
-1.346689, 1.323668, 0.3411408, 1, 0.5921569, 0, 1,
-1.346292, 0.2745577, -1.656647, 1, 0.6, 0, 1,
-1.343463, 1.216159, -0.773868, 1, 0.6078432, 0, 1,
-1.339465, 2.253941, -0.9789315, 1, 0.6117647, 0, 1,
-1.33752, 0.8874109, -0.6170485, 1, 0.6196079, 0, 1,
-1.325457, -1.397794, -2.186502, 1, 0.6235294, 0, 1,
-1.313398, -0.4693559, -1.94457, 1, 0.6313726, 0, 1,
-1.313273, 0.9309864, -0.9320903, 1, 0.6352941, 0, 1,
-1.303833, -1.199934, -3.80682, 1, 0.6431373, 0, 1,
-1.3, -0.4861508, -2.23085, 1, 0.6470588, 0, 1,
-1.298715, -0.1948088, -1.51971, 1, 0.654902, 0, 1,
-1.288213, -1.46581, -1.799315, 1, 0.6588235, 0, 1,
-1.283692, 0.8032756, -1.123282, 1, 0.6666667, 0, 1,
-1.277473, 0.5169352, -2.383017, 1, 0.6705883, 0, 1,
-1.267854, 1.770616, -0.0001957755, 1, 0.6784314, 0, 1,
-1.26768, -0.4331095, -2.71394, 1, 0.682353, 0, 1,
-1.263986, 0.799069, -1.797837, 1, 0.6901961, 0, 1,
-1.260676, -0.9244981, -0.907841, 1, 0.6941177, 0, 1,
-1.248994, 0.951613, -1.57364, 1, 0.7019608, 0, 1,
-1.244556, -0.1495432, -0.4027234, 1, 0.7098039, 0, 1,
-1.233483, 0.04593254, -2.459673, 1, 0.7137255, 0, 1,
-1.231457, 0.5042688, -0.944372, 1, 0.7215686, 0, 1,
-1.225639, -0.21308, -3.00919, 1, 0.7254902, 0, 1,
-1.211405, -0.3071125, -2.000108, 1, 0.7333333, 0, 1,
-1.209306, -0.5607594, -1.72026, 1, 0.7372549, 0, 1,
-1.20885, -0.5648175, -0.896466, 1, 0.7450981, 0, 1,
-1.206696, 1.840984, 0.4577522, 1, 0.7490196, 0, 1,
-1.197881, -0.6796722, -2.099073, 1, 0.7568628, 0, 1,
-1.196953, 1.02728, -1.542217, 1, 0.7607843, 0, 1,
-1.185906, -2.165277, -1.948111, 1, 0.7686275, 0, 1,
-1.184088, 0.872879, -1.434033, 1, 0.772549, 0, 1,
-1.167899, 0.1423477, -2.301059, 1, 0.7803922, 0, 1,
-1.15248, 0.6173445, -1.10981, 1, 0.7843137, 0, 1,
-1.151205, 0.8707345, -1.04995, 1, 0.7921569, 0, 1,
-1.149757, 0.1164517, -1.716174, 1, 0.7960784, 0, 1,
-1.149389, 1.011578, -1.17587, 1, 0.8039216, 0, 1,
-1.144392, 0.3627853, -1.069686, 1, 0.8117647, 0, 1,
-1.14275, 1.784449, -2.139184, 1, 0.8156863, 0, 1,
-1.138966, -0.02510662, -1.886927, 1, 0.8235294, 0, 1,
-1.133513, 2.509641, -0.7063776, 1, 0.827451, 0, 1,
-1.130836, 1.21546, -1.635045, 1, 0.8352941, 0, 1,
-1.126513, -0.5285803, -1.921451, 1, 0.8392157, 0, 1,
-1.124289, -0.3333332, -1.188889, 1, 0.8470588, 0, 1,
-1.123411, -1.245451, -2.220642, 1, 0.8509804, 0, 1,
-1.118093, -0.7230817, -2.420799, 1, 0.8588235, 0, 1,
-1.100119, -0.5581325, -1.899748, 1, 0.8627451, 0, 1,
-1.099844, -0.4039336, -1.018434, 1, 0.8705882, 0, 1,
-1.093119, 0.6037064, -1.266187, 1, 0.8745098, 0, 1,
-1.091552, 0.5061299, -0.07692062, 1, 0.8823529, 0, 1,
-1.08788, 1.685358, -0.9659661, 1, 0.8862745, 0, 1,
-1.087213, -0.5928069, -1.797974, 1, 0.8941177, 0, 1,
-1.085203, -1.217553, -2.496158, 1, 0.8980392, 0, 1,
-1.08464, 0.007876529, -2.359183, 1, 0.9058824, 0, 1,
-1.080495, -1.752884, -2.472774, 1, 0.9137255, 0, 1,
-1.079323, -1.294436, -4.693914, 1, 0.9176471, 0, 1,
-1.074042, -1.505971, -4.023632, 1, 0.9254902, 0, 1,
-1.072286, -1.270451, -1.052711, 1, 0.9294118, 0, 1,
-1.071417, -0.2266792, -1.450344, 1, 0.9372549, 0, 1,
-1.069368, 0.2656855, -1.441798, 1, 0.9411765, 0, 1,
-1.068387, 0.8593562, -0.5226271, 1, 0.9490196, 0, 1,
-1.063543, 1.010498, -0.8897196, 1, 0.9529412, 0, 1,
-1.059994, -0.7160198, -1.998319, 1, 0.9607843, 0, 1,
-1.051348, 0.7603962, -1.39867, 1, 0.9647059, 0, 1,
-1.049795, 0.4339077, -0.2628628, 1, 0.972549, 0, 1,
-1.03924, 0.2546844, -0.2452856, 1, 0.9764706, 0, 1,
-1.022227, 0.1856157, 0.1070291, 1, 0.9843137, 0, 1,
-1.018953, 0.9508768, -0.873512, 1, 0.9882353, 0, 1,
-1.009583, 0.2185877, -2.02884, 1, 0.9960784, 0, 1,
-1.003534, -0.1572436, -1.043659, 0.9960784, 1, 0, 1,
-1.003349, -0.6551065, -2.997062, 0.9921569, 1, 0, 1,
-0.9938276, 0.2873849, -0.8100115, 0.9843137, 1, 0, 1,
-0.9936529, 0.6525906, -1.496119, 0.9803922, 1, 0, 1,
-0.9916433, -0.3169812, -1.726155, 0.972549, 1, 0, 1,
-0.9855635, 2.021855, 1.2269, 0.9686275, 1, 0, 1,
-0.9775028, -1.137772, -2.74492, 0.9607843, 1, 0, 1,
-0.9624417, 0.4894499, -1.232872, 0.9568627, 1, 0, 1,
-0.9560364, -1.463151, -2.674823, 0.9490196, 1, 0, 1,
-0.95481, 2.236512, -0.03016387, 0.945098, 1, 0, 1,
-0.9480731, 0.5622209, -0.3386996, 0.9372549, 1, 0, 1,
-0.942404, 1.461561, -0.8767036, 0.9333333, 1, 0, 1,
-0.9398614, 0.5344681, -1.576326, 0.9254902, 1, 0, 1,
-0.9353752, 2.392616, -0.08159397, 0.9215686, 1, 0, 1,
-0.9326611, -1.127249, -2.918017, 0.9137255, 1, 0, 1,
-0.9295844, 0.7055619, -0.6359013, 0.9098039, 1, 0, 1,
-0.9293217, 0.96391, -1.040827, 0.9019608, 1, 0, 1,
-0.9287764, -1.487592, -1.554166, 0.8941177, 1, 0, 1,
-0.9254984, -0.1695615, -2.475113, 0.8901961, 1, 0, 1,
-0.9246716, 0.5090619, 0.1475837, 0.8823529, 1, 0, 1,
-0.9227891, 1.103455, -0.6096485, 0.8784314, 1, 0, 1,
-0.9174155, -0.08502097, -2.485814, 0.8705882, 1, 0, 1,
-0.9145001, 1.000675, -1.185453, 0.8666667, 1, 0, 1,
-0.8945796, -0.2794122, -1.564599, 0.8588235, 1, 0, 1,
-0.8861431, -2.133543, -3.177291, 0.854902, 1, 0, 1,
-0.882874, -0.1836444, -1.882217, 0.8470588, 1, 0, 1,
-0.8812169, 1.309582, -1.898982, 0.8431373, 1, 0, 1,
-0.8789653, -1.590174, -2.113143, 0.8352941, 1, 0, 1,
-0.8762954, -0.1145656, -0.4657845, 0.8313726, 1, 0, 1,
-0.8731584, -0.5184512, -2.550577, 0.8235294, 1, 0, 1,
-0.8712282, -2.434591, -3.606828, 0.8196079, 1, 0, 1,
-0.8693632, 0.4266422, 0.3065527, 0.8117647, 1, 0, 1,
-0.8661512, -1.387859, -1.803742, 0.8078431, 1, 0, 1,
-0.865935, -1.112974, -2.514878, 0.8, 1, 0, 1,
-0.8622738, -0.1702938, -1.765784, 0.7921569, 1, 0, 1,
-0.8620418, -1.665643, -1.460104, 0.7882353, 1, 0, 1,
-0.8571572, -1.73117, -1.679225, 0.7803922, 1, 0, 1,
-0.8513242, 0.5901216, -2.727699, 0.7764706, 1, 0, 1,
-0.8499698, -0.8263652, -0.9979162, 0.7686275, 1, 0, 1,
-0.8464521, 1.868504, 0.3817402, 0.7647059, 1, 0, 1,
-0.8448821, 0.2072382, -2.054708, 0.7568628, 1, 0, 1,
-0.8435012, -0.5235708, -2.371124, 0.7529412, 1, 0, 1,
-0.8407273, 0.7376141, 0.7724425, 0.7450981, 1, 0, 1,
-0.8400938, 0.987161, 0.1397669, 0.7411765, 1, 0, 1,
-0.8383098, 0.01649049, -0.9742715, 0.7333333, 1, 0, 1,
-0.837949, 0.251015, -2.208611, 0.7294118, 1, 0, 1,
-0.8351469, -0.491554, -2.816386, 0.7215686, 1, 0, 1,
-0.8341401, -0.7693714, -2.40643, 0.7176471, 1, 0, 1,
-0.8330718, -0.7054532, -2.11247, 0.7098039, 1, 0, 1,
-0.8256205, -1.921281, -2.363811, 0.7058824, 1, 0, 1,
-0.8226608, -0.6058031, -1.015218, 0.6980392, 1, 0, 1,
-0.8220215, -0.3139572, -2.036046, 0.6901961, 1, 0, 1,
-0.8190648, 0.1948554, -1.165395, 0.6862745, 1, 0, 1,
-0.8123527, -0.5586545, -3.266116, 0.6784314, 1, 0, 1,
-0.8103765, -0.9263789, -3.582964, 0.6745098, 1, 0, 1,
-0.8075545, -3.000851, -2.317183, 0.6666667, 1, 0, 1,
-0.7914833, -0.5443192, 0.2165682, 0.6627451, 1, 0, 1,
-0.779509, -0.6846575, -2.577405, 0.654902, 1, 0, 1,
-0.7787646, -1.733934, -2.417915, 0.6509804, 1, 0, 1,
-0.7534609, -2.886735, -2.292396, 0.6431373, 1, 0, 1,
-0.7504202, -0.1913737, -2.481586, 0.6392157, 1, 0, 1,
-0.7485735, -0.7571302, -3.008548, 0.6313726, 1, 0, 1,
-0.7471718, -0.6125867, -1.655317, 0.627451, 1, 0, 1,
-0.7431123, 1.107021, -1.384805, 0.6196079, 1, 0, 1,
-0.7414438, 1.411413, 1.297926, 0.6156863, 1, 0, 1,
-0.7400917, -0.2849868, -1.551848, 0.6078432, 1, 0, 1,
-0.7253238, 0.7705281, -0.8860167, 0.6039216, 1, 0, 1,
-0.7235686, 0.6123726, -2.593826, 0.5960785, 1, 0, 1,
-0.72188, -0.5635784, -1.766478, 0.5882353, 1, 0, 1,
-0.7209367, 0.4861774, -0.02474554, 0.5843138, 1, 0, 1,
-0.7191002, 0.236872, -2.62528, 0.5764706, 1, 0, 1,
-0.7131681, -0.6161552, -5.471555, 0.572549, 1, 0, 1,
-0.7106234, -0.04288831, -2.023497, 0.5647059, 1, 0, 1,
-0.7089601, -0.4327062, -1.173849, 0.5607843, 1, 0, 1,
-0.7089003, 0.06612106, -1.384581, 0.5529412, 1, 0, 1,
-0.6932266, -1.094026, -4.06826, 0.5490196, 1, 0, 1,
-0.6912738, 0.2910298, -1.763881, 0.5411765, 1, 0, 1,
-0.6893018, -1.395806, -3.192406, 0.5372549, 1, 0, 1,
-0.6886812, -1.511103, -2.115205, 0.5294118, 1, 0, 1,
-0.684437, 0.4604926, -0.7469559, 0.5254902, 1, 0, 1,
-0.6838534, 1.633339, -0.5968031, 0.5176471, 1, 0, 1,
-0.6832293, 0.4497034, -1.918626, 0.5137255, 1, 0, 1,
-0.6820676, 0.5543432, -0.3316811, 0.5058824, 1, 0, 1,
-0.6801904, -0.1957418, -3.053353, 0.5019608, 1, 0, 1,
-0.6776195, -1.042683, -4.794851, 0.4941176, 1, 0, 1,
-0.6760146, 0.113831, -1.001113, 0.4862745, 1, 0, 1,
-0.6728952, 0.1863711, -1.985652, 0.4823529, 1, 0, 1,
-0.6678978, -1.554377, -2.442102, 0.4745098, 1, 0, 1,
-0.6668729, 0.7192258, -0.06148301, 0.4705882, 1, 0, 1,
-0.6621499, -0.06334011, -1.252437, 0.4627451, 1, 0, 1,
-0.658398, 0.2061435, -0.4531403, 0.4588235, 1, 0, 1,
-0.6578705, -0.4926355, -1.774468, 0.4509804, 1, 0, 1,
-0.6572524, 0.7620293, -0.7369862, 0.4470588, 1, 0, 1,
-0.6516204, -0.507992, -3.396781, 0.4392157, 1, 0, 1,
-0.6452336, -0.08365534, -1.597102, 0.4352941, 1, 0, 1,
-0.6443819, 2.162978, -0.2081692, 0.427451, 1, 0, 1,
-0.6402131, -0.5386699, -3.28976, 0.4235294, 1, 0, 1,
-0.6361014, 2.049108, 1.765439, 0.4156863, 1, 0, 1,
-0.6343462, -0.3621602, -1.869228, 0.4117647, 1, 0, 1,
-0.6301941, -0.5364392, -2.029499, 0.4039216, 1, 0, 1,
-0.6290399, -1.013201, -2.742459, 0.3960784, 1, 0, 1,
-0.6196299, -0.3590466, -1.088352, 0.3921569, 1, 0, 1,
-0.6140506, 0.7041255, -0.7997001, 0.3843137, 1, 0, 1,
-0.6132444, -1.088208, -2.84899, 0.3803922, 1, 0, 1,
-0.6094652, -2.608948, -3.10095, 0.372549, 1, 0, 1,
-0.6051776, -0.4228141, -0.9983892, 0.3686275, 1, 0, 1,
-0.5991498, 0.7781681, 0.1274728, 0.3607843, 1, 0, 1,
-0.595536, 1.476872, -1.458395, 0.3568628, 1, 0, 1,
-0.5923079, -0.117508, 0.1532877, 0.3490196, 1, 0, 1,
-0.5892991, 0.0548183, -1.12456, 0.345098, 1, 0, 1,
-0.5846661, -0.9156721, -2.721704, 0.3372549, 1, 0, 1,
-0.5828549, 0.854402, -0.7342752, 0.3333333, 1, 0, 1,
-0.5783125, -0.834196, -0.8211588, 0.3254902, 1, 0, 1,
-0.5760058, -0.5778487, -1.568956, 0.3215686, 1, 0, 1,
-0.5709001, -0.5240409, -3.438176, 0.3137255, 1, 0, 1,
-0.5702826, -1.113587, -2.885636, 0.3098039, 1, 0, 1,
-0.5674137, 0.9063392, -1.803564, 0.3019608, 1, 0, 1,
-0.5671558, 1.306059, -1.271853, 0.2941177, 1, 0, 1,
-0.5609894, 0.4886258, -0.6723154, 0.2901961, 1, 0, 1,
-0.5566302, 0.6625675, -1.782699, 0.282353, 1, 0, 1,
-0.5467083, -1.814466, -3.478348, 0.2784314, 1, 0, 1,
-0.5438275, -0.008896195, -1.502372, 0.2705882, 1, 0, 1,
-0.542632, -0.7916874, -2.585174, 0.2666667, 1, 0, 1,
-0.5414497, 0.2282148, -0.8722714, 0.2588235, 1, 0, 1,
-0.5384753, 0.9524043, 1.072347, 0.254902, 1, 0, 1,
-0.5358687, 0.3314887, -0.9191754, 0.2470588, 1, 0, 1,
-0.5291671, 1.255185, -1.364279, 0.2431373, 1, 0, 1,
-0.5284747, 2.369158, -0.05352691, 0.2352941, 1, 0, 1,
-0.5252707, -0.3780392, -1.452568, 0.2313726, 1, 0, 1,
-0.5156196, 1.075608, -0.3591313, 0.2235294, 1, 0, 1,
-0.5153957, 0.4968006, 0.1758735, 0.2196078, 1, 0, 1,
-0.5115923, 1.301346, -0.5695873, 0.2117647, 1, 0, 1,
-0.5108452, 0.5686998, -0.2580622, 0.2078431, 1, 0, 1,
-0.5020115, 0.7947433, -2.153696, 0.2, 1, 0, 1,
-0.5006147, -0.07222893, -1.271867, 0.1921569, 1, 0, 1,
-0.4970635, -0.4549618, -2.230699, 0.1882353, 1, 0, 1,
-0.4966057, 1.884264, -1.00149, 0.1803922, 1, 0, 1,
-0.4941652, -1.210421, -1.263723, 0.1764706, 1, 0, 1,
-0.4927277, -0.004681519, -0.6574968, 0.1686275, 1, 0, 1,
-0.4873425, 0.6583209, 0.8382562, 0.1647059, 1, 0, 1,
-0.4869144, -0.2148164, -2.675271, 0.1568628, 1, 0, 1,
-0.4849578, 1.588138, -1.388185, 0.1529412, 1, 0, 1,
-0.4821866, 2.183514, -0.6851606, 0.145098, 1, 0, 1,
-0.4809487, 1.355024, -0.6292855, 0.1411765, 1, 0, 1,
-0.4794801, 0.2386685, -1.656273, 0.1333333, 1, 0, 1,
-0.4746544, -0.9883715, -1.752949, 0.1294118, 1, 0, 1,
-0.4686886, 2.041108, 0.4352787, 0.1215686, 1, 0, 1,
-0.4629178, 0.6550117, -1.394974, 0.1176471, 1, 0, 1,
-0.4593932, 1.144182, -0.9020021, 0.1098039, 1, 0, 1,
-0.4579092, -0.4682236, -3.0056, 0.1058824, 1, 0, 1,
-0.4533565, 1.821073, 0.4991866, 0.09803922, 1, 0, 1,
-0.4515556, 0.3237873, 0.0140084, 0.09019608, 1, 0, 1,
-0.4488867, -0.9988155, -3.347609, 0.08627451, 1, 0, 1,
-0.4483069, -1.030123, -4.14232, 0.07843138, 1, 0, 1,
-0.4461825, 0.3624515, -1.59584, 0.07450981, 1, 0, 1,
-0.4434407, -0.4263562, -3.238437, 0.06666667, 1, 0, 1,
-0.4395119, 0.3158307, -1.577256, 0.0627451, 1, 0, 1,
-0.4376956, 0.6243559, -0.5686728, 0.05490196, 1, 0, 1,
-0.4369023, -1.463476, -2.486409, 0.05098039, 1, 0, 1,
-0.4367977, 0.5766579, -0.6811951, 0.04313726, 1, 0, 1,
-0.4365904, 0.0765277, -0.579516, 0.03921569, 1, 0, 1,
-0.4359432, -0.7382119, -2.733151, 0.03137255, 1, 0, 1,
-0.4344478, -0.437584, -1.889883, 0.02745098, 1, 0, 1,
-0.433942, -0.323211, -0.6392457, 0.01960784, 1, 0, 1,
-0.4313251, 1.237705, -0.2473129, 0.01568628, 1, 0, 1,
-0.4287301, 2.080378, 0.5923743, 0.007843138, 1, 0, 1,
-0.428477, 0.02711584, -1.87641, 0.003921569, 1, 0, 1,
-0.4202709, -0.02403354, -4.2675, 0, 1, 0.003921569, 1,
-0.4179713, -0.7443389, -2.138987, 0, 1, 0.01176471, 1,
-0.4168883, 1.144638, -1.47844, 0, 1, 0.01568628, 1,
-0.4164152, -0.2553202, -3.010729, 0, 1, 0.02352941, 1,
-0.4115315, 0.1935385, -1.443482, 0, 1, 0.02745098, 1,
-0.4021343, 0.6617025, -0.8697476, 0, 1, 0.03529412, 1,
-0.3970259, -1.036085, -4.550428, 0, 1, 0.03921569, 1,
-0.392842, -2.209714, -3.080081, 0, 1, 0.04705882, 1,
-0.3925145, 0.9502454, -0.9213313, 0, 1, 0.05098039, 1,
-0.3915682, -1.195091, -2.214247, 0, 1, 0.05882353, 1,
-0.3884301, 1.131475, -0.1968226, 0, 1, 0.0627451, 1,
-0.386206, 1.411106, -1.836438, 0, 1, 0.07058824, 1,
-0.3834765, 2.093992, -1.052883, 0, 1, 0.07450981, 1,
-0.3795389, 0.8360363, -0.5459445, 0, 1, 0.08235294, 1,
-0.3707695, -0.5003584, -0.761782, 0, 1, 0.08627451, 1,
-0.3689743, 1.180473, -0.767748, 0, 1, 0.09411765, 1,
-0.3630562, 1.807418, -0.4422846, 0, 1, 0.1019608, 1,
-0.360976, -1.158713, -3.942878, 0, 1, 0.1058824, 1,
-0.3565311, -0.02684268, -2.96544, 0, 1, 0.1137255, 1,
-0.3529567, 1.198717, -2.840813, 0, 1, 0.1176471, 1,
-0.3492409, -1.279423, -3.370245, 0, 1, 0.1254902, 1,
-0.3481287, 0.3403768, -2.500107, 0, 1, 0.1294118, 1,
-0.3452396, -1.898876, -4.144211, 0, 1, 0.1372549, 1,
-0.3447065, 1.683468, -0.5004808, 0, 1, 0.1411765, 1,
-0.3419984, -0.5933536, -2.089752, 0, 1, 0.1490196, 1,
-0.3404752, -1.745737, -2.360195, 0, 1, 0.1529412, 1,
-0.328549, -0.4619374, -1.959714, 0, 1, 0.1607843, 1,
-0.3260213, -0.7903799, -1.951329, 0, 1, 0.1647059, 1,
-0.3259217, 0.5706517, -0.5735189, 0, 1, 0.172549, 1,
-0.3204055, -1.279201, -1.393078, 0, 1, 0.1764706, 1,
-0.3183695, -0.1275795, -2.062145, 0, 1, 0.1843137, 1,
-0.3160179, -1.101905, -2.73419, 0, 1, 0.1882353, 1,
-0.3134314, -0.4477979, -3.366186, 0, 1, 0.1960784, 1,
-0.3130088, -0.5012434, -2.556363, 0, 1, 0.2039216, 1,
-0.3123216, 1.414643, -0.6346291, 0, 1, 0.2078431, 1,
-0.3076777, 0.3197987, -2.191426, 0, 1, 0.2156863, 1,
-0.2963369, -0.4714074, -4.364397, 0, 1, 0.2196078, 1,
-0.296092, 0.001669667, -1.199515, 0, 1, 0.227451, 1,
-0.2916044, 0.2706553, -3.077235, 0, 1, 0.2313726, 1,
-0.2908847, -0.04501427, -2.697064, 0, 1, 0.2392157, 1,
-0.2854253, 0.5655689, 0.2275794, 0, 1, 0.2431373, 1,
-0.2776212, 0.999894, 0.348028, 0, 1, 0.2509804, 1,
-0.2764605, -0.560254, -2.248333, 0, 1, 0.254902, 1,
-0.2750246, -0.9385036, -1.18711, 0, 1, 0.2627451, 1,
-0.2731799, 0.5212843, -1.041303, 0, 1, 0.2666667, 1,
-0.2713521, 3.435005, 0.5010768, 0, 1, 0.2745098, 1,
-0.2665586, -0.7587644, -5.876551, 0, 1, 0.2784314, 1,
-0.2664036, -1.815923, -1.943115, 0, 1, 0.2862745, 1,
-0.2638004, -0.6870131, -2.823519, 0, 1, 0.2901961, 1,
-0.2633106, -0.1112096, -1.997181, 0, 1, 0.2980392, 1,
-0.2628875, 0.5388949, -0.950601, 0, 1, 0.3058824, 1,
-0.2614312, -0.2971416, -4.053977, 0, 1, 0.3098039, 1,
-0.258034, 0.04564481, -2.216943, 0, 1, 0.3176471, 1,
-0.2565345, 0.6627194, -1.844627, 0, 1, 0.3215686, 1,
-0.2459397, -0.3272911, -1.626122, 0, 1, 0.3294118, 1,
-0.2436447, 1.186838, 0.4010834, 0, 1, 0.3333333, 1,
-0.2404741, -0.5096429, -2.512679, 0, 1, 0.3411765, 1,
-0.2370966, -1.505769, -3.062511, 0, 1, 0.345098, 1,
-0.2321038, 0.02606422, -1.419778, 0, 1, 0.3529412, 1,
-0.2278969, 1.370392, -0.9666878, 0, 1, 0.3568628, 1,
-0.2273908, -0.1773748, -2.431134, 0, 1, 0.3647059, 1,
-0.2252354, -1.516188, -2.275816, 0, 1, 0.3686275, 1,
-0.2222534, 1.805326, 0.663355, 0, 1, 0.3764706, 1,
-0.2219831, 0.5720323, 1.801915, 0, 1, 0.3803922, 1,
-0.2219627, 0.05775406, -0.06862267, 0, 1, 0.3882353, 1,
-0.2171389, -0.5142184, -3.223619, 0, 1, 0.3921569, 1,
-0.2170007, 0.198809, -0.7234639, 0, 1, 0.4, 1,
-0.2131914, 1.912666, -1.912586, 0, 1, 0.4078431, 1,
-0.2116444, -1.640693, -3.913286, 0, 1, 0.4117647, 1,
-0.206087, 0.0478692, -1.214709, 0, 1, 0.4196078, 1,
-0.2059745, 0.0142616, -0.8646394, 0, 1, 0.4235294, 1,
-0.2033219, -1.554623, -3.995762, 0, 1, 0.4313726, 1,
-0.1983007, -0.8187171, -1.684706, 0, 1, 0.4352941, 1,
-0.1980553, 1.168412, 0.3979417, 0, 1, 0.4431373, 1,
-0.1957201, -1.10628, -1.783933, 0, 1, 0.4470588, 1,
-0.1905452, -0.7678437, -3.48326, 0, 1, 0.454902, 1,
-0.1893305, -1.866199, -2.629312, 0, 1, 0.4588235, 1,
-0.1882497, 0.01827217, -1.924861, 0, 1, 0.4666667, 1,
-0.1876705, 0.2302671, -0.5125571, 0, 1, 0.4705882, 1,
-0.1846361, 0.3460804, -0.1627744, 0, 1, 0.4784314, 1,
-0.1825888, 2.164097, -0.1850384, 0, 1, 0.4823529, 1,
-0.1799373, -0.3814782, -3.469058, 0, 1, 0.4901961, 1,
-0.1776567, -0.7577306, -4.540986, 0, 1, 0.4941176, 1,
-0.1773851, 0.1317978, -0.8389692, 0, 1, 0.5019608, 1,
-0.1753058, -1.334134, -4.791573, 0, 1, 0.509804, 1,
-0.1734977, 0.1591947, -1.295178, 0, 1, 0.5137255, 1,
-0.1716821, 1.105019, -0.1235057, 0, 1, 0.5215687, 1,
-0.1701851, 0.8109539, -0.2092792, 0, 1, 0.5254902, 1,
-0.1696876, -0.1818882, -2.119078, 0, 1, 0.5333334, 1,
-0.169262, -0.3182625, -2.550897, 0, 1, 0.5372549, 1,
-0.1673627, -1.467801, -3.023485, 0, 1, 0.5450981, 1,
-0.1622253, 1.419135, -0.4866396, 0, 1, 0.5490196, 1,
-0.1600448, 0.2333279, -1.197569, 0, 1, 0.5568628, 1,
-0.1581956, 0.02980648, -1.806121, 0, 1, 0.5607843, 1,
-0.1560688, -0.2320864, -2.528803, 0, 1, 0.5686275, 1,
-0.1534055, -0.4641881, -2.255968, 0, 1, 0.572549, 1,
-0.1532928, 0.1176599, -1.432974, 0, 1, 0.5803922, 1,
-0.1530967, 0.7005777, -2.445243, 0, 1, 0.5843138, 1,
-0.1527735, -0.5309378, -3.397201, 0, 1, 0.5921569, 1,
-0.149811, 1.310853, -0.01830799, 0, 1, 0.5960785, 1,
-0.1453194, 0.9258149, 1.150997, 0, 1, 0.6039216, 1,
-0.1411358, -0.2251376, -2.197753, 0, 1, 0.6117647, 1,
-0.1409776, -0.8260208, -2.69546, 0, 1, 0.6156863, 1,
-0.1390602, 0.6193683, 0.0868016, 0, 1, 0.6235294, 1,
-0.1351322, -1.112859, -3.780621, 0, 1, 0.627451, 1,
-0.1348417, 0.2686574, -2.313243, 0, 1, 0.6352941, 1,
-0.1321892, 1.810129, -0.6461528, 0, 1, 0.6392157, 1,
-0.1293927, -0.05395439, -3.358982, 0, 1, 0.6470588, 1,
-0.1267732, 0.7402111, -0.8124409, 0, 1, 0.6509804, 1,
-0.123741, -0.6853739, -2.396231, 0, 1, 0.6588235, 1,
-0.1190766, -0.7947185, -3.511138, 0, 1, 0.6627451, 1,
-0.1182576, 0.5686787, -1.22283, 0, 1, 0.6705883, 1,
-0.1175097, -0.9444634, -4.982832, 0, 1, 0.6745098, 1,
-0.1146174, -0.5264983, -3.309162, 0, 1, 0.682353, 1,
-0.1138946, 1.040241, 1.548714, 0, 1, 0.6862745, 1,
-0.1128379, 0.03620015, -0.7011834, 0, 1, 0.6941177, 1,
-0.1109358, 0.7593559, -0.6837904, 0, 1, 0.7019608, 1,
-0.1104269, -0.04430396, -2.507336, 0, 1, 0.7058824, 1,
-0.1097926, -0.07208369, -1.598154, 0, 1, 0.7137255, 1,
-0.108267, 0.08002315, -1.386094, 0, 1, 0.7176471, 1,
-0.09405284, -0.1879172, -2.501331, 0, 1, 0.7254902, 1,
-0.08936977, 1.528901, -0.6814473, 0, 1, 0.7294118, 1,
-0.08860823, -1.969128, -3.136531, 0, 1, 0.7372549, 1,
-0.08429626, 1.255183, -2.459306, 0, 1, 0.7411765, 1,
-0.0838602, -0.1890752, -2.020007, 0, 1, 0.7490196, 1,
-0.08378077, -0.8383231, -4.730497, 0, 1, 0.7529412, 1,
-0.08164605, -0.4275452, -4.187038, 0, 1, 0.7607843, 1,
-0.07690489, 0.3844213, 0.04197311, 0, 1, 0.7647059, 1,
-0.07607389, -0.479582, -4.295667, 0, 1, 0.772549, 1,
-0.07305177, 0.2145572, -2.548176, 0, 1, 0.7764706, 1,
-0.06775831, -0.3212101, -3.3432, 0, 1, 0.7843137, 1,
-0.06564864, 0.4417375, 0.1805671, 0, 1, 0.7882353, 1,
-0.0641683, -0.4606503, -1.886303, 0, 1, 0.7960784, 1,
-0.06310201, -0.3571469, -4.597619, 0, 1, 0.8039216, 1,
-0.05851012, -0.9523484, -1.681694, 0, 1, 0.8078431, 1,
-0.05849432, 1.516859, -2.858732, 0, 1, 0.8156863, 1,
-0.05280072, -1.273658, -1.683145, 0, 1, 0.8196079, 1,
-0.0527869, 0.3369824, -1.284799, 0, 1, 0.827451, 1,
-0.04949592, -0.2727093, -5.450397, 0, 1, 0.8313726, 1,
-0.04689509, -0.3110074, -2.431262, 0, 1, 0.8392157, 1,
-0.04536969, -0.3134695, -3.9133, 0, 1, 0.8431373, 1,
-0.04521246, -0.2753081, -3.168179, 0, 1, 0.8509804, 1,
-0.04369745, -0.636871, -4.854237, 0, 1, 0.854902, 1,
-0.03509627, 1.148068, -0.7652777, 0, 1, 0.8627451, 1,
-0.02996478, -0.7496939, -2.99214, 0, 1, 0.8666667, 1,
-0.02702736, 0.394295, -2.270265, 0, 1, 0.8745098, 1,
-0.02468188, 2.278348, 0.8034549, 0, 1, 0.8784314, 1,
-0.02460576, 0.9561139, 0.1365621, 0, 1, 0.8862745, 1,
-0.01815813, 0.9592435, -0.2746694, 0, 1, 0.8901961, 1,
-0.01587885, -0.7097616, -2.533945, 0, 1, 0.8980392, 1,
-0.01582715, -0.9107741, -4.559784, 0, 1, 0.9058824, 1,
-0.01078153, -0.8384128, -3.776212, 0, 1, 0.9098039, 1,
-0.008976826, -1.449967, -3.601993, 0, 1, 0.9176471, 1,
-0.004359252, -0.474632, -0.6730743, 0, 1, 0.9215686, 1,
-0.00432493, -1.702923, -3.290637, 0, 1, 0.9294118, 1,
-0.001607799, 0.2410615, 0.5632753, 0, 1, 0.9333333, 1,
0.0002117063, -0.5102998, 3.49234, 0, 1, 0.9411765, 1,
0.0003001259, -0.4621307, 2.028073, 0, 1, 0.945098, 1,
0.004082959, -0.4755149, 1.172629, 0, 1, 0.9529412, 1,
0.005753609, 1.39628, -0.1083444, 0, 1, 0.9568627, 1,
0.006228935, 0.06591615, 0.4160666, 0, 1, 0.9647059, 1,
0.01132773, 0.8956084, -0.167982, 0, 1, 0.9686275, 1,
0.01213433, -1.58966, 2.967941, 0, 1, 0.9764706, 1,
0.01503651, 0.7367342, 1.278621, 0, 1, 0.9803922, 1,
0.01535145, -2.002552, 3.683707, 0, 1, 0.9882353, 1,
0.02497958, 1.137904, -1.051212, 0, 1, 0.9921569, 1,
0.02703369, 0.1142019, 0.04857549, 0, 1, 1, 1,
0.02736165, -0.3728258, 1.992466, 0, 0.9921569, 1, 1,
0.02796231, 0.246413, 0.3654839, 0, 0.9882353, 1, 1,
0.03316277, 0.2181819, -0.4864104, 0, 0.9803922, 1, 1,
0.03339869, -0.3975776, 1.588779, 0, 0.9764706, 1, 1,
0.03657743, -0.002932319, 1.79211, 0, 0.9686275, 1, 1,
0.0391022, -0.2902206, 1.642624, 0, 0.9647059, 1, 1,
0.04672363, 1.216641, -0.235587, 0, 0.9568627, 1, 1,
0.04787486, -0.3220503, 3.207651, 0, 0.9529412, 1, 1,
0.05065732, 0.5849199, 1.418839, 0, 0.945098, 1, 1,
0.05085636, 0.1898595, 0.7456515, 0, 0.9411765, 1, 1,
0.05234622, 1.498038, 1.339417, 0, 0.9333333, 1, 1,
0.05463236, -1.021266, 3.806669, 0, 0.9294118, 1, 1,
0.05470539, -0.8126211, 2.451474, 0, 0.9215686, 1, 1,
0.06385253, 0.1065678, 0.0522108, 0, 0.9176471, 1, 1,
0.06690741, 0.4966136, -0.1198039, 0, 0.9098039, 1, 1,
0.06850705, 0.4102883, 0.7470819, 0, 0.9058824, 1, 1,
0.07234044, -0.8399799, 3.222162, 0, 0.8980392, 1, 1,
0.07387739, -0.1470507, 1.782541, 0, 0.8901961, 1, 1,
0.07431858, -2.557888, 2.907547, 0, 0.8862745, 1, 1,
0.07627369, -0.2722981, 2.875029, 0, 0.8784314, 1, 1,
0.07776362, 1.032898, -0.7940333, 0, 0.8745098, 1, 1,
0.07854651, 0.6544107, 0.6366615, 0, 0.8666667, 1, 1,
0.07919431, -0.7775052, 1.817506, 0, 0.8627451, 1, 1,
0.0808587, -0.02529749, 1.50805, 0, 0.854902, 1, 1,
0.08560083, -0.7568258, 2.401191, 0, 0.8509804, 1, 1,
0.0882541, 0.5156214, 0.07919994, 0, 0.8431373, 1, 1,
0.08877421, -0.3663196, 3.699756, 0, 0.8392157, 1, 1,
0.09185151, 1.101894, 0.4344865, 0, 0.8313726, 1, 1,
0.09304689, -0.212555, 1.153389, 0, 0.827451, 1, 1,
0.09646199, -0.5353696, 3.502373, 0, 0.8196079, 1, 1,
0.09695099, -0.5844001, 1.680378, 0, 0.8156863, 1, 1,
0.09800835, -0.3286774, 3.73675, 0, 0.8078431, 1, 1,
0.09837897, 0.3069512, -0.8116412, 0, 0.8039216, 1, 1,
0.10331, -0.980849, 1.786311, 0, 0.7960784, 1, 1,
0.1036874, 0.8506487, 0.1368993, 0, 0.7882353, 1, 1,
0.1047713, -1.254425, 2.283782, 0, 0.7843137, 1, 1,
0.1050095, 1.15206, -0.2083499, 0, 0.7764706, 1, 1,
0.1098473, 0.4413464, -0.7587686, 0, 0.772549, 1, 1,
0.1150741, -0.5504577, 3.075473, 0, 0.7647059, 1, 1,
0.120026, 2.199636, 0.005683029, 0, 0.7607843, 1, 1,
0.1202286, -0.2188224, 4.234519, 0, 0.7529412, 1, 1,
0.1242813, 1.178862, 0.4865723, 0, 0.7490196, 1, 1,
0.12747, 3.070771, 1.678564, 0, 0.7411765, 1, 1,
0.1289967, -1.075185, 2.95687, 0, 0.7372549, 1, 1,
0.1349225, -0.8282834, 3.310312, 0, 0.7294118, 1, 1,
0.1355159, 1.308089, -0.1730261, 0, 0.7254902, 1, 1,
0.1392142, -1.60583, 2.764989, 0, 0.7176471, 1, 1,
0.1393351, -0.8068644, 2.543813, 0, 0.7137255, 1, 1,
0.1403516, -0.48634, 2.803159, 0, 0.7058824, 1, 1,
0.1407717, 0.6257278, 0.5208394, 0, 0.6980392, 1, 1,
0.141919, 1.102253, 2.234916, 0, 0.6941177, 1, 1,
0.15308, -0.291911, 1.93385, 0, 0.6862745, 1, 1,
0.1560682, 2.666128, 1.663539, 0, 0.682353, 1, 1,
0.1588399, -0.3936093, 2.12487, 0, 0.6745098, 1, 1,
0.1589092, -1.131126, 2.279588, 0, 0.6705883, 1, 1,
0.1601051, 1.240007, 1.227469, 0, 0.6627451, 1, 1,
0.1647577, -0.5237343, 2.530358, 0, 0.6588235, 1, 1,
0.1647796, 0.1225767, -1.002199, 0, 0.6509804, 1, 1,
0.166181, -0.1009265, 1.296424, 0, 0.6470588, 1, 1,
0.1665251, 1.20918, 0.123329, 0, 0.6392157, 1, 1,
0.1705963, 0.582976, 1.361806, 0, 0.6352941, 1, 1,
0.1726285, -0.1974853, 1.086856, 0, 0.627451, 1, 1,
0.1752237, 0.3610617, 0.1225696, 0, 0.6235294, 1, 1,
0.1767306, -0.008373387, 0.4998072, 0, 0.6156863, 1, 1,
0.1800715, 0.06446853, 3.507814, 0, 0.6117647, 1, 1,
0.1819565, -1.032147, 2.840164, 0, 0.6039216, 1, 1,
0.1827193, -0.1780358, 0.531536, 0, 0.5960785, 1, 1,
0.1834539, -1.123372, 3.757489, 0, 0.5921569, 1, 1,
0.1838737, 0.79818, -2.629387, 0, 0.5843138, 1, 1,
0.1842551, -0.7633479, 2.526339, 0, 0.5803922, 1, 1,
0.1865056, 0.4709853, 0.02707759, 0, 0.572549, 1, 1,
0.1881857, -1.086326, 2.591738, 0, 0.5686275, 1, 1,
0.1925419, 0.4950428, 0.1052766, 0, 0.5607843, 1, 1,
0.1927134, -0.9570585, 3.488444, 0, 0.5568628, 1, 1,
0.1960813, 0.1291907, 0.2213592, 0, 0.5490196, 1, 1,
0.198616, 0.4174186, 2.949264, 0, 0.5450981, 1, 1,
0.1997889, 1.015197, 0.6006267, 0, 0.5372549, 1, 1,
0.2002294, 0.2257202, 1.679529, 0, 0.5333334, 1, 1,
0.2003819, 1.111548, 1.270885, 0, 0.5254902, 1, 1,
0.2053634, 0.06786375, 0.3863435, 0, 0.5215687, 1, 1,
0.2119082, -0.3400098, 3.057166, 0, 0.5137255, 1, 1,
0.2149471, 0.1881065, 2.091607, 0, 0.509804, 1, 1,
0.2169592, -0.190952, 5.005092, 0, 0.5019608, 1, 1,
0.2252125, 0.9906906, 1.127424, 0, 0.4941176, 1, 1,
0.2306003, -0.2346214, 1.880201, 0, 0.4901961, 1, 1,
0.2345999, 0.9005233, -1.132567, 0, 0.4823529, 1, 1,
0.2441599, 1.412778, 0.4530657, 0, 0.4784314, 1, 1,
0.248076, -0.02261995, 3.158901, 0, 0.4705882, 1, 1,
0.253887, 0.4932307, 1.821924, 0, 0.4666667, 1, 1,
0.2591088, -1.595646, 1.95288, 0, 0.4588235, 1, 1,
0.2651688, -0.386854, 2.230468, 0, 0.454902, 1, 1,
0.2667185, -0.7983618, 1.259683, 0, 0.4470588, 1, 1,
0.2694684, -0.03347245, 1.781267, 0, 0.4431373, 1, 1,
0.2716371, -0.6111075, 2.136368, 0, 0.4352941, 1, 1,
0.2769948, 1.008757, 1.756866, 0, 0.4313726, 1, 1,
0.2777945, -0.9558255, 3.162057, 0, 0.4235294, 1, 1,
0.2779454, 1.197421, 0.3890254, 0, 0.4196078, 1, 1,
0.2902267, -0.02667866, 1.190412, 0, 0.4117647, 1, 1,
0.29229, -1.040738, 4.445294, 0, 0.4078431, 1, 1,
0.2927047, -0.9209297, 2.414928, 0, 0.4, 1, 1,
0.2930026, -0.8603486, 5.523039, 0, 0.3921569, 1, 1,
0.2946109, 0.5011919, 0.4663008, 0, 0.3882353, 1, 1,
0.2965845, -0.05739035, 1.938358, 0, 0.3803922, 1, 1,
0.3015287, -0.9600008, 1.459959, 0, 0.3764706, 1, 1,
0.3089517, 0.3572836, -1.536713, 0, 0.3686275, 1, 1,
0.3100789, 0.0009764053, 2.798044, 0, 0.3647059, 1, 1,
0.3197575, 1.279022, 1.149464, 0, 0.3568628, 1, 1,
0.3221037, -0.4449585, 2.630778, 0, 0.3529412, 1, 1,
0.3233254, 0.06970349, 1.641838, 0, 0.345098, 1, 1,
0.3299882, -0.9225799, 2.477353, 0, 0.3411765, 1, 1,
0.3337877, 0.6457255, -0.7017936, 0, 0.3333333, 1, 1,
0.3402189, -1.676376, 2.854116, 0, 0.3294118, 1, 1,
0.3488892, 0.01589651, 1.119294, 0, 0.3215686, 1, 1,
0.3545921, 1.095815, 0.4200369, 0, 0.3176471, 1, 1,
0.356923, -0.6187623, 1.174374, 0, 0.3098039, 1, 1,
0.358864, -0.9413061, 3.252063, 0, 0.3058824, 1, 1,
0.359669, -0.8509924, 1.152658, 0, 0.2980392, 1, 1,
0.3605524, -0.3207017, 1.219154, 0, 0.2901961, 1, 1,
0.3627589, 0.06486921, 1.86432, 0, 0.2862745, 1, 1,
0.3639297, -0.2473952, 1.909473, 0, 0.2784314, 1, 1,
0.3690491, -0.4587351, 2.493436, 0, 0.2745098, 1, 1,
0.3695661, 0.1493791, 0.7200443, 0, 0.2666667, 1, 1,
0.3783078, 0.3620245, 0.9435193, 0, 0.2627451, 1, 1,
0.3810031, 1.397313, 0.3932833, 0, 0.254902, 1, 1,
0.3823049, -2.041927, 3.423752, 0, 0.2509804, 1, 1,
0.382467, -1.73205, 2.48786, 0, 0.2431373, 1, 1,
0.3836613, -1.176255, 2.576557, 0, 0.2392157, 1, 1,
0.3863127, -1.605128, 3.135761, 0, 0.2313726, 1, 1,
0.3865427, 0.7997516, 0.9454083, 0, 0.227451, 1, 1,
0.3910143, 1.240507, -0.4453206, 0, 0.2196078, 1, 1,
0.400285, 0.675633, -0.1719226, 0, 0.2156863, 1, 1,
0.4016341, 0.07254912, 0.5721141, 0, 0.2078431, 1, 1,
0.4081498, -0.8306416, 2.898778, 0, 0.2039216, 1, 1,
0.4103052, 0.5624238, 0.5291801, 0, 0.1960784, 1, 1,
0.4106876, 0.6781321, -0.6841311, 0, 0.1882353, 1, 1,
0.4123942, -1.016015, 3.25987, 0, 0.1843137, 1, 1,
0.4132046, -0.5608662, 3.681828, 0, 0.1764706, 1, 1,
0.4135336, -0.6280431, 2.224041, 0, 0.172549, 1, 1,
0.4142311, -0.0831214, 1.392066, 0, 0.1647059, 1, 1,
0.4183927, 2.133169, 0.2498538, 0, 0.1607843, 1, 1,
0.4201636, -1.820504, 3.465982, 0, 0.1529412, 1, 1,
0.4227346, 0.2491851, 1.238674, 0, 0.1490196, 1, 1,
0.4253995, -0.2650609, -0.9293564, 0, 0.1411765, 1, 1,
0.4256501, 0.8182108, 1.751885, 0, 0.1372549, 1, 1,
0.425878, 0.2387184, 0.2157592, 0, 0.1294118, 1, 1,
0.4268621, 0.858079, -0.5486049, 0, 0.1254902, 1, 1,
0.4272288, -0.6201862, 3.770512, 0, 0.1176471, 1, 1,
0.4276923, -0.2161919, 3.818094, 0, 0.1137255, 1, 1,
0.4349279, -1.260014, 4.84944, 0, 0.1058824, 1, 1,
0.4365429, 0.3657447, 0.2588238, 0, 0.09803922, 1, 1,
0.4402232, 0.9771863, 0.1354614, 0, 0.09411765, 1, 1,
0.4412442, 0.08372332, 1.272725, 0, 0.08627451, 1, 1,
0.4413285, -0.1861928, 2.066199, 0, 0.08235294, 1, 1,
0.4416568, -0.6607032, 1.928354, 0, 0.07450981, 1, 1,
0.4416749, 0.5240003, 1.637175, 0, 0.07058824, 1, 1,
0.4423446, -0.6752176, 1.946328, 0, 0.0627451, 1, 1,
0.4435237, 1.542803, -1.127517, 0, 0.05882353, 1, 1,
0.4440788, 0.873271, 0.1081924, 0, 0.05098039, 1, 1,
0.4479247, -1.316166, 4.563036, 0, 0.04705882, 1, 1,
0.4563147, -0.2335114, 1.514767, 0, 0.03921569, 1, 1,
0.4571121, 0.8488145, 0.8360905, 0, 0.03529412, 1, 1,
0.4587811, 1.421941, 1.178215, 0, 0.02745098, 1, 1,
0.4631877, 0.26532, 1.109825, 0, 0.02352941, 1, 1,
0.4634769, -0.2134601, 1.870655, 0, 0.01568628, 1, 1,
0.4649949, 0.06649055, 0.4895407, 0, 0.01176471, 1, 1,
0.4655162, 0.2811401, 1.794453, 0, 0.003921569, 1, 1,
0.4668983, -0.1904194, 2.218943, 0.003921569, 0, 1, 1,
0.4673316, 2.278794, 1.046006, 0.007843138, 0, 1, 1,
0.4701577, -1.315258, 2.103975, 0.01568628, 0, 1, 1,
0.4720423, -0.3357703, 2.416762, 0.01960784, 0, 1, 1,
0.4740365, -0.01212179, 1.170779, 0.02745098, 0, 1, 1,
0.4742929, -0.527409, 2.73318, 0.03137255, 0, 1, 1,
0.474349, 0.3166117, 1.818447, 0.03921569, 0, 1, 1,
0.4755161, 0.5480574, 1.304261, 0.04313726, 0, 1, 1,
0.4791729, 0.6304411, 0.6947042, 0.05098039, 0, 1, 1,
0.4813842, -1.341059, 1.329537, 0.05490196, 0, 1, 1,
0.4842266, -0.3883504, 1.388164, 0.0627451, 0, 1, 1,
0.4872643, -0.07097356, 0.8636683, 0.06666667, 0, 1, 1,
0.4900991, -1.028628, 4.371317, 0.07450981, 0, 1, 1,
0.4998077, -0.3359838, 3.853627, 0.07843138, 0, 1, 1,
0.5031056, 0.2536137, 0.9842575, 0.08627451, 0, 1, 1,
0.510302, -1.428029, 1.800627, 0.09019608, 0, 1, 1,
0.5103726, 1.066087, -0.5633763, 0.09803922, 0, 1, 1,
0.5117409, -0.4306, 4.920422, 0.1058824, 0, 1, 1,
0.5139815, 1.063207, 0.3985698, 0.1098039, 0, 1, 1,
0.5142637, -0.1166066, 1.765095, 0.1176471, 0, 1, 1,
0.5147455, 1.967647, -0.8143652, 0.1215686, 0, 1, 1,
0.5189916, -0.009899456, 2.078876, 0.1294118, 0, 1, 1,
0.5231806, -0.4539238, 2.680034, 0.1333333, 0, 1, 1,
0.5242891, 0.9316018, -0.934648, 0.1411765, 0, 1, 1,
0.5271847, -1.641165, 4.436825, 0.145098, 0, 1, 1,
0.5283114, 0.1032898, 1.181386, 0.1529412, 0, 1, 1,
0.5293633, 0.7075585, 1.794359, 0.1568628, 0, 1, 1,
0.5310537, -0.7305748, 3.162336, 0.1647059, 0, 1, 1,
0.534358, -0.03839152, 1.053626, 0.1686275, 0, 1, 1,
0.5449973, -1.118877, 0.784392, 0.1764706, 0, 1, 1,
0.5488602, -0.8695453, 2.221262, 0.1803922, 0, 1, 1,
0.5531867, 0.9067214, -0.2694657, 0.1882353, 0, 1, 1,
0.5597421, -1.522343, -0.08849994, 0.1921569, 0, 1, 1,
0.5606565, 0.329344, 0.277412, 0.2, 0, 1, 1,
0.5619631, 0.2233661, 0.03192348, 0.2078431, 0, 1, 1,
0.5628869, 0.6664279, -0.9375629, 0.2117647, 0, 1, 1,
0.566736, 1.989312, -0.3986382, 0.2196078, 0, 1, 1,
0.5699795, -0.1132966, 2.101386, 0.2235294, 0, 1, 1,
0.5767177, 0.3500851, 0.2297565, 0.2313726, 0, 1, 1,
0.5776659, 0.2186451, 1.516952, 0.2352941, 0, 1, 1,
0.5854166, -0.09339569, 0.6688256, 0.2431373, 0, 1, 1,
0.5856652, 0.1556851, 2.550091, 0.2470588, 0, 1, 1,
0.5859209, -0.9579269, 2.970497, 0.254902, 0, 1, 1,
0.5870041, -0.5309218, 1.041358, 0.2588235, 0, 1, 1,
0.5954742, 0.02252264, 0.9708986, 0.2666667, 0, 1, 1,
0.596748, 0.8086828, 0.9855438, 0.2705882, 0, 1, 1,
0.5969973, 0.0444934, 2.600721, 0.2784314, 0, 1, 1,
0.5970684, 0.5083184, 1.412725, 0.282353, 0, 1, 1,
0.6000783, 0.3049148, 0.5115758, 0.2901961, 0, 1, 1,
0.6034617, -0.03214126, 1.906424, 0.2941177, 0, 1, 1,
0.6113735, -0.418666, 1.973659, 0.3019608, 0, 1, 1,
0.6123242, 0.3135287, 1.591598, 0.3098039, 0, 1, 1,
0.612731, 0.9159368, 1.048913, 0.3137255, 0, 1, 1,
0.6181784, 0.8254597, 1.895582, 0.3215686, 0, 1, 1,
0.6222387, -1.119262, 3.689396, 0.3254902, 0, 1, 1,
0.6228356, -0.2786068, 0.8957151, 0.3333333, 0, 1, 1,
0.6233009, -0.9339256, 2.108694, 0.3372549, 0, 1, 1,
0.6308206, 0.6483094, 1.399538, 0.345098, 0, 1, 1,
0.6308934, -0.617388, 0.8409868, 0.3490196, 0, 1, 1,
0.631884, 0.8162199, -0.7689443, 0.3568628, 0, 1, 1,
0.6343757, 0.5603637, 0.3582143, 0.3607843, 0, 1, 1,
0.6381298, 0.4373998, 1.671317, 0.3686275, 0, 1, 1,
0.6386622, -1.557411, 2.326138, 0.372549, 0, 1, 1,
0.6451218, 0.2140691, 1.640354, 0.3803922, 0, 1, 1,
0.6458699, 0.5706322, 0.5567306, 0.3843137, 0, 1, 1,
0.6487955, 1.922512, 0.1535404, 0.3921569, 0, 1, 1,
0.6490165, 0.3029878, 1.723595, 0.3960784, 0, 1, 1,
0.6525661, 0.06724452, 0.1890021, 0.4039216, 0, 1, 1,
0.657439, 1.423312, 1.218457, 0.4117647, 0, 1, 1,
0.6591655, 2.146798, 1.57317, 0.4156863, 0, 1, 1,
0.66084, -0.8408966, 2.526144, 0.4235294, 0, 1, 1,
0.6673526, 0.2300411, 0.3393158, 0.427451, 0, 1, 1,
0.6724713, 0.1343192, 0.6125194, 0.4352941, 0, 1, 1,
0.6749973, 0.4257962, 0.8745635, 0.4392157, 0, 1, 1,
0.678492, -3.007039, 0.8030262, 0.4470588, 0, 1, 1,
0.6789799, -2.119729, 1.420562, 0.4509804, 0, 1, 1,
0.680511, -1.12861, 1.341664, 0.4588235, 0, 1, 1,
0.6815416, -1.517748, 2.50474, 0.4627451, 0, 1, 1,
0.6841069, -0.4897521, 2.268731, 0.4705882, 0, 1, 1,
0.6862623, 1.02326, 0.7882549, 0.4745098, 0, 1, 1,
0.68752, -0.01635238, -0.4686176, 0.4823529, 0, 1, 1,
0.6884164, 1.391193, 0.8783601, 0.4862745, 0, 1, 1,
0.6887464, 1.336008, 0.4163328, 0.4941176, 0, 1, 1,
0.6896073, 0.8704029, 1.657231, 0.5019608, 0, 1, 1,
0.6913752, 0.005959242, 1.342386, 0.5058824, 0, 1, 1,
0.69559, 0.7718101, 1.670148, 0.5137255, 0, 1, 1,
0.7018439, 1.457702, -0.8686363, 0.5176471, 0, 1, 1,
0.7030187, 0.06534181, 0.8534474, 0.5254902, 0, 1, 1,
0.7053592, 3.448729, -1.514171, 0.5294118, 0, 1, 1,
0.7121723, 0.993839, 1.288732, 0.5372549, 0, 1, 1,
0.7122693, 1.064097, -1.125801, 0.5411765, 0, 1, 1,
0.7148547, -0.3250689, 1.89649, 0.5490196, 0, 1, 1,
0.7221846, -0.9302775, 4.017402, 0.5529412, 0, 1, 1,
0.7224853, -0.5546619, 1.700955, 0.5607843, 0, 1, 1,
0.7251724, 0.9083318, 1.022687, 0.5647059, 0, 1, 1,
0.7260246, -0.6623389, 2.681418, 0.572549, 0, 1, 1,
0.7316994, 0.4882536, 1.152753, 0.5764706, 0, 1, 1,
0.7317749, 1.007153, 1.684767, 0.5843138, 0, 1, 1,
0.7340329, -0.179058, 2.679176, 0.5882353, 0, 1, 1,
0.7377287, 1.639911, 0.8870584, 0.5960785, 0, 1, 1,
0.7400251, -1.901965, 4.189044, 0.6039216, 0, 1, 1,
0.7468913, -0.8755597, 1.756829, 0.6078432, 0, 1, 1,
0.7582211, 1.169882, 0.5523805, 0.6156863, 0, 1, 1,
0.7585849, -1.084972, 3.586095, 0.6196079, 0, 1, 1,
0.7611986, 0.4416009, 0.8524899, 0.627451, 0, 1, 1,
0.7629595, 0.9779187, 0.3823008, 0.6313726, 0, 1, 1,
0.7669086, -0.1390948, 3.258629, 0.6392157, 0, 1, 1,
0.7740678, 0.6916107, 1.787885, 0.6431373, 0, 1, 1,
0.7795292, 0.3049394, 1.129798, 0.6509804, 0, 1, 1,
0.7807186, -1.037393, 2.889238, 0.654902, 0, 1, 1,
0.783903, 2.296376, 0.0483097, 0.6627451, 0, 1, 1,
0.7874832, 1.425056, 0.9671103, 0.6666667, 0, 1, 1,
0.7910581, -0.8890018, 2.127719, 0.6745098, 0, 1, 1,
0.7916943, 1.560579, -0.8538272, 0.6784314, 0, 1, 1,
0.7931901, -0.1472663, 2.169188, 0.6862745, 0, 1, 1,
0.7936842, 0.2570471, -0.5931566, 0.6901961, 0, 1, 1,
0.8031725, 0.6680469, 0.8401682, 0.6980392, 0, 1, 1,
0.8159192, -0.9514688, 2.490727, 0.7058824, 0, 1, 1,
0.8186709, 1.041897, 1.084178, 0.7098039, 0, 1, 1,
0.8196281, 1.216151, 1.262483, 0.7176471, 0, 1, 1,
0.8196557, -0.3687701, 1.600979, 0.7215686, 0, 1, 1,
0.820257, -0.489193, 3.081566, 0.7294118, 0, 1, 1,
0.8258185, 0.7157072, 0.9345139, 0.7333333, 0, 1, 1,
0.8261227, -0.1090185, 0.7472707, 0.7411765, 0, 1, 1,
0.8284515, 1.866131, -0.9626957, 0.7450981, 0, 1, 1,
0.834817, 1.554249, 0.1626793, 0.7529412, 0, 1, 1,
0.8440074, -1.166781, 1.280633, 0.7568628, 0, 1, 1,
0.8444998, -0.8491921, 1.583444, 0.7647059, 0, 1, 1,
0.8445209, -0.04555457, 1.506559, 0.7686275, 0, 1, 1,
0.845183, -1.706696, 2.830632, 0.7764706, 0, 1, 1,
0.8456786, -1.299895, 2.880446, 0.7803922, 0, 1, 1,
0.8464183, 0.02317509, 2.689791, 0.7882353, 0, 1, 1,
0.8484561, 0.2709818, 1.225564, 0.7921569, 0, 1, 1,
0.8573223, 0.1623556, 1.755982, 0.8, 0, 1, 1,
0.8579669, -1.646735, 2.626561, 0.8078431, 0, 1, 1,
0.8584855, 0.4248081, 1.346204, 0.8117647, 0, 1, 1,
0.8590078, 0.6299781, 0.8444148, 0.8196079, 0, 1, 1,
0.8590399, 1.224071, -0.1572904, 0.8235294, 0, 1, 1,
0.8595513, -0.3024706, 0.4600425, 0.8313726, 0, 1, 1,
0.8635815, -0.7176024, 1.213971, 0.8352941, 0, 1, 1,
0.8648078, 0.1261647, 1.355907, 0.8431373, 0, 1, 1,
0.8663924, 0.1313135, 2.505666, 0.8470588, 0, 1, 1,
0.8718142, 0.5565795, -0.6508345, 0.854902, 0, 1, 1,
0.8774332, -0.8895187, 2.780528, 0.8588235, 0, 1, 1,
0.8809355, -0.9501983, 1.632676, 0.8666667, 0, 1, 1,
0.8901639, -1.098493, 2.605287, 0.8705882, 0, 1, 1,
0.8951036, -0.7069935, 3.462496, 0.8784314, 0, 1, 1,
0.899308, 0.9250643, 1.000576, 0.8823529, 0, 1, 1,
0.9004184, 0.5909368, 1.908883, 0.8901961, 0, 1, 1,
0.9055022, -0.6411121, 1.96937, 0.8941177, 0, 1, 1,
0.9105586, 1.779161, 0.2824299, 0.9019608, 0, 1, 1,
0.9116664, 1.328274, -0.8126249, 0.9098039, 0, 1, 1,
0.9127499, -1.266816, 2.850449, 0.9137255, 0, 1, 1,
0.9151393, -0.5920379, 1.15327, 0.9215686, 0, 1, 1,
0.9208478, 0.7740357, 0.6312879, 0.9254902, 0, 1, 1,
0.9246998, -0.5606756, 1.591444, 0.9333333, 0, 1, 1,
0.928417, -0.334757, 1.420897, 0.9372549, 0, 1, 1,
0.9439021, -1.03516, 2.889109, 0.945098, 0, 1, 1,
0.9519469, -3.097551, 3.469966, 0.9490196, 0, 1, 1,
0.9562975, -0.2263608, 1.220965, 0.9568627, 0, 1, 1,
0.9574528, 0.5067593, 1.642109, 0.9607843, 0, 1, 1,
0.9622754, 1.344522, -0.311089, 0.9686275, 0, 1, 1,
0.964704, -0.4310408, 2.244118, 0.972549, 0, 1, 1,
0.9714418, 1.733415, 1.558241, 0.9803922, 0, 1, 1,
0.9723868, 2.027765, -0.06758753, 0.9843137, 0, 1, 1,
0.9764495, -0.5618474, 2.13691, 0.9921569, 0, 1, 1,
0.9791279, 1.855, 0.0002559659, 0.9960784, 0, 1, 1,
0.9815362, 0.4031015, 0.7716634, 1, 0, 0.9960784, 1,
0.9971312, -2.282127, 1.325459, 1, 0, 0.9882353, 1,
1.003217, 0.9447834, 0.9647777, 1, 0, 0.9843137, 1,
1.012047, 0.3980556, 1.354846, 1, 0, 0.9764706, 1,
1.028822, -0.8350189, 2.636188, 1, 0, 0.972549, 1,
1.036263, 0.07740565, 1.286538, 1, 0, 0.9647059, 1,
1.038457, -0.3623121, 2.125956, 1, 0, 0.9607843, 1,
1.039536, 0.7137831, 3.775335, 1, 0, 0.9529412, 1,
1.03971, -1.213877, 2.254832, 1, 0, 0.9490196, 1,
1.041967, 0.4870129, 0.9418595, 1, 0, 0.9411765, 1,
1.042729, -0.8158587, 3.361015, 1, 0, 0.9372549, 1,
1.045073, 0.9654146, 1.400727, 1, 0, 0.9294118, 1,
1.045523, -0.3088504, 1.254102, 1, 0, 0.9254902, 1,
1.050737, 0.05290899, 1.766615, 1, 0, 0.9176471, 1,
1.051292, -1.161419, 3.308666, 1, 0, 0.9137255, 1,
1.056894, 1.444308, 1.496161, 1, 0, 0.9058824, 1,
1.05931, -0.2996624, 4.658406, 1, 0, 0.9019608, 1,
1.059807, -0.84351, 2.731575, 1, 0, 0.8941177, 1,
1.081331, -0.9357708, 1.478033, 1, 0, 0.8862745, 1,
1.083505, -0.439903, 1.743122, 1, 0, 0.8823529, 1,
1.0926, -0.3607399, 2.816732, 1, 0, 0.8745098, 1,
1.093991, -0.773682, 2.014772, 1, 0, 0.8705882, 1,
1.099723, 1.506815, 0.445445, 1, 0, 0.8627451, 1,
1.104623, -0.08862795, 1.330748, 1, 0, 0.8588235, 1,
1.107838, -1.339, 2.151225, 1, 0, 0.8509804, 1,
1.11859, -0.7468683, 1.631055, 1, 0, 0.8470588, 1,
1.12736, -0.7680231, 1.937849, 1, 0, 0.8392157, 1,
1.127439, -1.034601, 2.532851, 1, 0, 0.8352941, 1,
1.130794, 1.253069, -1.057065, 1, 0, 0.827451, 1,
1.136367, 1.548042, 0.1270457, 1, 0, 0.8235294, 1,
1.136792, 1.4551, 1.198722, 1, 0, 0.8156863, 1,
1.137104, 0.5084676, 0.9260283, 1, 0, 0.8117647, 1,
1.13754, -1.180163, 2.052409, 1, 0, 0.8039216, 1,
1.140578, 0.7333669, 0.536258, 1, 0, 0.7960784, 1,
1.146388, 0.3911416, 0.4926507, 1, 0, 0.7921569, 1,
1.148676, -0.3084546, 2.16695, 1, 0, 0.7843137, 1,
1.151643, 0.3658516, -1.118021, 1, 0, 0.7803922, 1,
1.153219, -0.2117243, 0.7761936, 1, 0, 0.772549, 1,
1.154588, -1.668055, 2.083897, 1, 0, 0.7686275, 1,
1.184826, 0.6117741, 2.018052, 1, 0, 0.7607843, 1,
1.196346, -1.431168, 1.987405, 1, 0, 0.7568628, 1,
1.19981, 0.4776466, -0.1627133, 1, 0, 0.7490196, 1,
1.20134, -0.1213709, 2.823546, 1, 0, 0.7450981, 1,
1.206314, -0.7778796, 2.605139, 1, 0, 0.7372549, 1,
1.207622, -0.02293156, 1.119319, 1, 0, 0.7333333, 1,
1.219217, 1.436989, 0.6653299, 1, 0, 0.7254902, 1,
1.220357, 0.6829476, 2.079776, 1, 0, 0.7215686, 1,
1.230123, -0.433844, 3.204319, 1, 0, 0.7137255, 1,
1.23438, 1.073023, 1.418638, 1, 0, 0.7098039, 1,
1.237151, 1.074324, 1.081977, 1, 0, 0.7019608, 1,
1.256788, 0.963276, -0.09714604, 1, 0, 0.6941177, 1,
1.265528, -0.06666403, 0.1973312, 1, 0, 0.6901961, 1,
1.269874, 0.7107613, 0.6609098, 1, 0, 0.682353, 1,
1.282087, 1.204025, 1.145878, 1, 0, 0.6784314, 1,
1.282337, 2.260005, -0.2229874, 1, 0, 0.6705883, 1,
1.286526, -0.7400103, -0.1756125, 1, 0, 0.6666667, 1,
1.291219, 1.085575, 1.727426, 1, 0, 0.6588235, 1,
1.296313, 0.08305095, 2.728017, 1, 0, 0.654902, 1,
1.307413, 0.1624819, 0.2884253, 1, 0, 0.6470588, 1,
1.310215, -1.280249, 2.379822, 1, 0, 0.6431373, 1,
1.321527, -1.032915, 2.062546, 1, 0, 0.6352941, 1,
1.323473, -0.7188733, 1.85757, 1, 0, 0.6313726, 1,
1.325095, -0.4650162, 2.192818, 1, 0, 0.6235294, 1,
1.325703, 0.4781034, 1.296691, 1, 0, 0.6196079, 1,
1.333912, 0.7103794, 1.172013, 1, 0, 0.6117647, 1,
1.334614, 1.820936, -0.3564815, 1, 0, 0.6078432, 1,
1.335549, -1.593113, 2.444018, 1, 0, 0.6, 1,
1.344493, -0.8419999, 2.982847, 1, 0, 0.5921569, 1,
1.34526, -1.052667, 2.321214, 1, 0, 0.5882353, 1,
1.347033, -0.2555614, 3.021572, 1, 0, 0.5803922, 1,
1.355136, 0.3524178, 2.052433, 1, 0, 0.5764706, 1,
1.369794, 1.081219, 3.234907, 1, 0, 0.5686275, 1,
1.371387, 0.577003, 1.449084, 1, 0, 0.5647059, 1,
1.375833, -0.8470345, 3.647452, 1, 0, 0.5568628, 1,
1.381163, 0.4423719, 0.4323266, 1, 0, 0.5529412, 1,
1.38613, 1.042474, 1.622903, 1, 0, 0.5450981, 1,
1.393975, 0.04180358, 0.766557, 1, 0, 0.5411765, 1,
1.396686, -0.7357698, 3.125762, 1, 0, 0.5333334, 1,
1.397127, 0.241956, 1.574766, 1, 0, 0.5294118, 1,
1.410401, 1.603574, 0.9209964, 1, 0, 0.5215687, 1,
1.416599, 0.4773968, 1.591496, 1, 0, 0.5176471, 1,
1.41767, -1.084665, 3.081839, 1, 0, 0.509804, 1,
1.423712, 1.165918, 1.056277, 1, 0, 0.5058824, 1,
1.424847, -1.854617, 2.409099, 1, 0, 0.4980392, 1,
1.446732, -1.492256, 0.6731872, 1, 0, 0.4901961, 1,
1.451476, -0.2266594, 1.278575, 1, 0, 0.4862745, 1,
1.451701, 0.8555197, 2.766177, 1, 0, 0.4784314, 1,
1.452121, 0.6254064, 1.306517, 1, 0, 0.4745098, 1,
1.452866, 1.489828, -0.4517408, 1, 0, 0.4666667, 1,
1.460265, 0.8998789, -0.3621206, 1, 0, 0.4627451, 1,
1.473058, -0.02262761, 1.566242, 1, 0, 0.454902, 1,
1.474645, -0.09853213, 1.217845, 1, 0, 0.4509804, 1,
1.483194, -0.03484641, 2.871897, 1, 0, 0.4431373, 1,
1.496687, 0.7633609, 1.539521, 1, 0, 0.4392157, 1,
1.497091, -1.490327, 1.924277, 1, 0, 0.4313726, 1,
1.518859, -0.2255688, 1.621359, 1, 0, 0.427451, 1,
1.520041, 0.8201329, 1.958421, 1, 0, 0.4196078, 1,
1.526301, 0.09291258, 0.4249807, 1, 0, 0.4156863, 1,
1.54512, 0.6201819, 2.103665, 1, 0, 0.4078431, 1,
1.545282, -0.03784077, 0.9009444, 1, 0, 0.4039216, 1,
1.556891, 0.07092815, 0.9983588, 1, 0, 0.3960784, 1,
1.561275, 0.2768006, 0.8579748, 1, 0, 0.3882353, 1,
1.562074, -1.343819, 1.08341, 1, 0, 0.3843137, 1,
1.565086, -0.6909999, 2.588084, 1, 0, 0.3764706, 1,
1.57656, 0.5334901, 0.5542738, 1, 0, 0.372549, 1,
1.58925, 0.9994955, 0.727182, 1, 0, 0.3647059, 1,
1.592851, 0.1796338, 1.860138, 1, 0, 0.3607843, 1,
1.5956, -1.456728, 0.283365, 1, 0, 0.3529412, 1,
1.59717, -0.1802593, 0.8308367, 1, 0, 0.3490196, 1,
1.597924, -0.5188562, 1.042375, 1, 0, 0.3411765, 1,
1.605, -0.4800768, 0.3033523, 1, 0, 0.3372549, 1,
1.605457, 1.466689, 0.9482689, 1, 0, 0.3294118, 1,
1.612983, 0.3174033, 1.268388, 1, 0, 0.3254902, 1,
1.6275, -0.6998281, 2.578343, 1, 0, 0.3176471, 1,
1.639914, 1.323269, 1.37025, 1, 0, 0.3137255, 1,
1.650758, 0.8902853, 0.7821496, 1, 0, 0.3058824, 1,
1.655784, -0.8584456, 2.485168, 1, 0, 0.2980392, 1,
1.65911, 0.5967631, 1.759475, 1, 0, 0.2941177, 1,
1.675264, 0.459269, 3.015557, 1, 0, 0.2862745, 1,
1.676673, 0.5155714, 2.976589, 1, 0, 0.282353, 1,
1.684576, 0.1386977, 1.488208, 1, 0, 0.2745098, 1,
1.688346, 1.397831, 1.42717, 1, 0, 0.2705882, 1,
1.694558, 0.8359425, 0.3017597, 1, 0, 0.2627451, 1,
1.720991, -0.02205623, 1.124537, 1, 0, 0.2588235, 1,
1.723691, -1.870671, 3.129649, 1, 0, 0.2509804, 1,
1.755843, -0.2167308, 4.496063, 1, 0, 0.2470588, 1,
1.758377, -0.1645218, 1.487937, 1, 0, 0.2392157, 1,
1.758776, -1.043698, 1.940904, 1, 0, 0.2352941, 1,
1.785199, -0.04109811, 0.6746511, 1, 0, 0.227451, 1,
1.818286, -1.403249, 2.032411, 1, 0, 0.2235294, 1,
1.819264, 0.4830723, 1.694808, 1, 0, 0.2156863, 1,
1.822635, 1.341052, 2.096324, 1, 0, 0.2117647, 1,
1.826795, 0.3546543, 2.580998, 1, 0, 0.2039216, 1,
1.84202, -0.4432164, 2.423709, 1, 0, 0.1960784, 1,
1.8817, -0.688428, 2.233521, 1, 0, 0.1921569, 1,
1.915704, -0.8298499, 2.028088, 1, 0, 0.1843137, 1,
1.921264, 0.02383267, 0.8020492, 1, 0, 0.1803922, 1,
1.929757, 0.6618912, 0.6803114, 1, 0, 0.172549, 1,
1.936473, 0.2775681, 3.102535, 1, 0, 0.1686275, 1,
1.959894, 1.047087, 1.888374, 1, 0, 0.1607843, 1,
1.990235, 0.1522835, 2.309989, 1, 0, 0.1568628, 1,
2.005105, -1.537116, 2.961779, 1, 0, 0.1490196, 1,
2.015736, -0.563968, 3.1329, 1, 0, 0.145098, 1,
2.02851, -1.338336, 2.827677, 1, 0, 0.1372549, 1,
2.046308, 0.6241462, -0.09989682, 1, 0, 0.1333333, 1,
2.058951, -1.14231, 2.724403, 1, 0, 0.1254902, 1,
2.115186, -0.80007, 2.543034, 1, 0, 0.1215686, 1,
2.139808, -0.1715203, 2.006104, 1, 0, 0.1137255, 1,
2.141345, -0.04884975, 1.973498, 1, 0, 0.1098039, 1,
2.186807, 0.9131683, 1.67933, 1, 0, 0.1019608, 1,
2.194289, -0.38046, 3.141542, 1, 0, 0.09411765, 1,
2.195557, -0.1160398, 1.475477, 1, 0, 0.09019608, 1,
2.201467, 1.114746, 1.499681, 1, 0, 0.08235294, 1,
2.23295, 0.7024459, 3.260258, 1, 0, 0.07843138, 1,
2.319603, 1.048462, 1.177064, 1, 0, 0.07058824, 1,
2.351193, -0.3036739, 0.8801976, 1, 0, 0.06666667, 1,
2.506241, 0.3004321, 2.645561, 1, 0, 0.05882353, 1,
2.51337, -0.8531786, 2.187293, 1, 0, 0.05490196, 1,
2.527914, -0.09662914, 1.621707, 1, 0, 0.04705882, 1,
2.544524, 1.030818, 2.859792, 1, 0, 0.04313726, 1,
2.780697, -0.03401376, 1.04338, 1, 0, 0.03529412, 1,
2.86773, 2.151017, 0.1948326, 1, 0, 0.03137255, 1,
2.937491, 0.08469079, 0.5218117, 1, 0, 0.02352941, 1,
2.996908, -0.9211402, 2.962792, 1, 0, 0.01960784, 1,
3.159451, 0.7259587, 1.093589, 1, 0, 0.01176471, 1,
3.436073, -2.862888, 4.658779, 1, 0, 0.007843138, 1
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
0.1944156, -4.207145, -7.808782, 0, -0.5, 0.5, 0.5,
0.1944156, -4.207145, -7.808782, 1, -0.5, 0.5, 0.5,
0.1944156, -4.207145, -7.808782, 1, 1.5, 0.5, 0.5,
0.1944156, -4.207145, -7.808782, 0, 1.5, 0.5, 0.5
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
-4.146164, 0.175589, -7.808782, 0, -0.5, 0.5, 0.5,
-4.146164, 0.175589, -7.808782, 1, -0.5, 0.5, 0.5,
-4.146164, 0.175589, -7.808782, 1, 1.5, 0.5, 0.5,
-4.146164, 0.175589, -7.808782, 0, 1.5, 0.5, 0.5
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
-4.146164, -4.207145, -0.1767561, 0, -0.5, 0.5, 0.5,
-4.146164, -4.207145, -0.1767561, 1, -0.5, 0.5, 0.5,
-4.146164, -4.207145, -0.1767561, 1, 1.5, 0.5, 0.5,
-4.146164, -4.207145, -0.1767561, 0, 1.5, 0.5, 0.5
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
-3, -3.195745, -6.047545,
3, -3.195745, -6.047545,
-3, -3.195745, -6.047545,
-3, -3.364311, -6.341084,
-2, -3.195745, -6.047545,
-2, -3.364311, -6.341084,
-1, -3.195745, -6.047545,
-1, -3.364311, -6.341084,
0, -3.195745, -6.047545,
0, -3.364311, -6.341084,
1, -3.195745, -6.047545,
1, -3.364311, -6.341084,
2, -3.195745, -6.047545,
2, -3.364311, -6.341084,
3, -3.195745, -6.047545,
3, -3.364311, -6.341084
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
-3, -3.701445, -6.928164, 0, -0.5, 0.5, 0.5,
-3, -3.701445, -6.928164, 1, -0.5, 0.5, 0.5,
-3, -3.701445, -6.928164, 1, 1.5, 0.5, 0.5,
-3, -3.701445, -6.928164, 0, 1.5, 0.5, 0.5,
-2, -3.701445, -6.928164, 0, -0.5, 0.5, 0.5,
-2, -3.701445, -6.928164, 1, -0.5, 0.5, 0.5,
-2, -3.701445, -6.928164, 1, 1.5, 0.5, 0.5,
-2, -3.701445, -6.928164, 0, 1.5, 0.5, 0.5,
-1, -3.701445, -6.928164, 0, -0.5, 0.5, 0.5,
-1, -3.701445, -6.928164, 1, -0.5, 0.5, 0.5,
-1, -3.701445, -6.928164, 1, 1.5, 0.5, 0.5,
-1, -3.701445, -6.928164, 0, 1.5, 0.5, 0.5,
0, -3.701445, -6.928164, 0, -0.5, 0.5, 0.5,
0, -3.701445, -6.928164, 1, -0.5, 0.5, 0.5,
0, -3.701445, -6.928164, 1, 1.5, 0.5, 0.5,
0, -3.701445, -6.928164, 0, 1.5, 0.5, 0.5,
1, -3.701445, -6.928164, 0, -0.5, 0.5, 0.5,
1, -3.701445, -6.928164, 1, -0.5, 0.5, 0.5,
1, -3.701445, -6.928164, 1, 1.5, 0.5, 0.5,
1, -3.701445, -6.928164, 0, 1.5, 0.5, 0.5,
2, -3.701445, -6.928164, 0, -0.5, 0.5, 0.5,
2, -3.701445, -6.928164, 1, -0.5, 0.5, 0.5,
2, -3.701445, -6.928164, 1, 1.5, 0.5, 0.5,
2, -3.701445, -6.928164, 0, 1.5, 0.5, 0.5,
3, -3.701445, -6.928164, 0, -0.5, 0.5, 0.5,
3, -3.701445, -6.928164, 1, -0.5, 0.5, 0.5,
3, -3.701445, -6.928164, 1, 1.5, 0.5, 0.5,
3, -3.701445, -6.928164, 0, 1.5, 0.5, 0.5
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
-3.144492, -3, -6.047545,
-3.144492, 3, -6.047545,
-3.144492, -3, -6.047545,
-3.311437, -3, -6.341084,
-3.144492, -2, -6.047545,
-3.311437, -2, -6.341084,
-3.144492, -1, -6.047545,
-3.311437, -1, -6.341084,
-3.144492, 0, -6.047545,
-3.311437, 0, -6.341084,
-3.144492, 1, -6.047545,
-3.311437, 1, -6.341084,
-3.144492, 2, -6.047545,
-3.311437, 2, -6.341084,
-3.144492, 3, -6.047545,
-3.311437, 3, -6.341084
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
-3.645328, -3, -6.928164, 0, -0.5, 0.5, 0.5,
-3.645328, -3, -6.928164, 1, -0.5, 0.5, 0.5,
-3.645328, -3, -6.928164, 1, 1.5, 0.5, 0.5,
-3.645328, -3, -6.928164, 0, 1.5, 0.5, 0.5,
-3.645328, -2, -6.928164, 0, -0.5, 0.5, 0.5,
-3.645328, -2, -6.928164, 1, -0.5, 0.5, 0.5,
-3.645328, -2, -6.928164, 1, 1.5, 0.5, 0.5,
-3.645328, -2, -6.928164, 0, 1.5, 0.5, 0.5,
-3.645328, -1, -6.928164, 0, -0.5, 0.5, 0.5,
-3.645328, -1, -6.928164, 1, -0.5, 0.5, 0.5,
-3.645328, -1, -6.928164, 1, 1.5, 0.5, 0.5,
-3.645328, -1, -6.928164, 0, 1.5, 0.5, 0.5,
-3.645328, 0, -6.928164, 0, -0.5, 0.5, 0.5,
-3.645328, 0, -6.928164, 1, -0.5, 0.5, 0.5,
-3.645328, 0, -6.928164, 1, 1.5, 0.5, 0.5,
-3.645328, 0, -6.928164, 0, 1.5, 0.5, 0.5,
-3.645328, 1, -6.928164, 0, -0.5, 0.5, 0.5,
-3.645328, 1, -6.928164, 1, -0.5, 0.5, 0.5,
-3.645328, 1, -6.928164, 1, 1.5, 0.5, 0.5,
-3.645328, 1, -6.928164, 0, 1.5, 0.5, 0.5,
-3.645328, 2, -6.928164, 0, -0.5, 0.5, 0.5,
-3.645328, 2, -6.928164, 1, -0.5, 0.5, 0.5,
-3.645328, 2, -6.928164, 1, 1.5, 0.5, 0.5,
-3.645328, 2, -6.928164, 0, 1.5, 0.5, 0.5,
-3.645328, 3, -6.928164, 0, -0.5, 0.5, 0.5,
-3.645328, 3, -6.928164, 1, -0.5, 0.5, 0.5,
-3.645328, 3, -6.928164, 1, 1.5, 0.5, 0.5,
-3.645328, 3, -6.928164, 0, 1.5, 0.5, 0.5
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
-3.144492, -3.195745, -4,
-3.144492, -3.195745, 4,
-3.144492, -3.195745, -4,
-3.311437, -3.364311, -4,
-3.144492, -3.195745, -2,
-3.311437, -3.364311, -2,
-3.144492, -3.195745, 0,
-3.311437, -3.364311, 0,
-3.144492, -3.195745, 2,
-3.311437, -3.364311, 2,
-3.144492, -3.195745, 4,
-3.311437, -3.364311, 4
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
-3.645328, -3.701445, -4, 0, -0.5, 0.5, 0.5,
-3.645328, -3.701445, -4, 1, -0.5, 0.5, 0.5,
-3.645328, -3.701445, -4, 1, 1.5, 0.5, 0.5,
-3.645328, -3.701445, -4, 0, 1.5, 0.5, 0.5,
-3.645328, -3.701445, -2, 0, -0.5, 0.5, 0.5,
-3.645328, -3.701445, -2, 1, -0.5, 0.5, 0.5,
-3.645328, -3.701445, -2, 1, 1.5, 0.5, 0.5,
-3.645328, -3.701445, -2, 0, 1.5, 0.5, 0.5,
-3.645328, -3.701445, 0, 0, -0.5, 0.5, 0.5,
-3.645328, -3.701445, 0, 1, -0.5, 0.5, 0.5,
-3.645328, -3.701445, 0, 1, 1.5, 0.5, 0.5,
-3.645328, -3.701445, 0, 0, 1.5, 0.5, 0.5,
-3.645328, -3.701445, 2, 0, -0.5, 0.5, 0.5,
-3.645328, -3.701445, 2, 1, -0.5, 0.5, 0.5,
-3.645328, -3.701445, 2, 1, 1.5, 0.5, 0.5,
-3.645328, -3.701445, 2, 0, 1.5, 0.5, 0.5,
-3.645328, -3.701445, 4, 0, -0.5, 0.5, 0.5,
-3.645328, -3.701445, 4, 1, -0.5, 0.5, 0.5,
-3.645328, -3.701445, 4, 1, 1.5, 0.5, 0.5,
-3.645328, -3.701445, 4, 0, 1.5, 0.5, 0.5
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
-3.144492, -3.195745, -6.047545,
-3.144492, 3.546923, -6.047545,
-3.144492, -3.195745, 5.694033,
-3.144492, 3.546923, 5.694033,
-3.144492, -3.195745, -6.047545,
-3.144492, -3.195745, 5.694033,
-3.144492, 3.546923, -6.047545,
-3.144492, 3.546923, 5.694033,
-3.144492, -3.195745, -6.047545,
3.533323, -3.195745, -6.047545,
-3.144492, -3.195745, 5.694033,
3.533323, -3.195745, 5.694033,
-3.144492, 3.546923, -6.047545,
3.533323, 3.546923, -6.047545,
-3.144492, 3.546923, 5.694033,
3.533323, 3.546923, 5.694033,
3.533323, -3.195745, -6.047545,
3.533323, 3.546923, -6.047545,
3.533323, -3.195745, 5.694033,
3.533323, 3.546923, 5.694033,
3.533323, -3.195745, -6.047545,
3.533323, -3.195745, 5.694033,
3.533323, 3.546923, -6.047545,
3.533323, 3.546923, 5.694033
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
var radius = 8.061541;
var distance = 35.86671;
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
mvMatrix.translate( -0.1944156, -0.175589, 0.1767561 );
mvMatrix.scale( 1.305262, 1.292707, 0.7423445 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.86671);
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
DSM<-read.table("DSM.xyz", skip=1)
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
-3.047242, -1.316988, -1.252323, 0, 0, 1, 1, 1,
-2.86363, 0.1247374, -2.492481, 1, 0, 0, 1, 1,
-2.518154, -1.171744, -1.27505, 1, 0, 0, 1, 1,
-2.489519, 1.893989, -0.01252712, 1, 0, 0, 1, 1,
-2.486275, 1.277285, -0.6308002, 1, 0, 0, 1, 1,
-2.413662, 1.950099, -0.6901884, 1, 0, 0, 1, 1,
-2.377185, 2.495846, -0.3019909, 0, 0, 0, 1, 1,
-2.292441, -0.5073504, -2.854802, 0, 0, 0, 1, 1,
-2.284693, -1.320283, -1.333203, 0, 0, 0, 1, 1,
-2.283707, -0.3971486, -3.653451, 0, 0, 0, 1, 1,
-2.278713, 0.216582, -2.467251, 0, 0, 0, 1, 1,
-2.269321, 1.55668, -0.01415334, 0, 0, 0, 1, 1,
-2.235483, -0.3407207, -0.06399751, 0, 0, 0, 1, 1,
-2.187203, 1.76083, -2.039096, 1, 1, 1, 1, 1,
-2.183746, 1.926904, -0.03214038, 1, 1, 1, 1, 1,
-2.141208, -1.528221, -3.73073, 1, 1, 1, 1, 1,
-2.136683, 0.3101594, -0.1183125, 1, 1, 1, 1, 1,
-2.103836, 1.291665, -2.815578, 1, 1, 1, 1, 1,
-2.07693, -0.7479848, -2.421352, 1, 1, 1, 1, 1,
-2.004776, -1.69542, -1.045074, 1, 1, 1, 1, 1,
-1.992012, 0.1296791, -2.054985, 1, 1, 1, 1, 1,
-1.990661, 1.307392, -1.104741, 1, 1, 1, 1, 1,
-1.986058, 0.9111951, -1.00827, 1, 1, 1, 1, 1,
-1.982899, 2.593194, -1.525014, 1, 1, 1, 1, 1,
-1.978438, 0.9794664, -1.294937, 1, 1, 1, 1, 1,
-1.93497, 0.8154933, -1.916632, 1, 1, 1, 1, 1,
-1.887878, 0.3539958, -2.432512, 1, 1, 1, 1, 1,
-1.887872, -0.453503, -2.263566, 1, 1, 1, 1, 1,
-1.870159, 1.025842, 0.5755793, 0, 0, 1, 1, 1,
-1.867727, 0.9292533, -1.703028, 1, 0, 0, 1, 1,
-1.862909, 1.192098, -1.703582, 1, 0, 0, 1, 1,
-1.857458, 0.03223481, -1.065258, 1, 0, 0, 1, 1,
-1.847573, -0.7361678, -1.905499, 1, 0, 0, 1, 1,
-1.818457, 1.495812, -1.508587, 1, 0, 0, 1, 1,
-1.817325, -2.282146, -3.821763, 0, 0, 0, 1, 1,
-1.815974, 0.05541773, -1.653917, 0, 0, 0, 1, 1,
-1.814637, 0.7645988, -2.435685, 0, 0, 0, 1, 1,
-1.812554, -0.1717508, 0.3596231, 0, 0, 0, 1, 1,
-1.797808, -0.9481647, -2.630772, 0, 0, 0, 1, 1,
-1.781626, -0.1478077, 1.309312, 0, 0, 0, 1, 1,
-1.769333, -1.258932, -3.984761, 0, 0, 0, 1, 1,
-1.75643, -0.04723548, -0.4952576, 1, 1, 1, 1, 1,
-1.737404, -0.3384548, -2.503332, 1, 1, 1, 1, 1,
-1.730507, -0.4045591, -1.136454, 1, 1, 1, 1, 1,
-1.719851, -0.2246723, -1.736019, 1, 1, 1, 1, 1,
-1.719279, -1.23578, 0.06917562, 1, 1, 1, 1, 1,
-1.710423, 1.151587, -1.500851, 1, 1, 1, 1, 1,
-1.674206, -1.213708, -2.174265, 1, 1, 1, 1, 1,
-1.648132, -0.8544003, -2.168898, 1, 1, 1, 1, 1,
-1.645229, -0.6387378, -3.777414, 1, 1, 1, 1, 1,
-1.628394, 0.2472058, -1.349005, 1, 1, 1, 1, 1,
-1.628115, -0.3913954, -0.8783107, 1, 1, 1, 1, 1,
-1.618532, -2.031951, -2.786957, 1, 1, 1, 1, 1,
-1.618097, -0.07741033, -1.051995, 1, 1, 1, 1, 1,
-1.610836, 1.208501, -0.1996966, 1, 1, 1, 1, 1,
-1.603181, 1.189629, -0.37024, 1, 1, 1, 1, 1,
-1.60215, -0.6605774, -1.983601, 0, 0, 1, 1, 1,
-1.598545, -0.2502061, -1.273947, 1, 0, 0, 1, 1,
-1.587097, -0.4623906, -1.828433, 1, 0, 0, 1, 1,
-1.573364, -0.04045268, -1.87229, 1, 0, 0, 1, 1,
-1.55899, 0.2166655, -1.269877, 1, 0, 0, 1, 1,
-1.557659, -1.735879, -3.019121, 1, 0, 0, 1, 1,
-1.552341, 0.1544185, -1.444297, 0, 0, 0, 1, 1,
-1.537292, 1.711738, -2.351846, 0, 0, 0, 1, 1,
-1.536113, -0.6142597, -2.038987, 0, 0, 0, 1, 1,
-1.53569, 1.935374, -1.196276, 0, 0, 0, 1, 1,
-1.535357, 1.824004, 0.8696648, 0, 0, 0, 1, 1,
-1.526426, -0.8823979, -1.830581, 0, 0, 0, 1, 1,
-1.526303, -0.4741361, -2.570727, 0, 0, 0, 1, 1,
-1.500148, -0.8732056, -1.8068, 1, 1, 1, 1, 1,
-1.489543, -0.1202529, -1.776165, 1, 1, 1, 1, 1,
-1.486531, -0.3988802, -3.623926, 1, 1, 1, 1, 1,
-1.471976, -0.8763311, -2.19249, 1, 1, 1, 1, 1,
-1.46719, 0.4095847, -0.7440842, 1, 1, 1, 1, 1,
-1.465456, 2.225154, -1.356458, 1, 1, 1, 1, 1,
-1.458741, -0.1110376, -1.446983, 1, 1, 1, 1, 1,
-1.457328, 0.7633351, -2.764593, 1, 1, 1, 1, 1,
-1.452249, -0.2986491, -3.111734, 1, 1, 1, 1, 1,
-1.451438, 0.4698726, -0.9460043, 1, 1, 1, 1, 1,
-1.445023, 0.534009, -0.5712907, 1, 1, 1, 1, 1,
-1.437567, -2.516046, -1.634552, 1, 1, 1, 1, 1,
-1.433434, -0.5126271, -3.546635, 1, 1, 1, 1, 1,
-1.427068, -1.084293, -1.153119, 1, 1, 1, 1, 1,
-1.421418, -0.7107911, -2.016034, 1, 1, 1, 1, 1,
-1.4127, -0.008428765, -1.302985, 0, 0, 1, 1, 1,
-1.411511, 1.753913, -1.474145, 1, 0, 0, 1, 1,
-1.410541, -0.7724763, -2.792941, 1, 0, 0, 1, 1,
-1.402343, -0.01258884, -2.55355, 1, 0, 0, 1, 1,
-1.391894, -0.7292125, -2.094922, 1, 0, 0, 1, 1,
-1.389362, -0.1405941, -0.4429945, 1, 0, 0, 1, 1,
-1.386538, 1.700802, -0.06256069, 0, 0, 0, 1, 1,
-1.385214, -1.154794, -1.815987, 0, 0, 0, 1, 1,
-1.380766, -0.6921703, -2.236008, 0, 0, 0, 1, 1,
-1.379136, -1.008213, -2.404462, 0, 0, 0, 1, 1,
-1.373223, -0.5888031, -3.249049, 0, 0, 0, 1, 1,
-1.361611, -0.207173, -2.66569, 0, 0, 0, 1, 1,
-1.354195, -2.97119, -2.315381, 0, 0, 0, 1, 1,
-1.353292, -2.144321, -2.146346, 1, 1, 1, 1, 1,
-1.35175, -0.04468978, -3.635886, 1, 1, 1, 1, 1,
-1.346689, 1.323668, 0.3411408, 1, 1, 1, 1, 1,
-1.346292, 0.2745577, -1.656647, 1, 1, 1, 1, 1,
-1.343463, 1.216159, -0.773868, 1, 1, 1, 1, 1,
-1.339465, 2.253941, -0.9789315, 1, 1, 1, 1, 1,
-1.33752, 0.8874109, -0.6170485, 1, 1, 1, 1, 1,
-1.325457, -1.397794, -2.186502, 1, 1, 1, 1, 1,
-1.313398, -0.4693559, -1.94457, 1, 1, 1, 1, 1,
-1.313273, 0.9309864, -0.9320903, 1, 1, 1, 1, 1,
-1.303833, -1.199934, -3.80682, 1, 1, 1, 1, 1,
-1.3, -0.4861508, -2.23085, 1, 1, 1, 1, 1,
-1.298715, -0.1948088, -1.51971, 1, 1, 1, 1, 1,
-1.288213, -1.46581, -1.799315, 1, 1, 1, 1, 1,
-1.283692, 0.8032756, -1.123282, 1, 1, 1, 1, 1,
-1.277473, 0.5169352, -2.383017, 0, 0, 1, 1, 1,
-1.267854, 1.770616, -0.0001957755, 1, 0, 0, 1, 1,
-1.26768, -0.4331095, -2.71394, 1, 0, 0, 1, 1,
-1.263986, 0.799069, -1.797837, 1, 0, 0, 1, 1,
-1.260676, -0.9244981, -0.907841, 1, 0, 0, 1, 1,
-1.248994, 0.951613, -1.57364, 1, 0, 0, 1, 1,
-1.244556, -0.1495432, -0.4027234, 0, 0, 0, 1, 1,
-1.233483, 0.04593254, -2.459673, 0, 0, 0, 1, 1,
-1.231457, 0.5042688, -0.944372, 0, 0, 0, 1, 1,
-1.225639, -0.21308, -3.00919, 0, 0, 0, 1, 1,
-1.211405, -0.3071125, -2.000108, 0, 0, 0, 1, 1,
-1.209306, -0.5607594, -1.72026, 0, 0, 0, 1, 1,
-1.20885, -0.5648175, -0.896466, 0, 0, 0, 1, 1,
-1.206696, 1.840984, 0.4577522, 1, 1, 1, 1, 1,
-1.197881, -0.6796722, -2.099073, 1, 1, 1, 1, 1,
-1.196953, 1.02728, -1.542217, 1, 1, 1, 1, 1,
-1.185906, -2.165277, -1.948111, 1, 1, 1, 1, 1,
-1.184088, 0.872879, -1.434033, 1, 1, 1, 1, 1,
-1.167899, 0.1423477, -2.301059, 1, 1, 1, 1, 1,
-1.15248, 0.6173445, -1.10981, 1, 1, 1, 1, 1,
-1.151205, 0.8707345, -1.04995, 1, 1, 1, 1, 1,
-1.149757, 0.1164517, -1.716174, 1, 1, 1, 1, 1,
-1.149389, 1.011578, -1.17587, 1, 1, 1, 1, 1,
-1.144392, 0.3627853, -1.069686, 1, 1, 1, 1, 1,
-1.14275, 1.784449, -2.139184, 1, 1, 1, 1, 1,
-1.138966, -0.02510662, -1.886927, 1, 1, 1, 1, 1,
-1.133513, 2.509641, -0.7063776, 1, 1, 1, 1, 1,
-1.130836, 1.21546, -1.635045, 1, 1, 1, 1, 1,
-1.126513, -0.5285803, -1.921451, 0, 0, 1, 1, 1,
-1.124289, -0.3333332, -1.188889, 1, 0, 0, 1, 1,
-1.123411, -1.245451, -2.220642, 1, 0, 0, 1, 1,
-1.118093, -0.7230817, -2.420799, 1, 0, 0, 1, 1,
-1.100119, -0.5581325, -1.899748, 1, 0, 0, 1, 1,
-1.099844, -0.4039336, -1.018434, 1, 0, 0, 1, 1,
-1.093119, 0.6037064, -1.266187, 0, 0, 0, 1, 1,
-1.091552, 0.5061299, -0.07692062, 0, 0, 0, 1, 1,
-1.08788, 1.685358, -0.9659661, 0, 0, 0, 1, 1,
-1.087213, -0.5928069, -1.797974, 0, 0, 0, 1, 1,
-1.085203, -1.217553, -2.496158, 0, 0, 0, 1, 1,
-1.08464, 0.007876529, -2.359183, 0, 0, 0, 1, 1,
-1.080495, -1.752884, -2.472774, 0, 0, 0, 1, 1,
-1.079323, -1.294436, -4.693914, 1, 1, 1, 1, 1,
-1.074042, -1.505971, -4.023632, 1, 1, 1, 1, 1,
-1.072286, -1.270451, -1.052711, 1, 1, 1, 1, 1,
-1.071417, -0.2266792, -1.450344, 1, 1, 1, 1, 1,
-1.069368, 0.2656855, -1.441798, 1, 1, 1, 1, 1,
-1.068387, 0.8593562, -0.5226271, 1, 1, 1, 1, 1,
-1.063543, 1.010498, -0.8897196, 1, 1, 1, 1, 1,
-1.059994, -0.7160198, -1.998319, 1, 1, 1, 1, 1,
-1.051348, 0.7603962, -1.39867, 1, 1, 1, 1, 1,
-1.049795, 0.4339077, -0.2628628, 1, 1, 1, 1, 1,
-1.03924, 0.2546844, -0.2452856, 1, 1, 1, 1, 1,
-1.022227, 0.1856157, 0.1070291, 1, 1, 1, 1, 1,
-1.018953, 0.9508768, -0.873512, 1, 1, 1, 1, 1,
-1.009583, 0.2185877, -2.02884, 1, 1, 1, 1, 1,
-1.003534, -0.1572436, -1.043659, 1, 1, 1, 1, 1,
-1.003349, -0.6551065, -2.997062, 0, 0, 1, 1, 1,
-0.9938276, 0.2873849, -0.8100115, 1, 0, 0, 1, 1,
-0.9936529, 0.6525906, -1.496119, 1, 0, 0, 1, 1,
-0.9916433, -0.3169812, -1.726155, 1, 0, 0, 1, 1,
-0.9855635, 2.021855, 1.2269, 1, 0, 0, 1, 1,
-0.9775028, -1.137772, -2.74492, 1, 0, 0, 1, 1,
-0.9624417, 0.4894499, -1.232872, 0, 0, 0, 1, 1,
-0.9560364, -1.463151, -2.674823, 0, 0, 0, 1, 1,
-0.95481, 2.236512, -0.03016387, 0, 0, 0, 1, 1,
-0.9480731, 0.5622209, -0.3386996, 0, 0, 0, 1, 1,
-0.942404, 1.461561, -0.8767036, 0, 0, 0, 1, 1,
-0.9398614, 0.5344681, -1.576326, 0, 0, 0, 1, 1,
-0.9353752, 2.392616, -0.08159397, 0, 0, 0, 1, 1,
-0.9326611, -1.127249, -2.918017, 1, 1, 1, 1, 1,
-0.9295844, 0.7055619, -0.6359013, 1, 1, 1, 1, 1,
-0.9293217, 0.96391, -1.040827, 1, 1, 1, 1, 1,
-0.9287764, -1.487592, -1.554166, 1, 1, 1, 1, 1,
-0.9254984, -0.1695615, -2.475113, 1, 1, 1, 1, 1,
-0.9246716, 0.5090619, 0.1475837, 1, 1, 1, 1, 1,
-0.9227891, 1.103455, -0.6096485, 1, 1, 1, 1, 1,
-0.9174155, -0.08502097, -2.485814, 1, 1, 1, 1, 1,
-0.9145001, 1.000675, -1.185453, 1, 1, 1, 1, 1,
-0.8945796, -0.2794122, -1.564599, 1, 1, 1, 1, 1,
-0.8861431, -2.133543, -3.177291, 1, 1, 1, 1, 1,
-0.882874, -0.1836444, -1.882217, 1, 1, 1, 1, 1,
-0.8812169, 1.309582, -1.898982, 1, 1, 1, 1, 1,
-0.8789653, -1.590174, -2.113143, 1, 1, 1, 1, 1,
-0.8762954, -0.1145656, -0.4657845, 1, 1, 1, 1, 1,
-0.8731584, -0.5184512, -2.550577, 0, 0, 1, 1, 1,
-0.8712282, -2.434591, -3.606828, 1, 0, 0, 1, 1,
-0.8693632, 0.4266422, 0.3065527, 1, 0, 0, 1, 1,
-0.8661512, -1.387859, -1.803742, 1, 0, 0, 1, 1,
-0.865935, -1.112974, -2.514878, 1, 0, 0, 1, 1,
-0.8622738, -0.1702938, -1.765784, 1, 0, 0, 1, 1,
-0.8620418, -1.665643, -1.460104, 0, 0, 0, 1, 1,
-0.8571572, -1.73117, -1.679225, 0, 0, 0, 1, 1,
-0.8513242, 0.5901216, -2.727699, 0, 0, 0, 1, 1,
-0.8499698, -0.8263652, -0.9979162, 0, 0, 0, 1, 1,
-0.8464521, 1.868504, 0.3817402, 0, 0, 0, 1, 1,
-0.8448821, 0.2072382, -2.054708, 0, 0, 0, 1, 1,
-0.8435012, -0.5235708, -2.371124, 0, 0, 0, 1, 1,
-0.8407273, 0.7376141, 0.7724425, 1, 1, 1, 1, 1,
-0.8400938, 0.987161, 0.1397669, 1, 1, 1, 1, 1,
-0.8383098, 0.01649049, -0.9742715, 1, 1, 1, 1, 1,
-0.837949, 0.251015, -2.208611, 1, 1, 1, 1, 1,
-0.8351469, -0.491554, -2.816386, 1, 1, 1, 1, 1,
-0.8341401, -0.7693714, -2.40643, 1, 1, 1, 1, 1,
-0.8330718, -0.7054532, -2.11247, 1, 1, 1, 1, 1,
-0.8256205, -1.921281, -2.363811, 1, 1, 1, 1, 1,
-0.8226608, -0.6058031, -1.015218, 1, 1, 1, 1, 1,
-0.8220215, -0.3139572, -2.036046, 1, 1, 1, 1, 1,
-0.8190648, 0.1948554, -1.165395, 1, 1, 1, 1, 1,
-0.8123527, -0.5586545, -3.266116, 1, 1, 1, 1, 1,
-0.8103765, -0.9263789, -3.582964, 1, 1, 1, 1, 1,
-0.8075545, -3.000851, -2.317183, 1, 1, 1, 1, 1,
-0.7914833, -0.5443192, 0.2165682, 1, 1, 1, 1, 1,
-0.779509, -0.6846575, -2.577405, 0, 0, 1, 1, 1,
-0.7787646, -1.733934, -2.417915, 1, 0, 0, 1, 1,
-0.7534609, -2.886735, -2.292396, 1, 0, 0, 1, 1,
-0.7504202, -0.1913737, -2.481586, 1, 0, 0, 1, 1,
-0.7485735, -0.7571302, -3.008548, 1, 0, 0, 1, 1,
-0.7471718, -0.6125867, -1.655317, 1, 0, 0, 1, 1,
-0.7431123, 1.107021, -1.384805, 0, 0, 0, 1, 1,
-0.7414438, 1.411413, 1.297926, 0, 0, 0, 1, 1,
-0.7400917, -0.2849868, -1.551848, 0, 0, 0, 1, 1,
-0.7253238, 0.7705281, -0.8860167, 0, 0, 0, 1, 1,
-0.7235686, 0.6123726, -2.593826, 0, 0, 0, 1, 1,
-0.72188, -0.5635784, -1.766478, 0, 0, 0, 1, 1,
-0.7209367, 0.4861774, -0.02474554, 0, 0, 0, 1, 1,
-0.7191002, 0.236872, -2.62528, 1, 1, 1, 1, 1,
-0.7131681, -0.6161552, -5.471555, 1, 1, 1, 1, 1,
-0.7106234, -0.04288831, -2.023497, 1, 1, 1, 1, 1,
-0.7089601, -0.4327062, -1.173849, 1, 1, 1, 1, 1,
-0.7089003, 0.06612106, -1.384581, 1, 1, 1, 1, 1,
-0.6932266, -1.094026, -4.06826, 1, 1, 1, 1, 1,
-0.6912738, 0.2910298, -1.763881, 1, 1, 1, 1, 1,
-0.6893018, -1.395806, -3.192406, 1, 1, 1, 1, 1,
-0.6886812, -1.511103, -2.115205, 1, 1, 1, 1, 1,
-0.684437, 0.4604926, -0.7469559, 1, 1, 1, 1, 1,
-0.6838534, 1.633339, -0.5968031, 1, 1, 1, 1, 1,
-0.6832293, 0.4497034, -1.918626, 1, 1, 1, 1, 1,
-0.6820676, 0.5543432, -0.3316811, 1, 1, 1, 1, 1,
-0.6801904, -0.1957418, -3.053353, 1, 1, 1, 1, 1,
-0.6776195, -1.042683, -4.794851, 1, 1, 1, 1, 1,
-0.6760146, 0.113831, -1.001113, 0, 0, 1, 1, 1,
-0.6728952, 0.1863711, -1.985652, 1, 0, 0, 1, 1,
-0.6678978, -1.554377, -2.442102, 1, 0, 0, 1, 1,
-0.6668729, 0.7192258, -0.06148301, 1, 0, 0, 1, 1,
-0.6621499, -0.06334011, -1.252437, 1, 0, 0, 1, 1,
-0.658398, 0.2061435, -0.4531403, 1, 0, 0, 1, 1,
-0.6578705, -0.4926355, -1.774468, 0, 0, 0, 1, 1,
-0.6572524, 0.7620293, -0.7369862, 0, 0, 0, 1, 1,
-0.6516204, -0.507992, -3.396781, 0, 0, 0, 1, 1,
-0.6452336, -0.08365534, -1.597102, 0, 0, 0, 1, 1,
-0.6443819, 2.162978, -0.2081692, 0, 0, 0, 1, 1,
-0.6402131, -0.5386699, -3.28976, 0, 0, 0, 1, 1,
-0.6361014, 2.049108, 1.765439, 0, 0, 0, 1, 1,
-0.6343462, -0.3621602, -1.869228, 1, 1, 1, 1, 1,
-0.6301941, -0.5364392, -2.029499, 1, 1, 1, 1, 1,
-0.6290399, -1.013201, -2.742459, 1, 1, 1, 1, 1,
-0.6196299, -0.3590466, -1.088352, 1, 1, 1, 1, 1,
-0.6140506, 0.7041255, -0.7997001, 1, 1, 1, 1, 1,
-0.6132444, -1.088208, -2.84899, 1, 1, 1, 1, 1,
-0.6094652, -2.608948, -3.10095, 1, 1, 1, 1, 1,
-0.6051776, -0.4228141, -0.9983892, 1, 1, 1, 1, 1,
-0.5991498, 0.7781681, 0.1274728, 1, 1, 1, 1, 1,
-0.595536, 1.476872, -1.458395, 1, 1, 1, 1, 1,
-0.5923079, -0.117508, 0.1532877, 1, 1, 1, 1, 1,
-0.5892991, 0.0548183, -1.12456, 1, 1, 1, 1, 1,
-0.5846661, -0.9156721, -2.721704, 1, 1, 1, 1, 1,
-0.5828549, 0.854402, -0.7342752, 1, 1, 1, 1, 1,
-0.5783125, -0.834196, -0.8211588, 1, 1, 1, 1, 1,
-0.5760058, -0.5778487, -1.568956, 0, 0, 1, 1, 1,
-0.5709001, -0.5240409, -3.438176, 1, 0, 0, 1, 1,
-0.5702826, -1.113587, -2.885636, 1, 0, 0, 1, 1,
-0.5674137, 0.9063392, -1.803564, 1, 0, 0, 1, 1,
-0.5671558, 1.306059, -1.271853, 1, 0, 0, 1, 1,
-0.5609894, 0.4886258, -0.6723154, 1, 0, 0, 1, 1,
-0.5566302, 0.6625675, -1.782699, 0, 0, 0, 1, 1,
-0.5467083, -1.814466, -3.478348, 0, 0, 0, 1, 1,
-0.5438275, -0.008896195, -1.502372, 0, 0, 0, 1, 1,
-0.542632, -0.7916874, -2.585174, 0, 0, 0, 1, 1,
-0.5414497, 0.2282148, -0.8722714, 0, 0, 0, 1, 1,
-0.5384753, 0.9524043, 1.072347, 0, 0, 0, 1, 1,
-0.5358687, 0.3314887, -0.9191754, 0, 0, 0, 1, 1,
-0.5291671, 1.255185, -1.364279, 1, 1, 1, 1, 1,
-0.5284747, 2.369158, -0.05352691, 1, 1, 1, 1, 1,
-0.5252707, -0.3780392, -1.452568, 1, 1, 1, 1, 1,
-0.5156196, 1.075608, -0.3591313, 1, 1, 1, 1, 1,
-0.5153957, 0.4968006, 0.1758735, 1, 1, 1, 1, 1,
-0.5115923, 1.301346, -0.5695873, 1, 1, 1, 1, 1,
-0.5108452, 0.5686998, -0.2580622, 1, 1, 1, 1, 1,
-0.5020115, 0.7947433, -2.153696, 1, 1, 1, 1, 1,
-0.5006147, -0.07222893, -1.271867, 1, 1, 1, 1, 1,
-0.4970635, -0.4549618, -2.230699, 1, 1, 1, 1, 1,
-0.4966057, 1.884264, -1.00149, 1, 1, 1, 1, 1,
-0.4941652, -1.210421, -1.263723, 1, 1, 1, 1, 1,
-0.4927277, -0.004681519, -0.6574968, 1, 1, 1, 1, 1,
-0.4873425, 0.6583209, 0.8382562, 1, 1, 1, 1, 1,
-0.4869144, -0.2148164, -2.675271, 1, 1, 1, 1, 1,
-0.4849578, 1.588138, -1.388185, 0, 0, 1, 1, 1,
-0.4821866, 2.183514, -0.6851606, 1, 0, 0, 1, 1,
-0.4809487, 1.355024, -0.6292855, 1, 0, 0, 1, 1,
-0.4794801, 0.2386685, -1.656273, 1, 0, 0, 1, 1,
-0.4746544, -0.9883715, -1.752949, 1, 0, 0, 1, 1,
-0.4686886, 2.041108, 0.4352787, 1, 0, 0, 1, 1,
-0.4629178, 0.6550117, -1.394974, 0, 0, 0, 1, 1,
-0.4593932, 1.144182, -0.9020021, 0, 0, 0, 1, 1,
-0.4579092, -0.4682236, -3.0056, 0, 0, 0, 1, 1,
-0.4533565, 1.821073, 0.4991866, 0, 0, 0, 1, 1,
-0.4515556, 0.3237873, 0.0140084, 0, 0, 0, 1, 1,
-0.4488867, -0.9988155, -3.347609, 0, 0, 0, 1, 1,
-0.4483069, -1.030123, -4.14232, 0, 0, 0, 1, 1,
-0.4461825, 0.3624515, -1.59584, 1, 1, 1, 1, 1,
-0.4434407, -0.4263562, -3.238437, 1, 1, 1, 1, 1,
-0.4395119, 0.3158307, -1.577256, 1, 1, 1, 1, 1,
-0.4376956, 0.6243559, -0.5686728, 1, 1, 1, 1, 1,
-0.4369023, -1.463476, -2.486409, 1, 1, 1, 1, 1,
-0.4367977, 0.5766579, -0.6811951, 1, 1, 1, 1, 1,
-0.4365904, 0.0765277, -0.579516, 1, 1, 1, 1, 1,
-0.4359432, -0.7382119, -2.733151, 1, 1, 1, 1, 1,
-0.4344478, -0.437584, -1.889883, 1, 1, 1, 1, 1,
-0.433942, -0.323211, -0.6392457, 1, 1, 1, 1, 1,
-0.4313251, 1.237705, -0.2473129, 1, 1, 1, 1, 1,
-0.4287301, 2.080378, 0.5923743, 1, 1, 1, 1, 1,
-0.428477, 0.02711584, -1.87641, 1, 1, 1, 1, 1,
-0.4202709, -0.02403354, -4.2675, 1, 1, 1, 1, 1,
-0.4179713, -0.7443389, -2.138987, 1, 1, 1, 1, 1,
-0.4168883, 1.144638, -1.47844, 0, 0, 1, 1, 1,
-0.4164152, -0.2553202, -3.010729, 1, 0, 0, 1, 1,
-0.4115315, 0.1935385, -1.443482, 1, 0, 0, 1, 1,
-0.4021343, 0.6617025, -0.8697476, 1, 0, 0, 1, 1,
-0.3970259, -1.036085, -4.550428, 1, 0, 0, 1, 1,
-0.392842, -2.209714, -3.080081, 1, 0, 0, 1, 1,
-0.3925145, 0.9502454, -0.9213313, 0, 0, 0, 1, 1,
-0.3915682, -1.195091, -2.214247, 0, 0, 0, 1, 1,
-0.3884301, 1.131475, -0.1968226, 0, 0, 0, 1, 1,
-0.386206, 1.411106, -1.836438, 0, 0, 0, 1, 1,
-0.3834765, 2.093992, -1.052883, 0, 0, 0, 1, 1,
-0.3795389, 0.8360363, -0.5459445, 0, 0, 0, 1, 1,
-0.3707695, -0.5003584, -0.761782, 0, 0, 0, 1, 1,
-0.3689743, 1.180473, -0.767748, 1, 1, 1, 1, 1,
-0.3630562, 1.807418, -0.4422846, 1, 1, 1, 1, 1,
-0.360976, -1.158713, -3.942878, 1, 1, 1, 1, 1,
-0.3565311, -0.02684268, -2.96544, 1, 1, 1, 1, 1,
-0.3529567, 1.198717, -2.840813, 1, 1, 1, 1, 1,
-0.3492409, -1.279423, -3.370245, 1, 1, 1, 1, 1,
-0.3481287, 0.3403768, -2.500107, 1, 1, 1, 1, 1,
-0.3452396, -1.898876, -4.144211, 1, 1, 1, 1, 1,
-0.3447065, 1.683468, -0.5004808, 1, 1, 1, 1, 1,
-0.3419984, -0.5933536, -2.089752, 1, 1, 1, 1, 1,
-0.3404752, -1.745737, -2.360195, 1, 1, 1, 1, 1,
-0.328549, -0.4619374, -1.959714, 1, 1, 1, 1, 1,
-0.3260213, -0.7903799, -1.951329, 1, 1, 1, 1, 1,
-0.3259217, 0.5706517, -0.5735189, 1, 1, 1, 1, 1,
-0.3204055, -1.279201, -1.393078, 1, 1, 1, 1, 1,
-0.3183695, -0.1275795, -2.062145, 0, 0, 1, 1, 1,
-0.3160179, -1.101905, -2.73419, 1, 0, 0, 1, 1,
-0.3134314, -0.4477979, -3.366186, 1, 0, 0, 1, 1,
-0.3130088, -0.5012434, -2.556363, 1, 0, 0, 1, 1,
-0.3123216, 1.414643, -0.6346291, 1, 0, 0, 1, 1,
-0.3076777, 0.3197987, -2.191426, 1, 0, 0, 1, 1,
-0.2963369, -0.4714074, -4.364397, 0, 0, 0, 1, 1,
-0.296092, 0.001669667, -1.199515, 0, 0, 0, 1, 1,
-0.2916044, 0.2706553, -3.077235, 0, 0, 0, 1, 1,
-0.2908847, -0.04501427, -2.697064, 0, 0, 0, 1, 1,
-0.2854253, 0.5655689, 0.2275794, 0, 0, 0, 1, 1,
-0.2776212, 0.999894, 0.348028, 0, 0, 0, 1, 1,
-0.2764605, -0.560254, -2.248333, 0, 0, 0, 1, 1,
-0.2750246, -0.9385036, -1.18711, 1, 1, 1, 1, 1,
-0.2731799, 0.5212843, -1.041303, 1, 1, 1, 1, 1,
-0.2713521, 3.435005, 0.5010768, 1, 1, 1, 1, 1,
-0.2665586, -0.7587644, -5.876551, 1, 1, 1, 1, 1,
-0.2664036, -1.815923, -1.943115, 1, 1, 1, 1, 1,
-0.2638004, -0.6870131, -2.823519, 1, 1, 1, 1, 1,
-0.2633106, -0.1112096, -1.997181, 1, 1, 1, 1, 1,
-0.2628875, 0.5388949, -0.950601, 1, 1, 1, 1, 1,
-0.2614312, -0.2971416, -4.053977, 1, 1, 1, 1, 1,
-0.258034, 0.04564481, -2.216943, 1, 1, 1, 1, 1,
-0.2565345, 0.6627194, -1.844627, 1, 1, 1, 1, 1,
-0.2459397, -0.3272911, -1.626122, 1, 1, 1, 1, 1,
-0.2436447, 1.186838, 0.4010834, 1, 1, 1, 1, 1,
-0.2404741, -0.5096429, -2.512679, 1, 1, 1, 1, 1,
-0.2370966, -1.505769, -3.062511, 1, 1, 1, 1, 1,
-0.2321038, 0.02606422, -1.419778, 0, 0, 1, 1, 1,
-0.2278969, 1.370392, -0.9666878, 1, 0, 0, 1, 1,
-0.2273908, -0.1773748, -2.431134, 1, 0, 0, 1, 1,
-0.2252354, -1.516188, -2.275816, 1, 0, 0, 1, 1,
-0.2222534, 1.805326, 0.663355, 1, 0, 0, 1, 1,
-0.2219831, 0.5720323, 1.801915, 1, 0, 0, 1, 1,
-0.2219627, 0.05775406, -0.06862267, 0, 0, 0, 1, 1,
-0.2171389, -0.5142184, -3.223619, 0, 0, 0, 1, 1,
-0.2170007, 0.198809, -0.7234639, 0, 0, 0, 1, 1,
-0.2131914, 1.912666, -1.912586, 0, 0, 0, 1, 1,
-0.2116444, -1.640693, -3.913286, 0, 0, 0, 1, 1,
-0.206087, 0.0478692, -1.214709, 0, 0, 0, 1, 1,
-0.2059745, 0.0142616, -0.8646394, 0, 0, 0, 1, 1,
-0.2033219, -1.554623, -3.995762, 1, 1, 1, 1, 1,
-0.1983007, -0.8187171, -1.684706, 1, 1, 1, 1, 1,
-0.1980553, 1.168412, 0.3979417, 1, 1, 1, 1, 1,
-0.1957201, -1.10628, -1.783933, 1, 1, 1, 1, 1,
-0.1905452, -0.7678437, -3.48326, 1, 1, 1, 1, 1,
-0.1893305, -1.866199, -2.629312, 1, 1, 1, 1, 1,
-0.1882497, 0.01827217, -1.924861, 1, 1, 1, 1, 1,
-0.1876705, 0.2302671, -0.5125571, 1, 1, 1, 1, 1,
-0.1846361, 0.3460804, -0.1627744, 1, 1, 1, 1, 1,
-0.1825888, 2.164097, -0.1850384, 1, 1, 1, 1, 1,
-0.1799373, -0.3814782, -3.469058, 1, 1, 1, 1, 1,
-0.1776567, -0.7577306, -4.540986, 1, 1, 1, 1, 1,
-0.1773851, 0.1317978, -0.8389692, 1, 1, 1, 1, 1,
-0.1753058, -1.334134, -4.791573, 1, 1, 1, 1, 1,
-0.1734977, 0.1591947, -1.295178, 1, 1, 1, 1, 1,
-0.1716821, 1.105019, -0.1235057, 0, 0, 1, 1, 1,
-0.1701851, 0.8109539, -0.2092792, 1, 0, 0, 1, 1,
-0.1696876, -0.1818882, -2.119078, 1, 0, 0, 1, 1,
-0.169262, -0.3182625, -2.550897, 1, 0, 0, 1, 1,
-0.1673627, -1.467801, -3.023485, 1, 0, 0, 1, 1,
-0.1622253, 1.419135, -0.4866396, 1, 0, 0, 1, 1,
-0.1600448, 0.2333279, -1.197569, 0, 0, 0, 1, 1,
-0.1581956, 0.02980648, -1.806121, 0, 0, 0, 1, 1,
-0.1560688, -0.2320864, -2.528803, 0, 0, 0, 1, 1,
-0.1534055, -0.4641881, -2.255968, 0, 0, 0, 1, 1,
-0.1532928, 0.1176599, -1.432974, 0, 0, 0, 1, 1,
-0.1530967, 0.7005777, -2.445243, 0, 0, 0, 1, 1,
-0.1527735, -0.5309378, -3.397201, 0, 0, 0, 1, 1,
-0.149811, 1.310853, -0.01830799, 1, 1, 1, 1, 1,
-0.1453194, 0.9258149, 1.150997, 1, 1, 1, 1, 1,
-0.1411358, -0.2251376, -2.197753, 1, 1, 1, 1, 1,
-0.1409776, -0.8260208, -2.69546, 1, 1, 1, 1, 1,
-0.1390602, 0.6193683, 0.0868016, 1, 1, 1, 1, 1,
-0.1351322, -1.112859, -3.780621, 1, 1, 1, 1, 1,
-0.1348417, 0.2686574, -2.313243, 1, 1, 1, 1, 1,
-0.1321892, 1.810129, -0.6461528, 1, 1, 1, 1, 1,
-0.1293927, -0.05395439, -3.358982, 1, 1, 1, 1, 1,
-0.1267732, 0.7402111, -0.8124409, 1, 1, 1, 1, 1,
-0.123741, -0.6853739, -2.396231, 1, 1, 1, 1, 1,
-0.1190766, -0.7947185, -3.511138, 1, 1, 1, 1, 1,
-0.1182576, 0.5686787, -1.22283, 1, 1, 1, 1, 1,
-0.1175097, -0.9444634, -4.982832, 1, 1, 1, 1, 1,
-0.1146174, -0.5264983, -3.309162, 1, 1, 1, 1, 1,
-0.1138946, 1.040241, 1.548714, 0, 0, 1, 1, 1,
-0.1128379, 0.03620015, -0.7011834, 1, 0, 0, 1, 1,
-0.1109358, 0.7593559, -0.6837904, 1, 0, 0, 1, 1,
-0.1104269, -0.04430396, -2.507336, 1, 0, 0, 1, 1,
-0.1097926, -0.07208369, -1.598154, 1, 0, 0, 1, 1,
-0.108267, 0.08002315, -1.386094, 1, 0, 0, 1, 1,
-0.09405284, -0.1879172, -2.501331, 0, 0, 0, 1, 1,
-0.08936977, 1.528901, -0.6814473, 0, 0, 0, 1, 1,
-0.08860823, -1.969128, -3.136531, 0, 0, 0, 1, 1,
-0.08429626, 1.255183, -2.459306, 0, 0, 0, 1, 1,
-0.0838602, -0.1890752, -2.020007, 0, 0, 0, 1, 1,
-0.08378077, -0.8383231, -4.730497, 0, 0, 0, 1, 1,
-0.08164605, -0.4275452, -4.187038, 0, 0, 0, 1, 1,
-0.07690489, 0.3844213, 0.04197311, 1, 1, 1, 1, 1,
-0.07607389, -0.479582, -4.295667, 1, 1, 1, 1, 1,
-0.07305177, 0.2145572, -2.548176, 1, 1, 1, 1, 1,
-0.06775831, -0.3212101, -3.3432, 1, 1, 1, 1, 1,
-0.06564864, 0.4417375, 0.1805671, 1, 1, 1, 1, 1,
-0.0641683, -0.4606503, -1.886303, 1, 1, 1, 1, 1,
-0.06310201, -0.3571469, -4.597619, 1, 1, 1, 1, 1,
-0.05851012, -0.9523484, -1.681694, 1, 1, 1, 1, 1,
-0.05849432, 1.516859, -2.858732, 1, 1, 1, 1, 1,
-0.05280072, -1.273658, -1.683145, 1, 1, 1, 1, 1,
-0.0527869, 0.3369824, -1.284799, 1, 1, 1, 1, 1,
-0.04949592, -0.2727093, -5.450397, 1, 1, 1, 1, 1,
-0.04689509, -0.3110074, -2.431262, 1, 1, 1, 1, 1,
-0.04536969, -0.3134695, -3.9133, 1, 1, 1, 1, 1,
-0.04521246, -0.2753081, -3.168179, 1, 1, 1, 1, 1,
-0.04369745, -0.636871, -4.854237, 0, 0, 1, 1, 1,
-0.03509627, 1.148068, -0.7652777, 1, 0, 0, 1, 1,
-0.02996478, -0.7496939, -2.99214, 1, 0, 0, 1, 1,
-0.02702736, 0.394295, -2.270265, 1, 0, 0, 1, 1,
-0.02468188, 2.278348, 0.8034549, 1, 0, 0, 1, 1,
-0.02460576, 0.9561139, 0.1365621, 1, 0, 0, 1, 1,
-0.01815813, 0.9592435, -0.2746694, 0, 0, 0, 1, 1,
-0.01587885, -0.7097616, -2.533945, 0, 0, 0, 1, 1,
-0.01582715, -0.9107741, -4.559784, 0, 0, 0, 1, 1,
-0.01078153, -0.8384128, -3.776212, 0, 0, 0, 1, 1,
-0.008976826, -1.449967, -3.601993, 0, 0, 0, 1, 1,
-0.004359252, -0.474632, -0.6730743, 0, 0, 0, 1, 1,
-0.00432493, -1.702923, -3.290637, 0, 0, 0, 1, 1,
-0.001607799, 0.2410615, 0.5632753, 1, 1, 1, 1, 1,
0.0002117063, -0.5102998, 3.49234, 1, 1, 1, 1, 1,
0.0003001259, -0.4621307, 2.028073, 1, 1, 1, 1, 1,
0.004082959, -0.4755149, 1.172629, 1, 1, 1, 1, 1,
0.005753609, 1.39628, -0.1083444, 1, 1, 1, 1, 1,
0.006228935, 0.06591615, 0.4160666, 1, 1, 1, 1, 1,
0.01132773, 0.8956084, -0.167982, 1, 1, 1, 1, 1,
0.01213433, -1.58966, 2.967941, 1, 1, 1, 1, 1,
0.01503651, 0.7367342, 1.278621, 1, 1, 1, 1, 1,
0.01535145, -2.002552, 3.683707, 1, 1, 1, 1, 1,
0.02497958, 1.137904, -1.051212, 1, 1, 1, 1, 1,
0.02703369, 0.1142019, 0.04857549, 1, 1, 1, 1, 1,
0.02736165, -0.3728258, 1.992466, 1, 1, 1, 1, 1,
0.02796231, 0.246413, 0.3654839, 1, 1, 1, 1, 1,
0.03316277, 0.2181819, -0.4864104, 1, 1, 1, 1, 1,
0.03339869, -0.3975776, 1.588779, 0, 0, 1, 1, 1,
0.03657743, -0.002932319, 1.79211, 1, 0, 0, 1, 1,
0.0391022, -0.2902206, 1.642624, 1, 0, 0, 1, 1,
0.04672363, 1.216641, -0.235587, 1, 0, 0, 1, 1,
0.04787486, -0.3220503, 3.207651, 1, 0, 0, 1, 1,
0.05065732, 0.5849199, 1.418839, 1, 0, 0, 1, 1,
0.05085636, 0.1898595, 0.7456515, 0, 0, 0, 1, 1,
0.05234622, 1.498038, 1.339417, 0, 0, 0, 1, 1,
0.05463236, -1.021266, 3.806669, 0, 0, 0, 1, 1,
0.05470539, -0.8126211, 2.451474, 0, 0, 0, 1, 1,
0.06385253, 0.1065678, 0.0522108, 0, 0, 0, 1, 1,
0.06690741, 0.4966136, -0.1198039, 0, 0, 0, 1, 1,
0.06850705, 0.4102883, 0.7470819, 0, 0, 0, 1, 1,
0.07234044, -0.8399799, 3.222162, 1, 1, 1, 1, 1,
0.07387739, -0.1470507, 1.782541, 1, 1, 1, 1, 1,
0.07431858, -2.557888, 2.907547, 1, 1, 1, 1, 1,
0.07627369, -0.2722981, 2.875029, 1, 1, 1, 1, 1,
0.07776362, 1.032898, -0.7940333, 1, 1, 1, 1, 1,
0.07854651, 0.6544107, 0.6366615, 1, 1, 1, 1, 1,
0.07919431, -0.7775052, 1.817506, 1, 1, 1, 1, 1,
0.0808587, -0.02529749, 1.50805, 1, 1, 1, 1, 1,
0.08560083, -0.7568258, 2.401191, 1, 1, 1, 1, 1,
0.0882541, 0.5156214, 0.07919994, 1, 1, 1, 1, 1,
0.08877421, -0.3663196, 3.699756, 1, 1, 1, 1, 1,
0.09185151, 1.101894, 0.4344865, 1, 1, 1, 1, 1,
0.09304689, -0.212555, 1.153389, 1, 1, 1, 1, 1,
0.09646199, -0.5353696, 3.502373, 1, 1, 1, 1, 1,
0.09695099, -0.5844001, 1.680378, 1, 1, 1, 1, 1,
0.09800835, -0.3286774, 3.73675, 0, 0, 1, 1, 1,
0.09837897, 0.3069512, -0.8116412, 1, 0, 0, 1, 1,
0.10331, -0.980849, 1.786311, 1, 0, 0, 1, 1,
0.1036874, 0.8506487, 0.1368993, 1, 0, 0, 1, 1,
0.1047713, -1.254425, 2.283782, 1, 0, 0, 1, 1,
0.1050095, 1.15206, -0.2083499, 1, 0, 0, 1, 1,
0.1098473, 0.4413464, -0.7587686, 0, 0, 0, 1, 1,
0.1150741, -0.5504577, 3.075473, 0, 0, 0, 1, 1,
0.120026, 2.199636, 0.005683029, 0, 0, 0, 1, 1,
0.1202286, -0.2188224, 4.234519, 0, 0, 0, 1, 1,
0.1242813, 1.178862, 0.4865723, 0, 0, 0, 1, 1,
0.12747, 3.070771, 1.678564, 0, 0, 0, 1, 1,
0.1289967, -1.075185, 2.95687, 0, 0, 0, 1, 1,
0.1349225, -0.8282834, 3.310312, 1, 1, 1, 1, 1,
0.1355159, 1.308089, -0.1730261, 1, 1, 1, 1, 1,
0.1392142, -1.60583, 2.764989, 1, 1, 1, 1, 1,
0.1393351, -0.8068644, 2.543813, 1, 1, 1, 1, 1,
0.1403516, -0.48634, 2.803159, 1, 1, 1, 1, 1,
0.1407717, 0.6257278, 0.5208394, 1, 1, 1, 1, 1,
0.141919, 1.102253, 2.234916, 1, 1, 1, 1, 1,
0.15308, -0.291911, 1.93385, 1, 1, 1, 1, 1,
0.1560682, 2.666128, 1.663539, 1, 1, 1, 1, 1,
0.1588399, -0.3936093, 2.12487, 1, 1, 1, 1, 1,
0.1589092, -1.131126, 2.279588, 1, 1, 1, 1, 1,
0.1601051, 1.240007, 1.227469, 1, 1, 1, 1, 1,
0.1647577, -0.5237343, 2.530358, 1, 1, 1, 1, 1,
0.1647796, 0.1225767, -1.002199, 1, 1, 1, 1, 1,
0.166181, -0.1009265, 1.296424, 1, 1, 1, 1, 1,
0.1665251, 1.20918, 0.123329, 0, 0, 1, 1, 1,
0.1705963, 0.582976, 1.361806, 1, 0, 0, 1, 1,
0.1726285, -0.1974853, 1.086856, 1, 0, 0, 1, 1,
0.1752237, 0.3610617, 0.1225696, 1, 0, 0, 1, 1,
0.1767306, -0.008373387, 0.4998072, 1, 0, 0, 1, 1,
0.1800715, 0.06446853, 3.507814, 1, 0, 0, 1, 1,
0.1819565, -1.032147, 2.840164, 0, 0, 0, 1, 1,
0.1827193, -0.1780358, 0.531536, 0, 0, 0, 1, 1,
0.1834539, -1.123372, 3.757489, 0, 0, 0, 1, 1,
0.1838737, 0.79818, -2.629387, 0, 0, 0, 1, 1,
0.1842551, -0.7633479, 2.526339, 0, 0, 0, 1, 1,
0.1865056, 0.4709853, 0.02707759, 0, 0, 0, 1, 1,
0.1881857, -1.086326, 2.591738, 0, 0, 0, 1, 1,
0.1925419, 0.4950428, 0.1052766, 1, 1, 1, 1, 1,
0.1927134, -0.9570585, 3.488444, 1, 1, 1, 1, 1,
0.1960813, 0.1291907, 0.2213592, 1, 1, 1, 1, 1,
0.198616, 0.4174186, 2.949264, 1, 1, 1, 1, 1,
0.1997889, 1.015197, 0.6006267, 1, 1, 1, 1, 1,
0.2002294, 0.2257202, 1.679529, 1, 1, 1, 1, 1,
0.2003819, 1.111548, 1.270885, 1, 1, 1, 1, 1,
0.2053634, 0.06786375, 0.3863435, 1, 1, 1, 1, 1,
0.2119082, -0.3400098, 3.057166, 1, 1, 1, 1, 1,
0.2149471, 0.1881065, 2.091607, 1, 1, 1, 1, 1,
0.2169592, -0.190952, 5.005092, 1, 1, 1, 1, 1,
0.2252125, 0.9906906, 1.127424, 1, 1, 1, 1, 1,
0.2306003, -0.2346214, 1.880201, 1, 1, 1, 1, 1,
0.2345999, 0.9005233, -1.132567, 1, 1, 1, 1, 1,
0.2441599, 1.412778, 0.4530657, 1, 1, 1, 1, 1,
0.248076, -0.02261995, 3.158901, 0, 0, 1, 1, 1,
0.253887, 0.4932307, 1.821924, 1, 0, 0, 1, 1,
0.2591088, -1.595646, 1.95288, 1, 0, 0, 1, 1,
0.2651688, -0.386854, 2.230468, 1, 0, 0, 1, 1,
0.2667185, -0.7983618, 1.259683, 1, 0, 0, 1, 1,
0.2694684, -0.03347245, 1.781267, 1, 0, 0, 1, 1,
0.2716371, -0.6111075, 2.136368, 0, 0, 0, 1, 1,
0.2769948, 1.008757, 1.756866, 0, 0, 0, 1, 1,
0.2777945, -0.9558255, 3.162057, 0, 0, 0, 1, 1,
0.2779454, 1.197421, 0.3890254, 0, 0, 0, 1, 1,
0.2902267, -0.02667866, 1.190412, 0, 0, 0, 1, 1,
0.29229, -1.040738, 4.445294, 0, 0, 0, 1, 1,
0.2927047, -0.9209297, 2.414928, 0, 0, 0, 1, 1,
0.2930026, -0.8603486, 5.523039, 1, 1, 1, 1, 1,
0.2946109, 0.5011919, 0.4663008, 1, 1, 1, 1, 1,
0.2965845, -0.05739035, 1.938358, 1, 1, 1, 1, 1,
0.3015287, -0.9600008, 1.459959, 1, 1, 1, 1, 1,
0.3089517, 0.3572836, -1.536713, 1, 1, 1, 1, 1,
0.3100789, 0.0009764053, 2.798044, 1, 1, 1, 1, 1,
0.3197575, 1.279022, 1.149464, 1, 1, 1, 1, 1,
0.3221037, -0.4449585, 2.630778, 1, 1, 1, 1, 1,
0.3233254, 0.06970349, 1.641838, 1, 1, 1, 1, 1,
0.3299882, -0.9225799, 2.477353, 1, 1, 1, 1, 1,
0.3337877, 0.6457255, -0.7017936, 1, 1, 1, 1, 1,
0.3402189, -1.676376, 2.854116, 1, 1, 1, 1, 1,
0.3488892, 0.01589651, 1.119294, 1, 1, 1, 1, 1,
0.3545921, 1.095815, 0.4200369, 1, 1, 1, 1, 1,
0.356923, -0.6187623, 1.174374, 1, 1, 1, 1, 1,
0.358864, -0.9413061, 3.252063, 0, 0, 1, 1, 1,
0.359669, -0.8509924, 1.152658, 1, 0, 0, 1, 1,
0.3605524, -0.3207017, 1.219154, 1, 0, 0, 1, 1,
0.3627589, 0.06486921, 1.86432, 1, 0, 0, 1, 1,
0.3639297, -0.2473952, 1.909473, 1, 0, 0, 1, 1,
0.3690491, -0.4587351, 2.493436, 1, 0, 0, 1, 1,
0.3695661, 0.1493791, 0.7200443, 0, 0, 0, 1, 1,
0.3783078, 0.3620245, 0.9435193, 0, 0, 0, 1, 1,
0.3810031, 1.397313, 0.3932833, 0, 0, 0, 1, 1,
0.3823049, -2.041927, 3.423752, 0, 0, 0, 1, 1,
0.382467, -1.73205, 2.48786, 0, 0, 0, 1, 1,
0.3836613, -1.176255, 2.576557, 0, 0, 0, 1, 1,
0.3863127, -1.605128, 3.135761, 0, 0, 0, 1, 1,
0.3865427, 0.7997516, 0.9454083, 1, 1, 1, 1, 1,
0.3910143, 1.240507, -0.4453206, 1, 1, 1, 1, 1,
0.400285, 0.675633, -0.1719226, 1, 1, 1, 1, 1,
0.4016341, 0.07254912, 0.5721141, 1, 1, 1, 1, 1,
0.4081498, -0.8306416, 2.898778, 1, 1, 1, 1, 1,
0.4103052, 0.5624238, 0.5291801, 1, 1, 1, 1, 1,
0.4106876, 0.6781321, -0.6841311, 1, 1, 1, 1, 1,
0.4123942, -1.016015, 3.25987, 1, 1, 1, 1, 1,
0.4132046, -0.5608662, 3.681828, 1, 1, 1, 1, 1,
0.4135336, -0.6280431, 2.224041, 1, 1, 1, 1, 1,
0.4142311, -0.0831214, 1.392066, 1, 1, 1, 1, 1,
0.4183927, 2.133169, 0.2498538, 1, 1, 1, 1, 1,
0.4201636, -1.820504, 3.465982, 1, 1, 1, 1, 1,
0.4227346, 0.2491851, 1.238674, 1, 1, 1, 1, 1,
0.4253995, -0.2650609, -0.9293564, 1, 1, 1, 1, 1,
0.4256501, 0.8182108, 1.751885, 0, 0, 1, 1, 1,
0.425878, 0.2387184, 0.2157592, 1, 0, 0, 1, 1,
0.4268621, 0.858079, -0.5486049, 1, 0, 0, 1, 1,
0.4272288, -0.6201862, 3.770512, 1, 0, 0, 1, 1,
0.4276923, -0.2161919, 3.818094, 1, 0, 0, 1, 1,
0.4349279, -1.260014, 4.84944, 1, 0, 0, 1, 1,
0.4365429, 0.3657447, 0.2588238, 0, 0, 0, 1, 1,
0.4402232, 0.9771863, 0.1354614, 0, 0, 0, 1, 1,
0.4412442, 0.08372332, 1.272725, 0, 0, 0, 1, 1,
0.4413285, -0.1861928, 2.066199, 0, 0, 0, 1, 1,
0.4416568, -0.6607032, 1.928354, 0, 0, 0, 1, 1,
0.4416749, 0.5240003, 1.637175, 0, 0, 0, 1, 1,
0.4423446, -0.6752176, 1.946328, 0, 0, 0, 1, 1,
0.4435237, 1.542803, -1.127517, 1, 1, 1, 1, 1,
0.4440788, 0.873271, 0.1081924, 1, 1, 1, 1, 1,
0.4479247, -1.316166, 4.563036, 1, 1, 1, 1, 1,
0.4563147, -0.2335114, 1.514767, 1, 1, 1, 1, 1,
0.4571121, 0.8488145, 0.8360905, 1, 1, 1, 1, 1,
0.4587811, 1.421941, 1.178215, 1, 1, 1, 1, 1,
0.4631877, 0.26532, 1.109825, 1, 1, 1, 1, 1,
0.4634769, -0.2134601, 1.870655, 1, 1, 1, 1, 1,
0.4649949, 0.06649055, 0.4895407, 1, 1, 1, 1, 1,
0.4655162, 0.2811401, 1.794453, 1, 1, 1, 1, 1,
0.4668983, -0.1904194, 2.218943, 1, 1, 1, 1, 1,
0.4673316, 2.278794, 1.046006, 1, 1, 1, 1, 1,
0.4701577, -1.315258, 2.103975, 1, 1, 1, 1, 1,
0.4720423, -0.3357703, 2.416762, 1, 1, 1, 1, 1,
0.4740365, -0.01212179, 1.170779, 1, 1, 1, 1, 1,
0.4742929, -0.527409, 2.73318, 0, 0, 1, 1, 1,
0.474349, 0.3166117, 1.818447, 1, 0, 0, 1, 1,
0.4755161, 0.5480574, 1.304261, 1, 0, 0, 1, 1,
0.4791729, 0.6304411, 0.6947042, 1, 0, 0, 1, 1,
0.4813842, -1.341059, 1.329537, 1, 0, 0, 1, 1,
0.4842266, -0.3883504, 1.388164, 1, 0, 0, 1, 1,
0.4872643, -0.07097356, 0.8636683, 0, 0, 0, 1, 1,
0.4900991, -1.028628, 4.371317, 0, 0, 0, 1, 1,
0.4998077, -0.3359838, 3.853627, 0, 0, 0, 1, 1,
0.5031056, 0.2536137, 0.9842575, 0, 0, 0, 1, 1,
0.510302, -1.428029, 1.800627, 0, 0, 0, 1, 1,
0.5103726, 1.066087, -0.5633763, 0, 0, 0, 1, 1,
0.5117409, -0.4306, 4.920422, 0, 0, 0, 1, 1,
0.5139815, 1.063207, 0.3985698, 1, 1, 1, 1, 1,
0.5142637, -0.1166066, 1.765095, 1, 1, 1, 1, 1,
0.5147455, 1.967647, -0.8143652, 1, 1, 1, 1, 1,
0.5189916, -0.009899456, 2.078876, 1, 1, 1, 1, 1,
0.5231806, -0.4539238, 2.680034, 1, 1, 1, 1, 1,
0.5242891, 0.9316018, -0.934648, 1, 1, 1, 1, 1,
0.5271847, -1.641165, 4.436825, 1, 1, 1, 1, 1,
0.5283114, 0.1032898, 1.181386, 1, 1, 1, 1, 1,
0.5293633, 0.7075585, 1.794359, 1, 1, 1, 1, 1,
0.5310537, -0.7305748, 3.162336, 1, 1, 1, 1, 1,
0.534358, -0.03839152, 1.053626, 1, 1, 1, 1, 1,
0.5449973, -1.118877, 0.784392, 1, 1, 1, 1, 1,
0.5488602, -0.8695453, 2.221262, 1, 1, 1, 1, 1,
0.5531867, 0.9067214, -0.2694657, 1, 1, 1, 1, 1,
0.5597421, -1.522343, -0.08849994, 1, 1, 1, 1, 1,
0.5606565, 0.329344, 0.277412, 0, 0, 1, 1, 1,
0.5619631, 0.2233661, 0.03192348, 1, 0, 0, 1, 1,
0.5628869, 0.6664279, -0.9375629, 1, 0, 0, 1, 1,
0.566736, 1.989312, -0.3986382, 1, 0, 0, 1, 1,
0.5699795, -0.1132966, 2.101386, 1, 0, 0, 1, 1,
0.5767177, 0.3500851, 0.2297565, 1, 0, 0, 1, 1,
0.5776659, 0.2186451, 1.516952, 0, 0, 0, 1, 1,
0.5854166, -0.09339569, 0.6688256, 0, 0, 0, 1, 1,
0.5856652, 0.1556851, 2.550091, 0, 0, 0, 1, 1,
0.5859209, -0.9579269, 2.970497, 0, 0, 0, 1, 1,
0.5870041, -0.5309218, 1.041358, 0, 0, 0, 1, 1,
0.5954742, 0.02252264, 0.9708986, 0, 0, 0, 1, 1,
0.596748, 0.8086828, 0.9855438, 0, 0, 0, 1, 1,
0.5969973, 0.0444934, 2.600721, 1, 1, 1, 1, 1,
0.5970684, 0.5083184, 1.412725, 1, 1, 1, 1, 1,
0.6000783, 0.3049148, 0.5115758, 1, 1, 1, 1, 1,
0.6034617, -0.03214126, 1.906424, 1, 1, 1, 1, 1,
0.6113735, -0.418666, 1.973659, 1, 1, 1, 1, 1,
0.6123242, 0.3135287, 1.591598, 1, 1, 1, 1, 1,
0.612731, 0.9159368, 1.048913, 1, 1, 1, 1, 1,
0.6181784, 0.8254597, 1.895582, 1, 1, 1, 1, 1,
0.6222387, -1.119262, 3.689396, 1, 1, 1, 1, 1,
0.6228356, -0.2786068, 0.8957151, 1, 1, 1, 1, 1,
0.6233009, -0.9339256, 2.108694, 1, 1, 1, 1, 1,
0.6308206, 0.6483094, 1.399538, 1, 1, 1, 1, 1,
0.6308934, -0.617388, 0.8409868, 1, 1, 1, 1, 1,
0.631884, 0.8162199, -0.7689443, 1, 1, 1, 1, 1,
0.6343757, 0.5603637, 0.3582143, 1, 1, 1, 1, 1,
0.6381298, 0.4373998, 1.671317, 0, 0, 1, 1, 1,
0.6386622, -1.557411, 2.326138, 1, 0, 0, 1, 1,
0.6451218, 0.2140691, 1.640354, 1, 0, 0, 1, 1,
0.6458699, 0.5706322, 0.5567306, 1, 0, 0, 1, 1,
0.6487955, 1.922512, 0.1535404, 1, 0, 0, 1, 1,
0.6490165, 0.3029878, 1.723595, 1, 0, 0, 1, 1,
0.6525661, 0.06724452, 0.1890021, 0, 0, 0, 1, 1,
0.657439, 1.423312, 1.218457, 0, 0, 0, 1, 1,
0.6591655, 2.146798, 1.57317, 0, 0, 0, 1, 1,
0.66084, -0.8408966, 2.526144, 0, 0, 0, 1, 1,
0.6673526, 0.2300411, 0.3393158, 0, 0, 0, 1, 1,
0.6724713, 0.1343192, 0.6125194, 0, 0, 0, 1, 1,
0.6749973, 0.4257962, 0.8745635, 0, 0, 0, 1, 1,
0.678492, -3.007039, 0.8030262, 1, 1, 1, 1, 1,
0.6789799, -2.119729, 1.420562, 1, 1, 1, 1, 1,
0.680511, -1.12861, 1.341664, 1, 1, 1, 1, 1,
0.6815416, -1.517748, 2.50474, 1, 1, 1, 1, 1,
0.6841069, -0.4897521, 2.268731, 1, 1, 1, 1, 1,
0.6862623, 1.02326, 0.7882549, 1, 1, 1, 1, 1,
0.68752, -0.01635238, -0.4686176, 1, 1, 1, 1, 1,
0.6884164, 1.391193, 0.8783601, 1, 1, 1, 1, 1,
0.6887464, 1.336008, 0.4163328, 1, 1, 1, 1, 1,
0.6896073, 0.8704029, 1.657231, 1, 1, 1, 1, 1,
0.6913752, 0.005959242, 1.342386, 1, 1, 1, 1, 1,
0.69559, 0.7718101, 1.670148, 1, 1, 1, 1, 1,
0.7018439, 1.457702, -0.8686363, 1, 1, 1, 1, 1,
0.7030187, 0.06534181, 0.8534474, 1, 1, 1, 1, 1,
0.7053592, 3.448729, -1.514171, 1, 1, 1, 1, 1,
0.7121723, 0.993839, 1.288732, 0, 0, 1, 1, 1,
0.7122693, 1.064097, -1.125801, 1, 0, 0, 1, 1,
0.7148547, -0.3250689, 1.89649, 1, 0, 0, 1, 1,
0.7221846, -0.9302775, 4.017402, 1, 0, 0, 1, 1,
0.7224853, -0.5546619, 1.700955, 1, 0, 0, 1, 1,
0.7251724, 0.9083318, 1.022687, 1, 0, 0, 1, 1,
0.7260246, -0.6623389, 2.681418, 0, 0, 0, 1, 1,
0.7316994, 0.4882536, 1.152753, 0, 0, 0, 1, 1,
0.7317749, 1.007153, 1.684767, 0, 0, 0, 1, 1,
0.7340329, -0.179058, 2.679176, 0, 0, 0, 1, 1,
0.7377287, 1.639911, 0.8870584, 0, 0, 0, 1, 1,
0.7400251, -1.901965, 4.189044, 0, 0, 0, 1, 1,
0.7468913, -0.8755597, 1.756829, 0, 0, 0, 1, 1,
0.7582211, 1.169882, 0.5523805, 1, 1, 1, 1, 1,
0.7585849, -1.084972, 3.586095, 1, 1, 1, 1, 1,
0.7611986, 0.4416009, 0.8524899, 1, 1, 1, 1, 1,
0.7629595, 0.9779187, 0.3823008, 1, 1, 1, 1, 1,
0.7669086, -0.1390948, 3.258629, 1, 1, 1, 1, 1,
0.7740678, 0.6916107, 1.787885, 1, 1, 1, 1, 1,
0.7795292, 0.3049394, 1.129798, 1, 1, 1, 1, 1,
0.7807186, -1.037393, 2.889238, 1, 1, 1, 1, 1,
0.783903, 2.296376, 0.0483097, 1, 1, 1, 1, 1,
0.7874832, 1.425056, 0.9671103, 1, 1, 1, 1, 1,
0.7910581, -0.8890018, 2.127719, 1, 1, 1, 1, 1,
0.7916943, 1.560579, -0.8538272, 1, 1, 1, 1, 1,
0.7931901, -0.1472663, 2.169188, 1, 1, 1, 1, 1,
0.7936842, 0.2570471, -0.5931566, 1, 1, 1, 1, 1,
0.8031725, 0.6680469, 0.8401682, 1, 1, 1, 1, 1,
0.8159192, -0.9514688, 2.490727, 0, 0, 1, 1, 1,
0.8186709, 1.041897, 1.084178, 1, 0, 0, 1, 1,
0.8196281, 1.216151, 1.262483, 1, 0, 0, 1, 1,
0.8196557, -0.3687701, 1.600979, 1, 0, 0, 1, 1,
0.820257, -0.489193, 3.081566, 1, 0, 0, 1, 1,
0.8258185, 0.7157072, 0.9345139, 1, 0, 0, 1, 1,
0.8261227, -0.1090185, 0.7472707, 0, 0, 0, 1, 1,
0.8284515, 1.866131, -0.9626957, 0, 0, 0, 1, 1,
0.834817, 1.554249, 0.1626793, 0, 0, 0, 1, 1,
0.8440074, -1.166781, 1.280633, 0, 0, 0, 1, 1,
0.8444998, -0.8491921, 1.583444, 0, 0, 0, 1, 1,
0.8445209, -0.04555457, 1.506559, 0, 0, 0, 1, 1,
0.845183, -1.706696, 2.830632, 0, 0, 0, 1, 1,
0.8456786, -1.299895, 2.880446, 1, 1, 1, 1, 1,
0.8464183, 0.02317509, 2.689791, 1, 1, 1, 1, 1,
0.8484561, 0.2709818, 1.225564, 1, 1, 1, 1, 1,
0.8573223, 0.1623556, 1.755982, 1, 1, 1, 1, 1,
0.8579669, -1.646735, 2.626561, 1, 1, 1, 1, 1,
0.8584855, 0.4248081, 1.346204, 1, 1, 1, 1, 1,
0.8590078, 0.6299781, 0.8444148, 1, 1, 1, 1, 1,
0.8590399, 1.224071, -0.1572904, 1, 1, 1, 1, 1,
0.8595513, -0.3024706, 0.4600425, 1, 1, 1, 1, 1,
0.8635815, -0.7176024, 1.213971, 1, 1, 1, 1, 1,
0.8648078, 0.1261647, 1.355907, 1, 1, 1, 1, 1,
0.8663924, 0.1313135, 2.505666, 1, 1, 1, 1, 1,
0.8718142, 0.5565795, -0.6508345, 1, 1, 1, 1, 1,
0.8774332, -0.8895187, 2.780528, 1, 1, 1, 1, 1,
0.8809355, -0.9501983, 1.632676, 1, 1, 1, 1, 1,
0.8901639, -1.098493, 2.605287, 0, 0, 1, 1, 1,
0.8951036, -0.7069935, 3.462496, 1, 0, 0, 1, 1,
0.899308, 0.9250643, 1.000576, 1, 0, 0, 1, 1,
0.9004184, 0.5909368, 1.908883, 1, 0, 0, 1, 1,
0.9055022, -0.6411121, 1.96937, 1, 0, 0, 1, 1,
0.9105586, 1.779161, 0.2824299, 1, 0, 0, 1, 1,
0.9116664, 1.328274, -0.8126249, 0, 0, 0, 1, 1,
0.9127499, -1.266816, 2.850449, 0, 0, 0, 1, 1,
0.9151393, -0.5920379, 1.15327, 0, 0, 0, 1, 1,
0.9208478, 0.7740357, 0.6312879, 0, 0, 0, 1, 1,
0.9246998, -0.5606756, 1.591444, 0, 0, 0, 1, 1,
0.928417, -0.334757, 1.420897, 0, 0, 0, 1, 1,
0.9439021, -1.03516, 2.889109, 0, 0, 0, 1, 1,
0.9519469, -3.097551, 3.469966, 1, 1, 1, 1, 1,
0.9562975, -0.2263608, 1.220965, 1, 1, 1, 1, 1,
0.9574528, 0.5067593, 1.642109, 1, 1, 1, 1, 1,
0.9622754, 1.344522, -0.311089, 1, 1, 1, 1, 1,
0.964704, -0.4310408, 2.244118, 1, 1, 1, 1, 1,
0.9714418, 1.733415, 1.558241, 1, 1, 1, 1, 1,
0.9723868, 2.027765, -0.06758753, 1, 1, 1, 1, 1,
0.9764495, -0.5618474, 2.13691, 1, 1, 1, 1, 1,
0.9791279, 1.855, 0.0002559659, 1, 1, 1, 1, 1,
0.9815362, 0.4031015, 0.7716634, 1, 1, 1, 1, 1,
0.9971312, -2.282127, 1.325459, 1, 1, 1, 1, 1,
1.003217, 0.9447834, 0.9647777, 1, 1, 1, 1, 1,
1.012047, 0.3980556, 1.354846, 1, 1, 1, 1, 1,
1.028822, -0.8350189, 2.636188, 1, 1, 1, 1, 1,
1.036263, 0.07740565, 1.286538, 1, 1, 1, 1, 1,
1.038457, -0.3623121, 2.125956, 0, 0, 1, 1, 1,
1.039536, 0.7137831, 3.775335, 1, 0, 0, 1, 1,
1.03971, -1.213877, 2.254832, 1, 0, 0, 1, 1,
1.041967, 0.4870129, 0.9418595, 1, 0, 0, 1, 1,
1.042729, -0.8158587, 3.361015, 1, 0, 0, 1, 1,
1.045073, 0.9654146, 1.400727, 1, 0, 0, 1, 1,
1.045523, -0.3088504, 1.254102, 0, 0, 0, 1, 1,
1.050737, 0.05290899, 1.766615, 0, 0, 0, 1, 1,
1.051292, -1.161419, 3.308666, 0, 0, 0, 1, 1,
1.056894, 1.444308, 1.496161, 0, 0, 0, 1, 1,
1.05931, -0.2996624, 4.658406, 0, 0, 0, 1, 1,
1.059807, -0.84351, 2.731575, 0, 0, 0, 1, 1,
1.081331, -0.9357708, 1.478033, 0, 0, 0, 1, 1,
1.083505, -0.439903, 1.743122, 1, 1, 1, 1, 1,
1.0926, -0.3607399, 2.816732, 1, 1, 1, 1, 1,
1.093991, -0.773682, 2.014772, 1, 1, 1, 1, 1,
1.099723, 1.506815, 0.445445, 1, 1, 1, 1, 1,
1.104623, -0.08862795, 1.330748, 1, 1, 1, 1, 1,
1.107838, -1.339, 2.151225, 1, 1, 1, 1, 1,
1.11859, -0.7468683, 1.631055, 1, 1, 1, 1, 1,
1.12736, -0.7680231, 1.937849, 1, 1, 1, 1, 1,
1.127439, -1.034601, 2.532851, 1, 1, 1, 1, 1,
1.130794, 1.253069, -1.057065, 1, 1, 1, 1, 1,
1.136367, 1.548042, 0.1270457, 1, 1, 1, 1, 1,
1.136792, 1.4551, 1.198722, 1, 1, 1, 1, 1,
1.137104, 0.5084676, 0.9260283, 1, 1, 1, 1, 1,
1.13754, -1.180163, 2.052409, 1, 1, 1, 1, 1,
1.140578, 0.7333669, 0.536258, 1, 1, 1, 1, 1,
1.146388, 0.3911416, 0.4926507, 0, 0, 1, 1, 1,
1.148676, -0.3084546, 2.16695, 1, 0, 0, 1, 1,
1.151643, 0.3658516, -1.118021, 1, 0, 0, 1, 1,
1.153219, -0.2117243, 0.7761936, 1, 0, 0, 1, 1,
1.154588, -1.668055, 2.083897, 1, 0, 0, 1, 1,
1.184826, 0.6117741, 2.018052, 1, 0, 0, 1, 1,
1.196346, -1.431168, 1.987405, 0, 0, 0, 1, 1,
1.19981, 0.4776466, -0.1627133, 0, 0, 0, 1, 1,
1.20134, -0.1213709, 2.823546, 0, 0, 0, 1, 1,
1.206314, -0.7778796, 2.605139, 0, 0, 0, 1, 1,
1.207622, -0.02293156, 1.119319, 0, 0, 0, 1, 1,
1.219217, 1.436989, 0.6653299, 0, 0, 0, 1, 1,
1.220357, 0.6829476, 2.079776, 0, 0, 0, 1, 1,
1.230123, -0.433844, 3.204319, 1, 1, 1, 1, 1,
1.23438, 1.073023, 1.418638, 1, 1, 1, 1, 1,
1.237151, 1.074324, 1.081977, 1, 1, 1, 1, 1,
1.256788, 0.963276, -0.09714604, 1, 1, 1, 1, 1,
1.265528, -0.06666403, 0.1973312, 1, 1, 1, 1, 1,
1.269874, 0.7107613, 0.6609098, 1, 1, 1, 1, 1,
1.282087, 1.204025, 1.145878, 1, 1, 1, 1, 1,
1.282337, 2.260005, -0.2229874, 1, 1, 1, 1, 1,
1.286526, -0.7400103, -0.1756125, 1, 1, 1, 1, 1,
1.291219, 1.085575, 1.727426, 1, 1, 1, 1, 1,
1.296313, 0.08305095, 2.728017, 1, 1, 1, 1, 1,
1.307413, 0.1624819, 0.2884253, 1, 1, 1, 1, 1,
1.310215, -1.280249, 2.379822, 1, 1, 1, 1, 1,
1.321527, -1.032915, 2.062546, 1, 1, 1, 1, 1,
1.323473, -0.7188733, 1.85757, 1, 1, 1, 1, 1,
1.325095, -0.4650162, 2.192818, 0, 0, 1, 1, 1,
1.325703, 0.4781034, 1.296691, 1, 0, 0, 1, 1,
1.333912, 0.7103794, 1.172013, 1, 0, 0, 1, 1,
1.334614, 1.820936, -0.3564815, 1, 0, 0, 1, 1,
1.335549, -1.593113, 2.444018, 1, 0, 0, 1, 1,
1.344493, -0.8419999, 2.982847, 1, 0, 0, 1, 1,
1.34526, -1.052667, 2.321214, 0, 0, 0, 1, 1,
1.347033, -0.2555614, 3.021572, 0, 0, 0, 1, 1,
1.355136, 0.3524178, 2.052433, 0, 0, 0, 1, 1,
1.369794, 1.081219, 3.234907, 0, 0, 0, 1, 1,
1.371387, 0.577003, 1.449084, 0, 0, 0, 1, 1,
1.375833, -0.8470345, 3.647452, 0, 0, 0, 1, 1,
1.381163, 0.4423719, 0.4323266, 0, 0, 0, 1, 1,
1.38613, 1.042474, 1.622903, 1, 1, 1, 1, 1,
1.393975, 0.04180358, 0.766557, 1, 1, 1, 1, 1,
1.396686, -0.7357698, 3.125762, 1, 1, 1, 1, 1,
1.397127, 0.241956, 1.574766, 1, 1, 1, 1, 1,
1.410401, 1.603574, 0.9209964, 1, 1, 1, 1, 1,
1.416599, 0.4773968, 1.591496, 1, 1, 1, 1, 1,
1.41767, -1.084665, 3.081839, 1, 1, 1, 1, 1,
1.423712, 1.165918, 1.056277, 1, 1, 1, 1, 1,
1.424847, -1.854617, 2.409099, 1, 1, 1, 1, 1,
1.446732, -1.492256, 0.6731872, 1, 1, 1, 1, 1,
1.451476, -0.2266594, 1.278575, 1, 1, 1, 1, 1,
1.451701, 0.8555197, 2.766177, 1, 1, 1, 1, 1,
1.452121, 0.6254064, 1.306517, 1, 1, 1, 1, 1,
1.452866, 1.489828, -0.4517408, 1, 1, 1, 1, 1,
1.460265, 0.8998789, -0.3621206, 1, 1, 1, 1, 1,
1.473058, -0.02262761, 1.566242, 0, 0, 1, 1, 1,
1.474645, -0.09853213, 1.217845, 1, 0, 0, 1, 1,
1.483194, -0.03484641, 2.871897, 1, 0, 0, 1, 1,
1.496687, 0.7633609, 1.539521, 1, 0, 0, 1, 1,
1.497091, -1.490327, 1.924277, 1, 0, 0, 1, 1,
1.518859, -0.2255688, 1.621359, 1, 0, 0, 1, 1,
1.520041, 0.8201329, 1.958421, 0, 0, 0, 1, 1,
1.526301, 0.09291258, 0.4249807, 0, 0, 0, 1, 1,
1.54512, 0.6201819, 2.103665, 0, 0, 0, 1, 1,
1.545282, -0.03784077, 0.9009444, 0, 0, 0, 1, 1,
1.556891, 0.07092815, 0.9983588, 0, 0, 0, 1, 1,
1.561275, 0.2768006, 0.8579748, 0, 0, 0, 1, 1,
1.562074, -1.343819, 1.08341, 0, 0, 0, 1, 1,
1.565086, -0.6909999, 2.588084, 1, 1, 1, 1, 1,
1.57656, 0.5334901, 0.5542738, 1, 1, 1, 1, 1,
1.58925, 0.9994955, 0.727182, 1, 1, 1, 1, 1,
1.592851, 0.1796338, 1.860138, 1, 1, 1, 1, 1,
1.5956, -1.456728, 0.283365, 1, 1, 1, 1, 1,
1.59717, -0.1802593, 0.8308367, 1, 1, 1, 1, 1,
1.597924, -0.5188562, 1.042375, 1, 1, 1, 1, 1,
1.605, -0.4800768, 0.3033523, 1, 1, 1, 1, 1,
1.605457, 1.466689, 0.9482689, 1, 1, 1, 1, 1,
1.612983, 0.3174033, 1.268388, 1, 1, 1, 1, 1,
1.6275, -0.6998281, 2.578343, 1, 1, 1, 1, 1,
1.639914, 1.323269, 1.37025, 1, 1, 1, 1, 1,
1.650758, 0.8902853, 0.7821496, 1, 1, 1, 1, 1,
1.655784, -0.8584456, 2.485168, 1, 1, 1, 1, 1,
1.65911, 0.5967631, 1.759475, 1, 1, 1, 1, 1,
1.675264, 0.459269, 3.015557, 0, 0, 1, 1, 1,
1.676673, 0.5155714, 2.976589, 1, 0, 0, 1, 1,
1.684576, 0.1386977, 1.488208, 1, 0, 0, 1, 1,
1.688346, 1.397831, 1.42717, 1, 0, 0, 1, 1,
1.694558, 0.8359425, 0.3017597, 1, 0, 0, 1, 1,
1.720991, -0.02205623, 1.124537, 1, 0, 0, 1, 1,
1.723691, -1.870671, 3.129649, 0, 0, 0, 1, 1,
1.755843, -0.2167308, 4.496063, 0, 0, 0, 1, 1,
1.758377, -0.1645218, 1.487937, 0, 0, 0, 1, 1,
1.758776, -1.043698, 1.940904, 0, 0, 0, 1, 1,
1.785199, -0.04109811, 0.6746511, 0, 0, 0, 1, 1,
1.818286, -1.403249, 2.032411, 0, 0, 0, 1, 1,
1.819264, 0.4830723, 1.694808, 0, 0, 0, 1, 1,
1.822635, 1.341052, 2.096324, 1, 1, 1, 1, 1,
1.826795, 0.3546543, 2.580998, 1, 1, 1, 1, 1,
1.84202, -0.4432164, 2.423709, 1, 1, 1, 1, 1,
1.8817, -0.688428, 2.233521, 1, 1, 1, 1, 1,
1.915704, -0.8298499, 2.028088, 1, 1, 1, 1, 1,
1.921264, 0.02383267, 0.8020492, 1, 1, 1, 1, 1,
1.929757, 0.6618912, 0.6803114, 1, 1, 1, 1, 1,
1.936473, 0.2775681, 3.102535, 1, 1, 1, 1, 1,
1.959894, 1.047087, 1.888374, 1, 1, 1, 1, 1,
1.990235, 0.1522835, 2.309989, 1, 1, 1, 1, 1,
2.005105, -1.537116, 2.961779, 1, 1, 1, 1, 1,
2.015736, -0.563968, 3.1329, 1, 1, 1, 1, 1,
2.02851, -1.338336, 2.827677, 1, 1, 1, 1, 1,
2.046308, 0.6241462, -0.09989682, 1, 1, 1, 1, 1,
2.058951, -1.14231, 2.724403, 1, 1, 1, 1, 1,
2.115186, -0.80007, 2.543034, 0, 0, 1, 1, 1,
2.139808, -0.1715203, 2.006104, 1, 0, 0, 1, 1,
2.141345, -0.04884975, 1.973498, 1, 0, 0, 1, 1,
2.186807, 0.9131683, 1.67933, 1, 0, 0, 1, 1,
2.194289, -0.38046, 3.141542, 1, 0, 0, 1, 1,
2.195557, -0.1160398, 1.475477, 1, 0, 0, 1, 1,
2.201467, 1.114746, 1.499681, 0, 0, 0, 1, 1,
2.23295, 0.7024459, 3.260258, 0, 0, 0, 1, 1,
2.319603, 1.048462, 1.177064, 0, 0, 0, 1, 1,
2.351193, -0.3036739, 0.8801976, 0, 0, 0, 1, 1,
2.506241, 0.3004321, 2.645561, 0, 0, 0, 1, 1,
2.51337, -0.8531786, 2.187293, 0, 0, 0, 1, 1,
2.527914, -0.09662914, 1.621707, 0, 0, 0, 1, 1,
2.544524, 1.030818, 2.859792, 1, 1, 1, 1, 1,
2.780697, -0.03401376, 1.04338, 1, 1, 1, 1, 1,
2.86773, 2.151017, 0.1948326, 1, 1, 1, 1, 1,
2.937491, 0.08469079, 0.5218117, 1, 1, 1, 1, 1,
2.996908, -0.9211402, 2.962792, 1, 1, 1, 1, 1,
3.159451, 0.7259587, 1.093589, 1, 1, 1, 1, 1,
3.436073, -2.862888, 4.658779, 1, 1, 1, 1, 1
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
var radius = 9.908468;
var distance = 34.80307;
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
mvMatrix.translate( -0.1944156, -0.1755891, 0.1767561 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.80307);
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
