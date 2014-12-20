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
-3.173369, -1.166691, -3.260432, 1, 0, 0, 1,
-2.882662, -0.2806285, -2.541955, 1, 0.007843138, 0, 1,
-2.809262, 0.07369947, -2.307913, 1, 0.01176471, 0, 1,
-2.658581, -1.11149, -1.34425, 1, 0.01960784, 0, 1,
-2.578581, -0.2711545, -1.847863, 1, 0.02352941, 0, 1,
-2.553302, 0.4294492, -2.161134, 1, 0.03137255, 0, 1,
-2.453779, -0.6782063, -2.084241, 1, 0.03529412, 0, 1,
-2.388669, -1.484165, -1.693198, 1, 0.04313726, 0, 1,
-2.362301, 0.02920474, -0.6298595, 1, 0.04705882, 0, 1,
-2.306859, -0.02006266, 0.8980777, 1, 0.05490196, 0, 1,
-2.268577, -0.8022848, -0.5026967, 1, 0.05882353, 0, 1,
-2.251485, 0.6457298, -0.06733309, 1, 0.06666667, 0, 1,
-2.209763, 1.53189, -1.506826, 1, 0.07058824, 0, 1,
-2.207741, -0.5273115, -0.1365034, 1, 0.07843138, 0, 1,
-2.113533, -0.09129695, -1.838654, 1, 0.08235294, 0, 1,
-2.110286, -0.6520889, -3.876972, 1, 0.09019608, 0, 1,
-2.107185, -0.3653034, -0.1294799, 1, 0.09411765, 0, 1,
-2.078267, -0.4386764, 1.041198, 1, 0.1019608, 0, 1,
-2.074757, 0.09381904, -0.5700833, 1, 0.1098039, 0, 1,
-2.067598, -0.4250511, -2.322203, 1, 0.1137255, 0, 1,
-2.029774, -0.03480113, -1.483378, 1, 0.1215686, 0, 1,
-2.029719, -1.599881, -1.180675, 1, 0.1254902, 0, 1,
-2.029014, 0.6931413, -1.230359, 1, 0.1333333, 0, 1,
-1.991233, -1.352837, -2.865048, 1, 0.1372549, 0, 1,
-1.988402, -0.4034121, -2.083691, 1, 0.145098, 0, 1,
-1.978453, -1.330864, -4.095562, 1, 0.1490196, 0, 1,
-1.976305, 2.348118, -1.673935, 1, 0.1568628, 0, 1,
-1.959585, -0.65103, -0.8295801, 1, 0.1607843, 0, 1,
-1.945876, 0.4420931, -1.630218, 1, 0.1686275, 0, 1,
-1.905904, -0.2592385, -1.034589, 1, 0.172549, 0, 1,
-1.87183, 0.3757406, -1.407618, 1, 0.1803922, 0, 1,
-1.868232, -0.6016232, -1.785232, 1, 0.1843137, 0, 1,
-1.864597, -1.066598, -2.947795, 1, 0.1921569, 0, 1,
-1.811383, -0.4238797, -1.719921, 1, 0.1960784, 0, 1,
-1.810217, 1.596452, -1.903586, 1, 0.2039216, 0, 1,
-1.789074, 0.6492164, -0.3769389, 1, 0.2117647, 0, 1,
-1.770325, 0.3020781, -1.934768, 1, 0.2156863, 0, 1,
-1.758665, 0.1612559, -0.3462019, 1, 0.2235294, 0, 1,
-1.748878, 0.2708609, -1.998392, 1, 0.227451, 0, 1,
-1.72739, 0.2030007, -1.477835, 1, 0.2352941, 0, 1,
-1.726544, 1.872912, -1.036179, 1, 0.2392157, 0, 1,
-1.724961, 1.371057, -1.485369, 1, 0.2470588, 0, 1,
-1.712542, -0.7366033, -3.154164, 1, 0.2509804, 0, 1,
-1.684644, 1.237357, -2.643759, 1, 0.2588235, 0, 1,
-1.672783, -0.06847654, -2.549291, 1, 0.2627451, 0, 1,
-1.667856, -0.02504781, -2.382799, 1, 0.2705882, 0, 1,
-1.6604, -0.833089, -1.251922, 1, 0.2745098, 0, 1,
-1.659375, -0.6146769, -1.737059, 1, 0.282353, 0, 1,
-1.656398, -0.4135457, -1.58875, 1, 0.2862745, 0, 1,
-1.639351, -1.309041, -2.268987, 1, 0.2941177, 0, 1,
-1.638284, -0.2410177, -2.097487, 1, 0.3019608, 0, 1,
-1.617415, 1.858867, -0.005650658, 1, 0.3058824, 0, 1,
-1.590945, 0.08397938, -0.1353965, 1, 0.3137255, 0, 1,
-1.58383, 0.8720329, -0.412613, 1, 0.3176471, 0, 1,
-1.5532, 0.5016366, 0.3833406, 1, 0.3254902, 0, 1,
-1.54598, -1.342217, -2.594332, 1, 0.3294118, 0, 1,
-1.543633, 0.8384225, -0.6992493, 1, 0.3372549, 0, 1,
-1.52412, 0.5410246, -0.7928118, 1, 0.3411765, 0, 1,
-1.513384, -0.3840269, -3.259757, 1, 0.3490196, 0, 1,
-1.5114, 0.02887482, -1.538789, 1, 0.3529412, 0, 1,
-1.50231, 0.0498706, -1.500711, 1, 0.3607843, 0, 1,
-1.490096, -0.4740322, -1.988355, 1, 0.3647059, 0, 1,
-1.48585, 0.9580855, -0.4548445, 1, 0.372549, 0, 1,
-1.48002, -2.24007, -2.076479, 1, 0.3764706, 0, 1,
-1.477678, 0.5238518, -1.492359, 1, 0.3843137, 0, 1,
-1.471563, 0.5694147, -0.4030106, 1, 0.3882353, 0, 1,
-1.469824, 0.8833431, -1.869269, 1, 0.3960784, 0, 1,
-1.464339, 0.5105441, 0.2451933, 1, 0.4039216, 0, 1,
-1.461203, 0.4390089, -1.805218, 1, 0.4078431, 0, 1,
-1.459464, 0.829082, -1.489446, 1, 0.4156863, 0, 1,
-1.455024, 1.38328, 0.5607044, 1, 0.4196078, 0, 1,
-1.451727, -0.3524929, -1.25981, 1, 0.427451, 0, 1,
-1.44883, 0.2582647, -0.6844517, 1, 0.4313726, 0, 1,
-1.442287, -1.218228, -5.143239, 1, 0.4392157, 0, 1,
-1.431651, 0.4387999, -0.4917411, 1, 0.4431373, 0, 1,
-1.430485, 1.77661, 0.2482533, 1, 0.4509804, 0, 1,
-1.429365, 0.5574254, -2.910874, 1, 0.454902, 0, 1,
-1.417116, -1.330788, -1.178697, 1, 0.4627451, 0, 1,
-1.410978, -0.8129054, -0.7980177, 1, 0.4666667, 0, 1,
-1.405445, 1.416255, -0.9998358, 1, 0.4745098, 0, 1,
-1.403565, 1.242978, -2.255385, 1, 0.4784314, 0, 1,
-1.395871, 0.0276422, -1.708297, 1, 0.4862745, 0, 1,
-1.388372, -1.409406, -3.783652, 1, 0.4901961, 0, 1,
-1.38334, -0.7113383, -2.670931, 1, 0.4980392, 0, 1,
-1.37765, -0.07552358, 0.4623428, 1, 0.5058824, 0, 1,
-1.376937, -0.4266084, -2.688576, 1, 0.509804, 0, 1,
-1.373781, 1.269271, -1.177285, 1, 0.5176471, 0, 1,
-1.361825, -2.290617, -3.11044, 1, 0.5215687, 0, 1,
-1.358803, 0.4505194, -2.317106, 1, 0.5294118, 0, 1,
-1.357864, -0.8064252, -0.7251498, 1, 0.5333334, 0, 1,
-1.355695, -0.4916513, -1.666744, 1, 0.5411765, 0, 1,
-1.345842, 0.9542574, -0.4546694, 1, 0.5450981, 0, 1,
-1.344722, 0.1854428, -1.771428, 1, 0.5529412, 0, 1,
-1.339719, -0.02648708, -2.755067, 1, 0.5568628, 0, 1,
-1.329991, 0.3947582, -0.2904518, 1, 0.5647059, 0, 1,
-1.327657, -1.442357, -2.38854, 1, 0.5686275, 0, 1,
-1.323725, -0.359289, -1.203033, 1, 0.5764706, 0, 1,
-1.316678, 0.05985671, -0.2429599, 1, 0.5803922, 0, 1,
-1.305252, 0.6315659, -1.013951, 1, 0.5882353, 0, 1,
-1.289616, 0.7202798, -2.108548, 1, 0.5921569, 0, 1,
-1.288264, -0.9689909, -1.777663, 1, 0.6, 0, 1,
-1.279938, -0.1471905, -2.531676, 1, 0.6078432, 0, 1,
-1.277969, -0.8925461, -3.629098, 1, 0.6117647, 0, 1,
-1.270949, -0.7740373, -0.2046234, 1, 0.6196079, 0, 1,
-1.268193, -1.009996, -3.610369, 1, 0.6235294, 0, 1,
-1.264352, -0.9320751, -2.062862, 1, 0.6313726, 0, 1,
-1.259128, -1.25452, -1.92238, 1, 0.6352941, 0, 1,
-1.250387, -0.9037008, -2.284074, 1, 0.6431373, 0, 1,
-1.247658, -0.1836912, -1.352339, 1, 0.6470588, 0, 1,
-1.241575, 0.03426746, -2.267735, 1, 0.654902, 0, 1,
-1.23344, 1.044472, -1.198313, 1, 0.6588235, 0, 1,
-1.225182, -0.5913489, -1.004749, 1, 0.6666667, 0, 1,
-1.223939, 0.8720568, 0.2345923, 1, 0.6705883, 0, 1,
-1.217014, 0.4531501, -1.155064, 1, 0.6784314, 0, 1,
-1.202836, -0.8046605, -3.396693, 1, 0.682353, 0, 1,
-1.177524, 1.761737, 1.051896, 1, 0.6901961, 0, 1,
-1.173221, -1.079529, -2.472771, 1, 0.6941177, 0, 1,
-1.165529, 1.392523, 1.292827, 1, 0.7019608, 0, 1,
-1.163441, -0.6019819, -3.332014, 1, 0.7098039, 0, 1,
-1.156882, -0.03612354, -2.50647, 1, 0.7137255, 0, 1,
-1.14006, 0.4865594, -1.851639, 1, 0.7215686, 0, 1,
-1.123409, -1.165645, -2.338452, 1, 0.7254902, 0, 1,
-1.122086, -0.9843095, -0.9844376, 1, 0.7333333, 0, 1,
-1.121709, 0.07586093, -2.222159, 1, 0.7372549, 0, 1,
-1.120151, 0.1697401, 0.02954169, 1, 0.7450981, 0, 1,
-1.116253, -1.225339, -3.842006, 1, 0.7490196, 0, 1,
-1.114341, 1.385115, 0.3192284, 1, 0.7568628, 0, 1,
-1.102843, 1.016183, -2.004962, 1, 0.7607843, 0, 1,
-1.092099, -0.7085171, -1.779734, 1, 0.7686275, 0, 1,
-1.080444, 0.941476, -0.4591566, 1, 0.772549, 0, 1,
-1.080049, 1.223925, -0.3394475, 1, 0.7803922, 0, 1,
-1.078563, 0.6533514, -0.6438156, 1, 0.7843137, 0, 1,
-1.072201, 0.3440235, -1.44268, 1, 0.7921569, 0, 1,
-1.071637, -0.7875714, -2.787966, 1, 0.7960784, 0, 1,
-1.068575, -0.3972546, -0.08076862, 1, 0.8039216, 0, 1,
-1.065077, 0.3242517, -0.6017101, 1, 0.8117647, 0, 1,
-1.058349, 0.7382669, -1.305319, 1, 0.8156863, 0, 1,
-1.057987, -0.7337009, -2.626151, 1, 0.8235294, 0, 1,
-1.057523, -0.01262146, -2.506537, 1, 0.827451, 0, 1,
-1.054892, 0.9887113, -0.766607, 1, 0.8352941, 0, 1,
-1.052797, -0.4384494, -3.062485, 1, 0.8392157, 0, 1,
-1.050488, -2.243931, -2.606019, 1, 0.8470588, 0, 1,
-1.04778, -0.3373775, -1.65647, 1, 0.8509804, 0, 1,
-1.045726, -0.6801165, -2.800433, 1, 0.8588235, 0, 1,
-1.043327, -1.392998, -3.861739, 1, 0.8627451, 0, 1,
-1.042719, 1.532853, -0.4678613, 1, 0.8705882, 0, 1,
-1.040236, -0.1004025, -1.289871, 1, 0.8745098, 0, 1,
-1.038666, 0.7466329, 0.6977737, 1, 0.8823529, 0, 1,
-1.037394, 0.0259496, -1.929863, 1, 0.8862745, 0, 1,
-1.035764, 1.995304, -1.138702, 1, 0.8941177, 0, 1,
-1.035329, 1.012743, -0.7208171, 1, 0.8980392, 0, 1,
-1.021061, -1.461216, -2.442068, 1, 0.9058824, 0, 1,
-1.00572, -1.139854, -2.078347, 1, 0.9137255, 0, 1,
-1.001336, -0.5132886, -1.003887, 1, 0.9176471, 0, 1,
-0.9972, -1.471387, -1.513685, 1, 0.9254902, 0, 1,
-0.9955989, 0.05996655, -2.372502, 1, 0.9294118, 0, 1,
-0.994752, -1.124507, -1.563151, 1, 0.9372549, 0, 1,
-0.9946126, 0.1485723, -1.598963, 1, 0.9411765, 0, 1,
-0.9943289, 0.8686793, 0.7631023, 1, 0.9490196, 0, 1,
-0.9863756, 0.2752207, -0.02834227, 1, 0.9529412, 0, 1,
-0.9847863, 0.3321209, -1.669372, 1, 0.9607843, 0, 1,
-0.9828613, -1.688481, -1.264097, 1, 0.9647059, 0, 1,
-0.9826648, 0.1804922, -1.31623, 1, 0.972549, 0, 1,
-0.9796144, 0.4853129, -0.3273395, 1, 0.9764706, 0, 1,
-0.9701069, -0.07639171, -1.185101, 1, 0.9843137, 0, 1,
-0.9686888, -0.3692577, -2.032846, 1, 0.9882353, 0, 1,
-0.967531, -0.2565323, -2.281681, 1, 0.9960784, 0, 1,
-0.9604079, 0.5811438, -1.932696, 0.9960784, 1, 0, 1,
-0.9577335, 0.06410976, -0.6276736, 0.9921569, 1, 0, 1,
-0.9548529, 1.244111, -1.676682, 0.9843137, 1, 0, 1,
-0.946311, 1.101898, -2.728725, 0.9803922, 1, 0, 1,
-0.9455602, -0.7964739, -2.725075, 0.972549, 1, 0, 1,
-0.9448727, 1.443721, -1.4785, 0.9686275, 1, 0, 1,
-0.9355276, 2.630379, -1.685227, 0.9607843, 1, 0, 1,
-0.9341751, -0.9926527, -1.642772, 0.9568627, 1, 0, 1,
-0.9337221, 1.149132, -0.636189, 0.9490196, 1, 0, 1,
-0.9319609, 1.029578, -2.189163, 0.945098, 1, 0, 1,
-0.9307852, -2.356915, -3.182237, 0.9372549, 1, 0, 1,
-0.9229628, -1.356513, -3.010553, 0.9333333, 1, 0, 1,
-0.9201174, -0.9663661, -2.693068, 0.9254902, 1, 0, 1,
-0.9175625, -0.2792733, -3.36341, 0.9215686, 1, 0, 1,
-0.9151071, 0.07976566, -3.574051, 0.9137255, 1, 0, 1,
-0.9137393, 0.3538923, -2.440923, 0.9098039, 1, 0, 1,
-0.9059383, 0.06944069, -1.891041, 0.9019608, 1, 0, 1,
-0.8977728, 2.13214, -0.4114963, 0.8941177, 1, 0, 1,
-0.8974307, -0.3146927, 0.07971988, 0.8901961, 1, 0, 1,
-0.8873091, -1.218689, -2.271476, 0.8823529, 1, 0, 1,
-0.885551, 2.454205, 0.1056773, 0.8784314, 1, 0, 1,
-0.8851075, 1.292005, -0.4383804, 0.8705882, 1, 0, 1,
-0.8843983, 0.3730107, -1.439796, 0.8666667, 1, 0, 1,
-0.8753681, -0.6962426, -3.470767, 0.8588235, 1, 0, 1,
-0.8713372, 0.4770574, -1.078652, 0.854902, 1, 0, 1,
-0.8597552, -0.6683627, -3.024926, 0.8470588, 1, 0, 1,
-0.8593673, -0.6362017, -2.077872, 0.8431373, 1, 0, 1,
-0.8435751, 0.3877739, -0.8158054, 0.8352941, 1, 0, 1,
-0.8408836, -1.522983, -3.548619, 0.8313726, 1, 0, 1,
-0.8391216, 0.4032118, -0.7516879, 0.8235294, 1, 0, 1,
-0.8338606, 0.9202677, -1.088813, 0.8196079, 1, 0, 1,
-0.8329733, -0.285905, -1.689904, 0.8117647, 1, 0, 1,
-0.8309889, 1.77925, -0.6816532, 0.8078431, 1, 0, 1,
-0.8301578, 0.5980471, -2.946416, 0.8, 1, 0, 1,
-0.8244004, 0.9124482, -0.5512173, 0.7921569, 1, 0, 1,
-0.8197358, -1.651512, -1.406524, 0.7882353, 1, 0, 1,
-0.8184592, 0.138351, -1.809752, 0.7803922, 1, 0, 1,
-0.8181183, 0.8195233, -2.289586, 0.7764706, 1, 0, 1,
-0.8159596, -0.8412914, -1.858233, 0.7686275, 1, 0, 1,
-0.8135918, -1.436626, -2.550819, 0.7647059, 1, 0, 1,
-0.8124279, 0.2143366, -1.962147, 0.7568628, 1, 0, 1,
-0.8120919, 0.09147817, 1.394661, 0.7529412, 1, 0, 1,
-0.8074938, -0.875347, -2.901467, 0.7450981, 1, 0, 1,
-0.7980985, 0.3524568, -2.046452, 0.7411765, 1, 0, 1,
-0.7879059, -1.594971, -2.594594, 0.7333333, 1, 0, 1,
-0.7867438, 0.1168564, -1.13988, 0.7294118, 1, 0, 1,
-0.7739742, 0.1932046, -1.931635, 0.7215686, 1, 0, 1,
-0.764784, -1.154463, -2.460372, 0.7176471, 1, 0, 1,
-0.7574716, -0.1058756, -0.8283913, 0.7098039, 1, 0, 1,
-0.7528263, -0.7325536, -1.817885, 0.7058824, 1, 0, 1,
-0.7469299, 0.6705045, -1.575874, 0.6980392, 1, 0, 1,
-0.7454478, 0.1227826, -2.592453, 0.6901961, 1, 0, 1,
-0.7453108, -1.519594, -3.149082, 0.6862745, 1, 0, 1,
-0.7420279, 0.3305043, -1.043608, 0.6784314, 1, 0, 1,
-0.7366911, -0.1142828, -2.716231, 0.6745098, 1, 0, 1,
-0.7287261, 0.9942685, 0.4457433, 0.6666667, 1, 0, 1,
-0.7258773, -0.3029001, -2.851226, 0.6627451, 1, 0, 1,
-0.7255948, 0.286419, -0.5320984, 0.654902, 1, 0, 1,
-0.7161577, 0.7798442, -1.262601, 0.6509804, 1, 0, 1,
-0.7131873, -1.116428, -2.185545, 0.6431373, 1, 0, 1,
-0.7127439, 0.3927601, -1.244181, 0.6392157, 1, 0, 1,
-0.7122898, 0.2482086, -0.293163, 0.6313726, 1, 0, 1,
-0.7102726, 0.6506476, -1.739618, 0.627451, 1, 0, 1,
-0.7008724, -0.5793572, -2.373683, 0.6196079, 1, 0, 1,
-0.698327, -0.7785262, -1.458441, 0.6156863, 1, 0, 1,
-0.69385, 0.5390161, -0.5323551, 0.6078432, 1, 0, 1,
-0.6938101, -0.3045172, -2.797148, 0.6039216, 1, 0, 1,
-0.6933925, -0.6727296, -0.5667396, 0.5960785, 1, 0, 1,
-0.6883221, 1.122272, -1.638831, 0.5882353, 1, 0, 1,
-0.6859474, -0.8563054, -0.9940922, 0.5843138, 1, 0, 1,
-0.6698636, -0.5719105, -3.497514, 0.5764706, 1, 0, 1,
-0.668866, 0.01819691, -2.188035, 0.572549, 1, 0, 1,
-0.6667351, 0.6769177, 0.2430003, 0.5647059, 1, 0, 1,
-0.6615333, -0.4665326, -1.858706, 0.5607843, 1, 0, 1,
-0.6614251, 1.45829, -0.370833, 0.5529412, 1, 0, 1,
-0.6495134, -0.1355375, -1.141535, 0.5490196, 1, 0, 1,
-0.6475084, -1.123615, -4.523481, 0.5411765, 1, 0, 1,
-0.6453989, 1.468671, 0.6106155, 0.5372549, 1, 0, 1,
-0.6370122, -0.002638029, -1.133034, 0.5294118, 1, 0, 1,
-0.6363469, 0.2151411, -1.225373, 0.5254902, 1, 0, 1,
-0.6345255, 0.3306946, -1.034373, 0.5176471, 1, 0, 1,
-0.6300152, 0.6403829, -1.676905, 0.5137255, 1, 0, 1,
-0.6269974, 0.4893305, -0.8866348, 0.5058824, 1, 0, 1,
-0.6253763, 0.04027469, -2.329196, 0.5019608, 1, 0, 1,
-0.6229832, -0.2023602, -2.33982, 0.4941176, 1, 0, 1,
-0.6222125, 0.5274358, -0.2854577, 0.4862745, 1, 0, 1,
-0.6187244, -0.3999406, -2.386674, 0.4823529, 1, 0, 1,
-0.6184019, -1.047271, -0.5452025, 0.4745098, 1, 0, 1,
-0.6163331, 0.4432072, 0.2462048, 0.4705882, 1, 0, 1,
-0.6051267, 0.2749411, -0.8039777, 0.4627451, 1, 0, 1,
-0.6047633, -1.29551, -1.187906, 0.4588235, 1, 0, 1,
-0.6003218, 1.215279, -1.105784, 0.4509804, 1, 0, 1,
-0.5973075, -0.4232769, -0.5863426, 0.4470588, 1, 0, 1,
-0.5970846, -1.151261, -2.528382, 0.4392157, 1, 0, 1,
-0.5950724, 2.561455, -0.5771031, 0.4352941, 1, 0, 1,
-0.5938803, -0.4686944, -2.100697, 0.427451, 1, 0, 1,
-0.5913183, 0.8605336, -0.382252, 0.4235294, 1, 0, 1,
-0.5891547, 0.4690159, -1.709293, 0.4156863, 1, 0, 1,
-0.5867803, 0.3414513, -0.7977141, 0.4117647, 1, 0, 1,
-0.5854381, 0.9459088, -0.2138058, 0.4039216, 1, 0, 1,
-0.5820687, -2.088672, -3.813104, 0.3960784, 1, 0, 1,
-0.57704, -0.8531346, -4.279781, 0.3921569, 1, 0, 1,
-0.5770298, 0.06159126, -1.040282, 0.3843137, 1, 0, 1,
-0.5745857, -0.6874423, -2.363372, 0.3803922, 1, 0, 1,
-0.5731935, -0.007747207, -3.106594, 0.372549, 1, 0, 1,
-0.5726162, -0.8368948, -2.486981, 0.3686275, 1, 0, 1,
-0.5704074, 1.567444, -1.090413, 0.3607843, 1, 0, 1,
-0.568282, 0.3588576, -0.7560046, 0.3568628, 1, 0, 1,
-0.5635228, 0.2543733, -1.877032, 0.3490196, 1, 0, 1,
-0.5566248, 2.07196, -1.230417, 0.345098, 1, 0, 1,
-0.5554057, 0.7270867, 0.1016139, 0.3372549, 1, 0, 1,
-0.5547164, 0.8850408, -0.6747499, 0.3333333, 1, 0, 1,
-0.5469843, -0.6216904, -2.575493, 0.3254902, 1, 0, 1,
-0.5467384, 1.374209, -0.3597182, 0.3215686, 1, 0, 1,
-0.5452158, -0.09478981, -1.955394, 0.3137255, 1, 0, 1,
-0.5347972, 1.031658, 0.09877469, 0.3098039, 1, 0, 1,
-0.5237374, 0.4697663, -0.3257349, 0.3019608, 1, 0, 1,
-0.5197313, -0.7526762, -1.583881, 0.2941177, 1, 0, 1,
-0.514105, 0.6076039, -0.5448555, 0.2901961, 1, 0, 1,
-0.5123928, -0.08478753, -1.055905, 0.282353, 1, 0, 1,
-0.5108021, 0.6768166, 0.3182737, 0.2784314, 1, 0, 1,
-0.5105896, 0.484739, -0.4628264, 0.2705882, 1, 0, 1,
-0.5071399, -2.724688, -2.429848, 0.2666667, 1, 0, 1,
-0.4988649, 0.1647525, -1.587373, 0.2588235, 1, 0, 1,
-0.4969025, -0.4665482, -2.73817, 0.254902, 1, 0, 1,
-0.4937662, 2.071066, 1.42561, 0.2470588, 1, 0, 1,
-0.4882695, -0.6234981, -0.9990475, 0.2431373, 1, 0, 1,
-0.4880819, -0.6010395, -1.453969, 0.2352941, 1, 0, 1,
-0.4880711, 0.8398209, 0.7297006, 0.2313726, 1, 0, 1,
-0.4819674, -0.4452979, -3.426465, 0.2235294, 1, 0, 1,
-0.4782935, 0.6869349, -0.9934295, 0.2196078, 1, 0, 1,
-0.4753444, 0.6200776, -1.026448, 0.2117647, 1, 0, 1,
-0.4738497, -0.02300675, -2.491501, 0.2078431, 1, 0, 1,
-0.4706492, 0.8746509, 0.01802959, 0.2, 1, 0, 1,
-0.4705898, 0.6036955, -2.018808, 0.1921569, 1, 0, 1,
-0.4661379, -1.133107, -2.222541, 0.1882353, 1, 0, 1,
-0.4644563, 0.7900417, 0.1815906, 0.1803922, 1, 0, 1,
-0.4620228, -1.166657, -1.091095, 0.1764706, 1, 0, 1,
-0.4572106, -1.131261, -2.329884, 0.1686275, 1, 0, 1,
-0.4527917, -1.270584, -4.675427, 0.1647059, 1, 0, 1,
-0.451535, -0.6869828, -1.368832, 0.1568628, 1, 0, 1,
-0.4505459, -1.585077, -1.269508, 0.1529412, 1, 0, 1,
-0.4476782, 0.834892, 0.5822629, 0.145098, 1, 0, 1,
-0.4466073, -1.678088, -3.798849, 0.1411765, 1, 0, 1,
-0.4424924, -0.9440446, -2.396695, 0.1333333, 1, 0, 1,
-0.4366064, -1.508966, -4.33757, 0.1294118, 1, 0, 1,
-0.4355264, -1.081194, -2.859311, 0.1215686, 1, 0, 1,
-0.4351986, 0.3956699, -0.8913472, 0.1176471, 1, 0, 1,
-0.433331, 1.017081, -1.020751, 0.1098039, 1, 0, 1,
-0.4327369, 0.07325828, -1.426237, 0.1058824, 1, 0, 1,
-0.432225, 0.1391816, -0.7970728, 0.09803922, 1, 0, 1,
-0.4243244, 0.5315595, -3.460972, 0.09019608, 1, 0, 1,
-0.415794, 0.833129, 0.5506631, 0.08627451, 1, 0, 1,
-0.4091914, 0.1621835, -3.328109, 0.07843138, 1, 0, 1,
-0.4088146, 1.248231, -0.4819716, 0.07450981, 1, 0, 1,
-0.4073398, -1.300672, 0.5829464, 0.06666667, 1, 0, 1,
-0.3985682, 0.8996107, 0.3107747, 0.0627451, 1, 0, 1,
-0.3978891, 1.540622, -2.685406, 0.05490196, 1, 0, 1,
-0.3978096, -0.08366681, -2.704705, 0.05098039, 1, 0, 1,
-0.3846832, -0.5264993, -3.031535, 0.04313726, 1, 0, 1,
-0.384294, -0.70002, -3.308838, 0.03921569, 1, 0, 1,
-0.3821593, 0.5467516, 0.6777897, 0.03137255, 1, 0, 1,
-0.381759, -0.6897608, -2.218165, 0.02745098, 1, 0, 1,
-0.3810073, -0.30324, -2.825769, 0.01960784, 1, 0, 1,
-0.3802173, -0.8582352, -3.131491, 0.01568628, 1, 0, 1,
-0.37973, 0.65412, -2.422753, 0.007843138, 1, 0, 1,
-0.3752186, -0.5608193, -1.727673, 0.003921569, 1, 0, 1,
-0.3750961, 0.1708112, 0.6095371, 0, 1, 0.003921569, 1,
-0.3727207, 2.260294, -0.7508991, 0, 1, 0.01176471, 1,
-0.3695258, 0.9159021, 0.2047852, 0, 1, 0.01568628, 1,
-0.3691157, 1.499984, 0.9986797, 0, 1, 0.02352941, 1,
-0.3598482, -0.8735635, -3.500299, 0, 1, 0.02745098, 1,
-0.3584805, -0.04321673, -1.138817, 0, 1, 0.03529412, 1,
-0.3545389, -0.2688141, -3.041937, 0, 1, 0.03921569, 1,
-0.3536642, -0.7013432, -2.882212, 0, 1, 0.04705882, 1,
-0.3535588, 1.190124, -0.5093982, 0, 1, 0.05098039, 1,
-0.3520075, 0.3293322, -0.3862024, 0, 1, 0.05882353, 1,
-0.3482187, 0.8103158, -1.318008, 0, 1, 0.0627451, 1,
-0.3473706, -0.3288863, -5.475866, 0, 1, 0.07058824, 1,
-0.3466069, 0.09660716, -0.06746752, 0, 1, 0.07450981, 1,
-0.3457147, 0.4079146, -1.771349, 0, 1, 0.08235294, 1,
-0.3406799, 1.543038, -0.09258601, 0, 1, 0.08627451, 1,
-0.3361676, 0.7355872, -0.5029682, 0, 1, 0.09411765, 1,
-0.3356723, 0.0818515, -0.751151, 0, 1, 0.1019608, 1,
-0.3331935, -0.8682886, -4.144894, 0, 1, 0.1058824, 1,
-0.3323978, -0.2059811, -3.294402, 0, 1, 0.1137255, 1,
-0.331978, 0.2982751, -1.864477, 0, 1, 0.1176471, 1,
-0.329439, 0.5232618, -0.4978999, 0, 1, 0.1254902, 1,
-0.3294037, -0.7020687, -1.642224, 0, 1, 0.1294118, 1,
-0.32823, -0.3512208, -3.474915, 0, 1, 0.1372549, 1,
-0.3254146, 1.159531, -0.5077298, 0, 1, 0.1411765, 1,
-0.3219585, -0.7056902, -4.597678, 0, 1, 0.1490196, 1,
-0.3163618, 0.5243918, -0.31307, 0, 1, 0.1529412, 1,
-0.3157314, -0.5112602, -2.636984, 0, 1, 0.1607843, 1,
-0.3156599, -1.244866, -2.969407, 0, 1, 0.1647059, 1,
-0.3150913, 1.684009, 0.09081951, 0, 1, 0.172549, 1,
-0.311309, -1.135221, -2.186676, 0, 1, 0.1764706, 1,
-0.3087935, -0.1807846, -0.9395536, 0, 1, 0.1843137, 1,
-0.3082429, -0.2085075, -2.150586, 0, 1, 0.1882353, 1,
-0.3076071, -1.476362, -2.914921, 0, 1, 0.1960784, 1,
-0.307263, -0.01097017, -0.8912754, 0, 1, 0.2039216, 1,
-0.3039655, 0.5796946, -1.744435, 0, 1, 0.2078431, 1,
-0.3006113, 1.563058, -0.5603549, 0, 1, 0.2156863, 1,
-0.2991363, 0.2532804, -0.6721749, 0, 1, 0.2196078, 1,
-0.2937807, 0.5556799, -0.8630012, 0, 1, 0.227451, 1,
-0.2928694, 0.4930593, -0.799469, 0, 1, 0.2313726, 1,
-0.2875878, -0.09715585, -3.454612, 0, 1, 0.2392157, 1,
-0.2869106, 1.866832, -0.9213224, 0, 1, 0.2431373, 1,
-0.2831278, 0.8934881, -0.8473176, 0, 1, 0.2509804, 1,
-0.2828481, -0.8633, -3.096468, 0, 1, 0.254902, 1,
-0.2820167, -0.8820968, -3.589869, 0, 1, 0.2627451, 1,
-0.280446, -1.838559, -3.005965, 0, 1, 0.2666667, 1,
-0.2771073, -0.4957404, -2.630692, 0, 1, 0.2745098, 1,
-0.2753038, -1.209796, -4.096961, 0, 1, 0.2784314, 1,
-0.271781, -0.3540353, -3.786551, 0, 1, 0.2862745, 1,
-0.2691231, -0.1126199, -3.594445, 0, 1, 0.2901961, 1,
-0.2673797, 1.043199, -2.055654, 0, 1, 0.2980392, 1,
-0.2672951, 1.296612, -0.348602, 0, 1, 0.3058824, 1,
-0.2635637, -0.7840167, -1.211426, 0, 1, 0.3098039, 1,
-0.2624602, -0.819923, -2.249936, 0, 1, 0.3176471, 1,
-0.2613352, -0.9745654, -2.398793, 0, 1, 0.3215686, 1,
-0.2583319, 0.3687629, -2.142915, 0, 1, 0.3294118, 1,
-0.2544118, 1.114397, 0.06942222, 0, 1, 0.3333333, 1,
-0.2531589, -0.110205, -2.619311, 0, 1, 0.3411765, 1,
-0.2528053, 0.3283509, -0.9524176, 0, 1, 0.345098, 1,
-0.2474736, -1.389995, -4.917722, 0, 1, 0.3529412, 1,
-0.2394572, 0.3612902, -1.132954, 0, 1, 0.3568628, 1,
-0.2381683, 2.023324, 0.5099503, 0, 1, 0.3647059, 1,
-0.237239, 0.489329, -0.4034443, 0, 1, 0.3686275, 1,
-0.2291416, -0.5574843, -3.333491, 0, 1, 0.3764706, 1,
-0.2276329, -0.8508072, -2.732126, 0, 1, 0.3803922, 1,
-0.2274537, 0.6272473, -0.6724778, 0, 1, 0.3882353, 1,
-0.2218342, -0.1251304, -2.479569, 0, 1, 0.3921569, 1,
-0.2203694, -0.2415082, -0.9311721, 0, 1, 0.4, 1,
-0.2201121, -0.5571567, -2.876287, 0, 1, 0.4078431, 1,
-0.2195851, 0.5825179, -0.7462372, 0, 1, 0.4117647, 1,
-0.2170235, 0.2381693, 0.4524187, 0, 1, 0.4196078, 1,
-0.2144871, 0.01648339, 0.2928757, 0, 1, 0.4235294, 1,
-0.2139488, 1.010422, -0.987155, 0, 1, 0.4313726, 1,
-0.2123399, -0.8768609, -2.484424, 0, 1, 0.4352941, 1,
-0.2082255, 0.6437609, -1.825952, 0, 1, 0.4431373, 1,
-0.2058441, -0.5154713, -0.7604939, 0, 1, 0.4470588, 1,
-0.2051122, 0.1177712, -2.023468, 0, 1, 0.454902, 1,
-0.2039045, 0.9860516, -0.2255059, 0, 1, 0.4588235, 1,
-0.2014835, -0.3212806, -3.698534, 0, 1, 0.4666667, 1,
-0.1969478, -1.768151, -4.286849, 0, 1, 0.4705882, 1,
-0.1955587, -0.7602088, -3.177897, 0, 1, 0.4784314, 1,
-0.1923332, -1.949037, -2.553901, 0, 1, 0.4823529, 1,
-0.1922103, -0.793263, -2.596682, 0, 1, 0.4901961, 1,
-0.191088, 0.7529301, -0.7626358, 0, 1, 0.4941176, 1,
-0.1878646, -0.6682867, -2.494324, 0, 1, 0.5019608, 1,
-0.1788734, -1.426995, -4.109431, 0, 1, 0.509804, 1,
-0.1785646, -0.6049096, -3.63773, 0, 1, 0.5137255, 1,
-0.1775298, 0.2590759, -0.2624252, 0, 1, 0.5215687, 1,
-0.1770866, -0.513931, -2.014431, 0, 1, 0.5254902, 1,
-0.1753644, -1.071122, -2.090816, 0, 1, 0.5333334, 1,
-0.1749187, 2.027421, 0.1765455, 0, 1, 0.5372549, 1,
-0.1731942, -1.316747, -1.957763, 0, 1, 0.5450981, 1,
-0.1694243, 0.02746958, -2.902309, 0, 1, 0.5490196, 1,
-0.1656764, -1.333139, -3.098096, 0, 1, 0.5568628, 1,
-0.1652325, 0.2910108, -0.6394417, 0, 1, 0.5607843, 1,
-0.1639893, -1.17822, -3.568956, 0, 1, 0.5686275, 1,
-0.1633255, 0.3055481, 0.7202144, 0, 1, 0.572549, 1,
-0.1633197, -0.1184526, -1.06694, 0, 1, 0.5803922, 1,
-0.1611383, -0.2280858, -1.719548, 0, 1, 0.5843138, 1,
-0.1605136, -0.5237173, -2.406725, 0, 1, 0.5921569, 1,
-0.1603931, -1.361287, -2.315749, 0, 1, 0.5960785, 1,
-0.157891, -0.4729608, -3.37519, 0, 1, 0.6039216, 1,
-0.150735, -0.8527889, -1.597386, 0, 1, 0.6117647, 1,
-0.1497949, -0.1731759, -0.06525638, 0, 1, 0.6156863, 1,
-0.1472721, 0.4333565, 0.7976068, 0, 1, 0.6235294, 1,
-0.1470318, -0.7843964, -3.603904, 0, 1, 0.627451, 1,
-0.146327, -0.1444457, -2.165157, 0, 1, 0.6352941, 1,
-0.1460011, 0.3822423, -1.13088, 0, 1, 0.6392157, 1,
-0.1457816, -1.236945, -4.015996, 0, 1, 0.6470588, 1,
-0.1454542, -0.8110288, -3.824711, 0, 1, 0.6509804, 1,
-0.1404795, 0.6555821, 0.8733139, 0, 1, 0.6588235, 1,
-0.1396811, 0.1628178, -0.2188695, 0, 1, 0.6627451, 1,
-0.1393823, -1.463336, -3.734374, 0, 1, 0.6705883, 1,
-0.136109, -0.4992683, -1.782156, 0, 1, 0.6745098, 1,
-0.1338229, -0.3769419, -3.449689, 0, 1, 0.682353, 1,
-0.1289799, -0.2341086, -3.837998, 0, 1, 0.6862745, 1,
-0.1267583, 1.304151, 0.112394, 0, 1, 0.6941177, 1,
-0.1204984, 0.06097046, -0.4321311, 0, 1, 0.7019608, 1,
-0.1173771, 1.683553, 1.453319, 0, 1, 0.7058824, 1,
-0.1121976, -0.8581507, -2.789939, 0, 1, 0.7137255, 1,
-0.110112, 1.704292, 1.95873, 0, 1, 0.7176471, 1,
-0.1098054, -0.8435383, -3.404817, 0, 1, 0.7254902, 1,
-0.1023358, -0.9622192, -2.709817, 0, 1, 0.7294118, 1,
-0.1006365, -1.220563, -3.788739, 0, 1, 0.7372549, 1,
-0.1002359, 0.7278022, -0.1353054, 0, 1, 0.7411765, 1,
-0.09790835, 1.273268, -0.5055073, 0, 1, 0.7490196, 1,
-0.09278686, -0.1812426, -3.254748, 0, 1, 0.7529412, 1,
-0.08615532, 0.72375, -0.5271111, 0, 1, 0.7607843, 1,
-0.08548087, 1.289145, -0.5314177, 0, 1, 0.7647059, 1,
-0.08472411, -0.1492036, -3.2656, 0, 1, 0.772549, 1,
-0.08417761, -0.7995258, -2.582881, 0, 1, 0.7764706, 1,
-0.08171935, -0.04330987, -1.606755, 0, 1, 0.7843137, 1,
-0.07923462, -0.311748, -2.624318, 0, 1, 0.7882353, 1,
-0.07671813, -1.123558, -4.786349, 0, 1, 0.7960784, 1,
-0.07242323, -0.9113307, -3.359161, 0, 1, 0.8039216, 1,
-0.06993806, 0.3199795, -0.3148669, 0, 1, 0.8078431, 1,
-0.06753774, -1.619279, -3.39967, 0, 1, 0.8156863, 1,
-0.0653141, 0.8429599, -1.333644, 0, 1, 0.8196079, 1,
-0.05999923, 1.346698, -0.2937187, 0, 1, 0.827451, 1,
-0.05667971, 1.135319, 0.4827327, 0, 1, 0.8313726, 1,
-0.0555242, -0.6718076, -3.076208, 0, 1, 0.8392157, 1,
-0.05408157, 0.7020546, -0.7851702, 0, 1, 0.8431373, 1,
-0.05311582, 0.539319, -0.9364069, 0, 1, 0.8509804, 1,
-0.05129956, 0.6067885, 0.6755793, 0, 1, 0.854902, 1,
-0.05106304, 0.72639, 0.03232738, 0, 1, 0.8627451, 1,
-0.0465394, 0.4818742, -0.3637007, 0, 1, 0.8666667, 1,
-0.04498406, -0.4598093, -3.407096, 0, 1, 0.8745098, 1,
-0.0447123, -2.600622, -2.808023, 0, 1, 0.8784314, 1,
-0.04403057, -1.134145, -3.411613, 0, 1, 0.8862745, 1,
-0.04019981, 0.3481444, 1.177233, 0, 1, 0.8901961, 1,
-0.03578322, 0.1998637, -0.2658596, 0, 1, 0.8980392, 1,
-0.0345975, 0.6396976, -1.353195, 0, 1, 0.9058824, 1,
-0.03252117, 0.687934, -0.6458956, 0, 1, 0.9098039, 1,
-0.03239286, 0.760407, 0.4712301, 0, 1, 0.9176471, 1,
-0.03209529, -1.003223, -2.936891, 0, 1, 0.9215686, 1,
-0.02681819, -0.5211299, -3.586661, 0, 1, 0.9294118, 1,
-0.02133802, -0.2172997, -2.977489, 0, 1, 0.9333333, 1,
-0.01445533, 1.085475, 0.5445383, 0, 1, 0.9411765, 1,
-0.0105109, 0.7720233, 0.05715714, 0, 1, 0.945098, 1,
-0.008882185, -0.04971964, -2.395582, 0, 1, 0.9529412, 1,
-0.005367459, 0.3215903, 0.1602239, 0, 1, 0.9568627, 1,
-0.002500782, 2.188548, 0.5189148, 0, 1, 0.9647059, 1,
0.001611576, -1.835262, 3.507991, 0, 1, 0.9686275, 1,
0.006623773, 2.415887, 0.7165598, 0, 1, 0.9764706, 1,
0.007379766, -0.6446176, 4.35194, 0, 1, 0.9803922, 1,
0.00947495, -0.3764748, 3.953613, 0, 1, 0.9882353, 1,
0.01316356, 1.501721, -0.8652329, 0, 1, 0.9921569, 1,
0.01329106, -1.259544, 3.567422, 0, 1, 1, 1,
0.01424592, -0.4685386, 1.577465, 0, 0.9921569, 1, 1,
0.01496208, 0.5318719, 2.042395, 0, 0.9882353, 1, 1,
0.01887609, -0.637844, 4.776215, 0, 0.9803922, 1, 1,
0.02588221, -0.06854463, 2.965144, 0, 0.9764706, 1, 1,
0.02628146, 0.4320511, 0.1764364, 0, 0.9686275, 1, 1,
0.02676238, 1.184157, -1.193445, 0, 0.9647059, 1, 1,
0.03661017, 0.2701913, -0.3637763, 0, 0.9568627, 1, 1,
0.03749835, 0.8561396, -1.098237, 0, 0.9529412, 1, 1,
0.03979958, -0.242565, 2.879031, 0, 0.945098, 1, 1,
0.04012906, -0.9279386, 2.22727, 0, 0.9411765, 1, 1,
0.04089175, -1.969523, 3.065376, 0, 0.9333333, 1, 1,
0.0428108, 1.604255, 1.102058, 0, 0.9294118, 1, 1,
0.04824062, -0.4161839, 2.896168, 0, 0.9215686, 1, 1,
0.04985075, -1.247598, 2.727826, 0, 0.9176471, 1, 1,
0.05557353, -1.424867, 2.937733, 0, 0.9098039, 1, 1,
0.05710807, 1.240893, -0.1934552, 0, 0.9058824, 1, 1,
0.06270347, 0.1790687, -0.1851291, 0, 0.8980392, 1, 1,
0.06328449, -3.156153, 3.362768, 0, 0.8901961, 1, 1,
0.06540059, 0.1767503, 1.130752, 0, 0.8862745, 1, 1,
0.07595591, -0.1573662, 0.9944683, 0, 0.8784314, 1, 1,
0.08151863, 1.486635, -0.17171, 0, 0.8745098, 1, 1,
0.08240601, 0.08259942, -0.4497315, 0, 0.8666667, 1, 1,
0.08275425, 0.502845, 0.6241493, 0, 0.8627451, 1, 1,
0.08998053, -0.324795, 3.933973, 0, 0.854902, 1, 1,
0.09002972, 0.5678028, 0.09622507, 0, 0.8509804, 1, 1,
0.099682, 0.8394709, 1.545587, 0, 0.8431373, 1, 1,
0.1037899, -0.2181778, 1.434529, 0, 0.8392157, 1, 1,
0.1072567, 0.02948992, 0.55998, 0, 0.8313726, 1, 1,
0.1074557, -0.2866934, 3.21116, 0, 0.827451, 1, 1,
0.1077532, -1.004378, 3.761483, 0, 0.8196079, 1, 1,
0.1084236, 2.032531, 0.7457248, 0, 0.8156863, 1, 1,
0.113377, 1.650912, 1.203356, 0, 0.8078431, 1, 1,
0.1202959, 1.423746, 0.005075575, 0, 0.8039216, 1, 1,
0.1261009, -1.470275, 2.589702, 0, 0.7960784, 1, 1,
0.1270468, -0.3197668, 3.650617, 0, 0.7882353, 1, 1,
0.1279066, 0.1104076, 2.217689, 0, 0.7843137, 1, 1,
0.1311704, -1.295504, 4.144959, 0, 0.7764706, 1, 1,
0.133688, -0.9762797, 4.227916, 0, 0.772549, 1, 1,
0.1362627, -1.243609, 2.211619, 0, 0.7647059, 1, 1,
0.1370754, 0.1999041, 1.425814, 0, 0.7607843, 1, 1,
0.1379425, 1.061731, 0.1456614, 0, 0.7529412, 1, 1,
0.1406866, 0.9606718, -0.9303177, 0, 0.7490196, 1, 1,
0.1411931, 0.1621331, 1.768518, 0, 0.7411765, 1, 1,
0.1432216, -1.703967, 2.608144, 0, 0.7372549, 1, 1,
0.1442462, 0.7436171, 0.614712, 0, 0.7294118, 1, 1,
0.1452889, -1.847383, 3.44455, 0, 0.7254902, 1, 1,
0.1467032, -2.344873, 0.8323749, 0, 0.7176471, 1, 1,
0.1527501, -1.193611, 3.714536, 0, 0.7137255, 1, 1,
0.1542564, -1.592323, 3.603517, 0, 0.7058824, 1, 1,
0.1584938, -0.2454743, -0.09934568, 0, 0.6980392, 1, 1,
0.1622749, -0.03789894, 1.293135, 0, 0.6941177, 1, 1,
0.1706791, 0.4298678, 0.6622745, 0, 0.6862745, 1, 1,
0.1720595, 0.8180185, -1.894134, 0, 0.682353, 1, 1,
0.172619, 1.102599, 0.5647715, 0, 0.6745098, 1, 1,
0.1733022, 0.3251046, 0.7632066, 0, 0.6705883, 1, 1,
0.1733562, -0.2008274, 2.945497, 0, 0.6627451, 1, 1,
0.1739074, 0.3514456, -0.3074003, 0, 0.6588235, 1, 1,
0.1747049, 0.1345544, 1.784604, 0, 0.6509804, 1, 1,
0.1799718, -0.3405996, 1.209513, 0, 0.6470588, 1, 1,
0.1844663, 0.9532032, -0.7736319, 0, 0.6392157, 1, 1,
0.1912249, 1.113994, 0.6651042, 0, 0.6352941, 1, 1,
0.1912626, 0.312549, -0.2039136, 0, 0.627451, 1, 1,
0.1937675, -0.2536629, 3.220218, 0, 0.6235294, 1, 1,
0.1939393, -1.115141, 2.166107, 0, 0.6156863, 1, 1,
0.1969559, 2.220507, 0.6164455, 0, 0.6117647, 1, 1,
0.1981673, -0.4916693, 1.691927, 0, 0.6039216, 1, 1,
0.2015915, 1.163476, 0.1811872, 0, 0.5960785, 1, 1,
0.2043503, 0.6964639, -0.7972659, 0, 0.5921569, 1, 1,
0.2046444, -0.2935657, 1.470117, 0, 0.5843138, 1, 1,
0.2054303, 0.145926, 1.904516, 0, 0.5803922, 1, 1,
0.2078222, 0.9762585, -1.596623, 0, 0.572549, 1, 1,
0.2089401, 0.3189251, -1.070854, 0, 0.5686275, 1, 1,
0.2097609, 0.1312984, 0.5660297, 0, 0.5607843, 1, 1,
0.211484, 0.2139938, 0.03386688, 0, 0.5568628, 1, 1,
0.2115844, 1.160038, -0.001120862, 0, 0.5490196, 1, 1,
0.2159097, 0.1767306, 2.352272, 0, 0.5450981, 1, 1,
0.2160068, 0.1946013, 0.9231941, 0, 0.5372549, 1, 1,
0.2194526, -1.014002, 1.007443, 0, 0.5333334, 1, 1,
0.2242473, -1.296075, 3.293613, 0, 0.5254902, 1, 1,
0.2250109, -0.08109082, 1.227459, 0, 0.5215687, 1, 1,
0.2287405, -0.04472166, 2.421788, 0, 0.5137255, 1, 1,
0.2306516, 0.2776456, 0.775958, 0, 0.509804, 1, 1,
0.2341313, -1.096185, 3.946191, 0, 0.5019608, 1, 1,
0.2350692, 0.1728668, 1.126, 0, 0.4941176, 1, 1,
0.2357522, 1.285103, 0.2776751, 0, 0.4901961, 1, 1,
0.239944, -0.9460672, 3.338799, 0, 0.4823529, 1, 1,
0.2410233, 0.9574358, 0.2914868, 0, 0.4784314, 1, 1,
0.2455118, -0.5003936, 3.1381, 0, 0.4705882, 1, 1,
0.2481917, -1.200445, 1.86916, 0, 0.4666667, 1, 1,
0.2486744, -0.2753892, 1.213338, 0, 0.4588235, 1, 1,
0.2497895, 0.4566582, 0.01440078, 0, 0.454902, 1, 1,
0.2515906, -0.713761, 1.751826, 0, 0.4470588, 1, 1,
0.252534, -2.489953, 2.890306, 0, 0.4431373, 1, 1,
0.2528008, -0.7363781, 1.583505, 0, 0.4352941, 1, 1,
0.2568767, 0.4149129, 0.1835233, 0, 0.4313726, 1, 1,
0.260299, 0.4958018, -0.09993546, 0, 0.4235294, 1, 1,
0.2619351, -0.3877477, 1.398401, 0, 0.4196078, 1, 1,
0.2651945, 0.9930189, 0.7482004, 0, 0.4117647, 1, 1,
0.2659918, 0.4556398, 0.7045383, 0, 0.4078431, 1, 1,
0.2663609, -0.4799855, 1.817974, 0, 0.4, 1, 1,
0.2672818, -0.05398401, -0.8177128, 0, 0.3921569, 1, 1,
0.271505, 0.08118513, 1.51369, 0, 0.3882353, 1, 1,
0.2719422, -1.430446, 2.556588, 0, 0.3803922, 1, 1,
0.2722619, -0.9447691, 3.397212, 0, 0.3764706, 1, 1,
0.2746893, 0.3781291, 0.5548627, 0, 0.3686275, 1, 1,
0.2798238, 1.394099, 0.5006775, 0, 0.3647059, 1, 1,
0.2800933, 1.434503, -1.409039, 0, 0.3568628, 1, 1,
0.2840735, 0.5931736, 1.68179, 0, 0.3529412, 1, 1,
0.2853393, -0.8679059, 2.058467, 0, 0.345098, 1, 1,
0.2886813, -0.768882, 2.405262, 0, 0.3411765, 1, 1,
0.2915523, -0.2615808, 1.471013, 0, 0.3333333, 1, 1,
0.2934739, 0.5854252, 0.4392132, 0, 0.3294118, 1, 1,
0.2943104, 0.4561582, 1.696775, 0, 0.3215686, 1, 1,
0.2987199, -0.3112566, 2.147615, 0, 0.3176471, 1, 1,
0.3010792, 0.2038205, 1.092165, 0, 0.3098039, 1, 1,
0.3012627, 1.324505, -2.051505, 0, 0.3058824, 1, 1,
0.3021486, 0.8599861, -0.3058668, 0, 0.2980392, 1, 1,
0.3087043, 0.4047487, -0.1552442, 0, 0.2901961, 1, 1,
0.3124506, -0.06573688, 2.267591, 0, 0.2862745, 1, 1,
0.312879, -0.9023972, 2.940923, 0, 0.2784314, 1, 1,
0.3129466, 1.126997, -1.59033, 0, 0.2745098, 1, 1,
0.3169472, -0.2607697, 3.34353, 0, 0.2666667, 1, 1,
0.3177196, -1.221775, 4.373535, 0, 0.2627451, 1, 1,
0.3198896, -0.3954752, 3.211198, 0, 0.254902, 1, 1,
0.3214491, -0.2797156, 2.065419, 0, 0.2509804, 1, 1,
0.3222146, 1.63257, -0.6666011, 0, 0.2431373, 1, 1,
0.3246214, 0.6965928, -0.8595412, 0, 0.2392157, 1, 1,
0.3259416, -1.905452, 2.773239, 0, 0.2313726, 1, 1,
0.3265578, -1.454365, 4.972952, 0, 0.227451, 1, 1,
0.3286347, 0.9204699, 1.469306, 0, 0.2196078, 1, 1,
0.3312195, 0.2009587, 0.1743615, 0, 0.2156863, 1, 1,
0.3312593, 0.2682638, 0.5945562, 0, 0.2078431, 1, 1,
0.3348978, -0.2547069, 2.91779, 0, 0.2039216, 1, 1,
0.334995, -0.8681839, 3.138507, 0, 0.1960784, 1, 1,
0.3374104, -0.8517698, 5.337474, 0, 0.1882353, 1, 1,
0.3378402, -1.234143, 3.479713, 0, 0.1843137, 1, 1,
0.3463612, 0.748112, 0.4815518, 0, 0.1764706, 1, 1,
0.3519423, -0.4365336, 1.807144, 0, 0.172549, 1, 1,
0.3523647, 0.1859861, 0.2285975, 0, 0.1647059, 1, 1,
0.3532619, -1.150177, 3.371653, 0, 0.1607843, 1, 1,
0.3535612, 0.9196476, -0.01834611, 0, 0.1529412, 1, 1,
0.3576559, -2.666682, 1.589261, 0, 0.1490196, 1, 1,
0.358263, -1.91324, 4.496555, 0, 0.1411765, 1, 1,
0.3588872, -0.6137831, 1.555377, 0, 0.1372549, 1, 1,
0.3591293, 1.199867, -0.5182828, 0, 0.1294118, 1, 1,
0.3617709, -1.015668, 2.826808, 0, 0.1254902, 1, 1,
0.3630046, 0.5315467, -0.09810779, 0, 0.1176471, 1, 1,
0.3636386, 0.2902513, 1.109055, 0, 0.1137255, 1, 1,
0.3636801, 1.098801, 0.3515292, 0, 0.1058824, 1, 1,
0.3645271, 1.34497, -0.2751536, 0, 0.09803922, 1, 1,
0.3651643, 0.4046186, 0.9059706, 0, 0.09411765, 1, 1,
0.3733238, -1.51115, 2.780715, 0, 0.08627451, 1, 1,
0.3762841, -0.436774, 3.121007, 0, 0.08235294, 1, 1,
0.3791116, -0.7543605, 3.237166, 0, 0.07450981, 1, 1,
0.3811129, 0.06646819, 0.5117714, 0, 0.07058824, 1, 1,
0.3893434, -0.1762337, 1.584268, 0, 0.0627451, 1, 1,
0.3912871, 1.294606, 2.084007, 0, 0.05882353, 1, 1,
0.3923265, -0.2902248, 1.431945, 0, 0.05098039, 1, 1,
0.3976595, 0.7362464, -0.8560559, 0, 0.04705882, 1, 1,
0.400474, 0.5824358, -0.3399842, 0, 0.03921569, 1, 1,
0.4006129, 1.010335, -0.1655904, 0, 0.03529412, 1, 1,
0.4006691, 0.2697282, -0.8635735, 0, 0.02745098, 1, 1,
0.4029686, -0.5491008, 1.840436, 0, 0.02352941, 1, 1,
0.410863, 0.1296878, 2.954105, 0, 0.01568628, 1, 1,
0.4142489, -1.131949, 3.039494, 0, 0.01176471, 1, 1,
0.415392, -0.4481747, 3.631036, 0, 0.003921569, 1, 1,
0.4161752, 0.1498312, 1.094026, 0.003921569, 0, 1, 1,
0.4181959, 0.473342, 2.06099, 0.007843138, 0, 1, 1,
0.4183626, 0.03526481, 2.055431, 0.01568628, 0, 1, 1,
0.420555, 0.1777882, 2.850868, 0.01960784, 0, 1, 1,
0.4206384, 3.072596, -0.6663001, 0.02745098, 0, 1, 1,
0.4247568, 1.102679, -0.286806, 0.03137255, 0, 1, 1,
0.4257935, -0.4048682, 2.775134, 0.03921569, 0, 1, 1,
0.4275357, -0.6494731, 3.837574, 0.04313726, 0, 1, 1,
0.4335553, 0.01781593, 0.9520664, 0.05098039, 0, 1, 1,
0.433984, 2.094274, 0.4688982, 0.05490196, 0, 1, 1,
0.4387837, 0.4934163, 1.699075, 0.0627451, 0, 1, 1,
0.4437879, 0.4546921, 0.4078363, 0.06666667, 0, 1, 1,
0.4485297, -0.7703717, 0.9112507, 0.07450981, 0, 1, 1,
0.4492703, 0.560717, 1.608384, 0.07843138, 0, 1, 1,
0.4538046, -0.09705009, 1.636252, 0.08627451, 0, 1, 1,
0.4557216, -1.003788, 1.41603, 0.09019608, 0, 1, 1,
0.4600486, -0.774812, 1.443396, 0.09803922, 0, 1, 1,
0.4612905, -0.4246973, 3.489201, 0.1058824, 0, 1, 1,
0.4624516, 1.215219, -1.888135, 0.1098039, 0, 1, 1,
0.4629022, 0.2770961, 0.7671051, 0.1176471, 0, 1, 1,
0.4635912, 1.419705, 0.3252651, 0.1215686, 0, 1, 1,
0.4639041, 0.4517146, 0.7479082, 0.1294118, 0, 1, 1,
0.4679119, -2.024719, 2.139935, 0.1333333, 0, 1, 1,
0.4684471, 0.5640343, 0.5017847, 0.1411765, 0, 1, 1,
0.4753356, 0.2542122, -0.4535429, 0.145098, 0, 1, 1,
0.4777779, -0.4419515, 1.360259, 0.1529412, 0, 1, 1,
0.4817845, 0.3705509, 1.109173, 0.1568628, 0, 1, 1,
0.482392, 0.07111701, -0.2936723, 0.1647059, 0, 1, 1,
0.4860498, 1.325413, -0.5388123, 0.1686275, 0, 1, 1,
0.4864886, 0.6184882, 1.346558, 0.1764706, 0, 1, 1,
0.4886132, -0.6333381, 2.809091, 0.1803922, 0, 1, 1,
0.4995794, 0.3742856, 0.3715204, 0.1882353, 0, 1, 1,
0.5031492, -0.1194621, 0.4509047, 0.1921569, 0, 1, 1,
0.5045073, 2.600099, 0.07122754, 0.2, 0, 1, 1,
0.5055656, -0.02333988, 1.987997, 0.2078431, 0, 1, 1,
0.5079123, -1.73643, 2.90508, 0.2117647, 0, 1, 1,
0.5084493, 0.1340308, 1.238409, 0.2196078, 0, 1, 1,
0.5112933, -1.165007, 4.25132, 0.2235294, 0, 1, 1,
0.5166239, -0.0581078, 0.5355667, 0.2313726, 0, 1, 1,
0.5210338, 0.5786904, 2.637229, 0.2352941, 0, 1, 1,
0.5230124, 0.5577583, 1.427304, 0.2431373, 0, 1, 1,
0.523971, 0.3231865, -0.05707322, 0.2470588, 0, 1, 1,
0.5304418, 0.07355015, 0.06051563, 0.254902, 0, 1, 1,
0.5316957, 0.9586654, 0.5661386, 0.2588235, 0, 1, 1,
0.5329663, 0.5978494, 1.395139, 0.2666667, 0, 1, 1,
0.5367871, 0.6916206, -0.4506911, 0.2705882, 0, 1, 1,
0.5396861, 1.634632, 1.511091, 0.2784314, 0, 1, 1,
0.5443121, -0.3440341, 2.263893, 0.282353, 0, 1, 1,
0.5506914, 1.167587, 1.195466, 0.2901961, 0, 1, 1,
0.5530536, 1.431793, 0.07478637, 0.2941177, 0, 1, 1,
0.5541903, 0.5461368, 1.554916, 0.3019608, 0, 1, 1,
0.5655117, 0.03560927, 1.354227, 0.3098039, 0, 1, 1,
0.5779116, -0.5611777, 2.870456, 0.3137255, 0, 1, 1,
0.580543, 1.177896, -0.5914502, 0.3215686, 0, 1, 1,
0.5809755, 0.08707687, 1.485145, 0.3254902, 0, 1, 1,
0.5819146, 0.756577, 0.9466186, 0.3333333, 0, 1, 1,
0.5825084, -0.8571777, 1.610002, 0.3372549, 0, 1, 1,
0.5836838, -2.654956, 1.2213, 0.345098, 0, 1, 1,
0.5845504, -0.03873212, 1.114357, 0.3490196, 0, 1, 1,
0.5862916, 1.531123, 0.3449327, 0.3568628, 0, 1, 1,
0.5878193, 0.722419, 0.5215434, 0.3607843, 0, 1, 1,
0.5929056, 0.06673413, 1.250068, 0.3686275, 0, 1, 1,
0.596042, -1.266272, 3.470723, 0.372549, 0, 1, 1,
0.602833, 0.01182591, 3.148887, 0.3803922, 0, 1, 1,
0.6053776, -1.103351, 3.732384, 0.3843137, 0, 1, 1,
0.6064568, 0.0337065, 2.338149, 0.3921569, 0, 1, 1,
0.607333, 2.89474, 0.8871781, 0.3960784, 0, 1, 1,
0.6161697, -1.432407, 2.373262, 0.4039216, 0, 1, 1,
0.6188236, 0.1522443, 1.552961, 0.4117647, 0, 1, 1,
0.6196249, 0.8999838, -0.3739182, 0.4156863, 0, 1, 1,
0.6247095, 1.8324, -0.01792633, 0.4235294, 0, 1, 1,
0.6273797, -0.06112333, 1.910493, 0.427451, 0, 1, 1,
0.6275046, 0.5974293, 2.80216, 0.4352941, 0, 1, 1,
0.6290052, 1.017404, -0.1284071, 0.4392157, 0, 1, 1,
0.6301206, 1.120835, 0.3119723, 0.4470588, 0, 1, 1,
0.6314856, -0.09555317, 1.504198, 0.4509804, 0, 1, 1,
0.6343222, 0.5245939, 1.607088, 0.4588235, 0, 1, 1,
0.6345173, -1.947622, 1.696281, 0.4627451, 0, 1, 1,
0.6368093, 1.284682, -0.09352568, 0.4705882, 0, 1, 1,
0.6388081, -0.4438365, 2.199106, 0.4745098, 0, 1, 1,
0.646857, 1.000047, 0.7484517, 0.4823529, 0, 1, 1,
0.651489, 1.238277, 1.592891, 0.4862745, 0, 1, 1,
0.6606392, 1.249586, 1.364739, 0.4941176, 0, 1, 1,
0.6626098, 0.1640981, 0.9086923, 0.5019608, 0, 1, 1,
0.6626423, 1.458428, -0.7866074, 0.5058824, 0, 1, 1,
0.6633956, 0.5197428, 1.352664, 0.5137255, 0, 1, 1,
0.6638007, -0.5381443, 2.472667, 0.5176471, 0, 1, 1,
0.6719279, 0.2764155, -0.2050309, 0.5254902, 0, 1, 1,
0.6750796, 0.03141487, 0.7271631, 0.5294118, 0, 1, 1,
0.6765344, -0.6497238, 2.88581, 0.5372549, 0, 1, 1,
0.6768729, -0.143291, 0.7160566, 0.5411765, 0, 1, 1,
0.6813383, 0.495454, -0.1954239, 0.5490196, 0, 1, 1,
0.6899923, -0.01056616, 0.5121568, 0.5529412, 0, 1, 1,
0.69034, -0.660726, 1.92471, 0.5607843, 0, 1, 1,
0.6911694, 1.780715, 0.4844225, 0.5647059, 0, 1, 1,
0.6929654, 0.02886486, 1.956105, 0.572549, 0, 1, 1,
0.6982955, -1.546046, 2.370427, 0.5764706, 0, 1, 1,
0.6985679, -1.657508, 1.813654, 0.5843138, 0, 1, 1,
0.6989487, 0.3434533, 0.1321774, 0.5882353, 0, 1, 1,
0.6998743, -1.095411, 2.923557, 0.5960785, 0, 1, 1,
0.7006445, 0.5397175, 0.9007865, 0.6039216, 0, 1, 1,
0.7085333, 0.3530462, 3.727855, 0.6078432, 0, 1, 1,
0.7094286, 0.1537057, -0.05011729, 0.6156863, 0, 1, 1,
0.712818, -1.69568, 3.429621, 0.6196079, 0, 1, 1,
0.7139071, -2.693402, 2.850749, 0.627451, 0, 1, 1,
0.7205872, 0.7060483, 1.05007, 0.6313726, 0, 1, 1,
0.7252066, -0.5879585, 3.77755, 0.6392157, 0, 1, 1,
0.7296877, -0.2209884, 0.3624145, 0.6431373, 0, 1, 1,
0.7447451, -0.8671628, 1.844355, 0.6509804, 0, 1, 1,
0.7510695, -0.6853781, 0.7454374, 0.654902, 0, 1, 1,
0.7615783, -0.9684736, 2.088135, 0.6627451, 0, 1, 1,
0.7632774, 0.4646105, 1.465325, 0.6666667, 0, 1, 1,
0.763853, -1.705247, 3.894526, 0.6745098, 0, 1, 1,
0.7737309, -1.867501, 1.873456, 0.6784314, 0, 1, 1,
0.7749526, 1.098459, 0.4821008, 0.6862745, 0, 1, 1,
0.7758905, -0.9301741, 1.646038, 0.6901961, 0, 1, 1,
0.7770198, 0.05895867, -0.3381496, 0.6980392, 0, 1, 1,
0.7784094, 1.454156, -1.179156, 0.7058824, 0, 1, 1,
0.7784209, 0.03450868, 1.673492, 0.7098039, 0, 1, 1,
0.7813754, -0.3305934, 1.343061, 0.7176471, 0, 1, 1,
0.7819247, 1.093407, -0.3843508, 0.7215686, 0, 1, 1,
0.7869408, 0.3276285, 2.020239, 0.7294118, 0, 1, 1,
0.7893302, -1.189354, 2.782774, 0.7333333, 0, 1, 1,
0.789685, 1.1651, 0.6195782, 0.7411765, 0, 1, 1,
0.7900425, -0.813302, 1.059628, 0.7450981, 0, 1, 1,
0.7913891, -0.4158235, 0.7371662, 0.7529412, 0, 1, 1,
0.792877, 0.3472362, 3.187413, 0.7568628, 0, 1, 1,
0.7944679, -2.288626, 2.558747, 0.7647059, 0, 1, 1,
0.7996143, -0.5868421, 1.658498, 0.7686275, 0, 1, 1,
0.8019872, 0.8617797, -0.9616029, 0.7764706, 0, 1, 1,
0.8036883, -0.2305814, 3.389454, 0.7803922, 0, 1, 1,
0.8088369, -0.9171716, 0.736113, 0.7882353, 0, 1, 1,
0.8100186, -0.1026087, 2.17751, 0.7921569, 0, 1, 1,
0.8113894, 0.5725302, 1.419081, 0.8, 0, 1, 1,
0.814063, 0.8462822, 0.3021497, 0.8078431, 0, 1, 1,
0.8204343, 0.9657867, -0.2038005, 0.8117647, 0, 1, 1,
0.8226134, -0.1257905, 0.1004263, 0.8196079, 0, 1, 1,
0.8264494, -2.660969, 2.397262, 0.8235294, 0, 1, 1,
0.8288496, -0.2253847, 3.014098, 0.8313726, 0, 1, 1,
0.8313999, 0.9819606, 0.9208863, 0.8352941, 0, 1, 1,
0.8321133, -0.3029628, 1.360308, 0.8431373, 0, 1, 1,
0.8516232, -1.004722, 3.972476, 0.8470588, 0, 1, 1,
0.852109, -0.3472865, 3.624295, 0.854902, 0, 1, 1,
0.853743, -0.3241765, 3.3505, 0.8588235, 0, 1, 1,
0.8541532, -1.525587, 2.689456, 0.8666667, 0, 1, 1,
0.8583898, 0.9858137, 0.551825, 0.8705882, 0, 1, 1,
0.8604951, -0.3975072, 2.161849, 0.8784314, 0, 1, 1,
0.8651574, 0.531231, 2.558411, 0.8823529, 0, 1, 1,
0.8663229, -0.1461381, 1.491343, 0.8901961, 0, 1, 1,
0.8689116, 0.3887685, 0.9163269, 0.8941177, 0, 1, 1,
0.8699611, 0.2201985, 1.536835, 0.9019608, 0, 1, 1,
0.8700253, -1.708216, 3.496801, 0.9098039, 0, 1, 1,
0.8717347, -0.2987279, 2.084147, 0.9137255, 0, 1, 1,
0.874251, 0.9826862, 1.63974, 0.9215686, 0, 1, 1,
0.8789964, -0.9717149, 1.802358, 0.9254902, 0, 1, 1,
0.8832005, -0.6913507, 2.981313, 0.9333333, 0, 1, 1,
0.8850737, 0.6235592, 1.364456, 0.9372549, 0, 1, 1,
0.8912325, -1.811284, 3.428893, 0.945098, 0, 1, 1,
0.891296, 0.3599074, 1.442285, 0.9490196, 0, 1, 1,
0.8946408, 0.1586519, 1.783161, 0.9568627, 0, 1, 1,
0.8949838, -0.1482256, 1.099614, 0.9607843, 0, 1, 1,
0.897294, -1.55696, 0.9980042, 0.9686275, 0, 1, 1,
0.8996602, 0.357186, 0.3869783, 0.972549, 0, 1, 1,
0.9030563, -0.2172128, 3.599022, 0.9803922, 0, 1, 1,
0.9082506, 0.8763888, 2.357895, 0.9843137, 0, 1, 1,
0.9095379, 0.191188, 0.5874081, 0.9921569, 0, 1, 1,
0.9137642, 1.229298, 1.010579, 0.9960784, 0, 1, 1,
0.9141911, -0.2521839, 1.138513, 1, 0, 0.9960784, 1,
0.9203273, -0.09627508, 1.215171, 1, 0, 0.9882353, 1,
0.920705, -0.003363575, -0.2567543, 1, 0, 0.9843137, 1,
0.9227751, -1.493851, 0.1542205, 1, 0, 0.9764706, 1,
0.9245597, -1.356879, 3.037269, 1, 0, 0.972549, 1,
0.9273955, -0.6765847, 2.04384, 1, 0, 0.9647059, 1,
0.9289406, 0.5143785, 0.7511419, 1, 0, 0.9607843, 1,
0.9343215, 0.2354071, -0.2211263, 1, 0, 0.9529412, 1,
0.9360881, -0.2911817, 3.054448, 1, 0, 0.9490196, 1,
0.9370294, 0.6601995, -0.1786704, 1, 0, 0.9411765, 1,
0.945367, -0.5291051, 1.427475, 1, 0, 0.9372549, 1,
0.9473158, 0.001298398, 1.833775, 1, 0, 0.9294118, 1,
0.9524242, 1.712099, 0.6490892, 1, 0, 0.9254902, 1,
0.9530884, 1.611671, -0.477391, 1, 0, 0.9176471, 1,
0.9532096, 0.544462, 0.692215, 1, 0, 0.9137255, 1,
0.9594465, -0.5612438, 1.889225, 1, 0, 0.9058824, 1,
0.9604202, -2.349297, 2.332261, 1, 0, 0.9019608, 1,
0.960741, -0.5193252, 0.05970367, 1, 0, 0.8941177, 1,
0.9668515, 1.047551, 1.264122, 1, 0, 0.8862745, 1,
0.9674903, 0.9199272, 1.170406, 1, 0, 0.8823529, 1,
0.9728836, 0.6308875, 1.842868, 1, 0, 0.8745098, 1,
0.9750703, 0.3544308, 2.147561, 1, 0, 0.8705882, 1,
0.9797852, 1.564866, 1.325581, 1, 0, 0.8627451, 1,
0.9811212, -0.9961616, 2.978283, 1, 0, 0.8588235, 1,
0.9853313, -0.8421902, 1.252963, 1, 0, 0.8509804, 1,
0.9856169, 0.9293433, 1.623328, 1, 0, 0.8470588, 1,
0.9889425, -1.454892, 2.637735, 1, 0, 0.8392157, 1,
1.009277, 0.7713292, 2.187164, 1, 0, 0.8352941, 1,
1.040575, -0.1195271, 1.785441, 1, 0, 0.827451, 1,
1.041813, 1.600774, 1.879879, 1, 0, 0.8235294, 1,
1.041843, 0.7652972, 1.155814, 1, 0, 0.8156863, 1,
1.042049, -0.2539455, 1.49979, 1, 0, 0.8117647, 1,
1.04339, 0.9178964, 0.113287, 1, 0, 0.8039216, 1,
1.049309, -0.3571419, 1.526551, 1, 0, 0.7960784, 1,
1.052515, -0.8390065, 2.944072, 1, 0, 0.7921569, 1,
1.061174, 0.3792064, 0.531939, 1, 0, 0.7843137, 1,
1.065412, -0.3913786, 3.030646, 1, 0, 0.7803922, 1,
1.066801, -0.7260925, 1.534739, 1, 0, 0.772549, 1,
1.073023, -0.1304086, 0.7292212, 1, 0, 0.7686275, 1,
1.073738, -0.9056275, 2.992071, 1, 0, 0.7607843, 1,
1.083778, -0.1674643, 3.126487, 1, 0, 0.7568628, 1,
1.086295, 0.2525387, 3.308933, 1, 0, 0.7490196, 1,
1.086676, 1.475755, 0.6117369, 1, 0, 0.7450981, 1,
1.090839, -1.116935, 2.757549, 1, 0, 0.7372549, 1,
1.091941, 0.3889741, -0.3823623, 1, 0, 0.7333333, 1,
1.096029, 0.4471234, 1.063872, 1, 0, 0.7254902, 1,
1.097692, -1.718078, 4.609098, 1, 0, 0.7215686, 1,
1.114309, 1.409941, 2.04249, 1, 0, 0.7137255, 1,
1.125254, 2.216636, 0.8307976, 1, 0, 0.7098039, 1,
1.12613, 0.3369948, 0.9028678, 1, 0, 0.7019608, 1,
1.128263, -0.228891, 0.01168742, 1, 0, 0.6941177, 1,
1.128503, -0.2924741, 2.548448, 1, 0, 0.6901961, 1,
1.129409, -0.0495581, 0.4599119, 1, 0, 0.682353, 1,
1.131143, 1.447271, -0.1961849, 1, 0, 0.6784314, 1,
1.131499, 0.2695507, 0.769925, 1, 0, 0.6705883, 1,
1.138889, 1.207566, 0.5614612, 1, 0, 0.6666667, 1,
1.141116, 0.381409, 1.63052, 1, 0, 0.6588235, 1,
1.141362, 0.6767971, 2.21942, 1, 0, 0.654902, 1,
1.144018, 0.151165, 1.264476, 1, 0, 0.6470588, 1,
1.145209, -0.9469656, 1.730242, 1, 0, 0.6431373, 1,
1.145621, -0.2650089, 0.8584837, 1, 0, 0.6352941, 1,
1.146358, 0.9617437, -0.9438848, 1, 0, 0.6313726, 1,
1.14841, 0.002501309, 0.7841066, 1, 0, 0.6235294, 1,
1.155368, -0.805066, 1.296845, 1, 0, 0.6196079, 1,
1.156523, 0.3264762, 0.4679153, 1, 0, 0.6117647, 1,
1.164679, 0.8127056, 0.04951707, 1, 0, 0.6078432, 1,
1.168499, 0.3105611, 1.135605, 1, 0, 0.6, 1,
1.169938, 0.583425, 0.6769233, 1, 0, 0.5921569, 1,
1.172727, -0.1966388, 3.487924, 1, 0, 0.5882353, 1,
1.182299, 1.099723, 1.86879, 1, 0, 0.5803922, 1,
1.184674, 0.5473894, 0.3911699, 1, 0, 0.5764706, 1,
1.190706, 0.8155193, 0.3850728, 1, 0, 0.5686275, 1,
1.193474, 0.7566684, -0.8338025, 1, 0, 0.5647059, 1,
1.1943, 1.456383, 1.094856, 1, 0, 0.5568628, 1,
1.20215, -0.9647586, 1.935888, 1, 0, 0.5529412, 1,
1.209943, 0.1835062, 2.781457, 1, 0, 0.5450981, 1,
1.219523, -1.441121, 2.514316, 1, 0, 0.5411765, 1,
1.229824, 0.5675368, 2.206647, 1, 0, 0.5333334, 1,
1.230031, -0.7262455, 3.117516, 1, 0, 0.5294118, 1,
1.230672, 0.9339011, 1.564911, 1, 0, 0.5215687, 1,
1.249545, -0.9764327, 2.374301, 1, 0, 0.5176471, 1,
1.261591, 0.879981, 1.354084, 1, 0, 0.509804, 1,
1.276271, -2.170651, 1.840063, 1, 0, 0.5058824, 1,
1.295914, -0.8800635, 4.047814, 1, 0, 0.4980392, 1,
1.316045, -1.054721, 2.895046, 1, 0, 0.4901961, 1,
1.321767, -1.085648, 2.225576, 1, 0, 0.4862745, 1,
1.323067, -0.6701177, 3.378556, 1, 0, 0.4784314, 1,
1.343897, 0.4839059, 0.7844845, 1, 0, 0.4745098, 1,
1.345071, -2.254625, 1.256281, 1, 0, 0.4666667, 1,
1.353661, 0.1496011, 2.313232, 1, 0, 0.4627451, 1,
1.36305, 0.4224221, 1.399573, 1, 0, 0.454902, 1,
1.365188, -0.3458114, 2.384709, 1, 0, 0.4509804, 1,
1.368212, -1.161143, 3.020646, 1, 0, 0.4431373, 1,
1.368345, 0.6073921, 0.8211997, 1, 0, 0.4392157, 1,
1.369372, 0.2501245, 3.025939, 1, 0, 0.4313726, 1,
1.371254, -0.8860071, 2.147283, 1, 0, 0.427451, 1,
1.371822, 0.1986871, 0.8348474, 1, 0, 0.4196078, 1,
1.380161, -0.03569399, 1.131217, 1, 0, 0.4156863, 1,
1.390188, -1.228354, 1.056594, 1, 0, 0.4078431, 1,
1.390506, -0.3089025, 1.138792, 1, 0, 0.4039216, 1,
1.40408, 1.832972, 1.910397, 1, 0, 0.3960784, 1,
1.405643, -1.669671, 1.563898, 1, 0, 0.3882353, 1,
1.42109, -0.3049228, 1.641505, 1, 0, 0.3843137, 1,
1.426586, -0.2858218, 2.88144, 1, 0, 0.3764706, 1,
1.432811, -1.126456, 3.406324, 1, 0, 0.372549, 1,
1.472225, -0.6968573, 3.171894, 1, 0, 0.3647059, 1,
1.474242, -0.701104, 2.992162, 1, 0, 0.3607843, 1,
1.479104, 0.855957, 1.644584, 1, 0, 0.3529412, 1,
1.479793, -0.1901791, 1.208598, 1, 0, 0.3490196, 1,
1.525448, -2.067796, 4.024154, 1, 0, 0.3411765, 1,
1.552331, 0.01403103, 1.878225, 1, 0, 0.3372549, 1,
1.567041, 1.543026, -0.1352444, 1, 0, 0.3294118, 1,
1.567806, -2.240171, 3.615105, 1, 0, 0.3254902, 1,
1.578681, -1.449336, 2.701714, 1, 0, 0.3176471, 1,
1.59202, 0.4845919, 2.361434, 1, 0, 0.3137255, 1,
1.593027, -0.3297954, 2.261538, 1, 0, 0.3058824, 1,
1.610994, -0.3243776, 2.108179, 1, 0, 0.2980392, 1,
1.616338, -0.6054246, 2.261436, 1, 0, 0.2941177, 1,
1.619037, 1.571673, 0.7527754, 1, 0, 0.2862745, 1,
1.624527, 1.08843, 1.477244, 1, 0, 0.282353, 1,
1.630674, -0.4708905, 0.4011148, 1, 0, 0.2745098, 1,
1.635809, -0.1030068, 0.6785443, 1, 0, 0.2705882, 1,
1.670375, -1.645363, 3.316539, 1, 0, 0.2627451, 1,
1.684977, 1.688956, 0.07715982, 1, 0, 0.2588235, 1,
1.693866, -0.8056424, 2.128576, 1, 0, 0.2509804, 1,
1.704503, 0.5078955, -1.433645, 1, 0, 0.2470588, 1,
1.70649, -0.6364994, 3.047208, 1, 0, 0.2392157, 1,
1.735163, 0.7959898, 1.132073, 1, 0, 0.2352941, 1,
1.739893, -0.2056019, 1.991843, 1, 0, 0.227451, 1,
1.742401, 1.948414, 0.2400713, 1, 0, 0.2235294, 1,
1.752422, -1.74045, 0.9879152, 1, 0, 0.2156863, 1,
1.753513, 0.8870354, 0.05774451, 1, 0, 0.2117647, 1,
1.768239, -1.171234, 1.56749, 1, 0, 0.2039216, 1,
1.769636, 0.6211869, 1.389118, 1, 0, 0.1960784, 1,
1.776715, -0.04886782, 1.763655, 1, 0, 0.1921569, 1,
1.783937, 0.9939158, 0.9104654, 1, 0, 0.1843137, 1,
1.794742, -0.2938802, -0.3939261, 1, 0, 0.1803922, 1,
1.796919, -0.5751014, 3.446746, 1, 0, 0.172549, 1,
1.813723, -0.08532009, -0.1613637, 1, 0, 0.1686275, 1,
1.838761, -1.007579, 1.060032, 1, 0, 0.1607843, 1,
1.894609, 0.3260356, 0.1084728, 1, 0, 0.1568628, 1,
1.895543, -0.07324795, 2.562112, 1, 0, 0.1490196, 1,
1.904337, 0.7073027, 1.267001, 1, 0, 0.145098, 1,
1.921011, -0.6626015, 0.836906, 1, 0, 0.1372549, 1,
1.933769, -0.2539414, 0.5236852, 1, 0, 0.1333333, 1,
1.941856, -0.04177075, -0.2236359, 1, 0, 0.1254902, 1,
1.996567, -0.2923384, 0.7977099, 1, 0, 0.1215686, 1,
1.996869, 0.1060087, 2.298173, 1, 0, 0.1137255, 1,
2.022369, 1.072227, 1.328173, 1, 0, 0.1098039, 1,
2.040884, -0.9623429, 2.079295, 1, 0, 0.1019608, 1,
2.090669, -0.2418354, 1.657697, 1, 0, 0.09411765, 1,
2.122907, 0.4731313, 1.858348, 1, 0, 0.09019608, 1,
2.129976, 1.439915, 0.4915744, 1, 0, 0.08235294, 1,
2.133558, 0.9019687, 0.0297001, 1, 0, 0.07843138, 1,
2.136084, -0.4956456, 1.288136, 1, 0, 0.07058824, 1,
2.183946, -0.3050822, 0.1989673, 1, 0, 0.06666667, 1,
2.205781, -0.3909181, 3.381213, 1, 0, 0.05882353, 1,
2.213253, -1.69926, 3.996908, 1, 0, 0.05490196, 1,
2.219226, 1.892243, 0.4282122, 1, 0, 0.04705882, 1,
2.443272, -1.324182, 1.745568, 1, 0, 0.04313726, 1,
2.472384, 0.2070187, 1.549063, 1, 0, 0.03529412, 1,
2.566505, 1.15992, -0.714678, 1, 0, 0.03137255, 1,
2.765594, 0.04703629, 2.535784, 1, 0, 0.02352941, 1,
2.772225, -0.1974638, 2.189255, 1, 0, 0.01960784, 1,
2.838127, 0.5754974, 2.119034, 1, 0, 0.01176471, 1,
3.762696, -0.9477805, 3.120378, 1, 0, 0.007843138, 1
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
0.2946634, -4.211926, -7.308727, 0, -0.5, 0.5, 0.5,
0.2946634, -4.211926, -7.308727, 1, -0.5, 0.5, 0.5,
0.2946634, -4.211926, -7.308727, 1, 1.5, 0.5, 0.5,
0.2946634, -4.211926, -7.308727, 0, 1.5, 0.5, 0.5
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
-4.349032, -0.04177856, -7.308727, 0, -0.5, 0.5, 0.5,
-4.349032, -0.04177856, -7.308727, 1, -0.5, 0.5, 0.5,
-4.349032, -0.04177856, -7.308727, 1, 1.5, 0.5, 0.5,
-4.349032, -0.04177856, -7.308727, 0, 1.5, 0.5, 0.5
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
-4.349032, -4.211926, -0.06919622, 0, -0.5, 0.5, 0.5,
-4.349032, -4.211926, -0.06919622, 1, -0.5, 0.5, 0.5,
-4.349032, -4.211926, -0.06919622, 1, 1.5, 0.5, 0.5,
-4.349032, -4.211926, -0.06919622, 0, 1.5, 0.5, 0.5
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
-3, -3.249584, -5.638066,
3, -3.249584, -5.638066,
-3, -3.249584, -5.638066,
-3, -3.409975, -5.91651,
-2, -3.249584, -5.638066,
-2, -3.409975, -5.91651,
-1, -3.249584, -5.638066,
-1, -3.409975, -5.91651,
0, -3.249584, -5.638066,
0, -3.409975, -5.91651,
1, -3.249584, -5.638066,
1, -3.409975, -5.91651,
2, -3.249584, -5.638066,
2, -3.409975, -5.91651,
3, -3.249584, -5.638066,
3, -3.409975, -5.91651
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
-3, -3.730755, -6.473397, 0, -0.5, 0.5, 0.5,
-3, -3.730755, -6.473397, 1, -0.5, 0.5, 0.5,
-3, -3.730755, -6.473397, 1, 1.5, 0.5, 0.5,
-3, -3.730755, -6.473397, 0, 1.5, 0.5, 0.5,
-2, -3.730755, -6.473397, 0, -0.5, 0.5, 0.5,
-2, -3.730755, -6.473397, 1, -0.5, 0.5, 0.5,
-2, -3.730755, -6.473397, 1, 1.5, 0.5, 0.5,
-2, -3.730755, -6.473397, 0, 1.5, 0.5, 0.5,
-1, -3.730755, -6.473397, 0, -0.5, 0.5, 0.5,
-1, -3.730755, -6.473397, 1, -0.5, 0.5, 0.5,
-1, -3.730755, -6.473397, 1, 1.5, 0.5, 0.5,
-1, -3.730755, -6.473397, 0, 1.5, 0.5, 0.5,
0, -3.730755, -6.473397, 0, -0.5, 0.5, 0.5,
0, -3.730755, -6.473397, 1, -0.5, 0.5, 0.5,
0, -3.730755, -6.473397, 1, 1.5, 0.5, 0.5,
0, -3.730755, -6.473397, 0, 1.5, 0.5, 0.5,
1, -3.730755, -6.473397, 0, -0.5, 0.5, 0.5,
1, -3.730755, -6.473397, 1, -0.5, 0.5, 0.5,
1, -3.730755, -6.473397, 1, 1.5, 0.5, 0.5,
1, -3.730755, -6.473397, 0, 1.5, 0.5, 0.5,
2, -3.730755, -6.473397, 0, -0.5, 0.5, 0.5,
2, -3.730755, -6.473397, 1, -0.5, 0.5, 0.5,
2, -3.730755, -6.473397, 1, 1.5, 0.5, 0.5,
2, -3.730755, -6.473397, 0, 1.5, 0.5, 0.5,
3, -3.730755, -6.473397, 0, -0.5, 0.5, 0.5,
3, -3.730755, -6.473397, 1, -0.5, 0.5, 0.5,
3, -3.730755, -6.473397, 1, 1.5, 0.5, 0.5,
3, -3.730755, -6.473397, 0, 1.5, 0.5, 0.5
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
-3.27741, -3, -5.638066,
-3.27741, 3, -5.638066,
-3.27741, -3, -5.638066,
-3.456014, -3, -5.91651,
-3.27741, -2, -5.638066,
-3.456014, -2, -5.91651,
-3.27741, -1, -5.638066,
-3.456014, -1, -5.91651,
-3.27741, 0, -5.638066,
-3.456014, 0, -5.91651,
-3.27741, 1, -5.638066,
-3.456014, 1, -5.91651,
-3.27741, 2, -5.638066,
-3.456014, 2, -5.91651,
-3.27741, 3, -5.638066,
-3.456014, 3, -5.91651
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
-3.813221, -3, -6.473397, 0, -0.5, 0.5, 0.5,
-3.813221, -3, -6.473397, 1, -0.5, 0.5, 0.5,
-3.813221, -3, -6.473397, 1, 1.5, 0.5, 0.5,
-3.813221, -3, -6.473397, 0, 1.5, 0.5, 0.5,
-3.813221, -2, -6.473397, 0, -0.5, 0.5, 0.5,
-3.813221, -2, -6.473397, 1, -0.5, 0.5, 0.5,
-3.813221, -2, -6.473397, 1, 1.5, 0.5, 0.5,
-3.813221, -2, -6.473397, 0, 1.5, 0.5, 0.5,
-3.813221, -1, -6.473397, 0, -0.5, 0.5, 0.5,
-3.813221, -1, -6.473397, 1, -0.5, 0.5, 0.5,
-3.813221, -1, -6.473397, 1, 1.5, 0.5, 0.5,
-3.813221, -1, -6.473397, 0, 1.5, 0.5, 0.5,
-3.813221, 0, -6.473397, 0, -0.5, 0.5, 0.5,
-3.813221, 0, -6.473397, 1, -0.5, 0.5, 0.5,
-3.813221, 0, -6.473397, 1, 1.5, 0.5, 0.5,
-3.813221, 0, -6.473397, 0, 1.5, 0.5, 0.5,
-3.813221, 1, -6.473397, 0, -0.5, 0.5, 0.5,
-3.813221, 1, -6.473397, 1, -0.5, 0.5, 0.5,
-3.813221, 1, -6.473397, 1, 1.5, 0.5, 0.5,
-3.813221, 1, -6.473397, 0, 1.5, 0.5, 0.5,
-3.813221, 2, -6.473397, 0, -0.5, 0.5, 0.5,
-3.813221, 2, -6.473397, 1, -0.5, 0.5, 0.5,
-3.813221, 2, -6.473397, 1, 1.5, 0.5, 0.5,
-3.813221, 2, -6.473397, 0, 1.5, 0.5, 0.5,
-3.813221, 3, -6.473397, 0, -0.5, 0.5, 0.5,
-3.813221, 3, -6.473397, 1, -0.5, 0.5, 0.5,
-3.813221, 3, -6.473397, 1, 1.5, 0.5, 0.5,
-3.813221, 3, -6.473397, 0, 1.5, 0.5, 0.5
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
-3.27741, -3.249584, -4,
-3.27741, -3.249584, 4,
-3.27741, -3.249584, -4,
-3.456014, -3.409975, -4,
-3.27741, -3.249584, -2,
-3.456014, -3.409975, -2,
-3.27741, -3.249584, 0,
-3.456014, -3.409975, 0,
-3.27741, -3.249584, 2,
-3.456014, -3.409975, 2,
-3.27741, -3.249584, 4,
-3.456014, -3.409975, 4
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
-3.813221, -3.730755, -4, 0, -0.5, 0.5, 0.5,
-3.813221, -3.730755, -4, 1, -0.5, 0.5, 0.5,
-3.813221, -3.730755, -4, 1, 1.5, 0.5, 0.5,
-3.813221, -3.730755, -4, 0, 1.5, 0.5, 0.5,
-3.813221, -3.730755, -2, 0, -0.5, 0.5, 0.5,
-3.813221, -3.730755, -2, 1, -0.5, 0.5, 0.5,
-3.813221, -3.730755, -2, 1, 1.5, 0.5, 0.5,
-3.813221, -3.730755, -2, 0, 1.5, 0.5, 0.5,
-3.813221, -3.730755, 0, 0, -0.5, 0.5, 0.5,
-3.813221, -3.730755, 0, 1, -0.5, 0.5, 0.5,
-3.813221, -3.730755, 0, 1, 1.5, 0.5, 0.5,
-3.813221, -3.730755, 0, 0, 1.5, 0.5, 0.5,
-3.813221, -3.730755, 2, 0, -0.5, 0.5, 0.5,
-3.813221, -3.730755, 2, 1, -0.5, 0.5, 0.5,
-3.813221, -3.730755, 2, 1, 1.5, 0.5, 0.5,
-3.813221, -3.730755, 2, 0, 1.5, 0.5, 0.5,
-3.813221, -3.730755, 4, 0, -0.5, 0.5, 0.5,
-3.813221, -3.730755, 4, 1, -0.5, 0.5, 0.5,
-3.813221, -3.730755, 4, 1, 1.5, 0.5, 0.5,
-3.813221, -3.730755, 4, 0, 1.5, 0.5, 0.5
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
-3.27741, -3.249584, -5.638066,
-3.27741, 3.166027, -5.638066,
-3.27741, -3.249584, 5.499674,
-3.27741, 3.166027, 5.499674,
-3.27741, -3.249584, -5.638066,
-3.27741, -3.249584, 5.499674,
-3.27741, 3.166027, -5.638066,
-3.27741, 3.166027, 5.499674,
-3.27741, -3.249584, -5.638066,
3.866737, -3.249584, -5.638066,
-3.27741, -3.249584, 5.499674,
3.866737, -3.249584, 5.499674,
-3.27741, 3.166027, -5.638066,
3.866737, 3.166027, -5.638066,
-3.27741, 3.166027, 5.499674,
3.866737, 3.166027, 5.499674,
3.866737, -3.249584, -5.638066,
3.866737, 3.166027, -5.638066,
3.866737, -3.249584, 5.499674,
3.866737, 3.166027, 5.499674,
3.866737, -3.249584, -5.638066,
3.866737, -3.249584, 5.499674,
3.866737, 3.166027, -5.638066,
3.866737, 3.166027, 5.499674
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
var radius = 7.852387;
var distance = 34.93616;
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
mvMatrix.translate( -0.2946634, 0.04177856, 0.06919622 );
mvMatrix.scale( 1.188407, 1.323359, 0.762287 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.93616);
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
Dibutylphthalat<-read.table("Dibutylphthalat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dibutylphthalat$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dibutylphthalat' not found
```

```r
y<-Dibutylphthalat$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dibutylphthalat' not found
```

```r
z<-Dibutylphthalat$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dibutylphthalat' not found
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
-3.173369, -1.166691, -3.260432, 0, 0, 1, 1, 1,
-2.882662, -0.2806285, -2.541955, 1, 0, 0, 1, 1,
-2.809262, 0.07369947, -2.307913, 1, 0, 0, 1, 1,
-2.658581, -1.11149, -1.34425, 1, 0, 0, 1, 1,
-2.578581, -0.2711545, -1.847863, 1, 0, 0, 1, 1,
-2.553302, 0.4294492, -2.161134, 1, 0, 0, 1, 1,
-2.453779, -0.6782063, -2.084241, 0, 0, 0, 1, 1,
-2.388669, -1.484165, -1.693198, 0, 0, 0, 1, 1,
-2.362301, 0.02920474, -0.6298595, 0, 0, 0, 1, 1,
-2.306859, -0.02006266, 0.8980777, 0, 0, 0, 1, 1,
-2.268577, -0.8022848, -0.5026967, 0, 0, 0, 1, 1,
-2.251485, 0.6457298, -0.06733309, 0, 0, 0, 1, 1,
-2.209763, 1.53189, -1.506826, 0, 0, 0, 1, 1,
-2.207741, -0.5273115, -0.1365034, 1, 1, 1, 1, 1,
-2.113533, -0.09129695, -1.838654, 1, 1, 1, 1, 1,
-2.110286, -0.6520889, -3.876972, 1, 1, 1, 1, 1,
-2.107185, -0.3653034, -0.1294799, 1, 1, 1, 1, 1,
-2.078267, -0.4386764, 1.041198, 1, 1, 1, 1, 1,
-2.074757, 0.09381904, -0.5700833, 1, 1, 1, 1, 1,
-2.067598, -0.4250511, -2.322203, 1, 1, 1, 1, 1,
-2.029774, -0.03480113, -1.483378, 1, 1, 1, 1, 1,
-2.029719, -1.599881, -1.180675, 1, 1, 1, 1, 1,
-2.029014, 0.6931413, -1.230359, 1, 1, 1, 1, 1,
-1.991233, -1.352837, -2.865048, 1, 1, 1, 1, 1,
-1.988402, -0.4034121, -2.083691, 1, 1, 1, 1, 1,
-1.978453, -1.330864, -4.095562, 1, 1, 1, 1, 1,
-1.976305, 2.348118, -1.673935, 1, 1, 1, 1, 1,
-1.959585, -0.65103, -0.8295801, 1, 1, 1, 1, 1,
-1.945876, 0.4420931, -1.630218, 0, 0, 1, 1, 1,
-1.905904, -0.2592385, -1.034589, 1, 0, 0, 1, 1,
-1.87183, 0.3757406, -1.407618, 1, 0, 0, 1, 1,
-1.868232, -0.6016232, -1.785232, 1, 0, 0, 1, 1,
-1.864597, -1.066598, -2.947795, 1, 0, 0, 1, 1,
-1.811383, -0.4238797, -1.719921, 1, 0, 0, 1, 1,
-1.810217, 1.596452, -1.903586, 0, 0, 0, 1, 1,
-1.789074, 0.6492164, -0.3769389, 0, 0, 0, 1, 1,
-1.770325, 0.3020781, -1.934768, 0, 0, 0, 1, 1,
-1.758665, 0.1612559, -0.3462019, 0, 0, 0, 1, 1,
-1.748878, 0.2708609, -1.998392, 0, 0, 0, 1, 1,
-1.72739, 0.2030007, -1.477835, 0, 0, 0, 1, 1,
-1.726544, 1.872912, -1.036179, 0, 0, 0, 1, 1,
-1.724961, 1.371057, -1.485369, 1, 1, 1, 1, 1,
-1.712542, -0.7366033, -3.154164, 1, 1, 1, 1, 1,
-1.684644, 1.237357, -2.643759, 1, 1, 1, 1, 1,
-1.672783, -0.06847654, -2.549291, 1, 1, 1, 1, 1,
-1.667856, -0.02504781, -2.382799, 1, 1, 1, 1, 1,
-1.6604, -0.833089, -1.251922, 1, 1, 1, 1, 1,
-1.659375, -0.6146769, -1.737059, 1, 1, 1, 1, 1,
-1.656398, -0.4135457, -1.58875, 1, 1, 1, 1, 1,
-1.639351, -1.309041, -2.268987, 1, 1, 1, 1, 1,
-1.638284, -0.2410177, -2.097487, 1, 1, 1, 1, 1,
-1.617415, 1.858867, -0.005650658, 1, 1, 1, 1, 1,
-1.590945, 0.08397938, -0.1353965, 1, 1, 1, 1, 1,
-1.58383, 0.8720329, -0.412613, 1, 1, 1, 1, 1,
-1.5532, 0.5016366, 0.3833406, 1, 1, 1, 1, 1,
-1.54598, -1.342217, -2.594332, 1, 1, 1, 1, 1,
-1.543633, 0.8384225, -0.6992493, 0, 0, 1, 1, 1,
-1.52412, 0.5410246, -0.7928118, 1, 0, 0, 1, 1,
-1.513384, -0.3840269, -3.259757, 1, 0, 0, 1, 1,
-1.5114, 0.02887482, -1.538789, 1, 0, 0, 1, 1,
-1.50231, 0.0498706, -1.500711, 1, 0, 0, 1, 1,
-1.490096, -0.4740322, -1.988355, 1, 0, 0, 1, 1,
-1.48585, 0.9580855, -0.4548445, 0, 0, 0, 1, 1,
-1.48002, -2.24007, -2.076479, 0, 0, 0, 1, 1,
-1.477678, 0.5238518, -1.492359, 0, 0, 0, 1, 1,
-1.471563, 0.5694147, -0.4030106, 0, 0, 0, 1, 1,
-1.469824, 0.8833431, -1.869269, 0, 0, 0, 1, 1,
-1.464339, 0.5105441, 0.2451933, 0, 0, 0, 1, 1,
-1.461203, 0.4390089, -1.805218, 0, 0, 0, 1, 1,
-1.459464, 0.829082, -1.489446, 1, 1, 1, 1, 1,
-1.455024, 1.38328, 0.5607044, 1, 1, 1, 1, 1,
-1.451727, -0.3524929, -1.25981, 1, 1, 1, 1, 1,
-1.44883, 0.2582647, -0.6844517, 1, 1, 1, 1, 1,
-1.442287, -1.218228, -5.143239, 1, 1, 1, 1, 1,
-1.431651, 0.4387999, -0.4917411, 1, 1, 1, 1, 1,
-1.430485, 1.77661, 0.2482533, 1, 1, 1, 1, 1,
-1.429365, 0.5574254, -2.910874, 1, 1, 1, 1, 1,
-1.417116, -1.330788, -1.178697, 1, 1, 1, 1, 1,
-1.410978, -0.8129054, -0.7980177, 1, 1, 1, 1, 1,
-1.405445, 1.416255, -0.9998358, 1, 1, 1, 1, 1,
-1.403565, 1.242978, -2.255385, 1, 1, 1, 1, 1,
-1.395871, 0.0276422, -1.708297, 1, 1, 1, 1, 1,
-1.388372, -1.409406, -3.783652, 1, 1, 1, 1, 1,
-1.38334, -0.7113383, -2.670931, 1, 1, 1, 1, 1,
-1.37765, -0.07552358, 0.4623428, 0, 0, 1, 1, 1,
-1.376937, -0.4266084, -2.688576, 1, 0, 0, 1, 1,
-1.373781, 1.269271, -1.177285, 1, 0, 0, 1, 1,
-1.361825, -2.290617, -3.11044, 1, 0, 0, 1, 1,
-1.358803, 0.4505194, -2.317106, 1, 0, 0, 1, 1,
-1.357864, -0.8064252, -0.7251498, 1, 0, 0, 1, 1,
-1.355695, -0.4916513, -1.666744, 0, 0, 0, 1, 1,
-1.345842, 0.9542574, -0.4546694, 0, 0, 0, 1, 1,
-1.344722, 0.1854428, -1.771428, 0, 0, 0, 1, 1,
-1.339719, -0.02648708, -2.755067, 0, 0, 0, 1, 1,
-1.329991, 0.3947582, -0.2904518, 0, 0, 0, 1, 1,
-1.327657, -1.442357, -2.38854, 0, 0, 0, 1, 1,
-1.323725, -0.359289, -1.203033, 0, 0, 0, 1, 1,
-1.316678, 0.05985671, -0.2429599, 1, 1, 1, 1, 1,
-1.305252, 0.6315659, -1.013951, 1, 1, 1, 1, 1,
-1.289616, 0.7202798, -2.108548, 1, 1, 1, 1, 1,
-1.288264, -0.9689909, -1.777663, 1, 1, 1, 1, 1,
-1.279938, -0.1471905, -2.531676, 1, 1, 1, 1, 1,
-1.277969, -0.8925461, -3.629098, 1, 1, 1, 1, 1,
-1.270949, -0.7740373, -0.2046234, 1, 1, 1, 1, 1,
-1.268193, -1.009996, -3.610369, 1, 1, 1, 1, 1,
-1.264352, -0.9320751, -2.062862, 1, 1, 1, 1, 1,
-1.259128, -1.25452, -1.92238, 1, 1, 1, 1, 1,
-1.250387, -0.9037008, -2.284074, 1, 1, 1, 1, 1,
-1.247658, -0.1836912, -1.352339, 1, 1, 1, 1, 1,
-1.241575, 0.03426746, -2.267735, 1, 1, 1, 1, 1,
-1.23344, 1.044472, -1.198313, 1, 1, 1, 1, 1,
-1.225182, -0.5913489, -1.004749, 1, 1, 1, 1, 1,
-1.223939, 0.8720568, 0.2345923, 0, 0, 1, 1, 1,
-1.217014, 0.4531501, -1.155064, 1, 0, 0, 1, 1,
-1.202836, -0.8046605, -3.396693, 1, 0, 0, 1, 1,
-1.177524, 1.761737, 1.051896, 1, 0, 0, 1, 1,
-1.173221, -1.079529, -2.472771, 1, 0, 0, 1, 1,
-1.165529, 1.392523, 1.292827, 1, 0, 0, 1, 1,
-1.163441, -0.6019819, -3.332014, 0, 0, 0, 1, 1,
-1.156882, -0.03612354, -2.50647, 0, 0, 0, 1, 1,
-1.14006, 0.4865594, -1.851639, 0, 0, 0, 1, 1,
-1.123409, -1.165645, -2.338452, 0, 0, 0, 1, 1,
-1.122086, -0.9843095, -0.9844376, 0, 0, 0, 1, 1,
-1.121709, 0.07586093, -2.222159, 0, 0, 0, 1, 1,
-1.120151, 0.1697401, 0.02954169, 0, 0, 0, 1, 1,
-1.116253, -1.225339, -3.842006, 1, 1, 1, 1, 1,
-1.114341, 1.385115, 0.3192284, 1, 1, 1, 1, 1,
-1.102843, 1.016183, -2.004962, 1, 1, 1, 1, 1,
-1.092099, -0.7085171, -1.779734, 1, 1, 1, 1, 1,
-1.080444, 0.941476, -0.4591566, 1, 1, 1, 1, 1,
-1.080049, 1.223925, -0.3394475, 1, 1, 1, 1, 1,
-1.078563, 0.6533514, -0.6438156, 1, 1, 1, 1, 1,
-1.072201, 0.3440235, -1.44268, 1, 1, 1, 1, 1,
-1.071637, -0.7875714, -2.787966, 1, 1, 1, 1, 1,
-1.068575, -0.3972546, -0.08076862, 1, 1, 1, 1, 1,
-1.065077, 0.3242517, -0.6017101, 1, 1, 1, 1, 1,
-1.058349, 0.7382669, -1.305319, 1, 1, 1, 1, 1,
-1.057987, -0.7337009, -2.626151, 1, 1, 1, 1, 1,
-1.057523, -0.01262146, -2.506537, 1, 1, 1, 1, 1,
-1.054892, 0.9887113, -0.766607, 1, 1, 1, 1, 1,
-1.052797, -0.4384494, -3.062485, 0, 0, 1, 1, 1,
-1.050488, -2.243931, -2.606019, 1, 0, 0, 1, 1,
-1.04778, -0.3373775, -1.65647, 1, 0, 0, 1, 1,
-1.045726, -0.6801165, -2.800433, 1, 0, 0, 1, 1,
-1.043327, -1.392998, -3.861739, 1, 0, 0, 1, 1,
-1.042719, 1.532853, -0.4678613, 1, 0, 0, 1, 1,
-1.040236, -0.1004025, -1.289871, 0, 0, 0, 1, 1,
-1.038666, 0.7466329, 0.6977737, 0, 0, 0, 1, 1,
-1.037394, 0.0259496, -1.929863, 0, 0, 0, 1, 1,
-1.035764, 1.995304, -1.138702, 0, 0, 0, 1, 1,
-1.035329, 1.012743, -0.7208171, 0, 0, 0, 1, 1,
-1.021061, -1.461216, -2.442068, 0, 0, 0, 1, 1,
-1.00572, -1.139854, -2.078347, 0, 0, 0, 1, 1,
-1.001336, -0.5132886, -1.003887, 1, 1, 1, 1, 1,
-0.9972, -1.471387, -1.513685, 1, 1, 1, 1, 1,
-0.9955989, 0.05996655, -2.372502, 1, 1, 1, 1, 1,
-0.994752, -1.124507, -1.563151, 1, 1, 1, 1, 1,
-0.9946126, 0.1485723, -1.598963, 1, 1, 1, 1, 1,
-0.9943289, 0.8686793, 0.7631023, 1, 1, 1, 1, 1,
-0.9863756, 0.2752207, -0.02834227, 1, 1, 1, 1, 1,
-0.9847863, 0.3321209, -1.669372, 1, 1, 1, 1, 1,
-0.9828613, -1.688481, -1.264097, 1, 1, 1, 1, 1,
-0.9826648, 0.1804922, -1.31623, 1, 1, 1, 1, 1,
-0.9796144, 0.4853129, -0.3273395, 1, 1, 1, 1, 1,
-0.9701069, -0.07639171, -1.185101, 1, 1, 1, 1, 1,
-0.9686888, -0.3692577, -2.032846, 1, 1, 1, 1, 1,
-0.967531, -0.2565323, -2.281681, 1, 1, 1, 1, 1,
-0.9604079, 0.5811438, -1.932696, 1, 1, 1, 1, 1,
-0.9577335, 0.06410976, -0.6276736, 0, 0, 1, 1, 1,
-0.9548529, 1.244111, -1.676682, 1, 0, 0, 1, 1,
-0.946311, 1.101898, -2.728725, 1, 0, 0, 1, 1,
-0.9455602, -0.7964739, -2.725075, 1, 0, 0, 1, 1,
-0.9448727, 1.443721, -1.4785, 1, 0, 0, 1, 1,
-0.9355276, 2.630379, -1.685227, 1, 0, 0, 1, 1,
-0.9341751, -0.9926527, -1.642772, 0, 0, 0, 1, 1,
-0.9337221, 1.149132, -0.636189, 0, 0, 0, 1, 1,
-0.9319609, 1.029578, -2.189163, 0, 0, 0, 1, 1,
-0.9307852, -2.356915, -3.182237, 0, 0, 0, 1, 1,
-0.9229628, -1.356513, -3.010553, 0, 0, 0, 1, 1,
-0.9201174, -0.9663661, -2.693068, 0, 0, 0, 1, 1,
-0.9175625, -0.2792733, -3.36341, 0, 0, 0, 1, 1,
-0.9151071, 0.07976566, -3.574051, 1, 1, 1, 1, 1,
-0.9137393, 0.3538923, -2.440923, 1, 1, 1, 1, 1,
-0.9059383, 0.06944069, -1.891041, 1, 1, 1, 1, 1,
-0.8977728, 2.13214, -0.4114963, 1, 1, 1, 1, 1,
-0.8974307, -0.3146927, 0.07971988, 1, 1, 1, 1, 1,
-0.8873091, -1.218689, -2.271476, 1, 1, 1, 1, 1,
-0.885551, 2.454205, 0.1056773, 1, 1, 1, 1, 1,
-0.8851075, 1.292005, -0.4383804, 1, 1, 1, 1, 1,
-0.8843983, 0.3730107, -1.439796, 1, 1, 1, 1, 1,
-0.8753681, -0.6962426, -3.470767, 1, 1, 1, 1, 1,
-0.8713372, 0.4770574, -1.078652, 1, 1, 1, 1, 1,
-0.8597552, -0.6683627, -3.024926, 1, 1, 1, 1, 1,
-0.8593673, -0.6362017, -2.077872, 1, 1, 1, 1, 1,
-0.8435751, 0.3877739, -0.8158054, 1, 1, 1, 1, 1,
-0.8408836, -1.522983, -3.548619, 1, 1, 1, 1, 1,
-0.8391216, 0.4032118, -0.7516879, 0, 0, 1, 1, 1,
-0.8338606, 0.9202677, -1.088813, 1, 0, 0, 1, 1,
-0.8329733, -0.285905, -1.689904, 1, 0, 0, 1, 1,
-0.8309889, 1.77925, -0.6816532, 1, 0, 0, 1, 1,
-0.8301578, 0.5980471, -2.946416, 1, 0, 0, 1, 1,
-0.8244004, 0.9124482, -0.5512173, 1, 0, 0, 1, 1,
-0.8197358, -1.651512, -1.406524, 0, 0, 0, 1, 1,
-0.8184592, 0.138351, -1.809752, 0, 0, 0, 1, 1,
-0.8181183, 0.8195233, -2.289586, 0, 0, 0, 1, 1,
-0.8159596, -0.8412914, -1.858233, 0, 0, 0, 1, 1,
-0.8135918, -1.436626, -2.550819, 0, 0, 0, 1, 1,
-0.8124279, 0.2143366, -1.962147, 0, 0, 0, 1, 1,
-0.8120919, 0.09147817, 1.394661, 0, 0, 0, 1, 1,
-0.8074938, -0.875347, -2.901467, 1, 1, 1, 1, 1,
-0.7980985, 0.3524568, -2.046452, 1, 1, 1, 1, 1,
-0.7879059, -1.594971, -2.594594, 1, 1, 1, 1, 1,
-0.7867438, 0.1168564, -1.13988, 1, 1, 1, 1, 1,
-0.7739742, 0.1932046, -1.931635, 1, 1, 1, 1, 1,
-0.764784, -1.154463, -2.460372, 1, 1, 1, 1, 1,
-0.7574716, -0.1058756, -0.8283913, 1, 1, 1, 1, 1,
-0.7528263, -0.7325536, -1.817885, 1, 1, 1, 1, 1,
-0.7469299, 0.6705045, -1.575874, 1, 1, 1, 1, 1,
-0.7454478, 0.1227826, -2.592453, 1, 1, 1, 1, 1,
-0.7453108, -1.519594, -3.149082, 1, 1, 1, 1, 1,
-0.7420279, 0.3305043, -1.043608, 1, 1, 1, 1, 1,
-0.7366911, -0.1142828, -2.716231, 1, 1, 1, 1, 1,
-0.7287261, 0.9942685, 0.4457433, 1, 1, 1, 1, 1,
-0.7258773, -0.3029001, -2.851226, 1, 1, 1, 1, 1,
-0.7255948, 0.286419, -0.5320984, 0, 0, 1, 1, 1,
-0.7161577, 0.7798442, -1.262601, 1, 0, 0, 1, 1,
-0.7131873, -1.116428, -2.185545, 1, 0, 0, 1, 1,
-0.7127439, 0.3927601, -1.244181, 1, 0, 0, 1, 1,
-0.7122898, 0.2482086, -0.293163, 1, 0, 0, 1, 1,
-0.7102726, 0.6506476, -1.739618, 1, 0, 0, 1, 1,
-0.7008724, -0.5793572, -2.373683, 0, 0, 0, 1, 1,
-0.698327, -0.7785262, -1.458441, 0, 0, 0, 1, 1,
-0.69385, 0.5390161, -0.5323551, 0, 0, 0, 1, 1,
-0.6938101, -0.3045172, -2.797148, 0, 0, 0, 1, 1,
-0.6933925, -0.6727296, -0.5667396, 0, 0, 0, 1, 1,
-0.6883221, 1.122272, -1.638831, 0, 0, 0, 1, 1,
-0.6859474, -0.8563054, -0.9940922, 0, 0, 0, 1, 1,
-0.6698636, -0.5719105, -3.497514, 1, 1, 1, 1, 1,
-0.668866, 0.01819691, -2.188035, 1, 1, 1, 1, 1,
-0.6667351, 0.6769177, 0.2430003, 1, 1, 1, 1, 1,
-0.6615333, -0.4665326, -1.858706, 1, 1, 1, 1, 1,
-0.6614251, 1.45829, -0.370833, 1, 1, 1, 1, 1,
-0.6495134, -0.1355375, -1.141535, 1, 1, 1, 1, 1,
-0.6475084, -1.123615, -4.523481, 1, 1, 1, 1, 1,
-0.6453989, 1.468671, 0.6106155, 1, 1, 1, 1, 1,
-0.6370122, -0.002638029, -1.133034, 1, 1, 1, 1, 1,
-0.6363469, 0.2151411, -1.225373, 1, 1, 1, 1, 1,
-0.6345255, 0.3306946, -1.034373, 1, 1, 1, 1, 1,
-0.6300152, 0.6403829, -1.676905, 1, 1, 1, 1, 1,
-0.6269974, 0.4893305, -0.8866348, 1, 1, 1, 1, 1,
-0.6253763, 0.04027469, -2.329196, 1, 1, 1, 1, 1,
-0.6229832, -0.2023602, -2.33982, 1, 1, 1, 1, 1,
-0.6222125, 0.5274358, -0.2854577, 0, 0, 1, 1, 1,
-0.6187244, -0.3999406, -2.386674, 1, 0, 0, 1, 1,
-0.6184019, -1.047271, -0.5452025, 1, 0, 0, 1, 1,
-0.6163331, 0.4432072, 0.2462048, 1, 0, 0, 1, 1,
-0.6051267, 0.2749411, -0.8039777, 1, 0, 0, 1, 1,
-0.6047633, -1.29551, -1.187906, 1, 0, 0, 1, 1,
-0.6003218, 1.215279, -1.105784, 0, 0, 0, 1, 1,
-0.5973075, -0.4232769, -0.5863426, 0, 0, 0, 1, 1,
-0.5970846, -1.151261, -2.528382, 0, 0, 0, 1, 1,
-0.5950724, 2.561455, -0.5771031, 0, 0, 0, 1, 1,
-0.5938803, -0.4686944, -2.100697, 0, 0, 0, 1, 1,
-0.5913183, 0.8605336, -0.382252, 0, 0, 0, 1, 1,
-0.5891547, 0.4690159, -1.709293, 0, 0, 0, 1, 1,
-0.5867803, 0.3414513, -0.7977141, 1, 1, 1, 1, 1,
-0.5854381, 0.9459088, -0.2138058, 1, 1, 1, 1, 1,
-0.5820687, -2.088672, -3.813104, 1, 1, 1, 1, 1,
-0.57704, -0.8531346, -4.279781, 1, 1, 1, 1, 1,
-0.5770298, 0.06159126, -1.040282, 1, 1, 1, 1, 1,
-0.5745857, -0.6874423, -2.363372, 1, 1, 1, 1, 1,
-0.5731935, -0.007747207, -3.106594, 1, 1, 1, 1, 1,
-0.5726162, -0.8368948, -2.486981, 1, 1, 1, 1, 1,
-0.5704074, 1.567444, -1.090413, 1, 1, 1, 1, 1,
-0.568282, 0.3588576, -0.7560046, 1, 1, 1, 1, 1,
-0.5635228, 0.2543733, -1.877032, 1, 1, 1, 1, 1,
-0.5566248, 2.07196, -1.230417, 1, 1, 1, 1, 1,
-0.5554057, 0.7270867, 0.1016139, 1, 1, 1, 1, 1,
-0.5547164, 0.8850408, -0.6747499, 1, 1, 1, 1, 1,
-0.5469843, -0.6216904, -2.575493, 1, 1, 1, 1, 1,
-0.5467384, 1.374209, -0.3597182, 0, 0, 1, 1, 1,
-0.5452158, -0.09478981, -1.955394, 1, 0, 0, 1, 1,
-0.5347972, 1.031658, 0.09877469, 1, 0, 0, 1, 1,
-0.5237374, 0.4697663, -0.3257349, 1, 0, 0, 1, 1,
-0.5197313, -0.7526762, -1.583881, 1, 0, 0, 1, 1,
-0.514105, 0.6076039, -0.5448555, 1, 0, 0, 1, 1,
-0.5123928, -0.08478753, -1.055905, 0, 0, 0, 1, 1,
-0.5108021, 0.6768166, 0.3182737, 0, 0, 0, 1, 1,
-0.5105896, 0.484739, -0.4628264, 0, 0, 0, 1, 1,
-0.5071399, -2.724688, -2.429848, 0, 0, 0, 1, 1,
-0.4988649, 0.1647525, -1.587373, 0, 0, 0, 1, 1,
-0.4969025, -0.4665482, -2.73817, 0, 0, 0, 1, 1,
-0.4937662, 2.071066, 1.42561, 0, 0, 0, 1, 1,
-0.4882695, -0.6234981, -0.9990475, 1, 1, 1, 1, 1,
-0.4880819, -0.6010395, -1.453969, 1, 1, 1, 1, 1,
-0.4880711, 0.8398209, 0.7297006, 1, 1, 1, 1, 1,
-0.4819674, -0.4452979, -3.426465, 1, 1, 1, 1, 1,
-0.4782935, 0.6869349, -0.9934295, 1, 1, 1, 1, 1,
-0.4753444, 0.6200776, -1.026448, 1, 1, 1, 1, 1,
-0.4738497, -0.02300675, -2.491501, 1, 1, 1, 1, 1,
-0.4706492, 0.8746509, 0.01802959, 1, 1, 1, 1, 1,
-0.4705898, 0.6036955, -2.018808, 1, 1, 1, 1, 1,
-0.4661379, -1.133107, -2.222541, 1, 1, 1, 1, 1,
-0.4644563, 0.7900417, 0.1815906, 1, 1, 1, 1, 1,
-0.4620228, -1.166657, -1.091095, 1, 1, 1, 1, 1,
-0.4572106, -1.131261, -2.329884, 1, 1, 1, 1, 1,
-0.4527917, -1.270584, -4.675427, 1, 1, 1, 1, 1,
-0.451535, -0.6869828, -1.368832, 1, 1, 1, 1, 1,
-0.4505459, -1.585077, -1.269508, 0, 0, 1, 1, 1,
-0.4476782, 0.834892, 0.5822629, 1, 0, 0, 1, 1,
-0.4466073, -1.678088, -3.798849, 1, 0, 0, 1, 1,
-0.4424924, -0.9440446, -2.396695, 1, 0, 0, 1, 1,
-0.4366064, -1.508966, -4.33757, 1, 0, 0, 1, 1,
-0.4355264, -1.081194, -2.859311, 1, 0, 0, 1, 1,
-0.4351986, 0.3956699, -0.8913472, 0, 0, 0, 1, 1,
-0.433331, 1.017081, -1.020751, 0, 0, 0, 1, 1,
-0.4327369, 0.07325828, -1.426237, 0, 0, 0, 1, 1,
-0.432225, 0.1391816, -0.7970728, 0, 0, 0, 1, 1,
-0.4243244, 0.5315595, -3.460972, 0, 0, 0, 1, 1,
-0.415794, 0.833129, 0.5506631, 0, 0, 0, 1, 1,
-0.4091914, 0.1621835, -3.328109, 0, 0, 0, 1, 1,
-0.4088146, 1.248231, -0.4819716, 1, 1, 1, 1, 1,
-0.4073398, -1.300672, 0.5829464, 1, 1, 1, 1, 1,
-0.3985682, 0.8996107, 0.3107747, 1, 1, 1, 1, 1,
-0.3978891, 1.540622, -2.685406, 1, 1, 1, 1, 1,
-0.3978096, -0.08366681, -2.704705, 1, 1, 1, 1, 1,
-0.3846832, -0.5264993, -3.031535, 1, 1, 1, 1, 1,
-0.384294, -0.70002, -3.308838, 1, 1, 1, 1, 1,
-0.3821593, 0.5467516, 0.6777897, 1, 1, 1, 1, 1,
-0.381759, -0.6897608, -2.218165, 1, 1, 1, 1, 1,
-0.3810073, -0.30324, -2.825769, 1, 1, 1, 1, 1,
-0.3802173, -0.8582352, -3.131491, 1, 1, 1, 1, 1,
-0.37973, 0.65412, -2.422753, 1, 1, 1, 1, 1,
-0.3752186, -0.5608193, -1.727673, 1, 1, 1, 1, 1,
-0.3750961, 0.1708112, 0.6095371, 1, 1, 1, 1, 1,
-0.3727207, 2.260294, -0.7508991, 1, 1, 1, 1, 1,
-0.3695258, 0.9159021, 0.2047852, 0, 0, 1, 1, 1,
-0.3691157, 1.499984, 0.9986797, 1, 0, 0, 1, 1,
-0.3598482, -0.8735635, -3.500299, 1, 0, 0, 1, 1,
-0.3584805, -0.04321673, -1.138817, 1, 0, 0, 1, 1,
-0.3545389, -0.2688141, -3.041937, 1, 0, 0, 1, 1,
-0.3536642, -0.7013432, -2.882212, 1, 0, 0, 1, 1,
-0.3535588, 1.190124, -0.5093982, 0, 0, 0, 1, 1,
-0.3520075, 0.3293322, -0.3862024, 0, 0, 0, 1, 1,
-0.3482187, 0.8103158, -1.318008, 0, 0, 0, 1, 1,
-0.3473706, -0.3288863, -5.475866, 0, 0, 0, 1, 1,
-0.3466069, 0.09660716, -0.06746752, 0, 0, 0, 1, 1,
-0.3457147, 0.4079146, -1.771349, 0, 0, 0, 1, 1,
-0.3406799, 1.543038, -0.09258601, 0, 0, 0, 1, 1,
-0.3361676, 0.7355872, -0.5029682, 1, 1, 1, 1, 1,
-0.3356723, 0.0818515, -0.751151, 1, 1, 1, 1, 1,
-0.3331935, -0.8682886, -4.144894, 1, 1, 1, 1, 1,
-0.3323978, -0.2059811, -3.294402, 1, 1, 1, 1, 1,
-0.331978, 0.2982751, -1.864477, 1, 1, 1, 1, 1,
-0.329439, 0.5232618, -0.4978999, 1, 1, 1, 1, 1,
-0.3294037, -0.7020687, -1.642224, 1, 1, 1, 1, 1,
-0.32823, -0.3512208, -3.474915, 1, 1, 1, 1, 1,
-0.3254146, 1.159531, -0.5077298, 1, 1, 1, 1, 1,
-0.3219585, -0.7056902, -4.597678, 1, 1, 1, 1, 1,
-0.3163618, 0.5243918, -0.31307, 1, 1, 1, 1, 1,
-0.3157314, -0.5112602, -2.636984, 1, 1, 1, 1, 1,
-0.3156599, -1.244866, -2.969407, 1, 1, 1, 1, 1,
-0.3150913, 1.684009, 0.09081951, 1, 1, 1, 1, 1,
-0.311309, -1.135221, -2.186676, 1, 1, 1, 1, 1,
-0.3087935, -0.1807846, -0.9395536, 0, 0, 1, 1, 1,
-0.3082429, -0.2085075, -2.150586, 1, 0, 0, 1, 1,
-0.3076071, -1.476362, -2.914921, 1, 0, 0, 1, 1,
-0.307263, -0.01097017, -0.8912754, 1, 0, 0, 1, 1,
-0.3039655, 0.5796946, -1.744435, 1, 0, 0, 1, 1,
-0.3006113, 1.563058, -0.5603549, 1, 0, 0, 1, 1,
-0.2991363, 0.2532804, -0.6721749, 0, 0, 0, 1, 1,
-0.2937807, 0.5556799, -0.8630012, 0, 0, 0, 1, 1,
-0.2928694, 0.4930593, -0.799469, 0, 0, 0, 1, 1,
-0.2875878, -0.09715585, -3.454612, 0, 0, 0, 1, 1,
-0.2869106, 1.866832, -0.9213224, 0, 0, 0, 1, 1,
-0.2831278, 0.8934881, -0.8473176, 0, 0, 0, 1, 1,
-0.2828481, -0.8633, -3.096468, 0, 0, 0, 1, 1,
-0.2820167, -0.8820968, -3.589869, 1, 1, 1, 1, 1,
-0.280446, -1.838559, -3.005965, 1, 1, 1, 1, 1,
-0.2771073, -0.4957404, -2.630692, 1, 1, 1, 1, 1,
-0.2753038, -1.209796, -4.096961, 1, 1, 1, 1, 1,
-0.271781, -0.3540353, -3.786551, 1, 1, 1, 1, 1,
-0.2691231, -0.1126199, -3.594445, 1, 1, 1, 1, 1,
-0.2673797, 1.043199, -2.055654, 1, 1, 1, 1, 1,
-0.2672951, 1.296612, -0.348602, 1, 1, 1, 1, 1,
-0.2635637, -0.7840167, -1.211426, 1, 1, 1, 1, 1,
-0.2624602, -0.819923, -2.249936, 1, 1, 1, 1, 1,
-0.2613352, -0.9745654, -2.398793, 1, 1, 1, 1, 1,
-0.2583319, 0.3687629, -2.142915, 1, 1, 1, 1, 1,
-0.2544118, 1.114397, 0.06942222, 1, 1, 1, 1, 1,
-0.2531589, -0.110205, -2.619311, 1, 1, 1, 1, 1,
-0.2528053, 0.3283509, -0.9524176, 1, 1, 1, 1, 1,
-0.2474736, -1.389995, -4.917722, 0, 0, 1, 1, 1,
-0.2394572, 0.3612902, -1.132954, 1, 0, 0, 1, 1,
-0.2381683, 2.023324, 0.5099503, 1, 0, 0, 1, 1,
-0.237239, 0.489329, -0.4034443, 1, 0, 0, 1, 1,
-0.2291416, -0.5574843, -3.333491, 1, 0, 0, 1, 1,
-0.2276329, -0.8508072, -2.732126, 1, 0, 0, 1, 1,
-0.2274537, 0.6272473, -0.6724778, 0, 0, 0, 1, 1,
-0.2218342, -0.1251304, -2.479569, 0, 0, 0, 1, 1,
-0.2203694, -0.2415082, -0.9311721, 0, 0, 0, 1, 1,
-0.2201121, -0.5571567, -2.876287, 0, 0, 0, 1, 1,
-0.2195851, 0.5825179, -0.7462372, 0, 0, 0, 1, 1,
-0.2170235, 0.2381693, 0.4524187, 0, 0, 0, 1, 1,
-0.2144871, 0.01648339, 0.2928757, 0, 0, 0, 1, 1,
-0.2139488, 1.010422, -0.987155, 1, 1, 1, 1, 1,
-0.2123399, -0.8768609, -2.484424, 1, 1, 1, 1, 1,
-0.2082255, 0.6437609, -1.825952, 1, 1, 1, 1, 1,
-0.2058441, -0.5154713, -0.7604939, 1, 1, 1, 1, 1,
-0.2051122, 0.1177712, -2.023468, 1, 1, 1, 1, 1,
-0.2039045, 0.9860516, -0.2255059, 1, 1, 1, 1, 1,
-0.2014835, -0.3212806, -3.698534, 1, 1, 1, 1, 1,
-0.1969478, -1.768151, -4.286849, 1, 1, 1, 1, 1,
-0.1955587, -0.7602088, -3.177897, 1, 1, 1, 1, 1,
-0.1923332, -1.949037, -2.553901, 1, 1, 1, 1, 1,
-0.1922103, -0.793263, -2.596682, 1, 1, 1, 1, 1,
-0.191088, 0.7529301, -0.7626358, 1, 1, 1, 1, 1,
-0.1878646, -0.6682867, -2.494324, 1, 1, 1, 1, 1,
-0.1788734, -1.426995, -4.109431, 1, 1, 1, 1, 1,
-0.1785646, -0.6049096, -3.63773, 1, 1, 1, 1, 1,
-0.1775298, 0.2590759, -0.2624252, 0, 0, 1, 1, 1,
-0.1770866, -0.513931, -2.014431, 1, 0, 0, 1, 1,
-0.1753644, -1.071122, -2.090816, 1, 0, 0, 1, 1,
-0.1749187, 2.027421, 0.1765455, 1, 0, 0, 1, 1,
-0.1731942, -1.316747, -1.957763, 1, 0, 0, 1, 1,
-0.1694243, 0.02746958, -2.902309, 1, 0, 0, 1, 1,
-0.1656764, -1.333139, -3.098096, 0, 0, 0, 1, 1,
-0.1652325, 0.2910108, -0.6394417, 0, 0, 0, 1, 1,
-0.1639893, -1.17822, -3.568956, 0, 0, 0, 1, 1,
-0.1633255, 0.3055481, 0.7202144, 0, 0, 0, 1, 1,
-0.1633197, -0.1184526, -1.06694, 0, 0, 0, 1, 1,
-0.1611383, -0.2280858, -1.719548, 0, 0, 0, 1, 1,
-0.1605136, -0.5237173, -2.406725, 0, 0, 0, 1, 1,
-0.1603931, -1.361287, -2.315749, 1, 1, 1, 1, 1,
-0.157891, -0.4729608, -3.37519, 1, 1, 1, 1, 1,
-0.150735, -0.8527889, -1.597386, 1, 1, 1, 1, 1,
-0.1497949, -0.1731759, -0.06525638, 1, 1, 1, 1, 1,
-0.1472721, 0.4333565, 0.7976068, 1, 1, 1, 1, 1,
-0.1470318, -0.7843964, -3.603904, 1, 1, 1, 1, 1,
-0.146327, -0.1444457, -2.165157, 1, 1, 1, 1, 1,
-0.1460011, 0.3822423, -1.13088, 1, 1, 1, 1, 1,
-0.1457816, -1.236945, -4.015996, 1, 1, 1, 1, 1,
-0.1454542, -0.8110288, -3.824711, 1, 1, 1, 1, 1,
-0.1404795, 0.6555821, 0.8733139, 1, 1, 1, 1, 1,
-0.1396811, 0.1628178, -0.2188695, 1, 1, 1, 1, 1,
-0.1393823, -1.463336, -3.734374, 1, 1, 1, 1, 1,
-0.136109, -0.4992683, -1.782156, 1, 1, 1, 1, 1,
-0.1338229, -0.3769419, -3.449689, 1, 1, 1, 1, 1,
-0.1289799, -0.2341086, -3.837998, 0, 0, 1, 1, 1,
-0.1267583, 1.304151, 0.112394, 1, 0, 0, 1, 1,
-0.1204984, 0.06097046, -0.4321311, 1, 0, 0, 1, 1,
-0.1173771, 1.683553, 1.453319, 1, 0, 0, 1, 1,
-0.1121976, -0.8581507, -2.789939, 1, 0, 0, 1, 1,
-0.110112, 1.704292, 1.95873, 1, 0, 0, 1, 1,
-0.1098054, -0.8435383, -3.404817, 0, 0, 0, 1, 1,
-0.1023358, -0.9622192, -2.709817, 0, 0, 0, 1, 1,
-0.1006365, -1.220563, -3.788739, 0, 0, 0, 1, 1,
-0.1002359, 0.7278022, -0.1353054, 0, 0, 0, 1, 1,
-0.09790835, 1.273268, -0.5055073, 0, 0, 0, 1, 1,
-0.09278686, -0.1812426, -3.254748, 0, 0, 0, 1, 1,
-0.08615532, 0.72375, -0.5271111, 0, 0, 0, 1, 1,
-0.08548087, 1.289145, -0.5314177, 1, 1, 1, 1, 1,
-0.08472411, -0.1492036, -3.2656, 1, 1, 1, 1, 1,
-0.08417761, -0.7995258, -2.582881, 1, 1, 1, 1, 1,
-0.08171935, -0.04330987, -1.606755, 1, 1, 1, 1, 1,
-0.07923462, -0.311748, -2.624318, 1, 1, 1, 1, 1,
-0.07671813, -1.123558, -4.786349, 1, 1, 1, 1, 1,
-0.07242323, -0.9113307, -3.359161, 1, 1, 1, 1, 1,
-0.06993806, 0.3199795, -0.3148669, 1, 1, 1, 1, 1,
-0.06753774, -1.619279, -3.39967, 1, 1, 1, 1, 1,
-0.0653141, 0.8429599, -1.333644, 1, 1, 1, 1, 1,
-0.05999923, 1.346698, -0.2937187, 1, 1, 1, 1, 1,
-0.05667971, 1.135319, 0.4827327, 1, 1, 1, 1, 1,
-0.0555242, -0.6718076, -3.076208, 1, 1, 1, 1, 1,
-0.05408157, 0.7020546, -0.7851702, 1, 1, 1, 1, 1,
-0.05311582, 0.539319, -0.9364069, 1, 1, 1, 1, 1,
-0.05129956, 0.6067885, 0.6755793, 0, 0, 1, 1, 1,
-0.05106304, 0.72639, 0.03232738, 1, 0, 0, 1, 1,
-0.0465394, 0.4818742, -0.3637007, 1, 0, 0, 1, 1,
-0.04498406, -0.4598093, -3.407096, 1, 0, 0, 1, 1,
-0.0447123, -2.600622, -2.808023, 1, 0, 0, 1, 1,
-0.04403057, -1.134145, -3.411613, 1, 0, 0, 1, 1,
-0.04019981, 0.3481444, 1.177233, 0, 0, 0, 1, 1,
-0.03578322, 0.1998637, -0.2658596, 0, 0, 0, 1, 1,
-0.0345975, 0.6396976, -1.353195, 0, 0, 0, 1, 1,
-0.03252117, 0.687934, -0.6458956, 0, 0, 0, 1, 1,
-0.03239286, 0.760407, 0.4712301, 0, 0, 0, 1, 1,
-0.03209529, -1.003223, -2.936891, 0, 0, 0, 1, 1,
-0.02681819, -0.5211299, -3.586661, 0, 0, 0, 1, 1,
-0.02133802, -0.2172997, -2.977489, 1, 1, 1, 1, 1,
-0.01445533, 1.085475, 0.5445383, 1, 1, 1, 1, 1,
-0.0105109, 0.7720233, 0.05715714, 1, 1, 1, 1, 1,
-0.008882185, -0.04971964, -2.395582, 1, 1, 1, 1, 1,
-0.005367459, 0.3215903, 0.1602239, 1, 1, 1, 1, 1,
-0.002500782, 2.188548, 0.5189148, 1, 1, 1, 1, 1,
0.001611576, -1.835262, 3.507991, 1, 1, 1, 1, 1,
0.006623773, 2.415887, 0.7165598, 1, 1, 1, 1, 1,
0.007379766, -0.6446176, 4.35194, 1, 1, 1, 1, 1,
0.00947495, -0.3764748, 3.953613, 1, 1, 1, 1, 1,
0.01316356, 1.501721, -0.8652329, 1, 1, 1, 1, 1,
0.01329106, -1.259544, 3.567422, 1, 1, 1, 1, 1,
0.01424592, -0.4685386, 1.577465, 1, 1, 1, 1, 1,
0.01496208, 0.5318719, 2.042395, 1, 1, 1, 1, 1,
0.01887609, -0.637844, 4.776215, 1, 1, 1, 1, 1,
0.02588221, -0.06854463, 2.965144, 0, 0, 1, 1, 1,
0.02628146, 0.4320511, 0.1764364, 1, 0, 0, 1, 1,
0.02676238, 1.184157, -1.193445, 1, 0, 0, 1, 1,
0.03661017, 0.2701913, -0.3637763, 1, 0, 0, 1, 1,
0.03749835, 0.8561396, -1.098237, 1, 0, 0, 1, 1,
0.03979958, -0.242565, 2.879031, 1, 0, 0, 1, 1,
0.04012906, -0.9279386, 2.22727, 0, 0, 0, 1, 1,
0.04089175, -1.969523, 3.065376, 0, 0, 0, 1, 1,
0.0428108, 1.604255, 1.102058, 0, 0, 0, 1, 1,
0.04824062, -0.4161839, 2.896168, 0, 0, 0, 1, 1,
0.04985075, -1.247598, 2.727826, 0, 0, 0, 1, 1,
0.05557353, -1.424867, 2.937733, 0, 0, 0, 1, 1,
0.05710807, 1.240893, -0.1934552, 0, 0, 0, 1, 1,
0.06270347, 0.1790687, -0.1851291, 1, 1, 1, 1, 1,
0.06328449, -3.156153, 3.362768, 1, 1, 1, 1, 1,
0.06540059, 0.1767503, 1.130752, 1, 1, 1, 1, 1,
0.07595591, -0.1573662, 0.9944683, 1, 1, 1, 1, 1,
0.08151863, 1.486635, -0.17171, 1, 1, 1, 1, 1,
0.08240601, 0.08259942, -0.4497315, 1, 1, 1, 1, 1,
0.08275425, 0.502845, 0.6241493, 1, 1, 1, 1, 1,
0.08998053, -0.324795, 3.933973, 1, 1, 1, 1, 1,
0.09002972, 0.5678028, 0.09622507, 1, 1, 1, 1, 1,
0.099682, 0.8394709, 1.545587, 1, 1, 1, 1, 1,
0.1037899, -0.2181778, 1.434529, 1, 1, 1, 1, 1,
0.1072567, 0.02948992, 0.55998, 1, 1, 1, 1, 1,
0.1074557, -0.2866934, 3.21116, 1, 1, 1, 1, 1,
0.1077532, -1.004378, 3.761483, 1, 1, 1, 1, 1,
0.1084236, 2.032531, 0.7457248, 1, 1, 1, 1, 1,
0.113377, 1.650912, 1.203356, 0, 0, 1, 1, 1,
0.1202959, 1.423746, 0.005075575, 1, 0, 0, 1, 1,
0.1261009, -1.470275, 2.589702, 1, 0, 0, 1, 1,
0.1270468, -0.3197668, 3.650617, 1, 0, 0, 1, 1,
0.1279066, 0.1104076, 2.217689, 1, 0, 0, 1, 1,
0.1311704, -1.295504, 4.144959, 1, 0, 0, 1, 1,
0.133688, -0.9762797, 4.227916, 0, 0, 0, 1, 1,
0.1362627, -1.243609, 2.211619, 0, 0, 0, 1, 1,
0.1370754, 0.1999041, 1.425814, 0, 0, 0, 1, 1,
0.1379425, 1.061731, 0.1456614, 0, 0, 0, 1, 1,
0.1406866, 0.9606718, -0.9303177, 0, 0, 0, 1, 1,
0.1411931, 0.1621331, 1.768518, 0, 0, 0, 1, 1,
0.1432216, -1.703967, 2.608144, 0, 0, 0, 1, 1,
0.1442462, 0.7436171, 0.614712, 1, 1, 1, 1, 1,
0.1452889, -1.847383, 3.44455, 1, 1, 1, 1, 1,
0.1467032, -2.344873, 0.8323749, 1, 1, 1, 1, 1,
0.1527501, -1.193611, 3.714536, 1, 1, 1, 1, 1,
0.1542564, -1.592323, 3.603517, 1, 1, 1, 1, 1,
0.1584938, -0.2454743, -0.09934568, 1, 1, 1, 1, 1,
0.1622749, -0.03789894, 1.293135, 1, 1, 1, 1, 1,
0.1706791, 0.4298678, 0.6622745, 1, 1, 1, 1, 1,
0.1720595, 0.8180185, -1.894134, 1, 1, 1, 1, 1,
0.172619, 1.102599, 0.5647715, 1, 1, 1, 1, 1,
0.1733022, 0.3251046, 0.7632066, 1, 1, 1, 1, 1,
0.1733562, -0.2008274, 2.945497, 1, 1, 1, 1, 1,
0.1739074, 0.3514456, -0.3074003, 1, 1, 1, 1, 1,
0.1747049, 0.1345544, 1.784604, 1, 1, 1, 1, 1,
0.1799718, -0.3405996, 1.209513, 1, 1, 1, 1, 1,
0.1844663, 0.9532032, -0.7736319, 0, 0, 1, 1, 1,
0.1912249, 1.113994, 0.6651042, 1, 0, 0, 1, 1,
0.1912626, 0.312549, -0.2039136, 1, 0, 0, 1, 1,
0.1937675, -0.2536629, 3.220218, 1, 0, 0, 1, 1,
0.1939393, -1.115141, 2.166107, 1, 0, 0, 1, 1,
0.1969559, 2.220507, 0.6164455, 1, 0, 0, 1, 1,
0.1981673, -0.4916693, 1.691927, 0, 0, 0, 1, 1,
0.2015915, 1.163476, 0.1811872, 0, 0, 0, 1, 1,
0.2043503, 0.6964639, -0.7972659, 0, 0, 0, 1, 1,
0.2046444, -0.2935657, 1.470117, 0, 0, 0, 1, 1,
0.2054303, 0.145926, 1.904516, 0, 0, 0, 1, 1,
0.2078222, 0.9762585, -1.596623, 0, 0, 0, 1, 1,
0.2089401, 0.3189251, -1.070854, 0, 0, 0, 1, 1,
0.2097609, 0.1312984, 0.5660297, 1, 1, 1, 1, 1,
0.211484, 0.2139938, 0.03386688, 1, 1, 1, 1, 1,
0.2115844, 1.160038, -0.001120862, 1, 1, 1, 1, 1,
0.2159097, 0.1767306, 2.352272, 1, 1, 1, 1, 1,
0.2160068, 0.1946013, 0.9231941, 1, 1, 1, 1, 1,
0.2194526, -1.014002, 1.007443, 1, 1, 1, 1, 1,
0.2242473, -1.296075, 3.293613, 1, 1, 1, 1, 1,
0.2250109, -0.08109082, 1.227459, 1, 1, 1, 1, 1,
0.2287405, -0.04472166, 2.421788, 1, 1, 1, 1, 1,
0.2306516, 0.2776456, 0.775958, 1, 1, 1, 1, 1,
0.2341313, -1.096185, 3.946191, 1, 1, 1, 1, 1,
0.2350692, 0.1728668, 1.126, 1, 1, 1, 1, 1,
0.2357522, 1.285103, 0.2776751, 1, 1, 1, 1, 1,
0.239944, -0.9460672, 3.338799, 1, 1, 1, 1, 1,
0.2410233, 0.9574358, 0.2914868, 1, 1, 1, 1, 1,
0.2455118, -0.5003936, 3.1381, 0, 0, 1, 1, 1,
0.2481917, -1.200445, 1.86916, 1, 0, 0, 1, 1,
0.2486744, -0.2753892, 1.213338, 1, 0, 0, 1, 1,
0.2497895, 0.4566582, 0.01440078, 1, 0, 0, 1, 1,
0.2515906, -0.713761, 1.751826, 1, 0, 0, 1, 1,
0.252534, -2.489953, 2.890306, 1, 0, 0, 1, 1,
0.2528008, -0.7363781, 1.583505, 0, 0, 0, 1, 1,
0.2568767, 0.4149129, 0.1835233, 0, 0, 0, 1, 1,
0.260299, 0.4958018, -0.09993546, 0, 0, 0, 1, 1,
0.2619351, -0.3877477, 1.398401, 0, 0, 0, 1, 1,
0.2651945, 0.9930189, 0.7482004, 0, 0, 0, 1, 1,
0.2659918, 0.4556398, 0.7045383, 0, 0, 0, 1, 1,
0.2663609, -0.4799855, 1.817974, 0, 0, 0, 1, 1,
0.2672818, -0.05398401, -0.8177128, 1, 1, 1, 1, 1,
0.271505, 0.08118513, 1.51369, 1, 1, 1, 1, 1,
0.2719422, -1.430446, 2.556588, 1, 1, 1, 1, 1,
0.2722619, -0.9447691, 3.397212, 1, 1, 1, 1, 1,
0.2746893, 0.3781291, 0.5548627, 1, 1, 1, 1, 1,
0.2798238, 1.394099, 0.5006775, 1, 1, 1, 1, 1,
0.2800933, 1.434503, -1.409039, 1, 1, 1, 1, 1,
0.2840735, 0.5931736, 1.68179, 1, 1, 1, 1, 1,
0.2853393, -0.8679059, 2.058467, 1, 1, 1, 1, 1,
0.2886813, -0.768882, 2.405262, 1, 1, 1, 1, 1,
0.2915523, -0.2615808, 1.471013, 1, 1, 1, 1, 1,
0.2934739, 0.5854252, 0.4392132, 1, 1, 1, 1, 1,
0.2943104, 0.4561582, 1.696775, 1, 1, 1, 1, 1,
0.2987199, -0.3112566, 2.147615, 1, 1, 1, 1, 1,
0.3010792, 0.2038205, 1.092165, 1, 1, 1, 1, 1,
0.3012627, 1.324505, -2.051505, 0, 0, 1, 1, 1,
0.3021486, 0.8599861, -0.3058668, 1, 0, 0, 1, 1,
0.3087043, 0.4047487, -0.1552442, 1, 0, 0, 1, 1,
0.3124506, -0.06573688, 2.267591, 1, 0, 0, 1, 1,
0.312879, -0.9023972, 2.940923, 1, 0, 0, 1, 1,
0.3129466, 1.126997, -1.59033, 1, 0, 0, 1, 1,
0.3169472, -0.2607697, 3.34353, 0, 0, 0, 1, 1,
0.3177196, -1.221775, 4.373535, 0, 0, 0, 1, 1,
0.3198896, -0.3954752, 3.211198, 0, 0, 0, 1, 1,
0.3214491, -0.2797156, 2.065419, 0, 0, 0, 1, 1,
0.3222146, 1.63257, -0.6666011, 0, 0, 0, 1, 1,
0.3246214, 0.6965928, -0.8595412, 0, 0, 0, 1, 1,
0.3259416, -1.905452, 2.773239, 0, 0, 0, 1, 1,
0.3265578, -1.454365, 4.972952, 1, 1, 1, 1, 1,
0.3286347, 0.9204699, 1.469306, 1, 1, 1, 1, 1,
0.3312195, 0.2009587, 0.1743615, 1, 1, 1, 1, 1,
0.3312593, 0.2682638, 0.5945562, 1, 1, 1, 1, 1,
0.3348978, -0.2547069, 2.91779, 1, 1, 1, 1, 1,
0.334995, -0.8681839, 3.138507, 1, 1, 1, 1, 1,
0.3374104, -0.8517698, 5.337474, 1, 1, 1, 1, 1,
0.3378402, -1.234143, 3.479713, 1, 1, 1, 1, 1,
0.3463612, 0.748112, 0.4815518, 1, 1, 1, 1, 1,
0.3519423, -0.4365336, 1.807144, 1, 1, 1, 1, 1,
0.3523647, 0.1859861, 0.2285975, 1, 1, 1, 1, 1,
0.3532619, -1.150177, 3.371653, 1, 1, 1, 1, 1,
0.3535612, 0.9196476, -0.01834611, 1, 1, 1, 1, 1,
0.3576559, -2.666682, 1.589261, 1, 1, 1, 1, 1,
0.358263, -1.91324, 4.496555, 1, 1, 1, 1, 1,
0.3588872, -0.6137831, 1.555377, 0, 0, 1, 1, 1,
0.3591293, 1.199867, -0.5182828, 1, 0, 0, 1, 1,
0.3617709, -1.015668, 2.826808, 1, 0, 0, 1, 1,
0.3630046, 0.5315467, -0.09810779, 1, 0, 0, 1, 1,
0.3636386, 0.2902513, 1.109055, 1, 0, 0, 1, 1,
0.3636801, 1.098801, 0.3515292, 1, 0, 0, 1, 1,
0.3645271, 1.34497, -0.2751536, 0, 0, 0, 1, 1,
0.3651643, 0.4046186, 0.9059706, 0, 0, 0, 1, 1,
0.3733238, -1.51115, 2.780715, 0, 0, 0, 1, 1,
0.3762841, -0.436774, 3.121007, 0, 0, 0, 1, 1,
0.3791116, -0.7543605, 3.237166, 0, 0, 0, 1, 1,
0.3811129, 0.06646819, 0.5117714, 0, 0, 0, 1, 1,
0.3893434, -0.1762337, 1.584268, 0, 0, 0, 1, 1,
0.3912871, 1.294606, 2.084007, 1, 1, 1, 1, 1,
0.3923265, -0.2902248, 1.431945, 1, 1, 1, 1, 1,
0.3976595, 0.7362464, -0.8560559, 1, 1, 1, 1, 1,
0.400474, 0.5824358, -0.3399842, 1, 1, 1, 1, 1,
0.4006129, 1.010335, -0.1655904, 1, 1, 1, 1, 1,
0.4006691, 0.2697282, -0.8635735, 1, 1, 1, 1, 1,
0.4029686, -0.5491008, 1.840436, 1, 1, 1, 1, 1,
0.410863, 0.1296878, 2.954105, 1, 1, 1, 1, 1,
0.4142489, -1.131949, 3.039494, 1, 1, 1, 1, 1,
0.415392, -0.4481747, 3.631036, 1, 1, 1, 1, 1,
0.4161752, 0.1498312, 1.094026, 1, 1, 1, 1, 1,
0.4181959, 0.473342, 2.06099, 1, 1, 1, 1, 1,
0.4183626, 0.03526481, 2.055431, 1, 1, 1, 1, 1,
0.420555, 0.1777882, 2.850868, 1, 1, 1, 1, 1,
0.4206384, 3.072596, -0.6663001, 1, 1, 1, 1, 1,
0.4247568, 1.102679, -0.286806, 0, 0, 1, 1, 1,
0.4257935, -0.4048682, 2.775134, 1, 0, 0, 1, 1,
0.4275357, -0.6494731, 3.837574, 1, 0, 0, 1, 1,
0.4335553, 0.01781593, 0.9520664, 1, 0, 0, 1, 1,
0.433984, 2.094274, 0.4688982, 1, 0, 0, 1, 1,
0.4387837, 0.4934163, 1.699075, 1, 0, 0, 1, 1,
0.4437879, 0.4546921, 0.4078363, 0, 0, 0, 1, 1,
0.4485297, -0.7703717, 0.9112507, 0, 0, 0, 1, 1,
0.4492703, 0.560717, 1.608384, 0, 0, 0, 1, 1,
0.4538046, -0.09705009, 1.636252, 0, 0, 0, 1, 1,
0.4557216, -1.003788, 1.41603, 0, 0, 0, 1, 1,
0.4600486, -0.774812, 1.443396, 0, 0, 0, 1, 1,
0.4612905, -0.4246973, 3.489201, 0, 0, 0, 1, 1,
0.4624516, 1.215219, -1.888135, 1, 1, 1, 1, 1,
0.4629022, 0.2770961, 0.7671051, 1, 1, 1, 1, 1,
0.4635912, 1.419705, 0.3252651, 1, 1, 1, 1, 1,
0.4639041, 0.4517146, 0.7479082, 1, 1, 1, 1, 1,
0.4679119, -2.024719, 2.139935, 1, 1, 1, 1, 1,
0.4684471, 0.5640343, 0.5017847, 1, 1, 1, 1, 1,
0.4753356, 0.2542122, -0.4535429, 1, 1, 1, 1, 1,
0.4777779, -0.4419515, 1.360259, 1, 1, 1, 1, 1,
0.4817845, 0.3705509, 1.109173, 1, 1, 1, 1, 1,
0.482392, 0.07111701, -0.2936723, 1, 1, 1, 1, 1,
0.4860498, 1.325413, -0.5388123, 1, 1, 1, 1, 1,
0.4864886, 0.6184882, 1.346558, 1, 1, 1, 1, 1,
0.4886132, -0.6333381, 2.809091, 1, 1, 1, 1, 1,
0.4995794, 0.3742856, 0.3715204, 1, 1, 1, 1, 1,
0.5031492, -0.1194621, 0.4509047, 1, 1, 1, 1, 1,
0.5045073, 2.600099, 0.07122754, 0, 0, 1, 1, 1,
0.5055656, -0.02333988, 1.987997, 1, 0, 0, 1, 1,
0.5079123, -1.73643, 2.90508, 1, 0, 0, 1, 1,
0.5084493, 0.1340308, 1.238409, 1, 0, 0, 1, 1,
0.5112933, -1.165007, 4.25132, 1, 0, 0, 1, 1,
0.5166239, -0.0581078, 0.5355667, 1, 0, 0, 1, 1,
0.5210338, 0.5786904, 2.637229, 0, 0, 0, 1, 1,
0.5230124, 0.5577583, 1.427304, 0, 0, 0, 1, 1,
0.523971, 0.3231865, -0.05707322, 0, 0, 0, 1, 1,
0.5304418, 0.07355015, 0.06051563, 0, 0, 0, 1, 1,
0.5316957, 0.9586654, 0.5661386, 0, 0, 0, 1, 1,
0.5329663, 0.5978494, 1.395139, 0, 0, 0, 1, 1,
0.5367871, 0.6916206, -0.4506911, 0, 0, 0, 1, 1,
0.5396861, 1.634632, 1.511091, 1, 1, 1, 1, 1,
0.5443121, -0.3440341, 2.263893, 1, 1, 1, 1, 1,
0.5506914, 1.167587, 1.195466, 1, 1, 1, 1, 1,
0.5530536, 1.431793, 0.07478637, 1, 1, 1, 1, 1,
0.5541903, 0.5461368, 1.554916, 1, 1, 1, 1, 1,
0.5655117, 0.03560927, 1.354227, 1, 1, 1, 1, 1,
0.5779116, -0.5611777, 2.870456, 1, 1, 1, 1, 1,
0.580543, 1.177896, -0.5914502, 1, 1, 1, 1, 1,
0.5809755, 0.08707687, 1.485145, 1, 1, 1, 1, 1,
0.5819146, 0.756577, 0.9466186, 1, 1, 1, 1, 1,
0.5825084, -0.8571777, 1.610002, 1, 1, 1, 1, 1,
0.5836838, -2.654956, 1.2213, 1, 1, 1, 1, 1,
0.5845504, -0.03873212, 1.114357, 1, 1, 1, 1, 1,
0.5862916, 1.531123, 0.3449327, 1, 1, 1, 1, 1,
0.5878193, 0.722419, 0.5215434, 1, 1, 1, 1, 1,
0.5929056, 0.06673413, 1.250068, 0, 0, 1, 1, 1,
0.596042, -1.266272, 3.470723, 1, 0, 0, 1, 1,
0.602833, 0.01182591, 3.148887, 1, 0, 0, 1, 1,
0.6053776, -1.103351, 3.732384, 1, 0, 0, 1, 1,
0.6064568, 0.0337065, 2.338149, 1, 0, 0, 1, 1,
0.607333, 2.89474, 0.8871781, 1, 0, 0, 1, 1,
0.6161697, -1.432407, 2.373262, 0, 0, 0, 1, 1,
0.6188236, 0.1522443, 1.552961, 0, 0, 0, 1, 1,
0.6196249, 0.8999838, -0.3739182, 0, 0, 0, 1, 1,
0.6247095, 1.8324, -0.01792633, 0, 0, 0, 1, 1,
0.6273797, -0.06112333, 1.910493, 0, 0, 0, 1, 1,
0.6275046, 0.5974293, 2.80216, 0, 0, 0, 1, 1,
0.6290052, 1.017404, -0.1284071, 0, 0, 0, 1, 1,
0.6301206, 1.120835, 0.3119723, 1, 1, 1, 1, 1,
0.6314856, -0.09555317, 1.504198, 1, 1, 1, 1, 1,
0.6343222, 0.5245939, 1.607088, 1, 1, 1, 1, 1,
0.6345173, -1.947622, 1.696281, 1, 1, 1, 1, 1,
0.6368093, 1.284682, -0.09352568, 1, 1, 1, 1, 1,
0.6388081, -0.4438365, 2.199106, 1, 1, 1, 1, 1,
0.646857, 1.000047, 0.7484517, 1, 1, 1, 1, 1,
0.651489, 1.238277, 1.592891, 1, 1, 1, 1, 1,
0.6606392, 1.249586, 1.364739, 1, 1, 1, 1, 1,
0.6626098, 0.1640981, 0.9086923, 1, 1, 1, 1, 1,
0.6626423, 1.458428, -0.7866074, 1, 1, 1, 1, 1,
0.6633956, 0.5197428, 1.352664, 1, 1, 1, 1, 1,
0.6638007, -0.5381443, 2.472667, 1, 1, 1, 1, 1,
0.6719279, 0.2764155, -0.2050309, 1, 1, 1, 1, 1,
0.6750796, 0.03141487, 0.7271631, 1, 1, 1, 1, 1,
0.6765344, -0.6497238, 2.88581, 0, 0, 1, 1, 1,
0.6768729, -0.143291, 0.7160566, 1, 0, 0, 1, 1,
0.6813383, 0.495454, -0.1954239, 1, 0, 0, 1, 1,
0.6899923, -0.01056616, 0.5121568, 1, 0, 0, 1, 1,
0.69034, -0.660726, 1.92471, 1, 0, 0, 1, 1,
0.6911694, 1.780715, 0.4844225, 1, 0, 0, 1, 1,
0.6929654, 0.02886486, 1.956105, 0, 0, 0, 1, 1,
0.6982955, -1.546046, 2.370427, 0, 0, 0, 1, 1,
0.6985679, -1.657508, 1.813654, 0, 0, 0, 1, 1,
0.6989487, 0.3434533, 0.1321774, 0, 0, 0, 1, 1,
0.6998743, -1.095411, 2.923557, 0, 0, 0, 1, 1,
0.7006445, 0.5397175, 0.9007865, 0, 0, 0, 1, 1,
0.7085333, 0.3530462, 3.727855, 0, 0, 0, 1, 1,
0.7094286, 0.1537057, -0.05011729, 1, 1, 1, 1, 1,
0.712818, -1.69568, 3.429621, 1, 1, 1, 1, 1,
0.7139071, -2.693402, 2.850749, 1, 1, 1, 1, 1,
0.7205872, 0.7060483, 1.05007, 1, 1, 1, 1, 1,
0.7252066, -0.5879585, 3.77755, 1, 1, 1, 1, 1,
0.7296877, -0.2209884, 0.3624145, 1, 1, 1, 1, 1,
0.7447451, -0.8671628, 1.844355, 1, 1, 1, 1, 1,
0.7510695, -0.6853781, 0.7454374, 1, 1, 1, 1, 1,
0.7615783, -0.9684736, 2.088135, 1, 1, 1, 1, 1,
0.7632774, 0.4646105, 1.465325, 1, 1, 1, 1, 1,
0.763853, -1.705247, 3.894526, 1, 1, 1, 1, 1,
0.7737309, -1.867501, 1.873456, 1, 1, 1, 1, 1,
0.7749526, 1.098459, 0.4821008, 1, 1, 1, 1, 1,
0.7758905, -0.9301741, 1.646038, 1, 1, 1, 1, 1,
0.7770198, 0.05895867, -0.3381496, 1, 1, 1, 1, 1,
0.7784094, 1.454156, -1.179156, 0, 0, 1, 1, 1,
0.7784209, 0.03450868, 1.673492, 1, 0, 0, 1, 1,
0.7813754, -0.3305934, 1.343061, 1, 0, 0, 1, 1,
0.7819247, 1.093407, -0.3843508, 1, 0, 0, 1, 1,
0.7869408, 0.3276285, 2.020239, 1, 0, 0, 1, 1,
0.7893302, -1.189354, 2.782774, 1, 0, 0, 1, 1,
0.789685, 1.1651, 0.6195782, 0, 0, 0, 1, 1,
0.7900425, -0.813302, 1.059628, 0, 0, 0, 1, 1,
0.7913891, -0.4158235, 0.7371662, 0, 0, 0, 1, 1,
0.792877, 0.3472362, 3.187413, 0, 0, 0, 1, 1,
0.7944679, -2.288626, 2.558747, 0, 0, 0, 1, 1,
0.7996143, -0.5868421, 1.658498, 0, 0, 0, 1, 1,
0.8019872, 0.8617797, -0.9616029, 0, 0, 0, 1, 1,
0.8036883, -0.2305814, 3.389454, 1, 1, 1, 1, 1,
0.8088369, -0.9171716, 0.736113, 1, 1, 1, 1, 1,
0.8100186, -0.1026087, 2.17751, 1, 1, 1, 1, 1,
0.8113894, 0.5725302, 1.419081, 1, 1, 1, 1, 1,
0.814063, 0.8462822, 0.3021497, 1, 1, 1, 1, 1,
0.8204343, 0.9657867, -0.2038005, 1, 1, 1, 1, 1,
0.8226134, -0.1257905, 0.1004263, 1, 1, 1, 1, 1,
0.8264494, -2.660969, 2.397262, 1, 1, 1, 1, 1,
0.8288496, -0.2253847, 3.014098, 1, 1, 1, 1, 1,
0.8313999, 0.9819606, 0.9208863, 1, 1, 1, 1, 1,
0.8321133, -0.3029628, 1.360308, 1, 1, 1, 1, 1,
0.8516232, -1.004722, 3.972476, 1, 1, 1, 1, 1,
0.852109, -0.3472865, 3.624295, 1, 1, 1, 1, 1,
0.853743, -0.3241765, 3.3505, 1, 1, 1, 1, 1,
0.8541532, -1.525587, 2.689456, 1, 1, 1, 1, 1,
0.8583898, 0.9858137, 0.551825, 0, 0, 1, 1, 1,
0.8604951, -0.3975072, 2.161849, 1, 0, 0, 1, 1,
0.8651574, 0.531231, 2.558411, 1, 0, 0, 1, 1,
0.8663229, -0.1461381, 1.491343, 1, 0, 0, 1, 1,
0.8689116, 0.3887685, 0.9163269, 1, 0, 0, 1, 1,
0.8699611, 0.2201985, 1.536835, 1, 0, 0, 1, 1,
0.8700253, -1.708216, 3.496801, 0, 0, 0, 1, 1,
0.8717347, -0.2987279, 2.084147, 0, 0, 0, 1, 1,
0.874251, 0.9826862, 1.63974, 0, 0, 0, 1, 1,
0.8789964, -0.9717149, 1.802358, 0, 0, 0, 1, 1,
0.8832005, -0.6913507, 2.981313, 0, 0, 0, 1, 1,
0.8850737, 0.6235592, 1.364456, 0, 0, 0, 1, 1,
0.8912325, -1.811284, 3.428893, 0, 0, 0, 1, 1,
0.891296, 0.3599074, 1.442285, 1, 1, 1, 1, 1,
0.8946408, 0.1586519, 1.783161, 1, 1, 1, 1, 1,
0.8949838, -0.1482256, 1.099614, 1, 1, 1, 1, 1,
0.897294, -1.55696, 0.9980042, 1, 1, 1, 1, 1,
0.8996602, 0.357186, 0.3869783, 1, 1, 1, 1, 1,
0.9030563, -0.2172128, 3.599022, 1, 1, 1, 1, 1,
0.9082506, 0.8763888, 2.357895, 1, 1, 1, 1, 1,
0.9095379, 0.191188, 0.5874081, 1, 1, 1, 1, 1,
0.9137642, 1.229298, 1.010579, 1, 1, 1, 1, 1,
0.9141911, -0.2521839, 1.138513, 1, 1, 1, 1, 1,
0.9203273, -0.09627508, 1.215171, 1, 1, 1, 1, 1,
0.920705, -0.003363575, -0.2567543, 1, 1, 1, 1, 1,
0.9227751, -1.493851, 0.1542205, 1, 1, 1, 1, 1,
0.9245597, -1.356879, 3.037269, 1, 1, 1, 1, 1,
0.9273955, -0.6765847, 2.04384, 1, 1, 1, 1, 1,
0.9289406, 0.5143785, 0.7511419, 0, 0, 1, 1, 1,
0.9343215, 0.2354071, -0.2211263, 1, 0, 0, 1, 1,
0.9360881, -0.2911817, 3.054448, 1, 0, 0, 1, 1,
0.9370294, 0.6601995, -0.1786704, 1, 0, 0, 1, 1,
0.945367, -0.5291051, 1.427475, 1, 0, 0, 1, 1,
0.9473158, 0.001298398, 1.833775, 1, 0, 0, 1, 1,
0.9524242, 1.712099, 0.6490892, 0, 0, 0, 1, 1,
0.9530884, 1.611671, -0.477391, 0, 0, 0, 1, 1,
0.9532096, 0.544462, 0.692215, 0, 0, 0, 1, 1,
0.9594465, -0.5612438, 1.889225, 0, 0, 0, 1, 1,
0.9604202, -2.349297, 2.332261, 0, 0, 0, 1, 1,
0.960741, -0.5193252, 0.05970367, 0, 0, 0, 1, 1,
0.9668515, 1.047551, 1.264122, 0, 0, 0, 1, 1,
0.9674903, 0.9199272, 1.170406, 1, 1, 1, 1, 1,
0.9728836, 0.6308875, 1.842868, 1, 1, 1, 1, 1,
0.9750703, 0.3544308, 2.147561, 1, 1, 1, 1, 1,
0.9797852, 1.564866, 1.325581, 1, 1, 1, 1, 1,
0.9811212, -0.9961616, 2.978283, 1, 1, 1, 1, 1,
0.9853313, -0.8421902, 1.252963, 1, 1, 1, 1, 1,
0.9856169, 0.9293433, 1.623328, 1, 1, 1, 1, 1,
0.9889425, -1.454892, 2.637735, 1, 1, 1, 1, 1,
1.009277, 0.7713292, 2.187164, 1, 1, 1, 1, 1,
1.040575, -0.1195271, 1.785441, 1, 1, 1, 1, 1,
1.041813, 1.600774, 1.879879, 1, 1, 1, 1, 1,
1.041843, 0.7652972, 1.155814, 1, 1, 1, 1, 1,
1.042049, -0.2539455, 1.49979, 1, 1, 1, 1, 1,
1.04339, 0.9178964, 0.113287, 1, 1, 1, 1, 1,
1.049309, -0.3571419, 1.526551, 1, 1, 1, 1, 1,
1.052515, -0.8390065, 2.944072, 0, 0, 1, 1, 1,
1.061174, 0.3792064, 0.531939, 1, 0, 0, 1, 1,
1.065412, -0.3913786, 3.030646, 1, 0, 0, 1, 1,
1.066801, -0.7260925, 1.534739, 1, 0, 0, 1, 1,
1.073023, -0.1304086, 0.7292212, 1, 0, 0, 1, 1,
1.073738, -0.9056275, 2.992071, 1, 0, 0, 1, 1,
1.083778, -0.1674643, 3.126487, 0, 0, 0, 1, 1,
1.086295, 0.2525387, 3.308933, 0, 0, 0, 1, 1,
1.086676, 1.475755, 0.6117369, 0, 0, 0, 1, 1,
1.090839, -1.116935, 2.757549, 0, 0, 0, 1, 1,
1.091941, 0.3889741, -0.3823623, 0, 0, 0, 1, 1,
1.096029, 0.4471234, 1.063872, 0, 0, 0, 1, 1,
1.097692, -1.718078, 4.609098, 0, 0, 0, 1, 1,
1.114309, 1.409941, 2.04249, 1, 1, 1, 1, 1,
1.125254, 2.216636, 0.8307976, 1, 1, 1, 1, 1,
1.12613, 0.3369948, 0.9028678, 1, 1, 1, 1, 1,
1.128263, -0.228891, 0.01168742, 1, 1, 1, 1, 1,
1.128503, -0.2924741, 2.548448, 1, 1, 1, 1, 1,
1.129409, -0.0495581, 0.4599119, 1, 1, 1, 1, 1,
1.131143, 1.447271, -0.1961849, 1, 1, 1, 1, 1,
1.131499, 0.2695507, 0.769925, 1, 1, 1, 1, 1,
1.138889, 1.207566, 0.5614612, 1, 1, 1, 1, 1,
1.141116, 0.381409, 1.63052, 1, 1, 1, 1, 1,
1.141362, 0.6767971, 2.21942, 1, 1, 1, 1, 1,
1.144018, 0.151165, 1.264476, 1, 1, 1, 1, 1,
1.145209, -0.9469656, 1.730242, 1, 1, 1, 1, 1,
1.145621, -0.2650089, 0.8584837, 1, 1, 1, 1, 1,
1.146358, 0.9617437, -0.9438848, 1, 1, 1, 1, 1,
1.14841, 0.002501309, 0.7841066, 0, 0, 1, 1, 1,
1.155368, -0.805066, 1.296845, 1, 0, 0, 1, 1,
1.156523, 0.3264762, 0.4679153, 1, 0, 0, 1, 1,
1.164679, 0.8127056, 0.04951707, 1, 0, 0, 1, 1,
1.168499, 0.3105611, 1.135605, 1, 0, 0, 1, 1,
1.169938, 0.583425, 0.6769233, 1, 0, 0, 1, 1,
1.172727, -0.1966388, 3.487924, 0, 0, 0, 1, 1,
1.182299, 1.099723, 1.86879, 0, 0, 0, 1, 1,
1.184674, 0.5473894, 0.3911699, 0, 0, 0, 1, 1,
1.190706, 0.8155193, 0.3850728, 0, 0, 0, 1, 1,
1.193474, 0.7566684, -0.8338025, 0, 0, 0, 1, 1,
1.1943, 1.456383, 1.094856, 0, 0, 0, 1, 1,
1.20215, -0.9647586, 1.935888, 0, 0, 0, 1, 1,
1.209943, 0.1835062, 2.781457, 1, 1, 1, 1, 1,
1.219523, -1.441121, 2.514316, 1, 1, 1, 1, 1,
1.229824, 0.5675368, 2.206647, 1, 1, 1, 1, 1,
1.230031, -0.7262455, 3.117516, 1, 1, 1, 1, 1,
1.230672, 0.9339011, 1.564911, 1, 1, 1, 1, 1,
1.249545, -0.9764327, 2.374301, 1, 1, 1, 1, 1,
1.261591, 0.879981, 1.354084, 1, 1, 1, 1, 1,
1.276271, -2.170651, 1.840063, 1, 1, 1, 1, 1,
1.295914, -0.8800635, 4.047814, 1, 1, 1, 1, 1,
1.316045, -1.054721, 2.895046, 1, 1, 1, 1, 1,
1.321767, -1.085648, 2.225576, 1, 1, 1, 1, 1,
1.323067, -0.6701177, 3.378556, 1, 1, 1, 1, 1,
1.343897, 0.4839059, 0.7844845, 1, 1, 1, 1, 1,
1.345071, -2.254625, 1.256281, 1, 1, 1, 1, 1,
1.353661, 0.1496011, 2.313232, 1, 1, 1, 1, 1,
1.36305, 0.4224221, 1.399573, 0, 0, 1, 1, 1,
1.365188, -0.3458114, 2.384709, 1, 0, 0, 1, 1,
1.368212, -1.161143, 3.020646, 1, 0, 0, 1, 1,
1.368345, 0.6073921, 0.8211997, 1, 0, 0, 1, 1,
1.369372, 0.2501245, 3.025939, 1, 0, 0, 1, 1,
1.371254, -0.8860071, 2.147283, 1, 0, 0, 1, 1,
1.371822, 0.1986871, 0.8348474, 0, 0, 0, 1, 1,
1.380161, -0.03569399, 1.131217, 0, 0, 0, 1, 1,
1.390188, -1.228354, 1.056594, 0, 0, 0, 1, 1,
1.390506, -0.3089025, 1.138792, 0, 0, 0, 1, 1,
1.40408, 1.832972, 1.910397, 0, 0, 0, 1, 1,
1.405643, -1.669671, 1.563898, 0, 0, 0, 1, 1,
1.42109, -0.3049228, 1.641505, 0, 0, 0, 1, 1,
1.426586, -0.2858218, 2.88144, 1, 1, 1, 1, 1,
1.432811, -1.126456, 3.406324, 1, 1, 1, 1, 1,
1.472225, -0.6968573, 3.171894, 1, 1, 1, 1, 1,
1.474242, -0.701104, 2.992162, 1, 1, 1, 1, 1,
1.479104, 0.855957, 1.644584, 1, 1, 1, 1, 1,
1.479793, -0.1901791, 1.208598, 1, 1, 1, 1, 1,
1.525448, -2.067796, 4.024154, 1, 1, 1, 1, 1,
1.552331, 0.01403103, 1.878225, 1, 1, 1, 1, 1,
1.567041, 1.543026, -0.1352444, 1, 1, 1, 1, 1,
1.567806, -2.240171, 3.615105, 1, 1, 1, 1, 1,
1.578681, -1.449336, 2.701714, 1, 1, 1, 1, 1,
1.59202, 0.4845919, 2.361434, 1, 1, 1, 1, 1,
1.593027, -0.3297954, 2.261538, 1, 1, 1, 1, 1,
1.610994, -0.3243776, 2.108179, 1, 1, 1, 1, 1,
1.616338, -0.6054246, 2.261436, 1, 1, 1, 1, 1,
1.619037, 1.571673, 0.7527754, 0, 0, 1, 1, 1,
1.624527, 1.08843, 1.477244, 1, 0, 0, 1, 1,
1.630674, -0.4708905, 0.4011148, 1, 0, 0, 1, 1,
1.635809, -0.1030068, 0.6785443, 1, 0, 0, 1, 1,
1.670375, -1.645363, 3.316539, 1, 0, 0, 1, 1,
1.684977, 1.688956, 0.07715982, 1, 0, 0, 1, 1,
1.693866, -0.8056424, 2.128576, 0, 0, 0, 1, 1,
1.704503, 0.5078955, -1.433645, 0, 0, 0, 1, 1,
1.70649, -0.6364994, 3.047208, 0, 0, 0, 1, 1,
1.735163, 0.7959898, 1.132073, 0, 0, 0, 1, 1,
1.739893, -0.2056019, 1.991843, 0, 0, 0, 1, 1,
1.742401, 1.948414, 0.2400713, 0, 0, 0, 1, 1,
1.752422, -1.74045, 0.9879152, 0, 0, 0, 1, 1,
1.753513, 0.8870354, 0.05774451, 1, 1, 1, 1, 1,
1.768239, -1.171234, 1.56749, 1, 1, 1, 1, 1,
1.769636, 0.6211869, 1.389118, 1, 1, 1, 1, 1,
1.776715, -0.04886782, 1.763655, 1, 1, 1, 1, 1,
1.783937, 0.9939158, 0.9104654, 1, 1, 1, 1, 1,
1.794742, -0.2938802, -0.3939261, 1, 1, 1, 1, 1,
1.796919, -0.5751014, 3.446746, 1, 1, 1, 1, 1,
1.813723, -0.08532009, -0.1613637, 1, 1, 1, 1, 1,
1.838761, -1.007579, 1.060032, 1, 1, 1, 1, 1,
1.894609, 0.3260356, 0.1084728, 1, 1, 1, 1, 1,
1.895543, -0.07324795, 2.562112, 1, 1, 1, 1, 1,
1.904337, 0.7073027, 1.267001, 1, 1, 1, 1, 1,
1.921011, -0.6626015, 0.836906, 1, 1, 1, 1, 1,
1.933769, -0.2539414, 0.5236852, 1, 1, 1, 1, 1,
1.941856, -0.04177075, -0.2236359, 1, 1, 1, 1, 1,
1.996567, -0.2923384, 0.7977099, 0, 0, 1, 1, 1,
1.996869, 0.1060087, 2.298173, 1, 0, 0, 1, 1,
2.022369, 1.072227, 1.328173, 1, 0, 0, 1, 1,
2.040884, -0.9623429, 2.079295, 1, 0, 0, 1, 1,
2.090669, -0.2418354, 1.657697, 1, 0, 0, 1, 1,
2.122907, 0.4731313, 1.858348, 1, 0, 0, 1, 1,
2.129976, 1.439915, 0.4915744, 0, 0, 0, 1, 1,
2.133558, 0.9019687, 0.0297001, 0, 0, 0, 1, 1,
2.136084, -0.4956456, 1.288136, 0, 0, 0, 1, 1,
2.183946, -0.3050822, 0.1989673, 0, 0, 0, 1, 1,
2.205781, -0.3909181, 3.381213, 0, 0, 0, 1, 1,
2.213253, -1.69926, 3.996908, 0, 0, 0, 1, 1,
2.219226, 1.892243, 0.4282122, 0, 0, 0, 1, 1,
2.443272, -1.324182, 1.745568, 1, 1, 1, 1, 1,
2.472384, 0.2070187, 1.549063, 1, 1, 1, 1, 1,
2.566505, 1.15992, -0.714678, 1, 1, 1, 1, 1,
2.765594, 0.04703629, 2.535784, 1, 1, 1, 1, 1,
2.772225, -0.1974638, 2.189255, 1, 1, 1, 1, 1,
2.838127, 0.5754974, 2.119034, 1, 1, 1, 1, 1,
3.762696, -0.9477805, 3.120378, 1, 1, 1, 1, 1
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
var radius = 9.711001;
var distance = 34.10948;
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
mvMatrix.translate( -0.2946634, 0.04177856, 0.06919622 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.10948);
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
