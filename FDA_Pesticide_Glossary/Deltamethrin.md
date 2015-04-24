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
-2.932335, -0.9452196, -2.428989, 1, 0, 0, 1,
-2.892382, 0.09357829, -0.4712904, 1, 0.007843138, 0, 1,
-2.779344, -0.9442446, -3.870282, 1, 0.01176471, 0, 1,
-2.674637, -0.01688536, -1.877247, 1, 0.01960784, 0, 1,
-2.39596, -0.4684587, -1.747361, 1, 0.02352941, 0, 1,
-2.369408, -1.050467, -2.523333, 1, 0.03137255, 0, 1,
-2.26466, -2.096365, -3.146994, 1, 0.03529412, 0, 1,
-2.194513, 0.04215941, -1.75374, 1, 0.04313726, 0, 1,
-2.111011, 0.411182, -2.317812, 1, 0.04705882, 0, 1,
-2.107812, 0.07417578, -1.76772, 1, 0.05490196, 0, 1,
-2.042398, 1.01186, 0.9789422, 1, 0.05882353, 0, 1,
-2.031123, 0.5670455, -0.2716598, 1, 0.06666667, 0, 1,
-2.023366, 0.5234864, -1.541503, 1, 0.07058824, 0, 1,
-2.022771, -0.7698929, -1.815021, 1, 0.07843138, 0, 1,
-1.995784, -0.4899624, -1.856961, 1, 0.08235294, 0, 1,
-1.993605, -0.4003625, -1.685962, 1, 0.09019608, 0, 1,
-1.974357, -1.123, -1.177231, 1, 0.09411765, 0, 1,
-1.962806, 0.3250149, -1.696346, 1, 0.1019608, 0, 1,
-1.948126, -0.4034712, -2.872541, 1, 0.1098039, 0, 1,
-1.922943, 0.1389669, -0.3685449, 1, 0.1137255, 0, 1,
-1.920611, 2.528715, -0.4031796, 1, 0.1215686, 0, 1,
-1.914282, 0.09963495, -0.8738959, 1, 0.1254902, 0, 1,
-1.912822, 1.760998, 0.6038223, 1, 0.1333333, 0, 1,
-1.888752, 0.9699163, -2.545353, 1, 0.1372549, 0, 1,
-1.829165, -0.7485386, -0.9069195, 1, 0.145098, 0, 1,
-1.828767, 0.6099631, -1.825599, 1, 0.1490196, 0, 1,
-1.818378, 2.432076, 1.101631, 1, 0.1568628, 0, 1,
-1.798939, 1.058608, -0.05171501, 1, 0.1607843, 0, 1,
-1.79219, -0.5176237, -1.15019, 1, 0.1686275, 0, 1,
-1.789942, -0.5344963, -1.943714, 1, 0.172549, 0, 1,
-1.789878, 1.223006, 0.8961825, 1, 0.1803922, 0, 1,
-1.785449, -0.5190583, -1.553455, 1, 0.1843137, 0, 1,
-1.782493, 0.5265214, -2.139266, 1, 0.1921569, 0, 1,
-1.773445, 1.889907, -0.8218934, 1, 0.1960784, 0, 1,
-1.75106, 0.6434192, -0.9760549, 1, 0.2039216, 0, 1,
-1.743484, 1.994887, -1.019514, 1, 0.2117647, 0, 1,
-1.736506, 1.002814, 0.5950052, 1, 0.2156863, 0, 1,
-1.716224, -0.2959238, -3.355181, 1, 0.2235294, 0, 1,
-1.700489, 1.514348, -1.264277, 1, 0.227451, 0, 1,
-1.683328, 1.475368, 0.4645532, 1, 0.2352941, 0, 1,
-1.677014, -0.5453318, -0.09344142, 1, 0.2392157, 0, 1,
-1.675752, -1.651248, -1.285047, 1, 0.2470588, 0, 1,
-1.670839, 0.5159567, -1.715776, 1, 0.2509804, 0, 1,
-1.658834, -1.801305, -1.246664, 1, 0.2588235, 0, 1,
-1.653632, 0.2769997, 0.9859982, 1, 0.2627451, 0, 1,
-1.652587, -0.02195116, -1.076572, 1, 0.2705882, 0, 1,
-1.652078, -0.3260888, -4.086031, 1, 0.2745098, 0, 1,
-1.643762, 0.3752246, -1.227202, 1, 0.282353, 0, 1,
-1.63741, -1.260012, -3.999065, 1, 0.2862745, 0, 1,
-1.635973, 1.076448, 0.6331376, 1, 0.2941177, 0, 1,
-1.628689, -0.2443188, -0.1765445, 1, 0.3019608, 0, 1,
-1.612562, -0.3119172, -1.2569, 1, 0.3058824, 0, 1,
-1.589363, -0.271021, -1.813244, 1, 0.3137255, 0, 1,
-1.586451, -2.040526, -4.279192, 1, 0.3176471, 0, 1,
-1.585705, 0.641023, -3.604679, 1, 0.3254902, 0, 1,
-1.580562, -1.54831, -3.568107, 1, 0.3294118, 0, 1,
-1.572924, -0.7843951, -3.867185, 1, 0.3372549, 0, 1,
-1.541631, -1.996783, -2.8684, 1, 0.3411765, 0, 1,
-1.537881, 0.2942977, -1.7048, 1, 0.3490196, 0, 1,
-1.530404, 1.847801, 0.8453063, 1, 0.3529412, 0, 1,
-1.52987, -0.8500881, -1.558601, 1, 0.3607843, 0, 1,
-1.529765, 0.5164587, -3.117915, 1, 0.3647059, 0, 1,
-1.528791, -1.149323, -1.833765, 1, 0.372549, 0, 1,
-1.527871, 1.489358, -0.9389663, 1, 0.3764706, 0, 1,
-1.519144, -0.6126135, -1.501709, 1, 0.3843137, 0, 1,
-1.517867, -0.3577874, -0.7774493, 1, 0.3882353, 0, 1,
-1.502097, 0.5327461, -1.690712, 1, 0.3960784, 0, 1,
-1.492031, -1.477848, -2.925952, 1, 0.4039216, 0, 1,
-1.486619, 0.963293, -1.109885, 1, 0.4078431, 0, 1,
-1.485489, 1.319823, 0.08039691, 1, 0.4156863, 0, 1,
-1.482427, -0.08039407, -1.267571, 1, 0.4196078, 0, 1,
-1.479549, 0.05537405, -1.63449, 1, 0.427451, 0, 1,
-1.474372, -0.141658, -1.611755, 1, 0.4313726, 0, 1,
-1.470251, 0.0430735, -2.394678, 1, 0.4392157, 0, 1,
-1.468488, 1.376653, -0.8042854, 1, 0.4431373, 0, 1,
-1.462919, 0.2944648, -1.853457, 1, 0.4509804, 0, 1,
-1.448515, -1.716612, -1.691176, 1, 0.454902, 0, 1,
-1.442859, 1.493412, -0.9059461, 1, 0.4627451, 0, 1,
-1.437066, -0.2169511, -3.11466, 1, 0.4666667, 0, 1,
-1.430338, 0.3701203, -1.781283, 1, 0.4745098, 0, 1,
-1.427464, 0.4895263, -2.12105, 1, 0.4784314, 0, 1,
-1.426641, 0.5123331, -1.493911, 1, 0.4862745, 0, 1,
-1.423327, -0.1251686, -0.2842603, 1, 0.4901961, 0, 1,
-1.418864, 1.363221, 0.165023, 1, 0.4980392, 0, 1,
-1.399608, -2.08441, -2.806589, 1, 0.5058824, 0, 1,
-1.396434, -1.687588, -3.503503, 1, 0.509804, 0, 1,
-1.390172, 0.375848, 0.1784976, 1, 0.5176471, 0, 1,
-1.381482, 0.9842115, -2.123324, 1, 0.5215687, 0, 1,
-1.374419, 0.2807666, -1.687891, 1, 0.5294118, 0, 1,
-1.366212, 0.9898539, 0.526312, 1, 0.5333334, 0, 1,
-1.337817, 1.023643, -1.774673, 1, 0.5411765, 0, 1,
-1.333782, -0.3844947, -2.510849, 1, 0.5450981, 0, 1,
-1.328872, 1.295865, -1.274135, 1, 0.5529412, 0, 1,
-1.321427, 1.448739, -0.1559072, 1, 0.5568628, 0, 1,
-1.319938, 0.00311335, -1.450945, 1, 0.5647059, 0, 1,
-1.319633, -1.164427, 0.7353804, 1, 0.5686275, 0, 1,
-1.307298, 1.563792, -2.479274, 1, 0.5764706, 0, 1,
-1.304018, 1.937424, -0.465362, 1, 0.5803922, 0, 1,
-1.303968, 0.1015113, -1.14255, 1, 0.5882353, 0, 1,
-1.30344, 1.19075, -0.3915932, 1, 0.5921569, 0, 1,
-1.299164, 0.4363098, -0.5741072, 1, 0.6, 0, 1,
-1.297151, -0.9415773, -1.673672, 1, 0.6078432, 0, 1,
-1.281509, -1.344341, -2.977682, 1, 0.6117647, 0, 1,
-1.278573, 1.055712, -1.541158, 1, 0.6196079, 0, 1,
-1.275428, 0.5156206, -2.590075, 1, 0.6235294, 0, 1,
-1.274932, 1.921203, -0.5478264, 1, 0.6313726, 0, 1,
-1.274155, -1.702196, -2.727254, 1, 0.6352941, 0, 1,
-1.265853, -0.8973506, -0.7209455, 1, 0.6431373, 0, 1,
-1.265489, 0.9264016, -0.08623382, 1, 0.6470588, 0, 1,
-1.261828, -0.5665784, -2.944907, 1, 0.654902, 0, 1,
-1.259846, -1.136764, -1.062365, 1, 0.6588235, 0, 1,
-1.247323, 0.9626279, 0.5206379, 1, 0.6666667, 0, 1,
-1.245848, 0.9865544, -0.4195556, 1, 0.6705883, 0, 1,
-1.239938, -1.637923, -1.032495, 1, 0.6784314, 0, 1,
-1.236388, -2.82144, -2.295769, 1, 0.682353, 0, 1,
-1.234829, 0.3956629, -0.2333694, 1, 0.6901961, 0, 1,
-1.232912, -2.233405, -2.269649, 1, 0.6941177, 0, 1,
-1.231778, -0.3729934, -3.207108, 1, 0.7019608, 0, 1,
-1.229952, -1.393191, -2.509208, 1, 0.7098039, 0, 1,
-1.221898, 0.2607518, -0.7040802, 1, 0.7137255, 0, 1,
-1.205056, 0.7872131, -1.515594, 1, 0.7215686, 0, 1,
-1.202566, 0.0003755784, -0.6243185, 1, 0.7254902, 0, 1,
-1.199068, 0.4143454, -1.888257, 1, 0.7333333, 0, 1,
-1.197335, 0.196528, 0.1258734, 1, 0.7372549, 0, 1,
-1.197176, 0.02734379, -4.239837, 1, 0.7450981, 0, 1,
-1.194583, 1.573935, -0.06965581, 1, 0.7490196, 0, 1,
-1.177111, -0.2391298, -2.323795, 1, 0.7568628, 0, 1,
-1.166007, 0.1868399, -2.498426, 1, 0.7607843, 0, 1,
-1.138014, 1.211377, -0.9023085, 1, 0.7686275, 0, 1,
-1.137989, 0.2347453, -0.7156345, 1, 0.772549, 0, 1,
-1.125142, -1.480992, -0.9774891, 1, 0.7803922, 0, 1,
-1.117093, 0.1181342, -2.036871, 1, 0.7843137, 0, 1,
-1.115697, 0.08113017, -2.190181, 1, 0.7921569, 0, 1,
-1.112807, 1.240468, 1.154747, 1, 0.7960784, 0, 1,
-1.106098, -0.5220026, -1.810625, 1, 0.8039216, 0, 1,
-1.100566, 0.1914446, -0.2829546, 1, 0.8117647, 0, 1,
-1.096466, -1.023174, -2.460243, 1, 0.8156863, 0, 1,
-1.089677, 0.7979054, -1.038811, 1, 0.8235294, 0, 1,
-1.088948, -0.6878315, -2.566369, 1, 0.827451, 0, 1,
-1.08584, -0.4578089, -1.858957, 1, 0.8352941, 0, 1,
-1.084824, 0.3459174, 0.2669394, 1, 0.8392157, 0, 1,
-1.077405, -0.5863847, -2.775881, 1, 0.8470588, 0, 1,
-1.075294, 0.2113784, -1.331617, 1, 0.8509804, 0, 1,
-1.068152, -0.5719373, -2.312994, 1, 0.8588235, 0, 1,
-1.065731, -1.731973, -3.411958, 1, 0.8627451, 0, 1,
-1.06171, 0.8951699, -1.700251, 1, 0.8705882, 0, 1,
-1.059333, 0.7703634, -1.880782, 1, 0.8745098, 0, 1,
-1.055656, -0.8293557, -3.302227, 1, 0.8823529, 0, 1,
-1.055282, 1.489801, -0.6784556, 1, 0.8862745, 0, 1,
-1.047053, 0.1977906, -0.8317616, 1, 0.8941177, 0, 1,
-1.046793, 0.1107925, -1.828926, 1, 0.8980392, 0, 1,
-1.042365, 1.083704, -1.762749, 1, 0.9058824, 0, 1,
-1.04089, 0.4318991, -0.3245862, 1, 0.9137255, 0, 1,
-1.03649, 0.07217512, -2.719647, 1, 0.9176471, 0, 1,
-1.019795, 1.018598, 0.1926384, 1, 0.9254902, 0, 1,
-1.016502, -0.2268462, -2.391784, 1, 0.9294118, 0, 1,
-1.016318, -0.6158215, -2.890055, 1, 0.9372549, 0, 1,
-1.005329, 0.6513824, -1.607522, 1, 0.9411765, 0, 1,
-0.9901924, -0.995303, -4.325309, 1, 0.9490196, 0, 1,
-0.9821129, -0.4948483, -3.340583, 1, 0.9529412, 0, 1,
-0.9778856, -0.02757357, -1.346259, 1, 0.9607843, 0, 1,
-0.9755744, -0.2097958, -1.015147, 1, 0.9647059, 0, 1,
-0.9723279, 0.7745494, 0.1225015, 1, 0.972549, 0, 1,
-0.9691908, -1.041153, -2.493524, 1, 0.9764706, 0, 1,
-0.963572, -0.1794691, -0.09312913, 1, 0.9843137, 0, 1,
-0.9586358, 1.30403, 0.6996662, 1, 0.9882353, 0, 1,
-0.9579726, -1.148214, -2.473308, 1, 0.9960784, 0, 1,
-0.9493366, 0.8642253, -1.841378, 0.9960784, 1, 0, 1,
-0.946305, 0.3627018, -1.030596, 0.9921569, 1, 0, 1,
-0.9449365, -0.5018548, -3.284555, 0.9843137, 1, 0, 1,
-0.9412983, 1.390619, 0.05769442, 0.9803922, 1, 0, 1,
-0.9402488, -0.08819737, -1.280026, 0.972549, 1, 0, 1,
-0.9316652, 0.5501822, -1.432616, 0.9686275, 1, 0, 1,
-0.9300087, 0.3425483, -2.172333, 0.9607843, 1, 0, 1,
-0.9269478, -1.813351, -4.858759, 0.9568627, 1, 0, 1,
-0.9251329, 1.828734, 0.505248, 0.9490196, 1, 0, 1,
-0.9235807, -0.002352324, -1.399005, 0.945098, 1, 0, 1,
-0.9166953, -1.068329, -2.558784, 0.9372549, 1, 0, 1,
-0.9166284, 0.482406, 0.136367, 0.9333333, 1, 0, 1,
-0.9134677, 0.2179722, -1.038996, 0.9254902, 1, 0, 1,
-0.9115639, -0.9668624, -2.138139, 0.9215686, 1, 0, 1,
-0.9033892, -0.8517724, -0.7902635, 0.9137255, 1, 0, 1,
-0.8955266, -0.403679, -1.578188, 0.9098039, 1, 0, 1,
-0.8905848, 0.1024114, -1.523423, 0.9019608, 1, 0, 1,
-0.8849313, -0.7950137, -1.796596, 0.8941177, 1, 0, 1,
-0.8815003, 0.2838886, -1.495159, 0.8901961, 1, 0, 1,
-0.8813583, 0.1373738, -1.670599, 0.8823529, 1, 0, 1,
-0.8736994, 1.460414, -0.1907513, 0.8784314, 1, 0, 1,
-0.86993, -0.1238436, -1.229267, 0.8705882, 1, 0, 1,
-0.8645536, -0.6403456, -1.175225, 0.8666667, 1, 0, 1,
-0.8538604, 1.244236, -0.008110525, 0.8588235, 1, 0, 1,
-0.8492485, 1.131181, -1.671221, 0.854902, 1, 0, 1,
-0.8492365, 0.8167824, -1.576716, 0.8470588, 1, 0, 1,
-0.8458692, -0.007825417, -1.748403, 0.8431373, 1, 0, 1,
-0.8448241, -0.7941317, -1.476418, 0.8352941, 1, 0, 1,
-0.8440402, 0.6075861, -1.496434, 0.8313726, 1, 0, 1,
-0.8366559, -0.496954, -2.580572, 0.8235294, 1, 0, 1,
-0.8328148, 0.4585708, -2.464356, 0.8196079, 1, 0, 1,
-0.8259474, 1.420888, -1.320616, 0.8117647, 1, 0, 1,
-0.8235913, -1.61079, -4.102013, 0.8078431, 1, 0, 1,
-0.8203962, -1.229827, -2.34708, 0.8, 1, 0, 1,
-0.8172408, 0.2951159, -1.005065, 0.7921569, 1, 0, 1,
-0.7907559, -0.2460417, -1.834685, 0.7882353, 1, 0, 1,
-0.7837732, 1.548916, -1.866688, 0.7803922, 1, 0, 1,
-0.7811497, -1.203755, -3.522947, 0.7764706, 1, 0, 1,
-0.7767352, -2.103354, -2.932838, 0.7686275, 1, 0, 1,
-0.7763532, -2.131327, -3.175602, 0.7647059, 1, 0, 1,
-0.773441, -0.2249475, -1.62802, 0.7568628, 1, 0, 1,
-0.7713693, -0.5971432, -2.728006, 0.7529412, 1, 0, 1,
-0.7643834, -1.004669, -1.453101, 0.7450981, 1, 0, 1,
-0.7621213, 0.6765364, 0.01688552, 0.7411765, 1, 0, 1,
-0.7534471, -0.3404433, -1.512422, 0.7333333, 1, 0, 1,
-0.7517791, 0.06089573, -1.803054, 0.7294118, 1, 0, 1,
-0.7509302, -0.2747363, -2.163358, 0.7215686, 1, 0, 1,
-0.7502604, -0.1190629, -2.217444, 0.7176471, 1, 0, 1,
-0.7502073, -1.592914, -2.742571, 0.7098039, 1, 0, 1,
-0.7425729, 1.258487, -1.113478, 0.7058824, 1, 0, 1,
-0.7405089, 1.365259, 0.2846471, 0.6980392, 1, 0, 1,
-0.7354521, -1.576953, -2.906988, 0.6901961, 1, 0, 1,
-0.731574, -1.269931, -2.30344, 0.6862745, 1, 0, 1,
-0.7276618, 0.1010639, -1.786037, 0.6784314, 1, 0, 1,
-0.7233628, -0.5566183, -2.097897, 0.6745098, 1, 0, 1,
-0.7196165, 2.19968, -1.575538, 0.6666667, 1, 0, 1,
-0.7171078, 0.06711285, 0.5831305, 0.6627451, 1, 0, 1,
-0.7165632, 1.623941, 1.863248, 0.654902, 1, 0, 1,
-0.7159151, 0.935652, -0.4280035, 0.6509804, 1, 0, 1,
-0.7137417, 1.580603, 0.2704469, 0.6431373, 1, 0, 1,
-0.7113125, 0.1176125, -0.5586379, 0.6392157, 1, 0, 1,
-0.7082214, -1.38512, -2.76522, 0.6313726, 1, 0, 1,
-0.706972, 0.4994127, 0.224503, 0.627451, 1, 0, 1,
-0.7020856, 1.19865, -0.1646923, 0.6196079, 1, 0, 1,
-0.6974187, 0.1289383, -0.4372519, 0.6156863, 1, 0, 1,
-0.6966512, 0.1500563, -0.5068715, 0.6078432, 1, 0, 1,
-0.6960244, 2.659022, -0.7828362, 0.6039216, 1, 0, 1,
-0.6956589, 0.6470917, -1.318562, 0.5960785, 1, 0, 1,
-0.6949945, 0.3821974, -1.61864, 0.5882353, 1, 0, 1,
-0.6897348, 0.7356811, -1.480782, 0.5843138, 1, 0, 1,
-0.6891353, 1.395155, 0.6154498, 0.5764706, 1, 0, 1,
-0.684159, 1.79011, 0.6641099, 0.572549, 1, 0, 1,
-0.6817102, 1.283576, -1.345289, 0.5647059, 1, 0, 1,
-0.6789472, 1.132134, 0.8946761, 0.5607843, 1, 0, 1,
-0.675037, 0.2828465, 0.5916234, 0.5529412, 1, 0, 1,
-0.6722326, 0.3449825, 0.4341967, 0.5490196, 1, 0, 1,
-0.6586958, -1.929812, -3.246363, 0.5411765, 1, 0, 1,
-0.6513363, 0.2687874, -1.43105, 0.5372549, 1, 0, 1,
-0.6499724, 0.7895437, -1.092017, 0.5294118, 1, 0, 1,
-0.6478812, 0.04813521, -1.458453, 0.5254902, 1, 0, 1,
-0.647805, 0.7049382, -1.436342, 0.5176471, 1, 0, 1,
-0.6456938, 0.8545653, 1.090108, 0.5137255, 1, 0, 1,
-0.644039, -1.579518, -2.187947, 0.5058824, 1, 0, 1,
-0.6425819, -0.6507105, -3.123611, 0.5019608, 1, 0, 1,
-0.6416454, -0.466787, -3.207461, 0.4941176, 1, 0, 1,
-0.6405923, 2.366572, 0.9943546, 0.4862745, 1, 0, 1,
-0.6356166, -1.103439, -3.226809, 0.4823529, 1, 0, 1,
-0.6335625, 0.808397, -1.413525, 0.4745098, 1, 0, 1,
-0.6299472, 0.9205834, -0.5996871, 0.4705882, 1, 0, 1,
-0.6256957, 1.255672, -0.8363923, 0.4627451, 1, 0, 1,
-0.6193045, 0.6293327, -1.841872, 0.4588235, 1, 0, 1,
-0.6171335, 0.4252635, -2.329248, 0.4509804, 1, 0, 1,
-0.6162226, -0.9204588, -0.3912466, 0.4470588, 1, 0, 1,
-0.6129144, 0.2206933, -1.411664, 0.4392157, 1, 0, 1,
-0.6097362, -0.948859, -2.867416, 0.4352941, 1, 0, 1,
-0.6038015, -0.1049589, -2.412272, 0.427451, 1, 0, 1,
-0.6028857, 0.896581, -0.1009241, 0.4235294, 1, 0, 1,
-0.599616, -0.6971479, -4.176958, 0.4156863, 1, 0, 1,
-0.5922863, -1.330205, -3.819968, 0.4117647, 1, 0, 1,
-0.5904057, 0.6748815, 0.5359596, 0.4039216, 1, 0, 1,
-0.5893941, -1.767233, -5.315099, 0.3960784, 1, 0, 1,
-0.5859702, 0.8110338, -1.233222, 0.3921569, 1, 0, 1,
-0.5834367, 0.02796959, -0.2461521, 0.3843137, 1, 0, 1,
-0.5827027, -0.4181245, -1.591598, 0.3803922, 1, 0, 1,
-0.575626, 1.668583, -2.142274, 0.372549, 1, 0, 1,
-0.5708416, 0.3667853, -1.167225, 0.3686275, 1, 0, 1,
-0.5692748, -0.2117745, -0.8647848, 0.3607843, 1, 0, 1,
-0.5690511, 0.4611194, -1.155579, 0.3568628, 1, 0, 1,
-0.5576876, -0.6877393, -1.606587, 0.3490196, 1, 0, 1,
-0.5539157, -0.2767715, -1.719354, 0.345098, 1, 0, 1,
-0.5506168, 1.254868, 0.2592964, 0.3372549, 1, 0, 1,
-0.546713, 1.36029, 0.5369008, 0.3333333, 1, 0, 1,
-0.5450596, -0.04051752, -0.4594848, 0.3254902, 1, 0, 1,
-0.5373611, 0.8079315, -2.091174, 0.3215686, 1, 0, 1,
-0.5341988, 0.04556704, -1.694702, 0.3137255, 1, 0, 1,
-0.5337299, -1.222334, -1.808455, 0.3098039, 1, 0, 1,
-0.5312405, 0.109887, -1.432512, 0.3019608, 1, 0, 1,
-0.5305637, -0.02804304, -2.810159, 0.2941177, 1, 0, 1,
-0.5290109, 0.2342713, -0.9544076, 0.2901961, 1, 0, 1,
-0.5170968, 0.4484461, -1.899144, 0.282353, 1, 0, 1,
-0.5165765, 0.2160931, 0.3416646, 0.2784314, 1, 0, 1,
-0.5117003, -1.07049, -4.143009, 0.2705882, 1, 0, 1,
-0.5094008, -1.092676, -4.353577, 0.2666667, 1, 0, 1,
-0.5014312, -0.8901893, -3.677032, 0.2588235, 1, 0, 1,
-0.5009686, -0.06990979, -0.7061151, 0.254902, 1, 0, 1,
-0.4973535, -1.772834, -3.149418, 0.2470588, 1, 0, 1,
-0.4892826, 1.088804, -0.02430526, 0.2431373, 1, 0, 1,
-0.4886402, -0.1876876, -0.7615158, 0.2352941, 1, 0, 1,
-0.4864415, -1.130086, -5.109339, 0.2313726, 1, 0, 1,
-0.4864391, 0.9913481, 1.193129, 0.2235294, 1, 0, 1,
-0.4833639, -0.04662034, -0.2734394, 0.2196078, 1, 0, 1,
-0.4832627, 0.1250487, -2.275501, 0.2117647, 1, 0, 1,
-0.4810126, -1.378116, -3.034008, 0.2078431, 1, 0, 1,
-0.4782216, 1.11572, -1.260079, 0.2, 1, 0, 1,
-0.4778652, -2.165362, -4.429587, 0.1921569, 1, 0, 1,
-0.4769556, -0.7433154, -2.180802, 0.1882353, 1, 0, 1,
-0.4759784, 1.652413, -1.24548, 0.1803922, 1, 0, 1,
-0.4740868, 1.495587, 0.1094432, 0.1764706, 1, 0, 1,
-0.4728718, 0.808338, -1.207239, 0.1686275, 1, 0, 1,
-0.4700311, 0.1902649, -0.5460669, 0.1647059, 1, 0, 1,
-0.4616129, -0.7431605, -2.635079, 0.1568628, 1, 0, 1,
-0.4574099, -0.2605151, -1.498844, 0.1529412, 1, 0, 1,
-0.4489209, 0.6952778, 0.01977117, 0.145098, 1, 0, 1,
-0.4474223, -1.074692, -3.446796, 0.1411765, 1, 0, 1,
-0.4438187, -1.004549, -4.181801, 0.1333333, 1, 0, 1,
-0.4410363, 0.4387183, -0.9965239, 0.1294118, 1, 0, 1,
-0.4396245, -0.1828128, -2.241359, 0.1215686, 1, 0, 1,
-0.4381022, -0.490445, -0.9401634, 0.1176471, 1, 0, 1,
-0.4346047, 1.562607, 0.7893296, 0.1098039, 1, 0, 1,
-0.4329898, -0.7429075, -2.457711, 0.1058824, 1, 0, 1,
-0.4252816, -0.6874291, -3.445048, 0.09803922, 1, 0, 1,
-0.4250957, -1.480278, -2.722497, 0.09019608, 1, 0, 1,
-0.4246385, 0.7017683, 0.2596982, 0.08627451, 1, 0, 1,
-0.4179656, 0.2688512, -2.65631, 0.07843138, 1, 0, 1,
-0.4136989, -0.6285654, -4.210957, 0.07450981, 1, 0, 1,
-0.4093481, 1.776152, -0.2643653, 0.06666667, 1, 0, 1,
-0.4074032, -0.6536142, -2.633331, 0.0627451, 1, 0, 1,
-0.4049027, 0.2721682, -0.1494948, 0.05490196, 1, 0, 1,
-0.4026909, -0.9422877, -2.338211, 0.05098039, 1, 0, 1,
-0.4016754, 0.9756376, -1.66794, 0.04313726, 1, 0, 1,
-0.4009298, -0.8412462, -2.746305, 0.03921569, 1, 0, 1,
-0.3936704, -0.7844273, -3.282256, 0.03137255, 1, 0, 1,
-0.3884325, 0.780681, -1.104889, 0.02745098, 1, 0, 1,
-0.3853684, 0.3198891, 1.123215, 0.01960784, 1, 0, 1,
-0.3838767, 0.1458649, -1.562249, 0.01568628, 1, 0, 1,
-0.3698198, 0.06906259, -1.928329, 0.007843138, 1, 0, 1,
-0.3686661, 0.1404933, -1.450326, 0.003921569, 1, 0, 1,
-0.3658698, 0.2904671, -0.08965702, 0, 1, 0.003921569, 1,
-0.3648256, -0.180595, -2.556163, 0, 1, 0.01176471, 1,
-0.3567572, -0.3276826, -0.9022499, 0, 1, 0.01568628, 1,
-0.3508569, 0.1255244, -1.262608, 0, 1, 0.02352941, 1,
-0.3507912, 0.5686656, 0.4632153, 0, 1, 0.02745098, 1,
-0.3507685, -0.23799, -3.355743, 0, 1, 0.03529412, 1,
-0.3462383, 0.8535545, -0.4273615, 0, 1, 0.03921569, 1,
-0.3376014, -0.5151936, -0.9301142, 0, 1, 0.04705882, 1,
-0.3363345, -1.065268, -4.16332, 0, 1, 0.05098039, 1,
-0.3351509, -0.1977507, -0.04732883, 0, 1, 0.05882353, 1,
-0.3340134, 0.04464116, -2.31243, 0, 1, 0.0627451, 1,
-0.3314594, 0.2614051, 0.437659, 0, 1, 0.07058824, 1,
-0.3305501, -0.4310104, -2.51271, 0, 1, 0.07450981, 1,
-0.3280952, -1.891145, -3.05093, 0, 1, 0.08235294, 1,
-0.3206885, -1.241947, -2.541034, 0, 1, 0.08627451, 1,
-0.3197055, -2.095835, -2.980902, 0, 1, 0.09411765, 1,
-0.3113227, 0.005312126, -2.173516, 0, 1, 0.1019608, 1,
-0.3104156, -0.2914683, -0.6141829, 0, 1, 0.1058824, 1,
-0.3099549, 0.8173341, -0.6952751, 0, 1, 0.1137255, 1,
-0.3040533, -0.947466, -1.737325, 0, 1, 0.1176471, 1,
-0.3019619, 2.409261, -0.9445544, 0, 1, 0.1254902, 1,
-0.294855, 1.276794, 1.392784, 0, 1, 0.1294118, 1,
-0.2852037, 1.80084, -0.1975788, 0, 1, 0.1372549, 1,
-0.2824317, 0.2726553, -0.03571313, 0, 1, 0.1411765, 1,
-0.2821835, -0.1596294, -2.563293, 0, 1, 0.1490196, 1,
-0.2791826, -1.573678, -1.13005, 0, 1, 0.1529412, 1,
-0.278649, 0.07641796, -2.928192, 0, 1, 0.1607843, 1,
-0.2770286, -0.5767235, -2.099699, 0, 1, 0.1647059, 1,
-0.2760821, 0.9241492, -1.962513, 0, 1, 0.172549, 1,
-0.2700458, 0.1732507, -0.9833257, 0, 1, 0.1764706, 1,
-0.2689315, -0.3200273, -3.838656, 0, 1, 0.1843137, 1,
-0.2676197, 0.1942562, -3.036491, 0, 1, 0.1882353, 1,
-0.2673449, 0.2025117, -1.914436, 0, 1, 0.1960784, 1,
-0.2664634, 0.9088734, 0.2978162, 0, 1, 0.2039216, 1,
-0.2657602, -0.9393225, -3.376072, 0, 1, 0.2078431, 1,
-0.2646054, 0.1532657, -1.52454, 0, 1, 0.2156863, 1,
-0.2638891, 0.108613, -2.53696, 0, 1, 0.2196078, 1,
-0.2617075, 0.4709722, 0.676746, 0, 1, 0.227451, 1,
-0.2582308, 0.244528, -0.1749857, 0, 1, 0.2313726, 1,
-0.2575279, -0.09987643, -4.397759, 0, 1, 0.2392157, 1,
-0.2530176, 0.2386083, 0.1153541, 0, 1, 0.2431373, 1,
-0.2520322, -0.66847, -4.241127, 0, 1, 0.2509804, 1,
-0.2461829, -0.4454294, -1.531534, 0, 1, 0.254902, 1,
-0.2434182, -0.8449393, -2.286346, 0, 1, 0.2627451, 1,
-0.243379, -1.28826, -4.620743, 0, 1, 0.2666667, 1,
-0.2368106, 1.265405, 0.4883481, 0, 1, 0.2745098, 1,
-0.2361584, -0.1940836, -1.44022, 0, 1, 0.2784314, 1,
-0.2328825, 0.9557583, 2.549783, 0, 1, 0.2862745, 1,
-0.231433, 0.2221524, -0.4021007, 0, 1, 0.2901961, 1,
-0.2301248, 3.214822, -2.626015, 0, 1, 0.2980392, 1,
-0.223932, -1.543766, -1.220223, 0, 1, 0.3058824, 1,
-0.2158927, -0.7751676, -2.406765, 0, 1, 0.3098039, 1,
-0.2157717, -0.782234, -2.459031, 0, 1, 0.3176471, 1,
-0.2141567, -0.6167395, -4.015161, 0, 1, 0.3215686, 1,
-0.2140186, -0.991495, -4.75961, 0, 1, 0.3294118, 1,
-0.2110382, -1.124708, -4.528721, 0, 1, 0.3333333, 1,
-0.2106634, 1.868799, 0.4732562, 0, 1, 0.3411765, 1,
-0.2073332, -0.8285997, -3.660654, 0, 1, 0.345098, 1,
-0.2073022, 0.04291489, -1.483875, 0, 1, 0.3529412, 1,
-0.2053197, -0.4069262, 0.05406237, 0, 1, 0.3568628, 1,
-0.2046496, -0.8668308, -3.440381, 0, 1, 0.3647059, 1,
-0.2027686, -0.880405, -1.737892, 0, 1, 0.3686275, 1,
-0.2018684, 0.644002, -0.9442962, 0, 1, 0.3764706, 1,
-0.1987569, -0.4161102, -4.881909, 0, 1, 0.3803922, 1,
-0.1919358, 0.2697292, -1.400255, 0, 1, 0.3882353, 1,
-0.1907664, -0.1031987, -2.019361, 0, 1, 0.3921569, 1,
-0.181633, -1.689437, -1.826882, 0, 1, 0.4, 1,
-0.1810718, -1.546432, -2.265712, 0, 1, 0.4078431, 1,
-0.1798921, -0.875977, -2.189029, 0, 1, 0.4117647, 1,
-0.1754432, 1.451011, -0.566488, 0, 1, 0.4196078, 1,
-0.174676, -0.8151088, -2.306789, 0, 1, 0.4235294, 1,
-0.1733554, -0.2111102, -2.497144, 0, 1, 0.4313726, 1,
-0.1707201, -0.05438118, -0.8248885, 0, 1, 0.4352941, 1,
-0.1693114, 0.8681409, -1.393086, 0, 1, 0.4431373, 1,
-0.1636309, -1.334391, -5.166386, 0, 1, 0.4470588, 1,
-0.1629098, -0.9565908, -2.314854, 0, 1, 0.454902, 1,
-0.1618328, 0.7150419, -0.3906835, 0, 1, 0.4588235, 1,
-0.1599749, 1.197431, 0.9475801, 0, 1, 0.4666667, 1,
-0.1576908, -2.227454, -3.783875, 0, 1, 0.4705882, 1,
-0.1532975, -0.3230905, -1.514329, 0, 1, 0.4784314, 1,
-0.1463768, 0.3669657, -1.099075, 0, 1, 0.4823529, 1,
-0.1425761, 0.7747929, -0.2221767, 0, 1, 0.4901961, 1,
-0.1421493, 0.9974583, -3.062065, 0, 1, 0.4941176, 1,
-0.1372242, 0.6199538, -1.364603, 0, 1, 0.5019608, 1,
-0.1353941, -1.435265, -3.453857, 0, 1, 0.509804, 1,
-0.135072, -1.039029, -4.478886, 0, 1, 0.5137255, 1,
-0.1334729, 0.1345905, 0.351761, 0, 1, 0.5215687, 1,
-0.1331296, -0.4600061, -1.346882, 0, 1, 0.5254902, 1,
-0.1318271, 1.28928, -1.104163, 0, 1, 0.5333334, 1,
-0.13122, -1.234682, -3.826906, 0, 1, 0.5372549, 1,
-0.1286086, 0.6437426, -0.3373847, 0, 1, 0.5450981, 1,
-0.1240936, 1.520199, 0.6924856, 0, 1, 0.5490196, 1,
-0.1209826, -1.079412, -3.848046, 0, 1, 0.5568628, 1,
-0.1148322, -0.7100708, -2.236152, 0, 1, 0.5607843, 1,
-0.1138664, -0.948396, -2.789841, 0, 1, 0.5686275, 1,
-0.1125301, -1.261387, -1.549602, 0, 1, 0.572549, 1,
-0.1105622, 0.8801197, -0.3640307, 0, 1, 0.5803922, 1,
-0.1098506, -1.103341, -3.287659, 0, 1, 0.5843138, 1,
-0.1077307, -0.2734572, -3.012396, 0, 1, 0.5921569, 1,
-0.1053957, -0.263992, -3.332011, 0, 1, 0.5960785, 1,
-0.1048789, -1.706013, -2.848328, 0, 1, 0.6039216, 1,
-0.1024165, -1.358123, -2.107221, 0, 1, 0.6117647, 1,
-0.09951955, -1.125657, -4.431144, 0, 1, 0.6156863, 1,
-0.09512722, 1.365416, -0.2861979, 0, 1, 0.6235294, 1,
-0.09376868, -0.3093294, -1.884969, 0, 1, 0.627451, 1,
-0.09367754, -0.8069744, -3.460042, 0, 1, 0.6352941, 1,
-0.08884082, -0.7498086, -4.59156, 0, 1, 0.6392157, 1,
-0.08706217, -0.3836626, -3.592127, 0, 1, 0.6470588, 1,
-0.0843133, -0.7577204, -1.493554, 0, 1, 0.6509804, 1,
-0.08218401, -0.1976377, -2.252233, 0, 1, 0.6588235, 1,
-0.08203367, 0.6723043, 0.6817907, 0, 1, 0.6627451, 1,
-0.0780425, -0.03883456, -1.35016, 0, 1, 0.6705883, 1,
-0.07649033, 1.109188, 0.803974, 0, 1, 0.6745098, 1,
-0.07502238, -1.202151, -5.093143, 0, 1, 0.682353, 1,
-0.06830054, 1.656395, 0.1777851, 0, 1, 0.6862745, 1,
-0.06594791, 0.5945269, 0.02207787, 0, 1, 0.6941177, 1,
-0.064855, -1.224674, -2.570479, 0, 1, 0.7019608, 1,
-0.06286496, 0.1459213, 0.03398573, 0, 1, 0.7058824, 1,
-0.06175402, 0.3196155, 0.4768462, 0, 1, 0.7137255, 1,
-0.0616051, 1.206441, 0.02434419, 0, 1, 0.7176471, 1,
-0.05862481, 0.8251336, 0.04844153, 0, 1, 0.7254902, 1,
-0.0561095, -0.2666611, -3.508206, 0, 1, 0.7294118, 1,
-0.05391768, 0.682742, 0.1856864, 0, 1, 0.7372549, 1,
-0.05261907, 0.05637033, -1.243114, 0, 1, 0.7411765, 1,
-0.04575613, 0.1229953, 0.4525757, 0, 1, 0.7490196, 1,
-0.04562233, 0.4437598, 1.532489, 0, 1, 0.7529412, 1,
-0.04452772, 2.273236, -1.295712, 0, 1, 0.7607843, 1,
-0.04444593, -2.089102, -3.237274, 0, 1, 0.7647059, 1,
-0.04443913, 1.966035, 1.701133, 0, 1, 0.772549, 1,
-0.04198299, -0.9429969, -1.861456, 0, 1, 0.7764706, 1,
-0.04023704, 0.1545433, -1.585992, 0, 1, 0.7843137, 1,
-0.03387354, -0.9427282, -4.243731, 0, 1, 0.7882353, 1,
-0.03056434, 1.201836, -0.2266686, 0, 1, 0.7960784, 1,
-0.02755214, 0.06312139, 0.5193143, 0, 1, 0.8039216, 1,
-0.02368475, 1.53938, 0.5494766, 0, 1, 0.8078431, 1,
-0.02312243, 0.6139039, -0.1222548, 0, 1, 0.8156863, 1,
-0.02105793, -0.7501995, -3.464664, 0, 1, 0.8196079, 1,
-0.01988642, -0.1702609, -2.499113, 0, 1, 0.827451, 1,
-0.01549266, -0.04696618, -1.842886, 0, 1, 0.8313726, 1,
-0.01466833, 0.4191911, 0.3251322, 0, 1, 0.8392157, 1,
-0.01425959, -2.07019, -5.073198, 0, 1, 0.8431373, 1,
-0.01337071, -0.1625738, -2.842276, 0, 1, 0.8509804, 1,
-0.012421, -0.2397117, -1.591193, 0, 1, 0.854902, 1,
-0.01223762, -0.9559001, -3.268479, 0, 1, 0.8627451, 1,
-0.01086342, 0.5964312, -0.5591601, 0, 1, 0.8666667, 1,
-0.01035748, -1.492075, -2.738708, 0, 1, 0.8745098, 1,
-0.007823043, -1.107934, -3.254802, 0, 1, 0.8784314, 1,
-0.0049661, -0.9796937, -3.50799, 0, 1, 0.8862745, 1,
-0.002025029, 0.8647637, -1.002705, 0, 1, 0.8901961, 1,
-0.001433513, -0.1394165, -2.581175, 0, 1, 0.8980392, 1,
-0.0008946746, -0.7921672, -3.900462, 0, 1, 0.9058824, 1,
-0.0008031203, 0.08774748, -1.355973, 0, 1, 0.9098039, 1,
0.002298539, 0.2143599, -0.0867738, 0, 1, 0.9176471, 1,
0.00305537, -0.8020891, 4.542307, 0, 1, 0.9215686, 1,
0.004322646, 1.603424, 2.065264, 0, 1, 0.9294118, 1,
0.01291974, -0.4350154, 4.59889, 0, 1, 0.9333333, 1,
0.01618029, -2.445311, 2.164304, 0, 1, 0.9411765, 1,
0.02305774, 0.4714583, 0.219984, 0, 1, 0.945098, 1,
0.02479897, 0.3767756, 0.1958187, 0, 1, 0.9529412, 1,
0.02572959, 1.352721, -0.2603944, 0, 1, 0.9568627, 1,
0.02607099, -0.5159689, 3.577692, 0, 1, 0.9647059, 1,
0.02643936, 1.529948, -1.488681, 0, 1, 0.9686275, 1,
0.03449325, -0.6067301, 3.560982, 0, 1, 0.9764706, 1,
0.03564195, -0.4515538, 3.377073, 0, 1, 0.9803922, 1,
0.04087642, -0.05059373, 2.5206, 0, 1, 0.9882353, 1,
0.04353854, -0.504049, 4.022497, 0, 1, 0.9921569, 1,
0.0448123, 0.07841465, 0.8300164, 0, 1, 1, 1,
0.04548066, -0.3582492, 3.000888, 0, 0.9921569, 1, 1,
0.04859285, 0.1765556, 0.3358039, 0, 0.9882353, 1, 1,
0.05112383, 1.573222, 0.9614569, 0, 0.9803922, 1, 1,
0.05241702, 0.1220594, 0.360414, 0, 0.9764706, 1, 1,
0.05270657, 0.7884179, -0.4242988, 0, 0.9686275, 1, 1,
0.05396821, -0.6826631, 3.283759, 0, 0.9647059, 1, 1,
0.05762569, 0.2525757, 0.07920905, 0, 0.9568627, 1, 1,
0.0583331, 0.196231, 0.1623229, 0, 0.9529412, 1, 1,
0.0586026, -1.549817, 3.456365, 0, 0.945098, 1, 1,
0.05934577, 1.504785, -2.403688, 0, 0.9411765, 1, 1,
0.06019633, -0.6196972, 3.679742, 0, 0.9333333, 1, 1,
0.06547225, 0.5761698, 0.533425, 0, 0.9294118, 1, 1,
0.06819793, -0.2453302, 2.767598, 0, 0.9215686, 1, 1,
0.06830761, 1.403724, 0.2223432, 0, 0.9176471, 1, 1,
0.06852419, -0.8106868, 2.761342, 0, 0.9098039, 1, 1,
0.0695265, 0.2120846, 0.1330135, 0, 0.9058824, 1, 1,
0.07046682, 0.6582937, -0.845688, 0, 0.8980392, 1, 1,
0.07057127, 1.276971, 0.7450402, 0, 0.8901961, 1, 1,
0.07325741, 0.2776726, 0.5584353, 0, 0.8862745, 1, 1,
0.07458083, 1.26243, 1.784961, 0, 0.8784314, 1, 1,
0.07459037, -1.60643, 4.475146, 0, 0.8745098, 1, 1,
0.07974538, 1.904552, 0.5326722, 0, 0.8666667, 1, 1,
0.0825041, 0.6381353, -0.8587393, 0, 0.8627451, 1, 1,
0.08676566, -0.8375733, 1.602305, 0, 0.854902, 1, 1,
0.08856224, -0.3514361, 3.802138, 0, 0.8509804, 1, 1,
0.09608494, 0.3868428, -0.1698901, 0, 0.8431373, 1, 1,
0.09648231, -0.7100269, 4.466081, 0, 0.8392157, 1, 1,
0.09904413, 0.8605974, -0.8796289, 0, 0.8313726, 1, 1,
0.09954678, 1.226903, 0.7473189, 0, 0.827451, 1, 1,
0.1051674, -1.53612, 3.396672, 0, 0.8196079, 1, 1,
0.1052312, -0.4767892, 1.3431, 0, 0.8156863, 1, 1,
0.106937, 1.102746, -0.6395158, 0, 0.8078431, 1, 1,
0.1073345, -0.4328462, 2.393374, 0, 0.8039216, 1, 1,
0.1135498, -1.074278, 3.977815, 0, 0.7960784, 1, 1,
0.1139043, -0.9956324, 4.840669, 0, 0.7882353, 1, 1,
0.1142214, -1.191492, 3.707178, 0, 0.7843137, 1, 1,
0.1150505, -0.4173686, 3.619346, 0, 0.7764706, 1, 1,
0.1191065, 0.9065281, 0.8333885, 0, 0.772549, 1, 1,
0.1306841, 0.5948164, 0.3760684, 0, 0.7647059, 1, 1,
0.1317041, -0.6369212, 3.7142, 0, 0.7607843, 1, 1,
0.1324275, -2.094567, 4.302802, 0, 0.7529412, 1, 1,
0.1333961, 0.4524147, 0.1993545, 0, 0.7490196, 1, 1,
0.1339549, 1.237411, -1.373868, 0, 0.7411765, 1, 1,
0.1360094, -0.1564586, 3.765896, 0, 0.7372549, 1, 1,
0.1366022, -0.6221517, 1.184646, 0, 0.7294118, 1, 1,
0.1400433, 0.9792093, 0.03419825, 0, 0.7254902, 1, 1,
0.1413288, 1.782544, -1.299688, 0, 0.7176471, 1, 1,
0.1466859, 1.21872, -0.1563385, 0, 0.7137255, 1, 1,
0.1471428, -0.1206667, 1.780416, 0, 0.7058824, 1, 1,
0.1522213, -0.7909457, 3.716552, 0, 0.6980392, 1, 1,
0.1529648, 1.439342, 1.257324, 0, 0.6941177, 1, 1,
0.1565144, -0.02135424, 0.3436766, 0, 0.6862745, 1, 1,
0.1587966, 0.003382342, 0.1364796, 0, 0.682353, 1, 1,
0.1619124, 0.008913212, 1.768948, 0, 0.6745098, 1, 1,
0.1645714, 0.2347557, 0.3674437, 0, 0.6705883, 1, 1,
0.1665018, -0.4382477, 2.044261, 0, 0.6627451, 1, 1,
0.1687577, 0.8306291, 0.6259565, 0, 0.6588235, 1, 1,
0.1706461, 0.337785, -0.7880632, 0, 0.6509804, 1, 1,
0.1710305, 0.4805712, -0.8894806, 0, 0.6470588, 1, 1,
0.1741687, -1.817966, 1.755785, 0, 0.6392157, 1, 1,
0.1764109, -0.1808125, 2.576067, 0, 0.6352941, 1, 1,
0.1771521, 2.804699, 0.3148522, 0, 0.627451, 1, 1,
0.1800843, 0.5394406, -0.4102397, 0, 0.6235294, 1, 1,
0.1800982, 0.1466874, 1.911616, 0, 0.6156863, 1, 1,
0.1803538, -0.6573634, 3.528281, 0, 0.6117647, 1, 1,
0.1804427, -1.206796, 2.468782, 0, 0.6039216, 1, 1,
0.1823416, 0.5717087, -0.5284573, 0, 0.5960785, 1, 1,
0.1843828, 0.8331298, -0.7753275, 0, 0.5921569, 1, 1,
0.1879304, -1.88044, 2.673786, 0, 0.5843138, 1, 1,
0.1940841, 0.4362904, 0.2129434, 0, 0.5803922, 1, 1,
0.1975282, -0.2555194, 4.009127, 0, 0.572549, 1, 1,
0.1988007, 0.989072, 1.087065, 0, 0.5686275, 1, 1,
0.1991489, 0.1368554, -0.4028801, 0, 0.5607843, 1, 1,
0.1991682, 1.333272, -0.8843265, 0, 0.5568628, 1, 1,
0.2020081, 0.6353309, 1.957254, 0, 0.5490196, 1, 1,
0.2038306, 0.1378695, 0.7952887, 0, 0.5450981, 1, 1,
0.2039285, -0.4183039, 2.036516, 0, 0.5372549, 1, 1,
0.2066107, -1.21962, 1.824235, 0, 0.5333334, 1, 1,
0.2117974, 0.2282994, -0.1746679, 0, 0.5254902, 1, 1,
0.2127226, 1.972351, -0.1227446, 0, 0.5215687, 1, 1,
0.2203239, -0.6611632, 2.435466, 0, 0.5137255, 1, 1,
0.2220182, 0.9037241, -0.1358298, 0, 0.509804, 1, 1,
0.22313, 0.2981272, 0.4040395, 0, 0.5019608, 1, 1,
0.2322558, 1.160355, -0.1214898, 0, 0.4941176, 1, 1,
0.2388474, 1.637378, 0.1732707, 0, 0.4901961, 1, 1,
0.2411696, 1.423465, -0.417233, 0, 0.4823529, 1, 1,
0.2450063, -0.360489, 1.161135, 0, 0.4784314, 1, 1,
0.2463249, 0.6045288, -1.158248, 0, 0.4705882, 1, 1,
0.2463927, -0.8954476, 3.775504, 0, 0.4666667, 1, 1,
0.2587029, -1.89124, 4.555307, 0, 0.4588235, 1, 1,
0.2665008, 0.3139475, 0.8120961, 0, 0.454902, 1, 1,
0.2707792, -2.058366, 4.117736, 0, 0.4470588, 1, 1,
0.2798565, -0.03871017, 0.9790421, 0, 0.4431373, 1, 1,
0.2834775, -0.05622573, 2.067738, 0, 0.4352941, 1, 1,
0.284641, -0.07135315, 0.2766668, 0, 0.4313726, 1, 1,
0.284903, 0.4281917, 1.146874, 0, 0.4235294, 1, 1,
0.2856922, -1.059816, 2.883774, 0, 0.4196078, 1, 1,
0.2860386, -1.303126, 4.945306, 0, 0.4117647, 1, 1,
0.2872058, -0.6564244, 2.676271, 0, 0.4078431, 1, 1,
0.2887636, 0.7586735, 1.208099, 0, 0.4, 1, 1,
0.2888511, 0.2884753, 0.8579159, 0, 0.3921569, 1, 1,
0.2892777, -0.5181144, 2.709367, 0, 0.3882353, 1, 1,
0.2903877, -0.3678034, 4.158966, 0, 0.3803922, 1, 1,
0.2911274, -0.315593, 1.223291, 0, 0.3764706, 1, 1,
0.2925443, 1.917379, -0.8619825, 0, 0.3686275, 1, 1,
0.3005985, -0.1352489, 2.960165, 0, 0.3647059, 1, 1,
0.3012949, 0.3830367, 1.145987, 0, 0.3568628, 1, 1,
0.3017702, -0.6736386, 2.058366, 0, 0.3529412, 1, 1,
0.3071719, 1.985415, -1.290458, 0, 0.345098, 1, 1,
0.3072731, -0.7859316, 1.864824, 0, 0.3411765, 1, 1,
0.3079262, 0.4337486, 0.6205425, 0, 0.3333333, 1, 1,
0.3098846, 0.7571846, 0.3717272, 0, 0.3294118, 1, 1,
0.3108949, 0.9975786, -0.04372202, 0, 0.3215686, 1, 1,
0.3121932, 1.750224, -0.777167, 0, 0.3176471, 1, 1,
0.3148736, 0.1987319, 2.209476, 0, 0.3098039, 1, 1,
0.3190245, -0.2908279, 3.433712, 0, 0.3058824, 1, 1,
0.3197865, -1.99357, 1.708004, 0, 0.2980392, 1, 1,
0.3201678, -1.100594, 2.928448, 0, 0.2901961, 1, 1,
0.3213361, 0.5905811, 1.863463, 0, 0.2862745, 1, 1,
0.3215387, 1.912162, -1.965678, 0, 0.2784314, 1, 1,
0.3229488, -1.357706, 2.709796, 0, 0.2745098, 1, 1,
0.3308956, -0.3024285, 1.71153, 0, 0.2666667, 1, 1,
0.3373159, 0.5805835, -0.05500785, 0, 0.2627451, 1, 1,
0.3449609, 2.286643, 0.726907, 0, 0.254902, 1, 1,
0.3466874, -0.9234059, 2.871987, 0, 0.2509804, 1, 1,
0.3469243, -0.3761525, 2.223018, 0, 0.2431373, 1, 1,
0.3511765, 1.027199, 1.722684, 0, 0.2392157, 1, 1,
0.3565977, 0.8294564, 1.79177, 0, 0.2313726, 1, 1,
0.357903, 1.572513, 1.799777, 0, 0.227451, 1, 1,
0.3639466, -0.165023, 1.492863, 0, 0.2196078, 1, 1,
0.3693451, -0.2809525, 1.120114, 0, 0.2156863, 1, 1,
0.3706717, -0.08939583, 2.520126, 0, 0.2078431, 1, 1,
0.3713518, 0.3394346, 0.3529048, 0, 0.2039216, 1, 1,
0.3756558, -1.119262, 0.7987458, 0, 0.1960784, 1, 1,
0.3787251, 0.841452, 2.210536, 0, 0.1882353, 1, 1,
0.3805479, 1.435862, 0.9504768, 0, 0.1843137, 1, 1,
0.3812282, -0.1898244, 0.1290241, 0, 0.1764706, 1, 1,
0.3813284, -1.785962, 3.191679, 0, 0.172549, 1, 1,
0.3837709, -0.8874281, 1.635308, 0, 0.1647059, 1, 1,
0.3840637, 1.154232, 1.448476, 0, 0.1607843, 1, 1,
0.3863944, -0.02121577, 0.9756213, 0, 0.1529412, 1, 1,
0.3887583, -0.8160232, 3.43044, 0, 0.1490196, 1, 1,
0.391804, 0.8808544, 1.597617, 0, 0.1411765, 1, 1,
0.3925614, 1.513488, -0.6027632, 0, 0.1372549, 1, 1,
0.3982954, -0.6767172, 2.740764, 0, 0.1294118, 1, 1,
0.3983985, -0.4081724, 1.731613, 0, 0.1254902, 1, 1,
0.4042999, -0.1802837, 0.7163265, 0, 0.1176471, 1, 1,
0.4062307, 0.08947651, 2.778153, 0, 0.1137255, 1, 1,
0.4083245, -0.00261187, 3.951903, 0, 0.1058824, 1, 1,
0.4095547, -0.7948127, 1.789695, 0, 0.09803922, 1, 1,
0.4097055, -0.1238576, 1.258969, 0, 0.09411765, 1, 1,
0.4158247, -0.5501677, 2.098773, 0, 0.08627451, 1, 1,
0.4185461, 1.090803, 0.04138108, 0, 0.08235294, 1, 1,
0.4249799, 0.1239985, 0.7857311, 0, 0.07450981, 1, 1,
0.4270574, 0.4610444, -0.3572047, 0, 0.07058824, 1, 1,
0.4300912, 0.4472279, -0.5423666, 0, 0.0627451, 1, 1,
0.4330425, -0.8197444, 3.426278, 0, 0.05882353, 1, 1,
0.433991, 0.1594793, 1.361017, 0, 0.05098039, 1, 1,
0.437315, -0.1556204, 0.9657854, 0, 0.04705882, 1, 1,
0.4387719, 0.7601575, 0.2121579, 0, 0.03921569, 1, 1,
0.4396829, 0.501672, 1.69726, 0, 0.03529412, 1, 1,
0.4430084, -0.1004408, 2.198958, 0, 0.02745098, 1, 1,
0.4436159, 1.651402, -0.3184114, 0, 0.02352941, 1, 1,
0.4438272, 1.353008, -0.5175434, 0, 0.01568628, 1, 1,
0.4473102, -0.7285911, 2.413808, 0, 0.01176471, 1, 1,
0.450307, -0.5389856, 2.13587, 0, 0.003921569, 1, 1,
0.4531882, -0.8807352, 2.202958, 0.003921569, 0, 1, 1,
0.4536651, -0.4191835, 4.102987, 0.007843138, 0, 1, 1,
0.4640667, 1.171789, -0.4715544, 0.01568628, 0, 1, 1,
0.4666273, -1.029413, 3.397928, 0.01960784, 0, 1, 1,
0.4673695, 0.7136917, -0.6871524, 0.02745098, 0, 1, 1,
0.4697269, -2.170752, 3.605977, 0.03137255, 0, 1, 1,
0.4732593, -0.945126, 2.405233, 0.03921569, 0, 1, 1,
0.4736751, 0.6578562, 0.2863617, 0.04313726, 0, 1, 1,
0.4747137, 0.3127243, 0.9583086, 0.05098039, 0, 1, 1,
0.4760568, 0.001255548, 2.881634, 0.05490196, 0, 1, 1,
0.4788497, 2.199086, -1.189999, 0.0627451, 0, 1, 1,
0.4796447, 1.358735, 0.663417, 0.06666667, 0, 1, 1,
0.4805567, -0.7857813, 2.431376, 0.07450981, 0, 1, 1,
0.4865632, -0.0631474, 2.085974, 0.07843138, 0, 1, 1,
0.4874043, 1.241315, 0.6802319, 0.08627451, 0, 1, 1,
0.4876826, -1.824708, 4.584757, 0.09019608, 0, 1, 1,
0.4935393, 0.650265, 0.02989248, 0.09803922, 0, 1, 1,
0.4940185, -0.7130446, 1.916096, 0.1058824, 0, 1, 1,
0.4946904, 0.7689888, 0.8515603, 0.1098039, 0, 1, 1,
0.4951962, -0.6666458, 2.680984, 0.1176471, 0, 1, 1,
0.4957759, -0.5713987, 2.466966, 0.1215686, 0, 1, 1,
0.4966067, 0.271917, 2.544332, 0.1294118, 0, 1, 1,
0.501018, -0.6104838, 2.808357, 0.1333333, 0, 1, 1,
0.5022529, 0.6904206, 1.109367, 0.1411765, 0, 1, 1,
0.5069518, -0.8877667, 3.446472, 0.145098, 0, 1, 1,
0.5129345, -0.01016734, 0.5648124, 0.1529412, 0, 1, 1,
0.5132529, -0.6613387, 2.044063, 0.1568628, 0, 1, 1,
0.5194228, 0.125765, 0.6671027, 0.1647059, 0, 1, 1,
0.5199962, 0.6357055, 1.631397, 0.1686275, 0, 1, 1,
0.5281432, -0.9587392, 3.936849, 0.1764706, 0, 1, 1,
0.5314966, 0.3641149, 1.155104, 0.1803922, 0, 1, 1,
0.5349246, 1.717964, 0.6693617, 0.1882353, 0, 1, 1,
0.539237, -1.697977, 1.530406, 0.1921569, 0, 1, 1,
0.539716, 1.86164, -0.1425233, 0.2, 0, 1, 1,
0.5434779, 0.4510251, 1.520862, 0.2078431, 0, 1, 1,
0.5442666, -1.932933, 1.912191, 0.2117647, 0, 1, 1,
0.5451418, -1.894672, 2.181423, 0.2196078, 0, 1, 1,
0.546668, -0.6678969, 2.911906, 0.2235294, 0, 1, 1,
0.5517288, 1.507964, -1.094819, 0.2313726, 0, 1, 1,
0.553043, 1.867545, 0.0245686, 0.2352941, 0, 1, 1,
0.5535253, -2.646658, 3.100548, 0.2431373, 0, 1, 1,
0.5543001, 0.5627671, -0.7740098, 0.2470588, 0, 1, 1,
0.5566758, -1.788383, 3.638638, 0.254902, 0, 1, 1,
0.5586942, -0.5695264, 2.341916, 0.2588235, 0, 1, 1,
0.5599553, 0.1927797, 2.339805, 0.2666667, 0, 1, 1,
0.5658611, 0.4139128, 0.4925523, 0.2705882, 0, 1, 1,
0.5671623, -0.4305198, 1.25859, 0.2784314, 0, 1, 1,
0.5720149, 0.2679184, 1.155176, 0.282353, 0, 1, 1,
0.5771923, 1.013137, -1.124423, 0.2901961, 0, 1, 1,
0.5776135, -0.9836646, 1.114554, 0.2941177, 0, 1, 1,
0.579374, -1.475169, 1.81031, 0.3019608, 0, 1, 1,
0.5813784, 0.3557748, 2.232267, 0.3098039, 0, 1, 1,
0.581417, -0.5802333, 3.419459, 0.3137255, 0, 1, 1,
0.5816721, -1.16867, 1.999757, 0.3215686, 0, 1, 1,
0.584088, -0.7972575, 4.338437, 0.3254902, 0, 1, 1,
0.5846318, -1.05617, 2.581444, 0.3333333, 0, 1, 1,
0.5849316, 0.8730808, 2.012379, 0.3372549, 0, 1, 1,
0.5901518, 0.7693831, 0.9016688, 0.345098, 0, 1, 1,
0.5981497, 0.1586925, 2.330148, 0.3490196, 0, 1, 1,
0.5998573, 0.7058366, 0.9716499, 0.3568628, 0, 1, 1,
0.6004864, -0.4947626, 1.373214, 0.3607843, 0, 1, 1,
0.6017075, 1.440944, 2.122501, 0.3686275, 0, 1, 1,
0.6066568, 0.008334415, 2.221836, 0.372549, 0, 1, 1,
0.6066995, 0.2395914, 2.582115, 0.3803922, 0, 1, 1,
0.6078494, -1.109401, 3.802485, 0.3843137, 0, 1, 1,
0.6080943, -0.6157826, 1.705408, 0.3921569, 0, 1, 1,
0.6118266, -0.2488249, 2.066391, 0.3960784, 0, 1, 1,
0.6146492, -1.154447, 3.013939, 0.4039216, 0, 1, 1,
0.616486, -0.3054497, 2.215615, 0.4117647, 0, 1, 1,
0.6204315, 1.134433, -0.1813091, 0.4156863, 0, 1, 1,
0.6205152, 0.3326977, 1.936631, 0.4235294, 0, 1, 1,
0.6228666, 0.4507328, 1.065297, 0.427451, 0, 1, 1,
0.624719, 1.790734, -0.1945995, 0.4352941, 0, 1, 1,
0.6264328, -0.7399322, 3.967534, 0.4392157, 0, 1, 1,
0.6288664, -0.0002721197, 1.278201, 0.4470588, 0, 1, 1,
0.6323621, 0.3548594, 2.706178, 0.4509804, 0, 1, 1,
0.6352637, 1.826787, -0.5449975, 0.4588235, 0, 1, 1,
0.6372874, 0.2354008, 2.075597, 0.4627451, 0, 1, 1,
0.6440581, 1.571206, 2.093302, 0.4705882, 0, 1, 1,
0.6664311, -0.06429357, 2.257858, 0.4745098, 0, 1, 1,
0.6671803, -1.390579, 3.761835, 0.4823529, 0, 1, 1,
0.669392, 0.7034596, -0.1541303, 0.4862745, 0, 1, 1,
0.6722121, 1.003443, -0.3860772, 0.4941176, 0, 1, 1,
0.6767512, 0.3560861, 2.890749, 0.5019608, 0, 1, 1,
0.6768944, -0.6859915, 3.603559, 0.5058824, 0, 1, 1,
0.6827467, -1.693215, 2.603451, 0.5137255, 0, 1, 1,
0.6832712, -0.3002875, 3.895749, 0.5176471, 0, 1, 1,
0.6834779, -0.5302044, 0.9507937, 0.5254902, 0, 1, 1,
0.6837398, 0.3834042, 2.422995, 0.5294118, 0, 1, 1,
0.7001551, 0.6242266, -0.6697379, 0.5372549, 0, 1, 1,
0.7063144, -0.49797, 2.570881, 0.5411765, 0, 1, 1,
0.7074105, 0.1617917, 1.684067, 0.5490196, 0, 1, 1,
0.7077479, -1.337961, 2.899138, 0.5529412, 0, 1, 1,
0.708821, -0.5195228, 1.978095, 0.5607843, 0, 1, 1,
0.7106633, 0.6753482, 2.709148, 0.5647059, 0, 1, 1,
0.7146396, -1.146694, 2.989024, 0.572549, 0, 1, 1,
0.7178327, -1.362088, 4.375612, 0.5764706, 0, 1, 1,
0.7191064, -0.08613857, 1.174438, 0.5843138, 0, 1, 1,
0.7213786, -1.131929, 2.45797, 0.5882353, 0, 1, 1,
0.7214519, -0.2619877, 2.0469, 0.5960785, 0, 1, 1,
0.7214715, 1.56936, 1.848645, 0.6039216, 0, 1, 1,
0.7311347, 0.6649392, -0.5107679, 0.6078432, 0, 1, 1,
0.7358191, -0.7451259, 0.01605466, 0.6156863, 0, 1, 1,
0.7369121, 1.529546, 0.1880998, 0.6196079, 0, 1, 1,
0.7413814, -1.066385, 1.099396, 0.627451, 0, 1, 1,
0.7513422, -0.940864, 1.888281, 0.6313726, 0, 1, 1,
0.7568762, -0.4742493, 1.317621, 0.6392157, 0, 1, 1,
0.7570585, -0.1755333, 1.813602, 0.6431373, 0, 1, 1,
0.7660784, -0.07117993, 2.846191, 0.6509804, 0, 1, 1,
0.7677101, 0.8990556, 0.6551125, 0.654902, 0, 1, 1,
0.7687871, -0.1398097, 2.010571, 0.6627451, 0, 1, 1,
0.7689793, 0.3909013, 0.4073215, 0.6666667, 0, 1, 1,
0.7753475, 0.01243749, 1.125798, 0.6745098, 0, 1, 1,
0.7774553, -0.0852497, 1.671062, 0.6784314, 0, 1, 1,
0.7876585, 1.621425, 0.5149183, 0.6862745, 0, 1, 1,
0.7902533, 0.06896894, 3.020527, 0.6901961, 0, 1, 1,
0.7923616, 1.190469, 0.06059147, 0.6980392, 0, 1, 1,
0.7991749, 0.07741557, 0.6556051, 0.7058824, 0, 1, 1,
0.8020695, 1.111152, 0.5569665, 0.7098039, 0, 1, 1,
0.8045972, -0.3202678, 0.5162678, 0.7176471, 0, 1, 1,
0.8049999, -1.173663, 4.45471, 0.7215686, 0, 1, 1,
0.8060836, -1.491224, 4.277458, 0.7294118, 0, 1, 1,
0.810155, 0.05960948, 1.375768, 0.7333333, 0, 1, 1,
0.8106003, 0.8029973, 1.475849, 0.7411765, 0, 1, 1,
0.8127697, 0.04661332, 3.056071, 0.7450981, 0, 1, 1,
0.81408, 0.339916, 1.239473, 0.7529412, 0, 1, 1,
0.8212184, 0.04489363, 1.535052, 0.7568628, 0, 1, 1,
0.8242835, -1.021894, 0.01527292, 0.7647059, 0, 1, 1,
0.8245987, -1.174382, 2.235845, 0.7686275, 0, 1, 1,
0.8301991, -0.09108657, 1.204415, 0.7764706, 0, 1, 1,
0.8394032, -1.067559, 1.633923, 0.7803922, 0, 1, 1,
0.8422624, 0.7661261, 1.074905, 0.7882353, 0, 1, 1,
0.8426726, 0.1715075, 0.8130111, 0.7921569, 0, 1, 1,
0.8557926, -0.7294568, 1.431736, 0.8, 0, 1, 1,
0.8568716, -0.6813759, 4.014497, 0.8078431, 0, 1, 1,
0.8572975, 0.7450472, 1.398233, 0.8117647, 0, 1, 1,
0.8630114, 0.6809654, 1.027311, 0.8196079, 0, 1, 1,
0.8632707, -1.108119, 3.523569, 0.8235294, 0, 1, 1,
0.8649257, -1.030553, 3.095273, 0.8313726, 0, 1, 1,
0.8672842, 0.3387894, 1.507363, 0.8352941, 0, 1, 1,
0.8704206, -3.047809, 2.352854, 0.8431373, 0, 1, 1,
0.8747711, 1.659995, 2.435245, 0.8470588, 0, 1, 1,
0.8774924, 1.040923, 0.09539195, 0.854902, 0, 1, 1,
0.8825899, -0.4340873, 4.493453, 0.8588235, 0, 1, 1,
0.8835435, -1.66899, 2.744789, 0.8666667, 0, 1, 1,
0.8838087, 0.6662788, -1.027185, 0.8705882, 0, 1, 1,
0.8876096, 0.7594567, 1.565882, 0.8784314, 0, 1, 1,
0.8884079, -1.083423, 3.317873, 0.8823529, 0, 1, 1,
0.8920121, -1.893829, 1.797355, 0.8901961, 0, 1, 1,
0.8920939, -0.4192909, 2.223099, 0.8941177, 0, 1, 1,
0.8923182, -0.5225773, 2.989315, 0.9019608, 0, 1, 1,
0.8970999, -0.3129286, 2.091959, 0.9098039, 0, 1, 1,
0.8973269, -2.441896, 2.750452, 0.9137255, 0, 1, 1,
0.8980143, -0.9743574, 1.048307, 0.9215686, 0, 1, 1,
0.9009067, 0.887426, 0.874782, 0.9254902, 0, 1, 1,
0.9018841, 0.3997039, 2.810849, 0.9333333, 0, 1, 1,
0.9080644, -0.8539166, 3.345824, 0.9372549, 0, 1, 1,
0.9131163, 0.4489132, 1.005324, 0.945098, 0, 1, 1,
0.915273, 1.858553, 1.022987, 0.9490196, 0, 1, 1,
0.9234688, -0.335954, 0.5878547, 0.9568627, 0, 1, 1,
0.9258384, 0.9649389, 0.5034893, 0.9607843, 0, 1, 1,
0.9324374, 0.9363346, 1.961348, 0.9686275, 0, 1, 1,
0.9340909, 0.2912678, 2.051827, 0.972549, 0, 1, 1,
0.9387191, 1.065899, -0.7561663, 0.9803922, 0, 1, 1,
0.9406589, -1.243116, 3.964251, 0.9843137, 0, 1, 1,
0.9417259, 0.6858141, 0.007183671, 0.9921569, 0, 1, 1,
0.9459172, 0.8466698, 4.361452, 0.9960784, 0, 1, 1,
0.9461303, 0.3476084, 0.1760275, 1, 0, 0.9960784, 1,
0.947464, 1.20394, -0.415758, 1, 0, 0.9882353, 1,
0.9479935, 0.3848606, 0.9658703, 1, 0, 0.9843137, 1,
0.9499295, -0.3401434, 4.598711, 1, 0, 0.9764706, 1,
0.9503714, 0.0003276642, 2.14135, 1, 0, 0.972549, 1,
0.9636502, -2.09729, 4.049903, 1, 0, 0.9647059, 1,
0.9744245, 2.74402, -1.030694, 1, 0, 0.9607843, 1,
0.9825478, -0.4345994, 0.8241184, 1, 0, 0.9529412, 1,
0.9905282, -0.903859, 2.90108, 1, 0, 0.9490196, 1,
0.9906669, -0.04647209, 0.9691563, 1, 0, 0.9411765, 1,
0.9980262, 0.2051402, 1.645032, 1, 0, 0.9372549, 1,
1.002813, -0.9116768, 2.005432, 1, 0, 0.9294118, 1,
1.003617, -0.4165171, 3.464063, 1, 0, 0.9254902, 1,
1.010291, -0.3362327, 2.915506, 1, 0, 0.9176471, 1,
1.015017, 0.2165812, 1.856197, 1, 0, 0.9137255, 1,
1.018902, -0.3459268, 3.502657, 1, 0, 0.9058824, 1,
1.020026, 1.190444, 0.09045407, 1, 0, 0.9019608, 1,
1.020343, -0.1058046, 2.481571, 1, 0, 0.8941177, 1,
1.03152, -1.01355, 3.314345, 1, 0, 0.8862745, 1,
1.032182, 0.9107656, 1.203777, 1, 0, 0.8823529, 1,
1.035962, -0.7872065, 0.4529421, 1, 0, 0.8745098, 1,
1.037759, -0.8256081, 2.514581, 1, 0, 0.8705882, 1,
1.039383, 1.791124, 0.9437351, 1, 0, 0.8627451, 1,
1.040296, 1.848986, -0.4511739, 1, 0, 0.8588235, 1,
1.042496, 0.5062971, -0.03965014, 1, 0, 0.8509804, 1,
1.04297, -0.3788083, 0.586646, 1, 0, 0.8470588, 1,
1.043507, -1.357904, 3.333731, 1, 0, 0.8392157, 1,
1.045516, -0.2387612, 2.094949, 1, 0, 0.8352941, 1,
1.052433, 0.8063098, 0.5596797, 1, 0, 0.827451, 1,
1.05653, 0.3021263, 2.093538, 1, 0, 0.8235294, 1,
1.060856, 0.9625973, 0.7207191, 1, 0, 0.8156863, 1,
1.061036, 0.4025206, -0.4954728, 1, 0, 0.8117647, 1,
1.061151, -0.3719562, 2.365674, 1, 0, 0.8039216, 1,
1.064852, -0.2041802, 1.651261, 1, 0, 0.7960784, 1,
1.065064, -1.172374, 3.158182, 1, 0, 0.7921569, 1,
1.068425, 0.9800602, 0.9550611, 1, 0, 0.7843137, 1,
1.072129, -1.059644, 4.430312, 1, 0, 0.7803922, 1,
1.074532, 0.7309808, 2.866696, 1, 0, 0.772549, 1,
1.074933, -0.9474515, 0.4594424, 1, 0, 0.7686275, 1,
1.075857, -0.5234896, 2.418127, 1, 0, 0.7607843, 1,
1.081786, -0.08140305, 2.186331, 1, 0, 0.7568628, 1,
1.084497, 0.6303607, 0.1097659, 1, 0, 0.7490196, 1,
1.085699, 0.03641354, 2.507249, 1, 0, 0.7450981, 1,
1.105546, 0.1979422, -0.00448202, 1, 0, 0.7372549, 1,
1.107894, 0.4664443, -0.3657247, 1, 0, 0.7333333, 1,
1.114618, 0.7361346, 0.278631, 1, 0, 0.7254902, 1,
1.119114, -1.150784, 0.1641881, 1, 0, 0.7215686, 1,
1.124388, 1.155626, 1.5264, 1, 0, 0.7137255, 1,
1.137742, -0.2055725, 1.166649, 1, 0, 0.7098039, 1,
1.138658, 0.4853892, 0.2936234, 1, 0, 0.7019608, 1,
1.144625, -1.372543, 2.265085, 1, 0, 0.6941177, 1,
1.152035, -0.4343049, 1.879269, 1, 0, 0.6901961, 1,
1.153629, -0.9191044, 3.85236, 1, 0, 0.682353, 1,
1.154276, -0.5274277, 0.9598778, 1, 0, 0.6784314, 1,
1.15574, -0.9338307, 2.40917, 1, 0, 0.6705883, 1,
1.161627, 1.637958, 0.280061, 1, 0, 0.6666667, 1,
1.162245, 1.09399, 1.011036, 1, 0, 0.6588235, 1,
1.165746, -0.2722515, 2.368583, 1, 0, 0.654902, 1,
1.172657, -0.1341361, 1.29895, 1, 0, 0.6470588, 1,
1.197217, -1.518714, 3.036476, 1, 0, 0.6431373, 1,
1.202915, 0.04081657, 2.578179, 1, 0, 0.6352941, 1,
1.204132, 0.2499127, 1.007404, 1, 0, 0.6313726, 1,
1.230986, 0.2697042, 0.9031898, 1, 0, 0.6235294, 1,
1.233878, 0.2260819, 2.081361, 1, 0, 0.6196079, 1,
1.238776, 0.9157611, 1.182106, 1, 0, 0.6117647, 1,
1.239164, -0.3255722, 0.6034459, 1, 0, 0.6078432, 1,
1.239457, -0.5049656, 0.180446, 1, 0, 0.6, 1,
1.242382, 0.5863054, 0.2885671, 1, 0, 0.5921569, 1,
1.244213, 0.4446828, 0.3670867, 1, 0, 0.5882353, 1,
1.247693, 0.1362156, 2.866351, 1, 0, 0.5803922, 1,
1.25229, 0.7696804, 2.479684, 1, 0, 0.5764706, 1,
1.280764, 0.9723569, 1.236956, 1, 0, 0.5686275, 1,
1.285695, 0.6346853, 1.118074, 1, 0, 0.5647059, 1,
1.285895, -0.1115255, 1.638171, 1, 0, 0.5568628, 1,
1.294456, 1.048827, 1.292404, 1, 0, 0.5529412, 1,
1.29484, 0.969943, 0.07555573, 1, 0, 0.5450981, 1,
1.30912, 0.9479344, 1.150442, 1, 0, 0.5411765, 1,
1.317192, -1.882031, 2.045592, 1, 0, 0.5333334, 1,
1.332171, -0.01682005, 1.850862, 1, 0, 0.5294118, 1,
1.341993, 1.573599, -0.1084932, 1, 0, 0.5215687, 1,
1.349215, -0.9002099, 0.5940008, 1, 0, 0.5176471, 1,
1.362895, -0.9910012, 2.359388, 1, 0, 0.509804, 1,
1.3637, -0.624824, 4.35513, 1, 0, 0.5058824, 1,
1.363776, -0.4673102, 2.199385, 1, 0, 0.4980392, 1,
1.382603, 0.4795527, 0.7347318, 1, 0, 0.4901961, 1,
1.387582, -0.4612304, 3.612977, 1, 0, 0.4862745, 1,
1.391672, 1.045095, 3.079993, 1, 0, 0.4784314, 1,
1.404892, -0.3923424, 1.70526, 1, 0, 0.4745098, 1,
1.416091, 0.1940755, 0.3803282, 1, 0, 0.4666667, 1,
1.41691, 3.672322, -1.218592, 1, 0, 0.4627451, 1,
1.423634, 1.278283, 1.916187, 1, 0, 0.454902, 1,
1.426303, 2.118316, 0.9257197, 1, 0, 0.4509804, 1,
1.42772, 0.5201679, 0.390561, 1, 0, 0.4431373, 1,
1.439899, -1.819251, 2.160684, 1, 0, 0.4392157, 1,
1.445746, -0.3084188, 1.082752, 1, 0, 0.4313726, 1,
1.462592, 1.473974, 1.092462, 1, 0, 0.427451, 1,
1.465219, -0.1001566, -0.004708002, 1, 0, 0.4196078, 1,
1.477346, -1.279888, 1.72243, 1, 0, 0.4156863, 1,
1.478245, 0.06340288, 2.519857, 1, 0, 0.4078431, 1,
1.511461, 1.154683, 1.484344, 1, 0, 0.4039216, 1,
1.514213, -0.2271405, 1.552028, 1, 0, 0.3960784, 1,
1.519053, -1.983748, 2.966443, 1, 0, 0.3882353, 1,
1.535085, -0.05907762, 2.302598, 1, 0, 0.3843137, 1,
1.553173, 1.441176, 0.3480917, 1, 0, 0.3764706, 1,
1.567077, -0.7912989, 0.8444345, 1, 0, 0.372549, 1,
1.57346, -0.09493747, 2.402244, 1, 0, 0.3647059, 1,
1.574849, 0.7071813, 0.02735019, 1, 0, 0.3607843, 1,
1.583494, 1.761368, 1.562557, 1, 0, 0.3529412, 1,
1.586861, 1.098995, 0.3644975, 1, 0, 0.3490196, 1,
1.597231, -0.620196, 1.453455, 1, 0, 0.3411765, 1,
1.607921, -0.3223275, -0.2012835, 1, 0, 0.3372549, 1,
1.634747, 1.038073, 0.4426437, 1, 0, 0.3294118, 1,
1.643263, 2.942738, 0.3602296, 1, 0, 0.3254902, 1,
1.645277, 0.1278836, 1.645736, 1, 0, 0.3176471, 1,
1.651239, -0.4153537, 1.919143, 1, 0, 0.3137255, 1,
1.659633, 0.3263172, 1.356066, 1, 0, 0.3058824, 1,
1.687408, 1.978486, 0.8935913, 1, 0, 0.2980392, 1,
1.689025, -0.6998086, 1.37656, 1, 0, 0.2941177, 1,
1.719009, 0.1838263, 3.824169, 1, 0, 0.2862745, 1,
1.719227, 0.7336364, 1.886634, 1, 0, 0.282353, 1,
1.723685, -0.3628735, 1.992103, 1, 0, 0.2745098, 1,
1.739906, 0.4869661, 0.7038631, 1, 0, 0.2705882, 1,
1.742484, -0.07332682, 2.11941, 1, 0, 0.2627451, 1,
1.746481, -0.7165968, 2.387328, 1, 0, 0.2588235, 1,
1.778321, 1.6242, 0.1909194, 1, 0, 0.2509804, 1,
1.789068, -0.2642053, 1.913082, 1, 0, 0.2470588, 1,
1.790185, 1.294061, 0.8762585, 1, 0, 0.2392157, 1,
1.805784, 0.8213946, 0.7099661, 1, 0, 0.2352941, 1,
1.806668, 0.06220764, 1.828776, 1, 0, 0.227451, 1,
1.829922, -0.7938547, 3.18019, 1, 0, 0.2235294, 1,
1.833884, 1.88668, -0.6545022, 1, 0, 0.2156863, 1,
1.842772, 0.053979, 0.4468074, 1, 0, 0.2117647, 1,
1.851443, -0.4717751, 2.098839, 1, 0, 0.2039216, 1,
1.853461, -1.732786, 0.4502811, 1, 0, 0.1960784, 1,
1.85602, -1.180042, 0.6787799, 1, 0, 0.1921569, 1,
1.877186, -1.134434, 2.421704, 1, 0, 0.1843137, 1,
1.884498, -0.1867296, 2.222521, 1, 0, 0.1803922, 1,
1.93214, 1.370186, 2.211273, 1, 0, 0.172549, 1,
1.932895, 0.01405076, 2.920583, 1, 0, 0.1686275, 1,
1.961937, -0.9664034, 0.3696336, 1, 0, 0.1607843, 1,
1.964016, -0.6491541, 0.2650827, 1, 0, 0.1568628, 1,
1.967995, 0.4455238, 0.3413358, 1, 0, 0.1490196, 1,
1.985712, 1.092758, 2.242513, 1, 0, 0.145098, 1,
1.992856, -0.5904223, 0.4406917, 1, 0, 0.1372549, 1,
2.059859, 0.5729427, 3.298558, 1, 0, 0.1333333, 1,
2.068851, 0.2578857, 1.80313, 1, 0, 0.1254902, 1,
2.102257, -1.571193, 2.661211, 1, 0, 0.1215686, 1,
2.140904, -0.4139591, 0.1579246, 1, 0, 0.1137255, 1,
2.160781, -0.009664828, 0.0773158, 1, 0, 0.1098039, 1,
2.177348, 0.4165118, 1.33953, 1, 0, 0.1019608, 1,
2.209791, 0.3060511, 1.089712, 1, 0, 0.09411765, 1,
2.285222, -0.5641035, 2.036279, 1, 0, 0.09019608, 1,
2.292781, 2.105819, 1.875955, 1, 0, 0.08235294, 1,
2.313517, 0.4484789, 0.3329155, 1, 0, 0.07843138, 1,
2.41731, -0.535763, 0.6416591, 1, 0, 0.07058824, 1,
2.424555, 0.08146776, 1.347671, 1, 0, 0.06666667, 1,
2.508176, 1.764422, 0.743714, 1, 0, 0.05882353, 1,
2.588738, 0.3393423, 1.324126, 1, 0, 0.05490196, 1,
2.64313, 0.1169006, 1.024723, 1, 0, 0.04705882, 1,
2.651616, 0.1409175, 3.901867, 1, 0, 0.04313726, 1,
2.675459, 0.790807, 1.276287, 1, 0, 0.03529412, 1,
2.930822, 3.198335, 0.8402792, 1, 0, 0.03137255, 1,
2.983049, -0.6740806, 0.352953, 1, 0, 0.02352941, 1,
3.082192, -1.457759, 3.861925, 1, 0, 0.01960784, 1,
3.221536, 0.3922682, 1.838682, 1, 0, 0.01176471, 1,
3.41476, -0.9050558, 2.143812, 1, 0, 0.007843138, 1
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
0.2412124, -4.186871, -7.054238, 0, -0.5, 0.5, 0.5,
0.2412124, -4.186871, -7.054238, 1, -0.5, 0.5, 0.5,
0.2412124, -4.186871, -7.054238, 1, 1.5, 0.5, 0.5,
0.2412124, -4.186871, -7.054238, 0, 1.5, 0.5, 0.5
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
-4.008168, 0.3122567, -7.054238, 0, -0.5, 0.5, 0.5,
-4.008168, 0.3122567, -7.054238, 1, -0.5, 0.5, 0.5,
-4.008168, 0.3122567, -7.054238, 1, 1.5, 0.5, 0.5,
-4.008168, 0.3122567, -7.054238, 0, 1.5, 0.5, 0.5
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
-4.008168, -4.186871, -0.1848967, 0, -0.5, 0.5, 0.5,
-4.008168, -4.186871, -0.1848967, 1, -0.5, 0.5, 0.5,
-4.008168, -4.186871, -0.1848967, 1, 1.5, 0.5, 0.5,
-4.008168, -4.186871, -0.1848967, 0, 1.5, 0.5, 0.5
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
-2, -3.148611, -5.469005,
3, -3.148611, -5.469005,
-2, -3.148611, -5.469005,
-2, -3.321654, -5.733211,
-1, -3.148611, -5.469005,
-1, -3.321654, -5.733211,
0, -3.148611, -5.469005,
0, -3.321654, -5.733211,
1, -3.148611, -5.469005,
1, -3.321654, -5.733211,
2, -3.148611, -5.469005,
2, -3.321654, -5.733211,
3, -3.148611, -5.469005,
3, -3.321654, -5.733211
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
-2, -3.667741, -6.261621, 0, -0.5, 0.5, 0.5,
-2, -3.667741, -6.261621, 1, -0.5, 0.5, 0.5,
-2, -3.667741, -6.261621, 1, 1.5, 0.5, 0.5,
-2, -3.667741, -6.261621, 0, 1.5, 0.5, 0.5,
-1, -3.667741, -6.261621, 0, -0.5, 0.5, 0.5,
-1, -3.667741, -6.261621, 1, -0.5, 0.5, 0.5,
-1, -3.667741, -6.261621, 1, 1.5, 0.5, 0.5,
-1, -3.667741, -6.261621, 0, 1.5, 0.5, 0.5,
0, -3.667741, -6.261621, 0, -0.5, 0.5, 0.5,
0, -3.667741, -6.261621, 1, -0.5, 0.5, 0.5,
0, -3.667741, -6.261621, 1, 1.5, 0.5, 0.5,
0, -3.667741, -6.261621, 0, 1.5, 0.5, 0.5,
1, -3.667741, -6.261621, 0, -0.5, 0.5, 0.5,
1, -3.667741, -6.261621, 1, -0.5, 0.5, 0.5,
1, -3.667741, -6.261621, 1, 1.5, 0.5, 0.5,
1, -3.667741, -6.261621, 0, 1.5, 0.5, 0.5,
2, -3.667741, -6.261621, 0, -0.5, 0.5, 0.5,
2, -3.667741, -6.261621, 1, -0.5, 0.5, 0.5,
2, -3.667741, -6.261621, 1, 1.5, 0.5, 0.5,
2, -3.667741, -6.261621, 0, 1.5, 0.5, 0.5,
3, -3.667741, -6.261621, 0, -0.5, 0.5, 0.5,
3, -3.667741, -6.261621, 1, -0.5, 0.5, 0.5,
3, -3.667741, -6.261621, 1, 1.5, 0.5, 0.5,
3, -3.667741, -6.261621, 0, 1.5, 0.5, 0.5
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
-3.027542, -3, -5.469005,
-3.027542, 3, -5.469005,
-3.027542, -3, -5.469005,
-3.190979, -3, -5.733211,
-3.027542, -2, -5.469005,
-3.190979, -2, -5.733211,
-3.027542, -1, -5.469005,
-3.190979, -1, -5.733211,
-3.027542, 0, -5.469005,
-3.190979, 0, -5.733211,
-3.027542, 1, -5.469005,
-3.190979, 1, -5.733211,
-3.027542, 2, -5.469005,
-3.190979, 2, -5.733211,
-3.027542, 3, -5.469005,
-3.190979, 3, -5.733211
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
-3.517855, -3, -6.261621, 0, -0.5, 0.5, 0.5,
-3.517855, -3, -6.261621, 1, -0.5, 0.5, 0.5,
-3.517855, -3, -6.261621, 1, 1.5, 0.5, 0.5,
-3.517855, -3, -6.261621, 0, 1.5, 0.5, 0.5,
-3.517855, -2, -6.261621, 0, -0.5, 0.5, 0.5,
-3.517855, -2, -6.261621, 1, -0.5, 0.5, 0.5,
-3.517855, -2, -6.261621, 1, 1.5, 0.5, 0.5,
-3.517855, -2, -6.261621, 0, 1.5, 0.5, 0.5,
-3.517855, -1, -6.261621, 0, -0.5, 0.5, 0.5,
-3.517855, -1, -6.261621, 1, -0.5, 0.5, 0.5,
-3.517855, -1, -6.261621, 1, 1.5, 0.5, 0.5,
-3.517855, -1, -6.261621, 0, 1.5, 0.5, 0.5,
-3.517855, 0, -6.261621, 0, -0.5, 0.5, 0.5,
-3.517855, 0, -6.261621, 1, -0.5, 0.5, 0.5,
-3.517855, 0, -6.261621, 1, 1.5, 0.5, 0.5,
-3.517855, 0, -6.261621, 0, 1.5, 0.5, 0.5,
-3.517855, 1, -6.261621, 0, -0.5, 0.5, 0.5,
-3.517855, 1, -6.261621, 1, -0.5, 0.5, 0.5,
-3.517855, 1, -6.261621, 1, 1.5, 0.5, 0.5,
-3.517855, 1, -6.261621, 0, 1.5, 0.5, 0.5,
-3.517855, 2, -6.261621, 0, -0.5, 0.5, 0.5,
-3.517855, 2, -6.261621, 1, -0.5, 0.5, 0.5,
-3.517855, 2, -6.261621, 1, 1.5, 0.5, 0.5,
-3.517855, 2, -6.261621, 0, 1.5, 0.5, 0.5,
-3.517855, 3, -6.261621, 0, -0.5, 0.5, 0.5,
-3.517855, 3, -6.261621, 1, -0.5, 0.5, 0.5,
-3.517855, 3, -6.261621, 1, 1.5, 0.5, 0.5,
-3.517855, 3, -6.261621, 0, 1.5, 0.5, 0.5
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
-3.027542, -3.148611, -4,
-3.027542, -3.148611, 4,
-3.027542, -3.148611, -4,
-3.190979, -3.321654, -4,
-3.027542, -3.148611, -2,
-3.190979, -3.321654, -2,
-3.027542, -3.148611, 0,
-3.190979, -3.321654, 0,
-3.027542, -3.148611, 2,
-3.190979, -3.321654, 2,
-3.027542, -3.148611, 4,
-3.190979, -3.321654, 4
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
-3.517855, -3.667741, -4, 0, -0.5, 0.5, 0.5,
-3.517855, -3.667741, -4, 1, -0.5, 0.5, 0.5,
-3.517855, -3.667741, -4, 1, 1.5, 0.5, 0.5,
-3.517855, -3.667741, -4, 0, 1.5, 0.5, 0.5,
-3.517855, -3.667741, -2, 0, -0.5, 0.5, 0.5,
-3.517855, -3.667741, -2, 1, -0.5, 0.5, 0.5,
-3.517855, -3.667741, -2, 1, 1.5, 0.5, 0.5,
-3.517855, -3.667741, -2, 0, 1.5, 0.5, 0.5,
-3.517855, -3.667741, 0, 0, -0.5, 0.5, 0.5,
-3.517855, -3.667741, 0, 1, -0.5, 0.5, 0.5,
-3.517855, -3.667741, 0, 1, 1.5, 0.5, 0.5,
-3.517855, -3.667741, 0, 0, 1.5, 0.5, 0.5,
-3.517855, -3.667741, 2, 0, -0.5, 0.5, 0.5,
-3.517855, -3.667741, 2, 1, -0.5, 0.5, 0.5,
-3.517855, -3.667741, 2, 1, 1.5, 0.5, 0.5,
-3.517855, -3.667741, 2, 0, 1.5, 0.5, 0.5,
-3.517855, -3.667741, 4, 0, -0.5, 0.5, 0.5,
-3.517855, -3.667741, 4, 1, -0.5, 0.5, 0.5,
-3.517855, -3.667741, 4, 1, 1.5, 0.5, 0.5,
-3.517855, -3.667741, 4, 0, 1.5, 0.5, 0.5
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
-3.027542, -3.148611, -5.469005,
-3.027542, 3.773124, -5.469005,
-3.027542, -3.148611, 5.099212,
-3.027542, 3.773124, 5.099212,
-3.027542, -3.148611, -5.469005,
-3.027542, -3.148611, 5.099212,
-3.027542, 3.773124, -5.469005,
-3.027542, 3.773124, 5.099212,
-3.027542, -3.148611, -5.469005,
3.509966, -3.148611, -5.469005,
-3.027542, -3.148611, 5.099212,
3.509966, -3.148611, 5.099212,
-3.027542, 3.773124, -5.469005,
3.509966, 3.773124, -5.469005,
-3.027542, 3.773124, 5.099212,
3.509966, 3.773124, 5.099212,
3.509966, -3.148611, -5.469005,
3.509966, 3.773124, -5.469005,
3.509966, -3.148611, 5.099212,
3.509966, 3.773124, 5.099212,
3.509966, -3.148611, -5.469005,
3.509966, -3.148611, 5.099212,
3.509966, 3.773124, -5.469005,
3.509966, 3.773124, 5.099212
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
var radius = 7.595611;
var distance = 33.79374;
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
mvMatrix.translate( -0.2412124, -0.3122567, 0.1848967 );
mvMatrix.scale( 1.256216, 1.186483, 0.7770965 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79374);
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
Deltamethrin<-read.table("Deltamethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Deltamethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Deltamethrin' not found
```

```r
y<-Deltamethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Deltamethrin' not found
```

```r
z<-Deltamethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Deltamethrin' not found
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
-2.932335, -0.9452196, -2.428989, 0, 0, 1, 1, 1,
-2.892382, 0.09357829, -0.4712904, 1, 0, 0, 1, 1,
-2.779344, -0.9442446, -3.870282, 1, 0, 0, 1, 1,
-2.674637, -0.01688536, -1.877247, 1, 0, 0, 1, 1,
-2.39596, -0.4684587, -1.747361, 1, 0, 0, 1, 1,
-2.369408, -1.050467, -2.523333, 1, 0, 0, 1, 1,
-2.26466, -2.096365, -3.146994, 0, 0, 0, 1, 1,
-2.194513, 0.04215941, -1.75374, 0, 0, 0, 1, 1,
-2.111011, 0.411182, -2.317812, 0, 0, 0, 1, 1,
-2.107812, 0.07417578, -1.76772, 0, 0, 0, 1, 1,
-2.042398, 1.01186, 0.9789422, 0, 0, 0, 1, 1,
-2.031123, 0.5670455, -0.2716598, 0, 0, 0, 1, 1,
-2.023366, 0.5234864, -1.541503, 0, 0, 0, 1, 1,
-2.022771, -0.7698929, -1.815021, 1, 1, 1, 1, 1,
-1.995784, -0.4899624, -1.856961, 1, 1, 1, 1, 1,
-1.993605, -0.4003625, -1.685962, 1, 1, 1, 1, 1,
-1.974357, -1.123, -1.177231, 1, 1, 1, 1, 1,
-1.962806, 0.3250149, -1.696346, 1, 1, 1, 1, 1,
-1.948126, -0.4034712, -2.872541, 1, 1, 1, 1, 1,
-1.922943, 0.1389669, -0.3685449, 1, 1, 1, 1, 1,
-1.920611, 2.528715, -0.4031796, 1, 1, 1, 1, 1,
-1.914282, 0.09963495, -0.8738959, 1, 1, 1, 1, 1,
-1.912822, 1.760998, 0.6038223, 1, 1, 1, 1, 1,
-1.888752, 0.9699163, -2.545353, 1, 1, 1, 1, 1,
-1.829165, -0.7485386, -0.9069195, 1, 1, 1, 1, 1,
-1.828767, 0.6099631, -1.825599, 1, 1, 1, 1, 1,
-1.818378, 2.432076, 1.101631, 1, 1, 1, 1, 1,
-1.798939, 1.058608, -0.05171501, 1, 1, 1, 1, 1,
-1.79219, -0.5176237, -1.15019, 0, 0, 1, 1, 1,
-1.789942, -0.5344963, -1.943714, 1, 0, 0, 1, 1,
-1.789878, 1.223006, 0.8961825, 1, 0, 0, 1, 1,
-1.785449, -0.5190583, -1.553455, 1, 0, 0, 1, 1,
-1.782493, 0.5265214, -2.139266, 1, 0, 0, 1, 1,
-1.773445, 1.889907, -0.8218934, 1, 0, 0, 1, 1,
-1.75106, 0.6434192, -0.9760549, 0, 0, 0, 1, 1,
-1.743484, 1.994887, -1.019514, 0, 0, 0, 1, 1,
-1.736506, 1.002814, 0.5950052, 0, 0, 0, 1, 1,
-1.716224, -0.2959238, -3.355181, 0, 0, 0, 1, 1,
-1.700489, 1.514348, -1.264277, 0, 0, 0, 1, 1,
-1.683328, 1.475368, 0.4645532, 0, 0, 0, 1, 1,
-1.677014, -0.5453318, -0.09344142, 0, 0, 0, 1, 1,
-1.675752, -1.651248, -1.285047, 1, 1, 1, 1, 1,
-1.670839, 0.5159567, -1.715776, 1, 1, 1, 1, 1,
-1.658834, -1.801305, -1.246664, 1, 1, 1, 1, 1,
-1.653632, 0.2769997, 0.9859982, 1, 1, 1, 1, 1,
-1.652587, -0.02195116, -1.076572, 1, 1, 1, 1, 1,
-1.652078, -0.3260888, -4.086031, 1, 1, 1, 1, 1,
-1.643762, 0.3752246, -1.227202, 1, 1, 1, 1, 1,
-1.63741, -1.260012, -3.999065, 1, 1, 1, 1, 1,
-1.635973, 1.076448, 0.6331376, 1, 1, 1, 1, 1,
-1.628689, -0.2443188, -0.1765445, 1, 1, 1, 1, 1,
-1.612562, -0.3119172, -1.2569, 1, 1, 1, 1, 1,
-1.589363, -0.271021, -1.813244, 1, 1, 1, 1, 1,
-1.586451, -2.040526, -4.279192, 1, 1, 1, 1, 1,
-1.585705, 0.641023, -3.604679, 1, 1, 1, 1, 1,
-1.580562, -1.54831, -3.568107, 1, 1, 1, 1, 1,
-1.572924, -0.7843951, -3.867185, 0, 0, 1, 1, 1,
-1.541631, -1.996783, -2.8684, 1, 0, 0, 1, 1,
-1.537881, 0.2942977, -1.7048, 1, 0, 0, 1, 1,
-1.530404, 1.847801, 0.8453063, 1, 0, 0, 1, 1,
-1.52987, -0.8500881, -1.558601, 1, 0, 0, 1, 1,
-1.529765, 0.5164587, -3.117915, 1, 0, 0, 1, 1,
-1.528791, -1.149323, -1.833765, 0, 0, 0, 1, 1,
-1.527871, 1.489358, -0.9389663, 0, 0, 0, 1, 1,
-1.519144, -0.6126135, -1.501709, 0, 0, 0, 1, 1,
-1.517867, -0.3577874, -0.7774493, 0, 0, 0, 1, 1,
-1.502097, 0.5327461, -1.690712, 0, 0, 0, 1, 1,
-1.492031, -1.477848, -2.925952, 0, 0, 0, 1, 1,
-1.486619, 0.963293, -1.109885, 0, 0, 0, 1, 1,
-1.485489, 1.319823, 0.08039691, 1, 1, 1, 1, 1,
-1.482427, -0.08039407, -1.267571, 1, 1, 1, 1, 1,
-1.479549, 0.05537405, -1.63449, 1, 1, 1, 1, 1,
-1.474372, -0.141658, -1.611755, 1, 1, 1, 1, 1,
-1.470251, 0.0430735, -2.394678, 1, 1, 1, 1, 1,
-1.468488, 1.376653, -0.8042854, 1, 1, 1, 1, 1,
-1.462919, 0.2944648, -1.853457, 1, 1, 1, 1, 1,
-1.448515, -1.716612, -1.691176, 1, 1, 1, 1, 1,
-1.442859, 1.493412, -0.9059461, 1, 1, 1, 1, 1,
-1.437066, -0.2169511, -3.11466, 1, 1, 1, 1, 1,
-1.430338, 0.3701203, -1.781283, 1, 1, 1, 1, 1,
-1.427464, 0.4895263, -2.12105, 1, 1, 1, 1, 1,
-1.426641, 0.5123331, -1.493911, 1, 1, 1, 1, 1,
-1.423327, -0.1251686, -0.2842603, 1, 1, 1, 1, 1,
-1.418864, 1.363221, 0.165023, 1, 1, 1, 1, 1,
-1.399608, -2.08441, -2.806589, 0, 0, 1, 1, 1,
-1.396434, -1.687588, -3.503503, 1, 0, 0, 1, 1,
-1.390172, 0.375848, 0.1784976, 1, 0, 0, 1, 1,
-1.381482, 0.9842115, -2.123324, 1, 0, 0, 1, 1,
-1.374419, 0.2807666, -1.687891, 1, 0, 0, 1, 1,
-1.366212, 0.9898539, 0.526312, 1, 0, 0, 1, 1,
-1.337817, 1.023643, -1.774673, 0, 0, 0, 1, 1,
-1.333782, -0.3844947, -2.510849, 0, 0, 0, 1, 1,
-1.328872, 1.295865, -1.274135, 0, 0, 0, 1, 1,
-1.321427, 1.448739, -0.1559072, 0, 0, 0, 1, 1,
-1.319938, 0.00311335, -1.450945, 0, 0, 0, 1, 1,
-1.319633, -1.164427, 0.7353804, 0, 0, 0, 1, 1,
-1.307298, 1.563792, -2.479274, 0, 0, 0, 1, 1,
-1.304018, 1.937424, -0.465362, 1, 1, 1, 1, 1,
-1.303968, 0.1015113, -1.14255, 1, 1, 1, 1, 1,
-1.30344, 1.19075, -0.3915932, 1, 1, 1, 1, 1,
-1.299164, 0.4363098, -0.5741072, 1, 1, 1, 1, 1,
-1.297151, -0.9415773, -1.673672, 1, 1, 1, 1, 1,
-1.281509, -1.344341, -2.977682, 1, 1, 1, 1, 1,
-1.278573, 1.055712, -1.541158, 1, 1, 1, 1, 1,
-1.275428, 0.5156206, -2.590075, 1, 1, 1, 1, 1,
-1.274932, 1.921203, -0.5478264, 1, 1, 1, 1, 1,
-1.274155, -1.702196, -2.727254, 1, 1, 1, 1, 1,
-1.265853, -0.8973506, -0.7209455, 1, 1, 1, 1, 1,
-1.265489, 0.9264016, -0.08623382, 1, 1, 1, 1, 1,
-1.261828, -0.5665784, -2.944907, 1, 1, 1, 1, 1,
-1.259846, -1.136764, -1.062365, 1, 1, 1, 1, 1,
-1.247323, 0.9626279, 0.5206379, 1, 1, 1, 1, 1,
-1.245848, 0.9865544, -0.4195556, 0, 0, 1, 1, 1,
-1.239938, -1.637923, -1.032495, 1, 0, 0, 1, 1,
-1.236388, -2.82144, -2.295769, 1, 0, 0, 1, 1,
-1.234829, 0.3956629, -0.2333694, 1, 0, 0, 1, 1,
-1.232912, -2.233405, -2.269649, 1, 0, 0, 1, 1,
-1.231778, -0.3729934, -3.207108, 1, 0, 0, 1, 1,
-1.229952, -1.393191, -2.509208, 0, 0, 0, 1, 1,
-1.221898, 0.2607518, -0.7040802, 0, 0, 0, 1, 1,
-1.205056, 0.7872131, -1.515594, 0, 0, 0, 1, 1,
-1.202566, 0.0003755784, -0.6243185, 0, 0, 0, 1, 1,
-1.199068, 0.4143454, -1.888257, 0, 0, 0, 1, 1,
-1.197335, 0.196528, 0.1258734, 0, 0, 0, 1, 1,
-1.197176, 0.02734379, -4.239837, 0, 0, 0, 1, 1,
-1.194583, 1.573935, -0.06965581, 1, 1, 1, 1, 1,
-1.177111, -0.2391298, -2.323795, 1, 1, 1, 1, 1,
-1.166007, 0.1868399, -2.498426, 1, 1, 1, 1, 1,
-1.138014, 1.211377, -0.9023085, 1, 1, 1, 1, 1,
-1.137989, 0.2347453, -0.7156345, 1, 1, 1, 1, 1,
-1.125142, -1.480992, -0.9774891, 1, 1, 1, 1, 1,
-1.117093, 0.1181342, -2.036871, 1, 1, 1, 1, 1,
-1.115697, 0.08113017, -2.190181, 1, 1, 1, 1, 1,
-1.112807, 1.240468, 1.154747, 1, 1, 1, 1, 1,
-1.106098, -0.5220026, -1.810625, 1, 1, 1, 1, 1,
-1.100566, 0.1914446, -0.2829546, 1, 1, 1, 1, 1,
-1.096466, -1.023174, -2.460243, 1, 1, 1, 1, 1,
-1.089677, 0.7979054, -1.038811, 1, 1, 1, 1, 1,
-1.088948, -0.6878315, -2.566369, 1, 1, 1, 1, 1,
-1.08584, -0.4578089, -1.858957, 1, 1, 1, 1, 1,
-1.084824, 0.3459174, 0.2669394, 0, 0, 1, 1, 1,
-1.077405, -0.5863847, -2.775881, 1, 0, 0, 1, 1,
-1.075294, 0.2113784, -1.331617, 1, 0, 0, 1, 1,
-1.068152, -0.5719373, -2.312994, 1, 0, 0, 1, 1,
-1.065731, -1.731973, -3.411958, 1, 0, 0, 1, 1,
-1.06171, 0.8951699, -1.700251, 1, 0, 0, 1, 1,
-1.059333, 0.7703634, -1.880782, 0, 0, 0, 1, 1,
-1.055656, -0.8293557, -3.302227, 0, 0, 0, 1, 1,
-1.055282, 1.489801, -0.6784556, 0, 0, 0, 1, 1,
-1.047053, 0.1977906, -0.8317616, 0, 0, 0, 1, 1,
-1.046793, 0.1107925, -1.828926, 0, 0, 0, 1, 1,
-1.042365, 1.083704, -1.762749, 0, 0, 0, 1, 1,
-1.04089, 0.4318991, -0.3245862, 0, 0, 0, 1, 1,
-1.03649, 0.07217512, -2.719647, 1, 1, 1, 1, 1,
-1.019795, 1.018598, 0.1926384, 1, 1, 1, 1, 1,
-1.016502, -0.2268462, -2.391784, 1, 1, 1, 1, 1,
-1.016318, -0.6158215, -2.890055, 1, 1, 1, 1, 1,
-1.005329, 0.6513824, -1.607522, 1, 1, 1, 1, 1,
-0.9901924, -0.995303, -4.325309, 1, 1, 1, 1, 1,
-0.9821129, -0.4948483, -3.340583, 1, 1, 1, 1, 1,
-0.9778856, -0.02757357, -1.346259, 1, 1, 1, 1, 1,
-0.9755744, -0.2097958, -1.015147, 1, 1, 1, 1, 1,
-0.9723279, 0.7745494, 0.1225015, 1, 1, 1, 1, 1,
-0.9691908, -1.041153, -2.493524, 1, 1, 1, 1, 1,
-0.963572, -0.1794691, -0.09312913, 1, 1, 1, 1, 1,
-0.9586358, 1.30403, 0.6996662, 1, 1, 1, 1, 1,
-0.9579726, -1.148214, -2.473308, 1, 1, 1, 1, 1,
-0.9493366, 0.8642253, -1.841378, 1, 1, 1, 1, 1,
-0.946305, 0.3627018, -1.030596, 0, 0, 1, 1, 1,
-0.9449365, -0.5018548, -3.284555, 1, 0, 0, 1, 1,
-0.9412983, 1.390619, 0.05769442, 1, 0, 0, 1, 1,
-0.9402488, -0.08819737, -1.280026, 1, 0, 0, 1, 1,
-0.9316652, 0.5501822, -1.432616, 1, 0, 0, 1, 1,
-0.9300087, 0.3425483, -2.172333, 1, 0, 0, 1, 1,
-0.9269478, -1.813351, -4.858759, 0, 0, 0, 1, 1,
-0.9251329, 1.828734, 0.505248, 0, 0, 0, 1, 1,
-0.9235807, -0.002352324, -1.399005, 0, 0, 0, 1, 1,
-0.9166953, -1.068329, -2.558784, 0, 0, 0, 1, 1,
-0.9166284, 0.482406, 0.136367, 0, 0, 0, 1, 1,
-0.9134677, 0.2179722, -1.038996, 0, 0, 0, 1, 1,
-0.9115639, -0.9668624, -2.138139, 0, 0, 0, 1, 1,
-0.9033892, -0.8517724, -0.7902635, 1, 1, 1, 1, 1,
-0.8955266, -0.403679, -1.578188, 1, 1, 1, 1, 1,
-0.8905848, 0.1024114, -1.523423, 1, 1, 1, 1, 1,
-0.8849313, -0.7950137, -1.796596, 1, 1, 1, 1, 1,
-0.8815003, 0.2838886, -1.495159, 1, 1, 1, 1, 1,
-0.8813583, 0.1373738, -1.670599, 1, 1, 1, 1, 1,
-0.8736994, 1.460414, -0.1907513, 1, 1, 1, 1, 1,
-0.86993, -0.1238436, -1.229267, 1, 1, 1, 1, 1,
-0.8645536, -0.6403456, -1.175225, 1, 1, 1, 1, 1,
-0.8538604, 1.244236, -0.008110525, 1, 1, 1, 1, 1,
-0.8492485, 1.131181, -1.671221, 1, 1, 1, 1, 1,
-0.8492365, 0.8167824, -1.576716, 1, 1, 1, 1, 1,
-0.8458692, -0.007825417, -1.748403, 1, 1, 1, 1, 1,
-0.8448241, -0.7941317, -1.476418, 1, 1, 1, 1, 1,
-0.8440402, 0.6075861, -1.496434, 1, 1, 1, 1, 1,
-0.8366559, -0.496954, -2.580572, 0, 0, 1, 1, 1,
-0.8328148, 0.4585708, -2.464356, 1, 0, 0, 1, 1,
-0.8259474, 1.420888, -1.320616, 1, 0, 0, 1, 1,
-0.8235913, -1.61079, -4.102013, 1, 0, 0, 1, 1,
-0.8203962, -1.229827, -2.34708, 1, 0, 0, 1, 1,
-0.8172408, 0.2951159, -1.005065, 1, 0, 0, 1, 1,
-0.7907559, -0.2460417, -1.834685, 0, 0, 0, 1, 1,
-0.7837732, 1.548916, -1.866688, 0, 0, 0, 1, 1,
-0.7811497, -1.203755, -3.522947, 0, 0, 0, 1, 1,
-0.7767352, -2.103354, -2.932838, 0, 0, 0, 1, 1,
-0.7763532, -2.131327, -3.175602, 0, 0, 0, 1, 1,
-0.773441, -0.2249475, -1.62802, 0, 0, 0, 1, 1,
-0.7713693, -0.5971432, -2.728006, 0, 0, 0, 1, 1,
-0.7643834, -1.004669, -1.453101, 1, 1, 1, 1, 1,
-0.7621213, 0.6765364, 0.01688552, 1, 1, 1, 1, 1,
-0.7534471, -0.3404433, -1.512422, 1, 1, 1, 1, 1,
-0.7517791, 0.06089573, -1.803054, 1, 1, 1, 1, 1,
-0.7509302, -0.2747363, -2.163358, 1, 1, 1, 1, 1,
-0.7502604, -0.1190629, -2.217444, 1, 1, 1, 1, 1,
-0.7502073, -1.592914, -2.742571, 1, 1, 1, 1, 1,
-0.7425729, 1.258487, -1.113478, 1, 1, 1, 1, 1,
-0.7405089, 1.365259, 0.2846471, 1, 1, 1, 1, 1,
-0.7354521, -1.576953, -2.906988, 1, 1, 1, 1, 1,
-0.731574, -1.269931, -2.30344, 1, 1, 1, 1, 1,
-0.7276618, 0.1010639, -1.786037, 1, 1, 1, 1, 1,
-0.7233628, -0.5566183, -2.097897, 1, 1, 1, 1, 1,
-0.7196165, 2.19968, -1.575538, 1, 1, 1, 1, 1,
-0.7171078, 0.06711285, 0.5831305, 1, 1, 1, 1, 1,
-0.7165632, 1.623941, 1.863248, 0, 0, 1, 1, 1,
-0.7159151, 0.935652, -0.4280035, 1, 0, 0, 1, 1,
-0.7137417, 1.580603, 0.2704469, 1, 0, 0, 1, 1,
-0.7113125, 0.1176125, -0.5586379, 1, 0, 0, 1, 1,
-0.7082214, -1.38512, -2.76522, 1, 0, 0, 1, 1,
-0.706972, 0.4994127, 0.224503, 1, 0, 0, 1, 1,
-0.7020856, 1.19865, -0.1646923, 0, 0, 0, 1, 1,
-0.6974187, 0.1289383, -0.4372519, 0, 0, 0, 1, 1,
-0.6966512, 0.1500563, -0.5068715, 0, 0, 0, 1, 1,
-0.6960244, 2.659022, -0.7828362, 0, 0, 0, 1, 1,
-0.6956589, 0.6470917, -1.318562, 0, 0, 0, 1, 1,
-0.6949945, 0.3821974, -1.61864, 0, 0, 0, 1, 1,
-0.6897348, 0.7356811, -1.480782, 0, 0, 0, 1, 1,
-0.6891353, 1.395155, 0.6154498, 1, 1, 1, 1, 1,
-0.684159, 1.79011, 0.6641099, 1, 1, 1, 1, 1,
-0.6817102, 1.283576, -1.345289, 1, 1, 1, 1, 1,
-0.6789472, 1.132134, 0.8946761, 1, 1, 1, 1, 1,
-0.675037, 0.2828465, 0.5916234, 1, 1, 1, 1, 1,
-0.6722326, 0.3449825, 0.4341967, 1, 1, 1, 1, 1,
-0.6586958, -1.929812, -3.246363, 1, 1, 1, 1, 1,
-0.6513363, 0.2687874, -1.43105, 1, 1, 1, 1, 1,
-0.6499724, 0.7895437, -1.092017, 1, 1, 1, 1, 1,
-0.6478812, 0.04813521, -1.458453, 1, 1, 1, 1, 1,
-0.647805, 0.7049382, -1.436342, 1, 1, 1, 1, 1,
-0.6456938, 0.8545653, 1.090108, 1, 1, 1, 1, 1,
-0.644039, -1.579518, -2.187947, 1, 1, 1, 1, 1,
-0.6425819, -0.6507105, -3.123611, 1, 1, 1, 1, 1,
-0.6416454, -0.466787, -3.207461, 1, 1, 1, 1, 1,
-0.6405923, 2.366572, 0.9943546, 0, 0, 1, 1, 1,
-0.6356166, -1.103439, -3.226809, 1, 0, 0, 1, 1,
-0.6335625, 0.808397, -1.413525, 1, 0, 0, 1, 1,
-0.6299472, 0.9205834, -0.5996871, 1, 0, 0, 1, 1,
-0.6256957, 1.255672, -0.8363923, 1, 0, 0, 1, 1,
-0.6193045, 0.6293327, -1.841872, 1, 0, 0, 1, 1,
-0.6171335, 0.4252635, -2.329248, 0, 0, 0, 1, 1,
-0.6162226, -0.9204588, -0.3912466, 0, 0, 0, 1, 1,
-0.6129144, 0.2206933, -1.411664, 0, 0, 0, 1, 1,
-0.6097362, -0.948859, -2.867416, 0, 0, 0, 1, 1,
-0.6038015, -0.1049589, -2.412272, 0, 0, 0, 1, 1,
-0.6028857, 0.896581, -0.1009241, 0, 0, 0, 1, 1,
-0.599616, -0.6971479, -4.176958, 0, 0, 0, 1, 1,
-0.5922863, -1.330205, -3.819968, 1, 1, 1, 1, 1,
-0.5904057, 0.6748815, 0.5359596, 1, 1, 1, 1, 1,
-0.5893941, -1.767233, -5.315099, 1, 1, 1, 1, 1,
-0.5859702, 0.8110338, -1.233222, 1, 1, 1, 1, 1,
-0.5834367, 0.02796959, -0.2461521, 1, 1, 1, 1, 1,
-0.5827027, -0.4181245, -1.591598, 1, 1, 1, 1, 1,
-0.575626, 1.668583, -2.142274, 1, 1, 1, 1, 1,
-0.5708416, 0.3667853, -1.167225, 1, 1, 1, 1, 1,
-0.5692748, -0.2117745, -0.8647848, 1, 1, 1, 1, 1,
-0.5690511, 0.4611194, -1.155579, 1, 1, 1, 1, 1,
-0.5576876, -0.6877393, -1.606587, 1, 1, 1, 1, 1,
-0.5539157, -0.2767715, -1.719354, 1, 1, 1, 1, 1,
-0.5506168, 1.254868, 0.2592964, 1, 1, 1, 1, 1,
-0.546713, 1.36029, 0.5369008, 1, 1, 1, 1, 1,
-0.5450596, -0.04051752, -0.4594848, 1, 1, 1, 1, 1,
-0.5373611, 0.8079315, -2.091174, 0, 0, 1, 1, 1,
-0.5341988, 0.04556704, -1.694702, 1, 0, 0, 1, 1,
-0.5337299, -1.222334, -1.808455, 1, 0, 0, 1, 1,
-0.5312405, 0.109887, -1.432512, 1, 0, 0, 1, 1,
-0.5305637, -0.02804304, -2.810159, 1, 0, 0, 1, 1,
-0.5290109, 0.2342713, -0.9544076, 1, 0, 0, 1, 1,
-0.5170968, 0.4484461, -1.899144, 0, 0, 0, 1, 1,
-0.5165765, 0.2160931, 0.3416646, 0, 0, 0, 1, 1,
-0.5117003, -1.07049, -4.143009, 0, 0, 0, 1, 1,
-0.5094008, -1.092676, -4.353577, 0, 0, 0, 1, 1,
-0.5014312, -0.8901893, -3.677032, 0, 0, 0, 1, 1,
-0.5009686, -0.06990979, -0.7061151, 0, 0, 0, 1, 1,
-0.4973535, -1.772834, -3.149418, 0, 0, 0, 1, 1,
-0.4892826, 1.088804, -0.02430526, 1, 1, 1, 1, 1,
-0.4886402, -0.1876876, -0.7615158, 1, 1, 1, 1, 1,
-0.4864415, -1.130086, -5.109339, 1, 1, 1, 1, 1,
-0.4864391, 0.9913481, 1.193129, 1, 1, 1, 1, 1,
-0.4833639, -0.04662034, -0.2734394, 1, 1, 1, 1, 1,
-0.4832627, 0.1250487, -2.275501, 1, 1, 1, 1, 1,
-0.4810126, -1.378116, -3.034008, 1, 1, 1, 1, 1,
-0.4782216, 1.11572, -1.260079, 1, 1, 1, 1, 1,
-0.4778652, -2.165362, -4.429587, 1, 1, 1, 1, 1,
-0.4769556, -0.7433154, -2.180802, 1, 1, 1, 1, 1,
-0.4759784, 1.652413, -1.24548, 1, 1, 1, 1, 1,
-0.4740868, 1.495587, 0.1094432, 1, 1, 1, 1, 1,
-0.4728718, 0.808338, -1.207239, 1, 1, 1, 1, 1,
-0.4700311, 0.1902649, -0.5460669, 1, 1, 1, 1, 1,
-0.4616129, -0.7431605, -2.635079, 1, 1, 1, 1, 1,
-0.4574099, -0.2605151, -1.498844, 0, 0, 1, 1, 1,
-0.4489209, 0.6952778, 0.01977117, 1, 0, 0, 1, 1,
-0.4474223, -1.074692, -3.446796, 1, 0, 0, 1, 1,
-0.4438187, -1.004549, -4.181801, 1, 0, 0, 1, 1,
-0.4410363, 0.4387183, -0.9965239, 1, 0, 0, 1, 1,
-0.4396245, -0.1828128, -2.241359, 1, 0, 0, 1, 1,
-0.4381022, -0.490445, -0.9401634, 0, 0, 0, 1, 1,
-0.4346047, 1.562607, 0.7893296, 0, 0, 0, 1, 1,
-0.4329898, -0.7429075, -2.457711, 0, 0, 0, 1, 1,
-0.4252816, -0.6874291, -3.445048, 0, 0, 0, 1, 1,
-0.4250957, -1.480278, -2.722497, 0, 0, 0, 1, 1,
-0.4246385, 0.7017683, 0.2596982, 0, 0, 0, 1, 1,
-0.4179656, 0.2688512, -2.65631, 0, 0, 0, 1, 1,
-0.4136989, -0.6285654, -4.210957, 1, 1, 1, 1, 1,
-0.4093481, 1.776152, -0.2643653, 1, 1, 1, 1, 1,
-0.4074032, -0.6536142, -2.633331, 1, 1, 1, 1, 1,
-0.4049027, 0.2721682, -0.1494948, 1, 1, 1, 1, 1,
-0.4026909, -0.9422877, -2.338211, 1, 1, 1, 1, 1,
-0.4016754, 0.9756376, -1.66794, 1, 1, 1, 1, 1,
-0.4009298, -0.8412462, -2.746305, 1, 1, 1, 1, 1,
-0.3936704, -0.7844273, -3.282256, 1, 1, 1, 1, 1,
-0.3884325, 0.780681, -1.104889, 1, 1, 1, 1, 1,
-0.3853684, 0.3198891, 1.123215, 1, 1, 1, 1, 1,
-0.3838767, 0.1458649, -1.562249, 1, 1, 1, 1, 1,
-0.3698198, 0.06906259, -1.928329, 1, 1, 1, 1, 1,
-0.3686661, 0.1404933, -1.450326, 1, 1, 1, 1, 1,
-0.3658698, 0.2904671, -0.08965702, 1, 1, 1, 1, 1,
-0.3648256, -0.180595, -2.556163, 1, 1, 1, 1, 1,
-0.3567572, -0.3276826, -0.9022499, 0, 0, 1, 1, 1,
-0.3508569, 0.1255244, -1.262608, 1, 0, 0, 1, 1,
-0.3507912, 0.5686656, 0.4632153, 1, 0, 0, 1, 1,
-0.3507685, -0.23799, -3.355743, 1, 0, 0, 1, 1,
-0.3462383, 0.8535545, -0.4273615, 1, 0, 0, 1, 1,
-0.3376014, -0.5151936, -0.9301142, 1, 0, 0, 1, 1,
-0.3363345, -1.065268, -4.16332, 0, 0, 0, 1, 1,
-0.3351509, -0.1977507, -0.04732883, 0, 0, 0, 1, 1,
-0.3340134, 0.04464116, -2.31243, 0, 0, 0, 1, 1,
-0.3314594, 0.2614051, 0.437659, 0, 0, 0, 1, 1,
-0.3305501, -0.4310104, -2.51271, 0, 0, 0, 1, 1,
-0.3280952, -1.891145, -3.05093, 0, 0, 0, 1, 1,
-0.3206885, -1.241947, -2.541034, 0, 0, 0, 1, 1,
-0.3197055, -2.095835, -2.980902, 1, 1, 1, 1, 1,
-0.3113227, 0.005312126, -2.173516, 1, 1, 1, 1, 1,
-0.3104156, -0.2914683, -0.6141829, 1, 1, 1, 1, 1,
-0.3099549, 0.8173341, -0.6952751, 1, 1, 1, 1, 1,
-0.3040533, -0.947466, -1.737325, 1, 1, 1, 1, 1,
-0.3019619, 2.409261, -0.9445544, 1, 1, 1, 1, 1,
-0.294855, 1.276794, 1.392784, 1, 1, 1, 1, 1,
-0.2852037, 1.80084, -0.1975788, 1, 1, 1, 1, 1,
-0.2824317, 0.2726553, -0.03571313, 1, 1, 1, 1, 1,
-0.2821835, -0.1596294, -2.563293, 1, 1, 1, 1, 1,
-0.2791826, -1.573678, -1.13005, 1, 1, 1, 1, 1,
-0.278649, 0.07641796, -2.928192, 1, 1, 1, 1, 1,
-0.2770286, -0.5767235, -2.099699, 1, 1, 1, 1, 1,
-0.2760821, 0.9241492, -1.962513, 1, 1, 1, 1, 1,
-0.2700458, 0.1732507, -0.9833257, 1, 1, 1, 1, 1,
-0.2689315, -0.3200273, -3.838656, 0, 0, 1, 1, 1,
-0.2676197, 0.1942562, -3.036491, 1, 0, 0, 1, 1,
-0.2673449, 0.2025117, -1.914436, 1, 0, 0, 1, 1,
-0.2664634, 0.9088734, 0.2978162, 1, 0, 0, 1, 1,
-0.2657602, -0.9393225, -3.376072, 1, 0, 0, 1, 1,
-0.2646054, 0.1532657, -1.52454, 1, 0, 0, 1, 1,
-0.2638891, 0.108613, -2.53696, 0, 0, 0, 1, 1,
-0.2617075, 0.4709722, 0.676746, 0, 0, 0, 1, 1,
-0.2582308, 0.244528, -0.1749857, 0, 0, 0, 1, 1,
-0.2575279, -0.09987643, -4.397759, 0, 0, 0, 1, 1,
-0.2530176, 0.2386083, 0.1153541, 0, 0, 0, 1, 1,
-0.2520322, -0.66847, -4.241127, 0, 0, 0, 1, 1,
-0.2461829, -0.4454294, -1.531534, 0, 0, 0, 1, 1,
-0.2434182, -0.8449393, -2.286346, 1, 1, 1, 1, 1,
-0.243379, -1.28826, -4.620743, 1, 1, 1, 1, 1,
-0.2368106, 1.265405, 0.4883481, 1, 1, 1, 1, 1,
-0.2361584, -0.1940836, -1.44022, 1, 1, 1, 1, 1,
-0.2328825, 0.9557583, 2.549783, 1, 1, 1, 1, 1,
-0.231433, 0.2221524, -0.4021007, 1, 1, 1, 1, 1,
-0.2301248, 3.214822, -2.626015, 1, 1, 1, 1, 1,
-0.223932, -1.543766, -1.220223, 1, 1, 1, 1, 1,
-0.2158927, -0.7751676, -2.406765, 1, 1, 1, 1, 1,
-0.2157717, -0.782234, -2.459031, 1, 1, 1, 1, 1,
-0.2141567, -0.6167395, -4.015161, 1, 1, 1, 1, 1,
-0.2140186, -0.991495, -4.75961, 1, 1, 1, 1, 1,
-0.2110382, -1.124708, -4.528721, 1, 1, 1, 1, 1,
-0.2106634, 1.868799, 0.4732562, 1, 1, 1, 1, 1,
-0.2073332, -0.8285997, -3.660654, 1, 1, 1, 1, 1,
-0.2073022, 0.04291489, -1.483875, 0, 0, 1, 1, 1,
-0.2053197, -0.4069262, 0.05406237, 1, 0, 0, 1, 1,
-0.2046496, -0.8668308, -3.440381, 1, 0, 0, 1, 1,
-0.2027686, -0.880405, -1.737892, 1, 0, 0, 1, 1,
-0.2018684, 0.644002, -0.9442962, 1, 0, 0, 1, 1,
-0.1987569, -0.4161102, -4.881909, 1, 0, 0, 1, 1,
-0.1919358, 0.2697292, -1.400255, 0, 0, 0, 1, 1,
-0.1907664, -0.1031987, -2.019361, 0, 0, 0, 1, 1,
-0.181633, -1.689437, -1.826882, 0, 0, 0, 1, 1,
-0.1810718, -1.546432, -2.265712, 0, 0, 0, 1, 1,
-0.1798921, -0.875977, -2.189029, 0, 0, 0, 1, 1,
-0.1754432, 1.451011, -0.566488, 0, 0, 0, 1, 1,
-0.174676, -0.8151088, -2.306789, 0, 0, 0, 1, 1,
-0.1733554, -0.2111102, -2.497144, 1, 1, 1, 1, 1,
-0.1707201, -0.05438118, -0.8248885, 1, 1, 1, 1, 1,
-0.1693114, 0.8681409, -1.393086, 1, 1, 1, 1, 1,
-0.1636309, -1.334391, -5.166386, 1, 1, 1, 1, 1,
-0.1629098, -0.9565908, -2.314854, 1, 1, 1, 1, 1,
-0.1618328, 0.7150419, -0.3906835, 1, 1, 1, 1, 1,
-0.1599749, 1.197431, 0.9475801, 1, 1, 1, 1, 1,
-0.1576908, -2.227454, -3.783875, 1, 1, 1, 1, 1,
-0.1532975, -0.3230905, -1.514329, 1, 1, 1, 1, 1,
-0.1463768, 0.3669657, -1.099075, 1, 1, 1, 1, 1,
-0.1425761, 0.7747929, -0.2221767, 1, 1, 1, 1, 1,
-0.1421493, 0.9974583, -3.062065, 1, 1, 1, 1, 1,
-0.1372242, 0.6199538, -1.364603, 1, 1, 1, 1, 1,
-0.1353941, -1.435265, -3.453857, 1, 1, 1, 1, 1,
-0.135072, -1.039029, -4.478886, 1, 1, 1, 1, 1,
-0.1334729, 0.1345905, 0.351761, 0, 0, 1, 1, 1,
-0.1331296, -0.4600061, -1.346882, 1, 0, 0, 1, 1,
-0.1318271, 1.28928, -1.104163, 1, 0, 0, 1, 1,
-0.13122, -1.234682, -3.826906, 1, 0, 0, 1, 1,
-0.1286086, 0.6437426, -0.3373847, 1, 0, 0, 1, 1,
-0.1240936, 1.520199, 0.6924856, 1, 0, 0, 1, 1,
-0.1209826, -1.079412, -3.848046, 0, 0, 0, 1, 1,
-0.1148322, -0.7100708, -2.236152, 0, 0, 0, 1, 1,
-0.1138664, -0.948396, -2.789841, 0, 0, 0, 1, 1,
-0.1125301, -1.261387, -1.549602, 0, 0, 0, 1, 1,
-0.1105622, 0.8801197, -0.3640307, 0, 0, 0, 1, 1,
-0.1098506, -1.103341, -3.287659, 0, 0, 0, 1, 1,
-0.1077307, -0.2734572, -3.012396, 0, 0, 0, 1, 1,
-0.1053957, -0.263992, -3.332011, 1, 1, 1, 1, 1,
-0.1048789, -1.706013, -2.848328, 1, 1, 1, 1, 1,
-0.1024165, -1.358123, -2.107221, 1, 1, 1, 1, 1,
-0.09951955, -1.125657, -4.431144, 1, 1, 1, 1, 1,
-0.09512722, 1.365416, -0.2861979, 1, 1, 1, 1, 1,
-0.09376868, -0.3093294, -1.884969, 1, 1, 1, 1, 1,
-0.09367754, -0.8069744, -3.460042, 1, 1, 1, 1, 1,
-0.08884082, -0.7498086, -4.59156, 1, 1, 1, 1, 1,
-0.08706217, -0.3836626, -3.592127, 1, 1, 1, 1, 1,
-0.0843133, -0.7577204, -1.493554, 1, 1, 1, 1, 1,
-0.08218401, -0.1976377, -2.252233, 1, 1, 1, 1, 1,
-0.08203367, 0.6723043, 0.6817907, 1, 1, 1, 1, 1,
-0.0780425, -0.03883456, -1.35016, 1, 1, 1, 1, 1,
-0.07649033, 1.109188, 0.803974, 1, 1, 1, 1, 1,
-0.07502238, -1.202151, -5.093143, 1, 1, 1, 1, 1,
-0.06830054, 1.656395, 0.1777851, 0, 0, 1, 1, 1,
-0.06594791, 0.5945269, 0.02207787, 1, 0, 0, 1, 1,
-0.064855, -1.224674, -2.570479, 1, 0, 0, 1, 1,
-0.06286496, 0.1459213, 0.03398573, 1, 0, 0, 1, 1,
-0.06175402, 0.3196155, 0.4768462, 1, 0, 0, 1, 1,
-0.0616051, 1.206441, 0.02434419, 1, 0, 0, 1, 1,
-0.05862481, 0.8251336, 0.04844153, 0, 0, 0, 1, 1,
-0.0561095, -0.2666611, -3.508206, 0, 0, 0, 1, 1,
-0.05391768, 0.682742, 0.1856864, 0, 0, 0, 1, 1,
-0.05261907, 0.05637033, -1.243114, 0, 0, 0, 1, 1,
-0.04575613, 0.1229953, 0.4525757, 0, 0, 0, 1, 1,
-0.04562233, 0.4437598, 1.532489, 0, 0, 0, 1, 1,
-0.04452772, 2.273236, -1.295712, 0, 0, 0, 1, 1,
-0.04444593, -2.089102, -3.237274, 1, 1, 1, 1, 1,
-0.04443913, 1.966035, 1.701133, 1, 1, 1, 1, 1,
-0.04198299, -0.9429969, -1.861456, 1, 1, 1, 1, 1,
-0.04023704, 0.1545433, -1.585992, 1, 1, 1, 1, 1,
-0.03387354, -0.9427282, -4.243731, 1, 1, 1, 1, 1,
-0.03056434, 1.201836, -0.2266686, 1, 1, 1, 1, 1,
-0.02755214, 0.06312139, 0.5193143, 1, 1, 1, 1, 1,
-0.02368475, 1.53938, 0.5494766, 1, 1, 1, 1, 1,
-0.02312243, 0.6139039, -0.1222548, 1, 1, 1, 1, 1,
-0.02105793, -0.7501995, -3.464664, 1, 1, 1, 1, 1,
-0.01988642, -0.1702609, -2.499113, 1, 1, 1, 1, 1,
-0.01549266, -0.04696618, -1.842886, 1, 1, 1, 1, 1,
-0.01466833, 0.4191911, 0.3251322, 1, 1, 1, 1, 1,
-0.01425959, -2.07019, -5.073198, 1, 1, 1, 1, 1,
-0.01337071, -0.1625738, -2.842276, 1, 1, 1, 1, 1,
-0.012421, -0.2397117, -1.591193, 0, 0, 1, 1, 1,
-0.01223762, -0.9559001, -3.268479, 1, 0, 0, 1, 1,
-0.01086342, 0.5964312, -0.5591601, 1, 0, 0, 1, 1,
-0.01035748, -1.492075, -2.738708, 1, 0, 0, 1, 1,
-0.007823043, -1.107934, -3.254802, 1, 0, 0, 1, 1,
-0.0049661, -0.9796937, -3.50799, 1, 0, 0, 1, 1,
-0.002025029, 0.8647637, -1.002705, 0, 0, 0, 1, 1,
-0.001433513, -0.1394165, -2.581175, 0, 0, 0, 1, 1,
-0.0008946746, -0.7921672, -3.900462, 0, 0, 0, 1, 1,
-0.0008031203, 0.08774748, -1.355973, 0, 0, 0, 1, 1,
0.002298539, 0.2143599, -0.0867738, 0, 0, 0, 1, 1,
0.00305537, -0.8020891, 4.542307, 0, 0, 0, 1, 1,
0.004322646, 1.603424, 2.065264, 0, 0, 0, 1, 1,
0.01291974, -0.4350154, 4.59889, 1, 1, 1, 1, 1,
0.01618029, -2.445311, 2.164304, 1, 1, 1, 1, 1,
0.02305774, 0.4714583, 0.219984, 1, 1, 1, 1, 1,
0.02479897, 0.3767756, 0.1958187, 1, 1, 1, 1, 1,
0.02572959, 1.352721, -0.2603944, 1, 1, 1, 1, 1,
0.02607099, -0.5159689, 3.577692, 1, 1, 1, 1, 1,
0.02643936, 1.529948, -1.488681, 1, 1, 1, 1, 1,
0.03449325, -0.6067301, 3.560982, 1, 1, 1, 1, 1,
0.03564195, -0.4515538, 3.377073, 1, 1, 1, 1, 1,
0.04087642, -0.05059373, 2.5206, 1, 1, 1, 1, 1,
0.04353854, -0.504049, 4.022497, 1, 1, 1, 1, 1,
0.0448123, 0.07841465, 0.8300164, 1, 1, 1, 1, 1,
0.04548066, -0.3582492, 3.000888, 1, 1, 1, 1, 1,
0.04859285, 0.1765556, 0.3358039, 1, 1, 1, 1, 1,
0.05112383, 1.573222, 0.9614569, 1, 1, 1, 1, 1,
0.05241702, 0.1220594, 0.360414, 0, 0, 1, 1, 1,
0.05270657, 0.7884179, -0.4242988, 1, 0, 0, 1, 1,
0.05396821, -0.6826631, 3.283759, 1, 0, 0, 1, 1,
0.05762569, 0.2525757, 0.07920905, 1, 0, 0, 1, 1,
0.0583331, 0.196231, 0.1623229, 1, 0, 0, 1, 1,
0.0586026, -1.549817, 3.456365, 1, 0, 0, 1, 1,
0.05934577, 1.504785, -2.403688, 0, 0, 0, 1, 1,
0.06019633, -0.6196972, 3.679742, 0, 0, 0, 1, 1,
0.06547225, 0.5761698, 0.533425, 0, 0, 0, 1, 1,
0.06819793, -0.2453302, 2.767598, 0, 0, 0, 1, 1,
0.06830761, 1.403724, 0.2223432, 0, 0, 0, 1, 1,
0.06852419, -0.8106868, 2.761342, 0, 0, 0, 1, 1,
0.0695265, 0.2120846, 0.1330135, 0, 0, 0, 1, 1,
0.07046682, 0.6582937, -0.845688, 1, 1, 1, 1, 1,
0.07057127, 1.276971, 0.7450402, 1, 1, 1, 1, 1,
0.07325741, 0.2776726, 0.5584353, 1, 1, 1, 1, 1,
0.07458083, 1.26243, 1.784961, 1, 1, 1, 1, 1,
0.07459037, -1.60643, 4.475146, 1, 1, 1, 1, 1,
0.07974538, 1.904552, 0.5326722, 1, 1, 1, 1, 1,
0.0825041, 0.6381353, -0.8587393, 1, 1, 1, 1, 1,
0.08676566, -0.8375733, 1.602305, 1, 1, 1, 1, 1,
0.08856224, -0.3514361, 3.802138, 1, 1, 1, 1, 1,
0.09608494, 0.3868428, -0.1698901, 1, 1, 1, 1, 1,
0.09648231, -0.7100269, 4.466081, 1, 1, 1, 1, 1,
0.09904413, 0.8605974, -0.8796289, 1, 1, 1, 1, 1,
0.09954678, 1.226903, 0.7473189, 1, 1, 1, 1, 1,
0.1051674, -1.53612, 3.396672, 1, 1, 1, 1, 1,
0.1052312, -0.4767892, 1.3431, 1, 1, 1, 1, 1,
0.106937, 1.102746, -0.6395158, 0, 0, 1, 1, 1,
0.1073345, -0.4328462, 2.393374, 1, 0, 0, 1, 1,
0.1135498, -1.074278, 3.977815, 1, 0, 0, 1, 1,
0.1139043, -0.9956324, 4.840669, 1, 0, 0, 1, 1,
0.1142214, -1.191492, 3.707178, 1, 0, 0, 1, 1,
0.1150505, -0.4173686, 3.619346, 1, 0, 0, 1, 1,
0.1191065, 0.9065281, 0.8333885, 0, 0, 0, 1, 1,
0.1306841, 0.5948164, 0.3760684, 0, 0, 0, 1, 1,
0.1317041, -0.6369212, 3.7142, 0, 0, 0, 1, 1,
0.1324275, -2.094567, 4.302802, 0, 0, 0, 1, 1,
0.1333961, 0.4524147, 0.1993545, 0, 0, 0, 1, 1,
0.1339549, 1.237411, -1.373868, 0, 0, 0, 1, 1,
0.1360094, -0.1564586, 3.765896, 0, 0, 0, 1, 1,
0.1366022, -0.6221517, 1.184646, 1, 1, 1, 1, 1,
0.1400433, 0.9792093, 0.03419825, 1, 1, 1, 1, 1,
0.1413288, 1.782544, -1.299688, 1, 1, 1, 1, 1,
0.1466859, 1.21872, -0.1563385, 1, 1, 1, 1, 1,
0.1471428, -0.1206667, 1.780416, 1, 1, 1, 1, 1,
0.1522213, -0.7909457, 3.716552, 1, 1, 1, 1, 1,
0.1529648, 1.439342, 1.257324, 1, 1, 1, 1, 1,
0.1565144, -0.02135424, 0.3436766, 1, 1, 1, 1, 1,
0.1587966, 0.003382342, 0.1364796, 1, 1, 1, 1, 1,
0.1619124, 0.008913212, 1.768948, 1, 1, 1, 1, 1,
0.1645714, 0.2347557, 0.3674437, 1, 1, 1, 1, 1,
0.1665018, -0.4382477, 2.044261, 1, 1, 1, 1, 1,
0.1687577, 0.8306291, 0.6259565, 1, 1, 1, 1, 1,
0.1706461, 0.337785, -0.7880632, 1, 1, 1, 1, 1,
0.1710305, 0.4805712, -0.8894806, 1, 1, 1, 1, 1,
0.1741687, -1.817966, 1.755785, 0, 0, 1, 1, 1,
0.1764109, -0.1808125, 2.576067, 1, 0, 0, 1, 1,
0.1771521, 2.804699, 0.3148522, 1, 0, 0, 1, 1,
0.1800843, 0.5394406, -0.4102397, 1, 0, 0, 1, 1,
0.1800982, 0.1466874, 1.911616, 1, 0, 0, 1, 1,
0.1803538, -0.6573634, 3.528281, 1, 0, 0, 1, 1,
0.1804427, -1.206796, 2.468782, 0, 0, 0, 1, 1,
0.1823416, 0.5717087, -0.5284573, 0, 0, 0, 1, 1,
0.1843828, 0.8331298, -0.7753275, 0, 0, 0, 1, 1,
0.1879304, -1.88044, 2.673786, 0, 0, 0, 1, 1,
0.1940841, 0.4362904, 0.2129434, 0, 0, 0, 1, 1,
0.1975282, -0.2555194, 4.009127, 0, 0, 0, 1, 1,
0.1988007, 0.989072, 1.087065, 0, 0, 0, 1, 1,
0.1991489, 0.1368554, -0.4028801, 1, 1, 1, 1, 1,
0.1991682, 1.333272, -0.8843265, 1, 1, 1, 1, 1,
0.2020081, 0.6353309, 1.957254, 1, 1, 1, 1, 1,
0.2038306, 0.1378695, 0.7952887, 1, 1, 1, 1, 1,
0.2039285, -0.4183039, 2.036516, 1, 1, 1, 1, 1,
0.2066107, -1.21962, 1.824235, 1, 1, 1, 1, 1,
0.2117974, 0.2282994, -0.1746679, 1, 1, 1, 1, 1,
0.2127226, 1.972351, -0.1227446, 1, 1, 1, 1, 1,
0.2203239, -0.6611632, 2.435466, 1, 1, 1, 1, 1,
0.2220182, 0.9037241, -0.1358298, 1, 1, 1, 1, 1,
0.22313, 0.2981272, 0.4040395, 1, 1, 1, 1, 1,
0.2322558, 1.160355, -0.1214898, 1, 1, 1, 1, 1,
0.2388474, 1.637378, 0.1732707, 1, 1, 1, 1, 1,
0.2411696, 1.423465, -0.417233, 1, 1, 1, 1, 1,
0.2450063, -0.360489, 1.161135, 1, 1, 1, 1, 1,
0.2463249, 0.6045288, -1.158248, 0, 0, 1, 1, 1,
0.2463927, -0.8954476, 3.775504, 1, 0, 0, 1, 1,
0.2587029, -1.89124, 4.555307, 1, 0, 0, 1, 1,
0.2665008, 0.3139475, 0.8120961, 1, 0, 0, 1, 1,
0.2707792, -2.058366, 4.117736, 1, 0, 0, 1, 1,
0.2798565, -0.03871017, 0.9790421, 1, 0, 0, 1, 1,
0.2834775, -0.05622573, 2.067738, 0, 0, 0, 1, 1,
0.284641, -0.07135315, 0.2766668, 0, 0, 0, 1, 1,
0.284903, 0.4281917, 1.146874, 0, 0, 0, 1, 1,
0.2856922, -1.059816, 2.883774, 0, 0, 0, 1, 1,
0.2860386, -1.303126, 4.945306, 0, 0, 0, 1, 1,
0.2872058, -0.6564244, 2.676271, 0, 0, 0, 1, 1,
0.2887636, 0.7586735, 1.208099, 0, 0, 0, 1, 1,
0.2888511, 0.2884753, 0.8579159, 1, 1, 1, 1, 1,
0.2892777, -0.5181144, 2.709367, 1, 1, 1, 1, 1,
0.2903877, -0.3678034, 4.158966, 1, 1, 1, 1, 1,
0.2911274, -0.315593, 1.223291, 1, 1, 1, 1, 1,
0.2925443, 1.917379, -0.8619825, 1, 1, 1, 1, 1,
0.3005985, -0.1352489, 2.960165, 1, 1, 1, 1, 1,
0.3012949, 0.3830367, 1.145987, 1, 1, 1, 1, 1,
0.3017702, -0.6736386, 2.058366, 1, 1, 1, 1, 1,
0.3071719, 1.985415, -1.290458, 1, 1, 1, 1, 1,
0.3072731, -0.7859316, 1.864824, 1, 1, 1, 1, 1,
0.3079262, 0.4337486, 0.6205425, 1, 1, 1, 1, 1,
0.3098846, 0.7571846, 0.3717272, 1, 1, 1, 1, 1,
0.3108949, 0.9975786, -0.04372202, 1, 1, 1, 1, 1,
0.3121932, 1.750224, -0.777167, 1, 1, 1, 1, 1,
0.3148736, 0.1987319, 2.209476, 1, 1, 1, 1, 1,
0.3190245, -0.2908279, 3.433712, 0, 0, 1, 1, 1,
0.3197865, -1.99357, 1.708004, 1, 0, 0, 1, 1,
0.3201678, -1.100594, 2.928448, 1, 0, 0, 1, 1,
0.3213361, 0.5905811, 1.863463, 1, 0, 0, 1, 1,
0.3215387, 1.912162, -1.965678, 1, 0, 0, 1, 1,
0.3229488, -1.357706, 2.709796, 1, 0, 0, 1, 1,
0.3308956, -0.3024285, 1.71153, 0, 0, 0, 1, 1,
0.3373159, 0.5805835, -0.05500785, 0, 0, 0, 1, 1,
0.3449609, 2.286643, 0.726907, 0, 0, 0, 1, 1,
0.3466874, -0.9234059, 2.871987, 0, 0, 0, 1, 1,
0.3469243, -0.3761525, 2.223018, 0, 0, 0, 1, 1,
0.3511765, 1.027199, 1.722684, 0, 0, 0, 1, 1,
0.3565977, 0.8294564, 1.79177, 0, 0, 0, 1, 1,
0.357903, 1.572513, 1.799777, 1, 1, 1, 1, 1,
0.3639466, -0.165023, 1.492863, 1, 1, 1, 1, 1,
0.3693451, -0.2809525, 1.120114, 1, 1, 1, 1, 1,
0.3706717, -0.08939583, 2.520126, 1, 1, 1, 1, 1,
0.3713518, 0.3394346, 0.3529048, 1, 1, 1, 1, 1,
0.3756558, -1.119262, 0.7987458, 1, 1, 1, 1, 1,
0.3787251, 0.841452, 2.210536, 1, 1, 1, 1, 1,
0.3805479, 1.435862, 0.9504768, 1, 1, 1, 1, 1,
0.3812282, -0.1898244, 0.1290241, 1, 1, 1, 1, 1,
0.3813284, -1.785962, 3.191679, 1, 1, 1, 1, 1,
0.3837709, -0.8874281, 1.635308, 1, 1, 1, 1, 1,
0.3840637, 1.154232, 1.448476, 1, 1, 1, 1, 1,
0.3863944, -0.02121577, 0.9756213, 1, 1, 1, 1, 1,
0.3887583, -0.8160232, 3.43044, 1, 1, 1, 1, 1,
0.391804, 0.8808544, 1.597617, 1, 1, 1, 1, 1,
0.3925614, 1.513488, -0.6027632, 0, 0, 1, 1, 1,
0.3982954, -0.6767172, 2.740764, 1, 0, 0, 1, 1,
0.3983985, -0.4081724, 1.731613, 1, 0, 0, 1, 1,
0.4042999, -0.1802837, 0.7163265, 1, 0, 0, 1, 1,
0.4062307, 0.08947651, 2.778153, 1, 0, 0, 1, 1,
0.4083245, -0.00261187, 3.951903, 1, 0, 0, 1, 1,
0.4095547, -0.7948127, 1.789695, 0, 0, 0, 1, 1,
0.4097055, -0.1238576, 1.258969, 0, 0, 0, 1, 1,
0.4158247, -0.5501677, 2.098773, 0, 0, 0, 1, 1,
0.4185461, 1.090803, 0.04138108, 0, 0, 0, 1, 1,
0.4249799, 0.1239985, 0.7857311, 0, 0, 0, 1, 1,
0.4270574, 0.4610444, -0.3572047, 0, 0, 0, 1, 1,
0.4300912, 0.4472279, -0.5423666, 0, 0, 0, 1, 1,
0.4330425, -0.8197444, 3.426278, 1, 1, 1, 1, 1,
0.433991, 0.1594793, 1.361017, 1, 1, 1, 1, 1,
0.437315, -0.1556204, 0.9657854, 1, 1, 1, 1, 1,
0.4387719, 0.7601575, 0.2121579, 1, 1, 1, 1, 1,
0.4396829, 0.501672, 1.69726, 1, 1, 1, 1, 1,
0.4430084, -0.1004408, 2.198958, 1, 1, 1, 1, 1,
0.4436159, 1.651402, -0.3184114, 1, 1, 1, 1, 1,
0.4438272, 1.353008, -0.5175434, 1, 1, 1, 1, 1,
0.4473102, -0.7285911, 2.413808, 1, 1, 1, 1, 1,
0.450307, -0.5389856, 2.13587, 1, 1, 1, 1, 1,
0.4531882, -0.8807352, 2.202958, 1, 1, 1, 1, 1,
0.4536651, -0.4191835, 4.102987, 1, 1, 1, 1, 1,
0.4640667, 1.171789, -0.4715544, 1, 1, 1, 1, 1,
0.4666273, -1.029413, 3.397928, 1, 1, 1, 1, 1,
0.4673695, 0.7136917, -0.6871524, 1, 1, 1, 1, 1,
0.4697269, -2.170752, 3.605977, 0, 0, 1, 1, 1,
0.4732593, -0.945126, 2.405233, 1, 0, 0, 1, 1,
0.4736751, 0.6578562, 0.2863617, 1, 0, 0, 1, 1,
0.4747137, 0.3127243, 0.9583086, 1, 0, 0, 1, 1,
0.4760568, 0.001255548, 2.881634, 1, 0, 0, 1, 1,
0.4788497, 2.199086, -1.189999, 1, 0, 0, 1, 1,
0.4796447, 1.358735, 0.663417, 0, 0, 0, 1, 1,
0.4805567, -0.7857813, 2.431376, 0, 0, 0, 1, 1,
0.4865632, -0.0631474, 2.085974, 0, 0, 0, 1, 1,
0.4874043, 1.241315, 0.6802319, 0, 0, 0, 1, 1,
0.4876826, -1.824708, 4.584757, 0, 0, 0, 1, 1,
0.4935393, 0.650265, 0.02989248, 0, 0, 0, 1, 1,
0.4940185, -0.7130446, 1.916096, 0, 0, 0, 1, 1,
0.4946904, 0.7689888, 0.8515603, 1, 1, 1, 1, 1,
0.4951962, -0.6666458, 2.680984, 1, 1, 1, 1, 1,
0.4957759, -0.5713987, 2.466966, 1, 1, 1, 1, 1,
0.4966067, 0.271917, 2.544332, 1, 1, 1, 1, 1,
0.501018, -0.6104838, 2.808357, 1, 1, 1, 1, 1,
0.5022529, 0.6904206, 1.109367, 1, 1, 1, 1, 1,
0.5069518, -0.8877667, 3.446472, 1, 1, 1, 1, 1,
0.5129345, -0.01016734, 0.5648124, 1, 1, 1, 1, 1,
0.5132529, -0.6613387, 2.044063, 1, 1, 1, 1, 1,
0.5194228, 0.125765, 0.6671027, 1, 1, 1, 1, 1,
0.5199962, 0.6357055, 1.631397, 1, 1, 1, 1, 1,
0.5281432, -0.9587392, 3.936849, 1, 1, 1, 1, 1,
0.5314966, 0.3641149, 1.155104, 1, 1, 1, 1, 1,
0.5349246, 1.717964, 0.6693617, 1, 1, 1, 1, 1,
0.539237, -1.697977, 1.530406, 1, 1, 1, 1, 1,
0.539716, 1.86164, -0.1425233, 0, 0, 1, 1, 1,
0.5434779, 0.4510251, 1.520862, 1, 0, 0, 1, 1,
0.5442666, -1.932933, 1.912191, 1, 0, 0, 1, 1,
0.5451418, -1.894672, 2.181423, 1, 0, 0, 1, 1,
0.546668, -0.6678969, 2.911906, 1, 0, 0, 1, 1,
0.5517288, 1.507964, -1.094819, 1, 0, 0, 1, 1,
0.553043, 1.867545, 0.0245686, 0, 0, 0, 1, 1,
0.5535253, -2.646658, 3.100548, 0, 0, 0, 1, 1,
0.5543001, 0.5627671, -0.7740098, 0, 0, 0, 1, 1,
0.5566758, -1.788383, 3.638638, 0, 0, 0, 1, 1,
0.5586942, -0.5695264, 2.341916, 0, 0, 0, 1, 1,
0.5599553, 0.1927797, 2.339805, 0, 0, 0, 1, 1,
0.5658611, 0.4139128, 0.4925523, 0, 0, 0, 1, 1,
0.5671623, -0.4305198, 1.25859, 1, 1, 1, 1, 1,
0.5720149, 0.2679184, 1.155176, 1, 1, 1, 1, 1,
0.5771923, 1.013137, -1.124423, 1, 1, 1, 1, 1,
0.5776135, -0.9836646, 1.114554, 1, 1, 1, 1, 1,
0.579374, -1.475169, 1.81031, 1, 1, 1, 1, 1,
0.5813784, 0.3557748, 2.232267, 1, 1, 1, 1, 1,
0.581417, -0.5802333, 3.419459, 1, 1, 1, 1, 1,
0.5816721, -1.16867, 1.999757, 1, 1, 1, 1, 1,
0.584088, -0.7972575, 4.338437, 1, 1, 1, 1, 1,
0.5846318, -1.05617, 2.581444, 1, 1, 1, 1, 1,
0.5849316, 0.8730808, 2.012379, 1, 1, 1, 1, 1,
0.5901518, 0.7693831, 0.9016688, 1, 1, 1, 1, 1,
0.5981497, 0.1586925, 2.330148, 1, 1, 1, 1, 1,
0.5998573, 0.7058366, 0.9716499, 1, 1, 1, 1, 1,
0.6004864, -0.4947626, 1.373214, 1, 1, 1, 1, 1,
0.6017075, 1.440944, 2.122501, 0, 0, 1, 1, 1,
0.6066568, 0.008334415, 2.221836, 1, 0, 0, 1, 1,
0.6066995, 0.2395914, 2.582115, 1, 0, 0, 1, 1,
0.6078494, -1.109401, 3.802485, 1, 0, 0, 1, 1,
0.6080943, -0.6157826, 1.705408, 1, 0, 0, 1, 1,
0.6118266, -0.2488249, 2.066391, 1, 0, 0, 1, 1,
0.6146492, -1.154447, 3.013939, 0, 0, 0, 1, 1,
0.616486, -0.3054497, 2.215615, 0, 0, 0, 1, 1,
0.6204315, 1.134433, -0.1813091, 0, 0, 0, 1, 1,
0.6205152, 0.3326977, 1.936631, 0, 0, 0, 1, 1,
0.6228666, 0.4507328, 1.065297, 0, 0, 0, 1, 1,
0.624719, 1.790734, -0.1945995, 0, 0, 0, 1, 1,
0.6264328, -0.7399322, 3.967534, 0, 0, 0, 1, 1,
0.6288664, -0.0002721197, 1.278201, 1, 1, 1, 1, 1,
0.6323621, 0.3548594, 2.706178, 1, 1, 1, 1, 1,
0.6352637, 1.826787, -0.5449975, 1, 1, 1, 1, 1,
0.6372874, 0.2354008, 2.075597, 1, 1, 1, 1, 1,
0.6440581, 1.571206, 2.093302, 1, 1, 1, 1, 1,
0.6664311, -0.06429357, 2.257858, 1, 1, 1, 1, 1,
0.6671803, -1.390579, 3.761835, 1, 1, 1, 1, 1,
0.669392, 0.7034596, -0.1541303, 1, 1, 1, 1, 1,
0.6722121, 1.003443, -0.3860772, 1, 1, 1, 1, 1,
0.6767512, 0.3560861, 2.890749, 1, 1, 1, 1, 1,
0.6768944, -0.6859915, 3.603559, 1, 1, 1, 1, 1,
0.6827467, -1.693215, 2.603451, 1, 1, 1, 1, 1,
0.6832712, -0.3002875, 3.895749, 1, 1, 1, 1, 1,
0.6834779, -0.5302044, 0.9507937, 1, 1, 1, 1, 1,
0.6837398, 0.3834042, 2.422995, 1, 1, 1, 1, 1,
0.7001551, 0.6242266, -0.6697379, 0, 0, 1, 1, 1,
0.7063144, -0.49797, 2.570881, 1, 0, 0, 1, 1,
0.7074105, 0.1617917, 1.684067, 1, 0, 0, 1, 1,
0.7077479, -1.337961, 2.899138, 1, 0, 0, 1, 1,
0.708821, -0.5195228, 1.978095, 1, 0, 0, 1, 1,
0.7106633, 0.6753482, 2.709148, 1, 0, 0, 1, 1,
0.7146396, -1.146694, 2.989024, 0, 0, 0, 1, 1,
0.7178327, -1.362088, 4.375612, 0, 0, 0, 1, 1,
0.7191064, -0.08613857, 1.174438, 0, 0, 0, 1, 1,
0.7213786, -1.131929, 2.45797, 0, 0, 0, 1, 1,
0.7214519, -0.2619877, 2.0469, 0, 0, 0, 1, 1,
0.7214715, 1.56936, 1.848645, 0, 0, 0, 1, 1,
0.7311347, 0.6649392, -0.5107679, 0, 0, 0, 1, 1,
0.7358191, -0.7451259, 0.01605466, 1, 1, 1, 1, 1,
0.7369121, 1.529546, 0.1880998, 1, 1, 1, 1, 1,
0.7413814, -1.066385, 1.099396, 1, 1, 1, 1, 1,
0.7513422, -0.940864, 1.888281, 1, 1, 1, 1, 1,
0.7568762, -0.4742493, 1.317621, 1, 1, 1, 1, 1,
0.7570585, -0.1755333, 1.813602, 1, 1, 1, 1, 1,
0.7660784, -0.07117993, 2.846191, 1, 1, 1, 1, 1,
0.7677101, 0.8990556, 0.6551125, 1, 1, 1, 1, 1,
0.7687871, -0.1398097, 2.010571, 1, 1, 1, 1, 1,
0.7689793, 0.3909013, 0.4073215, 1, 1, 1, 1, 1,
0.7753475, 0.01243749, 1.125798, 1, 1, 1, 1, 1,
0.7774553, -0.0852497, 1.671062, 1, 1, 1, 1, 1,
0.7876585, 1.621425, 0.5149183, 1, 1, 1, 1, 1,
0.7902533, 0.06896894, 3.020527, 1, 1, 1, 1, 1,
0.7923616, 1.190469, 0.06059147, 1, 1, 1, 1, 1,
0.7991749, 0.07741557, 0.6556051, 0, 0, 1, 1, 1,
0.8020695, 1.111152, 0.5569665, 1, 0, 0, 1, 1,
0.8045972, -0.3202678, 0.5162678, 1, 0, 0, 1, 1,
0.8049999, -1.173663, 4.45471, 1, 0, 0, 1, 1,
0.8060836, -1.491224, 4.277458, 1, 0, 0, 1, 1,
0.810155, 0.05960948, 1.375768, 1, 0, 0, 1, 1,
0.8106003, 0.8029973, 1.475849, 0, 0, 0, 1, 1,
0.8127697, 0.04661332, 3.056071, 0, 0, 0, 1, 1,
0.81408, 0.339916, 1.239473, 0, 0, 0, 1, 1,
0.8212184, 0.04489363, 1.535052, 0, 0, 0, 1, 1,
0.8242835, -1.021894, 0.01527292, 0, 0, 0, 1, 1,
0.8245987, -1.174382, 2.235845, 0, 0, 0, 1, 1,
0.8301991, -0.09108657, 1.204415, 0, 0, 0, 1, 1,
0.8394032, -1.067559, 1.633923, 1, 1, 1, 1, 1,
0.8422624, 0.7661261, 1.074905, 1, 1, 1, 1, 1,
0.8426726, 0.1715075, 0.8130111, 1, 1, 1, 1, 1,
0.8557926, -0.7294568, 1.431736, 1, 1, 1, 1, 1,
0.8568716, -0.6813759, 4.014497, 1, 1, 1, 1, 1,
0.8572975, 0.7450472, 1.398233, 1, 1, 1, 1, 1,
0.8630114, 0.6809654, 1.027311, 1, 1, 1, 1, 1,
0.8632707, -1.108119, 3.523569, 1, 1, 1, 1, 1,
0.8649257, -1.030553, 3.095273, 1, 1, 1, 1, 1,
0.8672842, 0.3387894, 1.507363, 1, 1, 1, 1, 1,
0.8704206, -3.047809, 2.352854, 1, 1, 1, 1, 1,
0.8747711, 1.659995, 2.435245, 1, 1, 1, 1, 1,
0.8774924, 1.040923, 0.09539195, 1, 1, 1, 1, 1,
0.8825899, -0.4340873, 4.493453, 1, 1, 1, 1, 1,
0.8835435, -1.66899, 2.744789, 1, 1, 1, 1, 1,
0.8838087, 0.6662788, -1.027185, 0, 0, 1, 1, 1,
0.8876096, 0.7594567, 1.565882, 1, 0, 0, 1, 1,
0.8884079, -1.083423, 3.317873, 1, 0, 0, 1, 1,
0.8920121, -1.893829, 1.797355, 1, 0, 0, 1, 1,
0.8920939, -0.4192909, 2.223099, 1, 0, 0, 1, 1,
0.8923182, -0.5225773, 2.989315, 1, 0, 0, 1, 1,
0.8970999, -0.3129286, 2.091959, 0, 0, 0, 1, 1,
0.8973269, -2.441896, 2.750452, 0, 0, 0, 1, 1,
0.8980143, -0.9743574, 1.048307, 0, 0, 0, 1, 1,
0.9009067, 0.887426, 0.874782, 0, 0, 0, 1, 1,
0.9018841, 0.3997039, 2.810849, 0, 0, 0, 1, 1,
0.9080644, -0.8539166, 3.345824, 0, 0, 0, 1, 1,
0.9131163, 0.4489132, 1.005324, 0, 0, 0, 1, 1,
0.915273, 1.858553, 1.022987, 1, 1, 1, 1, 1,
0.9234688, -0.335954, 0.5878547, 1, 1, 1, 1, 1,
0.9258384, 0.9649389, 0.5034893, 1, 1, 1, 1, 1,
0.9324374, 0.9363346, 1.961348, 1, 1, 1, 1, 1,
0.9340909, 0.2912678, 2.051827, 1, 1, 1, 1, 1,
0.9387191, 1.065899, -0.7561663, 1, 1, 1, 1, 1,
0.9406589, -1.243116, 3.964251, 1, 1, 1, 1, 1,
0.9417259, 0.6858141, 0.007183671, 1, 1, 1, 1, 1,
0.9459172, 0.8466698, 4.361452, 1, 1, 1, 1, 1,
0.9461303, 0.3476084, 0.1760275, 1, 1, 1, 1, 1,
0.947464, 1.20394, -0.415758, 1, 1, 1, 1, 1,
0.9479935, 0.3848606, 0.9658703, 1, 1, 1, 1, 1,
0.9499295, -0.3401434, 4.598711, 1, 1, 1, 1, 1,
0.9503714, 0.0003276642, 2.14135, 1, 1, 1, 1, 1,
0.9636502, -2.09729, 4.049903, 1, 1, 1, 1, 1,
0.9744245, 2.74402, -1.030694, 0, 0, 1, 1, 1,
0.9825478, -0.4345994, 0.8241184, 1, 0, 0, 1, 1,
0.9905282, -0.903859, 2.90108, 1, 0, 0, 1, 1,
0.9906669, -0.04647209, 0.9691563, 1, 0, 0, 1, 1,
0.9980262, 0.2051402, 1.645032, 1, 0, 0, 1, 1,
1.002813, -0.9116768, 2.005432, 1, 0, 0, 1, 1,
1.003617, -0.4165171, 3.464063, 0, 0, 0, 1, 1,
1.010291, -0.3362327, 2.915506, 0, 0, 0, 1, 1,
1.015017, 0.2165812, 1.856197, 0, 0, 0, 1, 1,
1.018902, -0.3459268, 3.502657, 0, 0, 0, 1, 1,
1.020026, 1.190444, 0.09045407, 0, 0, 0, 1, 1,
1.020343, -0.1058046, 2.481571, 0, 0, 0, 1, 1,
1.03152, -1.01355, 3.314345, 0, 0, 0, 1, 1,
1.032182, 0.9107656, 1.203777, 1, 1, 1, 1, 1,
1.035962, -0.7872065, 0.4529421, 1, 1, 1, 1, 1,
1.037759, -0.8256081, 2.514581, 1, 1, 1, 1, 1,
1.039383, 1.791124, 0.9437351, 1, 1, 1, 1, 1,
1.040296, 1.848986, -0.4511739, 1, 1, 1, 1, 1,
1.042496, 0.5062971, -0.03965014, 1, 1, 1, 1, 1,
1.04297, -0.3788083, 0.586646, 1, 1, 1, 1, 1,
1.043507, -1.357904, 3.333731, 1, 1, 1, 1, 1,
1.045516, -0.2387612, 2.094949, 1, 1, 1, 1, 1,
1.052433, 0.8063098, 0.5596797, 1, 1, 1, 1, 1,
1.05653, 0.3021263, 2.093538, 1, 1, 1, 1, 1,
1.060856, 0.9625973, 0.7207191, 1, 1, 1, 1, 1,
1.061036, 0.4025206, -0.4954728, 1, 1, 1, 1, 1,
1.061151, -0.3719562, 2.365674, 1, 1, 1, 1, 1,
1.064852, -0.2041802, 1.651261, 1, 1, 1, 1, 1,
1.065064, -1.172374, 3.158182, 0, 0, 1, 1, 1,
1.068425, 0.9800602, 0.9550611, 1, 0, 0, 1, 1,
1.072129, -1.059644, 4.430312, 1, 0, 0, 1, 1,
1.074532, 0.7309808, 2.866696, 1, 0, 0, 1, 1,
1.074933, -0.9474515, 0.4594424, 1, 0, 0, 1, 1,
1.075857, -0.5234896, 2.418127, 1, 0, 0, 1, 1,
1.081786, -0.08140305, 2.186331, 0, 0, 0, 1, 1,
1.084497, 0.6303607, 0.1097659, 0, 0, 0, 1, 1,
1.085699, 0.03641354, 2.507249, 0, 0, 0, 1, 1,
1.105546, 0.1979422, -0.00448202, 0, 0, 0, 1, 1,
1.107894, 0.4664443, -0.3657247, 0, 0, 0, 1, 1,
1.114618, 0.7361346, 0.278631, 0, 0, 0, 1, 1,
1.119114, -1.150784, 0.1641881, 0, 0, 0, 1, 1,
1.124388, 1.155626, 1.5264, 1, 1, 1, 1, 1,
1.137742, -0.2055725, 1.166649, 1, 1, 1, 1, 1,
1.138658, 0.4853892, 0.2936234, 1, 1, 1, 1, 1,
1.144625, -1.372543, 2.265085, 1, 1, 1, 1, 1,
1.152035, -0.4343049, 1.879269, 1, 1, 1, 1, 1,
1.153629, -0.9191044, 3.85236, 1, 1, 1, 1, 1,
1.154276, -0.5274277, 0.9598778, 1, 1, 1, 1, 1,
1.15574, -0.9338307, 2.40917, 1, 1, 1, 1, 1,
1.161627, 1.637958, 0.280061, 1, 1, 1, 1, 1,
1.162245, 1.09399, 1.011036, 1, 1, 1, 1, 1,
1.165746, -0.2722515, 2.368583, 1, 1, 1, 1, 1,
1.172657, -0.1341361, 1.29895, 1, 1, 1, 1, 1,
1.197217, -1.518714, 3.036476, 1, 1, 1, 1, 1,
1.202915, 0.04081657, 2.578179, 1, 1, 1, 1, 1,
1.204132, 0.2499127, 1.007404, 1, 1, 1, 1, 1,
1.230986, 0.2697042, 0.9031898, 0, 0, 1, 1, 1,
1.233878, 0.2260819, 2.081361, 1, 0, 0, 1, 1,
1.238776, 0.9157611, 1.182106, 1, 0, 0, 1, 1,
1.239164, -0.3255722, 0.6034459, 1, 0, 0, 1, 1,
1.239457, -0.5049656, 0.180446, 1, 0, 0, 1, 1,
1.242382, 0.5863054, 0.2885671, 1, 0, 0, 1, 1,
1.244213, 0.4446828, 0.3670867, 0, 0, 0, 1, 1,
1.247693, 0.1362156, 2.866351, 0, 0, 0, 1, 1,
1.25229, 0.7696804, 2.479684, 0, 0, 0, 1, 1,
1.280764, 0.9723569, 1.236956, 0, 0, 0, 1, 1,
1.285695, 0.6346853, 1.118074, 0, 0, 0, 1, 1,
1.285895, -0.1115255, 1.638171, 0, 0, 0, 1, 1,
1.294456, 1.048827, 1.292404, 0, 0, 0, 1, 1,
1.29484, 0.969943, 0.07555573, 1, 1, 1, 1, 1,
1.30912, 0.9479344, 1.150442, 1, 1, 1, 1, 1,
1.317192, -1.882031, 2.045592, 1, 1, 1, 1, 1,
1.332171, -0.01682005, 1.850862, 1, 1, 1, 1, 1,
1.341993, 1.573599, -0.1084932, 1, 1, 1, 1, 1,
1.349215, -0.9002099, 0.5940008, 1, 1, 1, 1, 1,
1.362895, -0.9910012, 2.359388, 1, 1, 1, 1, 1,
1.3637, -0.624824, 4.35513, 1, 1, 1, 1, 1,
1.363776, -0.4673102, 2.199385, 1, 1, 1, 1, 1,
1.382603, 0.4795527, 0.7347318, 1, 1, 1, 1, 1,
1.387582, -0.4612304, 3.612977, 1, 1, 1, 1, 1,
1.391672, 1.045095, 3.079993, 1, 1, 1, 1, 1,
1.404892, -0.3923424, 1.70526, 1, 1, 1, 1, 1,
1.416091, 0.1940755, 0.3803282, 1, 1, 1, 1, 1,
1.41691, 3.672322, -1.218592, 1, 1, 1, 1, 1,
1.423634, 1.278283, 1.916187, 0, 0, 1, 1, 1,
1.426303, 2.118316, 0.9257197, 1, 0, 0, 1, 1,
1.42772, 0.5201679, 0.390561, 1, 0, 0, 1, 1,
1.439899, -1.819251, 2.160684, 1, 0, 0, 1, 1,
1.445746, -0.3084188, 1.082752, 1, 0, 0, 1, 1,
1.462592, 1.473974, 1.092462, 1, 0, 0, 1, 1,
1.465219, -0.1001566, -0.004708002, 0, 0, 0, 1, 1,
1.477346, -1.279888, 1.72243, 0, 0, 0, 1, 1,
1.478245, 0.06340288, 2.519857, 0, 0, 0, 1, 1,
1.511461, 1.154683, 1.484344, 0, 0, 0, 1, 1,
1.514213, -0.2271405, 1.552028, 0, 0, 0, 1, 1,
1.519053, -1.983748, 2.966443, 0, 0, 0, 1, 1,
1.535085, -0.05907762, 2.302598, 0, 0, 0, 1, 1,
1.553173, 1.441176, 0.3480917, 1, 1, 1, 1, 1,
1.567077, -0.7912989, 0.8444345, 1, 1, 1, 1, 1,
1.57346, -0.09493747, 2.402244, 1, 1, 1, 1, 1,
1.574849, 0.7071813, 0.02735019, 1, 1, 1, 1, 1,
1.583494, 1.761368, 1.562557, 1, 1, 1, 1, 1,
1.586861, 1.098995, 0.3644975, 1, 1, 1, 1, 1,
1.597231, -0.620196, 1.453455, 1, 1, 1, 1, 1,
1.607921, -0.3223275, -0.2012835, 1, 1, 1, 1, 1,
1.634747, 1.038073, 0.4426437, 1, 1, 1, 1, 1,
1.643263, 2.942738, 0.3602296, 1, 1, 1, 1, 1,
1.645277, 0.1278836, 1.645736, 1, 1, 1, 1, 1,
1.651239, -0.4153537, 1.919143, 1, 1, 1, 1, 1,
1.659633, 0.3263172, 1.356066, 1, 1, 1, 1, 1,
1.687408, 1.978486, 0.8935913, 1, 1, 1, 1, 1,
1.689025, -0.6998086, 1.37656, 1, 1, 1, 1, 1,
1.719009, 0.1838263, 3.824169, 0, 0, 1, 1, 1,
1.719227, 0.7336364, 1.886634, 1, 0, 0, 1, 1,
1.723685, -0.3628735, 1.992103, 1, 0, 0, 1, 1,
1.739906, 0.4869661, 0.7038631, 1, 0, 0, 1, 1,
1.742484, -0.07332682, 2.11941, 1, 0, 0, 1, 1,
1.746481, -0.7165968, 2.387328, 1, 0, 0, 1, 1,
1.778321, 1.6242, 0.1909194, 0, 0, 0, 1, 1,
1.789068, -0.2642053, 1.913082, 0, 0, 0, 1, 1,
1.790185, 1.294061, 0.8762585, 0, 0, 0, 1, 1,
1.805784, 0.8213946, 0.7099661, 0, 0, 0, 1, 1,
1.806668, 0.06220764, 1.828776, 0, 0, 0, 1, 1,
1.829922, -0.7938547, 3.18019, 0, 0, 0, 1, 1,
1.833884, 1.88668, -0.6545022, 0, 0, 0, 1, 1,
1.842772, 0.053979, 0.4468074, 1, 1, 1, 1, 1,
1.851443, -0.4717751, 2.098839, 1, 1, 1, 1, 1,
1.853461, -1.732786, 0.4502811, 1, 1, 1, 1, 1,
1.85602, -1.180042, 0.6787799, 1, 1, 1, 1, 1,
1.877186, -1.134434, 2.421704, 1, 1, 1, 1, 1,
1.884498, -0.1867296, 2.222521, 1, 1, 1, 1, 1,
1.93214, 1.370186, 2.211273, 1, 1, 1, 1, 1,
1.932895, 0.01405076, 2.920583, 1, 1, 1, 1, 1,
1.961937, -0.9664034, 0.3696336, 1, 1, 1, 1, 1,
1.964016, -0.6491541, 0.2650827, 1, 1, 1, 1, 1,
1.967995, 0.4455238, 0.3413358, 1, 1, 1, 1, 1,
1.985712, 1.092758, 2.242513, 1, 1, 1, 1, 1,
1.992856, -0.5904223, 0.4406917, 1, 1, 1, 1, 1,
2.059859, 0.5729427, 3.298558, 1, 1, 1, 1, 1,
2.068851, 0.2578857, 1.80313, 1, 1, 1, 1, 1,
2.102257, -1.571193, 2.661211, 0, 0, 1, 1, 1,
2.140904, -0.4139591, 0.1579246, 1, 0, 0, 1, 1,
2.160781, -0.009664828, 0.0773158, 1, 0, 0, 1, 1,
2.177348, 0.4165118, 1.33953, 1, 0, 0, 1, 1,
2.209791, 0.3060511, 1.089712, 1, 0, 0, 1, 1,
2.285222, -0.5641035, 2.036279, 1, 0, 0, 1, 1,
2.292781, 2.105819, 1.875955, 0, 0, 0, 1, 1,
2.313517, 0.4484789, 0.3329155, 0, 0, 0, 1, 1,
2.41731, -0.535763, 0.6416591, 0, 0, 0, 1, 1,
2.424555, 0.08146776, 1.347671, 0, 0, 0, 1, 1,
2.508176, 1.764422, 0.743714, 0, 0, 0, 1, 1,
2.588738, 0.3393423, 1.324126, 0, 0, 0, 1, 1,
2.64313, 0.1169006, 1.024723, 0, 0, 0, 1, 1,
2.651616, 0.1409175, 3.901867, 1, 1, 1, 1, 1,
2.675459, 0.790807, 1.276287, 1, 1, 1, 1, 1,
2.930822, 3.198335, 0.8402792, 1, 1, 1, 1, 1,
2.983049, -0.6740806, 0.352953, 1, 1, 1, 1, 1,
3.082192, -1.457759, 3.861925, 1, 1, 1, 1, 1,
3.221536, 0.3922682, 1.838682, 1, 1, 1, 1, 1,
3.41476, -0.9050558, 2.143812, 1, 1, 1, 1, 1
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
var radius = 9.463073;
var distance = 33.23864;
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
mvMatrix.translate( -0.2412122, -0.3122568, 0.1848967 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.23864);
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