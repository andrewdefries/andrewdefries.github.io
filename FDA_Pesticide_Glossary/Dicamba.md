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
-3.188173, 0.5228343, -1.315589, 1, 0, 0, 1,
-3.003825, 1.07164, -0.8559443, 1, 0.007843138, 0, 1,
-2.951747, 0.1785705, -0.8643184, 1, 0.01176471, 0, 1,
-2.732425, 0.7480894, -0.6389347, 1, 0.01960784, 0, 1,
-2.538969, 1.658148, -1.073694, 1, 0.02352941, 0, 1,
-2.505669, -1.207372, -2.699362, 1, 0.03137255, 0, 1,
-2.500557, -0.2548494, -0.1996527, 1, 0.03529412, 0, 1,
-2.442161, -1.485873, -1.662518, 1, 0.04313726, 0, 1,
-2.431276, 1.198921, -1.590124, 1, 0.04705882, 0, 1,
-2.379365, -0.3401505, -1.068728, 1, 0.05490196, 0, 1,
-2.339179, 0.7388319, -0.2919934, 1, 0.05882353, 0, 1,
-2.335883, 0.04008662, -1.842195, 1, 0.06666667, 0, 1,
-2.315287, 0.3862639, -1.513417, 1, 0.07058824, 0, 1,
-2.312531, -0.9206713, -2.718762, 1, 0.07843138, 0, 1,
-2.296055, 0.06154381, -2.647739, 1, 0.08235294, 0, 1,
-2.280128, -0.05443625, -1.106866, 1, 0.09019608, 0, 1,
-2.278837, -0.4024755, -1.994087, 1, 0.09411765, 0, 1,
-2.277356, -0.1355321, -2.212077, 1, 0.1019608, 0, 1,
-2.269616, 1.262423, -0.6426044, 1, 0.1098039, 0, 1,
-2.253054, -0.8204982, -1.679837, 1, 0.1137255, 0, 1,
-2.206167, 0.3725449, -1.548453, 1, 0.1215686, 0, 1,
-2.197249, -2.563083, -1.995973, 1, 0.1254902, 0, 1,
-2.188313, 0.09467041, -3.575483, 1, 0.1333333, 0, 1,
-2.187913, -2.938326, -3.525312, 1, 0.1372549, 0, 1,
-2.156615, -1.407347, -0.4128442, 1, 0.145098, 0, 1,
-2.109364, 0.4817958, -1.872491, 1, 0.1490196, 0, 1,
-2.098919, 0.4298458, -2.369469, 1, 0.1568628, 0, 1,
-2.081132, 1.132297, -2.394375, 1, 0.1607843, 0, 1,
-2.037496, -1.157063, -0.5766048, 1, 0.1686275, 0, 1,
-2.024053, -1.084687, -2.492865, 1, 0.172549, 0, 1,
-1.968285, -0.7302141, -3.710596, 1, 0.1803922, 0, 1,
-1.96085, -0.317476, -1.034743, 1, 0.1843137, 0, 1,
-1.954482, -1.264308, -2.214171, 1, 0.1921569, 0, 1,
-1.949241, -0.349198, -1.616895, 1, 0.1960784, 0, 1,
-1.935089, 0.3947558, -1.141485, 1, 0.2039216, 0, 1,
-1.928278, -0.1772123, -0.509712, 1, 0.2117647, 0, 1,
-1.907851, 0.9745898, -1.236384, 1, 0.2156863, 0, 1,
-1.881822, -2.401503, -2.948318, 1, 0.2235294, 0, 1,
-1.877618, -1.427978, -2.895847, 1, 0.227451, 0, 1,
-1.876357, -0.07364842, -2.225135, 1, 0.2352941, 0, 1,
-1.874884, -0.7500954, -1.278565, 1, 0.2392157, 0, 1,
-1.867323, 0.6321137, -1.14467, 1, 0.2470588, 0, 1,
-1.865054, 1.123455, -0.8447198, 1, 0.2509804, 0, 1,
-1.848046, -1.703315, -1.739026, 1, 0.2588235, 0, 1,
-1.844425, -0.1340562, -3.204293, 1, 0.2627451, 0, 1,
-1.844089, 2.243927, -0.9743689, 1, 0.2705882, 0, 1,
-1.815413, 0.3048713, -2.16599, 1, 0.2745098, 0, 1,
-1.811527, -1.165396, -1.727474, 1, 0.282353, 0, 1,
-1.784045, 1.42094, -2.693242, 1, 0.2862745, 0, 1,
-1.776525, 0.0008842645, -3.284538, 1, 0.2941177, 0, 1,
-1.776358, -0.9019975, -1.986357, 1, 0.3019608, 0, 1,
-1.758523, -0.7598985, -1.185194, 1, 0.3058824, 0, 1,
-1.751302, 0.2390601, -2.018854, 1, 0.3137255, 0, 1,
-1.746792, -0.1498115, -1.029776, 1, 0.3176471, 0, 1,
-1.745077, 0.3455085, -2.739886, 1, 0.3254902, 0, 1,
-1.739058, -1.146441, -3.48841, 1, 0.3294118, 0, 1,
-1.733511, 0.4849024, -0.2524992, 1, 0.3372549, 0, 1,
-1.725989, 1.11655, -1.234112, 1, 0.3411765, 0, 1,
-1.715746, -0.4922203, -4.325293, 1, 0.3490196, 0, 1,
-1.702125, -2.335016, -1.651654, 1, 0.3529412, 0, 1,
-1.690186, 0.7545119, 0.3305395, 1, 0.3607843, 0, 1,
-1.683082, -0.8587642, -2.505625, 1, 0.3647059, 0, 1,
-1.675717, -0.6657145, -2.576153, 1, 0.372549, 0, 1,
-1.659516, 0.3644173, -1.905513, 1, 0.3764706, 0, 1,
-1.656741, 1.29248, -2.182323, 1, 0.3843137, 0, 1,
-1.649914, 0.573172, -2.164155, 1, 0.3882353, 0, 1,
-1.648916, -0.01735268, -1.287583, 1, 0.3960784, 0, 1,
-1.634085, -0.04873233, -0.6147408, 1, 0.4039216, 0, 1,
-1.599422, -0.7553884, -2.521518, 1, 0.4078431, 0, 1,
-1.591852, -0.5698635, -0.02242891, 1, 0.4156863, 0, 1,
-1.587365, 0.7288071, 0.1688632, 1, 0.4196078, 0, 1,
-1.579296, 0.8198578, -1.562603, 1, 0.427451, 0, 1,
-1.570146, -1.064796, -1.764498, 1, 0.4313726, 0, 1,
-1.569786, -0.7300577, -0.7358716, 1, 0.4392157, 0, 1,
-1.542179, -1.392598, -1.743109, 1, 0.4431373, 0, 1,
-1.541724, -1.218654, -2.408324, 1, 0.4509804, 0, 1,
-1.529124, -0.6790223, -3.427747, 1, 0.454902, 0, 1,
-1.485177, 0.3442261, -2.935543, 1, 0.4627451, 0, 1,
-1.473307, -1.450436, -1.515687, 1, 0.4666667, 0, 1,
-1.458023, -0.4056363, -1.840458, 1, 0.4745098, 0, 1,
-1.457109, -0.193152, -1.315782, 1, 0.4784314, 0, 1,
-1.456017, 0.03975891, -1.976865, 1, 0.4862745, 0, 1,
-1.443569, 0.3611521, -0.325306, 1, 0.4901961, 0, 1,
-1.442814, 0.2926666, -2.691438, 1, 0.4980392, 0, 1,
-1.437443, 2.25548, -1.725779, 1, 0.5058824, 0, 1,
-1.436029, -0.6846647, -1.602205, 1, 0.509804, 0, 1,
-1.435245, -1.020484, -1.820746, 1, 0.5176471, 0, 1,
-1.424496, 0.5788771, -0.5152869, 1, 0.5215687, 0, 1,
-1.415074, 1.326554, -0.1357283, 1, 0.5294118, 0, 1,
-1.414702, 2.059242, -0.07313683, 1, 0.5333334, 0, 1,
-1.403683, -2.241043, -4.794487, 1, 0.5411765, 0, 1,
-1.401504, -0.497844, -1.456671, 1, 0.5450981, 0, 1,
-1.392484, -0.7426111, -0.1675117, 1, 0.5529412, 0, 1,
-1.39088, -0.955446, -2.113745, 1, 0.5568628, 0, 1,
-1.383034, 1.138796, -0.1831407, 1, 0.5647059, 0, 1,
-1.380251, -0.7938473, -0.5740698, 1, 0.5686275, 0, 1,
-1.370847, 0.2392277, -1.354197, 1, 0.5764706, 0, 1,
-1.367393, -0.1136617, 1.264902, 1, 0.5803922, 0, 1,
-1.360698, -0.7332134, -1.441448, 1, 0.5882353, 0, 1,
-1.357794, -0.8247325, -0.9660757, 1, 0.5921569, 0, 1,
-1.351314, -0.6831406, 0.2977881, 1, 0.6, 0, 1,
-1.345255, 0.4574302, -1.509513, 1, 0.6078432, 0, 1,
-1.338817, 3.000767, -1.506206, 1, 0.6117647, 0, 1,
-1.335792, -1.056868, -2.12805, 1, 0.6196079, 0, 1,
-1.31291, 0.1904003, -0.1449843, 1, 0.6235294, 0, 1,
-1.295901, 0.6329153, -2.559163, 1, 0.6313726, 0, 1,
-1.293047, 0.7972491, -0.9841508, 1, 0.6352941, 0, 1,
-1.278934, -1.227226, -3.555191, 1, 0.6431373, 0, 1,
-1.274557, -0.7713354, -2.236956, 1, 0.6470588, 0, 1,
-1.264116, 0.9213325, 0.5804849, 1, 0.654902, 0, 1,
-1.263974, -0.09153285, -0.9397184, 1, 0.6588235, 0, 1,
-1.247866, 1.354007, -0.06102241, 1, 0.6666667, 0, 1,
-1.241776, 0.4017157, -1.991725, 1, 0.6705883, 0, 1,
-1.228284, -1.091779, -0.6548333, 1, 0.6784314, 0, 1,
-1.217256, -0.5963686, -1.611723, 1, 0.682353, 0, 1,
-1.214689, 0.2431653, -2.25691, 1, 0.6901961, 0, 1,
-1.214569, 0.1956771, -0.4529686, 1, 0.6941177, 0, 1,
-1.213741, -0.6949449, -2.244459, 1, 0.7019608, 0, 1,
-1.205866, -1.57322, -0.2382139, 1, 0.7098039, 0, 1,
-1.205785, 0.2666267, -1.934983, 1, 0.7137255, 0, 1,
-1.20068, 0.5268916, 0.2155519, 1, 0.7215686, 0, 1,
-1.200367, 1.492929, 0.3626688, 1, 0.7254902, 0, 1,
-1.199612, -0.6454958, -1.967881, 1, 0.7333333, 0, 1,
-1.191333, 1.343353, -0.6713628, 1, 0.7372549, 0, 1,
-1.185309, 1.152646, -0.2032755, 1, 0.7450981, 0, 1,
-1.184471, 0.04551104, -2.765416, 1, 0.7490196, 0, 1,
-1.180223, 1.576174, 1.721016, 1, 0.7568628, 0, 1,
-1.176824, -1.612336, -2.667222, 1, 0.7607843, 0, 1,
-1.175949, -0.5503978, -1.337728, 1, 0.7686275, 0, 1,
-1.168861, 0.5947406, -0.5235404, 1, 0.772549, 0, 1,
-1.166497, 0.1683294, -0.7768704, 1, 0.7803922, 0, 1,
-1.1651, 2.016884, 0.4131055, 1, 0.7843137, 0, 1,
-1.146433, -0.9754532, -1.742661, 1, 0.7921569, 0, 1,
-1.137289, -0.5466559, -2.472322, 1, 0.7960784, 0, 1,
-1.13602, -0.9482911, -1.082363, 1, 0.8039216, 0, 1,
-1.132892, -0.03400021, -1.670549, 1, 0.8117647, 0, 1,
-1.123898, -0.8399395, -3.798691, 1, 0.8156863, 0, 1,
-1.12379, -0.3350232, -3.768037, 1, 0.8235294, 0, 1,
-1.121315, 0.6542664, -0.2250966, 1, 0.827451, 0, 1,
-1.120155, 1.044481, -1.045709, 1, 0.8352941, 0, 1,
-1.116761, 1.256126, -1.026333, 1, 0.8392157, 0, 1,
-1.115496, 1.915816, 0.9951801, 1, 0.8470588, 0, 1,
-1.10867, -0.6237363, -1.037384, 1, 0.8509804, 0, 1,
-1.105997, -0.5755863, -1.072086, 1, 0.8588235, 0, 1,
-1.102195, 0.1520066, -1.131073, 1, 0.8627451, 0, 1,
-1.100852, 0.2712448, -2.186659, 1, 0.8705882, 0, 1,
-1.094892, 0.7575552, -0.5260409, 1, 0.8745098, 0, 1,
-1.07769, -1.694553, -1.901391, 1, 0.8823529, 0, 1,
-1.075847, -1.032888, -2.562181, 1, 0.8862745, 0, 1,
-1.068007, -0.9537747, -3.109499, 1, 0.8941177, 0, 1,
-1.064815, -0.001650042, -1.217038, 1, 0.8980392, 0, 1,
-1.061217, -0.5853385, -1.958836, 1, 0.9058824, 0, 1,
-1.061063, -0.7542912, -1.310922, 1, 0.9137255, 0, 1,
-1.053213, -1.419002, -3.445058, 1, 0.9176471, 0, 1,
-1.051189, 0.1458757, -2.842633, 1, 0.9254902, 0, 1,
-1.048526, 1.772047, 0.3914898, 1, 0.9294118, 0, 1,
-1.046622, 0.1686522, -1.745209, 1, 0.9372549, 0, 1,
-1.039197, 1.050605, 0.5838092, 1, 0.9411765, 0, 1,
-1.035583, 0.6933613, -1.153464, 1, 0.9490196, 0, 1,
-1.033552, -0.8221092, -1.442452, 1, 0.9529412, 0, 1,
-1.028038, 0.1517719, -1.426296, 1, 0.9607843, 0, 1,
-1.01945, -0.6146179, -2.082785, 1, 0.9647059, 0, 1,
-1.015211, -1.626747, -1.616471, 1, 0.972549, 0, 1,
-1.014746, 0.06516283, -1.832056, 1, 0.9764706, 0, 1,
-1.01471, -0.07503603, -1.243123, 1, 0.9843137, 0, 1,
-1.014301, -0.9054124, -3.337166, 1, 0.9882353, 0, 1,
-1.007862, -0.1930664, -3.670936, 1, 0.9960784, 0, 1,
-1.003345, 0.5083023, -1.606188, 0.9960784, 1, 0, 1,
-0.9999403, 0.4563571, -1.308731, 0.9921569, 1, 0, 1,
-0.9980974, -0.7303915, -2.437671, 0.9843137, 1, 0, 1,
-0.9968009, -0.5445679, -2.440097, 0.9803922, 1, 0, 1,
-0.9860837, -0.4886871, 0.2503427, 0.972549, 1, 0, 1,
-0.9842418, -0.2163183, 0.5021893, 0.9686275, 1, 0, 1,
-0.9811689, -0.8995979, -2.595422, 0.9607843, 1, 0, 1,
-0.9803323, 1.428391, -2.34547, 0.9568627, 1, 0, 1,
-0.9798076, 1.327599, -0.5542794, 0.9490196, 1, 0, 1,
-0.9780293, -1.182968, -2.916612, 0.945098, 1, 0, 1,
-0.9762813, 1.237481, -1.197619, 0.9372549, 1, 0, 1,
-0.9714245, 0.271113, -0.1669169, 0.9333333, 1, 0, 1,
-0.9654878, -0.5021603, -3.931269, 0.9254902, 1, 0, 1,
-0.960263, 0.6377519, 0.3465191, 0.9215686, 1, 0, 1,
-0.9574767, 0.4165053, -0.09365992, 0.9137255, 1, 0, 1,
-0.9528545, 1.902591, -0.5517476, 0.9098039, 1, 0, 1,
-0.9508128, -0.2534958, -2.705489, 0.9019608, 1, 0, 1,
-0.9490507, 0.5999089, 0.2520071, 0.8941177, 1, 0, 1,
-0.9489528, -1.128479, -3.237871, 0.8901961, 1, 0, 1,
-0.9418234, 0.07131159, -1.702487, 0.8823529, 1, 0, 1,
-0.9304299, -0.8153664, -1.576727, 0.8784314, 1, 0, 1,
-0.9303599, 1.075013, -1.935741, 0.8705882, 1, 0, 1,
-0.9294673, -0.329748, -1.537069, 0.8666667, 1, 0, 1,
-0.9257401, -0.9429779, -1.772484, 0.8588235, 1, 0, 1,
-0.9246553, 0.2476212, -2.17569, 0.854902, 1, 0, 1,
-0.9245068, -0.6015796, -2.785246, 0.8470588, 1, 0, 1,
-0.9170493, -0.7012052, -2.25014, 0.8431373, 1, 0, 1,
-0.9164524, 0.5265431, -0.03164607, 0.8352941, 1, 0, 1,
-0.9151331, 0.8483952, -0.05734817, 0.8313726, 1, 0, 1,
-0.9097342, -2.81354, -3.207546, 0.8235294, 1, 0, 1,
-0.9062144, 0.0385277, -2.603054, 0.8196079, 1, 0, 1,
-0.8921302, -1.678629, -3.037906, 0.8117647, 1, 0, 1,
-0.8887035, 2.955557, -0.1117173, 0.8078431, 1, 0, 1,
-0.8875086, -0.1738119, -2.026885, 0.8, 1, 0, 1,
-0.8844896, 0.2561153, -2.849653, 0.7921569, 1, 0, 1,
-0.8811639, -0.4271548, -1.333568, 0.7882353, 1, 0, 1,
-0.8783455, -1.020953, -0.856052, 0.7803922, 1, 0, 1,
-0.8770594, 0.3860608, 0.2687739, 0.7764706, 1, 0, 1,
-0.8743813, -1.664187, -1.905053, 0.7686275, 1, 0, 1,
-0.8680853, -0.4357872, -2.567726, 0.7647059, 1, 0, 1,
-0.8626886, 0.133935, -1.86457, 0.7568628, 1, 0, 1,
-0.8607125, 0.5671114, -1.875204, 0.7529412, 1, 0, 1,
-0.8599284, 0.9722112, -0.01261258, 0.7450981, 1, 0, 1,
-0.8574286, 0.809141, -1.023093, 0.7411765, 1, 0, 1,
-0.8549103, 1.146895, -0.8596529, 0.7333333, 1, 0, 1,
-0.852679, -1.264036, -3.769742, 0.7294118, 1, 0, 1,
-0.8495422, -0.5207741, -3.719515, 0.7215686, 1, 0, 1,
-0.8469648, -0.7763505, -3.390669, 0.7176471, 1, 0, 1,
-0.8460138, -0.9387078, -2.588916, 0.7098039, 1, 0, 1,
-0.8420333, 1.023243, -0.1919944, 0.7058824, 1, 0, 1,
-0.84188, -0.1336475, -1.442883, 0.6980392, 1, 0, 1,
-0.8363552, -0.5748658, -1.676879, 0.6901961, 1, 0, 1,
-0.8360807, -0.04090004, -2.106214, 0.6862745, 1, 0, 1,
-0.8328913, -0.1412939, -3.184853, 0.6784314, 1, 0, 1,
-0.8311142, 3.080796, -1.225028, 0.6745098, 1, 0, 1,
-0.8311131, -0.8848614, -2.433436, 0.6666667, 1, 0, 1,
-0.8292252, 0.2650205, -0.3517779, 0.6627451, 1, 0, 1,
-0.8286867, -0.6155877, -2.398971, 0.654902, 1, 0, 1,
-0.828644, 0.6571282, -3.215321, 0.6509804, 1, 0, 1,
-0.8247634, -0.129443, 0.4484277, 0.6431373, 1, 0, 1,
-0.8241161, 0.3543933, -2.339095, 0.6392157, 1, 0, 1,
-0.8230256, -0.246092, -2.577011, 0.6313726, 1, 0, 1,
-0.8225017, -2.1811, -2.947056, 0.627451, 1, 0, 1,
-0.8175803, 0.7373119, -1.440224, 0.6196079, 1, 0, 1,
-0.816043, -2.942548, -3.683785, 0.6156863, 1, 0, 1,
-0.8152915, -0.7928259, -2.476921, 0.6078432, 1, 0, 1,
-0.8131622, 1.735548, -0.936954, 0.6039216, 1, 0, 1,
-0.8130596, 1.141933, 0.5099775, 0.5960785, 1, 0, 1,
-0.8079427, 0.6196901, 0.2343179, 0.5882353, 1, 0, 1,
-0.8029789, 0.1434989, 0.61472, 0.5843138, 1, 0, 1,
-0.8003364, 0.1294816, -0.1170228, 0.5764706, 1, 0, 1,
-0.7969531, -0.9669669, -3.044958, 0.572549, 1, 0, 1,
-0.7853652, -2.232034, -3.173545, 0.5647059, 1, 0, 1,
-0.783697, 1.008729, 0.04913181, 0.5607843, 1, 0, 1,
-0.7819819, 0.9601442, -0.3515649, 0.5529412, 1, 0, 1,
-0.7798651, 0.02088164, -0.7897615, 0.5490196, 1, 0, 1,
-0.7761052, 0.7266402, -0.1845962, 0.5411765, 1, 0, 1,
-0.7758497, -2.668962, -3.144606, 0.5372549, 1, 0, 1,
-0.7733212, -0.03988972, -1.507781, 0.5294118, 1, 0, 1,
-0.770951, 0.7798675, -2.397063, 0.5254902, 1, 0, 1,
-0.7706841, -1.00161, -2.536179, 0.5176471, 1, 0, 1,
-0.7687914, 0.3180088, 0.2140259, 0.5137255, 1, 0, 1,
-0.7651883, -1.120712, -3.033007, 0.5058824, 1, 0, 1,
-0.7647294, -0.2427332, -1.133836, 0.5019608, 1, 0, 1,
-0.7633629, -0.4525713, -1.258927, 0.4941176, 1, 0, 1,
-0.7600836, -1.82198, -4.463445, 0.4862745, 1, 0, 1,
-0.7578526, -0.05932228, -2.481367, 0.4823529, 1, 0, 1,
-0.7551393, 0.772084, -0.390117, 0.4745098, 1, 0, 1,
-0.7376768, -1.339969, -1.412062, 0.4705882, 1, 0, 1,
-0.731544, 1.536713, -0.4546997, 0.4627451, 1, 0, 1,
-0.7305083, 0.3948766, -1.568794, 0.4588235, 1, 0, 1,
-0.7293465, -0.1545071, -0.5177596, 0.4509804, 1, 0, 1,
-0.7275812, 2.470868, -0.4413396, 0.4470588, 1, 0, 1,
-0.7243427, -0.08588444, -1.056476, 0.4392157, 1, 0, 1,
-0.7239883, -0.8182333, -4.433987, 0.4352941, 1, 0, 1,
-0.7229344, -0.627574, -3.204782, 0.427451, 1, 0, 1,
-0.7223016, 1.241238, -0.6010473, 0.4235294, 1, 0, 1,
-0.7220047, 0.8136006, 0.2094879, 0.4156863, 1, 0, 1,
-0.7216454, 0.6645774, 1.263795, 0.4117647, 1, 0, 1,
-0.7124377, 0.6677998, -0.3387919, 0.4039216, 1, 0, 1,
-0.7115765, 0.06202744, -1.705194, 0.3960784, 1, 0, 1,
-0.7102441, 0.5809482, -1.920793, 0.3921569, 1, 0, 1,
-0.7073815, 0.01475988, -1.89401, 0.3843137, 1, 0, 1,
-0.7055267, -0.4440436, -2.045502, 0.3803922, 1, 0, 1,
-0.6990634, 0.9389951, 0.07413556, 0.372549, 1, 0, 1,
-0.6985116, 0.5706232, -0.7160121, 0.3686275, 1, 0, 1,
-0.6758294, 0.1769612, 1.763438, 0.3607843, 1, 0, 1,
-0.6752636, 0.1197894, -1.363686, 0.3568628, 1, 0, 1,
-0.6736439, -0.9981751, -2.573203, 0.3490196, 1, 0, 1,
-0.6718954, -0.3688703, -1.014151, 0.345098, 1, 0, 1,
-0.6701759, -0.6890556, -0.585398, 0.3372549, 1, 0, 1,
-0.6699238, -0.8896148, -2.920233, 0.3333333, 1, 0, 1,
-0.6675224, 0.1330147, -0.9903938, 0.3254902, 1, 0, 1,
-0.660444, -0.270926, -3.226744, 0.3215686, 1, 0, 1,
-0.6588717, -0.5934758, -2.214871, 0.3137255, 1, 0, 1,
-0.6550558, 0.1550805, -1.396783, 0.3098039, 1, 0, 1,
-0.6460828, 0.06250726, -1.941795, 0.3019608, 1, 0, 1,
-0.6423997, 0.4927536, -2.398461, 0.2941177, 1, 0, 1,
-0.6411589, -1.997412, -1.760799, 0.2901961, 1, 0, 1,
-0.6304194, 0.03934297, -2.053797, 0.282353, 1, 0, 1,
-0.626241, 1.609807, -1.229414, 0.2784314, 1, 0, 1,
-0.6253885, -0.3057225, -2.084863, 0.2705882, 1, 0, 1,
-0.6235378, 1.324711, 0.1114739, 0.2666667, 1, 0, 1,
-0.6202638, -0.8562358, -3.326815, 0.2588235, 1, 0, 1,
-0.6176963, 1.531145, -0.2653537, 0.254902, 1, 0, 1,
-0.6153693, 0.9699321, 1.056354, 0.2470588, 1, 0, 1,
-0.6152576, -1.065179, -1.335733, 0.2431373, 1, 0, 1,
-0.6132119, -0.4399604, 0.2833364, 0.2352941, 1, 0, 1,
-0.6083847, -0.958038, -1.853424, 0.2313726, 1, 0, 1,
-0.6071538, 1.158313, -1.134937, 0.2235294, 1, 0, 1,
-0.6063031, 1.096025, 1.151451, 0.2196078, 1, 0, 1,
-0.6061414, 0.1534144, -3.031019, 0.2117647, 1, 0, 1,
-0.6059904, 0.3461409, -0.003242291, 0.2078431, 1, 0, 1,
-0.602324, -0.2084288, -1.885223, 0.2, 1, 0, 1,
-0.6019791, -1.842457, -0.9427242, 0.1921569, 1, 0, 1,
-0.5993981, 1.938445, -0.6564351, 0.1882353, 1, 0, 1,
-0.5987502, -0.6065487, -2.58671, 0.1803922, 1, 0, 1,
-0.5852729, -0.5883264, -2.091371, 0.1764706, 1, 0, 1,
-0.5852722, 0.2182262, -0.4701344, 0.1686275, 1, 0, 1,
-0.5851485, -0.759058, 0.2946436, 0.1647059, 1, 0, 1,
-0.5850268, -0.4596813, -1.878741, 0.1568628, 1, 0, 1,
-0.5764652, -1.038289, -2.601548, 0.1529412, 1, 0, 1,
-0.5722448, 0.01720139, -0.8926401, 0.145098, 1, 0, 1,
-0.5668288, -0.4235372, -2.370867, 0.1411765, 1, 0, 1,
-0.5550328, -0.02377854, -2.580883, 0.1333333, 1, 0, 1,
-0.5547044, -0.1202051, -2.519893, 0.1294118, 1, 0, 1,
-0.5540081, -1.262613, -3.3528, 0.1215686, 1, 0, 1,
-0.5539764, -0.520749, -2.649474, 0.1176471, 1, 0, 1,
-0.5528073, -0.9847356, -2.363576, 0.1098039, 1, 0, 1,
-0.5515043, 0.3296443, -2.106631, 0.1058824, 1, 0, 1,
-0.5495715, -0.4743176, -1.490835, 0.09803922, 1, 0, 1,
-0.5495257, 0.8616526, 0.5726138, 0.09019608, 1, 0, 1,
-0.5407581, -0.7251838, -0.9815056, 0.08627451, 1, 0, 1,
-0.5392103, 0.3532392, -0.7218201, 0.07843138, 1, 0, 1,
-0.5390249, -1.947421, -3.161519, 0.07450981, 1, 0, 1,
-0.5352112, 1.122881, 0.3735842, 0.06666667, 1, 0, 1,
-0.5349377, -0.6730224, -3.212663, 0.0627451, 1, 0, 1,
-0.5310039, 0.4871632, -1.67331, 0.05490196, 1, 0, 1,
-0.5254978, -0.6752344, -2.468033, 0.05098039, 1, 0, 1,
-0.5254405, -0.08822946, -2.327965, 0.04313726, 1, 0, 1,
-0.5244002, 0.4066294, 1.151397, 0.03921569, 1, 0, 1,
-0.5224579, 0.01014782, -2.574217, 0.03137255, 1, 0, 1,
-0.5202734, -0.4976287, -0.7182446, 0.02745098, 1, 0, 1,
-0.5177045, 1.290838, -0.368891, 0.01960784, 1, 0, 1,
-0.5176234, 1.316986, -0.1454665, 0.01568628, 1, 0, 1,
-0.5170015, 0.8647086, -1.595397, 0.007843138, 1, 0, 1,
-0.5142131, -0.8882268, -4.023828, 0.003921569, 1, 0, 1,
-0.5119429, -1.088739, -4.010768, 0, 1, 0.003921569, 1,
-0.5066118, -0.9363564, -2.431654, 0, 1, 0.01176471, 1,
-0.5057204, -0.7972821, -5.287709, 0, 1, 0.01568628, 1,
-0.502516, 0.2845576, 0.4466686, 0, 1, 0.02352941, 1,
-0.5013235, 0.542786, 0.1176763, 0, 1, 0.02745098, 1,
-0.5000544, 0.4472785, 1.173643, 0, 1, 0.03529412, 1,
-0.4955889, 0.7771131, -0.7215061, 0, 1, 0.03921569, 1,
-0.482941, -1.082825, -3.37961, 0, 1, 0.04705882, 1,
-0.4783925, -1.631781, -2.418866, 0, 1, 0.05098039, 1,
-0.4782707, -0.3276155, -2.46309, 0, 1, 0.05882353, 1,
-0.472229, -1.249969, -4.216966, 0, 1, 0.0627451, 1,
-0.4695817, -1.696496, -3.600427, 0, 1, 0.07058824, 1,
-0.4690041, -0.4078774, -3.666212, 0, 1, 0.07450981, 1,
-0.4666222, -0.4586819, -3.100538, 0, 1, 0.08235294, 1,
-0.4663655, 1.493854, -2.283424, 0, 1, 0.08627451, 1,
-0.465996, -1.061439, -4.278922, 0, 1, 0.09411765, 1,
-0.4652137, 0.5137236, 1.715396, 0, 1, 0.1019608, 1,
-0.4639164, -0.6008107, -2.631524, 0, 1, 0.1058824, 1,
-0.4595568, 0.2785707, 0.06439923, 0, 1, 0.1137255, 1,
-0.4535515, -2.358557, -2.153473, 0, 1, 0.1176471, 1,
-0.4531684, 0.1748786, -0.6032333, 0, 1, 0.1254902, 1,
-0.4487854, 0.9105037, 0.6459353, 0, 1, 0.1294118, 1,
-0.4463483, 1.456043, -0.7956327, 0, 1, 0.1372549, 1,
-0.4399403, -0.6398823, -3.064509, 0, 1, 0.1411765, 1,
-0.4356639, 1.905272, -1.2369, 0, 1, 0.1490196, 1,
-0.4299647, -0.6689034, -1.132763, 0, 1, 0.1529412, 1,
-0.4238011, -1.365523, -2.224682, 0, 1, 0.1607843, 1,
-0.4229283, -0.3177164, -2.589402, 0, 1, 0.1647059, 1,
-0.4220108, -0.336139, -2.03094, 0, 1, 0.172549, 1,
-0.4215977, 0.8937738, 1.141239, 0, 1, 0.1764706, 1,
-0.4207209, -1.644646, -3.788927, 0, 1, 0.1843137, 1,
-0.4178523, -2.065615, -3.25472, 0, 1, 0.1882353, 1,
-0.4128065, 1.79992, -1.266078, 0, 1, 0.1960784, 1,
-0.4106787, -0.1436394, -1.925345, 0, 1, 0.2039216, 1,
-0.4101576, 1.125116, -1.320498, 0, 1, 0.2078431, 1,
-0.4083744, -0.4513324, -1.984311, 0, 1, 0.2156863, 1,
-0.4062024, -0.456605, -2.318881, 0, 1, 0.2196078, 1,
-0.4037532, 0.2145438, -2.011873, 0, 1, 0.227451, 1,
-0.3994968, 2.461172, -2.342292, 0, 1, 0.2313726, 1,
-0.399077, -0.03764564, -1.525206, 0, 1, 0.2392157, 1,
-0.3888774, -0.6812096, -4.837097, 0, 1, 0.2431373, 1,
-0.3850649, 0.7561184, -0.3458456, 0, 1, 0.2509804, 1,
-0.3804219, 0.9953285, -0.8386522, 0, 1, 0.254902, 1,
-0.3621328, 0.5756807, 1.226807, 0, 1, 0.2627451, 1,
-0.3598483, -1.683366, -3.119462, 0, 1, 0.2666667, 1,
-0.3573768, -1.008424, -1.991837, 0, 1, 0.2745098, 1,
-0.3545368, -1.040537, -4.444008, 0, 1, 0.2784314, 1,
-0.3526489, 1.557559, 0.3096744, 0, 1, 0.2862745, 1,
-0.3474111, 2.02765, -1.610943, 0, 1, 0.2901961, 1,
-0.3455602, 0.4766774, -0.7482495, 0, 1, 0.2980392, 1,
-0.3435248, -0.1262061, -2.27785, 0, 1, 0.3058824, 1,
-0.3412703, 1.097997, 0.4935905, 0, 1, 0.3098039, 1,
-0.3398498, 0.3850902, -0.4583144, 0, 1, 0.3176471, 1,
-0.3367124, 0.1215571, -1.240523, 0, 1, 0.3215686, 1,
-0.3361196, 1.412765, -0.5241835, 0, 1, 0.3294118, 1,
-0.3346732, -0.1140635, -3.088422, 0, 1, 0.3333333, 1,
-0.3335387, 0.6454654, -0.6138608, 0, 1, 0.3411765, 1,
-0.3319618, -1.128157, -2.488942, 0, 1, 0.345098, 1,
-0.3277887, -0.6960816, -2.240952, 0, 1, 0.3529412, 1,
-0.3249625, -1.430124, -2.919631, 0, 1, 0.3568628, 1,
-0.3244993, -1.063188, -2.267018, 0, 1, 0.3647059, 1,
-0.3233097, 0.3665857, -2.41075, 0, 1, 0.3686275, 1,
-0.3222545, -0.5145691, -2.807436, 0, 1, 0.3764706, 1,
-0.3222449, -1.178642, -1.815292, 0, 1, 0.3803922, 1,
-0.3141727, -0.1280188, -1.915176, 0, 1, 0.3882353, 1,
-0.3124799, 1.663098, 1.180238, 0, 1, 0.3921569, 1,
-0.3093984, -1.394739, -3.534764, 0, 1, 0.4, 1,
-0.3074579, -0.01424587, 1.408836, 0, 1, 0.4078431, 1,
-0.3056302, 0.3525304, -0.6559235, 0, 1, 0.4117647, 1,
-0.3044881, 0.09111788, -0.7010895, 0, 1, 0.4196078, 1,
-0.3034547, -0.5914618, -3.373999, 0, 1, 0.4235294, 1,
-0.3020753, 0.2254169, -0.3169346, 0, 1, 0.4313726, 1,
-0.2952656, 0.5265765, -1.310812, 0, 1, 0.4352941, 1,
-0.2782564, 0.7717217, -0.02949546, 0, 1, 0.4431373, 1,
-0.2768203, -0.2876358, -2.421184, 0, 1, 0.4470588, 1,
-0.2701936, -0.06067748, -2.273374, 0, 1, 0.454902, 1,
-0.2680594, -1.610286, -2.239773, 0, 1, 0.4588235, 1,
-0.2666878, 1.275451, -0.8522438, 0, 1, 0.4666667, 1,
-0.2635643, -0.4998812, -2.772361, 0, 1, 0.4705882, 1,
-0.2599184, -1.801847, -2.492467, 0, 1, 0.4784314, 1,
-0.2581279, 1.236428, -0.6769472, 0, 1, 0.4823529, 1,
-0.2562494, 2.039366, 0.2730767, 0, 1, 0.4901961, 1,
-0.2553488, 0.2228648, -1.854778, 0, 1, 0.4941176, 1,
-0.254622, -1.077822, -1.639725, 0, 1, 0.5019608, 1,
-0.248973, 0.6355922, -0.7478427, 0, 1, 0.509804, 1,
-0.2446876, 0.6948889, -1.734478, 0, 1, 0.5137255, 1,
-0.2332554, -1.304655, -0.288099, 0, 1, 0.5215687, 1,
-0.232801, -1.905311, -3.090729, 0, 1, 0.5254902, 1,
-0.2327964, 0.1098489, -0.566921, 0, 1, 0.5333334, 1,
-0.2325234, -0.7229084, -3.00722, 0, 1, 0.5372549, 1,
-0.2311282, -0.3722053, -2.887107, 0, 1, 0.5450981, 1,
-0.2300756, -1.264229, -2.493923, 0, 1, 0.5490196, 1,
-0.2294009, 0.3630331, -0.02921888, 0, 1, 0.5568628, 1,
-0.2288672, 0.7527486, -1.814908, 0, 1, 0.5607843, 1,
-0.2226916, -1.285342, -1.421216, 0, 1, 0.5686275, 1,
-0.2172751, -1.339151, -2.741489, 0, 1, 0.572549, 1,
-0.2158919, 0.07124165, -1.743206, 0, 1, 0.5803922, 1,
-0.2141194, 0.3643161, -1.066467, 0, 1, 0.5843138, 1,
-0.2071003, 0.9596648, 0.7384616, 0, 1, 0.5921569, 1,
-0.2067172, 0.1691906, 0.5397931, 0, 1, 0.5960785, 1,
-0.2066484, -0.402383, -3.065922, 0, 1, 0.6039216, 1,
-0.205517, 1.53506, 0.1067317, 0, 1, 0.6117647, 1,
-0.1981587, -0.1789157, -3.77671, 0, 1, 0.6156863, 1,
-0.1949798, -1.37002, -4.983718, 0, 1, 0.6235294, 1,
-0.1944939, 1.144647, -0.1091772, 0, 1, 0.627451, 1,
-0.1917931, -0.5063475, -3.570916, 0, 1, 0.6352941, 1,
-0.1884946, -0.8550251, -5.470096, 0, 1, 0.6392157, 1,
-0.187834, -1.008401, -0.434221, 0, 1, 0.6470588, 1,
-0.1838382, -0.1358074, -2.5528, 0, 1, 0.6509804, 1,
-0.1830313, 2.588667, -0.4864684, 0, 1, 0.6588235, 1,
-0.1818452, 1.09187, -0.07866745, 0, 1, 0.6627451, 1,
-0.1807847, 1.074669, -1.438428, 0, 1, 0.6705883, 1,
-0.179368, 0.6753046, 1.070386, 0, 1, 0.6745098, 1,
-0.1778732, -0.6341372, -3.345517, 0, 1, 0.682353, 1,
-0.174034, -1.344815, -3.439643, 0, 1, 0.6862745, 1,
-0.1737162, 1.042674, 0.02907361, 0, 1, 0.6941177, 1,
-0.1702395, -0.7535889, -3.146569, 0, 1, 0.7019608, 1,
-0.1701375, 2.393786, -0.3171259, 0, 1, 0.7058824, 1,
-0.1659296, -0.5550424, -3.202546, 0, 1, 0.7137255, 1,
-0.162027, -0.2441399, -1.908208, 0, 1, 0.7176471, 1,
-0.1617336, 0.6413543, 0.3740932, 0, 1, 0.7254902, 1,
-0.1580716, -0.01507738, -1.015687, 0, 1, 0.7294118, 1,
-0.1577935, 2.266639, 0.5360435, 0, 1, 0.7372549, 1,
-0.155809, 0.1956292, -1.889929, 0, 1, 0.7411765, 1,
-0.1507289, -0.4364495, -3.61076, 0, 1, 0.7490196, 1,
-0.1486643, -0.6156294, -2.48314, 0, 1, 0.7529412, 1,
-0.1469245, -2.051055, -2.086737, 0, 1, 0.7607843, 1,
-0.1401376, 0.3246134, -0.9397579, 0, 1, 0.7647059, 1,
-0.1329134, 0.01092251, -0.5323997, 0, 1, 0.772549, 1,
-0.1326424, -0.1935682, -2.75613, 0, 1, 0.7764706, 1,
-0.1274382, 0.3056239, -1.336501, 0, 1, 0.7843137, 1,
-0.127403, -1.376438, -4.090877, 0, 1, 0.7882353, 1,
-0.126372, -1.360168, -3.248307, 0, 1, 0.7960784, 1,
-0.125311, -0.122155, -1.348574, 0, 1, 0.8039216, 1,
-0.12412, -0.4192186, -3.3828, 0, 1, 0.8078431, 1,
-0.1224686, 0.5599214, -0.08126158, 0, 1, 0.8156863, 1,
-0.1211968, 0.8612503, -0.04502716, 0, 1, 0.8196079, 1,
-0.1199702, -0.6822413, -2.503231, 0, 1, 0.827451, 1,
-0.1182363, 0.0301864, -3.745471, 0, 1, 0.8313726, 1,
-0.1156816, -1.544576, -1.428092, 0, 1, 0.8392157, 1,
-0.1145089, -0.5951081, -3.242334, 0, 1, 0.8431373, 1,
-0.1144669, 1.003641, -2.02827, 0, 1, 0.8509804, 1,
-0.1101647, 0.8109033, 0.1274879, 0, 1, 0.854902, 1,
-0.1038702, -2.60793, -0.4063857, 0, 1, 0.8627451, 1,
-0.1030089, -0.9816861, -2.879898, 0, 1, 0.8666667, 1,
-0.1021946, 0.1340999, -1.463007, 0, 1, 0.8745098, 1,
-0.1014112, 1.643329, -1.539737, 0, 1, 0.8784314, 1,
-0.1010984, 0.458201, 1.196531, 0, 1, 0.8862745, 1,
-0.0994541, 0.4666918, 0.8608986, 0, 1, 0.8901961, 1,
-0.09684411, 0.07772446, -1.607581, 0, 1, 0.8980392, 1,
-0.09458525, -0.5261736, -3.465109, 0, 1, 0.9058824, 1,
-0.09450354, -0.6314051, -3.54853, 0, 1, 0.9098039, 1,
-0.09214395, 0.8795774, -2.096302, 0, 1, 0.9176471, 1,
-0.09194129, 0.3509528, 2.115618, 0, 1, 0.9215686, 1,
-0.0918921, -0.01973533, -1.371114, 0, 1, 0.9294118, 1,
-0.08340842, 0.2920156, 1.607049, 0, 1, 0.9333333, 1,
-0.08324236, 0.7099271, -1.077127, 0, 1, 0.9411765, 1,
-0.08289388, 0.2481994, 0.5227692, 0, 1, 0.945098, 1,
-0.08002092, -0.253446, -1.378227, 0, 1, 0.9529412, 1,
-0.0797933, 1.88755, -0.1009568, 0, 1, 0.9568627, 1,
-0.07805563, -0.5453293, -1.262794, 0, 1, 0.9647059, 1,
-0.07674278, 1.813179, -1.678596, 0, 1, 0.9686275, 1,
-0.0764471, 0.8664452, -1.215981, 0, 1, 0.9764706, 1,
-0.07632365, -1.423246, -4.134399, 0, 1, 0.9803922, 1,
-0.0714892, -0.1472701, -1.192254, 0, 1, 0.9882353, 1,
-0.06594772, 0.8876628, 0.6389971, 0, 1, 0.9921569, 1,
-0.06504622, 0.1914344, 0.3478054, 0, 1, 1, 1,
-0.05499499, 0.3940859, -1.326326, 0, 0.9921569, 1, 1,
-0.05327928, 1.107604, 1.822806, 0, 0.9882353, 1, 1,
-0.05131748, -0.9923183, -3.995333, 0, 0.9803922, 1, 1,
-0.04591823, -0.5362578, -4.670146, 0, 0.9764706, 1, 1,
-0.03762898, 1.508415, -0.3104202, 0, 0.9686275, 1, 1,
-0.03643814, 0.5535784, -0.3214838, 0, 0.9647059, 1, 1,
-0.03403394, -0.7956629, -2.366045, 0, 0.9568627, 1, 1,
-0.03396271, 0.1816302, 0.03160577, 0, 0.9529412, 1, 1,
-0.03389899, -0.6278861, -4.176158, 0, 0.945098, 1, 1,
-0.03341837, 0.04204593, -0.3279058, 0, 0.9411765, 1, 1,
-0.03073554, 0.7908552, 1.694527, 0, 0.9333333, 1, 1,
-0.02782005, -0.4268403, -1.881958, 0, 0.9294118, 1, 1,
-0.01549374, 0.4484983, -0.2014884, 0, 0.9215686, 1, 1,
-0.01263945, -0.9205968, -2.998996, 0, 0.9176471, 1, 1,
-0.01142163, -0.5838397, -3.466123, 0, 0.9098039, 1, 1,
-0.009360578, -0.5685984, -3.892961, 0, 0.9058824, 1, 1,
-0.009023094, -0.1163626, -2.050169, 0, 0.8980392, 1, 1,
-0.007136168, -0.2475116, -3.339224, 0, 0.8901961, 1, 1,
-0.005250184, 0.6569128, 0.9859328, 0, 0.8862745, 1, 1,
0.002259533, -0.1058055, 3.132756, 0, 0.8784314, 1, 1,
0.003249452, -1.126799, 2.103436, 0, 0.8745098, 1, 1,
0.004091758, 1.548208, 1.155325, 0, 0.8666667, 1, 1,
0.005771496, -0.4530935, 3.966424, 0, 0.8627451, 1, 1,
0.007837716, -0.9773059, 3.167769, 0, 0.854902, 1, 1,
0.01268258, 1.027759, 0.2017275, 0, 0.8509804, 1, 1,
0.01663177, -0.5681496, 4.376698, 0, 0.8431373, 1, 1,
0.01730014, -0.1007074, 2.660301, 0, 0.8392157, 1, 1,
0.01874979, 0.3156843, 0.5275266, 0, 0.8313726, 1, 1,
0.01886812, -0.007354269, 0.4833101, 0, 0.827451, 1, 1,
0.01898652, -0.6356762, 4.051748, 0, 0.8196079, 1, 1,
0.02197045, -1.414231, 1.985544, 0, 0.8156863, 1, 1,
0.02562461, 1.922679, -2.305134, 0, 0.8078431, 1, 1,
0.02777668, -2.326105, 2.649896, 0, 0.8039216, 1, 1,
0.03198209, 0.09405919, -1.226825, 0, 0.7960784, 1, 1,
0.03471975, 0.4345104, -0.506313, 0, 0.7882353, 1, 1,
0.03616437, 1.154627, 0.2191487, 0, 0.7843137, 1, 1,
0.0366853, -3.176489, 3.759247, 0, 0.7764706, 1, 1,
0.0367598, 0.4565713, 0.2672233, 0, 0.772549, 1, 1,
0.03809819, -0.1258708, 2.580864, 0, 0.7647059, 1, 1,
0.04262858, 0.5327544, 0.7189265, 0, 0.7607843, 1, 1,
0.04309833, 2.621447, 1.464783, 0, 0.7529412, 1, 1,
0.0432143, -1.3807, 2.81571, 0, 0.7490196, 1, 1,
0.05328954, 0.8262741, 0.6844344, 0, 0.7411765, 1, 1,
0.05471356, 0.6876251, -0.7609596, 0, 0.7372549, 1, 1,
0.05959771, 0.6053826, -1.161336, 0, 0.7294118, 1, 1,
0.08007346, -1.36858, 3.488575, 0, 0.7254902, 1, 1,
0.08078764, -0.9097921, 3.895317, 0, 0.7176471, 1, 1,
0.08591751, 1.216541, -1.178734, 0, 0.7137255, 1, 1,
0.08646961, 1.042023, 0.4963453, 0, 0.7058824, 1, 1,
0.08823296, 0.09393728, 2.282198, 0, 0.6980392, 1, 1,
0.08897162, 0.7620568, -0.9560843, 0, 0.6941177, 1, 1,
0.09254844, -1.833098, 2.104557, 0, 0.6862745, 1, 1,
0.09492747, 1.042319, 0.6255229, 0, 0.682353, 1, 1,
0.1000807, -0.01715671, 0.05422081, 0, 0.6745098, 1, 1,
0.1068689, -2.455195, 0.3283181, 0, 0.6705883, 1, 1,
0.1123326, 0.5720061, 0.6316779, 0, 0.6627451, 1, 1,
0.1194996, -1.084512, 1.996152, 0, 0.6588235, 1, 1,
0.1203479, 0.166408, 1.411156, 0, 0.6509804, 1, 1,
0.1214447, -0.747719, 4.083256, 0, 0.6470588, 1, 1,
0.1225416, -0.2147395, 2.450223, 0, 0.6392157, 1, 1,
0.1244474, 2.623027, 0.5157465, 0, 0.6352941, 1, 1,
0.1261006, 1.226833, 1.171467, 0, 0.627451, 1, 1,
0.1273332, -0.3972031, 2.42577, 0, 0.6235294, 1, 1,
0.1287865, 0.4829088, 1.515772, 0, 0.6156863, 1, 1,
0.1307291, -0.3693213, 2.040267, 0, 0.6117647, 1, 1,
0.1311908, -0.2290807, 2.559601, 0, 0.6039216, 1, 1,
0.1336104, 0.4483325, 0.7220224, 0, 0.5960785, 1, 1,
0.1438835, -0.218077, 3.562634, 0, 0.5921569, 1, 1,
0.1469572, -1.545073, 3.103515, 0, 0.5843138, 1, 1,
0.1493306, 0.04927805, 1.268445, 0, 0.5803922, 1, 1,
0.1503725, -1.107178, 1.642582, 0, 0.572549, 1, 1,
0.1505564, -0.07745972, 3.134925, 0, 0.5686275, 1, 1,
0.1521922, -0.2126922, 2.988204, 0, 0.5607843, 1, 1,
0.1556222, 0.7654487, 2.381516, 0, 0.5568628, 1, 1,
0.1574799, 0.4050277, -0.2395038, 0, 0.5490196, 1, 1,
0.1576308, 1.687375, 0.1193946, 0, 0.5450981, 1, 1,
0.1578473, -2.216903, 2.528586, 0, 0.5372549, 1, 1,
0.1634442, -1.117611, 2.947992, 0, 0.5333334, 1, 1,
0.1654037, 0.7210597, 0.4556267, 0, 0.5254902, 1, 1,
0.1659736, 0.5770476, -0.05935979, 0, 0.5215687, 1, 1,
0.1758628, -0.2779365, 0.9205813, 0, 0.5137255, 1, 1,
0.1770037, 0.1893924, 1.564305, 0, 0.509804, 1, 1,
0.1774771, -0.944512, 2.290603, 0, 0.5019608, 1, 1,
0.1777506, -0.6446213, 3.832124, 0, 0.4941176, 1, 1,
0.1779286, -0.8778923, 2.018257, 0, 0.4901961, 1, 1,
0.1786134, -2.0047, 2.558015, 0, 0.4823529, 1, 1,
0.1811427, -0.4638984, 2.852347, 0, 0.4784314, 1, 1,
0.1819772, 0.1423523, 1.389422, 0, 0.4705882, 1, 1,
0.1820573, 0.8220358, 0.7632078, 0, 0.4666667, 1, 1,
0.1879021, 0.8113416, 0.3336614, 0, 0.4588235, 1, 1,
0.1884108, -0.7250577, 2.892061, 0, 0.454902, 1, 1,
0.1905161, -0.3642178, 2.152765, 0, 0.4470588, 1, 1,
0.1921659, -1.106197, 3.283992, 0, 0.4431373, 1, 1,
0.1941312, -1.720257, 3.7545, 0, 0.4352941, 1, 1,
0.2006022, -1.521215, 3.516895, 0, 0.4313726, 1, 1,
0.2111904, 0.9573766, -0.3258948, 0, 0.4235294, 1, 1,
0.213651, -0.8119033, 4.115445, 0, 0.4196078, 1, 1,
0.2187749, -1.891961, 2.79158, 0, 0.4117647, 1, 1,
0.2192378, 0.5128568, 0.5693403, 0, 0.4078431, 1, 1,
0.2210356, -0.05111716, 1.972912, 0, 0.4, 1, 1,
0.2214384, 0.7075384, -0.874305, 0, 0.3921569, 1, 1,
0.2220284, 0.9253166, 0.9630706, 0, 0.3882353, 1, 1,
0.2248032, -0.2366017, 1.048805, 0, 0.3803922, 1, 1,
0.2297505, 0.08355231, 0.9342415, 0, 0.3764706, 1, 1,
0.2311729, 0.1304527, 1.220699, 0, 0.3686275, 1, 1,
0.240141, -0.1241505, 1.366192, 0, 0.3647059, 1, 1,
0.2407371, 0.1552728, -1.070042, 0, 0.3568628, 1, 1,
0.2408912, 1.182928, 0.4070798, 0, 0.3529412, 1, 1,
0.2430005, 0.8034921, 1.1637, 0, 0.345098, 1, 1,
0.2446438, 0.9283502, -0.0309375, 0, 0.3411765, 1, 1,
0.2454702, 1.726497, -0.04225634, 0, 0.3333333, 1, 1,
0.2462109, -0.3887948, 2.233783, 0, 0.3294118, 1, 1,
0.24702, -0.8326149, 4.02237, 0, 0.3215686, 1, 1,
0.2473128, -0.367745, 2.842969, 0, 0.3176471, 1, 1,
0.2479187, 1.262269, 0.156752, 0, 0.3098039, 1, 1,
0.2484448, -0.4839781, 1.230816, 0, 0.3058824, 1, 1,
0.2530307, 0.7163621, -0.3089216, 0, 0.2980392, 1, 1,
0.2540456, -0.6052437, 2.326679, 0, 0.2901961, 1, 1,
0.254647, -0.1766958, 3.231334, 0, 0.2862745, 1, 1,
0.2638461, -1.144192, 3.386075, 0, 0.2784314, 1, 1,
0.2660771, -1.005395, 1.771666, 0, 0.2745098, 1, 1,
0.2665018, 1.380022, 0.3290754, 0, 0.2666667, 1, 1,
0.2665185, 0.03448013, 1.722756, 0, 0.2627451, 1, 1,
0.266624, -1.00742, 2.807388, 0, 0.254902, 1, 1,
0.267848, -0.03376723, 2.446888, 0, 0.2509804, 1, 1,
0.2686945, 0.4056813, 1.719944, 0, 0.2431373, 1, 1,
0.2734384, -1.175959, 2.160746, 0, 0.2392157, 1, 1,
0.2758836, 1.674932, -0.9088745, 0, 0.2313726, 1, 1,
0.2764501, -1.308216, 3.531208, 0, 0.227451, 1, 1,
0.2767589, -0.09720316, 0.8549248, 0, 0.2196078, 1, 1,
0.280164, 2.173584, -0.8550916, 0, 0.2156863, 1, 1,
0.2841007, -0.9929301, 2.145705, 0, 0.2078431, 1, 1,
0.2869261, 0.9492298, 2.604342, 0, 0.2039216, 1, 1,
0.2937367, -0.07772288, 1.011631, 0, 0.1960784, 1, 1,
0.2943685, 1.05004, 1.943018, 0, 0.1882353, 1, 1,
0.2997437, -0.9170591, 1.684721, 0, 0.1843137, 1, 1,
0.3002062, 2.148862, -0.6538703, 0, 0.1764706, 1, 1,
0.3074782, -0.3215983, 1.879614, 0, 0.172549, 1, 1,
0.3086373, 0.6747344, 2.230018, 0, 0.1647059, 1, 1,
0.308845, -1.057374, 2.783476, 0, 0.1607843, 1, 1,
0.3093815, 0.9721438, 1.092829, 0, 0.1529412, 1, 1,
0.3108363, 0.6837344, 2.160164, 0, 0.1490196, 1, 1,
0.3119637, 1.047059, 0.15253, 0, 0.1411765, 1, 1,
0.3126056, 0.2757775, -0.3690872, 0, 0.1372549, 1, 1,
0.3128425, -1.159492, 2.544362, 0, 0.1294118, 1, 1,
0.3183371, 1.490698, 0.1858787, 0, 0.1254902, 1, 1,
0.3233017, 1.197157, 0.9269096, 0, 0.1176471, 1, 1,
0.3259755, -0.1920386, 0.4862505, 0, 0.1137255, 1, 1,
0.3291563, 0.8997618, 0.4281394, 0, 0.1058824, 1, 1,
0.3333796, 2.596156, 0.6045446, 0, 0.09803922, 1, 1,
0.3340081, 1.464676, -1.297836, 0, 0.09411765, 1, 1,
0.3357761, 0.2938046, -0.606849, 0, 0.08627451, 1, 1,
0.337814, -0.0279335, 2.318978, 0, 0.08235294, 1, 1,
0.3380115, -0.1357198, 1.651809, 0, 0.07450981, 1, 1,
0.3388548, -0.5587273, 4.771653, 0, 0.07058824, 1, 1,
0.3446256, 0.8991942, 1.264899, 0, 0.0627451, 1, 1,
0.3449616, -1.80059, 3.155217, 0, 0.05882353, 1, 1,
0.3450327, 0.6217576, 0.6248595, 0, 0.05098039, 1, 1,
0.3453177, -0.02907433, 1.288318, 0, 0.04705882, 1, 1,
0.3471632, -2.620671, 2.268556, 0, 0.03921569, 1, 1,
0.351046, -0.6310368, 3.997205, 0, 0.03529412, 1, 1,
0.3527456, -1.065229, 3.239355, 0, 0.02745098, 1, 1,
0.3550878, 0.168296, 0.4031099, 0, 0.02352941, 1, 1,
0.3562354, 1.41693, 0.7783121, 0, 0.01568628, 1, 1,
0.3671721, -0.7774654, 2.83399, 0, 0.01176471, 1, 1,
0.3715712, -1.120506, 1.558284, 0, 0.003921569, 1, 1,
0.3717841, -0.07954264, 2.075322, 0.003921569, 0, 1, 1,
0.3738158, -0.1793376, 2.495229, 0.007843138, 0, 1, 1,
0.3739298, 1.027864, 0.7109463, 0.01568628, 0, 1, 1,
0.3756213, -0.6144044, 3.452759, 0.01960784, 0, 1, 1,
0.3901274, -1.092999, 1.020909, 0.02745098, 0, 1, 1,
0.3914686, -0.4867132, 3.325277, 0.03137255, 0, 1, 1,
0.3919366, -1.438057, 3.542556, 0.03921569, 0, 1, 1,
0.3935431, 0.4841784, 0.3451895, 0.04313726, 0, 1, 1,
0.4001609, -0.5484902, 3.024391, 0.05098039, 0, 1, 1,
0.4057025, -0.2218324, 0.7058415, 0.05490196, 0, 1, 1,
0.4059708, 0.7969613, 0.9225349, 0.0627451, 0, 1, 1,
0.4065725, -0.4186943, 1.634321, 0.06666667, 0, 1, 1,
0.4066138, 0.1241618, 2.461632, 0.07450981, 0, 1, 1,
0.4085122, 0.731514, 3.253654, 0.07843138, 0, 1, 1,
0.4113396, -0.3938185, 2.153428, 0.08627451, 0, 1, 1,
0.4115353, 1.430819, 0.5647424, 0.09019608, 0, 1, 1,
0.4129682, -0.8858838, 4.353114, 0.09803922, 0, 1, 1,
0.4140926, -2.309289, 3.293134, 0.1058824, 0, 1, 1,
0.4161392, -0.2732826, 1.350029, 0.1098039, 0, 1, 1,
0.4190336, 1.084698, -0.3144218, 0.1176471, 0, 1, 1,
0.4201015, 1.224236, 0.4524284, 0.1215686, 0, 1, 1,
0.4230302, 1.334916, 2.728024, 0.1294118, 0, 1, 1,
0.4232011, 0.7686827, -0.3964832, 0.1333333, 0, 1, 1,
0.4235851, 1.847543, 0.09102394, 0.1411765, 0, 1, 1,
0.4240772, -2.096875, 2.262872, 0.145098, 0, 1, 1,
0.4291831, -1.382969, 1.856013, 0.1529412, 0, 1, 1,
0.4302705, 1.392745, 0.7620366, 0.1568628, 0, 1, 1,
0.4312078, -1.337981, 1.996868, 0.1647059, 0, 1, 1,
0.4316925, -0.6189156, 3.189608, 0.1686275, 0, 1, 1,
0.436558, 0.9040157, 0.9177576, 0.1764706, 0, 1, 1,
0.437574, 1.69828, 0.0843742, 0.1803922, 0, 1, 1,
0.4437337, -0.01885792, 2.647877, 0.1882353, 0, 1, 1,
0.4440888, 1.35632, -0.9668369, 0.1921569, 0, 1, 1,
0.4455853, 1.539774, 0.9861813, 0.2, 0, 1, 1,
0.4490309, 1.054971, 1.717404, 0.2078431, 0, 1, 1,
0.4578715, 0.7371438, 1.967084, 0.2117647, 0, 1, 1,
0.4593552, 1.64503, 0.5739908, 0.2196078, 0, 1, 1,
0.4596891, 1.614666, 1.277302, 0.2235294, 0, 1, 1,
0.4634517, 0.7519029, -1.663457, 0.2313726, 0, 1, 1,
0.4676408, -1.122513, 2.584878, 0.2352941, 0, 1, 1,
0.4683275, -1.10964, 2.576333, 0.2431373, 0, 1, 1,
0.4739811, 0.1474375, 1.300975, 0.2470588, 0, 1, 1,
0.4774458, -0.505321, 1.677498, 0.254902, 0, 1, 1,
0.4790071, 1.424602, 1.962289, 0.2588235, 0, 1, 1,
0.4887185, 2.70296, -0.194561, 0.2666667, 0, 1, 1,
0.4887609, 0.8357185, 0.8922586, 0.2705882, 0, 1, 1,
0.488849, 0.5408411, 1.863359, 0.2784314, 0, 1, 1,
0.4935704, 1.859975, 1.708522, 0.282353, 0, 1, 1,
0.4972407, 1.660014, -1.950078, 0.2901961, 0, 1, 1,
0.4981235, 0.9130621, 1.927497, 0.2941177, 0, 1, 1,
0.4989861, 3.36676, 0.2027811, 0.3019608, 0, 1, 1,
0.4995374, 1.425064, 0.9110564, 0.3098039, 0, 1, 1,
0.5008833, -1.199279, 3.443943, 0.3137255, 0, 1, 1,
0.5010534, -0.033089, 1.265817, 0.3215686, 0, 1, 1,
0.5011227, 0.5770112, 0.1631392, 0.3254902, 0, 1, 1,
0.501848, 0.6584856, -0.07090413, 0.3333333, 0, 1, 1,
0.5021533, 0.6091189, 0.2258483, 0.3372549, 0, 1, 1,
0.5066163, 0.2577884, 0.5822974, 0.345098, 0, 1, 1,
0.5068173, 1.087358, 0.8538222, 0.3490196, 0, 1, 1,
0.5081289, 0.1376994, 1.382065, 0.3568628, 0, 1, 1,
0.5139201, 1.36237, 0.6180522, 0.3607843, 0, 1, 1,
0.5148882, 1.843485, 0.03887438, 0.3686275, 0, 1, 1,
0.5218196, -0.457152, 1.462602, 0.372549, 0, 1, 1,
0.5251753, -1.648327, 1.824079, 0.3803922, 0, 1, 1,
0.5286289, 2.154418, -0.0925834, 0.3843137, 0, 1, 1,
0.5359359, -1.512437, 2.730649, 0.3921569, 0, 1, 1,
0.5374938, -0.2702245, 2.110755, 0.3960784, 0, 1, 1,
0.5421935, 0.6581871, 0.7940603, 0.4039216, 0, 1, 1,
0.5427451, 0.9921122, -2.33544, 0.4117647, 0, 1, 1,
0.5442348, -0.1394382, 2.066825, 0.4156863, 0, 1, 1,
0.5451104, -0.4325261, 2.496837, 0.4235294, 0, 1, 1,
0.5455184, -0.5619752, 2.585841, 0.427451, 0, 1, 1,
0.550265, -0.9458572, 1.05102, 0.4352941, 0, 1, 1,
0.5516929, 0.2804761, -0.7369512, 0.4392157, 0, 1, 1,
0.554345, 0.7093844, -0.8301188, 0.4470588, 0, 1, 1,
0.5581993, -1.85283, 3.681306, 0.4509804, 0, 1, 1,
0.5583184, 1.262352, 2.420069, 0.4588235, 0, 1, 1,
0.5699299, 0.1032957, 1.637269, 0.4627451, 0, 1, 1,
0.5730029, -1.026683, 1.954677, 0.4705882, 0, 1, 1,
0.5746629, 1.359215, 0.9435446, 0.4745098, 0, 1, 1,
0.5785698, -0.118408, 3.266329, 0.4823529, 0, 1, 1,
0.5797625, -0.2196232, 3.325061, 0.4862745, 0, 1, 1,
0.5800293, 0.09408797, 2.550194, 0.4941176, 0, 1, 1,
0.5840818, -0.643971, 1.486175, 0.5019608, 0, 1, 1,
0.5856571, 1.097609, -0.1956269, 0.5058824, 0, 1, 1,
0.5891708, -0.3089382, 3.050555, 0.5137255, 0, 1, 1,
0.6001891, 0.1547548, -0.6334279, 0.5176471, 0, 1, 1,
0.6024183, -0.06406719, 1.340375, 0.5254902, 0, 1, 1,
0.6106161, 0.2320076, 0.9418874, 0.5294118, 0, 1, 1,
0.6114481, -2.020757, 2.338462, 0.5372549, 0, 1, 1,
0.6155144, 0.5074511, 1.611664, 0.5411765, 0, 1, 1,
0.6157115, 0.8432202, 0.5345941, 0.5490196, 0, 1, 1,
0.6187236, 0.458371, 1.746973, 0.5529412, 0, 1, 1,
0.6235052, -2.202605, 1.006292, 0.5607843, 0, 1, 1,
0.6270041, 1.537434, 0.3367232, 0.5647059, 0, 1, 1,
0.6333386, -0.9180205, 0.1400275, 0.572549, 0, 1, 1,
0.6351451, 1.793042, 0.3302811, 0.5764706, 0, 1, 1,
0.6355752, -0.1233537, 1.815529, 0.5843138, 0, 1, 1,
0.6392331, 0.8192887, -1.236227, 0.5882353, 0, 1, 1,
0.6406701, -0.3829122, 1.503647, 0.5960785, 0, 1, 1,
0.6407381, -0.6565717, 1.844506, 0.6039216, 0, 1, 1,
0.643535, -0.03055079, 3.472096, 0.6078432, 0, 1, 1,
0.6454652, 0.829811, 0.7688966, 0.6156863, 0, 1, 1,
0.6468932, -1.484241, 3.37801, 0.6196079, 0, 1, 1,
0.6590585, 1.042462, 1.03914, 0.627451, 0, 1, 1,
0.667198, -0.464738, 3.226738, 0.6313726, 0, 1, 1,
0.6702769, 0.3964847, 1.703223, 0.6392157, 0, 1, 1,
0.6774041, -1.610938, 2.718634, 0.6431373, 0, 1, 1,
0.6823732, 2.479635, 1.307291, 0.6509804, 0, 1, 1,
0.6883925, 1.470024, -1.129426, 0.654902, 0, 1, 1,
0.6899017, 0.6601266, 1.016594, 0.6627451, 0, 1, 1,
0.6914835, 0.1832713, 2.516224, 0.6666667, 0, 1, 1,
0.6938986, 0.3884693, 0.2999588, 0.6745098, 0, 1, 1,
0.6945789, -0.6586306, 2.480191, 0.6784314, 0, 1, 1,
0.6971223, -0.1172284, 3.510709, 0.6862745, 0, 1, 1,
0.6981874, 0.08722463, 3.806348, 0.6901961, 0, 1, 1,
0.7011847, -1.33739, 2.009709, 0.6980392, 0, 1, 1,
0.7018193, -0.6492111, 2.306778, 0.7058824, 0, 1, 1,
0.7029685, 1.177269, 1.419064, 0.7098039, 0, 1, 1,
0.7088955, -0.1110795, 1.108774, 0.7176471, 0, 1, 1,
0.7091899, 2.428552, 0.5875493, 0.7215686, 0, 1, 1,
0.7107779, -1.131086, 3.506856, 0.7294118, 0, 1, 1,
0.7157202, 0.5682127, 0.9959678, 0.7333333, 0, 1, 1,
0.7166919, -2.422401, 3.00704, 0.7411765, 0, 1, 1,
0.7198356, 0.4214022, 0.9879616, 0.7450981, 0, 1, 1,
0.7267115, 0.3231945, 2.260906, 0.7529412, 0, 1, 1,
0.7309694, 0.3198537, 1.681383, 0.7568628, 0, 1, 1,
0.7358272, -0.476725, 2.830724, 0.7647059, 0, 1, 1,
0.7361825, -0.01599219, 2.0991, 0.7686275, 0, 1, 1,
0.7418669, 1.52591, 1.080662, 0.7764706, 0, 1, 1,
0.7450357, 0.1084045, 2.247374, 0.7803922, 0, 1, 1,
0.7470767, 0.385117, -1.466174, 0.7882353, 0, 1, 1,
0.75735, 0.9587933, 0.4311351, 0.7921569, 0, 1, 1,
0.7634499, 0.4212622, 1.980117, 0.8, 0, 1, 1,
0.7654566, 1.353003, 1.651902, 0.8078431, 0, 1, 1,
0.7785858, -0.7082, 3.007458, 0.8117647, 0, 1, 1,
0.7828823, 0.2466088, 2.132095, 0.8196079, 0, 1, 1,
0.7964897, -0.6520596, 3.710996, 0.8235294, 0, 1, 1,
0.7966277, 0.1082382, 1.733465, 0.8313726, 0, 1, 1,
0.8043367, 0.9940258, -0.3294096, 0.8352941, 0, 1, 1,
0.8072156, 0.7422475, -0.07553198, 0.8431373, 0, 1, 1,
0.8076679, 0.3867383, 1.127391, 0.8470588, 0, 1, 1,
0.811915, 1.650188, 0.1143337, 0.854902, 0, 1, 1,
0.8126691, 0.868537, 1.292819, 0.8588235, 0, 1, 1,
0.8145154, 1.090736, -0.7669455, 0.8666667, 0, 1, 1,
0.8168567, 0.5225864, 0.7105158, 0.8705882, 0, 1, 1,
0.8233078, -0.4076641, 0.8009487, 0.8784314, 0, 1, 1,
0.8234467, 0.7976878, -1.039171, 0.8823529, 0, 1, 1,
0.8250079, 2.518641, -2.460106, 0.8901961, 0, 1, 1,
0.8313316, -0.4246848, 1.990756, 0.8941177, 0, 1, 1,
0.835034, 0.919968, 0.3841788, 0.9019608, 0, 1, 1,
0.8370553, 0.9132181, 1.440997, 0.9098039, 0, 1, 1,
0.8418922, -0.3553278, 2.043875, 0.9137255, 0, 1, 1,
0.848878, -0.4314725, 2.77138, 0.9215686, 0, 1, 1,
0.8721402, -0.4981894, 2.355856, 0.9254902, 0, 1, 1,
0.8793395, -0.7727746, 2.218379, 0.9333333, 0, 1, 1,
0.8843578, -0.6093109, 2.584004, 0.9372549, 0, 1, 1,
0.8850068, 1.208023, 1.950044, 0.945098, 0, 1, 1,
0.8855666, -0.4849573, 2.244297, 0.9490196, 0, 1, 1,
0.8856091, 0.05991095, 3.466017, 0.9568627, 0, 1, 1,
0.88815, 0.3003592, 1.376513, 0.9607843, 0, 1, 1,
0.8907045, -1.290379, 2.501822, 0.9686275, 0, 1, 1,
0.8981486, 0.8782056, -0.4145241, 0.972549, 0, 1, 1,
0.9057519, 1.930184, 2.729119, 0.9803922, 0, 1, 1,
0.916478, -0.3761334, 1.537359, 0.9843137, 0, 1, 1,
0.9189704, 0.4053914, 0.4032927, 0.9921569, 0, 1, 1,
0.9190822, 1.316939, 0.769198, 0.9960784, 0, 1, 1,
0.9220567, -0.4182808, 2.051119, 1, 0, 0.9960784, 1,
0.9268933, 1.273224, 0.0420085, 1, 0, 0.9882353, 1,
0.9281232, -0.7899198, 0.9211072, 1, 0, 0.9843137, 1,
0.9282311, 0.5372567, 0.4285061, 1, 0, 0.9764706, 1,
0.9299455, 1.099287, 1.502264, 1, 0, 0.972549, 1,
0.9311373, -0.9386557, 2.467026, 1, 0, 0.9647059, 1,
0.9449014, 0.1160153, 2.167825, 1, 0, 0.9607843, 1,
0.9460037, -1.939283, 1.480041, 1, 0, 0.9529412, 1,
0.9489283, -1.412343, 3.004135, 1, 0, 0.9490196, 1,
0.9540352, 0.9730817, 0.008707057, 1, 0, 0.9411765, 1,
0.9543115, -0.4407939, 0.5572655, 1, 0, 0.9372549, 1,
0.955189, 1.376287, 1.025807, 1, 0, 0.9294118, 1,
0.9564766, 1.828346, -0.1839274, 1, 0, 0.9254902, 1,
0.9607642, -0.4264682, 3.892622, 1, 0, 0.9176471, 1,
0.9624518, 0.01275514, 0.1429183, 1, 0, 0.9137255, 1,
0.9657781, 0.9528618, 0.3009854, 1, 0, 0.9058824, 1,
0.9747518, -0.1816511, 1.017877, 1, 0, 0.9019608, 1,
0.9780956, 0.3474407, 2.502598, 1, 0, 0.8941177, 1,
0.9801947, 1.111699, -0.6763012, 1, 0, 0.8862745, 1,
0.9860541, -0.1811826, 2.195346, 1, 0, 0.8823529, 1,
0.9864026, 0.8752775, 1.529559, 1, 0, 0.8745098, 1,
0.9892375, -1.138309, 0.922385, 1, 0, 0.8705882, 1,
0.993926, 0.1397045, 0.9376837, 1, 0, 0.8627451, 1,
1.007614, 0.287187, -0.4041893, 1, 0, 0.8588235, 1,
1.013478, 0.3127388, 2.103177, 1, 0, 0.8509804, 1,
1.014974, -0.8837907, 2.866889, 1, 0, 0.8470588, 1,
1.017206, 2.01192, -0.7874866, 1, 0, 0.8392157, 1,
1.023796, -1.245102, 2.08542, 1, 0, 0.8352941, 1,
1.035246, 1.852759, -0.1878786, 1, 0, 0.827451, 1,
1.035798, 1.883273, 0.5637571, 1, 0, 0.8235294, 1,
1.043441, 0.3513767, 0.543689, 1, 0, 0.8156863, 1,
1.046977, -0.05429215, 1.989526, 1, 0, 0.8117647, 1,
1.052222, 0.4528156, -0.2553994, 1, 0, 0.8039216, 1,
1.054225, 0.7201858, 2.445908, 1, 0, 0.7960784, 1,
1.05782, -1.553864, 2.873372, 1, 0, 0.7921569, 1,
1.059576, 0.2917712, 3.200963, 1, 0, 0.7843137, 1,
1.073149, -0.7709175, 0.03932117, 1, 0, 0.7803922, 1,
1.075234, -1.127008, 1.959611, 1, 0, 0.772549, 1,
1.094495, -1.819342, 1.268933, 1, 0, 0.7686275, 1,
1.097165, 0.7821342, 1.885163, 1, 0, 0.7607843, 1,
1.097187, -0.8437772, 2.222231, 1, 0, 0.7568628, 1,
1.097251, -0.2486943, 0.7270117, 1, 0, 0.7490196, 1,
1.104279, -1.067774, 2.000207, 1, 0, 0.7450981, 1,
1.113276, 1.548854, 1.642629, 1, 0, 0.7372549, 1,
1.113286, 0.6105949, 0.342032, 1, 0, 0.7333333, 1,
1.114238, -0.4187013, 2.218306, 1, 0, 0.7254902, 1,
1.159941, -1.298396, 2.570858, 1, 0, 0.7215686, 1,
1.163304, -0.5868958, 1.07544, 1, 0, 0.7137255, 1,
1.166268, 0.3171483, 1.882704, 1, 0, 0.7098039, 1,
1.173834, 1.919696, 0.2594154, 1, 0, 0.7019608, 1,
1.173966, -0.696499, 1.52701, 1, 0, 0.6941177, 1,
1.182597, 0.04991928, 1.594072, 1, 0, 0.6901961, 1,
1.188174, -0.2272084, 3.384202, 1, 0, 0.682353, 1,
1.202059, -0.9050823, 2.994431, 1, 0, 0.6784314, 1,
1.211345, 0.9098287, 2.511095, 1, 0, 0.6705883, 1,
1.220753, 0.1673592, 0.6505563, 1, 0, 0.6666667, 1,
1.225374, -0.9250621, 1.773337, 1, 0, 0.6588235, 1,
1.230355, 0.8835341, -1.223321, 1, 0, 0.654902, 1,
1.230436, -0.9283686, 1.82523, 1, 0, 0.6470588, 1,
1.232312, 0.7816344, 0.05802589, 1, 0, 0.6431373, 1,
1.232446, 2.040053, 1.193473, 1, 0, 0.6352941, 1,
1.236234, -0.8829201, 2.760091, 1, 0, 0.6313726, 1,
1.238347, 2.188887, -0.836844, 1, 0, 0.6235294, 1,
1.241775, 0.7835074, 1.368342, 1, 0, 0.6196079, 1,
1.248325, 0.7102917, 1.929522, 1, 0, 0.6117647, 1,
1.250722, -0.6003672, 2.273267, 1, 0, 0.6078432, 1,
1.265541, 0.7430426, 1.188481, 1, 0, 0.6, 1,
1.265725, 0.5655295, 1.618331, 1, 0, 0.5921569, 1,
1.274852, 0.5602766, -0.4537776, 1, 0, 0.5882353, 1,
1.279225, 0.4622285, 0.330988, 1, 0, 0.5803922, 1,
1.280352, -0.1992001, 0.3987539, 1, 0, 0.5764706, 1,
1.282853, 0.4345711, 1.480546, 1, 0, 0.5686275, 1,
1.283095, -1.075635, 3.067486, 1, 0, 0.5647059, 1,
1.283713, 0.3769829, 1.483571, 1, 0, 0.5568628, 1,
1.291299, -1.379586, 2.292798, 1, 0, 0.5529412, 1,
1.29838, -0.06007401, 1.29231, 1, 0, 0.5450981, 1,
1.310892, 0.6888533, 0.6155239, 1, 0, 0.5411765, 1,
1.337677, 1.039873, -1.512262, 1, 0, 0.5333334, 1,
1.339872, -1.631705, 2.541035, 1, 0, 0.5294118, 1,
1.340745, -0.8984879, 1.578175, 1, 0, 0.5215687, 1,
1.351288, -0.4733657, 2.266332, 1, 0, 0.5176471, 1,
1.35468, 0.0281655, 1.755885, 1, 0, 0.509804, 1,
1.356673, 0.9951938, 1.866408, 1, 0, 0.5058824, 1,
1.358793, 1.332997, -1.346158, 1, 0, 0.4980392, 1,
1.364962, 1.051091, 0.4342804, 1, 0, 0.4901961, 1,
1.373531, 0.04333929, 2.109976, 1, 0, 0.4862745, 1,
1.375013, 1.031482, 1.763008, 1, 0, 0.4784314, 1,
1.377139, 1.153589, -0.8270108, 1, 0, 0.4745098, 1,
1.377585, 0.9764799, -0.8157726, 1, 0, 0.4666667, 1,
1.393891, -1.411214, 2.482096, 1, 0, 0.4627451, 1,
1.39503, -0.1973771, 3.297297, 1, 0, 0.454902, 1,
1.408524, 0.1580589, 1.012828, 1, 0, 0.4509804, 1,
1.420197, -0.2929215, 0.7917105, 1, 0, 0.4431373, 1,
1.421297, -0.2941276, 2.369425, 1, 0, 0.4392157, 1,
1.421534, 0.5690973, -0.43264, 1, 0, 0.4313726, 1,
1.431388, 3.695933, 0.472418, 1, 0, 0.427451, 1,
1.433619, 0.220654, 1.189787, 1, 0, 0.4196078, 1,
1.440597, -0.5640483, 0.3556026, 1, 0, 0.4156863, 1,
1.443064, 0.1287596, 1.006728, 1, 0, 0.4078431, 1,
1.451067, -1.168784, 1.862374, 1, 0, 0.4039216, 1,
1.455341, -0.2796343, 0.787897, 1, 0, 0.3960784, 1,
1.456414, 0.594784, 1.071764, 1, 0, 0.3882353, 1,
1.461033, -1.678519, 1.297349, 1, 0, 0.3843137, 1,
1.47639, -0.6253337, 1.614696, 1, 0, 0.3764706, 1,
1.484192, 0.8048707, 1.291209, 1, 0, 0.372549, 1,
1.497071, 0.2379321, 0.9405028, 1, 0, 0.3647059, 1,
1.501442, 0.5977001, 1.27522, 1, 0, 0.3607843, 1,
1.508608, -0.8073388, 2.173072, 1, 0, 0.3529412, 1,
1.521534, -0.7327729, 3.682272, 1, 0, 0.3490196, 1,
1.544371, 0.8885788, 2.118074, 1, 0, 0.3411765, 1,
1.545437, 1.645419, 1.325823, 1, 0, 0.3372549, 1,
1.548687, -1.617034, 2.710805, 1, 0, 0.3294118, 1,
1.558138, -0.203914, 1.895305, 1, 0, 0.3254902, 1,
1.56005, -0.4508519, 1.429432, 1, 0, 0.3176471, 1,
1.56633, 1.535808, 2.018143, 1, 0, 0.3137255, 1,
1.573576, -0.4316727, 2.450782, 1, 0, 0.3058824, 1,
1.584531, -0.7595774, 1.964248, 1, 0, 0.2980392, 1,
1.592276, 1.095242, 0.8334436, 1, 0, 0.2941177, 1,
1.605755, 0.08751534, 0.7875537, 1, 0, 0.2862745, 1,
1.618842, 0.7823395, 3.36039, 1, 0, 0.282353, 1,
1.645867, 0.385914, 1.720913, 1, 0, 0.2745098, 1,
1.649326, 0.1712594, 1.116379, 1, 0, 0.2705882, 1,
1.649958, 0.094461, 1.74575, 1, 0, 0.2627451, 1,
1.710685, 1.47775, 1.912965, 1, 0, 0.2588235, 1,
1.713167, -1.522051, 3.184497, 1, 0, 0.2509804, 1,
1.719564, -1.158311, -0.171004, 1, 0, 0.2470588, 1,
1.722897, 0.566956, 1.165752, 1, 0, 0.2392157, 1,
1.726876, -1.024355, 1.124142, 1, 0, 0.2352941, 1,
1.751739, 0.9936697, 1.776694, 1, 0, 0.227451, 1,
1.772566, 0.7622484, -0.318811, 1, 0, 0.2235294, 1,
1.777, 2.241366, 1.9738, 1, 0, 0.2156863, 1,
1.795944, -1.275588, 2.171481, 1, 0, 0.2117647, 1,
1.798837, -0.6546848, 3.74785, 1, 0, 0.2039216, 1,
1.812877, 1.95457, 0.8823012, 1, 0, 0.1960784, 1,
1.824769, 0.03927589, 2.25033, 1, 0, 0.1921569, 1,
1.845009, 0.4506102, 0.1627819, 1, 0, 0.1843137, 1,
1.846252, -1.610011, 2.411037, 1, 0, 0.1803922, 1,
1.867515, -0.7570307, 2.321682, 1, 0, 0.172549, 1,
1.882569, 1.165211, 0.5471902, 1, 0, 0.1686275, 1,
1.897708, 1.52373, 1.840523, 1, 0, 0.1607843, 1,
1.906588, -1.895069, 1.256376, 1, 0, 0.1568628, 1,
1.918997, -1.103578, 1.210138, 1, 0, 0.1490196, 1,
1.933599, 0.6022782, -0.3367862, 1, 0, 0.145098, 1,
1.947929, 0.02477546, 2.146458, 1, 0, 0.1372549, 1,
1.959936, -0.5318771, 2.981336, 1, 0, 0.1333333, 1,
1.962902, 0.1480739, 1.121784, 1, 0, 0.1254902, 1,
1.963337, 0.5945892, 0.8087489, 1, 0, 0.1215686, 1,
1.970125, -0.8434205, 1.843973, 1, 0, 0.1137255, 1,
2.097585, -0.5531259, 0.1976257, 1, 0, 0.1098039, 1,
2.114338, -1.103608, 2.647811, 1, 0, 0.1019608, 1,
2.14416, 0.6943915, 1.684107, 1, 0, 0.09411765, 1,
2.186185, 0.7274067, 2.219426, 1, 0, 0.09019608, 1,
2.210532, -0.2147884, 1.551134, 1, 0, 0.08235294, 1,
2.276583, -1.39021, -0.01024642, 1, 0, 0.07843138, 1,
2.282561, -1.685813, 1.700812, 1, 0, 0.07058824, 1,
2.288368, 1.227427, 0.9514129, 1, 0, 0.06666667, 1,
2.315236, 1.34495, -0.2952615, 1, 0, 0.05882353, 1,
2.335892, -1.125853, 1.273571, 1, 0, 0.05490196, 1,
2.463194, -1.039825, 2.171694, 1, 0, 0.04705882, 1,
2.67226, -0.7777137, 1.012592, 1, 0, 0.04313726, 1,
2.718211, 0.2145998, 1.576752, 1, 0, 0.03529412, 1,
2.845006, 0.08934104, 0.5263876, 1, 0, 0.03137255, 1,
2.911527, 0.130379, -1.011353, 1, 0, 0.02352941, 1,
2.932822, 1.297058, 1.804577, 1, 0, 0.01960784, 1,
3.212669, -0.779614, 2.630841, 1, 0, 0.01176471, 1,
3.365875, 0.7340501, 1.074262, 1, 0, 0.007843138, 1
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
0.08885109, -4.341364, -7.206072, 0, -0.5, 0.5, 0.5,
0.08885109, -4.341364, -7.206072, 1, -0.5, 0.5, 0.5,
0.08885109, -4.341364, -7.206072, 1, 1.5, 0.5, 0.5,
0.08885109, -4.341364, -7.206072, 0, 1.5, 0.5, 0.5
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
-4.299085, 0.2597218, -7.206072, 0, -0.5, 0.5, 0.5,
-4.299085, 0.2597218, -7.206072, 1, -0.5, 0.5, 0.5,
-4.299085, 0.2597218, -7.206072, 1, 1.5, 0.5, 0.5,
-4.299085, 0.2597218, -7.206072, 0, 1.5, 0.5, 0.5
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
-4.299085, -4.341364, -0.3492217, 0, -0.5, 0.5, 0.5,
-4.299085, -4.341364, -0.3492217, 1, -0.5, 0.5, 0.5,
-4.299085, -4.341364, -0.3492217, 1, 1.5, 0.5, 0.5,
-4.299085, -4.341364, -0.3492217, 0, 1.5, 0.5, 0.5
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
-3, -3.279575, -5.623723,
3, -3.279575, -5.623723,
-3, -3.279575, -5.623723,
-3, -3.45654, -5.887447,
-2, -3.279575, -5.623723,
-2, -3.45654, -5.887447,
-1, -3.279575, -5.623723,
-1, -3.45654, -5.887447,
0, -3.279575, -5.623723,
0, -3.45654, -5.887447,
1, -3.279575, -5.623723,
1, -3.45654, -5.887447,
2, -3.279575, -5.623723,
2, -3.45654, -5.887447,
3, -3.279575, -5.623723,
3, -3.45654, -5.887447
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
-3, -3.81047, -6.414897, 0, -0.5, 0.5, 0.5,
-3, -3.81047, -6.414897, 1, -0.5, 0.5, 0.5,
-3, -3.81047, -6.414897, 1, 1.5, 0.5, 0.5,
-3, -3.81047, -6.414897, 0, 1.5, 0.5, 0.5,
-2, -3.81047, -6.414897, 0, -0.5, 0.5, 0.5,
-2, -3.81047, -6.414897, 1, -0.5, 0.5, 0.5,
-2, -3.81047, -6.414897, 1, 1.5, 0.5, 0.5,
-2, -3.81047, -6.414897, 0, 1.5, 0.5, 0.5,
-1, -3.81047, -6.414897, 0, -0.5, 0.5, 0.5,
-1, -3.81047, -6.414897, 1, -0.5, 0.5, 0.5,
-1, -3.81047, -6.414897, 1, 1.5, 0.5, 0.5,
-1, -3.81047, -6.414897, 0, 1.5, 0.5, 0.5,
0, -3.81047, -6.414897, 0, -0.5, 0.5, 0.5,
0, -3.81047, -6.414897, 1, -0.5, 0.5, 0.5,
0, -3.81047, -6.414897, 1, 1.5, 0.5, 0.5,
0, -3.81047, -6.414897, 0, 1.5, 0.5, 0.5,
1, -3.81047, -6.414897, 0, -0.5, 0.5, 0.5,
1, -3.81047, -6.414897, 1, -0.5, 0.5, 0.5,
1, -3.81047, -6.414897, 1, 1.5, 0.5, 0.5,
1, -3.81047, -6.414897, 0, 1.5, 0.5, 0.5,
2, -3.81047, -6.414897, 0, -0.5, 0.5, 0.5,
2, -3.81047, -6.414897, 1, -0.5, 0.5, 0.5,
2, -3.81047, -6.414897, 1, 1.5, 0.5, 0.5,
2, -3.81047, -6.414897, 0, 1.5, 0.5, 0.5,
3, -3.81047, -6.414897, 0, -0.5, 0.5, 0.5,
3, -3.81047, -6.414897, 1, -0.5, 0.5, 0.5,
3, -3.81047, -6.414897, 1, 1.5, 0.5, 0.5,
3, -3.81047, -6.414897, 0, 1.5, 0.5, 0.5
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
-3.286484, -3, -5.623723,
-3.286484, 3, -5.623723,
-3.286484, -3, -5.623723,
-3.455251, -3, -5.887447,
-3.286484, -2, -5.623723,
-3.455251, -2, -5.887447,
-3.286484, -1, -5.623723,
-3.455251, -1, -5.887447,
-3.286484, 0, -5.623723,
-3.455251, 0, -5.887447,
-3.286484, 1, -5.623723,
-3.455251, 1, -5.887447,
-3.286484, 2, -5.623723,
-3.455251, 2, -5.887447,
-3.286484, 3, -5.623723,
-3.455251, 3, -5.887447
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
-3.792784, -3, -6.414897, 0, -0.5, 0.5, 0.5,
-3.792784, -3, -6.414897, 1, -0.5, 0.5, 0.5,
-3.792784, -3, -6.414897, 1, 1.5, 0.5, 0.5,
-3.792784, -3, -6.414897, 0, 1.5, 0.5, 0.5,
-3.792784, -2, -6.414897, 0, -0.5, 0.5, 0.5,
-3.792784, -2, -6.414897, 1, -0.5, 0.5, 0.5,
-3.792784, -2, -6.414897, 1, 1.5, 0.5, 0.5,
-3.792784, -2, -6.414897, 0, 1.5, 0.5, 0.5,
-3.792784, -1, -6.414897, 0, -0.5, 0.5, 0.5,
-3.792784, -1, -6.414897, 1, -0.5, 0.5, 0.5,
-3.792784, -1, -6.414897, 1, 1.5, 0.5, 0.5,
-3.792784, -1, -6.414897, 0, 1.5, 0.5, 0.5,
-3.792784, 0, -6.414897, 0, -0.5, 0.5, 0.5,
-3.792784, 0, -6.414897, 1, -0.5, 0.5, 0.5,
-3.792784, 0, -6.414897, 1, 1.5, 0.5, 0.5,
-3.792784, 0, -6.414897, 0, 1.5, 0.5, 0.5,
-3.792784, 1, -6.414897, 0, -0.5, 0.5, 0.5,
-3.792784, 1, -6.414897, 1, -0.5, 0.5, 0.5,
-3.792784, 1, -6.414897, 1, 1.5, 0.5, 0.5,
-3.792784, 1, -6.414897, 0, 1.5, 0.5, 0.5,
-3.792784, 2, -6.414897, 0, -0.5, 0.5, 0.5,
-3.792784, 2, -6.414897, 1, -0.5, 0.5, 0.5,
-3.792784, 2, -6.414897, 1, 1.5, 0.5, 0.5,
-3.792784, 2, -6.414897, 0, 1.5, 0.5, 0.5,
-3.792784, 3, -6.414897, 0, -0.5, 0.5, 0.5,
-3.792784, 3, -6.414897, 1, -0.5, 0.5, 0.5,
-3.792784, 3, -6.414897, 1, 1.5, 0.5, 0.5,
-3.792784, 3, -6.414897, 0, 1.5, 0.5, 0.5
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
-3.286484, -3.279575, -4,
-3.286484, -3.279575, 4,
-3.286484, -3.279575, -4,
-3.455251, -3.45654, -4,
-3.286484, -3.279575, -2,
-3.455251, -3.45654, -2,
-3.286484, -3.279575, 0,
-3.455251, -3.45654, 0,
-3.286484, -3.279575, 2,
-3.455251, -3.45654, 2,
-3.286484, -3.279575, 4,
-3.455251, -3.45654, 4
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
-3.792784, -3.81047, -4, 0, -0.5, 0.5, 0.5,
-3.792784, -3.81047, -4, 1, -0.5, 0.5, 0.5,
-3.792784, -3.81047, -4, 1, 1.5, 0.5, 0.5,
-3.792784, -3.81047, -4, 0, 1.5, 0.5, 0.5,
-3.792784, -3.81047, -2, 0, -0.5, 0.5, 0.5,
-3.792784, -3.81047, -2, 1, -0.5, 0.5, 0.5,
-3.792784, -3.81047, -2, 1, 1.5, 0.5, 0.5,
-3.792784, -3.81047, -2, 0, 1.5, 0.5, 0.5,
-3.792784, -3.81047, 0, 0, -0.5, 0.5, 0.5,
-3.792784, -3.81047, 0, 1, -0.5, 0.5, 0.5,
-3.792784, -3.81047, 0, 1, 1.5, 0.5, 0.5,
-3.792784, -3.81047, 0, 0, 1.5, 0.5, 0.5,
-3.792784, -3.81047, 2, 0, -0.5, 0.5, 0.5,
-3.792784, -3.81047, 2, 1, -0.5, 0.5, 0.5,
-3.792784, -3.81047, 2, 1, 1.5, 0.5, 0.5,
-3.792784, -3.81047, 2, 0, 1.5, 0.5, 0.5,
-3.792784, -3.81047, 4, 0, -0.5, 0.5, 0.5,
-3.792784, -3.81047, 4, 1, -0.5, 0.5, 0.5,
-3.792784, -3.81047, 4, 1, 1.5, 0.5, 0.5,
-3.792784, -3.81047, 4, 0, 1.5, 0.5, 0.5
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
-3.286484, -3.279575, -5.623723,
-3.286484, 3.799019, -5.623723,
-3.286484, -3.279575, 4.925279,
-3.286484, 3.799019, 4.925279,
-3.286484, -3.279575, -5.623723,
-3.286484, -3.279575, 4.925279,
-3.286484, 3.799019, -5.623723,
-3.286484, 3.799019, 4.925279,
-3.286484, -3.279575, -5.623723,
3.464186, -3.279575, -5.623723,
-3.286484, -3.279575, 4.925279,
3.464186, -3.279575, 4.925279,
-3.286484, 3.799019, -5.623723,
3.464186, 3.799019, -5.623723,
-3.286484, 3.799019, 4.925279,
3.464186, 3.799019, 4.925279,
3.464186, -3.279575, -5.623723,
3.464186, 3.799019, -5.623723,
3.464186, -3.279575, 4.925279,
3.464186, 3.799019, 4.925279,
3.464186, -3.279575, -5.623723,
3.464186, -3.279575, 4.925279,
3.464186, 3.799019, -5.623723,
3.464186, 3.799019, 4.925279
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
var radius = 7.68189;
var distance = 34.1776;
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
mvMatrix.translate( -0.08885109, -0.2597218, 0.3492217 );
mvMatrix.scale( 1.230368, 1.17337, 0.7873552 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.1776);
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
Dicamba<-read.table("Dicamba.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dicamba$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dicamba' not found
```

```r
y<-Dicamba$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dicamba' not found
```

```r
z<-Dicamba$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dicamba' not found
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
-3.188173, 0.5228343, -1.315589, 0, 0, 1, 1, 1,
-3.003825, 1.07164, -0.8559443, 1, 0, 0, 1, 1,
-2.951747, 0.1785705, -0.8643184, 1, 0, 0, 1, 1,
-2.732425, 0.7480894, -0.6389347, 1, 0, 0, 1, 1,
-2.538969, 1.658148, -1.073694, 1, 0, 0, 1, 1,
-2.505669, -1.207372, -2.699362, 1, 0, 0, 1, 1,
-2.500557, -0.2548494, -0.1996527, 0, 0, 0, 1, 1,
-2.442161, -1.485873, -1.662518, 0, 0, 0, 1, 1,
-2.431276, 1.198921, -1.590124, 0, 0, 0, 1, 1,
-2.379365, -0.3401505, -1.068728, 0, 0, 0, 1, 1,
-2.339179, 0.7388319, -0.2919934, 0, 0, 0, 1, 1,
-2.335883, 0.04008662, -1.842195, 0, 0, 0, 1, 1,
-2.315287, 0.3862639, -1.513417, 0, 0, 0, 1, 1,
-2.312531, -0.9206713, -2.718762, 1, 1, 1, 1, 1,
-2.296055, 0.06154381, -2.647739, 1, 1, 1, 1, 1,
-2.280128, -0.05443625, -1.106866, 1, 1, 1, 1, 1,
-2.278837, -0.4024755, -1.994087, 1, 1, 1, 1, 1,
-2.277356, -0.1355321, -2.212077, 1, 1, 1, 1, 1,
-2.269616, 1.262423, -0.6426044, 1, 1, 1, 1, 1,
-2.253054, -0.8204982, -1.679837, 1, 1, 1, 1, 1,
-2.206167, 0.3725449, -1.548453, 1, 1, 1, 1, 1,
-2.197249, -2.563083, -1.995973, 1, 1, 1, 1, 1,
-2.188313, 0.09467041, -3.575483, 1, 1, 1, 1, 1,
-2.187913, -2.938326, -3.525312, 1, 1, 1, 1, 1,
-2.156615, -1.407347, -0.4128442, 1, 1, 1, 1, 1,
-2.109364, 0.4817958, -1.872491, 1, 1, 1, 1, 1,
-2.098919, 0.4298458, -2.369469, 1, 1, 1, 1, 1,
-2.081132, 1.132297, -2.394375, 1, 1, 1, 1, 1,
-2.037496, -1.157063, -0.5766048, 0, 0, 1, 1, 1,
-2.024053, -1.084687, -2.492865, 1, 0, 0, 1, 1,
-1.968285, -0.7302141, -3.710596, 1, 0, 0, 1, 1,
-1.96085, -0.317476, -1.034743, 1, 0, 0, 1, 1,
-1.954482, -1.264308, -2.214171, 1, 0, 0, 1, 1,
-1.949241, -0.349198, -1.616895, 1, 0, 0, 1, 1,
-1.935089, 0.3947558, -1.141485, 0, 0, 0, 1, 1,
-1.928278, -0.1772123, -0.509712, 0, 0, 0, 1, 1,
-1.907851, 0.9745898, -1.236384, 0, 0, 0, 1, 1,
-1.881822, -2.401503, -2.948318, 0, 0, 0, 1, 1,
-1.877618, -1.427978, -2.895847, 0, 0, 0, 1, 1,
-1.876357, -0.07364842, -2.225135, 0, 0, 0, 1, 1,
-1.874884, -0.7500954, -1.278565, 0, 0, 0, 1, 1,
-1.867323, 0.6321137, -1.14467, 1, 1, 1, 1, 1,
-1.865054, 1.123455, -0.8447198, 1, 1, 1, 1, 1,
-1.848046, -1.703315, -1.739026, 1, 1, 1, 1, 1,
-1.844425, -0.1340562, -3.204293, 1, 1, 1, 1, 1,
-1.844089, 2.243927, -0.9743689, 1, 1, 1, 1, 1,
-1.815413, 0.3048713, -2.16599, 1, 1, 1, 1, 1,
-1.811527, -1.165396, -1.727474, 1, 1, 1, 1, 1,
-1.784045, 1.42094, -2.693242, 1, 1, 1, 1, 1,
-1.776525, 0.0008842645, -3.284538, 1, 1, 1, 1, 1,
-1.776358, -0.9019975, -1.986357, 1, 1, 1, 1, 1,
-1.758523, -0.7598985, -1.185194, 1, 1, 1, 1, 1,
-1.751302, 0.2390601, -2.018854, 1, 1, 1, 1, 1,
-1.746792, -0.1498115, -1.029776, 1, 1, 1, 1, 1,
-1.745077, 0.3455085, -2.739886, 1, 1, 1, 1, 1,
-1.739058, -1.146441, -3.48841, 1, 1, 1, 1, 1,
-1.733511, 0.4849024, -0.2524992, 0, 0, 1, 1, 1,
-1.725989, 1.11655, -1.234112, 1, 0, 0, 1, 1,
-1.715746, -0.4922203, -4.325293, 1, 0, 0, 1, 1,
-1.702125, -2.335016, -1.651654, 1, 0, 0, 1, 1,
-1.690186, 0.7545119, 0.3305395, 1, 0, 0, 1, 1,
-1.683082, -0.8587642, -2.505625, 1, 0, 0, 1, 1,
-1.675717, -0.6657145, -2.576153, 0, 0, 0, 1, 1,
-1.659516, 0.3644173, -1.905513, 0, 0, 0, 1, 1,
-1.656741, 1.29248, -2.182323, 0, 0, 0, 1, 1,
-1.649914, 0.573172, -2.164155, 0, 0, 0, 1, 1,
-1.648916, -0.01735268, -1.287583, 0, 0, 0, 1, 1,
-1.634085, -0.04873233, -0.6147408, 0, 0, 0, 1, 1,
-1.599422, -0.7553884, -2.521518, 0, 0, 0, 1, 1,
-1.591852, -0.5698635, -0.02242891, 1, 1, 1, 1, 1,
-1.587365, 0.7288071, 0.1688632, 1, 1, 1, 1, 1,
-1.579296, 0.8198578, -1.562603, 1, 1, 1, 1, 1,
-1.570146, -1.064796, -1.764498, 1, 1, 1, 1, 1,
-1.569786, -0.7300577, -0.7358716, 1, 1, 1, 1, 1,
-1.542179, -1.392598, -1.743109, 1, 1, 1, 1, 1,
-1.541724, -1.218654, -2.408324, 1, 1, 1, 1, 1,
-1.529124, -0.6790223, -3.427747, 1, 1, 1, 1, 1,
-1.485177, 0.3442261, -2.935543, 1, 1, 1, 1, 1,
-1.473307, -1.450436, -1.515687, 1, 1, 1, 1, 1,
-1.458023, -0.4056363, -1.840458, 1, 1, 1, 1, 1,
-1.457109, -0.193152, -1.315782, 1, 1, 1, 1, 1,
-1.456017, 0.03975891, -1.976865, 1, 1, 1, 1, 1,
-1.443569, 0.3611521, -0.325306, 1, 1, 1, 1, 1,
-1.442814, 0.2926666, -2.691438, 1, 1, 1, 1, 1,
-1.437443, 2.25548, -1.725779, 0, 0, 1, 1, 1,
-1.436029, -0.6846647, -1.602205, 1, 0, 0, 1, 1,
-1.435245, -1.020484, -1.820746, 1, 0, 0, 1, 1,
-1.424496, 0.5788771, -0.5152869, 1, 0, 0, 1, 1,
-1.415074, 1.326554, -0.1357283, 1, 0, 0, 1, 1,
-1.414702, 2.059242, -0.07313683, 1, 0, 0, 1, 1,
-1.403683, -2.241043, -4.794487, 0, 0, 0, 1, 1,
-1.401504, -0.497844, -1.456671, 0, 0, 0, 1, 1,
-1.392484, -0.7426111, -0.1675117, 0, 0, 0, 1, 1,
-1.39088, -0.955446, -2.113745, 0, 0, 0, 1, 1,
-1.383034, 1.138796, -0.1831407, 0, 0, 0, 1, 1,
-1.380251, -0.7938473, -0.5740698, 0, 0, 0, 1, 1,
-1.370847, 0.2392277, -1.354197, 0, 0, 0, 1, 1,
-1.367393, -0.1136617, 1.264902, 1, 1, 1, 1, 1,
-1.360698, -0.7332134, -1.441448, 1, 1, 1, 1, 1,
-1.357794, -0.8247325, -0.9660757, 1, 1, 1, 1, 1,
-1.351314, -0.6831406, 0.2977881, 1, 1, 1, 1, 1,
-1.345255, 0.4574302, -1.509513, 1, 1, 1, 1, 1,
-1.338817, 3.000767, -1.506206, 1, 1, 1, 1, 1,
-1.335792, -1.056868, -2.12805, 1, 1, 1, 1, 1,
-1.31291, 0.1904003, -0.1449843, 1, 1, 1, 1, 1,
-1.295901, 0.6329153, -2.559163, 1, 1, 1, 1, 1,
-1.293047, 0.7972491, -0.9841508, 1, 1, 1, 1, 1,
-1.278934, -1.227226, -3.555191, 1, 1, 1, 1, 1,
-1.274557, -0.7713354, -2.236956, 1, 1, 1, 1, 1,
-1.264116, 0.9213325, 0.5804849, 1, 1, 1, 1, 1,
-1.263974, -0.09153285, -0.9397184, 1, 1, 1, 1, 1,
-1.247866, 1.354007, -0.06102241, 1, 1, 1, 1, 1,
-1.241776, 0.4017157, -1.991725, 0, 0, 1, 1, 1,
-1.228284, -1.091779, -0.6548333, 1, 0, 0, 1, 1,
-1.217256, -0.5963686, -1.611723, 1, 0, 0, 1, 1,
-1.214689, 0.2431653, -2.25691, 1, 0, 0, 1, 1,
-1.214569, 0.1956771, -0.4529686, 1, 0, 0, 1, 1,
-1.213741, -0.6949449, -2.244459, 1, 0, 0, 1, 1,
-1.205866, -1.57322, -0.2382139, 0, 0, 0, 1, 1,
-1.205785, 0.2666267, -1.934983, 0, 0, 0, 1, 1,
-1.20068, 0.5268916, 0.2155519, 0, 0, 0, 1, 1,
-1.200367, 1.492929, 0.3626688, 0, 0, 0, 1, 1,
-1.199612, -0.6454958, -1.967881, 0, 0, 0, 1, 1,
-1.191333, 1.343353, -0.6713628, 0, 0, 0, 1, 1,
-1.185309, 1.152646, -0.2032755, 0, 0, 0, 1, 1,
-1.184471, 0.04551104, -2.765416, 1, 1, 1, 1, 1,
-1.180223, 1.576174, 1.721016, 1, 1, 1, 1, 1,
-1.176824, -1.612336, -2.667222, 1, 1, 1, 1, 1,
-1.175949, -0.5503978, -1.337728, 1, 1, 1, 1, 1,
-1.168861, 0.5947406, -0.5235404, 1, 1, 1, 1, 1,
-1.166497, 0.1683294, -0.7768704, 1, 1, 1, 1, 1,
-1.1651, 2.016884, 0.4131055, 1, 1, 1, 1, 1,
-1.146433, -0.9754532, -1.742661, 1, 1, 1, 1, 1,
-1.137289, -0.5466559, -2.472322, 1, 1, 1, 1, 1,
-1.13602, -0.9482911, -1.082363, 1, 1, 1, 1, 1,
-1.132892, -0.03400021, -1.670549, 1, 1, 1, 1, 1,
-1.123898, -0.8399395, -3.798691, 1, 1, 1, 1, 1,
-1.12379, -0.3350232, -3.768037, 1, 1, 1, 1, 1,
-1.121315, 0.6542664, -0.2250966, 1, 1, 1, 1, 1,
-1.120155, 1.044481, -1.045709, 1, 1, 1, 1, 1,
-1.116761, 1.256126, -1.026333, 0, 0, 1, 1, 1,
-1.115496, 1.915816, 0.9951801, 1, 0, 0, 1, 1,
-1.10867, -0.6237363, -1.037384, 1, 0, 0, 1, 1,
-1.105997, -0.5755863, -1.072086, 1, 0, 0, 1, 1,
-1.102195, 0.1520066, -1.131073, 1, 0, 0, 1, 1,
-1.100852, 0.2712448, -2.186659, 1, 0, 0, 1, 1,
-1.094892, 0.7575552, -0.5260409, 0, 0, 0, 1, 1,
-1.07769, -1.694553, -1.901391, 0, 0, 0, 1, 1,
-1.075847, -1.032888, -2.562181, 0, 0, 0, 1, 1,
-1.068007, -0.9537747, -3.109499, 0, 0, 0, 1, 1,
-1.064815, -0.001650042, -1.217038, 0, 0, 0, 1, 1,
-1.061217, -0.5853385, -1.958836, 0, 0, 0, 1, 1,
-1.061063, -0.7542912, -1.310922, 0, 0, 0, 1, 1,
-1.053213, -1.419002, -3.445058, 1, 1, 1, 1, 1,
-1.051189, 0.1458757, -2.842633, 1, 1, 1, 1, 1,
-1.048526, 1.772047, 0.3914898, 1, 1, 1, 1, 1,
-1.046622, 0.1686522, -1.745209, 1, 1, 1, 1, 1,
-1.039197, 1.050605, 0.5838092, 1, 1, 1, 1, 1,
-1.035583, 0.6933613, -1.153464, 1, 1, 1, 1, 1,
-1.033552, -0.8221092, -1.442452, 1, 1, 1, 1, 1,
-1.028038, 0.1517719, -1.426296, 1, 1, 1, 1, 1,
-1.01945, -0.6146179, -2.082785, 1, 1, 1, 1, 1,
-1.015211, -1.626747, -1.616471, 1, 1, 1, 1, 1,
-1.014746, 0.06516283, -1.832056, 1, 1, 1, 1, 1,
-1.01471, -0.07503603, -1.243123, 1, 1, 1, 1, 1,
-1.014301, -0.9054124, -3.337166, 1, 1, 1, 1, 1,
-1.007862, -0.1930664, -3.670936, 1, 1, 1, 1, 1,
-1.003345, 0.5083023, -1.606188, 1, 1, 1, 1, 1,
-0.9999403, 0.4563571, -1.308731, 0, 0, 1, 1, 1,
-0.9980974, -0.7303915, -2.437671, 1, 0, 0, 1, 1,
-0.9968009, -0.5445679, -2.440097, 1, 0, 0, 1, 1,
-0.9860837, -0.4886871, 0.2503427, 1, 0, 0, 1, 1,
-0.9842418, -0.2163183, 0.5021893, 1, 0, 0, 1, 1,
-0.9811689, -0.8995979, -2.595422, 1, 0, 0, 1, 1,
-0.9803323, 1.428391, -2.34547, 0, 0, 0, 1, 1,
-0.9798076, 1.327599, -0.5542794, 0, 0, 0, 1, 1,
-0.9780293, -1.182968, -2.916612, 0, 0, 0, 1, 1,
-0.9762813, 1.237481, -1.197619, 0, 0, 0, 1, 1,
-0.9714245, 0.271113, -0.1669169, 0, 0, 0, 1, 1,
-0.9654878, -0.5021603, -3.931269, 0, 0, 0, 1, 1,
-0.960263, 0.6377519, 0.3465191, 0, 0, 0, 1, 1,
-0.9574767, 0.4165053, -0.09365992, 1, 1, 1, 1, 1,
-0.9528545, 1.902591, -0.5517476, 1, 1, 1, 1, 1,
-0.9508128, -0.2534958, -2.705489, 1, 1, 1, 1, 1,
-0.9490507, 0.5999089, 0.2520071, 1, 1, 1, 1, 1,
-0.9489528, -1.128479, -3.237871, 1, 1, 1, 1, 1,
-0.9418234, 0.07131159, -1.702487, 1, 1, 1, 1, 1,
-0.9304299, -0.8153664, -1.576727, 1, 1, 1, 1, 1,
-0.9303599, 1.075013, -1.935741, 1, 1, 1, 1, 1,
-0.9294673, -0.329748, -1.537069, 1, 1, 1, 1, 1,
-0.9257401, -0.9429779, -1.772484, 1, 1, 1, 1, 1,
-0.9246553, 0.2476212, -2.17569, 1, 1, 1, 1, 1,
-0.9245068, -0.6015796, -2.785246, 1, 1, 1, 1, 1,
-0.9170493, -0.7012052, -2.25014, 1, 1, 1, 1, 1,
-0.9164524, 0.5265431, -0.03164607, 1, 1, 1, 1, 1,
-0.9151331, 0.8483952, -0.05734817, 1, 1, 1, 1, 1,
-0.9097342, -2.81354, -3.207546, 0, 0, 1, 1, 1,
-0.9062144, 0.0385277, -2.603054, 1, 0, 0, 1, 1,
-0.8921302, -1.678629, -3.037906, 1, 0, 0, 1, 1,
-0.8887035, 2.955557, -0.1117173, 1, 0, 0, 1, 1,
-0.8875086, -0.1738119, -2.026885, 1, 0, 0, 1, 1,
-0.8844896, 0.2561153, -2.849653, 1, 0, 0, 1, 1,
-0.8811639, -0.4271548, -1.333568, 0, 0, 0, 1, 1,
-0.8783455, -1.020953, -0.856052, 0, 0, 0, 1, 1,
-0.8770594, 0.3860608, 0.2687739, 0, 0, 0, 1, 1,
-0.8743813, -1.664187, -1.905053, 0, 0, 0, 1, 1,
-0.8680853, -0.4357872, -2.567726, 0, 0, 0, 1, 1,
-0.8626886, 0.133935, -1.86457, 0, 0, 0, 1, 1,
-0.8607125, 0.5671114, -1.875204, 0, 0, 0, 1, 1,
-0.8599284, 0.9722112, -0.01261258, 1, 1, 1, 1, 1,
-0.8574286, 0.809141, -1.023093, 1, 1, 1, 1, 1,
-0.8549103, 1.146895, -0.8596529, 1, 1, 1, 1, 1,
-0.852679, -1.264036, -3.769742, 1, 1, 1, 1, 1,
-0.8495422, -0.5207741, -3.719515, 1, 1, 1, 1, 1,
-0.8469648, -0.7763505, -3.390669, 1, 1, 1, 1, 1,
-0.8460138, -0.9387078, -2.588916, 1, 1, 1, 1, 1,
-0.8420333, 1.023243, -0.1919944, 1, 1, 1, 1, 1,
-0.84188, -0.1336475, -1.442883, 1, 1, 1, 1, 1,
-0.8363552, -0.5748658, -1.676879, 1, 1, 1, 1, 1,
-0.8360807, -0.04090004, -2.106214, 1, 1, 1, 1, 1,
-0.8328913, -0.1412939, -3.184853, 1, 1, 1, 1, 1,
-0.8311142, 3.080796, -1.225028, 1, 1, 1, 1, 1,
-0.8311131, -0.8848614, -2.433436, 1, 1, 1, 1, 1,
-0.8292252, 0.2650205, -0.3517779, 1, 1, 1, 1, 1,
-0.8286867, -0.6155877, -2.398971, 0, 0, 1, 1, 1,
-0.828644, 0.6571282, -3.215321, 1, 0, 0, 1, 1,
-0.8247634, -0.129443, 0.4484277, 1, 0, 0, 1, 1,
-0.8241161, 0.3543933, -2.339095, 1, 0, 0, 1, 1,
-0.8230256, -0.246092, -2.577011, 1, 0, 0, 1, 1,
-0.8225017, -2.1811, -2.947056, 1, 0, 0, 1, 1,
-0.8175803, 0.7373119, -1.440224, 0, 0, 0, 1, 1,
-0.816043, -2.942548, -3.683785, 0, 0, 0, 1, 1,
-0.8152915, -0.7928259, -2.476921, 0, 0, 0, 1, 1,
-0.8131622, 1.735548, -0.936954, 0, 0, 0, 1, 1,
-0.8130596, 1.141933, 0.5099775, 0, 0, 0, 1, 1,
-0.8079427, 0.6196901, 0.2343179, 0, 0, 0, 1, 1,
-0.8029789, 0.1434989, 0.61472, 0, 0, 0, 1, 1,
-0.8003364, 0.1294816, -0.1170228, 1, 1, 1, 1, 1,
-0.7969531, -0.9669669, -3.044958, 1, 1, 1, 1, 1,
-0.7853652, -2.232034, -3.173545, 1, 1, 1, 1, 1,
-0.783697, 1.008729, 0.04913181, 1, 1, 1, 1, 1,
-0.7819819, 0.9601442, -0.3515649, 1, 1, 1, 1, 1,
-0.7798651, 0.02088164, -0.7897615, 1, 1, 1, 1, 1,
-0.7761052, 0.7266402, -0.1845962, 1, 1, 1, 1, 1,
-0.7758497, -2.668962, -3.144606, 1, 1, 1, 1, 1,
-0.7733212, -0.03988972, -1.507781, 1, 1, 1, 1, 1,
-0.770951, 0.7798675, -2.397063, 1, 1, 1, 1, 1,
-0.7706841, -1.00161, -2.536179, 1, 1, 1, 1, 1,
-0.7687914, 0.3180088, 0.2140259, 1, 1, 1, 1, 1,
-0.7651883, -1.120712, -3.033007, 1, 1, 1, 1, 1,
-0.7647294, -0.2427332, -1.133836, 1, 1, 1, 1, 1,
-0.7633629, -0.4525713, -1.258927, 1, 1, 1, 1, 1,
-0.7600836, -1.82198, -4.463445, 0, 0, 1, 1, 1,
-0.7578526, -0.05932228, -2.481367, 1, 0, 0, 1, 1,
-0.7551393, 0.772084, -0.390117, 1, 0, 0, 1, 1,
-0.7376768, -1.339969, -1.412062, 1, 0, 0, 1, 1,
-0.731544, 1.536713, -0.4546997, 1, 0, 0, 1, 1,
-0.7305083, 0.3948766, -1.568794, 1, 0, 0, 1, 1,
-0.7293465, -0.1545071, -0.5177596, 0, 0, 0, 1, 1,
-0.7275812, 2.470868, -0.4413396, 0, 0, 0, 1, 1,
-0.7243427, -0.08588444, -1.056476, 0, 0, 0, 1, 1,
-0.7239883, -0.8182333, -4.433987, 0, 0, 0, 1, 1,
-0.7229344, -0.627574, -3.204782, 0, 0, 0, 1, 1,
-0.7223016, 1.241238, -0.6010473, 0, 0, 0, 1, 1,
-0.7220047, 0.8136006, 0.2094879, 0, 0, 0, 1, 1,
-0.7216454, 0.6645774, 1.263795, 1, 1, 1, 1, 1,
-0.7124377, 0.6677998, -0.3387919, 1, 1, 1, 1, 1,
-0.7115765, 0.06202744, -1.705194, 1, 1, 1, 1, 1,
-0.7102441, 0.5809482, -1.920793, 1, 1, 1, 1, 1,
-0.7073815, 0.01475988, -1.89401, 1, 1, 1, 1, 1,
-0.7055267, -0.4440436, -2.045502, 1, 1, 1, 1, 1,
-0.6990634, 0.9389951, 0.07413556, 1, 1, 1, 1, 1,
-0.6985116, 0.5706232, -0.7160121, 1, 1, 1, 1, 1,
-0.6758294, 0.1769612, 1.763438, 1, 1, 1, 1, 1,
-0.6752636, 0.1197894, -1.363686, 1, 1, 1, 1, 1,
-0.6736439, -0.9981751, -2.573203, 1, 1, 1, 1, 1,
-0.6718954, -0.3688703, -1.014151, 1, 1, 1, 1, 1,
-0.6701759, -0.6890556, -0.585398, 1, 1, 1, 1, 1,
-0.6699238, -0.8896148, -2.920233, 1, 1, 1, 1, 1,
-0.6675224, 0.1330147, -0.9903938, 1, 1, 1, 1, 1,
-0.660444, -0.270926, -3.226744, 0, 0, 1, 1, 1,
-0.6588717, -0.5934758, -2.214871, 1, 0, 0, 1, 1,
-0.6550558, 0.1550805, -1.396783, 1, 0, 0, 1, 1,
-0.6460828, 0.06250726, -1.941795, 1, 0, 0, 1, 1,
-0.6423997, 0.4927536, -2.398461, 1, 0, 0, 1, 1,
-0.6411589, -1.997412, -1.760799, 1, 0, 0, 1, 1,
-0.6304194, 0.03934297, -2.053797, 0, 0, 0, 1, 1,
-0.626241, 1.609807, -1.229414, 0, 0, 0, 1, 1,
-0.6253885, -0.3057225, -2.084863, 0, 0, 0, 1, 1,
-0.6235378, 1.324711, 0.1114739, 0, 0, 0, 1, 1,
-0.6202638, -0.8562358, -3.326815, 0, 0, 0, 1, 1,
-0.6176963, 1.531145, -0.2653537, 0, 0, 0, 1, 1,
-0.6153693, 0.9699321, 1.056354, 0, 0, 0, 1, 1,
-0.6152576, -1.065179, -1.335733, 1, 1, 1, 1, 1,
-0.6132119, -0.4399604, 0.2833364, 1, 1, 1, 1, 1,
-0.6083847, -0.958038, -1.853424, 1, 1, 1, 1, 1,
-0.6071538, 1.158313, -1.134937, 1, 1, 1, 1, 1,
-0.6063031, 1.096025, 1.151451, 1, 1, 1, 1, 1,
-0.6061414, 0.1534144, -3.031019, 1, 1, 1, 1, 1,
-0.6059904, 0.3461409, -0.003242291, 1, 1, 1, 1, 1,
-0.602324, -0.2084288, -1.885223, 1, 1, 1, 1, 1,
-0.6019791, -1.842457, -0.9427242, 1, 1, 1, 1, 1,
-0.5993981, 1.938445, -0.6564351, 1, 1, 1, 1, 1,
-0.5987502, -0.6065487, -2.58671, 1, 1, 1, 1, 1,
-0.5852729, -0.5883264, -2.091371, 1, 1, 1, 1, 1,
-0.5852722, 0.2182262, -0.4701344, 1, 1, 1, 1, 1,
-0.5851485, -0.759058, 0.2946436, 1, 1, 1, 1, 1,
-0.5850268, -0.4596813, -1.878741, 1, 1, 1, 1, 1,
-0.5764652, -1.038289, -2.601548, 0, 0, 1, 1, 1,
-0.5722448, 0.01720139, -0.8926401, 1, 0, 0, 1, 1,
-0.5668288, -0.4235372, -2.370867, 1, 0, 0, 1, 1,
-0.5550328, -0.02377854, -2.580883, 1, 0, 0, 1, 1,
-0.5547044, -0.1202051, -2.519893, 1, 0, 0, 1, 1,
-0.5540081, -1.262613, -3.3528, 1, 0, 0, 1, 1,
-0.5539764, -0.520749, -2.649474, 0, 0, 0, 1, 1,
-0.5528073, -0.9847356, -2.363576, 0, 0, 0, 1, 1,
-0.5515043, 0.3296443, -2.106631, 0, 0, 0, 1, 1,
-0.5495715, -0.4743176, -1.490835, 0, 0, 0, 1, 1,
-0.5495257, 0.8616526, 0.5726138, 0, 0, 0, 1, 1,
-0.5407581, -0.7251838, -0.9815056, 0, 0, 0, 1, 1,
-0.5392103, 0.3532392, -0.7218201, 0, 0, 0, 1, 1,
-0.5390249, -1.947421, -3.161519, 1, 1, 1, 1, 1,
-0.5352112, 1.122881, 0.3735842, 1, 1, 1, 1, 1,
-0.5349377, -0.6730224, -3.212663, 1, 1, 1, 1, 1,
-0.5310039, 0.4871632, -1.67331, 1, 1, 1, 1, 1,
-0.5254978, -0.6752344, -2.468033, 1, 1, 1, 1, 1,
-0.5254405, -0.08822946, -2.327965, 1, 1, 1, 1, 1,
-0.5244002, 0.4066294, 1.151397, 1, 1, 1, 1, 1,
-0.5224579, 0.01014782, -2.574217, 1, 1, 1, 1, 1,
-0.5202734, -0.4976287, -0.7182446, 1, 1, 1, 1, 1,
-0.5177045, 1.290838, -0.368891, 1, 1, 1, 1, 1,
-0.5176234, 1.316986, -0.1454665, 1, 1, 1, 1, 1,
-0.5170015, 0.8647086, -1.595397, 1, 1, 1, 1, 1,
-0.5142131, -0.8882268, -4.023828, 1, 1, 1, 1, 1,
-0.5119429, -1.088739, -4.010768, 1, 1, 1, 1, 1,
-0.5066118, -0.9363564, -2.431654, 1, 1, 1, 1, 1,
-0.5057204, -0.7972821, -5.287709, 0, 0, 1, 1, 1,
-0.502516, 0.2845576, 0.4466686, 1, 0, 0, 1, 1,
-0.5013235, 0.542786, 0.1176763, 1, 0, 0, 1, 1,
-0.5000544, 0.4472785, 1.173643, 1, 0, 0, 1, 1,
-0.4955889, 0.7771131, -0.7215061, 1, 0, 0, 1, 1,
-0.482941, -1.082825, -3.37961, 1, 0, 0, 1, 1,
-0.4783925, -1.631781, -2.418866, 0, 0, 0, 1, 1,
-0.4782707, -0.3276155, -2.46309, 0, 0, 0, 1, 1,
-0.472229, -1.249969, -4.216966, 0, 0, 0, 1, 1,
-0.4695817, -1.696496, -3.600427, 0, 0, 0, 1, 1,
-0.4690041, -0.4078774, -3.666212, 0, 0, 0, 1, 1,
-0.4666222, -0.4586819, -3.100538, 0, 0, 0, 1, 1,
-0.4663655, 1.493854, -2.283424, 0, 0, 0, 1, 1,
-0.465996, -1.061439, -4.278922, 1, 1, 1, 1, 1,
-0.4652137, 0.5137236, 1.715396, 1, 1, 1, 1, 1,
-0.4639164, -0.6008107, -2.631524, 1, 1, 1, 1, 1,
-0.4595568, 0.2785707, 0.06439923, 1, 1, 1, 1, 1,
-0.4535515, -2.358557, -2.153473, 1, 1, 1, 1, 1,
-0.4531684, 0.1748786, -0.6032333, 1, 1, 1, 1, 1,
-0.4487854, 0.9105037, 0.6459353, 1, 1, 1, 1, 1,
-0.4463483, 1.456043, -0.7956327, 1, 1, 1, 1, 1,
-0.4399403, -0.6398823, -3.064509, 1, 1, 1, 1, 1,
-0.4356639, 1.905272, -1.2369, 1, 1, 1, 1, 1,
-0.4299647, -0.6689034, -1.132763, 1, 1, 1, 1, 1,
-0.4238011, -1.365523, -2.224682, 1, 1, 1, 1, 1,
-0.4229283, -0.3177164, -2.589402, 1, 1, 1, 1, 1,
-0.4220108, -0.336139, -2.03094, 1, 1, 1, 1, 1,
-0.4215977, 0.8937738, 1.141239, 1, 1, 1, 1, 1,
-0.4207209, -1.644646, -3.788927, 0, 0, 1, 1, 1,
-0.4178523, -2.065615, -3.25472, 1, 0, 0, 1, 1,
-0.4128065, 1.79992, -1.266078, 1, 0, 0, 1, 1,
-0.4106787, -0.1436394, -1.925345, 1, 0, 0, 1, 1,
-0.4101576, 1.125116, -1.320498, 1, 0, 0, 1, 1,
-0.4083744, -0.4513324, -1.984311, 1, 0, 0, 1, 1,
-0.4062024, -0.456605, -2.318881, 0, 0, 0, 1, 1,
-0.4037532, 0.2145438, -2.011873, 0, 0, 0, 1, 1,
-0.3994968, 2.461172, -2.342292, 0, 0, 0, 1, 1,
-0.399077, -0.03764564, -1.525206, 0, 0, 0, 1, 1,
-0.3888774, -0.6812096, -4.837097, 0, 0, 0, 1, 1,
-0.3850649, 0.7561184, -0.3458456, 0, 0, 0, 1, 1,
-0.3804219, 0.9953285, -0.8386522, 0, 0, 0, 1, 1,
-0.3621328, 0.5756807, 1.226807, 1, 1, 1, 1, 1,
-0.3598483, -1.683366, -3.119462, 1, 1, 1, 1, 1,
-0.3573768, -1.008424, -1.991837, 1, 1, 1, 1, 1,
-0.3545368, -1.040537, -4.444008, 1, 1, 1, 1, 1,
-0.3526489, 1.557559, 0.3096744, 1, 1, 1, 1, 1,
-0.3474111, 2.02765, -1.610943, 1, 1, 1, 1, 1,
-0.3455602, 0.4766774, -0.7482495, 1, 1, 1, 1, 1,
-0.3435248, -0.1262061, -2.27785, 1, 1, 1, 1, 1,
-0.3412703, 1.097997, 0.4935905, 1, 1, 1, 1, 1,
-0.3398498, 0.3850902, -0.4583144, 1, 1, 1, 1, 1,
-0.3367124, 0.1215571, -1.240523, 1, 1, 1, 1, 1,
-0.3361196, 1.412765, -0.5241835, 1, 1, 1, 1, 1,
-0.3346732, -0.1140635, -3.088422, 1, 1, 1, 1, 1,
-0.3335387, 0.6454654, -0.6138608, 1, 1, 1, 1, 1,
-0.3319618, -1.128157, -2.488942, 1, 1, 1, 1, 1,
-0.3277887, -0.6960816, -2.240952, 0, 0, 1, 1, 1,
-0.3249625, -1.430124, -2.919631, 1, 0, 0, 1, 1,
-0.3244993, -1.063188, -2.267018, 1, 0, 0, 1, 1,
-0.3233097, 0.3665857, -2.41075, 1, 0, 0, 1, 1,
-0.3222545, -0.5145691, -2.807436, 1, 0, 0, 1, 1,
-0.3222449, -1.178642, -1.815292, 1, 0, 0, 1, 1,
-0.3141727, -0.1280188, -1.915176, 0, 0, 0, 1, 1,
-0.3124799, 1.663098, 1.180238, 0, 0, 0, 1, 1,
-0.3093984, -1.394739, -3.534764, 0, 0, 0, 1, 1,
-0.3074579, -0.01424587, 1.408836, 0, 0, 0, 1, 1,
-0.3056302, 0.3525304, -0.6559235, 0, 0, 0, 1, 1,
-0.3044881, 0.09111788, -0.7010895, 0, 0, 0, 1, 1,
-0.3034547, -0.5914618, -3.373999, 0, 0, 0, 1, 1,
-0.3020753, 0.2254169, -0.3169346, 1, 1, 1, 1, 1,
-0.2952656, 0.5265765, -1.310812, 1, 1, 1, 1, 1,
-0.2782564, 0.7717217, -0.02949546, 1, 1, 1, 1, 1,
-0.2768203, -0.2876358, -2.421184, 1, 1, 1, 1, 1,
-0.2701936, -0.06067748, -2.273374, 1, 1, 1, 1, 1,
-0.2680594, -1.610286, -2.239773, 1, 1, 1, 1, 1,
-0.2666878, 1.275451, -0.8522438, 1, 1, 1, 1, 1,
-0.2635643, -0.4998812, -2.772361, 1, 1, 1, 1, 1,
-0.2599184, -1.801847, -2.492467, 1, 1, 1, 1, 1,
-0.2581279, 1.236428, -0.6769472, 1, 1, 1, 1, 1,
-0.2562494, 2.039366, 0.2730767, 1, 1, 1, 1, 1,
-0.2553488, 0.2228648, -1.854778, 1, 1, 1, 1, 1,
-0.254622, -1.077822, -1.639725, 1, 1, 1, 1, 1,
-0.248973, 0.6355922, -0.7478427, 1, 1, 1, 1, 1,
-0.2446876, 0.6948889, -1.734478, 1, 1, 1, 1, 1,
-0.2332554, -1.304655, -0.288099, 0, 0, 1, 1, 1,
-0.232801, -1.905311, -3.090729, 1, 0, 0, 1, 1,
-0.2327964, 0.1098489, -0.566921, 1, 0, 0, 1, 1,
-0.2325234, -0.7229084, -3.00722, 1, 0, 0, 1, 1,
-0.2311282, -0.3722053, -2.887107, 1, 0, 0, 1, 1,
-0.2300756, -1.264229, -2.493923, 1, 0, 0, 1, 1,
-0.2294009, 0.3630331, -0.02921888, 0, 0, 0, 1, 1,
-0.2288672, 0.7527486, -1.814908, 0, 0, 0, 1, 1,
-0.2226916, -1.285342, -1.421216, 0, 0, 0, 1, 1,
-0.2172751, -1.339151, -2.741489, 0, 0, 0, 1, 1,
-0.2158919, 0.07124165, -1.743206, 0, 0, 0, 1, 1,
-0.2141194, 0.3643161, -1.066467, 0, 0, 0, 1, 1,
-0.2071003, 0.9596648, 0.7384616, 0, 0, 0, 1, 1,
-0.2067172, 0.1691906, 0.5397931, 1, 1, 1, 1, 1,
-0.2066484, -0.402383, -3.065922, 1, 1, 1, 1, 1,
-0.205517, 1.53506, 0.1067317, 1, 1, 1, 1, 1,
-0.1981587, -0.1789157, -3.77671, 1, 1, 1, 1, 1,
-0.1949798, -1.37002, -4.983718, 1, 1, 1, 1, 1,
-0.1944939, 1.144647, -0.1091772, 1, 1, 1, 1, 1,
-0.1917931, -0.5063475, -3.570916, 1, 1, 1, 1, 1,
-0.1884946, -0.8550251, -5.470096, 1, 1, 1, 1, 1,
-0.187834, -1.008401, -0.434221, 1, 1, 1, 1, 1,
-0.1838382, -0.1358074, -2.5528, 1, 1, 1, 1, 1,
-0.1830313, 2.588667, -0.4864684, 1, 1, 1, 1, 1,
-0.1818452, 1.09187, -0.07866745, 1, 1, 1, 1, 1,
-0.1807847, 1.074669, -1.438428, 1, 1, 1, 1, 1,
-0.179368, 0.6753046, 1.070386, 1, 1, 1, 1, 1,
-0.1778732, -0.6341372, -3.345517, 1, 1, 1, 1, 1,
-0.174034, -1.344815, -3.439643, 0, 0, 1, 1, 1,
-0.1737162, 1.042674, 0.02907361, 1, 0, 0, 1, 1,
-0.1702395, -0.7535889, -3.146569, 1, 0, 0, 1, 1,
-0.1701375, 2.393786, -0.3171259, 1, 0, 0, 1, 1,
-0.1659296, -0.5550424, -3.202546, 1, 0, 0, 1, 1,
-0.162027, -0.2441399, -1.908208, 1, 0, 0, 1, 1,
-0.1617336, 0.6413543, 0.3740932, 0, 0, 0, 1, 1,
-0.1580716, -0.01507738, -1.015687, 0, 0, 0, 1, 1,
-0.1577935, 2.266639, 0.5360435, 0, 0, 0, 1, 1,
-0.155809, 0.1956292, -1.889929, 0, 0, 0, 1, 1,
-0.1507289, -0.4364495, -3.61076, 0, 0, 0, 1, 1,
-0.1486643, -0.6156294, -2.48314, 0, 0, 0, 1, 1,
-0.1469245, -2.051055, -2.086737, 0, 0, 0, 1, 1,
-0.1401376, 0.3246134, -0.9397579, 1, 1, 1, 1, 1,
-0.1329134, 0.01092251, -0.5323997, 1, 1, 1, 1, 1,
-0.1326424, -0.1935682, -2.75613, 1, 1, 1, 1, 1,
-0.1274382, 0.3056239, -1.336501, 1, 1, 1, 1, 1,
-0.127403, -1.376438, -4.090877, 1, 1, 1, 1, 1,
-0.126372, -1.360168, -3.248307, 1, 1, 1, 1, 1,
-0.125311, -0.122155, -1.348574, 1, 1, 1, 1, 1,
-0.12412, -0.4192186, -3.3828, 1, 1, 1, 1, 1,
-0.1224686, 0.5599214, -0.08126158, 1, 1, 1, 1, 1,
-0.1211968, 0.8612503, -0.04502716, 1, 1, 1, 1, 1,
-0.1199702, -0.6822413, -2.503231, 1, 1, 1, 1, 1,
-0.1182363, 0.0301864, -3.745471, 1, 1, 1, 1, 1,
-0.1156816, -1.544576, -1.428092, 1, 1, 1, 1, 1,
-0.1145089, -0.5951081, -3.242334, 1, 1, 1, 1, 1,
-0.1144669, 1.003641, -2.02827, 1, 1, 1, 1, 1,
-0.1101647, 0.8109033, 0.1274879, 0, 0, 1, 1, 1,
-0.1038702, -2.60793, -0.4063857, 1, 0, 0, 1, 1,
-0.1030089, -0.9816861, -2.879898, 1, 0, 0, 1, 1,
-0.1021946, 0.1340999, -1.463007, 1, 0, 0, 1, 1,
-0.1014112, 1.643329, -1.539737, 1, 0, 0, 1, 1,
-0.1010984, 0.458201, 1.196531, 1, 0, 0, 1, 1,
-0.0994541, 0.4666918, 0.8608986, 0, 0, 0, 1, 1,
-0.09684411, 0.07772446, -1.607581, 0, 0, 0, 1, 1,
-0.09458525, -0.5261736, -3.465109, 0, 0, 0, 1, 1,
-0.09450354, -0.6314051, -3.54853, 0, 0, 0, 1, 1,
-0.09214395, 0.8795774, -2.096302, 0, 0, 0, 1, 1,
-0.09194129, 0.3509528, 2.115618, 0, 0, 0, 1, 1,
-0.0918921, -0.01973533, -1.371114, 0, 0, 0, 1, 1,
-0.08340842, 0.2920156, 1.607049, 1, 1, 1, 1, 1,
-0.08324236, 0.7099271, -1.077127, 1, 1, 1, 1, 1,
-0.08289388, 0.2481994, 0.5227692, 1, 1, 1, 1, 1,
-0.08002092, -0.253446, -1.378227, 1, 1, 1, 1, 1,
-0.0797933, 1.88755, -0.1009568, 1, 1, 1, 1, 1,
-0.07805563, -0.5453293, -1.262794, 1, 1, 1, 1, 1,
-0.07674278, 1.813179, -1.678596, 1, 1, 1, 1, 1,
-0.0764471, 0.8664452, -1.215981, 1, 1, 1, 1, 1,
-0.07632365, -1.423246, -4.134399, 1, 1, 1, 1, 1,
-0.0714892, -0.1472701, -1.192254, 1, 1, 1, 1, 1,
-0.06594772, 0.8876628, 0.6389971, 1, 1, 1, 1, 1,
-0.06504622, 0.1914344, 0.3478054, 1, 1, 1, 1, 1,
-0.05499499, 0.3940859, -1.326326, 1, 1, 1, 1, 1,
-0.05327928, 1.107604, 1.822806, 1, 1, 1, 1, 1,
-0.05131748, -0.9923183, -3.995333, 1, 1, 1, 1, 1,
-0.04591823, -0.5362578, -4.670146, 0, 0, 1, 1, 1,
-0.03762898, 1.508415, -0.3104202, 1, 0, 0, 1, 1,
-0.03643814, 0.5535784, -0.3214838, 1, 0, 0, 1, 1,
-0.03403394, -0.7956629, -2.366045, 1, 0, 0, 1, 1,
-0.03396271, 0.1816302, 0.03160577, 1, 0, 0, 1, 1,
-0.03389899, -0.6278861, -4.176158, 1, 0, 0, 1, 1,
-0.03341837, 0.04204593, -0.3279058, 0, 0, 0, 1, 1,
-0.03073554, 0.7908552, 1.694527, 0, 0, 0, 1, 1,
-0.02782005, -0.4268403, -1.881958, 0, 0, 0, 1, 1,
-0.01549374, 0.4484983, -0.2014884, 0, 0, 0, 1, 1,
-0.01263945, -0.9205968, -2.998996, 0, 0, 0, 1, 1,
-0.01142163, -0.5838397, -3.466123, 0, 0, 0, 1, 1,
-0.009360578, -0.5685984, -3.892961, 0, 0, 0, 1, 1,
-0.009023094, -0.1163626, -2.050169, 1, 1, 1, 1, 1,
-0.007136168, -0.2475116, -3.339224, 1, 1, 1, 1, 1,
-0.005250184, 0.6569128, 0.9859328, 1, 1, 1, 1, 1,
0.002259533, -0.1058055, 3.132756, 1, 1, 1, 1, 1,
0.003249452, -1.126799, 2.103436, 1, 1, 1, 1, 1,
0.004091758, 1.548208, 1.155325, 1, 1, 1, 1, 1,
0.005771496, -0.4530935, 3.966424, 1, 1, 1, 1, 1,
0.007837716, -0.9773059, 3.167769, 1, 1, 1, 1, 1,
0.01268258, 1.027759, 0.2017275, 1, 1, 1, 1, 1,
0.01663177, -0.5681496, 4.376698, 1, 1, 1, 1, 1,
0.01730014, -0.1007074, 2.660301, 1, 1, 1, 1, 1,
0.01874979, 0.3156843, 0.5275266, 1, 1, 1, 1, 1,
0.01886812, -0.007354269, 0.4833101, 1, 1, 1, 1, 1,
0.01898652, -0.6356762, 4.051748, 1, 1, 1, 1, 1,
0.02197045, -1.414231, 1.985544, 1, 1, 1, 1, 1,
0.02562461, 1.922679, -2.305134, 0, 0, 1, 1, 1,
0.02777668, -2.326105, 2.649896, 1, 0, 0, 1, 1,
0.03198209, 0.09405919, -1.226825, 1, 0, 0, 1, 1,
0.03471975, 0.4345104, -0.506313, 1, 0, 0, 1, 1,
0.03616437, 1.154627, 0.2191487, 1, 0, 0, 1, 1,
0.0366853, -3.176489, 3.759247, 1, 0, 0, 1, 1,
0.0367598, 0.4565713, 0.2672233, 0, 0, 0, 1, 1,
0.03809819, -0.1258708, 2.580864, 0, 0, 0, 1, 1,
0.04262858, 0.5327544, 0.7189265, 0, 0, 0, 1, 1,
0.04309833, 2.621447, 1.464783, 0, 0, 0, 1, 1,
0.0432143, -1.3807, 2.81571, 0, 0, 0, 1, 1,
0.05328954, 0.8262741, 0.6844344, 0, 0, 0, 1, 1,
0.05471356, 0.6876251, -0.7609596, 0, 0, 0, 1, 1,
0.05959771, 0.6053826, -1.161336, 1, 1, 1, 1, 1,
0.08007346, -1.36858, 3.488575, 1, 1, 1, 1, 1,
0.08078764, -0.9097921, 3.895317, 1, 1, 1, 1, 1,
0.08591751, 1.216541, -1.178734, 1, 1, 1, 1, 1,
0.08646961, 1.042023, 0.4963453, 1, 1, 1, 1, 1,
0.08823296, 0.09393728, 2.282198, 1, 1, 1, 1, 1,
0.08897162, 0.7620568, -0.9560843, 1, 1, 1, 1, 1,
0.09254844, -1.833098, 2.104557, 1, 1, 1, 1, 1,
0.09492747, 1.042319, 0.6255229, 1, 1, 1, 1, 1,
0.1000807, -0.01715671, 0.05422081, 1, 1, 1, 1, 1,
0.1068689, -2.455195, 0.3283181, 1, 1, 1, 1, 1,
0.1123326, 0.5720061, 0.6316779, 1, 1, 1, 1, 1,
0.1194996, -1.084512, 1.996152, 1, 1, 1, 1, 1,
0.1203479, 0.166408, 1.411156, 1, 1, 1, 1, 1,
0.1214447, -0.747719, 4.083256, 1, 1, 1, 1, 1,
0.1225416, -0.2147395, 2.450223, 0, 0, 1, 1, 1,
0.1244474, 2.623027, 0.5157465, 1, 0, 0, 1, 1,
0.1261006, 1.226833, 1.171467, 1, 0, 0, 1, 1,
0.1273332, -0.3972031, 2.42577, 1, 0, 0, 1, 1,
0.1287865, 0.4829088, 1.515772, 1, 0, 0, 1, 1,
0.1307291, -0.3693213, 2.040267, 1, 0, 0, 1, 1,
0.1311908, -0.2290807, 2.559601, 0, 0, 0, 1, 1,
0.1336104, 0.4483325, 0.7220224, 0, 0, 0, 1, 1,
0.1438835, -0.218077, 3.562634, 0, 0, 0, 1, 1,
0.1469572, -1.545073, 3.103515, 0, 0, 0, 1, 1,
0.1493306, 0.04927805, 1.268445, 0, 0, 0, 1, 1,
0.1503725, -1.107178, 1.642582, 0, 0, 0, 1, 1,
0.1505564, -0.07745972, 3.134925, 0, 0, 0, 1, 1,
0.1521922, -0.2126922, 2.988204, 1, 1, 1, 1, 1,
0.1556222, 0.7654487, 2.381516, 1, 1, 1, 1, 1,
0.1574799, 0.4050277, -0.2395038, 1, 1, 1, 1, 1,
0.1576308, 1.687375, 0.1193946, 1, 1, 1, 1, 1,
0.1578473, -2.216903, 2.528586, 1, 1, 1, 1, 1,
0.1634442, -1.117611, 2.947992, 1, 1, 1, 1, 1,
0.1654037, 0.7210597, 0.4556267, 1, 1, 1, 1, 1,
0.1659736, 0.5770476, -0.05935979, 1, 1, 1, 1, 1,
0.1758628, -0.2779365, 0.9205813, 1, 1, 1, 1, 1,
0.1770037, 0.1893924, 1.564305, 1, 1, 1, 1, 1,
0.1774771, -0.944512, 2.290603, 1, 1, 1, 1, 1,
0.1777506, -0.6446213, 3.832124, 1, 1, 1, 1, 1,
0.1779286, -0.8778923, 2.018257, 1, 1, 1, 1, 1,
0.1786134, -2.0047, 2.558015, 1, 1, 1, 1, 1,
0.1811427, -0.4638984, 2.852347, 1, 1, 1, 1, 1,
0.1819772, 0.1423523, 1.389422, 0, 0, 1, 1, 1,
0.1820573, 0.8220358, 0.7632078, 1, 0, 0, 1, 1,
0.1879021, 0.8113416, 0.3336614, 1, 0, 0, 1, 1,
0.1884108, -0.7250577, 2.892061, 1, 0, 0, 1, 1,
0.1905161, -0.3642178, 2.152765, 1, 0, 0, 1, 1,
0.1921659, -1.106197, 3.283992, 1, 0, 0, 1, 1,
0.1941312, -1.720257, 3.7545, 0, 0, 0, 1, 1,
0.2006022, -1.521215, 3.516895, 0, 0, 0, 1, 1,
0.2111904, 0.9573766, -0.3258948, 0, 0, 0, 1, 1,
0.213651, -0.8119033, 4.115445, 0, 0, 0, 1, 1,
0.2187749, -1.891961, 2.79158, 0, 0, 0, 1, 1,
0.2192378, 0.5128568, 0.5693403, 0, 0, 0, 1, 1,
0.2210356, -0.05111716, 1.972912, 0, 0, 0, 1, 1,
0.2214384, 0.7075384, -0.874305, 1, 1, 1, 1, 1,
0.2220284, 0.9253166, 0.9630706, 1, 1, 1, 1, 1,
0.2248032, -0.2366017, 1.048805, 1, 1, 1, 1, 1,
0.2297505, 0.08355231, 0.9342415, 1, 1, 1, 1, 1,
0.2311729, 0.1304527, 1.220699, 1, 1, 1, 1, 1,
0.240141, -0.1241505, 1.366192, 1, 1, 1, 1, 1,
0.2407371, 0.1552728, -1.070042, 1, 1, 1, 1, 1,
0.2408912, 1.182928, 0.4070798, 1, 1, 1, 1, 1,
0.2430005, 0.8034921, 1.1637, 1, 1, 1, 1, 1,
0.2446438, 0.9283502, -0.0309375, 1, 1, 1, 1, 1,
0.2454702, 1.726497, -0.04225634, 1, 1, 1, 1, 1,
0.2462109, -0.3887948, 2.233783, 1, 1, 1, 1, 1,
0.24702, -0.8326149, 4.02237, 1, 1, 1, 1, 1,
0.2473128, -0.367745, 2.842969, 1, 1, 1, 1, 1,
0.2479187, 1.262269, 0.156752, 1, 1, 1, 1, 1,
0.2484448, -0.4839781, 1.230816, 0, 0, 1, 1, 1,
0.2530307, 0.7163621, -0.3089216, 1, 0, 0, 1, 1,
0.2540456, -0.6052437, 2.326679, 1, 0, 0, 1, 1,
0.254647, -0.1766958, 3.231334, 1, 0, 0, 1, 1,
0.2638461, -1.144192, 3.386075, 1, 0, 0, 1, 1,
0.2660771, -1.005395, 1.771666, 1, 0, 0, 1, 1,
0.2665018, 1.380022, 0.3290754, 0, 0, 0, 1, 1,
0.2665185, 0.03448013, 1.722756, 0, 0, 0, 1, 1,
0.266624, -1.00742, 2.807388, 0, 0, 0, 1, 1,
0.267848, -0.03376723, 2.446888, 0, 0, 0, 1, 1,
0.2686945, 0.4056813, 1.719944, 0, 0, 0, 1, 1,
0.2734384, -1.175959, 2.160746, 0, 0, 0, 1, 1,
0.2758836, 1.674932, -0.9088745, 0, 0, 0, 1, 1,
0.2764501, -1.308216, 3.531208, 1, 1, 1, 1, 1,
0.2767589, -0.09720316, 0.8549248, 1, 1, 1, 1, 1,
0.280164, 2.173584, -0.8550916, 1, 1, 1, 1, 1,
0.2841007, -0.9929301, 2.145705, 1, 1, 1, 1, 1,
0.2869261, 0.9492298, 2.604342, 1, 1, 1, 1, 1,
0.2937367, -0.07772288, 1.011631, 1, 1, 1, 1, 1,
0.2943685, 1.05004, 1.943018, 1, 1, 1, 1, 1,
0.2997437, -0.9170591, 1.684721, 1, 1, 1, 1, 1,
0.3002062, 2.148862, -0.6538703, 1, 1, 1, 1, 1,
0.3074782, -0.3215983, 1.879614, 1, 1, 1, 1, 1,
0.3086373, 0.6747344, 2.230018, 1, 1, 1, 1, 1,
0.308845, -1.057374, 2.783476, 1, 1, 1, 1, 1,
0.3093815, 0.9721438, 1.092829, 1, 1, 1, 1, 1,
0.3108363, 0.6837344, 2.160164, 1, 1, 1, 1, 1,
0.3119637, 1.047059, 0.15253, 1, 1, 1, 1, 1,
0.3126056, 0.2757775, -0.3690872, 0, 0, 1, 1, 1,
0.3128425, -1.159492, 2.544362, 1, 0, 0, 1, 1,
0.3183371, 1.490698, 0.1858787, 1, 0, 0, 1, 1,
0.3233017, 1.197157, 0.9269096, 1, 0, 0, 1, 1,
0.3259755, -0.1920386, 0.4862505, 1, 0, 0, 1, 1,
0.3291563, 0.8997618, 0.4281394, 1, 0, 0, 1, 1,
0.3333796, 2.596156, 0.6045446, 0, 0, 0, 1, 1,
0.3340081, 1.464676, -1.297836, 0, 0, 0, 1, 1,
0.3357761, 0.2938046, -0.606849, 0, 0, 0, 1, 1,
0.337814, -0.0279335, 2.318978, 0, 0, 0, 1, 1,
0.3380115, -0.1357198, 1.651809, 0, 0, 0, 1, 1,
0.3388548, -0.5587273, 4.771653, 0, 0, 0, 1, 1,
0.3446256, 0.8991942, 1.264899, 0, 0, 0, 1, 1,
0.3449616, -1.80059, 3.155217, 1, 1, 1, 1, 1,
0.3450327, 0.6217576, 0.6248595, 1, 1, 1, 1, 1,
0.3453177, -0.02907433, 1.288318, 1, 1, 1, 1, 1,
0.3471632, -2.620671, 2.268556, 1, 1, 1, 1, 1,
0.351046, -0.6310368, 3.997205, 1, 1, 1, 1, 1,
0.3527456, -1.065229, 3.239355, 1, 1, 1, 1, 1,
0.3550878, 0.168296, 0.4031099, 1, 1, 1, 1, 1,
0.3562354, 1.41693, 0.7783121, 1, 1, 1, 1, 1,
0.3671721, -0.7774654, 2.83399, 1, 1, 1, 1, 1,
0.3715712, -1.120506, 1.558284, 1, 1, 1, 1, 1,
0.3717841, -0.07954264, 2.075322, 1, 1, 1, 1, 1,
0.3738158, -0.1793376, 2.495229, 1, 1, 1, 1, 1,
0.3739298, 1.027864, 0.7109463, 1, 1, 1, 1, 1,
0.3756213, -0.6144044, 3.452759, 1, 1, 1, 1, 1,
0.3901274, -1.092999, 1.020909, 1, 1, 1, 1, 1,
0.3914686, -0.4867132, 3.325277, 0, 0, 1, 1, 1,
0.3919366, -1.438057, 3.542556, 1, 0, 0, 1, 1,
0.3935431, 0.4841784, 0.3451895, 1, 0, 0, 1, 1,
0.4001609, -0.5484902, 3.024391, 1, 0, 0, 1, 1,
0.4057025, -0.2218324, 0.7058415, 1, 0, 0, 1, 1,
0.4059708, 0.7969613, 0.9225349, 1, 0, 0, 1, 1,
0.4065725, -0.4186943, 1.634321, 0, 0, 0, 1, 1,
0.4066138, 0.1241618, 2.461632, 0, 0, 0, 1, 1,
0.4085122, 0.731514, 3.253654, 0, 0, 0, 1, 1,
0.4113396, -0.3938185, 2.153428, 0, 0, 0, 1, 1,
0.4115353, 1.430819, 0.5647424, 0, 0, 0, 1, 1,
0.4129682, -0.8858838, 4.353114, 0, 0, 0, 1, 1,
0.4140926, -2.309289, 3.293134, 0, 0, 0, 1, 1,
0.4161392, -0.2732826, 1.350029, 1, 1, 1, 1, 1,
0.4190336, 1.084698, -0.3144218, 1, 1, 1, 1, 1,
0.4201015, 1.224236, 0.4524284, 1, 1, 1, 1, 1,
0.4230302, 1.334916, 2.728024, 1, 1, 1, 1, 1,
0.4232011, 0.7686827, -0.3964832, 1, 1, 1, 1, 1,
0.4235851, 1.847543, 0.09102394, 1, 1, 1, 1, 1,
0.4240772, -2.096875, 2.262872, 1, 1, 1, 1, 1,
0.4291831, -1.382969, 1.856013, 1, 1, 1, 1, 1,
0.4302705, 1.392745, 0.7620366, 1, 1, 1, 1, 1,
0.4312078, -1.337981, 1.996868, 1, 1, 1, 1, 1,
0.4316925, -0.6189156, 3.189608, 1, 1, 1, 1, 1,
0.436558, 0.9040157, 0.9177576, 1, 1, 1, 1, 1,
0.437574, 1.69828, 0.0843742, 1, 1, 1, 1, 1,
0.4437337, -0.01885792, 2.647877, 1, 1, 1, 1, 1,
0.4440888, 1.35632, -0.9668369, 1, 1, 1, 1, 1,
0.4455853, 1.539774, 0.9861813, 0, 0, 1, 1, 1,
0.4490309, 1.054971, 1.717404, 1, 0, 0, 1, 1,
0.4578715, 0.7371438, 1.967084, 1, 0, 0, 1, 1,
0.4593552, 1.64503, 0.5739908, 1, 0, 0, 1, 1,
0.4596891, 1.614666, 1.277302, 1, 0, 0, 1, 1,
0.4634517, 0.7519029, -1.663457, 1, 0, 0, 1, 1,
0.4676408, -1.122513, 2.584878, 0, 0, 0, 1, 1,
0.4683275, -1.10964, 2.576333, 0, 0, 0, 1, 1,
0.4739811, 0.1474375, 1.300975, 0, 0, 0, 1, 1,
0.4774458, -0.505321, 1.677498, 0, 0, 0, 1, 1,
0.4790071, 1.424602, 1.962289, 0, 0, 0, 1, 1,
0.4887185, 2.70296, -0.194561, 0, 0, 0, 1, 1,
0.4887609, 0.8357185, 0.8922586, 0, 0, 0, 1, 1,
0.488849, 0.5408411, 1.863359, 1, 1, 1, 1, 1,
0.4935704, 1.859975, 1.708522, 1, 1, 1, 1, 1,
0.4972407, 1.660014, -1.950078, 1, 1, 1, 1, 1,
0.4981235, 0.9130621, 1.927497, 1, 1, 1, 1, 1,
0.4989861, 3.36676, 0.2027811, 1, 1, 1, 1, 1,
0.4995374, 1.425064, 0.9110564, 1, 1, 1, 1, 1,
0.5008833, -1.199279, 3.443943, 1, 1, 1, 1, 1,
0.5010534, -0.033089, 1.265817, 1, 1, 1, 1, 1,
0.5011227, 0.5770112, 0.1631392, 1, 1, 1, 1, 1,
0.501848, 0.6584856, -0.07090413, 1, 1, 1, 1, 1,
0.5021533, 0.6091189, 0.2258483, 1, 1, 1, 1, 1,
0.5066163, 0.2577884, 0.5822974, 1, 1, 1, 1, 1,
0.5068173, 1.087358, 0.8538222, 1, 1, 1, 1, 1,
0.5081289, 0.1376994, 1.382065, 1, 1, 1, 1, 1,
0.5139201, 1.36237, 0.6180522, 1, 1, 1, 1, 1,
0.5148882, 1.843485, 0.03887438, 0, 0, 1, 1, 1,
0.5218196, -0.457152, 1.462602, 1, 0, 0, 1, 1,
0.5251753, -1.648327, 1.824079, 1, 0, 0, 1, 1,
0.5286289, 2.154418, -0.0925834, 1, 0, 0, 1, 1,
0.5359359, -1.512437, 2.730649, 1, 0, 0, 1, 1,
0.5374938, -0.2702245, 2.110755, 1, 0, 0, 1, 1,
0.5421935, 0.6581871, 0.7940603, 0, 0, 0, 1, 1,
0.5427451, 0.9921122, -2.33544, 0, 0, 0, 1, 1,
0.5442348, -0.1394382, 2.066825, 0, 0, 0, 1, 1,
0.5451104, -0.4325261, 2.496837, 0, 0, 0, 1, 1,
0.5455184, -0.5619752, 2.585841, 0, 0, 0, 1, 1,
0.550265, -0.9458572, 1.05102, 0, 0, 0, 1, 1,
0.5516929, 0.2804761, -0.7369512, 0, 0, 0, 1, 1,
0.554345, 0.7093844, -0.8301188, 1, 1, 1, 1, 1,
0.5581993, -1.85283, 3.681306, 1, 1, 1, 1, 1,
0.5583184, 1.262352, 2.420069, 1, 1, 1, 1, 1,
0.5699299, 0.1032957, 1.637269, 1, 1, 1, 1, 1,
0.5730029, -1.026683, 1.954677, 1, 1, 1, 1, 1,
0.5746629, 1.359215, 0.9435446, 1, 1, 1, 1, 1,
0.5785698, -0.118408, 3.266329, 1, 1, 1, 1, 1,
0.5797625, -0.2196232, 3.325061, 1, 1, 1, 1, 1,
0.5800293, 0.09408797, 2.550194, 1, 1, 1, 1, 1,
0.5840818, -0.643971, 1.486175, 1, 1, 1, 1, 1,
0.5856571, 1.097609, -0.1956269, 1, 1, 1, 1, 1,
0.5891708, -0.3089382, 3.050555, 1, 1, 1, 1, 1,
0.6001891, 0.1547548, -0.6334279, 1, 1, 1, 1, 1,
0.6024183, -0.06406719, 1.340375, 1, 1, 1, 1, 1,
0.6106161, 0.2320076, 0.9418874, 1, 1, 1, 1, 1,
0.6114481, -2.020757, 2.338462, 0, 0, 1, 1, 1,
0.6155144, 0.5074511, 1.611664, 1, 0, 0, 1, 1,
0.6157115, 0.8432202, 0.5345941, 1, 0, 0, 1, 1,
0.6187236, 0.458371, 1.746973, 1, 0, 0, 1, 1,
0.6235052, -2.202605, 1.006292, 1, 0, 0, 1, 1,
0.6270041, 1.537434, 0.3367232, 1, 0, 0, 1, 1,
0.6333386, -0.9180205, 0.1400275, 0, 0, 0, 1, 1,
0.6351451, 1.793042, 0.3302811, 0, 0, 0, 1, 1,
0.6355752, -0.1233537, 1.815529, 0, 0, 0, 1, 1,
0.6392331, 0.8192887, -1.236227, 0, 0, 0, 1, 1,
0.6406701, -0.3829122, 1.503647, 0, 0, 0, 1, 1,
0.6407381, -0.6565717, 1.844506, 0, 0, 0, 1, 1,
0.643535, -0.03055079, 3.472096, 0, 0, 0, 1, 1,
0.6454652, 0.829811, 0.7688966, 1, 1, 1, 1, 1,
0.6468932, -1.484241, 3.37801, 1, 1, 1, 1, 1,
0.6590585, 1.042462, 1.03914, 1, 1, 1, 1, 1,
0.667198, -0.464738, 3.226738, 1, 1, 1, 1, 1,
0.6702769, 0.3964847, 1.703223, 1, 1, 1, 1, 1,
0.6774041, -1.610938, 2.718634, 1, 1, 1, 1, 1,
0.6823732, 2.479635, 1.307291, 1, 1, 1, 1, 1,
0.6883925, 1.470024, -1.129426, 1, 1, 1, 1, 1,
0.6899017, 0.6601266, 1.016594, 1, 1, 1, 1, 1,
0.6914835, 0.1832713, 2.516224, 1, 1, 1, 1, 1,
0.6938986, 0.3884693, 0.2999588, 1, 1, 1, 1, 1,
0.6945789, -0.6586306, 2.480191, 1, 1, 1, 1, 1,
0.6971223, -0.1172284, 3.510709, 1, 1, 1, 1, 1,
0.6981874, 0.08722463, 3.806348, 1, 1, 1, 1, 1,
0.7011847, -1.33739, 2.009709, 1, 1, 1, 1, 1,
0.7018193, -0.6492111, 2.306778, 0, 0, 1, 1, 1,
0.7029685, 1.177269, 1.419064, 1, 0, 0, 1, 1,
0.7088955, -0.1110795, 1.108774, 1, 0, 0, 1, 1,
0.7091899, 2.428552, 0.5875493, 1, 0, 0, 1, 1,
0.7107779, -1.131086, 3.506856, 1, 0, 0, 1, 1,
0.7157202, 0.5682127, 0.9959678, 1, 0, 0, 1, 1,
0.7166919, -2.422401, 3.00704, 0, 0, 0, 1, 1,
0.7198356, 0.4214022, 0.9879616, 0, 0, 0, 1, 1,
0.7267115, 0.3231945, 2.260906, 0, 0, 0, 1, 1,
0.7309694, 0.3198537, 1.681383, 0, 0, 0, 1, 1,
0.7358272, -0.476725, 2.830724, 0, 0, 0, 1, 1,
0.7361825, -0.01599219, 2.0991, 0, 0, 0, 1, 1,
0.7418669, 1.52591, 1.080662, 0, 0, 0, 1, 1,
0.7450357, 0.1084045, 2.247374, 1, 1, 1, 1, 1,
0.7470767, 0.385117, -1.466174, 1, 1, 1, 1, 1,
0.75735, 0.9587933, 0.4311351, 1, 1, 1, 1, 1,
0.7634499, 0.4212622, 1.980117, 1, 1, 1, 1, 1,
0.7654566, 1.353003, 1.651902, 1, 1, 1, 1, 1,
0.7785858, -0.7082, 3.007458, 1, 1, 1, 1, 1,
0.7828823, 0.2466088, 2.132095, 1, 1, 1, 1, 1,
0.7964897, -0.6520596, 3.710996, 1, 1, 1, 1, 1,
0.7966277, 0.1082382, 1.733465, 1, 1, 1, 1, 1,
0.8043367, 0.9940258, -0.3294096, 1, 1, 1, 1, 1,
0.8072156, 0.7422475, -0.07553198, 1, 1, 1, 1, 1,
0.8076679, 0.3867383, 1.127391, 1, 1, 1, 1, 1,
0.811915, 1.650188, 0.1143337, 1, 1, 1, 1, 1,
0.8126691, 0.868537, 1.292819, 1, 1, 1, 1, 1,
0.8145154, 1.090736, -0.7669455, 1, 1, 1, 1, 1,
0.8168567, 0.5225864, 0.7105158, 0, 0, 1, 1, 1,
0.8233078, -0.4076641, 0.8009487, 1, 0, 0, 1, 1,
0.8234467, 0.7976878, -1.039171, 1, 0, 0, 1, 1,
0.8250079, 2.518641, -2.460106, 1, 0, 0, 1, 1,
0.8313316, -0.4246848, 1.990756, 1, 0, 0, 1, 1,
0.835034, 0.919968, 0.3841788, 1, 0, 0, 1, 1,
0.8370553, 0.9132181, 1.440997, 0, 0, 0, 1, 1,
0.8418922, -0.3553278, 2.043875, 0, 0, 0, 1, 1,
0.848878, -0.4314725, 2.77138, 0, 0, 0, 1, 1,
0.8721402, -0.4981894, 2.355856, 0, 0, 0, 1, 1,
0.8793395, -0.7727746, 2.218379, 0, 0, 0, 1, 1,
0.8843578, -0.6093109, 2.584004, 0, 0, 0, 1, 1,
0.8850068, 1.208023, 1.950044, 0, 0, 0, 1, 1,
0.8855666, -0.4849573, 2.244297, 1, 1, 1, 1, 1,
0.8856091, 0.05991095, 3.466017, 1, 1, 1, 1, 1,
0.88815, 0.3003592, 1.376513, 1, 1, 1, 1, 1,
0.8907045, -1.290379, 2.501822, 1, 1, 1, 1, 1,
0.8981486, 0.8782056, -0.4145241, 1, 1, 1, 1, 1,
0.9057519, 1.930184, 2.729119, 1, 1, 1, 1, 1,
0.916478, -0.3761334, 1.537359, 1, 1, 1, 1, 1,
0.9189704, 0.4053914, 0.4032927, 1, 1, 1, 1, 1,
0.9190822, 1.316939, 0.769198, 1, 1, 1, 1, 1,
0.9220567, -0.4182808, 2.051119, 1, 1, 1, 1, 1,
0.9268933, 1.273224, 0.0420085, 1, 1, 1, 1, 1,
0.9281232, -0.7899198, 0.9211072, 1, 1, 1, 1, 1,
0.9282311, 0.5372567, 0.4285061, 1, 1, 1, 1, 1,
0.9299455, 1.099287, 1.502264, 1, 1, 1, 1, 1,
0.9311373, -0.9386557, 2.467026, 1, 1, 1, 1, 1,
0.9449014, 0.1160153, 2.167825, 0, 0, 1, 1, 1,
0.9460037, -1.939283, 1.480041, 1, 0, 0, 1, 1,
0.9489283, -1.412343, 3.004135, 1, 0, 0, 1, 1,
0.9540352, 0.9730817, 0.008707057, 1, 0, 0, 1, 1,
0.9543115, -0.4407939, 0.5572655, 1, 0, 0, 1, 1,
0.955189, 1.376287, 1.025807, 1, 0, 0, 1, 1,
0.9564766, 1.828346, -0.1839274, 0, 0, 0, 1, 1,
0.9607642, -0.4264682, 3.892622, 0, 0, 0, 1, 1,
0.9624518, 0.01275514, 0.1429183, 0, 0, 0, 1, 1,
0.9657781, 0.9528618, 0.3009854, 0, 0, 0, 1, 1,
0.9747518, -0.1816511, 1.017877, 0, 0, 0, 1, 1,
0.9780956, 0.3474407, 2.502598, 0, 0, 0, 1, 1,
0.9801947, 1.111699, -0.6763012, 0, 0, 0, 1, 1,
0.9860541, -0.1811826, 2.195346, 1, 1, 1, 1, 1,
0.9864026, 0.8752775, 1.529559, 1, 1, 1, 1, 1,
0.9892375, -1.138309, 0.922385, 1, 1, 1, 1, 1,
0.993926, 0.1397045, 0.9376837, 1, 1, 1, 1, 1,
1.007614, 0.287187, -0.4041893, 1, 1, 1, 1, 1,
1.013478, 0.3127388, 2.103177, 1, 1, 1, 1, 1,
1.014974, -0.8837907, 2.866889, 1, 1, 1, 1, 1,
1.017206, 2.01192, -0.7874866, 1, 1, 1, 1, 1,
1.023796, -1.245102, 2.08542, 1, 1, 1, 1, 1,
1.035246, 1.852759, -0.1878786, 1, 1, 1, 1, 1,
1.035798, 1.883273, 0.5637571, 1, 1, 1, 1, 1,
1.043441, 0.3513767, 0.543689, 1, 1, 1, 1, 1,
1.046977, -0.05429215, 1.989526, 1, 1, 1, 1, 1,
1.052222, 0.4528156, -0.2553994, 1, 1, 1, 1, 1,
1.054225, 0.7201858, 2.445908, 1, 1, 1, 1, 1,
1.05782, -1.553864, 2.873372, 0, 0, 1, 1, 1,
1.059576, 0.2917712, 3.200963, 1, 0, 0, 1, 1,
1.073149, -0.7709175, 0.03932117, 1, 0, 0, 1, 1,
1.075234, -1.127008, 1.959611, 1, 0, 0, 1, 1,
1.094495, -1.819342, 1.268933, 1, 0, 0, 1, 1,
1.097165, 0.7821342, 1.885163, 1, 0, 0, 1, 1,
1.097187, -0.8437772, 2.222231, 0, 0, 0, 1, 1,
1.097251, -0.2486943, 0.7270117, 0, 0, 0, 1, 1,
1.104279, -1.067774, 2.000207, 0, 0, 0, 1, 1,
1.113276, 1.548854, 1.642629, 0, 0, 0, 1, 1,
1.113286, 0.6105949, 0.342032, 0, 0, 0, 1, 1,
1.114238, -0.4187013, 2.218306, 0, 0, 0, 1, 1,
1.159941, -1.298396, 2.570858, 0, 0, 0, 1, 1,
1.163304, -0.5868958, 1.07544, 1, 1, 1, 1, 1,
1.166268, 0.3171483, 1.882704, 1, 1, 1, 1, 1,
1.173834, 1.919696, 0.2594154, 1, 1, 1, 1, 1,
1.173966, -0.696499, 1.52701, 1, 1, 1, 1, 1,
1.182597, 0.04991928, 1.594072, 1, 1, 1, 1, 1,
1.188174, -0.2272084, 3.384202, 1, 1, 1, 1, 1,
1.202059, -0.9050823, 2.994431, 1, 1, 1, 1, 1,
1.211345, 0.9098287, 2.511095, 1, 1, 1, 1, 1,
1.220753, 0.1673592, 0.6505563, 1, 1, 1, 1, 1,
1.225374, -0.9250621, 1.773337, 1, 1, 1, 1, 1,
1.230355, 0.8835341, -1.223321, 1, 1, 1, 1, 1,
1.230436, -0.9283686, 1.82523, 1, 1, 1, 1, 1,
1.232312, 0.7816344, 0.05802589, 1, 1, 1, 1, 1,
1.232446, 2.040053, 1.193473, 1, 1, 1, 1, 1,
1.236234, -0.8829201, 2.760091, 1, 1, 1, 1, 1,
1.238347, 2.188887, -0.836844, 0, 0, 1, 1, 1,
1.241775, 0.7835074, 1.368342, 1, 0, 0, 1, 1,
1.248325, 0.7102917, 1.929522, 1, 0, 0, 1, 1,
1.250722, -0.6003672, 2.273267, 1, 0, 0, 1, 1,
1.265541, 0.7430426, 1.188481, 1, 0, 0, 1, 1,
1.265725, 0.5655295, 1.618331, 1, 0, 0, 1, 1,
1.274852, 0.5602766, -0.4537776, 0, 0, 0, 1, 1,
1.279225, 0.4622285, 0.330988, 0, 0, 0, 1, 1,
1.280352, -0.1992001, 0.3987539, 0, 0, 0, 1, 1,
1.282853, 0.4345711, 1.480546, 0, 0, 0, 1, 1,
1.283095, -1.075635, 3.067486, 0, 0, 0, 1, 1,
1.283713, 0.3769829, 1.483571, 0, 0, 0, 1, 1,
1.291299, -1.379586, 2.292798, 0, 0, 0, 1, 1,
1.29838, -0.06007401, 1.29231, 1, 1, 1, 1, 1,
1.310892, 0.6888533, 0.6155239, 1, 1, 1, 1, 1,
1.337677, 1.039873, -1.512262, 1, 1, 1, 1, 1,
1.339872, -1.631705, 2.541035, 1, 1, 1, 1, 1,
1.340745, -0.8984879, 1.578175, 1, 1, 1, 1, 1,
1.351288, -0.4733657, 2.266332, 1, 1, 1, 1, 1,
1.35468, 0.0281655, 1.755885, 1, 1, 1, 1, 1,
1.356673, 0.9951938, 1.866408, 1, 1, 1, 1, 1,
1.358793, 1.332997, -1.346158, 1, 1, 1, 1, 1,
1.364962, 1.051091, 0.4342804, 1, 1, 1, 1, 1,
1.373531, 0.04333929, 2.109976, 1, 1, 1, 1, 1,
1.375013, 1.031482, 1.763008, 1, 1, 1, 1, 1,
1.377139, 1.153589, -0.8270108, 1, 1, 1, 1, 1,
1.377585, 0.9764799, -0.8157726, 1, 1, 1, 1, 1,
1.393891, -1.411214, 2.482096, 1, 1, 1, 1, 1,
1.39503, -0.1973771, 3.297297, 0, 0, 1, 1, 1,
1.408524, 0.1580589, 1.012828, 1, 0, 0, 1, 1,
1.420197, -0.2929215, 0.7917105, 1, 0, 0, 1, 1,
1.421297, -0.2941276, 2.369425, 1, 0, 0, 1, 1,
1.421534, 0.5690973, -0.43264, 1, 0, 0, 1, 1,
1.431388, 3.695933, 0.472418, 1, 0, 0, 1, 1,
1.433619, 0.220654, 1.189787, 0, 0, 0, 1, 1,
1.440597, -0.5640483, 0.3556026, 0, 0, 0, 1, 1,
1.443064, 0.1287596, 1.006728, 0, 0, 0, 1, 1,
1.451067, -1.168784, 1.862374, 0, 0, 0, 1, 1,
1.455341, -0.2796343, 0.787897, 0, 0, 0, 1, 1,
1.456414, 0.594784, 1.071764, 0, 0, 0, 1, 1,
1.461033, -1.678519, 1.297349, 0, 0, 0, 1, 1,
1.47639, -0.6253337, 1.614696, 1, 1, 1, 1, 1,
1.484192, 0.8048707, 1.291209, 1, 1, 1, 1, 1,
1.497071, 0.2379321, 0.9405028, 1, 1, 1, 1, 1,
1.501442, 0.5977001, 1.27522, 1, 1, 1, 1, 1,
1.508608, -0.8073388, 2.173072, 1, 1, 1, 1, 1,
1.521534, -0.7327729, 3.682272, 1, 1, 1, 1, 1,
1.544371, 0.8885788, 2.118074, 1, 1, 1, 1, 1,
1.545437, 1.645419, 1.325823, 1, 1, 1, 1, 1,
1.548687, -1.617034, 2.710805, 1, 1, 1, 1, 1,
1.558138, -0.203914, 1.895305, 1, 1, 1, 1, 1,
1.56005, -0.4508519, 1.429432, 1, 1, 1, 1, 1,
1.56633, 1.535808, 2.018143, 1, 1, 1, 1, 1,
1.573576, -0.4316727, 2.450782, 1, 1, 1, 1, 1,
1.584531, -0.7595774, 1.964248, 1, 1, 1, 1, 1,
1.592276, 1.095242, 0.8334436, 1, 1, 1, 1, 1,
1.605755, 0.08751534, 0.7875537, 0, 0, 1, 1, 1,
1.618842, 0.7823395, 3.36039, 1, 0, 0, 1, 1,
1.645867, 0.385914, 1.720913, 1, 0, 0, 1, 1,
1.649326, 0.1712594, 1.116379, 1, 0, 0, 1, 1,
1.649958, 0.094461, 1.74575, 1, 0, 0, 1, 1,
1.710685, 1.47775, 1.912965, 1, 0, 0, 1, 1,
1.713167, -1.522051, 3.184497, 0, 0, 0, 1, 1,
1.719564, -1.158311, -0.171004, 0, 0, 0, 1, 1,
1.722897, 0.566956, 1.165752, 0, 0, 0, 1, 1,
1.726876, -1.024355, 1.124142, 0, 0, 0, 1, 1,
1.751739, 0.9936697, 1.776694, 0, 0, 0, 1, 1,
1.772566, 0.7622484, -0.318811, 0, 0, 0, 1, 1,
1.777, 2.241366, 1.9738, 0, 0, 0, 1, 1,
1.795944, -1.275588, 2.171481, 1, 1, 1, 1, 1,
1.798837, -0.6546848, 3.74785, 1, 1, 1, 1, 1,
1.812877, 1.95457, 0.8823012, 1, 1, 1, 1, 1,
1.824769, 0.03927589, 2.25033, 1, 1, 1, 1, 1,
1.845009, 0.4506102, 0.1627819, 1, 1, 1, 1, 1,
1.846252, -1.610011, 2.411037, 1, 1, 1, 1, 1,
1.867515, -0.7570307, 2.321682, 1, 1, 1, 1, 1,
1.882569, 1.165211, 0.5471902, 1, 1, 1, 1, 1,
1.897708, 1.52373, 1.840523, 1, 1, 1, 1, 1,
1.906588, -1.895069, 1.256376, 1, 1, 1, 1, 1,
1.918997, -1.103578, 1.210138, 1, 1, 1, 1, 1,
1.933599, 0.6022782, -0.3367862, 1, 1, 1, 1, 1,
1.947929, 0.02477546, 2.146458, 1, 1, 1, 1, 1,
1.959936, -0.5318771, 2.981336, 1, 1, 1, 1, 1,
1.962902, 0.1480739, 1.121784, 1, 1, 1, 1, 1,
1.963337, 0.5945892, 0.8087489, 0, 0, 1, 1, 1,
1.970125, -0.8434205, 1.843973, 1, 0, 0, 1, 1,
2.097585, -0.5531259, 0.1976257, 1, 0, 0, 1, 1,
2.114338, -1.103608, 2.647811, 1, 0, 0, 1, 1,
2.14416, 0.6943915, 1.684107, 1, 0, 0, 1, 1,
2.186185, 0.7274067, 2.219426, 1, 0, 0, 1, 1,
2.210532, -0.2147884, 1.551134, 0, 0, 0, 1, 1,
2.276583, -1.39021, -0.01024642, 0, 0, 0, 1, 1,
2.282561, -1.685813, 1.700812, 0, 0, 0, 1, 1,
2.288368, 1.227427, 0.9514129, 0, 0, 0, 1, 1,
2.315236, 1.34495, -0.2952615, 0, 0, 0, 1, 1,
2.335892, -1.125853, 1.273571, 0, 0, 0, 1, 1,
2.463194, -1.039825, 2.171694, 0, 0, 0, 1, 1,
2.67226, -0.7777137, 1.012592, 1, 1, 1, 1, 1,
2.718211, 0.2145998, 1.576752, 1, 1, 1, 1, 1,
2.845006, 0.08934104, 0.5263876, 1, 1, 1, 1, 1,
2.911527, 0.130379, -1.011353, 1, 1, 1, 1, 1,
2.932822, 1.297058, 1.804577, 1, 1, 1, 1, 1,
3.212669, -0.779614, 2.630841, 1, 1, 1, 1, 1,
3.365875, 0.7340501, 1.074262, 1, 1, 1, 1, 1
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
var radius = 9.554056;
var distance = 33.55822;
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
mvMatrix.translate( -0.08885098, -0.2597218, 0.3492217 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.55822);
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