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
-2.724537, 0.5016463, -2.768543, 1, 0, 0, 1,
-2.596058, 0.001539576, -1.475578, 1, 0.007843138, 0, 1,
-2.52833, -0.4805999, -2.477273, 1, 0.01176471, 0, 1,
-2.322541, -0.08935462, -2.862346, 1, 0.01960784, 0, 1,
-2.286395, -0.8757272, -0.8396545, 1, 0.02352941, 0, 1,
-2.280545, 0.320589, -0.4009337, 1, 0.03137255, 0, 1,
-2.213737, -1.238701, -2.445469, 1, 0.03529412, 0, 1,
-2.190598, -0.5543299, -2.048287, 1, 0.04313726, 0, 1,
-2.188086, 0.3415625, -1.442658, 1, 0.04705882, 0, 1,
-2.165682, -0.3868587, -3.22525, 1, 0.05490196, 0, 1,
-2.144044, 1.704251, -0.2949802, 1, 0.05882353, 0, 1,
-2.132637, 0.9074731, -2.374714, 1, 0.06666667, 0, 1,
-2.130022, 1.29566, -1.768934, 1, 0.07058824, 0, 1,
-2.057452, -0.1879311, -2.130631, 1, 0.07843138, 0, 1,
-2.053801, -0.5181223, -2.378398, 1, 0.08235294, 0, 1,
-2.030926, -1.546757, -0.9652901, 1, 0.09019608, 0, 1,
-2.015864, -0.7805714, -2.354997, 1, 0.09411765, 0, 1,
-1.996362, -0.3060338, -1.042116, 1, 0.1019608, 0, 1,
-1.960947, -1.082945, -3.697636, 1, 0.1098039, 0, 1,
-1.960611, 1.044557, -0.9111301, 1, 0.1137255, 0, 1,
-1.95565, 0.546025, -0.8837555, 1, 0.1215686, 0, 1,
-1.925007, 0.8415322, -2.034622, 1, 0.1254902, 0, 1,
-1.887084, 0.907362, -0.5554444, 1, 0.1333333, 0, 1,
-1.879336, 0.1285294, -3.038027, 1, 0.1372549, 0, 1,
-1.86683, 0.5402277, -1.705111, 1, 0.145098, 0, 1,
-1.850273, -1.04671, -1.99208, 1, 0.1490196, 0, 1,
-1.849394, -0.092202, -1.567708, 1, 0.1568628, 0, 1,
-1.818991, -0.2596014, -0.7225948, 1, 0.1607843, 0, 1,
-1.817195, 1.191918, -2.190118, 1, 0.1686275, 0, 1,
-1.814576, -1.853937, -2.695577, 1, 0.172549, 0, 1,
-1.811381, -1.072393, -3.207716, 1, 0.1803922, 0, 1,
-1.808633, -1.238944, -1.545488, 1, 0.1843137, 0, 1,
-1.803367, -0.02686211, -3.166731, 1, 0.1921569, 0, 1,
-1.799432, -1.862786, -1.38122, 1, 0.1960784, 0, 1,
-1.783772, -0.7970155, -0.1733617, 1, 0.2039216, 0, 1,
-1.779159, 0.507556, -1.376834, 1, 0.2117647, 0, 1,
-1.767247, 0.01535603, -1.531987, 1, 0.2156863, 0, 1,
-1.757085, -0.7892231, -1.376639, 1, 0.2235294, 0, 1,
-1.748097, 0.2684821, -2.761884, 1, 0.227451, 0, 1,
-1.744578, 0.6338069, -2.496138, 1, 0.2352941, 0, 1,
-1.735155, -1.540755, -2.65282, 1, 0.2392157, 0, 1,
-1.729321, -0.1735334, -1.165839, 1, 0.2470588, 0, 1,
-1.71932, 0.2266188, -0.8184028, 1, 0.2509804, 0, 1,
-1.706658, 0.2833868, -1.63522, 1, 0.2588235, 0, 1,
-1.68748, 0.2148584, 0.2702039, 1, 0.2627451, 0, 1,
-1.686797, -1.388824, -2.916537, 1, 0.2705882, 0, 1,
-1.681817, -0.9333013, -1.253935, 1, 0.2745098, 0, 1,
-1.681631, -0.9121817, -1.261521, 1, 0.282353, 0, 1,
-1.674672, 0.6007546, -0.3390847, 1, 0.2862745, 0, 1,
-1.673094, -0.09826354, -2.646583, 1, 0.2941177, 0, 1,
-1.664802, -0.08019648, -0.8188069, 1, 0.3019608, 0, 1,
-1.657489, -0.5486135, -2.461638, 1, 0.3058824, 0, 1,
-1.647354, -1.724596, -3.170516, 1, 0.3137255, 0, 1,
-1.645565, -0.984843, -1.206142, 1, 0.3176471, 0, 1,
-1.637338, -0.2561416, -0.7754197, 1, 0.3254902, 0, 1,
-1.629683, 0.4812795, -1.850645, 1, 0.3294118, 0, 1,
-1.61174, -0.8591418, -1.889493, 1, 0.3372549, 0, 1,
-1.610441, 0.7642466, -0.2822635, 1, 0.3411765, 0, 1,
-1.608361, 1.109074, 1.040452, 1, 0.3490196, 0, 1,
-1.59792, 0.5471869, -3.222633, 1, 0.3529412, 0, 1,
-1.59054, -0.3617183, -2.855363, 1, 0.3607843, 0, 1,
-1.584842, -0.4692036, -1.763514, 1, 0.3647059, 0, 1,
-1.579166, -0.3400542, -1.614568, 1, 0.372549, 0, 1,
-1.551441, 0.8589931, 1.144121, 1, 0.3764706, 0, 1,
-1.547849, 1.213871, -2.536699, 1, 0.3843137, 0, 1,
-1.542577, -0.3525719, -0.864853, 1, 0.3882353, 0, 1,
-1.529715, 0.4325753, -1.314953, 1, 0.3960784, 0, 1,
-1.488736, 0.7548472, -1.943338, 1, 0.4039216, 0, 1,
-1.480907, -0.4207314, -1.47362, 1, 0.4078431, 0, 1,
-1.473979, 0.08892341, -1.940234, 1, 0.4156863, 0, 1,
-1.47103, -0.03360571, -0.2910698, 1, 0.4196078, 0, 1,
-1.458377, 1.214804, -1.212859, 1, 0.427451, 0, 1,
-1.452511, 0.2949704, -1.092943, 1, 0.4313726, 0, 1,
-1.452202, -1.03045, -1.141165, 1, 0.4392157, 0, 1,
-1.448238, 0.8751609, -3.284072, 1, 0.4431373, 0, 1,
-1.437375, -2.134494, -3.462814, 1, 0.4509804, 0, 1,
-1.426614, -1.330647, -3.591302, 1, 0.454902, 0, 1,
-1.415913, -0.1938741, -3.584873, 1, 0.4627451, 0, 1,
-1.393577, -0.0508385, -1.847997, 1, 0.4666667, 0, 1,
-1.390474, 1.259089, -1.912171, 1, 0.4745098, 0, 1,
-1.388821, -0.4362258, -1.4388, 1, 0.4784314, 0, 1,
-1.382142, -1.064985, -2.37972, 1, 0.4862745, 0, 1,
-1.363271, 1.984596, -0.8342583, 1, 0.4901961, 0, 1,
-1.348342, 0.3027751, -0.4456346, 1, 0.4980392, 0, 1,
-1.34389, -0.9999941, -2.166486, 1, 0.5058824, 0, 1,
-1.321092, -1.045192, -2.342218, 1, 0.509804, 0, 1,
-1.316115, 0.169771, -1.921216, 1, 0.5176471, 0, 1,
-1.312097, 1.59364, -0.9643103, 1, 0.5215687, 0, 1,
-1.30992, 1.131579, -1.229579, 1, 0.5294118, 0, 1,
-1.304954, -0.2272667, -0.5807753, 1, 0.5333334, 0, 1,
-1.302117, 0.5057506, -1.726588, 1, 0.5411765, 0, 1,
-1.292229, -0.7016832, -1.672062, 1, 0.5450981, 0, 1,
-1.269275, -1.750272, -3.666649, 1, 0.5529412, 0, 1,
-1.26003, -0.5859375, -1.723708, 1, 0.5568628, 0, 1,
-1.258222, -0.9362001, -2.45592, 1, 0.5647059, 0, 1,
-1.251377, 0.5556232, -0.6926053, 1, 0.5686275, 0, 1,
-1.250296, -0.5040782, -2.356397, 1, 0.5764706, 0, 1,
-1.234497, -0.7227371, -3.278871, 1, 0.5803922, 0, 1,
-1.233083, -0.9104901, -2.721985, 1, 0.5882353, 0, 1,
-1.229118, -1.025513, -2.432503, 1, 0.5921569, 0, 1,
-1.205435, 0.1777119, -3.637604, 1, 0.6, 0, 1,
-1.19719, 2.574434, -0.2446128, 1, 0.6078432, 0, 1,
-1.195101, 0.616263, -2.279824, 1, 0.6117647, 0, 1,
-1.18234, 0.08204722, -0.9274784, 1, 0.6196079, 0, 1,
-1.175074, -1.300361, -0.8760546, 1, 0.6235294, 0, 1,
-1.163294, -1.328614, -2.71311, 1, 0.6313726, 0, 1,
-1.162291, -1.102536, -1.539163, 1, 0.6352941, 0, 1,
-1.158795, -0.7120271, -1.218656, 1, 0.6431373, 0, 1,
-1.158279, -0.7638842, -2.090687, 1, 0.6470588, 0, 1,
-1.131833, -0.7609576, -1.400081, 1, 0.654902, 0, 1,
-1.131792, 1.718283, 0.3802041, 1, 0.6588235, 0, 1,
-1.131755, -0.2923948, -1.026073, 1, 0.6666667, 0, 1,
-1.13013, 0.1647593, -0.6755313, 1, 0.6705883, 0, 1,
-1.119555, 0.2959724, -1.95966, 1, 0.6784314, 0, 1,
-1.112494, 0.4275859, -2.515277, 1, 0.682353, 0, 1,
-1.107755, 0.4784953, -1.423476, 1, 0.6901961, 0, 1,
-1.099965, 0.4075384, 0.08051655, 1, 0.6941177, 0, 1,
-1.098709, -0.1597393, -3.10252, 1, 0.7019608, 0, 1,
-1.090165, 0.1775938, -1.521844, 1, 0.7098039, 0, 1,
-1.090142, 0.8107948, -0.7601139, 1, 0.7137255, 0, 1,
-1.077222, -1.269144, -3.357141, 1, 0.7215686, 0, 1,
-1.075124, -1.682659, -2.205537, 1, 0.7254902, 0, 1,
-1.072657, -1.755497, -3.682406, 1, 0.7333333, 0, 1,
-1.067171, -0.5309901, -1.247003, 1, 0.7372549, 0, 1,
-1.066428, 1.783477, 0.005601939, 1, 0.7450981, 0, 1,
-1.06555, 1.201602, -0.5702809, 1, 0.7490196, 0, 1,
-1.063899, 1.318836, 0.9762695, 1, 0.7568628, 0, 1,
-1.057767, -2.086087, -4.78185, 1, 0.7607843, 0, 1,
-1.046158, -0.3092194, -2.554285, 1, 0.7686275, 0, 1,
-1.044853, -1.285626, -1.543151, 1, 0.772549, 0, 1,
-1.037783, 1.090563, -1.420215, 1, 0.7803922, 0, 1,
-1.029117, -0.2033397, -2.441271, 1, 0.7843137, 0, 1,
-1.025843, 1.398064, -1.158805, 1, 0.7921569, 0, 1,
-1.021758, 2.044733, 1.03623, 1, 0.7960784, 0, 1,
-1.020044, 1.682221, -0.3133799, 1, 0.8039216, 0, 1,
-1.017874, 0.4407409, -0.9895262, 1, 0.8117647, 0, 1,
-1.01604, 1.308428, -0.921434, 1, 0.8156863, 0, 1,
-1.000895, 0.9632159, -0.4982982, 1, 0.8235294, 0, 1,
-0.994619, -0.7451823, -3.017447, 1, 0.827451, 0, 1,
-0.9912723, 0.4098374, -0.8020876, 1, 0.8352941, 0, 1,
-0.9861975, 1.857954, 1.709283, 1, 0.8392157, 0, 1,
-0.982329, -0.5173285, -2.561071, 1, 0.8470588, 0, 1,
-0.9792222, 1.514656, -1.235602, 1, 0.8509804, 0, 1,
-0.9786991, 0.7544917, -2.077812, 1, 0.8588235, 0, 1,
-0.9759179, -0.5647525, -1.375055, 1, 0.8627451, 0, 1,
-0.9706778, 0.5633381, -0.695766, 1, 0.8705882, 0, 1,
-0.9686995, 0.4665562, -4.549904, 1, 0.8745098, 0, 1,
-0.9610018, -0.09432171, -3.408922, 1, 0.8823529, 0, 1,
-0.9559915, -0.6394967, -2.057853, 1, 0.8862745, 0, 1,
-0.954985, 1.912014, 0.05447498, 1, 0.8941177, 0, 1,
-0.9486451, 2.533762, 2.033391, 1, 0.8980392, 0, 1,
-0.9443581, -0.1466518, -0.966795, 1, 0.9058824, 0, 1,
-0.9439856, 0.9667833, -1.021186, 1, 0.9137255, 0, 1,
-0.9439519, 0.1729182, -1.50791, 1, 0.9176471, 0, 1,
-0.9355757, -0.08441792, -2.6176, 1, 0.9254902, 0, 1,
-0.9353595, -0.8355446, -3.77566, 1, 0.9294118, 0, 1,
-0.9297509, -0.8692493, -3.63259, 1, 0.9372549, 0, 1,
-0.9266254, -1.034918, -2.535993, 1, 0.9411765, 0, 1,
-0.9260876, -1.677884, -2.4116, 1, 0.9490196, 0, 1,
-0.9236897, 0.1065217, -1.671291, 1, 0.9529412, 0, 1,
-0.9058396, 0.9182845, -1.748956, 1, 0.9607843, 0, 1,
-0.9012931, -1.621697, -2.124166, 1, 0.9647059, 0, 1,
-0.8986009, -1.716373, -4.214941, 1, 0.972549, 0, 1,
-0.8963814, -0.626431, -3.231922, 1, 0.9764706, 0, 1,
-0.8907747, -0.4503229, -4.758128, 1, 0.9843137, 0, 1,
-0.8866563, -1.569757, -3.664981, 1, 0.9882353, 0, 1,
-0.8802286, 0.614808, -1.021609, 1, 0.9960784, 0, 1,
-0.8769731, 1.089849, -1.09724, 0.9960784, 1, 0, 1,
-0.8768911, -0.645822, -1.393113, 0.9921569, 1, 0, 1,
-0.8741295, 0.08584888, -1.320976, 0.9843137, 1, 0, 1,
-0.8732814, 0.9748673, -1.798983, 0.9803922, 1, 0, 1,
-0.8717979, 1.07979, -0.579263, 0.972549, 1, 0, 1,
-0.8693817, -0.1371259, -1.67259, 0.9686275, 1, 0, 1,
-0.8681892, 0.6683012, -1.513941, 0.9607843, 1, 0, 1,
-0.8623291, -1.860179, -2.632387, 0.9568627, 1, 0, 1,
-0.8597045, -0.7380375, -2.131032, 0.9490196, 1, 0, 1,
-0.8588963, 0.6802585, -0.6632965, 0.945098, 1, 0, 1,
-0.8572416, 0.3131049, -1.043431, 0.9372549, 1, 0, 1,
-0.8542571, -0.2702639, -1.510582, 0.9333333, 1, 0, 1,
-0.8483923, -0.9587413, -2.726765, 0.9254902, 1, 0, 1,
-0.8464951, -1.151448, -4.603813, 0.9215686, 1, 0, 1,
-0.8422112, -0.7370857, -0.941761, 0.9137255, 1, 0, 1,
-0.8418542, 0.60502, -0.6051764, 0.9098039, 1, 0, 1,
-0.837236, 0.514007, 0.6280905, 0.9019608, 1, 0, 1,
-0.8369577, 0.01541979, -1.276338, 0.8941177, 1, 0, 1,
-0.8330449, -1.603508, -2.360212, 0.8901961, 1, 0, 1,
-0.83171, -0.9800314, -2.630762, 0.8823529, 1, 0, 1,
-0.8305148, 0.4930852, -1.897548, 0.8784314, 1, 0, 1,
-0.826816, 0.5365146, -0.2577608, 0.8705882, 1, 0, 1,
-0.8241708, -0.01286594, -2.553062, 0.8666667, 1, 0, 1,
-0.8224934, -0.7676781, -1.5207, 0.8588235, 1, 0, 1,
-0.8144693, 0.9366146, -0.2268747, 0.854902, 1, 0, 1,
-0.8080373, -0.9483324, -2.242873, 0.8470588, 1, 0, 1,
-0.8043617, 0.2143008, -1.863431, 0.8431373, 1, 0, 1,
-0.7929946, -2.02487, -1.9927, 0.8352941, 1, 0, 1,
-0.7850628, 1.073619, 0.5862113, 0.8313726, 1, 0, 1,
-0.7848215, -1.287506, -0.9728397, 0.8235294, 1, 0, 1,
-0.7845135, 2.327221, -0.6273994, 0.8196079, 1, 0, 1,
-0.7821779, 0.1396711, -1.042451, 0.8117647, 1, 0, 1,
-0.7778997, 0.3687038, -1.1797, 0.8078431, 1, 0, 1,
-0.7740668, 0.2748141, -0.5745276, 0.8, 1, 0, 1,
-0.7687389, -0.8234091, -3.520855, 0.7921569, 1, 0, 1,
-0.765142, 0.8052868, -0.01246064, 0.7882353, 1, 0, 1,
-0.7644155, -1.850346, -4.454091, 0.7803922, 1, 0, 1,
-0.7631645, 0.2373673, -0.6449062, 0.7764706, 1, 0, 1,
-0.7611638, -0.2375836, -2.466928, 0.7686275, 1, 0, 1,
-0.7594206, 0.6093603, -0.3413721, 0.7647059, 1, 0, 1,
-0.7554477, -0.4454339, -3.234662, 0.7568628, 1, 0, 1,
-0.750599, 0.3062173, -1.628837, 0.7529412, 1, 0, 1,
-0.7458016, -1.368468, -2.644564, 0.7450981, 1, 0, 1,
-0.7429187, -0.284045, -0.5784537, 0.7411765, 1, 0, 1,
-0.7370713, 0.02591901, -1.02458, 0.7333333, 1, 0, 1,
-0.7350969, 0.8256271, -1.061258, 0.7294118, 1, 0, 1,
-0.731104, -2.788089, -3.927416, 0.7215686, 1, 0, 1,
-0.7216945, -1.735544, -2.945873, 0.7176471, 1, 0, 1,
-0.7182428, -0.09842797, -1.686201, 0.7098039, 1, 0, 1,
-0.713091, 2.28717, -0.6375522, 0.7058824, 1, 0, 1,
-0.7102948, 0.2697389, -2.690941, 0.6980392, 1, 0, 1,
-0.7093065, 0.4772726, 0.049371, 0.6901961, 1, 0, 1,
-0.7073394, 0.3799402, -1.060936, 0.6862745, 1, 0, 1,
-0.7073289, 0.8071528, 0.3396033, 0.6784314, 1, 0, 1,
-0.7066514, -1.322763, -1.589141, 0.6745098, 1, 0, 1,
-0.7057158, 0.8954474, -0.3195114, 0.6666667, 1, 0, 1,
-0.6993743, -0.6921073, -2.698585, 0.6627451, 1, 0, 1,
-0.6988181, 1.284259, -0.4481399, 0.654902, 1, 0, 1,
-0.6958606, -1.138667, -1.572375, 0.6509804, 1, 0, 1,
-0.6948772, 1.035597, 0.5361472, 0.6431373, 1, 0, 1,
-0.6947511, 0.8229434, -0.01126262, 0.6392157, 1, 0, 1,
-0.6932984, -0.3406627, -2.552462, 0.6313726, 1, 0, 1,
-0.6921036, 1.860433, -0.2806208, 0.627451, 1, 0, 1,
-0.6871633, -1.064889, -3.687853, 0.6196079, 1, 0, 1,
-0.682717, -2.754694, -2.875753, 0.6156863, 1, 0, 1,
-0.6761344, -1.051128, -2.296679, 0.6078432, 1, 0, 1,
-0.6734049, 0.3180206, -0.3998188, 0.6039216, 1, 0, 1,
-0.6654067, 2.441929, 0.8693807, 0.5960785, 1, 0, 1,
-0.6603557, -0.7590392, -1.308002, 0.5882353, 1, 0, 1,
-0.658036, -0.4292349, -2.318411, 0.5843138, 1, 0, 1,
-0.6524662, 0.1809749, -1.385824, 0.5764706, 1, 0, 1,
-0.6513193, 0.098641, 0.1595022, 0.572549, 1, 0, 1,
-0.6499004, 0.1235141, -1.285809, 0.5647059, 1, 0, 1,
-0.6492028, 1.491735, -0.8171759, 0.5607843, 1, 0, 1,
-0.6471092, 1.414551, -0.7473204, 0.5529412, 1, 0, 1,
-0.6414183, -0.3591659, -2.340431, 0.5490196, 1, 0, 1,
-0.6406071, -0.9519643, -2.602968, 0.5411765, 1, 0, 1,
-0.6389151, 2.138003, -1.402144, 0.5372549, 1, 0, 1,
-0.6385978, 1.044111, -1.070374, 0.5294118, 1, 0, 1,
-0.6376654, 0.8958917, -0.1681959, 0.5254902, 1, 0, 1,
-0.637297, -0.230434, -2.049801, 0.5176471, 1, 0, 1,
-0.6368276, -0.06913135, -1.282926, 0.5137255, 1, 0, 1,
-0.6352201, 2.532648, 0.8163547, 0.5058824, 1, 0, 1,
-0.6234406, 2.356205, 0.3453773, 0.5019608, 1, 0, 1,
-0.6195918, -0.6145221, -4.41296, 0.4941176, 1, 0, 1,
-0.61862, 1.089053, 0.3052106, 0.4862745, 1, 0, 1,
-0.6145734, -2.647648, -4.111682, 0.4823529, 1, 0, 1,
-0.6067898, -1.279938, -2.553473, 0.4745098, 1, 0, 1,
-0.605336, 0.03079029, -1.935662, 0.4705882, 1, 0, 1,
-0.6043713, 0.3169565, -2.872937, 0.4627451, 1, 0, 1,
-0.5999334, 0.7969368, -1.596143, 0.4588235, 1, 0, 1,
-0.5949179, -0.2307051, -2.52351, 0.4509804, 1, 0, 1,
-0.5918083, -1.346564, -5.145671, 0.4470588, 1, 0, 1,
-0.5866355, -1.27211, -2.747733, 0.4392157, 1, 0, 1,
-0.5841299, -2.143439, -1.113573, 0.4352941, 1, 0, 1,
-0.5813498, -1.549266, -3.026284, 0.427451, 1, 0, 1,
-0.5810087, -1.180628, -3.558351, 0.4235294, 1, 0, 1,
-0.5779454, 1.190062, 0.3704007, 0.4156863, 1, 0, 1,
-0.5729968, -1.213692, -2.794836, 0.4117647, 1, 0, 1,
-0.567991, -1.155649, -2.573339, 0.4039216, 1, 0, 1,
-0.5650713, 1.054361, -1.835839, 0.3960784, 1, 0, 1,
-0.5612497, -0.008914766, -1.764572, 0.3921569, 1, 0, 1,
-0.559536, 0.3732109, 1.017939, 0.3843137, 1, 0, 1,
-0.5533354, 0.3246199, -1.822, 0.3803922, 1, 0, 1,
-0.5522113, 1.324008, -0.01468457, 0.372549, 1, 0, 1,
-0.5521941, -1.73483, -2.352025, 0.3686275, 1, 0, 1,
-0.5481883, 0.01810892, -1.081945, 0.3607843, 1, 0, 1,
-0.5441923, 1.607073, 1.994806, 0.3568628, 1, 0, 1,
-0.543969, 1.354701, -1.07963, 0.3490196, 1, 0, 1,
-0.5429624, -0.1002584, -1.141482, 0.345098, 1, 0, 1,
-0.5425147, 1.695997, -0.550333, 0.3372549, 1, 0, 1,
-0.5387352, 0.6629846, -1.444977, 0.3333333, 1, 0, 1,
-0.5386783, 0.3585863, -0.9986575, 0.3254902, 1, 0, 1,
-0.5383385, 0.122324, -1.671595, 0.3215686, 1, 0, 1,
-0.5337787, -0.3550526, -2.638826, 0.3137255, 1, 0, 1,
-0.5310102, -0.08507184, -2.083314, 0.3098039, 1, 0, 1,
-0.5237241, 0.5353689, 0.09689819, 0.3019608, 1, 0, 1,
-0.5214077, 0.1021821, -0.9595426, 0.2941177, 1, 0, 1,
-0.5200067, 2.219134, 0.2510687, 0.2901961, 1, 0, 1,
-0.5176593, -0.6396159, -3.485211, 0.282353, 1, 0, 1,
-0.5173923, -0.2305384, -1.078849, 0.2784314, 1, 0, 1,
-0.5170069, 0.943034, -0.3012994, 0.2705882, 1, 0, 1,
-0.5103472, 1.0762, 0.1497316, 0.2666667, 1, 0, 1,
-0.5068919, -0.1570766, -2.528379, 0.2588235, 1, 0, 1,
-0.506712, -0.6192241, -1.968797, 0.254902, 1, 0, 1,
-0.5058494, -0.4725779, -2.413344, 0.2470588, 1, 0, 1,
-0.5016302, 0.7207264, -1.678689, 0.2431373, 1, 0, 1,
-0.5003657, -0.3165102, -3.353885, 0.2352941, 1, 0, 1,
-0.5000547, -0.1610375, -1.741868, 0.2313726, 1, 0, 1,
-0.4973183, 0.3681408, -0.8211179, 0.2235294, 1, 0, 1,
-0.4942542, 0.3576507, -1.075785, 0.2196078, 1, 0, 1,
-0.4942059, -2.119326, -2.779509, 0.2117647, 1, 0, 1,
-0.4894665, -0.318856, -1.530057, 0.2078431, 1, 0, 1,
-0.4839185, -1.451171, -2.4009, 0.2, 1, 0, 1,
-0.4820626, 1.034741, -0.3182334, 0.1921569, 1, 0, 1,
-0.4801436, -0.8531492, -3.371397, 0.1882353, 1, 0, 1,
-0.4796668, 1.272165, 0.2166796, 0.1803922, 1, 0, 1,
-0.4770134, 0.3823408, -0.09505045, 0.1764706, 1, 0, 1,
-0.475961, -1.139724, -2.160101, 0.1686275, 1, 0, 1,
-0.4659707, -0.6039418, -2.637458, 0.1647059, 1, 0, 1,
-0.4621505, -1.327625, -2.701356, 0.1568628, 1, 0, 1,
-0.455792, -1.396709, -2.839713, 0.1529412, 1, 0, 1,
-0.4491674, 0.2003284, -0.6197651, 0.145098, 1, 0, 1,
-0.4484219, -1.275015, -2.859656, 0.1411765, 1, 0, 1,
-0.4463246, 1.304094, 2.468626, 0.1333333, 1, 0, 1,
-0.4446931, 1.273138, 0.5693315, 0.1294118, 1, 0, 1,
-0.443615, 0.3998533, -1.033787, 0.1215686, 1, 0, 1,
-0.44008, 0.3338774, -0.1587752, 0.1176471, 1, 0, 1,
-0.4371996, -0.2311286, -1.270587, 0.1098039, 1, 0, 1,
-0.4370618, 0.4784378, -0.02951911, 0.1058824, 1, 0, 1,
-0.4362507, -1.187446, -2.667733, 0.09803922, 1, 0, 1,
-0.4350294, 0.7604023, 0.1189935, 0.09019608, 1, 0, 1,
-0.4291333, 1.994693, -0.3067235, 0.08627451, 1, 0, 1,
-0.42307, -0.9326093, -4.470526, 0.07843138, 1, 0, 1,
-0.4226925, 0.8466959, 1.263454, 0.07450981, 1, 0, 1,
-0.416225, 1.280914, -0.1360952, 0.06666667, 1, 0, 1,
-0.4115131, -0.2290222, -2.718795, 0.0627451, 1, 0, 1,
-0.4056106, 2.079251, -0.3833878, 0.05490196, 1, 0, 1,
-0.4052599, 2.125745, 1.290145, 0.05098039, 1, 0, 1,
-0.4049349, 0.9102253, 0.3537426, 0.04313726, 1, 0, 1,
-0.4035076, 1.3702, 0.7283749, 0.03921569, 1, 0, 1,
-0.4007665, -0.2175003, -3.055173, 0.03137255, 1, 0, 1,
-0.4001091, 0.321525, -2.482999, 0.02745098, 1, 0, 1,
-0.4000716, 0.8907747, -0.9566637, 0.01960784, 1, 0, 1,
-0.3978317, -1.087609, -4.496565, 0.01568628, 1, 0, 1,
-0.3830361, 1.074727, -0.625462, 0.007843138, 1, 0, 1,
-0.3808462, 0.4583136, 0.6560385, 0.003921569, 1, 0, 1,
-0.3790419, -0.02124471, -2.539751, 0, 1, 0.003921569, 1,
-0.3776237, -0.5308837, -3.026696, 0, 1, 0.01176471, 1,
-0.3770797, 0.5916526, -1.617196, 0, 1, 0.01568628, 1,
-0.3765081, -2.099853, -3.477766, 0, 1, 0.02352941, 1,
-0.3741744, 2.121693, -0.8032609, 0, 1, 0.02745098, 1,
-0.372365, 1.383138, 0.5323628, 0, 1, 0.03529412, 1,
-0.3707796, 0.08501839, -1.913311, 0, 1, 0.03921569, 1,
-0.3707557, -0.3050043, -3.624901, 0, 1, 0.04705882, 1,
-0.3667932, -0.9026109, -2.267061, 0, 1, 0.05098039, 1,
-0.3660111, 0.3904969, 1.493383, 0, 1, 0.05882353, 1,
-0.3634421, 0.03923463, -1.692072, 0, 1, 0.0627451, 1,
-0.3632074, -0.7370592, -2.842809, 0, 1, 0.07058824, 1,
-0.3589435, -0.1564919, -1.380845, 0, 1, 0.07450981, 1,
-0.3588453, 0.8434275, -1.905388, 0, 1, 0.08235294, 1,
-0.3570196, -0.8145767, -4.283856, 0, 1, 0.08627451, 1,
-0.3528815, 1.412812, 0.9196116, 0, 1, 0.09411765, 1,
-0.3491057, -0.2943565, -2.325243, 0, 1, 0.1019608, 1,
-0.3445768, -0.7816687, -2.374722, 0, 1, 0.1058824, 1,
-0.3439285, 0.2592425, 0.05754396, 0, 1, 0.1137255, 1,
-0.3436841, 0.8736901, -1.759263, 0, 1, 0.1176471, 1,
-0.3416258, 0.5078384, 0.996056, 0, 1, 0.1254902, 1,
-0.3401565, 0.9389042, -0.4303897, 0, 1, 0.1294118, 1,
-0.3392083, 1.176111, 1.148689, 0, 1, 0.1372549, 1,
-0.3386007, -0.161388, -2.946059, 0, 1, 0.1411765, 1,
-0.3380102, -1.23042, 0.0231502, 0, 1, 0.1490196, 1,
-0.3369867, -1.321372, -3.190547, 0, 1, 0.1529412, 1,
-0.329972, -1.379255, -2.408138, 0, 1, 0.1607843, 1,
-0.3283352, 0.4017232, 1.729781, 0, 1, 0.1647059, 1,
-0.3282712, -1.941296, -2.285869, 0, 1, 0.172549, 1,
-0.3275378, 0.5871069, -1.021833, 0, 1, 0.1764706, 1,
-0.32621, -1.964379, -1.024595, 0, 1, 0.1843137, 1,
-0.322424, 1.292502, 0.7500408, 0, 1, 0.1882353, 1,
-0.3152535, 0.2654263, 0.1738899, 0, 1, 0.1960784, 1,
-0.3150075, 0.7950466, -1.973977, 0, 1, 0.2039216, 1,
-0.3146698, -1.040199, -1.330545, 0, 1, 0.2078431, 1,
-0.3104456, 0.9538714, 1.413973, 0, 1, 0.2156863, 1,
-0.3101003, -0.4102167, -1.099438, 0, 1, 0.2196078, 1,
-0.3063038, -0.7399238, -4.147773, 0, 1, 0.227451, 1,
-0.3058906, 1.187829, 0.949161, 0, 1, 0.2313726, 1,
-0.3046315, 0.3280881, -1.30549, 0, 1, 0.2392157, 1,
-0.3027637, -0.8920057, -4.41424, 0, 1, 0.2431373, 1,
-0.2959578, 1.082923, -0.9726009, 0, 1, 0.2509804, 1,
-0.2953542, 0.01073975, -0.8410443, 0, 1, 0.254902, 1,
-0.2910771, 1.982564, 0.5690452, 0, 1, 0.2627451, 1,
-0.290854, 0.3621064, 1.051808, 0, 1, 0.2666667, 1,
-0.2889167, 1.184745, 0.6255157, 0, 1, 0.2745098, 1,
-0.2886742, 0.7224167, -0.007241585, 0, 1, 0.2784314, 1,
-0.2869732, -0.5777815, -3.742363, 0, 1, 0.2862745, 1,
-0.2855976, -1.632951, -4.167833, 0, 1, 0.2901961, 1,
-0.2810421, -0.5241992, -0.5730872, 0, 1, 0.2980392, 1,
-0.2808011, 1.630498, 1.011464, 0, 1, 0.3058824, 1,
-0.2769926, -0.9170921, -3.681138, 0, 1, 0.3098039, 1,
-0.2749353, 1.105765, -0.9096792, 0, 1, 0.3176471, 1,
-0.2709103, 0.2539665, -2.608923, 0, 1, 0.3215686, 1,
-0.2700426, 1.942539, -1.282218, 0, 1, 0.3294118, 1,
-0.2686794, 1.443922, 0.9502199, 0, 1, 0.3333333, 1,
-0.2682011, 0.04214482, -2.077456, 0, 1, 0.3411765, 1,
-0.2646803, -0.3269834, -1.873963, 0, 1, 0.345098, 1,
-0.2624562, -1.859065, -1.399793, 0, 1, 0.3529412, 1,
-0.2585291, 0.5680115, 0.6841357, 0, 1, 0.3568628, 1,
-0.2505884, -1.678732, -1.041633, 0, 1, 0.3647059, 1,
-0.2474679, -0.7523842, -2.756367, 0, 1, 0.3686275, 1,
-0.2470883, -0.7018659, -3.499392, 0, 1, 0.3764706, 1,
-0.2432183, 0.5601512, -0.8593414, 0, 1, 0.3803922, 1,
-0.2427142, 1.979162, 1.040111, 0, 1, 0.3882353, 1,
-0.2404791, -0.07454833, -1.57175, 0, 1, 0.3921569, 1,
-0.2401167, 0.4351422, -0.9880588, 0, 1, 0.4, 1,
-0.2367203, 1.942756, -0.3048312, 0, 1, 0.4078431, 1,
-0.2361384, 0.6409389, -0.365914, 0, 1, 0.4117647, 1,
-0.231606, -1.033949, -0.5908778, 0, 1, 0.4196078, 1,
-0.228715, 0.3506917, -1.004035, 0, 1, 0.4235294, 1,
-0.228243, 0.697796, -0.01322363, 0, 1, 0.4313726, 1,
-0.2273291, 1.801172, -0.5918585, 0, 1, 0.4352941, 1,
-0.2267409, -0.6985318, -3.699352, 0, 1, 0.4431373, 1,
-0.2226796, -0.992063, -4.844057, 0, 1, 0.4470588, 1,
-0.2219314, 0.03309287, -2.428005, 0, 1, 0.454902, 1,
-0.2206927, 1.755994, 0.03264618, 0, 1, 0.4588235, 1,
-0.2175992, 1.358569, -0.2163021, 0, 1, 0.4666667, 1,
-0.2151477, 0.6257648, 0.7378264, 0, 1, 0.4705882, 1,
-0.2095134, 0.9372072, -1.031603, 0, 1, 0.4784314, 1,
-0.2071104, 0.1407335, -1.105695, 0, 1, 0.4823529, 1,
-0.2050948, -0.02982399, -1.829207, 0, 1, 0.4901961, 1,
-0.2047822, 0.827006, -1.892121, 0, 1, 0.4941176, 1,
-0.2024481, -0.2127654, -2.180153, 0, 1, 0.5019608, 1,
-0.2002244, -0.3578044, -3.509901, 0, 1, 0.509804, 1,
-0.1976404, -0.6432313, -3.841893, 0, 1, 0.5137255, 1,
-0.1969152, -0.8560103, -2.371865, 0, 1, 0.5215687, 1,
-0.196185, -0.08459058, -4.289986, 0, 1, 0.5254902, 1,
-0.1905658, -0.3028256, -2.88901, 0, 1, 0.5333334, 1,
-0.1870019, 0.1835413, -2.992379, 0, 1, 0.5372549, 1,
-0.1845967, -1.999609, -3.299908, 0, 1, 0.5450981, 1,
-0.1842057, 1.317482, 0.178731, 0, 1, 0.5490196, 1,
-0.1840666, 0.2872941, -0.1915599, 0, 1, 0.5568628, 1,
-0.1810774, 0.1531319, -1.226469, 0, 1, 0.5607843, 1,
-0.1795078, -1.103938, -2.145154, 0, 1, 0.5686275, 1,
-0.1790329, 0.4246655, -0.6159597, 0, 1, 0.572549, 1,
-0.1764015, -0.06982261, -1.51025, 0, 1, 0.5803922, 1,
-0.1710864, 0.120124, -0.1537928, 0, 1, 0.5843138, 1,
-0.1705212, -0.01990447, -1.367455, 0, 1, 0.5921569, 1,
-0.1690944, -0.07072968, -0.1696207, 0, 1, 0.5960785, 1,
-0.1682966, 1.24489, -0.4882762, 0, 1, 0.6039216, 1,
-0.1638319, 0.9846947, -1.743642, 0, 1, 0.6117647, 1,
-0.1629178, -0.1762721, -3.03902, 0, 1, 0.6156863, 1,
-0.1597099, 1.722894, 0.06738096, 0, 1, 0.6235294, 1,
-0.1593893, 0.8283184, -0.02509928, 0, 1, 0.627451, 1,
-0.1510873, -1.999121, -2.346992, 0, 1, 0.6352941, 1,
-0.1494218, 0.4102746, -0.5735099, 0, 1, 0.6392157, 1,
-0.1481405, 0.8977388, -0.4550529, 0, 1, 0.6470588, 1,
-0.1480169, -0.63998, -2.293728, 0, 1, 0.6509804, 1,
-0.1437933, 0.4504789, -2.180224, 0, 1, 0.6588235, 1,
-0.1387037, -0.8527783, -3.582849, 0, 1, 0.6627451, 1,
-0.1358246, -0.8105368, -2.610313, 0, 1, 0.6705883, 1,
-0.13393, 0.5259174, -0.483496, 0, 1, 0.6745098, 1,
-0.1315264, 0.7249683, 1.066286, 0, 1, 0.682353, 1,
-0.1313116, 1.053448, -0.9773714, 0, 1, 0.6862745, 1,
-0.128112, 0.5564162, 0.7374011, 0, 1, 0.6941177, 1,
-0.1240316, 0.1262351, -1.705063, 0, 1, 0.7019608, 1,
-0.1214771, 0.5938664, -0.2834773, 0, 1, 0.7058824, 1,
-0.1214182, 1.782729, -1.589804, 0, 1, 0.7137255, 1,
-0.1197184, 0.01372077, -1.438938, 0, 1, 0.7176471, 1,
-0.1187406, 0.4800078, 0.6404998, 0, 1, 0.7254902, 1,
-0.1125222, 0.4411984, -0.9680042, 0, 1, 0.7294118, 1,
-0.112229, -0.5528969, -1.738694, 0, 1, 0.7372549, 1,
-0.1100419, -0.09034508, -1.421414, 0, 1, 0.7411765, 1,
-0.1085383, -1.516949, -4.517942, 0, 1, 0.7490196, 1,
-0.103322, 0.8974386, 1.607095, 0, 1, 0.7529412, 1,
-0.09881176, -1.940479, -2.845714, 0, 1, 0.7607843, 1,
-0.09241876, -0.4326059, -2.815344, 0, 1, 0.7647059, 1,
-0.09067925, 0.1373715, -1.255628, 0, 1, 0.772549, 1,
-0.09025235, 1.052889, -1.027069, 0, 1, 0.7764706, 1,
-0.08936002, -1.117247, -4.25587, 0, 1, 0.7843137, 1,
-0.08510893, -1.355504, -2.083753, 0, 1, 0.7882353, 1,
-0.07758559, -0.902374, -1.772046, 0, 1, 0.7960784, 1,
-0.07306321, 1.689755, 0.9651477, 0, 1, 0.8039216, 1,
-0.07153632, -0.1489237, -3.658143, 0, 1, 0.8078431, 1,
-0.07058721, 0.6649891, -0.342588, 0, 1, 0.8156863, 1,
-0.0693247, -2.322, -3.604186, 0, 1, 0.8196079, 1,
-0.06643344, -0.01261625, -2.179912, 0, 1, 0.827451, 1,
-0.06532977, 0.8226823, 1.176054, 0, 1, 0.8313726, 1,
-0.06514194, 1.555856, 0.6825593, 0, 1, 0.8392157, 1,
-0.06065387, -0.2516222, -3.422169, 0, 1, 0.8431373, 1,
-0.06028511, -1.240492, -2.635918, 0, 1, 0.8509804, 1,
-0.06004253, -0.9420588, -1.342562, 0, 1, 0.854902, 1,
-0.05580772, 0.4485466, 0.525221, 0, 1, 0.8627451, 1,
-0.05376241, 0.8989597, -1.300243, 0, 1, 0.8666667, 1,
-0.05323159, 0.1546915, 0.4198953, 0, 1, 0.8745098, 1,
-0.04951011, -0.05776275, -1.661614, 0, 1, 0.8784314, 1,
-0.04834773, -0.3241954, -3.538762, 0, 1, 0.8862745, 1,
-0.04796315, -0.2515619, -3.996331, 0, 1, 0.8901961, 1,
-0.04621273, -0.8799495, -3.142805, 0, 1, 0.8980392, 1,
-0.03891665, -1.315491, -2.65352, 0, 1, 0.9058824, 1,
-0.03883114, 0.6912664, 1.355695, 0, 1, 0.9098039, 1,
-0.03630938, -0.3379139, -2.466796, 0, 1, 0.9176471, 1,
-0.02934058, 0.1814965, 1.693072, 0, 1, 0.9215686, 1,
-0.02693333, -1.110741, -2.625896, 0, 1, 0.9294118, 1,
-0.02645903, 0.6472673, 1.132994, 0, 1, 0.9333333, 1,
-0.01503984, -0.7353317, -3.102625, 0, 1, 0.9411765, 1,
-0.01294881, -0.6198087, -3.574487, 0, 1, 0.945098, 1,
-0.005839086, -0.5774418, -3.82165, 0, 1, 0.9529412, 1,
-0.005325862, -1.596496, -2.327888, 0, 1, 0.9568627, 1,
-0.003526605, -1.223817, -2.912659, 0, 1, 0.9647059, 1,
0.001246618, 0.2203963, 0.3042157, 0, 1, 0.9686275, 1,
0.003066936, -0.7152359, 3.087712, 0, 1, 0.9764706, 1,
0.005534213, 0.9824044, -0.4214658, 0, 1, 0.9803922, 1,
0.009074126, -0.8064363, 2.542879, 0, 1, 0.9882353, 1,
0.01206884, -1.304147, 2.965883, 0, 1, 0.9921569, 1,
0.0140368, -0.2419259, 2.945567, 0, 1, 1, 1,
0.01490591, -0.7225305, 2.44498, 0, 0.9921569, 1, 1,
0.01891813, -0.9684833, 2.726118, 0, 0.9882353, 1, 1,
0.02196958, 0.7903328, -0.006663782, 0, 0.9803922, 1, 1,
0.02337527, 0.2062592, -1.901126, 0, 0.9764706, 1, 1,
0.02589577, -0.5113264, 4.273198, 0, 0.9686275, 1, 1,
0.03139073, 0.8963929, 1.307457, 0, 0.9647059, 1, 1,
0.03598936, 0.1890558, 0.6923981, 0, 0.9568627, 1, 1,
0.03688224, -1.522414, 2.38148, 0, 0.9529412, 1, 1,
0.03764428, -1.159067, 3.633238, 0, 0.945098, 1, 1,
0.04072524, 1.100759, -0.06354166, 0, 0.9411765, 1, 1,
0.04523493, -0.02864048, 1.220593, 0, 0.9333333, 1, 1,
0.05296903, 1.95132, -1.483994, 0, 0.9294118, 1, 1,
0.0550363, -1.556988, 4.009965, 0, 0.9215686, 1, 1,
0.05866393, -1.145483, 4.552625, 0, 0.9176471, 1, 1,
0.06032115, 0.6462932, -1.452645, 0, 0.9098039, 1, 1,
0.06043265, -0.1696171, 2.854854, 0, 0.9058824, 1, 1,
0.06227684, 0.4816868, -0.9680156, 0, 0.8980392, 1, 1,
0.06236999, 0.7734317, -0.4548464, 0, 0.8901961, 1, 1,
0.06339928, 0.8805746, -0.8100633, 0, 0.8862745, 1, 1,
0.0637375, -0.6474645, 5.65094, 0, 0.8784314, 1, 1,
0.0667197, 1.212936, -0.1818567, 0, 0.8745098, 1, 1,
0.06894741, -1.239815, 2.103786, 0, 0.8666667, 1, 1,
0.07100932, -0.4188822, 1.793478, 0, 0.8627451, 1, 1,
0.0733937, 0.18265, -0.1102522, 0, 0.854902, 1, 1,
0.07800687, 0.808894, -0.7317608, 0, 0.8509804, 1, 1,
0.07996283, -0.4746655, 1.68147, 0, 0.8431373, 1, 1,
0.08242836, -0.9883747, 3.333424, 0, 0.8392157, 1, 1,
0.08386327, 0.03612122, 1.355079, 0, 0.8313726, 1, 1,
0.08785224, 0.2433821, 0.6850172, 0, 0.827451, 1, 1,
0.0894312, 1.545646, 0.3037299, 0, 0.8196079, 1, 1,
0.08987734, 0.1620962, 0.97293, 0, 0.8156863, 1, 1,
0.09009381, -0.270472, 3.31181, 0, 0.8078431, 1, 1,
0.09077818, -0.008089037, 3.071222, 0, 0.8039216, 1, 1,
0.09130653, -0.7663738, 4.09159, 0, 0.7960784, 1, 1,
0.09339888, 1.008625, -0.942235, 0, 0.7882353, 1, 1,
0.09763981, 0.1115511, 0.8641561, 0, 0.7843137, 1, 1,
0.09981461, 0.3144322, 1.004787, 0, 0.7764706, 1, 1,
0.1068589, 0.1781935, -0.05209352, 0, 0.772549, 1, 1,
0.1087184, 1.031919, -0.4538725, 0, 0.7647059, 1, 1,
0.1099441, -0.536315, 0.7250386, 0, 0.7607843, 1, 1,
0.1152707, 0.06875411, 2.214205, 0, 0.7529412, 1, 1,
0.1228014, -0.3460602, 3.786809, 0, 0.7490196, 1, 1,
0.1243325, 0.5861723, -1.025697, 0, 0.7411765, 1, 1,
0.1251578, 0.6076146, 0.5235282, 0, 0.7372549, 1, 1,
0.1332905, 7.836492e-05, 2.213294, 0, 0.7294118, 1, 1,
0.1345117, 1.244665, -0.1967454, 0, 0.7254902, 1, 1,
0.1349688, -1.46403, 3.192762, 0, 0.7176471, 1, 1,
0.1363463, 0.767469, 0.7986037, 0, 0.7137255, 1, 1,
0.1417787, -1.043459, 4.151047, 0, 0.7058824, 1, 1,
0.143282, -0.5215381, 3.294781, 0, 0.6980392, 1, 1,
0.1454009, -0.2738819, 1.62107, 0, 0.6941177, 1, 1,
0.1466037, -1.234379, 3.019505, 0, 0.6862745, 1, 1,
0.1557435, 0.3740439, 0.1169312, 0, 0.682353, 1, 1,
0.1565797, 0.5391981, -0.4130554, 0, 0.6745098, 1, 1,
0.1594499, -0.2154828, 3.155974, 0, 0.6705883, 1, 1,
0.1610315, 1.073573, 1.702919, 0, 0.6627451, 1, 1,
0.1611614, -0.850852, 2.057154, 0, 0.6588235, 1, 1,
0.1614981, 0.009833715, 0.5628153, 0, 0.6509804, 1, 1,
0.1635149, -0.2031312, 3.104624, 0, 0.6470588, 1, 1,
0.1669552, -0.5179738, 2.690964, 0, 0.6392157, 1, 1,
0.1682732, 0.5799938, 1.63631, 0, 0.6352941, 1, 1,
0.1689769, -0.4617036, 4.205454, 0, 0.627451, 1, 1,
0.1700154, 1.168113, -1.453043, 0, 0.6235294, 1, 1,
0.17023, -1.423705, 2.415916, 0, 0.6156863, 1, 1,
0.1713543, -0.01215362, 1.115848, 0, 0.6117647, 1, 1,
0.1740377, -1.423622, 0.8898627, 0, 0.6039216, 1, 1,
0.1779236, 0.3440785, -0.1842314, 0, 0.5960785, 1, 1,
0.1822368, -0.0008828575, 3.481206, 0, 0.5921569, 1, 1,
0.1829044, -0.8669739, 2.648401, 0, 0.5843138, 1, 1,
0.1839413, 1.160857, -0.7695106, 0, 0.5803922, 1, 1,
0.186799, -0.9196118, 3.457607, 0, 0.572549, 1, 1,
0.1869447, -0.04715193, 1.597267, 0, 0.5686275, 1, 1,
0.1925519, -0.314896, 3.852016, 0, 0.5607843, 1, 1,
0.1931988, 0.7035749, -0.07283612, 0, 0.5568628, 1, 1,
0.1972121, 1.398332, 0.8547786, 0, 0.5490196, 1, 1,
0.2018626, 1.53847, -1.234446, 0, 0.5450981, 1, 1,
0.2024764, -0.8907964, 3.762544, 0, 0.5372549, 1, 1,
0.2049434, 1.012821, 1.566167, 0, 0.5333334, 1, 1,
0.2102, 2.365949, -0.03174989, 0, 0.5254902, 1, 1,
0.2149773, -0.10481, 1.28122, 0, 0.5215687, 1, 1,
0.2171186, 0.8459411, 1.026318, 0, 0.5137255, 1, 1,
0.2237196, 0.6390129, -0.4664377, 0, 0.509804, 1, 1,
0.226651, 0.3800784, 0.2041751, 0, 0.5019608, 1, 1,
0.2301945, 0.508687, 0.1975349, 0, 0.4941176, 1, 1,
0.2315143, -0.3302232, 1.267432, 0, 0.4901961, 1, 1,
0.2330654, -0.1227755, 3.444542, 0, 0.4823529, 1, 1,
0.2452045, -1.694406, 3.121279, 0, 0.4784314, 1, 1,
0.2464586, 0.5943289, 0.6886994, 0, 0.4705882, 1, 1,
0.2468239, -0.6819715, 3.820414, 0, 0.4666667, 1, 1,
0.2548477, 0.3193652, 0.1240231, 0, 0.4588235, 1, 1,
0.256447, 0.5687305, -0.165566, 0, 0.454902, 1, 1,
0.2576632, 0.9075078, 1.419426, 0, 0.4470588, 1, 1,
0.2587185, 0.3178055, -0.08819675, 0, 0.4431373, 1, 1,
0.2637557, -0.6789812, 1.875759, 0, 0.4352941, 1, 1,
0.2660054, 0.330591, 1.99675, 0, 0.4313726, 1, 1,
0.2666327, -0.7647806, 3.492063, 0, 0.4235294, 1, 1,
0.2679864, -0.5050825, 0.9529284, 0, 0.4196078, 1, 1,
0.2753075, -0.1901071, 1.02959, 0, 0.4117647, 1, 1,
0.277463, 1.428731, -0.0893466, 0, 0.4078431, 1, 1,
0.2776736, 0.8379973, 0.9854033, 0, 0.4, 1, 1,
0.2785163, -0.8444752, 3.841799, 0, 0.3921569, 1, 1,
0.2786269, 0.5847368, 2.793012, 0, 0.3882353, 1, 1,
0.2813784, 0.1977801, 0.6105106, 0, 0.3803922, 1, 1,
0.2840825, -0.3688077, 3.990291, 0, 0.3764706, 1, 1,
0.2899599, 0.7992704, -0.7384551, 0, 0.3686275, 1, 1,
0.2911079, -0.8681056, 1.616265, 0, 0.3647059, 1, 1,
0.2919797, 0.3706687, -0.06021602, 0, 0.3568628, 1, 1,
0.2952035, -0.3050751, 4.528273, 0, 0.3529412, 1, 1,
0.2963808, -0.3205416, 4.63389, 0, 0.345098, 1, 1,
0.3020455, 0.8750114, -0.245464, 0, 0.3411765, 1, 1,
0.3022881, 2.103732, 1.102417, 0, 0.3333333, 1, 1,
0.3028358, 2.041429, -0.1429206, 0, 0.3294118, 1, 1,
0.3057101, 0.8259455, 1.821351, 0, 0.3215686, 1, 1,
0.3090409, -0.08217358, 2.044625, 0, 0.3176471, 1, 1,
0.3095384, -0.210946, 3.90429, 0, 0.3098039, 1, 1,
0.3103652, 0.7726452, 1.959783, 0, 0.3058824, 1, 1,
0.311538, 0.2752953, -0.1034775, 0, 0.2980392, 1, 1,
0.3130203, -0.4212706, 2.731729, 0, 0.2901961, 1, 1,
0.3138611, -0.1155868, 0.9188734, 0, 0.2862745, 1, 1,
0.3178107, 0.1059781, 1.470535, 0, 0.2784314, 1, 1,
0.3199214, -0.7083234, 1.757367, 0, 0.2745098, 1, 1,
0.3205335, 1.065024, 0.3612055, 0, 0.2666667, 1, 1,
0.3254313, -0.4393567, 1.870631, 0, 0.2627451, 1, 1,
0.3266342, -0.006952661, 0.4479417, 0, 0.254902, 1, 1,
0.3290223, -1.277336, 1.853532, 0, 0.2509804, 1, 1,
0.3301015, -0.09646592, 2.450242, 0, 0.2431373, 1, 1,
0.3323356, 0.6353288, 0.5619016, 0, 0.2392157, 1, 1,
0.3343312, -0.9692085, 1.671896, 0, 0.2313726, 1, 1,
0.3343781, 0.5251219, 0.4574397, 0, 0.227451, 1, 1,
0.3343855, 0.3239695, 1.433883, 0, 0.2196078, 1, 1,
0.3372193, 1.270635, 0.7291313, 0, 0.2156863, 1, 1,
0.3386471, -0.2993651, 3.123361, 0, 0.2078431, 1, 1,
0.3456453, -1.994512, 0.2524724, 0, 0.2039216, 1, 1,
0.3466805, 0.3560835, 1.611502, 0, 0.1960784, 1, 1,
0.3544984, 0.8717924, -1.571824, 0, 0.1882353, 1, 1,
0.3546636, -0.2203628, 0.6703442, 0, 0.1843137, 1, 1,
0.3554158, 0.01511366, 2.229155, 0, 0.1764706, 1, 1,
0.3557209, -0.5366697, 3.567297, 0, 0.172549, 1, 1,
0.3602209, -0.5927392, 1.270204, 0, 0.1647059, 1, 1,
0.3621919, -1.12866, 2.368124, 0, 0.1607843, 1, 1,
0.3634286, -0.4586643, 2.698558, 0, 0.1529412, 1, 1,
0.3639929, -1.259564, 5.612535, 0, 0.1490196, 1, 1,
0.3665437, 0.844623, 0.7225848, 0, 0.1411765, 1, 1,
0.3669684, 0.5984305, 0.9821555, 0, 0.1372549, 1, 1,
0.3677122, -1.936951, 3.012968, 0, 0.1294118, 1, 1,
0.3677286, 0.4655243, -0.1912126, 0, 0.1254902, 1, 1,
0.3679971, 1.252803, 1.054285, 0, 0.1176471, 1, 1,
0.3824227, -0.1626359, 3.296417, 0, 0.1137255, 1, 1,
0.3841504, 0.7097824, 1.62469, 0, 0.1058824, 1, 1,
0.38648, 0.02689879, 0.599593, 0, 0.09803922, 1, 1,
0.386599, -0.08800636, 2.241281, 0, 0.09411765, 1, 1,
0.3893481, 0.2858212, 0.5700648, 0, 0.08627451, 1, 1,
0.3915584, 0.6878752, -0.05322104, 0, 0.08235294, 1, 1,
0.3917925, -0.7235619, 2.882169, 0, 0.07450981, 1, 1,
0.3946365, 0.08978196, 1.219704, 0, 0.07058824, 1, 1,
0.3966659, 1.22282, 0.990616, 0, 0.0627451, 1, 1,
0.398097, 0.1879496, 0.6724342, 0, 0.05882353, 1, 1,
0.400653, 0.9251875, 0.08399825, 0, 0.05098039, 1, 1,
0.4035993, 1.580108, 1.135892, 0, 0.04705882, 1, 1,
0.4050376, -0.1373626, 1.214951, 0, 0.03921569, 1, 1,
0.4106583, 1.108852, 0.4833859, 0, 0.03529412, 1, 1,
0.4118099, -0.9868262, 2.8988, 0, 0.02745098, 1, 1,
0.4152097, 1.347554, 0.1376749, 0, 0.02352941, 1, 1,
0.4162716, -0.8711637, 1.113768, 0, 0.01568628, 1, 1,
0.419303, -0.3190997, -0.610702, 0, 0.01176471, 1, 1,
0.4228938, -0.4075905, 2.629176, 0, 0.003921569, 1, 1,
0.4236897, -1.130038, 3.20887, 0.003921569, 0, 1, 1,
0.4237696, 0.6163245, 0.4566947, 0.007843138, 0, 1, 1,
0.426643, 0.2149013, 1.86369, 0.01568628, 0, 1, 1,
0.4368355, -0.4282157, 1.57542, 0.01960784, 0, 1, 1,
0.4369169, 2.085502, -2.47472, 0.02745098, 0, 1, 1,
0.440786, -0.5566176, 3.266056, 0.03137255, 0, 1, 1,
0.4415391, 0.2936655, 1.417491, 0.03921569, 0, 1, 1,
0.4430211, -0.5889653, 3.444086, 0.04313726, 0, 1, 1,
0.4444791, 0.8231626, -0.8423265, 0.05098039, 0, 1, 1,
0.4520819, -1.426149, 4.018591, 0.05490196, 0, 1, 1,
0.4548908, 1.20161, 0.1330759, 0.0627451, 0, 1, 1,
0.4581505, 0.4369064, 2.926059, 0.06666667, 0, 1, 1,
0.4628805, 1.368059, 0.02303877, 0.07450981, 0, 1, 1,
0.4631441, 0.8162042, 0.5157851, 0.07843138, 0, 1, 1,
0.4639006, -0.542116, 2.864367, 0.08627451, 0, 1, 1,
0.4640327, -1.881098, 3.028586, 0.09019608, 0, 1, 1,
0.4672948, -0.3219349, 2.541793, 0.09803922, 0, 1, 1,
0.4681518, -0.6619281, 2.533777, 0.1058824, 0, 1, 1,
0.4730019, -0.9453857, 3.130525, 0.1098039, 0, 1, 1,
0.4732658, -0.2629798, 1.828455, 0.1176471, 0, 1, 1,
0.473788, 1.344614, 2.895891, 0.1215686, 0, 1, 1,
0.4788532, -0.9191753, 2.992762, 0.1294118, 0, 1, 1,
0.4812997, 0.200744, 1.828213, 0.1333333, 0, 1, 1,
0.4866812, 1.584545, -0.01061679, 0.1411765, 0, 1, 1,
0.4917078, 0.6967688, 1.575469, 0.145098, 0, 1, 1,
0.5014406, 0.8546236, 1.935255, 0.1529412, 0, 1, 1,
0.5033289, 0.8858544, 0.4216963, 0.1568628, 0, 1, 1,
0.5035639, 0.1481045, 1.733586, 0.1647059, 0, 1, 1,
0.5047148, -0.2192111, 0.4637115, 0.1686275, 0, 1, 1,
0.5096816, -0.673316, 3.802743, 0.1764706, 0, 1, 1,
0.5111284, 1.452345, 0.8799674, 0.1803922, 0, 1, 1,
0.5113715, 0.3839117, 0.4364994, 0.1882353, 0, 1, 1,
0.5154133, 0.7110896, 0.605553, 0.1921569, 0, 1, 1,
0.5161555, 0.1318747, 1.156127, 0.2, 0, 1, 1,
0.5177517, -2.265796, 4.47089, 0.2078431, 0, 1, 1,
0.5183094, -0.3178531, 2.235013, 0.2117647, 0, 1, 1,
0.5192347, 1.208479, 1.128025, 0.2196078, 0, 1, 1,
0.5379411, -0.5697756, 3.120931, 0.2235294, 0, 1, 1,
0.5407059, -1.237424, 3.588554, 0.2313726, 0, 1, 1,
0.5407951, -2.175169, 2.03046, 0.2352941, 0, 1, 1,
0.544578, -0.7149591, 2.472844, 0.2431373, 0, 1, 1,
0.5475872, 1.06317, -0.1000384, 0.2470588, 0, 1, 1,
0.549302, -1.515305, 3.054684, 0.254902, 0, 1, 1,
0.5505688, -0.3293176, 1.903614, 0.2588235, 0, 1, 1,
0.5517534, 1.52913, -0.6484995, 0.2666667, 0, 1, 1,
0.5522293, 0.9880269, 1.434034, 0.2705882, 0, 1, 1,
0.5540127, -0.5324935, 2.905443, 0.2784314, 0, 1, 1,
0.5541605, -1.082963, 0.9810911, 0.282353, 0, 1, 1,
0.555042, 0.8405443, 2.392327, 0.2901961, 0, 1, 1,
0.5557331, 0.5879437, 0.5292022, 0.2941177, 0, 1, 1,
0.5574104, -0.00783536, 0.8348771, 0.3019608, 0, 1, 1,
0.5590263, 0.3457483, 0.1746612, 0.3098039, 0, 1, 1,
0.561323, -0.7645502, 0.242673, 0.3137255, 0, 1, 1,
0.566686, 0.5933758, 0.9964696, 0.3215686, 0, 1, 1,
0.5688829, -0.4622186, 3.157039, 0.3254902, 0, 1, 1,
0.5738561, -0.4230512, -1.396692, 0.3333333, 0, 1, 1,
0.5744726, 0.3446506, 0.9492921, 0.3372549, 0, 1, 1,
0.5796812, -1.13859, 2.518689, 0.345098, 0, 1, 1,
0.5814487, -1.060685, 3.186709, 0.3490196, 0, 1, 1,
0.5814692, -0.6708072, 3.467325, 0.3568628, 0, 1, 1,
0.5852359, -0.05781138, 0.3031377, 0.3607843, 0, 1, 1,
0.587238, 0.6817178, -0.806824, 0.3686275, 0, 1, 1,
0.5938903, 0.3635915, -0.2520813, 0.372549, 0, 1, 1,
0.5959582, -0.8835132, 1.80535, 0.3803922, 0, 1, 1,
0.5987117, -0.08222368, 0.06471186, 0.3843137, 0, 1, 1,
0.6044288, 0.4236899, 0.770924, 0.3921569, 0, 1, 1,
0.6048768, 0.2424625, 1.377882, 0.3960784, 0, 1, 1,
0.6173482, -0.2505004, 1.567173, 0.4039216, 0, 1, 1,
0.6195235, -0.3391325, 2.672548, 0.4117647, 0, 1, 1,
0.6228247, 0.8430479, 2.001423, 0.4156863, 0, 1, 1,
0.6276407, -0.2336388, 1.025064, 0.4235294, 0, 1, 1,
0.6289942, -0.9052094, 1.626921, 0.427451, 0, 1, 1,
0.6306243, 1.178557, -1.217591, 0.4352941, 0, 1, 1,
0.6341121, -1.647207, 2.240318, 0.4392157, 0, 1, 1,
0.6368268, -0.1349947, 1.561566, 0.4470588, 0, 1, 1,
0.6389973, 0.5838476, 1.438834, 0.4509804, 0, 1, 1,
0.6479617, -0.7317885, 0.7461684, 0.4588235, 0, 1, 1,
0.6499492, -1.002355, 1.840624, 0.4627451, 0, 1, 1,
0.6520904, 0.2262741, 0.9432791, 0.4705882, 0, 1, 1,
0.6580498, 0.1816915, 1.399804, 0.4745098, 0, 1, 1,
0.6613882, -2.311228, 2.075926, 0.4823529, 0, 1, 1,
0.6641972, -0.02193625, 0.8267941, 0.4862745, 0, 1, 1,
0.6643253, 0.9987004, 0.5675536, 0.4941176, 0, 1, 1,
0.6650099, 0.2540731, 0.4999333, 0.5019608, 0, 1, 1,
0.6674749, -0.7581056, 1.545899, 0.5058824, 0, 1, 1,
0.670074, 0.09347994, 0.6821709, 0.5137255, 0, 1, 1,
0.6701781, 2.094852, 1.244982, 0.5176471, 0, 1, 1,
0.6769894, 1.721539, 1.356413, 0.5254902, 0, 1, 1,
0.6791255, 1.944477, 0.8853682, 0.5294118, 0, 1, 1,
0.6828246, -0.8602653, 1.146372, 0.5372549, 0, 1, 1,
0.6865543, -1.440073, 2.363865, 0.5411765, 0, 1, 1,
0.6886489, 0.7475947, 1.367119, 0.5490196, 0, 1, 1,
0.6890317, -2.049646, 2.364022, 0.5529412, 0, 1, 1,
0.703123, -0.02143606, 2.298552, 0.5607843, 0, 1, 1,
0.7075395, 0.2963381, 0.07869842, 0.5647059, 0, 1, 1,
0.7118222, 0.7499695, 2.233776, 0.572549, 0, 1, 1,
0.7148575, -1.392727, 3.171978, 0.5764706, 0, 1, 1,
0.7152534, 1.734561, 2.371398, 0.5843138, 0, 1, 1,
0.7176335, 0.3907431, 0.8792794, 0.5882353, 0, 1, 1,
0.7194514, -0.903706, 1.367067, 0.5960785, 0, 1, 1,
0.7205887, 1.444912, 0.9710267, 0.6039216, 0, 1, 1,
0.7231227, 1.507284, 1.437918, 0.6078432, 0, 1, 1,
0.7259378, 1.596248, -0.8009052, 0.6156863, 0, 1, 1,
0.7266455, -0.6971428, 3.554221, 0.6196079, 0, 1, 1,
0.7292566, 0.6586621, -0.6847648, 0.627451, 0, 1, 1,
0.7307925, 0.502108, 0.9621997, 0.6313726, 0, 1, 1,
0.7368774, 0.1234277, 1.950657, 0.6392157, 0, 1, 1,
0.7371266, -0.8262403, 3.433343, 0.6431373, 0, 1, 1,
0.7372218, 0.505226, 1.11499, 0.6509804, 0, 1, 1,
0.7472652, 0.003447319, 0.05785035, 0.654902, 0, 1, 1,
0.7481865, -0.04064152, 1.674374, 0.6627451, 0, 1, 1,
0.7488225, -0.3318163, 1.791523, 0.6666667, 0, 1, 1,
0.7563215, -1.657019, 3.293766, 0.6745098, 0, 1, 1,
0.7624641, 0.6618885, 1.4345, 0.6784314, 0, 1, 1,
0.7792322, -0.4568838, 2.063738, 0.6862745, 0, 1, 1,
0.7836262, -1.018654, 2.585744, 0.6901961, 0, 1, 1,
0.7905722, -0.4483725, 2.198256, 0.6980392, 0, 1, 1,
0.7958712, 0.844379, 0.6842905, 0.7058824, 0, 1, 1,
0.8066939, 0.8776671, -0.4585688, 0.7098039, 0, 1, 1,
0.807266, -1.134279, 1.420913, 0.7176471, 0, 1, 1,
0.8085788, 0.2259661, 2.382426, 0.7215686, 0, 1, 1,
0.8086361, 1.195235, 0.9230266, 0.7294118, 0, 1, 1,
0.8118054, 0.9380912, 1.19613, 0.7333333, 0, 1, 1,
0.8126352, -0.659102, -0.3556156, 0.7411765, 0, 1, 1,
0.8151593, -1.786817, 3.710245, 0.7450981, 0, 1, 1,
0.8255333, -0.532972, 2.364573, 0.7529412, 0, 1, 1,
0.8266798, -0.2836735, 2.655104, 0.7568628, 0, 1, 1,
0.8372272, 0.9295205, -0.6860126, 0.7647059, 0, 1, 1,
0.8388757, -0.01280551, 2.582223, 0.7686275, 0, 1, 1,
0.8395388, -0.1341402, 0.2528102, 0.7764706, 0, 1, 1,
0.8418602, 0.4450595, 1.804821, 0.7803922, 0, 1, 1,
0.8524862, -0.1864132, 2.094802, 0.7882353, 0, 1, 1,
0.8524926, -1.847693, 1.949883, 0.7921569, 0, 1, 1,
0.8536296, -1.449404, 2.525317, 0.8, 0, 1, 1,
0.855626, 1.057445, 0.1204012, 0.8078431, 0, 1, 1,
0.8588259, 1.230341, 2.577509, 0.8117647, 0, 1, 1,
0.861116, 1.326226, 0.1634363, 0.8196079, 0, 1, 1,
0.865203, -0.7725541, 1.943439, 0.8235294, 0, 1, 1,
0.8678427, -1.087945, 0.6512829, 0.8313726, 0, 1, 1,
0.8734607, -0.05712596, 1.741486, 0.8352941, 0, 1, 1,
0.8819712, -0.4996263, 2.795719, 0.8431373, 0, 1, 1,
0.8944454, 0.8987145, 1.517721, 0.8470588, 0, 1, 1,
0.8956221, -0.7465329, 2.093317, 0.854902, 0, 1, 1,
0.8996118, 0.3072269, 2.53179, 0.8588235, 0, 1, 1,
0.900988, 0.8357971, 0.8452525, 0.8666667, 0, 1, 1,
0.902813, -0.435084, 2.273972, 0.8705882, 0, 1, 1,
0.9069854, 0.3996187, 1.70469, 0.8784314, 0, 1, 1,
0.9072182, 2.088931, -1.666333, 0.8823529, 0, 1, 1,
0.9110218, -0.5621053, 0.4491657, 0.8901961, 0, 1, 1,
0.923279, -0.6085116, 2.331179, 0.8941177, 0, 1, 1,
0.9240122, -0.2491334, 1.703196, 0.9019608, 0, 1, 1,
0.9256268, 0.2820737, 0.2674174, 0.9098039, 0, 1, 1,
0.927362, 0.1381388, 1.210126, 0.9137255, 0, 1, 1,
0.9349213, -1.9677, 1.924892, 0.9215686, 0, 1, 1,
0.9380813, 1.595454, -0.1117394, 0.9254902, 0, 1, 1,
0.93978, -0.908542, 1.453036, 0.9333333, 0, 1, 1,
0.943867, -0.5997663, 2.784089, 0.9372549, 0, 1, 1,
0.946, -1.69231, 3.192519, 0.945098, 0, 1, 1,
0.9515094, -0.05278886, 1.359196, 0.9490196, 0, 1, 1,
0.9564603, -1.360918, 1.688566, 0.9568627, 0, 1, 1,
0.9688447, 0.7213061, 1.780197, 0.9607843, 0, 1, 1,
0.9702294, 0.3838008, 2.413065, 0.9686275, 0, 1, 1,
0.9754937, -0.004599178, 0.4843484, 0.972549, 0, 1, 1,
0.9775171, -1.097754, 2.738664, 0.9803922, 0, 1, 1,
0.9812482, -0.1277979, 3.107563, 0.9843137, 0, 1, 1,
0.983205, 1.246968, 0.2347897, 0.9921569, 0, 1, 1,
0.9869148, 1.29868, 0.08725189, 0.9960784, 0, 1, 1,
0.9962792, -0.4123387, 2.767285, 1, 0, 0.9960784, 1,
1.004492, 1.484587, 0.1331505, 1, 0, 0.9882353, 1,
1.005001, -0.2707573, -0.02373413, 1, 0, 0.9843137, 1,
1.008624, 1.349241, 1.030417, 1, 0, 0.9764706, 1,
1.010965, -0.04257545, 1.406332, 1, 0, 0.972549, 1,
1.012816, 1.25344, 1.394714, 1, 0, 0.9647059, 1,
1.027536, 0.5187262, 0.3551955, 1, 0, 0.9607843, 1,
1.046241, 0.5044612, 1.390046, 1, 0, 0.9529412, 1,
1.053228, 1.478579, 0.5808975, 1, 0, 0.9490196, 1,
1.062879, -0.3556354, 2.9058, 1, 0, 0.9411765, 1,
1.063204, -0.9557209, 2.072196, 1, 0, 0.9372549, 1,
1.077467, 0.7291799, -0.3081921, 1, 0, 0.9294118, 1,
1.087707, -0.4420826, 2.778076, 1, 0, 0.9254902, 1,
1.094824, -0.5125768, 2.611826, 1, 0, 0.9176471, 1,
1.097625, 0.02327177, 1.902994, 1, 0, 0.9137255, 1,
1.118984, -0.3518415, 1.580338, 1, 0, 0.9058824, 1,
1.122758, -1.042431, 0.9021437, 1, 0, 0.9019608, 1,
1.126604, -0.5954364, 2.907097, 1, 0, 0.8941177, 1,
1.131389, -0.4461673, 2.711428, 1, 0, 0.8862745, 1,
1.13473, -1.293715, 1.983521, 1, 0, 0.8823529, 1,
1.136798, -1.191202, 3.509589, 1, 0, 0.8745098, 1,
1.144323, 0.0590465, 3.61261, 1, 0, 0.8705882, 1,
1.14645, -0.09288912, 1.631289, 1, 0, 0.8627451, 1,
1.149513, 0.8602701, -0.4050299, 1, 0, 0.8588235, 1,
1.152402, -0.1704903, 2.424669, 1, 0, 0.8509804, 1,
1.154222, 0.3777319, 0.6041268, 1, 0, 0.8470588, 1,
1.156703, -1.228511, 2.483098, 1, 0, 0.8392157, 1,
1.15815, -1.4486, 3.93179, 1, 0, 0.8352941, 1,
1.159865, 0.4807012, 1.373936, 1, 0, 0.827451, 1,
1.16351, -0.3026644, 4.244844, 1, 0, 0.8235294, 1,
1.1759, 0.3246052, 1.444511, 1, 0, 0.8156863, 1,
1.184285, -0.2687448, 1.742698, 1, 0, 0.8117647, 1,
1.186965, 0.2225758, -1.106408, 1, 0, 0.8039216, 1,
1.189943, 0.1463962, 1.844573, 1, 0, 0.7960784, 1,
1.193442, 1.141302, 1.730944, 1, 0, 0.7921569, 1,
1.198476, -0.5434498, 0.57379, 1, 0, 0.7843137, 1,
1.213111, 0.3918418, 1.941773, 1, 0, 0.7803922, 1,
1.216551, -1.85092, 3.234573, 1, 0, 0.772549, 1,
1.227107, 0.2690313, 1.67302, 1, 0, 0.7686275, 1,
1.230448, 0.7183717, 0.5245402, 1, 0, 0.7607843, 1,
1.231821, 1.569732, 1.733842, 1, 0, 0.7568628, 1,
1.232723, -0.7103908, 2.382695, 1, 0, 0.7490196, 1,
1.232935, 0.05463869, -1.22464, 1, 0, 0.7450981, 1,
1.233855, 0.6235834, 1.825754, 1, 0, 0.7372549, 1,
1.250708, -1.155283, 2.714734, 1, 0, 0.7333333, 1,
1.253592, -0.4156439, 0.694482, 1, 0, 0.7254902, 1,
1.257701, 0.5091028, 0.1893238, 1, 0, 0.7215686, 1,
1.259269, -0.5061935, 2.456943, 1, 0, 0.7137255, 1,
1.269913, -0.00447682, 1.878193, 1, 0, 0.7098039, 1,
1.275947, -1.092125, 2.127903, 1, 0, 0.7019608, 1,
1.280375, 0.08254604, 1.72184, 1, 0, 0.6941177, 1,
1.281536, -0.1290517, 4.023211, 1, 0, 0.6901961, 1,
1.284253, -1.155607, 2.616729, 1, 0, 0.682353, 1,
1.286895, -0.08146258, 1.108367, 1, 0, 0.6784314, 1,
1.298369, 1.78372, 0.1019501, 1, 0, 0.6705883, 1,
1.300257, -0.7351818, 2.508191, 1, 0, 0.6666667, 1,
1.300372, 1.019802, -0.1200348, 1, 0, 0.6588235, 1,
1.320111, 0.1534745, 3.058121, 1, 0, 0.654902, 1,
1.320397, 0.6457896, 1.3986, 1, 0, 0.6470588, 1,
1.323262, -0.09436197, 0.32695, 1, 0, 0.6431373, 1,
1.335996, -0.5112708, 1.214116, 1, 0, 0.6352941, 1,
1.343163, 0.8499486, 0.7536619, 1, 0, 0.6313726, 1,
1.349088, -1.299231, 0.5438642, 1, 0, 0.6235294, 1,
1.350446, -0.3333672, 1.298367, 1, 0, 0.6196079, 1,
1.357677, -0.5270038, 4.331434, 1, 0, 0.6117647, 1,
1.357891, -0.8902285, 2.417809, 1, 0, 0.6078432, 1,
1.360009, -0.5770457, 0.5907478, 1, 0, 0.6, 1,
1.361626, -1.500282, 0.4344078, 1, 0, 0.5921569, 1,
1.37503, 1.082881, 1.591426, 1, 0, 0.5882353, 1,
1.380717, -0.5357434, 2.692087, 1, 0, 0.5803922, 1,
1.381484, -1.062592, 2.046497, 1, 0, 0.5764706, 1,
1.385909, -1.24248, 1.354535, 1, 0, 0.5686275, 1,
1.387005, 0.8392779, 2.439814, 1, 0, 0.5647059, 1,
1.391429, 0.4296652, 0.9269282, 1, 0, 0.5568628, 1,
1.400741, 0.5542731, 2.590983, 1, 0, 0.5529412, 1,
1.404401, -1.555208, 3.282307, 1, 0, 0.5450981, 1,
1.411192, -0.007396434, 3.718625, 1, 0, 0.5411765, 1,
1.419389, -1.991961, 1.141725, 1, 0, 0.5333334, 1,
1.427021, -2.14906, 3.379877, 1, 0, 0.5294118, 1,
1.428543, -0.3774445, 1.228647, 1, 0, 0.5215687, 1,
1.437072, -0.6496415, -0.9649504, 1, 0, 0.5176471, 1,
1.442235, 0.5056872, 1.240267, 1, 0, 0.509804, 1,
1.465386, -0.4768434, 2.598228, 1, 0, 0.5058824, 1,
1.466589, 0.5987428, -0.06693985, 1, 0, 0.4980392, 1,
1.470772, -1.185628, 2.664397, 1, 0, 0.4901961, 1,
1.471127, 1.626407, -0.4039242, 1, 0, 0.4862745, 1,
1.482736, 0.4365592, 3.483241, 1, 0, 0.4784314, 1,
1.487627, -0.8896735, 1.046067, 1, 0, 0.4745098, 1,
1.500361, 0.9162384, 1.497624, 1, 0, 0.4666667, 1,
1.505638, -1.149004, 3.107088, 1, 0, 0.4627451, 1,
1.506242, 0.6583695, 0.6577163, 1, 0, 0.454902, 1,
1.50797, 1.878745, 0.704141, 1, 0, 0.4509804, 1,
1.509704, 0.5183929, 1.56138, 1, 0, 0.4431373, 1,
1.513498, -1.522065, 4.627736, 1, 0, 0.4392157, 1,
1.518538, -0.1133782, 2.053807, 1, 0, 0.4313726, 1,
1.52076, -0.1217744, 1.365952, 1, 0, 0.427451, 1,
1.521404, 1.367337, 0.009465175, 1, 0, 0.4196078, 1,
1.529172, -2.919026, 2.083129, 1, 0, 0.4156863, 1,
1.541658, -0.7903698, 0.7849277, 1, 0, 0.4078431, 1,
1.542198, -0.8478331, 2.661171, 1, 0, 0.4039216, 1,
1.543631, -0.6092439, 1.694553, 1, 0, 0.3960784, 1,
1.550478, -0.14461, -0.3012418, 1, 0, 0.3882353, 1,
1.552873, -0.1362553, 1.244847, 1, 0, 0.3843137, 1,
1.555169, -0.8885521, 2.244609, 1, 0, 0.3764706, 1,
1.560653, 0.653643, 0.2137361, 1, 0, 0.372549, 1,
1.561166, -0.6628176, 2.431841, 1, 0, 0.3647059, 1,
1.561611, -0.8371016, 2.229088, 1, 0, 0.3607843, 1,
1.562276, -0.2832197, 0.2349624, 1, 0, 0.3529412, 1,
1.564022, -0.08846129, 0.7356061, 1, 0, 0.3490196, 1,
1.564212, -2.365878, 4.273407, 1, 0, 0.3411765, 1,
1.590909, -0.8299798, 3.083736, 1, 0, 0.3372549, 1,
1.599851, 0.7075846, -0.2892427, 1, 0, 0.3294118, 1,
1.600352, -1.99467, 1.960827, 1, 0, 0.3254902, 1,
1.607504, -1.431495, 3.617947, 1, 0, 0.3176471, 1,
1.616998, 0.4876952, 1.385811, 1, 0, 0.3137255, 1,
1.624913, -0.1175693, 2.662879, 1, 0, 0.3058824, 1,
1.650459, -0.9832869, 2.604702, 1, 0, 0.2980392, 1,
1.656134, -0.2942611, 3.967646, 1, 0, 0.2941177, 1,
1.657513, -0.6873406, 1.204927, 1, 0, 0.2862745, 1,
1.659791, 1.995507, -0.3601802, 1, 0, 0.282353, 1,
1.699675, -0.7068369, 3.022015, 1, 0, 0.2745098, 1,
1.711176, 0.1979524, 2.182752, 1, 0, 0.2705882, 1,
1.74713, -0.8566945, 2.658864, 1, 0, 0.2627451, 1,
1.747187, 1.191005, 1.045441, 1, 0, 0.2588235, 1,
1.749111, -0.6130699, 2.290917, 1, 0, 0.2509804, 1,
1.756485, -0.7701082, 0.7085858, 1, 0, 0.2470588, 1,
1.76644, 0.7742646, -0.09570977, 1, 0, 0.2392157, 1,
1.792774, -2.420515, 3.2967, 1, 0, 0.2352941, 1,
1.795734, -0.1937879, 3.604194, 1, 0, 0.227451, 1,
1.810306, -1.373256, 2.136911, 1, 0, 0.2235294, 1,
1.821217, 0.9182796, 2.050808, 1, 0, 0.2156863, 1,
1.834792, -0.2137057, 1.4536, 1, 0, 0.2117647, 1,
1.838195, 0.3907701, 0.5237195, 1, 0, 0.2039216, 1,
1.841967, 0.9722787, 1.621226, 1, 0, 0.1960784, 1,
1.861194, -0.3687645, 1.573997, 1, 0, 0.1921569, 1,
1.861727, 0.9590445, -0.2852345, 1, 0, 0.1843137, 1,
1.871632, 1.211513, 1.627438, 1, 0, 0.1803922, 1,
1.886201, -0.4646188, 1.807434, 1, 0, 0.172549, 1,
1.929592, -1.08197, 1.848235, 1, 0, 0.1686275, 1,
1.946769, -2.643645, 1.051339, 1, 0, 0.1607843, 1,
1.979433, -0.3208301, 2.332206, 1, 0, 0.1568628, 1,
2.002817, 0.5217406, 2.394449, 1, 0, 0.1490196, 1,
2.005224, -0.7536113, 0.07709892, 1, 0, 0.145098, 1,
2.018309, -1.567763, 0.4113309, 1, 0, 0.1372549, 1,
2.041315, -1.253157, 1.558694, 1, 0, 0.1333333, 1,
2.076956, 0.1901396, 1.200842, 1, 0, 0.1254902, 1,
2.107511, -0.6517585, 1.987564, 1, 0, 0.1215686, 1,
2.110748, -1.019008, 1.75818, 1, 0, 0.1137255, 1,
2.141603, 1.257404, 1.235695, 1, 0, 0.1098039, 1,
2.180825, 0.1696096, 2.049441, 1, 0, 0.1019608, 1,
2.188232, 0.1362905, 1.864207, 1, 0, 0.09411765, 1,
2.225465, -0.2559569, 0.460266, 1, 0, 0.09019608, 1,
2.329652, 0.3860897, 1.393368, 1, 0, 0.08235294, 1,
2.372739, 0.6279438, 1.376115, 1, 0, 0.07843138, 1,
2.388368, -0.8188148, 0.09166799, 1, 0, 0.07058824, 1,
2.392865, -0.13794, 1.745468, 1, 0, 0.06666667, 1,
2.463585, -1.190557, 3.277494, 1, 0, 0.05882353, 1,
2.464568, -0.0907252, 0.5354909, 1, 0, 0.05490196, 1,
2.50457, 0.4244085, 0.9407341, 1, 0, 0.04705882, 1,
2.529718, 0.03929078, 1.376749, 1, 0, 0.04313726, 1,
2.54186, -0.4573086, 3.243739, 1, 0, 0.03529412, 1,
2.585694, 2.094417, -0.1558359, 1, 0, 0.03137255, 1,
2.605351, 1.059701, 1.346765, 1, 0, 0.02352941, 1,
2.754092, 0.112774, 0.1383194, 1, 0, 0.01960784, 1,
2.769023, 0.4826122, 2.597353, 1, 0, 0.01176471, 1,
2.809767, -0.4228424, 2.516033, 1, 0, 0.007843138, 1
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
0.04261494, -3.850167, -6.975697, 0, -0.5, 0.5, 0.5,
0.04261494, -3.850167, -6.975697, 1, -0.5, 0.5, 0.5,
0.04261494, -3.850167, -6.975697, 1, 1.5, 0.5, 0.5,
0.04261494, -3.850167, -6.975697, 0, 1.5, 0.5, 0.5
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
-3.662601, -0.1722959, -6.975697, 0, -0.5, 0.5, 0.5,
-3.662601, -0.1722959, -6.975697, 1, -0.5, 0.5, 0.5,
-3.662601, -0.1722959, -6.975697, 1, 1.5, 0.5, 0.5,
-3.662601, -0.1722959, -6.975697, 0, 1.5, 0.5, 0.5
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
-3.662601, -3.850167, 0.2526345, 0, -0.5, 0.5, 0.5,
-3.662601, -3.850167, 0.2526345, 1, -0.5, 0.5, 0.5,
-3.662601, -3.850167, 0.2526345, 1, 1.5, 0.5, 0.5,
-3.662601, -3.850167, 0.2526345, 0, 1.5, 0.5, 0.5
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
-2, -3.001428, -5.30762,
2, -3.001428, -5.30762,
-2, -3.001428, -5.30762,
-2, -3.142884, -5.585633,
-1, -3.001428, -5.30762,
-1, -3.142884, -5.585633,
0, -3.001428, -5.30762,
0, -3.142884, -5.585633,
1, -3.001428, -5.30762,
1, -3.142884, -5.585633,
2, -3.001428, -5.30762,
2, -3.142884, -5.585633
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
-2, -3.425797, -6.141658, 0, -0.5, 0.5, 0.5,
-2, -3.425797, -6.141658, 1, -0.5, 0.5, 0.5,
-2, -3.425797, -6.141658, 1, 1.5, 0.5, 0.5,
-2, -3.425797, -6.141658, 0, 1.5, 0.5, 0.5,
-1, -3.425797, -6.141658, 0, -0.5, 0.5, 0.5,
-1, -3.425797, -6.141658, 1, -0.5, 0.5, 0.5,
-1, -3.425797, -6.141658, 1, 1.5, 0.5, 0.5,
-1, -3.425797, -6.141658, 0, 1.5, 0.5, 0.5,
0, -3.425797, -6.141658, 0, -0.5, 0.5, 0.5,
0, -3.425797, -6.141658, 1, -0.5, 0.5, 0.5,
0, -3.425797, -6.141658, 1, 1.5, 0.5, 0.5,
0, -3.425797, -6.141658, 0, 1.5, 0.5, 0.5,
1, -3.425797, -6.141658, 0, -0.5, 0.5, 0.5,
1, -3.425797, -6.141658, 1, -0.5, 0.5, 0.5,
1, -3.425797, -6.141658, 1, 1.5, 0.5, 0.5,
1, -3.425797, -6.141658, 0, 1.5, 0.5, 0.5,
2, -3.425797, -6.141658, 0, -0.5, 0.5, 0.5,
2, -3.425797, -6.141658, 1, -0.5, 0.5, 0.5,
2, -3.425797, -6.141658, 1, 1.5, 0.5, 0.5,
2, -3.425797, -6.141658, 0, 1.5, 0.5, 0.5
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
-2.807551, -2, -5.30762,
-2.807551, 2, -5.30762,
-2.807551, -2, -5.30762,
-2.950059, -2, -5.585633,
-2.807551, -1, -5.30762,
-2.950059, -1, -5.585633,
-2.807551, 0, -5.30762,
-2.950059, 0, -5.585633,
-2.807551, 1, -5.30762,
-2.950059, 1, -5.585633,
-2.807551, 2, -5.30762,
-2.950059, 2, -5.585633
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
-3.235076, -2, -6.141658, 0, -0.5, 0.5, 0.5,
-3.235076, -2, -6.141658, 1, -0.5, 0.5, 0.5,
-3.235076, -2, -6.141658, 1, 1.5, 0.5, 0.5,
-3.235076, -2, -6.141658, 0, 1.5, 0.5, 0.5,
-3.235076, -1, -6.141658, 0, -0.5, 0.5, 0.5,
-3.235076, -1, -6.141658, 1, -0.5, 0.5, 0.5,
-3.235076, -1, -6.141658, 1, 1.5, 0.5, 0.5,
-3.235076, -1, -6.141658, 0, 1.5, 0.5, 0.5,
-3.235076, 0, -6.141658, 0, -0.5, 0.5, 0.5,
-3.235076, 0, -6.141658, 1, -0.5, 0.5, 0.5,
-3.235076, 0, -6.141658, 1, 1.5, 0.5, 0.5,
-3.235076, 0, -6.141658, 0, 1.5, 0.5, 0.5,
-3.235076, 1, -6.141658, 0, -0.5, 0.5, 0.5,
-3.235076, 1, -6.141658, 1, -0.5, 0.5, 0.5,
-3.235076, 1, -6.141658, 1, 1.5, 0.5, 0.5,
-3.235076, 1, -6.141658, 0, 1.5, 0.5, 0.5,
-3.235076, 2, -6.141658, 0, -0.5, 0.5, 0.5,
-3.235076, 2, -6.141658, 1, -0.5, 0.5, 0.5,
-3.235076, 2, -6.141658, 1, 1.5, 0.5, 0.5,
-3.235076, 2, -6.141658, 0, 1.5, 0.5, 0.5
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
-2.807551, -3.001428, -4,
-2.807551, -3.001428, 4,
-2.807551, -3.001428, -4,
-2.950059, -3.142884, -4,
-2.807551, -3.001428, -2,
-2.950059, -3.142884, -2,
-2.807551, -3.001428, 0,
-2.950059, -3.142884, 0,
-2.807551, -3.001428, 2,
-2.950059, -3.142884, 2,
-2.807551, -3.001428, 4,
-2.950059, -3.142884, 4
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
-3.235076, -3.425797, -4, 0, -0.5, 0.5, 0.5,
-3.235076, -3.425797, -4, 1, -0.5, 0.5, 0.5,
-3.235076, -3.425797, -4, 1, 1.5, 0.5, 0.5,
-3.235076, -3.425797, -4, 0, 1.5, 0.5, 0.5,
-3.235076, -3.425797, -2, 0, -0.5, 0.5, 0.5,
-3.235076, -3.425797, -2, 1, -0.5, 0.5, 0.5,
-3.235076, -3.425797, -2, 1, 1.5, 0.5, 0.5,
-3.235076, -3.425797, -2, 0, 1.5, 0.5, 0.5,
-3.235076, -3.425797, 0, 0, -0.5, 0.5, 0.5,
-3.235076, -3.425797, 0, 1, -0.5, 0.5, 0.5,
-3.235076, -3.425797, 0, 1, 1.5, 0.5, 0.5,
-3.235076, -3.425797, 0, 0, 1.5, 0.5, 0.5,
-3.235076, -3.425797, 2, 0, -0.5, 0.5, 0.5,
-3.235076, -3.425797, 2, 1, -0.5, 0.5, 0.5,
-3.235076, -3.425797, 2, 1, 1.5, 0.5, 0.5,
-3.235076, -3.425797, 2, 0, 1.5, 0.5, 0.5,
-3.235076, -3.425797, 4, 0, -0.5, 0.5, 0.5,
-3.235076, -3.425797, 4, 1, -0.5, 0.5, 0.5,
-3.235076, -3.425797, 4, 1, 1.5, 0.5, 0.5,
-3.235076, -3.425797, 4, 0, 1.5, 0.5, 0.5
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
-2.807551, -3.001428, -5.30762,
-2.807551, 2.656836, -5.30762,
-2.807551, -3.001428, 5.812889,
-2.807551, 2.656836, 5.812889,
-2.807551, -3.001428, -5.30762,
-2.807551, -3.001428, 5.812889,
-2.807551, 2.656836, -5.30762,
-2.807551, 2.656836, 5.812889,
-2.807551, -3.001428, -5.30762,
2.892781, -3.001428, -5.30762,
-2.807551, -3.001428, 5.812889,
2.892781, -3.001428, 5.812889,
-2.807551, 2.656836, -5.30762,
2.892781, 2.656836, -5.30762,
-2.807551, 2.656836, 5.812889,
2.892781, 2.656836, 5.812889,
2.892781, -3.001428, -5.30762,
2.892781, 2.656836, -5.30762,
2.892781, -3.001428, 5.812889,
2.892781, 2.656836, 5.812889,
2.892781, -3.001428, -5.30762,
2.892781, -3.001428, 5.812889,
2.892781, 2.656836, -5.30762,
2.892781, 2.656836, 5.812889
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
var radius = 7.324989;
var distance = 32.5897;
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
mvMatrix.translate( -0.04261494, 0.1722959, -0.2526345 );
mvMatrix.scale( 1.389379, 1.399709, 0.7121905 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.5897);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Dialifor<-read.table("Dialifor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.724537, 0.5016463, -2.768543, 0, 0, 1, 1, 1,
-2.596058, 0.001539576, -1.475578, 1, 0, 0, 1, 1,
-2.52833, -0.4805999, -2.477273, 1, 0, 0, 1, 1,
-2.322541, -0.08935462, -2.862346, 1, 0, 0, 1, 1,
-2.286395, -0.8757272, -0.8396545, 1, 0, 0, 1, 1,
-2.280545, 0.320589, -0.4009337, 1, 0, 0, 1, 1,
-2.213737, -1.238701, -2.445469, 0, 0, 0, 1, 1,
-2.190598, -0.5543299, -2.048287, 0, 0, 0, 1, 1,
-2.188086, 0.3415625, -1.442658, 0, 0, 0, 1, 1,
-2.165682, -0.3868587, -3.22525, 0, 0, 0, 1, 1,
-2.144044, 1.704251, -0.2949802, 0, 0, 0, 1, 1,
-2.132637, 0.9074731, -2.374714, 0, 0, 0, 1, 1,
-2.130022, 1.29566, -1.768934, 0, 0, 0, 1, 1,
-2.057452, -0.1879311, -2.130631, 1, 1, 1, 1, 1,
-2.053801, -0.5181223, -2.378398, 1, 1, 1, 1, 1,
-2.030926, -1.546757, -0.9652901, 1, 1, 1, 1, 1,
-2.015864, -0.7805714, -2.354997, 1, 1, 1, 1, 1,
-1.996362, -0.3060338, -1.042116, 1, 1, 1, 1, 1,
-1.960947, -1.082945, -3.697636, 1, 1, 1, 1, 1,
-1.960611, 1.044557, -0.9111301, 1, 1, 1, 1, 1,
-1.95565, 0.546025, -0.8837555, 1, 1, 1, 1, 1,
-1.925007, 0.8415322, -2.034622, 1, 1, 1, 1, 1,
-1.887084, 0.907362, -0.5554444, 1, 1, 1, 1, 1,
-1.879336, 0.1285294, -3.038027, 1, 1, 1, 1, 1,
-1.86683, 0.5402277, -1.705111, 1, 1, 1, 1, 1,
-1.850273, -1.04671, -1.99208, 1, 1, 1, 1, 1,
-1.849394, -0.092202, -1.567708, 1, 1, 1, 1, 1,
-1.818991, -0.2596014, -0.7225948, 1, 1, 1, 1, 1,
-1.817195, 1.191918, -2.190118, 0, 0, 1, 1, 1,
-1.814576, -1.853937, -2.695577, 1, 0, 0, 1, 1,
-1.811381, -1.072393, -3.207716, 1, 0, 0, 1, 1,
-1.808633, -1.238944, -1.545488, 1, 0, 0, 1, 1,
-1.803367, -0.02686211, -3.166731, 1, 0, 0, 1, 1,
-1.799432, -1.862786, -1.38122, 1, 0, 0, 1, 1,
-1.783772, -0.7970155, -0.1733617, 0, 0, 0, 1, 1,
-1.779159, 0.507556, -1.376834, 0, 0, 0, 1, 1,
-1.767247, 0.01535603, -1.531987, 0, 0, 0, 1, 1,
-1.757085, -0.7892231, -1.376639, 0, 0, 0, 1, 1,
-1.748097, 0.2684821, -2.761884, 0, 0, 0, 1, 1,
-1.744578, 0.6338069, -2.496138, 0, 0, 0, 1, 1,
-1.735155, -1.540755, -2.65282, 0, 0, 0, 1, 1,
-1.729321, -0.1735334, -1.165839, 1, 1, 1, 1, 1,
-1.71932, 0.2266188, -0.8184028, 1, 1, 1, 1, 1,
-1.706658, 0.2833868, -1.63522, 1, 1, 1, 1, 1,
-1.68748, 0.2148584, 0.2702039, 1, 1, 1, 1, 1,
-1.686797, -1.388824, -2.916537, 1, 1, 1, 1, 1,
-1.681817, -0.9333013, -1.253935, 1, 1, 1, 1, 1,
-1.681631, -0.9121817, -1.261521, 1, 1, 1, 1, 1,
-1.674672, 0.6007546, -0.3390847, 1, 1, 1, 1, 1,
-1.673094, -0.09826354, -2.646583, 1, 1, 1, 1, 1,
-1.664802, -0.08019648, -0.8188069, 1, 1, 1, 1, 1,
-1.657489, -0.5486135, -2.461638, 1, 1, 1, 1, 1,
-1.647354, -1.724596, -3.170516, 1, 1, 1, 1, 1,
-1.645565, -0.984843, -1.206142, 1, 1, 1, 1, 1,
-1.637338, -0.2561416, -0.7754197, 1, 1, 1, 1, 1,
-1.629683, 0.4812795, -1.850645, 1, 1, 1, 1, 1,
-1.61174, -0.8591418, -1.889493, 0, 0, 1, 1, 1,
-1.610441, 0.7642466, -0.2822635, 1, 0, 0, 1, 1,
-1.608361, 1.109074, 1.040452, 1, 0, 0, 1, 1,
-1.59792, 0.5471869, -3.222633, 1, 0, 0, 1, 1,
-1.59054, -0.3617183, -2.855363, 1, 0, 0, 1, 1,
-1.584842, -0.4692036, -1.763514, 1, 0, 0, 1, 1,
-1.579166, -0.3400542, -1.614568, 0, 0, 0, 1, 1,
-1.551441, 0.8589931, 1.144121, 0, 0, 0, 1, 1,
-1.547849, 1.213871, -2.536699, 0, 0, 0, 1, 1,
-1.542577, -0.3525719, -0.864853, 0, 0, 0, 1, 1,
-1.529715, 0.4325753, -1.314953, 0, 0, 0, 1, 1,
-1.488736, 0.7548472, -1.943338, 0, 0, 0, 1, 1,
-1.480907, -0.4207314, -1.47362, 0, 0, 0, 1, 1,
-1.473979, 0.08892341, -1.940234, 1, 1, 1, 1, 1,
-1.47103, -0.03360571, -0.2910698, 1, 1, 1, 1, 1,
-1.458377, 1.214804, -1.212859, 1, 1, 1, 1, 1,
-1.452511, 0.2949704, -1.092943, 1, 1, 1, 1, 1,
-1.452202, -1.03045, -1.141165, 1, 1, 1, 1, 1,
-1.448238, 0.8751609, -3.284072, 1, 1, 1, 1, 1,
-1.437375, -2.134494, -3.462814, 1, 1, 1, 1, 1,
-1.426614, -1.330647, -3.591302, 1, 1, 1, 1, 1,
-1.415913, -0.1938741, -3.584873, 1, 1, 1, 1, 1,
-1.393577, -0.0508385, -1.847997, 1, 1, 1, 1, 1,
-1.390474, 1.259089, -1.912171, 1, 1, 1, 1, 1,
-1.388821, -0.4362258, -1.4388, 1, 1, 1, 1, 1,
-1.382142, -1.064985, -2.37972, 1, 1, 1, 1, 1,
-1.363271, 1.984596, -0.8342583, 1, 1, 1, 1, 1,
-1.348342, 0.3027751, -0.4456346, 1, 1, 1, 1, 1,
-1.34389, -0.9999941, -2.166486, 0, 0, 1, 1, 1,
-1.321092, -1.045192, -2.342218, 1, 0, 0, 1, 1,
-1.316115, 0.169771, -1.921216, 1, 0, 0, 1, 1,
-1.312097, 1.59364, -0.9643103, 1, 0, 0, 1, 1,
-1.30992, 1.131579, -1.229579, 1, 0, 0, 1, 1,
-1.304954, -0.2272667, -0.5807753, 1, 0, 0, 1, 1,
-1.302117, 0.5057506, -1.726588, 0, 0, 0, 1, 1,
-1.292229, -0.7016832, -1.672062, 0, 0, 0, 1, 1,
-1.269275, -1.750272, -3.666649, 0, 0, 0, 1, 1,
-1.26003, -0.5859375, -1.723708, 0, 0, 0, 1, 1,
-1.258222, -0.9362001, -2.45592, 0, 0, 0, 1, 1,
-1.251377, 0.5556232, -0.6926053, 0, 0, 0, 1, 1,
-1.250296, -0.5040782, -2.356397, 0, 0, 0, 1, 1,
-1.234497, -0.7227371, -3.278871, 1, 1, 1, 1, 1,
-1.233083, -0.9104901, -2.721985, 1, 1, 1, 1, 1,
-1.229118, -1.025513, -2.432503, 1, 1, 1, 1, 1,
-1.205435, 0.1777119, -3.637604, 1, 1, 1, 1, 1,
-1.19719, 2.574434, -0.2446128, 1, 1, 1, 1, 1,
-1.195101, 0.616263, -2.279824, 1, 1, 1, 1, 1,
-1.18234, 0.08204722, -0.9274784, 1, 1, 1, 1, 1,
-1.175074, -1.300361, -0.8760546, 1, 1, 1, 1, 1,
-1.163294, -1.328614, -2.71311, 1, 1, 1, 1, 1,
-1.162291, -1.102536, -1.539163, 1, 1, 1, 1, 1,
-1.158795, -0.7120271, -1.218656, 1, 1, 1, 1, 1,
-1.158279, -0.7638842, -2.090687, 1, 1, 1, 1, 1,
-1.131833, -0.7609576, -1.400081, 1, 1, 1, 1, 1,
-1.131792, 1.718283, 0.3802041, 1, 1, 1, 1, 1,
-1.131755, -0.2923948, -1.026073, 1, 1, 1, 1, 1,
-1.13013, 0.1647593, -0.6755313, 0, 0, 1, 1, 1,
-1.119555, 0.2959724, -1.95966, 1, 0, 0, 1, 1,
-1.112494, 0.4275859, -2.515277, 1, 0, 0, 1, 1,
-1.107755, 0.4784953, -1.423476, 1, 0, 0, 1, 1,
-1.099965, 0.4075384, 0.08051655, 1, 0, 0, 1, 1,
-1.098709, -0.1597393, -3.10252, 1, 0, 0, 1, 1,
-1.090165, 0.1775938, -1.521844, 0, 0, 0, 1, 1,
-1.090142, 0.8107948, -0.7601139, 0, 0, 0, 1, 1,
-1.077222, -1.269144, -3.357141, 0, 0, 0, 1, 1,
-1.075124, -1.682659, -2.205537, 0, 0, 0, 1, 1,
-1.072657, -1.755497, -3.682406, 0, 0, 0, 1, 1,
-1.067171, -0.5309901, -1.247003, 0, 0, 0, 1, 1,
-1.066428, 1.783477, 0.005601939, 0, 0, 0, 1, 1,
-1.06555, 1.201602, -0.5702809, 1, 1, 1, 1, 1,
-1.063899, 1.318836, 0.9762695, 1, 1, 1, 1, 1,
-1.057767, -2.086087, -4.78185, 1, 1, 1, 1, 1,
-1.046158, -0.3092194, -2.554285, 1, 1, 1, 1, 1,
-1.044853, -1.285626, -1.543151, 1, 1, 1, 1, 1,
-1.037783, 1.090563, -1.420215, 1, 1, 1, 1, 1,
-1.029117, -0.2033397, -2.441271, 1, 1, 1, 1, 1,
-1.025843, 1.398064, -1.158805, 1, 1, 1, 1, 1,
-1.021758, 2.044733, 1.03623, 1, 1, 1, 1, 1,
-1.020044, 1.682221, -0.3133799, 1, 1, 1, 1, 1,
-1.017874, 0.4407409, -0.9895262, 1, 1, 1, 1, 1,
-1.01604, 1.308428, -0.921434, 1, 1, 1, 1, 1,
-1.000895, 0.9632159, -0.4982982, 1, 1, 1, 1, 1,
-0.994619, -0.7451823, -3.017447, 1, 1, 1, 1, 1,
-0.9912723, 0.4098374, -0.8020876, 1, 1, 1, 1, 1,
-0.9861975, 1.857954, 1.709283, 0, 0, 1, 1, 1,
-0.982329, -0.5173285, -2.561071, 1, 0, 0, 1, 1,
-0.9792222, 1.514656, -1.235602, 1, 0, 0, 1, 1,
-0.9786991, 0.7544917, -2.077812, 1, 0, 0, 1, 1,
-0.9759179, -0.5647525, -1.375055, 1, 0, 0, 1, 1,
-0.9706778, 0.5633381, -0.695766, 1, 0, 0, 1, 1,
-0.9686995, 0.4665562, -4.549904, 0, 0, 0, 1, 1,
-0.9610018, -0.09432171, -3.408922, 0, 0, 0, 1, 1,
-0.9559915, -0.6394967, -2.057853, 0, 0, 0, 1, 1,
-0.954985, 1.912014, 0.05447498, 0, 0, 0, 1, 1,
-0.9486451, 2.533762, 2.033391, 0, 0, 0, 1, 1,
-0.9443581, -0.1466518, -0.966795, 0, 0, 0, 1, 1,
-0.9439856, 0.9667833, -1.021186, 0, 0, 0, 1, 1,
-0.9439519, 0.1729182, -1.50791, 1, 1, 1, 1, 1,
-0.9355757, -0.08441792, -2.6176, 1, 1, 1, 1, 1,
-0.9353595, -0.8355446, -3.77566, 1, 1, 1, 1, 1,
-0.9297509, -0.8692493, -3.63259, 1, 1, 1, 1, 1,
-0.9266254, -1.034918, -2.535993, 1, 1, 1, 1, 1,
-0.9260876, -1.677884, -2.4116, 1, 1, 1, 1, 1,
-0.9236897, 0.1065217, -1.671291, 1, 1, 1, 1, 1,
-0.9058396, 0.9182845, -1.748956, 1, 1, 1, 1, 1,
-0.9012931, -1.621697, -2.124166, 1, 1, 1, 1, 1,
-0.8986009, -1.716373, -4.214941, 1, 1, 1, 1, 1,
-0.8963814, -0.626431, -3.231922, 1, 1, 1, 1, 1,
-0.8907747, -0.4503229, -4.758128, 1, 1, 1, 1, 1,
-0.8866563, -1.569757, -3.664981, 1, 1, 1, 1, 1,
-0.8802286, 0.614808, -1.021609, 1, 1, 1, 1, 1,
-0.8769731, 1.089849, -1.09724, 1, 1, 1, 1, 1,
-0.8768911, -0.645822, -1.393113, 0, 0, 1, 1, 1,
-0.8741295, 0.08584888, -1.320976, 1, 0, 0, 1, 1,
-0.8732814, 0.9748673, -1.798983, 1, 0, 0, 1, 1,
-0.8717979, 1.07979, -0.579263, 1, 0, 0, 1, 1,
-0.8693817, -0.1371259, -1.67259, 1, 0, 0, 1, 1,
-0.8681892, 0.6683012, -1.513941, 1, 0, 0, 1, 1,
-0.8623291, -1.860179, -2.632387, 0, 0, 0, 1, 1,
-0.8597045, -0.7380375, -2.131032, 0, 0, 0, 1, 1,
-0.8588963, 0.6802585, -0.6632965, 0, 0, 0, 1, 1,
-0.8572416, 0.3131049, -1.043431, 0, 0, 0, 1, 1,
-0.8542571, -0.2702639, -1.510582, 0, 0, 0, 1, 1,
-0.8483923, -0.9587413, -2.726765, 0, 0, 0, 1, 1,
-0.8464951, -1.151448, -4.603813, 0, 0, 0, 1, 1,
-0.8422112, -0.7370857, -0.941761, 1, 1, 1, 1, 1,
-0.8418542, 0.60502, -0.6051764, 1, 1, 1, 1, 1,
-0.837236, 0.514007, 0.6280905, 1, 1, 1, 1, 1,
-0.8369577, 0.01541979, -1.276338, 1, 1, 1, 1, 1,
-0.8330449, -1.603508, -2.360212, 1, 1, 1, 1, 1,
-0.83171, -0.9800314, -2.630762, 1, 1, 1, 1, 1,
-0.8305148, 0.4930852, -1.897548, 1, 1, 1, 1, 1,
-0.826816, 0.5365146, -0.2577608, 1, 1, 1, 1, 1,
-0.8241708, -0.01286594, -2.553062, 1, 1, 1, 1, 1,
-0.8224934, -0.7676781, -1.5207, 1, 1, 1, 1, 1,
-0.8144693, 0.9366146, -0.2268747, 1, 1, 1, 1, 1,
-0.8080373, -0.9483324, -2.242873, 1, 1, 1, 1, 1,
-0.8043617, 0.2143008, -1.863431, 1, 1, 1, 1, 1,
-0.7929946, -2.02487, -1.9927, 1, 1, 1, 1, 1,
-0.7850628, 1.073619, 0.5862113, 1, 1, 1, 1, 1,
-0.7848215, -1.287506, -0.9728397, 0, 0, 1, 1, 1,
-0.7845135, 2.327221, -0.6273994, 1, 0, 0, 1, 1,
-0.7821779, 0.1396711, -1.042451, 1, 0, 0, 1, 1,
-0.7778997, 0.3687038, -1.1797, 1, 0, 0, 1, 1,
-0.7740668, 0.2748141, -0.5745276, 1, 0, 0, 1, 1,
-0.7687389, -0.8234091, -3.520855, 1, 0, 0, 1, 1,
-0.765142, 0.8052868, -0.01246064, 0, 0, 0, 1, 1,
-0.7644155, -1.850346, -4.454091, 0, 0, 0, 1, 1,
-0.7631645, 0.2373673, -0.6449062, 0, 0, 0, 1, 1,
-0.7611638, -0.2375836, -2.466928, 0, 0, 0, 1, 1,
-0.7594206, 0.6093603, -0.3413721, 0, 0, 0, 1, 1,
-0.7554477, -0.4454339, -3.234662, 0, 0, 0, 1, 1,
-0.750599, 0.3062173, -1.628837, 0, 0, 0, 1, 1,
-0.7458016, -1.368468, -2.644564, 1, 1, 1, 1, 1,
-0.7429187, -0.284045, -0.5784537, 1, 1, 1, 1, 1,
-0.7370713, 0.02591901, -1.02458, 1, 1, 1, 1, 1,
-0.7350969, 0.8256271, -1.061258, 1, 1, 1, 1, 1,
-0.731104, -2.788089, -3.927416, 1, 1, 1, 1, 1,
-0.7216945, -1.735544, -2.945873, 1, 1, 1, 1, 1,
-0.7182428, -0.09842797, -1.686201, 1, 1, 1, 1, 1,
-0.713091, 2.28717, -0.6375522, 1, 1, 1, 1, 1,
-0.7102948, 0.2697389, -2.690941, 1, 1, 1, 1, 1,
-0.7093065, 0.4772726, 0.049371, 1, 1, 1, 1, 1,
-0.7073394, 0.3799402, -1.060936, 1, 1, 1, 1, 1,
-0.7073289, 0.8071528, 0.3396033, 1, 1, 1, 1, 1,
-0.7066514, -1.322763, -1.589141, 1, 1, 1, 1, 1,
-0.7057158, 0.8954474, -0.3195114, 1, 1, 1, 1, 1,
-0.6993743, -0.6921073, -2.698585, 1, 1, 1, 1, 1,
-0.6988181, 1.284259, -0.4481399, 0, 0, 1, 1, 1,
-0.6958606, -1.138667, -1.572375, 1, 0, 0, 1, 1,
-0.6948772, 1.035597, 0.5361472, 1, 0, 0, 1, 1,
-0.6947511, 0.8229434, -0.01126262, 1, 0, 0, 1, 1,
-0.6932984, -0.3406627, -2.552462, 1, 0, 0, 1, 1,
-0.6921036, 1.860433, -0.2806208, 1, 0, 0, 1, 1,
-0.6871633, -1.064889, -3.687853, 0, 0, 0, 1, 1,
-0.682717, -2.754694, -2.875753, 0, 0, 0, 1, 1,
-0.6761344, -1.051128, -2.296679, 0, 0, 0, 1, 1,
-0.6734049, 0.3180206, -0.3998188, 0, 0, 0, 1, 1,
-0.6654067, 2.441929, 0.8693807, 0, 0, 0, 1, 1,
-0.6603557, -0.7590392, -1.308002, 0, 0, 0, 1, 1,
-0.658036, -0.4292349, -2.318411, 0, 0, 0, 1, 1,
-0.6524662, 0.1809749, -1.385824, 1, 1, 1, 1, 1,
-0.6513193, 0.098641, 0.1595022, 1, 1, 1, 1, 1,
-0.6499004, 0.1235141, -1.285809, 1, 1, 1, 1, 1,
-0.6492028, 1.491735, -0.8171759, 1, 1, 1, 1, 1,
-0.6471092, 1.414551, -0.7473204, 1, 1, 1, 1, 1,
-0.6414183, -0.3591659, -2.340431, 1, 1, 1, 1, 1,
-0.6406071, -0.9519643, -2.602968, 1, 1, 1, 1, 1,
-0.6389151, 2.138003, -1.402144, 1, 1, 1, 1, 1,
-0.6385978, 1.044111, -1.070374, 1, 1, 1, 1, 1,
-0.6376654, 0.8958917, -0.1681959, 1, 1, 1, 1, 1,
-0.637297, -0.230434, -2.049801, 1, 1, 1, 1, 1,
-0.6368276, -0.06913135, -1.282926, 1, 1, 1, 1, 1,
-0.6352201, 2.532648, 0.8163547, 1, 1, 1, 1, 1,
-0.6234406, 2.356205, 0.3453773, 1, 1, 1, 1, 1,
-0.6195918, -0.6145221, -4.41296, 1, 1, 1, 1, 1,
-0.61862, 1.089053, 0.3052106, 0, 0, 1, 1, 1,
-0.6145734, -2.647648, -4.111682, 1, 0, 0, 1, 1,
-0.6067898, -1.279938, -2.553473, 1, 0, 0, 1, 1,
-0.605336, 0.03079029, -1.935662, 1, 0, 0, 1, 1,
-0.6043713, 0.3169565, -2.872937, 1, 0, 0, 1, 1,
-0.5999334, 0.7969368, -1.596143, 1, 0, 0, 1, 1,
-0.5949179, -0.2307051, -2.52351, 0, 0, 0, 1, 1,
-0.5918083, -1.346564, -5.145671, 0, 0, 0, 1, 1,
-0.5866355, -1.27211, -2.747733, 0, 0, 0, 1, 1,
-0.5841299, -2.143439, -1.113573, 0, 0, 0, 1, 1,
-0.5813498, -1.549266, -3.026284, 0, 0, 0, 1, 1,
-0.5810087, -1.180628, -3.558351, 0, 0, 0, 1, 1,
-0.5779454, 1.190062, 0.3704007, 0, 0, 0, 1, 1,
-0.5729968, -1.213692, -2.794836, 1, 1, 1, 1, 1,
-0.567991, -1.155649, -2.573339, 1, 1, 1, 1, 1,
-0.5650713, 1.054361, -1.835839, 1, 1, 1, 1, 1,
-0.5612497, -0.008914766, -1.764572, 1, 1, 1, 1, 1,
-0.559536, 0.3732109, 1.017939, 1, 1, 1, 1, 1,
-0.5533354, 0.3246199, -1.822, 1, 1, 1, 1, 1,
-0.5522113, 1.324008, -0.01468457, 1, 1, 1, 1, 1,
-0.5521941, -1.73483, -2.352025, 1, 1, 1, 1, 1,
-0.5481883, 0.01810892, -1.081945, 1, 1, 1, 1, 1,
-0.5441923, 1.607073, 1.994806, 1, 1, 1, 1, 1,
-0.543969, 1.354701, -1.07963, 1, 1, 1, 1, 1,
-0.5429624, -0.1002584, -1.141482, 1, 1, 1, 1, 1,
-0.5425147, 1.695997, -0.550333, 1, 1, 1, 1, 1,
-0.5387352, 0.6629846, -1.444977, 1, 1, 1, 1, 1,
-0.5386783, 0.3585863, -0.9986575, 1, 1, 1, 1, 1,
-0.5383385, 0.122324, -1.671595, 0, 0, 1, 1, 1,
-0.5337787, -0.3550526, -2.638826, 1, 0, 0, 1, 1,
-0.5310102, -0.08507184, -2.083314, 1, 0, 0, 1, 1,
-0.5237241, 0.5353689, 0.09689819, 1, 0, 0, 1, 1,
-0.5214077, 0.1021821, -0.9595426, 1, 0, 0, 1, 1,
-0.5200067, 2.219134, 0.2510687, 1, 0, 0, 1, 1,
-0.5176593, -0.6396159, -3.485211, 0, 0, 0, 1, 1,
-0.5173923, -0.2305384, -1.078849, 0, 0, 0, 1, 1,
-0.5170069, 0.943034, -0.3012994, 0, 0, 0, 1, 1,
-0.5103472, 1.0762, 0.1497316, 0, 0, 0, 1, 1,
-0.5068919, -0.1570766, -2.528379, 0, 0, 0, 1, 1,
-0.506712, -0.6192241, -1.968797, 0, 0, 0, 1, 1,
-0.5058494, -0.4725779, -2.413344, 0, 0, 0, 1, 1,
-0.5016302, 0.7207264, -1.678689, 1, 1, 1, 1, 1,
-0.5003657, -0.3165102, -3.353885, 1, 1, 1, 1, 1,
-0.5000547, -0.1610375, -1.741868, 1, 1, 1, 1, 1,
-0.4973183, 0.3681408, -0.8211179, 1, 1, 1, 1, 1,
-0.4942542, 0.3576507, -1.075785, 1, 1, 1, 1, 1,
-0.4942059, -2.119326, -2.779509, 1, 1, 1, 1, 1,
-0.4894665, -0.318856, -1.530057, 1, 1, 1, 1, 1,
-0.4839185, -1.451171, -2.4009, 1, 1, 1, 1, 1,
-0.4820626, 1.034741, -0.3182334, 1, 1, 1, 1, 1,
-0.4801436, -0.8531492, -3.371397, 1, 1, 1, 1, 1,
-0.4796668, 1.272165, 0.2166796, 1, 1, 1, 1, 1,
-0.4770134, 0.3823408, -0.09505045, 1, 1, 1, 1, 1,
-0.475961, -1.139724, -2.160101, 1, 1, 1, 1, 1,
-0.4659707, -0.6039418, -2.637458, 1, 1, 1, 1, 1,
-0.4621505, -1.327625, -2.701356, 1, 1, 1, 1, 1,
-0.455792, -1.396709, -2.839713, 0, 0, 1, 1, 1,
-0.4491674, 0.2003284, -0.6197651, 1, 0, 0, 1, 1,
-0.4484219, -1.275015, -2.859656, 1, 0, 0, 1, 1,
-0.4463246, 1.304094, 2.468626, 1, 0, 0, 1, 1,
-0.4446931, 1.273138, 0.5693315, 1, 0, 0, 1, 1,
-0.443615, 0.3998533, -1.033787, 1, 0, 0, 1, 1,
-0.44008, 0.3338774, -0.1587752, 0, 0, 0, 1, 1,
-0.4371996, -0.2311286, -1.270587, 0, 0, 0, 1, 1,
-0.4370618, 0.4784378, -0.02951911, 0, 0, 0, 1, 1,
-0.4362507, -1.187446, -2.667733, 0, 0, 0, 1, 1,
-0.4350294, 0.7604023, 0.1189935, 0, 0, 0, 1, 1,
-0.4291333, 1.994693, -0.3067235, 0, 0, 0, 1, 1,
-0.42307, -0.9326093, -4.470526, 0, 0, 0, 1, 1,
-0.4226925, 0.8466959, 1.263454, 1, 1, 1, 1, 1,
-0.416225, 1.280914, -0.1360952, 1, 1, 1, 1, 1,
-0.4115131, -0.2290222, -2.718795, 1, 1, 1, 1, 1,
-0.4056106, 2.079251, -0.3833878, 1, 1, 1, 1, 1,
-0.4052599, 2.125745, 1.290145, 1, 1, 1, 1, 1,
-0.4049349, 0.9102253, 0.3537426, 1, 1, 1, 1, 1,
-0.4035076, 1.3702, 0.7283749, 1, 1, 1, 1, 1,
-0.4007665, -0.2175003, -3.055173, 1, 1, 1, 1, 1,
-0.4001091, 0.321525, -2.482999, 1, 1, 1, 1, 1,
-0.4000716, 0.8907747, -0.9566637, 1, 1, 1, 1, 1,
-0.3978317, -1.087609, -4.496565, 1, 1, 1, 1, 1,
-0.3830361, 1.074727, -0.625462, 1, 1, 1, 1, 1,
-0.3808462, 0.4583136, 0.6560385, 1, 1, 1, 1, 1,
-0.3790419, -0.02124471, -2.539751, 1, 1, 1, 1, 1,
-0.3776237, -0.5308837, -3.026696, 1, 1, 1, 1, 1,
-0.3770797, 0.5916526, -1.617196, 0, 0, 1, 1, 1,
-0.3765081, -2.099853, -3.477766, 1, 0, 0, 1, 1,
-0.3741744, 2.121693, -0.8032609, 1, 0, 0, 1, 1,
-0.372365, 1.383138, 0.5323628, 1, 0, 0, 1, 1,
-0.3707796, 0.08501839, -1.913311, 1, 0, 0, 1, 1,
-0.3707557, -0.3050043, -3.624901, 1, 0, 0, 1, 1,
-0.3667932, -0.9026109, -2.267061, 0, 0, 0, 1, 1,
-0.3660111, 0.3904969, 1.493383, 0, 0, 0, 1, 1,
-0.3634421, 0.03923463, -1.692072, 0, 0, 0, 1, 1,
-0.3632074, -0.7370592, -2.842809, 0, 0, 0, 1, 1,
-0.3589435, -0.1564919, -1.380845, 0, 0, 0, 1, 1,
-0.3588453, 0.8434275, -1.905388, 0, 0, 0, 1, 1,
-0.3570196, -0.8145767, -4.283856, 0, 0, 0, 1, 1,
-0.3528815, 1.412812, 0.9196116, 1, 1, 1, 1, 1,
-0.3491057, -0.2943565, -2.325243, 1, 1, 1, 1, 1,
-0.3445768, -0.7816687, -2.374722, 1, 1, 1, 1, 1,
-0.3439285, 0.2592425, 0.05754396, 1, 1, 1, 1, 1,
-0.3436841, 0.8736901, -1.759263, 1, 1, 1, 1, 1,
-0.3416258, 0.5078384, 0.996056, 1, 1, 1, 1, 1,
-0.3401565, 0.9389042, -0.4303897, 1, 1, 1, 1, 1,
-0.3392083, 1.176111, 1.148689, 1, 1, 1, 1, 1,
-0.3386007, -0.161388, -2.946059, 1, 1, 1, 1, 1,
-0.3380102, -1.23042, 0.0231502, 1, 1, 1, 1, 1,
-0.3369867, -1.321372, -3.190547, 1, 1, 1, 1, 1,
-0.329972, -1.379255, -2.408138, 1, 1, 1, 1, 1,
-0.3283352, 0.4017232, 1.729781, 1, 1, 1, 1, 1,
-0.3282712, -1.941296, -2.285869, 1, 1, 1, 1, 1,
-0.3275378, 0.5871069, -1.021833, 1, 1, 1, 1, 1,
-0.32621, -1.964379, -1.024595, 0, 0, 1, 1, 1,
-0.322424, 1.292502, 0.7500408, 1, 0, 0, 1, 1,
-0.3152535, 0.2654263, 0.1738899, 1, 0, 0, 1, 1,
-0.3150075, 0.7950466, -1.973977, 1, 0, 0, 1, 1,
-0.3146698, -1.040199, -1.330545, 1, 0, 0, 1, 1,
-0.3104456, 0.9538714, 1.413973, 1, 0, 0, 1, 1,
-0.3101003, -0.4102167, -1.099438, 0, 0, 0, 1, 1,
-0.3063038, -0.7399238, -4.147773, 0, 0, 0, 1, 1,
-0.3058906, 1.187829, 0.949161, 0, 0, 0, 1, 1,
-0.3046315, 0.3280881, -1.30549, 0, 0, 0, 1, 1,
-0.3027637, -0.8920057, -4.41424, 0, 0, 0, 1, 1,
-0.2959578, 1.082923, -0.9726009, 0, 0, 0, 1, 1,
-0.2953542, 0.01073975, -0.8410443, 0, 0, 0, 1, 1,
-0.2910771, 1.982564, 0.5690452, 1, 1, 1, 1, 1,
-0.290854, 0.3621064, 1.051808, 1, 1, 1, 1, 1,
-0.2889167, 1.184745, 0.6255157, 1, 1, 1, 1, 1,
-0.2886742, 0.7224167, -0.007241585, 1, 1, 1, 1, 1,
-0.2869732, -0.5777815, -3.742363, 1, 1, 1, 1, 1,
-0.2855976, -1.632951, -4.167833, 1, 1, 1, 1, 1,
-0.2810421, -0.5241992, -0.5730872, 1, 1, 1, 1, 1,
-0.2808011, 1.630498, 1.011464, 1, 1, 1, 1, 1,
-0.2769926, -0.9170921, -3.681138, 1, 1, 1, 1, 1,
-0.2749353, 1.105765, -0.9096792, 1, 1, 1, 1, 1,
-0.2709103, 0.2539665, -2.608923, 1, 1, 1, 1, 1,
-0.2700426, 1.942539, -1.282218, 1, 1, 1, 1, 1,
-0.2686794, 1.443922, 0.9502199, 1, 1, 1, 1, 1,
-0.2682011, 0.04214482, -2.077456, 1, 1, 1, 1, 1,
-0.2646803, -0.3269834, -1.873963, 1, 1, 1, 1, 1,
-0.2624562, -1.859065, -1.399793, 0, 0, 1, 1, 1,
-0.2585291, 0.5680115, 0.6841357, 1, 0, 0, 1, 1,
-0.2505884, -1.678732, -1.041633, 1, 0, 0, 1, 1,
-0.2474679, -0.7523842, -2.756367, 1, 0, 0, 1, 1,
-0.2470883, -0.7018659, -3.499392, 1, 0, 0, 1, 1,
-0.2432183, 0.5601512, -0.8593414, 1, 0, 0, 1, 1,
-0.2427142, 1.979162, 1.040111, 0, 0, 0, 1, 1,
-0.2404791, -0.07454833, -1.57175, 0, 0, 0, 1, 1,
-0.2401167, 0.4351422, -0.9880588, 0, 0, 0, 1, 1,
-0.2367203, 1.942756, -0.3048312, 0, 0, 0, 1, 1,
-0.2361384, 0.6409389, -0.365914, 0, 0, 0, 1, 1,
-0.231606, -1.033949, -0.5908778, 0, 0, 0, 1, 1,
-0.228715, 0.3506917, -1.004035, 0, 0, 0, 1, 1,
-0.228243, 0.697796, -0.01322363, 1, 1, 1, 1, 1,
-0.2273291, 1.801172, -0.5918585, 1, 1, 1, 1, 1,
-0.2267409, -0.6985318, -3.699352, 1, 1, 1, 1, 1,
-0.2226796, -0.992063, -4.844057, 1, 1, 1, 1, 1,
-0.2219314, 0.03309287, -2.428005, 1, 1, 1, 1, 1,
-0.2206927, 1.755994, 0.03264618, 1, 1, 1, 1, 1,
-0.2175992, 1.358569, -0.2163021, 1, 1, 1, 1, 1,
-0.2151477, 0.6257648, 0.7378264, 1, 1, 1, 1, 1,
-0.2095134, 0.9372072, -1.031603, 1, 1, 1, 1, 1,
-0.2071104, 0.1407335, -1.105695, 1, 1, 1, 1, 1,
-0.2050948, -0.02982399, -1.829207, 1, 1, 1, 1, 1,
-0.2047822, 0.827006, -1.892121, 1, 1, 1, 1, 1,
-0.2024481, -0.2127654, -2.180153, 1, 1, 1, 1, 1,
-0.2002244, -0.3578044, -3.509901, 1, 1, 1, 1, 1,
-0.1976404, -0.6432313, -3.841893, 1, 1, 1, 1, 1,
-0.1969152, -0.8560103, -2.371865, 0, 0, 1, 1, 1,
-0.196185, -0.08459058, -4.289986, 1, 0, 0, 1, 1,
-0.1905658, -0.3028256, -2.88901, 1, 0, 0, 1, 1,
-0.1870019, 0.1835413, -2.992379, 1, 0, 0, 1, 1,
-0.1845967, -1.999609, -3.299908, 1, 0, 0, 1, 1,
-0.1842057, 1.317482, 0.178731, 1, 0, 0, 1, 1,
-0.1840666, 0.2872941, -0.1915599, 0, 0, 0, 1, 1,
-0.1810774, 0.1531319, -1.226469, 0, 0, 0, 1, 1,
-0.1795078, -1.103938, -2.145154, 0, 0, 0, 1, 1,
-0.1790329, 0.4246655, -0.6159597, 0, 0, 0, 1, 1,
-0.1764015, -0.06982261, -1.51025, 0, 0, 0, 1, 1,
-0.1710864, 0.120124, -0.1537928, 0, 0, 0, 1, 1,
-0.1705212, -0.01990447, -1.367455, 0, 0, 0, 1, 1,
-0.1690944, -0.07072968, -0.1696207, 1, 1, 1, 1, 1,
-0.1682966, 1.24489, -0.4882762, 1, 1, 1, 1, 1,
-0.1638319, 0.9846947, -1.743642, 1, 1, 1, 1, 1,
-0.1629178, -0.1762721, -3.03902, 1, 1, 1, 1, 1,
-0.1597099, 1.722894, 0.06738096, 1, 1, 1, 1, 1,
-0.1593893, 0.8283184, -0.02509928, 1, 1, 1, 1, 1,
-0.1510873, -1.999121, -2.346992, 1, 1, 1, 1, 1,
-0.1494218, 0.4102746, -0.5735099, 1, 1, 1, 1, 1,
-0.1481405, 0.8977388, -0.4550529, 1, 1, 1, 1, 1,
-0.1480169, -0.63998, -2.293728, 1, 1, 1, 1, 1,
-0.1437933, 0.4504789, -2.180224, 1, 1, 1, 1, 1,
-0.1387037, -0.8527783, -3.582849, 1, 1, 1, 1, 1,
-0.1358246, -0.8105368, -2.610313, 1, 1, 1, 1, 1,
-0.13393, 0.5259174, -0.483496, 1, 1, 1, 1, 1,
-0.1315264, 0.7249683, 1.066286, 1, 1, 1, 1, 1,
-0.1313116, 1.053448, -0.9773714, 0, 0, 1, 1, 1,
-0.128112, 0.5564162, 0.7374011, 1, 0, 0, 1, 1,
-0.1240316, 0.1262351, -1.705063, 1, 0, 0, 1, 1,
-0.1214771, 0.5938664, -0.2834773, 1, 0, 0, 1, 1,
-0.1214182, 1.782729, -1.589804, 1, 0, 0, 1, 1,
-0.1197184, 0.01372077, -1.438938, 1, 0, 0, 1, 1,
-0.1187406, 0.4800078, 0.6404998, 0, 0, 0, 1, 1,
-0.1125222, 0.4411984, -0.9680042, 0, 0, 0, 1, 1,
-0.112229, -0.5528969, -1.738694, 0, 0, 0, 1, 1,
-0.1100419, -0.09034508, -1.421414, 0, 0, 0, 1, 1,
-0.1085383, -1.516949, -4.517942, 0, 0, 0, 1, 1,
-0.103322, 0.8974386, 1.607095, 0, 0, 0, 1, 1,
-0.09881176, -1.940479, -2.845714, 0, 0, 0, 1, 1,
-0.09241876, -0.4326059, -2.815344, 1, 1, 1, 1, 1,
-0.09067925, 0.1373715, -1.255628, 1, 1, 1, 1, 1,
-0.09025235, 1.052889, -1.027069, 1, 1, 1, 1, 1,
-0.08936002, -1.117247, -4.25587, 1, 1, 1, 1, 1,
-0.08510893, -1.355504, -2.083753, 1, 1, 1, 1, 1,
-0.07758559, -0.902374, -1.772046, 1, 1, 1, 1, 1,
-0.07306321, 1.689755, 0.9651477, 1, 1, 1, 1, 1,
-0.07153632, -0.1489237, -3.658143, 1, 1, 1, 1, 1,
-0.07058721, 0.6649891, -0.342588, 1, 1, 1, 1, 1,
-0.0693247, -2.322, -3.604186, 1, 1, 1, 1, 1,
-0.06643344, -0.01261625, -2.179912, 1, 1, 1, 1, 1,
-0.06532977, 0.8226823, 1.176054, 1, 1, 1, 1, 1,
-0.06514194, 1.555856, 0.6825593, 1, 1, 1, 1, 1,
-0.06065387, -0.2516222, -3.422169, 1, 1, 1, 1, 1,
-0.06028511, -1.240492, -2.635918, 1, 1, 1, 1, 1,
-0.06004253, -0.9420588, -1.342562, 0, 0, 1, 1, 1,
-0.05580772, 0.4485466, 0.525221, 1, 0, 0, 1, 1,
-0.05376241, 0.8989597, -1.300243, 1, 0, 0, 1, 1,
-0.05323159, 0.1546915, 0.4198953, 1, 0, 0, 1, 1,
-0.04951011, -0.05776275, -1.661614, 1, 0, 0, 1, 1,
-0.04834773, -0.3241954, -3.538762, 1, 0, 0, 1, 1,
-0.04796315, -0.2515619, -3.996331, 0, 0, 0, 1, 1,
-0.04621273, -0.8799495, -3.142805, 0, 0, 0, 1, 1,
-0.03891665, -1.315491, -2.65352, 0, 0, 0, 1, 1,
-0.03883114, 0.6912664, 1.355695, 0, 0, 0, 1, 1,
-0.03630938, -0.3379139, -2.466796, 0, 0, 0, 1, 1,
-0.02934058, 0.1814965, 1.693072, 0, 0, 0, 1, 1,
-0.02693333, -1.110741, -2.625896, 0, 0, 0, 1, 1,
-0.02645903, 0.6472673, 1.132994, 1, 1, 1, 1, 1,
-0.01503984, -0.7353317, -3.102625, 1, 1, 1, 1, 1,
-0.01294881, -0.6198087, -3.574487, 1, 1, 1, 1, 1,
-0.005839086, -0.5774418, -3.82165, 1, 1, 1, 1, 1,
-0.005325862, -1.596496, -2.327888, 1, 1, 1, 1, 1,
-0.003526605, -1.223817, -2.912659, 1, 1, 1, 1, 1,
0.001246618, 0.2203963, 0.3042157, 1, 1, 1, 1, 1,
0.003066936, -0.7152359, 3.087712, 1, 1, 1, 1, 1,
0.005534213, 0.9824044, -0.4214658, 1, 1, 1, 1, 1,
0.009074126, -0.8064363, 2.542879, 1, 1, 1, 1, 1,
0.01206884, -1.304147, 2.965883, 1, 1, 1, 1, 1,
0.0140368, -0.2419259, 2.945567, 1, 1, 1, 1, 1,
0.01490591, -0.7225305, 2.44498, 1, 1, 1, 1, 1,
0.01891813, -0.9684833, 2.726118, 1, 1, 1, 1, 1,
0.02196958, 0.7903328, -0.006663782, 1, 1, 1, 1, 1,
0.02337527, 0.2062592, -1.901126, 0, 0, 1, 1, 1,
0.02589577, -0.5113264, 4.273198, 1, 0, 0, 1, 1,
0.03139073, 0.8963929, 1.307457, 1, 0, 0, 1, 1,
0.03598936, 0.1890558, 0.6923981, 1, 0, 0, 1, 1,
0.03688224, -1.522414, 2.38148, 1, 0, 0, 1, 1,
0.03764428, -1.159067, 3.633238, 1, 0, 0, 1, 1,
0.04072524, 1.100759, -0.06354166, 0, 0, 0, 1, 1,
0.04523493, -0.02864048, 1.220593, 0, 0, 0, 1, 1,
0.05296903, 1.95132, -1.483994, 0, 0, 0, 1, 1,
0.0550363, -1.556988, 4.009965, 0, 0, 0, 1, 1,
0.05866393, -1.145483, 4.552625, 0, 0, 0, 1, 1,
0.06032115, 0.6462932, -1.452645, 0, 0, 0, 1, 1,
0.06043265, -0.1696171, 2.854854, 0, 0, 0, 1, 1,
0.06227684, 0.4816868, -0.9680156, 1, 1, 1, 1, 1,
0.06236999, 0.7734317, -0.4548464, 1, 1, 1, 1, 1,
0.06339928, 0.8805746, -0.8100633, 1, 1, 1, 1, 1,
0.0637375, -0.6474645, 5.65094, 1, 1, 1, 1, 1,
0.0667197, 1.212936, -0.1818567, 1, 1, 1, 1, 1,
0.06894741, -1.239815, 2.103786, 1, 1, 1, 1, 1,
0.07100932, -0.4188822, 1.793478, 1, 1, 1, 1, 1,
0.0733937, 0.18265, -0.1102522, 1, 1, 1, 1, 1,
0.07800687, 0.808894, -0.7317608, 1, 1, 1, 1, 1,
0.07996283, -0.4746655, 1.68147, 1, 1, 1, 1, 1,
0.08242836, -0.9883747, 3.333424, 1, 1, 1, 1, 1,
0.08386327, 0.03612122, 1.355079, 1, 1, 1, 1, 1,
0.08785224, 0.2433821, 0.6850172, 1, 1, 1, 1, 1,
0.0894312, 1.545646, 0.3037299, 1, 1, 1, 1, 1,
0.08987734, 0.1620962, 0.97293, 1, 1, 1, 1, 1,
0.09009381, -0.270472, 3.31181, 0, 0, 1, 1, 1,
0.09077818, -0.008089037, 3.071222, 1, 0, 0, 1, 1,
0.09130653, -0.7663738, 4.09159, 1, 0, 0, 1, 1,
0.09339888, 1.008625, -0.942235, 1, 0, 0, 1, 1,
0.09763981, 0.1115511, 0.8641561, 1, 0, 0, 1, 1,
0.09981461, 0.3144322, 1.004787, 1, 0, 0, 1, 1,
0.1068589, 0.1781935, -0.05209352, 0, 0, 0, 1, 1,
0.1087184, 1.031919, -0.4538725, 0, 0, 0, 1, 1,
0.1099441, -0.536315, 0.7250386, 0, 0, 0, 1, 1,
0.1152707, 0.06875411, 2.214205, 0, 0, 0, 1, 1,
0.1228014, -0.3460602, 3.786809, 0, 0, 0, 1, 1,
0.1243325, 0.5861723, -1.025697, 0, 0, 0, 1, 1,
0.1251578, 0.6076146, 0.5235282, 0, 0, 0, 1, 1,
0.1332905, 7.836492e-05, 2.213294, 1, 1, 1, 1, 1,
0.1345117, 1.244665, -0.1967454, 1, 1, 1, 1, 1,
0.1349688, -1.46403, 3.192762, 1, 1, 1, 1, 1,
0.1363463, 0.767469, 0.7986037, 1, 1, 1, 1, 1,
0.1417787, -1.043459, 4.151047, 1, 1, 1, 1, 1,
0.143282, -0.5215381, 3.294781, 1, 1, 1, 1, 1,
0.1454009, -0.2738819, 1.62107, 1, 1, 1, 1, 1,
0.1466037, -1.234379, 3.019505, 1, 1, 1, 1, 1,
0.1557435, 0.3740439, 0.1169312, 1, 1, 1, 1, 1,
0.1565797, 0.5391981, -0.4130554, 1, 1, 1, 1, 1,
0.1594499, -0.2154828, 3.155974, 1, 1, 1, 1, 1,
0.1610315, 1.073573, 1.702919, 1, 1, 1, 1, 1,
0.1611614, -0.850852, 2.057154, 1, 1, 1, 1, 1,
0.1614981, 0.009833715, 0.5628153, 1, 1, 1, 1, 1,
0.1635149, -0.2031312, 3.104624, 1, 1, 1, 1, 1,
0.1669552, -0.5179738, 2.690964, 0, 0, 1, 1, 1,
0.1682732, 0.5799938, 1.63631, 1, 0, 0, 1, 1,
0.1689769, -0.4617036, 4.205454, 1, 0, 0, 1, 1,
0.1700154, 1.168113, -1.453043, 1, 0, 0, 1, 1,
0.17023, -1.423705, 2.415916, 1, 0, 0, 1, 1,
0.1713543, -0.01215362, 1.115848, 1, 0, 0, 1, 1,
0.1740377, -1.423622, 0.8898627, 0, 0, 0, 1, 1,
0.1779236, 0.3440785, -0.1842314, 0, 0, 0, 1, 1,
0.1822368, -0.0008828575, 3.481206, 0, 0, 0, 1, 1,
0.1829044, -0.8669739, 2.648401, 0, 0, 0, 1, 1,
0.1839413, 1.160857, -0.7695106, 0, 0, 0, 1, 1,
0.186799, -0.9196118, 3.457607, 0, 0, 0, 1, 1,
0.1869447, -0.04715193, 1.597267, 0, 0, 0, 1, 1,
0.1925519, -0.314896, 3.852016, 1, 1, 1, 1, 1,
0.1931988, 0.7035749, -0.07283612, 1, 1, 1, 1, 1,
0.1972121, 1.398332, 0.8547786, 1, 1, 1, 1, 1,
0.2018626, 1.53847, -1.234446, 1, 1, 1, 1, 1,
0.2024764, -0.8907964, 3.762544, 1, 1, 1, 1, 1,
0.2049434, 1.012821, 1.566167, 1, 1, 1, 1, 1,
0.2102, 2.365949, -0.03174989, 1, 1, 1, 1, 1,
0.2149773, -0.10481, 1.28122, 1, 1, 1, 1, 1,
0.2171186, 0.8459411, 1.026318, 1, 1, 1, 1, 1,
0.2237196, 0.6390129, -0.4664377, 1, 1, 1, 1, 1,
0.226651, 0.3800784, 0.2041751, 1, 1, 1, 1, 1,
0.2301945, 0.508687, 0.1975349, 1, 1, 1, 1, 1,
0.2315143, -0.3302232, 1.267432, 1, 1, 1, 1, 1,
0.2330654, -0.1227755, 3.444542, 1, 1, 1, 1, 1,
0.2452045, -1.694406, 3.121279, 1, 1, 1, 1, 1,
0.2464586, 0.5943289, 0.6886994, 0, 0, 1, 1, 1,
0.2468239, -0.6819715, 3.820414, 1, 0, 0, 1, 1,
0.2548477, 0.3193652, 0.1240231, 1, 0, 0, 1, 1,
0.256447, 0.5687305, -0.165566, 1, 0, 0, 1, 1,
0.2576632, 0.9075078, 1.419426, 1, 0, 0, 1, 1,
0.2587185, 0.3178055, -0.08819675, 1, 0, 0, 1, 1,
0.2637557, -0.6789812, 1.875759, 0, 0, 0, 1, 1,
0.2660054, 0.330591, 1.99675, 0, 0, 0, 1, 1,
0.2666327, -0.7647806, 3.492063, 0, 0, 0, 1, 1,
0.2679864, -0.5050825, 0.9529284, 0, 0, 0, 1, 1,
0.2753075, -0.1901071, 1.02959, 0, 0, 0, 1, 1,
0.277463, 1.428731, -0.0893466, 0, 0, 0, 1, 1,
0.2776736, 0.8379973, 0.9854033, 0, 0, 0, 1, 1,
0.2785163, -0.8444752, 3.841799, 1, 1, 1, 1, 1,
0.2786269, 0.5847368, 2.793012, 1, 1, 1, 1, 1,
0.2813784, 0.1977801, 0.6105106, 1, 1, 1, 1, 1,
0.2840825, -0.3688077, 3.990291, 1, 1, 1, 1, 1,
0.2899599, 0.7992704, -0.7384551, 1, 1, 1, 1, 1,
0.2911079, -0.8681056, 1.616265, 1, 1, 1, 1, 1,
0.2919797, 0.3706687, -0.06021602, 1, 1, 1, 1, 1,
0.2952035, -0.3050751, 4.528273, 1, 1, 1, 1, 1,
0.2963808, -0.3205416, 4.63389, 1, 1, 1, 1, 1,
0.3020455, 0.8750114, -0.245464, 1, 1, 1, 1, 1,
0.3022881, 2.103732, 1.102417, 1, 1, 1, 1, 1,
0.3028358, 2.041429, -0.1429206, 1, 1, 1, 1, 1,
0.3057101, 0.8259455, 1.821351, 1, 1, 1, 1, 1,
0.3090409, -0.08217358, 2.044625, 1, 1, 1, 1, 1,
0.3095384, -0.210946, 3.90429, 1, 1, 1, 1, 1,
0.3103652, 0.7726452, 1.959783, 0, 0, 1, 1, 1,
0.311538, 0.2752953, -0.1034775, 1, 0, 0, 1, 1,
0.3130203, -0.4212706, 2.731729, 1, 0, 0, 1, 1,
0.3138611, -0.1155868, 0.9188734, 1, 0, 0, 1, 1,
0.3178107, 0.1059781, 1.470535, 1, 0, 0, 1, 1,
0.3199214, -0.7083234, 1.757367, 1, 0, 0, 1, 1,
0.3205335, 1.065024, 0.3612055, 0, 0, 0, 1, 1,
0.3254313, -0.4393567, 1.870631, 0, 0, 0, 1, 1,
0.3266342, -0.006952661, 0.4479417, 0, 0, 0, 1, 1,
0.3290223, -1.277336, 1.853532, 0, 0, 0, 1, 1,
0.3301015, -0.09646592, 2.450242, 0, 0, 0, 1, 1,
0.3323356, 0.6353288, 0.5619016, 0, 0, 0, 1, 1,
0.3343312, -0.9692085, 1.671896, 0, 0, 0, 1, 1,
0.3343781, 0.5251219, 0.4574397, 1, 1, 1, 1, 1,
0.3343855, 0.3239695, 1.433883, 1, 1, 1, 1, 1,
0.3372193, 1.270635, 0.7291313, 1, 1, 1, 1, 1,
0.3386471, -0.2993651, 3.123361, 1, 1, 1, 1, 1,
0.3456453, -1.994512, 0.2524724, 1, 1, 1, 1, 1,
0.3466805, 0.3560835, 1.611502, 1, 1, 1, 1, 1,
0.3544984, 0.8717924, -1.571824, 1, 1, 1, 1, 1,
0.3546636, -0.2203628, 0.6703442, 1, 1, 1, 1, 1,
0.3554158, 0.01511366, 2.229155, 1, 1, 1, 1, 1,
0.3557209, -0.5366697, 3.567297, 1, 1, 1, 1, 1,
0.3602209, -0.5927392, 1.270204, 1, 1, 1, 1, 1,
0.3621919, -1.12866, 2.368124, 1, 1, 1, 1, 1,
0.3634286, -0.4586643, 2.698558, 1, 1, 1, 1, 1,
0.3639929, -1.259564, 5.612535, 1, 1, 1, 1, 1,
0.3665437, 0.844623, 0.7225848, 1, 1, 1, 1, 1,
0.3669684, 0.5984305, 0.9821555, 0, 0, 1, 1, 1,
0.3677122, -1.936951, 3.012968, 1, 0, 0, 1, 1,
0.3677286, 0.4655243, -0.1912126, 1, 0, 0, 1, 1,
0.3679971, 1.252803, 1.054285, 1, 0, 0, 1, 1,
0.3824227, -0.1626359, 3.296417, 1, 0, 0, 1, 1,
0.3841504, 0.7097824, 1.62469, 1, 0, 0, 1, 1,
0.38648, 0.02689879, 0.599593, 0, 0, 0, 1, 1,
0.386599, -0.08800636, 2.241281, 0, 0, 0, 1, 1,
0.3893481, 0.2858212, 0.5700648, 0, 0, 0, 1, 1,
0.3915584, 0.6878752, -0.05322104, 0, 0, 0, 1, 1,
0.3917925, -0.7235619, 2.882169, 0, 0, 0, 1, 1,
0.3946365, 0.08978196, 1.219704, 0, 0, 0, 1, 1,
0.3966659, 1.22282, 0.990616, 0, 0, 0, 1, 1,
0.398097, 0.1879496, 0.6724342, 1, 1, 1, 1, 1,
0.400653, 0.9251875, 0.08399825, 1, 1, 1, 1, 1,
0.4035993, 1.580108, 1.135892, 1, 1, 1, 1, 1,
0.4050376, -0.1373626, 1.214951, 1, 1, 1, 1, 1,
0.4106583, 1.108852, 0.4833859, 1, 1, 1, 1, 1,
0.4118099, -0.9868262, 2.8988, 1, 1, 1, 1, 1,
0.4152097, 1.347554, 0.1376749, 1, 1, 1, 1, 1,
0.4162716, -0.8711637, 1.113768, 1, 1, 1, 1, 1,
0.419303, -0.3190997, -0.610702, 1, 1, 1, 1, 1,
0.4228938, -0.4075905, 2.629176, 1, 1, 1, 1, 1,
0.4236897, -1.130038, 3.20887, 1, 1, 1, 1, 1,
0.4237696, 0.6163245, 0.4566947, 1, 1, 1, 1, 1,
0.426643, 0.2149013, 1.86369, 1, 1, 1, 1, 1,
0.4368355, -0.4282157, 1.57542, 1, 1, 1, 1, 1,
0.4369169, 2.085502, -2.47472, 1, 1, 1, 1, 1,
0.440786, -0.5566176, 3.266056, 0, 0, 1, 1, 1,
0.4415391, 0.2936655, 1.417491, 1, 0, 0, 1, 1,
0.4430211, -0.5889653, 3.444086, 1, 0, 0, 1, 1,
0.4444791, 0.8231626, -0.8423265, 1, 0, 0, 1, 1,
0.4520819, -1.426149, 4.018591, 1, 0, 0, 1, 1,
0.4548908, 1.20161, 0.1330759, 1, 0, 0, 1, 1,
0.4581505, 0.4369064, 2.926059, 0, 0, 0, 1, 1,
0.4628805, 1.368059, 0.02303877, 0, 0, 0, 1, 1,
0.4631441, 0.8162042, 0.5157851, 0, 0, 0, 1, 1,
0.4639006, -0.542116, 2.864367, 0, 0, 0, 1, 1,
0.4640327, -1.881098, 3.028586, 0, 0, 0, 1, 1,
0.4672948, -0.3219349, 2.541793, 0, 0, 0, 1, 1,
0.4681518, -0.6619281, 2.533777, 0, 0, 0, 1, 1,
0.4730019, -0.9453857, 3.130525, 1, 1, 1, 1, 1,
0.4732658, -0.2629798, 1.828455, 1, 1, 1, 1, 1,
0.473788, 1.344614, 2.895891, 1, 1, 1, 1, 1,
0.4788532, -0.9191753, 2.992762, 1, 1, 1, 1, 1,
0.4812997, 0.200744, 1.828213, 1, 1, 1, 1, 1,
0.4866812, 1.584545, -0.01061679, 1, 1, 1, 1, 1,
0.4917078, 0.6967688, 1.575469, 1, 1, 1, 1, 1,
0.5014406, 0.8546236, 1.935255, 1, 1, 1, 1, 1,
0.5033289, 0.8858544, 0.4216963, 1, 1, 1, 1, 1,
0.5035639, 0.1481045, 1.733586, 1, 1, 1, 1, 1,
0.5047148, -0.2192111, 0.4637115, 1, 1, 1, 1, 1,
0.5096816, -0.673316, 3.802743, 1, 1, 1, 1, 1,
0.5111284, 1.452345, 0.8799674, 1, 1, 1, 1, 1,
0.5113715, 0.3839117, 0.4364994, 1, 1, 1, 1, 1,
0.5154133, 0.7110896, 0.605553, 1, 1, 1, 1, 1,
0.5161555, 0.1318747, 1.156127, 0, 0, 1, 1, 1,
0.5177517, -2.265796, 4.47089, 1, 0, 0, 1, 1,
0.5183094, -0.3178531, 2.235013, 1, 0, 0, 1, 1,
0.5192347, 1.208479, 1.128025, 1, 0, 0, 1, 1,
0.5379411, -0.5697756, 3.120931, 1, 0, 0, 1, 1,
0.5407059, -1.237424, 3.588554, 1, 0, 0, 1, 1,
0.5407951, -2.175169, 2.03046, 0, 0, 0, 1, 1,
0.544578, -0.7149591, 2.472844, 0, 0, 0, 1, 1,
0.5475872, 1.06317, -0.1000384, 0, 0, 0, 1, 1,
0.549302, -1.515305, 3.054684, 0, 0, 0, 1, 1,
0.5505688, -0.3293176, 1.903614, 0, 0, 0, 1, 1,
0.5517534, 1.52913, -0.6484995, 0, 0, 0, 1, 1,
0.5522293, 0.9880269, 1.434034, 0, 0, 0, 1, 1,
0.5540127, -0.5324935, 2.905443, 1, 1, 1, 1, 1,
0.5541605, -1.082963, 0.9810911, 1, 1, 1, 1, 1,
0.555042, 0.8405443, 2.392327, 1, 1, 1, 1, 1,
0.5557331, 0.5879437, 0.5292022, 1, 1, 1, 1, 1,
0.5574104, -0.00783536, 0.8348771, 1, 1, 1, 1, 1,
0.5590263, 0.3457483, 0.1746612, 1, 1, 1, 1, 1,
0.561323, -0.7645502, 0.242673, 1, 1, 1, 1, 1,
0.566686, 0.5933758, 0.9964696, 1, 1, 1, 1, 1,
0.5688829, -0.4622186, 3.157039, 1, 1, 1, 1, 1,
0.5738561, -0.4230512, -1.396692, 1, 1, 1, 1, 1,
0.5744726, 0.3446506, 0.9492921, 1, 1, 1, 1, 1,
0.5796812, -1.13859, 2.518689, 1, 1, 1, 1, 1,
0.5814487, -1.060685, 3.186709, 1, 1, 1, 1, 1,
0.5814692, -0.6708072, 3.467325, 1, 1, 1, 1, 1,
0.5852359, -0.05781138, 0.3031377, 1, 1, 1, 1, 1,
0.587238, 0.6817178, -0.806824, 0, 0, 1, 1, 1,
0.5938903, 0.3635915, -0.2520813, 1, 0, 0, 1, 1,
0.5959582, -0.8835132, 1.80535, 1, 0, 0, 1, 1,
0.5987117, -0.08222368, 0.06471186, 1, 0, 0, 1, 1,
0.6044288, 0.4236899, 0.770924, 1, 0, 0, 1, 1,
0.6048768, 0.2424625, 1.377882, 1, 0, 0, 1, 1,
0.6173482, -0.2505004, 1.567173, 0, 0, 0, 1, 1,
0.6195235, -0.3391325, 2.672548, 0, 0, 0, 1, 1,
0.6228247, 0.8430479, 2.001423, 0, 0, 0, 1, 1,
0.6276407, -0.2336388, 1.025064, 0, 0, 0, 1, 1,
0.6289942, -0.9052094, 1.626921, 0, 0, 0, 1, 1,
0.6306243, 1.178557, -1.217591, 0, 0, 0, 1, 1,
0.6341121, -1.647207, 2.240318, 0, 0, 0, 1, 1,
0.6368268, -0.1349947, 1.561566, 1, 1, 1, 1, 1,
0.6389973, 0.5838476, 1.438834, 1, 1, 1, 1, 1,
0.6479617, -0.7317885, 0.7461684, 1, 1, 1, 1, 1,
0.6499492, -1.002355, 1.840624, 1, 1, 1, 1, 1,
0.6520904, 0.2262741, 0.9432791, 1, 1, 1, 1, 1,
0.6580498, 0.1816915, 1.399804, 1, 1, 1, 1, 1,
0.6613882, -2.311228, 2.075926, 1, 1, 1, 1, 1,
0.6641972, -0.02193625, 0.8267941, 1, 1, 1, 1, 1,
0.6643253, 0.9987004, 0.5675536, 1, 1, 1, 1, 1,
0.6650099, 0.2540731, 0.4999333, 1, 1, 1, 1, 1,
0.6674749, -0.7581056, 1.545899, 1, 1, 1, 1, 1,
0.670074, 0.09347994, 0.6821709, 1, 1, 1, 1, 1,
0.6701781, 2.094852, 1.244982, 1, 1, 1, 1, 1,
0.6769894, 1.721539, 1.356413, 1, 1, 1, 1, 1,
0.6791255, 1.944477, 0.8853682, 1, 1, 1, 1, 1,
0.6828246, -0.8602653, 1.146372, 0, 0, 1, 1, 1,
0.6865543, -1.440073, 2.363865, 1, 0, 0, 1, 1,
0.6886489, 0.7475947, 1.367119, 1, 0, 0, 1, 1,
0.6890317, -2.049646, 2.364022, 1, 0, 0, 1, 1,
0.703123, -0.02143606, 2.298552, 1, 0, 0, 1, 1,
0.7075395, 0.2963381, 0.07869842, 1, 0, 0, 1, 1,
0.7118222, 0.7499695, 2.233776, 0, 0, 0, 1, 1,
0.7148575, -1.392727, 3.171978, 0, 0, 0, 1, 1,
0.7152534, 1.734561, 2.371398, 0, 0, 0, 1, 1,
0.7176335, 0.3907431, 0.8792794, 0, 0, 0, 1, 1,
0.7194514, -0.903706, 1.367067, 0, 0, 0, 1, 1,
0.7205887, 1.444912, 0.9710267, 0, 0, 0, 1, 1,
0.7231227, 1.507284, 1.437918, 0, 0, 0, 1, 1,
0.7259378, 1.596248, -0.8009052, 1, 1, 1, 1, 1,
0.7266455, -0.6971428, 3.554221, 1, 1, 1, 1, 1,
0.7292566, 0.6586621, -0.6847648, 1, 1, 1, 1, 1,
0.7307925, 0.502108, 0.9621997, 1, 1, 1, 1, 1,
0.7368774, 0.1234277, 1.950657, 1, 1, 1, 1, 1,
0.7371266, -0.8262403, 3.433343, 1, 1, 1, 1, 1,
0.7372218, 0.505226, 1.11499, 1, 1, 1, 1, 1,
0.7472652, 0.003447319, 0.05785035, 1, 1, 1, 1, 1,
0.7481865, -0.04064152, 1.674374, 1, 1, 1, 1, 1,
0.7488225, -0.3318163, 1.791523, 1, 1, 1, 1, 1,
0.7563215, -1.657019, 3.293766, 1, 1, 1, 1, 1,
0.7624641, 0.6618885, 1.4345, 1, 1, 1, 1, 1,
0.7792322, -0.4568838, 2.063738, 1, 1, 1, 1, 1,
0.7836262, -1.018654, 2.585744, 1, 1, 1, 1, 1,
0.7905722, -0.4483725, 2.198256, 1, 1, 1, 1, 1,
0.7958712, 0.844379, 0.6842905, 0, 0, 1, 1, 1,
0.8066939, 0.8776671, -0.4585688, 1, 0, 0, 1, 1,
0.807266, -1.134279, 1.420913, 1, 0, 0, 1, 1,
0.8085788, 0.2259661, 2.382426, 1, 0, 0, 1, 1,
0.8086361, 1.195235, 0.9230266, 1, 0, 0, 1, 1,
0.8118054, 0.9380912, 1.19613, 1, 0, 0, 1, 1,
0.8126352, -0.659102, -0.3556156, 0, 0, 0, 1, 1,
0.8151593, -1.786817, 3.710245, 0, 0, 0, 1, 1,
0.8255333, -0.532972, 2.364573, 0, 0, 0, 1, 1,
0.8266798, -0.2836735, 2.655104, 0, 0, 0, 1, 1,
0.8372272, 0.9295205, -0.6860126, 0, 0, 0, 1, 1,
0.8388757, -0.01280551, 2.582223, 0, 0, 0, 1, 1,
0.8395388, -0.1341402, 0.2528102, 0, 0, 0, 1, 1,
0.8418602, 0.4450595, 1.804821, 1, 1, 1, 1, 1,
0.8524862, -0.1864132, 2.094802, 1, 1, 1, 1, 1,
0.8524926, -1.847693, 1.949883, 1, 1, 1, 1, 1,
0.8536296, -1.449404, 2.525317, 1, 1, 1, 1, 1,
0.855626, 1.057445, 0.1204012, 1, 1, 1, 1, 1,
0.8588259, 1.230341, 2.577509, 1, 1, 1, 1, 1,
0.861116, 1.326226, 0.1634363, 1, 1, 1, 1, 1,
0.865203, -0.7725541, 1.943439, 1, 1, 1, 1, 1,
0.8678427, -1.087945, 0.6512829, 1, 1, 1, 1, 1,
0.8734607, -0.05712596, 1.741486, 1, 1, 1, 1, 1,
0.8819712, -0.4996263, 2.795719, 1, 1, 1, 1, 1,
0.8944454, 0.8987145, 1.517721, 1, 1, 1, 1, 1,
0.8956221, -0.7465329, 2.093317, 1, 1, 1, 1, 1,
0.8996118, 0.3072269, 2.53179, 1, 1, 1, 1, 1,
0.900988, 0.8357971, 0.8452525, 1, 1, 1, 1, 1,
0.902813, -0.435084, 2.273972, 0, 0, 1, 1, 1,
0.9069854, 0.3996187, 1.70469, 1, 0, 0, 1, 1,
0.9072182, 2.088931, -1.666333, 1, 0, 0, 1, 1,
0.9110218, -0.5621053, 0.4491657, 1, 0, 0, 1, 1,
0.923279, -0.6085116, 2.331179, 1, 0, 0, 1, 1,
0.9240122, -0.2491334, 1.703196, 1, 0, 0, 1, 1,
0.9256268, 0.2820737, 0.2674174, 0, 0, 0, 1, 1,
0.927362, 0.1381388, 1.210126, 0, 0, 0, 1, 1,
0.9349213, -1.9677, 1.924892, 0, 0, 0, 1, 1,
0.9380813, 1.595454, -0.1117394, 0, 0, 0, 1, 1,
0.93978, -0.908542, 1.453036, 0, 0, 0, 1, 1,
0.943867, -0.5997663, 2.784089, 0, 0, 0, 1, 1,
0.946, -1.69231, 3.192519, 0, 0, 0, 1, 1,
0.9515094, -0.05278886, 1.359196, 1, 1, 1, 1, 1,
0.9564603, -1.360918, 1.688566, 1, 1, 1, 1, 1,
0.9688447, 0.7213061, 1.780197, 1, 1, 1, 1, 1,
0.9702294, 0.3838008, 2.413065, 1, 1, 1, 1, 1,
0.9754937, -0.004599178, 0.4843484, 1, 1, 1, 1, 1,
0.9775171, -1.097754, 2.738664, 1, 1, 1, 1, 1,
0.9812482, -0.1277979, 3.107563, 1, 1, 1, 1, 1,
0.983205, 1.246968, 0.2347897, 1, 1, 1, 1, 1,
0.9869148, 1.29868, 0.08725189, 1, 1, 1, 1, 1,
0.9962792, -0.4123387, 2.767285, 1, 1, 1, 1, 1,
1.004492, 1.484587, 0.1331505, 1, 1, 1, 1, 1,
1.005001, -0.2707573, -0.02373413, 1, 1, 1, 1, 1,
1.008624, 1.349241, 1.030417, 1, 1, 1, 1, 1,
1.010965, -0.04257545, 1.406332, 1, 1, 1, 1, 1,
1.012816, 1.25344, 1.394714, 1, 1, 1, 1, 1,
1.027536, 0.5187262, 0.3551955, 0, 0, 1, 1, 1,
1.046241, 0.5044612, 1.390046, 1, 0, 0, 1, 1,
1.053228, 1.478579, 0.5808975, 1, 0, 0, 1, 1,
1.062879, -0.3556354, 2.9058, 1, 0, 0, 1, 1,
1.063204, -0.9557209, 2.072196, 1, 0, 0, 1, 1,
1.077467, 0.7291799, -0.3081921, 1, 0, 0, 1, 1,
1.087707, -0.4420826, 2.778076, 0, 0, 0, 1, 1,
1.094824, -0.5125768, 2.611826, 0, 0, 0, 1, 1,
1.097625, 0.02327177, 1.902994, 0, 0, 0, 1, 1,
1.118984, -0.3518415, 1.580338, 0, 0, 0, 1, 1,
1.122758, -1.042431, 0.9021437, 0, 0, 0, 1, 1,
1.126604, -0.5954364, 2.907097, 0, 0, 0, 1, 1,
1.131389, -0.4461673, 2.711428, 0, 0, 0, 1, 1,
1.13473, -1.293715, 1.983521, 1, 1, 1, 1, 1,
1.136798, -1.191202, 3.509589, 1, 1, 1, 1, 1,
1.144323, 0.0590465, 3.61261, 1, 1, 1, 1, 1,
1.14645, -0.09288912, 1.631289, 1, 1, 1, 1, 1,
1.149513, 0.8602701, -0.4050299, 1, 1, 1, 1, 1,
1.152402, -0.1704903, 2.424669, 1, 1, 1, 1, 1,
1.154222, 0.3777319, 0.6041268, 1, 1, 1, 1, 1,
1.156703, -1.228511, 2.483098, 1, 1, 1, 1, 1,
1.15815, -1.4486, 3.93179, 1, 1, 1, 1, 1,
1.159865, 0.4807012, 1.373936, 1, 1, 1, 1, 1,
1.16351, -0.3026644, 4.244844, 1, 1, 1, 1, 1,
1.1759, 0.3246052, 1.444511, 1, 1, 1, 1, 1,
1.184285, -0.2687448, 1.742698, 1, 1, 1, 1, 1,
1.186965, 0.2225758, -1.106408, 1, 1, 1, 1, 1,
1.189943, 0.1463962, 1.844573, 1, 1, 1, 1, 1,
1.193442, 1.141302, 1.730944, 0, 0, 1, 1, 1,
1.198476, -0.5434498, 0.57379, 1, 0, 0, 1, 1,
1.213111, 0.3918418, 1.941773, 1, 0, 0, 1, 1,
1.216551, -1.85092, 3.234573, 1, 0, 0, 1, 1,
1.227107, 0.2690313, 1.67302, 1, 0, 0, 1, 1,
1.230448, 0.7183717, 0.5245402, 1, 0, 0, 1, 1,
1.231821, 1.569732, 1.733842, 0, 0, 0, 1, 1,
1.232723, -0.7103908, 2.382695, 0, 0, 0, 1, 1,
1.232935, 0.05463869, -1.22464, 0, 0, 0, 1, 1,
1.233855, 0.6235834, 1.825754, 0, 0, 0, 1, 1,
1.250708, -1.155283, 2.714734, 0, 0, 0, 1, 1,
1.253592, -0.4156439, 0.694482, 0, 0, 0, 1, 1,
1.257701, 0.5091028, 0.1893238, 0, 0, 0, 1, 1,
1.259269, -0.5061935, 2.456943, 1, 1, 1, 1, 1,
1.269913, -0.00447682, 1.878193, 1, 1, 1, 1, 1,
1.275947, -1.092125, 2.127903, 1, 1, 1, 1, 1,
1.280375, 0.08254604, 1.72184, 1, 1, 1, 1, 1,
1.281536, -0.1290517, 4.023211, 1, 1, 1, 1, 1,
1.284253, -1.155607, 2.616729, 1, 1, 1, 1, 1,
1.286895, -0.08146258, 1.108367, 1, 1, 1, 1, 1,
1.298369, 1.78372, 0.1019501, 1, 1, 1, 1, 1,
1.300257, -0.7351818, 2.508191, 1, 1, 1, 1, 1,
1.300372, 1.019802, -0.1200348, 1, 1, 1, 1, 1,
1.320111, 0.1534745, 3.058121, 1, 1, 1, 1, 1,
1.320397, 0.6457896, 1.3986, 1, 1, 1, 1, 1,
1.323262, -0.09436197, 0.32695, 1, 1, 1, 1, 1,
1.335996, -0.5112708, 1.214116, 1, 1, 1, 1, 1,
1.343163, 0.8499486, 0.7536619, 1, 1, 1, 1, 1,
1.349088, -1.299231, 0.5438642, 0, 0, 1, 1, 1,
1.350446, -0.3333672, 1.298367, 1, 0, 0, 1, 1,
1.357677, -0.5270038, 4.331434, 1, 0, 0, 1, 1,
1.357891, -0.8902285, 2.417809, 1, 0, 0, 1, 1,
1.360009, -0.5770457, 0.5907478, 1, 0, 0, 1, 1,
1.361626, -1.500282, 0.4344078, 1, 0, 0, 1, 1,
1.37503, 1.082881, 1.591426, 0, 0, 0, 1, 1,
1.380717, -0.5357434, 2.692087, 0, 0, 0, 1, 1,
1.381484, -1.062592, 2.046497, 0, 0, 0, 1, 1,
1.385909, -1.24248, 1.354535, 0, 0, 0, 1, 1,
1.387005, 0.8392779, 2.439814, 0, 0, 0, 1, 1,
1.391429, 0.4296652, 0.9269282, 0, 0, 0, 1, 1,
1.400741, 0.5542731, 2.590983, 0, 0, 0, 1, 1,
1.404401, -1.555208, 3.282307, 1, 1, 1, 1, 1,
1.411192, -0.007396434, 3.718625, 1, 1, 1, 1, 1,
1.419389, -1.991961, 1.141725, 1, 1, 1, 1, 1,
1.427021, -2.14906, 3.379877, 1, 1, 1, 1, 1,
1.428543, -0.3774445, 1.228647, 1, 1, 1, 1, 1,
1.437072, -0.6496415, -0.9649504, 1, 1, 1, 1, 1,
1.442235, 0.5056872, 1.240267, 1, 1, 1, 1, 1,
1.465386, -0.4768434, 2.598228, 1, 1, 1, 1, 1,
1.466589, 0.5987428, -0.06693985, 1, 1, 1, 1, 1,
1.470772, -1.185628, 2.664397, 1, 1, 1, 1, 1,
1.471127, 1.626407, -0.4039242, 1, 1, 1, 1, 1,
1.482736, 0.4365592, 3.483241, 1, 1, 1, 1, 1,
1.487627, -0.8896735, 1.046067, 1, 1, 1, 1, 1,
1.500361, 0.9162384, 1.497624, 1, 1, 1, 1, 1,
1.505638, -1.149004, 3.107088, 1, 1, 1, 1, 1,
1.506242, 0.6583695, 0.6577163, 0, 0, 1, 1, 1,
1.50797, 1.878745, 0.704141, 1, 0, 0, 1, 1,
1.509704, 0.5183929, 1.56138, 1, 0, 0, 1, 1,
1.513498, -1.522065, 4.627736, 1, 0, 0, 1, 1,
1.518538, -0.1133782, 2.053807, 1, 0, 0, 1, 1,
1.52076, -0.1217744, 1.365952, 1, 0, 0, 1, 1,
1.521404, 1.367337, 0.009465175, 0, 0, 0, 1, 1,
1.529172, -2.919026, 2.083129, 0, 0, 0, 1, 1,
1.541658, -0.7903698, 0.7849277, 0, 0, 0, 1, 1,
1.542198, -0.8478331, 2.661171, 0, 0, 0, 1, 1,
1.543631, -0.6092439, 1.694553, 0, 0, 0, 1, 1,
1.550478, -0.14461, -0.3012418, 0, 0, 0, 1, 1,
1.552873, -0.1362553, 1.244847, 0, 0, 0, 1, 1,
1.555169, -0.8885521, 2.244609, 1, 1, 1, 1, 1,
1.560653, 0.653643, 0.2137361, 1, 1, 1, 1, 1,
1.561166, -0.6628176, 2.431841, 1, 1, 1, 1, 1,
1.561611, -0.8371016, 2.229088, 1, 1, 1, 1, 1,
1.562276, -0.2832197, 0.2349624, 1, 1, 1, 1, 1,
1.564022, -0.08846129, 0.7356061, 1, 1, 1, 1, 1,
1.564212, -2.365878, 4.273407, 1, 1, 1, 1, 1,
1.590909, -0.8299798, 3.083736, 1, 1, 1, 1, 1,
1.599851, 0.7075846, -0.2892427, 1, 1, 1, 1, 1,
1.600352, -1.99467, 1.960827, 1, 1, 1, 1, 1,
1.607504, -1.431495, 3.617947, 1, 1, 1, 1, 1,
1.616998, 0.4876952, 1.385811, 1, 1, 1, 1, 1,
1.624913, -0.1175693, 2.662879, 1, 1, 1, 1, 1,
1.650459, -0.9832869, 2.604702, 1, 1, 1, 1, 1,
1.656134, -0.2942611, 3.967646, 1, 1, 1, 1, 1,
1.657513, -0.6873406, 1.204927, 0, 0, 1, 1, 1,
1.659791, 1.995507, -0.3601802, 1, 0, 0, 1, 1,
1.699675, -0.7068369, 3.022015, 1, 0, 0, 1, 1,
1.711176, 0.1979524, 2.182752, 1, 0, 0, 1, 1,
1.74713, -0.8566945, 2.658864, 1, 0, 0, 1, 1,
1.747187, 1.191005, 1.045441, 1, 0, 0, 1, 1,
1.749111, -0.6130699, 2.290917, 0, 0, 0, 1, 1,
1.756485, -0.7701082, 0.7085858, 0, 0, 0, 1, 1,
1.76644, 0.7742646, -0.09570977, 0, 0, 0, 1, 1,
1.792774, -2.420515, 3.2967, 0, 0, 0, 1, 1,
1.795734, -0.1937879, 3.604194, 0, 0, 0, 1, 1,
1.810306, -1.373256, 2.136911, 0, 0, 0, 1, 1,
1.821217, 0.9182796, 2.050808, 0, 0, 0, 1, 1,
1.834792, -0.2137057, 1.4536, 1, 1, 1, 1, 1,
1.838195, 0.3907701, 0.5237195, 1, 1, 1, 1, 1,
1.841967, 0.9722787, 1.621226, 1, 1, 1, 1, 1,
1.861194, -0.3687645, 1.573997, 1, 1, 1, 1, 1,
1.861727, 0.9590445, -0.2852345, 1, 1, 1, 1, 1,
1.871632, 1.211513, 1.627438, 1, 1, 1, 1, 1,
1.886201, -0.4646188, 1.807434, 1, 1, 1, 1, 1,
1.929592, -1.08197, 1.848235, 1, 1, 1, 1, 1,
1.946769, -2.643645, 1.051339, 1, 1, 1, 1, 1,
1.979433, -0.3208301, 2.332206, 1, 1, 1, 1, 1,
2.002817, 0.5217406, 2.394449, 1, 1, 1, 1, 1,
2.005224, -0.7536113, 0.07709892, 1, 1, 1, 1, 1,
2.018309, -1.567763, 0.4113309, 1, 1, 1, 1, 1,
2.041315, -1.253157, 1.558694, 1, 1, 1, 1, 1,
2.076956, 0.1901396, 1.200842, 1, 1, 1, 1, 1,
2.107511, -0.6517585, 1.987564, 0, 0, 1, 1, 1,
2.110748, -1.019008, 1.75818, 1, 0, 0, 1, 1,
2.141603, 1.257404, 1.235695, 1, 0, 0, 1, 1,
2.180825, 0.1696096, 2.049441, 1, 0, 0, 1, 1,
2.188232, 0.1362905, 1.864207, 1, 0, 0, 1, 1,
2.225465, -0.2559569, 0.460266, 1, 0, 0, 1, 1,
2.329652, 0.3860897, 1.393368, 0, 0, 0, 1, 1,
2.372739, 0.6279438, 1.376115, 0, 0, 0, 1, 1,
2.388368, -0.8188148, 0.09166799, 0, 0, 0, 1, 1,
2.392865, -0.13794, 1.745468, 0, 0, 0, 1, 1,
2.463585, -1.190557, 3.277494, 0, 0, 0, 1, 1,
2.464568, -0.0907252, 0.5354909, 0, 0, 0, 1, 1,
2.50457, 0.4244085, 0.9407341, 0, 0, 0, 1, 1,
2.529718, 0.03929078, 1.376749, 1, 1, 1, 1, 1,
2.54186, -0.4573086, 3.243739, 1, 1, 1, 1, 1,
2.585694, 2.094417, -0.1558359, 1, 1, 1, 1, 1,
2.605351, 1.059701, 1.346765, 1, 1, 1, 1, 1,
2.754092, 0.112774, 0.1383194, 1, 1, 1, 1, 1,
2.769023, 0.4826122, 2.597353, 1, 1, 1, 1, 1,
2.809767, -0.4228424, 2.516033, 1, 1, 1, 1, 1
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
var radius = 9.148385;
var distance = 32.13331;
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
mvMatrix.translate( -0.04261494, 0.1722959, -0.2526345 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.13331);
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
