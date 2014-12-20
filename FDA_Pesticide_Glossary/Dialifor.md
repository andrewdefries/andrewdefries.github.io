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
-3.571802, 1.278084, -2.143137, 1, 0, 0, 1,
-2.801689, 1.286211, 0.2285579, 1, 0.007843138, 0, 1,
-2.726281, 0.4933689, -0.8908572, 1, 0.01176471, 0, 1,
-2.597202, 0.4253609, -0.6975423, 1, 0.01960784, 0, 1,
-2.369081, -0.7325088, -3.422535, 1, 0.02352941, 0, 1,
-2.361405, 2.035265, -0.5092003, 1, 0.03137255, 0, 1,
-2.345603, 0.7206523, -2.39803, 1, 0.03529412, 0, 1,
-2.332891, 0.5240422, -2.298647, 1, 0.04313726, 0, 1,
-2.268737, 0.3409066, -2.158901, 1, 0.04705882, 0, 1,
-2.239996, 0.1536758, -1.518905, 1, 0.05490196, 0, 1,
-2.173209, 1.38187, -1.76694, 1, 0.05882353, 0, 1,
-2.107532, -0.6395477, -1.191182, 1, 0.06666667, 0, 1,
-2.065758, -0.2859367, -1.949823, 1, 0.07058824, 0, 1,
-2.057862, 1.708011, -0.1167251, 1, 0.07843138, 0, 1,
-2.050043, 0.4526084, -1.406218, 1, 0.08235294, 0, 1,
-2.048186, 0.2343175, 0.7347214, 1, 0.09019608, 0, 1,
-2.026456, -0.4095012, -3.376839, 1, 0.09411765, 0, 1,
-2.015636, 1.759033, -2.377984, 1, 0.1019608, 0, 1,
-1.993404, 0.2075415, -2.277974, 1, 0.1098039, 0, 1,
-1.915081, -0.932581, -2.542104, 1, 0.1137255, 0, 1,
-1.880459, 0.420518, -1.410875, 1, 0.1215686, 0, 1,
-1.858568, -0.05643838, -1.619655, 1, 0.1254902, 0, 1,
-1.825838, 0.2252347, -1.98326, 1, 0.1333333, 0, 1,
-1.825005, -0.02232829, -1.196445, 1, 0.1372549, 0, 1,
-1.814301, -1.368324, -1.995114, 1, 0.145098, 0, 1,
-1.808261, 0.7532356, -1.499394, 1, 0.1490196, 0, 1,
-1.803728, -0.2510485, -0.8201506, 1, 0.1568628, 0, 1,
-1.783745, 0.1728309, -1.090496, 1, 0.1607843, 0, 1,
-1.774587, -0.5475948, -2.453475, 1, 0.1686275, 0, 1,
-1.768864, 0.8576911, -0.4898469, 1, 0.172549, 0, 1,
-1.736866, -1.311872, -1.646474, 1, 0.1803922, 0, 1,
-1.711665, -1.046683, -0.8881252, 1, 0.1843137, 0, 1,
-1.711592, -0.5636182, -2.008658, 1, 0.1921569, 0, 1,
-1.700106, 0.486866, -1.305653, 1, 0.1960784, 0, 1,
-1.690029, 0.6524261, -1.098787, 1, 0.2039216, 0, 1,
-1.6627, 0.1980034, -1.017158, 1, 0.2117647, 0, 1,
-1.660012, 0.01994666, -2.042586, 1, 0.2156863, 0, 1,
-1.649229, 0.5760491, -2.244101, 1, 0.2235294, 0, 1,
-1.640454, -0.006233487, -0.648132, 1, 0.227451, 0, 1,
-1.639707, 0.08037236, -4.75625, 1, 0.2352941, 0, 1,
-1.626899, 0.2699714, -0.6325303, 1, 0.2392157, 0, 1,
-1.622622, -0.1750179, -0.8240992, 1, 0.2470588, 0, 1,
-1.618648, -0.4892018, -1.693117, 1, 0.2509804, 0, 1,
-1.615654, -1.371486, -2.297222, 1, 0.2588235, 0, 1,
-1.611858, 0.6577858, -0.5433966, 1, 0.2627451, 0, 1,
-1.609233, 0.5754349, -0.6809209, 1, 0.2705882, 0, 1,
-1.604498, 0.04236843, -2.339378, 1, 0.2745098, 0, 1,
-1.597896, 1.253487, -1.424508, 1, 0.282353, 0, 1,
-1.595051, 0.3926772, -1.188847, 1, 0.2862745, 0, 1,
-1.593986, -1.256422, -0.2903634, 1, 0.2941177, 0, 1,
-1.58749, 0.1656926, -1.663573, 1, 0.3019608, 0, 1,
-1.583527, -2.284119, -3.85708, 1, 0.3058824, 0, 1,
-1.573115, 0.693491, -1.973881, 1, 0.3137255, 0, 1,
-1.567143, -1.039986, -1.581424, 1, 0.3176471, 0, 1,
-1.559598, 1.248223, -0.3055366, 1, 0.3254902, 0, 1,
-1.529342, 1.48103, -0.2196572, 1, 0.3294118, 0, 1,
-1.528734, 0.8948134, 0.2828378, 1, 0.3372549, 0, 1,
-1.527401, 0.5665478, -1.579188, 1, 0.3411765, 0, 1,
-1.515988, 0.5768701, -1.341576, 1, 0.3490196, 0, 1,
-1.512936, -0.3508833, -1.672573, 1, 0.3529412, 0, 1,
-1.507314, -1.154048, -2.749527, 1, 0.3607843, 0, 1,
-1.505894, 0.4040877, -2.054494, 1, 0.3647059, 0, 1,
-1.484601, 2.009009, -0.9192261, 1, 0.372549, 0, 1,
-1.48194, 0.6840851, -0.5734255, 1, 0.3764706, 0, 1,
-1.472134, 2.007713, 0.6156551, 1, 0.3843137, 0, 1,
-1.468544, 0.6764364, -2.815965, 1, 0.3882353, 0, 1,
-1.465333, -0.05354221, -1.224011, 1, 0.3960784, 0, 1,
-1.464986, 1.153896, 0.272772, 1, 0.4039216, 0, 1,
-1.455109, 0.04808414, -1.066658, 1, 0.4078431, 0, 1,
-1.431262, -0.3100495, -3.175518, 1, 0.4156863, 0, 1,
-1.420412, -0.5215612, 0.1285583, 1, 0.4196078, 0, 1,
-1.409148, 0.2650051, 0.0004695373, 1, 0.427451, 0, 1,
-1.404044, -1.130915, -1.805889, 1, 0.4313726, 0, 1,
-1.397072, -0.45414, -0.2899031, 1, 0.4392157, 0, 1,
-1.397008, 0.3977801, -0.6930234, 1, 0.4431373, 0, 1,
-1.38111, -0.5740788, -2.450126, 1, 0.4509804, 0, 1,
-1.374531, -1.11025, -0.4933414, 1, 0.454902, 0, 1,
-1.371515, -1.310499, -1.858692, 1, 0.4627451, 0, 1,
-1.369292, 1.466232, 0.2453882, 1, 0.4666667, 0, 1,
-1.368544, 0.4584708, -1.651332, 1, 0.4745098, 0, 1,
-1.364256, 0.04752981, -2.759648, 1, 0.4784314, 0, 1,
-1.355743, 0.523945, -2.759852, 1, 0.4862745, 0, 1,
-1.339666, -1.789057, -2.073191, 1, 0.4901961, 0, 1,
-1.325575, -1.433019, -3.859298, 1, 0.4980392, 0, 1,
-1.32056, -0.7548614, -0.3894674, 1, 0.5058824, 0, 1,
-1.307337, -0.5951799, -2.443081, 1, 0.509804, 0, 1,
-1.301687, 0.3979743, -2.556307, 1, 0.5176471, 0, 1,
-1.297558, 1.10932, -1.472056, 1, 0.5215687, 0, 1,
-1.286476, -0.4608502, -2.33883, 1, 0.5294118, 0, 1,
-1.283424, -0.7320407, -3.52894, 1, 0.5333334, 0, 1,
-1.278445, -0.5188341, -1.816714, 1, 0.5411765, 0, 1,
-1.276148, 1.343073, -1.632876, 1, 0.5450981, 0, 1,
-1.274198, -0.9908624, -1.910997, 1, 0.5529412, 0, 1,
-1.262887, -2.139235, -0.7916616, 1, 0.5568628, 0, 1,
-1.261178, 0.01201067, -1.156041, 1, 0.5647059, 0, 1,
-1.258688, 0.06952845, -3.694086, 1, 0.5686275, 0, 1,
-1.257719, 0.2353025, -0.5145201, 1, 0.5764706, 0, 1,
-1.256969, -0.1866323, -0.9757758, 1, 0.5803922, 0, 1,
-1.254678, -0.06228638, -0.09947628, 1, 0.5882353, 0, 1,
-1.253735, 1.297188, -1.918951, 1, 0.5921569, 0, 1,
-1.249398, -0.4479187, -0.9641578, 1, 0.6, 0, 1,
-1.244395, 1.371545, 1.546924, 1, 0.6078432, 0, 1,
-1.229532, 1.523436, 0.3818659, 1, 0.6117647, 0, 1,
-1.22732, 0.1329749, -2.271005, 1, 0.6196079, 0, 1,
-1.227138, 2.104505, 0.5242646, 1, 0.6235294, 0, 1,
-1.216015, -1.582152, -3.261626, 1, 0.6313726, 0, 1,
-1.210474, -0.3964408, -2.104057, 1, 0.6352941, 0, 1,
-1.20395, -0.2146868, -3.075543, 1, 0.6431373, 0, 1,
-1.203194, 0.4963741, -0.9484714, 1, 0.6470588, 0, 1,
-1.202608, 2.341289, -0.09080315, 1, 0.654902, 0, 1,
-1.185993, 0.6811903, -1.950584, 1, 0.6588235, 0, 1,
-1.184122, 0.4552604, -1.618267, 1, 0.6666667, 0, 1,
-1.18301, 1.660008, -1.904948, 1, 0.6705883, 0, 1,
-1.180986, -1.417658, -1.069203, 1, 0.6784314, 0, 1,
-1.173312, 1.330281, 1.109986, 1, 0.682353, 0, 1,
-1.170753, -0.07196068, -0.9522315, 1, 0.6901961, 0, 1,
-1.169135, 0.5266204, -1.515454, 1, 0.6941177, 0, 1,
-1.162963, -1.454227, -2.919385, 1, 0.7019608, 0, 1,
-1.162224, -0.1492569, -0.8194651, 1, 0.7098039, 0, 1,
-1.158715, 1.171473, -1.816797, 1, 0.7137255, 0, 1,
-1.156498, -0.04251671, -2.784251, 1, 0.7215686, 0, 1,
-1.155475, -0.6435352, -2.105023, 1, 0.7254902, 0, 1,
-1.154755, -0.3521658, -1.071284, 1, 0.7333333, 0, 1,
-1.144139, 0.801846, -1.509307, 1, 0.7372549, 0, 1,
-1.143787, 1.071824, -0.4977219, 1, 0.7450981, 0, 1,
-1.142871, 0.6536315, -1.550608, 1, 0.7490196, 0, 1,
-1.138753, 1.196347, -1.658452, 1, 0.7568628, 0, 1,
-1.134199, 0.1072925, -0.804283, 1, 0.7607843, 0, 1,
-1.124175, -1.148211, -1.57565, 1, 0.7686275, 0, 1,
-1.121, -0.2177899, -2.865897, 1, 0.772549, 0, 1,
-1.114831, -0.45561, -1.523707, 1, 0.7803922, 0, 1,
-1.114725, 0.6698432, -0.8367041, 1, 0.7843137, 0, 1,
-1.112561, -0.003879652, 0.3153523, 1, 0.7921569, 0, 1,
-1.108796, 0.8834274, -0.8594318, 1, 0.7960784, 0, 1,
-1.107311, 0.3359745, -0.4379108, 1, 0.8039216, 0, 1,
-1.09305, 0.3921878, 0.4788669, 1, 0.8117647, 0, 1,
-1.092167, 2.245468, -0.8249354, 1, 0.8156863, 0, 1,
-1.088093, -0.1429492, -3.918618, 1, 0.8235294, 0, 1,
-1.086599, 0.3578068, -0.701075, 1, 0.827451, 0, 1,
-1.085991, 1.6065, -1.262773, 1, 0.8352941, 0, 1,
-1.081713, 1.250747, 0.3080477, 1, 0.8392157, 0, 1,
-1.081534, -0.1624913, -0.6484299, 1, 0.8470588, 0, 1,
-1.078457, -0.2357018, -0.80231, 1, 0.8509804, 0, 1,
-1.073647, 1.033109, -1.448285, 1, 0.8588235, 0, 1,
-1.067098, 1.180099, -3.278752, 1, 0.8627451, 0, 1,
-1.061429, -0.4243649, -1.85535, 1, 0.8705882, 0, 1,
-1.060094, -1.188619, -1.196483, 1, 0.8745098, 0, 1,
-1.052577, 0.7123968, 0.9480822, 1, 0.8823529, 0, 1,
-1.051214, 1.387525, -1.586302, 1, 0.8862745, 0, 1,
-1.047241, -0.9155465, -1.058873, 1, 0.8941177, 0, 1,
-1.028252, 0.3885136, -1.542098, 1, 0.8980392, 0, 1,
-1.025536, -0.8495276, -3.397545, 1, 0.9058824, 0, 1,
-1.024485, -0.49255, -0.9089921, 1, 0.9137255, 0, 1,
-1.0215, 0.1674863, -1.124264, 1, 0.9176471, 0, 1,
-1.017754, -0.5659498, -0.139901, 1, 0.9254902, 0, 1,
-1.014884, -2.48475, -1.663915, 1, 0.9294118, 0, 1,
-1.013389, -0.7768244, -2.072878, 1, 0.9372549, 0, 1,
-1.012137, -0.2768192, -2.482104, 1, 0.9411765, 0, 1,
-1.005986, -0.1399258, -1.976547, 1, 0.9490196, 0, 1,
-1.005538, 0.6392503, -1.228074, 1, 0.9529412, 0, 1,
-1.002501, 0.1378689, -0.4135778, 1, 0.9607843, 0, 1,
-0.9967496, 1.433582, -0.7395895, 1, 0.9647059, 0, 1,
-0.9944316, -0.3270702, -1.769528, 1, 0.972549, 0, 1,
-0.9920716, 0.6815861, -1.215037, 1, 0.9764706, 0, 1,
-0.986087, 0.376948, -0.5848314, 1, 0.9843137, 0, 1,
-0.9781539, -1.438035, -4.288571, 1, 0.9882353, 0, 1,
-0.9698691, -0.00709626, -0.8823711, 1, 0.9960784, 0, 1,
-0.9683349, 0.4168907, -1.687548, 0.9960784, 1, 0, 1,
-0.967416, -0.8448381, -1.701506, 0.9921569, 1, 0, 1,
-0.9673179, -0.3132208, -1.691253, 0.9843137, 1, 0, 1,
-0.9644867, -0.9263241, -1.858887, 0.9803922, 1, 0, 1,
-0.9601167, 0.7330623, -1.674101, 0.972549, 1, 0, 1,
-0.9572346, -0.2778242, -1.345671, 0.9686275, 1, 0, 1,
-0.9507551, 0.3123521, -2.84049, 0.9607843, 1, 0, 1,
-0.9482334, -1.007403, -2.72184, 0.9568627, 1, 0, 1,
-0.9385735, 0.6693702, -0.6175792, 0.9490196, 1, 0, 1,
-0.9344977, 1.410282, -0.5938036, 0.945098, 1, 0, 1,
-0.9327894, -0.977479, -3.435395, 0.9372549, 1, 0, 1,
-0.9277785, -0.2010294, -2.049866, 0.9333333, 1, 0, 1,
-0.9266268, 2.485442, 1.557732, 0.9254902, 1, 0, 1,
-0.9238958, 0.2345488, -0.790288, 0.9215686, 1, 0, 1,
-0.9136829, -1.173377, -2.385542, 0.9137255, 1, 0, 1,
-0.9118938, -0.2973914, -2.940476, 0.9098039, 1, 0, 1,
-0.9075531, -0.2763038, -2.417458, 0.9019608, 1, 0, 1,
-0.90561, 1.610672, 0.7631006, 0.8941177, 1, 0, 1,
-0.8954825, -0.2942076, -1.988127, 0.8901961, 1, 0, 1,
-0.8902883, -0.1154627, -1.326698, 0.8823529, 1, 0, 1,
-0.8854941, -0.4430291, -3.376678, 0.8784314, 1, 0, 1,
-0.8776625, 0.3493792, -1.184934, 0.8705882, 1, 0, 1,
-0.8756459, 0.7233177, -0.3399099, 0.8666667, 1, 0, 1,
-0.8681641, 0.6695206, -0.9793943, 0.8588235, 1, 0, 1,
-0.8668624, -0.6864463, -1.662297, 0.854902, 1, 0, 1,
-0.8668223, 0.7984555, -1.096751, 0.8470588, 1, 0, 1,
-0.8596136, 0.5149935, -1.243044, 0.8431373, 1, 0, 1,
-0.8590494, -0.5643158, -3.392205, 0.8352941, 1, 0, 1,
-0.8589767, -0.5560748, -2.550213, 0.8313726, 1, 0, 1,
-0.8536365, -1.230951, -3.996837, 0.8235294, 1, 0, 1,
-0.846144, 0.710756, -2.845007, 0.8196079, 1, 0, 1,
-0.8412365, 0.2165527, -0.910611, 0.8117647, 1, 0, 1,
-0.841177, -1.109479, -2.128116, 0.8078431, 1, 0, 1,
-0.8277932, -0.1412071, -2.329741, 0.8, 1, 0, 1,
-0.8277377, 0.211758, -0.08994938, 0.7921569, 1, 0, 1,
-0.8243227, 0.1964809, -0.9696249, 0.7882353, 1, 0, 1,
-0.8229792, -1.761797, -1.926597, 0.7803922, 1, 0, 1,
-0.821809, 0.2876438, -2.525583, 0.7764706, 1, 0, 1,
-0.8217354, 0.4136532, -1.984714, 0.7686275, 1, 0, 1,
-0.8113804, -0.7784653, -2.223308, 0.7647059, 1, 0, 1,
-0.8099905, -0.8456221, -2.263721, 0.7568628, 1, 0, 1,
-0.8097381, 0.1426415, -1.378439, 0.7529412, 1, 0, 1,
-0.8081085, -0.7272189, -3.641334, 0.7450981, 1, 0, 1,
-0.8069917, 1.556332, -2.010865, 0.7411765, 1, 0, 1,
-0.8045991, 0.2366367, -2.078252, 0.7333333, 1, 0, 1,
-0.8008448, 1.422033, -1.556191, 0.7294118, 1, 0, 1,
-0.7982218, -1.143322, -1.312092, 0.7215686, 1, 0, 1,
-0.7967896, 1.660324, -1.429444, 0.7176471, 1, 0, 1,
-0.7941234, -0.7752569, -2.005698, 0.7098039, 1, 0, 1,
-0.7903661, -0.6251748, -1.805712, 0.7058824, 1, 0, 1,
-0.7856826, 1.127512, -2.489912, 0.6980392, 1, 0, 1,
-0.7783467, 0.444288, -0.3506679, 0.6901961, 1, 0, 1,
-0.7708841, 1.619085, 0.9225571, 0.6862745, 1, 0, 1,
-0.7671012, 0.5299335, -2.681587, 0.6784314, 1, 0, 1,
-0.7658477, 1.462828, 3.329296, 0.6745098, 1, 0, 1,
-0.7648724, -1.004539, -1.682982, 0.6666667, 1, 0, 1,
-0.7623374, -0.6411369, -1.17769, 0.6627451, 1, 0, 1,
-0.7606652, 0.8115467, 0.5582541, 0.654902, 1, 0, 1,
-0.7573149, -0.2265615, -2.576484, 0.6509804, 1, 0, 1,
-0.7490218, -0.240497, -1.152515, 0.6431373, 1, 0, 1,
-0.7368687, -1.662126, -1.392164, 0.6392157, 1, 0, 1,
-0.7365139, 2.045005, -0.8724307, 0.6313726, 1, 0, 1,
-0.7278644, -0.6846595, -3.43194, 0.627451, 1, 0, 1,
-0.7276051, -0.4939126, -2.69641, 0.6196079, 1, 0, 1,
-0.7248024, 1.003018, -1.215614, 0.6156863, 1, 0, 1,
-0.7234362, -1.007562, -1.238784, 0.6078432, 1, 0, 1,
-0.7220721, -0.4253016, -1.314525, 0.6039216, 1, 0, 1,
-0.7189285, 0.6903725, -2.672048, 0.5960785, 1, 0, 1,
-0.7176608, 0.08715027, -2.41504, 0.5882353, 1, 0, 1,
-0.7169302, 0.8969701, 0.701267, 0.5843138, 1, 0, 1,
-0.7158919, 0.5504397, -1.201108, 0.5764706, 1, 0, 1,
-0.7085061, 0.1547357, -2.239585, 0.572549, 1, 0, 1,
-0.7046105, -2.39887, -3.717038, 0.5647059, 1, 0, 1,
-0.7034975, 1.532363, 0.05252638, 0.5607843, 1, 0, 1,
-0.701552, 1.199639, -0.03875179, 0.5529412, 1, 0, 1,
-0.7005094, -1.233702, -3.681117, 0.5490196, 1, 0, 1,
-0.7002886, -0.4602623, -2.465743, 0.5411765, 1, 0, 1,
-0.6971464, -0.935677, -2.12934, 0.5372549, 1, 0, 1,
-0.6936457, 1.413462, -1.641933, 0.5294118, 1, 0, 1,
-0.6906706, 0.8669535, 1.47573, 0.5254902, 1, 0, 1,
-0.6804153, -1.030758, -2.545349, 0.5176471, 1, 0, 1,
-0.6802426, 0.2473401, -1.151084, 0.5137255, 1, 0, 1,
-0.6775009, 0.4650908, -1.638251, 0.5058824, 1, 0, 1,
-0.6762853, 2.149216, -0.4831229, 0.5019608, 1, 0, 1,
-0.6759741, 0.726823, -1.176066, 0.4941176, 1, 0, 1,
-0.674578, -1.013005, -1.040802, 0.4862745, 1, 0, 1,
-0.6678615, -0.5407044, -1.263946, 0.4823529, 1, 0, 1,
-0.6619948, -0.01548622, -1.930773, 0.4745098, 1, 0, 1,
-0.6613991, -0.03600281, -1.066007, 0.4705882, 1, 0, 1,
-0.6613622, 1.196871, -1.50343, 0.4627451, 1, 0, 1,
-0.6604731, -0.3607912, -1.853728, 0.4588235, 1, 0, 1,
-0.6598784, 0.00679796, -1.060601, 0.4509804, 1, 0, 1,
-0.6591107, 2.034581, 1.107446, 0.4470588, 1, 0, 1,
-0.6575025, 0.8812325, 0.1244372, 0.4392157, 1, 0, 1,
-0.6536211, -0.3358361, 0.3477078, 0.4352941, 1, 0, 1,
-0.6510796, -1.740533, -0.70296, 0.427451, 1, 0, 1,
-0.6497114, 0.4747893, 0.1370954, 0.4235294, 1, 0, 1,
-0.6495931, -0.3952926, -3.798193, 0.4156863, 1, 0, 1,
-0.6463282, -1.882824, -2.63426, 0.4117647, 1, 0, 1,
-0.6454937, -0.8973439, -2.156239, 0.4039216, 1, 0, 1,
-0.6454114, 1.236515, -1.067964, 0.3960784, 1, 0, 1,
-0.6445374, -1.777636, -2.004797, 0.3921569, 1, 0, 1,
-0.6444675, -0.5623097, -2.756517, 0.3843137, 1, 0, 1,
-0.6420782, 1.411152, 0.3035972, 0.3803922, 1, 0, 1,
-0.6415628, -1.980138, -3.625108, 0.372549, 1, 0, 1,
-0.6352465, 1.016631, 0.2062691, 0.3686275, 1, 0, 1,
-0.6185051, 0.5226225, 1.054005, 0.3607843, 1, 0, 1,
-0.6126212, -0.5356172, -2.08551, 0.3568628, 1, 0, 1,
-0.6104803, -1.584529, -5.170882, 0.3490196, 1, 0, 1,
-0.5998908, 0.5122746, -1.779784, 0.345098, 1, 0, 1,
-0.5975409, 0.0579863, -1.38142, 0.3372549, 1, 0, 1,
-0.59703, -0.08496014, -1.710535, 0.3333333, 1, 0, 1,
-0.5967669, 0.3334096, -0.4642215, 0.3254902, 1, 0, 1,
-0.594865, 1.313633, -0.5513746, 0.3215686, 1, 0, 1,
-0.5884815, -0.5707223, -3.455396, 0.3137255, 1, 0, 1,
-0.5816377, 0.6279281, -0.7914461, 0.3098039, 1, 0, 1,
-0.5791641, -0.5099423, -3.87649, 0.3019608, 1, 0, 1,
-0.5724875, -0.4042891, -2.100147, 0.2941177, 1, 0, 1,
-0.5720733, -0.8659212, -2.707933, 0.2901961, 1, 0, 1,
-0.568163, -1.070365, -2.559281, 0.282353, 1, 0, 1,
-0.5558075, -1.231465, -2.383463, 0.2784314, 1, 0, 1,
-0.5493471, 1.235304, 0.5797929, 0.2705882, 1, 0, 1,
-0.5473754, -0.3776262, -2.455899, 0.2666667, 1, 0, 1,
-0.547313, -0.8390361, -1.51943, 0.2588235, 1, 0, 1,
-0.5418894, 0.8610348, -0.916712, 0.254902, 1, 0, 1,
-0.5390212, -0.9983528, -3.059318, 0.2470588, 1, 0, 1,
-0.5371248, 0.4194673, -1.74536, 0.2431373, 1, 0, 1,
-0.5308938, 0.154216, -2.587613, 0.2352941, 1, 0, 1,
-0.5296635, -0.1237867, -3.623739, 0.2313726, 1, 0, 1,
-0.5282207, 1.392379, -0.481197, 0.2235294, 1, 0, 1,
-0.5201104, 1.76465, 0.9202984, 0.2196078, 1, 0, 1,
-0.5198606, 1.88273, -2.055447, 0.2117647, 1, 0, 1,
-0.5173098, -0.0483943, -0.6047865, 0.2078431, 1, 0, 1,
-0.5166605, -0.1324786, -2.317732, 0.2, 1, 0, 1,
-0.5129152, 0.7866954, -1.053642, 0.1921569, 1, 0, 1,
-0.5116362, -0.06841777, -2.721615, 0.1882353, 1, 0, 1,
-0.5071598, 0.6419834, 1.700068, 0.1803922, 1, 0, 1,
-0.5061216, -0.5178584, -1.353484, 0.1764706, 1, 0, 1,
-0.5028365, -0.07844079, -1.886228, 0.1686275, 1, 0, 1,
-0.5024549, 0.2423075, -1.497684, 0.1647059, 1, 0, 1,
-0.4939473, 1.153163, -0.8984053, 0.1568628, 1, 0, 1,
-0.4917097, 0.9088363, 0.4273726, 0.1529412, 1, 0, 1,
-0.4906557, -0.5444056, -1.536587, 0.145098, 1, 0, 1,
-0.4877274, -0.7323, 0.03645556, 0.1411765, 1, 0, 1,
-0.4854862, 0.4805843, -0.2844939, 0.1333333, 1, 0, 1,
-0.4840084, -0.2262152, -1.721625, 0.1294118, 1, 0, 1,
-0.4830785, -0.07028452, -2.412791, 0.1215686, 1, 0, 1,
-0.4809593, 0.4506129, 0.05555601, 0.1176471, 1, 0, 1,
-0.4800963, -0.3864643, -2.696998, 0.1098039, 1, 0, 1,
-0.4799041, 0.8469409, 0.2082674, 0.1058824, 1, 0, 1,
-0.4773113, 0.1098688, -0.4148925, 0.09803922, 1, 0, 1,
-0.4664723, -1.01435, -3.643728, 0.09019608, 1, 0, 1,
-0.4657024, -0.8469939, -4.621614, 0.08627451, 1, 0, 1,
-0.4649527, -0.8141691, -2.0122, 0.07843138, 1, 0, 1,
-0.45951, 1.216962, -0.4063033, 0.07450981, 1, 0, 1,
-0.4576828, 0.3480234, -1.278712, 0.06666667, 1, 0, 1,
-0.4547394, -0.08338121, -1.275539, 0.0627451, 1, 0, 1,
-0.4525889, -0.3269101, -3.589266, 0.05490196, 1, 0, 1,
-0.4506818, 0.8305373, -0.4021842, 0.05098039, 1, 0, 1,
-0.4505617, -0.1162556, -1.928859, 0.04313726, 1, 0, 1,
-0.4487711, 0.3754409, -1.154396, 0.03921569, 1, 0, 1,
-0.4464755, 1.149654, 0.1449293, 0.03137255, 1, 0, 1,
-0.4442269, 1.012237, 0.03715082, 0.02745098, 1, 0, 1,
-0.4439452, -0.3060737, -1.26653, 0.01960784, 1, 0, 1,
-0.441871, 0.5192802, -0.8442872, 0.01568628, 1, 0, 1,
-0.4418496, 0.6043193, -1.171685, 0.007843138, 1, 0, 1,
-0.4414322, 1.460729, -0.2256645, 0.003921569, 1, 0, 1,
-0.4413749, -0.4158889, -1.754021, 0, 1, 0.003921569, 1,
-0.4358989, -1.570854, -1.540249, 0, 1, 0.01176471, 1,
-0.4266957, 0.9475026, -1.246458, 0, 1, 0.01568628, 1,
-0.4250878, 1.790349, 2.521322, 0, 1, 0.02352941, 1,
-0.4228301, 0.6389163, -1.371202, 0, 1, 0.02745098, 1,
-0.4200657, 0.6091126, -2.251601, 0, 1, 0.03529412, 1,
-0.4177794, -0.7264609, -2.564147, 0, 1, 0.03921569, 1,
-0.4129445, -1.02427, -3.768744, 0, 1, 0.04705882, 1,
-0.4097041, 1.447021, 0.8441384, 0, 1, 0.05098039, 1,
-0.4058264, 0.3307469, -0.5753607, 0, 1, 0.05882353, 1,
-0.4058002, -1.365596, -1.916472, 0, 1, 0.0627451, 1,
-0.4023978, -0.9856321, -3.282774, 0, 1, 0.07058824, 1,
-0.3996711, -1.088283, -2.146492, 0, 1, 0.07450981, 1,
-0.3942417, 0.6964974, -1.17312, 0, 1, 0.08235294, 1,
-0.3927885, 0.7611687, -1.150652, 0, 1, 0.08627451, 1,
-0.3911806, 1.201221, -0.6687338, 0, 1, 0.09411765, 1,
-0.3902677, -0.1646905, -1.008172, 0, 1, 0.1019608, 1,
-0.3894221, -0.8594108, -4.610392, 0, 1, 0.1058824, 1,
-0.3873628, -1.368152, -3.00507, 0, 1, 0.1137255, 1,
-0.3807518, -1.42151, -2.139128, 0, 1, 0.1176471, 1,
-0.3760139, -1.425555, -3.931075, 0, 1, 0.1254902, 1,
-0.3689911, -0.648773, -1.381352, 0, 1, 0.1294118, 1,
-0.3606675, -0.438781, -1.147072, 0, 1, 0.1372549, 1,
-0.3599761, -0.08308443, -3.373028, 0, 1, 0.1411765, 1,
-0.3596486, 0.2137688, -0.4785599, 0, 1, 0.1490196, 1,
-0.3534309, 1.920234, 1.222564, 0, 1, 0.1529412, 1,
-0.3525617, -1.23424, -3.078962, 0, 1, 0.1607843, 1,
-0.3518293, 0.2800944, 0.4819394, 0, 1, 0.1647059, 1,
-0.3486348, 1.183921, -0.9915959, 0, 1, 0.172549, 1,
-0.3439108, -1.242316, -2.758024, 0, 1, 0.1764706, 1,
-0.3378935, -0.5684807, -2.5473, 0, 1, 0.1843137, 1,
-0.3364982, 0.6019429, 1.773313, 0, 1, 0.1882353, 1,
-0.3327416, 0.1580545, -0.9209034, 0, 1, 0.1960784, 1,
-0.3303051, 0.449116, -2.689817, 0, 1, 0.2039216, 1,
-0.3271028, 0.1633852, 1.819256, 0, 1, 0.2078431, 1,
-0.3219641, -1.193555, -2.659411, 0, 1, 0.2156863, 1,
-0.3212909, 0.8210831, -0.1342448, 0, 1, 0.2196078, 1,
-0.3199514, -0.6485484, -2.561306, 0, 1, 0.227451, 1,
-0.3154717, 1.112921, 0.6644107, 0, 1, 0.2313726, 1,
-0.3134604, -1.120867, -3.187366, 0, 1, 0.2392157, 1,
-0.3122349, -0.5838532, -3.884857, 0, 1, 0.2431373, 1,
-0.3106469, 0.1893242, -0.538055, 0, 1, 0.2509804, 1,
-0.3093105, 1.052794, -3.098514, 0, 1, 0.254902, 1,
-0.3088942, 0.119023, -0.5017316, 0, 1, 0.2627451, 1,
-0.30316, 0.02992876, -2.136821, 0, 1, 0.2666667, 1,
-0.2990789, -0.1605487, -3.210791, 0, 1, 0.2745098, 1,
-0.298038, -1.367698, -2.104012, 0, 1, 0.2784314, 1,
-0.2973758, 1.812194, -0.9702035, 0, 1, 0.2862745, 1,
-0.2970214, -0.4044141, -3.037624, 0, 1, 0.2901961, 1,
-0.2931989, -0.4930168, -1.996364, 0, 1, 0.2980392, 1,
-0.2926635, -1.502196, -3.891524, 0, 1, 0.3058824, 1,
-0.2925747, 0.1973113, -2.135268, 0, 1, 0.3098039, 1,
-0.2915145, -1.137518, -3.513182, 0, 1, 0.3176471, 1,
-0.2811876, -1.06483, -2.487687, 0, 1, 0.3215686, 1,
-0.2795334, -0.3786094, -1.31319, 0, 1, 0.3294118, 1,
-0.2752238, -0.6069388, -3.521356, 0, 1, 0.3333333, 1,
-0.2704032, 0.2139779, 0.4379528, 0, 1, 0.3411765, 1,
-0.2686448, -0.5579986, -2.281487, 0, 1, 0.345098, 1,
-0.266014, 0.5622338, 1.719697, 0, 1, 0.3529412, 1,
-0.2649197, -0.06106914, -0.8897404, 0, 1, 0.3568628, 1,
-0.2642004, 0.01778141, -2.190171, 0, 1, 0.3647059, 1,
-0.2640957, -0.1429461, -0.8905104, 0, 1, 0.3686275, 1,
-0.2606115, -1.795776, -2.329654, 0, 1, 0.3764706, 1,
-0.253217, -0.1761311, -1.466403, 0, 1, 0.3803922, 1,
-0.2530352, -0.6937374, -3.542495, 0, 1, 0.3882353, 1,
-0.2506382, -1.588973, -1.823835, 0, 1, 0.3921569, 1,
-0.2506259, 0.4220384, 0.3874602, 0, 1, 0.4, 1,
-0.2442182, -0.7044743, -1.840478, 0, 1, 0.4078431, 1,
-0.2388444, -0.05628875, -0.423245, 0, 1, 0.4117647, 1,
-0.2373297, -0.7242361, -1.841481, 0, 1, 0.4196078, 1,
-0.237125, 1.097245, 0.6504604, 0, 1, 0.4235294, 1,
-0.2358008, 1.925136, 0.238546, 0, 1, 0.4313726, 1,
-0.2344171, 0.8363436, -1.183466, 0, 1, 0.4352941, 1,
-0.2271149, 0.1507851, -2.202552, 0, 1, 0.4431373, 1,
-0.2269935, 0.2817397, -0.4919158, 0, 1, 0.4470588, 1,
-0.2257026, 0.2936154, -0.7799549, 0, 1, 0.454902, 1,
-0.2247453, 0.9742337, -3.574929, 0, 1, 0.4588235, 1,
-0.2244365, 0.9813917, -1.558809, 0, 1, 0.4666667, 1,
-0.2149464, 1.537308, 1.671754, 0, 1, 0.4705882, 1,
-0.2103155, 0.3013873, -1.272785, 0, 1, 0.4784314, 1,
-0.208799, 1.998527, 1.655462, 0, 1, 0.4823529, 1,
-0.2066841, 0.9136971, 0.6421402, 0, 1, 0.4901961, 1,
-0.2009635, -1.151722, -2.997673, 0, 1, 0.4941176, 1,
-0.1985207, 0.2246303, -0.308392, 0, 1, 0.5019608, 1,
-0.1925073, 0.3269255, 0.6882894, 0, 1, 0.509804, 1,
-0.1909232, -0.08935989, -1.874949, 0, 1, 0.5137255, 1,
-0.1902613, -2.185447, -3.627809, 0, 1, 0.5215687, 1,
-0.179792, 0.9713292, -0.1065117, 0, 1, 0.5254902, 1,
-0.1759234, -1.765277, -4.410883, 0, 1, 0.5333334, 1,
-0.1757499, 0.4496891, -0.6076354, 0, 1, 0.5372549, 1,
-0.174537, -1.226676, -4.706987, 0, 1, 0.5450981, 1,
-0.174188, 0.6956969, 0.3888862, 0, 1, 0.5490196, 1,
-0.1730299, -1.424716, -3.052037, 0, 1, 0.5568628, 1,
-0.1729607, -1.121658, -4.632591, 0, 1, 0.5607843, 1,
-0.1712142, 0.4015109, -1.049503, 0, 1, 0.5686275, 1,
-0.1707819, -0.2897181, -2.915313, 0, 1, 0.572549, 1,
-0.1707253, 0.07252146, -1.527075, 0, 1, 0.5803922, 1,
-0.1705775, -0.3965133, -4.073461, 0, 1, 0.5843138, 1,
-0.1689267, 0.06175032, -1.245559, 0, 1, 0.5921569, 1,
-0.1681735, 0.5752482, -1.640435, 0, 1, 0.5960785, 1,
-0.1643615, -1.361447, -2.668457, 0, 1, 0.6039216, 1,
-0.1642469, 1.02078, 1.31875, 0, 1, 0.6117647, 1,
-0.1598847, 0.5908358, -0.4336643, 0, 1, 0.6156863, 1,
-0.158964, 2.072325, -0.2195628, 0, 1, 0.6235294, 1,
-0.1588224, -1.938205, -2.060978, 0, 1, 0.627451, 1,
-0.154106, -0.2308805, -3.980095, 0, 1, 0.6352941, 1,
-0.153461, 2.599284, -0.1608532, 0, 1, 0.6392157, 1,
-0.1507753, -0.3904783, -2.049282, 0, 1, 0.6470588, 1,
-0.145437, 0.9286838, -1.72873, 0, 1, 0.6509804, 1,
-0.1387985, -0.819916, -2.76391, 0, 1, 0.6588235, 1,
-0.1385947, 0.4597372, -1.820914, 0, 1, 0.6627451, 1,
-0.1308795, -0.3900835, -4.145779, 0, 1, 0.6705883, 1,
-0.1272708, -0.09524179, -1.271578, 0, 1, 0.6745098, 1,
-0.1254373, -1.062854, -1.265945, 0, 1, 0.682353, 1,
-0.1118535, -0.1926711, -1.847093, 0, 1, 0.6862745, 1,
-0.1082754, -0.5387449, -3.826636, 0, 1, 0.6941177, 1,
-0.1080762, 0.4950134, 0.8880206, 0, 1, 0.7019608, 1,
-0.1056112, -0.5461091, -3.085077, 0, 1, 0.7058824, 1,
-0.1052197, 0.6608454, 0.9728193, 0, 1, 0.7137255, 1,
-0.09680399, -0.6438956, -5.016613, 0, 1, 0.7176471, 1,
-0.09380221, -0.4031662, -3.828299, 0, 1, 0.7254902, 1,
-0.0905963, 0.1848545, 2.826996, 0, 1, 0.7294118, 1,
-0.08598246, -0.8709534, -5.212709, 0, 1, 0.7372549, 1,
-0.08574644, 0.8824099, 0.04098029, 0, 1, 0.7411765, 1,
-0.08274993, 0.04572152, -1.06622, 0, 1, 0.7490196, 1,
-0.07797949, -1.261354, -3.481346, 0, 1, 0.7529412, 1,
-0.07700574, 0.713993, -1.204579, 0, 1, 0.7607843, 1,
-0.07631171, 0.6006536, -0.1840947, 0, 1, 0.7647059, 1,
-0.0741881, -0.8040625, -5.322162, 0, 1, 0.772549, 1,
-0.06756238, 0.50112, 1.72534, 0, 1, 0.7764706, 1,
-0.05753417, -0.4744543, -2.95843, 0, 1, 0.7843137, 1,
-0.05103892, 1.48154, -0.3890224, 0, 1, 0.7882353, 1,
-0.05033408, -0.7897456, -4.061868, 0, 1, 0.7960784, 1,
-0.04984911, 2.198753, 2.298912, 0, 1, 0.8039216, 1,
-0.0493479, -0.8285412, -1.85513, 0, 1, 0.8078431, 1,
-0.04726223, 0.02334353, -0.5586957, 0, 1, 0.8156863, 1,
-0.04412625, -0.2972745, -2.551604, 0, 1, 0.8196079, 1,
-0.04099379, -0.7943968, -3.221415, 0, 1, 0.827451, 1,
-0.03722195, 0.03027578, -1.858317, 0, 1, 0.8313726, 1,
-0.03693619, 0.9503421, -0.05238578, 0, 1, 0.8392157, 1,
-0.03462733, 0.5023832, -0.4131833, 0, 1, 0.8431373, 1,
-0.03245973, -1.175556, -3.161386, 0, 1, 0.8509804, 1,
-0.02952036, 0.5232186, -0.5340732, 0, 1, 0.854902, 1,
-0.02942396, 0.6959446, -0.1139006, 0, 1, 0.8627451, 1,
-0.02523194, -0.5244618, -3.344473, 0, 1, 0.8666667, 1,
-0.02206007, 0.370422, -0.9318923, 0, 1, 0.8745098, 1,
-0.01837076, 0.1382724, 0.2271517, 0, 1, 0.8784314, 1,
-0.009915032, 1.876305, 0.1401923, 0, 1, 0.8862745, 1,
-0.003459368, 0.8719888, -1.282342, 0, 1, 0.8901961, 1,
-0.00269714, -0.001629216, -3.186113, 0, 1, 0.8980392, 1,
0.003848501, 0.8658829, 0.7005967, 0, 1, 0.9058824, 1,
0.01080782, -1.000437, 4.125821, 0, 1, 0.9098039, 1,
0.01117101, 0.1888592, -1.575802, 0, 1, 0.9176471, 1,
0.01650524, 1.379032, -0.5724439, 0, 1, 0.9215686, 1,
0.02138244, -0.6076669, 2.610443, 0, 1, 0.9294118, 1,
0.02306148, 0.1575393, -0.3989137, 0, 1, 0.9333333, 1,
0.03259924, -0.8885531, 4.074275, 0, 1, 0.9411765, 1,
0.03397704, -2.130454, 2.337691, 0, 1, 0.945098, 1,
0.0343646, 1.540802, 1.631747, 0, 1, 0.9529412, 1,
0.03526919, -0.1708497, 2.779474, 0, 1, 0.9568627, 1,
0.03573228, 1.626757, 0.2743592, 0, 1, 0.9647059, 1,
0.0484502, -0.9011274, 4.11372, 0, 1, 0.9686275, 1,
0.04896774, 0.1806383, 1.389965, 0, 1, 0.9764706, 1,
0.05004083, 1.207496, 0.4335751, 0, 1, 0.9803922, 1,
0.0534194, 0.2232421, 2.438822, 0, 1, 0.9882353, 1,
0.06001137, -2.358898, 2.503915, 0, 1, 0.9921569, 1,
0.06001281, 0.1978746, -0.6628329, 0, 1, 1, 1,
0.0608914, -0.868756, 2.26745, 0, 0.9921569, 1, 1,
0.06192645, 1.145777, 1.170158, 0, 0.9882353, 1, 1,
0.06522717, 1.184339, -0.4142898, 0, 0.9803922, 1, 1,
0.06678148, 0.1429098, -0.321675, 0, 0.9764706, 1, 1,
0.07090718, 0.1485298, 1.393435, 0, 0.9686275, 1, 1,
0.0730516, -0.2010255, 3.905168, 0, 0.9647059, 1, 1,
0.07699385, -1.065557, 3.764122, 0, 0.9568627, 1, 1,
0.08282501, -0.9979576, 5.162771, 0, 0.9529412, 1, 1,
0.08496121, -0.7766238, 4.515826, 0, 0.945098, 1, 1,
0.08615507, 0.7781254, -0.8597665, 0, 0.9411765, 1, 1,
0.08746615, -2.018981, 3.09406, 0, 0.9333333, 1, 1,
0.09644342, -1.069956, 1.000329, 0, 0.9294118, 1, 1,
0.09696559, 1.158923, 0.7436331, 0, 0.9215686, 1, 1,
0.09894653, 0.5647334, 1.504779, 0, 0.9176471, 1, 1,
0.1050003, -2.482425, 1.829221, 0, 0.9098039, 1, 1,
0.1077598, 1.153286, -0.7449062, 0, 0.9058824, 1, 1,
0.1093774, -0.09702951, 3.485003, 0, 0.8980392, 1, 1,
0.1112974, 1.115284, -0.1224779, 0, 0.8901961, 1, 1,
0.1173072, -0.5044203, 4.525249, 0, 0.8862745, 1, 1,
0.1178009, -0.4042636, 2.06637, 0, 0.8784314, 1, 1,
0.1234517, -1.355441, 3.396066, 0, 0.8745098, 1, 1,
0.1239583, 0.9836973, -0.4360568, 0, 0.8666667, 1, 1,
0.1241536, -1.212505, 2.800218, 0, 0.8627451, 1, 1,
0.1336743, -1.050284, 4.965181, 0, 0.854902, 1, 1,
0.1446407, -1.398098, 2.522965, 0, 0.8509804, 1, 1,
0.1454659, -2.064043, 3.501381, 0, 0.8431373, 1, 1,
0.153716, 0.2215711, 2.650319, 0, 0.8392157, 1, 1,
0.1552778, 1.809606, -0.08147193, 0, 0.8313726, 1, 1,
0.1553587, 0.6461301, -1.256991, 0, 0.827451, 1, 1,
0.1575088, 2.033085, -0.4288576, 0, 0.8196079, 1, 1,
0.1598625, -1.645049, 3.34346, 0, 0.8156863, 1, 1,
0.1619757, 0.4903964, -0.1197397, 0, 0.8078431, 1, 1,
0.1641705, 0.5140182, 1.147793, 0, 0.8039216, 1, 1,
0.1654667, -0.8973703, 2.974351, 0, 0.7960784, 1, 1,
0.1663997, 1.21588, -1.386212, 0, 0.7882353, 1, 1,
0.1684676, -0.7944006, 3.436373, 0, 0.7843137, 1, 1,
0.1685885, -0.104526, 0.9605986, 0, 0.7764706, 1, 1,
0.1689288, 0.2396201, 1.604679, 0, 0.772549, 1, 1,
0.1712237, -1.757487, 2.584541, 0, 0.7647059, 1, 1,
0.174715, 0.5061236, 1.227707, 0, 0.7607843, 1, 1,
0.1753252, 0.01141298, 0.5351496, 0, 0.7529412, 1, 1,
0.1765072, 0.292525, 0.5656389, 0, 0.7490196, 1, 1,
0.1843585, -0.3667148, 1.762442, 0, 0.7411765, 1, 1,
0.1848856, -0.8605946, 1.692885, 0, 0.7372549, 1, 1,
0.1875075, 1.454712, -1.120159, 0, 0.7294118, 1, 1,
0.1875579, -0.6362578, 3.205584, 0, 0.7254902, 1, 1,
0.1914263, 0.4643351, -1.173227, 0, 0.7176471, 1, 1,
0.1943554, -1.845149, 6.531585, 0, 0.7137255, 1, 1,
0.1950033, -0.8352091, 1.625721, 0, 0.7058824, 1, 1,
0.1970553, -0.1740936, 2.066412, 0, 0.6980392, 1, 1,
0.1992944, -0.09427005, 2.763869, 0, 0.6941177, 1, 1,
0.2003231, -0.1612438, 1.033924, 0, 0.6862745, 1, 1,
0.2004595, -0.7447366, 3.725956, 0, 0.682353, 1, 1,
0.202809, -1.61164, 3.25917, 0, 0.6745098, 1, 1,
0.2029797, -1.018862, 3.876548, 0, 0.6705883, 1, 1,
0.2032253, 0.5538299, -0.3890077, 0, 0.6627451, 1, 1,
0.204579, -0.2805916, 4.074952, 0, 0.6588235, 1, 1,
0.2046672, 0.1080754, -0.1757143, 0, 0.6509804, 1, 1,
0.2056596, 0.1255899, 1.581799, 0, 0.6470588, 1, 1,
0.2069121, 0.1401183, -0.1358814, 0, 0.6392157, 1, 1,
0.2071516, 1.100194, 0.303173, 0, 0.6352941, 1, 1,
0.2131731, 1.30095, 0.8284584, 0, 0.627451, 1, 1,
0.2171507, 0.7098287, 0.4238159, 0, 0.6235294, 1, 1,
0.2196252, -1.9441, 3.517683, 0, 0.6156863, 1, 1,
0.2204615, -1.186473, 3.282074, 0, 0.6117647, 1, 1,
0.2253615, 2.408409, -0.4075843, 0, 0.6039216, 1, 1,
0.227462, 0.8206055, -0.3980599, 0, 0.5960785, 1, 1,
0.2275956, 0.4438019, -0.6104946, 0, 0.5921569, 1, 1,
0.228039, -0.5299482, 1.821717, 0, 0.5843138, 1, 1,
0.2350557, -0.2464578, 1.512694, 0, 0.5803922, 1, 1,
0.2352859, -0.4587286, 1.749048, 0, 0.572549, 1, 1,
0.2448649, -0.671903, 4.160347, 0, 0.5686275, 1, 1,
0.2464332, 0.6916496, 1.016808, 0, 0.5607843, 1, 1,
0.2612357, 0.2632692, 2.004791, 0, 0.5568628, 1, 1,
0.2683156, 1.33229, -1.294782, 0, 0.5490196, 1, 1,
0.2683792, -0.4941892, 2.196404, 0, 0.5450981, 1, 1,
0.2714703, 0.02569602, 2.190574, 0, 0.5372549, 1, 1,
0.2739434, -1.120179, 0.4814473, 0, 0.5333334, 1, 1,
0.2752624, 0.4081632, 2.37351, 0, 0.5254902, 1, 1,
0.275337, 0.899924, 0.4234756, 0, 0.5215687, 1, 1,
0.2764131, -1.027919, 1.906997, 0, 0.5137255, 1, 1,
0.2779111, 0.4299824, 1.046093, 0, 0.509804, 1, 1,
0.2864222, 0.6034976, 0.7407427, 0, 0.5019608, 1, 1,
0.2877679, -0.379648, 2.631199, 0, 0.4941176, 1, 1,
0.2909869, 1.204684, 0.4400166, 0, 0.4901961, 1, 1,
0.2915751, 0.3233917, 1.349663, 0, 0.4823529, 1, 1,
0.2928789, -0.266178, 2.407914, 0, 0.4784314, 1, 1,
0.2930537, -0.4725521, 4.063899, 0, 0.4705882, 1, 1,
0.2948862, -1.566213, 3.255564, 0, 0.4666667, 1, 1,
0.2980696, 2.323677, -0.8632827, 0, 0.4588235, 1, 1,
0.2987816, -0.06629247, 1.566035, 0, 0.454902, 1, 1,
0.3027036, -0.8984957, 2.045804, 0, 0.4470588, 1, 1,
0.3032621, -1.503864, 3.92916, 0, 0.4431373, 1, 1,
0.3050588, 0.06216282, 1.04125, 0, 0.4352941, 1, 1,
0.3052091, 0.08307809, 1.097018, 0, 0.4313726, 1, 1,
0.3097869, 1.143978, -2.328776, 0, 0.4235294, 1, 1,
0.3100678, -0.1863751, 0.3224916, 0, 0.4196078, 1, 1,
0.3131258, -0.4968492, 3.702683, 0, 0.4117647, 1, 1,
0.3149529, 0.02830149, 1.332401, 0, 0.4078431, 1, 1,
0.3172664, -0.2632657, 3.996801, 0, 0.4, 1, 1,
0.3196954, -0.7761624, 3.558908, 0, 0.3921569, 1, 1,
0.3207428, -0.01062833, 1.90594, 0, 0.3882353, 1, 1,
0.3221649, -0.4391371, 1.752293, 0, 0.3803922, 1, 1,
0.3227001, -0.3049085, 3.241544, 0, 0.3764706, 1, 1,
0.3233286, -0.6403443, 3.078809, 0, 0.3686275, 1, 1,
0.3259509, -0.08330743, 0.2617851, 0, 0.3647059, 1, 1,
0.327334, -0.4873295, 2.281148, 0, 0.3568628, 1, 1,
0.3278454, 0.4003473, 1.634251, 0, 0.3529412, 1, 1,
0.3299033, 0.5127404, -0.2942185, 0, 0.345098, 1, 1,
0.3327595, 0.03777577, 1.871863, 0, 0.3411765, 1, 1,
0.3339695, -1.916643, 2.324435, 0, 0.3333333, 1, 1,
0.3341715, 0.6556273, 0.811066, 0, 0.3294118, 1, 1,
0.3350403, -0.01839672, 3.463161, 0, 0.3215686, 1, 1,
0.3356037, 0.9056417, 1.217098, 0, 0.3176471, 1, 1,
0.3358886, 1.279474, 0.7802659, 0, 0.3098039, 1, 1,
0.3416517, -0.5448802, 3.737558, 0, 0.3058824, 1, 1,
0.3419639, 1.459201, 0.4831785, 0, 0.2980392, 1, 1,
0.3430019, -1.287345, 4.479993, 0, 0.2901961, 1, 1,
0.3437748, 1.358953, 1.423039, 0, 0.2862745, 1, 1,
0.3481769, 0.6648313, -0.4948503, 0, 0.2784314, 1, 1,
0.3506387, -1.326413, 3.670869, 0, 0.2745098, 1, 1,
0.3514006, 0.6443554, 1.193727, 0, 0.2666667, 1, 1,
0.3518198, 0.9116702, -1.236027, 0, 0.2627451, 1, 1,
0.3526627, 0.7206103, 1.025328, 0, 0.254902, 1, 1,
0.3573144, 0.650266, 1.378971, 0, 0.2509804, 1, 1,
0.3597886, 0.5242674, 0.9313677, 0, 0.2431373, 1, 1,
0.3627477, -0.8573853, 2.64031, 0, 0.2392157, 1, 1,
0.3689296, -2.664207, 4.401489, 0, 0.2313726, 1, 1,
0.3695253, 0.4370609, -1.299699, 0, 0.227451, 1, 1,
0.3699203, -0.4990276, 2.333738, 0, 0.2196078, 1, 1,
0.3725323, 0.2604692, 2.99786, 0, 0.2156863, 1, 1,
0.373686, -1.504502, 3.539484, 0, 0.2078431, 1, 1,
0.3765529, 1.696882, 0.6389997, 0, 0.2039216, 1, 1,
0.3809161, 0.8113258, -1.346212, 0, 0.1960784, 1, 1,
0.3863606, -0.96301, 1.937904, 0, 0.1882353, 1, 1,
0.3870551, 0.9451512, -0.6035458, 0, 0.1843137, 1, 1,
0.3889805, 0.1042892, -0.1015181, 0, 0.1764706, 1, 1,
0.3900403, -0.9836306, 4.951147, 0, 0.172549, 1, 1,
0.3930235, 0.01655003, 2.780348, 0, 0.1647059, 1, 1,
0.3957792, 0.3991636, -0.7917643, 0, 0.1607843, 1, 1,
0.3992573, 0.2948166, 1.398443, 0, 0.1529412, 1, 1,
0.4000657, 0.3414657, -1.864517, 0, 0.1490196, 1, 1,
0.4078103, -1.713668, 2.680507, 0, 0.1411765, 1, 1,
0.4084378, -1.105337, 0.8392516, 0, 0.1372549, 1, 1,
0.4131248, -0.3253553, 1.03864, 0, 0.1294118, 1, 1,
0.4143342, 1.540624, 0.4744087, 0, 0.1254902, 1, 1,
0.4163765, 1.221601, -0.1782021, 0, 0.1176471, 1, 1,
0.419949, -0.3699766, 2.501694, 0, 0.1137255, 1, 1,
0.4209234, 1.384846, 0.8176126, 0, 0.1058824, 1, 1,
0.4229285, -0.6730815, 2.237629, 0, 0.09803922, 1, 1,
0.4275304, 0.5742487, -0.7772856, 0, 0.09411765, 1, 1,
0.4334964, -0.6327358, 4.730067, 0, 0.08627451, 1, 1,
0.4345086, 0.08104534, 3.231155, 0, 0.08235294, 1, 1,
0.4417485, -0.2254635, 2.917585, 0, 0.07450981, 1, 1,
0.4419305, 0.4567666, -0.5884077, 0, 0.07058824, 1, 1,
0.4436549, 0.3473091, 0.5147502, 0, 0.0627451, 1, 1,
0.4469383, -0.3442575, 2.914734, 0, 0.05882353, 1, 1,
0.4491464, -1.622991, 2.619054, 0, 0.05098039, 1, 1,
0.4494033, -1.192385, 3.196932, 0, 0.04705882, 1, 1,
0.4494252, 0.5500394, 0.4030661, 0, 0.03921569, 1, 1,
0.4494298, -0.9287151, 2.666479, 0, 0.03529412, 1, 1,
0.4501658, -1.530528, 2.974838, 0, 0.02745098, 1, 1,
0.4504487, -1.433002, 2.746222, 0, 0.02352941, 1, 1,
0.4546725, -1.314674, 2.852602, 0, 0.01568628, 1, 1,
0.45515, -0.4751642, 2.412748, 0, 0.01176471, 1, 1,
0.4554355, 0.5006642, 0.8103536, 0, 0.003921569, 1, 1,
0.4558869, 0.4136991, 1.177712, 0.003921569, 0, 1, 1,
0.4575883, 0.03994813, 3.164667, 0.007843138, 0, 1, 1,
0.4585668, 0.02939328, 2.220536, 0.01568628, 0, 1, 1,
0.4590511, -0.6578488, 2.748637, 0.01960784, 0, 1, 1,
0.4593104, -0.5655212, 1.982567, 0.02745098, 0, 1, 1,
0.4609879, -0.05997712, 0.1864453, 0.03137255, 0, 1, 1,
0.4661336, -0.529328, 3.960973, 0.03921569, 0, 1, 1,
0.4718527, 0.8306949, 0.02784121, 0.04313726, 0, 1, 1,
0.4720664, 0.378607, 0.8878595, 0.05098039, 0, 1, 1,
0.4726462, 1.195082, 1.795107, 0.05490196, 0, 1, 1,
0.4730024, -1.107528, 3.404342, 0.0627451, 0, 1, 1,
0.4739341, -1.26756, 2.134881, 0.06666667, 0, 1, 1,
0.4739914, -0.5586712, 2.684552, 0.07450981, 0, 1, 1,
0.4788591, -1.351804, 2.966569, 0.07843138, 0, 1, 1,
0.4842081, 0.3770031, -0.7314364, 0.08627451, 0, 1, 1,
0.4865654, -0.1519246, 1.873613, 0.09019608, 0, 1, 1,
0.4878676, 0.6011789, 0.1639921, 0.09803922, 0, 1, 1,
0.4881206, -0.4906991, 2.521152, 0.1058824, 0, 1, 1,
0.4901373, -0.3390312, 2.411831, 0.1098039, 0, 1, 1,
0.4909889, -0.3099333, 1.32702, 0.1176471, 0, 1, 1,
0.497177, 0.7948176, 1.848013, 0.1215686, 0, 1, 1,
0.4986657, 0.4099959, 1.379872, 0.1294118, 0, 1, 1,
0.501616, 1.138965, -0.1187472, 0.1333333, 0, 1, 1,
0.5089794, 0.563651, 1.479835, 0.1411765, 0, 1, 1,
0.5144077, -0.5393055, 2.245867, 0.145098, 0, 1, 1,
0.5155503, -0.5720401, 1.848263, 0.1529412, 0, 1, 1,
0.5163211, 0.2500538, 1.987789, 0.1568628, 0, 1, 1,
0.5182031, -0.2372889, 4.278815, 0.1647059, 0, 1, 1,
0.5185803, -0.4978983, 1.256198, 0.1686275, 0, 1, 1,
0.5186324, -2.279552, 3.174185, 0.1764706, 0, 1, 1,
0.5214927, -0.6977714, 2.566471, 0.1803922, 0, 1, 1,
0.5244989, 0.9720901, -0.6511139, 0.1882353, 0, 1, 1,
0.5251881, -0.4354437, 2.036121, 0.1921569, 0, 1, 1,
0.5336716, -0.3521505, 2.033355, 0.2, 0, 1, 1,
0.5401652, -0.1078316, 1.376413, 0.2078431, 0, 1, 1,
0.5419616, 0.6025087, 1.054705, 0.2117647, 0, 1, 1,
0.5549136, -1.127062, 2.959977, 0.2196078, 0, 1, 1,
0.5583389, 1.378186, -0.4418896, 0.2235294, 0, 1, 1,
0.5584266, 0.6508354, 1.770003, 0.2313726, 0, 1, 1,
0.5586548, 0.9176088, 0.2450254, 0.2352941, 0, 1, 1,
0.5588916, 0.1782053, 0.7163715, 0.2431373, 0, 1, 1,
0.5593653, 0.7905828, 0.9755779, 0.2470588, 0, 1, 1,
0.5674165, 1.439165, 2.488617, 0.254902, 0, 1, 1,
0.5699277, -0.04179258, 1.158674, 0.2588235, 0, 1, 1,
0.5786305, 0.627856, -0.3823397, 0.2666667, 0, 1, 1,
0.5853561, 0.3701617, 1.407569, 0.2705882, 0, 1, 1,
0.5877452, -0.04696342, 2.096835, 0.2784314, 0, 1, 1,
0.588154, -0.1248115, 1.646723, 0.282353, 0, 1, 1,
0.5903146, -1.60893, -0.682939, 0.2901961, 0, 1, 1,
0.5915467, -0.8331838, 3.650839, 0.2941177, 0, 1, 1,
0.5934362, -1.282805, 4.421718, 0.3019608, 0, 1, 1,
0.5939086, -0.4041288, 0.6251869, 0.3098039, 0, 1, 1,
0.6076372, 0.1541739, 0.4582832, 0.3137255, 0, 1, 1,
0.6106523, 1.349552, 0.5903355, 0.3215686, 0, 1, 1,
0.6113169, -0.1423865, 0.6503283, 0.3254902, 0, 1, 1,
0.6165271, 1.309627, -0.3087403, 0.3333333, 0, 1, 1,
0.6180981, 0.2315853, 2.821291, 0.3372549, 0, 1, 1,
0.6215795, 0.179283, 0.2338111, 0.345098, 0, 1, 1,
0.62343, 0.8283174, 1.446349, 0.3490196, 0, 1, 1,
0.6262819, 0.429039, -0.0169458, 0.3568628, 0, 1, 1,
0.6294389, 0.02227875, 1.701459, 0.3607843, 0, 1, 1,
0.638988, 0.4203254, 0.9042383, 0.3686275, 0, 1, 1,
0.6432812, 2.303415, -0.9762041, 0.372549, 0, 1, 1,
0.6445988, -1.084889, 1.091191, 0.3803922, 0, 1, 1,
0.6455071, 0.881707, 0.7294633, 0.3843137, 0, 1, 1,
0.6489351, 0.0785494, 1.909743, 0.3921569, 0, 1, 1,
0.6504815, 0.8704302, 1.593626, 0.3960784, 0, 1, 1,
0.6514274, -0.3734018, 2.860166, 0.4039216, 0, 1, 1,
0.6515647, -0.4289994, 2.416401, 0.4117647, 0, 1, 1,
0.6532885, 1.182999, 0.3163373, 0.4156863, 0, 1, 1,
0.6570101, 0.7394308, 0.6959271, 0.4235294, 0, 1, 1,
0.6577414, -0.1151865, 1.882639, 0.427451, 0, 1, 1,
0.6643556, 0.08638667, 1.285783, 0.4352941, 0, 1, 1,
0.6667516, -1.617498, 1.792139, 0.4392157, 0, 1, 1,
0.6703818, 0.6829947, 2.187191, 0.4470588, 0, 1, 1,
0.670391, 0.09934285, 2.976855, 0.4509804, 0, 1, 1,
0.675692, -0.3994305, 4.019324, 0.4588235, 0, 1, 1,
0.6758888, 0.2053352, 0.6752385, 0.4627451, 0, 1, 1,
0.6774353, 0.840653, -0.1269262, 0.4705882, 0, 1, 1,
0.6806208, 0.4086739, 2.490693, 0.4745098, 0, 1, 1,
0.6822517, -0.2483009, 2.442444, 0.4823529, 0, 1, 1,
0.6893458, 1.877496, 1.863367, 0.4862745, 0, 1, 1,
0.6924655, 0.9113, 1.648436, 0.4941176, 0, 1, 1,
0.6968256, 1.15282, 0.3871639, 0.5019608, 0, 1, 1,
0.7020717, 0.2822655, 1.066176, 0.5058824, 0, 1, 1,
0.713729, 0.08533712, -0.3756532, 0.5137255, 0, 1, 1,
0.7142165, 0.1717979, 1.07205, 0.5176471, 0, 1, 1,
0.7164108, 2.042138, 1.559202, 0.5254902, 0, 1, 1,
0.7230015, -2.230167, 1.744434, 0.5294118, 0, 1, 1,
0.724104, 1.111957, -0.1549795, 0.5372549, 0, 1, 1,
0.731305, 0.1618792, 1.828615, 0.5411765, 0, 1, 1,
0.7330551, -1.017754, 3.168795, 0.5490196, 0, 1, 1,
0.7359763, -1.198763, 3.822651, 0.5529412, 0, 1, 1,
0.7549662, -0.2958508, 3.285435, 0.5607843, 0, 1, 1,
0.7609967, -0.5892748, 2.055076, 0.5647059, 0, 1, 1,
0.7638917, 1.712122, 1.452132, 0.572549, 0, 1, 1,
0.7666897, 0.9069988, 0.9455479, 0.5764706, 0, 1, 1,
0.766717, -1.110447, 0.7787518, 0.5843138, 0, 1, 1,
0.7714252, -0.4713186, 2.118762, 0.5882353, 0, 1, 1,
0.7779793, 0.1418717, 4.074347, 0.5960785, 0, 1, 1,
0.7788376, 1.130726, -0.2936991, 0.6039216, 0, 1, 1,
0.7818354, 2.192584, 2.39569, 0.6078432, 0, 1, 1,
0.7824194, 0.5153053, 1.478657, 0.6156863, 0, 1, 1,
0.784673, 1.547656, 0.06500489, 0.6196079, 0, 1, 1,
0.7926578, -0.530795, 2.600441, 0.627451, 0, 1, 1,
0.7935128, 0.3991961, 0.7107025, 0.6313726, 0, 1, 1,
0.7955756, 1.12468, 2.486274, 0.6392157, 0, 1, 1,
0.7958195, -1.177393, 2.645753, 0.6431373, 0, 1, 1,
0.7974217, -0.4181392, 3.209317, 0.6509804, 0, 1, 1,
0.7995395, 0.285221, 1.81602, 0.654902, 0, 1, 1,
0.8019506, -0.6640288, 1.667639, 0.6627451, 0, 1, 1,
0.8030303, 0.1223431, 1.762769, 0.6666667, 0, 1, 1,
0.8209711, -1.788381, 3.387454, 0.6745098, 0, 1, 1,
0.8235599, 0.4771188, 0.2276532, 0.6784314, 0, 1, 1,
0.8259565, -2.169068, 2.835404, 0.6862745, 0, 1, 1,
0.8271098, 0.1626076, 1.218157, 0.6901961, 0, 1, 1,
0.8286843, 0.7374479, 1.544725, 0.6980392, 0, 1, 1,
0.8292167, -0.8126583, 3.782535, 0.7058824, 0, 1, 1,
0.8321176, -1.029176, 3.779588, 0.7098039, 0, 1, 1,
0.8324175, -1.102926, 3.504573, 0.7176471, 0, 1, 1,
0.8325315, 1.509629, 1.12207, 0.7215686, 0, 1, 1,
0.8386916, 0.09707434, 2.78337, 0.7294118, 0, 1, 1,
0.8428878, -0.8364987, 0.6670285, 0.7333333, 0, 1, 1,
0.8445051, 1.513831, -0.3965334, 0.7411765, 0, 1, 1,
0.8459091, -0.3548154, 1.687295, 0.7450981, 0, 1, 1,
0.8552047, -1.264802, 1.711847, 0.7529412, 0, 1, 1,
0.8580367, 0.675382, 4.644987, 0.7568628, 0, 1, 1,
0.8656741, 0.7989428, 1.350771, 0.7647059, 0, 1, 1,
0.8678115, -0.4886464, 1.619687, 0.7686275, 0, 1, 1,
0.8680486, 0.5787258, 0.2530543, 0.7764706, 0, 1, 1,
0.8688354, -2.685507, 2.650196, 0.7803922, 0, 1, 1,
0.8801042, 1.18245, 0.6628512, 0.7882353, 0, 1, 1,
0.8824259, 0.8833965, 0.05411308, 0.7921569, 0, 1, 1,
0.8848999, -0.64468, 1.58139, 0.8, 0, 1, 1,
0.8879842, -0.2537701, 1.760497, 0.8078431, 0, 1, 1,
0.8896552, 0.4439766, 1.774721, 0.8117647, 0, 1, 1,
0.8915651, 0.805436, 1.269612, 0.8196079, 0, 1, 1,
0.8922707, -0.9601452, 1.231903, 0.8235294, 0, 1, 1,
0.8945028, -0.3920945, 1.524083, 0.8313726, 0, 1, 1,
0.896621, 0.6513578, -0.3333173, 0.8352941, 0, 1, 1,
0.8979062, 0.8468734, -0.1873054, 0.8431373, 0, 1, 1,
0.8981681, -0.7387444, 1.875247, 0.8470588, 0, 1, 1,
0.9049305, -0.5147643, 2.992275, 0.854902, 0, 1, 1,
0.9067348, 1.763342, 1.036086, 0.8588235, 0, 1, 1,
0.9081309, 0.5553455, 1.823398, 0.8666667, 0, 1, 1,
0.9104693, 0.1189547, 0.7626138, 0.8705882, 0, 1, 1,
0.9109102, -0.2174229, 2.031188, 0.8784314, 0, 1, 1,
0.9120793, 0.3687018, 1.869206, 0.8823529, 0, 1, 1,
0.9189439, -0.4685375, 2.095317, 0.8901961, 0, 1, 1,
0.9211231, 1.60603, 1.183691, 0.8941177, 0, 1, 1,
0.9241289, -0.7597817, 2.498935, 0.9019608, 0, 1, 1,
0.9349297, 0.4539928, 1.143862, 0.9098039, 0, 1, 1,
0.9402531, -0.9942468, 1.913975, 0.9137255, 0, 1, 1,
0.9408756, 0.2293251, 3.480494, 0.9215686, 0, 1, 1,
0.9501072, 1.294339, 0.3700027, 0.9254902, 0, 1, 1,
0.9514152, 1.185681, -0.2018482, 0.9333333, 0, 1, 1,
0.9554668, 0.3693372, 1.529493, 0.9372549, 0, 1, 1,
0.9622739, -0.2648909, 1.994944, 0.945098, 0, 1, 1,
0.9629572, -0.616273, 0.6780645, 0.9490196, 0, 1, 1,
0.9649436, 0.7892854, -0.5032115, 0.9568627, 0, 1, 1,
0.9805855, -0.1673454, 2.485129, 0.9607843, 0, 1, 1,
0.9820472, 0.3447926, -0.7756524, 0.9686275, 0, 1, 1,
0.9871494, 1.212259, 1.752977, 0.972549, 0, 1, 1,
0.9933138, -1.330007, 3.289969, 0.9803922, 0, 1, 1,
0.9964183, -0.598436, 1.543821, 0.9843137, 0, 1, 1,
0.9991511, -1.178174, 1.199798, 0.9921569, 0, 1, 1,
1.002092, 0.6463113, 2.233176, 0.9960784, 0, 1, 1,
1.004184, 2.20237, 0.2550521, 1, 0, 0.9960784, 1,
1.00532, -0.3106659, 1.386173, 1, 0, 0.9882353, 1,
1.009027, -0.9710973, 4.227543, 1, 0, 0.9843137, 1,
1.017066, -0.2010849, 4.237039, 1, 0, 0.9764706, 1,
1.0185, -0.6467917, 0.6671547, 1, 0, 0.972549, 1,
1.029803, 0.4663497, 0.5459774, 1, 0, 0.9647059, 1,
1.033979, 0.5225314, 1.400344, 1, 0, 0.9607843, 1,
1.045985, -0.2411869, 1.947306, 1, 0, 0.9529412, 1,
1.047545, -1.377178, 2.218775, 1, 0, 0.9490196, 1,
1.050088, -0.04846031, 1.932472, 1, 0, 0.9411765, 1,
1.059213, 0.6377363, -0.1716851, 1, 0, 0.9372549, 1,
1.061118, 0.4118144, 2.10272, 1, 0, 0.9294118, 1,
1.061427, 0.5041939, 0.6442406, 1, 0, 0.9254902, 1,
1.067363, 0.8013895, 1.022363, 1, 0, 0.9176471, 1,
1.071844, 1.17891, 0.5497187, 1, 0, 0.9137255, 1,
1.085612, -0.04920922, 3.388212, 1, 0, 0.9058824, 1,
1.093356, -1.661735, 2.838343, 1, 0, 0.9019608, 1,
1.095401, 1.179384, -0.07230166, 1, 0, 0.8941177, 1,
1.101477, 0.7379839, 1.669599, 1, 0, 0.8862745, 1,
1.103523, 2.096995, 0.6200045, 1, 0, 0.8823529, 1,
1.105042, 1.18907, 0.3435551, 1, 0, 0.8745098, 1,
1.105259, -1.110347, 2.520609, 1, 0, 0.8705882, 1,
1.114988, -0.469592, 1.56205, 1, 0, 0.8627451, 1,
1.11844, 0.3264665, 1.588491, 1, 0, 0.8588235, 1,
1.119583, -0.6039383, -0.5758785, 1, 0, 0.8509804, 1,
1.119987, 0.9050146, 1.507618, 1, 0, 0.8470588, 1,
1.12157, 0.487639, 0.1837116, 1, 0, 0.8392157, 1,
1.12484, 0.2433007, 1.974623, 1, 0, 0.8352941, 1,
1.129343, -0.3041359, 1.782388, 1, 0, 0.827451, 1,
1.132516, -0.5316826, 3.370896, 1, 0, 0.8235294, 1,
1.136287, -1.319808, 2.211171, 1, 0, 0.8156863, 1,
1.141432, -1.561851, 2.418411, 1, 0, 0.8117647, 1,
1.144153, -0.6790818, 1.425887, 1, 0, 0.8039216, 1,
1.148254, 2.094758, 0.2599168, 1, 0, 0.7960784, 1,
1.148717, -0.07380968, 2.850086, 1, 0, 0.7921569, 1,
1.150741, 0.7966685, 2.478142, 1, 0, 0.7843137, 1,
1.15086, -0.1415651, 3.283187, 1, 0, 0.7803922, 1,
1.155006, 0.3051765, 1.297792, 1, 0, 0.772549, 1,
1.160595, 0.06090852, 0.3965714, 1, 0, 0.7686275, 1,
1.164843, -0.3959569, 2.413788, 1, 0, 0.7607843, 1,
1.169506, -0.7797689, 1.110822, 1, 0, 0.7568628, 1,
1.171085, -0.01133727, 0.8687361, 1, 0, 0.7490196, 1,
1.173523, -0.06261136, 2.379589, 1, 0, 0.7450981, 1,
1.180942, 0.6390848, 4.502147, 1, 0, 0.7372549, 1,
1.183216, 0.7015687, 1.129015, 1, 0, 0.7333333, 1,
1.184365, -2.389359, 1.883269, 1, 0, 0.7254902, 1,
1.188933, -1.050563, 2.095997, 1, 0, 0.7215686, 1,
1.195455, 0.6942167, 0.7772316, 1, 0, 0.7137255, 1,
1.206251, -0.09101573, 1.014766, 1, 0, 0.7098039, 1,
1.210634, -0.07356764, 1.575942, 1, 0, 0.7019608, 1,
1.213376, -1.508243, 3.150851, 1, 0, 0.6941177, 1,
1.214293, 1.039163, 0.5602528, 1, 0, 0.6901961, 1,
1.214422, 0.8537624, 0.6660507, 1, 0, 0.682353, 1,
1.214691, 1.073309, 1.640658, 1, 0, 0.6784314, 1,
1.216223, 0.2150797, 1.746448, 1, 0, 0.6705883, 1,
1.218696, 0.3359632, 1.453958, 1, 0, 0.6666667, 1,
1.219602, 0.04302019, 1.658686, 1, 0, 0.6588235, 1,
1.23412, 0.09204835, 0.6692614, 1, 0, 0.654902, 1,
1.24474, -0.6221063, 1.435667, 1, 0, 0.6470588, 1,
1.246007, -0.7137167, 2.103196, 1, 0, 0.6431373, 1,
1.248831, 0.0225906, 2.073117, 1, 0, 0.6352941, 1,
1.251828, -0.8840388, 0.8202172, 1, 0, 0.6313726, 1,
1.274906, 2.526613, 0.8654517, 1, 0, 0.6235294, 1,
1.275726, -1.406188, 2.999263, 1, 0, 0.6196079, 1,
1.280407, 0.3012407, 0.692036, 1, 0, 0.6117647, 1,
1.280621, -1.021617, 1.45247, 1, 0, 0.6078432, 1,
1.288188, 0.2161283, 1.490813, 1, 0, 0.6, 1,
1.292642, -1.437041, 1.775919, 1, 0, 0.5921569, 1,
1.301187, -2.045448, 0.9372752, 1, 0, 0.5882353, 1,
1.303867, 0.830707, 1.739668, 1, 0, 0.5803922, 1,
1.305187, -0.3147196, 0.8932692, 1, 0, 0.5764706, 1,
1.308815, 1.376869, 1.458548, 1, 0, 0.5686275, 1,
1.316122, -1.104877, 3.440053, 1, 0, 0.5647059, 1,
1.319007, -0.07860581, 2.014742, 1, 0, 0.5568628, 1,
1.321895, 0.04686422, 1.150194, 1, 0, 0.5529412, 1,
1.330894, 0.8767224, 0.6288911, 1, 0, 0.5450981, 1,
1.331349, 0.2463827, -0.2831982, 1, 0, 0.5411765, 1,
1.334744, -0.9028316, 3.050218, 1, 0, 0.5333334, 1,
1.335363, 2.558686, -1.220703, 1, 0, 0.5294118, 1,
1.353678, -1.580773, 3.06552, 1, 0, 0.5215687, 1,
1.367234, -0.1782979, 1.888664, 1, 0, 0.5176471, 1,
1.367724, 0.02550811, 2.901982, 1, 0, 0.509804, 1,
1.370045, -0.3815933, 0.6532895, 1, 0, 0.5058824, 1,
1.383856, -0.2298382, 2.001037, 1, 0, 0.4980392, 1,
1.390188, 0.4024998, 0.2933241, 1, 0, 0.4901961, 1,
1.391858, 0.3087536, 0.5583395, 1, 0, 0.4862745, 1,
1.396927, -0.8196779, 3.025774, 1, 0, 0.4784314, 1,
1.401545, -1.917934, 3.243705, 1, 0, 0.4745098, 1,
1.407222, 0.4691687, 0.7919429, 1, 0, 0.4666667, 1,
1.441204, -0.425451, 2.170339, 1, 0, 0.4627451, 1,
1.444045, 0.3579129, 1.405435, 1, 0, 0.454902, 1,
1.4676, -0.8835356, 2.873442, 1, 0, 0.4509804, 1,
1.481225, -0.75306, 2.385923, 1, 0, 0.4431373, 1,
1.484146, -0.4027058, -0.1459617, 1, 0, 0.4392157, 1,
1.494684, -2.182499, 2.045231, 1, 0, 0.4313726, 1,
1.511339, 0.45608, 1.602179, 1, 0, 0.427451, 1,
1.516166, 1.233471, 1.552919, 1, 0, 0.4196078, 1,
1.52088, -0.4328327, 0.710353, 1, 0, 0.4156863, 1,
1.532002, 0.7815226, 1.567295, 1, 0, 0.4078431, 1,
1.533597, 1.764236, -0.393208, 1, 0, 0.4039216, 1,
1.541837, -0.3319201, 2.319276, 1, 0, 0.3960784, 1,
1.542382, -1.771247, 1.963198, 1, 0, 0.3882353, 1,
1.543388, 0.4840135, 1.030227, 1, 0, 0.3843137, 1,
1.553773, 1.68874, 1.795497, 1, 0, 0.3764706, 1,
1.561837, 1.249809, 0.7115678, 1, 0, 0.372549, 1,
1.570787, -1.419056, 4.901364, 1, 0, 0.3647059, 1,
1.57253, -0.9649838, 2.431913, 1, 0, 0.3607843, 1,
1.585584, 0.9632859, 0.5408683, 1, 0, 0.3529412, 1,
1.585757, -0.2208738, 1.486396, 1, 0, 0.3490196, 1,
1.592108, -0.0183132, 1.987417, 1, 0, 0.3411765, 1,
1.596093, -0.2975346, 3.640731, 1, 0, 0.3372549, 1,
1.635495, 0.004006431, 0.5088179, 1, 0, 0.3294118, 1,
1.652477, -0.9785168, 2.326625, 1, 0, 0.3254902, 1,
1.665011, 0.8245574, 0.7848843, 1, 0, 0.3176471, 1,
1.666086, 1.112121, 3.20255, 1, 0, 0.3137255, 1,
1.671602, -0.2003773, 1.799295, 1, 0, 0.3058824, 1,
1.67723, 0.6315479, -0.1461927, 1, 0, 0.2980392, 1,
1.687523, 0.4683555, 1.948571, 1, 0, 0.2941177, 1,
1.6901, 1.410317, -0.1727969, 1, 0, 0.2862745, 1,
1.692278, 0.8928323, 1.502784, 1, 0, 0.282353, 1,
1.705088, -0.2523906, 1.733583, 1, 0, 0.2745098, 1,
1.712284, 0.7385934, 1.241958, 1, 0, 0.2705882, 1,
1.720419, 0.07233905, 0.05202666, 1, 0, 0.2627451, 1,
1.727018, -0.8822091, 1.735981, 1, 0, 0.2588235, 1,
1.732724, 0.5734574, -0.5432177, 1, 0, 0.2509804, 1,
1.739264, -1.146525, 2.427638, 1, 0, 0.2470588, 1,
1.744264, 0.2008359, 2.740108, 1, 0, 0.2392157, 1,
1.758725, 0.2488116, -0.07781453, 1, 0, 0.2352941, 1,
1.769033, 0.1298906, 2.735424, 1, 0, 0.227451, 1,
1.773717, 0.8683887, 2.238004, 1, 0, 0.2235294, 1,
1.776209, -0.5272936, 1.519941, 1, 0, 0.2156863, 1,
1.810309, 1.340084, 0.2446237, 1, 0, 0.2117647, 1,
1.828906, 0.6345232, 3.38561, 1, 0, 0.2039216, 1,
1.829388, -0.8763291, 3.424681, 1, 0, 0.1960784, 1,
1.834739, -0.3041396, 2.619531, 1, 0, 0.1921569, 1,
1.863035, 0.1698136, -0.3017264, 1, 0, 0.1843137, 1,
1.901929, 1.091483, 2.120925, 1, 0, 0.1803922, 1,
1.910042, -0.662689, 2.157887, 1, 0, 0.172549, 1,
1.918079, -0.6599201, 1.686584, 1, 0, 0.1686275, 1,
1.93609, 0.4064151, 3.053044, 1, 0, 0.1607843, 1,
1.942985, 0.004398605, 2.950308, 1, 0, 0.1568628, 1,
1.964545, -2.525414, 2.878012, 1, 0, 0.1490196, 1,
1.965501, 0.6748283, 1.26106, 1, 0, 0.145098, 1,
1.967526, -0.2656881, 2.417031, 1, 0, 0.1372549, 1,
1.993992, -0.1224816, 0.5799873, 1, 0, 0.1333333, 1,
2.007472, 1.823943, 1.819483, 1, 0, 0.1254902, 1,
2.01812, -0.8637577, 0.7646099, 1, 0, 0.1215686, 1,
2.020567, 0.1066317, 2.53179, 1, 0, 0.1137255, 1,
2.068309, 1.274654, 1.598295, 1, 0, 0.1098039, 1,
2.078159, 0.2340882, 2.573514, 1, 0, 0.1019608, 1,
2.08201, 2.05815, 0.5647141, 1, 0, 0.09411765, 1,
2.119409, -0.796903, 2.801916, 1, 0, 0.09019608, 1,
2.177163, 1.7108, 2.069097, 1, 0, 0.08235294, 1,
2.233718, 0.4478712, 1.34223, 1, 0, 0.07843138, 1,
2.235527, -0.36608, 0.6229754, 1, 0, 0.07058824, 1,
2.242831, 0.2748213, 0.5168707, 1, 0, 0.06666667, 1,
2.246156, 0.2954955, 1.877081, 1, 0, 0.05882353, 1,
2.300655, 1.25208, 0.4170232, 1, 0, 0.05490196, 1,
2.394426, -0.07899028, 1.565757, 1, 0, 0.04705882, 1,
2.448393, -0.9374055, 2.693386, 1, 0, 0.04313726, 1,
2.554295, 0.649911, 2.259822, 1, 0, 0.03529412, 1,
2.624604, -0.3551201, 2.933622, 1, 0, 0.03137255, 1,
2.635742, 0.8450196, 0.7191541, 1, 0, 0.02352941, 1,
2.77934, 1.797442, 0.5474475, 1, 0, 0.01960784, 1,
2.892008, 2.160585, 0.2115714, 1, 0, 0.01176471, 1,
2.97824, 0.08381837, 1.480255, 1, 0, 0.007843138, 1
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
-0.2967807, -3.581279, -7.331372, 0, -0.5, 0.5, 0.5,
-0.2967807, -3.581279, -7.331372, 1, -0.5, 0.5, 0.5,
-0.2967807, -3.581279, -7.331372, 1, 1.5, 0.5, 0.5,
-0.2967807, -3.581279, -7.331372, 0, 1.5, 0.5, 0.5
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
-4.682034, -0.04311156, -7.331372, 0, -0.5, 0.5, 0.5,
-4.682034, -0.04311156, -7.331372, 1, -0.5, 0.5, 0.5,
-4.682034, -0.04311156, -7.331372, 1, 1.5, 0.5, 0.5,
-4.682034, -0.04311156, -7.331372, 0, 1.5, 0.5, 0.5
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
-4.682034, -3.581279, 0.6047115, 0, -0.5, 0.5, 0.5,
-4.682034, -3.581279, 0.6047115, 1, -0.5, 0.5, 0.5,
-4.682034, -3.581279, 0.6047115, 1, 1.5, 0.5, 0.5,
-4.682034, -3.581279, 0.6047115, 0, 1.5, 0.5, 0.5
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
-3, -2.764779, -5.499969,
2, -2.764779, -5.499969,
-3, -2.764779, -5.499969,
-3, -2.900862, -5.805202,
-2, -2.764779, -5.499969,
-2, -2.900862, -5.805202,
-1, -2.764779, -5.499969,
-1, -2.900862, -5.805202,
0, -2.764779, -5.499969,
0, -2.900862, -5.805202,
1, -2.764779, -5.499969,
1, -2.900862, -5.805202,
2, -2.764779, -5.499969,
2, -2.900862, -5.805202
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
-3, -3.173029, -6.41567, 0, -0.5, 0.5, 0.5,
-3, -3.173029, -6.41567, 1, -0.5, 0.5, 0.5,
-3, -3.173029, -6.41567, 1, 1.5, 0.5, 0.5,
-3, -3.173029, -6.41567, 0, 1.5, 0.5, 0.5,
-2, -3.173029, -6.41567, 0, -0.5, 0.5, 0.5,
-2, -3.173029, -6.41567, 1, -0.5, 0.5, 0.5,
-2, -3.173029, -6.41567, 1, 1.5, 0.5, 0.5,
-2, -3.173029, -6.41567, 0, 1.5, 0.5, 0.5,
-1, -3.173029, -6.41567, 0, -0.5, 0.5, 0.5,
-1, -3.173029, -6.41567, 1, -0.5, 0.5, 0.5,
-1, -3.173029, -6.41567, 1, 1.5, 0.5, 0.5,
-1, -3.173029, -6.41567, 0, 1.5, 0.5, 0.5,
0, -3.173029, -6.41567, 0, -0.5, 0.5, 0.5,
0, -3.173029, -6.41567, 1, -0.5, 0.5, 0.5,
0, -3.173029, -6.41567, 1, 1.5, 0.5, 0.5,
0, -3.173029, -6.41567, 0, 1.5, 0.5, 0.5,
1, -3.173029, -6.41567, 0, -0.5, 0.5, 0.5,
1, -3.173029, -6.41567, 1, -0.5, 0.5, 0.5,
1, -3.173029, -6.41567, 1, 1.5, 0.5, 0.5,
1, -3.173029, -6.41567, 0, 1.5, 0.5, 0.5,
2, -3.173029, -6.41567, 0, -0.5, 0.5, 0.5,
2, -3.173029, -6.41567, 1, -0.5, 0.5, 0.5,
2, -3.173029, -6.41567, 1, 1.5, 0.5, 0.5,
2, -3.173029, -6.41567, 0, 1.5, 0.5, 0.5
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
-3.670053, -2, -5.499969,
-3.670053, 2, -5.499969,
-3.670053, -2, -5.499969,
-3.838716, -2, -5.805202,
-3.670053, -1, -5.499969,
-3.838716, -1, -5.805202,
-3.670053, 0, -5.499969,
-3.838716, 0, -5.805202,
-3.670053, 1, -5.499969,
-3.838716, 1, -5.805202,
-3.670053, 2, -5.499969,
-3.838716, 2, -5.805202
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
-4.176044, -2, -6.41567, 0, -0.5, 0.5, 0.5,
-4.176044, -2, -6.41567, 1, -0.5, 0.5, 0.5,
-4.176044, -2, -6.41567, 1, 1.5, 0.5, 0.5,
-4.176044, -2, -6.41567, 0, 1.5, 0.5, 0.5,
-4.176044, -1, -6.41567, 0, -0.5, 0.5, 0.5,
-4.176044, -1, -6.41567, 1, -0.5, 0.5, 0.5,
-4.176044, -1, -6.41567, 1, 1.5, 0.5, 0.5,
-4.176044, -1, -6.41567, 0, 1.5, 0.5, 0.5,
-4.176044, 0, -6.41567, 0, -0.5, 0.5, 0.5,
-4.176044, 0, -6.41567, 1, -0.5, 0.5, 0.5,
-4.176044, 0, -6.41567, 1, 1.5, 0.5, 0.5,
-4.176044, 0, -6.41567, 0, 1.5, 0.5, 0.5,
-4.176044, 1, -6.41567, 0, -0.5, 0.5, 0.5,
-4.176044, 1, -6.41567, 1, -0.5, 0.5, 0.5,
-4.176044, 1, -6.41567, 1, 1.5, 0.5, 0.5,
-4.176044, 1, -6.41567, 0, 1.5, 0.5, 0.5,
-4.176044, 2, -6.41567, 0, -0.5, 0.5, 0.5,
-4.176044, 2, -6.41567, 1, -0.5, 0.5, 0.5,
-4.176044, 2, -6.41567, 1, 1.5, 0.5, 0.5,
-4.176044, 2, -6.41567, 0, 1.5, 0.5, 0.5
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
-3.670053, -2.764779, -4,
-3.670053, -2.764779, 6,
-3.670053, -2.764779, -4,
-3.838716, -2.900862, -4,
-3.670053, -2.764779, -2,
-3.838716, -2.900862, -2,
-3.670053, -2.764779, 0,
-3.838716, -2.900862, 0,
-3.670053, -2.764779, 2,
-3.838716, -2.900862, 2,
-3.670053, -2.764779, 4,
-3.838716, -2.900862, 4,
-3.670053, -2.764779, 6,
-3.838716, -2.900862, 6
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
-4.176044, -3.173029, -4, 0, -0.5, 0.5, 0.5,
-4.176044, -3.173029, -4, 1, -0.5, 0.5, 0.5,
-4.176044, -3.173029, -4, 1, 1.5, 0.5, 0.5,
-4.176044, -3.173029, -4, 0, 1.5, 0.5, 0.5,
-4.176044, -3.173029, -2, 0, -0.5, 0.5, 0.5,
-4.176044, -3.173029, -2, 1, -0.5, 0.5, 0.5,
-4.176044, -3.173029, -2, 1, 1.5, 0.5, 0.5,
-4.176044, -3.173029, -2, 0, 1.5, 0.5, 0.5,
-4.176044, -3.173029, 0, 0, -0.5, 0.5, 0.5,
-4.176044, -3.173029, 0, 1, -0.5, 0.5, 0.5,
-4.176044, -3.173029, 0, 1, 1.5, 0.5, 0.5,
-4.176044, -3.173029, 0, 0, 1.5, 0.5, 0.5,
-4.176044, -3.173029, 2, 0, -0.5, 0.5, 0.5,
-4.176044, -3.173029, 2, 1, -0.5, 0.5, 0.5,
-4.176044, -3.173029, 2, 1, 1.5, 0.5, 0.5,
-4.176044, -3.173029, 2, 0, 1.5, 0.5, 0.5,
-4.176044, -3.173029, 4, 0, -0.5, 0.5, 0.5,
-4.176044, -3.173029, 4, 1, -0.5, 0.5, 0.5,
-4.176044, -3.173029, 4, 1, 1.5, 0.5, 0.5,
-4.176044, -3.173029, 4, 0, 1.5, 0.5, 0.5,
-4.176044, -3.173029, 6, 0, -0.5, 0.5, 0.5,
-4.176044, -3.173029, 6, 1, -0.5, 0.5, 0.5,
-4.176044, -3.173029, 6, 1, 1.5, 0.5, 0.5,
-4.176044, -3.173029, 6, 0, 1.5, 0.5, 0.5
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
-3.670053, -2.764779, -5.499969,
-3.670053, 2.678555, -5.499969,
-3.670053, -2.764779, 6.709392,
-3.670053, 2.678555, 6.709392,
-3.670053, -2.764779, -5.499969,
-3.670053, -2.764779, 6.709392,
-3.670053, 2.678555, -5.499969,
-3.670053, 2.678555, 6.709392,
-3.670053, -2.764779, -5.499969,
3.076491, -2.764779, -5.499969,
-3.670053, -2.764779, 6.709392,
3.076491, -2.764779, 6.709392,
-3.670053, 2.678555, -5.499969,
3.076491, 2.678555, -5.499969,
-3.670053, 2.678555, 6.709392,
3.076491, 2.678555, 6.709392,
3.076491, -2.764779, -5.499969,
3.076491, 2.678555, -5.499969,
3.076491, -2.764779, 6.709392,
3.076491, 2.678555, 6.709392,
3.076491, -2.764779, -5.499969,
3.076491, -2.764779, 6.709392,
3.076491, 2.678555, -5.499969,
3.076491, 2.678555, 6.709392
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
var radius = 7.99571;
var distance = 35.57381;
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
mvMatrix.translate( 0.2967807, 0.04311156, -0.6047115 );
mvMatrix.scale( 1.281414, 1.588203, 0.708073 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.57381);
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
Dialifor<-read.table("Dialifor.xyz")
```

```
## Error in read.table("Dialifor.xyz"): no lines available in input
```

```r
x<-Dialifor$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dialifor' not found
```

```r
y<-Dialifor$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dialifor' not found
```

```r
z<-Dialifor$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dialifor' not found
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
-3.571802, 1.278084, -2.143137, 0, 0, 1, 1, 1,
-2.801689, 1.286211, 0.2285579, 1, 0, 0, 1, 1,
-2.726281, 0.4933689, -0.8908572, 1, 0, 0, 1, 1,
-2.597202, 0.4253609, -0.6975423, 1, 0, 0, 1, 1,
-2.369081, -0.7325088, -3.422535, 1, 0, 0, 1, 1,
-2.361405, 2.035265, -0.5092003, 1, 0, 0, 1, 1,
-2.345603, 0.7206523, -2.39803, 0, 0, 0, 1, 1,
-2.332891, 0.5240422, -2.298647, 0, 0, 0, 1, 1,
-2.268737, 0.3409066, -2.158901, 0, 0, 0, 1, 1,
-2.239996, 0.1536758, -1.518905, 0, 0, 0, 1, 1,
-2.173209, 1.38187, -1.76694, 0, 0, 0, 1, 1,
-2.107532, -0.6395477, -1.191182, 0, 0, 0, 1, 1,
-2.065758, -0.2859367, -1.949823, 0, 0, 0, 1, 1,
-2.057862, 1.708011, -0.1167251, 1, 1, 1, 1, 1,
-2.050043, 0.4526084, -1.406218, 1, 1, 1, 1, 1,
-2.048186, 0.2343175, 0.7347214, 1, 1, 1, 1, 1,
-2.026456, -0.4095012, -3.376839, 1, 1, 1, 1, 1,
-2.015636, 1.759033, -2.377984, 1, 1, 1, 1, 1,
-1.993404, 0.2075415, -2.277974, 1, 1, 1, 1, 1,
-1.915081, -0.932581, -2.542104, 1, 1, 1, 1, 1,
-1.880459, 0.420518, -1.410875, 1, 1, 1, 1, 1,
-1.858568, -0.05643838, -1.619655, 1, 1, 1, 1, 1,
-1.825838, 0.2252347, -1.98326, 1, 1, 1, 1, 1,
-1.825005, -0.02232829, -1.196445, 1, 1, 1, 1, 1,
-1.814301, -1.368324, -1.995114, 1, 1, 1, 1, 1,
-1.808261, 0.7532356, -1.499394, 1, 1, 1, 1, 1,
-1.803728, -0.2510485, -0.8201506, 1, 1, 1, 1, 1,
-1.783745, 0.1728309, -1.090496, 1, 1, 1, 1, 1,
-1.774587, -0.5475948, -2.453475, 0, 0, 1, 1, 1,
-1.768864, 0.8576911, -0.4898469, 1, 0, 0, 1, 1,
-1.736866, -1.311872, -1.646474, 1, 0, 0, 1, 1,
-1.711665, -1.046683, -0.8881252, 1, 0, 0, 1, 1,
-1.711592, -0.5636182, -2.008658, 1, 0, 0, 1, 1,
-1.700106, 0.486866, -1.305653, 1, 0, 0, 1, 1,
-1.690029, 0.6524261, -1.098787, 0, 0, 0, 1, 1,
-1.6627, 0.1980034, -1.017158, 0, 0, 0, 1, 1,
-1.660012, 0.01994666, -2.042586, 0, 0, 0, 1, 1,
-1.649229, 0.5760491, -2.244101, 0, 0, 0, 1, 1,
-1.640454, -0.006233487, -0.648132, 0, 0, 0, 1, 1,
-1.639707, 0.08037236, -4.75625, 0, 0, 0, 1, 1,
-1.626899, 0.2699714, -0.6325303, 0, 0, 0, 1, 1,
-1.622622, -0.1750179, -0.8240992, 1, 1, 1, 1, 1,
-1.618648, -0.4892018, -1.693117, 1, 1, 1, 1, 1,
-1.615654, -1.371486, -2.297222, 1, 1, 1, 1, 1,
-1.611858, 0.6577858, -0.5433966, 1, 1, 1, 1, 1,
-1.609233, 0.5754349, -0.6809209, 1, 1, 1, 1, 1,
-1.604498, 0.04236843, -2.339378, 1, 1, 1, 1, 1,
-1.597896, 1.253487, -1.424508, 1, 1, 1, 1, 1,
-1.595051, 0.3926772, -1.188847, 1, 1, 1, 1, 1,
-1.593986, -1.256422, -0.2903634, 1, 1, 1, 1, 1,
-1.58749, 0.1656926, -1.663573, 1, 1, 1, 1, 1,
-1.583527, -2.284119, -3.85708, 1, 1, 1, 1, 1,
-1.573115, 0.693491, -1.973881, 1, 1, 1, 1, 1,
-1.567143, -1.039986, -1.581424, 1, 1, 1, 1, 1,
-1.559598, 1.248223, -0.3055366, 1, 1, 1, 1, 1,
-1.529342, 1.48103, -0.2196572, 1, 1, 1, 1, 1,
-1.528734, 0.8948134, 0.2828378, 0, 0, 1, 1, 1,
-1.527401, 0.5665478, -1.579188, 1, 0, 0, 1, 1,
-1.515988, 0.5768701, -1.341576, 1, 0, 0, 1, 1,
-1.512936, -0.3508833, -1.672573, 1, 0, 0, 1, 1,
-1.507314, -1.154048, -2.749527, 1, 0, 0, 1, 1,
-1.505894, 0.4040877, -2.054494, 1, 0, 0, 1, 1,
-1.484601, 2.009009, -0.9192261, 0, 0, 0, 1, 1,
-1.48194, 0.6840851, -0.5734255, 0, 0, 0, 1, 1,
-1.472134, 2.007713, 0.6156551, 0, 0, 0, 1, 1,
-1.468544, 0.6764364, -2.815965, 0, 0, 0, 1, 1,
-1.465333, -0.05354221, -1.224011, 0, 0, 0, 1, 1,
-1.464986, 1.153896, 0.272772, 0, 0, 0, 1, 1,
-1.455109, 0.04808414, -1.066658, 0, 0, 0, 1, 1,
-1.431262, -0.3100495, -3.175518, 1, 1, 1, 1, 1,
-1.420412, -0.5215612, 0.1285583, 1, 1, 1, 1, 1,
-1.409148, 0.2650051, 0.0004695373, 1, 1, 1, 1, 1,
-1.404044, -1.130915, -1.805889, 1, 1, 1, 1, 1,
-1.397072, -0.45414, -0.2899031, 1, 1, 1, 1, 1,
-1.397008, 0.3977801, -0.6930234, 1, 1, 1, 1, 1,
-1.38111, -0.5740788, -2.450126, 1, 1, 1, 1, 1,
-1.374531, -1.11025, -0.4933414, 1, 1, 1, 1, 1,
-1.371515, -1.310499, -1.858692, 1, 1, 1, 1, 1,
-1.369292, 1.466232, 0.2453882, 1, 1, 1, 1, 1,
-1.368544, 0.4584708, -1.651332, 1, 1, 1, 1, 1,
-1.364256, 0.04752981, -2.759648, 1, 1, 1, 1, 1,
-1.355743, 0.523945, -2.759852, 1, 1, 1, 1, 1,
-1.339666, -1.789057, -2.073191, 1, 1, 1, 1, 1,
-1.325575, -1.433019, -3.859298, 1, 1, 1, 1, 1,
-1.32056, -0.7548614, -0.3894674, 0, 0, 1, 1, 1,
-1.307337, -0.5951799, -2.443081, 1, 0, 0, 1, 1,
-1.301687, 0.3979743, -2.556307, 1, 0, 0, 1, 1,
-1.297558, 1.10932, -1.472056, 1, 0, 0, 1, 1,
-1.286476, -0.4608502, -2.33883, 1, 0, 0, 1, 1,
-1.283424, -0.7320407, -3.52894, 1, 0, 0, 1, 1,
-1.278445, -0.5188341, -1.816714, 0, 0, 0, 1, 1,
-1.276148, 1.343073, -1.632876, 0, 0, 0, 1, 1,
-1.274198, -0.9908624, -1.910997, 0, 0, 0, 1, 1,
-1.262887, -2.139235, -0.7916616, 0, 0, 0, 1, 1,
-1.261178, 0.01201067, -1.156041, 0, 0, 0, 1, 1,
-1.258688, 0.06952845, -3.694086, 0, 0, 0, 1, 1,
-1.257719, 0.2353025, -0.5145201, 0, 0, 0, 1, 1,
-1.256969, -0.1866323, -0.9757758, 1, 1, 1, 1, 1,
-1.254678, -0.06228638, -0.09947628, 1, 1, 1, 1, 1,
-1.253735, 1.297188, -1.918951, 1, 1, 1, 1, 1,
-1.249398, -0.4479187, -0.9641578, 1, 1, 1, 1, 1,
-1.244395, 1.371545, 1.546924, 1, 1, 1, 1, 1,
-1.229532, 1.523436, 0.3818659, 1, 1, 1, 1, 1,
-1.22732, 0.1329749, -2.271005, 1, 1, 1, 1, 1,
-1.227138, 2.104505, 0.5242646, 1, 1, 1, 1, 1,
-1.216015, -1.582152, -3.261626, 1, 1, 1, 1, 1,
-1.210474, -0.3964408, -2.104057, 1, 1, 1, 1, 1,
-1.20395, -0.2146868, -3.075543, 1, 1, 1, 1, 1,
-1.203194, 0.4963741, -0.9484714, 1, 1, 1, 1, 1,
-1.202608, 2.341289, -0.09080315, 1, 1, 1, 1, 1,
-1.185993, 0.6811903, -1.950584, 1, 1, 1, 1, 1,
-1.184122, 0.4552604, -1.618267, 1, 1, 1, 1, 1,
-1.18301, 1.660008, -1.904948, 0, 0, 1, 1, 1,
-1.180986, -1.417658, -1.069203, 1, 0, 0, 1, 1,
-1.173312, 1.330281, 1.109986, 1, 0, 0, 1, 1,
-1.170753, -0.07196068, -0.9522315, 1, 0, 0, 1, 1,
-1.169135, 0.5266204, -1.515454, 1, 0, 0, 1, 1,
-1.162963, -1.454227, -2.919385, 1, 0, 0, 1, 1,
-1.162224, -0.1492569, -0.8194651, 0, 0, 0, 1, 1,
-1.158715, 1.171473, -1.816797, 0, 0, 0, 1, 1,
-1.156498, -0.04251671, -2.784251, 0, 0, 0, 1, 1,
-1.155475, -0.6435352, -2.105023, 0, 0, 0, 1, 1,
-1.154755, -0.3521658, -1.071284, 0, 0, 0, 1, 1,
-1.144139, 0.801846, -1.509307, 0, 0, 0, 1, 1,
-1.143787, 1.071824, -0.4977219, 0, 0, 0, 1, 1,
-1.142871, 0.6536315, -1.550608, 1, 1, 1, 1, 1,
-1.138753, 1.196347, -1.658452, 1, 1, 1, 1, 1,
-1.134199, 0.1072925, -0.804283, 1, 1, 1, 1, 1,
-1.124175, -1.148211, -1.57565, 1, 1, 1, 1, 1,
-1.121, -0.2177899, -2.865897, 1, 1, 1, 1, 1,
-1.114831, -0.45561, -1.523707, 1, 1, 1, 1, 1,
-1.114725, 0.6698432, -0.8367041, 1, 1, 1, 1, 1,
-1.112561, -0.003879652, 0.3153523, 1, 1, 1, 1, 1,
-1.108796, 0.8834274, -0.8594318, 1, 1, 1, 1, 1,
-1.107311, 0.3359745, -0.4379108, 1, 1, 1, 1, 1,
-1.09305, 0.3921878, 0.4788669, 1, 1, 1, 1, 1,
-1.092167, 2.245468, -0.8249354, 1, 1, 1, 1, 1,
-1.088093, -0.1429492, -3.918618, 1, 1, 1, 1, 1,
-1.086599, 0.3578068, -0.701075, 1, 1, 1, 1, 1,
-1.085991, 1.6065, -1.262773, 1, 1, 1, 1, 1,
-1.081713, 1.250747, 0.3080477, 0, 0, 1, 1, 1,
-1.081534, -0.1624913, -0.6484299, 1, 0, 0, 1, 1,
-1.078457, -0.2357018, -0.80231, 1, 0, 0, 1, 1,
-1.073647, 1.033109, -1.448285, 1, 0, 0, 1, 1,
-1.067098, 1.180099, -3.278752, 1, 0, 0, 1, 1,
-1.061429, -0.4243649, -1.85535, 1, 0, 0, 1, 1,
-1.060094, -1.188619, -1.196483, 0, 0, 0, 1, 1,
-1.052577, 0.7123968, 0.9480822, 0, 0, 0, 1, 1,
-1.051214, 1.387525, -1.586302, 0, 0, 0, 1, 1,
-1.047241, -0.9155465, -1.058873, 0, 0, 0, 1, 1,
-1.028252, 0.3885136, -1.542098, 0, 0, 0, 1, 1,
-1.025536, -0.8495276, -3.397545, 0, 0, 0, 1, 1,
-1.024485, -0.49255, -0.9089921, 0, 0, 0, 1, 1,
-1.0215, 0.1674863, -1.124264, 1, 1, 1, 1, 1,
-1.017754, -0.5659498, -0.139901, 1, 1, 1, 1, 1,
-1.014884, -2.48475, -1.663915, 1, 1, 1, 1, 1,
-1.013389, -0.7768244, -2.072878, 1, 1, 1, 1, 1,
-1.012137, -0.2768192, -2.482104, 1, 1, 1, 1, 1,
-1.005986, -0.1399258, -1.976547, 1, 1, 1, 1, 1,
-1.005538, 0.6392503, -1.228074, 1, 1, 1, 1, 1,
-1.002501, 0.1378689, -0.4135778, 1, 1, 1, 1, 1,
-0.9967496, 1.433582, -0.7395895, 1, 1, 1, 1, 1,
-0.9944316, -0.3270702, -1.769528, 1, 1, 1, 1, 1,
-0.9920716, 0.6815861, -1.215037, 1, 1, 1, 1, 1,
-0.986087, 0.376948, -0.5848314, 1, 1, 1, 1, 1,
-0.9781539, -1.438035, -4.288571, 1, 1, 1, 1, 1,
-0.9698691, -0.00709626, -0.8823711, 1, 1, 1, 1, 1,
-0.9683349, 0.4168907, -1.687548, 1, 1, 1, 1, 1,
-0.967416, -0.8448381, -1.701506, 0, 0, 1, 1, 1,
-0.9673179, -0.3132208, -1.691253, 1, 0, 0, 1, 1,
-0.9644867, -0.9263241, -1.858887, 1, 0, 0, 1, 1,
-0.9601167, 0.7330623, -1.674101, 1, 0, 0, 1, 1,
-0.9572346, -0.2778242, -1.345671, 1, 0, 0, 1, 1,
-0.9507551, 0.3123521, -2.84049, 1, 0, 0, 1, 1,
-0.9482334, -1.007403, -2.72184, 0, 0, 0, 1, 1,
-0.9385735, 0.6693702, -0.6175792, 0, 0, 0, 1, 1,
-0.9344977, 1.410282, -0.5938036, 0, 0, 0, 1, 1,
-0.9327894, -0.977479, -3.435395, 0, 0, 0, 1, 1,
-0.9277785, -0.2010294, -2.049866, 0, 0, 0, 1, 1,
-0.9266268, 2.485442, 1.557732, 0, 0, 0, 1, 1,
-0.9238958, 0.2345488, -0.790288, 0, 0, 0, 1, 1,
-0.9136829, -1.173377, -2.385542, 1, 1, 1, 1, 1,
-0.9118938, -0.2973914, -2.940476, 1, 1, 1, 1, 1,
-0.9075531, -0.2763038, -2.417458, 1, 1, 1, 1, 1,
-0.90561, 1.610672, 0.7631006, 1, 1, 1, 1, 1,
-0.8954825, -0.2942076, -1.988127, 1, 1, 1, 1, 1,
-0.8902883, -0.1154627, -1.326698, 1, 1, 1, 1, 1,
-0.8854941, -0.4430291, -3.376678, 1, 1, 1, 1, 1,
-0.8776625, 0.3493792, -1.184934, 1, 1, 1, 1, 1,
-0.8756459, 0.7233177, -0.3399099, 1, 1, 1, 1, 1,
-0.8681641, 0.6695206, -0.9793943, 1, 1, 1, 1, 1,
-0.8668624, -0.6864463, -1.662297, 1, 1, 1, 1, 1,
-0.8668223, 0.7984555, -1.096751, 1, 1, 1, 1, 1,
-0.8596136, 0.5149935, -1.243044, 1, 1, 1, 1, 1,
-0.8590494, -0.5643158, -3.392205, 1, 1, 1, 1, 1,
-0.8589767, -0.5560748, -2.550213, 1, 1, 1, 1, 1,
-0.8536365, -1.230951, -3.996837, 0, 0, 1, 1, 1,
-0.846144, 0.710756, -2.845007, 1, 0, 0, 1, 1,
-0.8412365, 0.2165527, -0.910611, 1, 0, 0, 1, 1,
-0.841177, -1.109479, -2.128116, 1, 0, 0, 1, 1,
-0.8277932, -0.1412071, -2.329741, 1, 0, 0, 1, 1,
-0.8277377, 0.211758, -0.08994938, 1, 0, 0, 1, 1,
-0.8243227, 0.1964809, -0.9696249, 0, 0, 0, 1, 1,
-0.8229792, -1.761797, -1.926597, 0, 0, 0, 1, 1,
-0.821809, 0.2876438, -2.525583, 0, 0, 0, 1, 1,
-0.8217354, 0.4136532, -1.984714, 0, 0, 0, 1, 1,
-0.8113804, -0.7784653, -2.223308, 0, 0, 0, 1, 1,
-0.8099905, -0.8456221, -2.263721, 0, 0, 0, 1, 1,
-0.8097381, 0.1426415, -1.378439, 0, 0, 0, 1, 1,
-0.8081085, -0.7272189, -3.641334, 1, 1, 1, 1, 1,
-0.8069917, 1.556332, -2.010865, 1, 1, 1, 1, 1,
-0.8045991, 0.2366367, -2.078252, 1, 1, 1, 1, 1,
-0.8008448, 1.422033, -1.556191, 1, 1, 1, 1, 1,
-0.7982218, -1.143322, -1.312092, 1, 1, 1, 1, 1,
-0.7967896, 1.660324, -1.429444, 1, 1, 1, 1, 1,
-0.7941234, -0.7752569, -2.005698, 1, 1, 1, 1, 1,
-0.7903661, -0.6251748, -1.805712, 1, 1, 1, 1, 1,
-0.7856826, 1.127512, -2.489912, 1, 1, 1, 1, 1,
-0.7783467, 0.444288, -0.3506679, 1, 1, 1, 1, 1,
-0.7708841, 1.619085, 0.9225571, 1, 1, 1, 1, 1,
-0.7671012, 0.5299335, -2.681587, 1, 1, 1, 1, 1,
-0.7658477, 1.462828, 3.329296, 1, 1, 1, 1, 1,
-0.7648724, -1.004539, -1.682982, 1, 1, 1, 1, 1,
-0.7623374, -0.6411369, -1.17769, 1, 1, 1, 1, 1,
-0.7606652, 0.8115467, 0.5582541, 0, 0, 1, 1, 1,
-0.7573149, -0.2265615, -2.576484, 1, 0, 0, 1, 1,
-0.7490218, -0.240497, -1.152515, 1, 0, 0, 1, 1,
-0.7368687, -1.662126, -1.392164, 1, 0, 0, 1, 1,
-0.7365139, 2.045005, -0.8724307, 1, 0, 0, 1, 1,
-0.7278644, -0.6846595, -3.43194, 1, 0, 0, 1, 1,
-0.7276051, -0.4939126, -2.69641, 0, 0, 0, 1, 1,
-0.7248024, 1.003018, -1.215614, 0, 0, 0, 1, 1,
-0.7234362, -1.007562, -1.238784, 0, 0, 0, 1, 1,
-0.7220721, -0.4253016, -1.314525, 0, 0, 0, 1, 1,
-0.7189285, 0.6903725, -2.672048, 0, 0, 0, 1, 1,
-0.7176608, 0.08715027, -2.41504, 0, 0, 0, 1, 1,
-0.7169302, 0.8969701, 0.701267, 0, 0, 0, 1, 1,
-0.7158919, 0.5504397, -1.201108, 1, 1, 1, 1, 1,
-0.7085061, 0.1547357, -2.239585, 1, 1, 1, 1, 1,
-0.7046105, -2.39887, -3.717038, 1, 1, 1, 1, 1,
-0.7034975, 1.532363, 0.05252638, 1, 1, 1, 1, 1,
-0.701552, 1.199639, -0.03875179, 1, 1, 1, 1, 1,
-0.7005094, -1.233702, -3.681117, 1, 1, 1, 1, 1,
-0.7002886, -0.4602623, -2.465743, 1, 1, 1, 1, 1,
-0.6971464, -0.935677, -2.12934, 1, 1, 1, 1, 1,
-0.6936457, 1.413462, -1.641933, 1, 1, 1, 1, 1,
-0.6906706, 0.8669535, 1.47573, 1, 1, 1, 1, 1,
-0.6804153, -1.030758, -2.545349, 1, 1, 1, 1, 1,
-0.6802426, 0.2473401, -1.151084, 1, 1, 1, 1, 1,
-0.6775009, 0.4650908, -1.638251, 1, 1, 1, 1, 1,
-0.6762853, 2.149216, -0.4831229, 1, 1, 1, 1, 1,
-0.6759741, 0.726823, -1.176066, 1, 1, 1, 1, 1,
-0.674578, -1.013005, -1.040802, 0, 0, 1, 1, 1,
-0.6678615, -0.5407044, -1.263946, 1, 0, 0, 1, 1,
-0.6619948, -0.01548622, -1.930773, 1, 0, 0, 1, 1,
-0.6613991, -0.03600281, -1.066007, 1, 0, 0, 1, 1,
-0.6613622, 1.196871, -1.50343, 1, 0, 0, 1, 1,
-0.6604731, -0.3607912, -1.853728, 1, 0, 0, 1, 1,
-0.6598784, 0.00679796, -1.060601, 0, 0, 0, 1, 1,
-0.6591107, 2.034581, 1.107446, 0, 0, 0, 1, 1,
-0.6575025, 0.8812325, 0.1244372, 0, 0, 0, 1, 1,
-0.6536211, -0.3358361, 0.3477078, 0, 0, 0, 1, 1,
-0.6510796, -1.740533, -0.70296, 0, 0, 0, 1, 1,
-0.6497114, 0.4747893, 0.1370954, 0, 0, 0, 1, 1,
-0.6495931, -0.3952926, -3.798193, 0, 0, 0, 1, 1,
-0.6463282, -1.882824, -2.63426, 1, 1, 1, 1, 1,
-0.6454937, -0.8973439, -2.156239, 1, 1, 1, 1, 1,
-0.6454114, 1.236515, -1.067964, 1, 1, 1, 1, 1,
-0.6445374, -1.777636, -2.004797, 1, 1, 1, 1, 1,
-0.6444675, -0.5623097, -2.756517, 1, 1, 1, 1, 1,
-0.6420782, 1.411152, 0.3035972, 1, 1, 1, 1, 1,
-0.6415628, -1.980138, -3.625108, 1, 1, 1, 1, 1,
-0.6352465, 1.016631, 0.2062691, 1, 1, 1, 1, 1,
-0.6185051, 0.5226225, 1.054005, 1, 1, 1, 1, 1,
-0.6126212, -0.5356172, -2.08551, 1, 1, 1, 1, 1,
-0.6104803, -1.584529, -5.170882, 1, 1, 1, 1, 1,
-0.5998908, 0.5122746, -1.779784, 1, 1, 1, 1, 1,
-0.5975409, 0.0579863, -1.38142, 1, 1, 1, 1, 1,
-0.59703, -0.08496014, -1.710535, 1, 1, 1, 1, 1,
-0.5967669, 0.3334096, -0.4642215, 1, 1, 1, 1, 1,
-0.594865, 1.313633, -0.5513746, 0, 0, 1, 1, 1,
-0.5884815, -0.5707223, -3.455396, 1, 0, 0, 1, 1,
-0.5816377, 0.6279281, -0.7914461, 1, 0, 0, 1, 1,
-0.5791641, -0.5099423, -3.87649, 1, 0, 0, 1, 1,
-0.5724875, -0.4042891, -2.100147, 1, 0, 0, 1, 1,
-0.5720733, -0.8659212, -2.707933, 1, 0, 0, 1, 1,
-0.568163, -1.070365, -2.559281, 0, 0, 0, 1, 1,
-0.5558075, -1.231465, -2.383463, 0, 0, 0, 1, 1,
-0.5493471, 1.235304, 0.5797929, 0, 0, 0, 1, 1,
-0.5473754, -0.3776262, -2.455899, 0, 0, 0, 1, 1,
-0.547313, -0.8390361, -1.51943, 0, 0, 0, 1, 1,
-0.5418894, 0.8610348, -0.916712, 0, 0, 0, 1, 1,
-0.5390212, -0.9983528, -3.059318, 0, 0, 0, 1, 1,
-0.5371248, 0.4194673, -1.74536, 1, 1, 1, 1, 1,
-0.5308938, 0.154216, -2.587613, 1, 1, 1, 1, 1,
-0.5296635, -0.1237867, -3.623739, 1, 1, 1, 1, 1,
-0.5282207, 1.392379, -0.481197, 1, 1, 1, 1, 1,
-0.5201104, 1.76465, 0.9202984, 1, 1, 1, 1, 1,
-0.5198606, 1.88273, -2.055447, 1, 1, 1, 1, 1,
-0.5173098, -0.0483943, -0.6047865, 1, 1, 1, 1, 1,
-0.5166605, -0.1324786, -2.317732, 1, 1, 1, 1, 1,
-0.5129152, 0.7866954, -1.053642, 1, 1, 1, 1, 1,
-0.5116362, -0.06841777, -2.721615, 1, 1, 1, 1, 1,
-0.5071598, 0.6419834, 1.700068, 1, 1, 1, 1, 1,
-0.5061216, -0.5178584, -1.353484, 1, 1, 1, 1, 1,
-0.5028365, -0.07844079, -1.886228, 1, 1, 1, 1, 1,
-0.5024549, 0.2423075, -1.497684, 1, 1, 1, 1, 1,
-0.4939473, 1.153163, -0.8984053, 1, 1, 1, 1, 1,
-0.4917097, 0.9088363, 0.4273726, 0, 0, 1, 1, 1,
-0.4906557, -0.5444056, -1.536587, 1, 0, 0, 1, 1,
-0.4877274, -0.7323, 0.03645556, 1, 0, 0, 1, 1,
-0.4854862, 0.4805843, -0.2844939, 1, 0, 0, 1, 1,
-0.4840084, -0.2262152, -1.721625, 1, 0, 0, 1, 1,
-0.4830785, -0.07028452, -2.412791, 1, 0, 0, 1, 1,
-0.4809593, 0.4506129, 0.05555601, 0, 0, 0, 1, 1,
-0.4800963, -0.3864643, -2.696998, 0, 0, 0, 1, 1,
-0.4799041, 0.8469409, 0.2082674, 0, 0, 0, 1, 1,
-0.4773113, 0.1098688, -0.4148925, 0, 0, 0, 1, 1,
-0.4664723, -1.01435, -3.643728, 0, 0, 0, 1, 1,
-0.4657024, -0.8469939, -4.621614, 0, 0, 0, 1, 1,
-0.4649527, -0.8141691, -2.0122, 0, 0, 0, 1, 1,
-0.45951, 1.216962, -0.4063033, 1, 1, 1, 1, 1,
-0.4576828, 0.3480234, -1.278712, 1, 1, 1, 1, 1,
-0.4547394, -0.08338121, -1.275539, 1, 1, 1, 1, 1,
-0.4525889, -0.3269101, -3.589266, 1, 1, 1, 1, 1,
-0.4506818, 0.8305373, -0.4021842, 1, 1, 1, 1, 1,
-0.4505617, -0.1162556, -1.928859, 1, 1, 1, 1, 1,
-0.4487711, 0.3754409, -1.154396, 1, 1, 1, 1, 1,
-0.4464755, 1.149654, 0.1449293, 1, 1, 1, 1, 1,
-0.4442269, 1.012237, 0.03715082, 1, 1, 1, 1, 1,
-0.4439452, -0.3060737, -1.26653, 1, 1, 1, 1, 1,
-0.441871, 0.5192802, -0.8442872, 1, 1, 1, 1, 1,
-0.4418496, 0.6043193, -1.171685, 1, 1, 1, 1, 1,
-0.4414322, 1.460729, -0.2256645, 1, 1, 1, 1, 1,
-0.4413749, -0.4158889, -1.754021, 1, 1, 1, 1, 1,
-0.4358989, -1.570854, -1.540249, 1, 1, 1, 1, 1,
-0.4266957, 0.9475026, -1.246458, 0, 0, 1, 1, 1,
-0.4250878, 1.790349, 2.521322, 1, 0, 0, 1, 1,
-0.4228301, 0.6389163, -1.371202, 1, 0, 0, 1, 1,
-0.4200657, 0.6091126, -2.251601, 1, 0, 0, 1, 1,
-0.4177794, -0.7264609, -2.564147, 1, 0, 0, 1, 1,
-0.4129445, -1.02427, -3.768744, 1, 0, 0, 1, 1,
-0.4097041, 1.447021, 0.8441384, 0, 0, 0, 1, 1,
-0.4058264, 0.3307469, -0.5753607, 0, 0, 0, 1, 1,
-0.4058002, -1.365596, -1.916472, 0, 0, 0, 1, 1,
-0.4023978, -0.9856321, -3.282774, 0, 0, 0, 1, 1,
-0.3996711, -1.088283, -2.146492, 0, 0, 0, 1, 1,
-0.3942417, 0.6964974, -1.17312, 0, 0, 0, 1, 1,
-0.3927885, 0.7611687, -1.150652, 0, 0, 0, 1, 1,
-0.3911806, 1.201221, -0.6687338, 1, 1, 1, 1, 1,
-0.3902677, -0.1646905, -1.008172, 1, 1, 1, 1, 1,
-0.3894221, -0.8594108, -4.610392, 1, 1, 1, 1, 1,
-0.3873628, -1.368152, -3.00507, 1, 1, 1, 1, 1,
-0.3807518, -1.42151, -2.139128, 1, 1, 1, 1, 1,
-0.3760139, -1.425555, -3.931075, 1, 1, 1, 1, 1,
-0.3689911, -0.648773, -1.381352, 1, 1, 1, 1, 1,
-0.3606675, -0.438781, -1.147072, 1, 1, 1, 1, 1,
-0.3599761, -0.08308443, -3.373028, 1, 1, 1, 1, 1,
-0.3596486, 0.2137688, -0.4785599, 1, 1, 1, 1, 1,
-0.3534309, 1.920234, 1.222564, 1, 1, 1, 1, 1,
-0.3525617, -1.23424, -3.078962, 1, 1, 1, 1, 1,
-0.3518293, 0.2800944, 0.4819394, 1, 1, 1, 1, 1,
-0.3486348, 1.183921, -0.9915959, 1, 1, 1, 1, 1,
-0.3439108, -1.242316, -2.758024, 1, 1, 1, 1, 1,
-0.3378935, -0.5684807, -2.5473, 0, 0, 1, 1, 1,
-0.3364982, 0.6019429, 1.773313, 1, 0, 0, 1, 1,
-0.3327416, 0.1580545, -0.9209034, 1, 0, 0, 1, 1,
-0.3303051, 0.449116, -2.689817, 1, 0, 0, 1, 1,
-0.3271028, 0.1633852, 1.819256, 1, 0, 0, 1, 1,
-0.3219641, -1.193555, -2.659411, 1, 0, 0, 1, 1,
-0.3212909, 0.8210831, -0.1342448, 0, 0, 0, 1, 1,
-0.3199514, -0.6485484, -2.561306, 0, 0, 0, 1, 1,
-0.3154717, 1.112921, 0.6644107, 0, 0, 0, 1, 1,
-0.3134604, -1.120867, -3.187366, 0, 0, 0, 1, 1,
-0.3122349, -0.5838532, -3.884857, 0, 0, 0, 1, 1,
-0.3106469, 0.1893242, -0.538055, 0, 0, 0, 1, 1,
-0.3093105, 1.052794, -3.098514, 0, 0, 0, 1, 1,
-0.3088942, 0.119023, -0.5017316, 1, 1, 1, 1, 1,
-0.30316, 0.02992876, -2.136821, 1, 1, 1, 1, 1,
-0.2990789, -0.1605487, -3.210791, 1, 1, 1, 1, 1,
-0.298038, -1.367698, -2.104012, 1, 1, 1, 1, 1,
-0.2973758, 1.812194, -0.9702035, 1, 1, 1, 1, 1,
-0.2970214, -0.4044141, -3.037624, 1, 1, 1, 1, 1,
-0.2931989, -0.4930168, -1.996364, 1, 1, 1, 1, 1,
-0.2926635, -1.502196, -3.891524, 1, 1, 1, 1, 1,
-0.2925747, 0.1973113, -2.135268, 1, 1, 1, 1, 1,
-0.2915145, -1.137518, -3.513182, 1, 1, 1, 1, 1,
-0.2811876, -1.06483, -2.487687, 1, 1, 1, 1, 1,
-0.2795334, -0.3786094, -1.31319, 1, 1, 1, 1, 1,
-0.2752238, -0.6069388, -3.521356, 1, 1, 1, 1, 1,
-0.2704032, 0.2139779, 0.4379528, 1, 1, 1, 1, 1,
-0.2686448, -0.5579986, -2.281487, 1, 1, 1, 1, 1,
-0.266014, 0.5622338, 1.719697, 0, 0, 1, 1, 1,
-0.2649197, -0.06106914, -0.8897404, 1, 0, 0, 1, 1,
-0.2642004, 0.01778141, -2.190171, 1, 0, 0, 1, 1,
-0.2640957, -0.1429461, -0.8905104, 1, 0, 0, 1, 1,
-0.2606115, -1.795776, -2.329654, 1, 0, 0, 1, 1,
-0.253217, -0.1761311, -1.466403, 1, 0, 0, 1, 1,
-0.2530352, -0.6937374, -3.542495, 0, 0, 0, 1, 1,
-0.2506382, -1.588973, -1.823835, 0, 0, 0, 1, 1,
-0.2506259, 0.4220384, 0.3874602, 0, 0, 0, 1, 1,
-0.2442182, -0.7044743, -1.840478, 0, 0, 0, 1, 1,
-0.2388444, -0.05628875, -0.423245, 0, 0, 0, 1, 1,
-0.2373297, -0.7242361, -1.841481, 0, 0, 0, 1, 1,
-0.237125, 1.097245, 0.6504604, 0, 0, 0, 1, 1,
-0.2358008, 1.925136, 0.238546, 1, 1, 1, 1, 1,
-0.2344171, 0.8363436, -1.183466, 1, 1, 1, 1, 1,
-0.2271149, 0.1507851, -2.202552, 1, 1, 1, 1, 1,
-0.2269935, 0.2817397, -0.4919158, 1, 1, 1, 1, 1,
-0.2257026, 0.2936154, -0.7799549, 1, 1, 1, 1, 1,
-0.2247453, 0.9742337, -3.574929, 1, 1, 1, 1, 1,
-0.2244365, 0.9813917, -1.558809, 1, 1, 1, 1, 1,
-0.2149464, 1.537308, 1.671754, 1, 1, 1, 1, 1,
-0.2103155, 0.3013873, -1.272785, 1, 1, 1, 1, 1,
-0.208799, 1.998527, 1.655462, 1, 1, 1, 1, 1,
-0.2066841, 0.9136971, 0.6421402, 1, 1, 1, 1, 1,
-0.2009635, -1.151722, -2.997673, 1, 1, 1, 1, 1,
-0.1985207, 0.2246303, -0.308392, 1, 1, 1, 1, 1,
-0.1925073, 0.3269255, 0.6882894, 1, 1, 1, 1, 1,
-0.1909232, -0.08935989, -1.874949, 1, 1, 1, 1, 1,
-0.1902613, -2.185447, -3.627809, 0, 0, 1, 1, 1,
-0.179792, 0.9713292, -0.1065117, 1, 0, 0, 1, 1,
-0.1759234, -1.765277, -4.410883, 1, 0, 0, 1, 1,
-0.1757499, 0.4496891, -0.6076354, 1, 0, 0, 1, 1,
-0.174537, -1.226676, -4.706987, 1, 0, 0, 1, 1,
-0.174188, 0.6956969, 0.3888862, 1, 0, 0, 1, 1,
-0.1730299, -1.424716, -3.052037, 0, 0, 0, 1, 1,
-0.1729607, -1.121658, -4.632591, 0, 0, 0, 1, 1,
-0.1712142, 0.4015109, -1.049503, 0, 0, 0, 1, 1,
-0.1707819, -0.2897181, -2.915313, 0, 0, 0, 1, 1,
-0.1707253, 0.07252146, -1.527075, 0, 0, 0, 1, 1,
-0.1705775, -0.3965133, -4.073461, 0, 0, 0, 1, 1,
-0.1689267, 0.06175032, -1.245559, 0, 0, 0, 1, 1,
-0.1681735, 0.5752482, -1.640435, 1, 1, 1, 1, 1,
-0.1643615, -1.361447, -2.668457, 1, 1, 1, 1, 1,
-0.1642469, 1.02078, 1.31875, 1, 1, 1, 1, 1,
-0.1598847, 0.5908358, -0.4336643, 1, 1, 1, 1, 1,
-0.158964, 2.072325, -0.2195628, 1, 1, 1, 1, 1,
-0.1588224, -1.938205, -2.060978, 1, 1, 1, 1, 1,
-0.154106, -0.2308805, -3.980095, 1, 1, 1, 1, 1,
-0.153461, 2.599284, -0.1608532, 1, 1, 1, 1, 1,
-0.1507753, -0.3904783, -2.049282, 1, 1, 1, 1, 1,
-0.145437, 0.9286838, -1.72873, 1, 1, 1, 1, 1,
-0.1387985, -0.819916, -2.76391, 1, 1, 1, 1, 1,
-0.1385947, 0.4597372, -1.820914, 1, 1, 1, 1, 1,
-0.1308795, -0.3900835, -4.145779, 1, 1, 1, 1, 1,
-0.1272708, -0.09524179, -1.271578, 1, 1, 1, 1, 1,
-0.1254373, -1.062854, -1.265945, 1, 1, 1, 1, 1,
-0.1118535, -0.1926711, -1.847093, 0, 0, 1, 1, 1,
-0.1082754, -0.5387449, -3.826636, 1, 0, 0, 1, 1,
-0.1080762, 0.4950134, 0.8880206, 1, 0, 0, 1, 1,
-0.1056112, -0.5461091, -3.085077, 1, 0, 0, 1, 1,
-0.1052197, 0.6608454, 0.9728193, 1, 0, 0, 1, 1,
-0.09680399, -0.6438956, -5.016613, 1, 0, 0, 1, 1,
-0.09380221, -0.4031662, -3.828299, 0, 0, 0, 1, 1,
-0.0905963, 0.1848545, 2.826996, 0, 0, 0, 1, 1,
-0.08598246, -0.8709534, -5.212709, 0, 0, 0, 1, 1,
-0.08574644, 0.8824099, 0.04098029, 0, 0, 0, 1, 1,
-0.08274993, 0.04572152, -1.06622, 0, 0, 0, 1, 1,
-0.07797949, -1.261354, -3.481346, 0, 0, 0, 1, 1,
-0.07700574, 0.713993, -1.204579, 0, 0, 0, 1, 1,
-0.07631171, 0.6006536, -0.1840947, 1, 1, 1, 1, 1,
-0.0741881, -0.8040625, -5.322162, 1, 1, 1, 1, 1,
-0.06756238, 0.50112, 1.72534, 1, 1, 1, 1, 1,
-0.05753417, -0.4744543, -2.95843, 1, 1, 1, 1, 1,
-0.05103892, 1.48154, -0.3890224, 1, 1, 1, 1, 1,
-0.05033408, -0.7897456, -4.061868, 1, 1, 1, 1, 1,
-0.04984911, 2.198753, 2.298912, 1, 1, 1, 1, 1,
-0.0493479, -0.8285412, -1.85513, 1, 1, 1, 1, 1,
-0.04726223, 0.02334353, -0.5586957, 1, 1, 1, 1, 1,
-0.04412625, -0.2972745, -2.551604, 1, 1, 1, 1, 1,
-0.04099379, -0.7943968, -3.221415, 1, 1, 1, 1, 1,
-0.03722195, 0.03027578, -1.858317, 1, 1, 1, 1, 1,
-0.03693619, 0.9503421, -0.05238578, 1, 1, 1, 1, 1,
-0.03462733, 0.5023832, -0.4131833, 1, 1, 1, 1, 1,
-0.03245973, -1.175556, -3.161386, 1, 1, 1, 1, 1,
-0.02952036, 0.5232186, -0.5340732, 0, 0, 1, 1, 1,
-0.02942396, 0.6959446, -0.1139006, 1, 0, 0, 1, 1,
-0.02523194, -0.5244618, -3.344473, 1, 0, 0, 1, 1,
-0.02206007, 0.370422, -0.9318923, 1, 0, 0, 1, 1,
-0.01837076, 0.1382724, 0.2271517, 1, 0, 0, 1, 1,
-0.009915032, 1.876305, 0.1401923, 1, 0, 0, 1, 1,
-0.003459368, 0.8719888, -1.282342, 0, 0, 0, 1, 1,
-0.00269714, -0.001629216, -3.186113, 0, 0, 0, 1, 1,
0.003848501, 0.8658829, 0.7005967, 0, 0, 0, 1, 1,
0.01080782, -1.000437, 4.125821, 0, 0, 0, 1, 1,
0.01117101, 0.1888592, -1.575802, 0, 0, 0, 1, 1,
0.01650524, 1.379032, -0.5724439, 0, 0, 0, 1, 1,
0.02138244, -0.6076669, 2.610443, 0, 0, 0, 1, 1,
0.02306148, 0.1575393, -0.3989137, 1, 1, 1, 1, 1,
0.03259924, -0.8885531, 4.074275, 1, 1, 1, 1, 1,
0.03397704, -2.130454, 2.337691, 1, 1, 1, 1, 1,
0.0343646, 1.540802, 1.631747, 1, 1, 1, 1, 1,
0.03526919, -0.1708497, 2.779474, 1, 1, 1, 1, 1,
0.03573228, 1.626757, 0.2743592, 1, 1, 1, 1, 1,
0.0484502, -0.9011274, 4.11372, 1, 1, 1, 1, 1,
0.04896774, 0.1806383, 1.389965, 1, 1, 1, 1, 1,
0.05004083, 1.207496, 0.4335751, 1, 1, 1, 1, 1,
0.0534194, 0.2232421, 2.438822, 1, 1, 1, 1, 1,
0.06001137, -2.358898, 2.503915, 1, 1, 1, 1, 1,
0.06001281, 0.1978746, -0.6628329, 1, 1, 1, 1, 1,
0.0608914, -0.868756, 2.26745, 1, 1, 1, 1, 1,
0.06192645, 1.145777, 1.170158, 1, 1, 1, 1, 1,
0.06522717, 1.184339, -0.4142898, 1, 1, 1, 1, 1,
0.06678148, 0.1429098, -0.321675, 0, 0, 1, 1, 1,
0.07090718, 0.1485298, 1.393435, 1, 0, 0, 1, 1,
0.0730516, -0.2010255, 3.905168, 1, 0, 0, 1, 1,
0.07699385, -1.065557, 3.764122, 1, 0, 0, 1, 1,
0.08282501, -0.9979576, 5.162771, 1, 0, 0, 1, 1,
0.08496121, -0.7766238, 4.515826, 1, 0, 0, 1, 1,
0.08615507, 0.7781254, -0.8597665, 0, 0, 0, 1, 1,
0.08746615, -2.018981, 3.09406, 0, 0, 0, 1, 1,
0.09644342, -1.069956, 1.000329, 0, 0, 0, 1, 1,
0.09696559, 1.158923, 0.7436331, 0, 0, 0, 1, 1,
0.09894653, 0.5647334, 1.504779, 0, 0, 0, 1, 1,
0.1050003, -2.482425, 1.829221, 0, 0, 0, 1, 1,
0.1077598, 1.153286, -0.7449062, 0, 0, 0, 1, 1,
0.1093774, -0.09702951, 3.485003, 1, 1, 1, 1, 1,
0.1112974, 1.115284, -0.1224779, 1, 1, 1, 1, 1,
0.1173072, -0.5044203, 4.525249, 1, 1, 1, 1, 1,
0.1178009, -0.4042636, 2.06637, 1, 1, 1, 1, 1,
0.1234517, -1.355441, 3.396066, 1, 1, 1, 1, 1,
0.1239583, 0.9836973, -0.4360568, 1, 1, 1, 1, 1,
0.1241536, -1.212505, 2.800218, 1, 1, 1, 1, 1,
0.1336743, -1.050284, 4.965181, 1, 1, 1, 1, 1,
0.1446407, -1.398098, 2.522965, 1, 1, 1, 1, 1,
0.1454659, -2.064043, 3.501381, 1, 1, 1, 1, 1,
0.153716, 0.2215711, 2.650319, 1, 1, 1, 1, 1,
0.1552778, 1.809606, -0.08147193, 1, 1, 1, 1, 1,
0.1553587, 0.6461301, -1.256991, 1, 1, 1, 1, 1,
0.1575088, 2.033085, -0.4288576, 1, 1, 1, 1, 1,
0.1598625, -1.645049, 3.34346, 1, 1, 1, 1, 1,
0.1619757, 0.4903964, -0.1197397, 0, 0, 1, 1, 1,
0.1641705, 0.5140182, 1.147793, 1, 0, 0, 1, 1,
0.1654667, -0.8973703, 2.974351, 1, 0, 0, 1, 1,
0.1663997, 1.21588, -1.386212, 1, 0, 0, 1, 1,
0.1684676, -0.7944006, 3.436373, 1, 0, 0, 1, 1,
0.1685885, -0.104526, 0.9605986, 1, 0, 0, 1, 1,
0.1689288, 0.2396201, 1.604679, 0, 0, 0, 1, 1,
0.1712237, -1.757487, 2.584541, 0, 0, 0, 1, 1,
0.174715, 0.5061236, 1.227707, 0, 0, 0, 1, 1,
0.1753252, 0.01141298, 0.5351496, 0, 0, 0, 1, 1,
0.1765072, 0.292525, 0.5656389, 0, 0, 0, 1, 1,
0.1843585, -0.3667148, 1.762442, 0, 0, 0, 1, 1,
0.1848856, -0.8605946, 1.692885, 0, 0, 0, 1, 1,
0.1875075, 1.454712, -1.120159, 1, 1, 1, 1, 1,
0.1875579, -0.6362578, 3.205584, 1, 1, 1, 1, 1,
0.1914263, 0.4643351, -1.173227, 1, 1, 1, 1, 1,
0.1943554, -1.845149, 6.531585, 1, 1, 1, 1, 1,
0.1950033, -0.8352091, 1.625721, 1, 1, 1, 1, 1,
0.1970553, -0.1740936, 2.066412, 1, 1, 1, 1, 1,
0.1992944, -0.09427005, 2.763869, 1, 1, 1, 1, 1,
0.2003231, -0.1612438, 1.033924, 1, 1, 1, 1, 1,
0.2004595, -0.7447366, 3.725956, 1, 1, 1, 1, 1,
0.202809, -1.61164, 3.25917, 1, 1, 1, 1, 1,
0.2029797, -1.018862, 3.876548, 1, 1, 1, 1, 1,
0.2032253, 0.5538299, -0.3890077, 1, 1, 1, 1, 1,
0.204579, -0.2805916, 4.074952, 1, 1, 1, 1, 1,
0.2046672, 0.1080754, -0.1757143, 1, 1, 1, 1, 1,
0.2056596, 0.1255899, 1.581799, 1, 1, 1, 1, 1,
0.2069121, 0.1401183, -0.1358814, 0, 0, 1, 1, 1,
0.2071516, 1.100194, 0.303173, 1, 0, 0, 1, 1,
0.2131731, 1.30095, 0.8284584, 1, 0, 0, 1, 1,
0.2171507, 0.7098287, 0.4238159, 1, 0, 0, 1, 1,
0.2196252, -1.9441, 3.517683, 1, 0, 0, 1, 1,
0.2204615, -1.186473, 3.282074, 1, 0, 0, 1, 1,
0.2253615, 2.408409, -0.4075843, 0, 0, 0, 1, 1,
0.227462, 0.8206055, -0.3980599, 0, 0, 0, 1, 1,
0.2275956, 0.4438019, -0.6104946, 0, 0, 0, 1, 1,
0.228039, -0.5299482, 1.821717, 0, 0, 0, 1, 1,
0.2350557, -0.2464578, 1.512694, 0, 0, 0, 1, 1,
0.2352859, -0.4587286, 1.749048, 0, 0, 0, 1, 1,
0.2448649, -0.671903, 4.160347, 0, 0, 0, 1, 1,
0.2464332, 0.6916496, 1.016808, 1, 1, 1, 1, 1,
0.2612357, 0.2632692, 2.004791, 1, 1, 1, 1, 1,
0.2683156, 1.33229, -1.294782, 1, 1, 1, 1, 1,
0.2683792, -0.4941892, 2.196404, 1, 1, 1, 1, 1,
0.2714703, 0.02569602, 2.190574, 1, 1, 1, 1, 1,
0.2739434, -1.120179, 0.4814473, 1, 1, 1, 1, 1,
0.2752624, 0.4081632, 2.37351, 1, 1, 1, 1, 1,
0.275337, 0.899924, 0.4234756, 1, 1, 1, 1, 1,
0.2764131, -1.027919, 1.906997, 1, 1, 1, 1, 1,
0.2779111, 0.4299824, 1.046093, 1, 1, 1, 1, 1,
0.2864222, 0.6034976, 0.7407427, 1, 1, 1, 1, 1,
0.2877679, -0.379648, 2.631199, 1, 1, 1, 1, 1,
0.2909869, 1.204684, 0.4400166, 1, 1, 1, 1, 1,
0.2915751, 0.3233917, 1.349663, 1, 1, 1, 1, 1,
0.2928789, -0.266178, 2.407914, 1, 1, 1, 1, 1,
0.2930537, -0.4725521, 4.063899, 0, 0, 1, 1, 1,
0.2948862, -1.566213, 3.255564, 1, 0, 0, 1, 1,
0.2980696, 2.323677, -0.8632827, 1, 0, 0, 1, 1,
0.2987816, -0.06629247, 1.566035, 1, 0, 0, 1, 1,
0.3027036, -0.8984957, 2.045804, 1, 0, 0, 1, 1,
0.3032621, -1.503864, 3.92916, 1, 0, 0, 1, 1,
0.3050588, 0.06216282, 1.04125, 0, 0, 0, 1, 1,
0.3052091, 0.08307809, 1.097018, 0, 0, 0, 1, 1,
0.3097869, 1.143978, -2.328776, 0, 0, 0, 1, 1,
0.3100678, -0.1863751, 0.3224916, 0, 0, 0, 1, 1,
0.3131258, -0.4968492, 3.702683, 0, 0, 0, 1, 1,
0.3149529, 0.02830149, 1.332401, 0, 0, 0, 1, 1,
0.3172664, -0.2632657, 3.996801, 0, 0, 0, 1, 1,
0.3196954, -0.7761624, 3.558908, 1, 1, 1, 1, 1,
0.3207428, -0.01062833, 1.90594, 1, 1, 1, 1, 1,
0.3221649, -0.4391371, 1.752293, 1, 1, 1, 1, 1,
0.3227001, -0.3049085, 3.241544, 1, 1, 1, 1, 1,
0.3233286, -0.6403443, 3.078809, 1, 1, 1, 1, 1,
0.3259509, -0.08330743, 0.2617851, 1, 1, 1, 1, 1,
0.327334, -0.4873295, 2.281148, 1, 1, 1, 1, 1,
0.3278454, 0.4003473, 1.634251, 1, 1, 1, 1, 1,
0.3299033, 0.5127404, -0.2942185, 1, 1, 1, 1, 1,
0.3327595, 0.03777577, 1.871863, 1, 1, 1, 1, 1,
0.3339695, -1.916643, 2.324435, 1, 1, 1, 1, 1,
0.3341715, 0.6556273, 0.811066, 1, 1, 1, 1, 1,
0.3350403, -0.01839672, 3.463161, 1, 1, 1, 1, 1,
0.3356037, 0.9056417, 1.217098, 1, 1, 1, 1, 1,
0.3358886, 1.279474, 0.7802659, 1, 1, 1, 1, 1,
0.3416517, -0.5448802, 3.737558, 0, 0, 1, 1, 1,
0.3419639, 1.459201, 0.4831785, 1, 0, 0, 1, 1,
0.3430019, -1.287345, 4.479993, 1, 0, 0, 1, 1,
0.3437748, 1.358953, 1.423039, 1, 0, 0, 1, 1,
0.3481769, 0.6648313, -0.4948503, 1, 0, 0, 1, 1,
0.3506387, -1.326413, 3.670869, 1, 0, 0, 1, 1,
0.3514006, 0.6443554, 1.193727, 0, 0, 0, 1, 1,
0.3518198, 0.9116702, -1.236027, 0, 0, 0, 1, 1,
0.3526627, 0.7206103, 1.025328, 0, 0, 0, 1, 1,
0.3573144, 0.650266, 1.378971, 0, 0, 0, 1, 1,
0.3597886, 0.5242674, 0.9313677, 0, 0, 0, 1, 1,
0.3627477, -0.8573853, 2.64031, 0, 0, 0, 1, 1,
0.3689296, -2.664207, 4.401489, 0, 0, 0, 1, 1,
0.3695253, 0.4370609, -1.299699, 1, 1, 1, 1, 1,
0.3699203, -0.4990276, 2.333738, 1, 1, 1, 1, 1,
0.3725323, 0.2604692, 2.99786, 1, 1, 1, 1, 1,
0.373686, -1.504502, 3.539484, 1, 1, 1, 1, 1,
0.3765529, 1.696882, 0.6389997, 1, 1, 1, 1, 1,
0.3809161, 0.8113258, -1.346212, 1, 1, 1, 1, 1,
0.3863606, -0.96301, 1.937904, 1, 1, 1, 1, 1,
0.3870551, 0.9451512, -0.6035458, 1, 1, 1, 1, 1,
0.3889805, 0.1042892, -0.1015181, 1, 1, 1, 1, 1,
0.3900403, -0.9836306, 4.951147, 1, 1, 1, 1, 1,
0.3930235, 0.01655003, 2.780348, 1, 1, 1, 1, 1,
0.3957792, 0.3991636, -0.7917643, 1, 1, 1, 1, 1,
0.3992573, 0.2948166, 1.398443, 1, 1, 1, 1, 1,
0.4000657, 0.3414657, -1.864517, 1, 1, 1, 1, 1,
0.4078103, -1.713668, 2.680507, 1, 1, 1, 1, 1,
0.4084378, -1.105337, 0.8392516, 0, 0, 1, 1, 1,
0.4131248, -0.3253553, 1.03864, 1, 0, 0, 1, 1,
0.4143342, 1.540624, 0.4744087, 1, 0, 0, 1, 1,
0.4163765, 1.221601, -0.1782021, 1, 0, 0, 1, 1,
0.419949, -0.3699766, 2.501694, 1, 0, 0, 1, 1,
0.4209234, 1.384846, 0.8176126, 1, 0, 0, 1, 1,
0.4229285, -0.6730815, 2.237629, 0, 0, 0, 1, 1,
0.4275304, 0.5742487, -0.7772856, 0, 0, 0, 1, 1,
0.4334964, -0.6327358, 4.730067, 0, 0, 0, 1, 1,
0.4345086, 0.08104534, 3.231155, 0, 0, 0, 1, 1,
0.4417485, -0.2254635, 2.917585, 0, 0, 0, 1, 1,
0.4419305, 0.4567666, -0.5884077, 0, 0, 0, 1, 1,
0.4436549, 0.3473091, 0.5147502, 0, 0, 0, 1, 1,
0.4469383, -0.3442575, 2.914734, 1, 1, 1, 1, 1,
0.4491464, -1.622991, 2.619054, 1, 1, 1, 1, 1,
0.4494033, -1.192385, 3.196932, 1, 1, 1, 1, 1,
0.4494252, 0.5500394, 0.4030661, 1, 1, 1, 1, 1,
0.4494298, -0.9287151, 2.666479, 1, 1, 1, 1, 1,
0.4501658, -1.530528, 2.974838, 1, 1, 1, 1, 1,
0.4504487, -1.433002, 2.746222, 1, 1, 1, 1, 1,
0.4546725, -1.314674, 2.852602, 1, 1, 1, 1, 1,
0.45515, -0.4751642, 2.412748, 1, 1, 1, 1, 1,
0.4554355, 0.5006642, 0.8103536, 1, 1, 1, 1, 1,
0.4558869, 0.4136991, 1.177712, 1, 1, 1, 1, 1,
0.4575883, 0.03994813, 3.164667, 1, 1, 1, 1, 1,
0.4585668, 0.02939328, 2.220536, 1, 1, 1, 1, 1,
0.4590511, -0.6578488, 2.748637, 1, 1, 1, 1, 1,
0.4593104, -0.5655212, 1.982567, 1, 1, 1, 1, 1,
0.4609879, -0.05997712, 0.1864453, 0, 0, 1, 1, 1,
0.4661336, -0.529328, 3.960973, 1, 0, 0, 1, 1,
0.4718527, 0.8306949, 0.02784121, 1, 0, 0, 1, 1,
0.4720664, 0.378607, 0.8878595, 1, 0, 0, 1, 1,
0.4726462, 1.195082, 1.795107, 1, 0, 0, 1, 1,
0.4730024, -1.107528, 3.404342, 1, 0, 0, 1, 1,
0.4739341, -1.26756, 2.134881, 0, 0, 0, 1, 1,
0.4739914, -0.5586712, 2.684552, 0, 0, 0, 1, 1,
0.4788591, -1.351804, 2.966569, 0, 0, 0, 1, 1,
0.4842081, 0.3770031, -0.7314364, 0, 0, 0, 1, 1,
0.4865654, -0.1519246, 1.873613, 0, 0, 0, 1, 1,
0.4878676, 0.6011789, 0.1639921, 0, 0, 0, 1, 1,
0.4881206, -0.4906991, 2.521152, 0, 0, 0, 1, 1,
0.4901373, -0.3390312, 2.411831, 1, 1, 1, 1, 1,
0.4909889, -0.3099333, 1.32702, 1, 1, 1, 1, 1,
0.497177, 0.7948176, 1.848013, 1, 1, 1, 1, 1,
0.4986657, 0.4099959, 1.379872, 1, 1, 1, 1, 1,
0.501616, 1.138965, -0.1187472, 1, 1, 1, 1, 1,
0.5089794, 0.563651, 1.479835, 1, 1, 1, 1, 1,
0.5144077, -0.5393055, 2.245867, 1, 1, 1, 1, 1,
0.5155503, -0.5720401, 1.848263, 1, 1, 1, 1, 1,
0.5163211, 0.2500538, 1.987789, 1, 1, 1, 1, 1,
0.5182031, -0.2372889, 4.278815, 1, 1, 1, 1, 1,
0.5185803, -0.4978983, 1.256198, 1, 1, 1, 1, 1,
0.5186324, -2.279552, 3.174185, 1, 1, 1, 1, 1,
0.5214927, -0.6977714, 2.566471, 1, 1, 1, 1, 1,
0.5244989, 0.9720901, -0.6511139, 1, 1, 1, 1, 1,
0.5251881, -0.4354437, 2.036121, 1, 1, 1, 1, 1,
0.5336716, -0.3521505, 2.033355, 0, 0, 1, 1, 1,
0.5401652, -0.1078316, 1.376413, 1, 0, 0, 1, 1,
0.5419616, 0.6025087, 1.054705, 1, 0, 0, 1, 1,
0.5549136, -1.127062, 2.959977, 1, 0, 0, 1, 1,
0.5583389, 1.378186, -0.4418896, 1, 0, 0, 1, 1,
0.5584266, 0.6508354, 1.770003, 1, 0, 0, 1, 1,
0.5586548, 0.9176088, 0.2450254, 0, 0, 0, 1, 1,
0.5588916, 0.1782053, 0.7163715, 0, 0, 0, 1, 1,
0.5593653, 0.7905828, 0.9755779, 0, 0, 0, 1, 1,
0.5674165, 1.439165, 2.488617, 0, 0, 0, 1, 1,
0.5699277, -0.04179258, 1.158674, 0, 0, 0, 1, 1,
0.5786305, 0.627856, -0.3823397, 0, 0, 0, 1, 1,
0.5853561, 0.3701617, 1.407569, 0, 0, 0, 1, 1,
0.5877452, -0.04696342, 2.096835, 1, 1, 1, 1, 1,
0.588154, -0.1248115, 1.646723, 1, 1, 1, 1, 1,
0.5903146, -1.60893, -0.682939, 1, 1, 1, 1, 1,
0.5915467, -0.8331838, 3.650839, 1, 1, 1, 1, 1,
0.5934362, -1.282805, 4.421718, 1, 1, 1, 1, 1,
0.5939086, -0.4041288, 0.6251869, 1, 1, 1, 1, 1,
0.6076372, 0.1541739, 0.4582832, 1, 1, 1, 1, 1,
0.6106523, 1.349552, 0.5903355, 1, 1, 1, 1, 1,
0.6113169, -0.1423865, 0.6503283, 1, 1, 1, 1, 1,
0.6165271, 1.309627, -0.3087403, 1, 1, 1, 1, 1,
0.6180981, 0.2315853, 2.821291, 1, 1, 1, 1, 1,
0.6215795, 0.179283, 0.2338111, 1, 1, 1, 1, 1,
0.62343, 0.8283174, 1.446349, 1, 1, 1, 1, 1,
0.6262819, 0.429039, -0.0169458, 1, 1, 1, 1, 1,
0.6294389, 0.02227875, 1.701459, 1, 1, 1, 1, 1,
0.638988, 0.4203254, 0.9042383, 0, 0, 1, 1, 1,
0.6432812, 2.303415, -0.9762041, 1, 0, 0, 1, 1,
0.6445988, -1.084889, 1.091191, 1, 0, 0, 1, 1,
0.6455071, 0.881707, 0.7294633, 1, 0, 0, 1, 1,
0.6489351, 0.0785494, 1.909743, 1, 0, 0, 1, 1,
0.6504815, 0.8704302, 1.593626, 1, 0, 0, 1, 1,
0.6514274, -0.3734018, 2.860166, 0, 0, 0, 1, 1,
0.6515647, -0.4289994, 2.416401, 0, 0, 0, 1, 1,
0.6532885, 1.182999, 0.3163373, 0, 0, 0, 1, 1,
0.6570101, 0.7394308, 0.6959271, 0, 0, 0, 1, 1,
0.6577414, -0.1151865, 1.882639, 0, 0, 0, 1, 1,
0.6643556, 0.08638667, 1.285783, 0, 0, 0, 1, 1,
0.6667516, -1.617498, 1.792139, 0, 0, 0, 1, 1,
0.6703818, 0.6829947, 2.187191, 1, 1, 1, 1, 1,
0.670391, 0.09934285, 2.976855, 1, 1, 1, 1, 1,
0.675692, -0.3994305, 4.019324, 1, 1, 1, 1, 1,
0.6758888, 0.2053352, 0.6752385, 1, 1, 1, 1, 1,
0.6774353, 0.840653, -0.1269262, 1, 1, 1, 1, 1,
0.6806208, 0.4086739, 2.490693, 1, 1, 1, 1, 1,
0.6822517, -0.2483009, 2.442444, 1, 1, 1, 1, 1,
0.6893458, 1.877496, 1.863367, 1, 1, 1, 1, 1,
0.6924655, 0.9113, 1.648436, 1, 1, 1, 1, 1,
0.6968256, 1.15282, 0.3871639, 1, 1, 1, 1, 1,
0.7020717, 0.2822655, 1.066176, 1, 1, 1, 1, 1,
0.713729, 0.08533712, -0.3756532, 1, 1, 1, 1, 1,
0.7142165, 0.1717979, 1.07205, 1, 1, 1, 1, 1,
0.7164108, 2.042138, 1.559202, 1, 1, 1, 1, 1,
0.7230015, -2.230167, 1.744434, 1, 1, 1, 1, 1,
0.724104, 1.111957, -0.1549795, 0, 0, 1, 1, 1,
0.731305, 0.1618792, 1.828615, 1, 0, 0, 1, 1,
0.7330551, -1.017754, 3.168795, 1, 0, 0, 1, 1,
0.7359763, -1.198763, 3.822651, 1, 0, 0, 1, 1,
0.7549662, -0.2958508, 3.285435, 1, 0, 0, 1, 1,
0.7609967, -0.5892748, 2.055076, 1, 0, 0, 1, 1,
0.7638917, 1.712122, 1.452132, 0, 0, 0, 1, 1,
0.7666897, 0.9069988, 0.9455479, 0, 0, 0, 1, 1,
0.766717, -1.110447, 0.7787518, 0, 0, 0, 1, 1,
0.7714252, -0.4713186, 2.118762, 0, 0, 0, 1, 1,
0.7779793, 0.1418717, 4.074347, 0, 0, 0, 1, 1,
0.7788376, 1.130726, -0.2936991, 0, 0, 0, 1, 1,
0.7818354, 2.192584, 2.39569, 0, 0, 0, 1, 1,
0.7824194, 0.5153053, 1.478657, 1, 1, 1, 1, 1,
0.784673, 1.547656, 0.06500489, 1, 1, 1, 1, 1,
0.7926578, -0.530795, 2.600441, 1, 1, 1, 1, 1,
0.7935128, 0.3991961, 0.7107025, 1, 1, 1, 1, 1,
0.7955756, 1.12468, 2.486274, 1, 1, 1, 1, 1,
0.7958195, -1.177393, 2.645753, 1, 1, 1, 1, 1,
0.7974217, -0.4181392, 3.209317, 1, 1, 1, 1, 1,
0.7995395, 0.285221, 1.81602, 1, 1, 1, 1, 1,
0.8019506, -0.6640288, 1.667639, 1, 1, 1, 1, 1,
0.8030303, 0.1223431, 1.762769, 1, 1, 1, 1, 1,
0.8209711, -1.788381, 3.387454, 1, 1, 1, 1, 1,
0.8235599, 0.4771188, 0.2276532, 1, 1, 1, 1, 1,
0.8259565, -2.169068, 2.835404, 1, 1, 1, 1, 1,
0.8271098, 0.1626076, 1.218157, 1, 1, 1, 1, 1,
0.8286843, 0.7374479, 1.544725, 1, 1, 1, 1, 1,
0.8292167, -0.8126583, 3.782535, 0, 0, 1, 1, 1,
0.8321176, -1.029176, 3.779588, 1, 0, 0, 1, 1,
0.8324175, -1.102926, 3.504573, 1, 0, 0, 1, 1,
0.8325315, 1.509629, 1.12207, 1, 0, 0, 1, 1,
0.8386916, 0.09707434, 2.78337, 1, 0, 0, 1, 1,
0.8428878, -0.8364987, 0.6670285, 1, 0, 0, 1, 1,
0.8445051, 1.513831, -0.3965334, 0, 0, 0, 1, 1,
0.8459091, -0.3548154, 1.687295, 0, 0, 0, 1, 1,
0.8552047, -1.264802, 1.711847, 0, 0, 0, 1, 1,
0.8580367, 0.675382, 4.644987, 0, 0, 0, 1, 1,
0.8656741, 0.7989428, 1.350771, 0, 0, 0, 1, 1,
0.8678115, -0.4886464, 1.619687, 0, 0, 0, 1, 1,
0.8680486, 0.5787258, 0.2530543, 0, 0, 0, 1, 1,
0.8688354, -2.685507, 2.650196, 1, 1, 1, 1, 1,
0.8801042, 1.18245, 0.6628512, 1, 1, 1, 1, 1,
0.8824259, 0.8833965, 0.05411308, 1, 1, 1, 1, 1,
0.8848999, -0.64468, 1.58139, 1, 1, 1, 1, 1,
0.8879842, -0.2537701, 1.760497, 1, 1, 1, 1, 1,
0.8896552, 0.4439766, 1.774721, 1, 1, 1, 1, 1,
0.8915651, 0.805436, 1.269612, 1, 1, 1, 1, 1,
0.8922707, -0.9601452, 1.231903, 1, 1, 1, 1, 1,
0.8945028, -0.3920945, 1.524083, 1, 1, 1, 1, 1,
0.896621, 0.6513578, -0.3333173, 1, 1, 1, 1, 1,
0.8979062, 0.8468734, -0.1873054, 1, 1, 1, 1, 1,
0.8981681, -0.7387444, 1.875247, 1, 1, 1, 1, 1,
0.9049305, -0.5147643, 2.992275, 1, 1, 1, 1, 1,
0.9067348, 1.763342, 1.036086, 1, 1, 1, 1, 1,
0.9081309, 0.5553455, 1.823398, 1, 1, 1, 1, 1,
0.9104693, 0.1189547, 0.7626138, 0, 0, 1, 1, 1,
0.9109102, -0.2174229, 2.031188, 1, 0, 0, 1, 1,
0.9120793, 0.3687018, 1.869206, 1, 0, 0, 1, 1,
0.9189439, -0.4685375, 2.095317, 1, 0, 0, 1, 1,
0.9211231, 1.60603, 1.183691, 1, 0, 0, 1, 1,
0.9241289, -0.7597817, 2.498935, 1, 0, 0, 1, 1,
0.9349297, 0.4539928, 1.143862, 0, 0, 0, 1, 1,
0.9402531, -0.9942468, 1.913975, 0, 0, 0, 1, 1,
0.9408756, 0.2293251, 3.480494, 0, 0, 0, 1, 1,
0.9501072, 1.294339, 0.3700027, 0, 0, 0, 1, 1,
0.9514152, 1.185681, -0.2018482, 0, 0, 0, 1, 1,
0.9554668, 0.3693372, 1.529493, 0, 0, 0, 1, 1,
0.9622739, -0.2648909, 1.994944, 0, 0, 0, 1, 1,
0.9629572, -0.616273, 0.6780645, 1, 1, 1, 1, 1,
0.9649436, 0.7892854, -0.5032115, 1, 1, 1, 1, 1,
0.9805855, -0.1673454, 2.485129, 1, 1, 1, 1, 1,
0.9820472, 0.3447926, -0.7756524, 1, 1, 1, 1, 1,
0.9871494, 1.212259, 1.752977, 1, 1, 1, 1, 1,
0.9933138, -1.330007, 3.289969, 1, 1, 1, 1, 1,
0.9964183, -0.598436, 1.543821, 1, 1, 1, 1, 1,
0.9991511, -1.178174, 1.199798, 1, 1, 1, 1, 1,
1.002092, 0.6463113, 2.233176, 1, 1, 1, 1, 1,
1.004184, 2.20237, 0.2550521, 1, 1, 1, 1, 1,
1.00532, -0.3106659, 1.386173, 1, 1, 1, 1, 1,
1.009027, -0.9710973, 4.227543, 1, 1, 1, 1, 1,
1.017066, -0.2010849, 4.237039, 1, 1, 1, 1, 1,
1.0185, -0.6467917, 0.6671547, 1, 1, 1, 1, 1,
1.029803, 0.4663497, 0.5459774, 1, 1, 1, 1, 1,
1.033979, 0.5225314, 1.400344, 0, 0, 1, 1, 1,
1.045985, -0.2411869, 1.947306, 1, 0, 0, 1, 1,
1.047545, -1.377178, 2.218775, 1, 0, 0, 1, 1,
1.050088, -0.04846031, 1.932472, 1, 0, 0, 1, 1,
1.059213, 0.6377363, -0.1716851, 1, 0, 0, 1, 1,
1.061118, 0.4118144, 2.10272, 1, 0, 0, 1, 1,
1.061427, 0.5041939, 0.6442406, 0, 0, 0, 1, 1,
1.067363, 0.8013895, 1.022363, 0, 0, 0, 1, 1,
1.071844, 1.17891, 0.5497187, 0, 0, 0, 1, 1,
1.085612, -0.04920922, 3.388212, 0, 0, 0, 1, 1,
1.093356, -1.661735, 2.838343, 0, 0, 0, 1, 1,
1.095401, 1.179384, -0.07230166, 0, 0, 0, 1, 1,
1.101477, 0.7379839, 1.669599, 0, 0, 0, 1, 1,
1.103523, 2.096995, 0.6200045, 1, 1, 1, 1, 1,
1.105042, 1.18907, 0.3435551, 1, 1, 1, 1, 1,
1.105259, -1.110347, 2.520609, 1, 1, 1, 1, 1,
1.114988, -0.469592, 1.56205, 1, 1, 1, 1, 1,
1.11844, 0.3264665, 1.588491, 1, 1, 1, 1, 1,
1.119583, -0.6039383, -0.5758785, 1, 1, 1, 1, 1,
1.119987, 0.9050146, 1.507618, 1, 1, 1, 1, 1,
1.12157, 0.487639, 0.1837116, 1, 1, 1, 1, 1,
1.12484, 0.2433007, 1.974623, 1, 1, 1, 1, 1,
1.129343, -0.3041359, 1.782388, 1, 1, 1, 1, 1,
1.132516, -0.5316826, 3.370896, 1, 1, 1, 1, 1,
1.136287, -1.319808, 2.211171, 1, 1, 1, 1, 1,
1.141432, -1.561851, 2.418411, 1, 1, 1, 1, 1,
1.144153, -0.6790818, 1.425887, 1, 1, 1, 1, 1,
1.148254, 2.094758, 0.2599168, 1, 1, 1, 1, 1,
1.148717, -0.07380968, 2.850086, 0, 0, 1, 1, 1,
1.150741, 0.7966685, 2.478142, 1, 0, 0, 1, 1,
1.15086, -0.1415651, 3.283187, 1, 0, 0, 1, 1,
1.155006, 0.3051765, 1.297792, 1, 0, 0, 1, 1,
1.160595, 0.06090852, 0.3965714, 1, 0, 0, 1, 1,
1.164843, -0.3959569, 2.413788, 1, 0, 0, 1, 1,
1.169506, -0.7797689, 1.110822, 0, 0, 0, 1, 1,
1.171085, -0.01133727, 0.8687361, 0, 0, 0, 1, 1,
1.173523, -0.06261136, 2.379589, 0, 0, 0, 1, 1,
1.180942, 0.6390848, 4.502147, 0, 0, 0, 1, 1,
1.183216, 0.7015687, 1.129015, 0, 0, 0, 1, 1,
1.184365, -2.389359, 1.883269, 0, 0, 0, 1, 1,
1.188933, -1.050563, 2.095997, 0, 0, 0, 1, 1,
1.195455, 0.6942167, 0.7772316, 1, 1, 1, 1, 1,
1.206251, -0.09101573, 1.014766, 1, 1, 1, 1, 1,
1.210634, -0.07356764, 1.575942, 1, 1, 1, 1, 1,
1.213376, -1.508243, 3.150851, 1, 1, 1, 1, 1,
1.214293, 1.039163, 0.5602528, 1, 1, 1, 1, 1,
1.214422, 0.8537624, 0.6660507, 1, 1, 1, 1, 1,
1.214691, 1.073309, 1.640658, 1, 1, 1, 1, 1,
1.216223, 0.2150797, 1.746448, 1, 1, 1, 1, 1,
1.218696, 0.3359632, 1.453958, 1, 1, 1, 1, 1,
1.219602, 0.04302019, 1.658686, 1, 1, 1, 1, 1,
1.23412, 0.09204835, 0.6692614, 1, 1, 1, 1, 1,
1.24474, -0.6221063, 1.435667, 1, 1, 1, 1, 1,
1.246007, -0.7137167, 2.103196, 1, 1, 1, 1, 1,
1.248831, 0.0225906, 2.073117, 1, 1, 1, 1, 1,
1.251828, -0.8840388, 0.8202172, 1, 1, 1, 1, 1,
1.274906, 2.526613, 0.8654517, 0, 0, 1, 1, 1,
1.275726, -1.406188, 2.999263, 1, 0, 0, 1, 1,
1.280407, 0.3012407, 0.692036, 1, 0, 0, 1, 1,
1.280621, -1.021617, 1.45247, 1, 0, 0, 1, 1,
1.288188, 0.2161283, 1.490813, 1, 0, 0, 1, 1,
1.292642, -1.437041, 1.775919, 1, 0, 0, 1, 1,
1.301187, -2.045448, 0.9372752, 0, 0, 0, 1, 1,
1.303867, 0.830707, 1.739668, 0, 0, 0, 1, 1,
1.305187, -0.3147196, 0.8932692, 0, 0, 0, 1, 1,
1.308815, 1.376869, 1.458548, 0, 0, 0, 1, 1,
1.316122, -1.104877, 3.440053, 0, 0, 0, 1, 1,
1.319007, -0.07860581, 2.014742, 0, 0, 0, 1, 1,
1.321895, 0.04686422, 1.150194, 0, 0, 0, 1, 1,
1.330894, 0.8767224, 0.6288911, 1, 1, 1, 1, 1,
1.331349, 0.2463827, -0.2831982, 1, 1, 1, 1, 1,
1.334744, -0.9028316, 3.050218, 1, 1, 1, 1, 1,
1.335363, 2.558686, -1.220703, 1, 1, 1, 1, 1,
1.353678, -1.580773, 3.06552, 1, 1, 1, 1, 1,
1.367234, -0.1782979, 1.888664, 1, 1, 1, 1, 1,
1.367724, 0.02550811, 2.901982, 1, 1, 1, 1, 1,
1.370045, -0.3815933, 0.6532895, 1, 1, 1, 1, 1,
1.383856, -0.2298382, 2.001037, 1, 1, 1, 1, 1,
1.390188, 0.4024998, 0.2933241, 1, 1, 1, 1, 1,
1.391858, 0.3087536, 0.5583395, 1, 1, 1, 1, 1,
1.396927, -0.8196779, 3.025774, 1, 1, 1, 1, 1,
1.401545, -1.917934, 3.243705, 1, 1, 1, 1, 1,
1.407222, 0.4691687, 0.7919429, 1, 1, 1, 1, 1,
1.441204, -0.425451, 2.170339, 1, 1, 1, 1, 1,
1.444045, 0.3579129, 1.405435, 0, 0, 1, 1, 1,
1.4676, -0.8835356, 2.873442, 1, 0, 0, 1, 1,
1.481225, -0.75306, 2.385923, 1, 0, 0, 1, 1,
1.484146, -0.4027058, -0.1459617, 1, 0, 0, 1, 1,
1.494684, -2.182499, 2.045231, 1, 0, 0, 1, 1,
1.511339, 0.45608, 1.602179, 1, 0, 0, 1, 1,
1.516166, 1.233471, 1.552919, 0, 0, 0, 1, 1,
1.52088, -0.4328327, 0.710353, 0, 0, 0, 1, 1,
1.532002, 0.7815226, 1.567295, 0, 0, 0, 1, 1,
1.533597, 1.764236, -0.393208, 0, 0, 0, 1, 1,
1.541837, -0.3319201, 2.319276, 0, 0, 0, 1, 1,
1.542382, -1.771247, 1.963198, 0, 0, 0, 1, 1,
1.543388, 0.4840135, 1.030227, 0, 0, 0, 1, 1,
1.553773, 1.68874, 1.795497, 1, 1, 1, 1, 1,
1.561837, 1.249809, 0.7115678, 1, 1, 1, 1, 1,
1.570787, -1.419056, 4.901364, 1, 1, 1, 1, 1,
1.57253, -0.9649838, 2.431913, 1, 1, 1, 1, 1,
1.585584, 0.9632859, 0.5408683, 1, 1, 1, 1, 1,
1.585757, -0.2208738, 1.486396, 1, 1, 1, 1, 1,
1.592108, -0.0183132, 1.987417, 1, 1, 1, 1, 1,
1.596093, -0.2975346, 3.640731, 1, 1, 1, 1, 1,
1.635495, 0.004006431, 0.5088179, 1, 1, 1, 1, 1,
1.652477, -0.9785168, 2.326625, 1, 1, 1, 1, 1,
1.665011, 0.8245574, 0.7848843, 1, 1, 1, 1, 1,
1.666086, 1.112121, 3.20255, 1, 1, 1, 1, 1,
1.671602, -0.2003773, 1.799295, 1, 1, 1, 1, 1,
1.67723, 0.6315479, -0.1461927, 1, 1, 1, 1, 1,
1.687523, 0.4683555, 1.948571, 1, 1, 1, 1, 1,
1.6901, 1.410317, -0.1727969, 0, 0, 1, 1, 1,
1.692278, 0.8928323, 1.502784, 1, 0, 0, 1, 1,
1.705088, -0.2523906, 1.733583, 1, 0, 0, 1, 1,
1.712284, 0.7385934, 1.241958, 1, 0, 0, 1, 1,
1.720419, 0.07233905, 0.05202666, 1, 0, 0, 1, 1,
1.727018, -0.8822091, 1.735981, 1, 0, 0, 1, 1,
1.732724, 0.5734574, -0.5432177, 0, 0, 0, 1, 1,
1.739264, -1.146525, 2.427638, 0, 0, 0, 1, 1,
1.744264, 0.2008359, 2.740108, 0, 0, 0, 1, 1,
1.758725, 0.2488116, -0.07781453, 0, 0, 0, 1, 1,
1.769033, 0.1298906, 2.735424, 0, 0, 0, 1, 1,
1.773717, 0.8683887, 2.238004, 0, 0, 0, 1, 1,
1.776209, -0.5272936, 1.519941, 0, 0, 0, 1, 1,
1.810309, 1.340084, 0.2446237, 1, 1, 1, 1, 1,
1.828906, 0.6345232, 3.38561, 1, 1, 1, 1, 1,
1.829388, -0.8763291, 3.424681, 1, 1, 1, 1, 1,
1.834739, -0.3041396, 2.619531, 1, 1, 1, 1, 1,
1.863035, 0.1698136, -0.3017264, 1, 1, 1, 1, 1,
1.901929, 1.091483, 2.120925, 1, 1, 1, 1, 1,
1.910042, -0.662689, 2.157887, 1, 1, 1, 1, 1,
1.918079, -0.6599201, 1.686584, 1, 1, 1, 1, 1,
1.93609, 0.4064151, 3.053044, 1, 1, 1, 1, 1,
1.942985, 0.004398605, 2.950308, 1, 1, 1, 1, 1,
1.964545, -2.525414, 2.878012, 1, 1, 1, 1, 1,
1.965501, 0.6748283, 1.26106, 1, 1, 1, 1, 1,
1.967526, -0.2656881, 2.417031, 1, 1, 1, 1, 1,
1.993992, -0.1224816, 0.5799873, 1, 1, 1, 1, 1,
2.007472, 1.823943, 1.819483, 1, 1, 1, 1, 1,
2.01812, -0.8637577, 0.7646099, 0, 0, 1, 1, 1,
2.020567, 0.1066317, 2.53179, 1, 0, 0, 1, 1,
2.068309, 1.274654, 1.598295, 1, 0, 0, 1, 1,
2.078159, 0.2340882, 2.573514, 1, 0, 0, 1, 1,
2.08201, 2.05815, 0.5647141, 1, 0, 0, 1, 1,
2.119409, -0.796903, 2.801916, 1, 0, 0, 1, 1,
2.177163, 1.7108, 2.069097, 0, 0, 0, 1, 1,
2.233718, 0.4478712, 1.34223, 0, 0, 0, 1, 1,
2.235527, -0.36608, 0.6229754, 0, 0, 0, 1, 1,
2.242831, 0.2748213, 0.5168707, 0, 0, 0, 1, 1,
2.246156, 0.2954955, 1.877081, 0, 0, 0, 1, 1,
2.300655, 1.25208, 0.4170232, 0, 0, 0, 1, 1,
2.394426, -0.07899028, 1.565757, 0, 0, 0, 1, 1,
2.448393, -0.9374055, 2.693386, 1, 1, 1, 1, 1,
2.554295, 0.649911, 2.259822, 1, 1, 1, 1, 1,
2.624604, -0.3551201, 2.933622, 1, 1, 1, 1, 1,
2.635742, 0.8450196, 0.7191541, 1, 1, 1, 1, 1,
2.77934, 1.797442, 0.5474475, 1, 1, 1, 1, 1,
2.892008, 2.160585, 0.2115714, 1, 1, 1, 1, 1,
2.97824, 0.08381837, 1.480255, 1, 1, 1, 1, 1
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
var radius = 9.809412;
var distance = 34.45514;
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
mvMatrix.translate( 0.2967808, 0.04311156, -0.6047115 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.45514);
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
