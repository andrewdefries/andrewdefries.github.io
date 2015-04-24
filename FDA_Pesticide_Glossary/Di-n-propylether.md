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
-3.255009, 0.09090008, -2.964049, 1, 0, 0, 1,
-3.087691, 0.2019681, -2.06344, 1, 0.007843138, 0, 1,
-2.846179, -1.390629, -2.901748, 1, 0.01176471, 0, 1,
-2.722069, -0.006435428, -1.487004, 1, 0.01960784, 0, 1,
-2.686771, -1.077351, -1.322594, 1, 0.02352941, 0, 1,
-2.636771, -0.3270499, -1.292042, 1, 0.03137255, 0, 1,
-2.625805, 1.11956, -1.989013, 1, 0.03529412, 0, 1,
-2.590057, 1.330138, -1.491917, 1, 0.04313726, 0, 1,
-2.54056, -0.4460173, -1.00037, 1, 0.04705882, 0, 1,
-2.517077, 0.004183794, -0.5220552, 1, 0.05490196, 0, 1,
-2.493164, -1.71847, -2.483421, 1, 0.05882353, 0, 1,
-2.442239, 0.03249203, -3.055242, 1, 0.06666667, 0, 1,
-2.415454, 0.4371342, -1.103943, 1, 0.07058824, 0, 1,
-2.397593, 0.6804824, -2.220865, 1, 0.07843138, 0, 1,
-2.32829, -0.1236149, -2.489507, 1, 0.08235294, 0, 1,
-2.287876, 0.04372101, -2.608307, 1, 0.09019608, 0, 1,
-2.279422, 0.769104, -1.939514, 1, 0.09411765, 0, 1,
-2.25492, 0.5142018, -2.263426, 1, 0.1019608, 0, 1,
-2.254033, -1.93912, -3.091213, 1, 0.1098039, 0, 1,
-2.203006, -0.7895259, -2.870672, 1, 0.1137255, 0, 1,
-2.189575, -1.193814, 0.6216925, 1, 0.1215686, 0, 1,
-2.183553, -1.802605, -2.00209, 1, 0.1254902, 0, 1,
-2.161221, -0.1080282, -2.632489, 1, 0.1333333, 0, 1,
-2.100878, -0.2178152, -0.5676831, 1, 0.1372549, 0, 1,
-2.074809, 1.254639, -1.569388, 1, 0.145098, 0, 1,
-2.066349, -1.271728, -2.715656, 1, 0.1490196, 0, 1,
-2.065911, -1.733204, -1.933775, 1, 0.1568628, 0, 1,
-2.041778, -0.4440561, -1.082818, 1, 0.1607843, 0, 1,
-2.007836, -0.5048687, -0.5900007, 1, 0.1686275, 0, 1,
-1.990121, -0.3192447, -1.152385, 1, 0.172549, 0, 1,
-1.981798, 0.8803562, -1.477856, 1, 0.1803922, 0, 1,
-1.980744, -0.595892, -1.978588, 1, 0.1843137, 0, 1,
-1.975973, -1.255509, -2.363224, 1, 0.1921569, 0, 1,
-1.972322, -0.6854442, -2.021015, 1, 0.1960784, 0, 1,
-1.968743, -0.03522777, -2.275385, 1, 0.2039216, 0, 1,
-1.943766, 0.3487294, -2.663099, 1, 0.2117647, 0, 1,
-1.94098, -1.332509, -1.841034, 1, 0.2156863, 0, 1,
-1.812916, -0.1714011, -1.45702, 1, 0.2235294, 0, 1,
-1.810406, 1.914879, -2.49534, 1, 0.227451, 0, 1,
-1.795417, 1.068798, -1.308211, 1, 0.2352941, 0, 1,
-1.78523, 0.2430691, -2.431893, 1, 0.2392157, 0, 1,
-1.781361, -2.785171, -3.173177, 1, 0.2470588, 0, 1,
-1.779065, 0.2219906, -0.3719272, 1, 0.2509804, 0, 1,
-1.752759, 1.206554, -1.50074, 1, 0.2588235, 0, 1,
-1.737847, 0.1034731, -1.655837, 1, 0.2627451, 0, 1,
-1.725979, -1.469562, -2.828899, 1, 0.2705882, 0, 1,
-1.720074, -0.4886135, -1.973453, 1, 0.2745098, 0, 1,
-1.716879, -0.3779109, -0.8614923, 1, 0.282353, 0, 1,
-1.71332, 0.9370909, -2.775266, 1, 0.2862745, 0, 1,
-1.706153, -0.5883898, -1.42048, 1, 0.2941177, 0, 1,
-1.70061, -1.103776, -2.597157, 1, 0.3019608, 0, 1,
-1.666507, 0.4512736, -0.02632694, 1, 0.3058824, 0, 1,
-1.657293, 0.217836, 1.050339, 1, 0.3137255, 0, 1,
-1.648429, -1.219745, -1.95971, 1, 0.3176471, 0, 1,
-1.642519, -0.3294604, -1.343455, 1, 0.3254902, 0, 1,
-1.640327, 0.3320363, -1.448889, 1, 0.3294118, 0, 1,
-1.628585, 0.3466833, -0.903268, 1, 0.3372549, 0, 1,
-1.61642, 0.4455348, -0.1255823, 1, 0.3411765, 0, 1,
-1.596078, 0.4938641, -1.907695, 1, 0.3490196, 0, 1,
-1.579893, -1.552326, -2.241242, 1, 0.3529412, 0, 1,
-1.571408, 1.207018, -0.9169781, 1, 0.3607843, 0, 1,
-1.567767, -0.2152104, -1.245517, 1, 0.3647059, 0, 1,
-1.567464, 1.974266, -0.5071136, 1, 0.372549, 0, 1,
-1.563655, 1.217761, -1.606071, 1, 0.3764706, 0, 1,
-1.552825, -0.06633303, -3.087909, 1, 0.3843137, 0, 1,
-1.546036, 0.6233238, -0.2152198, 1, 0.3882353, 0, 1,
-1.539551, -0.8505254, -2.800649, 1, 0.3960784, 0, 1,
-1.534448, -0.5077531, -2.124975, 1, 0.4039216, 0, 1,
-1.528592, 0.8126764, 0.7646431, 1, 0.4078431, 0, 1,
-1.523321, -0.7652281, -3.186983, 1, 0.4156863, 0, 1,
-1.522281, -0.4572717, -4.965984, 1, 0.4196078, 0, 1,
-1.514825, -0.1097539, -0.256446, 1, 0.427451, 0, 1,
-1.506955, -1.336086, -1.779023, 1, 0.4313726, 0, 1,
-1.503551, 1.092231, -1.561108, 1, 0.4392157, 0, 1,
-1.503318, -0.5127398, -4.436893, 1, 0.4431373, 0, 1,
-1.495059, -0.9338307, -1.285511, 1, 0.4509804, 0, 1,
-1.488823, 0.6444417, -2.224863, 1, 0.454902, 0, 1,
-1.470627, 0.4308656, 0.395859, 1, 0.4627451, 0, 1,
-1.464012, 0.8121028, -2.277635, 1, 0.4666667, 0, 1,
-1.458923, -0.03522627, -2.278574, 1, 0.4745098, 0, 1,
-1.447855, 0.4022399, -1.028699, 1, 0.4784314, 0, 1,
-1.445047, -1.147929, -3.728948, 1, 0.4862745, 0, 1,
-1.431121, -0.1755698, -1.560647, 1, 0.4901961, 0, 1,
-1.418628, -1.031844, -0.466904, 1, 0.4980392, 0, 1,
-1.406393, -1.184476, -2.345565, 1, 0.5058824, 0, 1,
-1.403902, -2.432929, -3.01166, 1, 0.509804, 0, 1,
-1.391642, -2.417752, -2.163143, 1, 0.5176471, 0, 1,
-1.383946, 1.611526, 0.06807063, 1, 0.5215687, 0, 1,
-1.379493, 0.2974827, -1.868041, 1, 0.5294118, 0, 1,
-1.368872, -2.499667, -4.132388, 1, 0.5333334, 0, 1,
-1.368695, -0.900519, -0.9705247, 1, 0.5411765, 0, 1,
-1.367682, 1.884407, 0.2650091, 1, 0.5450981, 0, 1,
-1.352164, 0.7554023, -1.936756, 1, 0.5529412, 0, 1,
-1.317459, 0.9680211, -1.895399, 1, 0.5568628, 0, 1,
-1.313547, 0.8051897, -0.2103988, 1, 0.5647059, 0, 1,
-1.313149, -0.607698, -1.560352, 1, 0.5686275, 0, 1,
-1.308981, 1.393086, -0.3898479, 1, 0.5764706, 0, 1,
-1.306126, 0.7773329, -1.563092, 1, 0.5803922, 0, 1,
-1.301766, 3.141291, 0.5299335, 1, 0.5882353, 0, 1,
-1.282834, 0.1015139, -0.7139811, 1, 0.5921569, 0, 1,
-1.281206, -1.511792, -1.940833, 1, 0.6, 0, 1,
-1.277968, 0.3059438, -1.294401, 1, 0.6078432, 0, 1,
-1.271392, -0.529494, -3.132946, 1, 0.6117647, 0, 1,
-1.266062, 0.2572179, -1.595153, 1, 0.6196079, 0, 1,
-1.264027, -0.9433666, -4.130643, 1, 0.6235294, 0, 1,
-1.252658, 0.6428397, -0.5076163, 1, 0.6313726, 0, 1,
-1.241045, -0.4646248, -3.61037, 1, 0.6352941, 0, 1,
-1.240494, -0.616461, -1.29921, 1, 0.6431373, 0, 1,
-1.239696, 0.1294575, -0.5838282, 1, 0.6470588, 0, 1,
-1.239394, 0.3945383, -1.050302, 1, 0.654902, 0, 1,
-1.228965, 0.8364164, -0.2239041, 1, 0.6588235, 0, 1,
-1.225424, -0.01104668, -1.187098, 1, 0.6666667, 0, 1,
-1.221714, -1.179676, 0.4877118, 1, 0.6705883, 0, 1,
-1.217375, -0.3429471, -1.235062, 1, 0.6784314, 0, 1,
-1.215641, 1.331799, -0.3611186, 1, 0.682353, 0, 1,
-1.213772, -0.2419129, -1.617368, 1, 0.6901961, 0, 1,
-1.213143, -0.7513136, -2.637325, 1, 0.6941177, 0, 1,
-1.208002, 1.366179, 0.2911462, 1, 0.7019608, 0, 1,
-1.195753, -0.4395957, 0.1454837, 1, 0.7098039, 0, 1,
-1.194498, -0.8718736, -2.140304, 1, 0.7137255, 0, 1,
-1.186842, -1.137753, -2.47098, 1, 0.7215686, 0, 1,
-1.184921, -0.4077733, -2.224507, 1, 0.7254902, 0, 1,
-1.182151, 0.7374655, -1.814382, 1, 0.7333333, 0, 1,
-1.181916, 0.3161596, -0.5491139, 1, 0.7372549, 0, 1,
-1.177421, 1.974167, -1.268364, 1, 0.7450981, 0, 1,
-1.163349, -0.7979701, -0.4628701, 1, 0.7490196, 0, 1,
-1.160946, -1.300714, -2.909293, 1, 0.7568628, 0, 1,
-1.160781, -1.287438, -2.35209, 1, 0.7607843, 0, 1,
-1.160135, 1.819786, -0.3256255, 1, 0.7686275, 0, 1,
-1.157086, -0.8795258, -3.917129, 1, 0.772549, 0, 1,
-1.153441, -0.2504023, -3.935215, 1, 0.7803922, 0, 1,
-1.145183, -1.437067, -3.060157, 1, 0.7843137, 0, 1,
-1.144412, -1.200452, -2.522258, 1, 0.7921569, 0, 1,
-1.144071, 0.6199628, -0.3733191, 1, 0.7960784, 0, 1,
-1.141003, -1.43086, -2.598615, 1, 0.8039216, 0, 1,
-1.138382, -0.3408467, -1.117601, 1, 0.8117647, 0, 1,
-1.133448, -0.9106899, -1.449182, 1, 0.8156863, 0, 1,
-1.110564, 1.273765, 1.0691, 1, 0.8235294, 0, 1,
-1.101862, -0.3540795, -1.197868, 1, 0.827451, 0, 1,
-1.098369, 0.2064341, -0.09386602, 1, 0.8352941, 0, 1,
-1.097809, 0.5822048, 0.7171187, 1, 0.8392157, 0, 1,
-1.096777, 1.191588, -2.804362, 1, 0.8470588, 0, 1,
-1.090715, -0.01073524, -2.392607, 1, 0.8509804, 0, 1,
-1.085741, -0.495704, -3.616836, 1, 0.8588235, 0, 1,
-1.082304, 0.2758137, -2.16819, 1, 0.8627451, 0, 1,
-1.078088, -0.1156703, -1.147483, 1, 0.8705882, 0, 1,
-1.068867, -0.6668317, -1.267579, 1, 0.8745098, 0, 1,
-1.052474, 0.688428, -2.427158, 1, 0.8823529, 0, 1,
-1.044671, 0.365107, -0.6563595, 1, 0.8862745, 0, 1,
-1.038187, -0.6522746, -2.685755, 1, 0.8941177, 0, 1,
-1.033434, 1.166134, 1.330507, 1, 0.8980392, 0, 1,
-1.032561, -0.5903739, -2.099385, 1, 0.9058824, 0, 1,
-1.026152, -1.050865, -2.247866, 1, 0.9137255, 0, 1,
-1.020463, -0.5293255, -2.248114, 1, 0.9176471, 0, 1,
-1.017501, 1.628209, -0.4432548, 1, 0.9254902, 0, 1,
-1.014618, 0.2189426, -2.482983, 1, 0.9294118, 0, 1,
-1.013383, 0.7494214, -1.777843, 1, 0.9372549, 0, 1,
-1.013253, 0.5903298, -0.6680397, 1, 0.9411765, 0, 1,
-1.012872, 1.221024, -0.2838983, 1, 0.9490196, 0, 1,
-1.01187, -1.249314, -0.1873369, 1, 0.9529412, 0, 1,
-0.9979339, -1.287863, -1.407818, 1, 0.9607843, 0, 1,
-0.9954816, 1.225941, -1.484014, 1, 0.9647059, 0, 1,
-0.9944225, -0.3181456, -1.263937, 1, 0.972549, 0, 1,
-0.9908053, -0.3942402, -2.06316, 1, 0.9764706, 0, 1,
-0.988484, -0.7094887, -3.238607, 1, 0.9843137, 0, 1,
-0.9854873, -0.9953298, -3.665136, 1, 0.9882353, 0, 1,
-0.9815009, -0.1365282, -2.141949, 1, 0.9960784, 0, 1,
-0.9810612, -0.07924367, -0.9922025, 0.9960784, 1, 0, 1,
-0.979821, -0.126981, -2.224795, 0.9921569, 1, 0, 1,
-0.9787262, 0.2326391, 0.3197676, 0.9843137, 1, 0, 1,
-0.9777977, 0.8525426, -0.07161126, 0.9803922, 1, 0, 1,
-0.9761032, -0.2078342, -2.906991, 0.972549, 1, 0, 1,
-0.9733998, -1.142257, -2.585611, 0.9686275, 1, 0, 1,
-0.9724973, 1.393693, 0.3467742, 0.9607843, 1, 0, 1,
-0.9619941, -0.4206119, -0.8437027, 0.9568627, 1, 0, 1,
-0.9484654, 0.04676899, -2.850489, 0.9490196, 1, 0, 1,
-0.94757, -0.7129372, -2.00912, 0.945098, 1, 0, 1,
-0.9441177, 0.3589825, -1.875341, 0.9372549, 1, 0, 1,
-0.9352567, -0.3174838, 0.6029699, 0.9333333, 1, 0, 1,
-0.9348688, -0.2645524, -1.392946, 0.9254902, 1, 0, 1,
-0.9347662, -1.251428, -0.9883828, 0.9215686, 1, 0, 1,
-0.9335108, -0.1272162, -1.365052, 0.9137255, 1, 0, 1,
-0.9330898, -0.2455598, -2.207462, 0.9098039, 1, 0, 1,
-0.9315646, -0.01434026, -1.576931, 0.9019608, 1, 0, 1,
-0.9295272, -1.030768, -1.562513, 0.8941177, 1, 0, 1,
-0.9227644, 0.6806548, -2.523455, 0.8901961, 1, 0, 1,
-0.915311, -0.8130017, -1.12191, 0.8823529, 1, 0, 1,
-0.9149249, 0.4608926, -2.520575, 0.8784314, 1, 0, 1,
-0.912357, -0.399324, -0.7890792, 0.8705882, 1, 0, 1,
-0.9090072, 1.319818, -0.6522448, 0.8666667, 1, 0, 1,
-0.9068485, -0.9028417, -2.722251, 0.8588235, 1, 0, 1,
-0.903682, -1.541529, -2.632634, 0.854902, 1, 0, 1,
-0.9033413, 0.5544063, 0.2314745, 0.8470588, 1, 0, 1,
-0.9026985, -2.12285, -3.133222, 0.8431373, 1, 0, 1,
-0.8955961, 1.660038, -0.356949, 0.8352941, 1, 0, 1,
-0.8949465, 0.002778234, -3.052246, 0.8313726, 1, 0, 1,
-0.8881787, 0.3222989, -1.957493, 0.8235294, 1, 0, 1,
-0.8846259, -0.6997356, -3.806896, 0.8196079, 1, 0, 1,
-0.884447, 0.140913, -1.800477, 0.8117647, 1, 0, 1,
-0.8794985, -0.9073789, -1.488758, 0.8078431, 1, 0, 1,
-0.8790308, 1.182769, -1.882202, 0.8, 1, 0, 1,
-0.873871, 0.3118978, 0.06767057, 0.7921569, 1, 0, 1,
-0.8686434, 2.040005, -1.29173, 0.7882353, 1, 0, 1,
-0.8684473, -0.8342692, -2.705686, 0.7803922, 1, 0, 1,
-0.867457, 0.8445475, -2.06601, 0.7764706, 1, 0, 1,
-0.8660942, -0.3690513, -3.297078, 0.7686275, 1, 0, 1,
-0.8659114, 0.4723397, 0.1664956, 0.7647059, 1, 0, 1,
-0.8596606, 1.285255, -1.388515, 0.7568628, 1, 0, 1,
-0.8584337, 1.646044, 0.9708343, 0.7529412, 1, 0, 1,
-0.8571459, -0.4334735, -1.880937, 0.7450981, 1, 0, 1,
-0.8571, 2.12009, -1.802371, 0.7411765, 1, 0, 1,
-0.8548183, -0.009445224, -1.753825, 0.7333333, 1, 0, 1,
-0.8499082, -1.133072, -5.085649, 0.7294118, 1, 0, 1,
-0.8446931, 0.3384956, -1.448721, 0.7215686, 1, 0, 1,
-0.8426705, 0.5001562, -1.511474, 0.7176471, 1, 0, 1,
-0.8394791, -0.847586, -2.590848, 0.7098039, 1, 0, 1,
-0.8364872, -0.7078065, -1.812258, 0.7058824, 1, 0, 1,
-0.8163304, 0.4121378, -0.4309051, 0.6980392, 1, 0, 1,
-0.8123766, 0.6072664, -0.5509663, 0.6901961, 1, 0, 1,
-0.807018, 0.8873999, -0.4512588, 0.6862745, 1, 0, 1,
-0.7961313, -2.246244, -3.632375, 0.6784314, 1, 0, 1,
-0.7917395, -1.889015, -3.105377, 0.6745098, 1, 0, 1,
-0.7895718, -0.5799428, -2.514182, 0.6666667, 1, 0, 1,
-0.7886617, 0.6369441, -0.7394819, 0.6627451, 1, 0, 1,
-0.7845666, -1.024435, -3.43233, 0.654902, 1, 0, 1,
-0.7806337, 0.09040073, 0.18252, 0.6509804, 1, 0, 1,
-0.7783049, 0.2953939, -0.978725, 0.6431373, 1, 0, 1,
-0.7782633, -1.136817, -1.866291, 0.6392157, 1, 0, 1,
-0.7759875, 0.3389364, -1.571847, 0.6313726, 1, 0, 1,
-0.7712963, -1.275962, -2.935457, 0.627451, 1, 0, 1,
-0.7684838, -0.2704965, -1.535086, 0.6196079, 1, 0, 1,
-0.7666261, 1.329554, -0.37115, 0.6156863, 1, 0, 1,
-0.7621056, 2.58476, 0.4855378, 0.6078432, 1, 0, 1,
-0.7606328, 0.8109164, -1.05206, 0.6039216, 1, 0, 1,
-0.7543613, 1.915285, 0.112441, 0.5960785, 1, 0, 1,
-0.7505802, -0.5032991, -1.89725, 0.5882353, 1, 0, 1,
-0.748242, -0.8643445, -2.891557, 0.5843138, 1, 0, 1,
-0.7458795, -0.9263738, -1.355962, 0.5764706, 1, 0, 1,
-0.7455354, -0.145741, -2.080793, 0.572549, 1, 0, 1,
-0.740554, -0.3012966, -1.926748, 0.5647059, 1, 0, 1,
-0.7394567, 1.198023, -0.4868464, 0.5607843, 1, 0, 1,
-0.7363864, -1.012539, -2.974363, 0.5529412, 1, 0, 1,
-0.7359146, 0.9387308, 1.486325, 0.5490196, 1, 0, 1,
-0.7346011, 0.2425547, -0.4508945, 0.5411765, 1, 0, 1,
-0.7333536, -2.410869, -2.552124, 0.5372549, 1, 0, 1,
-0.7188314, -0.9930035, -2.175444, 0.5294118, 1, 0, 1,
-0.7180522, -0.5633036, -3.076362, 0.5254902, 1, 0, 1,
-0.7094175, -0.9319831, -3.112538, 0.5176471, 1, 0, 1,
-0.7083806, -0.5288677, -2.610356, 0.5137255, 1, 0, 1,
-0.7076669, -0.462438, -0.6555555, 0.5058824, 1, 0, 1,
-0.7051492, 0.03914163, 0.03037686, 0.5019608, 1, 0, 1,
-0.7039638, -0.9005286, -2.956292, 0.4941176, 1, 0, 1,
-0.6934323, -0.3104874, -1.93669, 0.4862745, 1, 0, 1,
-0.6924621, -0.3055727, -2.506494, 0.4823529, 1, 0, 1,
-0.6888327, -0.2991876, -1.635245, 0.4745098, 1, 0, 1,
-0.6775554, -0.689331, -3.044312, 0.4705882, 1, 0, 1,
-0.6774568, -1.112455, -3.116887, 0.4627451, 1, 0, 1,
-0.6731529, 0.7025093, -1.979146, 0.4588235, 1, 0, 1,
-0.6692458, 0.9271719, -0.5201879, 0.4509804, 1, 0, 1,
-0.6652166, 2.631321, 1.393084, 0.4470588, 1, 0, 1,
-0.6641917, 0.2683842, -1.161502, 0.4392157, 1, 0, 1,
-0.6451718, 1.175021, 1.305366, 0.4352941, 1, 0, 1,
-0.6324157, 1.1361, -0.917133, 0.427451, 1, 0, 1,
-0.6281488, -0.415608, -3.936882, 0.4235294, 1, 0, 1,
-0.6233705, -1.282428, -1.738835, 0.4156863, 1, 0, 1,
-0.6224674, -0.05503353, -2.477295, 0.4117647, 1, 0, 1,
-0.6217824, 0.3832887, -1.688755, 0.4039216, 1, 0, 1,
-0.6214458, -1.588294, -1.615819, 0.3960784, 1, 0, 1,
-0.6209832, 1.229382, 0.2327696, 0.3921569, 1, 0, 1,
-0.6153696, 0.1315902, -2.527458, 0.3843137, 1, 0, 1,
-0.6108929, 0.5229206, -0.8391799, 0.3803922, 1, 0, 1,
-0.6103001, -1.456465, -3.128391, 0.372549, 1, 0, 1,
-0.6039475, -0.6434348, -1.551548, 0.3686275, 1, 0, 1,
-0.602594, 0.07709789, 0.1224377, 0.3607843, 1, 0, 1,
-0.6011107, -0.7273438, -2.599894, 0.3568628, 1, 0, 1,
-0.6005914, 1.5955, 0.8109471, 0.3490196, 1, 0, 1,
-0.6000265, -0.5271527, -0.9668544, 0.345098, 1, 0, 1,
-0.5997235, -1.446803, -1.028761, 0.3372549, 1, 0, 1,
-0.5970836, 0.2265209, -1.620205, 0.3333333, 1, 0, 1,
-0.5948983, 0.2515817, 0.8867565, 0.3254902, 1, 0, 1,
-0.5945148, 0.7266262, -0.3715456, 0.3215686, 1, 0, 1,
-0.5913153, -0.3140873, -2.201859, 0.3137255, 1, 0, 1,
-0.5882146, 1.399031, 0.9214264, 0.3098039, 1, 0, 1,
-0.5876831, -0.6081694, -2.909467, 0.3019608, 1, 0, 1,
-0.5826161, 1.397037, 1.093589, 0.2941177, 1, 0, 1,
-0.5804784, -0.9927956, -4.437591, 0.2901961, 1, 0, 1,
-0.579063, -0.1966124, -1.401159, 0.282353, 1, 0, 1,
-0.5781111, 0.05408815, -1.836161, 0.2784314, 1, 0, 1,
-0.5748348, 1.057325, -0.6045431, 0.2705882, 1, 0, 1,
-0.5634952, -1.568678, -3.274324, 0.2666667, 1, 0, 1,
-0.5627444, -0.2013171, -1.72904, 0.2588235, 1, 0, 1,
-0.5605476, 1.001059, -0.6022326, 0.254902, 1, 0, 1,
-0.5593642, -0.04684179, -2.221275, 0.2470588, 1, 0, 1,
-0.5591244, -0.5389227, -1.885863, 0.2431373, 1, 0, 1,
-0.5499452, 1.790427, -1.410772, 0.2352941, 1, 0, 1,
-0.5456186, -0.2647246, -0.9217489, 0.2313726, 1, 0, 1,
-0.5455298, -0.33608, -1.127455, 0.2235294, 1, 0, 1,
-0.5379916, 0.5555726, -1.622128, 0.2196078, 1, 0, 1,
-0.5343548, -0.1652899, -1.630662, 0.2117647, 1, 0, 1,
-0.5313376, -0.7406027, -2.820207, 0.2078431, 1, 0, 1,
-0.5274082, -1.530344, -3.895364, 0.2, 1, 0, 1,
-0.5249428, -0.5028113, -3.637586, 0.1921569, 1, 0, 1,
-0.5245101, -0.2502373, -1.333113, 0.1882353, 1, 0, 1,
-0.5230612, -0.3307523, -2.859383, 0.1803922, 1, 0, 1,
-0.5211929, 1.05821, 0.297182, 0.1764706, 1, 0, 1,
-0.5198097, 0.04164572, 0.2402205, 0.1686275, 1, 0, 1,
-0.5164357, -0.5628926, -3.267732, 0.1647059, 1, 0, 1,
-0.5125212, 1.082779, -1.003989, 0.1568628, 1, 0, 1,
-0.5063529, 1.123621, -0.3733865, 0.1529412, 1, 0, 1,
-0.5055076, 1.235066, -2.309291, 0.145098, 1, 0, 1,
-0.5029752, 2.415662, 0.6320635, 0.1411765, 1, 0, 1,
-0.5020674, -0.5411478, -3.512978, 0.1333333, 1, 0, 1,
-0.500612, -0.7245678, -2.062519, 0.1294118, 1, 0, 1,
-0.4995145, 1.383582, 0.4830512, 0.1215686, 1, 0, 1,
-0.4985284, -0.09608249, -2.297939, 0.1176471, 1, 0, 1,
-0.4976914, -0.9268553, -3.219765, 0.1098039, 1, 0, 1,
-0.4971386, -1.309845, -3.267379, 0.1058824, 1, 0, 1,
-0.4900522, 0.05675745, -1.113083, 0.09803922, 1, 0, 1,
-0.4895747, 0.5369467, 0.05180374, 0.09019608, 1, 0, 1,
-0.4869172, -0.1825333, -0.6306868, 0.08627451, 1, 0, 1,
-0.4866875, 0.1476317, -0.6220056, 0.07843138, 1, 0, 1,
-0.4862651, 0.5891268, 0.4153862, 0.07450981, 1, 0, 1,
-0.4806822, 0.9014817, 0.56025, 0.06666667, 1, 0, 1,
-0.4800817, -0.06780364, -1.288892, 0.0627451, 1, 0, 1,
-0.4796348, -0.3826578, -2.422861, 0.05490196, 1, 0, 1,
-0.4753195, -0.1417457, -1.527928, 0.05098039, 1, 0, 1,
-0.4642844, -2.171951, -1.998312, 0.04313726, 1, 0, 1,
-0.4631881, 0.4581535, -1.448297, 0.03921569, 1, 0, 1,
-0.4619359, 0.4321717, -1.032886, 0.03137255, 1, 0, 1,
-0.4575114, -0.4265719, -2.63399, 0.02745098, 1, 0, 1,
-0.4570099, 0.1525215, -0.9181776, 0.01960784, 1, 0, 1,
-0.4565214, 0.5776289, 0.6077766, 0.01568628, 1, 0, 1,
-0.4519138, -1.123315, -3.549664, 0.007843138, 1, 0, 1,
-0.4409142, 1.234642, 0.3539769, 0.003921569, 1, 0, 1,
-0.4388903, 0.1450254, -2.045101, 0, 1, 0.003921569, 1,
-0.4352341, 0.6979132, -1.789065, 0, 1, 0.01176471, 1,
-0.4320049, -0.3486757, -2.678599, 0, 1, 0.01568628, 1,
-0.4312713, -1.18896, -4.504329, 0, 1, 0.02352941, 1,
-0.4309076, -0.9684516, -3.451469, 0, 1, 0.02745098, 1,
-0.4259681, -0.7004328, -2.824448, 0, 1, 0.03529412, 1,
-0.423922, 0.5966021, -0.3827869, 0, 1, 0.03921569, 1,
-0.4217233, -1.893705, -2.691912, 0, 1, 0.04705882, 1,
-0.4215367, -1.908014, -1.066015, 0, 1, 0.05098039, 1,
-0.4200002, 0.1973467, -1.447272, 0, 1, 0.05882353, 1,
-0.418551, -0.6802028, -2.286762, 0, 1, 0.0627451, 1,
-0.4170534, 1.775997, -0.2604438, 0, 1, 0.07058824, 1,
-0.4152538, 0.4218796, -0.03001704, 0, 1, 0.07450981, 1,
-0.4137231, 0.09171689, -1.685985, 0, 1, 0.08235294, 1,
-0.4110433, 0.1075927, -1.666806, 0, 1, 0.08627451, 1,
-0.4099534, -1.267798, -3.073078, 0, 1, 0.09411765, 1,
-0.3974211, -0.1526697, -1.660012, 0, 1, 0.1019608, 1,
-0.3961126, 1.354225, 1.232378, 0, 1, 0.1058824, 1,
-0.393027, 0.1000172, -2.921799, 0, 1, 0.1137255, 1,
-0.3912204, -1.631011, -2.268629, 0, 1, 0.1176471, 1,
-0.3891799, 1.635219, -0.6732132, 0, 1, 0.1254902, 1,
-0.3872419, -1.401518, -2.076174, 0, 1, 0.1294118, 1,
-0.3842629, -0.1417999, -1.194558, 0, 1, 0.1372549, 1,
-0.3790194, -0.1738908, -2.202259, 0, 1, 0.1411765, 1,
-0.3753993, -1.562292, -3.279005, 0, 1, 0.1490196, 1,
-0.3740395, -0.5354179, -3.036201, 0, 1, 0.1529412, 1,
-0.3718813, -1.093949, -3.281073, 0, 1, 0.1607843, 1,
-0.3650913, -1.040316, -3.376213, 0, 1, 0.1647059, 1,
-0.3633801, 0.6964988, -0.1275509, 0, 1, 0.172549, 1,
-0.3633429, 0.5117421, -0.02932133, 0, 1, 0.1764706, 1,
-0.3617918, 0.9050872, -0.7644899, 0, 1, 0.1843137, 1,
-0.3609033, -0.3077034, -1.962067, 0, 1, 0.1882353, 1,
-0.3606989, -0.954768, -2.873064, 0, 1, 0.1960784, 1,
-0.3575731, 0.799015, 1.024371, 0, 1, 0.2039216, 1,
-0.3532912, 0.5439374, -1.340514, 0, 1, 0.2078431, 1,
-0.3504375, -0.7776894, -1.93201, 0, 1, 0.2156863, 1,
-0.3497128, 0.7840539, -1.176491, 0, 1, 0.2196078, 1,
-0.3442701, -1.240342, -4.237085, 0, 1, 0.227451, 1,
-0.3420829, -1.073274, -4.186914, 0, 1, 0.2313726, 1,
-0.3395309, -0.6944399, -2.920777, 0, 1, 0.2392157, 1,
-0.33771, -0.198317, -2.125076, 0, 1, 0.2431373, 1,
-0.3363282, -0.05492187, -1.709311, 0, 1, 0.2509804, 1,
-0.3360972, -0.9122233, -4.156119, 0, 1, 0.254902, 1,
-0.3352878, -1.291019, -3.691647, 0, 1, 0.2627451, 1,
-0.3331525, 0.7248198, -1.11561, 0, 1, 0.2666667, 1,
-0.3253049, 0.04943394, -1.508425, 0, 1, 0.2745098, 1,
-0.3248568, -0.9257988, -4.456692, 0, 1, 0.2784314, 1,
-0.3226726, -1.767998, -3.51571, 0, 1, 0.2862745, 1,
-0.3223089, -0.1175603, -0.9670409, 0, 1, 0.2901961, 1,
-0.3220413, -1.625191, -4.527199, 0, 1, 0.2980392, 1,
-0.3200721, -0.3743373, -0.5246385, 0, 1, 0.3058824, 1,
-0.3198185, 0.325583, -1.616857, 0, 1, 0.3098039, 1,
-0.3185082, -0.9670369, -2.706311, 0, 1, 0.3176471, 1,
-0.313984, 0.2863088, -1.299097, 0, 1, 0.3215686, 1,
-0.3137487, 1.434553, 0.7246894, 0, 1, 0.3294118, 1,
-0.3107894, -0.2529331, -2.507343, 0, 1, 0.3333333, 1,
-0.3095983, 1.549601, 0.6209132, 0, 1, 0.3411765, 1,
-0.3028288, 1.990947, -0.185129, 0, 1, 0.345098, 1,
-0.2981823, 0.4202719, -2.146272, 0, 1, 0.3529412, 1,
-0.2966949, -0.5055376, -1.247344, 0, 1, 0.3568628, 1,
-0.2966244, -2.557103, -0.9499031, 0, 1, 0.3647059, 1,
-0.2951086, 0.6524701, -1.383303, 0, 1, 0.3686275, 1,
-0.291597, 1.300589, -0.8732077, 0, 1, 0.3764706, 1,
-0.2913868, -1.000597, -3.181249, 0, 1, 0.3803922, 1,
-0.2908306, 0.290463, -2.705931, 0, 1, 0.3882353, 1,
-0.2890422, 0.8013667, -0.02244802, 0, 1, 0.3921569, 1,
-0.2881435, 0.9533442, -0.6756085, 0, 1, 0.4, 1,
-0.2825709, -1.209615, -3.546323, 0, 1, 0.4078431, 1,
-0.2818352, 0.5272369, -0.1726988, 0, 1, 0.4117647, 1,
-0.2796241, 0.5395116, -0.9111993, 0, 1, 0.4196078, 1,
-0.2787348, -2.400706, -1.965867, 0, 1, 0.4235294, 1,
-0.2727997, 0.8064219, 1.468081, 0, 1, 0.4313726, 1,
-0.2711946, -1.463197, -2.481049, 0, 1, 0.4352941, 1,
-0.2644145, 1.501716, -1.457123, 0, 1, 0.4431373, 1,
-0.2612474, 1.259073, 0.3547903, 0, 1, 0.4470588, 1,
-0.2579242, -0.04819667, -0.994563, 0, 1, 0.454902, 1,
-0.2575811, -0.7634503, -3.23647, 0, 1, 0.4588235, 1,
-0.2574966, -0.1716544, -0.9414437, 0, 1, 0.4666667, 1,
-0.2571733, -1.715258, -1.085844, 0, 1, 0.4705882, 1,
-0.2529806, -1.078834, -4.994783, 0, 1, 0.4784314, 1,
-0.2518198, -2.881627, -2.569349, 0, 1, 0.4823529, 1,
-0.245306, -0.2416369, -1.371088, 0, 1, 0.4901961, 1,
-0.2450784, 0.7263028, 1.117608, 0, 1, 0.4941176, 1,
-0.2434154, 1.251914, -0.08580067, 0, 1, 0.5019608, 1,
-0.2432043, -1.419508, -2.555779, 0, 1, 0.509804, 1,
-0.2429201, 0.204166, -1.186321, 0, 1, 0.5137255, 1,
-0.2419261, -0.6892913, -4.061999, 0, 1, 0.5215687, 1,
-0.2388225, 0.9296732, -2.673267, 0, 1, 0.5254902, 1,
-0.2364105, 0.2760253, -0.6464346, 0, 1, 0.5333334, 1,
-0.2327196, -0.6870962, -2.382857, 0, 1, 0.5372549, 1,
-0.2299648, 0.6833529, -0.7483985, 0, 1, 0.5450981, 1,
-0.2260336, -0.1974484, -2.514497, 0, 1, 0.5490196, 1,
-0.224755, -0.9773321, -4.53726, 0, 1, 0.5568628, 1,
-0.2227041, -0.03189751, -2.798143, 0, 1, 0.5607843, 1,
-0.2139528, 0.4156567, -1.174792, 0, 1, 0.5686275, 1,
-0.210398, 0.4484865, -0.2050918, 0, 1, 0.572549, 1,
-0.2100125, 0.6328605, -0.7085357, 0, 1, 0.5803922, 1,
-0.199682, 0.3011729, -2.259984, 0, 1, 0.5843138, 1,
-0.1988712, -1.426261, -2.203281, 0, 1, 0.5921569, 1,
-0.1967243, 0.310801, 0.1318014, 0, 1, 0.5960785, 1,
-0.1921021, 0.04576407, 0.1060292, 0, 1, 0.6039216, 1,
-0.1843566, -0.2923098, -0.4950049, 0, 1, 0.6117647, 1,
-0.1840026, -0.4582855, -4.284397, 0, 1, 0.6156863, 1,
-0.1816377, 0.734524, 1.231382, 0, 1, 0.6235294, 1,
-0.1808613, -1.13296, -3.212104, 0, 1, 0.627451, 1,
-0.1805365, -0.3943829, -3.22867, 0, 1, 0.6352941, 1,
-0.1798932, 0.4643942, -0.8917243, 0, 1, 0.6392157, 1,
-0.1795063, -1.581081, -3.063585, 0, 1, 0.6470588, 1,
-0.1790026, 0.07456403, 0.4823133, 0, 1, 0.6509804, 1,
-0.1762183, -1.414463, -3.446162, 0, 1, 0.6588235, 1,
-0.175834, -0.4642658, -2.491221, 0, 1, 0.6627451, 1,
-0.1744857, -0.3532724, -2.244323, 0, 1, 0.6705883, 1,
-0.1708749, -0.03818702, 0.6183687, 0, 1, 0.6745098, 1,
-0.1688166, 0.7110785, -0.4316557, 0, 1, 0.682353, 1,
-0.16456, -0.3589577, -1.989427, 0, 1, 0.6862745, 1,
-0.1628014, 0.1177298, -1.048422, 0, 1, 0.6941177, 1,
-0.161515, 2.042713, -2.145959, 0, 1, 0.7019608, 1,
-0.1597025, 1.168418, -0.1940773, 0, 1, 0.7058824, 1,
-0.1582455, -1.305413, -3.326592, 0, 1, 0.7137255, 1,
-0.1540755, 1.828358, 0.6782846, 0, 1, 0.7176471, 1,
-0.1530603, -0.5685507, -2.932839, 0, 1, 0.7254902, 1,
-0.1507208, 0.9492075, 0.747072, 0, 1, 0.7294118, 1,
-0.1496048, 0.6823953, -0.3115279, 0, 1, 0.7372549, 1,
-0.1484788, -2.044895, -2.974483, 0, 1, 0.7411765, 1,
-0.146273, 0.2205158, -1.607292, 0, 1, 0.7490196, 1,
-0.1462453, 2.116517, -0.08314061, 0, 1, 0.7529412, 1,
-0.1419206, 0.8698348, -1.310273, 0, 1, 0.7607843, 1,
-0.1396971, 0.8614893, -0.3818151, 0, 1, 0.7647059, 1,
-0.1379943, -0.1778163, -1.449565, 0, 1, 0.772549, 1,
-0.1363859, -1.383247, -2.679545, 0, 1, 0.7764706, 1,
-0.1358627, -0.4547068, -2.243805, 0, 1, 0.7843137, 1,
-0.1347907, 0.5454981, 0.3946079, 0, 1, 0.7882353, 1,
-0.1329478, 0.7844576, -1.199736, 0, 1, 0.7960784, 1,
-0.1321216, 0.364285, 0.4276364, 0, 1, 0.8039216, 1,
-0.1308891, -0.609475, -4.623598, 0, 1, 0.8078431, 1,
-0.1292689, -0.9044136, -3.946654, 0, 1, 0.8156863, 1,
-0.1288254, -2.000516, -1.948547, 0, 1, 0.8196079, 1,
-0.1281075, -0.6518936, -3.041043, 0, 1, 0.827451, 1,
-0.124913, -2.637867, -2.452028, 0, 1, 0.8313726, 1,
-0.1243702, -0.08585013, -1.96853, 0, 1, 0.8392157, 1,
-0.1167901, 0.7026855, 0.9277701, 0, 1, 0.8431373, 1,
-0.1148331, 1.009575, -0.7542931, 0, 1, 0.8509804, 1,
-0.114704, 0.5414937, 0.4072253, 0, 1, 0.854902, 1,
-0.1142673, 0.739439, 0.8021657, 0, 1, 0.8627451, 1,
-0.1141631, -0.3277854, -2.082692, 0, 1, 0.8666667, 1,
-0.1118827, 0.2293398, -0.7509717, 0, 1, 0.8745098, 1,
-0.1117059, -0.6894221, -3.162549, 0, 1, 0.8784314, 1,
-0.1098613, 0.4230662, -1.892108, 0, 1, 0.8862745, 1,
-0.1087908, -0.4348715, -2.504967, 0, 1, 0.8901961, 1,
-0.1063911, 1.396607, -1.769771, 0, 1, 0.8980392, 1,
-0.1037948, -0.6905358, -3.801833, 0, 1, 0.9058824, 1,
-0.1032342, -0.4208961, -3.03473, 0, 1, 0.9098039, 1,
-0.09468352, 0.9889892, 0.6191767, 0, 1, 0.9176471, 1,
-0.09140122, 0.3299749, -0.6102698, 0, 1, 0.9215686, 1,
-0.08723907, 2.283526, -0.3752312, 0, 1, 0.9294118, 1,
-0.08361567, -0.07565239, -1.831895, 0, 1, 0.9333333, 1,
-0.08283221, 1.880375, -0.249061, 0, 1, 0.9411765, 1,
-0.07974698, -0.2256691, -2.248963, 0, 1, 0.945098, 1,
-0.07874306, -0.02031014, -2.499709, 0, 1, 0.9529412, 1,
-0.07825013, -0.1127199, -2.611893, 0, 1, 0.9568627, 1,
-0.07794129, 0.270109, -0.4772951, 0, 1, 0.9647059, 1,
-0.07777508, -1.338859, -3.471159, 0, 1, 0.9686275, 1,
-0.07575791, -0.7008374, -2.452771, 0, 1, 0.9764706, 1,
-0.06436267, 0.1819421, -0.4777233, 0, 1, 0.9803922, 1,
-0.05400985, -1.285226, -2.086473, 0, 1, 0.9882353, 1,
-0.04944474, -1.528999, -3.859865, 0, 1, 0.9921569, 1,
-0.04873909, 1.38492, 0.8779733, 0, 1, 1, 1,
-0.0473595, 1.58468, -1.201684, 0, 0.9921569, 1, 1,
-0.0448333, -0.6131071, -4.359669, 0, 0.9882353, 1, 1,
-0.04008181, 0.1848784, -0.3713326, 0, 0.9803922, 1, 1,
-0.03958924, 0.1670541, 0.4721849, 0, 0.9764706, 1, 1,
-0.03807648, 0.1496353, -0.4853081, 0, 0.9686275, 1, 1,
-0.03179516, 0.08908763, -0.2565283, 0, 0.9647059, 1, 1,
-0.02538379, 0.01598042, -0.5028736, 0, 0.9568627, 1, 1,
-0.02251792, 0.06535359, -1.308887, 0, 0.9529412, 1, 1,
-0.02206295, -0.8155613, -4.792916, 0, 0.945098, 1, 1,
-0.02195107, -0.464062, -2.252069, 0, 0.9411765, 1, 1,
-0.01563378, 0.1013113, -0.5331737, 0, 0.9333333, 1, 1,
-0.01399822, 0.4985734, 1.888041, 0, 0.9294118, 1, 1,
-0.01308895, 0.04538932, -1.035784, 0, 0.9215686, 1, 1,
-0.01190102, 1.386566, -0.07859986, 0, 0.9176471, 1, 1,
-0.009055049, 0.9232855, -0.5501969, 0, 0.9098039, 1, 1,
0.004212402, -0.9113376, 3.791214, 0, 0.9058824, 1, 1,
0.004780969, -1.436037, 3.594693, 0, 0.8980392, 1, 1,
0.005357686, 0.1499737, 0.6258963, 0, 0.8901961, 1, 1,
0.008397593, 0.6678782, -0.3546492, 0, 0.8862745, 1, 1,
0.00954227, -0.715114, 4.378314, 0, 0.8784314, 1, 1,
0.01119157, 1.72587, -0.6410797, 0, 0.8745098, 1, 1,
0.01178397, -0.02896073, 1.5402, 0, 0.8666667, 1, 1,
0.01785258, 1.189816, -1.05511, 0, 0.8627451, 1, 1,
0.0213616, -0.6744586, 3.347322, 0, 0.854902, 1, 1,
0.02489938, -1.174399, 3.127858, 0, 0.8509804, 1, 1,
0.0290481, -0.5761211, 3.860455, 0, 0.8431373, 1, 1,
0.02997265, -1.063411, 6.043603, 0, 0.8392157, 1, 1,
0.03214084, 0.7478622, -0.04938841, 0, 0.8313726, 1, 1,
0.03254448, 0.549482, 1.791518, 0, 0.827451, 1, 1,
0.0335934, -1.355913, 3.288652, 0, 0.8196079, 1, 1,
0.03618313, -0.4848806, 3.444335, 0, 0.8156863, 1, 1,
0.03829974, 2.144638, -0.2405575, 0, 0.8078431, 1, 1,
0.04921493, 0.8569757, 1.291038, 0, 0.8039216, 1, 1,
0.05456339, -0.2833459, 2.950614, 0, 0.7960784, 1, 1,
0.05939598, -0.1685933, 1.5267, 0, 0.7882353, 1, 1,
0.06003349, 0.6212924, -1.72715, 0, 0.7843137, 1, 1,
0.06047081, 0.410247, -0.4273461, 0, 0.7764706, 1, 1,
0.06093143, 0.9765213, 0.8540723, 0, 0.772549, 1, 1,
0.0653335, 1.333584, 0.4846356, 0, 0.7647059, 1, 1,
0.06710071, -0.4721954, 3.67856, 0, 0.7607843, 1, 1,
0.06926664, 0.3118865, 0.6180698, 0, 0.7529412, 1, 1,
0.07163739, -0.05879476, 0.6501865, 0, 0.7490196, 1, 1,
0.07271319, 0.7395082, 0.6473988, 0, 0.7411765, 1, 1,
0.07334925, 0.01069908, 1.404947, 0, 0.7372549, 1, 1,
0.07338633, 0.4757227, -0.6891372, 0, 0.7294118, 1, 1,
0.07467573, 0.9452338, -0.1680178, 0, 0.7254902, 1, 1,
0.07505617, -1.214627, 3.911605, 0, 0.7176471, 1, 1,
0.07549832, 0.5979187, -1.164269, 0, 0.7137255, 1, 1,
0.07606834, 1.598777, -0.8678439, 0, 0.7058824, 1, 1,
0.08129212, -3.088845, 1.48038, 0, 0.6980392, 1, 1,
0.08210045, -0.1765065, 2.527193, 0, 0.6941177, 1, 1,
0.08328834, -0.7992408, 4.814836, 0, 0.6862745, 1, 1,
0.08405223, 0.2064583, -1.5288, 0, 0.682353, 1, 1,
0.08442127, 0.1423204, 0.009798644, 0, 0.6745098, 1, 1,
0.08856729, -0.03419089, 3.926157, 0, 0.6705883, 1, 1,
0.08992696, 0.9435883, 0.4866861, 0, 0.6627451, 1, 1,
0.09146152, -0.1909077, 2.61808, 0, 0.6588235, 1, 1,
0.09252885, -1.387597, 2.670385, 0, 0.6509804, 1, 1,
0.09253244, -0.7082814, 2.646968, 0, 0.6470588, 1, 1,
0.09536747, -1.101972, 1.98059, 0, 0.6392157, 1, 1,
0.09556816, 2.983179, -0.0295884, 0, 0.6352941, 1, 1,
0.09610526, -0.2787623, 3.116278, 0, 0.627451, 1, 1,
0.09688016, -0.183325, 2.406159, 0, 0.6235294, 1, 1,
0.09817208, 1.061063, 0.4369767, 0, 0.6156863, 1, 1,
0.1002357, 0.02106374, 1.129506, 0, 0.6117647, 1, 1,
0.1051486, 0.447096, -1.865726, 0, 0.6039216, 1, 1,
0.1059088, 0.9644357, -2.343529, 0, 0.5960785, 1, 1,
0.1088591, -0.8729373, 2.01265, 0, 0.5921569, 1, 1,
0.10901, 1.230089, 1.833521, 0, 0.5843138, 1, 1,
0.1118818, -2.395282, 3.009994, 0, 0.5803922, 1, 1,
0.1149648, 1.183229, 0.3210743, 0, 0.572549, 1, 1,
0.1189506, -0.1338962, 1.042697, 0, 0.5686275, 1, 1,
0.1227609, 1.259168, -1.586497, 0, 0.5607843, 1, 1,
0.1270574, -1.124019, 2.742107, 0, 0.5568628, 1, 1,
0.1309582, -0.3306526, 3.474448, 0, 0.5490196, 1, 1,
0.1384059, 0.4215358, -0.6463442, 0, 0.5450981, 1, 1,
0.1390003, 0.5879559, 0.6413878, 0, 0.5372549, 1, 1,
0.1405897, 0.06544539, 0.2906226, 0, 0.5333334, 1, 1,
0.1459175, -1.635538, 4.286442, 0, 0.5254902, 1, 1,
0.153738, -0.9914952, 3.299174, 0, 0.5215687, 1, 1,
0.1541633, 0.5383788, -0.1275931, 0, 0.5137255, 1, 1,
0.1560763, 1.266847, -0.4192888, 0, 0.509804, 1, 1,
0.1585986, -0.7309482, 3.879407, 0, 0.5019608, 1, 1,
0.1634256, -0.2418704, 1.138458, 0, 0.4941176, 1, 1,
0.1739061, 1.145535, 0.05563873, 0, 0.4901961, 1, 1,
0.175628, -1.509709, 3.059671, 0, 0.4823529, 1, 1,
0.1780891, -0.3030063, 2.722011, 0, 0.4784314, 1, 1,
0.1791279, -1.161276, 1.758129, 0, 0.4705882, 1, 1,
0.1809906, 0.1825715, 0.3166666, 0, 0.4666667, 1, 1,
0.1832512, -2.181008, 4.717331, 0, 0.4588235, 1, 1,
0.1845952, 0.182014, 0.8960117, 0, 0.454902, 1, 1,
0.188444, -0.4474844, 3.133953, 0, 0.4470588, 1, 1,
0.189848, -0.3021266, 2.738266, 0, 0.4431373, 1, 1,
0.2013139, 3.210163, 0.4925545, 0, 0.4352941, 1, 1,
0.2019925, -1.256055, 2.82848, 0, 0.4313726, 1, 1,
0.20533, 0.4937348, 2.04726, 0, 0.4235294, 1, 1,
0.205386, 0.4271398, -0.3052351, 0, 0.4196078, 1, 1,
0.2057253, -1.214699, 1.772167, 0, 0.4117647, 1, 1,
0.2075824, 0.4884765, 1.090819, 0, 0.4078431, 1, 1,
0.2104108, 2.109956, 1.807315, 0, 0.4, 1, 1,
0.2126954, -0.4715912, 2.684386, 0, 0.3921569, 1, 1,
0.2141662, 1.359326, 0.248808, 0, 0.3882353, 1, 1,
0.2143365, -0.5111883, 2.936383, 0, 0.3803922, 1, 1,
0.2145468, 1.242972, -0.4322873, 0, 0.3764706, 1, 1,
0.215209, 0.728048, -0.4705159, 0, 0.3686275, 1, 1,
0.2204607, -0.6406338, 3.55726, 0, 0.3647059, 1, 1,
0.220542, -0.3270524, 2.877491, 0, 0.3568628, 1, 1,
0.2213726, 0.6143463, 0.8575315, 0, 0.3529412, 1, 1,
0.2235497, -0.8052152, 3.545177, 0, 0.345098, 1, 1,
0.2251494, -0.6792422, 4.14056, 0, 0.3411765, 1, 1,
0.225588, 0.03639973, -0.2351439, 0, 0.3333333, 1, 1,
0.2282254, 1.220812, 1.461463, 0, 0.3294118, 1, 1,
0.2287036, 0.07394943, 0.4260546, 0, 0.3215686, 1, 1,
0.2306619, -0.3514856, 3.456178, 0, 0.3176471, 1, 1,
0.2312986, 0.01218827, 2.183533, 0, 0.3098039, 1, 1,
0.2339293, 1.169037, -0.129697, 0, 0.3058824, 1, 1,
0.237735, 1.047452, 0.9802035, 0, 0.2980392, 1, 1,
0.2389479, 0.1777523, 2.118629, 0, 0.2901961, 1, 1,
0.2404844, -0.7489336, 1.980246, 0, 0.2862745, 1, 1,
0.2423165, 3.261221, -0.6429836, 0, 0.2784314, 1, 1,
0.2447889, -0.4217353, 3.01699, 0, 0.2745098, 1, 1,
0.2449227, -0.05686751, 1.92655, 0, 0.2666667, 1, 1,
0.2498434, -0.9407206, 2.784321, 0, 0.2627451, 1, 1,
0.2508287, 0.2812381, 0.3965316, 0, 0.254902, 1, 1,
0.2519355, 0.1207937, 1.878222, 0, 0.2509804, 1, 1,
0.2545733, -1.234633, 5.221997, 0, 0.2431373, 1, 1,
0.2548549, 0.07202654, 0.5721254, 0, 0.2392157, 1, 1,
0.2562591, 0.5422451, -0.1765632, 0, 0.2313726, 1, 1,
0.2585299, 0.5850502, -0.1371331, 0, 0.227451, 1, 1,
0.2595979, 0.9193574, -1.047177, 0, 0.2196078, 1, 1,
0.2604939, 0.7302711, 0.38572, 0, 0.2156863, 1, 1,
0.2637012, -0.1637216, 1.537252, 0, 0.2078431, 1, 1,
0.2661432, 1.558287, -0.08202902, 0, 0.2039216, 1, 1,
0.2675266, 1.011332, 1.210891, 0, 0.1960784, 1, 1,
0.2677667, 0.5760693, 0.8676017, 0, 0.1882353, 1, 1,
0.2684604, 1.941272, 0.1575526, 0, 0.1843137, 1, 1,
0.2687974, -1.360132, 4.894003, 0, 0.1764706, 1, 1,
0.2717162, -0.3926074, 4.130745, 0, 0.172549, 1, 1,
0.2724499, 0.9290418, -0.2963693, 0, 0.1647059, 1, 1,
0.2735167, 1.218515, -0.2505724, 0, 0.1607843, 1, 1,
0.2739021, -0.5129926, 2.437264, 0, 0.1529412, 1, 1,
0.2769071, 0.5387356, 0.2612148, 0, 0.1490196, 1, 1,
0.2797741, 0.1850982, 0.6032582, 0, 0.1411765, 1, 1,
0.2814073, 0.8863598, -2.02242, 0, 0.1372549, 1, 1,
0.2823504, 1.289343, -0.2857336, 0, 0.1294118, 1, 1,
0.2861454, 0.1530122, -0.1154472, 0, 0.1254902, 1, 1,
0.2893839, -0.2076821, 2.864852, 0, 0.1176471, 1, 1,
0.2934575, -0.9384705, 2.943334, 0, 0.1137255, 1, 1,
0.3009533, -0.4432974, 2.496603, 0, 0.1058824, 1, 1,
0.3041008, 0.6737257, 0.6372382, 0, 0.09803922, 1, 1,
0.3080197, 0.6238444, 2.354849, 0, 0.09411765, 1, 1,
0.3116209, 0.7989988, -1.678479, 0, 0.08627451, 1, 1,
0.3156223, 1.073824, -0.5295853, 0, 0.08235294, 1, 1,
0.3194484, -0.01883134, 1.731204, 0, 0.07450981, 1, 1,
0.3243273, 0.8500901, 1.879334, 0, 0.07058824, 1, 1,
0.3253302, 1.382408, -1.552248, 0, 0.0627451, 1, 1,
0.3310826, -0.6668915, 3.955165, 0, 0.05882353, 1, 1,
0.3327077, -1.404379, 3.782273, 0, 0.05098039, 1, 1,
0.3329982, -0.4667858, 3.213227, 0, 0.04705882, 1, 1,
0.3385881, 0.8357373, 2.224328, 0, 0.03921569, 1, 1,
0.3400729, -1.351832, 0.6847434, 0, 0.03529412, 1, 1,
0.3470805, 0.5672171, 0.4678269, 0, 0.02745098, 1, 1,
0.3479984, -0.7184111, 3.370581, 0, 0.02352941, 1, 1,
0.3494146, 0.05923694, 0.05413262, 0, 0.01568628, 1, 1,
0.3534046, 0.5871446, 0.6310554, 0, 0.01176471, 1, 1,
0.3538662, -1.743088, 2.750892, 0, 0.003921569, 1, 1,
0.3539109, 0.1933361, 1.290571, 0.003921569, 0, 1, 1,
0.3658101, 1.682596, -0.8755419, 0.007843138, 0, 1, 1,
0.3667881, -0.681882, 2.8034, 0.01568628, 0, 1, 1,
0.3678653, -0.8400382, 4.845978, 0.01960784, 0, 1, 1,
0.3693177, 0.4266714, 1.259402, 0.02745098, 0, 1, 1,
0.3714412, -0.4443238, 0.8302981, 0.03137255, 0, 1, 1,
0.3760939, 1.155025, -0.9100177, 0.03921569, 0, 1, 1,
0.3761833, 1.779672, 1.689976, 0.04313726, 0, 1, 1,
0.3834777, 0.1626257, 0.2862944, 0.05098039, 0, 1, 1,
0.3838769, -0.709138, 4.246675, 0.05490196, 0, 1, 1,
0.3841569, -0.3616371, 2.442487, 0.0627451, 0, 1, 1,
0.3888554, 1.551121, -0.7527438, 0.06666667, 0, 1, 1,
0.3891975, 0.1522336, -0.01349426, 0.07450981, 0, 1, 1,
0.3914346, -1.133434, 1.748464, 0.07843138, 0, 1, 1,
0.3928821, 0.4162753, -0.5996463, 0.08627451, 0, 1, 1,
0.3932984, 0.03349023, 2.461549, 0.09019608, 0, 1, 1,
0.3966255, 0.4066009, 1.372002, 0.09803922, 0, 1, 1,
0.3986932, -1.212379, 2.410214, 0.1058824, 0, 1, 1,
0.4069017, -1.114645, 2.232346, 0.1098039, 0, 1, 1,
0.4155025, 0.04364929, 0.43387, 0.1176471, 0, 1, 1,
0.422075, 0.5719857, 1.658073, 0.1215686, 0, 1, 1,
0.4244798, 0.9615554, 0.7286901, 0.1294118, 0, 1, 1,
0.4272642, -0.4904547, -0.4170182, 0.1333333, 0, 1, 1,
0.4284211, 1.002887, 0.9249226, 0.1411765, 0, 1, 1,
0.4448772, -0.5398385, 1.523941, 0.145098, 0, 1, 1,
0.4469392, 0.1958944, 2.550324, 0.1529412, 0, 1, 1,
0.4483719, 0.7284704, -1.067381, 0.1568628, 0, 1, 1,
0.4526098, -0.5038276, 1.727941, 0.1647059, 0, 1, 1,
0.4532793, 0.9764233, 0.3003657, 0.1686275, 0, 1, 1,
0.454225, 0.2349907, 2.481589, 0.1764706, 0, 1, 1,
0.454484, -0.2487783, 1.675801, 0.1803922, 0, 1, 1,
0.4613395, 0.3961894, -0.09685974, 0.1882353, 0, 1, 1,
0.4632993, -0.4857371, 4.278687, 0.1921569, 0, 1, 1,
0.4655008, -0.4854243, 2.334685, 0.2, 0, 1, 1,
0.4674622, -0.7826498, 2.979318, 0.2078431, 0, 1, 1,
0.4676318, 0.5393253, 1.729324, 0.2117647, 0, 1, 1,
0.4686109, 0.6510636, 0.427108, 0.2196078, 0, 1, 1,
0.4690521, -0.6309451, 3.213872, 0.2235294, 0, 1, 1,
0.4701261, -2.207735, 2.816098, 0.2313726, 0, 1, 1,
0.4746639, -0.2034891, 2.238983, 0.2352941, 0, 1, 1,
0.4798588, -1.577326, 3.025965, 0.2431373, 0, 1, 1,
0.4804099, 0.01028733, 0.7888915, 0.2470588, 0, 1, 1,
0.4818923, -0.01564196, 1.062133, 0.254902, 0, 1, 1,
0.4848458, -0.08143681, 1.501847, 0.2588235, 0, 1, 1,
0.4985341, 1.583694, -1.017795, 0.2666667, 0, 1, 1,
0.5048174, 0.4142019, -0.3899754, 0.2705882, 0, 1, 1,
0.5083508, -1.793162, 2.609807, 0.2784314, 0, 1, 1,
0.5103592, -0.9723659, 0.4335628, 0.282353, 0, 1, 1,
0.5133666, -1.203482, 4.360237, 0.2901961, 0, 1, 1,
0.5136071, -0.4743153, 3.673203, 0.2941177, 0, 1, 1,
0.5138777, -0.8578277, 3.636452, 0.3019608, 0, 1, 1,
0.5152903, -1.078174, 2.898005, 0.3098039, 0, 1, 1,
0.5246673, 1.212476, -0.1974915, 0.3137255, 0, 1, 1,
0.5246814, 1.343711, 1.292303, 0.3215686, 0, 1, 1,
0.5291853, 0.7793963, -0.7507616, 0.3254902, 0, 1, 1,
0.5295968, -0.2715114, 2.63863, 0.3333333, 0, 1, 1,
0.5363293, 0.6501432, -0.5205491, 0.3372549, 0, 1, 1,
0.5372354, -0.4874699, 1.867844, 0.345098, 0, 1, 1,
0.5387927, 0.7451051, 0.6048043, 0.3490196, 0, 1, 1,
0.5509087, 0.1028642, 3.122625, 0.3568628, 0, 1, 1,
0.5548476, 0.7275589, 1.667637, 0.3607843, 0, 1, 1,
0.557469, -0.06802171, 3.005726, 0.3686275, 0, 1, 1,
0.558222, -0.697319, 3.043821, 0.372549, 0, 1, 1,
0.561047, 0.6076968, 0.5292408, 0.3803922, 0, 1, 1,
0.5610673, -0.117044, 1.609628, 0.3843137, 0, 1, 1,
0.5612527, 1.111869, 1.499638, 0.3921569, 0, 1, 1,
0.5613769, -2.371333, 2.105874, 0.3960784, 0, 1, 1,
0.5638876, -1.689781, 2.425866, 0.4039216, 0, 1, 1,
0.5641886, 1.953105, -0.08588082, 0.4117647, 0, 1, 1,
0.5655734, 0.9524961, 0.6355711, 0.4156863, 0, 1, 1,
0.5657089, -0.007114957, 1.262539, 0.4235294, 0, 1, 1,
0.5662099, -1.127184, 2.160477, 0.427451, 0, 1, 1,
0.5722086, 0.6442216, 1.247804, 0.4352941, 0, 1, 1,
0.5750911, -0.5256856, 1.695029, 0.4392157, 0, 1, 1,
0.5757251, -0.6115544, 1.540091, 0.4470588, 0, 1, 1,
0.5807112, -1.910739, 2.397346, 0.4509804, 0, 1, 1,
0.5810587, -0.1354537, 0.05701456, 0.4588235, 0, 1, 1,
0.582184, 0.4411795, 2.530164, 0.4627451, 0, 1, 1,
0.5919153, -0.2359138, 1.812111, 0.4705882, 0, 1, 1,
0.6041307, 0.3870278, 0.9344382, 0.4745098, 0, 1, 1,
0.6114229, 0.4387631, -1.297001, 0.4823529, 0, 1, 1,
0.6145896, 1.058002, 0.5595893, 0.4862745, 0, 1, 1,
0.6186697, 1.039573, 1.251961, 0.4941176, 0, 1, 1,
0.6253608, 0.3903514, -0.04472839, 0.5019608, 0, 1, 1,
0.6282607, 0.604295, 1.184275, 0.5058824, 0, 1, 1,
0.6330206, -1.728212, 1.449115, 0.5137255, 0, 1, 1,
0.6412759, 0.01405647, -1.178378, 0.5176471, 0, 1, 1,
0.6491944, -0.03237347, 3.773166, 0.5254902, 0, 1, 1,
0.6601123, 0.3125826, 1.576184, 0.5294118, 0, 1, 1,
0.6685584, 1.345642, 0.1155308, 0.5372549, 0, 1, 1,
0.6690241, -0.6096873, 2.561549, 0.5411765, 0, 1, 1,
0.6697286, 0.3652611, -0.02504994, 0.5490196, 0, 1, 1,
0.6742372, -0.7978037, 1.887628, 0.5529412, 0, 1, 1,
0.6745276, -2.062135, 1.771376, 0.5607843, 0, 1, 1,
0.6749793, -1.321249, 2.447597, 0.5647059, 0, 1, 1,
0.6829969, 0.04664207, 1.3384, 0.572549, 0, 1, 1,
0.6834456, 0.3011404, 2.242455, 0.5764706, 0, 1, 1,
0.6835528, -2.013456, 3.477875, 0.5843138, 0, 1, 1,
0.6843953, -0.7562687, 1.662094, 0.5882353, 0, 1, 1,
0.6993949, -0.4158764, 2.768715, 0.5960785, 0, 1, 1,
0.7007704, -0.6404226, 1.202168, 0.6039216, 0, 1, 1,
0.7061763, 0.4280531, -0.1974903, 0.6078432, 0, 1, 1,
0.7088575, -1.233732, 2.391975, 0.6156863, 0, 1, 1,
0.7096405, -0.02995728, -0.04885738, 0.6196079, 0, 1, 1,
0.710297, 0.4920489, -1.008559, 0.627451, 0, 1, 1,
0.7147052, 0.7604991, 0.4071356, 0.6313726, 0, 1, 1,
0.7190384, 1.043437, 0.270915, 0.6392157, 0, 1, 1,
0.719165, 1.634313, 0.1098887, 0.6431373, 0, 1, 1,
0.7221942, -0.523369, 2.392757, 0.6509804, 0, 1, 1,
0.7269429, -0.2633755, 1.830875, 0.654902, 0, 1, 1,
0.7285928, -1.250344, 3.860265, 0.6627451, 0, 1, 1,
0.7316635, -0.6242896, 3.729285, 0.6666667, 0, 1, 1,
0.7330846, 0.9283594, 2.155907, 0.6745098, 0, 1, 1,
0.7332278, 0.9977702, 0.4022199, 0.6784314, 0, 1, 1,
0.7340571, -1.650002, 1.710561, 0.6862745, 0, 1, 1,
0.7407127, -0.8885863, 2.673846, 0.6901961, 0, 1, 1,
0.7409902, -0.1850922, 1.071303, 0.6980392, 0, 1, 1,
0.7419705, -0.4116549, 3.290321, 0.7058824, 0, 1, 1,
0.7428344, -0.5792926, 2.373696, 0.7098039, 0, 1, 1,
0.7462152, 0.08018221, 1.117426, 0.7176471, 0, 1, 1,
0.7481589, -1.146944, 1.88677, 0.7215686, 0, 1, 1,
0.7489617, -0.8059556, 2.358359, 0.7294118, 0, 1, 1,
0.7596342, -0.05876431, 1.599651, 0.7333333, 0, 1, 1,
0.7709905, 0.857727, 0.2923798, 0.7411765, 0, 1, 1,
0.7760096, -1.086222, 3.208765, 0.7450981, 0, 1, 1,
0.7828898, -0.7777317, 2.706632, 0.7529412, 0, 1, 1,
0.7887263, -1.075949, 2.426677, 0.7568628, 0, 1, 1,
0.7941877, -2.028416, 2.710414, 0.7647059, 0, 1, 1,
0.7961448, -0.1712268, 2.589234, 0.7686275, 0, 1, 1,
0.7998086, 0.1144398, 1.804554, 0.7764706, 0, 1, 1,
0.8008679, -1.238601, 2.715506, 0.7803922, 0, 1, 1,
0.8042979, -1.291047, 1.932163, 0.7882353, 0, 1, 1,
0.8058063, 0.6403632, 2.79208, 0.7921569, 0, 1, 1,
0.8059984, 1.185829, -0.9300111, 0.8, 0, 1, 1,
0.8067241, 0.5914735, 0.5458374, 0.8078431, 0, 1, 1,
0.8079662, 0.1561874, 1.178794, 0.8117647, 0, 1, 1,
0.814581, 1.297149, 0.838235, 0.8196079, 0, 1, 1,
0.8148946, -0.1152921, 0.1905888, 0.8235294, 0, 1, 1,
0.8252305, 0.3110412, 1.627324, 0.8313726, 0, 1, 1,
0.8289376, -2.187306, 3.940749, 0.8352941, 0, 1, 1,
0.8336841, -0.6109416, 2.935211, 0.8431373, 0, 1, 1,
0.837463, 0.5698322, 0.5241354, 0.8470588, 0, 1, 1,
0.8433079, 0.7247755, 0.7804068, 0.854902, 0, 1, 1,
0.8445362, 0.5229846, 2.22881, 0.8588235, 0, 1, 1,
0.8468325, 0.3719979, 0.7556267, 0.8666667, 0, 1, 1,
0.85096, 0.2831998, 1.827081, 0.8705882, 0, 1, 1,
0.8548207, 0.5687831, -0.1236046, 0.8784314, 0, 1, 1,
0.858504, 0.9842372, 2.055928, 0.8823529, 0, 1, 1,
0.8593514, -0.8045326, 0.7054625, 0.8901961, 0, 1, 1,
0.8643472, 1.038221, -0.3471862, 0.8941177, 0, 1, 1,
0.8647798, 0.7360554, 0.7060148, 0.9019608, 0, 1, 1,
0.8669836, 0.6686057, 1.074686, 0.9098039, 0, 1, 1,
0.8718913, -0.3426132, 1.678519, 0.9137255, 0, 1, 1,
0.8743327, -1.825332, 2.39559, 0.9215686, 0, 1, 1,
0.8747607, 1.576421, 0.1721557, 0.9254902, 0, 1, 1,
0.876198, -1.881155, 4.31487, 0.9333333, 0, 1, 1,
0.8823126, 0.4194226, 0.610275, 0.9372549, 0, 1, 1,
0.8848767, -0.348983, 1.476051, 0.945098, 0, 1, 1,
0.8940539, -0.8676803, 3.358749, 0.9490196, 0, 1, 1,
0.8970951, 0.4128961, 0.8584598, 0.9568627, 0, 1, 1,
0.8985533, 0.3401195, -0.1066691, 0.9607843, 0, 1, 1,
0.9008122, 0.7052768, -0.1380557, 0.9686275, 0, 1, 1,
0.908523, 0.7133205, 0.5266173, 0.972549, 0, 1, 1,
0.9092672, -0.04284074, 0.4077246, 0.9803922, 0, 1, 1,
0.9110783, 0.9226091, -0.0870303, 0.9843137, 0, 1, 1,
0.9119523, -0.06051032, 2.433609, 0.9921569, 0, 1, 1,
0.91297, 0.03515152, 1.909848, 0.9960784, 0, 1, 1,
0.9199593, 0.8933044, 0.3414344, 1, 0, 0.9960784, 1,
0.9217473, 0.8651878, -0.3938686, 1, 0, 0.9882353, 1,
0.9228702, -1.128814, 1.333209, 1, 0, 0.9843137, 1,
0.924911, -0.4443689, 2.773408, 1, 0, 0.9764706, 1,
0.9270748, -0.1822908, 2.266475, 1, 0, 0.972549, 1,
0.9361132, -0.1320364, 0.3775123, 1, 0, 0.9647059, 1,
0.9392102, 0.613011, 0.6691554, 1, 0, 0.9607843, 1,
0.9477797, 1.685589, 0.674584, 1, 0, 0.9529412, 1,
0.9644368, -0.8465586, 2.550402, 1, 0, 0.9490196, 1,
0.9747781, 1.649169, 1.899683, 1, 0, 0.9411765, 1,
0.9802045, 0.9237236, -0.6195872, 1, 0, 0.9372549, 1,
0.9839708, -0.1052875, 1.866998, 1, 0, 0.9294118, 1,
0.9856177, 0.2858484, 0.7563128, 1, 0, 0.9254902, 1,
0.9996887, 0.06607742, 2.971761, 1, 0, 0.9176471, 1,
1.00549, 1.581338, 0.5605721, 1, 0, 0.9137255, 1,
1.007286, 1.131183, -0.292077, 1, 0, 0.9058824, 1,
1.008637, -1.436787, 1.893575, 1, 0, 0.9019608, 1,
1.017673, 0.8574529, 1.080604, 1, 0, 0.8941177, 1,
1.020647, 1.847484, -1.316378, 1, 0, 0.8862745, 1,
1.024256, 1.328721, 0.08191963, 1, 0, 0.8823529, 1,
1.026941, 1.099416, 1.014602, 1, 0, 0.8745098, 1,
1.0291, 0.7206469, -0.5757104, 1, 0, 0.8705882, 1,
1.034295, -1.557748, 1.158621, 1, 0, 0.8627451, 1,
1.037954, -1.195061, 3.356548, 1, 0, 0.8588235, 1,
1.052651, 0.5822488, -0.6226979, 1, 0, 0.8509804, 1,
1.053624, 0.6581159, 1.899575, 1, 0, 0.8470588, 1,
1.062755, -0.111385, 0.7323605, 1, 0, 0.8392157, 1,
1.068963, -0.5428091, 1.982633, 1, 0, 0.8352941, 1,
1.075203, 1.072844, 1.022753, 1, 0, 0.827451, 1,
1.080072, -1.632133, 2.173927, 1, 0, 0.8235294, 1,
1.082324, 0.7568495, 2.89074, 1, 0, 0.8156863, 1,
1.085163, -0.9463977, 2.405372, 1, 0, 0.8117647, 1,
1.085297, -0.459183, 2.905127, 1, 0, 0.8039216, 1,
1.089484, -0.5911662, -0.6012697, 1, 0, 0.7960784, 1,
1.08985, -1.386472, 3.35066, 1, 0, 0.7921569, 1,
1.10066, 1.102753, 0.757833, 1, 0, 0.7843137, 1,
1.101116, 0.04281687, 2.754779, 1, 0, 0.7803922, 1,
1.101849, -1.369007, 1.950971, 1, 0, 0.772549, 1,
1.10815, 0.1832213, -0.6909806, 1, 0, 0.7686275, 1,
1.108891, -0.259624, 0.01836395, 1, 0, 0.7607843, 1,
1.111067, -0.1461995, 3.390177, 1, 0, 0.7568628, 1,
1.11246, -0.02105143, 2.324627, 1, 0, 0.7490196, 1,
1.124989, -0.1969312, 0.6329972, 1, 0, 0.7450981, 1,
1.131673, 1.152482, 1.816319, 1, 0, 0.7372549, 1,
1.133224, -0.3513325, 2.688614, 1, 0, 0.7333333, 1,
1.138152, -0.3832381, 2.909341, 1, 0, 0.7254902, 1,
1.154175, -0.7565274, 3.126433, 1, 0, 0.7215686, 1,
1.162723, 1.468082, 0.1738804, 1, 0, 0.7137255, 1,
1.166167, 1.517578, 1.029852, 1, 0, 0.7098039, 1,
1.168234, -0.633942, 3.045281, 1, 0, 0.7019608, 1,
1.169483, 0.1886241, 1.361889, 1, 0, 0.6941177, 1,
1.173751, 0.2408868, 0.2164679, 1, 0, 0.6901961, 1,
1.175133, -0.08699918, 0.9566895, 1, 0, 0.682353, 1,
1.178388, -0.09342213, 0.9318625, 1, 0, 0.6784314, 1,
1.178937, 1.400377, 1.306582, 1, 0, 0.6705883, 1,
1.182446, -1.031903, 1.126917, 1, 0, 0.6666667, 1,
1.188917, 0.1247008, 2.209001, 1, 0, 0.6588235, 1,
1.195945, 0.4187302, 1.457194, 1, 0, 0.654902, 1,
1.196993, 0.5111974, 2.211857, 1, 0, 0.6470588, 1,
1.197697, 0.04073821, 1.56973, 1, 0, 0.6431373, 1,
1.198007, 0.1182761, 0.8645062, 1, 0, 0.6352941, 1,
1.19846, 0.2620003, 1.041559, 1, 0, 0.6313726, 1,
1.206555, -0.09441933, 1.514005, 1, 0, 0.6235294, 1,
1.214706, -1.151143, 1.832679, 1, 0, 0.6196079, 1,
1.233626, 0.6151146, -0.09162641, 1, 0, 0.6117647, 1,
1.237582, -0.2909788, 2.401903, 1, 0, 0.6078432, 1,
1.239772, -0.706358, 0.4246597, 1, 0, 0.6, 1,
1.256812, 2.43736, -1.043759, 1, 0, 0.5921569, 1,
1.258936, 1.563153, 0.2368676, 1, 0, 0.5882353, 1,
1.275132, 0.9189512, 0.6357706, 1, 0, 0.5803922, 1,
1.277521, -1.651434, 2.663583, 1, 0, 0.5764706, 1,
1.296853, 0.04649671, 0.02702767, 1, 0, 0.5686275, 1,
1.298056, -0.9187158, 1.905121, 1, 0, 0.5647059, 1,
1.302248, 1.176273, 1.042035, 1, 0, 0.5568628, 1,
1.305926, -0.0288038, 2.302189, 1, 0, 0.5529412, 1,
1.309078, 1.168412, -0.6963341, 1, 0, 0.5450981, 1,
1.309868, -0.3493915, 2.148442, 1, 0, 0.5411765, 1,
1.310305, 1.301522, 1.720237, 1, 0, 0.5333334, 1,
1.324209, 0.439618, 2.073187, 1, 0, 0.5294118, 1,
1.329059, 0.2814482, 1.499394, 1, 0, 0.5215687, 1,
1.338106, -0.3775906, 1.667249, 1, 0, 0.5176471, 1,
1.368276, -0.1373754, 0.4586735, 1, 0, 0.509804, 1,
1.37462, 1.396452, 1.161357, 1, 0, 0.5058824, 1,
1.37774, 0.4406036, 2.834934, 1, 0, 0.4980392, 1,
1.398409, 1.23593, 0.6455454, 1, 0, 0.4901961, 1,
1.400341, 1.633375, -0.3583022, 1, 0, 0.4862745, 1,
1.401214, -0.5759152, 0.8091117, 1, 0, 0.4784314, 1,
1.404515, -0.5014843, 2.199636, 1, 0, 0.4745098, 1,
1.423891, -1.428309, 1.278525, 1, 0, 0.4666667, 1,
1.426297, -0.4487906, 3.215756, 1, 0, 0.4627451, 1,
1.432641, 0.950102, 1.855904, 1, 0, 0.454902, 1,
1.437264, -0.3649161, 3.735924, 1, 0, 0.4509804, 1,
1.442888, 0.5305946, 2.528998, 1, 0, 0.4431373, 1,
1.460631, 1.048569, -0.248366, 1, 0, 0.4392157, 1,
1.462335, 0.7439111, 2.399919, 1, 0, 0.4313726, 1,
1.463212, 0.01231655, 0.6638445, 1, 0, 0.427451, 1,
1.471448, -0.4543699, 1.408799, 1, 0, 0.4196078, 1,
1.47611, -0.6026116, 2.371547, 1, 0, 0.4156863, 1,
1.483761, 0.5355092, 1.003942, 1, 0, 0.4078431, 1,
1.484378, 1.527642, 0.8661081, 1, 0, 0.4039216, 1,
1.509862, -0.715874, 2.779567, 1, 0, 0.3960784, 1,
1.51194, 0.2935887, 1.326664, 1, 0, 0.3882353, 1,
1.521757, -0.669708, 3.06486, 1, 0, 0.3843137, 1,
1.545086, -1.116624, 2.729437, 1, 0, 0.3764706, 1,
1.552139, -0.02539576, 1.964505, 1, 0, 0.372549, 1,
1.553785, 0.5156109, 0.02568111, 1, 0, 0.3647059, 1,
1.555748, -1.220076, 2.21261, 1, 0, 0.3607843, 1,
1.563763, -0.1991576, 0.5810294, 1, 0, 0.3529412, 1,
1.576109, -2.573158, 1.93798, 1, 0, 0.3490196, 1,
1.577038, -1.268624, 2.585993, 1, 0, 0.3411765, 1,
1.579539, -0.08130136, 1.890858, 1, 0, 0.3372549, 1,
1.580001, 1.378795, 0.5540551, 1, 0, 0.3294118, 1,
1.604744, 0.8660072, 0.6300719, 1, 0, 0.3254902, 1,
1.607765, -0.1824924, 3.268723, 1, 0, 0.3176471, 1,
1.618148, 1.460697, 1.320294, 1, 0, 0.3137255, 1,
1.634261, -0.1914949, 1.554666, 1, 0, 0.3058824, 1,
1.646381, 1.39721, -0.4111552, 1, 0, 0.2980392, 1,
1.648525, 1.264736, -0.4938374, 1, 0, 0.2941177, 1,
1.669765, 1.054595, 3.822722, 1, 0, 0.2862745, 1,
1.671735, 1.384836, 1.179458, 1, 0, 0.282353, 1,
1.679694, -0.6775815, 3.590722, 1, 0, 0.2745098, 1,
1.687724, -0.9279271, 2.617967, 1, 0, 0.2705882, 1,
1.689085, 0.8757935, 0.2038445, 1, 0, 0.2627451, 1,
1.697385, -0.1259743, 2.197515, 1, 0, 0.2588235, 1,
1.704426, 1.870881, -1.101718, 1, 0, 0.2509804, 1,
1.71698, -0.8499629, 1.149415, 1, 0, 0.2470588, 1,
1.717255, -1.525291, 3.270505, 1, 0, 0.2392157, 1,
1.735492, -0.2620785, 1.061513, 1, 0, 0.2352941, 1,
1.742147, -0.4294774, 2.305112, 1, 0, 0.227451, 1,
1.760799, -0.8865366, 1.358211, 1, 0, 0.2235294, 1,
1.772771, -0.365352, 3.027409, 1, 0, 0.2156863, 1,
1.779021, 1.139659, 1.582054, 1, 0, 0.2117647, 1,
1.795333, 0.961714, 1.547182, 1, 0, 0.2039216, 1,
1.824409, 0.172343, 1.655682, 1, 0, 0.1960784, 1,
1.858406, -0.9926884, 3.436228, 1, 0, 0.1921569, 1,
1.87593, -0.4442807, 2.199784, 1, 0, 0.1843137, 1,
1.91085, -0.5867758, 1.622666, 1, 0, 0.1803922, 1,
1.912838, -0.8799582, 3.087135, 1, 0, 0.172549, 1,
1.928095, 0.2413138, 0.9531726, 1, 0, 0.1686275, 1,
1.946382, -1.885015, 1.70074, 1, 0, 0.1607843, 1,
1.967684, -0.8402377, 3.684477, 1, 0, 0.1568628, 1,
1.972446, 0.8848295, 0.9589449, 1, 0, 0.1490196, 1,
1.973062, -0.8185664, 1.593753, 1, 0, 0.145098, 1,
2.001299, 0.06322082, 2.357566, 1, 0, 0.1372549, 1,
2.012578, 0.8782998, 0.8938856, 1, 0, 0.1333333, 1,
2.018682, -0.01825732, 0.7058643, 1, 0, 0.1254902, 1,
2.061592, 1.016474, 0.1008957, 1, 0, 0.1215686, 1,
2.066012, 0.05409905, 2.900652, 1, 0, 0.1137255, 1,
2.066764, 0.950608, 2.182437, 1, 0, 0.1098039, 1,
2.11518, -0.1407277, 2.704193, 1, 0, 0.1019608, 1,
2.20183, 0.6989874, 2.722165, 1, 0, 0.09411765, 1,
2.20599, 0.8785621, 0.8906901, 1, 0, 0.09019608, 1,
2.23976, -0.437465, 2.070921, 1, 0, 0.08235294, 1,
2.285755, 2.004391, 0.5105531, 1, 0, 0.07843138, 1,
2.300521, -1.246567, 2.694097, 1, 0, 0.07058824, 1,
2.308293, -1.64089, 2.609169, 1, 0, 0.06666667, 1,
2.332569, -0.1746424, 1.781236, 1, 0, 0.05882353, 1,
2.353494, 0.4117703, 0.7944706, 1, 0, 0.05490196, 1,
2.379118, -0.7705637, 1.723806, 1, 0, 0.04705882, 1,
2.416795, 0.3556108, 2.505681, 1, 0, 0.04313726, 1,
2.448035, 0.1534966, 1.549785, 1, 0, 0.03529412, 1,
2.470423, 1.844753, 1.752156, 1, 0, 0.03137255, 1,
2.528958, -0.4330804, 2.135028, 1, 0, 0.02352941, 1,
2.678573, -0.7485172, 2.575222, 1, 0, 0.01960784, 1,
2.902715, 0.4606551, 3.259804, 1, 0, 0.01176471, 1,
2.937637, 0.2242505, 1.869199, 1, 0, 0.007843138, 1
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
-0.1586864, -4.165182, -6.972057, 0, -0.5, 0.5, 0.5,
-0.1586864, -4.165182, -6.972057, 1, -0.5, 0.5, 0.5,
-0.1586864, -4.165182, -6.972057, 1, 1.5, 0.5, 0.5,
-0.1586864, -4.165182, -6.972057, 0, 1.5, 0.5, 0.5
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
-4.304663, 0.08618784, -6.972057, 0, -0.5, 0.5, 0.5,
-4.304663, 0.08618784, -6.972057, 1, -0.5, 0.5, 0.5,
-4.304663, 0.08618784, -6.972057, 1, 1.5, 0.5, 0.5,
-4.304663, 0.08618784, -6.972057, 0, 1.5, 0.5, 0.5
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
-4.304663, -4.165182, 0.4789772, 0, -0.5, 0.5, 0.5,
-4.304663, -4.165182, 0.4789772, 1, -0.5, 0.5, 0.5,
-4.304663, -4.165182, 0.4789772, 1, 1.5, 0.5, 0.5,
-4.304663, -4.165182, 0.4789772, 0, 1.5, 0.5, 0.5
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
-3, -3.184097, -5.252587,
2, -3.184097, -5.252587,
-3, -3.184097, -5.252587,
-3, -3.347611, -5.539165,
-2, -3.184097, -5.252587,
-2, -3.347611, -5.539165,
-1, -3.184097, -5.252587,
-1, -3.347611, -5.539165,
0, -3.184097, -5.252587,
0, -3.347611, -5.539165,
1, -3.184097, -5.252587,
1, -3.347611, -5.539165,
2, -3.184097, -5.252587,
2, -3.347611, -5.539165
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
-3, -3.674639, -6.112322, 0, -0.5, 0.5, 0.5,
-3, -3.674639, -6.112322, 1, -0.5, 0.5, 0.5,
-3, -3.674639, -6.112322, 1, 1.5, 0.5, 0.5,
-3, -3.674639, -6.112322, 0, 1.5, 0.5, 0.5,
-2, -3.674639, -6.112322, 0, -0.5, 0.5, 0.5,
-2, -3.674639, -6.112322, 1, -0.5, 0.5, 0.5,
-2, -3.674639, -6.112322, 1, 1.5, 0.5, 0.5,
-2, -3.674639, -6.112322, 0, 1.5, 0.5, 0.5,
-1, -3.674639, -6.112322, 0, -0.5, 0.5, 0.5,
-1, -3.674639, -6.112322, 1, -0.5, 0.5, 0.5,
-1, -3.674639, -6.112322, 1, 1.5, 0.5, 0.5,
-1, -3.674639, -6.112322, 0, 1.5, 0.5, 0.5,
0, -3.674639, -6.112322, 0, -0.5, 0.5, 0.5,
0, -3.674639, -6.112322, 1, -0.5, 0.5, 0.5,
0, -3.674639, -6.112322, 1, 1.5, 0.5, 0.5,
0, -3.674639, -6.112322, 0, 1.5, 0.5, 0.5,
1, -3.674639, -6.112322, 0, -0.5, 0.5, 0.5,
1, -3.674639, -6.112322, 1, -0.5, 0.5, 0.5,
1, -3.674639, -6.112322, 1, 1.5, 0.5, 0.5,
1, -3.674639, -6.112322, 0, 1.5, 0.5, 0.5,
2, -3.674639, -6.112322, 0, -0.5, 0.5, 0.5,
2, -3.674639, -6.112322, 1, -0.5, 0.5, 0.5,
2, -3.674639, -6.112322, 1, 1.5, 0.5, 0.5,
2, -3.674639, -6.112322, 0, 1.5, 0.5, 0.5
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
-3.347899, -3, -5.252587,
-3.347899, 3, -5.252587,
-3.347899, -3, -5.252587,
-3.50736, -3, -5.539165,
-3.347899, -2, -5.252587,
-3.50736, -2, -5.539165,
-3.347899, -1, -5.252587,
-3.50736, -1, -5.539165,
-3.347899, 0, -5.252587,
-3.50736, 0, -5.539165,
-3.347899, 1, -5.252587,
-3.50736, 1, -5.539165,
-3.347899, 2, -5.252587,
-3.50736, 2, -5.539165,
-3.347899, 3, -5.252587,
-3.50736, 3, -5.539165
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
-3.826281, -3, -6.112322, 0, -0.5, 0.5, 0.5,
-3.826281, -3, -6.112322, 1, -0.5, 0.5, 0.5,
-3.826281, -3, -6.112322, 1, 1.5, 0.5, 0.5,
-3.826281, -3, -6.112322, 0, 1.5, 0.5, 0.5,
-3.826281, -2, -6.112322, 0, -0.5, 0.5, 0.5,
-3.826281, -2, -6.112322, 1, -0.5, 0.5, 0.5,
-3.826281, -2, -6.112322, 1, 1.5, 0.5, 0.5,
-3.826281, -2, -6.112322, 0, 1.5, 0.5, 0.5,
-3.826281, -1, -6.112322, 0, -0.5, 0.5, 0.5,
-3.826281, -1, -6.112322, 1, -0.5, 0.5, 0.5,
-3.826281, -1, -6.112322, 1, 1.5, 0.5, 0.5,
-3.826281, -1, -6.112322, 0, 1.5, 0.5, 0.5,
-3.826281, 0, -6.112322, 0, -0.5, 0.5, 0.5,
-3.826281, 0, -6.112322, 1, -0.5, 0.5, 0.5,
-3.826281, 0, -6.112322, 1, 1.5, 0.5, 0.5,
-3.826281, 0, -6.112322, 0, 1.5, 0.5, 0.5,
-3.826281, 1, -6.112322, 0, -0.5, 0.5, 0.5,
-3.826281, 1, -6.112322, 1, -0.5, 0.5, 0.5,
-3.826281, 1, -6.112322, 1, 1.5, 0.5, 0.5,
-3.826281, 1, -6.112322, 0, 1.5, 0.5, 0.5,
-3.826281, 2, -6.112322, 0, -0.5, 0.5, 0.5,
-3.826281, 2, -6.112322, 1, -0.5, 0.5, 0.5,
-3.826281, 2, -6.112322, 1, 1.5, 0.5, 0.5,
-3.826281, 2, -6.112322, 0, 1.5, 0.5, 0.5,
-3.826281, 3, -6.112322, 0, -0.5, 0.5, 0.5,
-3.826281, 3, -6.112322, 1, -0.5, 0.5, 0.5,
-3.826281, 3, -6.112322, 1, 1.5, 0.5, 0.5,
-3.826281, 3, -6.112322, 0, 1.5, 0.5, 0.5
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
-3.347899, -3.184097, -4,
-3.347899, -3.184097, 6,
-3.347899, -3.184097, -4,
-3.50736, -3.347611, -4,
-3.347899, -3.184097, -2,
-3.50736, -3.347611, -2,
-3.347899, -3.184097, 0,
-3.50736, -3.347611, 0,
-3.347899, -3.184097, 2,
-3.50736, -3.347611, 2,
-3.347899, -3.184097, 4,
-3.50736, -3.347611, 4,
-3.347899, -3.184097, 6,
-3.50736, -3.347611, 6
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
"4",
"6"
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
-3.826281, -3.674639, -4, 0, -0.5, 0.5, 0.5,
-3.826281, -3.674639, -4, 1, -0.5, 0.5, 0.5,
-3.826281, -3.674639, -4, 1, 1.5, 0.5, 0.5,
-3.826281, -3.674639, -4, 0, 1.5, 0.5, 0.5,
-3.826281, -3.674639, -2, 0, -0.5, 0.5, 0.5,
-3.826281, -3.674639, -2, 1, -0.5, 0.5, 0.5,
-3.826281, -3.674639, -2, 1, 1.5, 0.5, 0.5,
-3.826281, -3.674639, -2, 0, 1.5, 0.5, 0.5,
-3.826281, -3.674639, 0, 0, -0.5, 0.5, 0.5,
-3.826281, -3.674639, 0, 1, -0.5, 0.5, 0.5,
-3.826281, -3.674639, 0, 1, 1.5, 0.5, 0.5,
-3.826281, -3.674639, 0, 0, 1.5, 0.5, 0.5,
-3.826281, -3.674639, 2, 0, -0.5, 0.5, 0.5,
-3.826281, -3.674639, 2, 1, -0.5, 0.5, 0.5,
-3.826281, -3.674639, 2, 1, 1.5, 0.5, 0.5,
-3.826281, -3.674639, 2, 0, 1.5, 0.5, 0.5,
-3.826281, -3.674639, 4, 0, -0.5, 0.5, 0.5,
-3.826281, -3.674639, 4, 1, -0.5, 0.5, 0.5,
-3.826281, -3.674639, 4, 1, 1.5, 0.5, 0.5,
-3.826281, -3.674639, 4, 0, 1.5, 0.5, 0.5,
-3.826281, -3.674639, 6, 0, -0.5, 0.5, 0.5,
-3.826281, -3.674639, 6, 1, -0.5, 0.5, 0.5,
-3.826281, -3.674639, 6, 1, 1.5, 0.5, 0.5,
-3.826281, -3.674639, 6, 0, 1.5, 0.5, 0.5
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
-3.347899, -3.184097, -5.252587,
-3.347899, 3.356472, -5.252587,
-3.347899, -3.184097, 6.210542,
-3.347899, 3.356472, 6.210542,
-3.347899, -3.184097, -5.252587,
-3.347899, -3.184097, 6.210542,
-3.347899, 3.356472, -5.252587,
-3.347899, 3.356472, 6.210542,
-3.347899, -3.184097, -5.252587,
3.030526, -3.184097, -5.252587,
-3.347899, -3.184097, 6.210542,
3.030526, -3.184097, 6.210542,
-3.347899, 3.356472, -5.252587,
3.030526, 3.356472, -5.252587,
-3.347899, 3.356472, 6.210542,
3.030526, 3.356472, 6.210542,
3.030526, -3.184097, -5.252587,
3.030526, 3.356472, -5.252587,
3.030526, -3.184097, 6.210542,
3.030526, 3.356472, 6.210542,
3.030526, -3.184097, -5.252587,
3.030526, -3.184097, 6.210542,
3.030526, 3.356472, -5.252587,
3.030526, 3.356472, 6.210542
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
var radius = 7.827264;
var distance = 34.82438;
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
mvMatrix.translate( 0.1586864, -0.08618784, -0.4789772 );
mvMatrix.scale( 1.326815, 1.293923, 0.7382793 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.82438);
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
Di-n-propylether<-read.table("Di-n-propylether.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Di-n-propylether$V2
```

```
## Error in eval(expr, envir, enclos): object 'Di' not found
```

```r
y<-Di-n-propylether$V3
```

```
## Error in eval(expr, envir, enclos): object 'Di' not found
```

```r
z<-Di-n-propylether$V4
```

```
## Error in eval(expr, envir, enclos): object 'Di' not found
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
-3.255009, 0.09090008, -2.964049, 0, 0, 1, 1, 1,
-3.087691, 0.2019681, -2.06344, 1, 0, 0, 1, 1,
-2.846179, -1.390629, -2.901748, 1, 0, 0, 1, 1,
-2.722069, -0.006435428, -1.487004, 1, 0, 0, 1, 1,
-2.686771, -1.077351, -1.322594, 1, 0, 0, 1, 1,
-2.636771, -0.3270499, -1.292042, 1, 0, 0, 1, 1,
-2.625805, 1.11956, -1.989013, 0, 0, 0, 1, 1,
-2.590057, 1.330138, -1.491917, 0, 0, 0, 1, 1,
-2.54056, -0.4460173, -1.00037, 0, 0, 0, 1, 1,
-2.517077, 0.004183794, -0.5220552, 0, 0, 0, 1, 1,
-2.493164, -1.71847, -2.483421, 0, 0, 0, 1, 1,
-2.442239, 0.03249203, -3.055242, 0, 0, 0, 1, 1,
-2.415454, 0.4371342, -1.103943, 0, 0, 0, 1, 1,
-2.397593, 0.6804824, -2.220865, 1, 1, 1, 1, 1,
-2.32829, -0.1236149, -2.489507, 1, 1, 1, 1, 1,
-2.287876, 0.04372101, -2.608307, 1, 1, 1, 1, 1,
-2.279422, 0.769104, -1.939514, 1, 1, 1, 1, 1,
-2.25492, 0.5142018, -2.263426, 1, 1, 1, 1, 1,
-2.254033, -1.93912, -3.091213, 1, 1, 1, 1, 1,
-2.203006, -0.7895259, -2.870672, 1, 1, 1, 1, 1,
-2.189575, -1.193814, 0.6216925, 1, 1, 1, 1, 1,
-2.183553, -1.802605, -2.00209, 1, 1, 1, 1, 1,
-2.161221, -0.1080282, -2.632489, 1, 1, 1, 1, 1,
-2.100878, -0.2178152, -0.5676831, 1, 1, 1, 1, 1,
-2.074809, 1.254639, -1.569388, 1, 1, 1, 1, 1,
-2.066349, -1.271728, -2.715656, 1, 1, 1, 1, 1,
-2.065911, -1.733204, -1.933775, 1, 1, 1, 1, 1,
-2.041778, -0.4440561, -1.082818, 1, 1, 1, 1, 1,
-2.007836, -0.5048687, -0.5900007, 0, 0, 1, 1, 1,
-1.990121, -0.3192447, -1.152385, 1, 0, 0, 1, 1,
-1.981798, 0.8803562, -1.477856, 1, 0, 0, 1, 1,
-1.980744, -0.595892, -1.978588, 1, 0, 0, 1, 1,
-1.975973, -1.255509, -2.363224, 1, 0, 0, 1, 1,
-1.972322, -0.6854442, -2.021015, 1, 0, 0, 1, 1,
-1.968743, -0.03522777, -2.275385, 0, 0, 0, 1, 1,
-1.943766, 0.3487294, -2.663099, 0, 0, 0, 1, 1,
-1.94098, -1.332509, -1.841034, 0, 0, 0, 1, 1,
-1.812916, -0.1714011, -1.45702, 0, 0, 0, 1, 1,
-1.810406, 1.914879, -2.49534, 0, 0, 0, 1, 1,
-1.795417, 1.068798, -1.308211, 0, 0, 0, 1, 1,
-1.78523, 0.2430691, -2.431893, 0, 0, 0, 1, 1,
-1.781361, -2.785171, -3.173177, 1, 1, 1, 1, 1,
-1.779065, 0.2219906, -0.3719272, 1, 1, 1, 1, 1,
-1.752759, 1.206554, -1.50074, 1, 1, 1, 1, 1,
-1.737847, 0.1034731, -1.655837, 1, 1, 1, 1, 1,
-1.725979, -1.469562, -2.828899, 1, 1, 1, 1, 1,
-1.720074, -0.4886135, -1.973453, 1, 1, 1, 1, 1,
-1.716879, -0.3779109, -0.8614923, 1, 1, 1, 1, 1,
-1.71332, 0.9370909, -2.775266, 1, 1, 1, 1, 1,
-1.706153, -0.5883898, -1.42048, 1, 1, 1, 1, 1,
-1.70061, -1.103776, -2.597157, 1, 1, 1, 1, 1,
-1.666507, 0.4512736, -0.02632694, 1, 1, 1, 1, 1,
-1.657293, 0.217836, 1.050339, 1, 1, 1, 1, 1,
-1.648429, -1.219745, -1.95971, 1, 1, 1, 1, 1,
-1.642519, -0.3294604, -1.343455, 1, 1, 1, 1, 1,
-1.640327, 0.3320363, -1.448889, 1, 1, 1, 1, 1,
-1.628585, 0.3466833, -0.903268, 0, 0, 1, 1, 1,
-1.61642, 0.4455348, -0.1255823, 1, 0, 0, 1, 1,
-1.596078, 0.4938641, -1.907695, 1, 0, 0, 1, 1,
-1.579893, -1.552326, -2.241242, 1, 0, 0, 1, 1,
-1.571408, 1.207018, -0.9169781, 1, 0, 0, 1, 1,
-1.567767, -0.2152104, -1.245517, 1, 0, 0, 1, 1,
-1.567464, 1.974266, -0.5071136, 0, 0, 0, 1, 1,
-1.563655, 1.217761, -1.606071, 0, 0, 0, 1, 1,
-1.552825, -0.06633303, -3.087909, 0, 0, 0, 1, 1,
-1.546036, 0.6233238, -0.2152198, 0, 0, 0, 1, 1,
-1.539551, -0.8505254, -2.800649, 0, 0, 0, 1, 1,
-1.534448, -0.5077531, -2.124975, 0, 0, 0, 1, 1,
-1.528592, 0.8126764, 0.7646431, 0, 0, 0, 1, 1,
-1.523321, -0.7652281, -3.186983, 1, 1, 1, 1, 1,
-1.522281, -0.4572717, -4.965984, 1, 1, 1, 1, 1,
-1.514825, -0.1097539, -0.256446, 1, 1, 1, 1, 1,
-1.506955, -1.336086, -1.779023, 1, 1, 1, 1, 1,
-1.503551, 1.092231, -1.561108, 1, 1, 1, 1, 1,
-1.503318, -0.5127398, -4.436893, 1, 1, 1, 1, 1,
-1.495059, -0.9338307, -1.285511, 1, 1, 1, 1, 1,
-1.488823, 0.6444417, -2.224863, 1, 1, 1, 1, 1,
-1.470627, 0.4308656, 0.395859, 1, 1, 1, 1, 1,
-1.464012, 0.8121028, -2.277635, 1, 1, 1, 1, 1,
-1.458923, -0.03522627, -2.278574, 1, 1, 1, 1, 1,
-1.447855, 0.4022399, -1.028699, 1, 1, 1, 1, 1,
-1.445047, -1.147929, -3.728948, 1, 1, 1, 1, 1,
-1.431121, -0.1755698, -1.560647, 1, 1, 1, 1, 1,
-1.418628, -1.031844, -0.466904, 1, 1, 1, 1, 1,
-1.406393, -1.184476, -2.345565, 0, 0, 1, 1, 1,
-1.403902, -2.432929, -3.01166, 1, 0, 0, 1, 1,
-1.391642, -2.417752, -2.163143, 1, 0, 0, 1, 1,
-1.383946, 1.611526, 0.06807063, 1, 0, 0, 1, 1,
-1.379493, 0.2974827, -1.868041, 1, 0, 0, 1, 1,
-1.368872, -2.499667, -4.132388, 1, 0, 0, 1, 1,
-1.368695, -0.900519, -0.9705247, 0, 0, 0, 1, 1,
-1.367682, 1.884407, 0.2650091, 0, 0, 0, 1, 1,
-1.352164, 0.7554023, -1.936756, 0, 0, 0, 1, 1,
-1.317459, 0.9680211, -1.895399, 0, 0, 0, 1, 1,
-1.313547, 0.8051897, -0.2103988, 0, 0, 0, 1, 1,
-1.313149, -0.607698, -1.560352, 0, 0, 0, 1, 1,
-1.308981, 1.393086, -0.3898479, 0, 0, 0, 1, 1,
-1.306126, 0.7773329, -1.563092, 1, 1, 1, 1, 1,
-1.301766, 3.141291, 0.5299335, 1, 1, 1, 1, 1,
-1.282834, 0.1015139, -0.7139811, 1, 1, 1, 1, 1,
-1.281206, -1.511792, -1.940833, 1, 1, 1, 1, 1,
-1.277968, 0.3059438, -1.294401, 1, 1, 1, 1, 1,
-1.271392, -0.529494, -3.132946, 1, 1, 1, 1, 1,
-1.266062, 0.2572179, -1.595153, 1, 1, 1, 1, 1,
-1.264027, -0.9433666, -4.130643, 1, 1, 1, 1, 1,
-1.252658, 0.6428397, -0.5076163, 1, 1, 1, 1, 1,
-1.241045, -0.4646248, -3.61037, 1, 1, 1, 1, 1,
-1.240494, -0.616461, -1.29921, 1, 1, 1, 1, 1,
-1.239696, 0.1294575, -0.5838282, 1, 1, 1, 1, 1,
-1.239394, 0.3945383, -1.050302, 1, 1, 1, 1, 1,
-1.228965, 0.8364164, -0.2239041, 1, 1, 1, 1, 1,
-1.225424, -0.01104668, -1.187098, 1, 1, 1, 1, 1,
-1.221714, -1.179676, 0.4877118, 0, 0, 1, 1, 1,
-1.217375, -0.3429471, -1.235062, 1, 0, 0, 1, 1,
-1.215641, 1.331799, -0.3611186, 1, 0, 0, 1, 1,
-1.213772, -0.2419129, -1.617368, 1, 0, 0, 1, 1,
-1.213143, -0.7513136, -2.637325, 1, 0, 0, 1, 1,
-1.208002, 1.366179, 0.2911462, 1, 0, 0, 1, 1,
-1.195753, -0.4395957, 0.1454837, 0, 0, 0, 1, 1,
-1.194498, -0.8718736, -2.140304, 0, 0, 0, 1, 1,
-1.186842, -1.137753, -2.47098, 0, 0, 0, 1, 1,
-1.184921, -0.4077733, -2.224507, 0, 0, 0, 1, 1,
-1.182151, 0.7374655, -1.814382, 0, 0, 0, 1, 1,
-1.181916, 0.3161596, -0.5491139, 0, 0, 0, 1, 1,
-1.177421, 1.974167, -1.268364, 0, 0, 0, 1, 1,
-1.163349, -0.7979701, -0.4628701, 1, 1, 1, 1, 1,
-1.160946, -1.300714, -2.909293, 1, 1, 1, 1, 1,
-1.160781, -1.287438, -2.35209, 1, 1, 1, 1, 1,
-1.160135, 1.819786, -0.3256255, 1, 1, 1, 1, 1,
-1.157086, -0.8795258, -3.917129, 1, 1, 1, 1, 1,
-1.153441, -0.2504023, -3.935215, 1, 1, 1, 1, 1,
-1.145183, -1.437067, -3.060157, 1, 1, 1, 1, 1,
-1.144412, -1.200452, -2.522258, 1, 1, 1, 1, 1,
-1.144071, 0.6199628, -0.3733191, 1, 1, 1, 1, 1,
-1.141003, -1.43086, -2.598615, 1, 1, 1, 1, 1,
-1.138382, -0.3408467, -1.117601, 1, 1, 1, 1, 1,
-1.133448, -0.9106899, -1.449182, 1, 1, 1, 1, 1,
-1.110564, 1.273765, 1.0691, 1, 1, 1, 1, 1,
-1.101862, -0.3540795, -1.197868, 1, 1, 1, 1, 1,
-1.098369, 0.2064341, -0.09386602, 1, 1, 1, 1, 1,
-1.097809, 0.5822048, 0.7171187, 0, 0, 1, 1, 1,
-1.096777, 1.191588, -2.804362, 1, 0, 0, 1, 1,
-1.090715, -0.01073524, -2.392607, 1, 0, 0, 1, 1,
-1.085741, -0.495704, -3.616836, 1, 0, 0, 1, 1,
-1.082304, 0.2758137, -2.16819, 1, 0, 0, 1, 1,
-1.078088, -0.1156703, -1.147483, 1, 0, 0, 1, 1,
-1.068867, -0.6668317, -1.267579, 0, 0, 0, 1, 1,
-1.052474, 0.688428, -2.427158, 0, 0, 0, 1, 1,
-1.044671, 0.365107, -0.6563595, 0, 0, 0, 1, 1,
-1.038187, -0.6522746, -2.685755, 0, 0, 0, 1, 1,
-1.033434, 1.166134, 1.330507, 0, 0, 0, 1, 1,
-1.032561, -0.5903739, -2.099385, 0, 0, 0, 1, 1,
-1.026152, -1.050865, -2.247866, 0, 0, 0, 1, 1,
-1.020463, -0.5293255, -2.248114, 1, 1, 1, 1, 1,
-1.017501, 1.628209, -0.4432548, 1, 1, 1, 1, 1,
-1.014618, 0.2189426, -2.482983, 1, 1, 1, 1, 1,
-1.013383, 0.7494214, -1.777843, 1, 1, 1, 1, 1,
-1.013253, 0.5903298, -0.6680397, 1, 1, 1, 1, 1,
-1.012872, 1.221024, -0.2838983, 1, 1, 1, 1, 1,
-1.01187, -1.249314, -0.1873369, 1, 1, 1, 1, 1,
-0.9979339, -1.287863, -1.407818, 1, 1, 1, 1, 1,
-0.9954816, 1.225941, -1.484014, 1, 1, 1, 1, 1,
-0.9944225, -0.3181456, -1.263937, 1, 1, 1, 1, 1,
-0.9908053, -0.3942402, -2.06316, 1, 1, 1, 1, 1,
-0.988484, -0.7094887, -3.238607, 1, 1, 1, 1, 1,
-0.9854873, -0.9953298, -3.665136, 1, 1, 1, 1, 1,
-0.9815009, -0.1365282, -2.141949, 1, 1, 1, 1, 1,
-0.9810612, -0.07924367, -0.9922025, 1, 1, 1, 1, 1,
-0.979821, -0.126981, -2.224795, 0, 0, 1, 1, 1,
-0.9787262, 0.2326391, 0.3197676, 1, 0, 0, 1, 1,
-0.9777977, 0.8525426, -0.07161126, 1, 0, 0, 1, 1,
-0.9761032, -0.2078342, -2.906991, 1, 0, 0, 1, 1,
-0.9733998, -1.142257, -2.585611, 1, 0, 0, 1, 1,
-0.9724973, 1.393693, 0.3467742, 1, 0, 0, 1, 1,
-0.9619941, -0.4206119, -0.8437027, 0, 0, 0, 1, 1,
-0.9484654, 0.04676899, -2.850489, 0, 0, 0, 1, 1,
-0.94757, -0.7129372, -2.00912, 0, 0, 0, 1, 1,
-0.9441177, 0.3589825, -1.875341, 0, 0, 0, 1, 1,
-0.9352567, -0.3174838, 0.6029699, 0, 0, 0, 1, 1,
-0.9348688, -0.2645524, -1.392946, 0, 0, 0, 1, 1,
-0.9347662, -1.251428, -0.9883828, 0, 0, 0, 1, 1,
-0.9335108, -0.1272162, -1.365052, 1, 1, 1, 1, 1,
-0.9330898, -0.2455598, -2.207462, 1, 1, 1, 1, 1,
-0.9315646, -0.01434026, -1.576931, 1, 1, 1, 1, 1,
-0.9295272, -1.030768, -1.562513, 1, 1, 1, 1, 1,
-0.9227644, 0.6806548, -2.523455, 1, 1, 1, 1, 1,
-0.915311, -0.8130017, -1.12191, 1, 1, 1, 1, 1,
-0.9149249, 0.4608926, -2.520575, 1, 1, 1, 1, 1,
-0.912357, -0.399324, -0.7890792, 1, 1, 1, 1, 1,
-0.9090072, 1.319818, -0.6522448, 1, 1, 1, 1, 1,
-0.9068485, -0.9028417, -2.722251, 1, 1, 1, 1, 1,
-0.903682, -1.541529, -2.632634, 1, 1, 1, 1, 1,
-0.9033413, 0.5544063, 0.2314745, 1, 1, 1, 1, 1,
-0.9026985, -2.12285, -3.133222, 1, 1, 1, 1, 1,
-0.8955961, 1.660038, -0.356949, 1, 1, 1, 1, 1,
-0.8949465, 0.002778234, -3.052246, 1, 1, 1, 1, 1,
-0.8881787, 0.3222989, -1.957493, 0, 0, 1, 1, 1,
-0.8846259, -0.6997356, -3.806896, 1, 0, 0, 1, 1,
-0.884447, 0.140913, -1.800477, 1, 0, 0, 1, 1,
-0.8794985, -0.9073789, -1.488758, 1, 0, 0, 1, 1,
-0.8790308, 1.182769, -1.882202, 1, 0, 0, 1, 1,
-0.873871, 0.3118978, 0.06767057, 1, 0, 0, 1, 1,
-0.8686434, 2.040005, -1.29173, 0, 0, 0, 1, 1,
-0.8684473, -0.8342692, -2.705686, 0, 0, 0, 1, 1,
-0.867457, 0.8445475, -2.06601, 0, 0, 0, 1, 1,
-0.8660942, -0.3690513, -3.297078, 0, 0, 0, 1, 1,
-0.8659114, 0.4723397, 0.1664956, 0, 0, 0, 1, 1,
-0.8596606, 1.285255, -1.388515, 0, 0, 0, 1, 1,
-0.8584337, 1.646044, 0.9708343, 0, 0, 0, 1, 1,
-0.8571459, -0.4334735, -1.880937, 1, 1, 1, 1, 1,
-0.8571, 2.12009, -1.802371, 1, 1, 1, 1, 1,
-0.8548183, -0.009445224, -1.753825, 1, 1, 1, 1, 1,
-0.8499082, -1.133072, -5.085649, 1, 1, 1, 1, 1,
-0.8446931, 0.3384956, -1.448721, 1, 1, 1, 1, 1,
-0.8426705, 0.5001562, -1.511474, 1, 1, 1, 1, 1,
-0.8394791, -0.847586, -2.590848, 1, 1, 1, 1, 1,
-0.8364872, -0.7078065, -1.812258, 1, 1, 1, 1, 1,
-0.8163304, 0.4121378, -0.4309051, 1, 1, 1, 1, 1,
-0.8123766, 0.6072664, -0.5509663, 1, 1, 1, 1, 1,
-0.807018, 0.8873999, -0.4512588, 1, 1, 1, 1, 1,
-0.7961313, -2.246244, -3.632375, 1, 1, 1, 1, 1,
-0.7917395, -1.889015, -3.105377, 1, 1, 1, 1, 1,
-0.7895718, -0.5799428, -2.514182, 1, 1, 1, 1, 1,
-0.7886617, 0.6369441, -0.7394819, 1, 1, 1, 1, 1,
-0.7845666, -1.024435, -3.43233, 0, 0, 1, 1, 1,
-0.7806337, 0.09040073, 0.18252, 1, 0, 0, 1, 1,
-0.7783049, 0.2953939, -0.978725, 1, 0, 0, 1, 1,
-0.7782633, -1.136817, -1.866291, 1, 0, 0, 1, 1,
-0.7759875, 0.3389364, -1.571847, 1, 0, 0, 1, 1,
-0.7712963, -1.275962, -2.935457, 1, 0, 0, 1, 1,
-0.7684838, -0.2704965, -1.535086, 0, 0, 0, 1, 1,
-0.7666261, 1.329554, -0.37115, 0, 0, 0, 1, 1,
-0.7621056, 2.58476, 0.4855378, 0, 0, 0, 1, 1,
-0.7606328, 0.8109164, -1.05206, 0, 0, 0, 1, 1,
-0.7543613, 1.915285, 0.112441, 0, 0, 0, 1, 1,
-0.7505802, -0.5032991, -1.89725, 0, 0, 0, 1, 1,
-0.748242, -0.8643445, -2.891557, 0, 0, 0, 1, 1,
-0.7458795, -0.9263738, -1.355962, 1, 1, 1, 1, 1,
-0.7455354, -0.145741, -2.080793, 1, 1, 1, 1, 1,
-0.740554, -0.3012966, -1.926748, 1, 1, 1, 1, 1,
-0.7394567, 1.198023, -0.4868464, 1, 1, 1, 1, 1,
-0.7363864, -1.012539, -2.974363, 1, 1, 1, 1, 1,
-0.7359146, 0.9387308, 1.486325, 1, 1, 1, 1, 1,
-0.7346011, 0.2425547, -0.4508945, 1, 1, 1, 1, 1,
-0.7333536, -2.410869, -2.552124, 1, 1, 1, 1, 1,
-0.7188314, -0.9930035, -2.175444, 1, 1, 1, 1, 1,
-0.7180522, -0.5633036, -3.076362, 1, 1, 1, 1, 1,
-0.7094175, -0.9319831, -3.112538, 1, 1, 1, 1, 1,
-0.7083806, -0.5288677, -2.610356, 1, 1, 1, 1, 1,
-0.7076669, -0.462438, -0.6555555, 1, 1, 1, 1, 1,
-0.7051492, 0.03914163, 0.03037686, 1, 1, 1, 1, 1,
-0.7039638, -0.9005286, -2.956292, 1, 1, 1, 1, 1,
-0.6934323, -0.3104874, -1.93669, 0, 0, 1, 1, 1,
-0.6924621, -0.3055727, -2.506494, 1, 0, 0, 1, 1,
-0.6888327, -0.2991876, -1.635245, 1, 0, 0, 1, 1,
-0.6775554, -0.689331, -3.044312, 1, 0, 0, 1, 1,
-0.6774568, -1.112455, -3.116887, 1, 0, 0, 1, 1,
-0.6731529, 0.7025093, -1.979146, 1, 0, 0, 1, 1,
-0.6692458, 0.9271719, -0.5201879, 0, 0, 0, 1, 1,
-0.6652166, 2.631321, 1.393084, 0, 0, 0, 1, 1,
-0.6641917, 0.2683842, -1.161502, 0, 0, 0, 1, 1,
-0.6451718, 1.175021, 1.305366, 0, 0, 0, 1, 1,
-0.6324157, 1.1361, -0.917133, 0, 0, 0, 1, 1,
-0.6281488, -0.415608, -3.936882, 0, 0, 0, 1, 1,
-0.6233705, -1.282428, -1.738835, 0, 0, 0, 1, 1,
-0.6224674, -0.05503353, -2.477295, 1, 1, 1, 1, 1,
-0.6217824, 0.3832887, -1.688755, 1, 1, 1, 1, 1,
-0.6214458, -1.588294, -1.615819, 1, 1, 1, 1, 1,
-0.6209832, 1.229382, 0.2327696, 1, 1, 1, 1, 1,
-0.6153696, 0.1315902, -2.527458, 1, 1, 1, 1, 1,
-0.6108929, 0.5229206, -0.8391799, 1, 1, 1, 1, 1,
-0.6103001, -1.456465, -3.128391, 1, 1, 1, 1, 1,
-0.6039475, -0.6434348, -1.551548, 1, 1, 1, 1, 1,
-0.602594, 0.07709789, 0.1224377, 1, 1, 1, 1, 1,
-0.6011107, -0.7273438, -2.599894, 1, 1, 1, 1, 1,
-0.6005914, 1.5955, 0.8109471, 1, 1, 1, 1, 1,
-0.6000265, -0.5271527, -0.9668544, 1, 1, 1, 1, 1,
-0.5997235, -1.446803, -1.028761, 1, 1, 1, 1, 1,
-0.5970836, 0.2265209, -1.620205, 1, 1, 1, 1, 1,
-0.5948983, 0.2515817, 0.8867565, 1, 1, 1, 1, 1,
-0.5945148, 0.7266262, -0.3715456, 0, 0, 1, 1, 1,
-0.5913153, -0.3140873, -2.201859, 1, 0, 0, 1, 1,
-0.5882146, 1.399031, 0.9214264, 1, 0, 0, 1, 1,
-0.5876831, -0.6081694, -2.909467, 1, 0, 0, 1, 1,
-0.5826161, 1.397037, 1.093589, 1, 0, 0, 1, 1,
-0.5804784, -0.9927956, -4.437591, 1, 0, 0, 1, 1,
-0.579063, -0.1966124, -1.401159, 0, 0, 0, 1, 1,
-0.5781111, 0.05408815, -1.836161, 0, 0, 0, 1, 1,
-0.5748348, 1.057325, -0.6045431, 0, 0, 0, 1, 1,
-0.5634952, -1.568678, -3.274324, 0, 0, 0, 1, 1,
-0.5627444, -0.2013171, -1.72904, 0, 0, 0, 1, 1,
-0.5605476, 1.001059, -0.6022326, 0, 0, 0, 1, 1,
-0.5593642, -0.04684179, -2.221275, 0, 0, 0, 1, 1,
-0.5591244, -0.5389227, -1.885863, 1, 1, 1, 1, 1,
-0.5499452, 1.790427, -1.410772, 1, 1, 1, 1, 1,
-0.5456186, -0.2647246, -0.9217489, 1, 1, 1, 1, 1,
-0.5455298, -0.33608, -1.127455, 1, 1, 1, 1, 1,
-0.5379916, 0.5555726, -1.622128, 1, 1, 1, 1, 1,
-0.5343548, -0.1652899, -1.630662, 1, 1, 1, 1, 1,
-0.5313376, -0.7406027, -2.820207, 1, 1, 1, 1, 1,
-0.5274082, -1.530344, -3.895364, 1, 1, 1, 1, 1,
-0.5249428, -0.5028113, -3.637586, 1, 1, 1, 1, 1,
-0.5245101, -0.2502373, -1.333113, 1, 1, 1, 1, 1,
-0.5230612, -0.3307523, -2.859383, 1, 1, 1, 1, 1,
-0.5211929, 1.05821, 0.297182, 1, 1, 1, 1, 1,
-0.5198097, 0.04164572, 0.2402205, 1, 1, 1, 1, 1,
-0.5164357, -0.5628926, -3.267732, 1, 1, 1, 1, 1,
-0.5125212, 1.082779, -1.003989, 1, 1, 1, 1, 1,
-0.5063529, 1.123621, -0.3733865, 0, 0, 1, 1, 1,
-0.5055076, 1.235066, -2.309291, 1, 0, 0, 1, 1,
-0.5029752, 2.415662, 0.6320635, 1, 0, 0, 1, 1,
-0.5020674, -0.5411478, -3.512978, 1, 0, 0, 1, 1,
-0.500612, -0.7245678, -2.062519, 1, 0, 0, 1, 1,
-0.4995145, 1.383582, 0.4830512, 1, 0, 0, 1, 1,
-0.4985284, -0.09608249, -2.297939, 0, 0, 0, 1, 1,
-0.4976914, -0.9268553, -3.219765, 0, 0, 0, 1, 1,
-0.4971386, -1.309845, -3.267379, 0, 0, 0, 1, 1,
-0.4900522, 0.05675745, -1.113083, 0, 0, 0, 1, 1,
-0.4895747, 0.5369467, 0.05180374, 0, 0, 0, 1, 1,
-0.4869172, -0.1825333, -0.6306868, 0, 0, 0, 1, 1,
-0.4866875, 0.1476317, -0.6220056, 0, 0, 0, 1, 1,
-0.4862651, 0.5891268, 0.4153862, 1, 1, 1, 1, 1,
-0.4806822, 0.9014817, 0.56025, 1, 1, 1, 1, 1,
-0.4800817, -0.06780364, -1.288892, 1, 1, 1, 1, 1,
-0.4796348, -0.3826578, -2.422861, 1, 1, 1, 1, 1,
-0.4753195, -0.1417457, -1.527928, 1, 1, 1, 1, 1,
-0.4642844, -2.171951, -1.998312, 1, 1, 1, 1, 1,
-0.4631881, 0.4581535, -1.448297, 1, 1, 1, 1, 1,
-0.4619359, 0.4321717, -1.032886, 1, 1, 1, 1, 1,
-0.4575114, -0.4265719, -2.63399, 1, 1, 1, 1, 1,
-0.4570099, 0.1525215, -0.9181776, 1, 1, 1, 1, 1,
-0.4565214, 0.5776289, 0.6077766, 1, 1, 1, 1, 1,
-0.4519138, -1.123315, -3.549664, 1, 1, 1, 1, 1,
-0.4409142, 1.234642, 0.3539769, 1, 1, 1, 1, 1,
-0.4388903, 0.1450254, -2.045101, 1, 1, 1, 1, 1,
-0.4352341, 0.6979132, -1.789065, 1, 1, 1, 1, 1,
-0.4320049, -0.3486757, -2.678599, 0, 0, 1, 1, 1,
-0.4312713, -1.18896, -4.504329, 1, 0, 0, 1, 1,
-0.4309076, -0.9684516, -3.451469, 1, 0, 0, 1, 1,
-0.4259681, -0.7004328, -2.824448, 1, 0, 0, 1, 1,
-0.423922, 0.5966021, -0.3827869, 1, 0, 0, 1, 1,
-0.4217233, -1.893705, -2.691912, 1, 0, 0, 1, 1,
-0.4215367, -1.908014, -1.066015, 0, 0, 0, 1, 1,
-0.4200002, 0.1973467, -1.447272, 0, 0, 0, 1, 1,
-0.418551, -0.6802028, -2.286762, 0, 0, 0, 1, 1,
-0.4170534, 1.775997, -0.2604438, 0, 0, 0, 1, 1,
-0.4152538, 0.4218796, -0.03001704, 0, 0, 0, 1, 1,
-0.4137231, 0.09171689, -1.685985, 0, 0, 0, 1, 1,
-0.4110433, 0.1075927, -1.666806, 0, 0, 0, 1, 1,
-0.4099534, -1.267798, -3.073078, 1, 1, 1, 1, 1,
-0.3974211, -0.1526697, -1.660012, 1, 1, 1, 1, 1,
-0.3961126, 1.354225, 1.232378, 1, 1, 1, 1, 1,
-0.393027, 0.1000172, -2.921799, 1, 1, 1, 1, 1,
-0.3912204, -1.631011, -2.268629, 1, 1, 1, 1, 1,
-0.3891799, 1.635219, -0.6732132, 1, 1, 1, 1, 1,
-0.3872419, -1.401518, -2.076174, 1, 1, 1, 1, 1,
-0.3842629, -0.1417999, -1.194558, 1, 1, 1, 1, 1,
-0.3790194, -0.1738908, -2.202259, 1, 1, 1, 1, 1,
-0.3753993, -1.562292, -3.279005, 1, 1, 1, 1, 1,
-0.3740395, -0.5354179, -3.036201, 1, 1, 1, 1, 1,
-0.3718813, -1.093949, -3.281073, 1, 1, 1, 1, 1,
-0.3650913, -1.040316, -3.376213, 1, 1, 1, 1, 1,
-0.3633801, 0.6964988, -0.1275509, 1, 1, 1, 1, 1,
-0.3633429, 0.5117421, -0.02932133, 1, 1, 1, 1, 1,
-0.3617918, 0.9050872, -0.7644899, 0, 0, 1, 1, 1,
-0.3609033, -0.3077034, -1.962067, 1, 0, 0, 1, 1,
-0.3606989, -0.954768, -2.873064, 1, 0, 0, 1, 1,
-0.3575731, 0.799015, 1.024371, 1, 0, 0, 1, 1,
-0.3532912, 0.5439374, -1.340514, 1, 0, 0, 1, 1,
-0.3504375, -0.7776894, -1.93201, 1, 0, 0, 1, 1,
-0.3497128, 0.7840539, -1.176491, 0, 0, 0, 1, 1,
-0.3442701, -1.240342, -4.237085, 0, 0, 0, 1, 1,
-0.3420829, -1.073274, -4.186914, 0, 0, 0, 1, 1,
-0.3395309, -0.6944399, -2.920777, 0, 0, 0, 1, 1,
-0.33771, -0.198317, -2.125076, 0, 0, 0, 1, 1,
-0.3363282, -0.05492187, -1.709311, 0, 0, 0, 1, 1,
-0.3360972, -0.9122233, -4.156119, 0, 0, 0, 1, 1,
-0.3352878, -1.291019, -3.691647, 1, 1, 1, 1, 1,
-0.3331525, 0.7248198, -1.11561, 1, 1, 1, 1, 1,
-0.3253049, 0.04943394, -1.508425, 1, 1, 1, 1, 1,
-0.3248568, -0.9257988, -4.456692, 1, 1, 1, 1, 1,
-0.3226726, -1.767998, -3.51571, 1, 1, 1, 1, 1,
-0.3223089, -0.1175603, -0.9670409, 1, 1, 1, 1, 1,
-0.3220413, -1.625191, -4.527199, 1, 1, 1, 1, 1,
-0.3200721, -0.3743373, -0.5246385, 1, 1, 1, 1, 1,
-0.3198185, 0.325583, -1.616857, 1, 1, 1, 1, 1,
-0.3185082, -0.9670369, -2.706311, 1, 1, 1, 1, 1,
-0.313984, 0.2863088, -1.299097, 1, 1, 1, 1, 1,
-0.3137487, 1.434553, 0.7246894, 1, 1, 1, 1, 1,
-0.3107894, -0.2529331, -2.507343, 1, 1, 1, 1, 1,
-0.3095983, 1.549601, 0.6209132, 1, 1, 1, 1, 1,
-0.3028288, 1.990947, -0.185129, 1, 1, 1, 1, 1,
-0.2981823, 0.4202719, -2.146272, 0, 0, 1, 1, 1,
-0.2966949, -0.5055376, -1.247344, 1, 0, 0, 1, 1,
-0.2966244, -2.557103, -0.9499031, 1, 0, 0, 1, 1,
-0.2951086, 0.6524701, -1.383303, 1, 0, 0, 1, 1,
-0.291597, 1.300589, -0.8732077, 1, 0, 0, 1, 1,
-0.2913868, -1.000597, -3.181249, 1, 0, 0, 1, 1,
-0.2908306, 0.290463, -2.705931, 0, 0, 0, 1, 1,
-0.2890422, 0.8013667, -0.02244802, 0, 0, 0, 1, 1,
-0.2881435, 0.9533442, -0.6756085, 0, 0, 0, 1, 1,
-0.2825709, -1.209615, -3.546323, 0, 0, 0, 1, 1,
-0.2818352, 0.5272369, -0.1726988, 0, 0, 0, 1, 1,
-0.2796241, 0.5395116, -0.9111993, 0, 0, 0, 1, 1,
-0.2787348, -2.400706, -1.965867, 0, 0, 0, 1, 1,
-0.2727997, 0.8064219, 1.468081, 1, 1, 1, 1, 1,
-0.2711946, -1.463197, -2.481049, 1, 1, 1, 1, 1,
-0.2644145, 1.501716, -1.457123, 1, 1, 1, 1, 1,
-0.2612474, 1.259073, 0.3547903, 1, 1, 1, 1, 1,
-0.2579242, -0.04819667, -0.994563, 1, 1, 1, 1, 1,
-0.2575811, -0.7634503, -3.23647, 1, 1, 1, 1, 1,
-0.2574966, -0.1716544, -0.9414437, 1, 1, 1, 1, 1,
-0.2571733, -1.715258, -1.085844, 1, 1, 1, 1, 1,
-0.2529806, -1.078834, -4.994783, 1, 1, 1, 1, 1,
-0.2518198, -2.881627, -2.569349, 1, 1, 1, 1, 1,
-0.245306, -0.2416369, -1.371088, 1, 1, 1, 1, 1,
-0.2450784, 0.7263028, 1.117608, 1, 1, 1, 1, 1,
-0.2434154, 1.251914, -0.08580067, 1, 1, 1, 1, 1,
-0.2432043, -1.419508, -2.555779, 1, 1, 1, 1, 1,
-0.2429201, 0.204166, -1.186321, 1, 1, 1, 1, 1,
-0.2419261, -0.6892913, -4.061999, 0, 0, 1, 1, 1,
-0.2388225, 0.9296732, -2.673267, 1, 0, 0, 1, 1,
-0.2364105, 0.2760253, -0.6464346, 1, 0, 0, 1, 1,
-0.2327196, -0.6870962, -2.382857, 1, 0, 0, 1, 1,
-0.2299648, 0.6833529, -0.7483985, 1, 0, 0, 1, 1,
-0.2260336, -0.1974484, -2.514497, 1, 0, 0, 1, 1,
-0.224755, -0.9773321, -4.53726, 0, 0, 0, 1, 1,
-0.2227041, -0.03189751, -2.798143, 0, 0, 0, 1, 1,
-0.2139528, 0.4156567, -1.174792, 0, 0, 0, 1, 1,
-0.210398, 0.4484865, -0.2050918, 0, 0, 0, 1, 1,
-0.2100125, 0.6328605, -0.7085357, 0, 0, 0, 1, 1,
-0.199682, 0.3011729, -2.259984, 0, 0, 0, 1, 1,
-0.1988712, -1.426261, -2.203281, 0, 0, 0, 1, 1,
-0.1967243, 0.310801, 0.1318014, 1, 1, 1, 1, 1,
-0.1921021, 0.04576407, 0.1060292, 1, 1, 1, 1, 1,
-0.1843566, -0.2923098, -0.4950049, 1, 1, 1, 1, 1,
-0.1840026, -0.4582855, -4.284397, 1, 1, 1, 1, 1,
-0.1816377, 0.734524, 1.231382, 1, 1, 1, 1, 1,
-0.1808613, -1.13296, -3.212104, 1, 1, 1, 1, 1,
-0.1805365, -0.3943829, -3.22867, 1, 1, 1, 1, 1,
-0.1798932, 0.4643942, -0.8917243, 1, 1, 1, 1, 1,
-0.1795063, -1.581081, -3.063585, 1, 1, 1, 1, 1,
-0.1790026, 0.07456403, 0.4823133, 1, 1, 1, 1, 1,
-0.1762183, -1.414463, -3.446162, 1, 1, 1, 1, 1,
-0.175834, -0.4642658, -2.491221, 1, 1, 1, 1, 1,
-0.1744857, -0.3532724, -2.244323, 1, 1, 1, 1, 1,
-0.1708749, -0.03818702, 0.6183687, 1, 1, 1, 1, 1,
-0.1688166, 0.7110785, -0.4316557, 1, 1, 1, 1, 1,
-0.16456, -0.3589577, -1.989427, 0, 0, 1, 1, 1,
-0.1628014, 0.1177298, -1.048422, 1, 0, 0, 1, 1,
-0.161515, 2.042713, -2.145959, 1, 0, 0, 1, 1,
-0.1597025, 1.168418, -0.1940773, 1, 0, 0, 1, 1,
-0.1582455, -1.305413, -3.326592, 1, 0, 0, 1, 1,
-0.1540755, 1.828358, 0.6782846, 1, 0, 0, 1, 1,
-0.1530603, -0.5685507, -2.932839, 0, 0, 0, 1, 1,
-0.1507208, 0.9492075, 0.747072, 0, 0, 0, 1, 1,
-0.1496048, 0.6823953, -0.3115279, 0, 0, 0, 1, 1,
-0.1484788, -2.044895, -2.974483, 0, 0, 0, 1, 1,
-0.146273, 0.2205158, -1.607292, 0, 0, 0, 1, 1,
-0.1462453, 2.116517, -0.08314061, 0, 0, 0, 1, 1,
-0.1419206, 0.8698348, -1.310273, 0, 0, 0, 1, 1,
-0.1396971, 0.8614893, -0.3818151, 1, 1, 1, 1, 1,
-0.1379943, -0.1778163, -1.449565, 1, 1, 1, 1, 1,
-0.1363859, -1.383247, -2.679545, 1, 1, 1, 1, 1,
-0.1358627, -0.4547068, -2.243805, 1, 1, 1, 1, 1,
-0.1347907, 0.5454981, 0.3946079, 1, 1, 1, 1, 1,
-0.1329478, 0.7844576, -1.199736, 1, 1, 1, 1, 1,
-0.1321216, 0.364285, 0.4276364, 1, 1, 1, 1, 1,
-0.1308891, -0.609475, -4.623598, 1, 1, 1, 1, 1,
-0.1292689, -0.9044136, -3.946654, 1, 1, 1, 1, 1,
-0.1288254, -2.000516, -1.948547, 1, 1, 1, 1, 1,
-0.1281075, -0.6518936, -3.041043, 1, 1, 1, 1, 1,
-0.124913, -2.637867, -2.452028, 1, 1, 1, 1, 1,
-0.1243702, -0.08585013, -1.96853, 1, 1, 1, 1, 1,
-0.1167901, 0.7026855, 0.9277701, 1, 1, 1, 1, 1,
-0.1148331, 1.009575, -0.7542931, 1, 1, 1, 1, 1,
-0.114704, 0.5414937, 0.4072253, 0, 0, 1, 1, 1,
-0.1142673, 0.739439, 0.8021657, 1, 0, 0, 1, 1,
-0.1141631, -0.3277854, -2.082692, 1, 0, 0, 1, 1,
-0.1118827, 0.2293398, -0.7509717, 1, 0, 0, 1, 1,
-0.1117059, -0.6894221, -3.162549, 1, 0, 0, 1, 1,
-0.1098613, 0.4230662, -1.892108, 1, 0, 0, 1, 1,
-0.1087908, -0.4348715, -2.504967, 0, 0, 0, 1, 1,
-0.1063911, 1.396607, -1.769771, 0, 0, 0, 1, 1,
-0.1037948, -0.6905358, -3.801833, 0, 0, 0, 1, 1,
-0.1032342, -0.4208961, -3.03473, 0, 0, 0, 1, 1,
-0.09468352, 0.9889892, 0.6191767, 0, 0, 0, 1, 1,
-0.09140122, 0.3299749, -0.6102698, 0, 0, 0, 1, 1,
-0.08723907, 2.283526, -0.3752312, 0, 0, 0, 1, 1,
-0.08361567, -0.07565239, -1.831895, 1, 1, 1, 1, 1,
-0.08283221, 1.880375, -0.249061, 1, 1, 1, 1, 1,
-0.07974698, -0.2256691, -2.248963, 1, 1, 1, 1, 1,
-0.07874306, -0.02031014, -2.499709, 1, 1, 1, 1, 1,
-0.07825013, -0.1127199, -2.611893, 1, 1, 1, 1, 1,
-0.07794129, 0.270109, -0.4772951, 1, 1, 1, 1, 1,
-0.07777508, -1.338859, -3.471159, 1, 1, 1, 1, 1,
-0.07575791, -0.7008374, -2.452771, 1, 1, 1, 1, 1,
-0.06436267, 0.1819421, -0.4777233, 1, 1, 1, 1, 1,
-0.05400985, -1.285226, -2.086473, 1, 1, 1, 1, 1,
-0.04944474, -1.528999, -3.859865, 1, 1, 1, 1, 1,
-0.04873909, 1.38492, 0.8779733, 1, 1, 1, 1, 1,
-0.0473595, 1.58468, -1.201684, 1, 1, 1, 1, 1,
-0.0448333, -0.6131071, -4.359669, 1, 1, 1, 1, 1,
-0.04008181, 0.1848784, -0.3713326, 1, 1, 1, 1, 1,
-0.03958924, 0.1670541, 0.4721849, 0, 0, 1, 1, 1,
-0.03807648, 0.1496353, -0.4853081, 1, 0, 0, 1, 1,
-0.03179516, 0.08908763, -0.2565283, 1, 0, 0, 1, 1,
-0.02538379, 0.01598042, -0.5028736, 1, 0, 0, 1, 1,
-0.02251792, 0.06535359, -1.308887, 1, 0, 0, 1, 1,
-0.02206295, -0.8155613, -4.792916, 1, 0, 0, 1, 1,
-0.02195107, -0.464062, -2.252069, 0, 0, 0, 1, 1,
-0.01563378, 0.1013113, -0.5331737, 0, 0, 0, 1, 1,
-0.01399822, 0.4985734, 1.888041, 0, 0, 0, 1, 1,
-0.01308895, 0.04538932, -1.035784, 0, 0, 0, 1, 1,
-0.01190102, 1.386566, -0.07859986, 0, 0, 0, 1, 1,
-0.009055049, 0.9232855, -0.5501969, 0, 0, 0, 1, 1,
0.004212402, -0.9113376, 3.791214, 0, 0, 0, 1, 1,
0.004780969, -1.436037, 3.594693, 1, 1, 1, 1, 1,
0.005357686, 0.1499737, 0.6258963, 1, 1, 1, 1, 1,
0.008397593, 0.6678782, -0.3546492, 1, 1, 1, 1, 1,
0.00954227, -0.715114, 4.378314, 1, 1, 1, 1, 1,
0.01119157, 1.72587, -0.6410797, 1, 1, 1, 1, 1,
0.01178397, -0.02896073, 1.5402, 1, 1, 1, 1, 1,
0.01785258, 1.189816, -1.05511, 1, 1, 1, 1, 1,
0.0213616, -0.6744586, 3.347322, 1, 1, 1, 1, 1,
0.02489938, -1.174399, 3.127858, 1, 1, 1, 1, 1,
0.0290481, -0.5761211, 3.860455, 1, 1, 1, 1, 1,
0.02997265, -1.063411, 6.043603, 1, 1, 1, 1, 1,
0.03214084, 0.7478622, -0.04938841, 1, 1, 1, 1, 1,
0.03254448, 0.549482, 1.791518, 1, 1, 1, 1, 1,
0.0335934, -1.355913, 3.288652, 1, 1, 1, 1, 1,
0.03618313, -0.4848806, 3.444335, 1, 1, 1, 1, 1,
0.03829974, 2.144638, -0.2405575, 0, 0, 1, 1, 1,
0.04921493, 0.8569757, 1.291038, 1, 0, 0, 1, 1,
0.05456339, -0.2833459, 2.950614, 1, 0, 0, 1, 1,
0.05939598, -0.1685933, 1.5267, 1, 0, 0, 1, 1,
0.06003349, 0.6212924, -1.72715, 1, 0, 0, 1, 1,
0.06047081, 0.410247, -0.4273461, 1, 0, 0, 1, 1,
0.06093143, 0.9765213, 0.8540723, 0, 0, 0, 1, 1,
0.0653335, 1.333584, 0.4846356, 0, 0, 0, 1, 1,
0.06710071, -0.4721954, 3.67856, 0, 0, 0, 1, 1,
0.06926664, 0.3118865, 0.6180698, 0, 0, 0, 1, 1,
0.07163739, -0.05879476, 0.6501865, 0, 0, 0, 1, 1,
0.07271319, 0.7395082, 0.6473988, 0, 0, 0, 1, 1,
0.07334925, 0.01069908, 1.404947, 0, 0, 0, 1, 1,
0.07338633, 0.4757227, -0.6891372, 1, 1, 1, 1, 1,
0.07467573, 0.9452338, -0.1680178, 1, 1, 1, 1, 1,
0.07505617, -1.214627, 3.911605, 1, 1, 1, 1, 1,
0.07549832, 0.5979187, -1.164269, 1, 1, 1, 1, 1,
0.07606834, 1.598777, -0.8678439, 1, 1, 1, 1, 1,
0.08129212, -3.088845, 1.48038, 1, 1, 1, 1, 1,
0.08210045, -0.1765065, 2.527193, 1, 1, 1, 1, 1,
0.08328834, -0.7992408, 4.814836, 1, 1, 1, 1, 1,
0.08405223, 0.2064583, -1.5288, 1, 1, 1, 1, 1,
0.08442127, 0.1423204, 0.009798644, 1, 1, 1, 1, 1,
0.08856729, -0.03419089, 3.926157, 1, 1, 1, 1, 1,
0.08992696, 0.9435883, 0.4866861, 1, 1, 1, 1, 1,
0.09146152, -0.1909077, 2.61808, 1, 1, 1, 1, 1,
0.09252885, -1.387597, 2.670385, 1, 1, 1, 1, 1,
0.09253244, -0.7082814, 2.646968, 1, 1, 1, 1, 1,
0.09536747, -1.101972, 1.98059, 0, 0, 1, 1, 1,
0.09556816, 2.983179, -0.0295884, 1, 0, 0, 1, 1,
0.09610526, -0.2787623, 3.116278, 1, 0, 0, 1, 1,
0.09688016, -0.183325, 2.406159, 1, 0, 0, 1, 1,
0.09817208, 1.061063, 0.4369767, 1, 0, 0, 1, 1,
0.1002357, 0.02106374, 1.129506, 1, 0, 0, 1, 1,
0.1051486, 0.447096, -1.865726, 0, 0, 0, 1, 1,
0.1059088, 0.9644357, -2.343529, 0, 0, 0, 1, 1,
0.1088591, -0.8729373, 2.01265, 0, 0, 0, 1, 1,
0.10901, 1.230089, 1.833521, 0, 0, 0, 1, 1,
0.1118818, -2.395282, 3.009994, 0, 0, 0, 1, 1,
0.1149648, 1.183229, 0.3210743, 0, 0, 0, 1, 1,
0.1189506, -0.1338962, 1.042697, 0, 0, 0, 1, 1,
0.1227609, 1.259168, -1.586497, 1, 1, 1, 1, 1,
0.1270574, -1.124019, 2.742107, 1, 1, 1, 1, 1,
0.1309582, -0.3306526, 3.474448, 1, 1, 1, 1, 1,
0.1384059, 0.4215358, -0.6463442, 1, 1, 1, 1, 1,
0.1390003, 0.5879559, 0.6413878, 1, 1, 1, 1, 1,
0.1405897, 0.06544539, 0.2906226, 1, 1, 1, 1, 1,
0.1459175, -1.635538, 4.286442, 1, 1, 1, 1, 1,
0.153738, -0.9914952, 3.299174, 1, 1, 1, 1, 1,
0.1541633, 0.5383788, -0.1275931, 1, 1, 1, 1, 1,
0.1560763, 1.266847, -0.4192888, 1, 1, 1, 1, 1,
0.1585986, -0.7309482, 3.879407, 1, 1, 1, 1, 1,
0.1634256, -0.2418704, 1.138458, 1, 1, 1, 1, 1,
0.1739061, 1.145535, 0.05563873, 1, 1, 1, 1, 1,
0.175628, -1.509709, 3.059671, 1, 1, 1, 1, 1,
0.1780891, -0.3030063, 2.722011, 1, 1, 1, 1, 1,
0.1791279, -1.161276, 1.758129, 0, 0, 1, 1, 1,
0.1809906, 0.1825715, 0.3166666, 1, 0, 0, 1, 1,
0.1832512, -2.181008, 4.717331, 1, 0, 0, 1, 1,
0.1845952, 0.182014, 0.8960117, 1, 0, 0, 1, 1,
0.188444, -0.4474844, 3.133953, 1, 0, 0, 1, 1,
0.189848, -0.3021266, 2.738266, 1, 0, 0, 1, 1,
0.2013139, 3.210163, 0.4925545, 0, 0, 0, 1, 1,
0.2019925, -1.256055, 2.82848, 0, 0, 0, 1, 1,
0.20533, 0.4937348, 2.04726, 0, 0, 0, 1, 1,
0.205386, 0.4271398, -0.3052351, 0, 0, 0, 1, 1,
0.2057253, -1.214699, 1.772167, 0, 0, 0, 1, 1,
0.2075824, 0.4884765, 1.090819, 0, 0, 0, 1, 1,
0.2104108, 2.109956, 1.807315, 0, 0, 0, 1, 1,
0.2126954, -0.4715912, 2.684386, 1, 1, 1, 1, 1,
0.2141662, 1.359326, 0.248808, 1, 1, 1, 1, 1,
0.2143365, -0.5111883, 2.936383, 1, 1, 1, 1, 1,
0.2145468, 1.242972, -0.4322873, 1, 1, 1, 1, 1,
0.215209, 0.728048, -0.4705159, 1, 1, 1, 1, 1,
0.2204607, -0.6406338, 3.55726, 1, 1, 1, 1, 1,
0.220542, -0.3270524, 2.877491, 1, 1, 1, 1, 1,
0.2213726, 0.6143463, 0.8575315, 1, 1, 1, 1, 1,
0.2235497, -0.8052152, 3.545177, 1, 1, 1, 1, 1,
0.2251494, -0.6792422, 4.14056, 1, 1, 1, 1, 1,
0.225588, 0.03639973, -0.2351439, 1, 1, 1, 1, 1,
0.2282254, 1.220812, 1.461463, 1, 1, 1, 1, 1,
0.2287036, 0.07394943, 0.4260546, 1, 1, 1, 1, 1,
0.2306619, -0.3514856, 3.456178, 1, 1, 1, 1, 1,
0.2312986, 0.01218827, 2.183533, 1, 1, 1, 1, 1,
0.2339293, 1.169037, -0.129697, 0, 0, 1, 1, 1,
0.237735, 1.047452, 0.9802035, 1, 0, 0, 1, 1,
0.2389479, 0.1777523, 2.118629, 1, 0, 0, 1, 1,
0.2404844, -0.7489336, 1.980246, 1, 0, 0, 1, 1,
0.2423165, 3.261221, -0.6429836, 1, 0, 0, 1, 1,
0.2447889, -0.4217353, 3.01699, 1, 0, 0, 1, 1,
0.2449227, -0.05686751, 1.92655, 0, 0, 0, 1, 1,
0.2498434, -0.9407206, 2.784321, 0, 0, 0, 1, 1,
0.2508287, 0.2812381, 0.3965316, 0, 0, 0, 1, 1,
0.2519355, 0.1207937, 1.878222, 0, 0, 0, 1, 1,
0.2545733, -1.234633, 5.221997, 0, 0, 0, 1, 1,
0.2548549, 0.07202654, 0.5721254, 0, 0, 0, 1, 1,
0.2562591, 0.5422451, -0.1765632, 0, 0, 0, 1, 1,
0.2585299, 0.5850502, -0.1371331, 1, 1, 1, 1, 1,
0.2595979, 0.9193574, -1.047177, 1, 1, 1, 1, 1,
0.2604939, 0.7302711, 0.38572, 1, 1, 1, 1, 1,
0.2637012, -0.1637216, 1.537252, 1, 1, 1, 1, 1,
0.2661432, 1.558287, -0.08202902, 1, 1, 1, 1, 1,
0.2675266, 1.011332, 1.210891, 1, 1, 1, 1, 1,
0.2677667, 0.5760693, 0.8676017, 1, 1, 1, 1, 1,
0.2684604, 1.941272, 0.1575526, 1, 1, 1, 1, 1,
0.2687974, -1.360132, 4.894003, 1, 1, 1, 1, 1,
0.2717162, -0.3926074, 4.130745, 1, 1, 1, 1, 1,
0.2724499, 0.9290418, -0.2963693, 1, 1, 1, 1, 1,
0.2735167, 1.218515, -0.2505724, 1, 1, 1, 1, 1,
0.2739021, -0.5129926, 2.437264, 1, 1, 1, 1, 1,
0.2769071, 0.5387356, 0.2612148, 1, 1, 1, 1, 1,
0.2797741, 0.1850982, 0.6032582, 1, 1, 1, 1, 1,
0.2814073, 0.8863598, -2.02242, 0, 0, 1, 1, 1,
0.2823504, 1.289343, -0.2857336, 1, 0, 0, 1, 1,
0.2861454, 0.1530122, -0.1154472, 1, 0, 0, 1, 1,
0.2893839, -0.2076821, 2.864852, 1, 0, 0, 1, 1,
0.2934575, -0.9384705, 2.943334, 1, 0, 0, 1, 1,
0.3009533, -0.4432974, 2.496603, 1, 0, 0, 1, 1,
0.3041008, 0.6737257, 0.6372382, 0, 0, 0, 1, 1,
0.3080197, 0.6238444, 2.354849, 0, 0, 0, 1, 1,
0.3116209, 0.7989988, -1.678479, 0, 0, 0, 1, 1,
0.3156223, 1.073824, -0.5295853, 0, 0, 0, 1, 1,
0.3194484, -0.01883134, 1.731204, 0, 0, 0, 1, 1,
0.3243273, 0.8500901, 1.879334, 0, 0, 0, 1, 1,
0.3253302, 1.382408, -1.552248, 0, 0, 0, 1, 1,
0.3310826, -0.6668915, 3.955165, 1, 1, 1, 1, 1,
0.3327077, -1.404379, 3.782273, 1, 1, 1, 1, 1,
0.3329982, -0.4667858, 3.213227, 1, 1, 1, 1, 1,
0.3385881, 0.8357373, 2.224328, 1, 1, 1, 1, 1,
0.3400729, -1.351832, 0.6847434, 1, 1, 1, 1, 1,
0.3470805, 0.5672171, 0.4678269, 1, 1, 1, 1, 1,
0.3479984, -0.7184111, 3.370581, 1, 1, 1, 1, 1,
0.3494146, 0.05923694, 0.05413262, 1, 1, 1, 1, 1,
0.3534046, 0.5871446, 0.6310554, 1, 1, 1, 1, 1,
0.3538662, -1.743088, 2.750892, 1, 1, 1, 1, 1,
0.3539109, 0.1933361, 1.290571, 1, 1, 1, 1, 1,
0.3658101, 1.682596, -0.8755419, 1, 1, 1, 1, 1,
0.3667881, -0.681882, 2.8034, 1, 1, 1, 1, 1,
0.3678653, -0.8400382, 4.845978, 1, 1, 1, 1, 1,
0.3693177, 0.4266714, 1.259402, 1, 1, 1, 1, 1,
0.3714412, -0.4443238, 0.8302981, 0, 0, 1, 1, 1,
0.3760939, 1.155025, -0.9100177, 1, 0, 0, 1, 1,
0.3761833, 1.779672, 1.689976, 1, 0, 0, 1, 1,
0.3834777, 0.1626257, 0.2862944, 1, 0, 0, 1, 1,
0.3838769, -0.709138, 4.246675, 1, 0, 0, 1, 1,
0.3841569, -0.3616371, 2.442487, 1, 0, 0, 1, 1,
0.3888554, 1.551121, -0.7527438, 0, 0, 0, 1, 1,
0.3891975, 0.1522336, -0.01349426, 0, 0, 0, 1, 1,
0.3914346, -1.133434, 1.748464, 0, 0, 0, 1, 1,
0.3928821, 0.4162753, -0.5996463, 0, 0, 0, 1, 1,
0.3932984, 0.03349023, 2.461549, 0, 0, 0, 1, 1,
0.3966255, 0.4066009, 1.372002, 0, 0, 0, 1, 1,
0.3986932, -1.212379, 2.410214, 0, 0, 0, 1, 1,
0.4069017, -1.114645, 2.232346, 1, 1, 1, 1, 1,
0.4155025, 0.04364929, 0.43387, 1, 1, 1, 1, 1,
0.422075, 0.5719857, 1.658073, 1, 1, 1, 1, 1,
0.4244798, 0.9615554, 0.7286901, 1, 1, 1, 1, 1,
0.4272642, -0.4904547, -0.4170182, 1, 1, 1, 1, 1,
0.4284211, 1.002887, 0.9249226, 1, 1, 1, 1, 1,
0.4448772, -0.5398385, 1.523941, 1, 1, 1, 1, 1,
0.4469392, 0.1958944, 2.550324, 1, 1, 1, 1, 1,
0.4483719, 0.7284704, -1.067381, 1, 1, 1, 1, 1,
0.4526098, -0.5038276, 1.727941, 1, 1, 1, 1, 1,
0.4532793, 0.9764233, 0.3003657, 1, 1, 1, 1, 1,
0.454225, 0.2349907, 2.481589, 1, 1, 1, 1, 1,
0.454484, -0.2487783, 1.675801, 1, 1, 1, 1, 1,
0.4613395, 0.3961894, -0.09685974, 1, 1, 1, 1, 1,
0.4632993, -0.4857371, 4.278687, 1, 1, 1, 1, 1,
0.4655008, -0.4854243, 2.334685, 0, 0, 1, 1, 1,
0.4674622, -0.7826498, 2.979318, 1, 0, 0, 1, 1,
0.4676318, 0.5393253, 1.729324, 1, 0, 0, 1, 1,
0.4686109, 0.6510636, 0.427108, 1, 0, 0, 1, 1,
0.4690521, -0.6309451, 3.213872, 1, 0, 0, 1, 1,
0.4701261, -2.207735, 2.816098, 1, 0, 0, 1, 1,
0.4746639, -0.2034891, 2.238983, 0, 0, 0, 1, 1,
0.4798588, -1.577326, 3.025965, 0, 0, 0, 1, 1,
0.4804099, 0.01028733, 0.7888915, 0, 0, 0, 1, 1,
0.4818923, -0.01564196, 1.062133, 0, 0, 0, 1, 1,
0.4848458, -0.08143681, 1.501847, 0, 0, 0, 1, 1,
0.4985341, 1.583694, -1.017795, 0, 0, 0, 1, 1,
0.5048174, 0.4142019, -0.3899754, 0, 0, 0, 1, 1,
0.5083508, -1.793162, 2.609807, 1, 1, 1, 1, 1,
0.5103592, -0.9723659, 0.4335628, 1, 1, 1, 1, 1,
0.5133666, -1.203482, 4.360237, 1, 1, 1, 1, 1,
0.5136071, -0.4743153, 3.673203, 1, 1, 1, 1, 1,
0.5138777, -0.8578277, 3.636452, 1, 1, 1, 1, 1,
0.5152903, -1.078174, 2.898005, 1, 1, 1, 1, 1,
0.5246673, 1.212476, -0.1974915, 1, 1, 1, 1, 1,
0.5246814, 1.343711, 1.292303, 1, 1, 1, 1, 1,
0.5291853, 0.7793963, -0.7507616, 1, 1, 1, 1, 1,
0.5295968, -0.2715114, 2.63863, 1, 1, 1, 1, 1,
0.5363293, 0.6501432, -0.5205491, 1, 1, 1, 1, 1,
0.5372354, -0.4874699, 1.867844, 1, 1, 1, 1, 1,
0.5387927, 0.7451051, 0.6048043, 1, 1, 1, 1, 1,
0.5509087, 0.1028642, 3.122625, 1, 1, 1, 1, 1,
0.5548476, 0.7275589, 1.667637, 1, 1, 1, 1, 1,
0.557469, -0.06802171, 3.005726, 0, 0, 1, 1, 1,
0.558222, -0.697319, 3.043821, 1, 0, 0, 1, 1,
0.561047, 0.6076968, 0.5292408, 1, 0, 0, 1, 1,
0.5610673, -0.117044, 1.609628, 1, 0, 0, 1, 1,
0.5612527, 1.111869, 1.499638, 1, 0, 0, 1, 1,
0.5613769, -2.371333, 2.105874, 1, 0, 0, 1, 1,
0.5638876, -1.689781, 2.425866, 0, 0, 0, 1, 1,
0.5641886, 1.953105, -0.08588082, 0, 0, 0, 1, 1,
0.5655734, 0.9524961, 0.6355711, 0, 0, 0, 1, 1,
0.5657089, -0.007114957, 1.262539, 0, 0, 0, 1, 1,
0.5662099, -1.127184, 2.160477, 0, 0, 0, 1, 1,
0.5722086, 0.6442216, 1.247804, 0, 0, 0, 1, 1,
0.5750911, -0.5256856, 1.695029, 0, 0, 0, 1, 1,
0.5757251, -0.6115544, 1.540091, 1, 1, 1, 1, 1,
0.5807112, -1.910739, 2.397346, 1, 1, 1, 1, 1,
0.5810587, -0.1354537, 0.05701456, 1, 1, 1, 1, 1,
0.582184, 0.4411795, 2.530164, 1, 1, 1, 1, 1,
0.5919153, -0.2359138, 1.812111, 1, 1, 1, 1, 1,
0.6041307, 0.3870278, 0.9344382, 1, 1, 1, 1, 1,
0.6114229, 0.4387631, -1.297001, 1, 1, 1, 1, 1,
0.6145896, 1.058002, 0.5595893, 1, 1, 1, 1, 1,
0.6186697, 1.039573, 1.251961, 1, 1, 1, 1, 1,
0.6253608, 0.3903514, -0.04472839, 1, 1, 1, 1, 1,
0.6282607, 0.604295, 1.184275, 1, 1, 1, 1, 1,
0.6330206, -1.728212, 1.449115, 1, 1, 1, 1, 1,
0.6412759, 0.01405647, -1.178378, 1, 1, 1, 1, 1,
0.6491944, -0.03237347, 3.773166, 1, 1, 1, 1, 1,
0.6601123, 0.3125826, 1.576184, 1, 1, 1, 1, 1,
0.6685584, 1.345642, 0.1155308, 0, 0, 1, 1, 1,
0.6690241, -0.6096873, 2.561549, 1, 0, 0, 1, 1,
0.6697286, 0.3652611, -0.02504994, 1, 0, 0, 1, 1,
0.6742372, -0.7978037, 1.887628, 1, 0, 0, 1, 1,
0.6745276, -2.062135, 1.771376, 1, 0, 0, 1, 1,
0.6749793, -1.321249, 2.447597, 1, 0, 0, 1, 1,
0.6829969, 0.04664207, 1.3384, 0, 0, 0, 1, 1,
0.6834456, 0.3011404, 2.242455, 0, 0, 0, 1, 1,
0.6835528, -2.013456, 3.477875, 0, 0, 0, 1, 1,
0.6843953, -0.7562687, 1.662094, 0, 0, 0, 1, 1,
0.6993949, -0.4158764, 2.768715, 0, 0, 0, 1, 1,
0.7007704, -0.6404226, 1.202168, 0, 0, 0, 1, 1,
0.7061763, 0.4280531, -0.1974903, 0, 0, 0, 1, 1,
0.7088575, -1.233732, 2.391975, 1, 1, 1, 1, 1,
0.7096405, -0.02995728, -0.04885738, 1, 1, 1, 1, 1,
0.710297, 0.4920489, -1.008559, 1, 1, 1, 1, 1,
0.7147052, 0.7604991, 0.4071356, 1, 1, 1, 1, 1,
0.7190384, 1.043437, 0.270915, 1, 1, 1, 1, 1,
0.719165, 1.634313, 0.1098887, 1, 1, 1, 1, 1,
0.7221942, -0.523369, 2.392757, 1, 1, 1, 1, 1,
0.7269429, -0.2633755, 1.830875, 1, 1, 1, 1, 1,
0.7285928, -1.250344, 3.860265, 1, 1, 1, 1, 1,
0.7316635, -0.6242896, 3.729285, 1, 1, 1, 1, 1,
0.7330846, 0.9283594, 2.155907, 1, 1, 1, 1, 1,
0.7332278, 0.9977702, 0.4022199, 1, 1, 1, 1, 1,
0.7340571, -1.650002, 1.710561, 1, 1, 1, 1, 1,
0.7407127, -0.8885863, 2.673846, 1, 1, 1, 1, 1,
0.7409902, -0.1850922, 1.071303, 1, 1, 1, 1, 1,
0.7419705, -0.4116549, 3.290321, 0, 0, 1, 1, 1,
0.7428344, -0.5792926, 2.373696, 1, 0, 0, 1, 1,
0.7462152, 0.08018221, 1.117426, 1, 0, 0, 1, 1,
0.7481589, -1.146944, 1.88677, 1, 0, 0, 1, 1,
0.7489617, -0.8059556, 2.358359, 1, 0, 0, 1, 1,
0.7596342, -0.05876431, 1.599651, 1, 0, 0, 1, 1,
0.7709905, 0.857727, 0.2923798, 0, 0, 0, 1, 1,
0.7760096, -1.086222, 3.208765, 0, 0, 0, 1, 1,
0.7828898, -0.7777317, 2.706632, 0, 0, 0, 1, 1,
0.7887263, -1.075949, 2.426677, 0, 0, 0, 1, 1,
0.7941877, -2.028416, 2.710414, 0, 0, 0, 1, 1,
0.7961448, -0.1712268, 2.589234, 0, 0, 0, 1, 1,
0.7998086, 0.1144398, 1.804554, 0, 0, 0, 1, 1,
0.8008679, -1.238601, 2.715506, 1, 1, 1, 1, 1,
0.8042979, -1.291047, 1.932163, 1, 1, 1, 1, 1,
0.8058063, 0.6403632, 2.79208, 1, 1, 1, 1, 1,
0.8059984, 1.185829, -0.9300111, 1, 1, 1, 1, 1,
0.8067241, 0.5914735, 0.5458374, 1, 1, 1, 1, 1,
0.8079662, 0.1561874, 1.178794, 1, 1, 1, 1, 1,
0.814581, 1.297149, 0.838235, 1, 1, 1, 1, 1,
0.8148946, -0.1152921, 0.1905888, 1, 1, 1, 1, 1,
0.8252305, 0.3110412, 1.627324, 1, 1, 1, 1, 1,
0.8289376, -2.187306, 3.940749, 1, 1, 1, 1, 1,
0.8336841, -0.6109416, 2.935211, 1, 1, 1, 1, 1,
0.837463, 0.5698322, 0.5241354, 1, 1, 1, 1, 1,
0.8433079, 0.7247755, 0.7804068, 1, 1, 1, 1, 1,
0.8445362, 0.5229846, 2.22881, 1, 1, 1, 1, 1,
0.8468325, 0.3719979, 0.7556267, 1, 1, 1, 1, 1,
0.85096, 0.2831998, 1.827081, 0, 0, 1, 1, 1,
0.8548207, 0.5687831, -0.1236046, 1, 0, 0, 1, 1,
0.858504, 0.9842372, 2.055928, 1, 0, 0, 1, 1,
0.8593514, -0.8045326, 0.7054625, 1, 0, 0, 1, 1,
0.8643472, 1.038221, -0.3471862, 1, 0, 0, 1, 1,
0.8647798, 0.7360554, 0.7060148, 1, 0, 0, 1, 1,
0.8669836, 0.6686057, 1.074686, 0, 0, 0, 1, 1,
0.8718913, -0.3426132, 1.678519, 0, 0, 0, 1, 1,
0.8743327, -1.825332, 2.39559, 0, 0, 0, 1, 1,
0.8747607, 1.576421, 0.1721557, 0, 0, 0, 1, 1,
0.876198, -1.881155, 4.31487, 0, 0, 0, 1, 1,
0.8823126, 0.4194226, 0.610275, 0, 0, 0, 1, 1,
0.8848767, -0.348983, 1.476051, 0, 0, 0, 1, 1,
0.8940539, -0.8676803, 3.358749, 1, 1, 1, 1, 1,
0.8970951, 0.4128961, 0.8584598, 1, 1, 1, 1, 1,
0.8985533, 0.3401195, -0.1066691, 1, 1, 1, 1, 1,
0.9008122, 0.7052768, -0.1380557, 1, 1, 1, 1, 1,
0.908523, 0.7133205, 0.5266173, 1, 1, 1, 1, 1,
0.9092672, -0.04284074, 0.4077246, 1, 1, 1, 1, 1,
0.9110783, 0.9226091, -0.0870303, 1, 1, 1, 1, 1,
0.9119523, -0.06051032, 2.433609, 1, 1, 1, 1, 1,
0.91297, 0.03515152, 1.909848, 1, 1, 1, 1, 1,
0.9199593, 0.8933044, 0.3414344, 1, 1, 1, 1, 1,
0.9217473, 0.8651878, -0.3938686, 1, 1, 1, 1, 1,
0.9228702, -1.128814, 1.333209, 1, 1, 1, 1, 1,
0.924911, -0.4443689, 2.773408, 1, 1, 1, 1, 1,
0.9270748, -0.1822908, 2.266475, 1, 1, 1, 1, 1,
0.9361132, -0.1320364, 0.3775123, 1, 1, 1, 1, 1,
0.9392102, 0.613011, 0.6691554, 0, 0, 1, 1, 1,
0.9477797, 1.685589, 0.674584, 1, 0, 0, 1, 1,
0.9644368, -0.8465586, 2.550402, 1, 0, 0, 1, 1,
0.9747781, 1.649169, 1.899683, 1, 0, 0, 1, 1,
0.9802045, 0.9237236, -0.6195872, 1, 0, 0, 1, 1,
0.9839708, -0.1052875, 1.866998, 1, 0, 0, 1, 1,
0.9856177, 0.2858484, 0.7563128, 0, 0, 0, 1, 1,
0.9996887, 0.06607742, 2.971761, 0, 0, 0, 1, 1,
1.00549, 1.581338, 0.5605721, 0, 0, 0, 1, 1,
1.007286, 1.131183, -0.292077, 0, 0, 0, 1, 1,
1.008637, -1.436787, 1.893575, 0, 0, 0, 1, 1,
1.017673, 0.8574529, 1.080604, 0, 0, 0, 1, 1,
1.020647, 1.847484, -1.316378, 0, 0, 0, 1, 1,
1.024256, 1.328721, 0.08191963, 1, 1, 1, 1, 1,
1.026941, 1.099416, 1.014602, 1, 1, 1, 1, 1,
1.0291, 0.7206469, -0.5757104, 1, 1, 1, 1, 1,
1.034295, -1.557748, 1.158621, 1, 1, 1, 1, 1,
1.037954, -1.195061, 3.356548, 1, 1, 1, 1, 1,
1.052651, 0.5822488, -0.6226979, 1, 1, 1, 1, 1,
1.053624, 0.6581159, 1.899575, 1, 1, 1, 1, 1,
1.062755, -0.111385, 0.7323605, 1, 1, 1, 1, 1,
1.068963, -0.5428091, 1.982633, 1, 1, 1, 1, 1,
1.075203, 1.072844, 1.022753, 1, 1, 1, 1, 1,
1.080072, -1.632133, 2.173927, 1, 1, 1, 1, 1,
1.082324, 0.7568495, 2.89074, 1, 1, 1, 1, 1,
1.085163, -0.9463977, 2.405372, 1, 1, 1, 1, 1,
1.085297, -0.459183, 2.905127, 1, 1, 1, 1, 1,
1.089484, -0.5911662, -0.6012697, 1, 1, 1, 1, 1,
1.08985, -1.386472, 3.35066, 0, 0, 1, 1, 1,
1.10066, 1.102753, 0.757833, 1, 0, 0, 1, 1,
1.101116, 0.04281687, 2.754779, 1, 0, 0, 1, 1,
1.101849, -1.369007, 1.950971, 1, 0, 0, 1, 1,
1.10815, 0.1832213, -0.6909806, 1, 0, 0, 1, 1,
1.108891, -0.259624, 0.01836395, 1, 0, 0, 1, 1,
1.111067, -0.1461995, 3.390177, 0, 0, 0, 1, 1,
1.11246, -0.02105143, 2.324627, 0, 0, 0, 1, 1,
1.124989, -0.1969312, 0.6329972, 0, 0, 0, 1, 1,
1.131673, 1.152482, 1.816319, 0, 0, 0, 1, 1,
1.133224, -0.3513325, 2.688614, 0, 0, 0, 1, 1,
1.138152, -0.3832381, 2.909341, 0, 0, 0, 1, 1,
1.154175, -0.7565274, 3.126433, 0, 0, 0, 1, 1,
1.162723, 1.468082, 0.1738804, 1, 1, 1, 1, 1,
1.166167, 1.517578, 1.029852, 1, 1, 1, 1, 1,
1.168234, -0.633942, 3.045281, 1, 1, 1, 1, 1,
1.169483, 0.1886241, 1.361889, 1, 1, 1, 1, 1,
1.173751, 0.2408868, 0.2164679, 1, 1, 1, 1, 1,
1.175133, -0.08699918, 0.9566895, 1, 1, 1, 1, 1,
1.178388, -0.09342213, 0.9318625, 1, 1, 1, 1, 1,
1.178937, 1.400377, 1.306582, 1, 1, 1, 1, 1,
1.182446, -1.031903, 1.126917, 1, 1, 1, 1, 1,
1.188917, 0.1247008, 2.209001, 1, 1, 1, 1, 1,
1.195945, 0.4187302, 1.457194, 1, 1, 1, 1, 1,
1.196993, 0.5111974, 2.211857, 1, 1, 1, 1, 1,
1.197697, 0.04073821, 1.56973, 1, 1, 1, 1, 1,
1.198007, 0.1182761, 0.8645062, 1, 1, 1, 1, 1,
1.19846, 0.2620003, 1.041559, 1, 1, 1, 1, 1,
1.206555, -0.09441933, 1.514005, 0, 0, 1, 1, 1,
1.214706, -1.151143, 1.832679, 1, 0, 0, 1, 1,
1.233626, 0.6151146, -0.09162641, 1, 0, 0, 1, 1,
1.237582, -0.2909788, 2.401903, 1, 0, 0, 1, 1,
1.239772, -0.706358, 0.4246597, 1, 0, 0, 1, 1,
1.256812, 2.43736, -1.043759, 1, 0, 0, 1, 1,
1.258936, 1.563153, 0.2368676, 0, 0, 0, 1, 1,
1.275132, 0.9189512, 0.6357706, 0, 0, 0, 1, 1,
1.277521, -1.651434, 2.663583, 0, 0, 0, 1, 1,
1.296853, 0.04649671, 0.02702767, 0, 0, 0, 1, 1,
1.298056, -0.9187158, 1.905121, 0, 0, 0, 1, 1,
1.302248, 1.176273, 1.042035, 0, 0, 0, 1, 1,
1.305926, -0.0288038, 2.302189, 0, 0, 0, 1, 1,
1.309078, 1.168412, -0.6963341, 1, 1, 1, 1, 1,
1.309868, -0.3493915, 2.148442, 1, 1, 1, 1, 1,
1.310305, 1.301522, 1.720237, 1, 1, 1, 1, 1,
1.324209, 0.439618, 2.073187, 1, 1, 1, 1, 1,
1.329059, 0.2814482, 1.499394, 1, 1, 1, 1, 1,
1.338106, -0.3775906, 1.667249, 1, 1, 1, 1, 1,
1.368276, -0.1373754, 0.4586735, 1, 1, 1, 1, 1,
1.37462, 1.396452, 1.161357, 1, 1, 1, 1, 1,
1.37774, 0.4406036, 2.834934, 1, 1, 1, 1, 1,
1.398409, 1.23593, 0.6455454, 1, 1, 1, 1, 1,
1.400341, 1.633375, -0.3583022, 1, 1, 1, 1, 1,
1.401214, -0.5759152, 0.8091117, 1, 1, 1, 1, 1,
1.404515, -0.5014843, 2.199636, 1, 1, 1, 1, 1,
1.423891, -1.428309, 1.278525, 1, 1, 1, 1, 1,
1.426297, -0.4487906, 3.215756, 1, 1, 1, 1, 1,
1.432641, 0.950102, 1.855904, 0, 0, 1, 1, 1,
1.437264, -0.3649161, 3.735924, 1, 0, 0, 1, 1,
1.442888, 0.5305946, 2.528998, 1, 0, 0, 1, 1,
1.460631, 1.048569, -0.248366, 1, 0, 0, 1, 1,
1.462335, 0.7439111, 2.399919, 1, 0, 0, 1, 1,
1.463212, 0.01231655, 0.6638445, 1, 0, 0, 1, 1,
1.471448, -0.4543699, 1.408799, 0, 0, 0, 1, 1,
1.47611, -0.6026116, 2.371547, 0, 0, 0, 1, 1,
1.483761, 0.5355092, 1.003942, 0, 0, 0, 1, 1,
1.484378, 1.527642, 0.8661081, 0, 0, 0, 1, 1,
1.509862, -0.715874, 2.779567, 0, 0, 0, 1, 1,
1.51194, 0.2935887, 1.326664, 0, 0, 0, 1, 1,
1.521757, -0.669708, 3.06486, 0, 0, 0, 1, 1,
1.545086, -1.116624, 2.729437, 1, 1, 1, 1, 1,
1.552139, -0.02539576, 1.964505, 1, 1, 1, 1, 1,
1.553785, 0.5156109, 0.02568111, 1, 1, 1, 1, 1,
1.555748, -1.220076, 2.21261, 1, 1, 1, 1, 1,
1.563763, -0.1991576, 0.5810294, 1, 1, 1, 1, 1,
1.576109, -2.573158, 1.93798, 1, 1, 1, 1, 1,
1.577038, -1.268624, 2.585993, 1, 1, 1, 1, 1,
1.579539, -0.08130136, 1.890858, 1, 1, 1, 1, 1,
1.580001, 1.378795, 0.5540551, 1, 1, 1, 1, 1,
1.604744, 0.8660072, 0.6300719, 1, 1, 1, 1, 1,
1.607765, -0.1824924, 3.268723, 1, 1, 1, 1, 1,
1.618148, 1.460697, 1.320294, 1, 1, 1, 1, 1,
1.634261, -0.1914949, 1.554666, 1, 1, 1, 1, 1,
1.646381, 1.39721, -0.4111552, 1, 1, 1, 1, 1,
1.648525, 1.264736, -0.4938374, 1, 1, 1, 1, 1,
1.669765, 1.054595, 3.822722, 0, 0, 1, 1, 1,
1.671735, 1.384836, 1.179458, 1, 0, 0, 1, 1,
1.679694, -0.6775815, 3.590722, 1, 0, 0, 1, 1,
1.687724, -0.9279271, 2.617967, 1, 0, 0, 1, 1,
1.689085, 0.8757935, 0.2038445, 1, 0, 0, 1, 1,
1.697385, -0.1259743, 2.197515, 1, 0, 0, 1, 1,
1.704426, 1.870881, -1.101718, 0, 0, 0, 1, 1,
1.71698, -0.8499629, 1.149415, 0, 0, 0, 1, 1,
1.717255, -1.525291, 3.270505, 0, 0, 0, 1, 1,
1.735492, -0.2620785, 1.061513, 0, 0, 0, 1, 1,
1.742147, -0.4294774, 2.305112, 0, 0, 0, 1, 1,
1.760799, -0.8865366, 1.358211, 0, 0, 0, 1, 1,
1.772771, -0.365352, 3.027409, 0, 0, 0, 1, 1,
1.779021, 1.139659, 1.582054, 1, 1, 1, 1, 1,
1.795333, 0.961714, 1.547182, 1, 1, 1, 1, 1,
1.824409, 0.172343, 1.655682, 1, 1, 1, 1, 1,
1.858406, -0.9926884, 3.436228, 1, 1, 1, 1, 1,
1.87593, -0.4442807, 2.199784, 1, 1, 1, 1, 1,
1.91085, -0.5867758, 1.622666, 1, 1, 1, 1, 1,
1.912838, -0.8799582, 3.087135, 1, 1, 1, 1, 1,
1.928095, 0.2413138, 0.9531726, 1, 1, 1, 1, 1,
1.946382, -1.885015, 1.70074, 1, 1, 1, 1, 1,
1.967684, -0.8402377, 3.684477, 1, 1, 1, 1, 1,
1.972446, 0.8848295, 0.9589449, 1, 1, 1, 1, 1,
1.973062, -0.8185664, 1.593753, 1, 1, 1, 1, 1,
2.001299, 0.06322082, 2.357566, 1, 1, 1, 1, 1,
2.012578, 0.8782998, 0.8938856, 1, 1, 1, 1, 1,
2.018682, -0.01825732, 0.7058643, 1, 1, 1, 1, 1,
2.061592, 1.016474, 0.1008957, 0, 0, 1, 1, 1,
2.066012, 0.05409905, 2.900652, 1, 0, 0, 1, 1,
2.066764, 0.950608, 2.182437, 1, 0, 0, 1, 1,
2.11518, -0.1407277, 2.704193, 1, 0, 0, 1, 1,
2.20183, 0.6989874, 2.722165, 1, 0, 0, 1, 1,
2.20599, 0.8785621, 0.8906901, 1, 0, 0, 1, 1,
2.23976, -0.437465, 2.070921, 0, 0, 0, 1, 1,
2.285755, 2.004391, 0.5105531, 0, 0, 0, 1, 1,
2.300521, -1.246567, 2.694097, 0, 0, 0, 1, 1,
2.308293, -1.64089, 2.609169, 0, 0, 0, 1, 1,
2.332569, -0.1746424, 1.781236, 0, 0, 0, 1, 1,
2.353494, 0.4117703, 0.7944706, 0, 0, 0, 1, 1,
2.379118, -0.7705637, 1.723806, 0, 0, 0, 1, 1,
2.416795, 0.3556108, 2.505681, 1, 1, 1, 1, 1,
2.448035, 0.1534966, 1.549785, 1, 1, 1, 1, 1,
2.470423, 1.844753, 1.752156, 1, 1, 1, 1, 1,
2.528958, -0.4330804, 2.135028, 1, 1, 1, 1, 1,
2.678573, -0.7485172, 2.575222, 1, 1, 1, 1, 1,
2.902715, 0.4606551, 3.259804, 1, 1, 1, 1, 1,
2.937637, 0.2242505, 1.869199, 1, 1, 1, 1, 1
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
var radius = 9.671564;
var distance = 33.97095;
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
mvMatrix.translate( 0.1586865, -0.08618784, -0.4789772 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.97095);
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