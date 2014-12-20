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
-3.591152, -0.1374077, -2.879288, 1, 0, 0, 1,
-3.217492, 0.123579, -2.292818, 1, 0.007843138, 0, 1,
-2.980386, -0.06087292, -0.8479506, 1, 0.01176471, 0, 1,
-2.900608, 0.3342929, -0.7935146, 1, 0.01960784, 0, 1,
-2.62347, -1.390639, -0.2639303, 1, 0.02352941, 0, 1,
-2.550155, 1.351558, 0.2817065, 1, 0.03137255, 0, 1,
-2.536912, 0.8876388, -2.133889, 1, 0.03529412, 0, 1,
-2.534231, 0.985373, -0.8901315, 1, 0.04313726, 0, 1,
-2.468996, 0.8980435, -0.6564888, 1, 0.04705882, 0, 1,
-2.45274, -0.4323733, -0.618031, 1, 0.05490196, 0, 1,
-2.439913, 0.4028521, -1.950162, 1, 0.05882353, 0, 1,
-2.431817, 0.02789031, -2.022431, 1, 0.06666667, 0, 1,
-2.422747, 0.5103946, -1.657697, 1, 0.07058824, 0, 1,
-2.411939, 1.398954, -0.1218883, 1, 0.07843138, 0, 1,
-2.387617, 0.9888909, -0.8901941, 1, 0.08235294, 0, 1,
-2.375135, -1.316057, -3.022068, 1, 0.09019608, 0, 1,
-2.354943, 1.340375, -1.497231, 1, 0.09411765, 0, 1,
-2.341198, -0.813405, -2.306569, 1, 0.1019608, 0, 1,
-2.338963, -0.07280571, -2.976645, 1, 0.1098039, 0, 1,
-2.33678, 2.099288, -1.888514, 1, 0.1137255, 0, 1,
-2.324316, 0.4596471, 0.7819757, 1, 0.1215686, 0, 1,
-2.258028, -0.5037342, -1.973907, 1, 0.1254902, 0, 1,
-2.232285, 0.5727377, -0.5222796, 1, 0.1333333, 0, 1,
-2.205155, -0.212066, -2.711398, 1, 0.1372549, 0, 1,
-2.163608, -1.131206, -0.6870165, 1, 0.145098, 0, 1,
-2.153111, 1.006763, -1.030112, 1, 0.1490196, 0, 1,
-2.146919, 1.389957, -0.3801335, 1, 0.1568628, 0, 1,
-2.096848, -0.4086325, -1.137551, 1, 0.1607843, 0, 1,
-2.089865, -0.2599877, -0.3888203, 1, 0.1686275, 0, 1,
-2.014911, -0.2305757, -1.63257, 1, 0.172549, 0, 1,
-2.010618, 1.747357, -0.5355093, 1, 0.1803922, 0, 1,
-2.006267, 1.511623, -2.650755, 1, 0.1843137, 0, 1,
-1.962672, 0.607537, -1.070551, 1, 0.1921569, 0, 1,
-1.916294, -1.815181, -2.713853, 1, 0.1960784, 0, 1,
-1.903236, -0.005375136, -1.932662, 1, 0.2039216, 0, 1,
-1.879341, -1.552434, -5.077965, 1, 0.2117647, 0, 1,
-1.878061, 1.857579, -0.8170807, 1, 0.2156863, 0, 1,
-1.864698, 1.296142, -3.508357, 1, 0.2235294, 0, 1,
-1.85316, 0.5795325, -3.738881, 1, 0.227451, 0, 1,
-1.829455, -0.9975675, 0.0106439, 1, 0.2352941, 0, 1,
-1.824013, -0.9371578, -2.095956, 1, 0.2392157, 0, 1,
-1.80317, 1.872322, 0.3466355, 1, 0.2470588, 0, 1,
-1.756943, 0.1011596, -0.8934669, 1, 0.2509804, 0, 1,
-1.753174, 0.5146706, -1.008479, 1, 0.2588235, 0, 1,
-1.739213, 0.788242, -1.29739, 1, 0.2627451, 0, 1,
-1.733406, -0.0622163, -2.615202, 1, 0.2705882, 0, 1,
-1.679853, 1.945505, -1.822893, 1, 0.2745098, 0, 1,
-1.674489, -0.2171234, -2.203743, 1, 0.282353, 0, 1,
-1.667595, 1.552893, -2.001827, 1, 0.2862745, 0, 1,
-1.65419, -0.5470234, -0.3135125, 1, 0.2941177, 0, 1,
-1.637847, -0.765008, -2.678067, 1, 0.3019608, 0, 1,
-1.628691, -0.4815597, -1.232045, 1, 0.3058824, 0, 1,
-1.613997, -0.8856807, -1.166128, 1, 0.3137255, 0, 1,
-1.586762, 1.830796, 0.1234943, 1, 0.3176471, 0, 1,
-1.577317, -2.283832, -0.3027084, 1, 0.3254902, 0, 1,
-1.570056, -0.6650071, -1.238164, 1, 0.3294118, 0, 1,
-1.566658, 1.064224, -0.7260941, 1, 0.3372549, 0, 1,
-1.562522, 0.7091333, -0.9807762, 1, 0.3411765, 0, 1,
-1.562315, 0.4675507, -2.631064, 1, 0.3490196, 0, 1,
-1.533839, 0.8499317, 0.9618285, 1, 0.3529412, 0, 1,
-1.529385, -0.1215097, -0.6192502, 1, 0.3607843, 0, 1,
-1.52835, -0.2383996, -1.611264, 1, 0.3647059, 0, 1,
-1.524263, 1.334164, -1.904966, 1, 0.372549, 0, 1,
-1.522873, -0.5688237, -1.871956, 1, 0.3764706, 0, 1,
-1.517104, 0.3603148, -0.5988204, 1, 0.3843137, 0, 1,
-1.516532, 1.040223, 0.3476979, 1, 0.3882353, 0, 1,
-1.509197, 0.7669131, -0.5152107, 1, 0.3960784, 0, 1,
-1.475164, -2.669132, -2.469762, 1, 0.4039216, 0, 1,
-1.451237, -1.769249, -2.700313, 1, 0.4078431, 0, 1,
-1.451193, -0.9061296, -3.915509, 1, 0.4156863, 0, 1,
-1.444052, -0.341547, -0.4693307, 1, 0.4196078, 0, 1,
-1.439663, 0.06740201, -2.562323, 1, 0.427451, 0, 1,
-1.432096, 0.4927597, -1.820502, 1, 0.4313726, 0, 1,
-1.425433, -0.5698944, -2.295807, 1, 0.4392157, 0, 1,
-1.419539, -1.493276, -2.644688, 1, 0.4431373, 0, 1,
-1.415747, 0.3172239, -1.156591, 1, 0.4509804, 0, 1,
-1.412717, -0.5106987, -1.996898, 1, 0.454902, 0, 1,
-1.406159, -0.4136918, -3.186388, 1, 0.4627451, 0, 1,
-1.404729, 1.415258, -0.2219803, 1, 0.4666667, 0, 1,
-1.394529, -0.05147504, -1.448771, 1, 0.4745098, 0, 1,
-1.38803, -0.9671866, -2.833643, 1, 0.4784314, 0, 1,
-1.384286, 0.4885679, -2.434013, 1, 0.4862745, 0, 1,
-1.370754, 1.367615, -2.410655, 1, 0.4901961, 0, 1,
-1.361139, 1.140874, -1.037158, 1, 0.4980392, 0, 1,
-1.35778, 0.467997, -0.3029094, 1, 0.5058824, 0, 1,
-1.354087, 1.110665, -0.2102441, 1, 0.509804, 0, 1,
-1.35392, 0.4334327, -2.254899, 1, 0.5176471, 0, 1,
-1.344101, -0.6433737, -3.950673, 1, 0.5215687, 0, 1,
-1.33122, 0.2070697, 0.05412969, 1, 0.5294118, 0, 1,
-1.331204, 0.9000174, -0.5476238, 1, 0.5333334, 0, 1,
-1.329014, 0.3705155, -1.493407, 1, 0.5411765, 0, 1,
-1.317868, 1.164366, -3.35242, 1, 0.5450981, 0, 1,
-1.311747, 0.3762075, -2.375387, 1, 0.5529412, 0, 1,
-1.309831, 0.2040173, 1.136029, 1, 0.5568628, 0, 1,
-1.30977, -0.2099227, -1.065771, 1, 0.5647059, 0, 1,
-1.303895, -2.431995, -1.959671, 1, 0.5686275, 0, 1,
-1.300832, -1.053963, -2.86042, 1, 0.5764706, 0, 1,
-1.298269, -1.40403, -2.779361, 1, 0.5803922, 0, 1,
-1.296688, 0.4981393, -2.898565, 1, 0.5882353, 0, 1,
-1.291147, -0.6466398, -2.756736, 1, 0.5921569, 0, 1,
-1.288853, 0.9297711, -0.1977127, 1, 0.6, 0, 1,
-1.272516, -0.8243429, -1.72387, 1, 0.6078432, 0, 1,
-1.267523, 0.603613, 0.3029738, 1, 0.6117647, 0, 1,
-1.261105, 1.044239, -1.386165, 1, 0.6196079, 0, 1,
-1.246441, 0.01587703, -1.030947, 1, 0.6235294, 0, 1,
-1.23197, -0.2281627, -0.1654731, 1, 0.6313726, 0, 1,
-1.225955, -0.4010639, -0.5804337, 1, 0.6352941, 0, 1,
-1.225506, 0.4382963, -1.290766, 1, 0.6431373, 0, 1,
-1.213362, 0.3997625, -1.33808, 1, 0.6470588, 0, 1,
-1.195019, -0.8331093, -2.46964, 1, 0.654902, 0, 1,
-1.194039, 1.189036, -1.121579, 1, 0.6588235, 0, 1,
-1.193458, 0.4390108, -0.2707096, 1, 0.6666667, 0, 1,
-1.188835, 0.3298672, -2.081369, 1, 0.6705883, 0, 1,
-1.185421, 1.080043, -0.9001244, 1, 0.6784314, 0, 1,
-1.185198, -0.2847816, -0.4643587, 1, 0.682353, 0, 1,
-1.181419, -0.3485855, -1.74469, 1, 0.6901961, 0, 1,
-1.16605, 0.2401765, -0.7753578, 1, 0.6941177, 0, 1,
-1.16145, -0.7746624, -2.051033, 1, 0.7019608, 0, 1,
-1.155593, -0.1601231, -2.165281, 1, 0.7098039, 0, 1,
-1.153465, -1.037246, -1.997929, 1, 0.7137255, 0, 1,
-1.150038, 0.495322, -1.55432, 1, 0.7215686, 0, 1,
-1.140454, 0.3916714, -1.58772, 1, 0.7254902, 0, 1,
-1.140123, -0.5551374, -1.703509, 1, 0.7333333, 0, 1,
-1.137439, -1.862075, -1.682023, 1, 0.7372549, 0, 1,
-1.135326, -0.6335052, -1.629892, 1, 0.7450981, 0, 1,
-1.129026, 0.3119552, 0.07954109, 1, 0.7490196, 0, 1,
-1.111028, -0.3156113, -0.8854627, 1, 0.7568628, 0, 1,
-1.1048, 1.081741, -1.612606, 1, 0.7607843, 0, 1,
-1.103292, 0.3023196, -0.335518, 1, 0.7686275, 0, 1,
-1.10247, 0.7861648, -0.1012943, 1, 0.772549, 0, 1,
-1.097981, -0.7982163, -1.004778, 1, 0.7803922, 0, 1,
-1.097494, 0.1013443, -1.308512, 1, 0.7843137, 0, 1,
-1.090346, 0.02291808, 0.3077375, 1, 0.7921569, 0, 1,
-1.090073, -1.039023, -2.440969, 1, 0.7960784, 0, 1,
-1.078697, -1.324557, -3.781523, 1, 0.8039216, 0, 1,
-1.07102, 0.8626565, -2.738861, 1, 0.8117647, 0, 1,
-1.062722, 0.2099193, -1.465821, 1, 0.8156863, 0, 1,
-1.062167, 1.302706, -2.891385, 1, 0.8235294, 0, 1,
-1.061787, -0.4042325, -1.556742, 1, 0.827451, 0, 1,
-1.056884, -1.464954, -3.498566, 1, 0.8352941, 0, 1,
-1.052439, 0.5172978, -1.215598, 1, 0.8392157, 0, 1,
-1.047516, -1.523905, -3.682906, 1, 0.8470588, 0, 1,
-1.044475, 1.571666, -1.063118, 1, 0.8509804, 0, 1,
-1.043893, -0.8034623, -1.881501, 1, 0.8588235, 0, 1,
-1.040717, 0.2158911, -2.254738, 1, 0.8627451, 0, 1,
-1.037867, -0.1856433, -1.078984, 1, 0.8705882, 0, 1,
-1.037263, -0.8750723, -1.626841, 1, 0.8745098, 0, 1,
-1.030711, -0.2383628, -3.536907, 1, 0.8823529, 0, 1,
-1.029464, 0.7371702, 1.038389, 1, 0.8862745, 0, 1,
-1.023688, -1.503968, -2.33891, 1, 0.8941177, 0, 1,
-1.021883, -1.00447, -2.426713, 1, 0.8980392, 0, 1,
-1.01845, 1.204232, -0.9185413, 1, 0.9058824, 0, 1,
-1.014416, 0.2814305, -1.288793, 1, 0.9137255, 0, 1,
-1.001916, -0.522573, -1.715974, 1, 0.9176471, 0, 1,
-0.9922344, -0.6961414, -1.872631, 1, 0.9254902, 0, 1,
-0.9833531, 0.5062873, -1.662395, 1, 0.9294118, 0, 1,
-0.9795067, 0.5661585, 0.4319422, 1, 0.9372549, 0, 1,
-0.9637989, -2.568257, -3.817853, 1, 0.9411765, 0, 1,
-0.954507, 0.1451305, -1.955512, 1, 0.9490196, 0, 1,
-0.9543172, 0.001712211, -1.121449, 1, 0.9529412, 0, 1,
-0.9482995, 0.5150574, -0.5858674, 1, 0.9607843, 0, 1,
-0.9473295, -0.3282833, -1.108895, 1, 0.9647059, 0, 1,
-0.9459532, 0.7484347, -2.656116, 1, 0.972549, 0, 1,
-0.945335, 0.4389743, 0.1594466, 1, 0.9764706, 0, 1,
-0.9448486, -0.4460957, -2.569691, 1, 0.9843137, 0, 1,
-0.9415673, 0.4729856, -1.379226, 1, 0.9882353, 0, 1,
-0.9411187, -2.24026, -4.317579, 1, 0.9960784, 0, 1,
-0.9394317, 1.119731, 0.7365112, 0.9960784, 1, 0, 1,
-0.9390317, -1.679741, -1.834454, 0.9921569, 1, 0, 1,
-0.9386114, 0.3889486, 0.1470352, 0.9843137, 1, 0, 1,
-0.937776, -0.2270151, -0.7332221, 0.9803922, 1, 0, 1,
-0.937488, -0.5972758, -3.210068, 0.972549, 1, 0, 1,
-0.9364742, 1.609985, -1.00031, 0.9686275, 1, 0, 1,
-0.9322276, -0.9358789, -1.884912, 0.9607843, 1, 0, 1,
-0.930831, -0.3952236, -1.606164, 0.9568627, 1, 0, 1,
-0.9270059, -0.9866226, -2.879767, 0.9490196, 1, 0, 1,
-0.9263071, 1.766814, -1.55161, 0.945098, 1, 0, 1,
-0.9215728, 0.3081193, 0.1552196, 0.9372549, 1, 0, 1,
-0.9193933, -0.2033215, -2.203062, 0.9333333, 1, 0, 1,
-0.9187248, 0.7520854, -0.8073839, 0.9254902, 1, 0, 1,
-0.9117968, 0.6647286, 1.355349, 0.9215686, 1, 0, 1,
-0.9113664, 1.202166, 0.04996138, 0.9137255, 1, 0, 1,
-0.8974714, -1.602121, -3.455563, 0.9098039, 1, 0, 1,
-0.8963453, 2.08112, 0.9369942, 0.9019608, 1, 0, 1,
-0.896163, 0.8075046, -0.9793994, 0.8941177, 1, 0, 1,
-0.8935509, -0.04100517, -0.3887975, 0.8901961, 1, 0, 1,
-0.8927009, -0.1874591, -1.813566, 0.8823529, 1, 0, 1,
-0.8905117, 0.136615, -1.884426, 0.8784314, 1, 0, 1,
-0.8903651, -0.446119, 0.1498686, 0.8705882, 1, 0, 1,
-0.8827761, -0.5201166, -2.136112, 0.8666667, 1, 0, 1,
-0.876417, -0.4044697, -2.53715, 0.8588235, 1, 0, 1,
-0.8682688, 1.10858, -1.311217, 0.854902, 1, 0, 1,
-0.8591076, -1.129428, -2.100663, 0.8470588, 1, 0, 1,
-0.8576792, 1.781033, 0.03362413, 0.8431373, 1, 0, 1,
-0.8574835, -0.4944742, -2.976564, 0.8352941, 1, 0, 1,
-0.853019, 0.1311888, -1.972466, 0.8313726, 1, 0, 1,
-0.8484553, 0.2066286, -4.475147, 0.8235294, 1, 0, 1,
-0.8413002, 0.4193995, -0.5903444, 0.8196079, 1, 0, 1,
-0.8403703, 1.026144, -0.04789892, 0.8117647, 1, 0, 1,
-0.8393216, -1.922419, -1.637194, 0.8078431, 1, 0, 1,
-0.8353519, -0.4413835, -3.477244, 0.8, 1, 0, 1,
-0.825561, 1.648085, -0.1782139, 0.7921569, 1, 0, 1,
-0.8251482, 0.509921, -1.764682, 0.7882353, 1, 0, 1,
-0.8191361, -0.09598705, -1.537623, 0.7803922, 1, 0, 1,
-0.8147113, -1.496581, -4.09931, 0.7764706, 1, 0, 1,
-0.8116544, -0.3691684, -2.187368, 0.7686275, 1, 0, 1,
-0.8115679, 0.8083666, -0.8253706, 0.7647059, 1, 0, 1,
-0.8111697, 0.5183219, 0.4497442, 0.7568628, 1, 0, 1,
-0.8098971, 0.5650696, -1.529829, 0.7529412, 1, 0, 1,
-0.8082105, 1.892046, -0.1482913, 0.7450981, 1, 0, 1,
-0.8079432, 0.7808189, -1.283078, 0.7411765, 1, 0, 1,
-0.8025876, -0.1833091, -1.374761, 0.7333333, 1, 0, 1,
-0.7886894, 1.356983, 0.7536616, 0.7294118, 1, 0, 1,
-0.7772637, 0.5636531, 0.3750286, 0.7215686, 1, 0, 1,
-0.7756286, 0.2783032, -2.103626, 0.7176471, 1, 0, 1,
-0.7705451, 0.4717225, 0.3437749, 0.7098039, 1, 0, 1,
-0.7702536, 2.28031, -0.1345101, 0.7058824, 1, 0, 1,
-0.7695372, 0.3093626, -1.410125, 0.6980392, 1, 0, 1,
-0.766033, -1.246033, -2.665066, 0.6901961, 1, 0, 1,
-0.7635213, 0.5331256, -1.626038, 0.6862745, 1, 0, 1,
-0.7612414, 1.754284, 0.8241647, 0.6784314, 1, 0, 1,
-0.7601857, -0.6145015, -2.952496, 0.6745098, 1, 0, 1,
-0.7562681, -1.125765, -4.545031, 0.6666667, 1, 0, 1,
-0.7538526, 0.283811, 0.2302358, 0.6627451, 1, 0, 1,
-0.7509402, 1.554994, 0.2963127, 0.654902, 1, 0, 1,
-0.7478403, 0.8407885, -2.470582, 0.6509804, 1, 0, 1,
-0.7477955, 1.13083, -1.088318, 0.6431373, 1, 0, 1,
-0.746235, 0.1658908, -0.8909084, 0.6392157, 1, 0, 1,
-0.7446895, 0.4181403, 0.4137911, 0.6313726, 1, 0, 1,
-0.7427265, 0.999899, -0.3586586, 0.627451, 1, 0, 1,
-0.7417784, 0.796607, -0.8159419, 0.6196079, 1, 0, 1,
-0.740949, 0.5323259, -1.860999, 0.6156863, 1, 0, 1,
-0.7375578, -0.5581053, -2.612239, 0.6078432, 1, 0, 1,
-0.736722, 1.716722, -1.722395, 0.6039216, 1, 0, 1,
-0.7364493, 0.136741, -1.236935, 0.5960785, 1, 0, 1,
-0.7333574, 0.4557175, 0.07427853, 0.5882353, 1, 0, 1,
-0.7325009, 1.860992, -0.9140449, 0.5843138, 1, 0, 1,
-0.7230133, 0.08821296, -2.543184, 0.5764706, 1, 0, 1,
-0.7173368, 1.263207, -0.5920595, 0.572549, 1, 0, 1,
-0.7119348, 0.7859071, -1.780142, 0.5647059, 1, 0, 1,
-0.7105464, 0.5137008, -2.28272, 0.5607843, 1, 0, 1,
-0.7086444, -0.186909, -1.008291, 0.5529412, 1, 0, 1,
-0.7051656, -2.290155, -2.092186, 0.5490196, 1, 0, 1,
-0.6983719, -0.3948281, -2.412816, 0.5411765, 1, 0, 1,
-0.6914997, -0.005685914, -0.07428227, 0.5372549, 1, 0, 1,
-0.6889776, 0.5786929, -1.753292, 0.5294118, 1, 0, 1,
-0.6875442, 0.932043, -1.06518, 0.5254902, 1, 0, 1,
-0.6843343, -0.415076, -2.614273, 0.5176471, 1, 0, 1,
-0.6842026, 0.4223626, -1.29588, 0.5137255, 1, 0, 1,
-0.6797933, -0.2398968, -1.890187, 0.5058824, 1, 0, 1,
-0.6778186, -0.04454768, -1.446779, 0.5019608, 1, 0, 1,
-0.6777697, -0.536591, -1.461929, 0.4941176, 1, 0, 1,
-0.6771341, 1.077751, -0.5525997, 0.4862745, 1, 0, 1,
-0.6707823, 1.453105, 0.3458525, 0.4823529, 1, 0, 1,
-0.6692582, 2.109836, 0.02830569, 0.4745098, 1, 0, 1,
-0.6689949, 1.902231, -1.108269, 0.4705882, 1, 0, 1,
-0.6687067, -2.1519, -3.660522, 0.4627451, 1, 0, 1,
-0.6662522, 1.268473, -0.3128189, 0.4588235, 1, 0, 1,
-0.6656961, 0.7861021, -1.259881, 0.4509804, 1, 0, 1,
-0.6612389, 0.1163827, -1.789366, 0.4470588, 1, 0, 1,
-0.6607743, -0.9034172, -3.480999, 0.4392157, 1, 0, 1,
-0.6607734, -0.9305837, -3.56547, 0.4352941, 1, 0, 1,
-0.6606746, -0.7397997, -2.236219, 0.427451, 1, 0, 1,
-0.6594499, -0.6199737, -2.443532, 0.4235294, 1, 0, 1,
-0.6561854, -0.8445291, -0.3420623, 0.4156863, 1, 0, 1,
-0.6558238, 0.1616108, 1.589124, 0.4117647, 1, 0, 1,
-0.6460814, -0.7131129, -3.494797, 0.4039216, 1, 0, 1,
-0.636762, -0.2280386, -0.7621349, 0.3960784, 1, 0, 1,
-0.6360983, 0.8843161, -0.7399622, 0.3921569, 1, 0, 1,
-0.6350241, 0.9144599, -2.223652, 0.3843137, 1, 0, 1,
-0.6332558, -0.1980543, -1.932495, 0.3803922, 1, 0, 1,
-0.6311575, 0.2253736, -1.309959, 0.372549, 1, 0, 1,
-0.6298237, -0.8520524, -3.834339, 0.3686275, 1, 0, 1,
-0.6240356, -0.7848258, -2.200875, 0.3607843, 1, 0, 1,
-0.6220399, 0.6121348, -0.3853391, 0.3568628, 1, 0, 1,
-0.6214663, -1.12866, -2.683763, 0.3490196, 1, 0, 1,
-0.6124262, 0.4039764, -2.594103, 0.345098, 1, 0, 1,
-0.6058927, 0.4332404, -1.588978, 0.3372549, 1, 0, 1,
-0.601909, 0.9464093, 1.165944, 0.3333333, 1, 0, 1,
-0.6017522, -0.4964345, -1.428984, 0.3254902, 1, 0, 1,
-0.6013177, -1.617468, -3.227506, 0.3215686, 1, 0, 1,
-0.5991671, -0.109416, -1.323089, 0.3137255, 1, 0, 1,
-0.5957216, 0.1412596, -3.046156, 0.3098039, 1, 0, 1,
-0.594031, -0.1856256, -2.07514, 0.3019608, 1, 0, 1,
-0.5909817, -0.3151359, -3.226914, 0.2941177, 1, 0, 1,
-0.5847045, 0.4056029, -0.9731349, 0.2901961, 1, 0, 1,
-0.5845948, 0.4727275, -2.125851, 0.282353, 1, 0, 1,
-0.58439, 0.6936101, -1.972023, 0.2784314, 1, 0, 1,
-0.5789155, 0.370798, -1.236218, 0.2705882, 1, 0, 1,
-0.5787739, 1.160626, 0.9203876, 0.2666667, 1, 0, 1,
-0.5743139, 0.886467, -2.461081, 0.2588235, 1, 0, 1,
-0.5609907, 1.112009, -1.431663, 0.254902, 1, 0, 1,
-0.5585622, -0.5301858, -3.94761, 0.2470588, 1, 0, 1,
-0.5528857, -1.076049, -2.333266, 0.2431373, 1, 0, 1,
-0.5523563, 0.4840326, 0.1657485, 0.2352941, 1, 0, 1,
-0.5489981, -0.493285, -3.057936, 0.2313726, 1, 0, 1,
-0.5469663, -0.1763561, -2.349023, 0.2235294, 1, 0, 1,
-0.5468613, 0.5744409, 0.9929776, 0.2196078, 1, 0, 1,
-0.5456401, -0.514293, -3.634746, 0.2117647, 1, 0, 1,
-0.5442386, -1.091995, -2.379689, 0.2078431, 1, 0, 1,
-0.5432889, -1.689246, -2.19851, 0.2, 1, 0, 1,
-0.5404227, -0.03265272, -1.437352, 0.1921569, 1, 0, 1,
-0.5322633, -1.903204, -4.054339, 0.1882353, 1, 0, 1,
-0.5311989, -1.351957, -2.389513, 0.1803922, 1, 0, 1,
-0.5230576, -1.883952, -4.654644, 0.1764706, 1, 0, 1,
-0.5183421, -0.06359195, -1.257295, 0.1686275, 1, 0, 1,
-0.5178033, 0.9153773, -0.1973432, 0.1647059, 1, 0, 1,
-0.5172826, 0.7676995, -0.3910416, 0.1568628, 1, 0, 1,
-0.5159619, -0.9364511, -3.09065, 0.1529412, 1, 0, 1,
-0.5101524, 0.7111748, -1.388412, 0.145098, 1, 0, 1,
-0.5079573, 0.5241033, -0.754292, 0.1411765, 1, 0, 1,
-0.5053766, -0.4090097, -2.441248, 0.1333333, 1, 0, 1,
-0.5043726, 0.9305934, -0.5725125, 0.1294118, 1, 0, 1,
-0.5031179, 0.4446714, -0.7753217, 0.1215686, 1, 0, 1,
-0.5011683, 0.1428953, -2.134806, 0.1176471, 1, 0, 1,
-0.497218, 0.1968377, -1.031633, 0.1098039, 1, 0, 1,
-0.4967423, 0.5129456, -0.8802316, 0.1058824, 1, 0, 1,
-0.4962381, 0.9349912, -1.293691, 0.09803922, 1, 0, 1,
-0.4954016, -0.9596879, -2.247472, 0.09019608, 1, 0, 1,
-0.4905612, 1.410669, 1.435684, 0.08627451, 1, 0, 1,
-0.4899413, 0.2717137, 1.352298, 0.07843138, 1, 0, 1,
-0.4833639, -0.7409468, -2.930439, 0.07450981, 1, 0, 1,
-0.4825948, -0.5560113, -1.942925, 0.06666667, 1, 0, 1,
-0.4800896, 0.5566158, -0.1250828, 0.0627451, 1, 0, 1,
-0.4789416, -0.02253719, -2.039826, 0.05490196, 1, 0, 1,
-0.4780312, 0.9274236, 1.200794, 0.05098039, 1, 0, 1,
-0.476615, 0.3485429, -2.537875, 0.04313726, 1, 0, 1,
-0.4759345, -1.34931, -2.967679, 0.03921569, 1, 0, 1,
-0.4731015, -1.923649, -2.820736, 0.03137255, 1, 0, 1,
-0.4698435, 0.9405584, -1.605937, 0.02745098, 1, 0, 1,
-0.4659107, 0.7017222, -2.195822, 0.01960784, 1, 0, 1,
-0.463067, 1.258257, -1.569022, 0.01568628, 1, 0, 1,
-0.454491, -0.01864488, -1.456814, 0.007843138, 1, 0, 1,
-0.4539473, 0.139797, -0.883549, 0.003921569, 1, 0, 1,
-0.4513846, 1.406193, -0.1442844, 0, 1, 0.003921569, 1,
-0.4495586, -0.8509906, -2.071798, 0, 1, 0.01176471, 1,
-0.44874, 1.12676, 0.2201387, 0, 1, 0.01568628, 1,
-0.4484963, -2.377151, -3.757138, 0, 1, 0.02352941, 1,
-0.4407296, 0.08166668, -1.25478, 0, 1, 0.02745098, 1,
-0.4399046, -0.6591212, -1.428663, 0, 1, 0.03529412, 1,
-0.4355149, -0.1305224, -3.838171, 0, 1, 0.03921569, 1,
-0.4347761, 1.468702, -0.1886529, 0, 1, 0.04705882, 1,
-0.4342917, -1.388968, -2.871182, 0, 1, 0.05098039, 1,
-0.4333966, 0.2816996, -2.203252, 0, 1, 0.05882353, 1,
-0.4284172, 0.1546308, -0.3671964, 0, 1, 0.0627451, 1,
-0.4257575, 1.194077, -0.8467548, 0, 1, 0.07058824, 1,
-0.4220667, 0.3405745, 0.005578232, 0, 1, 0.07450981, 1,
-0.4200393, -1.53443, -1.881219, 0, 1, 0.08235294, 1,
-0.4194039, -1.225883, -2.960903, 0, 1, 0.08627451, 1,
-0.4153486, -0.5255623, -2.430032, 0, 1, 0.09411765, 1,
-0.4144374, 0.3540713, -1.487874, 0, 1, 0.1019608, 1,
-0.4133742, 0.6177754, 0.304555, 0, 1, 0.1058824, 1,
-0.4121193, -0.07504545, -1.705983, 0, 1, 0.1137255, 1,
-0.411728, 1.799801, -2.406793, 0, 1, 0.1176471, 1,
-0.4068223, -1.303306, -2.174639, 0, 1, 0.1254902, 1,
-0.4049678, -0.4119628, -2.815626, 0, 1, 0.1294118, 1,
-0.4039229, 0.9325679, -0.2998806, 0, 1, 0.1372549, 1,
-0.4030264, 0.3674401, -0.7966806, 0, 1, 0.1411765, 1,
-0.3989756, 0.7558273, 0.2558021, 0, 1, 0.1490196, 1,
-0.3941038, -0.2094632, -2.547329, 0, 1, 0.1529412, 1,
-0.3911304, -1.550955, -2.697973, 0, 1, 0.1607843, 1,
-0.3845038, 1.975046, 0.412731, 0, 1, 0.1647059, 1,
-0.3806084, -0.2459084, -1.598897, 0, 1, 0.172549, 1,
-0.3804538, 0.9475532, 0.2851374, 0, 1, 0.1764706, 1,
-0.3788887, -0.07742958, -0.1890235, 0, 1, 0.1843137, 1,
-0.3767517, -0.7868587, -3.772127, 0, 1, 0.1882353, 1,
-0.3757461, -0.2886965, -3.51723, 0, 1, 0.1960784, 1,
-0.3726285, -0.1453656, -2.967544, 0, 1, 0.2039216, 1,
-0.3696658, -0.8677587, -3.680681, 0, 1, 0.2078431, 1,
-0.3692891, 0.65264, 0.5891848, 0, 1, 0.2156863, 1,
-0.367483, -0.509183, -3.432541, 0, 1, 0.2196078, 1,
-0.3673362, 0.563018, -0.575474, 0, 1, 0.227451, 1,
-0.3610691, 1.184772, 0.04281729, 0, 1, 0.2313726, 1,
-0.3580777, -0.09693912, -1.462075, 0, 1, 0.2392157, 1,
-0.3543825, 0.01461306, -2.451419, 0, 1, 0.2431373, 1,
-0.3507717, -0.6937184, -2.667609, 0, 1, 0.2509804, 1,
-0.3482737, -0.3604258, -2.058165, 0, 1, 0.254902, 1,
-0.3415231, -0.2384287, -2.228978, 0, 1, 0.2627451, 1,
-0.3379976, -1.093652, -4.721198, 0, 1, 0.2666667, 1,
-0.3374636, -0.01346369, -1.560296, 0, 1, 0.2745098, 1,
-0.3337695, -0.5594399, -2.49272, 0, 1, 0.2784314, 1,
-0.3324796, -0.5135237, -3.423198, 0, 1, 0.2862745, 1,
-0.3306155, -0.007111624, -3.366596, 0, 1, 0.2901961, 1,
-0.3302707, 1.884604, -0.5217315, 0, 1, 0.2980392, 1,
-0.3292023, 1.024193, 0.6796195, 0, 1, 0.3058824, 1,
-0.3265293, 1.65668, -1.493094, 0, 1, 0.3098039, 1,
-0.3260413, 0.8296546, 0.2371936, 0, 1, 0.3176471, 1,
-0.3200311, 0.5499306, -1.095044, 0, 1, 0.3215686, 1,
-0.3195665, -1.103468, -2.349569, 0, 1, 0.3294118, 1,
-0.3182376, -0.7351262, -1.755626, 0, 1, 0.3333333, 1,
-0.3180777, -0.4821292, -1.61798, 0, 1, 0.3411765, 1,
-0.3165222, -0.16202, -2.010578, 0, 1, 0.345098, 1,
-0.3138804, -0.1362875, -2.785989, 0, 1, 0.3529412, 1,
-0.3027247, 0.1758715, -0.1978458, 0, 1, 0.3568628, 1,
-0.3014381, -0.6415365, -1.533755, 0, 1, 0.3647059, 1,
-0.3011129, -0.1347132, -1.924596, 0, 1, 0.3686275, 1,
-0.2971317, 0.712075, -0.4579834, 0, 1, 0.3764706, 1,
-0.2909727, 2.377009, 0.2058163, 0, 1, 0.3803922, 1,
-0.2892698, 0.423564, -0.923692, 0, 1, 0.3882353, 1,
-0.287908, -1.199214, -2.92575, 0, 1, 0.3921569, 1,
-0.2872981, 0.3701122, -0.2465038, 0, 1, 0.4, 1,
-0.2857769, 1.160501, -1.890134, 0, 1, 0.4078431, 1,
-0.2846408, 0.01666629, 0.6100899, 0, 1, 0.4117647, 1,
-0.281436, 1.17089, 1.484387, 0, 1, 0.4196078, 1,
-0.2760924, 1.147093, 0.3727651, 0, 1, 0.4235294, 1,
-0.2728357, -0.8867959, -2.636988, 0, 1, 0.4313726, 1,
-0.2724419, 0.2554081, -1.197278, 0, 1, 0.4352941, 1,
-0.2711667, -0.2599292, -1.45589, 0, 1, 0.4431373, 1,
-0.2663352, -0.4931394, -1.635208, 0, 1, 0.4470588, 1,
-0.262911, 0.1461678, -2.605023, 0, 1, 0.454902, 1,
-0.2548773, 0.5175079, -0.8494133, 0, 1, 0.4588235, 1,
-0.248137, 1.016042, -1.087145, 0, 1, 0.4666667, 1,
-0.2476046, 0.6248547, -0.3829801, 0, 1, 0.4705882, 1,
-0.245829, 0.04751774, -1.446349, 0, 1, 0.4784314, 1,
-0.2362559, -0.6643193, -2.403189, 0, 1, 0.4823529, 1,
-0.234475, 0.7563589, 0.1036192, 0, 1, 0.4901961, 1,
-0.2305974, -1.160962, -1.846833, 0, 1, 0.4941176, 1,
-0.2296323, 1.149409, 1.054633, 0, 1, 0.5019608, 1,
-0.2289391, -0.3514672, 0.3841816, 0, 1, 0.509804, 1,
-0.2221193, 0.4923673, 1.343687, 0, 1, 0.5137255, 1,
-0.2219167, 0.1604717, -1.487222, 0, 1, 0.5215687, 1,
-0.2190206, -0.5354527, -1.789425, 0, 1, 0.5254902, 1,
-0.2142023, -1.001082, -3.455801, 0, 1, 0.5333334, 1,
-0.2114341, 1.825846, 0.5715045, 0, 1, 0.5372549, 1,
-0.2085922, 0.5455588, -0.8354258, 0, 1, 0.5450981, 1,
-0.2071706, 0.6730015, -0.5148715, 0, 1, 0.5490196, 1,
-0.2058991, 0.7071795, -0.5394966, 0, 1, 0.5568628, 1,
-0.1961387, -0.747611, -1.275863, 0, 1, 0.5607843, 1,
-0.1939314, 0.7833171, 1.287903, 0, 1, 0.5686275, 1,
-0.193562, 0.2096962, -0.7432839, 0, 1, 0.572549, 1,
-0.1926117, 0.3053922, -0.2801217, 0, 1, 0.5803922, 1,
-0.1924005, -0.9045058, -2.619313, 0, 1, 0.5843138, 1,
-0.1911219, -1.432823, -3.313798, 0, 1, 0.5921569, 1,
-0.1883368, 1.450128, -1.707155, 0, 1, 0.5960785, 1,
-0.1868474, -0.8483129, -2.84733, 0, 1, 0.6039216, 1,
-0.1845623, -1.948574, -2.200028, 0, 1, 0.6117647, 1,
-0.1842507, -0.6561196, -2.326265, 0, 1, 0.6156863, 1,
-0.1825781, 0.2034533, 0.1712075, 0, 1, 0.6235294, 1,
-0.1795596, 1.735723, 0.3237026, 0, 1, 0.627451, 1,
-0.1782963, 1.155096, 0.6644164, 0, 1, 0.6352941, 1,
-0.1755597, 0.3300824, 1.105894, 0, 1, 0.6392157, 1,
-0.171855, -0.5401875, -4.9219, 0, 1, 0.6470588, 1,
-0.1704508, 0.1625793, -2.023716, 0, 1, 0.6509804, 1,
-0.169818, 0.3025599, 0.2472853, 0, 1, 0.6588235, 1,
-0.164231, -0.1532637, -2.909728, 0, 1, 0.6627451, 1,
-0.1608025, -1.476037, -2.795015, 0, 1, 0.6705883, 1,
-0.1582578, 0.9617038, -3.258904, 0, 1, 0.6745098, 1,
-0.1576193, 1.389777, 1.45505, 0, 1, 0.682353, 1,
-0.153339, -0.7887978, -4.129087, 0, 1, 0.6862745, 1,
-0.1532412, 0.482045, 0.5265585, 0, 1, 0.6941177, 1,
-0.1512006, 0.8780007, 0.5470734, 0, 1, 0.7019608, 1,
-0.1511141, -0.5162917, -3.192844, 0, 1, 0.7058824, 1,
-0.1457837, -0.1683152, -3.427022, 0, 1, 0.7137255, 1,
-0.1429697, -0.7606381, -3.491911, 0, 1, 0.7176471, 1,
-0.1375913, -0.0382283, -2.949683, 0, 1, 0.7254902, 1,
-0.137133, 0.240271, -1.24217, 0, 1, 0.7294118, 1,
-0.1368179, 1.390065, -0.71513, 0, 1, 0.7372549, 1,
-0.134074, -1.00369, -4.959541, 0, 1, 0.7411765, 1,
-0.1328739, 0.7145907, -0.3186123, 0, 1, 0.7490196, 1,
-0.1319356, 2.160346, -0.8394831, 0, 1, 0.7529412, 1,
-0.130042, -0.5555902, -2.554394, 0, 1, 0.7607843, 1,
-0.1292682, -0.2900697, -2.063833, 0, 1, 0.7647059, 1,
-0.1240339, 0.8537389, 0.161714, 0, 1, 0.772549, 1,
-0.1238789, 0.5128103, -0.1673694, 0, 1, 0.7764706, 1,
-0.1234676, -1.613983, -2.767339, 0, 1, 0.7843137, 1,
-0.1232168, 2.981859, 0.8903748, 0, 1, 0.7882353, 1,
-0.1230566, 1.617041, -0.1731386, 0, 1, 0.7960784, 1,
-0.1209028, -1.273405, -3.438715, 0, 1, 0.8039216, 1,
-0.1184305, -0.2274641, -2.345124, 0, 1, 0.8078431, 1,
-0.1181613, 0.02326194, -2.036055, 0, 1, 0.8156863, 1,
-0.1077164, -0.7812135, -3.17218, 0, 1, 0.8196079, 1,
-0.1066117, -0.3844311, -2.141569, 0, 1, 0.827451, 1,
-0.09949448, -0.6431857, -4.917511, 0, 1, 0.8313726, 1,
-0.09782587, -0.03366892, -2.267055, 0, 1, 0.8392157, 1,
-0.09244447, -0.9833661, -4.598075, 0, 1, 0.8431373, 1,
-0.08931694, 0.005385727, -1.299834, 0, 1, 0.8509804, 1,
-0.08804952, 0.2919796, -1.638797, 0, 1, 0.854902, 1,
-0.0843044, -0.4335234, -2.803762, 0, 1, 0.8627451, 1,
-0.08192258, 0.008741424, -2.307007, 0, 1, 0.8666667, 1,
-0.07846393, -0.1993775, -2.999003, 0, 1, 0.8745098, 1,
-0.07051314, -0.8874125, -2.936891, 0, 1, 0.8784314, 1,
-0.06990287, 1.135796, -0.08905157, 0, 1, 0.8862745, 1,
-0.0661065, -0.2172191, -3.520808, 0, 1, 0.8901961, 1,
-0.06604855, 0.2590778, -1.539619, 0, 1, 0.8980392, 1,
-0.06299603, -1.048805, -3.240092, 0, 1, 0.9058824, 1,
-0.06119207, -0.1273344, -2.723904, 0, 1, 0.9098039, 1,
-0.05991754, 0.1624869, -1.897758, 0, 1, 0.9176471, 1,
-0.05888204, 0.75448, -0.884691, 0, 1, 0.9215686, 1,
-0.05820097, -1.164517, -4.822789, 0, 1, 0.9294118, 1,
-0.05817134, 0.4847533, 2.037674, 0, 1, 0.9333333, 1,
-0.05726661, 0.6715596, 0.4169928, 0, 1, 0.9411765, 1,
-0.05643171, -0.6382608, -0.5733284, 0, 1, 0.945098, 1,
-0.04892386, -0.023428, -0.6376573, 0, 1, 0.9529412, 1,
-0.04760867, 0.8768743, 0.8006878, 0, 1, 0.9568627, 1,
-0.04311578, 1.500957, -0.7666128, 0, 1, 0.9647059, 1,
-0.04160754, 1.410285, 1.710352, 0, 1, 0.9686275, 1,
-0.03904959, 0.2961752, 0.2174354, 0, 1, 0.9764706, 1,
-0.03454021, 1.122502, -0.9726102, 0, 1, 0.9803922, 1,
-0.02794716, 0.4218037, -2.059562, 0, 1, 0.9882353, 1,
-0.02393099, -0.09247181, -2.452993, 0, 1, 0.9921569, 1,
-0.02120643, 0.7536023, -0.00387726, 0, 1, 1, 1,
-0.01917382, 1.663224, -0.9703147, 0, 0.9921569, 1, 1,
-0.01837113, 0.6984767, 0.3859251, 0, 0.9882353, 1, 1,
-0.01383303, -1.683468, -1.7866, 0, 0.9803922, 1, 1,
-0.0096599, -0.8727518, -3.145641, 0, 0.9764706, 1, 1,
-0.008983909, -1.592373, -3.895213, 0, 0.9686275, 1, 1,
-0.005218898, 0.6369764, -0.5587107, 0, 0.9647059, 1, 1,
-0.005137298, -0.5223063, -2.143984, 0, 0.9568627, 1, 1,
-0.004531046, 1.313651, 1.756017, 0, 0.9529412, 1, 1,
-0.003751394, 0.3542057, 0.2836268, 0, 0.945098, 1, 1,
-0.003047312, -0.32939, -4.273024, 0, 0.9411765, 1, 1,
-0.002537164, -0.7496353, -2.680758, 0, 0.9333333, 1, 1,
-0.001216038, -0.0467183, -1.63607, 0, 0.9294118, 1, 1,
-0.0005632559, -0.0007555863, -1.108032, 0, 0.9215686, 1, 1,
0.005157837, 0.2579092, 0.8141205, 0, 0.9176471, 1, 1,
0.005418133, -1.391822, 3.688745, 0, 0.9098039, 1, 1,
0.00627847, 0.5084079, 1.938408, 0, 0.9058824, 1, 1,
0.01443074, -0.4109201, 2.862848, 0, 0.8980392, 1, 1,
0.01525855, -0.7539962, 4.259046, 0, 0.8901961, 1, 1,
0.01998816, 1.32644, 0.3520492, 0, 0.8862745, 1, 1,
0.02270576, 0.5146428, 0.738133, 0, 0.8784314, 1, 1,
0.02374402, -1.446394, 2.702462, 0, 0.8745098, 1, 1,
0.0244249, 0.8315732, -0.2878489, 0, 0.8666667, 1, 1,
0.02676794, 0.8303197, 0.7027795, 0, 0.8627451, 1, 1,
0.02916605, 1.696559, -1.237838, 0, 0.854902, 1, 1,
0.02962058, -0.2902216, 2.177815, 0, 0.8509804, 1, 1,
0.03123271, -1.232108, 1.978658, 0, 0.8431373, 1, 1,
0.03398099, -1.178047, 3.0961, 0, 0.8392157, 1, 1,
0.03528302, 0.2861144, 0.3366154, 0, 0.8313726, 1, 1,
0.03703509, -0.1674519, 3.468911, 0, 0.827451, 1, 1,
0.04664456, -0.8987017, 2.922816, 0, 0.8196079, 1, 1,
0.04697684, 0.2153506, -0.2853626, 0, 0.8156863, 1, 1,
0.05100108, 0.1276133, 1.416017, 0, 0.8078431, 1, 1,
0.05207507, 0.00857737, 1.762796, 0, 0.8039216, 1, 1,
0.05673561, -0.8596634, 4.294099, 0, 0.7960784, 1, 1,
0.0599603, -1.725772, 4.353258, 0, 0.7882353, 1, 1,
0.06252176, 0.3938706, 0.3493176, 0, 0.7843137, 1, 1,
0.06810207, 0.04613983, 0.8234365, 0, 0.7764706, 1, 1,
0.06867188, -0.3952299, 2.432435, 0, 0.772549, 1, 1,
0.0687481, 0.3210153, 0.9538664, 0, 0.7647059, 1, 1,
0.07097822, -0.3364388, 2.7084, 0, 0.7607843, 1, 1,
0.07202426, 0.3723696, 1.459922, 0, 0.7529412, 1, 1,
0.07817016, 0.585512, -0.8299917, 0, 0.7490196, 1, 1,
0.07881628, 1.048178, -1.023576, 0, 0.7411765, 1, 1,
0.08533613, 1.70982, 0.6790881, 0, 0.7372549, 1, 1,
0.09251311, 1.335901, 0.7755471, 0, 0.7294118, 1, 1,
0.09433379, -0.497619, 2.334257, 0, 0.7254902, 1, 1,
0.09588503, -0.8389357, 2.914968, 0, 0.7176471, 1, 1,
0.106687, -1.335658, 2.56163, 0, 0.7137255, 1, 1,
0.109285, 0.3779502, -0.3569217, 0, 0.7058824, 1, 1,
0.1094788, 0.7760898, -0.0050647, 0, 0.6980392, 1, 1,
0.1116705, 2.080243, 0.4927923, 0, 0.6941177, 1, 1,
0.1120945, 0.509518, 1.889362, 0, 0.6862745, 1, 1,
0.1123023, 1.655356, 0.6666728, 0, 0.682353, 1, 1,
0.1144493, 0.3882302, 2.579493, 0, 0.6745098, 1, 1,
0.1149975, 1.236522, -0.5634065, 0, 0.6705883, 1, 1,
0.1163167, -0.7037212, 3.062282, 0, 0.6627451, 1, 1,
0.1192836, -0.1826471, 2.883785, 0, 0.6588235, 1, 1,
0.1228508, 0.747611, -0.06063936, 0, 0.6509804, 1, 1,
0.1243128, -0.5355173, 2.484205, 0, 0.6470588, 1, 1,
0.1258641, 0.1861344, 0.152338, 0, 0.6392157, 1, 1,
0.1297859, 0.5814051, 0.5112678, 0, 0.6352941, 1, 1,
0.1326685, 1.250866, 0.3459076, 0, 0.627451, 1, 1,
0.1330761, 1.341058, 1.361341, 0, 0.6235294, 1, 1,
0.1368254, -0.1915333, 2.139395, 0, 0.6156863, 1, 1,
0.1420063, 0.1635504, 1.583523, 0, 0.6117647, 1, 1,
0.1440681, 0.345785, 0.7944132, 0, 0.6039216, 1, 1,
0.1454913, -0.2677923, 2.366947, 0, 0.5960785, 1, 1,
0.146873, -1.704307, 3.17458, 0, 0.5921569, 1, 1,
0.1470596, -0.1949856, 2.032227, 0, 0.5843138, 1, 1,
0.1472123, 1.364158, -0.3455573, 0, 0.5803922, 1, 1,
0.1510734, -1.403408, 2.897595, 0, 0.572549, 1, 1,
0.1542512, -1.408856, 2.775787, 0, 0.5686275, 1, 1,
0.1547846, 0.0001920828, 1.555387, 0, 0.5607843, 1, 1,
0.1571334, -1.102907, 2.581982, 0, 0.5568628, 1, 1,
0.1636212, -2.595002, 2.730966, 0, 0.5490196, 1, 1,
0.1688954, 0.1709566, 0.08933941, 0, 0.5450981, 1, 1,
0.1727913, 2.102486, -1.803009, 0, 0.5372549, 1, 1,
0.1728894, 0.008979238, 0.8536465, 0, 0.5333334, 1, 1,
0.1749316, -0.3348505, 3.352428, 0, 0.5254902, 1, 1,
0.1803915, -0.5605958, 2.876887, 0, 0.5215687, 1, 1,
0.1804082, -1.056203, 3.004652, 0, 0.5137255, 1, 1,
0.1808596, -1.280868, 2.512145, 0, 0.509804, 1, 1,
0.1844187, -1.688407, 3.950247, 0, 0.5019608, 1, 1,
0.1872852, 1.385441, -0.2034784, 0, 0.4941176, 1, 1,
0.1924467, -0.4661894, 2.658031, 0, 0.4901961, 1, 1,
0.1934201, 0.2472437, 0.8573001, 0, 0.4823529, 1, 1,
0.1943039, 0.7304441, 0.4239844, 0, 0.4784314, 1, 1,
0.195874, -0.1122495, 2.919779, 0, 0.4705882, 1, 1,
0.1974908, -0.2037923, 1.991478, 0, 0.4666667, 1, 1,
0.1978589, -0.156835, 2.768398, 0, 0.4588235, 1, 1,
0.2032464, -0.4276848, 3.071344, 0, 0.454902, 1, 1,
0.209698, -0.09732253, 2.33423, 0, 0.4470588, 1, 1,
0.212887, 0.303489, 1.576564, 0, 0.4431373, 1, 1,
0.2234801, -2.204145, 1.487472, 0, 0.4352941, 1, 1,
0.2245346, -0.1399835, 1.664707, 0, 0.4313726, 1, 1,
0.2324535, 1.762712, -0.5635509, 0, 0.4235294, 1, 1,
0.2325936, -0.5962474, 1.625233, 0, 0.4196078, 1, 1,
0.2328732, -1.044866, 4.092695, 0, 0.4117647, 1, 1,
0.2337963, 1.063815, 0.6553534, 0, 0.4078431, 1, 1,
0.2351823, 0.5939518, 0.5831118, 0, 0.4, 1, 1,
0.2394238, -0.7343315, 5.191227, 0, 0.3921569, 1, 1,
0.2401886, -1.063329, 2.353803, 0, 0.3882353, 1, 1,
0.2413176, -0.1946618, 1.319077, 0, 0.3803922, 1, 1,
0.2413204, -0.3511681, 3.302496, 0, 0.3764706, 1, 1,
0.243008, 0.9399068, 0.173542, 0, 0.3686275, 1, 1,
0.244295, -1.036966, 3.739156, 0, 0.3647059, 1, 1,
0.2461432, 1.379056, 0.6673902, 0, 0.3568628, 1, 1,
0.2483252, -0.3786894, 2.132254, 0, 0.3529412, 1, 1,
0.2486738, 1.591663, -0.4332539, 0, 0.345098, 1, 1,
0.2492063, 1.003314, -0.2197102, 0, 0.3411765, 1, 1,
0.252504, 0.9859024, 2.169162, 0, 0.3333333, 1, 1,
0.2699388, 0.2099336, 1.89585, 0, 0.3294118, 1, 1,
0.2724099, -0.3229266, 2.950717, 0, 0.3215686, 1, 1,
0.2743462, 1.02765, -0.3612551, 0, 0.3176471, 1, 1,
0.2756874, 0.04646645, 2.51644, 0, 0.3098039, 1, 1,
0.2777497, -0.3661341, 2.583284, 0, 0.3058824, 1, 1,
0.2840556, 1.605013, -1.576786, 0, 0.2980392, 1, 1,
0.2939698, -0.6642378, 3.301201, 0, 0.2901961, 1, 1,
0.2973595, 1.140878, 1.262761, 0, 0.2862745, 1, 1,
0.299987, 0.7743564, 1.677848, 0, 0.2784314, 1, 1,
0.3052673, 0.6280529, -0.6392124, 0, 0.2745098, 1, 1,
0.305802, -1.462691, 3.780931, 0, 0.2666667, 1, 1,
0.3073641, 0.437299, 0.7534903, 0, 0.2627451, 1, 1,
0.3086714, -0.6691164, 0.7348675, 0, 0.254902, 1, 1,
0.3098742, 1.503801, -0.8135555, 0, 0.2509804, 1, 1,
0.3124393, 0.9144968, 0.8789985, 0, 0.2431373, 1, 1,
0.3129901, -1.158717, 2.869668, 0, 0.2392157, 1, 1,
0.3190191, 0.6158868, 1.09256, 0, 0.2313726, 1, 1,
0.319938, 0.7367044, 1.317108, 0, 0.227451, 1, 1,
0.3211473, 0.9213074, 0.2528003, 0, 0.2196078, 1, 1,
0.3212278, 0.1298806, 1.649162, 0, 0.2156863, 1, 1,
0.3212354, -0.8304044, 2.389421, 0, 0.2078431, 1, 1,
0.3223895, -0.5888274, 2.189724, 0, 0.2039216, 1, 1,
0.3228292, -0.4701043, 2.479486, 0, 0.1960784, 1, 1,
0.3232863, -1.603838, 4.192811, 0, 0.1882353, 1, 1,
0.3235779, 1.187036, 0.3828579, 0, 0.1843137, 1, 1,
0.3290547, 2.242575, -0.7897245, 0, 0.1764706, 1, 1,
0.3291583, 1.365911, 1.000917, 0, 0.172549, 1, 1,
0.3295946, -0.8159946, 2.682323, 0, 0.1647059, 1, 1,
0.3308676, 0.3347567, 1.268153, 0, 0.1607843, 1, 1,
0.3323542, -0.5847127, 1.423255, 0, 0.1529412, 1, 1,
0.3364042, -1.818943, 3.257636, 0, 0.1490196, 1, 1,
0.3446583, -0.1081498, 1.29224, 0, 0.1411765, 1, 1,
0.3460135, -0.7789602, 2.914259, 0, 0.1372549, 1, 1,
0.3465114, -0.681504, 1.88167, 0, 0.1294118, 1, 1,
0.355771, 2.031141, -0.1649262, 0, 0.1254902, 1, 1,
0.356176, -1.393227, 1.492215, 0, 0.1176471, 1, 1,
0.3594297, -0.0001096477, 2.080199, 0, 0.1137255, 1, 1,
0.3626482, -0.4999505, 1.754202, 0, 0.1058824, 1, 1,
0.3641535, 1.368248, -0.08745237, 0, 0.09803922, 1, 1,
0.366445, 0.2037538, 0.8795861, 0, 0.09411765, 1, 1,
0.3742893, 0.566393, 1.253676, 0, 0.08627451, 1, 1,
0.3777817, -0.6294695, 4.63044, 0, 0.08235294, 1, 1,
0.3780226, 1.478742, 0.6905395, 0, 0.07450981, 1, 1,
0.3790349, -1.167791, 2.997456, 0, 0.07058824, 1, 1,
0.3801597, 0.3710309, 1.392693, 0, 0.0627451, 1, 1,
0.3869506, -0.9676632, 2.527194, 0, 0.05882353, 1, 1,
0.3869977, 0.01988544, 2.573232, 0, 0.05098039, 1, 1,
0.3894768, 0.09381726, -0.02506234, 0, 0.04705882, 1, 1,
0.3929639, -0.03431517, 0.9561152, 0, 0.03921569, 1, 1,
0.393193, -0.1699425, 0.6829295, 0, 0.03529412, 1, 1,
0.398164, 0.4433529, 1.1475, 0, 0.02745098, 1, 1,
0.4030849, -0.4792315, 2.400643, 0, 0.02352941, 1, 1,
0.4034136, -1.436429, 3.846633, 0, 0.01568628, 1, 1,
0.403787, -0.1128285, 2.596837, 0, 0.01176471, 1, 1,
0.4047539, 0.4907368, 1.641483, 0, 0.003921569, 1, 1,
0.4051948, 0.2551386, -0.7771361, 0.003921569, 0, 1, 1,
0.4062832, -0.009961461, 2.41869, 0.007843138, 0, 1, 1,
0.4077688, 0.6805741, 0.7517157, 0.01568628, 0, 1, 1,
0.4088496, 0.2139288, 0.5635807, 0.01960784, 0, 1, 1,
0.4130663, -1.765789, 2.672797, 0.02745098, 0, 1, 1,
0.4132687, 0.0004667993, 1.621019, 0.03137255, 0, 1, 1,
0.4132749, 0.09181112, 0.9563304, 0.03921569, 0, 1, 1,
0.4143715, -1.541083, 0.2544811, 0.04313726, 0, 1, 1,
0.4145912, 0.3410679, -0.0257135, 0.05098039, 0, 1, 1,
0.4161705, 0.9587362, 0.3966743, 0.05490196, 0, 1, 1,
0.4163861, 0.09999438, 0.5632845, 0.0627451, 0, 1, 1,
0.4164771, 0.1453003, 0.4184298, 0.06666667, 0, 1, 1,
0.4175198, 0.990992, -0.7146386, 0.07450981, 0, 1, 1,
0.4188832, -0.6451452, 3.772255, 0.07843138, 0, 1, 1,
0.4217872, -0.8538191, 2.992095, 0.08627451, 0, 1, 1,
0.423802, -0.5821684, 3.214731, 0.09019608, 0, 1, 1,
0.4274522, -0.7320809, 2.972183, 0.09803922, 0, 1, 1,
0.4307706, -0.2672396, 3.288486, 0.1058824, 0, 1, 1,
0.4321636, 0.3167886, 1.814711, 0.1098039, 0, 1, 1,
0.4339611, -0.9267465, 2.760965, 0.1176471, 0, 1, 1,
0.4346453, 0.334635, -1.184714, 0.1215686, 0, 1, 1,
0.4433294, -0.5633527, 2.649051, 0.1294118, 0, 1, 1,
0.4555544, 0.7610157, 0.1631453, 0.1333333, 0, 1, 1,
0.455936, 0.602431, 2.129866, 0.1411765, 0, 1, 1,
0.4568216, 0.4546067, -1.084437, 0.145098, 0, 1, 1,
0.4579936, -0.5071971, 3.41373, 0.1529412, 0, 1, 1,
0.4649334, 1.411234, 0.5409166, 0.1568628, 0, 1, 1,
0.4714858, -0.1457243, 2.175374, 0.1647059, 0, 1, 1,
0.4789586, 1.63088, -0.2585671, 0.1686275, 0, 1, 1,
0.4823623, -0.5111338, 1.662694, 0.1764706, 0, 1, 1,
0.4850927, 1.506001, 1.921134, 0.1803922, 0, 1, 1,
0.4865135, 1.908762, 0.4120035, 0.1882353, 0, 1, 1,
0.4876305, 1.03988, 0.4803455, 0.1921569, 0, 1, 1,
0.4879958, -0.3600681, 1.455184, 0.2, 0, 1, 1,
0.4918115, -0.3445658, 1.125533, 0.2078431, 0, 1, 1,
0.4989794, 1.591661, 0.3207313, 0.2117647, 0, 1, 1,
0.5063608, 0.03550547, 1.599203, 0.2196078, 0, 1, 1,
0.5120409, -0.1209779, 1.287184, 0.2235294, 0, 1, 1,
0.5220492, -0.248749, 3.121639, 0.2313726, 0, 1, 1,
0.5251237, -0.003183676, 0.7597351, 0.2352941, 0, 1, 1,
0.5274442, -0.2981475, 2.463199, 0.2431373, 0, 1, 1,
0.5295851, -0.3957393, 4.125744, 0.2470588, 0, 1, 1,
0.5316414, 0.5700914, 1.348698, 0.254902, 0, 1, 1,
0.532645, -0.6897748, 3.676554, 0.2588235, 0, 1, 1,
0.5328992, 1.243532, -0.1051776, 0.2666667, 0, 1, 1,
0.5404966, -0.6949847, 2.791448, 0.2705882, 0, 1, 1,
0.5442188, 1.045575, 0.456243, 0.2784314, 0, 1, 1,
0.5473573, -0.6139618, 3.203438, 0.282353, 0, 1, 1,
0.5545052, -0.1298015, 0.8952669, 0.2901961, 0, 1, 1,
0.5617934, 0.6769788, 1.230742, 0.2941177, 0, 1, 1,
0.5634607, 1.187327, -0.2565961, 0.3019608, 0, 1, 1,
0.5645427, 1.358413, 0.5899057, 0.3098039, 0, 1, 1,
0.5694889, -2.024845, 3.664648, 0.3137255, 0, 1, 1,
0.5694894, -0.3715492, 0.4237732, 0.3215686, 0, 1, 1,
0.5707884, 0.1100217, 1.254169, 0.3254902, 0, 1, 1,
0.5750566, -2.309912, 3.647021, 0.3333333, 0, 1, 1,
0.5760452, -1.069445, 0.5850013, 0.3372549, 0, 1, 1,
0.5769921, 0.6813931, -0.7678798, 0.345098, 0, 1, 1,
0.5784329, 0.6341277, -1.336498, 0.3490196, 0, 1, 1,
0.5801684, -1.134424, 4.27444, 0.3568628, 0, 1, 1,
0.5804778, -1.89121, 2.792008, 0.3607843, 0, 1, 1,
0.5841789, -0.8202044, 2.893018, 0.3686275, 0, 1, 1,
0.5854253, 1.223295, 1.279617, 0.372549, 0, 1, 1,
0.5904878, -1.513684, 3.975387, 0.3803922, 0, 1, 1,
0.5934032, -0.1851814, 1.10262, 0.3843137, 0, 1, 1,
0.5942578, -1.382736, 1.105988, 0.3921569, 0, 1, 1,
0.595942, 0.3745705, 0.9553337, 0.3960784, 0, 1, 1,
0.5988585, 0.03162156, 2.100089, 0.4039216, 0, 1, 1,
0.6020062, 1.571567, -0.7763819, 0.4117647, 0, 1, 1,
0.6020713, 0.5365372, 0.5635159, 0.4156863, 0, 1, 1,
0.6023368, 0.4659314, 1.688472, 0.4235294, 0, 1, 1,
0.6028795, 0.7691565, 0.3026944, 0.427451, 0, 1, 1,
0.6085272, 0.191132, 1.703879, 0.4352941, 0, 1, 1,
0.612382, -0.6698193, 3.533371, 0.4392157, 0, 1, 1,
0.6137896, 0.1735679, 1.115196, 0.4470588, 0, 1, 1,
0.6149789, -0.2697184, 3.007878, 0.4509804, 0, 1, 1,
0.6172232, 1.731386, -0.1158648, 0.4588235, 0, 1, 1,
0.6184552, 1.893151, 0.2428584, 0.4627451, 0, 1, 1,
0.6208426, 0.6136646, 0.03339665, 0.4705882, 0, 1, 1,
0.6217879, 1.810919, 0.2449807, 0.4745098, 0, 1, 1,
0.6222218, -0.4090723, 0.8730718, 0.4823529, 0, 1, 1,
0.6224728, -0.2907138, 2.154556, 0.4862745, 0, 1, 1,
0.6298923, -0.778358, 1.479362, 0.4941176, 0, 1, 1,
0.6351658, 0.1598597, 2.269448, 0.5019608, 0, 1, 1,
0.6455065, -0.6480177, 1.813816, 0.5058824, 0, 1, 1,
0.6492632, -2.070359, 2.426969, 0.5137255, 0, 1, 1,
0.6499821, -0.1712623, 1.529004, 0.5176471, 0, 1, 1,
0.6506427, 1.246339, -0.7408696, 0.5254902, 0, 1, 1,
0.6557629, -1.858249, 1.811426, 0.5294118, 0, 1, 1,
0.6561655, 0.7323703, 1.224288, 0.5372549, 0, 1, 1,
0.6603152, -0.7940511, 1.751877, 0.5411765, 0, 1, 1,
0.6619223, 1.260556, 0.5584528, 0.5490196, 0, 1, 1,
0.6649398, 1.874174, 0.374821, 0.5529412, 0, 1, 1,
0.6675032, 0.2389967, 0.6915239, 0.5607843, 0, 1, 1,
0.6684078, 0.5706503, 1.194469, 0.5647059, 0, 1, 1,
0.6757906, 0.4429964, 3.313387, 0.572549, 0, 1, 1,
0.6767206, -0.1586304, 0.7244617, 0.5764706, 0, 1, 1,
0.6769729, -0.6026905, 1.442393, 0.5843138, 0, 1, 1,
0.6804385, 0.6697322, -0.3736728, 0.5882353, 0, 1, 1,
0.6813648, 1.023842, 1.399139, 0.5960785, 0, 1, 1,
0.68353, 2.255334, -0.161141, 0.6039216, 0, 1, 1,
0.6872346, 0.6985363, -0.1684887, 0.6078432, 0, 1, 1,
0.6889919, -1.420364, 2.905692, 0.6156863, 0, 1, 1,
0.6898772, -0.6634001, 1.095141, 0.6196079, 0, 1, 1,
0.6934295, -0.7853954, 1.108714, 0.627451, 0, 1, 1,
0.6944237, -0.8412407, 1.035765, 0.6313726, 0, 1, 1,
0.695499, -1.098415, 3.793363, 0.6392157, 0, 1, 1,
0.6974569, -0.8644717, 2.379264, 0.6431373, 0, 1, 1,
0.6975512, -0.5306345, 1.735535, 0.6509804, 0, 1, 1,
0.7007754, -0.3547477, 0.8193125, 0.654902, 0, 1, 1,
0.7020035, 0.7298358, 1.250839, 0.6627451, 0, 1, 1,
0.7038683, -0.0824675, 2.802238, 0.6666667, 0, 1, 1,
0.7058164, -1.819068, 1.423024, 0.6745098, 0, 1, 1,
0.7082089, 1.179112, -0.7446957, 0.6784314, 0, 1, 1,
0.7087035, 0.3880004, 0.7858674, 0.6862745, 0, 1, 1,
0.7159423, 1.375684, 2.021221, 0.6901961, 0, 1, 1,
0.7165527, 1.757579, 1.001979, 0.6980392, 0, 1, 1,
0.7178744, 0.7828798, 0.9523366, 0.7058824, 0, 1, 1,
0.7286993, 0.3710224, 1.055189, 0.7098039, 0, 1, 1,
0.7308409, 1.234941, 2.15988, 0.7176471, 0, 1, 1,
0.7338744, -2.105005, 4.257196, 0.7215686, 0, 1, 1,
0.7398522, -0.4278341, 2.212013, 0.7294118, 0, 1, 1,
0.7454455, 0.3611023, 0.07772061, 0.7333333, 0, 1, 1,
0.7508412, 0.7683952, 1.981993, 0.7411765, 0, 1, 1,
0.7525578, -1.248114, 2.588515, 0.7450981, 0, 1, 1,
0.7630738, 0.0268156, 1.232169, 0.7529412, 0, 1, 1,
0.7679011, -0.8303384, 2.120625, 0.7568628, 0, 1, 1,
0.7698981, 0.9874284, -0.9497668, 0.7647059, 0, 1, 1,
0.770054, 1.002422, 0.7179441, 0.7686275, 0, 1, 1,
0.7710159, 0.4876161, 0.8232093, 0.7764706, 0, 1, 1,
0.7737477, 0.4700083, 1.107469, 0.7803922, 0, 1, 1,
0.7759783, 0.3323611, 0.9199499, 0.7882353, 0, 1, 1,
0.7782297, 2.453934, 0.8751109, 0.7921569, 0, 1, 1,
0.7786422, -0.4002523, 2.673137, 0.8, 0, 1, 1,
0.7790094, 1.235707, 0.2771674, 0.8078431, 0, 1, 1,
0.7808415, -0.007080955, 2.699191, 0.8117647, 0, 1, 1,
0.7842231, 1.265226, 0.1607502, 0.8196079, 0, 1, 1,
0.7852003, -0.1895956, 1.835595, 0.8235294, 0, 1, 1,
0.7870468, 2.188768, 0.5585011, 0.8313726, 0, 1, 1,
0.7880911, 1.293608, -0.1644846, 0.8352941, 0, 1, 1,
0.789492, -1.186739, 4.914117, 0.8431373, 0, 1, 1,
0.7908866, -0.5404792, 2.660404, 0.8470588, 0, 1, 1,
0.8026916, 0.5158224, 0.7766497, 0.854902, 0, 1, 1,
0.8094037, -1.068596, 2.480677, 0.8588235, 0, 1, 1,
0.8153698, 0.9501163, 0.07190683, 0.8666667, 0, 1, 1,
0.8158383, -2.81001, 2.87631, 0.8705882, 0, 1, 1,
0.8199217, -1.224927, 3.074172, 0.8784314, 0, 1, 1,
0.827376, -0.7933165, 2.024827, 0.8823529, 0, 1, 1,
0.8310156, 0.5193355, -0.1490988, 0.8901961, 0, 1, 1,
0.836049, 0.06969064, -0.6239113, 0.8941177, 0, 1, 1,
0.8404285, 0.9742798, 1.699642, 0.9019608, 0, 1, 1,
0.8433446, 0.6638463, 2.377095, 0.9098039, 0, 1, 1,
0.8478833, -2.024288, 2.69604, 0.9137255, 0, 1, 1,
0.8482566, -1.167477, 1.884157, 0.9215686, 0, 1, 1,
0.8521159, -1.384153, 2.069851, 0.9254902, 0, 1, 1,
0.8536676, 0.585854, 0.3670417, 0.9333333, 0, 1, 1,
0.8570825, 0.01633212, 1.594697, 0.9372549, 0, 1, 1,
0.8577094, -2.037373, 2.731138, 0.945098, 0, 1, 1,
0.8597721, 3.326684, 1.684989, 0.9490196, 0, 1, 1,
0.863825, -0.2515904, 2.789527, 0.9568627, 0, 1, 1,
0.8649424, -0.2820918, 3.123825, 0.9607843, 0, 1, 1,
0.8665724, -0.04187835, 0.4943316, 0.9686275, 0, 1, 1,
0.86672, 0.06242578, 1.551973, 0.972549, 0, 1, 1,
0.8713092, -0.2526582, 3.414201, 0.9803922, 0, 1, 1,
0.8728484, -1.448988, 2.723693, 0.9843137, 0, 1, 1,
0.8768443, 0.02291261, 1.774866, 0.9921569, 0, 1, 1,
0.8775474, 0.3061092, 0.5112115, 0.9960784, 0, 1, 1,
0.8783658, 1.098962, 0.02979823, 1, 0, 0.9960784, 1,
0.8788605, 0.2766998, 0.649388, 1, 0, 0.9882353, 1,
0.8788817, -0.4087767, 3.042302, 1, 0, 0.9843137, 1,
0.8805841, 0.7210544, 0.6375951, 1, 0, 0.9764706, 1,
0.8825353, -0.8432968, 4.05482, 1, 0, 0.972549, 1,
0.8873546, -2.155576, 3.175965, 1, 0, 0.9647059, 1,
0.9017604, -1.368922, 2.661367, 1, 0, 0.9607843, 1,
0.9032152, 0.394767, 0.5300433, 1, 0, 0.9529412, 1,
0.9093229, -0.102408, 1.913984, 1, 0, 0.9490196, 1,
0.9096565, -0.4902327, 2.55917, 1, 0, 0.9411765, 1,
0.9115263, 0.6927745, -0.2274378, 1, 0, 0.9372549, 1,
0.9174076, 0.05033889, 2.884392, 1, 0, 0.9294118, 1,
0.9198821, -0.2863966, 2.092296, 1, 0, 0.9254902, 1,
0.924327, -1.059374, 2.207549, 1, 0, 0.9176471, 1,
0.9246575, -0.2566729, 3.227476, 1, 0, 0.9137255, 1,
0.9279792, -0.2650018, 2.187029, 1, 0, 0.9058824, 1,
0.9335338, 0.6309119, 0.0419274, 1, 0, 0.9019608, 1,
0.9439386, -0.7155713, 3.328644, 1, 0, 0.8941177, 1,
0.9534906, -0.6534201, 4.353906, 1, 0, 0.8862745, 1,
0.9546748, 1.179125, 1.823419, 1, 0, 0.8823529, 1,
0.9557385, -0.6677883, 0.8676004, 1, 0, 0.8745098, 1,
0.9624196, 1.878213, 0.9978435, 1, 0, 0.8705882, 1,
0.9655901, -0.133256, 1.929288, 1, 0, 0.8627451, 1,
0.9704233, 0.9993517, 0.8465368, 1, 0, 0.8588235, 1,
0.9795035, -0.8731365, 2.055468, 1, 0, 0.8509804, 1,
0.9805605, -1.300251, 2.401648, 1, 0, 0.8470588, 1,
0.9964967, -0.9780783, 0.6113425, 1, 0, 0.8392157, 1,
0.9974128, -0.66302, 2.175514, 1, 0, 0.8352941, 1,
1.008742, 0.2145627, 1.132567, 1, 0, 0.827451, 1,
1.013905, 0.8553455, 0.4012452, 1, 0, 0.8235294, 1,
1.017485, 1.66712, 1.592718, 1, 0, 0.8156863, 1,
1.022013, 0.9783435, 0.8790669, 1, 0, 0.8117647, 1,
1.023715, -0.2362103, 1.29224, 1, 0, 0.8039216, 1,
1.023883, -1.319174, 1.519356, 1, 0, 0.7960784, 1,
1.024405, -1.401473, 2.506381, 1, 0, 0.7921569, 1,
1.026976, 0.9241438, 1.502817, 1, 0, 0.7843137, 1,
1.032722, 0.538649, 0.7576113, 1, 0, 0.7803922, 1,
1.036377, -0.3162445, 2.166169, 1, 0, 0.772549, 1,
1.036847, 0.3044174, 0.608828, 1, 0, 0.7686275, 1,
1.040335, -1.062848, 3.009171, 1, 0, 0.7607843, 1,
1.040788, 0.4189975, 1.196385, 1, 0, 0.7568628, 1,
1.046606, 2.019546, 1.203945, 1, 0, 0.7490196, 1,
1.052833, -1.331054, 0.9763212, 1, 0, 0.7450981, 1,
1.061207, -0.5589495, 1.834861, 1, 0, 0.7372549, 1,
1.06186, 0.348126, 2.018665, 1, 0, 0.7333333, 1,
1.065384, -0.2773246, 2.214395, 1, 0, 0.7254902, 1,
1.077869, -2.648691, 4.192903, 1, 0, 0.7215686, 1,
1.08284, -1.820792, 2.496965, 1, 0, 0.7137255, 1,
1.08527, -0.520962, 1.921412, 1, 0, 0.7098039, 1,
1.092375, -1.218415, 2.665112, 1, 0, 0.7019608, 1,
1.095396, -0.1568528, 1.389648, 1, 0, 0.6941177, 1,
1.10352, 1.62619, 0.5981745, 1, 0, 0.6901961, 1,
1.10421, -1.911078, 2.118253, 1, 0, 0.682353, 1,
1.104742, 0.5474418, 0.8895267, 1, 0, 0.6784314, 1,
1.111482, 0.09011093, 1.194107, 1, 0, 0.6705883, 1,
1.113428, 0.1379373, -0.2606528, 1, 0, 0.6666667, 1,
1.116443, -1.224928, 2.711253, 1, 0, 0.6588235, 1,
1.122033, -1.141292, 1.4505, 1, 0, 0.654902, 1,
1.126141, -0.6333069, 2.169596, 1, 0, 0.6470588, 1,
1.128369, -0.1354004, 1.105899, 1, 0, 0.6431373, 1,
1.12948, 0.9486712, 1.35039, 1, 0, 0.6352941, 1,
1.134397, 0.7130185, -0.6869867, 1, 0, 0.6313726, 1,
1.147601, 0.4798345, -0.130525, 1, 0, 0.6235294, 1,
1.182189, -0.5541055, 4.13051, 1, 0, 0.6196079, 1,
1.201988, -0.412648, 2.434977, 1, 0, 0.6117647, 1,
1.203609, 0.836472, -1.14344, 1, 0, 0.6078432, 1,
1.204769, -0.7000725, 2.540609, 1, 0, 0.6, 1,
1.207996, -0.4078107, 4.032403, 1, 0, 0.5921569, 1,
1.210814, -1.556265, 2.43726, 1, 0, 0.5882353, 1,
1.213917, -0.1185711, 0.4820147, 1, 0, 0.5803922, 1,
1.221576, 0.3491431, 0.5091256, 1, 0, 0.5764706, 1,
1.233746, 0.03140355, 0.9758281, 1, 0, 0.5686275, 1,
1.234173, -1.454576, 1.770249, 1, 0, 0.5647059, 1,
1.236445, -0.0743352, 3.296743, 1, 0, 0.5568628, 1,
1.246253, -0.9118688, 1.504864, 1, 0, 0.5529412, 1,
1.258823, -1.248721, 2.631462, 1, 0, 0.5450981, 1,
1.268543, -1.050519, 3.183184, 1, 0, 0.5411765, 1,
1.273278, -0.5597461, 1.307685, 1, 0, 0.5333334, 1,
1.279149, -0.4750308, 3.381595, 1, 0, 0.5294118, 1,
1.286735, 0.02464218, 1.967727, 1, 0, 0.5215687, 1,
1.289731, -0.1322812, -1.206151, 1, 0, 0.5176471, 1,
1.293646, 1.734848, -0.71048, 1, 0, 0.509804, 1,
1.318958, 2.571528, 0.1480402, 1, 0, 0.5058824, 1,
1.323682, -1.309036, 1.915711, 1, 0, 0.4980392, 1,
1.335616, 0.8343666, 2.410363, 1, 0, 0.4901961, 1,
1.337987, 2.565453, 0.5311584, 1, 0, 0.4862745, 1,
1.33848, 1.628471, 2.507553, 1, 0, 0.4784314, 1,
1.353759, 1.370934, 0.6711536, 1, 0, 0.4745098, 1,
1.37369, 1.312292, 1.726506, 1, 0, 0.4666667, 1,
1.408403, -0.4680057, 2.341983, 1, 0, 0.4627451, 1,
1.409389, -0.5220225, 3.305541, 1, 0, 0.454902, 1,
1.410533, 0.2007642, -0.2179134, 1, 0, 0.4509804, 1,
1.411769, -1.3341, 2.7789, 1, 0, 0.4431373, 1,
1.436498, 0.9275979, -0.3267387, 1, 0, 0.4392157, 1,
1.438707, -1.519995, 2.428015, 1, 0, 0.4313726, 1,
1.466553, 0.7497484, 1.086331, 1, 0, 0.427451, 1,
1.491181, 0.686964, 1.057817, 1, 0, 0.4196078, 1,
1.50216, 0.3034391, 0.3852869, 1, 0, 0.4156863, 1,
1.511719, -1.134339, 2.958003, 1, 0, 0.4078431, 1,
1.513693, -0.4786152, 2.240987, 1, 0, 0.4039216, 1,
1.521654, 0.2767837, 1.591747, 1, 0, 0.3960784, 1,
1.523485, -0.2010943, 1.3659, 1, 0, 0.3882353, 1,
1.535316, 0.7392067, 0.8938132, 1, 0, 0.3843137, 1,
1.53763, 2.078367, 0.2074084, 1, 0, 0.3764706, 1,
1.544981, -0.5113689, 2.860967, 1, 0, 0.372549, 1,
1.548244, 1.01057, 0.94506, 1, 0, 0.3647059, 1,
1.54948, -1.231568, 1.575202, 1, 0, 0.3607843, 1,
1.555733, -1.492634, 1.851242, 1, 0, 0.3529412, 1,
1.58887, -0.800493, 3.01899, 1, 0, 0.3490196, 1,
1.59992, -1.318759, 2.155582, 1, 0, 0.3411765, 1,
1.604696, -0.07297281, 0.0809485, 1, 0, 0.3372549, 1,
1.605389, 0.2291197, 1.190478, 1, 0, 0.3294118, 1,
1.624759, 0.2275437, 0.8636766, 1, 0, 0.3254902, 1,
1.633995, -0.1949087, 1.32146, 1, 0, 0.3176471, 1,
1.639579, -1.362859, 1.980035, 1, 0, 0.3137255, 1,
1.642272, 1.982485, -0.1307509, 1, 0, 0.3058824, 1,
1.661596, 0.6864346, 0.2830371, 1, 0, 0.2980392, 1,
1.669594, 1.323458, 1.078741, 1, 0, 0.2941177, 1,
1.708887, 0.3915074, 2.29702, 1, 0, 0.2862745, 1,
1.709935, 1.587615, 1.681979, 1, 0, 0.282353, 1,
1.718708, -0.07429814, 3.028418, 1, 0, 0.2745098, 1,
1.719941, 2.97004, 0.4960896, 1, 0, 0.2705882, 1,
1.719992, 0.3615932, 2.361393, 1, 0, 0.2627451, 1,
1.727271, -0.6814268, 1.764945, 1, 0, 0.2588235, 1,
1.732162, 1.286246, 1.234768, 1, 0, 0.2509804, 1,
1.742798, 0.388998, 1.676925, 1, 0, 0.2470588, 1,
1.747501, 0.7553754, 0.6139938, 1, 0, 0.2392157, 1,
1.749014, 0.3491005, 0.9731414, 1, 0, 0.2352941, 1,
1.764614, -0.528248, 2.272988, 1, 0, 0.227451, 1,
1.788568, 0.6412056, 0.4751442, 1, 0, 0.2235294, 1,
1.810471, -0.7732038, 2.332613, 1, 0, 0.2156863, 1,
1.811611, 0.7070035, 2.08843, 1, 0, 0.2117647, 1,
1.823567, -0.9475462, 3.581151, 1, 0, 0.2039216, 1,
1.831087, -0.583275, 2.327502, 1, 0, 0.1960784, 1,
1.848394, -0.05473224, 2.657558, 1, 0, 0.1921569, 1,
1.856158, 0.644397, 1.874661, 1, 0, 0.1843137, 1,
1.877399, 1.256011, -0.6044985, 1, 0, 0.1803922, 1,
1.894466, 0.1426039, 1.278361, 1, 0, 0.172549, 1,
1.895351, 0.8440451, 2.350138, 1, 0, 0.1686275, 1,
1.896134, -0.6310021, 1.111468, 1, 0, 0.1607843, 1,
1.89828, 0.2083792, 1.663666, 1, 0, 0.1568628, 1,
1.911247, 0.1873556, 2.340023, 1, 0, 0.1490196, 1,
1.912633, -0.2352516, 1.570689, 1, 0, 0.145098, 1,
1.913081, -0.2026979, 3.694088, 1, 0, 0.1372549, 1,
1.931614, 1.1923, 0.1834349, 1, 0, 0.1333333, 1,
1.932623, -1.810701, 0.1677888, 1, 0, 0.1254902, 1,
1.954561, 0.3647408, 1.649249, 1, 0, 0.1215686, 1,
1.967188, -1.222297, 1.7878, 1, 0, 0.1137255, 1,
1.968617, -1.109541, 2.90107, 1, 0, 0.1098039, 1,
1.984932, 2.075418, -1.193651, 1, 0, 0.1019608, 1,
1.986322, -1.13635, 2.765088, 1, 0, 0.09411765, 1,
1.996214, -0.3791143, 1.237981, 1, 0, 0.09019608, 1,
2.002679, -0.6930701, 2.490295, 1, 0, 0.08235294, 1,
2.018682, -0.5550048, 1.893667, 1, 0, 0.07843138, 1,
2.025809, 0.9620187, 1.310677, 1, 0, 0.07058824, 1,
2.048913, -0.5239218, 3.465997, 1, 0, 0.06666667, 1,
2.087716, -0.9122659, 2.10813, 1, 0, 0.05882353, 1,
2.101448, 0.420656, 1.19185, 1, 0, 0.05490196, 1,
2.101551, 0.9442235, 1.425529, 1, 0, 0.04705882, 1,
2.11253, 0.5462692, -2.303723, 1, 0, 0.04313726, 1,
2.114473, 0.5581017, -0.9154523, 1, 0, 0.03529412, 1,
2.134874, 0.7491616, 1.62203, 1, 0, 0.03137255, 1,
2.222991, 1.001166, 0.03034354, 1, 0, 0.02352941, 1,
2.280151, 0.7811316, 3.036762, 1, 0, 0.01960784, 1,
2.388937, -1.202729, 2.573637, 1, 0, 0.01176471, 1,
2.865442, 0.389942, 2.287231, 1, 0, 0.007843138, 1
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
-0.3628547, -3.85018, -6.818593, 0, -0.5, 0.5, 0.5,
-0.3628547, -3.85018, -6.818593, 1, -0.5, 0.5, 0.5,
-0.3628547, -3.85018, -6.818593, 1, 1.5, 0.5, 0.5,
-0.3628547, -3.85018, -6.818593, 0, 1.5, 0.5, 0.5
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
-4.685544, 0.2583369, -6.818593, 0, -0.5, 0.5, 0.5,
-4.685544, 0.2583369, -6.818593, 1, -0.5, 0.5, 0.5,
-4.685544, 0.2583369, -6.818593, 1, 1.5, 0.5, 0.5,
-4.685544, 0.2583369, -6.818593, 0, 1.5, 0.5, 0.5
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
-4.685544, -3.85018, 0.05663133, 0, -0.5, 0.5, 0.5,
-4.685544, -3.85018, 0.05663133, 1, -0.5, 0.5, 0.5,
-4.685544, -3.85018, 0.05663133, 1, 1.5, 0.5, 0.5,
-4.685544, -3.85018, 0.05663133, 0, 1.5, 0.5, 0.5
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
-3, -2.902061, -5.232003,
2, -2.902061, -5.232003,
-3, -2.902061, -5.232003,
-3, -3.060081, -5.496434,
-2, -2.902061, -5.232003,
-2, -3.060081, -5.496434,
-1, -2.902061, -5.232003,
-1, -3.060081, -5.496434,
0, -2.902061, -5.232003,
0, -3.060081, -5.496434,
1, -2.902061, -5.232003,
1, -3.060081, -5.496434,
2, -2.902061, -5.232003,
2, -3.060081, -5.496434
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
-3, -3.37612, -6.025298, 0, -0.5, 0.5, 0.5,
-3, -3.37612, -6.025298, 1, -0.5, 0.5, 0.5,
-3, -3.37612, -6.025298, 1, 1.5, 0.5, 0.5,
-3, -3.37612, -6.025298, 0, 1.5, 0.5, 0.5,
-2, -3.37612, -6.025298, 0, -0.5, 0.5, 0.5,
-2, -3.37612, -6.025298, 1, -0.5, 0.5, 0.5,
-2, -3.37612, -6.025298, 1, 1.5, 0.5, 0.5,
-2, -3.37612, -6.025298, 0, 1.5, 0.5, 0.5,
-1, -3.37612, -6.025298, 0, -0.5, 0.5, 0.5,
-1, -3.37612, -6.025298, 1, -0.5, 0.5, 0.5,
-1, -3.37612, -6.025298, 1, 1.5, 0.5, 0.5,
-1, -3.37612, -6.025298, 0, 1.5, 0.5, 0.5,
0, -3.37612, -6.025298, 0, -0.5, 0.5, 0.5,
0, -3.37612, -6.025298, 1, -0.5, 0.5, 0.5,
0, -3.37612, -6.025298, 1, 1.5, 0.5, 0.5,
0, -3.37612, -6.025298, 0, 1.5, 0.5, 0.5,
1, -3.37612, -6.025298, 0, -0.5, 0.5, 0.5,
1, -3.37612, -6.025298, 1, -0.5, 0.5, 0.5,
1, -3.37612, -6.025298, 1, 1.5, 0.5, 0.5,
1, -3.37612, -6.025298, 0, 1.5, 0.5, 0.5,
2, -3.37612, -6.025298, 0, -0.5, 0.5, 0.5,
2, -3.37612, -6.025298, 1, -0.5, 0.5, 0.5,
2, -3.37612, -6.025298, 1, 1.5, 0.5, 0.5,
2, -3.37612, -6.025298, 0, 1.5, 0.5, 0.5
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
-3.688001, -2, -5.232003,
-3.688001, 3, -5.232003,
-3.688001, -2, -5.232003,
-3.854258, -2, -5.496434,
-3.688001, -1, -5.232003,
-3.854258, -1, -5.496434,
-3.688001, 0, -5.232003,
-3.854258, 0, -5.496434,
-3.688001, 1, -5.232003,
-3.854258, 1, -5.496434,
-3.688001, 2, -5.232003,
-3.854258, 2, -5.496434,
-3.688001, 3, -5.232003,
-3.854258, 3, -5.496434
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
-4.186772, -2, -6.025298, 0, -0.5, 0.5, 0.5,
-4.186772, -2, -6.025298, 1, -0.5, 0.5, 0.5,
-4.186772, -2, -6.025298, 1, 1.5, 0.5, 0.5,
-4.186772, -2, -6.025298, 0, 1.5, 0.5, 0.5,
-4.186772, -1, -6.025298, 0, -0.5, 0.5, 0.5,
-4.186772, -1, -6.025298, 1, -0.5, 0.5, 0.5,
-4.186772, -1, -6.025298, 1, 1.5, 0.5, 0.5,
-4.186772, -1, -6.025298, 0, 1.5, 0.5, 0.5,
-4.186772, 0, -6.025298, 0, -0.5, 0.5, 0.5,
-4.186772, 0, -6.025298, 1, -0.5, 0.5, 0.5,
-4.186772, 0, -6.025298, 1, 1.5, 0.5, 0.5,
-4.186772, 0, -6.025298, 0, 1.5, 0.5, 0.5,
-4.186772, 1, -6.025298, 0, -0.5, 0.5, 0.5,
-4.186772, 1, -6.025298, 1, -0.5, 0.5, 0.5,
-4.186772, 1, -6.025298, 1, 1.5, 0.5, 0.5,
-4.186772, 1, -6.025298, 0, 1.5, 0.5, 0.5,
-4.186772, 2, -6.025298, 0, -0.5, 0.5, 0.5,
-4.186772, 2, -6.025298, 1, -0.5, 0.5, 0.5,
-4.186772, 2, -6.025298, 1, 1.5, 0.5, 0.5,
-4.186772, 2, -6.025298, 0, 1.5, 0.5, 0.5,
-4.186772, 3, -6.025298, 0, -0.5, 0.5, 0.5,
-4.186772, 3, -6.025298, 1, -0.5, 0.5, 0.5,
-4.186772, 3, -6.025298, 1, 1.5, 0.5, 0.5,
-4.186772, 3, -6.025298, 0, 1.5, 0.5, 0.5
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
-3.688001, -2.902061, -4,
-3.688001, -2.902061, 4,
-3.688001, -2.902061, -4,
-3.854258, -3.060081, -4,
-3.688001, -2.902061, -2,
-3.854258, -3.060081, -2,
-3.688001, -2.902061, 0,
-3.854258, -3.060081, 0,
-3.688001, -2.902061, 2,
-3.854258, -3.060081, 2,
-3.688001, -2.902061, 4,
-3.854258, -3.060081, 4
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
-4.186772, -3.37612, -4, 0, -0.5, 0.5, 0.5,
-4.186772, -3.37612, -4, 1, -0.5, 0.5, 0.5,
-4.186772, -3.37612, -4, 1, 1.5, 0.5, 0.5,
-4.186772, -3.37612, -4, 0, 1.5, 0.5, 0.5,
-4.186772, -3.37612, -2, 0, -0.5, 0.5, 0.5,
-4.186772, -3.37612, -2, 1, -0.5, 0.5, 0.5,
-4.186772, -3.37612, -2, 1, 1.5, 0.5, 0.5,
-4.186772, -3.37612, -2, 0, 1.5, 0.5, 0.5,
-4.186772, -3.37612, 0, 0, -0.5, 0.5, 0.5,
-4.186772, -3.37612, 0, 1, -0.5, 0.5, 0.5,
-4.186772, -3.37612, 0, 1, 1.5, 0.5, 0.5,
-4.186772, -3.37612, 0, 0, 1.5, 0.5, 0.5,
-4.186772, -3.37612, 2, 0, -0.5, 0.5, 0.5,
-4.186772, -3.37612, 2, 1, -0.5, 0.5, 0.5,
-4.186772, -3.37612, 2, 1, 1.5, 0.5, 0.5,
-4.186772, -3.37612, 2, 0, 1.5, 0.5, 0.5,
-4.186772, -3.37612, 4, 0, -0.5, 0.5, 0.5,
-4.186772, -3.37612, 4, 1, -0.5, 0.5, 0.5,
-4.186772, -3.37612, 4, 1, 1.5, 0.5, 0.5,
-4.186772, -3.37612, 4, 0, 1.5, 0.5, 0.5
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
-3.688001, -2.902061, -5.232003,
-3.688001, 3.418734, -5.232003,
-3.688001, -2.902061, 5.345265,
-3.688001, 3.418734, 5.345265,
-3.688001, -2.902061, -5.232003,
-3.688001, -2.902061, 5.345265,
-3.688001, 3.418734, -5.232003,
-3.688001, 3.418734, 5.345265,
-3.688001, -2.902061, -5.232003,
2.962291, -2.902061, -5.232003,
-3.688001, -2.902061, 5.345265,
2.962291, -2.902061, 5.345265,
-3.688001, 3.418734, -5.232003,
2.962291, 3.418734, -5.232003,
-3.688001, 3.418734, 5.345265,
2.962291, 3.418734, 5.345265,
2.962291, -2.902061, -5.232003,
2.962291, 3.418734, -5.232003,
2.962291, -2.902061, 5.345265,
2.962291, 3.418734, 5.345265,
2.962291, -2.902061, -5.232003,
2.962291, -2.902061, 5.345265,
2.962291, 3.418734, -5.232003,
2.962291, 3.418734, 5.345265
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
var radius = 7.476823;
var distance = 33.26523;
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
mvMatrix.translate( 0.3628547, -0.2583369, -0.05663133 );
mvMatrix.scale( 1.215599, 1.278967, 0.7642888 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.26523);
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
Dibenzoylperoxid<-read.table("Dibenzoylperoxid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dibenzoylperoxid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dibenzoylperoxid' not found
```

```r
y<-Dibenzoylperoxid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dibenzoylperoxid' not found
```

```r
z<-Dibenzoylperoxid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dibenzoylperoxid' not found
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
-3.591152, -0.1374077, -2.879288, 0, 0, 1, 1, 1,
-3.217492, 0.123579, -2.292818, 1, 0, 0, 1, 1,
-2.980386, -0.06087292, -0.8479506, 1, 0, 0, 1, 1,
-2.900608, 0.3342929, -0.7935146, 1, 0, 0, 1, 1,
-2.62347, -1.390639, -0.2639303, 1, 0, 0, 1, 1,
-2.550155, 1.351558, 0.2817065, 1, 0, 0, 1, 1,
-2.536912, 0.8876388, -2.133889, 0, 0, 0, 1, 1,
-2.534231, 0.985373, -0.8901315, 0, 0, 0, 1, 1,
-2.468996, 0.8980435, -0.6564888, 0, 0, 0, 1, 1,
-2.45274, -0.4323733, -0.618031, 0, 0, 0, 1, 1,
-2.439913, 0.4028521, -1.950162, 0, 0, 0, 1, 1,
-2.431817, 0.02789031, -2.022431, 0, 0, 0, 1, 1,
-2.422747, 0.5103946, -1.657697, 0, 0, 0, 1, 1,
-2.411939, 1.398954, -0.1218883, 1, 1, 1, 1, 1,
-2.387617, 0.9888909, -0.8901941, 1, 1, 1, 1, 1,
-2.375135, -1.316057, -3.022068, 1, 1, 1, 1, 1,
-2.354943, 1.340375, -1.497231, 1, 1, 1, 1, 1,
-2.341198, -0.813405, -2.306569, 1, 1, 1, 1, 1,
-2.338963, -0.07280571, -2.976645, 1, 1, 1, 1, 1,
-2.33678, 2.099288, -1.888514, 1, 1, 1, 1, 1,
-2.324316, 0.4596471, 0.7819757, 1, 1, 1, 1, 1,
-2.258028, -0.5037342, -1.973907, 1, 1, 1, 1, 1,
-2.232285, 0.5727377, -0.5222796, 1, 1, 1, 1, 1,
-2.205155, -0.212066, -2.711398, 1, 1, 1, 1, 1,
-2.163608, -1.131206, -0.6870165, 1, 1, 1, 1, 1,
-2.153111, 1.006763, -1.030112, 1, 1, 1, 1, 1,
-2.146919, 1.389957, -0.3801335, 1, 1, 1, 1, 1,
-2.096848, -0.4086325, -1.137551, 1, 1, 1, 1, 1,
-2.089865, -0.2599877, -0.3888203, 0, 0, 1, 1, 1,
-2.014911, -0.2305757, -1.63257, 1, 0, 0, 1, 1,
-2.010618, 1.747357, -0.5355093, 1, 0, 0, 1, 1,
-2.006267, 1.511623, -2.650755, 1, 0, 0, 1, 1,
-1.962672, 0.607537, -1.070551, 1, 0, 0, 1, 1,
-1.916294, -1.815181, -2.713853, 1, 0, 0, 1, 1,
-1.903236, -0.005375136, -1.932662, 0, 0, 0, 1, 1,
-1.879341, -1.552434, -5.077965, 0, 0, 0, 1, 1,
-1.878061, 1.857579, -0.8170807, 0, 0, 0, 1, 1,
-1.864698, 1.296142, -3.508357, 0, 0, 0, 1, 1,
-1.85316, 0.5795325, -3.738881, 0, 0, 0, 1, 1,
-1.829455, -0.9975675, 0.0106439, 0, 0, 0, 1, 1,
-1.824013, -0.9371578, -2.095956, 0, 0, 0, 1, 1,
-1.80317, 1.872322, 0.3466355, 1, 1, 1, 1, 1,
-1.756943, 0.1011596, -0.8934669, 1, 1, 1, 1, 1,
-1.753174, 0.5146706, -1.008479, 1, 1, 1, 1, 1,
-1.739213, 0.788242, -1.29739, 1, 1, 1, 1, 1,
-1.733406, -0.0622163, -2.615202, 1, 1, 1, 1, 1,
-1.679853, 1.945505, -1.822893, 1, 1, 1, 1, 1,
-1.674489, -0.2171234, -2.203743, 1, 1, 1, 1, 1,
-1.667595, 1.552893, -2.001827, 1, 1, 1, 1, 1,
-1.65419, -0.5470234, -0.3135125, 1, 1, 1, 1, 1,
-1.637847, -0.765008, -2.678067, 1, 1, 1, 1, 1,
-1.628691, -0.4815597, -1.232045, 1, 1, 1, 1, 1,
-1.613997, -0.8856807, -1.166128, 1, 1, 1, 1, 1,
-1.586762, 1.830796, 0.1234943, 1, 1, 1, 1, 1,
-1.577317, -2.283832, -0.3027084, 1, 1, 1, 1, 1,
-1.570056, -0.6650071, -1.238164, 1, 1, 1, 1, 1,
-1.566658, 1.064224, -0.7260941, 0, 0, 1, 1, 1,
-1.562522, 0.7091333, -0.9807762, 1, 0, 0, 1, 1,
-1.562315, 0.4675507, -2.631064, 1, 0, 0, 1, 1,
-1.533839, 0.8499317, 0.9618285, 1, 0, 0, 1, 1,
-1.529385, -0.1215097, -0.6192502, 1, 0, 0, 1, 1,
-1.52835, -0.2383996, -1.611264, 1, 0, 0, 1, 1,
-1.524263, 1.334164, -1.904966, 0, 0, 0, 1, 1,
-1.522873, -0.5688237, -1.871956, 0, 0, 0, 1, 1,
-1.517104, 0.3603148, -0.5988204, 0, 0, 0, 1, 1,
-1.516532, 1.040223, 0.3476979, 0, 0, 0, 1, 1,
-1.509197, 0.7669131, -0.5152107, 0, 0, 0, 1, 1,
-1.475164, -2.669132, -2.469762, 0, 0, 0, 1, 1,
-1.451237, -1.769249, -2.700313, 0, 0, 0, 1, 1,
-1.451193, -0.9061296, -3.915509, 1, 1, 1, 1, 1,
-1.444052, -0.341547, -0.4693307, 1, 1, 1, 1, 1,
-1.439663, 0.06740201, -2.562323, 1, 1, 1, 1, 1,
-1.432096, 0.4927597, -1.820502, 1, 1, 1, 1, 1,
-1.425433, -0.5698944, -2.295807, 1, 1, 1, 1, 1,
-1.419539, -1.493276, -2.644688, 1, 1, 1, 1, 1,
-1.415747, 0.3172239, -1.156591, 1, 1, 1, 1, 1,
-1.412717, -0.5106987, -1.996898, 1, 1, 1, 1, 1,
-1.406159, -0.4136918, -3.186388, 1, 1, 1, 1, 1,
-1.404729, 1.415258, -0.2219803, 1, 1, 1, 1, 1,
-1.394529, -0.05147504, -1.448771, 1, 1, 1, 1, 1,
-1.38803, -0.9671866, -2.833643, 1, 1, 1, 1, 1,
-1.384286, 0.4885679, -2.434013, 1, 1, 1, 1, 1,
-1.370754, 1.367615, -2.410655, 1, 1, 1, 1, 1,
-1.361139, 1.140874, -1.037158, 1, 1, 1, 1, 1,
-1.35778, 0.467997, -0.3029094, 0, 0, 1, 1, 1,
-1.354087, 1.110665, -0.2102441, 1, 0, 0, 1, 1,
-1.35392, 0.4334327, -2.254899, 1, 0, 0, 1, 1,
-1.344101, -0.6433737, -3.950673, 1, 0, 0, 1, 1,
-1.33122, 0.2070697, 0.05412969, 1, 0, 0, 1, 1,
-1.331204, 0.9000174, -0.5476238, 1, 0, 0, 1, 1,
-1.329014, 0.3705155, -1.493407, 0, 0, 0, 1, 1,
-1.317868, 1.164366, -3.35242, 0, 0, 0, 1, 1,
-1.311747, 0.3762075, -2.375387, 0, 0, 0, 1, 1,
-1.309831, 0.2040173, 1.136029, 0, 0, 0, 1, 1,
-1.30977, -0.2099227, -1.065771, 0, 0, 0, 1, 1,
-1.303895, -2.431995, -1.959671, 0, 0, 0, 1, 1,
-1.300832, -1.053963, -2.86042, 0, 0, 0, 1, 1,
-1.298269, -1.40403, -2.779361, 1, 1, 1, 1, 1,
-1.296688, 0.4981393, -2.898565, 1, 1, 1, 1, 1,
-1.291147, -0.6466398, -2.756736, 1, 1, 1, 1, 1,
-1.288853, 0.9297711, -0.1977127, 1, 1, 1, 1, 1,
-1.272516, -0.8243429, -1.72387, 1, 1, 1, 1, 1,
-1.267523, 0.603613, 0.3029738, 1, 1, 1, 1, 1,
-1.261105, 1.044239, -1.386165, 1, 1, 1, 1, 1,
-1.246441, 0.01587703, -1.030947, 1, 1, 1, 1, 1,
-1.23197, -0.2281627, -0.1654731, 1, 1, 1, 1, 1,
-1.225955, -0.4010639, -0.5804337, 1, 1, 1, 1, 1,
-1.225506, 0.4382963, -1.290766, 1, 1, 1, 1, 1,
-1.213362, 0.3997625, -1.33808, 1, 1, 1, 1, 1,
-1.195019, -0.8331093, -2.46964, 1, 1, 1, 1, 1,
-1.194039, 1.189036, -1.121579, 1, 1, 1, 1, 1,
-1.193458, 0.4390108, -0.2707096, 1, 1, 1, 1, 1,
-1.188835, 0.3298672, -2.081369, 0, 0, 1, 1, 1,
-1.185421, 1.080043, -0.9001244, 1, 0, 0, 1, 1,
-1.185198, -0.2847816, -0.4643587, 1, 0, 0, 1, 1,
-1.181419, -0.3485855, -1.74469, 1, 0, 0, 1, 1,
-1.16605, 0.2401765, -0.7753578, 1, 0, 0, 1, 1,
-1.16145, -0.7746624, -2.051033, 1, 0, 0, 1, 1,
-1.155593, -0.1601231, -2.165281, 0, 0, 0, 1, 1,
-1.153465, -1.037246, -1.997929, 0, 0, 0, 1, 1,
-1.150038, 0.495322, -1.55432, 0, 0, 0, 1, 1,
-1.140454, 0.3916714, -1.58772, 0, 0, 0, 1, 1,
-1.140123, -0.5551374, -1.703509, 0, 0, 0, 1, 1,
-1.137439, -1.862075, -1.682023, 0, 0, 0, 1, 1,
-1.135326, -0.6335052, -1.629892, 0, 0, 0, 1, 1,
-1.129026, 0.3119552, 0.07954109, 1, 1, 1, 1, 1,
-1.111028, -0.3156113, -0.8854627, 1, 1, 1, 1, 1,
-1.1048, 1.081741, -1.612606, 1, 1, 1, 1, 1,
-1.103292, 0.3023196, -0.335518, 1, 1, 1, 1, 1,
-1.10247, 0.7861648, -0.1012943, 1, 1, 1, 1, 1,
-1.097981, -0.7982163, -1.004778, 1, 1, 1, 1, 1,
-1.097494, 0.1013443, -1.308512, 1, 1, 1, 1, 1,
-1.090346, 0.02291808, 0.3077375, 1, 1, 1, 1, 1,
-1.090073, -1.039023, -2.440969, 1, 1, 1, 1, 1,
-1.078697, -1.324557, -3.781523, 1, 1, 1, 1, 1,
-1.07102, 0.8626565, -2.738861, 1, 1, 1, 1, 1,
-1.062722, 0.2099193, -1.465821, 1, 1, 1, 1, 1,
-1.062167, 1.302706, -2.891385, 1, 1, 1, 1, 1,
-1.061787, -0.4042325, -1.556742, 1, 1, 1, 1, 1,
-1.056884, -1.464954, -3.498566, 1, 1, 1, 1, 1,
-1.052439, 0.5172978, -1.215598, 0, 0, 1, 1, 1,
-1.047516, -1.523905, -3.682906, 1, 0, 0, 1, 1,
-1.044475, 1.571666, -1.063118, 1, 0, 0, 1, 1,
-1.043893, -0.8034623, -1.881501, 1, 0, 0, 1, 1,
-1.040717, 0.2158911, -2.254738, 1, 0, 0, 1, 1,
-1.037867, -0.1856433, -1.078984, 1, 0, 0, 1, 1,
-1.037263, -0.8750723, -1.626841, 0, 0, 0, 1, 1,
-1.030711, -0.2383628, -3.536907, 0, 0, 0, 1, 1,
-1.029464, 0.7371702, 1.038389, 0, 0, 0, 1, 1,
-1.023688, -1.503968, -2.33891, 0, 0, 0, 1, 1,
-1.021883, -1.00447, -2.426713, 0, 0, 0, 1, 1,
-1.01845, 1.204232, -0.9185413, 0, 0, 0, 1, 1,
-1.014416, 0.2814305, -1.288793, 0, 0, 0, 1, 1,
-1.001916, -0.522573, -1.715974, 1, 1, 1, 1, 1,
-0.9922344, -0.6961414, -1.872631, 1, 1, 1, 1, 1,
-0.9833531, 0.5062873, -1.662395, 1, 1, 1, 1, 1,
-0.9795067, 0.5661585, 0.4319422, 1, 1, 1, 1, 1,
-0.9637989, -2.568257, -3.817853, 1, 1, 1, 1, 1,
-0.954507, 0.1451305, -1.955512, 1, 1, 1, 1, 1,
-0.9543172, 0.001712211, -1.121449, 1, 1, 1, 1, 1,
-0.9482995, 0.5150574, -0.5858674, 1, 1, 1, 1, 1,
-0.9473295, -0.3282833, -1.108895, 1, 1, 1, 1, 1,
-0.9459532, 0.7484347, -2.656116, 1, 1, 1, 1, 1,
-0.945335, 0.4389743, 0.1594466, 1, 1, 1, 1, 1,
-0.9448486, -0.4460957, -2.569691, 1, 1, 1, 1, 1,
-0.9415673, 0.4729856, -1.379226, 1, 1, 1, 1, 1,
-0.9411187, -2.24026, -4.317579, 1, 1, 1, 1, 1,
-0.9394317, 1.119731, 0.7365112, 1, 1, 1, 1, 1,
-0.9390317, -1.679741, -1.834454, 0, 0, 1, 1, 1,
-0.9386114, 0.3889486, 0.1470352, 1, 0, 0, 1, 1,
-0.937776, -0.2270151, -0.7332221, 1, 0, 0, 1, 1,
-0.937488, -0.5972758, -3.210068, 1, 0, 0, 1, 1,
-0.9364742, 1.609985, -1.00031, 1, 0, 0, 1, 1,
-0.9322276, -0.9358789, -1.884912, 1, 0, 0, 1, 1,
-0.930831, -0.3952236, -1.606164, 0, 0, 0, 1, 1,
-0.9270059, -0.9866226, -2.879767, 0, 0, 0, 1, 1,
-0.9263071, 1.766814, -1.55161, 0, 0, 0, 1, 1,
-0.9215728, 0.3081193, 0.1552196, 0, 0, 0, 1, 1,
-0.9193933, -0.2033215, -2.203062, 0, 0, 0, 1, 1,
-0.9187248, 0.7520854, -0.8073839, 0, 0, 0, 1, 1,
-0.9117968, 0.6647286, 1.355349, 0, 0, 0, 1, 1,
-0.9113664, 1.202166, 0.04996138, 1, 1, 1, 1, 1,
-0.8974714, -1.602121, -3.455563, 1, 1, 1, 1, 1,
-0.8963453, 2.08112, 0.9369942, 1, 1, 1, 1, 1,
-0.896163, 0.8075046, -0.9793994, 1, 1, 1, 1, 1,
-0.8935509, -0.04100517, -0.3887975, 1, 1, 1, 1, 1,
-0.8927009, -0.1874591, -1.813566, 1, 1, 1, 1, 1,
-0.8905117, 0.136615, -1.884426, 1, 1, 1, 1, 1,
-0.8903651, -0.446119, 0.1498686, 1, 1, 1, 1, 1,
-0.8827761, -0.5201166, -2.136112, 1, 1, 1, 1, 1,
-0.876417, -0.4044697, -2.53715, 1, 1, 1, 1, 1,
-0.8682688, 1.10858, -1.311217, 1, 1, 1, 1, 1,
-0.8591076, -1.129428, -2.100663, 1, 1, 1, 1, 1,
-0.8576792, 1.781033, 0.03362413, 1, 1, 1, 1, 1,
-0.8574835, -0.4944742, -2.976564, 1, 1, 1, 1, 1,
-0.853019, 0.1311888, -1.972466, 1, 1, 1, 1, 1,
-0.8484553, 0.2066286, -4.475147, 0, 0, 1, 1, 1,
-0.8413002, 0.4193995, -0.5903444, 1, 0, 0, 1, 1,
-0.8403703, 1.026144, -0.04789892, 1, 0, 0, 1, 1,
-0.8393216, -1.922419, -1.637194, 1, 0, 0, 1, 1,
-0.8353519, -0.4413835, -3.477244, 1, 0, 0, 1, 1,
-0.825561, 1.648085, -0.1782139, 1, 0, 0, 1, 1,
-0.8251482, 0.509921, -1.764682, 0, 0, 0, 1, 1,
-0.8191361, -0.09598705, -1.537623, 0, 0, 0, 1, 1,
-0.8147113, -1.496581, -4.09931, 0, 0, 0, 1, 1,
-0.8116544, -0.3691684, -2.187368, 0, 0, 0, 1, 1,
-0.8115679, 0.8083666, -0.8253706, 0, 0, 0, 1, 1,
-0.8111697, 0.5183219, 0.4497442, 0, 0, 0, 1, 1,
-0.8098971, 0.5650696, -1.529829, 0, 0, 0, 1, 1,
-0.8082105, 1.892046, -0.1482913, 1, 1, 1, 1, 1,
-0.8079432, 0.7808189, -1.283078, 1, 1, 1, 1, 1,
-0.8025876, -0.1833091, -1.374761, 1, 1, 1, 1, 1,
-0.7886894, 1.356983, 0.7536616, 1, 1, 1, 1, 1,
-0.7772637, 0.5636531, 0.3750286, 1, 1, 1, 1, 1,
-0.7756286, 0.2783032, -2.103626, 1, 1, 1, 1, 1,
-0.7705451, 0.4717225, 0.3437749, 1, 1, 1, 1, 1,
-0.7702536, 2.28031, -0.1345101, 1, 1, 1, 1, 1,
-0.7695372, 0.3093626, -1.410125, 1, 1, 1, 1, 1,
-0.766033, -1.246033, -2.665066, 1, 1, 1, 1, 1,
-0.7635213, 0.5331256, -1.626038, 1, 1, 1, 1, 1,
-0.7612414, 1.754284, 0.8241647, 1, 1, 1, 1, 1,
-0.7601857, -0.6145015, -2.952496, 1, 1, 1, 1, 1,
-0.7562681, -1.125765, -4.545031, 1, 1, 1, 1, 1,
-0.7538526, 0.283811, 0.2302358, 1, 1, 1, 1, 1,
-0.7509402, 1.554994, 0.2963127, 0, 0, 1, 1, 1,
-0.7478403, 0.8407885, -2.470582, 1, 0, 0, 1, 1,
-0.7477955, 1.13083, -1.088318, 1, 0, 0, 1, 1,
-0.746235, 0.1658908, -0.8909084, 1, 0, 0, 1, 1,
-0.7446895, 0.4181403, 0.4137911, 1, 0, 0, 1, 1,
-0.7427265, 0.999899, -0.3586586, 1, 0, 0, 1, 1,
-0.7417784, 0.796607, -0.8159419, 0, 0, 0, 1, 1,
-0.740949, 0.5323259, -1.860999, 0, 0, 0, 1, 1,
-0.7375578, -0.5581053, -2.612239, 0, 0, 0, 1, 1,
-0.736722, 1.716722, -1.722395, 0, 0, 0, 1, 1,
-0.7364493, 0.136741, -1.236935, 0, 0, 0, 1, 1,
-0.7333574, 0.4557175, 0.07427853, 0, 0, 0, 1, 1,
-0.7325009, 1.860992, -0.9140449, 0, 0, 0, 1, 1,
-0.7230133, 0.08821296, -2.543184, 1, 1, 1, 1, 1,
-0.7173368, 1.263207, -0.5920595, 1, 1, 1, 1, 1,
-0.7119348, 0.7859071, -1.780142, 1, 1, 1, 1, 1,
-0.7105464, 0.5137008, -2.28272, 1, 1, 1, 1, 1,
-0.7086444, -0.186909, -1.008291, 1, 1, 1, 1, 1,
-0.7051656, -2.290155, -2.092186, 1, 1, 1, 1, 1,
-0.6983719, -0.3948281, -2.412816, 1, 1, 1, 1, 1,
-0.6914997, -0.005685914, -0.07428227, 1, 1, 1, 1, 1,
-0.6889776, 0.5786929, -1.753292, 1, 1, 1, 1, 1,
-0.6875442, 0.932043, -1.06518, 1, 1, 1, 1, 1,
-0.6843343, -0.415076, -2.614273, 1, 1, 1, 1, 1,
-0.6842026, 0.4223626, -1.29588, 1, 1, 1, 1, 1,
-0.6797933, -0.2398968, -1.890187, 1, 1, 1, 1, 1,
-0.6778186, -0.04454768, -1.446779, 1, 1, 1, 1, 1,
-0.6777697, -0.536591, -1.461929, 1, 1, 1, 1, 1,
-0.6771341, 1.077751, -0.5525997, 0, 0, 1, 1, 1,
-0.6707823, 1.453105, 0.3458525, 1, 0, 0, 1, 1,
-0.6692582, 2.109836, 0.02830569, 1, 0, 0, 1, 1,
-0.6689949, 1.902231, -1.108269, 1, 0, 0, 1, 1,
-0.6687067, -2.1519, -3.660522, 1, 0, 0, 1, 1,
-0.6662522, 1.268473, -0.3128189, 1, 0, 0, 1, 1,
-0.6656961, 0.7861021, -1.259881, 0, 0, 0, 1, 1,
-0.6612389, 0.1163827, -1.789366, 0, 0, 0, 1, 1,
-0.6607743, -0.9034172, -3.480999, 0, 0, 0, 1, 1,
-0.6607734, -0.9305837, -3.56547, 0, 0, 0, 1, 1,
-0.6606746, -0.7397997, -2.236219, 0, 0, 0, 1, 1,
-0.6594499, -0.6199737, -2.443532, 0, 0, 0, 1, 1,
-0.6561854, -0.8445291, -0.3420623, 0, 0, 0, 1, 1,
-0.6558238, 0.1616108, 1.589124, 1, 1, 1, 1, 1,
-0.6460814, -0.7131129, -3.494797, 1, 1, 1, 1, 1,
-0.636762, -0.2280386, -0.7621349, 1, 1, 1, 1, 1,
-0.6360983, 0.8843161, -0.7399622, 1, 1, 1, 1, 1,
-0.6350241, 0.9144599, -2.223652, 1, 1, 1, 1, 1,
-0.6332558, -0.1980543, -1.932495, 1, 1, 1, 1, 1,
-0.6311575, 0.2253736, -1.309959, 1, 1, 1, 1, 1,
-0.6298237, -0.8520524, -3.834339, 1, 1, 1, 1, 1,
-0.6240356, -0.7848258, -2.200875, 1, 1, 1, 1, 1,
-0.6220399, 0.6121348, -0.3853391, 1, 1, 1, 1, 1,
-0.6214663, -1.12866, -2.683763, 1, 1, 1, 1, 1,
-0.6124262, 0.4039764, -2.594103, 1, 1, 1, 1, 1,
-0.6058927, 0.4332404, -1.588978, 1, 1, 1, 1, 1,
-0.601909, 0.9464093, 1.165944, 1, 1, 1, 1, 1,
-0.6017522, -0.4964345, -1.428984, 1, 1, 1, 1, 1,
-0.6013177, -1.617468, -3.227506, 0, 0, 1, 1, 1,
-0.5991671, -0.109416, -1.323089, 1, 0, 0, 1, 1,
-0.5957216, 0.1412596, -3.046156, 1, 0, 0, 1, 1,
-0.594031, -0.1856256, -2.07514, 1, 0, 0, 1, 1,
-0.5909817, -0.3151359, -3.226914, 1, 0, 0, 1, 1,
-0.5847045, 0.4056029, -0.9731349, 1, 0, 0, 1, 1,
-0.5845948, 0.4727275, -2.125851, 0, 0, 0, 1, 1,
-0.58439, 0.6936101, -1.972023, 0, 0, 0, 1, 1,
-0.5789155, 0.370798, -1.236218, 0, 0, 0, 1, 1,
-0.5787739, 1.160626, 0.9203876, 0, 0, 0, 1, 1,
-0.5743139, 0.886467, -2.461081, 0, 0, 0, 1, 1,
-0.5609907, 1.112009, -1.431663, 0, 0, 0, 1, 1,
-0.5585622, -0.5301858, -3.94761, 0, 0, 0, 1, 1,
-0.5528857, -1.076049, -2.333266, 1, 1, 1, 1, 1,
-0.5523563, 0.4840326, 0.1657485, 1, 1, 1, 1, 1,
-0.5489981, -0.493285, -3.057936, 1, 1, 1, 1, 1,
-0.5469663, -0.1763561, -2.349023, 1, 1, 1, 1, 1,
-0.5468613, 0.5744409, 0.9929776, 1, 1, 1, 1, 1,
-0.5456401, -0.514293, -3.634746, 1, 1, 1, 1, 1,
-0.5442386, -1.091995, -2.379689, 1, 1, 1, 1, 1,
-0.5432889, -1.689246, -2.19851, 1, 1, 1, 1, 1,
-0.5404227, -0.03265272, -1.437352, 1, 1, 1, 1, 1,
-0.5322633, -1.903204, -4.054339, 1, 1, 1, 1, 1,
-0.5311989, -1.351957, -2.389513, 1, 1, 1, 1, 1,
-0.5230576, -1.883952, -4.654644, 1, 1, 1, 1, 1,
-0.5183421, -0.06359195, -1.257295, 1, 1, 1, 1, 1,
-0.5178033, 0.9153773, -0.1973432, 1, 1, 1, 1, 1,
-0.5172826, 0.7676995, -0.3910416, 1, 1, 1, 1, 1,
-0.5159619, -0.9364511, -3.09065, 0, 0, 1, 1, 1,
-0.5101524, 0.7111748, -1.388412, 1, 0, 0, 1, 1,
-0.5079573, 0.5241033, -0.754292, 1, 0, 0, 1, 1,
-0.5053766, -0.4090097, -2.441248, 1, 0, 0, 1, 1,
-0.5043726, 0.9305934, -0.5725125, 1, 0, 0, 1, 1,
-0.5031179, 0.4446714, -0.7753217, 1, 0, 0, 1, 1,
-0.5011683, 0.1428953, -2.134806, 0, 0, 0, 1, 1,
-0.497218, 0.1968377, -1.031633, 0, 0, 0, 1, 1,
-0.4967423, 0.5129456, -0.8802316, 0, 0, 0, 1, 1,
-0.4962381, 0.9349912, -1.293691, 0, 0, 0, 1, 1,
-0.4954016, -0.9596879, -2.247472, 0, 0, 0, 1, 1,
-0.4905612, 1.410669, 1.435684, 0, 0, 0, 1, 1,
-0.4899413, 0.2717137, 1.352298, 0, 0, 0, 1, 1,
-0.4833639, -0.7409468, -2.930439, 1, 1, 1, 1, 1,
-0.4825948, -0.5560113, -1.942925, 1, 1, 1, 1, 1,
-0.4800896, 0.5566158, -0.1250828, 1, 1, 1, 1, 1,
-0.4789416, -0.02253719, -2.039826, 1, 1, 1, 1, 1,
-0.4780312, 0.9274236, 1.200794, 1, 1, 1, 1, 1,
-0.476615, 0.3485429, -2.537875, 1, 1, 1, 1, 1,
-0.4759345, -1.34931, -2.967679, 1, 1, 1, 1, 1,
-0.4731015, -1.923649, -2.820736, 1, 1, 1, 1, 1,
-0.4698435, 0.9405584, -1.605937, 1, 1, 1, 1, 1,
-0.4659107, 0.7017222, -2.195822, 1, 1, 1, 1, 1,
-0.463067, 1.258257, -1.569022, 1, 1, 1, 1, 1,
-0.454491, -0.01864488, -1.456814, 1, 1, 1, 1, 1,
-0.4539473, 0.139797, -0.883549, 1, 1, 1, 1, 1,
-0.4513846, 1.406193, -0.1442844, 1, 1, 1, 1, 1,
-0.4495586, -0.8509906, -2.071798, 1, 1, 1, 1, 1,
-0.44874, 1.12676, 0.2201387, 0, 0, 1, 1, 1,
-0.4484963, -2.377151, -3.757138, 1, 0, 0, 1, 1,
-0.4407296, 0.08166668, -1.25478, 1, 0, 0, 1, 1,
-0.4399046, -0.6591212, -1.428663, 1, 0, 0, 1, 1,
-0.4355149, -0.1305224, -3.838171, 1, 0, 0, 1, 1,
-0.4347761, 1.468702, -0.1886529, 1, 0, 0, 1, 1,
-0.4342917, -1.388968, -2.871182, 0, 0, 0, 1, 1,
-0.4333966, 0.2816996, -2.203252, 0, 0, 0, 1, 1,
-0.4284172, 0.1546308, -0.3671964, 0, 0, 0, 1, 1,
-0.4257575, 1.194077, -0.8467548, 0, 0, 0, 1, 1,
-0.4220667, 0.3405745, 0.005578232, 0, 0, 0, 1, 1,
-0.4200393, -1.53443, -1.881219, 0, 0, 0, 1, 1,
-0.4194039, -1.225883, -2.960903, 0, 0, 0, 1, 1,
-0.4153486, -0.5255623, -2.430032, 1, 1, 1, 1, 1,
-0.4144374, 0.3540713, -1.487874, 1, 1, 1, 1, 1,
-0.4133742, 0.6177754, 0.304555, 1, 1, 1, 1, 1,
-0.4121193, -0.07504545, -1.705983, 1, 1, 1, 1, 1,
-0.411728, 1.799801, -2.406793, 1, 1, 1, 1, 1,
-0.4068223, -1.303306, -2.174639, 1, 1, 1, 1, 1,
-0.4049678, -0.4119628, -2.815626, 1, 1, 1, 1, 1,
-0.4039229, 0.9325679, -0.2998806, 1, 1, 1, 1, 1,
-0.4030264, 0.3674401, -0.7966806, 1, 1, 1, 1, 1,
-0.3989756, 0.7558273, 0.2558021, 1, 1, 1, 1, 1,
-0.3941038, -0.2094632, -2.547329, 1, 1, 1, 1, 1,
-0.3911304, -1.550955, -2.697973, 1, 1, 1, 1, 1,
-0.3845038, 1.975046, 0.412731, 1, 1, 1, 1, 1,
-0.3806084, -0.2459084, -1.598897, 1, 1, 1, 1, 1,
-0.3804538, 0.9475532, 0.2851374, 1, 1, 1, 1, 1,
-0.3788887, -0.07742958, -0.1890235, 0, 0, 1, 1, 1,
-0.3767517, -0.7868587, -3.772127, 1, 0, 0, 1, 1,
-0.3757461, -0.2886965, -3.51723, 1, 0, 0, 1, 1,
-0.3726285, -0.1453656, -2.967544, 1, 0, 0, 1, 1,
-0.3696658, -0.8677587, -3.680681, 1, 0, 0, 1, 1,
-0.3692891, 0.65264, 0.5891848, 1, 0, 0, 1, 1,
-0.367483, -0.509183, -3.432541, 0, 0, 0, 1, 1,
-0.3673362, 0.563018, -0.575474, 0, 0, 0, 1, 1,
-0.3610691, 1.184772, 0.04281729, 0, 0, 0, 1, 1,
-0.3580777, -0.09693912, -1.462075, 0, 0, 0, 1, 1,
-0.3543825, 0.01461306, -2.451419, 0, 0, 0, 1, 1,
-0.3507717, -0.6937184, -2.667609, 0, 0, 0, 1, 1,
-0.3482737, -0.3604258, -2.058165, 0, 0, 0, 1, 1,
-0.3415231, -0.2384287, -2.228978, 1, 1, 1, 1, 1,
-0.3379976, -1.093652, -4.721198, 1, 1, 1, 1, 1,
-0.3374636, -0.01346369, -1.560296, 1, 1, 1, 1, 1,
-0.3337695, -0.5594399, -2.49272, 1, 1, 1, 1, 1,
-0.3324796, -0.5135237, -3.423198, 1, 1, 1, 1, 1,
-0.3306155, -0.007111624, -3.366596, 1, 1, 1, 1, 1,
-0.3302707, 1.884604, -0.5217315, 1, 1, 1, 1, 1,
-0.3292023, 1.024193, 0.6796195, 1, 1, 1, 1, 1,
-0.3265293, 1.65668, -1.493094, 1, 1, 1, 1, 1,
-0.3260413, 0.8296546, 0.2371936, 1, 1, 1, 1, 1,
-0.3200311, 0.5499306, -1.095044, 1, 1, 1, 1, 1,
-0.3195665, -1.103468, -2.349569, 1, 1, 1, 1, 1,
-0.3182376, -0.7351262, -1.755626, 1, 1, 1, 1, 1,
-0.3180777, -0.4821292, -1.61798, 1, 1, 1, 1, 1,
-0.3165222, -0.16202, -2.010578, 1, 1, 1, 1, 1,
-0.3138804, -0.1362875, -2.785989, 0, 0, 1, 1, 1,
-0.3027247, 0.1758715, -0.1978458, 1, 0, 0, 1, 1,
-0.3014381, -0.6415365, -1.533755, 1, 0, 0, 1, 1,
-0.3011129, -0.1347132, -1.924596, 1, 0, 0, 1, 1,
-0.2971317, 0.712075, -0.4579834, 1, 0, 0, 1, 1,
-0.2909727, 2.377009, 0.2058163, 1, 0, 0, 1, 1,
-0.2892698, 0.423564, -0.923692, 0, 0, 0, 1, 1,
-0.287908, -1.199214, -2.92575, 0, 0, 0, 1, 1,
-0.2872981, 0.3701122, -0.2465038, 0, 0, 0, 1, 1,
-0.2857769, 1.160501, -1.890134, 0, 0, 0, 1, 1,
-0.2846408, 0.01666629, 0.6100899, 0, 0, 0, 1, 1,
-0.281436, 1.17089, 1.484387, 0, 0, 0, 1, 1,
-0.2760924, 1.147093, 0.3727651, 0, 0, 0, 1, 1,
-0.2728357, -0.8867959, -2.636988, 1, 1, 1, 1, 1,
-0.2724419, 0.2554081, -1.197278, 1, 1, 1, 1, 1,
-0.2711667, -0.2599292, -1.45589, 1, 1, 1, 1, 1,
-0.2663352, -0.4931394, -1.635208, 1, 1, 1, 1, 1,
-0.262911, 0.1461678, -2.605023, 1, 1, 1, 1, 1,
-0.2548773, 0.5175079, -0.8494133, 1, 1, 1, 1, 1,
-0.248137, 1.016042, -1.087145, 1, 1, 1, 1, 1,
-0.2476046, 0.6248547, -0.3829801, 1, 1, 1, 1, 1,
-0.245829, 0.04751774, -1.446349, 1, 1, 1, 1, 1,
-0.2362559, -0.6643193, -2.403189, 1, 1, 1, 1, 1,
-0.234475, 0.7563589, 0.1036192, 1, 1, 1, 1, 1,
-0.2305974, -1.160962, -1.846833, 1, 1, 1, 1, 1,
-0.2296323, 1.149409, 1.054633, 1, 1, 1, 1, 1,
-0.2289391, -0.3514672, 0.3841816, 1, 1, 1, 1, 1,
-0.2221193, 0.4923673, 1.343687, 1, 1, 1, 1, 1,
-0.2219167, 0.1604717, -1.487222, 0, 0, 1, 1, 1,
-0.2190206, -0.5354527, -1.789425, 1, 0, 0, 1, 1,
-0.2142023, -1.001082, -3.455801, 1, 0, 0, 1, 1,
-0.2114341, 1.825846, 0.5715045, 1, 0, 0, 1, 1,
-0.2085922, 0.5455588, -0.8354258, 1, 0, 0, 1, 1,
-0.2071706, 0.6730015, -0.5148715, 1, 0, 0, 1, 1,
-0.2058991, 0.7071795, -0.5394966, 0, 0, 0, 1, 1,
-0.1961387, -0.747611, -1.275863, 0, 0, 0, 1, 1,
-0.1939314, 0.7833171, 1.287903, 0, 0, 0, 1, 1,
-0.193562, 0.2096962, -0.7432839, 0, 0, 0, 1, 1,
-0.1926117, 0.3053922, -0.2801217, 0, 0, 0, 1, 1,
-0.1924005, -0.9045058, -2.619313, 0, 0, 0, 1, 1,
-0.1911219, -1.432823, -3.313798, 0, 0, 0, 1, 1,
-0.1883368, 1.450128, -1.707155, 1, 1, 1, 1, 1,
-0.1868474, -0.8483129, -2.84733, 1, 1, 1, 1, 1,
-0.1845623, -1.948574, -2.200028, 1, 1, 1, 1, 1,
-0.1842507, -0.6561196, -2.326265, 1, 1, 1, 1, 1,
-0.1825781, 0.2034533, 0.1712075, 1, 1, 1, 1, 1,
-0.1795596, 1.735723, 0.3237026, 1, 1, 1, 1, 1,
-0.1782963, 1.155096, 0.6644164, 1, 1, 1, 1, 1,
-0.1755597, 0.3300824, 1.105894, 1, 1, 1, 1, 1,
-0.171855, -0.5401875, -4.9219, 1, 1, 1, 1, 1,
-0.1704508, 0.1625793, -2.023716, 1, 1, 1, 1, 1,
-0.169818, 0.3025599, 0.2472853, 1, 1, 1, 1, 1,
-0.164231, -0.1532637, -2.909728, 1, 1, 1, 1, 1,
-0.1608025, -1.476037, -2.795015, 1, 1, 1, 1, 1,
-0.1582578, 0.9617038, -3.258904, 1, 1, 1, 1, 1,
-0.1576193, 1.389777, 1.45505, 1, 1, 1, 1, 1,
-0.153339, -0.7887978, -4.129087, 0, 0, 1, 1, 1,
-0.1532412, 0.482045, 0.5265585, 1, 0, 0, 1, 1,
-0.1512006, 0.8780007, 0.5470734, 1, 0, 0, 1, 1,
-0.1511141, -0.5162917, -3.192844, 1, 0, 0, 1, 1,
-0.1457837, -0.1683152, -3.427022, 1, 0, 0, 1, 1,
-0.1429697, -0.7606381, -3.491911, 1, 0, 0, 1, 1,
-0.1375913, -0.0382283, -2.949683, 0, 0, 0, 1, 1,
-0.137133, 0.240271, -1.24217, 0, 0, 0, 1, 1,
-0.1368179, 1.390065, -0.71513, 0, 0, 0, 1, 1,
-0.134074, -1.00369, -4.959541, 0, 0, 0, 1, 1,
-0.1328739, 0.7145907, -0.3186123, 0, 0, 0, 1, 1,
-0.1319356, 2.160346, -0.8394831, 0, 0, 0, 1, 1,
-0.130042, -0.5555902, -2.554394, 0, 0, 0, 1, 1,
-0.1292682, -0.2900697, -2.063833, 1, 1, 1, 1, 1,
-0.1240339, 0.8537389, 0.161714, 1, 1, 1, 1, 1,
-0.1238789, 0.5128103, -0.1673694, 1, 1, 1, 1, 1,
-0.1234676, -1.613983, -2.767339, 1, 1, 1, 1, 1,
-0.1232168, 2.981859, 0.8903748, 1, 1, 1, 1, 1,
-0.1230566, 1.617041, -0.1731386, 1, 1, 1, 1, 1,
-0.1209028, -1.273405, -3.438715, 1, 1, 1, 1, 1,
-0.1184305, -0.2274641, -2.345124, 1, 1, 1, 1, 1,
-0.1181613, 0.02326194, -2.036055, 1, 1, 1, 1, 1,
-0.1077164, -0.7812135, -3.17218, 1, 1, 1, 1, 1,
-0.1066117, -0.3844311, -2.141569, 1, 1, 1, 1, 1,
-0.09949448, -0.6431857, -4.917511, 1, 1, 1, 1, 1,
-0.09782587, -0.03366892, -2.267055, 1, 1, 1, 1, 1,
-0.09244447, -0.9833661, -4.598075, 1, 1, 1, 1, 1,
-0.08931694, 0.005385727, -1.299834, 1, 1, 1, 1, 1,
-0.08804952, 0.2919796, -1.638797, 0, 0, 1, 1, 1,
-0.0843044, -0.4335234, -2.803762, 1, 0, 0, 1, 1,
-0.08192258, 0.008741424, -2.307007, 1, 0, 0, 1, 1,
-0.07846393, -0.1993775, -2.999003, 1, 0, 0, 1, 1,
-0.07051314, -0.8874125, -2.936891, 1, 0, 0, 1, 1,
-0.06990287, 1.135796, -0.08905157, 1, 0, 0, 1, 1,
-0.0661065, -0.2172191, -3.520808, 0, 0, 0, 1, 1,
-0.06604855, 0.2590778, -1.539619, 0, 0, 0, 1, 1,
-0.06299603, -1.048805, -3.240092, 0, 0, 0, 1, 1,
-0.06119207, -0.1273344, -2.723904, 0, 0, 0, 1, 1,
-0.05991754, 0.1624869, -1.897758, 0, 0, 0, 1, 1,
-0.05888204, 0.75448, -0.884691, 0, 0, 0, 1, 1,
-0.05820097, -1.164517, -4.822789, 0, 0, 0, 1, 1,
-0.05817134, 0.4847533, 2.037674, 1, 1, 1, 1, 1,
-0.05726661, 0.6715596, 0.4169928, 1, 1, 1, 1, 1,
-0.05643171, -0.6382608, -0.5733284, 1, 1, 1, 1, 1,
-0.04892386, -0.023428, -0.6376573, 1, 1, 1, 1, 1,
-0.04760867, 0.8768743, 0.8006878, 1, 1, 1, 1, 1,
-0.04311578, 1.500957, -0.7666128, 1, 1, 1, 1, 1,
-0.04160754, 1.410285, 1.710352, 1, 1, 1, 1, 1,
-0.03904959, 0.2961752, 0.2174354, 1, 1, 1, 1, 1,
-0.03454021, 1.122502, -0.9726102, 1, 1, 1, 1, 1,
-0.02794716, 0.4218037, -2.059562, 1, 1, 1, 1, 1,
-0.02393099, -0.09247181, -2.452993, 1, 1, 1, 1, 1,
-0.02120643, 0.7536023, -0.00387726, 1, 1, 1, 1, 1,
-0.01917382, 1.663224, -0.9703147, 1, 1, 1, 1, 1,
-0.01837113, 0.6984767, 0.3859251, 1, 1, 1, 1, 1,
-0.01383303, -1.683468, -1.7866, 1, 1, 1, 1, 1,
-0.0096599, -0.8727518, -3.145641, 0, 0, 1, 1, 1,
-0.008983909, -1.592373, -3.895213, 1, 0, 0, 1, 1,
-0.005218898, 0.6369764, -0.5587107, 1, 0, 0, 1, 1,
-0.005137298, -0.5223063, -2.143984, 1, 0, 0, 1, 1,
-0.004531046, 1.313651, 1.756017, 1, 0, 0, 1, 1,
-0.003751394, 0.3542057, 0.2836268, 1, 0, 0, 1, 1,
-0.003047312, -0.32939, -4.273024, 0, 0, 0, 1, 1,
-0.002537164, -0.7496353, -2.680758, 0, 0, 0, 1, 1,
-0.001216038, -0.0467183, -1.63607, 0, 0, 0, 1, 1,
-0.0005632559, -0.0007555863, -1.108032, 0, 0, 0, 1, 1,
0.005157837, 0.2579092, 0.8141205, 0, 0, 0, 1, 1,
0.005418133, -1.391822, 3.688745, 0, 0, 0, 1, 1,
0.00627847, 0.5084079, 1.938408, 0, 0, 0, 1, 1,
0.01443074, -0.4109201, 2.862848, 1, 1, 1, 1, 1,
0.01525855, -0.7539962, 4.259046, 1, 1, 1, 1, 1,
0.01998816, 1.32644, 0.3520492, 1, 1, 1, 1, 1,
0.02270576, 0.5146428, 0.738133, 1, 1, 1, 1, 1,
0.02374402, -1.446394, 2.702462, 1, 1, 1, 1, 1,
0.0244249, 0.8315732, -0.2878489, 1, 1, 1, 1, 1,
0.02676794, 0.8303197, 0.7027795, 1, 1, 1, 1, 1,
0.02916605, 1.696559, -1.237838, 1, 1, 1, 1, 1,
0.02962058, -0.2902216, 2.177815, 1, 1, 1, 1, 1,
0.03123271, -1.232108, 1.978658, 1, 1, 1, 1, 1,
0.03398099, -1.178047, 3.0961, 1, 1, 1, 1, 1,
0.03528302, 0.2861144, 0.3366154, 1, 1, 1, 1, 1,
0.03703509, -0.1674519, 3.468911, 1, 1, 1, 1, 1,
0.04664456, -0.8987017, 2.922816, 1, 1, 1, 1, 1,
0.04697684, 0.2153506, -0.2853626, 1, 1, 1, 1, 1,
0.05100108, 0.1276133, 1.416017, 0, 0, 1, 1, 1,
0.05207507, 0.00857737, 1.762796, 1, 0, 0, 1, 1,
0.05673561, -0.8596634, 4.294099, 1, 0, 0, 1, 1,
0.0599603, -1.725772, 4.353258, 1, 0, 0, 1, 1,
0.06252176, 0.3938706, 0.3493176, 1, 0, 0, 1, 1,
0.06810207, 0.04613983, 0.8234365, 1, 0, 0, 1, 1,
0.06867188, -0.3952299, 2.432435, 0, 0, 0, 1, 1,
0.0687481, 0.3210153, 0.9538664, 0, 0, 0, 1, 1,
0.07097822, -0.3364388, 2.7084, 0, 0, 0, 1, 1,
0.07202426, 0.3723696, 1.459922, 0, 0, 0, 1, 1,
0.07817016, 0.585512, -0.8299917, 0, 0, 0, 1, 1,
0.07881628, 1.048178, -1.023576, 0, 0, 0, 1, 1,
0.08533613, 1.70982, 0.6790881, 0, 0, 0, 1, 1,
0.09251311, 1.335901, 0.7755471, 1, 1, 1, 1, 1,
0.09433379, -0.497619, 2.334257, 1, 1, 1, 1, 1,
0.09588503, -0.8389357, 2.914968, 1, 1, 1, 1, 1,
0.106687, -1.335658, 2.56163, 1, 1, 1, 1, 1,
0.109285, 0.3779502, -0.3569217, 1, 1, 1, 1, 1,
0.1094788, 0.7760898, -0.0050647, 1, 1, 1, 1, 1,
0.1116705, 2.080243, 0.4927923, 1, 1, 1, 1, 1,
0.1120945, 0.509518, 1.889362, 1, 1, 1, 1, 1,
0.1123023, 1.655356, 0.6666728, 1, 1, 1, 1, 1,
0.1144493, 0.3882302, 2.579493, 1, 1, 1, 1, 1,
0.1149975, 1.236522, -0.5634065, 1, 1, 1, 1, 1,
0.1163167, -0.7037212, 3.062282, 1, 1, 1, 1, 1,
0.1192836, -0.1826471, 2.883785, 1, 1, 1, 1, 1,
0.1228508, 0.747611, -0.06063936, 1, 1, 1, 1, 1,
0.1243128, -0.5355173, 2.484205, 1, 1, 1, 1, 1,
0.1258641, 0.1861344, 0.152338, 0, 0, 1, 1, 1,
0.1297859, 0.5814051, 0.5112678, 1, 0, 0, 1, 1,
0.1326685, 1.250866, 0.3459076, 1, 0, 0, 1, 1,
0.1330761, 1.341058, 1.361341, 1, 0, 0, 1, 1,
0.1368254, -0.1915333, 2.139395, 1, 0, 0, 1, 1,
0.1420063, 0.1635504, 1.583523, 1, 0, 0, 1, 1,
0.1440681, 0.345785, 0.7944132, 0, 0, 0, 1, 1,
0.1454913, -0.2677923, 2.366947, 0, 0, 0, 1, 1,
0.146873, -1.704307, 3.17458, 0, 0, 0, 1, 1,
0.1470596, -0.1949856, 2.032227, 0, 0, 0, 1, 1,
0.1472123, 1.364158, -0.3455573, 0, 0, 0, 1, 1,
0.1510734, -1.403408, 2.897595, 0, 0, 0, 1, 1,
0.1542512, -1.408856, 2.775787, 0, 0, 0, 1, 1,
0.1547846, 0.0001920828, 1.555387, 1, 1, 1, 1, 1,
0.1571334, -1.102907, 2.581982, 1, 1, 1, 1, 1,
0.1636212, -2.595002, 2.730966, 1, 1, 1, 1, 1,
0.1688954, 0.1709566, 0.08933941, 1, 1, 1, 1, 1,
0.1727913, 2.102486, -1.803009, 1, 1, 1, 1, 1,
0.1728894, 0.008979238, 0.8536465, 1, 1, 1, 1, 1,
0.1749316, -0.3348505, 3.352428, 1, 1, 1, 1, 1,
0.1803915, -0.5605958, 2.876887, 1, 1, 1, 1, 1,
0.1804082, -1.056203, 3.004652, 1, 1, 1, 1, 1,
0.1808596, -1.280868, 2.512145, 1, 1, 1, 1, 1,
0.1844187, -1.688407, 3.950247, 1, 1, 1, 1, 1,
0.1872852, 1.385441, -0.2034784, 1, 1, 1, 1, 1,
0.1924467, -0.4661894, 2.658031, 1, 1, 1, 1, 1,
0.1934201, 0.2472437, 0.8573001, 1, 1, 1, 1, 1,
0.1943039, 0.7304441, 0.4239844, 1, 1, 1, 1, 1,
0.195874, -0.1122495, 2.919779, 0, 0, 1, 1, 1,
0.1974908, -0.2037923, 1.991478, 1, 0, 0, 1, 1,
0.1978589, -0.156835, 2.768398, 1, 0, 0, 1, 1,
0.2032464, -0.4276848, 3.071344, 1, 0, 0, 1, 1,
0.209698, -0.09732253, 2.33423, 1, 0, 0, 1, 1,
0.212887, 0.303489, 1.576564, 1, 0, 0, 1, 1,
0.2234801, -2.204145, 1.487472, 0, 0, 0, 1, 1,
0.2245346, -0.1399835, 1.664707, 0, 0, 0, 1, 1,
0.2324535, 1.762712, -0.5635509, 0, 0, 0, 1, 1,
0.2325936, -0.5962474, 1.625233, 0, 0, 0, 1, 1,
0.2328732, -1.044866, 4.092695, 0, 0, 0, 1, 1,
0.2337963, 1.063815, 0.6553534, 0, 0, 0, 1, 1,
0.2351823, 0.5939518, 0.5831118, 0, 0, 0, 1, 1,
0.2394238, -0.7343315, 5.191227, 1, 1, 1, 1, 1,
0.2401886, -1.063329, 2.353803, 1, 1, 1, 1, 1,
0.2413176, -0.1946618, 1.319077, 1, 1, 1, 1, 1,
0.2413204, -0.3511681, 3.302496, 1, 1, 1, 1, 1,
0.243008, 0.9399068, 0.173542, 1, 1, 1, 1, 1,
0.244295, -1.036966, 3.739156, 1, 1, 1, 1, 1,
0.2461432, 1.379056, 0.6673902, 1, 1, 1, 1, 1,
0.2483252, -0.3786894, 2.132254, 1, 1, 1, 1, 1,
0.2486738, 1.591663, -0.4332539, 1, 1, 1, 1, 1,
0.2492063, 1.003314, -0.2197102, 1, 1, 1, 1, 1,
0.252504, 0.9859024, 2.169162, 1, 1, 1, 1, 1,
0.2699388, 0.2099336, 1.89585, 1, 1, 1, 1, 1,
0.2724099, -0.3229266, 2.950717, 1, 1, 1, 1, 1,
0.2743462, 1.02765, -0.3612551, 1, 1, 1, 1, 1,
0.2756874, 0.04646645, 2.51644, 1, 1, 1, 1, 1,
0.2777497, -0.3661341, 2.583284, 0, 0, 1, 1, 1,
0.2840556, 1.605013, -1.576786, 1, 0, 0, 1, 1,
0.2939698, -0.6642378, 3.301201, 1, 0, 0, 1, 1,
0.2973595, 1.140878, 1.262761, 1, 0, 0, 1, 1,
0.299987, 0.7743564, 1.677848, 1, 0, 0, 1, 1,
0.3052673, 0.6280529, -0.6392124, 1, 0, 0, 1, 1,
0.305802, -1.462691, 3.780931, 0, 0, 0, 1, 1,
0.3073641, 0.437299, 0.7534903, 0, 0, 0, 1, 1,
0.3086714, -0.6691164, 0.7348675, 0, 0, 0, 1, 1,
0.3098742, 1.503801, -0.8135555, 0, 0, 0, 1, 1,
0.3124393, 0.9144968, 0.8789985, 0, 0, 0, 1, 1,
0.3129901, -1.158717, 2.869668, 0, 0, 0, 1, 1,
0.3190191, 0.6158868, 1.09256, 0, 0, 0, 1, 1,
0.319938, 0.7367044, 1.317108, 1, 1, 1, 1, 1,
0.3211473, 0.9213074, 0.2528003, 1, 1, 1, 1, 1,
0.3212278, 0.1298806, 1.649162, 1, 1, 1, 1, 1,
0.3212354, -0.8304044, 2.389421, 1, 1, 1, 1, 1,
0.3223895, -0.5888274, 2.189724, 1, 1, 1, 1, 1,
0.3228292, -0.4701043, 2.479486, 1, 1, 1, 1, 1,
0.3232863, -1.603838, 4.192811, 1, 1, 1, 1, 1,
0.3235779, 1.187036, 0.3828579, 1, 1, 1, 1, 1,
0.3290547, 2.242575, -0.7897245, 1, 1, 1, 1, 1,
0.3291583, 1.365911, 1.000917, 1, 1, 1, 1, 1,
0.3295946, -0.8159946, 2.682323, 1, 1, 1, 1, 1,
0.3308676, 0.3347567, 1.268153, 1, 1, 1, 1, 1,
0.3323542, -0.5847127, 1.423255, 1, 1, 1, 1, 1,
0.3364042, -1.818943, 3.257636, 1, 1, 1, 1, 1,
0.3446583, -0.1081498, 1.29224, 1, 1, 1, 1, 1,
0.3460135, -0.7789602, 2.914259, 0, 0, 1, 1, 1,
0.3465114, -0.681504, 1.88167, 1, 0, 0, 1, 1,
0.355771, 2.031141, -0.1649262, 1, 0, 0, 1, 1,
0.356176, -1.393227, 1.492215, 1, 0, 0, 1, 1,
0.3594297, -0.0001096477, 2.080199, 1, 0, 0, 1, 1,
0.3626482, -0.4999505, 1.754202, 1, 0, 0, 1, 1,
0.3641535, 1.368248, -0.08745237, 0, 0, 0, 1, 1,
0.366445, 0.2037538, 0.8795861, 0, 0, 0, 1, 1,
0.3742893, 0.566393, 1.253676, 0, 0, 0, 1, 1,
0.3777817, -0.6294695, 4.63044, 0, 0, 0, 1, 1,
0.3780226, 1.478742, 0.6905395, 0, 0, 0, 1, 1,
0.3790349, -1.167791, 2.997456, 0, 0, 0, 1, 1,
0.3801597, 0.3710309, 1.392693, 0, 0, 0, 1, 1,
0.3869506, -0.9676632, 2.527194, 1, 1, 1, 1, 1,
0.3869977, 0.01988544, 2.573232, 1, 1, 1, 1, 1,
0.3894768, 0.09381726, -0.02506234, 1, 1, 1, 1, 1,
0.3929639, -0.03431517, 0.9561152, 1, 1, 1, 1, 1,
0.393193, -0.1699425, 0.6829295, 1, 1, 1, 1, 1,
0.398164, 0.4433529, 1.1475, 1, 1, 1, 1, 1,
0.4030849, -0.4792315, 2.400643, 1, 1, 1, 1, 1,
0.4034136, -1.436429, 3.846633, 1, 1, 1, 1, 1,
0.403787, -0.1128285, 2.596837, 1, 1, 1, 1, 1,
0.4047539, 0.4907368, 1.641483, 1, 1, 1, 1, 1,
0.4051948, 0.2551386, -0.7771361, 1, 1, 1, 1, 1,
0.4062832, -0.009961461, 2.41869, 1, 1, 1, 1, 1,
0.4077688, 0.6805741, 0.7517157, 1, 1, 1, 1, 1,
0.4088496, 0.2139288, 0.5635807, 1, 1, 1, 1, 1,
0.4130663, -1.765789, 2.672797, 1, 1, 1, 1, 1,
0.4132687, 0.0004667993, 1.621019, 0, 0, 1, 1, 1,
0.4132749, 0.09181112, 0.9563304, 1, 0, 0, 1, 1,
0.4143715, -1.541083, 0.2544811, 1, 0, 0, 1, 1,
0.4145912, 0.3410679, -0.0257135, 1, 0, 0, 1, 1,
0.4161705, 0.9587362, 0.3966743, 1, 0, 0, 1, 1,
0.4163861, 0.09999438, 0.5632845, 1, 0, 0, 1, 1,
0.4164771, 0.1453003, 0.4184298, 0, 0, 0, 1, 1,
0.4175198, 0.990992, -0.7146386, 0, 0, 0, 1, 1,
0.4188832, -0.6451452, 3.772255, 0, 0, 0, 1, 1,
0.4217872, -0.8538191, 2.992095, 0, 0, 0, 1, 1,
0.423802, -0.5821684, 3.214731, 0, 0, 0, 1, 1,
0.4274522, -0.7320809, 2.972183, 0, 0, 0, 1, 1,
0.4307706, -0.2672396, 3.288486, 0, 0, 0, 1, 1,
0.4321636, 0.3167886, 1.814711, 1, 1, 1, 1, 1,
0.4339611, -0.9267465, 2.760965, 1, 1, 1, 1, 1,
0.4346453, 0.334635, -1.184714, 1, 1, 1, 1, 1,
0.4433294, -0.5633527, 2.649051, 1, 1, 1, 1, 1,
0.4555544, 0.7610157, 0.1631453, 1, 1, 1, 1, 1,
0.455936, 0.602431, 2.129866, 1, 1, 1, 1, 1,
0.4568216, 0.4546067, -1.084437, 1, 1, 1, 1, 1,
0.4579936, -0.5071971, 3.41373, 1, 1, 1, 1, 1,
0.4649334, 1.411234, 0.5409166, 1, 1, 1, 1, 1,
0.4714858, -0.1457243, 2.175374, 1, 1, 1, 1, 1,
0.4789586, 1.63088, -0.2585671, 1, 1, 1, 1, 1,
0.4823623, -0.5111338, 1.662694, 1, 1, 1, 1, 1,
0.4850927, 1.506001, 1.921134, 1, 1, 1, 1, 1,
0.4865135, 1.908762, 0.4120035, 1, 1, 1, 1, 1,
0.4876305, 1.03988, 0.4803455, 1, 1, 1, 1, 1,
0.4879958, -0.3600681, 1.455184, 0, 0, 1, 1, 1,
0.4918115, -0.3445658, 1.125533, 1, 0, 0, 1, 1,
0.4989794, 1.591661, 0.3207313, 1, 0, 0, 1, 1,
0.5063608, 0.03550547, 1.599203, 1, 0, 0, 1, 1,
0.5120409, -0.1209779, 1.287184, 1, 0, 0, 1, 1,
0.5220492, -0.248749, 3.121639, 1, 0, 0, 1, 1,
0.5251237, -0.003183676, 0.7597351, 0, 0, 0, 1, 1,
0.5274442, -0.2981475, 2.463199, 0, 0, 0, 1, 1,
0.5295851, -0.3957393, 4.125744, 0, 0, 0, 1, 1,
0.5316414, 0.5700914, 1.348698, 0, 0, 0, 1, 1,
0.532645, -0.6897748, 3.676554, 0, 0, 0, 1, 1,
0.5328992, 1.243532, -0.1051776, 0, 0, 0, 1, 1,
0.5404966, -0.6949847, 2.791448, 0, 0, 0, 1, 1,
0.5442188, 1.045575, 0.456243, 1, 1, 1, 1, 1,
0.5473573, -0.6139618, 3.203438, 1, 1, 1, 1, 1,
0.5545052, -0.1298015, 0.8952669, 1, 1, 1, 1, 1,
0.5617934, 0.6769788, 1.230742, 1, 1, 1, 1, 1,
0.5634607, 1.187327, -0.2565961, 1, 1, 1, 1, 1,
0.5645427, 1.358413, 0.5899057, 1, 1, 1, 1, 1,
0.5694889, -2.024845, 3.664648, 1, 1, 1, 1, 1,
0.5694894, -0.3715492, 0.4237732, 1, 1, 1, 1, 1,
0.5707884, 0.1100217, 1.254169, 1, 1, 1, 1, 1,
0.5750566, -2.309912, 3.647021, 1, 1, 1, 1, 1,
0.5760452, -1.069445, 0.5850013, 1, 1, 1, 1, 1,
0.5769921, 0.6813931, -0.7678798, 1, 1, 1, 1, 1,
0.5784329, 0.6341277, -1.336498, 1, 1, 1, 1, 1,
0.5801684, -1.134424, 4.27444, 1, 1, 1, 1, 1,
0.5804778, -1.89121, 2.792008, 1, 1, 1, 1, 1,
0.5841789, -0.8202044, 2.893018, 0, 0, 1, 1, 1,
0.5854253, 1.223295, 1.279617, 1, 0, 0, 1, 1,
0.5904878, -1.513684, 3.975387, 1, 0, 0, 1, 1,
0.5934032, -0.1851814, 1.10262, 1, 0, 0, 1, 1,
0.5942578, -1.382736, 1.105988, 1, 0, 0, 1, 1,
0.595942, 0.3745705, 0.9553337, 1, 0, 0, 1, 1,
0.5988585, 0.03162156, 2.100089, 0, 0, 0, 1, 1,
0.6020062, 1.571567, -0.7763819, 0, 0, 0, 1, 1,
0.6020713, 0.5365372, 0.5635159, 0, 0, 0, 1, 1,
0.6023368, 0.4659314, 1.688472, 0, 0, 0, 1, 1,
0.6028795, 0.7691565, 0.3026944, 0, 0, 0, 1, 1,
0.6085272, 0.191132, 1.703879, 0, 0, 0, 1, 1,
0.612382, -0.6698193, 3.533371, 0, 0, 0, 1, 1,
0.6137896, 0.1735679, 1.115196, 1, 1, 1, 1, 1,
0.6149789, -0.2697184, 3.007878, 1, 1, 1, 1, 1,
0.6172232, 1.731386, -0.1158648, 1, 1, 1, 1, 1,
0.6184552, 1.893151, 0.2428584, 1, 1, 1, 1, 1,
0.6208426, 0.6136646, 0.03339665, 1, 1, 1, 1, 1,
0.6217879, 1.810919, 0.2449807, 1, 1, 1, 1, 1,
0.6222218, -0.4090723, 0.8730718, 1, 1, 1, 1, 1,
0.6224728, -0.2907138, 2.154556, 1, 1, 1, 1, 1,
0.6298923, -0.778358, 1.479362, 1, 1, 1, 1, 1,
0.6351658, 0.1598597, 2.269448, 1, 1, 1, 1, 1,
0.6455065, -0.6480177, 1.813816, 1, 1, 1, 1, 1,
0.6492632, -2.070359, 2.426969, 1, 1, 1, 1, 1,
0.6499821, -0.1712623, 1.529004, 1, 1, 1, 1, 1,
0.6506427, 1.246339, -0.7408696, 1, 1, 1, 1, 1,
0.6557629, -1.858249, 1.811426, 1, 1, 1, 1, 1,
0.6561655, 0.7323703, 1.224288, 0, 0, 1, 1, 1,
0.6603152, -0.7940511, 1.751877, 1, 0, 0, 1, 1,
0.6619223, 1.260556, 0.5584528, 1, 0, 0, 1, 1,
0.6649398, 1.874174, 0.374821, 1, 0, 0, 1, 1,
0.6675032, 0.2389967, 0.6915239, 1, 0, 0, 1, 1,
0.6684078, 0.5706503, 1.194469, 1, 0, 0, 1, 1,
0.6757906, 0.4429964, 3.313387, 0, 0, 0, 1, 1,
0.6767206, -0.1586304, 0.7244617, 0, 0, 0, 1, 1,
0.6769729, -0.6026905, 1.442393, 0, 0, 0, 1, 1,
0.6804385, 0.6697322, -0.3736728, 0, 0, 0, 1, 1,
0.6813648, 1.023842, 1.399139, 0, 0, 0, 1, 1,
0.68353, 2.255334, -0.161141, 0, 0, 0, 1, 1,
0.6872346, 0.6985363, -0.1684887, 0, 0, 0, 1, 1,
0.6889919, -1.420364, 2.905692, 1, 1, 1, 1, 1,
0.6898772, -0.6634001, 1.095141, 1, 1, 1, 1, 1,
0.6934295, -0.7853954, 1.108714, 1, 1, 1, 1, 1,
0.6944237, -0.8412407, 1.035765, 1, 1, 1, 1, 1,
0.695499, -1.098415, 3.793363, 1, 1, 1, 1, 1,
0.6974569, -0.8644717, 2.379264, 1, 1, 1, 1, 1,
0.6975512, -0.5306345, 1.735535, 1, 1, 1, 1, 1,
0.7007754, -0.3547477, 0.8193125, 1, 1, 1, 1, 1,
0.7020035, 0.7298358, 1.250839, 1, 1, 1, 1, 1,
0.7038683, -0.0824675, 2.802238, 1, 1, 1, 1, 1,
0.7058164, -1.819068, 1.423024, 1, 1, 1, 1, 1,
0.7082089, 1.179112, -0.7446957, 1, 1, 1, 1, 1,
0.7087035, 0.3880004, 0.7858674, 1, 1, 1, 1, 1,
0.7159423, 1.375684, 2.021221, 1, 1, 1, 1, 1,
0.7165527, 1.757579, 1.001979, 1, 1, 1, 1, 1,
0.7178744, 0.7828798, 0.9523366, 0, 0, 1, 1, 1,
0.7286993, 0.3710224, 1.055189, 1, 0, 0, 1, 1,
0.7308409, 1.234941, 2.15988, 1, 0, 0, 1, 1,
0.7338744, -2.105005, 4.257196, 1, 0, 0, 1, 1,
0.7398522, -0.4278341, 2.212013, 1, 0, 0, 1, 1,
0.7454455, 0.3611023, 0.07772061, 1, 0, 0, 1, 1,
0.7508412, 0.7683952, 1.981993, 0, 0, 0, 1, 1,
0.7525578, -1.248114, 2.588515, 0, 0, 0, 1, 1,
0.7630738, 0.0268156, 1.232169, 0, 0, 0, 1, 1,
0.7679011, -0.8303384, 2.120625, 0, 0, 0, 1, 1,
0.7698981, 0.9874284, -0.9497668, 0, 0, 0, 1, 1,
0.770054, 1.002422, 0.7179441, 0, 0, 0, 1, 1,
0.7710159, 0.4876161, 0.8232093, 0, 0, 0, 1, 1,
0.7737477, 0.4700083, 1.107469, 1, 1, 1, 1, 1,
0.7759783, 0.3323611, 0.9199499, 1, 1, 1, 1, 1,
0.7782297, 2.453934, 0.8751109, 1, 1, 1, 1, 1,
0.7786422, -0.4002523, 2.673137, 1, 1, 1, 1, 1,
0.7790094, 1.235707, 0.2771674, 1, 1, 1, 1, 1,
0.7808415, -0.007080955, 2.699191, 1, 1, 1, 1, 1,
0.7842231, 1.265226, 0.1607502, 1, 1, 1, 1, 1,
0.7852003, -0.1895956, 1.835595, 1, 1, 1, 1, 1,
0.7870468, 2.188768, 0.5585011, 1, 1, 1, 1, 1,
0.7880911, 1.293608, -0.1644846, 1, 1, 1, 1, 1,
0.789492, -1.186739, 4.914117, 1, 1, 1, 1, 1,
0.7908866, -0.5404792, 2.660404, 1, 1, 1, 1, 1,
0.8026916, 0.5158224, 0.7766497, 1, 1, 1, 1, 1,
0.8094037, -1.068596, 2.480677, 1, 1, 1, 1, 1,
0.8153698, 0.9501163, 0.07190683, 1, 1, 1, 1, 1,
0.8158383, -2.81001, 2.87631, 0, 0, 1, 1, 1,
0.8199217, -1.224927, 3.074172, 1, 0, 0, 1, 1,
0.827376, -0.7933165, 2.024827, 1, 0, 0, 1, 1,
0.8310156, 0.5193355, -0.1490988, 1, 0, 0, 1, 1,
0.836049, 0.06969064, -0.6239113, 1, 0, 0, 1, 1,
0.8404285, 0.9742798, 1.699642, 1, 0, 0, 1, 1,
0.8433446, 0.6638463, 2.377095, 0, 0, 0, 1, 1,
0.8478833, -2.024288, 2.69604, 0, 0, 0, 1, 1,
0.8482566, -1.167477, 1.884157, 0, 0, 0, 1, 1,
0.8521159, -1.384153, 2.069851, 0, 0, 0, 1, 1,
0.8536676, 0.585854, 0.3670417, 0, 0, 0, 1, 1,
0.8570825, 0.01633212, 1.594697, 0, 0, 0, 1, 1,
0.8577094, -2.037373, 2.731138, 0, 0, 0, 1, 1,
0.8597721, 3.326684, 1.684989, 1, 1, 1, 1, 1,
0.863825, -0.2515904, 2.789527, 1, 1, 1, 1, 1,
0.8649424, -0.2820918, 3.123825, 1, 1, 1, 1, 1,
0.8665724, -0.04187835, 0.4943316, 1, 1, 1, 1, 1,
0.86672, 0.06242578, 1.551973, 1, 1, 1, 1, 1,
0.8713092, -0.2526582, 3.414201, 1, 1, 1, 1, 1,
0.8728484, -1.448988, 2.723693, 1, 1, 1, 1, 1,
0.8768443, 0.02291261, 1.774866, 1, 1, 1, 1, 1,
0.8775474, 0.3061092, 0.5112115, 1, 1, 1, 1, 1,
0.8783658, 1.098962, 0.02979823, 1, 1, 1, 1, 1,
0.8788605, 0.2766998, 0.649388, 1, 1, 1, 1, 1,
0.8788817, -0.4087767, 3.042302, 1, 1, 1, 1, 1,
0.8805841, 0.7210544, 0.6375951, 1, 1, 1, 1, 1,
0.8825353, -0.8432968, 4.05482, 1, 1, 1, 1, 1,
0.8873546, -2.155576, 3.175965, 1, 1, 1, 1, 1,
0.9017604, -1.368922, 2.661367, 0, 0, 1, 1, 1,
0.9032152, 0.394767, 0.5300433, 1, 0, 0, 1, 1,
0.9093229, -0.102408, 1.913984, 1, 0, 0, 1, 1,
0.9096565, -0.4902327, 2.55917, 1, 0, 0, 1, 1,
0.9115263, 0.6927745, -0.2274378, 1, 0, 0, 1, 1,
0.9174076, 0.05033889, 2.884392, 1, 0, 0, 1, 1,
0.9198821, -0.2863966, 2.092296, 0, 0, 0, 1, 1,
0.924327, -1.059374, 2.207549, 0, 0, 0, 1, 1,
0.9246575, -0.2566729, 3.227476, 0, 0, 0, 1, 1,
0.9279792, -0.2650018, 2.187029, 0, 0, 0, 1, 1,
0.9335338, 0.6309119, 0.0419274, 0, 0, 0, 1, 1,
0.9439386, -0.7155713, 3.328644, 0, 0, 0, 1, 1,
0.9534906, -0.6534201, 4.353906, 0, 0, 0, 1, 1,
0.9546748, 1.179125, 1.823419, 1, 1, 1, 1, 1,
0.9557385, -0.6677883, 0.8676004, 1, 1, 1, 1, 1,
0.9624196, 1.878213, 0.9978435, 1, 1, 1, 1, 1,
0.9655901, -0.133256, 1.929288, 1, 1, 1, 1, 1,
0.9704233, 0.9993517, 0.8465368, 1, 1, 1, 1, 1,
0.9795035, -0.8731365, 2.055468, 1, 1, 1, 1, 1,
0.9805605, -1.300251, 2.401648, 1, 1, 1, 1, 1,
0.9964967, -0.9780783, 0.6113425, 1, 1, 1, 1, 1,
0.9974128, -0.66302, 2.175514, 1, 1, 1, 1, 1,
1.008742, 0.2145627, 1.132567, 1, 1, 1, 1, 1,
1.013905, 0.8553455, 0.4012452, 1, 1, 1, 1, 1,
1.017485, 1.66712, 1.592718, 1, 1, 1, 1, 1,
1.022013, 0.9783435, 0.8790669, 1, 1, 1, 1, 1,
1.023715, -0.2362103, 1.29224, 1, 1, 1, 1, 1,
1.023883, -1.319174, 1.519356, 1, 1, 1, 1, 1,
1.024405, -1.401473, 2.506381, 0, 0, 1, 1, 1,
1.026976, 0.9241438, 1.502817, 1, 0, 0, 1, 1,
1.032722, 0.538649, 0.7576113, 1, 0, 0, 1, 1,
1.036377, -0.3162445, 2.166169, 1, 0, 0, 1, 1,
1.036847, 0.3044174, 0.608828, 1, 0, 0, 1, 1,
1.040335, -1.062848, 3.009171, 1, 0, 0, 1, 1,
1.040788, 0.4189975, 1.196385, 0, 0, 0, 1, 1,
1.046606, 2.019546, 1.203945, 0, 0, 0, 1, 1,
1.052833, -1.331054, 0.9763212, 0, 0, 0, 1, 1,
1.061207, -0.5589495, 1.834861, 0, 0, 0, 1, 1,
1.06186, 0.348126, 2.018665, 0, 0, 0, 1, 1,
1.065384, -0.2773246, 2.214395, 0, 0, 0, 1, 1,
1.077869, -2.648691, 4.192903, 0, 0, 0, 1, 1,
1.08284, -1.820792, 2.496965, 1, 1, 1, 1, 1,
1.08527, -0.520962, 1.921412, 1, 1, 1, 1, 1,
1.092375, -1.218415, 2.665112, 1, 1, 1, 1, 1,
1.095396, -0.1568528, 1.389648, 1, 1, 1, 1, 1,
1.10352, 1.62619, 0.5981745, 1, 1, 1, 1, 1,
1.10421, -1.911078, 2.118253, 1, 1, 1, 1, 1,
1.104742, 0.5474418, 0.8895267, 1, 1, 1, 1, 1,
1.111482, 0.09011093, 1.194107, 1, 1, 1, 1, 1,
1.113428, 0.1379373, -0.2606528, 1, 1, 1, 1, 1,
1.116443, -1.224928, 2.711253, 1, 1, 1, 1, 1,
1.122033, -1.141292, 1.4505, 1, 1, 1, 1, 1,
1.126141, -0.6333069, 2.169596, 1, 1, 1, 1, 1,
1.128369, -0.1354004, 1.105899, 1, 1, 1, 1, 1,
1.12948, 0.9486712, 1.35039, 1, 1, 1, 1, 1,
1.134397, 0.7130185, -0.6869867, 1, 1, 1, 1, 1,
1.147601, 0.4798345, -0.130525, 0, 0, 1, 1, 1,
1.182189, -0.5541055, 4.13051, 1, 0, 0, 1, 1,
1.201988, -0.412648, 2.434977, 1, 0, 0, 1, 1,
1.203609, 0.836472, -1.14344, 1, 0, 0, 1, 1,
1.204769, -0.7000725, 2.540609, 1, 0, 0, 1, 1,
1.207996, -0.4078107, 4.032403, 1, 0, 0, 1, 1,
1.210814, -1.556265, 2.43726, 0, 0, 0, 1, 1,
1.213917, -0.1185711, 0.4820147, 0, 0, 0, 1, 1,
1.221576, 0.3491431, 0.5091256, 0, 0, 0, 1, 1,
1.233746, 0.03140355, 0.9758281, 0, 0, 0, 1, 1,
1.234173, -1.454576, 1.770249, 0, 0, 0, 1, 1,
1.236445, -0.0743352, 3.296743, 0, 0, 0, 1, 1,
1.246253, -0.9118688, 1.504864, 0, 0, 0, 1, 1,
1.258823, -1.248721, 2.631462, 1, 1, 1, 1, 1,
1.268543, -1.050519, 3.183184, 1, 1, 1, 1, 1,
1.273278, -0.5597461, 1.307685, 1, 1, 1, 1, 1,
1.279149, -0.4750308, 3.381595, 1, 1, 1, 1, 1,
1.286735, 0.02464218, 1.967727, 1, 1, 1, 1, 1,
1.289731, -0.1322812, -1.206151, 1, 1, 1, 1, 1,
1.293646, 1.734848, -0.71048, 1, 1, 1, 1, 1,
1.318958, 2.571528, 0.1480402, 1, 1, 1, 1, 1,
1.323682, -1.309036, 1.915711, 1, 1, 1, 1, 1,
1.335616, 0.8343666, 2.410363, 1, 1, 1, 1, 1,
1.337987, 2.565453, 0.5311584, 1, 1, 1, 1, 1,
1.33848, 1.628471, 2.507553, 1, 1, 1, 1, 1,
1.353759, 1.370934, 0.6711536, 1, 1, 1, 1, 1,
1.37369, 1.312292, 1.726506, 1, 1, 1, 1, 1,
1.408403, -0.4680057, 2.341983, 1, 1, 1, 1, 1,
1.409389, -0.5220225, 3.305541, 0, 0, 1, 1, 1,
1.410533, 0.2007642, -0.2179134, 1, 0, 0, 1, 1,
1.411769, -1.3341, 2.7789, 1, 0, 0, 1, 1,
1.436498, 0.9275979, -0.3267387, 1, 0, 0, 1, 1,
1.438707, -1.519995, 2.428015, 1, 0, 0, 1, 1,
1.466553, 0.7497484, 1.086331, 1, 0, 0, 1, 1,
1.491181, 0.686964, 1.057817, 0, 0, 0, 1, 1,
1.50216, 0.3034391, 0.3852869, 0, 0, 0, 1, 1,
1.511719, -1.134339, 2.958003, 0, 0, 0, 1, 1,
1.513693, -0.4786152, 2.240987, 0, 0, 0, 1, 1,
1.521654, 0.2767837, 1.591747, 0, 0, 0, 1, 1,
1.523485, -0.2010943, 1.3659, 0, 0, 0, 1, 1,
1.535316, 0.7392067, 0.8938132, 0, 0, 0, 1, 1,
1.53763, 2.078367, 0.2074084, 1, 1, 1, 1, 1,
1.544981, -0.5113689, 2.860967, 1, 1, 1, 1, 1,
1.548244, 1.01057, 0.94506, 1, 1, 1, 1, 1,
1.54948, -1.231568, 1.575202, 1, 1, 1, 1, 1,
1.555733, -1.492634, 1.851242, 1, 1, 1, 1, 1,
1.58887, -0.800493, 3.01899, 1, 1, 1, 1, 1,
1.59992, -1.318759, 2.155582, 1, 1, 1, 1, 1,
1.604696, -0.07297281, 0.0809485, 1, 1, 1, 1, 1,
1.605389, 0.2291197, 1.190478, 1, 1, 1, 1, 1,
1.624759, 0.2275437, 0.8636766, 1, 1, 1, 1, 1,
1.633995, -0.1949087, 1.32146, 1, 1, 1, 1, 1,
1.639579, -1.362859, 1.980035, 1, 1, 1, 1, 1,
1.642272, 1.982485, -0.1307509, 1, 1, 1, 1, 1,
1.661596, 0.6864346, 0.2830371, 1, 1, 1, 1, 1,
1.669594, 1.323458, 1.078741, 1, 1, 1, 1, 1,
1.708887, 0.3915074, 2.29702, 0, 0, 1, 1, 1,
1.709935, 1.587615, 1.681979, 1, 0, 0, 1, 1,
1.718708, -0.07429814, 3.028418, 1, 0, 0, 1, 1,
1.719941, 2.97004, 0.4960896, 1, 0, 0, 1, 1,
1.719992, 0.3615932, 2.361393, 1, 0, 0, 1, 1,
1.727271, -0.6814268, 1.764945, 1, 0, 0, 1, 1,
1.732162, 1.286246, 1.234768, 0, 0, 0, 1, 1,
1.742798, 0.388998, 1.676925, 0, 0, 0, 1, 1,
1.747501, 0.7553754, 0.6139938, 0, 0, 0, 1, 1,
1.749014, 0.3491005, 0.9731414, 0, 0, 0, 1, 1,
1.764614, -0.528248, 2.272988, 0, 0, 0, 1, 1,
1.788568, 0.6412056, 0.4751442, 0, 0, 0, 1, 1,
1.810471, -0.7732038, 2.332613, 0, 0, 0, 1, 1,
1.811611, 0.7070035, 2.08843, 1, 1, 1, 1, 1,
1.823567, -0.9475462, 3.581151, 1, 1, 1, 1, 1,
1.831087, -0.583275, 2.327502, 1, 1, 1, 1, 1,
1.848394, -0.05473224, 2.657558, 1, 1, 1, 1, 1,
1.856158, 0.644397, 1.874661, 1, 1, 1, 1, 1,
1.877399, 1.256011, -0.6044985, 1, 1, 1, 1, 1,
1.894466, 0.1426039, 1.278361, 1, 1, 1, 1, 1,
1.895351, 0.8440451, 2.350138, 1, 1, 1, 1, 1,
1.896134, -0.6310021, 1.111468, 1, 1, 1, 1, 1,
1.89828, 0.2083792, 1.663666, 1, 1, 1, 1, 1,
1.911247, 0.1873556, 2.340023, 1, 1, 1, 1, 1,
1.912633, -0.2352516, 1.570689, 1, 1, 1, 1, 1,
1.913081, -0.2026979, 3.694088, 1, 1, 1, 1, 1,
1.931614, 1.1923, 0.1834349, 1, 1, 1, 1, 1,
1.932623, -1.810701, 0.1677888, 1, 1, 1, 1, 1,
1.954561, 0.3647408, 1.649249, 0, 0, 1, 1, 1,
1.967188, -1.222297, 1.7878, 1, 0, 0, 1, 1,
1.968617, -1.109541, 2.90107, 1, 0, 0, 1, 1,
1.984932, 2.075418, -1.193651, 1, 0, 0, 1, 1,
1.986322, -1.13635, 2.765088, 1, 0, 0, 1, 1,
1.996214, -0.3791143, 1.237981, 1, 0, 0, 1, 1,
2.002679, -0.6930701, 2.490295, 0, 0, 0, 1, 1,
2.018682, -0.5550048, 1.893667, 0, 0, 0, 1, 1,
2.025809, 0.9620187, 1.310677, 0, 0, 0, 1, 1,
2.048913, -0.5239218, 3.465997, 0, 0, 0, 1, 1,
2.087716, -0.9122659, 2.10813, 0, 0, 0, 1, 1,
2.101448, 0.420656, 1.19185, 0, 0, 0, 1, 1,
2.101551, 0.9442235, 1.425529, 0, 0, 0, 1, 1,
2.11253, 0.5462692, -2.303723, 1, 1, 1, 1, 1,
2.114473, 0.5581017, -0.9154523, 1, 1, 1, 1, 1,
2.134874, 0.7491616, 1.62203, 1, 1, 1, 1, 1,
2.222991, 1.001166, 0.03034354, 1, 1, 1, 1, 1,
2.280151, 0.7811316, 3.036762, 1, 1, 1, 1, 1,
2.388937, -1.202729, 2.573637, 1, 1, 1, 1, 1,
2.865442, 0.389942, 2.287231, 1, 1, 1, 1, 1
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
var radius = 9.337906;
var distance = 32.799;
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
mvMatrix.translate( 0.3628547, -0.2583369, -0.05663133 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.799);
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
