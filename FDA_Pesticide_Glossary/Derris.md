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
-3.075754, -1.291034, -4.088506, 1, 0, 0, 1,
-2.377059, 0.3737944, -0.1324397, 1, 0.007843138, 0, 1,
-2.349484, 1.628329, -0.5204664, 1, 0.01176471, 0, 1,
-2.223003, 1.715721, -0.04893209, 1, 0.01960784, 0, 1,
-2.166341, -0.3904419, -1.587264, 1, 0.02352941, 0, 1,
-2.164584, 0.6486455, -1.452957, 1, 0.03137255, 0, 1,
-2.10256, 0.03594733, -2.548149, 1, 0.03529412, 0, 1,
-2.087828, 1.528953, -0.8972173, 1, 0.04313726, 0, 1,
-2.049372, -0.2571793, -0.7771488, 1, 0.04705882, 0, 1,
-2.022825, -0.2490433, -0.9511206, 1, 0.05490196, 0, 1,
-2.022056, -0.6957209, -1.990629, 1, 0.05882353, 0, 1,
-1.986686, -0.3626646, -1.880344, 1, 0.06666667, 0, 1,
-1.93605, 1.274091, -1.032343, 1, 0.07058824, 0, 1,
-1.935234, 0.895128, -1.185261, 1, 0.07843138, 0, 1,
-1.922831, -1.079444, -1.687186, 1, 0.08235294, 0, 1,
-1.912502, 0.5853085, -2.159741, 1, 0.09019608, 0, 1,
-1.902033, -0.1061844, -0.5351791, 1, 0.09411765, 0, 1,
-1.876966, -0.4764741, -2.751202, 1, 0.1019608, 0, 1,
-1.866435, 0.905547, -3.14436, 1, 0.1098039, 0, 1,
-1.820636, -0.5582118, -0.8335845, 1, 0.1137255, 0, 1,
-1.784717, 0.09941509, -2.264165, 1, 0.1215686, 0, 1,
-1.783302, 1.025537, 0.7454345, 1, 0.1254902, 0, 1,
-1.774518, 1.098542, -0.9524533, 1, 0.1333333, 0, 1,
-1.723839, -0.4114976, -1.697775, 1, 0.1372549, 0, 1,
-1.721051, 1.000837, -0.1929935, 1, 0.145098, 0, 1,
-1.714234, 0.7013915, -1.193846, 1, 0.1490196, 0, 1,
-1.707575, -0.4685523, -1.948653, 1, 0.1568628, 0, 1,
-1.692404, 0.6117941, -2.72245, 1, 0.1607843, 0, 1,
-1.687923, -0.7296362, -1.052004, 1, 0.1686275, 0, 1,
-1.686409, -0.9716401, -4.668997, 1, 0.172549, 0, 1,
-1.682042, 1.439795, -2.01977, 1, 0.1803922, 0, 1,
-1.678721, -0.2955737, -1.241488, 1, 0.1843137, 0, 1,
-1.672052, 2.390256, -0.07576144, 1, 0.1921569, 0, 1,
-1.663776, 0.6701667, -1.699023, 1, 0.1960784, 0, 1,
-1.660461, 0.03433307, -2.164203, 1, 0.2039216, 0, 1,
-1.659287, -1.954226, 0.3606928, 1, 0.2117647, 0, 1,
-1.645806, -0.7677869, -2.450545, 1, 0.2156863, 0, 1,
-1.641213, -1.333066, -2.477975, 1, 0.2235294, 0, 1,
-1.636462, -0.8697256, -1.59741, 1, 0.227451, 0, 1,
-1.635341, 2.027102, -0.5704495, 1, 0.2352941, 0, 1,
-1.62831, 0.5152708, -0.7685378, 1, 0.2392157, 0, 1,
-1.616528, 0.3285991, -1.853502, 1, 0.2470588, 0, 1,
-1.603631, -0.8456479, -2.423714, 1, 0.2509804, 0, 1,
-1.601562, 0.6847898, -0.1369336, 1, 0.2588235, 0, 1,
-1.595918, -0.3493868, -1.764421, 1, 0.2627451, 0, 1,
-1.586488, 0.6341739, -1.895696, 1, 0.2705882, 0, 1,
-1.584431, 0.3230368, -2.04679, 1, 0.2745098, 0, 1,
-1.57913, -2.054561, -1.152088, 1, 0.282353, 0, 1,
-1.564508, -0.4025715, -1.438658, 1, 0.2862745, 0, 1,
-1.563984, -0.5766819, -3.006606, 1, 0.2941177, 0, 1,
-1.559409, 2.731679, -0.1133181, 1, 0.3019608, 0, 1,
-1.543904, -1.402982, -2.851994, 1, 0.3058824, 0, 1,
-1.543886, 0.8345217, -0.2412409, 1, 0.3137255, 0, 1,
-1.543823, -0.4223384, -1.200534, 1, 0.3176471, 0, 1,
-1.538143, 2.16431, -2.66934, 1, 0.3254902, 0, 1,
-1.532977, -0.7743338, -3.052353, 1, 0.3294118, 0, 1,
-1.519475, 1.032394, -1.25843, 1, 0.3372549, 0, 1,
-1.51676, -0.4275971, -2.390358, 1, 0.3411765, 0, 1,
-1.504651, 0.8115352, -0.7005422, 1, 0.3490196, 0, 1,
-1.500866, -0.2008345, -2.446318, 1, 0.3529412, 0, 1,
-1.497313, -2.069581, -2.21694, 1, 0.3607843, 0, 1,
-1.493925, 0.8254964, -1.912415, 1, 0.3647059, 0, 1,
-1.490874, -1.907727, -3.788991, 1, 0.372549, 0, 1,
-1.47676, 0.3525977, 0.1831551, 1, 0.3764706, 0, 1,
-1.471993, -1.483957, -1.767194, 1, 0.3843137, 0, 1,
-1.470514, -0.5704033, -3.200219, 1, 0.3882353, 0, 1,
-1.46484, 1.018733, -2.334918, 1, 0.3960784, 0, 1,
-1.459815, -0.4146959, -2.291979, 1, 0.4039216, 0, 1,
-1.421565, -0.3148175, -0.8249243, 1, 0.4078431, 0, 1,
-1.414924, -0.415729, -1.667117, 1, 0.4156863, 0, 1,
-1.410145, 0.01875164, 0.03522617, 1, 0.4196078, 0, 1,
-1.406682, 0.9948168, -1.224931, 1, 0.427451, 0, 1,
-1.40348, 0.7419133, -2.099813, 1, 0.4313726, 0, 1,
-1.393767, -0.8115322, -1.223434, 1, 0.4392157, 0, 1,
-1.386077, 1.234234, 0.2993376, 1, 0.4431373, 0, 1,
-1.376172, 0.3850686, -0.7592106, 1, 0.4509804, 0, 1,
-1.364724, -1.385266, -2.005393, 1, 0.454902, 0, 1,
-1.358193, 1.098253, -0.03053017, 1, 0.4627451, 0, 1,
-1.355979, -0.03867783, -1.707175, 1, 0.4666667, 0, 1,
-1.346891, -0.9942806, -2.077025, 1, 0.4745098, 0, 1,
-1.333852, 1.383129, 0.701145, 1, 0.4784314, 0, 1,
-1.325893, -0.01120899, -3.241567, 1, 0.4862745, 0, 1,
-1.322982, -0.4946637, -1.474621, 1, 0.4901961, 0, 1,
-1.321295, 0.5819299, -1.840786, 1, 0.4980392, 0, 1,
-1.320838, -0.6456213, -2.873569, 1, 0.5058824, 0, 1,
-1.314265, 0.7572857, 0.15116, 1, 0.509804, 0, 1,
-1.304048, -0.2822101, -1.004058, 1, 0.5176471, 0, 1,
-1.300641, -0.7857044, -1.015771, 1, 0.5215687, 0, 1,
-1.289245, -1.126685, -2.140543, 1, 0.5294118, 0, 1,
-1.288128, 1.490404, -1.764969, 1, 0.5333334, 0, 1,
-1.284154, -0.9501843, -2.340462, 1, 0.5411765, 0, 1,
-1.273777, -0.5144981, -0.9691411, 1, 0.5450981, 0, 1,
-1.256854, -0.3947075, -1.079909, 1, 0.5529412, 0, 1,
-1.254094, -0.09699222, -1.673594, 1, 0.5568628, 0, 1,
-1.253519, -1.000585, -3.826658, 1, 0.5647059, 0, 1,
-1.25251, 1.207118, -2.423119, 1, 0.5686275, 0, 1,
-1.252385, -0.6886278, -0.6320734, 1, 0.5764706, 0, 1,
-1.25154, 0.810922, -1.925095, 1, 0.5803922, 0, 1,
-1.24698, -0.5668845, -0.7013755, 1, 0.5882353, 0, 1,
-1.245223, -0.6717085, -0.9296932, 1, 0.5921569, 0, 1,
-1.230525, -0.6884485, -1.993326, 1, 0.6, 0, 1,
-1.216598, -1.59698, -2.001153, 1, 0.6078432, 0, 1,
-1.214666, 0.1890668, -2.027749, 1, 0.6117647, 0, 1,
-1.210997, 0.550143, -0.2466983, 1, 0.6196079, 0, 1,
-1.20427, -0.8015229, -1.561334, 1, 0.6235294, 0, 1,
-1.196965, 1.872833, -1.374433, 1, 0.6313726, 0, 1,
-1.185936, 0.4175072, -0.6485025, 1, 0.6352941, 0, 1,
-1.18356, 1.69394, 0.07976032, 1, 0.6431373, 0, 1,
-1.170271, 1.251537, -1.625174, 1, 0.6470588, 0, 1,
-1.164867, -0.2146265, -1.20923, 1, 0.654902, 0, 1,
-1.158046, -0.1399207, -1.521039, 1, 0.6588235, 0, 1,
-1.154797, 0.9456675, 0.02894155, 1, 0.6666667, 0, 1,
-1.153165, 2.414726, -1.588712, 1, 0.6705883, 0, 1,
-1.148079, 1.433517, 0.5519453, 1, 0.6784314, 0, 1,
-1.147912, -0.1330142, -1.568938, 1, 0.682353, 0, 1,
-1.1402, 1.724775, -1.09046, 1, 0.6901961, 0, 1,
-1.137449, 1.360074, 0.6372676, 1, 0.6941177, 0, 1,
-1.132527, -0.4152486, -1.488489, 1, 0.7019608, 0, 1,
-1.132089, 0.9542856, -0.4610555, 1, 0.7098039, 0, 1,
-1.119262, 1.230478, -0.4714234, 1, 0.7137255, 0, 1,
-1.090346, -2.258967, -4.466538, 1, 0.7215686, 0, 1,
-1.08989, 0.4427927, 0.05740184, 1, 0.7254902, 0, 1,
-1.089815, -0.7573009, -1.76966, 1, 0.7333333, 0, 1,
-1.087293, 0.8281024, -1.146229, 1, 0.7372549, 0, 1,
-1.084198, -1.743169, -4.415051, 1, 0.7450981, 0, 1,
-1.0822, -0.2745385, -1.407167, 1, 0.7490196, 0, 1,
-1.081245, 0.02364117, -1.556174, 1, 0.7568628, 0, 1,
-1.078918, 1.039109, -0.1014741, 1, 0.7607843, 0, 1,
-1.076833, 1.439894, 0.07553631, 1, 0.7686275, 0, 1,
-1.067564, 0.1787297, -1.445184, 1, 0.772549, 0, 1,
-1.064704, -0.2169553, -0.9740043, 1, 0.7803922, 0, 1,
-1.059421, -0.9847826, -3.480158, 1, 0.7843137, 0, 1,
-1.040621, -0.1179216, -2.924056, 1, 0.7921569, 0, 1,
-1.036409, -1.197685, -1.608991, 1, 0.7960784, 0, 1,
-1.027939, -3.831791, -3.286369, 1, 0.8039216, 0, 1,
-1.027217, 0.6838343, 0.58328, 1, 0.8117647, 0, 1,
-1.022523, -0.02571058, -2.089525, 1, 0.8156863, 0, 1,
-1.021361, 1.128867, -0.329458, 1, 0.8235294, 0, 1,
-1.020034, -0.4009475, -0.8775458, 1, 0.827451, 0, 1,
-1.019689, -0.1948614, -1.455297, 1, 0.8352941, 0, 1,
-1.016774, -0.5784425, -3.986747, 1, 0.8392157, 0, 1,
-1.015266, -0.08694565, -1.599401, 1, 0.8470588, 0, 1,
-1.001946, -0.49274, -1.346266, 1, 0.8509804, 0, 1,
-1.000175, 0.1486498, -2.249696, 1, 0.8588235, 0, 1,
-0.995785, -0.6476681, -1.701362, 1, 0.8627451, 0, 1,
-0.9884318, 0.370462, -0.8445485, 1, 0.8705882, 0, 1,
-0.9800383, -0.1736509, -1.69842, 1, 0.8745098, 0, 1,
-0.978487, 1.76329, -1.78422, 1, 0.8823529, 0, 1,
-0.976795, 0.2500286, 0.1200728, 1, 0.8862745, 0, 1,
-0.9678586, 0.516423, -3.173464, 1, 0.8941177, 0, 1,
-0.9635395, -0.8207564, -2.481109, 1, 0.8980392, 0, 1,
-0.9508507, 0.4540541, -1.124065, 1, 0.9058824, 0, 1,
-0.9503355, -1.458238, -1.524284, 1, 0.9137255, 0, 1,
-0.948827, 0.6850376, -1.643516, 1, 0.9176471, 0, 1,
-0.9482105, 0.9842727, -1.388725, 1, 0.9254902, 0, 1,
-0.9442509, -1.561832, -3.195737, 1, 0.9294118, 0, 1,
-0.9436129, -0.241054, -1.37722, 1, 0.9372549, 0, 1,
-0.9419466, 1.061323, 0.7722753, 1, 0.9411765, 0, 1,
-0.9409077, 1.252803, -1.669824, 1, 0.9490196, 0, 1,
-0.9401832, -0.8895527, -3.542259, 1, 0.9529412, 0, 1,
-0.9397915, -1.333113, -4.064656, 1, 0.9607843, 0, 1,
-0.9326296, -0.8130355, -3.775105, 1, 0.9647059, 0, 1,
-0.9323859, 0.005700698, -0.4237554, 1, 0.972549, 0, 1,
-0.9297271, -1.733029, -3.272145, 1, 0.9764706, 0, 1,
-0.929273, 0.441935, -2.489849, 1, 0.9843137, 0, 1,
-0.9290319, -2.115921, -1.826189, 1, 0.9882353, 0, 1,
-0.9233487, 0.06867325, -1.980019, 1, 0.9960784, 0, 1,
-0.9180326, 0.3710306, -2.276664, 0.9960784, 1, 0, 1,
-0.9179763, 1.271771, 0.8685586, 0.9921569, 1, 0, 1,
-0.9147767, -0.4740937, -4.326311, 0.9843137, 1, 0, 1,
-0.9143811, -2.246503, -2.26992, 0.9803922, 1, 0, 1,
-0.8978374, 1.929783, -0.1055593, 0.972549, 1, 0, 1,
-0.8973338, 0.3112456, -0.3930477, 0.9686275, 1, 0, 1,
-0.8917344, -0.3282955, -1.201056, 0.9607843, 1, 0, 1,
-0.8767433, -0.08101512, -0.2915983, 0.9568627, 1, 0, 1,
-0.8756548, -0.6144924, -3.970503, 0.9490196, 1, 0, 1,
-0.8721116, 0.6308675, -0.2017631, 0.945098, 1, 0, 1,
-0.8691236, -0.8246647, -1.565646, 0.9372549, 1, 0, 1,
-0.8669913, -0.4939288, -3.29605, 0.9333333, 1, 0, 1,
-0.8573912, -1.488915, -3.728619, 0.9254902, 1, 0, 1,
-0.8542341, -0.3483509, -2.738915, 0.9215686, 1, 0, 1,
-0.8524415, 0.1885989, 0.9935414, 0.9137255, 1, 0, 1,
-0.8511326, -3.161779, -2.862216, 0.9098039, 1, 0, 1,
-0.8455863, -0.8383514, -2.283914, 0.9019608, 1, 0, 1,
-0.8449951, -2.128773, -1.684877, 0.8941177, 1, 0, 1,
-0.8445057, 1.60586, -1.730319, 0.8901961, 1, 0, 1,
-0.8434867, -1.524693, -4.593211, 0.8823529, 1, 0, 1,
-0.8417049, 0.7861004, -1.248673, 0.8784314, 1, 0, 1,
-0.8416126, 1.45528, 0.6772935, 0.8705882, 1, 0, 1,
-0.8355483, -0.6323975, -2.396022, 0.8666667, 1, 0, 1,
-0.8327314, 1.352945, -1.872821, 0.8588235, 1, 0, 1,
-0.829852, 0.6965432, -0.7748651, 0.854902, 1, 0, 1,
-0.8290792, 0.4280555, -1.118538, 0.8470588, 1, 0, 1,
-0.8236848, 0.4202718, -1.02137, 0.8431373, 1, 0, 1,
-0.8236112, -1.136556, -2.77864, 0.8352941, 1, 0, 1,
-0.8207777, 0.2064875, -1.070211, 0.8313726, 1, 0, 1,
-0.8190395, 1.416744, 1.65088, 0.8235294, 1, 0, 1,
-0.8159294, 0.7766943, -0.6920693, 0.8196079, 1, 0, 1,
-0.8108569, -0.4282477, -1.449422, 0.8117647, 1, 0, 1,
-0.8037753, -1.783956, -1.923452, 0.8078431, 1, 0, 1,
-0.8033434, -0.6613094, -1.592031, 0.8, 1, 0, 1,
-0.8033353, -0.2207847, -1.380938, 0.7921569, 1, 0, 1,
-0.8029329, -2.130059, -1.86568, 0.7882353, 1, 0, 1,
-0.8026079, -1.363228, -1.777053, 0.7803922, 1, 0, 1,
-0.7866409, 0.9543993, -0.9757454, 0.7764706, 1, 0, 1,
-0.7831026, -1.353462, -3.978371, 0.7686275, 1, 0, 1,
-0.7828645, 1.092407, -1.168658, 0.7647059, 1, 0, 1,
-0.7819636, -0.148759, -1.551702, 0.7568628, 1, 0, 1,
-0.7722262, 0.852211, -2.444887, 0.7529412, 1, 0, 1,
-0.7718322, 0.902962, -0.1715861, 0.7450981, 1, 0, 1,
-0.7701481, -0.2248084, -1.655457, 0.7411765, 1, 0, 1,
-0.7690086, -1.635956, -2.200819, 0.7333333, 1, 0, 1,
-0.7647246, -2.537268, -2.294642, 0.7294118, 1, 0, 1,
-0.7614575, 0.7395766, 0.742655, 0.7215686, 1, 0, 1,
-0.7606829, -0.02487905, 0.4292983, 0.7176471, 1, 0, 1,
-0.7599226, -1.625138, -3.49599, 0.7098039, 1, 0, 1,
-0.7585157, 0.8293335, -2.31598, 0.7058824, 1, 0, 1,
-0.7561998, -0.05072862, -2.50252, 0.6980392, 1, 0, 1,
-0.7555071, 0.3607523, -0.6062726, 0.6901961, 1, 0, 1,
-0.7470561, -0.1007194, -0.6135713, 0.6862745, 1, 0, 1,
-0.7468805, 0.3974382, -0.5370051, 0.6784314, 1, 0, 1,
-0.7463325, -0.3356897, -1.966516, 0.6745098, 1, 0, 1,
-0.7445702, 0.1801471, -0.9698052, 0.6666667, 1, 0, 1,
-0.7439675, 1.2472, 0.3105939, 0.6627451, 1, 0, 1,
-0.7401105, 0.09824847, -0.7554066, 0.654902, 1, 0, 1,
-0.7388731, 0.5549061, -0.4641295, 0.6509804, 1, 0, 1,
-0.7385835, 0.06568341, -0.4425071, 0.6431373, 1, 0, 1,
-0.7254192, 1.648035, 0.05098137, 0.6392157, 1, 0, 1,
-0.7231275, 2.093329, -0.7636747, 0.6313726, 1, 0, 1,
-0.7228842, -0.3642392, -2.253397, 0.627451, 1, 0, 1,
-0.7221724, -1.890826, -4.26267, 0.6196079, 1, 0, 1,
-0.7218527, -1.386874, -3.104414, 0.6156863, 1, 0, 1,
-0.715359, -2.681961, -0.6238631, 0.6078432, 1, 0, 1,
-0.7092706, -1.211432, -3.200817, 0.6039216, 1, 0, 1,
-0.7079679, 0.3305031, -1.634398, 0.5960785, 1, 0, 1,
-0.6927099, 0.2363532, 0.4069465, 0.5882353, 1, 0, 1,
-0.6902855, -0.3688363, -1.933071, 0.5843138, 1, 0, 1,
-0.6893531, -0.2834185, -0.6685384, 0.5764706, 1, 0, 1,
-0.6889016, -0.5049209, -2.330701, 0.572549, 1, 0, 1,
-0.6888828, 0.4031798, -3.42606, 0.5647059, 1, 0, 1,
-0.6845053, 0.02965706, -0.9010438, 0.5607843, 1, 0, 1,
-0.6790056, -1.217724, -3.327023, 0.5529412, 1, 0, 1,
-0.6764836, 2.121382, -1.953098, 0.5490196, 1, 0, 1,
-0.6764738, 0.4661483, 0.630024, 0.5411765, 1, 0, 1,
-0.672872, -1.095413, -1.481212, 0.5372549, 1, 0, 1,
-0.669789, -0.1715715, -2.066181, 0.5294118, 1, 0, 1,
-0.6673591, 2.403843, 1.113325, 0.5254902, 1, 0, 1,
-0.6658141, -1.535225, -2.939507, 0.5176471, 1, 0, 1,
-0.6647844, -0.3992243, -2.596166, 0.5137255, 1, 0, 1,
-0.6644305, -1.78028, -3.048547, 0.5058824, 1, 0, 1,
-0.6615407, -1.282288, -1.979986, 0.5019608, 1, 0, 1,
-0.6589284, -0.6861167, -2.292965, 0.4941176, 1, 0, 1,
-0.658321, -0.4987742, -3.877272, 0.4862745, 1, 0, 1,
-0.6533589, -0.4709845, -3.272112, 0.4823529, 1, 0, 1,
-0.6501577, 1.052444, -2.649838, 0.4745098, 1, 0, 1,
-0.6494631, 0.04977401, -1.647708, 0.4705882, 1, 0, 1,
-0.6472632, 1.556347, -1.654433, 0.4627451, 1, 0, 1,
-0.644869, 1.030371, -0.4757355, 0.4588235, 1, 0, 1,
-0.6439904, 0.8394899, -1.874767, 0.4509804, 1, 0, 1,
-0.6418443, 1.722307, 0.9233504, 0.4470588, 1, 0, 1,
-0.6407352, -0.8863423, -5.166766, 0.4392157, 1, 0, 1,
-0.639322, -0.1874496, -2.527126, 0.4352941, 1, 0, 1,
-0.6391703, 0.1150588, -1.933365, 0.427451, 1, 0, 1,
-0.6373188, 1.678282, -1.943278, 0.4235294, 1, 0, 1,
-0.6322953, 0.8220018, 0.3280304, 0.4156863, 1, 0, 1,
-0.6282902, 1.018714, -0.6916147, 0.4117647, 1, 0, 1,
-0.6267182, 0.6309288, -2.657092, 0.4039216, 1, 0, 1,
-0.6226509, -0.5416434, -2.527779, 0.3960784, 1, 0, 1,
-0.6009549, -0.8261285, -1.741769, 0.3921569, 1, 0, 1,
-0.5995277, 0.3837163, 0.1317155, 0.3843137, 1, 0, 1,
-0.5958034, 0.3517046, -1.423246, 0.3803922, 1, 0, 1,
-0.5953284, -1.134104, -4.523939, 0.372549, 1, 0, 1,
-0.5913275, -1.66621, -4.05029, 0.3686275, 1, 0, 1,
-0.5911331, 1.158237, -0.8499756, 0.3607843, 1, 0, 1,
-0.5886458, 0.1069182, -2.411332, 0.3568628, 1, 0, 1,
-0.5850922, -0.03776089, -1.814874, 0.3490196, 1, 0, 1,
-0.5847839, 0.2817644, -1.628622, 0.345098, 1, 0, 1,
-0.5846326, 1.243312, -0.5166326, 0.3372549, 1, 0, 1,
-0.5824714, 0.5300784, -2.253498, 0.3333333, 1, 0, 1,
-0.5818636, 0.02793235, -0.2849084, 0.3254902, 1, 0, 1,
-0.5796416, 0.6537489, -2.287219, 0.3215686, 1, 0, 1,
-0.5784191, -0.3286266, -3.071796, 0.3137255, 1, 0, 1,
-0.576043, 0.4523354, -0.7581667, 0.3098039, 1, 0, 1,
-0.5750892, 0.986324, -0.8185763, 0.3019608, 1, 0, 1,
-0.5741497, -1.289023, -4.039062, 0.2941177, 1, 0, 1,
-0.5683288, -0.6177756, -2.879363, 0.2901961, 1, 0, 1,
-0.5636507, 1.324557, 0.2166679, 0.282353, 1, 0, 1,
-0.5616837, -0.9166365, -2.106372, 0.2784314, 1, 0, 1,
-0.554815, -0.3921302, -1.79076, 0.2705882, 1, 0, 1,
-0.5536894, 0.4630243, -0.7224402, 0.2666667, 1, 0, 1,
-0.5528304, -1.763455, -4.169086, 0.2588235, 1, 0, 1,
-0.5467064, -2.154057, -4.771416, 0.254902, 1, 0, 1,
-0.5465624, 0.8490672, -0.007737658, 0.2470588, 1, 0, 1,
-0.5451255, -0.6048352, -2.91714, 0.2431373, 1, 0, 1,
-0.5437659, -0.5804246, -2.453977, 0.2352941, 1, 0, 1,
-0.5368963, 1.046103, -1.651662, 0.2313726, 1, 0, 1,
-0.5334388, 0.722458, 0.5280567, 0.2235294, 1, 0, 1,
-0.532413, -0.7299806, -2.724527, 0.2196078, 1, 0, 1,
-0.530977, 1.918743, -1.141398, 0.2117647, 1, 0, 1,
-0.5309368, -1.929788, -0.5832776, 0.2078431, 1, 0, 1,
-0.5305963, -0.08656016, -2.153465, 0.2, 1, 0, 1,
-0.5137385, -0.9615517, -2.53756, 0.1921569, 1, 0, 1,
-0.5129521, 0.8085527, 0.1134653, 0.1882353, 1, 0, 1,
-0.5105258, 1.659422, 0.412705, 0.1803922, 1, 0, 1,
-0.5102414, -1.010272, -3.391859, 0.1764706, 1, 0, 1,
-0.5094992, 1.354474, -0.8476304, 0.1686275, 1, 0, 1,
-0.5001558, 1.157624, 0.9085291, 0.1647059, 1, 0, 1,
-0.4974215, 1.457689, 0.1531695, 0.1568628, 1, 0, 1,
-0.4960392, -0.08270763, -1.786615, 0.1529412, 1, 0, 1,
-0.4922192, -0.6800345, -3.092407, 0.145098, 1, 0, 1,
-0.4897956, -0.4491464, -2.129679, 0.1411765, 1, 0, 1,
-0.4838381, -0.8352709, -2.461322, 0.1333333, 1, 0, 1,
-0.4835628, -0.7668514, -2.908935, 0.1294118, 1, 0, 1,
-0.4825422, 0.7817798, 1.362115, 0.1215686, 1, 0, 1,
-0.4819197, -0.4895813, -2.536172, 0.1176471, 1, 0, 1,
-0.4816863, -1.040415, -1.71778, 0.1098039, 1, 0, 1,
-0.4802293, 0.6071339, -1.349238, 0.1058824, 1, 0, 1,
-0.4794682, 1.007837, 0.5157167, 0.09803922, 1, 0, 1,
-0.4721822, 1.307834, -0.6493187, 0.09019608, 1, 0, 1,
-0.4704773, 1.742092, 0.03948913, 0.08627451, 1, 0, 1,
-0.4666477, -0.6962529, -2.93653, 0.07843138, 1, 0, 1,
-0.4651753, -0.02003566, -1.002006, 0.07450981, 1, 0, 1,
-0.4612932, -0.5559992, -0.4885682, 0.06666667, 1, 0, 1,
-0.4594518, 1.022226, -1.220067, 0.0627451, 1, 0, 1,
-0.4592017, -0.958782, -2.590639, 0.05490196, 1, 0, 1,
-0.4568461, -0.7620865, -2.298027, 0.05098039, 1, 0, 1,
-0.4466841, -0.1169952, 0.09528169, 0.04313726, 1, 0, 1,
-0.4335763, -0.07866663, -2.157701, 0.03921569, 1, 0, 1,
-0.4320577, -0.4306212, -3.552842, 0.03137255, 1, 0, 1,
-0.4288784, 0.5616558, -1.340653, 0.02745098, 1, 0, 1,
-0.427487, 0.3313102, -0.992561, 0.01960784, 1, 0, 1,
-0.4267155, 0.6211669, -1.9966, 0.01568628, 1, 0, 1,
-0.4255262, -0.1145629, -2.459855, 0.007843138, 1, 0, 1,
-0.4242558, 1.730512, -0.7685869, 0.003921569, 1, 0, 1,
-0.4219036, -0.873215, -4.242439, 0, 1, 0.003921569, 1,
-0.4202234, -1.342744, -0.7845679, 0, 1, 0.01176471, 1,
-0.4172119, -0.9060051, -4.875188, 0, 1, 0.01568628, 1,
-0.4170584, -1.295132, -2.603766, 0, 1, 0.02352941, 1,
-0.4141052, 0.2471738, 0.6798773, 0, 1, 0.02745098, 1,
-0.4137089, 0.1173415, -1.181036, 0, 1, 0.03529412, 1,
-0.4129721, 1.377773, 0.3496054, 0, 1, 0.03921569, 1,
-0.4119568, 0.8331584, -0.3164581, 0, 1, 0.04705882, 1,
-0.4089118, 2.066939, -1.835451, 0, 1, 0.05098039, 1,
-0.3980541, -0.243955, -3.333495, 0, 1, 0.05882353, 1,
-0.3954653, -0.4519862, -3.501443, 0, 1, 0.0627451, 1,
-0.3876975, -0.9986418, -3.565814, 0, 1, 0.07058824, 1,
-0.3866076, -1.471499, -1.905513, 0, 1, 0.07450981, 1,
-0.3831277, 0.1951467, 0.2794563, 0, 1, 0.08235294, 1,
-0.3803574, -0.7363842, -1.733399, 0, 1, 0.08627451, 1,
-0.379355, -0.05046482, -2.756189, 0, 1, 0.09411765, 1,
-0.3742706, 0.3131791, -2.277959, 0, 1, 0.1019608, 1,
-0.3715188, 1.177884, -1.456741, 0, 1, 0.1058824, 1,
-0.3709784, -0.8838145, -2.650299, 0, 1, 0.1137255, 1,
-0.3658679, -0.6109505, -4.014562, 0, 1, 0.1176471, 1,
-0.3624811, 1.014547, -0.736945, 0, 1, 0.1254902, 1,
-0.3611156, 1.07543, -1.097463, 0, 1, 0.1294118, 1,
-0.3595384, 1.746831, -0.5459612, 0, 1, 0.1372549, 1,
-0.3557598, -0.5566331, -2.567103, 0, 1, 0.1411765, 1,
-0.3557464, 0.6751774, -0.4870404, 0, 1, 0.1490196, 1,
-0.355743, 0.572294, -1.116938, 0, 1, 0.1529412, 1,
-0.3543773, -0.4479285, -1.945333, 0, 1, 0.1607843, 1,
-0.3471012, 0.7857789, -1.201343, 0, 1, 0.1647059, 1,
-0.3419255, 0.7721222, -0.02721418, 0, 1, 0.172549, 1,
-0.3374203, -0.2471886, -0.8725405, 0, 1, 0.1764706, 1,
-0.330964, -0.6108227, -4.28859, 0, 1, 0.1843137, 1,
-0.3281223, -0.1276194, -1.130985, 0, 1, 0.1882353, 1,
-0.3275092, -1.279776, -3.693727, 0, 1, 0.1960784, 1,
-0.3240655, -0.04552237, -0.6390348, 0, 1, 0.2039216, 1,
-0.323526, 0.1013228, -1.621031, 0, 1, 0.2078431, 1,
-0.3234931, 0.9388165, -2.511749, 0, 1, 0.2156863, 1,
-0.3228743, 0.0413378, -0.9892958, 0, 1, 0.2196078, 1,
-0.3223842, -0.8773211, -3.753743, 0, 1, 0.227451, 1,
-0.3190517, 0.1745272, -0.7053566, 0, 1, 0.2313726, 1,
-0.3155668, 0.1150182, -1.58794, 0, 1, 0.2392157, 1,
-0.3146527, -0.3970568, -1.732056, 0, 1, 0.2431373, 1,
-0.3127513, 0.4171745, -1.626639, 0, 1, 0.2509804, 1,
-0.3117668, 0.7101012, -1.783394, 0, 1, 0.254902, 1,
-0.3042816, 1.27906, 0.9278614, 0, 1, 0.2627451, 1,
-0.3037259, -0.2470197, -2.295196, 0, 1, 0.2666667, 1,
-0.290166, -0.6048867, -3.970789, 0, 1, 0.2745098, 1,
-0.2784356, 1.363083, 1.619932, 0, 1, 0.2784314, 1,
-0.2780528, -0.1204551, -3.026806, 0, 1, 0.2862745, 1,
-0.2741853, 0.9922388, -0.09397158, 0, 1, 0.2901961, 1,
-0.2737026, 0.2556126, -0.8814716, 0, 1, 0.2980392, 1,
-0.2700415, -0.01874628, -1.32914, 0, 1, 0.3058824, 1,
-0.2696039, 0.8745813, -0.7255503, 0, 1, 0.3098039, 1,
-0.2694068, 0.4291708, -2.200983, 0, 1, 0.3176471, 1,
-0.2653606, -0.08813319, -2.670227, 0, 1, 0.3215686, 1,
-0.2571204, -0.7160987, -2.595235, 0, 1, 0.3294118, 1,
-0.2561262, 0.7232479, 0.1739781, 0, 1, 0.3333333, 1,
-0.2500006, 0.1210823, -1.16196, 0, 1, 0.3411765, 1,
-0.2472949, 0.4671714, -0.1349891, 0, 1, 0.345098, 1,
-0.2436524, 0.6194227, -0.6949245, 0, 1, 0.3529412, 1,
-0.2419034, 0.6545702, 0.974026, 0, 1, 0.3568628, 1,
-0.2397662, 0.6248801, -0.2891979, 0, 1, 0.3647059, 1,
-0.2349372, 0.5959742, -0.2963516, 0, 1, 0.3686275, 1,
-0.2345227, 0.09330647, -0.6202536, 0, 1, 0.3764706, 1,
-0.2312887, 0.3545028, -1.03743, 0, 1, 0.3803922, 1,
-0.2310355, 0.8040359, -0.6944706, 0, 1, 0.3882353, 1,
-0.2284865, 0.4933494, -0.557942, 0, 1, 0.3921569, 1,
-0.2225152, 0.2514368, -0.59595, 0, 1, 0.4, 1,
-0.2209097, 0.9482625, -1.098337, 0, 1, 0.4078431, 1,
-0.2205094, -0.5065918, -3.741043, 0, 1, 0.4117647, 1,
-0.2169325, -0.2202223, -1.390168, 0, 1, 0.4196078, 1,
-0.2152224, -0.8132356, -2.633679, 0, 1, 0.4235294, 1,
-0.2112343, 0.1279051, 0.1834573, 0, 1, 0.4313726, 1,
-0.2101001, 1.381633, -0.8645615, 0, 1, 0.4352941, 1,
-0.2097101, 1.524638, 0.004445712, 0, 1, 0.4431373, 1,
-0.2082889, 1.160531, 0.2745835, 0, 1, 0.4470588, 1,
-0.2059837, -0.939924, -4.49212, 0, 1, 0.454902, 1,
-0.2051416, -0.06398756, -0.2299505, 0, 1, 0.4588235, 1,
-0.2022258, -0.1677609, -2.319047, 0, 1, 0.4666667, 1,
-0.2005307, -0.6750821, -3.33964, 0, 1, 0.4705882, 1,
-0.2002819, 0.7961181, -0.2835039, 0, 1, 0.4784314, 1,
-0.1993805, -0.2782515, -2.419216, 0, 1, 0.4823529, 1,
-0.192373, -2.227307, -3.056813, 0, 1, 0.4901961, 1,
-0.1894301, -0.1219261, -2.490425, 0, 1, 0.4941176, 1,
-0.1883293, -0.5822065, -4.007626, 0, 1, 0.5019608, 1,
-0.1779069, -0.2377293, -0.9089601, 0, 1, 0.509804, 1,
-0.176473, 0.3997017, -0.5336049, 0, 1, 0.5137255, 1,
-0.1754012, 0.2004306, -1.526299, 0, 1, 0.5215687, 1,
-0.1730804, -0.07997856, -1.296787, 0, 1, 0.5254902, 1,
-0.1710177, -0.2044312, -1.61964, 0, 1, 0.5333334, 1,
-0.1680707, 0.3005487, -0.9138662, 0, 1, 0.5372549, 1,
-0.1663042, 0.7479691, 1.660618, 0, 1, 0.5450981, 1,
-0.1594666, -0.5270615, -3.352478, 0, 1, 0.5490196, 1,
-0.1589, 0.9450606, 0.5767286, 0, 1, 0.5568628, 1,
-0.1570166, 1.243858, -0.5563709, 0, 1, 0.5607843, 1,
-0.1537128, -0.2009262, -3.1068, 0, 1, 0.5686275, 1,
-0.1505609, -0.9476242, -2.421097, 0, 1, 0.572549, 1,
-0.1488678, -1.257412, -2.373429, 0, 1, 0.5803922, 1,
-0.1480908, -0.5518444, -2.218862, 0, 1, 0.5843138, 1,
-0.1410376, -1.076924, -2.768452, 0, 1, 0.5921569, 1,
-0.1360666, -0.06442875, -0.539579, 0, 1, 0.5960785, 1,
-0.1357056, -1.588855, -3.734023, 0, 1, 0.6039216, 1,
-0.1352207, 0.08190238, -1.269379, 0, 1, 0.6117647, 1,
-0.1340213, -0.5890149, -5.093398, 0, 1, 0.6156863, 1,
-0.1336962, 0.5590863, -1.141312, 0, 1, 0.6235294, 1,
-0.1326087, 0.8397091, 0.7673509, 0, 1, 0.627451, 1,
-0.1293184, 0.02520318, -0.4514263, 0, 1, 0.6352941, 1,
-0.1280859, -0.8432636, -4.384346, 0, 1, 0.6392157, 1,
-0.125154, -1.090411, -3.064879, 0, 1, 0.6470588, 1,
-0.1231213, -0.9999276, -2.722771, 0, 1, 0.6509804, 1,
-0.1167348, 1.124046, -0.1692922, 0, 1, 0.6588235, 1,
-0.1164436, -1.214895, -1.773525, 0, 1, 0.6627451, 1,
-0.1161848, -0.01702997, -0.2418433, 0, 1, 0.6705883, 1,
-0.1131972, 0.3912646, -0.4942667, 0, 1, 0.6745098, 1,
-0.1131703, -0.4046257, -3.686287, 0, 1, 0.682353, 1,
-0.1108827, -0.03859022, -1.70148, 0, 1, 0.6862745, 1,
-0.1100443, 0.7940456, -0.5086131, 0, 1, 0.6941177, 1,
-0.1040595, -1.546257, -3.004843, 0, 1, 0.7019608, 1,
-0.1009246, 0.4334292, -0.8055317, 0, 1, 0.7058824, 1,
-0.1008685, 0.3689533, 1.117678, 0, 1, 0.7137255, 1,
-0.09730992, -2.183561, -4.483918, 0, 1, 0.7176471, 1,
-0.09723037, 1.81454, -0.5440245, 0, 1, 0.7254902, 1,
-0.09678341, 2.185134, -0.4225152, 0, 1, 0.7294118, 1,
-0.0951148, 2.325973, 0.075064, 0, 1, 0.7372549, 1,
-0.09226308, 1.267995, -0.1486033, 0, 1, 0.7411765, 1,
-0.091559, -1.055927, -3.92153, 0, 1, 0.7490196, 1,
-0.0873104, 0.1313247, -2.113311, 0, 1, 0.7529412, 1,
-0.0858895, 0.2417064, -2.338289, 0, 1, 0.7607843, 1,
-0.08166715, 0.5193086, -1.235837, 0, 1, 0.7647059, 1,
-0.07544944, 0.3543127, 1.005246, 0, 1, 0.772549, 1,
-0.06756397, 1.441991, 0.2705351, 0, 1, 0.7764706, 1,
-0.06557986, -0.8774477, -3.10905, 0, 1, 0.7843137, 1,
-0.06481632, 0.9877976, 0.5755508, 0, 1, 0.7882353, 1,
-0.06153154, -0.2819229, -2.223686, 0, 1, 0.7960784, 1,
-0.06145439, -0.9758743, -2.823396, 0, 1, 0.8039216, 1,
-0.05428595, -0.5659053, -2.550112, 0, 1, 0.8078431, 1,
-0.05373998, -0.0724591, -2.100032, 0, 1, 0.8156863, 1,
-0.05274974, 1.406011, 0.2522654, 0, 1, 0.8196079, 1,
-0.05257023, 0.1566566, 1.650993, 0, 1, 0.827451, 1,
-0.05160619, -0.5565488, -2.805722, 0, 1, 0.8313726, 1,
-0.04557516, -0.3219444, -2.417201, 0, 1, 0.8392157, 1,
-0.0410202, -0.5220661, -1.429389, 0, 1, 0.8431373, 1,
-0.03841623, 0.4391526, -0.3105969, 0, 1, 0.8509804, 1,
-0.03568238, 1.489017, -0.1963547, 0, 1, 0.854902, 1,
-0.03105419, 1.862307, 0.8188695, 0, 1, 0.8627451, 1,
-0.0249325, 1.045951, -0.156723, 0, 1, 0.8666667, 1,
-0.02152199, -1.40217, -4.094705, 0, 1, 0.8745098, 1,
-0.01733135, -1.539157, -4.595549, 0, 1, 0.8784314, 1,
-0.01498296, -0.5714073, -4.004387, 0, 1, 0.8862745, 1,
-0.007977335, -1.514209, -2.004071, 0, 1, 0.8901961, 1,
-0.003762513, 0.5561863, 1.186258, 0, 1, 0.8980392, 1,
-0.001950498, 0.06394739, 0.926784, 0, 1, 0.9058824, 1,
-0.001914094, 1.097242, 0.4029651, 0, 1, 0.9098039, 1,
5.061019e-05, -1.986283, 2.365266, 0, 1, 0.9176471, 1,
0.004050453, -1.417632, 2.759105, 0, 1, 0.9215686, 1,
0.004396123, 0.4994442, -0.2304979, 0, 1, 0.9294118, 1,
0.007985207, 0.3566392, 2.933975, 0, 1, 0.9333333, 1,
0.00863248, 1.256688, 0.7829068, 0, 1, 0.9411765, 1,
0.01272449, 1.870882, 0.1399016, 0, 1, 0.945098, 1,
0.01496211, -0.4575285, 1.214559, 0, 1, 0.9529412, 1,
0.01659829, 0.3369947, 0.8593663, 0, 1, 0.9568627, 1,
0.0201572, -0.07339893, 2.419898, 0, 1, 0.9647059, 1,
0.02091416, -0.2067921, 2.202403, 0, 1, 0.9686275, 1,
0.02143269, 0.09014612, 1.258458, 0, 1, 0.9764706, 1,
0.02564753, 0.1576786, 1.448362, 0, 1, 0.9803922, 1,
0.03045935, 1.183273, 0.2148748, 0, 1, 0.9882353, 1,
0.03140889, -1.102502, 2.948683, 0, 1, 0.9921569, 1,
0.03162659, -0.4548016, 2.24562, 0, 1, 1, 1,
0.03460282, -0.5611095, 0.79241, 0, 0.9921569, 1, 1,
0.04348015, 0.2197573, 0.01155341, 0, 0.9882353, 1, 1,
0.04453307, 0.7834545, -0.3988464, 0, 0.9803922, 1, 1,
0.04526327, -0.8087391, 2.373354, 0, 0.9764706, 1, 1,
0.0470558, -0.6660698, 2.326933, 0, 0.9686275, 1, 1,
0.04923522, 0.3028168, 0.4964564, 0, 0.9647059, 1, 1,
0.05041834, -0.01651518, 1.33925, 0, 0.9568627, 1, 1,
0.05395163, 0.5948644, 2.374197, 0, 0.9529412, 1, 1,
0.05588288, 0.5912713, 0.1060462, 0, 0.945098, 1, 1,
0.05619363, 0.7608426, 0.5320804, 0, 0.9411765, 1, 1,
0.06019266, -0.3518535, 2.576594, 0, 0.9333333, 1, 1,
0.06019768, -1.051306, 2.762985, 0, 0.9294118, 1, 1,
0.06076369, 1.49439, 0.4216228, 0, 0.9215686, 1, 1,
0.06559955, -0.3324359, 2.047741, 0, 0.9176471, 1, 1,
0.07245949, 0.7931076, 1.627095, 0, 0.9098039, 1, 1,
0.07287042, -1.488346, 2.102203, 0, 0.9058824, 1, 1,
0.07293481, 0.2410779, -1.274735, 0, 0.8980392, 1, 1,
0.07661092, 0.1015675, -0.3067049, 0, 0.8901961, 1, 1,
0.0821081, -1.582955, 4.116851, 0, 0.8862745, 1, 1,
0.08298401, 0.5016941, 1.077219, 0, 0.8784314, 1, 1,
0.08736724, -0.03912072, 1.114693, 0, 0.8745098, 1, 1,
0.08870624, -0.3968732, 3.342505, 0, 0.8666667, 1, 1,
0.09187684, -1.749944, 1.4116, 0, 0.8627451, 1, 1,
0.0942058, 1.154072, -0.1542286, 0, 0.854902, 1, 1,
0.09783018, -0.3699404, 3.54374, 0, 0.8509804, 1, 1,
0.1026468, 0.4995818, 1.441184, 0, 0.8431373, 1, 1,
0.1049769, 0.7916253, 0.6203317, 0, 0.8392157, 1, 1,
0.1072412, 1.727658, -0.5641737, 0, 0.8313726, 1, 1,
0.113567, 1.243216, 0.9961331, 0, 0.827451, 1, 1,
0.1137812, -0.9228169, 2.89171, 0, 0.8196079, 1, 1,
0.1188904, 0.6441781, -1.807112, 0, 0.8156863, 1, 1,
0.1223767, 0.3728201, 0.5430854, 0, 0.8078431, 1, 1,
0.1257864, 0.6757108, -0.1039283, 0, 0.8039216, 1, 1,
0.1274473, 0.4631967, 0.5541589, 0, 0.7960784, 1, 1,
0.1359564, 0.3911286, 0.2358746, 0, 0.7882353, 1, 1,
0.1366804, 0.3190153, 0.1573774, 0, 0.7843137, 1, 1,
0.1376154, 0.4262421, 0.5006967, 0, 0.7764706, 1, 1,
0.1382091, -0.6783563, 2.736369, 0, 0.772549, 1, 1,
0.1389531, 0.5028857, 0.6193569, 0, 0.7647059, 1, 1,
0.1392271, 0.4434187, -1.032096, 0, 0.7607843, 1, 1,
0.1400592, 0.4914775, -0.9800162, 0, 0.7529412, 1, 1,
0.1404386, 0.5385752, 0.2094284, 0, 0.7490196, 1, 1,
0.1462523, 0.5848443, 0.7060585, 0, 0.7411765, 1, 1,
0.1535456, -0.712825, 3.353737, 0, 0.7372549, 1, 1,
0.1557831, -0.6980415, 2.50213, 0, 0.7294118, 1, 1,
0.1605476, 0.8411258, -0.3011063, 0, 0.7254902, 1, 1,
0.1608923, -0.2433781, 1.187395, 0, 0.7176471, 1, 1,
0.1639771, -0.87273, 3.951232, 0, 0.7137255, 1, 1,
0.1657639, 0.008901691, 0.8818776, 0, 0.7058824, 1, 1,
0.1684282, -0.09040641, 2.281904, 0, 0.6980392, 1, 1,
0.170661, -0.1293585, -0.5115492, 0, 0.6941177, 1, 1,
0.1728864, 1.009797, -0.6319517, 0, 0.6862745, 1, 1,
0.1751157, -0.6122518, 2.362661, 0, 0.682353, 1, 1,
0.1758522, -0.9352229, 3.324857, 0, 0.6745098, 1, 1,
0.1776814, 0.6875844, 0.6050673, 0, 0.6705883, 1, 1,
0.1825753, -0.7040785, 3.092215, 0, 0.6627451, 1, 1,
0.1870892, -0.02789624, 1.643325, 0, 0.6588235, 1, 1,
0.1875567, 2.34236, -0.7291512, 0, 0.6509804, 1, 1,
0.1924967, -0.4384742, 3.900969, 0, 0.6470588, 1, 1,
0.1930265, -0.06354781, 2.240463, 0, 0.6392157, 1, 1,
0.1958717, 1.687584, 1.97236, 0, 0.6352941, 1, 1,
0.2112219, -1.201843, 3.369375, 0, 0.627451, 1, 1,
0.2112876, 1.410114, -1.326976, 0, 0.6235294, 1, 1,
0.2129599, 0.2575681, 1.466455, 0, 0.6156863, 1, 1,
0.2165966, -0.2735494, 3.58036, 0, 0.6117647, 1, 1,
0.218987, -0.1205781, 2.803952, 0, 0.6039216, 1, 1,
0.2208768, -0.3873814, 1.262505, 0, 0.5960785, 1, 1,
0.2211556, -1.166517, 2.526869, 0, 0.5921569, 1, 1,
0.2216343, 0.8023531, -0.06824311, 0, 0.5843138, 1, 1,
0.2221339, 0.003189886, 1.087682, 0, 0.5803922, 1, 1,
0.222159, 0.4893882, 0.4837764, 0, 0.572549, 1, 1,
0.2221911, -0.006592688, 1.007031, 0, 0.5686275, 1, 1,
0.2241375, -0.3267013, 3.15528, 0, 0.5607843, 1, 1,
0.2246006, 0.1381375, 1.101146, 0, 0.5568628, 1, 1,
0.2258894, 0.7180384, -1.477938, 0, 0.5490196, 1, 1,
0.227812, 0.4407176, 1.026249, 0, 0.5450981, 1, 1,
0.2284686, 0.9979312, -0.05009923, 0, 0.5372549, 1, 1,
0.2297371, -0.06738489, 1.094684, 0, 0.5333334, 1, 1,
0.2302946, 0.5936261, 1.616632, 0, 0.5254902, 1, 1,
0.2304577, 0.2068937, 0.6832135, 0, 0.5215687, 1, 1,
0.2304581, -0.729297, 3.568654, 0, 0.5137255, 1, 1,
0.2337986, 0.590412, 0.315984, 0, 0.509804, 1, 1,
0.2339365, -0.09942389, 3.827369, 0, 0.5019608, 1, 1,
0.2373181, 1.593251, -0.566282, 0, 0.4941176, 1, 1,
0.2386792, -1.850317, 3.870958, 0, 0.4901961, 1, 1,
0.2402446, 0.7174149, 0.05302546, 0, 0.4823529, 1, 1,
0.2414187, -1.007389, 2.636033, 0, 0.4784314, 1, 1,
0.2422555, -2.402904, 3.155562, 0, 0.4705882, 1, 1,
0.2453528, -1.156317, 3.73014, 0, 0.4666667, 1, 1,
0.2474162, 0.5414076, 0.7380623, 0, 0.4588235, 1, 1,
0.2483401, 0.3269722, 0.1589424, 0, 0.454902, 1, 1,
0.2498069, 1.792333, 0.2757833, 0, 0.4470588, 1, 1,
0.2589147, -1.388813, 2.607929, 0, 0.4431373, 1, 1,
0.2600604, -1.008707, 3.31952, 0, 0.4352941, 1, 1,
0.2641601, -1.405935, 2.53907, 0, 0.4313726, 1, 1,
0.2666166, -1.995305, 1.97941, 0, 0.4235294, 1, 1,
0.2771218, -0.5143026, 3.137789, 0, 0.4196078, 1, 1,
0.2795636, -0.8234956, 4.175129, 0, 0.4117647, 1, 1,
0.2804312, -0.08966075, 1.419713, 0, 0.4078431, 1, 1,
0.2820019, -0.1624334, 0.7466803, 0, 0.4, 1, 1,
0.2821188, -1.727918, 3.347729, 0, 0.3921569, 1, 1,
0.285748, 0.8321166, 0.9952698, 0, 0.3882353, 1, 1,
0.2945099, 0.9015605, 0.8896759, 0, 0.3803922, 1, 1,
0.2948427, 1.149099, 0.5759841, 0, 0.3764706, 1, 1,
0.2964506, 0.9263378, 1.428974, 0, 0.3686275, 1, 1,
0.2966727, -0.05006282, 1.335953, 0, 0.3647059, 1, 1,
0.2971171, 0.3137764, 0.04260933, 0, 0.3568628, 1, 1,
0.30275, -1.233728, 3.032637, 0, 0.3529412, 1, 1,
0.3040847, 0.3156224, 0.1615866, 0, 0.345098, 1, 1,
0.3066633, 1.057195, 1.657079, 0, 0.3411765, 1, 1,
0.3068449, 2.222578, 0.09402258, 0, 0.3333333, 1, 1,
0.3109291, -1.843215, 3.393076, 0, 0.3294118, 1, 1,
0.3114876, -0.6712582, 2.843338, 0, 0.3215686, 1, 1,
0.3117042, 0.4578703, 0.7725847, 0, 0.3176471, 1, 1,
0.3169776, -0.1474812, 0.9967962, 0, 0.3098039, 1, 1,
0.3198296, -0.3060868, 0.4411917, 0, 0.3058824, 1, 1,
0.3203228, 0.154895, -1.51813, 0, 0.2980392, 1, 1,
0.3237814, -1.158593, 2.308809, 0, 0.2901961, 1, 1,
0.3257952, -1.661921, 3.79211, 0, 0.2862745, 1, 1,
0.3264868, 1.523465, 0.01668068, 0, 0.2784314, 1, 1,
0.3276885, -0.6927765, 3.324088, 0, 0.2745098, 1, 1,
0.3307428, 0.6265488, 0.5674755, 0, 0.2666667, 1, 1,
0.3364267, 0.8260049, 0.9937574, 0, 0.2627451, 1, 1,
0.3394183, 0.164017, 0.9998326, 0, 0.254902, 1, 1,
0.3408982, 0.9158853, 1.090809, 0, 0.2509804, 1, 1,
0.3441848, 1.412267, 0.5596706, 0, 0.2431373, 1, 1,
0.3459992, 0.7224893, 0.6578766, 0, 0.2392157, 1, 1,
0.347531, 0.5902582, 0.7543401, 0, 0.2313726, 1, 1,
0.3490643, 0.1597789, 3.171628, 0, 0.227451, 1, 1,
0.3499742, -0.5357044, 2.988247, 0, 0.2196078, 1, 1,
0.350857, -0.06239906, 1.494935, 0, 0.2156863, 1, 1,
0.3618279, 0.8744029, -0.4638102, 0, 0.2078431, 1, 1,
0.3636206, -0.3714781, 1.782839, 0, 0.2039216, 1, 1,
0.3645252, -0.3789636, 2.337013, 0, 0.1960784, 1, 1,
0.3706469, 1.660797, -0.7512856, 0, 0.1882353, 1, 1,
0.3768573, -1.271099, 4.781247, 0, 0.1843137, 1, 1,
0.3783776, -0.3313712, 3.473577, 0, 0.1764706, 1, 1,
0.3818764, -0.5074999, 1.437006, 0, 0.172549, 1, 1,
0.3866132, -0.4505738, 1.657359, 0, 0.1647059, 1, 1,
0.3912604, 0.0055, -0.4618018, 0, 0.1607843, 1, 1,
0.3912747, -0.8699835, 4.747256, 0, 0.1529412, 1, 1,
0.3917189, 0.9576902, -0.1951767, 0, 0.1490196, 1, 1,
0.3967279, 1.181217, -1.317321, 0, 0.1411765, 1, 1,
0.3980174, -0.9736778, 2.908233, 0, 0.1372549, 1, 1,
0.4086777, -0.6928107, 2.902062, 0, 0.1294118, 1, 1,
0.410876, -0.9212132, 2.784289, 0, 0.1254902, 1, 1,
0.4180836, -1.782606, 4.834643, 0, 0.1176471, 1, 1,
0.4210213, -1.618031, 3.480525, 0, 0.1137255, 1, 1,
0.4247374, 0.05719889, 1.342095, 0, 0.1058824, 1, 1,
0.4250416, 0.0202613, 1.774318, 0, 0.09803922, 1, 1,
0.4266093, -0.185081, 3.51134, 0, 0.09411765, 1, 1,
0.4278694, -0.8940694, 2.729623, 0, 0.08627451, 1, 1,
0.4296447, 0.4414759, 1.423504, 0, 0.08235294, 1, 1,
0.4302586, 0.8295283, 1.122243, 0, 0.07450981, 1, 1,
0.4305688, -0.6116008, 4.795735, 0, 0.07058824, 1, 1,
0.4343812, -0.1704892, 1.335776, 0, 0.0627451, 1, 1,
0.4347342, 0.8778855, 1.635753, 0, 0.05882353, 1, 1,
0.4351904, -0.6192325, 4.299979, 0, 0.05098039, 1, 1,
0.4476228, 0.7885742, -0.8253453, 0, 0.04705882, 1, 1,
0.4522925, 0.2706748, 1.595563, 0, 0.03921569, 1, 1,
0.4527116, -1.795716, 3.732532, 0, 0.03529412, 1, 1,
0.4537931, -0.279459, 2.887745, 0, 0.02745098, 1, 1,
0.4594176, -0.738478, 2.315692, 0, 0.02352941, 1, 1,
0.4617572, 0.564539, 2.031258, 0, 0.01568628, 1, 1,
0.4684475, -0.4449777, 2.793283, 0, 0.01176471, 1, 1,
0.4723202, 0.1608028, 0.8358879, 0, 0.003921569, 1, 1,
0.4772987, 0.4376586, -0.078982, 0.003921569, 0, 1, 1,
0.4787385, 1.587696, 0.3075943, 0.007843138, 0, 1, 1,
0.4874728, 1.76588, 0.280264, 0.01568628, 0, 1, 1,
0.4877719, 0.5801758, 0.5350711, 0.01960784, 0, 1, 1,
0.4911426, 1.843082, -1.274509, 0.02745098, 0, 1, 1,
0.4918098, 1.415601, -0.07519254, 0.03137255, 0, 1, 1,
0.4926507, 0.06896342, 1.594622, 0.03921569, 0, 1, 1,
0.4951417, -0.1115456, -0.1730279, 0.04313726, 0, 1, 1,
0.4973813, 0.3969326, 0.7670128, 0.05098039, 0, 1, 1,
0.4989022, 0.6273541, -0.2476556, 0.05490196, 0, 1, 1,
0.5026503, -0.4415004, 2.127244, 0.0627451, 0, 1, 1,
0.5027825, -0.2199309, 3.018432, 0.06666667, 0, 1, 1,
0.5048851, 0.9969039, 1.052339, 0.07450981, 0, 1, 1,
0.5117581, 0.1969638, 1.457886, 0.07843138, 0, 1, 1,
0.5121639, 0.04963477, 2.819321, 0.08627451, 0, 1, 1,
0.513481, -0.2657412, 1.35961, 0.09019608, 0, 1, 1,
0.5136644, 0.6775243, -0.09883564, 0.09803922, 0, 1, 1,
0.5145879, 1.910385, 1.30296, 0.1058824, 0, 1, 1,
0.516768, -1.631521, 2.270517, 0.1098039, 0, 1, 1,
0.5178768, -0.0350709, 1.63666, 0.1176471, 0, 1, 1,
0.5221677, 0.0928069, 1.906386, 0.1215686, 0, 1, 1,
0.522289, -0.5853308, 1.285636, 0.1294118, 0, 1, 1,
0.5246559, 0.3901176, 1.519093, 0.1333333, 0, 1, 1,
0.5247484, 0.9027159, 0.7072971, 0.1411765, 0, 1, 1,
0.5261827, -0.50398, 2.27312, 0.145098, 0, 1, 1,
0.5280377, 0.8854362, 1.150662, 0.1529412, 0, 1, 1,
0.5302847, -0.6115638, 4.400398, 0.1568628, 0, 1, 1,
0.5361462, -1.321853, 3.343643, 0.1647059, 0, 1, 1,
0.5363756, 1.636086, 0.5157846, 0.1686275, 0, 1, 1,
0.5403866, -1.586986, 1.700885, 0.1764706, 0, 1, 1,
0.5406054, 1.377415, 0.7982143, 0.1803922, 0, 1, 1,
0.5412359, -1.295469, 0.9750194, 0.1882353, 0, 1, 1,
0.5420666, 1.00456, 1.764369, 0.1921569, 0, 1, 1,
0.5431951, -0.5288458, 2.704018, 0.2, 0, 1, 1,
0.5459611, 0.07385505, 2.419992, 0.2078431, 0, 1, 1,
0.5476568, -0.8807799, 2.768631, 0.2117647, 0, 1, 1,
0.5514559, 1.222597, 0.7435783, 0.2196078, 0, 1, 1,
0.553189, 2.486412, 0.2669645, 0.2235294, 0, 1, 1,
0.5585922, 1.297671, -1.986603, 0.2313726, 0, 1, 1,
0.5598142, 1.372427, 0.8651942, 0.2352941, 0, 1, 1,
0.5610269, -1.169593, 3.364293, 0.2431373, 0, 1, 1,
0.5620667, 1.516167, 1.473225, 0.2470588, 0, 1, 1,
0.5701981, -1.790576, 2.034526, 0.254902, 0, 1, 1,
0.5712562, 0.5203152, -0.2794603, 0.2588235, 0, 1, 1,
0.5744652, -0.2028058, 2.205516, 0.2666667, 0, 1, 1,
0.5744834, 0.9504209, 0.599488, 0.2705882, 0, 1, 1,
0.5783975, 0.6804098, 0.9618656, 0.2784314, 0, 1, 1,
0.5785769, -1.994828, 2.72735, 0.282353, 0, 1, 1,
0.579392, -0.4293168, 0.370012, 0.2901961, 0, 1, 1,
0.5802143, -1.086487, 3.344869, 0.2941177, 0, 1, 1,
0.5849519, 0.5759605, -0.2237809, 0.3019608, 0, 1, 1,
0.5858343, 0.4749014, 2.401098, 0.3098039, 0, 1, 1,
0.5888246, -1.270401, 3.719316, 0.3137255, 0, 1, 1,
0.5891665, -0.7076255, 3.037345, 0.3215686, 0, 1, 1,
0.5922878, -0.3198136, 3.572181, 0.3254902, 0, 1, 1,
0.5938046, 0.5444399, -0.1576883, 0.3333333, 0, 1, 1,
0.5959795, -0.4507783, 3.644324, 0.3372549, 0, 1, 1,
0.5960078, -0.0286915, 1.038044, 0.345098, 0, 1, 1,
0.600397, 0.06187638, 0.635393, 0.3490196, 0, 1, 1,
0.6013713, -1.309537, 1.213841, 0.3568628, 0, 1, 1,
0.6018794, 0.7941764, -0.07064652, 0.3607843, 0, 1, 1,
0.6035379, 0.1940557, 1.972254, 0.3686275, 0, 1, 1,
0.6098312, 0.6413883, -0.2072587, 0.372549, 0, 1, 1,
0.6126471, -0.5817065, 1.412832, 0.3803922, 0, 1, 1,
0.6130936, 0.4855284, -0.2927972, 0.3843137, 0, 1, 1,
0.623323, -0.2359135, 2.41639, 0.3921569, 0, 1, 1,
0.6322913, 0.8638687, 0.1657882, 0.3960784, 0, 1, 1,
0.6438117, -0.7024292, 2.645203, 0.4039216, 0, 1, 1,
0.6514426, 1.78974, 1.556555, 0.4117647, 0, 1, 1,
0.6523113, -0.5167409, -0.08576623, 0.4156863, 0, 1, 1,
0.6529852, 1.374148, 1.264971, 0.4235294, 0, 1, 1,
0.6533009, 0.9468567, -1.004929, 0.427451, 0, 1, 1,
0.6581423, -0.4160949, 1.539428, 0.4352941, 0, 1, 1,
0.6585249, -1.128949, 2.911241, 0.4392157, 0, 1, 1,
0.6611465, 0.07329899, 1.4888, 0.4470588, 0, 1, 1,
0.6692945, 1.969058, 0.8377143, 0.4509804, 0, 1, 1,
0.6716394, 0.8900447, 1.151886, 0.4588235, 0, 1, 1,
0.674015, -0.4572706, 2.524068, 0.4627451, 0, 1, 1,
0.6815794, -0.4343563, 2.28325, 0.4705882, 0, 1, 1,
0.6849363, 0.1768732, -0.5384816, 0.4745098, 0, 1, 1,
0.6860909, 0.9267077, 0.2385122, 0.4823529, 0, 1, 1,
0.6925351, 0.988619, 1.133771, 0.4862745, 0, 1, 1,
0.7000636, 0.9009205, -0.4439962, 0.4941176, 0, 1, 1,
0.705995, -0.5178572, 2.306299, 0.5019608, 0, 1, 1,
0.7251874, 1.281022, 0.9008717, 0.5058824, 0, 1, 1,
0.7282699, 0.6618987, 2.859132, 0.5137255, 0, 1, 1,
0.7324321, 0.5887352, 0.004181066, 0.5176471, 0, 1, 1,
0.7395102, -1.030533, 2.205845, 0.5254902, 0, 1, 1,
0.7398058, 1.400229, -1.184754, 0.5294118, 0, 1, 1,
0.7415365, -0.1518905, 1.081713, 0.5372549, 0, 1, 1,
0.7434419, 0.581561, 0.2185252, 0.5411765, 0, 1, 1,
0.7435716, 1.25777, 0.1539069, 0.5490196, 0, 1, 1,
0.7447115, 1.693504, -0.4747684, 0.5529412, 0, 1, 1,
0.7465111, 0.5400036, 1.385329, 0.5607843, 0, 1, 1,
0.7501729, 1.760281, 0.3981522, 0.5647059, 0, 1, 1,
0.7597258, -0.8230655, 2.177977, 0.572549, 0, 1, 1,
0.7631637, -1.45391, 2.989268, 0.5764706, 0, 1, 1,
0.7659201, -1.770878, 1.064948, 0.5843138, 0, 1, 1,
0.7711343, 0.5331969, 1.561254, 0.5882353, 0, 1, 1,
0.7802592, 1.52116, 0.8991368, 0.5960785, 0, 1, 1,
0.7850944, -0.4485501, 1.769802, 0.6039216, 0, 1, 1,
0.7858716, 1.273777, 0.9779685, 0.6078432, 0, 1, 1,
0.7940674, 0.3694716, 0.4116912, 0.6156863, 0, 1, 1,
0.7999486, 0.8088312, 2.456485, 0.6196079, 0, 1, 1,
0.8025845, 0.4740069, 0.1376371, 0.627451, 0, 1, 1,
0.8046044, 0.07460633, 0.763463, 0.6313726, 0, 1, 1,
0.806187, -0.9826695, 1.929303, 0.6392157, 0, 1, 1,
0.8150686, 2.185088, -0.07198998, 0.6431373, 0, 1, 1,
0.8220225, -0.6295065, 2.437535, 0.6509804, 0, 1, 1,
0.8221984, -0.2977251, 2.539359, 0.654902, 0, 1, 1,
0.8229628, 0.5638853, 0.2384417, 0.6627451, 0, 1, 1,
0.8285017, 1.223444, 0.9166552, 0.6666667, 0, 1, 1,
0.8418492, 1.316552, 1.330895, 0.6745098, 0, 1, 1,
0.8452431, 0.5676755, 2.123345, 0.6784314, 0, 1, 1,
0.8456751, -0.1570821, 1.472292, 0.6862745, 0, 1, 1,
0.8511136, 0.03497609, 0.2126584, 0.6901961, 0, 1, 1,
0.8565022, 1.495011, -2.003553, 0.6980392, 0, 1, 1,
0.8575788, 0.2187898, 1.008673, 0.7058824, 0, 1, 1,
0.8655291, 2.123058, 0.4368829, 0.7098039, 0, 1, 1,
0.8718444, -1.073718, 2.193694, 0.7176471, 0, 1, 1,
0.8771168, -0.8162777, 2.834555, 0.7215686, 0, 1, 1,
0.8777869, -1.006709, 2.43977, 0.7294118, 0, 1, 1,
0.8791156, -1.459094, 1.996423, 0.7333333, 0, 1, 1,
0.8837273, 0.4103775, 4.269956, 0.7411765, 0, 1, 1,
0.8839173, 0.8057205, 1.777501, 0.7450981, 0, 1, 1,
0.8839635, 1.238562, 0.6582972, 0.7529412, 0, 1, 1,
0.9140475, -0.3350485, 2.105332, 0.7568628, 0, 1, 1,
0.9203455, 0.1913806, -0.1317402, 0.7647059, 0, 1, 1,
0.9211852, -0.6941447, 2.740485, 0.7686275, 0, 1, 1,
0.9270247, -1.34155, 1.951755, 0.7764706, 0, 1, 1,
0.9293201, -0.01769802, 0.8712104, 0.7803922, 0, 1, 1,
0.9350079, -2.115306, 2.295785, 0.7882353, 0, 1, 1,
0.9415411, -0.08504402, 2.505251, 0.7921569, 0, 1, 1,
0.9439318, 1.526748, -0.8275225, 0.8, 0, 1, 1,
0.9483906, 1.041004, -0.4945561, 0.8078431, 0, 1, 1,
0.9485934, 0.5148683, 0.3787566, 0.8117647, 0, 1, 1,
0.9488583, 0.2405144, 1.782563, 0.8196079, 0, 1, 1,
0.9551457, 0.7440169, -0.06588949, 0.8235294, 0, 1, 1,
0.9572951, -1.270159, 2.35568, 0.8313726, 0, 1, 1,
0.957417, 1.27496, 0.6869665, 0.8352941, 0, 1, 1,
0.9630443, 0.3071301, 3.524381, 0.8431373, 0, 1, 1,
0.9727796, -2.402971, 2.210572, 0.8470588, 0, 1, 1,
0.9776021, 0.4957776, 0.9111689, 0.854902, 0, 1, 1,
0.9794909, -0.6311424, 2.7636, 0.8588235, 0, 1, 1,
0.9821627, 1.939725, 0.03804139, 0.8666667, 0, 1, 1,
0.9829175, 0.6901525, 1.087795, 0.8705882, 0, 1, 1,
0.9835414, -0.9805543, 2.000109, 0.8784314, 0, 1, 1,
0.9930614, -1.292188, 2.179052, 0.8823529, 0, 1, 1,
0.9977869, 0.4484869, 2.238693, 0.8901961, 0, 1, 1,
0.9980132, 1.040151, 1.845896, 0.8941177, 0, 1, 1,
1.000167, 0.03321684, 3.258948, 0.9019608, 0, 1, 1,
1.003773, -0.2062699, 1.703214, 0.9098039, 0, 1, 1,
1.009541, 1.164638, 1.213598, 0.9137255, 0, 1, 1,
1.009701, -0.9250737, 1.964248, 0.9215686, 0, 1, 1,
1.013844, -1.108363, 1.920159, 0.9254902, 0, 1, 1,
1.014215, 0.07879479, 0.7503839, 0.9333333, 0, 1, 1,
1.015372, -0.1286643, 2.163318, 0.9372549, 0, 1, 1,
1.021503, 0.5202116, 0.5295715, 0.945098, 0, 1, 1,
1.021866, -0.7236359, 1.930798, 0.9490196, 0, 1, 1,
1.022573, -0.02529985, 0.394659, 0.9568627, 0, 1, 1,
1.022916, 0.05408428, 0.9792739, 0.9607843, 0, 1, 1,
1.024531, -0.3122676, 2.626991, 0.9686275, 0, 1, 1,
1.029469, -1.597015, 2.956608, 0.972549, 0, 1, 1,
1.04039, 0.577765, 0.7348246, 0.9803922, 0, 1, 1,
1.054094, -0.0560234, 2.272552, 0.9843137, 0, 1, 1,
1.054754, 0.5722536, 2.364961, 0.9921569, 0, 1, 1,
1.054896, -0.5224835, 3.147212, 0.9960784, 0, 1, 1,
1.066042, 1.499782, 1.329613, 1, 0, 0.9960784, 1,
1.073418, -2.068723, 2.660041, 1, 0, 0.9882353, 1,
1.07472, -0.5199812, 1.474327, 1, 0, 0.9843137, 1,
1.076103, 0.4898872, -0.02002642, 1, 0, 0.9764706, 1,
1.076934, -0.2415953, 0.5626535, 1, 0, 0.972549, 1,
1.079933, 0.2249475, 1.851737, 1, 0, 0.9647059, 1,
1.08237, 1.512155, 1.61214, 1, 0, 0.9607843, 1,
1.092244, 0.9921594, 1.754726, 1, 0, 0.9529412, 1,
1.093171, -0.2597958, 3.948114, 1, 0, 0.9490196, 1,
1.093306, 0.9513197, 0.5722434, 1, 0, 0.9411765, 1,
1.099222, 0.1499382, 2.007973, 1, 0, 0.9372549, 1,
1.103883, 0.4572714, 2.011713, 1, 0, 0.9294118, 1,
1.106457, -1.056266, 2.407915, 1, 0, 0.9254902, 1,
1.110599, -0.9736969, 2.475154, 1, 0, 0.9176471, 1,
1.114805, 1.249176, 2.354868, 1, 0, 0.9137255, 1,
1.116122, 0.8444936, -0.3693965, 1, 0, 0.9058824, 1,
1.117133, 0.613678, 0.4973572, 1, 0, 0.9019608, 1,
1.120301, 0.834033, -0.1645752, 1, 0, 0.8941177, 1,
1.125525, 3.122348, 0.718798, 1, 0, 0.8862745, 1,
1.135332, -0.9365747, 4.232705, 1, 0, 0.8823529, 1,
1.137852, 0.1489291, 4.382084, 1, 0, 0.8745098, 1,
1.145386, 0.1285543, 3.142966, 1, 0, 0.8705882, 1,
1.146642, 0.1585249, 1.738995, 1, 0, 0.8627451, 1,
1.150521, -1.800501, 2.812022, 1, 0, 0.8588235, 1,
1.152824, -0.9712285, 1.384891, 1, 0, 0.8509804, 1,
1.157762, -1.090508, 2.76983, 1, 0, 0.8470588, 1,
1.158165, 1.468974, 1.309633, 1, 0, 0.8392157, 1,
1.166186, -0.7683226, 2.425865, 1, 0, 0.8352941, 1,
1.177248, -1.310399, 1.467756, 1, 0, 0.827451, 1,
1.179788, 0.1052625, -0.7267994, 1, 0, 0.8235294, 1,
1.18582, 0.4970008, 1.027982, 1, 0, 0.8156863, 1,
1.193888, 0.09873801, 2.009333, 1, 0, 0.8117647, 1,
1.195264, -0.6900246, 2.596764, 1, 0, 0.8039216, 1,
1.199771, -0.7111393, 3.54815, 1, 0, 0.7960784, 1,
1.199792, 0.227728, 1.784446, 1, 0, 0.7921569, 1,
1.201078, 1.002228, 0.3578885, 1, 0, 0.7843137, 1,
1.202994, 0.4710768, 0.8735313, 1, 0, 0.7803922, 1,
1.213252, 0.6928954, 1.961178, 1, 0, 0.772549, 1,
1.21404, 1.232127, 1.879365, 1, 0, 0.7686275, 1,
1.216733, 0.566628, 1.745226, 1, 0, 0.7607843, 1,
1.220861, 0.8012045, 3.043379, 1, 0, 0.7568628, 1,
1.223398, 0.3126758, 2.340495, 1, 0, 0.7490196, 1,
1.225653, 0.0216067, 0.7196902, 1, 0, 0.7450981, 1,
1.225799, -0.2355191, 1.679359, 1, 0, 0.7372549, 1,
1.226424, -0.2902743, 2.272357, 1, 0, 0.7333333, 1,
1.233247, -0.2362971, 2.049109, 1, 0, 0.7254902, 1,
1.236378, -1.466299, 2.367994, 1, 0, 0.7215686, 1,
1.243822, 0.6370217, 1.097022, 1, 0, 0.7137255, 1,
1.249108, -0.465284, 3.538543, 1, 0, 0.7098039, 1,
1.254517, 1.399841, 2.72968, 1, 0, 0.7019608, 1,
1.258276, 1.523667, 0.9042941, 1, 0, 0.6941177, 1,
1.264398, -0.6830606, 0.9089021, 1, 0, 0.6901961, 1,
1.265004, -0.842516, 1.613018, 1, 0, 0.682353, 1,
1.267267, -1.073893, 1.284889, 1, 0, 0.6784314, 1,
1.285797, 1.329822, 1.47149, 1, 0, 0.6705883, 1,
1.292481, -1.34163, 1.459231, 1, 0, 0.6666667, 1,
1.311277, -0.3261067, 1.674563, 1, 0, 0.6588235, 1,
1.326059, 0.4001053, 0.478898, 1, 0, 0.654902, 1,
1.329434, -0.895511, 2.389192, 1, 0, 0.6470588, 1,
1.330206, -0.3865765, 1.750466, 1, 0, 0.6431373, 1,
1.360765, -2.200228, 1.828857, 1, 0, 0.6352941, 1,
1.369852, 0.609883, 1.474863, 1, 0, 0.6313726, 1,
1.374959, -1.312563, 1.365693, 1, 0, 0.6235294, 1,
1.375255, 0.5582375, -1.640915, 1, 0, 0.6196079, 1,
1.377831, -0.07567164, 0.6829938, 1, 0, 0.6117647, 1,
1.390951, -1.17602, 1.681126, 1, 0, 0.6078432, 1,
1.417113, -0.1982926, 0.2799364, 1, 0, 0.6, 1,
1.421823, 1.095862, -0.2892012, 1, 0, 0.5921569, 1,
1.431201, 0.6431739, 1.487098, 1, 0, 0.5882353, 1,
1.434116, -0.1832003, -0.1237896, 1, 0, 0.5803922, 1,
1.439979, -0.9933842, 2.004868, 1, 0, 0.5764706, 1,
1.446965, 0.8974139, 1.053426, 1, 0, 0.5686275, 1,
1.450456, 0.8466553, 2.286052, 1, 0, 0.5647059, 1,
1.453593, 1.383455, -0.5649105, 1, 0, 0.5568628, 1,
1.457287, 0.2464753, 1.506856, 1, 0, 0.5529412, 1,
1.464827, 1.188654, -0.2131597, 1, 0, 0.5450981, 1,
1.471443, -1.033814, 3.434056, 1, 0, 0.5411765, 1,
1.473244, 1.045013, 0.8511325, 1, 0, 0.5333334, 1,
1.480259, 0.4625627, 0.1635407, 1, 0, 0.5294118, 1,
1.481447, -0.4291679, 3.796941, 1, 0, 0.5215687, 1,
1.48224, -0.9604233, 1.196563, 1, 0, 0.5176471, 1,
1.484727, 0.7864103, 1.249913, 1, 0, 0.509804, 1,
1.490564, 1.902142, -0.01781733, 1, 0, 0.5058824, 1,
1.499939, -2.221661, 2.233084, 1, 0, 0.4980392, 1,
1.501563, -0.2828227, 1.876862, 1, 0, 0.4901961, 1,
1.50457, -0.655269, 1.09052, 1, 0, 0.4862745, 1,
1.506479, -0.7667842, 1.203267, 1, 0, 0.4784314, 1,
1.50769, 0.6243255, 1.27268, 1, 0, 0.4745098, 1,
1.52381, 0.6523077, 2.747077, 1, 0, 0.4666667, 1,
1.529777, 0.1024633, 3.176369, 1, 0, 0.4627451, 1,
1.533841, -0.2052241, 2.544786, 1, 0, 0.454902, 1,
1.535612, -0.3958908, 2.369071, 1, 0, 0.4509804, 1,
1.556891, -0.01420128, 1.529919, 1, 0, 0.4431373, 1,
1.565961, 0.2047095, 2.540017, 1, 0, 0.4392157, 1,
1.571683, 0.4362932, 1.50827, 1, 0, 0.4313726, 1,
1.582393, -1.634639, 0.5134496, 1, 0, 0.427451, 1,
1.583514, 0.3287427, -0.05126742, 1, 0, 0.4196078, 1,
1.592829, -0.7275984, 1.50387, 1, 0, 0.4156863, 1,
1.605717, 0.1248719, 3.721749, 1, 0, 0.4078431, 1,
1.613112, 1.227736, -1.382339, 1, 0, 0.4039216, 1,
1.616969, -0.4333539, 2.130922, 1, 0, 0.3960784, 1,
1.640411, 1.307385, 0.3293349, 1, 0, 0.3882353, 1,
1.643147, 0.007956298, 1.019477, 1, 0, 0.3843137, 1,
1.64456, -1.250347, 0.09464556, 1, 0, 0.3764706, 1,
1.652639, 1.104007, 2.220752, 1, 0, 0.372549, 1,
1.661856, 0.1275056, 1.072231, 1, 0, 0.3647059, 1,
1.66778, 1.080032, 2.654381, 1, 0, 0.3607843, 1,
1.683101, 0.75127, 0.1209927, 1, 0, 0.3529412, 1,
1.687225, -1.677613, 3.077031, 1, 0, 0.3490196, 1,
1.689494, 1.349829, 0.564984, 1, 0, 0.3411765, 1,
1.717348, -0.9905186, 2.739017, 1, 0, 0.3372549, 1,
1.731412, 0.4328764, 2.220784, 1, 0, 0.3294118, 1,
1.736714, -1.560106, 4.275314, 1, 0, 0.3254902, 1,
1.74836, 2.282964, 0.4583527, 1, 0, 0.3176471, 1,
1.755037, 0.3160465, 0.3998616, 1, 0, 0.3137255, 1,
1.764991, -0.4297955, 1.22267, 1, 0, 0.3058824, 1,
1.765001, -0.896661, 1.435356, 1, 0, 0.2980392, 1,
1.767544, 2.276288, -0.2723018, 1, 0, 0.2941177, 1,
1.773534, -0.5661917, 1.162607, 1, 0, 0.2862745, 1,
1.78776, 0.3011372, 2.539959, 1, 0, 0.282353, 1,
1.798708, 0.6074172, 1.706895, 1, 0, 0.2745098, 1,
1.802116, -0.06626505, 1.799834, 1, 0, 0.2705882, 1,
1.805827, 0.01273685, 2.107995, 1, 0, 0.2627451, 1,
1.814646, 0.5602714, 0.8481706, 1, 0, 0.2588235, 1,
1.821183, -0.7123736, 2.051369, 1, 0, 0.2509804, 1,
1.828759, -1.028211, 4.333652, 1, 0, 0.2470588, 1,
1.839705, -0.4106107, 2.069861, 1, 0, 0.2392157, 1,
1.849525, -0.1283419, 2.022321, 1, 0, 0.2352941, 1,
1.853026, -0.05747519, 1.786717, 1, 0, 0.227451, 1,
1.862289, -0.6756814, 1.235276, 1, 0, 0.2235294, 1,
1.894336, 0.5974721, 1.499235, 1, 0, 0.2156863, 1,
1.937052, -1.339478, 2.780021, 1, 0, 0.2117647, 1,
1.938267, -0.4233225, 2.501859, 1, 0, 0.2039216, 1,
1.947587, -0.7057657, 4.13981, 1, 0, 0.1960784, 1,
1.959802, -0.4611561, 0.7579544, 1, 0, 0.1921569, 1,
1.967522, -0.1051303, 1.32542, 1, 0, 0.1843137, 1,
1.978164, 1.783941, 1.334047, 1, 0, 0.1803922, 1,
1.984291, -0.2663753, 2.396975, 1, 0, 0.172549, 1,
2.004942, 0.1851122, 0.6690451, 1, 0, 0.1686275, 1,
2.007915, 0.01319091, 1.962805, 1, 0, 0.1607843, 1,
2.01626, -0.5301917, 1.212225, 1, 0, 0.1568628, 1,
2.019943, -0.2815754, 3.397431, 1, 0, 0.1490196, 1,
2.038463, 0.3032941, 1.456071, 1, 0, 0.145098, 1,
2.050175, -1.120582, 2.469402, 1, 0, 0.1372549, 1,
2.054507, 0.2239492, 0.1274259, 1, 0, 0.1333333, 1,
2.074811, -1.161606, 1.080009, 1, 0, 0.1254902, 1,
2.076782, -0.04662269, 1.95506, 1, 0, 0.1215686, 1,
2.099092, 1.083016, 2.377543, 1, 0, 0.1137255, 1,
2.128816, 1.511616, 3.876188, 1, 0, 0.1098039, 1,
2.131057, -0.1298921, 1.74022, 1, 0, 0.1019608, 1,
2.135726, -0.2447399, 2.453935, 1, 0, 0.09411765, 1,
2.181874, 0.4876492, 1.203338, 1, 0, 0.09019608, 1,
2.190731, 0.3326569, -0.1290296, 1, 0, 0.08235294, 1,
2.244743, -0.8957097, 0.8264986, 1, 0, 0.07843138, 1,
2.30427, -1.140365, 2.567398, 1, 0, 0.07058824, 1,
2.357581, -2.352525, 1.071329, 1, 0, 0.06666667, 1,
2.376827, 0.558341, 0.251123, 1, 0, 0.05882353, 1,
2.37919, -0.2183183, 0.1151784, 1, 0, 0.05490196, 1,
2.3793, 1.001393, 1.951327, 1, 0, 0.04705882, 1,
2.429357, 1.69771, 0.8909807, 1, 0, 0.04313726, 1,
2.434725, 0.3950321, 2.758307, 1, 0, 0.03529412, 1,
2.495192, 0.01113957, 1.692225, 1, 0, 0.03137255, 1,
2.58016, 1.096849, 2.801651, 1, 0, 0.02352941, 1,
2.602919, 0.07068036, 1.76225, 1, 0, 0.01960784, 1,
2.619576, -0.09055124, 0.4576375, 1, 0, 0.01176471, 1,
2.880678, -1.630698, 1.95662, 1, 0, 0.007843138, 1
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
-0.09753835, -5.010518, -6.862005, 0, -0.5, 0.5, 0.5,
-0.09753835, -5.010518, -6.862005, 1, -0.5, 0.5, 0.5,
-0.09753835, -5.010518, -6.862005, 1, 1.5, 0.5, 0.5,
-0.09753835, -5.010518, -6.862005, 0, 1.5, 0.5, 0.5
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
-4.08537, -0.3547214, -6.862005, 0, -0.5, 0.5, 0.5,
-4.08537, -0.3547214, -6.862005, 1, -0.5, 0.5, 0.5,
-4.08537, -0.3547214, -6.862005, 1, 1.5, 0.5, 0.5,
-4.08537, -0.3547214, -6.862005, 0, 1.5, 0.5, 0.5
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
-4.08537, -5.010518, -0.1660614, 0, -0.5, 0.5, 0.5,
-4.08537, -5.010518, -0.1660614, 1, -0.5, 0.5, 0.5,
-4.08537, -5.010518, -0.1660614, 1, 1.5, 0.5, 0.5,
-4.08537, -5.010518, -0.1660614, 0, 1.5, 0.5, 0.5
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
-3, -3.936103, -5.316787,
2, -3.936103, -5.316787,
-3, -3.936103, -5.316787,
-3, -4.115172, -5.574324,
-2, -3.936103, -5.316787,
-2, -4.115172, -5.574324,
-1, -3.936103, -5.316787,
-1, -4.115172, -5.574324,
0, -3.936103, -5.316787,
0, -4.115172, -5.574324,
1, -3.936103, -5.316787,
1, -4.115172, -5.574324,
2, -3.936103, -5.316787,
2, -4.115172, -5.574324
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
-3, -4.47331, -6.089396, 0, -0.5, 0.5, 0.5,
-3, -4.47331, -6.089396, 1, -0.5, 0.5, 0.5,
-3, -4.47331, -6.089396, 1, 1.5, 0.5, 0.5,
-3, -4.47331, -6.089396, 0, 1.5, 0.5, 0.5,
-2, -4.47331, -6.089396, 0, -0.5, 0.5, 0.5,
-2, -4.47331, -6.089396, 1, -0.5, 0.5, 0.5,
-2, -4.47331, -6.089396, 1, 1.5, 0.5, 0.5,
-2, -4.47331, -6.089396, 0, 1.5, 0.5, 0.5,
-1, -4.47331, -6.089396, 0, -0.5, 0.5, 0.5,
-1, -4.47331, -6.089396, 1, -0.5, 0.5, 0.5,
-1, -4.47331, -6.089396, 1, 1.5, 0.5, 0.5,
-1, -4.47331, -6.089396, 0, 1.5, 0.5, 0.5,
0, -4.47331, -6.089396, 0, -0.5, 0.5, 0.5,
0, -4.47331, -6.089396, 1, -0.5, 0.5, 0.5,
0, -4.47331, -6.089396, 1, 1.5, 0.5, 0.5,
0, -4.47331, -6.089396, 0, 1.5, 0.5, 0.5,
1, -4.47331, -6.089396, 0, -0.5, 0.5, 0.5,
1, -4.47331, -6.089396, 1, -0.5, 0.5, 0.5,
1, -4.47331, -6.089396, 1, 1.5, 0.5, 0.5,
1, -4.47331, -6.089396, 0, 1.5, 0.5, 0.5,
2, -4.47331, -6.089396, 0, -0.5, 0.5, 0.5,
2, -4.47331, -6.089396, 1, -0.5, 0.5, 0.5,
2, -4.47331, -6.089396, 1, 1.5, 0.5, 0.5,
2, -4.47331, -6.089396, 0, 1.5, 0.5, 0.5
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
-3.165101, -3, -5.316787,
-3.165101, 3, -5.316787,
-3.165101, -3, -5.316787,
-3.318479, -3, -5.574324,
-3.165101, -2, -5.316787,
-3.318479, -2, -5.574324,
-3.165101, -1, -5.316787,
-3.318479, -1, -5.574324,
-3.165101, 0, -5.316787,
-3.318479, 0, -5.574324,
-3.165101, 1, -5.316787,
-3.318479, 1, -5.574324,
-3.165101, 2, -5.316787,
-3.318479, 2, -5.574324,
-3.165101, 3, -5.316787,
-3.318479, 3, -5.574324
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
-3.625235, -3, -6.089396, 0, -0.5, 0.5, 0.5,
-3.625235, -3, -6.089396, 1, -0.5, 0.5, 0.5,
-3.625235, -3, -6.089396, 1, 1.5, 0.5, 0.5,
-3.625235, -3, -6.089396, 0, 1.5, 0.5, 0.5,
-3.625235, -2, -6.089396, 0, -0.5, 0.5, 0.5,
-3.625235, -2, -6.089396, 1, -0.5, 0.5, 0.5,
-3.625235, -2, -6.089396, 1, 1.5, 0.5, 0.5,
-3.625235, -2, -6.089396, 0, 1.5, 0.5, 0.5,
-3.625235, -1, -6.089396, 0, -0.5, 0.5, 0.5,
-3.625235, -1, -6.089396, 1, -0.5, 0.5, 0.5,
-3.625235, -1, -6.089396, 1, 1.5, 0.5, 0.5,
-3.625235, -1, -6.089396, 0, 1.5, 0.5, 0.5,
-3.625235, 0, -6.089396, 0, -0.5, 0.5, 0.5,
-3.625235, 0, -6.089396, 1, -0.5, 0.5, 0.5,
-3.625235, 0, -6.089396, 1, 1.5, 0.5, 0.5,
-3.625235, 0, -6.089396, 0, 1.5, 0.5, 0.5,
-3.625235, 1, -6.089396, 0, -0.5, 0.5, 0.5,
-3.625235, 1, -6.089396, 1, -0.5, 0.5, 0.5,
-3.625235, 1, -6.089396, 1, 1.5, 0.5, 0.5,
-3.625235, 1, -6.089396, 0, 1.5, 0.5, 0.5,
-3.625235, 2, -6.089396, 0, -0.5, 0.5, 0.5,
-3.625235, 2, -6.089396, 1, -0.5, 0.5, 0.5,
-3.625235, 2, -6.089396, 1, 1.5, 0.5, 0.5,
-3.625235, 2, -6.089396, 0, 1.5, 0.5, 0.5,
-3.625235, 3, -6.089396, 0, -0.5, 0.5, 0.5,
-3.625235, 3, -6.089396, 1, -0.5, 0.5, 0.5,
-3.625235, 3, -6.089396, 1, 1.5, 0.5, 0.5,
-3.625235, 3, -6.089396, 0, 1.5, 0.5, 0.5
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
-3.165101, -3.936103, -4,
-3.165101, -3.936103, 4,
-3.165101, -3.936103, -4,
-3.318479, -4.115172, -4,
-3.165101, -3.936103, -2,
-3.318479, -4.115172, -2,
-3.165101, -3.936103, 0,
-3.318479, -4.115172, 0,
-3.165101, -3.936103, 2,
-3.318479, -4.115172, 2,
-3.165101, -3.936103, 4,
-3.318479, -4.115172, 4
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
-3.625235, -4.47331, -4, 0, -0.5, 0.5, 0.5,
-3.625235, -4.47331, -4, 1, -0.5, 0.5, 0.5,
-3.625235, -4.47331, -4, 1, 1.5, 0.5, 0.5,
-3.625235, -4.47331, -4, 0, 1.5, 0.5, 0.5,
-3.625235, -4.47331, -2, 0, -0.5, 0.5, 0.5,
-3.625235, -4.47331, -2, 1, -0.5, 0.5, 0.5,
-3.625235, -4.47331, -2, 1, 1.5, 0.5, 0.5,
-3.625235, -4.47331, -2, 0, 1.5, 0.5, 0.5,
-3.625235, -4.47331, 0, 0, -0.5, 0.5, 0.5,
-3.625235, -4.47331, 0, 1, -0.5, 0.5, 0.5,
-3.625235, -4.47331, 0, 1, 1.5, 0.5, 0.5,
-3.625235, -4.47331, 0, 0, 1.5, 0.5, 0.5,
-3.625235, -4.47331, 2, 0, -0.5, 0.5, 0.5,
-3.625235, -4.47331, 2, 1, -0.5, 0.5, 0.5,
-3.625235, -4.47331, 2, 1, 1.5, 0.5, 0.5,
-3.625235, -4.47331, 2, 0, 1.5, 0.5, 0.5,
-3.625235, -4.47331, 4, 0, -0.5, 0.5, 0.5,
-3.625235, -4.47331, 4, 1, -0.5, 0.5, 0.5,
-3.625235, -4.47331, 4, 1, 1.5, 0.5, 0.5,
-3.625235, -4.47331, 4, 0, 1.5, 0.5, 0.5
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
-3.165101, -3.936103, -5.316787,
-3.165101, 3.22666, -5.316787,
-3.165101, -3.936103, 4.984664,
-3.165101, 3.22666, 4.984664,
-3.165101, -3.936103, -5.316787,
-3.165101, -3.936103, 4.984664,
-3.165101, 3.22666, -5.316787,
-3.165101, 3.22666, 4.984664,
-3.165101, -3.936103, -5.316787,
2.970024, -3.936103, -5.316787,
-3.165101, -3.936103, 4.984664,
2.970024, -3.936103, 4.984664,
-3.165101, 3.22666, -5.316787,
2.970024, 3.22666, -5.316787,
-3.165101, 3.22666, 4.984664,
2.970024, 3.22666, 4.984664,
2.970024, -3.936103, -5.316787,
2.970024, 3.22666, -5.316787,
2.970024, -3.936103, 4.984664,
2.970024, 3.22666, 4.984664,
2.970024, -3.936103, -5.316787,
2.970024, -3.936103, 4.984664,
2.970024, 3.22666, -5.316787,
2.970024, 3.22666, 4.984664
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
var radius = 7.457873;
var distance = 33.18092;
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
mvMatrix.translate( 0.09753835, 0.3547214, 0.1660614 );
mvMatrix.scale( 1.314333, 1.125766, 0.7827633 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.18092);
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
Derris<-read.table("Derris.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Derris$V2
```

```
## Error in eval(expr, envir, enclos): object 'Derris' not found
```

```r
y<-Derris$V3
```

```
## Error in eval(expr, envir, enclos): object 'Derris' not found
```

```r
z<-Derris$V4
```

```
## Error in eval(expr, envir, enclos): object 'Derris' not found
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
-3.075754, -1.291034, -4.088506, 0, 0, 1, 1, 1,
-2.377059, 0.3737944, -0.1324397, 1, 0, 0, 1, 1,
-2.349484, 1.628329, -0.5204664, 1, 0, 0, 1, 1,
-2.223003, 1.715721, -0.04893209, 1, 0, 0, 1, 1,
-2.166341, -0.3904419, -1.587264, 1, 0, 0, 1, 1,
-2.164584, 0.6486455, -1.452957, 1, 0, 0, 1, 1,
-2.10256, 0.03594733, -2.548149, 0, 0, 0, 1, 1,
-2.087828, 1.528953, -0.8972173, 0, 0, 0, 1, 1,
-2.049372, -0.2571793, -0.7771488, 0, 0, 0, 1, 1,
-2.022825, -0.2490433, -0.9511206, 0, 0, 0, 1, 1,
-2.022056, -0.6957209, -1.990629, 0, 0, 0, 1, 1,
-1.986686, -0.3626646, -1.880344, 0, 0, 0, 1, 1,
-1.93605, 1.274091, -1.032343, 0, 0, 0, 1, 1,
-1.935234, 0.895128, -1.185261, 1, 1, 1, 1, 1,
-1.922831, -1.079444, -1.687186, 1, 1, 1, 1, 1,
-1.912502, 0.5853085, -2.159741, 1, 1, 1, 1, 1,
-1.902033, -0.1061844, -0.5351791, 1, 1, 1, 1, 1,
-1.876966, -0.4764741, -2.751202, 1, 1, 1, 1, 1,
-1.866435, 0.905547, -3.14436, 1, 1, 1, 1, 1,
-1.820636, -0.5582118, -0.8335845, 1, 1, 1, 1, 1,
-1.784717, 0.09941509, -2.264165, 1, 1, 1, 1, 1,
-1.783302, 1.025537, 0.7454345, 1, 1, 1, 1, 1,
-1.774518, 1.098542, -0.9524533, 1, 1, 1, 1, 1,
-1.723839, -0.4114976, -1.697775, 1, 1, 1, 1, 1,
-1.721051, 1.000837, -0.1929935, 1, 1, 1, 1, 1,
-1.714234, 0.7013915, -1.193846, 1, 1, 1, 1, 1,
-1.707575, -0.4685523, -1.948653, 1, 1, 1, 1, 1,
-1.692404, 0.6117941, -2.72245, 1, 1, 1, 1, 1,
-1.687923, -0.7296362, -1.052004, 0, 0, 1, 1, 1,
-1.686409, -0.9716401, -4.668997, 1, 0, 0, 1, 1,
-1.682042, 1.439795, -2.01977, 1, 0, 0, 1, 1,
-1.678721, -0.2955737, -1.241488, 1, 0, 0, 1, 1,
-1.672052, 2.390256, -0.07576144, 1, 0, 0, 1, 1,
-1.663776, 0.6701667, -1.699023, 1, 0, 0, 1, 1,
-1.660461, 0.03433307, -2.164203, 0, 0, 0, 1, 1,
-1.659287, -1.954226, 0.3606928, 0, 0, 0, 1, 1,
-1.645806, -0.7677869, -2.450545, 0, 0, 0, 1, 1,
-1.641213, -1.333066, -2.477975, 0, 0, 0, 1, 1,
-1.636462, -0.8697256, -1.59741, 0, 0, 0, 1, 1,
-1.635341, 2.027102, -0.5704495, 0, 0, 0, 1, 1,
-1.62831, 0.5152708, -0.7685378, 0, 0, 0, 1, 1,
-1.616528, 0.3285991, -1.853502, 1, 1, 1, 1, 1,
-1.603631, -0.8456479, -2.423714, 1, 1, 1, 1, 1,
-1.601562, 0.6847898, -0.1369336, 1, 1, 1, 1, 1,
-1.595918, -0.3493868, -1.764421, 1, 1, 1, 1, 1,
-1.586488, 0.6341739, -1.895696, 1, 1, 1, 1, 1,
-1.584431, 0.3230368, -2.04679, 1, 1, 1, 1, 1,
-1.57913, -2.054561, -1.152088, 1, 1, 1, 1, 1,
-1.564508, -0.4025715, -1.438658, 1, 1, 1, 1, 1,
-1.563984, -0.5766819, -3.006606, 1, 1, 1, 1, 1,
-1.559409, 2.731679, -0.1133181, 1, 1, 1, 1, 1,
-1.543904, -1.402982, -2.851994, 1, 1, 1, 1, 1,
-1.543886, 0.8345217, -0.2412409, 1, 1, 1, 1, 1,
-1.543823, -0.4223384, -1.200534, 1, 1, 1, 1, 1,
-1.538143, 2.16431, -2.66934, 1, 1, 1, 1, 1,
-1.532977, -0.7743338, -3.052353, 1, 1, 1, 1, 1,
-1.519475, 1.032394, -1.25843, 0, 0, 1, 1, 1,
-1.51676, -0.4275971, -2.390358, 1, 0, 0, 1, 1,
-1.504651, 0.8115352, -0.7005422, 1, 0, 0, 1, 1,
-1.500866, -0.2008345, -2.446318, 1, 0, 0, 1, 1,
-1.497313, -2.069581, -2.21694, 1, 0, 0, 1, 1,
-1.493925, 0.8254964, -1.912415, 1, 0, 0, 1, 1,
-1.490874, -1.907727, -3.788991, 0, 0, 0, 1, 1,
-1.47676, 0.3525977, 0.1831551, 0, 0, 0, 1, 1,
-1.471993, -1.483957, -1.767194, 0, 0, 0, 1, 1,
-1.470514, -0.5704033, -3.200219, 0, 0, 0, 1, 1,
-1.46484, 1.018733, -2.334918, 0, 0, 0, 1, 1,
-1.459815, -0.4146959, -2.291979, 0, 0, 0, 1, 1,
-1.421565, -0.3148175, -0.8249243, 0, 0, 0, 1, 1,
-1.414924, -0.415729, -1.667117, 1, 1, 1, 1, 1,
-1.410145, 0.01875164, 0.03522617, 1, 1, 1, 1, 1,
-1.406682, 0.9948168, -1.224931, 1, 1, 1, 1, 1,
-1.40348, 0.7419133, -2.099813, 1, 1, 1, 1, 1,
-1.393767, -0.8115322, -1.223434, 1, 1, 1, 1, 1,
-1.386077, 1.234234, 0.2993376, 1, 1, 1, 1, 1,
-1.376172, 0.3850686, -0.7592106, 1, 1, 1, 1, 1,
-1.364724, -1.385266, -2.005393, 1, 1, 1, 1, 1,
-1.358193, 1.098253, -0.03053017, 1, 1, 1, 1, 1,
-1.355979, -0.03867783, -1.707175, 1, 1, 1, 1, 1,
-1.346891, -0.9942806, -2.077025, 1, 1, 1, 1, 1,
-1.333852, 1.383129, 0.701145, 1, 1, 1, 1, 1,
-1.325893, -0.01120899, -3.241567, 1, 1, 1, 1, 1,
-1.322982, -0.4946637, -1.474621, 1, 1, 1, 1, 1,
-1.321295, 0.5819299, -1.840786, 1, 1, 1, 1, 1,
-1.320838, -0.6456213, -2.873569, 0, 0, 1, 1, 1,
-1.314265, 0.7572857, 0.15116, 1, 0, 0, 1, 1,
-1.304048, -0.2822101, -1.004058, 1, 0, 0, 1, 1,
-1.300641, -0.7857044, -1.015771, 1, 0, 0, 1, 1,
-1.289245, -1.126685, -2.140543, 1, 0, 0, 1, 1,
-1.288128, 1.490404, -1.764969, 1, 0, 0, 1, 1,
-1.284154, -0.9501843, -2.340462, 0, 0, 0, 1, 1,
-1.273777, -0.5144981, -0.9691411, 0, 0, 0, 1, 1,
-1.256854, -0.3947075, -1.079909, 0, 0, 0, 1, 1,
-1.254094, -0.09699222, -1.673594, 0, 0, 0, 1, 1,
-1.253519, -1.000585, -3.826658, 0, 0, 0, 1, 1,
-1.25251, 1.207118, -2.423119, 0, 0, 0, 1, 1,
-1.252385, -0.6886278, -0.6320734, 0, 0, 0, 1, 1,
-1.25154, 0.810922, -1.925095, 1, 1, 1, 1, 1,
-1.24698, -0.5668845, -0.7013755, 1, 1, 1, 1, 1,
-1.245223, -0.6717085, -0.9296932, 1, 1, 1, 1, 1,
-1.230525, -0.6884485, -1.993326, 1, 1, 1, 1, 1,
-1.216598, -1.59698, -2.001153, 1, 1, 1, 1, 1,
-1.214666, 0.1890668, -2.027749, 1, 1, 1, 1, 1,
-1.210997, 0.550143, -0.2466983, 1, 1, 1, 1, 1,
-1.20427, -0.8015229, -1.561334, 1, 1, 1, 1, 1,
-1.196965, 1.872833, -1.374433, 1, 1, 1, 1, 1,
-1.185936, 0.4175072, -0.6485025, 1, 1, 1, 1, 1,
-1.18356, 1.69394, 0.07976032, 1, 1, 1, 1, 1,
-1.170271, 1.251537, -1.625174, 1, 1, 1, 1, 1,
-1.164867, -0.2146265, -1.20923, 1, 1, 1, 1, 1,
-1.158046, -0.1399207, -1.521039, 1, 1, 1, 1, 1,
-1.154797, 0.9456675, 0.02894155, 1, 1, 1, 1, 1,
-1.153165, 2.414726, -1.588712, 0, 0, 1, 1, 1,
-1.148079, 1.433517, 0.5519453, 1, 0, 0, 1, 1,
-1.147912, -0.1330142, -1.568938, 1, 0, 0, 1, 1,
-1.1402, 1.724775, -1.09046, 1, 0, 0, 1, 1,
-1.137449, 1.360074, 0.6372676, 1, 0, 0, 1, 1,
-1.132527, -0.4152486, -1.488489, 1, 0, 0, 1, 1,
-1.132089, 0.9542856, -0.4610555, 0, 0, 0, 1, 1,
-1.119262, 1.230478, -0.4714234, 0, 0, 0, 1, 1,
-1.090346, -2.258967, -4.466538, 0, 0, 0, 1, 1,
-1.08989, 0.4427927, 0.05740184, 0, 0, 0, 1, 1,
-1.089815, -0.7573009, -1.76966, 0, 0, 0, 1, 1,
-1.087293, 0.8281024, -1.146229, 0, 0, 0, 1, 1,
-1.084198, -1.743169, -4.415051, 0, 0, 0, 1, 1,
-1.0822, -0.2745385, -1.407167, 1, 1, 1, 1, 1,
-1.081245, 0.02364117, -1.556174, 1, 1, 1, 1, 1,
-1.078918, 1.039109, -0.1014741, 1, 1, 1, 1, 1,
-1.076833, 1.439894, 0.07553631, 1, 1, 1, 1, 1,
-1.067564, 0.1787297, -1.445184, 1, 1, 1, 1, 1,
-1.064704, -0.2169553, -0.9740043, 1, 1, 1, 1, 1,
-1.059421, -0.9847826, -3.480158, 1, 1, 1, 1, 1,
-1.040621, -0.1179216, -2.924056, 1, 1, 1, 1, 1,
-1.036409, -1.197685, -1.608991, 1, 1, 1, 1, 1,
-1.027939, -3.831791, -3.286369, 1, 1, 1, 1, 1,
-1.027217, 0.6838343, 0.58328, 1, 1, 1, 1, 1,
-1.022523, -0.02571058, -2.089525, 1, 1, 1, 1, 1,
-1.021361, 1.128867, -0.329458, 1, 1, 1, 1, 1,
-1.020034, -0.4009475, -0.8775458, 1, 1, 1, 1, 1,
-1.019689, -0.1948614, -1.455297, 1, 1, 1, 1, 1,
-1.016774, -0.5784425, -3.986747, 0, 0, 1, 1, 1,
-1.015266, -0.08694565, -1.599401, 1, 0, 0, 1, 1,
-1.001946, -0.49274, -1.346266, 1, 0, 0, 1, 1,
-1.000175, 0.1486498, -2.249696, 1, 0, 0, 1, 1,
-0.995785, -0.6476681, -1.701362, 1, 0, 0, 1, 1,
-0.9884318, 0.370462, -0.8445485, 1, 0, 0, 1, 1,
-0.9800383, -0.1736509, -1.69842, 0, 0, 0, 1, 1,
-0.978487, 1.76329, -1.78422, 0, 0, 0, 1, 1,
-0.976795, 0.2500286, 0.1200728, 0, 0, 0, 1, 1,
-0.9678586, 0.516423, -3.173464, 0, 0, 0, 1, 1,
-0.9635395, -0.8207564, -2.481109, 0, 0, 0, 1, 1,
-0.9508507, 0.4540541, -1.124065, 0, 0, 0, 1, 1,
-0.9503355, -1.458238, -1.524284, 0, 0, 0, 1, 1,
-0.948827, 0.6850376, -1.643516, 1, 1, 1, 1, 1,
-0.9482105, 0.9842727, -1.388725, 1, 1, 1, 1, 1,
-0.9442509, -1.561832, -3.195737, 1, 1, 1, 1, 1,
-0.9436129, -0.241054, -1.37722, 1, 1, 1, 1, 1,
-0.9419466, 1.061323, 0.7722753, 1, 1, 1, 1, 1,
-0.9409077, 1.252803, -1.669824, 1, 1, 1, 1, 1,
-0.9401832, -0.8895527, -3.542259, 1, 1, 1, 1, 1,
-0.9397915, -1.333113, -4.064656, 1, 1, 1, 1, 1,
-0.9326296, -0.8130355, -3.775105, 1, 1, 1, 1, 1,
-0.9323859, 0.005700698, -0.4237554, 1, 1, 1, 1, 1,
-0.9297271, -1.733029, -3.272145, 1, 1, 1, 1, 1,
-0.929273, 0.441935, -2.489849, 1, 1, 1, 1, 1,
-0.9290319, -2.115921, -1.826189, 1, 1, 1, 1, 1,
-0.9233487, 0.06867325, -1.980019, 1, 1, 1, 1, 1,
-0.9180326, 0.3710306, -2.276664, 1, 1, 1, 1, 1,
-0.9179763, 1.271771, 0.8685586, 0, 0, 1, 1, 1,
-0.9147767, -0.4740937, -4.326311, 1, 0, 0, 1, 1,
-0.9143811, -2.246503, -2.26992, 1, 0, 0, 1, 1,
-0.8978374, 1.929783, -0.1055593, 1, 0, 0, 1, 1,
-0.8973338, 0.3112456, -0.3930477, 1, 0, 0, 1, 1,
-0.8917344, -0.3282955, -1.201056, 1, 0, 0, 1, 1,
-0.8767433, -0.08101512, -0.2915983, 0, 0, 0, 1, 1,
-0.8756548, -0.6144924, -3.970503, 0, 0, 0, 1, 1,
-0.8721116, 0.6308675, -0.2017631, 0, 0, 0, 1, 1,
-0.8691236, -0.8246647, -1.565646, 0, 0, 0, 1, 1,
-0.8669913, -0.4939288, -3.29605, 0, 0, 0, 1, 1,
-0.8573912, -1.488915, -3.728619, 0, 0, 0, 1, 1,
-0.8542341, -0.3483509, -2.738915, 0, 0, 0, 1, 1,
-0.8524415, 0.1885989, 0.9935414, 1, 1, 1, 1, 1,
-0.8511326, -3.161779, -2.862216, 1, 1, 1, 1, 1,
-0.8455863, -0.8383514, -2.283914, 1, 1, 1, 1, 1,
-0.8449951, -2.128773, -1.684877, 1, 1, 1, 1, 1,
-0.8445057, 1.60586, -1.730319, 1, 1, 1, 1, 1,
-0.8434867, -1.524693, -4.593211, 1, 1, 1, 1, 1,
-0.8417049, 0.7861004, -1.248673, 1, 1, 1, 1, 1,
-0.8416126, 1.45528, 0.6772935, 1, 1, 1, 1, 1,
-0.8355483, -0.6323975, -2.396022, 1, 1, 1, 1, 1,
-0.8327314, 1.352945, -1.872821, 1, 1, 1, 1, 1,
-0.829852, 0.6965432, -0.7748651, 1, 1, 1, 1, 1,
-0.8290792, 0.4280555, -1.118538, 1, 1, 1, 1, 1,
-0.8236848, 0.4202718, -1.02137, 1, 1, 1, 1, 1,
-0.8236112, -1.136556, -2.77864, 1, 1, 1, 1, 1,
-0.8207777, 0.2064875, -1.070211, 1, 1, 1, 1, 1,
-0.8190395, 1.416744, 1.65088, 0, 0, 1, 1, 1,
-0.8159294, 0.7766943, -0.6920693, 1, 0, 0, 1, 1,
-0.8108569, -0.4282477, -1.449422, 1, 0, 0, 1, 1,
-0.8037753, -1.783956, -1.923452, 1, 0, 0, 1, 1,
-0.8033434, -0.6613094, -1.592031, 1, 0, 0, 1, 1,
-0.8033353, -0.2207847, -1.380938, 1, 0, 0, 1, 1,
-0.8029329, -2.130059, -1.86568, 0, 0, 0, 1, 1,
-0.8026079, -1.363228, -1.777053, 0, 0, 0, 1, 1,
-0.7866409, 0.9543993, -0.9757454, 0, 0, 0, 1, 1,
-0.7831026, -1.353462, -3.978371, 0, 0, 0, 1, 1,
-0.7828645, 1.092407, -1.168658, 0, 0, 0, 1, 1,
-0.7819636, -0.148759, -1.551702, 0, 0, 0, 1, 1,
-0.7722262, 0.852211, -2.444887, 0, 0, 0, 1, 1,
-0.7718322, 0.902962, -0.1715861, 1, 1, 1, 1, 1,
-0.7701481, -0.2248084, -1.655457, 1, 1, 1, 1, 1,
-0.7690086, -1.635956, -2.200819, 1, 1, 1, 1, 1,
-0.7647246, -2.537268, -2.294642, 1, 1, 1, 1, 1,
-0.7614575, 0.7395766, 0.742655, 1, 1, 1, 1, 1,
-0.7606829, -0.02487905, 0.4292983, 1, 1, 1, 1, 1,
-0.7599226, -1.625138, -3.49599, 1, 1, 1, 1, 1,
-0.7585157, 0.8293335, -2.31598, 1, 1, 1, 1, 1,
-0.7561998, -0.05072862, -2.50252, 1, 1, 1, 1, 1,
-0.7555071, 0.3607523, -0.6062726, 1, 1, 1, 1, 1,
-0.7470561, -0.1007194, -0.6135713, 1, 1, 1, 1, 1,
-0.7468805, 0.3974382, -0.5370051, 1, 1, 1, 1, 1,
-0.7463325, -0.3356897, -1.966516, 1, 1, 1, 1, 1,
-0.7445702, 0.1801471, -0.9698052, 1, 1, 1, 1, 1,
-0.7439675, 1.2472, 0.3105939, 1, 1, 1, 1, 1,
-0.7401105, 0.09824847, -0.7554066, 0, 0, 1, 1, 1,
-0.7388731, 0.5549061, -0.4641295, 1, 0, 0, 1, 1,
-0.7385835, 0.06568341, -0.4425071, 1, 0, 0, 1, 1,
-0.7254192, 1.648035, 0.05098137, 1, 0, 0, 1, 1,
-0.7231275, 2.093329, -0.7636747, 1, 0, 0, 1, 1,
-0.7228842, -0.3642392, -2.253397, 1, 0, 0, 1, 1,
-0.7221724, -1.890826, -4.26267, 0, 0, 0, 1, 1,
-0.7218527, -1.386874, -3.104414, 0, 0, 0, 1, 1,
-0.715359, -2.681961, -0.6238631, 0, 0, 0, 1, 1,
-0.7092706, -1.211432, -3.200817, 0, 0, 0, 1, 1,
-0.7079679, 0.3305031, -1.634398, 0, 0, 0, 1, 1,
-0.6927099, 0.2363532, 0.4069465, 0, 0, 0, 1, 1,
-0.6902855, -0.3688363, -1.933071, 0, 0, 0, 1, 1,
-0.6893531, -0.2834185, -0.6685384, 1, 1, 1, 1, 1,
-0.6889016, -0.5049209, -2.330701, 1, 1, 1, 1, 1,
-0.6888828, 0.4031798, -3.42606, 1, 1, 1, 1, 1,
-0.6845053, 0.02965706, -0.9010438, 1, 1, 1, 1, 1,
-0.6790056, -1.217724, -3.327023, 1, 1, 1, 1, 1,
-0.6764836, 2.121382, -1.953098, 1, 1, 1, 1, 1,
-0.6764738, 0.4661483, 0.630024, 1, 1, 1, 1, 1,
-0.672872, -1.095413, -1.481212, 1, 1, 1, 1, 1,
-0.669789, -0.1715715, -2.066181, 1, 1, 1, 1, 1,
-0.6673591, 2.403843, 1.113325, 1, 1, 1, 1, 1,
-0.6658141, -1.535225, -2.939507, 1, 1, 1, 1, 1,
-0.6647844, -0.3992243, -2.596166, 1, 1, 1, 1, 1,
-0.6644305, -1.78028, -3.048547, 1, 1, 1, 1, 1,
-0.6615407, -1.282288, -1.979986, 1, 1, 1, 1, 1,
-0.6589284, -0.6861167, -2.292965, 1, 1, 1, 1, 1,
-0.658321, -0.4987742, -3.877272, 0, 0, 1, 1, 1,
-0.6533589, -0.4709845, -3.272112, 1, 0, 0, 1, 1,
-0.6501577, 1.052444, -2.649838, 1, 0, 0, 1, 1,
-0.6494631, 0.04977401, -1.647708, 1, 0, 0, 1, 1,
-0.6472632, 1.556347, -1.654433, 1, 0, 0, 1, 1,
-0.644869, 1.030371, -0.4757355, 1, 0, 0, 1, 1,
-0.6439904, 0.8394899, -1.874767, 0, 0, 0, 1, 1,
-0.6418443, 1.722307, 0.9233504, 0, 0, 0, 1, 1,
-0.6407352, -0.8863423, -5.166766, 0, 0, 0, 1, 1,
-0.639322, -0.1874496, -2.527126, 0, 0, 0, 1, 1,
-0.6391703, 0.1150588, -1.933365, 0, 0, 0, 1, 1,
-0.6373188, 1.678282, -1.943278, 0, 0, 0, 1, 1,
-0.6322953, 0.8220018, 0.3280304, 0, 0, 0, 1, 1,
-0.6282902, 1.018714, -0.6916147, 1, 1, 1, 1, 1,
-0.6267182, 0.6309288, -2.657092, 1, 1, 1, 1, 1,
-0.6226509, -0.5416434, -2.527779, 1, 1, 1, 1, 1,
-0.6009549, -0.8261285, -1.741769, 1, 1, 1, 1, 1,
-0.5995277, 0.3837163, 0.1317155, 1, 1, 1, 1, 1,
-0.5958034, 0.3517046, -1.423246, 1, 1, 1, 1, 1,
-0.5953284, -1.134104, -4.523939, 1, 1, 1, 1, 1,
-0.5913275, -1.66621, -4.05029, 1, 1, 1, 1, 1,
-0.5911331, 1.158237, -0.8499756, 1, 1, 1, 1, 1,
-0.5886458, 0.1069182, -2.411332, 1, 1, 1, 1, 1,
-0.5850922, -0.03776089, -1.814874, 1, 1, 1, 1, 1,
-0.5847839, 0.2817644, -1.628622, 1, 1, 1, 1, 1,
-0.5846326, 1.243312, -0.5166326, 1, 1, 1, 1, 1,
-0.5824714, 0.5300784, -2.253498, 1, 1, 1, 1, 1,
-0.5818636, 0.02793235, -0.2849084, 1, 1, 1, 1, 1,
-0.5796416, 0.6537489, -2.287219, 0, 0, 1, 1, 1,
-0.5784191, -0.3286266, -3.071796, 1, 0, 0, 1, 1,
-0.576043, 0.4523354, -0.7581667, 1, 0, 0, 1, 1,
-0.5750892, 0.986324, -0.8185763, 1, 0, 0, 1, 1,
-0.5741497, -1.289023, -4.039062, 1, 0, 0, 1, 1,
-0.5683288, -0.6177756, -2.879363, 1, 0, 0, 1, 1,
-0.5636507, 1.324557, 0.2166679, 0, 0, 0, 1, 1,
-0.5616837, -0.9166365, -2.106372, 0, 0, 0, 1, 1,
-0.554815, -0.3921302, -1.79076, 0, 0, 0, 1, 1,
-0.5536894, 0.4630243, -0.7224402, 0, 0, 0, 1, 1,
-0.5528304, -1.763455, -4.169086, 0, 0, 0, 1, 1,
-0.5467064, -2.154057, -4.771416, 0, 0, 0, 1, 1,
-0.5465624, 0.8490672, -0.007737658, 0, 0, 0, 1, 1,
-0.5451255, -0.6048352, -2.91714, 1, 1, 1, 1, 1,
-0.5437659, -0.5804246, -2.453977, 1, 1, 1, 1, 1,
-0.5368963, 1.046103, -1.651662, 1, 1, 1, 1, 1,
-0.5334388, 0.722458, 0.5280567, 1, 1, 1, 1, 1,
-0.532413, -0.7299806, -2.724527, 1, 1, 1, 1, 1,
-0.530977, 1.918743, -1.141398, 1, 1, 1, 1, 1,
-0.5309368, -1.929788, -0.5832776, 1, 1, 1, 1, 1,
-0.5305963, -0.08656016, -2.153465, 1, 1, 1, 1, 1,
-0.5137385, -0.9615517, -2.53756, 1, 1, 1, 1, 1,
-0.5129521, 0.8085527, 0.1134653, 1, 1, 1, 1, 1,
-0.5105258, 1.659422, 0.412705, 1, 1, 1, 1, 1,
-0.5102414, -1.010272, -3.391859, 1, 1, 1, 1, 1,
-0.5094992, 1.354474, -0.8476304, 1, 1, 1, 1, 1,
-0.5001558, 1.157624, 0.9085291, 1, 1, 1, 1, 1,
-0.4974215, 1.457689, 0.1531695, 1, 1, 1, 1, 1,
-0.4960392, -0.08270763, -1.786615, 0, 0, 1, 1, 1,
-0.4922192, -0.6800345, -3.092407, 1, 0, 0, 1, 1,
-0.4897956, -0.4491464, -2.129679, 1, 0, 0, 1, 1,
-0.4838381, -0.8352709, -2.461322, 1, 0, 0, 1, 1,
-0.4835628, -0.7668514, -2.908935, 1, 0, 0, 1, 1,
-0.4825422, 0.7817798, 1.362115, 1, 0, 0, 1, 1,
-0.4819197, -0.4895813, -2.536172, 0, 0, 0, 1, 1,
-0.4816863, -1.040415, -1.71778, 0, 0, 0, 1, 1,
-0.4802293, 0.6071339, -1.349238, 0, 0, 0, 1, 1,
-0.4794682, 1.007837, 0.5157167, 0, 0, 0, 1, 1,
-0.4721822, 1.307834, -0.6493187, 0, 0, 0, 1, 1,
-0.4704773, 1.742092, 0.03948913, 0, 0, 0, 1, 1,
-0.4666477, -0.6962529, -2.93653, 0, 0, 0, 1, 1,
-0.4651753, -0.02003566, -1.002006, 1, 1, 1, 1, 1,
-0.4612932, -0.5559992, -0.4885682, 1, 1, 1, 1, 1,
-0.4594518, 1.022226, -1.220067, 1, 1, 1, 1, 1,
-0.4592017, -0.958782, -2.590639, 1, 1, 1, 1, 1,
-0.4568461, -0.7620865, -2.298027, 1, 1, 1, 1, 1,
-0.4466841, -0.1169952, 0.09528169, 1, 1, 1, 1, 1,
-0.4335763, -0.07866663, -2.157701, 1, 1, 1, 1, 1,
-0.4320577, -0.4306212, -3.552842, 1, 1, 1, 1, 1,
-0.4288784, 0.5616558, -1.340653, 1, 1, 1, 1, 1,
-0.427487, 0.3313102, -0.992561, 1, 1, 1, 1, 1,
-0.4267155, 0.6211669, -1.9966, 1, 1, 1, 1, 1,
-0.4255262, -0.1145629, -2.459855, 1, 1, 1, 1, 1,
-0.4242558, 1.730512, -0.7685869, 1, 1, 1, 1, 1,
-0.4219036, -0.873215, -4.242439, 1, 1, 1, 1, 1,
-0.4202234, -1.342744, -0.7845679, 1, 1, 1, 1, 1,
-0.4172119, -0.9060051, -4.875188, 0, 0, 1, 1, 1,
-0.4170584, -1.295132, -2.603766, 1, 0, 0, 1, 1,
-0.4141052, 0.2471738, 0.6798773, 1, 0, 0, 1, 1,
-0.4137089, 0.1173415, -1.181036, 1, 0, 0, 1, 1,
-0.4129721, 1.377773, 0.3496054, 1, 0, 0, 1, 1,
-0.4119568, 0.8331584, -0.3164581, 1, 0, 0, 1, 1,
-0.4089118, 2.066939, -1.835451, 0, 0, 0, 1, 1,
-0.3980541, -0.243955, -3.333495, 0, 0, 0, 1, 1,
-0.3954653, -0.4519862, -3.501443, 0, 0, 0, 1, 1,
-0.3876975, -0.9986418, -3.565814, 0, 0, 0, 1, 1,
-0.3866076, -1.471499, -1.905513, 0, 0, 0, 1, 1,
-0.3831277, 0.1951467, 0.2794563, 0, 0, 0, 1, 1,
-0.3803574, -0.7363842, -1.733399, 0, 0, 0, 1, 1,
-0.379355, -0.05046482, -2.756189, 1, 1, 1, 1, 1,
-0.3742706, 0.3131791, -2.277959, 1, 1, 1, 1, 1,
-0.3715188, 1.177884, -1.456741, 1, 1, 1, 1, 1,
-0.3709784, -0.8838145, -2.650299, 1, 1, 1, 1, 1,
-0.3658679, -0.6109505, -4.014562, 1, 1, 1, 1, 1,
-0.3624811, 1.014547, -0.736945, 1, 1, 1, 1, 1,
-0.3611156, 1.07543, -1.097463, 1, 1, 1, 1, 1,
-0.3595384, 1.746831, -0.5459612, 1, 1, 1, 1, 1,
-0.3557598, -0.5566331, -2.567103, 1, 1, 1, 1, 1,
-0.3557464, 0.6751774, -0.4870404, 1, 1, 1, 1, 1,
-0.355743, 0.572294, -1.116938, 1, 1, 1, 1, 1,
-0.3543773, -0.4479285, -1.945333, 1, 1, 1, 1, 1,
-0.3471012, 0.7857789, -1.201343, 1, 1, 1, 1, 1,
-0.3419255, 0.7721222, -0.02721418, 1, 1, 1, 1, 1,
-0.3374203, -0.2471886, -0.8725405, 1, 1, 1, 1, 1,
-0.330964, -0.6108227, -4.28859, 0, 0, 1, 1, 1,
-0.3281223, -0.1276194, -1.130985, 1, 0, 0, 1, 1,
-0.3275092, -1.279776, -3.693727, 1, 0, 0, 1, 1,
-0.3240655, -0.04552237, -0.6390348, 1, 0, 0, 1, 1,
-0.323526, 0.1013228, -1.621031, 1, 0, 0, 1, 1,
-0.3234931, 0.9388165, -2.511749, 1, 0, 0, 1, 1,
-0.3228743, 0.0413378, -0.9892958, 0, 0, 0, 1, 1,
-0.3223842, -0.8773211, -3.753743, 0, 0, 0, 1, 1,
-0.3190517, 0.1745272, -0.7053566, 0, 0, 0, 1, 1,
-0.3155668, 0.1150182, -1.58794, 0, 0, 0, 1, 1,
-0.3146527, -0.3970568, -1.732056, 0, 0, 0, 1, 1,
-0.3127513, 0.4171745, -1.626639, 0, 0, 0, 1, 1,
-0.3117668, 0.7101012, -1.783394, 0, 0, 0, 1, 1,
-0.3042816, 1.27906, 0.9278614, 1, 1, 1, 1, 1,
-0.3037259, -0.2470197, -2.295196, 1, 1, 1, 1, 1,
-0.290166, -0.6048867, -3.970789, 1, 1, 1, 1, 1,
-0.2784356, 1.363083, 1.619932, 1, 1, 1, 1, 1,
-0.2780528, -0.1204551, -3.026806, 1, 1, 1, 1, 1,
-0.2741853, 0.9922388, -0.09397158, 1, 1, 1, 1, 1,
-0.2737026, 0.2556126, -0.8814716, 1, 1, 1, 1, 1,
-0.2700415, -0.01874628, -1.32914, 1, 1, 1, 1, 1,
-0.2696039, 0.8745813, -0.7255503, 1, 1, 1, 1, 1,
-0.2694068, 0.4291708, -2.200983, 1, 1, 1, 1, 1,
-0.2653606, -0.08813319, -2.670227, 1, 1, 1, 1, 1,
-0.2571204, -0.7160987, -2.595235, 1, 1, 1, 1, 1,
-0.2561262, 0.7232479, 0.1739781, 1, 1, 1, 1, 1,
-0.2500006, 0.1210823, -1.16196, 1, 1, 1, 1, 1,
-0.2472949, 0.4671714, -0.1349891, 1, 1, 1, 1, 1,
-0.2436524, 0.6194227, -0.6949245, 0, 0, 1, 1, 1,
-0.2419034, 0.6545702, 0.974026, 1, 0, 0, 1, 1,
-0.2397662, 0.6248801, -0.2891979, 1, 0, 0, 1, 1,
-0.2349372, 0.5959742, -0.2963516, 1, 0, 0, 1, 1,
-0.2345227, 0.09330647, -0.6202536, 1, 0, 0, 1, 1,
-0.2312887, 0.3545028, -1.03743, 1, 0, 0, 1, 1,
-0.2310355, 0.8040359, -0.6944706, 0, 0, 0, 1, 1,
-0.2284865, 0.4933494, -0.557942, 0, 0, 0, 1, 1,
-0.2225152, 0.2514368, -0.59595, 0, 0, 0, 1, 1,
-0.2209097, 0.9482625, -1.098337, 0, 0, 0, 1, 1,
-0.2205094, -0.5065918, -3.741043, 0, 0, 0, 1, 1,
-0.2169325, -0.2202223, -1.390168, 0, 0, 0, 1, 1,
-0.2152224, -0.8132356, -2.633679, 0, 0, 0, 1, 1,
-0.2112343, 0.1279051, 0.1834573, 1, 1, 1, 1, 1,
-0.2101001, 1.381633, -0.8645615, 1, 1, 1, 1, 1,
-0.2097101, 1.524638, 0.004445712, 1, 1, 1, 1, 1,
-0.2082889, 1.160531, 0.2745835, 1, 1, 1, 1, 1,
-0.2059837, -0.939924, -4.49212, 1, 1, 1, 1, 1,
-0.2051416, -0.06398756, -0.2299505, 1, 1, 1, 1, 1,
-0.2022258, -0.1677609, -2.319047, 1, 1, 1, 1, 1,
-0.2005307, -0.6750821, -3.33964, 1, 1, 1, 1, 1,
-0.2002819, 0.7961181, -0.2835039, 1, 1, 1, 1, 1,
-0.1993805, -0.2782515, -2.419216, 1, 1, 1, 1, 1,
-0.192373, -2.227307, -3.056813, 1, 1, 1, 1, 1,
-0.1894301, -0.1219261, -2.490425, 1, 1, 1, 1, 1,
-0.1883293, -0.5822065, -4.007626, 1, 1, 1, 1, 1,
-0.1779069, -0.2377293, -0.9089601, 1, 1, 1, 1, 1,
-0.176473, 0.3997017, -0.5336049, 1, 1, 1, 1, 1,
-0.1754012, 0.2004306, -1.526299, 0, 0, 1, 1, 1,
-0.1730804, -0.07997856, -1.296787, 1, 0, 0, 1, 1,
-0.1710177, -0.2044312, -1.61964, 1, 0, 0, 1, 1,
-0.1680707, 0.3005487, -0.9138662, 1, 0, 0, 1, 1,
-0.1663042, 0.7479691, 1.660618, 1, 0, 0, 1, 1,
-0.1594666, -0.5270615, -3.352478, 1, 0, 0, 1, 1,
-0.1589, 0.9450606, 0.5767286, 0, 0, 0, 1, 1,
-0.1570166, 1.243858, -0.5563709, 0, 0, 0, 1, 1,
-0.1537128, -0.2009262, -3.1068, 0, 0, 0, 1, 1,
-0.1505609, -0.9476242, -2.421097, 0, 0, 0, 1, 1,
-0.1488678, -1.257412, -2.373429, 0, 0, 0, 1, 1,
-0.1480908, -0.5518444, -2.218862, 0, 0, 0, 1, 1,
-0.1410376, -1.076924, -2.768452, 0, 0, 0, 1, 1,
-0.1360666, -0.06442875, -0.539579, 1, 1, 1, 1, 1,
-0.1357056, -1.588855, -3.734023, 1, 1, 1, 1, 1,
-0.1352207, 0.08190238, -1.269379, 1, 1, 1, 1, 1,
-0.1340213, -0.5890149, -5.093398, 1, 1, 1, 1, 1,
-0.1336962, 0.5590863, -1.141312, 1, 1, 1, 1, 1,
-0.1326087, 0.8397091, 0.7673509, 1, 1, 1, 1, 1,
-0.1293184, 0.02520318, -0.4514263, 1, 1, 1, 1, 1,
-0.1280859, -0.8432636, -4.384346, 1, 1, 1, 1, 1,
-0.125154, -1.090411, -3.064879, 1, 1, 1, 1, 1,
-0.1231213, -0.9999276, -2.722771, 1, 1, 1, 1, 1,
-0.1167348, 1.124046, -0.1692922, 1, 1, 1, 1, 1,
-0.1164436, -1.214895, -1.773525, 1, 1, 1, 1, 1,
-0.1161848, -0.01702997, -0.2418433, 1, 1, 1, 1, 1,
-0.1131972, 0.3912646, -0.4942667, 1, 1, 1, 1, 1,
-0.1131703, -0.4046257, -3.686287, 1, 1, 1, 1, 1,
-0.1108827, -0.03859022, -1.70148, 0, 0, 1, 1, 1,
-0.1100443, 0.7940456, -0.5086131, 1, 0, 0, 1, 1,
-0.1040595, -1.546257, -3.004843, 1, 0, 0, 1, 1,
-0.1009246, 0.4334292, -0.8055317, 1, 0, 0, 1, 1,
-0.1008685, 0.3689533, 1.117678, 1, 0, 0, 1, 1,
-0.09730992, -2.183561, -4.483918, 1, 0, 0, 1, 1,
-0.09723037, 1.81454, -0.5440245, 0, 0, 0, 1, 1,
-0.09678341, 2.185134, -0.4225152, 0, 0, 0, 1, 1,
-0.0951148, 2.325973, 0.075064, 0, 0, 0, 1, 1,
-0.09226308, 1.267995, -0.1486033, 0, 0, 0, 1, 1,
-0.091559, -1.055927, -3.92153, 0, 0, 0, 1, 1,
-0.0873104, 0.1313247, -2.113311, 0, 0, 0, 1, 1,
-0.0858895, 0.2417064, -2.338289, 0, 0, 0, 1, 1,
-0.08166715, 0.5193086, -1.235837, 1, 1, 1, 1, 1,
-0.07544944, 0.3543127, 1.005246, 1, 1, 1, 1, 1,
-0.06756397, 1.441991, 0.2705351, 1, 1, 1, 1, 1,
-0.06557986, -0.8774477, -3.10905, 1, 1, 1, 1, 1,
-0.06481632, 0.9877976, 0.5755508, 1, 1, 1, 1, 1,
-0.06153154, -0.2819229, -2.223686, 1, 1, 1, 1, 1,
-0.06145439, -0.9758743, -2.823396, 1, 1, 1, 1, 1,
-0.05428595, -0.5659053, -2.550112, 1, 1, 1, 1, 1,
-0.05373998, -0.0724591, -2.100032, 1, 1, 1, 1, 1,
-0.05274974, 1.406011, 0.2522654, 1, 1, 1, 1, 1,
-0.05257023, 0.1566566, 1.650993, 1, 1, 1, 1, 1,
-0.05160619, -0.5565488, -2.805722, 1, 1, 1, 1, 1,
-0.04557516, -0.3219444, -2.417201, 1, 1, 1, 1, 1,
-0.0410202, -0.5220661, -1.429389, 1, 1, 1, 1, 1,
-0.03841623, 0.4391526, -0.3105969, 1, 1, 1, 1, 1,
-0.03568238, 1.489017, -0.1963547, 0, 0, 1, 1, 1,
-0.03105419, 1.862307, 0.8188695, 1, 0, 0, 1, 1,
-0.0249325, 1.045951, -0.156723, 1, 0, 0, 1, 1,
-0.02152199, -1.40217, -4.094705, 1, 0, 0, 1, 1,
-0.01733135, -1.539157, -4.595549, 1, 0, 0, 1, 1,
-0.01498296, -0.5714073, -4.004387, 1, 0, 0, 1, 1,
-0.007977335, -1.514209, -2.004071, 0, 0, 0, 1, 1,
-0.003762513, 0.5561863, 1.186258, 0, 0, 0, 1, 1,
-0.001950498, 0.06394739, 0.926784, 0, 0, 0, 1, 1,
-0.001914094, 1.097242, 0.4029651, 0, 0, 0, 1, 1,
5.061019e-05, -1.986283, 2.365266, 0, 0, 0, 1, 1,
0.004050453, -1.417632, 2.759105, 0, 0, 0, 1, 1,
0.004396123, 0.4994442, -0.2304979, 0, 0, 0, 1, 1,
0.007985207, 0.3566392, 2.933975, 1, 1, 1, 1, 1,
0.00863248, 1.256688, 0.7829068, 1, 1, 1, 1, 1,
0.01272449, 1.870882, 0.1399016, 1, 1, 1, 1, 1,
0.01496211, -0.4575285, 1.214559, 1, 1, 1, 1, 1,
0.01659829, 0.3369947, 0.8593663, 1, 1, 1, 1, 1,
0.0201572, -0.07339893, 2.419898, 1, 1, 1, 1, 1,
0.02091416, -0.2067921, 2.202403, 1, 1, 1, 1, 1,
0.02143269, 0.09014612, 1.258458, 1, 1, 1, 1, 1,
0.02564753, 0.1576786, 1.448362, 1, 1, 1, 1, 1,
0.03045935, 1.183273, 0.2148748, 1, 1, 1, 1, 1,
0.03140889, -1.102502, 2.948683, 1, 1, 1, 1, 1,
0.03162659, -0.4548016, 2.24562, 1, 1, 1, 1, 1,
0.03460282, -0.5611095, 0.79241, 1, 1, 1, 1, 1,
0.04348015, 0.2197573, 0.01155341, 1, 1, 1, 1, 1,
0.04453307, 0.7834545, -0.3988464, 1, 1, 1, 1, 1,
0.04526327, -0.8087391, 2.373354, 0, 0, 1, 1, 1,
0.0470558, -0.6660698, 2.326933, 1, 0, 0, 1, 1,
0.04923522, 0.3028168, 0.4964564, 1, 0, 0, 1, 1,
0.05041834, -0.01651518, 1.33925, 1, 0, 0, 1, 1,
0.05395163, 0.5948644, 2.374197, 1, 0, 0, 1, 1,
0.05588288, 0.5912713, 0.1060462, 1, 0, 0, 1, 1,
0.05619363, 0.7608426, 0.5320804, 0, 0, 0, 1, 1,
0.06019266, -0.3518535, 2.576594, 0, 0, 0, 1, 1,
0.06019768, -1.051306, 2.762985, 0, 0, 0, 1, 1,
0.06076369, 1.49439, 0.4216228, 0, 0, 0, 1, 1,
0.06559955, -0.3324359, 2.047741, 0, 0, 0, 1, 1,
0.07245949, 0.7931076, 1.627095, 0, 0, 0, 1, 1,
0.07287042, -1.488346, 2.102203, 0, 0, 0, 1, 1,
0.07293481, 0.2410779, -1.274735, 1, 1, 1, 1, 1,
0.07661092, 0.1015675, -0.3067049, 1, 1, 1, 1, 1,
0.0821081, -1.582955, 4.116851, 1, 1, 1, 1, 1,
0.08298401, 0.5016941, 1.077219, 1, 1, 1, 1, 1,
0.08736724, -0.03912072, 1.114693, 1, 1, 1, 1, 1,
0.08870624, -0.3968732, 3.342505, 1, 1, 1, 1, 1,
0.09187684, -1.749944, 1.4116, 1, 1, 1, 1, 1,
0.0942058, 1.154072, -0.1542286, 1, 1, 1, 1, 1,
0.09783018, -0.3699404, 3.54374, 1, 1, 1, 1, 1,
0.1026468, 0.4995818, 1.441184, 1, 1, 1, 1, 1,
0.1049769, 0.7916253, 0.6203317, 1, 1, 1, 1, 1,
0.1072412, 1.727658, -0.5641737, 1, 1, 1, 1, 1,
0.113567, 1.243216, 0.9961331, 1, 1, 1, 1, 1,
0.1137812, -0.9228169, 2.89171, 1, 1, 1, 1, 1,
0.1188904, 0.6441781, -1.807112, 1, 1, 1, 1, 1,
0.1223767, 0.3728201, 0.5430854, 0, 0, 1, 1, 1,
0.1257864, 0.6757108, -0.1039283, 1, 0, 0, 1, 1,
0.1274473, 0.4631967, 0.5541589, 1, 0, 0, 1, 1,
0.1359564, 0.3911286, 0.2358746, 1, 0, 0, 1, 1,
0.1366804, 0.3190153, 0.1573774, 1, 0, 0, 1, 1,
0.1376154, 0.4262421, 0.5006967, 1, 0, 0, 1, 1,
0.1382091, -0.6783563, 2.736369, 0, 0, 0, 1, 1,
0.1389531, 0.5028857, 0.6193569, 0, 0, 0, 1, 1,
0.1392271, 0.4434187, -1.032096, 0, 0, 0, 1, 1,
0.1400592, 0.4914775, -0.9800162, 0, 0, 0, 1, 1,
0.1404386, 0.5385752, 0.2094284, 0, 0, 0, 1, 1,
0.1462523, 0.5848443, 0.7060585, 0, 0, 0, 1, 1,
0.1535456, -0.712825, 3.353737, 0, 0, 0, 1, 1,
0.1557831, -0.6980415, 2.50213, 1, 1, 1, 1, 1,
0.1605476, 0.8411258, -0.3011063, 1, 1, 1, 1, 1,
0.1608923, -0.2433781, 1.187395, 1, 1, 1, 1, 1,
0.1639771, -0.87273, 3.951232, 1, 1, 1, 1, 1,
0.1657639, 0.008901691, 0.8818776, 1, 1, 1, 1, 1,
0.1684282, -0.09040641, 2.281904, 1, 1, 1, 1, 1,
0.170661, -0.1293585, -0.5115492, 1, 1, 1, 1, 1,
0.1728864, 1.009797, -0.6319517, 1, 1, 1, 1, 1,
0.1751157, -0.6122518, 2.362661, 1, 1, 1, 1, 1,
0.1758522, -0.9352229, 3.324857, 1, 1, 1, 1, 1,
0.1776814, 0.6875844, 0.6050673, 1, 1, 1, 1, 1,
0.1825753, -0.7040785, 3.092215, 1, 1, 1, 1, 1,
0.1870892, -0.02789624, 1.643325, 1, 1, 1, 1, 1,
0.1875567, 2.34236, -0.7291512, 1, 1, 1, 1, 1,
0.1924967, -0.4384742, 3.900969, 1, 1, 1, 1, 1,
0.1930265, -0.06354781, 2.240463, 0, 0, 1, 1, 1,
0.1958717, 1.687584, 1.97236, 1, 0, 0, 1, 1,
0.2112219, -1.201843, 3.369375, 1, 0, 0, 1, 1,
0.2112876, 1.410114, -1.326976, 1, 0, 0, 1, 1,
0.2129599, 0.2575681, 1.466455, 1, 0, 0, 1, 1,
0.2165966, -0.2735494, 3.58036, 1, 0, 0, 1, 1,
0.218987, -0.1205781, 2.803952, 0, 0, 0, 1, 1,
0.2208768, -0.3873814, 1.262505, 0, 0, 0, 1, 1,
0.2211556, -1.166517, 2.526869, 0, 0, 0, 1, 1,
0.2216343, 0.8023531, -0.06824311, 0, 0, 0, 1, 1,
0.2221339, 0.003189886, 1.087682, 0, 0, 0, 1, 1,
0.222159, 0.4893882, 0.4837764, 0, 0, 0, 1, 1,
0.2221911, -0.006592688, 1.007031, 0, 0, 0, 1, 1,
0.2241375, -0.3267013, 3.15528, 1, 1, 1, 1, 1,
0.2246006, 0.1381375, 1.101146, 1, 1, 1, 1, 1,
0.2258894, 0.7180384, -1.477938, 1, 1, 1, 1, 1,
0.227812, 0.4407176, 1.026249, 1, 1, 1, 1, 1,
0.2284686, 0.9979312, -0.05009923, 1, 1, 1, 1, 1,
0.2297371, -0.06738489, 1.094684, 1, 1, 1, 1, 1,
0.2302946, 0.5936261, 1.616632, 1, 1, 1, 1, 1,
0.2304577, 0.2068937, 0.6832135, 1, 1, 1, 1, 1,
0.2304581, -0.729297, 3.568654, 1, 1, 1, 1, 1,
0.2337986, 0.590412, 0.315984, 1, 1, 1, 1, 1,
0.2339365, -0.09942389, 3.827369, 1, 1, 1, 1, 1,
0.2373181, 1.593251, -0.566282, 1, 1, 1, 1, 1,
0.2386792, -1.850317, 3.870958, 1, 1, 1, 1, 1,
0.2402446, 0.7174149, 0.05302546, 1, 1, 1, 1, 1,
0.2414187, -1.007389, 2.636033, 1, 1, 1, 1, 1,
0.2422555, -2.402904, 3.155562, 0, 0, 1, 1, 1,
0.2453528, -1.156317, 3.73014, 1, 0, 0, 1, 1,
0.2474162, 0.5414076, 0.7380623, 1, 0, 0, 1, 1,
0.2483401, 0.3269722, 0.1589424, 1, 0, 0, 1, 1,
0.2498069, 1.792333, 0.2757833, 1, 0, 0, 1, 1,
0.2589147, -1.388813, 2.607929, 1, 0, 0, 1, 1,
0.2600604, -1.008707, 3.31952, 0, 0, 0, 1, 1,
0.2641601, -1.405935, 2.53907, 0, 0, 0, 1, 1,
0.2666166, -1.995305, 1.97941, 0, 0, 0, 1, 1,
0.2771218, -0.5143026, 3.137789, 0, 0, 0, 1, 1,
0.2795636, -0.8234956, 4.175129, 0, 0, 0, 1, 1,
0.2804312, -0.08966075, 1.419713, 0, 0, 0, 1, 1,
0.2820019, -0.1624334, 0.7466803, 0, 0, 0, 1, 1,
0.2821188, -1.727918, 3.347729, 1, 1, 1, 1, 1,
0.285748, 0.8321166, 0.9952698, 1, 1, 1, 1, 1,
0.2945099, 0.9015605, 0.8896759, 1, 1, 1, 1, 1,
0.2948427, 1.149099, 0.5759841, 1, 1, 1, 1, 1,
0.2964506, 0.9263378, 1.428974, 1, 1, 1, 1, 1,
0.2966727, -0.05006282, 1.335953, 1, 1, 1, 1, 1,
0.2971171, 0.3137764, 0.04260933, 1, 1, 1, 1, 1,
0.30275, -1.233728, 3.032637, 1, 1, 1, 1, 1,
0.3040847, 0.3156224, 0.1615866, 1, 1, 1, 1, 1,
0.3066633, 1.057195, 1.657079, 1, 1, 1, 1, 1,
0.3068449, 2.222578, 0.09402258, 1, 1, 1, 1, 1,
0.3109291, -1.843215, 3.393076, 1, 1, 1, 1, 1,
0.3114876, -0.6712582, 2.843338, 1, 1, 1, 1, 1,
0.3117042, 0.4578703, 0.7725847, 1, 1, 1, 1, 1,
0.3169776, -0.1474812, 0.9967962, 1, 1, 1, 1, 1,
0.3198296, -0.3060868, 0.4411917, 0, 0, 1, 1, 1,
0.3203228, 0.154895, -1.51813, 1, 0, 0, 1, 1,
0.3237814, -1.158593, 2.308809, 1, 0, 0, 1, 1,
0.3257952, -1.661921, 3.79211, 1, 0, 0, 1, 1,
0.3264868, 1.523465, 0.01668068, 1, 0, 0, 1, 1,
0.3276885, -0.6927765, 3.324088, 1, 0, 0, 1, 1,
0.3307428, 0.6265488, 0.5674755, 0, 0, 0, 1, 1,
0.3364267, 0.8260049, 0.9937574, 0, 0, 0, 1, 1,
0.3394183, 0.164017, 0.9998326, 0, 0, 0, 1, 1,
0.3408982, 0.9158853, 1.090809, 0, 0, 0, 1, 1,
0.3441848, 1.412267, 0.5596706, 0, 0, 0, 1, 1,
0.3459992, 0.7224893, 0.6578766, 0, 0, 0, 1, 1,
0.347531, 0.5902582, 0.7543401, 0, 0, 0, 1, 1,
0.3490643, 0.1597789, 3.171628, 1, 1, 1, 1, 1,
0.3499742, -0.5357044, 2.988247, 1, 1, 1, 1, 1,
0.350857, -0.06239906, 1.494935, 1, 1, 1, 1, 1,
0.3618279, 0.8744029, -0.4638102, 1, 1, 1, 1, 1,
0.3636206, -0.3714781, 1.782839, 1, 1, 1, 1, 1,
0.3645252, -0.3789636, 2.337013, 1, 1, 1, 1, 1,
0.3706469, 1.660797, -0.7512856, 1, 1, 1, 1, 1,
0.3768573, -1.271099, 4.781247, 1, 1, 1, 1, 1,
0.3783776, -0.3313712, 3.473577, 1, 1, 1, 1, 1,
0.3818764, -0.5074999, 1.437006, 1, 1, 1, 1, 1,
0.3866132, -0.4505738, 1.657359, 1, 1, 1, 1, 1,
0.3912604, 0.0055, -0.4618018, 1, 1, 1, 1, 1,
0.3912747, -0.8699835, 4.747256, 1, 1, 1, 1, 1,
0.3917189, 0.9576902, -0.1951767, 1, 1, 1, 1, 1,
0.3967279, 1.181217, -1.317321, 1, 1, 1, 1, 1,
0.3980174, -0.9736778, 2.908233, 0, 0, 1, 1, 1,
0.4086777, -0.6928107, 2.902062, 1, 0, 0, 1, 1,
0.410876, -0.9212132, 2.784289, 1, 0, 0, 1, 1,
0.4180836, -1.782606, 4.834643, 1, 0, 0, 1, 1,
0.4210213, -1.618031, 3.480525, 1, 0, 0, 1, 1,
0.4247374, 0.05719889, 1.342095, 1, 0, 0, 1, 1,
0.4250416, 0.0202613, 1.774318, 0, 0, 0, 1, 1,
0.4266093, -0.185081, 3.51134, 0, 0, 0, 1, 1,
0.4278694, -0.8940694, 2.729623, 0, 0, 0, 1, 1,
0.4296447, 0.4414759, 1.423504, 0, 0, 0, 1, 1,
0.4302586, 0.8295283, 1.122243, 0, 0, 0, 1, 1,
0.4305688, -0.6116008, 4.795735, 0, 0, 0, 1, 1,
0.4343812, -0.1704892, 1.335776, 0, 0, 0, 1, 1,
0.4347342, 0.8778855, 1.635753, 1, 1, 1, 1, 1,
0.4351904, -0.6192325, 4.299979, 1, 1, 1, 1, 1,
0.4476228, 0.7885742, -0.8253453, 1, 1, 1, 1, 1,
0.4522925, 0.2706748, 1.595563, 1, 1, 1, 1, 1,
0.4527116, -1.795716, 3.732532, 1, 1, 1, 1, 1,
0.4537931, -0.279459, 2.887745, 1, 1, 1, 1, 1,
0.4594176, -0.738478, 2.315692, 1, 1, 1, 1, 1,
0.4617572, 0.564539, 2.031258, 1, 1, 1, 1, 1,
0.4684475, -0.4449777, 2.793283, 1, 1, 1, 1, 1,
0.4723202, 0.1608028, 0.8358879, 1, 1, 1, 1, 1,
0.4772987, 0.4376586, -0.078982, 1, 1, 1, 1, 1,
0.4787385, 1.587696, 0.3075943, 1, 1, 1, 1, 1,
0.4874728, 1.76588, 0.280264, 1, 1, 1, 1, 1,
0.4877719, 0.5801758, 0.5350711, 1, 1, 1, 1, 1,
0.4911426, 1.843082, -1.274509, 1, 1, 1, 1, 1,
0.4918098, 1.415601, -0.07519254, 0, 0, 1, 1, 1,
0.4926507, 0.06896342, 1.594622, 1, 0, 0, 1, 1,
0.4951417, -0.1115456, -0.1730279, 1, 0, 0, 1, 1,
0.4973813, 0.3969326, 0.7670128, 1, 0, 0, 1, 1,
0.4989022, 0.6273541, -0.2476556, 1, 0, 0, 1, 1,
0.5026503, -0.4415004, 2.127244, 1, 0, 0, 1, 1,
0.5027825, -0.2199309, 3.018432, 0, 0, 0, 1, 1,
0.5048851, 0.9969039, 1.052339, 0, 0, 0, 1, 1,
0.5117581, 0.1969638, 1.457886, 0, 0, 0, 1, 1,
0.5121639, 0.04963477, 2.819321, 0, 0, 0, 1, 1,
0.513481, -0.2657412, 1.35961, 0, 0, 0, 1, 1,
0.5136644, 0.6775243, -0.09883564, 0, 0, 0, 1, 1,
0.5145879, 1.910385, 1.30296, 0, 0, 0, 1, 1,
0.516768, -1.631521, 2.270517, 1, 1, 1, 1, 1,
0.5178768, -0.0350709, 1.63666, 1, 1, 1, 1, 1,
0.5221677, 0.0928069, 1.906386, 1, 1, 1, 1, 1,
0.522289, -0.5853308, 1.285636, 1, 1, 1, 1, 1,
0.5246559, 0.3901176, 1.519093, 1, 1, 1, 1, 1,
0.5247484, 0.9027159, 0.7072971, 1, 1, 1, 1, 1,
0.5261827, -0.50398, 2.27312, 1, 1, 1, 1, 1,
0.5280377, 0.8854362, 1.150662, 1, 1, 1, 1, 1,
0.5302847, -0.6115638, 4.400398, 1, 1, 1, 1, 1,
0.5361462, -1.321853, 3.343643, 1, 1, 1, 1, 1,
0.5363756, 1.636086, 0.5157846, 1, 1, 1, 1, 1,
0.5403866, -1.586986, 1.700885, 1, 1, 1, 1, 1,
0.5406054, 1.377415, 0.7982143, 1, 1, 1, 1, 1,
0.5412359, -1.295469, 0.9750194, 1, 1, 1, 1, 1,
0.5420666, 1.00456, 1.764369, 1, 1, 1, 1, 1,
0.5431951, -0.5288458, 2.704018, 0, 0, 1, 1, 1,
0.5459611, 0.07385505, 2.419992, 1, 0, 0, 1, 1,
0.5476568, -0.8807799, 2.768631, 1, 0, 0, 1, 1,
0.5514559, 1.222597, 0.7435783, 1, 0, 0, 1, 1,
0.553189, 2.486412, 0.2669645, 1, 0, 0, 1, 1,
0.5585922, 1.297671, -1.986603, 1, 0, 0, 1, 1,
0.5598142, 1.372427, 0.8651942, 0, 0, 0, 1, 1,
0.5610269, -1.169593, 3.364293, 0, 0, 0, 1, 1,
0.5620667, 1.516167, 1.473225, 0, 0, 0, 1, 1,
0.5701981, -1.790576, 2.034526, 0, 0, 0, 1, 1,
0.5712562, 0.5203152, -0.2794603, 0, 0, 0, 1, 1,
0.5744652, -0.2028058, 2.205516, 0, 0, 0, 1, 1,
0.5744834, 0.9504209, 0.599488, 0, 0, 0, 1, 1,
0.5783975, 0.6804098, 0.9618656, 1, 1, 1, 1, 1,
0.5785769, -1.994828, 2.72735, 1, 1, 1, 1, 1,
0.579392, -0.4293168, 0.370012, 1, 1, 1, 1, 1,
0.5802143, -1.086487, 3.344869, 1, 1, 1, 1, 1,
0.5849519, 0.5759605, -0.2237809, 1, 1, 1, 1, 1,
0.5858343, 0.4749014, 2.401098, 1, 1, 1, 1, 1,
0.5888246, -1.270401, 3.719316, 1, 1, 1, 1, 1,
0.5891665, -0.7076255, 3.037345, 1, 1, 1, 1, 1,
0.5922878, -0.3198136, 3.572181, 1, 1, 1, 1, 1,
0.5938046, 0.5444399, -0.1576883, 1, 1, 1, 1, 1,
0.5959795, -0.4507783, 3.644324, 1, 1, 1, 1, 1,
0.5960078, -0.0286915, 1.038044, 1, 1, 1, 1, 1,
0.600397, 0.06187638, 0.635393, 1, 1, 1, 1, 1,
0.6013713, -1.309537, 1.213841, 1, 1, 1, 1, 1,
0.6018794, 0.7941764, -0.07064652, 1, 1, 1, 1, 1,
0.6035379, 0.1940557, 1.972254, 0, 0, 1, 1, 1,
0.6098312, 0.6413883, -0.2072587, 1, 0, 0, 1, 1,
0.6126471, -0.5817065, 1.412832, 1, 0, 0, 1, 1,
0.6130936, 0.4855284, -0.2927972, 1, 0, 0, 1, 1,
0.623323, -0.2359135, 2.41639, 1, 0, 0, 1, 1,
0.6322913, 0.8638687, 0.1657882, 1, 0, 0, 1, 1,
0.6438117, -0.7024292, 2.645203, 0, 0, 0, 1, 1,
0.6514426, 1.78974, 1.556555, 0, 0, 0, 1, 1,
0.6523113, -0.5167409, -0.08576623, 0, 0, 0, 1, 1,
0.6529852, 1.374148, 1.264971, 0, 0, 0, 1, 1,
0.6533009, 0.9468567, -1.004929, 0, 0, 0, 1, 1,
0.6581423, -0.4160949, 1.539428, 0, 0, 0, 1, 1,
0.6585249, -1.128949, 2.911241, 0, 0, 0, 1, 1,
0.6611465, 0.07329899, 1.4888, 1, 1, 1, 1, 1,
0.6692945, 1.969058, 0.8377143, 1, 1, 1, 1, 1,
0.6716394, 0.8900447, 1.151886, 1, 1, 1, 1, 1,
0.674015, -0.4572706, 2.524068, 1, 1, 1, 1, 1,
0.6815794, -0.4343563, 2.28325, 1, 1, 1, 1, 1,
0.6849363, 0.1768732, -0.5384816, 1, 1, 1, 1, 1,
0.6860909, 0.9267077, 0.2385122, 1, 1, 1, 1, 1,
0.6925351, 0.988619, 1.133771, 1, 1, 1, 1, 1,
0.7000636, 0.9009205, -0.4439962, 1, 1, 1, 1, 1,
0.705995, -0.5178572, 2.306299, 1, 1, 1, 1, 1,
0.7251874, 1.281022, 0.9008717, 1, 1, 1, 1, 1,
0.7282699, 0.6618987, 2.859132, 1, 1, 1, 1, 1,
0.7324321, 0.5887352, 0.004181066, 1, 1, 1, 1, 1,
0.7395102, -1.030533, 2.205845, 1, 1, 1, 1, 1,
0.7398058, 1.400229, -1.184754, 1, 1, 1, 1, 1,
0.7415365, -0.1518905, 1.081713, 0, 0, 1, 1, 1,
0.7434419, 0.581561, 0.2185252, 1, 0, 0, 1, 1,
0.7435716, 1.25777, 0.1539069, 1, 0, 0, 1, 1,
0.7447115, 1.693504, -0.4747684, 1, 0, 0, 1, 1,
0.7465111, 0.5400036, 1.385329, 1, 0, 0, 1, 1,
0.7501729, 1.760281, 0.3981522, 1, 0, 0, 1, 1,
0.7597258, -0.8230655, 2.177977, 0, 0, 0, 1, 1,
0.7631637, -1.45391, 2.989268, 0, 0, 0, 1, 1,
0.7659201, -1.770878, 1.064948, 0, 0, 0, 1, 1,
0.7711343, 0.5331969, 1.561254, 0, 0, 0, 1, 1,
0.7802592, 1.52116, 0.8991368, 0, 0, 0, 1, 1,
0.7850944, -0.4485501, 1.769802, 0, 0, 0, 1, 1,
0.7858716, 1.273777, 0.9779685, 0, 0, 0, 1, 1,
0.7940674, 0.3694716, 0.4116912, 1, 1, 1, 1, 1,
0.7999486, 0.8088312, 2.456485, 1, 1, 1, 1, 1,
0.8025845, 0.4740069, 0.1376371, 1, 1, 1, 1, 1,
0.8046044, 0.07460633, 0.763463, 1, 1, 1, 1, 1,
0.806187, -0.9826695, 1.929303, 1, 1, 1, 1, 1,
0.8150686, 2.185088, -0.07198998, 1, 1, 1, 1, 1,
0.8220225, -0.6295065, 2.437535, 1, 1, 1, 1, 1,
0.8221984, -0.2977251, 2.539359, 1, 1, 1, 1, 1,
0.8229628, 0.5638853, 0.2384417, 1, 1, 1, 1, 1,
0.8285017, 1.223444, 0.9166552, 1, 1, 1, 1, 1,
0.8418492, 1.316552, 1.330895, 1, 1, 1, 1, 1,
0.8452431, 0.5676755, 2.123345, 1, 1, 1, 1, 1,
0.8456751, -0.1570821, 1.472292, 1, 1, 1, 1, 1,
0.8511136, 0.03497609, 0.2126584, 1, 1, 1, 1, 1,
0.8565022, 1.495011, -2.003553, 1, 1, 1, 1, 1,
0.8575788, 0.2187898, 1.008673, 0, 0, 1, 1, 1,
0.8655291, 2.123058, 0.4368829, 1, 0, 0, 1, 1,
0.8718444, -1.073718, 2.193694, 1, 0, 0, 1, 1,
0.8771168, -0.8162777, 2.834555, 1, 0, 0, 1, 1,
0.8777869, -1.006709, 2.43977, 1, 0, 0, 1, 1,
0.8791156, -1.459094, 1.996423, 1, 0, 0, 1, 1,
0.8837273, 0.4103775, 4.269956, 0, 0, 0, 1, 1,
0.8839173, 0.8057205, 1.777501, 0, 0, 0, 1, 1,
0.8839635, 1.238562, 0.6582972, 0, 0, 0, 1, 1,
0.9140475, -0.3350485, 2.105332, 0, 0, 0, 1, 1,
0.9203455, 0.1913806, -0.1317402, 0, 0, 0, 1, 1,
0.9211852, -0.6941447, 2.740485, 0, 0, 0, 1, 1,
0.9270247, -1.34155, 1.951755, 0, 0, 0, 1, 1,
0.9293201, -0.01769802, 0.8712104, 1, 1, 1, 1, 1,
0.9350079, -2.115306, 2.295785, 1, 1, 1, 1, 1,
0.9415411, -0.08504402, 2.505251, 1, 1, 1, 1, 1,
0.9439318, 1.526748, -0.8275225, 1, 1, 1, 1, 1,
0.9483906, 1.041004, -0.4945561, 1, 1, 1, 1, 1,
0.9485934, 0.5148683, 0.3787566, 1, 1, 1, 1, 1,
0.9488583, 0.2405144, 1.782563, 1, 1, 1, 1, 1,
0.9551457, 0.7440169, -0.06588949, 1, 1, 1, 1, 1,
0.9572951, -1.270159, 2.35568, 1, 1, 1, 1, 1,
0.957417, 1.27496, 0.6869665, 1, 1, 1, 1, 1,
0.9630443, 0.3071301, 3.524381, 1, 1, 1, 1, 1,
0.9727796, -2.402971, 2.210572, 1, 1, 1, 1, 1,
0.9776021, 0.4957776, 0.9111689, 1, 1, 1, 1, 1,
0.9794909, -0.6311424, 2.7636, 1, 1, 1, 1, 1,
0.9821627, 1.939725, 0.03804139, 1, 1, 1, 1, 1,
0.9829175, 0.6901525, 1.087795, 0, 0, 1, 1, 1,
0.9835414, -0.9805543, 2.000109, 1, 0, 0, 1, 1,
0.9930614, -1.292188, 2.179052, 1, 0, 0, 1, 1,
0.9977869, 0.4484869, 2.238693, 1, 0, 0, 1, 1,
0.9980132, 1.040151, 1.845896, 1, 0, 0, 1, 1,
1.000167, 0.03321684, 3.258948, 1, 0, 0, 1, 1,
1.003773, -0.2062699, 1.703214, 0, 0, 0, 1, 1,
1.009541, 1.164638, 1.213598, 0, 0, 0, 1, 1,
1.009701, -0.9250737, 1.964248, 0, 0, 0, 1, 1,
1.013844, -1.108363, 1.920159, 0, 0, 0, 1, 1,
1.014215, 0.07879479, 0.7503839, 0, 0, 0, 1, 1,
1.015372, -0.1286643, 2.163318, 0, 0, 0, 1, 1,
1.021503, 0.5202116, 0.5295715, 0, 0, 0, 1, 1,
1.021866, -0.7236359, 1.930798, 1, 1, 1, 1, 1,
1.022573, -0.02529985, 0.394659, 1, 1, 1, 1, 1,
1.022916, 0.05408428, 0.9792739, 1, 1, 1, 1, 1,
1.024531, -0.3122676, 2.626991, 1, 1, 1, 1, 1,
1.029469, -1.597015, 2.956608, 1, 1, 1, 1, 1,
1.04039, 0.577765, 0.7348246, 1, 1, 1, 1, 1,
1.054094, -0.0560234, 2.272552, 1, 1, 1, 1, 1,
1.054754, 0.5722536, 2.364961, 1, 1, 1, 1, 1,
1.054896, -0.5224835, 3.147212, 1, 1, 1, 1, 1,
1.066042, 1.499782, 1.329613, 1, 1, 1, 1, 1,
1.073418, -2.068723, 2.660041, 1, 1, 1, 1, 1,
1.07472, -0.5199812, 1.474327, 1, 1, 1, 1, 1,
1.076103, 0.4898872, -0.02002642, 1, 1, 1, 1, 1,
1.076934, -0.2415953, 0.5626535, 1, 1, 1, 1, 1,
1.079933, 0.2249475, 1.851737, 1, 1, 1, 1, 1,
1.08237, 1.512155, 1.61214, 0, 0, 1, 1, 1,
1.092244, 0.9921594, 1.754726, 1, 0, 0, 1, 1,
1.093171, -0.2597958, 3.948114, 1, 0, 0, 1, 1,
1.093306, 0.9513197, 0.5722434, 1, 0, 0, 1, 1,
1.099222, 0.1499382, 2.007973, 1, 0, 0, 1, 1,
1.103883, 0.4572714, 2.011713, 1, 0, 0, 1, 1,
1.106457, -1.056266, 2.407915, 0, 0, 0, 1, 1,
1.110599, -0.9736969, 2.475154, 0, 0, 0, 1, 1,
1.114805, 1.249176, 2.354868, 0, 0, 0, 1, 1,
1.116122, 0.8444936, -0.3693965, 0, 0, 0, 1, 1,
1.117133, 0.613678, 0.4973572, 0, 0, 0, 1, 1,
1.120301, 0.834033, -0.1645752, 0, 0, 0, 1, 1,
1.125525, 3.122348, 0.718798, 0, 0, 0, 1, 1,
1.135332, -0.9365747, 4.232705, 1, 1, 1, 1, 1,
1.137852, 0.1489291, 4.382084, 1, 1, 1, 1, 1,
1.145386, 0.1285543, 3.142966, 1, 1, 1, 1, 1,
1.146642, 0.1585249, 1.738995, 1, 1, 1, 1, 1,
1.150521, -1.800501, 2.812022, 1, 1, 1, 1, 1,
1.152824, -0.9712285, 1.384891, 1, 1, 1, 1, 1,
1.157762, -1.090508, 2.76983, 1, 1, 1, 1, 1,
1.158165, 1.468974, 1.309633, 1, 1, 1, 1, 1,
1.166186, -0.7683226, 2.425865, 1, 1, 1, 1, 1,
1.177248, -1.310399, 1.467756, 1, 1, 1, 1, 1,
1.179788, 0.1052625, -0.7267994, 1, 1, 1, 1, 1,
1.18582, 0.4970008, 1.027982, 1, 1, 1, 1, 1,
1.193888, 0.09873801, 2.009333, 1, 1, 1, 1, 1,
1.195264, -0.6900246, 2.596764, 1, 1, 1, 1, 1,
1.199771, -0.7111393, 3.54815, 1, 1, 1, 1, 1,
1.199792, 0.227728, 1.784446, 0, 0, 1, 1, 1,
1.201078, 1.002228, 0.3578885, 1, 0, 0, 1, 1,
1.202994, 0.4710768, 0.8735313, 1, 0, 0, 1, 1,
1.213252, 0.6928954, 1.961178, 1, 0, 0, 1, 1,
1.21404, 1.232127, 1.879365, 1, 0, 0, 1, 1,
1.216733, 0.566628, 1.745226, 1, 0, 0, 1, 1,
1.220861, 0.8012045, 3.043379, 0, 0, 0, 1, 1,
1.223398, 0.3126758, 2.340495, 0, 0, 0, 1, 1,
1.225653, 0.0216067, 0.7196902, 0, 0, 0, 1, 1,
1.225799, -0.2355191, 1.679359, 0, 0, 0, 1, 1,
1.226424, -0.2902743, 2.272357, 0, 0, 0, 1, 1,
1.233247, -0.2362971, 2.049109, 0, 0, 0, 1, 1,
1.236378, -1.466299, 2.367994, 0, 0, 0, 1, 1,
1.243822, 0.6370217, 1.097022, 1, 1, 1, 1, 1,
1.249108, -0.465284, 3.538543, 1, 1, 1, 1, 1,
1.254517, 1.399841, 2.72968, 1, 1, 1, 1, 1,
1.258276, 1.523667, 0.9042941, 1, 1, 1, 1, 1,
1.264398, -0.6830606, 0.9089021, 1, 1, 1, 1, 1,
1.265004, -0.842516, 1.613018, 1, 1, 1, 1, 1,
1.267267, -1.073893, 1.284889, 1, 1, 1, 1, 1,
1.285797, 1.329822, 1.47149, 1, 1, 1, 1, 1,
1.292481, -1.34163, 1.459231, 1, 1, 1, 1, 1,
1.311277, -0.3261067, 1.674563, 1, 1, 1, 1, 1,
1.326059, 0.4001053, 0.478898, 1, 1, 1, 1, 1,
1.329434, -0.895511, 2.389192, 1, 1, 1, 1, 1,
1.330206, -0.3865765, 1.750466, 1, 1, 1, 1, 1,
1.360765, -2.200228, 1.828857, 1, 1, 1, 1, 1,
1.369852, 0.609883, 1.474863, 1, 1, 1, 1, 1,
1.374959, -1.312563, 1.365693, 0, 0, 1, 1, 1,
1.375255, 0.5582375, -1.640915, 1, 0, 0, 1, 1,
1.377831, -0.07567164, 0.6829938, 1, 0, 0, 1, 1,
1.390951, -1.17602, 1.681126, 1, 0, 0, 1, 1,
1.417113, -0.1982926, 0.2799364, 1, 0, 0, 1, 1,
1.421823, 1.095862, -0.2892012, 1, 0, 0, 1, 1,
1.431201, 0.6431739, 1.487098, 0, 0, 0, 1, 1,
1.434116, -0.1832003, -0.1237896, 0, 0, 0, 1, 1,
1.439979, -0.9933842, 2.004868, 0, 0, 0, 1, 1,
1.446965, 0.8974139, 1.053426, 0, 0, 0, 1, 1,
1.450456, 0.8466553, 2.286052, 0, 0, 0, 1, 1,
1.453593, 1.383455, -0.5649105, 0, 0, 0, 1, 1,
1.457287, 0.2464753, 1.506856, 0, 0, 0, 1, 1,
1.464827, 1.188654, -0.2131597, 1, 1, 1, 1, 1,
1.471443, -1.033814, 3.434056, 1, 1, 1, 1, 1,
1.473244, 1.045013, 0.8511325, 1, 1, 1, 1, 1,
1.480259, 0.4625627, 0.1635407, 1, 1, 1, 1, 1,
1.481447, -0.4291679, 3.796941, 1, 1, 1, 1, 1,
1.48224, -0.9604233, 1.196563, 1, 1, 1, 1, 1,
1.484727, 0.7864103, 1.249913, 1, 1, 1, 1, 1,
1.490564, 1.902142, -0.01781733, 1, 1, 1, 1, 1,
1.499939, -2.221661, 2.233084, 1, 1, 1, 1, 1,
1.501563, -0.2828227, 1.876862, 1, 1, 1, 1, 1,
1.50457, -0.655269, 1.09052, 1, 1, 1, 1, 1,
1.506479, -0.7667842, 1.203267, 1, 1, 1, 1, 1,
1.50769, 0.6243255, 1.27268, 1, 1, 1, 1, 1,
1.52381, 0.6523077, 2.747077, 1, 1, 1, 1, 1,
1.529777, 0.1024633, 3.176369, 1, 1, 1, 1, 1,
1.533841, -0.2052241, 2.544786, 0, 0, 1, 1, 1,
1.535612, -0.3958908, 2.369071, 1, 0, 0, 1, 1,
1.556891, -0.01420128, 1.529919, 1, 0, 0, 1, 1,
1.565961, 0.2047095, 2.540017, 1, 0, 0, 1, 1,
1.571683, 0.4362932, 1.50827, 1, 0, 0, 1, 1,
1.582393, -1.634639, 0.5134496, 1, 0, 0, 1, 1,
1.583514, 0.3287427, -0.05126742, 0, 0, 0, 1, 1,
1.592829, -0.7275984, 1.50387, 0, 0, 0, 1, 1,
1.605717, 0.1248719, 3.721749, 0, 0, 0, 1, 1,
1.613112, 1.227736, -1.382339, 0, 0, 0, 1, 1,
1.616969, -0.4333539, 2.130922, 0, 0, 0, 1, 1,
1.640411, 1.307385, 0.3293349, 0, 0, 0, 1, 1,
1.643147, 0.007956298, 1.019477, 0, 0, 0, 1, 1,
1.64456, -1.250347, 0.09464556, 1, 1, 1, 1, 1,
1.652639, 1.104007, 2.220752, 1, 1, 1, 1, 1,
1.661856, 0.1275056, 1.072231, 1, 1, 1, 1, 1,
1.66778, 1.080032, 2.654381, 1, 1, 1, 1, 1,
1.683101, 0.75127, 0.1209927, 1, 1, 1, 1, 1,
1.687225, -1.677613, 3.077031, 1, 1, 1, 1, 1,
1.689494, 1.349829, 0.564984, 1, 1, 1, 1, 1,
1.717348, -0.9905186, 2.739017, 1, 1, 1, 1, 1,
1.731412, 0.4328764, 2.220784, 1, 1, 1, 1, 1,
1.736714, -1.560106, 4.275314, 1, 1, 1, 1, 1,
1.74836, 2.282964, 0.4583527, 1, 1, 1, 1, 1,
1.755037, 0.3160465, 0.3998616, 1, 1, 1, 1, 1,
1.764991, -0.4297955, 1.22267, 1, 1, 1, 1, 1,
1.765001, -0.896661, 1.435356, 1, 1, 1, 1, 1,
1.767544, 2.276288, -0.2723018, 1, 1, 1, 1, 1,
1.773534, -0.5661917, 1.162607, 0, 0, 1, 1, 1,
1.78776, 0.3011372, 2.539959, 1, 0, 0, 1, 1,
1.798708, 0.6074172, 1.706895, 1, 0, 0, 1, 1,
1.802116, -0.06626505, 1.799834, 1, 0, 0, 1, 1,
1.805827, 0.01273685, 2.107995, 1, 0, 0, 1, 1,
1.814646, 0.5602714, 0.8481706, 1, 0, 0, 1, 1,
1.821183, -0.7123736, 2.051369, 0, 0, 0, 1, 1,
1.828759, -1.028211, 4.333652, 0, 0, 0, 1, 1,
1.839705, -0.4106107, 2.069861, 0, 0, 0, 1, 1,
1.849525, -0.1283419, 2.022321, 0, 0, 0, 1, 1,
1.853026, -0.05747519, 1.786717, 0, 0, 0, 1, 1,
1.862289, -0.6756814, 1.235276, 0, 0, 0, 1, 1,
1.894336, 0.5974721, 1.499235, 0, 0, 0, 1, 1,
1.937052, -1.339478, 2.780021, 1, 1, 1, 1, 1,
1.938267, -0.4233225, 2.501859, 1, 1, 1, 1, 1,
1.947587, -0.7057657, 4.13981, 1, 1, 1, 1, 1,
1.959802, -0.4611561, 0.7579544, 1, 1, 1, 1, 1,
1.967522, -0.1051303, 1.32542, 1, 1, 1, 1, 1,
1.978164, 1.783941, 1.334047, 1, 1, 1, 1, 1,
1.984291, -0.2663753, 2.396975, 1, 1, 1, 1, 1,
2.004942, 0.1851122, 0.6690451, 1, 1, 1, 1, 1,
2.007915, 0.01319091, 1.962805, 1, 1, 1, 1, 1,
2.01626, -0.5301917, 1.212225, 1, 1, 1, 1, 1,
2.019943, -0.2815754, 3.397431, 1, 1, 1, 1, 1,
2.038463, 0.3032941, 1.456071, 1, 1, 1, 1, 1,
2.050175, -1.120582, 2.469402, 1, 1, 1, 1, 1,
2.054507, 0.2239492, 0.1274259, 1, 1, 1, 1, 1,
2.074811, -1.161606, 1.080009, 1, 1, 1, 1, 1,
2.076782, -0.04662269, 1.95506, 0, 0, 1, 1, 1,
2.099092, 1.083016, 2.377543, 1, 0, 0, 1, 1,
2.128816, 1.511616, 3.876188, 1, 0, 0, 1, 1,
2.131057, -0.1298921, 1.74022, 1, 0, 0, 1, 1,
2.135726, -0.2447399, 2.453935, 1, 0, 0, 1, 1,
2.181874, 0.4876492, 1.203338, 1, 0, 0, 1, 1,
2.190731, 0.3326569, -0.1290296, 0, 0, 0, 1, 1,
2.244743, -0.8957097, 0.8264986, 0, 0, 0, 1, 1,
2.30427, -1.140365, 2.567398, 0, 0, 0, 1, 1,
2.357581, -2.352525, 1.071329, 0, 0, 0, 1, 1,
2.376827, 0.558341, 0.251123, 0, 0, 0, 1, 1,
2.37919, -0.2183183, 0.1151784, 0, 0, 0, 1, 1,
2.3793, 1.001393, 1.951327, 0, 0, 0, 1, 1,
2.429357, 1.69771, 0.8909807, 1, 1, 1, 1, 1,
2.434725, 0.3950321, 2.758307, 1, 1, 1, 1, 1,
2.495192, 0.01113957, 1.692225, 1, 1, 1, 1, 1,
2.58016, 1.096849, 2.801651, 1, 1, 1, 1, 1,
2.602919, 0.07068036, 1.76225, 1, 1, 1, 1, 1,
2.619576, -0.09055124, 0.4576375, 1, 1, 1, 1, 1,
2.880678, -1.630698, 1.95662, 1, 1, 1, 1, 1
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
var radius = 9.325951;
var distance = 32.75701;
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
mvMatrix.translate( 0.09753823, 0.3547213, 0.1660614 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.75701);
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
