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
-3.269294, -0.8418142, -1.348659, 1, 0, 0, 1,
-2.750144, -1.192229, -3.440196, 1, 0.007843138, 0, 1,
-2.730581, -0.6517484, -0.3625224, 1, 0.01176471, 0, 1,
-2.606933, 0.6482208, 0.6635272, 1, 0.01960784, 0, 1,
-2.584173, 1.561245, -0.9744856, 1, 0.02352941, 0, 1,
-2.516247, -1.505034, -2.423756, 1, 0.03137255, 0, 1,
-2.37693, 0.1415801, -1.445444, 1, 0.03529412, 0, 1,
-2.335403, -0.01324956, -0.9490156, 1, 0.04313726, 0, 1,
-2.3325, -0.455818, -2.405458, 1, 0.04705882, 0, 1,
-2.331874, 0.2397918, -1.260721, 1, 0.05490196, 0, 1,
-2.259472, 1.118463, -1.52848, 1, 0.05882353, 0, 1,
-2.229364, -0.1316822, -2.074412, 1, 0.06666667, 0, 1,
-2.20233, -0.8732761, -1.619145, 1, 0.07058824, 0, 1,
-2.158335, 0.7643276, 0.4485542, 1, 0.07843138, 0, 1,
-2.142112, 0.7197728, 0.3247693, 1, 0.08235294, 0, 1,
-2.141745, -0.3453935, -1.916957, 1, 0.09019608, 0, 1,
-2.130941, 0.08368464, 0.2035995, 1, 0.09411765, 0, 1,
-2.12205, -0.1772319, -3.793516, 1, 0.1019608, 0, 1,
-2.117238, 0.200115, -0.9236428, 1, 0.1098039, 0, 1,
-2.106002, -0.6816885, -2.513863, 1, 0.1137255, 0, 1,
-2.048055, -1.243693, -0.7949297, 1, 0.1215686, 0, 1,
-2.017874, -2.582782, -3.266849, 1, 0.1254902, 0, 1,
-1.978815, 1.725559, -1.340544, 1, 0.1333333, 0, 1,
-1.967157, -0.7597885, -2.235475, 1, 0.1372549, 0, 1,
-1.953363, 0.2098127, -2.529517, 1, 0.145098, 0, 1,
-1.942188, -0.3457024, -1.977565, 1, 0.1490196, 0, 1,
-1.92782, 0.1343269, -0.6721858, 1, 0.1568628, 0, 1,
-1.917432, 0.8538546, -1.247455, 1, 0.1607843, 0, 1,
-1.909916, -0.8822225, -2.696872, 1, 0.1686275, 0, 1,
-1.909338, 0.6793804, -1.230686, 1, 0.172549, 0, 1,
-1.907425, 0.4002207, -1.029756, 1, 0.1803922, 0, 1,
-1.903779, 0.6400165, -0.8302002, 1, 0.1843137, 0, 1,
-1.892199, -1.119872, -3.400448, 1, 0.1921569, 0, 1,
-1.860022, -0.2031896, -0.6167989, 1, 0.1960784, 0, 1,
-1.826073, 1.41828, -0.9341102, 1, 0.2039216, 0, 1,
-1.739753, 1.918054, -1.278082, 1, 0.2117647, 0, 1,
-1.735721, -0.1297828, -2.694836, 1, 0.2156863, 0, 1,
-1.731104, 0.3381694, -1.978174, 1, 0.2235294, 0, 1,
-1.727577, 0.5379444, -1.641748, 1, 0.227451, 0, 1,
-1.725059, 0.533596, -2.100858, 1, 0.2352941, 0, 1,
-1.697652, -1.170275, -3.685727, 1, 0.2392157, 0, 1,
-1.637386, 1.901966, -1.064837, 1, 0.2470588, 0, 1,
-1.629128, -0.7839713, -3.199292, 1, 0.2509804, 0, 1,
-1.626366, -0.2021516, -3.307019, 1, 0.2588235, 0, 1,
-1.62524, 0.8998453, -0.0954562, 1, 0.2627451, 0, 1,
-1.623978, 0.3055086, -1.630602, 1, 0.2705882, 0, 1,
-1.604355, 1.885142, -0.6017209, 1, 0.2745098, 0, 1,
-1.604219, 0.6952105, 0.5776629, 1, 0.282353, 0, 1,
-1.600982, 0.4024019, -2.378016, 1, 0.2862745, 0, 1,
-1.591049, -0.2752829, -2.078126, 1, 0.2941177, 0, 1,
-1.568679, 0.0416076, -3.503179, 1, 0.3019608, 0, 1,
-1.565806, 1.503073, 0.3417956, 1, 0.3058824, 0, 1,
-1.548253, -0.5735748, -1.281489, 1, 0.3137255, 0, 1,
-1.547973, -0.7163346, -1.258918, 1, 0.3176471, 0, 1,
-1.543202, 0.9467443, -2.413622, 1, 0.3254902, 0, 1,
-1.533524, 0.2559923, -0.6125147, 1, 0.3294118, 0, 1,
-1.533444, 2.189133, 0.2581866, 1, 0.3372549, 0, 1,
-1.528353, -0.1412679, -2.08425, 1, 0.3411765, 0, 1,
-1.515495, -0.2436908, -1.774027, 1, 0.3490196, 0, 1,
-1.51473, -1.015302, -1.623452, 1, 0.3529412, 0, 1,
-1.491634, -1.554113, -1.529045, 1, 0.3607843, 0, 1,
-1.487478, 0.6989877, -0.6496448, 1, 0.3647059, 0, 1,
-1.48071, 1.054774, -1.564787, 1, 0.372549, 0, 1,
-1.47992, 1.158586, -0.9668926, 1, 0.3764706, 0, 1,
-1.473035, -0.1981505, -2.921285, 1, 0.3843137, 0, 1,
-1.468754, 0.9234151, -1.450616, 1, 0.3882353, 0, 1,
-1.465406, 0.1296813, 0.9330803, 1, 0.3960784, 0, 1,
-1.462962, -1.188144, -2.34314, 1, 0.4039216, 0, 1,
-1.459885, -1.916296, -1.9408, 1, 0.4078431, 0, 1,
-1.425781, -0.05428056, -1.728571, 1, 0.4156863, 0, 1,
-1.414903, -0.07603446, -1.706616, 1, 0.4196078, 0, 1,
-1.414147, 1.421632, -1.352108, 1, 0.427451, 0, 1,
-1.408889, -0.7371858, -1.405268, 1, 0.4313726, 0, 1,
-1.408062, -0.1306412, -2.791812, 1, 0.4392157, 0, 1,
-1.394294, 0.3602459, 0.2231195, 1, 0.4431373, 0, 1,
-1.388962, 1.810491, 0.3877404, 1, 0.4509804, 0, 1,
-1.353201, -1.109536, -2.686536, 1, 0.454902, 0, 1,
-1.342045, 0.2333824, -0.6735008, 1, 0.4627451, 0, 1,
-1.340342, -0.7819437, -2.723486, 1, 0.4666667, 0, 1,
-1.339931, 0.5587649, -1.700136, 1, 0.4745098, 0, 1,
-1.330567, 0.7381548, -1.865994, 1, 0.4784314, 0, 1,
-1.324236, 0.199054, -1.753529, 1, 0.4862745, 0, 1,
-1.323136, 0.6690758, -2.005582, 1, 0.4901961, 0, 1,
-1.317871, -2.113828, -1.941966, 1, 0.4980392, 0, 1,
-1.315031, 1.827475, -0.1371035, 1, 0.5058824, 0, 1,
-1.29111, -1.946227, -2.075891, 1, 0.509804, 0, 1,
-1.285036, -0.05644969, -2.189312, 1, 0.5176471, 0, 1,
-1.28278, -1.27224, -5.627464, 1, 0.5215687, 0, 1,
-1.278258, -0.3712364, -0.5030385, 1, 0.5294118, 0, 1,
-1.265966, -1.05506, -1.685623, 1, 0.5333334, 0, 1,
-1.260392, -0.3523736, -1.823311, 1, 0.5411765, 0, 1,
-1.253142, -0.1370627, -0.5338873, 1, 0.5450981, 0, 1,
-1.246976, -0.6466034, -4.323192, 1, 0.5529412, 0, 1,
-1.240698, -0.4120406, -3.235637, 1, 0.5568628, 0, 1,
-1.239693, 0.5255195, -0.8002578, 1, 0.5647059, 0, 1,
-1.235929, 1.152619, -1.413938, 1, 0.5686275, 0, 1,
-1.226096, 0.5315766, -3.271197, 1, 0.5764706, 0, 1,
-1.208285, -0.7489782, -3.429507, 1, 0.5803922, 0, 1,
-1.207751, 0.7020901, -0.9448485, 1, 0.5882353, 0, 1,
-1.201742, 0.6994466, -1.204015, 1, 0.5921569, 0, 1,
-1.19989, 0.230123, -2.13229, 1, 0.6, 0, 1,
-1.198107, -0.3681908, -1.59309, 1, 0.6078432, 0, 1,
-1.197048, 0.5916963, 0.5413892, 1, 0.6117647, 0, 1,
-1.190675, 0.7118789, -1.012626, 1, 0.6196079, 0, 1,
-1.18261, 0.4226559, -1.262916, 1, 0.6235294, 0, 1,
-1.17553, -0.8829864, -2.888934, 1, 0.6313726, 0, 1,
-1.174381, 0.07223799, -2.009827, 1, 0.6352941, 0, 1,
-1.169495, -0.2295072, -2.258382, 1, 0.6431373, 0, 1,
-1.168765, -1.639259, -3.978603, 1, 0.6470588, 0, 1,
-1.161747, -1.511219, -3.659402, 1, 0.654902, 0, 1,
-1.161262, -0.2828392, 0.7181591, 1, 0.6588235, 0, 1,
-1.158986, 0.8340219, -1.153944, 1, 0.6666667, 0, 1,
-1.157897, -0.4113093, -2.973558, 1, 0.6705883, 0, 1,
-1.155712, -0.3829394, -0.5736845, 1, 0.6784314, 0, 1,
-1.152526, 0.3368608, -1.796097, 1, 0.682353, 0, 1,
-1.151743, 0.8005735, -0.4129021, 1, 0.6901961, 0, 1,
-1.150983, 0.4705985, -1.986428, 1, 0.6941177, 0, 1,
-1.144078, -0.03553467, -3.388534, 1, 0.7019608, 0, 1,
-1.141811, 1.215107, -1.04674, 1, 0.7098039, 0, 1,
-1.140012, -1.888147, -0.8991841, 1, 0.7137255, 0, 1,
-1.130218, -1.28876, -0.8846887, 1, 0.7215686, 0, 1,
-1.128145, 1.30901, -0.2292382, 1, 0.7254902, 0, 1,
-1.126736, -0.3958063, -2.377014, 1, 0.7333333, 0, 1,
-1.123902, 2.185087, -1.501841, 1, 0.7372549, 0, 1,
-1.122904, -1.13033, -3.816617, 1, 0.7450981, 0, 1,
-1.11904, 0.5524574, -2.031991, 1, 0.7490196, 0, 1,
-1.117185, -0.5863188, -2.121764, 1, 0.7568628, 0, 1,
-1.113185, 0.1999653, -0.8579654, 1, 0.7607843, 0, 1,
-1.111057, -0.8270774, -2.546072, 1, 0.7686275, 0, 1,
-1.109866, 0.9207657, -0.4531704, 1, 0.772549, 0, 1,
-1.106034, 1.138009, -0.3208521, 1, 0.7803922, 0, 1,
-1.102686, 0.9342207, -1.499542, 1, 0.7843137, 0, 1,
-1.101738, -0.1624943, -2.487584, 1, 0.7921569, 0, 1,
-1.09971, 0.2965433, -2.829269, 1, 0.7960784, 0, 1,
-1.096568, -0.4674045, -2.648857, 1, 0.8039216, 0, 1,
-1.09557, 0.6038727, -0.7059574, 1, 0.8117647, 0, 1,
-1.087423, -2.396053, -2.085048, 1, 0.8156863, 0, 1,
-1.083027, -0.8147851, -2.751299, 1, 0.8235294, 0, 1,
-1.075336, 0.07757635, -3.169022, 1, 0.827451, 0, 1,
-1.075233, 0.4571278, -1.87278, 1, 0.8352941, 0, 1,
-1.068581, -0.693526, -1.70186, 1, 0.8392157, 0, 1,
-1.064404, -0.2652134, -2.828158, 1, 0.8470588, 0, 1,
-1.064309, 0.1449003, -1.971988, 1, 0.8509804, 0, 1,
-1.054222, 0.8591118, -1.26153, 1, 0.8588235, 0, 1,
-1.052898, 0.3124886, -0.05187805, 1, 0.8627451, 0, 1,
-1.052012, -1.044058, -3.934148, 1, 0.8705882, 0, 1,
-1.050929, -0.2931345, -1.468973, 1, 0.8745098, 0, 1,
-1.041896, 0.0863021, -1.356395, 1, 0.8823529, 0, 1,
-1.035044, -1.233175, -1.419527, 1, 0.8862745, 0, 1,
-1.032965, 0.1927911, -2.135072, 1, 0.8941177, 0, 1,
-1.024463, -0.7654712, -1.64515, 1, 0.8980392, 0, 1,
-1.020743, 0.823257, -2.792671, 1, 0.9058824, 0, 1,
-1.019377, -0.4829487, 1.061946, 1, 0.9137255, 0, 1,
-1.014111, 1.467692, -1.918063, 1, 0.9176471, 0, 1,
-1.009344, 2.278355, 0.03285113, 1, 0.9254902, 0, 1,
-1.006821, 0.4072146, -1.099431, 1, 0.9294118, 0, 1,
-1.003187, -0.4824294, -2.854671, 1, 0.9372549, 0, 1,
-1.002501, -0.2800039, -0.7378169, 1, 0.9411765, 0, 1,
-0.983746, 0.0303642, -2.196421, 1, 0.9490196, 0, 1,
-0.9810468, 0.1769605, -2.86449, 1, 0.9529412, 0, 1,
-0.9768318, -1.525441, -2.478355, 1, 0.9607843, 0, 1,
-0.9707363, 1.268149, -0.08424401, 1, 0.9647059, 0, 1,
-0.9636123, 0.09780284, -1.136895, 1, 0.972549, 0, 1,
-0.9633613, -0.1874024, -1.047185, 1, 0.9764706, 0, 1,
-0.9599534, 1.498551, -0.04319942, 1, 0.9843137, 0, 1,
-0.9586126, -0.658021, -1.593645, 1, 0.9882353, 0, 1,
-0.9578533, 0.7084582, -0.6377175, 1, 0.9960784, 0, 1,
-0.9531786, 1.370861, 0.814209, 0.9960784, 1, 0, 1,
-0.9499033, 0.5107671, -2.529086, 0.9921569, 1, 0, 1,
-0.9483906, 0.08135657, -2.54295, 0.9843137, 1, 0, 1,
-0.9448658, -1.278856, -2.61267, 0.9803922, 1, 0, 1,
-0.9428933, 0.179102, -1.28162, 0.972549, 1, 0, 1,
-0.942336, -1.219711, -1.579759, 0.9686275, 1, 0, 1,
-0.9411315, -1.634194, -2.152928, 0.9607843, 1, 0, 1,
-0.9408113, 0.7540171, -1.302265, 0.9568627, 1, 0, 1,
-0.9383496, 0.5038572, -1.250468, 0.9490196, 1, 0, 1,
-0.9373494, 0.217135, -0.5376361, 0.945098, 1, 0, 1,
-0.9368668, 1.753472, -0.7861047, 0.9372549, 1, 0, 1,
-0.9297539, -0.1740688, -2.486319, 0.9333333, 1, 0, 1,
-0.9284567, 0.8114331, -1.087172, 0.9254902, 1, 0, 1,
-0.9207863, 1.039265, -0.3464233, 0.9215686, 1, 0, 1,
-0.9154227, 1.343492, -1.2511, 0.9137255, 1, 0, 1,
-0.9144028, -0.03085203, -2.780492, 0.9098039, 1, 0, 1,
-0.9132045, 0.05243056, -0.8183596, 0.9019608, 1, 0, 1,
-0.9128568, -0.4965236, -2.546631, 0.8941177, 1, 0, 1,
-0.9044723, 0.3853142, -0.4380272, 0.8901961, 1, 0, 1,
-0.9034895, -0.2959047, -2.560658, 0.8823529, 1, 0, 1,
-0.8977184, -0.7939722, -1.722204, 0.8784314, 1, 0, 1,
-0.89164, 1.068613, -1.486987, 0.8705882, 1, 0, 1,
-0.890335, 0.4271568, 1.107229, 0.8666667, 1, 0, 1,
-0.8896301, -0.7680586, -2.740447, 0.8588235, 1, 0, 1,
-0.8837991, -1.936476, -3.213699, 0.854902, 1, 0, 1,
-0.8810413, -0.6952464, -3.608993, 0.8470588, 1, 0, 1,
-0.8730131, 0.7828416, 2.518309, 0.8431373, 1, 0, 1,
-0.8575548, -1.670052, -2.879982, 0.8352941, 1, 0, 1,
-0.8551421, -0.03150472, -1.163304, 0.8313726, 1, 0, 1,
-0.8517612, 0.04127247, -1.379602, 0.8235294, 1, 0, 1,
-0.8507861, 1.295081, 0.8300532, 0.8196079, 1, 0, 1,
-0.8497632, -1.173081, -2.418099, 0.8117647, 1, 0, 1,
-0.849668, -0.2547375, -1.56817, 0.8078431, 1, 0, 1,
-0.847412, 0.635463, 1.20676, 0.8, 1, 0, 1,
-0.8344831, 1.962528, -1.152861, 0.7921569, 1, 0, 1,
-0.8247395, 0.8490831, -0.2338617, 0.7882353, 1, 0, 1,
-0.8207564, -0.2329235, -1.337223, 0.7803922, 1, 0, 1,
-0.820536, 0.619749, -1.554773, 0.7764706, 1, 0, 1,
-0.8127456, -0.3835965, -3.013222, 0.7686275, 1, 0, 1,
-0.8065376, 0.3339768, -2.19093, 0.7647059, 1, 0, 1,
-0.8036031, 1.415419, -0.3345286, 0.7568628, 1, 0, 1,
-0.803591, 0.6075175, -2.952241, 0.7529412, 1, 0, 1,
-0.8003196, 2.347891, -0.3430838, 0.7450981, 1, 0, 1,
-0.7997542, 2.409183, 0.2286694, 0.7411765, 1, 0, 1,
-0.7921243, 0.5501109, -0.6372645, 0.7333333, 1, 0, 1,
-0.7860199, 0.523391, 0.3047515, 0.7294118, 1, 0, 1,
-0.7832806, 2.345296, -0.2075428, 0.7215686, 1, 0, 1,
-0.7829962, -0.2076327, -1.534085, 0.7176471, 1, 0, 1,
-0.7821928, 0.6969526, 0.6925913, 0.7098039, 1, 0, 1,
-0.7778122, 0.170652, -2.723206, 0.7058824, 1, 0, 1,
-0.7757581, -0.1469334, -1.672682, 0.6980392, 1, 0, 1,
-0.7667086, -0.1113355, -3.151473, 0.6901961, 1, 0, 1,
-0.7619461, -0.2371648, -1.95982, 0.6862745, 1, 0, 1,
-0.7608202, -1.789639, -2.999299, 0.6784314, 1, 0, 1,
-0.7563968, -1.633939, -3.474704, 0.6745098, 1, 0, 1,
-0.7497591, -0.259744, -2.308358, 0.6666667, 1, 0, 1,
-0.7404993, 0.459454, -2.031175, 0.6627451, 1, 0, 1,
-0.7393886, 0.3722951, -1.38845, 0.654902, 1, 0, 1,
-0.7368951, -0.06047652, -1.91317, 0.6509804, 1, 0, 1,
-0.7230579, 0.9405068, 1.941545, 0.6431373, 1, 0, 1,
-0.7197879, 0.4892823, -0.9474533, 0.6392157, 1, 0, 1,
-0.7183114, 0.2416981, -1.654458, 0.6313726, 1, 0, 1,
-0.7121339, 0.1757377, -1.989869, 0.627451, 1, 0, 1,
-0.7103612, -0.4226648, -2.555982, 0.6196079, 1, 0, 1,
-0.6996197, -0.4184892, -2.943661, 0.6156863, 1, 0, 1,
-0.6919441, -0.7832236, -4.038858, 0.6078432, 1, 0, 1,
-0.6906378, 0.01740067, -0.5551735, 0.6039216, 1, 0, 1,
-0.6901418, 0.9668727, -2.117334, 0.5960785, 1, 0, 1,
-0.6880175, 1.180226, -1.049602, 0.5882353, 1, 0, 1,
-0.6859174, 0.8333633, 1.158968, 0.5843138, 1, 0, 1,
-0.6811368, -0.02413598, -3.196, 0.5764706, 1, 0, 1,
-0.6803201, 0.05539842, -1.203498, 0.572549, 1, 0, 1,
-0.6735391, 0.08925781, -1.569229, 0.5647059, 1, 0, 1,
-0.6681784, -1.553195, -3.875323, 0.5607843, 1, 0, 1,
-0.6571842, -1.77532, -4.170592, 0.5529412, 1, 0, 1,
-0.6526095, -1.022851, -1.947015, 0.5490196, 1, 0, 1,
-0.6341879, 0.8405786, -1.819988, 0.5411765, 1, 0, 1,
-0.6324739, -1.33029, -2.609771, 0.5372549, 1, 0, 1,
-0.631732, 2.075382, 0.5836796, 0.5294118, 1, 0, 1,
-0.6255531, 0.1855432, -2.002608, 0.5254902, 1, 0, 1,
-0.6254972, 0.4759291, -0.8273685, 0.5176471, 1, 0, 1,
-0.6249268, 2.633277, 0.7554751, 0.5137255, 1, 0, 1,
-0.6227717, 1.425201, -0.8347826, 0.5058824, 1, 0, 1,
-0.6221716, -0.1255728, -0.8240939, 0.5019608, 1, 0, 1,
-0.6209869, -0.4483688, -1.667633, 0.4941176, 1, 0, 1,
-0.6189683, -0.6868273, -3.657092, 0.4862745, 1, 0, 1,
-0.6175738, -1.139558, -2.938, 0.4823529, 1, 0, 1,
-0.6159691, -0.4796948, -3.031321, 0.4745098, 1, 0, 1,
-0.6147611, -1.398669, -2.576768, 0.4705882, 1, 0, 1,
-0.6112725, -0.2942595, -2.327828, 0.4627451, 1, 0, 1,
-0.6106331, 0.220744, -0.1223917, 0.4588235, 1, 0, 1,
-0.6093534, 0.1632608, 0.2074798, 0.4509804, 1, 0, 1,
-0.6089024, 1.219937, -1.071186, 0.4470588, 1, 0, 1,
-0.6079338, 1.69342, -0.1542289, 0.4392157, 1, 0, 1,
-0.6052293, 0.250797, -2.056435, 0.4352941, 1, 0, 1,
-0.599151, 0.3526483, 1.15699, 0.427451, 1, 0, 1,
-0.5983151, -0.5772231, -1.828447, 0.4235294, 1, 0, 1,
-0.5964113, 0.7208904, -1.778369, 0.4156863, 1, 0, 1,
-0.5943314, -0.6964171, -4.868081, 0.4117647, 1, 0, 1,
-0.5922995, -1.096672, -1.782645, 0.4039216, 1, 0, 1,
-0.5884416, 0.6825966, -0.968362, 0.3960784, 1, 0, 1,
-0.5877346, 0.3211465, -3.486342, 0.3921569, 1, 0, 1,
-0.5860069, -1.274143, -3.485868, 0.3843137, 1, 0, 1,
-0.5854306, -1.076351, -3.094219, 0.3803922, 1, 0, 1,
-0.5791847, 0.325623, -0.672336, 0.372549, 1, 0, 1,
-0.5717342, -1.319174, -2.1432, 0.3686275, 1, 0, 1,
-0.5712008, -1.038566, -3.712893, 0.3607843, 1, 0, 1,
-0.5634611, 0.765488, -0.02124263, 0.3568628, 1, 0, 1,
-0.5608996, -0.5075917, -1.061345, 0.3490196, 1, 0, 1,
-0.5582904, 0.6130109, -1.326766, 0.345098, 1, 0, 1,
-0.5541254, -0.366351, -1.891625, 0.3372549, 1, 0, 1,
-0.5480649, -0.02467863, -0.9857534, 0.3333333, 1, 0, 1,
-0.5457331, 2.642939, 1.020088, 0.3254902, 1, 0, 1,
-0.5439545, -0.5954509, -3.452244, 0.3215686, 1, 0, 1,
-0.5430416, 0.3863141, -1.163466, 0.3137255, 1, 0, 1,
-0.5397844, -0.8994316, -2.462478, 0.3098039, 1, 0, 1,
-0.5396973, 1.476009, 0.2004986, 0.3019608, 1, 0, 1,
-0.5388723, 0.1166424, -0.8720676, 0.2941177, 1, 0, 1,
-0.5344052, -0.6171733, -3.134475, 0.2901961, 1, 0, 1,
-0.5340894, -0.2409747, -2.730518, 0.282353, 1, 0, 1,
-0.5340779, 0.2839582, -0.9559001, 0.2784314, 1, 0, 1,
-0.5318016, -0.2684374, -2.229487, 0.2705882, 1, 0, 1,
-0.5312597, 1.498292, -2.858482, 0.2666667, 1, 0, 1,
-0.5237009, 2.016936, 1.480608, 0.2588235, 1, 0, 1,
-0.5221208, 0.0537888, -0.7992082, 0.254902, 1, 0, 1,
-0.5208007, -0.9146248, -2.86387, 0.2470588, 1, 0, 1,
-0.5194576, 2.141191, -0.7313759, 0.2431373, 1, 0, 1,
-0.5188085, -0.3545971, -3.085719, 0.2352941, 1, 0, 1,
-0.5185896, 0.5131445, -0.9611247, 0.2313726, 1, 0, 1,
-0.5127713, 0.9895718, -0.5657139, 0.2235294, 1, 0, 1,
-0.5127366, 0.6000472, -0.2952708, 0.2196078, 1, 0, 1,
-0.5115328, 0.2355725, -2.489406, 0.2117647, 1, 0, 1,
-0.5069073, 1.095846, -0.6192298, 0.2078431, 1, 0, 1,
-0.5059124, 0.6765392, -1.843261, 0.2, 1, 0, 1,
-0.5018144, -1.103506, -3.388965, 0.1921569, 1, 0, 1,
-0.5000708, -0.4247123, -2.102274, 0.1882353, 1, 0, 1,
-0.4995877, -0.1606798, -1.796348, 0.1803922, 1, 0, 1,
-0.498484, 0.9853818, 2.337441, 0.1764706, 1, 0, 1,
-0.498426, 0.5328745, 1.105359, 0.1686275, 1, 0, 1,
-0.4942336, -1.012541, -2.965326, 0.1647059, 1, 0, 1,
-0.4907612, 0.3598369, -2.262311, 0.1568628, 1, 0, 1,
-0.488847, 0.1911747, -2.690206, 0.1529412, 1, 0, 1,
-0.4876912, 0.3145261, 0.105221, 0.145098, 1, 0, 1,
-0.4875447, 0.4809585, 1.078183, 0.1411765, 1, 0, 1,
-0.487093, 1.065337, -0.627111, 0.1333333, 1, 0, 1,
-0.4794624, 2.228484, 0.4354877, 0.1294118, 1, 0, 1,
-0.4793868, 0.6947865, -1.388789, 0.1215686, 1, 0, 1,
-0.4780759, -0.4961447, -1.607749, 0.1176471, 1, 0, 1,
-0.4738194, 0.0165209, -0.2932786, 0.1098039, 1, 0, 1,
-0.4715537, 0.2090737, -2.382348, 0.1058824, 1, 0, 1,
-0.4709223, -0.6756156, -2.496176, 0.09803922, 1, 0, 1,
-0.4705323, 1.365939, -1.89763, 0.09019608, 1, 0, 1,
-0.4688036, -1.267333, -4.016028, 0.08627451, 1, 0, 1,
-0.4653566, 0.5008104, -0.6934765, 0.07843138, 1, 0, 1,
-0.4642402, -0.295593, -1.077834, 0.07450981, 1, 0, 1,
-0.4535455, -0.4408213, -1.574423, 0.06666667, 1, 0, 1,
-0.4516689, 0.4369012, -2.180008, 0.0627451, 1, 0, 1,
-0.4508556, 0.3180022, -1.805918, 0.05490196, 1, 0, 1,
-0.4460968, 1.099355, -1.990589, 0.05098039, 1, 0, 1,
-0.441707, 0.3673636, -2.085298, 0.04313726, 1, 0, 1,
-0.4414866, -0.2550677, -1.712059, 0.03921569, 1, 0, 1,
-0.4408492, 0.4318774, -1.77179, 0.03137255, 1, 0, 1,
-0.4403708, -1.230398, -2.576622, 0.02745098, 1, 0, 1,
-0.440043, -2.236497, -2.00513, 0.01960784, 1, 0, 1,
-0.4391792, -0.03773801, -2.321305, 0.01568628, 1, 0, 1,
-0.4387565, 0.004278641, -1.852624, 0.007843138, 1, 0, 1,
-0.4344205, 0.1060551, -0.911374, 0.003921569, 1, 0, 1,
-0.4331234, 0.2656105, -0.6101816, 0, 1, 0.003921569, 1,
-0.4328794, 0.4342927, -2.19246, 0, 1, 0.01176471, 1,
-0.4328002, 0.9636233, -0.1686756, 0, 1, 0.01568628, 1,
-0.429668, -1.046789, -2.814091, 0, 1, 0.02352941, 1,
-0.4284272, 1.197437, -0.2354985, 0, 1, 0.02745098, 1,
-0.4255743, -0.04370811, -2.996438, 0, 1, 0.03529412, 1,
-0.4216292, -0.9902331, -0.4624864, 0, 1, 0.03921569, 1,
-0.4194816, 2.073878, 0.6383455, 0, 1, 0.04705882, 1,
-0.4178765, -0.5572554, -1.353061, 0, 1, 0.05098039, 1,
-0.414688, 0.08769493, -3.230343, 0, 1, 0.05882353, 1,
-0.4120477, -1.888718, -3.299873, 0, 1, 0.0627451, 1,
-0.4106061, -0.6506593, -3.004942, 0, 1, 0.07058824, 1,
-0.4101634, -0.8468087, -2.275088, 0, 1, 0.07450981, 1,
-0.4049442, 0.09938402, -1.137385, 0, 1, 0.08235294, 1,
-0.4047266, -0.2975841, -2.198745, 0, 1, 0.08627451, 1,
-0.4020729, 0.6484913, -0.3656213, 0, 1, 0.09411765, 1,
-0.3960421, -0.7849777, -3.563473, 0, 1, 0.1019608, 1,
-0.3883118, -0.8749813, -2.627208, 0, 1, 0.1058824, 1,
-0.388297, 1.038167, 0.6235262, 0, 1, 0.1137255, 1,
-0.3877174, 0.7495127, -0.8032839, 0, 1, 0.1176471, 1,
-0.3769408, 0.03919554, -2.881146, 0, 1, 0.1254902, 1,
-0.3746523, -0.2752796, -1.892539, 0, 1, 0.1294118, 1,
-0.3721122, -0.1112065, -1.414413, 0, 1, 0.1372549, 1,
-0.3719271, -2.842481, -1.976186, 0, 1, 0.1411765, 1,
-0.3674888, -0.8133084, -2.998235, 0, 1, 0.1490196, 1,
-0.3643993, -0.7352793, -2.508808, 0, 1, 0.1529412, 1,
-0.3637883, 0.3076384, -1.228307, 0, 1, 0.1607843, 1,
-0.3626433, -0.8476122, -1.609499, 0, 1, 0.1647059, 1,
-0.3549288, 2.176245, 1.239074, 0, 1, 0.172549, 1,
-0.352129, 2.388667, 0.965947, 0, 1, 0.1764706, 1,
-0.3517679, 0.7532828, -0.2623637, 0, 1, 0.1843137, 1,
-0.3508072, -1.50076, -5.495614, 0, 1, 0.1882353, 1,
-0.3423741, 0.837796, 0.198712, 0, 1, 0.1960784, 1,
-0.3413968, 0.1393721, -1.950894, 0, 1, 0.2039216, 1,
-0.3358464, -0.486132, -2.864544, 0, 1, 0.2078431, 1,
-0.3354968, 0.1170232, 0.07921772, 0, 1, 0.2156863, 1,
-0.332464, -0.8805324, -3.273208, 0, 1, 0.2196078, 1,
-0.3237076, -0.5528037, -2.090086, 0, 1, 0.227451, 1,
-0.3219324, -0.8118773, -3.270027, 0, 1, 0.2313726, 1,
-0.3206116, -0.4100938, -2.604554, 0, 1, 0.2392157, 1,
-0.3202685, 0.7069274, 1.08223, 0, 1, 0.2431373, 1,
-0.3201829, -0.2815148, -2.162687, 0, 1, 0.2509804, 1,
-0.3200284, 0.06579894, -1.028413, 0, 1, 0.254902, 1,
-0.3152256, 0.2807055, -0.8525341, 0, 1, 0.2627451, 1,
-0.3141922, 1.375846, -1.225938, 0, 1, 0.2666667, 1,
-0.3116124, 0.6283339, -0.3695083, 0, 1, 0.2745098, 1,
-0.3103314, 1.011341, 0.8322382, 0, 1, 0.2784314, 1,
-0.3096544, -1.445632, -2.92967, 0, 1, 0.2862745, 1,
-0.3084074, 0.9219777, -0.3991027, 0, 1, 0.2901961, 1,
-0.3054515, 1.059364, -0.2369085, 0, 1, 0.2980392, 1,
-0.3041671, -0.6401693, -2.403653, 0, 1, 0.3058824, 1,
-0.3036721, -1.372036, -2.384835, 0, 1, 0.3098039, 1,
-0.303662, -1.080455, -2.808539, 0, 1, 0.3176471, 1,
-0.2935483, 1.184489, 0.3365256, 0, 1, 0.3215686, 1,
-0.290325, 0.7527266, -1.589917, 0, 1, 0.3294118, 1,
-0.2901337, -0.8146679, -1.670698, 0, 1, 0.3333333, 1,
-0.2890335, -2.077127, -1.946886, 0, 1, 0.3411765, 1,
-0.2889034, 0.380806, -0.6209131, 0, 1, 0.345098, 1,
-0.2878999, 0.4364245, -1.415667, 0, 1, 0.3529412, 1,
-0.2861772, -0.4395963, -1.532422, 0, 1, 0.3568628, 1,
-0.2853358, -2.712232, -2.830268, 0, 1, 0.3647059, 1,
-0.2847273, -0.1991117, -2.020764, 0, 1, 0.3686275, 1,
-0.2831678, 0.1608194, -0.07648987, 0, 1, 0.3764706, 1,
-0.2820616, -0.3721449, -2.211233, 0, 1, 0.3803922, 1,
-0.2809424, -0.7717243, -2.592861, 0, 1, 0.3882353, 1,
-0.2805581, -0.3771383, -4.678872, 0, 1, 0.3921569, 1,
-0.2711498, -1.175129, -1.721558, 0, 1, 0.4, 1,
-0.2665483, -0.1851399, -4.454589, 0, 1, 0.4078431, 1,
-0.2660981, -1.65573, -1.356129, 0, 1, 0.4117647, 1,
-0.258657, 1.25394, 0.2053946, 0, 1, 0.4196078, 1,
-0.2574785, 0.9581521, -0.8347585, 0, 1, 0.4235294, 1,
-0.2562606, -1.052321, -1.562766, 0, 1, 0.4313726, 1,
-0.2489556, 1.064276, 0.6912879, 0, 1, 0.4352941, 1,
-0.2455621, -2.136998, -3.354715, 0, 1, 0.4431373, 1,
-0.2452988, -0.8313259, -4.182975, 0, 1, 0.4470588, 1,
-0.2449001, 0.7353734, -0.1125963, 0, 1, 0.454902, 1,
-0.2435158, 0.7711814, 1.160012, 0, 1, 0.4588235, 1,
-0.2432473, 0.4781943, -0.8802593, 0, 1, 0.4666667, 1,
-0.2415611, -0.1096776, -3.199983, 0, 1, 0.4705882, 1,
-0.2395158, -0.7637551, -1.408866, 0, 1, 0.4784314, 1,
-0.2392908, -1.103916, -2.44306, 0, 1, 0.4823529, 1,
-0.2287328, -1.255713, -4.385345, 0, 1, 0.4901961, 1,
-0.2133207, -1.5502, -3.618486, 0, 1, 0.4941176, 1,
-0.2119954, 0.9406596, -0.09216598, 0, 1, 0.5019608, 1,
-0.2094332, -0.7670225, -0.8176759, 0, 1, 0.509804, 1,
-0.2059009, -0.5314214, -2.951976, 0, 1, 0.5137255, 1,
-0.2058531, -1.928338, -1.533535, 0, 1, 0.5215687, 1,
-0.204426, 1.521432, -0.902117, 0, 1, 0.5254902, 1,
-0.2038184, -0.663295, -1.858882, 0, 1, 0.5333334, 1,
-0.2032398, 0.4021188, 0.6468578, 0, 1, 0.5372549, 1,
-0.2007072, 0.4270703, -0.6432486, 0, 1, 0.5450981, 1,
-0.2002054, -0.5463347, -3.671454, 0, 1, 0.5490196, 1,
-0.1869468, -0.1479425, -1.684988, 0, 1, 0.5568628, 1,
-0.183105, -0.4788391, -2.430512, 0, 1, 0.5607843, 1,
-0.1817253, 0.09643994, -1.861918, 0, 1, 0.5686275, 1,
-0.1815371, -0.3006521, -1.526029, 0, 1, 0.572549, 1,
-0.1806543, -0.3382041, -2.843029, 0, 1, 0.5803922, 1,
-0.1793942, 0.3326905, -0.495315, 0, 1, 0.5843138, 1,
-0.177623, 0.2033023, -1.125836, 0, 1, 0.5921569, 1,
-0.1711035, -0.4640111, -3.395956, 0, 1, 0.5960785, 1,
-0.1690496, -0.09312525, -0.3876749, 0, 1, 0.6039216, 1,
-0.1677976, -0.1138351, -0.566707, 0, 1, 0.6117647, 1,
-0.1663731, 1.074733, 0.2231625, 0, 1, 0.6156863, 1,
-0.166218, -0.1621476, -4.107198, 0, 1, 0.6235294, 1,
-0.1648187, -2.277794, -4.540902, 0, 1, 0.627451, 1,
-0.159041, 0.09605839, -1.012957, 0, 1, 0.6352941, 1,
-0.1585021, -1.323618, -3.776092, 0, 1, 0.6392157, 1,
-0.1574583, 1.511431, 0.4237004, 0, 1, 0.6470588, 1,
-0.1482977, 0.7309624, -2.549352, 0, 1, 0.6509804, 1,
-0.1476235, 0.0682045, -1.640027, 0, 1, 0.6588235, 1,
-0.1464048, 3.033165, -0.6968467, 0, 1, 0.6627451, 1,
-0.1457294, 0.845125, -0.467172, 0, 1, 0.6705883, 1,
-0.1343782, -0.199817, -2.904268, 0, 1, 0.6745098, 1,
-0.1321005, -0.5935959, -3.502739, 0, 1, 0.682353, 1,
-0.131906, 0.1264895, -1.191975, 0, 1, 0.6862745, 1,
-0.13137, -1.171959, -4.090843, 0, 1, 0.6941177, 1,
-0.1312422, 1.426335, 0.1688875, 0, 1, 0.7019608, 1,
-0.1259993, -0.1610146, -2.094935, 0, 1, 0.7058824, 1,
-0.1236798, 1.095567, 0.363896, 0, 1, 0.7137255, 1,
-0.1213978, 0.501148, 0.841558, 0, 1, 0.7176471, 1,
-0.1176695, -0.07951782, -2.207008, 0, 1, 0.7254902, 1,
-0.1148123, 0.6793619, 0.2331402, 0, 1, 0.7294118, 1,
-0.1133493, -0.6815005, -3.65068, 0, 1, 0.7372549, 1,
-0.1105333, 0.5608497, -1.019753, 0, 1, 0.7411765, 1,
-0.1093469, 1.211486, -0.4320224, 0, 1, 0.7490196, 1,
-0.1077969, -1.412496, -1.384673, 0, 1, 0.7529412, 1,
-0.1056284, -0.9380198, -2.26415, 0, 1, 0.7607843, 1,
-0.1041461, 0.7095959, -0.08123011, 0, 1, 0.7647059, 1,
-0.09917352, 0.8781941, -0.8433006, 0, 1, 0.772549, 1,
-0.0911405, -1.654301, -2.986951, 0, 1, 0.7764706, 1,
-0.09074076, 0.4679317, -0.7178858, 0, 1, 0.7843137, 1,
-0.08840489, -0.7610599, -3.052212, 0, 1, 0.7882353, 1,
-0.07742947, -0.4959292, -2.990071, 0, 1, 0.7960784, 1,
-0.0717316, 1.818044, -0.1243216, 0, 1, 0.8039216, 1,
-0.06835838, -2.18689, -4.643099, 0, 1, 0.8078431, 1,
-0.06087582, 1.252524, -0.5210204, 0, 1, 0.8156863, 1,
-0.06070916, 1.566122, -0.7285529, 0, 1, 0.8196079, 1,
-0.05203653, -1.00108, -2.746052, 0, 1, 0.827451, 1,
-0.05190515, -0.3993499, -3.213287, 0, 1, 0.8313726, 1,
-0.05125065, 1.344768, -0.8562241, 0, 1, 0.8392157, 1,
-0.0460377, -0.1510281, -3.934065, 0, 1, 0.8431373, 1,
-0.04419075, 0.5852312, 1.075459, 0, 1, 0.8509804, 1,
-0.04390553, -0.5441084, -3.478518, 0, 1, 0.854902, 1,
-0.0427774, 0.5067177, 1.322056, 0, 1, 0.8627451, 1,
-0.0402069, 0.002482379, -3.159901, 0, 1, 0.8666667, 1,
-0.03474987, -0.03943152, -4.152576, 0, 1, 0.8745098, 1,
-0.03252953, -0.632708, -3.933935, 0, 1, 0.8784314, 1,
-0.03218748, -0.4534042, -2.550424, 0, 1, 0.8862745, 1,
-0.02449144, -0.1424629, -2.341578, 0, 1, 0.8901961, 1,
-0.02059127, -1.028504, -3.20764, 0, 1, 0.8980392, 1,
-0.01956409, -0.1397295, -4.044005, 0, 1, 0.9058824, 1,
-0.01928528, -0.4094779, -3.118408, 0, 1, 0.9098039, 1,
-0.0151145, 1.312591, 0.4792548, 0, 1, 0.9176471, 1,
-0.01399406, 1.17229, -0.4309483, 0, 1, 0.9215686, 1,
-0.01375409, -0.6015785, -2.105086, 0, 1, 0.9294118, 1,
-0.01060431, -0.2704284, -3.909592, 0, 1, 0.9333333, 1,
-0.007949187, 0.5136748, -1.077719, 0, 1, 0.9411765, 1,
-0.007554336, 0.505532, 0.2944044, 0, 1, 0.945098, 1,
-0.003741209, -1.747051, -1.306089, 0, 1, 0.9529412, 1,
-0.0001358804, 1.416295, 1.337783, 0, 1, 0.9568627, 1,
0.0007553143, 0.9181264, 1.077035, 0, 1, 0.9647059, 1,
0.001184648, -0.1221921, 1.051165, 0, 1, 0.9686275, 1,
0.004628816, 0.9656624, 0.1212207, 0, 1, 0.9764706, 1,
0.006231577, 0.9763297, 1.419161, 0, 1, 0.9803922, 1,
0.01154085, -0.6683053, 3.37525, 0, 1, 0.9882353, 1,
0.01342419, -0.538717, 3.879763, 0, 1, 0.9921569, 1,
0.01419156, -0.8090131, 3.141464, 0, 1, 1, 1,
0.01894834, -1.679654, 1.613403, 0, 0.9921569, 1, 1,
0.02315728, 1.078831, 1.726974, 0, 0.9882353, 1, 1,
0.02599064, -0.00288995, -0.1819252, 0, 0.9803922, 1, 1,
0.02730486, 1.038977, 0.177481, 0, 0.9764706, 1, 1,
0.02960858, -0.9606175, 3.374988, 0, 0.9686275, 1, 1,
0.03139843, 2.895209, 0.9268358, 0, 0.9647059, 1, 1,
0.03187198, -1.237828, 3.169065, 0, 0.9568627, 1, 1,
0.0341303, -0.777335, 1.856387, 0, 0.9529412, 1, 1,
0.04065583, 1.046847, 1.802703, 0, 0.945098, 1, 1,
0.04142576, 0.5068744, 1.026784, 0, 0.9411765, 1, 1,
0.0414651, 0.289997, 1.75403, 0, 0.9333333, 1, 1,
0.04158796, 0.7893957, 0.7246634, 0, 0.9294118, 1, 1,
0.04186996, 0.0575932, 1.633978, 0, 0.9215686, 1, 1,
0.04594, 1.692067, 1.397465, 0, 0.9176471, 1, 1,
0.05330051, 1.028717, -0.09927902, 0, 0.9098039, 1, 1,
0.05377857, 0.4238386, 0.34882, 0, 0.9058824, 1, 1,
0.05399466, -1.001269, 3.224591, 0, 0.8980392, 1, 1,
0.05695209, 0.6421661, 2.051334, 0, 0.8901961, 1, 1,
0.05938042, 0.157704, 0.7014031, 0, 0.8862745, 1, 1,
0.06292809, -0.8602663, 1.983171, 0, 0.8784314, 1, 1,
0.06295031, -0.7537299, 2.53728, 0, 0.8745098, 1, 1,
0.06356816, 0.2844107, -1.095365, 0, 0.8666667, 1, 1,
0.06401324, -1.226064, 4.68116, 0, 0.8627451, 1, 1,
0.06553535, 1.223631, -0.3377132, 0, 0.854902, 1, 1,
0.06719646, 0.487172, 1.364885, 0, 0.8509804, 1, 1,
0.07212311, -0.03109081, 1.918305, 0, 0.8431373, 1, 1,
0.0721373, 0.3281724, 0.1513816, 0, 0.8392157, 1, 1,
0.07367875, 0.9771133, -1.158785, 0, 0.8313726, 1, 1,
0.07699555, -0.4215994, 2.452689, 0, 0.827451, 1, 1,
0.08428567, 1.180401, 0.3648776, 0, 0.8196079, 1, 1,
0.08440641, 0.4833748, 0.05242167, 0, 0.8156863, 1, 1,
0.08494249, -0.9696887, 2.35007, 0, 0.8078431, 1, 1,
0.09163409, 0.5629879, 1.235274, 0, 0.8039216, 1, 1,
0.1016711, -1.395303, 3.205705, 0, 0.7960784, 1, 1,
0.1033939, 0.8196301, 0.81724, 0, 0.7882353, 1, 1,
0.1074175, -0.2329711, 1.08196, 0, 0.7843137, 1, 1,
0.1079672, -0.5693232, 3.434655, 0, 0.7764706, 1, 1,
0.1129829, 0.2571069, 0.227293, 0, 0.772549, 1, 1,
0.1133459, -1.055422, 3.428388, 0, 0.7647059, 1, 1,
0.114331, -1.221449, 2.983283, 0, 0.7607843, 1, 1,
0.1147375, 0.1867042, 1.089901, 0, 0.7529412, 1, 1,
0.115427, 0.4357397, 1.566555, 0, 0.7490196, 1, 1,
0.1212859, -1.598765, 1.83849, 0, 0.7411765, 1, 1,
0.1223455, 0.8669684, 0.06839474, 0, 0.7372549, 1, 1,
0.1235467, 0.04577571, 1.736001, 0, 0.7294118, 1, 1,
0.1289131, 1.268158, -0.8456525, 0, 0.7254902, 1, 1,
0.1293002, 0.9927133, 0.117951, 0, 0.7176471, 1, 1,
0.1345855, 2.364571, -1.298155, 0, 0.7137255, 1, 1,
0.1371674, 1.6336, 0.6119922, 0, 0.7058824, 1, 1,
0.1405759, -0.5655658, 2.510727, 0, 0.6980392, 1, 1,
0.1406732, 0.3749231, 0.7091582, 0, 0.6941177, 1, 1,
0.1434504, 1.554119, 0.1284415, 0, 0.6862745, 1, 1,
0.1467654, -0.5675287, 3.265988, 0, 0.682353, 1, 1,
0.1469014, -0.4039599, 3.14767, 0, 0.6745098, 1, 1,
0.1490728, -0.4241791, 5.400967, 0, 0.6705883, 1, 1,
0.152178, -1.271277, 2.318589, 0, 0.6627451, 1, 1,
0.1527585, 2.717828, 0.434212, 0, 0.6588235, 1, 1,
0.1552836, -0.1368502, 2.34727, 0, 0.6509804, 1, 1,
0.1553973, -0.8075453, 3.096428, 0, 0.6470588, 1, 1,
0.1555264, -1.409744, 2.720331, 0, 0.6392157, 1, 1,
0.1556937, -0.08981183, 1.342498, 0, 0.6352941, 1, 1,
0.155836, -1.54786, 2.067749, 0, 0.627451, 1, 1,
0.1563281, -0.09203976, 2.54108, 0, 0.6235294, 1, 1,
0.1580683, 0.2042041, -1.119691, 0, 0.6156863, 1, 1,
0.1590399, 0.2469556, 1.538582, 0, 0.6117647, 1, 1,
0.1627965, -0.1995363, 3.01166, 0, 0.6039216, 1, 1,
0.1655351, 0.1813158, 1.830099, 0, 0.5960785, 1, 1,
0.1661354, -1.350722, 2.760116, 0, 0.5921569, 1, 1,
0.1687311, 2.109283, -0.9316422, 0, 0.5843138, 1, 1,
0.1715621, 1.075348, -0.2018824, 0, 0.5803922, 1, 1,
0.1749658, 1.128692, 1.329895, 0, 0.572549, 1, 1,
0.177323, -0.4986778, 3.367226, 0, 0.5686275, 1, 1,
0.1791249, 1.879294, -0.009826291, 0, 0.5607843, 1, 1,
0.180793, -0.6708181, 2.342362, 0, 0.5568628, 1, 1,
0.1834365, -0.8211998, 3.094268, 0, 0.5490196, 1, 1,
0.1835807, -0.6806731, 3.629289, 0, 0.5450981, 1, 1,
0.1841413, 0.6168174, -1.575327, 0, 0.5372549, 1, 1,
0.1864861, -0.1868856, 2.629867, 0, 0.5333334, 1, 1,
0.1867983, -2.553812, 3.281461, 0, 0.5254902, 1, 1,
0.1930858, 2.25634, -0.3028463, 0, 0.5215687, 1, 1,
0.1932285, -0.421476, 2.884349, 0, 0.5137255, 1, 1,
0.1938271, 0.1211006, 0.3020843, 0, 0.509804, 1, 1,
0.1939443, -0.5195264, 3.337665, 0, 0.5019608, 1, 1,
0.1967621, 1.318525, 1.687434, 0, 0.4941176, 1, 1,
0.1993756, 0.1843228, 2.243386, 0, 0.4901961, 1, 1,
0.2003847, -0.4552799, 3.528657, 0, 0.4823529, 1, 1,
0.203189, 0.7145008, 1.008294, 0, 0.4784314, 1, 1,
0.2041122, 0.3766885, 1.936385, 0, 0.4705882, 1, 1,
0.2046559, 0.1266767, 0.9246981, 0, 0.4666667, 1, 1,
0.2136957, 0.1652177, 0.006930584, 0, 0.4588235, 1, 1,
0.214707, 1.360625, -0.6966067, 0, 0.454902, 1, 1,
0.2170636, 1.369294, -0.7522463, 0, 0.4470588, 1, 1,
0.2200818, -0.8305001, 1.513737, 0, 0.4431373, 1, 1,
0.2210804, -0.541063, 1.241448, 0, 0.4352941, 1, 1,
0.2271197, -0.08085041, 1.22727, 0, 0.4313726, 1, 1,
0.2334823, 1.880194, -0.006687915, 0, 0.4235294, 1, 1,
0.2350003, -0.1846343, 0.8357726, 0, 0.4196078, 1, 1,
0.2378837, 0.5990854, 0.06156945, 0, 0.4117647, 1, 1,
0.238377, -0.5929785, 3.100415, 0, 0.4078431, 1, 1,
0.2414052, 1.014626, -0.003837829, 0, 0.4, 1, 1,
0.2424604, 0.3672648, 1.586726, 0, 0.3921569, 1, 1,
0.2428956, 1.131493, 0.5486888, 0, 0.3882353, 1, 1,
0.245167, -0.7517045, 1.673573, 0, 0.3803922, 1, 1,
0.2478777, 0.8954204, 1.162906, 0, 0.3764706, 1, 1,
0.2486393, -0.03003377, 1.024315, 0, 0.3686275, 1, 1,
0.2494796, -0.6615467, 3.09112, 0, 0.3647059, 1, 1,
0.2506182, -2.006394, 2.585715, 0, 0.3568628, 1, 1,
0.2517388, -1.468136, 3.340016, 0, 0.3529412, 1, 1,
0.2522672, -0.9256519, 3.667814, 0, 0.345098, 1, 1,
0.2565205, -1.095544, 1.23341, 0, 0.3411765, 1, 1,
0.2658992, 1.93059, -0.2255241, 0, 0.3333333, 1, 1,
0.267046, 0.8741119, -0.4326081, 0, 0.3294118, 1, 1,
0.2716093, 0.4365139, 2.691829, 0, 0.3215686, 1, 1,
0.2736382, -0.09921431, 2.977501, 0, 0.3176471, 1, 1,
0.2771417, 1.090044, 2.329528, 0, 0.3098039, 1, 1,
0.2809868, -0.8470121, 2.723368, 0, 0.3058824, 1, 1,
0.2810801, -0.0358482, 3.032075, 0, 0.2980392, 1, 1,
0.2813949, 0.1588669, 0.7272463, 0, 0.2901961, 1, 1,
0.2818191, -0.986194, 2.939945, 0, 0.2862745, 1, 1,
0.2851529, -0.9197901, 4.643428, 0, 0.2784314, 1, 1,
0.2874708, 0.01775146, 1.530827, 0, 0.2745098, 1, 1,
0.2899303, -0.7248348, 5.099605, 0, 0.2666667, 1, 1,
0.2934933, -0.4181848, 2.869147, 0, 0.2627451, 1, 1,
0.2943964, 0.4101715, -0.1240309, 0, 0.254902, 1, 1,
0.2987512, 1.552199, -1.013828, 0, 0.2509804, 1, 1,
0.3049785, -0.01621415, 1.731003, 0, 0.2431373, 1, 1,
0.3061361, 1.111319, 0.4280447, 0, 0.2392157, 1, 1,
0.3071893, 2.730648, 0.5140999, 0, 0.2313726, 1, 1,
0.3073531, 0.5078006, -0.3978811, 0, 0.227451, 1, 1,
0.3093017, 0.8574938, -0.1884943, 0, 0.2196078, 1, 1,
0.3107811, -0.8535686, 5.524183, 0, 0.2156863, 1, 1,
0.3157432, -1.759816, 4.258388, 0, 0.2078431, 1, 1,
0.3160037, 0.339882, 0.7592557, 0, 0.2039216, 1, 1,
0.3171169, 0.2119061, 3.486621, 0, 0.1960784, 1, 1,
0.3177219, -0.6035552, 2.839968, 0, 0.1882353, 1, 1,
0.3232554, -0.5628561, 2.460958, 0, 0.1843137, 1, 1,
0.3250838, 0.8712929, 2.553268, 0, 0.1764706, 1, 1,
0.3286242, -0.2815095, 2.407305, 0, 0.172549, 1, 1,
0.3319215, 0.02445273, 2.732555, 0, 0.1647059, 1, 1,
0.3324944, 0.2397805, 1.616565, 0, 0.1607843, 1, 1,
0.3329992, 0.3459253, 0.7011723, 0, 0.1529412, 1, 1,
0.3351181, 1.952818, 0.7500842, 0, 0.1490196, 1, 1,
0.3385781, -1.667378, 3.068974, 0, 0.1411765, 1, 1,
0.3387301, 1.239255, -0.1797437, 0, 0.1372549, 1, 1,
0.34003, 0.2331103, -0.3633108, 0, 0.1294118, 1, 1,
0.3432434, -2.243391, 1.593421, 0, 0.1254902, 1, 1,
0.344814, 0.8132609, 0.801454, 0, 0.1176471, 1, 1,
0.34737, -0.4668028, 3.787787, 0, 0.1137255, 1, 1,
0.3477212, -0.1140609, 0.9945806, 0, 0.1058824, 1, 1,
0.3505922, 0.2107296, 0.6869534, 0, 0.09803922, 1, 1,
0.3516303, -0.2190215, 1.40977, 0, 0.09411765, 1, 1,
0.3529607, 0.5222529, -1.001417, 0, 0.08627451, 1, 1,
0.3558586, -0.01836539, 0.1732169, 0, 0.08235294, 1, 1,
0.3582133, 0.219069, -0.302159, 0, 0.07450981, 1, 1,
0.36215, -1.274917, 4.01626, 0, 0.07058824, 1, 1,
0.3638, 0.7935069, 2.349875, 0, 0.0627451, 1, 1,
0.3668777, 0.3480388, -0.01291029, 0, 0.05882353, 1, 1,
0.372624, 2.606078, 0.5649037, 0, 0.05098039, 1, 1,
0.3789273, 0.04668462, 1.165454, 0, 0.04705882, 1, 1,
0.3797249, -0.06939415, 1.942956, 0, 0.03921569, 1, 1,
0.3857419, -0.05840931, 2.119634, 0, 0.03529412, 1, 1,
0.3862981, 1.039099, -1.124061, 0, 0.02745098, 1, 1,
0.3935572, 0.1947296, -1.231508, 0, 0.02352941, 1, 1,
0.3951134, -0.5170775, 1.938142, 0, 0.01568628, 1, 1,
0.395707, -0.468314, 2.201437, 0, 0.01176471, 1, 1,
0.3961458, -0.6813423, 1.746966, 0, 0.003921569, 1, 1,
0.4005478, 0.0494905, 2.415951, 0.003921569, 0, 1, 1,
0.4010545, 1.069175, 0.6607864, 0.007843138, 0, 1, 1,
0.402714, 0.2934217, -0.243643, 0.01568628, 0, 1, 1,
0.4080082, -0.4751055, 2.063887, 0.01960784, 0, 1, 1,
0.4102833, -0.4925654, 2.273049, 0.02745098, 0, 1, 1,
0.4105506, 0.2049777, 0.9202958, 0.03137255, 0, 1, 1,
0.4120537, -1.301129, 3.530805, 0.03921569, 0, 1, 1,
0.4134552, 1.108876, 1.361438, 0.04313726, 0, 1, 1,
0.4142416, 0.1730064, 1.35443, 0.05098039, 0, 1, 1,
0.4221478, -1.044402, 2.480514, 0.05490196, 0, 1, 1,
0.4304412, -0.1237593, 1.904742, 0.0627451, 0, 1, 1,
0.432195, -0.6865662, 1.024819, 0.06666667, 0, 1, 1,
0.432845, 0.01516967, 1.122007, 0.07450981, 0, 1, 1,
0.4361033, 0.4487124, 0.4795069, 0.07843138, 0, 1, 1,
0.437865, 0.04622403, -0.5778032, 0.08627451, 0, 1, 1,
0.4402777, 0.2614338, 0.5659375, 0.09019608, 0, 1, 1,
0.4427961, 0.792197, -1.276646, 0.09803922, 0, 1, 1,
0.4433183, -1.25443, 3.494491, 0.1058824, 0, 1, 1,
0.4505005, 0.5186592, -0.4764794, 0.1098039, 0, 1, 1,
0.4523771, 1.296368, 0.02008039, 0.1176471, 0, 1, 1,
0.4550588, -0.1754123, 4.167411, 0.1215686, 0, 1, 1,
0.4551437, -0.454788, 2.282763, 0.1294118, 0, 1, 1,
0.4551947, -0.1352236, 2.443903, 0.1333333, 0, 1, 1,
0.4556529, 0.7695939, 1.971476, 0.1411765, 0, 1, 1,
0.4560876, -0.5722051, 3.248371, 0.145098, 0, 1, 1,
0.4614772, 1.960253, -0.9261455, 0.1529412, 0, 1, 1,
0.467381, -0.8133855, 4.096367, 0.1568628, 0, 1, 1,
0.4678486, -0.9013553, 2.73622, 0.1647059, 0, 1, 1,
0.4779904, 0.8330376, 1.095069, 0.1686275, 0, 1, 1,
0.4805578, -0.5125705, -0.1181854, 0.1764706, 0, 1, 1,
0.4922236, 0.6807454, 1.063733, 0.1803922, 0, 1, 1,
0.5011845, 0.008940423, 1.637215, 0.1882353, 0, 1, 1,
0.5086656, -2.029073, 3.56987, 0.1921569, 0, 1, 1,
0.5116107, -0.09213203, 1.260354, 0.2, 0, 1, 1,
0.5118094, -1.294194, 3.227613, 0.2078431, 0, 1, 1,
0.5227291, -2.486961, 4.084598, 0.2117647, 0, 1, 1,
0.5316846, -1.02864, 2.992369, 0.2196078, 0, 1, 1,
0.5318596, -1.586767, 3.269872, 0.2235294, 0, 1, 1,
0.5386792, 0.9310539, -1.099912, 0.2313726, 0, 1, 1,
0.5394003, -0.4775454, 0.7488426, 0.2352941, 0, 1, 1,
0.5555084, -0.6068383, 2.314031, 0.2431373, 0, 1, 1,
0.5642309, 0.4195915, 0.384879, 0.2470588, 0, 1, 1,
0.5733605, 0.7233769, -0.8337759, 0.254902, 0, 1, 1,
0.5741296, -0.7655056, 0.643147, 0.2588235, 0, 1, 1,
0.5757554, -0.3593109, 1.548417, 0.2666667, 0, 1, 1,
0.5802861, 0.7106681, 1.235384, 0.2705882, 0, 1, 1,
0.5807721, -0.950758, 3.279001, 0.2784314, 0, 1, 1,
0.5895204, -0.6551086, 1.082853, 0.282353, 0, 1, 1,
0.590143, 1.029174, 0.3709236, 0.2901961, 0, 1, 1,
0.5906042, 0.7370273, 0.2608145, 0.2941177, 0, 1, 1,
0.5913982, 1.21734, 0.4148088, 0.3019608, 0, 1, 1,
0.5930259, 0.6502959, 0.9620542, 0.3098039, 0, 1, 1,
0.59475, 1.018897, -0.5988705, 0.3137255, 0, 1, 1,
0.5996109, -0.8900604, 0.6727884, 0.3215686, 0, 1, 1,
0.6017779, 0.6502075, 1.170669, 0.3254902, 0, 1, 1,
0.6022795, 0.4048987, 1.434983, 0.3333333, 0, 1, 1,
0.6024523, 0.3863433, 0.9134246, 0.3372549, 0, 1, 1,
0.6025249, -0.4828427, 1.782085, 0.345098, 0, 1, 1,
0.6054609, -0.5885483, 2.969634, 0.3490196, 0, 1, 1,
0.6109734, 0.8825688, 1.259289, 0.3568628, 0, 1, 1,
0.6165382, -0.7231262, 2.319794, 0.3607843, 0, 1, 1,
0.616861, -0.8564515, 0.008453168, 0.3686275, 0, 1, 1,
0.6220976, 1.105298, 1.718442, 0.372549, 0, 1, 1,
0.6248217, -0.2132688, 2.776305, 0.3803922, 0, 1, 1,
0.625561, -0.397673, 2.468517, 0.3843137, 0, 1, 1,
0.6299791, -0.2248257, 0.8951612, 0.3921569, 0, 1, 1,
0.6306636, 0.799296, 2.22321, 0.3960784, 0, 1, 1,
0.6325203, -0.9170763, 2.434491, 0.4039216, 0, 1, 1,
0.633879, 0.2024269, 1.557305, 0.4117647, 0, 1, 1,
0.641445, -2.127317, 1.521188, 0.4156863, 0, 1, 1,
0.6477283, -1.376318, 3.59069, 0.4235294, 0, 1, 1,
0.6479098, 1.35287, -0.01362451, 0.427451, 0, 1, 1,
0.6494269, -0.06930128, 4.085783, 0.4352941, 0, 1, 1,
0.6507632, -1.54085, 2.773562, 0.4392157, 0, 1, 1,
0.6510721, -0.2308724, 0.6647665, 0.4470588, 0, 1, 1,
0.652727, 1.229762, 0.3734627, 0.4509804, 0, 1, 1,
0.653003, 0.3166583, 2.239559, 0.4588235, 0, 1, 1,
0.6537494, -0.8333229, 1.629321, 0.4627451, 0, 1, 1,
0.6539909, 1.444924, -0.007109842, 0.4705882, 0, 1, 1,
0.6567959, 1.229657, -0.7038343, 0.4745098, 0, 1, 1,
0.6590817, -0.6302221, 1.643226, 0.4823529, 0, 1, 1,
0.6695946, -0.01223956, 2.396263, 0.4862745, 0, 1, 1,
0.6797963, -0.04247641, 2.740503, 0.4941176, 0, 1, 1,
0.6808885, 0.5078542, -0.7085807, 0.5019608, 0, 1, 1,
0.6843324, -1.653908, 3.245657, 0.5058824, 0, 1, 1,
0.6880978, -1.096513, 2.559515, 0.5137255, 0, 1, 1,
0.6881574, -0.5256627, 1.906146, 0.5176471, 0, 1, 1,
0.6979336, 1.150178, 1.03215, 0.5254902, 0, 1, 1,
0.698521, -0.3565866, 2.587795, 0.5294118, 0, 1, 1,
0.6994694, -0.1236205, 1.368239, 0.5372549, 0, 1, 1,
0.7060591, -0.3041511, 1.115712, 0.5411765, 0, 1, 1,
0.7133898, 1.606895, -0.04194766, 0.5490196, 0, 1, 1,
0.7232211, 0.3912005, 1.463487, 0.5529412, 0, 1, 1,
0.736006, -0.2480738, 0.3051158, 0.5607843, 0, 1, 1,
0.7445614, 1.152174, -0.7260947, 0.5647059, 0, 1, 1,
0.7479583, 0.1536439, 0.3476318, 0.572549, 0, 1, 1,
0.7487437, 0.2472448, 1.662982, 0.5764706, 0, 1, 1,
0.7488053, -0.563175, 1.192358, 0.5843138, 0, 1, 1,
0.7516579, 0.3475931, 2.638164, 0.5882353, 0, 1, 1,
0.754918, -0.2360864, 0.3743499, 0.5960785, 0, 1, 1,
0.7573907, 1.937276, -0.05790938, 0.6039216, 0, 1, 1,
0.760162, -0.2273052, 1.193971, 0.6078432, 0, 1, 1,
0.7625939, 1.126619, 0.1484775, 0.6156863, 0, 1, 1,
0.7672214, -0.634333, 1.373793, 0.6196079, 0, 1, 1,
0.772357, 0.2289277, 1.193071, 0.627451, 0, 1, 1,
0.7727144, 0.1914556, 0.5476807, 0.6313726, 0, 1, 1,
0.7753403, -0.1203473, 1.290201, 0.6392157, 0, 1, 1,
0.7761601, 1.33571, -0.8267868, 0.6431373, 0, 1, 1,
0.7764214, -0.4462906, 1.620811, 0.6509804, 0, 1, 1,
0.7807025, 0.8923039, 0.6294691, 0.654902, 0, 1, 1,
0.7835375, -0.0628452, 2.934951, 0.6627451, 0, 1, 1,
0.7836023, 0.2996907, 2.481025, 0.6666667, 0, 1, 1,
0.7860646, -1.142024, 1.756043, 0.6745098, 0, 1, 1,
0.7876279, 1.677926, 0.2214656, 0.6784314, 0, 1, 1,
0.7896329, 0.3098929, 1.924346, 0.6862745, 0, 1, 1,
0.7963706, 0.9216392, -0.6091927, 0.6901961, 0, 1, 1,
0.8002344, -1.149752, 3.497673, 0.6980392, 0, 1, 1,
0.8005723, 2.515811, -0.666355, 0.7058824, 0, 1, 1,
0.8071333, 1.050448, 1.703532, 0.7098039, 0, 1, 1,
0.8073032, 0.375583, 0.7467149, 0.7176471, 0, 1, 1,
0.8120736, -0.5841336, 1.863636, 0.7215686, 0, 1, 1,
0.8135939, -0.479199, 1.398591, 0.7294118, 0, 1, 1,
0.8147657, 1.849882, -0.1863193, 0.7333333, 0, 1, 1,
0.8219784, 0.03077714, 1.408975, 0.7411765, 0, 1, 1,
0.8243557, 0.8704521, 0.382626, 0.7450981, 0, 1, 1,
0.8255312, 0.4285417, 1.327411, 0.7529412, 0, 1, 1,
0.827914, 0.1121135, 0.9616017, 0.7568628, 0, 1, 1,
0.8301812, -1.072956, 2.34829, 0.7647059, 0, 1, 1,
0.8384728, 1.521334, 0.8334157, 0.7686275, 0, 1, 1,
0.8409231, 2.760221, 2.244923, 0.7764706, 0, 1, 1,
0.8432915, 0.3504169, 1.032886, 0.7803922, 0, 1, 1,
0.8541468, -0.9254031, 2.907244, 0.7882353, 0, 1, 1,
0.8553721, -0.9225988, 3.74816, 0.7921569, 0, 1, 1,
0.8632226, 0.651152, -1.342569, 0.8, 0, 1, 1,
0.8670251, -0.2415937, 1.4463, 0.8078431, 0, 1, 1,
0.8724409, 0.7425627, 0.5937355, 0.8117647, 0, 1, 1,
0.8877847, 1.019616, 1.376749, 0.8196079, 0, 1, 1,
0.8904417, -0.7986027, 2.735267, 0.8235294, 0, 1, 1,
0.8922637, -2.081998, 3.069575, 0.8313726, 0, 1, 1,
0.892657, 0.6163708, 1.408001, 0.8352941, 0, 1, 1,
0.8944574, 2.358114, 0.8425297, 0.8431373, 0, 1, 1,
0.897301, 0.05159243, 1.597596, 0.8470588, 0, 1, 1,
0.9031306, -0.3699877, 0.5381404, 0.854902, 0, 1, 1,
0.9056431, -0.1502965, 1.999582, 0.8588235, 0, 1, 1,
0.9133022, 0.3634369, 1.277991, 0.8666667, 0, 1, 1,
0.9153265, -2.04985, 1.685714, 0.8705882, 0, 1, 1,
0.9168005, 0.9071004, 1.497654, 0.8784314, 0, 1, 1,
0.9218104, 0.1304411, 1.213911, 0.8823529, 0, 1, 1,
0.9253149, 1.176951, 1.18675, 0.8901961, 0, 1, 1,
0.9271287, 0.7628881, 1.507486, 0.8941177, 0, 1, 1,
0.9276366, -1.332272, 2.752703, 0.9019608, 0, 1, 1,
0.9281926, -1.394579, 2.066486, 0.9098039, 0, 1, 1,
0.9375595, 0.9223253, -0.112302, 0.9137255, 0, 1, 1,
0.939936, 0.4809425, 1.817222, 0.9215686, 0, 1, 1,
0.9402727, -0.2396099, 3.060518, 0.9254902, 0, 1, 1,
0.9449238, 0.7161501, 1.011589, 0.9333333, 0, 1, 1,
0.9655086, -0.4667962, 0.07694274, 0.9372549, 0, 1, 1,
0.9680161, 0.2724338, 1.030084, 0.945098, 0, 1, 1,
0.9712167, 0.757412, -0.5790244, 0.9490196, 0, 1, 1,
0.9713366, 0.9035256, 0.4511221, 0.9568627, 0, 1, 1,
0.9752994, -0.5608238, 2.477058, 0.9607843, 0, 1, 1,
0.981667, 1.57683, 1.533725, 0.9686275, 0, 1, 1,
0.9856227, 0.4346184, -0.2466842, 0.972549, 0, 1, 1,
0.9857252, -1.103393, 2.022927, 0.9803922, 0, 1, 1,
1.002364, 0.6067971, 0.3239069, 0.9843137, 0, 1, 1,
1.002451, -0.777824, 3.216347, 0.9921569, 0, 1, 1,
1.009054, -0.7191682, 2.596159, 0.9960784, 0, 1, 1,
1.016029, -0.7557938, 1.379091, 1, 0, 0.9960784, 1,
1.016355, 0.07672202, 1.607414, 1, 0, 0.9882353, 1,
1.01976, -0.1508017, 2.595113, 1, 0, 0.9843137, 1,
1.022808, -1.51411, 3.182069, 1, 0, 0.9764706, 1,
1.023349, 0.1030421, 2.304296, 1, 0, 0.972549, 1,
1.024897, -1.199895, 3.746624, 1, 0, 0.9647059, 1,
1.025569, -0.5966794, 1.648304, 1, 0, 0.9607843, 1,
1.029196, 0.3663688, 1.185206, 1, 0, 0.9529412, 1,
1.03146, -0.4018821, 1.920578, 1, 0, 0.9490196, 1,
1.034591, 0.02648258, 0.5795812, 1, 0, 0.9411765, 1,
1.036129, 0.6018673, 1.713377, 1, 0, 0.9372549, 1,
1.037167, -0.5656764, 3.793748, 1, 0, 0.9294118, 1,
1.060011, -1.586404, 3.106171, 1, 0, 0.9254902, 1,
1.06523, 0.9097462, 2.242412, 1, 0, 0.9176471, 1,
1.067215, 0.7620373, -0.1008075, 1, 0, 0.9137255, 1,
1.068261, 1.019582, 1.746675, 1, 0, 0.9058824, 1,
1.078941, -0.3951294, 3.101738, 1, 0, 0.9019608, 1,
1.086448, 0.6996002, 0.6703464, 1, 0, 0.8941177, 1,
1.089834, 1.083149, 1.365947, 1, 0, 0.8862745, 1,
1.10077, 0.8296791, 0.4307593, 1, 0, 0.8823529, 1,
1.104272, 1.988384, -0.349381, 1, 0, 0.8745098, 1,
1.108918, -1.536219, 2.144698, 1, 0, 0.8705882, 1,
1.109106, -1.005534, 4.240311, 1, 0, 0.8627451, 1,
1.111154, 0.5807765, 2.452427, 1, 0, 0.8588235, 1,
1.112615, 0.2585178, 0.9340634, 1, 0, 0.8509804, 1,
1.114891, 0.415685, 1.044186, 1, 0, 0.8470588, 1,
1.115437, 1.024641, 1.938663, 1, 0, 0.8392157, 1,
1.126294, 0.6459264, 2.485936, 1, 0, 0.8352941, 1,
1.145113, 0.35813, 0.7580507, 1, 0, 0.827451, 1,
1.14646, -0.5095021, 0.4682437, 1, 0, 0.8235294, 1,
1.148928, 0.5229204, 2.185596, 1, 0, 0.8156863, 1,
1.15425, -0.3118712, 0.1667903, 1, 0, 0.8117647, 1,
1.155641, 1.007901, 1.161757, 1, 0, 0.8039216, 1,
1.157213, 0.2354369, 1.472363, 1, 0, 0.7960784, 1,
1.163161, 1.2643, -0.02825733, 1, 0, 0.7921569, 1,
1.173676, -0.181206, 1.775077, 1, 0, 0.7843137, 1,
1.180749, -0.3653305, 1.238738, 1, 0, 0.7803922, 1,
1.185047, -0.7408606, 2.344048, 1, 0, 0.772549, 1,
1.185851, -0.4556252, 2.223384, 1, 0, 0.7686275, 1,
1.200981, -2.717188, 3.039478, 1, 0, 0.7607843, 1,
1.204456, -1.58024, 3.21541, 1, 0, 0.7568628, 1,
1.206817, -1.010923, 2.321874, 1, 0, 0.7490196, 1,
1.210387, -1.859626, 2.187592, 1, 0, 0.7450981, 1,
1.211323, -1.010409, 2.968673, 1, 0, 0.7372549, 1,
1.213633, -0.08496029, 2.784687, 1, 0, 0.7333333, 1,
1.218007, -0.3208706, 1.225101, 1, 0, 0.7254902, 1,
1.220885, -1.533639, 1.631108, 1, 0, 0.7215686, 1,
1.227623, 1.280315, -0.3108224, 1, 0, 0.7137255, 1,
1.237544, -0.9187336, 1.714478, 1, 0, 0.7098039, 1,
1.239195, -1.212364, 2.788898, 1, 0, 0.7019608, 1,
1.244429, -0.3612737, 1.207244, 1, 0, 0.6941177, 1,
1.24981, -1.73719, 3.570874, 1, 0, 0.6901961, 1,
1.262219, 0.07365356, 2.075535, 1, 0, 0.682353, 1,
1.264715, 1.104816, 1.410074, 1, 0, 0.6784314, 1,
1.283178, -0.341016, 1.849106, 1, 0, 0.6705883, 1,
1.290457, -1.75307, 1.785458, 1, 0, 0.6666667, 1,
1.291301, 0.3629835, 1.015402, 1, 0, 0.6588235, 1,
1.306641, 0.616231, 2.511792, 1, 0, 0.654902, 1,
1.309545, 0.8976678, 0.549597, 1, 0, 0.6470588, 1,
1.310502, -0.3718133, 1.76461, 1, 0, 0.6431373, 1,
1.324678, -0.115532, 3.128313, 1, 0, 0.6352941, 1,
1.333002, -0.4026301, 0.4153534, 1, 0, 0.6313726, 1,
1.339481, -0.3895296, 2.7183, 1, 0, 0.6235294, 1,
1.341789, -0.3438995, 2.418788, 1, 0, 0.6196079, 1,
1.344029, -0.319318, 2.334203, 1, 0, 0.6117647, 1,
1.349611, -0.287929, 2.483984, 1, 0, 0.6078432, 1,
1.369523, -0.07135119, 2.44846, 1, 0, 0.6, 1,
1.380053, -2.282449, 4.446218, 1, 0, 0.5921569, 1,
1.381461, -0.6359907, 1.910577, 1, 0, 0.5882353, 1,
1.384476, -0.2148152, 1.664394, 1, 0, 0.5803922, 1,
1.397353, 0.6578974, 2.819697, 1, 0, 0.5764706, 1,
1.405778, -0.2311054, 2.124517, 1, 0, 0.5686275, 1,
1.406049, -1.526847, 2.351012, 1, 0, 0.5647059, 1,
1.421361, -0.3065466, -0.1547747, 1, 0, 0.5568628, 1,
1.422133, 0.4847215, 1.949738, 1, 0, 0.5529412, 1,
1.423801, -0.363263, 2.354831, 1, 0, 0.5450981, 1,
1.425681, -0.4646129, 2.279283, 1, 0, 0.5411765, 1,
1.427812, -0.5287353, 2.091968, 1, 0, 0.5333334, 1,
1.455411, -1.118925, 2.778676, 1, 0, 0.5294118, 1,
1.460484, -0.2114726, 2.468014, 1, 0, 0.5215687, 1,
1.460865, -1.143385, 1.954351, 1, 0, 0.5176471, 1,
1.466689, 0.1002124, 2.347983, 1, 0, 0.509804, 1,
1.466896, -0.3892451, 0.8147963, 1, 0, 0.5058824, 1,
1.470401, 0.4522655, 1.812751, 1, 0, 0.4980392, 1,
1.477432, -1.130357, 0.734923, 1, 0, 0.4901961, 1,
1.486806, 0.455889, 2.35663, 1, 0, 0.4862745, 1,
1.500897, -0.2334834, 2.411611, 1, 0, 0.4784314, 1,
1.504369, -0.456556, 0.4426248, 1, 0, 0.4745098, 1,
1.522905, -0.1641402, 1.303221, 1, 0, 0.4666667, 1,
1.523034, 1.936833, 1.964278, 1, 0, 0.4627451, 1,
1.529047, 0.1536566, 0.8361668, 1, 0, 0.454902, 1,
1.535777, -0.8755624, 2.408993, 1, 0, 0.4509804, 1,
1.538969, 0.3991072, 0.5887538, 1, 0, 0.4431373, 1,
1.541689, -1.001306, 0.9558416, 1, 0, 0.4392157, 1,
1.558466, -0.5184485, 3.274686, 1, 0, 0.4313726, 1,
1.575258, -0.4911744, 3.148012, 1, 0, 0.427451, 1,
1.575412, -0.9025859, -0.5678586, 1, 0, 0.4196078, 1,
1.577939, -1.085156, 1.751638, 1, 0, 0.4156863, 1,
1.600085, 2.342812, -0.5957121, 1, 0, 0.4078431, 1,
1.60848, 1.305128, 1.924584, 1, 0, 0.4039216, 1,
1.617123, 0.2694962, 1.252686, 1, 0, 0.3960784, 1,
1.628959, 0.690622, 1.698891, 1, 0, 0.3882353, 1,
1.643257, -0.8876849, 1.797583, 1, 0, 0.3843137, 1,
1.653218, -1.533827, 0.8438405, 1, 0, 0.3764706, 1,
1.660496, -2.050609, 2.455281, 1, 0, 0.372549, 1,
1.664073, 0.06277011, 2.527451, 1, 0, 0.3647059, 1,
1.667524, 0.9308633, 1.240647, 1, 0, 0.3607843, 1,
1.669365, -1.764506, 1.536263, 1, 0, 0.3529412, 1,
1.685056, 1.552669, -0.0681996, 1, 0, 0.3490196, 1,
1.715354, 1.19982, 2.096671, 1, 0, 0.3411765, 1,
1.756274, 0.3076554, 1.506643, 1, 0, 0.3372549, 1,
1.784497, -1.155053, 1.635288, 1, 0, 0.3294118, 1,
1.786376, -1.466045, 3.25328, 1, 0, 0.3254902, 1,
1.789119, 1.549669, -0.9040858, 1, 0, 0.3176471, 1,
1.790151, -0.4633977, 1.893489, 1, 0, 0.3137255, 1,
1.793419, 0.2033143, -0.1498916, 1, 0, 0.3058824, 1,
1.793519, 0.8077499, 1.739147, 1, 0, 0.2980392, 1,
1.802249, -1.1941, 1.268478, 1, 0, 0.2941177, 1,
1.804913, 1.39533, 2.176105, 1, 0, 0.2862745, 1,
1.833653, -0.3287525, 1.011304, 1, 0, 0.282353, 1,
1.883886, -0.761156, 0.7204537, 1, 0, 0.2745098, 1,
1.886369, -0.3790125, 3.065909, 1, 0, 0.2705882, 1,
1.914392, 0.215163, 1.507858, 1, 0, 0.2627451, 1,
1.923394, -0.7851384, 2.171861, 1, 0, 0.2588235, 1,
1.926838, 0.2620983, 2.012625, 1, 0, 0.2509804, 1,
1.929918, -0.8853194, 0.9900037, 1, 0, 0.2470588, 1,
1.938763, -0.7128639, 0.7346603, 1, 0, 0.2392157, 1,
1.962673, 1.250026, 2.137731, 1, 0, 0.2352941, 1,
2.015515, 0.4925064, 0.2059488, 1, 0, 0.227451, 1,
2.025887, 1.173418, 2.562596, 1, 0, 0.2235294, 1,
2.031037, -0.4323336, -0.2584288, 1, 0, 0.2156863, 1,
2.054566, 0.03448934, 1.826802, 1, 0, 0.2117647, 1,
2.059495, 0.7415202, 2.108256, 1, 0, 0.2039216, 1,
2.065308, 0.009615802, 0.715721, 1, 0, 0.1960784, 1,
2.105058, -0.07101928, 0.6363397, 1, 0, 0.1921569, 1,
2.133851, 0.231356, 1.176477, 1, 0, 0.1843137, 1,
2.135182, -0.1342531, 2.468309, 1, 0, 0.1803922, 1,
2.13909, 0.2321683, 3.268883, 1, 0, 0.172549, 1,
2.142935, -0.2079545, 1.870487, 1, 0, 0.1686275, 1,
2.148391, -1.35626, 0.2392733, 1, 0, 0.1607843, 1,
2.168061, -0.8609092, 2.270615, 1, 0, 0.1568628, 1,
2.191365, 0.1695203, 2.820589, 1, 0, 0.1490196, 1,
2.1928, -0.5341569, 1.061765, 1, 0, 0.145098, 1,
2.193683, 0.8691998, 1.368608, 1, 0, 0.1372549, 1,
2.225029, 0.2818289, 2.808706, 1, 0, 0.1333333, 1,
2.23973, 0.5201621, 1.814708, 1, 0, 0.1254902, 1,
2.278566, -1.297934, 1.897432, 1, 0, 0.1215686, 1,
2.279752, -0.1516448, 1.400542, 1, 0, 0.1137255, 1,
2.280433, -0.3126819, 1.279565, 1, 0, 0.1098039, 1,
2.301907, 0.1665771, 2.39379, 1, 0, 0.1019608, 1,
2.32683, -1.116063, 2.091873, 1, 0, 0.09411765, 1,
2.337173, -1.052031, 1.662376, 1, 0, 0.09019608, 1,
2.361567, -0.6510193, 2.549537, 1, 0, 0.08235294, 1,
2.39897, 0.6515784, 1.487409, 1, 0, 0.07843138, 1,
2.491616, 0.09604346, 1.527938, 1, 0, 0.07058824, 1,
2.558558, 0.732103, 2.753492, 1, 0, 0.06666667, 1,
2.596501, -0.7217166, 1.587714, 1, 0, 0.05882353, 1,
2.625929, 0.8449069, 1.876806, 1, 0, 0.05490196, 1,
2.685815, 0.5153455, 3.114983, 1, 0, 0.04705882, 1,
2.710767, -0.3767168, 0.6798221, 1, 0, 0.04313726, 1,
2.734734, -0.2256289, 3.57837, 1, 0, 0.03529412, 1,
2.909276, -0.8732888, 2.672518, 1, 0, 0.03137255, 1,
3.031785, 0.718347, 1.672566, 1, 0, 0.02352941, 1,
3.343319, -0.945243, 1.65219, 1, 0, 0.01960784, 1,
3.463645, 0.7450963, 2.225253, 1, 0, 0.01176471, 1,
3.520525, 0.3294398, 1.371068, 1, 0, 0.007843138, 1
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
0.1256155, -3.838403, -7.517668, 0, -0.5, 0.5, 0.5,
0.1256155, -3.838403, -7.517668, 1, -0.5, 0.5, 0.5,
0.1256155, -3.838403, -7.517668, 1, 1.5, 0.5, 0.5,
0.1256155, -3.838403, -7.517668, 0, 1.5, 0.5, 0.5
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
-4.420168, 0.09534192, -7.517668, 0, -0.5, 0.5, 0.5,
-4.420168, 0.09534192, -7.517668, 1, -0.5, 0.5, 0.5,
-4.420168, 0.09534192, -7.517668, 1, 1.5, 0.5, 0.5,
-4.420168, 0.09534192, -7.517668, 0, 1.5, 0.5, 0.5
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
-4.420168, -3.838403, -0.05164075, 0, -0.5, 0.5, 0.5,
-4.420168, -3.838403, -0.05164075, 1, -0.5, 0.5, 0.5,
-4.420168, -3.838403, -0.05164075, 1, 1.5, 0.5, 0.5,
-4.420168, -3.838403, -0.05164075, 0, 1.5, 0.5, 0.5
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
-3, -2.930615, -5.794739,
3, -2.930615, -5.794739,
-3, -2.930615, -5.794739,
-3, -3.081913, -6.081894,
-2, -2.930615, -5.794739,
-2, -3.081913, -6.081894,
-1, -2.930615, -5.794739,
-1, -3.081913, -6.081894,
0, -2.930615, -5.794739,
0, -3.081913, -6.081894,
1, -2.930615, -5.794739,
1, -3.081913, -6.081894,
2, -2.930615, -5.794739,
2, -3.081913, -6.081894,
3, -2.930615, -5.794739,
3, -3.081913, -6.081894
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
-3, -3.384509, -6.656204, 0, -0.5, 0.5, 0.5,
-3, -3.384509, -6.656204, 1, -0.5, 0.5, 0.5,
-3, -3.384509, -6.656204, 1, 1.5, 0.5, 0.5,
-3, -3.384509, -6.656204, 0, 1.5, 0.5, 0.5,
-2, -3.384509, -6.656204, 0, -0.5, 0.5, 0.5,
-2, -3.384509, -6.656204, 1, -0.5, 0.5, 0.5,
-2, -3.384509, -6.656204, 1, 1.5, 0.5, 0.5,
-2, -3.384509, -6.656204, 0, 1.5, 0.5, 0.5,
-1, -3.384509, -6.656204, 0, -0.5, 0.5, 0.5,
-1, -3.384509, -6.656204, 1, -0.5, 0.5, 0.5,
-1, -3.384509, -6.656204, 1, 1.5, 0.5, 0.5,
-1, -3.384509, -6.656204, 0, 1.5, 0.5, 0.5,
0, -3.384509, -6.656204, 0, -0.5, 0.5, 0.5,
0, -3.384509, -6.656204, 1, -0.5, 0.5, 0.5,
0, -3.384509, -6.656204, 1, 1.5, 0.5, 0.5,
0, -3.384509, -6.656204, 0, 1.5, 0.5, 0.5,
1, -3.384509, -6.656204, 0, -0.5, 0.5, 0.5,
1, -3.384509, -6.656204, 1, -0.5, 0.5, 0.5,
1, -3.384509, -6.656204, 1, 1.5, 0.5, 0.5,
1, -3.384509, -6.656204, 0, 1.5, 0.5, 0.5,
2, -3.384509, -6.656204, 0, -0.5, 0.5, 0.5,
2, -3.384509, -6.656204, 1, -0.5, 0.5, 0.5,
2, -3.384509, -6.656204, 1, 1.5, 0.5, 0.5,
2, -3.384509, -6.656204, 0, 1.5, 0.5, 0.5,
3, -3.384509, -6.656204, 0, -0.5, 0.5, 0.5,
3, -3.384509, -6.656204, 1, -0.5, 0.5, 0.5,
3, -3.384509, -6.656204, 1, 1.5, 0.5, 0.5,
3, -3.384509, -6.656204, 0, 1.5, 0.5, 0.5
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
-3.371141, -2, -5.794739,
-3.371141, 3, -5.794739,
-3.371141, -2, -5.794739,
-3.545979, -2, -6.081894,
-3.371141, -1, -5.794739,
-3.545979, -1, -6.081894,
-3.371141, 0, -5.794739,
-3.545979, 0, -6.081894,
-3.371141, 1, -5.794739,
-3.545979, 1, -6.081894,
-3.371141, 2, -5.794739,
-3.545979, 2, -6.081894,
-3.371141, 3, -5.794739,
-3.545979, 3, -6.081894
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
-3.895655, -2, -6.656204, 0, -0.5, 0.5, 0.5,
-3.895655, -2, -6.656204, 1, -0.5, 0.5, 0.5,
-3.895655, -2, -6.656204, 1, 1.5, 0.5, 0.5,
-3.895655, -2, -6.656204, 0, 1.5, 0.5, 0.5,
-3.895655, -1, -6.656204, 0, -0.5, 0.5, 0.5,
-3.895655, -1, -6.656204, 1, -0.5, 0.5, 0.5,
-3.895655, -1, -6.656204, 1, 1.5, 0.5, 0.5,
-3.895655, -1, -6.656204, 0, 1.5, 0.5, 0.5,
-3.895655, 0, -6.656204, 0, -0.5, 0.5, 0.5,
-3.895655, 0, -6.656204, 1, -0.5, 0.5, 0.5,
-3.895655, 0, -6.656204, 1, 1.5, 0.5, 0.5,
-3.895655, 0, -6.656204, 0, 1.5, 0.5, 0.5,
-3.895655, 1, -6.656204, 0, -0.5, 0.5, 0.5,
-3.895655, 1, -6.656204, 1, -0.5, 0.5, 0.5,
-3.895655, 1, -6.656204, 1, 1.5, 0.5, 0.5,
-3.895655, 1, -6.656204, 0, 1.5, 0.5, 0.5,
-3.895655, 2, -6.656204, 0, -0.5, 0.5, 0.5,
-3.895655, 2, -6.656204, 1, -0.5, 0.5, 0.5,
-3.895655, 2, -6.656204, 1, 1.5, 0.5, 0.5,
-3.895655, 2, -6.656204, 0, 1.5, 0.5, 0.5,
-3.895655, 3, -6.656204, 0, -0.5, 0.5, 0.5,
-3.895655, 3, -6.656204, 1, -0.5, 0.5, 0.5,
-3.895655, 3, -6.656204, 1, 1.5, 0.5, 0.5,
-3.895655, 3, -6.656204, 0, 1.5, 0.5, 0.5
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
-3.371141, -2.930615, -4,
-3.371141, -2.930615, 4,
-3.371141, -2.930615, -4,
-3.545979, -3.081913, -4,
-3.371141, -2.930615, -2,
-3.545979, -3.081913, -2,
-3.371141, -2.930615, 0,
-3.545979, -3.081913, 0,
-3.371141, -2.930615, 2,
-3.545979, -3.081913, 2,
-3.371141, -2.930615, 4,
-3.545979, -3.081913, 4
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
-3.895655, -3.384509, -4, 0, -0.5, 0.5, 0.5,
-3.895655, -3.384509, -4, 1, -0.5, 0.5, 0.5,
-3.895655, -3.384509, -4, 1, 1.5, 0.5, 0.5,
-3.895655, -3.384509, -4, 0, 1.5, 0.5, 0.5,
-3.895655, -3.384509, -2, 0, -0.5, 0.5, 0.5,
-3.895655, -3.384509, -2, 1, -0.5, 0.5, 0.5,
-3.895655, -3.384509, -2, 1, 1.5, 0.5, 0.5,
-3.895655, -3.384509, -2, 0, 1.5, 0.5, 0.5,
-3.895655, -3.384509, 0, 0, -0.5, 0.5, 0.5,
-3.895655, -3.384509, 0, 1, -0.5, 0.5, 0.5,
-3.895655, -3.384509, 0, 1, 1.5, 0.5, 0.5,
-3.895655, -3.384509, 0, 0, 1.5, 0.5, 0.5,
-3.895655, -3.384509, 2, 0, -0.5, 0.5, 0.5,
-3.895655, -3.384509, 2, 1, -0.5, 0.5, 0.5,
-3.895655, -3.384509, 2, 1, 1.5, 0.5, 0.5,
-3.895655, -3.384509, 2, 0, 1.5, 0.5, 0.5,
-3.895655, -3.384509, 4, 0, -0.5, 0.5, 0.5,
-3.895655, -3.384509, 4, 1, -0.5, 0.5, 0.5,
-3.895655, -3.384509, 4, 1, 1.5, 0.5, 0.5,
-3.895655, -3.384509, 4, 0, 1.5, 0.5, 0.5
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
-3.371141, -2.930615, -5.794739,
-3.371141, 3.121299, -5.794739,
-3.371141, -2.930615, 5.691457,
-3.371141, 3.121299, 5.691457,
-3.371141, -2.930615, -5.794739,
-3.371141, -2.930615, 5.691457,
-3.371141, 3.121299, -5.794739,
-3.371141, 3.121299, 5.691457,
-3.371141, -2.930615, -5.794739,
3.622372, -2.930615, -5.794739,
-3.371141, -2.930615, 5.691457,
3.622372, -2.930615, 5.691457,
-3.371141, 3.121299, -5.794739,
3.622372, 3.121299, -5.794739,
-3.371141, 3.121299, 5.691457,
3.622372, 3.121299, 5.691457,
3.622372, -2.930615, -5.794739,
3.622372, 3.121299, -5.794739,
3.622372, -2.930615, 5.691457,
3.622372, 3.121299, 5.691457,
3.622372, -2.930615, -5.794739,
3.622372, -2.930615, 5.691457,
3.622372, 3.121299, -5.794739,
3.622372, 3.121299, 5.691457
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
var radius = 7.874496;
var distance = 35.03452;
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
mvMatrix.translate( -0.1256155, -0.09534192, 0.05164075 );
mvMatrix.scale( 1.217422, 1.406837, 0.7412427 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.03452);
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
Dibenzoylperoxid<-read.table("Dibenzoylperoxid.xyz", skip=1)
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
-3.269294, -0.8418142, -1.348659, 0, 0, 1, 1, 1,
-2.750144, -1.192229, -3.440196, 1, 0, 0, 1, 1,
-2.730581, -0.6517484, -0.3625224, 1, 0, 0, 1, 1,
-2.606933, 0.6482208, 0.6635272, 1, 0, 0, 1, 1,
-2.584173, 1.561245, -0.9744856, 1, 0, 0, 1, 1,
-2.516247, -1.505034, -2.423756, 1, 0, 0, 1, 1,
-2.37693, 0.1415801, -1.445444, 0, 0, 0, 1, 1,
-2.335403, -0.01324956, -0.9490156, 0, 0, 0, 1, 1,
-2.3325, -0.455818, -2.405458, 0, 0, 0, 1, 1,
-2.331874, 0.2397918, -1.260721, 0, 0, 0, 1, 1,
-2.259472, 1.118463, -1.52848, 0, 0, 0, 1, 1,
-2.229364, -0.1316822, -2.074412, 0, 0, 0, 1, 1,
-2.20233, -0.8732761, -1.619145, 0, 0, 0, 1, 1,
-2.158335, 0.7643276, 0.4485542, 1, 1, 1, 1, 1,
-2.142112, 0.7197728, 0.3247693, 1, 1, 1, 1, 1,
-2.141745, -0.3453935, -1.916957, 1, 1, 1, 1, 1,
-2.130941, 0.08368464, 0.2035995, 1, 1, 1, 1, 1,
-2.12205, -0.1772319, -3.793516, 1, 1, 1, 1, 1,
-2.117238, 0.200115, -0.9236428, 1, 1, 1, 1, 1,
-2.106002, -0.6816885, -2.513863, 1, 1, 1, 1, 1,
-2.048055, -1.243693, -0.7949297, 1, 1, 1, 1, 1,
-2.017874, -2.582782, -3.266849, 1, 1, 1, 1, 1,
-1.978815, 1.725559, -1.340544, 1, 1, 1, 1, 1,
-1.967157, -0.7597885, -2.235475, 1, 1, 1, 1, 1,
-1.953363, 0.2098127, -2.529517, 1, 1, 1, 1, 1,
-1.942188, -0.3457024, -1.977565, 1, 1, 1, 1, 1,
-1.92782, 0.1343269, -0.6721858, 1, 1, 1, 1, 1,
-1.917432, 0.8538546, -1.247455, 1, 1, 1, 1, 1,
-1.909916, -0.8822225, -2.696872, 0, 0, 1, 1, 1,
-1.909338, 0.6793804, -1.230686, 1, 0, 0, 1, 1,
-1.907425, 0.4002207, -1.029756, 1, 0, 0, 1, 1,
-1.903779, 0.6400165, -0.8302002, 1, 0, 0, 1, 1,
-1.892199, -1.119872, -3.400448, 1, 0, 0, 1, 1,
-1.860022, -0.2031896, -0.6167989, 1, 0, 0, 1, 1,
-1.826073, 1.41828, -0.9341102, 0, 0, 0, 1, 1,
-1.739753, 1.918054, -1.278082, 0, 0, 0, 1, 1,
-1.735721, -0.1297828, -2.694836, 0, 0, 0, 1, 1,
-1.731104, 0.3381694, -1.978174, 0, 0, 0, 1, 1,
-1.727577, 0.5379444, -1.641748, 0, 0, 0, 1, 1,
-1.725059, 0.533596, -2.100858, 0, 0, 0, 1, 1,
-1.697652, -1.170275, -3.685727, 0, 0, 0, 1, 1,
-1.637386, 1.901966, -1.064837, 1, 1, 1, 1, 1,
-1.629128, -0.7839713, -3.199292, 1, 1, 1, 1, 1,
-1.626366, -0.2021516, -3.307019, 1, 1, 1, 1, 1,
-1.62524, 0.8998453, -0.0954562, 1, 1, 1, 1, 1,
-1.623978, 0.3055086, -1.630602, 1, 1, 1, 1, 1,
-1.604355, 1.885142, -0.6017209, 1, 1, 1, 1, 1,
-1.604219, 0.6952105, 0.5776629, 1, 1, 1, 1, 1,
-1.600982, 0.4024019, -2.378016, 1, 1, 1, 1, 1,
-1.591049, -0.2752829, -2.078126, 1, 1, 1, 1, 1,
-1.568679, 0.0416076, -3.503179, 1, 1, 1, 1, 1,
-1.565806, 1.503073, 0.3417956, 1, 1, 1, 1, 1,
-1.548253, -0.5735748, -1.281489, 1, 1, 1, 1, 1,
-1.547973, -0.7163346, -1.258918, 1, 1, 1, 1, 1,
-1.543202, 0.9467443, -2.413622, 1, 1, 1, 1, 1,
-1.533524, 0.2559923, -0.6125147, 1, 1, 1, 1, 1,
-1.533444, 2.189133, 0.2581866, 0, 0, 1, 1, 1,
-1.528353, -0.1412679, -2.08425, 1, 0, 0, 1, 1,
-1.515495, -0.2436908, -1.774027, 1, 0, 0, 1, 1,
-1.51473, -1.015302, -1.623452, 1, 0, 0, 1, 1,
-1.491634, -1.554113, -1.529045, 1, 0, 0, 1, 1,
-1.487478, 0.6989877, -0.6496448, 1, 0, 0, 1, 1,
-1.48071, 1.054774, -1.564787, 0, 0, 0, 1, 1,
-1.47992, 1.158586, -0.9668926, 0, 0, 0, 1, 1,
-1.473035, -0.1981505, -2.921285, 0, 0, 0, 1, 1,
-1.468754, 0.9234151, -1.450616, 0, 0, 0, 1, 1,
-1.465406, 0.1296813, 0.9330803, 0, 0, 0, 1, 1,
-1.462962, -1.188144, -2.34314, 0, 0, 0, 1, 1,
-1.459885, -1.916296, -1.9408, 0, 0, 0, 1, 1,
-1.425781, -0.05428056, -1.728571, 1, 1, 1, 1, 1,
-1.414903, -0.07603446, -1.706616, 1, 1, 1, 1, 1,
-1.414147, 1.421632, -1.352108, 1, 1, 1, 1, 1,
-1.408889, -0.7371858, -1.405268, 1, 1, 1, 1, 1,
-1.408062, -0.1306412, -2.791812, 1, 1, 1, 1, 1,
-1.394294, 0.3602459, 0.2231195, 1, 1, 1, 1, 1,
-1.388962, 1.810491, 0.3877404, 1, 1, 1, 1, 1,
-1.353201, -1.109536, -2.686536, 1, 1, 1, 1, 1,
-1.342045, 0.2333824, -0.6735008, 1, 1, 1, 1, 1,
-1.340342, -0.7819437, -2.723486, 1, 1, 1, 1, 1,
-1.339931, 0.5587649, -1.700136, 1, 1, 1, 1, 1,
-1.330567, 0.7381548, -1.865994, 1, 1, 1, 1, 1,
-1.324236, 0.199054, -1.753529, 1, 1, 1, 1, 1,
-1.323136, 0.6690758, -2.005582, 1, 1, 1, 1, 1,
-1.317871, -2.113828, -1.941966, 1, 1, 1, 1, 1,
-1.315031, 1.827475, -0.1371035, 0, 0, 1, 1, 1,
-1.29111, -1.946227, -2.075891, 1, 0, 0, 1, 1,
-1.285036, -0.05644969, -2.189312, 1, 0, 0, 1, 1,
-1.28278, -1.27224, -5.627464, 1, 0, 0, 1, 1,
-1.278258, -0.3712364, -0.5030385, 1, 0, 0, 1, 1,
-1.265966, -1.05506, -1.685623, 1, 0, 0, 1, 1,
-1.260392, -0.3523736, -1.823311, 0, 0, 0, 1, 1,
-1.253142, -0.1370627, -0.5338873, 0, 0, 0, 1, 1,
-1.246976, -0.6466034, -4.323192, 0, 0, 0, 1, 1,
-1.240698, -0.4120406, -3.235637, 0, 0, 0, 1, 1,
-1.239693, 0.5255195, -0.8002578, 0, 0, 0, 1, 1,
-1.235929, 1.152619, -1.413938, 0, 0, 0, 1, 1,
-1.226096, 0.5315766, -3.271197, 0, 0, 0, 1, 1,
-1.208285, -0.7489782, -3.429507, 1, 1, 1, 1, 1,
-1.207751, 0.7020901, -0.9448485, 1, 1, 1, 1, 1,
-1.201742, 0.6994466, -1.204015, 1, 1, 1, 1, 1,
-1.19989, 0.230123, -2.13229, 1, 1, 1, 1, 1,
-1.198107, -0.3681908, -1.59309, 1, 1, 1, 1, 1,
-1.197048, 0.5916963, 0.5413892, 1, 1, 1, 1, 1,
-1.190675, 0.7118789, -1.012626, 1, 1, 1, 1, 1,
-1.18261, 0.4226559, -1.262916, 1, 1, 1, 1, 1,
-1.17553, -0.8829864, -2.888934, 1, 1, 1, 1, 1,
-1.174381, 0.07223799, -2.009827, 1, 1, 1, 1, 1,
-1.169495, -0.2295072, -2.258382, 1, 1, 1, 1, 1,
-1.168765, -1.639259, -3.978603, 1, 1, 1, 1, 1,
-1.161747, -1.511219, -3.659402, 1, 1, 1, 1, 1,
-1.161262, -0.2828392, 0.7181591, 1, 1, 1, 1, 1,
-1.158986, 0.8340219, -1.153944, 1, 1, 1, 1, 1,
-1.157897, -0.4113093, -2.973558, 0, 0, 1, 1, 1,
-1.155712, -0.3829394, -0.5736845, 1, 0, 0, 1, 1,
-1.152526, 0.3368608, -1.796097, 1, 0, 0, 1, 1,
-1.151743, 0.8005735, -0.4129021, 1, 0, 0, 1, 1,
-1.150983, 0.4705985, -1.986428, 1, 0, 0, 1, 1,
-1.144078, -0.03553467, -3.388534, 1, 0, 0, 1, 1,
-1.141811, 1.215107, -1.04674, 0, 0, 0, 1, 1,
-1.140012, -1.888147, -0.8991841, 0, 0, 0, 1, 1,
-1.130218, -1.28876, -0.8846887, 0, 0, 0, 1, 1,
-1.128145, 1.30901, -0.2292382, 0, 0, 0, 1, 1,
-1.126736, -0.3958063, -2.377014, 0, 0, 0, 1, 1,
-1.123902, 2.185087, -1.501841, 0, 0, 0, 1, 1,
-1.122904, -1.13033, -3.816617, 0, 0, 0, 1, 1,
-1.11904, 0.5524574, -2.031991, 1, 1, 1, 1, 1,
-1.117185, -0.5863188, -2.121764, 1, 1, 1, 1, 1,
-1.113185, 0.1999653, -0.8579654, 1, 1, 1, 1, 1,
-1.111057, -0.8270774, -2.546072, 1, 1, 1, 1, 1,
-1.109866, 0.9207657, -0.4531704, 1, 1, 1, 1, 1,
-1.106034, 1.138009, -0.3208521, 1, 1, 1, 1, 1,
-1.102686, 0.9342207, -1.499542, 1, 1, 1, 1, 1,
-1.101738, -0.1624943, -2.487584, 1, 1, 1, 1, 1,
-1.09971, 0.2965433, -2.829269, 1, 1, 1, 1, 1,
-1.096568, -0.4674045, -2.648857, 1, 1, 1, 1, 1,
-1.09557, 0.6038727, -0.7059574, 1, 1, 1, 1, 1,
-1.087423, -2.396053, -2.085048, 1, 1, 1, 1, 1,
-1.083027, -0.8147851, -2.751299, 1, 1, 1, 1, 1,
-1.075336, 0.07757635, -3.169022, 1, 1, 1, 1, 1,
-1.075233, 0.4571278, -1.87278, 1, 1, 1, 1, 1,
-1.068581, -0.693526, -1.70186, 0, 0, 1, 1, 1,
-1.064404, -0.2652134, -2.828158, 1, 0, 0, 1, 1,
-1.064309, 0.1449003, -1.971988, 1, 0, 0, 1, 1,
-1.054222, 0.8591118, -1.26153, 1, 0, 0, 1, 1,
-1.052898, 0.3124886, -0.05187805, 1, 0, 0, 1, 1,
-1.052012, -1.044058, -3.934148, 1, 0, 0, 1, 1,
-1.050929, -0.2931345, -1.468973, 0, 0, 0, 1, 1,
-1.041896, 0.0863021, -1.356395, 0, 0, 0, 1, 1,
-1.035044, -1.233175, -1.419527, 0, 0, 0, 1, 1,
-1.032965, 0.1927911, -2.135072, 0, 0, 0, 1, 1,
-1.024463, -0.7654712, -1.64515, 0, 0, 0, 1, 1,
-1.020743, 0.823257, -2.792671, 0, 0, 0, 1, 1,
-1.019377, -0.4829487, 1.061946, 0, 0, 0, 1, 1,
-1.014111, 1.467692, -1.918063, 1, 1, 1, 1, 1,
-1.009344, 2.278355, 0.03285113, 1, 1, 1, 1, 1,
-1.006821, 0.4072146, -1.099431, 1, 1, 1, 1, 1,
-1.003187, -0.4824294, -2.854671, 1, 1, 1, 1, 1,
-1.002501, -0.2800039, -0.7378169, 1, 1, 1, 1, 1,
-0.983746, 0.0303642, -2.196421, 1, 1, 1, 1, 1,
-0.9810468, 0.1769605, -2.86449, 1, 1, 1, 1, 1,
-0.9768318, -1.525441, -2.478355, 1, 1, 1, 1, 1,
-0.9707363, 1.268149, -0.08424401, 1, 1, 1, 1, 1,
-0.9636123, 0.09780284, -1.136895, 1, 1, 1, 1, 1,
-0.9633613, -0.1874024, -1.047185, 1, 1, 1, 1, 1,
-0.9599534, 1.498551, -0.04319942, 1, 1, 1, 1, 1,
-0.9586126, -0.658021, -1.593645, 1, 1, 1, 1, 1,
-0.9578533, 0.7084582, -0.6377175, 1, 1, 1, 1, 1,
-0.9531786, 1.370861, 0.814209, 1, 1, 1, 1, 1,
-0.9499033, 0.5107671, -2.529086, 0, 0, 1, 1, 1,
-0.9483906, 0.08135657, -2.54295, 1, 0, 0, 1, 1,
-0.9448658, -1.278856, -2.61267, 1, 0, 0, 1, 1,
-0.9428933, 0.179102, -1.28162, 1, 0, 0, 1, 1,
-0.942336, -1.219711, -1.579759, 1, 0, 0, 1, 1,
-0.9411315, -1.634194, -2.152928, 1, 0, 0, 1, 1,
-0.9408113, 0.7540171, -1.302265, 0, 0, 0, 1, 1,
-0.9383496, 0.5038572, -1.250468, 0, 0, 0, 1, 1,
-0.9373494, 0.217135, -0.5376361, 0, 0, 0, 1, 1,
-0.9368668, 1.753472, -0.7861047, 0, 0, 0, 1, 1,
-0.9297539, -0.1740688, -2.486319, 0, 0, 0, 1, 1,
-0.9284567, 0.8114331, -1.087172, 0, 0, 0, 1, 1,
-0.9207863, 1.039265, -0.3464233, 0, 0, 0, 1, 1,
-0.9154227, 1.343492, -1.2511, 1, 1, 1, 1, 1,
-0.9144028, -0.03085203, -2.780492, 1, 1, 1, 1, 1,
-0.9132045, 0.05243056, -0.8183596, 1, 1, 1, 1, 1,
-0.9128568, -0.4965236, -2.546631, 1, 1, 1, 1, 1,
-0.9044723, 0.3853142, -0.4380272, 1, 1, 1, 1, 1,
-0.9034895, -0.2959047, -2.560658, 1, 1, 1, 1, 1,
-0.8977184, -0.7939722, -1.722204, 1, 1, 1, 1, 1,
-0.89164, 1.068613, -1.486987, 1, 1, 1, 1, 1,
-0.890335, 0.4271568, 1.107229, 1, 1, 1, 1, 1,
-0.8896301, -0.7680586, -2.740447, 1, 1, 1, 1, 1,
-0.8837991, -1.936476, -3.213699, 1, 1, 1, 1, 1,
-0.8810413, -0.6952464, -3.608993, 1, 1, 1, 1, 1,
-0.8730131, 0.7828416, 2.518309, 1, 1, 1, 1, 1,
-0.8575548, -1.670052, -2.879982, 1, 1, 1, 1, 1,
-0.8551421, -0.03150472, -1.163304, 1, 1, 1, 1, 1,
-0.8517612, 0.04127247, -1.379602, 0, 0, 1, 1, 1,
-0.8507861, 1.295081, 0.8300532, 1, 0, 0, 1, 1,
-0.8497632, -1.173081, -2.418099, 1, 0, 0, 1, 1,
-0.849668, -0.2547375, -1.56817, 1, 0, 0, 1, 1,
-0.847412, 0.635463, 1.20676, 1, 0, 0, 1, 1,
-0.8344831, 1.962528, -1.152861, 1, 0, 0, 1, 1,
-0.8247395, 0.8490831, -0.2338617, 0, 0, 0, 1, 1,
-0.8207564, -0.2329235, -1.337223, 0, 0, 0, 1, 1,
-0.820536, 0.619749, -1.554773, 0, 0, 0, 1, 1,
-0.8127456, -0.3835965, -3.013222, 0, 0, 0, 1, 1,
-0.8065376, 0.3339768, -2.19093, 0, 0, 0, 1, 1,
-0.8036031, 1.415419, -0.3345286, 0, 0, 0, 1, 1,
-0.803591, 0.6075175, -2.952241, 0, 0, 0, 1, 1,
-0.8003196, 2.347891, -0.3430838, 1, 1, 1, 1, 1,
-0.7997542, 2.409183, 0.2286694, 1, 1, 1, 1, 1,
-0.7921243, 0.5501109, -0.6372645, 1, 1, 1, 1, 1,
-0.7860199, 0.523391, 0.3047515, 1, 1, 1, 1, 1,
-0.7832806, 2.345296, -0.2075428, 1, 1, 1, 1, 1,
-0.7829962, -0.2076327, -1.534085, 1, 1, 1, 1, 1,
-0.7821928, 0.6969526, 0.6925913, 1, 1, 1, 1, 1,
-0.7778122, 0.170652, -2.723206, 1, 1, 1, 1, 1,
-0.7757581, -0.1469334, -1.672682, 1, 1, 1, 1, 1,
-0.7667086, -0.1113355, -3.151473, 1, 1, 1, 1, 1,
-0.7619461, -0.2371648, -1.95982, 1, 1, 1, 1, 1,
-0.7608202, -1.789639, -2.999299, 1, 1, 1, 1, 1,
-0.7563968, -1.633939, -3.474704, 1, 1, 1, 1, 1,
-0.7497591, -0.259744, -2.308358, 1, 1, 1, 1, 1,
-0.7404993, 0.459454, -2.031175, 1, 1, 1, 1, 1,
-0.7393886, 0.3722951, -1.38845, 0, 0, 1, 1, 1,
-0.7368951, -0.06047652, -1.91317, 1, 0, 0, 1, 1,
-0.7230579, 0.9405068, 1.941545, 1, 0, 0, 1, 1,
-0.7197879, 0.4892823, -0.9474533, 1, 0, 0, 1, 1,
-0.7183114, 0.2416981, -1.654458, 1, 0, 0, 1, 1,
-0.7121339, 0.1757377, -1.989869, 1, 0, 0, 1, 1,
-0.7103612, -0.4226648, -2.555982, 0, 0, 0, 1, 1,
-0.6996197, -0.4184892, -2.943661, 0, 0, 0, 1, 1,
-0.6919441, -0.7832236, -4.038858, 0, 0, 0, 1, 1,
-0.6906378, 0.01740067, -0.5551735, 0, 0, 0, 1, 1,
-0.6901418, 0.9668727, -2.117334, 0, 0, 0, 1, 1,
-0.6880175, 1.180226, -1.049602, 0, 0, 0, 1, 1,
-0.6859174, 0.8333633, 1.158968, 0, 0, 0, 1, 1,
-0.6811368, -0.02413598, -3.196, 1, 1, 1, 1, 1,
-0.6803201, 0.05539842, -1.203498, 1, 1, 1, 1, 1,
-0.6735391, 0.08925781, -1.569229, 1, 1, 1, 1, 1,
-0.6681784, -1.553195, -3.875323, 1, 1, 1, 1, 1,
-0.6571842, -1.77532, -4.170592, 1, 1, 1, 1, 1,
-0.6526095, -1.022851, -1.947015, 1, 1, 1, 1, 1,
-0.6341879, 0.8405786, -1.819988, 1, 1, 1, 1, 1,
-0.6324739, -1.33029, -2.609771, 1, 1, 1, 1, 1,
-0.631732, 2.075382, 0.5836796, 1, 1, 1, 1, 1,
-0.6255531, 0.1855432, -2.002608, 1, 1, 1, 1, 1,
-0.6254972, 0.4759291, -0.8273685, 1, 1, 1, 1, 1,
-0.6249268, 2.633277, 0.7554751, 1, 1, 1, 1, 1,
-0.6227717, 1.425201, -0.8347826, 1, 1, 1, 1, 1,
-0.6221716, -0.1255728, -0.8240939, 1, 1, 1, 1, 1,
-0.6209869, -0.4483688, -1.667633, 1, 1, 1, 1, 1,
-0.6189683, -0.6868273, -3.657092, 0, 0, 1, 1, 1,
-0.6175738, -1.139558, -2.938, 1, 0, 0, 1, 1,
-0.6159691, -0.4796948, -3.031321, 1, 0, 0, 1, 1,
-0.6147611, -1.398669, -2.576768, 1, 0, 0, 1, 1,
-0.6112725, -0.2942595, -2.327828, 1, 0, 0, 1, 1,
-0.6106331, 0.220744, -0.1223917, 1, 0, 0, 1, 1,
-0.6093534, 0.1632608, 0.2074798, 0, 0, 0, 1, 1,
-0.6089024, 1.219937, -1.071186, 0, 0, 0, 1, 1,
-0.6079338, 1.69342, -0.1542289, 0, 0, 0, 1, 1,
-0.6052293, 0.250797, -2.056435, 0, 0, 0, 1, 1,
-0.599151, 0.3526483, 1.15699, 0, 0, 0, 1, 1,
-0.5983151, -0.5772231, -1.828447, 0, 0, 0, 1, 1,
-0.5964113, 0.7208904, -1.778369, 0, 0, 0, 1, 1,
-0.5943314, -0.6964171, -4.868081, 1, 1, 1, 1, 1,
-0.5922995, -1.096672, -1.782645, 1, 1, 1, 1, 1,
-0.5884416, 0.6825966, -0.968362, 1, 1, 1, 1, 1,
-0.5877346, 0.3211465, -3.486342, 1, 1, 1, 1, 1,
-0.5860069, -1.274143, -3.485868, 1, 1, 1, 1, 1,
-0.5854306, -1.076351, -3.094219, 1, 1, 1, 1, 1,
-0.5791847, 0.325623, -0.672336, 1, 1, 1, 1, 1,
-0.5717342, -1.319174, -2.1432, 1, 1, 1, 1, 1,
-0.5712008, -1.038566, -3.712893, 1, 1, 1, 1, 1,
-0.5634611, 0.765488, -0.02124263, 1, 1, 1, 1, 1,
-0.5608996, -0.5075917, -1.061345, 1, 1, 1, 1, 1,
-0.5582904, 0.6130109, -1.326766, 1, 1, 1, 1, 1,
-0.5541254, -0.366351, -1.891625, 1, 1, 1, 1, 1,
-0.5480649, -0.02467863, -0.9857534, 1, 1, 1, 1, 1,
-0.5457331, 2.642939, 1.020088, 1, 1, 1, 1, 1,
-0.5439545, -0.5954509, -3.452244, 0, 0, 1, 1, 1,
-0.5430416, 0.3863141, -1.163466, 1, 0, 0, 1, 1,
-0.5397844, -0.8994316, -2.462478, 1, 0, 0, 1, 1,
-0.5396973, 1.476009, 0.2004986, 1, 0, 0, 1, 1,
-0.5388723, 0.1166424, -0.8720676, 1, 0, 0, 1, 1,
-0.5344052, -0.6171733, -3.134475, 1, 0, 0, 1, 1,
-0.5340894, -0.2409747, -2.730518, 0, 0, 0, 1, 1,
-0.5340779, 0.2839582, -0.9559001, 0, 0, 0, 1, 1,
-0.5318016, -0.2684374, -2.229487, 0, 0, 0, 1, 1,
-0.5312597, 1.498292, -2.858482, 0, 0, 0, 1, 1,
-0.5237009, 2.016936, 1.480608, 0, 0, 0, 1, 1,
-0.5221208, 0.0537888, -0.7992082, 0, 0, 0, 1, 1,
-0.5208007, -0.9146248, -2.86387, 0, 0, 0, 1, 1,
-0.5194576, 2.141191, -0.7313759, 1, 1, 1, 1, 1,
-0.5188085, -0.3545971, -3.085719, 1, 1, 1, 1, 1,
-0.5185896, 0.5131445, -0.9611247, 1, 1, 1, 1, 1,
-0.5127713, 0.9895718, -0.5657139, 1, 1, 1, 1, 1,
-0.5127366, 0.6000472, -0.2952708, 1, 1, 1, 1, 1,
-0.5115328, 0.2355725, -2.489406, 1, 1, 1, 1, 1,
-0.5069073, 1.095846, -0.6192298, 1, 1, 1, 1, 1,
-0.5059124, 0.6765392, -1.843261, 1, 1, 1, 1, 1,
-0.5018144, -1.103506, -3.388965, 1, 1, 1, 1, 1,
-0.5000708, -0.4247123, -2.102274, 1, 1, 1, 1, 1,
-0.4995877, -0.1606798, -1.796348, 1, 1, 1, 1, 1,
-0.498484, 0.9853818, 2.337441, 1, 1, 1, 1, 1,
-0.498426, 0.5328745, 1.105359, 1, 1, 1, 1, 1,
-0.4942336, -1.012541, -2.965326, 1, 1, 1, 1, 1,
-0.4907612, 0.3598369, -2.262311, 1, 1, 1, 1, 1,
-0.488847, 0.1911747, -2.690206, 0, 0, 1, 1, 1,
-0.4876912, 0.3145261, 0.105221, 1, 0, 0, 1, 1,
-0.4875447, 0.4809585, 1.078183, 1, 0, 0, 1, 1,
-0.487093, 1.065337, -0.627111, 1, 0, 0, 1, 1,
-0.4794624, 2.228484, 0.4354877, 1, 0, 0, 1, 1,
-0.4793868, 0.6947865, -1.388789, 1, 0, 0, 1, 1,
-0.4780759, -0.4961447, -1.607749, 0, 0, 0, 1, 1,
-0.4738194, 0.0165209, -0.2932786, 0, 0, 0, 1, 1,
-0.4715537, 0.2090737, -2.382348, 0, 0, 0, 1, 1,
-0.4709223, -0.6756156, -2.496176, 0, 0, 0, 1, 1,
-0.4705323, 1.365939, -1.89763, 0, 0, 0, 1, 1,
-0.4688036, -1.267333, -4.016028, 0, 0, 0, 1, 1,
-0.4653566, 0.5008104, -0.6934765, 0, 0, 0, 1, 1,
-0.4642402, -0.295593, -1.077834, 1, 1, 1, 1, 1,
-0.4535455, -0.4408213, -1.574423, 1, 1, 1, 1, 1,
-0.4516689, 0.4369012, -2.180008, 1, 1, 1, 1, 1,
-0.4508556, 0.3180022, -1.805918, 1, 1, 1, 1, 1,
-0.4460968, 1.099355, -1.990589, 1, 1, 1, 1, 1,
-0.441707, 0.3673636, -2.085298, 1, 1, 1, 1, 1,
-0.4414866, -0.2550677, -1.712059, 1, 1, 1, 1, 1,
-0.4408492, 0.4318774, -1.77179, 1, 1, 1, 1, 1,
-0.4403708, -1.230398, -2.576622, 1, 1, 1, 1, 1,
-0.440043, -2.236497, -2.00513, 1, 1, 1, 1, 1,
-0.4391792, -0.03773801, -2.321305, 1, 1, 1, 1, 1,
-0.4387565, 0.004278641, -1.852624, 1, 1, 1, 1, 1,
-0.4344205, 0.1060551, -0.911374, 1, 1, 1, 1, 1,
-0.4331234, 0.2656105, -0.6101816, 1, 1, 1, 1, 1,
-0.4328794, 0.4342927, -2.19246, 1, 1, 1, 1, 1,
-0.4328002, 0.9636233, -0.1686756, 0, 0, 1, 1, 1,
-0.429668, -1.046789, -2.814091, 1, 0, 0, 1, 1,
-0.4284272, 1.197437, -0.2354985, 1, 0, 0, 1, 1,
-0.4255743, -0.04370811, -2.996438, 1, 0, 0, 1, 1,
-0.4216292, -0.9902331, -0.4624864, 1, 0, 0, 1, 1,
-0.4194816, 2.073878, 0.6383455, 1, 0, 0, 1, 1,
-0.4178765, -0.5572554, -1.353061, 0, 0, 0, 1, 1,
-0.414688, 0.08769493, -3.230343, 0, 0, 0, 1, 1,
-0.4120477, -1.888718, -3.299873, 0, 0, 0, 1, 1,
-0.4106061, -0.6506593, -3.004942, 0, 0, 0, 1, 1,
-0.4101634, -0.8468087, -2.275088, 0, 0, 0, 1, 1,
-0.4049442, 0.09938402, -1.137385, 0, 0, 0, 1, 1,
-0.4047266, -0.2975841, -2.198745, 0, 0, 0, 1, 1,
-0.4020729, 0.6484913, -0.3656213, 1, 1, 1, 1, 1,
-0.3960421, -0.7849777, -3.563473, 1, 1, 1, 1, 1,
-0.3883118, -0.8749813, -2.627208, 1, 1, 1, 1, 1,
-0.388297, 1.038167, 0.6235262, 1, 1, 1, 1, 1,
-0.3877174, 0.7495127, -0.8032839, 1, 1, 1, 1, 1,
-0.3769408, 0.03919554, -2.881146, 1, 1, 1, 1, 1,
-0.3746523, -0.2752796, -1.892539, 1, 1, 1, 1, 1,
-0.3721122, -0.1112065, -1.414413, 1, 1, 1, 1, 1,
-0.3719271, -2.842481, -1.976186, 1, 1, 1, 1, 1,
-0.3674888, -0.8133084, -2.998235, 1, 1, 1, 1, 1,
-0.3643993, -0.7352793, -2.508808, 1, 1, 1, 1, 1,
-0.3637883, 0.3076384, -1.228307, 1, 1, 1, 1, 1,
-0.3626433, -0.8476122, -1.609499, 1, 1, 1, 1, 1,
-0.3549288, 2.176245, 1.239074, 1, 1, 1, 1, 1,
-0.352129, 2.388667, 0.965947, 1, 1, 1, 1, 1,
-0.3517679, 0.7532828, -0.2623637, 0, 0, 1, 1, 1,
-0.3508072, -1.50076, -5.495614, 1, 0, 0, 1, 1,
-0.3423741, 0.837796, 0.198712, 1, 0, 0, 1, 1,
-0.3413968, 0.1393721, -1.950894, 1, 0, 0, 1, 1,
-0.3358464, -0.486132, -2.864544, 1, 0, 0, 1, 1,
-0.3354968, 0.1170232, 0.07921772, 1, 0, 0, 1, 1,
-0.332464, -0.8805324, -3.273208, 0, 0, 0, 1, 1,
-0.3237076, -0.5528037, -2.090086, 0, 0, 0, 1, 1,
-0.3219324, -0.8118773, -3.270027, 0, 0, 0, 1, 1,
-0.3206116, -0.4100938, -2.604554, 0, 0, 0, 1, 1,
-0.3202685, 0.7069274, 1.08223, 0, 0, 0, 1, 1,
-0.3201829, -0.2815148, -2.162687, 0, 0, 0, 1, 1,
-0.3200284, 0.06579894, -1.028413, 0, 0, 0, 1, 1,
-0.3152256, 0.2807055, -0.8525341, 1, 1, 1, 1, 1,
-0.3141922, 1.375846, -1.225938, 1, 1, 1, 1, 1,
-0.3116124, 0.6283339, -0.3695083, 1, 1, 1, 1, 1,
-0.3103314, 1.011341, 0.8322382, 1, 1, 1, 1, 1,
-0.3096544, -1.445632, -2.92967, 1, 1, 1, 1, 1,
-0.3084074, 0.9219777, -0.3991027, 1, 1, 1, 1, 1,
-0.3054515, 1.059364, -0.2369085, 1, 1, 1, 1, 1,
-0.3041671, -0.6401693, -2.403653, 1, 1, 1, 1, 1,
-0.3036721, -1.372036, -2.384835, 1, 1, 1, 1, 1,
-0.303662, -1.080455, -2.808539, 1, 1, 1, 1, 1,
-0.2935483, 1.184489, 0.3365256, 1, 1, 1, 1, 1,
-0.290325, 0.7527266, -1.589917, 1, 1, 1, 1, 1,
-0.2901337, -0.8146679, -1.670698, 1, 1, 1, 1, 1,
-0.2890335, -2.077127, -1.946886, 1, 1, 1, 1, 1,
-0.2889034, 0.380806, -0.6209131, 1, 1, 1, 1, 1,
-0.2878999, 0.4364245, -1.415667, 0, 0, 1, 1, 1,
-0.2861772, -0.4395963, -1.532422, 1, 0, 0, 1, 1,
-0.2853358, -2.712232, -2.830268, 1, 0, 0, 1, 1,
-0.2847273, -0.1991117, -2.020764, 1, 0, 0, 1, 1,
-0.2831678, 0.1608194, -0.07648987, 1, 0, 0, 1, 1,
-0.2820616, -0.3721449, -2.211233, 1, 0, 0, 1, 1,
-0.2809424, -0.7717243, -2.592861, 0, 0, 0, 1, 1,
-0.2805581, -0.3771383, -4.678872, 0, 0, 0, 1, 1,
-0.2711498, -1.175129, -1.721558, 0, 0, 0, 1, 1,
-0.2665483, -0.1851399, -4.454589, 0, 0, 0, 1, 1,
-0.2660981, -1.65573, -1.356129, 0, 0, 0, 1, 1,
-0.258657, 1.25394, 0.2053946, 0, 0, 0, 1, 1,
-0.2574785, 0.9581521, -0.8347585, 0, 0, 0, 1, 1,
-0.2562606, -1.052321, -1.562766, 1, 1, 1, 1, 1,
-0.2489556, 1.064276, 0.6912879, 1, 1, 1, 1, 1,
-0.2455621, -2.136998, -3.354715, 1, 1, 1, 1, 1,
-0.2452988, -0.8313259, -4.182975, 1, 1, 1, 1, 1,
-0.2449001, 0.7353734, -0.1125963, 1, 1, 1, 1, 1,
-0.2435158, 0.7711814, 1.160012, 1, 1, 1, 1, 1,
-0.2432473, 0.4781943, -0.8802593, 1, 1, 1, 1, 1,
-0.2415611, -0.1096776, -3.199983, 1, 1, 1, 1, 1,
-0.2395158, -0.7637551, -1.408866, 1, 1, 1, 1, 1,
-0.2392908, -1.103916, -2.44306, 1, 1, 1, 1, 1,
-0.2287328, -1.255713, -4.385345, 1, 1, 1, 1, 1,
-0.2133207, -1.5502, -3.618486, 1, 1, 1, 1, 1,
-0.2119954, 0.9406596, -0.09216598, 1, 1, 1, 1, 1,
-0.2094332, -0.7670225, -0.8176759, 1, 1, 1, 1, 1,
-0.2059009, -0.5314214, -2.951976, 1, 1, 1, 1, 1,
-0.2058531, -1.928338, -1.533535, 0, 0, 1, 1, 1,
-0.204426, 1.521432, -0.902117, 1, 0, 0, 1, 1,
-0.2038184, -0.663295, -1.858882, 1, 0, 0, 1, 1,
-0.2032398, 0.4021188, 0.6468578, 1, 0, 0, 1, 1,
-0.2007072, 0.4270703, -0.6432486, 1, 0, 0, 1, 1,
-0.2002054, -0.5463347, -3.671454, 1, 0, 0, 1, 1,
-0.1869468, -0.1479425, -1.684988, 0, 0, 0, 1, 1,
-0.183105, -0.4788391, -2.430512, 0, 0, 0, 1, 1,
-0.1817253, 0.09643994, -1.861918, 0, 0, 0, 1, 1,
-0.1815371, -0.3006521, -1.526029, 0, 0, 0, 1, 1,
-0.1806543, -0.3382041, -2.843029, 0, 0, 0, 1, 1,
-0.1793942, 0.3326905, -0.495315, 0, 0, 0, 1, 1,
-0.177623, 0.2033023, -1.125836, 0, 0, 0, 1, 1,
-0.1711035, -0.4640111, -3.395956, 1, 1, 1, 1, 1,
-0.1690496, -0.09312525, -0.3876749, 1, 1, 1, 1, 1,
-0.1677976, -0.1138351, -0.566707, 1, 1, 1, 1, 1,
-0.1663731, 1.074733, 0.2231625, 1, 1, 1, 1, 1,
-0.166218, -0.1621476, -4.107198, 1, 1, 1, 1, 1,
-0.1648187, -2.277794, -4.540902, 1, 1, 1, 1, 1,
-0.159041, 0.09605839, -1.012957, 1, 1, 1, 1, 1,
-0.1585021, -1.323618, -3.776092, 1, 1, 1, 1, 1,
-0.1574583, 1.511431, 0.4237004, 1, 1, 1, 1, 1,
-0.1482977, 0.7309624, -2.549352, 1, 1, 1, 1, 1,
-0.1476235, 0.0682045, -1.640027, 1, 1, 1, 1, 1,
-0.1464048, 3.033165, -0.6968467, 1, 1, 1, 1, 1,
-0.1457294, 0.845125, -0.467172, 1, 1, 1, 1, 1,
-0.1343782, -0.199817, -2.904268, 1, 1, 1, 1, 1,
-0.1321005, -0.5935959, -3.502739, 1, 1, 1, 1, 1,
-0.131906, 0.1264895, -1.191975, 0, 0, 1, 1, 1,
-0.13137, -1.171959, -4.090843, 1, 0, 0, 1, 1,
-0.1312422, 1.426335, 0.1688875, 1, 0, 0, 1, 1,
-0.1259993, -0.1610146, -2.094935, 1, 0, 0, 1, 1,
-0.1236798, 1.095567, 0.363896, 1, 0, 0, 1, 1,
-0.1213978, 0.501148, 0.841558, 1, 0, 0, 1, 1,
-0.1176695, -0.07951782, -2.207008, 0, 0, 0, 1, 1,
-0.1148123, 0.6793619, 0.2331402, 0, 0, 0, 1, 1,
-0.1133493, -0.6815005, -3.65068, 0, 0, 0, 1, 1,
-0.1105333, 0.5608497, -1.019753, 0, 0, 0, 1, 1,
-0.1093469, 1.211486, -0.4320224, 0, 0, 0, 1, 1,
-0.1077969, -1.412496, -1.384673, 0, 0, 0, 1, 1,
-0.1056284, -0.9380198, -2.26415, 0, 0, 0, 1, 1,
-0.1041461, 0.7095959, -0.08123011, 1, 1, 1, 1, 1,
-0.09917352, 0.8781941, -0.8433006, 1, 1, 1, 1, 1,
-0.0911405, -1.654301, -2.986951, 1, 1, 1, 1, 1,
-0.09074076, 0.4679317, -0.7178858, 1, 1, 1, 1, 1,
-0.08840489, -0.7610599, -3.052212, 1, 1, 1, 1, 1,
-0.07742947, -0.4959292, -2.990071, 1, 1, 1, 1, 1,
-0.0717316, 1.818044, -0.1243216, 1, 1, 1, 1, 1,
-0.06835838, -2.18689, -4.643099, 1, 1, 1, 1, 1,
-0.06087582, 1.252524, -0.5210204, 1, 1, 1, 1, 1,
-0.06070916, 1.566122, -0.7285529, 1, 1, 1, 1, 1,
-0.05203653, -1.00108, -2.746052, 1, 1, 1, 1, 1,
-0.05190515, -0.3993499, -3.213287, 1, 1, 1, 1, 1,
-0.05125065, 1.344768, -0.8562241, 1, 1, 1, 1, 1,
-0.0460377, -0.1510281, -3.934065, 1, 1, 1, 1, 1,
-0.04419075, 0.5852312, 1.075459, 1, 1, 1, 1, 1,
-0.04390553, -0.5441084, -3.478518, 0, 0, 1, 1, 1,
-0.0427774, 0.5067177, 1.322056, 1, 0, 0, 1, 1,
-0.0402069, 0.002482379, -3.159901, 1, 0, 0, 1, 1,
-0.03474987, -0.03943152, -4.152576, 1, 0, 0, 1, 1,
-0.03252953, -0.632708, -3.933935, 1, 0, 0, 1, 1,
-0.03218748, -0.4534042, -2.550424, 1, 0, 0, 1, 1,
-0.02449144, -0.1424629, -2.341578, 0, 0, 0, 1, 1,
-0.02059127, -1.028504, -3.20764, 0, 0, 0, 1, 1,
-0.01956409, -0.1397295, -4.044005, 0, 0, 0, 1, 1,
-0.01928528, -0.4094779, -3.118408, 0, 0, 0, 1, 1,
-0.0151145, 1.312591, 0.4792548, 0, 0, 0, 1, 1,
-0.01399406, 1.17229, -0.4309483, 0, 0, 0, 1, 1,
-0.01375409, -0.6015785, -2.105086, 0, 0, 0, 1, 1,
-0.01060431, -0.2704284, -3.909592, 1, 1, 1, 1, 1,
-0.007949187, 0.5136748, -1.077719, 1, 1, 1, 1, 1,
-0.007554336, 0.505532, 0.2944044, 1, 1, 1, 1, 1,
-0.003741209, -1.747051, -1.306089, 1, 1, 1, 1, 1,
-0.0001358804, 1.416295, 1.337783, 1, 1, 1, 1, 1,
0.0007553143, 0.9181264, 1.077035, 1, 1, 1, 1, 1,
0.001184648, -0.1221921, 1.051165, 1, 1, 1, 1, 1,
0.004628816, 0.9656624, 0.1212207, 1, 1, 1, 1, 1,
0.006231577, 0.9763297, 1.419161, 1, 1, 1, 1, 1,
0.01154085, -0.6683053, 3.37525, 1, 1, 1, 1, 1,
0.01342419, -0.538717, 3.879763, 1, 1, 1, 1, 1,
0.01419156, -0.8090131, 3.141464, 1, 1, 1, 1, 1,
0.01894834, -1.679654, 1.613403, 1, 1, 1, 1, 1,
0.02315728, 1.078831, 1.726974, 1, 1, 1, 1, 1,
0.02599064, -0.00288995, -0.1819252, 1, 1, 1, 1, 1,
0.02730486, 1.038977, 0.177481, 0, 0, 1, 1, 1,
0.02960858, -0.9606175, 3.374988, 1, 0, 0, 1, 1,
0.03139843, 2.895209, 0.9268358, 1, 0, 0, 1, 1,
0.03187198, -1.237828, 3.169065, 1, 0, 0, 1, 1,
0.0341303, -0.777335, 1.856387, 1, 0, 0, 1, 1,
0.04065583, 1.046847, 1.802703, 1, 0, 0, 1, 1,
0.04142576, 0.5068744, 1.026784, 0, 0, 0, 1, 1,
0.0414651, 0.289997, 1.75403, 0, 0, 0, 1, 1,
0.04158796, 0.7893957, 0.7246634, 0, 0, 0, 1, 1,
0.04186996, 0.0575932, 1.633978, 0, 0, 0, 1, 1,
0.04594, 1.692067, 1.397465, 0, 0, 0, 1, 1,
0.05330051, 1.028717, -0.09927902, 0, 0, 0, 1, 1,
0.05377857, 0.4238386, 0.34882, 0, 0, 0, 1, 1,
0.05399466, -1.001269, 3.224591, 1, 1, 1, 1, 1,
0.05695209, 0.6421661, 2.051334, 1, 1, 1, 1, 1,
0.05938042, 0.157704, 0.7014031, 1, 1, 1, 1, 1,
0.06292809, -0.8602663, 1.983171, 1, 1, 1, 1, 1,
0.06295031, -0.7537299, 2.53728, 1, 1, 1, 1, 1,
0.06356816, 0.2844107, -1.095365, 1, 1, 1, 1, 1,
0.06401324, -1.226064, 4.68116, 1, 1, 1, 1, 1,
0.06553535, 1.223631, -0.3377132, 1, 1, 1, 1, 1,
0.06719646, 0.487172, 1.364885, 1, 1, 1, 1, 1,
0.07212311, -0.03109081, 1.918305, 1, 1, 1, 1, 1,
0.0721373, 0.3281724, 0.1513816, 1, 1, 1, 1, 1,
0.07367875, 0.9771133, -1.158785, 1, 1, 1, 1, 1,
0.07699555, -0.4215994, 2.452689, 1, 1, 1, 1, 1,
0.08428567, 1.180401, 0.3648776, 1, 1, 1, 1, 1,
0.08440641, 0.4833748, 0.05242167, 1, 1, 1, 1, 1,
0.08494249, -0.9696887, 2.35007, 0, 0, 1, 1, 1,
0.09163409, 0.5629879, 1.235274, 1, 0, 0, 1, 1,
0.1016711, -1.395303, 3.205705, 1, 0, 0, 1, 1,
0.1033939, 0.8196301, 0.81724, 1, 0, 0, 1, 1,
0.1074175, -0.2329711, 1.08196, 1, 0, 0, 1, 1,
0.1079672, -0.5693232, 3.434655, 1, 0, 0, 1, 1,
0.1129829, 0.2571069, 0.227293, 0, 0, 0, 1, 1,
0.1133459, -1.055422, 3.428388, 0, 0, 0, 1, 1,
0.114331, -1.221449, 2.983283, 0, 0, 0, 1, 1,
0.1147375, 0.1867042, 1.089901, 0, 0, 0, 1, 1,
0.115427, 0.4357397, 1.566555, 0, 0, 0, 1, 1,
0.1212859, -1.598765, 1.83849, 0, 0, 0, 1, 1,
0.1223455, 0.8669684, 0.06839474, 0, 0, 0, 1, 1,
0.1235467, 0.04577571, 1.736001, 1, 1, 1, 1, 1,
0.1289131, 1.268158, -0.8456525, 1, 1, 1, 1, 1,
0.1293002, 0.9927133, 0.117951, 1, 1, 1, 1, 1,
0.1345855, 2.364571, -1.298155, 1, 1, 1, 1, 1,
0.1371674, 1.6336, 0.6119922, 1, 1, 1, 1, 1,
0.1405759, -0.5655658, 2.510727, 1, 1, 1, 1, 1,
0.1406732, 0.3749231, 0.7091582, 1, 1, 1, 1, 1,
0.1434504, 1.554119, 0.1284415, 1, 1, 1, 1, 1,
0.1467654, -0.5675287, 3.265988, 1, 1, 1, 1, 1,
0.1469014, -0.4039599, 3.14767, 1, 1, 1, 1, 1,
0.1490728, -0.4241791, 5.400967, 1, 1, 1, 1, 1,
0.152178, -1.271277, 2.318589, 1, 1, 1, 1, 1,
0.1527585, 2.717828, 0.434212, 1, 1, 1, 1, 1,
0.1552836, -0.1368502, 2.34727, 1, 1, 1, 1, 1,
0.1553973, -0.8075453, 3.096428, 1, 1, 1, 1, 1,
0.1555264, -1.409744, 2.720331, 0, 0, 1, 1, 1,
0.1556937, -0.08981183, 1.342498, 1, 0, 0, 1, 1,
0.155836, -1.54786, 2.067749, 1, 0, 0, 1, 1,
0.1563281, -0.09203976, 2.54108, 1, 0, 0, 1, 1,
0.1580683, 0.2042041, -1.119691, 1, 0, 0, 1, 1,
0.1590399, 0.2469556, 1.538582, 1, 0, 0, 1, 1,
0.1627965, -0.1995363, 3.01166, 0, 0, 0, 1, 1,
0.1655351, 0.1813158, 1.830099, 0, 0, 0, 1, 1,
0.1661354, -1.350722, 2.760116, 0, 0, 0, 1, 1,
0.1687311, 2.109283, -0.9316422, 0, 0, 0, 1, 1,
0.1715621, 1.075348, -0.2018824, 0, 0, 0, 1, 1,
0.1749658, 1.128692, 1.329895, 0, 0, 0, 1, 1,
0.177323, -0.4986778, 3.367226, 0, 0, 0, 1, 1,
0.1791249, 1.879294, -0.009826291, 1, 1, 1, 1, 1,
0.180793, -0.6708181, 2.342362, 1, 1, 1, 1, 1,
0.1834365, -0.8211998, 3.094268, 1, 1, 1, 1, 1,
0.1835807, -0.6806731, 3.629289, 1, 1, 1, 1, 1,
0.1841413, 0.6168174, -1.575327, 1, 1, 1, 1, 1,
0.1864861, -0.1868856, 2.629867, 1, 1, 1, 1, 1,
0.1867983, -2.553812, 3.281461, 1, 1, 1, 1, 1,
0.1930858, 2.25634, -0.3028463, 1, 1, 1, 1, 1,
0.1932285, -0.421476, 2.884349, 1, 1, 1, 1, 1,
0.1938271, 0.1211006, 0.3020843, 1, 1, 1, 1, 1,
0.1939443, -0.5195264, 3.337665, 1, 1, 1, 1, 1,
0.1967621, 1.318525, 1.687434, 1, 1, 1, 1, 1,
0.1993756, 0.1843228, 2.243386, 1, 1, 1, 1, 1,
0.2003847, -0.4552799, 3.528657, 1, 1, 1, 1, 1,
0.203189, 0.7145008, 1.008294, 1, 1, 1, 1, 1,
0.2041122, 0.3766885, 1.936385, 0, 0, 1, 1, 1,
0.2046559, 0.1266767, 0.9246981, 1, 0, 0, 1, 1,
0.2136957, 0.1652177, 0.006930584, 1, 0, 0, 1, 1,
0.214707, 1.360625, -0.6966067, 1, 0, 0, 1, 1,
0.2170636, 1.369294, -0.7522463, 1, 0, 0, 1, 1,
0.2200818, -0.8305001, 1.513737, 1, 0, 0, 1, 1,
0.2210804, -0.541063, 1.241448, 0, 0, 0, 1, 1,
0.2271197, -0.08085041, 1.22727, 0, 0, 0, 1, 1,
0.2334823, 1.880194, -0.006687915, 0, 0, 0, 1, 1,
0.2350003, -0.1846343, 0.8357726, 0, 0, 0, 1, 1,
0.2378837, 0.5990854, 0.06156945, 0, 0, 0, 1, 1,
0.238377, -0.5929785, 3.100415, 0, 0, 0, 1, 1,
0.2414052, 1.014626, -0.003837829, 0, 0, 0, 1, 1,
0.2424604, 0.3672648, 1.586726, 1, 1, 1, 1, 1,
0.2428956, 1.131493, 0.5486888, 1, 1, 1, 1, 1,
0.245167, -0.7517045, 1.673573, 1, 1, 1, 1, 1,
0.2478777, 0.8954204, 1.162906, 1, 1, 1, 1, 1,
0.2486393, -0.03003377, 1.024315, 1, 1, 1, 1, 1,
0.2494796, -0.6615467, 3.09112, 1, 1, 1, 1, 1,
0.2506182, -2.006394, 2.585715, 1, 1, 1, 1, 1,
0.2517388, -1.468136, 3.340016, 1, 1, 1, 1, 1,
0.2522672, -0.9256519, 3.667814, 1, 1, 1, 1, 1,
0.2565205, -1.095544, 1.23341, 1, 1, 1, 1, 1,
0.2658992, 1.93059, -0.2255241, 1, 1, 1, 1, 1,
0.267046, 0.8741119, -0.4326081, 1, 1, 1, 1, 1,
0.2716093, 0.4365139, 2.691829, 1, 1, 1, 1, 1,
0.2736382, -0.09921431, 2.977501, 1, 1, 1, 1, 1,
0.2771417, 1.090044, 2.329528, 1, 1, 1, 1, 1,
0.2809868, -0.8470121, 2.723368, 0, 0, 1, 1, 1,
0.2810801, -0.0358482, 3.032075, 1, 0, 0, 1, 1,
0.2813949, 0.1588669, 0.7272463, 1, 0, 0, 1, 1,
0.2818191, -0.986194, 2.939945, 1, 0, 0, 1, 1,
0.2851529, -0.9197901, 4.643428, 1, 0, 0, 1, 1,
0.2874708, 0.01775146, 1.530827, 1, 0, 0, 1, 1,
0.2899303, -0.7248348, 5.099605, 0, 0, 0, 1, 1,
0.2934933, -0.4181848, 2.869147, 0, 0, 0, 1, 1,
0.2943964, 0.4101715, -0.1240309, 0, 0, 0, 1, 1,
0.2987512, 1.552199, -1.013828, 0, 0, 0, 1, 1,
0.3049785, -0.01621415, 1.731003, 0, 0, 0, 1, 1,
0.3061361, 1.111319, 0.4280447, 0, 0, 0, 1, 1,
0.3071893, 2.730648, 0.5140999, 0, 0, 0, 1, 1,
0.3073531, 0.5078006, -0.3978811, 1, 1, 1, 1, 1,
0.3093017, 0.8574938, -0.1884943, 1, 1, 1, 1, 1,
0.3107811, -0.8535686, 5.524183, 1, 1, 1, 1, 1,
0.3157432, -1.759816, 4.258388, 1, 1, 1, 1, 1,
0.3160037, 0.339882, 0.7592557, 1, 1, 1, 1, 1,
0.3171169, 0.2119061, 3.486621, 1, 1, 1, 1, 1,
0.3177219, -0.6035552, 2.839968, 1, 1, 1, 1, 1,
0.3232554, -0.5628561, 2.460958, 1, 1, 1, 1, 1,
0.3250838, 0.8712929, 2.553268, 1, 1, 1, 1, 1,
0.3286242, -0.2815095, 2.407305, 1, 1, 1, 1, 1,
0.3319215, 0.02445273, 2.732555, 1, 1, 1, 1, 1,
0.3324944, 0.2397805, 1.616565, 1, 1, 1, 1, 1,
0.3329992, 0.3459253, 0.7011723, 1, 1, 1, 1, 1,
0.3351181, 1.952818, 0.7500842, 1, 1, 1, 1, 1,
0.3385781, -1.667378, 3.068974, 1, 1, 1, 1, 1,
0.3387301, 1.239255, -0.1797437, 0, 0, 1, 1, 1,
0.34003, 0.2331103, -0.3633108, 1, 0, 0, 1, 1,
0.3432434, -2.243391, 1.593421, 1, 0, 0, 1, 1,
0.344814, 0.8132609, 0.801454, 1, 0, 0, 1, 1,
0.34737, -0.4668028, 3.787787, 1, 0, 0, 1, 1,
0.3477212, -0.1140609, 0.9945806, 1, 0, 0, 1, 1,
0.3505922, 0.2107296, 0.6869534, 0, 0, 0, 1, 1,
0.3516303, -0.2190215, 1.40977, 0, 0, 0, 1, 1,
0.3529607, 0.5222529, -1.001417, 0, 0, 0, 1, 1,
0.3558586, -0.01836539, 0.1732169, 0, 0, 0, 1, 1,
0.3582133, 0.219069, -0.302159, 0, 0, 0, 1, 1,
0.36215, -1.274917, 4.01626, 0, 0, 0, 1, 1,
0.3638, 0.7935069, 2.349875, 0, 0, 0, 1, 1,
0.3668777, 0.3480388, -0.01291029, 1, 1, 1, 1, 1,
0.372624, 2.606078, 0.5649037, 1, 1, 1, 1, 1,
0.3789273, 0.04668462, 1.165454, 1, 1, 1, 1, 1,
0.3797249, -0.06939415, 1.942956, 1, 1, 1, 1, 1,
0.3857419, -0.05840931, 2.119634, 1, 1, 1, 1, 1,
0.3862981, 1.039099, -1.124061, 1, 1, 1, 1, 1,
0.3935572, 0.1947296, -1.231508, 1, 1, 1, 1, 1,
0.3951134, -0.5170775, 1.938142, 1, 1, 1, 1, 1,
0.395707, -0.468314, 2.201437, 1, 1, 1, 1, 1,
0.3961458, -0.6813423, 1.746966, 1, 1, 1, 1, 1,
0.4005478, 0.0494905, 2.415951, 1, 1, 1, 1, 1,
0.4010545, 1.069175, 0.6607864, 1, 1, 1, 1, 1,
0.402714, 0.2934217, -0.243643, 1, 1, 1, 1, 1,
0.4080082, -0.4751055, 2.063887, 1, 1, 1, 1, 1,
0.4102833, -0.4925654, 2.273049, 1, 1, 1, 1, 1,
0.4105506, 0.2049777, 0.9202958, 0, 0, 1, 1, 1,
0.4120537, -1.301129, 3.530805, 1, 0, 0, 1, 1,
0.4134552, 1.108876, 1.361438, 1, 0, 0, 1, 1,
0.4142416, 0.1730064, 1.35443, 1, 0, 0, 1, 1,
0.4221478, -1.044402, 2.480514, 1, 0, 0, 1, 1,
0.4304412, -0.1237593, 1.904742, 1, 0, 0, 1, 1,
0.432195, -0.6865662, 1.024819, 0, 0, 0, 1, 1,
0.432845, 0.01516967, 1.122007, 0, 0, 0, 1, 1,
0.4361033, 0.4487124, 0.4795069, 0, 0, 0, 1, 1,
0.437865, 0.04622403, -0.5778032, 0, 0, 0, 1, 1,
0.4402777, 0.2614338, 0.5659375, 0, 0, 0, 1, 1,
0.4427961, 0.792197, -1.276646, 0, 0, 0, 1, 1,
0.4433183, -1.25443, 3.494491, 0, 0, 0, 1, 1,
0.4505005, 0.5186592, -0.4764794, 1, 1, 1, 1, 1,
0.4523771, 1.296368, 0.02008039, 1, 1, 1, 1, 1,
0.4550588, -0.1754123, 4.167411, 1, 1, 1, 1, 1,
0.4551437, -0.454788, 2.282763, 1, 1, 1, 1, 1,
0.4551947, -0.1352236, 2.443903, 1, 1, 1, 1, 1,
0.4556529, 0.7695939, 1.971476, 1, 1, 1, 1, 1,
0.4560876, -0.5722051, 3.248371, 1, 1, 1, 1, 1,
0.4614772, 1.960253, -0.9261455, 1, 1, 1, 1, 1,
0.467381, -0.8133855, 4.096367, 1, 1, 1, 1, 1,
0.4678486, -0.9013553, 2.73622, 1, 1, 1, 1, 1,
0.4779904, 0.8330376, 1.095069, 1, 1, 1, 1, 1,
0.4805578, -0.5125705, -0.1181854, 1, 1, 1, 1, 1,
0.4922236, 0.6807454, 1.063733, 1, 1, 1, 1, 1,
0.5011845, 0.008940423, 1.637215, 1, 1, 1, 1, 1,
0.5086656, -2.029073, 3.56987, 1, 1, 1, 1, 1,
0.5116107, -0.09213203, 1.260354, 0, 0, 1, 1, 1,
0.5118094, -1.294194, 3.227613, 1, 0, 0, 1, 1,
0.5227291, -2.486961, 4.084598, 1, 0, 0, 1, 1,
0.5316846, -1.02864, 2.992369, 1, 0, 0, 1, 1,
0.5318596, -1.586767, 3.269872, 1, 0, 0, 1, 1,
0.5386792, 0.9310539, -1.099912, 1, 0, 0, 1, 1,
0.5394003, -0.4775454, 0.7488426, 0, 0, 0, 1, 1,
0.5555084, -0.6068383, 2.314031, 0, 0, 0, 1, 1,
0.5642309, 0.4195915, 0.384879, 0, 0, 0, 1, 1,
0.5733605, 0.7233769, -0.8337759, 0, 0, 0, 1, 1,
0.5741296, -0.7655056, 0.643147, 0, 0, 0, 1, 1,
0.5757554, -0.3593109, 1.548417, 0, 0, 0, 1, 1,
0.5802861, 0.7106681, 1.235384, 0, 0, 0, 1, 1,
0.5807721, -0.950758, 3.279001, 1, 1, 1, 1, 1,
0.5895204, -0.6551086, 1.082853, 1, 1, 1, 1, 1,
0.590143, 1.029174, 0.3709236, 1, 1, 1, 1, 1,
0.5906042, 0.7370273, 0.2608145, 1, 1, 1, 1, 1,
0.5913982, 1.21734, 0.4148088, 1, 1, 1, 1, 1,
0.5930259, 0.6502959, 0.9620542, 1, 1, 1, 1, 1,
0.59475, 1.018897, -0.5988705, 1, 1, 1, 1, 1,
0.5996109, -0.8900604, 0.6727884, 1, 1, 1, 1, 1,
0.6017779, 0.6502075, 1.170669, 1, 1, 1, 1, 1,
0.6022795, 0.4048987, 1.434983, 1, 1, 1, 1, 1,
0.6024523, 0.3863433, 0.9134246, 1, 1, 1, 1, 1,
0.6025249, -0.4828427, 1.782085, 1, 1, 1, 1, 1,
0.6054609, -0.5885483, 2.969634, 1, 1, 1, 1, 1,
0.6109734, 0.8825688, 1.259289, 1, 1, 1, 1, 1,
0.6165382, -0.7231262, 2.319794, 1, 1, 1, 1, 1,
0.616861, -0.8564515, 0.008453168, 0, 0, 1, 1, 1,
0.6220976, 1.105298, 1.718442, 1, 0, 0, 1, 1,
0.6248217, -0.2132688, 2.776305, 1, 0, 0, 1, 1,
0.625561, -0.397673, 2.468517, 1, 0, 0, 1, 1,
0.6299791, -0.2248257, 0.8951612, 1, 0, 0, 1, 1,
0.6306636, 0.799296, 2.22321, 1, 0, 0, 1, 1,
0.6325203, -0.9170763, 2.434491, 0, 0, 0, 1, 1,
0.633879, 0.2024269, 1.557305, 0, 0, 0, 1, 1,
0.641445, -2.127317, 1.521188, 0, 0, 0, 1, 1,
0.6477283, -1.376318, 3.59069, 0, 0, 0, 1, 1,
0.6479098, 1.35287, -0.01362451, 0, 0, 0, 1, 1,
0.6494269, -0.06930128, 4.085783, 0, 0, 0, 1, 1,
0.6507632, -1.54085, 2.773562, 0, 0, 0, 1, 1,
0.6510721, -0.2308724, 0.6647665, 1, 1, 1, 1, 1,
0.652727, 1.229762, 0.3734627, 1, 1, 1, 1, 1,
0.653003, 0.3166583, 2.239559, 1, 1, 1, 1, 1,
0.6537494, -0.8333229, 1.629321, 1, 1, 1, 1, 1,
0.6539909, 1.444924, -0.007109842, 1, 1, 1, 1, 1,
0.6567959, 1.229657, -0.7038343, 1, 1, 1, 1, 1,
0.6590817, -0.6302221, 1.643226, 1, 1, 1, 1, 1,
0.6695946, -0.01223956, 2.396263, 1, 1, 1, 1, 1,
0.6797963, -0.04247641, 2.740503, 1, 1, 1, 1, 1,
0.6808885, 0.5078542, -0.7085807, 1, 1, 1, 1, 1,
0.6843324, -1.653908, 3.245657, 1, 1, 1, 1, 1,
0.6880978, -1.096513, 2.559515, 1, 1, 1, 1, 1,
0.6881574, -0.5256627, 1.906146, 1, 1, 1, 1, 1,
0.6979336, 1.150178, 1.03215, 1, 1, 1, 1, 1,
0.698521, -0.3565866, 2.587795, 1, 1, 1, 1, 1,
0.6994694, -0.1236205, 1.368239, 0, 0, 1, 1, 1,
0.7060591, -0.3041511, 1.115712, 1, 0, 0, 1, 1,
0.7133898, 1.606895, -0.04194766, 1, 0, 0, 1, 1,
0.7232211, 0.3912005, 1.463487, 1, 0, 0, 1, 1,
0.736006, -0.2480738, 0.3051158, 1, 0, 0, 1, 1,
0.7445614, 1.152174, -0.7260947, 1, 0, 0, 1, 1,
0.7479583, 0.1536439, 0.3476318, 0, 0, 0, 1, 1,
0.7487437, 0.2472448, 1.662982, 0, 0, 0, 1, 1,
0.7488053, -0.563175, 1.192358, 0, 0, 0, 1, 1,
0.7516579, 0.3475931, 2.638164, 0, 0, 0, 1, 1,
0.754918, -0.2360864, 0.3743499, 0, 0, 0, 1, 1,
0.7573907, 1.937276, -0.05790938, 0, 0, 0, 1, 1,
0.760162, -0.2273052, 1.193971, 0, 0, 0, 1, 1,
0.7625939, 1.126619, 0.1484775, 1, 1, 1, 1, 1,
0.7672214, -0.634333, 1.373793, 1, 1, 1, 1, 1,
0.772357, 0.2289277, 1.193071, 1, 1, 1, 1, 1,
0.7727144, 0.1914556, 0.5476807, 1, 1, 1, 1, 1,
0.7753403, -0.1203473, 1.290201, 1, 1, 1, 1, 1,
0.7761601, 1.33571, -0.8267868, 1, 1, 1, 1, 1,
0.7764214, -0.4462906, 1.620811, 1, 1, 1, 1, 1,
0.7807025, 0.8923039, 0.6294691, 1, 1, 1, 1, 1,
0.7835375, -0.0628452, 2.934951, 1, 1, 1, 1, 1,
0.7836023, 0.2996907, 2.481025, 1, 1, 1, 1, 1,
0.7860646, -1.142024, 1.756043, 1, 1, 1, 1, 1,
0.7876279, 1.677926, 0.2214656, 1, 1, 1, 1, 1,
0.7896329, 0.3098929, 1.924346, 1, 1, 1, 1, 1,
0.7963706, 0.9216392, -0.6091927, 1, 1, 1, 1, 1,
0.8002344, -1.149752, 3.497673, 1, 1, 1, 1, 1,
0.8005723, 2.515811, -0.666355, 0, 0, 1, 1, 1,
0.8071333, 1.050448, 1.703532, 1, 0, 0, 1, 1,
0.8073032, 0.375583, 0.7467149, 1, 0, 0, 1, 1,
0.8120736, -0.5841336, 1.863636, 1, 0, 0, 1, 1,
0.8135939, -0.479199, 1.398591, 1, 0, 0, 1, 1,
0.8147657, 1.849882, -0.1863193, 1, 0, 0, 1, 1,
0.8219784, 0.03077714, 1.408975, 0, 0, 0, 1, 1,
0.8243557, 0.8704521, 0.382626, 0, 0, 0, 1, 1,
0.8255312, 0.4285417, 1.327411, 0, 0, 0, 1, 1,
0.827914, 0.1121135, 0.9616017, 0, 0, 0, 1, 1,
0.8301812, -1.072956, 2.34829, 0, 0, 0, 1, 1,
0.8384728, 1.521334, 0.8334157, 0, 0, 0, 1, 1,
0.8409231, 2.760221, 2.244923, 0, 0, 0, 1, 1,
0.8432915, 0.3504169, 1.032886, 1, 1, 1, 1, 1,
0.8541468, -0.9254031, 2.907244, 1, 1, 1, 1, 1,
0.8553721, -0.9225988, 3.74816, 1, 1, 1, 1, 1,
0.8632226, 0.651152, -1.342569, 1, 1, 1, 1, 1,
0.8670251, -0.2415937, 1.4463, 1, 1, 1, 1, 1,
0.8724409, 0.7425627, 0.5937355, 1, 1, 1, 1, 1,
0.8877847, 1.019616, 1.376749, 1, 1, 1, 1, 1,
0.8904417, -0.7986027, 2.735267, 1, 1, 1, 1, 1,
0.8922637, -2.081998, 3.069575, 1, 1, 1, 1, 1,
0.892657, 0.6163708, 1.408001, 1, 1, 1, 1, 1,
0.8944574, 2.358114, 0.8425297, 1, 1, 1, 1, 1,
0.897301, 0.05159243, 1.597596, 1, 1, 1, 1, 1,
0.9031306, -0.3699877, 0.5381404, 1, 1, 1, 1, 1,
0.9056431, -0.1502965, 1.999582, 1, 1, 1, 1, 1,
0.9133022, 0.3634369, 1.277991, 1, 1, 1, 1, 1,
0.9153265, -2.04985, 1.685714, 0, 0, 1, 1, 1,
0.9168005, 0.9071004, 1.497654, 1, 0, 0, 1, 1,
0.9218104, 0.1304411, 1.213911, 1, 0, 0, 1, 1,
0.9253149, 1.176951, 1.18675, 1, 0, 0, 1, 1,
0.9271287, 0.7628881, 1.507486, 1, 0, 0, 1, 1,
0.9276366, -1.332272, 2.752703, 1, 0, 0, 1, 1,
0.9281926, -1.394579, 2.066486, 0, 0, 0, 1, 1,
0.9375595, 0.9223253, -0.112302, 0, 0, 0, 1, 1,
0.939936, 0.4809425, 1.817222, 0, 0, 0, 1, 1,
0.9402727, -0.2396099, 3.060518, 0, 0, 0, 1, 1,
0.9449238, 0.7161501, 1.011589, 0, 0, 0, 1, 1,
0.9655086, -0.4667962, 0.07694274, 0, 0, 0, 1, 1,
0.9680161, 0.2724338, 1.030084, 0, 0, 0, 1, 1,
0.9712167, 0.757412, -0.5790244, 1, 1, 1, 1, 1,
0.9713366, 0.9035256, 0.4511221, 1, 1, 1, 1, 1,
0.9752994, -0.5608238, 2.477058, 1, 1, 1, 1, 1,
0.981667, 1.57683, 1.533725, 1, 1, 1, 1, 1,
0.9856227, 0.4346184, -0.2466842, 1, 1, 1, 1, 1,
0.9857252, -1.103393, 2.022927, 1, 1, 1, 1, 1,
1.002364, 0.6067971, 0.3239069, 1, 1, 1, 1, 1,
1.002451, -0.777824, 3.216347, 1, 1, 1, 1, 1,
1.009054, -0.7191682, 2.596159, 1, 1, 1, 1, 1,
1.016029, -0.7557938, 1.379091, 1, 1, 1, 1, 1,
1.016355, 0.07672202, 1.607414, 1, 1, 1, 1, 1,
1.01976, -0.1508017, 2.595113, 1, 1, 1, 1, 1,
1.022808, -1.51411, 3.182069, 1, 1, 1, 1, 1,
1.023349, 0.1030421, 2.304296, 1, 1, 1, 1, 1,
1.024897, -1.199895, 3.746624, 1, 1, 1, 1, 1,
1.025569, -0.5966794, 1.648304, 0, 0, 1, 1, 1,
1.029196, 0.3663688, 1.185206, 1, 0, 0, 1, 1,
1.03146, -0.4018821, 1.920578, 1, 0, 0, 1, 1,
1.034591, 0.02648258, 0.5795812, 1, 0, 0, 1, 1,
1.036129, 0.6018673, 1.713377, 1, 0, 0, 1, 1,
1.037167, -0.5656764, 3.793748, 1, 0, 0, 1, 1,
1.060011, -1.586404, 3.106171, 0, 0, 0, 1, 1,
1.06523, 0.9097462, 2.242412, 0, 0, 0, 1, 1,
1.067215, 0.7620373, -0.1008075, 0, 0, 0, 1, 1,
1.068261, 1.019582, 1.746675, 0, 0, 0, 1, 1,
1.078941, -0.3951294, 3.101738, 0, 0, 0, 1, 1,
1.086448, 0.6996002, 0.6703464, 0, 0, 0, 1, 1,
1.089834, 1.083149, 1.365947, 0, 0, 0, 1, 1,
1.10077, 0.8296791, 0.4307593, 1, 1, 1, 1, 1,
1.104272, 1.988384, -0.349381, 1, 1, 1, 1, 1,
1.108918, -1.536219, 2.144698, 1, 1, 1, 1, 1,
1.109106, -1.005534, 4.240311, 1, 1, 1, 1, 1,
1.111154, 0.5807765, 2.452427, 1, 1, 1, 1, 1,
1.112615, 0.2585178, 0.9340634, 1, 1, 1, 1, 1,
1.114891, 0.415685, 1.044186, 1, 1, 1, 1, 1,
1.115437, 1.024641, 1.938663, 1, 1, 1, 1, 1,
1.126294, 0.6459264, 2.485936, 1, 1, 1, 1, 1,
1.145113, 0.35813, 0.7580507, 1, 1, 1, 1, 1,
1.14646, -0.5095021, 0.4682437, 1, 1, 1, 1, 1,
1.148928, 0.5229204, 2.185596, 1, 1, 1, 1, 1,
1.15425, -0.3118712, 0.1667903, 1, 1, 1, 1, 1,
1.155641, 1.007901, 1.161757, 1, 1, 1, 1, 1,
1.157213, 0.2354369, 1.472363, 1, 1, 1, 1, 1,
1.163161, 1.2643, -0.02825733, 0, 0, 1, 1, 1,
1.173676, -0.181206, 1.775077, 1, 0, 0, 1, 1,
1.180749, -0.3653305, 1.238738, 1, 0, 0, 1, 1,
1.185047, -0.7408606, 2.344048, 1, 0, 0, 1, 1,
1.185851, -0.4556252, 2.223384, 1, 0, 0, 1, 1,
1.200981, -2.717188, 3.039478, 1, 0, 0, 1, 1,
1.204456, -1.58024, 3.21541, 0, 0, 0, 1, 1,
1.206817, -1.010923, 2.321874, 0, 0, 0, 1, 1,
1.210387, -1.859626, 2.187592, 0, 0, 0, 1, 1,
1.211323, -1.010409, 2.968673, 0, 0, 0, 1, 1,
1.213633, -0.08496029, 2.784687, 0, 0, 0, 1, 1,
1.218007, -0.3208706, 1.225101, 0, 0, 0, 1, 1,
1.220885, -1.533639, 1.631108, 0, 0, 0, 1, 1,
1.227623, 1.280315, -0.3108224, 1, 1, 1, 1, 1,
1.237544, -0.9187336, 1.714478, 1, 1, 1, 1, 1,
1.239195, -1.212364, 2.788898, 1, 1, 1, 1, 1,
1.244429, -0.3612737, 1.207244, 1, 1, 1, 1, 1,
1.24981, -1.73719, 3.570874, 1, 1, 1, 1, 1,
1.262219, 0.07365356, 2.075535, 1, 1, 1, 1, 1,
1.264715, 1.104816, 1.410074, 1, 1, 1, 1, 1,
1.283178, -0.341016, 1.849106, 1, 1, 1, 1, 1,
1.290457, -1.75307, 1.785458, 1, 1, 1, 1, 1,
1.291301, 0.3629835, 1.015402, 1, 1, 1, 1, 1,
1.306641, 0.616231, 2.511792, 1, 1, 1, 1, 1,
1.309545, 0.8976678, 0.549597, 1, 1, 1, 1, 1,
1.310502, -0.3718133, 1.76461, 1, 1, 1, 1, 1,
1.324678, -0.115532, 3.128313, 1, 1, 1, 1, 1,
1.333002, -0.4026301, 0.4153534, 1, 1, 1, 1, 1,
1.339481, -0.3895296, 2.7183, 0, 0, 1, 1, 1,
1.341789, -0.3438995, 2.418788, 1, 0, 0, 1, 1,
1.344029, -0.319318, 2.334203, 1, 0, 0, 1, 1,
1.349611, -0.287929, 2.483984, 1, 0, 0, 1, 1,
1.369523, -0.07135119, 2.44846, 1, 0, 0, 1, 1,
1.380053, -2.282449, 4.446218, 1, 0, 0, 1, 1,
1.381461, -0.6359907, 1.910577, 0, 0, 0, 1, 1,
1.384476, -0.2148152, 1.664394, 0, 0, 0, 1, 1,
1.397353, 0.6578974, 2.819697, 0, 0, 0, 1, 1,
1.405778, -0.2311054, 2.124517, 0, 0, 0, 1, 1,
1.406049, -1.526847, 2.351012, 0, 0, 0, 1, 1,
1.421361, -0.3065466, -0.1547747, 0, 0, 0, 1, 1,
1.422133, 0.4847215, 1.949738, 0, 0, 0, 1, 1,
1.423801, -0.363263, 2.354831, 1, 1, 1, 1, 1,
1.425681, -0.4646129, 2.279283, 1, 1, 1, 1, 1,
1.427812, -0.5287353, 2.091968, 1, 1, 1, 1, 1,
1.455411, -1.118925, 2.778676, 1, 1, 1, 1, 1,
1.460484, -0.2114726, 2.468014, 1, 1, 1, 1, 1,
1.460865, -1.143385, 1.954351, 1, 1, 1, 1, 1,
1.466689, 0.1002124, 2.347983, 1, 1, 1, 1, 1,
1.466896, -0.3892451, 0.8147963, 1, 1, 1, 1, 1,
1.470401, 0.4522655, 1.812751, 1, 1, 1, 1, 1,
1.477432, -1.130357, 0.734923, 1, 1, 1, 1, 1,
1.486806, 0.455889, 2.35663, 1, 1, 1, 1, 1,
1.500897, -0.2334834, 2.411611, 1, 1, 1, 1, 1,
1.504369, -0.456556, 0.4426248, 1, 1, 1, 1, 1,
1.522905, -0.1641402, 1.303221, 1, 1, 1, 1, 1,
1.523034, 1.936833, 1.964278, 1, 1, 1, 1, 1,
1.529047, 0.1536566, 0.8361668, 0, 0, 1, 1, 1,
1.535777, -0.8755624, 2.408993, 1, 0, 0, 1, 1,
1.538969, 0.3991072, 0.5887538, 1, 0, 0, 1, 1,
1.541689, -1.001306, 0.9558416, 1, 0, 0, 1, 1,
1.558466, -0.5184485, 3.274686, 1, 0, 0, 1, 1,
1.575258, -0.4911744, 3.148012, 1, 0, 0, 1, 1,
1.575412, -0.9025859, -0.5678586, 0, 0, 0, 1, 1,
1.577939, -1.085156, 1.751638, 0, 0, 0, 1, 1,
1.600085, 2.342812, -0.5957121, 0, 0, 0, 1, 1,
1.60848, 1.305128, 1.924584, 0, 0, 0, 1, 1,
1.617123, 0.2694962, 1.252686, 0, 0, 0, 1, 1,
1.628959, 0.690622, 1.698891, 0, 0, 0, 1, 1,
1.643257, -0.8876849, 1.797583, 0, 0, 0, 1, 1,
1.653218, -1.533827, 0.8438405, 1, 1, 1, 1, 1,
1.660496, -2.050609, 2.455281, 1, 1, 1, 1, 1,
1.664073, 0.06277011, 2.527451, 1, 1, 1, 1, 1,
1.667524, 0.9308633, 1.240647, 1, 1, 1, 1, 1,
1.669365, -1.764506, 1.536263, 1, 1, 1, 1, 1,
1.685056, 1.552669, -0.0681996, 1, 1, 1, 1, 1,
1.715354, 1.19982, 2.096671, 1, 1, 1, 1, 1,
1.756274, 0.3076554, 1.506643, 1, 1, 1, 1, 1,
1.784497, -1.155053, 1.635288, 1, 1, 1, 1, 1,
1.786376, -1.466045, 3.25328, 1, 1, 1, 1, 1,
1.789119, 1.549669, -0.9040858, 1, 1, 1, 1, 1,
1.790151, -0.4633977, 1.893489, 1, 1, 1, 1, 1,
1.793419, 0.2033143, -0.1498916, 1, 1, 1, 1, 1,
1.793519, 0.8077499, 1.739147, 1, 1, 1, 1, 1,
1.802249, -1.1941, 1.268478, 1, 1, 1, 1, 1,
1.804913, 1.39533, 2.176105, 0, 0, 1, 1, 1,
1.833653, -0.3287525, 1.011304, 1, 0, 0, 1, 1,
1.883886, -0.761156, 0.7204537, 1, 0, 0, 1, 1,
1.886369, -0.3790125, 3.065909, 1, 0, 0, 1, 1,
1.914392, 0.215163, 1.507858, 1, 0, 0, 1, 1,
1.923394, -0.7851384, 2.171861, 1, 0, 0, 1, 1,
1.926838, 0.2620983, 2.012625, 0, 0, 0, 1, 1,
1.929918, -0.8853194, 0.9900037, 0, 0, 0, 1, 1,
1.938763, -0.7128639, 0.7346603, 0, 0, 0, 1, 1,
1.962673, 1.250026, 2.137731, 0, 0, 0, 1, 1,
2.015515, 0.4925064, 0.2059488, 0, 0, 0, 1, 1,
2.025887, 1.173418, 2.562596, 0, 0, 0, 1, 1,
2.031037, -0.4323336, -0.2584288, 0, 0, 0, 1, 1,
2.054566, 0.03448934, 1.826802, 1, 1, 1, 1, 1,
2.059495, 0.7415202, 2.108256, 1, 1, 1, 1, 1,
2.065308, 0.009615802, 0.715721, 1, 1, 1, 1, 1,
2.105058, -0.07101928, 0.6363397, 1, 1, 1, 1, 1,
2.133851, 0.231356, 1.176477, 1, 1, 1, 1, 1,
2.135182, -0.1342531, 2.468309, 1, 1, 1, 1, 1,
2.13909, 0.2321683, 3.268883, 1, 1, 1, 1, 1,
2.142935, -0.2079545, 1.870487, 1, 1, 1, 1, 1,
2.148391, -1.35626, 0.2392733, 1, 1, 1, 1, 1,
2.168061, -0.8609092, 2.270615, 1, 1, 1, 1, 1,
2.191365, 0.1695203, 2.820589, 1, 1, 1, 1, 1,
2.1928, -0.5341569, 1.061765, 1, 1, 1, 1, 1,
2.193683, 0.8691998, 1.368608, 1, 1, 1, 1, 1,
2.225029, 0.2818289, 2.808706, 1, 1, 1, 1, 1,
2.23973, 0.5201621, 1.814708, 1, 1, 1, 1, 1,
2.278566, -1.297934, 1.897432, 0, 0, 1, 1, 1,
2.279752, -0.1516448, 1.400542, 1, 0, 0, 1, 1,
2.280433, -0.3126819, 1.279565, 1, 0, 0, 1, 1,
2.301907, 0.1665771, 2.39379, 1, 0, 0, 1, 1,
2.32683, -1.116063, 2.091873, 1, 0, 0, 1, 1,
2.337173, -1.052031, 1.662376, 1, 0, 0, 1, 1,
2.361567, -0.6510193, 2.549537, 0, 0, 0, 1, 1,
2.39897, 0.6515784, 1.487409, 0, 0, 0, 1, 1,
2.491616, 0.09604346, 1.527938, 0, 0, 0, 1, 1,
2.558558, 0.732103, 2.753492, 0, 0, 0, 1, 1,
2.596501, -0.7217166, 1.587714, 0, 0, 0, 1, 1,
2.625929, 0.8449069, 1.876806, 0, 0, 0, 1, 1,
2.685815, 0.5153455, 3.114983, 0, 0, 0, 1, 1,
2.710767, -0.3767168, 0.6798221, 1, 1, 1, 1, 1,
2.734734, -0.2256289, 3.57837, 1, 1, 1, 1, 1,
2.909276, -0.8732888, 2.672518, 1, 1, 1, 1, 1,
3.031785, 0.718347, 1.672566, 1, 1, 1, 1, 1,
3.343319, -0.945243, 1.65219, 1, 1, 1, 1, 1,
3.463645, 0.7450963, 2.225253, 1, 1, 1, 1, 1,
3.520525, 0.3294398, 1.371068, 1, 1, 1, 1, 1
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
var radius = 9.718868;
var distance = 34.13711;
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
mvMatrix.translate( -0.1256156, -0.09534192, 0.05164075 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.13711);
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
