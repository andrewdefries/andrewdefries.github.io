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
-3.292811, 1.066989, -0.9832653, 1, 0, 0, 1,
-3.135406, -0.7201539, -2.128, 1, 0.007843138, 0, 1,
-2.942055, -0.6821605, -2.574962, 1, 0.01176471, 0, 1,
-2.724377, -1.66872, -2.096713, 1, 0.01960784, 0, 1,
-2.618785, 0.4391291, -1.159242, 1, 0.02352941, 0, 1,
-2.604576, 0.1555118, -2.392249, 1, 0.03137255, 0, 1,
-2.593715, 1.268254, -3.029492, 1, 0.03529412, 0, 1,
-2.570972, 0.02659811, -1.335958, 1, 0.04313726, 0, 1,
-2.441283, 0.02505076, -3.037455, 1, 0.04705882, 0, 1,
-2.437917, -1.083818, -1.383349, 1, 0.05490196, 0, 1,
-2.359893, -0.8763697, -1.515054, 1, 0.05882353, 0, 1,
-2.334085, 1.540878, -1.871885, 1, 0.06666667, 0, 1,
-2.320957, -1.445503, -0.9077833, 1, 0.07058824, 0, 1,
-2.309426, 0.2834253, -2.195414, 1, 0.07843138, 0, 1,
-2.271708, -0.5793097, -1.277965, 1, 0.08235294, 0, 1,
-2.259452, 0.9116249, -0.9284367, 1, 0.09019608, 0, 1,
-2.243897, 0.1254411, -1.858806, 1, 0.09411765, 0, 1,
-2.160052, -1.696316, -2.722377, 1, 0.1019608, 0, 1,
-2.063895, -1.723422, -2.786983, 1, 0.1098039, 0, 1,
-2.059049, -0.1090521, -0.731671, 1, 0.1137255, 0, 1,
-2.049584, 0.4617165, -1.558121, 1, 0.1215686, 0, 1,
-2.045889, -1.088017, -1.99896, 1, 0.1254902, 0, 1,
-2.035013, 0.7784683, -0.6957953, 1, 0.1333333, 0, 1,
-2.007961, -1.230165, -2.122514, 1, 0.1372549, 0, 1,
-1.986844, -1.50526, -2.458236, 1, 0.145098, 0, 1,
-1.939868, 0.216536, -1.17822, 1, 0.1490196, 0, 1,
-1.923982, -0.04365944, -0.1547171, 1, 0.1568628, 0, 1,
-1.917668, -0.2402572, -2.216787, 1, 0.1607843, 0, 1,
-1.913458, 0.1999854, -0.9925928, 1, 0.1686275, 0, 1,
-1.899366, -0.9987985, -1.300913, 1, 0.172549, 0, 1,
-1.894126, 0.05658909, -2.380566, 1, 0.1803922, 0, 1,
-1.830909, 0.1805607, -1.490703, 1, 0.1843137, 0, 1,
-1.826505, 0.533096, -1.40538, 1, 0.1921569, 0, 1,
-1.824568, -0.02940218, -1.429234, 1, 0.1960784, 0, 1,
-1.787901, -1.580618, -2.606792, 1, 0.2039216, 0, 1,
-1.78568, 0.6830497, 0.145909, 1, 0.2117647, 0, 1,
-1.723652, -0.3551899, -1.92697, 1, 0.2156863, 0, 1,
-1.723411, -0.2167089, -0.9420903, 1, 0.2235294, 0, 1,
-1.721389, -0.5270035, -1.886256, 1, 0.227451, 0, 1,
-1.719035, -0.6511456, -2.328247, 1, 0.2352941, 0, 1,
-1.710732, 0.5861407, -0.8276127, 1, 0.2392157, 0, 1,
-1.704605, -0.07671819, -1.868165, 1, 0.2470588, 0, 1,
-1.689661, -0.2227566, -1.745326, 1, 0.2509804, 0, 1,
-1.684717, -2.200172, -3.766393, 1, 0.2588235, 0, 1,
-1.663647, 0.3626905, -1.910306, 1, 0.2627451, 0, 1,
-1.656982, -1.198452, -2.150209, 1, 0.2705882, 0, 1,
-1.656154, -1.041719, -2.730155, 1, 0.2745098, 0, 1,
-1.634916, -1.13495, -3.252347, 1, 0.282353, 0, 1,
-1.632717, -2.187964, -0.4414175, 1, 0.2862745, 0, 1,
-1.618728, 0.6648567, -0.1215172, 1, 0.2941177, 0, 1,
-1.615045, 0.8142518, -0.2314815, 1, 0.3019608, 0, 1,
-1.601326, -1.957464, -2.799129, 1, 0.3058824, 0, 1,
-1.595976, 0.4626382, -0.8371689, 1, 0.3137255, 0, 1,
-1.592092, 0.09344411, 0.1203461, 1, 0.3176471, 0, 1,
-1.577923, -0.1238357, -0.4516779, 1, 0.3254902, 0, 1,
-1.568339, 0.2787096, -2.040292, 1, 0.3294118, 0, 1,
-1.555868, -0.3315475, -1.776333, 1, 0.3372549, 0, 1,
-1.555047, 0.7222322, 0.8320519, 1, 0.3411765, 0, 1,
-1.545642, 0.1004995, -2.047709, 1, 0.3490196, 0, 1,
-1.545492, -0.5499199, -3.401705, 1, 0.3529412, 0, 1,
-1.54296, 1.181499, -0.7049639, 1, 0.3607843, 0, 1,
-1.527815, 1.500605, -1.603767, 1, 0.3647059, 0, 1,
-1.521106, -0.2607791, -1.467519, 1, 0.372549, 0, 1,
-1.520324, 2.130824, -1.422254, 1, 0.3764706, 0, 1,
-1.50192, -0.8562309, -1.585459, 1, 0.3843137, 0, 1,
-1.498932, -0.09190782, -0.1834306, 1, 0.3882353, 0, 1,
-1.495071, -0.93269, -2.1847, 1, 0.3960784, 0, 1,
-1.493473, -0.1613666, -2.613796, 1, 0.4039216, 0, 1,
-1.485945, 0.3970006, -1.237034, 1, 0.4078431, 0, 1,
-1.468453, 0.7114918, -2.242383, 1, 0.4156863, 0, 1,
-1.463726, -0.4924827, -1.911043, 1, 0.4196078, 0, 1,
-1.462751, 0.6819751, -0.948982, 1, 0.427451, 0, 1,
-1.431334, 0.9801224, 0.1154764, 1, 0.4313726, 0, 1,
-1.42637, 0.7696925, 0.1354697, 1, 0.4392157, 0, 1,
-1.424006, -1.53682, -1.763502, 1, 0.4431373, 0, 1,
-1.422435, -0.2791975, -1.13534, 1, 0.4509804, 0, 1,
-1.40943, -0.2667361, -3.706235, 1, 0.454902, 0, 1,
-1.389637, 0.02665323, -0.09802146, 1, 0.4627451, 0, 1,
-1.384281, 0.7503974, -2.913497, 1, 0.4666667, 0, 1,
-1.375841, -1.170845, -1.018346, 1, 0.4745098, 0, 1,
-1.369817, 1.848862, 0.4354215, 1, 0.4784314, 0, 1,
-1.358699, -0.892242, -2.000633, 1, 0.4862745, 0, 1,
-1.340218, -0.8110278, -2.826763, 1, 0.4901961, 0, 1,
-1.336771, -1.303269, -2.714463, 1, 0.4980392, 0, 1,
-1.336183, -0.2368788, -1.457672, 1, 0.5058824, 0, 1,
-1.334812, -0.8021247, -2.140469, 1, 0.509804, 0, 1,
-1.33097, 1.633638, -1.60241, 1, 0.5176471, 0, 1,
-1.329132, 0.3806043, -1.569631, 1, 0.5215687, 0, 1,
-1.324154, 0.4385013, -0.9332698, 1, 0.5294118, 0, 1,
-1.32126, 0.1510784, -1.42964, 1, 0.5333334, 0, 1,
-1.320717, -1.282041, -2.026344, 1, 0.5411765, 0, 1,
-1.311237, -1.087909, -4.529092, 1, 0.5450981, 0, 1,
-1.305895, 1.279806, 0.2709714, 1, 0.5529412, 0, 1,
-1.304209, 0.4064333, -1.922683, 1, 0.5568628, 0, 1,
-1.28221, 1.326236, -1.749243, 1, 0.5647059, 0, 1,
-1.280558, -0.5174756, -2.168394, 1, 0.5686275, 0, 1,
-1.262165, 0.1077212, -2.018357, 1, 0.5764706, 0, 1,
-1.25925, -1.024995, -2.069733, 1, 0.5803922, 0, 1,
-1.256799, -0.74139, -3.727396, 1, 0.5882353, 0, 1,
-1.242098, -1.888721, -3.345454, 1, 0.5921569, 0, 1,
-1.241729, -1.687801, -3.909109, 1, 0.6, 0, 1,
-1.241136, -0.5262784, -1.577531, 1, 0.6078432, 0, 1,
-1.239108, 0.8995044, -1.986911, 1, 0.6117647, 0, 1,
-1.231362, -1.354931, -3.564813, 1, 0.6196079, 0, 1,
-1.226949, -0.6844016, -4.154733, 1, 0.6235294, 0, 1,
-1.224854, 0.2418094, -0.4495219, 1, 0.6313726, 0, 1,
-1.224542, 1.285524, -1.165913, 1, 0.6352941, 0, 1,
-1.222121, 1.556709, -0.05430988, 1, 0.6431373, 0, 1,
-1.216715, -1.413736, -3.369887, 1, 0.6470588, 0, 1,
-1.208769, -1.680965, -1.552747, 1, 0.654902, 0, 1,
-1.208132, -1.558909, -2.90207, 1, 0.6588235, 0, 1,
-1.206447, -0.7835697, -1.15637, 1, 0.6666667, 0, 1,
-1.203321, -0.2218471, -3.645609, 1, 0.6705883, 0, 1,
-1.199215, 1.173217, -2.827968, 1, 0.6784314, 0, 1,
-1.196574, -0.1805838, -1.136994, 1, 0.682353, 0, 1,
-1.184853, -1.05578, -3.63245, 1, 0.6901961, 0, 1,
-1.182187, -2.100671, -3.587036, 1, 0.6941177, 0, 1,
-1.181266, 0.1274479, 0.5224257, 1, 0.7019608, 0, 1,
-1.177492, -0.8787473, -1.186068, 1, 0.7098039, 0, 1,
-1.177264, 2.258244, 0.1305403, 1, 0.7137255, 0, 1,
-1.174428, -1.147593, -3.125114, 1, 0.7215686, 0, 1,
-1.169282, 0.307595, -3.213057, 1, 0.7254902, 0, 1,
-1.167271, -0.896918, -1.899931, 1, 0.7333333, 0, 1,
-1.163503, -0.6416461, -1.049379, 1, 0.7372549, 0, 1,
-1.160821, 1.185695, -0.8426499, 1, 0.7450981, 0, 1,
-1.154444, 1.691423, -0.2268019, 1, 0.7490196, 0, 1,
-1.152517, -0.1740891, -1.035275, 1, 0.7568628, 0, 1,
-1.150827, 0.1918901, -2.784388, 1, 0.7607843, 0, 1,
-1.150265, -0.8692925, -2.02068, 1, 0.7686275, 0, 1,
-1.145208, 1.527498, -0.2627234, 1, 0.772549, 0, 1,
-1.142528, 0.0217442, -3.347237, 1, 0.7803922, 0, 1,
-1.135196, -1.070901, -2.458264, 1, 0.7843137, 0, 1,
-1.133333, 1.118449, -0.116317, 1, 0.7921569, 0, 1,
-1.132353, 0.4112598, -2.53338, 1, 0.7960784, 0, 1,
-1.110884, -0.2146515, -2.16421, 1, 0.8039216, 0, 1,
-1.109138, 0.5794535, -0.6486129, 1, 0.8117647, 0, 1,
-1.104583, -0.7055597, -3.890678, 1, 0.8156863, 0, 1,
-1.102388, 0.3040713, 0.5924557, 1, 0.8235294, 0, 1,
-1.10148, -0.4366808, -1.961071, 1, 0.827451, 0, 1,
-1.099716, -1.855614, -2.48296, 1, 0.8352941, 0, 1,
-1.097801, -0.2139403, -0.9887764, 1, 0.8392157, 0, 1,
-1.095569, -0.6402194, -2.424641, 1, 0.8470588, 0, 1,
-1.094782, 1.246882, -1.816164, 1, 0.8509804, 0, 1,
-1.085426, 0.4425052, -1.225612, 1, 0.8588235, 0, 1,
-1.074108, -0.6194323, -1.337851, 1, 0.8627451, 0, 1,
-1.072064, 0.3271953, -0.6846192, 1, 0.8705882, 0, 1,
-1.067026, 1.576719, -1.930346, 1, 0.8745098, 0, 1,
-1.055424, 1.068853, -0.9700611, 1, 0.8823529, 0, 1,
-1.049798, 1.335455, -0.6259096, 1, 0.8862745, 0, 1,
-1.048069, 0.4187832, -1.549007, 1, 0.8941177, 0, 1,
-1.038697, -0.3234746, -1.849095, 1, 0.8980392, 0, 1,
-1.032235, -1.110037, -3.202955, 1, 0.9058824, 0, 1,
-1.026106, -0.1380072, -1.803042, 1, 0.9137255, 0, 1,
-1.025947, -0.4483762, -1.758623, 1, 0.9176471, 0, 1,
-1.018065, 1.330194, -0.1961548, 1, 0.9254902, 0, 1,
-1.012339, -0.08972213, -3.34989, 1, 0.9294118, 0, 1,
-1.007473, 0.008835165, -1.185189, 1, 0.9372549, 0, 1,
-1.007083, -1.515737, -2.532496, 1, 0.9411765, 0, 1,
-1.002335, -0.6627123, -1.937634, 1, 0.9490196, 0, 1,
-0.9989681, 0.3559484, -2.340672, 1, 0.9529412, 0, 1,
-0.9976494, 1.524714, -0.8335617, 1, 0.9607843, 0, 1,
-0.9943585, -0.3623568, -2.411446, 1, 0.9647059, 0, 1,
-0.9895304, -0.1132429, 0.1169467, 1, 0.972549, 0, 1,
-0.9893453, -0.5060078, -3.23786, 1, 0.9764706, 0, 1,
-0.9868944, -0.6605721, -2.989732, 1, 0.9843137, 0, 1,
-0.9686224, 0.832777, -0.9451786, 1, 0.9882353, 0, 1,
-0.9424574, -0.7122375, -2.426214, 1, 0.9960784, 0, 1,
-0.9386503, -0.1573123, 0.486651, 0.9960784, 1, 0, 1,
-0.933907, -0.4180219, -0.7375406, 0.9921569, 1, 0, 1,
-0.9320723, 2.686311, 1.255296, 0.9843137, 1, 0, 1,
-0.9319699, -0.004764491, -1.624921, 0.9803922, 1, 0, 1,
-0.9307128, 0.5812165, -0.4310674, 0.972549, 1, 0, 1,
-0.9286674, 2.045015, -1.519362, 0.9686275, 1, 0, 1,
-0.9285328, 1.082853, -1.596638, 0.9607843, 1, 0, 1,
-0.9228523, -0.5075161, -1.883171, 0.9568627, 1, 0, 1,
-0.9207736, 0.577796, -0.4739625, 0.9490196, 1, 0, 1,
-0.9178401, -0.5829136, -2.815974, 0.945098, 1, 0, 1,
-0.9168016, 1.313621, -1.27438, 0.9372549, 1, 0, 1,
-0.9114217, 0.03690915, -0.2839115, 0.9333333, 1, 0, 1,
-0.9000483, 0.6144308, 1.383141, 0.9254902, 1, 0, 1,
-0.8980868, 0.6496733, -1.380424, 0.9215686, 1, 0, 1,
-0.8853422, -1.877843, -1.649094, 0.9137255, 1, 0, 1,
-0.8809885, -0.2156735, -2.606127, 0.9098039, 1, 0, 1,
-0.8714371, -0.8976893, -2.674392, 0.9019608, 1, 0, 1,
-0.87099, -1.072832, -1.608023, 0.8941177, 1, 0, 1,
-0.8704264, 0.4523049, -3.061105, 0.8901961, 1, 0, 1,
-0.8696393, 1.051696, -1.149943, 0.8823529, 1, 0, 1,
-0.8620924, 0.7821668, -2.131429, 0.8784314, 1, 0, 1,
-0.8597638, 0.6464963, -1.505921, 0.8705882, 1, 0, 1,
-0.8549737, -0.7731073, -1.389811, 0.8666667, 1, 0, 1,
-0.8546128, 0.4351877, -0.9842667, 0.8588235, 1, 0, 1,
-0.8493152, -0.2055686, -1.070029, 0.854902, 1, 0, 1,
-0.8400492, -0.9375284, -3.060668, 0.8470588, 1, 0, 1,
-0.8348212, -0.8370267, -1.324221, 0.8431373, 1, 0, 1,
-0.8331684, 0.7535108, -1.826933, 0.8352941, 1, 0, 1,
-0.8313654, -0.9778233, -0.6112416, 0.8313726, 1, 0, 1,
-0.8285504, -2.672641, -2.350948, 0.8235294, 1, 0, 1,
-0.8237399, 0.3832155, -0.00441689, 0.8196079, 1, 0, 1,
-0.8063492, 0.5268649, -1.739553, 0.8117647, 1, 0, 1,
-0.8023835, 1.885293, 0.2378042, 0.8078431, 1, 0, 1,
-0.7987079, 0.02149592, -2.426652, 0.8, 1, 0, 1,
-0.798243, 0.1260703, -2.643645, 0.7921569, 1, 0, 1,
-0.7974321, -0.2038586, 0.3995895, 0.7882353, 1, 0, 1,
-0.7839332, -0.234555, -0.682648, 0.7803922, 1, 0, 1,
-0.7822487, 1.978525, -1.59587, 0.7764706, 1, 0, 1,
-0.7789916, -0.1326361, -2.001743, 0.7686275, 1, 0, 1,
-0.7770183, -1.73933, -3.429843, 0.7647059, 1, 0, 1,
-0.7767178, -0.2594172, -2.252526, 0.7568628, 1, 0, 1,
-0.7750045, 0.2993925, -1.250188, 0.7529412, 1, 0, 1,
-0.7716088, 0.3454051, -0.6611618, 0.7450981, 1, 0, 1,
-0.7622362, -1.007237, -1.55549, 0.7411765, 1, 0, 1,
-0.7552733, 0.4084912, -2.335336, 0.7333333, 1, 0, 1,
-0.755184, 0.3662755, -1.113492, 0.7294118, 1, 0, 1,
-0.7529127, 0.6542555, -0.4787128, 0.7215686, 1, 0, 1,
-0.750753, 0.9115986, 0.7948768, 0.7176471, 1, 0, 1,
-0.7470971, -0.1676562, -0.184268, 0.7098039, 1, 0, 1,
-0.7426663, -1.698455, -3.607239, 0.7058824, 1, 0, 1,
-0.7390352, -0.9445478, -1.226177, 0.6980392, 1, 0, 1,
-0.7367882, 1.013988, -0.4122764, 0.6901961, 1, 0, 1,
-0.7300597, -0.4604146, -1.518195, 0.6862745, 1, 0, 1,
-0.7284271, -0.1375843, -1.001695, 0.6784314, 1, 0, 1,
-0.724963, 1.477358, 0.3317054, 0.6745098, 1, 0, 1,
-0.7233369, 0.5616133, -0.1547184, 0.6666667, 1, 0, 1,
-0.7162541, -0.5320833, -2.019757, 0.6627451, 1, 0, 1,
-0.7147347, 0.7042656, -0.6616537, 0.654902, 1, 0, 1,
-0.7142923, 0.6285435, -0.9475432, 0.6509804, 1, 0, 1,
-0.713613, -0.4051778, -2.649573, 0.6431373, 1, 0, 1,
-0.7057446, 0.4918962, -0.2677933, 0.6392157, 1, 0, 1,
-0.7049309, 1.11542, -0.08590916, 0.6313726, 1, 0, 1,
-0.6964712, -0.3053512, -1.569615, 0.627451, 1, 0, 1,
-0.6948696, -0.5586163, -3.568537, 0.6196079, 1, 0, 1,
-0.6931528, 0.2132956, -1.459363, 0.6156863, 1, 0, 1,
-0.6911371, 0.911119, -1.009443, 0.6078432, 1, 0, 1,
-0.6760976, -1.408609, -2.684662, 0.6039216, 1, 0, 1,
-0.6741506, -0.604943, -2.014515, 0.5960785, 1, 0, 1,
-0.6623621, -0.09411334, -1.334203, 0.5882353, 1, 0, 1,
-0.6564235, 0.2211067, -0.74896, 0.5843138, 1, 0, 1,
-0.6560464, -0.9407415, 0.5322396, 0.5764706, 1, 0, 1,
-0.653659, 1.254104, 0.6172451, 0.572549, 1, 0, 1,
-0.6520407, 0.4753383, -1.501351, 0.5647059, 1, 0, 1,
-0.651396, -0.1911612, -2.031376, 0.5607843, 1, 0, 1,
-0.6491432, 0.8845108, -2.297858, 0.5529412, 1, 0, 1,
-0.6468121, 1.182209, -0.4689921, 0.5490196, 1, 0, 1,
-0.6423966, 1.727847, 0.4591763, 0.5411765, 1, 0, 1,
-0.6333411, 0.5114747, -3.534273, 0.5372549, 1, 0, 1,
-0.6245242, 0.03667831, -2.972791, 0.5294118, 1, 0, 1,
-0.6243318, -0.4238965, -1.81648, 0.5254902, 1, 0, 1,
-0.6237348, 1.093224, 0.0732381, 0.5176471, 1, 0, 1,
-0.6203724, -1.19002, -2.76505, 0.5137255, 1, 0, 1,
-0.6154568, 0.1493988, -0.4793709, 0.5058824, 1, 0, 1,
-0.61522, -0.7219765, -3.47777, 0.5019608, 1, 0, 1,
-0.6148995, -0.5309473, -2.138916, 0.4941176, 1, 0, 1,
-0.6108935, 1.621622, 0.4621576, 0.4862745, 1, 0, 1,
-0.608237, 0.8751928, 1.075975, 0.4823529, 1, 0, 1,
-0.6063223, 1.008676, -0.2733071, 0.4745098, 1, 0, 1,
-0.6053012, 2.284935, 1.487838, 0.4705882, 1, 0, 1,
-0.6032709, -0.2460321, -2.087176, 0.4627451, 1, 0, 1,
-0.6000221, -0.4675944, -0.4554066, 0.4588235, 1, 0, 1,
-0.5992402, -0.8982733, -3.562011, 0.4509804, 1, 0, 1,
-0.5960107, -0.9736285, -4.07971, 0.4470588, 1, 0, 1,
-0.5942134, -1.21814, -4.007037, 0.4392157, 1, 0, 1,
-0.5916266, 0.8298113, -0.6423858, 0.4352941, 1, 0, 1,
-0.5905323, 0.4387102, -0.7717811, 0.427451, 1, 0, 1,
-0.5885715, 1.049938, -1.764048, 0.4235294, 1, 0, 1,
-0.5870209, 0.8294293, -1.307223, 0.4156863, 1, 0, 1,
-0.5867085, -0.7860205, -2.866165, 0.4117647, 1, 0, 1,
-0.5860837, 0.09535836, -1.537959, 0.4039216, 1, 0, 1,
-0.5843798, -0.7693444, -4.024561, 0.3960784, 1, 0, 1,
-0.5830142, -0.4717086, -2.673201, 0.3921569, 1, 0, 1,
-0.5800623, -1.236993, -3.717794, 0.3843137, 1, 0, 1,
-0.5767502, 0.1726178, -1.649865, 0.3803922, 1, 0, 1,
-0.5761234, 0.03057594, -0.8822281, 0.372549, 1, 0, 1,
-0.5679938, -1.561409, -2.630932, 0.3686275, 1, 0, 1,
-0.5650069, 1.243279, -0.3209085, 0.3607843, 1, 0, 1,
-0.5644342, 0.9429424, -0.3147415, 0.3568628, 1, 0, 1,
-0.562795, -0.6133819, 0.2868917, 0.3490196, 1, 0, 1,
-0.554676, 0.2181084, -1.548198, 0.345098, 1, 0, 1,
-0.5534, 1.012843, -2.744649, 0.3372549, 1, 0, 1,
-0.5476565, 0.05564819, -1.609761, 0.3333333, 1, 0, 1,
-0.5476226, -1.333322, -2.112572, 0.3254902, 1, 0, 1,
-0.5445505, 1.07938, 1.277888, 0.3215686, 1, 0, 1,
-0.5349967, -0.8846244, -1.937967, 0.3137255, 1, 0, 1,
-0.533785, -2.06347, -4.151418, 0.3098039, 1, 0, 1,
-0.53361, 1.108947, -0.6742216, 0.3019608, 1, 0, 1,
-0.53263, 0.7865323, -0.230748, 0.2941177, 1, 0, 1,
-0.5324296, 1.772383, -0.1527671, 0.2901961, 1, 0, 1,
-0.5281991, -0.986499, -3.258122, 0.282353, 1, 0, 1,
-0.5267524, -0.5373591, -1.711549, 0.2784314, 1, 0, 1,
-0.5234504, 0.8606373, -1.849781, 0.2705882, 1, 0, 1,
-0.5220429, 0.605045, -0.961365, 0.2666667, 1, 0, 1,
-0.514706, -1.158274, -2.645934, 0.2588235, 1, 0, 1,
-0.5128744, 2.268463, 0.05995655, 0.254902, 1, 0, 1,
-0.5066845, 0.1191022, -1.323489, 0.2470588, 1, 0, 1,
-0.5051965, -0.7002282, -2.384701, 0.2431373, 1, 0, 1,
-0.502171, -0.6008698, -1.672401, 0.2352941, 1, 0, 1,
-0.4982736, -0.8455503, -3.483571, 0.2313726, 1, 0, 1,
-0.4963031, -0.6960009, -0.8804966, 0.2235294, 1, 0, 1,
-0.4955422, -0.9053944, -1.240513, 0.2196078, 1, 0, 1,
-0.494153, 0.9117607, 0.7308413, 0.2117647, 1, 0, 1,
-0.4937736, 0.7061456, -2.023795, 0.2078431, 1, 0, 1,
-0.4931477, 0.4997456, 0.4577065, 0.2, 1, 0, 1,
-0.4921316, -0.8242587, 0.7819499, 0.1921569, 1, 0, 1,
-0.4887401, -1.268982, -1.610289, 0.1882353, 1, 0, 1,
-0.4874537, 1.489489, 1.747395, 0.1803922, 1, 0, 1,
-0.4856455, 0.05346584, -1.228289, 0.1764706, 1, 0, 1,
-0.4805138, -0.2222152, -2.522482, 0.1686275, 1, 0, 1,
-0.4796118, 0.4255532, -0.5750515, 0.1647059, 1, 0, 1,
-0.4795982, -1.390125, -2.619091, 0.1568628, 1, 0, 1,
-0.4792161, -0.3275885, -3.828908, 0.1529412, 1, 0, 1,
-0.4784012, -0.5139113, -3.18922, 0.145098, 1, 0, 1,
-0.4763969, 0.8311661, -0.2468846, 0.1411765, 1, 0, 1,
-0.4701299, -0.8673938, -1.296918, 0.1333333, 1, 0, 1,
-0.4670828, -0.3385814, -3.904945, 0.1294118, 1, 0, 1,
-0.466276, -0.9164078, -2.664253, 0.1215686, 1, 0, 1,
-0.4649098, 0.6532518, -0.9267803, 0.1176471, 1, 0, 1,
-0.4594854, -0.1728105, -1.172033, 0.1098039, 1, 0, 1,
-0.4583872, -0.9261686, -3.140447, 0.1058824, 1, 0, 1,
-0.4565308, 1.323484, -1.416756, 0.09803922, 1, 0, 1,
-0.4555955, 0.4860385, -0.7078763, 0.09019608, 1, 0, 1,
-0.4555905, 1.529314, -0.7431958, 0.08627451, 1, 0, 1,
-0.4509585, -0.869096, -2.938484, 0.07843138, 1, 0, 1,
-0.4508657, 0.8573408, 1.282996, 0.07450981, 1, 0, 1,
-0.4506192, 1.127083, -2.27275, 0.06666667, 1, 0, 1,
-0.4476986, 1.463144, 0.4093492, 0.0627451, 1, 0, 1,
-0.444127, 1.185161, -2.333188, 0.05490196, 1, 0, 1,
-0.4410889, 0.04326015, -3.22229, 0.05098039, 1, 0, 1,
-0.4409379, 1.609591, 0.3369806, 0.04313726, 1, 0, 1,
-0.4404244, 0.4284025, 0.1095209, 0.03921569, 1, 0, 1,
-0.4399831, -0.6346982, -2.955901, 0.03137255, 1, 0, 1,
-0.4378817, 0.3258906, -1.658556, 0.02745098, 1, 0, 1,
-0.4352159, 2.404219, 1.190216, 0.01960784, 1, 0, 1,
-0.4351612, 1.000024, -1.392604, 0.01568628, 1, 0, 1,
-0.4341539, -2.918086, -2.582419, 0.007843138, 1, 0, 1,
-0.4313169, 1.742007, -1.227542, 0.003921569, 1, 0, 1,
-0.4309538, 1.228463, 1.249848, 0, 1, 0.003921569, 1,
-0.4262218, -0.2698297, -5.343165, 0, 1, 0.01176471, 1,
-0.4253897, -0.3975821, -2.569568, 0, 1, 0.01568628, 1,
-0.4249805, -1.36418, -3.333513, 0, 1, 0.02352941, 1,
-0.4246977, 0.1100664, -2.306076, 0, 1, 0.02745098, 1,
-0.4186659, 0.3548449, -0.2769982, 0, 1, 0.03529412, 1,
-0.4182217, 0.4223261, -0.2410818, 0, 1, 0.03921569, 1,
-0.414347, -2.367193, -2.751261, 0, 1, 0.04705882, 1,
-0.4123645, -0.8690301, -2.37394, 0, 1, 0.05098039, 1,
-0.4123135, 1.516463, 1.22169, 0, 1, 0.05882353, 1,
-0.4092631, -1.167407, -1.753376, 0, 1, 0.0627451, 1,
-0.4044009, 1.214571, -0.7291392, 0, 1, 0.07058824, 1,
-0.39797, -1.698643, -3.804337, 0, 1, 0.07450981, 1,
-0.3976737, -1.174318, -1.934124, 0, 1, 0.08235294, 1,
-0.3920074, -1.313345, -3.291446, 0, 1, 0.08627451, 1,
-0.3904724, -1.282399, -3.424376, 0, 1, 0.09411765, 1,
-0.3875226, 0.498547, 1.362462, 0, 1, 0.1019608, 1,
-0.3870141, -1.015272, -2.286864, 0, 1, 0.1058824, 1,
-0.3837969, 2.207704, 0.6190071, 0, 1, 0.1137255, 1,
-0.3832763, 0.3524709, -1.340401, 0, 1, 0.1176471, 1,
-0.3808834, 0.07400011, -1.318196, 0, 1, 0.1254902, 1,
-0.3806397, -1.843761, -3.237075, 0, 1, 0.1294118, 1,
-0.3793546, -0.5442953, -2.022532, 0, 1, 0.1372549, 1,
-0.3775424, -0.06478494, -3.611828, 0, 1, 0.1411765, 1,
-0.3763277, 0.5084307, -1.270508, 0, 1, 0.1490196, 1,
-0.3719881, 0.4283023, 0.5803599, 0, 1, 0.1529412, 1,
-0.3716194, -0.9700727, -4.346482, 0, 1, 0.1607843, 1,
-0.3693154, 0.5705293, -1.94233, 0, 1, 0.1647059, 1,
-0.3674433, 0.6536536, -1.252142, 0, 1, 0.172549, 1,
-0.3599885, 0.6252323, -0.3506512, 0, 1, 0.1764706, 1,
-0.3558592, 1.011523, -0.5762976, 0, 1, 0.1843137, 1,
-0.3554461, 0.6252621, -0.4066763, 0, 1, 0.1882353, 1,
-0.3445581, -0.2851698, -1.454869, 0, 1, 0.1960784, 1,
-0.3445245, 0.7894767, -0.2816255, 0, 1, 0.2039216, 1,
-0.3330469, -0.7135245, -4.069417, 0, 1, 0.2078431, 1,
-0.3319218, 0.05850503, -3.381463, 0, 1, 0.2156863, 1,
-0.3296411, 0.2795636, -0.684635, 0, 1, 0.2196078, 1,
-0.328247, -2.331288, -3.063154, 0, 1, 0.227451, 1,
-0.3272673, -1.047619, -2.791738, 0, 1, 0.2313726, 1,
-0.3246338, 0.2272063, -1.816857, 0, 1, 0.2392157, 1,
-0.322378, -1.363242, -3.387812, 0, 1, 0.2431373, 1,
-0.319857, -0.5883265, -1.643276, 0, 1, 0.2509804, 1,
-0.3190446, 0.4205751, -1.816141, 0, 1, 0.254902, 1,
-0.3137697, -0.3705798, -4.081907, 0, 1, 0.2627451, 1,
-0.3131379, -1.571266, -1.858435, 0, 1, 0.2666667, 1,
-0.3103851, 0.2167965, 0.2950348, 0, 1, 0.2745098, 1,
-0.3087575, 1.033898, -1.211477, 0, 1, 0.2784314, 1,
-0.3078546, -0.841407, -3.539691, 0, 1, 0.2862745, 1,
-0.3076475, -0.513119, -5.4659, 0, 1, 0.2901961, 1,
-0.3019417, -0.2361083, -1.0376, 0, 1, 0.2980392, 1,
-0.2979854, 0.5806531, -0.7786449, 0, 1, 0.3058824, 1,
-0.2975546, 1.802469, -1.586285, 0, 1, 0.3098039, 1,
-0.2918682, 0.2734966, -1.350537, 0, 1, 0.3176471, 1,
-0.2892052, -0.4891902, -2.227671, 0, 1, 0.3215686, 1,
-0.2836594, -0.9920547, -3.491907, 0, 1, 0.3294118, 1,
-0.2807761, 0.3417921, -1.87155, 0, 1, 0.3333333, 1,
-0.2807689, 0.07835408, -1.786937, 0, 1, 0.3411765, 1,
-0.2730511, 1.923654, -1.254267, 0, 1, 0.345098, 1,
-0.2716504, -0.7048286, -5.091627, 0, 1, 0.3529412, 1,
-0.2690885, 0.8801811, 0.6803012, 0, 1, 0.3568628, 1,
-0.2660897, -0.2313923, -4.681071, 0, 1, 0.3647059, 1,
-0.2654513, -1.85445, -3.350626, 0, 1, 0.3686275, 1,
-0.2563227, -0.08577786, 0.1040855, 0, 1, 0.3764706, 1,
-0.2558974, 0.4375363, 1.608283, 0, 1, 0.3803922, 1,
-0.255886, 0.670055, 0.2434352, 0, 1, 0.3882353, 1,
-0.2549731, -0.4206082, -2.128215, 0, 1, 0.3921569, 1,
-0.2544959, 1.355326, 1.119908, 0, 1, 0.4, 1,
-0.2535353, 1.245802, -0.1641815, 0, 1, 0.4078431, 1,
-0.2530982, -1.064077, -4.265181, 0, 1, 0.4117647, 1,
-0.2441025, -1.613126, -2.57935, 0, 1, 0.4196078, 1,
-0.2440847, -1.431976, -3.104627, 0, 1, 0.4235294, 1,
-0.2438768, -1.294987, -4.860868, 0, 1, 0.4313726, 1,
-0.2375051, 0.3869855, -1.42338, 0, 1, 0.4352941, 1,
-0.2309057, -1.67902, -3.243638, 0, 1, 0.4431373, 1,
-0.2287356, 1.943113, 0.5502227, 0, 1, 0.4470588, 1,
-0.2269292, 1.599887, -0.8821548, 0, 1, 0.454902, 1,
-0.2242449, 1.288104, 0.893694, 0, 1, 0.4588235, 1,
-0.2228795, 1.157979, 0.3296476, 0, 1, 0.4666667, 1,
-0.2180973, -0.2878649, -2.612882, 0, 1, 0.4705882, 1,
-0.2174174, 1.517452, 1.128933, 0, 1, 0.4784314, 1,
-0.2097537, 0.1798925, -0.2776012, 0, 1, 0.4823529, 1,
-0.2031188, 0.09227093, -0.710948, 0, 1, 0.4901961, 1,
-0.1983567, -0.7489064, -5.420109, 0, 1, 0.4941176, 1,
-0.1977641, -0.5424958, -3.506015, 0, 1, 0.5019608, 1,
-0.196651, -0.9689417, -3.488262, 0, 1, 0.509804, 1,
-0.1928476, 0.3957536, -1.656653, 0, 1, 0.5137255, 1,
-0.1921141, -1.239265, -1.463844, 0, 1, 0.5215687, 1,
-0.1867917, -0.0580147, -3.29209, 0, 1, 0.5254902, 1,
-0.1812178, 0.3054877, -0.498376, 0, 1, 0.5333334, 1,
-0.1795236, -0.689579, -5.133132, 0, 1, 0.5372549, 1,
-0.1772725, -0.6496531, -1.504009, 0, 1, 0.5450981, 1,
-0.1738769, 0.40247, 0.9984735, 0, 1, 0.5490196, 1,
-0.1738418, 1.297469, 1.662619, 0, 1, 0.5568628, 1,
-0.1706209, -1.180461, -2.562501, 0, 1, 0.5607843, 1,
-0.1681438, 1.867771, -1.358007, 0, 1, 0.5686275, 1,
-0.1640827, -0.3657402, -1.825148, 0, 1, 0.572549, 1,
-0.1614668, 2.370581, 0.6217154, 0, 1, 0.5803922, 1,
-0.1601362, 0.1481706, -1.205023, 0, 1, 0.5843138, 1,
-0.159027, -0.2538225, -2.474402, 0, 1, 0.5921569, 1,
-0.1581793, -0.8799581, -1.940509, 0, 1, 0.5960785, 1,
-0.1527626, 1.834845, -0.04381983, 0, 1, 0.6039216, 1,
-0.150291, -1.362192, -4.511905, 0, 1, 0.6117647, 1,
-0.1452737, -1.118833, -3.595813, 0, 1, 0.6156863, 1,
-0.1451799, 1.926147, 0.4527224, 0, 1, 0.6235294, 1,
-0.1434567, -0.8612145, -3.853526, 0, 1, 0.627451, 1,
-0.1410413, -0.003883435, -1.530292, 0, 1, 0.6352941, 1,
-0.1388292, -0.5070626, -4.002023, 0, 1, 0.6392157, 1,
-0.1312724, 0.6777583, -0.5500973, 0, 1, 0.6470588, 1,
-0.1302156, -0.1180297, -1.524001, 0, 1, 0.6509804, 1,
-0.1300994, 1.088547, -0.5077723, 0, 1, 0.6588235, 1,
-0.1293092, 0.221008, 0.4192814, 0, 1, 0.6627451, 1,
-0.1266571, 0.3922182, -0.2284282, 0, 1, 0.6705883, 1,
-0.1249213, 0.545581, -0.08134021, 0, 1, 0.6745098, 1,
-0.1208283, -2.383409, -2.668554, 0, 1, 0.682353, 1,
-0.1206403, -1.403326, -2.561977, 0, 1, 0.6862745, 1,
-0.1205072, 0.4180602, 0.6447548, 0, 1, 0.6941177, 1,
-0.1187964, -0.5102087, -2.208513, 0, 1, 0.7019608, 1,
-0.1145856, 0.1761163, -0.3239052, 0, 1, 0.7058824, 1,
-0.1137965, -0.1425552, -2.030261, 0, 1, 0.7137255, 1,
-0.1128809, 1.002531, 0.5862113, 0, 1, 0.7176471, 1,
-0.1120577, 0.2693539, -0.3879481, 0, 1, 0.7254902, 1,
-0.1098855, -0.06541463, -2.363936, 0, 1, 0.7294118, 1,
-0.108827, 0.5217684, -0.4439167, 0, 1, 0.7372549, 1,
-0.1078283, 0.7278798, 0.1128999, 0, 1, 0.7411765, 1,
-0.1066803, 1.253012, 0.7916796, 0, 1, 0.7490196, 1,
-0.1012142, -0.2203769, -3.208653, 0, 1, 0.7529412, 1,
-0.09795664, 0.6612961, -0.7891123, 0, 1, 0.7607843, 1,
-0.09758268, -0.1098166, -3.953847, 0, 1, 0.7647059, 1,
-0.09603404, -0.4745154, -3.147639, 0, 1, 0.772549, 1,
-0.09041128, 1.005089, 0.1768799, 0, 1, 0.7764706, 1,
-0.08999868, -0.1840596, -3.601677, 0, 1, 0.7843137, 1,
-0.08963989, -0.3302154, -1.813278, 0, 1, 0.7882353, 1,
-0.0888423, 1.968945, -0.05844075, 0, 1, 0.7960784, 1,
-0.08777733, 0.6003145, -0.000161545, 0, 1, 0.8039216, 1,
-0.08629066, -0.01440423, -0.1822722, 0, 1, 0.8078431, 1,
-0.08480986, -0.2432098, -2.900649, 0, 1, 0.8156863, 1,
-0.08462675, 0.5169565, 0.6228242, 0, 1, 0.8196079, 1,
-0.08422279, -0.8950204, -2.748951, 0, 1, 0.827451, 1,
-0.08401252, 0.2151116, -1.054125, 0, 1, 0.8313726, 1,
-0.08323561, -1.167574, -2.291997, 0, 1, 0.8392157, 1,
-0.08232361, 0.1402672, -1.104215, 0, 1, 0.8431373, 1,
-0.08098543, 1.293869, -2.860856, 0, 1, 0.8509804, 1,
-0.07975933, 0.7384182, -1.007384, 0, 1, 0.854902, 1,
-0.06973181, -1.968586, -5.452146, 0, 1, 0.8627451, 1,
-0.06854594, -1.035145, -5.158502, 0, 1, 0.8666667, 1,
-0.0677259, 0.7359112, 0.974034, 0, 1, 0.8745098, 1,
-0.06604914, -0.6933504, -1.033378, 0, 1, 0.8784314, 1,
-0.06510138, -0.8379938, -4.65603, 0, 1, 0.8862745, 1,
-0.05765505, -0.8362953, -2.075559, 0, 1, 0.8901961, 1,
-0.05408617, -1.150164, -2.781161, 0, 1, 0.8980392, 1,
-0.04941736, 0.3327592, 0.3435315, 0, 1, 0.9058824, 1,
-0.04853923, -0.465164, -1.925643, 0, 1, 0.9098039, 1,
-0.04382589, -0.8583147, -2.8538, 0, 1, 0.9176471, 1,
-0.04214367, -0.4607138, -4.544016, 0, 1, 0.9215686, 1,
-0.0339544, 0.7489536, -1.238792, 0, 1, 0.9294118, 1,
-0.03284943, -0.3363398, -3.892158, 0, 1, 0.9333333, 1,
-0.03143469, -0.2580326, -2.525094, 0, 1, 0.9411765, 1,
-0.02320152, -0.01206957, -2.771154, 0, 1, 0.945098, 1,
-0.02145042, -0.7694939, -3.73138, 0, 1, 0.9529412, 1,
-0.02082922, 1.451948, -0.7605996, 0, 1, 0.9568627, 1,
-0.01855867, -0.02401757, -2.795647, 0, 1, 0.9647059, 1,
-0.01838347, 0.4636082, 1.281242, 0, 1, 0.9686275, 1,
-0.01642899, 1.694347, 0.1187894, 0, 1, 0.9764706, 1,
-0.01576646, 1.298854, 0.7203605, 0, 1, 0.9803922, 1,
-0.01473796, 1.041959, 1.856284, 0, 1, 0.9882353, 1,
-0.007485941, 0.6317104, 1.387158, 0, 1, 0.9921569, 1,
-0.00586522, 0.8958901, 0.6808516, 0, 1, 1, 1,
-0.001470208, -1.787912, -2.788016, 0, 0.9921569, 1, 1,
0.0003405974, -1.773854, 2.982527, 0, 0.9882353, 1, 1,
0.001302631, -0.8685405, 2.99445, 0, 0.9803922, 1, 1,
0.002841495, -1.985946, 1.142292, 0, 0.9764706, 1, 1,
0.007972183, 0.4046521, -0.7829611, 0, 0.9686275, 1, 1,
0.008139197, -1.741551, 4.432499, 0, 0.9647059, 1, 1,
0.008751888, 1.558829, -0.4763448, 0, 0.9568627, 1, 1,
0.01212015, 0.83421, 0.3363767, 0, 0.9529412, 1, 1,
0.01288534, -0.0133351, 2.249714, 0, 0.945098, 1, 1,
0.01444454, 0.08002129, 1.462793, 0, 0.9411765, 1, 1,
0.01629597, 0.3506579, -0.6176636, 0, 0.9333333, 1, 1,
0.01948107, -1.865956, 2.111126, 0, 0.9294118, 1, 1,
0.02015029, 0.4351903, -0.03059504, 0, 0.9215686, 1, 1,
0.02308119, 0.5709491, 1.120511, 0, 0.9176471, 1, 1,
0.02506501, -0.1929246, 3.674763, 0, 0.9098039, 1, 1,
0.02637567, 0.3915865, -1.178968, 0, 0.9058824, 1, 1,
0.02707796, 0.6351706, 1.01963, 0, 0.8980392, 1, 1,
0.0273481, -1.481573, 4.054144, 0, 0.8901961, 1, 1,
0.02737022, 0.303181, -0.216084, 0, 0.8862745, 1, 1,
0.02751615, 0.006062668, 1.192437, 0, 0.8784314, 1, 1,
0.03054956, -1.01832, 4.863944, 0, 0.8745098, 1, 1,
0.03833197, 0.7736588, -0.3191133, 0, 0.8666667, 1, 1,
0.04136197, 0.9239353, -0.6992787, 0, 0.8627451, 1, 1,
0.04485605, -0.06654596, 1.734763, 0, 0.854902, 1, 1,
0.04777932, 1.313611, 2.162565, 0, 0.8509804, 1, 1,
0.04827808, -1.373277, 3.05077, 0, 0.8431373, 1, 1,
0.05706172, 0.5347008, 0.4620826, 0, 0.8392157, 1, 1,
0.05914043, 1.020414, -0.1132701, 0, 0.8313726, 1, 1,
0.06019272, 0.8321909, -1.072713, 0, 0.827451, 1, 1,
0.06093465, 1.587008, 0.7442088, 0, 0.8196079, 1, 1,
0.0610335, 1.003904, -0.07517724, 0, 0.8156863, 1, 1,
0.06234045, 0.5106211, -0.7807528, 0, 0.8078431, 1, 1,
0.06596225, 0.4547417, -1.010832, 0, 0.8039216, 1, 1,
0.06779344, -0.09207787, 4.205217, 0, 0.7960784, 1, 1,
0.06800588, -0.7219272, 1.498183, 0, 0.7882353, 1, 1,
0.07004817, -0.3673149, 3.308609, 0, 0.7843137, 1, 1,
0.07392929, 0.5094202, 0.4678459, 0, 0.7764706, 1, 1,
0.07468552, 1.40672, -0.6547063, 0, 0.772549, 1, 1,
0.07642191, 0.6018487, 0.1728052, 0, 0.7647059, 1, 1,
0.07809037, -1.149714, 3.405066, 0, 0.7607843, 1, 1,
0.08305456, 1.237338, -0.05105303, 0, 0.7529412, 1, 1,
0.08502962, 1.356297, 0.133761, 0, 0.7490196, 1, 1,
0.08736648, -1.23135, 2.966661, 0, 0.7411765, 1, 1,
0.08790256, 1.003385, -0.08039137, 0, 0.7372549, 1, 1,
0.0887119, -0.4713239, 3.091749, 0, 0.7294118, 1, 1,
0.0912729, -0.6686822, 3.367616, 0, 0.7254902, 1, 1,
0.09442618, 0.5406067, 0.3462673, 0, 0.7176471, 1, 1,
0.09484181, -0.1546757, 3.973092, 0, 0.7137255, 1, 1,
0.09916051, -0.3646486, 2.193074, 0, 0.7058824, 1, 1,
0.0998283, 0.1598054, 0.3533919, 0, 0.6980392, 1, 1,
0.1052057, -0.8288755, 3.407656, 0, 0.6941177, 1, 1,
0.1073545, -0.4966274, 1.218354, 0, 0.6862745, 1, 1,
0.1085809, 0.4871296, 1.068453, 0, 0.682353, 1, 1,
0.1146912, -0.5106706, 1.393716, 0, 0.6745098, 1, 1,
0.1167842, 0.1837963, 0.01597008, 0, 0.6705883, 1, 1,
0.1188383, 2.008115, 1.244527, 0, 0.6627451, 1, 1,
0.1195767, -0.5191594, 4.147572, 0, 0.6588235, 1, 1,
0.1269729, -0.2606677, 2.397075, 0, 0.6509804, 1, 1,
0.1290132, 1.162202, 0.4586041, 0, 0.6470588, 1, 1,
0.1319809, 0.5431716, 1.29961, 0, 0.6392157, 1, 1,
0.1345417, 1.82287, -0.09911484, 0, 0.6352941, 1, 1,
0.1367314, 1.227467, -0.9050452, 0, 0.627451, 1, 1,
0.1374554, 1.648662, -0.9859782, 0, 0.6235294, 1, 1,
0.1419594, 1.250743, 0.0999573, 0, 0.6156863, 1, 1,
0.1446327, -0.2691475, 2.8957, 0, 0.6117647, 1, 1,
0.1448194, 0.1884146, 0.0375722, 0, 0.6039216, 1, 1,
0.1457547, 0.684469, -0.3422905, 0, 0.5960785, 1, 1,
0.147931, 0.6016772, 0.1949209, 0, 0.5921569, 1, 1,
0.1495162, 2.192503, -0.4152615, 0, 0.5843138, 1, 1,
0.151907, -0.2827003, 0.6640445, 0, 0.5803922, 1, 1,
0.1573827, 0.5481978, 1.002497, 0, 0.572549, 1, 1,
0.1596917, 0.6815931, -0.1655587, 0, 0.5686275, 1, 1,
0.1601511, -0.2280051, 3.210024, 0, 0.5607843, 1, 1,
0.1615745, -1.569156, 5.223365, 0, 0.5568628, 1, 1,
0.1620787, -0.1051689, 0.7931767, 0, 0.5490196, 1, 1,
0.1633991, 0.58173, 2.100748, 0, 0.5450981, 1, 1,
0.1637557, -0.7568678, 2.571757, 0, 0.5372549, 1, 1,
0.1665031, -0.3203703, 1.553129, 0, 0.5333334, 1, 1,
0.1677429, -1.055751, 3.448197, 0, 0.5254902, 1, 1,
0.16797, -0.009132108, 1.006684, 0, 0.5215687, 1, 1,
0.169842, -1.429207, 3.816233, 0, 0.5137255, 1, 1,
0.1706242, -0.1480345, 1.775758, 0, 0.509804, 1, 1,
0.1720708, -0.6005346, 3.478221, 0, 0.5019608, 1, 1,
0.174214, 0.2702925, 1.795512, 0, 0.4941176, 1, 1,
0.1751961, -0.9934031, 1.72962, 0, 0.4901961, 1, 1,
0.179978, -0.6409319, 1.722526, 0, 0.4823529, 1, 1,
0.1841135, -0.2882835, 3.601138, 0, 0.4784314, 1, 1,
0.1849988, -0.9492339, 3.633289, 0, 0.4705882, 1, 1,
0.1908349, 0.4498096, -0.3373696, 0, 0.4666667, 1, 1,
0.1913324, -0.6393275, 2.59424, 0, 0.4588235, 1, 1,
0.193301, 0.4080799, 1.586783, 0, 0.454902, 1, 1,
0.1962816, 0.05863383, 1.208626, 0, 0.4470588, 1, 1,
0.197092, 0.6536666, 0.1424615, 0, 0.4431373, 1, 1,
0.2093152, -0.284921, 2.626908, 0, 0.4352941, 1, 1,
0.2128242, -1.845478, 4.651972, 0, 0.4313726, 1, 1,
0.2145883, -0.720518, 2.952224, 0, 0.4235294, 1, 1,
0.2150466, -0.8454874, 3.809509, 0, 0.4196078, 1, 1,
0.2236351, 0.1819934, 0.5818056, 0, 0.4117647, 1, 1,
0.2268354, 0.6563614, -0.1942662, 0, 0.4078431, 1, 1,
0.2283002, -0.7760368, 1.378563, 0, 0.4, 1, 1,
0.2298087, -0.02002387, 0.9032689, 0, 0.3921569, 1, 1,
0.2316553, 1.295297, 0.0002836348, 0, 0.3882353, 1, 1,
0.2326498, -0.9847103, 3.285722, 0, 0.3803922, 1, 1,
0.2349711, 1.009707, -0.3138936, 0, 0.3764706, 1, 1,
0.2381172, 2.038304, -0.03235385, 0, 0.3686275, 1, 1,
0.2419539, 0.08665392, 0.3906841, 0, 0.3647059, 1, 1,
0.2452306, -0.4191746, 3.951016, 0, 0.3568628, 1, 1,
0.2469059, 1.872234, 0.8903372, 0, 0.3529412, 1, 1,
0.2504885, 0.8102884, 3.019084, 0, 0.345098, 1, 1,
0.2527916, 1.392749, 0.5015787, 0, 0.3411765, 1, 1,
0.2540868, 0.5133083, -0.3923436, 0, 0.3333333, 1, 1,
0.2567105, 1.069617, -0.2087578, 0, 0.3294118, 1, 1,
0.2647571, 0.1865495, -0.01351912, 0, 0.3215686, 1, 1,
0.2724712, -1.65509, 2.484721, 0, 0.3176471, 1, 1,
0.2750899, 0.3425522, 0.9412703, 0, 0.3098039, 1, 1,
0.2791049, 0.07742712, 1.47332, 0, 0.3058824, 1, 1,
0.2797176, -1.150276, 3.31226, 0, 0.2980392, 1, 1,
0.2848604, 1.745944, -1.177194, 0, 0.2901961, 1, 1,
0.285223, 0.8464713, 1.231047, 0, 0.2862745, 1, 1,
0.2894728, 0.2650734, 1.94433, 0, 0.2784314, 1, 1,
0.2898576, -1.201109, 4.349051, 0, 0.2745098, 1, 1,
0.2946651, 0.9165467, 0.7367386, 0, 0.2666667, 1, 1,
0.2967016, 0.2311168, 1.927445, 0, 0.2627451, 1, 1,
0.2976325, -2.645869, 2.927107, 0, 0.254902, 1, 1,
0.3026761, 0.1040959, 1.520332, 0, 0.2509804, 1, 1,
0.3066648, -0.2025215, 2.313683, 0, 0.2431373, 1, 1,
0.3118252, 0.865513, 0.970919, 0, 0.2392157, 1, 1,
0.314327, -0.5477813, 3.347085, 0, 0.2313726, 1, 1,
0.3145267, 0.388721, 2.423068, 0, 0.227451, 1, 1,
0.3153859, -0.8121993, 2.844143, 0, 0.2196078, 1, 1,
0.3157953, 0.4457571, 0.247196, 0, 0.2156863, 1, 1,
0.3173303, 0.4457969, 0.7368707, 0, 0.2078431, 1, 1,
0.3176275, -0.683465, 3.718445, 0, 0.2039216, 1, 1,
0.3211317, 0.6860189, 2.268347, 0, 0.1960784, 1, 1,
0.3235469, 0.5752217, -0.8284396, 0, 0.1882353, 1, 1,
0.3354596, 0.07463571, -0.1408262, 0, 0.1843137, 1, 1,
0.3358371, 0.6640782, -0.2689415, 0, 0.1764706, 1, 1,
0.3392394, 0.4802896, -0.05983047, 0, 0.172549, 1, 1,
0.3401441, 0.5224996, -0.7516448, 0, 0.1647059, 1, 1,
0.3415867, 0.07479525, 1.393556, 0, 0.1607843, 1, 1,
0.3426361, 2.217298, -1.194134, 0, 0.1529412, 1, 1,
0.3450652, 0.7991434, -0.1594959, 0, 0.1490196, 1, 1,
0.3475096, 1.906467, 0.6840298, 0, 0.1411765, 1, 1,
0.3498455, -0.8817757, 3.471012, 0, 0.1372549, 1, 1,
0.3499369, -1.076901, 2.938432, 0, 0.1294118, 1, 1,
0.3531267, 0.4474057, 0.7620125, 0, 0.1254902, 1, 1,
0.3560258, -2.154051, 3.161278, 0, 0.1176471, 1, 1,
0.3566928, 0.9192076, -0.177568, 0, 0.1137255, 1, 1,
0.3603716, -0.08734788, 2.516815, 0, 0.1058824, 1, 1,
0.3615152, 0.4125126, -0.8281965, 0, 0.09803922, 1, 1,
0.3635643, -0.4531177, 0.9769168, 0, 0.09411765, 1, 1,
0.3668922, -0.3641396, 2.893057, 0, 0.08627451, 1, 1,
0.3671032, -0.1831822, -0.3199393, 0, 0.08235294, 1, 1,
0.3680643, -1.610409, 2.506287, 0, 0.07450981, 1, 1,
0.3698311, 0.1180395, 1.11035, 0, 0.07058824, 1, 1,
0.3712792, 0.3059435, 1.227482, 0, 0.0627451, 1, 1,
0.3734383, -0.1839069, 1.108027, 0, 0.05882353, 1, 1,
0.3770453, -0.8647701, 4.265437, 0, 0.05098039, 1, 1,
0.3780735, 0.3033731, 1.904106, 0, 0.04705882, 1, 1,
0.3808077, -2.247329, 4.267769, 0, 0.03921569, 1, 1,
0.3856477, -1.97025, 2.82622, 0, 0.03529412, 1, 1,
0.3864498, 0.2072119, 2.207203, 0, 0.02745098, 1, 1,
0.3904858, 1.457371, 0.8146821, 0, 0.02352941, 1, 1,
0.390653, 0.05607042, 0.80163, 0, 0.01568628, 1, 1,
0.3942188, -0.8856143, 5.422396, 0, 0.01176471, 1, 1,
0.3942724, 0.6574415, 2.791393, 0, 0.003921569, 1, 1,
0.3947821, -0.4196869, 0.4298769, 0.003921569, 0, 1, 1,
0.4048386, -0.07913401, 1.497151, 0.007843138, 0, 1, 1,
0.4049905, 1.310123, 1.50274, 0.01568628, 0, 1, 1,
0.4057029, -1.344076, 3.695619, 0.01960784, 0, 1, 1,
0.4064556, -0.764902, 2.076512, 0.02745098, 0, 1, 1,
0.4077048, 1.130181, 0.9223764, 0.03137255, 0, 1, 1,
0.4118725, -1.759533, 1.904001, 0.03921569, 0, 1, 1,
0.4245502, 1.565738, 0.337866, 0.04313726, 0, 1, 1,
0.429203, 1.178374, 0.1843143, 0.05098039, 0, 1, 1,
0.4332097, -1.652777, 2.244297, 0.05490196, 0, 1, 1,
0.4381047, -2.120527, 2.990213, 0.0627451, 0, 1, 1,
0.4391747, 0.8617794, 1.344149, 0.06666667, 0, 1, 1,
0.4414596, -1.181634, 2.495805, 0.07450981, 0, 1, 1,
0.443105, 0.08561646, 0.5119192, 0.07843138, 0, 1, 1,
0.4519087, 0.2638558, 0.501532, 0.08627451, 0, 1, 1,
0.4523728, -0.8300308, 1.413093, 0.09019608, 0, 1, 1,
0.4571024, 0.2479603, 0.08898141, 0.09803922, 0, 1, 1,
0.458276, -0.100628, 0.9168838, 0.1058824, 0, 1, 1,
0.4594181, 0.5283189, -0.9015833, 0.1098039, 0, 1, 1,
0.4651771, -1.304745, 2.251994, 0.1176471, 0, 1, 1,
0.4679914, -0.4717239, 2.841157, 0.1215686, 0, 1, 1,
0.4686694, 1.452462, 0.9942599, 0.1294118, 0, 1, 1,
0.4703982, -1.255504, 1.490878, 0.1333333, 0, 1, 1,
0.4758473, -1.769953, 1.667047, 0.1411765, 0, 1, 1,
0.477319, 2.520209, 0.5984387, 0.145098, 0, 1, 1,
0.4784534, -0.7239096, 3.779805, 0.1529412, 0, 1, 1,
0.4804585, -0.6334738, 2.400976, 0.1568628, 0, 1, 1,
0.481903, -0.566196, 1.671588, 0.1647059, 0, 1, 1,
0.482282, 1.492896, 0.4792711, 0.1686275, 0, 1, 1,
0.482412, -0.1101154, 1.201992, 0.1764706, 0, 1, 1,
0.484004, -0.7640167, 2.609252, 0.1803922, 0, 1, 1,
0.4917576, -0.2590923, 2.543348, 0.1882353, 0, 1, 1,
0.4944405, 0.5304787, -1.135055, 0.1921569, 0, 1, 1,
0.4962574, 0.07741015, 2.412583, 0.2, 0, 1, 1,
0.4990469, 1.317395, -0.1690052, 0.2078431, 0, 1, 1,
0.4996923, 1.239758, -0.3248419, 0.2117647, 0, 1, 1,
0.5013719, -0.9026555, 3.472408, 0.2196078, 0, 1, 1,
0.5035167, 0.7371711, 0.6275908, 0.2235294, 0, 1, 1,
0.5054817, 0.7841276, 0.6128237, 0.2313726, 0, 1, 1,
0.5058446, 0.0347262, 2.156226, 0.2352941, 0, 1, 1,
0.5071588, 0.7351266, -0.01271892, 0.2431373, 0, 1, 1,
0.5088641, -0.1165185, 1.19999, 0.2470588, 0, 1, 1,
0.5091414, 1.140465, -1.319515, 0.254902, 0, 1, 1,
0.51034, 0.79547, 1.607854, 0.2588235, 0, 1, 1,
0.5139477, 1.304095, 1.301222, 0.2666667, 0, 1, 1,
0.5195821, 1.9205, -0.3699825, 0.2705882, 0, 1, 1,
0.5232626, -0.07609462, 2.316231, 0.2784314, 0, 1, 1,
0.5241059, -0.4389351, 2.984516, 0.282353, 0, 1, 1,
0.5297959, -0.7901202, 3.468982, 0.2901961, 0, 1, 1,
0.5314423, -0.2420296, 3.776088, 0.2941177, 0, 1, 1,
0.5322071, 1.026822, 2.41326, 0.3019608, 0, 1, 1,
0.5325686, -1.522367, 2.215889, 0.3098039, 0, 1, 1,
0.5357658, -0.4427979, 2.252225, 0.3137255, 0, 1, 1,
0.5543395, -0.9424131, 2.445443, 0.3215686, 0, 1, 1,
0.5589294, -0.589014, 3.705991, 0.3254902, 0, 1, 1,
0.5591982, 0.5197963, 1.967632, 0.3333333, 0, 1, 1,
0.5638474, -1.626663, 1.702642, 0.3372549, 0, 1, 1,
0.5660832, 0.4192456, -0.04375188, 0.345098, 0, 1, 1,
0.5667356, -0.5355909, 3.387684, 0.3490196, 0, 1, 1,
0.5694283, 1.335351, 0.6760361, 0.3568628, 0, 1, 1,
0.5720971, 0.4074259, 1.511396, 0.3607843, 0, 1, 1,
0.5798797, 0.9410801, -0.8161265, 0.3686275, 0, 1, 1,
0.5845433, 1.074012, 0.5597433, 0.372549, 0, 1, 1,
0.5889424, -0.7918379, 1.700002, 0.3803922, 0, 1, 1,
0.589654, -1.462289, 2.458001, 0.3843137, 0, 1, 1,
0.5947375, 1.004311, 0.7492815, 0.3921569, 0, 1, 1,
0.5974278, 0.8798984, 0.0100902, 0.3960784, 0, 1, 1,
0.6067852, 0.8785415, 2.477025, 0.4039216, 0, 1, 1,
0.6072015, 0.155605, 1.732225, 0.4117647, 0, 1, 1,
0.6130704, -0.2251209, 1.50854, 0.4156863, 0, 1, 1,
0.6175112, -0.4180574, 3.356346, 0.4235294, 0, 1, 1,
0.6187562, -0.265793, -0.2313985, 0.427451, 0, 1, 1,
0.6207383, 0.6353121, 1.834486, 0.4352941, 0, 1, 1,
0.6288918, -0.1860332, 3.268334, 0.4392157, 0, 1, 1,
0.6313353, -0.7191091, 3.464619, 0.4470588, 0, 1, 1,
0.635921, -1.310153, 1.963125, 0.4509804, 0, 1, 1,
0.63619, -0.7587224, 2.080349, 0.4588235, 0, 1, 1,
0.6379414, 1.600422, 0.6026766, 0.4627451, 0, 1, 1,
0.6455193, -0.4513406, 1.718349, 0.4705882, 0, 1, 1,
0.6457072, -0.1287871, 1.385818, 0.4745098, 0, 1, 1,
0.6460369, -0.9151937, 2.117442, 0.4823529, 0, 1, 1,
0.6558225, -0.9319119, 3.142594, 0.4862745, 0, 1, 1,
0.65707, 1.42944, 0.6764233, 0.4941176, 0, 1, 1,
0.6593373, 0.2781782, 3.862094, 0.5019608, 0, 1, 1,
0.6652495, -0.8168748, 1.172177, 0.5058824, 0, 1, 1,
0.6683461, -0.880171, -0.07090411, 0.5137255, 0, 1, 1,
0.6693936, 1.314597, 0.6573101, 0.5176471, 0, 1, 1,
0.6733126, -1.275912, 1.687903, 0.5254902, 0, 1, 1,
0.6735204, 0.733854, 0.765872, 0.5294118, 0, 1, 1,
0.6735404, 0.03749909, 2.387447, 0.5372549, 0, 1, 1,
0.6742863, -0.4396449, 3.387424, 0.5411765, 0, 1, 1,
0.6752866, 0.8824897, 2.24787, 0.5490196, 0, 1, 1,
0.6777236, -0.9378371, 3.464693, 0.5529412, 0, 1, 1,
0.6804533, -0.6913169, 2.600593, 0.5607843, 0, 1, 1,
0.6852334, 0.3209159, 1.195227, 0.5647059, 0, 1, 1,
0.6880101, 1.568214, -0.371321, 0.572549, 0, 1, 1,
0.6890126, -0.5243698, 2.10532, 0.5764706, 0, 1, 1,
0.6916143, -0.8902192, 1.48828, 0.5843138, 0, 1, 1,
0.6941451, -0.1047912, 3.890012, 0.5882353, 0, 1, 1,
0.6974586, -0.4027824, 2.221567, 0.5960785, 0, 1, 1,
0.6983655, 0.2821963, 1.646862, 0.6039216, 0, 1, 1,
0.7017422, -0.5582299, 2.573308, 0.6078432, 0, 1, 1,
0.7035776, -0.1539021, 1.649166, 0.6156863, 0, 1, 1,
0.7039508, 0.2227944, 1.616467, 0.6196079, 0, 1, 1,
0.7065389, -0.05902997, -0.4259719, 0.627451, 0, 1, 1,
0.7078577, -3.081912, 1.336107, 0.6313726, 0, 1, 1,
0.7098417, 0.4737219, 1.938904, 0.6392157, 0, 1, 1,
0.7098577, 0.7148185, 1.005774, 0.6431373, 0, 1, 1,
0.7111073, -1.351724, 2.526777, 0.6509804, 0, 1, 1,
0.7145795, 0.7374997, 0.7231493, 0.654902, 0, 1, 1,
0.7201434, -0.2893406, 1.257121, 0.6627451, 0, 1, 1,
0.7209534, -1.47244, 1.975912, 0.6666667, 0, 1, 1,
0.7236358, -1.104275, 3.064722, 0.6745098, 0, 1, 1,
0.7264665, 0.3332327, 0.2644649, 0.6784314, 0, 1, 1,
0.7276241, 1.342918, 2.606976, 0.6862745, 0, 1, 1,
0.7348045, 0.6959026, 1.827993, 0.6901961, 0, 1, 1,
0.7366452, -1.505851, 2.369023, 0.6980392, 0, 1, 1,
0.7384543, 1.014159, 0.3540191, 0.7058824, 0, 1, 1,
0.7472831, -0.4877201, 2.710375, 0.7098039, 0, 1, 1,
0.7584318, 1.704125, 0.136756, 0.7176471, 0, 1, 1,
0.763582, 0.4349558, 1.305325, 0.7215686, 0, 1, 1,
0.7643295, -0.1411477, 0.6489199, 0.7294118, 0, 1, 1,
0.765856, -3.1537, 4.86586, 0.7333333, 0, 1, 1,
0.7658836, -0.7615597, 2.068493, 0.7411765, 0, 1, 1,
0.7743238, -1.104458, 2.251316, 0.7450981, 0, 1, 1,
0.7778993, 0.3498867, 2.196162, 0.7529412, 0, 1, 1,
0.7813268, 0.5332121, 0.2018645, 0.7568628, 0, 1, 1,
0.7849669, -1.118181, 3.473576, 0.7647059, 0, 1, 1,
0.7867169, 1.035818, 1.132216, 0.7686275, 0, 1, 1,
0.7943604, -0.2442454, 1.628504, 0.7764706, 0, 1, 1,
0.7955387, -1.381873, 2.669725, 0.7803922, 0, 1, 1,
0.7964624, 0.5559255, 0.7223333, 0.7882353, 0, 1, 1,
0.7966462, -1.612344, 2.06814, 0.7921569, 0, 1, 1,
0.7993888, 0.3973441, 1.296784, 0.8, 0, 1, 1,
0.8009783, -1.591356, 3.699251, 0.8078431, 0, 1, 1,
0.8011079, 0.1402389, 3.463157, 0.8117647, 0, 1, 1,
0.8060175, -1.367358, 3.342877, 0.8196079, 0, 1, 1,
0.807102, 1.078929, 0.1937446, 0.8235294, 0, 1, 1,
0.8090342, 1.224417, 1.927547, 0.8313726, 0, 1, 1,
0.8161328, 1.01466, 0.5226634, 0.8352941, 0, 1, 1,
0.8201167, -0.3757639, 2.30355, 0.8431373, 0, 1, 1,
0.8203943, 0.7166108, 2.32093, 0.8470588, 0, 1, 1,
0.8207693, -0.3997418, 1.026089, 0.854902, 0, 1, 1,
0.8208225, 0.9820912, 0.8065552, 0.8588235, 0, 1, 1,
0.8212346, -0.3615918, 4.115044, 0.8666667, 0, 1, 1,
0.8216637, -1.381773, 3.135692, 0.8705882, 0, 1, 1,
0.8248134, 0.1402702, 2.878783, 0.8784314, 0, 1, 1,
0.8301114, 1.601425, 0.3300271, 0.8823529, 0, 1, 1,
0.8302371, 1.419391, -0.06079375, 0.8901961, 0, 1, 1,
0.8313323, -0.3510577, 1.772087, 0.8941177, 0, 1, 1,
0.8332474, 0.8834791, -0.2596147, 0.9019608, 0, 1, 1,
0.842603, -0.2064263, 1.407875, 0.9098039, 0, 1, 1,
0.8481883, -0.8428981, 2.71225, 0.9137255, 0, 1, 1,
0.8485392, 0.4584319, 0.6002047, 0.9215686, 0, 1, 1,
0.857693, -1.005141, 3.515754, 0.9254902, 0, 1, 1,
0.8606451, 1.36107, 1.514048, 0.9333333, 0, 1, 1,
0.8652704, 2.16269, 0.62322, 0.9372549, 0, 1, 1,
0.8714091, -0.3031363, 1.056113, 0.945098, 0, 1, 1,
0.8731235, 2.165649, 0.302797, 0.9490196, 0, 1, 1,
0.8773512, -1.099647, 3.23264, 0.9568627, 0, 1, 1,
0.8794408, -1.829989, 3.168306, 0.9607843, 0, 1, 1,
0.8812766, 0.5923893, 1.905235, 0.9686275, 0, 1, 1,
0.8822341, -0.5420217, 1.801336, 0.972549, 0, 1, 1,
0.8938961, -1.600902, 2.630946, 0.9803922, 0, 1, 1,
0.8960092, 1.570258, -0.02728873, 0.9843137, 0, 1, 1,
0.8960318, -0.2979096, 0.1279973, 0.9921569, 0, 1, 1,
0.9019726, 0.5205611, 2.268507, 0.9960784, 0, 1, 1,
0.9064422, 1.518668, 0.2615075, 1, 0, 0.9960784, 1,
0.9149042, 0.8510014, 1.094288, 1, 0, 0.9882353, 1,
0.9214326, 0.1052305, 2.38512, 1, 0, 0.9843137, 1,
0.9236524, 1.755556, 1.684375, 1, 0, 0.9764706, 1,
0.9344684, -1.487973, 2.574393, 1, 0, 0.972549, 1,
0.9385645, -0.06726151, 0.1334318, 1, 0, 0.9647059, 1,
0.9403413, -1.882094, 3.511288, 1, 0, 0.9607843, 1,
0.9414746, 0.3060849, 0.2126113, 1, 0, 0.9529412, 1,
0.9501589, -0.5101103, 2.141525, 1, 0, 0.9490196, 1,
0.9554492, 0.3831941, 0.4317277, 1, 0, 0.9411765, 1,
0.9613941, 0.4615039, 1.274632, 1, 0, 0.9372549, 1,
0.9618157, 0.2935512, 1.611095, 1, 0, 0.9294118, 1,
0.9670913, -0.4334432, 0.6422673, 1, 0, 0.9254902, 1,
0.9716819, 0.08874626, 2.366721, 1, 0, 0.9176471, 1,
0.9760834, -1.365416, 1.446984, 1, 0, 0.9137255, 1,
0.982656, 0.9346107, -0.03503494, 1, 0, 0.9058824, 1,
0.9828691, 0.9484846, 1.594912, 1, 0, 0.9019608, 1,
0.9842283, 0.6903275, 1.129476, 1, 0, 0.8941177, 1,
0.985609, -0.4104243, 2.333589, 1, 0, 0.8862745, 1,
0.993198, 0.2808976, -0.5825976, 1, 0, 0.8823529, 1,
0.9972823, -1.049058, 2.939284, 1, 0, 0.8745098, 1,
1.001824, 0.5379017, -0.009563023, 1, 0, 0.8705882, 1,
1.003738, 1.255147, -0.9755619, 1, 0, 0.8627451, 1,
1.005843, 0.2106187, 2.223516, 1, 0, 0.8588235, 1,
1.009299, -1.320245, 3.745697, 1, 0, 0.8509804, 1,
1.016535, 1.304087, 0.8141921, 1, 0, 0.8470588, 1,
1.01734, 1.606067, 0.466142, 1, 0, 0.8392157, 1,
1.017504, -0.6353971, 2.26358, 1, 0, 0.8352941, 1,
1.019018, -0.8462686, 2.918439, 1, 0, 0.827451, 1,
1.01961, 1.551892, 0.6072126, 1, 0, 0.8235294, 1,
1.021538, -0.4172835, 2.304365, 1, 0, 0.8156863, 1,
1.024545, 0.2805546, 1.455286, 1, 0, 0.8117647, 1,
1.029293, 2.527852, 0.9917341, 1, 0, 0.8039216, 1,
1.029562, 0.002337152, 2.142583, 1, 0, 0.7960784, 1,
1.029571, -1.350464, 5.532888, 1, 0, 0.7921569, 1,
1.036876, 1.552218, -1.562761, 1, 0, 0.7843137, 1,
1.037177, 1.438484, 1.191253, 1, 0, 0.7803922, 1,
1.041258, -0.3529741, 1.719402, 1, 0, 0.772549, 1,
1.05545, -1.6764, 1.931637, 1, 0, 0.7686275, 1,
1.060623, 0.3686368, 0.6144502, 1, 0, 0.7607843, 1,
1.065881, 0.248847, 0.8190643, 1, 0, 0.7568628, 1,
1.069098, -1.516212, 2.249056, 1, 0, 0.7490196, 1,
1.078782, 0.3128438, 0.7104743, 1, 0, 0.7450981, 1,
1.082111, -0.2087906, 0.153861, 1, 0, 0.7372549, 1,
1.101131, -0.5632154, 2.620049, 1, 0, 0.7333333, 1,
1.11036, 0.1696116, -0.07400294, 1, 0, 0.7254902, 1,
1.116471, 0.4129052, -0.4618853, 1, 0, 0.7215686, 1,
1.116681, 2.629549, 1.957812, 1, 0, 0.7137255, 1,
1.123173, -0.8988581, 0.5190015, 1, 0, 0.7098039, 1,
1.125843, 0.1167288, -0.266412, 1, 0, 0.7019608, 1,
1.13179, 1.4296, 1.9939, 1, 0, 0.6941177, 1,
1.141898, -0.2142141, 2.075399, 1, 0, 0.6901961, 1,
1.143776, 1.148248, 0.6077409, 1, 0, 0.682353, 1,
1.145731, -0.1588573, 1.720916, 1, 0, 0.6784314, 1,
1.146987, 2.00363, 1.565626, 1, 0, 0.6705883, 1,
1.148732, -0.08687852, 1.148107, 1, 0, 0.6666667, 1,
1.152626, -0.7147712, 3.111617, 1, 0, 0.6588235, 1,
1.161318, -0.1477866, 2.730151, 1, 0, 0.654902, 1,
1.165491, 0.9386709, 1.858428, 1, 0, 0.6470588, 1,
1.166052, 0.9153501, 3.530371, 1, 0, 0.6431373, 1,
1.225631, -0.9295379, 2.270421, 1, 0, 0.6352941, 1,
1.231861, 1.278516, 0.7595052, 1, 0, 0.6313726, 1,
1.245581, -0.1047439, -1.163346, 1, 0, 0.6235294, 1,
1.248238, 0.6468452, -0.2847793, 1, 0, 0.6196079, 1,
1.2533, -0.9553159, 1.27016, 1, 0, 0.6117647, 1,
1.268274, -1.415061, 1.835268, 1, 0, 0.6078432, 1,
1.269514, 0.4213212, 2.436326, 1, 0, 0.6, 1,
1.289219, -1.125718, 4.215149, 1, 0, 0.5921569, 1,
1.302867, 1.062449, -0.4166201, 1, 0, 0.5882353, 1,
1.304555, -1.533404, 1.616302, 1, 0, 0.5803922, 1,
1.305075, -1.276253, 2.544775, 1, 0, 0.5764706, 1,
1.306266, 0.6661024, 2.224826, 1, 0, 0.5686275, 1,
1.306824, 0.6456684, 0.9551144, 1, 0, 0.5647059, 1,
1.309073, 1.457558, 1.899371, 1, 0, 0.5568628, 1,
1.318833, 0.6681369, 1.39167, 1, 0, 0.5529412, 1,
1.332435, -0.5540775, 1.814412, 1, 0, 0.5450981, 1,
1.336278, -0.7876499, 0.476995, 1, 0, 0.5411765, 1,
1.339377, -1.026986, 2.598266, 1, 0, 0.5333334, 1,
1.341224, 0.6658998, 0.9010078, 1, 0, 0.5294118, 1,
1.349398, 0.3307756, 0.7600378, 1, 0, 0.5215687, 1,
1.352955, -0.1593982, 3.823264, 1, 0, 0.5176471, 1,
1.360684, -0.2651645, 0.8434865, 1, 0, 0.509804, 1,
1.384194, -0.2470172, 1.047779, 1, 0, 0.5058824, 1,
1.389285, 1.451685, 0.7629952, 1, 0, 0.4980392, 1,
1.391989, -0.1633248, 1.894088, 1, 0, 0.4901961, 1,
1.392538, -1.897226, 3.185657, 1, 0, 0.4862745, 1,
1.397172, -2.0984, 4.08497, 1, 0, 0.4784314, 1,
1.39839, 1.875436, 1.162145, 1, 0, 0.4745098, 1,
1.399773, 3.023424, -0.5743376, 1, 0, 0.4666667, 1,
1.411263, -0.2216232, 1.99696, 1, 0, 0.4627451, 1,
1.417945, -0.6623498, 3.045476, 1, 0, 0.454902, 1,
1.430345, 0.3744398, 2.608037, 1, 0, 0.4509804, 1,
1.434185, -0.6035058, 3.520947, 1, 0, 0.4431373, 1,
1.435852, 0.04578909, 0.4748554, 1, 0, 0.4392157, 1,
1.438093, 0.197132, 1.754809, 1, 0, 0.4313726, 1,
1.456462, 0.8702407, 0.3789178, 1, 0, 0.427451, 1,
1.457245, -0.1800241, 1.925571, 1, 0, 0.4196078, 1,
1.476436, 0.2305555, -0.1870064, 1, 0, 0.4156863, 1,
1.488655, -0.8544998, 2.365301, 1, 0, 0.4078431, 1,
1.494447, -0.1611811, 3.108847, 1, 0, 0.4039216, 1,
1.500385, 0.5539659, 2.503615, 1, 0, 0.3960784, 1,
1.501132, -0.3447594, 2.080413, 1, 0, 0.3882353, 1,
1.508934, -0.1504528, 2.565386, 1, 0, 0.3843137, 1,
1.513, -0.9395957, 1.776529, 1, 0, 0.3764706, 1,
1.51882, 1.599281, -0.03249262, 1, 0, 0.372549, 1,
1.533106, -0.3650766, 0.945401, 1, 0, 0.3647059, 1,
1.535962, -0.1754664, 2.313298, 1, 0, 0.3607843, 1,
1.541756, -0.5072069, 2.289252, 1, 0, 0.3529412, 1,
1.552043, -1.011671, 2.091075, 1, 0, 0.3490196, 1,
1.565142, 0.3819099, 1.782822, 1, 0, 0.3411765, 1,
1.57752, -0.3639323, 0.5261037, 1, 0, 0.3372549, 1,
1.592151, 0.1647039, 0.4649637, 1, 0, 0.3294118, 1,
1.593701, -0.512715, 2.883026, 1, 0, 0.3254902, 1,
1.609288, 0.9944397, 2.302573, 1, 0, 0.3176471, 1,
1.610101, 0.9373567, 1.387358, 1, 0, 0.3137255, 1,
1.62006, 0.4428528, 3.116155, 1, 0, 0.3058824, 1,
1.623841, 1.065708, 0.7053189, 1, 0, 0.2980392, 1,
1.626466, -0.7796886, 1.224323, 1, 0, 0.2941177, 1,
1.63952, -0.7689911, 1.310742, 1, 0, 0.2862745, 1,
1.644505, 0.623747, -0.8846133, 1, 0, 0.282353, 1,
1.644511, -0.50702, 1.593121, 1, 0, 0.2745098, 1,
1.65043, -1.055264, 4.104764, 1, 0, 0.2705882, 1,
1.654786, -0.2033581, 3.204006, 1, 0, 0.2627451, 1,
1.668818, 0.4545587, 0.7229936, 1, 0, 0.2588235, 1,
1.672107, -0.128922, 1.406847, 1, 0, 0.2509804, 1,
1.6815, 0.7326643, 0.439154, 1, 0, 0.2470588, 1,
1.688914, 0.3254995, 2.406371, 1, 0, 0.2392157, 1,
1.689828, 0.5972412, 2.637548, 1, 0, 0.2352941, 1,
1.702899, -0.04862159, 2.011511, 1, 0, 0.227451, 1,
1.704586, -0.5792879, 0.8542259, 1, 0, 0.2235294, 1,
1.73296, 1.400554, 2.639645, 1, 0, 0.2156863, 1,
1.749404, -0.3902487, 0.9178969, 1, 0, 0.2117647, 1,
1.752471, -0.419032, 1.497388, 1, 0, 0.2039216, 1,
1.758169, 0.2039665, 1.532982, 1, 0, 0.1960784, 1,
1.789042, -0.03225577, 2.046615, 1, 0, 0.1921569, 1,
1.824585, 1.745758, 0.8711064, 1, 0, 0.1843137, 1,
1.850093, 0.8402436, 1.838903, 1, 0, 0.1803922, 1,
1.86116, -0.4766468, 2.61639, 1, 0, 0.172549, 1,
1.877124, -0.1497353, 0.7161586, 1, 0, 0.1686275, 1,
1.901142, -1.846723, 2.972178, 1, 0, 0.1607843, 1,
1.90712, -0.7834007, 1.375853, 1, 0, 0.1568628, 1,
1.919073, -0.1281198, 1.488227, 1, 0, 0.1490196, 1,
1.951027, 0.01259566, 1.465363, 1, 0, 0.145098, 1,
1.958545, 0.2818844, 1.747867, 1, 0, 0.1372549, 1,
2.002566, 0.3059525, 2.995666, 1, 0, 0.1333333, 1,
2.020529, -0.2463659, 2.393344, 1, 0, 0.1254902, 1,
2.057844, -0.4730284, 2.757833, 1, 0, 0.1215686, 1,
2.062448, -0.4158356, 2.730263, 1, 0, 0.1137255, 1,
2.066474, -1.178015, 1.555552, 1, 0, 0.1098039, 1,
2.076296, -0.5769053, 1.937207, 1, 0, 0.1019608, 1,
2.095794, 0.3153061, 1.965017, 1, 0, 0.09411765, 1,
2.117218, 1.842394, 1.122201, 1, 0, 0.09019608, 1,
2.120612, 0.4094848, -0.580631, 1, 0, 0.08235294, 1,
2.162968, -1.116126, 3.108195, 1, 0, 0.07843138, 1,
2.16417, -0.2751021, 1.372285, 1, 0, 0.07058824, 1,
2.172202, -0.4792899, 1.882456, 1, 0, 0.06666667, 1,
2.205681, -2.170867, 1.064416, 1, 0, 0.05882353, 1,
2.294557, 1.403579, 1.412941, 1, 0, 0.05490196, 1,
2.31706, 0.6803787, 0.9408193, 1, 0, 0.04705882, 1,
2.385499, 0.2782804, 1.873647, 1, 0, 0.04313726, 1,
2.396974, -0.8945069, 0.6055481, 1, 0, 0.03529412, 1,
2.52609, -1.453306, 4.011412, 1, 0, 0.03137255, 1,
2.542982, 0.359604, 1.914139, 1, 0, 0.02352941, 1,
2.626354, 1.324107, 0.1745242, 1, 0, 0.01960784, 1,
2.631263, -1.265821, 1.262094, 1, 0, 0.01176471, 1,
2.659807, 0.7269675, 0.5401242, 1, 0, 0.007843138, 1
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
-0.3165016, -4.200723, -7.330194, 0, -0.5, 0.5, 0.5,
-0.3165016, -4.200723, -7.330194, 1, -0.5, 0.5, 0.5,
-0.3165016, -4.200723, -7.330194, 1, 1.5, 0.5, 0.5,
-0.3165016, -4.200723, -7.330194, 0, 1.5, 0.5, 0.5
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
-4.301779, -0.06513834, -7.330194, 0, -0.5, 0.5, 0.5,
-4.301779, -0.06513834, -7.330194, 1, -0.5, 0.5, 0.5,
-4.301779, -0.06513834, -7.330194, 1, 1.5, 0.5, 0.5,
-4.301779, -0.06513834, -7.330194, 0, 1.5, 0.5, 0.5
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
-4.301779, -4.200723, 0.03349423, 0, -0.5, 0.5, 0.5,
-4.301779, -4.200723, 0.03349423, 1, -0.5, 0.5, 0.5,
-4.301779, -4.200723, 0.03349423, 1, 1.5, 0.5, 0.5,
-4.301779, -4.200723, 0.03349423, 0, 1.5, 0.5, 0.5
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
-3, -3.246357, -5.630882,
2, -3.246357, -5.630882,
-3, -3.246357, -5.630882,
-3, -3.405418, -5.914101,
-2, -3.246357, -5.630882,
-2, -3.405418, -5.914101,
-1, -3.246357, -5.630882,
-1, -3.405418, -5.914101,
0, -3.246357, -5.630882,
0, -3.405418, -5.914101,
1, -3.246357, -5.630882,
1, -3.405418, -5.914101,
2, -3.246357, -5.630882,
2, -3.405418, -5.914101
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
-3, -3.72354, -6.480538, 0, -0.5, 0.5, 0.5,
-3, -3.72354, -6.480538, 1, -0.5, 0.5, 0.5,
-3, -3.72354, -6.480538, 1, 1.5, 0.5, 0.5,
-3, -3.72354, -6.480538, 0, 1.5, 0.5, 0.5,
-2, -3.72354, -6.480538, 0, -0.5, 0.5, 0.5,
-2, -3.72354, -6.480538, 1, -0.5, 0.5, 0.5,
-2, -3.72354, -6.480538, 1, 1.5, 0.5, 0.5,
-2, -3.72354, -6.480538, 0, 1.5, 0.5, 0.5,
-1, -3.72354, -6.480538, 0, -0.5, 0.5, 0.5,
-1, -3.72354, -6.480538, 1, -0.5, 0.5, 0.5,
-1, -3.72354, -6.480538, 1, 1.5, 0.5, 0.5,
-1, -3.72354, -6.480538, 0, 1.5, 0.5, 0.5,
0, -3.72354, -6.480538, 0, -0.5, 0.5, 0.5,
0, -3.72354, -6.480538, 1, -0.5, 0.5, 0.5,
0, -3.72354, -6.480538, 1, 1.5, 0.5, 0.5,
0, -3.72354, -6.480538, 0, 1.5, 0.5, 0.5,
1, -3.72354, -6.480538, 0, -0.5, 0.5, 0.5,
1, -3.72354, -6.480538, 1, -0.5, 0.5, 0.5,
1, -3.72354, -6.480538, 1, 1.5, 0.5, 0.5,
1, -3.72354, -6.480538, 0, 1.5, 0.5, 0.5,
2, -3.72354, -6.480538, 0, -0.5, 0.5, 0.5,
2, -3.72354, -6.480538, 1, -0.5, 0.5, 0.5,
2, -3.72354, -6.480538, 1, 1.5, 0.5, 0.5,
2, -3.72354, -6.480538, 0, 1.5, 0.5, 0.5
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
-3.3821, -3, -5.630882,
-3.3821, 3, -5.630882,
-3.3821, -3, -5.630882,
-3.53538, -3, -5.914101,
-3.3821, -2, -5.630882,
-3.53538, -2, -5.914101,
-3.3821, -1, -5.630882,
-3.53538, -1, -5.914101,
-3.3821, 0, -5.630882,
-3.53538, 0, -5.914101,
-3.3821, 1, -5.630882,
-3.53538, 1, -5.914101,
-3.3821, 2, -5.630882,
-3.53538, 2, -5.914101,
-3.3821, 3, -5.630882,
-3.53538, 3, -5.914101
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
-3.84194, -3, -6.480538, 0, -0.5, 0.5, 0.5,
-3.84194, -3, -6.480538, 1, -0.5, 0.5, 0.5,
-3.84194, -3, -6.480538, 1, 1.5, 0.5, 0.5,
-3.84194, -3, -6.480538, 0, 1.5, 0.5, 0.5,
-3.84194, -2, -6.480538, 0, -0.5, 0.5, 0.5,
-3.84194, -2, -6.480538, 1, -0.5, 0.5, 0.5,
-3.84194, -2, -6.480538, 1, 1.5, 0.5, 0.5,
-3.84194, -2, -6.480538, 0, 1.5, 0.5, 0.5,
-3.84194, -1, -6.480538, 0, -0.5, 0.5, 0.5,
-3.84194, -1, -6.480538, 1, -0.5, 0.5, 0.5,
-3.84194, -1, -6.480538, 1, 1.5, 0.5, 0.5,
-3.84194, -1, -6.480538, 0, 1.5, 0.5, 0.5,
-3.84194, 0, -6.480538, 0, -0.5, 0.5, 0.5,
-3.84194, 0, -6.480538, 1, -0.5, 0.5, 0.5,
-3.84194, 0, -6.480538, 1, 1.5, 0.5, 0.5,
-3.84194, 0, -6.480538, 0, 1.5, 0.5, 0.5,
-3.84194, 1, -6.480538, 0, -0.5, 0.5, 0.5,
-3.84194, 1, -6.480538, 1, -0.5, 0.5, 0.5,
-3.84194, 1, -6.480538, 1, 1.5, 0.5, 0.5,
-3.84194, 1, -6.480538, 0, 1.5, 0.5, 0.5,
-3.84194, 2, -6.480538, 0, -0.5, 0.5, 0.5,
-3.84194, 2, -6.480538, 1, -0.5, 0.5, 0.5,
-3.84194, 2, -6.480538, 1, 1.5, 0.5, 0.5,
-3.84194, 2, -6.480538, 0, 1.5, 0.5, 0.5,
-3.84194, 3, -6.480538, 0, -0.5, 0.5, 0.5,
-3.84194, 3, -6.480538, 1, -0.5, 0.5, 0.5,
-3.84194, 3, -6.480538, 1, 1.5, 0.5, 0.5,
-3.84194, 3, -6.480538, 0, 1.5, 0.5, 0.5
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
-3.3821, -3.246357, -4,
-3.3821, -3.246357, 4,
-3.3821, -3.246357, -4,
-3.53538, -3.405418, -4,
-3.3821, -3.246357, -2,
-3.53538, -3.405418, -2,
-3.3821, -3.246357, 0,
-3.53538, -3.405418, 0,
-3.3821, -3.246357, 2,
-3.53538, -3.405418, 2,
-3.3821, -3.246357, 4,
-3.53538, -3.405418, 4
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
-3.84194, -3.72354, -4, 0, -0.5, 0.5, 0.5,
-3.84194, -3.72354, -4, 1, -0.5, 0.5, 0.5,
-3.84194, -3.72354, -4, 1, 1.5, 0.5, 0.5,
-3.84194, -3.72354, -4, 0, 1.5, 0.5, 0.5,
-3.84194, -3.72354, -2, 0, -0.5, 0.5, 0.5,
-3.84194, -3.72354, -2, 1, -0.5, 0.5, 0.5,
-3.84194, -3.72354, -2, 1, 1.5, 0.5, 0.5,
-3.84194, -3.72354, -2, 0, 1.5, 0.5, 0.5,
-3.84194, -3.72354, 0, 0, -0.5, 0.5, 0.5,
-3.84194, -3.72354, 0, 1, -0.5, 0.5, 0.5,
-3.84194, -3.72354, 0, 1, 1.5, 0.5, 0.5,
-3.84194, -3.72354, 0, 0, 1.5, 0.5, 0.5,
-3.84194, -3.72354, 2, 0, -0.5, 0.5, 0.5,
-3.84194, -3.72354, 2, 1, -0.5, 0.5, 0.5,
-3.84194, -3.72354, 2, 1, 1.5, 0.5, 0.5,
-3.84194, -3.72354, 2, 0, 1.5, 0.5, 0.5,
-3.84194, -3.72354, 4, 0, -0.5, 0.5, 0.5,
-3.84194, -3.72354, 4, 1, -0.5, 0.5, 0.5,
-3.84194, -3.72354, 4, 1, 1.5, 0.5, 0.5,
-3.84194, -3.72354, 4, 0, 1.5, 0.5, 0.5
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
-3.3821, -3.246357, -5.630882,
-3.3821, 3.116081, -5.630882,
-3.3821, -3.246357, 5.69787,
-3.3821, 3.116081, 5.69787,
-3.3821, -3.246357, -5.630882,
-3.3821, -3.246357, 5.69787,
-3.3821, 3.116081, -5.630882,
-3.3821, 3.116081, 5.69787,
-3.3821, -3.246357, -5.630882,
2.749097, -3.246357, -5.630882,
-3.3821, -3.246357, 5.69787,
2.749097, -3.246357, 5.69787,
-3.3821, 3.116081, -5.630882,
2.749097, 3.116081, -5.630882,
-3.3821, 3.116081, 5.69787,
2.749097, 3.116081, 5.69787,
2.749097, -3.246357, -5.630882,
2.749097, 3.116081, -5.630882,
2.749097, -3.246357, 5.69787,
2.749097, 3.116081, 5.69787,
2.749097, -3.246357, -5.630882,
2.749097, -3.246357, 5.69787,
2.749097, 3.116081, -5.630882,
2.749097, 3.116081, 5.69787
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
var radius = 7.671739;
var distance = 34.13243;
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
mvMatrix.translate( 0.3165016, 0.06513834, -0.03349423 );
mvMatrix.scale( 1.35289, 1.30372, 0.7321931 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13243);
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
Dalapon<-read.table("Dalapon.xyz")
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
-3.292811, 1.066989, -0.9832653, 0, 0, 1, 1, 1,
-3.135406, -0.7201539, -2.128, 1, 0, 0, 1, 1,
-2.942055, -0.6821605, -2.574962, 1, 0, 0, 1, 1,
-2.724377, -1.66872, -2.096713, 1, 0, 0, 1, 1,
-2.618785, 0.4391291, -1.159242, 1, 0, 0, 1, 1,
-2.604576, 0.1555118, -2.392249, 1, 0, 0, 1, 1,
-2.593715, 1.268254, -3.029492, 0, 0, 0, 1, 1,
-2.570972, 0.02659811, -1.335958, 0, 0, 0, 1, 1,
-2.441283, 0.02505076, -3.037455, 0, 0, 0, 1, 1,
-2.437917, -1.083818, -1.383349, 0, 0, 0, 1, 1,
-2.359893, -0.8763697, -1.515054, 0, 0, 0, 1, 1,
-2.334085, 1.540878, -1.871885, 0, 0, 0, 1, 1,
-2.320957, -1.445503, -0.9077833, 0, 0, 0, 1, 1,
-2.309426, 0.2834253, -2.195414, 1, 1, 1, 1, 1,
-2.271708, -0.5793097, -1.277965, 1, 1, 1, 1, 1,
-2.259452, 0.9116249, -0.9284367, 1, 1, 1, 1, 1,
-2.243897, 0.1254411, -1.858806, 1, 1, 1, 1, 1,
-2.160052, -1.696316, -2.722377, 1, 1, 1, 1, 1,
-2.063895, -1.723422, -2.786983, 1, 1, 1, 1, 1,
-2.059049, -0.1090521, -0.731671, 1, 1, 1, 1, 1,
-2.049584, 0.4617165, -1.558121, 1, 1, 1, 1, 1,
-2.045889, -1.088017, -1.99896, 1, 1, 1, 1, 1,
-2.035013, 0.7784683, -0.6957953, 1, 1, 1, 1, 1,
-2.007961, -1.230165, -2.122514, 1, 1, 1, 1, 1,
-1.986844, -1.50526, -2.458236, 1, 1, 1, 1, 1,
-1.939868, 0.216536, -1.17822, 1, 1, 1, 1, 1,
-1.923982, -0.04365944, -0.1547171, 1, 1, 1, 1, 1,
-1.917668, -0.2402572, -2.216787, 1, 1, 1, 1, 1,
-1.913458, 0.1999854, -0.9925928, 0, 0, 1, 1, 1,
-1.899366, -0.9987985, -1.300913, 1, 0, 0, 1, 1,
-1.894126, 0.05658909, -2.380566, 1, 0, 0, 1, 1,
-1.830909, 0.1805607, -1.490703, 1, 0, 0, 1, 1,
-1.826505, 0.533096, -1.40538, 1, 0, 0, 1, 1,
-1.824568, -0.02940218, -1.429234, 1, 0, 0, 1, 1,
-1.787901, -1.580618, -2.606792, 0, 0, 0, 1, 1,
-1.78568, 0.6830497, 0.145909, 0, 0, 0, 1, 1,
-1.723652, -0.3551899, -1.92697, 0, 0, 0, 1, 1,
-1.723411, -0.2167089, -0.9420903, 0, 0, 0, 1, 1,
-1.721389, -0.5270035, -1.886256, 0, 0, 0, 1, 1,
-1.719035, -0.6511456, -2.328247, 0, 0, 0, 1, 1,
-1.710732, 0.5861407, -0.8276127, 0, 0, 0, 1, 1,
-1.704605, -0.07671819, -1.868165, 1, 1, 1, 1, 1,
-1.689661, -0.2227566, -1.745326, 1, 1, 1, 1, 1,
-1.684717, -2.200172, -3.766393, 1, 1, 1, 1, 1,
-1.663647, 0.3626905, -1.910306, 1, 1, 1, 1, 1,
-1.656982, -1.198452, -2.150209, 1, 1, 1, 1, 1,
-1.656154, -1.041719, -2.730155, 1, 1, 1, 1, 1,
-1.634916, -1.13495, -3.252347, 1, 1, 1, 1, 1,
-1.632717, -2.187964, -0.4414175, 1, 1, 1, 1, 1,
-1.618728, 0.6648567, -0.1215172, 1, 1, 1, 1, 1,
-1.615045, 0.8142518, -0.2314815, 1, 1, 1, 1, 1,
-1.601326, -1.957464, -2.799129, 1, 1, 1, 1, 1,
-1.595976, 0.4626382, -0.8371689, 1, 1, 1, 1, 1,
-1.592092, 0.09344411, 0.1203461, 1, 1, 1, 1, 1,
-1.577923, -0.1238357, -0.4516779, 1, 1, 1, 1, 1,
-1.568339, 0.2787096, -2.040292, 1, 1, 1, 1, 1,
-1.555868, -0.3315475, -1.776333, 0, 0, 1, 1, 1,
-1.555047, 0.7222322, 0.8320519, 1, 0, 0, 1, 1,
-1.545642, 0.1004995, -2.047709, 1, 0, 0, 1, 1,
-1.545492, -0.5499199, -3.401705, 1, 0, 0, 1, 1,
-1.54296, 1.181499, -0.7049639, 1, 0, 0, 1, 1,
-1.527815, 1.500605, -1.603767, 1, 0, 0, 1, 1,
-1.521106, -0.2607791, -1.467519, 0, 0, 0, 1, 1,
-1.520324, 2.130824, -1.422254, 0, 0, 0, 1, 1,
-1.50192, -0.8562309, -1.585459, 0, 0, 0, 1, 1,
-1.498932, -0.09190782, -0.1834306, 0, 0, 0, 1, 1,
-1.495071, -0.93269, -2.1847, 0, 0, 0, 1, 1,
-1.493473, -0.1613666, -2.613796, 0, 0, 0, 1, 1,
-1.485945, 0.3970006, -1.237034, 0, 0, 0, 1, 1,
-1.468453, 0.7114918, -2.242383, 1, 1, 1, 1, 1,
-1.463726, -0.4924827, -1.911043, 1, 1, 1, 1, 1,
-1.462751, 0.6819751, -0.948982, 1, 1, 1, 1, 1,
-1.431334, 0.9801224, 0.1154764, 1, 1, 1, 1, 1,
-1.42637, 0.7696925, 0.1354697, 1, 1, 1, 1, 1,
-1.424006, -1.53682, -1.763502, 1, 1, 1, 1, 1,
-1.422435, -0.2791975, -1.13534, 1, 1, 1, 1, 1,
-1.40943, -0.2667361, -3.706235, 1, 1, 1, 1, 1,
-1.389637, 0.02665323, -0.09802146, 1, 1, 1, 1, 1,
-1.384281, 0.7503974, -2.913497, 1, 1, 1, 1, 1,
-1.375841, -1.170845, -1.018346, 1, 1, 1, 1, 1,
-1.369817, 1.848862, 0.4354215, 1, 1, 1, 1, 1,
-1.358699, -0.892242, -2.000633, 1, 1, 1, 1, 1,
-1.340218, -0.8110278, -2.826763, 1, 1, 1, 1, 1,
-1.336771, -1.303269, -2.714463, 1, 1, 1, 1, 1,
-1.336183, -0.2368788, -1.457672, 0, 0, 1, 1, 1,
-1.334812, -0.8021247, -2.140469, 1, 0, 0, 1, 1,
-1.33097, 1.633638, -1.60241, 1, 0, 0, 1, 1,
-1.329132, 0.3806043, -1.569631, 1, 0, 0, 1, 1,
-1.324154, 0.4385013, -0.9332698, 1, 0, 0, 1, 1,
-1.32126, 0.1510784, -1.42964, 1, 0, 0, 1, 1,
-1.320717, -1.282041, -2.026344, 0, 0, 0, 1, 1,
-1.311237, -1.087909, -4.529092, 0, 0, 0, 1, 1,
-1.305895, 1.279806, 0.2709714, 0, 0, 0, 1, 1,
-1.304209, 0.4064333, -1.922683, 0, 0, 0, 1, 1,
-1.28221, 1.326236, -1.749243, 0, 0, 0, 1, 1,
-1.280558, -0.5174756, -2.168394, 0, 0, 0, 1, 1,
-1.262165, 0.1077212, -2.018357, 0, 0, 0, 1, 1,
-1.25925, -1.024995, -2.069733, 1, 1, 1, 1, 1,
-1.256799, -0.74139, -3.727396, 1, 1, 1, 1, 1,
-1.242098, -1.888721, -3.345454, 1, 1, 1, 1, 1,
-1.241729, -1.687801, -3.909109, 1, 1, 1, 1, 1,
-1.241136, -0.5262784, -1.577531, 1, 1, 1, 1, 1,
-1.239108, 0.8995044, -1.986911, 1, 1, 1, 1, 1,
-1.231362, -1.354931, -3.564813, 1, 1, 1, 1, 1,
-1.226949, -0.6844016, -4.154733, 1, 1, 1, 1, 1,
-1.224854, 0.2418094, -0.4495219, 1, 1, 1, 1, 1,
-1.224542, 1.285524, -1.165913, 1, 1, 1, 1, 1,
-1.222121, 1.556709, -0.05430988, 1, 1, 1, 1, 1,
-1.216715, -1.413736, -3.369887, 1, 1, 1, 1, 1,
-1.208769, -1.680965, -1.552747, 1, 1, 1, 1, 1,
-1.208132, -1.558909, -2.90207, 1, 1, 1, 1, 1,
-1.206447, -0.7835697, -1.15637, 1, 1, 1, 1, 1,
-1.203321, -0.2218471, -3.645609, 0, 0, 1, 1, 1,
-1.199215, 1.173217, -2.827968, 1, 0, 0, 1, 1,
-1.196574, -0.1805838, -1.136994, 1, 0, 0, 1, 1,
-1.184853, -1.05578, -3.63245, 1, 0, 0, 1, 1,
-1.182187, -2.100671, -3.587036, 1, 0, 0, 1, 1,
-1.181266, 0.1274479, 0.5224257, 1, 0, 0, 1, 1,
-1.177492, -0.8787473, -1.186068, 0, 0, 0, 1, 1,
-1.177264, 2.258244, 0.1305403, 0, 0, 0, 1, 1,
-1.174428, -1.147593, -3.125114, 0, 0, 0, 1, 1,
-1.169282, 0.307595, -3.213057, 0, 0, 0, 1, 1,
-1.167271, -0.896918, -1.899931, 0, 0, 0, 1, 1,
-1.163503, -0.6416461, -1.049379, 0, 0, 0, 1, 1,
-1.160821, 1.185695, -0.8426499, 0, 0, 0, 1, 1,
-1.154444, 1.691423, -0.2268019, 1, 1, 1, 1, 1,
-1.152517, -0.1740891, -1.035275, 1, 1, 1, 1, 1,
-1.150827, 0.1918901, -2.784388, 1, 1, 1, 1, 1,
-1.150265, -0.8692925, -2.02068, 1, 1, 1, 1, 1,
-1.145208, 1.527498, -0.2627234, 1, 1, 1, 1, 1,
-1.142528, 0.0217442, -3.347237, 1, 1, 1, 1, 1,
-1.135196, -1.070901, -2.458264, 1, 1, 1, 1, 1,
-1.133333, 1.118449, -0.116317, 1, 1, 1, 1, 1,
-1.132353, 0.4112598, -2.53338, 1, 1, 1, 1, 1,
-1.110884, -0.2146515, -2.16421, 1, 1, 1, 1, 1,
-1.109138, 0.5794535, -0.6486129, 1, 1, 1, 1, 1,
-1.104583, -0.7055597, -3.890678, 1, 1, 1, 1, 1,
-1.102388, 0.3040713, 0.5924557, 1, 1, 1, 1, 1,
-1.10148, -0.4366808, -1.961071, 1, 1, 1, 1, 1,
-1.099716, -1.855614, -2.48296, 1, 1, 1, 1, 1,
-1.097801, -0.2139403, -0.9887764, 0, 0, 1, 1, 1,
-1.095569, -0.6402194, -2.424641, 1, 0, 0, 1, 1,
-1.094782, 1.246882, -1.816164, 1, 0, 0, 1, 1,
-1.085426, 0.4425052, -1.225612, 1, 0, 0, 1, 1,
-1.074108, -0.6194323, -1.337851, 1, 0, 0, 1, 1,
-1.072064, 0.3271953, -0.6846192, 1, 0, 0, 1, 1,
-1.067026, 1.576719, -1.930346, 0, 0, 0, 1, 1,
-1.055424, 1.068853, -0.9700611, 0, 0, 0, 1, 1,
-1.049798, 1.335455, -0.6259096, 0, 0, 0, 1, 1,
-1.048069, 0.4187832, -1.549007, 0, 0, 0, 1, 1,
-1.038697, -0.3234746, -1.849095, 0, 0, 0, 1, 1,
-1.032235, -1.110037, -3.202955, 0, 0, 0, 1, 1,
-1.026106, -0.1380072, -1.803042, 0, 0, 0, 1, 1,
-1.025947, -0.4483762, -1.758623, 1, 1, 1, 1, 1,
-1.018065, 1.330194, -0.1961548, 1, 1, 1, 1, 1,
-1.012339, -0.08972213, -3.34989, 1, 1, 1, 1, 1,
-1.007473, 0.008835165, -1.185189, 1, 1, 1, 1, 1,
-1.007083, -1.515737, -2.532496, 1, 1, 1, 1, 1,
-1.002335, -0.6627123, -1.937634, 1, 1, 1, 1, 1,
-0.9989681, 0.3559484, -2.340672, 1, 1, 1, 1, 1,
-0.9976494, 1.524714, -0.8335617, 1, 1, 1, 1, 1,
-0.9943585, -0.3623568, -2.411446, 1, 1, 1, 1, 1,
-0.9895304, -0.1132429, 0.1169467, 1, 1, 1, 1, 1,
-0.9893453, -0.5060078, -3.23786, 1, 1, 1, 1, 1,
-0.9868944, -0.6605721, -2.989732, 1, 1, 1, 1, 1,
-0.9686224, 0.832777, -0.9451786, 1, 1, 1, 1, 1,
-0.9424574, -0.7122375, -2.426214, 1, 1, 1, 1, 1,
-0.9386503, -0.1573123, 0.486651, 1, 1, 1, 1, 1,
-0.933907, -0.4180219, -0.7375406, 0, 0, 1, 1, 1,
-0.9320723, 2.686311, 1.255296, 1, 0, 0, 1, 1,
-0.9319699, -0.004764491, -1.624921, 1, 0, 0, 1, 1,
-0.9307128, 0.5812165, -0.4310674, 1, 0, 0, 1, 1,
-0.9286674, 2.045015, -1.519362, 1, 0, 0, 1, 1,
-0.9285328, 1.082853, -1.596638, 1, 0, 0, 1, 1,
-0.9228523, -0.5075161, -1.883171, 0, 0, 0, 1, 1,
-0.9207736, 0.577796, -0.4739625, 0, 0, 0, 1, 1,
-0.9178401, -0.5829136, -2.815974, 0, 0, 0, 1, 1,
-0.9168016, 1.313621, -1.27438, 0, 0, 0, 1, 1,
-0.9114217, 0.03690915, -0.2839115, 0, 0, 0, 1, 1,
-0.9000483, 0.6144308, 1.383141, 0, 0, 0, 1, 1,
-0.8980868, 0.6496733, -1.380424, 0, 0, 0, 1, 1,
-0.8853422, -1.877843, -1.649094, 1, 1, 1, 1, 1,
-0.8809885, -0.2156735, -2.606127, 1, 1, 1, 1, 1,
-0.8714371, -0.8976893, -2.674392, 1, 1, 1, 1, 1,
-0.87099, -1.072832, -1.608023, 1, 1, 1, 1, 1,
-0.8704264, 0.4523049, -3.061105, 1, 1, 1, 1, 1,
-0.8696393, 1.051696, -1.149943, 1, 1, 1, 1, 1,
-0.8620924, 0.7821668, -2.131429, 1, 1, 1, 1, 1,
-0.8597638, 0.6464963, -1.505921, 1, 1, 1, 1, 1,
-0.8549737, -0.7731073, -1.389811, 1, 1, 1, 1, 1,
-0.8546128, 0.4351877, -0.9842667, 1, 1, 1, 1, 1,
-0.8493152, -0.2055686, -1.070029, 1, 1, 1, 1, 1,
-0.8400492, -0.9375284, -3.060668, 1, 1, 1, 1, 1,
-0.8348212, -0.8370267, -1.324221, 1, 1, 1, 1, 1,
-0.8331684, 0.7535108, -1.826933, 1, 1, 1, 1, 1,
-0.8313654, -0.9778233, -0.6112416, 1, 1, 1, 1, 1,
-0.8285504, -2.672641, -2.350948, 0, 0, 1, 1, 1,
-0.8237399, 0.3832155, -0.00441689, 1, 0, 0, 1, 1,
-0.8063492, 0.5268649, -1.739553, 1, 0, 0, 1, 1,
-0.8023835, 1.885293, 0.2378042, 1, 0, 0, 1, 1,
-0.7987079, 0.02149592, -2.426652, 1, 0, 0, 1, 1,
-0.798243, 0.1260703, -2.643645, 1, 0, 0, 1, 1,
-0.7974321, -0.2038586, 0.3995895, 0, 0, 0, 1, 1,
-0.7839332, -0.234555, -0.682648, 0, 0, 0, 1, 1,
-0.7822487, 1.978525, -1.59587, 0, 0, 0, 1, 1,
-0.7789916, -0.1326361, -2.001743, 0, 0, 0, 1, 1,
-0.7770183, -1.73933, -3.429843, 0, 0, 0, 1, 1,
-0.7767178, -0.2594172, -2.252526, 0, 0, 0, 1, 1,
-0.7750045, 0.2993925, -1.250188, 0, 0, 0, 1, 1,
-0.7716088, 0.3454051, -0.6611618, 1, 1, 1, 1, 1,
-0.7622362, -1.007237, -1.55549, 1, 1, 1, 1, 1,
-0.7552733, 0.4084912, -2.335336, 1, 1, 1, 1, 1,
-0.755184, 0.3662755, -1.113492, 1, 1, 1, 1, 1,
-0.7529127, 0.6542555, -0.4787128, 1, 1, 1, 1, 1,
-0.750753, 0.9115986, 0.7948768, 1, 1, 1, 1, 1,
-0.7470971, -0.1676562, -0.184268, 1, 1, 1, 1, 1,
-0.7426663, -1.698455, -3.607239, 1, 1, 1, 1, 1,
-0.7390352, -0.9445478, -1.226177, 1, 1, 1, 1, 1,
-0.7367882, 1.013988, -0.4122764, 1, 1, 1, 1, 1,
-0.7300597, -0.4604146, -1.518195, 1, 1, 1, 1, 1,
-0.7284271, -0.1375843, -1.001695, 1, 1, 1, 1, 1,
-0.724963, 1.477358, 0.3317054, 1, 1, 1, 1, 1,
-0.7233369, 0.5616133, -0.1547184, 1, 1, 1, 1, 1,
-0.7162541, -0.5320833, -2.019757, 1, 1, 1, 1, 1,
-0.7147347, 0.7042656, -0.6616537, 0, 0, 1, 1, 1,
-0.7142923, 0.6285435, -0.9475432, 1, 0, 0, 1, 1,
-0.713613, -0.4051778, -2.649573, 1, 0, 0, 1, 1,
-0.7057446, 0.4918962, -0.2677933, 1, 0, 0, 1, 1,
-0.7049309, 1.11542, -0.08590916, 1, 0, 0, 1, 1,
-0.6964712, -0.3053512, -1.569615, 1, 0, 0, 1, 1,
-0.6948696, -0.5586163, -3.568537, 0, 0, 0, 1, 1,
-0.6931528, 0.2132956, -1.459363, 0, 0, 0, 1, 1,
-0.6911371, 0.911119, -1.009443, 0, 0, 0, 1, 1,
-0.6760976, -1.408609, -2.684662, 0, 0, 0, 1, 1,
-0.6741506, -0.604943, -2.014515, 0, 0, 0, 1, 1,
-0.6623621, -0.09411334, -1.334203, 0, 0, 0, 1, 1,
-0.6564235, 0.2211067, -0.74896, 0, 0, 0, 1, 1,
-0.6560464, -0.9407415, 0.5322396, 1, 1, 1, 1, 1,
-0.653659, 1.254104, 0.6172451, 1, 1, 1, 1, 1,
-0.6520407, 0.4753383, -1.501351, 1, 1, 1, 1, 1,
-0.651396, -0.1911612, -2.031376, 1, 1, 1, 1, 1,
-0.6491432, 0.8845108, -2.297858, 1, 1, 1, 1, 1,
-0.6468121, 1.182209, -0.4689921, 1, 1, 1, 1, 1,
-0.6423966, 1.727847, 0.4591763, 1, 1, 1, 1, 1,
-0.6333411, 0.5114747, -3.534273, 1, 1, 1, 1, 1,
-0.6245242, 0.03667831, -2.972791, 1, 1, 1, 1, 1,
-0.6243318, -0.4238965, -1.81648, 1, 1, 1, 1, 1,
-0.6237348, 1.093224, 0.0732381, 1, 1, 1, 1, 1,
-0.6203724, -1.19002, -2.76505, 1, 1, 1, 1, 1,
-0.6154568, 0.1493988, -0.4793709, 1, 1, 1, 1, 1,
-0.61522, -0.7219765, -3.47777, 1, 1, 1, 1, 1,
-0.6148995, -0.5309473, -2.138916, 1, 1, 1, 1, 1,
-0.6108935, 1.621622, 0.4621576, 0, 0, 1, 1, 1,
-0.608237, 0.8751928, 1.075975, 1, 0, 0, 1, 1,
-0.6063223, 1.008676, -0.2733071, 1, 0, 0, 1, 1,
-0.6053012, 2.284935, 1.487838, 1, 0, 0, 1, 1,
-0.6032709, -0.2460321, -2.087176, 1, 0, 0, 1, 1,
-0.6000221, -0.4675944, -0.4554066, 1, 0, 0, 1, 1,
-0.5992402, -0.8982733, -3.562011, 0, 0, 0, 1, 1,
-0.5960107, -0.9736285, -4.07971, 0, 0, 0, 1, 1,
-0.5942134, -1.21814, -4.007037, 0, 0, 0, 1, 1,
-0.5916266, 0.8298113, -0.6423858, 0, 0, 0, 1, 1,
-0.5905323, 0.4387102, -0.7717811, 0, 0, 0, 1, 1,
-0.5885715, 1.049938, -1.764048, 0, 0, 0, 1, 1,
-0.5870209, 0.8294293, -1.307223, 0, 0, 0, 1, 1,
-0.5867085, -0.7860205, -2.866165, 1, 1, 1, 1, 1,
-0.5860837, 0.09535836, -1.537959, 1, 1, 1, 1, 1,
-0.5843798, -0.7693444, -4.024561, 1, 1, 1, 1, 1,
-0.5830142, -0.4717086, -2.673201, 1, 1, 1, 1, 1,
-0.5800623, -1.236993, -3.717794, 1, 1, 1, 1, 1,
-0.5767502, 0.1726178, -1.649865, 1, 1, 1, 1, 1,
-0.5761234, 0.03057594, -0.8822281, 1, 1, 1, 1, 1,
-0.5679938, -1.561409, -2.630932, 1, 1, 1, 1, 1,
-0.5650069, 1.243279, -0.3209085, 1, 1, 1, 1, 1,
-0.5644342, 0.9429424, -0.3147415, 1, 1, 1, 1, 1,
-0.562795, -0.6133819, 0.2868917, 1, 1, 1, 1, 1,
-0.554676, 0.2181084, -1.548198, 1, 1, 1, 1, 1,
-0.5534, 1.012843, -2.744649, 1, 1, 1, 1, 1,
-0.5476565, 0.05564819, -1.609761, 1, 1, 1, 1, 1,
-0.5476226, -1.333322, -2.112572, 1, 1, 1, 1, 1,
-0.5445505, 1.07938, 1.277888, 0, 0, 1, 1, 1,
-0.5349967, -0.8846244, -1.937967, 1, 0, 0, 1, 1,
-0.533785, -2.06347, -4.151418, 1, 0, 0, 1, 1,
-0.53361, 1.108947, -0.6742216, 1, 0, 0, 1, 1,
-0.53263, 0.7865323, -0.230748, 1, 0, 0, 1, 1,
-0.5324296, 1.772383, -0.1527671, 1, 0, 0, 1, 1,
-0.5281991, -0.986499, -3.258122, 0, 0, 0, 1, 1,
-0.5267524, -0.5373591, -1.711549, 0, 0, 0, 1, 1,
-0.5234504, 0.8606373, -1.849781, 0, 0, 0, 1, 1,
-0.5220429, 0.605045, -0.961365, 0, 0, 0, 1, 1,
-0.514706, -1.158274, -2.645934, 0, 0, 0, 1, 1,
-0.5128744, 2.268463, 0.05995655, 0, 0, 0, 1, 1,
-0.5066845, 0.1191022, -1.323489, 0, 0, 0, 1, 1,
-0.5051965, -0.7002282, -2.384701, 1, 1, 1, 1, 1,
-0.502171, -0.6008698, -1.672401, 1, 1, 1, 1, 1,
-0.4982736, -0.8455503, -3.483571, 1, 1, 1, 1, 1,
-0.4963031, -0.6960009, -0.8804966, 1, 1, 1, 1, 1,
-0.4955422, -0.9053944, -1.240513, 1, 1, 1, 1, 1,
-0.494153, 0.9117607, 0.7308413, 1, 1, 1, 1, 1,
-0.4937736, 0.7061456, -2.023795, 1, 1, 1, 1, 1,
-0.4931477, 0.4997456, 0.4577065, 1, 1, 1, 1, 1,
-0.4921316, -0.8242587, 0.7819499, 1, 1, 1, 1, 1,
-0.4887401, -1.268982, -1.610289, 1, 1, 1, 1, 1,
-0.4874537, 1.489489, 1.747395, 1, 1, 1, 1, 1,
-0.4856455, 0.05346584, -1.228289, 1, 1, 1, 1, 1,
-0.4805138, -0.2222152, -2.522482, 1, 1, 1, 1, 1,
-0.4796118, 0.4255532, -0.5750515, 1, 1, 1, 1, 1,
-0.4795982, -1.390125, -2.619091, 1, 1, 1, 1, 1,
-0.4792161, -0.3275885, -3.828908, 0, 0, 1, 1, 1,
-0.4784012, -0.5139113, -3.18922, 1, 0, 0, 1, 1,
-0.4763969, 0.8311661, -0.2468846, 1, 0, 0, 1, 1,
-0.4701299, -0.8673938, -1.296918, 1, 0, 0, 1, 1,
-0.4670828, -0.3385814, -3.904945, 1, 0, 0, 1, 1,
-0.466276, -0.9164078, -2.664253, 1, 0, 0, 1, 1,
-0.4649098, 0.6532518, -0.9267803, 0, 0, 0, 1, 1,
-0.4594854, -0.1728105, -1.172033, 0, 0, 0, 1, 1,
-0.4583872, -0.9261686, -3.140447, 0, 0, 0, 1, 1,
-0.4565308, 1.323484, -1.416756, 0, 0, 0, 1, 1,
-0.4555955, 0.4860385, -0.7078763, 0, 0, 0, 1, 1,
-0.4555905, 1.529314, -0.7431958, 0, 0, 0, 1, 1,
-0.4509585, -0.869096, -2.938484, 0, 0, 0, 1, 1,
-0.4508657, 0.8573408, 1.282996, 1, 1, 1, 1, 1,
-0.4506192, 1.127083, -2.27275, 1, 1, 1, 1, 1,
-0.4476986, 1.463144, 0.4093492, 1, 1, 1, 1, 1,
-0.444127, 1.185161, -2.333188, 1, 1, 1, 1, 1,
-0.4410889, 0.04326015, -3.22229, 1, 1, 1, 1, 1,
-0.4409379, 1.609591, 0.3369806, 1, 1, 1, 1, 1,
-0.4404244, 0.4284025, 0.1095209, 1, 1, 1, 1, 1,
-0.4399831, -0.6346982, -2.955901, 1, 1, 1, 1, 1,
-0.4378817, 0.3258906, -1.658556, 1, 1, 1, 1, 1,
-0.4352159, 2.404219, 1.190216, 1, 1, 1, 1, 1,
-0.4351612, 1.000024, -1.392604, 1, 1, 1, 1, 1,
-0.4341539, -2.918086, -2.582419, 1, 1, 1, 1, 1,
-0.4313169, 1.742007, -1.227542, 1, 1, 1, 1, 1,
-0.4309538, 1.228463, 1.249848, 1, 1, 1, 1, 1,
-0.4262218, -0.2698297, -5.343165, 1, 1, 1, 1, 1,
-0.4253897, -0.3975821, -2.569568, 0, 0, 1, 1, 1,
-0.4249805, -1.36418, -3.333513, 1, 0, 0, 1, 1,
-0.4246977, 0.1100664, -2.306076, 1, 0, 0, 1, 1,
-0.4186659, 0.3548449, -0.2769982, 1, 0, 0, 1, 1,
-0.4182217, 0.4223261, -0.2410818, 1, 0, 0, 1, 1,
-0.414347, -2.367193, -2.751261, 1, 0, 0, 1, 1,
-0.4123645, -0.8690301, -2.37394, 0, 0, 0, 1, 1,
-0.4123135, 1.516463, 1.22169, 0, 0, 0, 1, 1,
-0.4092631, -1.167407, -1.753376, 0, 0, 0, 1, 1,
-0.4044009, 1.214571, -0.7291392, 0, 0, 0, 1, 1,
-0.39797, -1.698643, -3.804337, 0, 0, 0, 1, 1,
-0.3976737, -1.174318, -1.934124, 0, 0, 0, 1, 1,
-0.3920074, -1.313345, -3.291446, 0, 0, 0, 1, 1,
-0.3904724, -1.282399, -3.424376, 1, 1, 1, 1, 1,
-0.3875226, 0.498547, 1.362462, 1, 1, 1, 1, 1,
-0.3870141, -1.015272, -2.286864, 1, 1, 1, 1, 1,
-0.3837969, 2.207704, 0.6190071, 1, 1, 1, 1, 1,
-0.3832763, 0.3524709, -1.340401, 1, 1, 1, 1, 1,
-0.3808834, 0.07400011, -1.318196, 1, 1, 1, 1, 1,
-0.3806397, -1.843761, -3.237075, 1, 1, 1, 1, 1,
-0.3793546, -0.5442953, -2.022532, 1, 1, 1, 1, 1,
-0.3775424, -0.06478494, -3.611828, 1, 1, 1, 1, 1,
-0.3763277, 0.5084307, -1.270508, 1, 1, 1, 1, 1,
-0.3719881, 0.4283023, 0.5803599, 1, 1, 1, 1, 1,
-0.3716194, -0.9700727, -4.346482, 1, 1, 1, 1, 1,
-0.3693154, 0.5705293, -1.94233, 1, 1, 1, 1, 1,
-0.3674433, 0.6536536, -1.252142, 1, 1, 1, 1, 1,
-0.3599885, 0.6252323, -0.3506512, 1, 1, 1, 1, 1,
-0.3558592, 1.011523, -0.5762976, 0, 0, 1, 1, 1,
-0.3554461, 0.6252621, -0.4066763, 1, 0, 0, 1, 1,
-0.3445581, -0.2851698, -1.454869, 1, 0, 0, 1, 1,
-0.3445245, 0.7894767, -0.2816255, 1, 0, 0, 1, 1,
-0.3330469, -0.7135245, -4.069417, 1, 0, 0, 1, 1,
-0.3319218, 0.05850503, -3.381463, 1, 0, 0, 1, 1,
-0.3296411, 0.2795636, -0.684635, 0, 0, 0, 1, 1,
-0.328247, -2.331288, -3.063154, 0, 0, 0, 1, 1,
-0.3272673, -1.047619, -2.791738, 0, 0, 0, 1, 1,
-0.3246338, 0.2272063, -1.816857, 0, 0, 0, 1, 1,
-0.322378, -1.363242, -3.387812, 0, 0, 0, 1, 1,
-0.319857, -0.5883265, -1.643276, 0, 0, 0, 1, 1,
-0.3190446, 0.4205751, -1.816141, 0, 0, 0, 1, 1,
-0.3137697, -0.3705798, -4.081907, 1, 1, 1, 1, 1,
-0.3131379, -1.571266, -1.858435, 1, 1, 1, 1, 1,
-0.3103851, 0.2167965, 0.2950348, 1, 1, 1, 1, 1,
-0.3087575, 1.033898, -1.211477, 1, 1, 1, 1, 1,
-0.3078546, -0.841407, -3.539691, 1, 1, 1, 1, 1,
-0.3076475, -0.513119, -5.4659, 1, 1, 1, 1, 1,
-0.3019417, -0.2361083, -1.0376, 1, 1, 1, 1, 1,
-0.2979854, 0.5806531, -0.7786449, 1, 1, 1, 1, 1,
-0.2975546, 1.802469, -1.586285, 1, 1, 1, 1, 1,
-0.2918682, 0.2734966, -1.350537, 1, 1, 1, 1, 1,
-0.2892052, -0.4891902, -2.227671, 1, 1, 1, 1, 1,
-0.2836594, -0.9920547, -3.491907, 1, 1, 1, 1, 1,
-0.2807761, 0.3417921, -1.87155, 1, 1, 1, 1, 1,
-0.2807689, 0.07835408, -1.786937, 1, 1, 1, 1, 1,
-0.2730511, 1.923654, -1.254267, 1, 1, 1, 1, 1,
-0.2716504, -0.7048286, -5.091627, 0, 0, 1, 1, 1,
-0.2690885, 0.8801811, 0.6803012, 1, 0, 0, 1, 1,
-0.2660897, -0.2313923, -4.681071, 1, 0, 0, 1, 1,
-0.2654513, -1.85445, -3.350626, 1, 0, 0, 1, 1,
-0.2563227, -0.08577786, 0.1040855, 1, 0, 0, 1, 1,
-0.2558974, 0.4375363, 1.608283, 1, 0, 0, 1, 1,
-0.255886, 0.670055, 0.2434352, 0, 0, 0, 1, 1,
-0.2549731, -0.4206082, -2.128215, 0, 0, 0, 1, 1,
-0.2544959, 1.355326, 1.119908, 0, 0, 0, 1, 1,
-0.2535353, 1.245802, -0.1641815, 0, 0, 0, 1, 1,
-0.2530982, -1.064077, -4.265181, 0, 0, 0, 1, 1,
-0.2441025, -1.613126, -2.57935, 0, 0, 0, 1, 1,
-0.2440847, -1.431976, -3.104627, 0, 0, 0, 1, 1,
-0.2438768, -1.294987, -4.860868, 1, 1, 1, 1, 1,
-0.2375051, 0.3869855, -1.42338, 1, 1, 1, 1, 1,
-0.2309057, -1.67902, -3.243638, 1, 1, 1, 1, 1,
-0.2287356, 1.943113, 0.5502227, 1, 1, 1, 1, 1,
-0.2269292, 1.599887, -0.8821548, 1, 1, 1, 1, 1,
-0.2242449, 1.288104, 0.893694, 1, 1, 1, 1, 1,
-0.2228795, 1.157979, 0.3296476, 1, 1, 1, 1, 1,
-0.2180973, -0.2878649, -2.612882, 1, 1, 1, 1, 1,
-0.2174174, 1.517452, 1.128933, 1, 1, 1, 1, 1,
-0.2097537, 0.1798925, -0.2776012, 1, 1, 1, 1, 1,
-0.2031188, 0.09227093, -0.710948, 1, 1, 1, 1, 1,
-0.1983567, -0.7489064, -5.420109, 1, 1, 1, 1, 1,
-0.1977641, -0.5424958, -3.506015, 1, 1, 1, 1, 1,
-0.196651, -0.9689417, -3.488262, 1, 1, 1, 1, 1,
-0.1928476, 0.3957536, -1.656653, 1, 1, 1, 1, 1,
-0.1921141, -1.239265, -1.463844, 0, 0, 1, 1, 1,
-0.1867917, -0.0580147, -3.29209, 1, 0, 0, 1, 1,
-0.1812178, 0.3054877, -0.498376, 1, 0, 0, 1, 1,
-0.1795236, -0.689579, -5.133132, 1, 0, 0, 1, 1,
-0.1772725, -0.6496531, -1.504009, 1, 0, 0, 1, 1,
-0.1738769, 0.40247, 0.9984735, 1, 0, 0, 1, 1,
-0.1738418, 1.297469, 1.662619, 0, 0, 0, 1, 1,
-0.1706209, -1.180461, -2.562501, 0, 0, 0, 1, 1,
-0.1681438, 1.867771, -1.358007, 0, 0, 0, 1, 1,
-0.1640827, -0.3657402, -1.825148, 0, 0, 0, 1, 1,
-0.1614668, 2.370581, 0.6217154, 0, 0, 0, 1, 1,
-0.1601362, 0.1481706, -1.205023, 0, 0, 0, 1, 1,
-0.159027, -0.2538225, -2.474402, 0, 0, 0, 1, 1,
-0.1581793, -0.8799581, -1.940509, 1, 1, 1, 1, 1,
-0.1527626, 1.834845, -0.04381983, 1, 1, 1, 1, 1,
-0.150291, -1.362192, -4.511905, 1, 1, 1, 1, 1,
-0.1452737, -1.118833, -3.595813, 1, 1, 1, 1, 1,
-0.1451799, 1.926147, 0.4527224, 1, 1, 1, 1, 1,
-0.1434567, -0.8612145, -3.853526, 1, 1, 1, 1, 1,
-0.1410413, -0.003883435, -1.530292, 1, 1, 1, 1, 1,
-0.1388292, -0.5070626, -4.002023, 1, 1, 1, 1, 1,
-0.1312724, 0.6777583, -0.5500973, 1, 1, 1, 1, 1,
-0.1302156, -0.1180297, -1.524001, 1, 1, 1, 1, 1,
-0.1300994, 1.088547, -0.5077723, 1, 1, 1, 1, 1,
-0.1293092, 0.221008, 0.4192814, 1, 1, 1, 1, 1,
-0.1266571, 0.3922182, -0.2284282, 1, 1, 1, 1, 1,
-0.1249213, 0.545581, -0.08134021, 1, 1, 1, 1, 1,
-0.1208283, -2.383409, -2.668554, 1, 1, 1, 1, 1,
-0.1206403, -1.403326, -2.561977, 0, 0, 1, 1, 1,
-0.1205072, 0.4180602, 0.6447548, 1, 0, 0, 1, 1,
-0.1187964, -0.5102087, -2.208513, 1, 0, 0, 1, 1,
-0.1145856, 0.1761163, -0.3239052, 1, 0, 0, 1, 1,
-0.1137965, -0.1425552, -2.030261, 1, 0, 0, 1, 1,
-0.1128809, 1.002531, 0.5862113, 1, 0, 0, 1, 1,
-0.1120577, 0.2693539, -0.3879481, 0, 0, 0, 1, 1,
-0.1098855, -0.06541463, -2.363936, 0, 0, 0, 1, 1,
-0.108827, 0.5217684, -0.4439167, 0, 0, 0, 1, 1,
-0.1078283, 0.7278798, 0.1128999, 0, 0, 0, 1, 1,
-0.1066803, 1.253012, 0.7916796, 0, 0, 0, 1, 1,
-0.1012142, -0.2203769, -3.208653, 0, 0, 0, 1, 1,
-0.09795664, 0.6612961, -0.7891123, 0, 0, 0, 1, 1,
-0.09758268, -0.1098166, -3.953847, 1, 1, 1, 1, 1,
-0.09603404, -0.4745154, -3.147639, 1, 1, 1, 1, 1,
-0.09041128, 1.005089, 0.1768799, 1, 1, 1, 1, 1,
-0.08999868, -0.1840596, -3.601677, 1, 1, 1, 1, 1,
-0.08963989, -0.3302154, -1.813278, 1, 1, 1, 1, 1,
-0.0888423, 1.968945, -0.05844075, 1, 1, 1, 1, 1,
-0.08777733, 0.6003145, -0.000161545, 1, 1, 1, 1, 1,
-0.08629066, -0.01440423, -0.1822722, 1, 1, 1, 1, 1,
-0.08480986, -0.2432098, -2.900649, 1, 1, 1, 1, 1,
-0.08462675, 0.5169565, 0.6228242, 1, 1, 1, 1, 1,
-0.08422279, -0.8950204, -2.748951, 1, 1, 1, 1, 1,
-0.08401252, 0.2151116, -1.054125, 1, 1, 1, 1, 1,
-0.08323561, -1.167574, -2.291997, 1, 1, 1, 1, 1,
-0.08232361, 0.1402672, -1.104215, 1, 1, 1, 1, 1,
-0.08098543, 1.293869, -2.860856, 1, 1, 1, 1, 1,
-0.07975933, 0.7384182, -1.007384, 0, 0, 1, 1, 1,
-0.06973181, -1.968586, -5.452146, 1, 0, 0, 1, 1,
-0.06854594, -1.035145, -5.158502, 1, 0, 0, 1, 1,
-0.0677259, 0.7359112, 0.974034, 1, 0, 0, 1, 1,
-0.06604914, -0.6933504, -1.033378, 1, 0, 0, 1, 1,
-0.06510138, -0.8379938, -4.65603, 1, 0, 0, 1, 1,
-0.05765505, -0.8362953, -2.075559, 0, 0, 0, 1, 1,
-0.05408617, -1.150164, -2.781161, 0, 0, 0, 1, 1,
-0.04941736, 0.3327592, 0.3435315, 0, 0, 0, 1, 1,
-0.04853923, -0.465164, -1.925643, 0, 0, 0, 1, 1,
-0.04382589, -0.8583147, -2.8538, 0, 0, 0, 1, 1,
-0.04214367, -0.4607138, -4.544016, 0, 0, 0, 1, 1,
-0.0339544, 0.7489536, -1.238792, 0, 0, 0, 1, 1,
-0.03284943, -0.3363398, -3.892158, 1, 1, 1, 1, 1,
-0.03143469, -0.2580326, -2.525094, 1, 1, 1, 1, 1,
-0.02320152, -0.01206957, -2.771154, 1, 1, 1, 1, 1,
-0.02145042, -0.7694939, -3.73138, 1, 1, 1, 1, 1,
-0.02082922, 1.451948, -0.7605996, 1, 1, 1, 1, 1,
-0.01855867, -0.02401757, -2.795647, 1, 1, 1, 1, 1,
-0.01838347, 0.4636082, 1.281242, 1, 1, 1, 1, 1,
-0.01642899, 1.694347, 0.1187894, 1, 1, 1, 1, 1,
-0.01576646, 1.298854, 0.7203605, 1, 1, 1, 1, 1,
-0.01473796, 1.041959, 1.856284, 1, 1, 1, 1, 1,
-0.007485941, 0.6317104, 1.387158, 1, 1, 1, 1, 1,
-0.00586522, 0.8958901, 0.6808516, 1, 1, 1, 1, 1,
-0.001470208, -1.787912, -2.788016, 1, 1, 1, 1, 1,
0.0003405974, -1.773854, 2.982527, 1, 1, 1, 1, 1,
0.001302631, -0.8685405, 2.99445, 1, 1, 1, 1, 1,
0.002841495, -1.985946, 1.142292, 0, 0, 1, 1, 1,
0.007972183, 0.4046521, -0.7829611, 1, 0, 0, 1, 1,
0.008139197, -1.741551, 4.432499, 1, 0, 0, 1, 1,
0.008751888, 1.558829, -0.4763448, 1, 0, 0, 1, 1,
0.01212015, 0.83421, 0.3363767, 1, 0, 0, 1, 1,
0.01288534, -0.0133351, 2.249714, 1, 0, 0, 1, 1,
0.01444454, 0.08002129, 1.462793, 0, 0, 0, 1, 1,
0.01629597, 0.3506579, -0.6176636, 0, 0, 0, 1, 1,
0.01948107, -1.865956, 2.111126, 0, 0, 0, 1, 1,
0.02015029, 0.4351903, -0.03059504, 0, 0, 0, 1, 1,
0.02308119, 0.5709491, 1.120511, 0, 0, 0, 1, 1,
0.02506501, -0.1929246, 3.674763, 0, 0, 0, 1, 1,
0.02637567, 0.3915865, -1.178968, 0, 0, 0, 1, 1,
0.02707796, 0.6351706, 1.01963, 1, 1, 1, 1, 1,
0.0273481, -1.481573, 4.054144, 1, 1, 1, 1, 1,
0.02737022, 0.303181, -0.216084, 1, 1, 1, 1, 1,
0.02751615, 0.006062668, 1.192437, 1, 1, 1, 1, 1,
0.03054956, -1.01832, 4.863944, 1, 1, 1, 1, 1,
0.03833197, 0.7736588, -0.3191133, 1, 1, 1, 1, 1,
0.04136197, 0.9239353, -0.6992787, 1, 1, 1, 1, 1,
0.04485605, -0.06654596, 1.734763, 1, 1, 1, 1, 1,
0.04777932, 1.313611, 2.162565, 1, 1, 1, 1, 1,
0.04827808, -1.373277, 3.05077, 1, 1, 1, 1, 1,
0.05706172, 0.5347008, 0.4620826, 1, 1, 1, 1, 1,
0.05914043, 1.020414, -0.1132701, 1, 1, 1, 1, 1,
0.06019272, 0.8321909, -1.072713, 1, 1, 1, 1, 1,
0.06093465, 1.587008, 0.7442088, 1, 1, 1, 1, 1,
0.0610335, 1.003904, -0.07517724, 1, 1, 1, 1, 1,
0.06234045, 0.5106211, -0.7807528, 0, 0, 1, 1, 1,
0.06596225, 0.4547417, -1.010832, 1, 0, 0, 1, 1,
0.06779344, -0.09207787, 4.205217, 1, 0, 0, 1, 1,
0.06800588, -0.7219272, 1.498183, 1, 0, 0, 1, 1,
0.07004817, -0.3673149, 3.308609, 1, 0, 0, 1, 1,
0.07392929, 0.5094202, 0.4678459, 1, 0, 0, 1, 1,
0.07468552, 1.40672, -0.6547063, 0, 0, 0, 1, 1,
0.07642191, 0.6018487, 0.1728052, 0, 0, 0, 1, 1,
0.07809037, -1.149714, 3.405066, 0, 0, 0, 1, 1,
0.08305456, 1.237338, -0.05105303, 0, 0, 0, 1, 1,
0.08502962, 1.356297, 0.133761, 0, 0, 0, 1, 1,
0.08736648, -1.23135, 2.966661, 0, 0, 0, 1, 1,
0.08790256, 1.003385, -0.08039137, 0, 0, 0, 1, 1,
0.0887119, -0.4713239, 3.091749, 1, 1, 1, 1, 1,
0.0912729, -0.6686822, 3.367616, 1, 1, 1, 1, 1,
0.09442618, 0.5406067, 0.3462673, 1, 1, 1, 1, 1,
0.09484181, -0.1546757, 3.973092, 1, 1, 1, 1, 1,
0.09916051, -0.3646486, 2.193074, 1, 1, 1, 1, 1,
0.0998283, 0.1598054, 0.3533919, 1, 1, 1, 1, 1,
0.1052057, -0.8288755, 3.407656, 1, 1, 1, 1, 1,
0.1073545, -0.4966274, 1.218354, 1, 1, 1, 1, 1,
0.1085809, 0.4871296, 1.068453, 1, 1, 1, 1, 1,
0.1146912, -0.5106706, 1.393716, 1, 1, 1, 1, 1,
0.1167842, 0.1837963, 0.01597008, 1, 1, 1, 1, 1,
0.1188383, 2.008115, 1.244527, 1, 1, 1, 1, 1,
0.1195767, -0.5191594, 4.147572, 1, 1, 1, 1, 1,
0.1269729, -0.2606677, 2.397075, 1, 1, 1, 1, 1,
0.1290132, 1.162202, 0.4586041, 1, 1, 1, 1, 1,
0.1319809, 0.5431716, 1.29961, 0, 0, 1, 1, 1,
0.1345417, 1.82287, -0.09911484, 1, 0, 0, 1, 1,
0.1367314, 1.227467, -0.9050452, 1, 0, 0, 1, 1,
0.1374554, 1.648662, -0.9859782, 1, 0, 0, 1, 1,
0.1419594, 1.250743, 0.0999573, 1, 0, 0, 1, 1,
0.1446327, -0.2691475, 2.8957, 1, 0, 0, 1, 1,
0.1448194, 0.1884146, 0.0375722, 0, 0, 0, 1, 1,
0.1457547, 0.684469, -0.3422905, 0, 0, 0, 1, 1,
0.147931, 0.6016772, 0.1949209, 0, 0, 0, 1, 1,
0.1495162, 2.192503, -0.4152615, 0, 0, 0, 1, 1,
0.151907, -0.2827003, 0.6640445, 0, 0, 0, 1, 1,
0.1573827, 0.5481978, 1.002497, 0, 0, 0, 1, 1,
0.1596917, 0.6815931, -0.1655587, 0, 0, 0, 1, 1,
0.1601511, -0.2280051, 3.210024, 1, 1, 1, 1, 1,
0.1615745, -1.569156, 5.223365, 1, 1, 1, 1, 1,
0.1620787, -0.1051689, 0.7931767, 1, 1, 1, 1, 1,
0.1633991, 0.58173, 2.100748, 1, 1, 1, 1, 1,
0.1637557, -0.7568678, 2.571757, 1, 1, 1, 1, 1,
0.1665031, -0.3203703, 1.553129, 1, 1, 1, 1, 1,
0.1677429, -1.055751, 3.448197, 1, 1, 1, 1, 1,
0.16797, -0.009132108, 1.006684, 1, 1, 1, 1, 1,
0.169842, -1.429207, 3.816233, 1, 1, 1, 1, 1,
0.1706242, -0.1480345, 1.775758, 1, 1, 1, 1, 1,
0.1720708, -0.6005346, 3.478221, 1, 1, 1, 1, 1,
0.174214, 0.2702925, 1.795512, 1, 1, 1, 1, 1,
0.1751961, -0.9934031, 1.72962, 1, 1, 1, 1, 1,
0.179978, -0.6409319, 1.722526, 1, 1, 1, 1, 1,
0.1841135, -0.2882835, 3.601138, 1, 1, 1, 1, 1,
0.1849988, -0.9492339, 3.633289, 0, 0, 1, 1, 1,
0.1908349, 0.4498096, -0.3373696, 1, 0, 0, 1, 1,
0.1913324, -0.6393275, 2.59424, 1, 0, 0, 1, 1,
0.193301, 0.4080799, 1.586783, 1, 0, 0, 1, 1,
0.1962816, 0.05863383, 1.208626, 1, 0, 0, 1, 1,
0.197092, 0.6536666, 0.1424615, 1, 0, 0, 1, 1,
0.2093152, -0.284921, 2.626908, 0, 0, 0, 1, 1,
0.2128242, -1.845478, 4.651972, 0, 0, 0, 1, 1,
0.2145883, -0.720518, 2.952224, 0, 0, 0, 1, 1,
0.2150466, -0.8454874, 3.809509, 0, 0, 0, 1, 1,
0.2236351, 0.1819934, 0.5818056, 0, 0, 0, 1, 1,
0.2268354, 0.6563614, -0.1942662, 0, 0, 0, 1, 1,
0.2283002, -0.7760368, 1.378563, 0, 0, 0, 1, 1,
0.2298087, -0.02002387, 0.9032689, 1, 1, 1, 1, 1,
0.2316553, 1.295297, 0.0002836348, 1, 1, 1, 1, 1,
0.2326498, -0.9847103, 3.285722, 1, 1, 1, 1, 1,
0.2349711, 1.009707, -0.3138936, 1, 1, 1, 1, 1,
0.2381172, 2.038304, -0.03235385, 1, 1, 1, 1, 1,
0.2419539, 0.08665392, 0.3906841, 1, 1, 1, 1, 1,
0.2452306, -0.4191746, 3.951016, 1, 1, 1, 1, 1,
0.2469059, 1.872234, 0.8903372, 1, 1, 1, 1, 1,
0.2504885, 0.8102884, 3.019084, 1, 1, 1, 1, 1,
0.2527916, 1.392749, 0.5015787, 1, 1, 1, 1, 1,
0.2540868, 0.5133083, -0.3923436, 1, 1, 1, 1, 1,
0.2567105, 1.069617, -0.2087578, 1, 1, 1, 1, 1,
0.2647571, 0.1865495, -0.01351912, 1, 1, 1, 1, 1,
0.2724712, -1.65509, 2.484721, 1, 1, 1, 1, 1,
0.2750899, 0.3425522, 0.9412703, 1, 1, 1, 1, 1,
0.2791049, 0.07742712, 1.47332, 0, 0, 1, 1, 1,
0.2797176, -1.150276, 3.31226, 1, 0, 0, 1, 1,
0.2848604, 1.745944, -1.177194, 1, 0, 0, 1, 1,
0.285223, 0.8464713, 1.231047, 1, 0, 0, 1, 1,
0.2894728, 0.2650734, 1.94433, 1, 0, 0, 1, 1,
0.2898576, -1.201109, 4.349051, 1, 0, 0, 1, 1,
0.2946651, 0.9165467, 0.7367386, 0, 0, 0, 1, 1,
0.2967016, 0.2311168, 1.927445, 0, 0, 0, 1, 1,
0.2976325, -2.645869, 2.927107, 0, 0, 0, 1, 1,
0.3026761, 0.1040959, 1.520332, 0, 0, 0, 1, 1,
0.3066648, -0.2025215, 2.313683, 0, 0, 0, 1, 1,
0.3118252, 0.865513, 0.970919, 0, 0, 0, 1, 1,
0.314327, -0.5477813, 3.347085, 0, 0, 0, 1, 1,
0.3145267, 0.388721, 2.423068, 1, 1, 1, 1, 1,
0.3153859, -0.8121993, 2.844143, 1, 1, 1, 1, 1,
0.3157953, 0.4457571, 0.247196, 1, 1, 1, 1, 1,
0.3173303, 0.4457969, 0.7368707, 1, 1, 1, 1, 1,
0.3176275, -0.683465, 3.718445, 1, 1, 1, 1, 1,
0.3211317, 0.6860189, 2.268347, 1, 1, 1, 1, 1,
0.3235469, 0.5752217, -0.8284396, 1, 1, 1, 1, 1,
0.3354596, 0.07463571, -0.1408262, 1, 1, 1, 1, 1,
0.3358371, 0.6640782, -0.2689415, 1, 1, 1, 1, 1,
0.3392394, 0.4802896, -0.05983047, 1, 1, 1, 1, 1,
0.3401441, 0.5224996, -0.7516448, 1, 1, 1, 1, 1,
0.3415867, 0.07479525, 1.393556, 1, 1, 1, 1, 1,
0.3426361, 2.217298, -1.194134, 1, 1, 1, 1, 1,
0.3450652, 0.7991434, -0.1594959, 1, 1, 1, 1, 1,
0.3475096, 1.906467, 0.6840298, 1, 1, 1, 1, 1,
0.3498455, -0.8817757, 3.471012, 0, 0, 1, 1, 1,
0.3499369, -1.076901, 2.938432, 1, 0, 0, 1, 1,
0.3531267, 0.4474057, 0.7620125, 1, 0, 0, 1, 1,
0.3560258, -2.154051, 3.161278, 1, 0, 0, 1, 1,
0.3566928, 0.9192076, -0.177568, 1, 0, 0, 1, 1,
0.3603716, -0.08734788, 2.516815, 1, 0, 0, 1, 1,
0.3615152, 0.4125126, -0.8281965, 0, 0, 0, 1, 1,
0.3635643, -0.4531177, 0.9769168, 0, 0, 0, 1, 1,
0.3668922, -0.3641396, 2.893057, 0, 0, 0, 1, 1,
0.3671032, -0.1831822, -0.3199393, 0, 0, 0, 1, 1,
0.3680643, -1.610409, 2.506287, 0, 0, 0, 1, 1,
0.3698311, 0.1180395, 1.11035, 0, 0, 0, 1, 1,
0.3712792, 0.3059435, 1.227482, 0, 0, 0, 1, 1,
0.3734383, -0.1839069, 1.108027, 1, 1, 1, 1, 1,
0.3770453, -0.8647701, 4.265437, 1, 1, 1, 1, 1,
0.3780735, 0.3033731, 1.904106, 1, 1, 1, 1, 1,
0.3808077, -2.247329, 4.267769, 1, 1, 1, 1, 1,
0.3856477, -1.97025, 2.82622, 1, 1, 1, 1, 1,
0.3864498, 0.2072119, 2.207203, 1, 1, 1, 1, 1,
0.3904858, 1.457371, 0.8146821, 1, 1, 1, 1, 1,
0.390653, 0.05607042, 0.80163, 1, 1, 1, 1, 1,
0.3942188, -0.8856143, 5.422396, 1, 1, 1, 1, 1,
0.3942724, 0.6574415, 2.791393, 1, 1, 1, 1, 1,
0.3947821, -0.4196869, 0.4298769, 1, 1, 1, 1, 1,
0.4048386, -0.07913401, 1.497151, 1, 1, 1, 1, 1,
0.4049905, 1.310123, 1.50274, 1, 1, 1, 1, 1,
0.4057029, -1.344076, 3.695619, 1, 1, 1, 1, 1,
0.4064556, -0.764902, 2.076512, 1, 1, 1, 1, 1,
0.4077048, 1.130181, 0.9223764, 0, 0, 1, 1, 1,
0.4118725, -1.759533, 1.904001, 1, 0, 0, 1, 1,
0.4245502, 1.565738, 0.337866, 1, 0, 0, 1, 1,
0.429203, 1.178374, 0.1843143, 1, 0, 0, 1, 1,
0.4332097, -1.652777, 2.244297, 1, 0, 0, 1, 1,
0.4381047, -2.120527, 2.990213, 1, 0, 0, 1, 1,
0.4391747, 0.8617794, 1.344149, 0, 0, 0, 1, 1,
0.4414596, -1.181634, 2.495805, 0, 0, 0, 1, 1,
0.443105, 0.08561646, 0.5119192, 0, 0, 0, 1, 1,
0.4519087, 0.2638558, 0.501532, 0, 0, 0, 1, 1,
0.4523728, -0.8300308, 1.413093, 0, 0, 0, 1, 1,
0.4571024, 0.2479603, 0.08898141, 0, 0, 0, 1, 1,
0.458276, -0.100628, 0.9168838, 0, 0, 0, 1, 1,
0.4594181, 0.5283189, -0.9015833, 1, 1, 1, 1, 1,
0.4651771, -1.304745, 2.251994, 1, 1, 1, 1, 1,
0.4679914, -0.4717239, 2.841157, 1, 1, 1, 1, 1,
0.4686694, 1.452462, 0.9942599, 1, 1, 1, 1, 1,
0.4703982, -1.255504, 1.490878, 1, 1, 1, 1, 1,
0.4758473, -1.769953, 1.667047, 1, 1, 1, 1, 1,
0.477319, 2.520209, 0.5984387, 1, 1, 1, 1, 1,
0.4784534, -0.7239096, 3.779805, 1, 1, 1, 1, 1,
0.4804585, -0.6334738, 2.400976, 1, 1, 1, 1, 1,
0.481903, -0.566196, 1.671588, 1, 1, 1, 1, 1,
0.482282, 1.492896, 0.4792711, 1, 1, 1, 1, 1,
0.482412, -0.1101154, 1.201992, 1, 1, 1, 1, 1,
0.484004, -0.7640167, 2.609252, 1, 1, 1, 1, 1,
0.4917576, -0.2590923, 2.543348, 1, 1, 1, 1, 1,
0.4944405, 0.5304787, -1.135055, 1, 1, 1, 1, 1,
0.4962574, 0.07741015, 2.412583, 0, 0, 1, 1, 1,
0.4990469, 1.317395, -0.1690052, 1, 0, 0, 1, 1,
0.4996923, 1.239758, -0.3248419, 1, 0, 0, 1, 1,
0.5013719, -0.9026555, 3.472408, 1, 0, 0, 1, 1,
0.5035167, 0.7371711, 0.6275908, 1, 0, 0, 1, 1,
0.5054817, 0.7841276, 0.6128237, 1, 0, 0, 1, 1,
0.5058446, 0.0347262, 2.156226, 0, 0, 0, 1, 1,
0.5071588, 0.7351266, -0.01271892, 0, 0, 0, 1, 1,
0.5088641, -0.1165185, 1.19999, 0, 0, 0, 1, 1,
0.5091414, 1.140465, -1.319515, 0, 0, 0, 1, 1,
0.51034, 0.79547, 1.607854, 0, 0, 0, 1, 1,
0.5139477, 1.304095, 1.301222, 0, 0, 0, 1, 1,
0.5195821, 1.9205, -0.3699825, 0, 0, 0, 1, 1,
0.5232626, -0.07609462, 2.316231, 1, 1, 1, 1, 1,
0.5241059, -0.4389351, 2.984516, 1, 1, 1, 1, 1,
0.5297959, -0.7901202, 3.468982, 1, 1, 1, 1, 1,
0.5314423, -0.2420296, 3.776088, 1, 1, 1, 1, 1,
0.5322071, 1.026822, 2.41326, 1, 1, 1, 1, 1,
0.5325686, -1.522367, 2.215889, 1, 1, 1, 1, 1,
0.5357658, -0.4427979, 2.252225, 1, 1, 1, 1, 1,
0.5543395, -0.9424131, 2.445443, 1, 1, 1, 1, 1,
0.5589294, -0.589014, 3.705991, 1, 1, 1, 1, 1,
0.5591982, 0.5197963, 1.967632, 1, 1, 1, 1, 1,
0.5638474, -1.626663, 1.702642, 1, 1, 1, 1, 1,
0.5660832, 0.4192456, -0.04375188, 1, 1, 1, 1, 1,
0.5667356, -0.5355909, 3.387684, 1, 1, 1, 1, 1,
0.5694283, 1.335351, 0.6760361, 1, 1, 1, 1, 1,
0.5720971, 0.4074259, 1.511396, 1, 1, 1, 1, 1,
0.5798797, 0.9410801, -0.8161265, 0, 0, 1, 1, 1,
0.5845433, 1.074012, 0.5597433, 1, 0, 0, 1, 1,
0.5889424, -0.7918379, 1.700002, 1, 0, 0, 1, 1,
0.589654, -1.462289, 2.458001, 1, 0, 0, 1, 1,
0.5947375, 1.004311, 0.7492815, 1, 0, 0, 1, 1,
0.5974278, 0.8798984, 0.0100902, 1, 0, 0, 1, 1,
0.6067852, 0.8785415, 2.477025, 0, 0, 0, 1, 1,
0.6072015, 0.155605, 1.732225, 0, 0, 0, 1, 1,
0.6130704, -0.2251209, 1.50854, 0, 0, 0, 1, 1,
0.6175112, -0.4180574, 3.356346, 0, 0, 0, 1, 1,
0.6187562, -0.265793, -0.2313985, 0, 0, 0, 1, 1,
0.6207383, 0.6353121, 1.834486, 0, 0, 0, 1, 1,
0.6288918, -0.1860332, 3.268334, 0, 0, 0, 1, 1,
0.6313353, -0.7191091, 3.464619, 1, 1, 1, 1, 1,
0.635921, -1.310153, 1.963125, 1, 1, 1, 1, 1,
0.63619, -0.7587224, 2.080349, 1, 1, 1, 1, 1,
0.6379414, 1.600422, 0.6026766, 1, 1, 1, 1, 1,
0.6455193, -0.4513406, 1.718349, 1, 1, 1, 1, 1,
0.6457072, -0.1287871, 1.385818, 1, 1, 1, 1, 1,
0.6460369, -0.9151937, 2.117442, 1, 1, 1, 1, 1,
0.6558225, -0.9319119, 3.142594, 1, 1, 1, 1, 1,
0.65707, 1.42944, 0.6764233, 1, 1, 1, 1, 1,
0.6593373, 0.2781782, 3.862094, 1, 1, 1, 1, 1,
0.6652495, -0.8168748, 1.172177, 1, 1, 1, 1, 1,
0.6683461, -0.880171, -0.07090411, 1, 1, 1, 1, 1,
0.6693936, 1.314597, 0.6573101, 1, 1, 1, 1, 1,
0.6733126, -1.275912, 1.687903, 1, 1, 1, 1, 1,
0.6735204, 0.733854, 0.765872, 1, 1, 1, 1, 1,
0.6735404, 0.03749909, 2.387447, 0, 0, 1, 1, 1,
0.6742863, -0.4396449, 3.387424, 1, 0, 0, 1, 1,
0.6752866, 0.8824897, 2.24787, 1, 0, 0, 1, 1,
0.6777236, -0.9378371, 3.464693, 1, 0, 0, 1, 1,
0.6804533, -0.6913169, 2.600593, 1, 0, 0, 1, 1,
0.6852334, 0.3209159, 1.195227, 1, 0, 0, 1, 1,
0.6880101, 1.568214, -0.371321, 0, 0, 0, 1, 1,
0.6890126, -0.5243698, 2.10532, 0, 0, 0, 1, 1,
0.6916143, -0.8902192, 1.48828, 0, 0, 0, 1, 1,
0.6941451, -0.1047912, 3.890012, 0, 0, 0, 1, 1,
0.6974586, -0.4027824, 2.221567, 0, 0, 0, 1, 1,
0.6983655, 0.2821963, 1.646862, 0, 0, 0, 1, 1,
0.7017422, -0.5582299, 2.573308, 0, 0, 0, 1, 1,
0.7035776, -0.1539021, 1.649166, 1, 1, 1, 1, 1,
0.7039508, 0.2227944, 1.616467, 1, 1, 1, 1, 1,
0.7065389, -0.05902997, -0.4259719, 1, 1, 1, 1, 1,
0.7078577, -3.081912, 1.336107, 1, 1, 1, 1, 1,
0.7098417, 0.4737219, 1.938904, 1, 1, 1, 1, 1,
0.7098577, 0.7148185, 1.005774, 1, 1, 1, 1, 1,
0.7111073, -1.351724, 2.526777, 1, 1, 1, 1, 1,
0.7145795, 0.7374997, 0.7231493, 1, 1, 1, 1, 1,
0.7201434, -0.2893406, 1.257121, 1, 1, 1, 1, 1,
0.7209534, -1.47244, 1.975912, 1, 1, 1, 1, 1,
0.7236358, -1.104275, 3.064722, 1, 1, 1, 1, 1,
0.7264665, 0.3332327, 0.2644649, 1, 1, 1, 1, 1,
0.7276241, 1.342918, 2.606976, 1, 1, 1, 1, 1,
0.7348045, 0.6959026, 1.827993, 1, 1, 1, 1, 1,
0.7366452, -1.505851, 2.369023, 1, 1, 1, 1, 1,
0.7384543, 1.014159, 0.3540191, 0, 0, 1, 1, 1,
0.7472831, -0.4877201, 2.710375, 1, 0, 0, 1, 1,
0.7584318, 1.704125, 0.136756, 1, 0, 0, 1, 1,
0.763582, 0.4349558, 1.305325, 1, 0, 0, 1, 1,
0.7643295, -0.1411477, 0.6489199, 1, 0, 0, 1, 1,
0.765856, -3.1537, 4.86586, 1, 0, 0, 1, 1,
0.7658836, -0.7615597, 2.068493, 0, 0, 0, 1, 1,
0.7743238, -1.104458, 2.251316, 0, 0, 0, 1, 1,
0.7778993, 0.3498867, 2.196162, 0, 0, 0, 1, 1,
0.7813268, 0.5332121, 0.2018645, 0, 0, 0, 1, 1,
0.7849669, -1.118181, 3.473576, 0, 0, 0, 1, 1,
0.7867169, 1.035818, 1.132216, 0, 0, 0, 1, 1,
0.7943604, -0.2442454, 1.628504, 0, 0, 0, 1, 1,
0.7955387, -1.381873, 2.669725, 1, 1, 1, 1, 1,
0.7964624, 0.5559255, 0.7223333, 1, 1, 1, 1, 1,
0.7966462, -1.612344, 2.06814, 1, 1, 1, 1, 1,
0.7993888, 0.3973441, 1.296784, 1, 1, 1, 1, 1,
0.8009783, -1.591356, 3.699251, 1, 1, 1, 1, 1,
0.8011079, 0.1402389, 3.463157, 1, 1, 1, 1, 1,
0.8060175, -1.367358, 3.342877, 1, 1, 1, 1, 1,
0.807102, 1.078929, 0.1937446, 1, 1, 1, 1, 1,
0.8090342, 1.224417, 1.927547, 1, 1, 1, 1, 1,
0.8161328, 1.01466, 0.5226634, 1, 1, 1, 1, 1,
0.8201167, -0.3757639, 2.30355, 1, 1, 1, 1, 1,
0.8203943, 0.7166108, 2.32093, 1, 1, 1, 1, 1,
0.8207693, -0.3997418, 1.026089, 1, 1, 1, 1, 1,
0.8208225, 0.9820912, 0.8065552, 1, 1, 1, 1, 1,
0.8212346, -0.3615918, 4.115044, 1, 1, 1, 1, 1,
0.8216637, -1.381773, 3.135692, 0, 0, 1, 1, 1,
0.8248134, 0.1402702, 2.878783, 1, 0, 0, 1, 1,
0.8301114, 1.601425, 0.3300271, 1, 0, 0, 1, 1,
0.8302371, 1.419391, -0.06079375, 1, 0, 0, 1, 1,
0.8313323, -0.3510577, 1.772087, 1, 0, 0, 1, 1,
0.8332474, 0.8834791, -0.2596147, 1, 0, 0, 1, 1,
0.842603, -0.2064263, 1.407875, 0, 0, 0, 1, 1,
0.8481883, -0.8428981, 2.71225, 0, 0, 0, 1, 1,
0.8485392, 0.4584319, 0.6002047, 0, 0, 0, 1, 1,
0.857693, -1.005141, 3.515754, 0, 0, 0, 1, 1,
0.8606451, 1.36107, 1.514048, 0, 0, 0, 1, 1,
0.8652704, 2.16269, 0.62322, 0, 0, 0, 1, 1,
0.8714091, -0.3031363, 1.056113, 0, 0, 0, 1, 1,
0.8731235, 2.165649, 0.302797, 1, 1, 1, 1, 1,
0.8773512, -1.099647, 3.23264, 1, 1, 1, 1, 1,
0.8794408, -1.829989, 3.168306, 1, 1, 1, 1, 1,
0.8812766, 0.5923893, 1.905235, 1, 1, 1, 1, 1,
0.8822341, -0.5420217, 1.801336, 1, 1, 1, 1, 1,
0.8938961, -1.600902, 2.630946, 1, 1, 1, 1, 1,
0.8960092, 1.570258, -0.02728873, 1, 1, 1, 1, 1,
0.8960318, -0.2979096, 0.1279973, 1, 1, 1, 1, 1,
0.9019726, 0.5205611, 2.268507, 1, 1, 1, 1, 1,
0.9064422, 1.518668, 0.2615075, 1, 1, 1, 1, 1,
0.9149042, 0.8510014, 1.094288, 1, 1, 1, 1, 1,
0.9214326, 0.1052305, 2.38512, 1, 1, 1, 1, 1,
0.9236524, 1.755556, 1.684375, 1, 1, 1, 1, 1,
0.9344684, -1.487973, 2.574393, 1, 1, 1, 1, 1,
0.9385645, -0.06726151, 0.1334318, 1, 1, 1, 1, 1,
0.9403413, -1.882094, 3.511288, 0, 0, 1, 1, 1,
0.9414746, 0.3060849, 0.2126113, 1, 0, 0, 1, 1,
0.9501589, -0.5101103, 2.141525, 1, 0, 0, 1, 1,
0.9554492, 0.3831941, 0.4317277, 1, 0, 0, 1, 1,
0.9613941, 0.4615039, 1.274632, 1, 0, 0, 1, 1,
0.9618157, 0.2935512, 1.611095, 1, 0, 0, 1, 1,
0.9670913, -0.4334432, 0.6422673, 0, 0, 0, 1, 1,
0.9716819, 0.08874626, 2.366721, 0, 0, 0, 1, 1,
0.9760834, -1.365416, 1.446984, 0, 0, 0, 1, 1,
0.982656, 0.9346107, -0.03503494, 0, 0, 0, 1, 1,
0.9828691, 0.9484846, 1.594912, 0, 0, 0, 1, 1,
0.9842283, 0.6903275, 1.129476, 0, 0, 0, 1, 1,
0.985609, -0.4104243, 2.333589, 0, 0, 0, 1, 1,
0.993198, 0.2808976, -0.5825976, 1, 1, 1, 1, 1,
0.9972823, -1.049058, 2.939284, 1, 1, 1, 1, 1,
1.001824, 0.5379017, -0.009563023, 1, 1, 1, 1, 1,
1.003738, 1.255147, -0.9755619, 1, 1, 1, 1, 1,
1.005843, 0.2106187, 2.223516, 1, 1, 1, 1, 1,
1.009299, -1.320245, 3.745697, 1, 1, 1, 1, 1,
1.016535, 1.304087, 0.8141921, 1, 1, 1, 1, 1,
1.01734, 1.606067, 0.466142, 1, 1, 1, 1, 1,
1.017504, -0.6353971, 2.26358, 1, 1, 1, 1, 1,
1.019018, -0.8462686, 2.918439, 1, 1, 1, 1, 1,
1.01961, 1.551892, 0.6072126, 1, 1, 1, 1, 1,
1.021538, -0.4172835, 2.304365, 1, 1, 1, 1, 1,
1.024545, 0.2805546, 1.455286, 1, 1, 1, 1, 1,
1.029293, 2.527852, 0.9917341, 1, 1, 1, 1, 1,
1.029562, 0.002337152, 2.142583, 1, 1, 1, 1, 1,
1.029571, -1.350464, 5.532888, 0, 0, 1, 1, 1,
1.036876, 1.552218, -1.562761, 1, 0, 0, 1, 1,
1.037177, 1.438484, 1.191253, 1, 0, 0, 1, 1,
1.041258, -0.3529741, 1.719402, 1, 0, 0, 1, 1,
1.05545, -1.6764, 1.931637, 1, 0, 0, 1, 1,
1.060623, 0.3686368, 0.6144502, 1, 0, 0, 1, 1,
1.065881, 0.248847, 0.8190643, 0, 0, 0, 1, 1,
1.069098, -1.516212, 2.249056, 0, 0, 0, 1, 1,
1.078782, 0.3128438, 0.7104743, 0, 0, 0, 1, 1,
1.082111, -0.2087906, 0.153861, 0, 0, 0, 1, 1,
1.101131, -0.5632154, 2.620049, 0, 0, 0, 1, 1,
1.11036, 0.1696116, -0.07400294, 0, 0, 0, 1, 1,
1.116471, 0.4129052, -0.4618853, 0, 0, 0, 1, 1,
1.116681, 2.629549, 1.957812, 1, 1, 1, 1, 1,
1.123173, -0.8988581, 0.5190015, 1, 1, 1, 1, 1,
1.125843, 0.1167288, -0.266412, 1, 1, 1, 1, 1,
1.13179, 1.4296, 1.9939, 1, 1, 1, 1, 1,
1.141898, -0.2142141, 2.075399, 1, 1, 1, 1, 1,
1.143776, 1.148248, 0.6077409, 1, 1, 1, 1, 1,
1.145731, -0.1588573, 1.720916, 1, 1, 1, 1, 1,
1.146987, 2.00363, 1.565626, 1, 1, 1, 1, 1,
1.148732, -0.08687852, 1.148107, 1, 1, 1, 1, 1,
1.152626, -0.7147712, 3.111617, 1, 1, 1, 1, 1,
1.161318, -0.1477866, 2.730151, 1, 1, 1, 1, 1,
1.165491, 0.9386709, 1.858428, 1, 1, 1, 1, 1,
1.166052, 0.9153501, 3.530371, 1, 1, 1, 1, 1,
1.225631, -0.9295379, 2.270421, 1, 1, 1, 1, 1,
1.231861, 1.278516, 0.7595052, 1, 1, 1, 1, 1,
1.245581, -0.1047439, -1.163346, 0, 0, 1, 1, 1,
1.248238, 0.6468452, -0.2847793, 1, 0, 0, 1, 1,
1.2533, -0.9553159, 1.27016, 1, 0, 0, 1, 1,
1.268274, -1.415061, 1.835268, 1, 0, 0, 1, 1,
1.269514, 0.4213212, 2.436326, 1, 0, 0, 1, 1,
1.289219, -1.125718, 4.215149, 1, 0, 0, 1, 1,
1.302867, 1.062449, -0.4166201, 0, 0, 0, 1, 1,
1.304555, -1.533404, 1.616302, 0, 0, 0, 1, 1,
1.305075, -1.276253, 2.544775, 0, 0, 0, 1, 1,
1.306266, 0.6661024, 2.224826, 0, 0, 0, 1, 1,
1.306824, 0.6456684, 0.9551144, 0, 0, 0, 1, 1,
1.309073, 1.457558, 1.899371, 0, 0, 0, 1, 1,
1.318833, 0.6681369, 1.39167, 0, 0, 0, 1, 1,
1.332435, -0.5540775, 1.814412, 1, 1, 1, 1, 1,
1.336278, -0.7876499, 0.476995, 1, 1, 1, 1, 1,
1.339377, -1.026986, 2.598266, 1, 1, 1, 1, 1,
1.341224, 0.6658998, 0.9010078, 1, 1, 1, 1, 1,
1.349398, 0.3307756, 0.7600378, 1, 1, 1, 1, 1,
1.352955, -0.1593982, 3.823264, 1, 1, 1, 1, 1,
1.360684, -0.2651645, 0.8434865, 1, 1, 1, 1, 1,
1.384194, -0.2470172, 1.047779, 1, 1, 1, 1, 1,
1.389285, 1.451685, 0.7629952, 1, 1, 1, 1, 1,
1.391989, -0.1633248, 1.894088, 1, 1, 1, 1, 1,
1.392538, -1.897226, 3.185657, 1, 1, 1, 1, 1,
1.397172, -2.0984, 4.08497, 1, 1, 1, 1, 1,
1.39839, 1.875436, 1.162145, 1, 1, 1, 1, 1,
1.399773, 3.023424, -0.5743376, 1, 1, 1, 1, 1,
1.411263, -0.2216232, 1.99696, 1, 1, 1, 1, 1,
1.417945, -0.6623498, 3.045476, 0, 0, 1, 1, 1,
1.430345, 0.3744398, 2.608037, 1, 0, 0, 1, 1,
1.434185, -0.6035058, 3.520947, 1, 0, 0, 1, 1,
1.435852, 0.04578909, 0.4748554, 1, 0, 0, 1, 1,
1.438093, 0.197132, 1.754809, 1, 0, 0, 1, 1,
1.456462, 0.8702407, 0.3789178, 1, 0, 0, 1, 1,
1.457245, -0.1800241, 1.925571, 0, 0, 0, 1, 1,
1.476436, 0.2305555, -0.1870064, 0, 0, 0, 1, 1,
1.488655, -0.8544998, 2.365301, 0, 0, 0, 1, 1,
1.494447, -0.1611811, 3.108847, 0, 0, 0, 1, 1,
1.500385, 0.5539659, 2.503615, 0, 0, 0, 1, 1,
1.501132, -0.3447594, 2.080413, 0, 0, 0, 1, 1,
1.508934, -0.1504528, 2.565386, 0, 0, 0, 1, 1,
1.513, -0.9395957, 1.776529, 1, 1, 1, 1, 1,
1.51882, 1.599281, -0.03249262, 1, 1, 1, 1, 1,
1.533106, -0.3650766, 0.945401, 1, 1, 1, 1, 1,
1.535962, -0.1754664, 2.313298, 1, 1, 1, 1, 1,
1.541756, -0.5072069, 2.289252, 1, 1, 1, 1, 1,
1.552043, -1.011671, 2.091075, 1, 1, 1, 1, 1,
1.565142, 0.3819099, 1.782822, 1, 1, 1, 1, 1,
1.57752, -0.3639323, 0.5261037, 1, 1, 1, 1, 1,
1.592151, 0.1647039, 0.4649637, 1, 1, 1, 1, 1,
1.593701, -0.512715, 2.883026, 1, 1, 1, 1, 1,
1.609288, 0.9944397, 2.302573, 1, 1, 1, 1, 1,
1.610101, 0.9373567, 1.387358, 1, 1, 1, 1, 1,
1.62006, 0.4428528, 3.116155, 1, 1, 1, 1, 1,
1.623841, 1.065708, 0.7053189, 1, 1, 1, 1, 1,
1.626466, -0.7796886, 1.224323, 1, 1, 1, 1, 1,
1.63952, -0.7689911, 1.310742, 0, 0, 1, 1, 1,
1.644505, 0.623747, -0.8846133, 1, 0, 0, 1, 1,
1.644511, -0.50702, 1.593121, 1, 0, 0, 1, 1,
1.65043, -1.055264, 4.104764, 1, 0, 0, 1, 1,
1.654786, -0.2033581, 3.204006, 1, 0, 0, 1, 1,
1.668818, 0.4545587, 0.7229936, 1, 0, 0, 1, 1,
1.672107, -0.128922, 1.406847, 0, 0, 0, 1, 1,
1.6815, 0.7326643, 0.439154, 0, 0, 0, 1, 1,
1.688914, 0.3254995, 2.406371, 0, 0, 0, 1, 1,
1.689828, 0.5972412, 2.637548, 0, 0, 0, 1, 1,
1.702899, -0.04862159, 2.011511, 0, 0, 0, 1, 1,
1.704586, -0.5792879, 0.8542259, 0, 0, 0, 1, 1,
1.73296, 1.400554, 2.639645, 0, 0, 0, 1, 1,
1.749404, -0.3902487, 0.9178969, 1, 1, 1, 1, 1,
1.752471, -0.419032, 1.497388, 1, 1, 1, 1, 1,
1.758169, 0.2039665, 1.532982, 1, 1, 1, 1, 1,
1.789042, -0.03225577, 2.046615, 1, 1, 1, 1, 1,
1.824585, 1.745758, 0.8711064, 1, 1, 1, 1, 1,
1.850093, 0.8402436, 1.838903, 1, 1, 1, 1, 1,
1.86116, -0.4766468, 2.61639, 1, 1, 1, 1, 1,
1.877124, -0.1497353, 0.7161586, 1, 1, 1, 1, 1,
1.901142, -1.846723, 2.972178, 1, 1, 1, 1, 1,
1.90712, -0.7834007, 1.375853, 1, 1, 1, 1, 1,
1.919073, -0.1281198, 1.488227, 1, 1, 1, 1, 1,
1.951027, 0.01259566, 1.465363, 1, 1, 1, 1, 1,
1.958545, 0.2818844, 1.747867, 1, 1, 1, 1, 1,
2.002566, 0.3059525, 2.995666, 1, 1, 1, 1, 1,
2.020529, -0.2463659, 2.393344, 1, 1, 1, 1, 1,
2.057844, -0.4730284, 2.757833, 0, 0, 1, 1, 1,
2.062448, -0.4158356, 2.730263, 1, 0, 0, 1, 1,
2.066474, -1.178015, 1.555552, 1, 0, 0, 1, 1,
2.076296, -0.5769053, 1.937207, 1, 0, 0, 1, 1,
2.095794, 0.3153061, 1.965017, 1, 0, 0, 1, 1,
2.117218, 1.842394, 1.122201, 1, 0, 0, 1, 1,
2.120612, 0.4094848, -0.580631, 0, 0, 0, 1, 1,
2.162968, -1.116126, 3.108195, 0, 0, 0, 1, 1,
2.16417, -0.2751021, 1.372285, 0, 0, 0, 1, 1,
2.172202, -0.4792899, 1.882456, 0, 0, 0, 1, 1,
2.205681, -2.170867, 1.064416, 0, 0, 0, 1, 1,
2.294557, 1.403579, 1.412941, 0, 0, 0, 1, 1,
2.31706, 0.6803787, 0.9408193, 0, 0, 0, 1, 1,
2.385499, 0.2782804, 1.873647, 1, 1, 1, 1, 1,
2.396974, -0.8945069, 0.6055481, 1, 1, 1, 1, 1,
2.52609, -1.453306, 4.011412, 1, 1, 1, 1, 1,
2.542982, 0.359604, 1.914139, 1, 1, 1, 1, 1,
2.626354, 1.324107, 0.1745242, 1, 1, 1, 1, 1,
2.631263, -1.265821, 1.262094, 1, 1, 1, 1, 1,
2.659807, 0.7269675, 0.5401242, 1, 1, 1, 1, 1
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
var radius = 9.511629;
var distance = 33.40919;
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
mvMatrix.translate( 0.3165015, 0.06513834, -0.03349423 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.40919);
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
