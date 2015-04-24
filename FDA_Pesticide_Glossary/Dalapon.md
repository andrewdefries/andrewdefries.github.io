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
-3.051792, 0.973785, -1.891374, 1, 0, 0, 1,
-2.862432, 0.8224856, -1.182745, 1, 0.007843138, 0, 1,
-2.617175, 0.8861424, -0.5476798, 1, 0.01176471, 0, 1,
-2.613148, 1.685929, -0.6456101, 1, 0.01960784, 0, 1,
-2.579677, -0.6190856, 0.9009894, 1, 0.02352941, 0, 1,
-2.488335, -0.6923478, -1.529591, 1, 0.03137255, 0, 1,
-2.364814, -1.215303, -2.437575, 1, 0.03529412, 0, 1,
-2.323569, 0.0003522276, -1.133873, 1, 0.04313726, 0, 1,
-2.299984, 0.5086446, -1.096322, 1, 0.04705882, 0, 1,
-2.289333, 0.8464836, -0.8298855, 1, 0.05490196, 0, 1,
-2.275823, -0.3701756, -2.439913, 1, 0.05882353, 0, 1,
-2.255257, 0.3224115, -1.234999, 1, 0.06666667, 0, 1,
-2.250706, 1.080597, -1.0787, 1, 0.07058824, 0, 1,
-2.201494, 0.9489614, -0.07979911, 1, 0.07843138, 0, 1,
-2.146876, -0.3514165, -1.171366, 1, 0.08235294, 0, 1,
-2.146318, -1.074053, -1.319568, 1, 0.09019608, 0, 1,
-2.137259, 0.1388091, -0.7573991, 1, 0.09411765, 0, 1,
-2.101106, 1.385715, -0.1394513, 1, 0.1019608, 0, 1,
-2.100706, 0.5507146, -2.134461, 1, 0.1098039, 0, 1,
-2.093542, -1.069491, -2.845962, 1, 0.1137255, 0, 1,
-2.054838, 0.7442167, -1.075155, 1, 0.1215686, 0, 1,
-2.040579, 0.7227255, -1.884167, 1, 0.1254902, 0, 1,
-2.034563, 0.4741901, -3.100398, 1, 0.1333333, 0, 1,
-2.020489, 1.181406, -1.967623, 1, 0.1372549, 0, 1,
-1.99923, 0.3234184, -1.775237, 1, 0.145098, 0, 1,
-1.994432, 1.134626, -2.956168, 1, 0.1490196, 0, 1,
-1.958311, -0.560478, -1.836239, 1, 0.1568628, 0, 1,
-1.939415, 0.6668027, -2.287169, 1, 0.1607843, 0, 1,
-1.938786, -1.036234, -2.752946, 1, 0.1686275, 0, 1,
-1.93829, -1.674253, -2.436325, 1, 0.172549, 0, 1,
-1.931475, 0.632285, -0.1253336, 1, 0.1803922, 0, 1,
-1.892456, -1.748961, -3.347329, 1, 0.1843137, 0, 1,
-1.879442, 0.1185702, 0.9393613, 1, 0.1921569, 0, 1,
-1.821179, -1.539227, -2.373654, 1, 0.1960784, 0, 1,
-1.799368, 0.3575152, -0.9083885, 1, 0.2039216, 0, 1,
-1.7939, -0.773667, -0.5157067, 1, 0.2117647, 0, 1,
-1.788001, -0.6283728, -2.177366, 1, 0.2156863, 0, 1,
-1.779949, 1.292905, -1.053921, 1, 0.2235294, 0, 1,
-1.764011, -1.383748, 1.662236, 1, 0.227451, 0, 1,
-1.762269, 0.2437107, -0.9806697, 1, 0.2352941, 0, 1,
-1.760696, 0.07581009, -2.336926, 1, 0.2392157, 0, 1,
-1.756055, -1.151165, -2.370293, 1, 0.2470588, 0, 1,
-1.747822, 1.756488, -0.7374128, 1, 0.2509804, 0, 1,
-1.745666, 0.428839, -2.098587, 1, 0.2588235, 0, 1,
-1.739507, 1.020451, -0.3138131, 1, 0.2627451, 0, 1,
-1.738216, 1.215578, -2.399465, 1, 0.2705882, 0, 1,
-1.732508, 0.4581449, -2.550773, 1, 0.2745098, 0, 1,
-1.695409, 0.09895229, -1.943994, 1, 0.282353, 0, 1,
-1.694493, 1.198742, -1.109402, 1, 0.2862745, 0, 1,
-1.684081, 0.811915, -1.138325, 1, 0.2941177, 0, 1,
-1.655362, -1.050351, -3.574712, 1, 0.3019608, 0, 1,
-1.653189, 0.211256, -1.134831, 1, 0.3058824, 0, 1,
-1.619215, 0.6588151, 0.1765591, 1, 0.3137255, 0, 1,
-1.602845, 1.644739, -0.8538268, 1, 0.3176471, 0, 1,
-1.586751, 2.173286, -0.600108, 1, 0.3254902, 0, 1,
-1.58442, -1.050742, -2.962962, 1, 0.3294118, 0, 1,
-1.576825, -0.4650114, -1.337463, 1, 0.3372549, 0, 1,
-1.555489, -0.02831324, -1.987018, 1, 0.3411765, 0, 1,
-1.555023, 0.8578433, -0.8123613, 1, 0.3490196, 0, 1,
-1.554205, -1.526524, -3.519925, 1, 0.3529412, 0, 1,
-1.551026, -2.201105, -2.946856, 1, 0.3607843, 0, 1,
-1.540847, -0.2280297, -0.8670318, 1, 0.3647059, 0, 1,
-1.531738, 0.227171, -0.06712826, 1, 0.372549, 0, 1,
-1.528871, -0.02779121, -0.6725573, 1, 0.3764706, 0, 1,
-1.520073, 1.081029, -0.5327777, 1, 0.3843137, 0, 1,
-1.518911, -0.8209243, -2.755178, 1, 0.3882353, 0, 1,
-1.513023, 1.242372, -0.3047251, 1, 0.3960784, 0, 1,
-1.505937, -0.5382754, -1.849242, 1, 0.4039216, 0, 1,
-1.505632, -0.6310191, -1.279005, 1, 0.4078431, 0, 1,
-1.502151, -2.088598, -2.532022, 1, 0.4156863, 0, 1,
-1.499406, -0.04520864, -1.344707, 1, 0.4196078, 0, 1,
-1.49434, 0.3027826, -1.200746, 1, 0.427451, 0, 1,
-1.480535, -1.189309, -1.307082, 1, 0.4313726, 0, 1,
-1.469105, 1.673151, 0.7454241, 1, 0.4392157, 0, 1,
-1.460379, 1.123423, 0.7957261, 1, 0.4431373, 0, 1,
-1.45372, 0.9011284, -3.320931, 1, 0.4509804, 0, 1,
-1.445874, -1.324477, -3.874215, 1, 0.454902, 0, 1,
-1.431514, 1.798001, -1.991939, 1, 0.4627451, 0, 1,
-1.429069, -0.4932527, -2.094515, 1, 0.4666667, 0, 1,
-1.427005, 1.019561, -0.445, 1, 0.4745098, 0, 1,
-1.426858, -2.498921, -3.023471, 1, 0.4784314, 0, 1,
-1.414596, 1.164364, -0.7180284, 1, 0.4862745, 0, 1,
-1.409022, 0.2536131, -0.1949382, 1, 0.4901961, 0, 1,
-1.408836, -0.9260812, -1.37632, 1, 0.4980392, 0, 1,
-1.400969, -1.356989, -2.276229, 1, 0.5058824, 0, 1,
-1.395438, 0.9837822, -0.3264191, 1, 0.509804, 0, 1,
-1.389973, 0.957489, -0.8017665, 1, 0.5176471, 0, 1,
-1.387027, -0.4832383, -2.457447, 1, 0.5215687, 0, 1,
-1.38549, -1.298862, -1.007262, 1, 0.5294118, 0, 1,
-1.376617, -1.903053, -1.87678, 1, 0.5333334, 0, 1,
-1.375885, -1.889146, -2.151989, 1, 0.5411765, 0, 1,
-1.375381, 0.1828648, -1.030571, 1, 0.5450981, 0, 1,
-1.35595, 0.05378237, -1.239356, 1, 0.5529412, 0, 1,
-1.3549, -2.207512, -2.792958, 1, 0.5568628, 0, 1,
-1.345639, 0.1179819, -1.401768, 1, 0.5647059, 0, 1,
-1.339216, 0.4902185, -0.745055, 1, 0.5686275, 0, 1,
-1.335498, 0.8700197, 0.01027902, 1, 0.5764706, 0, 1,
-1.324782, 1.04965, -2.937967, 1, 0.5803922, 0, 1,
-1.318677, -0.4208262, -0.5850721, 1, 0.5882353, 0, 1,
-1.316719, 1.466134, 0.1401551, 1, 0.5921569, 0, 1,
-1.310454, 0.201435, 0.06072815, 1, 0.6, 0, 1,
-1.297544, -0.04270037, -0.9854344, 1, 0.6078432, 0, 1,
-1.29351, 0.9082007, -0.6274801, 1, 0.6117647, 0, 1,
-1.290052, 0.7579356, -2.04337, 1, 0.6196079, 0, 1,
-1.271079, -1.209153, -1.510776, 1, 0.6235294, 0, 1,
-1.26876, -0.6827853, -2.931216, 1, 0.6313726, 0, 1,
-1.258084, -0.7341662, -3.048111, 1, 0.6352941, 0, 1,
-1.255828, 1.33992, -0.5639465, 1, 0.6431373, 0, 1,
-1.25493, -0.9632185, -1.552148, 1, 0.6470588, 0, 1,
-1.249607, 0.03812373, -3.888724, 1, 0.654902, 0, 1,
-1.245154, -0.9558877, -2.520705, 1, 0.6588235, 0, 1,
-1.243688, -0.2207179, -2.779981, 1, 0.6666667, 0, 1,
-1.240187, 0.6574766, -1.048071, 1, 0.6705883, 0, 1,
-1.23784, 0.4550526, -0.8010712, 1, 0.6784314, 0, 1,
-1.23649, 1.337413, -2.703257, 1, 0.682353, 0, 1,
-1.232169, 0.2135184, -3.589365, 1, 0.6901961, 0, 1,
-1.231152, -0.6710396, -2.868107, 1, 0.6941177, 0, 1,
-1.221623, 0.807054, -0.8725979, 1, 0.7019608, 0, 1,
-1.206055, -0.451555, -2.630153, 1, 0.7098039, 0, 1,
-1.183833, 1.249871, 0.7811971, 1, 0.7137255, 0, 1,
-1.183535, -0.3481804, -2.329642, 1, 0.7215686, 0, 1,
-1.166859, -0.6592401, -3.073891, 1, 0.7254902, 0, 1,
-1.163365, -1.653975, -1.259899, 1, 0.7333333, 0, 1,
-1.15926, -0.7952092, -3.13965, 1, 0.7372549, 0, 1,
-1.154991, -1.526494, -3.278505, 1, 0.7450981, 0, 1,
-1.154374, -0.3750303, -3.230929, 1, 0.7490196, 0, 1,
-1.143921, -0.2988157, -0.3207913, 1, 0.7568628, 0, 1,
-1.132857, -0.7101944, -2.050378, 1, 0.7607843, 0, 1,
-1.131173, 0.4181874, -2.064625, 1, 0.7686275, 0, 1,
-1.127347, 0.3612682, -1.077994, 1, 0.772549, 0, 1,
-1.125744, 0.6436856, -0.8622065, 1, 0.7803922, 0, 1,
-1.119851, -2.008819, -1.94313, 1, 0.7843137, 0, 1,
-1.115699, -0.3647539, -2.326042, 1, 0.7921569, 0, 1,
-1.114128, 0.6520842, -0.6850727, 1, 0.7960784, 0, 1,
-1.108933, -0.06920013, -1.196552, 1, 0.8039216, 0, 1,
-1.106238, 0.6403377, -1.720924, 1, 0.8117647, 0, 1,
-1.084815, 2.295307, -0.8050197, 1, 0.8156863, 0, 1,
-1.068506, -0.9518695, -1.346501, 1, 0.8235294, 0, 1,
-1.063167, -0.3826445, -2.197772, 1, 0.827451, 0, 1,
-1.060191, -0.7058518, -2.287565, 1, 0.8352941, 0, 1,
-1.035552, 0.4243936, -0.5854732, 1, 0.8392157, 0, 1,
-1.028662, 0.2770593, -0.7537587, 1, 0.8470588, 0, 1,
-1.018522, -0.33303, -2.186093, 1, 0.8509804, 0, 1,
-1.018121, -0.8332902, -1.880982, 1, 0.8588235, 0, 1,
-1.01391, 0.2537455, 0.4399327, 1, 0.8627451, 0, 1,
-1.011973, -1.286754, -2.444606, 1, 0.8705882, 0, 1,
-1.009827, -0.8453067, -0.6871881, 1, 0.8745098, 0, 1,
-1.006613, 0.6961444, -0.02647559, 1, 0.8823529, 0, 1,
-0.9928568, -1.692489, -2.06605, 1, 0.8862745, 0, 1,
-0.9858453, 2.328631, -2.532325, 1, 0.8941177, 0, 1,
-0.9815129, -1.42452, -2.033985, 1, 0.8980392, 0, 1,
-0.9814631, 0.3688485, -0.5690923, 1, 0.9058824, 0, 1,
-0.9747746, -0.02765001, -1.510789, 1, 0.9137255, 0, 1,
-0.9744195, 1.474006, 0.07937477, 1, 0.9176471, 0, 1,
-0.9635557, 1.325828, -1.468957, 1, 0.9254902, 0, 1,
-0.9604169, -0.9528684, -1.77415, 1, 0.9294118, 0, 1,
-0.9602942, 0.9824418, -1.859338, 1, 0.9372549, 0, 1,
-0.953505, 0.6060743, -1.192861, 1, 0.9411765, 0, 1,
-0.948579, 0.04106759, -0.5425994, 1, 0.9490196, 0, 1,
-0.9419755, 0.4355662, -1.635202, 1, 0.9529412, 0, 1,
-0.9407972, 1.722251, 0.3545254, 1, 0.9607843, 0, 1,
-0.9344952, -0.6587893, -0.4815206, 1, 0.9647059, 0, 1,
-0.9331613, -1.082331, -2.979344, 1, 0.972549, 0, 1,
-0.9308327, 0.7476057, -0.9789807, 1, 0.9764706, 0, 1,
-0.9270123, 1.089039, -0.6920494, 1, 0.9843137, 0, 1,
-0.924601, 1.53118, -0.7260309, 1, 0.9882353, 0, 1,
-0.9217179, 0.9715364, -0.7669911, 1, 0.9960784, 0, 1,
-0.9213127, 1.482753, -0.2455956, 0.9960784, 1, 0, 1,
-0.9083756, 1.166297, -1.695399, 0.9921569, 1, 0, 1,
-0.8998108, -0.8666613, -2.626392, 0.9843137, 1, 0, 1,
-0.8981119, 0.5498962, -0.593094, 0.9803922, 1, 0, 1,
-0.8936689, -0.8264994, -1.380553, 0.972549, 1, 0, 1,
-0.893655, 0.4022112, -1.534393, 0.9686275, 1, 0, 1,
-0.8898927, -0.1907246, -3.058999, 0.9607843, 1, 0, 1,
-0.8825564, -0.716049, -0.8136811, 0.9568627, 1, 0, 1,
-0.8804971, 0.08146115, -1.387862, 0.9490196, 1, 0, 1,
-0.8779856, 2.132859, 1.303053, 0.945098, 1, 0, 1,
-0.8651485, 0.8993512, 0.1515624, 0.9372549, 1, 0, 1,
-0.8619131, 0.6014999, -1.384404, 0.9333333, 1, 0, 1,
-0.8549714, -0.06285675, -2.276999, 0.9254902, 1, 0, 1,
-0.8545907, 0.5072563, -2.530765, 0.9215686, 1, 0, 1,
-0.8507341, 1.514812, -0.6175387, 0.9137255, 1, 0, 1,
-0.8492873, -0.05749372, -1.658046, 0.9098039, 1, 0, 1,
-0.8447952, -1.566972, -3.448294, 0.9019608, 1, 0, 1,
-0.8395974, -1.060203, -2.452954, 0.8941177, 1, 0, 1,
-0.8338683, -0.4965826, -1.299704, 0.8901961, 1, 0, 1,
-0.833482, 0.7154402, 0.1048606, 0.8823529, 1, 0, 1,
-0.828709, -0.2633837, -1.954152, 0.8784314, 1, 0, 1,
-0.8205454, 0.6385152, -1.330478, 0.8705882, 1, 0, 1,
-0.8151169, -1.244466, -4.287501, 0.8666667, 1, 0, 1,
-0.81496, 1.337129, -0.9047148, 0.8588235, 1, 0, 1,
-0.8138958, 0.3299542, -2.563118, 0.854902, 1, 0, 1,
-0.8138464, 0.004454839, -2.40528, 0.8470588, 1, 0, 1,
-0.8086486, -0.102267, -1.044291, 0.8431373, 1, 0, 1,
-0.8051209, 0.7736461, -0.5002288, 0.8352941, 1, 0, 1,
-0.8042793, -0.3545306, -1.332244, 0.8313726, 1, 0, 1,
-0.8028254, -0.1842484, -0.3718769, 0.8235294, 1, 0, 1,
-0.8005195, 0.8503581, -0.6350063, 0.8196079, 1, 0, 1,
-0.7944257, -0.1376116, -1.212345, 0.8117647, 1, 0, 1,
-0.7920514, -0.4280514, -1.754387, 0.8078431, 1, 0, 1,
-0.7893353, -1.508008, -3.778292, 0.8, 1, 0, 1,
-0.7825196, 0.3764247, -1.816082, 0.7921569, 1, 0, 1,
-0.7821562, -0.01262516, -1.524489, 0.7882353, 1, 0, 1,
-0.7758328, -0.1755413, -2.027117, 0.7803922, 1, 0, 1,
-0.7743931, -0.7621093, -2.709385, 0.7764706, 1, 0, 1,
-0.759517, -0.5998087, -3.629208, 0.7686275, 1, 0, 1,
-0.7353838, -1.440234, -3.006346, 0.7647059, 1, 0, 1,
-0.7336022, 0.05660319, -3.33504, 0.7568628, 1, 0, 1,
-0.7326561, -0.9235764, -2.914714, 0.7529412, 1, 0, 1,
-0.73162, 0.2756366, -1.690795, 0.7450981, 1, 0, 1,
-0.7301739, -0.8949174, -4.276548, 0.7411765, 1, 0, 1,
-0.7276959, 1.873633, -0.7586148, 0.7333333, 1, 0, 1,
-0.721278, -0.6202201, -2.845072, 0.7294118, 1, 0, 1,
-0.72049, 0.1189526, -0.8707276, 0.7215686, 1, 0, 1,
-0.7189129, -0.739251, -2.58129, 0.7176471, 1, 0, 1,
-0.7148185, 0.1733873, -2.672833, 0.7098039, 1, 0, 1,
-0.7091714, -0.2568023, -0.2212331, 0.7058824, 1, 0, 1,
-0.7083101, -0.4698626, -2.178784, 0.6980392, 1, 0, 1,
-0.7051477, -1.428305, -3.166264, 0.6901961, 1, 0, 1,
-0.7028055, 1.544282, -0.9611996, 0.6862745, 1, 0, 1,
-0.6992578, -0.5585492, -3.285239, 0.6784314, 1, 0, 1,
-0.6988313, -2.041663, -3.823345, 0.6745098, 1, 0, 1,
-0.6954807, -0.442742, -0.5784596, 0.6666667, 1, 0, 1,
-0.6949466, -0.56578, -1.315038, 0.6627451, 1, 0, 1,
-0.6878076, -0.8319762, -2.975304, 0.654902, 1, 0, 1,
-0.6792855, 0.05530918, -0.7370777, 0.6509804, 1, 0, 1,
-0.6767405, 1.56427, -0.4964687, 0.6431373, 1, 0, 1,
-0.6759063, 0.6714671, -0.37504, 0.6392157, 1, 0, 1,
-0.6669463, -1.116175, -2.697226, 0.6313726, 1, 0, 1,
-0.6642811, 0.9007523, -0.7705288, 0.627451, 1, 0, 1,
-0.6626953, -0.3934311, -3.610824, 0.6196079, 1, 0, 1,
-0.6590078, -0.4951242, -1.911628, 0.6156863, 1, 0, 1,
-0.65274, -1.061668, -1.779145, 0.6078432, 1, 0, 1,
-0.6502436, -0.6925678, -1.436082, 0.6039216, 1, 0, 1,
-0.6490052, -0.4118975, -2.557427, 0.5960785, 1, 0, 1,
-0.6488294, -0.520578, -3.387502, 0.5882353, 1, 0, 1,
-0.6478277, 1.023817, -1.754491, 0.5843138, 1, 0, 1,
-0.6427275, -0.1956267, -2.234626, 0.5764706, 1, 0, 1,
-0.6426867, 0.4808043, -1.22403, 0.572549, 1, 0, 1,
-0.6413879, 0.5991515, -1.624453, 0.5647059, 1, 0, 1,
-0.6327469, 0.2265179, -0.6442137, 0.5607843, 1, 0, 1,
-0.6280082, 0.7503141, -1.545092, 0.5529412, 1, 0, 1,
-0.6279916, -1.524949, -3.353277, 0.5490196, 1, 0, 1,
-0.6253998, 2.073974, 0.3661192, 0.5411765, 1, 0, 1,
-0.6152986, -0.1910614, 0.0471454, 0.5372549, 1, 0, 1,
-0.6139866, 0.8425138, -1.145784, 0.5294118, 1, 0, 1,
-0.612186, 0.8694819, 0.7394568, 0.5254902, 1, 0, 1,
-0.6093837, -1.530818, -2.535528, 0.5176471, 1, 0, 1,
-0.6063222, 0.08416853, -1.013083, 0.5137255, 1, 0, 1,
-0.6022478, -0.6197797, -3.199431, 0.5058824, 1, 0, 1,
-0.6007845, 0.1595758, -1.675059, 0.5019608, 1, 0, 1,
-0.6004828, 2.71505, 0.1635818, 0.4941176, 1, 0, 1,
-0.600474, -0.06817408, -1.0318, 0.4862745, 1, 0, 1,
-0.5991306, -0.7753549, -1.326403, 0.4823529, 1, 0, 1,
-0.5949358, -0.9354755, -4.582994, 0.4745098, 1, 0, 1,
-0.5848199, -0.9847987, -1.738564, 0.4705882, 1, 0, 1,
-0.5794706, -0.7558119, -3.134781, 0.4627451, 1, 0, 1,
-0.5723626, 0.2430297, -0.05634432, 0.4588235, 1, 0, 1,
-0.5711542, -0.3688479, -3.711086, 0.4509804, 1, 0, 1,
-0.5675241, -0.6003541, -2.706667, 0.4470588, 1, 0, 1,
-0.5602679, 1.118602, -2.474706, 0.4392157, 1, 0, 1,
-0.5601994, 1.141233, -0.5125012, 0.4352941, 1, 0, 1,
-0.5578308, -0.5725526, -2.980339, 0.427451, 1, 0, 1,
-0.5533766, 1.149016, -0.6043289, 0.4235294, 1, 0, 1,
-0.5519957, -1.561002, -2.454774, 0.4156863, 1, 0, 1,
-0.5519829, 0.03357863, -2.331241, 0.4117647, 1, 0, 1,
-0.5513352, -0.8539088, -3.849929, 0.4039216, 1, 0, 1,
-0.5511248, -0.4053626, -3.854683, 0.3960784, 1, 0, 1,
-0.5422277, 2.083014, -1.586262, 0.3921569, 1, 0, 1,
-0.5362272, -0.04420027, -2.847082, 0.3843137, 1, 0, 1,
-0.5342336, 0.1447517, -2.096852, 0.3803922, 1, 0, 1,
-0.524655, -2.368155, -3.75906, 0.372549, 1, 0, 1,
-0.5196404, 0.3023584, -1.327446, 0.3686275, 1, 0, 1,
-0.5167538, 0.5040469, -0.1993058, 0.3607843, 1, 0, 1,
-0.5134355, 0.1080613, -1.675969, 0.3568628, 1, 0, 1,
-0.5096189, -1.335331, -0.9795098, 0.3490196, 1, 0, 1,
-0.5076364, 0.3870012, -0.6429982, 0.345098, 1, 0, 1,
-0.5053644, 1.733661, -1.079536, 0.3372549, 1, 0, 1,
-0.5040239, 0.4675376, -1.505453, 0.3333333, 1, 0, 1,
-0.502685, -0.1500706, -3.67541, 0.3254902, 1, 0, 1,
-0.5026559, -1.597446, -3.703763, 0.3215686, 1, 0, 1,
-0.4999472, -0.5968525, -2.053376, 0.3137255, 1, 0, 1,
-0.4970937, 0.6578955, -2.478081, 0.3098039, 1, 0, 1,
-0.4961938, -0.4900588, -3.436138, 0.3019608, 1, 0, 1,
-0.4953731, -0.4385071, -2.261568, 0.2941177, 1, 0, 1,
-0.4953163, 0.005876066, -3.781578, 0.2901961, 1, 0, 1,
-0.4926653, -1.317923, -2.764083, 0.282353, 1, 0, 1,
-0.4921081, 0.09915963, -1.356852, 0.2784314, 1, 0, 1,
-0.4911359, 1.428393, 0.6342216, 0.2705882, 1, 0, 1,
-0.4910054, 0.4016769, -1.442305, 0.2666667, 1, 0, 1,
-0.4849326, 0.5600809, -0.3919554, 0.2588235, 1, 0, 1,
-0.4838464, -0.3499152, -0.5517106, 0.254902, 1, 0, 1,
-0.4804094, 0.01628183, -0.2396598, 0.2470588, 1, 0, 1,
-0.4771162, 0.4025894, -2.029193, 0.2431373, 1, 0, 1,
-0.4761701, 0.7933093, -1.17161, 0.2352941, 1, 0, 1,
-0.4706097, -2.603173, -2.2773, 0.2313726, 1, 0, 1,
-0.4670301, 0.1290157, -3.468196, 0.2235294, 1, 0, 1,
-0.4666188, -1.23024, -0.6315482, 0.2196078, 1, 0, 1,
-0.4655122, 0.255115, -2.14847, 0.2117647, 1, 0, 1,
-0.4643937, 1.997389, -0.9585266, 0.2078431, 1, 0, 1,
-0.4637184, -1.009958, -2.335495, 0.2, 1, 0, 1,
-0.4633918, -0.4612427, -2.475528, 0.1921569, 1, 0, 1,
-0.4629988, -0.9967313, -2.553406, 0.1882353, 1, 0, 1,
-0.4627838, 2.533283, 1.061218, 0.1803922, 1, 0, 1,
-0.4534467, -0.3684602, -3.823162, 0.1764706, 1, 0, 1,
-0.4502557, -0.3172655, -1.655313, 0.1686275, 1, 0, 1,
-0.450106, -0.6888548, -2.405261, 0.1647059, 1, 0, 1,
-0.4470893, -0.6169968, -1.91687, 0.1568628, 1, 0, 1,
-0.4412101, 0.9190499, 0.2972922, 0.1529412, 1, 0, 1,
-0.4407189, 0.1924976, 1.661436, 0.145098, 1, 0, 1,
-0.4398806, 1.676376, -1.378442, 0.1411765, 1, 0, 1,
-0.4345116, 0.08905144, -2.401364, 0.1333333, 1, 0, 1,
-0.4301362, -1.448744, -4.002475, 0.1294118, 1, 0, 1,
-0.4281636, 2.079648, -0.8379449, 0.1215686, 1, 0, 1,
-0.4262283, 0.7482342, -2.071678, 0.1176471, 1, 0, 1,
-0.4260827, 0.3676739, -1.057338, 0.1098039, 1, 0, 1,
-0.4239813, 1.652492, -0.3243804, 0.1058824, 1, 0, 1,
-0.4234803, 0.2160835, -0.3855792, 0.09803922, 1, 0, 1,
-0.420236, -0.7142816, -1.864161, 0.09019608, 1, 0, 1,
-0.4169188, -0.5948527, -3.68817, 0.08627451, 1, 0, 1,
-0.4105327, 0.977937, -1.631251, 0.07843138, 1, 0, 1,
-0.4064749, 0.4505923, -0.9251192, 0.07450981, 1, 0, 1,
-0.4012463, -0.1921279, -1.472257, 0.06666667, 1, 0, 1,
-0.3956159, -1.988131, -2.872307, 0.0627451, 1, 0, 1,
-0.3953738, -0.2855012, -0.8034576, 0.05490196, 1, 0, 1,
-0.3945526, -0.2684578, -1.028604, 0.05098039, 1, 0, 1,
-0.3939278, 0.987433, -0.05084784, 0.04313726, 1, 0, 1,
-0.3923805, -0.4951076, -3.656902, 0.03921569, 1, 0, 1,
-0.3917095, 0.0386937, -0.9306774, 0.03137255, 1, 0, 1,
-0.390243, -1.454701, -3.306113, 0.02745098, 1, 0, 1,
-0.3900397, -1.37859, -2.733599, 0.01960784, 1, 0, 1,
-0.3793039, 0.9682465, 0.06136321, 0.01568628, 1, 0, 1,
-0.3716878, -0.9179901, -3.156686, 0.007843138, 1, 0, 1,
-0.3712624, -0.704717, -2.979757, 0.003921569, 1, 0, 1,
-0.3700541, 0.4419202, -0.4873122, 0, 1, 0.003921569, 1,
-0.3691521, -1.372501, -2.405399, 0, 1, 0.01176471, 1,
-0.3683494, -0.1429181, -1.220297, 0, 1, 0.01568628, 1,
-0.3663011, 0.6248108, -0.9634073, 0, 1, 0.02352941, 1,
-0.3631604, 0.07904725, -1.759901, 0, 1, 0.02745098, 1,
-0.3596428, 0.2772103, -0.5850223, 0, 1, 0.03529412, 1,
-0.3565586, 0.1116625, -0.146811, 0, 1, 0.03921569, 1,
-0.3541464, -0.5640065, -0.2507544, 0, 1, 0.04705882, 1,
-0.3523859, 0.317394, -1.242485, 0, 1, 0.05098039, 1,
-0.3513962, 0.8639891, -1.405457, 0, 1, 0.05882353, 1,
-0.3466926, 0.2075254, -1.19511, 0, 1, 0.0627451, 1,
-0.3408501, -0.1429259, -2.095696, 0, 1, 0.07058824, 1,
-0.3393628, 1.871895, -0.1737181, 0, 1, 0.07450981, 1,
-0.3360757, -0.5642459, -0.8073677, 0, 1, 0.08235294, 1,
-0.3356704, 0.1634396, -1.138849, 0, 1, 0.08627451, 1,
-0.3346895, -0.7169788, -2.545611, 0, 1, 0.09411765, 1,
-0.3322386, -0.7417169, -2.454081, 0, 1, 0.1019608, 1,
-0.3317191, -0.4446505, -2.141728, 0, 1, 0.1058824, 1,
-0.3268236, 0.6669713, 0.5810043, 0, 1, 0.1137255, 1,
-0.3255875, -0.2579683, -2.754892, 0, 1, 0.1176471, 1,
-0.3250508, -0.02424624, -0.8050606, 0, 1, 0.1254902, 1,
-0.321497, -0.8844553, -3.151088, 0, 1, 0.1294118, 1,
-0.3205105, 0.476179, -0.8666113, 0, 1, 0.1372549, 1,
-0.3197315, 0.8395197, -1.533218, 0, 1, 0.1411765, 1,
-0.3178381, -0.813239, -3.637767, 0, 1, 0.1490196, 1,
-0.3150158, 0.2118108, -1.376777, 0, 1, 0.1529412, 1,
-0.3140996, -0.7659518, -2.896858, 0, 1, 0.1607843, 1,
-0.3139286, -0.2856592, -2.60041, 0, 1, 0.1647059, 1,
-0.3097527, -0.7903842, -4.062773, 0, 1, 0.172549, 1,
-0.306954, -1.491834, -2.292932, 0, 1, 0.1764706, 1,
-0.3041361, -1.28506, -3.936808, 0, 1, 0.1843137, 1,
-0.3036004, -1.10444, -3.280885, 0, 1, 0.1882353, 1,
-0.3032652, 2.808706, -1.850428, 0, 1, 0.1960784, 1,
-0.3015709, 0.9400783, -1.201886, 0, 1, 0.2039216, 1,
-0.3009724, -0.1367696, -2.131089, 0, 1, 0.2078431, 1,
-0.2998964, -1.170926, -3.357114, 0, 1, 0.2156863, 1,
-0.2996599, 0.1412019, -2.402273, 0, 1, 0.2196078, 1,
-0.2972155, 1.524466, -0.3769603, 0, 1, 0.227451, 1,
-0.2944985, -0.2581439, -2.866405, 0, 1, 0.2313726, 1,
-0.2909236, 1.151611, -1.790446, 0, 1, 0.2392157, 1,
-0.2844096, 0.05523513, -0.87005, 0, 1, 0.2431373, 1,
-0.2745928, -0.3489883, -4.41126, 0, 1, 0.2509804, 1,
-0.2737579, 0.189056, -0.8007631, 0, 1, 0.254902, 1,
-0.2675544, -0.2574648, -1.344408, 0, 1, 0.2627451, 1,
-0.2674091, -1.140166, -4.29003, 0, 1, 0.2666667, 1,
-0.2664711, 0.9999135, -0.7105947, 0, 1, 0.2745098, 1,
-0.2643585, -0.9191034, -2.95309, 0, 1, 0.2784314, 1,
-0.2637087, 1.90586, -1.536221, 0, 1, 0.2862745, 1,
-0.2636576, -0.2623188, -2.442531, 0, 1, 0.2901961, 1,
-0.2634305, -1.247176, -2.814682, 0, 1, 0.2980392, 1,
-0.2628059, -0.3858421, -0.7004698, 0, 1, 0.3058824, 1,
-0.2610545, 1.43833, -0.8461839, 0, 1, 0.3098039, 1,
-0.2580549, -1.016797, -0.9788185, 0, 1, 0.3176471, 1,
-0.2570191, -0.2964923, -2.527333, 0, 1, 0.3215686, 1,
-0.2512987, -0.4679498, -2.234331, 0, 1, 0.3294118, 1,
-0.2421937, -0.08660027, -2.266865, 0, 1, 0.3333333, 1,
-0.237267, 1.464283, -1.624497, 0, 1, 0.3411765, 1,
-0.2366928, 1.051233, -0.5665604, 0, 1, 0.345098, 1,
-0.2360258, 2.084286, 1.756816, 0, 1, 0.3529412, 1,
-0.2349961, -1.259972, -3.39442, 0, 1, 0.3568628, 1,
-0.234939, -1.573156, -3.120734, 0, 1, 0.3647059, 1,
-0.2334127, 0.3860456, -1.812812, 0, 1, 0.3686275, 1,
-0.2286531, 1.162953, -2.538646, 0, 1, 0.3764706, 1,
-0.2276836, -1.096448, -3.57475, 0, 1, 0.3803922, 1,
-0.2233162, -0.476311, -2.620145, 0, 1, 0.3882353, 1,
-0.2180409, -0.4774866, -3.793569, 0, 1, 0.3921569, 1,
-0.2155474, -0.5208018, -5.208969, 0, 1, 0.4, 1,
-0.2154724, 1.844293, 0.5788084, 0, 1, 0.4078431, 1,
-0.2138524, -0.880144, -3.001184, 0, 1, 0.4117647, 1,
-0.2104062, -1.747378, -2.910757, 0, 1, 0.4196078, 1,
-0.2083032, 0.6833952, -1.938414, 0, 1, 0.4235294, 1,
-0.2030673, 0.2922444, -0.7677323, 0, 1, 0.4313726, 1,
-0.2003166, -1.122258, -2.332409, 0, 1, 0.4352941, 1,
-0.1957015, 0.5456492, 0.9529613, 0, 1, 0.4431373, 1,
-0.1906175, 1.000323, -0.2033608, 0, 1, 0.4470588, 1,
-0.1891495, -1.013553, -3.424293, 0, 1, 0.454902, 1,
-0.1850581, -0.5237181, -2.713508, 0, 1, 0.4588235, 1,
-0.1835505, -1.300637, -1.312985, 0, 1, 0.4666667, 1,
-0.1831786, 0.8506417, 0.5424931, 0, 1, 0.4705882, 1,
-0.1804951, -1.125088, -0.8652719, 0, 1, 0.4784314, 1,
-0.1782525, -1.584331, -2.271587, 0, 1, 0.4823529, 1,
-0.1766974, -0.004370672, 0.4128942, 0, 1, 0.4901961, 1,
-0.1751146, 0.08828352, -2.676788, 0, 1, 0.4941176, 1,
-0.1723091, -0.7348061, -3.292886, 0, 1, 0.5019608, 1,
-0.1720563, 0.2504017, -1.428399, 0, 1, 0.509804, 1,
-0.1717742, -1.69615, -3.507949, 0, 1, 0.5137255, 1,
-0.1709406, 0.709794, -0.3397822, 0, 1, 0.5215687, 1,
-0.1660019, 0.07031018, 0.7054691, 0, 1, 0.5254902, 1,
-0.1619679, -0.4061079, -3.444231, 0, 1, 0.5333334, 1,
-0.1528536, -0.6551943, -2.013181, 0, 1, 0.5372549, 1,
-0.1505597, 0.1296142, -0.2661882, 0, 1, 0.5450981, 1,
-0.1495971, -1.219481, -1.724674, 0, 1, 0.5490196, 1,
-0.1478502, 0.5318905, -0.6380986, 0, 1, 0.5568628, 1,
-0.14657, -1.124293, -5.131892, 0, 1, 0.5607843, 1,
-0.1404679, -0.8441595, -3.311217, 0, 1, 0.5686275, 1,
-0.1398648, -0.5402923, -4.012599, 0, 1, 0.572549, 1,
-0.1348322, 0.3580209, -0.3685384, 0, 1, 0.5803922, 1,
-0.134206, -1.360301, -3.326775, 0, 1, 0.5843138, 1,
-0.13315, -2.190151, -2.534171, 0, 1, 0.5921569, 1,
-0.1297838, 0.05947063, -1.503776, 0, 1, 0.5960785, 1,
-0.1267896, -0.7200937, -2.070295, 0, 1, 0.6039216, 1,
-0.125524, -0.04896858, -0.7527713, 0, 1, 0.6117647, 1,
-0.1216107, -1.161552, -1.741427, 0, 1, 0.6156863, 1,
-0.1215589, 0.0305067, 0.1484767, 0, 1, 0.6235294, 1,
-0.1200008, 0.1895286, -0.05856887, 0, 1, 0.627451, 1,
-0.1197034, -1.115612, -3.120986, 0, 1, 0.6352941, 1,
-0.117541, -1.010251, -3.541476, 0, 1, 0.6392157, 1,
-0.1134316, -0.9249923, -2.872492, 0, 1, 0.6470588, 1,
-0.09982175, 0.808682, 0.6155178, 0, 1, 0.6509804, 1,
-0.09608522, 0.5325221, -0.1756069, 0, 1, 0.6588235, 1,
-0.09119037, 0.9317763, 0.5018866, 0, 1, 0.6627451, 1,
-0.08588484, -0.4035304, -4.290458, 0, 1, 0.6705883, 1,
-0.08053419, -1.283619, -3.795451, 0, 1, 0.6745098, 1,
-0.07159388, 0.1264302, -1.095741, 0, 1, 0.682353, 1,
-0.07158502, 0.3301878, -0.798694, 0, 1, 0.6862745, 1,
-0.0711408, -1.821012, -3.664939, 0, 1, 0.6941177, 1,
-0.06814157, -2.042932, -3.983425, 0, 1, 0.7019608, 1,
-0.06544564, -0.8817862, -1.98461, 0, 1, 0.7058824, 1,
-0.06373776, 0.8968868, 0.444079, 0, 1, 0.7137255, 1,
-0.06286854, -0.04351874, -2.132611, 0, 1, 0.7176471, 1,
-0.05875947, 1.983861, 0.6081843, 0, 1, 0.7254902, 1,
-0.05552842, -0.01671854, -3.219967, 0, 1, 0.7294118, 1,
-0.05163986, -0.3672236, -4.077462, 0, 1, 0.7372549, 1,
-0.05034393, 1.063478, -0.9863154, 0, 1, 0.7411765, 1,
-0.04906975, 0.9089996, 0.2156314, 0, 1, 0.7490196, 1,
-0.04559482, -0.3345099, -3.938509, 0, 1, 0.7529412, 1,
-0.04302533, -0.7066216, -4.55081, 0, 1, 0.7607843, 1,
-0.04070874, -2.505057, -1.141552, 0, 1, 0.7647059, 1,
-0.03971625, 0.1737325, 0.4024366, 0, 1, 0.772549, 1,
-0.03747483, -1.340343, -2.534226, 0, 1, 0.7764706, 1,
-0.03399201, 0.8079425, 0.2282731, 0, 1, 0.7843137, 1,
-0.02972563, 0.7507105, -0.9412031, 0, 1, 0.7882353, 1,
-0.02884764, 0.7747112, 0.2549951, 0, 1, 0.7960784, 1,
-0.02714474, 1.456763, -0.8939758, 0, 1, 0.8039216, 1,
-0.02155164, 0.6143087, 1.319767, 0, 1, 0.8078431, 1,
-0.01413362, 0.6445789, -1.054101, 0, 1, 0.8156863, 1,
-0.01322114, -0.5476318, -3.171844, 0, 1, 0.8196079, 1,
-0.0123115, -0.2845636, 0.2956958, 0, 1, 0.827451, 1,
-0.01129597, 1.27327, 1.340699, 0, 1, 0.8313726, 1,
-0.008355924, -0.7005315, -2.876327, 0, 1, 0.8392157, 1,
-0.00820601, 0.1698671, -1.325104, 0, 1, 0.8431373, 1,
-0.0006709649, -0.0089259, -2.50902, 0, 1, 0.8509804, 1,
0.004809635, 1.036211, 0.1365468, 0, 1, 0.854902, 1,
0.005122689, -0.3946697, 1.964558, 0, 1, 0.8627451, 1,
0.006519085, 1.564711, 0.3998566, 0, 1, 0.8666667, 1,
0.007034395, 0.8812966, 0.9659763, 0, 1, 0.8745098, 1,
0.009223714, 0.8837466, 0.8041867, 0, 1, 0.8784314, 1,
0.009934182, 0.2521289, -0.3594466, 0, 1, 0.8862745, 1,
0.01054808, -1.253409, 1.500298, 0, 1, 0.8901961, 1,
0.01199132, 0.2232513, 0.9406455, 0, 1, 0.8980392, 1,
0.01202145, 0.4096482, 0.9481495, 0, 1, 0.9058824, 1,
0.01426451, -0.2759138, 2.263037, 0, 1, 0.9098039, 1,
0.02288856, 0.9667011, 1.785324, 0, 1, 0.9176471, 1,
0.0253329, -0.2601653, 3.83558, 0, 1, 0.9215686, 1,
0.02623371, -0.3917824, 3.144098, 0, 1, 0.9294118, 1,
0.02714287, 1.299363, -0.6628401, 0, 1, 0.9333333, 1,
0.03564458, -0.7176472, 0.8593166, 0, 1, 0.9411765, 1,
0.03874375, 0.5505006, 0.6601281, 0, 1, 0.945098, 1,
0.03878828, -2.196861, 2.080108, 0, 1, 0.9529412, 1,
0.03898078, -0.1715046, 0.8267975, 0, 1, 0.9568627, 1,
0.0393438, 0.3155681, -0.06461893, 0, 1, 0.9647059, 1,
0.04102238, -0.3811245, 4.1641, 0, 1, 0.9686275, 1,
0.04160832, -0.8075829, 2.655976, 0, 1, 0.9764706, 1,
0.04811051, -0.9245322, 3.933299, 0, 1, 0.9803922, 1,
0.04843587, -1.447737, 3.771621, 0, 1, 0.9882353, 1,
0.04912111, -1.102694, 4.101548, 0, 1, 0.9921569, 1,
0.05217654, 1.017671, -0.9416155, 0, 1, 1, 1,
0.05275688, -0.3643201, 3.494564, 0, 0.9921569, 1, 1,
0.05919958, -1.237143, 3.783851, 0, 0.9882353, 1, 1,
0.06251154, 2.003959, -0.438147, 0, 0.9803922, 1, 1,
0.07047084, -0.0309269, 2.430177, 0, 0.9764706, 1, 1,
0.07397097, -0.2765148, 3.669959, 0, 0.9686275, 1, 1,
0.07568076, -0.788044, 3.270365, 0, 0.9647059, 1, 1,
0.07675467, -0.8767498, 3.16589, 0, 0.9568627, 1, 1,
0.08358005, -0.5582778, 3.483382, 0, 0.9529412, 1, 1,
0.08740351, -0.2098075, 3.441561, 0, 0.945098, 1, 1,
0.0888977, 0.3563465, 0.322886, 0, 0.9411765, 1, 1,
0.09394457, 0.07439586, 0.682253, 0, 0.9333333, 1, 1,
0.09469637, -0.6497067, 2.647981, 0, 0.9294118, 1, 1,
0.09811619, -2.859173, 1.933652, 0, 0.9215686, 1, 1,
0.09919427, 0.4758056, 0.7327385, 0, 0.9176471, 1, 1,
0.09995619, -0.4282264, 2.41332, 0, 0.9098039, 1, 1,
0.1029568, 0.6387127, -0.8091009, 0, 0.9058824, 1, 1,
0.1036985, -1.644586, 3.835466, 0, 0.8980392, 1, 1,
0.1053468, 0.4302709, -0.06589445, 0, 0.8901961, 1, 1,
0.1070258, -1.239516, 1.73548, 0, 0.8862745, 1, 1,
0.1110549, -0.8149107, 3.808365, 0, 0.8784314, 1, 1,
0.1136357, 0.5348409, -1.267425, 0, 0.8745098, 1, 1,
0.1148199, 1.182683, -1.513635, 0, 0.8666667, 1, 1,
0.1158696, -1.373951, 3.7753, 0, 0.8627451, 1, 1,
0.1175834, 1.106264, 0.2628064, 0, 0.854902, 1, 1,
0.1229291, -0.8761466, 2.02236, 0, 0.8509804, 1, 1,
0.1232444, -1.087602, 2.474677, 0, 0.8431373, 1, 1,
0.1244888, 1.648938, -1.617776, 0, 0.8392157, 1, 1,
0.1262104, -1.160425, 4.081892, 0, 0.8313726, 1, 1,
0.1298984, 1.438739, -2.091775, 0, 0.827451, 1, 1,
0.130992, 1.398952, 0.9724219, 0, 0.8196079, 1, 1,
0.1312299, -0.595612, 2.155386, 0, 0.8156863, 1, 1,
0.1326159, -0.8908932, 2.856069, 0, 0.8078431, 1, 1,
0.1367146, -0.8909315, 3.280244, 0, 0.8039216, 1, 1,
0.1394648, 0.5246226, 1.502803, 0, 0.7960784, 1, 1,
0.1410817, 0.9604445, -1.217781, 0, 0.7882353, 1, 1,
0.1451798, 0.6367638, -0.5753083, 0, 0.7843137, 1, 1,
0.1470021, 0.2848692, 0.9251845, 0, 0.7764706, 1, 1,
0.1474397, 1.962845, 1.159229, 0, 0.772549, 1, 1,
0.1485781, 0.1000533, 0.7384778, 0, 0.7647059, 1, 1,
0.1506168, -1.125184, 3.07002, 0, 0.7607843, 1, 1,
0.1506817, -0.3480181, 2.083261, 0, 0.7529412, 1, 1,
0.1527453, 0.02778733, 1.552688, 0, 0.7490196, 1, 1,
0.1542098, -0.08109246, 2.212498, 0, 0.7411765, 1, 1,
0.1552112, 0.8183221, 0.2102275, 0, 0.7372549, 1, 1,
0.1602881, 1.624326, -1.142231, 0, 0.7294118, 1, 1,
0.1608423, -1.189986, 3.612702, 0, 0.7254902, 1, 1,
0.163896, 1.699288, 0.204907, 0, 0.7176471, 1, 1,
0.1686598, 1.39185, 2.435946, 0, 0.7137255, 1, 1,
0.1695772, -1.470082, 3.547871, 0, 0.7058824, 1, 1,
0.1742059, -0.6675295, 3.395258, 0, 0.6980392, 1, 1,
0.1802627, 0.07053299, 2.005934, 0, 0.6941177, 1, 1,
0.1805933, -0.267265, 2.36884, 0, 0.6862745, 1, 1,
0.1847558, -0.8503604, 2.878311, 0, 0.682353, 1, 1,
0.1870545, 0.6054816, 2.073172, 0, 0.6745098, 1, 1,
0.1887167, -0.4785132, 2.40623, 0, 0.6705883, 1, 1,
0.1920406, 0.1362392, 1.165183, 0, 0.6627451, 1, 1,
0.1936321, 0.007498492, 1.832263, 0, 0.6588235, 1, 1,
0.1978469, 0.5591845, -0.1547273, 0, 0.6509804, 1, 1,
0.1984365, 0.9817532, -0.8002478, 0, 0.6470588, 1, 1,
0.205922, 1.90751, 2.090577, 0, 0.6392157, 1, 1,
0.2063891, -1.94135, 2.623434, 0, 0.6352941, 1, 1,
0.209081, 1.699997, -0.6273413, 0, 0.627451, 1, 1,
0.2136653, -1.16273, 4.025923, 0, 0.6235294, 1, 1,
0.2168933, -0.7539005, 1.954856, 0, 0.6156863, 1, 1,
0.2181477, 1.806509, 0.6952862, 0, 0.6117647, 1, 1,
0.2187172, -0.09880974, 2.465653, 0, 0.6039216, 1, 1,
0.2221374, -1.299216, 2.817327, 0, 0.5960785, 1, 1,
0.2323668, 0.3534941, -1.837547, 0, 0.5921569, 1, 1,
0.2332976, -1.221696, 2.736639, 0, 0.5843138, 1, 1,
0.2366342, -0.2030839, 2.034932, 0, 0.5803922, 1, 1,
0.246383, 0.4198455, 1.647841, 0, 0.572549, 1, 1,
0.2470034, 0.02002088, 1.588206, 0, 0.5686275, 1, 1,
0.2476996, -1.056635, 1.855891, 0, 0.5607843, 1, 1,
0.248864, 1.50209, -1.292862, 0, 0.5568628, 1, 1,
0.2590256, 0.2735308, -1.124916, 0, 0.5490196, 1, 1,
0.2605318, -0.6937512, 2.992258, 0, 0.5450981, 1, 1,
0.2640361, 0.4864347, 1.773851, 0, 0.5372549, 1, 1,
0.2660147, -0.6001846, 2.866719, 0, 0.5333334, 1, 1,
0.266179, -0.3213847, 1.249566, 0, 0.5254902, 1, 1,
0.2708263, -1.319407, 3.611761, 0, 0.5215687, 1, 1,
0.2736534, -2.165863, 3.886886, 0, 0.5137255, 1, 1,
0.2739089, -1.328174, 3.976389, 0, 0.509804, 1, 1,
0.2774681, -0.4172584, 3.282427, 0, 0.5019608, 1, 1,
0.2777704, -1.490043, 1.580708, 0, 0.4941176, 1, 1,
0.2782294, 0.7649437, 1.887716, 0, 0.4901961, 1, 1,
0.2824254, -1.734692, 1.969718, 0, 0.4823529, 1, 1,
0.2837397, 1.15038, -0.09962405, 0, 0.4784314, 1, 1,
0.2845098, -1.068387, 3.290381, 0, 0.4705882, 1, 1,
0.284512, -0.4319665, 3.223704, 0, 0.4666667, 1, 1,
0.2856493, -0.04545717, 2.511837, 0, 0.4588235, 1, 1,
0.2887197, -0.1301932, 2.628883, 0, 0.454902, 1, 1,
0.2905197, 0.6413773, -0.5494981, 0, 0.4470588, 1, 1,
0.2925239, -2.162323, 3.60135, 0, 0.4431373, 1, 1,
0.2925881, 0.004284391, 1.907511, 0, 0.4352941, 1, 1,
0.2929289, -0.9961147, 3.442813, 0, 0.4313726, 1, 1,
0.2957775, 0.3604689, 0.1891184, 0, 0.4235294, 1, 1,
0.2978487, -0.1067594, 2.310414, 0, 0.4196078, 1, 1,
0.2979873, 0.3119809, -0.6939988, 0, 0.4117647, 1, 1,
0.2987319, 0.8855466, 0.0770139, 0, 0.4078431, 1, 1,
0.298964, 0.2631849, 0.6395508, 0, 0.4, 1, 1,
0.3007892, -2.155392, 3.652722, 0, 0.3921569, 1, 1,
0.301022, -0.5516557, 2.262138, 0, 0.3882353, 1, 1,
0.3034115, -0.2645648, 1.902555, 0, 0.3803922, 1, 1,
0.3044232, 1.975127, 1.644722, 0, 0.3764706, 1, 1,
0.3049226, -0.2010079, 2.443924, 0, 0.3686275, 1, 1,
0.3067282, 1.17585, 0.7080456, 0, 0.3647059, 1, 1,
0.3095832, 0.8410233, 0.3052102, 0, 0.3568628, 1, 1,
0.3122865, 1.078211, -0.6012988, 0, 0.3529412, 1, 1,
0.3168628, 0.6213384, 1.170135, 0, 0.345098, 1, 1,
0.3171342, 1.77306, -0.3671932, 0, 0.3411765, 1, 1,
0.3181688, 0.3411218, 0.2935815, 0, 0.3333333, 1, 1,
0.3225641, -1.778275, 3.882612, 0, 0.3294118, 1, 1,
0.3233362, 0.1451646, 2.306716, 0, 0.3215686, 1, 1,
0.3300703, -0.4905412, 2.028722, 0, 0.3176471, 1, 1,
0.3313715, 0.7803822, 1.172462, 0, 0.3098039, 1, 1,
0.332138, 0.6700938, 0.5919651, 0, 0.3058824, 1, 1,
0.3345764, -0.4641623, 2.684534, 0, 0.2980392, 1, 1,
0.3403765, -0.5402602, 3.960354, 0, 0.2901961, 1, 1,
0.3431145, 0.06037064, 1.191194, 0, 0.2862745, 1, 1,
0.343604, 0.4437685, 0.7581118, 0, 0.2784314, 1, 1,
0.3451288, 0.4184225, 1.469462, 0, 0.2745098, 1, 1,
0.3483639, -1.091238, 3.067276, 0, 0.2666667, 1, 1,
0.3502524, -1.377773, 2.90965, 0, 0.2627451, 1, 1,
0.3518228, -1.409754, 2.300575, 0, 0.254902, 1, 1,
0.3580396, -2.023041, 3.894459, 0, 0.2509804, 1, 1,
0.3604164, -0.7712307, 3.612594, 0, 0.2431373, 1, 1,
0.3638731, 0.5994751, 1.80355, 0, 0.2392157, 1, 1,
0.3647732, -0.8398874, 2.422688, 0, 0.2313726, 1, 1,
0.3648247, -0.09834267, 0.4006491, 0, 0.227451, 1, 1,
0.3655304, -1.835899, 3.556697, 0, 0.2196078, 1, 1,
0.3672245, -1.547662, 2.718851, 0, 0.2156863, 1, 1,
0.3694907, 2.169168, 0.004731494, 0, 0.2078431, 1, 1,
0.370821, -0.1971244, 1.445742, 0, 0.2039216, 1, 1,
0.372301, -1.460985, 2.192837, 0, 0.1960784, 1, 1,
0.3744629, 1.070529, -1.110642, 0, 0.1882353, 1, 1,
0.3757008, 0.9229401, 2.170717, 0, 0.1843137, 1, 1,
0.3765121, 0.9059001, -0.2437949, 0, 0.1764706, 1, 1,
0.3768464, -0.0162676, 2.616166, 0, 0.172549, 1, 1,
0.3796274, -1.235569, 4.999491, 0, 0.1647059, 1, 1,
0.3830908, 0.1127874, 2.207029, 0, 0.1607843, 1, 1,
0.3834005, 1.737584, -1.576864, 0, 0.1529412, 1, 1,
0.3882059, -0.3205505, 2.079914, 0, 0.1490196, 1, 1,
0.388227, 1.022907, 1.256035, 0, 0.1411765, 1, 1,
0.3882815, 1.985411, 0.1595792, 0, 0.1372549, 1, 1,
0.3923566, 0.4271759, -0.6097983, 0, 0.1294118, 1, 1,
0.3933784, -0.8774636, 1.509653, 0, 0.1254902, 1, 1,
0.3986719, 0.9006839, 0.4158907, 0, 0.1176471, 1, 1,
0.4025567, -0.3395237, 2.384942, 0, 0.1137255, 1, 1,
0.4093368, 1.509954, 0.894486, 0, 0.1058824, 1, 1,
0.4196165, 0.4233402, 0.2515695, 0, 0.09803922, 1, 1,
0.4210218, 1.1788, 0.4529647, 0, 0.09411765, 1, 1,
0.4270017, 0.09074172, 2.10702, 0, 0.08627451, 1, 1,
0.429089, -1.440682, 3.573882, 0, 0.08235294, 1, 1,
0.4328011, -0.9588045, 2.488648, 0, 0.07450981, 1, 1,
0.433059, -0.7638237, 3.09715, 0, 0.07058824, 1, 1,
0.4337642, 0.7179635, 0.2438229, 0, 0.0627451, 1, 1,
0.4347183, -0.1855556, 1.240012, 0, 0.05882353, 1, 1,
0.4418517, -0.05425679, 0.102036, 0, 0.05098039, 1, 1,
0.4463375, 0.4867704, -0.7319582, 0, 0.04705882, 1, 1,
0.4480861, 1.306767, 0.1590648, 0, 0.03921569, 1, 1,
0.4487558, -0.5041814, 0.9578421, 0, 0.03529412, 1, 1,
0.4503171, 0.3427722, 2.412672, 0, 0.02745098, 1, 1,
0.4522731, -0.4076245, 3.699483, 0, 0.02352941, 1, 1,
0.4540895, 0.8538572, 0.09092475, 0, 0.01568628, 1, 1,
0.4640831, -0.1334408, 2.849151, 0, 0.01176471, 1, 1,
0.4680709, -0.8093145, 2.422489, 0, 0.003921569, 1, 1,
0.4682343, -0.7070251, 2.517297, 0.003921569, 0, 1, 1,
0.4687495, 1.072696, -1.094052, 0.007843138, 0, 1, 1,
0.475449, -0.03676766, 3.261809, 0.01568628, 0, 1, 1,
0.475729, 0.2025587, 2.321559, 0.01960784, 0, 1, 1,
0.4774241, -0.4121688, 1.984708, 0.02745098, 0, 1, 1,
0.478093, 1.086267, -0.687507, 0.03137255, 0, 1, 1,
0.4785175, 1.454617, -0.9758635, 0.03921569, 0, 1, 1,
0.4810968, 0.285388, 0.2604548, 0.04313726, 0, 1, 1,
0.4828264, -0.4843438, 2.817476, 0.05098039, 0, 1, 1,
0.4877955, -0.01010299, 1.088173, 0.05490196, 0, 1, 1,
0.4914446, -0.1192771, 2.646665, 0.0627451, 0, 1, 1,
0.4921609, -0.5724619, 1.490065, 0.06666667, 0, 1, 1,
0.4977591, 0.4593702, -1.010983, 0.07450981, 0, 1, 1,
0.4996271, -0.4703798, 2.014656, 0.07843138, 0, 1, 1,
0.5086505, -1.116703, 2.953482, 0.08627451, 0, 1, 1,
0.5129438, 0.2354902, 1.857689, 0.09019608, 0, 1, 1,
0.5158099, 0.2720379, 1.030835, 0.09803922, 0, 1, 1,
0.5183575, 1.432593, 0.1314428, 0.1058824, 0, 1, 1,
0.5200922, 1.296795, 0.8821763, 0.1098039, 0, 1, 1,
0.5258483, 2.009611, 1.031349, 0.1176471, 0, 1, 1,
0.533178, 0.4235791, 0.05526371, 0.1215686, 0, 1, 1,
0.5384211, -0.245782, 0.2834041, 0.1294118, 0, 1, 1,
0.5391716, -0.6564638, 2.729606, 0.1333333, 0, 1, 1,
0.5467134, 2.228888, 0.9238685, 0.1411765, 0, 1, 1,
0.5508476, -0.3472927, 1.971106, 0.145098, 0, 1, 1,
0.5531944, -1.101812, 1.904061, 0.1529412, 0, 1, 1,
0.5549443, 0.7811941, 0.9159184, 0.1568628, 0, 1, 1,
0.5554255, 1.11596, 0.7561256, 0.1647059, 0, 1, 1,
0.5587305, -0.2528565, 2.646428, 0.1686275, 0, 1, 1,
0.5628441, 1.944538, -0.2386719, 0.1764706, 0, 1, 1,
0.5655189, 1.055298, 0.6814759, 0.1803922, 0, 1, 1,
0.5655783, -1.60515, 3.001974, 0.1882353, 0, 1, 1,
0.5664157, -0.5224692, 2.571449, 0.1921569, 0, 1, 1,
0.5813805, 0.3866811, -0.4468935, 0.2, 0, 1, 1,
0.5823659, 0.8027217, -0.8043267, 0.2078431, 0, 1, 1,
0.5845656, 0.8668567, 2.044358, 0.2117647, 0, 1, 1,
0.5846681, -0.2533891, 2.965484, 0.2196078, 0, 1, 1,
0.5874158, 2.338667, -0.5509483, 0.2235294, 0, 1, 1,
0.5895661, -0.7239594, 4.007505, 0.2313726, 0, 1, 1,
0.5958993, 0.9914237, 0.5654152, 0.2352941, 0, 1, 1,
0.596166, -0.8569627, 4.254069, 0.2431373, 0, 1, 1,
0.5966497, -1.40016, 0.7032025, 0.2470588, 0, 1, 1,
0.5976316, 0.02687175, 2.904527, 0.254902, 0, 1, 1,
0.6034353, -1.299833, 3.392499, 0.2588235, 0, 1, 1,
0.6034959, -0.1797677, 0.8291159, 0.2666667, 0, 1, 1,
0.6053368, -0.851343, 2.704129, 0.2705882, 0, 1, 1,
0.6103908, -0.7699119, 0.4703843, 0.2784314, 0, 1, 1,
0.6105167, -1.02669, 1.586679, 0.282353, 0, 1, 1,
0.6113305, -0.3013238, 2.885577, 0.2901961, 0, 1, 1,
0.6132462, -0.2589499, 2.616923, 0.2941177, 0, 1, 1,
0.6158569, 0.7038324, 1.524756, 0.3019608, 0, 1, 1,
0.6160682, -0.06068145, 2.484912, 0.3098039, 0, 1, 1,
0.6209989, -1.360318, 4.473885, 0.3137255, 0, 1, 1,
0.6222146, 0.824551, -0.9210224, 0.3215686, 0, 1, 1,
0.6275941, -1.006353, 3.179446, 0.3254902, 0, 1, 1,
0.629338, -0.1840728, 2.780571, 0.3333333, 0, 1, 1,
0.6356281, 1.81623, 2.425963, 0.3372549, 0, 1, 1,
0.6407816, -0.4750808, 1.147619, 0.345098, 0, 1, 1,
0.6420502, -0.7716243, 3.836429, 0.3490196, 0, 1, 1,
0.6437614, -0.3439058, 3.457069, 0.3568628, 0, 1, 1,
0.6475169, 0.06778395, 1.003153, 0.3607843, 0, 1, 1,
0.657643, -2.193446, 2.665142, 0.3686275, 0, 1, 1,
0.6590316, 1.365758, 3.218569, 0.372549, 0, 1, 1,
0.6608584, -1.341841, 4.604349, 0.3803922, 0, 1, 1,
0.6676278, -1.317673, 4.449144, 0.3843137, 0, 1, 1,
0.6685029, -0.07589086, 1.364251, 0.3921569, 0, 1, 1,
0.6700027, -0.8257624, 3.155129, 0.3960784, 0, 1, 1,
0.6746638, -1.45151, 1.695101, 0.4039216, 0, 1, 1,
0.6779561, 0.352764, 0.9099417, 0.4117647, 0, 1, 1,
0.6809754, -0.9382768, 1.194484, 0.4156863, 0, 1, 1,
0.6819423, 1.495792, -0.5131384, 0.4235294, 0, 1, 1,
0.6854497, 0.2727863, 2.602056, 0.427451, 0, 1, 1,
0.6881985, 0.4554834, 1.466935, 0.4352941, 0, 1, 1,
0.6958458, 0.07118629, 0.8318219, 0.4392157, 0, 1, 1,
0.7017491, -0.1750572, 2.144745, 0.4470588, 0, 1, 1,
0.7024356, -1.416726, 2.614041, 0.4509804, 0, 1, 1,
0.7050728, 1.096177, 1.483072, 0.4588235, 0, 1, 1,
0.7061933, 0.7317646, 0.5810657, 0.4627451, 0, 1, 1,
0.7128393, 0.9355193, 1.139523, 0.4705882, 0, 1, 1,
0.7128792, -0.3460566, 2.186223, 0.4745098, 0, 1, 1,
0.7191752, -2.243914, 1.780388, 0.4823529, 0, 1, 1,
0.7201959, -1.283803, 2.419121, 0.4862745, 0, 1, 1,
0.7231073, -2.057483, 1.92334, 0.4941176, 0, 1, 1,
0.7274721, -0.6586266, 0.9878593, 0.5019608, 0, 1, 1,
0.7285116, 1.299286, -0.2148313, 0.5058824, 0, 1, 1,
0.7324555, 0.1477236, 1.764259, 0.5137255, 0, 1, 1,
0.7376071, 0.9365907, 1.833448, 0.5176471, 0, 1, 1,
0.7415913, -1.812598, 1.955475, 0.5254902, 0, 1, 1,
0.7429442, -0.01846015, 2.857913, 0.5294118, 0, 1, 1,
0.7443508, 1.668066, 0.9054983, 0.5372549, 0, 1, 1,
0.7464405, 0.3031622, 0.1070294, 0.5411765, 0, 1, 1,
0.7466328, 1.49451, -0.8832461, 0.5490196, 0, 1, 1,
0.7495798, 0.1540929, 2.73773, 0.5529412, 0, 1, 1,
0.7504432, -0.3519664, 1.935938, 0.5607843, 0, 1, 1,
0.7534474, -0.0500848, 0.6148776, 0.5647059, 0, 1, 1,
0.7539333, 0.3327604, -0.2919143, 0.572549, 0, 1, 1,
0.7603692, -1.024219, 0.9084674, 0.5764706, 0, 1, 1,
0.7609981, -0.3986424, 1.050365, 0.5843138, 0, 1, 1,
0.7614068, -0.715993, 2.574813, 0.5882353, 0, 1, 1,
0.7641886, 0.8800961, 0.1693605, 0.5960785, 0, 1, 1,
0.7679485, -1.233873, 3.575815, 0.6039216, 0, 1, 1,
0.7687035, 0.3429057, 1.094445, 0.6078432, 0, 1, 1,
0.7728568, -0.8010659, 2.633663, 0.6156863, 0, 1, 1,
0.7730923, -0.02187908, 1.805177, 0.6196079, 0, 1, 1,
0.7740415, -0.6423841, 1.579283, 0.627451, 0, 1, 1,
0.7801132, -1.894359, 1.571086, 0.6313726, 0, 1, 1,
0.7824115, 1.513802, 0.4301958, 0.6392157, 0, 1, 1,
0.7898464, 0.03933693, 1.970756, 0.6431373, 0, 1, 1,
0.789943, 0.6728385, 0.9467844, 0.6509804, 0, 1, 1,
0.7968479, -0.1785276, 1.226573, 0.654902, 0, 1, 1,
0.7990019, 0.5060228, 1.034429, 0.6627451, 0, 1, 1,
0.8176088, 2.878085, -0.2227878, 0.6666667, 0, 1, 1,
0.8214877, -0.3947147, 1.372919, 0.6745098, 0, 1, 1,
0.8226549, 1.028323, -0.08628965, 0.6784314, 0, 1, 1,
0.8255922, -0.2106696, 4.61901, 0.6862745, 0, 1, 1,
0.826349, -0.3875585, 2.466919, 0.6901961, 0, 1, 1,
0.8360068, -0.2765718, 3.404649, 0.6980392, 0, 1, 1,
0.8430234, -1.155196, 1.061639, 0.7058824, 0, 1, 1,
0.8550494, 1.840753, 0.9659567, 0.7098039, 0, 1, 1,
0.8589464, -1.022712, 3.295977, 0.7176471, 0, 1, 1,
0.8770085, 0.419739, 1.427313, 0.7215686, 0, 1, 1,
0.8822829, 0.7802116, 2.605607, 0.7294118, 0, 1, 1,
0.8860576, -0.2003821, 2.767312, 0.7333333, 0, 1, 1,
0.8897896, -0.534726, 3.549211, 0.7411765, 0, 1, 1,
0.8916313, 0.7224571, 0.1819424, 0.7450981, 0, 1, 1,
0.8948902, -0.5760673, 4.058111, 0.7529412, 0, 1, 1,
0.8968003, 1.174113, -0.0267248, 0.7568628, 0, 1, 1,
0.9094526, -0.7598836, 1.752374, 0.7647059, 0, 1, 1,
0.9124322, 0.8488339, 0.9483342, 0.7686275, 0, 1, 1,
0.9126047, -0.4583285, 1.339697, 0.7764706, 0, 1, 1,
0.9139797, 0.2336192, 1.836153, 0.7803922, 0, 1, 1,
0.9139811, 1.550047, 0.4588141, 0.7882353, 0, 1, 1,
0.9213908, -0.3595218, 1.608581, 0.7921569, 0, 1, 1,
0.9288911, 1.716477, 1.602411, 0.8, 0, 1, 1,
0.9420568, 0.5234227, -0.2672578, 0.8078431, 0, 1, 1,
0.9425395, -2.419825, 0.8171235, 0.8117647, 0, 1, 1,
0.9548638, 0.9035773, 1.45034, 0.8196079, 0, 1, 1,
0.9567236, -1.138365, 1.38, 0.8235294, 0, 1, 1,
0.9635659, 0.3078932, 0.4921103, 0.8313726, 0, 1, 1,
0.9671451, 0.6678901, 1.436092, 0.8352941, 0, 1, 1,
0.9703431, 0.4734035, 1.791471, 0.8431373, 0, 1, 1,
0.9771231, -1.031687, 1.610349, 0.8470588, 0, 1, 1,
0.9783154, -1.391548, 2.696164, 0.854902, 0, 1, 1,
0.9812385, 0.3603135, 3.291895, 0.8588235, 0, 1, 1,
0.9871202, -0.1721097, 2.209306, 0.8666667, 0, 1, 1,
0.9973845, -0.6764647, 0.9446454, 0.8705882, 0, 1, 1,
0.9974817, -0.3400473, 1.849588, 0.8784314, 0, 1, 1,
0.9982989, 0.07220984, 1.184483, 0.8823529, 0, 1, 1,
1.00183, -0.5815331, 4.200685, 0.8901961, 0, 1, 1,
1.003734, 0.02941838, 1.689051, 0.8941177, 0, 1, 1,
1.011916, 0.986806, 1.523601, 0.9019608, 0, 1, 1,
1.01258, 0.9159213, 0.794146, 0.9098039, 0, 1, 1,
1.012698, 0.2632361, 1.877925, 0.9137255, 0, 1, 1,
1.018596, -0.5380201, 3.81128, 0.9215686, 0, 1, 1,
1.021564, 0.8007122, 1.359389, 0.9254902, 0, 1, 1,
1.024599, 0.7233561, 0.2536148, 0.9333333, 0, 1, 1,
1.039469, 2.259487, 0.683063, 0.9372549, 0, 1, 1,
1.040369, 0.6858257, 1.095308, 0.945098, 0, 1, 1,
1.041949, -0.6881267, 3.127459, 0.9490196, 0, 1, 1,
1.045178, 0.04678231, 0.3665388, 0.9568627, 0, 1, 1,
1.053387, 0.2921442, 0.5774821, 0.9607843, 0, 1, 1,
1.053912, 0.09352232, 0.9836882, 0.9686275, 0, 1, 1,
1.054037, -0.8944089, 4.105555, 0.972549, 0, 1, 1,
1.056971, 0.3614652, 2.10467, 0.9803922, 0, 1, 1,
1.064157, 0.009712814, 0.9001319, 0.9843137, 0, 1, 1,
1.070186, -2.004375, 1.379869, 0.9921569, 0, 1, 1,
1.077924, -2.081871, 3.970485, 0.9960784, 0, 1, 1,
1.07873, -0.4046558, 1.790672, 1, 0, 0.9960784, 1,
1.080149, -0.8713845, 2.708171, 1, 0, 0.9882353, 1,
1.080354, -0.4432767, 1.980275, 1, 0, 0.9843137, 1,
1.089887, 0.01154775, 2.383053, 1, 0, 0.9764706, 1,
1.089907, 0.4988765, 3.086272, 1, 0, 0.972549, 1,
1.099117, -0.5990065, 2.281425, 1, 0, 0.9647059, 1,
1.101964, -0.1183745, 2.374769, 1, 0, 0.9607843, 1,
1.102343, -0.05878967, 1.436135, 1, 0, 0.9529412, 1,
1.106808, 1.254447, 0.06343917, 1, 0, 0.9490196, 1,
1.107594, -2.268423, 3.619643, 1, 0, 0.9411765, 1,
1.119448, 1.650385, 0.07004432, 1, 0, 0.9372549, 1,
1.121616, 0.7133566, 0.5493263, 1, 0, 0.9294118, 1,
1.127568, -0.3969872, 2.18225, 1, 0, 0.9254902, 1,
1.132811, 0.8457347, 1.865249, 1, 0, 0.9176471, 1,
1.136347, 1.88461, 1.948612, 1, 0, 0.9137255, 1,
1.136986, -0.1627558, 2.321511, 1, 0, 0.9058824, 1,
1.139291, 0.06439364, 2.500501, 1, 0, 0.9019608, 1,
1.141919, 0.1641527, 2.267307, 1, 0, 0.8941177, 1,
1.142666, 0.1433672, 1.113509, 1, 0, 0.8862745, 1,
1.144625, -0.6117689, 2.572775, 1, 0, 0.8823529, 1,
1.146523, -1.468865, 0.6151691, 1, 0, 0.8745098, 1,
1.148963, -0.641875, 2.483803, 1, 0, 0.8705882, 1,
1.154692, 0.7958656, 1.698621, 1, 0, 0.8627451, 1,
1.158153, -0.3188302, 0.9963764, 1, 0, 0.8588235, 1,
1.162026, -0.8828726, 2.159348, 1, 0, 0.8509804, 1,
1.162945, -0.4281127, 1.507257, 1, 0, 0.8470588, 1,
1.176214, 0.3520625, 0.2997716, 1, 0, 0.8392157, 1,
1.180082, -0.5755361, 2.87705, 1, 0, 0.8352941, 1,
1.181603, -0.5741742, 3.150604, 1, 0, 0.827451, 1,
1.187187, 0.9130263, 1.932748, 1, 0, 0.8235294, 1,
1.19094, 0.235117, 0.6772465, 1, 0, 0.8156863, 1,
1.191552, -0.6679758, 0.8619128, 1, 0, 0.8117647, 1,
1.19174, 0.3465446, 2.560925, 1, 0, 0.8039216, 1,
1.198052, 0.2153521, 0.3637189, 1, 0, 0.7960784, 1,
1.212843, -1.548865, 2.510636, 1, 0, 0.7921569, 1,
1.216426, -0.1736174, 3.055174, 1, 0, 0.7843137, 1,
1.218804, -1.203425, 1.67575, 1, 0, 0.7803922, 1,
1.219261, -0.09265817, 2.491544, 1, 0, 0.772549, 1,
1.223108, 1.471929, 0.1885901, 1, 0, 0.7686275, 1,
1.235613, -0.807507, 2.885445, 1, 0, 0.7607843, 1,
1.237921, 0.7207029, -0.2971907, 1, 0, 0.7568628, 1,
1.238833, -1.247929, 3.038923, 1, 0, 0.7490196, 1,
1.253551, -0.36646, 2.557711, 1, 0, 0.7450981, 1,
1.261117, -0.4547839, 1.596827, 1, 0, 0.7372549, 1,
1.270224, -1.559408, 1.789899, 1, 0, 0.7333333, 1,
1.279929, 0.7794908, 3.044216, 1, 0, 0.7254902, 1,
1.28723, 0.4884083, 2.38098, 1, 0, 0.7215686, 1,
1.290703, -1.543309, 3.166522, 1, 0, 0.7137255, 1,
1.293397, 3.060453, 1.1164, 1, 0, 0.7098039, 1,
1.293653, 0.3023065, -0.2865627, 1, 0, 0.7019608, 1,
1.319808, 1.280772, 0.4740639, 1, 0, 0.6941177, 1,
1.322435, 0.08300745, 1.080272, 1, 0, 0.6901961, 1,
1.327085, -1.399938, 5.180561, 1, 0, 0.682353, 1,
1.327289, 0.5562843, 0.2849951, 1, 0, 0.6784314, 1,
1.331717, -1.053744, 2.495738, 1, 0, 0.6705883, 1,
1.335767, 1.270935, 0.4295319, 1, 0, 0.6666667, 1,
1.339832, 0.3506476, 1.178048, 1, 0, 0.6588235, 1,
1.340918, -0.8968474, 2.088185, 1, 0, 0.654902, 1,
1.367291, -0.7695538, 3.202962, 1, 0, 0.6470588, 1,
1.368977, 1.217789, 2.792169, 1, 0, 0.6431373, 1,
1.374094, 0.2439822, -0.7643695, 1, 0, 0.6352941, 1,
1.374742, -1.451052, 4.331356, 1, 0, 0.6313726, 1,
1.37636, -0.940361, 3.781055, 1, 0, 0.6235294, 1,
1.389947, -1.377574, 1.847793, 1, 0, 0.6196079, 1,
1.403516, -1.144381, 2.08997, 1, 0, 0.6117647, 1,
1.406423, -1.448935, 1.109801, 1, 0, 0.6078432, 1,
1.407071, -2.992414, 3.251344, 1, 0, 0.6, 1,
1.412029, 0.6091279, 2.440968, 1, 0, 0.5921569, 1,
1.412672, -0.3070732, 3.824631, 1, 0, 0.5882353, 1,
1.413459, -0.02258093, 1.169045, 1, 0, 0.5803922, 1,
1.415998, -0.2944252, 0.5268309, 1, 0, 0.5764706, 1,
1.417111, 1.411917, -0.3996233, 1, 0, 0.5686275, 1,
1.417276, -0.7717983, 2.570481, 1, 0, 0.5647059, 1,
1.419299, 1.433124, -0.4618468, 1, 0, 0.5568628, 1,
1.425124, 0.1902277, 1.771372, 1, 0, 0.5529412, 1,
1.430858, 0.4345223, 0.6428017, 1, 0, 0.5450981, 1,
1.445028, -0.7607573, 2.334707, 1, 0, 0.5411765, 1,
1.448317, 0.5553392, 1.62568, 1, 0, 0.5333334, 1,
1.452093, 0.02863479, 1.013818, 1, 0, 0.5294118, 1,
1.482762, -0.2395586, 1.653045, 1, 0, 0.5215687, 1,
1.486161, -1.979211, 3.232574, 1, 0, 0.5176471, 1,
1.490298, 0.6813354, 0.7407354, 1, 0, 0.509804, 1,
1.495193, -0.4324736, 1.405546, 1, 0, 0.5058824, 1,
1.495555, 0.227385, 1.600726, 1, 0, 0.4980392, 1,
1.500678, 1.489987, -0.3920145, 1, 0, 0.4901961, 1,
1.505582, 1.616628, 1.814066, 1, 0, 0.4862745, 1,
1.507498, -0.8775317, 1.451601, 1, 0, 0.4784314, 1,
1.512326, 0.2986824, 1.261942, 1, 0, 0.4745098, 1,
1.516219, -2.744287, 2.185203, 1, 0, 0.4666667, 1,
1.518155, 1.694506, 2.095318, 1, 0, 0.4627451, 1,
1.52719, -0.8706722, 2.761234, 1, 0, 0.454902, 1,
1.528222, -0.6631894, 0.9323486, 1, 0, 0.4509804, 1,
1.529745, 0.6970556, 1.05085, 1, 0, 0.4431373, 1,
1.529838, -0.03836775, 2.617418, 1, 0, 0.4392157, 1,
1.545505, -1.01495, 2.925367, 1, 0, 0.4313726, 1,
1.548858, -0.8655967, 2.32086, 1, 0, 0.427451, 1,
1.558492, -0.2037586, 0.4050644, 1, 0, 0.4196078, 1,
1.563037, 0.6162249, 0.6957371, 1, 0, 0.4156863, 1,
1.570977, -0.4819122, 1.764374, 1, 0, 0.4078431, 1,
1.572913, -0.001314978, 4.13998, 1, 0, 0.4039216, 1,
1.579339, -1.266055, 2.908154, 1, 0, 0.3960784, 1,
1.58785, 0.5975519, 2.006797, 1, 0, 0.3882353, 1,
1.596596, 1.799219, 1.361843, 1, 0, 0.3843137, 1,
1.613199, 0.3073627, 0.5642337, 1, 0, 0.3764706, 1,
1.62222, -1.814381, 1.847012, 1, 0, 0.372549, 1,
1.630064, 1.282895, 2.391742, 1, 0, 0.3647059, 1,
1.639111, -0.181161, 3.776111, 1, 0, 0.3607843, 1,
1.640101, 0.9118853, 0.3296805, 1, 0, 0.3529412, 1,
1.651565, -1.403268, 3.062248, 1, 0, 0.3490196, 1,
1.656129, -2.066914, 2.849028, 1, 0, 0.3411765, 1,
1.657556, -2.205721, 1.233212, 1, 0, 0.3372549, 1,
1.660425, 2.151438, 0.1314869, 1, 0, 0.3294118, 1,
1.664663, -1.33686, 2.396096, 1, 0, 0.3254902, 1,
1.689464, 0.7022777, 0.8029537, 1, 0, 0.3176471, 1,
1.702119, -1.715591, 3.546073, 1, 0, 0.3137255, 1,
1.70796, -0.4294483, 2.809592, 1, 0, 0.3058824, 1,
1.708528, 1.538926, 0.06943011, 1, 0, 0.2980392, 1,
1.710201, -1.163959, 3.762263, 1, 0, 0.2941177, 1,
1.711243, -1.837836, 2.241677, 1, 0, 0.2862745, 1,
1.716985, 1.569232, 1.074255, 1, 0, 0.282353, 1,
1.725394, 0.5900559, 0.6978961, 1, 0, 0.2745098, 1,
1.732756, -0.5211324, 2.520536, 1, 0, 0.2705882, 1,
1.742587, -1.473845, 2.574862, 1, 0, 0.2627451, 1,
1.745119, -0.5476402, 3.059153, 1, 0, 0.2588235, 1,
1.746689, -0.1995633, 0.8801031, 1, 0, 0.2509804, 1,
1.774607, 0.2745419, 1.832196, 1, 0, 0.2470588, 1,
1.807101, -1.794302, 2.267276, 1, 0, 0.2392157, 1,
1.825064, -1.267222, 2.473037, 1, 0, 0.2352941, 1,
1.825491, -0.3680058, 1.394485, 1, 0, 0.227451, 1,
1.850731, 0.701885, 1.527682, 1, 0, 0.2235294, 1,
1.851183, -0.9989915, 1.054574, 1, 0, 0.2156863, 1,
1.852195, -0.9390159, 0.900008, 1, 0, 0.2117647, 1,
1.870901, 0.5845534, 1.512629, 1, 0, 0.2039216, 1,
1.925695, -1.185166, 2.954185, 1, 0, 0.1960784, 1,
1.926651, 0.8921688, 1.494188, 1, 0, 0.1921569, 1,
1.945407, 0.7239479, 1.213671, 1, 0, 0.1843137, 1,
1.951174, 0.1770014, 0.3618192, 1, 0, 0.1803922, 1,
1.95833, 0.03395711, 1.344766, 1, 0, 0.172549, 1,
1.982019, 1.047574, 1.740018, 1, 0, 0.1686275, 1,
2.015939, 0.5517473, 1.325206, 1, 0, 0.1607843, 1,
2.021262, -1.668347, 3.292179, 1, 0, 0.1568628, 1,
2.022096, -1.754549, 1.398293, 1, 0, 0.1490196, 1,
2.076978, 1.249497, 1.329872, 1, 0, 0.145098, 1,
2.107193, -0.6927018, 2.685477, 1, 0, 0.1372549, 1,
2.111852, -0.8283229, 2.237931, 1, 0, 0.1333333, 1,
2.120929, 0.1926169, 1.355637, 1, 0, 0.1254902, 1,
2.140408, -0.862361, 2.873436, 1, 0, 0.1215686, 1,
2.144039, 0.1562819, 1.802605, 1, 0, 0.1137255, 1,
2.150541, 0.4190496, 1.821935, 1, 0, 0.1098039, 1,
2.151551, 0.1119855, 1.486029, 1, 0, 0.1019608, 1,
2.178873, 1.379434, 1.669912, 1, 0, 0.09411765, 1,
2.179949, -0.06605336, 0.7135871, 1, 0, 0.09019608, 1,
2.195813, 0.3379541, 1.789183, 1, 0, 0.08235294, 1,
2.216016, 0.3624727, 2.127123, 1, 0, 0.07843138, 1,
2.226318, 0.2823086, 1.620637, 1, 0, 0.07058824, 1,
2.230312, 0.1210674, 0.7673446, 1, 0, 0.06666667, 1,
2.246948, 1.756224, 2.947661, 1, 0, 0.05882353, 1,
2.25328, 0.4617321, 1.6333, 1, 0, 0.05490196, 1,
2.281165, 0.8434803, 1.912924, 1, 0, 0.04705882, 1,
2.339998, -1.022411, 1.425664, 1, 0, 0.04313726, 1,
2.364933, 0.504128, 1.480947, 1, 0, 0.03529412, 1,
2.475449, 0.1409956, 2.333676, 1, 0, 0.03137255, 1,
2.588191, 2.525358, 0.2510521, 1, 0, 0.02352941, 1,
2.944952, 1.376896, 1.656406, 1, 0, 0.01960784, 1,
3.151825, -1.076714, 1.53583, 1, 0, 0.01176471, 1,
3.328932, -0.1128917, 2.528783, 1, 0, 0.007843138, 1
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
0.1385696, -4.018375, -6.969995, 0, -0.5, 0.5, 0.5,
0.1385696, -4.018375, -6.969995, 1, -0.5, 0.5, 0.5,
0.1385696, -4.018375, -6.969995, 1, 1.5, 0.5, 0.5,
0.1385696, -4.018375, -6.969995, 0, 1.5, 0.5, 0.5
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
-4.133325, 0.03401971, -6.969995, 0, -0.5, 0.5, 0.5,
-4.133325, 0.03401971, -6.969995, 1, -0.5, 0.5, 0.5,
-4.133325, 0.03401971, -6.969995, 1, 1.5, 0.5, 0.5,
-4.133325, 0.03401971, -6.969995, 0, 1.5, 0.5, 0.5
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
-4.133325, -4.018375, -0.01420426, 0, -0.5, 0.5, 0.5,
-4.133325, -4.018375, -0.01420426, 1, -0.5, 0.5, 0.5,
-4.133325, -4.018375, -0.01420426, 1, 1.5, 0.5, 0.5,
-4.133325, -4.018375, -0.01420426, 0, 1.5, 0.5, 0.5
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
-3, -3.083207, -5.364812,
3, -3.083207, -5.364812,
-3, -3.083207, -5.364812,
-3, -3.239068, -5.632342,
-2, -3.083207, -5.364812,
-2, -3.239068, -5.632342,
-1, -3.083207, -5.364812,
-1, -3.239068, -5.632342,
0, -3.083207, -5.364812,
0, -3.239068, -5.632342,
1, -3.083207, -5.364812,
1, -3.239068, -5.632342,
2, -3.083207, -5.364812,
2, -3.239068, -5.632342,
3, -3.083207, -5.364812,
3, -3.239068, -5.632342
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
-3, -3.550791, -6.167403, 0, -0.5, 0.5, 0.5,
-3, -3.550791, -6.167403, 1, -0.5, 0.5, 0.5,
-3, -3.550791, -6.167403, 1, 1.5, 0.5, 0.5,
-3, -3.550791, -6.167403, 0, 1.5, 0.5, 0.5,
-2, -3.550791, -6.167403, 0, -0.5, 0.5, 0.5,
-2, -3.550791, -6.167403, 1, -0.5, 0.5, 0.5,
-2, -3.550791, -6.167403, 1, 1.5, 0.5, 0.5,
-2, -3.550791, -6.167403, 0, 1.5, 0.5, 0.5,
-1, -3.550791, -6.167403, 0, -0.5, 0.5, 0.5,
-1, -3.550791, -6.167403, 1, -0.5, 0.5, 0.5,
-1, -3.550791, -6.167403, 1, 1.5, 0.5, 0.5,
-1, -3.550791, -6.167403, 0, 1.5, 0.5, 0.5,
0, -3.550791, -6.167403, 0, -0.5, 0.5, 0.5,
0, -3.550791, -6.167403, 1, -0.5, 0.5, 0.5,
0, -3.550791, -6.167403, 1, 1.5, 0.5, 0.5,
0, -3.550791, -6.167403, 0, 1.5, 0.5, 0.5,
1, -3.550791, -6.167403, 0, -0.5, 0.5, 0.5,
1, -3.550791, -6.167403, 1, -0.5, 0.5, 0.5,
1, -3.550791, -6.167403, 1, 1.5, 0.5, 0.5,
1, -3.550791, -6.167403, 0, 1.5, 0.5, 0.5,
2, -3.550791, -6.167403, 0, -0.5, 0.5, 0.5,
2, -3.550791, -6.167403, 1, -0.5, 0.5, 0.5,
2, -3.550791, -6.167403, 1, 1.5, 0.5, 0.5,
2, -3.550791, -6.167403, 0, 1.5, 0.5, 0.5,
3, -3.550791, -6.167403, 0, -0.5, 0.5, 0.5,
3, -3.550791, -6.167403, 1, -0.5, 0.5, 0.5,
3, -3.550791, -6.167403, 1, 1.5, 0.5, 0.5,
3, -3.550791, -6.167403, 0, 1.5, 0.5, 0.5
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
-3.147503, -2, -5.364812,
-3.147503, 3, -5.364812,
-3.147503, -2, -5.364812,
-3.311807, -2, -5.632342,
-3.147503, -1, -5.364812,
-3.311807, -1, -5.632342,
-3.147503, 0, -5.364812,
-3.311807, 0, -5.632342,
-3.147503, 1, -5.364812,
-3.311807, 1, -5.632342,
-3.147503, 2, -5.364812,
-3.311807, 2, -5.632342,
-3.147503, 3, -5.364812,
-3.311807, 3, -5.632342
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
-3.640414, -2, -6.167403, 0, -0.5, 0.5, 0.5,
-3.640414, -2, -6.167403, 1, -0.5, 0.5, 0.5,
-3.640414, -2, -6.167403, 1, 1.5, 0.5, 0.5,
-3.640414, -2, -6.167403, 0, 1.5, 0.5, 0.5,
-3.640414, -1, -6.167403, 0, -0.5, 0.5, 0.5,
-3.640414, -1, -6.167403, 1, -0.5, 0.5, 0.5,
-3.640414, -1, -6.167403, 1, 1.5, 0.5, 0.5,
-3.640414, -1, -6.167403, 0, 1.5, 0.5, 0.5,
-3.640414, 0, -6.167403, 0, -0.5, 0.5, 0.5,
-3.640414, 0, -6.167403, 1, -0.5, 0.5, 0.5,
-3.640414, 0, -6.167403, 1, 1.5, 0.5, 0.5,
-3.640414, 0, -6.167403, 0, 1.5, 0.5, 0.5,
-3.640414, 1, -6.167403, 0, -0.5, 0.5, 0.5,
-3.640414, 1, -6.167403, 1, -0.5, 0.5, 0.5,
-3.640414, 1, -6.167403, 1, 1.5, 0.5, 0.5,
-3.640414, 1, -6.167403, 0, 1.5, 0.5, 0.5,
-3.640414, 2, -6.167403, 0, -0.5, 0.5, 0.5,
-3.640414, 2, -6.167403, 1, -0.5, 0.5, 0.5,
-3.640414, 2, -6.167403, 1, 1.5, 0.5, 0.5,
-3.640414, 2, -6.167403, 0, 1.5, 0.5, 0.5,
-3.640414, 3, -6.167403, 0, -0.5, 0.5, 0.5,
-3.640414, 3, -6.167403, 1, -0.5, 0.5, 0.5,
-3.640414, 3, -6.167403, 1, 1.5, 0.5, 0.5,
-3.640414, 3, -6.167403, 0, 1.5, 0.5, 0.5
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
-3.147503, -3.083207, -4,
-3.147503, -3.083207, 4,
-3.147503, -3.083207, -4,
-3.311807, -3.239068, -4,
-3.147503, -3.083207, -2,
-3.311807, -3.239068, -2,
-3.147503, -3.083207, 0,
-3.311807, -3.239068, 0,
-3.147503, -3.083207, 2,
-3.311807, -3.239068, 2,
-3.147503, -3.083207, 4,
-3.311807, -3.239068, 4
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
-3.640414, -3.550791, -4, 0, -0.5, 0.5, 0.5,
-3.640414, -3.550791, -4, 1, -0.5, 0.5, 0.5,
-3.640414, -3.550791, -4, 1, 1.5, 0.5, 0.5,
-3.640414, -3.550791, -4, 0, 1.5, 0.5, 0.5,
-3.640414, -3.550791, -2, 0, -0.5, 0.5, 0.5,
-3.640414, -3.550791, -2, 1, -0.5, 0.5, 0.5,
-3.640414, -3.550791, -2, 1, 1.5, 0.5, 0.5,
-3.640414, -3.550791, -2, 0, 1.5, 0.5, 0.5,
-3.640414, -3.550791, 0, 0, -0.5, 0.5, 0.5,
-3.640414, -3.550791, 0, 1, -0.5, 0.5, 0.5,
-3.640414, -3.550791, 0, 1, 1.5, 0.5, 0.5,
-3.640414, -3.550791, 0, 0, 1.5, 0.5, 0.5,
-3.640414, -3.550791, 2, 0, -0.5, 0.5, 0.5,
-3.640414, -3.550791, 2, 1, -0.5, 0.5, 0.5,
-3.640414, -3.550791, 2, 1, 1.5, 0.5, 0.5,
-3.640414, -3.550791, 2, 0, 1.5, 0.5, 0.5,
-3.640414, -3.550791, 4, 0, -0.5, 0.5, 0.5,
-3.640414, -3.550791, 4, 1, -0.5, 0.5, 0.5,
-3.640414, -3.550791, 4, 1, 1.5, 0.5, 0.5,
-3.640414, -3.550791, 4, 0, 1.5, 0.5, 0.5
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
-3.147503, -3.083207, -5.364812,
-3.147503, 3.151246, -5.364812,
-3.147503, -3.083207, 5.336403,
-3.147503, 3.151246, 5.336403,
-3.147503, -3.083207, -5.364812,
-3.147503, -3.083207, 5.336403,
-3.147503, 3.151246, -5.364812,
-3.147503, 3.151246, 5.336403,
-3.147503, -3.083207, -5.364812,
3.424642, -3.083207, -5.364812,
-3.147503, -3.083207, 5.336403,
3.424642, -3.083207, 5.336403,
-3.147503, 3.151246, -5.364812,
3.424642, 3.151246, -5.364812,
-3.147503, 3.151246, 5.336403,
3.424642, 3.151246, 5.336403,
3.424642, -3.083207, -5.364812,
3.424642, 3.151246, -5.364812,
3.424642, -3.083207, 5.336403,
3.424642, 3.151246, 5.336403,
3.424642, -3.083207, -5.364812,
3.424642, -3.083207, 5.336403,
3.424642, 3.151246, -5.364812,
3.424642, 3.151246, 5.336403
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
var radius = 7.486734;
var distance = 33.30933;
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
mvMatrix.translate( -0.1385696, -0.03401971, 0.01420426 );
mvMatrix.scale( 1.231683, 1.298398, 0.7564377 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.30933);
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
Dalapon<-read.table("Dalapon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dalapon$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dalapon' not found
```

```r
y<-Dalapon$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dalapon' not found
```

```r
z<-Dalapon$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dalapon' not found
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
-3.051792, 0.973785, -1.891374, 0, 0, 1, 1, 1,
-2.862432, 0.8224856, -1.182745, 1, 0, 0, 1, 1,
-2.617175, 0.8861424, -0.5476798, 1, 0, 0, 1, 1,
-2.613148, 1.685929, -0.6456101, 1, 0, 0, 1, 1,
-2.579677, -0.6190856, 0.9009894, 1, 0, 0, 1, 1,
-2.488335, -0.6923478, -1.529591, 1, 0, 0, 1, 1,
-2.364814, -1.215303, -2.437575, 0, 0, 0, 1, 1,
-2.323569, 0.0003522276, -1.133873, 0, 0, 0, 1, 1,
-2.299984, 0.5086446, -1.096322, 0, 0, 0, 1, 1,
-2.289333, 0.8464836, -0.8298855, 0, 0, 0, 1, 1,
-2.275823, -0.3701756, -2.439913, 0, 0, 0, 1, 1,
-2.255257, 0.3224115, -1.234999, 0, 0, 0, 1, 1,
-2.250706, 1.080597, -1.0787, 0, 0, 0, 1, 1,
-2.201494, 0.9489614, -0.07979911, 1, 1, 1, 1, 1,
-2.146876, -0.3514165, -1.171366, 1, 1, 1, 1, 1,
-2.146318, -1.074053, -1.319568, 1, 1, 1, 1, 1,
-2.137259, 0.1388091, -0.7573991, 1, 1, 1, 1, 1,
-2.101106, 1.385715, -0.1394513, 1, 1, 1, 1, 1,
-2.100706, 0.5507146, -2.134461, 1, 1, 1, 1, 1,
-2.093542, -1.069491, -2.845962, 1, 1, 1, 1, 1,
-2.054838, 0.7442167, -1.075155, 1, 1, 1, 1, 1,
-2.040579, 0.7227255, -1.884167, 1, 1, 1, 1, 1,
-2.034563, 0.4741901, -3.100398, 1, 1, 1, 1, 1,
-2.020489, 1.181406, -1.967623, 1, 1, 1, 1, 1,
-1.99923, 0.3234184, -1.775237, 1, 1, 1, 1, 1,
-1.994432, 1.134626, -2.956168, 1, 1, 1, 1, 1,
-1.958311, -0.560478, -1.836239, 1, 1, 1, 1, 1,
-1.939415, 0.6668027, -2.287169, 1, 1, 1, 1, 1,
-1.938786, -1.036234, -2.752946, 0, 0, 1, 1, 1,
-1.93829, -1.674253, -2.436325, 1, 0, 0, 1, 1,
-1.931475, 0.632285, -0.1253336, 1, 0, 0, 1, 1,
-1.892456, -1.748961, -3.347329, 1, 0, 0, 1, 1,
-1.879442, 0.1185702, 0.9393613, 1, 0, 0, 1, 1,
-1.821179, -1.539227, -2.373654, 1, 0, 0, 1, 1,
-1.799368, 0.3575152, -0.9083885, 0, 0, 0, 1, 1,
-1.7939, -0.773667, -0.5157067, 0, 0, 0, 1, 1,
-1.788001, -0.6283728, -2.177366, 0, 0, 0, 1, 1,
-1.779949, 1.292905, -1.053921, 0, 0, 0, 1, 1,
-1.764011, -1.383748, 1.662236, 0, 0, 0, 1, 1,
-1.762269, 0.2437107, -0.9806697, 0, 0, 0, 1, 1,
-1.760696, 0.07581009, -2.336926, 0, 0, 0, 1, 1,
-1.756055, -1.151165, -2.370293, 1, 1, 1, 1, 1,
-1.747822, 1.756488, -0.7374128, 1, 1, 1, 1, 1,
-1.745666, 0.428839, -2.098587, 1, 1, 1, 1, 1,
-1.739507, 1.020451, -0.3138131, 1, 1, 1, 1, 1,
-1.738216, 1.215578, -2.399465, 1, 1, 1, 1, 1,
-1.732508, 0.4581449, -2.550773, 1, 1, 1, 1, 1,
-1.695409, 0.09895229, -1.943994, 1, 1, 1, 1, 1,
-1.694493, 1.198742, -1.109402, 1, 1, 1, 1, 1,
-1.684081, 0.811915, -1.138325, 1, 1, 1, 1, 1,
-1.655362, -1.050351, -3.574712, 1, 1, 1, 1, 1,
-1.653189, 0.211256, -1.134831, 1, 1, 1, 1, 1,
-1.619215, 0.6588151, 0.1765591, 1, 1, 1, 1, 1,
-1.602845, 1.644739, -0.8538268, 1, 1, 1, 1, 1,
-1.586751, 2.173286, -0.600108, 1, 1, 1, 1, 1,
-1.58442, -1.050742, -2.962962, 1, 1, 1, 1, 1,
-1.576825, -0.4650114, -1.337463, 0, 0, 1, 1, 1,
-1.555489, -0.02831324, -1.987018, 1, 0, 0, 1, 1,
-1.555023, 0.8578433, -0.8123613, 1, 0, 0, 1, 1,
-1.554205, -1.526524, -3.519925, 1, 0, 0, 1, 1,
-1.551026, -2.201105, -2.946856, 1, 0, 0, 1, 1,
-1.540847, -0.2280297, -0.8670318, 1, 0, 0, 1, 1,
-1.531738, 0.227171, -0.06712826, 0, 0, 0, 1, 1,
-1.528871, -0.02779121, -0.6725573, 0, 0, 0, 1, 1,
-1.520073, 1.081029, -0.5327777, 0, 0, 0, 1, 1,
-1.518911, -0.8209243, -2.755178, 0, 0, 0, 1, 1,
-1.513023, 1.242372, -0.3047251, 0, 0, 0, 1, 1,
-1.505937, -0.5382754, -1.849242, 0, 0, 0, 1, 1,
-1.505632, -0.6310191, -1.279005, 0, 0, 0, 1, 1,
-1.502151, -2.088598, -2.532022, 1, 1, 1, 1, 1,
-1.499406, -0.04520864, -1.344707, 1, 1, 1, 1, 1,
-1.49434, 0.3027826, -1.200746, 1, 1, 1, 1, 1,
-1.480535, -1.189309, -1.307082, 1, 1, 1, 1, 1,
-1.469105, 1.673151, 0.7454241, 1, 1, 1, 1, 1,
-1.460379, 1.123423, 0.7957261, 1, 1, 1, 1, 1,
-1.45372, 0.9011284, -3.320931, 1, 1, 1, 1, 1,
-1.445874, -1.324477, -3.874215, 1, 1, 1, 1, 1,
-1.431514, 1.798001, -1.991939, 1, 1, 1, 1, 1,
-1.429069, -0.4932527, -2.094515, 1, 1, 1, 1, 1,
-1.427005, 1.019561, -0.445, 1, 1, 1, 1, 1,
-1.426858, -2.498921, -3.023471, 1, 1, 1, 1, 1,
-1.414596, 1.164364, -0.7180284, 1, 1, 1, 1, 1,
-1.409022, 0.2536131, -0.1949382, 1, 1, 1, 1, 1,
-1.408836, -0.9260812, -1.37632, 1, 1, 1, 1, 1,
-1.400969, -1.356989, -2.276229, 0, 0, 1, 1, 1,
-1.395438, 0.9837822, -0.3264191, 1, 0, 0, 1, 1,
-1.389973, 0.957489, -0.8017665, 1, 0, 0, 1, 1,
-1.387027, -0.4832383, -2.457447, 1, 0, 0, 1, 1,
-1.38549, -1.298862, -1.007262, 1, 0, 0, 1, 1,
-1.376617, -1.903053, -1.87678, 1, 0, 0, 1, 1,
-1.375885, -1.889146, -2.151989, 0, 0, 0, 1, 1,
-1.375381, 0.1828648, -1.030571, 0, 0, 0, 1, 1,
-1.35595, 0.05378237, -1.239356, 0, 0, 0, 1, 1,
-1.3549, -2.207512, -2.792958, 0, 0, 0, 1, 1,
-1.345639, 0.1179819, -1.401768, 0, 0, 0, 1, 1,
-1.339216, 0.4902185, -0.745055, 0, 0, 0, 1, 1,
-1.335498, 0.8700197, 0.01027902, 0, 0, 0, 1, 1,
-1.324782, 1.04965, -2.937967, 1, 1, 1, 1, 1,
-1.318677, -0.4208262, -0.5850721, 1, 1, 1, 1, 1,
-1.316719, 1.466134, 0.1401551, 1, 1, 1, 1, 1,
-1.310454, 0.201435, 0.06072815, 1, 1, 1, 1, 1,
-1.297544, -0.04270037, -0.9854344, 1, 1, 1, 1, 1,
-1.29351, 0.9082007, -0.6274801, 1, 1, 1, 1, 1,
-1.290052, 0.7579356, -2.04337, 1, 1, 1, 1, 1,
-1.271079, -1.209153, -1.510776, 1, 1, 1, 1, 1,
-1.26876, -0.6827853, -2.931216, 1, 1, 1, 1, 1,
-1.258084, -0.7341662, -3.048111, 1, 1, 1, 1, 1,
-1.255828, 1.33992, -0.5639465, 1, 1, 1, 1, 1,
-1.25493, -0.9632185, -1.552148, 1, 1, 1, 1, 1,
-1.249607, 0.03812373, -3.888724, 1, 1, 1, 1, 1,
-1.245154, -0.9558877, -2.520705, 1, 1, 1, 1, 1,
-1.243688, -0.2207179, -2.779981, 1, 1, 1, 1, 1,
-1.240187, 0.6574766, -1.048071, 0, 0, 1, 1, 1,
-1.23784, 0.4550526, -0.8010712, 1, 0, 0, 1, 1,
-1.23649, 1.337413, -2.703257, 1, 0, 0, 1, 1,
-1.232169, 0.2135184, -3.589365, 1, 0, 0, 1, 1,
-1.231152, -0.6710396, -2.868107, 1, 0, 0, 1, 1,
-1.221623, 0.807054, -0.8725979, 1, 0, 0, 1, 1,
-1.206055, -0.451555, -2.630153, 0, 0, 0, 1, 1,
-1.183833, 1.249871, 0.7811971, 0, 0, 0, 1, 1,
-1.183535, -0.3481804, -2.329642, 0, 0, 0, 1, 1,
-1.166859, -0.6592401, -3.073891, 0, 0, 0, 1, 1,
-1.163365, -1.653975, -1.259899, 0, 0, 0, 1, 1,
-1.15926, -0.7952092, -3.13965, 0, 0, 0, 1, 1,
-1.154991, -1.526494, -3.278505, 0, 0, 0, 1, 1,
-1.154374, -0.3750303, -3.230929, 1, 1, 1, 1, 1,
-1.143921, -0.2988157, -0.3207913, 1, 1, 1, 1, 1,
-1.132857, -0.7101944, -2.050378, 1, 1, 1, 1, 1,
-1.131173, 0.4181874, -2.064625, 1, 1, 1, 1, 1,
-1.127347, 0.3612682, -1.077994, 1, 1, 1, 1, 1,
-1.125744, 0.6436856, -0.8622065, 1, 1, 1, 1, 1,
-1.119851, -2.008819, -1.94313, 1, 1, 1, 1, 1,
-1.115699, -0.3647539, -2.326042, 1, 1, 1, 1, 1,
-1.114128, 0.6520842, -0.6850727, 1, 1, 1, 1, 1,
-1.108933, -0.06920013, -1.196552, 1, 1, 1, 1, 1,
-1.106238, 0.6403377, -1.720924, 1, 1, 1, 1, 1,
-1.084815, 2.295307, -0.8050197, 1, 1, 1, 1, 1,
-1.068506, -0.9518695, -1.346501, 1, 1, 1, 1, 1,
-1.063167, -0.3826445, -2.197772, 1, 1, 1, 1, 1,
-1.060191, -0.7058518, -2.287565, 1, 1, 1, 1, 1,
-1.035552, 0.4243936, -0.5854732, 0, 0, 1, 1, 1,
-1.028662, 0.2770593, -0.7537587, 1, 0, 0, 1, 1,
-1.018522, -0.33303, -2.186093, 1, 0, 0, 1, 1,
-1.018121, -0.8332902, -1.880982, 1, 0, 0, 1, 1,
-1.01391, 0.2537455, 0.4399327, 1, 0, 0, 1, 1,
-1.011973, -1.286754, -2.444606, 1, 0, 0, 1, 1,
-1.009827, -0.8453067, -0.6871881, 0, 0, 0, 1, 1,
-1.006613, 0.6961444, -0.02647559, 0, 0, 0, 1, 1,
-0.9928568, -1.692489, -2.06605, 0, 0, 0, 1, 1,
-0.9858453, 2.328631, -2.532325, 0, 0, 0, 1, 1,
-0.9815129, -1.42452, -2.033985, 0, 0, 0, 1, 1,
-0.9814631, 0.3688485, -0.5690923, 0, 0, 0, 1, 1,
-0.9747746, -0.02765001, -1.510789, 0, 0, 0, 1, 1,
-0.9744195, 1.474006, 0.07937477, 1, 1, 1, 1, 1,
-0.9635557, 1.325828, -1.468957, 1, 1, 1, 1, 1,
-0.9604169, -0.9528684, -1.77415, 1, 1, 1, 1, 1,
-0.9602942, 0.9824418, -1.859338, 1, 1, 1, 1, 1,
-0.953505, 0.6060743, -1.192861, 1, 1, 1, 1, 1,
-0.948579, 0.04106759, -0.5425994, 1, 1, 1, 1, 1,
-0.9419755, 0.4355662, -1.635202, 1, 1, 1, 1, 1,
-0.9407972, 1.722251, 0.3545254, 1, 1, 1, 1, 1,
-0.9344952, -0.6587893, -0.4815206, 1, 1, 1, 1, 1,
-0.9331613, -1.082331, -2.979344, 1, 1, 1, 1, 1,
-0.9308327, 0.7476057, -0.9789807, 1, 1, 1, 1, 1,
-0.9270123, 1.089039, -0.6920494, 1, 1, 1, 1, 1,
-0.924601, 1.53118, -0.7260309, 1, 1, 1, 1, 1,
-0.9217179, 0.9715364, -0.7669911, 1, 1, 1, 1, 1,
-0.9213127, 1.482753, -0.2455956, 1, 1, 1, 1, 1,
-0.9083756, 1.166297, -1.695399, 0, 0, 1, 1, 1,
-0.8998108, -0.8666613, -2.626392, 1, 0, 0, 1, 1,
-0.8981119, 0.5498962, -0.593094, 1, 0, 0, 1, 1,
-0.8936689, -0.8264994, -1.380553, 1, 0, 0, 1, 1,
-0.893655, 0.4022112, -1.534393, 1, 0, 0, 1, 1,
-0.8898927, -0.1907246, -3.058999, 1, 0, 0, 1, 1,
-0.8825564, -0.716049, -0.8136811, 0, 0, 0, 1, 1,
-0.8804971, 0.08146115, -1.387862, 0, 0, 0, 1, 1,
-0.8779856, 2.132859, 1.303053, 0, 0, 0, 1, 1,
-0.8651485, 0.8993512, 0.1515624, 0, 0, 0, 1, 1,
-0.8619131, 0.6014999, -1.384404, 0, 0, 0, 1, 1,
-0.8549714, -0.06285675, -2.276999, 0, 0, 0, 1, 1,
-0.8545907, 0.5072563, -2.530765, 0, 0, 0, 1, 1,
-0.8507341, 1.514812, -0.6175387, 1, 1, 1, 1, 1,
-0.8492873, -0.05749372, -1.658046, 1, 1, 1, 1, 1,
-0.8447952, -1.566972, -3.448294, 1, 1, 1, 1, 1,
-0.8395974, -1.060203, -2.452954, 1, 1, 1, 1, 1,
-0.8338683, -0.4965826, -1.299704, 1, 1, 1, 1, 1,
-0.833482, 0.7154402, 0.1048606, 1, 1, 1, 1, 1,
-0.828709, -0.2633837, -1.954152, 1, 1, 1, 1, 1,
-0.8205454, 0.6385152, -1.330478, 1, 1, 1, 1, 1,
-0.8151169, -1.244466, -4.287501, 1, 1, 1, 1, 1,
-0.81496, 1.337129, -0.9047148, 1, 1, 1, 1, 1,
-0.8138958, 0.3299542, -2.563118, 1, 1, 1, 1, 1,
-0.8138464, 0.004454839, -2.40528, 1, 1, 1, 1, 1,
-0.8086486, -0.102267, -1.044291, 1, 1, 1, 1, 1,
-0.8051209, 0.7736461, -0.5002288, 1, 1, 1, 1, 1,
-0.8042793, -0.3545306, -1.332244, 1, 1, 1, 1, 1,
-0.8028254, -0.1842484, -0.3718769, 0, 0, 1, 1, 1,
-0.8005195, 0.8503581, -0.6350063, 1, 0, 0, 1, 1,
-0.7944257, -0.1376116, -1.212345, 1, 0, 0, 1, 1,
-0.7920514, -0.4280514, -1.754387, 1, 0, 0, 1, 1,
-0.7893353, -1.508008, -3.778292, 1, 0, 0, 1, 1,
-0.7825196, 0.3764247, -1.816082, 1, 0, 0, 1, 1,
-0.7821562, -0.01262516, -1.524489, 0, 0, 0, 1, 1,
-0.7758328, -0.1755413, -2.027117, 0, 0, 0, 1, 1,
-0.7743931, -0.7621093, -2.709385, 0, 0, 0, 1, 1,
-0.759517, -0.5998087, -3.629208, 0, 0, 0, 1, 1,
-0.7353838, -1.440234, -3.006346, 0, 0, 0, 1, 1,
-0.7336022, 0.05660319, -3.33504, 0, 0, 0, 1, 1,
-0.7326561, -0.9235764, -2.914714, 0, 0, 0, 1, 1,
-0.73162, 0.2756366, -1.690795, 1, 1, 1, 1, 1,
-0.7301739, -0.8949174, -4.276548, 1, 1, 1, 1, 1,
-0.7276959, 1.873633, -0.7586148, 1, 1, 1, 1, 1,
-0.721278, -0.6202201, -2.845072, 1, 1, 1, 1, 1,
-0.72049, 0.1189526, -0.8707276, 1, 1, 1, 1, 1,
-0.7189129, -0.739251, -2.58129, 1, 1, 1, 1, 1,
-0.7148185, 0.1733873, -2.672833, 1, 1, 1, 1, 1,
-0.7091714, -0.2568023, -0.2212331, 1, 1, 1, 1, 1,
-0.7083101, -0.4698626, -2.178784, 1, 1, 1, 1, 1,
-0.7051477, -1.428305, -3.166264, 1, 1, 1, 1, 1,
-0.7028055, 1.544282, -0.9611996, 1, 1, 1, 1, 1,
-0.6992578, -0.5585492, -3.285239, 1, 1, 1, 1, 1,
-0.6988313, -2.041663, -3.823345, 1, 1, 1, 1, 1,
-0.6954807, -0.442742, -0.5784596, 1, 1, 1, 1, 1,
-0.6949466, -0.56578, -1.315038, 1, 1, 1, 1, 1,
-0.6878076, -0.8319762, -2.975304, 0, 0, 1, 1, 1,
-0.6792855, 0.05530918, -0.7370777, 1, 0, 0, 1, 1,
-0.6767405, 1.56427, -0.4964687, 1, 0, 0, 1, 1,
-0.6759063, 0.6714671, -0.37504, 1, 0, 0, 1, 1,
-0.6669463, -1.116175, -2.697226, 1, 0, 0, 1, 1,
-0.6642811, 0.9007523, -0.7705288, 1, 0, 0, 1, 1,
-0.6626953, -0.3934311, -3.610824, 0, 0, 0, 1, 1,
-0.6590078, -0.4951242, -1.911628, 0, 0, 0, 1, 1,
-0.65274, -1.061668, -1.779145, 0, 0, 0, 1, 1,
-0.6502436, -0.6925678, -1.436082, 0, 0, 0, 1, 1,
-0.6490052, -0.4118975, -2.557427, 0, 0, 0, 1, 1,
-0.6488294, -0.520578, -3.387502, 0, 0, 0, 1, 1,
-0.6478277, 1.023817, -1.754491, 0, 0, 0, 1, 1,
-0.6427275, -0.1956267, -2.234626, 1, 1, 1, 1, 1,
-0.6426867, 0.4808043, -1.22403, 1, 1, 1, 1, 1,
-0.6413879, 0.5991515, -1.624453, 1, 1, 1, 1, 1,
-0.6327469, 0.2265179, -0.6442137, 1, 1, 1, 1, 1,
-0.6280082, 0.7503141, -1.545092, 1, 1, 1, 1, 1,
-0.6279916, -1.524949, -3.353277, 1, 1, 1, 1, 1,
-0.6253998, 2.073974, 0.3661192, 1, 1, 1, 1, 1,
-0.6152986, -0.1910614, 0.0471454, 1, 1, 1, 1, 1,
-0.6139866, 0.8425138, -1.145784, 1, 1, 1, 1, 1,
-0.612186, 0.8694819, 0.7394568, 1, 1, 1, 1, 1,
-0.6093837, -1.530818, -2.535528, 1, 1, 1, 1, 1,
-0.6063222, 0.08416853, -1.013083, 1, 1, 1, 1, 1,
-0.6022478, -0.6197797, -3.199431, 1, 1, 1, 1, 1,
-0.6007845, 0.1595758, -1.675059, 1, 1, 1, 1, 1,
-0.6004828, 2.71505, 0.1635818, 1, 1, 1, 1, 1,
-0.600474, -0.06817408, -1.0318, 0, 0, 1, 1, 1,
-0.5991306, -0.7753549, -1.326403, 1, 0, 0, 1, 1,
-0.5949358, -0.9354755, -4.582994, 1, 0, 0, 1, 1,
-0.5848199, -0.9847987, -1.738564, 1, 0, 0, 1, 1,
-0.5794706, -0.7558119, -3.134781, 1, 0, 0, 1, 1,
-0.5723626, 0.2430297, -0.05634432, 1, 0, 0, 1, 1,
-0.5711542, -0.3688479, -3.711086, 0, 0, 0, 1, 1,
-0.5675241, -0.6003541, -2.706667, 0, 0, 0, 1, 1,
-0.5602679, 1.118602, -2.474706, 0, 0, 0, 1, 1,
-0.5601994, 1.141233, -0.5125012, 0, 0, 0, 1, 1,
-0.5578308, -0.5725526, -2.980339, 0, 0, 0, 1, 1,
-0.5533766, 1.149016, -0.6043289, 0, 0, 0, 1, 1,
-0.5519957, -1.561002, -2.454774, 0, 0, 0, 1, 1,
-0.5519829, 0.03357863, -2.331241, 1, 1, 1, 1, 1,
-0.5513352, -0.8539088, -3.849929, 1, 1, 1, 1, 1,
-0.5511248, -0.4053626, -3.854683, 1, 1, 1, 1, 1,
-0.5422277, 2.083014, -1.586262, 1, 1, 1, 1, 1,
-0.5362272, -0.04420027, -2.847082, 1, 1, 1, 1, 1,
-0.5342336, 0.1447517, -2.096852, 1, 1, 1, 1, 1,
-0.524655, -2.368155, -3.75906, 1, 1, 1, 1, 1,
-0.5196404, 0.3023584, -1.327446, 1, 1, 1, 1, 1,
-0.5167538, 0.5040469, -0.1993058, 1, 1, 1, 1, 1,
-0.5134355, 0.1080613, -1.675969, 1, 1, 1, 1, 1,
-0.5096189, -1.335331, -0.9795098, 1, 1, 1, 1, 1,
-0.5076364, 0.3870012, -0.6429982, 1, 1, 1, 1, 1,
-0.5053644, 1.733661, -1.079536, 1, 1, 1, 1, 1,
-0.5040239, 0.4675376, -1.505453, 1, 1, 1, 1, 1,
-0.502685, -0.1500706, -3.67541, 1, 1, 1, 1, 1,
-0.5026559, -1.597446, -3.703763, 0, 0, 1, 1, 1,
-0.4999472, -0.5968525, -2.053376, 1, 0, 0, 1, 1,
-0.4970937, 0.6578955, -2.478081, 1, 0, 0, 1, 1,
-0.4961938, -0.4900588, -3.436138, 1, 0, 0, 1, 1,
-0.4953731, -0.4385071, -2.261568, 1, 0, 0, 1, 1,
-0.4953163, 0.005876066, -3.781578, 1, 0, 0, 1, 1,
-0.4926653, -1.317923, -2.764083, 0, 0, 0, 1, 1,
-0.4921081, 0.09915963, -1.356852, 0, 0, 0, 1, 1,
-0.4911359, 1.428393, 0.6342216, 0, 0, 0, 1, 1,
-0.4910054, 0.4016769, -1.442305, 0, 0, 0, 1, 1,
-0.4849326, 0.5600809, -0.3919554, 0, 0, 0, 1, 1,
-0.4838464, -0.3499152, -0.5517106, 0, 0, 0, 1, 1,
-0.4804094, 0.01628183, -0.2396598, 0, 0, 0, 1, 1,
-0.4771162, 0.4025894, -2.029193, 1, 1, 1, 1, 1,
-0.4761701, 0.7933093, -1.17161, 1, 1, 1, 1, 1,
-0.4706097, -2.603173, -2.2773, 1, 1, 1, 1, 1,
-0.4670301, 0.1290157, -3.468196, 1, 1, 1, 1, 1,
-0.4666188, -1.23024, -0.6315482, 1, 1, 1, 1, 1,
-0.4655122, 0.255115, -2.14847, 1, 1, 1, 1, 1,
-0.4643937, 1.997389, -0.9585266, 1, 1, 1, 1, 1,
-0.4637184, -1.009958, -2.335495, 1, 1, 1, 1, 1,
-0.4633918, -0.4612427, -2.475528, 1, 1, 1, 1, 1,
-0.4629988, -0.9967313, -2.553406, 1, 1, 1, 1, 1,
-0.4627838, 2.533283, 1.061218, 1, 1, 1, 1, 1,
-0.4534467, -0.3684602, -3.823162, 1, 1, 1, 1, 1,
-0.4502557, -0.3172655, -1.655313, 1, 1, 1, 1, 1,
-0.450106, -0.6888548, -2.405261, 1, 1, 1, 1, 1,
-0.4470893, -0.6169968, -1.91687, 1, 1, 1, 1, 1,
-0.4412101, 0.9190499, 0.2972922, 0, 0, 1, 1, 1,
-0.4407189, 0.1924976, 1.661436, 1, 0, 0, 1, 1,
-0.4398806, 1.676376, -1.378442, 1, 0, 0, 1, 1,
-0.4345116, 0.08905144, -2.401364, 1, 0, 0, 1, 1,
-0.4301362, -1.448744, -4.002475, 1, 0, 0, 1, 1,
-0.4281636, 2.079648, -0.8379449, 1, 0, 0, 1, 1,
-0.4262283, 0.7482342, -2.071678, 0, 0, 0, 1, 1,
-0.4260827, 0.3676739, -1.057338, 0, 0, 0, 1, 1,
-0.4239813, 1.652492, -0.3243804, 0, 0, 0, 1, 1,
-0.4234803, 0.2160835, -0.3855792, 0, 0, 0, 1, 1,
-0.420236, -0.7142816, -1.864161, 0, 0, 0, 1, 1,
-0.4169188, -0.5948527, -3.68817, 0, 0, 0, 1, 1,
-0.4105327, 0.977937, -1.631251, 0, 0, 0, 1, 1,
-0.4064749, 0.4505923, -0.9251192, 1, 1, 1, 1, 1,
-0.4012463, -0.1921279, -1.472257, 1, 1, 1, 1, 1,
-0.3956159, -1.988131, -2.872307, 1, 1, 1, 1, 1,
-0.3953738, -0.2855012, -0.8034576, 1, 1, 1, 1, 1,
-0.3945526, -0.2684578, -1.028604, 1, 1, 1, 1, 1,
-0.3939278, 0.987433, -0.05084784, 1, 1, 1, 1, 1,
-0.3923805, -0.4951076, -3.656902, 1, 1, 1, 1, 1,
-0.3917095, 0.0386937, -0.9306774, 1, 1, 1, 1, 1,
-0.390243, -1.454701, -3.306113, 1, 1, 1, 1, 1,
-0.3900397, -1.37859, -2.733599, 1, 1, 1, 1, 1,
-0.3793039, 0.9682465, 0.06136321, 1, 1, 1, 1, 1,
-0.3716878, -0.9179901, -3.156686, 1, 1, 1, 1, 1,
-0.3712624, -0.704717, -2.979757, 1, 1, 1, 1, 1,
-0.3700541, 0.4419202, -0.4873122, 1, 1, 1, 1, 1,
-0.3691521, -1.372501, -2.405399, 1, 1, 1, 1, 1,
-0.3683494, -0.1429181, -1.220297, 0, 0, 1, 1, 1,
-0.3663011, 0.6248108, -0.9634073, 1, 0, 0, 1, 1,
-0.3631604, 0.07904725, -1.759901, 1, 0, 0, 1, 1,
-0.3596428, 0.2772103, -0.5850223, 1, 0, 0, 1, 1,
-0.3565586, 0.1116625, -0.146811, 1, 0, 0, 1, 1,
-0.3541464, -0.5640065, -0.2507544, 1, 0, 0, 1, 1,
-0.3523859, 0.317394, -1.242485, 0, 0, 0, 1, 1,
-0.3513962, 0.8639891, -1.405457, 0, 0, 0, 1, 1,
-0.3466926, 0.2075254, -1.19511, 0, 0, 0, 1, 1,
-0.3408501, -0.1429259, -2.095696, 0, 0, 0, 1, 1,
-0.3393628, 1.871895, -0.1737181, 0, 0, 0, 1, 1,
-0.3360757, -0.5642459, -0.8073677, 0, 0, 0, 1, 1,
-0.3356704, 0.1634396, -1.138849, 0, 0, 0, 1, 1,
-0.3346895, -0.7169788, -2.545611, 1, 1, 1, 1, 1,
-0.3322386, -0.7417169, -2.454081, 1, 1, 1, 1, 1,
-0.3317191, -0.4446505, -2.141728, 1, 1, 1, 1, 1,
-0.3268236, 0.6669713, 0.5810043, 1, 1, 1, 1, 1,
-0.3255875, -0.2579683, -2.754892, 1, 1, 1, 1, 1,
-0.3250508, -0.02424624, -0.8050606, 1, 1, 1, 1, 1,
-0.321497, -0.8844553, -3.151088, 1, 1, 1, 1, 1,
-0.3205105, 0.476179, -0.8666113, 1, 1, 1, 1, 1,
-0.3197315, 0.8395197, -1.533218, 1, 1, 1, 1, 1,
-0.3178381, -0.813239, -3.637767, 1, 1, 1, 1, 1,
-0.3150158, 0.2118108, -1.376777, 1, 1, 1, 1, 1,
-0.3140996, -0.7659518, -2.896858, 1, 1, 1, 1, 1,
-0.3139286, -0.2856592, -2.60041, 1, 1, 1, 1, 1,
-0.3097527, -0.7903842, -4.062773, 1, 1, 1, 1, 1,
-0.306954, -1.491834, -2.292932, 1, 1, 1, 1, 1,
-0.3041361, -1.28506, -3.936808, 0, 0, 1, 1, 1,
-0.3036004, -1.10444, -3.280885, 1, 0, 0, 1, 1,
-0.3032652, 2.808706, -1.850428, 1, 0, 0, 1, 1,
-0.3015709, 0.9400783, -1.201886, 1, 0, 0, 1, 1,
-0.3009724, -0.1367696, -2.131089, 1, 0, 0, 1, 1,
-0.2998964, -1.170926, -3.357114, 1, 0, 0, 1, 1,
-0.2996599, 0.1412019, -2.402273, 0, 0, 0, 1, 1,
-0.2972155, 1.524466, -0.3769603, 0, 0, 0, 1, 1,
-0.2944985, -0.2581439, -2.866405, 0, 0, 0, 1, 1,
-0.2909236, 1.151611, -1.790446, 0, 0, 0, 1, 1,
-0.2844096, 0.05523513, -0.87005, 0, 0, 0, 1, 1,
-0.2745928, -0.3489883, -4.41126, 0, 0, 0, 1, 1,
-0.2737579, 0.189056, -0.8007631, 0, 0, 0, 1, 1,
-0.2675544, -0.2574648, -1.344408, 1, 1, 1, 1, 1,
-0.2674091, -1.140166, -4.29003, 1, 1, 1, 1, 1,
-0.2664711, 0.9999135, -0.7105947, 1, 1, 1, 1, 1,
-0.2643585, -0.9191034, -2.95309, 1, 1, 1, 1, 1,
-0.2637087, 1.90586, -1.536221, 1, 1, 1, 1, 1,
-0.2636576, -0.2623188, -2.442531, 1, 1, 1, 1, 1,
-0.2634305, -1.247176, -2.814682, 1, 1, 1, 1, 1,
-0.2628059, -0.3858421, -0.7004698, 1, 1, 1, 1, 1,
-0.2610545, 1.43833, -0.8461839, 1, 1, 1, 1, 1,
-0.2580549, -1.016797, -0.9788185, 1, 1, 1, 1, 1,
-0.2570191, -0.2964923, -2.527333, 1, 1, 1, 1, 1,
-0.2512987, -0.4679498, -2.234331, 1, 1, 1, 1, 1,
-0.2421937, -0.08660027, -2.266865, 1, 1, 1, 1, 1,
-0.237267, 1.464283, -1.624497, 1, 1, 1, 1, 1,
-0.2366928, 1.051233, -0.5665604, 1, 1, 1, 1, 1,
-0.2360258, 2.084286, 1.756816, 0, 0, 1, 1, 1,
-0.2349961, -1.259972, -3.39442, 1, 0, 0, 1, 1,
-0.234939, -1.573156, -3.120734, 1, 0, 0, 1, 1,
-0.2334127, 0.3860456, -1.812812, 1, 0, 0, 1, 1,
-0.2286531, 1.162953, -2.538646, 1, 0, 0, 1, 1,
-0.2276836, -1.096448, -3.57475, 1, 0, 0, 1, 1,
-0.2233162, -0.476311, -2.620145, 0, 0, 0, 1, 1,
-0.2180409, -0.4774866, -3.793569, 0, 0, 0, 1, 1,
-0.2155474, -0.5208018, -5.208969, 0, 0, 0, 1, 1,
-0.2154724, 1.844293, 0.5788084, 0, 0, 0, 1, 1,
-0.2138524, -0.880144, -3.001184, 0, 0, 0, 1, 1,
-0.2104062, -1.747378, -2.910757, 0, 0, 0, 1, 1,
-0.2083032, 0.6833952, -1.938414, 0, 0, 0, 1, 1,
-0.2030673, 0.2922444, -0.7677323, 1, 1, 1, 1, 1,
-0.2003166, -1.122258, -2.332409, 1, 1, 1, 1, 1,
-0.1957015, 0.5456492, 0.9529613, 1, 1, 1, 1, 1,
-0.1906175, 1.000323, -0.2033608, 1, 1, 1, 1, 1,
-0.1891495, -1.013553, -3.424293, 1, 1, 1, 1, 1,
-0.1850581, -0.5237181, -2.713508, 1, 1, 1, 1, 1,
-0.1835505, -1.300637, -1.312985, 1, 1, 1, 1, 1,
-0.1831786, 0.8506417, 0.5424931, 1, 1, 1, 1, 1,
-0.1804951, -1.125088, -0.8652719, 1, 1, 1, 1, 1,
-0.1782525, -1.584331, -2.271587, 1, 1, 1, 1, 1,
-0.1766974, -0.004370672, 0.4128942, 1, 1, 1, 1, 1,
-0.1751146, 0.08828352, -2.676788, 1, 1, 1, 1, 1,
-0.1723091, -0.7348061, -3.292886, 1, 1, 1, 1, 1,
-0.1720563, 0.2504017, -1.428399, 1, 1, 1, 1, 1,
-0.1717742, -1.69615, -3.507949, 1, 1, 1, 1, 1,
-0.1709406, 0.709794, -0.3397822, 0, 0, 1, 1, 1,
-0.1660019, 0.07031018, 0.7054691, 1, 0, 0, 1, 1,
-0.1619679, -0.4061079, -3.444231, 1, 0, 0, 1, 1,
-0.1528536, -0.6551943, -2.013181, 1, 0, 0, 1, 1,
-0.1505597, 0.1296142, -0.2661882, 1, 0, 0, 1, 1,
-0.1495971, -1.219481, -1.724674, 1, 0, 0, 1, 1,
-0.1478502, 0.5318905, -0.6380986, 0, 0, 0, 1, 1,
-0.14657, -1.124293, -5.131892, 0, 0, 0, 1, 1,
-0.1404679, -0.8441595, -3.311217, 0, 0, 0, 1, 1,
-0.1398648, -0.5402923, -4.012599, 0, 0, 0, 1, 1,
-0.1348322, 0.3580209, -0.3685384, 0, 0, 0, 1, 1,
-0.134206, -1.360301, -3.326775, 0, 0, 0, 1, 1,
-0.13315, -2.190151, -2.534171, 0, 0, 0, 1, 1,
-0.1297838, 0.05947063, -1.503776, 1, 1, 1, 1, 1,
-0.1267896, -0.7200937, -2.070295, 1, 1, 1, 1, 1,
-0.125524, -0.04896858, -0.7527713, 1, 1, 1, 1, 1,
-0.1216107, -1.161552, -1.741427, 1, 1, 1, 1, 1,
-0.1215589, 0.0305067, 0.1484767, 1, 1, 1, 1, 1,
-0.1200008, 0.1895286, -0.05856887, 1, 1, 1, 1, 1,
-0.1197034, -1.115612, -3.120986, 1, 1, 1, 1, 1,
-0.117541, -1.010251, -3.541476, 1, 1, 1, 1, 1,
-0.1134316, -0.9249923, -2.872492, 1, 1, 1, 1, 1,
-0.09982175, 0.808682, 0.6155178, 1, 1, 1, 1, 1,
-0.09608522, 0.5325221, -0.1756069, 1, 1, 1, 1, 1,
-0.09119037, 0.9317763, 0.5018866, 1, 1, 1, 1, 1,
-0.08588484, -0.4035304, -4.290458, 1, 1, 1, 1, 1,
-0.08053419, -1.283619, -3.795451, 1, 1, 1, 1, 1,
-0.07159388, 0.1264302, -1.095741, 1, 1, 1, 1, 1,
-0.07158502, 0.3301878, -0.798694, 0, 0, 1, 1, 1,
-0.0711408, -1.821012, -3.664939, 1, 0, 0, 1, 1,
-0.06814157, -2.042932, -3.983425, 1, 0, 0, 1, 1,
-0.06544564, -0.8817862, -1.98461, 1, 0, 0, 1, 1,
-0.06373776, 0.8968868, 0.444079, 1, 0, 0, 1, 1,
-0.06286854, -0.04351874, -2.132611, 1, 0, 0, 1, 1,
-0.05875947, 1.983861, 0.6081843, 0, 0, 0, 1, 1,
-0.05552842, -0.01671854, -3.219967, 0, 0, 0, 1, 1,
-0.05163986, -0.3672236, -4.077462, 0, 0, 0, 1, 1,
-0.05034393, 1.063478, -0.9863154, 0, 0, 0, 1, 1,
-0.04906975, 0.9089996, 0.2156314, 0, 0, 0, 1, 1,
-0.04559482, -0.3345099, -3.938509, 0, 0, 0, 1, 1,
-0.04302533, -0.7066216, -4.55081, 0, 0, 0, 1, 1,
-0.04070874, -2.505057, -1.141552, 1, 1, 1, 1, 1,
-0.03971625, 0.1737325, 0.4024366, 1, 1, 1, 1, 1,
-0.03747483, -1.340343, -2.534226, 1, 1, 1, 1, 1,
-0.03399201, 0.8079425, 0.2282731, 1, 1, 1, 1, 1,
-0.02972563, 0.7507105, -0.9412031, 1, 1, 1, 1, 1,
-0.02884764, 0.7747112, 0.2549951, 1, 1, 1, 1, 1,
-0.02714474, 1.456763, -0.8939758, 1, 1, 1, 1, 1,
-0.02155164, 0.6143087, 1.319767, 1, 1, 1, 1, 1,
-0.01413362, 0.6445789, -1.054101, 1, 1, 1, 1, 1,
-0.01322114, -0.5476318, -3.171844, 1, 1, 1, 1, 1,
-0.0123115, -0.2845636, 0.2956958, 1, 1, 1, 1, 1,
-0.01129597, 1.27327, 1.340699, 1, 1, 1, 1, 1,
-0.008355924, -0.7005315, -2.876327, 1, 1, 1, 1, 1,
-0.00820601, 0.1698671, -1.325104, 1, 1, 1, 1, 1,
-0.0006709649, -0.0089259, -2.50902, 1, 1, 1, 1, 1,
0.004809635, 1.036211, 0.1365468, 0, 0, 1, 1, 1,
0.005122689, -0.3946697, 1.964558, 1, 0, 0, 1, 1,
0.006519085, 1.564711, 0.3998566, 1, 0, 0, 1, 1,
0.007034395, 0.8812966, 0.9659763, 1, 0, 0, 1, 1,
0.009223714, 0.8837466, 0.8041867, 1, 0, 0, 1, 1,
0.009934182, 0.2521289, -0.3594466, 1, 0, 0, 1, 1,
0.01054808, -1.253409, 1.500298, 0, 0, 0, 1, 1,
0.01199132, 0.2232513, 0.9406455, 0, 0, 0, 1, 1,
0.01202145, 0.4096482, 0.9481495, 0, 0, 0, 1, 1,
0.01426451, -0.2759138, 2.263037, 0, 0, 0, 1, 1,
0.02288856, 0.9667011, 1.785324, 0, 0, 0, 1, 1,
0.0253329, -0.2601653, 3.83558, 0, 0, 0, 1, 1,
0.02623371, -0.3917824, 3.144098, 0, 0, 0, 1, 1,
0.02714287, 1.299363, -0.6628401, 1, 1, 1, 1, 1,
0.03564458, -0.7176472, 0.8593166, 1, 1, 1, 1, 1,
0.03874375, 0.5505006, 0.6601281, 1, 1, 1, 1, 1,
0.03878828, -2.196861, 2.080108, 1, 1, 1, 1, 1,
0.03898078, -0.1715046, 0.8267975, 1, 1, 1, 1, 1,
0.0393438, 0.3155681, -0.06461893, 1, 1, 1, 1, 1,
0.04102238, -0.3811245, 4.1641, 1, 1, 1, 1, 1,
0.04160832, -0.8075829, 2.655976, 1, 1, 1, 1, 1,
0.04811051, -0.9245322, 3.933299, 1, 1, 1, 1, 1,
0.04843587, -1.447737, 3.771621, 1, 1, 1, 1, 1,
0.04912111, -1.102694, 4.101548, 1, 1, 1, 1, 1,
0.05217654, 1.017671, -0.9416155, 1, 1, 1, 1, 1,
0.05275688, -0.3643201, 3.494564, 1, 1, 1, 1, 1,
0.05919958, -1.237143, 3.783851, 1, 1, 1, 1, 1,
0.06251154, 2.003959, -0.438147, 1, 1, 1, 1, 1,
0.07047084, -0.0309269, 2.430177, 0, 0, 1, 1, 1,
0.07397097, -0.2765148, 3.669959, 1, 0, 0, 1, 1,
0.07568076, -0.788044, 3.270365, 1, 0, 0, 1, 1,
0.07675467, -0.8767498, 3.16589, 1, 0, 0, 1, 1,
0.08358005, -0.5582778, 3.483382, 1, 0, 0, 1, 1,
0.08740351, -0.2098075, 3.441561, 1, 0, 0, 1, 1,
0.0888977, 0.3563465, 0.322886, 0, 0, 0, 1, 1,
0.09394457, 0.07439586, 0.682253, 0, 0, 0, 1, 1,
0.09469637, -0.6497067, 2.647981, 0, 0, 0, 1, 1,
0.09811619, -2.859173, 1.933652, 0, 0, 0, 1, 1,
0.09919427, 0.4758056, 0.7327385, 0, 0, 0, 1, 1,
0.09995619, -0.4282264, 2.41332, 0, 0, 0, 1, 1,
0.1029568, 0.6387127, -0.8091009, 0, 0, 0, 1, 1,
0.1036985, -1.644586, 3.835466, 1, 1, 1, 1, 1,
0.1053468, 0.4302709, -0.06589445, 1, 1, 1, 1, 1,
0.1070258, -1.239516, 1.73548, 1, 1, 1, 1, 1,
0.1110549, -0.8149107, 3.808365, 1, 1, 1, 1, 1,
0.1136357, 0.5348409, -1.267425, 1, 1, 1, 1, 1,
0.1148199, 1.182683, -1.513635, 1, 1, 1, 1, 1,
0.1158696, -1.373951, 3.7753, 1, 1, 1, 1, 1,
0.1175834, 1.106264, 0.2628064, 1, 1, 1, 1, 1,
0.1229291, -0.8761466, 2.02236, 1, 1, 1, 1, 1,
0.1232444, -1.087602, 2.474677, 1, 1, 1, 1, 1,
0.1244888, 1.648938, -1.617776, 1, 1, 1, 1, 1,
0.1262104, -1.160425, 4.081892, 1, 1, 1, 1, 1,
0.1298984, 1.438739, -2.091775, 1, 1, 1, 1, 1,
0.130992, 1.398952, 0.9724219, 1, 1, 1, 1, 1,
0.1312299, -0.595612, 2.155386, 1, 1, 1, 1, 1,
0.1326159, -0.8908932, 2.856069, 0, 0, 1, 1, 1,
0.1367146, -0.8909315, 3.280244, 1, 0, 0, 1, 1,
0.1394648, 0.5246226, 1.502803, 1, 0, 0, 1, 1,
0.1410817, 0.9604445, -1.217781, 1, 0, 0, 1, 1,
0.1451798, 0.6367638, -0.5753083, 1, 0, 0, 1, 1,
0.1470021, 0.2848692, 0.9251845, 1, 0, 0, 1, 1,
0.1474397, 1.962845, 1.159229, 0, 0, 0, 1, 1,
0.1485781, 0.1000533, 0.7384778, 0, 0, 0, 1, 1,
0.1506168, -1.125184, 3.07002, 0, 0, 0, 1, 1,
0.1506817, -0.3480181, 2.083261, 0, 0, 0, 1, 1,
0.1527453, 0.02778733, 1.552688, 0, 0, 0, 1, 1,
0.1542098, -0.08109246, 2.212498, 0, 0, 0, 1, 1,
0.1552112, 0.8183221, 0.2102275, 0, 0, 0, 1, 1,
0.1602881, 1.624326, -1.142231, 1, 1, 1, 1, 1,
0.1608423, -1.189986, 3.612702, 1, 1, 1, 1, 1,
0.163896, 1.699288, 0.204907, 1, 1, 1, 1, 1,
0.1686598, 1.39185, 2.435946, 1, 1, 1, 1, 1,
0.1695772, -1.470082, 3.547871, 1, 1, 1, 1, 1,
0.1742059, -0.6675295, 3.395258, 1, 1, 1, 1, 1,
0.1802627, 0.07053299, 2.005934, 1, 1, 1, 1, 1,
0.1805933, -0.267265, 2.36884, 1, 1, 1, 1, 1,
0.1847558, -0.8503604, 2.878311, 1, 1, 1, 1, 1,
0.1870545, 0.6054816, 2.073172, 1, 1, 1, 1, 1,
0.1887167, -0.4785132, 2.40623, 1, 1, 1, 1, 1,
0.1920406, 0.1362392, 1.165183, 1, 1, 1, 1, 1,
0.1936321, 0.007498492, 1.832263, 1, 1, 1, 1, 1,
0.1978469, 0.5591845, -0.1547273, 1, 1, 1, 1, 1,
0.1984365, 0.9817532, -0.8002478, 1, 1, 1, 1, 1,
0.205922, 1.90751, 2.090577, 0, 0, 1, 1, 1,
0.2063891, -1.94135, 2.623434, 1, 0, 0, 1, 1,
0.209081, 1.699997, -0.6273413, 1, 0, 0, 1, 1,
0.2136653, -1.16273, 4.025923, 1, 0, 0, 1, 1,
0.2168933, -0.7539005, 1.954856, 1, 0, 0, 1, 1,
0.2181477, 1.806509, 0.6952862, 1, 0, 0, 1, 1,
0.2187172, -0.09880974, 2.465653, 0, 0, 0, 1, 1,
0.2221374, -1.299216, 2.817327, 0, 0, 0, 1, 1,
0.2323668, 0.3534941, -1.837547, 0, 0, 0, 1, 1,
0.2332976, -1.221696, 2.736639, 0, 0, 0, 1, 1,
0.2366342, -0.2030839, 2.034932, 0, 0, 0, 1, 1,
0.246383, 0.4198455, 1.647841, 0, 0, 0, 1, 1,
0.2470034, 0.02002088, 1.588206, 0, 0, 0, 1, 1,
0.2476996, -1.056635, 1.855891, 1, 1, 1, 1, 1,
0.248864, 1.50209, -1.292862, 1, 1, 1, 1, 1,
0.2590256, 0.2735308, -1.124916, 1, 1, 1, 1, 1,
0.2605318, -0.6937512, 2.992258, 1, 1, 1, 1, 1,
0.2640361, 0.4864347, 1.773851, 1, 1, 1, 1, 1,
0.2660147, -0.6001846, 2.866719, 1, 1, 1, 1, 1,
0.266179, -0.3213847, 1.249566, 1, 1, 1, 1, 1,
0.2708263, -1.319407, 3.611761, 1, 1, 1, 1, 1,
0.2736534, -2.165863, 3.886886, 1, 1, 1, 1, 1,
0.2739089, -1.328174, 3.976389, 1, 1, 1, 1, 1,
0.2774681, -0.4172584, 3.282427, 1, 1, 1, 1, 1,
0.2777704, -1.490043, 1.580708, 1, 1, 1, 1, 1,
0.2782294, 0.7649437, 1.887716, 1, 1, 1, 1, 1,
0.2824254, -1.734692, 1.969718, 1, 1, 1, 1, 1,
0.2837397, 1.15038, -0.09962405, 1, 1, 1, 1, 1,
0.2845098, -1.068387, 3.290381, 0, 0, 1, 1, 1,
0.284512, -0.4319665, 3.223704, 1, 0, 0, 1, 1,
0.2856493, -0.04545717, 2.511837, 1, 0, 0, 1, 1,
0.2887197, -0.1301932, 2.628883, 1, 0, 0, 1, 1,
0.2905197, 0.6413773, -0.5494981, 1, 0, 0, 1, 1,
0.2925239, -2.162323, 3.60135, 1, 0, 0, 1, 1,
0.2925881, 0.004284391, 1.907511, 0, 0, 0, 1, 1,
0.2929289, -0.9961147, 3.442813, 0, 0, 0, 1, 1,
0.2957775, 0.3604689, 0.1891184, 0, 0, 0, 1, 1,
0.2978487, -0.1067594, 2.310414, 0, 0, 0, 1, 1,
0.2979873, 0.3119809, -0.6939988, 0, 0, 0, 1, 1,
0.2987319, 0.8855466, 0.0770139, 0, 0, 0, 1, 1,
0.298964, 0.2631849, 0.6395508, 0, 0, 0, 1, 1,
0.3007892, -2.155392, 3.652722, 1, 1, 1, 1, 1,
0.301022, -0.5516557, 2.262138, 1, 1, 1, 1, 1,
0.3034115, -0.2645648, 1.902555, 1, 1, 1, 1, 1,
0.3044232, 1.975127, 1.644722, 1, 1, 1, 1, 1,
0.3049226, -0.2010079, 2.443924, 1, 1, 1, 1, 1,
0.3067282, 1.17585, 0.7080456, 1, 1, 1, 1, 1,
0.3095832, 0.8410233, 0.3052102, 1, 1, 1, 1, 1,
0.3122865, 1.078211, -0.6012988, 1, 1, 1, 1, 1,
0.3168628, 0.6213384, 1.170135, 1, 1, 1, 1, 1,
0.3171342, 1.77306, -0.3671932, 1, 1, 1, 1, 1,
0.3181688, 0.3411218, 0.2935815, 1, 1, 1, 1, 1,
0.3225641, -1.778275, 3.882612, 1, 1, 1, 1, 1,
0.3233362, 0.1451646, 2.306716, 1, 1, 1, 1, 1,
0.3300703, -0.4905412, 2.028722, 1, 1, 1, 1, 1,
0.3313715, 0.7803822, 1.172462, 1, 1, 1, 1, 1,
0.332138, 0.6700938, 0.5919651, 0, 0, 1, 1, 1,
0.3345764, -0.4641623, 2.684534, 1, 0, 0, 1, 1,
0.3403765, -0.5402602, 3.960354, 1, 0, 0, 1, 1,
0.3431145, 0.06037064, 1.191194, 1, 0, 0, 1, 1,
0.343604, 0.4437685, 0.7581118, 1, 0, 0, 1, 1,
0.3451288, 0.4184225, 1.469462, 1, 0, 0, 1, 1,
0.3483639, -1.091238, 3.067276, 0, 0, 0, 1, 1,
0.3502524, -1.377773, 2.90965, 0, 0, 0, 1, 1,
0.3518228, -1.409754, 2.300575, 0, 0, 0, 1, 1,
0.3580396, -2.023041, 3.894459, 0, 0, 0, 1, 1,
0.3604164, -0.7712307, 3.612594, 0, 0, 0, 1, 1,
0.3638731, 0.5994751, 1.80355, 0, 0, 0, 1, 1,
0.3647732, -0.8398874, 2.422688, 0, 0, 0, 1, 1,
0.3648247, -0.09834267, 0.4006491, 1, 1, 1, 1, 1,
0.3655304, -1.835899, 3.556697, 1, 1, 1, 1, 1,
0.3672245, -1.547662, 2.718851, 1, 1, 1, 1, 1,
0.3694907, 2.169168, 0.004731494, 1, 1, 1, 1, 1,
0.370821, -0.1971244, 1.445742, 1, 1, 1, 1, 1,
0.372301, -1.460985, 2.192837, 1, 1, 1, 1, 1,
0.3744629, 1.070529, -1.110642, 1, 1, 1, 1, 1,
0.3757008, 0.9229401, 2.170717, 1, 1, 1, 1, 1,
0.3765121, 0.9059001, -0.2437949, 1, 1, 1, 1, 1,
0.3768464, -0.0162676, 2.616166, 1, 1, 1, 1, 1,
0.3796274, -1.235569, 4.999491, 1, 1, 1, 1, 1,
0.3830908, 0.1127874, 2.207029, 1, 1, 1, 1, 1,
0.3834005, 1.737584, -1.576864, 1, 1, 1, 1, 1,
0.3882059, -0.3205505, 2.079914, 1, 1, 1, 1, 1,
0.388227, 1.022907, 1.256035, 1, 1, 1, 1, 1,
0.3882815, 1.985411, 0.1595792, 0, 0, 1, 1, 1,
0.3923566, 0.4271759, -0.6097983, 1, 0, 0, 1, 1,
0.3933784, -0.8774636, 1.509653, 1, 0, 0, 1, 1,
0.3986719, 0.9006839, 0.4158907, 1, 0, 0, 1, 1,
0.4025567, -0.3395237, 2.384942, 1, 0, 0, 1, 1,
0.4093368, 1.509954, 0.894486, 1, 0, 0, 1, 1,
0.4196165, 0.4233402, 0.2515695, 0, 0, 0, 1, 1,
0.4210218, 1.1788, 0.4529647, 0, 0, 0, 1, 1,
0.4270017, 0.09074172, 2.10702, 0, 0, 0, 1, 1,
0.429089, -1.440682, 3.573882, 0, 0, 0, 1, 1,
0.4328011, -0.9588045, 2.488648, 0, 0, 0, 1, 1,
0.433059, -0.7638237, 3.09715, 0, 0, 0, 1, 1,
0.4337642, 0.7179635, 0.2438229, 0, 0, 0, 1, 1,
0.4347183, -0.1855556, 1.240012, 1, 1, 1, 1, 1,
0.4418517, -0.05425679, 0.102036, 1, 1, 1, 1, 1,
0.4463375, 0.4867704, -0.7319582, 1, 1, 1, 1, 1,
0.4480861, 1.306767, 0.1590648, 1, 1, 1, 1, 1,
0.4487558, -0.5041814, 0.9578421, 1, 1, 1, 1, 1,
0.4503171, 0.3427722, 2.412672, 1, 1, 1, 1, 1,
0.4522731, -0.4076245, 3.699483, 1, 1, 1, 1, 1,
0.4540895, 0.8538572, 0.09092475, 1, 1, 1, 1, 1,
0.4640831, -0.1334408, 2.849151, 1, 1, 1, 1, 1,
0.4680709, -0.8093145, 2.422489, 1, 1, 1, 1, 1,
0.4682343, -0.7070251, 2.517297, 1, 1, 1, 1, 1,
0.4687495, 1.072696, -1.094052, 1, 1, 1, 1, 1,
0.475449, -0.03676766, 3.261809, 1, 1, 1, 1, 1,
0.475729, 0.2025587, 2.321559, 1, 1, 1, 1, 1,
0.4774241, -0.4121688, 1.984708, 1, 1, 1, 1, 1,
0.478093, 1.086267, -0.687507, 0, 0, 1, 1, 1,
0.4785175, 1.454617, -0.9758635, 1, 0, 0, 1, 1,
0.4810968, 0.285388, 0.2604548, 1, 0, 0, 1, 1,
0.4828264, -0.4843438, 2.817476, 1, 0, 0, 1, 1,
0.4877955, -0.01010299, 1.088173, 1, 0, 0, 1, 1,
0.4914446, -0.1192771, 2.646665, 1, 0, 0, 1, 1,
0.4921609, -0.5724619, 1.490065, 0, 0, 0, 1, 1,
0.4977591, 0.4593702, -1.010983, 0, 0, 0, 1, 1,
0.4996271, -0.4703798, 2.014656, 0, 0, 0, 1, 1,
0.5086505, -1.116703, 2.953482, 0, 0, 0, 1, 1,
0.5129438, 0.2354902, 1.857689, 0, 0, 0, 1, 1,
0.5158099, 0.2720379, 1.030835, 0, 0, 0, 1, 1,
0.5183575, 1.432593, 0.1314428, 0, 0, 0, 1, 1,
0.5200922, 1.296795, 0.8821763, 1, 1, 1, 1, 1,
0.5258483, 2.009611, 1.031349, 1, 1, 1, 1, 1,
0.533178, 0.4235791, 0.05526371, 1, 1, 1, 1, 1,
0.5384211, -0.245782, 0.2834041, 1, 1, 1, 1, 1,
0.5391716, -0.6564638, 2.729606, 1, 1, 1, 1, 1,
0.5467134, 2.228888, 0.9238685, 1, 1, 1, 1, 1,
0.5508476, -0.3472927, 1.971106, 1, 1, 1, 1, 1,
0.5531944, -1.101812, 1.904061, 1, 1, 1, 1, 1,
0.5549443, 0.7811941, 0.9159184, 1, 1, 1, 1, 1,
0.5554255, 1.11596, 0.7561256, 1, 1, 1, 1, 1,
0.5587305, -0.2528565, 2.646428, 1, 1, 1, 1, 1,
0.5628441, 1.944538, -0.2386719, 1, 1, 1, 1, 1,
0.5655189, 1.055298, 0.6814759, 1, 1, 1, 1, 1,
0.5655783, -1.60515, 3.001974, 1, 1, 1, 1, 1,
0.5664157, -0.5224692, 2.571449, 1, 1, 1, 1, 1,
0.5813805, 0.3866811, -0.4468935, 0, 0, 1, 1, 1,
0.5823659, 0.8027217, -0.8043267, 1, 0, 0, 1, 1,
0.5845656, 0.8668567, 2.044358, 1, 0, 0, 1, 1,
0.5846681, -0.2533891, 2.965484, 1, 0, 0, 1, 1,
0.5874158, 2.338667, -0.5509483, 1, 0, 0, 1, 1,
0.5895661, -0.7239594, 4.007505, 1, 0, 0, 1, 1,
0.5958993, 0.9914237, 0.5654152, 0, 0, 0, 1, 1,
0.596166, -0.8569627, 4.254069, 0, 0, 0, 1, 1,
0.5966497, -1.40016, 0.7032025, 0, 0, 0, 1, 1,
0.5976316, 0.02687175, 2.904527, 0, 0, 0, 1, 1,
0.6034353, -1.299833, 3.392499, 0, 0, 0, 1, 1,
0.6034959, -0.1797677, 0.8291159, 0, 0, 0, 1, 1,
0.6053368, -0.851343, 2.704129, 0, 0, 0, 1, 1,
0.6103908, -0.7699119, 0.4703843, 1, 1, 1, 1, 1,
0.6105167, -1.02669, 1.586679, 1, 1, 1, 1, 1,
0.6113305, -0.3013238, 2.885577, 1, 1, 1, 1, 1,
0.6132462, -0.2589499, 2.616923, 1, 1, 1, 1, 1,
0.6158569, 0.7038324, 1.524756, 1, 1, 1, 1, 1,
0.6160682, -0.06068145, 2.484912, 1, 1, 1, 1, 1,
0.6209989, -1.360318, 4.473885, 1, 1, 1, 1, 1,
0.6222146, 0.824551, -0.9210224, 1, 1, 1, 1, 1,
0.6275941, -1.006353, 3.179446, 1, 1, 1, 1, 1,
0.629338, -0.1840728, 2.780571, 1, 1, 1, 1, 1,
0.6356281, 1.81623, 2.425963, 1, 1, 1, 1, 1,
0.6407816, -0.4750808, 1.147619, 1, 1, 1, 1, 1,
0.6420502, -0.7716243, 3.836429, 1, 1, 1, 1, 1,
0.6437614, -0.3439058, 3.457069, 1, 1, 1, 1, 1,
0.6475169, 0.06778395, 1.003153, 1, 1, 1, 1, 1,
0.657643, -2.193446, 2.665142, 0, 0, 1, 1, 1,
0.6590316, 1.365758, 3.218569, 1, 0, 0, 1, 1,
0.6608584, -1.341841, 4.604349, 1, 0, 0, 1, 1,
0.6676278, -1.317673, 4.449144, 1, 0, 0, 1, 1,
0.6685029, -0.07589086, 1.364251, 1, 0, 0, 1, 1,
0.6700027, -0.8257624, 3.155129, 1, 0, 0, 1, 1,
0.6746638, -1.45151, 1.695101, 0, 0, 0, 1, 1,
0.6779561, 0.352764, 0.9099417, 0, 0, 0, 1, 1,
0.6809754, -0.9382768, 1.194484, 0, 0, 0, 1, 1,
0.6819423, 1.495792, -0.5131384, 0, 0, 0, 1, 1,
0.6854497, 0.2727863, 2.602056, 0, 0, 0, 1, 1,
0.6881985, 0.4554834, 1.466935, 0, 0, 0, 1, 1,
0.6958458, 0.07118629, 0.8318219, 0, 0, 0, 1, 1,
0.7017491, -0.1750572, 2.144745, 1, 1, 1, 1, 1,
0.7024356, -1.416726, 2.614041, 1, 1, 1, 1, 1,
0.7050728, 1.096177, 1.483072, 1, 1, 1, 1, 1,
0.7061933, 0.7317646, 0.5810657, 1, 1, 1, 1, 1,
0.7128393, 0.9355193, 1.139523, 1, 1, 1, 1, 1,
0.7128792, -0.3460566, 2.186223, 1, 1, 1, 1, 1,
0.7191752, -2.243914, 1.780388, 1, 1, 1, 1, 1,
0.7201959, -1.283803, 2.419121, 1, 1, 1, 1, 1,
0.7231073, -2.057483, 1.92334, 1, 1, 1, 1, 1,
0.7274721, -0.6586266, 0.9878593, 1, 1, 1, 1, 1,
0.7285116, 1.299286, -0.2148313, 1, 1, 1, 1, 1,
0.7324555, 0.1477236, 1.764259, 1, 1, 1, 1, 1,
0.7376071, 0.9365907, 1.833448, 1, 1, 1, 1, 1,
0.7415913, -1.812598, 1.955475, 1, 1, 1, 1, 1,
0.7429442, -0.01846015, 2.857913, 1, 1, 1, 1, 1,
0.7443508, 1.668066, 0.9054983, 0, 0, 1, 1, 1,
0.7464405, 0.3031622, 0.1070294, 1, 0, 0, 1, 1,
0.7466328, 1.49451, -0.8832461, 1, 0, 0, 1, 1,
0.7495798, 0.1540929, 2.73773, 1, 0, 0, 1, 1,
0.7504432, -0.3519664, 1.935938, 1, 0, 0, 1, 1,
0.7534474, -0.0500848, 0.6148776, 1, 0, 0, 1, 1,
0.7539333, 0.3327604, -0.2919143, 0, 0, 0, 1, 1,
0.7603692, -1.024219, 0.9084674, 0, 0, 0, 1, 1,
0.7609981, -0.3986424, 1.050365, 0, 0, 0, 1, 1,
0.7614068, -0.715993, 2.574813, 0, 0, 0, 1, 1,
0.7641886, 0.8800961, 0.1693605, 0, 0, 0, 1, 1,
0.7679485, -1.233873, 3.575815, 0, 0, 0, 1, 1,
0.7687035, 0.3429057, 1.094445, 0, 0, 0, 1, 1,
0.7728568, -0.8010659, 2.633663, 1, 1, 1, 1, 1,
0.7730923, -0.02187908, 1.805177, 1, 1, 1, 1, 1,
0.7740415, -0.6423841, 1.579283, 1, 1, 1, 1, 1,
0.7801132, -1.894359, 1.571086, 1, 1, 1, 1, 1,
0.7824115, 1.513802, 0.4301958, 1, 1, 1, 1, 1,
0.7898464, 0.03933693, 1.970756, 1, 1, 1, 1, 1,
0.789943, 0.6728385, 0.9467844, 1, 1, 1, 1, 1,
0.7968479, -0.1785276, 1.226573, 1, 1, 1, 1, 1,
0.7990019, 0.5060228, 1.034429, 1, 1, 1, 1, 1,
0.8176088, 2.878085, -0.2227878, 1, 1, 1, 1, 1,
0.8214877, -0.3947147, 1.372919, 1, 1, 1, 1, 1,
0.8226549, 1.028323, -0.08628965, 1, 1, 1, 1, 1,
0.8255922, -0.2106696, 4.61901, 1, 1, 1, 1, 1,
0.826349, -0.3875585, 2.466919, 1, 1, 1, 1, 1,
0.8360068, -0.2765718, 3.404649, 1, 1, 1, 1, 1,
0.8430234, -1.155196, 1.061639, 0, 0, 1, 1, 1,
0.8550494, 1.840753, 0.9659567, 1, 0, 0, 1, 1,
0.8589464, -1.022712, 3.295977, 1, 0, 0, 1, 1,
0.8770085, 0.419739, 1.427313, 1, 0, 0, 1, 1,
0.8822829, 0.7802116, 2.605607, 1, 0, 0, 1, 1,
0.8860576, -0.2003821, 2.767312, 1, 0, 0, 1, 1,
0.8897896, -0.534726, 3.549211, 0, 0, 0, 1, 1,
0.8916313, 0.7224571, 0.1819424, 0, 0, 0, 1, 1,
0.8948902, -0.5760673, 4.058111, 0, 0, 0, 1, 1,
0.8968003, 1.174113, -0.0267248, 0, 0, 0, 1, 1,
0.9094526, -0.7598836, 1.752374, 0, 0, 0, 1, 1,
0.9124322, 0.8488339, 0.9483342, 0, 0, 0, 1, 1,
0.9126047, -0.4583285, 1.339697, 0, 0, 0, 1, 1,
0.9139797, 0.2336192, 1.836153, 1, 1, 1, 1, 1,
0.9139811, 1.550047, 0.4588141, 1, 1, 1, 1, 1,
0.9213908, -0.3595218, 1.608581, 1, 1, 1, 1, 1,
0.9288911, 1.716477, 1.602411, 1, 1, 1, 1, 1,
0.9420568, 0.5234227, -0.2672578, 1, 1, 1, 1, 1,
0.9425395, -2.419825, 0.8171235, 1, 1, 1, 1, 1,
0.9548638, 0.9035773, 1.45034, 1, 1, 1, 1, 1,
0.9567236, -1.138365, 1.38, 1, 1, 1, 1, 1,
0.9635659, 0.3078932, 0.4921103, 1, 1, 1, 1, 1,
0.9671451, 0.6678901, 1.436092, 1, 1, 1, 1, 1,
0.9703431, 0.4734035, 1.791471, 1, 1, 1, 1, 1,
0.9771231, -1.031687, 1.610349, 1, 1, 1, 1, 1,
0.9783154, -1.391548, 2.696164, 1, 1, 1, 1, 1,
0.9812385, 0.3603135, 3.291895, 1, 1, 1, 1, 1,
0.9871202, -0.1721097, 2.209306, 1, 1, 1, 1, 1,
0.9973845, -0.6764647, 0.9446454, 0, 0, 1, 1, 1,
0.9974817, -0.3400473, 1.849588, 1, 0, 0, 1, 1,
0.9982989, 0.07220984, 1.184483, 1, 0, 0, 1, 1,
1.00183, -0.5815331, 4.200685, 1, 0, 0, 1, 1,
1.003734, 0.02941838, 1.689051, 1, 0, 0, 1, 1,
1.011916, 0.986806, 1.523601, 1, 0, 0, 1, 1,
1.01258, 0.9159213, 0.794146, 0, 0, 0, 1, 1,
1.012698, 0.2632361, 1.877925, 0, 0, 0, 1, 1,
1.018596, -0.5380201, 3.81128, 0, 0, 0, 1, 1,
1.021564, 0.8007122, 1.359389, 0, 0, 0, 1, 1,
1.024599, 0.7233561, 0.2536148, 0, 0, 0, 1, 1,
1.039469, 2.259487, 0.683063, 0, 0, 0, 1, 1,
1.040369, 0.6858257, 1.095308, 0, 0, 0, 1, 1,
1.041949, -0.6881267, 3.127459, 1, 1, 1, 1, 1,
1.045178, 0.04678231, 0.3665388, 1, 1, 1, 1, 1,
1.053387, 0.2921442, 0.5774821, 1, 1, 1, 1, 1,
1.053912, 0.09352232, 0.9836882, 1, 1, 1, 1, 1,
1.054037, -0.8944089, 4.105555, 1, 1, 1, 1, 1,
1.056971, 0.3614652, 2.10467, 1, 1, 1, 1, 1,
1.064157, 0.009712814, 0.9001319, 1, 1, 1, 1, 1,
1.070186, -2.004375, 1.379869, 1, 1, 1, 1, 1,
1.077924, -2.081871, 3.970485, 1, 1, 1, 1, 1,
1.07873, -0.4046558, 1.790672, 1, 1, 1, 1, 1,
1.080149, -0.8713845, 2.708171, 1, 1, 1, 1, 1,
1.080354, -0.4432767, 1.980275, 1, 1, 1, 1, 1,
1.089887, 0.01154775, 2.383053, 1, 1, 1, 1, 1,
1.089907, 0.4988765, 3.086272, 1, 1, 1, 1, 1,
1.099117, -0.5990065, 2.281425, 1, 1, 1, 1, 1,
1.101964, -0.1183745, 2.374769, 0, 0, 1, 1, 1,
1.102343, -0.05878967, 1.436135, 1, 0, 0, 1, 1,
1.106808, 1.254447, 0.06343917, 1, 0, 0, 1, 1,
1.107594, -2.268423, 3.619643, 1, 0, 0, 1, 1,
1.119448, 1.650385, 0.07004432, 1, 0, 0, 1, 1,
1.121616, 0.7133566, 0.5493263, 1, 0, 0, 1, 1,
1.127568, -0.3969872, 2.18225, 0, 0, 0, 1, 1,
1.132811, 0.8457347, 1.865249, 0, 0, 0, 1, 1,
1.136347, 1.88461, 1.948612, 0, 0, 0, 1, 1,
1.136986, -0.1627558, 2.321511, 0, 0, 0, 1, 1,
1.139291, 0.06439364, 2.500501, 0, 0, 0, 1, 1,
1.141919, 0.1641527, 2.267307, 0, 0, 0, 1, 1,
1.142666, 0.1433672, 1.113509, 0, 0, 0, 1, 1,
1.144625, -0.6117689, 2.572775, 1, 1, 1, 1, 1,
1.146523, -1.468865, 0.6151691, 1, 1, 1, 1, 1,
1.148963, -0.641875, 2.483803, 1, 1, 1, 1, 1,
1.154692, 0.7958656, 1.698621, 1, 1, 1, 1, 1,
1.158153, -0.3188302, 0.9963764, 1, 1, 1, 1, 1,
1.162026, -0.8828726, 2.159348, 1, 1, 1, 1, 1,
1.162945, -0.4281127, 1.507257, 1, 1, 1, 1, 1,
1.176214, 0.3520625, 0.2997716, 1, 1, 1, 1, 1,
1.180082, -0.5755361, 2.87705, 1, 1, 1, 1, 1,
1.181603, -0.5741742, 3.150604, 1, 1, 1, 1, 1,
1.187187, 0.9130263, 1.932748, 1, 1, 1, 1, 1,
1.19094, 0.235117, 0.6772465, 1, 1, 1, 1, 1,
1.191552, -0.6679758, 0.8619128, 1, 1, 1, 1, 1,
1.19174, 0.3465446, 2.560925, 1, 1, 1, 1, 1,
1.198052, 0.2153521, 0.3637189, 1, 1, 1, 1, 1,
1.212843, -1.548865, 2.510636, 0, 0, 1, 1, 1,
1.216426, -0.1736174, 3.055174, 1, 0, 0, 1, 1,
1.218804, -1.203425, 1.67575, 1, 0, 0, 1, 1,
1.219261, -0.09265817, 2.491544, 1, 0, 0, 1, 1,
1.223108, 1.471929, 0.1885901, 1, 0, 0, 1, 1,
1.235613, -0.807507, 2.885445, 1, 0, 0, 1, 1,
1.237921, 0.7207029, -0.2971907, 0, 0, 0, 1, 1,
1.238833, -1.247929, 3.038923, 0, 0, 0, 1, 1,
1.253551, -0.36646, 2.557711, 0, 0, 0, 1, 1,
1.261117, -0.4547839, 1.596827, 0, 0, 0, 1, 1,
1.270224, -1.559408, 1.789899, 0, 0, 0, 1, 1,
1.279929, 0.7794908, 3.044216, 0, 0, 0, 1, 1,
1.28723, 0.4884083, 2.38098, 0, 0, 0, 1, 1,
1.290703, -1.543309, 3.166522, 1, 1, 1, 1, 1,
1.293397, 3.060453, 1.1164, 1, 1, 1, 1, 1,
1.293653, 0.3023065, -0.2865627, 1, 1, 1, 1, 1,
1.319808, 1.280772, 0.4740639, 1, 1, 1, 1, 1,
1.322435, 0.08300745, 1.080272, 1, 1, 1, 1, 1,
1.327085, -1.399938, 5.180561, 1, 1, 1, 1, 1,
1.327289, 0.5562843, 0.2849951, 1, 1, 1, 1, 1,
1.331717, -1.053744, 2.495738, 1, 1, 1, 1, 1,
1.335767, 1.270935, 0.4295319, 1, 1, 1, 1, 1,
1.339832, 0.3506476, 1.178048, 1, 1, 1, 1, 1,
1.340918, -0.8968474, 2.088185, 1, 1, 1, 1, 1,
1.367291, -0.7695538, 3.202962, 1, 1, 1, 1, 1,
1.368977, 1.217789, 2.792169, 1, 1, 1, 1, 1,
1.374094, 0.2439822, -0.7643695, 1, 1, 1, 1, 1,
1.374742, -1.451052, 4.331356, 1, 1, 1, 1, 1,
1.37636, -0.940361, 3.781055, 0, 0, 1, 1, 1,
1.389947, -1.377574, 1.847793, 1, 0, 0, 1, 1,
1.403516, -1.144381, 2.08997, 1, 0, 0, 1, 1,
1.406423, -1.448935, 1.109801, 1, 0, 0, 1, 1,
1.407071, -2.992414, 3.251344, 1, 0, 0, 1, 1,
1.412029, 0.6091279, 2.440968, 1, 0, 0, 1, 1,
1.412672, -0.3070732, 3.824631, 0, 0, 0, 1, 1,
1.413459, -0.02258093, 1.169045, 0, 0, 0, 1, 1,
1.415998, -0.2944252, 0.5268309, 0, 0, 0, 1, 1,
1.417111, 1.411917, -0.3996233, 0, 0, 0, 1, 1,
1.417276, -0.7717983, 2.570481, 0, 0, 0, 1, 1,
1.419299, 1.433124, -0.4618468, 0, 0, 0, 1, 1,
1.425124, 0.1902277, 1.771372, 0, 0, 0, 1, 1,
1.430858, 0.4345223, 0.6428017, 1, 1, 1, 1, 1,
1.445028, -0.7607573, 2.334707, 1, 1, 1, 1, 1,
1.448317, 0.5553392, 1.62568, 1, 1, 1, 1, 1,
1.452093, 0.02863479, 1.013818, 1, 1, 1, 1, 1,
1.482762, -0.2395586, 1.653045, 1, 1, 1, 1, 1,
1.486161, -1.979211, 3.232574, 1, 1, 1, 1, 1,
1.490298, 0.6813354, 0.7407354, 1, 1, 1, 1, 1,
1.495193, -0.4324736, 1.405546, 1, 1, 1, 1, 1,
1.495555, 0.227385, 1.600726, 1, 1, 1, 1, 1,
1.500678, 1.489987, -0.3920145, 1, 1, 1, 1, 1,
1.505582, 1.616628, 1.814066, 1, 1, 1, 1, 1,
1.507498, -0.8775317, 1.451601, 1, 1, 1, 1, 1,
1.512326, 0.2986824, 1.261942, 1, 1, 1, 1, 1,
1.516219, -2.744287, 2.185203, 1, 1, 1, 1, 1,
1.518155, 1.694506, 2.095318, 1, 1, 1, 1, 1,
1.52719, -0.8706722, 2.761234, 0, 0, 1, 1, 1,
1.528222, -0.6631894, 0.9323486, 1, 0, 0, 1, 1,
1.529745, 0.6970556, 1.05085, 1, 0, 0, 1, 1,
1.529838, -0.03836775, 2.617418, 1, 0, 0, 1, 1,
1.545505, -1.01495, 2.925367, 1, 0, 0, 1, 1,
1.548858, -0.8655967, 2.32086, 1, 0, 0, 1, 1,
1.558492, -0.2037586, 0.4050644, 0, 0, 0, 1, 1,
1.563037, 0.6162249, 0.6957371, 0, 0, 0, 1, 1,
1.570977, -0.4819122, 1.764374, 0, 0, 0, 1, 1,
1.572913, -0.001314978, 4.13998, 0, 0, 0, 1, 1,
1.579339, -1.266055, 2.908154, 0, 0, 0, 1, 1,
1.58785, 0.5975519, 2.006797, 0, 0, 0, 1, 1,
1.596596, 1.799219, 1.361843, 0, 0, 0, 1, 1,
1.613199, 0.3073627, 0.5642337, 1, 1, 1, 1, 1,
1.62222, -1.814381, 1.847012, 1, 1, 1, 1, 1,
1.630064, 1.282895, 2.391742, 1, 1, 1, 1, 1,
1.639111, -0.181161, 3.776111, 1, 1, 1, 1, 1,
1.640101, 0.9118853, 0.3296805, 1, 1, 1, 1, 1,
1.651565, -1.403268, 3.062248, 1, 1, 1, 1, 1,
1.656129, -2.066914, 2.849028, 1, 1, 1, 1, 1,
1.657556, -2.205721, 1.233212, 1, 1, 1, 1, 1,
1.660425, 2.151438, 0.1314869, 1, 1, 1, 1, 1,
1.664663, -1.33686, 2.396096, 1, 1, 1, 1, 1,
1.689464, 0.7022777, 0.8029537, 1, 1, 1, 1, 1,
1.702119, -1.715591, 3.546073, 1, 1, 1, 1, 1,
1.70796, -0.4294483, 2.809592, 1, 1, 1, 1, 1,
1.708528, 1.538926, 0.06943011, 1, 1, 1, 1, 1,
1.710201, -1.163959, 3.762263, 1, 1, 1, 1, 1,
1.711243, -1.837836, 2.241677, 0, 0, 1, 1, 1,
1.716985, 1.569232, 1.074255, 1, 0, 0, 1, 1,
1.725394, 0.5900559, 0.6978961, 1, 0, 0, 1, 1,
1.732756, -0.5211324, 2.520536, 1, 0, 0, 1, 1,
1.742587, -1.473845, 2.574862, 1, 0, 0, 1, 1,
1.745119, -0.5476402, 3.059153, 1, 0, 0, 1, 1,
1.746689, -0.1995633, 0.8801031, 0, 0, 0, 1, 1,
1.774607, 0.2745419, 1.832196, 0, 0, 0, 1, 1,
1.807101, -1.794302, 2.267276, 0, 0, 0, 1, 1,
1.825064, -1.267222, 2.473037, 0, 0, 0, 1, 1,
1.825491, -0.3680058, 1.394485, 0, 0, 0, 1, 1,
1.850731, 0.701885, 1.527682, 0, 0, 0, 1, 1,
1.851183, -0.9989915, 1.054574, 0, 0, 0, 1, 1,
1.852195, -0.9390159, 0.900008, 1, 1, 1, 1, 1,
1.870901, 0.5845534, 1.512629, 1, 1, 1, 1, 1,
1.925695, -1.185166, 2.954185, 1, 1, 1, 1, 1,
1.926651, 0.8921688, 1.494188, 1, 1, 1, 1, 1,
1.945407, 0.7239479, 1.213671, 1, 1, 1, 1, 1,
1.951174, 0.1770014, 0.3618192, 1, 1, 1, 1, 1,
1.95833, 0.03395711, 1.344766, 1, 1, 1, 1, 1,
1.982019, 1.047574, 1.740018, 1, 1, 1, 1, 1,
2.015939, 0.5517473, 1.325206, 1, 1, 1, 1, 1,
2.021262, -1.668347, 3.292179, 1, 1, 1, 1, 1,
2.022096, -1.754549, 1.398293, 1, 1, 1, 1, 1,
2.076978, 1.249497, 1.329872, 1, 1, 1, 1, 1,
2.107193, -0.6927018, 2.685477, 1, 1, 1, 1, 1,
2.111852, -0.8283229, 2.237931, 1, 1, 1, 1, 1,
2.120929, 0.1926169, 1.355637, 1, 1, 1, 1, 1,
2.140408, -0.862361, 2.873436, 0, 0, 1, 1, 1,
2.144039, 0.1562819, 1.802605, 1, 0, 0, 1, 1,
2.150541, 0.4190496, 1.821935, 1, 0, 0, 1, 1,
2.151551, 0.1119855, 1.486029, 1, 0, 0, 1, 1,
2.178873, 1.379434, 1.669912, 1, 0, 0, 1, 1,
2.179949, -0.06605336, 0.7135871, 1, 0, 0, 1, 1,
2.195813, 0.3379541, 1.789183, 0, 0, 0, 1, 1,
2.216016, 0.3624727, 2.127123, 0, 0, 0, 1, 1,
2.226318, 0.2823086, 1.620637, 0, 0, 0, 1, 1,
2.230312, 0.1210674, 0.7673446, 0, 0, 0, 1, 1,
2.246948, 1.756224, 2.947661, 0, 0, 0, 1, 1,
2.25328, 0.4617321, 1.6333, 0, 0, 0, 1, 1,
2.281165, 0.8434803, 1.912924, 0, 0, 0, 1, 1,
2.339998, -1.022411, 1.425664, 1, 1, 1, 1, 1,
2.364933, 0.504128, 1.480947, 1, 1, 1, 1, 1,
2.475449, 0.1409956, 2.333676, 1, 1, 1, 1, 1,
2.588191, 2.525358, 0.2510521, 1, 1, 1, 1, 1,
2.944952, 1.376896, 1.656406, 1, 1, 1, 1, 1,
3.151825, -1.076714, 1.53583, 1, 1, 1, 1, 1,
3.328932, -0.1128917, 2.528783, 1, 1, 1, 1, 1
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
var radius = 9.343295;
var distance = 32.81793;
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
mvMatrix.translate( -0.1385698, -0.03401983, 0.01420426 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.81793);
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