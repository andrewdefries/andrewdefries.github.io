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
-2.83746, -1.215707, -1.553279, 1, 0, 0, 1,
-2.473358, -2.654709, -2.389199, 1, 0.007843138, 0, 1,
-2.431686, -0.7670591, -2.076014, 1, 0.01176471, 0, 1,
-2.392439, 0.5789353, -2.597288, 1, 0.01960784, 0, 1,
-2.375333, 0.7818503, -0.7335376, 1, 0.02352941, 0, 1,
-2.33494, 0.9157772, -1.218625, 1, 0.03137255, 0, 1,
-2.313215, -0.9469124, -1.022427, 1, 0.03529412, 0, 1,
-2.260541, 0.5518452, -2.615626, 1, 0.04313726, 0, 1,
-2.166163, 0.9000446, -1.440738, 1, 0.04705882, 0, 1,
-2.143871, 0.2017319, 0.4523725, 1, 0.05490196, 0, 1,
-2.066969, -1.076341, -3.085547, 1, 0.05882353, 0, 1,
-2.020773, 1.905791, -1.704622, 1, 0.06666667, 0, 1,
-2.016788, 1.430094, -1.57607, 1, 0.07058824, 0, 1,
-1.99837, -2.056275, -1.748634, 1, 0.07843138, 0, 1,
-1.977716, -0.09728893, -2.413116, 1, 0.08235294, 0, 1,
-1.971113, -0.1276283, -1.689586, 1, 0.09019608, 0, 1,
-1.963107, 0.8879603, -0.6959304, 1, 0.09411765, 0, 1,
-1.956568, -0.004629488, -0.7358635, 1, 0.1019608, 0, 1,
-1.947811, -0.2372179, -1.500687, 1, 0.1098039, 0, 1,
-1.946899, 0.07329466, -1.778206, 1, 0.1137255, 0, 1,
-1.929449, 0.6161892, -0.5219781, 1, 0.1215686, 0, 1,
-1.924094, 0.7493412, -2.432846, 1, 0.1254902, 0, 1,
-1.906451, -1.854064, -1.050273, 1, 0.1333333, 0, 1,
-1.875992, -0.1831965, -1.070655, 1, 0.1372549, 0, 1,
-1.875035, -0.03199716, -2.722251, 1, 0.145098, 0, 1,
-1.848795, -1.160758, -2.311513, 1, 0.1490196, 0, 1,
-1.845271, 1.621401, -2.079736, 1, 0.1568628, 0, 1,
-1.835908, 0.9872368, -0.5715672, 1, 0.1607843, 0, 1,
-1.796334, -2.446492, -3.375077, 1, 0.1686275, 0, 1,
-1.786445, 0.07372918, -0.3957254, 1, 0.172549, 0, 1,
-1.782013, -0.3908644, -1.28916, 1, 0.1803922, 0, 1,
-1.780469, -2.273571, -2.795201, 1, 0.1843137, 0, 1,
-1.774906, -1.509568, -1.685966, 1, 0.1921569, 0, 1,
-1.748961, -0.1239921, -1.594984, 1, 0.1960784, 0, 1,
-1.736738, 1.121886, -1.886346, 1, 0.2039216, 0, 1,
-1.723813, 0.2900092, -0.5894907, 1, 0.2117647, 0, 1,
-1.703931, 0.1006961, 0.2122288, 1, 0.2156863, 0, 1,
-1.688668, -1.052621, -4.064276, 1, 0.2235294, 0, 1,
-1.688004, -2.120751, -3.083081, 1, 0.227451, 0, 1,
-1.678924, 0.1585964, -1.191055, 1, 0.2352941, 0, 1,
-1.671768, -2.251382, -2.40309, 1, 0.2392157, 0, 1,
-1.670533, -0.8045424, 0.3832716, 1, 0.2470588, 0, 1,
-1.666718, -0.234481, -2.338266, 1, 0.2509804, 0, 1,
-1.664858, -0.3067257, -2.142357, 1, 0.2588235, 0, 1,
-1.652829, 0.4381416, -0.5756477, 1, 0.2627451, 0, 1,
-1.651224, 0.9770662, -1.43246, 1, 0.2705882, 0, 1,
-1.649, 0.7265791, -2.477669, 1, 0.2745098, 0, 1,
-1.64056, 0.01157356, -1.597193, 1, 0.282353, 0, 1,
-1.640197, -0.1916846, -1.22044, 1, 0.2862745, 0, 1,
-1.62698, -0.0180527, -1.157184, 1, 0.2941177, 0, 1,
-1.626811, -1.106074, -2.013082, 1, 0.3019608, 0, 1,
-1.614475, -0.5547522, -2.178766, 1, 0.3058824, 0, 1,
-1.603448, -0.7773789, -1.090666, 1, 0.3137255, 0, 1,
-1.589886, 1.122809, -0.3283364, 1, 0.3176471, 0, 1,
-1.586323, 0.3975296, -1.727272, 1, 0.3254902, 0, 1,
-1.576494, -0.1914671, -1.076182, 1, 0.3294118, 0, 1,
-1.568306, -0.2230071, -2.268975, 1, 0.3372549, 0, 1,
-1.565553, 0.3322934, -1.008325, 1, 0.3411765, 0, 1,
-1.563965, 0.5491768, -4.082406, 1, 0.3490196, 0, 1,
-1.559134, -0.7800126, -0.4659419, 1, 0.3529412, 0, 1,
-1.556621, 0.08314207, -1.236297, 1, 0.3607843, 0, 1,
-1.539661, -0.4765671, -0.5781182, 1, 0.3647059, 0, 1,
-1.539156, 1.588644, -1.231205, 1, 0.372549, 0, 1,
-1.509964, -1.08713, -0.1901344, 1, 0.3764706, 0, 1,
-1.509539, -1.176682, -3.617833, 1, 0.3843137, 0, 1,
-1.502695, -1.100431, -2.718156, 1, 0.3882353, 0, 1,
-1.496553, -0.4185, 0.09027905, 1, 0.3960784, 0, 1,
-1.496184, 0.4993598, -2.490405, 1, 0.4039216, 0, 1,
-1.4925, -0.6227015, -1.301547, 1, 0.4078431, 0, 1,
-1.472999, 0.7000632, -1.28048, 1, 0.4156863, 0, 1,
-1.472116, 1.342798, -0.3959683, 1, 0.4196078, 0, 1,
-1.46518, -0.5551658, -2.698776, 1, 0.427451, 0, 1,
-1.447893, -0.8182555, -1.328408, 1, 0.4313726, 0, 1,
-1.444068, 1.129204, 0.3847964, 1, 0.4392157, 0, 1,
-1.425475, -0.8621145, -1.498301, 1, 0.4431373, 0, 1,
-1.412249, -1.203763, -1.488525, 1, 0.4509804, 0, 1,
-1.40777, -1.286078, -1.026636, 1, 0.454902, 0, 1,
-1.406414, -0.6617965, -0.7209246, 1, 0.4627451, 0, 1,
-1.397787, 0.7732762, 0.6701292, 1, 0.4666667, 0, 1,
-1.39724, 2.040844, 1.101722, 1, 0.4745098, 0, 1,
-1.390276, 0.1417304, -1.043903, 1, 0.4784314, 0, 1,
-1.384566, -1.109608, -2.668971, 1, 0.4862745, 0, 1,
-1.383589, 1.828589, -0.9255606, 1, 0.4901961, 0, 1,
-1.377836, -2.433476, -2.373776, 1, 0.4980392, 0, 1,
-1.372885, -0.1920783, -1.807238, 1, 0.5058824, 0, 1,
-1.370962, 0.9227819, -0.8713889, 1, 0.509804, 0, 1,
-1.358138, 2.097694, 0.2494944, 1, 0.5176471, 0, 1,
-1.351167, 0.9962697, -1.244663, 1, 0.5215687, 0, 1,
-1.349599, -1.275499, -4.357749, 1, 0.5294118, 0, 1,
-1.334639, 0.1794541, -1.810805, 1, 0.5333334, 0, 1,
-1.332412, -1.121292, -2.640252, 1, 0.5411765, 0, 1,
-1.329451, -0.7887912, -1.651469, 1, 0.5450981, 0, 1,
-1.321613, -0.1213518, -1.249, 1, 0.5529412, 0, 1,
-1.319932, -1.780947, -3.138176, 1, 0.5568628, 0, 1,
-1.309713, -0.1999767, -1.536736, 1, 0.5647059, 0, 1,
-1.306896, -0.3498936, -0.3549262, 1, 0.5686275, 0, 1,
-1.299887, 0.840793, -2.14445, 1, 0.5764706, 0, 1,
-1.297744, 0.6184956, -2.70207, 1, 0.5803922, 0, 1,
-1.29645, -0.6010351, -3.704422, 1, 0.5882353, 0, 1,
-1.294988, 0.1733709, -0.9604878, 1, 0.5921569, 0, 1,
-1.286873, 0.1363267, -0.7135732, 1, 0.6, 0, 1,
-1.286008, -2.406538, -3.616917, 1, 0.6078432, 0, 1,
-1.28569, -0.1843919, -1.715104, 1, 0.6117647, 0, 1,
-1.285311, 1.685418, -2.792991, 1, 0.6196079, 0, 1,
-1.278044, 2.238897, -0.007031658, 1, 0.6235294, 0, 1,
-1.262931, 1.487948, -1.806084, 1, 0.6313726, 0, 1,
-1.254676, 0.5842113, -1.671026, 1, 0.6352941, 0, 1,
-1.248623, 0.9228323, -0.7797683, 1, 0.6431373, 0, 1,
-1.246262, -0.225889, -1.773745, 1, 0.6470588, 0, 1,
-1.242014, -0.6960759, -2.473739, 1, 0.654902, 0, 1,
-1.240726, 1.008386, -1.796388, 1, 0.6588235, 0, 1,
-1.226943, -0.3728707, -2.521032, 1, 0.6666667, 0, 1,
-1.22688, -0.1089016, -2.025003, 1, 0.6705883, 0, 1,
-1.218101, -1.214512, -2.046547, 1, 0.6784314, 0, 1,
-1.214604, -0.7870152, -2.364571, 1, 0.682353, 0, 1,
-1.21259, 2.725541, 0.1369335, 1, 0.6901961, 0, 1,
-1.211883, 1.602631, -2.6013, 1, 0.6941177, 0, 1,
-1.206749, 0.2366547, -0.8400806, 1, 0.7019608, 0, 1,
-1.203372, 0.174377, -0.9120666, 1, 0.7098039, 0, 1,
-1.202848, 1.314659, -0.5095777, 1, 0.7137255, 0, 1,
-1.184456, 0.6812958, -2.658253, 1, 0.7215686, 0, 1,
-1.180888, 0.005655576, 0.6740675, 1, 0.7254902, 0, 1,
-1.179778, -0.3531515, -1.261288, 1, 0.7333333, 0, 1,
-1.178937, 0.5607678, -1.062278, 1, 0.7372549, 0, 1,
-1.176901, 0.09322762, -0.9864308, 1, 0.7450981, 0, 1,
-1.176527, -1.429051, -2.789649, 1, 0.7490196, 0, 1,
-1.17569, -0.2404424, -0.646822, 1, 0.7568628, 0, 1,
-1.175686, -1.088769, -1.637443, 1, 0.7607843, 0, 1,
-1.167687, -2.377523, -1.841287, 1, 0.7686275, 0, 1,
-1.161768, 0.8216962, -0.8828356, 1, 0.772549, 0, 1,
-1.15429, 1.778984, -1.72506, 1, 0.7803922, 0, 1,
-1.134446, 0.988225, -2.168198, 1, 0.7843137, 0, 1,
-1.112906, -1.723253, -1.933363, 1, 0.7921569, 0, 1,
-1.106405, -0.3994359, -3.169808, 1, 0.7960784, 0, 1,
-1.09885, 0.1067528, -1.189646, 1, 0.8039216, 0, 1,
-1.095826, 0.169145, -0.7548638, 1, 0.8117647, 0, 1,
-1.087816, -0.2743979, -0.4245842, 1, 0.8156863, 0, 1,
-1.084348, 1.687139, -1.64371, 1, 0.8235294, 0, 1,
-1.081093, -1.602262, -2.490113, 1, 0.827451, 0, 1,
-1.078471, 0.5607771, -0.9042056, 1, 0.8352941, 0, 1,
-1.074508, 2.488046, 0.06919499, 1, 0.8392157, 0, 1,
-1.073817, 1.929532, -0.9087678, 1, 0.8470588, 0, 1,
-1.072512, 0.62841, -1.208949, 1, 0.8509804, 0, 1,
-1.071719, -0.6490418, -1.325382, 1, 0.8588235, 0, 1,
-1.069412, 0.848893, -1.215132, 1, 0.8627451, 0, 1,
-1.068794, -0.6756063, -2.618688, 1, 0.8705882, 0, 1,
-1.067285, 1.161535, -0.8042257, 1, 0.8745098, 0, 1,
-1.065015, -0.9956225, -2.682532, 1, 0.8823529, 0, 1,
-1.059844, 0.1367722, -0.8961243, 1, 0.8862745, 0, 1,
-1.055892, -1.339727, -1.406148, 1, 0.8941177, 0, 1,
-1.055583, -0.01752658, -1.038283, 1, 0.8980392, 0, 1,
-1.050122, 0.7381319, -0.2509705, 1, 0.9058824, 0, 1,
-1.048861, 0.9668358, -1.622969, 1, 0.9137255, 0, 1,
-1.036957, 1.912103, -0.09457608, 1, 0.9176471, 0, 1,
-1.036357, 0.7203263, -1.789263, 1, 0.9254902, 0, 1,
-1.027643, 1.097901, 0.3694856, 1, 0.9294118, 0, 1,
-1.025072, -1.204527, -4.331439, 1, 0.9372549, 0, 1,
-1.021774, -0.533262, -4.056776, 1, 0.9411765, 0, 1,
-1.016425, -2.151894, -1.760594, 1, 0.9490196, 0, 1,
-1.011395, 1.716292, 0.2754321, 1, 0.9529412, 0, 1,
-1.011013, 0.088114, 1.332097, 1, 0.9607843, 0, 1,
-1.001065, -1.879806, -1.893158, 1, 0.9647059, 0, 1,
-0.9978456, -0.5421632, -2.656837, 1, 0.972549, 0, 1,
-0.9948193, -0.1002143, 1.573175, 1, 0.9764706, 0, 1,
-0.9893575, 0.8816249, -0.01298048, 1, 0.9843137, 0, 1,
-0.9881932, -0.1134628, -3.450942, 1, 0.9882353, 0, 1,
-0.9801075, 0.1528857, -2.327241, 1, 0.9960784, 0, 1,
-0.9727483, 0.7064092, -1.261796, 0.9960784, 1, 0, 1,
-0.9726655, 1.120026, 0.3336913, 0.9921569, 1, 0, 1,
-0.9725025, -0.06498421, -1.835811, 0.9843137, 1, 0, 1,
-0.9718037, -0.4428807, -2.855353, 0.9803922, 1, 0, 1,
-0.9709365, 1.622412, -1.365565, 0.972549, 1, 0, 1,
-0.959959, 0.1474722, -2.287381, 0.9686275, 1, 0, 1,
-0.947164, 0.006731952, -1.809061, 0.9607843, 1, 0, 1,
-0.9435083, -0.3759599, -2.265883, 0.9568627, 1, 0, 1,
-0.93499, -1.53107, -2.685046, 0.9490196, 1, 0, 1,
-0.9304266, 0.3158817, -0.1760793, 0.945098, 1, 0, 1,
-0.9268605, -0.705017, -1.862881, 0.9372549, 1, 0, 1,
-0.9266089, 0.09278004, -2.49017, 0.9333333, 1, 0, 1,
-0.9167126, -0.1721587, -0.8613135, 0.9254902, 1, 0, 1,
-0.9142671, -1.282985, -2.04126, 0.9215686, 1, 0, 1,
-0.9140334, 0.4577628, -1.685119, 0.9137255, 1, 0, 1,
-0.9101808, 0.1688423, -0.9035532, 0.9098039, 1, 0, 1,
-0.9015485, 0.7252547, 1.394426, 0.9019608, 1, 0, 1,
-0.8954366, -0.5972668, 0.697678, 0.8941177, 1, 0, 1,
-0.8934341, 0.5303346, -1.66158, 0.8901961, 1, 0, 1,
-0.8928586, 1.382095, -0.2977524, 0.8823529, 1, 0, 1,
-0.8861454, -1.221596, -2.083683, 0.8784314, 1, 0, 1,
-0.8807368, -0.5103298, -1.654305, 0.8705882, 1, 0, 1,
-0.8720755, 0.4794049, -1.429462, 0.8666667, 1, 0, 1,
-0.8706685, 0.4045169, -1.442643, 0.8588235, 1, 0, 1,
-0.8689246, -0.938455, -2.668051, 0.854902, 1, 0, 1,
-0.8680945, -0.1040263, -3.255882, 0.8470588, 1, 0, 1,
-0.8496712, -0.9583353, -1.999853, 0.8431373, 1, 0, 1,
-0.8483518, 1.470345, -1.197891, 0.8352941, 1, 0, 1,
-0.8420529, 0.02618653, -0.941611, 0.8313726, 1, 0, 1,
-0.8409137, 0.2855241, -2.076831, 0.8235294, 1, 0, 1,
-0.8378988, -1.490623, -1.728966, 0.8196079, 1, 0, 1,
-0.8378298, 0.101967, -1.427897, 0.8117647, 1, 0, 1,
-0.8314619, -2.368937, -2.92886, 0.8078431, 1, 0, 1,
-0.8268046, 0.923373, -1.375289, 0.8, 1, 0, 1,
-0.8246282, -0.1196806, 0.1340158, 0.7921569, 1, 0, 1,
-0.8233267, 1.455594, -0.1767281, 0.7882353, 1, 0, 1,
-0.8189958, 0.04111151, -0.728857, 0.7803922, 1, 0, 1,
-0.8188717, -0.2358606, -1.894658, 0.7764706, 1, 0, 1,
-0.8158069, 0.6757889, -0.08284091, 0.7686275, 1, 0, 1,
-0.8140376, 0.313824, 0.3184579, 0.7647059, 1, 0, 1,
-0.8131885, 1.088259, 0.900774, 0.7568628, 1, 0, 1,
-0.8110566, -0.2026777, -1.759024, 0.7529412, 1, 0, 1,
-0.8048568, 1.433002, -0.587497, 0.7450981, 1, 0, 1,
-0.8019433, 0.03597945, -3.503232, 0.7411765, 1, 0, 1,
-0.7932521, 0.2542079, -2.539065, 0.7333333, 1, 0, 1,
-0.7902519, 1.015262, -1.505131, 0.7294118, 1, 0, 1,
-0.7878681, -2.596499, -1.688158, 0.7215686, 1, 0, 1,
-0.7850516, -0.9592934, -2.102772, 0.7176471, 1, 0, 1,
-0.7820624, 0.9464922, -0.5194835, 0.7098039, 1, 0, 1,
-0.7811855, -1.207926, -3.13195, 0.7058824, 1, 0, 1,
-0.7718542, -0.9390486, -1.412305, 0.6980392, 1, 0, 1,
-0.7697599, 0.6225854, -0.4805742, 0.6901961, 1, 0, 1,
-0.7697011, 0.5457029, -2.183802, 0.6862745, 1, 0, 1,
-0.7693529, -0.4194717, -3.030367, 0.6784314, 1, 0, 1,
-0.7669595, -0.5169135, -2.756076, 0.6745098, 1, 0, 1,
-0.7664472, 0.3771893, -0.6860638, 0.6666667, 1, 0, 1,
-0.7495276, 0.1796018, -1.578394, 0.6627451, 1, 0, 1,
-0.7458596, 0.4531767, -0.9308606, 0.654902, 1, 0, 1,
-0.7452167, -0.7356209, -3.315311, 0.6509804, 1, 0, 1,
-0.7398374, 0.3837636, -1.677206, 0.6431373, 1, 0, 1,
-0.735701, -0.818163, -2.503015, 0.6392157, 1, 0, 1,
-0.7315061, -0.4659589, -1.918737, 0.6313726, 1, 0, 1,
-0.7255222, 1.446218, -1.326886, 0.627451, 1, 0, 1,
-0.7229645, 0.5996776, -0.9558306, 0.6196079, 1, 0, 1,
-0.7141461, 1.058155, -1.900426, 0.6156863, 1, 0, 1,
-0.7112778, 1.172736, -1.502925, 0.6078432, 1, 0, 1,
-0.708331, -1.868286, -4.114114, 0.6039216, 1, 0, 1,
-0.7055909, 0.2425736, -0.4411798, 0.5960785, 1, 0, 1,
-0.7029671, -0.5618876, -1.830125, 0.5882353, 1, 0, 1,
-0.69802, 0.1483023, -1.793267, 0.5843138, 1, 0, 1,
-0.6978836, -0.3510791, -3.439589, 0.5764706, 1, 0, 1,
-0.6974562, 1.253681, -0.6415981, 0.572549, 1, 0, 1,
-0.696282, 0.827321, -0.2657787, 0.5647059, 1, 0, 1,
-0.6900191, 2.651865, 1.022158, 0.5607843, 1, 0, 1,
-0.6898426, -2.062121, -4.243716, 0.5529412, 1, 0, 1,
-0.6865281, -0.3604385, -2.786841, 0.5490196, 1, 0, 1,
-0.6811292, 0.6719955, -0.6301913, 0.5411765, 1, 0, 1,
-0.6800212, 0.5656042, -0.5763462, 0.5372549, 1, 0, 1,
-0.6793843, 0.3385407, -0.7309911, 0.5294118, 1, 0, 1,
-0.6776435, -0.09923214, -1.433557, 0.5254902, 1, 0, 1,
-0.677596, -0.7465795, -3.279343, 0.5176471, 1, 0, 1,
-0.6688122, 0.5009922, -1.329876, 0.5137255, 1, 0, 1,
-0.6685113, 1.211285, 0.04302604, 0.5058824, 1, 0, 1,
-0.6663799, -0.3351616, -1.712339, 0.5019608, 1, 0, 1,
-0.6649711, -0.5922725, -2.990405, 0.4941176, 1, 0, 1,
-0.6624516, -0.182509, -2.90663, 0.4862745, 1, 0, 1,
-0.66177, -0.3749729, -1.960026, 0.4823529, 1, 0, 1,
-0.6605185, -0.7233022, -3.230058, 0.4745098, 1, 0, 1,
-0.6590938, -0.9545087, -2.8201, 0.4705882, 1, 0, 1,
-0.6518742, -0.2763435, -1.774033, 0.4627451, 1, 0, 1,
-0.6491101, 0.8995425, 0.5336972, 0.4588235, 1, 0, 1,
-0.6481591, 0.1876312, -2.098832, 0.4509804, 1, 0, 1,
-0.6471778, 0.7896748, -1.134235, 0.4470588, 1, 0, 1,
-0.6463033, 0.9952661, -1.139388, 0.4392157, 1, 0, 1,
-0.629219, -0.2907229, -2.362327, 0.4352941, 1, 0, 1,
-0.6252487, -0.5499715, -2.45454, 0.427451, 1, 0, 1,
-0.623853, 1.405892, -1.957168, 0.4235294, 1, 0, 1,
-0.6228094, -1.238238, -3.06795, 0.4156863, 1, 0, 1,
-0.6147332, -0.5872074, -3.778313, 0.4117647, 1, 0, 1,
-0.612051, -0.8536361, -2.495637, 0.4039216, 1, 0, 1,
-0.6087594, 1.286727, 0.706131, 0.3960784, 1, 0, 1,
-0.6079848, 0.8287619, -0.5818949, 0.3921569, 1, 0, 1,
-0.60733, -0.7080575, -2.937018, 0.3843137, 1, 0, 1,
-0.5974613, -0.8200517, -0.5938611, 0.3803922, 1, 0, 1,
-0.5937736, -1.039146, -2.68479, 0.372549, 1, 0, 1,
-0.5907684, 0.2092228, -0.006557172, 0.3686275, 1, 0, 1,
-0.5887232, -0.9731166, -2.680044, 0.3607843, 1, 0, 1,
-0.5832896, -1.290088, -2.903676, 0.3568628, 1, 0, 1,
-0.5830998, 0.1436589, 0.5836507, 0.3490196, 1, 0, 1,
-0.5755017, 0.2963392, -0.5822416, 0.345098, 1, 0, 1,
-0.5686932, 0.7031867, 1.421834, 0.3372549, 1, 0, 1,
-0.567333, 1.93333, 1.090811, 0.3333333, 1, 0, 1,
-0.5658668, -0.8630252, -4.502477, 0.3254902, 1, 0, 1,
-0.5618796, 1.736952, 0.0928725, 0.3215686, 1, 0, 1,
-0.560415, 0.0955526, -1.338489, 0.3137255, 1, 0, 1,
-0.5510677, 1.234446, 1.217421, 0.3098039, 1, 0, 1,
-0.5500505, 0.6470845, -1.001248, 0.3019608, 1, 0, 1,
-0.548009, 1.31627, -1.058557, 0.2941177, 1, 0, 1,
-0.5404414, 0.04854273, -0.9259762, 0.2901961, 1, 0, 1,
-0.5368221, 2.172859, -0.2983206, 0.282353, 1, 0, 1,
-0.5362316, 0.4706746, -0.3066108, 0.2784314, 1, 0, 1,
-0.5343462, -1.071728, -5.023945, 0.2705882, 1, 0, 1,
-0.5265238, -0.0430815, -2.413987, 0.2666667, 1, 0, 1,
-0.5254261, 0.9234062, -2.393688, 0.2588235, 1, 0, 1,
-0.5242855, 0.955722, 0.4436453, 0.254902, 1, 0, 1,
-0.5226635, -0.7684131, -1.307803, 0.2470588, 1, 0, 1,
-0.5165324, 1.626782, 0.8542045, 0.2431373, 1, 0, 1,
-0.5147967, 0.8655789, -2.723537, 0.2352941, 1, 0, 1,
-0.5018345, -0.3558077, -3.190847, 0.2313726, 1, 0, 1,
-0.4964176, 0.6772935, -0.9340879, 0.2235294, 1, 0, 1,
-0.4947832, 1.760028, -0.395919, 0.2196078, 1, 0, 1,
-0.4934136, -0.1440238, -2.936158, 0.2117647, 1, 0, 1,
-0.4922216, 0.294241, -0.3327322, 0.2078431, 1, 0, 1,
-0.4892831, 1.883842, -1.371153, 0.2, 1, 0, 1,
-0.4874128, 1.00722, -0.4103638, 0.1921569, 1, 0, 1,
-0.4873948, -0.4611152, -3.995461, 0.1882353, 1, 0, 1,
-0.4835219, -0.902243, -1.896484, 0.1803922, 1, 0, 1,
-0.4812846, -0.2148595, -4.014824, 0.1764706, 1, 0, 1,
-0.4785405, -1.598493, -3.63484, 0.1686275, 1, 0, 1,
-0.4785209, -0.2348237, -1.160288, 0.1647059, 1, 0, 1,
-0.4745318, -2.579377, -1.400711, 0.1568628, 1, 0, 1,
-0.4679257, 1.393076, -1.068792, 0.1529412, 1, 0, 1,
-0.4653708, -0.2174913, -1.208313, 0.145098, 1, 0, 1,
-0.4651859, 0.6920428, -0.3340643, 0.1411765, 1, 0, 1,
-0.4641763, -0.118764, -1.914229, 0.1333333, 1, 0, 1,
-0.4626061, -2.308097, -2.171938, 0.1294118, 1, 0, 1,
-0.4608009, -1.562118, -2.933308, 0.1215686, 1, 0, 1,
-0.4584178, 0.5761951, -1.88261, 0.1176471, 1, 0, 1,
-0.4582841, 0.7040419, 0.383016, 0.1098039, 1, 0, 1,
-0.4565561, 0.1792262, -1.426123, 0.1058824, 1, 0, 1,
-0.4445424, 0.1142232, -1.32602, 0.09803922, 1, 0, 1,
-0.4428726, -0.2889045, -1.52499, 0.09019608, 1, 0, 1,
-0.4417942, -0.2182776, -2.354494, 0.08627451, 1, 0, 1,
-0.4417571, 2.52408, -1.945535, 0.07843138, 1, 0, 1,
-0.439878, 1.488094, -0.5247424, 0.07450981, 1, 0, 1,
-0.4381756, -1.117747, -2.638008, 0.06666667, 1, 0, 1,
-0.4375265, 0.9023408, -0.1220196, 0.0627451, 1, 0, 1,
-0.431013, 1.507632, -0.7295789, 0.05490196, 1, 0, 1,
-0.428892, -0.4898117, -2.244064, 0.05098039, 1, 0, 1,
-0.4251041, -1.283764, -1.461207, 0.04313726, 1, 0, 1,
-0.4242512, -0.7073761, -2.124505, 0.03921569, 1, 0, 1,
-0.4230473, -2.570805, -4.289854, 0.03137255, 1, 0, 1,
-0.4126988, 0.0323406, -0.8702235, 0.02745098, 1, 0, 1,
-0.4111912, 0.9836364, -0.1130163, 0.01960784, 1, 0, 1,
-0.4083367, -0.9631079, -2.980098, 0.01568628, 1, 0, 1,
-0.408287, 0.750244, 1.566383, 0.007843138, 1, 0, 1,
-0.4064556, -0.7788696, -3.127082, 0.003921569, 1, 0, 1,
-0.4006554, -0.8679175, -3.016198, 0, 1, 0.003921569, 1,
-0.3985341, -0.02932349, -3.172773, 0, 1, 0.01176471, 1,
-0.3974511, 0.2888558, -2.002636, 0, 1, 0.01568628, 1,
-0.3944536, 1.379196, 0.5011204, 0, 1, 0.02352941, 1,
-0.3917997, 0.3875897, 0.550514, 0, 1, 0.02745098, 1,
-0.3908808, 1.413492, -1.153486, 0, 1, 0.03529412, 1,
-0.3891326, -1.598145, -2.041316, 0, 1, 0.03921569, 1,
-0.3862378, -1.584542, -2.592119, 0, 1, 0.04705882, 1,
-0.3858787, 2.183598, 0.09871996, 0, 1, 0.05098039, 1,
-0.3857467, -0.5775285, -3.387337, 0, 1, 0.05882353, 1,
-0.3833657, -0.07324818, -1.509809, 0, 1, 0.0627451, 1,
-0.3817957, 0.05733956, -1.235076, 0, 1, 0.07058824, 1,
-0.3775498, 0.4487858, -0.2628711, 0, 1, 0.07450981, 1,
-0.3761041, -0.1610118, -1.571858, 0, 1, 0.08235294, 1,
-0.3727134, -1.454499, -3.977956, 0, 1, 0.08627451, 1,
-0.3647343, -1.437222, -2.57193, 0, 1, 0.09411765, 1,
-0.3642839, 0.2882687, 0.5296004, 0, 1, 0.1019608, 1,
-0.3639414, -1.295314, -3.461357, 0, 1, 0.1058824, 1,
-0.3608139, 1.566481, -0.4614118, 0, 1, 0.1137255, 1,
-0.3534291, -0.1758332, -3.014329, 0, 1, 0.1176471, 1,
-0.3533562, -0.7076958, -2.845853, 0, 1, 0.1254902, 1,
-0.3495914, -0.244209, -2.1845, 0, 1, 0.1294118, 1,
-0.3483472, 0.1169377, 0.1362101, 0, 1, 0.1372549, 1,
-0.3431646, 0.6757778, -1.008543, 0, 1, 0.1411765, 1,
-0.3430962, 0.732321, -0.7816316, 0, 1, 0.1490196, 1,
-0.3422132, 0.3721594, -1.33792, 0, 1, 0.1529412, 1,
-0.3412168, 0.4782833, -1.527543, 0, 1, 0.1607843, 1,
-0.3349134, 2.39779, -1.483544, 0, 1, 0.1647059, 1,
-0.3333578, -0.2266243, -2.298928, 0, 1, 0.172549, 1,
-0.3282226, -0.9350027, -3.906059, 0, 1, 0.1764706, 1,
-0.3277647, -0.8480512, -3.743234, 0, 1, 0.1843137, 1,
-0.3264593, 0.3464065, -0.8281142, 0, 1, 0.1882353, 1,
-0.3213733, 1.205866, -0.5231897, 0, 1, 0.1960784, 1,
-0.3177508, -0.1537244, -2.252821, 0, 1, 0.2039216, 1,
-0.3160534, -1.040736, -3.130882, 0, 1, 0.2078431, 1,
-0.3148304, -1.63345, -2.978712, 0, 1, 0.2156863, 1,
-0.3111707, 1.543885, 1.034736, 0, 1, 0.2196078, 1,
-0.2969303, -0.7125374, -1.776292, 0, 1, 0.227451, 1,
-0.295879, -1.832228, -3.545819, 0, 1, 0.2313726, 1,
-0.2953637, -0.283293, -2.27288, 0, 1, 0.2392157, 1,
-0.2947382, -0.6694366, -3.847591, 0, 1, 0.2431373, 1,
-0.2911913, 0.8664091, 0.9138466, 0, 1, 0.2509804, 1,
-0.2870123, -0.9837838, -2.453581, 0, 1, 0.254902, 1,
-0.2765156, 1.096568, -1.437075, 0, 1, 0.2627451, 1,
-0.273314, -0.1669389, -1.593754, 0, 1, 0.2666667, 1,
-0.2666578, 0.2006206, -0.7905104, 0, 1, 0.2745098, 1,
-0.2619178, -0.1192645, -2.371506, 0, 1, 0.2784314, 1,
-0.2615354, 1.262708, -2.400328, 0, 1, 0.2862745, 1,
-0.2594896, -1.04429, -3.935505, 0, 1, 0.2901961, 1,
-0.2542495, 1.760186, 0.4205627, 0, 1, 0.2980392, 1,
-0.252263, 1.972062, 1.659615, 0, 1, 0.3058824, 1,
-0.2486882, 0.06109139, -0.8250765, 0, 1, 0.3098039, 1,
-0.2486625, -0.7397531, -2.447342, 0, 1, 0.3176471, 1,
-0.2480511, -0.3811526, -1.240647, 0, 1, 0.3215686, 1,
-0.244579, 1.433517, -0.3323588, 0, 1, 0.3294118, 1,
-0.243938, -1.334166, -2.739758, 0, 1, 0.3333333, 1,
-0.2437789, -1.211987, -2.618056, 0, 1, 0.3411765, 1,
-0.2410209, 2.498167, -0.106221, 0, 1, 0.345098, 1,
-0.2408284, 0.9037511, -1.285588, 0, 1, 0.3529412, 1,
-0.2405949, -0.4917292, -3.059396, 0, 1, 0.3568628, 1,
-0.2370097, 0.2842771, 0.002019732, 0, 1, 0.3647059, 1,
-0.2354793, 0.8096901, -1.902928, 0, 1, 0.3686275, 1,
-0.2353697, -0.1790918, -1.133209, 0, 1, 0.3764706, 1,
-0.2273834, 0.1150146, -0.5274959, 0, 1, 0.3803922, 1,
-0.2265605, -2.431767, -4.207083, 0, 1, 0.3882353, 1,
-0.2239233, -2.674522, -2.563541, 0, 1, 0.3921569, 1,
-0.2229558, 1.685133, 0.4441676, 0, 1, 0.4, 1,
-0.2221243, -1.167864, -2.229564, 0, 1, 0.4078431, 1,
-0.2177005, 0.8510736, 0.27866, 0, 1, 0.4117647, 1,
-0.2148056, -2.321352, -3.434701, 0, 1, 0.4196078, 1,
-0.2133147, 2.214413, 0.08669233, 0, 1, 0.4235294, 1,
-0.2131752, -0.1154988, -0.4612759, 0, 1, 0.4313726, 1,
-0.2118087, -0.1098201, -1.492752, 0, 1, 0.4352941, 1,
-0.2107593, -0.007182717, -2.68544, 0, 1, 0.4431373, 1,
-0.2056386, 0.3105356, 1.285849, 0, 1, 0.4470588, 1,
-0.205005, 0.6333573, -1.032975, 0, 1, 0.454902, 1,
-0.192912, -0.1842276, -1.949694, 0, 1, 0.4588235, 1,
-0.1882383, 1.501784, 1.501352, 0, 1, 0.4666667, 1,
-0.1869974, 1.01544, -1.371398, 0, 1, 0.4705882, 1,
-0.1782023, -0.6264137, -2.785668, 0, 1, 0.4784314, 1,
-0.1708023, 0.8395827, 1.350934, 0, 1, 0.4823529, 1,
-0.1681188, -0.1885651, -3.521245, 0, 1, 0.4901961, 1,
-0.1675306, -1.460207, -3.469477, 0, 1, 0.4941176, 1,
-0.1675274, 0.2744915, -0.3252798, 0, 1, 0.5019608, 1,
-0.1670406, 1.265179, 0.3454848, 0, 1, 0.509804, 1,
-0.1649196, -0.4508079, -4.518091, 0, 1, 0.5137255, 1,
-0.164268, 2.152372, -0.4111049, 0, 1, 0.5215687, 1,
-0.1629194, 0.6500806, 0.3757831, 0, 1, 0.5254902, 1,
-0.1563639, 0.6425414, 0.3885049, 0, 1, 0.5333334, 1,
-0.1537675, 0.7483238, -0.8548344, 0, 1, 0.5372549, 1,
-0.1531527, 0.01762344, -1.69894, 0, 1, 0.5450981, 1,
-0.1515018, 1.550126, 0.5849755, 0, 1, 0.5490196, 1,
-0.1469746, -1.33657, -1.673655, 0, 1, 0.5568628, 1,
-0.1427962, 1.322439, 1.032228, 0, 1, 0.5607843, 1,
-0.1417563, -0.7351684, -3.710518, 0, 1, 0.5686275, 1,
-0.1347047, -0.322397, -2.707178, 0, 1, 0.572549, 1,
-0.1341077, -1.14792, -2.402251, 0, 1, 0.5803922, 1,
-0.1327846, 1.052602, 0.3770436, 0, 1, 0.5843138, 1,
-0.1300091, 0.3736998, 0.6591015, 0, 1, 0.5921569, 1,
-0.1239066, -0.9494082, -3.916062, 0, 1, 0.5960785, 1,
-0.1237373, 0.6635013, -0.1847355, 0, 1, 0.6039216, 1,
-0.1223938, -0.08602878, -1.407886, 0, 1, 0.6117647, 1,
-0.1217759, 1.893343, -0.3294716, 0, 1, 0.6156863, 1,
-0.1178646, 0.4318014, -0.2359104, 0, 1, 0.6235294, 1,
-0.1175848, -0.5444888, -2.639766, 0, 1, 0.627451, 1,
-0.1152696, 0.1800888, -0.9741337, 0, 1, 0.6352941, 1,
-0.1143729, 1.312658, -1.633783, 0, 1, 0.6392157, 1,
-0.1132388, -0.08568332, -0.9795887, 0, 1, 0.6470588, 1,
-0.1104995, 0.7426498, -0.05201927, 0, 1, 0.6509804, 1,
-0.1097942, 0.139187, -0.661458, 0, 1, 0.6588235, 1,
-0.1097641, -0.8027654, -0.2840056, 0, 1, 0.6627451, 1,
-0.1094849, -0.7341605, -3.446278, 0, 1, 0.6705883, 1,
-0.1084958, 1.752577, -1.999401, 0, 1, 0.6745098, 1,
-0.1084461, -3.331405, -2.114482, 0, 1, 0.682353, 1,
-0.1046123, 0.7608676, 0.2304679, 0, 1, 0.6862745, 1,
-0.1029717, -0.7290546, -3.917906, 0, 1, 0.6941177, 1,
-0.1015618, 1.187688, -0.8675385, 0, 1, 0.7019608, 1,
-0.0992093, 0.1232306, -1.328175, 0, 1, 0.7058824, 1,
-0.09613552, 0.9178607, 0.5555994, 0, 1, 0.7137255, 1,
-0.09296315, 0.5084774, -1.076669, 0, 1, 0.7176471, 1,
-0.0919202, -1.606291, -1.749645, 0, 1, 0.7254902, 1,
-0.09009713, -0.6633584, -6.421403, 0, 1, 0.7294118, 1,
-0.08950958, 0.2846888, 0.9176689, 0, 1, 0.7372549, 1,
-0.08280762, -0.4470455, -3.225023, 0, 1, 0.7411765, 1,
-0.08051085, 0.1568147, -0.6836575, 0, 1, 0.7490196, 1,
-0.07876767, -0.5622482, -3.115716, 0, 1, 0.7529412, 1,
-0.07843905, -0.647938, -0.7701104, 0, 1, 0.7607843, 1,
-0.07672673, 0.33202, 0.1055691, 0, 1, 0.7647059, 1,
-0.07322691, 0.5805282, 0.6044245, 0, 1, 0.772549, 1,
-0.07247437, 0.05001982, -2.675355, 0, 1, 0.7764706, 1,
-0.07063249, -0.3028567, -2.566094, 0, 1, 0.7843137, 1,
-0.07037836, -0.7388186, -0.4737655, 0, 1, 0.7882353, 1,
-0.06556927, 0.6540904, 0.2560486, 0, 1, 0.7960784, 1,
-0.06434041, -0.1322995, -1.768948, 0, 1, 0.8039216, 1,
-0.06133839, -0.1234239, -2.659952, 0, 1, 0.8078431, 1,
-0.0591569, 0.04767681, -0.2324541, 0, 1, 0.8156863, 1,
-0.05526743, -0.7031472, -2.157397, 0, 1, 0.8196079, 1,
-0.05363526, 0.01403285, -1.056185, 0, 1, 0.827451, 1,
-0.05218766, 0.8116452, -0.9985231, 0, 1, 0.8313726, 1,
-0.05010151, 1.159462, -2.078012, 0, 1, 0.8392157, 1,
-0.04817731, -0.3158915, -3.431001, 0, 1, 0.8431373, 1,
-0.0466752, 1.291758, -0.6061269, 0, 1, 0.8509804, 1,
-0.04572243, -0.7904805, -3.667691, 0, 1, 0.854902, 1,
-0.04472915, -0.7456719, -1.775543, 0, 1, 0.8627451, 1,
-0.04450434, 0.1887478, -0.4327454, 0, 1, 0.8666667, 1,
-0.04265779, 0.2609535, 0.1941249, 0, 1, 0.8745098, 1,
-0.04257328, -0.8532865, -2.990774, 0, 1, 0.8784314, 1,
-0.03995293, 0.3309781, 0.4490079, 0, 1, 0.8862745, 1,
-0.03665247, 0.1431567, -0.02639589, 0, 1, 0.8901961, 1,
-0.03625097, -0.8085303, -3.338092, 0, 1, 0.8980392, 1,
-0.02689021, 0.510888, -0.1269082, 0, 1, 0.9058824, 1,
-0.02419562, -1.531908, -2.653478, 0, 1, 0.9098039, 1,
-0.02250757, -0.3034398, -2.954581, 0, 1, 0.9176471, 1,
-0.0077533, 0.2920553, -1.072116, 0, 1, 0.9215686, 1,
-0.006719068, -0.3236298, -3.337892, 0, 1, 0.9294118, 1,
-0.002077548, -0.2388879, -2.380338, 0, 1, 0.9333333, 1,
-0.001823727, 1.510056, 1.102826, 0, 1, 0.9411765, 1,
4.593994e-05, 0.6580951, 0.3284939, 0, 1, 0.945098, 1,
0.006384438, 0.4701405, 0.764446, 0, 1, 0.9529412, 1,
0.007048238, 2.215099, 0.0002127285, 0, 1, 0.9568627, 1,
0.00785988, -0.132404, 2.444509, 0, 1, 0.9647059, 1,
0.009168137, -0.9074544, 2.468565, 0, 1, 0.9686275, 1,
0.009224709, 1.855159, 0.608609, 0, 1, 0.9764706, 1,
0.0109598, 0.3326834, 0.5503022, 0, 1, 0.9803922, 1,
0.01614691, 1.276121, 1.816635, 0, 1, 0.9882353, 1,
0.01964341, 0.87043, 0.3061563, 0, 1, 0.9921569, 1,
0.0215656, -1.490801, 3.998016, 0, 1, 1, 1,
0.02236806, -1.370206, 2.918047, 0, 0.9921569, 1, 1,
0.02605705, -0.1450019, 1.933228, 0, 0.9882353, 1, 1,
0.02774658, -0.3960952, 4.77479, 0, 0.9803922, 1, 1,
0.02827155, 0.7633964, 0.3246608, 0, 0.9764706, 1, 1,
0.02869092, 0.9886668, -0.5821003, 0, 0.9686275, 1, 1,
0.03205685, -0.1485469, 3.32939, 0, 0.9647059, 1, 1,
0.03498819, 0.8670609, 0.2433639, 0, 0.9568627, 1, 1,
0.03569772, -0.3544989, 3.354586, 0, 0.9529412, 1, 1,
0.03746924, 0.4809639, -0.2234239, 0, 0.945098, 1, 1,
0.04193068, -0.3842144, 2.612981, 0, 0.9411765, 1, 1,
0.04218904, 0.6263758, 0.6287549, 0, 0.9333333, 1, 1,
0.04845941, -0.4399832, 3.822457, 0, 0.9294118, 1, 1,
0.05228572, -1.263621, 2.547499, 0, 0.9215686, 1, 1,
0.05315585, -2.301591, 4.457196, 0, 0.9176471, 1, 1,
0.05477929, -2.270143, 1.2594, 0, 0.9098039, 1, 1,
0.05494747, -0.2843931, 4.306748, 0, 0.9058824, 1, 1,
0.05857101, -1.427354, 4.477686, 0, 0.8980392, 1, 1,
0.06115208, -0.5861255, 2.777525, 0, 0.8901961, 1, 1,
0.06117305, -0.0468418, 2.201294, 0, 0.8862745, 1, 1,
0.06258214, -0.3326375, 2.823776, 0, 0.8784314, 1, 1,
0.06330878, -0.9380836, 3.532838, 0, 0.8745098, 1, 1,
0.06608568, -0.3731641, 1.465712, 0, 0.8666667, 1, 1,
0.0698894, -1.858734, 3.095794, 0, 0.8627451, 1, 1,
0.07182144, 1.426501, -0.362124, 0, 0.854902, 1, 1,
0.07186312, 1.389858, 1.115964, 0, 0.8509804, 1, 1,
0.07489138, -0.6789311, 5.032783, 0, 0.8431373, 1, 1,
0.07876252, -0.5180151, 2.736913, 0, 0.8392157, 1, 1,
0.09227061, -0.1693404, 2.696535, 0, 0.8313726, 1, 1,
0.0934178, 1.466419, -0.4987095, 0, 0.827451, 1, 1,
0.09399078, -0.5711229, 2.046233, 0, 0.8196079, 1, 1,
0.09486558, 1.557907, 0.2296518, 0, 0.8156863, 1, 1,
0.09645892, 0.2566246, 1.202079, 0, 0.8078431, 1, 1,
0.09920387, -0.8464305, 2.324965, 0, 0.8039216, 1, 1,
0.1009865, 1.708384, -2.257196, 0, 0.7960784, 1, 1,
0.1031454, 0.0420436, 0.8698469, 0, 0.7882353, 1, 1,
0.1079882, 0.8798299, -1.404859, 0, 0.7843137, 1, 1,
0.10835, 1.154932, 0.1927497, 0, 0.7764706, 1, 1,
0.1105952, 0.6461167, -0.8562675, 0, 0.772549, 1, 1,
0.1129185, -1.686552, 4.079988, 0, 0.7647059, 1, 1,
0.1129914, 1.730259, 0.5540207, 0, 0.7607843, 1, 1,
0.1151769, 0.7211195, 0.1278239, 0, 0.7529412, 1, 1,
0.1154902, -0.411255, 4.345094, 0, 0.7490196, 1, 1,
0.1167823, 0.4998652, 0.3899872, 0, 0.7411765, 1, 1,
0.1182619, -1.493154, 2.086382, 0, 0.7372549, 1, 1,
0.1183639, -1.038449, 2.930184, 0, 0.7294118, 1, 1,
0.1219391, 0.7310877, -1.064943, 0, 0.7254902, 1, 1,
0.1260329, 0.6621284, -2.522967, 0, 0.7176471, 1, 1,
0.1260651, 0.2088907, -0.2547543, 0, 0.7137255, 1, 1,
0.1294785, -1.336087, 3.07072, 0, 0.7058824, 1, 1,
0.1319916, 0.7859583, 1.195216, 0, 0.6980392, 1, 1,
0.1331948, -1.26732, 3.428801, 0, 0.6941177, 1, 1,
0.1358894, -0.3812529, 2.686035, 0, 0.6862745, 1, 1,
0.137516, -0.2639741, 2.417761, 0, 0.682353, 1, 1,
0.1396737, -0.2677138, 3.153294, 0, 0.6745098, 1, 1,
0.141008, -1.41606, 3.80812, 0, 0.6705883, 1, 1,
0.141553, 0.6485099, 0.3769311, 0, 0.6627451, 1, 1,
0.1487616, -2.353358, 2.20956, 0, 0.6588235, 1, 1,
0.1497378, 0.3859521, -0.05314067, 0, 0.6509804, 1, 1,
0.1523722, -0.9726651, 2.954109, 0, 0.6470588, 1, 1,
0.1557079, 0.8934107, 0.2860804, 0, 0.6392157, 1, 1,
0.1560104, 2.077563, -0.1940752, 0, 0.6352941, 1, 1,
0.1574721, -0.7203893, 2.058747, 0, 0.627451, 1, 1,
0.1575817, 0.5001804, -0.821591, 0, 0.6235294, 1, 1,
0.1623194, -0.5462226, 2.963498, 0, 0.6156863, 1, 1,
0.175583, -0.4228939, 1.859798, 0, 0.6117647, 1, 1,
0.1780922, 0.2072817, 0.5925588, 0, 0.6039216, 1, 1,
0.1807196, 0.5757343, -0.02237638, 0, 0.5960785, 1, 1,
0.1823918, 0.6383544, -0.5964354, 0, 0.5921569, 1, 1,
0.1842659, 0.7695598, 0.07921568, 0, 0.5843138, 1, 1,
0.1844137, -1.884737, 3.228635, 0, 0.5803922, 1, 1,
0.1846994, -1.439928, 4.187405, 0, 0.572549, 1, 1,
0.1871177, 0.225632, 0.6578333, 0, 0.5686275, 1, 1,
0.1879076, -0.2570542, 1.439823, 0, 0.5607843, 1, 1,
0.189984, 0.0448183, 0.7185315, 0, 0.5568628, 1, 1,
0.1993749, 0.5407788, -0.1665421, 0, 0.5490196, 1, 1,
0.201341, -1.176061, 3.479131, 0, 0.5450981, 1, 1,
0.2026686, 1.810851, -0.3810693, 0, 0.5372549, 1, 1,
0.2063205, 0.9820491, 0.4831208, 0, 0.5333334, 1, 1,
0.2065832, 1.698989, 0.3906554, 0, 0.5254902, 1, 1,
0.2102925, -0.5412133, 2.466724, 0, 0.5215687, 1, 1,
0.2107579, -1.644919, 3.290088, 0, 0.5137255, 1, 1,
0.2113148, -1.088688, 3.708608, 0, 0.509804, 1, 1,
0.2147239, 1.517834, -0.4715207, 0, 0.5019608, 1, 1,
0.2156337, 0.7580097, 0.3275292, 0, 0.4941176, 1, 1,
0.2159115, 0.08538406, 2.265848, 0, 0.4901961, 1, 1,
0.2179915, -0.7540692, 1.009232, 0, 0.4823529, 1, 1,
0.2203817, 0.009591402, 2.111796, 0, 0.4784314, 1, 1,
0.2208911, 1.657654, 1.684708, 0, 0.4705882, 1, 1,
0.2238442, -0.3318583, -0.1020273, 0, 0.4666667, 1, 1,
0.2274844, 0.8317014, 1.328208, 0, 0.4588235, 1, 1,
0.2293512, 1.071701, -0.7999344, 0, 0.454902, 1, 1,
0.231695, -0.2207928, 1.784564, 0, 0.4470588, 1, 1,
0.2336559, 0.4149628, 0.2102389, 0, 0.4431373, 1, 1,
0.2350554, 1.5077, 1.132258, 0, 0.4352941, 1, 1,
0.2410048, 0.6083233, 0.02703101, 0, 0.4313726, 1, 1,
0.2423663, -0.7291784, 3.546034, 0, 0.4235294, 1, 1,
0.2431813, -0.7173822, 3.996485, 0, 0.4196078, 1, 1,
0.2446271, 0.2188011, 0.9114266, 0, 0.4117647, 1, 1,
0.2545227, -0.431746, 3.22961, 0, 0.4078431, 1, 1,
0.2579517, -1.040033, 3.906948, 0, 0.4, 1, 1,
0.2587898, -0.7760901, 2.714155, 0, 0.3921569, 1, 1,
0.2604172, 0.1777428, 0.8212724, 0, 0.3882353, 1, 1,
0.2604206, -0.2939446, 2.363231, 0, 0.3803922, 1, 1,
0.2607394, -0.7218108, 5.363469, 0, 0.3764706, 1, 1,
0.2611932, 0.09510018, 1.936591, 0, 0.3686275, 1, 1,
0.2614172, 0.7882593, -0.3270008, 0, 0.3647059, 1, 1,
0.2638759, -0.06644578, 0.9295954, 0, 0.3568628, 1, 1,
0.266504, -0.8429, 2.241012, 0, 0.3529412, 1, 1,
0.2702715, 0.9231132, 0.8734266, 0, 0.345098, 1, 1,
0.2732542, 0.5308614, 0.4931281, 0, 0.3411765, 1, 1,
0.2788482, 1.838186, 1.417327, 0, 0.3333333, 1, 1,
0.2829983, -0.8562166, 2.943244, 0, 0.3294118, 1, 1,
0.2842373, 0.2830187, -1.491756, 0, 0.3215686, 1, 1,
0.2855041, -0.02757625, 1.082598, 0, 0.3176471, 1, 1,
0.2858425, -0.5878191, 3.612141, 0, 0.3098039, 1, 1,
0.2906018, 0.47047, 1.583545, 0, 0.3058824, 1, 1,
0.2917028, 0.3466212, -0.7998126, 0, 0.2980392, 1, 1,
0.2943581, 0.6886453, 2.369958, 0, 0.2901961, 1, 1,
0.2966021, 0.244266, -1.409084, 0, 0.2862745, 1, 1,
0.2997997, -0.9763905, 1.546415, 0, 0.2784314, 1, 1,
0.300298, -1.634755, 0.6863442, 0, 0.2745098, 1, 1,
0.3033981, 0.8544574, -0.7819568, 0, 0.2666667, 1, 1,
0.3044744, 2.077961, 1.665632, 0, 0.2627451, 1, 1,
0.3053187, -0.1627711, 1.738045, 0, 0.254902, 1, 1,
0.3088081, -0.2626087, 1.323328, 0, 0.2509804, 1, 1,
0.3116278, 1.100938, -1.66643, 0, 0.2431373, 1, 1,
0.3144434, 2.063822, 0.9339181, 0, 0.2392157, 1, 1,
0.3159455, -0.09656586, 3.538623, 0, 0.2313726, 1, 1,
0.3175651, -0.1474418, 3.26359, 0, 0.227451, 1, 1,
0.3181906, 0.4271038, 2.313357, 0, 0.2196078, 1, 1,
0.3270846, 0.2507692, 2.782493, 0, 0.2156863, 1, 1,
0.3288229, -0.07176544, 2.616274, 0, 0.2078431, 1, 1,
0.3306263, -0.3327038, 0.3135594, 0, 0.2039216, 1, 1,
0.3388808, -0.830331, 2.355453, 0, 0.1960784, 1, 1,
0.3429427, -0.07849807, 2.429705, 0, 0.1882353, 1, 1,
0.3460382, 1.278466, -0.9777793, 0, 0.1843137, 1, 1,
0.3474582, -2.051698, 5.08826, 0, 0.1764706, 1, 1,
0.358574, -0.1991482, 0.8606539, 0, 0.172549, 1, 1,
0.3586379, -1.928933, 4.481569, 0, 0.1647059, 1, 1,
0.3590423, -0.3632907, 4.438622, 0, 0.1607843, 1, 1,
0.3611782, -0.08531855, 1.736459, 0, 0.1529412, 1, 1,
0.3617491, -1.295518, 2.979881, 0, 0.1490196, 1, 1,
0.366699, 0.00643966, 1.213488, 0, 0.1411765, 1, 1,
0.3703785, 0.7351857, 0.7608927, 0, 0.1372549, 1, 1,
0.370573, -2.040179, 2.671824, 0, 0.1294118, 1, 1,
0.3743981, -0.6807569, 1.104431, 0, 0.1254902, 1, 1,
0.3750484, 0.05956922, 0.4852346, 0, 0.1176471, 1, 1,
0.376641, 0.6591121, 1.369158, 0, 0.1137255, 1, 1,
0.3782888, 2.723288, -0.6106133, 0, 0.1058824, 1, 1,
0.380157, 0.0303096, 1.343199, 0, 0.09803922, 1, 1,
0.3809994, 0.6528364, 2.210456, 0, 0.09411765, 1, 1,
0.3821925, 0.07100365, 0.1325659, 0, 0.08627451, 1, 1,
0.3842731, 0.9888212, 2.298159, 0, 0.08235294, 1, 1,
0.3888715, -1.539003, 1.441801, 0, 0.07450981, 1, 1,
0.392132, 0.9501572, 0.130552, 0, 0.07058824, 1, 1,
0.3966088, 2.431257, -0.4860202, 0, 0.0627451, 1, 1,
0.3967028, -0.5168497, 2.569232, 0, 0.05882353, 1, 1,
0.4010899, -0.6624275, 2.383959, 0, 0.05098039, 1, 1,
0.4011475, 0.6708657, 0.3758101, 0, 0.04705882, 1, 1,
0.4034165, -0.003109029, 0.3792855, 0, 0.03921569, 1, 1,
0.404224, -2.126686, 3.924725, 0, 0.03529412, 1, 1,
0.4043601, 1.148886, -0.6284583, 0, 0.02745098, 1, 1,
0.4069945, 1.450131, 1.774152, 0, 0.02352941, 1, 1,
0.4070345, 0.03196376, 2.582569, 0, 0.01568628, 1, 1,
0.4097566, -1.60308, 2.463995, 0, 0.01176471, 1, 1,
0.4099973, 0.1929854, 1.374359, 0, 0.003921569, 1, 1,
0.4161778, -1.242362, 1.863554, 0.003921569, 0, 1, 1,
0.4166905, 0.113806, 1.434986, 0.007843138, 0, 1, 1,
0.4188856, 0.5520507, -0.4805158, 0.01568628, 0, 1, 1,
0.4198926, -0.06805496, 2.114869, 0.01960784, 0, 1, 1,
0.4230761, -0.2181111, 3.023554, 0.02745098, 0, 1, 1,
0.4258006, 0.186533, 0.3506005, 0.03137255, 0, 1, 1,
0.4284974, 1.099864, 0.1341989, 0.03921569, 0, 1, 1,
0.4287722, -0.1905747, 1.392413, 0.04313726, 0, 1, 1,
0.4311722, 1.912469, 1.587908, 0.05098039, 0, 1, 1,
0.4415812, -0.8187333, 4.174185, 0.05490196, 0, 1, 1,
0.4475569, -0.8718001, 3.844768, 0.0627451, 0, 1, 1,
0.4487326, -0.3972766, 2.039453, 0.06666667, 0, 1, 1,
0.4501615, -0.6906611, 1.215467, 0.07450981, 0, 1, 1,
0.4521737, 0.3666355, 0.6731995, 0.07843138, 0, 1, 1,
0.453208, 0.4227567, 1.134364, 0.08627451, 0, 1, 1,
0.4546481, 0.2841553, 3.34737, 0.09019608, 0, 1, 1,
0.4610541, 0.6846668, 1.942368, 0.09803922, 0, 1, 1,
0.4617268, 1.669105, 1.425215, 0.1058824, 0, 1, 1,
0.4630184, 0.1119141, 1.868115, 0.1098039, 0, 1, 1,
0.465975, 1.258991, -0.9653488, 0.1176471, 0, 1, 1,
0.4720306, 0.157266, 1.05338, 0.1215686, 0, 1, 1,
0.4735296, 1.294904, 0.212923, 0.1294118, 0, 1, 1,
0.4761705, -0.1064005, 1.316872, 0.1333333, 0, 1, 1,
0.4834979, -0.5575916, 2.582864, 0.1411765, 0, 1, 1,
0.4904096, -0.05664112, 2.304867, 0.145098, 0, 1, 1,
0.4935776, -0.317648, 1.773719, 0.1529412, 0, 1, 1,
0.4946663, -0.006944845, 2.353303, 0.1568628, 0, 1, 1,
0.4974045, 0.8248603, 0.3489152, 0.1647059, 0, 1, 1,
0.5021579, -0.3862351, 1.788944, 0.1686275, 0, 1, 1,
0.5087587, 0.759181, -0.2079991, 0.1764706, 0, 1, 1,
0.5104157, -0.1426313, 2.507095, 0.1803922, 0, 1, 1,
0.5111864, -1.153522, 1.510154, 0.1882353, 0, 1, 1,
0.5113416, 1.158063, 0.8083389, 0.1921569, 0, 1, 1,
0.5140871, -1.357752, 2.398194, 0.2, 0, 1, 1,
0.5144283, 1.633276, 0.01066207, 0.2078431, 0, 1, 1,
0.5191759, 0.2623087, 2.755803, 0.2117647, 0, 1, 1,
0.527744, -0.9753342, 2.58628, 0.2196078, 0, 1, 1,
0.5317238, 0.7900434, -1.493715, 0.2235294, 0, 1, 1,
0.5403435, 0.752738, 0.5789924, 0.2313726, 0, 1, 1,
0.5409465, -0.6020287, 1.449943, 0.2352941, 0, 1, 1,
0.5456274, -0.104059, 2.992756, 0.2431373, 0, 1, 1,
0.5497885, -0.03512647, 1.238481, 0.2470588, 0, 1, 1,
0.5511857, 0.9010302, 1.967093, 0.254902, 0, 1, 1,
0.5512235, -0.1108013, 1.341751, 0.2588235, 0, 1, 1,
0.5560359, 0.430306, 0.3719703, 0.2666667, 0, 1, 1,
0.5670711, 0.9890537, 0.6118915, 0.2705882, 0, 1, 1,
0.5730132, -0.2635609, 1.629021, 0.2784314, 0, 1, 1,
0.5731186, -1.462322, 3.120382, 0.282353, 0, 1, 1,
0.5795081, -0.6891583, 3.027124, 0.2901961, 0, 1, 1,
0.5814047, -0.2830248, 1.69484, 0.2941177, 0, 1, 1,
0.5823812, 0.6790408, 2.129672, 0.3019608, 0, 1, 1,
0.589208, -0.6265991, 1.56557, 0.3098039, 0, 1, 1,
0.6002285, 0.3340912, 2.229169, 0.3137255, 0, 1, 1,
0.6022859, 0.8452779, -0.2304025, 0.3215686, 0, 1, 1,
0.6041208, -1.135805, 1.429541, 0.3254902, 0, 1, 1,
0.6125058, -0.4772679, 2.139906, 0.3333333, 0, 1, 1,
0.6126124, -1.772152, 5.384332, 0.3372549, 0, 1, 1,
0.6134143, 1.518553, 0.9092016, 0.345098, 0, 1, 1,
0.6172457, -1.574168, 1.467491, 0.3490196, 0, 1, 1,
0.6181151, 1.269586, 1.965964, 0.3568628, 0, 1, 1,
0.6246916, -0.8176094, 1.860006, 0.3607843, 0, 1, 1,
0.6253597, -0.4125715, 2.486197, 0.3686275, 0, 1, 1,
0.6292784, 1.107686, -0.4417847, 0.372549, 0, 1, 1,
0.6319314, 0.5070872, -0.234249, 0.3803922, 0, 1, 1,
0.6369184, 2.529289, -1.735662, 0.3843137, 0, 1, 1,
0.6424184, 0.7100952, 0.2609692, 0.3921569, 0, 1, 1,
0.6471912, 0.4623618, 1.903329, 0.3960784, 0, 1, 1,
0.655049, -0.2248333, 1.548115, 0.4039216, 0, 1, 1,
0.6643416, -1.146871, 0.3221383, 0.4117647, 0, 1, 1,
0.6655617, -1.90156, 0.56604, 0.4156863, 0, 1, 1,
0.6679038, 2.272861, 0.03637112, 0.4235294, 0, 1, 1,
0.6693829, -1.390439, 1.130365, 0.427451, 0, 1, 1,
0.6709878, 1.588588, -0.6937221, 0.4352941, 0, 1, 1,
0.675166, -0.009573501, 2.177146, 0.4392157, 0, 1, 1,
0.6801957, -1.613244, 1.292707, 0.4470588, 0, 1, 1,
0.6809037, 0.7246768, 0.8991456, 0.4509804, 0, 1, 1,
0.6809444, -0.3495585, 2.084553, 0.4588235, 0, 1, 1,
0.682053, -0.01116509, 1.886116, 0.4627451, 0, 1, 1,
0.682811, -0.04174507, 0.7238288, 0.4705882, 0, 1, 1,
0.6830052, 1.961721, 1.29469, 0.4745098, 0, 1, 1,
0.6834289, -0.2007854, 1.870271, 0.4823529, 0, 1, 1,
0.6854306, 1.575781, 0.05639983, 0.4862745, 0, 1, 1,
0.6931374, 2.161246, 0.7925293, 0.4941176, 0, 1, 1,
0.6956933, -0.6492409, 2.492305, 0.5019608, 0, 1, 1,
0.6972174, -1.301873, 2.276243, 0.5058824, 0, 1, 1,
0.7088866, -0.3791569, 0.8770129, 0.5137255, 0, 1, 1,
0.710185, -0.7136067, 2.652951, 0.5176471, 0, 1, 1,
0.7171181, -0.542529, 2.548183, 0.5254902, 0, 1, 1,
0.7174456, -0.6262969, 2.756119, 0.5294118, 0, 1, 1,
0.7175648, 0.2654298, 0.8766148, 0.5372549, 0, 1, 1,
0.7215597, 1.295837, 0.1079383, 0.5411765, 0, 1, 1,
0.7241207, -0.4052038, 1.853959, 0.5490196, 0, 1, 1,
0.7250913, 1.458371, -0.6460797, 0.5529412, 0, 1, 1,
0.7259048, 0.3448206, 1.560884, 0.5607843, 0, 1, 1,
0.7359601, -1.227423, 1.428932, 0.5647059, 0, 1, 1,
0.744357, 0.3647738, 1.810947, 0.572549, 0, 1, 1,
0.7494043, 1.395302, 2.955864, 0.5764706, 0, 1, 1,
0.7513818, -1.281523, 4.336461, 0.5843138, 0, 1, 1,
0.7517235, -0.1186124, 0.2265379, 0.5882353, 0, 1, 1,
0.758782, 1.458735, 0.8737442, 0.5960785, 0, 1, 1,
0.7613726, 1.692147, 0.2926262, 0.6039216, 0, 1, 1,
0.7646629, 0.3095118, 2.401881, 0.6078432, 0, 1, 1,
0.7656958, 0.2208409, 2.814623, 0.6156863, 0, 1, 1,
0.7665477, -0.1833217, 3.500229, 0.6196079, 0, 1, 1,
0.7673211, 1.174267, 1.769357, 0.627451, 0, 1, 1,
0.7713326, 0.1859406, 2.489855, 0.6313726, 0, 1, 1,
0.7736497, 1.482442, -0.03772191, 0.6392157, 0, 1, 1,
0.7781954, -0.09410347, 2.496556, 0.6431373, 0, 1, 1,
0.7819139, 0.2796676, 1.404208, 0.6509804, 0, 1, 1,
0.7826118, -1.875117, 5.048411, 0.654902, 0, 1, 1,
0.7939383, 0.03446801, 0.2648975, 0.6627451, 0, 1, 1,
0.7947293, -1.013358, 2.30408, 0.6666667, 0, 1, 1,
0.7996927, 0.6408942, 1.824733, 0.6745098, 0, 1, 1,
0.8003049, 1.239537, 1.636456, 0.6784314, 0, 1, 1,
0.8045846, -0.1080189, 2.7759, 0.6862745, 0, 1, 1,
0.8057601, -0.2134593, -0.01642368, 0.6901961, 0, 1, 1,
0.8075222, 0.2674393, 3.644157, 0.6980392, 0, 1, 1,
0.8124613, -0.3408447, 2.70242, 0.7058824, 0, 1, 1,
0.8226459, -1.358419, 3.353958, 0.7098039, 0, 1, 1,
0.8237428, -0.0887135, 2.382938, 0.7176471, 0, 1, 1,
0.8249956, -0.3722252, 1.925866, 0.7215686, 0, 1, 1,
0.8253569, -0.189856, 2.227723, 0.7294118, 0, 1, 1,
0.830912, 0.5155708, 0.8195013, 0.7333333, 0, 1, 1,
0.8311874, -0.1591599, 2.397321, 0.7411765, 0, 1, 1,
0.8318732, 1.36164, -0.514694, 0.7450981, 0, 1, 1,
0.8335608, -0.9299659, 2.293428, 0.7529412, 0, 1, 1,
0.8349258, 0.4527679, 2.035918, 0.7568628, 0, 1, 1,
0.8383915, 0.06268974, 2.291715, 0.7647059, 0, 1, 1,
0.8385769, 0.4346855, 1.489801, 0.7686275, 0, 1, 1,
0.8452543, -0.5761217, 2.049928, 0.7764706, 0, 1, 1,
0.8580958, 0.6251299, 1.254208, 0.7803922, 0, 1, 1,
0.8586692, 0.2594936, 0.7406145, 0.7882353, 0, 1, 1,
0.8598269, -0.1294661, 3.661807, 0.7921569, 0, 1, 1,
0.8612787, -0.3148702, 0.8235672, 0.8, 0, 1, 1,
0.8650792, 0.4159508, -0.3642576, 0.8078431, 0, 1, 1,
0.8706263, 0.5049827, -0.9410694, 0.8117647, 0, 1, 1,
0.8736704, 1.595257, 0.5094544, 0.8196079, 0, 1, 1,
0.8833697, -1.379957, 2.21789, 0.8235294, 0, 1, 1,
0.8908575, -0.4744572, 2.342268, 0.8313726, 0, 1, 1,
0.8916194, 0.5984248, 2.86454, 0.8352941, 0, 1, 1,
0.8986899, -0.2316234, 1.004187, 0.8431373, 0, 1, 1,
0.8996781, -0.2674674, 1.351554, 0.8470588, 0, 1, 1,
0.9006379, -2.004888, 3.191676, 0.854902, 0, 1, 1,
0.9040346, -1.325889, 2.8163, 0.8588235, 0, 1, 1,
0.9055339, -1.537808, 0.981573, 0.8666667, 0, 1, 1,
0.9171522, 0.8004367, 1.795361, 0.8705882, 0, 1, 1,
0.9194198, 0.08866134, 1.525516, 0.8784314, 0, 1, 1,
0.9218558, -0.1834177, 2.615342, 0.8823529, 0, 1, 1,
0.9366689, -0.6657913, 3.308553, 0.8901961, 0, 1, 1,
0.9369245, -0.453549, 2.101818, 0.8941177, 0, 1, 1,
0.9408302, -0.2880222, 2.121417, 0.9019608, 0, 1, 1,
0.9429654, 1.449791, -0.04906974, 0.9098039, 0, 1, 1,
0.9435335, 0.388849, -0.4394827, 0.9137255, 0, 1, 1,
0.944054, -0.1089944, 2.327654, 0.9215686, 0, 1, 1,
0.947269, 0.777088, 1.008181, 0.9254902, 0, 1, 1,
0.9575473, 0.7013071, 0.1061636, 0.9333333, 0, 1, 1,
0.9646171, -2.055729, 3.040683, 0.9372549, 0, 1, 1,
0.9681512, -0.6697998, 2.767987, 0.945098, 0, 1, 1,
0.9691743, -0.0948831, 3.801975, 0.9490196, 0, 1, 1,
0.970018, 0.1720479, 1.982341, 0.9568627, 0, 1, 1,
0.9704069, -0.2006501, 1.606523, 0.9607843, 0, 1, 1,
0.9923306, 0.6058359, 2.213703, 0.9686275, 0, 1, 1,
1.001716, 0.2430075, 0.05756829, 0.972549, 0, 1, 1,
1.009521, 0.5929915, -0.3875461, 0.9803922, 0, 1, 1,
1.011216, 1.056598, 0.4794956, 0.9843137, 0, 1, 1,
1.011514, -1.367694, 0.6678509, 0.9921569, 0, 1, 1,
1.017344, -0.5727761, 1.603942, 0.9960784, 0, 1, 1,
1.020774, 1.220694, -1.054304, 1, 0, 0.9960784, 1,
1.033759, -0.9593962, 2.713825, 1, 0, 0.9882353, 1,
1.041756, 0.214265, -0.4922837, 1, 0, 0.9843137, 1,
1.043163, -0.7988186, 2.348079, 1, 0, 0.9764706, 1,
1.046341, -0.5306885, 1.674978, 1, 0, 0.972549, 1,
1.046433, -1.444236, 1.50863, 1, 0, 0.9647059, 1,
1.054429, -0.05660066, 2.079886, 1, 0, 0.9607843, 1,
1.05445, -1.011533, 1.750319, 1, 0, 0.9529412, 1,
1.05948, 1.388541, 1.386836, 1, 0, 0.9490196, 1,
1.083815, 0.5594954, 0.6514666, 1, 0, 0.9411765, 1,
1.093196, 1.435187, 1.861509, 1, 0, 0.9372549, 1,
1.0994, -1.711885, 2.273857, 1, 0, 0.9294118, 1,
1.100828, -1.384082, 2.597589, 1, 0, 0.9254902, 1,
1.100854, -1.010339, 3.340745, 1, 0, 0.9176471, 1,
1.108392, -0.7176887, 0.3064575, 1, 0, 0.9137255, 1,
1.11207, -2.447911, 2.510922, 1, 0, 0.9058824, 1,
1.114495, 1.911063, -0.3690432, 1, 0, 0.9019608, 1,
1.118926, -0.1715651, 2.006933, 1, 0, 0.8941177, 1,
1.123097, 0.1350316, 0.771896, 1, 0, 0.8862745, 1,
1.124314, -2.395816, 2.994987, 1, 0, 0.8823529, 1,
1.126522, 0.30884, 1.873822, 1, 0, 0.8745098, 1,
1.126528, 0.07586304, 2.740861, 1, 0, 0.8705882, 1,
1.133213, -0.5023901, 0.8785886, 1, 0, 0.8627451, 1,
1.136804, 1.196865, 1.231821, 1, 0, 0.8588235, 1,
1.137926, 0.1811768, 1.715522, 1, 0, 0.8509804, 1,
1.148277, 0.7730874, 0.08231443, 1, 0, 0.8470588, 1,
1.149143, -0.8254796, 3.241756, 1, 0, 0.8392157, 1,
1.155575, -0.6730139, 2.681978, 1, 0, 0.8352941, 1,
1.156107, -0.1144911, 0.6122844, 1, 0, 0.827451, 1,
1.157526, -0.1068838, 2.576012, 1, 0, 0.8235294, 1,
1.163758, 2.510377, 1.89561, 1, 0, 0.8156863, 1,
1.165046, -0.42939, 2.289135, 1, 0, 0.8117647, 1,
1.168127, -1.19604, 0.9466605, 1, 0, 0.8039216, 1,
1.173529, 0.2971032, 0.321861, 1, 0, 0.7960784, 1,
1.176116, 0.07971082, 3.135092, 1, 0, 0.7921569, 1,
1.176208, -0.3652137, 1.27317, 1, 0, 0.7843137, 1,
1.179009, -0.1132164, 3.181241, 1, 0, 0.7803922, 1,
1.179926, 0.642374, 0.891083, 1, 0, 0.772549, 1,
1.184038, -1.970512, 4.697898, 1, 0, 0.7686275, 1,
1.184142, -0.3747416, 2.291833, 1, 0, 0.7607843, 1,
1.184676, 1.424648, 1.340868, 1, 0, 0.7568628, 1,
1.192424, -0.6862769, 4.135991, 1, 0, 0.7490196, 1,
1.198918, -1.095195, 1.672152, 1, 0, 0.7450981, 1,
1.210534, 1.420925, 1.1271, 1, 0, 0.7372549, 1,
1.214352, 0.3327275, 1.600523, 1, 0, 0.7333333, 1,
1.227149, -1.957641, -1.130153, 1, 0, 0.7254902, 1,
1.228162, -0.4864753, 1.701402, 1, 0, 0.7215686, 1,
1.229915, -1.942482, 3.828629, 1, 0, 0.7137255, 1,
1.233809, -0.2968274, 1.04287, 1, 0, 0.7098039, 1,
1.234704, 0.6513271, 1.635421, 1, 0, 0.7019608, 1,
1.245325, -0.1043186, 1.46859, 1, 0, 0.6941177, 1,
1.245928, -0.01315922, 3.945937, 1, 0, 0.6901961, 1,
1.252628, 0.959941, 3.831874, 1, 0, 0.682353, 1,
1.272607, 0.6704219, 0.5320782, 1, 0, 0.6784314, 1,
1.274748, 1.135442, 1.366912, 1, 0, 0.6705883, 1,
1.275171, 0.4297807, 0.9128531, 1, 0, 0.6666667, 1,
1.285698, 0.9491226, 1.837558, 1, 0, 0.6588235, 1,
1.288887, 0.1950863, 1.677686, 1, 0, 0.654902, 1,
1.291801, 0.07541982, 0.5079188, 1, 0, 0.6470588, 1,
1.292875, 1.238734, 0.6761773, 1, 0, 0.6431373, 1,
1.295347, -1.04941, 1.701505, 1, 0, 0.6352941, 1,
1.297155, -0.0844926, 1.930383, 1, 0, 0.6313726, 1,
1.297547, -1.777031, 1.157414, 1, 0, 0.6235294, 1,
1.299971, 1.014397, -0.639047, 1, 0, 0.6196079, 1,
1.303064, 0.7432593, 0.9839243, 1, 0, 0.6117647, 1,
1.303877, 0.2410576, 1.279377, 1, 0, 0.6078432, 1,
1.303936, -0.9915099, 3.477651, 1, 0, 0.6, 1,
1.326747, -1.085869, 1.096164, 1, 0, 0.5921569, 1,
1.330427, 0.08982593, 2.909751, 1, 0, 0.5882353, 1,
1.404802, 0.428848, 2.82591, 1, 0, 0.5803922, 1,
1.406691, -0.8088307, 2.065327, 1, 0, 0.5764706, 1,
1.409827, -1.470996, 0.7408829, 1, 0, 0.5686275, 1,
1.412541, 0.987332, 2.627255, 1, 0, 0.5647059, 1,
1.414501, -0.2609275, 3.026627, 1, 0, 0.5568628, 1,
1.419279, -0.2007803, 4.298699, 1, 0, 0.5529412, 1,
1.419563, -0.5777471, 0.5352938, 1, 0, 0.5450981, 1,
1.424243, -1.72869, 3.532592, 1, 0, 0.5411765, 1,
1.429577, -1.25171, 0.4445802, 1, 0, 0.5333334, 1,
1.429724, 0.7897053, 1.438241, 1, 0, 0.5294118, 1,
1.434497, -0.9876417, 1.659901, 1, 0, 0.5215687, 1,
1.437743, -0.8081306, 2.59322, 1, 0, 0.5176471, 1,
1.44719, 0.1345793, 3.102373, 1, 0, 0.509804, 1,
1.455033, 1.353913, 0.8304986, 1, 0, 0.5058824, 1,
1.457155, 1.254676, 0.04351208, 1, 0, 0.4980392, 1,
1.462824, 0.1495871, -0.5914288, 1, 0, 0.4901961, 1,
1.475969, 0.1033627, 1.971637, 1, 0, 0.4862745, 1,
1.479999, -2.459524, 2.051496, 1, 0, 0.4784314, 1,
1.488899, -1.481707, 1.422777, 1, 0, 0.4745098, 1,
1.49245, 0.3426161, -0.5688704, 1, 0, 0.4666667, 1,
1.506226, -0.76492, 3.327573, 1, 0, 0.4627451, 1,
1.50824, 0.6991028, 3.497087, 1, 0, 0.454902, 1,
1.527513, -1.079682, 1.049075, 1, 0, 0.4509804, 1,
1.54285, 0.7561633, 0.6871223, 1, 0, 0.4431373, 1,
1.544345, 1.8572, 1.070071, 1, 0, 0.4392157, 1,
1.574034, -0.7684702, 1.021012, 1, 0, 0.4313726, 1,
1.586424, -0.3531191, 2.031744, 1, 0, 0.427451, 1,
1.591668, 0.1820279, 2.130178, 1, 0, 0.4196078, 1,
1.612121, 0.1949256, 1.770751, 1, 0, 0.4156863, 1,
1.626757, 0.2197207, 2.437595, 1, 0, 0.4078431, 1,
1.631778, 0.7061792, 0.1162402, 1, 0, 0.4039216, 1,
1.633281, -0.1378769, 1.855748, 1, 0, 0.3960784, 1,
1.638622, -0.5094439, 3.659075, 1, 0, 0.3882353, 1,
1.641748, 0.3351271, -0.1637094, 1, 0, 0.3843137, 1,
1.651352, -0.6540759, 3.368119, 1, 0, 0.3764706, 1,
1.664783, 0.3100666, 0.8252187, 1, 0, 0.372549, 1,
1.679831, 1.988291, 2.040164, 1, 0, 0.3647059, 1,
1.691171, 0.6313862, 1.972461, 1, 0, 0.3607843, 1,
1.691929, -0.03639194, 1.794352, 1, 0, 0.3529412, 1,
1.703042, -0.0437484, 0.9630892, 1, 0, 0.3490196, 1,
1.704891, 1.658276, 1.029072, 1, 0, 0.3411765, 1,
1.714966, -1.461874, 2.985169, 1, 0, 0.3372549, 1,
1.722675, -0.7268108, 1.80239, 1, 0, 0.3294118, 1,
1.723878, 0.1181264, 3.282392, 1, 0, 0.3254902, 1,
1.736452, -2.058755, 2.512033, 1, 0, 0.3176471, 1,
1.741756, -0.709309, 1.927738, 1, 0, 0.3137255, 1,
1.751711, -0.6826354, 2.072723, 1, 0, 0.3058824, 1,
1.758843, 1.150286, 2.380068, 1, 0, 0.2980392, 1,
1.765138, 0.508059, 0.01226629, 1, 0, 0.2941177, 1,
1.765877, 0.438897, 0.1094483, 1, 0, 0.2862745, 1,
1.77127, -0.07800178, 2.033768, 1, 0, 0.282353, 1,
1.795791, 1.85853, 1.845282, 1, 0, 0.2745098, 1,
1.80806, 2.259158, 2.219021, 1, 0, 0.2705882, 1,
1.819893, -1.617193, 2.228232, 1, 0, 0.2627451, 1,
1.824542, 0.2743688, 2.776383, 1, 0, 0.2588235, 1,
1.855161, -0.572323, 3.169488, 1, 0, 0.2509804, 1,
1.874343, -0.4923166, 2.655135, 1, 0, 0.2470588, 1,
1.880804, -0.6990361, 1.693067, 1, 0, 0.2392157, 1,
1.881071, -0.9386644, 3.496125, 1, 0, 0.2352941, 1,
1.886874, -1.134176, 2.119124, 1, 0, 0.227451, 1,
1.888922, -0.4850017, 1.959707, 1, 0, 0.2235294, 1,
1.897205, -0.5092, 2.026964, 1, 0, 0.2156863, 1,
1.89979, 1.351443, 2.499895, 1, 0, 0.2117647, 1,
1.921982, 0.8297132, 2.514054, 1, 0, 0.2039216, 1,
1.9233, -0.3580989, 0.7781697, 1, 0, 0.1960784, 1,
1.932821, 2.471565, 1.520493, 1, 0, 0.1921569, 1,
1.936958, 1.833206, 1.041233, 1, 0, 0.1843137, 1,
1.947144, -0.008986271, 2.491946, 1, 0, 0.1803922, 1,
1.955665, 1.675942, 0.7554297, 1, 0, 0.172549, 1,
1.958347, 1.18687, 0.2304852, 1, 0, 0.1686275, 1,
1.95865, -0.9440857, 1.337469, 1, 0, 0.1607843, 1,
1.966328, -0.2528311, 1.979632, 1, 0, 0.1568628, 1,
2.007871, 0.8255898, 0.4386415, 1, 0, 0.1490196, 1,
2.0142, 0.01923459, 0.5962483, 1, 0, 0.145098, 1,
2.057538, -1.059359, 3.540065, 1, 0, 0.1372549, 1,
2.072643, -1.186399, 1.1744, 1, 0, 0.1333333, 1,
2.075238, 0.7933012, 0.5539793, 1, 0, 0.1254902, 1,
2.102494, -0.3799711, 2.049325, 1, 0, 0.1215686, 1,
2.182809, -2.31678, 1.316321, 1, 0, 0.1137255, 1,
2.240081, -0.9241566, 1.179652, 1, 0, 0.1098039, 1,
2.272676, -1.708961, 3.581805, 1, 0, 0.1019608, 1,
2.274734, -0.5923052, 2.370471, 1, 0, 0.09411765, 1,
2.292078, 0.8075739, 0.7399399, 1, 0, 0.09019608, 1,
2.310365, -0.9737468, 2.368026, 1, 0, 0.08235294, 1,
2.316909, -1.277588, 2.000806, 1, 0, 0.07843138, 1,
2.327074, -0.7039533, 1.977686, 1, 0, 0.07058824, 1,
2.373334, -0.05033657, 2.573979, 1, 0, 0.06666667, 1,
2.434886, -0.7213715, 1.52145, 1, 0, 0.05882353, 1,
2.446036, -0.6758422, 1.08755, 1, 0, 0.05490196, 1,
2.470546, 0.8863487, 0.7193453, 1, 0, 0.04705882, 1,
2.476061, -0.4094268, 2.609039, 1, 0, 0.04313726, 1,
2.521158, 0.8767126, 0.2232026, 1, 0, 0.03529412, 1,
2.538561, -0.576318, 1.706922, 1, 0, 0.03137255, 1,
2.603215, -0.894975, -1.318604, 1, 0, 0.02352941, 1,
2.978189, 0.2117363, 1.627316, 1, 0, 0.01960784, 1,
3.014209, 0.6864954, -0.1822271, 1, 0, 0.01176471, 1,
3.085697, -1.082792, 1.631613, 1, 0, 0.007843138, 1
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
0.1241188, -4.358058, -8.422475, 0, -0.5, 0.5, 0.5,
0.1241188, -4.358058, -8.422475, 1, -0.5, 0.5, 0.5,
0.1241188, -4.358058, -8.422475, 1, 1.5, 0.5, 0.5,
0.1241188, -4.358058, -8.422475, 0, 1.5, 0.5, 0.5
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
-3.841435, -0.3029324, -8.422475, 0, -0.5, 0.5, 0.5,
-3.841435, -0.3029324, -8.422475, 1, -0.5, 0.5, 0.5,
-3.841435, -0.3029324, -8.422475, 1, 1.5, 0.5, 0.5,
-3.841435, -0.3029324, -8.422475, 0, 1.5, 0.5, 0.5
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
-3.841435, -4.358058, -0.5185354, 0, -0.5, 0.5, 0.5,
-3.841435, -4.358058, -0.5185354, 1, -0.5, 0.5, 0.5,
-3.841435, -4.358058, -0.5185354, 1, 1.5, 0.5, 0.5,
-3.841435, -4.358058, -0.5185354, 0, 1.5, 0.5, 0.5
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
-2, -3.42226, -6.598489,
3, -3.42226, -6.598489,
-2, -3.42226, -6.598489,
-2, -3.578226, -6.902487,
-1, -3.42226, -6.598489,
-1, -3.578226, -6.902487,
0, -3.42226, -6.598489,
0, -3.578226, -6.902487,
1, -3.42226, -6.598489,
1, -3.578226, -6.902487,
2, -3.42226, -6.598489,
2, -3.578226, -6.902487,
3, -3.42226, -6.598489,
3, -3.578226, -6.902487
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
-2, -3.890159, -7.510482, 0, -0.5, 0.5, 0.5,
-2, -3.890159, -7.510482, 1, -0.5, 0.5, 0.5,
-2, -3.890159, -7.510482, 1, 1.5, 0.5, 0.5,
-2, -3.890159, -7.510482, 0, 1.5, 0.5, 0.5,
-1, -3.890159, -7.510482, 0, -0.5, 0.5, 0.5,
-1, -3.890159, -7.510482, 1, -0.5, 0.5, 0.5,
-1, -3.890159, -7.510482, 1, 1.5, 0.5, 0.5,
-1, -3.890159, -7.510482, 0, 1.5, 0.5, 0.5,
0, -3.890159, -7.510482, 0, -0.5, 0.5, 0.5,
0, -3.890159, -7.510482, 1, -0.5, 0.5, 0.5,
0, -3.890159, -7.510482, 1, 1.5, 0.5, 0.5,
0, -3.890159, -7.510482, 0, 1.5, 0.5, 0.5,
1, -3.890159, -7.510482, 0, -0.5, 0.5, 0.5,
1, -3.890159, -7.510482, 1, -0.5, 0.5, 0.5,
1, -3.890159, -7.510482, 1, 1.5, 0.5, 0.5,
1, -3.890159, -7.510482, 0, 1.5, 0.5, 0.5,
2, -3.890159, -7.510482, 0, -0.5, 0.5, 0.5,
2, -3.890159, -7.510482, 1, -0.5, 0.5, 0.5,
2, -3.890159, -7.510482, 1, 1.5, 0.5, 0.5,
2, -3.890159, -7.510482, 0, 1.5, 0.5, 0.5,
3, -3.890159, -7.510482, 0, -0.5, 0.5, 0.5,
3, -3.890159, -7.510482, 1, -0.5, 0.5, 0.5,
3, -3.890159, -7.510482, 1, 1.5, 0.5, 0.5,
3, -3.890159, -7.510482, 0, 1.5, 0.5, 0.5
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
-2.926307, -3, -6.598489,
-2.926307, 2, -6.598489,
-2.926307, -3, -6.598489,
-3.078828, -3, -6.902487,
-2.926307, -2, -6.598489,
-3.078828, -2, -6.902487,
-2.926307, -1, -6.598489,
-3.078828, -1, -6.902487,
-2.926307, 0, -6.598489,
-3.078828, 0, -6.902487,
-2.926307, 1, -6.598489,
-3.078828, 1, -6.902487,
-2.926307, 2, -6.598489,
-3.078828, 2, -6.902487
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
-3.383871, -3, -7.510482, 0, -0.5, 0.5, 0.5,
-3.383871, -3, -7.510482, 1, -0.5, 0.5, 0.5,
-3.383871, -3, -7.510482, 1, 1.5, 0.5, 0.5,
-3.383871, -3, -7.510482, 0, 1.5, 0.5, 0.5,
-3.383871, -2, -7.510482, 0, -0.5, 0.5, 0.5,
-3.383871, -2, -7.510482, 1, -0.5, 0.5, 0.5,
-3.383871, -2, -7.510482, 1, 1.5, 0.5, 0.5,
-3.383871, -2, -7.510482, 0, 1.5, 0.5, 0.5,
-3.383871, -1, -7.510482, 0, -0.5, 0.5, 0.5,
-3.383871, -1, -7.510482, 1, -0.5, 0.5, 0.5,
-3.383871, -1, -7.510482, 1, 1.5, 0.5, 0.5,
-3.383871, -1, -7.510482, 0, 1.5, 0.5, 0.5,
-3.383871, 0, -7.510482, 0, -0.5, 0.5, 0.5,
-3.383871, 0, -7.510482, 1, -0.5, 0.5, 0.5,
-3.383871, 0, -7.510482, 1, 1.5, 0.5, 0.5,
-3.383871, 0, -7.510482, 0, 1.5, 0.5, 0.5,
-3.383871, 1, -7.510482, 0, -0.5, 0.5, 0.5,
-3.383871, 1, -7.510482, 1, -0.5, 0.5, 0.5,
-3.383871, 1, -7.510482, 1, 1.5, 0.5, 0.5,
-3.383871, 1, -7.510482, 0, 1.5, 0.5, 0.5,
-3.383871, 2, -7.510482, 0, -0.5, 0.5, 0.5,
-3.383871, 2, -7.510482, 1, -0.5, 0.5, 0.5,
-3.383871, 2, -7.510482, 1, 1.5, 0.5, 0.5,
-3.383871, 2, -7.510482, 0, 1.5, 0.5, 0.5
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
-2.926307, -3.42226, -6,
-2.926307, -3.42226, 4,
-2.926307, -3.42226, -6,
-3.078828, -3.578226, -6,
-2.926307, -3.42226, -4,
-3.078828, -3.578226, -4,
-2.926307, -3.42226, -2,
-3.078828, -3.578226, -2,
-2.926307, -3.42226, 0,
-3.078828, -3.578226, 0,
-2.926307, -3.42226, 2,
-3.078828, -3.578226, 2,
-2.926307, -3.42226, 4,
-3.078828, -3.578226, 4
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
"-6",
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
-3.383871, -3.890159, -6, 0, -0.5, 0.5, 0.5,
-3.383871, -3.890159, -6, 1, -0.5, 0.5, 0.5,
-3.383871, -3.890159, -6, 1, 1.5, 0.5, 0.5,
-3.383871, -3.890159, -6, 0, 1.5, 0.5, 0.5,
-3.383871, -3.890159, -4, 0, -0.5, 0.5, 0.5,
-3.383871, -3.890159, -4, 1, -0.5, 0.5, 0.5,
-3.383871, -3.890159, -4, 1, 1.5, 0.5, 0.5,
-3.383871, -3.890159, -4, 0, 1.5, 0.5, 0.5,
-3.383871, -3.890159, -2, 0, -0.5, 0.5, 0.5,
-3.383871, -3.890159, -2, 1, -0.5, 0.5, 0.5,
-3.383871, -3.890159, -2, 1, 1.5, 0.5, 0.5,
-3.383871, -3.890159, -2, 0, 1.5, 0.5, 0.5,
-3.383871, -3.890159, 0, 0, -0.5, 0.5, 0.5,
-3.383871, -3.890159, 0, 1, -0.5, 0.5, 0.5,
-3.383871, -3.890159, 0, 1, 1.5, 0.5, 0.5,
-3.383871, -3.890159, 0, 0, 1.5, 0.5, 0.5,
-3.383871, -3.890159, 2, 0, -0.5, 0.5, 0.5,
-3.383871, -3.890159, 2, 1, -0.5, 0.5, 0.5,
-3.383871, -3.890159, 2, 1, 1.5, 0.5, 0.5,
-3.383871, -3.890159, 2, 0, 1.5, 0.5, 0.5,
-3.383871, -3.890159, 4, 0, -0.5, 0.5, 0.5,
-3.383871, -3.890159, 4, 1, -0.5, 0.5, 0.5,
-3.383871, -3.890159, 4, 1, 1.5, 0.5, 0.5,
-3.383871, -3.890159, 4, 0, 1.5, 0.5, 0.5
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
-2.926307, -3.42226, -6.598489,
-2.926307, 2.816395, -6.598489,
-2.926307, -3.42226, 5.561418,
-2.926307, 2.816395, 5.561418,
-2.926307, -3.42226, -6.598489,
-2.926307, -3.42226, 5.561418,
-2.926307, 2.816395, -6.598489,
-2.926307, 2.816395, 5.561418,
-2.926307, -3.42226, -6.598489,
3.174545, -3.42226, -6.598489,
-2.926307, -3.42226, 5.561418,
3.174545, -3.42226, 5.561418,
-2.926307, 2.816395, -6.598489,
3.174545, 2.816395, -6.598489,
-2.926307, 2.816395, 5.561418,
3.174545, 2.816395, 5.561418,
3.174545, -3.42226, -6.598489,
3.174545, 2.816395, -6.598489,
3.174545, -3.42226, 5.561418,
3.174545, 2.816395, 5.561418,
3.174545, -3.42226, -6.598489,
3.174545, -3.42226, 5.561418,
3.174545, 2.816395, -6.598489,
3.174545, 2.816395, 5.561418
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
var radius = 7.991971;
var distance = 35.55718;
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
mvMatrix.translate( -0.1241188, 0.3029324, 0.5185354 );
mvMatrix.scale( 1.416372, 1.385086, 0.7106202 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.55718);
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


