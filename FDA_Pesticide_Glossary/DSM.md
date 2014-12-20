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
-3.034663, -0.02438682, -0.9139388, 1, 0, 0, 1,
-2.840702, -0.8139955, -2.635025, 1, 0.007843138, 0, 1,
-2.80246, -1.255175, -2.027096, 1, 0.01176471, 0, 1,
-2.667961, -0.3377277, -0.6365251, 1, 0.01960784, 0, 1,
-2.656018, -0.030958, -0.5852901, 1, 0.02352941, 0, 1,
-2.635379, 1.372767, 0.3832787, 1, 0.03137255, 0, 1,
-2.489323, -2.869394, -0.2236031, 1, 0.03529412, 0, 1,
-2.390753, 0.397298, -1.704426, 1, 0.04313726, 0, 1,
-2.315593, 0.203105, -2.32836, 1, 0.04705882, 0, 1,
-2.312746, 0.3539482, -2.291698, 1, 0.05490196, 0, 1,
-2.286773, -0.6233484, 0.3216221, 1, 0.05882353, 0, 1,
-2.254014, -1.526116, -2.563888, 1, 0.06666667, 0, 1,
-2.251149, 1.835911, -2.557209, 1, 0.07058824, 0, 1,
-2.238276, -0.2857455, -0.7381329, 1, 0.07843138, 0, 1,
-2.188568, -0.951127, -1.618457, 1, 0.08235294, 0, 1,
-2.159524, -0.1411215, -0.2004908, 1, 0.09019608, 0, 1,
-2.125625, 2.906259, 1.004678, 1, 0.09411765, 0, 1,
-2.110546, -2.628474, -2.16071, 1, 0.1019608, 0, 1,
-2.11007, -0.7647095, -0.9677674, 1, 0.1098039, 0, 1,
-2.107477, -1.557831, -1.871332, 1, 0.1137255, 0, 1,
-2.072217, 1.576691, 0.02654854, 1, 0.1215686, 0, 1,
-2.067616, -0.714634, -3.442095, 1, 0.1254902, 0, 1,
-2.054198, 0.4840325, -2.892467, 1, 0.1333333, 0, 1,
-2.02765, 2.433966, 0.0952617, 1, 0.1372549, 0, 1,
-2.012188, 1.211622, -0.648047, 1, 0.145098, 0, 1,
-2.010715, 0.29629, -1.661532, 1, 0.1490196, 0, 1,
-1.98574, 1.065033, -0.02037397, 1, 0.1568628, 0, 1,
-1.985196, -0.2744818, -0.9275709, 1, 0.1607843, 0, 1,
-1.977537, 0.8125607, -0.2693666, 1, 0.1686275, 0, 1,
-1.968056, -0.2070053, -1.738328, 1, 0.172549, 0, 1,
-1.922985, 0.709488, 0.5834525, 1, 0.1803922, 0, 1,
-1.91524, 0.07988939, -2.987271, 1, 0.1843137, 0, 1,
-1.908641, 0.2975383, -3.081227, 1, 0.1921569, 0, 1,
-1.852631, -1.863104, -2.701845, 1, 0.1960784, 0, 1,
-1.847256, -0.1160648, 1.173104, 1, 0.2039216, 0, 1,
-1.834924, -0.329681, -3.03052, 1, 0.2117647, 0, 1,
-1.810944, -0.4574354, -1.120666, 1, 0.2156863, 0, 1,
-1.806236, -0.924813, -3.709355, 1, 0.2235294, 0, 1,
-1.788519, -0.6861491, -4.269475, 1, 0.227451, 0, 1,
-1.745016, 0.6271188, -3.346145, 1, 0.2352941, 0, 1,
-1.739418, -0.6049449, -1.288405, 1, 0.2392157, 0, 1,
-1.733467, -0.6958187, -0.4270672, 1, 0.2470588, 0, 1,
-1.724275, 0.1065733, -1.020522, 1, 0.2509804, 0, 1,
-1.715193, -0.02297461, -1.928578, 1, 0.2588235, 0, 1,
-1.707665, 0.380004, 0.1423323, 1, 0.2627451, 0, 1,
-1.706041, 0.7003034, -2.992365, 1, 0.2705882, 0, 1,
-1.668265, 0.7636501, -0.9087685, 1, 0.2745098, 0, 1,
-1.667135, 0.8675819, 0.231096, 1, 0.282353, 0, 1,
-1.659018, -0.2420664, -4.346454, 1, 0.2862745, 0, 1,
-1.633312, -0.5686976, -2.158874, 1, 0.2941177, 0, 1,
-1.626222, -1.265204, -3.600667, 1, 0.3019608, 0, 1,
-1.603618, 0.6915504, -0.4872554, 1, 0.3058824, 0, 1,
-1.589041, 0.9801505, 0.06731721, 1, 0.3137255, 0, 1,
-1.561574, -0.5028602, -4.071483, 1, 0.3176471, 0, 1,
-1.556835, 0.1932481, -0.05692681, 1, 0.3254902, 0, 1,
-1.55586, -1.479717, -1.777638, 1, 0.3294118, 0, 1,
-1.548442, -1.189064, -1.400764, 1, 0.3372549, 0, 1,
-1.544759, 0.3710967, -0.7483528, 1, 0.3411765, 0, 1,
-1.52747, 0.5561374, 0.2773632, 1, 0.3490196, 0, 1,
-1.514743, -0.1203094, -2.266944, 1, 0.3529412, 0, 1,
-1.491909, -1.454414, -3.340335, 1, 0.3607843, 0, 1,
-1.477924, -0.1488898, -3.141414, 1, 0.3647059, 0, 1,
-1.465094, 2.258331, -1.403028, 1, 0.372549, 0, 1,
-1.456077, -1.400867, -1.803626, 1, 0.3764706, 0, 1,
-1.445631, 0.5930597, -1.398753, 1, 0.3843137, 0, 1,
-1.445415, 0.1610362, -1.399876, 1, 0.3882353, 0, 1,
-1.443973, 1.545199, 0.0900064, 1, 0.3960784, 0, 1,
-1.434848, 1.560356, -0.2593021, 1, 0.4039216, 0, 1,
-1.432616, -0.7507228, -2.04777, 1, 0.4078431, 0, 1,
-1.43233, -0.02895156, -0.4441577, 1, 0.4156863, 0, 1,
-1.423841, 0.6199862, 0.4712339, 1, 0.4196078, 0, 1,
-1.42269, -0.9173685, -2.068704, 1, 0.427451, 0, 1,
-1.422283, 0.4458184, -0.04420413, 1, 0.4313726, 0, 1,
-1.418649, 0.4819941, -2.220863, 1, 0.4392157, 0, 1,
-1.417581, 0.4211455, -1.43778, 1, 0.4431373, 0, 1,
-1.414806, 0.8786355, -1.275054, 1, 0.4509804, 0, 1,
-1.401076, 0.8143299, 0.3073561, 1, 0.454902, 0, 1,
-1.39964, -0.260156, -1.107863, 1, 0.4627451, 0, 1,
-1.397805, 1.286504, -0.3572834, 1, 0.4666667, 0, 1,
-1.394371, 1.783744, -2.492345, 1, 0.4745098, 0, 1,
-1.38309, -0.5281837, -0.2234499, 1, 0.4784314, 0, 1,
-1.382975, -1.23791, -2.994746, 1, 0.4862745, 0, 1,
-1.348081, -0.4709312, -0.6502065, 1, 0.4901961, 0, 1,
-1.333802, -0.9709257, -1.27342, 1, 0.4980392, 0, 1,
-1.332471, 0.300392, -2.545888, 1, 0.5058824, 0, 1,
-1.326607, 0.517154, -0.6808489, 1, 0.509804, 0, 1,
-1.311228, -0.5163217, -3.257929, 1, 0.5176471, 0, 1,
-1.307027, 0.7705038, -2.302012, 1, 0.5215687, 0, 1,
-1.30344, -0.3505569, -0.5315371, 1, 0.5294118, 0, 1,
-1.298107, -0.2039476, -1.50305, 1, 0.5333334, 0, 1,
-1.296917, -0.9280139, -0.9670957, 1, 0.5411765, 0, 1,
-1.29627, -0.4967132, -1.924823, 1, 0.5450981, 0, 1,
-1.293901, 1.10677, 0.2685216, 1, 0.5529412, 0, 1,
-1.293503, 0.4514793, -0.8172849, 1, 0.5568628, 0, 1,
-1.289992, 1.463265, -0.4551837, 1, 0.5647059, 0, 1,
-1.2844, 1.454409, -0.001472124, 1, 0.5686275, 0, 1,
-1.283626, 0.6057178, -2.697866, 1, 0.5764706, 0, 1,
-1.281506, 0.1018943, -3.306573, 1, 0.5803922, 0, 1,
-1.280236, 1.856526, 0.3716244, 1, 0.5882353, 0, 1,
-1.271897, -0.1223574, -0.6539178, 1, 0.5921569, 0, 1,
-1.270501, 1.513926, -0.8222758, 1, 0.6, 0, 1,
-1.26597, 1.647342, -1.989257, 1, 0.6078432, 0, 1,
-1.256954, 0.2294685, -2.069847, 1, 0.6117647, 0, 1,
-1.254918, 1.518431, 0.5827796, 1, 0.6196079, 0, 1,
-1.253908, -1.03976, -2.632314, 1, 0.6235294, 0, 1,
-1.251335, -0.5566365, -2.089255, 1, 0.6313726, 0, 1,
-1.235537, -0.218, -2.770714, 1, 0.6352941, 0, 1,
-1.218117, 0.3815703, -1.260194, 1, 0.6431373, 0, 1,
-1.198617, -1.537676, -3.35806, 1, 0.6470588, 0, 1,
-1.190748, -1.656848, -2.143591, 1, 0.654902, 0, 1,
-1.185724, 1.810925, 0.9506077, 1, 0.6588235, 0, 1,
-1.183425, -0.2605552, -1.820318, 1, 0.6666667, 0, 1,
-1.165271, 0.4581484, -3.26619, 1, 0.6705883, 0, 1,
-1.1637, 2.24098, -0.8772144, 1, 0.6784314, 0, 1,
-1.150967, 0.3378994, -1.184467, 1, 0.682353, 0, 1,
-1.149819, -0.6502976, -1.487678, 1, 0.6901961, 0, 1,
-1.148858, -0.9423938, -1.665789, 1, 0.6941177, 0, 1,
-1.143547, 1.363058, -2.131767, 1, 0.7019608, 0, 1,
-1.137924, -0.3720299, -1.217186, 1, 0.7098039, 0, 1,
-1.125544, 0.433603, -2.376266, 1, 0.7137255, 0, 1,
-1.117675, 0.2897228, 0.009319638, 1, 0.7215686, 0, 1,
-1.114314, -0.8729068, -2.666887, 1, 0.7254902, 0, 1,
-1.088525, -0.1121954, -0.127405, 1, 0.7333333, 0, 1,
-1.083491, 1.031123, -1.85574, 1, 0.7372549, 0, 1,
-1.082389, -0.6182073, -2.636593, 1, 0.7450981, 0, 1,
-1.074781, -0.3920037, -3.051754, 1, 0.7490196, 0, 1,
-1.074396, -0.4464938, -2.679073, 1, 0.7568628, 0, 1,
-1.073394, -0.6522773, -3.933578, 1, 0.7607843, 0, 1,
-1.068062, -0.4679498, -2.505795, 1, 0.7686275, 0, 1,
-1.064115, -0.8490086, -2.197957, 1, 0.772549, 0, 1,
-1.059114, -1.534457, -1.310561, 1, 0.7803922, 0, 1,
-1.059053, 0.5423745, -2.059924, 1, 0.7843137, 0, 1,
-1.057381, 1.15599, -3.101687, 1, 0.7921569, 0, 1,
-1.055634, 0.961514, 0.316519, 1, 0.7960784, 0, 1,
-1.051152, 1.272506, 0.096203, 1, 0.8039216, 0, 1,
-1.046026, -1.201389, -0.5055186, 1, 0.8117647, 0, 1,
-1.029556, -1.230488, -2.87223, 1, 0.8156863, 0, 1,
-1.028193, -1.605711, -2.304876, 1, 0.8235294, 0, 1,
-1.015346, 1.78864, -0.4100905, 1, 0.827451, 0, 1,
-1.01197, 0.9747179, -1.658921, 1, 0.8352941, 0, 1,
-1.009778, 2.495857, 0.1520224, 1, 0.8392157, 0, 1,
-1.00759, -0.1736142, -1.90663, 1, 0.8470588, 0, 1,
-1.005181, -1.239663, -2.933304, 1, 0.8509804, 0, 1,
-0.9957529, -1.56066, -3.17313, 1, 0.8588235, 0, 1,
-0.9943491, -2.421006, -3.133975, 1, 0.8627451, 0, 1,
-0.9913836, 0.4646954, -0.9955976, 1, 0.8705882, 0, 1,
-0.991039, -1.264414, -2.090199, 1, 0.8745098, 0, 1,
-0.9840544, 0.003837715, -1.295041, 1, 0.8823529, 0, 1,
-0.9807535, 1.510289, 0.9385405, 1, 0.8862745, 0, 1,
-0.977015, 1.21862, -1.817965, 1, 0.8941177, 0, 1,
-0.9768351, 2.043879, 0.06271784, 1, 0.8980392, 0, 1,
-0.9753129, 0.7625723, 0.4157588, 1, 0.9058824, 0, 1,
-0.9741881, 0.9846612, -1.166272, 1, 0.9137255, 0, 1,
-0.9735879, -0.2742836, -2.294992, 1, 0.9176471, 0, 1,
-0.9694489, -1.605566, -2.097372, 1, 0.9254902, 0, 1,
-0.9671148, -0.0714485, -1.829654, 1, 0.9294118, 0, 1,
-0.9649366, -0.5886034, -2.804899, 1, 0.9372549, 0, 1,
-0.962036, -0.1224263, -1.330143, 1, 0.9411765, 0, 1,
-0.9616975, -1.402482, -2.930251, 1, 0.9490196, 0, 1,
-0.9589532, -1.833867, -2.336068, 1, 0.9529412, 0, 1,
-0.9573185, 0.1120085, -0.3862538, 1, 0.9607843, 0, 1,
-0.9559904, -0.3728752, -1.890455, 1, 0.9647059, 0, 1,
-0.9546632, 1.314355, -1.986814, 1, 0.972549, 0, 1,
-0.9508355, -1.145942, -2.148541, 1, 0.9764706, 0, 1,
-0.9497716, 0.651726, -1.160885, 1, 0.9843137, 0, 1,
-0.944103, 1.947861, 1.566268, 1, 0.9882353, 0, 1,
-0.9413955, -0.04242381, -2.364091, 1, 0.9960784, 0, 1,
-0.9399315, -0.5104547, -2.081404, 0.9960784, 1, 0, 1,
-0.9391582, -0.4944611, -2.569424, 0.9921569, 1, 0, 1,
-0.9377374, -0.821807, -2.171599, 0.9843137, 1, 0, 1,
-0.9372979, -1.68064, -2.413774, 0.9803922, 1, 0, 1,
-0.9363265, 0.7463197, -1.282097, 0.972549, 1, 0, 1,
-0.9305922, -0.1680453, -0.7486151, 0.9686275, 1, 0, 1,
-0.9304847, -0.09478399, -3.145717, 0.9607843, 1, 0, 1,
-0.9248496, 0.4638486, -0.06071223, 0.9568627, 1, 0, 1,
-0.9231272, -0.7028751, -2.902374, 0.9490196, 1, 0, 1,
-0.9208779, -1.831237, -3.231533, 0.945098, 1, 0, 1,
-0.8996719, -1.323221, -3.470138, 0.9372549, 1, 0, 1,
-0.8990955, -0.7494252, -3.745197, 0.9333333, 1, 0, 1,
-0.8932555, 0.8027759, -2.077668, 0.9254902, 1, 0, 1,
-0.8928754, -0.4840865, -2.12263, 0.9215686, 1, 0, 1,
-0.8901605, -1.782092, -3.340036, 0.9137255, 1, 0, 1,
-0.885721, -1.446961, -3.476685, 0.9098039, 1, 0, 1,
-0.8825804, -1.63665, -1.215565, 0.9019608, 1, 0, 1,
-0.8768228, -0.1641107, -1.502841, 0.8941177, 1, 0, 1,
-0.8701869, -1.492162, -3.935834, 0.8901961, 1, 0, 1,
-0.8698853, -0.2697487, -2.875774, 0.8823529, 1, 0, 1,
-0.8674091, -0.230069, -1.044753, 0.8784314, 1, 0, 1,
-0.8656842, 0.3623432, -2.942622, 0.8705882, 1, 0, 1,
-0.8635609, 0.8885537, -1.796753, 0.8666667, 1, 0, 1,
-0.8629997, -0.08541995, -1.538103, 0.8588235, 1, 0, 1,
-0.85425, -1.606011, -2.006335, 0.854902, 1, 0, 1,
-0.8538886, 0.008318939, -3.111039, 0.8470588, 1, 0, 1,
-0.8489016, 1.795296, -0.8763293, 0.8431373, 1, 0, 1,
-0.8474901, 0.6342353, -1.111361, 0.8352941, 1, 0, 1,
-0.8377065, 0.9074107, -0.5230711, 0.8313726, 1, 0, 1,
-0.8335682, -0.3455473, -2.69176, 0.8235294, 1, 0, 1,
-0.8332269, 0.3426588, -0.7758929, 0.8196079, 1, 0, 1,
-0.8306014, -0.3502945, -1.166304, 0.8117647, 1, 0, 1,
-0.8280509, -0.2679053, -1.941546, 0.8078431, 1, 0, 1,
-0.827151, -0.986607, -3.343763, 0.8, 1, 0, 1,
-0.8256466, 0.3423623, -1.917062, 0.7921569, 1, 0, 1,
-0.8155453, 1.433441, 0.3744062, 0.7882353, 1, 0, 1,
-0.8152118, -0.2679568, -1.692349, 0.7803922, 1, 0, 1,
-0.8079363, -0.8032255, -2.770386, 0.7764706, 1, 0, 1,
-0.803831, 1.806996, -0.8331032, 0.7686275, 1, 0, 1,
-0.8019875, 0.7149966, 0.6225693, 0.7647059, 1, 0, 1,
-0.8002701, 0.6952936, -1.86748, 0.7568628, 1, 0, 1,
-0.7992293, -0.1724516, -1.984637, 0.7529412, 1, 0, 1,
-0.7988514, 0.3380817, -1.943285, 0.7450981, 1, 0, 1,
-0.7943881, 0.02119233, -1.080666, 0.7411765, 1, 0, 1,
-0.7919164, 0.3678581, 0.8130494, 0.7333333, 1, 0, 1,
-0.7868889, 1.018782, -1.497474, 0.7294118, 1, 0, 1,
-0.7849197, -0.9464955, -0.2126354, 0.7215686, 1, 0, 1,
-0.7817993, 0.4570914, -1.995998, 0.7176471, 1, 0, 1,
-0.7792274, -0.5328529, -2.115811, 0.7098039, 1, 0, 1,
-0.7785681, -0.8712863, -3.246006, 0.7058824, 1, 0, 1,
-0.7778293, 1.517315, 0.2334336, 0.6980392, 1, 0, 1,
-0.7740071, -0.6857764, -2.236225, 0.6901961, 1, 0, 1,
-0.7714518, -1.197552, -3.67165, 0.6862745, 1, 0, 1,
-0.7695071, -1.502523, -3.068684, 0.6784314, 1, 0, 1,
-0.7629899, 1.111181, 0.5791789, 0.6745098, 1, 0, 1,
-0.7567542, -0.8296426, -1.886843, 0.6666667, 1, 0, 1,
-0.7536976, 1.303965, -1.618054, 0.6627451, 1, 0, 1,
-0.7454636, -0.2117447, -1.679814, 0.654902, 1, 0, 1,
-0.7422446, 0.08575249, -2.112513, 0.6509804, 1, 0, 1,
-0.7331971, 2.781786, -1.224976, 0.6431373, 1, 0, 1,
-0.7298195, 0.06164599, -2.374032, 0.6392157, 1, 0, 1,
-0.7258881, 0.3501806, -2.834647, 0.6313726, 1, 0, 1,
-0.7225819, -0.4779719, -2.557354, 0.627451, 1, 0, 1,
-0.7199494, 0.2820865, -1.694831, 0.6196079, 1, 0, 1,
-0.7197972, 1.482132, -0.3374662, 0.6156863, 1, 0, 1,
-0.7182741, -0.03833563, -0.7469262, 0.6078432, 1, 0, 1,
-0.711699, 0.8826041, -1.040311, 0.6039216, 1, 0, 1,
-0.7115221, 0.04127873, -2.336534, 0.5960785, 1, 0, 1,
-0.7090961, -0.4383002, -0.6059955, 0.5882353, 1, 0, 1,
-0.7026822, -0.7032395, -3.183947, 0.5843138, 1, 0, 1,
-0.6980839, 0.5171497, -0.6828536, 0.5764706, 1, 0, 1,
-0.6911832, -0.6324638, -2.281533, 0.572549, 1, 0, 1,
-0.6868677, -1.570155, -0.6402888, 0.5647059, 1, 0, 1,
-0.6840518, 1.16363, -0.1195715, 0.5607843, 1, 0, 1,
-0.6755597, 0.1841904, -1.075209, 0.5529412, 1, 0, 1,
-0.6726858, 0.4518547, -1.693141, 0.5490196, 1, 0, 1,
-0.6658362, -0.9467961, -1.509798, 0.5411765, 1, 0, 1,
-0.6655838, -0.00122706, -2.110235, 0.5372549, 1, 0, 1,
-0.6614801, 1.180242, -0.04109814, 0.5294118, 1, 0, 1,
-0.6610413, 1.329839, -1.709594, 0.5254902, 1, 0, 1,
-0.6598173, -0.1082345, -1.380104, 0.5176471, 1, 0, 1,
-0.6560282, 0.07307882, -1.999759, 0.5137255, 1, 0, 1,
-0.6495386, 0.3514166, -1.286144, 0.5058824, 1, 0, 1,
-0.6420872, 0.2546492, -2.248387, 0.5019608, 1, 0, 1,
-0.6410724, -1.728342, -4.456055, 0.4941176, 1, 0, 1,
-0.63806, 0.1607065, -1.694181, 0.4862745, 1, 0, 1,
-0.6372858, 0.2510603, 0.7192635, 0.4823529, 1, 0, 1,
-0.6356142, -0.3294536, -2.046341, 0.4745098, 1, 0, 1,
-0.6347487, -0.1507419, -1.782377, 0.4705882, 1, 0, 1,
-0.6329204, -1.691792, -2.778864, 0.4627451, 1, 0, 1,
-0.6251485, 1.890209, 0.3963063, 0.4588235, 1, 0, 1,
-0.622717, -0.5478559, -2.670009, 0.4509804, 1, 0, 1,
-0.6212381, -1.44978, -2.686094, 0.4470588, 1, 0, 1,
-0.618229, -0.3051943, -3.10359, 0.4392157, 1, 0, 1,
-0.6173358, 1.472292, -0.1508352, 0.4352941, 1, 0, 1,
-0.6112396, -1.215277, -4.775111, 0.427451, 1, 0, 1,
-0.608057, -1.066889, -2.628318, 0.4235294, 1, 0, 1,
-0.6079972, -1.162266, -3.159237, 0.4156863, 1, 0, 1,
-0.6072091, 1.807214, -0.4496298, 0.4117647, 1, 0, 1,
-0.6065693, -0.3593928, -2.675603, 0.4039216, 1, 0, 1,
-0.6046461, -0.2279949, -3.478464, 0.3960784, 1, 0, 1,
-0.5886728, 1.28641, -1.461632, 0.3921569, 1, 0, 1,
-0.5878157, -0.4749704, -2.164756, 0.3843137, 1, 0, 1,
-0.5763184, 0.09918346, -1.301938, 0.3803922, 1, 0, 1,
-0.57521, 0.9982191, -0.9192109, 0.372549, 1, 0, 1,
-0.574473, -0.3790224, -1.914538, 0.3686275, 1, 0, 1,
-0.571345, -0.3156968, -3.097483, 0.3607843, 1, 0, 1,
-0.570568, -1.67848, -2.672638, 0.3568628, 1, 0, 1,
-0.5664853, 0.7750259, -1.581031, 0.3490196, 1, 0, 1,
-0.5615072, -0.5978353, -2.013223, 0.345098, 1, 0, 1,
-0.5580255, -0.4435945, -1.552421, 0.3372549, 1, 0, 1,
-0.5569375, -0.6086819, -3.860179, 0.3333333, 1, 0, 1,
-0.5537567, -1.328689, -1.8895, 0.3254902, 1, 0, 1,
-0.5514638, -0.06938961, -2.617948, 0.3215686, 1, 0, 1,
-0.5514109, -1.291493, -3.043771, 0.3137255, 1, 0, 1,
-0.5509254, -0.6055808, -1.108791, 0.3098039, 1, 0, 1,
-0.5489447, 1.093618, -0.152542, 0.3019608, 1, 0, 1,
-0.5451818, -0.9132886, -1.355393, 0.2941177, 1, 0, 1,
-0.5425198, 1.705398, 1.651673, 0.2901961, 1, 0, 1,
-0.541314, 1.456136, 0.2026992, 0.282353, 1, 0, 1,
-0.5382077, -1.241144, -2.657832, 0.2784314, 1, 0, 1,
-0.5365811, 0.6039976, -1.301013, 0.2705882, 1, 0, 1,
-0.5355184, -0.2086142, -3.35441, 0.2666667, 1, 0, 1,
-0.5348068, 1.5561, 1.29682, 0.2588235, 1, 0, 1,
-0.5332664, 0.8572186, 0.1506846, 0.254902, 1, 0, 1,
-0.5300689, -0.005440772, -4.530319, 0.2470588, 1, 0, 1,
-0.5222756, -0.3545975, -1.504151, 0.2431373, 1, 0, 1,
-0.5180631, 0.1205446, -0.6386177, 0.2352941, 1, 0, 1,
-0.5141553, -0.08167806, -1.118112, 0.2313726, 1, 0, 1,
-0.5091631, 0.3156613, -0.5663001, 0.2235294, 1, 0, 1,
-0.5076366, 1.509405, 1.026094, 0.2196078, 1, 0, 1,
-0.5068299, 0.1688037, -1.504068, 0.2117647, 1, 0, 1,
-0.5048057, -1.9264, -2.466068, 0.2078431, 1, 0, 1,
-0.5043454, 1.306221, -0.446773, 0.2, 1, 0, 1,
-0.4991306, -1.391443, -2.104933, 0.1921569, 1, 0, 1,
-0.4986745, -1.191295, -4.204633, 0.1882353, 1, 0, 1,
-0.4984514, 0.5412643, -1.043703, 0.1803922, 1, 0, 1,
-0.4908401, -1.015244, -4.757069, 0.1764706, 1, 0, 1,
-0.4902855, -0.7488564, -2.243862, 0.1686275, 1, 0, 1,
-0.4868737, 1.153052, -1.466765, 0.1647059, 1, 0, 1,
-0.4848945, -0.8591297, -2.949942, 0.1568628, 1, 0, 1,
-0.4840702, -1.371423, -5.641662, 0.1529412, 1, 0, 1,
-0.47747, 0.6847901, -1.453837, 0.145098, 1, 0, 1,
-0.4768372, 0.2903085, 0.1037418, 0.1411765, 1, 0, 1,
-0.4754314, -0.3102341, -2.360923, 0.1333333, 1, 0, 1,
-0.4737315, -2.00156, -2.490331, 0.1294118, 1, 0, 1,
-0.4686459, -0.3912921, -0.2496718, 0.1215686, 1, 0, 1,
-0.4581592, -1.288127, -2.152235, 0.1176471, 1, 0, 1,
-0.4521219, -0.3229806, -2.886408, 0.1098039, 1, 0, 1,
-0.4519718, -0.6955045, -0.9427019, 0.1058824, 1, 0, 1,
-0.4472538, 0.8312327, -0.1961288, 0.09803922, 1, 0, 1,
-0.4462747, 0.8228027, 0.1395269, 0.09019608, 1, 0, 1,
-0.4412969, -0.3268291, -2.326814, 0.08627451, 1, 0, 1,
-0.4412081, 0.04367235, -2.5151, 0.07843138, 1, 0, 1,
-0.4404358, 1.364332, -1.011685, 0.07450981, 1, 0, 1,
-0.4383858, -0.6098913, -2.821083, 0.06666667, 1, 0, 1,
-0.4345153, 1.10826, 1.15387, 0.0627451, 1, 0, 1,
-0.4344494, -0.3790434, -2.562176, 0.05490196, 1, 0, 1,
-0.4307324, 0.7471314, 2.113884, 0.05098039, 1, 0, 1,
-0.4304958, -0.1468251, -2.09595, 0.04313726, 1, 0, 1,
-0.4278176, -1.080161, -4.053452, 0.03921569, 1, 0, 1,
-0.4274458, -1.706889, -4.409745, 0.03137255, 1, 0, 1,
-0.4274223, 1.495662, -0.5052442, 0.02745098, 1, 0, 1,
-0.4251657, 0.6420774, -1.455754, 0.01960784, 1, 0, 1,
-0.4216431, -1.73622, -2.600999, 0.01568628, 1, 0, 1,
-0.4188609, 1.055865, -0.1765109, 0.007843138, 1, 0, 1,
-0.4188042, -1.451942, -3.879746, 0.003921569, 1, 0, 1,
-0.4185591, 0.1030906, -1.096333, 0, 1, 0.003921569, 1,
-0.4165672, -0.3308161, -0.006773435, 0, 1, 0.01176471, 1,
-0.414409, -1.61652, -4.32369, 0, 1, 0.01568628, 1,
-0.4135227, 0.4898436, -1.290403, 0, 1, 0.02352941, 1,
-0.4107396, 0.1401283, -0.3747689, 0, 1, 0.02745098, 1,
-0.4093471, -0.9636797, -2.973105, 0, 1, 0.03529412, 1,
-0.4070372, -0.5732269, -1.523737, 0, 1, 0.03921569, 1,
-0.4036584, 2.1947, 0.6378016, 0, 1, 0.04705882, 1,
-0.3966837, -1.190616, -2.508965, 0, 1, 0.05098039, 1,
-0.3960185, 1.034047, 0.6038019, 0, 1, 0.05882353, 1,
-0.3937904, 0.8064446, -0.1703781, 0, 1, 0.0627451, 1,
-0.3917868, -1.801273, -2.41685, 0, 1, 0.07058824, 1,
-0.3911572, -1.844354, -1.74383, 0, 1, 0.07450981, 1,
-0.3898569, -1.238322, -2.893696, 0, 1, 0.08235294, 1,
-0.3886915, -2.384232, -3.403768, 0, 1, 0.08627451, 1,
-0.3863624, 2.667005, 0.1474488, 0, 1, 0.09411765, 1,
-0.3827745, 1.024997, 0.2986487, 0, 1, 0.1019608, 1,
-0.3815854, -0.1818977, -1.966392, 0, 1, 0.1058824, 1,
-0.3815013, -1.002381, -1.500499, 0, 1, 0.1137255, 1,
-0.3802072, -0.2665155, -0.8052652, 0, 1, 0.1176471, 1,
-0.3761985, -0.4407013, -1.168764, 0, 1, 0.1254902, 1,
-0.373762, -0.2716489, -1.557629, 0, 1, 0.1294118, 1,
-0.3706392, -0.4487256, -2.648785, 0, 1, 0.1372549, 1,
-0.3613129, 1.367425, 0.1271935, 0, 1, 0.1411765, 1,
-0.3606948, 0.910419, -0.181693, 0, 1, 0.1490196, 1,
-0.3567068, 0.1376885, -1.050085, 0, 1, 0.1529412, 1,
-0.3566791, -0.2775612, -2.160492, 0, 1, 0.1607843, 1,
-0.3564223, 0.5887338, 0.3090209, 0, 1, 0.1647059, 1,
-0.3523353, 0.3545647, 0.6928109, 0, 1, 0.172549, 1,
-0.3520265, 0.07248075, -3.180841, 0, 1, 0.1764706, 1,
-0.3517768, -1.825451, -2.919547, 0, 1, 0.1843137, 1,
-0.3507333, 1.731517, 0.2276496, 0, 1, 0.1882353, 1,
-0.3502536, -0.8726526, -1.661728, 0, 1, 0.1960784, 1,
-0.3425757, -2.634394, -3.451224, 0, 1, 0.2039216, 1,
-0.3409965, -1.34841, -3.358855, 0, 1, 0.2078431, 1,
-0.3373457, -1.058861, -3.123709, 0, 1, 0.2156863, 1,
-0.3333546, 0.8505023, -0.2022686, 0, 1, 0.2196078, 1,
-0.3327638, -0.5162926, -3.071928, 0, 1, 0.227451, 1,
-0.3326117, -1.351202, -4.91984, 0, 1, 0.2313726, 1,
-0.3324947, 0.4214126, -3.111991, 0, 1, 0.2392157, 1,
-0.3317254, -0.72465, -1.045044, 0, 1, 0.2431373, 1,
-0.3314319, 0.3468897, -1.823497, 0, 1, 0.2509804, 1,
-0.3307296, 0.9795214, 1.275405, 0, 1, 0.254902, 1,
-0.3290519, 0.07009915, -3.000484, 0, 1, 0.2627451, 1,
-0.3286313, -0.08598623, -1.864591, 0, 1, 0.2666667, 1,
-0.3279112, -1.050291, -3.522749, 0, 1, 0.2745098, 1,
-0.3176492, -0.1660463, -3.555023, 0, 1, 0.2784314, 1,
-0.3105671, 0.8398852, -0.6902156, 0, 1, 0.2862745, 1,
-0.3080387, 0.853529, -0.8760383, 0, 1, 0.2901961, 1,
-0.3066511, 2.353489, -0.5543655, 0, 1, 0.2980392, 1,
-0.3059063, 0.2221409, -2.035135, 0, 1, 0.3058824, 1,
-0.3046961, 0.2978634, -0.5743439, 0, 1, 0.3098039, 1,
-0.3014176, -0.3735709, -2.178344, 0, 1, 0.3176471, 1,
-0.2994002, 0.9876016, 1.366867, 0, 1, 0.3215686, 1,
-0.2976602, 0.5361521, 0.7424896, 0, 1, 0.3294118, 1,
-0.2976578, 0.3574921, -1.408581, 0, 1, 0.3333333, 1,
-0.295005, -1.652103, -1.731737, 0, 1, 0.3411765, 1,
-0.2894787, 0.7936751, -0.1804175, 0, 1, 0.345098, 1,
-0.2877972, -0.1098166, -1.209154, 0, 1, 0.3529412, 1,
-0.2836527, -0.6695672, -2.042316, 0, 1, 0.3568628, 1,
-0.2819899, 0.7962513, 0.9275745, 0, 1, 0.3647059, 1,
-0.2817536, 1.206841, -0.3411878, 0, 1, 0.3686275, 1,
-0.2817078, -0.3467945, -3.101126, 0, 1, 0.3764706, 1,
-0.2814858, 1.269431, 0.05356371, 0, 1, 0.3803922, 1,
-0.2788676, 1.12098, -0.8306695, 0, 1, 0.3882353, 1,
-0.2786969, -0.005964135, -1.951068, 0, 1, 0.3921569, 1,
-0.2765402, -1.156498, -2.685996, 0, 1, 0.4, 1,
-0.2719617, -0.08380507, -2.399282, 0, 1, 0.4078431, 1,
-0.2690506, 0.7101957, -0.431179, 0, 1, 0.4117647, 1,
-0.2619523, -0.6827692, -2.680435, 0, 1, 0.4196078, 1,
-0.2617697, -0.2791552, -4.238114, 0, 1, 0.4235294, 1,
-0.2614708, 0.07880735, -0.7882848, 0, 1, 0.4313726, 1,
-0.2568669, -1.63175, -3.93219, 0, 1, 0.4352941, 1,
-0.2429543, -0.3452913, -0.9011915, 0, 1, 0.4431373, 1,
-0.2367643, 1.827189, 1.049342, 0, 1, 0.4470588, 1,
-0.2330907, -2.151998, -2.331716, 0, 1, 0.454902, 1,
-0.2327046, -1.267568, -4.788056, 0, 1, 0.4588235, 1,
-0.2310401, -1.88491, -2.166947, 0, 1, 0.4666667, 1,
-0.2308679, 1.230909, 0.1346491, 0, 1, 0.4705882, 1,
-0.2281705, 0.5919296, -0.1580509, 0, 1, 0.4784314, 1,
-0.2276104, 0.05352672, -1.429984, 0, 1, 0.4823529, 1,
-0.2212134, 0.4123407, 0.9497865, 0, 1, 0.4901961, 1,
-0.220938, 0.781124, -2.018633, 0, 1, 0.4941176, 1,
-0.2207223, -0.2764736, -6.600585, 0, 1, 0.5019608, 1,
-0.2197046, -0.916335, -2.065953, 0, 1, 0.509804, 1,
-0.2192302, 1.256909, 0.7285137, 0, 1, 0.5137255, 1,
-0.2191918, 0.3461342, 1.290157, 0, 1, 0.5215687, 1,
-0.214619, 0.4019949, 1.350533, 0, 1, 0.5254902, 1,
-0.2108579, -1.742833, -2.224065, 0, 1, 0.5333334, 1,
-0.2095671, 1.421078, -2.292838, 0, 1, 0.5372549, 1,
-0.1977214, 0.9558177, 1.386697, 0, 1, 0.5450981, 1,
-0.1967126, -0.1807718, -2.310932, 0, 1, 0.5490196, 1,
-0.1947297, 0.2030896, -1.137843, 0, 1, 0.5568628, 1,
-0.1947245, -1.257535, -4.134248, 0, 1, 0.5607843, 1,
-0.1945841, 1.356432, 0.3911767, 0, 1, 0.5686275, 1,
-0.1927813, 1.341797, -0.3326742, 0, 1, 0.572549, 1,
-0.1893577, 0.1713767, -1.063906, 0, 1, 0.5803922, 1,
-0.1888472, 1.868251, 0.3545043, 0, 1, 0.5843138, 1,
-0.1846243, -0.2523133, -0.8650876, 0, 1, 0.5921569, 1,
-0.1844734, -0.5235593, -2.308563, 0, 1, 0.5960785, 1,
-0.1798843, 0.9094202, -1.711421, 0, 1, 0.6039216, 1,
-0.1740155, -0.2725281, -1.668751, 0, 1, 0.6117647, 1,
-0.166311, 0.2545106, 0.2542034, 0, 1, 0.6156863, 1,
-0.1623723, 0.3390959, 0.9691499, 0, 1, 0.6235294, 1,
-0.1620938, 0.1164602, 0.4875838, 0, 1, 0.627451, 1,
-0.1603901, 2.252851, -0.08149298, 0, 1, 0.6352941, 1,
-0.1586792, 0.9628438, -0.6711776, 0, 1, 0.6392157, 1,
-0.1582033, -0.652771, -2.397605, 0, 1, 0.6470588, 1,
-0.1563534, -0.6830161, -4.445902, 0, 1, 0.6509804, 1,
-0.1551563, 0.8825214, -2.428372, 0, 1, 0.6588235, 1,
-0.1547001, 1.070912, 1.328056, 0, 1, 0.6627451, 1,
-0.1508868, -0.9961109, -1.878197, 0, 1, 0.6705883, 1,
-0.1478724, 0.4588575, -1.440171, 0, 1, 0.6745098, 1,
-0.1478431, 1.573295, -0.3333646, 0, 1, 0.682353, 1,
-0.1466746, 1.598414, 0.3742549, 0, 1, 0.6862745, 1,
-0.1436306, 0.972791, 0.000696157, 0, 1, 0.6941177, 1,
-0.1416899, -0.599132, -2.515381, 0, 1, 0.7019608, 1,
-0.14085, -0.3461671, -3.260952, 0, 1, 0.7058824, 1,
-0.1367953, 0.7594999, -0.5752436, 0, 1, 0.7137255, 1,
-0.1351769, -0.0938801, -2.755135, 0, 1, 0.7176471, 1,
-0.1347287, -2.208276, -1.421234, 0, 1, 0.7254902, 1,
-0.1334253, 1.469344, 0.5372964, 0, 1, 0.7294118, 1,
-0.1304942, -1.592935, -4.217821, 0, 1, 0.7372549, 1,
-0.130404, 0.6450493, -0.3083119, 0, 1, 0.7411765, 1,
-0.1291033, 0.1962267, -0.5987909, 0, 1, 0.7490196, 1,
-0.1281043, 2.035191, -1.077151, 0, 1, 0.7529412, 1,
-0.1216622, 0.5930478, -0.8300319, 0, 1, 0.7607843, 1,
-0.1207265, -0.01999398, -1.622945, 0, 1, 0.7647059, 1,
-0.1137782, 0.4353584, -2.390718, 0, 1, 0.772549, 1,
-0.1117917, 1.111813, -1.194077, 0, 1, 0.7764706, 1,
-0.1107089, -0.1133428, -2.175195, 0, 1, 0.7843137, 1,
-0.1090879, -0.7955921, -3.429001, 0, 1, 0.7882353, 1,
-0.104455, -0.3244455, -2.065782, 0, 1, 0.7960784, 1,
-0.1032358, -1.762616, -3.657805, 0, 1, 0.8039216, 1,
-0.1023805, 0.2132548, -0.2418633, 0, 1, 0.8078431, 1,
-0.1022913, -1.220969, -3.1645, 0, 1, 0.8156863, 1,
-0.09044541, 0.01476687, -1.39016, 0, 1, 0.8196079, 1,
-0.08818309, -1.041682, -4.521944, 0, 1, 0.827451, 1,
-0.08792356, -0.2819145, -3.028812, 0, 1, 0.8313726, 1,
-0.08644155, -1.100728, -3.000262, 0, 1, 0.8392157, 1,
-0.08622634, -0.7215609, 0.2789526, 0, 1, 0.8431373, 1,
-0.08284272, -0.03502331, -2.716697, 0, 1, 0.8509804, 1,
-0.08096566, 0.2747512, 0.07027384, 0, 1, 0.854902, 1,
-0.07887714, -1.842526, -2.656058, 0, 1, 0.8627451, 1,
-0.07732487, -0.4045566, -1.550778, 0, 1, 0.8666667, 1,
-0.07518459, 0.4187078, -1.181211, 0, 1, 0.8745098, 1,
-0.07396577, -0.8718358, -2.188667, 0, 1, 0.8784314, 1,
-0.07385936, -0.3631929, -3.153558, 0, 1, 0.8862745, 1,
-0.07299384, 1.296137, -1.120907, 0, 1, 0.8901961, 1,
-0.07195806, 1.279707, -1.366285, 0, 1, 0.8980392, 1,
-0.07192116, 0.4380608, 0.3857258, 0, 1, 0.9058824, 1,
-0.07092146, -0.1259211, -2.198461, 0, 1, 0.9098039, 1,
-0.07086232, 0.8866826, -1.098546, 0, 1, 0.9176471, 1,
-0.06788515, 1.490754, -0.6684554, 0, 1, 0.9215686, 1,
-0.06664679, 1.588511, -1.239404, 0, 1, 0.9294118, 1,
-0.06336453, 0.006550827, -3.310218, 0, 1, 0.9333333, 1,
-0.06042026, -0.3448322, -2.677229, 0, 1, 0.9411765, 1,
-0.05710988, 0.6862475, -0.4898007, 0, 1, 0.945098, 1,
-0.05564363, -0.4458328, -1.4296, 0, 1, 0.9529412, 1,
-0.05509184, -0.2247618, -2.584566, 0, 1, 0.9568627, 1,
-0.05368319, 1.427605, 0.2911577, 0, 1, 0.9647059, 1,
-0.05225154, -0.1885713, -2.531122, 0, 1, 0.9686275, 1,
-0.04467507, 0.5085182, 0.3742216, 0, 1, 0.9764706, 1,
-0.04436316, -1.342735, -2.08397, 0, 1, 0.9803922, 1,
-0.0434665, 1.418855, 0.8038801, 0, 1, 0.9882353, 1,
-0.03996649, 0.3823068, 1.327109, 0, 1, 0.9921569, 1,
-0.03846432, -0.9753465, -2.832805, 0, 1, 1, 1,
-0.03585287, 0.4045933, -1.777236, 0, 0.9921569, 1, 1,
-0.03422506, 0.3793707, 1.053597, 0, 0.9882353, 1, 1,
-0.0332936, 2.020769, -0.7372234, 0, 0.9803922, 1, 1,
-0.02454061, 0.6440349, 1.393124, 0, 0.9764706, 1, 1,
-0.02337654, -0.5582663, -0.3533637, 0, 0.9686275, 1, 1,
-0.01970205, -0.1045545, -4.091752, 0, 0.9647059, 1, 1,
-0.01865482, 0.9299364, 0.388991, 0, 0.9568627, 1, 1,
-0.01409844, 0.8434872, 0.8500571, 0, 0.9529412, 1, 1,
-0.01142383, -0.1415606, -3.727089, 0, 0.945098, 1, 1,
-0.008900931, -1.211416, -3.375379, 0, 0.9411765, 1, 1,
-0.002288312, 0.5643453, 1.398049, 0, 0.9333333, 1, 1,
-0.002035317, -1.120745, -4.020187, 0, 0.9294118, 1, 1,
-0.0006339337, 1.003343, -0.4107825, 0, 0.9215686, 1, 1,
0.005819187, 0.03146864, -0.7657354, 0, 0.9176471, 1, 1,
0.009207507, 1.033497, -0.5133756, 0, 0.9098039, 1, 1,
0.01470379, 0.2461231, -0.2708597, 0, 0.9058824, 1, 1,
0.01741953, -1.614355, 2.479033, 0, 0.8980392, 1, 1,
0.01847426, 0.4820457, -1.022815, 0, 0.8901961, 1, 1,
0.02537321, 0.6300761, 0.1888055, 0, 0.8862745, 1, 1,
0.02571137, 0.6251856, -0.1635181, 0, 0.8784314, 1, 1,
0.02749922, -0.9546995, 2.290126, 0, 0.8745098, 1, 1,
0.02781111, -0.5396011, 4.051256, 0, 0.8666667, 1, 1,
0.02795491, -0.8720187, 4.794025, 0, 0.8627451, 1, 1,
0.03526054, 0.849346, -1.185181, 0, 0.854902, 1, 1,
0.03739933, 0.630062, -2.003573, 0, 0.8509804, 1, 1,
0.03756381, 0.2015914, 1.409072, 0, 0.8431373, 1, 1,
0.03855874, 0.3654955, -1.054641, 0, 0.8392157, 1, 1,
0.04107653, -1.095479, 3.248734, 0, 0.8313726, 1, 1,
0.04132132, -2.193568, 4.141559, 0, 0.827451, 1, 1,
0.04284534, -0.184817, 3.162317, 0, 0.8196079, 1, 1,
0.04438328, -1.432943, 2.9596, 0, 0.8156863, 1, 1,
0.04701119, -1.318871, 3.930923, 0, 0.8078431, 1, 1,
0.04822313, -1.15903, 1.293544, 0, 0.8039216, 1, 1,
0.05079857, -0.9414809, 2.622254, 0, 0.7960784, 1, 1,
0.05354621, 1.88446, 1.257642, 0, 0.7882353, 1, 1,
0.05426573, -0.1163046, 3.402386, 0, 0.7843137, 1, 1,
0.05886382, 0.7523438, 1.423737, 0, 0.7764706, 1, 1,
0.058892, -0.511293, 4.155848, 0, 0.772549, 1, 1,
0.06145469, -0.8002156, 3.060518, 0, 0.7647059, 1, 1,
0.06160313, -0.6319852, 4.270188, 0, 0.7607843, 1, 1,
0.06210352, 0.811481, 0.07086679, 0, 0.7529412, 1, 1,
0.06355429, -0.2310499, 3.566178, 0, 0.7490196, 1, 1,
0.06881604, -0.2637187, 4.091746, 0, 0.7411765, 1, 1,
0.06893025, 0.1876571, 0.9982525, 0, 0.7372549, 1, 1,
0.06961673, -1.42652, 0.5061895, 0, 0.7294118, 1, 1,
0.07384668, 1.009828, 1.132334, 0, 0.7254902, 1, 1,
0.07415883, 0.2840261, 0.01264123, 0, 0.7176471, 1, 1,
0.07518131, 0.1862399, 0.4200208, 0, 0.7137255, 1, 1,
0.07695018, 0.1166758, 0.9726449, 0, 0.7058824, 1, 1,
0.07729247, -0.0571352, 1.831468, 0, 0.6980392, 1, 1,
0.07885342, 0.2164561, 2.319402, 0, 0.6941177, 1, 1,
0.07890079, 1.655585, -0.2999834, 0, 0.6862745, 1, 1,
0.0794732, -0.1985168, 1.974807, 0, 0.682353, 1, 1,
0.08451995, -0.185604, 2.763763, 0, 0.6745098, 1, 1,
0.08475825, -0.3195597, 3.978873, 0, 0.6705883, 1, 1,
0.08486576, 0.81406, 2.587691, 0, 0.6627451, 1, 1,
0.08632142, -2.103845, 2.981017, 0, 0.6588235, 1, 1,
0.08720175, -1.215899, 2.886751, 0, 0.6509804, 1, 1,
0.08730137, 1.290709, -0.9771286, 0, 0.6470588, 1, 1,
0.08811267, -1.085529, 2.878504, 0, 0.6392157, 1, 1,
0.095942, 1.558334, -0.2632113, 0, 0.6352941, 1, 1,
0.09765512, -0.8365988, 4.376055, 0, 0.627451, 1, 1,
0.09780768, -1.934598, 3.116089, 0, 0.6235294, 1, 1,
0.09822094, 0.9307879, 2.026908, 0, 0.6156863, 1, 1,
0.1017002, 1.865088, -0.701031, 0, 0.6117647, 1, 1,
0.1033746, 1.200477, 0.0365056, 0, 0.6039216, 1, 1,
0.1048782, -1.119597, 3.178985, 0, 0.5960785, 1, 1,
0.105303, -0.7547393, 3.2953, 0, 0.5921569, 1, 1,
0.1088102, -1.472856, 1.704506, 0, 0.5843138, 1, 1,
0.110902, 1.339088, -1.148079, 0, 0.5803922, 1, 1,
0.1131174, -0.1073323, 2.348843, 0, 0.572549, 1, 1,
0.118287, 1.667997, 1.137917, 0, 0.5686275, 1, 1,
0.122456, 0.3125804, 0.5620398, 0, 0.5607843, 1, 1,
0.1239743, -0.9064875, 4.289061, 0, 0.5568628, 1, 1,
0.124061, 1.236367, 1.069695, 0, 0.5490196, 1, 1,
0.1254117, 1.314108, 1.152324, 0, 0.5450981, 1, 1,
0.1275984, 1.585846, -0.5841076, 0, 0.5372549, 1, 1,
0.1276474, -1.785119, 3.486323, 0, 0.5333334, 1, 1,
0.1285651, -0.08023515, 3.502166, 0, 0.5254902, 1, 1,
0.143153, -0.9695469, 3.413794, 0, 0.5215687, 1, 1,
0.1432263, -0.9657258, 0.7798492, 0, 0.5137255, 1, 1,
0.1435959, 0.809048, 0.1295106, 0, 0.509804, 1, 1,
0.1451304, 1.267951, -1.238796, 0, 0.5019608, 1, 1,
0.1536638, -0.368466, 2.301103, 0, 0.4941176, 1, 1,
0.1561126, 1.392941, 0.1558175, 0, 0.4901961, 1, 1,
0.1561146, -0.2876864, 2.814274, 0, 0.4823529, 1, 1,
0.1581049, -0.4039827, 3.296305, 0, 0.4784314, 1, 1,
0.1718029, -0.7161431, 5.386492, 0, 0.4705882, 1, 1,
0.1733383, -0.8429592, 3.102442, 0, 0.4666667, 1, 1,
0.1792745, -1.764094, 2.477566, 0, 0.4588235, 1, 1,
0.1795546, 0.3145598, -1.237947, 0, 0.454902, 1, 1,
0.1809213, -1.037238, 3.48613, 0, 0.4470588, 1, 1,
0.1815832, 0.1623638, -0.7813908, 0, 0.4431373, 1, 1,
0.1834556, 1.281977, -1.644895, 0, 0.4352941, 1, 1,
0.1869856, 0.7445961, -0.1704439, 0, 0.4313726, 1, 1,
0.187669, -1.311395, 3.097194, 0, 0.4235294, 1, 1,
0.1907955, -1.601756, 4.023205, 0, 0.4196078, 1, 1,
0.1926286, 0.3957701, 0.2201262, 0, 0.4117647, 1, 1,
0.1955332, 1.348522, 0.1153975, 0, 0.4078431, 1, 1,
0.1981902, -1.244068, 2.926852, 0, 0.4, 1, 1,
0.2010764, -0.6982022, 3.951641, 0, 0.3921569, 1, 1,
0.2072274, 0.5397264, -2.424655, 0, 0.3882353, 1, 1,
0.2090227, -1.181002, 3.745836, 0, 0.3803922, 1, 1,
0.2122714, -1.676676, 3.103988, 0, 0.3764706, 1, 1,
0.214867, 0.3392138, 0.1536648, 0, 0.3686275, 1, 1,
0.2150179, 0.7624201, 0.3471788, 0, 0.3647059, 1, 1,
0.2159083, 0.6494243, 0.6320564, 0, 0.3568628, 1, 1,
0.2159598, -1.319556, 2.311804, 0, 0.3529412, 1, 1,
0.216705, -1.227475, 2.222662, 0, 0.345098, 1, 1,
0.2201441, -1.231655, 0.8504805, 0, 0.3411765, 1, 1,
0.2222911, -0.3498875, 4.353834, 0, 0.3333333, 1, 1,
0.2263597, 0.01870222, 1.384944, 0, 0.3294118, 1, 1,
0.2268451, -0.5468815, 2.924126, 0, 0.3215686, 1, 1,
0.2295996, 0.1244302, 2.6432, 0, 0.3176471, 1, 1,
0.2304994, 0.1579309, -0.1971326, 0, 0.3098039, 1, 1,
0.2311529, 0.7877173, 1.080493, 0, 0.3058824, 1, 1,
0.2354478, -1.178148, 2.988955, 0, 0.2980392, 1, 1,
0.2376, 0.9754012, -0.9518209, 0, 0.2901961, 1, 1,
0.2425843, -0.8355689, 2.28003, 0, 0.2862745, 1, 1,
0.2449859, 0.03012019, 1.907636, 0, 0.2784314, 1, 1,
0.2471987, -0.2706398, 3.343123, 0, 0.2745098, 1, 1,
0.2484132, -0.7565426, 1.399523, 0, 0.2666667, 1, 1,
0.2520762, 0.323931, 1.12789, 0, 0.2627451, 1, 1,
0.2538852, -0.1447802, 3.078962, 0, 0.254902, 1, 1,
0.257964, -0.6891735, 1.890138, 0, 0.2509804, 1, 1,
0.2582946, 2.209495, -0.08364709, 0, 0.2431373, 1, 1,
0.2628712, 1.65638, -0.7098904, 0, 0.2392157, 1, 1,
0.2636827, -1.375217, 2.798509, 0, 0.2313726, 1, 1,
0.2673252, -1.369801, 3.82011, 0, 0.227451, 1, 1,
0.2780966, 0.1920189, 0.1246243, 0, 0.2196078, 1, 1,
0.2895181, 0.1294858, 1.788976, 0, 0.2156863, 1, 1,
0.2943495, -0.7619419, 0.3146831, 0, 0.2078431, 1, 1,
0.2961074, 0.3467845, -1.252756, 0, 0.2039216, 1, 1,
0.2993689, 1.665829, 0.2960604, 0, 0.1960784, 1, 1,
0.3001513, -0.4408795, 2.435347, 0, 0.1882353, 1, 1,
0.3005379, 1.198411, 0.04249872, 0, 0.1843137, 1, 1,
0.3006135, -0.6044168, 0.3687236, 0, 0.1764706, 1, 1,
0.3068762, -0.7701595, 4.457773, 0, 0.172549, 1, 1,
0.3075939, 0.464497, 1.065542, 0, 0.1647059, 1, 1,
0.3108517, -1.232975, 3.514505, 0, 0.1607843, 1, 1,
0.316169, -1.341336, 2.59709, 0, 0.1529412, 1, 1,
0.3217416, -1.027898, 3.439125, 0, 0.1490196, 1, 1,
0.3288598, 0.1290176, -0.2212683, 0, 0.1411765, 1, 1,
0.3322994, 0.1627036, 1.911555, 0, 0.1372549, 1, 1,
0.3370903, 0.1908865, 2.297016, 0, 0.1294118, 1, 1,
0.3383389, 0.7449848, 2.204368, 0, 0.1254902, 1, 1,
0.3415233, -1.632137, 2.422875, 0, 0.1176471, 1, 1,
0.3455137, 0.5445859, 0.3539243, 0, 0.1137255, 1, 1,
0.3470105, -0.4411482, 1.232283, 0, 0.1058824, 1, 1,
0.3472499, -1.608904, 4.436035, 0, 0.09803922, 1, 1,
0.3527704, 0.1707086, 0.3989217, 0, 0.09411765, 1, 1,
0.3546433, -0.6524275, 3.524362, 0, 0.08627451, 1, 1,
0.3549218, -0.02195883, 1.487505, 0, 0.08235294, 1, 1,
0.3549234, 0.9135864, 0.4423372, 0, 0.07450981, 1, 1,
0.3559012, 0.4112542, 0.9743626, 0, 0.07058824, 1, 1,
0.3570468, -0.2652419, 3.178176, 0, 0.0627451, 1, 1,
0.3620851, -0.138836, 3.026321, 0, 0.05882353, 1, 1,
0.3635103, -1.623543, 3.434605, 0, 0.05098039, 1, 1,
0.3653339, 1.646979, -0.05180254, 0, 0.04705882, 1, 1,
0.3705773, -0.1632935, 2.097996, 0, 0.03921569, 1, 1,
0.3722675, 0.8068396, -0.3626741, 0, 0.03529412, 1, 1,
0.377154, 1.026802, 0.7587892, 0, 0.02745098, 1, 1,
0.3788178, 0.4123953, -0.05471984, 0, 0.02352941, 1, 1,
0.3840567, -1.190149, 1.799361, 0, 0.01568628, 1, 1,
0.391763, -0.3605025, 1.296895, 0, 0.01176471, 1, 1,
0.3918413, 0.978749, 1.082489, 0, 0.003921569, 1, 1,
0.3955635, -1.198712, 2.399372, 0.003921569, 0, 1, 1,
0.3965349, 0.0208093, 1.198548, 0.007843138, 0, 1, 1,
0.4004787, -0.2703414, 1.644707, 0.01568628, 0, 1, 1,
0.4020827, 0.3503877, 1.35855, 0.01960784, 0, 1, 1,
0.4034879, 1.382083, 0.4072531, 0.02745098, 0, 1, 1,
0.4045476, -0.5139099, 1.774519, 0.03137255, 0, 1, 1,
0.4051022, -0.8752609, 2.07079, 0.03921569, 0, 1, 1,
0.4065863, -0.1995583, 2.013065, 0.04313726, 0, 1, 1,
0.4078919, 1.103519, 1.567643, 0.05098039, 0, 1, 1,
0.4082398, -1.441529, 1.546097, 0.05490196, 0, 1, 1,
0.4103929, -1.596798, 1.933311, 0.0627451, 0, 1, 1,
0.4122454, 0.8631698, 0.7209807, 0.06666667, 0, 1, 1,
0.413059, 0.1231952, 0.6802378, 0.07450981, 0, 1, 1,
0.4135647, -1.732747, 3.674641, 0.07843138, 0, 1, 1,
0.4173481, -0.1559824, 2.564677, 0.08627451, 0, 1, 1,
0.4181865, -1.705344, 3.097809, 0.09019608, 0, 1, 1,
0.4196987, 1.078917, 0.1728307, 0.09803922, 0, 1, 1,
0.4197944, 2.44828, -1.369356, 0.1058824, 0, 1, 1,
0.420034, 0.7066353, 0.7226326, 0.1098039, 0, 1, 1,
0.4229976, -0.1217273, 2.27183, 0.1176471, 0, 1, 1,
0.4230955, -0.8188408, 1.606845, 0.1215686, 0, 1, 1,
0.4231269, -0.3142529, 3.95977, 0.1294118, 0, 1, 1,
0.4231578, -1.094037, 2.691401, 0.1333333, 0, 1, 1,
0.4265857, 0.6780851, 0.4541253, 0.1411765, 0, 1, 1,
0.4281887, -1.259398, 4.520092, 0.145098, 0, 1, 1,
0.4361873, 1.030639, -0.5788134, 0.1529412, 0, 1, 1,
0.4398336, -0.1764785, 2.395825, 0.1568628, 0, 1, 1,
0.4402653, 0.7116934, 1.822683, 0.1647059, 0, 1, 1,
0.4436187, 0.629886, -0.3804102, 0.1686275, 0, 1, 1,
0.4476334, -1.057, 2.195412, 0.1764706, 0, 1, 1,
0.4490421, -0.5966226, 2.461453, 0.1803922, 0, 1, 1,
0.4494626, -0.4750871, 1.367551, 0.1882353, 0, 1, 1,
0.4536816, -0.4370739, 2.048567, 0.1921569, 0, 1, 1,
0.4636048, 0.4202803, 1.296192, 0.2, 0, 1, 1,
0.4637514, 1.054181, -0.2084703, 0.2078431, 0, 1, 1,
0.4669186, -0.6258164, 2.475765, 0.2117647, 0, 1, 1,
0.4717487, -0.2391465, 1.824465, 0.2196078, 0, 1, 1,
0.4819671, 1.117409, -2.382468, 0.2235294, 0, 1, 1,
0.4896949, 2.115036, 4.146255, 0.2313726, 0, 1, 1,
0.4917347, -0.1575572, 0.9019064, 0.2352941, 0, 1, 1,
0.4990372, 0.2798285, 0.3383047, 0.2431373, 0, 1, 1,
0.4991327, -1.906418, 2.767573, 0.2470588, 0, 1, 1,
0.5001798, 0.6452122, 3.000692, 0.254902, 0, 1, 1,
0.5002345, -0.4143681, 1.442761, 0.2588235, 0, 1, 1,
0.5100358, 0.1444289, 1.775025, 0.2666667, 0, 1, 1,
0.510176, 2.135255, 1.40011, 0.2705882, 0, 1, 1,
0.5120791, 0.7625555, 0.3590536, 0.2784314, 0, 1, 1,
0.5137126, 0.3503016, 1.373668, 0.282353, 0, 1, 1,
0.5155953, 1.195039, 0.4834755, 0.2901961, 0, 1, 1,
0.519985, -0.1704677, 0.8287753, 0.2941177, 0, 1, 1,
0.5251125, 1.263404, -0.1095366, 0.3019608, 0, 1, 1,
0.5284813, 1.476319, 2.910612, 0.3098039, 0, 1, 1,
0.529617, 1.573795, 1.569052, 0.3137255, 0, 1, 1,
0.5299709, -0.7502164, 2.878294, 0.3215686, 0, 1, 1,
0.5325001, -1.159377, 1.727589, 0.3254902, 0, 1, 1,
0.5401322, -1.118331, 2.786364, 0.3333333, 0, 1, 1,
0.5408339, 0.0682084, 1.02364, 0.3372549, 0, 1, 1,
0.5415391, 0.4363898, 0.765756, 0.345098, 0, 1, 1,
0.5431464, 0.4357634, 0.5779346, 0.3490196, 0, 1, 1,
0.5475575, -0.005131072, 2.976337, 0.3568628, 0, 1, 1,
0.5481355, 1.444095, 0.4428647, 0.3607843, 0, 1, 1,
0.5492116, -0.3854839, 3.141273, 0.3686275, 0, 1, 1,
0.5494242, -0.278399, 2.31336, 0.372549, 0, 1, 1,
0.5532834, -2.562066, 2.965405, 0.3803922, 0, 1, 1,
0.5694606, -0.1248643, 1.627409, 0.3843137, 0, 1, 1,
0.5704902, -0.3368758, 2.069094, 0.3921569, 0, 1, 1,
0.573743, 0.509693, 0.5595868, 0.3960784, 0, 1, 1,
0.5760248, -1.143499, 2.740206, 0.4039216, 0, 1, 1,
0.5784432, -0.09154162, 0.7953742, 0.4117647, 0, 1, 1,
0.587904, -0.2421606, 0.8678522, 0.4156863, 0, 1, 1,
0.5893314, -0.1409837, 2.138151, 0.4235294, 0, 1, 1,
0.5919189, 0.160904, 1.176612, 0.427451, 0, 1, 1,
0.594649, 0.6334107, 0.7460412, 0.4352941, 0, 1, 1,
0.6050906, 0.440614, -0.5349252, 0.4392157, 0, 1, 1,
0.606649, -1.039742, 3.951812, 0.4470588, 0, 1, 1,
0.6125026, -0.6453133, 1.744449, 0.4509804, 0, 1, 1,
0.6126156, 0.388883, 2.48714, 0.4588235, 0, 1, 1,
0.6134464, 0.3450781, 0.6603242, 0.4627451, 0, 1, 1,
0.6187118, 0.8847925, 0.1786706, 0.4705882, 0, 1, 1,
0.6198876, -0.6808062, 3.397989, 0.4745098, 0, 1, 1,
0.6200967, 0.1657147, 2.058822, 0.4823529, 0, 1, 1,
0.6203107, -0.8488539, 2.994557, 0.4862745, 0, 1, 1,
0.6246102, -0.1677783, 3.598794, 0.4941176, 0, 1, 1,
0.6254238, 1.692904, -1.196107, 0.5019608, 0, 1, 1,
0.6260561, 1.264677, -1.486076, 0.5058824, 0, 1, 1,
0.628298, -0.0006907864, 0.4776979, 0.5137255, 0, 1, 1,
0.6285401, 0.004396234, 2.686839, 0.5176471, 0, 1, 1,
0.6343732, -2.046759, 5.085763, 0.5254902, 0, 1, 1,
0.6378169, -1.045132, 1.485343, 0.5294118, 0, 1, 1,
0.6384099, -0.2181355, 1.447828, 0.5372549, 0, 1, 1,
0.6416276, 1.159854, 0.2085162, 0.5411765, 0, 1, 1,
0.644736, 0.6236236, 2.290963, 0.5490196, 0, 1, 1,
0.6462412, -0.3941029, 1.908793, 0.5529412, 0, 1, 1,
0.6466191, -0.08493212, 1.599906, 0.5607843, 0, 1, 1,
0.6476788, 0.1389177, 1.419859, 0.5647059, 0, 1, 1,
0.6501461, -0.3147839, 2.843193, 0.572549, 0, 1, 1,
0.6532977, -0.6237943, 2.281516, 0.5764706, 0, 1, 1,
0.6581463, -1.590605, 2.085683, 0.5843138, 0, 1, 1,
0.6630956, 1.580989, -0.1654094, 0.5882353, 0, 1, 1,
0.6688351, -0.07891952, -0.1755808, 0.5960785, 0, 1, 1,
0.6735311, 1.140254, -0.5540819, 0.6039216, 0, 1, 1,
0.6747514, 0.05013878, 1.368674, 0.6078432, 0, 1, 1,
0.6754189, 0.6078849, 1.363505, 0.6156863, 0, 1, 1,
0.675507, 0.1358959, 1.770706, 0.6196079, 0, 1, 1,
0.6791494, 0.564604, 1.466516, 0.627451, 0, 1, 1,
0.6848458, 0.6204087, 0.1806781, 0.6313726, 0, 1, 1,
0.6865402, 0.5182734, 1.443308, 0.6392157, 0, 1, 1,
0.689737, 0.05079958, 1.27739, 0.6431373, 0, 1, 1,
0.6920392, 0.4858388, 1.430042, 0.6509804, 0, 1, 1,
0.6942447, -1.212704, 2.103569, 0.654902, 0, 1, 1,
0.6945538, -1.161746, 3.341365, 0.6627451, 0, 1, 1,
0.7009884, -1.562081, 1.9042, 0.6666667, 0, 1, 1,
0.7087852, -0.6115233, 2.540068, 0.6745098, 0, 1, 1,
0.7175244, 0.8414036, 0.286202, 0.6784314, 0, 1, 1,
0.7187462, -0.2929935, 1.750475, 0.6862745, 0, 1, 1,
0.7229025, -1.088751, 1.481925, 0.6901961, 0, 1, 1,
0.7370625, -0.1920533, 1.27895, 0.6980392, 0, 1, 1,
0.7392476, 0.1914123, 0.8650328, 0.7058824, 0, 1, 1,
0.7397156, -0.7573715, 1.391055, 0.7098039, 0, 1, 1,
0.7519106, -0.5388365, 0.6796972, 0.7176471, 0, 1, 1,
0.761665, -0.6644039, 2.203916, 0.7215686, 0, 1, 1,
0.7644363, -0.4555469, 3.362677, 0.7294118, 0, 1, 1,
0.7696424, 0.5939366, 0.06725211, 0.7333333, 0, 1, 1,
0.7704605, -0.5539187, 2.080939, 0.7411765, 0, 1, 1,
0.7718756, 2.49594, 0.3278541, 0.7450981, 0, 1, 1,
0.7733099, -0.007599452, 2.460411, 0.7529412, 0, 1, 1,
0.7736979, 1.760526, 1.175818, 0.7568628, 0, 1, 1,
0.7786547, 1.446931, 1.427763, 0.7647059, 0, 1, 1,
0.7799936, 0.868355, 1.138411, 0.7686275, 0, 1, 1,
0.7813725, 0.9833655, -0.8143182, 0.7764706, 0, 1, 1,
0.781629, 1.021803, -1.045238, 0.7803922, 0, 1, 1,
0.7829902, -0.4995676, 2.515236, 0.7882353, 0, 1, 1,
0.7830459, -0.166516, 2.698166, 0.7921569, 0, 1, 1,
0.7881387, 0.4494946, 0.3056992, 0.8, 0, 1, 1,
0.7894283, 1.204626, 3.048677, 0.8078431, 0, 1, 1,
0.7905414, -0.7492831, 1.834132, 0.8117647, 0, 1, 1,
0.7959059, -1.650729, 2.126286, 0.8196079, 0, 1, 1,
0.7968736, -1.544525, 1.950384, 0.8235294, 0, 1, 1,
0.7980087, 1.080238, 0.7451587, 0.8313726, 0, 1, 1,
0.7996333, 0.002342172, 0.1062397, 0.8352941, 0, 1, 1,
0.8089161, 0.2101169, 0.1409396, 0.8431373, 0, 1, 1,
0.8199493, 0.8539188, 1.548126, 0.8470588, 0, 1, 1,
0.8226058, 0.1826718, -0.1055121, 0.854902, 0, 1, 1,
0.8283718, 0.5078018, 2.283631, 0.8588235, 0, 1, 1,
0.8314198, 0.36738, 0.9915168, 0.8666667, 0, 1, 1,
0.8348345, 0.4228693, -0.1706352, 0.8705882, 0, 1, 1,
0.8533497, 0.0671286, 0.6602217, 0.8784314, 0, 1, 1,
0.853526, 0.3296803, 1.507458, 0.8823529, 0, 1, 1,
0.8584489, -1.650427, 0.5252673, 0.8901961, 0, 1, 1,
0.8592773, -0.5046846, 2.295594, 0.8941177, 0, 1, 1,
0.8596637, 0.02044294, 2.128374, 0.9019608, 0, 1, 1,
0.8629125, 1.131403, 1.736857, 0.9098039, 0, 1, 1,
0.8711932, -0.8549591, 3.388152, 0.9137255, 0, 1, 1,
0.8728052, -0.8085309, 2.378369, 0.9215686, 0, 1, 1,
0.8784299, 0.4218014, 2.761235, 0.9254902, 0, 1, 1,
0.8793921, -1.098593, 2.316123, 0.9333333, 0, 1, 1,
0.8860814, 0.3706318, 1.39273, 0.9372549, 0, 1, 1,
0.8896296, -0.04753644, 0.4720818, 0.945098, 0, 1, 1,
0.8928209, -1.288657, 1.183922, 0.9490196, 0, 1, 1,
0.9031507, -0.3342272, 2.907311, 0.9568627, 0, 1, 1,
0.9037219, 0.0314042, 3.463225, 0.9607843, 0, 1, 1,
0.9089383, -1.370429, 1.378088, 0.9686275, 0, 1, 1,
0.9265974, 1.378412, 0.8379009, 0.972549, 0, 1, 1,
0.9336444, 0.1020841, 0.001672801, 0.9803922, 0, 1, 1,
0.9422343, 1.632142, 1.468725, 0.9843137, 0, 1, 1,
0.9551104, -0.1112691, 1.655157, 0.9921569, 0, 1, 1,
0.9591581, 1.207196, 1.41026, 0.9960784, 0, 1, 1,
0.9597496, -1.600817, 2.878982, 1, 0, 0.9960784, 1,
0.9614205, 0.2188072, 1.454729, 1, 0, 0.9882353, 1,
0.9653555, -0.4348936, 0.2686917, 1, 0, 0.9843137, 1,
0.9702256, -1.02335, 1.633235, 1, 0, 0.9764706, 1,
0.9817156, 0.2875921, 0.9950108, 1, 0, 0.972549, 1,
0.9851446, -2.303147, 2.537654, 1, 0, 0.9647059, 1,
0.9861677, -0.6197183, 2.292292, 1, 0, 0.9607843, 1,
0.9875529, 0.8895386, -0.4186237, 1, 0, 0.9529412, 1,
0.9944707, -1.286389, 2.367709, 1, 0, 0.9490196, 1,
0.9949777, 0.8110225, -0.9416664, 1, 0, 0.9411765, 1,
1.011676, -2.4285, 2.132417, 1, 0, 0.9372549, 1,
1.034114, 0.796429, 0.8218378, 1, 0, 0.9294118, 1,
1.034248, 0.9408216, 0.5361654, 1, 0, 0.9254902, 1,
1.034504, 0.6169884, 0.2930104, 1, 0, 0.9176471, 1,
1.048705, -0.7575702, 3.038453, 1, 0, 0.9137255, 1,
1.059202, -0.4826064, 2.697684, 1, 0, 0.9058824, 1,
1.060722, 0.6037592, 0.8553371, 1, 0, 0.9019608, 1,
1.063418, 0.685196, 0.03348584, 1, 0, 0.8941177, 1,
1.065371, -0.1731912, 1.344926, 1, 0, 0.8862745, 1,
1.078274, -2.303738, 3.420816, 1, 0, 0.8823529, 1,
1.085339, -1.009073, 3.759866, 1, 0, 0.8745098, 1,
1.086639, 0.7127414, 0.7819323, 1, 0, 0.8705882, 1,
1.088486, 0.05493519, 0.9365163, 1, 0, 0.8627451, 1,
1.098774, -0.1842559, -0.8582044, 1, 0, 0.8588235, 1,
1.103604, -0.4183691, 2.160294, 1, 0, 0.8509804, 1,
1.105409, -1.249783, 2.801098, 1, 0, 0.8470588, 1,
1.112299, -0.9226932, 2.594941, 1, 0, 0.8392157, 1,
1.115486, -0.2857739, 2.84822, 1, 0, 0.8352941, 1,
1.122231, 0.009033939, 2.368456, 1, 0, 0.827451, 1,
1.127669, 0.5845073, 1.88996, 1, 0, 0.8235294, 1,
1.128415, -0.286979, 0.3786098, 1, 0, 0.8156863, 1,
1.138658, -1.029313, 2.488162, 1, 0, 0.8117647, 1,
1.145074, 1.471754, -0.8752652, 1, 0, 0.8039216, 1,
1.147169, 0.7163883, 0.6871804, 1, 0, 0.7960784, 1,
1.154332, -0.3857855, 3.342268, 1, 0, 0.7921569, 1,
1.157739, -1.193282, 1.285051, 1, 0, 0.7843137, 1,
1.163713, -3.046655, 3.217144, 1, 0, 0.7803922, 1,
1.171168, 1.551384, 1.61509, 1, 0, 0.772549, 1,
1.179509, 0.3912557, -0.3077596, 1, 0, 0.7686275, 1,
1.181773, -0.03525163, 1.667146, 1, 0, 0.7607843, 1,
1.198779, 0.2460775, 1.825505, 1, 0, 0.7568628, 1,
1.198943, 0.05134358, 1.74904, 1, 0, 0.7490196, 1,
1.201319, 0.00463827, 0.965996, 1, 0, 0.7450981, 1,
1.203304, 1.913923, 2.179239, 1, 0, 0.7372549, 1,
1.205107, -0.384346, 2.253443, 1, 0, 0.7333333, 1,
1.205848, 0.1447515, 0.1651511, 1, 0, 0.7254902, 1,
1.2102, -1.387285, 1.341564, 1, 0, 0.7215686, 1,
1.211354, -1.233277, 4.024904, 1, 0, 0.7137255, 1,
1.215259, 1.652341, 0.6799693, 1, 0, 0.7098039, 1,
1.21692, -0.4661641, 1.100841, 1, 0, 0.7019608, 1,
1.223876, 0.0527761, 2.155463, 1, 0, 0.6941177, 1,
1.228015, -2.102055, 2.378256, 1, 0, 0.6901961, 1,
1.233974, 0.07807855, 2.599583, 1, 0, 0.682353, 1,
1.238577, 0.1392203, 1.11445, 1, 0, 0.6784314, 1,
1.242279, 0.1472429, 0.3905062, 1, 0, 0.6705883, 1,
1.242566, 1.385415, -0.1244779, 1, 0, 0.6666667, 1,
1.251732, 1.485291, -0.524837, 1, 0, 0.6588235, 1,
1.267703, -0.6147918, 1.096621, 1, 0, 0.654902, 1,
1.269779, 0.5904298, -0.2578799, 1, 0, 0.6470588, 1,
1.288118, 0.476193, 1.675585, 1, 0, 0.6431373, 1,
1.303009, 0.072092, -0.5443468, 1, 0, 0.6352941, 1,
1.306056, -1.021855, 0.0532248, 1, 0, 0.6313726, 1,
1.307927, -0.3891756, 2.064229, 1, 0, 0.6235294, 1,
1.311505, 0.70523, 0.5720155, 1, 0, 0.6196079, 1,
1.324989, 0.2374336, 3.111286, 1, 0, 0.6117647, 1,
1.328225, -0.05421178, 3.737899, 1, 0, 0.6078432, 1,
1.328608, 0.1366866, 1.957253, 1, 0, 0.6, 1,
1.332845, -1.134252, 2.503611, 1, 0, 0.5921569, 1,
1.335391, -0.462463, 1.709974, 1, 0, 0.5882353, 1,
1.343869, -1.550176, 3.104547, 1, 0, 0.5803922, 1,
1.352142, -0.4732001, 1.608997, 1, 0, 0.5764706, 1,
1.352187, -1.601238, 4.118195, 1, 0, 0.5686275, 1,
1.36509, -0.4026928, 0.5653356, 1, 0, 0.5647059, 1,
1.375539, -0.09918246, 1.836982, 1, 0, 0.5568628, 1,
1.391429, 0.4825322, 1.719557, 1, 0, 0.5529412, 1,
1.39596, -1.461138, 3.075207, 1, 0, 0.5450981, 1,
1.396027, 1.534699, 1.544762, 1, 0, 0.5411765, 1,
1.396532, 0.4463988, 0.7896217, 1, 0, 0.5333334, 1,
1.400574, 0.1186075, 1.104918, 1, 0, 0.5294118, 1,
1.403873, -2.040192, 1.940147, 1, 0, 0.5215687, 1,
1.412212, -1.783434, 3.634696, 1, 0, 0.5176471, 1,
1.428435, -1.012254, 1.328013, 1, 0, 0.509804, 1,
1.432825, -0.5259132, 1.180283, 1, 0, 0.5058824, 1,
1.435936, 2.650403, 0.4969455, 1, 0, 0.4980392, 1,
1.442904, 0.6772321, 2.53875, 1, 0, 0.4901961, 1,
1.44374, -0.9694743, 1.296842, 1, 0, 0.4862745, 1,
1.446922, 0.4726458, 0.65056, 1, 0, 0.4784314, 1,
1.453059, -0.936993, 3.014459, 1, 0, 0.4745098, 1,
1.458111, -0.3006053, 0.228491, 1, 0, 0.4666667, 1,
1.487824, -0.5702653, 2.185323, 1, 0, 0.4627451, 1,
1.491472, -0.09083094, 1.598854, 1, 0, 0.454902, 1,
1.491891, -0.06723055, 1.695553, 1, 0, 0.4509804, 1,
1.501497, 1.040067, 1.813664, 1, 0, 0.4431373, 1,
1.515191, -0.2128511, 1.778864, 1, 0, 0.4392157, 1,
1.515731, -0.2121923, 1.297089, 1, 0, 0.4313726, 1,
1.533002, 0.4415813, 1.205231, 1, 0, 0.427451, 1,
1.559556, -2.725564, 3.129459, 1, 0, 0.4196078, 1,
1.559688, 0.5800988, 0.5436758, 1, 0, 0.4156863, 1,
1.561141, 1.057268, 3.318737, 1, 0, 0.4078431, 1,
1.570894, 0.4084424, -0.2498729, 1, 0, 0.4039216, 1,
1.57925, -1.091791, 2.335143, 1, 0, 0.3960784, 1,
1.583309, 0.07551371, 0.9151813, 1, 0, 0.3882353, 1,
1.584354, 0.2125368, 0.8691403, 1, 0, 0.3843137, 1,
1.616836, 0.8409339, 0.9669173, 1, 0, 0.3764706, 1,
1.628875, 1.090254, -0.6995653, 1, 0, 0.372549, 1,
1.633843, -0.3878995, 2.460461, 1, 0, 0.3647059, 1,
1.648773, 0.140043, 0.3822616, 1, 0, 0.3607843, 1,
1.664693, 0.3697509, 0.3046136, 1, 0, 0.3529412, 1,
1.669903, -0.5186424, 2.434873, 1, 0, 0.3490196, 1,
1.689743, 0.5081779, 1.877737, 1, 0, 0.3411765, 1,
1.696602, 1.036723, 0.268597, 1, 0, 0.3372549, 1,
1.707677, -0.7392327, 2.502024, 1, 0, 0.3294118, 1,
1.709044, 0.2617741, 0.3479379, 1, 0, 0.3254902, 1,
1.718239, 0.6079624, 2.13098, 1, 0, 0.3176471, 1,
1.722156, -0.3194905, 0.3976548, 1, 0, 0.3137255, 1,
1.731227, 0.2989709, 2.15214, 1, 0, 0.3058824, 1,
1.732965, 2.126456, 1.311022, 1, 0, 0.2980392, 1,
1.739879, 0.2681911, -0.3143065, 1, 0, 0.2941177, 1,
1.74317, -0.6678502, 1.091595, 1, 0, 0.2862745, 1,
1.792084, -0.4586537, 1.067682, 1, 0, 0.282353, 1,
1.792943, 1.649017, -1.043532, 1, 0, 0.2745098, 1,
1.795394, -0.9650307, 1.165004, 1, 0, 0.2705882, 1,
1.796132, 0.01888674, 2.614723, 1, 0, 0.2627451, 1,
1.806911, 0.7797601, -0.008195802, 1, 0, 0.2588235, 1,
1.81034, 0.3961078, 2.042387, 1, 0, 0.2509804, 1,
1.833388, -1.241174, 2.206006, 1, 0, 0.2470588, 1,
1.833484, 0.2400538, 1.205811, 1, 0, 0.2392157, 1,
1.847172, -0.3011162, 3.857546, 1, 0, 0.2352941, 1,
1.853228, -0.7900979, 3.043207, 1, 0, 0.227451, 1,
1.862621, -2.856381, 3.586763, 1, 0, 0.2235294, 1,
1.869485, -0.22787, 1.167452, 1, 0, 0.2156863, 1,
1.906201, 1.95464, 1.48341, 1, 0, 0.2117647, 1,
1.909156, 2.4656, 1.540419, 1, 0, 0.2039216, 1,
1.946681, -1.852388, 3.690364, 1, 0, 0.1960784, 1,
1.963979, -0.7229165, 1.977245, 1, 0, 0.1921569, 1,
1.973651, 1.121602, 1.7591, 1, 0, 0.1843137, 1,
1.980836, 0.06222958, -0.9460591, 1, 0, 0.1803922, 1,
1.990301, 0.5777346, 0.8590544, 1, 0, 0.172549, 1,
1.994922, -2.223889, 1.75177, 1, 0, 0.1686275, 1,
2.005203, 0.3242467, 0.9427119, 1, 0, 0.1607843, 1,
2.019257, 0.8459641, 0.9391476, 1, 0, 0.1568628, 1,
2.044689, -0.860821, 3.092193, 1, 0, 0.1490196, 1,
2.12124, -0.3976818, 4.000125, 1, 0, 0.145098, 1,
2.126713, -0.745818, 1.189705, 1, 0, 0.1372549, 1,
2.127634, -0.3661824, -0.9096198, 1, 0, 0.1333333, 1,
2.137662, 1.446492, 0.4582546, 1, 0, 0.1254902, 1,
2.193816, 0.9554104, -0.02927423, 1, 0, 0.1215686, 1,
2.219052, 0.5246439, 0.9257768, 1, 0, 0.1137255, 1,
2.219302, 1.869355, 0.3358472, 1, 0, 0.1098039, 1,
2.222036, -4.134865, 1.342537, 1, 0, 0.1019608, 1,
2.236622, -0.8078263, 2.764692, 1, 0, 0.09411765, 1,
2.238758, 0.6602728, 1.32366, 1, 0, 0.09019608, 1,
2.291645, -0.3491936, 2.504909, 1, 0, 0.08235294, 1,
2.300161, 0.199145, 3.0904, 1, 0, 0.07843138, 1,
2.333319, -0.1676727, 0.2473103, 1, 0, 0.07058824, 1,
2.383382, 0.3201686, 2.837223, 1, 0, 0.06666667, 1,
2.521307, -0.3284593, 2.553378, 1, 0, 0.05882353, 1,
2.593439, -0.9829289, 3.500562, 1, 0, 0.05490196, 1,
2.603654, -1.330275, 1.521683, 1, 0, 0.04705882, 1,
2.616911, 0.9142011, 1.971901, 1, 0, 0.04313726, 1,
2.723853, -1.564494, 2.215618, 1, 0, 0.03529412, 1,
3.35822, -0.323621, 0.7688096, 1, 0, 0.03137255, 1,
3.530998, 1.485616, 1.099913, 1, 0, 0.02352941, 1,
3.624335, -1.627656, 1.121329, 1, 0, 0.01960784, 1,
3.650097, -1.619769, 1.574047, 1, 0, 0.01176471, 1,
3.940216, -0.5455738, 0.1508937, 1, 0, 0.007843138, 1
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
0.4527762, -5.328336, -8.632395, 0, -0.5, 0.5, 0.5,
0.4527762, -5.328336, -8.632395, 1, -0.5, 0.5, 0.5,
0.4527762, -5.328336, -8.632395, 1, 1.5, 0.5, 0.5,
0.4527762, -5.328336, -8.632395, 0, 1.5, 0.5, 0.5
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
-4.216906, -0.6143032, -8.632395, 0, -0.5, 0.5, 0.5,
-4.216906, -0.6143032, -8.632395, 1, -0.5, 0.5, 0.5,
-4.216906, -0.6143032, -8.632395, 1, 1.5, 0.5, 0.5,
-4.216906, -0.6143032, -8.632395, 0, 1.5, 0.5, 0.5
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
-4.216906, -5.328336, -0.6070464, 0, -0.5, 0.5, 0.5,
-4.216906, -5.328336, -0.6070464, 1, -0.5, 0.5, 0.5,
-4.216906, -5.328336, -0.6070464, 1, 1.5, 0.5, 0.5,
-4.216906, -5.328336, -0.6070464, 0, 1.5, 0.5, 0.5
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
-3, -4.240482, -6.780391,
3, -4.240482, -6.780391,
-3, -4.240482, -6.780391,
-3, -4.421791, -7.089058,
-2, -4.240482, -6.780391,
-2, -4.421791, -7.089058,
-1, -4.240482, -6.780391,
-1, -4.421791, -7.089058,
0, -4.240482, -6.780391,
0, -4.421791, -7.089058,
1, -4.240482, -6.780391,
1, -4.421791, -7.089058,
2, -4.240482, -6.780391,
2, -4.421791, -7.089058,
3, -4.240482, -6.780391,
3, -4.421791, -7.089058
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
-3, -4.784409, -7.706393, 0, -0.5, 0.5, 0.5,
-3, -4.784409, -7.706393, 1, -0.5, 0.5, 0.5,
-3, -4.784409, -7.706393, 1, 1.5, 0.5, 0.5,
-3, -4.784409, -7.706393, 0, 1.5, 0.5, 0.5,
-2, -4.784409, -7.706393, 0, -0.5, 0.5, 0.5,
-2, -4.784409, -7.706393, 1, -0.5, 0.5, 0.5,
-2, -4.784409, -7.706393, 1, 1.5, 0.5, 0.5,
-2, -4.784409, -7.706393, 0, 1.5, 0.5, 0.5,
-1, -4.784409, -7.706393, 0, -0.5, 0.5, 0.5,
-1, -4.784409, -7.706393, 1, -0.5, 0.5, 0.5,
-1, -4.784409, -7.706393, 1, 1.5, 0.5, 0.5,
-1, -4.784409, -7.706393, 0, 1.5, 0.5, 0.5,
0, -4.784409, -7.706393, 0, -0.5, 0.5, 0.5,
0, -4.784409, -7.706393, 1, -0.5, 0.5, 0.5,
0, -4.784409, -7.706393, 1, 1.5, 0.5, 0.5,
0, -4.784409, -7.706393, 0, 1.5, 0.5, 0.5,
1, -4.784409, -7.706393, 0, -0.5, 0.5, 0.5,
1, -4.784409, -7.706393, 1, -0.5, 0.5, 0.5,
1, -4.784409, -7.706393, 1, 1.5, 0.5, 0.5,
1, -4.784409, -7.706393, 0, 1.5, 0.5, 0.5,
2, -4.784409, -7.706393, 0, -0.5, 0.5, 0.5,
2, -4.784409, -7.706393, 1, -0.5, 0.5, 0.5,
2, -4.784409, -7.706393, 1, 1.5, 0.5, 0.5,
2, -4.784409, -7.706393, 0, 1.5, 0.5, 0.5,
3, -4.784409, -7.706393, 0, -0.5, 0.5, 0.5,
3, -4.784409, -7.706393, 1, -0.5, 0.5, 0.5,
3, -4.784409, -7.706393, 1, 1.5, 0.5, 0.5,
3, -4.784409, -7.706393, 0, 1.5, 0.5, 0.5
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
-3.139287, -4, -6.780391,
-3.139287, 2, -6.780391,
-3.139287, -4, -6.780391,
-3.31889, -4, -7.089058,
-3.139287, -2, -6.780391,
-3.31889, -2, -7.089058,
-3.139287, 0, -6.780391,
-3.31889, 0, -7.089058,
-3.139287, 2, -6.780391,
-3.31889, 2, -7.089058
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
"-4",
"-2",
"0",
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
-3.678096, -4, -7.706393, 0, -0.5, 0.5, 0.5,
-3.678096, -4, -7.706393, 1, -0.5, 0.5, 0.5,
-3.678096, -4, -7.706393, 1, 1.5, 0.5, 0.5,
-3.678096, -4, -7.706393, 0, 1.5, 0.5, 0.5,
-3.678096, -2, -7.706393, 0, -0.5, 0.5, 0.5,
-3.678096, -2, -7.706393, 1, -0.5, 0.5, 0.5,
-3.678096, -2, -7.706393, 1, 1.5, 0.5, 0.5,
-3.678096, -2, -7.706393, 0, 1.5, 0.5, 0.5,
-3.678096, 0, -7.706393, 0, -0.5, 0.5, 0.5,
-3.678096, 0, -7.706393, 1, -0.5, 0.5, 0.5,
-3.678096, 0, -7.706393, 1, 1.5, 0.5, 0.5,
-3.678096, 0, -7.706393, 0, 1.5, 0.5, 0.5,
-3.678096, 2, -7.706393, 0, -0.5, 0.5, 0.5,
-3.678096, 2, -7.706393, 1, -0.5, 0.5, 0.5,
-3.678096, 2, -7.706393, 1, 1.5, 0.5, 0.5,
-3.678096, 2, -7.706393, 0, 1.5, 0.5, 0.5
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
-3.139287, -4.240482, -6,
-3.139287, -4.240482, 4,
-3.139287, -4.240482, -6,
-3.31889, -4.421791, -6,
-3.139287, -4.240482, -4,
-3.31889, -4.421791, -4,
-3.139287, -4.240482, -2,
-3.31889, -4.421791, -2,
-3.139287, -4.240482, 0,
-3.31889, -4.421791, 0,
-3.139287, -4.240482, 2,
-3.31889, -4.421791, 2,
-3.139287, -4.240482, 4,
-3.31889, -4.421791, 4
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
-3.678096, -4.784409, -6, 0, -0.5, 0.5, 0.5,
-3.678096, -4.784409, -6, 1, -0.5, 0.5, 0.5,
-3.678096, -4.784409, -6, 1, 1.5, 0.5, 0.5,
-3.678096, -4.784409, -6, 0, 1.5, 0.5, 0.5,
-3.678096, -4.784409, -4, 0, -0.5, 0.5, 0.5,
-3.678096, -4.784409, -4, 1, -0.5, 0.5, 0.5,
-3.678096, -4.784409, -4, 1, 1.5, 0.5, 0.5,
-3.678096, -4.784409, -4, 0, 1.5, 0.5, 0.5,
-3.678096, -4.784409, -2, 0, -0.5, 0.5, 0.5,
-3.678096, -4.784409, -2, 1, -0.5, 0.5, 0.5,
-3.678096, -4.784409, -2, 1, 1.5, 0.5, 0.5,
-3.678096, -4.784409, -2, 0, 1.5, 0.5, 0.5,
-3.678096, -4.784409, 0, 0, -0.5, 0.5, 0.5,
-3.678096, -4.784409, 0, 1, -0.5, 0.5, 0.5,
-3.678096, -4.784409, 0, 1, 1.5, 0.5, 0.5,
-3.678096, -4.784409, 0, 0, 1.5, 0.5, 0.5,
-3.678096, -4.784409, 2, 0, -0.5, 0.5, 0.5,
-3.678096, -4.784409, 2, 1, -0.5, 0.5, 0.5,
-3.678096, -4.784409, 2, 1, 1.5, 0.5, 0.5,
-3.678096, -4.784409, 2, 0, 1.5, 0.5, 0.5,
-3.678096, -4.784409, 4, 0, -0.5, 0.5, 0.5,
-3.678096, -4.784409, 4, 1, -0.5, 0.5, 0.5,
-3.678096, -4.784409, 4, 1, 1.5, 0.5, 0.5,
-3.678096, -4.784409, 4, 0, 1.5, 0.5, 0.5
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
-3.139287, -4.240482, -6.780391,
-3.139287, 3.011876, -6.780391,
-3.139287, -4.240482, 5.566298,
-3.139287, 3.011876, 5.566298,
-3.139287, -4.240482, -6.780391,
-3.139287, -4.240482, 5.566298,
-3.139287, 3.011876, -6.780391,
-3.139287, 3.011876, 5.566298,
-3.139287, -4.240482, -6.780391,
4.044839, -4.240482, -6.780391,
-3.139287, -4.240482, 5.566298,
4.044839, -4.240482, 5.566298,
-3.139287, 3.011876, -6.780391,
4.044839, 3.011876, -6.780391,
-3.139287, 3.011876, 5.566298,
4.044839, 3.011876, 5.566298,
4.044839, -4.240482, -6.780391,
4.044839, 3.011876, -6.780391,
4.044839, -4.240482, 5.566298,
4.044839, 3.011876, 5.566298,
4.044839, -4.240482, -6.780391,
4.044839, -4.240482, 5.566298,
4.044839, 3.011876, -6.780391,
4.044839, 3.011876, 5.566298
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
var radius = 8.554514;
var distance = 38.06;
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
mvMatrix.translate( -0.4527762, 0.6143032, 0.6070464 );
mvMatrix.scale( 1.287465, 1.275352, 0.7491326 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.06);
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
DSM<-read.table("DSM.xyz")
```

```
## Error in read.table("DSM.xyz"): no lines available in input
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
-3.034663, -0.02438682, -0.9139388, 0, 0, 1, 1, 1,
-2.840702, -0.8139955, -2.635025, 1, 0, 0, 1, 1,
-2.80246, -1.255175, -2.027096, 1, 0, 0, 1, 1,
-2.667961, -0.3377277, -0.6365251, 1, 0, 0, 1, 1,
-2.656018, -0.030958, -0.5852901, 1, 0, 0, 1, 1,
-2.635379, 1.372767, 0.3832787, 1, 0, 0, 1, 1,
-2.489323, -2.869394, -0.2236031, 0, 0, 0, 1, 1,
-2.390753, 0.397298, -1.704426, 0, 0, 0, 1, 1,
-2.315593, 0.203105, -2.32836, 0, 0, 0, 1, 1,
-2.312746, 0.3539482, -2.291698, 0, 0, 0, 1, 1,
-2.286773, -0.6233484, 0.3216221, 0, 0, 0, 1, 1,
-2.254014, -1.526116, -2.563888, 0, 0, 0, 1, 1,
-2.251149, 1.835911, -2.557209, 0, 0, 0, 1, 1,
-2.238276, -0.2857455, -0.7381329, 1, 1, 1, 1, 1,
-2.188568, -0.951127, -1.618457, 1, 1, 1, 1, 1,
-2.159524, -0.1411215, -0.2004908, 1, 1, 1, 1, 1,
-2.125625, 2.906259, 1.004678, 1, 1, 1, 1, 1,
-2.110546, -2.628474, -2.16071, 1, 1, 1, 1, 1,
-2.11007, -0.7647095, -0.9677674, 1, 1, 1, 1, 1,
-2.107477, -1.557831, -1.871332, 1, 1, 1, 1, 1,
-2.072217, 1.576691, 0.02654854, 1, 1, 1, 1, 1,
-2.067616, -0.714634, -3.442095, 1, 1, 1, 1, 1,
-2.054198, 0.4840325, -2.892467, 1, 1, 1, 1, 1,
-2.02765, 2.433966, 0.0952617, 1, 1, 1, 1, 1,
-2.012188, 1.211622, -0.648047, 1, 1, 1, 1, 1,
-2.010715, 0.29629, -1.661532, 1, 1, 1, 1, 1,
-1.98574, 1.065033, -0.02037397, 1, 1, 1, 1, 1,
-1.985196, -0.2744818, -0.9275709, 1, 1, 1, 1, 1,
-1.977537, 0.8125607, -0.2693666, 0, 0, 1, 1, 1,
-1.968056, -0.2070053, -1.738328, 1, 0, 0, 1, 1,
-1.922985, 0.709488, 0.5834525, 1, 0, 0, 1, 1,
-1.91524, 0.07988939, -2.987271, 1, 0, 0, 1, 1,
-1.908641, 0.2975383, -3.081227, 1, 0, 0, 1, 1,
-1.852631, -1.863104, -2.701845, 1, 0, 0, 1, 1,
-1.847256, -0.1160648, 1.173104, 0, 0, 0, 1, 1,
-1.834924, -0.329681, -3.03052, 0, 0, 0, 1, 1,
-1.810944, -0.4574354, -1.120666, 0, 0, 0, 1, 1,
-1.806236, -0.924813, -3.709355, 0, 0, 0, 1, 1,
-1.788519, -0.6861491, -4.269475, 0, 0, 0, 1, 1,
-1.745016, 0.6271188, -3.346145, 0, 0, 0, 1, 1,
-1.739418, -0.6049449, -1.288405, 0, 0, 0, 1, 1,
-1.733467, -0.6958187, -0.4270672, 1, 1, 1, 1, 1,
-1.724275, 0.1065733, -1.020522, 1, 1, 1, 1, 1,
-1.715193, -0.02297461, -1.928578, 1, 1, 1, 1, 1,
-1.707665, 0.380004, 0.1423323, 1, 1, 1, 1, 1,
-1.706041, 0.7003034, -2.992365, 1, 1, 1, 1, 1,
-1.668265, 0.7636501, -0.9087685, 1, 1, 1, 1, 1,
-1.667135, 0.8675819, 0.231096, 1, 1, 1, 1, 1,
-1.659018, -0.2420664, -4.346454, 1, 1, 1, 1, 1,
-1.633312, -0.5686976, -2.158874, 1, 1, 1, 1, 1,
-1.626222, -1.265204, -3.600667, 1, 1, 1, 1, 1,
-1.603618, 0.6915504, -0.4872554, 1, 1, 1, 1, 1,
-1.589041, 0.9801505, 0.06731721, 1, 1, 1, 1, 1,
-1.561574, -0.5028602, -4.071483, 1, 1, 1, 1, 1,
-1.556835, 0.1932481, -0.05692681, 1, 1, 1, 1, 1,
-1.55586, -1.479717, -1.777638, 1, 1, 1, 1, 1,
-1.548442, -1.189064, -1.400764, 0, 0, 1, 1, 1,
-1.544759, 0.3710967, -0.7483528, 1, 0, 0, 1, 1,
-1.52747, 0.5561374, 0.2773632, 1, 0, 0, 1, 1,
-1.514743, -0.1203094, -2.266944, 1, 0, 0, 1, 1,
-1.491909, -1.454414, -3.340335, 1, 0, 0, 1, 1,
-1.477924, -0.1488898, -3.141414, 1, 0, 0, 1, 1,
-1.465094, 2.258331, -1.403028, 0, 0, 0, 1, 1,
-1.456077, -1.400867, -1.803626, 0, 0, 0, 1, 1,
-1.445631, 0.5930597, -1.398753, 0, 0, 0, 1, 1,
-1.445415, 0.1610362, -1.399876, 0, 0, 0, 1, 1,
-1.443973, 1.545199, 0.0900064, 0, 0, 0, 1, 1,
-1.434848, 1.560356, -0.2593021, 0, 0, 0, 1, 1,
-1.432616, -0.7507228, -2.04777, 0, 0, 0, 1, 1,
-1.43233, -0.02895156, -0.4441577, 1, 1, 1, 1, 1,
-1.423841, 0.6199862, 0.4712339, 1, 1, 1, 1, 1,
-1.42269, -0.9173685, -2.068704, 1, 1, 1, 1, 1,
-1.422283, 0.4458184, -0.04420413, 1, 1, 1, 1, 1,
-1.418649, 0.4819941, -2.220863, 1, 1, 1, 1, 1,
-1.417581, 0.4211455, -1.43778, 1, 1, 1, 1, 1,
-1.414806, 0.8786355, -1.275054, 1, 1, 1, 1, 1,
-1.401076, 0.8143299, 0.3073561, 1, 1, 1, 1, 1,
-1.39964, -0.260156, -1.107863, 1, 1, 1, 1, 1,
-1.397805, 1.286504, -0.3572834, 1, 1, 1, 1, 1,
-1.394371, 1.783744, -2.492345, 1, 1, 1, 1, 1,
-1.38309, -0.5281837, -0.2234499, 1, 1, 1, 1, 1,
-1.382975, -1.23791, -2.994746, 1, 1, 1, 1, 1,
-1.348081, -0.4709312, -0.6502065, 1, 1, 1, 1, 1,
-1.333802, -0.9709257, -1.27342, 1, 1, 1, 1, 1,
-1.332471, 0.300392, -2.545888, 0, 0, 1, 1, 1,
-1.326607, 0.517154, -0.6808489, 1, 0, 0, 1, 1,
-1.311228, -0.5163217, -3.257929, 1, 0, 0, 1, 1,
-1.307027, 0.7705038, -2.302012, 1, 0, 0, 1, 1,
-1.30344, -0.3505569, -0.5315371, 1, 0, 0, 1, 1,
-1.298107, -0.2039476, -1.50305, 1, 0, 0, 1, 1,
-1.296917, -0.9280139, -0.9670957, 0, 0, 0, 1, 1,
-1.29627, -0.4967132, -1.924823, 0, 0, 0, 1, 1,
-1.293901, 1.10677, 0.2685216, 0, 0, 0, 1, 1,
-1.293503, 0.4514793, -0.8172849, 0, 0, 0, 1, 1,
-1.289992, 1.463265, -0.4551837, 0, 0, 0, 1, 1,
-1.2844, 1.454409, -0.001472124, 0, 0, 0, 1, 1,
-1.283626, 0.6057178, -2.697866, 0, 0, 0, 1, 1,
-1.281506, 0.1018943, -3.306573, 1, 1, 1, 1, 1,
-1.280236, 1.856526, 0.3716244, 1, 1, 1, 1, 1,
-1.271897, -0.1223574, -0.6539178, 1, 1, 1, 1, 1,
-1.270501, 1.513926, -0.8222758, 1, 1, 1, 1, 1,
-1.26597, 1.647342, -1.989257, 1, 1, 1, 1, 1,
-1.256954, 0.2294685, -2.069847, 1, 1, 1, 1, 1,
-1.254918, 1.518431, 0.5827796, 1, 1, 1, 1, 1,
-1.253908, -1.03976, -2.632314, 1, 1, 1, 1, 1,
-1.251335, -0.5566365, -2.089255, 1, 1, 1, 1, 1,
-1.235537, -0.218, -2.770714, 1, 1, 1, 1, 1,
-1.218117, 0.3815703, -1.260194, 1, 1, 1, 1, 1,
-1.198617, -1.537676, -3.35806, 1, 1, 1, 1, 1,
-1.190748, -1.656848, -2.143591, 1, 1, 1, 1, 1,
-1.185724, 1.810925, 0.9506077, 1, 1, 1, 1, 1,
-1.183425, -0.2605552, -1.820318, 1, 1, 1, 1, 1,
-1.165271, 0.4581484, -3.26619, 0, 0, 1, 1, 1,
-1.1637, 2.24098, -0.8772144, 1, 0, 0, 1, 1,
-1.150967, 0.3378994, -1.184467, 1, 0, 0, 1, 1,
-1.149819, -0.6502976, -1.487678, 1, 0, 0, 1, 1,
-1.148858, -0.9423938, -1.665789, 1, 0, 0, 1, 1,
-1.143547, 1.363058, -2.131767, 1, 0, 0, 1, 1,
-1.137924, -0.3720299, -1.217186, 0, 0, 0, 1, 1,
-1.125544, 0.433603, -2.376266, 0, 0, 0, 1, 1,
-1.117675, 0.2897228, 0.009319638, 0, 0, 0, 1, 1,
-1.114314, -0.8729068, -2.666887, 0, 0, 0, 1, 1,
-1.088525, -0.1121954, -0.127405, 0, 0, 0, 1, 1,
-1.083491, 1.031123, -1.85574, 0, 0, 0, 1, 1,
-1.082389, -0.6182073, -2.636593, 0, 0, 0, 1, 1,
-1.074781, -0.3920037, -3.051754, 1, 1, 1, 1, 1,
-1.074396, -0.4464938, -2.679073, 1, 1, 1, 1, 1,
-1.073394, -0.6522773, -3.933578, 1, 1, 1, 1, 1,
-1.068062, -0.4679498, -2.505795, 1, 1, 1, 1, 1,
-1.064115, -0.8490086, -2.197957, 1, 1, 1, 1, 1,
-1.059114, -1.534457, -1.310561, 1, 1, 1, 1, 1,
-1.059053, 0.5423745, -2.059924, 1, 1, 1, 1, 1,
-1.057381, 1.15599, -3.101687, 1, 1, 1, 1, 1,
-1.055634, 0.961514, 0.316519, 1, 1, 1, 1, 1,
-1.051152, 1.272506, 0.096203, 1, 1, 1, 1, 1,
-1.046026, -1.201389, -0.5055186, 1, 1, 1, 1, 1,
-1.029556, -1.230488, -2.87223, 1, 1, 1, 1, 1,
-1.028193, -1.605711, -2.304876, 1, 1, 1, 1, 1,
-1.015346, 1.78864, -0.4100905, 1, 1, 1, 1, 1,
-1.01197, 0.9747179, -1.658921, 1, 1, 1, 1, 1,
-1.009778, 2.495857, 0.1520224, 0, 0, 1, 1, 1,
-1.00759, -0.1736142, -1.90663, 1, 0, 0, 1, 1,
-1.005181, -1.239663, -2.933304, 1, 0, 0, 1, 1,
-0.9957529, -1.56066, -3.17313, 1, 0, 0, 1, 1,
-0.9943491, -2.421006, -3.133975, 1, 0, 0, 1, 1,
-0.9913836, 0.4646954, -0.9955976, 1, 0, 0, 1, 1,
-0.991039, -1.264414, -2.090199, 0, 0, 0, 1, 1,
-0.9840544, 0.003837715, -1.295041, 0, 0, 0, 1, 1,
-0.9807535, 1.510289, 0.9385405, 0, 0, 0, 1, 1,
-0.977015, 1.21862, -1.817965, 0, 0, 0, 1, 1,
-0.9768351, 2.043879, 0.06271784, 0, 0, 0, 1, 1,
-0.9753129, 0.7625723, 0.4157588, 0, 0, 0, 1, 1,
-0.9741881, 0.9846612, -1.166272, 0, 0, 0, 1, 1,
-0.9735879, -0.2742836, -2.294992, 1, 1, 1, 1, 1,
-0.9694489, -1.605566, -2.097372, 1, 1, 1, 1, 1,
-0.9671148, -0.0714485, -1.829654, 1, 1, 1, 1, 1,
-0.9649366, -0.5886034, -2.804899, 1, 1, 1, 1, 1,
-0.962036, -0.1224263, -1.330143, 1, 1, 1, 1, 1,
-0.9616975, -1.402482, -2.930251, 1, 1, 1, 1, 1,
-0.9589532, -1.833867, -2.336068, 1, 1, 1, 1, 1,
-0.9573185, 0.1120085, -0.3862538, 1, 1, 1, 1, 1,
-0.9559904, -0.3728752, -1.890455, 1, 1, 1, 1, 1,
-0.9546632, 1.314355, -1.986814, 1, 1, 1, 1, 1,
-0.9508355, -1.145942, -2.148541, 1, 1, 1, 1, 1,
-0.9497716, 0.651726, -1.160885, 1, 1, 1, 1, 1,
-0.944103, 1.947861, 1.566268, 1, 1, 1, 1, 1,
-0.9413955, -0.04242381, -2.364091, 1, 1, 1, 1, 1,
-0.9399315, -0.5104547, -2.081404, 1, 1, 1, 1, 1,
-0.9391582, -0.4944611, -2.569424, 0, 0, 1, 1, 1,
-0.9377374, -0.821807, -2.171599, 1, 0, 0, 1, 1,
-0.9372979, -1.68064, -2.413774, 1, 0, 0, 1, 1,
-0.9363265, 0.7463197, -1.282097, 1, 0, 0, 1, 1,
-0.9305922, -0.1680453, -0.7486151, 1, 0, 0, 1, 1,
-0.9304847, -0.09478399, -3.145717, 1, 0, 0, 1, 1,
-0.9248496, 0.4638486, -0.06071223, 0, 0, 0, 1, 1,
-0.9231272, -0.7028751, -2.902374, 0, 0, 0, 1, 1,
-0.9208779, -1.831237, -3.231533, 0, 0, 0, 1, 1,
-0.8996719, -1.323221, -3.470138, 0, 0, 0, 1, 1,
-0.8990955, -0.7494252, -3.745197, 0, 0, 0, 1, 1,
-0.8932555, 0.8027759, -2.077668, 0, 0, 0, 1, 1,
-0.8928754, -0.4840865, -2.12263, 0, 0, 0, 1, 1,
-0.8901605, -1.782092, -3.340036, 1, 1, 1, 1, 1,
-0.885721, -1.446961, -3.476685, 1, 1, 1, 1, 1,
-0.8825804, -1.63665, -1.215565, 1, 1, 1, 1, 1,
-0.8768228, -0.1641107, -1.502841, 1, 1, 1, 1, 1,
-0.8701869, -1.492162, -3.935834, 1, 1, 1, 1, 1,
-0.8698853, -0.2697487, -2.875774, 1, 1, 1, 1, 1,
-0.8674091, -0.230069, -1.044753, 1, 1, 1, 1, 1,
-0.8656842, 0.3623432, -2.942622, 1, 1, 1, 1, 1,
-0.8635609, 0.8885537, -1.796753, 1, 1, 1, 1, 1,
-0.8629997, -0.08541995, -1.538103, 1, 1, 1, 1, 1,
-0.85425, -1.606011, -2.006335, 1, 1, 1, 1, 1,
-0.8538886, 0.008318939, -3.111039, 1, 1, 1, 1, 1,
-0.8489016, 1.795296, -0.8763293, 1, 1, 1, 1, 1,
-0.8474901, 0.6342353, -1.111361, 1, 1, 1, 1, 1,
-0.8377065, 0.9074107, -0.5230711, 1, 1, 1, 1, 1,
-0.8335682, -0.3455473, -2.69176, 0, 0, 1, 1, 1,
-0.8332269, 0.3426588, -0.7758929, 1, 0, 0, 1, 1,
-0.8306014, -0.3502945, -1.166304, 1, 0, 0, 1, 1,
-0.8280509, -0.2679053, -1.941546, 1, 0, 0, 1, 1,
-0.827151, -0.986607, -3.343763, 1, 0, 0, 1, 1,
-0.8256466, 0.3423623, -1.917062, 1, 0, 0, 1, 1,
-0.8155453, 1.433441, 0.3744062, 0, 0, 0, 1, 1,
-0.8152118, -0.2679568, -1.692349, 0, 0, 0, 1, 1,
-0.8079363, -0.8032255, -2.770386, 0, 0, 0, 1, 1,
-0.803831, 1.806996, -0.8331032, 0, 0, 0, 1, 1,
-0.8019875, 0.7149966, 0.6225693, 0, 0, 0, 1, 1,
-0.8002701, 0.6952936, -1.86748, 0, 0, 0, 1, 1,
-0.7992293, -0.1724516, -1.984637, 0, 0, 0, 1, 1,
-0.7988514, 0.3380817, -1.943285, 1, 1, 1, 1, 1,
-0.7943881, 0.02119233, -1.080666, 1, 1, 1, 1, 1,
-0.7919164, 0.3678581, 0.8130494, 1, 1, 1, 1, 1,
-0.7868889, 1.018782, -1.497474, 1, 1, 1, 1, 1,
-0.7849197, -0.9464955, -0.2126354, 1, 1, 1, 1, 1,
-0.7817993, 0.4570914, -1.995998, 1, 1, 1, 1, 1,
-0.7792274, -0.5328529, -2.115811, 1, 1, 1, 1, 1,
-0.7785681, -0.8712863, -3.246006, 1, 1, 1, 1, 1,
-0.7778293, 1.517315, 0.2334336, 1, 1, 1, 1, 1,
-0.7740071, -0.6857764, -2.236225, 1, 1, 1, 1, 1,
-0.7714518, -1.197552, -3.67165, 1, 1, 1, 1, 1,
-0.7695071, -1.502523, -3.068684, 1, 1, 1, 1, 1,
-0.7629899, 1.111181, 0.5791789, 1, 1, 1, 1, 1,
-0.7567542, -0.8296426, -1.886843, 1, 1, 1, 1, 1,
-0.7536976, 1.303965, -1.618054, 1, 1, 1, 1, 1,
-0.7454636, -0.2117447, -1.679814, 0, 0, 1, 1, 1,
-0.7422446, 0.08575249, -2.112513, 1, 0, 0, 1, 1,
-0.7331971, 2.781786, -1.224976, 1, 0, 0, 1, 1,
-0.7298195, 0.06164599, -2.374032, 1, 0, 0, 1, 1,
-0.7258881, 0.3501806, -2.834647, 1, 0, 0, 1, 1,
-0.7225819, -0.4779719, -2.557354, 1, 0, 0, 1, 1,
-0.7199494, 0.2820865, -1.694831, 0, 0, 0, 1, 1,
-0.7197972, 1.482132, -0.3374662, 0, 0, 0, 1, 1,
-0.7182741, -0.03833563, -0.7469262, 0, 0, 0, 1, 1,
-0.711699, 0.8826041, -1.040311, 0, 0, 0, 1, 1,
-0.7115221, 0.04127873, -2.336534, 0, 0, 0, 1, 1,
-0.7090961, -0.4383002, -0.6059955, 0, 0, 0, 1, 1,
-0.7026822, -0.7032395, -3.183947, 0, 0, 0, 1, 1,
-0.6980839, 0.5171497, -0.6828536, 1, 1, 1, 1, 1,
-0.6911832, -0.6324638, -2.281533, 1, 1, 1, 1, 1,
-0.6868677, -1.570155, -0.6402888, 1, 1, 1, 1, 1,
-0.6840518, 1.16363, -0.1195715, 1, 1, 1, 1, 1,
-0.6755597, 0.1841904, -1.075209, 1, 1, 1, 1, 1,
-0.6726858, 0.4518547, -1.693141, 1, 1, 1, 1, 1,
-0.6658362, -0.9467961, -1.509798, 1, 1, 1, 1, 1,
-0.6655838, -0.00122706, -2.110235, 1, 1, 1, 1, 1,
-0.6614801, 1.180242, -0.04109814, 1, 1, 1, 1, 1,
-0.6610413, 1.329839, -1.709594, 1, 1, 1, 1, 1,
-0.6598173, -0.1082345, -1.380104, 1, 1, 1, 1, 1,
-0.6560282, 0.07307882, -1.999759, 1, 1, 1, 1, 1,
-0.6495386, 0.3514166, -1.286144, 1, 1, 1, 1, 1,
-0.6420872, 0.2546492, -2.248387, 1, 1, 1, 1, 1,
-0.6410724, -1.728342, -4.456055, 1, 1, 1, 1, 1,
-0.63806, 0.1607065, -1.694181, 0, 0, 1, 1, 1,
-0.6372858, 0.2510603, 0.7192635, 1, 0, 0, 1, 1,
-0.6356142, -0.3294536, -2.046341, 1, 0, 0, 1, 1,
-0.6347487, -0.1507419, -1.782377, 1, 0, 0, 1, 1,
-0.6329204, -1.691792, -2.778864, 1, 0, 0, 1, 1,
-0.6251485, 1.890209, 0.3963063, 1, 0, 0, 1, 1,
-0.622717, -0.5478559, -2.670009, 0, 0, 0, 1, 1,
-0.6212381, -1.44978, -2.686094, 0, 0, 0, 1, 1,
-0.618229, -0.3051943, -3.10359, 0, 0, 0, 1, 1,
-0.6173358, 1.472292, -0.1508352, 0, 0, 0, 1, 1,
-0.6112396, -1.215277, -4.775111, 0, 0, 0, 1, 1,
-0.608057, -1.066889, -2.628318, 0, 0, 0, 1, 1,
-0.6079972, -1.162266, -3.159237, 0, 0, 0, 1, 1,
-0.6072091, 1.807214, -0.4496298, 1, 1, 1, 1, 1,
-0.6065693, -0.3593928, -2.675603, 1, 1, 1, 1, 1,
-0.6046461, -0.2279949, -3.478464, 1, 1, 1, 1, 1,
-0.5886728, 1.28641, -1.461632, 1, 1, 1, 1, 1,
-0.5878157, -0.4749704, -2.164756, 1, 1, 1, 1, 1,
-0.5763184, 0.09918346, -1.301938, 1, 1, 1, 1, 1,
-0.57521, 0.9982191, -0.9192109, 1, 1, 1, 1, 1,
-0.574473, -0.3790224, -1.914538, 1, 1, 1, 1, 1,
-0.571345, -0.3156968, -3.097483, 1, 1, 1, 1, 1,
-0.570568, -1.67848, -2.672638, 1, 1, 1, 1, 1,
-0.5664853, 0.7750259, -1.581031, 1, 1, 1, 1, 1,
-0.5615072, -0.5978353, -2.013223, 1, 1, 1, 1, 1,
-0.5580255, -0.4435945, -1.552421, 1, 1, 1, 1, 1,
-0.5569375, -0.6086819, -3.860179, 1, 1, 1, 1, 1,
-0.5537567, -1.328689, -1.8895, 1, 1, 1, 1, 1,
-0.5514638, -0.06938961, -2.617948, 0, 0, 1, 1, 1,
-0.5514109, -1.291493, -3.043771, 1, 0, 0, 1, 1,
-0.5509254, -0.6055808, -1.108791, 1, 0, 0, 1, 1,
-0.5489447, 1.093618, -0.152542, 1, 0, 0, 1, 1,
-0.5451818, -0.9132886, -1.355393, 1, 0, 0, 1, 1,
-0.5425198, 1.705398, 1.651673, 1, 0, 0, 1, 1,
-0.541314, 1.456136, 0.2026992, 0, 0, 0, 1, 1,
-0.5382077, -1.241144, -2.657832, 0, 0, 0, 1, 1,
-0.5365811, 0.6039976, -1.301013, 0, 0, 0, 1, 1,
-0.5355184, -0.2086142, -3.35441, 0, 0, 0, 1, 1,
-0.5348068, 1.5561, 1.29682, 0, 0, 0, 1, 1,
-0.5332664, 0.8572186, 0.1506846, 0, 0, 0, 1, 1,
-0.5300689, -0.005440772, -4.530319, 0, 0, 0, 1, 1,
-0.5222756, -0.3545975, -1.504151, 1, 1, 1, 1, 1,
-0.5180631, 0.1205446, -0.6386177, 1, 1, 1, 1, 1,
-0.5141553, -0.08167806, -1.118112, 1, 1, 1, 1, 1,
-0.5091631, 0.3156613, -0.5663001, 1, 1, 1, 1, 1,
-0.5076366, 1.509405, 1.026094, 1, 1, 1, 1, 1,
-0.5068299, 0.1688037, -1.504068, 1, 1, 1, 1, 1,
-0.5048057, -1.9264, -2.466068, 1, 1, 1, 1, 1,
-0.5043454, 1.306221, -0.446773, 1, 1, 1, 1, 1,
-0.4991306, -1.391443, -2.104933, 1, 1, 1, 1, 1,
-0.4986745, -1.191295, -4.204633, 1, 1, 1, 1, 1,
-0.4984514, 0.5412643, -1.043703, 1, 1, 1, 1, 1,
-0.4908401, -1.015244, -4.757069, 1, 1, 1, 1, 1,
-0.4902855, -0.7488564, -2.243862, 1, 1, 1, 1, 1,
-0.4868737, 1.153052, -1.466765, 1, 1, 1, 1, 1,
-0.4848945, -0.8591297, -2.949942, 1, 1, 1, 1, 1,
-0.4840702, -1.371423, -5.641662, 0, 0, 1, 1, 1,
-0.47747, 0.6847901, -1.453837, 1, 0, 0, 1, 1,
-0.4768372, 0.2903085, 0.1037418, 1, 0, 0, 1, 1,
-0.4754314, -0.3102341, -2.360923, 1, 0, 0, 1, 1,
-0.4737315, -2.00156, -2.490331, 1, 0, 0, 1, 1,
-0.4686459, -0.3912921, -0.2496718, 1, 0, 0, 1, 1,
-0.4581592, -1.288127, -2.152235, 0, 0, 0, 1, 1,
-0.4521219, -0.3229806, -2.886408, 0, 0, 0, 1, 1,
-0.4519718, -0.6955045, -0.9427019, 0, 0, 0, 1, 1,
-0.4472538, 0.8312327, -0.1961288, 0, 0, 0, 1, 1,
-0.4462747, 0.8228027, 0.1395269, 0, 0, 0, 1, 1,
-0.4412969, -0.3268291, -2.326814, 0, 0, 0, 1, 1,
-0.4412081, 0.04367235, -2.5151, 0, 0, 0, 1, 1,
-0.4404358, 1.364332, -1.011685, 1, 1, 1, 1, 1,
-0.4383858, -0.6098913, -2.821083, 1, 1, 1, 1, 1,
-0.4345153, 1.10826, 1.15387, 1, 1, 1, 1, 1,
-0.4344494, -0.3790434, -2.562176, 1, 1, 1, 1, 1,
-0.4307324, 0.7471314, 2.113884, 1, 1, 1, 1, 1,
-0.4304958, -0.1468251, -2.09595, 1, 1, 1, 1, 1,
-0.4278176, -1.080161, -4.053452, 1, 1, 1, 1, 1,
-0.4274458, -1.706889, -4.409745, 1, 1, 1, 1, 1,
-0.4274223, 1.495662, -0.5052442, 1, 1, 1, 1, 1,
-0.4251657, 0.6420774, -1.455754, 1, 1, 1, 1, 1,
-0.4216431, -1.73622, -2.600999, 1, 1, 1, 1, 1,
-0.4188609, 1.055865, -0.1765109, 1, 1, 1, 1, 1,
-0.4188042, -1.451942, -3.879746, 1, 1, 1, 1, 1,
-0.4185591, 0.1030906, -1.096333, 1, 1, 1, 1, 1,
-0.4165672, -0.3308161, -0.006773435, 1, 1, 1, 1, 1,
-0.414409, -1.61652, -4.32369, 0, 0, 1, 1, 1,
-0.4135227, 0.4898436, -1.290403, 1, 0, 0, 1, 1,
-0.4107396, 0.1401283, -0.3747689, 1, 0, 0, 1, 1,
-0.4093471, -0.9636797, -2.973105, 1, 0, 0, 1, 1,
-0.4070372, -0.5732269, -1.523737, 1, 0, 0, 1, 1,
-0.4036584, 2.1947, 0.6378016, 1, 0, 0, 1, 1,
-0.3966837, -1.190616, -2.508965, 0, 0, 0, 1, 1,
-0.3960185, 1.034047, 0.6038019, 0, 0, 0, 1, 1,
-0.3937904, 0.8064446, -0.1703781, 0, 0, 0, 1, 1,
-0.3917868, -1.801273, -2.41685, 0, 0, 0, 1, 1,
-0.3911572, -1.844354, -1.74383, 0, 0, 0, 1, 1,
-0.3898569, -1.238322, -2.893696, 0, 0, 0, 1, 1,
-0.3886915, -2.384232, -3.403768, 0, 0, 0, 1, 1,
-0.3863624, 2.667005, 0.1474488, 1, 1, 1, 1, 1,
-0.3827745, 1.024997, 0.2986487, 1, 1, 1, 1, 1,
-0.3815854, -0.1818977, -1.966392, 1, 1, 1, 1, 1,
-0.3815013, -1.002381, -1.500499, 1, 1, 1, 1, 1,
-0.3802072, -0.2665155, -0.8052652, 1, 1, 1, 1, 1,
-0.3761985, -0.4407013, -1.168764, 1, 1, 1, 1, 1,
-0.373762, -0.2716489, -1.557629, 1, 1, 1, 1, 1,
-0.3706392, -0.4487256, -2.648785, 1, 1, 1, 1, 1,
-0.3613129, 1.367425, 0.1271935, 1, 1, 1, 1, 1,
-0.3606948, 0.910419, -0.181693, 1, 1, 1, 1, 1,
-0.3567068, 0.1376885, -1.050085, 1, 1, 1, 1, 1,
-0.3566791, -0.2775612, -2.160492, 1, 1, 1, 1, 1,
-0.3564223, 0.5887338, 0.3090209, 1, 1, 1, 1, 1,
-0.3523353, 0.3545647, 0.6928109, 1, 1, 1, 1, 1,
-0.3520265, 0.07248075, -3.180841, 1, 1, 1, 1, 1,
-0.3517768, -1.825451, -2.919547, 0, 0, 1, 1, 1,
-0.3507333, 1.731517, 0.2276496, 1, 0, 0, 1, 1,
-0.3502536, -0.8726526, -1.661728, 1, 0, 0, 1, 1,
-0.3425757, -2.634394, -3.451224, 1, 0, 0, 1, 1,
-0.3409965, -1.34841, -3.358855, 1, 0, 0, 1, 1,
-0.3373457, -1.058861, -3.123709, 1, 0, 0, 1, 1,
-0.3333546, 0.8505023, -0.2022686, 0, 0, 0, 1, 1,
-0.3327638, -0.5162926, -3.071928, 0, 0, 0, 1, 1,
-0.3326117, -1.351202, -4.91984, 0, 0, 0, 1, 1,
-0.3324947, 0.4214126, -3.111991, 0, 0, 0, 1, 1,
-0.3317254, -0.72465, -1.045044, 0, 0, 0, 1, 1,
-0.3314319, 0.3468897, -1.823497, 0, 0, 0, 1, 1,
-0.3307296, 0.9795214, 1.275405, 0, 0, 0, 1, 1,
-0.3290519, 0.07009915, -3.000484, 1, 1, 1, 1, 1,
-0.3286313, -0.08598623, -1.864591, 1, 1, 1, 1, 1,
-0.3279112, -1.050291, -3.522749, 1, 1, 1, 1, 1,
-0.3176492, -0.1660463, -3.555023, 1, 1, 1, 1, 1,
-0.3105671, 0.8398852, -0.6902156, 1, 1, 1, 1, 1,
-0.3080387, 0.853529, -0.8760383, 1, 1, 1, 1, 1,
-0.3066511, 2.353489, -0.5543655, 1, 1, 1, 1, 1,
-0.3059063, 0.2221409, -2.035135, 1, 1, 1, 1, 1,
-0.3046961, 0.2978634, -0.5743439, 1, 1, 1, 1, 1,
-0.3014176, -0.3735709, -2.178344, 1, 1, 1, 1, 1,
-0.2994002, 0.9876016, 1.366867, 1, 1, 1, 1, 1,
-0.2976602, 0.5361521, 0.7424896, 1, 1, 1, 1, 1,
-0.2976578, 0.3574921, -1.408581, 1, 1, 1, 1, 1,
-0.295005, -1.652103, -1.731737, 1, 1, 1, 1, 1,
-0.2894787, 0.7936751, -0.1804175, 1, 1, 1, 1, 1,
-0.2877972, -0.1098166, -1.209154, 0, 0, 1, 1, 1,
-0.2836527, -0.6695672, -2.042316, 1, 0, 0, 1, 1,
-0.2819899, 0.7962513, 0.9275745, 1, 0, 0, 1, 1,
-0.2817536, 1.206841, -0.3411878, 1, 0, 0, 1, 1,
-0.2817078, -0.3467945, -3.101126, 1, 0, 0, 1, 1,
-0.2814858, 1.269431, 0.05356371, 1, 0, 0, 1, 1,
-0.2788676, 1.12098, -0.8306695, 0, 0, 0, 1, 1,
-0.2786969, -0.005964135, -1.951068, 0, 0, 0, 1, 1,
-0.2765402, -1.156498, -2.685996, 0, 0, 0, 1, 1,
-0.2719617, -0.08380507, -2.399282, 0, 0, 0, 1, 1,
-0.2690506, 0.7101957, -0.431179, 0, 0, 0, 1, 1,
-0.2619523, -0.6827692, -2.680435, 0, 0, 0, 1, 1,
-0.2617697, -0.2791552, -4.238114, 0, 0, 0, 1, 1,
-0.2614708, 0.07880735, -0.7882848, 1, 1, 1, 1, 1,
-0.2568669, -1.63175, -3.93219, 1, 1, 1, 1, 1,
-0.2429543, -0.3452913, -0.9011915, 1, 1, 1, 1, 1,
-0.2367643, 1.827189, 1.049342, 1, 1, 1, 1, 1,
-0.2330907, -2.151998, -2.331716, 1, 1, 1, 1, 1,
-0.2327046, -1.267568, -4.788056, 1, 1, 1, 1, 1,
-0.2310401, -1.88491, -2.166947, 1, 1, 1, 1, 1,
-0.2308679, 1.230909, 0.1346491, 1, 1, 1, 1, 1,
-0.2281705, 0.5919296, -0.1580509, 1, 1, 1, 1, 1,
-0.2276104, 0.05352672, -1.429984, 1, 1, 1, 1, 1,
-0.2212134, 0.4123407, 0.9497865, 1, 1, 1, 1, 1,
-0.220938, 0.781124, -2.018633, 1, 1, 1, 1, 1,
-0.2207223, -0.2764736, -6.600585, 1, 1, 1, 1, 1,
-0.2197046, -0.916335, -2.065953, 1, 1, 1, 1, 1,
-0.2192302, 1.256909, 0.7285137, 1, 1, 1, 1, 1,
-0.2191918, 0.3461342, 1.290157, 0, 0, 1, 1, 1,
-0.214619, 0.4019949, 1.350533, 1, 0, 0, 1, 1,
-0.2108579, -1.742833, -2.224065, 1, 0, 0, 1, 1,
-0.2095671, 1.421078, -2.292838, 1, 0, 0, 1, 1,
-0.1977214, 0.9558177, 1.386697, 1, 0, 0, 1, 1,
-0.1967126, -0.1807718, -2.310932, 1, 0, 0, 1, 1,
-0.1947297, 0.2030896, -1.137843, 0, 0, 0, 1, 1,
-0.1947245, -1.257535, -4.134248, 0, 0, 0, 1, 1,
-0.1945841, 1.356432, 0.3911767, 0, 0, 0, 1, 1,
-0.1927813, 1.341797, -0.3326742, 0, 0, 0, 1, 1,
-0.1893577, 0.1713767, -1.063906, 0, 0, 0, 1, 1,
-0.1888472, 1.868251, 0.3545043, 0, 0, 0, 1, 1,
-0.1846243, -0.2523133, -0.8650876, 0, 0, 0, 1, 1,
-0.1844734, -0.5235593, -2.308563, 1, 1, 1, 1, 1,
-0.1798843, 0.9094202, -1.711421, 1, 1, 1, 1, 1,
-0.1740155, -0.2725281, -1.668751, 1, 1, 1, 1, 1,
-0.166311, 0.2545106, 0.2542034, 1, 1, 1, 1, 1,
-0.1623723, 0.3390959, 0.9691499, 1, 1, 1, 1, 1,
-0.1620938, 0.1164602, 0.4875838, 1, 1, 1, 1, 1,
-0.1603901, 2.252851, -0.08149298, 1, 1, 1, 1, 1,
-0.1586792, 0.9628438, -0.6711776, 1, 1, 1, 1, 1,
-0.1582033, -0.652771, -2.397605, 1, 1, 1, 1, 1,
-0.1563534, -0.6830161, -4.445902, 1, 1, 1, 1, 1,
-0.1551563, 0.8825214, -2.428372, 1, 1, 1, 1, 1,
-0.1547001, 1.070912, 1.328056, 1, 1, 1, 1, 1,
-0.1508868, -0.9961109, -1.878197, 1, 1, 1, 1, 1,
-0.1478724, 0.4588575, -1.440171, 1, 1, 1, 1, 1,
-0.1478431, 1.573295, -0.3333646, 1, 1, 1, 1, 1,
-0.1466746, 1.598414, 0.3742549, 0, 0, 1, 1, 1,
-0.1436306, 0.972791, 0.000696157, 1, 0, 0, 1, 1,
-0.1416899, -0.599132, -2.515381, 1, 0, 0, 1, 1,
-0.14085, -0.3461671, -3.260952, 1, 0, 0, 1, 1,
-0.1367953, 0.7594999, -0.5752436, 1, 0, 0, 1, 1,
-0.1351769, -0.0938801, -2.755135, 1, 0, 0, 1, 1,
-0.1347287, -2.208276, -1.421234, 0, 0, 0, 1, 1,
-0.1334253, 1.469344, 0.5372964, 0, 0, 0, 1, 1,
-0.1304942, -1.592935, -4.217821, 0, 0, 0, 1, 1,
-0.130404, 0.6450493, -0.3083119, 0, 0, 0, 1, 1,
-0.1291033, 0.1962267, -0.5987909, 0, 0, 0, 1, 1,
-0.1281043, 2.035191, -1.077151, 0, 0, 0, 1, 1,
-0.1216622, 0.5930478, -0.8300319, 0, 0, 0, 1, 1,
-0.1207265, -0.01999398, -1.622945, 1, 1, 1, 1, 1,
-0.1137782, 0.4353584, -2.390718, 1, 1, 1, 1, 1,
-0.1117917, 1.111813, -1.194077, 1, 1, 1, 1, 1,
-0.1107089, -0.1133428, -2.175195, 1, 1, 1, 1, 1,
-0.1090879, -0.7955921, -3.429001, 1, 1, 1, 1, 1,
-0.104455, -0.3244455, -2.065782, 1, 1, 1, 1, 1,
-0.1032358, -1.762616, -3.657805, 1, 1, 1, 1, 1,
-0.1023805, 0.2132548, -0.2418633, 1, 1, 1, 1, 1,
-0.1022913, -1.220969, -3.1645, 1, 1, 1, 1, 1,
-0.09044541, 0.01476687, -1.39016, 1, 1, 1, 1, 1,
-0.08818309, -1.041682, -4.521944, 1, 1, 1, 1, 1,
-0.08792356, -0.2819145, -3.028812, 1, 1, 1, 1, 1,
-0.08644155, -1.100728, -3.000262, 1, 1, 1, 1, 1,
-0.08622634, -0.7215609, 0.2789526, 1, 1, 1, 1, 1,
-0.08284272, -0.03502331, -2.716697, 1, 1, 1, 1, 1,
-0.08096566, 0.2747512, 0.07027384, 0, 0, 1, 1, 1,
-0.07887714, -1.842526, -2.656058, 1, 0, 0, 1, 1,
-0.07732487, -0.4045566, -1.550778, 1, 0, 0, 1, 1,
-0.07518459, 0.4187078, -1.181211, 1, 0, 0, 1, 1,
-0.07396577, -0.8718358, -2.188667, 1, 0, 0, 1, 1,
-0.07385936, -0.3631929, -3.153558, 1, 0, 0, 1, 1,
-0.07299384, 1.296137, -1.120907, 0, 0, 0, 1, 1,
-0.07195806, 1.279707, -1.366285, 0, 0, 0, 1, 1,
-0.07192116, 0.4380608, 0.3857258, 0, 0, 0, 1, 1,
-0.07092146, -0.1259211, -2.198461, 0, 0, 0, 1, 1,
-0.07086232, 0.8866826, -1.098546, 0, 0, 0, 1, 1,
-0.06788515, 1.490754, -0.6684554, 0, 0, 0, 1, 1,
-0.06664679, 1.588511, -1.239404, 0, 0, 0, 1, 1,
-0.06336453, 0.006550827, -3.310218, 1, 1, 1, 1, 1,
-0.06042026, -0.3448322, -2.677229, 1, 1, 1, 1, 1,
-0.05710988, 0.6862475, -0.4898007, 1, 1, 1, 1, 1,
-0.05564363, -0.4458328, -1.4296, 1, 1, 1, 1, 1,
-0.05509184, -0.2247618, -2.584566, 1, 1, 1, 1, 1,
-0.05368319, 1.427605, 0.2911577, 1, 1, 1, 1, 1,
-0.05225154, -0.1885713, -2.531122, 1, 1, 1, 1, 1,
-0.04467507, 0.5085182, 0.3742216, 1, 1, 1, 1, 1,
-0.04436316, -1.342735, -2.08397, 1, 1, 1, 1, 1,
-0.0434665, 1.418855, 0.8038801, 1, 1, 1, 1, 1,
-0.03996649, 0.3823068, 1.327109, 1, 1, 1, 1, 1,
-0.03846432, -0.9753465, -2.832805, 1, 1, 1, 1, 1,
-0.03585287, 0.4045933, -1.777236, 1, 1, 1, 1, 1,
-0.03422506, 0.3793707, 1.053597, 1, 1, 1, 1, 1,
-0.0332936, 2.020769, -0.7372234, 1, 1, 1, 1, 1,
-0.02454061, 0.6440349, 1.393124, 0, 0, 1, 1, 1,
-0.02337654, -0.5582663, -0.3533637, 1, 0, 0, 1, 1,
-0.01970205, -0.1045545, -4.091752, 1, 0, 0, 1, 1,
-0.01865482, 0.9299364, 0.388991, 1, 0, 0, 1, 1,
-0.01409844, 0.8434872, 0.8500571, 1, 0, 0, 1, 1,
-0.01142383, -0.1415606, -3.727089, 1, 0, 0, 1, 1,
-0.008900931, -1.211416, -3.375379, 0, 0, 0, 1, 1,
-0.002288312, 0.5643453, 1.398049, 0, 0, 0, 1, 1,
-0.002035317, -1.120745, -4.020187, 0, 0, 0, 1, 1,
-0.0006339337, 1.003343, -0.4107825, 0, 0, 0, 1, 1,
0.005819187, 0.03146864, -0.7657354, 0, 0, 0, 1, 1,
0.009207507, 1.033497, -0.5133756, 0, 0, 0, 1, 1,
0.01470379, 0.2461231, -0.2708597, 0, 0, 0, 1, 1,
0.01741953, -1.614355, 2.479033, 1, 1, 1, 1, 1,
0.01847426, 0.4820457, -1.022815, 1, 1, 1, 1, 1,
0.02537321, 0.6300761, 0.1888055, 1, 1, 1, 1, 1,
0.02571137, 0.6251856, -0.1635181, 1, 1, 1, 1, 1,
0.02749922, -0.9546995, 2.290126, 1, 1, 1, 1, 1,
0.02781111, -0.5396011, 4.051256, 1, 1, 1, 1, 1,
0.02795491, -0.8720187, 4.794025, 1, 1, 1, 1, 1,
0.03526054, 0.849346, -1.185181, 1, 1, 1, 1, 1,
0.03739933, 0.630062, -2.003573, 1, 1, 1, 1, 1,
0.03756381, 0.2015914, 1.409072, 1, 1, 1, 1, 1,
0.03855874, 0.3654955, -1.054641, 1, 1, 1, 1, 1,
0.04107653, -1.095479, 3.248734, 1, 1, 1, 1, 1,
0.04132132, -2.193568, 4.141559, 1, 1, 1, 1, 1,
0.04284534, -0.184817, 3.162317, 1, 1, 1, 1, 1,
0.04438328, -1.432943, 2.9596, 1, 1, 1, 1, 1,
0.04701119, -1.318871, 3.930923, 0, 0, 1, 1, 1,
0.04822313, -1.15903, 1.293544, 1, 0, 0, 1, 1,
0.05079857, -0.9414809, 2.622254, 1, 0, 0, 1, 1,
0.05354621, 1.88446, 1.257642, 1, 0, 0, 1, 1,
0.05426573, -0.1163046, 3.402386, 1, 0, 0, 1, 1,
0.05886382, 0.7523438, 1.423737, 1, 0, 0, 1, 1,
0.058892, -0.511293, 4.155848, 0, 0, 0, 1, 1,
0.06145469, -0.8002156, 3.060518, 0, 0, 0, 1, 1,
0.06160313, -0.6319852, 4.270188, 0, 0, 0, 1, 1,
0.06210352, 0.811481, 0.07086679, 0, 0, 0, 1, 1,
0.06355429, -0.2310499, 3.566178, 0, 0, 0, 1, 1,
0.06881604, -0.2637187, 4.091746, 0, 0, 0, 1, 1,
0.06893025, 0.1876571, 0.9982525, 0, 0, 0, 1, 1,
0.06961673, -1.42652, 0.5061895, 1, 1, 1, 1, 1,
0.07384668, 1.009828, 1.132334, 1, 1, 1, 1, 1,
0.07415883, 0.2840261, 0.01264123, 1, 1, 1, 1, 1,
0.07518131, 0.1862399, 0.4200208, 1, 1, 1, 1, 1,
0.07695018, 0.1166758, 0.9726449, 1, 1, 1, 1, 1,
0.07729247, -0.0571352, 1.831468, 1, 1, 1, 1, 1,
0.07885342, 0.2164561, 2.319402, 1, 1, 1, 1, 1,
0.07890079, 1.655585, -0.2999834, 1, 1, 1, 1, 1,
0.0794732, -0.1985168, 1.974807, 1, 1, 1, 1, 1,
0.08451995, -0.185604, 2.763763, 1, 1, 1, 1, 1,
0.08475825, -0.3195597, 3.978873, 1, 1, 1, 1, 1,
0.08486576, 0.81406, 2.587691, 1, 1, 1, 1, 1,
0.08632142, -2.103845, 2.981017, 1, 1, 1, 1, 1,
0.08720175, -1.215899, 2.886751, 1, 1, 1, 1, 1,
0.08730137, 1.290709, -0.9771286, 1, 1, 1, 1, 1,
0.08811267, -1.085529, 2.878504, 0, 0, 1, 1, 1,
0.095942, 1.558334, -0.2632113, 1, 0, 0, 1, 1,
0.09765512, -0.8365988, 4.376055, 1, 0, 0, 1, 1,
0.09780768, -1.934598, 3.116089, 1, 0, 0, 1, 1,
0.09822094, 0.9307879, 2.026908, 1, 0, 0, 1, 1,
0.1017002, 1.865088, -0.701031, 1, 0, 0, 1, 1,
0.1033746, 1.200477, 0.0365056, 0, 0, 0, 1, 1,
0.1048782, -1.119597, 3.178985, 0, 0, 0, 1, 1,
0.105303, -0.7547393, 3.2953, 0, 0, 0, 1, 1,
0.1088102, -1.472856, 1.704506, 0, 0, 0, 1, 1,
0.110902, 1.339088, -1.148079, 0, 0, 0, 1, 1,
0.1131174, -0.1073323, 2.348843, 0, 0, 0, 1, 1,
0.118287, 1.667997, 1.137917, 0, 0, 0, 1, 1,
0.122456, 0.3125804, 0.5620398, 1, 1, 1, 1, 1,
0.1239743, -0.9064875, 4.289061, 1, 1, 1, 1, 1,
0.124061, 1.236367, 1.069695, 1, 1, 1, 1, 1,
0.1254117, 1.314108, 1.152324, 1, 1, 1, 1, 1,
0.1275984, 1.585846, -0.5841076, 1, 1, 1, 1, 1,
0.1276474, -1.785119, 3.486323, 1, 1, 1, 1, 1,
0.1285651, -0.08023515, 3.502166, 1, 1, 1, 1, 1,
0.143153, -0.9695469, 3.413794, 1, 1, 1, 1, 1,
0.1432263, -0.9657258, 0.7798492, 1, 1, 1, 1, 1,
0.1435959, 0.809048, 0.1295106, 1, 1, 1, 1, 1,
0.1451304, 1.267951, -1.238796, 1, 1, 1, 1, 1,
0.1536638, -0.368466, 2.301103, 1, 1, 1, 1, 1,
0.1561126, 1.392941, 0.1558175, 1, 1, 1, 1, 1,
0.1561146, -0.2876864, 2.814274, 1, 1, 1, 1, 1,
0.1581049, -0.4039827, 3.296305, 1, 1, 1, 1, 1,
0.1718029, -0.7161431, 5.386492, 0, 0, 1, 1, 1,
0.1733383, -0.8429592, 3.102442, 1, 0, 0, 1, 1,
0.1792745, -1.764094, 2.477566, 1, 0, 0, 1, 1,
0.1795546, 0.3145598, -1.237947, 1, 0, 0, 1, 1,
0.1809213, -1.037238, 3.48613, 1, 0, 0, 1, 1,
0.1815832, 0.1623638, -0.7813908, 1, 0, 0, 1, 1,
0.1834556, 1.281977, -1.644895, 0, 0, 0, 1, 1,
0.1869856, 0.7445961, -0.1704439, 0, 0, 0, 1, 1,
0.187669, -1.311395, 3.097194, 0, 0, 0, 1, 1,
0.1907955, -1.601756, 4.023205, 0, 0, 0, 1, 1,
0.1926286, 0.3957701, 0.2201262, 0, 0, 0, 1, 1,
0.1955332, 1.348522, 0.1153975, 0, 0, 0, 1, 1,
0.1981902, -1.244068, 2.926852, 0, 0, 0, 1, 1,
0.2010764, -0.6982022, 3.951641, 1, 1, 1, 1, 1,
0.2072274, 0.5397264, -2.424655, 1, 1, 1, 1, 1,
0.2090227, -1.181002, 3.745836, 1, 1, 1, 1, 1,
0.2122714, -1.676676, 3.103988, 1, 1, 1, 1, 1,
0.214867, 0.3392138, 0.1536648, 1, 1, 1, 1, 1,
0.2150179, 0.7624201, 0.3471788, 1, 1, 1, 1, 1,
0.2159083, 0.6494243, 0.6320564, 1, 1, 1, 1, 1,
0.2159598, -1.319556, 2.311804, 1, 1, 1, 1, 1,
0.216705, -1.227475, 2.222662, 1, 1, 1, 1, 1,
0.2201441, -1.231655, 0.8504805, 1, 1, 1, 1, 1,
0.2222911, -0.3498875, 4.353834, 1, 1, 1, 1, 1,
0.2263597, 0.01870222, 1.384944, 1, 1, 1, 1, 1,
0.2268451, -0.5468815, 2.924126, 1, 1, 1, 1, 1,
0.2295996, 0.1244302, 2.6432, 1, 1, 1, 1, 1,
0.2304994, 0.1579309, -0.1971326, 1, 1, 1, 1, 1,
0.2311529, 0.7877173, 1.080493, 0, 0, 1, 1, 1,
0.2354478, -1.178148, 2.988955, 1, 0, 0, 1, 1,
0.2376, 0.9754012, -0.9518209, 1, 0, 0, 1, 1,
0.2425843, -0.8355689, 2.28003, 1, 0, 0, 1, 1,
0.2449859, 0.03012019, 1.907636, 1, 0, 0, 1, 1,
0.2471987, -0.2706398, 3.343123, 1, 0, 0, 1, 1,
0.2484132, -0.7565426, 1.399523, 0, 0, 0, 1, 1,
0.2520762, 0.323931, 1.12789, 0, 0, 0, 1, 1,
0.2538852, -0.1447802, 3.078962, 0, 0, 0, 1, 1,
0.257964, -0.6891735, 1.890138, 0, 0, 0, 1, 1,
0.2582946, 2.209495, -0.08364709, 0, 0, 0, 1, 1,
0.2628712, 1.65638, -0.7098904, 0, 0, 0, 1, 1,
0.2636827, -1.375217, 2.798509, 0, 0, 0, 1, 1,
0.2673252, -1.369801, 3.82011, 1, 1, 1, 1, 1,
0.2780966, 0.1920189, 0.1246243, 1, 1, 1, 1, 1,
0.2895181, 0.1294858, 1.788976, 1, 1, 1, 1, 1,
0.2943495, -0.7619419, 0.3146831, 1, 1, 1, 1, 1,
0.2961074, 0.3467845, -1.252756, 1, 1, 1, 1, 1,
0.2993689, 1.665829, 0.2960604, 1, 1, 1, 1, 1,
0.3001513, -0.4408795, 2.435347, 1, 1, 1, 1, 1,
0.3005379, 1.198411, 0.04249872, 1, 1, 1, 1, 1,
0.3006135, -0.6044168, 0.3687236, 1, 1, 1, 1, 1,
0.3068762, -0.7701595, 4.457773, 1, 1, 1, 1, 1,
0.3075939, 0.464497, 1.065542, 1, 1, 1, 1, 1,
0.3108517, -1.232975, 3.514505, 1, 1, 1, 1, 1,
0.316169, -1.341336, 2.59709, 1, 1, 1, 1, 1,
0.3217416, -1.027898, 3.439125, 1, 1, 1, 1, 1,
0.3288598, 0.1290176, -0.2212683, 1, 1, 1, 1, 1,
0.3322994, 0.1627036, 1.911555, 0, 0, 1, 1, 1,
0.3370903, 0.1908865, 2.297016, 1, 0, 0, 1, 1,
0.3383389, 0.7449848, 2.204368, 1, 0, 0, 1, 1,
0.3415233, -1.632137, 2.422875, 1, 0, 0, 1, 1,
0.3455137, 0.5445859, 0.3539243, 1, 0, 0, 1, 1,
0.3470105, -0.4411482, 1.232283, 1, 0, 0, 1, 1,
0.3472499, -1.608904, 4.436035, 0, 0, 0, 1, 1,
0.3527704, 0.1707086, 0.3989217, 0, 0, 0, 1, 1,
0.3546433, -0.6524275, 3.524362, 0, 0, 0, 1, 1,
0.3549218, -0.02195883, 1.487505, 0, 0, 0, 1, 1,
0.3549234, 0.9135864, 0.4423372, 0, 0, 0, 1, 1,
0.3559012, 0.4112542, 0.9743626, 0, 0, 0, 1, 1,
0.3570468, -0.2652419, 3.178176, 0, 0, 0, 1, 1,
0.3620851, -0.138836, 3.026321, 1, 1, 1, 1, 1,
0.3635103, -1.623543, 3.434605, 1, 1, 1, 1, 1,
0.3653339, 1.646979, -0.05180254, 1, 1, 1, 1, 1,
0.3705773, -0.1632935, 2.097996, 1, 1, 1, 1, 1,
0.3722675, 0.8068396, -0.3626741, 1, 1, 1, 1, 1,
0.377154, 1.026802, 0.7587892, 1, 1, 1, 1, 1,
0.3788178, 0.4123953, -0.05471984, 1, 1, 1, 1, 1,
0.3840567, -1.190149, 1.799361, 1, 1, 1, 1, 1,
0.391763, -0.3605025, 1.296895, 1, 1, 1, 1, 1,
0.3918413, 0.978749, 1.082489, 1, 1, 1, 1, 1,
0.3955635, -1.198712, 2.399372, 1, 1, 1, 1, 1,
0.3965349, 0.0208093, 1.198548, 1, 1, 1, 1, 1,
0.4004787, -0.2703414, 1.644707, 1, 1, 1, 1, 1,
0.4020827, 0.3503877, 1.35855, 1, 1, 1, 1, 1,
0.4034879, 1.382083, 0.4072531, 1, 1, 1, 1, 1,
0.4045476, -0.5139099, 1.774519, 0, 0, 1, 1, 1,
0.4051022, -0.8752609, 2.07079, 1, 0, 0, 1, 1,
0.4065863, -0.1995583, 2.013065, 1, 0, 0, 1, 1,
0.4078919, 1.103519, 1.567643, 1, 0, 0, 1, 1,
0.4082398, -1.441529, 1.546097, 1, 0, 0, 1, 1,
0.4103929, -1.596798, 1.933311, 1, 0, 0, 1, 1,
0.4122454, 0.8631698, 0.7209807, 0, 0, 0, 1, 1,
0.413059, 0.1231952, 0.6802378, 0, 0, 0, 1, 1,
0.4135647, -1.732747, 3.674641, 0, 0, 0, 1, 1,
0.4173481, -0.1559824, 2.564677, 0, 0, 0, 1, 1,
0.4181865, -1.705344, 3.097809, 0, 0, 0, 1, 1,
0.4196987, 1.078917, 0.1728307, 0, 0, 0, 1, 1,
0.4197944, 2.44828, -1.369356, 0, 0, 0, 1, 1,
0.420034, 0.7066353, 0.7226326, 1, 1, 1, 1, 1,
0.4229976, -0.1217273, 2.27183, 1, 1, 1, 1, 1,
0.4230955, -0.8188408, 1.606845, 1, 1, 1, 1, 1,
0.4231269, -0.3142529, 3.95977, 1, 1, 1, 1, 1,
0.4231578, -1.094037, 2.691401, 1, 1, 1, 1, 1,
0.4265857, 0.6780851, 0.4541253, 1, 1, 1, 1, 1,
0.4281887, -1.259398, 4.520092, 1, 1, 1, 1, 1,
0.4361873, 1.030639, -0.5788134, 1, 1, 1, 1, 1,
0.4398336, -0.1764785, 2.395825, 1, 1, 1, 1, 1,
0.4402653, 0.7116934, 1.822683, 1, 1, 1, 1, 1,
0.4436187, 0.629886, -0.3804102, 1, 1, 1, 1, 1,
0.4476334, -1.057, 2.195412, 1, 1, 1, 1, 1,
0.4490421, -0.5966226, 2.461453, 1, 1, 1, 1, 1,
0.4494626, -0.4750871, 1.367551, 1, 1, 1, 1, 1,
0.4536816, -0.4370739, 2.048567, 1, 1, 1, 1, 1,
0.4636048, 0.4202803, 1.296192, 0, 0, 1, 1, 1,
0.4637514, 1.054181, -0.2084703, 1, 0, 0, 1, 1,
0.4669186, -0.6258164, 2.475765, 1, 0, 0, 1, 1,
0.4717487, -0.2391465, 1.824465, 1, 0, 0, 1, 1,
0.4819671, 1.117409, -2.382468, 1, 0, 0, 1, 1,
0.4896949, 2.115036, 4.146255, 1, 0, 0, 1, 1,
0.4917347, -0.1575572, 0.9019064, 0, 0, 0, 1, 1,
0.4990372, 0.2798285, 0.3383047, 0, 0, 0, 1, 1,
0.4991327, -1.906418, 2.767573, 0, 0, 0, 1, 1,
0.5001798, 0.6452122, 3.000692, 0, 0, 0, 1, 1,
0.5002345, -0.4143681, 1.442761, 0, 0, 0, 1, 1,
0.5100358, 0.1444289, 1.775025, 0, 0, 0, 1, 1,
0.510176, 2.135255, 1.40011, 0, 0, 0, 1, 1,
0.5120791, 0.7625555, 0.3590536, 1, 1, 1, 1, 1,
0.5137126, 0.3503016, 1.373668, 1, 1, 1, 1, 1,
0.5155953, 1.195039, 0.4834755, 1, 1, 1, 1, 1,
0.519985, -0.1704677, 0.8287753, 1, 1, 1, 1, 1,
0.5251125, 1.263404, -0.1095366, 1, 1, 1, 1, 1,
0.5284813, 1.476319, 2.910612, 1, 1, 1, 1, 1,
0.529617, 1.573795, 1.569052, 1, 1, 1, 1, 1,
0.5299709, -0.7502164, 2.878294, 1, 1, 1, 1, 1,
0.5325001, -1.159377, 1.727589, 1, 1, 1, 1, 1,
0.5401322, -1.118331, 2.786364, 1, 1, 1, 1, 1,
0.5408339, 0.0682084, 1.02364, 1, 1, 1, 1, 1,
0.5415391, 0.4363898, 0.765756, 1, 1, 1, 1, 1,
0.5431464, 0.4357634, 0.5779346, 1, 1, 1, 1, 1,
0.5475575, -0.005131072, 2.976337, 1, 1, 1, 1, 1,
0.5481355, 1.444095, 0.4428647, 1, 1, 1, 1, 1,
0.5492116, -0.3854839, 3.141273, 0, 0, 1, 1, 1,
0.5494242, -0.278399, 2.31336, 1, 0, 0, 1, 1,
0.5532834, -2.562066, 2.965405, 1, 0, 0, 1, 1,
0.5694606, -0.1248643, 1.627409, 1, 0, 0, 1, 1,
0.5704902, -0.3368758, 2.069094, 1, 0, 0, 1, 1,
0.573743, 0.509693, 0.5595868, 1, 0, 0, 1, 1,
0.5760248, -1.143499, 2.740206, 0, 0, 0, 1, 1,
0.5784432, -0.09154162, 0.7953742, 0, 0, 0, 1, 1,
0.587904, -0.2421606, 0.8678522, 0, 0, 0, 1, 1,
0.5893314, -0.1409837, 2.138151, 0, 0, 0, 1, 1,
0.5919189, 0.160904, 1.176612, 0, 0, 0, 1, 1,
0.594649, 0.6334107, 0.7460412, 0, 0, 0, 1, 1,
0.6050906, 0.440614, -0.5349252, 0, 0, 0, 1, 1,
0.606649, -1.039742, 3.951812, 1, 1, 1, 1, 1,
0.6125026, -0.6453133, 1.744449, 1, 1, 1, 1, 1,
0.6126156, 0.388883, 2.48714, 1, 1, 1, 1, 1,
0.6134464, 0.3450781, 0.6603242, 1, 1, 1, 1, 1,
0.6187118, 0.8847925, 0.1786706, 1, 1, 1, 1, 1,
0.6198876, -0.6808062, 3.397989, 1, 1, 1, 1, 1,
0.6200967, 0.1657147, 2.058822, 1, 1, 1, 1, 1,
0.6203107, -0.8488539, 2.994557, 1, 1, 1, 1, 1,
0.6246102, -0.1677783, 3.598794, 1, 1, 1, 1, 1,
0.6254238, 1.692904, -1.196107, 1, 1, 1, 1, 1,
0.6260561, 1.264677, -1.486076, 1, 1, 1, 1, 1,
0.628298, -0.0006907864, 0.4776979, 1, 1, 1, 1, 1,
0.6285401, 0.004396234, 2.686839, 1, 1, 1, 1, 1,
0.6343732, -2.046759, 5.085763, 1, 1, 1, 1, 1,
0.6378169, -1.045132, 1.485343, 1, 1, 1, 1, 1,
0.6384099, -0.2181355, 1.447828, 0, 0, 1, 1, 1,
0.6416276, 1.159854, 0.2085162, 1, 0, 0, 1, 1,
0.644736, 0.6236236, 2.290963, 1, 0, 0, 1, 1,
0.6462412, -0.3941029, 1.908793, 1, 0, 0, 1, 1,
0.6466191, -0.08493212, 1.599906, 1, 0, 0, 1, 1,
0.6476788, 0.1389177, 1.419859, 1, 0, 0, 1, 1,
0.6501461, -0.3147839, 2.843193, 0, 0, 0, 1, 1,
0.6532977, -0.6237943, 2.281516, 0, 0, 0, 1, 1,
0.6581463, -1.590605, 2.085683, 0, 0, 0, 1, 1,
0.6630956, 1.580989, -0.1654094, 0, 0, 0, 1, 1,
0.6688351, -0.07891952, -0.1755808, 0, 0, 0, 1, 1,
0.6735311, 1.140254, -0.5540819, 0, 0, 0, 1, 1,
0.6747514, 0.05013878, 1.368674, 0, 0, 0, 1, 1,
0.6754189, 0.6078849, 1.363505, 1, 1, 1, 1, 1,
0.675507, 0.1358959, 1.770706, 1, 1, 1, 1, 1,
0.6791494, 0.564604, 1.466516, 1, 1, 1, 1, 1,
0.6848458, 0.6204087, 0.1806781, 1, 1, 1, 1, 1,
0.6865402, 0.5182734, 1.443308, 1, 1, 1, 1, 1,
0.689737, 0.05079958, 1.27739, 1, 1, 1, 1, 1,
0.6920392, 0.4858388, 1.430042, 1, 1, 1, 1, 1,
0.6942447, -1.212704, 2.103569, 1, 1, 1, 1, 1,
0.6945538, -1.161746, 3.341365, 1, 1, 1, 1, 1,
0.7009884, -1.562081, 1.9042, 1, 1, 1, 1, 1,
0.7087852, -0.6115233, 2.540068, 1, 1, 1, 1, 1,
0.7175244, 0.8414036, 0.286202, 1, 1, 1, 1, 1,
0.7187462, -0.2929935, 1.750475, 1, 1, 1, 1, 1,
0.7229025, -1.088751, 1.481925, 1, 1, 1, 1, 1,
0.7370625, -0.1920533, 1.27895, 1, 1, 1, 1, 1,
0.7392476, 0.1914123, 0.8650328, 0, 0, 1, 1, 1,
0.7397156, -0.7573715, 1.391055, 1, 0, 0, 1, 1,
0.7519106, -0.5388365, 0.6796972, 1, 0, 0, 1, 1,
0.761665, -0.6644039, 2.203916, 1, 0, 0, 1, 1,
0.7644363, -0.4555469, 3.362677, 1, 0, 0, 1, 1,
0.7696424, 0.5939366, 0.06725211, 1, 0, 0, 1, 1,
0.7704605, -0.5539187, 2.080939, 0, 0, 0, 1, 1,
0.7718756, 2.49594, 0.3278541, 0, 0, 0, 1, 1,
0.7733099, -0.007599452, 2.460411, 0, 0, 0, 1, 1,
0.7736979, 1.760526, 1.175818, 0, 0, 0, 1, 1,
0.7786547, 1.446931, 1.427763, 0, 0, 0, 1, 1,
0.7799936, 0.868355, 1.138411, 0, 0, 0, 1, 1,
0.7813725, 0.9833655, -0.8143182, 0, 0, 0, 1, 1,
0.781629, 1.021803, -1.045238, 1, 1, 1, 1, 1,
0.7829902, -0.4995676, 2.515236, 1, 1, 1, 1, 1,
0.7830459, -0.166516, 2.698166, 1, 1, 1, 1, 1,
0.7881387, 0.4494946, 0.3056992, 1, 1, 1, 1, 1,
0.7894283, 1.204626, 3.048677, 1, 1, 1, 1, 1,
0.7905414, -0.7492831, 1.834132, 1, 1, 1, 1, 1,
0.7959059, -1.650729, 2.126286, 1, 1, 1, 1, 1,
0.7968736, -1.544525, 1.950384, 1, 1, 1, 1, 1,
0.7980087, 1.080238, 0.7451587, 1, 1, 1, 1, 1,
0.7996333, 0.002342172, 0.1062397, 1, 1, 1, 1, 1,
0.8089161, 0.2101169, 0.1409396, 1, 1, 1, 1, 1,
0.8199493, 0.8539188, 1.548126, 1, 1, 1, 1, 1,
0.8226058, 0.1826718, -0.1055121, 1, 1, 1, 1, 1,
0.8283718, 0.5078018, 2.283631, 1, 1, 1, 1, 1,
0.8314198, 0.36738, 0.9915168, 1, 1, 1, 1, 1,
0.8348345, 0.4228693, -0.1706352, 0, 0, 1, 1, 1,
0.8533497, 0.0671286, 0.6602217, 1, 0, 0, 1, 1,
0.853526, 0.3296803, 1.507458, 1, 0, 0, 1, 1,
0.8584489, -1.650427, 0.5252673, 1, 0, 0, 1, 1,
0.8592773, -0.5046846, 2.295594, 1, 0, 0, 1, 1,
0.8596637, 0.02044294, 2.128374, 1, 0, 0, 1, 1,
0.8629125, 1.131403, 1.736857, 0, 0, 0, 1, 1,
0.8711932, -0.8549591, 3.388152, 0, 0, 0, 1, 1,
0.8728052, -0.8085309, 2.378369, 0, 0, 0, 1, 1,
0.8784299, 0.4218014, 2.761235, 0, 0, 0, 1, 1,
0.8793921, -1.098593, 2.316123, 0, 0, 0, 1, 1,
0.8860814, 0.3706318, 1.39273, 0, 0, 0, 1, 1,
0.8896296, -0.04753644, 0.4720818, 0, 0, 0, 1, 1,
0.8928209, -1.288657, 1.183922, 1, 1, 1, 1, 1,
0.9031507, -0.3342272, 2.907311, 1, 1, 1, 1, 1,
0.9037219, 0.0314042, 3.463225, 1, 1, 1, 1, 1,
0.9089383, -1.370429, 1.378088, 1, 1, 1, 1, 1,
0.9265974, 1.378412, 0.8379009, 1, 1, 1, 1, 1,
0.9336444, 0.1020841, 0.001672801, 1, 1, 1, 1, 1,
0.9422343, 1.632142, 1.468725, 1, 1, 1, 1, 1,
0.9551104, -0.1112691, 1.655157, 1, 1, 1, 1, 1,
0.9591581, 1.207196, 1.41026, 1, 1, 1, 1, 1,
0.9597496, -1.600817, 2.878982, 1, 1, 1, 1, 1,
0.9614205, 0.2188072, 1.454729, 1, 1, 1, 1, 1,
0.9653555, -0.4348936, 0.2686917, 1, 1, 1, 1, 1,
0.9702256, -1.02335, 1.633235, 1, 1, 1, 1, 1,
0.9817156, 0.2875921, 0.9950108, 1, 1, 1, 1, 1,
0.9851446, -2.303147, 2.537654, 1, 1, 1, 1, 1,
0.9861677, -0.6197183, 2.292292, 0, 0, 1, 1, 1,
0.9875529, 0.8895386, -0.4186237, 1, 0, 0, 1, 1,
0.9944707, -1.286389, 2.367709, 1, 0, 0, 1, 1,
0.9949777, 0.8110225, -0.9416664, 1, 0, 0, 1, 1,
1.011676, -2.4285, 2.132417, 1, 0, 0, 1, 1,
1.034114, 0.796429, 0.8218378, 1, 0, 0, 1, 1,
1.034248, 0.9408216, 0.5361654, 0, 0, 0, 1, 1,
1.034504, 0.6169884, 0.2930104, 0, 0, 0, 1, 1,
1.048705, -0.7575702, 3.038453, 0, 0, 0, 1, 1,
1.059202, -0.4826064, 2.697684, 0, 0, 0, 1, 1,
1.060722, 0.6037592, 0.8553371, 0, 0, 0, 1, 1,
1.063418, 0.685196, 0.03348584, 0, 0, 0, 1, 1,
1.065371, -0.1731912, 1.344926, 0, 0, 0, 1, 1,
1.078274, -2.303738, 3.420816, 1, 1, 1, 1, 1,
1.085339, -1.009073, 3.759866, 1, 1, 1, 1, 1,
1.086639, 0.7127414, 0.7819323, 1, 1, 1, 1, 1,
1.088486, 0.05493519, 0.9365163, 1, 1, 1, 1, 1,
1.098774, -0.1842559, -0.8582044, 1, 1, 1, 1, 1,
1.103604, -0.4183691, 2.160294, 1, 1, 1, 1, 1,
1.105409, -1.249783, 2.801098, 1, 1, 1, 1, 1,
1.112299, -0.9226932, 2.594941, 1, 1, 1, 1, 1,
1.115486, -0.2857739, 2.84822, 1, 1, 1, 1, 1,
1.122231, 0.009033939, 2.368456, 1, 1, 1, 1, 1,
1.127669, 0.5845073, 1.88996, 1, 1, 1, 1, 1,
1.128415, -0.286979, 0.3786098, 1, 1, 1, 1, 1,
1.138658, -1.029313, 2.488162, 1, 1, 1, 1, 1,
1.145074, 1.471754, -0.8752652, 1, 1, 1, 1, 1,
1.147169, 0.7163883, 0.6871804, 1, 1, 1, 1, 1,
1.154332, -0.3857855, 3.342268, 0, 0, 1, 1, 1,
1.157739, -1.193282, 1.285051, 1, 0, 0, 1, 1,
1.163713, -3.046655, 3.217144, 1, 0, 0, 1, 1,
1.171168, 1.551384, 1.61509, 1, 0, 0, 1, 1,
1.179509, 0.3912557, -0.3077596, 1, 0, 0, 1, 1,
1.181773, -0.03525163, 1.667146, 1, 0, 0, 1, 1,
1.198779, 0.2460775, 1.825505, 0, 0, 0, 1, 1,
1.198943, 0.05134358, 1.74904, 0, 0, 0, 1, 1,
1.201319, 0.00463827, 0.965996, 0, 0, 0, 1, 1,
1.203304, 1.913923, 2.179239, 0, 0, 0, 1, 1,
1.205107, -0.384346, 2.253443, 0, 0, 0, 1, 1,
1.205848, 0.1447515, 0.1651511, 0, 0, 0, 1, 1,
1.2102, -1.387285, 1.341564, 0, 0, 0, 1, 1,
1.211354, -1.233277, 4.024904, 1, 1, 1, 1, 1,
1.215259, 1.652341, 0.6799693, 1, 1, 1, 1, 1,
1.21692, -0.4661641, 1.100841, 1, 1, 1, 1, 1,
1.223876, 0.0527761, 2.155463, 1, 1, 1, 1, 1,
1.228015, -2.102055, 2.378256, 1, 1, 1, 1, 1,
1.233974, 0.07807855, 2.599583, 1, 1, 1, 1, 1,
1.238577, 0.1392203, 1.11445, 1, 1, 1, 1, 1,
1.242279, 0.1472429, 0.3905062, 1, 1, 1, 1, 1,
1.242566, 1.385415, -0.1244779, 1, 1, 1, 1, 1,
1.251732, 1.485291, -0.524837, 1, 1, 1, 1, 1,
1.267703, -0.6147918, 1.096621, 1, 1, 1, 1, 1,
1.269779, 0.5904298, -0.2578799, 1, 1, 1, 1, 1,
1.288118, 0.476193, 1.675585, 1, 1, 1, 1, 1,
1.303009, 0.072092, -0.5443468, 1, 1, 1, 1, 1,
1.306056, -1.021855, 0.0532248, 1, 1, 1, 1, 1,
1.307927, -0.3891756, 2.064229, 0, 0, 1, 1, 1,
1.311505, 0.70523, 0.5720155, 1, 0, 0, 1, 1,
1.324989, 0.2374336, 3.111286, 1, 0, 0, 1, 1,
1.328225, -0.05421178, 3.737899, 1, 0, 0, 1, 1,
1.328608, 0.1366866, 1.957253, 1, 0, 0, 1, 1,
1.332845, -1.134252, 2.503611, 1, 0, 0, 1, 1,
1.335391, -0.462463, 1.709974, 0, 0, 0, 1, 1,
1.343869, -1.550176, 3.104547, 0, 0, 0, 1, 1,
1.352142, -0.4732001, 1.608997, 0, 0, 0, 1, 1,
1.352187, -1.601238, 4.118195, 0, 0, 0, 1, 1,
1.36509, -0.4026928, 0.5653356, 0, 0, 0, 1, 1,
1.375539, -0.09918246, 1.836982, 0, 0, 0, 1, 1,
1.391429, 0.4825322, 1.719557, 0, 0, 0, 1, 1,
1.39596, -1.461138, 3.075207, 1, 1, 1, 1, 1,
1.396027, 1.534699, 1.544762, 1, 1, 1, 1, 1,
1.396532, 0.4463988, 0.7896217, 1, 1, 1, 1, 1,
1.400574, 0.1186075, 1.104918, 1, 1, 1, 1, 1,
1.403873, -2.040192, 1.940147, 1, 1, 1, 1, 1,
1.412212, -1.783434, 3.634696, 1, 1, 1, 1, 1,
1.428435, -1.012254, 1.328013, 1, 1, 1, 1, 1,
1.432825, -0.5259132, 1.180283, 1, 1, 1, 1, 1,
1.435936, 2.650403, 0.4969455, 1, 1, 1, 1, 1,
1.442904, 0.6772321, 2.53875, 1, 1, 1, 1, 1,
1.44374, -0.9694743, 1.296842, 1, 1, 1, 1, 1,
1.446922, 0.4726458, 0.65056, 1, 1, 1, 1, 1,
1.453059, -0.936993, 3.014459, 1, 1, 1, 1, 1,
1.458111, -0.3006053, 0.228491, 1, 1, 1, 1, 1,
1.487824, -0.5702653, 2.185323, 1, 1, 1, 1, 1,
1.491472, -0.09083094, 1.598854, 0, 0, 1, 1, 1,
1.491891, -0.06723055, 1.695553, 1, 0, 0, 1, 1,
1.501497, 1.040067, 1.813664, 1, 0, 0, 1, 1,
1.515191, -0.2128511, 1.778864, 1, 0, 0, 1, 1,
1.515731, -0.2121923, 1.297089, 1, 0, 0, 1, 1,
1.533002, 0.4415813, 1.205231, 1, 0, 0, 1, 1,
1.559556, -2.725564, 3.129459, 0, 0, 0, 1, 1,
1.559688, 0.5800988, 0.5436758, 0, 0, 0, 1, 1,
1.561141, 1.057268, 3.318737, 0, 0, 0, 1, 1,
1.570894, 0.4084424, -0.2498729, 0, 0, 0, 1, 1,
1.57925, -1.091791, 2.335143, 0, 0, 0, 1, 1,
1.583309, 0.07551371, 0.9151813, 0, 0, 0, 1, 1,
1.584354, 0.2125368, 0.8691403, 0, 0, 0, 1, 1,
1.616836, 0.8409339, 0.9669173, 1, 1, 1, 1, 1,
1.628875, 1.090254, -0.6995653, 1, 1, 1, 1, 1,
1.633843, -0.3878995, 2.460461, 1, 1, 1, 1, 1,
1.648773, 0.140043, 0.3822616, 1, 1, 1, 1, 1,
1.664693, 0.3697509, 0.3046136, 1, 1, 1, 1, 1,
1.669903, -0.5186424, 2.434873, 1, 1, 1, 1, 1,
1.689743, 0.5081779, 1.877737, 1, 1, 1, 1, 1,
1.696602, 1.036723, 0.268597, 1, 1, 1, 1, 1,
1.707677, -0.7392327, 2.502024, 1, 1, 1, 1, 1,
1.709044, 0.2617741, 0.3479379, 1, 1, 1, 1, 1,
1.718239, 0.6079624, 2.13098, 1, 1, 1, 1, 1,
1.722156, -0.3194905, 0.3976548, 1, 1, 1, 1, 1,
1.731227, 0.2989709, 2.15214, 1, 1, 1, 1, 1,
1.732965, 2.126456, 1.311022, 1, 1, 1, 1, 1,
1.739879, 0.2681911, -0.3143065, 1, 1, 1, 1, 1,
1.74317, -0.6678502, 1.091595, 0, 0, 1, 1, 1,
1.792084, -0.4586537, 1.067682, 1, 0, 0, 1, 1,
1.792943, 1.649017, -1.043532, 1, 0, 0, 1, 1,
1.795394, -0.9650307, 1.165004, 1, 0, 0, 1, 1,
1.796132, 0.01888674, 2.614723, 1, 0, 0, 1, 1,
1.806911, 0.7797601, -0.008195802, 1, 0, 0, 1, 1,
1.81034, 0.3961078, 2.042387, 0, 0, 0, 1, 1,
1.833388, -1.241174, 2.206006, 0, 0, 0, 1, 1,
1.833484, 0.2400538, 1.205811, 0, 0, 0, 1, 1,
1.847172, -0.3011162, 3.857546, 0, 0, 0, 1, 1,
1.853228, -0.7900979, 3.043207, 0, 0, 0, 1, 1,
1.862621, -2.856381, 3.586763, 0, 0, 0, 1, 1,
1.869485, -0.22787, 1.167452, 0, 0, 0, 1, 1,
1.906201, 1.95464, 1.48341, 1, 1, 1, 1, 1,
1.909156, 2.4656, 1.540419, 1, 1, 1, 1, 1,
1.946681, -1.852388, 3.690364, 1, 1, 1, 1, 1,
1.963979, -0.7229165, 1.977245, 1, 1, 1, 1, 1,
1.973651, 1.121602, 1.7591, 1, 1, 1, 1, 1,
1.980836, 0.06222958, -0.9460591, 1, 1, 1, 1, 1,
1.990301, 0.5777346, 0.8590544, 1, 1, 1, 1, 1,
1.994922, -2.223889, 1.75177, 1, 1, 1, 1, 1,
2.005203, 0.3242467, 0.9427119, 1, 1, 1, 1, 1,
2.019257, 0.8459641, 0.9391476, 1, 1, 1, 1, 1,
2.044689, -0.860821, 3.092193, 1, 1, 1, 1, 1,
2.12124, -0.3976818, 4.000125, 1, 1, 1, 1, 1,
2.126713, -0.745818, 1.189705, 1, 1, 1, 1, 1,
2.127634, -0.3661824, -0.9096198, 1, 1, 1, 1, 1,
2.137662, 1.446492, 0.4582546, 1, 1, 1, 1, 1,
2.193816, 0.9554104, -0.02927423, 0, 0, 1, 1, 1,
2.219052, 0.5246439, 0.9257768, 1, 0, 0, 1, 1,
2.219302, 1.869355, 0.3358472, 1, 0, 0, 1, 1,
2.222036, -4.134865, 1.342537, 1, 0, 0, 1, 1,
2.236622, -0.8078263, 2.764692, 1, 0, 0, 1, 1,
2.238758, 0.6602728, 1.32366, 1, 0, 0, 1, 1,
2.291645, -0.3491936, 2.504909, 0, 0, 0, 1, 1,
2.300161, 0.199145, 3.0904, 0, 0, 0, 1, 1,
2.333319, -0.1676727, 0.2473103, 0, 0, 0, 1, 1,
2.383382, 0.3201686, 2.837223, 0, 0, 0, 1, 1,
2.521307, -0.3284593, 2.553378, 0, 0, 0, 1, 1,
2.593439, -0.9829289, 3.500562, 0, 0, 0, 1, 1,
2.603654, -1.330275, 1.521683, 0, 0, 0, 1, 1,
2.616911, 0.9142011, 1.971901, 1, 1, 1, 1, 1,
2.723853, -1.564494, 2.215618, 1, 1, 1, 1, 1,
3.35822, -0.323621, 0.7688096, 1, 1, 1, 1, 1,
3.530998, 1.485616, 1.099913, 1, 1, 1, 1, 1,
3.624335, -1.627656, 1.121329, 1, 1, 1, 1, 1,
3.650097, -1.619769, 1.574047, 1, 1, 1, 1, 1,
3.940216, -0.5455738, 0.1508937, 1, 1, 1, 1, 1
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
var radius = 10.40545;
var distance = 36.54871;
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
mvMatrix.translate( -0.4527764, 0.6143032, 0.6070464 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.54871);
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
