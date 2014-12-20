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
-2.883251, 0.4609099, 0.7954824, 1, 0, 0, 1,
-2.798744, -0.04810353, -2.169683, 1, 0.007843138, 0, 1,
-2.779917, 1.159348, -0.3733024, 1, 0.01176471, 0, 1,
-2.751368, 0.04427183, -0.4485893, 1, 0.01960784, 0, 1,
-2.472321, 2.047476, -1.009245, 1, 0.02352941, 0, 1,
-2.42176, -1.683466, -1.180191, 1, 0.03137255, 0, 1,
-2.421466, -1.211017, -2.757873, 1, 0.03529412, 0, 1,
-2.416354, -0.4439213, -1.334838, 1, 0.04313726, 0, 1,
-2.295788, 0.4076622, -2.636515, 1, 0.04705882, 0, 1,
-2.282972, -0.7463283, -3.91261, 1, 0.05490196, 0, 1,
-2.269635, -0.08851136, -2.516981, 1, 0.05882353, 0, 1,
-2.223151, 0.1627054, -2.074396, 1, 0.06666667, 0, 1,
-2.213417, 0.1053409, -0.8052728, 1, 0.07058824, 0, 1,
-2.212275, 0.9412138, -0.6051618, 1, 0.07843138, 0, 1,
-2.196167, -0.5599419, -1.85115, 1, 0.08235294, 0, 1,
-2.169553, -0.3059005, -2.89388, 1, 0.09019608, 0, 1,
-2.109671, -1.003619, -0.5499335, 1, 0.09411765, 0, 1,
-2.105114, 0.09482794, -1.981123, 1, 0.1019608, 0, 1,
-2.049254, -0.2256612, -1.171954, 1, 0.1098039, 0, 1,
-2.02934, 0.4895681, 1.117433, 1, 0.1137255, 0, 1,
-2.011017, 0.3229022, -1.337733, 1, 0.1215686, 0, 1,
-1.991578, -0.3447145, -1.694688, 1, 0.1254902, 0, 1,
-1.985963, -0.5860755, -2.393177, 1, 0.1333333, 0, 1,
-1.964728, -0.3460818, -1.638047, 1, 0.1372549, 0, 1,
-1.944969, 0.7606811, -1.964749, 1, 0.145098, 0, 1,
-1.926946, -0.03168271, -3.709728, 1, 0.1490196, 0, 1,
-1.916626, 1.095075, -2.250466, 1, 0.1568628, 0, 1,
-1.909168, -0.07702872, -2.140613, 1, 0.1607843, 0, 1,
-1.901278, -1.2917, -1.447846, 1, 0.1686275, 0, 1,
-1.854072, 0.2160215, -3.122813, 1, 0.172549, 0, 1,
-1.833104, -0.9287308, -1.096963, 1, 0.1803922, 0, 1,
-1.820289, 0.499218, -2.041445, 1, 0.1843137, 0, 1,
-1.813403, 0.171715, -2.524139, 1, 0.1921569, 0, 1,
-1.803915, -0.1857988, -1.140051, 1, 0.1960784, 0, 1,
-1.792597, 1.94258, -0.02981094, 1, 0.2039216, 0, 1,
-1.792583, -1.117642, -3.427879, 1, 0.2117647, 0, 1,
-1.790296, 0.3485713, -1.124297, 1, 0.2156863, 0, 1,
-1.774431, -0.3629141, -2.257032, 1, 0.2235294, 0, 1,
-1.77195, 0.7168129, -1.827297, 1, 0.227451, 0, 1,
-1.765348, 0.3164999, -0.9682347, 1, 0.2352941, 0, 1,
-1.721574, 0.8386223, -0.04098703, 1, 0.2392157, 0, 1,
-1.720751, 0.416202, -1.223504, 1, 0.2470588, 0, 1,
-1.679598, 2.018731, -0.9539739, 1, 0.2509804, 0, 1,
-1.67355, -0.9622008, -1.811714, 1, 0.2588235, 0, 1,
-1.665524, -1.391958, -1.960168, 1, 0.2627451, 0, 1,
-1.660494, -0.4697507, -1.880289, 1, 0.2705882, 0, 1,
-1.649442, -0.1447686, -1.709366, 1, 0.2745098, 0, 1,
-1.64266, 1.461519, 0.2932868, 1, 0.282353, 0, 1,
-1.638581, 1.78627, -1.039854, 1, 0.2862745, 0, 1,
-1.618123, 0.4145095, -3.885926, 1, 0.2941177, 0, 1,
-1.609855, 0.4687137, -2.145427, 1, 0.3019608, 0, 1,
-1.600757, 0.7372339, -0.2976253, 1, 0.3058824, 0, 1,
-1.585782, 1.683434, -0.8101714, 1, 0.3137255, 0, 1,
-1.57932, -0.3458397, -1.566728, 1, 0.3176471, 0, 1,
-1.540903, 1.724019, -1.513989, 1, 0.3254902, 0, 1,
-1.538274, -1.18823, -1.810104, 1, 0.3294118, 0, 1,
-1.526553, -1.280441, -2.192805, 1, 0.3372549, 0, 1,
-1.521597, -0.7270216, -2.745039, 1, 0.3411765, 0, 1,
-1.520219, 0.1085365, -1.676448, 1, 0.3490196, 0, 1,
-1.519493, 1.152639, -1.359145, 1, 0.3529412, 0, 1,
-1.517703, 0.4344613, -3.313761, 1, 0.3607843, 0, 1,
-1.514983, 1.10604, -0.3182165, 1, 0.3647059, 0, 1,
-1.510504, -1.298908, -2.947857, 1, 0.372549, 0, 1,
-1.508268, 0.1482669, -0.08483203, 1, 0.3764706, 0, 1,
-1.506947, -1.056362, -1.618552, 1, 0.3843137, 0, 1,
-1.496049, 0.8111978, -0.9454327, 1, 0.3882353, 0, 1,
-1.492485, -2.145673, -1.604403, 1, 0.3960784, 0, 1,
-1.490919, 0.6792941, -1.874303, 1, 0.4039216, 0, 1,
-1.489529, 0.2227373, -2.721008, 1, 0.4078431, 0, 1,
-1.477377, 0.9867365, -1.185703, 1, 0.4156863, 0, 1,
-1.387831, 0.315864, -1.714254, 1, 0.4196078, 0, 1,
-1.378377, -1.308201, -3.371844, 1, 0.427451, 0, 1,
-1.376171, -0.3776651, -2.837181, 1, 0.4313726, 0, 1,
-1.370464, 0.9471444, -3.524644, 1, 0.4392157, 0, 1,
-1.362504, 2.407616, -0.1042633, 1, 0.4431373, 0, 1,
-1.345955, 0.7429157, -1.234513, 1, 0.4509804, 0, 1,
-1.332723, -1.533088, -2.150512, 1, 0.454902, 0, 1,
-1.329699, -0.7407082, -2.943659, 1, 0.4627451, 0, 1,
-1.32827, 0.606348, -0.5043144, 1, 0.4666667, 0, 1,
-1.327853, -0.07624208, -3.214307, 1, 0.4745098, 0, 1,
-1.326379, -0.3746998, -3.253469, 1, 0.4784314, 0, 1,
-1.325691, 0.4428467, -0.2891873, 1, 0.4862745, 0, 1,
-1.322245, 1.08894, -2.156797, 1, 0.4901961, 0, 1,
-1.321669, -0.1580289, -0.9225622, 1, 0.4980392, 0, 1,
-1.316009, -2.143793, -3.758578, 1, 0.5058824, 0, 1,
-1.315033, 1.698919, -2.071378, 1, 0.509804, 0, 1,
-1.311429, -0.5939569, -2.513407, 1, 0.5176471, 0, 1,
-1.308404, -0.2610644, -2.344322, 1, 0.5215687, 0, 1,
-1.308159, 0.07040463, -0.8933724, 1, 0.5294118, 0, 1,
-1.306044, 0.9266955, -0.8815464, 1, 0.5333334, 0, 1,
-1.304139, -0.1105839, -2.070469, 1, 0.5411765, 0, 1,
-1.30212, -0.5098867, -2.225651, 1, 0.5450981, 0, 1,
-1.301028, -1.274335, -2.841632, 1, 0.5529412, 0, 1,
-1.289502, 0.679023, -1.320704, 1, 0.5568628, 0, 1,
-1.287695, -0.3042029, -1.760923, 1, 0.5647059, 0, 1,
-1.286714, 1.463007, 0.2012038, 1, 0.5686275, 0, 1,
-1.283818, -1.08068, -2.54788, 1, 0.5764706, 0, 1,
-1.28149, 1.1339, -1.953859, 1, 0.5803922, 0, 1,
-1.276391, -1.394832, -3.099928, 1, 0.5882353, 0, 1,
-1.272607, 0.217958, -0.4058399, 1, 0.5921569, 0, 1,
-1.270517, 0.9820279, -1.417673, 1, 0.6, 0, 1,
-1.270353, -0.1003519, -1.888427, 1, 0.6078432, 0, 1,
-1.269338, 1.150762, -0.3082721, 1, 0.6117647, 0, 1,
-1.26123, -0.4413888, -1.841549, 1, 0.6196079, 0, 1,
-1.259313, 1.724942, 0.6970032, 1, 0.6235294, 0, 1,
-1.254263, 0.6302022, 1.506447, 1, 0.6313726, 0, 1,
-1.250803, 0.6443596, -3.373253, 1, 0.6352941, 0, 1,
-1.248201, -1.167083, -0.4954458, 1, 0.6431373, 0, 1,
-1.244916, -0.576844, -2.528013, 1, 0.6470588, 0, 1,
-1.243361, -1.839364, -3.791739, 1, 0.654902, 0, 1,
-1.243044, -2.361161, -2.79122, 1, 0.6588235, 0, 1,
-1.239943, -0.3952808, -3.057546, 1, 0.6666667, 0, 1,
-1.231398, 1.107273, -0.4612093, 1, 0.6705883, 0, 1,
-1.230405, 0.5208384, -0.9574062, 1, 0.6784314, 0, 1,
-1.230232, 0.2725611, -2.42542, 1, 0.682353, 0, 1,
-1.22923, 0.1069034, -1.465907, 1, 0.6901961, 0, 1,
-1.228513, -2.351175, -3.003206, 1, 0.6941177, 0, 1,
-1.223074, 0.857266, -0.6843106, 1, 0.7019608, 0, 1,
-1.21701, -0.3753281, -1.638174, 1, 0.7098039, 0, 1,
-1.188811, -1.290054, -1.857233, 1, 0.7137255, 0, 1,
-1.183855, 0.3854964, 0.1310095, 1, 0.7215686, 0, 1,
-1.183371, -0.04355923, -1.844813, 1, 0.7254902, 0, 1,
-1.17146, 0.8180125, -0.5415142, 1, 0.7333333, 0, 1,
-1.16504, 0.7608585, 0.796429, 1, 0.7372549, 0, 1,
-1.162001, 0.2681111, -2.247567, 1, 0.7450981, 0, 1,
-1.156473, -1.261254, -1.668216, 1, 0.7490196, 0, 1,
-1.150774, -0.1191017, -1.807187, 1, 0.7568628, 0, 1,
-1.150714, 0.3815786, -0.5806487, 1, 0.7607843, 0, 1,
-1.132955, 0.2980126, -1.764492, 1, 0.7686275, 0, 1,
-1.109244, 0.8926312, 0.9875266, 1, 0.772549, 0, 1,
-1.103768, -0.8886768, -2.17626, 1, 0.7803922, 0, 1,
-1.103739, -1.575755, -3.085585, 1, 0.7843137, 0, 1,
-1.103694, -0.02445821, -1.521083, 1, 0.7921569, 0, 1,
-1.103227, -0.4391532, -2.827368, 1, 0.7960784, 0, 1,
-1.101035, 0.5205467, -0.7033144, 1, 0.8039216, 0, 1,
-1.094549, 0.3240943, -0.4235725, 1, 0.8117647, 0, 1,
-1.091467, 0.7599681, 0.02689232, 1, 0.8156863, 0, 1,
-1.084585, 2.327332, -1.499682, 1, 0.8235294, 0, 1,
-1.084351, -0.2694355, -1.699739, 1, 0.827451, 0, 1,
-1.082652, 0.9346396, -1.698366, 1, 0.8352941, 0, 1,
-1.060733, 1.777894, -0.7407214, 1, 0.8392157, 0, 1,
-1.060555, -0.1909582, -3.361146, 1, 0.8470588, 0, 1,
-1.056976, -0.01550411, -0.8565554, 1, 0.8509804, 0, 1,
-1.05577, 1.907978, 1.314831, 1, 0.8588235, 0, 1,
-1.054196, 0.4496338, -1.551541, 1, 0.8627451, 0, 1,
-1.042774, 0.05536538, -1.137209, 1, 0.8705882, 0, 1,
-1.032692, 0.9723361, 0.9919329, 1, 0.8745098, 0, 1,
-1.029889, -1.054939, -1.96242, 1, 0.8823529, 0, 1,
-1.029128, -2.189419, -4.028887, 1, 0.8862745, 0, 1,
-1.026822, 0.04882612, -2.02931, 1, 0.8941177, 0, 1,
-1.026643, -1.001898, -3.590769, 1, 0.8980392, 0, 1,
-1.022461, -0.2257272, -3.302814, 1, 0.9058824, 0, 1,
-1.021878, 1.383475, 0.6064219, 1, 0.9137255, 0, 1,
-1.017784, -0.6246418, -3.27072, 1, 0.9176471, 0, 1,
-1.016625, -1.01685, -3.067213, 1, 0.9254902, 0, 1,
-1.016274, 1.126048, -0.5576754, 1, 0.9294118, 0, 1,
-1.013646, 0.03560148, -2.556731, 1, 0.9372549, 0, 1,
-1.006015, -0.9872548, -2.341686, 1, 0.9411765, 0, 1,
-1.002913, -1.085042, -2.085143, 1, 0.9490196, 0, 1,
-1.000695, 0.6667333, -1.716338, 1, 0.9529412, 0, 1,
-1.000425, 0.5114471, -1.371056, 1, 0.9607843, 0, 1,
-1.00004, -0.6464617, -1.394848, 1, 0.9647059, 0, 1,
-0.9954467, 0.6643336, -0.3949613, 1, 0.972549, 0, 1,
-0.9908607, 1.355758, -0.3060599, 1, 0.9764706, 0, 1,
-0.990385, -1.711963, -0.5028102, 1, 0.9843137, 0, 1,
-0.9875576, 0.4742474, -0.7910254, 1, 0.9882353, 0, 1,
-0.9859196, 1.990399, 0.6825701, 1, 0.9960784, 0, 1,
-0.9844882, 0.8481867, -2.623346, 0.9960784, 1, 0, 1,
-0.9760436, 0.514986, 0.8678221, 0.9921569, 1, 0, 1,
-0.9710476, 0.2555907, -2.050004, 0.9843137, 1, 0, 1,
-0.9652978, -0.1453831, -0.6550359, 0.9803922, 1, 0, 1,
-0.9639134, 0.06562989, -1.770374, 0.972549, 1, 0, 1,
-0.9631148, 0.5706549, -0.5401779, 0.9686275, 1, 0, 1,
-0.9605376, -0.01079249, -1.099775, 0.9607843, 1, 0, 1,
-0.9594874, -0.337925, -2.744214, 0.9568627, 1, 0, 1,
-0.9589448, 1.245741, -0.5521749, 0.9490196, 1, 0, 1,
-0.9574353, -2.26427, -2.776949, 0.945098, 1, 0, 1,
-0.9496396, 1.077435, 0.7735156, 0.9372549, 1, 0, 1,
-0.9488787, 0.5140836, -1.179677, 0.9333333, 1, 0, 1,
-0.9472117, 0.3426662, -1.864329, 0.9254902, 1, 0, 1,
-0.9438054, 0.1288769, -0.3595693, 0.9215686, 1, 0, 1,
-0.9346671, 0.7567902, -0.246508, 0.9137255, 1, 0, 1,
-0.9253576, 1.489147, -0.5281493, 0.9098039, 1, 0, 1,
-0.9226635, 0.404081, -1.114782, 0.9019608, 1, 0, 1,
-0.915318, -0.891011, -2.345263, 0.8941177, 1, 0, 1,
-0.914682, 0.8752249, -2.082018, 0.8901961, 1, 0, 1,
-0.9050323, -0.8015916, -1.36368, 0.8823529, 1, 0, 1,
-0.9028893, -0.3312899, -2.195893, 0.8784314, 1, 0, 1,
-0.8996595, 0.1015327, -1.755977, 0.8705882, 1, 0, 1,
-0.8944947, 0.7963369, 0.6720863, 0.8666667, 1, 0, 1,
-0.893713, -0.1481289, -1.802883, 0.8588235, 1, 0, 1,
-0.8882871, -0.4081364, -1.011582, 0.854902, 1, 0, 1,
-0.8794701, 0.3075991, -2.240641, 0.8470588, 1, 0, 1,
-0.8769851, 1.906626, -0.9575269, 0.8431373, 1, 0, 1,
-0.8695925, 0.8123555, -0.07395346, 0.8352941, 1, 0, 1,
-0.8601808, -0.5927963, -1.292776, 0.8313726, 1, 0, 1,
-0.854764, 1.295824, 0.2658297, 0.8235294, 1, 0, 1,
-0.8492399, 2.143761, 0.7084255, 0.8196079, 1, 0, 1,
-0.8491193, 1.054946, -0.886741, 0.8117647, 1, 0, 1,
-0.8476844, -0.0882265, -0.670408, 0.8078431, 1, 0, 1,
-0.844448, 1.206886, -1.005488, 0.8, 1, 0, 1,
-0.8420795, 0.9621475, 0.3252317, 0.7921569, 1, 0, 1,
-0.8409054, 0.8919811, -0.3346314, 0.7882353, 1, 0, 1,
-0.8368902, -1.360229, -3.039861, 0.7803922, 1, 0, 1,
-0.8343422, -0.1220848, -1.391021, 0.7764706, 1, 0, 1,
-0.8283635, 0.5364016, -0.8721408, 0.7686275, 1, 0, 1,
-0.8224654, 2.06137, -1.29317, 0.7647059, 1, 0, 1,
-0.8212737, -0.04503433, -1.850624, 0.7568628, 1, 0, 1,
-0.8203136, -0.5383332, -0.4498912, 0.7529412, 1, 0, 1,
-0.8179094, 0.5465248, -1.876829, 0.7450981, 1, 0, 1,
-0.8126428, -0.9098869, -2.173854, 0.7411765, 1, 0, 1,
-0.8052641, -1.186283, -0.757749, 0.7333333, 1, 0, 1,
-0.8027427, -0.9396896, -1.595218, 0.7294118, 1, 0, 1,
-0.8019192, 0.7273688, -0.5700382, 0.7215686, 1, 0, 1,
-0.7961186, 0.6556129, -0.4167618, 0.7176471, 1, 0, 1,
-0.7935066, -0.6100333, -2.474344, 0.7098039, 1, 0, 1,
-0.7896206, -0.4393961, -1.226968, 0.7058824, 1, 0, 1,
-0.789509, 1.861526, -0.007169453, 0.6980392, 1, 0, 1,
-0.7790084, -1.190394, -3.174039, 0.6901961, 1, 0, 1,
-0.7738451, -0.5791931, -0.8080041, 0.6862745, 1, 0, 1,
-0.7702986, -0.9343671, -2.893256, 0.6784314, 1, 0, 1,
-0.7692659, -0.2396004, -0.3882781, 0.6745098, 1, 0, 1,
-0.7543317, -0.4927002, -2.609375, 0.6666667, 1, 0, 1,
-0.7479138, -0.3774193, -2.819177, 0.6627451, 1, 0, 1,
-0.7478032, -0.07651208, -0.4836606, 0.654902, 1, 0, 1,
-0.7472494, -1.196745, -2.290562, 0.6509804, 1, 0, 1,
-0.7454545, -0.8476463, -3.791918, 0.6431373, 1, 0, 1,
-0.7448966, -0.9060195, -3.073914, 0.6392157, 1, 0, 1,
-0.7407998, -0.3268417, -1.467719, 0.6313726, 1, 0, 1,
-0.740719, 1.700001, 0.4026738, 0.627451, 1, 0, 1,
-0.7392015, -0.2428212, -2.827331, 0.6196079, 1, 0, 1,
-0.7349982, -0.1290063, -0.306632, 0.6156863, 1, 0, 1,
-0.7310925, 0.7285069, 1.305305, 0.6078432, 1, 0, 1,
-0.7258214, 0.02372105, -1.637931, 0.6039216, 1, 0, 1,
-0.724934, -0.4394144, -2.237585, 0.5960785, 1, 0, 1,
-0.7235987, 1.144439, 0.4508177, 0.5882353, 1, 0, 1,
-0.7232626, -0.6797197, -4.07818, 0.5843138, 1, 0, 1,
-0.7200501, 0.9681283, -2.74257, 0.5764706, 1, 0, 1,
-0.7198879, 2.055007, -0.8326262, 0.572549, 1, 0, 1,
-0.7162878, 2.122899, -1.070008, 0.5647059, 1, 0, 1,
-0.7130534, 0.3104598, 0.1977488, 0.5607843, 1, 0, 1,
-0.7117856, -0.7480936, -2.437229, 0.5529412, 1, 0, 1,
-0.711762, 1.333163, -0.7898783, 0.5490196, 1, 0, 1,
-0.7105609, 1.14492, 0.9951191, 0.5411765, 1, 0, 1,
-0.7041298, 0.5823584, -1.739879, 0.5372549, 1, 0, 1,
-0.7038179, -0.696966, -1.224718, 0.5294118, 1, 0, 1,
-0.6988033, 2.280828, -0.4252065, 0.5254902, 1, 0, 1,
-0.6939024, 0.2903564, -1.873552, 0.5176471, 1, 0, 1,
-0.693448, 2.019586, -1.060116, 0.5137255, 1, 0, 1,
-0.6898604, 0.5202584, 1.137624, 0.5058824, 1, 0, 1,
-0.6850548, -1.022172, -1.107292, 0.5019608, 1, 0, 1,
-0.6843495, 1.143949, 0.5449266, 0.4941176, 1, 0, 1,
-0.6795039, -0.7913324, -3.087292, 0.4862745, 1, 0, 1,
-0.6773633, -0.04721626, -4.536908, 0.4823529, 1, 0, 1,
-0.6758296, 0.1710754, -0.4239396, 0.4745098, 1, 0, 1,
-0.67299, -0.2724034, -0.7863448, 0.4705882, 1, 0, 1,
-0.6726625, 1.535362, -0.7033901, 0.4627451, 1, 0, 1,
-0.6718696, 1.036249, -0.970608, 0.4588235, 1, 0, 1,
-0.6700196, -0.6624526, -2.370787, 0.4509804, 1, 0, 1,
-0.6675092, 1.306724, 0.7906085, 0.4470588, 1, 0, 1,
-0.6665649, 0.9249247, 1.048235, 0.4392157, 1, 0, 1,
-0.6622739, 1.241483, -1.598142, 0.4352941, 1, 0, 1,
-0.6605307, 1.785485, 0.2282876, 0.427451, 1, 0, 1,
-0.6586517, 0.5271204, -2.174687, 0.4235294, 1, 0, 1,
-0.6569586, 0.4492273, 0.4575055, 0.4156863, 1, 0, 1,
-0.6517016, -0.9217442, -3.44135, 0.4117647, 1, 0, 1,
-0.6509487, -1.258275, -2.714011, 0.4039216, 1, 0, 1,
-0.6441241, -2.299058, -3.091625, 0.3960784, 1, 0, 1,
-0.6438169, -0.9737759, -2.76095, 0.3921569, 1, 0, 1,
-0.6437094, -0.6828731, -3.435469, 0.3843137, 1, 0, 1,
-0.6434691, 1.490741, 0.1754976, 0.3803922, 1, 0, 1,
-0.6390623, -0.7951556, -2.242534, 0.372549, 1, 0, 1,
-0.6383516, -1.146329, -3.23976, 0.3686275, 1, 0, 1,
-0.6373392, 1.16293, -1.129311, 0.3607843, 1, 0, 1,
-0.6335464, 0.2031019, -0.6971179, 0.3568628, 1, 0, 1,
-0.6320677, 0.2324806, -2.035445, 0.3490196, 1, 0, 1,
-0.6275335, -0.1011767, -1.36587, 0.345098, 1, 0, 1,
-0.626789, 0.07093521, -1.037646, 0.3372549, 1, 0, 1,
-0.6234557, -1.093123, -2.052086, 0.3333333, 1, 0, 1,
-0.6212924, -1.237202, -2.914223, 0.3254902, 1, 0, 1,
-0.6138651, -1.554605, -1.877034, 0.3215686, 1, 0, 1,
-0.6072845, -0.3995613, -1.088575, 0.3137255, 1, 0, 1,
-0.6048055, -0.6097584, -2.503206, 0.3098039, 1, 0, 1,
-0.6034587, -0.6513002, -1.734934, 0.3019608, 1, 0, 1,
-0.5994557, -0.4583525, -2.21124, 0.2941177, 1, 0, 1,
-0.5984132, -1.966366, -2.69664, 0.2901961, 1, 0, 1,
-0.5950187, 0.5879651, -1.219919, 0.282353, 1, 0, 1,
-0.5904325, -0.2890443, -2.147307, 0.2784314, 1, 0, 1,
-0.5870894, 1.137745, -0.2293178, 0.2705882, 1, 0, 1,
-0.5855316, 0.4623307, -0.6485968, 0.2666667, 1, 0, 1,
-0.5852689, 0.134026, -1.449145, 0.2588235, 1, 0, 1,
-0.5792627, -1.382916, -1.605177, 0.254902, 1, 0, 1,
-0.571584, -1.044631, -4.704366, 0.2470588, 1, 0, 1,
-0.5696852, -0.791589, -3.008803, 0.2431373, 1, 0, 1,
-0.562385, -0.1717772, -2.959373, 0.2352941, 1, 0, 1,
-0.5610552, 0.9137973, -0.2952892, 0.2313726, 1, 0, 1,
-0.5586398, 0.7571549, 0.058606, 0.2235294, 1, 0, 1,
-0.558454, 2.232737, -0.09121852, 0.2196078, 1, 0, 1,
-0.5548126, -1.497258, -3.227736, 0.2117647, 1, 0, 1,
-0.5544628, -3.609842, -3.370726, 0.2078431, 1, 0, 1,
-0.5526374, -1.94424, -4.55357, 0.2, 1, 0, 1,
-0.5481931, 0.610947, -2.595389, 0.1921569, 1, 0, 1,
-0.5477124, -1.175981, -2.872503, 0.1882353, 1, 0, 1,
-0.545724, 1.777011, -2.115736, 0.1803922, 1, 0, 1,
-0.5445128, -1.511133, -1.899393, 0.1764706, 1, 0, 1,
-0.5388668, -0.7941305, -3.51885, 0.1686275, 1, 0, 1,
-0.5376968, -0.3341833, -1.913184, 0.1647059, 1, 0, 1,
-0.5354786, -0.607193, -1.878571, 0.1568628, 1, 0, 1,
-0.5337625, 0.7351449, -0.3787159, 0.1529412, 1, 0, 1,
-0.5277951, 0.6617092, -1.869599, 0.145098, 1, 0, 1,
-0.5247313, 0.3758669, -1.50197, 0.1411765, 1, 0, 1,
-0.5204097, 0.08285242, -2.149857, 0.1333333, 1, 0, 1,
-0.5191725, 0.09052059, 0.06516408, 0.1294118, 1, 0, 1,
-0.5188406, -2.003525, -1.023194, 0.1215686, 1, 0, 1,
-0.5134701, 0.8998005, 0.7399582, 0.1176471, 1, 0, 1,
-0.5130772, 0.9947153, 0.2233705, 0.1098039, 1, 0, 1,
-0.5094026, 1.739795, -0.9851741, 0.1058824, 1, 0, 1,
-0.5064254, -0.1438298, -3.126602, 0.09803922, 1, 0, 1,
-0.5062448, 0.6518201, -1.404132, 0.09019608, 1, 0, 1,
-0.4891177, 0.872247, -0.3671703, 0.08627451, 1, 0, 1,
-0.4882647, 0.9851807, 2.389852, 0.07843138, 1, 0, 1,
-0.4879483, -0.9890212, -1.507738, 0.07450981, 1, 0, 1,
-0.4867029, 0.2681457, 1.742483, 0.06666667, 1, 0, 1,
-0.4860838, -0.795323, -2.211197, 0.0627451, 1, 0, 1,
-0.4834977, 1.748712, 1.543447, 0.05490196, 1, 0, 1,
-0.4817826, -0.2934024, -2.330184, 0.05098039, 1, 0, 1,
-0.4780469, 0.743862, -1.006401, 0.04313726, 1, 0, 1,
-0.4777417, -0.3988247, -1.903185, 0.03921569, 1, 0, 1,
-0.4757874, 1.22017, 0.2400306, 0.03137255, 1, 0, 1,
-0.4742958, -0.5460893, -0.7730295, 0.02745098, 1, 0, 1,
-0.4719289, -0.0003158529, -3.302787, 0.01960784, 1, 0, 1,
-0.4717268, -0.5544016, -2.594963, 0.01568628, 1, 0, 1,
-0.4709973, -0.1694456, -1.640513, 0.007843138, 1, 0, 1,
-0.4692393, 0.8501657, 0.6412376, 0.003921569, 1, 0, 1,
-0.4646994, 0.05476546, -2.186238, 0, 1, 0.003921569, 1,
-0.4646323, -0.4399086, -3.020272, 0, 1, 0.01176471, 1,
-0.4642515, -0.5702683, -1.197697, 0, 1, 0.01568628, 1,
-0.4610239, -0.6307065, -2.416103, 0, 1, 0.02352941, 1,
-0.4547611, -0.8232078, -3.290341, 0, 1, 0.02745098, 1,
-0.454408, -1.771859, -3.34843, 0, 1, 0.03529412, 1,
-0.4525082, -0.3653064, -0.4783141, 0, 1, 0.03921569, 1,
-0.4481041, 0.8753715, 0.266205, 0, 1, 0.04705882, 1,
-0.4478632, -0.8517403, -2.892439, 0, 1, 0.05098039, 1,
-0.4470933, -0.5782618, -1.840196, 0, 1, 0.05882353, 1,
-0.4449121, -0.9418894, -1.793938, 0, 1, 0.0627451, 1,
-0.4438307, -0.8208444, -2.932297, 0, 1, 0.07058824, 1,
-0.4429113, 0.06439929, -1.663653, 0, 1, 0.07450981, 1,
-0.4397207, 1.849802, -0.3447944, 0, 1, 0.08235294, 1,
-0.4378066, -1.088124, -2.27465, 0, 1, 0.08627451, 1,
-0.4361928, -0.1755978, -1.037863, 0, 1, 0.09411765, 1,
-0.4359574, 1.051188, -0.009006361, 0, 1, 0.1019608, 1,
-0.4333975, -1.084508, -2.486756, 0, 1, 0.1058824, 1,
-0.4274924, -1.317047, -2.603712, 0, 1, 0.1137255, 1,
-0.4271458, 0.009755129, -0.9619491, 0, 1, 0.1176471, 1,
-0.4245906, 0.4985022, -0.5208924, 0, 1, 0.1254902, 1,
-0.4238455, -0.09211089, -1.867468, 0, 1, 0.1294118, 1,
-0.4204988, -0.08448937, -1.005347, 0, 1, 0.1372549, 1,
-0.408083, 0.1223532, -1.673141, 0, 1, 0.1411765, 1,
-0.400379, -0.9367641, -0.7723081, 0, 1, 0.1490196, 1,
-0.3989635, 1.171241, -1.971354, 0, 1, 0.1529412, 1,
-0.3976667, -0.4002016, -2.266026, 0, 1, 0.1607843, 1,
-0.3899203, -1.976397, -2.559449, 0, 1, 0.1647059, 1,
-0.3887126, 1.374091, -0.766467, 0, 1, 0.172549, 1,
-0.3863616, -1.826293, -2.647415, 0, 1, 0.1764706, 1,
-0.3798187, 0.615398, 0.8267431, 0, 1, 0.1843137, 1,
-0.3792018, 1.050015, -0.7782761, 0, 1, 0.1882353, 1,
-0.3780604, -0.09283391, -1.428094, 0, 1, 0.1960784, 1,
-0.3752886, -0.6177503, -2.451198, 0, 1, 0.2039216, 1,
-0.3720203, 0.9431194, -2.061788, 0, 1, 0.2078431, 1,
-0.3706125, -0.8576267, -1.420479, 0, 1, 0.2156863, 1,
-0.3680962, 1.193575, 0.312035, 0, 1, 0.2196078, 1,
-0.3678603, 2.605336, 2.136225, 0, 1, 0.227451, 1,
-0.3656484, -1.485776, -3.338183, 0, 1, 0.2313726, 1,
-0.3655024, -1.133569, -2.736521, 0, 1, 0.2392157, 1,
-0.3653975, 0.9268641, -0.555347, 0, 1, 0.2431373, 1,
-0.363776, 0.6917189, -0.8857257, 0, 1, 0.2509804, 1,
-0.3609629, 1.217625, -1.615665, 0, 1, 0.254902, 1,
-0.3538727, 1.380261, -1.774178, 0, 1, 0.2627451, 1,
-0.3534721, -1.477907, -2.851796, 0, 1, 0.2666667, 1,
-0.3514093, 1.006554, 1.065796, 0, 1, 0.2745098, 1,
-0.3497479, 0.5100946, -0.7486166, 0, 1, 0.2784314, 1,
-0.3475399, -1.857071, -2.068466, 0, 1, 0.2862745, 1,
-0.3459006, 0.6831836, -0.4409525, 0, 1, 0.2901961, 1,
-0.3419006, -0.1971937, -1.811582, 0, 1, 0.2980392, 1,
-0.3413208, -0.3236348, -0.5487608, 0, 1, 0.3058824, 1,
-0.3397892, 1.196555, -0.4235168, 0, 1, 0.3098039, 1,
-0.3394644, 0.902913, -0.8824093, 0, 1, 0.3176471, 1,
-0.338796, 0.03053385, -1.195639, 0, 1, 0.3215686, 1,
-0.3352995, -0.0555715, -2.415064, 0, 1, 0.3294118, 1,
-0.3329569, 1.848244, 1.685158, 0, 1, 0.3333333, 1,
-0.3317317, -1.032502, -2.231295, 0, 1, 0.3411765, 1,
-0.3303584, -0.3153968, -2.501582, 0, 1, 0.345098, 1,
-0.3287426, 0.3263355, -1.8365, 0, 1, 0.3529412, 1,
-0.3277559, 1.146907, 0.9380932, 0, 1, 0.3568628, 1,
-0.3195907, -0.90233, -3.350369, 0, 1, 0.3647059, 1,
-0.3187207, -0.9774597, -0.5121348, 0, 1, 0.3686275, 1,
-0.3166665, 0.986932, 0.07849725, 0, 1, 0.3764706, 1,
-0.315045, 0.6403495, -2.005381, 0, 1, 0.3803922, 1,
-0.3125783, -0.5924184, -1.358758, 0, 1, 0.3882353, 1,
-0.3106966, -2.222203, -1.322746, 0, 1, 0.3921569, 1,
-0.3087433, 1.327191, 0.1278869, 0, 1, 0.4, 1,
-0.3081594, 1.091186, -0.3609214, 0, 1, 0.4078431, 1,
-0.3017149, 1.646838, -0.4393127, 0, 1, 0.4117647, 1,
-0.3015489, -0.2245509, -2.892091, 0, 1, 0.4196078, 1,
-0.2996826, -0.6261814, -4.218566, 0, 1, 0.4235294, 1,
-0.2957942, -0.9369127, -3.110063, 0, 1, 0.4313726, 1,
-0.2926417, -0.5379586, -2.241139, 0, 1, 0.4352941, 1,
-0.2903123, 0.01623703, -0.948779, 0, 1, 0.4431373, 1,
-0.2861381, 0.5566983, 0.5744455, 0, 1, 0.4470588, 1,
-0.2847112, -1.092968, -2.566864, 0, 1, 0.454902, 1,
-0.2841796, -0.5564656, -2.155542, 0, 1, 0.4588235, 1,
-0.2797089, 0.6460594, 0.5969711, 0, 1, 0.4666667, 1,
-0.2778004, 1.341348, -0.6151434, 0, 1, 0.4705882, 1,
-0.2751789, 1.10596, -0.2205202, 0, 1, 0.4784314, 1,
-0.2737131, 0.3550077, -2.014903, 0, 1, 0.4823529, 1,
-0.2701431, -0.6628765, -1.166491, 0, 1, 0.4901961, 1,
-0.2700938, -0.865666, -3.440386, 0, 1, 0.4941176, 1,
-0.2680326, 0.8860105, -1.584565, 0, 1, 0.5019608, 1,
-0.262899, 0.5813977, -1.174975, 0, 1, 0.509804, 1,
-0.2596533, 0.5448998, 0.6559741, 0, 1, 0.5137255, 1,
-0.2576356, 0.1504953, -0.5350032, 0, 1, 0.5215687, 1,
-0.2553159, 0.4777852, -0.6673428, 0, 1, 0.5254902, 1,
-0.2538395, -1.608637, -4.070055, 0, 1, 0.5333334, 1,
-0.2527274, 1.064938, 0.04480585, 0, 1, 0.5372549, 1,
-0.252463, 0.6900786, -0.2897393, 0, 1, 0.5450981, 1,
-0.2520561, 0.5956274, -0.1612913, 0, 1, 0.5490196, 1,
-0.2487901, 1.68236, 0.3111377, 0, 1, 0.5568628, 1,
-0.244547, -0.5606343, -3.374822, 0, 1, 0.5607843, 1,
-0.2388951, 0.5578041, -0.3577052, 0, 1, 0.5686275, 1,
-0.2312167, -0.5187271, -3.300956, 0, 1, 0.572549, 1,
-0.2304395, 0.7867586, 0.4238421, 0, 1, 0.5803922, 1,
-0.2275874, -0.5138416, -1.989735, 0, 1, 0.5843138, 1,
-0.2152295, 1.694173, 0.06294417, 0, 1, 0.5921569, 1,
-0.2150576, 0.01383165, -1.517029, 0, 1, 0.5960785, 1,
-0.2130833, -0.5049307, -2.930134, 0, 1, 0.6039216, 1,
-0.2125896, -1.748629, -2.779748, 0, 1, 0.6117647, 1,
-0.2103388, -0.7748768, -2.588456, 0, 1, 0.6156863, 1,
-0.2089004, 0.2573227, -1.101388, 0, 1, 0.6235294, 1,
-0.2045081, 0.4410715, -0.2899882, 0, 1, 0.627451, 1,
-0.2027946, -0.02073556, -2.428072, 0, 1, 0.6352941, 1,
-0.2005984, -0.925161, -2.839254, 0, 1, 0.6392157, 1,
-0.1948539, 0.2354852, -0.09979311, 0, 1, 0.6470588, 1,
-0.1923032, -1.715093, -4.703547, 0, 1, 0.6509804, 1,
-0.1856344, -0.5515022, -1.050846, 0, 1, 0.6588235, 1,
-0.1829188, -0.582384, -2.365158, 0, 1, 0.6627451, 1,
-0.182729, -1.00596, -3.63418, 0, 1, 0.6705883, 1,
-0.1825169, -0.7901354, -4.365533, 0, 1, 0.6745098, 1,
-0.1792002, 1.606613, -0.1451491, 0, 1, 0.682353, 1,
-0.1758277, 1.146485, -0.3238304, 0, 1, 0.6862745, 1,
-0.1751913, 1.123483, -1.656654, 0, 1, 0.6941177, 1,
-0.1747097, -0.5825933, -3.400051, 0, 1, 0.7019608, 1,
-0.1742656, 1.079358, 0.01005419, 0, 1, 0.7058824, 1,
-0.1710437, 0.4052446, -0.1493911, 0, 1, 0.7137255, 1,
-0.1697364, -0.9651756, -3.113191, 0, 1, 0.7176471, 1,
-0.16931, 0.1136294, 0.1092721, 0, 1, 0.7254902, 1,
-0.168024, 0.1944717, -1.848866, 0, 1, 0.7294118, 1,
-0.1639423, -0.5293563, -1.04755, 0, 1, 0.7372549, 1,
-0.1563518, -0.3646335, -3.914195, 0, 1, 0.7411765, 1,
-0.1550554, 1.213785, -0.6280823, 0, 1, 0.7490196, 1,
-0.1510893, 0.7456378, 2.105794, 0, 1, 0.7529412, 1,
-0.1506634, -1.211808, -1.735744, 0, 1, 0.7607843, 1,
-0.1481826, 0.3820206, 0.7220702, 0, 1, 0.7647059, 1,
-0.1449114, -0.3083926, -3.435626, 0, 1, 0.772549, 1,
-0.1342667, -0.4174743, -2.751231, 0, 1, 0.7764706, 1,
-0.1315836, 0.5209002, 1.278852, 0, 1, 0.7843137, 1,
-0.1312748, -1.95353, -2.121022, 0, 1, 0.7882353, 1,
-0.1297542, -0.3543222, -2.135263, 0, 1, 0.7960784, 1,
-0.125585, -0.8941144, -0.494619, 0, 1, 0.8039216, 1,
-0.125314, 0.2737526, -2.283938, 0, 1, 0.8078431, 1,
-0.1222674, -0.9440053, -3.714906, 0, 1, 0.8156863, 1,
-0.112874, -0.3271419, -5.271599, 0, 1, 0.8196079, 1,
-0.1088339, 0.5706824, 0.09979862, 0, 1, 0.827451, 1,
-0.1061905, 0.05850044, -1.658782, 0, 1, 0.8313726, 1,
-0.09804981, 0.4049165, 0.5132544, 0, 1, 0.8392157, 1,
-0.09553945, 0.4024874, -0.2031516, 0, 1, 0.8431373, 1,
-0.09369354, -1.875895, -3.938501, 0, 1, 0.8509804, 1,
-0.08646754, -0.371458, -2.519417, 0, 1, 0.854902, 1,
-0.08473895, -1.244225, -3.52806, 0, 1, 0.8627451, 1,
-0.08008835, 0.2833512, 0.5548841, 0, 1, 0.8666667, 1,
-0.07900476, 0.05517478, -0.3947894, 0, 1, 0.8745098, 1,
-0.07574829, -0.7198697, -2.158984, 0, 1, 0.8784314, 1,
-0.07456487, 1.347413, -0.3200891, 0, 1, 0.8862745, 1,
-0.07170702, -1.059666, -2.822527, 0, 1, 0.8901961, 1,
-0.07117496, -1.261072, -0.994913, 0, 1, 0.8980392, 1,
-0.06749593, -1.240544, -1.444605, 0, 1, 0.9058824, 1,
-0.06325153, -2.561806, -3.485221, 0, 1, 0.9098039, 1,
-0.06073174, 0.2218849, 0.9579888, 0, 1, 0.9176471, 1,
-0.05701015, -1.029421, -2.896809, 0, 1, 0.9215686, 1,
-0.05614108, -0.3971979, -4.340153, 0, 1, 0.9294118, 1,
-0.05571801, 0.7863901, 1.815009, 0, 1, 0.9333333, 1,
-0.0524008, 0.200215, -1.290045, 0, 1, 0.9411765, 1,
-0.05239968, -0.03167996, -1.258442, 0, 1, 0.945098, 1,
-0.05231844, 0.4323486, -1.138737, 0, 1, 0.9529412, 1,
-0.04895395, -1.491581, -5.404196, 0, 1, 0.9568627, 1,
-0.04668908, 1.837129, 0.8496485, 0, 1, 0.9647059, 1,
-0.04580786, -1.059703, -3.621538, 0, 1, 0.9686275, 1,
-0.04298592, -1.435303, -4.024617, 0, 1, 0.9764706, 1,
-0.04229791, 1.750913, 0.7871624, 0, 1, 0.9803922, 1,
-0.04141433, -0.8921438, -2.831133, 0, 1, 0.9882353, 1,
-0.03522478, 1.330129, 0.006302537, 0, 1, 0.9921569, 1,
-0.03244901, -0.4520255, -3.794711, 0, 1, 1, 1,
-0.03192638, -0.9165074, -3.079805, 0, 0.9921569, 1, 1,
-0.02988919, -1.275879, -3.147553, 0, 0.9882353, 1, 1,
-0.02896706, 0.1992656, -0.06288894, 0, 0.9803922, 1, 1,
-0.01865711, -0.8138565, -3.228931, 0, 0.9764706, 1, 1,
-0.01795622, 0.9542419, -0.1626388, 0, 0.9686275, 1, 1,
-0.01740377, 0.8602975, 0.199552, 0, 0.9647059, 1, 1,
-0.01622213, -0.9291165, -2.352782, 0, 0.9568627, 1, 1,
-0.01557124, 0.8004305, 1.186635, 0, 0.9529412, 1, 1,
-0.01346674, 0.4078882, 0.04651131, 0, 0.945098, 1, 1,
-0.008783476, -0.2620861, -3.539541, 0, 0.9411765, 1, 1,
-0.002659833, -0.662619, -4.557438, 0, 0.9333333, 1, 1,
-0.0006655612, 2.463576, -0.8646307, 0, 0.9294118, 1, 1,
0.001714535, 0.6963986, -0.3079807, 0, 0.9215686, 1, 1,
0.008774466, -2.015676, 2.383213, 0, 0.9176471, 1, 1,
0.01537104, -0.2463965, 3.682951, 0, 0.9098039, 1, 1,
0.01720671, 0.6475875, 1.755566, 0, 0.9058824, 1, 1,
0.01764577, -0.6848175, 3.886485, 0, 0.8980392, 1, 1,
0.02207489, 0.3609439, -1.053037, 0, 0.8901961, 1, 1,
0.02321343, 0.6612414, -0.5107422, 0, 0.8862745, 1, 1,
0.02649224, -0.7700911, 2.864579, 0, 0.8784314, 1, 1,
0.02927379, 0.1625485, -0.1052796, 0, 0.8745098, 1, 1,
0.03016877, 0.486844, 1.089421, 0, 0.8666667, 1, 1,
0.03039444, -0.6741216, 4.354444, 0, 0.8627451, 1, 1,
0.0337927, 0.8452094, -0.1426284, 0, 0.854902, 1, 1,
0.0364027, 0.6534219, -0.9166203, 0, 0.8509804, 1, 1,
0.03704637, -1.568237, 3.22828, 0, 0.8431373, 1, 1,
0.03930523, 1.495116, 0.4428127, 0, 0.8392157, 1, 1,
0.04011164, -2.207632, 2.854166, 0, 0.8313726, 1, 1,
0.04546717, -0.2430736, 1.945288, 0, 0.827451, 1, 1,
0.04854982, -0.521504, 5.52085, 0, 0.8196079, 1, 1,
0.05165189, 1.072788, -1.057867, 0, 0.8156863, 1, 1,
0.05374313, -0.07127351, 1.452711, 0, 0.8078431, 1, 1,
0.05430682, 0.7712438, -0.4610295, 0, 0.8039216, 1, 1,
0.05909218, -0.1238936, 4.210406, 0, 0.7960784, 1, 1,
0.06608848, 1.453671, 0.1414281, 0, 0.7882353, 1, 1,
0.06927275, 0.8677422, 0.07996984, 0, 0.7843137, 1, 1,
0.07942142, 1.692568, -0.9517259, 0, 0.7764706, 1, 1,
0.08044618, -1.019067, 4.278772, 0, 0.772549, 1, 1,
0.0838572, -0.8136382, 2.54526, 0, 0.7647059, 1, 1,
0.08736846, 0.3475931, 1.435249, 0, 0.7607843, 1, 1,
0.09076203, -0.3856183, 1.235037, 0, 0.7529412, 1, 1,
0.09904984, 0.8704461, -1.712498, 0, 0.7490196, 1, 1,
0.09956873, -1.346025, 3.488775, 0, 0.7411765, 1, 1,
0.09994137, -0.8428686, 1.910856, 0, 0.7372549, 1, 1,
0.1002434, 0.9668668, -0.9582828, 0, 0.7294118, 1, 1,
0.1036234, -0.2293161, 2.018537, 0, 0.7254902, 1, 1,
0.1040522, -0.3573594, 2.063519, 0, 0.7176471, 1, 1,
0.1059299, 3.023689, 0.07567376, 0, 0.7137255, 1, 1,
0.1065566, -2.143035, 1.679821, 0, 0.7058824, 1, 1,
0.1066957, 0.3800418, 0.2750395, 0, 0.6980392, 1, 1,
0.1148195, -0.3986615, 3.459855, 0, 0.6941177, 1, 1,
0.1159037, 1.49222, 1.554107, 0, 0.6862745, 1, 1,
0.1167896, 0.5744942, 1.822978, 0, 0.682353, 1, 1,
0.118559, 0.3105468, 1.991902, 0, 0.6745098, 1, 1,
0.1248675, -1.745694, 1.55189, 0, 0.6705883, 1, 1,
0.1259752, -1.620841, 3.483366, 0, 0.6627451, 1, 1,
0.129227, -0.006053429, 1.875683, 0, 0.6588235, 1, 1,
0.130464, 0.6845542, -1.955651, 0, 0.6509804, 1, 1,
0.136578, 0.8845683, -0.3256676, 0, 0.6470588, 1, 1,
0.1381876, 1.161204, 0.9260909, 0, 0.6392157, 1, 1,
0.1395754, 0.371906, 1.260751, 0, 0.6352941, 1, 1,
0.1399276, 0.1982595, -0.6149112, 0, 0.627451, 1, 1,
0.142078, 0.3981295, 1.296246, 0, 0.6235294, 1, 1,
0.1437963, 0.3192464, 0.2437085, 0, 0.6156863, 1, 1,
0.1459513, -1.313912, 4.970125, 0, 0.6117647, 1, 1,
0.1536545, 0.181381, 1.047758, 0, 0.6039216, 1, 1,
0.1551739, -1.478436, 3.324363, 0, 0.5960785, 1, 1,
0.1555811, 0.1499149, 0.02164692, 0, 0.5921569, 1, 1,
0.1626606, -1.252476, 0.9585567, 0, 0.5843138, 1, 1,
0.1691961, -0.5044464, 2.811866, 0, 0.5803922, 1, 1,
0.1741914, 1.813592, 1.988575, 0, 0.572549, 1, 1,
0.1744954, 0.8334516, -1.077771, 0, 0.5686275, 1, 1,
0.1816543, 1.479744, 0.3548855, 0, 0.5607843, 1, 1,
0.1859737, -0.9676057, 1.404259, 0, 0.5568628, 1, 1,
0.1864406, 0.03526843, 1.192396, 0, 0.5490196, 1, 1,
0.18864, -1.700245, 4.114404, 0, 0.5450981, 1, 1,
0.1889367, 0.9095124, 0.5654227, 0, 0.5372549, 1, 1,
0.1929169, -0.6162888, 2.688438, 0, 0.5333334, 1, 1,
0.1970425, -0.2546903, 2.602582, 0, 0.5254902, 1, 1,
0.2025939, 0.0866255, 1.684504, 0, 0.5215687, 1, 1,
0.2038524, -1.101063, 2.329156, 0, 0.5137255, 1, 1,
0.205312, -0.076489, 1.596797, 0, 0.509804, 1, 1,
0.208387, 0.9854853, 1.458392, 0, 0.5019608, 1, 1,
0.2144871, 0.4287277, 0.7502108, 0, 0.4941176, 1, 1,
0.2228939, 1.209283, -0.111486, 0, 0.4901961, 1, 1,
0.2254822, 1.336738, 0.9394776, 0, 0.4823529, 1, 1,
0.2278945, -0.8661551, 3.580601, 0, 0.4784314, 1, 1,
0.2297116, -1.849316, 1.948798, 0, 0.4705882, 1, 1,
0.2311812, 1.392131, -1.035744, 0, 0.4666667, 1, 1,
0.2329185, -1.08905, 2.594697, 0, 0.4588235, 1, 1,
0.2334354, -0.9101421, 3.608804, 0, 0.454902, 1, 1,
0.2343099, 0.4194267, 0.1873451, 0, 0.4470588, 1, 1,
0.2354063, 0.4138342, 2.092275, 0, 0.4431373, 1, 1,
0.2361731, -0.7599548, 3.668597, 0, 0.4352941, 1, 1,
0.2376367, -0.5151101, 2.075538, 0, 0.4313726, 1, 1,
0.23945, 0.1105152, 1.823124, 0, 0.4235294, 1, 1,
0.2399887, 0.8655132, 1.010959, 0, 0.4196078, 1, 1,
0.2403504, 1.203891, 0.8485241, 0, 0.4117647, 1, 1,
0.2410672, -1.249132, 2.419076, 0, 0.4078431, 1, 1,
0.2421532, 2.043969, 0.7880107, 0, 0.4, 1, 1,
0.2472716, 0.6371813, 1.408988, 0, 0.3921569, 1, 1,
0.252516, 1.346371, 0.5266889, 0, 0.3882353, 1, 1,
0.2555626, 0.3903686, 0.2510118, 0, 0.3803922, 1, 1,
0.2605681, -0.6581893, 2.613716, 0, 0.3764706, 1, 1,
0.2608853, 0.03163279, 0.7519331, 0, 0.3686275, 1, 1,
0.2623142, -0.7435467, 2.887051, 0, 0.3647059, 1, 1,
0.2638516, -1.457634, 2.099149, 0, 0.3568628, 1, 1,
0.2647592, -0.3037707, 3.337907, 0, 0.3529412, 1, 1,
0.2682155, 0.2066502, -0.5279767, 0, 0.345098, 1, 1,
0.2690712, 1.322069, -0.7165459, 0, 0.3411765, 1, 1,
0.2773667, -0.7329168, 3.477023, 0, 0.3333333, 1, 1,
0.2777391, 1.200612, 0.1942176, 0, 0.3294118, 1, 1,
0.2786627, -0.9382505, 2.806306, 0, 0.3215686, 1, 1,
0.2853453, 1.753235, -0.2345308, 0, 0.3176471, 1, 1,
0.2863929, -0.6943722, 2.812716, 0, 0.3098039, 1, 1,
0.2888212, -1.306609, 3.702001, 0, 0.3058824, 1, 1,
0.2920758, 0.5252797, 1.152154, 0, 0.2980392, 1, 1,
0.2925368, -0.1849053, 0.9079947, 0, 0.2901961, 1, 1,
0.2959246, -0.6131713, 3.118381, 0, 0.2862745, 1, 1,
0.2969756, -0.6435523, 3.435655, 0, 0.2784314, 1, 1,
0.2976886, 0.200066, -0.561666, 0, 0.2745098, 1, 1,
0.2988738, -1.658855, 1.655124, 0, 0.2666667, 1, 1,
0.2991257, -1.712329, 3.250868, 0, 0.2627451, 1, 1,
0.3008338, 2.239432, 0.7150777, 0, 0.254902, 1, 1,
0.3009898, 2.295997, 1.219215, 0, 0.2509804, 1, 1,
0.3046333, 0.2165367, 0.7101856, 0, 0.2431373, 1, 1,
0.3085243, -0.1560565, 2.832963, 0, 0.2392157, 1, 1,
0.3122496, -0.3506874, 1.870343, 0, 0.2313726, 1, 1,
0.3134359, -2.191607, 2.528035, 0, 0.227451, 1, 1,
0.314978, -0.3352547, 2.579158, 0, 0.2196078, 1, 1,
0.3149897, -0.6496701, 2.780138, 0, 0.2156863, 1, 1,
0.3166476, -1.320003, 3.329853, 0, 0.2078431, 1, 1,
0.316892, 1.290847, -1.090959, 0, 0.2039216, 1, 1,
0.3175686, 0.1036434, 1.290619, 0, 0.1960784, 1, 1,
0.3194687, -1.181815, 3.013528, 0, 0.1882353, 1, 1,
0.3248557, -0.02545958, 1.235377, 0, 0.1843137, 1, 1,
0.327675, 0.6283768, 1.086242, 0, 0.1764706, 1, 1,
0.3287377, -0.5765486, 3.094355, 0, 0.172549, 1, 1,
0.3294207, 1.080193, 1.333213, 0, 0.1647059, 1, 1,
0.3322975, 1.419784, 0.8290954, 0, 0.1607843, 1, 1,
0.3340928, 0.633875, -0.5173338, 0, 0.1529412, 1, 1,
0.3366018, 0.3067769, 1.19159, 0, 0.1490196, 1, 1,
0.3372684, -1.538167, 3.36416, 0, 0.1411765, 1, 1,
0.3373752, -0.8990729, 2.905545, 0, 0.1372549, 1, 1,
0.3397468, 0.02347262, 0.6858754, 0, 0.1294118, 1, 1,
0.3409295, 0.255518, 1.062855, 0, 0.1254902, 1, 1,
0.3424254, 0.2957945, 0.4127149, 0, 0.1176471, 1, 1,
0.3426844, -1.150349, 2.971124, 0, 0.1137255, 1, 1,
0.3442606, 0.499271, -0.5755441, 0, 0.1058824, 1, 1,
0.3442713, -1.494801, 2.213433, 0, 0.09803922, 1, 1,
0.346788, 0.5212937, 1.685243, 0, 0.09411765, 1, 1,
0.3477929, 1.256193, 0.8314478, 0, 0.08627451, 1, 1,
0.34968, 0.1816172, 0.3305512, 0, 0.08235294, 1, 1,
0.3554652, -0.3490588, 2.538473, 0, 0.07450981, 1, 1,
0.3557754, -0.240917, 3.384749, 0, 0.07058824, 1, 1,
0.35594, -0.7197939, 0.7554741, 0, 0.0627451, 1, 1,
0.357228, 0.3618958, 2.684061, 0, 0.05882353, 1, 1,
0.3574582, -0.4699129, 3.763521, 0, 0.05098039, 1, 1,
0.3583983, -0.3359618, 3.092933, 0, 0.04705882, 1, 1,
0.3593752, -0.3304708, 2.327292, 0, 0.03921569, 1, 1,
0.3602322, -0.1830276, 2.763241, 0, 0.03529412, 1, 1,
0.3623783, -0.1425854, 2.443854, 0, 0.02745098, 1, 1,
0.3632741, -0.1189408, 2.151436, 0, 0.02352941, 1, 1,
0.3721724, 0.9719915, -0.5811114, 0, 0.01568628, 1, 1,
0.3748371, 1.593356, 0.5329511, 0, 0.01176471, 1, 1,
0.3772256, 1.144797, -0.7012653, 0, 0.003921569, 1, 1,
0.380055, 0.32869, 0.9185926, 0.003921569, 0, 1, 1,
0.3816434, 0.1476205, 1.466619, 0.007843138, 0, 1, 1,
0.3817684, -0.4763676, 2.573455, 0.01568628, 0, 1, 1,
0.3877633, -0.6272042, 4.384243, 0.01960784, 0, 1, 1,
0.3925559, 0.1222788, 1.928686, 0.02745098, 0, 1, 1,
0.3959129, -0.7321275, 3.76534, 0.03137255, 0, 1, 1,
0.3978022, 0.3673029, 2.466604, 0.03921569, 0, 1, 1,
0.400254, -0.2569589, 1.262935, 0.04313726, 0, 1, 1,
0.4068575, -0.8404002, 3.464057, 0.05098039, 0, 1, 1,
0.4082002, -0.3235813, 2.467379, 0.05490196, 0, 1, 1,
0.4108508, 0.1520057, 1.9381, 0.0627451, 0, 1, 1,
0.4154005, 0.07375669, 2.226019, 0.06666667, 0, 1, 1,
0.419073, -0.4793114, 1.66655, 0.07450981, 0, 1, 1,
0.4192569, 2.698413, -0.397411, 0.07843138, 0, 1, 1,
0.4214861, 1.514135, 0.4027026, 0.08627451, 0, 1, 1,
0.4268332, -0.3856516, 0.5675994, 0.09019608, 0, 1, 1,
0.4325919, 0.3233922, 1.519294, 0.09803922, 0, 1, 1,
0.4366683, 0.439443, 1.954167, 0.1058824, 0, 1, 1,
0.4397401, 0.9778874, -0.03105973, 0.1098039, 0, 1, 1,
0.4487374, 0.9881167, -1.448674, 0.1176471, 0, 1, 1,
0.4556028, -0.03098237, -0.07844602, 0.1215686, 0, 1, 1,
0.4560314, 0.4632867, 0.8702091, 0.1294118, 0, 1, 1,
0.4600754, -1.174089, 4.448459, 0.1333333, 0, 1, 1,
0.4611101, 0.09472375, 3.005192, 0.1411765, 0, 1, 1,
0.4638382, -0.2937032, 2.510787, 0.145098, 0, 1, 1,
0.4642215, -1.033664, 3.173084, 0.1529412, 0, 1, 1,
0.4645529, -0.3821745, 1.611603, 0.1568628, 0, 1, 1,
0.4647794, 1.132194, 0.06575407, 0.1647059, 0, 1, 1,
0.4651213, 0.3566883, 1.728036, 0.1686275, 0, 1, 1,
0.4692619, 0.5207227, -0.09267544, 0.1764706, 0, 1, 1,
0.4725631, 1.874066, -0.8717428, 0.1803922, 0, 1, 1,
0.4730054, 0.09028442, 1.065072, 0.1882353, 0, 1, 1,
0.4735974, 0.2650013, 3.712237, 0.1921569, 0, 1, 1,
0.4737239, -0.7280879, 2.911384, 0.2, 0, 1, 1,
0.4757003, 0.08184091, 2.126252, 0.2078431, 0, 1, 1,
0.4815343, -2.167638, 2.828532, 0.2117647, 0, 1, 1,
0.4859632, -0.7903267, 2.585065, 0.2196078, 0, 1, 1,
0.487918, 0.5922745, 0.5127941, 0.2235294, 0, 1, 1,
0.4890152, -1.215908, 2.41962, 0.2313726, 0, 1, 1,
0.4937096, 2.077658, -0.0490867, 0.2352941, 0, 1, 1,
0.5175228, 0.9514151, 1.409312, 0.2431373, 0, 1, 1,
0.5228977, 0.2817237, 1.708399, 0.2470588, 0, 1, 1,
0.5281616, 2.687302, -1.280477, 0.254902, 0, 1, 1,
0.5363699, 1.108609, -1.437615, 0.2588235, 0, 1, 1,
0.5367923, -0.9820741, 4.335685, 0.2666667, 0, 1, 1,
0.5391504, 0.6958449, -0.4529411, 0.2705882, 0, 1, 1,
0.539372, 0.02944931, 1.14899, 0.2784314, 0, 1, 1,
0.5462828, 1.670189, 0.6596154, 0.282353, 0, 1, 1,
0.5485995, -2.299221, 4.296402, 0.2901961, 0, 1, 1,
0.5502125, 0.5049105, 1.019705, 0.2941177, 0, 1, 1,
0.5508747, -0.4002787, 4.080158, 0.3019608, 0, 1, 1,
0.5534317, 0.6968349, 1.47771, 0.3098039, 0, 1, 1,
0.5568647, 0.5968364, 1.701936, 0.3137255, 0, 1, 1,
0.5612543, 1.061792, 1.05619, 0.3215686, 0, 1, 1,
0.5647808, 0.272459, 1.711338, 0.3254902, 0, 1, 1,
0.5648972, -0.06382681, 3.288611, 0.3333333, 0, 1, 1,
0.5654796, 0.2241241, -0.4884933, 0.3372549, 0, 1, 1,
0.5671535, -0.5516388, 2.747357, 0.345098, 0, 1, 1,
0.5704638, 1.629601, -0.2186089, 0.3490196, 0, 1, 1,
0.574603, -0.5259706, 4.648125, 0.3568628, 0, 1, 1,
0.5755243, 0.4526685, 1.091141, 0.3607843, 0, 1, 1,
0.5789409, 0.3227418, 0.4738725, 0.3686275, 0, 1, 1,
0.5796847, 1.872572, 1.968451, 0.372549, 0, 1, 1,
0.5854092, 0.1792322, 1.968886, 0.3803922, 0, 1, 1,
0.5875573, -0.3250151, 0.6325082, 0.3843137, 0, 1, 1,
0.5933484, 0.725529, 0.3403145, 0.3921569, 0, 1, 1,
0.594805, 0.6754977, 0.1476321, 0.3960784, 0, 1, 1,
0.600313, 1.25542, -1.419189, 0.4039216, 0, 1, 1,
0.6017917, 1.266584, -1.491532, 0.4117647, 0, 1, 1,
0.6017961, 0.5693084, 0.5509803, 0.4156863, 0, 1, 1,
0.6065259, 1.320902, 1.539272, 0.4235294, 0, 1, 1,
0.6101143, 1.549523, 0.6333138, 0.427451, 0, 1, 1,
0.6149743, -0.7394262, 0.7431484, 0.4352941, 0, 1, 1,
0.6186848, 0.2674536, 3.122131, 0.4392157, 0, 1, 1,
0.6237498, 1.206208, 1.444236, 0.4470588, 0, 1, 1,
0.6238976, 0.09984937, 0.669997, 0.4509804, 0, 1, 1,
0.6246157, 0.698201, 1.219301, 0.4588235, 0, 1, 1,
0.6288313, -0.1788893, 3.825892, 0.4627451, 0, 1, 1,
0.6324589, 0.3939173, 3.178279, 0.4705882, 0, 1, 1,
0.6349638, 1.700807, 0.4807218, 0.4745098, 0, 1, 1,
0.6349698, -0.06148962, 2.361961, 0.4823529, 0, 1, 1,
0.6356246, 0.1864508, 1.635744, 0.4862745, 0, 1, 1,
0.6428223, -0.6785374, 1.379837, 0.4941176, 0, 1, 1,
0.6432486, 0.7952361, 1.078531, 0.5019608, 0, 1, 1,
0.6455015, -0.5793914, 1.923622, 0.5058824, 0, 1, 1,
0.6508607, 1.088743, 1.357908, 0.5137255, 0, 1, 1,
0.6510209, -0.3062633, 0.9682741, 0.5176471, 0, 1, 1,
0.6521114, 0.3904929, 1.783568, 0.5254902, 0, 1, 1,
0.6523018, 0.2336741, 1.111228, 0.5294118, 0, 1, 1,
0.6642181, 0.9846332, 2.883437, 0.5372549, 0, 1, 1,
0.6670457, 0.4035437, 1.904491, 0.5411765, 0, 1, 1,
0.6779559, -0.9976724, 3.407726, 0.5490196, 0, 1, 1,
0.6794408, 2.612958, 0.2695824, 0.5529412, 0, 1, 1,
0.6802819, -0.9947386, 2.109438, 0.5607843, 0, 1, 1,
0.6825082, -1.328229, 4.460876, 0.5647059, 0, 1, 1,
0.6842288, -0.3275916, 0.905169, 0.572549, 0, 1, 1,
0.6901522, -1.236152, 1.418885, 0.5764706, 0, 1, 1,
0.6942646, -0.9633406, 2.977989, 0.5843138, 0, 1, 1,
0.696425, 0.2100301, 1.690877, 0.5882353, 0, 1, 1,
0.6980122, 1.323257, 0.794757, 0.5960785, 0, 1, 1,
0.6997932, -0.2794539, 2.251947, 0.6039216, 0, 1, 1,
0.7164826, -2.214659, 2.55391, 0.6078432, 0, 1, 1,
0.7273936, 0.3346812, 0.2717626, 0.6156863, 0, 1, 1,
0.7356963, 1.644258, 0.435871, 0.6196079, 0, 1, 1,
0.741976, -0.5546287, 2.482132, 0.627451, 0, 1, 1,
0.7431233, -0.3723456, 1.540617, 0.6313726, 0, 1, 1,
0.7510464, -1.458149, 2.47665, 0.6392157, 0, 1, 1,
0.7543695, 1.97776, 1.461271, 0.6431373, 0, 1, 1,
0.7576112, -0.3775292, 3.305275, 0.6509804, 0, 1, 1,
0.7631198, 0.4425976, 1.629851, 0.654902, 0, 1, 1,
0.7730914, -1.02024, 2.347684, 0.6627451, 0, 1, 1,
0.7760214, -0.007460365, 1.684739, 0.6666667, 0, 1, 1,
0.7762951, 0.8521515, 0.2463188, 0.6745098, 0, 1, 1,
0.7808859, -0.2285504, 3.359885, 0.6784314, 0, 1, 1,
0.7845432, 0.9068776, 1.474259, 0.6862745, 0, 1, 1,
0.7874691, -0.7302514, 2.140414, 0.6901961, 0, 1, 1,
0.7875335, -0.028087, 0.7823254, 0.6980392, 0, 1, 1,
0.789507, -1.869788, 0.8452403, 0.7058824, 0, 1, 1,
0.7897192, -1.400237, 2.519135, 0.7098039, 0, 1, 1,
0.805437, 0.1707273, 1.522618, 0.7176471, 0, 1, 1,
0.8093871, -1.706614, 1.256466, 0.7215686, 0, 1, 1,
0.8109311, -0.8543197, 2.425696, 0.7294118, 0, 1, 1,
0.8116705, -0.03208391, 2.852368, 0.7333333, 0, 1, 1,
0.821427, -0.5689125, 1.36021, 0.7411765, 0, 1, 1,
0.823409, -0.7512677, 1.493707, 0.7450981, 0, 1, 1,
0.8304923, -0.3237133, 3.013041, 0.7529412, 0, 1, 1,
0.832638, -1.595022, 2.256166, 0.7568628, 0, 1, 1,
0.8331037, -0.06351945, 1.599726, 0.7647059, 0, 1, 1,
0.8403338, 0.04574114, 0.1992315, 0.7686275, 0, 1, 1,
0.8414415, -0.08150209, -0.4135656, 0.7764706, 0, 1, 1,
0.8426759, 0.859614, -0.2633542, 0.7803922, 0, 1, 1,
0.8436734, 0.671263, 0.9795876, 0.7882353, 0, 1, 1,
0.8442982, -1.083452, 3.08665, 0.7921569, 0, 1, 1,
0.8528496, -0.07241018, 1.786987, 0.8, 0, 1, 1,
0.8555121, -0.2632111, 0.8617931, 0.8078431, 0, 1, 1,
0.8564698, -0.4000555, 1.193259, 0.8117647, 0, 1, 1,
0.8567578, 0.621667, -0.0915049, 0.8196079, 0, 1, 1,
0.8579826, 0.806307, 0.2990496, 0.8235294, 0, 1, 1,
0.8652896, -0.2467512, 1.877329, 0.8313726, 0, 1, 1,
0.8744341, 0.1330983, 1.396967, 0.8352941, 0, 1, 1,
0.8754749, 0.4171287, 2.432599, 0.8431373, 0, 1, 1,
0.8764792, -1.567706, 0.394931, 0.8470588, 0, 1, 1,
0.87722, 0.1106719, 1.395021, 0.854902, 0, 1, 1,
0.878593, 1.879211, 0.6173434, 0.8588235, 0, 1, 1,
0.8846012, -0.2952302, 1.564005, 0.8666667, 0, 1, 1,
0.8945295, -1.824558, 0.8249418, 0.8705882, 0, 1, 1,
0.8962618, -0.2199163, 2.954395, 0.8784314, 0, 1, 1,
0.8979645, -1.148618, 3.310108, 0.8823529, 0, 1, 1,
0.899913, 0.6184456, 1.298135, 0.8901961, 0, 1, 1,
0.902844, -1.00457, 2.366564, 0.8941177, 0, 1, 1,
0.909043, -0.3482168, 4.188489, 0.9019608, 0, 1, 1,
0.9093291, 0.6162161, -0.5539334, 0.9098039, 0, 1, 1,
0.9103658, 0.4751792, 2.076632, 0.9137255, 0, 1, 1,
0.9172434, 0.1503295, 0.9669837, 0.9215686, 0, 1, 1,
0.9225514, -0.2523664, 1.844764, 0.9254902, 0, 1, 1,
0.9345084, -0.7473159, 3.27624, 0.9333333, 0, 1, 1,
0.9413939, -0.241762, 1.860807, 0.9372549, 0, 1, 1,
0.9439895, -0.4030713, 1.774104, 0.945098, 0, 1, 1,
0.951121, -1.308241, 1.42599, 0.9490196, 0, 1, 1,
0.9550425, 1.105717, -0.2945353, 0.9568627, 0, 1, 1,
0.9551834, -0.7717409, 0.5212617, 0.9607843, 0, 1, 1,
0.9599823, -1.131085, 1.321, 0.9686275, 0, 1, 1,
0.9634677, -0.7260967, 3.929672, 0.972549, 0, 1, 1,
0.9664099, 0.6939528, 2.582823, 0.9803922, 0, 1, 1,
0.9688951, 0.09369706, 0.5753267, 0.9843137, 0, 1, 1,
0.9695902, 0.4095888, 1.335744, 0.9921569, 0, 1, 1,
0.9700938, -1.0043, 1.622126, 0.9960784, 0, 1, 1,
0.9854724, -1.201912, 4.332077, 1, 0, 0.9960784, 1,
0.9896156, -1.062321, 0.5392764, 1, 0, 0.9882353, 1,
1.012303, -1.088544, 2.992644, 1, 0, 0.9843137, 1,
1.016489, -1.029916, 2.504244, 1, 0, 0.9764706, 1,
1.018983, -0.2949229, 0.4621262, 1, 0, 0.972549, 1,
1.019977, -2.088196, 3.404268, 1, 0, 0.9647059, 1,
1.022498, 1.070224, 0.07287399, 1, 0, 0.9607843, 1,
1.025842, 0.3258788, -0.5496901, 1, 0, 0.9529412, 1,
1.03038, 0.4041964, 0.840528, 1, 0, 0.9490196, 1,
1.044445, -0.5007083, 1.021103, 1, 0, 0.9411765, 1,
1.054137, -0.8347699, 1.969425, 1, 0, 0.9372549, 1,
1.05558, -0.3695832, 2.936786, 1, 0, 0.9294118, 1,
1.056964, -1.204167, 4.483402, 1, 0, 0.9254902, 1,
1.060481, -1.16417, 0.9286122, 1, 0, 0.9176471, 1,
1.06132, -0.9646559, 1.842911, 1, 0, 0.9137255, 1,
1.067584, 0.1555648, 0.3612247, 1, 0, 0.9058824, 1,
1.068951, -0.8661378, -0.08104333, 1, 0, 0.9019608, 1,
1.070574, 0.615808, 0.7987914, 1, 0, 0.8941177, 1,
1.079943, -0.3045552, 1.785942, 1, 0, 0.8862745, 1,
1.081942, -1.254692, 2.561171, 1, 0, 0.8823529, 1,
1.083038, -0.5807312, 0.7977821, 1, 0, 0.8745098, 1,
1.083573, 0.09221253, 0.6683988, 1, 0, 0.8705882, 1,
1.087844, 0.4137697, 1.924088, 1, 0, 0.8627451, 1,
1.08983, 1.240245, 2.145238, 1, 0, 0.8588235, 1,
1.095211, -0.3502255, 1.554502, 1, 0, 0.8509804, 1,
1.097499, -1.319047, 2.36129, 1, 0, 0.8470588, 1,
1.100661, -0.7886971, 2.139899, 1, 0, 0.8392157, 1,
1.101343, -0.7356817, 1.815526, 1, 0, 0.8352941, 1,
1.106533, -1.139447, 3.336369, 1, 0, 0.827451, 1,
1.111821, 0.8786893, 0.9740853, 1, 0, 0.8235294, 1,
1.113894, 1.512193, -0.2034567, 1, 0, 0.8156863, 1,
1.115482, -0.2140308, 2.324346, 1, 0, 0.8117647, 1,
1.118881, -0.4810941, 0.8525756, 1, 0, 0.8039216, 1,
1.121401, 0.8749063, 0.8657284, 1, 0, 0.7960784, 1,
1.124127, 0.5266839, 0.4107345, 1, 0, 0.7921569, 1,
1.126774, 1.369398, -0.1931246, 1, 0, 0.7843137, 1,
1.128513, -0.8143803, 3.007317, 1, 0, 0.7803922, 1,
1.133763, -1.296115, 2.844688, 1, 0, 0.772549, 1,
1.145828, -0.3097191, 1.498491, 1, 0, 0.7686275, 1,
1.148899, 0.5329647, 1.700396, 1, 0, 0.7607843, 1,
1.150329, -0.4131523, 0.2419529, 1, 0, 0.7568628, 1,
1.163389, -0.5298935, 3.937191, 1, 0, 0.7490196, 1,
1.166632, -0.09190352, 1.42638, 1, 0, 0.7450981, 1,
1.170907, -0.7924068, 2.021459, 1, 0, 0.7372549, 1,
1.179278, 1.118065, 1.167499, 1, 0, 0.7333333, 1,
1.181719, 0.3231193, -0.2931773, 1, 0, 0.7254902, 1,
1.181872, -1.151558, 1.924897, 1, 0, 0.7215686, 1,
1.185806, 0.0289228, 1.906185, 1, 0, 0.7137255, 1,
1.192307, 0.3414372, 0.0795596, 1, 0, 0.7098039, 1,
1.201326, 0.9242907, 1.09413, 1, 0, 0.7019608, 1,
1.201627, 0.1819665, 0.4252453, 1, 0, 0.6941177, 1,
1.20874, -0.2286194, 0.5802754, 1, 0, 0.6901961, 1,
1.211006, -0.7466241, 2.014008, 1, 0, 0.682353, 1,
1.215855, -0.1267903, 1.243494, 1, 0, 0.6784314, 1,
1.218687, 0.00503869, 1.929559, 1, 0, 0.6705883, 1,
1.224551, 0.5050095, 1.091606, 1, 0, 0.6666667, 1,
1.22748, 1.089659, 2.33189, 1, 0, 0.6588235, 1,
1.231541, 0.8629173, 1.47886, 1, 0, 0.654902, 1,
1.231734, -2.018116, 2.880338, 1, 0, 0.6470588, 1,
1.253595, -0.2265809, 2.501092, 1, 0, 0.6431373, 1,
1.25847, -0.3813974, 0.4225329, 1, 0, 0.6352941, 1,
1.269018, -0.03086616, 1.250222, 1, 0, 0.6313726, 1,
1.272115, 1.305798, 0.2804012, 1, 0, 0.6235294, 1,
1.274726, -0.3761774, 2.789557, 1, 0, 0.6196079, 1,
1.276167, 0.188874, 0.7668727, 1, 0, 0.6117647, 1,
1.277141, 0.3698255, 0.7420512, 1, 0, 0.6078432, 1,
1.277953, 0.8197192, 1.757649, 1, 0, 0.6, 1,
1.286384, 1.495596, 0.657568, 1, 0, 0.5921569, 1,
1.29251, 0.7623313, 0.8087627, 1, 0, 0.5882353, 1,
1.293641, -1.163863, 1.702756, 1, 0, 0.5803922, 1,
1.296019, -0.04776351, 0.4568511, 1, 0, 0.5764706, 1,
1.297919, 0.8441617, 0.6389282, 1, 0, 0.5686275, 1,
1.307763, -0.2044198, 1.392788, 1, 0, 0.5647059, 1,
1.320075, 1.15291, 1.090174, 1, 0, 0.5568628, 1,
1.321294, -0.6154871, 2.169064, 1, 0, 0.5529412, 1,
1.334972, -0.7387391, 1.84306, 1, 0, 0.5450981, 1,
1.345626, 0.3759251, 1.456585, 1, 0, 0.5411765, 1,
1.358761, 1.180316, 1.644142, 1, 0, 0.5333334, 1,
1.36675, 0.3591477, 0.8694214, 1, 0, 0.5294118, 1,
1.374957, 2.041112, -0.3366842, 1, 0, 0.5215687, 1,
1.37707, 0.4112428, 1.116095, 1, 0, 0.5176471, 1,
1.381786, 0.9514358, 0.7453438, 1, 0, 0.509804, 1,
1.390362, 0.2110985, 1.146913, 1, 0, 0.5058824, 1,
1.412904, -0.4788953, 1.725166, 1, 0, 0.4980392, 1,
1.424421, -0.3996311, 2.404522, 1, 0, 0.4901961, 1,
1.453898, 0.6868101, 1.242893, 1, 0, 0.4862745, 1,
1.483401, -1.793405, 2.411543, 1, 0, 0.4784314, 1,
1.491991, 0.2168986, 2.238576, 1, 0, 0.4745098, 1,
1.50218, 0.06753353, 2.252326, 1, 0, 0.4666667, 1,
1.505054, -0.4484109, 2.6391, 1, 0, 0.4627451, 1,
1.509276, -0.5388635, 3.050031, 1, 0, 0.454902, 1,
1.517569, -0.3851914, 1.34019, 1, 0, 0.4509804, 1,
1.52299, -0.152321, 2.943753, 1, 0, 0.4431373, 1,
1.52553, 0.3976065, 1.09542, 1, 0, 0.4392157, 1,
1.529034, -2.81557, 2.93427, 1, 0, 0.4313726, 1,
1.536638, -0.5784844, 1.269795, 1, 0, 0.427451, 1,
1.545262, 0.4591318, 0.3281175, 1, 0, 0.4196078, 1,
1.556778, -0.251341, 0.5355481, 1, 0, 0.4156863, 1,
1.557307, 0.4353282, 1.088053, 1, 0, 0.4078431, 1,
1.562527, 0.08328427, 1.102606, 1, 0, 0.4039216, 1,
1.565195, 1.220001, 0.3329441, 1, 0, 0.3960784, 1,
1.568543, -0.4305414, 2.205061, 1, 0, 0.3882353, 1,
1.572079, -0.2963272, 2.199215, 1, 0, 0.3843137, 1,
1.618951, -1.581433, 2.62111, 1, 0, 0.3764706, 1,
1.625968, -0.2751383, 1.450374, 1, 0, 0.372549, 1,
1.63827, -1.413615, 2.446187, 1, 0, 0.3647059, 1,
1.641546, 1.456752, 2.734603, 1, 0, 0.3607843, 1,
1.641796, -0.2669313, 3.336667, 1, 0, 0.3529412, 1,
1.645868, -2.229364, 3.463189, 1, 0, 0.3490196, 1,
1.65026, -0.02813142, 1.269852, 1, 0, 0.3411765, 1,
1.660408, -0.05176457, 2.167798, 1, 0, 0.3372549, 1,
1.665411, -1.403408, 3.103703, 1, 0, 0.3294118, 1,
1.670898, 0.5083182, 0.7552985, 1, 0, 0.3254902, 1,
1.675637, 1.127407, 0.9488635, 1, 0, 0.3176471, 1,
1.694306, -0.5603452, 2.379864, 1, 0, 0.3137255, 1,
1.696793, 0.9472651, 1.106582, 1, 0, 0.3058824, 1,
1.705399, 0.5458306, 2.670361, 1, 0, 0.2980392, 1,
1.710927, -1.177033, 1.180806, 1, 0, 0.2941177, 1,
1.72524, -1.836926, 3.140557, 1, 0, 0.2862745, 1,
1.745085, -0.2979366, 1.855682, 1, 0, 0.282353, 1,
1.754866, 0.8080972, 0.7523407, 1, 0, 0.2745098, 1,
1.756522, 0.2055827, 2.693741, 1, 0, 0.2705882, 1,
1.756938, -0.5540616, 2.237943, 1, 0, 0.2627451, 1,
1.765938, 1.808293, -0.4525995, 1, 0, 0.2588235, 1,
1.776974, -1.364187, 2.057556, 1, 0, 0.2509804, 1,
1.777351, 0.5573483, 1.559708, 1, 0, 0.2470588, 1,
1.784254, 0.3519584, 1.669313, 1, 0, 0.2392157, 1,
1.80684, -0.1200116, -0.6865183, 1, 0, 0.2352941, 1,
1.808687, -1.095902, 1.522283, 1, 0, 0.227451, 1,
1.81125, -0.8142304, 0.2981499, 1, 0, 0.2235294, 1,
1.827353, 0.6680667, 2.211814, 1, 0, 0.2156863, 1,
1.831632, 0.7976781, 0.8998805, 1, 0, 0.2117647, 1,
1.837236, 0.01601392, 3.420463, 1, 0, 0.2039216, 1,
1.841493, 0.8735628, 2.09221, 1, 0, 0.1960784, 1,
1.84815, -0.1399243, 1.12324, 1, 0, 0.1921569, 1,
1.877124, -0.4202225, 0.7378629, 1, 0, 0.1843137, 1,
1.897799, 0.09978101, 1.751723, 1, 0, 0.1803922, 1,
1.903633, 0.02882478, 0.9454349, 1, 0, 0.172549, 1,
1.932019, 1.581, 1.269346, 1, 0, 0.1686275, 1,
1.94743, 0.6144549, 0.8266336, 1, 0, 0.1607843, 1,
1.957423, -0.7629398, 1.943039, 1, 0, 0.1568628, 1,
1.957732, -1.728211, 2.174213, 1, 0, 0.1490196, 1,
1.974252, 0.5500699, 3.235795, 1, 0, 0.145098, 1,
1.983522, -0.4990993, 4.296328, 1, 0, 0.1372549, 1,
2.0049, -0.3746866, 1.141297, 1, 0, 0.1333333, 1,
2.023254, -0.8471706, 2.868539, 1, 0, 0.1254902, 1,
2.024269, -2.017811, 3.127863, 1, 0, 0.1215686, 1,
2.054642, 1.311457, 0.8356239, 1, 0, 0.1137255, 1,
2.055718, 0.5616497, 0.3694159, 1, 0, 0.1098039, 1,
2.062692, 0.7123983, 3.313728, 1, 0, 0.1019608, 1,
2.063313, -0.167413, 0.3793903, 1, 0, 0.09411765, 1,
2.098462, -0.7829591, 1.052105, 1, 0, 0.09019608, 1,
2.099649, -1.559054, 0.8215441, 1, 0, 0.08235294, 1,
2.148775, -0.4121981, 0.9467327, 1, 0, 0.07843138, 1,
2.182087, -0.9619765, 0.4982435, 1, 0, 0.07058824, 1,
2.193051, -1.909883, 3.292206, 1, 0, 0.06666667, 1,
2.216185, 0.1482072, 0.2017269, 1, 0, 0.05882353, 1,
2.257898, 0.9252953, 0.7924591, 1, 0, 0.05490196, 1,
2.357508, 0.9051225, 1.650451, 1, 0, 0.04705882, 1,
2.371186, -0.2536963, 2.841431, 1, 0, 0.04313726, 1,
2.380223, -0.7574575, 2.513532, 1, 0, 0.03529412, 1,
2.425845, -0.02959105, 2.623451, 1, 0, 0.03137255, 1,
2.438965, 1.13437, 0.5530176, 1, 0, 0.02352941, 1,
2.51233, -0.1901605, 1.007853, 1, 0, 0.01960784, 1,
2.673717, 1.670014, 1.612917, 1, 0, 0.01176471, 1,
3.043519, -0.2207521, 1.41082, 1, 0, 0.007843138, 1
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
0.08013356, -4.734225, -7.255991, 0, -0.5, 0.5, 0.5,
0.08013356, -4.734225, -7.255991, 1, -0.5, 0.5, 0.5,
0.08013356, -4.734225, -7.255991, 1, 1.5, 0.5, 0.5,
0.08013356, -4.734225, -7.255991, 0, 1.5, 0.5, 0.5
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
-3.887839, -0.2930764, -7.255991, 0, -0.5, 0.5, 0.5,
-3.887839, -0.2930764, -7.255991, 1, -0.5, 0.5, 0.5,
-3.887839, -0.2930764, -7.255991, 1, 1.5, 0.5, 0.5,
-3.887839, -0.2930764, -7.255991, 0, 1.5, 0.5, 0.5
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
-3.887839, -4.734225, 0.05832696, 0, -0.5, 0.5, 0.5,
-3.887839, -4.734225, 0.05832696, 1, -0.5, 0.5, 0.5,
-3.887839, -4.734225, 0.05832696, 1, 1.5, 0.5, 0.5,
-3.887839, -4.734225, 0.05832696, 0, 1.5, 0.5, 0.5
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
-2, -3.709345, -5.568072,
3, -3.709345, -5.568072,
-2, -3.709345, -5.568072,
-2, -3.880158, -5.849392,
-1, -3.709345, -5.568072,
-1, -3.880158, -5.849392,
0, -3.709345, -5.568072,
0, -3.880158, -5.849392,
1, -3.709345, -5.568072,
1, -3.880158, -5.849392,
2, -3.709345, -5.568072,
2, -3.880158, -5.849392,
3, -3.709345, -5.568072,
3, -3.880158, -5.849392
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
-2, -4.221785, -6.412032, 0, -0.5, 0.5, 0.5,
-2, -4.221785, -6.412032, 1, -0.5, 0.5, 0.5,
-2, -4.221785, -6.412032, 1, 1.5, 0.5, 0.5,
-2, -4.221785, -6.412032, 0, 1.5, 0.5, 0.5,
-1, -4.221785, -6.412032, 0, -0.5, 0.5, 0.5,
-1, -4.221785, -6.412032, 1, -0.5, 0.5, 0.5,
-1, -4.221785, -6.412032, 1, 1.5, 0.5, 0.5,
-1, -4.221785, -6.412032, 0, 1.5, 0.5, 0.5,
0, -4.221785, -6.412032, 0, -0.5, 0.5, 0.5,
0, -4.221785, -6.412032, 1, -0.5, 0.5, 0.5,
0, -4.221785, -6.412032, 1, 1.5, 0.5, 0.5,
0, -4.221785, -6.412032, 0, 1.5, 0.5, 0.5,
1, -4.221785, -6.412032, 0, -0.5, 0.5, 0.5,
1, -4.221785, -6.412032, 1, -0.5, 0.5, 0.5,
1, -4.221785, -6.412032, 1, 1.5, 0.5, 0.5,
1, -4.221785, -6.412032, 0, 1.5, 0.5, 0.5,
2, -4.221785, -6.412032, 0, -0.5, 0.5, 0.5,
2, -4.221785, -6.412032, 1, -0.5, 0.5, 0.5,
2, -4.221785, -6.412032, 1, 1.5, 0.5, 0.5,
2, -4.221785, -6.412032, 0, 1.5, 0.5, 0.5,
3, -4.221785, -6.412032, 0, -0.5, 0.5, 0.5,
3, -4.221785, -6.412032, 1, -0.5, 0.5, 0.5,
3, -4.221785, -6.412032, 1, 1.5, 0.5, 0.5,
3, -4.221785, -6.412032, 0, 1.5, 0.5, 0.5
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
-2.972153, -3, -5.568072,
-2.972153, 3, -5.568072,
-2.972153, -3, -5.568072,
-3.124767, -3, -5.849392,
-2.972153, -2, -5.568072,
-3.124767, -2, -5.849392,
-2.972153, -1, -5.568072,
-3.124767, -1, -5.849392,
-2.972153, 0, -5.568072,
-3.124767, 0, -5.849392,
-2.972153, 1, -5.568072,
-3.124767, 1, -5.849392,
-2.972153, 2, -5.568072,
-3.124767, 2, -5.849392,
-2.972153, 3, -5.568072,
-3.124767, 3, -5.849392
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
-3.429996, -3, -6.412032, 0, -0.5, 0.5, 0.5,
-3.429996, -3, -6.412032, 1, -0.5, 0.5, 0.5,
-3.429996, -3, -6.412032, 1, 1.5, 0.5, 0.5,
-3.429996, -3, -6.412032, 0, 1.5, 0.5, 0.5,
-3.429996, -2, -6.412032, 0, -0.5, 0.5, 0.5,
-3.429996, -2, -6.412032, 1, -0.5, 0.5, 0.5,
-3.429996, -2, -6.412032, 1, 1.5, 0.5, 0.5,
-3.429996, -2, -6.412032, 0, 1.5, 0.5, 0.5,
-3.429996, -1, -6.412032, 0, -0.5, 0.5, 0.5,
-3.429996, -1, -6.412032, 1, -0.5, 0.5, 0.5,
-3.429996, -1, -6.412032, 1, 1.5, 0.5, 0.5,
-3.429996, -1, -6.412032, 0, 1.5, 0.5, 0.5,
-3.429996, 0, -6.412032, 0, -0.5, 0.5, 0.5,
-3.429996, 0, -6.412032, 1, -0.5, 0.5, 0.5,
-3.429996, 0, -6.412032, 1, 1.5, 0.5, 0.5,
-3.429996, 0, -6.412032, 0, 1.5, 0.5, 0.5,
-3.429996, 1, -6.412032, 0, -0.5, 0.5, 0.5,
-3.429996, 1, -6.412032, 1, -0.5, 0.5, 0.5,
-3.429996, 1, -6.412032, 1, 1.5, 0.5, 0.5,
-3.429996, 1, -6.412032, 0, 1.5, 0.5, 0.5,
-3.429996, 2, -6.412032, 0, -0.5, 0.5, 0.5,
-3.429996, 2, -6.412032, 1, -0.5, 0.5, 0.5,
-3.429996, 2, -6.412032, 1, 1.5, 0.5, 0.5,
-3.429996, 2, -6.412032, 0, 1.5, 0.5, 0.5,
-3.429996, 3, -6.412032, 0, -0.5, 0.5, 0.5,
-3.429996, 3, -6.412032, 1, -0.5, 0.5, 0.5,
-3.429996, 3, -6.412032, 1, 1.5, 0.5, 0.5,
-3.429996, 3, -6.412032, 0, 1.5, 0.5, 0.5
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
-2.972153, -3.709345, -4,
-2.972153, -3.709345, 4,
-2.972153, -3.709345, -4,
-3.124767, -3.880158, -4,
-2.972153, -3.709345, -2,
-3.124767, -3.880158, -2,
-2.972153, -3.709345, 0,
-3.124767, -3.880158, 0,
-2.972153, -3.709345, 2,
-3.124767, -3.880158, 2,
-2.972153, -3.709345, 4,
-3.124767, -3.880158, 4
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
-3.429996, -4.221785, -4, 0, -0.5, 0.5, 0.5,
-3.429996, -4.221785, -4, 1, -0.5, 0.5, 0.5,
-3.429996, -4.221785, -4, 1, 1.5, 0.5, 0.5,
-3.429996, -4.221785, -4, 0, 1.5, 0.5, 0.5,
-3.429996, -4.221785, -2, 0, -0.5, 0.5, 0.5,
-3.429996, -4.221785, -2, 1, -0.5, 0.5, 0.5,
-3.429996, -4.221785, -2, 1, 1.5, 0.5, 0.5,
-3.429996, -4.221785, -2, 0, 1.5, 0.5, 0.5,
-3.429996, -4.221785, 0, 0, -0.5, 0.5, 0.5,
-3.429996, -4.221785, 0, 1, -0.5, 0.5, 0.5,
-3.429996, -4.221785, 0, 1, 1.5, 0.5, 0.5,
-3.429996, -4.221785, 0, 0, 1.5, 0.5, 0.5,
-3.429996, -4.221785, 2, 0, -0.5, 0.5, 0.5,
-3.429996, -4.221785, 2, 1, -0.5, 0.5, 0.5,
-3.429996, -4.221785, 2, 1, 1.5, 0.5, 0.5,
-3.429996, -4.221785, 2, 0, 1.5, 0.5, 0.5,
-3.429996, -4.221785, 4, 0, -0.5, 0.5, 0.5,
-3.429996, -4.221785, 4, 1, -0.5, 0.5, 0.5,
-3.429996, -4.221785, 4, 1, 1.5, 0.5, 0.5,
-3.429996, -4.221785, 4, 0, 1.5, 0.5, 0.5
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
-2.972153, -3.709345, -5.568072,
-2.972153, 3.123192, -5.568072,
-2.972153, -3.709345, 5.684726,
-2.972153, 3.123192, 5.684726,
-2.972153, -3.709345, -5.568072,
-2.972153, -3.709345, 5.684726,
-2.972153, 3.123192, -5.568072,
-2.972153, 3.123192, 5.684726,
-2.972153, -3.709345, -5.568072,
3.13242, -3.709345, -5.568072,
-2.972153, -3.709345, 5.684726,
3.13242, -3.709345, 5.684726,
-2.972153, 3.123192, -5.568072,
3.13242, 3.123192, -5.568072,
-2.972153, 3.123192, 5.684726,
3.13242, 3.123192, 5.684726,
3.13242, -3.709345, -5.568072,
3.13242, 3.123192, -5.568072,
3.13242, -3.709345, 5.684726,
3.13242, 3.123192, 5.684726,
3.13242, -3.709345, -5.568072,
3.13242, -3.709345, 5.684726,
3.13242, 3.123192, -5.568072,
3.13242, 3.123192, 5.684726
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
var radius = 7.748697;
var distance = 34.47483;
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
mvMatrix.translate( -0.08013356, 0.2930764, -0.05832696 );
mvMatrix.scale( 1.372421, 1.226198, 0.7445298 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.47483);
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
Di-n-propylether<-read.table("Di-n-propylether.xyz")
```

```
## Error in read.table("Di-n-propylether.xyz"): no lines available in input
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
-2.883251, 0.4609099, 0.7954824, 0, 0, 1, 1, 1,
-2.798744, -0.04810353, -2.169683, 1, 0, 0, 1, 1,
-2.779917, 1.159348, -0.3733024, 1, 0, 0, 1, 1,
-2.751368, 0.04427183, -0.4485893, 1, 0, 0, 1, 1,
-2.472321, 2.047476, -1.009245, 1, 0, 0, 1, 1,
-2.42176, -1.683466, -1.180191, 1, 0, 0, 1, 1,
-2.421466, -1.211017, -2.757873, 0, 0, 0, 1, 1,
-2.416354, -0.4439213, -1.334838, 0, 0, 0, 1, 1,
-2.295788, 0.4076622, -2.636515, 0, 0, 0, 1, 1,
-2.282972, -0.7463283, -3.91261, 0, 0, 0, 1, 1,
-2.269635, -0.08851136, -2.516981, 0, 0, 0, 1, 1,
-2.223151, 0.1627054, -2.074396, 0, 0, 0, 1, 1,
-2.213417, 0.1053409, -0.8052728, 0, 0, 0, 1, 1,
-2.212275, 0.9412138, -0.6051618, 1, 1, 1, 1, 1,
-2.196167, -0.5599419, -1.85115, 1, 1, 1, 1, 1,
-2.169553, -0.3059005, -2.89388, 1, 1, 1, 1, 1,
-2.109671, -1.003619, -0.5499335, 1, 1, 1, 1, 1,
-2.105114, 0.09482794, -1.981123, 1, 1, 1, 1, 1,
-2.049254, -0.2256612, -1.171954, 1, 1, 1, 1, 1,
-2.02934, 0.4895681, 1.117433, 1, 1, 1, 1, 1,
-2.011017, 0.3229022, -1.337733, 1, 1, 1, 1, 1,
-1.991578, -0.3447145, -1.694688, 1, 1, 1, 1, 1,
-1.985963, -0.5860755, -2.393177, 1, 1, 1, 1, 1,
-1.964728, -0.3460818, -1.638047, 1, 1, 1, 1, 1,
-1.944969, 0.7606811, -1.964749, 1, 1, 1, 1, 1,
-1.926946, -0.03168271, -3.709728, 1, 1, 1, 1, 1,
-1.916626, 1.095075, -2.250466, 1, 1, 1, 1, 1,
-1.909168, -0.07702872, -2.140613, 1, 1, 1, 1, 1,
-1.901278, -1.2917, -1.447846, 0, 0, 1, 1, 1,
-1.854072, 0.2160215, -3.122813, 1, 0, 0, 1, 1,
-1.833104, -0.9287308, -1.096963, 1, 0, 0, 1, 1,
-1.820289, 0.499218, -2.041445, 1, 0, 0, 1, 1,
-1.813403, 0.171715, -2.524139, 1, 0, 0, 1, 1,
-1.803915, -0.1857988, -1.140051, 1, 0, 0, 1, 1,
-1.792597, 1.94258, -0.02981094, 0, 0, 0, 1, 1,
-1.792583, -1.117642, -3.427879, 0, 0, 0, 1, 1,
-1.790296, 0.3485713, -1.124297, 0, 0, 0, 1, 1,
-1.774431, -0.3629141, -2.257032, 0, 0, 0, 1, 1,
-1.77195, 0.7168129, -1.827297, 0, 0, 0, 1, 1,
-1.765348, 0.3164999, -0.9682347, 0, 0, 0, 1, 1,
-1.721574, 0.8386223, -0.04098703, 0, 0, 0, 1, 1,
-1.720751, 0.416202, -1.223504, 1, 1, 1, 1, 1,
-1.679598, 2.018731, -0.9539739, 1, 1, 1, 1, 1,
-1.67355, -0.9622008, -1.811714, 1, 1, 1, 1, 1,
-1.665524, -1.391958, -1.960168, 1, 1, 1, 1, 1,
-1.660494, -0.4697507, -1.880289, 1, 1, 1, 1, 1,
-1.649442, -0.1447686, -1.709366, 1, 1, 1, 1, 1,
-1.64266, 1.461519, 0.2932868, 1, 1, 1, 1, 1,
-1.638581, 1.78627, -1.039854, 1, 1, 1, 1, 1,
-1.618123, 0.4145095, -3.885926, 1, 1, 1, 1, 1,
-1.609855, 0.4687137, -2.145427, 1, 1, 1, 1, 1,
-1.600757, 0.7372339, -0.2976253, 1, 1, 1, 1, 1,
-1.585782, 1.683434, -0.8101714, 1, 1, 1, 1, 1,
-1.57932, -0.3458397, -1.566728, 1, 1, 1, 1, 1,
-1.540903, 1.724019, -1.513989, 1, 1, 1, 1, 1,
-1.538274, -1.18823, -1.810104, 1, 1, 1, 1, 1,
-1.526553, -1.280441, -2.192805, 0, 0, 1, 1, 1,
-1.521597, -0.7270216, -2.745039, 1, 0, 0, 1, 1,
-1.520219, 0.1085365, -1.676448, 1, 0, 0, 1, 1,
-1.519493, 1.152639, -1.359145, 1, 0, 0, 1, 1,
-1.517703, 0.4344613, -3.313761, 1, 0, 0, 1, 1,
-1.514983, 1.10604, -0.3182165, 1, 0, 0, 1, 1,
-1.510504, -1.298908, -2.947857, 0, 0, 0, 1, 1,
-1.508268, 0.1482669, -0.08483203, 0, 0, 0, 1, 1,
-1.506947, -1.056362, -1.618552, 0, 0, 0, 1, 1,
-1.496049, 0.8111978, -0.9454327, 0, 0, 0, 1, 1,
-1.492485, -2.145673, -1.604403, 0, 0, 0, 1, 1,
-1.490919, 0.6792941, -1.874303, 0, 0, 0, 1, 1,
-1.489529, 0.2227373, -2.721008, 0, 0, 0, 1, 1,
-1.477377, 0.9867365, -1.185703, 1, 1, 1, 1, 1,
-1.387831, 0.315864, -1.714254, 1, 1, 1, 1, 1,
-1.378377, -1.308201, -3.371844, 1, 1, 1, 1, 1,
-1.376171, -0.3776651, -2.837181, 1, 1, 1, 1, 1,
-1.370464, 0.9471444, -3.524644, 1, 1, 1, 1, 1,
-1.362504, 2.407616, -0.1042633, 1, 1, 1, 1, 1,
-1.345955, 0.7429157, -1.234513, 1, 1, 1, 1, 1,
-1.332723, -1.533088, -2.150512, 1, 1, 1, 1, 1,
-1.329699, -0.7407082, -2.943659, 1, 1, 1, 1, 1,
-1.32827, 0.606348, -0.5043144, 1, 1, 1, 1, 1,
-1.327853, -0.07624208, -3.214307, 1, 1, 1, 1, 1,
-1.326379, -0.3746998, -3.253469, 1, 1, 1, 1, 1,
-1.325691, 0.4428467, -0.2891873, 1, 1, 1, 1, 1,
-1.322245, 1.08894, -2.156797, 1, 1, 1, 1, 1,
-1.321669, -0.1580289, -0.9225622, 1, 1, 1, 1, 1,
-1.316009, -2.143793, -3.758578, 0, 0, 1, 1, 1,
-1.315033, 1.698919, -2.071378, 1, 0, 0, 1, 1,
-1.311429, -0.5939569, -2.513407, 1, 0, 0, 1, 1,
-1.308404, -0.2610644, -2.344322, 1, 0, 0, 1, 1,
-1.308159, 0.07040463, -0.8933724, 1, 0, 0, 1, 1,
-1.306044, 0.9266955, -0.8815464, 1, 0, 0, 1, 1,
-1.304139, -0.1105839, -2.070469, 0, 0, 0, 1, 1,
-1.30212, -0.5098867, -2.225651, 0, 0, 0, 1, 1,
-1.301028, -1.274335, -2.841632, 0, 0, 0, 1, 1,
-1.289502, 0.679023, -1.320704, 0, 0, 0, 1, 1,
-1.287695, -0.3042029, -1.760923, 0, 0, 0, 1, 1,
-1.286714, 1.463007, 0.2012038, 0, 0, 0, 1, 1,
-1.283818, -1.08068, -2.54788, 0, 0, 0, 1, 1,
-1.28149, 1.1339, -1.953859, 1, 1, 1, 1, 1,
-1.276391, -1.394832, -3.099928, 1, 1, 1, 1, 1,
-1.272607, 0.217958, -0.4058399, 1, 1, 1, 1, 1,
-1.270517, 0.9820279, -1.417673, 1, 1, 1, 1, 1,
-1.270353, -0.1003519, -1.888427, 1, 1, 1, 1, 1,
-1.269338, 1.150762, -0.3082721, 1, 1, 1, 1, 1,
-1.26123, -0.4413888, -1.841549, 1, 1, 1, 1, 1,
-1.259313, 1.724942, 0.6970032, 1, 1, 1, 1, 1,
-1.254263, 0.6302022, 1.506447, 1, 1, 1, 1, 1,
-1.250803, 0.6443596, -3.373253, 1, 1, 1, 1, 1,
-1.248201, -1.167083, -0.4954458, 1, 1, 1, 1, 1,
-1.244916, -0.576844, -2.528013, 1, 1, 1, 1, 1,
-1.243361, -1.839364, -3.791739, 1, 1, 1, 1, 1,
-1.243044, -2.361161, -2.79122, 1, 1, 1, 1, 1,
-1.239943, -0.3952808, -3.057546, 1, 1, 1, 1, 1,
-1.231398, 1.107273, -0.4612093, 0, 0, 1, 1, 1,
-1.230405, 0.5208384, -0.9574062, 1, 0, 0, 1, 1,
-1.230232, 0.2725611, -2.42542, 1, 0, 0, 1, 1,
-1.22923, 0.1069034, -1.465907, 1, 0, 0, 1, 1,
-1.228513, -2.351175, -3.003206, 1, 0, 0, 1, 1,
-1.223074, 0.857266, -0.6843106, 1, 0, 0, 1, 1,
-1.21701, -0.3753281, -1.638174, 0, 0, 0, 1, 1,
-1.188811, -1.290054, -1.857233, 0, 0, 0, 1, 1,
-1.183855, 0.3854964, 0.1310095, 0, 0, 0, 1, 1,
-1.183371, -0.04355923, -1.844813, 0, 0, 0, 1, 1,
-1.17146, 0.8180125, -0.5415142, 0, 0, 0, 1, 1,
-1.16504, 0.7608585, 0.796429, 0, 0, 0, 1, 1,
-1.162001, 0.2681111, -2.247567, 0, 0, 0, 1, 1,
-1.156473, -1.261254, -1.668216, 1, 1, 1, 1, 1,
-1.150774, -0.1191017, -1.807187, 1, 1, 1, 1, 1,
-1.150714, 0.3815786, -0.5806487, 1, 1, 1, 1, 1,
-1.132955, 0.2980126, -1.764492, 1, 1, 1, 1, 1,
-1.109244, 0.8926312, 0.9875266, 1, 1, 1, 1, 1,
-1.103768, -0.8886768, -2.17626, 1, 1, 1, 1, 1,
-1.103739, -1.575755, -3.085585, 1, 1, 1, 1, 1,
-1.103694, -0.02445821, -1.521083, 1, 1, 1, 1, 1,
-1.103227, -0.4391532, -2.827368, 1, 1, 1, 1, 1,
-1.101035, 0.5205467, -0.7033144, 1, 1, 1, 1, 1,
-1.094549, 0.3240943, -0.4235725, 1, 1, 1, 1, 1,
-1.091467, 0.7599681, 0.02689232, 1, 1, 1, 1, 1,
-1.084585, 2.327332, -1.499682, 1, 1, 1, 1, 1,
-1.084351, -0.2694355, -1.699739, 1, 1, 1, 1, 1,
-1.082652, 0.9346396, -1.698366, 1, 1, 1, 1, 1,
-1.060733, 1.777894, -0.7407214, 0, 0, 1, 1, 1,
-1.060555, -0.1909582, -3.361146, 1, 0, 0, 1, 1,
-1.056976, -0.01550411, -0.8565554, 1, 0, 0, 1, 1,
-1.05577, 1.907978, 1.314831, 1, 0, 0, 1, 1,
-1.054196, 0.4496338, -1.551541, 1, 0, 0, 1, 1,
-1.042774, 0.05536538, -1.137209, 1, 0, 0, 1, 1,
-1.032692, 0.9723361, 0.9919329, 0, 0, 0, 1, 1,
-1.029889, -1.054939, -1.96242, 0, 0, 0, 1, 1,
-1.029128, -2.189419, -4.028887, 0, 0, 0, 1, 1,
-1.026822, 0.04882612, -2.02931, 0, 0, 0, 1, 1,
-1.026643, -1.001898, -3.590769, 0, 0, 0, 1, 1,
-1.022461, -0.2257272, -3.302814, 0, 0, 0, 1, 1,
-1.021878, 1.383475, 0.6064219, 0, 0, 0, 1, 1,
-1.017784, -0.6246418, -3.27072, 1, 1, 1, 1, 1,
-1.016625, -1.01685, -3.067213, 1, 1, 1, 1, 1,
-1.016274, 1.126048, -0.5576754, 1, 1, 1, 1, 1,
-1.013646, 0.03560148, -2.556731, 1, 1, 1, 1, 1,
-1.006015, -0.9872548, -2.341686, 1, 1, 1, 1, 1,
-1.002913, -1.085042, -2.085143, 1, 1, 1, 1, 1,
-1.000695, 0.6667333, -1.716338, 1, 1, 1, 1, 1,
-1.000425, 0.5114471, -1.371056, 1, 1, 1, 1, 1,
-1.00004, -0.6464617, -1.394848, 1, 1, 1, 1, 1,
-0.9954467, 0.6643336, -0.3949613, 1, 1, 1, 1, 1,
-0.9908607, 1.355758, -0.3060599, 1, 1, 1, 1, 1,
-0.990385, -1.711963, -0.5028102, 1, 1, 1, 1, 1,
-0.9875576, 0.4742474, -0.7910254, 1, 1, 1, 1, 1,
-0.9859196, 1.990399, 0.6825701, 1, 1, 1, 1, 1,
-0.9844882, 0.8481867, -2.623346, 1, 1, 1, 1, 1,
-0.9760436, 0.514986, 0.8678221, 0, 0, 1, 1, 1,
-0.9710476, 0.2555907, -2.050004, 1, 0, 0, 1, 1,
-0.9652978, -0.1453831, -0.6550359, 1, 0, 0, 1, 1,
-0.9639134, 0.06562989, -1.770374, 1, 0, 0, 1, 1,
-0.9631148, 0.5706549, -0.5401779, 1, 0, 0, 1, 1,
-0.9605376, -0.01079249, -1.099775, 1, 0, 0, 1, 1,
-0.9594874, -0.337925, -2.744214, 0, 0, 0, 1, 1,
-0.9589448, 1.245741, -0.5521749, 0, 0, 0, 1, 1,
-0.9574353, -2.26427, -2.776949, 0, 0, 0, 1, 1,
-0.9496396, 1.077435, 0.7735156, 0, 0, 0, 1, 1,
-0.9488787, 0.5140836, -1.179677, 0, 0, 0, 1, 1,
-0.9472117, 0.3426662, -1.864329, 0, 0, 0, 1, 1,
-0.9438054, 0.1288769, -0.3595693, 0, 0, 0, 1, 1,
-0.9346671, 0.7567902, -0.246508, 1, 1, 1, 1, 1,
-0.9253576, 1.489147, -0.5281493, 1, 1, 1, 1, 1,
-0.9226635, 0.404081, -1.114782, 1, 1, 1, 1, 1,
-0.915318, -0.891011, -2.345263, 1, 1, 1, 1, 1,
-0.914682, 0.8752249, -2.082018, 1, 1, 1, 1, 1,
-0.9050323, -0.8015916, -1.36368, 1, 1, 1, 1, 1,
-0.9028893, -0.3312899, -2.195893, 1, 1, 1, 1, 1,
-0.8996595, 0.1015327, -1.755977, 1, 1, 1, 1, 1,
-0.8944947, 0.7963369, 0.6720863, 1, 1, 1, 1, 1,
-0.893713, -0.1481289, -1.802883, 1, 1, 1, 1, 1,
-0.8882871, -0.4081364, -1.011582, 1, 1, 1, 1, 1,
-0.8794701, 0.3075991, -2.240641, 1, 1, 1, 1, 1,
-0.8769851, 1.906626, -0.9575269, 1, 1, 1, 1, 1,
-0.8695925, 0.8123555, -0.07395346, 1, 1, 1, 1, 1,
-0.8601808, -0.5927963, -1.292776, 1, 1, 1, 1, 1,
-0.854764, 1.295824, 0.2658297, 0, 0, 1, 1, 1,
-0.8492399, 2.143761, 0.7084255, 1, 0, 0, 1, 1,
-0.8491193, 1.054946, -0.886741, 1, 0, 0, 1, 1,
-0.8476844, -0.0882265, -0.670408, 1, 0, 0, 1, 1,
-0.844448, 1.206886, -1.005488, 1, 0, 0, 1, 1,
-0.8420795, 0.9621475, 0.3252317, 1, 0, 0, 1, 1,
-0.8409054, 0.8919811, -0.3346314, 0, 0, 0, 1, 1,
-0.8368902, -1.360229, -3.039861, 0, 0, 0, 1, 1,
-0.8343422, -0.1220848, -1.391021, 0, 0, 0, 1, 1,
-0.8283635, 0.5364016, -0.8721408, 0, 0, 0, 1, 1,
-0.8224654, 2.06137, -1.29317, 0, 0, 0, 1, 1,
-0.8212737, -0.04503433, -1.850624, 0, 0, 0, 1, 1,
-0.8203136, -0.5383332, -0.4498912, 0, 0, 0, 1, 1,
-0.8179094, 0.5465248, -1.876829, 1, 1, 1, 1, 1,
-0.8126428, -0.9098869, -2.173854, 1, 1, 1, 1, 1,
-0.8052641, -1.186283, -0.757749, 1, 1, 1, 1, 1,
-0.8027427, -0.9396896, -1.595218, 1, 1, 1, 1, 1,
-0.8019192, 0.7273688, -0.5700382, 1, 1, 1, 1, 1,
-0.7961186, 0.6556129, -0.4167618, 1, 1, 1, 1, 1,
-0.7935066, -0.6100333, -2.474344, 1, 1, 1, 1, 1,
-0.7896206, -0.4393961, -1.226968, 1, 1, 1, 1, 1,
-0.789509, 1.861526, -0.007169453, 1, 1, 1, 1, 1,
-0.7790084, -1.190394, -3.174039, 1, 1, 1, 1, 1,
-0.7738451, -0.5791931, -0.8080041, 1, 1, 1, 1, 1,
-0.7702986, -0.9343671, -2.893256, 1, 1, 1, 1, 1,
-0.7692659, -0.2396004, -0.3882781, 1, 1, 1, 1, 1,
-0.7543317, -0.4927002, -2.609375, 1, 1, 1, 1, 1,
-0.7479138, -0.3774193, -2.819177, 1, 1, 1, 1, 1,
-0.7478032, -0.07651208, -0.4836606, 0, 0, 1, 1, 1,
-0.7472494, -1.196745, -2.290562, 1, 0, 0, 1, 1,
-0.7454545, -0.8476463, -3.791918, 1, 0, 0, 1, 1,
-0.7448966, -0.9060195, -3.073914, 1, 0, 0, 1, 1,
-0.7407998, -0.3268417, -1.467719, 1, 0, 0, 1, 1,
-0.740719, 1.700001, 0.4026738, 1, 0, 0, 1, 1,
-0.7392015, -0.2428212, -2.827331, 0, 0, 0, 1, 1,
-0.7349982, -0.1290063, -0.306632, 0, 0, 0, 1, 1,
-0.7310925, 0.7285069, 1.305305, 0, 0, 0, 1, 1,
-0.7258214, 0.02372105, -1.637931, 0, 0, 0, 1, 1,
-0.724934, -0.4394144, -2.237585, 0, 0, 0, 1, 1,
-0.7235987, 1.144439, 0.4508177, 0, 0, 0, 1, 1,
-0.7232626, -0.6797197, -4.07818, 0, 0, 0, 1, 1,
-0.7200501, 0.9681283, -2.74257, 1, 1, 1, 1, 1,
-0.7198879, 2.055007, -0.8326262, 1, 1, 1, 1, 1,
-0.7162878, 2.122899, -1.070008, 1, 1, 1, 1, 1,
-0.7130534, 0.3104598, 0.1977488, 1, 1, 1, 1, 1,
-0.7117856, -0.7480936, -2.437229, 1, 1, 1, 1, 1,
-0.711762, 1.333163, -0.7898783, 1, 1, 1, 1, 1,
-0.7105609, 1.14492, 0.9951191, 1, 1, 1, 1, 1,
-0.7041298, 0.5823584, -1.739879, 1, 1, 1, 1, 1,
-0.7038179, -0.696966, -1.224718, 1, 1, 1, 1, 1,
-0.6988033, 2.280828, -0.4252065, 1, 1, 1, 1, 1,
-0.6939024, 0.2903564, -1.873552, 1, 1, 1, 1, 1,
-0.693448, 2.019586, -1.060116, 1, 1, 1, 1, 1,
-0.6898604, 0.5202584, 1.137624, 1, 1, 1, 1, 1,
-0.6850548, -1.022172, -1.107292, 1, 1, 1, 1, 1,
-0.6843495, 1.143949, 0.5449266, 1, 1, 1, 1, 1,
-0.6795039, -0.7913324, -3.087292, 0, 0, 1, 1, 1,
-0.6773633, -0.04721626, -4.536908, 1, 0, 0, 1, 1,
-0.6758296, 0.1710754, -0.4239396, 1, 0, 0, 1, 1,
-0.67299, -0.2724034, -0.7863448, 1, 0, 0, 1, 1,
-0.6726625, 1.535362, -0.7033901, 1, 0, 0, 1, 1,
-0.6718696, 1.036249, -0.970608, 1, 0, 0, 1, 1,
-0.6700196, -0.6624526, -2.370787, 0, 0, 0, 1, 1,
-0.6675092, 1.306724, 0.7906085, 0, 0, 0, 1, 1,
-0.6665649, 0.9249247, 1.048235, 0, 0, 0, 1, 1,
-0.6622739, 1.241483, -1.598142, 0, 0, 0, 1, 1,
-0.6605307, 1.785485, 0.2282876, 0, 0, 0, 1, 1,
-0.6586517, 0.5271204, -2.174687, 0, 0, 0, 1, 1,
-0.6569586, 0.4492273, 0.4575055, 0, 0, 0, 1, 1,
-0.6517016, -0.9217442, -3.44135, 1, 1, 1, 1, 1,
-0.6509487, -1.258275, -2.714011, 1, 1, 1, 1, 1,
-0.6441241, -2.299058, -3.091625, 1, 1, 1, 1, 1,
-0.6438169, -0.9737759, -2.76095, 1, 1, 1, 1, 1,
-0.6437094, -0.6828731, -3.435469, 1, 1, 1, 1, 1,
-0.6434691, 1.490741, 0.1754976, 1, 1, 1, 1, 1,
-0.6390623, -0.7951556, -2.242534, 1, 1, 1, 1, 1,
-0.6383516, -1.146329, -3.23976, 1, 1, 1, 1, 1,
-0.6373392, 1.16293, -1.129311, 1, 1, 1, 1, 1,
-0.6335464, 0.2031019, -0.6971179, 1, 1, 1, 1, 1,
-0.6320677, 0.2324806, -2.035445, 1, 1, 1, 1, 1,
-0.6275335, -0.1011767, -1.36587, 1, 1, 1, 1, 1,
-0.626789, 0.07093521, -1.037646, 1, 1, 1, 1, 1,
-0.6234557, -1.093123, -2.052086, 1, 1, 1, 1, 1,
-0.6212924, -1.237202, -2.914223, 1, 1, 1, 1, 1,
-0.6138651, -1.554605, -1.877034, 0, 0, 1, 1, 1,
-0.6072845, -0.3995613, -1.088575, 1, 0, 0, 1, 1,
-0.6048055, -0.6097584, -2.503206, 1, 0, 0, 1, 1,
-0.6034587, -0.6513002, -1.734934, 1, 0, 0, 1, 1,
-0.5994557, -0.4583525, -2.21124, 1, 0, 0, 1, 1,
-0.5984132, -1.966366, -2.69664, 1, 0, 0, 1, 1,
-0.5950187, 0.5879651, -1.219919, 0, 0, 0, 1, 1,
-0.5904325, -0.2890443, -2.147307, 0, 0, 0, 1, 1,
-0.5870894, 1.137745, -0.2293178, 0, 0, 0, 1, 1,
-0.5855316, 0.4623307, -0.6485968, 0, 0, 0, 1, 1,
-0.5852689, 0.134026, -1.449145, 0, 0, 0, 1, 1,
-0.5792627, -1.382916, -1.605177, 0, 0, 0, 1, 1,
-0.571584, -1.044631, -4.704366, 0, 0, 0, 1, 1,
-0.5696852, -0.791589, -3.008803, 1, 1, 1, 1, 1,
-0.562385, -0.1717772, -2.959373, 1, 1, 1, 1, 1,
-0.5610552, 0.9137973, -0.2952892, 1, 1, 1, 1, 1,
-0.5586398, 0.7571549, 0.058606, 1, 1, 1, 1, 1,
-0.558454, 2.232737, -0.09121852, 1, 1, 1, 1, 1,
-0.5548126, -1.497258, -3.227736, 1, 1, 1, 1, 1,
-0.5544628, -3.609842, -3.370726, 1, 1, 1, 1, 1,
-0.5526374, -1.94424, -4.55357, 1, 1, 1, 1, 1,
-0.5481931, 0.610947, -2.595389, 1, 1, 1, 1, 1,
-0.5477124, -1.175981, -2.872503, 1, 1, 1, 1, 1,
-0.545724, 1.777011, -2.115736, 1, 1, 1, 1, 1,
-0.5445128, -1.511133, -1.899393, 1, 1, 1, 1, 1,
-0.5388668, -0.7941305, -3.51885, 1, 1, 1, 1, 1,
-0.5376968, -0.3341833, -1.913184, 1, 1, 1, 1, 1,
-0.5354786, -0.607193, -1.878571, 1, 1, 1, 1, 1,
-0.5337625, 0.7351449, -0.3787159, 0, 0, 1, 1, 1,
-0.5277951, 0.6617092, -1.869599, 1, 0, 0, 1, 1,
-0.5247313, 0.3758669, -1.50197, 1, 0, 0, 1, 1,
-0.5204097, 0.08285242, -2.149857, 1, 0, 0, 1, 1,
-0.5191725, 0.09052059, 0.06516408, 1, 0, 0, 1, 1,
-0.5188406, -2.003525, -1.023194, 1, 0, 0, 1, 1,
-0.5134701, 0.8998005, 0.7399582, 0, 0, 0, 1, 1,
-0.5130772, 0.9947153, 0.2233705, 0, 0, 0, 1, 1,
-0.5094026, 1.739795, -0.9851741, 0, 0, 0, 1, 1,
-0.5064254, -0.1438298, -3.126602, 0, 0, 0, 1, 1,
-0.5062448, 0.6518201, -1.404132, 0, 0, 0, 1, 1,
-0.4891177, 0.872247, -0.3671703, 0, 0, 0, 1, 1,
-0.4882647, 0.9851807, 2.389852, 0, 0, 0, 1, 1,
-0.4879483, -0.9890212, -1.507738, 1, 1, 1, 1, 1,
-0.4867029, 0.2681457, 1.742483, 1, 1, 1, 1, 1,
-0.4860838, -0.795323, -2.211197, 1, 1, 1, 1, 1,
-0.4834977, 1.748712, 1.543447, 1, 1, 1, 1, 1,
-0.4817826, -0.2934024, -2.330184, 1, 1, 1, 1, 1,
-0.4780469, 0.743862, -1.006401, 1, 1, 1, 1, 1,
-0.4777417, -0.3988247, -1.903185, 1, 1, 1, 1, 1,
-0.4757874, 1.22017, 0.2400306, 1, 1, 1, 1, 1,
-0.4742958, -0.5460893, -0.7730295, 1, 1, 1, 1, 1,
-0.4719289, -0.0003158529, -3.302787, 1, 1, 1, 1, 1,
-0.4717268, -0.5544016, -2.594963, 1, 1, 1, 1, 1,
-0.4709973, -0.1694456, -1.640513, 1, 1, 1, 1, 1,
-0.4692393, 0.8501657, 0.6412376, 1, 1, 1, 1, 1,
-0.4646994, 0.05476546, -2.186238, 1, 1, 1, 1, 1,
-0.4646323, -0.4399086, -3.020272, 1, 1, 1, 1, 1,
-0.4642515, -0.5702683, -1.197697, 0, 0, 1, 1, 1,
-0.4610239, -0.6307065, -2.416103, 1, 0, 0, 1, 1,
-0.4547611, -0.8232078, -3.290341, 1, 0, 0, 1, 1,
-0.454408, -1.771859, -3.34843, 1, 0, 0, 1, 1,
-0.4525082, -0.3653064, -0.4783141, 1, 0, 0, 1, 1,
-0.4481041, 0.8753715, 0.266205, 1, 0, 0, 1, 1,
-0.4478632, -0.8517403, -2.892439, 0, 0, 0, 1, 1,
-0.4470933, -0.5782618, -1.840196, 0, 0, 0, 1, 1,
-0.4449121, -0.9418894, -1.793938, 0, 0, 0, 1, 1,
-0.4438307, -0.8208444, -2.932297, 0, 0, 0, 1, 1,
-0.4429113, 0.06439929, -1.663653, 0, 0, 0, 1, 1,
-0.4397207, 1.849802, -0.3447944, 0, 0, 0, 1, 1,
-0.4378066, -1.088124, -2.27465, 0, 0, 0, 1, 1,
-0.4361928, -0.1755978, -1.037863, 1, 1, 1, 1, 1,
-0.4359574, 1.051188, -0.009006361, 1, 1, 1, 1, 1,
-0.4333975, -1.084508, -2.486756, 1, 1, 1, 1, 1,
-0.4274924, -1.317047, -2.603712, 1, 1, 1, 1, 1,
-0.4271458, 0.009755129, -0.9619491, 1, 1, 1, 1, 1,
-0.4245906, 0.4985022, -0.5208924, 1, 1, 1, 1, 1,
-0.4238455, -0.09211089, -1.867468, 1, 1, 1, 1, 1,
-0.4204988, -0.08448937, -1.005347, 1, 1, 1, 1, 1,
-0.408083, 0.1223532, -1.673141, 1, 1, 1, 1, 1,
-0.400379, -0.9367641, -0.7723081, 1, 1, 1, 1, 1,
-0.3989635, 1.171241, -1.971354, 1, 1, 1, 1, 1,
-0.3976667, -0.4002016, -2.266026, 1, 1, 1, 1, 1,
-0.3899203, -1.976397, -2.559449, 1, 1, 1, 1, 1,
-0.3887126, 1.374091, -0.766467, 1, 1, 1, 1, 1,
-0.3863616, -1.826293, -2.647415, 1, 1, 1, 1, 1,
-0.3798187, 0.615398, 0.8267431, 0, 0, 1, 1, 1,
-0.3792018, 1.050015, -0.7782761, 1, 0, 0, 1, 1,
-0.3780604, -0.09283391, -1.428094, 1, 0, 0, 1, 1,
-0.3752886, -0.6177503, -2.451198, 1, 0, 0, 1, 1,
-0.3720203, 0.9431194, -2.061788, 1, 0, 0, 1, 1,
-0.3706125, -0.8576267, -1.420479, 1, 0, 0, 1, 1,
-0.3680962, 1.193575, 0.312035, 0, 0, 0, 1, 1,
-0.3678603, 2.605336, 2.136225, 0, 0, 0, 1, 1,
-0.3656484, -1.485776, -3.338183, 0, 0, 0, 1, 1,
-0.3655024, -1.133569, -2.736521, 0, 0, 0, 1, 1,
-0.3653975, 0.9268641, -0.555347, 0, 0, 0, 1, 1,
-0.363776, 0.6917189, -0.8857257, 0, 0, 0, 1, 1,
-0.3609629, 1.217625, -1.615665, 0, 0, 0, 1, 1,
-0.3538727, 1.380261, -1.774178, 1, 1, 1, 1, 1,
-0.3534721, -1.477907, -2.851796, 1, 1, 1, 1, 1,
-0.3514093, 1.006554, 1.065796, 1, 1, 1, 1, 1,
-0.3497479, 0.5100946, -0.7486166, 1, 1, 1, 1, 1,
-0.3475399, -1.857071, -2.068466, 1, 1, 1, 1, 1,
-0.3459006, 0.6831836, -0.4409525, 1, 1, 1, 1, 1,
-0.3419006, -0.1971937, -1.811582, 1, 1, 1, 1, 1,
-0.3413208, -0.3236348, -0.5487608, 1, 1, 1, 1, 1,
-0.3397892, 1.196555, -0.4235168, 1, 1, 1, 1, 1,
-0.3394644, 0.902913, -0.8824093, 1, 1, 1, 1, 1,
-0.338796, 0.03053385, -1.195639, 1, 1, 1, 1, 1,
-0.3352995, -0.0555715, -2.415064, 1, 1, 1, 1, 1,
-0.3329569, 1.848244, 1.685158, 1, 1, 1, 1, 1,
-0.3317317, -1.032502, -2.231295, 1, 1, 1, 1, 1,
-0.3303584, -0.3153968, -2.501582, 1, 1, 1, 1, 1,
-0.3287426, 0.3263355, -1.8365, 0, 0, 1, 1, 1,
-0.3277559, 1.146907, 0.9380932, 1, 0, 0, 1, 1,
-0.3195907, -0.90233, -3.350369, 1, 0, 0, 1, 1,
-0.3187207, -0.9774597, -0.5121348, 1, 0, 0, 1, 1,
-0.3166665, 0.986932, 0.07849725, 1, 0, 0, 1, 1,
-0.315045, 0.6403495, -2.005381, 1, 0, 0, 1, 1,
-0.3125783, -0.5924184, -1.358758, 0, 0, 0, 1, 1,
-0.3106966, -2.222203, -1.322746, 0, 0, 0, 1, 1,
-0.3087433, 1.327191, 0.1278869, 0, 0, 0, 1, 1,
-0.3081594, 1.091186, -0.3609214, 0, 0, 0, 1, 1,
-0.3017149, 1.646838, -0.4393127, 0, 0, 0, 1, 1,
-0.3015489, -0.2245509, -2.892091, 0, 0, 0, 1, 1,
-0.2996826, -0.6261814, -4.218566, 0, 0, 0, 1, 1,
-0.2957942, -0.9369127, -3.110063, 1, 1, 1, 1, 1,
-0.2926417, -0.5379586, -2.241139, 1, 1, 1, 1, 1,
-0.2903123, 0.01623703, -0.948779, 1, 1, 1, 1, 1,
-0.2861381, 0.5566983, 0.5744455, 1, 1, 1, 1, 1,
-0.2847112, -1.092968, -2.566864, 1, 1, 1, 1, 1,
-0.2841796, -0.5564656, -2.155542, 1, 1, 1, 1, 1,
-0.2797089, 0.6460594, 0.5969711, 1, 1, 1, 1, 1,
-0.2778004, 1.341348, -0.6151434, 1, 1, 1, 1, 1,
-0.2751789, 1.10596, -0.2205202, 1, 1, 1, 1, 1,
-0.2737131, 0.3550077, -2.014903, 1, 1, 1, 1, 1,
-0.2701431, -0.6628765, -1.166491, 1, 1, 1, 1, 1,
-0.2700938, -0.865666, -3.440386, 1, 1, 1, 1, 1,
-0.2680326, 0.8860105, -1.584565, 1, 1, 1, 1, 1,
-0.262899, 0.5813977, -1.174975, 1, 1, 1, 1, 1,
-0.2596533, 0.5448998, 0.6559741, 1, 1, 1, 1, 1,
-0.2576356, 0.1504953, -0.5350032, 0, 0, 1, 1, 1,
-0.2553159, 0.4777852, -0.6673428, 1, 0, 0, 1, 1,
-0.2538395, -1.608637, -4.070055, 1, 0, 0, 1, 1,
-0.2527274, 1.064938, 0.04480585, 1, 0, 0, 1, 1,
-0.252463, 0.6900786, -0.2897393, 1, 0, 0, 1, 1,
-0.2520561, 0.5956274, -0.1612913, 1, 0, 0, 1, 1,
-0.2487901, 1.68236, 0.3111377, 0, 0, 0, 1, 1,
-0.244547, -0.5606343, -3.374822, 0, 0, 0, 1, 1,
-0.2388951, 0.5578041, -0.3577052, 0, 0, 0, 1, 1,
-0.2312167, -0.5187271, -3.300956, 0, 0, 0, 1, 1,
-0.2304395, 0.7867586, 0.4238421, 0, 0, 0, 1, 1,
-0.2275874, -0.5138416, -1.989735, 0, 0, 0, 1, 1,
-0.2152295, 1.694173, 0.06294417, 0, 0, 0, 1, 1,
-0.2150576, 0.01383165, -1.517029, 1, 1, 1, 1, 1,
-0.2130833, -0.5049307, -2.930134, 1, 1, 1, 1, 1,
-0.2125896, -1.748629, -2.779748, 1, 1, 1, 1, 1,
-0.2103388, -0.7748768, -2.588456, 1, 1, 1, 1, 1,
-0.2089004, 0.2573227, -1.101388, 1, 1, 1, 1, 1,
-0.2045081, 0.4410715, -0.2899882, 1, 1, 1, 1, 1,
-0.2027946, -0.02073556, -2.428072, 1, 1, 1, 1, 1,
-0.2005984, -0.925161, -2.839254, 1, 1, 1, 1, 1,
-0.1948539, 0.2354852, -0.09979311, 1, 1, 1, 1, 1,
-0.1923032, -1.715093, -4.703547, 1, 1, 1, 1, 1,
-0.1856344, -0.5515022, -1.050846, 1, 1, 1, 1, 1,
-0.1829188, -0.582384, -2.365158, 1, 1, 1, 1, 1,
-0.182729, -1.00596, -3.63418, 1, 1, 1, 1, 1,
-0.1825169, -0.7901354, -4.365533, 1, 1, 1, 1, 1,
-0.1792002, 1.606613, -0.1451491, 1, 1, 1, 1, 1,
-0.1758277, 1.146485, -0.3238304, 0, 0, 1, 1, 1,
-0.1751913, 1.123483, -1.656654, 1, 0, 0, 1, 1,
-0.1747097, -0.5825933, -3.400051, 1, 0, 0, 1, 1,
-0.1742656, 1.079358, 0.01005419, 1, 0, 0, 1, 1,
-0.1710437, 0.4052446, -0.1493911, 1, 0, 0, 1, 1,
-0.1697364, -0.9651756, -3.113191, 1, 0, 0, 1, 1,
-0.16931, 0.1136294, 0.1092721, 0, 0, 0, 1, 1,
-0.168024, 0.1944717, -1.848866, 0, 0, 0, 1, 1,
-0.1639423, -0.5293563, -1.04755, 0, 0, 0, 1, 1,
-0.1563518, -0.3646335, -3.914195, 0, 0, 0, 1, 1,
-0.1550554, 1.213785, -0.6280823, 0, 0, 0, 1, 1,
-0.1510893, 0.7456378, 2.105794, 0, 0, 0, 1, 1,
-0.1506634, -1.211808, -1.735744, 0, 0, 0, 1, 1,
-0.1481826, 0.3820206, 0.7220702, 1, 1, 1, 1, 1,
-0.1449114, -0.3083926, -3.435626, 1, 1, 1, 1, 1,
-0.1342667, -0.4174743, -2.751231, 1, 1, 1, 1, 1,
-0.1315836, 0.5209002, 1.278852, 1, 1, 1, 1, 1,
-0.1312748, -1.95353, -2.121022, 1, 1, 1, 1, 1,
-0.1297542, -0.3543222, -2.135263, 1, 1, 1, 1, 1,
-0.125585, -0.8941144, -0.494619, 1, 1, 1, 1, 1,
-0.125314, 0.2737526, -2.283938, 1, 1, 1, 1, 1,
-0.1222674, -0.9440053, -3.714906, 1, 1, 1, 1, 1,
-0.112874, -0.3271419, -5.271599, 1, 1, 1, 1, 1,
-0.1088339, 0.5706824, 0.09979862, 1, 1, 1, 1, 1,
-0.1061905, 0.05850044, -1.658782, 1, 1, 1, 1, 1,
-0.09804981, 0.4049165, 0.5132544, 1, 1, 1, 1, 1,
-0.09553945, 0.4024874, -0.2031516, 1, 1, 1, 1, 1,
-0.09369354, -1.875895, -3.938501, 1, 1, 1, 1, 1,
-0.08646754, -0.371458, -2.519417, 0, 0, 1, 1, 1,
-0.08473895, -1.244225, -3.52806, 1, 0, 0, 1, 1,
-0.08008835, 0.2833512, 0.5548841, 1, 0, 0, 1, 1,
-0.07900476, 0.05517478, -0.3947894, 1, 0, 0, 1, 1,
-0.07574829, -0.7198697, -2.158984, 1, 0, 0, 1, 1,
-0.07456487, 1.347413, -0.3200891, 1, 0, 0, 1, 1,
-0.07170702, -1.059666, -2.822527, 0, 0, 0, 1, 1,
-0.07117496, -1.261072, -0.994913, 0, 0, 0, 1, 1,
-0.06749593, -1.240544, -1.444605, 0, 0, 0, 1, 1,
-0.06325153, -2.561806, -3.485221, 0, 0, 0, 1, 1,
-0.06073174, 0.2218849, 0.9579888, 0, 0, 0, 1, 1,
-0.05701015, -1.029421, -2.896809, 0, 0, 0, 1, 1,
-0.05614108, -0.3971979, -4.340153, 0, 0, 0, 1, 1,
-0.05571801, 0.7863901, 1.815009, 1, 1, 1, 1, 1,
-0.0524008, 0.200215, -1.290045, 1, 1, 1, 1, 1,
-0.05239968, -0.03167996, -1.258442, 1, 1, 1, 1, 1,
-0.05231844, 0.4323486, -1.138737, 1, 1, 1, 1, 1,
-0.04895395, -1.491581, -5.404196, 1, 1, 1, 1, 1,
-0.04668908, 1.837129, 0.8496485, 1, 1, 1, 1, 1,
-0.04580786, -1.059703, -3.621538, 1, 1, 1, 1, 1,
-0.04298592, -1.435303, -4.024617, 1, 1, 1, 1, 1,
-0.04229791, 1.750913, 0.7871624, 1, 1, 1, 1, 1,
-0.04141433, -0.8921438, -2.831133, 1, 1, 1, 1, 1,
-0.03522478, 1.330129, 0.006302537, 1, 1, 1, 1, 1,
-0.03244901, -0.4520255, -3.794711, 1, 1, 1, 1, 1,
-0.03192638, -0.9165074, -3.079805, 1, 1, 1, 1, 1,
-0.02988919, -1.275879, -3.147553, 1, 1, 1, 1, 1,
-0.02896706, 0.1992656, -0.06288894, 1, 1, 1, 1, 1,
-0.01865711, -0.8138565, -3.228931, 0, 0, 1, 1, 1,
-0.01795622, 0.9542419, -0.1626388, 1, 0, 0, 1, 1,
-0.01740377, 0.8602975, 0.199552, 1, 0, 0, 1, 1,
-0.01622213, -0.9291165, -2.352782, 1, 0, 0, 1, 1,
-0.01557124, 0.8004305, 1.186635, 1, 0, 0, 1, 1,
-0.01346674, 0.4078882, 0.04651131, 1, 0, 0, 1, 1,
-0.008783476, -0.2620861, -3.539541, 0, 0, 0, 1, 1,
-0.002659833, -0.662619, -4.557438, 0, 0, 0, 1, 1,
-0.0006655612, 2.463576, -0.8646307, 0, 0, 0, 1, 1,
0.001714535, 0.6963986, -0.3079807, 0, 0, 0, 1, 1,
0.008774466, -2.015676, 2.383213, 0, 0, 0, 1, 1,
0.01537104, -0.2463965, 3.682951, 0, 0, 0, 1, 1,
0.01720671, 0.6475875, 1.755566, 0, 0, 0, 1, 1,
0.01764577, -0.6848175, 3.886485, 1, 1, 1, 1, 1,
0.02207489, 0.3609439, -1.053037, 1, 1, 1, 1, 1,
0.02321343, 0.6612414, -0.5107422, 1, 1, 1, 1, 1,
0.02649224, -0.7700911, 2.864579, 1, 1, 1, 1, 1,
0.02927379, 0.1625485, -0.1052796, 1, 1, 1, 1, 1,
0.03016877, 0.486844, 1.089421, 1, 1, 1, 1, 1,
0.03039444, -0.6741216, 4.354444, 1, 1, 1, 1, 1,
0.0337927, 0.8452094, -0.1426284, 1, 1, 1, 1, 1,
0.0364027, 0.6534219, -0.9166203, 1, 1, 1, 1, 1,
0.03704637, -1.568237, 3.22828, 1, 1, 1, 1, 1,
0.03930523, 1.495116, 0.4428127, 1, 1, 1, 1, 1,
0.04011164, -2.207632, 2.854166, 1, 1, 1, 1, 1,
0.04546717, -0.2430736, 1.945288, 1, 1, 1, 1, 1,
0.04854982, -0.521504, 5.52085, 1, 1, 1, 1, 1,
0.05165189, 1.072788, -1.057867, 1, 1, 1, 1, 1,
0.05374313, -0.07127351, 1.452711, 0, 0, 1, 1, 1,
0.05430682, 0.7712438, -0.4610295, 1, 0, 0, 1, 1,
0.05909218, -0.1238936, 4.210406, 1, 0, 0, 1, 1,
0.06608848, 1.453671, 0.1414281, 1, 0, 0, 1, 1,
0.06927275, 0.8677422, 0.07996984, 1, 0, 0, 1, 1,
0.07942142, 1.692568, -0.9517259, 1, 0, 0, 1, 1,
0.08044618, -1.019067, 4.278772, 0, 0, 0, 1, 1,
0.0838572, -0.8136382, 2.54526, 0, 0, 0, 1, 1,
0.08736846, 0.3475931, 1.435249, 0, 0, 0, 1, 1,
0.09076203, -0.3856183, 1.235037, 0, 0, 0, 1, 1,
0.09904984, 0.8704461, -1.712498, 0, 0, 0, 1, 1,
0.09956873, -1.346025, 3.488775, 0, 0, 0, 1, 1,
0.09994137, -0.8428686, 1.910856, 0, 0, 0, 1, 1,
0.1002434, 0.9668668, -0.9582828, 1, 1, 1, 1, 1,
0.1036234, -0.2293161, 2.018537, 1, 1, 1, 1, 1,
0.1040522, -0.3573594, 2.063519, 1, 1, 1, 1, 1,
0.1059299, 3.023689, 0.07567376, 1, 1, 1, 1, 1,
0.1065566, -2.143035, 1.679821, 1, 1, 1, 1, 1,
0.1066957, 0.3800418, 0.2750395, 1, 1, 1, 1, 1,
0.1148195, -0.3986615, 3.459855, 1, 1, 1, 1, 1,
0.1159037, 1.49222, 1.554107, 1, 1, 1, 1, 1,
0.1167896, 0.5744942, 1.822978, 1, 1, 1, 1, 1,
0.118559, 0.3105468, 1.991902, 1, 1, 1, 1, 1,
0.1248675, -1.745694, 1.55189, 1, 1, 1, 1, 1,
0.1259752, -1.620841, 3.483366, 1, 1, 1, 1, 1,
0.129227, -0.006053429, 1.875683, 1, 1, 1, 1, 1,
0.130464, 0.6845542, -1.955651, 1, 1, 1, 1, 1,
0.136578, 0.8845683, -0.3256676, 1, 1, 1, 1, 1,
0.1381876, 1.161204, 0.9260909, 0, 0, 1, 1, 1,
0.1395754, 0.371906, 1.260751, 1, 0, 0, 1, 1,
0.1399276, 0.1982595, -0.6149112, 1, 0, 0, 1, 1,
0.142078, 0.3981295, 1.296246, 1, 0, 0, 1, 1,
0.1437963, 0.3192464, 0.2437085, 1, 0, 0, 1, 1,
0.1459513, -1.313912, 4.970125, 1, 0, 0, 1, 1,
0.1536545, 0.181381, 1.047758, 0, 0, 0, 1, 1,
0.1551739, -1.478436, 3.324363, 0, 0, 0, 1, 1,
0.1555811, 0.1499149, 0.02164692, 0, 0, 0, 1, 1,
0.1626606, -1.252476, 0.9585567, 0, 0, 0, 1, 1,
0.1691961, -0.5044464, 2.811866, 0, 0, 0, 1, 1,
0.1741914, 1.813592, 1.988575, 0, 0, 0, 1, 1,
0.1744954, 0.8334516, -1.077771, 0, 0, 0, 1, 1,
0.1816543, 1.479744, 0.3548855, 1, 1, 1, 1, 1,
0.1859737, -0.9676057, 1.404259, 1, 1, 1, 1, 1,
0.1864406, 0.03526843, 1.192396, 1, 1, 1, 1, 1,
0.18864, -1.700245, 4.114404, 1, 1, 1, 1, 1,
0.1889367, 0.9095124, 0.5654227, 1, 1, 1, 1, 1,
0.1929169, -0.6162888, 2.688438, 1, 1, 1, 1, 1,
0.1970425, -0.2546903, 2.602582, 1, 1, 1, 1, 1,
0.2025939, 0.0866255, 1.684504, 1, 1, 1, 1, 1,
0.2038524, -1.101063, 2.329156, 1, 1, 1, 1, 1,
0.205312, -0.076489, 1.596797, 1, 1, 1, 1, 1,
0.208387, 0.9854853, 1.458392, 1, 1, 1, 1, 1,
0.2144871, 0.4287277, 0.7502108, 1, 1, 1, 1, 1,
0.2228939, 1.209283, -0.111486, 1, 1, 1, 1, 1,
0.2254822, 1.336738, 0.9394776, 1, 1, 1, 1, 1,
0.2278945, -0.8661551, 3.580601, 1, 1, 1, 1, 1,
0.2297116, -1.849316, 1.948798, 0, 0, 1, 1, 1,
0.2311812, 1.392131, -1.035744, 1, 0, 0, 1, 1,
0.2329185, -1.08905, 2.594697, 1, 0, 0, 1, 1,
0.2334354, -0.9101421, 3.608804, 1, 0, 0, 1, 1,
0.2343099, 0.4194267, 0.1873451, 1, 0, 0, 1, 1,
0.2354063, 0.4138342, 2.092275, 1, 0, 0, 1, 1,
0.2361731, -0.7599548, 3.668597, 0, 0, 0, 1, 1,
0.2376367, -0.5151101, 2.075538, 0, 0, 0, 1, 1,
0.23945, 0.1105152, 1.823124, 0, 0, 0, 1, 1,
0.2399887, 0.8655132, 1.010959, 0, 0, 0, 1, 1,
0.2403504, 1.203891, 0.8485241, 0, 0, 0, 1, 1,
0.2410672, -1.249132, 2.419076, 0, 0, 0, 1, 1,
0.2421532, 2.043969, 0.7880107, 0, 0, 0, 1, 1,
0.2472716, 0.6371813, 1.408988, 1, 1, 1, 1, 1,
0.252516, 1.346371, 0.5266889, 1, 1, 1, 1, 1,
0.2555626, 0.3903686, 0.2510118, 1, 1, 1, 1, 1,
0.2605681, -0.6581893, 2.613716, 1, 1, 1, 1, 1,
0.2608853, 0.03163279, 0.7519331, 1, 1, 1, 1, 1,
0.2623142, -0.7435467, 2.887051, 1, 1, 1, 1, 1,
0.2638516, -1.457634, 2.099149, 1, 1, 1, 1, 1,
0.2647592, -0.3037707, 3.337907, 1, 1, 1, 1, 1,
0.2682155, 0.2066502, -0.5279767, 1, 1, 1, 1, 1,
0.2690712, 1.322069, -0.7165459, 1, 1, 1, 1, 1,
0.2773667, -0.7329168, 3.477023, 1, 1, 1, 1, 1,
0.2777391, 1.200612, 0.1942176, 1, 1, 1, 1, 1,
0.2786627, -0.9382505, 2.806306, 1, 1, 1, 1, 1,
0.2853453, 1.753235, -0.2345308, 1, 1, 1, 1, 1,
0.2863929, -0.6943722, 2.812716, 1, 1, 1, 1, 1,
0.2888212, -1.306609, 3.702001, 0, 0, 1, 1, 1,
0.2920758, 0.5252797, 1.152154, 1, 0, 0, 1, 1,
0.2925368, -0.1849053, 0.9079947, 1, 0, 0, 1, 1,
0.2959246, -0.6131713, 3.118381, 1, 0, 0, 1, 1,
0.2969756, -0.6435523, 3.435655, 1, 0, 0, 1, 1,
0.2976886, 0.200066, -0.561666, 1, 0, 0, 1, 1,
0.2988738, -1.658855, 1.655124, 0, 0, 0, 1, 1,
0.2991257, -1.712329, 3.250868, 0, 0, 0, 1, 1,
0.3008338, 2.239432, 0.7150777, 0, 0, 0, 1, 1,
0.3009898, 2.295997, 1.219215, 0, 0, 0, 1, 1,
0.3046333, 0.2165367, 0.7101856, 0, 0, 0, 1, 1,
0.3085243, -0.1560565, 2.832963, 0, 0, 0, 1, 1,
0.3122496, -0.3506874, 1.870343, 0, 0, 0, 1, 1,
0.3134359, -2.191607, 2.528035, 1, 1, 1, 1, 1,
0.314978, -0.3352547, 2.579158, 1, 1, 1, 1, 1,
0.3149897, -0.6496701, 2.780138, 1, 1, 1, 1, 1,
0.3166476, -1.320003, 3.329853, 1, 1, 1, 1, 1,
0.316892, 1.290847, -1.090959, 1, 1, 1, 1, 1,
0.3175686, 0.1036434, 1.290619, 1, 1, 1, 1, 1,
0.3194687, -1.181815, 3.013528, 1, 1, 1, 1, 1,
0.3248557, -0.02545958, 1.235377, 1, 1, 1, 1, 1,
0.327675, 0.6283768, 1.086242, 1, 1, 1, 1, 1,
0.3287377, -0.5765486, 3.094355, 1, 1, 1, 1, 1,
0.3294207, 1.080193, 1.333213, 1, 1, 1, 1, 1,
0.3322975, 1.419784, 0.8290954, 1, 1, 1, 1, 1,
0.3340928, 0.633875, -0.5173338, 1, 1, 1, 1, 1,
0.3366018, 0.3067769, 1.19159, 1, 1, 1, 1, 1,
0.3372684, -1.538167, 3.36416, 1, 1, 1, 1, 1,
0.3373752, -0.8990729, 2.905545, 0, 0, 1, 1, 1,
0.3397468, 0.02347262, 0.6858754, 1, 0, 0, 1, 1,
0.3409295, 0.255518, 1.062855, 1, 0, 0, 1, 1,
0.3424254, 0.2957945, 0.4127149, 1, 0, 0, 1, 1,
0.3426844, -1.150349, 2.971124, 1, 0, 0, 1, 1,
0.3442606, 0.499271, -0.5755441, 1, 0, 0, 1, 1,
0.3442713, -1.494801, 2.213433, 0, 0, 0, 1, 1,
0.346788, 0.5212937, 1.685243, 0, 0, 0, 1, 1,
0.3477929, 1.256193, 0.8314478, 0, 0, 0, 1, 1,
0.34968, 0.1816172, 0.3305512, 0, 0, 0, 1, 1,
0.3554652, -0.3490588, 2.538473, 0, 0, 0, 1, 1,
0.3557754, -0.240917, 3.384749, 0, 0, 0, 1, 1,
0.35594, -0.7197939, 0.7554741, 0, 0, 0, 1, 1,
0.357228, 0.3618958, 2.684061, 1, 1, 1, 1, 1,
0.3574582, -0.4699129, 3.763521, 1, 1, 1, 1, 1,
0.3583983, -0.3359618, 3.092933, 1, 1, 1, 1, 1,
0.3593752, -0.3304708, 2.327292, 1, 1, 1, 1, 1,
0.3602322, -0.1830276, 2.763241, 1, 1, 1, 1, 1,
0.3623783, -0.1425854, 2.443854, 1, 1, 1, 1, 1,
0.3632741, -0.1189408, 2.151436, 1, 1, 1, 1, 1,
0.3721724, 0.9719915, -0.5811114, 1, 1, 1, 1, 1,
0.3748371, 1.593356, 0.5329511, 1, 1, 1, 1, 1,
0.3772256, 1.144797, -0.7012653, 1, 1, 1, 1, 1,
0.380055, 0.32869, 0.9185926, 1, 1, 1, 1, 1,
0.3816434, 0.1476205, 1.466619, 1, 1, 1, 1, 1,
0.3817684, -0.4763676, 2.573455, 1, 1, 1, 1, 1,
0.3877633, -0.6272042, 4.384243, 1, 1, 1, 1, 1,
0.3925559, 0.1222788, 1.928686, 1, 1, 1, 1, 1,
0.3959129, -0.7321275, 3.76534, 0, 0, 1, 1, 1,
0.3978022, 0.3673029, 2.466604, 1, 0, 0, 1, 1,
0.400254, -0.2569589, 1.262935, 1, 0, 0, 1, 1,
0.4068575, -0.8404002, 3.464057, 1, 0, 0, 1, 1,
0.4082002, -0.3235813, 2.467379, 1, 0, 0, 1, 1,
0.4108508, 0.1520057, 1.9381, 1, 0, 0, 1, 1,
0.4154005, 0.07375669, 2.226019, 0, 0, 0, 1, 1,
0.419073, -0.4793114, 1.66655, 0, 0, 0, 1, 1,
0.4192569, 2.698413, -0.397411, 0, 0, 0, 1, 1,
0.4214861, 1.514135, 0.4027026, 0, 0, 0, 1, 1,
0.4268332, -0.3856516, 0.5675994, 0, 0, 0, 1, 1,
0.4325919, 0.3233922, 1.519294, 0, 0, 0, 1, 1,
0.4366683, 0.439443, 1.954167, 0, 0, 0, 1, 1,
0.4397401, 0.9778874, -0.03105973, 1, 1, 1, 1, 1,
0.4487374, 0.9881167, -1.448674, 1, 1, 1, 1, 1,
0.4556028, -0.03098237, -0.07844602, 1, 1, 1, 1, 1,
0.4560314, 0.4632867, 0.8702091, 1, 1, 1, 1, 1,
0.4600754, -1.174089, 4.448459, 1, 1, 1, 1, 1,
0.4611101, 0.09472375, 3.005192, 1, 1, 1, 1, 1,
0.4638382, -0.2937032, 2.510787, 1, 1, 1, 1, 1,
0.4642215, -1.033664, 3.173084, 1, 1, 1, 1, 1,
0.4645529, -0.3821745, 1.611603, 1, 1, 1, 1, 1,
0.4647794, 1.132194, 0.06575407, 1, 1, 1, 1, 1,
0.4651213, 0.3566883, 1.728036, 1, 1, 1, 1, 1,
0.4692619, 0.5207227, -0.09267544, 1, 1, 1, 1, 1,
0.4725631, 1.874066, -0.8717428, 1, 1, 1, 1, 1,
0.4730054, 0.09028442, 1.065072, 1, 1, 1, 1, 1,
0.4735974, 0.2650013, 3.712237, 1, 1, 1, 1, 1,
0.4737239, -0.7280879, 2.911384, 0, 0, 1, 1, 1,
0.4757003, 0.08184091, 2.126252, 1, 0, 0, 1, 1,
0.4815343, -2.167638, 2.828532, 1, 0, 0, 1, 1,
0.4859632, -0.7903267, 2.585065, 1, 0, 0, 1, 1,
0.487918, 0.5922745, 0.5127941, 1, 0, 0, 1, 1,
0.4890152, -1.215908, 2.41962, 1, 0, 0, 1, 1,
0.4937096, 2.077658, -0.0490867, 0, 0, 0, 1, 1,
0.5175228, 0.9514151, 1.409312, 0, 0, 0, 1, 1,
0.5228977, 0.2817237, 1.708399, 0, 0, 0, 1, 1,
0.5281616, 2.687302, -1.280477, 0, 0, 0, 1, 1,
0.5363699, 1.108609, -1.437615, 0, 0, 0, 1, 1,
0.5367923, -0.9820741, 4.335685, 0, 0, 0, 1, 1,
0.5391504, 0.6958449, -0.4529411, 0, 0, 0, 1, 1,
0.539372, 0.02944931, 1.14899, 1, 1, 1, 1, 1,
0.5462828, 1.670189, 0.6596154, 1, 1, 1, 1, 1,
0.5485995, -2.299221, 4.296402, 1, 1, 1, 1, 1,
0.5502125, 0.5049105, 1.019705, 1, 1, 1, 1, 1,
0.5508747, -0.4002787, 4.080158, 1, 1, 1, 1, 1,
0.5534317, 0.6968349, 1.47771, 1, 1, 1, 1, 1,
0.5568647, 0.5968364, 1.701936, 1, 1, 1, 1, 1,
0.5612543, 1.061792, 1.05619, 1, 1, 1, 1, 1,
0.5647808, 0.272459, 1.711338, 1, 1, 1, 1, 1,
0.5648972, -0.06382681, 3.288611, 1, 1, 1, 1, 1,
0.5654796, 0.2241241, -0.4884933, 1, 1, 1, 1, 1,
0.5671535, -0.5516388, 2.747357, 1, 1, 1, 1, 1,
0.5704638, 1.629601, -0.2186089, 1, 1, 1, 1, 1,
0.574603, -0.5259706, 4.648125, 1, 1, 1, 1, 1,
0.5755243, 0.4526685, 1.091141, 1, 1, 1, 1, 1,
0.5789409, 0.3227418, 0.4738725, 0, 0, 1, 1, 1,
0.5796847, 1.872572, 1.968451, 1, 0, 0, 1, 1,
0.5854092, 0.1792322, 1.968886, 1, 0, 0, 1, 1,
0.5875573, -0.3250151, 0.6325082, 1, 0, 0, 1, 1,
0.5933484, 0.725529, 0.3403145, 1, 0, 0, 1, 1,
0.594805, 0.6754977, 0.1476321, 1, 0, 0, 1, 1,
0.600313, 1.25542, -1.419189, 0, 0, 0, 1, 1,
0.6017917, 1.266584, -1.491532, 0, 0, 0, 1, 1,
0.6017961, 0.5693084, 0.5509803, 0, 0, 0, 1, 1,
0.6065259, 1.320902, 1.539272, 0, 0, 0, 1, 1,
0.6101143, 1.549523, 0.6333138, 0, 0, 0, 1, 1,
0.6149743, -0.7394262, 0.7431484, 0, 0, 0, 1, 1,
0.6186848, 0.2674536, 3.122131, 0, 0, 0, 1, 1,
0.6237498, 1.206208, 1.444236, 1, 1, 1, 1, 1,
0.6238976, 0.09984937, 0.669997, 1, 1, 1, 1, 1,
0.6246157, 0.698201, 1.219301, 1, 1, 1, 1, 1,
0.6288313, -0.1788893, 3.825892, 1, 1, 1, 1, 1,
0.6324589, 0.3939173, 3.178279, 1, 1, 1, 1, 1,
0.6349638, 1.700807, 0.4807218, 1, 1, 1, 1, 1,
0.6349698, -0.06148962, 2.361961, 1, 1, 1, 1, 1,
0.6356246, 0.1864508, 1.635744, 1, 1, 1, 1, 1,
0.6428223, -0.6785374, 1.379837, 1, 1, 1, 1, 1,
0.6432486, 0.7952361, 1.078531, 1, 1, 1, 1, 1,
0.6455015, -0.5793914, 1.923622, 1, 1, 1, 1, 1,
0.6508607, 1.088743, 1.357908, 1, 1, 1, 1, 1,
0.6510209, -0.3062633, 0.9682741, 1, 1, 1, 1, 1,
0.6521114, 0.3904929, 1.783568, 1, 1, 1, 1, 1,
0.6523018, 0.2336741, 1.111228, 1, 1, 1, 1, 1,
0.6642181, 0.9846332, 2.883437, 0, 0, 1, 1, 1,
0.6670457, 0.4035437, 1.904491, 1, 0, 0, 1, 1,
0.6779559, -0.9976724, 3.407726, 1, 0, 0, 1, 1,
0.6794408, 2.612958, 0.2695824, 1, 0, 0, 1, 1,
0.6802819, -0.9947386, 2.109438, 1, 0, 0, 1, 1,
0.6825082, -1.328229, 4.460876, 1, 0, 0, 1, 1,
0.6842288, -0.3275916, 0.905169, 0, 0, 0, 1, 1,
0.6901522, -1.236152, 1.418885, 0, 0, 0, 1, 1,
0.6942646, -0.9633406, 2.977989, 0, 0, 0, 1, 1,
0.696425, 0.2100301, 1.690877, 0, 0, 0, 1, 1,
0.6980122, 1.323257, 0.794757, 0, 0, 0, 1, 1,
0.6997932, -0.2794539, 2.251947, 0, 0, 0, 1, 1,
0.7164826, -2.214659, 2.55391, 0, 0, 0, 1, 1,
0.7273936, 0.3346812, 0.2717626, 1, 1, 1, 1, 1,
0.7356963, 1.644258, 0.435871, 1, 1, 1, 1, 1,
0.741976, -0.5546287, 2.482132, 1, 1, 1, 1, 1,
0.7431233, -0.3723456, 1.540617, 1, 1, 1, 1, 1,
0.7510464, -1.458149, 2.47665, 1, 1, 1, 1, 1,
0.7543695, 1.97776, 1.461271, 1, 1, 1, 1, 1,
0.7576112, -0.3775292, 3.305275, 1, 1, 1, 1, 1,
0.7631198, 0.4425976, 1.629851, 1, 1, 1, 1, 1,
0.7730914, -1.02024, 2.347684, 1, 1, 1, 1, 1,
0.7760214, -0.007460365, 1.684739, 1, 1, 1, 1, 1,
0.7762951, 0.8521515, 0.2463188, 1, 1, 1, 1, 1,
0.7808859, -0.2285504, 3.359885, 1, 1, 1, 1, 1,
0.7845432, 0.9068776, 1.474259, 1, 1, 1, 1, 1,
0.7874691, -0.7302514, 2.140414, 1, 1, 1, 1, 1,
0.7875335, -0.028087, 0.7823254, 1, 1, 1, 1, 1,
0.789507, -1.869788, 0.8452403, 0, 0, 1, 1, 1,
0.7897192, -1.400237, 2.519135, 1, 0, 0, 1, 1,
0.805437, 0.1707273, 1.522618, 1, 0, 0, 1, 1,
0.8093871, -1.706614, 1.256466, 1, 0, 0, 1, 1,
0.8109311, -0.8543197, 2.425696, 1, 0, 0, 1, 1,
0.8116705, -0.03208391, 2.852368, 1, 0, 0, 1, 1,
0.821427, -0.5689125, 1.36021, 0, 0, 0, 1, 1,
0.823409, -0.7512677, 1.493707, 0, 0, 0, 1, 1,
0.8304923, -0.3237133, 3.013041, 0, 0, 0, 1, 1,
0.832638, -1.595022, 2.256166, 0, 0, 0, 1, 1,
0.8331037, -0.06351945, 1.599726, 0, 0, 0, 1, 1,
0.8403338, 0.04574114, 0.1992315, 0, 0, 0, 1, 1,
0.8414415, -0.08150209, -0.4135656, 0, 0, 0, 1, 1,
0.8426759, 0.859614, -0.2633542, 1, 1, 1, 1, 1,
0.8436734, 0.671263, 0.9795876, 1, 1, 1, 1, 1,
0.8442982, -1.083452, 3.08665, 1, 1, 1, 1, 1,
0.8528496, -0.07241018, 1.786987, 1, 1, 1, 1, 1,
0.8555121, -0.2632111, 0.8617931, 1, 1, 1, 1, 1,
0.8564698, -0.4000555, 1.193259, 1, 1, 1, 1, 1,
0.8567578, 0.621667, -0.0915049, 1, 1, 1, 1, 1,
0.8579826, 0.806307, 0.2990496, 1, 1, 1, 1, 1,
0.8652896, -0.2467512, 1.877329, 1, 1, 1, 1, 1,
0.8744341, 0.1330983, 1.396967, 1, 1, 1, 1, 1,
0.8754749, 0.4171287, 2.432599, 1, 1, 1, 1, 1,
0.8764792, -1.567706, 0.394931, 1, 1, 1, 1, 1,
0.87722, 0.1106719, 1.395021, 1, 1, 1, 1, 1,
0.878593, 1.879211, 0.6173434, 1, 1, 1, 1, 1,
0.8846012, -0.2952302, 1.564005, 1, 1, 1, 1, 1,
0.8945295, -1.824558, 0.8249418, 0, 0, 1, 1, 1,
0.8962618, -0.2199163, 2.954395, 1, 0, 0, 1, 1,
0.8979645, -1.148618, 3.310108, 1, 0, 0, 1, 1,
0.899913, 0.6184456, 1.298135, 1, 0, 0, 1, 1,
0.902844, -1.00457, 2.366564, 1, 0, 0, 1, 1,
0.909043, -0.3482168, 4.188489, 1, 0, 0, 1, 1,
0.9093291, 0.6162161, -0.5539334, 0, 0, 0, 1, 1,
0.9103658, 0.4751792, 2.076632, 0, 0, 0, 1, 1,
0.9172434, 0.1503295, 0.9669837, 0, 0, 0, 1, 1,
0.9225514, -0.2523664, 1.844764, 0, 0, 0, 1, 1,
0.9345084, -0.7473159, 3.27624, 0, 0, 0, 1, 1,
0.9413939, -0.241762, 1.860807, 0, 0, 0, 1, 1,
0.9439895, -0.4030713, 1.774104, 0, 0, 0, 1, 1,
0.951121, -1.308241, 1.42599, 1, 1, 1, 1, 1,
0.9550425, 1.105717, -0.2945353, 1, 1, 1, 1, 1,
0.9551834, -0.7717409, 0.5212617, 1, 1, 1, 1, 1,
0.9599823, -1.131085, 1.321, 1, 1, 1, 1, 1,
0.9634677, -0.7260967, 3.929672, 1, 1, 1, 1, 1,
0.9664099, 0.6939528, 2.582823, 1, 1, 1, 1, 1,
0.9688951, 0.09369706, 0.5753267, 1, 1, 1, 1, 1,
0.9695902, 0.4095888, 1.335744, 1, 1, 1, 1, 1,
0.9700938, -1.0043, 1.622126, 1, 1, 1, 1, 1,
0.9854724, -1.201912, 4.332077, 1, 1, 1, 1, 1,
0.9896156, -1.062321, 0.5392764, 1, 1, 1, 1, 1,
1.012303, -1.088544, 2.992644, 1, 1, 1, 1, 1,
1.016489, -1.029916, 2.504244, 1, 1, 1, 1, 1,
1.018983, -0.2949229, 0.4621262, 1, 1, 1, 1, 1,
1.019977, -2.088196, 3.404268, 1, 1, 1, 1, 1,
1.022498, 1.070224, 0.07287399, 0, 0, 1, 1, 1,
1.025842, 0.3258788, -0.5496901, 1, 0, 0, 1, 1,
1.03038, 0.4041964, 0.840528, 1, 0, 0, 1, 1,
1.044445, -0.5007083, 1.021103, 1, 0, 0, 1, 1,
1.054137, -0.8347699, 1.969425, 1, 0, 0, 1, 1,
1.05558, -0.3695832, 2.936786, 1, 0, 0, 1, 1,
1.056964, -1.204167, 4.483402, 0, 0, 0, 1, 1,
1.060481, -1.16417, 0.9286122, 0, 0, 0, 1, 1,
1.06132, -0.9646559, 1.842911, 0, 0, 0, 1, 1,
1.067584, 0.1555648, 0.3612247, 0, 0, 0, 1, 1,
1.068951, -0.8661378, -0.08104333, 0, 0, 0, 1, 1,
1.070574, 0.615808, 0.7987914, 0, 0, 0, 1, 1,
1.079943, -0.3045552, 1.785942, 0, 0, 0, 1, 1,
1.081942, -1.254692, 2.561171, 1, 1, 1, 1, 1,
1.083038, -0.5807312, 0.7977821, 1, 1, 1, 1, 1,
1.083573, 0.09221253, 0.6683988, 1, 1, 1, 1, 1,
1.087844, 0.4137697, 1.924088, 1, 1, 1, 1, 1,
1.08983, 1.240245, 2.145238, 1, 1, 1, 1, 1,
1.095211, -0.3502255, 1.554502, 1, 1, 1, 1, 1,
1.097499, -1.319047, 2.36129, 1, 1, 1, 1, 1,
1.100661, -0.7886971, 2.139899, 1, 1, 1, 1, 1,
1.101343, -0.7356817, 1.815526, 1, 1, 1, 1, 1,
1.106533, -1.139447, 3.336369, 1, 1, 1, 1, 1,
1.111821, 0.8786893, 0.9740853, 1, 1, 1, 1, 1,
1.113894, 1.512193, -0.2034567, 1, 1, 1, 1, 1,
1.115482, -0.2140308, 2.324346, 1, 1, 1, 1, 1,
1.118881, -0.4810941, 0.8525756, 1, 1, 1, 1, 1,
1.121401, 0.8749063, 0.8657284, 1, 1, 1, 1, 1,
1.124127, 0.5266839, 0.4107345, 0, 0, 1, 1, 1,
1.126774, 1.369398, -0.1931246, 1, 0, 0, 1, 1,
1.128513, -0.8143803, 3.007317, 1, 0, 0, 1, 1,
1.133763, -1.296115, 2.844688, 1, 0, 0, 1, 1,
1.145828, -0.3097191, 1.498491, 1, 0, 0, 1, 1,
1.148899, 0.5329647, 1.700396, 1, 0, 0, 1, 1,
1.150329, -0.4131523, 0.2419529, 0, 0, 0, 1, 1,
1.163389, -0.5298935, 3.937191, 0, 0, 0, 1, 1,
1.166632, -0.09190352, 1.42638, 0, 0, 0, 1, 1,
1.170907, -0.7924068, 2.021459, 0, 0, 0, 1, 1,
1.179278, 1.118065, 1.167499, 0, 0, 0, 1, 1,
1.181719, 0.3231193, -0.2931773, 0, 0, 0, 1, 1,
1.181872, -1.151558, 1.924897, 0, 0, 0, 1, 1,
1.185806, 0.0289228, 1.906185, 1, 1, 1, 1, 1,
1.192307, 0.3414372, 0.0795596, 1, 1, 1, 1, 1,
1.201326, 0.9242907, 1.09413, 1, 1, 1, 1, 1,
1.201627, 0.1819665, 0.4252453, 1, 1, 1, 1, 1,
1.20874, -0.2286194, 0.5802754, 1, 1, 1, 1, 1,
1.211006, -0.7466241, 2.014008, 1, 1, 1, 1, 1,
1.215855, -0.1267903, 1.243494, 1, 1, 1, 1, 1,
1.218687, 0.00503869, 1.929559, 1, 1, 1, 1, 1,
1.224551, 0.5050095, 1.091606, 1, 1, 1, 1, 1,
1.22748, 1.089659, 2.33189, 1, 1, 1, 1, 1,
1.231541, 0.8629173, 1.47886, 1, 1, 1, 1, 1,
1.231734, -2.018116, 2.880338, 1, 1, 1, 1, 1,
1.253595, -0.2265809, 2.501092, 1, 1, 1, 1, 1,
1.25847, -0.3813974, 0.4225329, 1, 1, 1, 1, 1,
1.269018, -0.03086616, 1.250222, 1, 1, 1, 1, 1,
1.272115, 1.305798, 0.2804012, 0, 0, 1, 1, 1,
1.274726, -0.3761774, 2.789557, 1, 0, 0, 1, 1,
1.276167, 0.188874, 0.7668727, 1, 0, 0, 1, 1,
1.277141, 0.3698255, 0.7420512, 1, 0, 0, 1, 1,
1.277953, 0.8197192, 1.757649, 1, 0, 0, 1, 1,
1.286384, 1.495596, 0.657568, 1, 0, 0, 1, 1,
1.29251, 0.7623313, 0.8087627, 0, 0, 0, 1, 1,
1.293641, -1.163863, 1.702756, 0, 0, 0, 1, 1,
1.296019, -0.04776351, 0.4568511, 0, 0, 0, 1, 1,
1.297919, 0.8441617, 0.6389282, 0, 0, 0, 1, 1,
1.307763, -0.2044198, 1.392788, 0, 0, 0, 1, 1,
1.320075, 1.15291, 1.090174, 0, 0, 0, 1, 1,
1.321294, -0.6154871, 2.169064, 0, 0, 0, 1, 1,
1.334972, -0.7387391, 1.84306, 1, 1, 1, 1, 1,
1.345626, 0.3759251, 1.456585, 1, 1, 1, 1, 1,
1.358761, 1.180316, 1.644142, 1, 1, 1, 1, 1,
1.36675, 0.3591477, 0.8694214, 1, 1, 1, 1, 1,
1.374957, 2.041112, -0.3366842, 1, 1, 1, 1, 1,
1.37707, 0.4112428, 1.116095, 1, 1, 1, 1, 1,
1.381786, 0.9514358, 0.7453438, 1, 1, 1, 1, 1,
1.390362, 0.2110985, 1.146913, 1, 1, 1, 1, 1,
1.412904, -0.4788953, 1.725166, 1, 1, 1, 1, 1,
1.424421, -0.3996311, 2.404522, 1, 1, 1, 1, 1,
1.453898, 0.6868101, 1.242893, 1, 1, 1, 1, 1,
1.483401, -1.793405, 2.411543, 1, 1, 1, 1, 1,
1.491991, 0.2168986, 2.238576, 1, 1, 1, 1, 1,
1.50218, 0.06753353, 2.252326, 1, 1, 1, 1, 1,
1.505054, -0.4484109, 2.6391, 1, 1, 1, 1, 1,
1.509276, -0.5388635, 3.050031, 0, 0, 1, 1, 1,
1.517569, -0.3851914, 1.34019, 1, 0, 0, 1, 1,
1.52299, -0.152321, 2.943753, 1, 0, 0, 1, 1,
1.52553, 0.3976065, 1.09542, 1, 0, 0, 1, 1,
1.529034, -2.81557, 2.93427, 1, 0, 0, 1, 1,
1.536638, -0.5784844, 1.269795, 1, 0, 0, 1, 1,
1.545262, 0.4591318, 0.3281175, 0, 0, 0, 1, 1,
1.556778, -0.251341, 0.5355481, 0, 0, 0, 1, 1,
1.557307, 0.4353282, 1.088053, 0, 0, 0, 1, 1,
1.562527, 0.08328427, 1.102606, 0, 0, 0, 1, 1,
1.565195, 1.220001, 0.3329441, 0, 0, 0, 1, 1,
1.568543, -0.4305414, 2.205061, 0, 0, 0, 1, 1,
1.572079, -0.2963272, 2.199215, 0, 0, 0, 1, 1,
1.618951, -1.581433, 2.62111, 1, 1, 1, 1, 1,
1.625968, -0.2751383, 1.450374, 1, 1, 1, 1, 1,
1.63827, -1.413615, 2.446187, 1, 1, 1, 1, 1,
1.641546, 1.456752, 2.734603, 1, 1, 1, 1, 1,
1.641796, -0.2669313, 3.336667, 1, 1, 1, 1, 1,
1.645868, -2.229364, 3.463189, 1, 1, 1, 1, 1,
1.65026, -0.02813142, 1.269852, 1, 1, 1, 1, 1,
1.660408, -0.05176457, 2.167798, 1, 1, 1, 1, 1,
1.665411, -1.403408, 3.103703, 1, 1, 1, 1, 1,
1.670898, 0.5083182, 0.7552985, 1, 1, 1, 1, 1,
1.675637, 1.127407, 0.9488635, 1, 1, 1, 1, 1,
1.694306, -0.5603452, 2.379864, 1, 1, 1, 1, 1,
1.696793, 0.9472651, 1.106582, 1, 1, 1, 1, 1,
1.705399, 0.5458306, 2.670361, 1, 1, 1, 1, 1,
1.710927, -1.177033, 1.180806, 1, 1, 1, 1, 1,
1.72524, -1.836926, 3.140557, 0, 0, 1, 1, 1,
1.745085, -0.2979366, 1.855682, 1, 0, 0, 1, 1,
1.754866, 0.8080972, 0.7523407, 1, 0, 0, 1, 1,
1.756522, 0.2055827, 2.693741, 1, 0, 0, 1, 1,
1.756938, -0.5540616, 2.237943, 1, 0, 0, 1, 1,
1.765938, 1.808293, -0.4525995, 1, 0, 0, 1, 1,
1.776974, -1.364187, 2.057556, 0, 0, 0, 1, 1,
1.777351, 0.5573483, 1.559708, 0, 0, 0, 1, 1,
1.784254, 0.3519584, 1.669313, 0, 0, 0, 1, 1,
1.80684, -0.1200116, -0.6865183, 0, 0, 0, 1, 1,
1.808687, -1.095902, 1.522283, 0, 0, 0, 1, 1,
1.81125, -0.8142304, 0.2981499, 0, 0, 0, 1, 1,
1.827353, 0.6680667, 2.211814, 0, 0, 0, 1, 1,
1.831632, 0.7976781, 0.8998805, 1, 1, 1, 1, 1,
1.837236, 0.01601392, 3.420463, 1, 1, 1, 1, 1,
1.841493, 0.8735628, 2.09221, 1, 1, 1, 1, 1,
1.84815, -0.1399243, 1.12324, 1, 1, 1, 1, 1,
1.877124, -0.4202225, 0.7378629, 1, 1, 1, 1, 1,
1.897799, 0.09978101, 1.751723, 1, 1, 1, 1, 1,
1.903633, 0.02882478, 0.9454349, 1, 1, 1, 1, 1,
1.932019, 1.581, 1.269346, 1, 1, 1, 1, 1,
1.94743, 0.6144549, 0.8266336, 1, 1, 1, 1, 1,
1.957423, -0.7629398, 1.943039, 1, 1, 1, 1, 1,
1.957732, -1.728211, 2.174213, 1, 1, 1, 1, 1,
1.974252, 0.5500699, 3.235795, 1, 1, 1, 1, 1,
1.983522, -0.4990993, 4.296328, 1, 1, 1, 1, 1,
2.0049, -0.3746866, 1.141297, 1, 1, 1, 1, 1,
2.023254, -0.8471706, 2.868539, 1, 1, 1, 1, 1,
2.024269, -2.017811, 3.127863, 0, 0, 1, 1, 1,
2.054642, 1.311457, 0.8356239, 1, 0, 0, 1, 1,
2.055718, 0.5616497, 0.3694159, 1, 0, 0, 1, 1,
2.062692, 0.7123983, 3.313728, 1, 0, 0, 1, 1,
2.063313, -0.167413, 0.3793903, 1, 0, 0, 1, 1,
2.098462, -0.7829591, 1.052105, 1, 0, 0, 1, 1,
2.099649, -1.559054, 0.8215441, 0, 0, 0, 1, 1,
2.148775, -0.4121981, 0.9467327, 0, 0, 0, 1, 1,
2.182087, -0.9619765, 0.4982435, 0, 0, 0, 1, 1,
2.193051, -1.909883, 3.292206, 0, 0, 0, 1, 1,
2.216185, 0.1482072, 0.2017269, 0, 0, 0, 1, 1,
2.257898, 0.9252953, 0.7924591, 0, 0, 0, 1, 1,
2.357508, 0.9051225, 1.650451, 0, 0, 0, 1, 1,
2.371186, -0.2536963, 2.841431, 1, 1, 1, 1, 1,
2.380223, -0.7574575, 2.513532, 1, 1, 1, 1, 1,
2.425845, -0.02959105, 2.623451, 1, 1, 1, 1, 1,
2.438965, 1.13437, 0.5530176, 1, 1, 1, 1, 1,
2.51233, -0.1901605, 1.007853, 1, 1, 1, 1, 1,
2.673717, 1.670014, 1.612917, 1, 1, 1, 1, 1,
3.043519, -0.2207521, 1.41082, 1, 1, 1, 1, 1
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
var radius = 9.596332;
var distance = 33.70671;
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
mvMatrix.translate( -0.08013356, 0.2930763, -0.05832696 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70671);
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
