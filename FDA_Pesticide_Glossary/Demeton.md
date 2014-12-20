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
-4.024717, -1.362213, -2.580195, 1, 0, 0, 1,
-3.117147, -0.09565088, -2.543809, 1, 0.007843138, 0, 1,
-2.980251, 0.4665109, -1.236484, 1, 0.01176471, 0, 1,
-2.89136, -0.713535, -1.796568, 1, 0.01960784, 0, 1,
-2.584636, 0.5273728, -0.4621221, 1, 0.02352941, 0, 1,
-2.54117, 1.339824, -0.05821613, 1, 0.03137255, 0, 1,
-2.528121, 1.335391, -0.3425132, 1, 0.03529412, 0, 1,
-2.512554, 0.484249, -0.5691162, 1, 0.04313726, 0, 1,
-2.457557, -0.6964887, -0.4907001, 1, 0.04705882, 0, 1,
-2.441142, 1.108698, -0.2821383, 1, 0.05490196, 0, 1,
-2.429267, -0.7317855, -2.068485, 1, 0.05882353, 0, 1,
-2.371562, 1.032779, 0.135762, 1, 0.06666667, 0, 1,
-2.360535, 0.1476298, -1.381631, 1, 0.07058824, 0, 1,
-2.357996, -0.9875274, 0.0928945, 1, 0.07843138, 0, 1,
-2.317473, 0.1392306, -0.03009108, 1, 0.08235294, 0, 1,
-2.310994, 0.6252792, -2.658907, 1, 0.09019608, 0, 1,
-2.3019, 0.9593759, -3.239317, 1, 0.09411765, 0, 1,
-2.203872, 1.215428, -0.7050849, 1, 0.1019608, 0, 1,
-2.121536, 0.5256434, 0.1013983, 1, 0.1098039, 0, 1,
-2.027882, 1.355506, 1.171417, 1, 0.1137255, 0, 1,
-2.018666, -2.032388, -2.770925, 1, 0.1215686, 0, 1,
-2.000567, -2.671696, -3.66047, 1, 0.1254902, 0, 1,
-2.000473, -1.427967, -1.783694, 1, 0.1333333, 0, 1,
-1.980106, -0.4421752, -3.013541, 1, 0.1372549, 0, 1,
-1.961085, 1.223724, -1.026211, 1, 0.145098, 0, 1,
-1.944338, -1.211184, -1.842275, 1, 0.1490196, 0, 1,
-1.886914, -0.1631686, -2.882276, 1, 0.1568628, 0, 1,
-1.8785, -1.454382, -1.366986, 1, 0.1607843, 0, 1,
-1.876368, 0.1327539, -0.9538764, 1, 0.1686275, 0, 1,
-1.866979, 0.6128949, -0.08138024, 1, 0.172549, 0, 1,
-1.864708, 0.5444937, -1.208464, 1, 0.1803922, 0, 1,
-1.861196, -1.361443, -1.67689, 1, 0.1843137, 0, 1,
-1.860052, 1.81714, -2.054754, 1, 0.1921569, 0, 1,
-1.854329, -1.211096, -0.4090384, 1, 0.1960784, 0, 1,
-1.832712, 0.4347987, -0.4839376, 1, 0.2039216, 0, 1,
-1.805208, 0.4006484, -2.034314, 1, 0.2117647, 0, 1,
-1.799043, -0.8637175, -2.476501, 1, 0.2156863, 0, 1,
-1.786619, 1.497259, -0.664888, 1, 0.2235294, 0, 1,
-1.773301, -1.021136, -2.094101, 1, 0.227451, 0, 1,
-1.763208, -0.5371842, -1.470586, 1, 0.2352941, 0, 1,
-1.731855, -0.03586601, 1.102028, 1, 0.2392157, 0, 1,
-1.717855, 0.04789531, -0.2569094, 1, 0.2470588, 0, 1,
-1.691438, 1.123692, -1.319466, 1, 0.2509804, 0, 1,
-1.690231, 0.1073501, -2.849936, 1, 0.2588235, 0, 1,
-1.676973, 0.1589491, -1.312254, 1, 0.2627451, 0, 1,
-1.673242, 0.4168813, -2.383649, 1, 0.2705882, 0, 1,
-1.656747, 0.2115584, -2.015362, 1, 0.2745098, 0, 1,
-1.655007, -1.002049, -0.4022847, 1, 0.282353, 0, 1,
-1.650483, -0.069746, -1.721523, 1, 0.2862745, 0, 1,
-1.634953, 2.082959, -1.495668, 1, 0.2941177, 0, 1,
-1.632324, -0.7364944, -0.5642211, 1, 0.3019608, 0, 1,
-1.629921, -0.583296, -0.6132538, 1, 0.3058824, 0, 1,
-1.627119, 1.339987, -0.390153, 1, 0.3137255, 0, 1,
-1.620937, 0.5112918, -1.103683, 1, 0.3176471, 0, 1,
-1.61489, -0.7613396, -3.26218, 1, 0.3254902, 0, 1,
-1.592985, -0.5457183, -1.114866, 1, 0.3294118, 0, 1,
-1.590382, -2.027491, -3.778033, 1, 0.3372549, 0, 1,
-1.585822, -1.583774, -2.823439, 1, 0.3411765, 0, 1,
-1.576419, -0.4551953, -1.597453, 1, 0.3490196, 0, 1,
-1.570267, 0.9693131, -0.7869596, 1, 0.3529412, 0, 1,
-1.559137, 0.1381872, -1.043992, 1, 0.3607843, 0, 1,
-1.557976, -0.5932612, -2.096973, 1, 0.3647059, 0, 1,
-1.549201, -0.1859324, -2.567268, 1, 0.372549, 0, 1,
-1.538282, 0.9289048, -0.05870394, 1, 0.3764706, 0, 1,
-1.524326, 0.4858035, -0.4439194, 1, 0.3843137, 0, 1,
-1.477072, 0.3237443, -1.487814, 1, 0.3882353, 0, 1,
-1.470218, 1.432042, -1.524926, 1, 0.3960784, 0, 1,
-1.462619, 0.8679058, -0.2409766, 1, 0.4039216, 0, 1,
-1.44307, 0.7336718, -0.6681107, 1, 0.4078431, 0, 1,
-1.440678, 1.712308, -1.520241, 1, 0.4156863, 0, 1,
-1.438532, 0.3236847, -1.250532, 1, 0.4196078, 0, 1,
-1.430408, 1.171162, -1.01357, 1, 0.427451, 0, 1,
-1.41932, 0.9194307, -1.661155, 1, 0.4313726, 0, 1,
-1.393334, 0.8623044, -2.015956, 1, 0.4392157, 0, 1,
-1.389132, -0.6597543, -2.79542, 1, 0.4431373, 0, 1,
-1.379925, -1.668255, -2.0627, 1, 0.4509804, 0, 1,
-1.368895, -0.1419624, -3.058235, 1, 0.454902, 0, 1,
-1.368752, -0.3777003, -3.34441, 1, 0.4627451, 0, 1,
-1.364569, 0.0817905, -2.008121, 1, 0.4666667, 0, 1,
-1.360606, 0.2188551, -2.808273, 1, 0.4745098, 0, 1,
-1.357016, 0.4415672, -0.9211395, 1, 0.4784314, 0, 1,
-1.342151, 0.7183719, -0.2090801, 1, 0.4862745, 0, 1,
-1.340825, 1.25906, 0.1729044, 1, 0.4901961, 0, 1,
-1.3272, -1.000091, -1.497836, 1, 0.4980392, 0, 1,
-1.3256, -0.0449037, -1.275542, 1, 0.5058824, 0, 1,
-1.324392, 1.709792, -0.9709272, 1, 0.509804, 0, 1,
-1.315009, 0.5432395, -1.950903, 1, 0.5176471, 0, 1,
-1.313601, -1.888536, -2.560932, 1, 0.5215687, 0, 1,
-1.306955, -0.9142514, -1.89785, 1, 0.5294118, 0, 1,
-1.297563, -1.364497, -1.869268, 1, 0.5333334, 0, 1,
-1.291526, -0.06981654, -0.3689844, 1, 0.5411765, 0, 1,
-1.286503, 0.0933126, -2.097447, 1, 0.5450981, 0, 1,
-1.285696, -1.836845, -1.813141, 1, 0.5529412, 0, 1,
-1.285504, 0.4576538, -2.916269, 1, 0.5568628, 0, 1,
-1.276826, -1.048711, -0.7020893, 1, 0.5647059, 0, 1,
-1.274874, -1.634767, -2.062397, 1, 0.5686275, 0, 1,
-1.270406, 1.508207, -1.723719, 1, 0.5764706, 0, 1,
-1.26671, 0.585559, 0.3107629, 1, 0.5803922, 0, 1,
-1.263982, -0.2539346, -3.505143, 1, 0.5882353, 0, 1,
-1.250204, 0.758535, -1.284973, 1, 0.5921569, 0, 1,
-1.247208, 0.5815495, -1.922788, 1, 0.6, 0, 1,
-1.239624, -0.8986165, -2.133898, 1, 0.6078432, 0, 1,
-1.237025, -0.3785796, -2.203848, 1, 0.6117647, 0, 1,
-1.227133, 0.2699586, 0.1381861, 1, 0.6196079, 0, 1,
-1.227118, -1.065264, -2.35547, 1, 0.6235294, 0, 1,
-1.222719, -0.6219633, -2.444915, 1, 0.6313726, 0, 1,
-1.218555, -0.5897539, -2.743593, 1, 0.6352941, 0, 1,
-1.214499, 2.143666, -2.313698, 1, 0.6431373, 0, 1,
-1.202893, -0.4992476, -0.7631474, 1, 0.6470588, 0, 1,
-1.19408, 1.17086, 0.1736331, 1, 0.654902, 0, 1,
-1.18955, 0.3151992, -1.625853, 1, 0.6588235, 0, 1,
-1.176136, -1.603684, -1.648475, 1, 0.6666667, 0, 1,
-1.172698, -0.2939833, -3.029997, 1, 0.6705883, 0, 1,
-1.168888, 0.6512581, -2.711183, 1, 0.6784314, 0, 1,
-1.164739, 0.7139591, -0.5259324, 1, 0.682353, 0, 1,
-1.159065, 0.8957284, 0.02593416, 1, 0.6901961, 0, 1,
-1.158589, 0.6458095, -1.061752, 1, 0.6941177, 0, 1,
-1.154966, -1.512535, -3.932308, 1, 0.7019608, 0, 1,
-1.152406, 0.1682583, -0.8334085, 1, 0.7098039, 0, 1,
-1.145851, -0.01672766, -2.037843, 1, 0.7137255, 0, 1,
-1.145388, -1.326186, -2.516914, 1, 0.7215686, 0, 1,
-1.142023, -1.244572, -2.971327, 1, 0.7254902, 0, 1,
-1.139744, -0.7134994, -1.335156, 1, 0.7333333, 0, 1,
-1.128058, -0.298683, -1.852232, 1, 0.7372549, 0, 1,
-1.106291, 1.122422, 0.3456517, 1, 0.7450981, 0, 1,
-1.10089, -0.3899112, -2.729164, 1, 0.7490196, 0, 1,
-1.095093, 0.1130548, -2.73355, 1, 0.7568628, 0, 1,
-1.09241, -1.415975, -2.771849, 1, 0.7607843, 0, 1,
-1.092227, 0.2483757, -0.5963379, 1, 0.7686275, 0, 1,
-1.087661, -0.8095219, -0.9060001, 1, 0.772549, 0, 1,
-1.082367, -0.01142602, -1.145108, 1, 0.7803922, 0, 1,
-1.079185, 0.6516674, -1.829565, 1, 0.7843137, 0, 1,
-1.076751, 1.470196, 0.3769586, 1, 0.7921569, 0, 1,
-1.067155, 2.32148, -1.544755, 1, 0.7960784, 0, 1,
-1.060975, -0.1971134, -2.090072, 1, 0.8039216, 0, 1,
-1.031539, 0.2766482, -2.731681, 1, 0.8117647, 0, 1,
-1.02655, -1.620105, -1.259115, 1, 0.8156863, 0, 1,
-1.025673, -0.005965196, -1.237704, 1, 0.8235294, 0, 1,
-1.023609, -0.511728, -3.48356, 1, 0.827451, 0, 1,
-1.018502, -2.00549, -1.101108, 1, 0.8352941, 0, 1,
-1.017165, -1.530543, -2.343277, 1, 0.8392157, 0, 1,
-1.015056, -0.7992327, -1.700671, 1, 0.8470588, 0, 1,
-1.009213, 0.08600543, -4.065461, 1, 0.8509804, 0, 1,
-1.007324, -0.04972206, -2.260434, 1, 0.8588235, 0, 1,
-1.007159, -0.1985208, -1.939451, 1, 0.8627451, 0, 1,
-1.002155, -1.127661, -2.771259, 1, 0.8705882, 0, 1,
-0.9939845, -0.7341799, -1.642683, 1, 0.8745098, 0, 1,
-0.9872513, -0.8722401, -3.195262, 1, 0.8823529, 0, 1,
-0.9840838, 2.392517, -0.255795, 1, 0.8862745, 0, 1,
-0.9825423, -1.262662, -3.279828, 1, 0.8941177, 0, 1,
-0.9822274, 0.5196674, 0.4045757, 1, 0.8980392, 0, 1,
-0.9821898, 1.204823, -0.3239216, 1, 0.9058824, 0, 1,
-0.9802704, -0.7795924, -2.037442, 1, 0.9137255, 0, 1,
-0.9797955, -0.1558883, -2.516335, 1, 0.9176471, 0, 1,
-0.9796597, 0.3965322, -2.508072, 1, 0.9254902, 0, 1,
-0.9684216, -0.2247196, -1.378698, 1, 0.9294118, 0, 1,
-0.9677565, -0.001754676, -0.05404961, 1, 0.9372549, 0, 1,
-0.9620304, -0.983147, -1.284197, 1, 0.9411765, 0, 1,
-0.9606248, -0.9799939, -2.711278, 1, 0.9490196, 0, 1,
-0.9516069, -0.7080212, 0.4484808, 1, 0.9529412, 0, 1,
-0.943333, -1.763805, -1.736279, 1, 0.9607843, 0, 1,
-0.936756, -0.5047544, -1.600264, 1, 0.9647059, 0, 1,
-0.9343218, -1.200922, -1.985751, 1, 0.972549, 0, 1,
-0.9300197, 2.619277, -0.04486245, 1, 0.9764706, 0, 1,
-0.9162914, -0.1451156, -1.955169, 1, 0.9843137, 0, 1,
-0.9152893, 0.5286127, -0.942507, 1, 0.9882353, 0, 1,
-0.9108066, -2.216129, -2.527583, 1, 0.9960784, 0, 1,
-0.9094918, -1.337352, -1.309884, 0.9960784, 1, 0, 1,
-0.905738, 1.003881, -2.072989, 0.9921569, 1, 0, 1,
-0.9044016, 0.2862001, -2.237033, 0.9843137, 1, 0, 1,
-0.902935, 0.384302, -1.032378, 0.9803922, 1, 0, 1,
-0.9022493, -1.029484, -3.35568, 0.972549, 1, 0, 1,
-0.897918, 0.8172823, -0.7500199, 0.9686275, 1, 0, 1,
-0.8947614, 1.124252, -2.434472, 0.9607843, 1, 0, 1,
-0.8946071, 1.547534, 0.01998424, 0.9568627, 1, 0, 1,
-0.889826, -0.6820946, -1.95154, 0.9490196, 1, 0, 1,
-0.8783631, 1.073855, -1.873136, 0.945098, 1, 0, 1,
-0.8678177, -1.445857, -2.937691, 0.9372549, 1, 0, 1,
-0.8638834, 0.8365227, -2.075824, 0.9333333, 1, 0, 1,
-0.8632786, -0.04802063, -1.371664, 0.9254902, 1, 0, 1,
-0.8622091, 2.269826, -1.552456, 0.9215686, 1, 0, 1,
-0.8598225, 0.599874, -0.304304, 0.9137255, 1, 0, 1,
-0.8254145, 1.373372, 1.288617, 0.9098039, 1, 0, 1,
-0.8239691, -0.6655156, 0.3178082, 0.9019608, 1, 0, 1,
-0.8217, 1.628461, 0.1265723, 0.8941177, 1, 0, 1,
-0.8211924, 1.065242, -1.174471, 0.8901961, 1, 0, 1,
-0.8200651, 1.607953, -0.1755697, 0.8823529, 1, 0, 1,
-0.8104607, 1.21524, -0.1207703, 0.8784314, 1, 0, 1,
-0.8074409, -2.629718, -1.58385, 0.8705882, 1, 0, 1,
-0.805267, -1.140669, -3.971157, 0.8666667, 1, 0, 1,
-0.8047105, 0.9994083, -2.320812, 0.8588235, 1, 0, 1,
-0.8032264, 0.2484162, -0.2028454, 0.854902, 1, 0, 1,
-0.8011246, -0.05224447, -1.308528, 0.8470588, 1, 0, 1,
-0.7969452, -0.2831242, -2.137952, 0.8431373, 1, 0, 1,
-0.7953772, 0.2483253, -1.366524, 0.8352941, 1, 0, 1,
-0.7944558, 0.09676633, 0.2479019, 0.8313726, 1, 0, 1,
-0.7942245, 0.0600803, -2.307873, 0.8235294, 1, 0, 1,
-0.7891173, -0.06658863, -3.29851, 0.8196079, 1, 0, 1,
-0.7875665, -0.786637, -0.8917218, 0.8117647, 1, 0, 1,
-0.780861, 1.37625, -1.97001, 0.8078431, 1, 0, 1,
-0.7803214, -2.105384, -2.945417, 0.8, 1, 0, 1,
-0.7755415, 0.1338404, -1.75977, 0.7921569, 1, 0, 1,
-0.7719623, -1.439299, -1.928638, 0.7882353, 1, 0, 1,
-0.7645971, 0.5963069, -1.87235, 0.7803922, 1, 0, 1,
-0.7634773, 1.904412, -2.121826, 0.7764706, 1, 0, 1,
-0.7616017, -0.6492342, -2.308355, 0.7686275, 1, 0, 1,
-0.7603837, 0.9095978, 0.6960032, 0.7647059, 1, 0, 1,
-0.7595963, -0.832758, -0.9143321, 0.7568628, 1, 0, 1,
-0.7554831, 0.2951448, -0.5466182, 0.7529412, 1, 0, 1,
-0.75197, -0.7004148, -3.187897, 0.7450981, 1, 0, 1,
-0.7499478, -0.8466238, -3.050704, 0.7411765, 1, 0, 1,
-0.7480635, -1.49062, -3.361551, 0.7333333, 1, 0, 1,
-0.7456152, 0.3902975, 0.8788906, 0.7294118, 1, 0, 1,
-0.744095, -1.584588, -1.866985, 0.7215686, 1, 0, 1,
-0.7440178, 0.3633649, -0.8052673, 0.7176471, 1, 0, 1,
-0.7382222, -0.5099034, -2.463657, 0.7098039, 1, 0, 1,
-0.7368125, 2.364856, -1.689189, 0.7058824, 1, 0, 1,
-0.7342446, 1.481886, -2.042298, 0.6980392, 1, 0, 1,
-0.7317545, 0.2635303, -2.279852, 0.6901961, 1, 0, 1,
-0.7270818, 1.196701, -0.6944124, 0.6862745, 1, 0, 1,
-0.7265329, 0.9008656, -1.482245, 0.6784314, 1, 0, 1,
-0.7256789, 0.3318282, -0.4540811, 0.6745098, 1, 0, 1,
-0.7205202, 1.035468, 0.700613, 0.6666667, 1, 0, 1,
-0.7168391, 2.784617, -0.4614158, 0.6627451, 1, 0, 1,
-0.7164516, -1.913401, -4.783271, 0.654902, 1, 0, 1,
-0.7143193, -0.8733337, -1.777903, 0.6509804, 1, 0, 1,
-0.7120487, 1.081207, -0.1189802, 0.6431373, 1, 0, 1,
-0.7065367, 0.907636, -0.9835908, 0.6392157, 1, 0, 1,
-0.6988255, -0.6522791, -3.164527, 0.6313726, 1, 0, 1,
-0.6914768, -0.2566834, -1.602054, 0.627451, 1, 0, 1,
-0.6890001, 2.240395, 0.4240783, 0.6196079, 1, 0, 1,
-0.68899, 1.721109, -1.751458, 0.6156863, 1, 0, 1,
-0.6886883, 0.02528977, -2.524161, 0.6078432, 1, 0, 1,
-0.6837397, -0.6335085, -3.865107, 0.6039216, 1, 0, 1,
-0.6819975, 0.08485685, 0.8025138, 0.5960785, 1, 0, 1,
-0.6818902, -0.8357988, -0.7494677, 0.5882353, 1, 0, 1,
-0.6785786, -2.043315, -2.89401, 0.5843138, 1, 0, 1,
-0.6743955, -0.3816186, -2.545818, 0.5764706, 1, 0, 1,
-0.6736683, -0.1771929, -3.051882, 0.572549, 1, 0, 1,
-0.6734253, 1.64515, 0.514307, 0.5647059, 1, 0, 1,
-0.6700976, 0.04480638, -1.951334, 0.5607843, 1, 0, 1,
-0.6633787, -0.4796766, -1.865519, 0.5529412, 1, 0, 1,
-0.6620822, -0.5736287, -1.623727, 0.5490196, 1, 0, 1,
-0.6611429, -1.018085, -3.109773, 0.5411765, 1, 0, 1,
-0.6596519, -0.5868279, -2.582314, 0.5372549, 1, 0, 1,
-0.6566609, 0.7689931, 0.1465738, 0.5294118, 1, 0, 1,
-0.650618, 0.87905, -0.2872925, 0.5254902, 1, 0, 1,
-0.647767, -0.8241713, -0.6645927, 0.5176471, 1, 0, 1,
-0.6435027, -0.3934019, -2.015589, 0.5137255, 1, 0, 1,
-0.6427089, -0.02286943, 0.3544104, 0.5058824, 1, 0, 1,
-0.6422753, -0.9865773, -3.710577, 0.5019608, 1, 0, 1,
-0.6416295, -0.693459, -2.084391, 0.4941176, 1, 0, 1,
-0.6413915, -0.6523717, -4.543599, 0.4862745, 1, 0, 1,
-0.640141, 1.049111, -1.523155, 0.4823529, 1, 0, 1,
-0.6373561, -0.3787134, -3.323982, 0.4745098, 1, 0, 1,
-0.6348866, 0.8052827, -0.4388549, 0.4705882, 1, 0, 1,
-0.6348302, -1.287807, -1.500789, 0.4627451, 1, 0, 1,
-0.6339787, 0.6947271, -0.5989989, 0.4588235, 1, 0, 1,
-0.6158919, 0.5648263, -1.895169, 0.4509804, 1, 0, 1,
-0.61371, 1.179161, -0.3991185, 0.4470588, 1, 0, 1,
-0.6126135, 0.29124, -1.537552, 0.4392157, 1, 0, 1,
-0.6111313, -0.4435559, -2.860888, 0.4352941, 1, 0, 1,
-0.6061964, 0.1720656, -0.5523919, 0.427451, 1, 0, 1,
-0.605553, 1.019379, -1.83506, 0.4235294, 1, 0, 1,
-0.5953919, -1.360856, -1.574852, 0.4156863, 1, 0, 1,
-0.5919766, 0.5024849, 0.3255262, 0.4117647, 1, 0, 1,
-0.5896602, -0.2254739, -1.893631, 0.4039216, 1, 0, 1,
-0.5875477, -0.2187155, -2.227198, 0.3960784, 1, 0, 1,
-0.5821875, -0.788682, -3.562396, 0.3921569, 1, 0, 1,
-0.5796098, 0.1875019, -1.063746, 0.3843137, 1, 0, 1,
-0.5788423, 0.9083854, -0.542124, 0.3803922, 1, 0, 1,
-0.5770684, -0.6758004, -3.265089, 0.372549, 1, 0, 1,
-0.5705302, 1.618768, -0.6178192, 0.3686275, 1, 0, 1,
-0.5702252, -0.6415715, -1.910159, 0.3607843, 1, 0, 1,
-0.5689992, -1.776189, -1.961958, 0.3568628, 1, 0, 1,
-0.5685503, 0.5111819, -0.2838421, 0.3490196, 1, 0, 1,
-0.563051, -0.4588788, -1.712, 0.345098, 1, 0, 1,
-0.5627846, -0.2673987, -2.223323, 0.3372549, 1, 0, 1,
-0.5609841, -1.184066, -2.951186, 0.3333333, 1, 0, 1,
-0.5601937, 0.05403537, -2.142083, 0.3254902, 1, 0, 1,
-0.5577306, 0.100749, -2.01676, 0.3215686, 1, 0, 1,
-0.5566517, 0.1871048, -1.613651, 0.3137255, 1, 0, 1,
-0.556524, -0.2665266, -2.637832, 0.3098039, 1, 0, 1,
-0.5564519, -0.561009, -3.244193, 0.3019608, 1, 0, 1,
-0.5530896, -0.3815501, -1.277424, 0.2941177, 1, 0, 1,
-0.5522801, -1.875075, -3.162861, 0.2901961, 1, 0, 1,
-0.5450521, -0.3964116, -2.682486, 0.282353, 1, 0, 1,
-0.5407168, -0.8333229, -4.370599, 0.2784314, 1, 0, 1,
-0.5394953, 0.54028, -3.18275, 0.2705882, 1, 0, 1,
-0.5394495, -1.556188, -2.747436, 0.2666667, 1, 0, 1,
-0.5386742, 2.343315, -1.630176, 0.2588235, 1, 0, 1,
-0.5350776, 0.451001, -2.263011, 0.254902, 1, 0, 1,
-0.5344746, -0.3226859, -1.051554, 0.2470588, 1, 0, 1,
-0.52686, -0.05289549, -0.9382427, 0.2431373, 1, 0, 1,
-0.5243964, 0.4564287, 0.8604348, 0.2352941, 1, 0, 1,
-0.5239168, -0.7956458, -2.53937, 0.2313726, 1, 0, 1,
-0.5198195, 0.6383466, 0.1797188, 0.2235294, 1, 0, 1,
-0.5169132, -0.7390168, -1.998522, 0.2196078, 1, 0, 1,
-0.5126939, 1.951067, 0.6243691, 0.2117647, 1, 0, 1,
-0.5100093, 0.9599697, -0.05492536, 0.2078431, 1, 0, 1,
-0.5078984, 0.3229234, -1.326834, 0.2, 1, 0, 1,
-0.5069243, 0.116973, -0.448941, 0.1921569, 1, 0, 1,
-0.5066982, -0.2769897, -3.208416, 0.1882353, 1, 0, 1,
-0.506063, 0.6825886, -1.045783, 0.1803922, 1, 0, 1,
-0.5008116, 1.007196, 0.6920377, 0.1764706, 1, 0, 1,
-0.4901326, -0.1323112, -0.457162, 0.1686275, 1, 0, 1,
-0.489949, -2.192297, -2.55935, 0.1647059, 1, 0, 1,
-0.4858034, -0.8568964, -4.547784, 0.1568628, 1, 0, 1,
-0.4787565, -0.04940018, -1.586091, 0.1529412, 1, 0, 1,
-0.476985, 0.4477499, -0.71859, 0.145098, 1, 0, 1,
-0.4762674, 0.2495522, -2.305071, 0.1411765, 1, 0, 1,
-0.469705, 1.496777, -0.2047116, 0.1333333, 1, 0, 1,
-0.4686815, -0.2934747, -2.170392, 0.1294118, 1, 0, 1,
-0.464663, 0.3269977, -1.654836, 0.1215686, 1, 0, 1,
-0.4632227, 0.7662182, -0.3273917, 0.1176471, 1, 0, 1,
-0.4622227, 0.8690677, 0.5065154, 0.1098039, 1, 0, 1,
-0.4580471, 1.347026, -0.0936757, 0.1058824, 1, 0, 1,
-0.4579405, 0.09584168, -0.5022393, 0.09803922, 1, 0, 1,
-0.4480573, -1.198936, -3.666368, 0.09019608, 1, 0, 1,
-0.4470448, -0.5589601, -2.437277, 0.08627451, 1, 0, 1,
-0.4464002, 0.1360647, -2.009747, 0.07843138, 1, 0, 1,
-0.4417545, -1.004031, -2.524486, 0.07450981, 1, 0, 1,
-0.4374802, 0.9069675, -0.3757219, 0.06666667, 1, 0, 1,
-0.4365381, -0.31413, -3.203108, 0.0627451, 1, 0, 1,
-0.4347929, -0.2696137, -4.315934, 0.05490196, 1, 0, 1,
-0.4347455, 0.1778004, -1.148664, 0.05098039, 1, 0, 1,
-0.4302825, -1.677404, -3.939798, 0.04313726, 1, 0, 1,
-0.4301829, 1.249679, 1.618481, 0.03921569, 1, 0, 1,
-0.4299273, 1.547287, -0.6369047, 0.03137255, 1, 0, 1,
-0.4246537, 0.1659923, -2.728892, 0.02745098, 1, 0, 1,
-0.4243928, 2.147206, 0.4252757, 0.01960784, 1, 0, 1,
-0.4226925, 0.4244169, -0.3294792, 0.01568628, 1, 0, 1,
-0.4219635, -1.958334, -3.179311, 0.007843138, 1, 0, 1,
-0.4182572, -0.1215833, -3.149889, 0.003921569, 1, 0, 1,
-0.4128266, -0.276751, -1.236376, 0, 1, 0.003921569, 1,
-0.4120966, 0.7458106, -0.5537958, 0, 1, 0.01176471, 1,
-0.411953, -0.9584479, -1.670105, 0, 1, 0.01568628, 1,
-0.4106549, -0.294359, -2.929819, 0, 1, 0.02352941, 1,
-0.397172, -0.04228351, -3.069233, 0, 1, 0.02745098, 1,
-0.3969154, 0.2562913, -2.715554, 0, 1, 0.03529412, 1,
-0.3933218, -0.2777587, -2.503205, 0, 1, 0.03921569, 1,
-0.3925958, 1.155124, -0.1688958, 0, 1, 0.04705882, 1,
-0.389597, 0.3889251, -1.105969, 0, 1, 0.05098039, 1,
-0.3885815, 0.8413325, -1.573262, 0, 1, 0.05882353, 1,
-0.3884903, 0.6874279, -1.63061, 0, 1, 0.0627451, 1,
-0.3856722, 1.233004, 0.2510367, 0, 1, 0.07058824, 1,
-0.3851634, 1.209559, -0.2243517, 0, 1, 0.07450981, 1,
-0.3837821, -0.02621609, -0.06788044, 0, 1, 0.08235294, 1,
-0.3727039, -0.5530964, -1.336798, 0, 1, 0.08627451, 1,
-0.3721202, -0.1491927, -2.719703, 0, 1, 0.09411765, 1,
-0.3702742, -0.05631277, -1.851016, 0, 1, 0.1019608, 1,
-0.3675895, -0.3606308, -4.469036, 0, 1, 0.1058824, 1,
-0.3644927, 0.2525311, 0.1652094, 0, 1, 0.1137255, 1,
-0.3610327, -0.4106988, -2.066515, 0, 1, 0.1176471, 1,
-0.3601962, 0.2090855, -0.2279109, 0, 1, 0.1254902, 1,
-0.3600963, 0.3269917, -2.008291, 0, 1, 0.1294118, 1,
-0.3574654, -0.1352767, 0.1486899, 0, 1, 0.1372549, 1,
-0.3553021, 2.366288, -0.1448659, 0, 1, 0.1411765, 1,
-0.3529491, 0.216154, -1.178848, 0, 1, 0.1490196, 1,
-0.352754, -0.520395, -1.787259, 0, 1, 0.1529412, 1,
-0.3499621, 0.7522281, 0.09699367, 0, 1, 0.1607843, 1,
-0.3499, 0.522478, -0.7776271, 0, 1, 0.1647059, 1,
-0.3490603, -1.509965, -2.122967, 0, 1, 0.172549, 1,
-0.3488548, 1.122977, 2.240441, 0, 1, 0.1764706, 1,
-0.3474956, -0.833605, -4.183999, 0, 1, 0.1843137, 1,
-0.3452668, -0.002223397, -2.284812, 0, 1, 0.1882353, 1,
-0.3432796, -1.248745, -1.783865, 0, 1, 0.1960784, 1,
-0.3386067, 0.5613313, -0.2097727, 0, 1, 0.2039216, 1,
-0.338387, -2.612154, -3.909562, 0, 1, 0.2078431, 1,
-0.3376045, 0.3190276, -0.3366253, 0, 1, 0.2156863, 1,
-0.3361817, -0.0526934, -2.280231, 0, 1, 0.2196078, 1,
-0.3348997, -0.7894179, -3.753104, 0, 1, 0.227451, 1,
-0.3325634, 0.521503, -0.9719423, 0, 1, 0.2313726, 1,
-0.3315822, 1.223934, -1.229767, 0, 1, 0.2392157, 1,
-0.3303062, -0.332961, -0.7687879, 0, 1, 0.2431373, 1,
-0.3299232, 1.105026, -1.035026, 0, 1, 0.2509804, 1,
-0.3283849, -1.029237, -3.485191, 0, 1, 0.254902, 1,
-0.3283325, 0.5713198, -0.9313286, 0, 1, 0.2627451, 1,
-0.3252264, -1.763161, -3.407019, 0, 1, 0.2666667, 1,
-0.3225155, -0.02445464, -1.571507, 0, 1, 0.2745098, 1,
-0.3160299, 0.7449037, -0.6887427, 0, 1, 0.2784314, 1,
-0.314648, -0.2354926, -3.609717, 0, 1, 0.2862745, 1,
-0.312388, -0.9421987, -3.741482, 0, 1, 0.2901961, 1,
-0.3104349, -2.4549, -1.768258, 0, 1, 0.2980392, 1,
-0.309555, -0.5299671, -1.432426, 0, 1, 0.3058824, 1,
-0.3052077, 1.099664, -0.3696443, 0, 1, 0.3098039, 1,
-0.3048309, 0.3384241, -1.65626, 0, 1, 0.3176471, 1,
-0.3044975, 0.68147, -1.404577, 0, 1, 0.3215686, 1,
-0.3013597, -0.9778932, -3.087773, 0, 1, 0.3294118, 1,
-0.3011563, -1.306722, -1.673308, 0, 1, 0.3333333, 1,
-0.2971235, 0.6618046, -0.4019064, 0, 1, 0.3411765, 1,
-0.2952076, 0.5018569, 0.2553685, 0, 1, 0.345098, 1,
-0.2747833, -0.2297594, -3.708622, 0, 1, 0.3529412, 1,
-0.2667329, -0.8370172, -4.206672, 0, 1, 0.3568628, 1,
-0.2605642, 0.02141655, -0.5958998, 0, 1, 0.3647059, 1,
-0.2599015, 0.5902114, 0.1052192, 0, 1, 0.3686275, 1,
-0.2579819, 0.1400007, -1.693107, 0, 1, 0.3764706, 1,
-0.2565759, 0.225794, 0.1765753, 0, 1, 0.3803922, 1,
-0.2542144, 0.6453607, -0.8285961, 0, 1, 0.3882353, 1,
-0.253942, 0.3198583, -0.699365, 0, 1, 0.3921569, 1,
-0.2504978, -0.04367149, -0.3685399, 0, 1, 0.4, 1,
-0.2480135, 0.3507135, -0.5236046, 0, 1, 0.4078431, 1,
-0.2460137, -0.9133583, -3.336804, 0, 1, 0.4117647, 1,
-0.2404033, -0.03042734, -1.486763, 0, 1, 0.4196078, 1,
-0.2320076, 0.560019, -1.889097, 0, 1, 0.4235294, 1,
-0.2312158, 1.232353, 0.01865699, 0, 1, 0.4313726, 1,
-0.2286004, -0.4059347, -4.610169, 0, 1, 0.4352941, 1,
-0.2257242, 1.602922, 0.8904108, 0, 1, 0.4431373, 1,
-0.2245183, 0.7613709, -0.01308731, 0, 1, 0.4470588, 1,
-0.2204743, 0.4465148, -1.195241, 0, 1, 0.454902, 1,
-0.2199112, -0.2828895, -4.142934, 0, 1, 0.4588235, 1,
-0.2165793, -0.4651304, -1.020501, 0, 1, 0.4666667, 1,
-0.2148171, 0.1155061, -0.5136193, 0, 1, 0.4705882, 1,
-0.20366, -0.1311414, -1.766516, 0, 1, 0.4784314, 1,
-0.2007148, 0.1729875, -0.7183105, 0, 1, 0.4823529, 1,
-0.1992028, 0.7544958, -1.786452, 0, 1, 0.4901961, 1,
-0.1982441, -0.5974802, -4.540492, 0, 1, 0.4941176, 1,
-0.1981506, -0.8644723, -3.933716, 0, 1, 0.5019608, 1,
-0.1972731, 0.9894803, -0.4202196, 0, 1, 0.509804, 1,
-0.1956088, -1.146351, -4.143215, 0, 1, 0.5137255, 1,
-0.1951287, -0.2887655, -2.48358, 0, 1, 0.5215687, 1,
-0.1895002, 0.8245919, 0.1530499, 0, 1, 0.5254902, 1,
-0.1839612, 0.5141966, 0.7492296, 0, 1, 0.5333334, 1,
-0.1835605, 0.3206771, -0.6392452, 0, 1, 0.5372549, 1,
-0.1826536, -0.04112804, -0.9405789, 0, 1, 0.5450981, 1,
-0.1809365, -1.183232, -2.011369, 0, 1, 0.5490196, 1,
-0.1806557, -0.5145229, -2.068932, 0, 1, 0.5568628, 1,
-0.1776911, -0.8838713, -1.192238, 0, 1, 0.5607843, 1,
-0.1712464, -2.353328, -3.171041, 0, 1, 0.5686275, 1,
-0.1685904, 0.5406423, -0.7282686, 0, 1, 0.572549, 1,
-0.1678064, -1.055534, -5.734755, 0, 1, 0.5803922, 1,
-0.1673364, 0.1690175, 0.241431, 0, 1, 0.5843138, 1,
-0.1659843, 0.3590371, -0.003111762, 0, 1, 0.5921569, 1,
-0.1642184, 0.1631488, -0.8175858, 0, 1, 0.5960785, 1,
-0.1625175, 1.101762, -2.46875, 0, 1, 0.6039216, 1,
-0.1624711, -0.08307381, -2.477173, 0, 1, 0.6117647, 1,
-0.1610939, 1.731484, -1.677066, 0, 1, 0.6156863, 1,
-0.1515783, 0.4189987, 0.04506693, 0, 1, 0.6235294, 1,
-0.1460278, 0.314258, 0.1611657, 0, 1, 0.627451, 1,
-0.1423636, -0.7417908, -4.982785, 0, 1, 0.6352941, 1,
-0.1405888, -0.3321223, -2.564452, 0, 1, 0.6392157, 1,
-0.140514, 0.4575984, -0.3942923, 0, 1, 0.6470588, 1,
-0.1355334, 0.7347981, 1.4856, 0, 1, 0.6509804, 1,
-0.127778, 0.4474375, 0.9121781, 0, 1, 0.6588235, 1,
-0.1263015, 1.022947, -0.3124974, 0, 1, 0.6627451, 1,
-0.1204686, -0.6751544, -4.442582, 0, 1, 0.6705883, 1,
-0.1186546, -0.04806215, -1.493672, 0, 1, 0.6745098, 1,
-0.11636, 0.3019039, -0.6073443, 0, 1, 0.682353, 1,
-0.1161867, 0.5038787, -0.04868573, 0, 1, 0.6862745, 1,
-0.1140342, 1.369592, 1.741242, 0, 1, 0.6941177, 1,
-0.1129195, 0.4179457, 0.2064545, 0, 1, 0.7019608, 1,
-0.11112, 0.04429719, -1.654097, 0, 1, 0.7058824, 1,
-0.109672, -0.735836, -5.260661, 0, 1, 0.7137255, 1,
-0.1090511, 0.9228701, 0.6195375, 0, 1, 0.7176471, 1,
-0.1055862, -2.566879, -5.681605, 0, 1, 0.7254902, 1,
-0.09661106, -0.6095947, -3.152991, 0, 1, 0.7294118, 1,
-0.0944723, 0.2215438, 1.789777, 0, 1, 0.7372549, 1,
-0.08931481, -0.3657687, -3.833923, 0, 1, 0.7411765, 1,
-0.08566987, 1.219137, 0.7163507, 0, 1, 0.7490196, 1,
-0.08307566, 0.4344985, 0.6722097, 0, 1, 0.7529412, 1,
-0.0826562, 1.431325, 0.2579986, 0, 1, 0.7607843, 1,
-0.08246823, -1.207263, -2.812003, 0, 1, 0.7647059, 1,
-0.0807587, 0.4046969, -1.507719, 0, 1, 0.772549, 1,
-0.07728149, -0.9348094, -4.089785, 0, 1, 0.7764706, 1,
-0.07612899, 1.231394, 0.1010055, 0, 1, 0.7843137, 1,
-0.07284795, 0.9555012, 1.338296, 0, 1, 0.7882353, 1,
-0.07073424, 2.158937, -1.02607, 0, 1, 0.7960784, 1,
-0.06383699, -1.07868, -4.019173, 0, 1, 0.8039216, 1,
-0.06326559, 0.4315283, -0.8000829, 0, 1, 0.8078431, 1,
-0.06146003, -0.5155096, -1.096001, 0, 1, 0.8156863, 1,
-0.05735244, 0.1274543, -1.419431, 0, 1, 0.8196079, 1,
-0.05663517, 0.387177, 0.1097838, 0, 1, 0.827451, 1,
-0.05501065, -1.691192, -3.19456, 0, 1, 0.8313726, 1,
-0.04828393, 1.016577, -1.786546, 0, 1, 0.8392157, 1,
-0.04168953, -1.113065, -2.777323, 0, 1, 0.8431373, 1,
-0.03984792, -0.7766879, -2.203515, 0, 1, 0.8509804, 1,
-0.03829748, -1.810886, -4.392718, 0, 1, 0.854902, 1,
-0.03762281, 0.6716487, -1.591226, 0, 1, 0.8627451, 1,
-0.03674158, 0.9811277, 0.1396567, 0, 1, 0.8666667, 1,
-0.03563475, 1.001727, -0.999962, 0, 1, 0.8745098, 1,
-0.02970793, 0.7962911, -2.003541, 0, 1, 0.8784314, 1,
-0.02951689, -0.6720734, -3.66137, 0, 1, 0.8862745, 1,
-0.02714352, -0.1247206, -2.905684, 0, 1, 0.8901961, 1,
-0.02696013, -2.565395, -3.711395, 0, 1, 0.8980392, 1,
-0.02500789, 0.2778831, 0.6271183, 0, 1, 0.9058824, 1,
-0.02334374, -0.9440661, -3.336758, 0, 1, 0.9098039, 1,
-0.01838725, -0.6742754, -4.130451, 0, 1, 0.9176471, 1,
-0.01574799, 1.683019, 0.9778878, 0, 1, 0.9215686, 1,
-0.0147051, 0.75057, 0.1651903, 0, 1, 0.9294118, 1,
-0.01468224, 0.04664142, -0.5954118, 0, 1, 0.9333333, 1,
-0.01292486, 0.480577, -0.6263107, 0, 1, 0.9411765, 1,
-0.01155761, -1.368213, -1.352799, 0, 1, 0.945098, 1,
-0.01059049, -0.09606215, -3.302192, 0, 1, 0.9529412, 1,
-0.006671199, -0.008634781, -3.637543, 0, 1, 0.9568627, 1,
-0.001649902, 0.2791887, 0.3109414, 0, 1, 0.9647059, 1,
-0.00078965, -0.4263546, -2.974757, 0, 1, 0.9686275, 1,
0.008360648, -0.01506017, 1.955193, 0, 1, 0.9764706, 1,
0.01205039, -0.9035214, 2.252331, 0, 1, 0.9803922, 1,
0.02014173, -0.8144563, 4.899496, 0, 1, 0.9882353, 1,
0.02066873, 0.6938109, 0.5008685, 0, 1, 0.9921569, 1,
0.02080331, 0.2168338, -0.6442311, 0, 1, 1, 1,
0.02217242, 0.6058671, 1.022876, 0, 0.9921569, 1, 1,
0.02406534, -1.106618, 2.456907, 0, 0.9882353, 1, 1,
0.02665782, -0.07921907, 3.534924, 0, 0.9803922, 1, 1,
0.03280856, 0.2344461, 0.5304516, 0, 0.9764706, 1, 1,
0.03476389, 0.2669534, 1.409381, 0, 0.9686275, 1, 1,
0.03587203, -0.3735244, 3.18786, 0, 0.9647059, 1, 1,
0.03740037, 0.410231, 1.218839, 0, 0.9568627, 1, 1,
0.0388414, -0.622737, 3.798133, 0, 0.9529412, 1, 1,
0.04415457, 0.2376516, -0.7282932, 0, 0.945098, 1, 1,
0.04521561, 1.621771, 0.2067882, 0, 0.9411765, 1, 1,
0.04847711, 1.014513, -1.617272, 0, 0.9333333, 1, 1,
0.05165133, -0.03711792, 3.09728, 0, 0.9294118, 1, 1,
0.05221635, 0.5888609, 0.8040262, 0, 0.9215686, 1, 1,
0.05250819, -0.03322721, 3.354298, 0, 0.9176471, 1, 1,
0.05284609, 0.8442481, 1.238836, 0, 0.9098039, 1, 1,
0.05307029, -0.7927468, 3.611907, 0, 0.9058824, 1, 1,
0.05652973, -0.03124296, 1.316505, 0, 0.8980392, 1, 1,
0.05977919, 0.2778391, 0.001103835, 0, 0.8901961, 1, 1,
0.0608539, -0.7328082, 2.42424, 0, 0.8862745, 1, 1,
0.07001481, 0.2020292, 1.938366, 0, 0.8784314, 1, 1,
0.0710986, -1.396169, 4.689763, 0, 0.8745098, 1, 1,
0.07645737, 0.4379638, 1.360003, 0, 0.8666667, 1, 1,
0.07860452, -1.488345, 1.946623, 0, 0.8627451, 1, 1,
0.08086324, 0.928675, 0.7561899, 0, 0.854902, 1, 1,
0.08117127, -1.545845, 2.659213, 0, 0.8509804, 1, 1,
0.08192373, -0.451007, 3.398158, 0, 0.8431373, 1, 1,
0.08541425, 0.1555796, 0.2132284, 0, 0.8392157, 1, 1,
0.08781733, -0.9063457, 1.237792, 0, 0.8313726, 1, 1,
0.08944977, -1.242239, 3.668191, 0, 0.827451, 1, 1,
0.08995818, -0.1558772, 3.016549, 0, 0.8196079, 1, 1,
0.09036134, -1.598461, 2.81652, 0, 0.8156863, 1, 1,
0.09060567, -1.917155, 1.684035, 0, 0.8078431, 1, 1,
0.09244751, 0.03835148, 0.03163338, 0, 0.8039216, 1, 1,
0.09709004, -0.9051711, 3.09367, 0, 0.7960784, 1, 1,
0.09724443, 0.7786422, -0.1043729, 0, 0.7882353, 1, 1,
0.09773786, 1.174851, -0.3205337, 0, 0.7843137, 1, 1,
0.09834793, 2.153474, 0.4640431, 0, 0.7764706, 1, 1,
0.09879074, 0.3878692, -2.052233, 0, 0.772549, 1, 1,
0.09913822, -0.9623882, 3.883416, 0, 0.7647059, 1, 1,
0.1022683, 0.02667108, 1.875645, 0, 0.7607843, 1, 1,
0.1035064, -0.6914179, 2.822118, 0, 0.7529412, 1, 1,
0.1050365, -0.9359105, 1.633954, 0, 0.7490196, 1, 1,
0.1059073, -0.08591281, -0.2922693, 0, 0.7411765, 1, 1,
0.1099241, -0.4236196, 3.393312, 0, 0.7372549, 1, 1,
0.111112, -0.2495113, 3.230505, 0, 0.7294118, 1, 1,
0.1130966, -1.241751, 2.407556, 0, 0.7254902, 1, 1,
0.116079, 0.4075442, 0.8387476, 0, 0.7176471, 1, 1,
0.117523, -0.07666955, 0.6945587, 0, 0.7137255, 1, 1,
0.1203507, 0.3718636, 0.2747966, 0, 0.7058824, 1, 1,
0.1287192, 1.197098, -0.8907049, 0, 0.6980392, 1, 1,
0.1345355, 2.820311, 1.046289, 0, 0.6941177, 1, 1,
0.1378459, -0.4437691, 4.69053, 0, 0.6862745, 1, 1,
0.1446123, 0.4188647, 1.291235, 0, 0.682353, 1, 1,
0.1527035, -0.6892253, 3.310726, 0, 0.6745098, 1, 1,
0.1559202, -0.3731677, 1.819606, 0, 0.6705883, 1, 1,
0.1589545, 0.03077126, 2.62699, 0, 0.6627451, 1, 1,
0.1593729, -0.1633287, 1.975596, 0, 0.6588235, 1, 1,
0.1628573, 2.130846, -0.2841997, 0, 0.6509804, 1, 1,
0.1631378, -0.9209951, 2.468456, 0, 0.6470588, 1, 1,
0.1640373, 0.07123848, 0.1800143, 0, 0.6392157, 1, 1,
0.167168, -0.04958029, 1.453179, 0, 0.6352941, 1, 1,
0.1677818, -0.5418898, 3.855692, 0, 0.627451, 1, 1,
0.1693862, 0.5524858, -0.9593813, 0, 0.6235294, 1, 1,
0.1724078, -0.6050645, 1.616126, 0, 0.6156863, 1, 1,
0.1744471, -0.6409431, 3.345914, 0, 0.6117647, 1, 1,
0.1800996, -0.2844481, 2.242546, 0, 0.6039216, 1, 1,
0.1805281, 0.3978107, 0.07515461, 0, 0.5960785, 1, 1,
0.1808638, -0.5122848, 1.744955, 0, 0.5921569, 1, 1,
0.1821008, -0.2321395, 1.925407, 0, 0.5843138, 1, 1,
0.1847147, 0.1733889, 1.517361, 0, 0.5803922, 1, 1,
0.1908165, -0.7499143, 2.691279, 0, 0.572549, 1, 1,
0.1925582, 1.500105, 1.500424, 0, 0.5686275, 1, 1,
0.1930868, 0.2823969, -0.03900527, 0, 0.5607843, 1, 1,
0.1958916, 0.4565445, -0.3245926, 0, 0.5568628, 1, 1,
0.199084, -1.651052, 3.199097, 0, 0.5490196, 1, 1,
0.2002916, -1.063298, 1.029279, 0, 0.5450981, 1, 1,
0.2011067, 0.1580768, 1.918073, 0, 0.5372549, 1, 1,
0.2027426, -0.6328628, 1.853413, 0, 0.5333334, 1, 1,
0.2050104, -1.558314, 3.997788, 0, 0.5254902, 1, 1,
0.2114979, -0.3082282, 2.641517, 0, 0.5215687, 1, 1,
0.2122569, -0.893944, 4.035213, 0, 0.5137255, 1, 1,
0.2181492, 0.232403, -0.4520904, 0, 0.509804, 1, 1,
0.2195477, 0.1282353, 1.370412, 0, 0.5019608, 1, 1,
0.2224072, -1.134606, 2.985285, 0, 0.4941176, 1, 1,
0.225778, 0.2540576, 1.663659, 0, 0.4901961, 1, 1,
0.2316574, -0.9815149, 1.946237, 0, 0.4823529, 1, 1,
0.234924, -0.1134222, 1.422258, 0, 0.4784314, 1, 1,
0.2374623, -0.1368467, 2.922849, 0, 0.4705882, 1, 1,
0.2440452, -1.200621, 3.572457, 0, 0.4666667, 1, 1,
0.2441845, 2.314399, -0.09282972, 0, 0.4588235, 1, 1,
0.2487589, -0.0167325, 2.459113, 0, 0.454902, 1, 1,
0.2544541, 1.572002, 1.188689, 0, 0.4470588, 1, 1,
0.2550786, 1.267726, -0.01225964, 0, 0.4431373, 1, 1,
0.2568854, 0.2531147, 3.902547, 0, 0.4352941, 1, 1,
0.2650297, -1.22405, 3.840333, 0, 0.4313726, 1, 1,
0.2692119, 2.17205, -1.476143, 0, 0.4235294, 1, 1,
0.2753353, 1.577142, 1.726714, 0, 0.4196078, 1, 1,
0.2757075, -1.439828, 2.248778, 0, 0.4117647, 1, 1,
0.2792851, 1.13584, -0.1354951, 0, 0.4078431, 1, 1,
0.2864105, -0.007721173, 1.141891, 0, 0.4, 1, 1,
0.2907475, -0.7318735, 2.623052, 0, 0.3921569, 1, 1,
0.2916561, 0.7332317, 0.1588303, 0, 0.3882353, 1, 1,
0.2928313, 0.7271139, -0.1620845, 0, 0.3803922, 1, 1,
0.2966172, -0.5972053, 1.167565, 0, 0.3764706, 1, 1,
0.3006232, 0.2130061, 0.5152783, 0, 0.3686275, 1, 1,
0.3041132, 0.5688372, -0.06881808, 0, 0.3647059, 1, 1,
0.3070906, -1.081113, 2.866387, 0, 0.3568628, 1, 1,
0.3130727, 2.534308, 0.9876958, 0, 0.3529412, 1, 1,
0.3137407, 0.4340739, 0.3296136, 0, 0.345098, 1, 1,
0.3149704, 0.2543576, 0.5460907, 0, 0.3411765, 1, 1,
0.3179428, -0.4560445, 2.758983, 0, 0.3333333, 1, 1,
0.3204202, 0.6888854, -0.6228321, 0, 0.3294118, 1, 1,
0.3222536, 1.001564, -0.01603932, 0, 0.3215686, 1, 1,
0.3225418, 0.5560229, -1.082213, 0, 0.3176471, 1, 1,
0.3258227, -0.05575002, 2.485966, 0, 0.3098039, 1, 1,
0.3265253, -2.032896, 4.094888, 0, 0.3058824, 1, 1,
0.327149, 0.107345, 1.0709, 0, 0.2980392, 1, 1,
0.3273656, 0.6101999, 0.2247931, 0, 0.2901961, 1, 1,
0.3298418, -0.8768004, 3.373822, 0, 0.2862745, 1, 1,
0.330562, 2.00335, -1.0944, 0, 0.2784314, 1, 1,
0.3315451, -0.8926304, 3.171937, 0, 0.2745098, 1, 1,
0.3316486, -0.3386086, 2.639972, 0, 0.2666667, 1, 1,
0.3339964, 1.033446, 1.452307, 0, 0.2627451, 1, 1,
0.3470939, -0.4830019, 1.979829, 0, 0.254902, 1, 1,
0.3540518, -0.8784119, 3.627744, 0, 0.2509804, 1, 1,
0.3576647, -0.6455252, 3.808707, 0, 0.2431373, 1, 1,
0.3579142, -0.01605693, 0.7719367, 0, 0.2392157, 1, 1,
0.3625791, -0.2494254, 2.013184, 0, 0.2313726, 1, 1,
0.3643862, -0.3058757, 3.978181, 0, 0.227451, 1, 1,
0.3668398, -0.7524868, 3.357828, 0, 0.2196078, 1, 1,
0.3775868, 1.220188, 1.145983, 0, 0.2156863, 1, 1,
0.3783611, -1.288324, 0.4550228, 0, 0.2078431, 1, 1,
0.3787068, 0.278201, 1.486445, 0, 0.2039216, 1, 1,
0.3798954, -0.8405361, 3.27861, 0, 0.1960784, 1, 1,
0.3845157, 0.1542051, -0.4161302, 0, 0.1882353, 1, 1,
0.38759, -0.4761527, 1.193614, 0, 0.1843137, 1, 1,
0.3883678, 2.661644, 1.236576, 0, 0.1764706, 1, 1,
0.3937576, 0.6892604, -0.8082057, 0, 0.172549, 1, 1,
0.3954173, -0.5426776, 4.828644, 0, 0.1647059, 1, 1,
0.3959753, 0.8955965, -0.5728306, 0, 0.1607843, 1, 1,
0.4022436, 0.327957, -0.1280284, 0, 0.1529412, 1, 1,
0.4036745, -0.1810193, 1.575266, 0, 0.1490196, 1, 1,
0.4064139, 1.667957, -1.141658, 0, 0.1411765, 1, 1,
0.4090585, -0.5216187, 3.504148, 0, 0.1372549, 1, 1,
0.4167828, 0.07050879, 1.185034, 0, 0.1294118, 1, 1,
0.417542, 0.08948378, 2.170539, 0, 0.1254902, 1, 1,
0.4176611, -1.206041, 2.345093, 0, 0.1176471, 1, 1,
0.4250719, 1.051524, -1.687518, 0, 0.1137255, 1, 1,
0.4266744, -0.8570597, 2.620502, 0, 0.1058824, 1, 1,
0.429139, 0.02169718, 2.609442, 0, 0.09803922, 1, 1,
0.4311016, -0.8799295, 3.697324, 0, 0.09411765, 1, 1,
0.4349332, -2.333637, 3.405413, 0, 0.08627451, 1, 1,
0.4349485, -0.07406442, 1.52774, 0, 0.08235294, 1, 1,
0.4390913, -0.6596281, 1.429064, 0, 0.07450981, 1, 1,
0.4412791, 0.692651, 1.168742, 0, 0.07058824, 1, 1,
0.4544714, 1.992302, 0.5841379, 0, 0.0627451, 1, 1,
0.4612902, 0.6307781, 0.3821319, 0, 0.05882353, 1, 1,
0.4646538, -0.2666882, -0.4047763, 0, 0.05098039, 1, 1,
0.4663582, -1.022462, 3.321864, 0, 0.04705882, 1, 1,
0.4670923, 1.196733, 0.6258528, 0, 0.03921569, 1, 1,
0.4746252, 0.3600886, 0.2035203, 0, 0.03529412, 1, 1,
0.475182, 1.446975, 0.6325671, 0, 0.02745098, 1, 1,
0.4759372, -0.6853223, 1.454161, 0, 0.02352941, 1, 1,
0.4775359, 1.329639, 0.3069549, 0, 0.01568628, 1, 1,
0.4797882, -0.2432822, -0.01941309, 0, 0.01176471, 1, 1,
0.4802907, 1.626168, -0.2464343, 0, 0.003921569, 1, 1,
0.4827624, -1.179341, 1.833544, 0.003921569, 0, 1, 1,
0.4856946, 1.150629, -0.1389482, 0.007843138, 0, 1, 1,
0.4898041, -0.3188043, 2.585779, 0.01568628, 0, 1, 1,
0.4929471, 0.2387913, 2.43054, 0.01960784, 0, 1, 1,
0.4936348, -0.8866786, 2.718267, 0.02745098, 0, 1, 1,
0.4947636, -0.3235763, 2.934305, 0.03137255, 0, 1, 1,
0.4986701, 0.3366624, 2.596126, 0.03921569, 0, 1, 1,
0.4987149, -1.133521, 2.810653, 0.04313726, 0, 1, 1,
0.5010067, 0.8319929, 1.68921, 0.05098039, 0, 1, 1,
0.5014376, -0.02844493, 1.20434, 0.05490196, 0, 1, 1,
0.5019574, 1.056421, 0.4534421, 0.0627451, 0, 1, 1,
0.5045962, 0.2509434, 1.838979, 0.06666667, 0, 1, 1,
0.5103133, 1.528402, -0.510677, 0.07450981, 0, 1, 1,
0.5118589, 0.4707664, 1.696579, 0.07843138, 0, 1, 1,
0.5160783, -1.148379, 2.403618, 0.08627451, 0, 1, 1,
0.5164125, -0.3866402, 2.674654, 0.09019608, 0, 1, 1,
0.5169619, 0.3507184, 2.124058, 0.09803922, 0, 1, 1,
0.5183973, -1.287889, 3.444987, 0.1058824, 0, 1, 1,
0.5202353, -0.107722, 1.37522, 0.1098039, 0, 1, 1,
0.5206516, 0.05105731, 1.620581, 0.1176471, 0, 1, 1,
0.5208395, -0.9887901, 0.8311625, 0.1215686, 0, 1, 1,
0.5221487, -0.1766634, 2.739112, 0.1294118, 0, 1, 1,
0.5238938, -0.7003714, 2.604824, 0.1333333, 0, 1, 1,
0.527975, -0.2614203, 3.363345, 0.1411765, 0, 1, 1,
0.5290727, 1.10028, 0.9237608, 0.145098, 0, 1, 1,
0.532126, -1.15513, 2.580829, 0.1529412, 0, 1, 1,
0.5388106, 0.2034788, -1.130461, 0.1568628, 0, 1, 1,
0.5407175, 1.067101, 0.7119306, 0.1647059, 0, 1, 1,
0.5476768, -0.9744452, 3.971197, 0.1686275, 0, 1, 1,
0.5533102, -0.3054814, 1.268271, 0.1764706, 0, 1, 1,
0.5607613, 0.8913109, 0.5759233, 0.1803922, 0, 1, 1,
0.5608604, -1.31793, 2.405071, 0.1882353, 0, 1, 1,
0.5626494, -0.5821809, 3.53089, 0.1921569, 0, 1, 1,
0.569066, -0.5390497, 1.616678, 0.2, 0, 1, 1,
0.5691177, -0.4048595, 2.431118, 0.2078431, 0, 1, 1,
0.5714394, 0.6398293, 1.744411, 0.2117647, 0, 1, 1,
0.5787493, -0.41462, 2.639967, 0.2196078, 0, 1, 1,
0.5816302, 0.5091609, 2.09547, 0.2235294, 0, 1, 1,
0.582247, 0.261891, -0.6914041, 0.2313726, 0, 1, 1,
0.5888726, -0.8507522, 2.345028, 0.2352941, 0, 1, 1,
0.5913318, -0.4143607, 5.021569, 0.2431373, 0, 1, 1,
0.5967229, 0.09919512, -0.1301761, 0.2470588, 0, 1, 1,
0.5999772, 0.3791595, -0.4734983, 0.254902, 0, 1, 1,
0.60084, 0.751102, 0.3611576, 0.2588235, 0, 1, 1,
0.6016075, -0.01760206, 1.947188, 0.2666667, 0, 1, 1,
0.6032438, 1.61339, 0.5632229, 0.2705882, 0, 1, 1,
0.6038884, -1.001004, 4.111238, 0.2784314, 0, 1, 1,
0.6053498, 1.006634, 0.2189818, 0.282353, 0, 1, 1,
0.6083248, -1.292899, 1.458786, 0.2901961, 0, 1, 1,
0.6090868, -0.03371799, 1.164125, 0.2941177, 0, 1, 1,
0.6093245, -0.2409718, 0.4803455, 0.3019608, 0, 1, 1,
0.6098552, -2.174374, 1.90222, 0.3098039, 0, 1, 1,
0.6116356, -0.6151016, 3.100088, 0.3137255, 0, 1, 1,
0.6123906, 0.703709, -0.2896611, 0.3215686, 0, 1, 1,
0.6132367, -1.723027, 3.821489, 0.3254902, 0, 1, 1,
0.6168227, 0.2116055, 0.9041311, 0.3333333, 0, 1, 1,
0.6273967, -0.5456593, 2.663509, 0.3372549, 0, 1, 1,
0.6276546, 0.8147691, -0.3002947, 0.345098, 0, 1, 1,
0.6299726, -1.950032, 2.910197, 0.3490196, 0, 1, 1,
0.6322744, 0.9129898, -1.253495, 0.3568628, 0, 1, 1,
0.633144, 0.6575305, 2.867516, 0.3607843, 0, 1, 1,
0.6368378, 1.299577, 2.392372, 0.3686275, 0, 1, 1,
0.6422068, 1.511528, 1.697602, 0.372549, 0, 1, 1,
0.6480179, 0.2983536, 1.739525, 0.3803922, 0, 1, 1,
0.6482545, 1.689468, 0.8849947, 0.3843137, 0, 1, 1,
0.6531922, 0.2807012, 1.369425, 0.3921569, 0, 1, 1,
0.6537734, 0.8042641, 2.107188, 0.3960784, 0, 1, 1,
0.6537918, 1.198668, 0.5309189, 0.4039216, 0, 1, 1,
0.654296, 0.4055357, 0.7970677, 0.4117647, 0, 1, 1,
0.6575136, -0.7945683, 1.762008, 0.4156863, 0, 1, 1,
0.6598024, 0.4965603, 2.036629, 0.4235294, 0, 1, 1,
0.6598185, -0.4118781, 1.306146, 0.427451, 0, 1, 1,
0.6616478, -0.8168076, 2.812937, 0.4352941, 0, 1, 1,
0.6627415, 0.4057274, 1.781874, 0.4392157, 0, 1, 1,
0.6653885, 0.4353448, 1.751456, 0.4470588, 0, 1, 1,
0.6726514, -0.001838263, 0.4505518, 0.4509804, 0, 1, 1,
0.6745532, 0.1408584, 0.3823111, 0.4588235, 0, 1, 1,
0.6764264, 0.3717017, 0.3566158, 0.4627451, 0, 1, 1,
0.6833026, 0.3667868, 1.719308, 0.4705882, 0, 1, 1,
0.6894493, -1.065518, 3.310572, 0.4745098, 0, 1, 1,
0.6897297, 0.7783936, 0.01371467, 0.4823529, 0, 1, 1,
0.6934711, -0.1005736, -0.8354815, 0.4862745, 0, 1, 1,
0.7008414, 1.426358, -0.8250034, 0.4941176, 0, 1, 1,
0.7036057, 0.2331002, 3.047881, 0.5019608, 0, 1, 1,
0.7088273, -1.235825, 2.143188, 0.5058824, 0, 1, 1,
0.71254, 1.16298, -0.5825917, 0.5137255, 0, 1, 1,
0.7174336, 0.1335889, 0.5340036, 0.5176471, 0, 1, 1,
0.7202033, -0.7016705, 2.293313, 0.5254902, 0, 1, 1,
0.7238455, 0.7744898, 1.332412, 0.5294118, 0, 1, 1,
0.724254, -1.487747, 3.645888, 0.5372549, 0, 1, 1,
0.7254623, -1.616962, 3.452737, 0.5411765, 0, 1, 1,
0.7270868, 1.228155, 0.2700688, 0.5490196, 0, 1, 1,
0.7306044, 0.02654692, 0.4991423, 0.5529412, 0, 1, 1,
0.7346686, -0.4644472, 4.023141, 0.5607843, 0, 1, 1,
0.7523111, 1.89159, 0.2298993, 0.5647059, 0, 1, 1,
0.7523482, 0.01427176, 2.10757, 0.572549, 0, 1, 1,
0.7524462, -1.77465, 2.879156, 0.5764706, 0, 1, 1,
0.7601813, 0.519324, 1.098611, 0.5843138, 0, 1, 1,
0.7632295, -1.517923, 2.323854, 0.5882353, 0, 1, 1,
0.7674881, 1.411534, 2.503508, 0.5960785, 0, 1, 1,
0.7716183, -1.175259, 1.607602, 0.6039216, 0, 1, 1,
0.7762474, 0.3959047, 0.7829807, 0.6078432, 0, 1, 1,
0.7895067, 1.345548, 1.645635, 0.6156863, 0, 1, 1,
0.7949002, 0.7980877, 1.518864, 0.6196079, 0, 1, 1,
0.7980027, 1.245855, 0.1531089, 0.627451, 0, 1, 1,
0.8035789, -0.9362468, 3.315733, 0.6313726, 0, 1, 1,
0.807044, -1.621056, 3.736859, 0.6392157, 0, 1, 1,
0.8087025, 0.2333064, 1.094702, 0.6431373, 0, 1, 1,
0.8177527, -0.01507814, 1.677194, 0.6509804, 0, 1, 1,
0.8201722, 1.335023, 0.5071036, 0.654902, 0, 1, 1,
0.8264214, 0.07454627, 2.781117, 0.6627451, 0, 1, 1,
0.8288832, -0.1164492, 0.760337, 0.6666667, 0, 1, 1,
0.8330787, 0.1570717, 1.110273, 0.6745098, 0, 1, 1,
0.8390675, 0.7825298, 1.41476, 0.6784314, 0, 1, 1,
0.840764, -0.5930576, 2.305457, 0.6862745, 0, 1, 1,
0.8465911, 0.851238, 0.4802547, 0.6901961, 0, 1, 1,
0.8466667, -1.119181, 2.264416, 0.6980392, 0, 1, 1,
0.8513911, -0.3981237, 3.233547, 0.7058824, 0, 1, 1,
0.8534377, 1.027283, -0.7739413, 0.7098039, 0, 1, 1,
0.8584363, 0.3823808, 1.787521, 0.7176471, 0, 1, 1,
0.8685967, 0.9676574, 1.136162, 0.7215686, 0, 1, 1,
0.8759815, 0.2832686, 1.743911, 0.7294118, 0, 1, 1,
0.8782755, -0.7531574, 2.575748, 0.7333333, 0, 1, 1,
0.8807434, -0.8402332, 5.814187, 0.7411765, 0, 1, 1,
0.8807955, 0.3697906, 3.736413, 0.7450981, 0, 1, 1,
0.8864882, -1.458926, 1.934946, 0.7529412, 0, 1, 1,
0.8872367, -0.4383062, 1.234021, 0.7568628, 0, 1, 1,
0.8894816, 0.09530284, 1.323153, 0.7647059, 0, 1, 1,
0.8896654, -1.23905, 2.469494, 0.7686275, 0, 1, 1,
0.8916009, 0.6202008, 0.08675992, 0.7764706, 0, 1, 1,
0.8959991, -0.7960014, 3.496429, 0.7803922, 0, 1, 1,
0.896534, 1.575559, -0.7177776, 0.7882353, 0, 1, 1,
0.8970156, 0.1264506, 0.676425, 0.7921569, 0, 1, 1,
0.8994381, -0.7105607, 4.248407, 0.8, 0, 1, 1,
0.9000111, -1.145703, 1.70553, 0.8078431, 0, 1, 1,
0.9016429, 2.059944, -0.1026801, 0.8117647, 0, 1, 1,
0.9084686, -0.8947539, 2.548187, 0.8196079, 0, 1, 1,
0.9087865, 0.8706982, 1.13926, 0.8235294, 0, 1, 1,
0.9098635, -0.3740518, 2.302592, 0.8313726, 0, 1, 1,
0.9193558, -0.7593268, 2.72737, 0.8352941, 0, 1, 1,
0.9253824, -0.05944033, 1.88134, 0.8431373, 0, 1, 1,
0.9261247, -0.3559127, 2.145093, 0.8470588, 0, 1, 1,
0.9389787, -1.02299, 3.368536, 0.854902, 0, 1, 1,
0.9403907, 0.2000106, 1.786193, 0.8588235, 0, 1, 1,
0.9473247, 2.531886, -0.5186163, 0.8666667, 0, 1, 1,
0.9523975, 0.3854485, 0.671283, 0.8705882, 0, 1, 1,
0.9540172, -0.630802, 3.071241, 0.8784314, 0, 1, 1,
0.957337, 1.623047, -0.09836636, 0.8823529, 0, 1, 1,
0.9576837, -0.1575672, 1.758527, 0.8901961, 0, 1, 1,
0.9759532, 0.08938889, 1.234099, 0.8941177, 0, 1, 1,
0.9763887, -0.8709192, 3.064551, 0.9019608, 0, 1, 1,
0.9797915, -0.9978023, 3.038937, 0.9098039, 0, 1, 1,
0.9813663, -0.755109, 2.768424, 0.9137255, 0, 1, 1,
0.9889695, -1.277434, 3.23088, 0.9215686, 0, 1, 1,
0.9909762, 0.6134781, 0.5151466, 0.9254902, 0, 1, 1,
0.9960645, 0.1748025, 1.427387, 0.9333333, 0, 1, 1,
0.9987749, 1.386404, 1.00427, 0.9372549, 0, 1, 1,
0.9999855, -0.1897729, 0.9936521, 0.945098, 0, 1, 1,
1.00113, 0.1463531, 1.000662, 0.9490196, 0, 1, 1,
1.001319, -0.7223001, 1.470503, 0.9568627, 0, 1, 1,
1.001501, -0.8308604, 1.091146, 0.9607843, 0, 1, 1,
1.011833, 2.444259, 2.149695, 0.9686275, 0, 1, 1,
1.014411, -0.9784626, 1.330621, 0.972549, 0, 1, 1,
1.01645, -0.5783932, 1.696696, 0.9803922, 0, 1, 1,
1.016483, 0.6366806, 1.775955, 0.9843137, 0, 1, 1,
1.018324, 0.6258206, 4.451741, 0.9921569, 0, 1, 1,
1.021119, 0.3204841, 1.950237, 0.9960784, 0, 1, 1,
1.023836, -0.8565964, 2.508914, 1, 0, 0.9960784, 1,
1.024798, -1.18441, 2.9309, 1, 0, 0.9882353, 1,
1.027739, 0.5464359, 1.148574, 1, 0, 0.9843137, 1,
1.033506, -1.280447, 1.447531, 1, 0, 0.9764706, 1,
1.036602, -0.7950332, 1.47333, 1, 0, 0.972549, 1,
1.038778, 0.1967346, 0.7152169, 1, 0, 0.9647059, 1,
1.045871, -0.5889207, 1.012507, 1, 0, 0.9607843, 1,
1.050169, 0.5136225, -0.3864311, 1, 0, 0.9529412, 1,
1.050203, 0.3683006, 1.061398, 1, 0, 0.9490196, 1,
1.052482, 0.04302586, 0.5244012, 1, 0, 0.9411765, 1,
1.055333, -0.7730473, 2.605877, 1, 0, 0.9372549, 1,
1.059624, -0.1593879, 1.00607, 1, 0, 0.9294118, 1,
1.061422, -0.8252114, 2.724344, 1, 0, 0.9254902, 1,
1.064251, -0.7141895, 1.780963, 1, 0, 0.9176471, 1,
1.07339, 0.1817155, 3.058975, 1, 0, 0.9137255, 1,
1.076772, -0.9723018, 3.866216, 1, 0, 0.9058824, 1,
1.084759, 0.800402, -0.2438734, 1, 0, 0.9019608, 1,
1.085141, 1.128493, 1.69565, 1, 0, 0.8941177, 1,
1.085321, -0.6302536, 2.901411, 1, 0, 0.8862745, 1,
1.097666, 1.319435, 0.6570519, 1, 0, 0.8823529, 1,
1.098193, -0.1781038, 1.289483, 1, 0, 0.8745098, 1,
1.099684, 1.259981, 0.423211, 1, 0, 0.8705882, 1,
1.100874, -0.3456881, 1.83806, 1, 0, 0.8627451, 1,
1.103367, -0.02597909, 1.774782, 1, 0, 0.8588235, 1,
1.106318, -0.502521, 2.044772, 1, 0, 0.8509804, 1,
1.111087, -0.1517228, 1.821744, 1, 0, 0.8470588, 1,
1.113156, 0.3149291, 2.967644, 1, 0, 0.8392157, 1,
1.123572, -0.3692354, 1.927171, 1, 0, 0.8352941, 1,
1.124935, -1.298687, 3.9181, 1, 0, 0.827451, 1,
1.135601, 0.03598784, 1.382316, 1, 0, 0.8235294, 1,
1.136433, -0.6025571, 2.321766, 1, 0, 0.8156863, 1,
1.138583, 0.4928168, 1.458882, 1, 0, 0.8117647, 1,
1.151718, -0.36308, 1.447435, 1, 0, 0.8039216, 1,
1.152972, 0.2884475, 2.682351, 1, 0, 0.7960784, 1,
1.159663, 1.509976, 0.6542541, 1, 0, 0.7921569, 1,
1.161627, -0.110203, -1.609628, 1, 0, 0.7843137, 1,
1.161645, -0.2181981, 1.440076, 1, 0, 0.7803922, 1,
1.162896, 0.1692687, 1.885722, 1, 0, 0.772549, 1,
1.170793, -0.1448329, 1.918857, 1, 0, 0.7686275, 1,
1.174022, -0.6813752, 2.51412, 1, 0, 0.7607843, 1,
1.179667, 0.4392191, 0.4121332, 1, 0, 0.7568628, 1,
1.182554, 1.282161, 0.06575921, 1, 0, 0.7490196, 1,
1.18469, 0.9716333, 1.713361, 1, 0, 0.7450981, 1,
1.191062, 1.039111, -0.3083974, 1, 0, 0.7372549, 1,
1.200569, 0.4213677, 0.009890439, 1, 0, 0.7333333, 1,
1.207085, -1.231121, 3.078351, 1, 0, 0.7254902, 1,
1.208163, 0.7700555, 1.976402, 1, 0, 0.7215686, 1,
1.208985, 0.4087071, 1.205402, 1, 0, 0.7137255, 1,
1.217873, -0.9607807, 1.034939, 1, 0, 0.7098039, 1,
1.222176, -0.8093326, 0.6919544, 1, 0, 0.7019608, 1,
1.223033, -1.902139, 1.682554, 1, 0, 0.6941177, 1,
1.223052, 0.8980355, 1.764599, 1, 0, 0.6901961, 1,
1.235159, 0.2267763, -0.018033, 1, 0, 0.682353, 1,
1.235613, -0.1200476, 2.596355, 1, 0, 0.6784314, 1,
1.24074, 0.9412336, -0.5236246, 1, 0, 0.6705883, 1,
1.24431, 0.1338201, 1.42754, 1, 0, 0.6666667, 1,
1.251399, -1.683611, 1.90307, 1, 0, 0.6588235, 1,
1.259795, -0.9385489, 3.853907, 1, 0, 0.654902, 1,
1.263565, 0.2797987, 0.9927306, 1, 0, 0.6470588, 1,
1.276961, 1.790924, 0.7051089, 1, 0, 0.6431373, 1,
1.294414, -0.173126, 2.411077, 1, 0, 0.6352941, 1,
1.300701, -0.3401351, 1.811423, 1, 0, 0.6313726, 1,
1.307204, -1.135504, 1.56506, 1, 0, 0.6235294, 1,
1.310945, 1.19378, -0.3349066, 1, 0, 0.6196079, 1,
1.316214, 0.2132717, 0.1905342, 1, 0, 0.6117647, 1,
1.317183, -1.36946, 2.838763, 1, 0, 0.6078432, 1,
1.321092, 0.9186863, 1.430354, 1, 0, 0.6, 1,
1.325522, -0.861389, 0.6224337, 1, 0, 0.5921569, 1,
1.328712, -0.5620127, 2.267473, 1, 0, 0.5882353, 1,
1.32937, 0.1510746, 0.01402027, 1, 0, 0.5803922, 1,
1.332656, 0.4577617, -0.0610477, 1, 0, 0.5764706, 1,
1.346058, -0.7695998, 2.677407, 1, 0, 0.5686275, 1,
1.347845, 0.7701187, 0.5800828, 1, 0, 0.5647059, 1,
1.35011, -0.1509291, 1.355972, 1, 0, 0.5568628, 1,
1.355416, -1.809845, 4.060296, 1, 0, 0.5529412, 1,
1.361437, 1.023804, 2.159238, 1, 0, 0.5450981, 1,
1.367045, -1.739767, 3.640557, 1, 0, 0.5411765, 1,
1.367585, 1.382713, 0.6517649, 1, 0, 0.5333334, 1,
1.369863, 0.5871999, 2.088245, 1, 0, 0.5294118, 1,
1.372471, -0.7633774, 3.048265, 1, 0, 0.5215687, 1,
1.378359, -0.5389358, 1.181164, 1, 0, 0.5176471, 1,
1.388394, 0.8466043, 1.872727, 1, 0, 0.509804, 1,
1.394257, -0.5322596, 2.79288, 1, 0, 0.5058824, 1,
1.395179, 0.1652437, 0.2354545, 1, 0, 0.4980392, 1,
1.397437, -0.072795, 2.12377, 1, 0, 0.4901961, 1,
1.397977, 0.84817, 2.731723, 1, 0, 0.4862745, 1,
1.402946, -1.024644, 3.061663, 1, 0, 0.4784314, 1,
1.403722, 1.436689, 1.38187, 1, 0, 0.4745098, 1,
1.410086, -1.165557, 4.586788, 1, 0, 0.4666667, 1,
1.411218, 1.208253, 1.961006, 1, 0, 0.4627451, 1,
1.423045, 1.633902, 1.69204, 1, 0, 0.454902, 1,
1.425913, -1.362948, 0.9088718, 1, 0, 0.4509804, 1,
1.427666, -2.838631, 5.46886, 1, 0, 0.4431373, 1,
1.428804, 1.267123, 1.644164, 1, 0, 0.4392157, 1,
1.432978, 0.0423067, 1.732067, 1, 0, 0.4313726, 1,
1.443316, 1.456421, -0.03499317, 1, 0, 0.427451, 1,
1.465688, -0.3631372, 1.382634, 1, 0, 0.4196078, 1,
1.483859, 0.5151646, 1.154834, 1, 0, 0.4156863, 1,
1.503583, -0.5821542, 0.6602786, 1, 0, 0.4078431, 1,
1.513941, 0.7941734, 0.3355282, 1, 0, 0.4039216, 1,
1.518655, -0.3528171, 3.653416, 1, 0, 0.3960784, 1,
1.534675, -1.051902, 1.623675, 1, 0, 0.3882353, 1,
1.539554, 0.06154741, 0.3478116, 1, 0, 0.3843137, 1,
1.555022, -1.010312, 1.927718, 1, 0, 0.3764706, 1,
1.559119, 0.3811277, 0.06055145, 1, 0, 0.372549, 1,
1.580055, 2.125566, -1.861771, 1, 0, 0.3647059, 1,
1.5919, 1.429325, -0.1859452, 1, 0, 0.3607843, 1,
1.598387, 0.8194832, 0.183643, 1, 0, 0.3529412, 1,
1.615808, -0.5111094, 2.482394, 1, 0, 0.3490196, 1,
1.616972, 0.0823532, 1.956563, 1, 0, 0.3411765, 1,
1.626963, 0.1883509, -0.4393215, 1, 0, 0.3372549, 1,
1.642786, 0.2211888, 1.147429, 1, 0, 0.3294118, 1,
1.663771, 0.3260541, 1.649168, 1, 0, 0.3254902, 1,
1.670317, 0.5138503, 1.675115, 1, 0, 0.3176471, 1,
1.675347, -0.09310681, 1.885702, 1, 0, 0.3137255, 1,
1.686031, 0.1107, 1.331712, 1, 0, 0.3058824, 1,
1.687575, 0.2337901, 1.288682, 1, 0, 0.2980392, 1,
1.690141, -1.755309, 1.50483, 1, 0, 0.2941177, 1,
1.70667, -1.610301, 1.513124, 1, 0, 0.2862745, 1,
1.70816, -0.2240834, 2.217412, 1, 0, 0.282353, 1,
1.732072, 0.6146708, 1.350379, 1, 0, 0.2745098, 1,
1.735242, 0.4578869, 0.8887882, 1, 0, 0.2705882, 1,
1.736168, 0.05066196, -0.4195743, 1, 0, 0.2627451, 1,
1.742596, -0.5088404, 1.71965, 1, 0, 0.2588235, 1,
1.753509, -0.2778288, 1.301206, 1, 0, 0.2509804, 1,
1.774948, -0.2707593, 3.28827, 1, 0, 0.2470588, 1,
1.78266, 0.9576067, 1.384344, 1, 0, 0.2392157, 1,
1.7838, -0.6393801, 3.022328, 1, 0, 0.2352941, 1,
1.785503, 1.549592, -0.6354082, 1, 0, 0.227451, 1,
1.804017, -0.2777178, 2.172086, 1, 0, 0.2235294, 1,
1.804278, 1.184431, 1.501585, 1, 0, 0.2156863, 1,
1.825733, -0.07962453, 1.097879, 1, 0, 0.2117647, 1,
1.854684, 0.516427, 3.197169, 1, 0, 0.2039216, 1,
1.866733, 0.4447419, 1.289241, 1, 0, 0.1960784, 1,
1.882406, -1.878619, 2.826572, 1, 0, 0.1921569, 1,
1.882828, -1.407036, 3.29296, 1, 0, 0.1843137, 1,
1.886178, -0.3354135, 0.8249851, 1, 0, 0.1803922, 1,
1.903549, 1.519369, 2.540064, 1, 0, 0.172549, 1,
1.91673, 0.5788317, 1.368045, 1, 0, 0.1686275, 1,
1.97818, 0.255567, -0.3621043, 1, 0, 0.1607843, 1,
1.995577, -0.275673, 3.340507, 1, 0, 0.1568628, 1,
2.014297, 0.9504948, 2.881591, 1, 0, 0.1490196, 1,
2.022122, -1.10788, 1.248271, 1, 0, 0.145098, 1,
2.026461, 1.306347, 2.045727, 1, 0, 0.1372549, 1,
2.028349, 0.7289572, 0.3954892, 1, 0, 0.1333333, 1,
2.03447, 2.600025, 0.4853082, 1, 0, 0.1254902, 1,
2.035461, 0.9829595, 0.7926457, 1, 0, 0.1215686, 1,
2.039005, -1.894835, 2.320848, 1, 0, 0.1137255, 1,
2.060507, -0.08391194, 1.503277, 1, 0, 0.1098039, 1,
2.075632, 0.5057499, 1.206163, 1, 0, 0.1019608, 1,
2.093613, -0.3603258, 3.68767, 1, 0, 0.09411765, 1,
2.113657, 0.2277654, 1.877247, 1, 0, 0.09019608, 1,
2.138969, -0.2107482, 2.473281, 1, 0, 0.08235294, 1,
2.172395, 1.046872, 1.360087, 1, 0, 0.07843138, 1,
2.183792, 0.0173442, 2.119957, 1, 0, 0.07058824, 1,
2.225625, 0.6477291, -0.0428801, 1, 0, 0.06666667, 1,
2.247558, -0.04250701, 3.343877, 1, 0, 0.05882353, 1,
2.291274, -0.7817824, 2.384894, 1, 0, 0.05490196, 1,
2.315822, 0.475264, 1.349901, 1, 0, 0.04705882, 1,
2.315884, 0.4192676, 2.000479, 1, 0, 0.04313726, 1,
2.35435, -1.118551, 2.752876, 1, 0, 0.03529412, 1,
2.371456, -0.5487459, 2.160926, 1, 0, 0.03137255, 1,
2.689429, -1.450455, 1.454017, 1, 0, 0.02352941, 1,
2.716032, 0.9827015, 1.083698, 1, 0, 0.01960784, 1,
2.83776, -0.165082, 0.8299771, 1, 0, 0.01176471, 1,
3.080884, -0.4039451, 1.911289, 1, 0, 0.007843138, 1
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
-0.4719166, -3.797822, -7.692301, 0, -0.5, 0.5, 0.5,
-0.4719166, -3.797822, -7.692301, 1, -0.5, 0.5, 0.5,
-0.4719166, -3.797822, -7.692301, 1, 1.5, 0.5, 0.5,
-0.4719166, -3.797822, -7.692301, 0, 1.5, 0.5, 0.5
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
-5.229116, -0.00916028, -7.692301, 0, -0.5, 0.5, 0.5,
-5.229116, -0.00916028, -7.692301, 1, -0.5, 0.5, 0.5,
-5.229116, -0.00916028, -7.692301, 1, 1.5, 0.5, 0.5,
-5.229116, -0.00916028, -7.692301, 0, 1.5, 0.5, 0.5
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
-5.229116, -3.797822, 0.03971601, 0, -0.5, 0.5, 0.5,
-5.229116, -3.797822, 0.03971601, 1, -0.5, 0.5, 0.5,
-5.229116, -3.797822, 0.03971601, 1, 1.5, 0.5, 0.5,
-5.229116, -3.797822, 0.03971601, 0, 1.5, 0.5, 0.5
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
-4, -2.923515, -5.907989,
2, -2.923515, -5.907989,
-4, -2.923515, -5.907989,
-4, -3.069233, -6.205374,
-2, -2.923515, -5.907989,
-2, -3.069233, -6.205374,
0, -2.923515, -5.907989,
0, -3.069233, -6.205374,
2, -2.923515, -5.907989,
2, -3.069233, -6.205374
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
"-4",
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
-4, -3.360668, -6.800145, 0, -0.5, 0.5, 0.5,
-4, -3.360668, -6.800145, 1, -0.5, 0.5, 0.5,
-4, -3.360668, -6.800145, 1, 1.5, 0.5, 0.5,
-4, -3.360668, -6.800145, 0, 1.5, 0.5, 0.5,
-2, -3.360668, -6.800145, 0, -0.5, 0.5, 0.5,
-2, -3.360668, -6.800145, 1, -0.5, 0.5, 0.5,
-2, -3.360668, -6.800145, 1, 1.5, 0.5, 0.5,
-2, -3.360668, -6.800145, 0, 1.5, 0.5, 0.5,
0, -3.360668, -6.800145, 0, -0.5, 0.5, 0.5,
0, -3.360668, -6.800145, 1, -0.5, 0.5, 0.5,
0, -3.360668, -6.800145, 1, 1.5, 0.5, 0.5,
0, -3.360668, -6.800145, 0, 1.5, 0.5, 0.5,
2, -3.360668, -6.800145, 0, -0.5, 0.5, 0.5,
2, -3.360668, -6.800145, 1, -0.5, 0.5, 0.5,
2, -3.360668, -6.800145, 1, 1.5, 0.5, 0.5,
2, -3.360668, -6.800145, 0, 1.5, 0.5, 0.5
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
-4.131301, -2, -5.907989,
-4.131301, 2, -5.907989,
-4.131301, -2, -5.907989,
-4.31427, -2, -6.205374,
-4.131301, -1, -5.907989,
-4.31427, -1, -6.205374,
-4.131301, 0, -5.907989,
-4.31427, 0, -6.205374,
-4.131301, 1, -5.907989,
-4.31427, 1, -6.205374,
-4.131301, 2, -5.907989,
-4.31427, 2, -6.205374
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
-4.680209, -2, -6.800145, 0, -0.5, 0.5, 0.5,
-4.680209, -2, -6.800145, 1, -0.5, 0.5, 0.5,
-4.680209, -2, -6.800145, 1, 1.5, 0.5, 0.5,
-4.680209, -2, -6.800145, 0, 1.5, 0.5, 0.5,
-4.680209, -1, -6.800145, 0, -0.5, 0.5, 0.5,
-4.680209, -1, -6.800145, 1, -0.5, 0.5, 0.5,
-4.680209, -1, -6.800145, 1, 1.5, 0.5, 0.5,
-4.680209, -1, -6.800145, 0, 1.5, 0.5, 0.5,
-4.680209, 0, -6.800145, 0, -0.5, 0.5, 0.5,
-4.680209, 0, -6.800145, 1, -0.5, 0.5, 0.5,
-4.680209, 0, -6.800145, 1, 1.5, 0.5, 0.5,
-4.680209, 0, -6.800145, 0, 1.5, 0.5, 0.5,
-4.680209, 1, -6.800145, 0, -0.5, 0.5, 0.5,
-4.680209, 1, -6.800145, 1, -0.5, 0.5, 0.5,
-4.680209, 1, -6.800145, 1, 1.5, 0.5, 0.5,
-4.680209, 1, -6.800145, 0, 1.5, 0.5, 0.5,
-4.680209, 2, -6.800145, 0, -0.5, 0.5, 0.5,
-4.680209, 2, -6.800145, 1, -0.5, 0.5, 0.5,
-4.680209, 2, -6.800145, 1, 1.5, 0.5, 0.5,
-4.680209, 2, -6.800145, 0, 1.5, 0.5, 0.5
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
-4.131301, -2.923515, -4,
-4.131301, -2.923515, 4,
-4.131301, -2.923515, -4,
-4.31427, -3.069233, -4,
-4.131301, -2.923515, -2,
-4.31427, -3.069233, -2,
-4.131301, -2.923515, 0,
-4.31427, -3.069233, 0,
-4.131301, -2.923515, 2,
-4.31427, -3.069233, 2,
-4.131301, -2.923515, 4,
-4.31427, -3.069233, 4
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
-4.680209, -3.360668, -4, 0, -0.5, 0.5, 0.5,
-4.680209, -3.360668, -4, 1, -0.5, 0.5, 0.5,
-4.680209, -3.360668, -4, 1, 1.5, 0.5, 0.5,
-4.680209, -3.360668, -4, 0, 1.5, 0.5, 0.5,
-4.680209, -3.360668, -2, 0, -0.5, 0.5, 0.5,
-4.680209, -3.360668, -2, 1, -0.5, 0.5, 0.5,
-4.680209, -3.360668, -2, 1, 1.5, 0.5, 0.5,
-4.680209, -3.360668, -2, 0, 1.5, 0.5, 0.5,
-4.680209, -3.360668, 0, 0, -0.5, 0.5, 0.5,
-4.680209, -3.360668, 0, 1, -0.5, 0.5, 0.5,
-4.680209, -3.360668, 0, 1, 1.5, 0.5, 0.5,
-4.680209, -3.360668, 0, 0, 1.5, 0.5, 0.5,
-4.680209, -3.360668, 2, 0, -0.5, 0.5, 0.5,
-4.680209, -3.360668, 2, 1, -0.5, 0.5, 0.5,
-4.680209, -3.360668, 2, 1, 1.5, 0.5, 0.5,
-4.680209, -3.360668, 2, 0, 1.5, 0.5, 0.5,
-4.680209, -3.360668, 4, 0, -0.5, 0.5, 0.5,
-4.680209, -3.360668, 4, 1, -0.5, 0.5, 0.5,
-4.680209, -3.360668, 4, 1, 1.5, 0.5, 0.5,
-4.680209, -3.360668, 4, 0, 1.5, 0.5, 0.5
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
-4.131301, -2.923515, -5.907989,
-4.131301, 2.905195, -5.907989,
-4.131301, -2.923515, 5.987421,
-4.131301, 2.905195, 5.987421,
-4.131301, -2.923515, -5.907989,
-4.131301, -2.923515, 5.987421,
-4.131301, 2.905195, -5.907989,
-4.131301, 2.905195, 5.987421,
-4.131301, -2.923515, -5.907989,
3.187468, -2.923515, -5.907989,
-4.131301, -2.923515, 5.987421,
3.187468, -2.923515, 5.987421,
-4.131301, 2.905195, -5.907989,
3.187468, 2.905195, -5.907989,
-4.131301, 2.905195, 5.987421,
3.187468, 2.905195, 5.987421,
3.187468, -2.923515, -5.907989,
3.187468, 2.905195, -5.907989,
3.187468, -2.923515, 5.987421,
3.187468, 2.905195, 5.987421,
3.187468, -2.923515, -5.907989,
3.187468, -2.923515, 5.987421,
3.187468, 2.905195, -5.907989,
3.187468, 2.905195, 5.987421
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
var radius = 8.081281;
var distance = 35.95453;
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
mvMatrix.translate( 0.4719166, 0.00916028, -0.03971601 );
mvMatrix.scale( 1.193867, 1.499069, 0.7345387 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95453);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Demeton<-read.table("Demeton.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Demeton$V2
```

```
## Error in eval(expr, envir, enclos): object 'Demeton' not found
```

```r
y<-Demeton$V3
```

```
## Error in eval(expr, envir, enclos): object 'Demeton' not found
```

```r
z<-Demeton$V4
```

```
## Error in eval(expr, envir, enclos): object 'Demeton' not found
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
-4.024717, -1.362213, -2.580195, 0, 0, 1, 1, 1,
-3.117147, -0.09565088, -2.543809, 1, 0, 0, 1, 1,
-2.980251, 0.4665109, -1.236484, 1, 0, 0, 1, 1,
-2.89136, -0.713535, -1.796568, 1, 0, 0, 1, 1,
-2.584636, 0.5273728, -0.4621221, 1, 0, 0, 1, 1,
-2.54117, 1.339824, -0.05821613, 1, 0, 0, 1, 1,
-2.528121, 1.335391, -0.3425132, 0, 0, 0, 1, 1,
-2.512554, 0.484249, -0.5691162, 0, 0, 0, 1, 1,
-2.457557, -0.6964887, -0.4907001, 0, 0, 0, 1, 1,
-2.441142, 1.108698, -0.2821383, 0, 0, 0, 1, 1,
-2.429267, -0.7317855, -2.068485, 0, 0, 0, 1, 1,
-2.371562, 1.032779, 0.135762, 0, 0, 0, 1, 1,
-2.360535, 0.1476298, -1.381631, 0, 0, 0, 1, 1,
-2.357996, -0.9875274, 0.0928945, 1, 1, 1, 1, 1,
-2.317473, 0.1392306, -0.03009108, 1, 1, 1, 1, 1,
-2.310994, 0.6252792, -2.658907, 1, 1, 1, 1, 1,
-2.3019, 0.9593759, -3.239317, 1, 1, 1, 1, 1,
-2.203872, 1.215428, -0.7050849, 1, 1, 1, 1, 1,
-2.121536, 0.5256434, 0.1013983, 1, 1, 1, 1, 1,
-2.027882, 1.355506, 1.171417, 1, 1, 1, 1, 1,
-2.018666, -2.032388, -2.770925, 1, 1, 1, 1, 1,
-2.000567, -2.671696, -3.66047, 1, 1, 1, 1, 1,
-2.000473, -1.427967, -1.783694, 1, 1, 1, 1, 1,
-1.980106, -0.4421752, -3.013541, 1, 1, 1, 1, 1,
-1.961085, 1.223724, -1.026211, 1, 1, 1, 1, 1,
-1.944338, -1.211184, -1.842275, 1, 1, 1, 1, 1,
-1.886914, -0.1631686, -2.882276, 1, 1, 1, 1, 1,
-1.8785, -1.454382, -1.366986, 1, 1, 1, 1, 1,
-1.876368, 0.1327539, -0.9538764, 0, 0, 1, 1, 1,
-1.866979, 0.6128949, -0.08138024, 1, 0, 0, 1, 1,
-1.864708, 0.5444937, -1.208464, 1, 0, 0, 1, 1,
-1.861196, -1.361443, -1.67689, 1, 0, 0, 1, 1,
-1.860052, 1.81714, -2.054754, 1, 0, 0, 1, 1,
-1.854329, -1.211096, -0.4090384, 1, 0, 0, 1, 1,
-1.832712, 0.4347987, -0.4839376, 0, 0, 0, 1, 1,
-1.805208, 0.4006484, -2.034314, 0, 0, 0, 1, 1,
-1.799043, -0.8637175, -2.476501, 0, 0, 0, 1, 1,
-1.786619, 1.497259, -0.664888, 0, 0, 0, 1, 1,
-1.773301, -1.021136, -2.094101, 0, 0, 0, 1, 1,
-1.763208, -0.5371842, -1.470586, 0, 0, 0, 1, 1,
-1.731855, -0.03586601, 1.102028, 0, 0, 0, 1, 1,
-1.717855, 0.04789531, -0.2569094, 1, 1, 1, 1, 1,
-1.691438, 1.123692, -1.319466, 1, 1, 1, 1, 1,
-1.690231, 0.1073501, -2.849936, 1, 1, 1, 1, 1,
-1.676973, 0.1589491, -1.312254, 1, 1, 1, 1, 1,
-1.673242, 0.4168813, -2.383649, 1, 1, 1, 1, 1,
-1.656747, 0.2115584, -2.015362, 1, 1, 1, 1, 1,
-1.655007, -1.002049, -0.4022847, 1, 1, 1, 1, 1,
-1.650483, -0.069746, -1.721523, 1, 1, 1, 1, 1,
-1.634953, 2.082959, -1.495668, 1, 1, 1, 1, 1,
-1.632324, -0.7364944, -0.5642211, 1, 1, 1, 1, 1,
-1.629921, -0.583296, -0.6132538, 1, 1, 1, 1, 1,
-1.627119, 1.339987, -0.390153, 1, 1, 1, 1, 1,
-1.620937, 0.5112918, -1.103683, 1, 1, 1, 1, 1,
-1.61489, -0.7613396, -3.26218, 1, 1, 1, 1, 1,
-1.592985, -0.5457183, -1.114866, 1, 1, 1, 1, 1,
-1.590382, -2.027491, -3.778033, 0, 0, 1, 1, 1,
-1.585822, -1.583774, -2.823439, 1, 0, 0, 1, 1,
-1.576419, -0.4551953, -1.597453, 1, 0, 0, 1, 1,
-1.570267, 0.9693131, -0.7869596, 1, 0, 0, 1, 1,
-1.559137, 0.1381872, -1.043992, 1, 0, 0, 1, 1,
-1.557976, -0.5932612, -2.096973, 1, 0, 0, 1, 1,
-1.549201, -0.1859324, -2.567268, 0, 0, 0, 1, 1,
-1.538282, 0.9289048, -0.05870394, 0, 0, 0, 1, 1,
-1.524326, 0.4858035, -0.4439194, 0, 0, 0, 1, 1,
-1.477072, 0.3237443, -1.487814, 0, 0, 0, 1, 1,
-1.470218, 1.432042, -1.524926, 0, 0, 0, 1, 1,
-1.462619, 0.8679058, -0.2409766, 0, 0, 0, 1, 1,
-1.44307, 0.7336718, -0.6681107, 0, 0, 0, 1, 1,
-1.440678, 1.712308, -1.520241, 1, 1, 1, 1, 1,
-1.438532, 0.3236847, -1.250532, 1, 1, 1, 1, 1,
-1.430408, 1.171162, -1.01357, 1, 1, 1, 1, 1,
-1.41932, 0.9194307, -1.661155, 1, 1, 1, 1, 1,
-1.393334, 0.8623044, -2.015956, 1, 1, 1, 1, 1,
-1.389132, -0.6597543, -2.79542, 1, 1, 1, 1, 1,
-1.379925, -1.668255, -2.0627, 1, 1, 1, 1, 1,
-1.368895, -0.1419624, -3.058235, 1, 1, 1, 1, 1,
-1.368752, -0.3777003, -3.34441, 1, 1, 1, 1, 1,
-1.364569, 0.0817905, -2.008121, 1, 1, 1, 1, 1,
-1.360606, 0.2188551, -2.808273, 1, 1, 1, 1, 1,
-1.357016, 0.4415672, -0.9211395, 1, 1, 1, 1, 1,
-1.342151, 0.7183719, -0.2090801, 1, 1, 1, 1, 1,
-1.340825, 1.25906, 0.1729044, 1, 1, 1, 1, 1,
-1.3272, -1.000091, -1.497836, 1, 1, 1, 1, 1,
-1.3256, -0.0449037, -1.275542, 0, 0, 1, 1, 1,
-1.324392, 1.709792, -0.9709272, 1, 0, 0, 1, 1,
-1.315009, 0.5432395, -1.950903, 1, 0, 0, 1, 1,
-1.313601, -1.888536, -2.560932, 1, 0, 0, 1, 1,
-1.306955, -0.9142514, -1.89785, 1, 0, 0, 1, 1,
-1.297563, -1.364497, -1.869268, 1, 0, 0, 1, 1,
-1.291526, -0.06981654, -0.3689844, 0, 0, 0, 1, 1,
-1.286503, 0.0933126, -2.097447, 0, 0, 0, 1, 1,
-1.285696, -1.836845, -1.813141, 0, 0, 0, 1, 1,
-1.285504, 0.4576538, -2.916269, 0, 0, 0, 1, 1,
-1.276826, -1.048711, -0.7020893, 0, 0, 0, 1, 1,
-1.274874, -1.634767, -2.062397, 0, 0, 0, 1, 1,
-1.270406, 1.508207, -1.723719, 0, 0, 0, 1, 1,
-1.26671, 0.585559, 0.3107629, 1, 1, 1, 1, 1,
-1.263982, -0.2539346, -3.505143, 1, 1, 1, 1, 1,
-1.250204, 0.758535, -1.284973, 1, 1, 1, 1, 1,
-1.247208, 0.5815495, -1.922788, 1, 1, 1, 1, 1,
-1.239624, -0.8986165, -2.133898, 1, 1, 1, 1, 1,
-1.237025, -0.3785796, -2.203848, 1, 1, 1, 1, 1,
-1.227133, 0.2699586, 0.1381861, 1, 1, 1, 1, 1,
-1.227118, -1.065264, -2.35547, 1, 1, 1, 1, 1,
-1.222719, -0.6219633, -2.444915, 1, 1, 1, 1, 1,
-1.218555, -0.5897539, -2.743593, 1, 1, 1, 1, 1,
-1.214499, 2.143666, -2.313698, 1, 1, 1, 1, 1,
-1.202893, -0.4992476, -0.7631474, 1, 1, 1, 1, 1,
-1.19408, 1.17086, 0.1736331, 1, 1, 1, 1, 1,
-1.18955, 0.3151992, -1.625853, 1, 1, 1, 1, 1,
-1.176136, -1.603684, -1.648475, 1, 1, 1, 1, 1,
-1.172698, -0.2939833, -3.029997, 0, 0, 1, 1, 1,
-1.168888, 0.6512581, -2.711183, 1, 0, 0, 1, 1,
-1.164739, 0.7139591, -0.5259324, 1, 0, 0, 1, 1,
-1.159065, 0.8957284, 0.02593416, 1, 0, 0, 1, 1,
-1.158589, 0.6458095, -1.061752, 1, 0, 0, 1, 1,
-1.154966, -1.512535, -3.932308, 1, 0, 0, 1, 1,
-1.152406, 0.1682583, -0.8334085, 0, 0, 0, 1, 1,
-1.145851, -0.01672766, -2.037843, 0, 0, 0, 1, 1,
-1.145388, -1.326186, -2.516914, 0, 0, 0, 1, 1,
-1.142023, -1.244572, -2.971327, 0, 0, 0, 1, 1,
-1.139744, -0.7134994, -1.335156, 0, 0, 0, 1, 1,
-1.128058, -0.298683, -1.852232, 0, 0, 0, 1, 1,
-1.106291, 1.122422, 0.3456517, 0, 0, 0, 1, 1,
-1.10089, -0.3899112, -2.729164, 1, 1, 1, 1, 1,
-1.095093, 0.1130548, -2.73355, 1, 1, 1, 1, 1,
-1.09241, -1.415975, -2.771849, 1, 1, 1, 1, 1,
-1.092227, 0.2483757, -0.5963379, 1, 1, 1, 1, 1,
-1.087661, -0.8095219, -0.9060001, 1, 1, 1, 1, 1,
-1.082367, -0.01142602, -1.145108, 1, 1, 1, 1, 1,
-1.079185, 0.6516674, -1.829565, 1, 1, 1, 1, 1,
-1.076751, 1.470196, 0.3769586, 1, 1, 1, 1, 1,
-1.067155, 2.32148, -1.544755, 1, 1, 1, 1, 1,
-1.060975, -0.1971134, -2.090072, 1, 1, 1, 1, 1,
-1.031539, 0.2766482, -2.731681, 1, 1, 1, 1, 1,
-1.02655, -1.620105, -1.259115, 1, 1, 1, 1, 1,
-1.025673, -0.005965196, -1.237704, 1, 1, 1, 1, 1,
-1.023609, -0.511728, -3.48356, 1, 1, 1, 1, 1,
-1.018502, -2.00549, -1.101108, 1, 1, 1, 1, 1,
-1.017165, -1.530543, -2.343277, 0, 0, 1, 1, 1,
-1.015056, -0.7992327, -1.700671, 1, 0, 0, 1, 1,
-1.009213, 0.08600543, -4.065461, 1, 0, 0, 1, 1,
-1.007324, -0.04972206, -2.260434, 1, 0, 0, 1, 1,
-1.007159, -0.1985208, -1.939451, 1, 0, 0, 1, 1,
-1.002155, -1.127661, -2.771259, 1, 0, 0, 1, 1,
-0.9939845, -0.7341799, -1.642683, 0, 0, 0, 1, 1,
-0.9872513, -0.8722401, -3.195262, 0, 0, 0, 1, 1,
-0.9840838, 2.392517, -0.255795, 0, 0, 0, 1, 1,
-0.9825423, -1.262662, -3.279828, 0, 0, 0, 1, 1,
-0.9822274, 0.5196674, 0.4045757, 0, 0, 0, 1, 1,
-0.9821898, 1.204823, -0.3239216, 0, 0, 0, 1, 1,
-0.9802704, -0.7795924, -2.037442, 0, 0, 0, 1, 1,
-0.9797955, -0.1558883, -2.516335, 1, 1, 1, 1, 1,
-0.9796597, 0.3965322, -2.508072, 1, 1, 1, 1, 1,
-0.9684216, -0.2247196, -1.378698, 1, 1, 1, 1, 1,
-0.9677565, -0.001754676, -0.05404961, 1, 1, 1, 1, 1,
-0.9620304, -0.983147, -1.284197, 1, 1, 1, 1, 1,
-0.9606248, -0.9799939, -2.711278, 1, 1, 1, 1, 1,
-0.9516069, -0.7080212, 0.4484808, 1, 1, 1, 1, 1,
-0.943333, -1.763805, -1.736279, 1, 1, 1, 1, 1,
-0.936756, -0.5047544, -1.600264, 1, 1, 1, 1, 1,
-0.9343218, -1.200922, -1.985751, 1, 1, 1, 1, 1,
-0.9300197, 2.619277, -0.04486245, 1, 1, 1, 1, 1,
-0.9162914, -0.1451156, -1.955169, 1, 1, 1, 1, 1,
-0.9152893, 0.5286127, -0.942507, 1, 1, 1, 1, 1,
-0.9108066, -2.216129, -2.527583, 1, 1, 1, 1, 1,
-0.9094918, -1.337352, -1.309884, 1, 1, 1, 1, 1,
-0.905738, 1.003881, -2.072989, 0, 0, 1, 1, 1,
-0.9044016, 0.2862001, -2.237033, 1, 0, 0, 1, 1,
-0.902935, 0.384302, -1.032378, 1, 0, 0, 1, 1,
-0.9022493, -1.029484, -3.35568, 1, 0, 0, 1, 1,
-0.897918, 0.8172823, -0.7500199, 1, 0, 0, 1, 1,
-0.8947614, 1.124252, -2.434472, 1, 0, 0, 1, 1,
-0.8946071, 1.547534, 0.01998424, 0, 0, 0, 1, 1,
-0.889826, -0.6820946, -1.95154, 0, 0, 0, 1, 1,
-0.8783631, 1.073855, -1.873136, 0, 0, 0, 1, 1,
-0.8678177, -1.445857, -2.937691, 0, 0, 0, 1, 1,
-0.8638834, 0.8365227, -2.075824, 0, 0, 0, 1, 1,
-0.8632786, -0.04802063, -1.371664, 0, 0, 0, 1, 1,
-0.8622091, 2.269826, -1.552456, 0, 0, 0, 1, 1,
-0.8598225, 0.599874, -0.304304, 1, 1, 1, 1, 1,
-0.8254145, 1.373372, 1.288617, 1, 1, 1, 1, 1,
-0.8239691, -0.6655156, 0.3178082, 1, 1, 1, 1, 1,
-0.8217, 1.628461, 0.1265723, 1, 1, 1, 1, 1,
-0.8211924, 1.065242, -1.174471, 1, 1, 1, 1, 1,
-0.8200651, 1.607953, -0.1755697, 1, 1, 1, 1, 1,
-0.8104607, 1.21524, -0.1207703, 1, 1, 1, 1, 1,
-0.8074409, -2.629718, -1.58385, 1, 1, 1, 1, 1,
-0.805267, -1.140669, -3.971157, 1, 1, 1, 1, 1,
-0.8047105, 0.9994083, -2.320812, 1, 1, 1, 1, 1,
-0.8032264, 0.2484162, -0.2028454, 1, 1, 1, 1, 1,
-0.8011246, -0.05224447, -1.308528, 1, 1, 1, 1, 1,
-0.7969452, -0.2831242, -2.137952, 1, 1, 1, 1, 1,
-0.7953772, 0.2483253, -1.366524, 1, 1, 1, 1, 1,
-0.7944558, 0.09676633, 0.2479019, 1, 1, 1, 1, 1,
-0.7942245, 0.0600803, -2.307873, 0, 0, 1, 1, 1,
-0.7891173, -0.06658863, -3.29851, 1, 0, 0, 1, 1,
-0.7875665, -0.786637, -0.8917218, 1, 0, 0, 1, 1,
-0.780861, 1.37625, -1.97001, 1, 0, 0, 1, 1,
-0.7803214, -2.105384, -2.945417, 1, 0, 0, 1, 1,
-0.7755415, 0.1338404, -1.75977, 1, 0, 0, 1, 1,
-0.7719623, -1.439299, -1.928638, 0, 0, 0, 1, 1,
-0.7645971, 0.5963069, -1.87235, 0, 0, 0, 1, 1,
-0.7634773, 1.904412, -2.121826, 0, 0, 0, 1, 1,
-0.7616017, -0.6492342, -2.308355, 0, 0, 0, 1, 1,
-0.7603837, 0.9095978, 0.6960032, 0, 0, 0, 1, 1,
-0.7595963, -0.832758, -0.9143321, 0, 0, 0, 1, 1,
-0.7554831, 0.2951448, -0.5466182, 0, 0, 0, 1, 1,
-0.75197, -0.7004148, -3.187897, 1, 1, 1, 1, 1,
-0.7499478, -0.8466238, -3.050704, 1, 1, 1, 1, 1,
-0.7480635, -1.49062, -3.361551, 1, 1, 1, 1, 1,
-0.7456152, 0.3902975, 0.8788906, 1, 1, 1, 1, 1,
-0.744095, -1.584588, -1.866985, 1, 1, 1, 1, 1,
-0.7440178, 0.3633649, -0.8052673, 1, 1, 1, 1, 1,
-0.7382222, -0.5099034, -2.463657, 1, 1, 1, 1, 1,
-0.7368125, 2.364856, -1.689189, 1, 1, 1, 1, 1,
-0.7342446, 1.481886, -2.042298, 1, 1, 1, 1, 1,
-0.7317545, 0.2635303, -2.279852, 1, 1, 1, 1, 1,
-0.7270818, 1.196701, -0.6944124, 1, 1, 1, 1, 1,
-0.7265329, 0.9008656, -1.482245, 1, 1, 1, 1, 1,
-0.7256789, 0.3318282, -0.4540811, 1, 1, 1, 1, 1,
-0.7205202, 1.035468, 0.700613, 1, 1, 1, 1, 1,
-0.7168391, 2.784617, -0.4614158, 1, 1, 1, 1, 1,
-0.7164516, -1.913401, -4.783271, 0, 0, 1, 1, 1,
-0.7143193, -0.8733337, -1.777903, 1, 0, 0, 1, 1,
-0.7120487, 1.081207, -0.1189802, 1, 0, 0, 1, 1,
-0.7065367, 0.907636, -0.9835908, 1, 0, 0, 1, 1,
-0.6988255, -0.6522791, -3.164527, 1, 0, 0, 1, 1,
-0.6914768, -0.2566834, -1.602054, 1, 0, 0, 1, 1,
-0.6890001, 2.240395, 0.4240783, 0, 0, 0, 1, 1,
-0.68899, 1.721109, -1.751458, 0, 0, 0, 1, 1,
-0.6886883, 0.02528977, -2.524161, 0, 0, 0, 1, 1,
-0.6837397, -0.6335085, -3.865107, 0, 0, 0, 1, 1,
-0.6819975, 0.08485685, 0.8025138, 0, 0, 0, 1, 1,
-0.6818902, -0.8357988, -0.7494677, 0, 0, 0, 1, 1,
-0.6785786, -2.043315, -2.89401, 0, 0, 0, 1, 1,
-0.6743955, -0.3816186, -2.545818, 1, 1, 1, 1, 1,
-0.6736683, -0.1771929, -3.051882, 1, 1, 1, 1, 1,
-0.6734253, 1.64515, 0.514307, 1, 1, 1, 1, 1,
-0.6700976, 0.04480638, -1.951334, 1, 1, 1, 1, 1,
-0.6633787, -0.4796766, -1.865519, 1, 1, 1, 1, 1,
-0.6620822, -0.5736287, -1.623727, 1, 1, 1, 1, 1,
-0.6611429, -1.018085, -3.109773, 1, 1, 1, 1, 1,
-0.6596519, -0.5868279, -2.582314, 1, 1, 1, 1, 1,
-0.6566609, 0.7689931, 0.1465738, 1, 1, 1, 1, 1,
-0.650618, 0.87905, -0.2872925, 1, 1, 1, 1, 1,
-0.647767, -0.8241713, -0.6645927, 1, 1, 1, 1, 1,
-0.6435027, -0.3934019, -2.015589, 1, 1, 1, 1, 1,
-0.6427089, -0.02286943, 0.3544104, 1, 1, 1, 1, 1,
-0.6422753, -0.9865773, -3.710577, 1, 1, 1, 1, 1,
-0.6416295, -0.693459, -2.084391, 1, 1, 1, 1, 1,
-0.6413915, -0.6523717, -4.543599, 0, 0, 1, 1, 1,
-0.640141, 1.049111, -1.523155, 1, 0, 0, 1, 1,
-0.6373561, -0.3787134, -3.323982, 1, 0, 0, 1, 1,
-0.6348866, 0.8052827, -0.4388549, 1, 0, 0, 1, 1,
-0.6348302, -1.287807, -1.500789, 1, 0, 0, 1, 1,
-0.6339787, 0.6947271, -0.5989989, 1, 0, 0, 1, 1,
-0.6158919, 0.5648263, -1.895169, 0, 0, 0, 1, 1,
-0.61371, 1.179161, -0.3991185, 0, 0, 0, 1, 1,
-0.6126135, 0.29124, -1.537552, 0, 0, 0, 1, 1,
-0.6111313, -0.4435559, -2.860888, 0, 0, 0, 1, 1,
-0.6061964, 0.1720656, -0.5523919, 0, 0, 0, 1, 1,
-0.605553, 1.019379, -1.83506, 0, 0, 0, 1, 1,
-0.5953919, -1.360856, -1.574852, 0, 0, 0, 1, 1,
-0.5919766, 0.5024849, 0.3255262, 1, 1, 1, 1, 1,
-0.5896602, -0.2254739, -1.893631, 1, 1, 1, 1, 1,
-0.5875477, -0.2187155, -2.227198, 1, 1, 1, 1, 1,
-0.5821875, -0.788682, -3.562396, 1, 1, 1, 1, 1,
-0.5796098, 0.1875019, -1.063746, 1, 1, 1, 1, 1,
-0.5788423, 0.9083854, -0.542124, 1, 1, 1, 1, 1,
-0.5770684, -0.6758004, -3.265089, 1, 1, 1, 1, 1,
-0.5705302, 1.618768, -0.6178192, 1, 1, 1, 1, 1,
-0.5702252, -0.6415715, -1.910159, 1, 1, 1, 1, 1,
-0.5689992, -1.776189, -1.961958, 1, 1, 1, 1, 1,
-0.5685503, 0.5111819, -0.2838421, 1, 1, 1, 1, 1,
-0.563051, -0.4588788, -1.712, 1, 1, 1, 1, 1,
-0.5627846, -0.2673987, -2.223323, 1, 1, 1, 1, 1,
-0.5609841, -1.184066, -2.951186, 1, 1, 1, 1, 1,
-0.5601937, 0.05403537, -2.142083, 1, 1, 1, 1, 1,
-0.5577306, 0.100749, -2.01676, 0, 0, 1, 1, 1,
-0.5566517, 0.1871048, -1.613651, 1, 0, 0, 1, 1,
-0.556524, -0.2665266, -2.637832, 1, 0, 0, 1, 1,
-0.5564519, -0.561009, -3.244193, 1, 0, 0, 1, 1,
-0.5530896, -0.3815501, -1.277424, 1, 0, 0, 1, 1,
-0.5522801, -1.875075, -3.162861, 1, 0, 0, 1, 1,
-0.5450521, -0.3964116, -2.682486, 0, 0, 0, 1, 1,
-0.5407168, -0.8333229, -4.370599, 0, 0, 0, 1, 1,
-0.5394953, 0.54028, -3.18275, 0, 0, 0, 1, 1,
-0.5394495, -1.556188, -2.747436, 0, 0, 0, 1, 1,
-0.5386742, 2.343315, -1.630176, 0, 0, 0, 1, 1,
-0.5350776, 0.451001, -2.263011, 0, 0, 0, 1, 1,
-0.5344746, -0.3226859, -1.051554, 0, 0, 0, 1, 1,
-0.52686, -0.05289549, -0.9382427, 1, 1, 1, 1, 1,
-0.5243964, 0.4564287, 0.8604348, 1, 1, 1, 1, 1,
-0.5239168, -0.7956458, -2.53937, 1, 1, 1, 1, 1,
-0.5198195, 0.6383466, 0.1797188, 1, 1, 1, 1, 1,
-0.5169132, -0.7390168, -1.998522, 1, 1, 1, 1, 1,
-0.5126939, 1.951067, 0.6243691, 1, 1, 1, 1, 1,
-0.5100093, 0.9599697, -0.05492536, 1, 1, 1, 1, 1,
-0.5078984, 0.3229234, -1.326834, 1, 1, 1, 1, 1,
-0.5069243, 0.116973, -0.448941, 1, 1, 1, 1, 1,
-0.5066982, -0.2769897, -3.208416, 1, 1, 1, 1, 1,
-0.506063, 0.6825886, -1.045783, 1, 1, 1, 1, 1,
-0.5008116, 1.007196, 0.6920377, 1, 1, 1, 1, 1,
-0.4901326, -0.1323112, -0.457162, 1, 1, 1, 1, 1,
-0.489949, -2.192297, -2.55935, 1, 1, 1, 1, 1,
-0.4858034, -0.8568964, -4.547784, 1, 1, 1, 1, 1,
-0.4787565, -0.04940018, -1.586091, 0, 0, 1, 1, 1,
-0.476985, 0.4477499, -0.71859, 1, 0, 0, 1, 1,
-0.4762674, 0.2495522, -2.305071, 1, 0, 0, 1, 1,
-0.469705, 1.496777, -0.2047116, 1, 0, 0, 1, 1,
-0.4686815, -0.2934747, -2.170392, 1, 0, 0, 1, 1,
-0.464663, 0.3269977, -1.654836, 1, 0, 0, 1, 1,
-0.4632227, 0.7662182, -0.3273917, 0, 0, 0, 1, 1,
-0.4622227, 0.8690677, 0.5065154, 0, 0, 0, 1, 1,
-0.4580471, 1.347026, -0.0936757, 0, 0, 0, 1, 1,
-0.4579405, 0.09584168, -0.5022393, 0, 0, 0, 1, 1,
-0.4480573, -1.198936, -3.666368, 0, 0, 0, 1, 1,
-0.4470448, -0.5589601, -2.437277, 0, 0, 0, 1, 1,
-0.4464002, 0.1360647, -2.009747, 0, 0, 0, 1, 1,
-0.4417545, -1.004031, -2.524486, 1, 1, 1, 1, 1,
-0.4374802, 0.9069675, -0.3757219, 1, 1, 1, 1, 1,
-0.4365381, -0.31413, -3.203108, 1, 1, 1, 1, 1,
-0.4347929, -0.2696137, -4.315934, 1, 1, 1, 1, 1,
-0.4347455, 0.1778004, -1.148664, 1, 1, 1, 1, 1,
-0.4302825, -1.677404, -3.939798, 1, 1, 1, 1, 1,
-0.4301829, 1.249679, 1.618481, 1, 1, 1, 1, 1,
-0.4299273, 1.547287, -0.6369047, 1, 1, 1, 1, 1,
-0.4246537, 0.1659923, -2.728892, 1, 1, 1, 1, 1,
-0.4243928, 2.147206, 0.4252757, 1, 1, 1, 1, 1,
-0.4226925, 0.4244169, -0.3294792, 1, 1, 1, 1, 1,
-0.4219635, -1.958334, -3.179311, 1, 1, 1, 1, 1,
-0.4182572, -0.1215833, -3.149889, 1, 1, 1, 1, 1,
-0.4128266, -0.276751, -1.236376, 1, 1, 1, 1, 1,
-0.4120966, 0.7458106, -0.5537958, 1, 1, 1, 1, 1,
-0.411953, -0.9584479, -1.670105, 0, 0, 1, 1, 1,
-0.4106549, -0.294359, -2.929819, 1, 0, 0, 1, 1,
-0.397172, -0.04228351, -3.069233, 1, 0, 0, 1, 1,
-0.3969154, 0.2562913, -2.715554, 1, 0, 0, 1, 1,
-0.3933218, -0.2777587, -2.503205, 1, 0, 0, 1, 1,
-0.3925958, 1.155124, -0.1688958, 1, 0, 0, 1, 1,
-0.389597, 0.3889251, -1.105969, 0, 0, 0, 1, 1,
-0.3885815, 0.8413325, -1.573262, 0, 0, 0, 1, 1,
-0.3884903, 0.6874279, -1.63061, 0, 0, 0, 1, 1,
-0.3856722, 1.233004, 0.2510367, 0, 0, 0, 1, 1,
-0.3851634, 1.209559, -0.2243517, 0, 0, 0, 1, 1,
-0.3837821, -0.02621609, -0.06788044, 0, 0, 0, 1, 1,
-0.3727039, -0.5530964, -1.336798, 0, 0, 0, 1, 1,
-0.3721202, -0.1491927, -2.719703, 1, 1, 1, 1, 1,
-0.3702742, -0.05631277, -1.851016, 1, 1, 1, 1, 1,
-0.3675895, -0.3606308, -4.469036, 1, 1, 1, 1, 1,
-0.3644927, 0.2525311, 0.1652094, 1, 1, 1, 1, 1,
-0.3610327, -0.4106988, -2.066515, 1, 1, 1, 1, 1,
-0.3601962, 0.2090855, -0.2279109, 1, 1, 1, 1, 1,
-0.3600963, 0.3269917, -2.008291, 1, 1, 1, 1, 1,
-0.3574654, -0.1352767, 0.1486899, 1, 1, 1, 1, 1,
-0.3553021, 2.366288, -0.1448659, 1, 1, 1, 1, 1,
-0.3529491, 0.216154, -1.178848, 1, 1, 1, 1, 1,
-0.352754, -0.520395, -1.787259, 1, 1, 1, 1, 1,
-0.3499621, 0.7522281, 0.09699367, 1, 1, 1, 1, 1,
-0.3499, 0.522478, -0.7776271, 1, 1, 1, 1, 1,
-0.3490603, -1.509965, -2.122967, 1, 1, 1, 1, 1,
-0.3488548, 1.122977, 2.240441, 1, 1, 1, 1, 1,
-0.3474956, -0.833605, -4.183999, 0, 0, 1, 1, 1,
-0.3452668, -0.002223397, -2.284812, 1, 0, 0, 1, 1,
-0.3432796, -1.248745, -1.783865, 1, 0, 0, 1, 1,
-0.3386067, 0.5613313, -0.2097727, 1, 0, 0, 1, 1,
-0.338387, -2.612154, -3.909562, 1, 0, 0, 1, 1,
-0.3376045, 0.3190276, -0.3366253, 1, 0, 0, 1, 1,
-0.3361817, -0.0526934, -2.280231, 0, 0, 0, 1, 1,
-0.3348997, -0.7894179, -3.753104, 0, 0, 0, 1, 1,
-0.3325634, 0.521503, -0.9719423, 0, 0, 0, 1, 1,
-0.3315822, 1.223934, -1.229767, 0, 0, 0, 1, 1,
-0.3303062, -0.332961, -0.7687879, 0, 0, 0, 1, 1,
-0.3299232, 1.105026, -1.035026, 0, 0, 0, 1, 1,
-0.3283849, -1.029237, -3.485191, 0, 0, 0, 1, 1,
-0.3283325, 0.5713198, -0.9313286, 1, 1, 1, 1, 1,
-0.3252264, -1.763161, -3.407019, 1, 1, 1, 1, 1,
-0.3225155, -0.02445464, -1.571507, 1, 1, 1, 1, 1,
-0.3160299, 0.7449037, -0.6887427, 1, 1, 1, 1, 1,
-0.314648, -0.2354926, -3.609717, 1, 1, 1, 1, 1,
-0.312388, -0.9421987, -3.741482, 1, 1, 1, 1, 1,
-0.3104349, -2.4549, -1.768258, 1, 1, 1, 1, 1,
-0.309555, -0.5299671, -1.432426, 1, 1, 1, 1, 1,
-0.3052077, 1.099664, -0.3696443, 1, 1, 1, 1, 1,
-0.3048309, 0.3384241, -1.65626, 1, 1, 1, 1, 1,
-0.3044975, 0.68147, -1.404577, 1, 1, 1, 1, 1,
-0.3013597, -0.9778932, -3.087773, 1, 1, 1, 1, 1,
-0.3011563, -1.306722, -1.673308, 1, 1, 1, 1, 1,
-0.2971235, 0.6618046, -0.4019064, 1, 1, 1, 1, 1,
-0.2952076, 0.5018569, 0.2553685, 1, 1, 1, 1, 1,
-0.2747833, -0.2297594, -3.708622, 0, 0, 1, 1, 1,
-0.2667329, -0.8370172, -4.206672, 1, 0, 0, 1, 1,
-0.2605642, 0.02141655, -0.5958998, 1, 0, 0, 1, 1,
-0.2599015, 0.5902114, 0.1052192, 1, 0, 0, 1, 1,
-0.2579819, 0.1400007, -1.693107, 1, 0, 0, 1, 1,
-0.2565759, 0.225794, 0.1765753, 1, 0, 0, 1, 1,
-0.2542144, 0.6453607, -0.8285961, 0, 0, 0, 1, 1,
-0.253942, 0.3198583, -0.699365, 0, 0, 0, 1, 1,
-0.2504978, -0.04367149, -0.3685399, 0, 0, 0, 1, 1,
-0.2480135, 0.3507135, -0.5236046, 0, 0, 0, 1, 1,
-0.2460137, -0.9133583, -3.336804, 0, 0, 0, 1, 1,
-0.2404033, -0.03042734, -1.486763, 0, 0, 0, 1, 1,
-0.2320076, 0.560019, -1.889097, 0, 0, 0, 1, 1,
-0.2312158, 1.232353, 0.01865699, 1, 1, 1, 1, 1,
-0.2286004, -0.4059347, -4.610169, 1, 1, 1, 1, 1,
-0.2257242, 1.602922, 0.8904108, 1, 1, 1, 1, 1,
-0.2245183, 0.7613709, -0.01308731, 1, 1, 1, 1, 1,
-0.2204743, 0.4465148, -1.195241, 1, 1, 1, 1, 1,
-0.2199112, -0.2828895, -4.142934, 1, 1, 1, 1, 1,
-0.2165793, -0.4651304, -1.020501, 1, 1, 1, 1, 1,
-0.2148171, 0.1155061, -0.5136193, 1, 1, 1, 1, 1,
-0.20366, -0.1311414, -1.766516, 1, 1, 1, 1, 1,
-0.2007148, 0.1729875, -0.7183105, 1, 1, 1, 1, 1,
-0.1992028, 0.7544958, -1.786452, 1, 1, 1, 1, 1,
-0.1982441, -0.5974802, -4.540492, 1, 1, 1, 1, 1,
-0.1981506, -0.8644723, -3.933716, 1, 1, 1, 1, 1,
-0.1972731, 0.9894803, -0.4202196, 1, 1, 1, 1, 1,
-0.1956088, -1.146351, -4.143215, 1, 1, 1, 1, 1,
-0.1951287, -0.2887655, -2.48358, 0, 0, 1, 1, 1,
-0.1895002, 0.8245919, 0.1530499, 1, 0, 0, 1, 1,
-0.1839612, 0.5141966, 0.7492296, 1, 0, 0, 1, 1,
-0.1835605, 0.3206771, -0.6392452, 1, 0, 0, 1, 1,
-0.1826536, -0.04112804, -0.9405789, 1, 0, 0, 1, 1,
-0.1809365, -1.183232, -2.011369, 1, 0, 0, 1, 1,
-0.1806557, -0.5145229, -2.068932, 0, 0, 0, 1, 1,
-0.1776911, -0.8838713, -1.192238, 0, 0, 0, 1, 1,
-0.1712464, -2.353328, -3.171041, 0, 0, 0, 1, 1,
-0.1685904, 0.5406423, -0.7282686, 0, 0, 0, 1, 1,
-0.1678064, -1.055534, -5.734755, 0, 0, 0, 1, 1,
-0.1673364, 0.1690175, 0.241431, 0, 0, 0, 1, 1,
-0.1659843, 0.3590371, -0.003111762, 0, 0, 0, 1, 1,
-0.1642184, 0.1631488, -0.8175858, 1, 1, 1, 1, 1,
-0.1625175, 1.101762, -2.46875, 1, 1, 1, 1, 1,
-0.1624711, -0.08307381, -2.477173, 1, 1, 1, 1, 1,
-0.1610939, 1.731484, -1.677066, 1, 1, 1, 1, 1,
-0.1515783, 0.4189987, 0.04506693, 1, 1, 1, 1, 1,
-0.1460278, 0.314258, 0.1611657, 1, 1, 1, 1, 1,
-0.1423636, -0.7417908, -4.982785, 1, 1, 1, 1, 1,
-0.1405888, -0.3321223, -2.564452, 1, 1, 1, 1, 1,
-0.140514, 0.4575984, -0.3942923, 1, 1, 1, 1, 1,
-0.1355334, 0.7347981, 1.4856, 1, 1, 1, 1, 1,
-0.127778, 0.4474375, 0.9121781, 1, 1, 1, 1, 1,
-0.1263015, 1.022947, -0.3124974, 1, 1, 1, 1, 1,
-0.1204686, -0.6751544, -4.442582, 1, 1, 1, 1, 1,
-0.1186546, -0.04806215, -1.493672, 1, 1, 1, 1, 1,
-0.11636, 0.3019039, -0.6073443, 1, 1, 1, 1, 1,
-0.1161867, 0.5038787, -0.04868573, 0, 0, 1, 1, 1,
-0.1140342, 1.369592, 1.741242, 1, 0, 0, 1, 1,
-0.1129195, 0.4179457, 0.2064545, 1, 0, 0, 1, 1,
-0.11112, 0.04429719, -1.654097, 1, 0, 0, 1, 1,
-0.109672, -0.735836, -5.260661, 1, 0, 0, 1, 1,
-0.1090511, 0.9228701, 0.6195375, 1, 0, 0, 1, 1,
-0.1055862, -2.566879, -5.681605, 0, 0, 0, 1, 1,
-0.09661106, -0.6095947, -3.152991, 0, 0, 0, 1, 1,
-0.0944723, 0.2215438, 1.789777, 0, 0, 0, 1, 1,
-0.08931481, -0.3657687, -3.833923, 0, 0, 0, 1, 1,
-0.08566987, 1.219137, 0.7163507, 0, 0, 0, 1, 1,
-0.08307566, 0.4344985, 0.6722097, 0, 0, 0, 1, 1,
-0.0826562, 1.431325, 0.2579986, 0, 0, 0, 1, 1,
-0.08246823, -1.207263, -2.812003, 1, 1, 1, 1, 1,
-0.0807587, 0.4046969, -1.507719, 1, 1, 1, 1, 1,
-0.07728149, -0.9348094, -4.089785, 1, 1, 1, 1, 1,
-0.07612899, 1.231394, 0.1010055, 1, 1, 1, 1, 1,
-0.07284795, 0.9555012, 1.338296, 1, 1, 1, 1, 1,
-0.07073424, 2.158937, -1.02607, 1, 1, 1, 1, 1,
-0.06383699, -1.07868, -4.019173, 1, 1, 1, 1, 1,
-0.06326559, 0.4315283, -0.8000829, 1, 1, 1, 1, 1,
-0.06146003, -0.5155096, -1.096001, 1, 1, 1, 1, 1,
-0.05735244, 0.1274543, -1.419431, 1, 1, 1, 1, 1,
-0.05663517, 0.387177, 0.1097838, 1, 1, 1, 1, 1,
-0.05501065, -1.691192, -3.19456, 1, 1, 1, 1, 1,
-0.04828393, 1.016577, -1.786546, 1, 1, 1, 1, 1,
-0.04168953, -1.113065, -2.777323, 1, 1, 1, 1, 1,
-0.03984792, -0.7766879, -2.203515, 1, 1, 1, 1, 1,
-0.03829748, -1.810886, -4.392718, 0, 0, 1, 1, 1,
-0.03762281, 0.6716487, -1.591226, 1, 0, 0, 1, 1,
-0.03674158, 0.9811277, 0.1396567, 1, 0, 0, 1, 1,
-0.03563475, 1.001727, -0.999962, 1, 0, 0, 1, 1,
-0.02970793, 0.7962911, -2.003541, 1, 0, 0, 1, 1,
-0.02951689, -0.6720734, -3.66137, 1, 0, 0, 1, 1,
-0.02714352, -0.1247206, -2.905684, 0, 0, 0, 1, 1,
-0.02696013, -2.565395, -3.711395, 0, 0, 0, 1, 1,
-0.02500789, 0.2778831, 0.6271183, 0, 0, 0, 1, 1,
-0.02334374, -0.9440661, -3.336758, 0, 0, 0, 1, 1,
-0.01838725, -0.6742754, -4.130451, 0, 0, 0, 1, 1,
-0.01574799, 1.683019, 0.9778878, 0, 0, 0, 1, 1,
-0.0147051, 0.75057, 0.1651903, 0, 0, 0, 1, 1,
-0.01468224, 0.04664142, -0.5954118, 1, 1, 1, 1, 1,
-0.01292486, 0.480577, -0.6263107, 1, 1, 1, 1, 1,
-0.01155761, -1.368213, -1.352799, 1, 1, 1, 1, 1,
-0.01059049, -0.09606215, -3.302192, 1, 1, 1, 1, 1,
-0.006671199, -0.008634781, -3.637543, 1, 1, 1, 1, 1,
-0.001649902, 0.2791887, 0.3109414, 1, 1, 1, 1, 1,
-0.00078965, -0.4263546, -2.974757, 1, 1, 1, 1, 1,
0.008360648, -0.01506017, 1.955193, 1, 1, 1, 1, 1,
0.01205039, -0.9035214, 2.252331, 1, 1, 1, 1, 1,
0.02014173, -0.8144563, 4.899496, 1, 1, 1, 1, 1,
0.02066873, 0.6938109, 0.5008685, 1, 1, 1, 1, 1,
0.02080331, 0.2168338, -0.6442311, 1, 1, 1, 1, 1,
0.02217242, 0.6058671, 1.022876, 1, 1, 1, 1, 1,
0.02406534, -1.106618, 2.456907, 1, 1, 1, 1, 1,
0.02665782, -0.07921907, 3.534924, 1, 1, 1, 1, 1,
0.03280856, 0.2344461, 0.5304516, 0, 0, 1, 1, 1,
0.03476389, 0.2669534, 1.409381, 1, 0, 0, 1, 1,
0.03587203, -0.3735244, 3.18786, 1, 0, 0, 1, 1,
0.03740037, 0.410231, 1.218839, 1, 0, 0, 1, 1,
0.0388414, -0.622737, 3.798133, 1, 0, 0, 1, 1,
0.04415457, 0.2376516, -0.7282932, 1, 0, 0, 1, 1,
0.04521561, 1.621771, 0.2067882, 0, 0, 0, 1, 1,
0.04847711, 1.014513, -1.617272, 0, 0, 0, 1, 1,
0.05165133, -0.03711792, 3.09728, 0, 0, 0, 1, 1,
0.05221635, 0.5888609, 0.8040262, 0, 0, 0, 1, 1,
0.05250819, -0.03322721, 3.354298, 0, 0, 0, 1, 1,
0.05284609, 0.8442481, 1.238836, 0, 0, 0, 1, 1,
0.05307029, -0.7927468, 3.611907, 0, 0, 0, 1, 1,
0.05652973, -0.03124296, 1.316505, 1, 1, 1, 1, 1,
0.05977919, 0.2778391, 0.001103835, 1, 1, 1, 1, 1,
0.0608539, -0.7328082, 2.42424, 1, 1, 1, 1, 1,
0.07001481, 0.2020292, 1.938366, 1, 1, 1, 1, 1,
0.0710986, -1.396169, 4.689763, 1, 1, 1, 1, 1,
0.07645737, 0.4379638, 1.360003, 1, 1, 1, 1, 1,
0.07860452, -1.488345, 1.946623, 1, 1, 1, 1, 1,
0.08086324, 0.928675, 0.7561899, 1, 1, 1, 1, 1,
0.08117127, -1.545845, 2.659213, 1, 1, 1, 1, 1,
0.08192373, -0.451007, 3.398158, 1, 1, 1, 1, 1,
0.08541425, 0.1555796, 0.2132284, 1, 1, 1, 1, 1,
0.08781733, -0.9063457, 1.237792, 1, 1, 1, 1, 1,
0.08944977, -1.242239, 3.668191, 1, 1, 1, 1, 1,
0.08995818, -0.1558772, 3.016549, 1, 1, 1, 1, 1,
0.09036134, -1.598461, 2.81652, 1, 1, 1, 1, 1,
0.09060567, -1.917155, 1.684035, 0, 0, 1, 1, 1,
0.09244751, 0.03835148, 0.03163338, 1, 0, 0, 1, 1,
0.09709004, -0.9051711, 3.09367, 1, 0, 0, 1, 1,
0.09724443, 0.7786422, -0.1043729, 1, 0, 0, 1, 1,
0.09773786, 1.174851, -0.3205337, 1, 0, 0, 1, 1,
0.09834793, 2.153474, 0.4640431, 1, 0, 0, 1, 1,
0.09879074, 0.3878692, -2.052233, 0, 0, 0, 1, 1,
0.09913822, -0.9623882, 3.883416, 0, 0, 0, 1, 1,
0.1022683, 0.02667108, 1.875645, 0, 0, 0, 1, 1,
0.1035064, -0.6914179, 2.822118, 0, 0, 0, 1, 1,
0.1050365, -0.9359105, 1.633954, 0, 0, 0, 1, 1,
0.1059073, -0.08591281, -0.2922693, 0, 0, 0, 1, 1,
0.1099241, -0.4236196, 3.393312, 0, 0, 0, 1, 1,
0.111112, -0.2495113, 3.230505, 1, 1, 1, 1, 1,
0.1130966, -1.241751, 2.407556, 1, 1, 1, 1, 1,
0.116079, 0.4075442, 0.8387476, 1, 1, 1, 1, 1,
0.117523, -0.07666955, 0.6945587, 1, 1, 1, 1, 1,
0.1203507, 0.3718636, 0.2747966, 1, 1, 1, 1, 1,
0.1287192, 1.197098, -0.8907049, 1, 1, 1, 1, 1,
0.1345355, 2.820311, 1.046289, 1, 1, 1, 1, 1,
0.1378459, -0.4437691, 4.69053, 1, 1, 1, 1, 1,
0.1446123, 0.4188647, 1.291235, 1, 1, 1, 1, 1,
0.1527035, -0.6892253, 3.310726, 1, 1, 1, 1, 1,
0.1559202, -0.3731677, 1.819606, 1, 1, 1, 1, 1,
0.1589545, 0.03077126, 2.62699, 1, 1, 1, 1, 1,
0.1593729, -0.1633287, 1.975596, 1, 1, 1, 1, 1,
0.1628573, 2.130846, -0.2841997, 1, 1, 1, 1, 1,
0.1631378, -0.9209951, 2.468456, 1, 1, 1, 1, 1,
0.1640373, 0.07123848, 0.1800143, 0, 0, 1, 1, 1,
0.167168, -0.04958029, 1.453179, 1, 0, 0, 1, 1,
0.1677818, -0.5418898, 3.855692, 1, 0, 0, 1, 1,
0.1693862, 0.5524858, -0.9593813, 1, 0, 0, 1, 1,
0.1724078, -0.6050645, 1.616126, 1, 0, 0, 1, 1,
0.1744471, -0.6409431, 3.345914, 1, 0, 0, 1, 1,
0.1800996, -0.2844481, 2.242546, 0, 0, 0, 1, 1,
0.1805281, 0.3978107, 0.07515461, 0, 0, 0, 1, 1,
0.1808638, -0.5122848, 1.744955, 0, 0, 0, 1, 1,
0.1821008, -0.2321395, 1.925407, 0, 0, 0, 1, 1,
0.1847147, 0.1733889, 1.517361, 0, 0, 0, 1, 1,
0.1908165, -0.7499143, 2.691279, 0, 0, 0, 1, 1,
0.1925582, 1.500105, 1.500424, 0, 0, 0, 1, 1,
0.1930868, 0.2823969, -0.03900527, 1, 1, 1, 1, 1,
0.1958916, 0.4565445, -0.3245926, 1, 1, 1, 1, 1,
0.199084, -1.651052, 3.199097, 1, 1, 1, 1, 1,
0.2002916, -1.063298, 1.029279, 1, 1, 1, 1, 1,
0.2011067, 0.1580768, 1.918073, 1, 1, 1, 1, 1,
0.2027426, -0.6328628, 1.853413, 1, 1, 1, 1, 1,
0.2050104, -1.558314, 3.997788, 1, 1, 1, 1, 1,
0.2114979, -0.3082282, 2.641517, 1, 1, 1, 1, 1,
0.2122569, -0.893944, 4.035213, 1, 1, 1, 1, 1,
0.2181492, 0.232403, -0.4520904, 1, 1, 1, 1, 1,
0.2195477, 0.1282353, 1.370412, 1, 1, 1, 1, 1,
0.2224072, -1.134606, 2.985285, 1, 1, 1, 1, 1,
0.225778, 0.2540576, 1.663659, 1, 1, 1, 1, 1,
0.2316574, -0.9815149, 1.946237, 1, 1, 1, 1, 1,
0.234924, -0.1134222, 1.422258, 1, 1, 1, 1, 1,
0.2374623, -0.1368467, 2.922849, 0, 0, 1, 1, 1,
0.2440452, -1.200621, 3.572457, 1, 0, 0, 1, 1,
0.2441845, 2.314399, -0.09282972, 1, 0, 0, 1, 1,
0.2487589, -0.0167325, 2.459113, 1, 0, 0, 1, 1,
0.2544541, 1.572002, 1.188689, 1, 0, 0, 1, 1,
0.2550786, 1.267726, -0.01225964, 1, 0, 0, 1, 1,
0.2568854, 0.2531147, 3.902547, 0, 0, 0, 1, 1,
0.2650297, -1.22405, 3.840333, 0, 0, 0, 1, 1,
0.2692119, 2.17205, -1.476143, 0, 0, 0, 1, 1,
0.2753353, 1.577142, 1.726714, 0, 0, 0, 1, 1,
0.2757075, -1.439828, 2.248778, 0, 0, 0, 1, 1,
0.2792851, 1.13584, -0.1354951, 0, 0, 0, 1, 1,
0.2864105, -0.007721173, 1.141891, 0, 0, 0, 1, 1,
0.2907475, -0.7318735, 2.623052, 1, 1, 1, 1, 1,
0.2916561, 0.7332317, 0.1588303, 1, 1, 1, 1, 1,
0.2928313, 0.7271139, -0.1620845, 1, 1, 1, 1, 1,
0.2966172, -0.5972053, 1.167565, 1, 1, 1, 1, 1,
0.3006232, 0.2130061, 0.5152783, 1, 1, 1, 1, 1,
0.3041132, 0.5688372, -0.06881808, 1, 1, 1, 1, 1,
0.3070906, -1.081113, 2.866387, 1, 1, 1, 1, 1,
0.3130727, 2.534308, 0.9876958, 1, 1, 1, 1, 1,
0.3137407, 0.4340739, 0.3296136, 1, 1, 1, 1, 1,
0.3149704, 0.2543576, 0.5460907, 1, 1, 1, 1, 1,
0.3179428, -0.4560445, 2.758983, 1, 1, 1, 1, 1,
0.3204202, 0.6888854, -0.6228321, 1, 1, 1, 1, 1,
0.3222536, 1.001564, -0.01603932, 1, 1, 1, 1, 1,
0.3225418, 0.5560229, -1.082213, 1, 1, 1, 1, 1,
0.3258227, -0.05575002, 2.485966, 1, 1, 1, 1, 1,
0.3265253, -2.032896, 4.094888, 0, 0, 1, 1, 1,
0.327149, 0.107345, 1.0709, 1, 0, 0, 1, 1,
0.3273656, 0.6101999, 0.2247931, 1, 0, 0, 1, 1,
0.3298418, -0.8768004, 3.373822, 1, 0, 0, 1, 1,
0.330562, 2.00335, -1.0944, 1, 0, 0, 1, 1,
0.3315451, -0.8926304, 3.171937, 1, 0, 0, 1, 1,
0.3316486, -0.3386086, 2.639972, 0, 0, 0, 1, 1,
0.3339964, 1.033446, 1.452307, 0, 0, 0, 1, 1,
0.3470939, -0.4830019, 1.979829, 0, 0, 0, 1, 1,
0.3540518, -0.8784119, 3.627744, 0, 0, 0, 1, 1,
0.3576647, -0.6455252, 3.808707, 0, 0, 0, 1, 1,
0.3579142, -0.01605693, 0.7719367, 0, 0, 0, 1, 1,
0.3625791, -0.2494254, 2.013184, 0, 0, 0, 1, 1,
0.3643862, -0.3058757, 3.978181, 1, 1, 1, 1, 1,
0.3668398, -0.7524868, 3.357828, 1, 1, 1, 1, 1,
0.3775868, 1.220188, 1.145983, 1, 1, 1, 1, 1,
0.3783611, -1.288324, 0.4550228, 1, 1, 1, 1, 1,
0.3787068, 0.278201, 1.486445, 1, 1, 1, 1, 1,
0.3798954, -0.8405361, 3.27861, 1, 1, 1, 1, 1,
0.3845157, 0.1542051, -0.4161302, 1, 1, 1, 1, 1,
0.38759, -0.4761527, 1.193614, 1, 1, 1, 1, 1,
0.3883678, 2.661644, 1.236576, 1, 1, 1, 1, 1,
0.3937576, 0.6892604, -0.8082057, 1, 1, 1, 1, 1,
0.3954173, -0.5426776, 4.828644, 1, 1, 1, 1, 1,
0.3959753, 0.8955965, -0.5728306, 1, 1, 1, 1, 1,
0.4022436, 0.327957, -0.1280284, 1, 1, 1, 1, 1,
0.4036745, -0.1810193, 1.575266, 1, 1, 1, 1, 1,
0.4064139, 1.667957, -1.141658, 1, 1, 1, 1, 1,
0.4090585, -0.5216187, 3.504148, 0, 0, 1, 1, 1,
0.4167828, 0.07050879, 1.185034, 1, 0, 0, 1, 1,
0.417542, 0.08948378, 2.170539, 1, 0, 0, 1, 1,
0.4176611, -1.206041, 2.345093, 1, 0, 0, 1, 1,
0.4250719, 1.051524, -1.687518, 1, 0, 0, 1, 1,
0.4266744, -0.8570597, 2.620502, 1, 0, 0, 1, 1,
0.429139, 0.02169718, 2.609442, 0, 0, 0, 1, 1,
0.4311016, -0.8799295, 3.697324, 0, 0, 0, 1, 1,
0.4349332, -2.333637, 3.405413, 0, 0, 0, 1, 1,
0.4349485, -0.07406442, 1.52774, 0, 0, 0, 1, 1,
0.4390913, -0.6596281, 1.429064, 0, 0, 0, 1, 1,
0.4412791, 0.692651, 1.168742, 0, 0, 0, 1, 1,
0.4544714, 1.992302, 0.5841379, 0, 0, 0, 1, 1,
0.4612902, 0.6307781, 0.3821319, 1, 1, 1, 1, 1,
0.4646538, -0.2666882, -0.4047763, 1, 1, 1, 1, 1,
0.4663582, -1.022462, 3.321864, 1, 1, 1, 1, 1,
0.4670923, 1.196733, 0.6258528, 1, 1, 1, 1, 1,
0.4746252, 0.3600886, 0.2035203, 1, 1, 1, 1, 1,
0.475182, 1.446975, 0.6325671, 1, 1, 1, 1, 1,
0.4759372, -0.6853223, 1.454161, 1, 1, 1, 1, 1,
0.4775359, 1.329639, 0.3069549, 1, 1, 1, 1, 1,
0.4797882, -0.2432822, -0.01941309, 1, 1, 1, 1, 1,
0.4802907, 1.626168, -0.2464343, 1, 1, 1, 1, 1,
0.4827624, -1.179341, 1.833544, 1, 1, 1, 1, 1,
0.4856946, 1.150629, -0.1389482, 1, 1, 1, 1, 1,
0.4898041, -0.3188043, 2.585779, 1, 1, 1, 1, 1,
0.4929471, 0.2387913, 2.43054, 1, 1, 1, 1, 1,
0.4936348, -0.8866786, 2.718267, 1, 1, 1, 1, 1,
0.4947636, -0.3235763, 2.934305, 0, 0, 1, 1, 1,
0.4986701, 0.3366624, 2.596126, 1, 0, 0, 1, 1,
0.4987149, -1.133521, 2.810653, 1, 0, 0, 1, 1,
0.5010067, 0.8319929, 1.68921, 1, 0, 0, 1, 1,
0.5014376, -0.02844493, 1.20434, 1, 0, 0, 1, 1,
0.5019574, 1.056421, 0.4534421, 1, 0, 0, 1, 1,
0.5045962, 0.2509434, 1.838979, 0, 0, 0, 1, 1,
0.5103133, 1.528402, -0.510677, 0, 0, 0, 1, 1,
0.5118589, 0.4707664, 1.696579, 0, 0, 0, 1, 1,
0.5160783, -1.148379, 2.403618, 0, 0, 0, 1, 1,
0.5164125, -0.3866402, 2.674654, 0, 0, 0, 1, 1,
0.5169619, 0.3507184, 2.124058, 0, 0, 0, 1, 1,
0.5183973, -1.287889, 3.444987, 0, 0, 0, 1, 1,
0.5202353, -0.107722, 1.37522, 1, 1, 1, 1, 1,
0.5206516, 0.05105731, 1.620581, 1, 1, 1, 1, 1,
0.5208395, -0.9887901, 0.8311625, 1, 1, 1, 1, 1,
0.5221487, -0.1766634, 2.739112, 1, 1, 1, 1, 1,
0.5238938, -0.7003714, 2.604824, 1, 1, 1, 1, 1,
0.527975, -0.2614203, 3.363345, 1, 1, 1, 1, 1,
0.5290727, 1.10028, 0.9237608, 1, 1, 1, 1, 1,
0.532126, -1.15513, 2.580829, 1, 1, 1, 1, 1,
0.5388106, 0.2034788, -1.130461, 1, 1, 1, 1, 1,
0.5407175, 1.067101, 0.7119306, 1, 1, 1, 1, 1,
0.5476768, -0.9744452, 3.971197, 1, 1, 1, 1, 1,
0.5533102, -0.3054814, 1.268271, 1, 1, 1, 1, 1,
0.5607613, 0.8913109, 0.5759233, 1, 1, 1, 1, 1,
0.5608604, -1.31793, 2.405071, 1, 1, 1, 1, 1,
0.5626494, -0.5821809, 3.53089, 1, 1, 1, 1, 1,
0.569066, -0.5390497, 1.616678, 0, 0, 1, 1, 1,
0.5691177, -0.4048595, 2.431118, 1, 0, 0, 1, 1,
0.5714394, 0.6398293, 1.744411, 1, 0, 0, 1, 1,
0.5787493, -0.41462, 2.639967, 1, 0, 0, 1, 1,
0.5816302, 0.5091609, 2.09547, 1, 0, 0, 1, 1,
0.582247, 0.261891, -0.6914041, 1, 0, 0, 1, 1,
0.5888726, -0.8507522, 2.345028, 0, 0, 0, 1, 1,
0.5913318, -0.4143607, 5.021569, 0, 0, 0, 1, 1,
0.5967229, 0.09919512, -0.1301761, 0, 0, 0, 1, 1,
0.5999772, 0.3791595, -0.4734983, 0, 0, 0, 1, 1,
0.60084, 0.751102, 0.3611576, 0, 0, 0, 1, 1,
0.6016075, -0.01760206, 1.947188, 0, 0, 0, 1, 1,
0.6032438, 1.61339, 0.5632229, 0, 0, 0, 1, 1,
0.6038884, -1.001004, 4.111238, 1, 1, 1, 1, 1,
0.6053498, 1.006634, 0.2189818, 1, 1, 1, 1, 1,
0.6083248, -1.292899, 1.458786, 1, 1, 1, 1, 1,
0.6090868, -0.03371799, 1.164125, 1, 1, 1, 1, 1,
0.6093245, -0.2409718, 0.4803455, 1, 1, 1, 1, 1,
0.6098552, -2.174374, 1.90222, 1, 1, 1, 1, 1,
0.6116356, -0.6151016, 3.100088, 1, 1, 1, 1, 1,
0.6123906, 0.703709, -0.2896611, 1, 1, 1, 1, 1,
0.6132367, -1.723027, 3.821489, 1, 1, 1, 1, 1,
0.6168227, 0.2116055, 0.9041311, 1, 1, 1, 1, 1,
0.6273967, -0.5456593, 2.663509, 1, 1, 1, 1, 1,
0.6276546, 0.8147691, -0.3002947, 1, 1, 1, 1, 1,
0.6299726, -1.950032, 2.910197, 1, 1, 1, 1, 1,
0.6322744, 0.9129898, -1.253495, 1, 1, 1, 1, 1,
0.633144, 0.6575305, 2.867516, 1, 1, 1, 1, 1,
0.6368378, 1.299577, 2.392372, 0, 0, 1, 1, 1,
0.6422068, 1.511528, 1.697602, 1, 0, 0, 1, 1,
0.6480179, 0.2983536, 1.739525, 1, 0, 0, 1, 1,
0.6482545, 1.689468, 0.8849947, 1, 0, 0, 1, 1,
0.6531922, 0.2807012, 1.369425, 1, 0, 0, 1, 1,
0.6537734, 0.8042641, 2.107188, 1, 0, 0, 1, 1,
0.6537918, 1.198668, 0.5309189, 0, 0, 0, 1, 1,
0.654296, 0.4055357, 0.7970677, 0, 0, 0, 1, 1,
0.6575136, -0.7945683, 1.762008, 0, 0, 0, 1, 1,
0.6598024, 0.4965603, 2.036629, 0, 0, 0, 1, 1,
0.6598185, -0.4118781, 1.306146, 0, 0, 0, 1, 1,
0.6616478, -0.8168076, 2.812937, 0, 0, 0, 1, 1,
0.6627415, 0.4057274, 1.781874, 0, 0, 0, 1, 1,
0.6653885, 0.4353448, 1.751456, 1, 1, 1, 1, 1,
0.6726514, -0.001838263, 0.4505518, 1, 1, 1, 1, 1,
0.6745532, 0.1408584, 0.3823111, 1, 1, 1, 1, 1,
0.6764264, 0.3717017, 0.3566158, 1, 1, 1, 1, 1,
0.6833026, 0.3667868, 1.719308, 1, 1, 1, 1, 1,
0.6894493, -1.065518, 3.310572, 1, 1, 1, 1, 1,
0.6897297, 0.7783936, 0.01371467, 1, 1, 1, 1, 1,
0.6934711, -0.1005736, -0.8354815, 1, 1, 1, 1, 1,
0.7008414, 1.426358, -0.8250034, 1, 1, 1, 1, 1,
0.7036057, 0.2331002, 3.047881, 1, 1, 1, 1, 1,
0.7088273, -1.235825, 2.143188, 1, 1, 1, 1, 1,
0.71254, 1.16298, -0.5825917, 1, 1, 1, 1, 1,
0.7174336, 0.1335889, 0.5340036, 1, 1, 1, 1, 1,
0.7202033, -0.7016705, 2.293313, 1, 1, 1, 1, 1,
0.7238455, 0.7744898, 1.332412, 1, 1, 1, 1, 1,
0.724254, -1.487747, 3.645888, 0, 0, 1, 1, 1,
0.7254623, -1.616962, 3.452737, 1, 0, 0, 1, 1,
0.7270868, 1.228155, 0.2700688, 1, 0, 0, 1, 1,
0.7306044, 0.02654692, 0.4991423, 1, 0, 0, 1, 1,
0.7346686, -0.4644472, 4.023141, 1, 0, 0, 1, 1,
0.7523111, 1.89159, 0.2298993, 1, 0, 0, 1, 1,
0.7523482, 0.01427176, 2.10757, 0, 0, 0, 1, 1,
0.7524462, -1.77465, 2.879156, 0, 0, 0, 1, 1,
0.7601813, 0.519324, 1.098611, 0, 0, 0, 1, 1,
0.7632295, -1.517923, 2.323854, 0, 0, 0, 1, 1,
0.7674881, 1.411534, 2.503508, 0, 0, 0, 1, 1,
0.7716183, -1.175259, 1.607602, 0, 0, 0, 1, 1,
0.7762474, 0.3959047, 0.7829807, 0, 0, 0, 1, 1,
0.7895067, 1.345548, 1.645635, 1, 1, 1, 1, 1,
0.7949002, 0.7980877, 1.518864, 1, 1, 1, 1, 1,
0.7980027, 1.245855, 0.1531089, 1, 1, 1, 1, 1,
0.8035789, -0.9362468, 3.315733, 1, 1, 1, 1, 1,
0.807044, -1.621056, 3.736859, 1, 1, 1, 1, 1,
0.8087025, 0.2333064, 1.094702, 1, 1, 1, 1, 1,
0.8177527, -0.01507814, 1.677194, 1, 1, 1, 1, 1,
0.8201722, 1.335023, 0.5071036, 1, 1, 1, 1, 1,
0.8264214, 0.07454627, 2.781117, 1, 1, 1, 1, 1,
0.8288832, -0.1164492, 0.760337, 1, 1, 1, 1, 1,
0.8330787, 0.1570717, 1.110273, 1, 1, 1, 1, 1,
0.8390675, 0.7825298, 1.41476, 1, 1, 1, 1, 1,
0.840764, -0.5930576, 2.305457, 1, 1, 1, 1, 1,
0.8465911, 0.851238, 0.4802547, 1, 1, 1, 1, 1,
0.8466667, -1.119181, 2.264416, 1, 1, 1, 1, 1,
0.8513911, -0.3981237, 3.233547, 0, 0, 1, 1, 1,
0.8534377, 1.027283, -0.7739413, 1, 0, 0, 1, 1,
0.8584363, 0.3823808, 1.787521, 1, 0, 0, 1, 1,
0.8685967, 0.9676574, 1.136162, 1, 0, 0, 1, 1,
0.8759815, 0.2832686, 1.743911, 1, 0, 0, 1, 1,
0.8782755, -0.7531574, 2.575748, 1, 0, 0, 1, 1,
0.8807434, -0.8402332, 5.814187, 0, 0, 0, 1, 1,
0.8807955, 0.3697906, 3.736413, 0, 0, 0, 1, 1,
0.8864882, -1.458926, 1.934946, 0, 0, 0, 1, 1,
0.8872367, -0.4383062, 1.234021, 0, 0, 0, 1, 1,
0.8894816, 0.09530284, 1.323153, 0, 0, 0, 1, 1,
0.8896654, -1.23905, 2.469494, 0, 0, 0, 1, 1,
0.8916009, 0.6202008, 0.08675992, 0, 0, 0, 1, 1,
0.8959991, -0.7960014, 3.496429, 1, 1, 1, 1, 1,
0.896534, 1.575559, -0.7177776, 1, 1, 1, 1, 1,
0.8970156, 0.1264506, 0.676425, 1, 1, 1, 1, 1,
0.8994381, -0.7105607, 4.248407, 1, 1, 1, 1, 1,
0.9000111, -1.145703, 1.70553, 1, 1, 1, 1, 1,
0.9016429, 2.059944, -0.1026801, 1, 1, 1, 1, 1,
0.9084686, -0.8947539, 2.548187, 1, 1, 1, 1, 1,
0.9087865, 0.8706982, 1.13926, 1, 1, 1, 1, 1,
0.9098635, -0.3740518, 2.302592, 1, 1, 1, 1, 1,
0.9193558, -0.7593268, 2.72737, 1, 1, 1, 1, 1,
0.9253824, -0.05944033, 1.88134, 1, 1, 1, 1, 1,
0.9261247, -0.3559127, 2.145093, 1, 1, 1, 1, 1,
0.9389787, -1.02299, 3.368536, 1, 1, 1, 1, 1,
0.9403907, 0.2000106, 1.786193, 1, 1, 1, 1, 1,
0.9473247, 2.531886, -0.5186163, 1, 1, 1, 1, 1,
0.9523975, 0.3854485, 0.671283, 0, 0, 1, 1, 1,
0.9540172, -0.630802, 3.071241, 1, 0, 0, 1, 1,
0.957337, 1.623047, -0.09836636, 1, 0, 0, 1, 1,
0.9576837, -0.1575672, 1.758527, 1, 0, 0, 1, 1,
0.9759532, 0.08938889, 1.234099, 1, 0, 0, 1, 1,
0.9763887, -0.8709192, 3.064551, 1, 0, 0, 1, 1,
0.9797915, -0.9978023, 3.038937, 0, 0, 0, 1, 1,
0.9813663, -0.755109, 2.768424, 0, 0, 0, 1, 1,
0.9889695, -1.277434, 3.23088, 0, 0, 0, 1, 1,
0.9909762, 0.6134781, 0.5151466, 0, 0, 0, 1, 1,
0.9960645, 0.1748025, 1.427387, 0, 0, 0, 1, 1,
0.9987749, 1.386404, 1.00427, 0, 0, 0, 1, 1,
0.9999855, -0.1897729, 0.9936521, 0, 0, 0, 1, 1,
1.00113, 0.1463531, 1.000662, 1, 1, 1, 1, 1,
1.001319, -0.7223001, 1.470503, 1, 1, 1, 1, 1,
1.001501, -0.8308604, 1.091146, 1, 1, 1, 1, 1,
1.011833, 2.444259, 2.149695, 1, 1, 1, 1, 1,
1.014411, -0.9784626, 1.330621, 1, 1, 1, 1, 1,
1.01645, -0.5783932, 1.696696, 1, 1, 1, 1, 1,
1.016483, 0.6366806, 1.775955, 1, 1, 1, 1, 1,
1.018324, 0.6258206, 4.451741, 1, 1, 1, 1, 1,
1.021119, 0.3204841, 1.950237, 1, 1, 1, 1, 1,
1.023836, -0.8565964, 2.508914, 1, 1, 1, 1, 1,
1.024798, -1.18441, 2.9309, 1, 1, 1, 1, 1,
1.027739, 0.5464359, 1.148574, 1, 1, 1, 1, 1,
1.033506, -1.280447, 1.447531, 1, 1, 1, 1, 1,
1.036602, -0.7950332, 1.47333, 1, 1, 1, 1, 1,
1.038778, 0.1967346, 0.7152169, 1, 1, 1, 1, 1,
1.045871, -0.5889207, 1.012507, 0, 0, 1, 1, 1,
1.050169, 0.5136225, -0.3864311, 1, 0, 0, 1, 1,
1.050203, 0.3683006, 1.061398, 1, 0, 0, 1, 1,
1.052482, 0.04302586, 0.5244012, 1, 0, 0, 1, 1,
1.055333, -0.7730473, 2.605877, 1, 0, 0, 1, 1,
1.059624, -0.1593879, 1.00607, 1, 0, 0, 1, 1,
1.061422, -0.8252114, 2.724344, 0, 0, 0, 1, 1,
1.064251, -0.7141895, 1.780963, 0, 0, 0, 1, 1,
1.07339, 0.1817155, 3.058975, 0, 0, 0, 1, 1,
1.076772, -0.9723018, 3.866216, 0, 0, 0, 1, 1,
1.084759, 0.800402, -0.2438734, 0, 0, 0, 1, 1,
1.085141, 1.128493, 1.69565, 0, 0, 0, 1, 1,
1.085321, -0.6302536, 2.901411, 0, 0, 0, 1, 1,
1.097666, 1.319435, 0.6570519, 1, 1, 1, 1, 1,
1.098193, -0.1781038, 1.289483, 1, 1, 1, 1, 1,
1.099684, 1.259981, 0.423211, 1, 1, 1, 1, 1,
1.100874, -0.3456881, 1.83806, 1, 1, 1, 1, 1,
1.103367, -0.02597909, 1.774782, 1, 1, 1, 1, 1,
1.106318, -0.502521, 2.044772, 1, 1, 1, 1, 1,
1.111087, -0.1517228, 1.821744, 1, 1, 1, 1, 1,
1.113156, 0.3149291, 2.967644, 1, 1, 1, 1, 1,
1.123572, -0.3692354, 1.927171, 1, 1, 1, 1, 1,
1.124935, -1.298687, 3.9181, 1, 1, 1, 1, 1,
1.135601, 0.03598784, 1.382316, 1, 1, 1, 1, 1,
1.136433, -0.6025571, 2.321766, 1, 1, 1, 1, 1,
1.138583, 0.4928168, 1.458882, 1, 1, 1, 1, 1,
1.151718, -0.36308, 1.447435, 1, 1, 1, 1, 1,
1.152972, 0.2884475, 2.682351, 1, 1, 1, 1, 1,
1.159663, 1.509976, 0.6542541, 0, 0, 1, 1, 1,
1.161627, -0.110203, -1.609628, 1, 0, 0, 1, 1,
1.161645, -0.2181981, 1.440076, 1, 0, 0, 1, 1,
1.162896, 0.1692687, 1.885722, 1, 0, 0, 1, 1,
1.170793, -0.1448329, 1.918857, 1, 0, 0, 1, 1,
1.174022, -0.6813752, 2.51412, 1, 0, 0, 1, 1,
1.179667, 0.4392191, 0.4121332, 0, 0, 0, 1, 1,
1.182554, 1.282161, 0.06575921, 0, 0, 0, 1, 1,
1.18469, 0.9716333, 1.713361, 0, 0, 0, 1, 1,
1.191062, 1.039111, -0.3083974, 0, 0, 0, 1, 1,
1.200569, 0.4213677, 0.009890439, 0, 0, 0, 1, 1,
1.207085, -1.231121, 3.078351, 0, 0, 0, 1, 1,
1.208163, 0.7700555, 1.976402, 0, 0, 0, 1, 1,
1.208985, 0.4087071, 1.205402, 1, 1, 1, 1, 1,
1.217873, -0.9607807, 1.034939, 1, 1, 1, 1, 1,
1.222176, -0.8093326, 0.6919544, 1, 1, 1, 1, 1,
1.223033, -1.902139, 1.682554, 1, 1, 1, 1, 1,
1.223052, 0.8980355, 1.764599, 1, 1, 1, 1, 1,
1.235159, 0.2267763, -0.018033, 1, 1, 1, 1, 1,
1.235613, -0.1200476, 2.596355, 1, 1, 1, 1, 1,
1.24074, 0.9412336, -0.5236246, 1, 1, 1, 1, 1,
1.24431, 0.1338201, 1.42754, 1, 1, 1, 1, 1,
1.251399, -1.683611, 1.90307, 1, 1, 1, 1, 1,
1.259795, -0.9385489, 3.853907, 1, 1, 1, 1, 1,
1.263565, 0.2797987, 0.9927306, 1, 1, 1, 1, 1,
1.276961, 1.790924, 0.7051089, 1, 1, 1, 1, 1,
1.294414, -0.173126, 2.411077, 1, 1, 1, 1, 1,
1.300701, -0.3401351, 1.811423, 1, 1, 1, 1, 1,
1.307204, -1.135504, 1.56506, 0, 0, 1, 1, 1,
1.310945, 1.19378, -0.3349066, 1, 0, 0, 1, 1,
1.316214, 0.2132717, 0.1905342, 1, 0, 0, 1, 1,
1.317183, -1.36946, 2.838763, 1, 0, 0, 1, 1,
1.321092, 0.9186863, 1.430354, 1, 0, 0, 1, 1,
1.325522, -0.861389, 0.6224337, 1, 0, 0, 1, 1,
1.328712, -0.5620127, 2.267473, 0, 0, 0, 1, 1,
1.32937, 0.1510746, 0.01402027, 0, 0, 0, 1, 1,
1.332656, 0.4577617, -0.0610477, 0, 0, 0, 1, 1,
1.346058, -0.7695998, 2.677407, 0, 0, 0, 1, 1,
1.347845, 0.7701187, 0.5800828, 0, 0, 0, 1, 1,
1.35011, -0.1509291, 1.355972, 0, 0, 0, 1, 1,
1.355416, -1.809845, 4.060296, 0, 0, 0, 1, 1,
1.361437, 1.023804, 2.159238, 1, 1, 1, 1, 1,
1.367045, -1.739767, 3.640557, 1, 1, 1, 1, 1,
1.367585, 1.382713, 0.6517649, 1, 1, 1, 1, 1,
1.369863, 0.5871999, 2.088245, 1, 1, 1, 1, 1,
1.372471, -0.7633774, 3.048265, 1, 1, 1, 1, 1,
1.378359, -0.5389358, 1.181164, 1, 1, 1, 1, 1,
1.388394, 0.8466043, 1.872727, 1, 1, 1, 1, 1,
1.394257, -0.5322596, 2.79288, 1, 1, 1, 1, 1,
1.395179, 0.1652437, 0.2354545, 1, 1, 1, 1, 1,
1.397437, -0.072795, 2.12377, 1, 1, 1, 1, 1,
1.397977, 0.84817, 2.731723, 1, 1, 1, 1, 1,
1.402946, -1.024644, 3.061663, 1, 1, 1, 1, 1,
1.403722, 1.436689, 1.38187, 1, 1, 1, 1, 1,
1.410086, -1.165557, 4.586788, 1, 1, 1, 1, 1,
1.411218, 1.208253, 1.961006, 1, 1, 1, 1, 1,
1.423045, 1.633902, 1.69204, 0, 0, 1, 1, 1,
1.425913, -1.362948, 0.9088718, 1, 0, 0, 1, 1,
1.427666, -2.838631, 5.46886, 1, 0, 0, 1, 1,
1.428804, 1.267123, 1.644164, 1, 0, 0, 1, 1,
1.432978, 0.0423067, 1.732067, 1, 0, 0, 1, 1,
1.443316, 1.456421, -0.03499317, 1, 0, 0, 1, 1,
1.465688, -0.3631372, 1.382634, 0, 0, 0, 1, 1,
1.483859, 0.5151646, 1.154834, 0, 0, 0, 1, 1,
1.503583, -0.5821542, 0.6602786, 0, 0, 0, 1, 1,
1.513941, 0.7941734, 0.3355282, 0, 0, 0, 1, 1,
1.518655, -0.3528171, 3.653416, 0, 0, 0, 1, 1,
1.534675, -1.051902, 1.623675, 0, 0, 0, 1, 1,
1.539554, 0.06154741, 0.3478116, 0, 0, 0, 1, 1,
1.555022, -1.010312, 1.927718, 1, 1, 1, 1, 1,
1.559119, 0.3811277, 0.06055145, 1, 1, 1, 1, 1,
1.580055, 2.125566, -1.861771, 1, 1, 1, 1, 1,
1.5919, 1.429325, -0.1859452, 1, 1, 1, 1, 1,
1.598387, 0.8194832, 0.183643, 1, 1, 1, 1, 1,
1.615808, -0.5111094, 2.482394, 1, 1, 1, 1, 1,
1.616972, 0.0823532, 1.956563, 1, 1, 1, 1, 1,
1.626963, 0.1883509, -0.4393215, 1, 1, 1, 1, 1,
1.642786, 0.2211888, 1.147429, 1, 1, 1, 1, 1,
1.663771, 0.3260541, 1.649168, 1, 1, 1, 1, 1,
1.670317, 0.5138503, 1.675115, 1, 1, 1, 1, 1,
1.675347, -0.09310681, 1.885702, 1, 1, 1, 1, 1,
1.686031, 0.1107, 1.331712, 1, 1, 1, 1, 1,
1.687575, 0.2337901, 1.288682, 1, 1, 1, 1, 1,
1.690141, -1.755309, 1.50483, 1, 1, 1, 1, 1,
1.70667, -1.610301, 1.513124, 0, 0, 1, 1, 1,
1.70816, -0.2240834, 2.217412, 1, 0, 0, 1, 1,
1.732072, 0.6146708, 1.350379, 1, 0, 0, 1, 1,
1.735242, 0.4578869, 0.8887882, 1, 0, 0, 1, 1,
1.736168, 0.05066196, -0.4195743, 1, 0, 0, 1, 1,
1.742596, -0.5088404, 1.71965, 1, 0, 0, 1, 1,
1.753509, -0.2778288, 1.301206, 0, 0, 0, 1, 1,
1.774948, -0.2707593, 3.28827, 0, 0, 0, 1, 1,
1.78266, 0.9576067, 1.384344, 0, 0, 0, 1, 1,
1.7838, -0.6393801, 3.022328, 0, 0, 0, 1, 1,
1.785503, 1.549592, -0.6354082, 0, 0, 0, 1, 1,
1.804017, -0.2777178, 2.172086, 0, 0, 0, 1, 1,
1.804278, 1.184431, 1.501585, 0, 0, 0, 1, 1,
1.825733, -0.07962453, 1.097879, 1, 1, 1, 1, 1,
1.854684, 0.516427, 3.197169, 1, 1, 1, 1, 1,
1.866733, 0.4447419, 1.289241, 1, 1, 1, 1, 1,
1.882406, -1.878619, 2.826572, 1, 1, 1, 1, 1,
1.882828, -1.407036, 3.29296, 1, 1, 1, 1, 1,
1.886178, -0.3354135, 0.8249851, 1, 1, 1, 1, 1,
1.903549, 1.519369, 2.540064, 1, 1, 1, 1, 1,
1.91673, 0.5788317, 1.368045, 1, 1, 1, 1, 1,
1.97818, 0.255567, -0.3621043, 1, 1, 1, 1, 1,
1.995577, -0.275673, 3.340507, 1, 1, 1, 1, 1,
2.014297, 0.9504948, 2.881591, 1, 1, 1, 1, 1,
2.022122, -1.10788, 1.248271, 1, 1, 1, 1, 1,
2.026461, 1.306347, 2.045727, 1, 1, 1, 1, 1,
2.028349, 0.7289572, 0.3954892, 1, 1, 1, 1, 1,
2.03447, 2.600025, 0.4853082, 1, 1, 1, 1, 1,
2.035461, 0.9829595, 0.7926457, 0, 0, 1, 1, 1,
2.039005, -1.894835, 2.320848, 1, 0, 0, 1, 1,
2.060507, -0.08391194, 1.503277, 1, 0, 0, 1, 1,
2.075632, 0.5057499, 1.206163, 1, 0, 0, 1, 1,
2.093613, -0.3603258, 3.68767, 1, 0, 0, 1, 1,
2.113657, 0.2277654, 1.877247, 1, 0, 0, 1, 1,
2.138969, -0.2107482, 2.473281, 0, 0, 0, 1, 1,
2.172395, 1.046872, 1.360087, 0, 0, 0, 1, 1,
2.183792, 0.0173442, 2.119957, 0, 0, 0, 1, 1,
2.225625, 0.6477291, -0.0428801, 0, 0, 0, 1, 1,
2.247558, -0.04250701, 3.343877, 0, 0, 0, 1, 1,
2.291274, -0.7817824, 2.384894, 0, 0, 0, 1, 1,
2.315822, 0.475264, 1.349901, 0, 0, 0, 1, 1,
2.315884, 0.4192676, 2.000479, 1, 1, 1, 1, 1,
2.35435, -1.118551, 2.752876, 1, 1, 1, 1, 1,
2.371456, -0.5487459, 2.160926, 1, 1, 1, 1, 1,
2.689429, -1.450455, 1.454017, 1, 1, 1, 1, 1,
2.716032, 0.9827015, 1.083698, 1, 1, 1, 1, 1,
2.83776, -0.165082, 0.8299771, 1, 1, 1, 1, 1,
3.080884, -0.4039451, 1.911289, 1, 1, 1, 1, 1
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
var radius = 9.91748;
var distance = 34.83473;
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
mvMatrix.translate( 0.4719164, 0.00916028, -0.03971601 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.83473);
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
