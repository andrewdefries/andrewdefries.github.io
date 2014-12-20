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
-3.572385, -0.2134759, -1.732649, 1, 0, 0, 1,
-3.006332, 1.191186, -0.9420561, 1, 0.007843138, 0, 1,
-2.624593, -1.655596, -3.387496, 1, 0.01176471, 0, 1,
-2.591744, -0.3768747, -0.7754642, 1, 0.01960784, 0, 1,
-2.516427, 0.07476982, 0.9155619, 1, 0.02352941, 0, 1,
-2.29681, -0.9163322, -2.453722, 1, 0.03137255, 0, 1,
-2.280942, -0.3778616, -2.167397, 1, 0.03529412, 0, 1,
-2.276323, 0.7039384, -1.075863, 1, 0.04313726, 0, 1,
-2.262004, -0.4792418, -2.89695, 1, 0.04705882, 0, 1,
-2.236517, -0.9543719, -1.79204, 1, 0.05490196, 0, 1,
-2.213737, 0.2424752, 0.4495387, 1, 0.05882353, 0, 1,
-2.186119, -1.546785, -1.54169, 1, 0.06666667, 0, 1,
-2.182029, -1.490955, -1.525138, 1, 0.07058824, 0, 1,
-2.145805, 0.1288578, -0.8292415, 1, 0.07843138, 0, 1,
-2.139292, -1.633647, -1.647887, 1, 0.08235294, 0, 1,
-2.112746, -0.9415939, -3.596025, 1, 0.09019608, 0, 1,
-2.092072, 0.1005622, -1.364138, 1, 0.09411765, 0, 1,
-2.079883, -0.4125167, -2.163743, 1, 0.1019608, 0, 1,
-2.072867, -0.3994373, -1.224788, 1, 0.1098039, 0, 1,
-2.065865, 0.01289897, -0.8626677, 1, 0.1137255, 0, 1,
-2.035774, 0.3884954, -1.066282, 1, 0.1215686, 0, 1,
-2.02626, -1.320646, -2.823722, 1, 0.1254902, 0, 1,
-1.980019, 2.263943, -1.242452, 1, 0.1333333, 0, 1,
-1.975942, -1.165396, -3.164236, 1, 0.1372549, 0, 1,
-1.95067, 1.608146, -1.119435, 1, 0.145098, 0, 1,
-1.909021, -0.6630417, -0.3908333, 1, 0.1490196, 0, 1,
-1.902629, 0.4224746, -3.299291, 1, 0.1568628, 0, 1,
-1.900676, 0.5373175, -1.880078, 1, 0.1607843, 0, 1,
-1.870315, -0.7242541, -2.977386, 1, 0.1686275, 0, 1,
-1.810881, 0.9956171, 0.1042057, 1, 0.172549, 0, 1,
-1.806837, -0.0005605075, -0.620807, 1, 0.1803922, 0, 1,
-1.803233, -0.3408855, -0.938759, 1, 0.1843137, 0, 1,
-1.771281, -1.783041, -3.127265, 1, 0.1921569, 0, 1,
-1.766203, 1.129165, -2.116795, 1, 0.1960784, 0, 1,
-1.765479, 0.1058389, 1.033749, 1, 0.2039216, 0, 1,
-1.759411, 0.6518566, -2.005873, 1, 0.2117647, 0, 1,
-1.754894, 1.013117, -0.5034809, 1, 0.2156863, 0, 1,
-1.720183, 0.4683556, -2.149119, 1, 0.2235294, 0, 1,
-1.672422, -0.8499978, -1.752653, 1, 0.227451, 0, 1,
-1.667089, 0.4953148, -0.9168943, 1, 0.2352941, 0, 1,
-1.661372, -0.1087576, -1.888022, 1, 0.2392157, 0, 1,
-1.661005, -1.296887, -1.798202, 1, 0.2470588, 0, 1,
-1.648166, 0.3026067, -1.939488, 1, 0.2509804, 0, 1,
-1.623838, 1.119725, 0.3307863, 1, 0.2588235, 0, 1,
-1.617906, 2.795477, -1.683524, 1, 0.2627451, 0, 1,
-1.61431, -1.385973, -2.115376, 1, 0.2705882, 0, 1,
-1.600445, 0.6686623, -0.4022629, 1, 0.2745098, 0, 1,
-1.59899, -0.3890244, -3.391492, 1, 0.282353, 0, 1,
-1.595683, 1.766188, -1.05045, 1, 0.2862745, 0, 1,
-1.5874, -1.993926, -1.13268, 1, 0.2941177, 0, 1,
-1.581818, 0.8344751, -2.267621, 1, 0.3019608, 0, 1,
-1.555099, -0.4881622, -1.412566, 1, 0.3058824, 0, 1,
-1.553401, 0.9114148, -1.233032, 1, 0.3137255, 0, 1,
-1.550696, 1.604654, 0.5886762, 1, 0.3176471, 0, 1,
-1.537037, 0.3663361, -0.6589444, 1, 0.3254902, 0, 1,
-1.53275, -0.3364355, -2.422116, 1, 0.3294118, 0, 1,
-1.52893, 0.0181697, -0.03086233, 1, 0.3372549, 0, 1,
-1.499712, -0.6747522, -2.264548, 1, 0.3411765, 0, 1,
-1.498408, -0.369833, -2.165332, 1, 0.3490196, 0, 1,
-1.495343, -0.3398791, -0.8583321, 1, 0.3529412, 0, 1,
-1.491741, -0.4592303, -0.8600672, 1, 0.3607843, 0, 1,
-1.481011, 0.07804994, -1.100202, 1, 0.3647059, 0, 1,
-1.478903, 0.8698806, -2.294809, 1, 0.372549, 0, 1,
-1.472751, -0.8543663, -2.480735, 1, 0.3764706, 0, 1,
-1.450015, -0.4699463, -1.940378, 1, 0.3843137, 0, 1,
-1.423264, -1.311131, -2.485392, 1, 0.3882353, 0, 1,
-1.418265, -0.8482204, -3.300035, 1, 0.3960784, 0, 1,
-1.415427, 0.1549746, -0.7394297, 1, 0.4039216, 0, 1,
-1.411624, -1.466108, -0.9117643, 1, 0.4078431, 0, 1,
-1.401959, -1.632875, -2.825274, 1, 0.4156863, 0, 1,
-1.399817, -1.747374, -1.844735, 1, 0.4196078, 0, 1,
-1.383824, -0.2550741, -0.1614213, 1, 0.427451, 0, 1,
-1.380071, -0.3209306, -1.39037, 1, 0.4313726, 0, 1,
-1.378111, 1.591477, -2.019665, 1, 0.4392157, 0, 1,
-1.376384, 1.50598, -1.006152, 1, 0.4431373, 0, 1,
-1.364805, -0.4512081, -1.735672, 1, 0.4509804, 0, 1,
-1.362715, -0.6259395, -2.950445, 1, 0.454902, 0, 1,
-1.35523, 0.8371943, -0.8915038, 1, 0.4627451, 0, 1,
-1.339441, -0.1549588, -3.639322, 1, 0.4666667, 0, 1,
-1.333102, 0.9129558, -1.638657, 1, 0.4745098, 0, 1,
-1.323254, 0.008473882, -2.565809, 1, 0.4784314, 0, 1,
-1.319818, 0.889819, -0.6597699, 1, 0.4862745, 0, 1,
-1.311165, 1.996107, -0.7683107, 1, 0.4901961, 0, 1,
-1.302382, 0.6135232, -0.01766349, 1, 0.4980392, 0, 1,
-1.299354, 0.1176045, -1.472802, 1, 0.5058824, 0, 1,
-1.290814, 0.3267759, -2.828598, 1, 0.509804, 0, 1,
-1.287391, 0.2989231, -0.8421078, 1, 0.5176471, 0, 1,
-1.282643, 0.9674243, -0.6992326, 1, 0.5215687, 0, 1,
-1.279433, -1.082161, -2.226805, 1, 0.5294118, 0, 1,
-1.278664, -0.3453433, -3.193472, 1, 0.5333334, 0, 1,
-1.273063, 1.026315, -1.32095, 1, 0.5411765, 0, 1,
-1.270511, 0.1351722, -2.088746, 1, 0.5450981, 0, 1,
-1.268072, -0.5868679, -2.309807, 1, 0.5529412, 0, 1,
-1.253315, -0.4210148, -1.663857, 1, 0.5568628, 0, 1,
-1.248238, -1.229151, -2.870708, 1, 0.5647059, 0, 1,
-1.228015, 0.1986918, -0.7385689, 1, 0.5686275, 0, 1,
-1.226682, 0.2723119, -0.3244021, 1, 0.5764706, 0, 1,
-1.22657, 1.900292, 0.2458848, 1, 0.5803922, 0, 1,
-1.224956, -1.368198, -2.338043, 1, 0.5882353, 0, 1,
-1.22231, -0.4483818, -3.662726, 1, 0.5921569, 0, 1,
-1.222227, -0.03970222, -1.371169, 1, 0.6, 0, 1,
-1.221522, -0.3095013, -2.60226, 1, 0.6078432, 0, 1,
-1.207329, 2.308782, -0.636779, 1, 0.6117647, 0, 1,
-1.204032, 0.9432971, -1.135761, 1, 0.6196079, 0, 1,
-1.193756, 0.3900897, -3.085896, 1, 0.6235294, 0, 1,
-1.192056, 1.180024, 0.7623244, 1, 0.6313726, 0, 1,
-1.189736, 0.42246, 0.4753754, 1, 0.6352941, 0, 1,
-1.18086, -0.437382, -2.712085, 1, 0.6431373, 0, 1,
-1.177449, 0.1765705, -2.46333, 1, 0.6470588, 0, 1,
-1.17568, -0.6073201, -0.9361258, 1, 0.654902, 0, 1,
-1.172309, -0.5881304, -2.751523, 1, 0.6588235, 0, 1,
-1.154688, 0.2154999, -2.088932, 1, 0.6666667, 0, 1,
-1.153602, -1.604836, -3.994233, 1, 0.6705883, 0, 1,
-1.151902, -0.8487816, -3.38841, 1, 0.6784314, 0, 1,
-1.14465, 1.69435, 0.4766612, 1, 0.682353, 0, 1,
-1.142748, 2.421857, -0.6125693, 1, 0.6901961, 0, 1,
-1.140736, -0.1354135, -2.792668, 1, 0.6941177, 0, 1,
-1.140155, -0.4853293, -2.518082, 1, 0.7019608, 0, 1,
-1.137229, 0.8668304, 0.1952536, 1, 0.7098039, 0, 1,
-1.133715, -0.8918421, -2.621065, 1, 0.7137255, 0, 1,
-1.131021, 1.542542, 0.2776982, 1, 0.7215686, 0, 1,
-1.122247, 0.1903114, -1.44774, 1, 0.7254902, 0, 1,
-1.120526, 2.759993, -0.8448397, 1, 0.7333333, 0, 1,
-1.12045, -0.4470167, -0.5625048, 1, 0.7372549, 0, 1,
-1.119917, -1.648908, -2.661827, 1, 0.7450981, 0, 1,
-1.118049, -0.7752896, -4.96604, 1, 0.7490196, 0, 1,
-1.117009, -0.5045063, -2.081361, 1, 0.7568628, 0, 1,
-1.107795, -0.2787892, -1.701938, 1, 0.7607843, 0, 1,
-1.094794, -0.8676946, -1.793281, 1, 0.7686275, 0, 1,
-1.092121, -1.037609, -1.690568, 1, 0.772549, 0, 1,
-1.088989, -0.09284876, -2.34601, 1, 0.7803922, 0, 1,
-1.088248, -0.4388089, -1.056654, 1, 0.7843137, 0, 1,
-1.087721, -0.8334048, -2.037471, 1, 0.7921569, 0, 1,
-1.083045, 0.2475731, -0.7971694, 1, 0.7960784, 0, 1,
-1.079409, -0.001267674, -1.647045, 1, 0.8039216, 0, 1,
-1.079297, 1.279624, 0.4039445, 1, 0.8117647, 0, 1,
-1.075977, 0.4006822, -3.204839, 1, 0.8156863, 0, 1,
-1.072326, -0.486745, -3.006741, 1, 0.8235294, 0, 1,
-1.063654, 0.8894913, -1.742273, 1, 0.827451, 0, 1,
-1.060239, -0.7590801, -3.316874, 1, 0.8352941, 0, 1,
-1.055656, -0.9513943, -2.990376, 1, 0.8392157, 0, 1,
-1.055416, 0.2805833, -0.6096341, 1, 0.8470588, 0, 1,
-1.052923, 0.5461971, -0.3523277, 1, 0.8509804, 0, 1,
-1.046681, -1.764574, -2.791367, 1, 0.8588235, 0, 1,
-1.045829, -0.3951729, -1.338544, 1, 0.8627451, 0, 1,
-1.038597, -0.9416012, -2.499699, 1, 0.8705882, 0, 1,
-1.037517, 0.8590459, -1.303758, 1, 0.8745098, 0, 1,
-1.034663, 1.867924, -1.24152, 1, 0.8823529, 0, 1,
-1.026045, 0.2886505, -0.4831657, 1, 0.8862745, 0, 1,
-1.025929, -1.216354, -3.305919, 1, 0.8941177, 0, 1,
-1.025192, -0.9413084, -3.515673, 1, 0.8980392, 0, 1,
-1.018264, 0.6369689, -0.5010208, 1, 0.9058824, 0, 1,
-1.01567, -0.206097, -1.814787, 1, 0.9137255, 0, 1,
-1.014706, 1.506196, -0.2240606, 1, 0.9176471, 0, 1,
-0.9983672, -0.690758, -1.457529, 1, 0.9254902, 0, 1,
-0.996219, -2.966829, -2.834342, 1, 0.9294118, 0, 1,
-0.9888219, -0.7750463, -1.995213, 1, 0.9372549, 0, 1,
-0.9739012, -0.2092554, -1.477504, 1, 0.9411765, 0, 1,
-0.9712514, -1.117891, -0.8523599, 1, 0.9490196, 0, 1,
-0.9678229, 0.5720375, -0.6654619, 1, 0.9529412, 0, 1,
-0.9586858, 0.9350443, -1.262589, 1, 0.9607843, 0, 1,
-0.9574124, -0.1521914, 0.2210665, 1, 0.9647059, 0, 1,
-0.954464, 0.3695821, 0.5300568, 1, 0.972549, 0, 1,
-0.95151, 1.236402, 0.2167314, 1, 0.9764706, 0, 1,
-0.9514499, -0.2674735, -1.874564, 1, 0.9843137, 0, 1,
-0.9484017, -1.490631, -1.520071, 1, 0.9882353, 0, 1,
-0.9439148, 0.3411427, -1.856328, 1, 0.9960784, 0, 1,
-0.9438721, 1.301616, 0.3177509, 0.9960784, 1, 0, 1,
-0.9384286, -1.265116, -3.583085, 0.9921569, 1, 0, 1,
-0.9287253, -1.053133, -3.306165, 0.9843137, 1, 0, 1,
-0.9273262, -1.4074, -1.649871, 0.9803922, 1, 0, 1,
-0.9182242, 0.00806548, -1.782178, 0.972549, 1, 0, 1,
-0.9178166, -0.3611631, -3.219905, 0.9686275, 1, 0, 1,
-0.9116372, 0.5456333, 0.3525752, 0.9607843, 1, 0, 1,
-0.9076494, 0.2264731, -2.980669, 0.9568627, 1, 0, 1,
-0.9020714, -0.2775131, -3.272061, 0.9490196, 1, 0, 1,
-0.9000023, 1.550376, 0.5216851, 0.945098, 1, 0, 1,
-0.8984093, 0.3621161, -2.205675, 0.9372549, 1, 0, 1,
-0.8967345, 0.8521231, -0.6220262, 0.9333333, 1, 0, 1,
-0.8849406, 0.6001174, -2.718714, 0.9254902, 1, 0, 1,
-0.8820121, 1.212904, -1.351954, 0.9215686, 1, 0, 1,
-0.8816499, 1.484401, -0.5186864, 0.9137255, 1, 0, 1,
-0.8765376, 1.250369, -0.8536645, 0.9098039, 1, 0, 1,
-0.8764948, -0.8285326, -1.849803, 0.9019608, 1, 0, 1,
-0.8761329, -0.7333986, -1.715088, 0.8941177, 1, 0, 1,
-0.8746455, 0.6305271, -0.02298708, 0.8901961, 1, 0, 1,
-0.8729415, -0.6726901, -2.76198, 0.8823529, 1, 0, 1,
-0.8699937, -0.1409534, -0.5388719, 0.8784314, 1, 0, 1,
-0.8699336, 0.4537996, -1.263936, 0.8705882, 1, 0, 1,
-0.8683746, 0.998323, -1.007313, 0.8666667, 1, 0, 1,
-0.867844, -1.122186, -3.401623, 0.8588235, 1, 0, 1,
-0.8664641, 0.8084167, -0.4787686, 0.854902, 1, 0, 1,
-0.8650857, -0.751188, -0.9354563, 0.8470588, 1, 0, 1,
-0.863893, -2.129987, -4.31117, 0.8431373, 1, 0, 1,
-0.8630908, -1.840923, -2.723253, 0.8352941, 1, 0, 1,
-0.8618847, 1.371851, -0.205596, 0.8313726, 1, 0, 1,
-0.8602245, -0.2273848, -0.03297143, 0.8235294, 1, 0, 1,
-0.8602178, -1.153424, -1.439966, 0.8196079, 1, 0, 1,
-0.8539972, 0.6337658, -0.05118444, 0.8117647, 1, 0, 1,
-0.8518953, -1.772761, -3.805136, 0.8078431, 1, 0, 1,
-0.845933, -0.1144437, -3.448611, 0.8, 1, 0, 1,
-0.8435575, 0.2498405, -1.345038, 0.7921569, 1, 0, 1,
-0.8422964, 0.09740523, -2.652158, 0.7882353, 1, 0, 1,
-0.8363259, -1.427857, -1.902801, 0.7803922, 1, 0, 1,
-0.8351114, 0.6471704, -0.2128546, 0.7764706, 1, 0, 1,
-0.8349083, 0.841396, 0.2065294, 0.7686275, 1, 0, 1,
-0.834868, 0.3470986, 0.1342697, 0.7647059, 1, 0, 1,
-0.8348178, -0.3393835, -0.5535369, 0.7568628, 1, 0, 1,
-0.834487, 1.042922, -1.963978, 0.7529412, 1, 0, 1,
-0.8313621, 0.3276705, -0.8911266, 0.7450981, 1, 0, 1,
-0.8309107, -0.9369814, -2.262052, 0.7411765, 1, 0, 1,
-0.8243991, -1.015138, -1.378143, 0.7333333, 1, 0, 1,
-0.8212126, -0.2588247, -2.258936, 0.7294118, 1, 0, 1,
-0.8205699, -1.207189, -1.637941, 0.7215686, 1, 0, 1,
-0.8195909, -0.6000972, -1.467389, 0.7176471, 1, 0, 1,
-0.8092794, 0.6957879, -1.715777, 0.7098039, 1, 0, 1,
-0.8054878, 1.190549, 0.229467, 0.7058824, 1, 0, 1,
-0.8045191, 2.297576, 0.148109, 0.6980392, 1, 0, 1,
-0.7941217, -0.3410944, -2.634137, 0.6901961, 1, 0, 1,
-0.7909049, 1.4978, -0.2552581, 0.6862745, 1, 0, 1,
-0.7908943, 1.476118, -2.634302, 0.6784314, 1, 0, 1,
-0.7823189, 0.7243199, -0.735964, 0.6745098, 1, 0, 1,
-0.7800992, -0.02865267, -1.351809, 0.6666667, 1, 0, 1,
-0.7792118, 0.7781173, 1.511093, 0.6627451, 1, 0, 1,
-0.7726635, 0.4827803, -1.073745, 0.654902, 1, 0, 1,
-0.7697762, 1.493082, -0.7063443, 0.6509804, 1, 0, 1,
-0.7674101, -0.4432565, -4.989967, 0.6431373, 1, 0, 1,
-0.767214, 1.114183, -1.338985, 0.6392157, 1, 0, 1,
-0.7660623, -0.8123769, -2.861855, 0.6313726, 1, 0, 1,
-0.7612641, -0.4083993, -3.360104, 0.627451, 1, 0, 1,
-0.7501885, 0.7488986, -2.104271, 0.6196079, 1, 0, 1,
-0.7421057, -1.214345, -3.107131, 0.6156863, 1, 0, 1,
-0.7370799, 0.2752521, -0.3246732, 0.6078432, 1, 0, 1,
-0.7267658, 0.141561, -2.042674, 0.6039216, 1, 0, 1,
-0.7169753, 1.281265, -0.9703187, 0.5960785, 1, 0, 1,
-0.7120876, -0.9283783, -1.898803, 0.5882353, 1, 0, 1,
-0.7073805, 0.2120697, -2.08452, 0.5843138, 1, 0, 1,
-0.7012119, -0.6859813, -3.271831, 0.5764706, 1, 0, 1,
-0.7006508, 0.02479043, -2.552882, 0.572549, 1, 0, 1,
-0.6987119, -1.768836, -2.807382, 0.5647059, 1, 0, 1,
-0.6957795, -0.5738554, -1.600472, 0.5607843, 1, 0, 1,
-0.6951457, -1.114797, -3.732282, 0.5529412, 1, 0, 1,
-0.6944852, -0.7099595, -1.451723, 0.5490196, 1, 0, 1,
-0.6944221, -0.9982691, -2.120226, 0.5411765, 1, 0, 1,
-0.6935209, -1.262369, -3.230057, 0.5372549, 1, 0, 1,
-0.6919661, 0.7227823, -0.06755789, 0.5294118, 1, 0, 1,
-0.6909152, 0.5353268, -2.06308, 0.5254902, 1, 0, 1,
-0.6906285, -0.02773243, -1.653019, 0.5176471, 1, 0, 1,
-0.6823916, 1.562851, -1.331311, 0.5137255, 1, 0, 1,
-0.6797432, -0.2527182, -1.849867, 0.5058824, 1, 0, 1,
-0.6790487, 1.20747, -1.225755, 0.5019608, 1, 0, 1,
-0.6738693, 1.199805, -1.616388, 0.4941176, 1, 0, 1,
-0.6693556, 0.9115232, 0.03854153, 0.4862745, 1, 0, 1,
-0.668289, -0.5644096, -3.505267, 0.4823529, 1, 0, 1,
-0.6668798, -0.6294623, -3.397154, 0.4745098, 1, 0, 1,
-0.660104, 0.8384204, -0.7221254, 0.4705882, 1, 0, 1,
-0.6595308, 0.3922718, -0.235594, 0.4627451, 1, 0, 1,
-0.6541333, 0.7573265, -1.477941, 0.4588235, 1, 0, 1,
-0.6456224, -0.4075766, -1.854592, 0.4509804, 1, 0, 1,
-0.6435372, 0.1664885, -1.343258, 0.4470588, 1, 0, 1,
-0.6421034, 0.7453387, -0.8604954, 0.4392157, 1, 0, 1,
-0.6399008, 0.418233, -0.2249505, 0.4352941, 1, 0, 1,
-0.638988, -0.1665295, -1.812266, 0.427451, 1, 0, 1,
-0.6323071, -0.1071427, -1.384829, 0.4235294, 1, 0, 1,
-0.6320865, 0.02151346, -1.828739, 0.4156863, 1, 0, 1,
-0.6275128, -1.211706, -3.505778, 0.4117647, 1, 0, 1,
-0.6220989, -0.06819799, -1.370858, 0.4039216, 1, 0, 1,
-0.6219913, 1.516539, 0.1460641, 0.3960784, 1, 0, 1,
-0.6097463, 0.8583822, 1.075295, 0.3921569, 1, 0, 1,
-0.6054741, -2.172438, -3.373898, 0.3843137, 1, 0, 1,
-0.6050705, -0.3716373, -3.425165, 0.3803922, 1, 0, 1,
-0.6042354, -0.4412836, -1.130691, 0.372549, 1, 0, 1,
-0.6035082, -1.833948, -4.032285, 0.3686275, 1, 0, 1,
-0.5957196, -1.091542, -2.157582, 0.3607843, 1, 0, 1,
-0.5919467, 0.9530365, -0.522661, 0.3568628, 1, 0, 1,
-0.5917282, -1.092865, -2.068538, 0.3490196, 1, 0, 1,
-0.5886359, -2.127463, -1.944871, 0.345098, 1, 0, 1,
-0.588414, -0.9061765, -4.086975, 0.3372549, 1, 0, 1,
-0.5755039, -0.8528619, -2.626765, 0.3333333, 1, 0, 1,
-0.5711283, 0.8037196, -1.371319, 0.3254902, 1, 0, 1,
-0.5687757, -0.9799547, -2.262171, 0.3215686, 1, 0, 1,
-0.5633591, -0.8478833, -2.588545, 0.3137255, 1, 0, 1,
-0.5620745, -0.3163637, -0.4414768, 0.3098039, 1, 0, 1,
-0.5609215, 1.10145, -1.144665, 0.3019608, 1, 0, 1,
-0.5512421, -0.3921259, -2.608585, 0.2941177, 1, 0, 1,
-0.5498787, 0.3321454, -1.738194, 0.2901961, 1, 0, 1,
-0.5487632, -0.5514011, -2.408464, 0.282353, 1, 0, 1,
-0.5472446, 1.749536, -1.425094, 0.2784314, 1, 0, 1,
-0.5461401, 0.3038367, -1.019185, 0.2705882, 1, 0, 1,
-0.5436914, -0.5283193, -3.882431, 0.2666667, 1, 0, 1,
-0.5405514, -1.342644, -2.482898, 0.2588235, 1, 0, 1,
-0.5394068, 0.07425978, -2.233822, 0.254902, 1, 0, 1,
-0.5393226, 0.7219282, 1.077024, 0.2470588, 1, 0, 1,
-0.5367597, 1.123079, 1.226703, 0.2431373, 1, 0, 1,
-0.5349741, 1.667216, 1.393378, 0.2352941, 1, 0, 1,
-0.5310953, 0.4250759, -1.627196, 0.2313726, 1, 0, 1,
-0.529961, -0.8854202, -4.423871, 0.2235294, 1, 0, 1,
-0.5220422, -0.3101597, -0.4531846, 0.2196078, 1, 0, 1,
-0.5219798, 0.3384666, -1.020559, 0.2117647, 1, 0, 1,
-0.5197338, -0.4071133, -2.701822, 0.2078431, 1, 0, 1,
-0.5181841, 0.9352164, -1.15858, 0.2, 1, 0, 1,
-0.5160803, 0.2926578, -1.242529, 0.1921569, 1, 0, 1,
-0.5069841, 2.255455, -0.4372759, 0.1882353, 1, 0, 1,
-0.5034272, 0.696327, -0.5839124, 0.1803922, 1, 0, 1,
-0.4983475, -1.186805, -1.281366, 0.1764706, 1, 0, 1,
-0.4980192, 0.02398459, -3.096573, 0.1686275, 1, 0, 1,
-0.494234, 1.233403, 0.12421, 0.1647059, 1, 0, 1,
-0.4914519, -0.7212955, -2.213502, 0.1568628, 1, 0, 1,
-0.4861403, -0.5651575, -3.874004, 0.1529412, 1, 0, 1,
-0.4764701, 0.2731239, 0.06621149, 0.145098, 1, 0, 1,
-0.476095, 2.056461, -1.207857, 0.1411765, 1, 0, 1,
-0.4755614, -0.4234163, -3.584677, 0.1333333, 1, 0, 1,
-0.4728743, -0.64028, -1.077896, 0.1294118, 1, 0, 1,
-0.4717403, -0.04428171, -1.597847, 0.1215686, 1, 0, 1,
-0.4681392, -0.5256815, -0.7403147, 0.1176471, 1, 0, 1,
-0.4614236, -1.59492, -1.582589, 0.1098039, 1, 0, 1,
-0.4597577, -0.7130974, -2.861843, 0.1058824, 1, 0, 1,
-0.459403, -0.03534892, 0.08889365, 0.09803922, 1, 0, 1,
-0.4582864, 0.4521516, -0.9857754, 0.09019608, 1, 0, 1,
-0.4560581, 1.510248, -0.5288978, 0.08627451, 1, 0, 1,
-0.4558305, -0.1132323, -0.3486953, 0.07843138, 1, 0, 1,
-0.4556005, 0.7465764, 0.6446939, 0.07450981, 1, 0, 1,
-0.4497921, 0.7264987, -1.551795, 0.06666667, 1, 0, 1,
-0.4387724, -0.5049966, -1.292947, 0.0627451, 1, 0, 1,
-0.4366681, 0.1388831, -4.09409, 0.05490196, 1, 0, 1,
-0.4351639, 0.2705628, -0.9757457, 0.05098039, 1, 0, 1,
-0.4334344, 0.7549635, 0.1651879, 0.04313726, 1, 0, 1,
-0.4327493, -0.2293234, -1.291463, 0.03921569, 1, 0, 1,
-0.4277863, 0.1762983, -0.8431056, 0.03137255, 1, 0, 1,
-0.4219272, 0.4001798, -1.008798, 0.02745098, 1, 0, 1,
-0.4185457, 0.1290984, -1.974806, 0.01960784, 1, 0, 1,
-0.416146, -0.8430465, -2.345267, 0.01568628, 1, 0, 1,
-0.4158712, -0.921348, -1.393677, 0.007843138, 1, 0, 1,
-0.4131337, -2.186178, -2.2628, 0.003921569, 1, 0, 1,
-0.4060639, -1.17649, -4.811262, 0, 1, 0.003921569, 1,
-0.4059421, 0.03257088, -2.172065, 0, 1, 0.01176471, 1,
-0.4022032, -1.006447, -1.520232, 0, 1, 0.01568628, 1,
-0.4019452, -0.3033599, -0.9791418, 0, 1, 0.02352941, 1,
-0.3992644, -1.240204, -2.493391, 0, 1, 0.02745098, 1,
-0.3984933, 0.4087248, 1.185612, 0, 1, 0.03529412, 1,
-0.3976693, 0.6705372, -1.105996, 0, 1, 0.03921569, 1,
-0.3961584, 1.497129, -0.2686395, 0, 1, 0.04705882, 1,
-0.3944362, -1.417283, -1.369772, 0, 1, 0.05098039, 1,
-0.3918692, 1.536348, -0.6689585, 0, 1, 0.05882353, 1,
-0.3876833, -0.6989743, -3.287654, 0, 1, 0.0627451, 1,
-0.3836689, 0.8029131, 1.229005, 0, 1, 0.07058824, 1,
-0.3799517, 0.6646795, -0.4613107, 0, 1, 0.07450981, 1,
-0.3795375, -0.5296122, -3.797327, 0, 1, 0.08235294, 1,
-0.3783412, 0.8409386, -0.1229009, 0, 1, 0.08627451, 1,
-0.3781823, -1.355553, -3.234697, 0, 1, 0.09411765, 1,
-0.377095, 0.9798197, -1.534249, 0, 1, 0.1019608, 1,
-0.3762328, -1.755787, -3.099204, 0, 1, 0.1058824, 1,
-0.3758501, 0.1004833, -2.78643, 0, 1, 0.1137255, 1,
-0.375707, -0.9424962, -3.381305, 0, 1, 0.1176471, 1,
-0.3732395, -0.6752165, -3.106211, 0, 1, 0.1254902, 1,
-0.3725912, 0.387151, -1.457976, 0, 1, 0.1294118, 1,
-0.3685559, 1.150379, 0.4230187, 0, 1, 0.1372549, 1,
-0.3655398, -1.125196, -3.760719, 0, 1, 0.1411765, 1,
-0.3637432, -0.355156, -2.218097, 0, 1, 0.1490196, 1,
-0.3607641, 0.6661007, -1.300805, 0, 1, 0.1529412, 1,
-0.3560087, 1.841316, -0.9058926, 0, 1, 0.1607843, 1,
-0.3521257, -0.2343573, -2.502257, 0, 1, 0.1647059, 1,
-0.3475842, 1.723148, 0.7508559, 0, 1, 0.172549, 1,
-0.346178, -0.5933322, -2.546208, 0, 1, 0.1764706, 1,
-0.3455273, -0.3019482, -3.87542, 0, 1, 0.1843137, 1,
-0.3396651, -0.5427998, -3.520891, 0, 1, 0.1882353, 1,
-0.3368899, 0.06099314, -2.131537, 0, 1, 0.1960784, 1,
-0.3358569, -1.761398, -3.32719, 0, 1, 0.2039216, 1,
-0.3358456, -0.6425169, -2.621337, 0, 1, 0.2078431, 1,
-0.3288779, 1.135629, 1.908474, 0, 1, 0.2156863, 1,
-0.3257678, -0.5022072, -2.344519, 0, 1, 0.2196078, 1,
-0.3221092, -1.504635, -3.632995, 0, 1, 0.227451, 1,
-0.3208156, 0.118831, -3.66672, 0, 1, 0.2313726, 1,
-0.3193632, -0.7181926, -4.081885, 0, 1, 0.2392157, 1,
-0.3180822, 0.5239677, -0.4410777, 0, 1, 0.2431373, 1,
-0.3165305, -0.6988045, -3.782287, 0, 1, 0.2509804, 1,
-0.3162818, 0.05183976, 0.5716008, 0, 1, 0.254902, 1,
-0.3078257, 0.8408039, -0.07399075, 0, 1, 0.2627451, 1,
-0.3076058, 0.8991459, 1.141253, 0, 1, 0.2666667, 1,
-0.3011502, 0.4922025, -3.000916, 0, 1, 0.2745098, 1,
-0.300388, -0.1222599, -3.5251, 0, 1, 0.2784314, 1,
-0.2990517, 0.3858114, -2.590103, 0, 1, 0.2862745, 1,
-0.2979671, -0.2721961, -0.8107559, 0, 1, 0.2901961, 1,
-0.2969021, -1.399981, -2.647766, 0, 1, 0.2980392, 1,
-0.2962645, -0.1381854, -1.340369, 0, 1, 0.3058824, 1,
-0.2960812, 1.663829, 0.2805426, 0, 1, 0.3098039, 1,
-0.2958622, -0.2613837, -0.7096515, 0, 1, 0.3176471, 1,
-0.2907567, 1.388806, -0.9593265, 0, 1, 0.3215686, 1,
-0.2890448, -0.286574, -2.64946, 0, 1, 0.3294118, 1,
-0.2807747, 0.6573725, -1.542661, 0, 1, 0.3333333, 1,
-0.2806207, -1.081429, -1.447762, 0, 1, 0.3411765, 1,
-0.2762784, 1.600276, -1.225264, 0, 1, 0.345098, 1,
-0.2730732, -0.4844391, -2.272189, 0, 1, 0.3529412, 1,
-0.2663748, -1.562632, -4.042384, 0, 1, 0.3568628, 1,
-0.2642154, 0.3311861, 0.03608536, 0, 1, 0.3647059, 1,
-0.2606172, -0.5298399, -2.732537, 0, 1, 0.3686275, 1,
-0.2571078, 0.9970815, 0.5118825, 0, 1, 0.3764706, 1,
-0.2541226, -0.1704944, -3.466243, 0, 1, 0.3803922, 1,
-0.2512651, 0.3948916, -0.4834884, 0, 1, 0.3882353, 1,
-0.2459938, -1.307263, -3.823318, 0, 1, 0.3921569, 1,
-0.2452705, 0.2979892, -0.5742985, 0, 1, 0.4, 1,
-0.2407685, 0.5401269, -0.7297797, 0, 1, 0.4078431, 1,
-0.2307251, 0.6221807, -0.2692588, 0, 1, 0.4117647, 1,
-0.2303825, -1.226218, -1.853937, 0, 1, 0.4196078, 1,
-0.2284009, -2.559338, -3.850051, 0, 1, 0.4235294, 1,
-0.2274972, -1.379075, -4.038136, 0, 1, 0.4313726, 1,
-0.2271697, 0.7903102, -0.9460375, 0, 1, 0.4352941, 1,
-0.2223798, -2.710253, -2.377032, 0, 1, 0.4431373, 1,
-0.2178285, -0.2494168, -3.082465, 0, 1, 0.4470588, 1,
-0.2101111, 0.411543, -1.361665, 0, 1, 0.454902, 1,
-0.2099585, 2.243548, -0.8094184, 0, 1, 0.4588235, 1,
-0.209655, 0.3225215, 0.1276413, 0, 1, 0.4666667, 1,
-0.2067807, 0.7585541, -1.232526, 0, 1, 0.4705882, 1,
-0.2064829, 0.6308808, 0.5296921, 0, 1, 0.4784314, 1,
-0.2051943, 0.3044436, -1.014537, 0, 1, 0.4823529, 1,
-0.2020742, -0.3631528, -3.486517, 0, 1, 0.4901961, 1,
-0.1991905, -0.3367499, -5.115956, 0, 1, 0.4941176, 1,
-0.1950083, -1.806557, -3.634817, 0, 1, 0.5019608, 1,
-0.1931363, 0.8431699, 0.661665, 0, 1, 0.509804, 1,
-0.1928298, 0.6251733, -0.6698541, 0, 1, 0.5137255, 1,
-0.1856305, 1.366637, 0.4810882, 0, 1, 0.5215687, 1,
-0.1803886, -0.4665062, -2.350848, 0, 1, 0.5254902, 1,
-0.1767934, -0.9462087, -3.208836, 0, 1, 0.5333334, 1,
-0.1736119, 0.6633046, 0.4116101, 0, 1, 0.5372549, 1,
-0.1705135, -0.002311989, -2.394017, 0, 1, 0.5450981, 1,
-0.1700408, -1.132807, -3.03779, 0, 1, 0.5490196, 1,
-0.1690643, -2.129476, -2.304618, 0, 1, 0.5568628, 1,
-0.1683449, -0.2437606, -1.739013, 0, 1, 0.5607843, 1,
-0.1668652, -0.2630964, -3.513385, 0, 1, 0.5686275, 1,
-0.161868, 1.138867, -0.142472, 0, 1, 0.572549, 1,
-0.157324, 0.7483831, -0.01273496, 0, 1, 0.5803922, 1,
-0.1528106, -0.4356261, -4.186006, 0, 1, 0.5843138, 1,
-0.149771, -0.4584742, -2.643455, 0, 1, 0.5921569, 1,
-0.1482761, 0.2279727, -1.423726, 0, 1, 0.5960785, 1,
-0.14542, -0.5883152, -2.254103, 0, 1, 0.6039216, 1,
-0.1423434, -0.5311962, -2.86685, 0, 1, 0.6117647, 1,
-0.1419111, 0.785061, -0.2466187, 0, 1, 0.6156863, 1,
-0.1397632, 0.595359, 0.288009, 0, 1, 0.6235294, 1,
-0.1353856, -1.105878, -2.921998, 0, 1, 0.627451, 1,
-0.1353564, -1.48443, -4.278906, 0, 1, 0.6352941, 1,
-0.1332561, -0.8726399, -3.921646, 0, 1, 0.6392157, 1,
-0.1328923, 1.07582, -0.9858061, 0, 1, 0.6470588, 1,
-0.1324871, 0.006344092, -3.040513, 0, 1, 0.6509804, 1,
-0.1312225, -0.9882361, -2.132017, 0, 1, 0.6588235, 1,
-0.1307679, -0.1845035, -3.041251, 0, 1, 0.6627451, 1,
-0.1298528, 0.5432513, -1.085291, 0, 1, 0.6705883, 1,
-0.128641, -0.1701391, -3.301927, 0, 1, 0.6745098, 1,
-0.1284114, 0.4126765, 1.213194, 0, 1, 0.682353, 1,
-0.1279595, -0.8959647, -3.995457, 0, 1, 0.6862745, 1,
-0.1268097, -1.223363, -3.353626, 0, 1, 0.6941177, 1,
-0.126489, 0.8157655, 1.079375, 0, 1, 0.7019608, 1,
-0.1235912, 0.1150771, 0.9920471, 0, 1, 0.7058824, 1,
-0.1215814, -0.004688553, -2.797343, 0, 1, 0.7137255, 1,
-0.1156946, 0.03137976, -1.685877, 0, 1, 0.7176471, 1,
-0.1146216, -2.149056, -4.230216, 0, 1, 0.7254902, 1,
-0.09925529, 0.01702699, -2.240319, 0, 1, 0.7294118, 1,
-0.09803343, 0.7142097, -0.3363771, 0, 1, 0.7372549, 1,
-0.09421898, 0.4287213, -1.906847, 0, 1, 0.7411765, 1,
-0.09313048, -0.1889723, -2.580529, 0, 1, 0.7490196, 1,
-0.09067562, -0.325123, -2.00164, 0, 1, 0.7529412, 1,
-0.09026917, -0.9042692, -3.480604, 0, 1, 0.7607843, 1,
-0.08879577, -0.3854279, -4.107697, 0, 1, 0.7647059, 1,
-0.08751356, -0.6339111, -3.910541, 0, 1, 0.772549, 1,
-0.08584168, 0.4852962, -1.635176, 0, 1, 0.7764706, 1,
-0.08451834, -0.09043703, -3.161577, 0, 1, 0.7843137, 1,
-0.08242358, 0.09654978, 0.05862248, 0, 1, 0.7882353, 1,
-0.08079173, 0.2434454, -1.488785, 0, 1, 0.7960784, 1,
-0.07996948, -0.3528555, -2.861266, 0, 1, 0.8039216, 1,
-0.07755564, -0.7240899, -3.21075, 0, 1, 0.8078431, 1,
-0.07619318, 0.1620778, 0.7230752, 0, 1, 0.8156863, 1,
-0.0759922, -1.109475, -2.706652, 0, 1, 0.8196079, 1,
-0.07436623, -0.7313553, -3.711043, 0, 1, 0.827451, 1,
-0.07217101, 0.6714734, 0.422629, 0, 1, 0.8313726, 1,
-0.07138629, 1.742232, -0.9675109, 0, 1, 0.8392157, 1,
-0.06398221, -0.84383, -2.129184, 0, 1, 0.8431373, 1,
-0.06345613, 0.1185044, -0.2703198, 0, 1, 0.8509804, 1,
-0.06080281, 1.316819, -1.877039, 0, 1, 0.854902, 1,
-0.05836765, 1.877111, 0.6662215, 0, 1, 0.8627451, 1,
-0.05769834, 0.3100266, 0.1916048, 0, 1, 0.8666667, 1,
-0.04920572, 1.585742, 1.011719, 0, 1, 0.8745098, 1,
-0.04532728, -0.124206, -2.759798, 0, 1, 0.8784314, 1,
-0.04436203, 1.555347, -0.4553725, 0, 1, 0.8862745, 1,
-0.04401519, -0.00990062, -1.583823, 0, 1, 0.8901961, 1,
-0.04245685, -0.6065366, -2.861202, 0, 1, 0.8980392, 1,
-0.03298992, -0.4406663, -4.608031, 0, 1, 0.9058824, 1,
-0.02673997, -0.3838376, -3.815263, 0, 1, 0.9098039, 1,
-0.025938, -0.1295597, -2.91516, 0, 1, 0.9176471, 1,
-0.02545506, -0.9794393, -2.482683, 0, 1, 0.9215686, 1,
-0.01971287, -0.6079317, -3.365922, 0, 1, 0.9294118, 1,
-0.01934996, -0.355224, -4.598394, 0, 1, 0.9333333, 1,
-0.01661897, -0.2547319, -3.23227, 0, 1, 0.9411765, 1,
-0.01347825, -2.151268, -2.881313, 0, 1, 0.945098, 1,
-0.01232215, -0.2722944, -1.616244, 0, 1, 0.9529412, 1,
-0.01125866, -0.623915, -4.259493, 0, 1, 0.9568627, 1,
-0.0109397, -0.06309988, -3.498033, 0, 1, 0.9647059, 1,
-0.01070588, 1.266685, 0.04668624, 0, 1, 0.9686275, 1,
-0.008982082, -0.3008294, -2.724016, 0, 1, 0.9764706, 1,
-0.004585996, -0.5190904, -2.749521, 0, 1, 0.9803922, 1,
-0.00280128, 0.1499752, -0.09670133, 0, 1, 0.9882353, 1,
6.618235e-06, -1.804181, 3.371688, 0, 1, 0.9921569, 1,
0.001030152, 0.2368892, -1.765724, 0, 1, 1, 1,
0.001503158, 0.3563699, 0.6985617, 0, 0.9921569, 1, 1,
0.01085791, -0.754191, 3.409512, 0, 0.9882353, 1, 1,
0.01223867, -1.503387, 2.568398, 0, 0.9803922, 1, 1,
0.01805671, -1.333095, 4.154212, 0, 0.9764706, 1, 1,
0.02378136, 1.609354, -1.56512, 0, 0.9686275, 1, 1,
0.02670755, 0.1903631, -0.9144976, 0, 0.9647059, 1, 1,
0.02674031, 0.2945121, -0.1952493, 0, 0.9568627, 1, 1,
0.03057346, 0.7641379, -0.3075512, 0, 0.9529412, 1, 1,
0.03252075, -1.746732, 3.714962, 0, 0.945098, 1, 1,
0.03339614, -1.729971, 3.372387, 0, 0.9411765, 1, 1,
0.03356988, -2.489207, 4.094003, 0, 0.9333333, 1, 1,
0.03421343, 0.08237736, 0.3200123, 0, 0.9294118, 1, 1,
0.03689375, 0.2279835, 1.912305, 0, 0.9215686, 1, 1,
0.03740641, -1.028149, 4.102587, 0, 0.9176471, 1, 1,
0.04427681, 0.5717151, 0.655055, 0, 0.9098039, 1, 1,
0.04791425, 2.494483, 0.1959465, 0, 0.9058824, 1, 1,
0.0515933, 0.2666436, -1.698009, 0, 0.8980392, 1, 1,
0.05306998, -0.444739, 0.99887, 0, 0.8901961, 1, 1,
0.05434068, 0.4857075, 0.3991862, 0, 0.8862745, 1, 1,
0.05615586, -2.739252, 3.278743, 0, 0.8784314, 1, 1,
0.05740923, 0.8900371, -0.04915807, 0, 0.8745098, 1, 1,
0.06573406, 0.600535, -0.05857979, 0, 0.8666667, 1, 1,
0.06714703, 1.902942, -2.011977, 0, 0.8627451, 1, 1,
0.06902543, -1.664609, 5.274859, 0, 0.854902, 1, 1,
0.07002692, -0.1728282, 3.286327, 0, 0.8509804, 1, 1,
0.07159168, -1.114308, 4.613579, 0, 0.8431373, 1, 1,
0.075313, -1.416778, 2.232588, 0, 0.8392157, 1, 1,
0.08276907, -0.6809913, 3.077092, 0, 0.8313726, 1, 1,
0.08369037, -0.5218071, 2.269194, 0, 0.827451, 1, 1,
0.08712621, -2.134792, 3.937058, 0, 0.8196079, 1, 1,
0.09055758, -0.04426966, 0.7967208, 0, 0.8156863, 1, 1,
0.09188777, 0.6877115, -0.100733, 0, 0.8078431, 1, 1,
0.09266424, 1.184533, -0.8127694, 0, 0.8039216, 1, 1,
0.0952319, 1.447969, 0.1599459, 0, 0.7960784, 1, 1,
0.09981076, -1.572101, 3.189284, 0, 0.7882353, 1, 1,
0.1008389, 0.4489936, -0.4447814, 0, 0.7843137, 1, 1,
0.1029826, 1.932937, 0.1413293, 0, 0.7764706, 1, 1,
0.1040718, -0.02471935, 0.5000722, 0, 0.772549, 1, 1,
0.1045566, 0.7550247, -0.5915939, 0, 0.7647059, 1, 1,
0.1058115, 1.156098, -0.05883105, 0, 0.7607843, 1, 1,
0.1060239, 0.2710328, 0.03400594, 0, 0.7529412, 1, 1,
0.1100285, -0.201907, 2.911959, 0, 0.7490196, 1, 1,
0.1134723, 0.8750938, 0.6914275, 0, 0.7411765, 1, 1,
0.1137737, -0.8357775, 3.754627, 0, 0.7372549, 1, 1,
0.1140843, -0.7877306, 4.43919, 0, 0.7294118, 1, 1,
0.1178868, -0.6765951, 2.771183, 0, 0.7254902, 1, 1,
0.118455, 0.2952383, 0.6081847, 0, 0.7176471, 1, 1,
0.1196334, -1.831959, 2.508077, 0, 0.7137255, 1, 1,
0.119742, 0.4487695, 1.757653, 0, 0.7058824, 1, 1,
0.1338925, -1.316205, 1.613443, 0, 0.6980392, 1, 1,
0.1351078, 0.1053608, 2.529601, 0, 0.6941177, 1, 1,
0.1373122, 1.026533, 0.378915, 0, 0.6862745, 1, 1,
0.1377837, -1.444041, 2.271863, 0, 0.682353, 1, 1,
0.13826, 2.04924, 0.1160947, 0, 0.6745098, 1, 1,
0.1383008, -1.761405, 1.80311, 0, 0.6705883, 1, 1,
0.138593, 0.7898734, -0.1124997, 0, 0.6627451, 1, 1,
0.1396139, 1.112092, 0.02972449, 0, 0.6588235, 1, 1,
0.1401711, -0.2504973, 4.236281, 0, 0.6509804, 1, 1,
0.1423596, -0.9519395, 2.950512, 0, 0.6470588, 1, 1,
0.144328, 0.7361944, -0.811173, 0, 0.6392157, 1, 1,
0.1445086, 0.920657, -0.4993109, 0, 0.6352941, 1, 1,
0.146242, -0.5527219, 3.151766, 0, 0.627451, 1, 1,
0.1477257, 0.61528, -1.294711, 0, 0.6235294, 1, 1,
0.1584289, 0.02941853, 3.281237, 0, 0.6156863, 1, 1,
0.1596348, -0.008586336, 2.76148, 0, 0.6117647, 1, 1,
0.163229, -1.152125, 3.350859, 0, 0.6039216, 1, 1,
0.1669652, -1.03454, 3.198414, 0, 0.5960785, 1, 1,
0.1683978, -0.08783668, 0.8183444, 0, 0.5921569, 1, 1,
0.1687034, -1.06872, 2.322738, 0, 0.5843138, 1, 1,
0.1704606, 0.5599393, 0.7519955, 0, 0.5803922, 1, 1,
0.1709171, -1.210235, 4.110964, 0, 0.572549, 1, 1,
0.1722125, -2.732354, 5.147122, 0, 0.5686275, 1, 1,
0.1731374, 0.1946037, 0.6366903, 0, 0.5607843, 1, 1,
0.176991, -0.08835607, 0.9899587, 0, 0.5568628, 1, 1,
0.1808597, 0.3496044, -0.05174352, 0, 0.5490196, 1, 1,
0.1813931, -0.4831067, 1.937466, 0, 0.5450981, 1, 1,
0.1856691, 0.5574843, 1.760046, 0, 0.5372549, 1, 1,
0.1914055, -0.1353389, 2.384959, 0, 0.5333334, 1, 1,
0.1945775, -0.1521349, 0.8752437, 0, 0.5254902, 1, 1,
0.1947359, -0.1788109, 1.718057, 0, 0.5215687, 1, 1,
0.1994409, 1.237732, 0.4522607, 0, 0.5137255, 1, 1,
0.2011997, 2.355505, -0.5940139, 0, 0.509804, 1, 1,
0.2055402, -1.514841, 1.663128, 0, 0.5019608, 1, 1,
0.206976, -0.09292744, 2.057185, 0, 0.4941176, 1, 1,
0.2138309, -0.9194698, 0.4959486, 0, 0.4901961, 1, 1,
0.2139759, -0.3611619, 1.976345, 0, 0.4823529, 1, 1,
0.2194704, 1.429861, -0.6410712, 0, 0.4784314, 1, 1,
0.2242792, 0.5486436, -0.6348727, 0, 0.4705882, 1, 1,
0.2271268, -0.3429768, 2.870012, 0, 0.4666667, 1, 1,
0.2278084, 0.5599946, 3.039874, 0, 0.4588235, 1, 1,
0.2301114, 0.6781593, -1.222718, 0, 0.454902, 1, 1,
0.2333183, -0.04647997, 1.802824, 0, 0.4470588, 1, 1,
0.2344979, 0.1761377, -0.9419354, 0, 0.4431373, 1, 1,
0.2351121, 0.9727923, -1.404371, 0, 0.4352941, 1, 1,
0.2365351, 1.250956, 0.2530629, 0, 0.4313726, 1, 1,
0.2450582, -0.3575793, 1.099406, 0, 0.4235294, 1, 1,
0.251615, 0.2780463, 1.938284, 0, 0.4196078, 1, 1,
0.2525162, -0.3466121, 3.93216, 0, 0.4117647, 1, 1,
0.2565769, 1.478922, 1.156271, 0, 0.4078431, 1, 1,
0.2571427, -1.772962, 0.9559931, 0, 0.4, 1, 1,
0.259249, -0.7865282, 2.783344, 0, 0.3921569, 1, 1,
0.2657108, 0.3935045, -0.8696762, 0, 0.3882353, 1, 1,
0.2717447, -0.9341019, 2.158805, 0, 0.3803922, 1, 1,
0.2741693, -0.7637315, 3.09304, 0, 0.3764706, 1, 1,
0.2771163, -0.1767799, 1.800675, 0, 0.3686275, 1, 1,
0.2772807, 0.6323703, -1.129537, 0, 0.3647059, 1, 1,
0.2909473, -0.1823471, 1.214186, 0, 0.3568628, 1, 1,
0.2918998, -1.337557, 3.153603, 0, 0.3529412, 1, 1,
0.2927676, 0.1654737, 2.757675, 0, 0.345098, 1, 1,
0.2956093, -0.9403338, 1.315413, 0, 0.3411765, 1, 1,
0.2964736, 0.596573, 1.419639, 0, 0.3333333, 1, 1,
0.2975982, -0.2506373, 1.386371, 0, 0.3294118, 1, 1,
0.2978851, 1.001181, 2.939057, 0, 0.3215686, 1, 1,
0.2992881, 1.133446, 1.025475, 0, 0.3176471, 1, 1,
0.2996161, -1.629378, 3.492834, 0, 0.3098039, 1, 1,
0.303097, 1.011345, 0.4568865, 0, 0.3058824, 1, 1,
0.3058708, -0.1750576, 2.581785, 0, 0.2980392, 1, 1,
0.3084993, -0.02727499, 0.03618893, 0, 0.2901961, 1, 1,
0.3094611, 1.014143, -0.5561463, 0, 0.2862745, 1, 1,
0.3102278, -1.548614, 3.196512, 0, 0.2784314, 1, 1,
0.3120474, 0.528116, 1.870554, 0, 0.2745098, 1, 1,
0.313142, 0.5379788, -0.05544318, 0, 0.2666667, 1, 1,
0.3150081, 2.535812, -0.4995286, 0, 0.2627451, 1, 1,
0.3152182, 0.7422865, -0.7248213, 0, 0.254902, 1, 1,
0.3161415, -2.801229, 4.196572, 0, 0.2509804, 1, 1,
0.3186118, 0.4177353, 1.862939, 0, 0.2431373, 1, 1,
0.3186247, 0.3631809, 1.163543, 0, 0.2392157, 1, 1,
0.3194256, -0.2915092, 2.213998, 0, 0.2313726, 1, 1,
0.3256371, 1.41861, 0.02989073, 0, 0.227451, 1, 1,
0.3270329, -0.2729815, 3.566348, 0, 0.2196078, 1, 1,
0.3362981, 0.6702807, -1.023311, 0, 0.2156863, 1, 1,
0.3377632, -0.1984589, 1.111505, 0, 0.2078431, 1, 1,
0.3385754, -1.018258, 2.372304, 0, 0.2039216, 1, 1,
0.3401628, 1.237705, -0.7250572, 0, 0.1960784, 1, 1,
0.3423825, 0.02817162, 0.3587325, 0, 0.1882353, 1, 1,
0.3445236, 0.1921231, 1.510676, 0, 0.1843137, 1, 1,
0.3471658, -0.6726939, 2.303277, 0, 0.1764706, 1, 1,
0.348644, 0.1919392, 1.117851, 0, 0.172549, 1, 1,
0.3510097, -0.1370201, -0.1943085, 0, 0.1647059, 1, 1,
0.3677956, 0.6942481, 0.1576508, 0, 0.1607843, 1, 1,
0.3689303, -1.112857, 3.439759, 0, 0.1529412, 1, 1,
0.3721291, 0.4716523, 0.3221339, 0, 0.1490196, 1, 1,
0.3725279, 2.154841, 0.194785, 0, 0.1411765, 1, 1,
0.3736457, -0.5592709, 1.763983, 0, 0.1372549, 1, 1,
0.384791, 0.1555156, 1.396855, 0, 0.1294118, 1, 1,
0.3864565, -1.086475, 3.517796, 0, 0.1254902, 1, 1,
0.386468, -1.520737, 1.877551, 0, 0.1176471, 1, 1,
0.3885359, -0.1087828, 1.35109, 0, 0.1137255, 1, 1,
0.3915701, -0.1497565, 1.531789, 0, 0.1058824, 1, 1,
0.3923406, 1.66465, 2.061158, 0, 0.09803922, 1, 1,
0.3980057, 0.3268879, 1.313782, 0, 0.09411765, 1, 1,
0.4034775, 0.1344942, 1.105765, 0, 0.08627451, 1, 1,
0.4038842, -0.7084021, 0.604183, 0, 0.08235294, 1, 1,
0.4052756, -0.6460143, 1.41692, 0, 0.07450981, 1, 1,
0.4057955, 1.560263, -0.9575014, 0, 0.07058824, 1, 1,
0.4092933, 0.6367386, 1.560496, 0, 0.0627451, 1, 1,
0.4134866, -1.354656, 4.249662, 0, 0.05882353, 1, 1,
0.4142673, -0.6296766, 1.198886, 0, 0.05098039, 1, 1,
0.4191051, -0.3933628, 2.724804, 0, 0.04705882, 1, 1,
0.4208758, 1.059181, 1.615028, 0, 0.03921569, 1, 1,
0.4220957, -1.615286, 1.199357, 0, 0.03529412, 1, 1,
0.4223671, -0.3208253, 2.528475, 0, 0.02745098, 1, 1,
0.4240271, 1.309881, 1.677515, 0, 0.02352941, 1, 1,
0.4252397, 1.991755, -0.5918073, 0, 0.01568628, 1, 1,
0.4255098, -0.01974021, 1.231695, 0, 0.01176471, 1, 1,
0.4269561, 0.9289522, 0.6845452, 0, 0.003921569, 1, 1,
0.4298523, -0.3663667, 0.3163567, 0.003921569, 0, 1, 1,
0.4336431, 1.118843, 1.792064, 0.007843138, 0, 1, 1,
0.4339882, 0.1550973, 1.527819, 0.01568628, 0, 1, 1,
0.4345469, 0.01256493, 3.233336, 0.01960784, 0, 1, 1,
0.4347123, -1.013086, 3.822069, 0.02745098, 0, 1, 1,
0.4350369, -0.2579347, 1.889191, 0.03137255, 0, 1, 1,
0.436847, -0.9206175, 2.574718, 0.03921569, 0, 1, 1,
0.4370681, 1.042609, 0.7603285, 0.04313726, 0, 1, 1,
0.4375362, -0.2703135, -0.2090785, 0.05098039, 0, 1, 1,
0.4399477, 1.355313, 0.4814884, 0.05490196, 0, 1, 1,
0.4423274, 1.287754, -0.8005077, 0.0627451, 0, 1, 1,
0.4440411, 0.9418142, 2.72499, 0.06666667, 0, 1, 1,
0.4463499, 0.2424673, -0.1015481, 0.07450981, 0, 1, 1,
0.4525764, 0.0893575, -0.485142, 0.07843138, 0, 1, 1,
0.4526247, -0.3616969, 1.344051, 0.08627451, 0, 1, 1,
0.453269, 0.2616594, 0.2908179, 0.09019608, 0, 1, 1,
0.4533435, -0.8817183, 2.340122, 0.09803922, 0, 1, 1,
0.4580545, 0.998825, -0.0703612, 0.1058824, 0, 1, 1,
0.4580936, -1.829201, 5.002798, 0.1098039, 0, 1, 1,
0.4582554, -0.1190316, -0.529453, 0.1176471, 0, 1, 1,
0.4618716, -2.005179, 4.771201, 0.1215686, 0, 1, 1,
0.4647994, 0.6422209, 1.058104, 0.1294118, 0, 1, 1,
0.4683718, 0.732963, -1.694397, 0.1333333, 0, 1, 1,
0.4692559, -0.07084789, 0.6829442, 0.1411765, 0, 1, 1,
0.4762233, 0.7373313, -0.8752508, 0.145098, 0, 1, 1,
0.484899, 0.1461416, 3.372404, 0.1529412, 0, 1, 1,
0.4884953, -1.276708, 3.427267, 0.1568628, 0, 1, 1,
0.4909388, 0.3729227, 1.595803, 0.1647059, 0, 1, 1,
0.491722, 0.07059394, 1.261789, 0.1686275, 0, 1, 1,
0.4922701, 2.968834, -1.048021, 0.1764706, 0, 1, 1,
0.4962769, 0.9476265, -0.2651277, 0.1803922, 0, 1, 1,
0.500661, -0.3473833, 3.9762, 0.1882353, 0, 1, 1,
0.5013526, -1.72257, 3.931857, 0.1921569, 0, 1, 1,
0.506526, 0.829506, 0.02454649, 0.2, 0, 1, 1,
0.5066055, -1.621591, 2.172763, 0.2078431, 0, 1, 1,
0.5084581, -1.850515, 2.424667, 0.2117647, 0, 1, 1,
0.5181659, -0.1965056, 1.403056, 0.2196078, 0, 1, 1,
0.5220724, -0.8244739, 0.8560075, 0.2235294, 0, 1, 1,
0.5243536, -0.8264238, 3.623341, 0.2313726, 0, 1, 1,
0.5285873, -0.4978024, 1.336209, 0.2352941, 0, 1, 1,
0.5373185, -0.6595321, 2.025343, 0.2431373, 0, 1, 1,
0.537846, -0.1794779, 2.70856, 0.2470588, 0, 1, 1,
0.5482521, -1.414018, 2.251887, 0.254902, 0, 1, 1,
0.5521092, 1.216966, 1.389777, 0.2588235, 0, 1, 1,
0.5527163, -0.9893064, 1.660185, 0.2666667, 0, 1, 1,
0.5585036, 0.3775563, 0.7172344, 0.2705882, 0, 1, 1,
0.5688515, -0.9280646, 1.314041, 0.2784314, 0, 1, 1,
0.5691576, 0.1755434, 1.480331, 0.282353, 0, 1, 1,
0.5716169, -0.461068, 0.9459045, 0.2901961, 0, 1, 1,
0.5732579, 0.8333337, 0.21947, 0.2941177, 0, 1, 1,
0.5781505, -1.672258, 3.07071, 0.3019608, 0, 1, 1,
0.5795333, 0.7617173, 1.688719, 0.3098039, 0, 1, 1,
0.584847, -0.4255968, 1.989675, 0.3137255, 0, 1, 1,
0.5858244, -2.838808, 2.816885, 0.3215686, 0, 1, 1,
0.5928321, 0.8885428, 1.691415, 0.3254902, 0, 1, 1,
0.5931217, 0.4587901, 0.7997251, 0.3333333, 0, 1, 1,
0.5971549, -0.02498749, 1.418869, 0.3372549, 0, 1, 1,
0.6082746, 0.2860788, 2.860483, 0.345098, 0, 1, 1,
0.6096027, 1.019265, 0.4107055, 0.3490196, 0, 1, 1,
0.6103599, -0.5100381, 2.250251, 0.3568628, 0, 1, 1,
0.6116312, -1.097361, 1.941018, 0.3607843, 0, 1, 1,
0.6195601, -0.1165567, 0.7388011, 0.3686275, 0, 1, 1,
0.6222068, -0.6685405, 1.422461, 0.372549, 0, 1, 1,
0.6258628, -1.9141, 2.651006, 0.3803922, 0, 1, 1,
0.6274393, 0.1953625, 1.021642, 0.3843137, 0, 1, 1,
0.6293608, 0.1983389, 0.8250775, 0.3921569, 0, 1, 1,
0.6307108, 2.358857, -0.05446986, 0.3960784, 0, 1, 1,
0.6312395, -0.1741313, 2.58214, 0.4039216, 0, 1, 1,
0.6438926, -0.2919405, 0.9458062, 0.4117647, 0, 1, 1,
0.6442796, 0.3543473, 0.9650542, 0.4156863, 0, 1, 1,
0.6490752, -1.367634, 3.899009, 0.4235294, 0, 1, 1,
0.6495896, 2.722904, 0.8752337, 0.427451, 0, 1, 1,
0.6570987, -0.4607072, 3.205473, 0.4352941, 0, 1, 1,
0.6623269, 0.9139782, 0.5951775, 0.4392157, 0, 1, 1,
0.6648152, 0.04343967, 0.1510997, 0.4470588, 0, 1, 1,
0.6670552, 0.1715567, 1.639175, 0.4509804, 0, 1, 1,
0.6715052, 0.04285932, 2.790064, 0.4588235, 0, 1, 1,
0.6751556, 0.07341681, 2.130945, 0.4627451, 0, 1, 1,
0.6777781, -0.07859285, 1.079772, 0.4705882, 0, 1, 1,
0.6886309, -0.8389009, 0.6888545, 0.4745098, 0, 1, 1,
0.6906511, 0.3204602, 1.436327, 0.4823529, 0, 1, 1,
0.6913782, -0.09058312, 0.3912246, 0.4862745, 0, 1, 1,
0.6942872, -0.250589, 0.8580885, 0.4941176, 0, 1, 1,
0.7004066, -0.3322488, 3.834509, 0.5019608, 0, 1, 1,
0.7027475, 0.07747523, 0.923506, 0.5058824, 0, 1, 1,
0.7038502, -0.9821464, 3.458162, 0.5137255, 0, 1, 1,
0.7048347, -0.7706229, 3.27316, 0.5176471, 0, 1, 1,
0.707745, 0.6377151, 0.03780701, 0.5254902, 0, 1, 1,
0.7079588, 0.1977727, 1.284715, 0.5294118, 0, 1, 1,
0.7080386, 0.2399985, -0.1337179, 0.5372549, 0, 1, 1,
0.7080986, 1.210239, -0.3060478, 0.5411765, 0, 1, 1,
0.7103614, -0.761196, 0.6131889, 0.5490196, 0, 1, 1,
0.7145517, 1.015983, 1.295585, 0.5529412, 0, 1, 1,
0.7154757, -1.444609, 2.603474, 0.5607843, 0, 1, 1,
0.7159439, -1.320047, 1.965758, 0.5647059, 0, 1, 1,
0.7162942, 1.191621, 1.719414, 0.572549, 0, 1, 1,
0.7179958, 1.744455, 0.365868, 0.5764706, 0, 1, 1,
0.7198935, -0.6236446, 2.598935, 0.5843138, 0, 1, 1,
0.7261146, -1.654974, 1.378486, 0.5882353, 0, 1, 1,
0.726183, 0.2946182, 0.5327352, 0.5960785, 0, 1, 1,
0.7263043, 0.2495398, 1.042678, 0.6039216, 0, 1, 1,
0.730234, -0.03404293, 0.7007504, 0.6078432, 0, 1, 1,
0.7329387, 1.783515, -0.5080383, 0.6156863, 0, 1, 1,
0.7344505, 0.08562695, 2.287167, 0.6196079, 0, 1, 1,
0.7360931, -0.6293036, 1.559038, 0.627451, 0, 1, 1,
0.7368068, 0.4350174, 1.081441, 0.6313726, 0, 1, 1,
0.7404682, -0.7512509, 2.321006, 0.6392157, 0, 1, 1,
0.7673097, -0.120464, 1.248993, 0.6431373, 0, 1, 1,
0.7716028, -0.4455266, 1.515933, 0.6509804, 0, 1, 1,
0.7719169, 0.7527759, 2.741644, 0.654902, 0, 1, 1,
0.7719664, -0.1581206, 2.948151, 0.6627451, 0, 1, 1,
0.7737273, 0.4610291, 0.6568779, 0.6666667, 0, 1, 1,
0.7739868, -1.292217, 2.51647, 0.6745098, 0, 1, 1,
0.7755231, 0.1807546, 0.2420908, 0.6784314, 0, 1, 1,
0.7845129, 1.130398, 1.247612, 0.6862745, 0, 1, 1,
0.7854958, -1.178025, 3.351712, 0.6901961, 0, 1, 1,
0.7867608, -0.09983998, 1.087801, 0.6980392, 0, 1, 1,
0.7950078, -0.4673332, 1.505559, 0.7058824, 0, 1, 1,
0.7990544, 0.8731721, -0.3269559, 0.7098039, 0, 1, 1,
0.7997386, -0.7059333, 2.842566, 0.7176471, 0, 1, 1,
0.8012378, 0.100752, 0.3178681, 0.7215686, 0, 1, 1,
0.801945, 0.4498859, 1.790296, 0.7294118, 0, 1, 1,
0.8080198, 2.277427, 0.08939254, 0.7333333, 0, 1, 1,
0.8112231, 1.2809, -0.4458613, 0.7411765, 0, 1, 1,
0.8132573, -0.1113194, 1.486986, 0.7450981, 0, 1, 1,
0.8143064, 0.2526798, 0.2122377, 0.7529412, 0, 1, 1,
0.8155849, 1.056845, -0.3602028, 0.7568628, 0, 1, 1,
0.8170148, 0.3737884, 1.025793, 0.7647059, 0, 1, 1,
0.8196697, 2.513854, 1.635371, 0.7686275, 0, 1, 1,
0.8234414, 1.076042, 0.4918121, 0.7764706, 0, 1, 1,
0.8259091, 1.237615, 1.172437, 0.7803922, 0, 1, 1,
0.8272997, 0.952355, 2.010045, 0.7882353, 0, 1, 1,
0.8285456, -0.38761, 2.102887, 0.7921569, 0, 1, 1,
0.8294951, 0.5381362, 1.091359, 0.8, 0, 1, 1,
0.8319538, 1.820649, -0.01426791, 0.8078431, 0, 1, 1,
0.8372158, -0.03241588, 0.4815121, 0.8117647, 0, 1, 1,
0.8380666, 0.8592004, 1.052564, 0.8196079, 0, 1, 1,
0.8444005, 0.2826663, 0.1277092, 0.8235294, 0, 1, 1,
0.8470843, -0.4216117, 4.409358, 0.8313726, 0, 1, 1,
0.850406, 0.3439339, 0.6296013, 0.8352941, 0, 1, 1,
0.8505048, 0.3309915, 0.821956, 0.8431373, 0, 1, 1,
0.8588052, -0.02558019, 1.249411, 0.8470588, 0, 1, 1,
0.8592194, 0.7036682, 0.2239724, 0.854902, 0, 1, 1,
0.8658783, 0.4984864, 1.097273, 0.8588235, 0, 1, 1,
0.8691282, 1.056356, 2.139521, 0.8666667, 0, 1, 1,
0.8697763, 0.8172905, 1.13725, 0.8705882, 0, 1, 1,
0.8716764, -1.76877, 4.140498, 0.8784314, 0, 1, 1,
0.8737981, -0.2022448, 2.158589, 0.8823529, 0, 1, 1,
0.8741257, 0.6982793, 0.5400551, 0.8901961, 0, 1, 1,
0.8865756, 0.07209241, 3.003741, 0.8941177, 0, 1, 1,
0.8897006, 1.485722, -1.965589, 0.9019608, 0, 1, 1,
0.8973661, 0.9917891, 2.327725, 0.9098039, 0, 1, 1,
0.8974431, -0.6993885, 4.38527, 0.9137255, 0, 1, 1,
0.9010684, -0.7652694, 1.992157, 0.9215686, 0, 1, 1,
0.9060425, 1.031044, -0.03683484, 0.9254902, 0, 1, 1,
0.9096565, 0.719591, 1.489601, 0.9333333, 0, 1, 1,
0.9187504, 0.4900019, 0.8886423, 0.9372549, 0, 1, 1,
0.9358459, -0.4777954, 0.3327287, 0.945098, 0, 1, 1,
0.9423898, 1.915152, 0.6175964, 0.9490196, 0, 1, 1,
0.9433206, -1.077887, 2.42239, 0.9568627, 0, 1, 1,
0.9570644, -1.223266, 3.027244, 0.9607843, 0, 1, 1,
0.9667742, -1.003454, 1.749605, 0.9686275, 0, 1, 1,
0.966952, -1.185821, 1.534937, 0.972549, 0, 1, 1,
0.9879205, -1.002581, 0.7467372, 0.9803922, 0, 1, 1,
0.9880944, 2.794291, 0.5390913, 0.9843137, 0, 1, 1,
0.9901597, 0.4059947, 1.345833, 0.9921569, 0, 1, 1,
0.9912464, -1.01168, 2.011305, 0.9960784, 0, 1, 1,
0.993667, -2.337809, 3.190337, 1, 0, 0.9960784, 1,
0.993793, 0.4361738, 2.702145, 1, 0, 0.9882353, 1,
0.9957885, -1.507253, 3.09673, 1, 0, 0.9843137, 1,
0.9969302, 0.2909803, 3.349639, 1, 0, 0.9764706, 1,
1.004839, 0.5200292, 3.306501, 1, 0, 0.972549, 1,
1.012812, -0.1144321, 2.410904, 1, 0, 0.9647059, 1,
1.016623, 0.9902912, -0.4874522, 1, 0, 0.9607843, 1,
1.021983, -1.407009, 4.124532, 1, 0, 0.9529412, 1,
1.022254, 1.096211, 1.124475, 1, 0, 0.9490196, 1,
1.026201, 1.263133, 0.3955118, 1, 0, 0.9411765, 1,
1.04008, 1.264622, 0.9151249, 1, 0, 0.9372549, 1,
1.041467, -0.3846847, 4.096983, 1, 0, 0.9294118, 1,
1.044351, -1.915124, 4.719844, 1, 0, 0.9254902, 1,
1.052669, 1.225813, -0.3271185, 1, 0, 0.9176471, 1,
1.060968, -0.1170532, 2.670644, 1, 0, 0.9137255, 1,
1.066039, -0.8388601, 3.537405, 1, 0, 0.9058824, 1,
1.070904, -1.770234, 2.642662, 1, 0, 0.9019608, 1,
1.076885, -0.8656856, 1.185798, 1, 0, 0.8941177, 1,
1.079899, 1.468231, 2.685689, 1, 0, 0.8862745, 1,
1.08552, 0.3489044, 1.498345, 1, 0, 0.8823529, 1,
1.088889, 0.4708693, 0.8791498, 1, 0, 0.8745098, 1,
1.091123, 0.06546075, 1.063504, 1, 0, 0.8705882, 1,
1.098824, -0.2907284, 0.641048, 1, 0, 0.8627451, 1,
1.1011, 0.216114, 1.042183, 1, 0, 0.8588235, 1,
1.101334, -0.6255856, 0.1213571, 1, 0, 0.8509804, 1,
1.109411, -0.9622601, 3.846056, 1, 0, 0.8470588, 1,
1.110157, 1.126278, 1.060631, 1, 0, 0.8392157, 1,
1.111207, 0.4236814, 1.612541, 1, 0, 0.8352941, 1,
1.112255, 0.8689874, 1.308687, 1, 0, 0.827451, 1,
1.116357, -0.4458649, 3.873782, 1, 0, 0.8235294, 1,
1.118141, -1.848107, 1.662873, 1, 0, 0.8156863, 1,
1.121258, 2.371699, -1.344449, 1, 0, 0.8117647, 1,
1.127589, -0.2069939, 3.297033, 1, 0, 0.8039216, 1,
1.134614, -1.790138, 2.470202, 1, 0, 0.7960784, 1,
1.14003, 0.1433699, 1.39146, 1, 0, 0.7921569, 1,
1.140182, -0.6596682, 2.379153, 1, 0, 0.7843137, 1,
1.141708, -0.3653973, 1.601145, 1, 0, 0.7803922, 1,
1.142271, -0.486465, 3.434819, 1, 0, 0.772549, 1,
1.142716, 0.1451005, 0.870757, 1, 0, 0.7686275, 1,
1.143937, 0.8193921, 2.147101, 1, 0, 0.7607843, 1,
1.150807, -0.2128325, 1.18674, 1, 0, 0.7568628, 1,
1.152054, -0.1336384, 0.9360268, 1, 0, 0.7490196, 1,
1.152367, -0.7649374, 2.030778, 1, 0, 0.7450981, 1,
1.153552, 0.7516712, 0.2900644, 1, 0, 0.7372549, 1,
1.157281, 0.3384922, 1.230827, 1, 0, 0.7333333, 1,
1.162435, -0.5090224, 1.428344, 1, 0, 0.7254902, 1,
1.166482, 0.001003394, 0.02364165, 1, 0, 0.7215686, 1,
1.176887, -0.3522644, 0.9885168, 1, 0, 0.7137255, 1,
1.188872, -1.11017, 2.22622, 1, 0, 0.7098039, 1,
1.1948, -0.8501142, 1.001984, 1, 0, 0.7019608, 1,
1.200799, 0.8248725, 0.9574727, 1, 0, 0.6941177, 1,
1.205753, -0.497256, 0.9642591, 1, 0, 0.6901961, 1,
1.212212, 0.5290845, 1.69007, 1, 0, 0.682353, 1,
1.216214, 1.124161, 0.6074202, 1, 0, 0.6784314, 1,
1.216367, -1.086198, 3.654534, 1, 0, 0.6705883, 1,
1.218725, 0.9391499, -1.544619, 1, 0, 0.6666667, 1,
1.226902, -0.05993604, 3.088211, 1, 0, 0.6588235, 1,
1.234058, 0.5555668, 1.991602, 1, 0, 0.654902, 1,
1.240289, -1.015742, 1.794317, 1, 0, 0.6470588, 1,
1.248974, 0.3084162, 1.133257, 1, 0, 0.6431373, 1,
1.257472, -0.6148294, 0.4187765, 1, 0, 0.6352941, 1,
1.263697, -0.3165168, 0.5601245, 1, 0, 0.6313726, 1,
1.264739, 0.8200951, 1.432595, 1, 0, 0.6235294, 1,
1.279081, 0.08917364, 0.720518, 1, 0, 0.6196079, 1,
1.291754, -1.981884, 1.598014, 1, 0, 0.6117647, 1,
1.294628, 0.7143701, 1.703793, 1, 0, 0.6078432, 1,
1.295603, -1.330852, 4.037283, 1, 0, 0.6, 1,
1.306886, 0.3063523, 0.3673727, 1, 0, 0.5921569, 1,
1.317357, 0.8172294, 0.7384942, 1, 0, 0.5882353, 1,
1.321573, 0.6139432, 2.190295, 1, 0, 0.5803922, 1,
1.323106, 0.2179424, -0.4062041, 1, 0, 0.5764706, 1,
1.350911, -1.523521, 3.559221, 1, 0, 0.5686275, 1,
1.355746, -0.7212445, 0.6752092, 1, 0, 0.5647059, 1,
1.362661, -0.02132006, 0.463188, 1, 0, 0.5568628, 1,
1.364592, -0.1940999, 0.2920109, 1, 0, 0.5529412, 1,
1.365779, 0.5066735, 1.912082, 1, 0, 0.5450981, 1,
1.380377, -0.1600231, 2.697186, 1, 0, 0.5411765, 1,
1.393234, 1.736063, 0.3671901, 1, 0, 0.5333334, 1,
1.397574, 0.3852872, 0.04879123, 1, 0, 0.5294118, 1,
1.402816, -0.5512342, 0.7238361, 1, 0, 0.5215687, 1,
1.409154, 0.08642159, 2.499151, 1, 0, 0.5176471, 1,
1.414779, 0.5468429, 1.487286, 1, 0, 0.509804, 1,
1.418864, -0.01838691, 0.2506869, 1, 0, 0.5058824, 1,
1.418866, -0.2822704, -0.3956288, 1, 0, 0.4980392, 1,
1.42288, 0.8122714, 1.391708, 1, 0, 0.4901961, 1,
1.42906, 0.07179628, 0.5906883, 1, 0, 0.4862745, 1,
1.431981, -0.3797193, 1.531653, 1, 0, 0.4784314, 1,
1.433506, -0.4475434, 2.123408, 1, 0, 0.4745098, 1,
1.45252, 0.305139, 0.9324233, 1, 0, 0.4666667, 1,
1.454821, 0.1159848, 0.9674132, 1, 0, 0.4627451, 1,
1.461421, 1.155417, -0.04680127, 1, 0, 0.454902, 1,
1.465061, 0.03878264, 0.1487492, 1, 0, 0.4509804, 1,
1.471484, 0.9557717, 0.49235, 1, 0, 0.4431373, 1,
1.477709, -0.4466551, 0.5834834, 1, 0, 0.4392157, 1,
1.504507, 0.588561, 2.19759, 1, 0, 0.4313726, 1,
1.504788, 0.610313, 0.5810083, 1, 0, 0.427451, 1,
1.508612, -1.274075, 1.95662, 1, 0, 0.4196078, 1,
1.509339, 1.229055, 0.8023308, 1, 0, 0.4156863, 1,
1.51008, -2.014321, 2.67301, 1, 0, 0.4078431, 1,
1.51898, -1.029587, 2.574168, 1, 0, 0.4039216, 1,
1.534064, -1.127929, 3.696155, 1, 0, 0.3960784, 1,
1.541824, 0.01407899, 0.5577293, 1, 0, 0.3882353, 1,
1.550406, -1.442201, 4.222717, 1, 0, 0.3843137, 1,
1.552863, 0.8541355, -0.5569935, 1, 0, 0.3764706, 1,
1.558212, -0.1670443, 1.5444, 1, 0, 0.372549, 1,
1.601438, -0.1489265, 1.389897, 1, 0, 0.3647059, 1,
1.602674, -1.022845, 3.238062, 1, 0, 0.3607843, 1,
1.615392, -0.8864582, 0.9494127, 1, 0, 0.3529412, 1,
1.618791, 0.5629929, 0.7188181, 1, 0, 0.3490196, 1,
1.620832, -2.129751, 5.131522, 1, 0, 0.3411765, 1,
1.62438, -0.2160796, 1.288211, 1, 0, 0.3372549, 1,
1.631854, -0.461354, 3.616987, 1, 0, 0.3294118, 1,
1.651831, 0.7519562, -0.2256355, 1, 0, 0.3254902, 1,
1.655246, 0.6031425, 1.635294, 1, 0, 0.3176471, 1,
1.656401, -0.8903378, 2.046617, 1, 0, 0.3137255, 1,
1.659655, -0.6533153, 2.552503, 1, 0, 0.3058824, 1,
1.660325, -0.5878695, 0.7316063, 1, 0, 0.2980392, 1,
1.663044, 0.7492267, 0.8984486, 1, 0, 0.2941177, 1,
1.667149, -0.6476701, 2.077761, 1, 0, 0.2862745, 1,
1.672164, 0.9511779, 1.088132, 1, 0, 0.282353, 1,
1.672814, -0.4606835, 4.096788, 1, 0, 0.2745098, 1,
1.677285, -0.4787843, 3.786705, 1, 0, 0.2705882, 1,
1.686921, 0.1523927, 1.115855, 1, 0, 0.2627451, 1,
1.689326, 0.7016757, 0.9488607, 1, 0, 0.2588235, 1,
1.693441, 0.3573557, 2.896613, 1, 0, 0.2509804, 1,
1.694654, 0.7805865, 0.6897224, 1, 0, 0.2470588, 1,
1.705911, -1.328423, 1.013297, 1, 0, 0.2392157, 1,
1.709886, -1.518723, 3.361795, 1, 0, 0.2352941, 1,
1.720789, 0.871886, 1.323599, 1, 0, 0.227451, 1,
1.741215, 0.3133874, 1.093448, 1, 0, 0.2235294, 1,
1.76556, 0.01751758, 0.7446462, 1, 0, 0.2156863, 1,
1.773263, 0.230641, 2.774479, 1, 0, 0.2117647, 1,
1.786763, -0.9405673, 1.175186, 1, 0, 0.2039216, 1,
1.789975, 0.3579663, 1.142111, 1, 0, 0.1960784, 1,
1.814278, -0.4581391, 4.148152, 1, 0, 0.1921569, 1,
1.826642, 0.09462275, 0.2170163, 1, 0, 0.1843137, 1,
1.851247, -0.07634995, 2.172388, 1, 0, 0.1803922, 1,
1.8594, 0.7788582, 1.074701, 1, 0, 0.172549, 1,
1.888904, 1.411683, 1.723065, 1, 0, 0.1686275, 1,
1.889438, -0.6020139, 1.917031, 1, 0, 0.1607843, 1,
1.892869, -0.6822556, 1.91397, 1, 0, 0.1568628, 1,
1.90831, 1.290232, -0.5289698, 1, 0, 0.1490196, 1,
1.908813, -0.2807572, 0.721159, 1, 0, 0.145098, 1,
1.994733, 0.9469506, 2.413782, 1, 0, 0.1372549, 1,
1.995114, 0.1969199, 2.320076, 1, 0, 0.1333333, 1,
2.035017, 0.4478834, 0.8489691, 1, 0, 0.1254902, 1,
2.039672, 0.4200972, -0.0741083, 1, 0, 0.1215686, 1,
2.127262, 0.04294841, 0.852805, 1, 0, 0.1137255, 1,
2.16264, -1.513136, 2.721588, 1, 0, 0.1098039, 1,
2.18917, -0.1560469, 0.6760831, 1, 0, 0.1019608, 1,
2.19045, -0.9660904, 2.615108, 1, 0, 0.09411765, 1,
2.195134, -1.798032, 3.175222, 1, 0, 0.09019608, 1,
2.204335, -0.5958734, 2.325548, 1, 0, 0.08235294, 1,
2.207136, -0.3335845, 2.283391, 1, 0, 0.07843138, 1,
2.213728, 2.028901, 1.878296, 1, 0, 0.07058824, 1,
2.214131, 2.758233, -0.08247721, 1, 0, 0.06666667, 1,
2.23252, 0.7646406, 3.323932, 1, 0, 0.05882353, 1,
2.284586, 2.505028, -0.2113657, 1, 0, 0.05490196, 1,
2.310669, -0.9366887, 2.494774, 1, 0, 0.04705882, 1,
2.540633, -0.3224752, 2.441047, 1, 0, 0.04313726, 1,
2.543345, -0.7454711, 1.965461, 1, 0, 0.03529412, 1,
2.562334, 0.1525733, 1.955917, 1, 0, 0.03137255, 1,
2.619862, 2.002308, -0.2001776, 1, 0, 0.02352941, 1,
2.940163, -1.417871, 2.501016, 1, 0, 0.01960784, 1,
3.007491, -0.2558312, 0.7088048, 1, 0, 0.01176471, 1,
3.074152, 1.775556, 3.250417, 1, 0, 0.007843138, 1
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
-0.2491162, -3.972924, -6.8772, 0, -0.5, 0.5, 0.5,
-0.2491162, -3.972924, -6.8772, 1, -0.5, 0.5, 0.5,
-0.2491162, -3.972924, -6.8772, 1, 1.5, 0.5, 0.5,
-0.2491162, -3.972924, -6.8772, 0, 1.5, 0.5, 0.5
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
-4.698973, 0.001002669, -6.8772, 0, -0.5, 0.5, 0.5,
-4.698973, 0.001002669, -6.8772, 1, -0.5, 0.5, 0.5,
-4.698973, 0.001002669, -6.8772, 1, 1.5, 0.5, 0.5,
-4.698973, 0.001002669, -6.8772, 0, 1.5, 0.5, 0.5
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
-4.698973, -3.972924, 0.07945156, 0, -0.5, 0.5, 0.5,
-4.698973, -3.972924, 0.07945156, 1, -0.5, 0.5, 0.5,
-4.698973, -3.972924, 0.07945156, 1, 1.5, 0.5, 0.5,
-4.698973, -3.972924, 0.07945156, 0, 1.5, 0.5, 0.5
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
-3, -3.055864, -5.271819,
3, -3.055864, -5.271819,
-3, -3.055864, -5.271819,
-3, -3.208707, -5.539382,
-2, -3.055864, -5.271819,
-2, -3.208707, -5.539382,
-1, -3.055864, -5.271819,
-1, -3.208707, -5.539382,
0, -3.055864, -5.271819,
0, -3.208707, -5.539382,
1, -3.055864, -5.271819,
1, -3.208707, -5.539382,
2, -3.055864, -5.271819,
2, -3.208707, -5.539382,
3, -3.055864, -5.271819,
3, -3.208707, -5.539382
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
-3, -3.514394, -6.074509, 0, -0.5, 0.5, 0.5,
-3, -3.514394, -6.074509, 1, -0.5, 0.5, 0.5,
-3, -3.514394, -6.074509, 1, 1.5, 0.5, 0.5,
-3, -3.514394, -6.074509, 0, 1.5, 0.5, 0.5,
-2, -3.514394, -6.074509, 0, -0.5, 0.5, 0.5,
-2, -3.514394, -6.074509, 1, -0.5, 0.5, 0.5,
-2, -3.514394, -6.074509, 1, 1.5, 0.5, 0.5,
-2, -3.514394, -6.074509, 0, 1.5, 0.5, 0.5,
-1, -3.514394, -6.074509, 0, -0.5, 0.5, 0.5,
-1, -3.514394, -6.074509, 1, -0.5, 0.5, 0.5,
-1, -3.514394, -6.074509, 1, 1.5, 0.5, 0.5,
-1, -3.514394, -6.074509, 0, 1.5, 0.5, 0.5,
0, -3.514394, -6.074509, 0, -0.5, 0.5, 0.5,
0, -3.514394, -6.074509, 1, -0.5, 0.5, 0.5,
0, -3.514394, -6.074509, 1, 1.5, 0.5, 0.5,
0, -3.514394, -6.074509, 0, 1.5, 0.5, 0.5,
1, -3.514394, -6.074509, 0, -0.5, 0.5, 0.5,
1, -3.514394, -6.074509, 1, -0.5, 0.5, 0.5,
1, -3.514394, -6.074509, 1, 1.5, 0.5, 0.5,
1, -3.514394, -6.074509, 0, 1.5, 0.5, 0.5,
2, -3.514394, -6.074509, 0, -0.5, 0.5, 0.5,
2, -3.514394, -6.074509, 1, -0.5, 0.5, 0.5,
2, -3.514394, -6.074509, 1, 1.5, 0.5, 0.5,
2, -3.514394, -6.074509, 0, 1.5, 0.5, 0.5,
3, -3.514394, -6.074509, 0, -0.5, 0.5, 0.5,
3, -3.514394, -6.074509, 1, -0.5, 0.5, 0.5,
3, -3.514394, -6.074509, 1, 1.5, 0.5, 0.5,
3, -3.514394, -6.074509, 0, 1.5, 0.5, 0.5
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
-3.672083, -2, -5.271819,
-3.672083, 2, -5.271819,
-3.672083, -2, -5.271819,
-3.843231, -2, -5.539382,
-3.672083, -1, -5.271819,
-3.843231, -1, -5.539382,
-3.672083, 0, -5.271819,
-3.843231, 0, -5.539382,
-3.672083, 1, -5.271819,
-3.843231, 1, -5.539382,
-3.672083, 2, -5.271819,
-3.843231, 2, -5.539382
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
-4.185528, -2, -6.074509, 0, -0.5, 0.5, 0.5,
-4.185528, -2, -6.074509, 1, -0.5, 0.5, 0.5,
-4.185528, -2, -6.074509, 1, 1.5, 0.5, 0.5,
-4.185528, -2, -6.074509, 0, 1.5, 0.5, 0.5,
-4.185528, -1, -6.074509, 0, -0.5, 0.5, 0.5,
-4.185528, -1, -6.074509, 1, -0.5, 0.5, 0.5,
-4.185528, -1, -6.074509, 1, 1.5, 0.5, 0.5,
-4.185528, -1, -6.074509, 0, 1.5, 0.5, 0.5,
-4.185528, 0, -6.074509, 0, -0.5, 0.5, 0.5,
-4.185528, 0, -6.074509, 1, -0.5, 0.5, 0.5,
-4.185528, 0, -6.074509, 1, 1.5, 0.5, 0.5,
-4.185528, 0, -6.074509, 0, 1.5, 0.5, 0.5,
-4.185528, 1, -6.074509, 0, -0.5, 0.5, 0.5,
-4.185528, 1, -6.074509, 1, -0.5, 0.5, 0.5,
-4.185528, 1, -6.074509, 1, 1.5, 0.5, 0.5,
-4.185528, 1, -6.074509, 0, 1.5, 0.5, 0.5,
-4.185528, 2, -6.074509, 0, -0.5, 0.5, 0.5,
-4.185528, 2, -6.074509, 1, -0.5, 0.5, 0.5,
-4.185528, 2, -6.074509, 1, 1.5, 0.5, 0.5,
-4.185528, 2, -6.074509, 0, 1.5, 0.5, 0.5
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
-3.672083, -3.055864, -4,
-3.672083, -3.055864, 4,
-3.672083, -3.055864, -4,
-3.843231, -3.208707, -4,
-3.672083, -3.055864, -2,
-3.843231, -3.208707, -2,
-3.672083, -3.055864, 0,
-3.843231, -3.208707, 0,
-3.672083, -3.055864, 2,
-3.843231, -3.208707, 2,
-3.672083, -3.055864, 4,
-3.843231, -3.208707, 4
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
-4.185528, -3.514394, -4, 0, -0.5, 0.5, 0.5,
-4.185528, -3.514394, -4, 1, -0.5, 0.5, 0.5,
-4.185528, -3.514394, -4, 1, 1.5, 0.5, 0.5,
-4.185528, -3.514394, -4, 0, 1.5, 0.5, 0.5,
-4.185528, -3.514394, -2, 0, -0.5, 0.5, 0.5,
-4.185528, -3.514394, -2, 1, -0.5, 0.5, 0.5,
-4.185528, -3.514394, -2, 1, 1.5, 0.5, 0.5,
-4.185528, -3.514394, -2, 0, 1.5, 0.5, 0.5,
-4.185528, -3.514394, 0, 0, -0.5, 0.5, 0.5,
-4.185528, -3.514394, 0, 1, -0.5, 0.5, 0.5,
-4.185528, -3.514394, 0, 1, 1.5, 0.5, 0.5,
-4.185528, -3.514394, 0, 0, 1.5, 0.5, 0.5,
-4.185528, -3.514394, 2, 0, -0.5, 0.5, 0.5,
-4.185528, -3.514394, 2, 1, -0.5, 0.5, 0.5,
-4.185528, -3.514394, 2, 1, 1.5, 0.5, 0.5,
-4.185528, -3.514394, 2, 0, 1.5, 0.5, 0.5,
-4.185528, -3.514394, 4, 0, -0.5, 0.5, 0.5,
-4.185528, -3.514394, 4, 1, -0.5, 0.5, 0.5,
-4.185528, -3.514394, 4, 1, 1.5, 0.5, 0.5,
-4.185528, -3.514394, 4, 0, 1.5, 0.5, 0.5
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
-3.672083, -3.055864, -5.271819,
-3.672083, 3.057869, -5.271819,
-3.672083, -3.055864, 5.430722,
-3.672083, 3.057869, 5.430722,
-3.672083, -3.055864, -5.271819,
-3.672083, -3.055864, 5.430722,
-3.672083, 3.057869, -5.271819,
-3.672083, 3.057869, 5.430722,
-3.672083, -3.055864, -5.271819,
3.17385, -3.055864, -5.271819,
-3.672083, -3.055864, 5.430722,
3.17385, -3.055864, 5.430722,
-3.672083, 3.057869, -5.271819,
3.17385, 3.057869, -5.271819,
-3.672083, 3.057869, 5.430722,
3.17385, 3.057869, 5.430722,
3.17385, -3.055864, -5.271819,
3.17385, 3.057869, -5.271819,
3.17385, -3.055864, 5.430722,
3.17385, 3.057869, 5.430722,
3.17385, -3.055864, -5.271819,
3.17385, -3.055864, 5.430722,
3.17385, 3.057869, -5.271819,
3.17385, 3.057869, 5.430722
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
var radius = 7.528727;
var distance = 33.49615;
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
mvMatrix.translate( 0.2491162, -0.001002669, -0.07945156 );
mvMatrix.scale( 1.189057, 1.331463, 0.7605864 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.49615);
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
Demeton<-read.table("Demeton.xyz")
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
-3.572385, -0.2134759, -1.732649, 0, 0, 1, 1, 1,
-3.006332, 1.191186, -0.9420561, 1, 0, 0, 1, 1,
-2.624593, -1.655596, -3.387496, 1, 0, 0, 1, 1,
-2.591744, -0.3768747, -0.7754642, 1, 0, 0, 1, 1,
-2.516427, 0.07476982, 0.9155619, 1, 0, 0, 1, 1,
-2.29681, -0.9163322, -2.453722, 1, 0, 0, 1, 1,
-2.280942, -0.3778616, -2.167397, 0, 0, 0, 1, 1,
-2.276323, 0.7039384, -1.075863, 0, 0, 0, 1, 1,
-2.262004, -0.4792418, -2.89695, 0, 0, 0, 1, 1,
-2.236517, -0.9543719, -1.79204, 0, 0, 0, 1, 1,
-2.213737, 0.2424752, 0.4495387, 0, 0, 0, 1, 1,
-2.186119, -1.546785, -1.54169, 0, 0, 0, 1, 1,
-2.182029, -1.490955, -1.525138, 0, 0, 0, 1, 1,
-2.145805, 0.1288578, -0.8292415, 1, 1, 1, 1, 1,
-2.139292, -1.633647, -1.647887, 1, 1, 1, 1, 1,
-2.112746, -0.9415939, -3.596025, 1, 1, 1, 1, 1,
-2.092072, 0.1005622, -1.364138, 1, 1, 1, 1, 1,
-2.079883, -0.4125167, -2.163743, 1, 1, 1, 1, 1,
-2.072867, -0.3994373, -1.224788, 1, 1, 1, 1, 1,
-2.065865, 0.01289897, -0.8626677, 1, 1, 1, 1, 1,
-2.035774, 0.3884954, -1.066282, 1, 1, 1, 1, 1,
-2.02626, -1.320646, -2.823722, 1, 1, 1, 1, 1,
-1.980019, 2.263943, -1.242452, 1, 1, 1, 1, 1,
-1.975942, -1.165396, -3.164236, 1, 1, 1, 1, 1,
-1.95067, 1.608146, -1.119435, 1, 1, 1, 1, 1,
-1.909021, -0.6630417, -0.3908333, 1, 1, 1, 1, 1,
-1.902629, 0.4224746, -3.299291, 1, 1, 1, 1, 1,
-1.900676, 0.5373175, -1.880078, 1, 1, 1, 1, 1,
-1.870315, -0.7242541, -2.977386, 0, 0, 1, 1, 1,
-1.810881, 0.9956171, 0.1042057, 1, 0, 0, 1, 1,
-1.806837, -0.0005605075, -0.620807, 1, 0, 0, 1, 1,
-1.803233, -0.3408855, -0.938759, 1, 0, 0, 1, 1,
-1.771281, -1.783041, -3.127265, 1, 0, 0, 1, 1,
-1.766203, 1.129165, -2.116795, 1, 0, 0, 1, 1,
-1.765479, 0.1058389, 1.033749, 0, 0, 0, 1, 1,
-1.759411, 0.6518566, -2.005873, 0, 0, 0, 1, 1,
-1.754894, 1.013117, -0.5034809, 0, 0, 0, 1, 1,
-1.720183, 0.4683556, -2.149119, 0, 0, 0, 1, 1,
-1.672422, -0.8499978, -1.752653, 0, 0, 0, 1, 1,
-1.667089, 0.4953148, -0.9168943, 0, 0, 0, 1, 1,
-1.661372, -0.1087576, -1.888022, 0, 0, 0, 1, 1,
-1.661005, -1.296887, -1.798202, 1, 1, 1, 1, 1,
-1.648166, 0.3026067, -1.939488, 1, 1, 1, 1, 1,
-1.623838, 1.119725, 0.3307863, 1, 1, 1, 1, 1,
-1.617906, 2.795477, -1.683524, 1, 1, 1, 1, 1,
-1.61431, -1.385973, -2.115376, 1, 1, 1, 1, 1,
-1.600445, 0.6686623, -0.4022629, 1, 1, 1, 1, 1,
-1.59899, -0.3890244, -3.391492, 1, 1, 1, 1, 1,
-1.595683, 1.766188, -1.05045, 1, 1, 1, 1, 1,
-1.5874, -1.993926, -1.13268, 1, 1, 1, 1, 1,
-1.581818, 0.8344751, -2.267621, 1, 1, 1, 1, 1,
-1.555099, -0.4881622, -1.412566, 1, 1, 1, 1, 1,
-1.553401, 0.9114148, -1.233032, 1, 1, 1, 1, 1,
-1.550696, 1.604654, 0.5886762, 1, 1, 1, 1, 1,
-1.537037, 0.3663361, -0.6589444, 1, 1, 1, 1, 1,
-1.53275, -0.3364355, -2.422116, 1, 1, 1, 1, 1,
-1.52893, 0.0181697, -0.03086233, 0, 0, 1, 1, 1,
-1.499712, -0.6747522, -2.264548, 1, 0, 0, 1, 1,
-1.498408, -0.369833, -2.165332, 1, 0, 0, 1, 1,
-1.495343, -0.3398791, -0.8583321, 1, 0, 0, 1, 1,
-1.491741, -0.4592303, -0.8600672, 1, 0, 0, 1, 1,
-1.481011, 0.07804994, -1.100202, 1, 0, 0, 1, 1,
-1.478903, 0.8698806, -2.294809, 0, 0, 0, 1, 1,
-1.472751, -0.8543663, -2.480735, 0, 0, 0, 1, 1,
-1.450015, -0.4699463, -1.940378, 0, 0, 0, 1, 1,
-1.423264, -1.311131, -2.485392, 0, 0, 0, 1, 1,
-1.418265, -0.8482204, -3.300035, 0, 0, 0, 1, 1,
-1.415427, 0.1549746, -0.7394297, 0, 0, 0, 1, 1,
-1.411624, -1.466108, -0.9117643, 0, 0, 0, 1, 1,
-1.401959, -1.632875, -2.825274, 1, 1, 1, 1, 1,
-1.399817, -1.747374, -1.844735, 1, 1, 1, 1, 1,
-1.383824, -0.2550741, -0.1614213, 1, 1, 1, 1, 1,
-1.380071, -0.3209306, -1.39037, 1, 1, 1, 1, 1,
-1.378111, 1.591477, -2.019665, 1, 1, 1, 1, 1,
-1.376384, 1.50598, -1.006152, 1, 1, 1, 1, 1,
-1.364805, -0.4512081, -1.735672, 1, 1, 1, 1, 1,
-1.362715, -0.6259395, -2.950445, 1, 1, 1, 1, 1,
-1.35523, 0.8371943, -0.8915038, 1, 1, 1, 1, 1,
-1.339441, -0.1549588, -3.639322, 1, 1, 1, 1, 1,
-1.333102, 0.9129558, -1.638657, 1, 1, 1, 1, 1,
-1.323254, 0.008473882, -2.565809, 1, 1, 1, 1, 1,
-1.319818, 0.889819, -0.6597699, 1, 1, 1, 1, 1,
-1.311165, 1.996107, -0.7683107, 1, 1, 1, 1, 1,
-1.302382, 0.6135232, -0.01766349, 1, 1, 1, 1, 1,
-1.299354, 0.1176045, -1.472802, 0, 0, 1, 1, 1,
-1.290814, 0.3267759, -2.828598, 1, 0, 0, 1, 1,
-1.287391, 0.2989231, -0.8421078, 1, 0, 0, 1, 1,
-1.282643, 0.9674243, -0.6992326, 1, 0, 0, 1, 1,
-1.279433, -1.082161, -2.226805, 1, 0, 0, 1, 1,
-1.278664, -0.3453433, -3.193472, 1, 0, 0, 1, 1,
-1.273063, 1.026315, -1.32095, 0, 0, 0, 1, 1,
-1.270511, 0.1351722, -2.088746, 0, 0, 0, 1, 1,
-1.268072, -0.5868679, -2.309807, 0, 0, 0, 1, 1,
-1.253315, -0.4210148, -1.663857, 0, 0, 0, 1, 1,
-1.248238, -1.229151, -2.870708, 0, 0, 0, 1, 1,
-1.228015, 0.1986918, -0.7385689, 0, 0, 0, 1, 1,
-1.226682, 0.2723119, -0.3244021, 0, 0, 0, 1, 1,
-1.22657, 1.900292, 0.2458848, 1, 1, 1, 1, 1,
-1.224956, -1.368198, -2.338043, 1, 1, 1, 1, 1,
-1.22231, -0.4483818, -3.662726, 1, 1, 1, 1, 1,
-1.222227, -0.03970222, -1.371169, 1, 1, 1, 1, 1,
-1.221522, -0.3095013, -2.60226, 1, 1, 1, 1, 1,
-1.207329, 2.308782, -0.636779, 1, 1, 1, 1, 1,
-1.204032, 0.9432971, -1.135761, 1, 1, 1, 1, 1,
-1.193756, 0.3900897, -3.085896, 1, 1, 1, 1, 1,
-1.192056, 1.180024, 0.7623244, 1, 1, 1, 1, 1,
-1.189736, 0.42246, 0.4753754, 1, 1, 1, 1, 1,
-1.18086, -0.437382, -2.712085, 1, 1, 1, 1, 1,
-1.177449, 0.1765705, -2.46333, 1, 1, 1, 1, 1,
-1.17568, -0.6073201, -0.9361258, 1, 1, 1, 1, 1,
-1.172309, -0.5881304, -2.751523, 1, 1, 1, 1, 1,
-1.154688, 0.2154999, -2.088932, 1, 1, 1, 1, 1,
-1.153602, -1.604836, -3.994233, 0, 0, 1, 1, 1,
-1.151902, -0.8487816, -3.38841, 1, 0, 0, 1, 1,
-1.14465, 1.69435, 0.4766612, 1, 0, 0, 1, 1,
-1.142748, 2.421857, -0.6125693, 1, 0, 0, 1, 1,
-1.140736, -0.1354135, -2.792668, 1, 0, 0, 1, 1,
-1.140155, -0.4853293, -2.518082, 1, 0, 0, 1, 1,
-1.137229, 0.8668304, 0.1952536, 0, 0, 0, 1, 1,
-1.133715, -0.8918421, -2.621065, 0, 0, 0, 1, 1,
-1.131021, 1.542542, 0.2776982, 0, 0, 0, 1, 1,
-1.122247, 0.1903114, -1.44774, 0, 0, 0, 1, 1,
-1.120526, 2.759993, -0.8448397, 0, 0, 0, 1, 1,
-1.12045, -0.4470167, -0.5625048, 0, 0, 0, 1, 1,
-1.119917, -1.648908, -2.661827, 0, 0, 0, 1, 1,
-1.118049, -0.7752896, -4.96604, 1, 1, 1, 1, 1,
-1.117009, -0.5045063, -2.081361, 1, 1, 1, 1, 1,
-1.107795, -0.2787892, -1.701938, 1, 1, 1, 1, 1,
-1.094794, -0.8676946, -1.793281, 1, 1, 1, 1, 1,
-1.092121, -1.037609, -1.690568, 1, 1, 1, 1, 1,
-1.088989, -0.09284876, -2.34601, 1, 1, 1, 1, 1,
-1.088248, -0.4388089, -1.056654, 1, 1, 1, 1, 1,
-1.087721, -0.8334048, -2.037471, 1, 1, 1, 1, 1,
-1.083045, 0.2475731, -0.7971694, 1, 1, 1, 1, 1,
-1.079409, -0.001267674, -1.647045, 1, 1, 1, 1, 1,
-1.079297, 1.279624, 0.4039445, 1, 1, 1, 1, 1,
-1.075977, 0.4006822, -3.204839, 1, 1, 1, 1, 1,
-1.072326, -0.486745, -3.006741, 1, 1, 1, 1, 1,
-1.063654, 0.8894913, -1.742273, 1, 1, 1, 1, 1,
-1.060239, -0.7590801, -3.316874, 1, 1, 1, 1, 1,
-1.055656, -0.9513943, -2.990376, 0, 0, 1, 1, 1,
-1.055416, 0.2805833, -0.6096341, 1, 0, 0, 1, 1,
-1.052923, 0.5461971, -0.3523277, 1, 0, 0, 1, 1,
-1.046681, -1.764574, -2.791367, 1, 0, 0, 1, 1,
-1.045829, -0.3951729, -1.338544, 1, 0, 0, 1, 1,
-1.038597, -0.9416012, -2.499699, 1, 0, 0, 1, 1,
-1.037517, 0.8590459, -1.303758, 0, 0, 0, 1, 1,
-1.034663, 1.867924, -1.24152, 0, 0, 0, 1, 1,
-1.026045, 0.2886505, -0.4831657, 0, 0, 0, 1, 1,
-1.025929, -1.216354, -3.305919, 0, 0, 0, 1, 1,
-1.025192, -0.9413084, -3.515673, 0, 0, 0, 1, 1,
-1.018264, 0.6369689, -0.5010208, 0, 0, 0, 1, 1,
-1.01567, -0.206097, -1.814787, 0, 0, 0, 1, 1,
-1.014706, 1.506196, -0.2240606, 1, 1, 1, 1, 1,
-0.9983672, -0.690758, -1.457529, 1, 1, 1, 1, 1,
-0.996219, -2.966829, -2.834342, 1, 1, 1, 1, 1,
-0.9888219, -0.7750463, -1.995213, 1, 1, 1, 1, 1,
-0.9739012, -0.2092554, -1.477504, 1, 1, 1, 1, 1,
-0.9712514, -1.117891, -0.8523599, 1, 1, 1, 1, 1,
-0.9678229, 0.5720375, -0.6654619, 1, 1, 1, 1, 1,
-0.9586858, 0.9350443, -1.262589, 1, 1, 1, 1, 1,
-0.9574124, -0.1521914, 0.2210665, 1, 1, 1, 1, 1,
-0.954464, 0.3695821, 0.5300568, 1, 1, 1, 1, 1,
-0.95151, 1.236402, 0.2167314, 1, 1, 1, 1, 1,
-0.9514499, -0.2674735, -1.874564, 1, 1, 1, 1, 1,
-0.9484017, -1.490631, -1.520071, 1, 1, 1, 1, 1,
-0.9439148, 0.3411427, -1.856328, 1, 1, 1, 1, 1,
-0.9438721, 1.301616, 0.3177509, 1, 1, 1, 1, 1,
-0.9384286, -1.265116, -3.583085, 0, 0, 1, 1, 1,
-0.9287253, -1.053133, -3.306165, 1, 0, 0, 1, 1,
-0.9273262, -1.4074, -1.649871, 1, 0, 0, 1, 1,
-0.9182242, 0.00806548, -1.782178, 1, 0, 0, 1, 1,
-0.9178166, -0.3611631, -3.219905, 1, 0, 0, 1, 1,
-0.9116372, 0.5456333, 0.3525752, 1, 0, 0, 1, 1,
-0.9076494, 0.2264731, -2.980669, 0, 0, 0, 1, 1,
-0.9020714, -0.2775131, -3.272061, 0, 0, 0, 1, 1,
-0.9000023, 1.550376, 0.5216851, 0, 0, 0, 1, 1,
-0.8984093, 0.3621161, -2.205675, 0, 0, 0, 1, 1,
-0.8967345, 0.8521231, -0.6220262, 0, 0, 0, 1, 1,
-0.8849406, 0.6001174, -2.718714, 0, 0, 0, 1, 1,
-0.8820121, 1.212904, -1.351954, 0, 0, 0, 1, 1,
-0.8816499, 1.484401, -0.5186864, 1, 1, 1, 1, 1,
-0.8765376, 1.250369, -0.8536645, 1, 1, 1, 1, 1,
-0.8764948, -0.8285326, -1.849803, 1, 1, 1, 1, 1,
-0.8761329, -0.7333986, -1.715088, 1, 1, 1, 1, 1,
-0.8746455, 0.6305271, -0.02298708, 1, 1, 1, 1, 1,
-0.8729415, -0.6726901, -2.76198, 1, 1, 1, 1, 1,
-0.8699937, -0.1409534, -0.5388719, 1, 1, 1, 1, 1,
-0.8699336, 0.4537996, -1.263936, 1, 1, 1, 1, 1,
-0.8683746, 0.998323, -1.007313, 1, 1, 1, 1, 1,
-0.867844, -1.122186, -3.401623, 1, 1, 1, 1, 1,
-0.8664641, 0.8084167, -0.4787686, 1, 1, 1, 1, 1,
-0.8650857, -0.751188, -0.9354563, 1, 1, 1, 1, 1,
-0.863893, -2.129987, -4.31117, 1, 1, 1, 1, 1,
-0.8630908, -1.840923, -2.723253, 1, 1, 1, 1, 1,
-0.8618847, 1.371851, -0.205596, 1, 1, 1, 1, 1,
-0.8602245, -0.2273848, -0.03297143, 0, 0, 1, 1, 1,
-0.8602178, -1.153424, -1.439966, 1, 0, 0, 1, 1,
-0.8539972, 0.6337658, -0.05118444, 1, 0, 0, 1, 1,
-0.8518953, -1.772761, -3.805136, 1, 0, 0, 1, 1,
-0.845933, -0.1144437, -3.448611, 1, 0, 0, 1, 1,
-0.8435575, 0.2498405, -1.345038, 1, 0, 0, 1, 1,
-0.8422964, 0.09740523, -2.652158, 0, 0, 0, 1, 1,
-0.8363259, -1.427857, -1.902801, 0, 0, 0, 1, 1,
-0.8351114, 0.6471704, -0.2128546, 0, 0, 0, 1, 1,
-0.8349083, 0.841396, 0.2065294, 0, 0, 0, 1, 1,
-0.834868, 0.3470986, 0.1342697, 0, 0, 0, 1, 1,
-0.8348178, -0.3393835, -0.5535369, 0, 0, 0, 1, 1,
-0.834487, 1.042922, -1.963978, 0, 0, 0, 1, 1,
-0.8313621, 0.3276705, -0.8911266, 1, 1, 1, 1, 1,
-0.8309107, -0.9369814, -2.262052, 1, 1, 1, 1, 1,
-0.8243991, -1.015138, -1.378143, 1, 1, 1, 1, 1,
-0.8212126, -0.2588247, -2.258936, 1, 1, 1, 1, 1,
-0.8205699, -1.207189, -1.637941, 1, 1, 1, 1, 1,
-0.8195909, -0.6000972, -1.467389, 1, 1, 1, 1, 1,
-0.8092794, 0.6957879, -1.715777, 1, 1, 1, 1, 1,
-0.8054878, 1.190549, 0.229467, 1, 1, 1, 1, 1,
-0.8045191, 2.297576, 0.148109, 1, 1, 1, 1, 1,
-0.7941217, -0.3410944, -2.634137, 1, 1, 1, 1, 1,
-0.7909049, 1.4978, -0.2552581, 1, 1, 1, 1, 1,
-0.7908943, 1.476118, -2.634302, 1, 1, 1, 1, 1,
-0.7823189, 0.7243199, -0.735964, 1, 1, 1, 1, 1,
-0.7800992, -0.02865267, -1.351809, 1, 1, 1, 1, 1,
-0.7792118, 0.7781173, 1.511093, 1, 1, 1, 1, 1,
-0.7726635, 0.4827803, -1.073745, 0, 0, 1, 1, 1,
-0.7697762, 1.493082, -0.7063443, 1, 0, 0, 1, 1,
-0.7674101, -0.4432565, -4.989967, 1, 0, 0, 1, 1,
-0.767214, 1.114183, -1.338985, 1, 0, 0, 1, 1,
-0.7660623, -0.8123769, -2.861855, 1, 0, 0, 1, 1,
-0.7612641, -0.4083993, -3.360104, 1, 0, 0, 1, 1,
-0.7501885, 0.7488986, -2.104271, 0, 0, 0, 1, 1,
-0.7421057, -1.214345, -3.107131, 0, 0, 0, 1, 1,
-0.7370799, 0.2752521, -0.3246732, 0, 0, 0, 1, 1,
-0.7267658, 0.141561, -2.042674, 0, 0, 0, 1, 1,
-0.7169753, 1.281265, -0.9703187, 0, 0, 0, 1, 1,
-0.7120876, -0.9283783, -1.898803, 0, 0, 0, 1, 1,
-0.7073805, 0.2120697, -2.08452, 0, 0, 0, 1, 1,
-0.7012119, -0.6859813, -3.271831, 1, 1, 1, 1, 1,
-0.7006508, 0.02479043, -2.552882, 1, 1, 1, 1, 1,
-0.6987119, -1.768836, -2.807382, 1, 1, 1, 1, 1,
-0.6957795, -0.5738554, -1.600472, 1, 1, 1, 1, 1,
-0.6951457, -1.114797, -3.732282, 1, 1, 1, 1, 1,
-0.6944852, -0.7099595, -1.451723, 1, 1, 1, 1, 1,
-0.6944221, -0.9982691, -2.120226, 1, 1, 1, 1, 1,
-0.6935209, -1.262369, -3.230057, 1, 1, 1, 1, 1,
-0.6919661, 0.7227823, -0.06755789, 1, 1, 1, 1, 1,
-0.6909152, 0.5353268, -2.06308, 1, 1, 1, 1, 1,
-0.6906285, -0.02773243, -1.653019, 1, 1, 1, 1, 1,
-0.6823916, 1.562851, -1.331311, 1, 1, 1, 1, 1,
-0.6797432, -0.2527182, -1.849867, 1, 1, 1, 1, 1,
-0.6790487, 1.20747, -1.225755, 1, 1, 1, 1, 1,
-0.6738693, 1.199805, -1.616388, 1, 1, 1, 1, 1,
-0.6693556, 0.9115232, 0.03854153, 0, 0, 1, 1, 1,
-0.668289, -0.5644096, -3.505267, 1, 0, 0, 1, 1,
-0.6668798, -0.6294623, -3.397154, 1, 0, 0, 1, 1,
-0.660104, 0.8384204, -0.7221254, 1, 0, 0, 1, 1,
-0.6595308, 0.3922718, -0.235594, 1, 0, 0, 1, 1,
-0.6541333, 0.7573265, -1.477941, 1, 0, 0, 1, 1,
-0.6456224, -0.4075766, -1.854592, 0, 0, 0, 1, 1,
-0.6435372, 0.1664885, -1.343258, 0, 0, 0, 1, 1,
-0.6421034, 0.7453387, -0.8604954, 0, 0, 0, 1, 1,
-0.6399008, 0.418233, -0.2249505, 0, 0, 0, 1, 1,
-0.638988, -0.1665295, -1.812266, 0, 0, 0, 1, 1,
-0.6323071, -0.1071427, -1.384829, 0, 0, 0, 1, 1,
-0.6320865, 0.02151346, -1.828739, 0, 0, 0, 1, 1,
-0.6275128, -1.211706, -3.505778, 1, 1, 1, 1, 1,
-0.6220989, -0.06819799, -1.370858, 1, 1, 1, 1, 1,
-0.6219913, 1.516539, 0.1460641, 1, 1, 1, 1, 1,
-0.6097463, 0.8583822, 1.075295, 1, 1, 1, 1, 1,
-0.6054741, -2.172438, -3.373898, 1, 1, 1, 1, 1,
-0.6050705, -0.3716373, -3.425165, 1, 1, 1, 1, 1,
-0.6042354, -0.4412836, -1.130691, 1, 1, 1, 1, 1,
-0.6035082, -1.833948, -4.032285, 1, 1, 1, 1, 1,
-0.5957196, -1.091542, -2.157582, 1, 1, 1, 1, 1,
-0.5919467, 0.9530365, -0.522661, 1, 1, 1, 1, 1,
-0.5917282, -1.092865, -2.068538, 1, 1, 1, 1, 1,
-0.5886359, -2.127463, -1.944871, 1, 1, 1, 1, 1,
-0.588414, -0.9061765, -4.086975, 1, 1, 1, 1, 1,
-0.5755039, -0.8528619, -2.626765, 1, 1, 1, 1, 1,
-0.5711283, 0.8037196, -1.371319, 1, 1, 1, 1, 1,
-0.5687757, -0.9799547, -2.262171, 0, 0, 1, 1, 1,
-0.5633591, -0.8478833, -2.588545, 1, 0, 0, 1, 1,
-0.5620745, -0.3163637, -0.4414768, 1, 0, 0, 1, 1,
-0.5609215, 1.10145, -1.144665, 1, 0, 0, 1, 1,
-0.5512421, -0.3921259, -2.608585, 1, 0, 0, 1, 1,
-0.5498787, 0.3321454, -1.738194, 1, 0, 0, 1, 1,
-0.5487632, -0.5514011, -2.408464, 0, 0, 0, 1, 1,
-0.5472446, 1.749536, -1.425094, 0, 0, 0, 1, 1,
-0.5461401, 0.3038367, -1.019185, 0, 0, 0, 1, 1,
-0.5436914, -0.5283193, -3.882431, 0, 0, 0, 1, 1,
-0.5405514, -1.342644, -2.482898, 0, 0, 0, 1, 1,
-0.5394068, 0.07425978, -2.233822, 0, 0, 0, 1, 1,
-0.5393226, 0.7219282, 1.077024, 0, 0, 0, 1, 1,
-0.5367597, 1.123079, 1.226703, 1, 1, 1, 1, 1,
-0.5349741, 1.667216, 1.393378, 1, 1, 1, 1, 1,
-0.5310953, 0.4250759, -1.627196, 1, 1, 1, 1, 1,
-0.529961, -0.8854202, -4.423871, 1, 1, 1, 1, 1,
-0.5220422, -0.3101597, -0.4531846, 1, 1, 1, 1, 1,
-0.5219798, 0.3384666, -1.020559, 1, 1, 1, 1, 1,
-0.5197338, -0.4071133, -2.701822, 1, 1, 1, 1, 1,
-0.5181841, 0.9352164, -1.15858, 1, 1, 1, 1, 1,
-0.5160803, 0.2926578, -1.242529, 1, 1, 1, 1, 1,
-0.5069841, 2.255455, -0.4372759, 1, 1, 1, 1, 1,
-0.5034272, 0.696327, -0.5839124, 1, 1, 1, 1, 1,
-0.4983475, -1.186805, -1.281366, 1, 1, 1, 1, 1,
-0.4980192, 0.02398459, -3.096573, 1, 1, 1, 1, 1,
-0.494234, 1.233403, 0.12421, 1, 1, 1, 1, 1,
-0.4914519, -0.7212955, -2.213502, 1, 1, 1, 1, 1,
-0.4861403, -0.5651575, -3.874004, 0, 0, 1, 1, 1,
-0.4764701, 0.2731239, 0.06621149, 1, 0, 0, 1, 1,
-0.476095, 2.056461, -1.207857, 1, 0, 0, 1, 1,
-0.4755614, -0.4234163, -3.584677, 1, 0, 0, 1, 1,
-0.4728743, -0.64028, -1.077896, 1, 0, 0, 1, 1,
-0.4717403, -0.04428171, -1.597847, 1, 0, 0, 1, 1,
-0.4681392, -0.5256815, -0.7403147, 0, 0, 0, 1, 1,
-0.4614236, -1.59492, -1.582589, 0, 0, 0, 1, 1,
-0.4597577, -0.7130974, -2.861843, 0, 0, 0, 1, 1,
-0.459403, -0.03534892, 0.08889365, 0, 0, 0, 1, 1,
-0.4582864, 0.4521516, -0.9857754, 0, 0, 0, 1, 1,
-0.4560581, 1.510248, -0.5288978, 0, 0, 0, 1, 1,
-0.4558305, -0.1132323, -0.3486953, 0, 0, 0, 1, 1,
-0.4556005, 0.7465764, 0.6446939, 1, 1, 1, 1, 1,
-0.4497921, 0.7264987, -1.551795, 1, 1, 1, 1, 1,
-0.4387724, -0.5049966, -1.292947, 1, 1, 1, 1, 1,
-0.4366681, 0.1388831, -4.09409, 1, 1, 1, 1, 1,
-0.4351639, 0.2705628, -0.9757457, 1, 1, 1, 1, 1,
-0.4334344, 0.7549635, 0.1651879, 1, 1, 1, 1, 1,
-0.4327493, -0.2293234, -1.291463, 1, 1, 1, 1, 1,
-0.4277863, 0.1762983, -0.8431056, 1, 1, 1, 1, 1,
-0.4219272, 0.4001798, -1.008798, 1, 1, 1, 1, 1,
-0.4185457, 0.1290984, -1.974806, 1, 1, 1, 1, 1,
-0.416146, -0.8430465, -2.345267, 1, 1, 1, 1, 1,
-0.4158712, -0.921348, -1.393677, 1, 1, 1, 1, 1,
-0.4131337, -2.186178, -2.2628, 1, 1, 1, 1, 1,
-0.4060639, -1.17649, -4.811262, 1, 1, 1, 1, 1,
-0.4059421, 0.03257088, -2.172065, 1, 1, 1, 1, 1,
-0.4022032, -1.006447, -1.520232, 0, 0, 1, 1, 1,
-0.4019452, -0.3033599, -0.9791418, 1, 0, 0, 1, 1,
-0.3992644, -1.240204, -2.493391, 1, 0, 0, 1, 1,
-0.3984933, 0.4087248, 1.185612, 1, 0, 0, 1, 1,
-0.3976693, 0.6705372, -1.105996, 1, 0, 0, 1, 1,
-0.3961584, 1.497129, -0.2686395, 1, 0, 0, 1, 1,
-0.3944362, -1.417283, -1.369772, 0, 0, 0, 1, 1,
-0.3918692, 1.536348, -0.6689585, 0, 0, 0, 1, 1,
-0.3876833, -0.6989743, -3.287654, 0, 0, 0, 1, 1,
-0.3836689, 0.8029131, 1.229005, 0, 0, 0, 1, 1,
-0.3799517, 0.6646795, -0.4613107, 0, 0, 0, 1, 1,
-0.3795375, -0.5296122, -3.797327, 0, 0, 0, 1, 1,
-0.3783412, 0.8409386, -0.1229009, 0, 0, 0, 1, 1,
-0.3781823, -1.355553, -3.234697, 1, 1, 1, 1, 1,
-0.377095, 0.9798197, -1.534249, 1, 1, 1, 1, 1,
-0.3762328, -1.755787, -3.099204, 1, 1, 1, 1, 1,
-0.3758501, 0.1004833, -2.78643, 1, 1, 1, 1, 1,
-0.375707, -0.9424962, -3.381305, 1, 1, 1, 1, 1,
-0.3732395, -0.6752165, -3.106211, 1, 1, 1, 1, 1,
-0.3725912, 0.387151, -1.457976, 1, 1, 1, 1, 1,
-0.3685559, 1.150379, 0.4230187, 1, 1, 1, 1, 1,
-0.3655398, -1.125196, -3.760719, 1, 1, 1, 1, 1,
-0.3637432, -0.355156, -2.218097, 1, 1, 1, 1, 1,
-0.3607641, 0.6661007, -1.300805, 1, 1, 1, 1, 1,
-0.3560087, 1.841316, -0.9058926, 1, 1, 1, 1, 1,
-0.3521257, -0.2343573, -2.502257, 1, 1, 1, 1, 1,
-0.3475842, 1.723148, 0.7508559, 1, 1, 1, 1, 1,
-0.346178, -0.5933322, -2.546208, 1, 1, 1, 1, 1,
-0.3455273, -0.3019482, -3.87542, 0, 0, 1, 1, 1,
-0.3396651, -0.5427998, -3.520891, 1, 0, 0, 1, 1,
-0.3368899, 0.06099314, -2.131537, 1, 0, 0, 1, 1,
-0.3358569, -1.761398, -3.32719, 1, 0, 0, 1, 1,
-0.3358456, -0.6425169, -2.621337, 1, 0, 0, 1, 1,
-0.3288779, 1.135629, 1.908474, 1, 0, 0, 1, 1,
-0.3257678, -0.5022072, -2.344519, 0, 0, 0, 1, 1,
-0.3221092, -1.504635, -3.632995, 0, 0, 0, 1, 1,
-0.3208156, 0.118831, -3.66672, 0, 0, 0, 1, 1,
-0.3193632, -0.7181926, -4.081885, 0, 0, 0, 1, 1,
-0.3180822, 0.5239677, -0.4410777, 0, 0, 0, 1, 1,
-0.3165305, -0.6988045, -3.782287, 0, 0, 0, 1, 1,
-0.3162818, 0.05183976, 0.5716008, 0, 0, 0, 1, 1,
-0.3078257, 0.8408039, -0.07399075, 1, 1, 1, 1, 1,
-0.3076058, 0.8991459, 1.141253, 1, 1, 1, 1, 1,
-0.3011502, 0.4922025, -3.000916, 1, 1, 1, 1, 1,
-0.300388, -0.1222599, -3.5251, 1, 1, 1, 1, 1,
-0.2990517, 0.3858114, -2.590103, 1, 1, 1, 1, 1,
-0.2979671, -0.2721961, -0.8107559, 1, 1, 1, 1, 1,
-0.2969021, -1.399981, -2.647766, 1, 1, 1, 1, 1,
-0.2962645, -0.1381854, -1.340369, 1, 1, 1, 1, 1,
-0.2960812, 1.663829, 0.2805426, 1, 1, 1, 1, 1,
-0.2958622, -0.2613837, -0.7096515, 1, 1, 1, 1, 1,
-0.2907567, 1.388806, -0.9593265, 1, 1, 1, 1, 1,
-0.2890448, -0.286574, -2.64946, 1, 1, 1, 1, 1,
-0.2807747, 0.6573725, -1.542661, 1, 1, 1, 1, 1,
-0.2806207, -1.081429, -1.447762, 1, 1, 1, 1, 1,
-0.2762784, 1.600276, -1.225264, 1, 1, 1, 1, 1,
-0.2730732, -0.4844391, -2.272189, 0, 0, 1, 1, 1,
-0.2663748, -1.562632, -4.042384, 1, 0, 0, 1, 1,
-0.2642154, 0.3311861, 0.03608536, 1, 0, 0, 1, 1,
-0.2606172, -0.5298399, -2.732537, 1, 0, 0, 1, 1,
-0.2571078, 0.9970815, 0.5118825, 1, 0, 0, 1, 1,
-0.2541226, -0.1704944, -3.466243, 1, 0, 0, 1, 1,
-0.2512651, 0.3948916, -0.4834884, 0, 0, 0, 1, 1,
-0.2459938, -1.307263, -3.823318, 0, 0, 0, 1, 1,
-0.2452705, 0.2979892, -0.5742985, 0, 0, 0, 1, 1,
-0.2407685, 0.5401269, -0.7297797, 0, 0, 0, 1, 1,
-0.2307251, 0.6221807, -0.2692588, 0, 0, 0, 1, 1,
-0.2303825, -1.226218, -1.853937, 0, 0, 0, 1, 1,
-0.2284009, -2.559338, -3.850051, 0, 0, 0, 1, 1,
-0.2274972, -1.379075, -4.038136, 1, 1, 1, 1, 1,
-0.2271697, 0.7903102, -0.9460375, 1, 1, 1, 1, 1,
-0.2223798, -2.710253, -2.377032, 1, 1, 1, 1, 1,
-0.2178285, -0.2494168, -3.082465, 1, 1, 1, 1, 1,
-0.2101111, 0.411543, -1.361665, 1, 1, 1, 1, 1,
-0.2099585, 2.243548, -0.8094184, 1, 1, 1, 1, 1,
-0.209655, 0.3225215, 0.1276413, 1, 1, 1, 1, 1,
-0.2067807, 0.7585541, -1.232526, 1, 1, 1, 1, 1,
-0.2064829, 0.6308808, 0.5296921, 1, 1, 1, 1, 1,
-0.2051943, 0.3044436, -1.014537, 1, 1, 1, 1, 1,
-0.2020742, -0.3631528, -3.486517, 1, 1, 1, 1, 1,
-0.1991905, -0.3367499, -5.115956, 1, 1, 1, 1, 1,
-0.1950083, -1.806557, -3.634817, 1, 1, 1, 1, 1,
-0.1931363, 0.8431699, 0.661665, 1, 1, 1, 1, 1,
-0.1928298, 0.6251733, -0.6698541, 1, 1, 1, 1, 1,
-0.1856305, 1.366637, 0.4810882, 0, 0, 1, 1, 1,
-0.1803886, -0.4665062, -2.350848, 1, 0, 0, 1, 1,
-0.1767934, -0.9462087, -3.208836, 1, 0, 0, 1, 1,
-0.1736119, 0.6633046, 0.4116101, 1, 0, 0, 1, 1,
-0.1705135, -0.002311989, -2.394017, 1, 0, 0, 1, 1,
-0.1700408, -1.132807, -3.03779, 1, 0, 0, 1, 1,
-0.1690643, -2.129476, -2.304618, 0, 0, 0, 1, 1,
-0.1683449, -0.2437606, -1.739013, 0, 0, 0, 1, 1,
-0.1668652, -0.2630964, -3.513385, 0, 0, 0, 1, 1,
-0.161868, 1.138867, -0.142472, 0, 0, 0, 1, 1,
-0.157324, 0.7483831, -0.01273496, 0, 0, 0, 1, 1,
-0.1528106, -0.4356261, -4.186006, 0, 0, 0, 1, 1,
-0.149771, -0.4584742, -2.643455, 0, 0, 0, 1, 1,
-0.1482761, 0.2279727, -1.423726, 1, 1, 1, 1, 1,
-0.14542, -0.5883152, -2.254103, 1, 1, 1, 1, 1,
-0.1423434, -0.5311962, -2.86685, 1, 1, 1, 1, 1,
-0.1419111, 0.785061, -0.2466187, 1, 1, 1, 1, 1,
-0.1397632, 0.595359, 0.288009, 1, 1, 1, 1, 1,
-0.1353856, -1.105878, -2.921998, 1, 1, 1, 1, 1,
-0.1353564, -1.48443, -4.278906, 1, 1, 1, 1, 1,
-0.1332561, -0.8726399, -3.921646, 1, 1, 1, 1, 1,
-0.1328923, 1.07582, -0.9858061, 1, 1, 1, 1, 1,
-0.1324871, 0.006344092, -3.040513, 1, 1, 1, 1, 1,
-0.1312225, -0.9882361, -2.132017, 1, 1, 1, 1, 1,
-0.1307679, -0.1845035, -3.041251, 1, 1, 1, 1, 1,
-0.1298528, 0.5432513, -1.085291, 1, 1, 1, 1, 1,
-0.128641, -0.1701391, -3.301927, 1, 1, 1, 1, 1,
-0.1284114, 0.4126765, 1.213194, 1, 1, 1, 1, 1,
-0.1279595, -0.8959647, -3.995457, 0, 0, 1, 1, 1,
-0.1268097, -1.223363, -3.353626, 1, 0, 0, 1, 1,
-0.126489, 0.8157655, 1.079375, 1, 0, 0, 1, 1,
-0.1235912, 0.1150771, 0.9920471, 1, 0, 0, 1, 1,
-0.1215814, -0.004688553, -2.797343, 1, 0, 0, 1, 1,
-0.1156946, 0.03137976, -1.685877, 1, 0, 0, 1, 1,
-0.1146216, -2.149056, -4.230216, 0, 0, 0, 1, 1,
-0.09925529, 0.01702699, -2.240319, 0, 0, 0, 1, 1,
-0.09803343, 0.7142097, -0.3363771, 0, 0, 0, 1, 1,
-0.09421898, 0.4287213, -1.906847, 0, 0, 0, 1, 1,
-0.09313048, -0.1889723, -2.580529, 0, 0, 0, 1, 1,
-0.09067562, -0.325123, -2.00164, 0, 0, 0, 1, 1,
-0.09026917, -0.9042692, -3.480604, 0, 0, 0, 1, 1,
-0.08879577, -0.3854279, -4.107697, 1, 1, 1, 1, 1,
-0.08751356, -0.6339111, -3.910541, 1, 1, 1, 1, 1,
-0.08584168, 0.4852962, -1.635176, 1, 1, 1, 1, 1,
-0.08451834, -0.09043703, -3.161577, 1, 1, 1, 1, 1,
-0.08242358, 0.09654978, 0.05862248, 1, 1, 1, 1, 1,
-0.08079173, 0.2434454, -1.488785, 1, 1, 1, 1, 1,
-0.07996948, -0.3528555, -2.861266, 1, 1, 1, 1, 1,
-0.07755564, -0.7240899, -3.21075, 1, 1, 1, 1, 1,
-0.07619318, 0.1620778, 0.7230752, 1, 1, 1, 1, 1,
-0.0759922, -1.109475, -2.706652, 1, 1, 1, 1, 1,
-0.07436623, -0.7313553, -3.711043, 1, 1, 1, 1, 1,
-0.07217101, 0.6714734, 0.422629, 1, 1, 1, 1, 1,
-0.07138629, 1.742232, -0.9675109, 1, 1, 1, 1, 1,
-0.06398221, -0.84383, -2.129184, 1, 1, 1, 1, 1,
-0.06345613, 0.1185044, -0.2703198, 1, 1, 1, 1, 1,
-0.06080281, 1.316819, -1.877039, 0, 0, 1, 1, 1,
-0.05836765, 1.877111, 0.6662215, 1, 0, 0, 1, 1,
-0.05769834, 0.3100266, 0.1916048, 1, 0, 0, 1, 1,
-0.04920572, 1.585742, 1.011719, 1, 0, 0, 1, 1,
-0.04532728, -0.124206, -2.759798, 1, 0, 0, 1, 1,
-0.04436203, 1.555347, -0.4553725, 1, 0, 0, 1, 1,
-0.04401519, -0.00990062, -1.583823, 0, 0, 0, 1, 1,
-0.04245685, -0.6065366, -2.861202, 0, 0, 0, 1, 1,
-0.03298992, -0.4406663, -4.608031, 0, 0, 0, 1, 1,
-0.02673997, -0.3838376, -3.815263, 0, 0, 0, 1, 1,
-0.025938, -0.1295597, -2.91516, 0, 0, 0, 1, 1,
-0.02545506, -0.9794393, -2.482683, 0, 0, 0, 1, 1,
-0.01971287, -0.6079317, -3.365922, 0, 0, 0, 1, 1,
-0.01934996, -0.355224, -4.598394, 1, 1, 1, 1, 1,
-0.01661897, -0.2547319, -3.23227, 1, 1, 1, 1, 1,
-0.01347825, -2.151268, -2.881313, 1, 1, 1, 1, 1,
-0.01232215, -0.2722944, -1.616244, 1, 1, 1, 1, 1,
-0.01125866, -0.623915, -4.259493, 1, 1, 1, 1, 1,
-0.0109397, -0.06309988, -3.498033, 1, 1, 1, 1, 1,
-0.01070588, 1.266685, 0.04668624, 1, 1, 1, 1, 1,
-0.008982082, -0.3008294, -2.724016, 1, 1, 1, 1, 1,
-0.004585996, -0.5190904, -2.749521, 1, 1, 1, 1, 1,
-0.00280128, 0.1499752, -0.09670133, 1, 1, 1, 1, 1,
6.618235e-06, -1.804181, 3.371688, 1, 1, 1, 1, 1,
0.001030152, 0.2368892, -1.765724, 1, 1, 1, 1, 1,
0.001503158, 0.3563699, 0.6985617, 1, 1, 1, 1, 1,
0.01085791, -0.754191, 3.409512, 1, 1, 1, 1, 1,
0.01223867, -1.503387, 2.568398, 1, 1, 1, 1, 1,
0.01805671, -1.333095, 4.154212, 0, 0, 1, 1, 1,
0.02378136, 1.609354, -1.56512, 1, 0, 0, 1, 1,
0.02670755, 0.1903631, -0.9144976, 1, 0, 0, 1, 1,
0.02674031, 0.2945121, -0.1952493, 1, 0, 0, 1, 1,
0.03057346, 0.7641379, -0.3075512, 1, 0, 0, 1, 1,
0.03252075, -1.746732, 3.714962, 1, 0, 0, 1, 1,
0.03339614, -1.729971, 3.372387, 0, 0, 0, 1, 1,
0.03356988, -2.489207, 4.094003, 0, 0, 0, 1, 1,
0.03421343, 0.08237736, 0.3200123, 0, 0, 0, 1, 1,
0.03689375, 0.2279835, 1.912305, 0, 0, 0, 1, 1,
0.03740641, -1.028149, 4.102587, 0, 0, 0, 1, 1,
0.04427681, 0.5717151, 0.655055, 0, 0, 0, 1, 1,
0.04791425, 2.494483, 0.1959465, 0, 0, 0, 1, 1,
0.0515933, 0.2666436, -1.698009, 1, 1, 1, 1, 1,
0.05306998, -0.444739, 0.99887, 1, 1, 1, 1, 1,
0.05434068, 0.4857075, 0.3991862, 1, 1, 1, 1, 1,
0.05615586, -2.739252, 3.278743, 1, 1, 1, 1, 1,
0.05740923, 0.8900371, -0.04915807, 1, 1, 1, 1, 1,
0.06573406, 0.600535, -0.05857979, 1, 1, 1, 1, 1,
0.06714703, 1.902942, -2.011977, 1, 1, 1, 1, 1,
0.06902543, -1.664609, 5.274859, 1, 1, 1, 1, 1,
0.07002692, -0.1728282, 3.286327, 1, 1, 1, 1, 1,
0.07159168, -1.114308, 4.613579, 1, 1, 1, 1, 1,
0.075313, -1.416778, 2.232588, 1, 1, 1, 1, 1,
0.08276907, -0.6809913, 3.077092, 1, 1, 1, 1, 1,
0.08369037, -0.5218071, 2.269194, 1, 1, 1, 1, 1,
0.08712621, -2.134792, 3.937058, 1, 1, 1, 1, 1,
0.09055758, -0.04426966, 0.7967208, 1, 1, 1, 1, 1,
0.09188777, 0.6877115, -0.100733, 0, 0, 1, 1, 1,
0.09266424, 1.184533, -0.8127694, 1, 0, 0, 1, 1,
0.0952319, 1.447969, 0.1599459, 1, 0, 0, 1, 1,
0.09981076, -1.572101, 3.189284, 1, 0, 0, 1, 1,
0.1008389, 0.4489936, -0.4447814, 1, 0, 0, 1, 1,
0.1029826, 1.932937, 0.1413293, 1, 0, 0, 1, 1,
0.1040718, -0.02471935, 0.5000722, 0, 0, 0, 1, 1,
0.1045566, 0.7550247, -0.5915939, 0, 0, 0, 1, 1,
0.1058115, 1.156098, -0.05883105, 0, 0, 0, 1, 1,
0.1060239, 0.2710328, 0.03400594, 0, 0, 0, 1, 1,
0.1100285, -0.201907, 2.911959, 0, 0, 0, 1, 1,
0.1134723, 0.8750938, 0.6914275, 0, 0, 0, 1, 1,
0.1137737, -0.8357775, 3.754627, 0, 0, 0, 1, 1,
0.1140843, -0.7877306, 4.43919, 1, 1, 1, 1, 1,
0.1178868, -0.6765951, 2.771183, 1, 1, 1, 1, 1,
0.118455, 0.2952383, 0.6081847, 1, 1, 1, 1, 1,
0.1196334, -1.831959, 2.508077, 1, 1, 1, 1, 1,
0.119742, 0.4487695, 1.757653, 1, 1, 1, 1, 1,
0.1338925, -1.316205, 1.613443, 1, 1, 1, 1, 1,
0.1351078, 0.1053608, 2.529601, 1, 1, 1, 1, 1,
0.1373122, 1.026533, 0.378915, 1, 1, 1, 1, 1,
0.1377837, -1.444041, 2.271863, 1, 1, 1, 1, 1,
0.13826, 2.04924, 0.1160947, 1, 1, 1, 1, 1,
0.1383008, -1.761405, 1.80311, 1, 1, 1, 1, 1,
0.138593, 0.7898734, -0.1124997, 1, 1, 1, 1, 1,
0.1396139, 1.112092, 0.02972449, 1, 1, 1, 1, 1,
0.1401711, -0.2504973, 4.236281, 1, 1, 1, 1, 1,
0.1423596, -0.9519395, 2.950512, 1, 1, 1, 1, 1,
0.144328, 0.7361944, -0.811173, 0, 0, 1, 1, 1,
0.1445086, 0.920657, -0.4993109, 1, 0, 0, 1, 1,
0.146242, -0.5527219, 3.151766, 1, 0, 0, 1, 1,
0.1477257, 0.61528, -1.294711, 1, 0, 0, 1, 1,
0.1584289, 0.02941853, 3.281237, 1, 0, 0, 1, 1,
0.1596348, -0.008586336, 2.76148, 1, 0, 0, 1, 1,
0.163229, -1.152125, 3.350859, 0, 0, 0, 1, 1,
0.1669652, -1.03454, 3.198414, 0, 0, 0, 1, 1,
0.1683978, -0.08783668, 0.8183444, 0, 0, 0, 1, 1,
0.1687034, -1.06872, 2.322738, 0, 0, 0, 1, 1,
0.1704606, 0.5599393, 0.7519955, 0, 0, 0, 1, 1,
0.1709171, -1.210235, 4.110964, 0, 0, 0, 1, 1,
0.1722125, -2.732354, 5.147122, 0, 0, 0, 1, 1,
0.1731374, 0.1946037, 0.6366903, 1, 1, 1, 1, 1,
0.176991, -0.08835607, 0.9899587, 1, 1, 1, 1, 1,
0.1808597, 0.3496044, -0.05174352, 1, 1, 1, 1, 1,
0.1813931, -0.4831067, 1.937466, 1, 1, 1, 1, 1,
0.1856691, 0.5574843, 1.760046, 1, 1, 1, 1, 1,
0.1914055, -0.1353389, 2.384959, 1, 1, 1, 1, 1,
0.1945775, -0.1521349, 0.8752437, 1, 1, 1, 1, 1,
0.1947359, -0.1788109, 1.718057, 1, 1, 1, 1, 1,
0.1994409, 1.237732, 0.4522607, 1, 1, 1, 1, 1,
0.2011997, 2.355505, -0.5940139, 1, 1, 1, 1, 1,
0.2055402, -1.514841, 1.663128, 1, 1, 1, 1, 1,
0.206976, -0.09292744, 2.057185, 1, 1, 1, 1, 1,
0.2138309, -0.9194698, 0.4959486, 1, 1, 1, 1, 1,
0.2139759, -0.3611619, 1.976345, 1, 1, 1, 1, 1,
0.2194704, 1.429861, -0.6410712, 1, 1, 1, 1, 1,
0.2242792, 0.5486436, -0.6348727, 0, 0, 1, 1, 1,
0.2271268, -0.3429768, 2.870012, 1, 0, 0, 1, 1,
0.2278084, 0.5599946, 3.039874, 1, 0, 0, 1, 1,
0.2301114, 0.6781593, -1.222718, 1, 0, 0, 1, 1,
0.2333183, -0.04647997, 1.802824, 1, 0, 0, 1, 1,
0.2344979, 0.1761377, -0.9419354, 1, 0, 0, 1, 1,
0.2351121, 0.9727923, -1.404371, 0, 0, 0, 1, 1,
0.2365351, 1.250956, 0.2530629, 0, 0, 0, 1, 1,
0.2450582, -0.3575793, 1.099406, 0, 0, 0, 1, 1,
0.251615, 0.2780463, 1.938284, 0, 0, 0, 1, 1,
0.2525162, -0.3466121, 3.93216, 0, 0, 0, 1, 1,
0.2565769, 1.478922, 1.156271, 0, 0, 0, 1, 1,
0.2571427, -1.772962, 0.9559931, 0, 0, 0, 1, 1,
0.259249, -0.7865282, 2.783344, 1, 1, 1, 1, 1,
0.2657108, 0.3935045, -0.8696762, 1, 1, 1, 1, 1,
0.2717447, -0.9341019, 2.158805, 1, 1, 1, 1, 1,
0.2741693, -0.7637315, 3.09304, 1, 1, 1, 1, 1,
0.2771163, -0.1767799, 1.800675, 1, 1, 1, 1, 1,
0.2772807, 0.6323703, -1.129537, 1, 1, 1, 1, 1,
0.2909473, -0.1823471, 1.214186, 1, 1, 1, 1, 1,
0.2918998, -1.337557, 3.153603, 1, 1, 1, 1, 1,
0.2927676, 0.1654737, 2.757675, 1, 1, 1, 1, 1,
0.2956093, -0.9403338, 1.315413, 1, 1, 1, 1, 1,
0.2964736, 0.596573, 1.419639, 1, 1, 1, 1, 1,
0.2975982, -0.2506373, 1.386371, 1, 1, 1, 1, 1,
0.2978851, 1.001181, 2.939057, 1, 1, 1, 1, 1,
0.2992881, 1.133446, 1.025475, 1, 1, 1, 1, 1,
0.2996161, -1.629378, 3.492834, 1, 1, 1, 1, 1,
0.303097, 1.011345, 0.4568865, 0, 0, 1, 1, 1,
0.3058708, -0.1750576, 2.581785, 1, 0, 0, 1, 1,
0.3084993, -0.02727499, 0.03618893, 1, 0, 0, 1, 1,
0.3094611, 1.014143, -0.5561463, 1, 0, 0, 1, 1,
0.3102278, -1.548614, 3.196512, 1, 0, 0, 1, 1,
0.3120474, 0.528116, 1.870554, 1, 0, 0, 1, 1,
0.313142, 0.5379788, -0.05544318, 0, 0, 0, 1, 1,
0.3150081, 2.535812, -0.4995286, 0, 0, 0, 1, 1,
0.3152182, 0.7422865, -0.7248213, 0, 0, 0, 1, 1,
0.3161415, -2.801229, 4.196572, 0, 0, 0, 1, 1,
0.3186118, 0.4177353, 1.862939, 0, 0, 0, 1, 1,
0.3186247, 0.3631809, 1.163543, 0, 0, 0, 1, 1,
0.3194256, -0.2915092, 2.213998, 0, 0, 0, 1, 1,
0.3256371, 1.41861, 0.02989073, 1, 1, 1, 1, 1,
0.3270329, -0.2729815, 3.566348, 1, 1, 1, 1, 1,
0.3362981, 0.6702807, -1.023311, 1, 1, 1, 1, 1,
0.3377632, -0.1984589, 1.111505, 1, 1, 1, 1, 1,
0.3385754, -1.018258, 2.372304, 1, 1, 1, 1, 1,
0.3401628, 1.237705, -0.7250572, 1, 1, 1, 1, 1,
0.3423825, 0.02817162, 0.3587325, 1, 1, 1, 1, 1,
0.3445236, 0.1921231, 1.510676, 1, 1, 1, 1, 1,
0.3471658, -0.6726939, 2.303277, 1, 1, 1, 1, 1,
0.348644, 0.1919392, 1.117851, 1, 1, 1, 1, 1,
0.3510097, -0.1370201, -0.1943085, 1, 1, 1, 1, 1,
0.3677956, 0.6942481, 0.1576508, 1, 1, 1, 1, 1,
0.3689303, -1.112857, 3.439759, 1, 1, 1, 1, 1,
0.3721291, 0.4716523, 0.3221339, 1, 1, 1, 1, 1,
0.3725279, 2.154841, 0.194785, 1, 1, 1, 1, 1,
0.3736457, -0.5592709, 1.763983, 0, 0, 1, 1, 1,
0.384791, 0.1555156, 1.396855, 1, 0, 0, 1, 1,
0.3864565, -1.086475, 3.517796, 1, 0, 0, 1, 1,
0.386468, -1.520737, 1.877551, 1, 0, 0, 1, 1,
0.3885359, -0.1087828, 1.35109, 1, 0, 0, 1, 1,
0.3915701, -0.1497565, 1.531789, 1, 0, 0, 1, 1,
0.3923406, 1.66465, 2.061158, 0, 0, 0, 1, 1,
0.3980057, 0.3268879, 1.313782, 0, 0, 0, 1, 1,
0.4034775, 0.1344942, 1.105765, 0, 0, 0, 1, 1,
0.4038842, -0.7084021, 0.604183, 0, 0, 0, 1, 1,
0.4052756, -0.6460143, 1.41692, 0, 0, 0, 1, 1,
0.4057955, 1.560263, -0.9575014, 0, 0, 0, 1, 1,
0.4092933, 0.6367386, 1.560496, 0, 0, 0, 1, 1,
0.4134866, -1.354656, 4.249662, 1, 1, 1, 1, 1,
0.4142673, -0.6296766, 1.198886, 1, 1, 1, 1, 1,
0.4191051, -0.3933628, 2.724804, 1, 1, 1, 1, 1,
0.4208758, 1.059181, 1.615028, 1, 1, 1, 1, 1,
0.4220957, -1.615286, 1.199357, 1, 1, 1, 1, 1,
0.4223671, -0.3208253, 2.528475, 1, 1, 1, 1, 1,
0.4240271, 1.309881, 1.677515, 1, 1, 1, 1, 1,
0.4252397, 1.991755, -0.5918073, 1, 1, 1, 1, 1,
0.4255098, -0.01974021, 1.231695, 1, 1, 1, 1, 1,
0.4269561, 0.9289522, 0.6845452, 1, 1, 1, 1, 1,
0.4298523, -0.3663667, 0.3163567, 1, 1, 1, 1, 1,
0.4336431, 1.118843, 1.792064, 1, 1, 1, 1, 1,
0.4339882, 0.1550973, 1.527819, 1, 1, 1, 1, 1,
0.4345469, 0.01256493, 3.233336, 1, 1, 1, 1, 1,
0.4347123, -1.013086, 3.822069, 1, 1, 1, 1, 1,
0.4350369, -0.2579347, 1.889191, 0, 0, 1, 1, 1,
0.436847, -0.9206175, 2.574718, 1, 0, 0, 1, 1,
0.4370681, 1.042609, 0.7603285, 1, 0, 0, 1, 1,
0.4375362, -0.2703135, -0.2090785, 1, 0, 0, 1, 1,
0.4399477, 1.355313, 0.4814884, 1, 0, 0, 1, 1,
0.4423274, 1.287754, -0.8005077, 1, 0, 0, 1, 1,
0.4440411, 0.9418142, 2.72499, 0, 0, 0, 1, 1,
0.4463499, 0.2424673, -0.1015481, 0, 0, 0, 1, 1,
0.4525764, 0.0893575, -0.485142, 0, 0, 0, 1, 1,
0.4526247, -0.3616969, 1.344051, 0, 0, 0, 1, 1,
0.453269, 0.2616594, 0.2908179, 0, 0, 0, 1, 1,
0.4533435, -0.8817183, 2.340122, 0, 0, 0, 1, 1,
0.4580545, 0.998825, -0.0703612, 0, 0, 0, 1, 1,
0.4580936, -1.829201, 5.002798, 1, 1, 1, 1, 1,
0.4582554, -0.1190316, -0.529453, 1, 1, 1, 1, 1,
0.4618716, -2.005179, 4.771201, 1, 1, 1, 1, 1,
0.4647994, 0.6422209, 1.058104, 1, 1, 1, 1, 1,
0.4683718, 0.732963, -1.694397, 1, 1, 1, 1, 1,
0.4692559, -0.07084789, 0.6829442, 1, 1, 1, 1, 1,
0.4762233, 0.7373313, -0.8752508, 1, 1, 1, 1, 1,
0.484899, 0.1461416, 3.372404, 1, 1, 1, 1, 1,
0.4884953, -1.276708, 3.427267, 1, 1, 1, 1, 1,
0.4909388, 0.3729227, 1.595803, 1, 1, 1, 1, 1,
0.491722, 0.07059394, 1.261789, 1, 1, 1, 1, 1,
0.4922701, 2.968834, -1.048021, 1, 1, 1, 1, 1,
0.4962769, 0.9476265, -0.2651277, 1, 1, 1, 1, 1,
0.500661, -0.3473833, 3.9762, 1, 1, 1, 1, 1,
0.5013526, -1.72257, 3.931857, 1, 1, 1, 1, 1,
0.506526, 0.829506, 0.02454649, 0, 0, 1, 1, 1,
0.5066055, -1.621591, 2.172763, 1, 0, 0, 1, 1,
0.5084581, -1.850515, 2.424667, 1, 0, 0, 1, 1,
0.5181659, -0.1965056, 1.403056, 1, 0, 0, 1, 1,
0.5220724, -0.8244739, 0.8560075, 1, 0, 0, 1, 1,
0.5243536, -0.8264238, 3.623341, 1, 0, 0, 1, 1,
0.5285873, -0.4978024, 1.336209, 0, 0, 0, 1, 1,
0.5373185, -0.6595321, 2.025343, 0, 0, 0, 1, 1,
0.537846, -0.1794779, 2.70856, 0, 0, 0, 1, 1,
0.5482521, -1.414018, 2.251887, 0, 0, 0, 1, 1,
0.5521092, 1.216966, 1.389777, 0, 0, 0, 1, 1,
0.5527163, -0.9893064, 1.660185, 0, 0, 0, 1, 1,
0.5585036, 0.3775563, 0.7172344, 0, 0, 0, 1, 1,
0.5688515, -0.9280646, 1.314041, 1, 1, 1, 1, 1,
0.5691576, 0.1755434, 1.480331, 1, 1, 1, 1, 1,
0.5716169, -0.461068, 0.9459045, 1, 1, 1, 1, 1,
0.5732579, 0.8333337, 0.21947, 1, 1, 1, 1, 1,
0.5781505, -1.672258, 3.07071, 1, 1, 1, 1, 1,
0.5795333, 0.7617173, 1.688719, 1, 1, 1, 1, 1,
0.584847, -0.4255968, 1.989675, 1, 1, 1, 1, 1,
0.5858244, -2.838808, 2.816885, 1, 1, 1, 1, 1,
0.5928321, 0.8885428, 1.691415, 1, 1, 1, 1, 1,
0.5931217, 0.4587901, 0.7997251, 1, 1, 1, 1, 1,
0.5971549, -0.02498749, 1.418869, 1, 1, 1, 1, 1,
0.6082746, 0.2860788, 2.860483, 1, 1, 1, 1, 1,
0.6096027, 1.019265, 0.4107055, 1, 1, 1, 1, 1,
0.6103599, -0.5100381, 2.250251, 1, 1, 1, 1, 1,
0.6116312, -1.097361, 1.941018, 1, 1, 1, 1, 1,
0.6195601, -0.1165567, 0.7388011, 0, 0, 1, 1, 1,
0.6222068, -0.6685405, 1.422461, 1, 0, 0, 1, 1,
0.6258628, -1.9141, 2.651006, 1, 0, 0, 1, 1,
0.6274393, 0.1953625, 1.021642, 1, 0, 0, 1, 1,
0.6293608, 0.1983389, 0.8250775, 1, 0, 0, 1, 1,
0.6307108, 2.358857, -0.05446986, 1, 0, 0, 1, 1,
0.6312395, -0.1741313, 2.58214, 0, 0, 0, 1, 1,
0.6438926, -0.2919405, 0.9458062, 0, 0, 0, 1, 1,
0.6442796, 0.3543473, 0.9650542, 0, 0, 0, 1, 1,
0.6490752, -1.367634, 3.899009, 0, 0, 0, 1, 1,
0.6495896, 2.722904, 0.8752337, 0, 0, 0, 1, 1,
0.6570987, -0.4607072, 3.205473, 0, 0, 0, 1, 1,
0.6623269, 0.9139782, 0.5951775, 0, 0, 0, 1, 1,
0.6648152, 0.04343967, 0.1510997, 1, 1, 1, 1, 1,
0.6670552, 0.1715567, 1.639175, 1, 1, 1, 1, 1,
0.6715052, 0.04285932, 2.790064, 1, 1, 1, 1, 1,
0.6751556, 0.07341681, 2.130945, 1, 1, 1, 1, 1,
0.6777781, -0.07859285, 1.079772, 1, 1, 1, 1, 1,
0.6886309, -0.8389009, 0.6888545, 1, 1, 1, 1, 1,
0.6906511, 0.3204602, 1.436327, 1, 1, 1, 1, 1,
0.6913782, -0.09058312, 0.3912246, 1, 1, 1, 1, 1,
0.6942872, -0.250589, 0.8580885, 1, 1, 1, 1, 1,
0.7004066, -0.3322488, 3.834509, 1, 1, 1, 1, 1,
0.7027475, 0.07747523, 0.923506, 1, 1, 1, 1, 1,
0.7038502, -0.9821464, 3.458162, 1, 1, 1, 1, 1,
0.7048347, -0.7706229, 3.27316, 1, 1, 1, 1, 1,
0.707745, 0.6377151, 0.03780701, 1, 1, 1, 1, 1,
0.7079588, 0.1977727, 1.284715, 1, 1, 1, 1, 1,
0.7080386, 0.2399985, -0.1337179, 0, 0, 1, 1, 1,
0.7080986, 1.210239, -0.3060478, 1, 0, 0, 1, 1,
0.7103614, -0.761196, 0.6131889, 1, 0, 0, 1, 1,
0.7145517, 1.015983, 1.295585, 1, 0, 0, 1, 1,
0.7154757, -1.444609, 2.603474, 1, 0, 0, 1, 1,
0.7159439, -1.320047, 1.965758, 1, 0, 0, 1, 1,
0.7162942, 1.191621, 1.719414, 0, 0, 0, 1, 1,
0.7179958, 1.744455, 0.365868, 0, 0, 0, 1, 1,
0.7198935, -0.6236446, 2.598935, 0, 0, 0, 1, 1,
0.7261146, -1.654974, 1.378486, 0, 0, 0, 1, 1,
0.726183, 0.2946182, 0.5327352, 0, 0, 0, 1, 1,
0.7263043, 0.2495398, 1.042678, 0, 0, 0, 1, 1,
0.730234, -0.03404293, 0.7007504, 0, 0, 0, 1, 1,
0.7329387, 1.783515, -0.5080383, 1, 1, 1, 1, 1,
0.7344505, 0.08562695, 2.287167, 1, 1, 1, 1, 1,
0.7360931, -0.6293036, 1.559038, 1, 1, 1, 1, 1,
0.7368068, 0.4350174, 1.081441, 1, 1, 1, 1, 1,
0.7404682, -0.7512509, 2.321006, 1, 1, 1, 1, 1,
0.7673097, -0.120464, 1.248993, 1, 1, 1, 1, 1,
0.7716028, -0.4455266, 1.515933, 1, 1, 1, 1, 1,
0.7719169, 0.7527759, 2.741644, 1, 1, 1, 1, 1,
0.7719664, -0.1581206, 2.948151, 1, 1, 1, 1, 1,
0.7737273, 0.4610291, 0.6568779, 1, 1, 1, 1, 1,
0.7739868, -1.292217, 2.51647, 1, 1, 1, 1, 1,
0.7755231, 0.1807546, 0.2420908, 1, 1, 1, 1, 1,
0.7845129, 1.130398, 1.247612, 1, 1, 1, 1, 1,
0.7854958, -1.178025, 3.351712, 1, 1, 1, 1, 1,
0.7867608, -0.09983998, 1.087801, 1, 1, 1, 1, 1,
0.7950078, -0.4673332, 1.505559, 0, 0, 1, 1, 1,
0.7990544, 0.8731721, -0.3269559, 1, 0, 0, 1, 1,
0.7997386, -0.7059333, 2.842566, 1, 0, 0, 1, 1,
0.8012378, 0.100752, 0.3178681, 1, 0, 0, 1, 1,
0.801945, 0.4498859, 1.790296, 1, 0, 0, 1, 1,
0.8080198, 2.277427, 0.08939254, 1, 0, 0, 1, 1,
0.8112231, 1.2809, -0.4458613, 0, 0, 0, 1, 1,
0.8132573, -0.1113194, 1.486986, 0, 0, 0, 1, 1,
0.8143064, 0.2526798, 0.2122377, 0, 0, 0, 1, 1,
0.8155849, 1.056845, -0.3602028, 0, 0, 0, 1, 1,
0.8170148, 0.3737884, 1.025793, 0, 0, 0, 1, 1,
0.8196697, 2.513854, 1.635371, 0, 0, 0, 1, 1,
0.8234414, 1.076042, 0.4918121, 0, 0, 0, 1, 1,
0.8259091, 1.237615, 1.172437, 1, 1, 1, 1, 1,
0.8272997, 0.952355, 2.010045, 1, 1, 1, 1, 1,
0.8285456, -0.38761, 2.102887, 1, 1, 1, 1, 1,
0.8294951, 0.5381362, 1.091359, 1, 1, 1, 1, 1,
0.8319538, 1.820649, -0.01426791, 1, 1, 1, 1, 1,
0.8372158, -0.03241588, 0.4815121, 1, 1, 1, 1, 1,
0.8380666, 0.8592004, 1.052564, 1, 1, 1, 1, 1,
0.8444005, 0.2826663, 0.1277092, 1, 1, 1, 1, 1,
0.8470843, -0.4216117, 4.409358, 1, 1, 1, 1, 1,
0.850406, 0.3439339, 0.6296013, 1, 1, 1, 1, 1,
0.8505048, 0.3309915, 0.821956, 1, 1, 1, 1, 1,
0.8588052, -0.02558019, 1.249411, 1, 1, 1, 1, 1,
0.8592194, 0.7036682, 0.2239724, 1, 1, 1, 1, 1,
0.8658783, 0.4984864, 1.097273, 1, 1, 1, 1, 1,
0.8691282, 1.056356, 2.139521, 1, 1, 1, 1, 1,
0.8697763, 0.8172905, 1.13725, 0, 0, 1, 1, 1,
0.8716764, -1.76877, 4.140498, 1, 0, 0, 1, 1,
0.8737981, -0.2022448, 2.158589, 1, 0, 0, 1, 1,
0.8741257, 0.6982793, 0.5400551, 1, 0, 0, 1, 1,
0.8865756, 0.07209241, 3.003741, 1, 0, 0, 1, 1,
0.8897006, 1.485722, -1.965589, 1, 0, 0, 1, 1,
0.8973661, 0.9917891, 2.327725, 0, 0, 0, 1, 1,
0.8974431, -0.6993885, 4.38527, 0, 0, 0, 1, 1,
0.9010684, -0.7652694, 1.992157, 0, 0, 0, 1, 1,
0.9060425, 1.031044, -0.03683484, 0, 0, 0, 1, 1,
0.9096565, 0.719591, 1.489601, 0, 0, 0, 1, 1,
0.9187504, 0.4900019, 0.8886423, 0, 0, 0, 1, 1,
0.9358459, -0.4777954, 0.3327287, 0, 0, 0, 1, 1,
0.9423898, 1.915152, 0.6175964, 1, 1, 1, 1, 1,
0.9433206, -1.077887, 2.42239, 1, 1, 1, 1, 1,
0.9570644, -1.223266, 3.027244, 1, 1, 1, 1, 1,
0.9667742, -1.003454, 1.749605, 1, 1, 1, 1, 1,
0.966952, -1.185821, 1.534937, 1, 1, 1, 1, 1,
0.9879205, -1.002581, 0.7467372, 1, 1, 1, 1, 1,
0.9880944, 2.794291, 0.5390913, 1, 1, 1, 1, 1,
0.9901597, 0.4059947, 1.345833, 1, 1, 1, 1, 1,
0.9912464, -1.01168, 2.011305, 1, 1, 1, 1, 1,
0.993667, -2.337809, 3.190337, 1, 1, 1, 1, 1,
0.993793, 0.4361738, 2.702145, 1, 1, 1, 1, 1,
0.9957885, -1.507253, 3.09673, 1, 1, 1, 1, 1,
0.9969302, 0.2909803, 3.349639, 1, 1, 1, 1, 1,
1.004839, 0.5200292, 3.306501, 1, 1, 1, 1, 1,
1.012812, -0.1144321, 2.410904, 1, 1, 1, 1, 1,
1.016623, 0.9902912, -0.4874522, 0, 0, 1, 1, 1,
1.021983, -1.407009, 4.124532, 1, 0, 0, 1, 1,
1.022254, 1.096211, 1.124475, 1, 0, 0, 1, 1,
1.026201, 1.263133, 0.3955118, 1, 0, 0, 1, 1,
1.04008, 1.264622, 0.9151249, 1, 0, 0, 1, 1,
1.041467, -0.3846847, 4.096983, 1, 0, 0, 1, 1,
1.044351, -1.915124, 4.719844, 0, 0, 0, 1, 1,
1.052669, 1.225813, -0.3271185, 0, 0, 0, 1, 1,
1.060968, -0.1170532, 2.670644, 0, 0, 0, 1, 1,
1.066039, -0.8388601, 3.537405, 0, 0, 0, 1, 1,
1.070904, -1.770234, 2.642662, 0, 0, 0, 1, 1,
1.076885, -0.8656856, 1.185798, 0, 0, 0, 1, 1,
1.079899, 1.468231, 2.685689, 0, 0, 0, 1, 1,
1.08552, 0.3489044, 1.498345, 1, 1, 1, 1, 1,
1.088889, 0.4708693, 0.8791498, 1, 1, 1, 1, 1,
1.091123, 0.06546075, 1.063504, 1, 1, 1, 1, 1,
1.098824, -0.2907284, 0.641048, 1, 1, 1, 1, 1,
1.1011, 0.216114, 1.042183, 1, 1, 1, 1, 1,
1.101334, -0.6255856, 0.1213571, 1, 1, 1, 1, 1,
1.109411, -0.9622601, 3.846056, 1, 1, 1, 1, 1,
1.110157, 1.126278, 1.060631, 1, 1, 1, 1, 1,
1.111207, 0.4236814, 1.612541, 1, 1, 1, 1, 1,
1.112255, 0.8689874, 1.308687, 1, 1, 1, 1, 1,
1.116357, -0.4458649, 3.873782, 1, 1, 1, 1, 1,
1.118141, -1.848107, 1.662873, 1, 1, 1, 1, 1,
1.121258, 2.371699, -1.344449, 1, 1, 1, 1, 1,
1.127589, -0.2069939, 3.297033, 1, 1, 1, 1, 1,
1.134614, -1.790138, 2.470202, 1, 1, 1, 1, 1,
1.14003, 0.1433699, 1.39146, 0, 0, 1, 1, 1,
1.140182, -0.6596682, 2.379153, 1, 0, 0, 1, 1,
1.141708, -0.3653973, 1.601145, 1, 0, 0, 1, 1,
1.142271, -0.486465, 3.434819, 1, 0, 0, 1, 1,
1.142716, 0.1451005, 0.870757, 1, 0, 0, 1, 1,
1.143937, 0.8193921, 2.147101, 1, 0, 0, 1, 1,
1.150807, -0.2128325, 1.18674, 0, 0, 0, 1, 1,
1.152054, -0.1336384, 0.9360268, 0, 0, 0, 1, 1,
1.152367, -0.7649374, 2.030778, 0, 0, 0, 1, 1,
1.153552, 0.7516712, 0.2900644, 0, 0, 0, 1, 1,
1.157281, 0.3384922, 1.230827, 0, 0, 0, 1, 1,
1.162435, -0.5090224, 1.428344, 0, 0, 0, 1, 1,
1.166482, 0.001003394, 0.02364165, 0, 0, 0, 1, 1,
1.176887, -0.3522644, 0.9885168, 1, 1, 1, 1, 1,
1.188872, -1.11017, 2.22622, 1, 1, 1, 1, 1,
1.1948, -0.8501142, 1.001984, 1, 1, 1, 1, 1,
1.200799, 0.8248725, 0.9574727, 1, 1, 1, 1, 1,
1.205753, -0.497256, 0.9642591, 1, 1, 1, 1, 1,
1.212212, 0.5290845, 1.69007, 1, 1, 1, 1, 1,
1.216214, 1.124161, 0.6074202, 1, 1, 1, 1, 1,
1.216367, -1.086198, 3.654534, 1, 1, 1, 1, 1,
1.218725, 0.9391499, -1.544619, 1, 1, 1, 1, 1,
1.226902, -0.05993604, 3.088211, 1, 1, 1, 1, 1,
1.234058, 0.5555668, 1.991602, 1, 1, 1, 1, 1,
1.240289, -1.015742, 1.794317, 1, 1, 1, 1, 1,
1.248974, 0.3084162, 1.133257, 1, 1, 1, 1, 1,
1.257472, -0.6148294, 0.4187765, 1, 1, 1, 1, 1,
1.263697, -0.3165168, 0.5601245, 1, 1, 1, 1, 1,
1.264739, 0.8200951, 1.432595, 0, 0, 1, 1, 1,
1.279081, 0.08917364, 0.720518, 1, 0, 0, 1, 1,
1.291754, -1.981884, 1.598014, 1, 0, 0, 1, 1,
1.294628, 0.7143701, 1.703793, 1, 0, 0, 1, 1,
1.295603, -1.330852, 4.037283, 1, 0, 0, 1, 1,
1.306886, 0.3063523, 0.3673727, 1, 0, 0, 1, 1,
1.317357, 0.8172294, 0.7384942, 0, 0, 0, 1, 1,
1.321573, 0.6139432, 2.190295, 0, 0, 0, 1, 1,
1.323106, 0.2179424, -0.4062041, 0, 0, 0, 1, 1,
1.350911, -1.523521, 3.559221, 0, 0, 0, 1, 1,
1.355746, -0.7212445, 0.6752092, 0, 0, 0, 1, 1,
1.362661, -0.02132006, 0.463188, 0, 0, 0, 1, 1,
1.364592, -0.1940999, 0.2920109, 0, 0, 0, 1, 1,
1.365779, 0.5066735, 1.912082, 1, 1, 1, 1, 1,
1.380377, -0.1600231, 2.697186, 1, 1, 1, 1, 1,
1.393234, 1.736063, 0.3671901, 1, 1, 1, 1, 1,
1.397574, 0.3852872, 0.04879123, 1, 1, 1, 1, 1,
1.402816, -0.5512342, 0.7238361, 1, 1, 1, 1, 1,
1.409154, 0.08642159, 2.499151, 1, 1, 1, 1, 1,
1.414779, 0.5468429, 1.487286, 1, 1, 1, 1, 1,
1.418864, -0.01838691, 0.2506869, 1, 1, 1, 1, 1,
1.418866, -0.2822704, -0.3956288, 1, 1, 1, 1, 1,
1.42288, 0.8122714, 1.391708, 1, 1, 1, 1, 1,
1.42906, 0.07179628, 0.5906883, 1, 1, 1, 1, 1,
1.431981, -0.3797193, 1.531653, 1, 1, 1, 1, 1,
1.433506, -0.4475434, 2.123408, 1, 1, 1, 1, 1,
1.45252, 0.305139, 0.9324233, 1, 1, 1, 1, 1,
1.454821, 0.1159848, 0.9674132, 1, 1, 1, 1, 1,
1.461421, 1.155417, -0.04680127, 0, 0, 1, 1, 1,
1.465061, 0.03878264, 0.1487492, 1, 0, 0, 1, 1,
1.471484, 0.9557717, 0.49235, 1, 0, 0, 1, 1,
1.477709, -0.4466551, 0.5834834, 1, 0, 0, 1, 1,
1.504507, 0.588561, 2.19759, 1, 0, 0, 1, 1,
1.504788, 0.610313, 0.5810083, 1, 0, 0, 1, 1,
1.508612, -1.274075, 1.95662, 0, 0, 0, 1, 1,
1.509339, 1.229055, 0.8023308, 0, 0, 0, 1, 1,
1.51008, -2.014321, 2.67301, 0, 0, 0, 1, 1,
1.51898, -1.029587, 2.574168, 0, 0, 0, 1, 1,
1.534064, -1.127929, 3.696155, 0, 0, 0, 1, 1,
1.541824, 0.01407899, 0.5577293, 0, 0, 0, 1, 1,
1.550406, -1.442201, 4.222717, 0, 0, 0, 1, 1,
1.552863, 0.8541355, -0.5569935, 1, 1, 1, 1, 1,
1.558212, -0.1670443, 1.5444, 1, 1, 1, 1, 1,
1.601438, -0.1489265, 1.389897, 1, 1, 1, 1, 1,
1.602674, -1.022845, 3.238062, 1, 1, 1, 1, 1,
1.615392, -0.8864582, 0.9494127, 1, 1, 1, 1, 1,
1.618791, 0.5629929, 0.7188181, 1, 1, 1, 1, 1,
1.620832, -2.129751, 5.131522, 1, 1, 1, 1, 1,
1.62438, -0.2160796, 1.288211, 1, 1, 1, 1, 1,
1.631854, -0.461354, 3.616987, 1, 1, 1, 1, 1,
1.651831, 0.7519562, -0.2256355, 1, 1, 1, 1, 1,
1.655246, 0.6031425, 1.635294, 1, 1, 1, 1, 1,
1.656401, -0.8903378, 2.046617, 1, 1, 1, 1, 1,
1.659655, -0.6533153, 2.552503, 1, 1, 1, 1, 1,
1.660325, -0.5878695, 0.7316063, 1, 1, 1, 1, 1,
1.663044, 0.7492267, 0.8984486, 1, 1, 1, 1, 1,
1.667149, -0.6476701, 2.077761, 0, 0, 1, 1, 1,
1.672164, 0.9511779, 1.088132, 1, 0, 0, 1, 1,
1.672814, -0.4606835, 4.096788, 1, 0, 0, 1, 1,
1.677285, -0.4787843, 3.786705, 1, 0, 0, 1, 1,
1.686921, 0.1523927, 1.115855, 1, 0, 0, 1, 1,
1.689326, 0.7016757, 0.9488607, 1, 0, 0, 1, 1,
1.693441, 0.3573557, 2.896613, 0, 0, 0, 1, 1,
1.694654, 0.7805865, 0.6897224, 0, 0, 0, 1, 1,
1.705911, -1.328423, 1.013297, 0, 0, 0, 1, 1,
1.709886, -1.518723, 3.361795, 0, 0, 0, 1, 1,
1.720789, 0.871886, 1.323599, 0, 0, 0, 1, 1,
1.741215, 0.3133874, 1.093448, 0, 0, 0, 1, 1,
1.76556, 0.01751758, 0.7446462, 0, 0, 0, 1, 1,
1.773263, 0.230641, 2.774479, 1, 1, 1, 1, 1,
1.786763, -0.9405673, 1.175186, 1, 1, 1, 1, 1,
1.789975, 0.3579663, 1.142111, 1, 1, 1, 1, 1,
1.814278, -0.4581391, 4.148152, 1, 1, 1, 1, 1,
1.826642, 0.09462275, 0.2170163, 1, 1, 1, 1, 1,
1.851247, -0.07634995, 2.172388, 1, 1, 1, 1, 1,
1.8594, 0.7788582, 1.074701, 1, 1, 1, 1, 1,
1.888904, 1.411683, 1.723065, 1, 1, 1, 1, 1,
1.889438, -0.6020139, 1.917031, 1, 1, 1, 1, 1,
1.892869, -0.6822556, 1.91397, 1, 1, 1, 1, 1,
1.90831, 1.290232, -0.5289698, 1, 1, 1, 1, 1,
1.908813, -0.2807572, 0.721159, 1, 1, 1, 1, 1,
1.994733, 0.9469506, 2.413782, 1, 1, 1, 1, 1,
1.995114, 0.1969199, 2.320076, 1, 1, 1, 1, 1,
2.035017, 0.4478834, 0.8489691, 1, 1, 1, 1, 1,
2.039672, 0.4200972, -0.0741083, 0, 0, 1, 1, 1,
2.127262, 0.04294841, 0.852805, 1, 0, 0, 1, 1,
2.16264, -1.513136, 2.721588, 1, 0, 0, 1, 1,
2.18917, -0.1560469, 0.6760831, 1, 0, 0, 1, 1,
2.19045, -0.9660904, 2.615108, 1, 0, 0, 1, 1,
2.195134, -1.798032, 3.175222, 1, 0, 0, 1, 1,
2.204335, -0.5958734, 2.325548, 0, 0, 0, 1, 1,
2.207136, -0.3335845, 2.283391, 0, 0, 0, 1, 1,
2.213728, 2.028901, 1.878296, 0, 0, 0, 1, 1,
2.214131, 2.758233, -0.08247721, 0, 0, 0, 1, 1,
2.23252, 0.7646406, 3.323932, 0, 0, 0, 1, 1,
2.284586, 2.505028, -0.2113657, 0, 0, 0, 1, 1,
2.310669, -0.9366887, 2.494774, 0, 0, 0, 1, 1,
2.540633, -0.3224752, 2.441047, 1, 1, 1, 1, 1,
2.543345, -0.7454711, 1.965461, 1, 1, 1, 1, 1,
2.562334, 0.1525733, 1.955917, 1, 1, 1, 1, 1,
2.619862, 2.002308, -0.2001776, 1, 1, 1, 1, 1,
2.940163, -1.417871, 2.501016, 1, 1, 1, 1, 1,
3.007491, -0.2558312, 0.7088048, 1, 1, 1, 1, 1,
3.074152, 1.775556, 3.250417, 1, 1, 1, 1, 1
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
var radius = 9.386643;
var distance = 32.97018;
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
mvMatrix.translate( 0.2491164, -0.001002669, -0.07945156 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97018);
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
