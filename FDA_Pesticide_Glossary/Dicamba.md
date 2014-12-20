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
-3.650011, -1.900018, -1.513083, 1, 0, 0, 1,
-3.023738, -0.04028236, -1.383919, 1, 0.007843138, 0, 1,
-2.93535, 0.7810315, -2.179359, 1, 0.01176471, 0, 1,
-2.716119, 1.139889, -0.1637937, 1, 0.01960784, 0, 1,
-2.696324, 0.4264385, 2.077801, 1, 0.02352941, 0, 1,
-2.574123, 0.9061037, -1.95999, 1, 0.03137255, 0, 1,
-2.515587, -0.1562057, -2.618109, 1, 0.03529412, 0, 1,
-2.480725, 0.5933903, -1.317523, 1, 0.04313726, 0, 1,
-2.414387, -1.399118, -0.7885307, 1, 0.04705882, 0, 1,
-2.412967, 0.6755206, -1.127496, 1, 0.05490196, 0, 1,
-2.323834, 2.02107, -2.493839, 1, 0.05882353, 0, 1,
-2.317653, -0.2912358, -0.5575793, 1, 0.06666667, 0, 1,
-2.299181, -0.3126889, -2.047893, 1, 0.07058824, 0, 1,
-2.274674, -0.01450882, -1.793971, 1, 0.07843138, 0, 1,
-2.252317, 0.7760844, -1.611796, 1, 0.08235294, 0, 1,
-2.212745, 0.4796159, 0.9773937, 1, 0.09019608, 0, 1,
-2.164922, -1.002759, -3.326697, 1, 0.09411765, 0, 1,
-2.114778, 1.875619, -1.562152, 1, 0.1019608, 0, 1,
-2.102407, -0.336862, -1.5047, 1, 0.1098039, 0, 1,
-2.067866, 0.004829522, -2.335735, 1, 0.1137255, 0, 1,
-2.057393, -0.6585397, -0.6387689, 1, 0.1215686, 0, 1,
-2.05111, -1.048369, 1.100351, 1, 0.1254902, 0, 1,
-2.022578, 2.247253, -1.786525, 1, 0.1333333, 0, 1,
-2.012396, -0.004032671, -2.750609, 1, 0.1372549, 0, 1,
-2.011761, -0.2352318, -1.401294, 1, 0.145098, 0, 1,
-2.008389, -0.5120746, -1.218926, 1, 0.1490196, 0, 1,
-2.001574, 0.378464, -2.475471, 1, 0.1568628, 0, 1,
-1.999115, 0.956593, 0.03025779, 1, 0.1607843, 0, 1,
-1.990349, 0.2692057, -1.285905, 1, 0.1686275, 0, 1,
-1.974855, -0.189986, -1.609046, 1, 0.172549, 0, 1,
-1.974228, 0.9138341, -0.940064, 1, 0.1803922, 0, 1,
-1.972426, -1.253879, 0.1242548, 1, 0.1843137, 0, 1,
-1.968425, 0.9784158, -1.403254, 1, 0.1921569, 0, 1,
-1.942508, 0.7130983, -1.402101, 1, 0.1960784, 0, 1,
-1.922552, 0.5179005, 1.208744, 1, 0.2039216, 0, 1,
-1.872008, -0.0547158, -2.284014, 1, 0.2117647, 0, 1,
-1.870513, -0.8349103, -2.255104, 1, 0.2156863, 0, 1,
-1.843481, 1.571243, -0.9889414, 1, 0.2235294, 0, 1,
-1.839865, -1.157778, -2.472357, 1, 0.227451, 0, 1,
-1.826373, 0.2769726, -1.829269, 1, 0.2352941, 0, 1,
-1.804236, -0.04453745, -3.403815, 1, 0.2392157, 0, 1,
-1.802385, 1.260129, -0.1891933, 1, 0.2470588, 0, 1,
-1.79523, 0.4589144, -1.42241, 1, 0.2509804, 0, 1,
-1.791212, 0.2246432, -1.545183, 1, 0.2588235, 0, 1,
-1.78287, -1.006299, -2.702174, 1, 0.2627451, 0, 1,
-1.782758, -0.6298143, -1.728099, 1, 0.2705882, 0, 1,
-1.777738, -0.1259185, -0.8146635, 1, 0.2745098, 0, 1,
-1.750573, -2.363034, -3.588497, 1, 0.282353, 0, 1,
-1.738239, 0.1930514, -0.5683369, 1, 0.2862745, 0, 1,
-1.733359, 0.05626088, -1.551819, 1, 0.2941177, 0, 1,
-1.714117, 0.7179157, 0.6209967, 1, 0.3019608, 0, 1,
-1.712193, -2.844035, -1.55031, 1, 0.3058824, 0, 1,
-1.704747, -1.090593, -1.721034, 1, 0.3137255, 0, 1,
-1.696339, -0.4204992, -2.024359, 1, 0.3176471, 0, 1,
-1.680902, -1.072031, -0.5853766, 1, 0.3254902, 0, 1,
-1.670514, -1.384034, -1.593606, 1, 0.3294118, 0, 1,
-1.664049, 0.9357575, 0.09399591, 1, 0.3372549, 0, 1,
-1.649262, -0.331984, -3.037778, 1, 0.3411765, 0, 1,
-1.649071, 0.4136194, -1.115217, 1, 0.3490196, 0, 1,
-1.646828, -0.2782314, -2.303594, 1, 0.3529412, 0, 1,
-1.645397, -0.9123197, -0.7039084, 1, 0.3607843, 0, 1,
-1.641815, -0.2858126, -0.7608104, 1, 0.3647059, 0, 1,
-1.633988, 0.2499431, -1.315109, 1, 0.372549, 0, 1,
-1.631503, 0.9737431, 0.08681194, 1, 0.3764706, 0, 1,
-1.604906, 0.4251877, -0.9389164, 1, 0.3843137, 0, 1,
-1.59936, 1.011426, -1.932225, 1, 0.3882353, 0, 1,
-1.583489, 1.944569, -0.6011157, 1, 0.3960784, 0, 1,
-1.580392, 0.9807231, 0.005708172, 1, 0.4039216, 0, 1,
-1.574115, 0.9728833, 0.1279085, 1, 0.4078431, 0, 1,
-1.565461, 1.116991, -1.369129, 1, 0.4156863, 0, 1,
-1.564209, 0.01666076, -1.142344, 1, 0.4196078, 0, 1,
-1.545681, 1.962741, -0.1141843, 1, 0.427451, 0, 1,
-1.544726, -0.1517777, -0.7994407, 1, 0.4313726, 0, 1,
-1.529903, 1.189324, -2.287203, 1, 0.4392157, 0, 1,
-1.519667, -0.704846, -0.05512614, 1, 0.4431373, 0, 1,
-1.514059, 1.103241, -0.7580189, 1, 0.4509804, 0, 1,
-1.508937, -1.361916, -1.253595, 1, 0.454902, 0, 1,
-1.507974, -1.072225, -2.715012, 1, 0.4627451, 0, 1,
-1.500516, -0.2870529, -1.999651, 1, 0.4666667, 0, 1,
-1.492535, -0.5930369, 0.03887359, 1, 0.4745098, 0, 1,
-1.469755, -0.5842822, -2.619823, 1, 0.4784314, 0, 1,
-1.467466, 1.751437, -2.512538, 1, 0.4862745, 0, 1,
-1.463302, -0.2286893, -1.846646, 1, 0.4901961, 0, 1,
-1.457198, -1.210214, -3.929777, 1, 0.4980392, 0, 1,
-1.440401, -1.668316, -1.909517, 1, 0.5058824, 0, 1,
-1.429835, -0.1013114, -0.9568982, 1, 0.509804, 0, 1,
-1.428397, -1.168877, -2.264016, 1, 0.5176471, 0, 1,
-1.425219, -1.295216, -2.290793, 1, 0.5215687, 0, 1,
-1.422155, 0.009401247, -3.218289, 1, 0.5294118, 0, 1,
-1.422025, -0.9571669, -2.737155, 1, 0.5333334, 0, 1,
-1.415051, -1.092785, -2.382762, 1, 0.5411765, 0, 1,
-1.397862, -0.280683, -1.631899, 1, 0.5450981, 0, 1,
-1.395519, 0.5299211, -1.579755, 1, 0.5529412, 0, 1,
-1.383455, 1.875616, -0.8402337, 1, 0.5568628, 0, 1,
-1.380736, 0.08087463, -2.178716, 1, 0.5647059, 0, 1,
-1.378417, 1.683139, -1.050163, 1, 0.5686275, 0, 1,
-1.351512, -2.00456, -2.845029, 1, 0.5764706, 0, 1,
-1.339891, -0.5347066, -1.213339, 1, 0.5803922, 0, 1,
-1.339396, 1.633605, 0.3803588, 1, 0.5882353, 0, 1,
-1.334633, 0.4518868, -3.000184, 1, 0.5921569, 0, 1,
-1.331875, -1.769422, -2.562414, 1, 0.6, 0, 1,
-1.320757, -0.6791912, -2.988148, 1, 0.6078432, 0, 1,
-1.317424, -0.0402478, -0.9863662, 1, 0.6117647, 0, 1,
-1.310435, -0.01485175, -2.885846, 1, 0.6196079, 0, 1,
-1.284126, -1.837376, -2.002186, 1, 0.6235294, 0, 1,
-1.284028, 1.80582, 0.7101602, 1, 0.6313726, 0, 1,
-1.278522, 1.318483, -0.4681421, 1, 0.6352941, 0, 1,
-1.250752, -1.422033, -1.520817, 1, 0.6431373, 0, 1,
-1.24736, 1.345079, -0.1035627, 1, 0.6470588, 0, 1,
-1.223936, 1.295312, -0.8645912, 1, 0.654902, 0, 1,
-1.205927, 1.382818, -0.2924637, 1, 0.6588235, 0, 1,
-1.201231, -0.2476469, -2.050843, 1, 0.6666667, 0, 1,
-1.200657, 0.4222464, -0.3203601, 1, 0.6705883, 0, 1,
-1.182231, -0.8252744, -3.857496, 1, 0.6784314, 0, 1,
-1.177287, 1.705483, 1.598745, 1, 0.682353, 0, 1,
-1.177135, 0.002935306, -0.7262957, 1, 0.6901961, 0, 1,
-1.17373, -1.80412, -2.378714, 1, 0.6941177, 0, 1,
-1.168653, 1.735153, -1.6738, 1, 0.7019608, 0, 1,
-1.163657, -0.2921383, -1.371381, 1, 0.7098039, 0, 1,
-1.16214, 0.6904981, 0.2136958, 1, 0.7137255, 0, 1,
-1.160682, -0.6003153, -2.114267, 1, 0.7215686, 0, 1,
-1.139232, 0.8771206, 0.1523652, 1, 0.7254902, 0, 1,
-1.133125, 0.1777092, -3.418752, 1, 0.7333333, 0, 1,
-1.132946, 0.4043508, -0.4244467, 1, 0.7372549, 0, 1,
-1.130343, -0.3542293, -3.066548, 1, 0.7450981, 0, 1,
-1.126788, 0.4590399, -1.552568, 1, 0.7490196, 0, 1,
-1.12573, -0.7592606, -2.557153, 1, 0.7568628, 0, 1,
-1.113935, 0.8911462, -1.857716, 1, 0.7607843, 0, 1,
-1.110616, 1.00952, -0.9585795, 1, 0.7686275, 0, 1,
-1.097294, 0.6298957, -2.49538, 1, 0.772549, 0, 1,
-1.087356, -1.412528, -1.600689, 1, 0.7803922, 0, 1,
-1.086288, -1.034047, -1.885285, 1, 0.7843137, 0, 1,
-1.084816, 0.4384188, -1.467049, 1, 0.7921569, 0, 1,
-1.0701, 1.784897, -1.621644, 1, 0.7960784, 0, 1,
-1.069608, 0.2706692, -1.405308, 1, 0.8039216, 0, 1,
-1.062507, 0.3614192, -1.403478, 1, 0.8117647, 0, 1,
-1.061859, -0.8176498, -0.2648584, 1, 0.8156863, 0, 1,
-1.058986, -0.1731997, -3.133792, 1, 0.8235294, 0, 1,
-1.05886, 0.392655, -1.915645, 1, 0.827451, 0, 1,
-1.055673, -1.888586, -0.2809034, 1, 0.8352941, 0, 1,
-1.053797, -1.327978, -3.002079, 1, 0.8392157, 0, 1,
-1.044317, -1.969524, -2.021856, 1, 0.8470588, 0, 1,
-1.040223, 1.117185, -2.419776, 1, 0.8509804, 0, 1,
-1.031905, -1.461284, -1.935015, 1, 0.8588235, 0, 1,
-1.02546, 0.5776201, -2.998915, 1, 0.8627451, 0, 1,
-1.017619, -1.674099, -5.310621, 1, 0.8705882, 0, 1,
-1.016994, 0.5269207, 0.4130534, 1, 0.8745098, 0, 1,
-1.016529, 1.508559, -0.6875318, 1, 0.8823529, 0, 1,
-1.014627, 0.3216336, 2.312701, 1, 0.8862745, 0, 1,
-1.002621, -1.686533, -3.170174, 1, 0.8941177, 0, 1,
-0.9879153, 0.4817826, -1.959351, 1, 0.8980392, 0, 1,
-0.9852372, -0.9704906, -2.279776, 1, 0.9058824, 0, 1,
-0.9846056, 0.2617621, -2.220476, 1, 0.9137255, 0, 1,
-0.9839079, -0.1646449, -2.307686, 1, 0.9176471, 0, 1,
-0.9710085, 0.1331827, -0.3681095, 1, 0.9254902, 0, 1,
-0.9646238, -0.2089445, -0.7276992, 1, 0.9294118, 0, 1,
-0.9551803, 0.1581971, -2.145076, 1, 0.9372549, 0, 1,
-0.9546776, -1.968555, -3.398342, 1, 0.9411765, 0, 1,
-0.9515962, -1.575549, -2.799909, 1, 0.9490196, 0, 1,
-0.9511636, -0.5057382, -2.946122, 1, 0.9529412, 0, 1,
-0.9435254, 0.9967143, -1.449346, 1, 0.9607843, 0, 1,
-0.9429168, -0.6139501, -2.664232, 1, 0.9647059, 0, 1,
-0.9421041, -1.498682, -2.029124, 1, 0.972549, 0, 1,
-0.9414262, 0.03992547, -0.9694036, 1, 0.9764706, 0, 1,
-0.9397094, 0.7200811, -1.96587, 1, 0.9843137, 0, 1,
-0.9354876, -1.017114, -4.10405, 1, 0.9882353, 0, 1,
-0.92693, -0.07660832, -2.889622, 1, 0.9960784, 0, 1,
-0.9268968, 0.3372023, -3.753105, 0.9960784, 1, 0, 1,
-0.9202032, -1.639646, -0.9221554, 0.9921569, 1, 0, 1,
-0.9194635, -1.158618, -3.36267, 0.9843137, 1, 0, 1,
-0.9179807, 2.158384, 0.2129357, 0.9803922, 1, 0, 1,
-0.9167184, -1.762423, -3.333613, 0.972549, 1, 0, 1,
-0.9089469, 2.17367, 0.3406014, 0.9686275, 1, 0, 1,
-0.9059054, -1.526232, -1.94496, 0.9607843, 1, 0, 1,
-0.8991668, 0.1508636, -0.1673657, 0.9568627, 1, 0, 1,
-0.8922033, 0.3218882, -1.695304, 0.9490196, 1, 0, 1,
-0.8880837, 0.591667, -0.9919766, 0.945098, 1, 0, 1,
-0.8767967, -0.6284785, -2.644619, 0.9372549, 1, 0, 1,
-0.8727978, 0.4382344, -1.048128, 0.9333333, 1, 0, 1,
-0.8625319, -0.06265144, -2.274962, 0.9254902, 1, 0, 1,
-0.8599823, 0.4867798, -2.764829, 0.9215686, 1, 0, 1,
-0.8527411, 0.6110987, 0.4046989, 0.9137255, 1, 0, 1,
-0.8523146, -0.6619838, -4.182751, 0.9098039, 1, 0, 1,
-0.8503582, 0.1265516, -2.084051, 0.9019608, 1, 0, 1,
-0.8341995, -2.004545, -1.209345, 0.8941177, 1, 0, 1,
-0.834083, -0.2159104, -3.021687, 0.8901961, 1, 0, 1,
-0.8320109, 1.057554, -1.123574, 0.8823529, 1, 0, 1,
-0.8298823, -0.06640009, -1.379184, 0.8784314, 1, 0, 1,
-0.8178329, 1.296347, 0.5839316, 0.8705882, 1, 0, 1,
-0.8168564, 0.5044106, -1.074237, 0.8666667, 1, 0, 1,
-0.8156633, 0.5685951, -2.304296, 0.8588235, 1, 0, 1,
-0.8146102, -0.5848877, -2.567944, 0.854902, 1, 0, 1,
-0.8087759, 1.569824, -0.8673582, 0.8470588, 1, 0, 1,
-0.8086358, -0.8888307, -4.256508, 0.8431373, 1, 0, 1,
-0.8079478, -1.362514, -1.905308, 0.8352941, 1, 0, 1,
-0.8054889, 1.026533, -0.310798, 0.8313726, 1, 0, 1,
-0.8041255, 0.5220987, 0.06176721, 0.8235294, 1, 0, 1,
-0.8041235, -0.3428667, -2.052451, 0.8196079, 1, 0, 1,
-0.8034102, -1.137121, -3.700376, 0.8117647, 1, 0, 1,
-0.7960143, 0.8532692, -0.4346929, 0.8078431, 1, 0, 1,
-0.7939306, 0.283372, -0.01828643, 0.8, 1, 0, 1,
-0.7903696, 0.8159299, -1.799528, 0.7921569, 1, 0, 1,
-0.7851743, -1.946762, 0.3120755, 0.7882353, 1, 0, 1,
-0.784938, 1.256247, -0.5032784, 0.7803922, 1, 0, 1,
-0.7847486, -2.323146, -3.92426, 0.7764706, 1, 0, 1,
-0.7837836, -0.5197433, -1.719773, 0.7686275, 1, 0, 1,
-0.7800647, 0.8677352, -1.891072, 0.7647059, 1, 0, 1,
-0.7789444, -0.2877307, 0.05262029, 0.7568628, 1, 0, 1,
-0.7736784, -0.9028618, -1.460393, 0.7529412, 1, 0, 1,
-0.7732466, 0.2700474, -2.795512, 0.7450981, 1, 0, 1,
-0.7682059, -0.0634038, -2.396876, 0.7411765, 1, 0, 1,
-0.7543271, 0.6433249, -1.78478, 0.7333333, 1, 0, 1,
-0.7504168, 0.6156198, -0.2760507, 0.7294118, 1, 0, 1,
-0.7449102, -0.5436981, -1.435724, 0.7215686, 1, 0, 1,
-0.7442275, 1.562418, -0.1030652, 0.7176471, 1, 0, 1,
-0.7439805, 0.5557517, -1.165943, 0.7098039, 1, 0, 1,
-0.743902, 0.4717771, -1.917569, 0.7058824, 1, 0, 1,
-0.7413409, 0.5397275, 0.447366, 0.6980392, 1, 0, 1,
-0.7377586, 1.798546, -0.3231651, 0.6901961, 1, 0, 1,
-0.7369426, 1.489922, -0.6225273, 0.6862745, 1, 0, 1,
-0.7297773, -1.216063, -2.842044, 0.6784314, 1, 0, 1,
-0.7260602, -1.739978, -4.542789, 0.6745098, 1, 0, 1,
-0.7250847, 0.7019349, 0.223016, 0.6666667, 1, 0, 1,
-0.7212195, -0.1256181, -3.343779, 0.6627451, 1, 0, 1,
-0.7191688, 1.051023, -0.5466319, 0.654902, 1, 0, 1,
-0.7160001, -0.4738837, -2.978496, 0.6509804, 1, 0, 1,
-0.7151079, 0.8493432, 0.1073948, 0.6431373, 1, 0, 1,
-0.7124946, 0.1897273, -1.913943, 0.6392157, 1, 0, 1,
-0.711663, -1.23674, -3.749668, 0.6313726, 1, 0, 1,
-0.7099174, -0.591455, -0.8820437, 0.627451, 1, 0, 1,
-0.7076821, 2.29971, 0.3235887, 0.6196079, 1, 0, 1,
-0.7047375, -1.529853, -2.064296, 0.6156863, 1, 0, 1,
-0.7030797, -1.940123, -5.185483, 0.6078432, 1, 0, 1,
-0.6925676, -1.90654, -3.47135, 0.6039216, 1, 0, 1,
-0.6900565, -0.4389625, -2.774083, 0.5960785, 1, 0, 1,
-0.6890108, -1.918934, -1.79141, 0.5882353, 1, 0, 1,
-0.6840298, -0.6172626, -2.180121, 0.5843138, 1, 0, 1,
-0.6834566, -0.05726559, -1.194895, 0.5764706, 1, 0, 1,
-0.680873, 0.6381081, -0.9644547, 0.572549, 1, 0, 1,
-0.6787971, -0.2604336, -0.6894355, 0.5647059, 1, 0, 1,
-0.6756483, -1.439686, -2.322991, 0.5607843, 1, 0, 1,
-0.6732072, -0.4431874, -1.827729, 0.5529412, 1, 0, 1,
-0.6678036, -0.6720636, -3.309453, 0.5490196, 1, 0, 1,
-0.66673, 0.3027639, -2.718394, 0.5411765, 1, 0, 1,
-0.66179, 1.115427, -0.2531581, 0.5372549, 1, 0, 1,
-0.6507884, -1.322983, -1.411887, 0.5294118, 1, 0, 1,
-0.6478719, -0.4827735, -2.480482, 0.5254902, 1, 0, 1,
-0.6419774, 0.9621096, 0.5578191, 0.5176471, 1, 0, 1,
-0.638091, -1.879764, -0.7397941, 0.5137255, 1, 0, 1,
-0.6313725, -0.9103457, -1.044695, 0.5058824, 1, 0, 1,
-0.6310329, 0.9823185, -0.5018722, 0.5019608, 1, 0, 1,
-0.6293511, 0.1178935, 0.363359, 0.4941176, 1, 0, 1,
-0.6253833, 0.3206233, 0.4612136, 0.4862745, 1, 0, 1,
-0.6174961, -0.03555772, -2.930619, 0.4823529, 1, 0, 1,
-0.6171806, 0.7258621, -0.0712912, 0.4745098, 1, 0, 1,
-0.6163247, 2.694921, -1.11893, 0.4705882, 1, 0, 1,
-0.616275, -0.4148434, -2.011519, 0.4627451, 1, 0, 1,
-0.615288, -0.2753924, -2.395164, 0.4588235, 1, 0, 1,
-0.6141582, 1.437163, -2.224589, 0.4509804, 1, 0, 1,
-0.6140146, 0.7578743, -1.158962, 0.4470588, 1, 0, 1,
-0.6109475, 0.1916578, 0.4226085, 0.4392157, 1, 0, 1,
-0.6108528, -0.3786214, -2.617623, 0.4352941, 1, 0, 1,
-0.6086344, -2.438214, -3.105732, 0.427451, 1, 0, 1,
-0.6019676, 0.1027521, -2.139997, 0.4235294, 1, 0, 1,
-0.5993448, 0.1943099, -0.217612, 0.4156863, 1, 0, 1,
-0.5990618, 0.658496, -3.042887, 0.4117647, 1, 0, 1,
-0.5911108, 1.825339, -1.182634, 0.4039216, 1, 0, 1,
-0.5835235, -0.975426, -1.63208, 0.3960784, 1, 0, 1,
-0.5785435, -2.065061, -3.718628, 0.3921569, 1, 0, 1,
-0.5773324, -0.4471392, -3.014651, 0.3843137, 1, 0, 1,
-0.5724714, -1.122159, -2.463671, 0.3803922, 1, 0, 1,
-0.5693205, -0.4802903, -2.737719, 0.372549, 1, 0, 1,
-0.5608758, -1.281916, -4.401112, 0.3686275, 1, 0, 1,
-0.5562184, -0.01584239, -1.08778, 0.3607843, 1, 0, 1,
-0.5549145, -0.4448768, -1.529481, 0.3568628, 1, 0, 1,
-0.5546497, 0.9426469, -0.8428043, 0.3490196, 1, 0, 1,
-0.5516495, 1.295202, 0.4450011, 0.345098, 1, 0, 1,
-0.5488878, 0.1996861, -1.27186, 0.3372549, 1, 0, 1,
-0.5450791, 0.7062517, 0.811625, 0.3333333, 1, 0, 1,
-0.5443807, -0.2581961, -4.189095, 0.3254902, 1, 0, 1,
-0.5439202, -1.391091, -3.373185, 0.3215686, 1, 0, 1,
-0.540893, 0.650392, -0.4467402, 0.3137255, 1, 0, 1,
-0.5407501, -0.2058621, -2.192636, 0.3098039, 1, 0, 1,
-0.5406971, 0.6443781, 0.6084903, 0.3019608, 1, 0, 1,
-0.525364, 0.2489083, -2.146551, 0.2941177, 1, 0, 1,
-0.5252488, -2.764623, -1.280418, 0.2901961, 1, 0, 1,
-0.5229421, 0.6064042, 0.6123885, 0.282353, 1, 0, 1,
-0.5205883, 2.195785, -0.1819668, 0.2784314, 1, 0, 1,
-0.5195275, -2.460057, -1.711183, 0.2705882, 1, 0, 1,
-0.5159, 0.2565785, -2.74867, 0.2666667, 1, 0, 1,
-0.5147495, 0.2784477, -1.790722, 0.2588235, 1, 0, 1,
-0.5043401, 0.8650031, -0.01042658, 0.254902, 1, 0, 1,
-0.5042713, -0.5036803, -1.509076, 0.2470588, 1, 0, 1,
-0.4983647, -0.8404766, -3.082506, 0.2431373, 1, 0, 1,
-0.4982355, 0.3283205, -0.4277865, 0.2352941, 1, 0, 1,
-0.4920907, 0.3204155, -1.730203, 0.2313726, 1, 0, 1,
-0.4749285, 0.2879173, -0.6800506, 0.2235294, 1, 0, 1,
-0.4742115, -0.07185334, -2.634535, 0.2196078, 1, 0, 1,
-0.4699825, -0.4043017, -1.575215, 0.2117647, 1, 0, 1,
-0.4693983, 0.4383683, 1.16799, 0.2078431, 1, 0, 1,
-0.4627593, -0.5364684, -4.011957, 0.2, 1, 0, 1,
-0.461787, -0.01687532, -1.509586, 0.1921569, 1, 0, 1,
-0.4596259, -0.09292429, -2.623595, 0.1882353, 1, 0, 1,
-0.4551873, 0.5809515, -0.7464383, 0.1803922, 1, 0, 1,
-0.4455409, -0.6720046, -3.591939, 0.1764706, 1, 0, 1,
-0.4350173, -0.4430146, -2.656226, 0.1686275, 1, 0, 1,
-0.4333654, 0.1740622, -1.703227, 0.1647059, 1, 0, 1,
-0.4269576, -1.24541, -1.411134, 0.1568628, 1, 0, 1,
-0.4195378, 1.428249, -0.09512407, 0.1529412, 1, 0, 1,
-0.4155005, 1.554949, 0.8391621, 0.145098, 1, 0, 1,
-0.4123864, -0.3612197, -2.312424, 0.1411765, 1, 0, 1,
-0.4107771, -1.296895, -2.89596, 0.1333333, 1, 0, 1,
-0.4107443, -0.3875871, -4.118558, 0.1294118, 1, 0, 1,
-0.4091336, -0.1680179, -0.3415322, 0.1215686, 1, 0, 1,
-0.408376, -1.676008, -3.545639, 0.1176471, 1, 0, 1,
-0.3976021, 1.102885, 0.05403804, 0.1098039, 1, 0, 1,
-0.3959886, -0.9607383, -1.507951, 0.1058824, 1, 0, 1,
-0.3951156, -0.5380364, -1.780386, 0.09803922, 1, 0, 1,
-0.3946579, 0.225624, -0.6942393, 0.09019608, 1, 0, 1,
-0.3883266, 0.2687974, -1.501454, 0.08627451, 1, 0, 1,
-0.3863913, 0.4077787, -1.168681, 0.07843138, 1, 0, 1,
-0.3847622, 1.716069, 0.1199679, 0.07450981, 1, 0, 1,
-0.3844421, 0.641193, -0.3020535, 0.06666667, 1, 0, 1,
-0.3823121, 0.5630491, -1.646351, 0.0627451, 1, 0, 1,
-0.3813719, 1.608593, 0.5090994, 0.05490196, 1, 0, 1,
-0.3808794, -2.259846, -3.500757, 0.05098039, 1, 0, 1,
-0.3808714, -1.099689, -3.170691, 0.04313726, 1, 0, 1,
-0.377113, 0.5545836, 0.01677436, 0.03921569, 1, 0, 1,
-0.3727115, -0.9828526, -3.528215, 0.03137255, 1, 0, 1,
-0.3721283, -0.5322031, -2.536676, 0.02745098, 1, 0, 1,
-0.3689696, -1.289744, -3.940723, 0.01960784, 1, 0, 1,
-0.3687759, -1.061379, -2.700366, 0.01568628, 1, 0, 1,
-0.3660668, 0.5225009, 0.2195993, 0.007843138, 1, 0, 1,
-0.3648375, 1.161705, -0.08447202, 0.003921569, 1, 0, 1,
-0.3645671, -0.01767069, -2.141164, 0, 1, 0.003921569, 1,
-0.3638281, 0.6712371, 0.04935846, 0, 1, 0.01176471, 1,
-0.3616728, -0.03801732, -2.273978, 0, 1, 0.01568628, 1,
-0.3607754, 0.3367681, -1.153576, 0, 1, 0.02352941, 1,
-0.3543088, -0.07084529, -1.775096, 0, 1, 0.02745098, 1,
-0.3534889, 0.2355714, -2.042576, 0, 1, 0.03529412, 1,
-0.352583, 0.1821984, -2.59006, 0, 1, 0.03921569, 1,
-0.3495663, 0.1028915, -0.5111635, 0, 1, 0.04705882, 1,
-0.3481654, 0.3881862, -0.5537966, 0, 1, 0.05098039, 1,
-0.3472425, 0.1710451, -1.131812, 0, 1, 0.05882353, 1,
-0.3398042, 0.3255136, -0.4767936, 0, 1, 0.0627451, 1,
-0.3364603, 0.1952993, -1.93193, 0, 1, 0.07058824, 1,
-0.3322826, 0.6395693, -1.763333, 0, 1, 0.07450981, 1,
-0.3308895, -0.3213821, -3.004177, 0, 1, 0.08235294, 1,
-0.3288104, -0.3839161, -1.321267, 0, 1, 0.08627451, 1,
-0.3279608, 1.609069, -0.237519, 0, 1, 0.09411765, 1,
-0.321968, 0.3641485, 0.3190102, 0, 1, 0.1019608, 1,
-0.3189943, 0.588269, -2.299189, 0, 1, 0.1058824, 1,
-0.3177666, -2.128231, -2.92497, 0, 1, 0.1137255, 1,
-0.3170561, -0.6503252, -3.40759, 0, 1, 0.1176471, 1,
-0.3166588, 1.169146, -0.5513185, 0, 1, 0.1254902, 1,
-0.3101488, -1.484522, -4.783883, 0, 1, 0.1294118, 1,
-0.3082263, 0.3696982, 0.4499089, 0, 1, 0.1372549, 1,
-0.3058812, -0.5007149, -3.83146, 0, 1, 0.1411765, 1,
-0.3026254, 1.337251, 0.104747, 0, 1, 0.1490196, 1,
-0.3019687, 0.1872484, 0.2234787, 0, 1, 0.1529412, 1,
-0.3015919, 0.116779, -2.385033, 0, 1, 0.1607843, 1,
-0.2996842, -0.1972805, -1.980831, 0, 1, 0.1647059, 1,
-0.2992616, -0.1120776, -3.346048, 0, 1, 0.172549, 1,
-0.2988682, -0.3965155, -0.375123, 0, 1, 0.1764706, 1,
-0.2940892, 0.02294484, -0.5231799, 0, 1, 0.1843137, 1,
-0.2918559, -0.3083057, -3.400491, 0, 1, 0.1882353, 1,
-0.2902434, -2.005462, -3.053536, 0, 1, 0.1960784, 1,
-0.2879715, 0.7984184, 0.3573569, 0, 1, 0.2039216, 1,
-0.2864272, -1.085773, -2.185528, 0, 1, 0.2078431, 1,
-0.2839893, -0.2908299, -3.118958, 0, 1, 0.2156863, 1,
-0.2835737, 1.509813, -1.167077, 0, 1, 0.2196078, 1,
-0.2811147, 0.7624524, -0.1378878, 0, 1, 0.227451, 1,
-0.2733533, -0.04219829, 0.4224942, 0, 1, 0.2313726, 1,
-0.2669217, -0.1720303, -1.953419, 0, 1, 0.2392157, 1,
-0.2658827, -0.02138864, -1.924151, 0, 1, 0.2431373, 1,
-0.2644487, 0.02431117, -1.037012, 0, 1, 0.2509804, 1,
-0.2611304, 0.8358851, -1.164499, 0, 1, 0.254902, 1,
-0.2595762, 2.036033, 0.5927734, 0, 1, 0.2627451, 1,
-0.256238, -0.1403747, -1.162924, 0, 1, 0.2666667, 1,
-0.2551284, 0.5751686, -2.320068, 0, 1, 0.2745098, 1,
-0.2525261, -0.6319133, -3.789076, 0, 1, 0.2784314, 1,
-0.2511997, -1.102738, -3.119499, 0, 1, 0.2862745, 1,
-0.2504248, 0.7770653, 0.8017547, 0, 1, 0.2901961, 1,
-0.2496867, 0.4543348, -1.574814, 0, 1, 0.2980392, 1,
-0.2496356, 0.7558239, 0.06085233, 0, 1, 0.3058824, 1,
-0.2484824, -0.7684626, -2.664654, 0, 1, 0.3098039, 1,
-0.2442248, 0.7766919, -0.6330897, 0, 1, 0.3176471, 1,
-0.2439095, 0.7631773, 1.013084, 0, 1, 0.3215686, 1,
-0.2371197, -0.2273988, -2.253908, 0, 1, 0.3294118, 1,
-0.2354975, -0.3541646, -1.800398, 0, 1, 0.3333333, 1,
-0.2289525, 1.480477, 0.05214067, 0, 1, 0.3411765, 1,
-0.2275379, 0.5467194, -0.3369654, 0, 1, 0.345098, 1,
-0.2272611, -0.3913783, -3.001473, 0, 1, 0.3529412, 1,
-0.2248301, 0.8015599, 0.002948882, 0, 1, 0.3568628, 1,
-0.2235444, 1.121537, 1.302973, 0, 1, 0.3647059, 1,
-0.2230616, -0.3123499, -2.670147, 0, 1, 0.3686275, 1,
-0.222961, -0.1932144, -3.439353, 0, 1, 0.3764706, 1,
-0.2155168, -1.998638, -3.582224, 0, 1, 0.3803922, 1,
-0.2113837, 0.7009444, -0.3800862, 0, 1, 0.3882353, 1,
-0.2053698, -0.9979334, -2.812292, 0, 1, 0.3921569, 1,
-0.2042188, 3.104788, 0.9888517, 0, 1, 0.4, 1,
-0.203104, -0.2890773, -1.840801, 0, 1, 0.4078431, 1,
-0.1912065, 0.3858021, 0.2073901, 0, 1, 0.4117647, 1,
-0.1864792, 0.2897303, -1.132286, 0, 1, 0.4196078, 1,
-0.1860433, 0.7808833, 1.348458, 0, 1, 0.4235294, 1,
-0.185028, 1.458177, 0.7348474, 0, 1, 0.4313726, 1,
-0.1803938, -2.156249, -4.077361, 0, 1, 0.4352941, 1,
-0.1777855, 1.006987, -0.6131253, 0, 1, 0.4431373, 1,
-0.1770367, 0.9933348, -1.050052, 0, 1, 0.4470588, 1,
-0.1730484, -0.1997129, -2.074323, 0, 1, 0.454902, 1,
-0.1712033, 0.3691696, -1.253733, 0, 1, 0.4588235, 1,
-0.1652785, -0.1624332, -2.484155, 0, 1, 0.4666667, 1,
-0.1647426, 1.869938, -0.0640722, 0, 1, 0.4705882, 1,
-0.1645612, 0.844886, -0.5861573, 0, 1, 0.4784314, 1,
-0.1617785, -0.3192412, -1.545834, 0, 1, 0.4823529, 1,
-0.1583691, -0.8116586, -2.552519, 0, 1, 0.4901961, 1,
-0.1561339, -0.3783281, -2.866654, 0, 1, 0.4941176, 1,
-0.1557619, -0.2965729, -2.365198, 0, 1, 0.5019608, 1,
-0.153708, 0.7580433, -0.1804488, 0, 1, 0.509804, 1,
-0.149717, -0.8508022, -3.258819, 0, 1, 0.5137255, 1,
-0.1479824, -0.02750193, -2.415363, 0, 1, 0.5215687, 1,
-0.1466729, 0.8430733, -0.1261262, 0, 1, 0.5254902, 1,
-0.1415668, -0.1592437, -2.643115, 0, 1, 0.5333334, 1,
-0.1382777, 0.7001621, 1.099603, 0, 1, 0.5372549, 1,
-0.1379568, -1.042141, -3.054037, 0, 1, 0.5450981, 1,
-0.134678, -1.283619, -3.476733, 0, 1, 0.5490196, 1,
-0.1309546, -0.5982314, -0.9833674, 0, 1, 0.5568628, 1,
-0.1305196, 0.5462533, -0.1963833, 0, 1, 0.5607843, 1,
-0.1295825, 0.9323052, -0.2436015, 0, 1, 0.5686275, 1,
-0.1270636, 1.339379, 1.748726, 0, 1, 0.572549, 1,
-0.1260592, -1.566701, -2.265693, 0, 1, 0.5803922, 1,
-0.118632, -0.9071478, -2.716736, 0, 1, 0.5843138, 1,
-0.1179576, 0.8930773, 0.05135183, 0, 1, 0.5921569, 1,
-0.1140447, -0.3674278, -1.698985, 0, 1, 0.5960785, 1,
-0.1120476, -0.4467117, -3.240694, 0, 1, 0.6039216, 1,
-0.1111226, -0.8529044, -3.523245, 0, 1, 0.6117647, 1,
-0.1104527, 0.9140983, -1.022691, 0, 1, 0.6156863, 1,
-0.1094067, 1.347491, -0.1956918, 0, 1, 0.6235294, 1,
-0.1079897, 1.154214, -1.358803, 0, 1, 0.627451, 1,
-0.1041763, -0.340125, -3.794471, 0, 1, 0.6352941, 1,
-0.1033374, 0.6994432, -0.6683764, 0, 1, 0.6392157, 1,
-0.1030555, -0.05035144, -1.870784, 0, 1, 0.6470588, 1,
-0.101882, -1.510325, -2.097407, 0, 1, 0.6509804, 1,
-0.09924833, 1.706815, -0.2422252, 0, 1, 0.6588235, 1,
-0.09346734, 0.03334581, -1.076139, 0, 1, 0.6627451, 1,
-0.0896512, 0.8989995, 0.5348759, 0, 1, 0.6705883, 1,
-0.08776435, -0.6407741, -2.690161, 0, 1, 0.6745098, 1,
-0.0816774, -1.347024, -3.427618, 0, 1, 0.682353, 1,
-0.07556282, 1.011684, -0.9393016, 0, 1, 0.6862745, 1,
-0.0738285, -1.547606, -4.18943, 0, 1, 0.6941177, 1,
-0.07360338, -0.19373, -3.619269, 0, 1, 0.7019608, 1,
-0.07325754, -0.2382816, -3.266007, 0, 1, 0.7058824, 1,
-0.07115455, -2.817048, -3.932323, 0, 1, 0.7137255, 1,
-0.06862964, -1.670743, -1.626637, 0, 1, 0.7176471, 1,
-0.06454056, 1.137363, 0.5124496, 0, 1, 0.7254902, 1,
-0.06434396, -0.2199039, -2.49447, 0, 1, 0.7294118, 1,
-0.063899, 2.407408, -0.8126585, 0, 1, 0.7372549, 1,
-0.06211808, 0.2343904, 0.2861371, 0, 1, 0.7411765, 1,
-0.06197607, 1.887486, -0.08775822, 0, 1, 0.7490196, 1,
-0.06170937, 1.180995, -0.3234849, 0, 1, 0.7529412, 1,
-0.05721763, -1.076095, -2.597302, 0, 1, 0.7607843, 1,
-0.05433492, -1.158242, -4.201015, 0, 1, 0.7647059, 1,
-0.0539074, -0.7590817, -3.511795, 0, 1, 0.772549, 1,
-0.05302908, -1.550075, -2.306283, 0, 1, 0.7764706, 1,
-0.05202622, 0.4116969, -1.62793, 0, 1, 0.7843137, 1,
-0.04884749, -1.680752, -3.716404, 0, 1, 0.7882353, 1,
-0.0433604, -0.1500506, -3.295918, 0, 1, 0.7960784, 1,
-0.03995623, -0.9820361, -2.581562, 0, 1, 0.8039216, 1,
-0.03467156, -0.1584321, -0.5907593, 0, 1, 0.8078431, 1,
-0.03197361, 0.8028851, 0.1489199, 0, 1, 0.8156863, 1,
-0.0302834, 0.2882878, 2.623978, 0, 1, 0.8196079, 1,
-0.0276154, 1.133579, 0.2048997, 0, 1, 0.827451, 1,
-0.02662438, 0.6089051, 0.01745996, 0, 1, 0.8313726, 1,
-0.025105, 1.491302, -2.150775, 0, 1, 0.8392157, 1,
-0.02486282, 0.1394619, -0.8656839, 0, 1, 0.8431373, 1,
-0.0244638, 0.9831023, -0.4308145, 0, 1, 0.8509804, 1,
-0.01935947, -1.763408, -3.984178, 0, 1, 0.854902, 1,
-0.01890748, 0.2375894, -0.1516334, 0, 1, 0.8627451, 1,
-0.0172412, -0.3644076, -3.234313, 0, 1, 0.8666667, 1,
-0.01671961, 0.7880613, -0.8557696, 0, 1, 0.8745098, 1,
-0.01475451, -0.9688546, -4.592541, 0, 1, 0.8784314, 1,
-0.01202753, -0.1363288, -3.442685, 0, 1, 0.8862745, 1,
-0.006357146, 0.1891836, -1.458035, 0, 1, 0.8901961, 1,
-0.006068343, 0.2170204, 0.2256523, 0, 1, 0.8980392, 1,
-0.003867765, -0.06927069, -3.687571, 0, 1, 0.9058824, 1,
-0.003616524, 0.8921931, 1.088242, 0, 1, 0.9098039, 1,
-0.002881362, -1.263349, -4.629874, 0, 1, 0.9176471, 1,
-0.001065601, 0.6529141, 0.1190939, 0, 1, 0.9215686, 1,
-0.0008158732, 0.9732339, -0.6568517, 0, 1, 0.9294118, 1,
0.00288765, 0.636593, -1.340459, 0, 1, 0.9333333, 1,
0.007155057, 2.133384, -0.09648562, 0, 1, 0.9411765, 1,
0.008232228, -0.4902986, 2.517868, 0, 1, 0.945098, 1,
0.008565607, -2.035616, 2.768767, 0, 1, 0.9529412, 1,
0.008731369, -0.2171762, 1.246952, 0, 1, 0.9568627, 1,
0.01132831, -0.1454503, 3.928037, 0, 1, 0.9647059, 1,
0.01290033, 0.8433915, -0.8006303, 0, 1, 0.9686275, 1,
0.01793756, -0.5937102, 3.993411, 0, 1, 0.9764706, 1,
0.02201086, 0.1527826, -0.3298959, 0, 1, 0.9803922, 1,
0.03506582, 0.003019199, 1.724063, 0, 1, 0.9882353, 1,
0.04795164, -0.5846097, 3.562674, 0, 1, 0.9921569, 1,
0.04854098, -0.6793731, 3.58544, 0, 1, 1, 1,
0.05081281, 1.017253, 0.5550982, 0, 0.9921569, 1, 1,
0.05261125, 0.9734386, 0.5038254, 0, 0.9882353, 1, 1,
0.05274002, 1.017548, -0.2526344, 0, 0.9803922, 1, 1,
0.05493193, 1.50913, 0.2505231, 0, 0.9764706, 1, 1,
0.05723947, -0.2481972, 3.759956, 0, 0.9686275, 1, 1,
0.05741769, -0.2457254, 2.382899, 0, 0.9647059, 1, 1,
0.05929854, 0.9018522, -0.179875, 0, 0.9568627, 1, 1,
0.06095906, 1.051143, 1.231339, 0, 0.9529412, 1, 1,
0.06847972, 0.1688142, 1.632867, 0, 0.945098, 1, 1,
0.06910348, -0.5488139, 2.61646, 0, 0.9411765, 1, 1,
0.07135347, 0.00617451, 1.132074, 0, 0.9333333, 1, 1,
0.07485624, 1.597082, -0.16555, 0, 0.9294118, 1, 1,
0.07615295, 0.3396572, -0.9414981, 0, 0.9215686, 1, 1,
0.07771955, 0.01284347, 0.888686, 0, 0.9176471, 1, 1,
0.07794525, -0.5403622, 2.617816, 0, 0.9098039, 1, 1,
0.0782968, 0.3376343, -0.1499028, 0, 0.9058824, 1, 1,
0.07941049, -0.7352458, 0.9123648, 0, 0.8980392, 1, 1,
0.08042017, -0.1470813, 1.7363, 0, 0.8901961, 1, 1,
0.08338065, -0.721355, 3.743379, 0, 0.8862745, 1, 1,
0.08597922, -0.6028091, 1.292597, 0, 0.8784314, 1, 1,
0.08653621, 0.5606142, 0.6430404, 0, 0.8745098, 1, 1,
0.09135579, -0.2281446, 1.9433, 0, 0.8666667, 1, 1,
0.09233847, -0.01746064, 2.597271, 0, 0.8627451, 1, 1,
0.09250766, 0.3613587, -0.8856241, 0, 0.854902, 1, 1,
0.09412661, -0.9116683, 2.638103, 0, 0.8509804, 1, 1,
0.09497681, 0.477974, -0.4379315, 0, 0.8431373, 1, 1,
0.1029911, 2.410769, -0.3360234, 0, 0.8392157, 1, 1,
0.1076722, 0.6112307, 0.8709018, 0, 0.8313726, 1, 1,
0.1109318, -0.8244402, 4.175407, 0, 0.827451, 1, 1,
0.1116815, 1.039287, 1.173916, 0, 0.8196079, 1, 1,
0.1127974, -0.03432725, 2.196812, 0, 0.8156863, 1, 1,
0.1129033, 0.7534504, -1.124917, 0, 0.8078431, 1, 1,
0.1130824, 0.1105927, 0.6810924, 0, 0.8039216, 1, 1,
0.1132691, 1.239534, 0.3437332, 0, 0.7960784, 1, 1,
0.1139318, 0.9429446, -0.7155726, 0, 0.7882353, 1, 1,
0.1144904, -1.245151, 4.337865, 0, 0.7843137, 1, 1,
0.1195335, 0.2778332, -0.06510363, 0, 0.7764706, 1, 1,
0.1203253, 0.6248964, -0.455366, 0, 0.772549, 1, 1,
0.1207095, 3.548628, 0.3224082, 0, 0.7647059, 1, 1,
0.1221893, -0.5821904, 3.049253, 0, 0.7607843, 1, 1,
0.1222785, -1.107705, 3.322862, 0, 0.7529412, 1, 1,
0.1261909, -0.4640527, 3.012493, 0, 0.7490196, 1, 1,
0.1273865, 1.293913, 1.025416, 0, 0.7411765, 1, 1,
0.1329995, 0.5450522, -0.02494311, 0, 0.7372549, 1, 1,
0.1336077, -0.9803168, 3.744566, 0, 0.7294118, 1, 1,
0.1349417, 1.468214, 0.4215081, 0, 0.7254902, 1, 1,
0.135913, -0.2949986, 2.413284, 0, 0.7176471, 1, 1,
0.1419375, 1.515549, -0.74207, 0, 0.7137255, 1, 1,
0.1433052, -0.7735202, 1.989882, 0, 0.7058824, 1, 1,
0.1503456, 2.172451, 1.041503, 0, 0.6980392, 1, 1,
0.1505436, -1.175562, 6.003023, 0, 0.6941177, 1, 1,
0.1519967, -0.6713885, 3.164954, 0, 0.6862745, 1, 1,
0.1539204, 0.5680969, 0.6775004, 0, 0.682353, 1, 1,
0.1558511, 0.6046056, 2.027455, 0, 0.6745098, 1, 1,
0.1584858, 1.008503, -1.361044, 0, 0.6705883, 1, 1,
0.1587047, -0.9079559, 2.45602, 0, 0.6627451, 1, 1,
0.1587192, -0.08460648, 0.8366763, 0, 0.6588235, 1, 1,
0.1694499, -0.7472358, 2.55103, 0, 0.6509804, 1, 1,
0.1702041, 0.7669712, -1.073075, 0, 0.6470588, 1, 1,
0.175534, 0.03471401, 2.446151, 0, 0.6392157, 1, 1,
0.1779979, 0.8037261, -0.2614022, 0, 0.6352941, 1, 1,
0.179361, -1.958228, 3.276208, 0, 0.627451, 1, 1,
0.179802, -1.808239, 2.284856, 0, 0.6235294, 1, 1,
0.1845436, -0.171624, 3.200265, 0, 0.6156863, 1, 1,
0.1855115, 1.772501, 0.2352972, 0, 0.6117647, 1, 1,
0.187862, 0.3656048, -0.8340067, 0, 0.6039216, 1, 1,
0.194051, -1.357603, 2.876256, 0, 0.5960785, 1, 1,
0.1980031, 0.5256271, -0.5490073, 0, 0.5921569, 1, 1,
0.199211, 0.8085761, 0.05233347, 0, 0.5843138, 1, 1,
0.2007576, -1.099478, 3.39472, 0, 0.5803922, 1, 1,
0.2027929, -0.6641068, 4.572718, 0, 0.572549, 1, 1,
0.2039769, -0.502661, 2.650608, 0, 0.5686275, 1, 1,
0.2050461, 2.077927, 0.1840128, 0, 0.5607843, 1, 1,
0.2130219, -2.224395, 2.123767, 0, 0.5568628, 1, 1,
0.2179584, -0.3533327, 1.024102, 0, 0.5490196, 1, 1,
0.2192937, 1.922929, -0.9939452, 0, 0.5450981, 1, 1,
0.2199868, -0.4901049, 2.683828, 0, 0.5372549, 1, 1,
0.2204627, -0.453312, 2.614586, 0, 0.5333334, 1, 1,
0.2279272, 0.4689822, -0.8933195, 0, 0.5254902, 1, 1,
0.2283255, -0.4577607, 5.073354, 0, 0.5215687, 1, 1,
0.2309787, 0.4858681, 0.9102907, 0, 0.5137255, 1, 1,
0.2310682, -1.105748, 2.077288, 0, 0.509804, 1, 1,
0.2328485, 0.5737625, 0.1992004, 0, 0.5019608, 1, 1,
0.2329252, 1.47667, 0.5089483, 0, 0.4941176, 1, 1,
0.2365078, -1.745386, 3.940762, 0, 0.4901961, 1, 1,
0.2365282, 0.7901198, 1.982456, 0, 0.4823529, 1, 1,
0.2365412, 1.224164, 1.077541, 0, 0.4784314, 1, 1,
0.2398498, 0.5246151, 0.2041792, 0, 0.4705882, 1, 1,
0.2403215, 0.9223239, 1.97371, 0, 0.4666667, 1, 1,
0.2411958, -0.5870111, 0.9195268, 0, 0.4588235, 1, 1,
0.2416986, -0.1820958, 2.899048, 0, 0.454902, 1, 1,
0.2532852, 1.133905, 2.120004, 0, 0.4470588, 1, 1,
0.2546701, 0.7426865, 1.38401, 0, 0.4431373, 1, 1,
0.2553046, 1.049282, 0.7946922, 0, 0.4352941, 1, 1,
0.2555556, 0.4743514, 2.067011, 0, 0.4313726, 1, 1,
0.2555714, -0.9298133, 1.511067, 0, 0.4235294, 1, 1,
0.2638343, 2.732067, 0.9133285, 0, 0.4196078, 1, 1,
0.2663468, 0.3218223, 1.110751, 0, 0.4117647, 1, 1,
0.2713525, 0.9455261, 0.3963673, 0, 0.4078431, 1, 1,
0.2721945, 0.4189928, 1.04453, 0, 0.4, 1, 1,
0.2743096, -0.3374119, 2.001929, 0, 0.3921569, 1, 1,
0.2794307, -0.02782771, 1.348272, 0, 0.3882353, 1, 1,
0.2796447, 0.4614425, 1.173778, 0, 0.3803922, 1, 1,
0.2835515, -0.4665443, 2.630293, 0, 0.3764706, 1, 1,
0.2851112, 0.4887658, -0.4414605, 0, 0.3686275, 1, 1,
0.2864276, 0.4479028, 0.1943475, 0, 0.3647059, 1, 1,
0.2920787, 0.9547122, 0.02713544, 0, 0.3568628, 1, 1,
0.2924595, 0.385056, 1.431074, 0, 0.3529412, 1, 1,
0.2926055, 1.301172, -1.002679, 0, 0.345098, 1, 1,
0.2934405, -0.07665462, 1.639077, 0, 0.3411765, 1, 1,
0.2972377, 0.3895169, -0.6714581, 0, 0.3333333, 1, 1,
0.2974042, 2.783369, 2.29539, 0, 0.3294118, 1, 1,
0.3017892, 0.2310756, 0.9983048, 0, 0.3215686, 1, 1,
0.3116565, -1.641281, 2.735537, 0, 0.3176471, 1, 1,
0.3141127, 2.467039, -0.4784523, 0, 0.3098039, 1, 1,
0.3163776, -0.1444115, 2.345399, 0, 0.3058824, 1, 1,
0.3164761, -0.92589, 4.176745, 0, 0.2980392, 1, 1,
0.3221924, -0.6862988, 2.15218, 0, 0.2901961, 1, 1,
0.3284328, -0.9168354, 2.587467, 0, 0.2862745, 1, 1,
0.3313535, 0.8347012, 0.7775401, 0, 0.2784314, 1, 1,
0.336129, 0.7528083, 0.06314408, 0, 0.2745098, 1, 1,
0.3404944, -0.06994558, 0.5925477, 0, 0.2666667, 1, 1,
0.3467349, -0.8802023, 3.250506, 0, 0.2627451, 1, 1,
0.3508131, 0.009912753, 1.351403, 0, 0.254902, 1, 1,
0.3508587, -2.079601, 2.664879, 0, 0.2509804, 1, 1,
0.3542472, 0.2416125, 0.7696564, 0, 0.2431373, 1, 1,
0.3545213, -0.4623736, 2.768337, 0, 0.2392157, 1, 1,
0.3577827, 0.2783962, 3.073218, 0, 0.2313726, 1, 1,
0.3577948, -0.5074012, 0.9505622, 0, 0.227451, 1, 1,
0.3596943, 0.2137378, 0.8859665, 0, 0.2196078, 1, 1,
0.3597411, 1.741529, -0.9688268, 0, 0.2156863, 1, 1,
0.3620335, -1.912974, 4.428155, 0, 0.2078431, 1, 1,
0.3649631, -0.3344159, 2.670134, 0, 0.2039216, 1, 1,
0.3738267, -1.928463, 2.750747, 0, 0.1960784, 1, 1,
0.3745324, 0.6512034, 0.5006445, 0, 0.1882353, 1, 1,
0.3800309, 1.592107, 0.7933849, 0, 0.1843137, 1, 1,
0.3815092, 0.2934543, 0.3715656, 0, 0.1764706, 1, 1,
0.3830311, -0.3886676, 0.695543, 0, 0.172549, 1, 1,
0.3850814, 1.125863, 2.082192, 0, 0.1647059, 1, 1,
0.3868358, 3.522552, 0.4212892, 0, 0.1607843, 1, 1,
0.3904769, 0.04553747, 1.272384, 0, 0.1529412, 1, 1,
0.393503, 0.5632557, 0.8706887, 0, 0.1490196, 1, 1,
0.3939187, -1.366208, 4.007633, 0, 0.1411765, 1, 1,
0.3968816, 0.3819062, 1.25126, 0, 0.1372549, 1, 1,
0.3984172, 0.222408, 0.950931, 0, 0.1294118, 1, 1,
0.3985741, 0.001128023, 0.6449093, 0, 0.1254902, 1, 1,
0.4037093, -0.5161001, 3.208583, 0, 0.1176471, 1, 1,
0.4149351, -0.9696522, 2.472801, 0, 0.1137255, 1, 1,
0.4165378, 0.1687955, -0.2119057, 0, 0.1058824, 1, 1,
0.4174046, -0.5658845, 3.466529, 0, 0.09803922, 1, 1,
0.4174223, -0.1802542, 1.169364, 0, 0.09411765, 1, 1,
0.4177268, -1.856989, 3.076395, 0, 0.08627451, 1, 1,
0.4197463, -1.324349, 3.990152, 0, 0.08235294, 1, 1,
0.4221136, -0.525126, 1.610913, 0, 0.07450981, 1, 1,
0.4252281, 1.034354, 0.3662101, 0, 0.07058824, 1, 1,
0.4256473, -0.6800103, 2.016268, 0, 0.0627451, 1, 1,
0.4276669, 0.781794, 0.4195913, 0, 0.05882353, 1, 1,
0.4293492, 0.4340241, 0.9157917, 0, 0.05098039, 1, 1,
0.4304366, -0.2688943, 3.802772, 0, 0.04705882, 1, 1,
0.435258, 1.316347, 1.012578, 0, 0.03921569, 1, 1,
0.4421833, 0.4282022, 0.8394554, 0, 0.03529412, 1, 1,
0.4478819, 0.7553548, -0.688143, 0, 0.02745098, 1, 1,
0.4494406, -0.9360639, 0.4344997, 0, 0.02352941, 1, 1,
0.4525839, -1.274469, 1.022347, 0, 0.01568628, 1, 1,
0.4547132, 0.02959951, 1.15898, 0, 0.01176471, 1, 1,
0.4578518, -0.561796, 2.327814, 0, 0.003921569, 1, 1,
0.4594937, -0.355749, 2.95997, 0.003921569, 0, 1, 1,
0.4603045, 0.7456692, 1.109416, 0.007843138, 0, 1, 1,
0.4605616, 0.3033256, 1.523916, 0.01568628, 0, 1, 1,
0.4647485, -0.04463691, 2.054429, 0.01960784, 0, 1, 1,
0.468793, -1.448465, 3.508289, 0.02745098, 0, 1, 1,
0.4689837, -0.2915575, -0.379825, 0.03137255, 0, 1, 1,
0.4693262, -0.8477842, 3.118801, 0.03921569, 0, 1, 1,
0.4947796, 0.1852323, 1.405425, 0.04313726, 0, 1, 1,
0.4948235, -0.1807654, 2.003352, 0.05098039, 0, 1, 1,
0.4952948, -0.5082496, 2.463481, 0.05490196, 0, 1, 1,
0.4973224, 0.4657942, 0.5720481, 0.0627451, 0, 1, 1,
0.4990642, 1.142279, 0.08140792, 0.06666667, 0, 1, 1,
0.5064321, 0.8396743, 2.292084, 0.07450981, 0, 1, 1,
0.5112299, -0.5260788, 2.713608, 0.07843138, 0, 1, 1,
0.5125239, 1.602163, 0.00905132, 0.08627451, 0, 1, 1,
0.5137923, 1.010499, 1.923587, 0.09019608, 0, 1, 1,
0.5180339, 1.462762, 1.337712, 0.09803922, 0, 1, 1,
0.5183482, 0.6631519, 1.152611, 0.1058824, 0, 1, 1,
0.5207013, -0.5162804, 2.196568, 0.1098039, 0, 1, 1,
0.5229815, -1.803162, 3.776653, 0.1176471, 0, 1, 1,
0.5278037, 0.4814349, 1.398986, 0.1215686, 0, 1, 1,
0.5283284, -0.9061776, 2.08495, 0.1294118, 0, 1, 1,
0.5311036, -0.9580518, 2.69889, 0.1333333, 0, 1, 1,
0.5331113, 0.7951137, 1.15032, 0.1411765, 0, 1, 1,
0.5370871, -0.9677772, 0.2259883, 0.145098, 0, 1, 1,
0.5386642, -0.788478, 2.226446, 0.1529412, 0, 1, 1,
0.5406452, -0.9013991, 3.234916, 0.1568628, 0, 1, 1,
0.5415179, -0.4984193, 2.853379, 0.1647059, 0, 1, 1,
0.5415505, -0.1558247, 2.254585, 0.1686275, 0, 1, 1,
0.543406, 0.2615905, 1.450012, 0.1764706, 0, 1, 1,
0.5464112, 0.002484401, 2.276711, 0.1803922, 0, 1, 1,
0.5473233, 2.752195, 1.38714, 0.1882353, 0, 1, 1,
0.5494267, 0.6040739, 2.93768, 0.1921569, 0, 1, 1,
0.5518946, 0.4148704, 2.152846, 0.2, 0, 1, 1,
0.5523165, -0.6579599, 3.678785, 0.2078431, 0, 1, 1,
0.5523815, 0.09575925, 0.2419363, 0.2117647, 0, 1, 1,
0.5530084, 0.2636265, 0.08235674, 0.2196078, 0, 1, 1,
0.5544332, 1.712883, 1.188015, 0.2235294, 0, 1, 1,
0.5555018, 1.603257, 0.1874334, 0.2313726, 0, 1, 1,
0.5562135, 0.2883125, 0.9294206, 0.2352941, 0, 1, 1,
0.5599732, -1.034098, 2.655874, 0.2431373, 0, 1, 1,
0.5610904, -1.130806, 2.75362, 0.2470588, 0, 1, 1,
0.5617346, -1.159544, 2.976388, 0.254902, 0, 1, 1,
0.5645689, 1.037076, -1.206055, 0.2588235, 0, 1, 1,
0.5697457, 0.01922303, 2.235172, 0.2666667, 0, 1, 1,
0.5780517, 0.9879431, -0.8938527, 0.2705882, 0, 1, 1,
0.5781211, -0.2911834, 2.494887, 0.2784314, 0, 1, 1,
0.5797026, 0.5602617, 1.11776, 0.282353, 0, 1, 1,
0.5859506, 0.1061091, 1.526574, 0.2901961, 0, 1, 1,
0.5889438, 0.5463822, -0.3919051, 0.2941177, 0, 1, 1,
0.5948868, 1.364565, 0.8024673, 0.3019608, 0, 1, 1,
0.5992012, 0.9165256, 2.317964, 0.3098039, 0, 1, 1,
0.6012489, -0.6192203, 2.940775, 0.3137255, 0, 1, 1,
0.6017711, 0.160309, 0.8042122, 0.3215686, 0, 1, 1,
0.6051999, 1.265423, 0.9709833, 0.3254902, 0, 1, 1,
0.6082891, 1.543203, 0.08942455, 0.3333333, 0, 1, 1,
0.6093872, -0.6477142, 1.679174, 0.3372549, 0, 1, 1,
0.6099846, -0.2942597, 1.184415, 0.345098, 0, 1, 1,
0.6195371, -0.2378187, 2.471928, 0.3490196, 0, 1, 1,
0.620388, 1.432129, -0.164726, 0.3568628, 0, 1, 1,
0.6244612, -0.8493388, 2.770672, 0.3607843, 0, 1, 1,
0.6276888, 1.695349, -0.04653142, 0.3686275, 0, 1, 1,
0.6278831, 1.5753, 0.5119769, 0.372549, 0, 1, 1,
0.6284988, -0.6591912, 1.057076, 0.3803922, 0, 1, 1,
0.6336019, -1.848204, 1.880851, 0.3843137, 0, 1, 1,
0.6353523, 0.07049329, 0.898331, 0.3921569, 0, 1, 1,
0.6403618, 1.727259, 0.2996219, 0.3960784, 0, 1, 1,
0.6469594, 1.14823, -0.1642478, 0.4039216, 0, 1, 1,
0.6531605, -1.039669, 2.756291, 0.4117647, 0, 1, 1,
0.6588268, -0.479694, 3.327982, 0.4156863, 0, 1, 1,
0.6607868, -0.1186773, 0.8680581, 0.4235294, 0, 1, 1,
0.6619138, -1.293568, 1.456286, 0.427451, 0, 1, 1,
0.6637304, -0.7993743, 3.417412, 0.4352941, 0, 1, 1,
0.6662044, 0.2974019, 0.418184, 0.4392157, 0, 1, 1,
0.6734211, -0.9798499, 1.742928, 0.4470588, 0, 1, 1,
0.6757131, 0.3859668, 0.52906, 0.4509804, 0, 1, 1,
0.6761662, -1.166088, 2.698445, 0.4588235, 0, 1, 1,
0.6778679, 2.088919, 0.8866132, 0.4627451, 0, 1, 1,
0.6810326, -0.1448948, 2.942569, 0.4705882, 0, 1, 1,
0.6811246, -0.7469401, 2.248886, 0.4745098, 0, 1, 1,
0.6883341, -0.1363546, 2.675577, 0.4823529, 0, 1, 1,
0.6914704, -1.549079, 3.543987, 0.4862745, 0, 1, 1,
0.6926451, -1.830754, 3.237823, 0.4941176, 0, 1, 1,
0.6957548, -0.5171823, 1.956623, 0.5019608, 0, 1, 1,
0.6978198, -0.5316417, 1.385068, 0.5058824, 0, 1, 1,
0.6990868, -1.274106, 1.868484, 0.5137255, 0, 1, 1,
0.7019299, -1.690692, 2.683424, 0.5176471, 0, 1, 1,
0.7080246, -1.012683, 1.541772, 0.5254902, 0, 1, 1,
0.709234, -0.2728557, 3.565174, 0.5294118, 0, 1, 1,
0.7181426, 0.8028051, 0.769986, 0.5372549, 0, 1, 1,
0.7193081, 0.03524207, 0.9599344, 0.5411765, 0, 1, 1,
0.7229802, -0.1527399, 2.719469, 0.5490196, 0, 1, 1,
0.727344, 0.8007758, 1.122072, 0.5529412, 0, 1, 1,
0.7318161, 1.197608, 1.081609, 0.5607843, 0, 1, 1,
0.7318743, -0.2620623, 3.842821, 0.5647059, 0, 1, 1,
0.7345863, 0.1368247, 1.613024, 0.572549, 0, 1, 1,
0.7404049, 1.389164, 0.5636728, 0.5764706, 0, 1, 1,
0.7468963, -0.206957, 2.858548, 0.5843138, 0, 1, 1,
0.7485734, -0.4900228, 1.806277, 0.5882353, 0, 1, 1,
0.7515867, -0.6635556, 2.41877, 0.5960785, 0, 1, 1,
0.7524897, -0.2109974, 1.855956, 0.6039216, 0, 1, 1,
0.7540534, 0.4989801, -0.6329325, 0.6078432, 0, 1, 1,
0.7579291, -1.504854, 3.230428, 0.6156863, 0, 1, 1,
0.7610255, -1.858578, 3.433621, 0.6196079, 0, 1, 1,
0.761101, 0.08463493, 1.494658, 0.627451, 0, 1, 1,
0.7671192, 0.4489127, -0.211091, 0.6313726, 0, 1, 1,
0.7702178, -0.6074998, 1.520372, 0.6392157, 0, 1, 1,
0.7751749, 1.138778, 0.8722093, 0.6431373, 0, 1, 1,
0.7767749, 0.2577564, 1.260068, 0.6509804, 0, 1, 1,
0.7770734, 1.361549, 1.055188, 0.654902, 0, 1, 1,
0.7794399, 0.7660392, 2.032097, 0.6627451, 0, 1, 1,
0.7826657, 0.1656736, 2.510714, 0.6666667, 0, 1, 1,
0.7863308, -0.8762003, 2.366311, 0.6745098, 0, 1, 1,
0.7867763, 2.202757, 1.55077, 0.6784314, 0, 1, 1,
0.7935228, 0.3023453, 1.308589, 0.6862745, 0, 1, 1,
0.7991501, 0.2322562, 0.1854159, 0.6901961, 0, 1, 1,
0.8019421, 0.6884028, 0.6163879, 0.6980392, 0, 1, 1,
0.8029681, 0.6673713, 2.389423, 0.7058824, 0, 1, 1,
0.8051069, -1.547018, 4.35405, 0.7098039, 0, 1, 1,
0.8060215, 0.3842517, 0.592145, 0.7176471, 0, 1, 1,
0.8112484, 1.426696, 0.9802766, 0.7215686, 0, 1, 1,
0.8139457, -0.4638543, 2.118887, 0.7294118, 0, 1, 1,
0.8173648, 0.1009932, 1.840162, 0.7333333, 0, 1, 1,
0.8270494, 0.6404469, 1.116337, 0.7411765, 0, 1, 1,
0.8284605, -0.1097301, 1.028554, 0.7450981, 0, 1, 1,
0.8382522, -0.4307846, 1.393348, 0.7529412, 0, 1, 1,
0.8389722, -0.5384416, 1.361808, 0.7568628, 0, 1, 1,
0.8461155, 0.5475073, 0.1922868, 0.7647059, 0, 1, 1,
0.8464366, 0.3223363, 1.490718, 0.7686275, 0, 1, 1,
0.8566374, -0.02793185, 0.7720153, 0.7764706, 0, 1, 1,
0.8585016, -0.4745498, 1.246972, 0.7803922, 0, 1, 1,
0.8640565, -0.1715278, 1.92168, 0.7882353, 0, 1, 1,
0.8659131, 1.060608, 1.960965, 0.7921569, 0, 1, 1,
0.8722894, -2.225122, 3.542951, 0.8, 0, 1, 1,
0.8877289, -1.187873, 1.938805, 0.8078431, 0, 1, 1,
0.8925104, 0.6157061, 1.313442, 0.8117647, 0, 1, 1,
0.8940427, 0.1623167, 2.324146, 0.8196079, 0, 1, 1,
0.8941051, -1.698412, 2.286467, 0.8235294, 0, 1, 1,
0.8964992, 0.5121451, 2.638001, 0.8313726, 0, 1, 1,
0.9000208, 0.1079054, 0.4439645, 0.8352941, 0, 1, 1,
0.900232, -0.3328152, 2.016117, 0.8431373, 0, 1, 1,
0.9003075, -0.7180297, 2.42427, 0.8470588, 0, 1, 1,
0.9018343, -0.522391, 1.483786, 0.854902, 0, 1, 1,
0.9080108, 1.07624, 0.4681487, 0.8588235, 0, 1, 1,
0.9128106, -0.5559611, 3.032742, 0.8666667, 0, 1, 1,
0.9128855, 0.1565941, 2.256393, 0.8705882, 0, 1, 1,
0.9140659, -0.8045776, 1.563017, 0.8784314, 0, 1, 1,
0.9142726, -0.6088357, 0.9068111, 0.8823529, 0, 1, 1,
0.9151404, -0.203508, 2.07445, 0.8901961, 0, 1, 1,
0.9181122, -0.8818031, 2.238239, 0.8941177, 0, 1, 1,
0.9230618, -0.7986815, 2.553762, 0.9019608, 0, 1, 1,
0.9239838, -0.02161613, 4.369918, 0.9098039, 0, 1, 1,
0.928272, 0.407396, 2.275882, 0.9137255, 0, 1, 1,
0.9306213, 0.8040344, -0.04112147, 0.9215686, 0, 1, 1,
0.9368575, 1.978949, 0.5896794, 0.9254902, 0, 1, 1,
0.9483314, 0.02609587, -0.1601761, 0.9333333, 0, 1, 1,
0.9523962, 1.15029, 0.09425916, 0.9372549, 0, 1, 1,
0.9533371, -0.9356948, -0.0418469, 0.945098, 0, 1, 1,
0.9540612, 0.3984662, 1.472011, 0.9490196, 0, 1, 1,
0.9574922, 0.9216461, 1.189228, 0.9568627, 0, 1, 1,
0.9614955, -1.0025, 2.114915, 0.9607843, 0, 1, 1,
0.9642312, -1.463026, 1.324614, 0.9686275, 0, 1, 1,
0.9666894, -1.694339, 5.88763, 0.972549, 0, 1, 1,
0.967754, 0.1772414, 2.180218, 0.9803922, 0, 1, 1,
0.9752333, -2.251329, 1.709145, 0.9843137, 0, 1, 1,
0.9760634, -0.3947547, 1.907953, 0.9921569, 0, 1, 1,
0.9777039, 0.3368199, -0.4016942, 0.9960784, 0, 1, 1,
0.9911517, -1.117877, 2.117584, 1, 0, 0.9960784, 1,
0.9913458, 0.1535546, 1.110247, 1, 0, 0.9882353, 1,
1.010539, 0.6838549, 0.2343581, 1, 0, 0.9843137, 1,
1.011506, -0.06876329, 1.40094, 1, 0, 0.9764706, 1,
1.034972, 1.621957, -1.438059, 1, 0, 0.972549, 1,
1.044518, -0.5017932, 2.918299, 1, 0, 0.9647059, 1,
1.049633, -0.378018, 2.059725, 1, 0, 0.9607843, 1,
1.052101, -1.363081, 3.094893, 1, 0, 0.9529412, 1,
1.058894, 1.157562, 1.373672, 1, 0, 0.9490196, 1,
1.063551, 1.232977, -1.142439, 1, 0, 0.9411765, 1,
1.0659, 0.01955305, 2.551435, 1, 0, 0.9372549, 1,
1.072215, 0.4053483, 1.461431, 1, 0, 0.9294118, 1,
1.072675, 0.3249548, 1.269165, 1, 0, 0.9254902, 1,
1.07496, 0.1154041, 1.737283, 1, 0, 0.9176471, 1,
1.078702, -0.3048525, 1.922998, 1, 0, 0.9137255, 1,
1.081443, -0.3666747, 3.164232, 1, 0, 0.9058824, 1,
1.08854, 0.07210664, 1.29477, 1, 0, 0.9019608, 1,
1.08909, -1.423101, 2.067103, 1, 0, 0.8941177, 1,
1.097451, -0.1185813, 1.783204, 1, 0, 0.8862745, 1,
1.114903, -0.1779367, -0.03561476, 1, 0, 0.8823529, 1,
1.123279, 3.201502, -0.2213606, 1, 0, 0.8745098, 1,
1.124183, 0.9783088, -1.035609, 1, 0, 0.8705882, 1,
1.127519, 0.03474143, 0.2598251, 1, 0, 0.8627451, 1,
1.132743, 0.39736, 0.1752304, 1, 0, 0.8588235, 1,
1.135404, 1.137449, 1.739805, 1, 0, 0.8509804, 1,
1.137507, -0.02874647, 1.229513, 1, 0, 0.8470588, 1,
1.140307, -0.8644137, 3.380847, 1, 0, 0.8392157, 1,
1.142777, 0.1669407, 2.63844, 1, 0, 0.8352941, 1,
1.154376, 1.62618, 1.367271, 1, 0, 0.827451, 1,
1.161944, 0.6640609, 0.387384, 1, 0, 0.8235294, 1,
1.163546, -0.586633, 1.333891, 1, 0, 0.8156863, 1,
1.166032, 0.2426138, 2.323929, 1, 0, 0.8117647, 1,
1.177271, -0.2696878, -0.1533836, 1, 0, 0.8039216, 1,
1.185057, -2.316338, 1.967478, 1, 0, 0.7960784, 1,
1.18869, -1.904027, 2.432186, 1, 0, 0.7921569, 1,
1.190842, 1.271529, 0.2168397, 1, 0, 0.7843137, 1,
1.192611, 0.9915935, 2.276528, 1, 0, 0.7803922, 1,
1.192654, 0.4741875, 1.024796, 1, 0, 0.772549, 1,
1.192658, -0.8243777, 4.031639, 1, 0, 0.7686275, 1,
1.201567, 0.163445, 1.278295, 1, 0, 0.7607843, 1,
1.20202, 0.2167248, 1.725694, 1, 0, 0.7568628, 1,
1.202391, 1.101721, 0.8618371, 1, 0, 0.7490196, 1,
1.211532, 0.2081554, 2.756327, 1, 0, 0.7450981, 1,
1.212863, 0.2438031, -0.3641096, 1, 0, 0.7372549, 1,
1.220795, -0.9717225, 0.315866, 1, 0, 0.7333333, 1,
1.22518, -2.106053, 1.701319, 1, 0, 0.7254902, 1,
1.226241, 0.8508935, -0.5875414, 1, 0, 0.7215686, 1,
1.234897, -0.5078986, 4.483419, 1, 0, 0.7137255, 1,
1.245154, -0.748947, 1.49813, 1, 0, 0.7098039, 1,
1.248212, -0.1093201, 0.3821143, 1, 0, 0.7019608, 1,
1.263888, 1.178738, 0.1578351, 1, 0, 0.6941177, 1,
1.276157, 0.3917115, 0.9510679, 1, 0, 0.6901961, 1,
1.282626, 1.553939, -0.2722797, 1, 0, 0.682353, 1,
1.286582, 0.03828496, 2.867165, 1, 0, 0.6784314, 1,
1.296327, -1.147962, 2.627739, 1, 0, 0.6705883, 1,
1.303376, -1.208658, 2.278446, 1, 0, 0.6666667, 1,
1.315744, -1.794374, 1.484944, 1, 0, 0.6588235, 1,
1.322081, 1.549126, 1.633024, 1, 0, 0.654902, 1,
1.323114, 0.6391774, 0.1185887, 1, 0, 0.6470588, 1,
1.337197, -0.3354754, 0.6463307, 1, 0, 0.6431373, 1,
1.340071, 3.016185, 0.5297701, 1, 0, 0.6352941, 1,
1.340655, -0.5295729, 2.244739, 1, 0, 0.6313726, 1,
1.34189, 0.429869, 3.754615, 1, 0, 0.6235294, 1,
1.342082, -0.3917449, 2.244467, 1, 0, 0.6196079, 1,
1.352365, -1.304032, 2.923398, 1, 0, 0.6117647, 1,
1.358553, 0.7612048, 0.5277105, 1, 0, 0.6078432, 1,
1.361601, -1.448297, 1.087603, 1, 0, 0.6, 1,
1.365675, -0.8352894, 2.705603, 1, 0, 0.5921569, 1,
1.367556, -1.008238, 3.281992, 1, 0, 0.5882353, 1,
1.369308, 1.013577, -0.1931079, 1, 0, 0.5803922, 1,
1.378344, 0.6109671, 1.09979, 1, 0, 0.5764706, 1,
1.379683, -1.930414, 2.651612, 1, 0, 0.5686275, 1,
1.385266, -0.2064365, 2.115818, 1, 0, 0.5647059, 1,
1.39232, -0.2142155, 2.564123, 1, 0, 0.5568628, 1,
1.404576, 0.0003510763, 2.411602, 1, 0, 0.5529412, 1,
1.416096, 1.39033, -1.346617, 1, 0, 0.5450981, 1,
1.429348, 0.3318177, 1.370525, 1, 0, 0.5411765, 1,
1.430429, 1.929086, 0.1401365, 1, 0, 0.5333334, 1,
1.443383, 0.07868333, 2.101586, 1, 0, 0.5294118, 1,
1.447057, 1.938472, 2.930631, 1, 0, 0.5215687, 1,
1.451192, -0.03444598, 1.672505, 1, 0, 0.5176471, 1,
1.470726, 0.8988157, 1.269567, 1, 0, 0.509804, 1,
1.475514, 1.197128, 1.82263, 1, 0, 0.5058824, 1,
1.481666, -0.03310961, 3.427829, 1, 0, 0.4980392, 1,
1.483485, -0.03676069, 2.890575, 1, 0, 0.4901961, 1,
1.484412, -0.1043933, 0.1046954, 1, 0, 0.4862745, 1,
1.501279, 0.1935433, 1.223913, 1, 0, 0.4784314, 1,
1.515671, 0.5440342, -1.450212, 1, 0, 0.4745098, 1,
1.519562, 0.9561065, 1.369686, 1, 0, 0.4666667, 1,
1.53546, 0.1716354, 1.710291, 1, 0, 0.4627451, 1,
1.538623, -1.174345, 1.800839, 1, 0, 0.454902, 1,
1.543453, -0.934926, 2.343882, 1, 0, 0.4509804, 1,
1.544881, 0.2723739, 0.2811738, 1, 0, 0.4431373, 1,
1.547257, 0.4866007, 1.479901, 1, 0, 0.4392157, 1,
1.547551, 0.256188, 0.7066169, 1, 0, 0.4313726, 1,
1.560475, 0.5569465, 2.288911, 1, 0, 0.427451, 1,
1.567049, -0.5056953, 1.283582, 1, 0, 0.4196078, 1,
1.567684, 1.098233, 1.978395, 1, 0, 0.4156863, 1,
1.568316, -1.550841, 3.693983, 1, 0, 0.4078431, 1,
1.57316, 0.7972115, 0.2139135, 1, 0, 0.4039216, 1,
1.591578, -0.3708693, 1.128611, 1, 0, 0.3960784, 1,
1.614896, -0.4734282, 2.03583, 1, 0, 0.3882353, 1,
1.617975, -0.3381692, 1.926509, 1, 0, 0.3843137, 1,
1.630741, -0.6010557, 1.082988, 1, 0, 0.3764706, 1,
1.63822, -0.4838693, 1.535865, 1, 0, 0.372549, 1,
1.662655, 1.674433, 2.31338, 1, 0, 0.3647059, 1,
1.674198, -0.6378247, 2.480419, 1, 0, 0.3607843, 1,
1.685867, -1.469973, 2.551078, 1, 0, 0.3529412, 1,
1.690235, 1.422963, -0.2875719, 1, 0, 0.3490196, 1,
1.706595, -0.8395739, 2.529497, 1, 0, 0.3411765, 1,
1.716796, -0.1444467, 1.81998, 1, 0, 0.3372549, 1,
1.741629, -1.156196, 1.098755, 1, 0, 0.3294118, 1,
1.751468, -0.8877828, 2.59776, 1, 0, 0.3254902, 1,
1.753306, -1.500458, 2.758271, 1, 0, 0.3176471, 1,
1.759925, 0.988488, 0.5664213, 1, 0, 0.3137255, 1,
1.768574, -0.808423, 1.986022, 1, 0, 0.3058824, 1,
1.786468, -1.184306, 1.995766, 1, 0, 0.2980392, 1,
1.792454, -0.2040348, 1.391274, 1, 0, 0.2941177, 1,
1.813999, -0.9440238, 1.489761, 1, 0, 0.2862745, 1,
1.82373, 0.0850978, 1.512388, 1, 0, 0.282353, 1,
1.835116, -2.420155, 3.294463, 1, 0, 0.2745098, 1,
1.84387, -0.3251808, 1.9288, 1, 0, 0.2705882, 1,
1.845187, -1.456973, 1.108917, 1, 0, 0.2627451, 1,
1.873652, -0.711305, 1.651472, 1, 0, 0.2588235, 1,
1.883827, 0.4691752, 1.034589, 1, 0, 0.2509804, 1,
1.891491, -0.804615, 3.883278, 1, 0, 0.2470588, 1,
1.891905, 0.06862463, 2.067047, 1, 0, 0.2392157, 1,
1.898012, 0.09927581, 2.426275, 1, 0, 0.2352941, 1,
1.905648, 1.415062, 0.3966073, 1, 0, 0.227451, 1,
1.909476, -0.1671474, 1.611737, 1, 0, 0.2235294, 1,
1.911146, -0.78957, 0.3441854, 1, 0, 0.2156863, 1,
1.95547, 0.3862581, 1.781932, 1, 0, 0.2117647, 1,
1.972382, 0.09139314, 2.257976, 1, 0, 0.2039216, 1,
1.980504, -0.911047, -0.2675077, 1, 0, 0.1960784, 1,
2.000583, 0.5229647, 1.555613, 1, 0, 0.1921569, 1,
2.039064, -1.25433, 3.24633, 1, 0, 0.1843137, 1,
2.044119, 0.2754066, 2.663012, 1, 0, 0.1803922, 1,
2.051943, -0.6028164, 0.5343103, 1, 0, 0.172549, 1,
2.057357, 0.08357678, 1.819184, 1, 0, 0.1686275, 1,
2.058682, -1.35019, 1.960285, 1, 0, 0.1607843, 1,
2.098596, -1.585042, 1.955832, 1, 0, 0.1568628, 1,
2.110719, -0.9809313, 1.870726, 1, 0, 0.1490196, 1,
2.116718, 0.271201, 0.04573351, 1, 0, 0.145098, 1,
2.150334, 1.450039, 0.04105632, 1, 0, 0.1372549, 1,
2.175453, 0.5574527, 0.6046532, 1, 0, 0.1333333, 1,
2.194519, -2.191978, 2.473761, 1, 0, 0.1254902, 1,
2.266534, 0.2904727, -1.230967, 1, 0, 0.1215686, 1,
2.288846, 1.361982, -0.4005834, 1, 0, 0.1137255, 1,
2.301445, -1.188138, 0.6939093, 1, 0, 0.1098039, 1,
2.311802, 0.1407807, 1.515561, 1, 0, 0.1019608, 1,
2.321593, 0.2670678, 1.98464, 1, 0, 0.09411765, 1,
2.336795, -0.6742871, 1.066347, 1, 0, 0.09019608, 1,
2.340282, 0.9787644, 1.139087, 1, 0, 0.08235294, 1,
2.38808, -0.4651179, 0.5338413, 1, 0, 0.07843138, 1,
2.443154, 0.8753345, 0.6880016, 1, 0, 0.07058824, 1,
2.44925, 1.328205, 0.8707696, 1, 0, 0.06666667, 1,
2.452287, -0.3831246, 1.489514, 1, 0, 0.05882353, 1,
2.485334, 0.2404193, 2.689442, 1, 0, 0.05490196, 1,
2.657444, 0.664793, 1.062185, 1, 0, 0.04705882, 1,
2.706021, 1.213675, 1.217392, 1, 0, 0.04313726, 1,
2.707198, 0.2533818, 1.126661, 1, 0, 0.03529412, 1,
2.817747, -0.2524941, 0.8313695, 1, 0, 0.03137255, 1,
2.877402, 0.4580265, 1.289028, 1, 0, 0.02352941, 1,
3.122339, 0.158277, 1.973669, 1, 0, 0.01960784, 1,
3.2093, -0.3058694, 1.715667, 1, 0, 0.01176471, 1,
3.234967, -1.364879, 1.320312, 1, 0, 0.007843138, 1
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
-0.2075224, -3.927592, -7.228284, 0, -0.5, 0.5, 0.5,
-0.2075224, -3.927592, -7.228284, 1, -0.5, 0.5, 0.5,
-0.2075224, -3.927592, -7.228284, 1, 1.5, 0.5, 0.5,
-0.2075224, -3.927592, -7.228284, 0, 1.5, 0.5, 0.5
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
-4.817015, 0.3522965, -7.228284, 0, -0.5, 0.5, 0.5,
-4.817015, 0.3522965, -7.228284, 1, -0.5, 0.5, 0.5,
-4.817015, 0.3522965, -7.228284, 1, 1.5, 0.5, 0.5,
-4.817015, 0.3522965, -7.228284, 0, 1.5, 0.5, 0.5
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
-4.817015, -3.927592, 0.3462007, 0, -0.5, 0.5, 0.5,
-4.817015, -3.927592, 0.3462007, 1, -0.5, 0.5, 0.5,
-4.817015, -3.927592, 0.3462007, 1, 1.5, 0.5, 0.5,
-4.817015, -3.927592, 0.3462007, 0, 1.5, 0.5, 0.5
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
-3, -2.939925, -5.480326,
3, -2.939925, -5.480326,
-3, -2.939925, -5.480326,
-3, -3.104537, -5.771652,
-2, -2.939925, -5.480326,
-2, -3.104537, -5.771652,
-1, -2.939925, -5.480326,
-1, -3.104537, -5.771652,
0, -2.939925, -5.480326,
0, -3.104537, -5.771652,
1, -2.939925, -5.480326,
1, -3.104537, -5.771652,
2, -2.939925, -5.480326,
2, -3.104537, -5.771652,
3, -2.939925, -5.480326,
3, -3.104537, -5.771652
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
-3, -3.433758, -6.354305, 0, -0.5, 0.5, 0.5,
-3, -3.433758, -6.354305, 1, -0.5, 0.5, 0.5,
-3, -3.433758, -6.354305, 1, 1.5, 0.5, 0.5,
-3, -3.433758, -6.354305, 0, 1.5, 0.5, 0.5,
-2, -3.433758, -6.354305, 0, -0.5, 0.5, 0.5,
-2, -3.433758, -6.354305, 1, -0.5, 0.5, 0.5,
-2, -3.433758, -6.354305, 1, 1.5, 0.5, 0.5,
-2, -3.433758, -6.354305, 0, 1.5, 0.5, 0.5,
-1, -3.433758, -6.354305, 0, -0.5, 0.5, 0.5,
-1, -3.433758, -6.354305, 1, -0.5, 0.5, 0.5,
-1, -3.433758, -6.354305, 1, 1.5, 0.5, 0.5,
-1, -3.433758, -6.354305, 0, 1.5, 0.5, 0.5,
0, -3.433758, -6.354305, 0, -0.5, 0.5, 0.5,
0, -3.433758, -6.354305, 1, -0.5, 0.5, 0.5,
0, -3.433758, -6.354305, 1, 1.5, 0.5, 0.5,
0, -3.433758, -6.354305, 0, 1.5, 0.5, 0.5,
1, -3.433758, -6.354305, 0, -0.5, 0.5, 0.5,
1, -3.433758, -6.354305, 1, -0.5, 0.5, 0.5,
1, -3.433758, -6.354305, 1, 1.5, 0.5, 0.5,
1, -3.433758, -6.354305, 0, 1.5, 0.5, 0.5,
2, -3.433758, -6.354305, 0, -0.5, 0.5, 0.5,
2, -3.433758, -6.354305, 1, -0.5, 0.5, 0.5,
2, -3.433758, -6.354305, 1, 1.5, 0.5, 0.5,
2, -3.433758, -6.354305, 0, 1.5, 0.5, 0.5,
3, -3.433758, -6.354305, 0, -0.5, 0.5, 0.5,
3, -3.433758, -6.354305, 1, -0.5, 0.5, 0.5,
3, -3.433758, -6.354305, 1, 1.5, 0.5, 0.5,
3, -3.433758, -6.354305, 0, 1.5, 0.5, 0.5
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
-3.753286, -2, -5.480326,
-3.753286, 3, -5.480326,
-3.753286, -2, -5.480326,
-3.930574, -2, -5.771652,
-3.753286, -1, -5.480326,
-3.930574, -1, -5.771652,
-3.753286, 0, -5.480326,
-3.930574, 0, -5.771652,
-3.753286, 1, -5.480326,
-3.930574, 1, -5.771652,
-3.753286, 2, -5.480326,
-3.930574, 2, -5.771652,
-3.753286, 3, -5.480326,
-3.930574, 3, -5.771652
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
-4.285151, -2, -6.354305, 0, -0.5, 0.5, 0.5,
-4.285151, -2, -6.354305, 1, -0.5, 0.5, 0.5,
-4.285151, -2, -6.354305, 1, 1.5, 0.5, 0.5,
-4.285151, -2, -6.354305, 0, 1.5, 0.5, 0.5,
-4.285151, -1, -6.354305, 0, -0.5, 0.5, 0.5,
-4.285151, -1, -6.354305, 1, -0.5, 0.5, 0.5,
-4.285151, -1, -6.354305, 1, 1.5, 0.5, 0.5,
-4.285151, -1, -6.354305, 0, 1.5, 0.5, 0.5,
-4.285151, 0, -6.354305, 0, -0.5, 0.5, 0.5,
-4.285151, 0, -6.354305, 1, -0.5, 0.5, 0.5,
-4.285151, 0, -6.354305, 1, 1.5, 0.5, 0.5,
-4.285151, 0, -6.354305, 0, 1.5, 0.5, 0.5,
-4.285151, 1, -6.354305, 0, -0.5, 0.5, 0.5,
-4.285151, 1, -6.354305, 1, -0.5, 0.5, 0.5,
-4.285151, 1, -6.354305, 1, 1.5, 0.5, 0.5,
-4.285151, 1, -6.354305, 0, 1.5, 0.5, 0.5,
-4.285151, 2, -6.354305, 0, -0.5, 0.5, 0.5,
-4.285151, 2, -6.354305, 1, -0.5, 0.5, 0.5,
-4.285151, 2, -6.354305, 1, 1.5, 0.5, 0.5,
-4.285151, 2, -6.354305, 0, 1.5, 0.5, 0.5,
-4.285151, 3, -6.354305, 0, -0.5, 0.5, 0.5,
-4.285151, 3, -6.354305, 1, -0.5, 0.5, 0.5,
-4.285151, 3, -6.354305, 1, 1.5, 0.5, 0.5,
-4.285151, 3, -6.354305, 0, 1.5, 0.5, 0.5
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
-3.753286, -2.939925, -4,
-3.753286, -2.939925, 6,
-3.753286, -2.939925, -4,
-3.930574, -3.104537, -4,
-3.753286, -2.939925, -2,
-3.930574, -3.104537, -2,
-3.753286, -2.939925, 0,
-3.930574, -3.104537, 0,
-3.753286, -2.939925, 2,
-3.930574, -3.104537, 2,
-3.753286, -2.939925, 4,
-3.930574, -3.104537, 4,
-3.753286, -2.939925, 6,
-3.930574, -3.104537, 6
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
-4.285151, -3.433758, -4, 0, -0.5, 0.5, 0.5,
-4.285151, -3.433758, -4, 1, -0.5, 0.5, 0.5,
-4.285151, -3.433758, -4, 1, 1.5, 0.5, 0.5,
-4.285151, -3.433758, -4, 0, 1.5, 0.5, 0.5,
-4.285151, -3.433758, -2, 0, -0.5, 0.5, 0.5,
-4.285151, -3.433758, -2, 1, -0.5, 0.5, 0.5,
-4.285151, -3.433758, -2, 1, 1.5, 0.5, 0.5,
-4.285151, -3.433758, -2, 0, 1.5, 0.5, 0.5,
-4.285151, -3.433758, 0, 0, -0.5, 0.5, 0.5,
-4.285151, -3.433758, 0, 1, -0.5, 0.5, 0.5,
-4.285151, -3.433758, 0, 1, 1.5, 0.5, 0.5,
-4.285151, -3.433758, 0, 0, 1.5, 0.5, 0.5,
-4.285151, -3.433758, 2, 0, -0.5, 0.5, 0.5,
-4.285151, -3.433758, 2, 1, -0.5, 0.5, 0.5,
-4.285151, -3.433758, 2, 1, 1.5, 0.5, 0.5,
-4.285151, -3.433758, 2, 0, 1.5, 0.5, 0.5,
-4.285151, -3.433758, 4, 0, -0.5, 0.5, 0.5,
-4.285151, -3.433758, 4, 1, -0.5, 0.5, 0.5,
-4.285151, -3.433758, 4, 1, 1.5, 0.5, 0.5,
-4.285151, -3.433758, 4, 0, 1.5, 0.5, 0.5,
-4.285151, -3.433758, 6, 0, -0.5, 0.5, 0.5,
-4.285151, -3.433758, 6, 1, -0.5, 0.5, 0.5,
-4.285151, -3.433758, 6, 1, 1.5, 0.5, 0.5,
-4.285151, -3.433758, 6, 0, 1.5, 0.5, 0.5
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
-3.753286, -2.939925, -5.480326,
-3.753286, 3.644518, -5.480326,
-3.753286, -2.939925, 6.172727,
-3.753286, 3.644518, 6.172727,
-3.753286, -2.939925, -5.480326,
-3.753286, -2.939925, 6.172727,
-3.753286, 3.644518, -5.480326,
-3.753286, 3.644518, 6.172727,
-3.753286, -2.939925, -5.480326,
3.338241, -2.939925, -5.480326,
-3.753286, -2.939925, 6.172727,
3.338241, -2.939925, 6.172727,
-3.753286, 3.644518, -5.480326,
3.338241, 3.644518, -5.480326,
-3.753286, 3.644518, 6.172727,
3.338241, 3.644518, 6.172727,
3.338241, -2.939925, -5.480326,
3.338241, 3.644518, -5.480326,
3.338241, -2.939925, 6.172727,
3.338241, 3.644518, 6.172727,
3.338241, -2.939925, -5.480326,
3.338241, -2.939925, 6.172727,
3.338241, 3.644518, -5.480326,
3.338241, 3.644518, 6.172727
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
var radius = 8.088322;
var distance = 35.98586;
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
mvMatrix.translate( 0.2075224, -0.3522965, -0.3462007 );
mvMatrix.scale( 1.233197, 1.328169, 0.7504687 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.98586);
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
Dicamba<-read.table("Dicamba.xyz")
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
-3.650011, -1.900018, -1.513083, 0, 0, 1, 1, 1,
-3.023738, -0.04028236, -1.383919, 1, 0, 0, 1, 1,
-2.93535, 0.7810315, -2.179359, 1, 0, 0, 1, 1,
-2.716119, 1.139889, -0.1637937, 1, 0, 0, 1, 1,
-2.696324, 0.4264385, 2.077801, 1, 0, 0, 1, 1,
-2.574123, 0.9061037, -1.95999, 1, 0, 0, 1, 1,
-2.515587, -0.1562057, -2.618109, 0, 0, 0, 1, 1,
-2.480725, 0.5933903, -1.317523, 0, 0, 0, 1, 1,
-2.414387, -1.399118, -0.7885307, 0, 0, 0, 1, 1,
-2.412967, 0.6755206, -1.127496, 0, 0, 0, 1, 1,
-2.323834, 2.02107, -2.493839, 0, 0, 0, 1, 1,
-2.317653, -0.2912358, -0.5575793, 0, 0, 0, 1, 1,
-2.299181, -0.3126889, -2.047893, 0, 0, 0, 1, 1,
-2.274674, -0.01450882, -1.793971, 1, 1, 1, 1, 1,
-2.252317, 0.7760844, -1.611796, 1, 1, 1, 1, 1,
-2.212745, 0.4796159, 0.9773937, 1, 1, 1, 1, 1,
-2.164922, -1.002759, -3.326697, 1, 1, 1, 1, 1,
-2.114778, 1.875619, -1.562152, 1, 1, 1, 1, 1,
-2.102407, -0.336862, -1.5047, 1, 1, 1, 1, 1,
-2.067866, 0.004829522, -2.335735, 1, 1, 1, 1, 1,
-2.057393, -0.6585397, -0.6387689, 1, 1, 1, 1, 1,
-2.05111, -1.048369, 1.100351, 1, 1, 1, 1, 1,
-2.022578, 2.247253, -1.786525, 1, 1, 1, 1, 1,
-2.012396, -0.004032671, -2.750609, 1, 1, 1, 1, 1,
-2.011761, -0.2352318, -1.401294, 1, 1, 1, 1, 1,
-2.008389, -0.5120746, -1.218926, 1, 1, 1, 1, 1,
-2.001574, 0.378464, -2.475471, 1, 1, 1, 1, 1,
-1.999115, 0.956593, 0.03025779, 1, 1, 1, 1, 1,
-1.990349, 0.2692057, -1.285905, 0, 0, 1, 1, 1,
-1.974855, -0.189986, -1.609046, 1, 0, 0, 1, 1,
-1.974228, 0.9138341, -0.940064, 1, 0, 0, 1, 1,
-1.972426, -1.253879, 0.1242548, 1, 0, 0, 1, 1,
-1.968425, 0.9784158, -1.403254, 1, 0, 0, 1, 1,
-1.942508, 0.7130983, -1.402101, 1, 0, 0, 1, 1,
-1.922552, 0.5179005, 1.208744, 0, 0, 0, 1, 1,
-1.872008, -0.0547158, -2.284014, 0, 0, 0, 1, 1,
-1.870513, -0.8349103, -2.255104, 0, 0, 0, 1, 1,
-1.843481, 1.571243, -0.9889414, 0, 0, 0, 1, 1,
-1.839865, -1.157778, -2.472357, 0, 0, 0, 1, 1,
-1.826373, 0.2769726, -1.829269, 0, 0, 0, 1, 1,
-1.804236, -0.04453745, -3.403815, 0, 0, 0, 1, 1,
-1.802385, 1.260129, -0.1891933, 1, 1, 1, 1, 1,
-1.79523, 0.4589144, -1.42241, 1, 1, 1, 1, 1,
-1.791212, 0.2246432, -1.545183, 1, 1, 1, 1, 1,
-1.78287, -1.006299, -2.702174, 1, 1, 1, 1, 1,
-1.782758, -0.6298143, -1.728099, 1, 1, 1, 1, 1,
-1.777738, -0.1259185, -0.8146635, 1, 1, 1, 1, 1,
-1.750573, -2.363034, -3.588497, 1, 1, 1, 1, 1,
-1.738239, 0.1930514, -0.5683369, 1, 1, 1, 1, 1,
-1.733359, 0.05626088, -1.551819, 1, 1, 1, 1, 1,
-1.714117, 0.7179157, 0.6209967, 1, 1, 1, 1, 1,
-1.712193, -2.844035, -1.55031, 1, 1, 1, 1, 1,
-1.704747, -1.090593, -1.721034, 1, 1, 1, 1, 1,
-1.696339, -0.4204992, -2.024359, 1, 1, 1, 1, 1,
-1.680902, -1.072031, -0.5853766, 1, 1, 1, 1, 1,
-1.670514, -1.384034, -1.593606, 1, 1, 1, 1, 1,
-1.664049, 0.9357575, 0.09399591, 0, 0, 1, 1, 1,
-1.649262, -0.331984, -3.037778, 1, 0, 0, 1, 1,
-1.649071, 0.4136194, -1.115217, 1, 0, 0, 1, 1,
-1.646828, -0.2782314, -2.303594, 1, 0, 0, 1, 1,
-1.645397, -0.9123197, -0.7039084, 1, 0, 0, 1, 1,
-1.641815, -0.2858126, -0.7608104, 1, 0, 0, 1, 1,
-1.633988, 0.2499431, -1.315109, 0, 0, 0, 1, 1,
-1.631503, 0.9737431, 0.08681194, 0, 0, 0, 1, 1,
-1.604906, 0.4251877, -0.9389164, 0, 0, 0, 1, 1,
-1.59936, 1.011426, -1.932225, 0, 0, 0, 1, 1,
-1.583489, 1.944569, -0.6011157, 0, 0, 0, 1, 1,
-1.580392, 0.9807231, 0.005708172, 0, 0, 0, 1, 1,
-1.574115, 0.9728833, 0.1279085, 0, 0, 0, 1, 1,
-1.565461, 1.116991, -1.369129, 1, 1, 1, 1, 1,
-1.564209, 0.01666076, -1.142344, 1, 1, 1, 1, 1,
-1.545681, 1.962741, -0.1141843, 1, 1, 1, 1, 1,
-1.544726, -0.1517777, -0.7994407, 1, 1, 1, 1, 1,
-1.529903, 1.189324, -2.287203, 1, 1, 1, 1, 1,
-1.519667, -0.704846, -0.05512614, 1, 1, 1, 1, 1,
-1.514059, 1.103241, -0.7580189, 1, 1, 1, 1, 1,
-1.508937, -1.361916, -1.253595, 1, 1, 1, 1, 1,
-1.507974, -1.072225, -2.715012, 1, 1, 1, 1, 1,
-1.500516, -0.2870529, -1.999651, 1, 1, 1, 1, 1,
-1.492535, -0.5930369, 0.03887359, 1, 1, 1, 1, 1,
-1.469755, -0.5842822, -2.619823, 1, 1, 1, 1, 1,
-1.467466, 1.751437, -2.512538, 1, 1, 1, 1, 1,
-1.463302, -0.2286893, -1.846646, 1, 1, 1, 1, 1,
-1.457198, -1.210214, -3.929777, 1, 1, 1, 1, 1,
-1.440401, -1.668316, -1.909517, 0, 0, 1, 1, 1,
-1.429835, -0.1013114, -0.9568982, 1, 0, 0, 1, 1,
-1.428397, -1.168877, -2.264016, 1, 0, 0, 1, 1,
-1.425219, -1.295216, -2.290793, 1, 0, 0, 1, 1,
-1.422155, 0.009401247, -3.218289, 1, 0, 0, 1, 1,
-1.422025, -0.9571669, -2.737155, 1, 0, 0, 1, 1,
-1.415051, -1.092785, -2.382762, 0, 0, 0, 1, 1,
-1.397862, -0.280683, -1.631899, 0, 0, 0, 1, 1,
-1.395519, 0.5299211, -1.579755, 0, 0, 0, 1, 1,
-1.383455, 1.875616, -0.8402337, 0, 0, 0, 1, 1,
-1.380736, 0.08087463, -2.178716, 0, 0, 0, 1, 1,
-1.378417, 1.683139, -1.050163, 0, 0, 0, 1, 1,
-1.351512, -2.00456, -2.845029, 0, 0, 0, 1, 1,
-1.339891, -0.5347066, -1.213339, 1, 1, 1, 1, 1,
-1.339396, 1.633605, 0.3803588, 1, 1, 1, 1, 1,
-1.334633, 0.4518868, -3.000184, 1, 1, 1, 1, 1,
-1.331875, -1.769422, -2.562414, 1, 1, 1, 1, 1,
-1.320757, -0.6791912, -2.988148, 1, 1, 1, 1, 1,
-1.317424, -0.0402478, -0.9863662, 1, 1, 1, 1, 1,
-1.310435, -0.01485175, -2.885846, 1, 1, 1, 1, 1,
-1.284126, -1.837376, -2.002186, 1, 1, 1, 1, 1,
-1.284028, 1.80582, 0.7101602, 1, 1, 1, 1, 1,
-1.278522, 1.318483, -0.4681421, 1, 1, 1, 1, 1,
-1.250752, -1.422033, -1.520817, 1, 1, 1, 1, 1,
-1.24736, 1.345079, -0.1035627, 1, 1, 1, 1, 1,
-1.223936, 1.295312, -0.8645912, 1, 1, 1, 1, 1,
-1.205927, 1.382818, -0.2924637, 1, 1, 1, 1, 1,
-1.201231, -0.2476469, -2.050843, 1, 1, 1, 1, 1,
-1.200657, 0.4222464, -0.3203601, 0, 0, 1, 1, 1,
-1.182231, -0.8252744, -3.857496, 1, 0, 0, 1, 1,
-1.177287, 1.705483, 1.598745, 1, 0, 0, 1, 1,
-1.177135, 0.002935306, -0.7262957, 1, 0, 0, 1, 1,
-1.17373, -1.80412, -2.378714, 1, 0, 0, 1, 1,
-1.168653, 1.735153, -1.6738, 1, 0, 0, 1, 1,
-1.163657, -0.2921383, -1.371381, 0, 0, 0, 1, 1,
-1.16214, 0.6904981, 0.2136958, 0, 0, 0, 1, 1,
-1.160682, -0.6003153, -2.114267, 0, 0, 0, 1, 1,
-1.139232, 0.8771206, 0.1523652, 0, 0, 0, 1, 1,
-1.133125, 0.1777092, -3.418752, 0, 0, 0, 1, 1,
-1.132946, 0.4043508, -0.4244467, 0, 0, 0, 1, 1,
-1.130343, -0.3542293, -3.066548, 0, 0, 0, 1, 1,
-1.126788, 0.4590399, -1.552568, 1, 1, 1, 1, 1,
-1.12573, -0.7592606, -2.557153, 1, 1, 1, 1, 1,
-1.113935, 0.8911462, -1.857716, 1, 1, 1, 1, 1,
-1.110616, 1.00952, -0.9585795, 1, 1, 1, 1, 1,
-1.097294, 0.6298957, -2.49538, 1, 1, 1, 1, 1,
-1.087356, -1.412528, -1.600689, 1, 1, 1, 1, 1,
-1.086288, -1.034047, -1.885285, 1, 1, 1, 1, 1,
-1.084816, 0.4384188, -1.467049, 1, 1, 1, 1, 1,
-1.0701, 1.784897, -1.621644, 1, 1, 1, 1, 1,
-1.069608, 0.2706692, -1.405308, 1, 1, 1, 1, 1,
-1.062507, 0.3614192, -1.403478, 1, 1, 1, 1, 1,
-1.061859, -0.8176498, -0.2648584, 1, 1, 1, 1, 1,
-1.058986, -0.1731997, -3.133792, 1, 1, 1, 1, 1,
-1.05886, 0.392655, -1.915645, 1, 1, 1, 1, 1,
-1.055673, -1.888586, -0.2809034, 1, 1, 1, 1, 1,
-1.053797, -1.327978, -3.002079, 0, 0, 1, 1, 1,
-1.044317, -1.969524, -2.021856, 1, 0, 0, 1, 1,
-1.040223, 1.117185, -2.419776, 1, 0, 0, 1, 1,
-1.031905, -1.461284, -1.935015, 1, 0, 0, 1, 1,
-1.02546, 0.5776201, -2.998915, 1, 0, 0, 1, 1,
-1.017619, -1.674099, -5.310621, 1, 0, 0, 1, 1,
-1.016994, 0.5269207, 0.4130534, 0, 0, 0, 1, 1,
-1.016529, 1.508559, -0.6875318, 0, 0, 0, 1, 1,
-1.014627, 0.3216336, 2.312701, 0, 0, 0, 1, 1,
-1.002621, -1.686533, -3.170174, 0, 0, 0, 1, 1,
-0.9879153, 0.4817826, -1.959351, 0, 0, 0, 1, 1,
-0.9852372, -0.9704906, -2.279776, 0, 0, 0, 1, 1,
-0.9846056, 0.2617621, -2.220476, 0, 0, 0, 1, 1,
-0.9839079, -0.1646449, -2.307686, 1, 1, 1, 1, 1,
-0.9710085, 0.1331827, -0.3681095, 1, 1, 1, 1, 1,
-0.9646238, -0.2089445, -0.7276992, 1, 1, 1, 1, 1,
-0.9551803, 0.1581971, -2.145076, 1, 1, 1, 1, 1,
-0.9546776, -1.968555, -3.398342, 1, 1, 1, 1, 1,
-0.9515962, -1.575549, -2.799909, 1, 1, 1, 1, 1,
-0.9511636, -0.5057382, -2.946122, 1, 1, 1, 1, 1,
-0.9435254, 0.9967143, -1.449346, 1, 1, 1, 1, 1,
-0.9429168, -0.6139501, -2.664232, 1, 1, 1, 1, 1,
-0.9421041, -1.498682, -2.029124, 1, 1, 1, 1, 1,
-0.9414262, 0.03992547, -0.9694036, 1, 1, 1, 1, 1,
-0.9397094, 0.7200811, -1.96587, 1, 1, 1, 1, 1,
-0.9354876, -1.017114, -4.10405, 1, 1, 1, 1, 1,
-0.92693, -0.07660832, -2.889622, 1, 1, 1, 1, 1,
-0.9268968, 0.3372023, -3.753105, 1, 1, 1, 1, 1,
-0.9202032, -1.639646, -0.9221554, 0, 0, 1, 1, 1,
-0.9194635, -1.158618, -3.36267, 1, 0, 0, 1, 1,
-0.9179807, 2.158384, 0.2129357, 1, 0, 0, 1, 1,
-0.9167184, -1.762423, -3.333613, 1, 0, 0, 1, 1,
-0.9089469, 2.17367, 0.3406014, 1, 0, 0, 1, 1,
-0.9059054, -1.526232, -1.94496, 1, 0, 0, 1, 1,
-0.8991668, 0.1508636, -0.1673657, 0, 0, 0, 1, 1,
-0.8922033, 0.3218882, -1.695304, 0, 0, 0, 1, 1,
-0.8880837, 0.591667, -0.9919766, 0, 0, 0, 1, 1,
-0.8767967, -0.6284785, -2.644619, 0, 0, 0, 1, 1,
-0.8727978, 0.4382344, -1.048128, 0, 0, 0, 1, 1,
-0.8625319, -0.06265144, -2.274962, 0, 0, 0, 1, 1,
-0.8599823, 0.4867798, -2.764829, 0, 0, 0, 1, 1,
-0.8527411, 0.6110987, 0.4046989, 1, 1, 1, 1, 1,
-0.8523146, -0.6619838, -4.182751, 1, 1, 1, 1, 1,
-0.8503582, 0.1265516, -2.084051, 1, 1, 1, 1, 1,
-0.8341995, -2.004545, -1.209345, 1, 1, 1, 1, 1,
-0.834083, -0.2159104, -3.021687, 1, 1, 1, 1, 1,
-0.8320109, 1.057554, -1.123574, 1, 1, 1, 1, 1,
-0.8298823, -0.06640009, -1.379184, 1, 1, 1, 1, 1,
-0.8178329, 1.296347, 0.5839316, 1, 1, 1, 1, 1,
-0.8168564, 0.5044106, -1.074237, 1, 1, 1, 1, 1,
-0.8156633, 0.5685951, -2.304296, 1, 1, 1, 1, 1,
-0.8146102, -0.5848877, -2.567944, 1, 1, 1, 1, 1,
-0.8087759, 1.569824, -0.8673582, 1, 1, 1, 1, 1,
-0.8086358, -0.8888307, -4.256508, 1, 1, 1, 1, 1,
-0.8079478, -1.362514, -1.905308, 1, 1, 1, 1, 1,
-0.8054889, 1.026533, -0.310798, 1, 1, 1, 1, 1,
-0.8041255, 0.5220987, 0.06176721, 0, 0, 1, 1, 1,
-0.8041235, -0.3428667, -2.052451, 1, 0, 0, 1, 1,
-0.8034102, -1.137121, -3.700376, 1, 0, 0, 1, 1,
-0.7960143, 0.8532692, -0.4346929, 1, 0, 0, 1, 1,
-0.7939306, 0.283372, -0.01828643, 1, 0, 0, 1, 1,
-0.7903696, 0.8159299, -1.799528, 1, 0, 0, 1, 1,
-0.7851743, -1.946762, 0.3120755, 0, 0, 0, 1, 1,
-0.784938, 1.256247, -0.5032784, 0, 0, 0, 1, 1,
-0.7847486, -2.323146, -3.92426, 0, 0, 0, 1, 1,
-0.7837836, -0.5197433, -1.719773, 0, 0, 0, 1, 1,
-0.7800647, 0.8677352, -1.891072, 0, 0, 0, 1, 1,
-0.7789444, -0.2877307, 0.05262029, 0, 0, 0, 1, 1,
-0.7736784, -0.9028618, -1.460393, 0, 0, 0, 1, 1,
-0.7732466, 0.2700474, -2.795512, 1, 1, 1, 1, 1,
-0.7682059, -0.0634038, -2.396876, 1, 1, 1, 1, 1,
-0.7543271, 0.6433249, -1.78478, 1, 1, 1, 1, 1,
-0.7504168, 0.6156198, -0.2760507, 1, 1, 1, 1, 1,
-0.7449102, -0.5436981, -1.435724, 1, 1, 1, 1, 1,
-0.7442275, 1.562418, -0.1030652, 1, 1, 1, 1, 1,
-0.7439805, 0.5557517, -1.165943, 1, 1, 1, 1, 1,
-0.743902, 0.4717771, -1.917569, 1, 1, 1, 1, 1,
-0.7413409, 0.5397275, 0.447366, 1, 1, 1, 1, 1,
-0.7377586, 1.798546, -0.3231651, 1, 1, 1, 1, 1,
-0.7369426, 1.489922, -0.6225273, 1, 1, 1, 1, 1,
-0.7297773, -1.216063, -2.842044, 1, 1, 1, 1, 1,
-0.7260602, -1.739978, -4.542789, 1, 1, 1, 1, 1,
-0.7250847, 0.7019349, 0.223016, 1, 1, 1, 1, 1,
-0.7212195, -0.1256181, -3.343779, 1, 1, 1, 1, 1,
-0.7191688, 1.051023, -0.5466319, 0, 0, 1, 1, 1,
-0.7160001, -0.4738837, -2.978496, 1, 0, 0, 1, 1,
-0.7151079, 0.8493432, 0.1073948, 1, 0, 0, 1, 1,
-0.7124946, 0.1897273, -1.913943, 1, 0, 0, 1, 1,
-0.711663, -1.23674, -3.749668, 1, 0, 0, 1, 1,
-0.7099174, -0.591455, -0.8820437, 1, 0, 0, 1, 1,
-0.7076821, 2.29971, 0.3235887, 0, 0, 0, 1, 1,
-0.7047375, -1.529853, -2.064296, 0, 0, 0, 1, 1,
-0.7030797, -1.940123, -5.185483, 0, 0, 0, 1, 1,
-0.6925676, -1.90654, -3.47135, 0, 0, 0, 1, 1,
-0.6900565, -0.4389625, -2.774083, 0, 0, 0, 1, 1,
-0.6890108, -1.918934, -1.79141, 0, 0, 0, 1, 1,
-0.6840298, -0.6172626, -2.180121, 0, 0, 0, 1, 1,
-0.6834566, -0.05726559, -1.194895, 1, 1, 1, 1, 1,
-0.680873, 0.6381081, -0.9644547, 1, 1, 1, 1, 1,
-0.6787971, -0.2604336, -0.6894355, 1, 1, 1, 1, 1,
-0.6756483, -1.439686, -2.322991, 1, 1, 1, 1, 1,
-0.6732072, -0.4431874, -1.827729, 1, 1, 1, 1, 1,
-0.6678036, -0.6720636, -3.309453, 1, 1, 1, 1, 1,
-0.66673, 0.3027639, -2.718394, 1, 1, 1, 1, 1,
-0.66179, 1.115427, -0.2531581, 1, 1, 1, 1, 1,
-0.6507884, -1.322983, -1.411887, 1, 1, 1, 1, 1,
-0.6478719, -0.4827735, -2.480482, 1, 1, 1, 1, 1,
-0.6419774, 0.9621096, 0.5578191, 1, 1, 1, 1, 1,
-0.638091, -1.879764, -0.7397941, 1, 1, 1, 1, 1,
-0.6313725, -0.9103457, -1.044695, 1, 1, 1, 1, 1,
-0.6310329, 0.9823185, -0.5018722, 1, 1, 1, 1, 1,
-0.6293511, 0.1178935, 0.363359, 1, 1, 1, 1, 1,
-0.6253833, 0.3206233, 0.4612136, 0, 0, 1, 1, 1,
-0.6174961, -0.03555772, -2.930619, 1, 0, 0, 1, 1,
-0.6171806, 0.7258621, -0.0712912, 1, 0, 0, 1, 1,
-0.6163247, 2.694921, -1.11893, 1, 0, 0, 1, 1,
-0.616275, -0.4148434, -2.011519, 1, 0, 0, 1, 1,
-0.615288, -0.2753924, -2.395164, 1, 0, 0, 1, 1,
-0.6141582, 1.437163, -2.224589, 0, 0, 0, 1, 1,
-0.6140146, 0.7578743, -1.158962, 0, 0, 0, 1, 1,
-0.6109475, 0.1916578, 0.4226085, 0, 0, 0, 1, 1,
-0.6108528, -0.3786214, -2.617623, 0, 0, 0, 1, 1,
-0.6086344, -2.438214, -3.105732, 0, 0, 0, 1, 1,
-0.6019676, 0.1027521, -2.139997, 0, 0, 0, 1, 1,
-0.5993448, 0.1943099, -0.217612, 0, 0, 0, 1, 1,
-0.5990618, 0.658496, -3.042887, 1, 1, 1, 1, 1,
-0.5911108, 1.825339, -1.182634, 1, 1, 1, 1, 1,
-0.5835235, -0.975426, -1.63208, 1, 1, 1, 1, 1,
-0.5785435, -2.065061, -3.718628, 1, 1, 1, 1, 1,
-0.5773324, -0.4471392, -3.014651, 1, 1, 1, 1, 1,
-0.5724714, -1.122159, -2.463671, 1, 1, 1, 1, 1,
-0.5693205, -0.4802903, -2.737719, 1, 1, 1, 1, 1,
-0.5608758, -1.281916, -4.401112, 1, 1, 1, 1, 1,
-0.5562184, -0.01584239, -1.08778, 1, 1, 1, 1, 1,
-0.5549145, -0.4448768, -1.529481, 1, 1, 1, 1, 1,
-0.5546497, 0.9426469, -0.8428043, 1, 1, 1, 1, 1,
-0.5516495, 1.295202, 0.4450011, 1, 1, 1, 1, 1,
-0.5488878, 0.1996861, -1.27186, 1, 1, 1, 1, 1,
-0.5450791, 0.7062517, 0.811625, 1, 1, 1, 1, 1,
-0.5443807, -0.2581961, -4.189095, 1, 1, 1, 1, 1,
-0.5439202, -1.391091, -3.373185, 0, 0, 1, 1, 1,
-0.540893, 0.650392, -0.4467402, 1, 0, 0, 1, 1,
-0.5407501, -0.2058621, -2.192636, 1, 0, 0, 1, 1,
-0.5406971, 0.6443781, 0.6084903, 1, 0, 0, 1, 1,
-0.525364, 0.2489083, -2.146551, 1, 0, 0, 1, 1,
-0.5252488, -2.764623, -1.280418, 1, 0, 0, 1, 1,
-0.5229421, 0.6064042, 0.6123885, 0, 0, 0, 1, 1,
-0.5205883, 2.195785, -0.1819668, 0, 0, 0, 1, 1,
-0.5195275, -2.460057, -1.711183, 0, 0, 0, 1, 1,
-0.5159, 0.2565785, -2.74867, 0, 0, 0, 1, 1,
-0.5147495, 0.2784477, -1.790722, 0, 0, 0, 1, 1,
-0.5043401, 0.8650031, -0.01042658, 0, 0, 0, 1, 1,
-0.5042713, -0.5036803, -1.509076, 0, 0, 0, 1, 1,
-0.4983647, -0.8404766, -3.082506, 1, 1, 1, 1, 1,
-0.4982355, 0.3283205, -0.4277865, 1, 1, 1, 1, 1,
-0.4920907, 0.3204155, -1.730203, 1, 1, 1, 1, 1,
-0.4749285, 0.2879173, -0.6800506, 1, 1, 1, 1, 1,
-0.4742115, -0.07185334, -2.634535, 1, 1, 1, 1, 1,
-0.4699825, -0.4043017, -1.575215, 1, 1, 1, 1, 1,
-0.4693983, 0.4383683, 1.16799, 1, 1, 1, 1, 1,
-0.4627593, -0.5364684, -4.011957, 1, 1, 1, 1, 1,
-0.461787, -0.01687532, -1.509586, 1, 1, 1, 1, 1,
-0.4596259, -0.09292429, -2.623595, 1, 1, 1, 1, 1,
-0.4551873, 0.5809515, -0.7464383, 1, 1, 1, 1, 1,
-0.4455409, -0.6720046, -3.591939, 1, 1, 1, 1, 1,
-0.4350173, -0.4430146, -2.656226, 1, 1, 1, 1, 1,
-0.4333654, 0.1740622, -1.703227, 1, 1, 1, 1, 1,
-0.4269576, -1.24541, -1.411134, 1, 1, 1, 1, 1,
-0.4195378, 1.428249, -0.09512407, 0, 0, 1, 1, 1,
-0.4155005, 1.554949, 0.8391621, 1, 0, 0, 1, 1,
-0.4123864, -0.3612197, -2.312424, 1, 0, 0, 1, 1,
-0.4107771, -1.296895, -2.89596, 1, 0, 0, 1, 1,
-0.4107443, -0.3875871, -4.118558, 1, 0, 0, 1, 1,
-0.4091336, -0.1680179, -0.3415322, 1, 0, 0, 1, 1,
-0.408376, -1.676008, -3.545639, 0, 0, 0, 1, 1,
-0.3976021, 1.102885, 0.05403804, 0, 0, 0, 1, 1,
-0.3959886, -0.9607383, -1.507951, 0, 0, 0, 1, 1,
-0.3951156, -0.5380364, -1.780386, 0, 0, 0, 1, 1,
-0.3946579, 0.225624, -0.6942393, 0, 0, 0, 1, 1,
-0.3883266, 0.2687974, -1.501454, 0, 0, 0, 1, 1,
-0.3863913, 0.4077787, -1.168681, 0, 0, 0, 1, 1,
-0.3847622, 1.716069, 0.1199679, 1, 1, 1, 1, 1,
-0.3844421, 0.641193, -0.3020535, 1, 1, 1, 1, 1,
-0.3823121, 0.5630491, -1.646351, 1, 1, 1, 1, 1,
-0.3813719, 1.608593, 0.5090994, 1, 1, 1, 1, 1,
-0.3808794, -2.259846, -3.500757, 1, 1, 1, 1, 1,
-0.3808714, -1.099689, -3.170691, 1, 1, 1, 1, 1,
-0.377113, 0.5545836, 0.01677436, 1, 1, 1, 1, 1,
-0.3727115, -0.9828526, -3.528215, 1, 1, 1, 1, 1,
-0.3721283, -0.5322031, -2.536676, 1, 1, 1, 1, 1,
-0.3689696, -1.289744, -3.940723, 1, 1, 1, 1, 1,
-0.3687759, -1.061379, -2.700366, 1, 1, 1, 1, 1,
-0.3660668, 0.5225009, 0.2195993, 1, 1, 1, 1, 1,
-0.3648375, 1.161705, -0.08447202, 1, 1, 1, 1, 1,
-0.3645671, -0.01767069, -2.141164, 1, 1, 1, 1, 1,
-0.3638281, 0.6712371, 0.04935846, 1, 1, 1, 1, 1,
-0.3616728, -0.03801732, -2.273978, 0, 0, 1, 1, 1,
-0.3607754, 0.3367681, -1.153576, 1, 0, 0, 1, 1,
-0.3543088, -0.07084529, -1.775096, 1, 0, 0, 1, 1,
-0.3534889, 0.2355714, -2.042576, 1, 0, 0, 1, 1,
-0.352583, 0.1821984, -2.59006, 1, 0, 0, 1, 1,
-0.3495663, 0.1028915, -0.5111635, 1, 0, 0, 1, 1,
-0.3481654, 0.3881862, -0.5537966, 0, 0, 0, 1, 1,
-0.3472425, 0.1710451, -1.131812, 0, 0, 0, 1, 1,
-0.3398042, 0.3255136, -0.4767936, 0, 0, 0, 1, 1,
-0.3364603, 0.1952993, -1.93193, 0, 0, 0, 1, 1,
-0.3322826, 0.6395693, -1.763333, 0, 0, 0, 1, 1,
-0.3308895, -0.3213821, -3.004177, 0, 0, 0, 1, 1,
-0.3288104, -0.3839161, -1.321267, 0, 0, 0, 1, 1,
-0.3279608, 1.609069, -0.237519, 1, 1, 1, 1, 1,
-0.321968, 0.3641485, 0.3190102, 1, 1, 1, 1, 1,
-0.3189943, 0.588269, -2.299189, 1, 1, 1, 1, 1,
-0.3177666, -2.128231, -2.92497, 1, 1, 1, 1, 1,
-0.3170561, -0.6503252, -3.40759, 1, 1, 1, 1, 1,
-0.3166588, 1.169146, -0.5513185, 1, 1, 1, 1, 1,
-0.3101488, -1.484522, -4.783883, 1, 1, 1, 1, 1,
-0.3082263, 0.3696982, 0.4499089, 1, 1, 1, 1, 1,
-0.3058812, -0.5007149, -3.83146, 1, 1, 1, 1, 1,
-0.3026254, 1.337251, 0.104747, 1, 1, 1, 1, 1,
-0.3019687, 0.1872484, 0.2234787, 1, 1, 1, 1, 1,
-0.3015919, 0.116779, -2.385033, 1, 1, 1, 1, 1,
-0.2996842, -0.1972805, -1.980831, 1, 1, 1, 1, 1,
-0.2992616, -0.1120776, -3.346048, 1, 1, 1, 1, 1,
-0.2988682, -0.3965155, -0.375123, 1, 1, 1, 1, 1,
-0.2940892, 0.02294484, -0.5231799, 0, 0, 1, 1, 1,
-0.2918559, -0.3083057, -3.400491, 1, 0, 0, 1, 1,
-0.2902434, -2.005462, -3.053536, 1, 0, 0, 1, 1,
-0.2879715, 0.7984184, 0.3573569, 1, 0, 0, 1, 1,
-0.2864272, -1.085773, -2.185528, 1, 0, 0, 1, 1,
-0.2839893, -0.2908299, -3.118958, 1, 0, 0, 1, 1,
-0.2835737, 1.509813, -1.167077, 0, 0, 0, 1, 1,
-0.2811147, 0.7624524, -0.1378878, 0, 0, 0, 1, 1,
-0.2733533, -0.04219829, 0.4224942, 0, 0, 0, 1, 1,
-0.2669217, -0.1720303, -1.953419, 0, 0, 0, 1, 1,
-0.2658827, -0.02138864, -1.924151, 0, 0, 0, 1, 1,
-0.2644487, 0.02431117, -1.037012, 0, 0, 0, 1, 1,
-0.2611304, 0.8358851, -1.164499, 0, 0, 0, 1, 1,
-0.2595762, 2.036033, 0.5927734, 1, 1, 1, 1, 1,
-0.256238, -0.1403747, -1.162924, 1, 1, 1, 1, 1,
-0.2551284, 0.5751686, -2.320068, 1, 1, 1, 1, 1,
-0.2525261, -0.6319133, -3.789076, 1, 1, 1, 1, 1,
-0.2511997, -1.102738, -3.119499, 1, 1, 1, 1, 1,
-0.2504248, 0.7770653, 0.8017547, 1, 1, 1, 1, 1,
-0.2496867, 0.4543348, -1.574814, 1, 1, 1, 1, 1,
-0.2496356, 0.7558239, 0.06085233, 1, 1, 1, 1, 1,
-0.2484824, -0.7684626, -2.664654, 1, 1, 1, 1, 1,
-0.2442248, 0.7766919, -0.6330897, 1, 1, 1, 1, 1,
-0.2439095, 0.7631773, 1.013084, 1, 1, 1, 1, 1,
-0.2371197, -0.2273988, -2.253908, 1, 1, 1, 1, 1,
-0.2354975, -0.3541646, -1.800398, 1, 1, 1, 1, 1,
-0.2289525, 1.480477, 0.05214067, 1, 1, 1, 1, 1,
-0.2275379, 0.5467194, -0.3369654, 1, 1, 1, 1, 1,
-0.2272611, -0.3913783, -3.001473, 0, 0, 1, 1, 1,
-0.2248301, 0.8015599, 0.002948882, 1, 0, 0, 1, 1,
-0.2235444, 1.121537, 1.302973, 1, 0, 0, 1, 1,
-0.2230616, -0.3123499, -2.670147, 1, 0, 0, 1, 1,
-0.222961, -0.1932144, -3.439353, 1, 0, 0, 1, 1,
-0.2155168, -1.998638, -3.582224, 1, 0, 0, 1, 1,
-0.2113837, 0.7009444, -0.3800862, 0, 0, 0, 1, 1,
-0.2053698, -0.9979334, -2.812292, 0, 0, 0, 1, 1,
-0.2042188, 3.104788, 0.9888517, 0, 0, 0, 1, 1,
-0.203104, -0.2890773, -1.840801, 0, 0, 0, 1, 1,
-0.1912065, 0.3858021, 0.2073901, 0, 0, 0, 1, 1,
-0.1864792, 0.2897303, -1.132286, 0, 0, 0, 1, 1,
-0.1860433, 0.7808833, 1.348458, 0, 0, 0, 1, 1,
-0.185028, 1.458177, 0.7348474, 1, 1, 1, 1, 1,
-0.1803938, -2.156249, -4.077361, 1, 1, 1, 1, 1,
-0.1777855, 1.006987, -0.6131253, 1, 1, 1, 1, 1,
-0.1770367, 0.9933348, -1.050052, 1, 1, 1, 1, 1,
-0.1730484, -0.1997129, -2.074323, 1, 1, 1, 1, 1,
-0.1712033, 0.3691696, -1.253733, 1, 1, 1, 1, 1,
-0.1652785, -0.1624332, -2.484155, 1, 1, 1, 1, 1,
-0.1647426, 1.869938, -0.0640722, 1, 1, 1, 1, 1,
-0.1645612, 0.844886, -0.5861573, 1, 1, 1, 1, 1,
-0.1617785, -0.3192412, -1.545834, 1, 1, 1, 1, 1,
-0.1583691, -0.8116586, -2.552519, 1, 1, 1, 1, 1,
-0.1561339, -0.3783281, -2.866654, 1, 1, 1, 1, 1,
-0.1557619, -0.2965729, -2.365198, 1, 1, 1, 1, 1,
-0.153708, 0.7580433, -0.1804488, 1, 1, 1, 1, 1,
-0.149717, -0.8508022, -3.258819, 1, 1, 1, 1, 1,
-0.1479824, -0.02750193, -2.415363, 0, 0, 1, 1, 1,
-0.1466729, 0.8430733, -0.1261262, 1, 0, 0, 1, 1,
-0.1415668, -0.1592437, -2.643115, 1, 0, 0, 1, 1,
-0.1382777, 0.7001621, 1.099603, 1, 0, 0, 1, 1,
-0.1379568, -1.042141, -3.054037, 1, 0, 0, 1, 1,
-0.134678, -1.283619, -3.476733, 1, 0, 0, 1, 1,
-0.1309546, -0.5982314, -0.9833674, 0, 0, 0, 1, 1,
-0.1305196, 0.5462533, -0.1963833, 0, 0, 0, 1, 1,
-0.1295825, 0.9323052, -0.2436015, 0, 0, 0, 1, 1,
-0.1270636, 1.339379, 1.748726, 0, 0, 0, 1, 1,
-0.1260592, -1.566701, -2.265693, 0, 0, 0, 1, 1,
-0.118632, -0.9071478, -2.716736, 0, 0, 0, 1, 1,
-0.1179576, 0.8930773, 0.05135183, 0, 0, 0, 1, 1,
-0.1140447, -0.3674278, -1.698985, 1, 1, 1, 1, 1,
-0.1120476, -0.4467117, -3.240694, 1, 1, 1, 1, 1,
-0.1111226, -0.8529044, -3.523245, 1, 1, 1, 1, 1,
-0.1104527, 0.9140983, -1.022691, 1, 1, 1, 1, 1,
-0.1094067, 1.347491, -0.1956918, 1, 1, 1, 1, 1,
-0.1079897, 1.154214, -1.358803, 1, 1, 1, 1, 1,
-0.1041763, -0.340125, -3.794471, 1, 1, 1, 1, 1,
-0.1033374, 0.6994432, -0.6683764, 1, 1, 1, 1, 1,
-0.1030555, -0.05035144, -1.870784, 1, 1, 1, 1, 1,
-0.101882, -1.510325, -2.097407, 1, 1, 1, 1, 1,
-0.09924833, 1.706815, -0.2422252, 1, 1, 1, 1, 1,
-0.09346734, 0.03334581, -1.076139, 1, 1, 1, 1, 1,
-0.0896512, 0.8989995, 0.5348759, 1, 1, 1, 1, 1,
-0.08776435, -0.6407741, -2.690161, 1, 1, 1, 1, 1,
-0.0816774, -1.347024, -3.427618, 1, 1, 1, 1, 1,
-0.07556282, 1.011684, -0.9393016, 0, 0, 1, 1, 1,
-0.0738285, -1.547606, -4.18943, 1, 0, 0, 1, 1,
-0.07360338, -0.19373, -3.619269, 1, 0, 0, 1, 1,
-0.07325754, -0.2382816, -3.266007, 1, 0, 0, 1, 1,
-0.07115455, -2.817048, -3.932323, 1, 0, 0, 1, 1,
-0.06862964, -1.670743, -1.626637, 1, 0, 0, 1, 1,
-0.06454056, 1.137363, 0.5124496, 0, 0, 0, 1, 1,
-0.06434396, -0.2199039, -2.49447, 0, 0, 0, 1, 1,
-0.063899, 2.407408, -0.8126585, 0, 0, 0, 1, 1,
-0.06211808, 0.2343904, 0.2861371, 0, 0, 0, 1, 1,
-0.06197607, 1.887486, -0.08775822, 0, 0, 0, 1, 1,
-0.06170937, 1.180995, -0.3234849, 0, 0, 0, 1, 1,
-0.05721763, -1.076095, -2.597302, 0, 0, 0, 1, 1,
-0.05433492, -1.158242, -4.201015, 1, 1, 1, 1, 1,
-0.0539074, -0.7590817, -3.511795, 1, 1, 1, 1, 1,
-0.05302908, -1.550075, -2.306283, 1, 1, 1, 1, 1,
-0.05202622, 0.4116969, -1.62793, 1, 1, 1, 1, 1,
-0.04884749, -1.680752, -3.716404, 1, 1, 1, 1, 1,
-0.0433604, -0.1500506, -3.295918, 1, 1, 1, 1, 1,
-0.03995623, -0.9820361, -2.581562, 1, 1, 1, 1, 1,
-0.03467156, -0.1584321, -0.5907593, 1, 1, 1, 1, 1,
-0.03197361, 0.8028851, 0.1489199, 1, 1, 1, 1, 1,
-0.0302834, 0.2882878, 2.623978, 1, 1, 1, 1, 1,
-0.0276154, 1.133579, 0.2048997, 1, 1, 1, 1, 1,
-0.02662438, 0.6089051, 0.01745996, 1, 1, 1, 1, 1,
-0.025105, 1.491302, -2.150775, 1, 1, 1, 1, 1,
-0.02486282, 0.1394619, -0.8656839, 1, 1, 1, 1, 1,
-0.0244638, 0.9831023, -0.4308145, 1, 1, 1, 1, 1,
-0.01935947, -1.763408, -3.984178, 0, 0, 1, 1, 1,
-0.01890748, 0.2375894, -0.1516334, 1, 0, 0, 1, 1,
-0.0172412, -0.3644076, -3.234313, 1, 0, 0, 1, 1,
-0.01671961, 0.7880613, -0.8557696, 1, 0, 0, 1, 1,
-0.01475451, -0.9688546, -4.592541, 1, 0, 0, 1, 1,
-0.01202753, -0.1363288, -3.442685, 1, 0, 0, 1, 1,
-0.006357146, 0.1891836, -1.458035, 0, 0, 0, 1, 1,
-0.006068343, 0.2170204, 0.2256523, 0, 0, 0, 1, 1,
-0.003867765, -0.06927069, -3.687571, 0, 0, 0, 1, 1,
-0.003616524, 0.8921931, 1.088242, 0, 0, 0, 1, 1,
-0.002881362, -1.263349, -4.629874, 0, 0, 0, 1, 1,
-0.001065601, 0.6529141, 0.1190939, 0, 0, 0, 1, 1,
-0.0008158732, 0.9732339, -0.6568517, 0, 0, 0, 1, 1,
0.00288765, 0.636593, -1.340459, 1, 1, 1, 1, 1,
0.007155057, 2.133384, -0.09648562, 1, 1, 1, 1, 1,
0.008232228, -0.4902986, 2.517868, 1, 1, 1, 1, 1,
0.008565607, -2.035616, 2.768767, 1, 1, 1, 1, 1,
0.008731369, -0.2171762, 1.246952, 1, 1, 1, 1, 1,
0.01132831, -0.1454503, 3.928037, 1, 1, 1, 1, 1,
0.01290033, 0.8433915, -0.8006303, 1, 1, 1, 1, 1,
0.01793756, -0.5937102, 3.993411, 1, 1, 1, 1, 1,
0.02201086, 0.1527826, -0.3298959, 1, 1, 1, 1, 1,
0.03506582, 0.003019199, 1.724063, 1, 1, 1, 1, 1,
0.04795164, -0.5846097, 3.562674, 1, 1, 1, 1, 1,
0.04854098, -0.6793731, 3.58544, 1, 1, 1, 1, 1,
0.05081281, 1.017253, 0.5550982, 1, 1, 1, 1, 1,
0.05261125, 0.9734386, 0.5038254, 1, 1, 1, 1, 1,
0.05274002, 1.017548, -0.2526344, 1, 1, 1, 1, 1,
0.05493193, 1.50913, 0.2505231, 0, 0, 1, 1, 1,
0.05723947, -0.2481972, 3.759956, 1, 0, 0, 1, 1,
0.05741769, -0.2457254, 2.382899, 1, 0, 0, 1, 1,
0.05929854, 0.9018522, -0.179875, 1, 0, 0, 1, 1,
0.06095906, 1.051143, 1.231339, 1, 0, 0, 1, 1,
0.06847972, 0.1688142, 1.632867, 1, 0, 0, 1, 1,
0.06910348, -0.5488139, 2.61646, 0, 0, 0, 1, 1,
0.07135347, 0.00617451, 1.132074, 0, 0, 0, 1, 1,
0.07485624, 1.597082, -0.16555, 0, 0, 0, 1, 1,
0.07615295, 0.3396572, -0.9414981, 0, 0, 0, 1, 1,
0.07771955, 0.01284347, 0.888686, 0, 0, 0, 1, 1,
0.07794525, -0.5403622, 2.617816, 0, 0, 0, 1, 1,
0.0782968, 0.3376343, -0.1499028, 0, 0, 0, 1, 1,
0.07941049, -0.7352458, 0.9123648, 1, 1, 1, 1, 1,
0.08042017, -0.1470813, 1.7363, 1, 1, 1, 1, 1,
0.08338065, -0.721355, 3.743379, 1, 1, 1, 1, 1,
0.08597922, -0.6028091, 1.292597, 1, 1, 1, 1, 1,
0.08653621, 0.5606142, 0.6430404, 1, 1, 1, 1, 1,
0.09135579, -0.2281446, 1.9433, 1, 1, 1, 1, 1,
0.09233847, -0.01746064, 2.597271, 1, 1, 1, 1, 1,
0.09250766, 0.3613587, -0.8856241, 1, 1, 1, 1, 1,
0.09412661, -0.9116683, 2.638103, 1, 1, 1, 1, 1,
0.09497681, 0.477974, -0.4379315, 1, 1, 1, 1, 1,
0.1029911, 2.410769, -0.3360234, 1, 1, 1, 1, 1,
0.1076722, 0.6112307, 0.8709018, 1, 1, 1, 1, 1,
0.1109318, -0.8244402, 4.175407, 1, 1, 1, 1, 1,
0.1116815, 1.039287, 1.173916, 1, 1, 1, 1, 1,
0.1127974, -0.03432725, 2.196812, 1, 1, 1, 1, 1,
0.1129033, 0.7534504, -1.124917, 0, 0, 1, 1, 1,
0.1130824, 0.1105927, 0.6810924, 1, 0, 0, 1, 1,
0.1132691, 1.239534, 0.3437332, 1, 0, 0, 1, 1,
0.1139318, 0.9429446, -0.7155726, 1, 0, 0, 1, 1,
0.1144904, -1.245151, 4.337865, 1, 0, 0, 1, 1,
0.1195335, 0.2778332, -0.06510363, 1, 0, 0, 1, 1,
0.1203253, 0.6248964, -0.455366, 0, 0, 0, 1, 1,
0.1207095, 3.548628, 0.3224082, 0, 0, 0, 1, 1,
0.1221893, -0.5821904, 3.049253, 0, 0, 0, 1, 1,
0.1222785, -1.107705, 3.322862, 0, 0, 0, 1, 1,
0.1261909, -0.4640527, 3.012493, 0, 0, 0, 1, 1,
0.1273865, 1.293913, 1.025416, 0, 0, 0, 1, 1,
0.1329995, 0.5450522, -0.02494311, 0, 0, 0, 1, 1,
0.1336077, -0.9803168, 3.744566, 1, 1, 1, 1, 1,
0.1349417, 1.468214, 0.4215081, 1, 1, 1, 1, 1,
0.135913, -0.2949986, 2.413284, 1, 1, 1, 1, 1,
0.1419375, 1.515549, -0.74207, 1, 1, 1, 1, 1,
0.1433052, -0.7735202, 1.989882, 1, 1, 1, 1, 1,
0.1503456, 2.172451, 1.041503, 1, 1, 1, 1, 1,
0.1505436, -1.175562, 6.003023, 1, 1, 1, 1, 1,
0.1519967, -0.6713885, 3.164954, 1, 1, 1, 1, 1,
0.1539204, 0.5680969, 0.6775004, 1, 1, 1, 1, 1,
0.1558511, 0.6046056, 2.027455, 1, 1, 1, 1, 1,
0.1584858, 1.008503, -1.361044, 1, 1, 1, 1, 1,
0.1587047, -0.9079559, 2.45602, 1, 1, 1, 1, 1,
0.1587192, -0.08460648, 0.8366763, 1, 1, 1, 1, 1,
0.1694499, -0.7472358, 2.55103, 1, 1, 1, 1, 1,
0.1702041, 0.7669712, -1.073075, 1, 1, 1, 1, 1,
0.175534, 0.03471401, 2.446151, 0, 0, 1, 1, 1,
0.1779979, 0.8037261, -0.2614022, 1, 0, 0, 1, 1,
0.179361, -1.958228, 3.276208, 1, 0, 0, 1, 1,
0.179802, -1.808239, 2.284856, 1, 0, 0, 1, 1,
0.1845436, -0.171624, 3.200265, 1, 0, 0, 1, 1,
0.1855115, 1.772501, 0.2352972, 1, 0, 0, 1, 1,
0.187862, 0.3656048, -0.8340067, 0, 0, 0, 1, 1,
0.194051, -1.357603, 2.876256, 0, 0, 0, 1, 1,
0.1980031, 0.5256271, -0.5490073, 0, 0, 0, 1, 1,
0.199211, 0.8085761, 0.05233347, 0, 0, 0, 1, 1,
0.2007576, -1.099478, 3.39472, 0, 0, 0, 1, 1,
0.2027929, -0.6641068, 4.572718, 0, 0, 0, 1, 1,
0.2039769, -0.502661, 2.650608, 0, 0, 0, 1, 1,
0.2050461, 2.077927, 0.1840128, 1, 1, 1, 1, 1,
0.2130219, -2.224395, 2.123767, 1, 1, 1, 1, 1,
0.2179584, -0.3533327, 1.024102, 1, 1, 1, 1, 1,
0.2192937, 1.922929, -0.9939452, 1, 1, 1, 1, 1,
0.2199868, -0.4901049, 2.683828, 1, 1, 1, 1, 1,
0.2204627, -0.453312, 2.614586, 1, 1, 1, 1, 1,
0.2279272, 0.4689822, -0.8933195, 1, 1, 1, 1, 1,
0.2283255, -0.4577607, 5.073354, 1, 1, 1, 1, 1,
0.2309787, 0.4858681, 0.9102907, 1, 1, 1, 1, 1,
0.2310682, -1.105748, 2.077288, 1, 1, 1, 1, 1,
0.2328485, 0.5737625, 0.1992004, 1, 1, 1, 1, 1,
0.2329252, 1.47667, 0.5089483, 1, 1, 1, 1, 1,
0.2365078, -1.745386, 3.940762, 1, 1, 1, 1, 1,
0.2365282, 0.7901198, 1.982456, 1, 1, 1, 1, 1,
0.2365412, 1.224164, 1.077541, 1, 1, 1, 1, 1,
0.2398498, 0.5246151, 0.2041792, 0, 0, 1, 1, 1,
0.2403215, 0.9223239, 1.97371, 1, 0, 0, 1, 1,
0.2411958, -0.5870111, 0.9195268, 1, 0, 0, 1, 1,
0.2416986, -0.1820958, 2.899048, 1, 0, 0, 1, 1,
0.2532852, 1.133905, 2.120004, 1, 0, 0, 1, 1,
0.2546701, 0.7426865, 1.38401, 1, 0, 0, 1, 1,
0.2553046, 1.049282, 0.7946922, 0, 0, 0, 1, 1,
0.2555556, 0.4743514, 2.067011, 0, 0, 0, 1, 1,
0.2555714, -0.9298133, 1.511067, 0, 0, 0, 1, 1,
0.2638343, 2.732067, 0.9133285, 0, 0, 0, 1, 1,
0.2663468, 0.3218223, 1.110751, 0, 0, 0, 1, 1,
0.2713525, 0.9455261, 0.3963673, 0, 0, 0, 1, 1,
0.2721945, 0.4189928, 1.04453, 0, 0, 0, 1, 1,
0.2743096, -0.3374119, 2.001929, 1, 1, 1, 1, 1,
0.2794307, -0.02782771, 1.348272, 1, 1, 1, 1, 1,
0.2796447, 0.4614425, 1.173778, 1, 1, 1, 1, 1,
0.2835515, -0.4665443, 2.630293, 1, 1, 1, 1, 1,
0.2851112, 0.4887658, -0.4414605, 1, 1, 1, 1, 1,
0.2864276, 0.4479028, 0.1943475, 1, 1, 1, 1, 1,
0.2920787, 0.9547122, 0.02713544, 1, 1, 1, 1, 1,
0.2924595, 0.385056, 1.431074, 1, 1, 1, 1, 1,
0.2926055, 1.301172, -1.002679, 1, 1, 1, 1, 1,
0.2934405, -0.07665462, 1.639077, 1, 1, 1, 1, 1,
0.2972377, 0.3895169, -0.6714581, 1, 1, 1, 1, 1,
0.2974042, 2.783369, 2.29539, 1, 1, 1, 1, 1,
0.3017892, 0.2310756, 0.9983048, 1, 1, 1, 1, 1,
0.3116565, -1.641281, 2.735537, 1, 1, 1, 1, 1,
0.3141127, 2.467039, -0.4784523, 1, 1, 1, 1, 1,
0.3163776, -0.1444115, 2.345399, 0, 0, 1, 1, 1,
0.3164761, -0.92589, 4.176745, 1, 0, 0, 1, 1,
0.3221924, -0.6862988, 2.15218, 1, 0, 0, 1, 1,
0.3284328, -0.9168354, 2.587467, 1, 0, 0, 1, 1,
0.3313535, 0.8347012, 0.7775401, 1, 0, 0, 1, 1,
0.336129, 0.7528083, 0.06314408, 1, 0, 0, 1, 1,
0.3404944, -0.06994558, 0.5925477, 0, 0, 0, 1, 1,
0.3467349, -0.8802023, 3.250506, 0, 0, 0, 1, 1,
0.3508131, 0.009912753, 1.351403, 0, 0, 0, 1, 1,
0.3508587, -2.079601, 2.664879, 0, 0, 0, 1, 1,
0.3542472, 0.2416125, 0.7696564, 0, 0, 0, 1, 1,
0.3545213, -0.4623736, 2.768337, 0, 0, 0, 1, 1,
0.3577827, 0.2783962, 3.073218, 0, 0, 0, 1, 1,
0.3577948, -0.5074012, 0.9505622, 1, 1, 1, 1, 1,
0.3596943, 0.2137378, 0.8859665, 1, 1, 1, 1, 1,
0.3597411, 1.741529, -0.9688268, 1, 1, 1, 1, 1,
0.3620335, -1.912974, 4.428155, 1, 1, 1, 1, 1,
0.3649631, -0.3344159, 2.670134, 1, 1, 1, 1, 1,
0.3738267, -1.928463, 2.750747, 1, 1, 1, 1, 1,
0.3745324, 0.6512034, 0.5006445, 1, 1, 1, 1, 1,
0.3800309, 1.592107, 0.7933849, 1, 1, 1, 1, 1,
0.3815092, 0.2934543, 0.3715656, 1, 1, 1, 1, 1,
0.3830311, -0.3886676, 0.695543, 1, 1, 1, 1, 1,
0.3850814, 1.125863, 2.082192, 1, 1, 1, 1, 1,
0.3868358, 3.522552, 0.4212892, 1, 1, 1, 1, 1,
0.3904769, 0.04553747, 1.272384, 1, 1, 1, 1, 1,
0.393503, 0.5632557, 0.8706887, 1, 1, 1, 1, 1,
0.3939187, -1.366208, 4.007633, 1, 1, 1, 1, 1,
0.3968816, 0.3819062, 1.25126, 0, 0, 1, 1, 1,
0.3984172, 0.222408, 0.950931, 1, 0, 0, 1, 1,
0.3985741, 0.001128023, 0.6449093, 1, 0, 0, 1, 1,
0.4037093, -0.5161001, 3.208583, 1, 0, 0, 1, 1,
0.4149351, -0.9696522, 2.472801, 1, 0, 0, 1, 1,
0.4165378, 0.1687955, -0.2119057, 1, 0, 0, 1, 1,
0.4174046, -0.5658845, 3.466529, 0, 0, 0, 1, 1,
0.4174223, -0.1802542, 1.169364, 0, 0, 0, 1, 1,
0.4177268, -1.856989, 3.076395, 0, 0, 0, 1, 1,
0.4197463, -1.324349, 3.990152, 0, 0, 0, 1, 1,
0.4221136, -0.525126, 1.610913, 0, 0, 0, 1, 1,
0.4252281, 1.034354, 0.3662101, 0, 0, 0, 1, 1,
0.4256473, -0.6800103, 2.016268, 0, 0, 0, 1, 1,
0.4276669, 0.781794, 0.4195913, 1, 1, 1, 1, 1,
0.4293492, 0.4340241, 0.9157917, 1, 1, 1, 1, 1,
0.4304366, -0.2688943, 3.802772, 1, 1, 1, 1, 1,
0.435258, 1.316347, 1.012578, 1, 1, 1, 1, 1,
0.4421833, 0.4282022, 0.8394554, 1, 1, 1, 1, 1,
0.4478819, 0.7553548, -0.688143, 1, 1, 1, 1, 1,
0.4494406, -0.9360639, 0.4344997, 1, 1, 1, 1, 1,
0.4525839, -1.274469, 1.022347, 1, 1, 1, 1, 1,
0.4547132, 0.02959951, 1.15898, 1, 1, 1, 1, 1,
0.4578518, -0.561796, 2.327814, 1, 1, 1, 1, 1,
0.4594937, -0.355749, 2.95997, 1, 1, 1, 1, 1,
0.4603045, 0.7456692, 1.109416, 1, 1, 1, 1, 1,
0.4605616, 0.3033256, 1.523916, 1, 1, 1, 1, 1,
0.4647485, -0.04463691, 2.054429, 1, 1, 1, 1, 1,
0.468793, -1.448465, 3.508289, 1, 1, 1, 1, 1,
0.4689837, -0.2915575, -0.379825, 0, 0, 1, 1, 1,
0.4693262, -0.8477842, 3.118801, 1, 0, 0, 1, 1,
0.4947796, 0.1852323, 1.405425, 1, 0, 0, 1, 1,
0.4948235, -0.1807654, 2.003352, 1, 0, 0, 1, 1,
0.4952948, -0.5082496, 2.463481, 1, 0, 0, 1, 1,
0.4973224, 0.4657942, 0.5720481, 1, 0, 0, 1, 1,
0.4990642, 1.142279, 0.08140792, 0, 0, 0, 1, 1,
0.5064321, 0.8396743, 2.292084, 0, 0, 0, 1, 1,
0.5112299, -0.5260788, 2.713608, 0, 0, 0, 1, 1,
0.5125239, 1.602163, 0.00905132, 0, 0, 0, 1, 1,
0.5137923, 1.010499, 1.923587, 0, 0, 0, 1, 1,
0.5180339, 1.462762, 1.337712, 0, 0, 0, 1, 1,
0.5183482, 0.6631519, 1.152611, 0, 0, 0, 1, 1,
0.5207013, -0.5162804, 2.196568, 1, 1, 1, 1, 1,
0.5229815, -1.803162, 3.776653, 1, 1, 1, 1, 1,
0.5278037, 0.4814349, 1.398986, 1, 1, 1, 1, 1,
0.5283284, -0.9061776, 2.08495, 1, 1, 1, 1, 1,
0.5311036, -0.9580518, 2.69889, 1, 1, 1, 1, 1,
0.5331113, 0.7951137, 1.15032, 1, 1, 1, 1, 1,
0.5370871, -0.9677772, 0.2259883, 1, 1, 1, 1, 1,
0.5386642, -0.788478, 2.226446, 1, 1, 1, 1, 1,
0.5406452, -0.9013991, 3.234916, 1, 1, 1, 1, 1,
0.5415179, -0.4984193, 2.853379, 1, 1, 1, 1, 1,
0.5415505, -0.1558247, 2.254585, 1, 1, 1, 1, 1,
0.543406, 0.2615905, 1.450012, 1, 1, 1, 1, 1,
0.5464112, 0.002484401, 2.276711, 1, 1, 1, 1, 1,
0.5473233, 2.752195, 1.38714, 1, 1, 1, 1, 1,
0.5494267, 0.6040739, 2.93768, 1, 1, 1, 1, 1,
0.5518946, 0.4148704, 2.152846, 0, 0, 1, 1, 1,
0.5523165, -0.6579599, 3.678785, 1, 0, 0, 1, 1,
0.5523815, 0.09575925, 0.2419363, 1, 0, 0, 1, 1,
0.5530084, 0.2636265, 0.08235674, 1, 0, 0, 1, 1,
0.5544332, 1.712883, 1.188015, 1, 0, 0, 1, 1,
0.5555018, 1.603257, 0.1874334, 1, 0, 0, 1, 1,
0.5562135, 0.2883125, 0.9294206, 0, 0, 0, 1, 1,
0.5599732, -1.034098, 2.655874, 0, 0, 0, 1, 1,
0.5610904, -1.130806, 2.75362, 0, 0, 0, 1, 1,
0.5617346, -1.159544, 2.976388, 0, 0, 0, 1, 1,
0.5645689, 1.037076, -1.206055, 0, 0, 0, 1, 1,
0.5697457, 0.01922303, 2.235172, 0, 0, 0, 1, 1,
0.5780517, 0.9879431, -0.8938527, 0, 0, 0, 1, 1,
0.5781211, -0.2911834, 2.494887, 1, 1, 1, 1, 1,
0.5797026, 0.5602617, 1.11776, 1, 1, 1, 1, 1,
0.5859506, 0.1061091, 1.526574, 1, 1, 1, 1, 1,
0.5889438, 0.5463822, -0.3919051, 1, 1, 1, 1, 1,
0.5948868, 1.364565, 0.8024673, 1, 1, 1, 1, 1,
0.5992012, 0.9165256, 2.317964, 1, 1, 1, 1, 1,
0.6012489, -0.6192203, 2.940775, 1, 1, 1, 1, 1,
0.6017711, 0.160309, 0.8042122, 1, 1, 1, 1, 1,
0.6051999, 1.265423, 0.9709833, 1, 1, 1, 1, 1,
0.6082891, 1.543203, 0.08942455, 1, 1, 1, 1, 1,
0.6093872, -0.6477142, 1.679174, 1, 1, 1, 1, 1,
0.6099846, -0.2942597, 1.184415, 1, 1, 1, 1, 1,
0.6195371, -0.2378187, 2.471928, 1, 1, 1, 1, 1,
0.620388, 1.432129, -0.164726, 1, 1, 1, 1, 1,
0.6244612, -0.8493388, 2.770672, 1, 1, 1, 1, 1,
0.6276888, 1.695349, -0.04653142, 0, 0, 1, 1, 1,
0.6278831, 1.5753, 0.5119769, 1, 0, 0, 1, 1,
0.6284988, -0.6591912, 1.057076, 1, 0, 0, 1, 1,
0.6336019, -1.848204, 1.880851, 1, 0, 0, 1, 1,
0.6353523, 0.07049329, 0.898331, 1, 0, 0, 1, 1,
0.6403618, 1.727259, 0.2996219, 1, 0, 0, 1, 1,
0.6469594, 1.14823, -0.1642478, 0, 0, 0, 1, 1,
0.6531605, -1.039669, 2.756291, 0, 0, 0, 1, 1,
0.6588268, -0.479694, 3.327982, 0, 0, 0, 1, 1,
0.6607868, -0.1186773, 0.8680581, 0, 0, 0, 1, 1,
0.6619138, -1.293568, 1.456286, 0, 0, 0, 1, 1,
0.6637304, -0.7993743, 3.417412, 0, 0, 0, 1, 1,
0.6662044, 0.2974019, 0.418184, 0, 0, 0, 1, 1,
0.6734211, -0.9798499, 1.742928, 1, 1, 1, 1, 1,
0.6757131, 0.3859668, 0.52906, 1, 1, 1, 1, 1,
0.6761662, -1.166088, 2.698445, 1, 1, 1, 1, 1,
0.6778679, 2.088919, 0.8866132, 1, 1, 1, 1, 1,
0.6810326, -0.1448948, 2.942569, 1, 1, 1, 1, 1,
0.6811246, -0.7469401, 2.248886, 1, 1, 1, 1, 1,
0.6883341, -0.1363546, 2.675577, 1, 1, 1, 1, 1,
0.6914704, -1.549079, 3.543987, 1, 1, 1, 1, 1,
0.6926451, -1.830754, 3.237823, 1, 1, 1, 1, 1,
0.6957548, -0.5171823, 1.956623, 1, 1, 1, 1, 1,
0.6978198, -0.5316417, 1.385068, 1, 1, 1, 1, 1,
0.6990868, -1.274106, 1.868484, 1, 1, 1, 1, 1,
0.7019299, -1.690692, 2.683424, 1, 1, 1, 1, 1,
0.7080246, -1.012683, 1.541772, 1, 1, 1, 1, 1,
0.709234, -0.2728557, 3.565174, 1, 1, 1, 1, 1,
0.7181426, 0.8028051, 0.769986, 0, 0, 1, 1, 1,
0.7193081, 0.03524207, 0.9599344, 1, 0, 0, 1, 1,
0.7229802, -0.1527399, 2.719469, 1, 0, 0, 1, 1,
0.727344, 0.8007758, 1.122072, 1, 0, 0, 1, 1,
0.7318161, 1.197608, 1.081609, 1, 0, 0, 1, 1,
0.7318743, -0.2620623, 3.842821, 1, 0, 0, 1, 1,
0.7345863, 0.1368247, 1.613024, 0, 0, 0, 1, 1,
0.7404049, 1.389164, 0.5636728, 0, 0, 0, 1, 1,
0.7468963, -0.206957, 2.858548, 0, 0, 0, 1, 1,
0.7485734, -0.4900228, 1.806277, 0, 0, 0, 1, 1,
0.7515867, -0.6635556, 2.41877, 0, 0, 0, 1, 1,
0.7524897, -0.2109974, 1.855956, 0, 0, 0, 1, 1,
0.7540534, 0.4989801, -0.6329325, 0, 0, 0, 1, 1,
0.7579291, -1.504854, 3.230428, 1, 1, 1, 1, 1,
0.7610255, -1.858578, 3.433621, 1, 1, 1, 1, 1,
0.761101, 0.08463493, 1.494658, 1, 1, 1, 1, 1,
0.7671192, 0.4489127, -0.211091, 1, 1, 1, 1, 1,
0.7702178, -0.6074998, 1.520372, 1, 1, 1, 1, 1,
0.7751749, 1.138778, 0.8722093, 1, 1, 1, 1, 1,
0.7767749, 0.2577564, 1.260068, 1, 1, 1, 1, 1,
0.7770734, 1.361549, 1.055188, 1, 1, 1, 1, 1,
0.7794399, 0.7660392, 2.032097, 1, 1, 1, 1, 1,
0.7826657, 0.1656736, 2.510714, 1, 1, 1, 1, 1,
0.7863308, -0.8762003, 2.366311, 1, 1, 1, 1, 1,
0.7867763, 2.202757, 1.55077, 1, 1, 1, 1, 1,
0.7935228, 0.3023453, 1.308589, 1, 1, 1, 1, 1,
0.7991501, 0.2322562, 0.1854159, 1, 1, 1, 1, 1,
0.8019421, 0.6884028, 0.6163879, 1, 1, 1, 1, 1,
0.8029681, 0.6673713, 2.389423, 0, 0, 1, 1, 1,
0.8051069, -1.547018, 4.35405, 1, 0, 0, 1, 1,
0.8060215, 0.3842517, 0.592145, 1, 0, 0, 1, 1,
0.8112484, 1.426696, 0.9802766, 1, 0, 0, 1, 1,
0.8139457, -0.4638543, 2.118887, 1, 0, 0, 1, 1,
0.8173648, 0.1009932, 1.840162, 1, 0, 0, 1, 1,
0.8270494, 0.6404469, 1.116337, 0, 0, 0, 1, 1,
0.8284605, -0.1097301, 1.028554, 0, 0, 0, 1, 1,
0.8382522, -0.4307846, 1.393348, 0, 0, 0, 1, 1,
0.8389722, -0.5384416, 1.361808, 0, 0, 0, 1, 1,
0.8461155, 0.5475073, 0.1922868, 0, 0, 0, 1, 1,
0.8464366, 0.3223363, 1.490718, 0, 0, 0, 1, 1,
0.8566374, -0.02793185, 0.7720153, 0, 0, 0, 1, 1,
0.8585016, -0.4745498, 1.246972, 1, 1, 1, 1, 1,
0.8640565, -0.1715278, 1.92168, 1, 1, 1, 1, 1,
0.8659131, 1.060608, 1.960965, 1, 1, 1, 1, 1,
0.8722894, -2.225122, 3.542951, 1, 1, 1, 1, 1,
0.8877289, -1.187873, 1.938805, 1, 1, 1, 1, 1,
0.8925104, 0.6157061, 1.313442, 1, 1, 1, 1, 1,
0.8940427, 0.1623167, 2.324146, 1, 1, 1, 1, 1,
0.8941051, -1.698412, 2.286467, 1, 1, 1, 1, 1,
0.8964992, 0.5121451, 2.638001, 1, 1, 1, 1, 1,
0.9000208, 0.1079054, 0.4439645, 1, 1, 1, 1, 1,
0.900232, -0.3328152, 2.016117, 1, 1, 1, 1, 1,
0.9003075, -0.7180297, 2.42427, 1, 1, 1, 1, 1,
0.9018343, -0.522391, 1.483786, 1, 1, 1, 1, 1,
0.9080108, 1.07624, 0.4681487, 1, 1, 1, 1, 1,
0.9128106, -0.5559611, 3.032742, 1, 1, 1, 1, 1,
0.9128855, 0.1565941, 2.256393, 0, 0, 1, 1, 1,
0.9140659, -0.8045776, 1.563017, 1, 0, 0, 1, 1,
0.9142726, -0.6088357, 0.9068111, 1, 0, 0, 1, 1,
0.9151404, -0.203508, 2.07445, 1, 0, 0, 1, 1,
0.9181122, -0.8818031, 2.238239, 1, 0, 0, 1, 1,
0.9230618, -0.7986815, 2.553762, 1, 0, 0, 1, 1,
0.9239838, -0.02161613, 4.369918, 0, 0, 0, 1, 1,
0.928272, 0.407396, 2.275882, 0, 0, 0, 1, 1,
0.9306213, 0.8040344, -0.04112147, 0, 0, 0, 1, 1,
0.9368575, 1.978949, 0.5896794, 0, 0, 0, 1, 1,
0.9483314, 0.02609587, -0.1601761, 0, 0, 0, 1, 1,
0.9523962, 1.15029, 0.09425916, 0, 0, 0, 1, 1,
0.9533371, -0.9356948, -0.0418469, 0, 0, 0, 1, 1,
0.9540612, 0.3984662, 1.472011, 1, 1, 1, 1, 1,
0.9574922, 0.9216461, 1.189228, 1, 1, 1, 1, 1,
0.9614955, -1.0025, 2.114915, 1, 1, 1, 1, 1,
0.9642312, -1.463026, 1.324614, 1, 1, 1, 1, 1,
0.9666894, -1.694339, 5.88763, 1, 1, 1, 1, 1,
0.967754, 0.1772414, 2.180218, 1, 1, 1, 1, 1,
0.9752333, -2.251329, 1.709145, 1, 1, 1, 1, 1,
0.9760634, -0.3947547, 1.907953, 1, 1, 1, 1, 1,
0.9777039, 0.3368199, -0.4016942, 1, 1, 1, 1, 1,
0.9911517, -1.117877, 2.117584, 1, 1, 1, 1, 1,
0.9913458, 0.1535546, 1.110247, 1, 1, 1, 1, 1,
1.010539, 0.6838549, 0.2343581, 1, 1, 1, 1, 1,
1.011506, -0.06876329, 1.40094, 1, 1, 1, 1, 1,
1.034972, 1.621957, -1.438059, 1, 1, 1, 1, 1,
1.044518, -0.5017932, 2.918299, 1, 1, 1, 1, 1,
1.049633, -0.378018, 2.059725, 0, 0, 1, 1, 1,
1.052101, -1.363081, 3.094893, 1, 0, 0, 1, 1,
1.058894, 1.157562, 1.373672, 1, 0, 0, 1, 1,
1.063551, 1.232977, -1.142439, 1, 0, 0, 1, 1,
1.0659, 0.01955305, 2.551435, 1, 0, 0, 1, 1,
1.072215, 0.4053483, 1.461431, 1, 0, 0, 1, 1,
1.072675, 0.3249548, 1.269165, 0, 0, 0, 1, 1,
1.07496, 0.1154041, 1.737283, 0, 0, 0, 1, 1,
1.078702, -0.3048525, 1.922998, 0, 0, 0, 1, 1,
1.081443, -0.3666747, 3.164232, 0, 0, 0, 1, 1,
1.08854, 0.07210664, 1.29477, 0, 0, 0, 1, 1,
1.08909, -1.423101, 2.067103, 0, 0, 0, 1, 1,
1.097451, -0.1185813, 1.783204, 0, 0, 0, 1, 1,
1.114903, -0.1779367, -0.03561476, 1, 1, 1, 1, 1,
1.123279, 3.201502, -0.2213606, 1, 1, 1, 1, 1,
1.124183, 0.9783088, -1.035609, 1, 1, 1, 1, 1,
1.127519, 0.03474143, 0.2598251, 1, 1, 1, 1, 1,
1.132743, 0.39736, 0.1752304, 1, 1, 1, 1, 1,
1.135404, 1.137449, 1.739805, 1, 1, 1, 1, 1,
1.137507, -0.02874647, 1.229513, 1, 1, 1, 1, 1,
1.140307, -0.8644137, 3.380847, 1, 1, 1, 1, 1,
1.142777, 0.1669407, 2.63844, 1, 1, 1, 1, 1,
1.154376, 1.62618, 1.367271, 1, 1, 1, 1, 1,
1.161944, 0.6640609, 0.387384, 1, 1, 1, 1, 1,
1.163546, -0.586633, 1.333891, 1, 1, 1, 1, 1,
1.166032, 0.2426138, 2.323929, 1, 1, 1, 1, 1,
1.177271, -0.2696878, -0.1533836, 1, 1, 1, 1, 1,
1.185057, -2.316338, 1.967478, 1, 1, 1, 1, 1,
1.18869, -1.904027, 2.432186, 0, 0, 1, 1, 1,
1.190842, 1.271529, 0.2168397, 1, 0, 0, 1, 1,
1.192611, 0.9915935, 2.276528, 1, 0, 0, 1, 1,
1.192654, 0.4741875, 1.024796, 1, 0, 0, 1, 1,
1.192658, -0.8243777, 4.031639, 1, 0, 0, 1, 1,
1.201567, 0.163445, 1.278295, 1, 0, 0, 1, 1,
1.20202, 0.2167248, 1.725694, 0, 0, 0, 1, 1,
1.202391, 1.101721, 0.8618371, 0, 0, 0, 1, 1,
1.211532, 0.2081554, 2.756327, 0, 0, 0, 1, 1,
1.212863, 0.2438031, -0.3641096, 0, 0, 0, 1, 1,
1.220795, -0.9717225, 0.315866, 0, 0, 0, 1, 1,
1.22518, -2.106053, 1.701319, 0, 0, 0, 1, 1,
1.226241, 0.8508935, -0.5875414, 0, 0, 0, 1, 1,
1.234897, -0.5078986, 4.483419, 1, 1, 1, 1, 1,
1.245154, -0.748947, 1.49813, 1, 1, 1, 1, 1,
1.248212, -0.1093201, 0.3821143, 1, 1, 1, 1, 1,
1.263888, 1.178738, 0.1578351, 1, 1, 1, 1, 1,
1.276157, 0.3917115, 0.9510679, 1, 1, 1, 1, 1,
1.282626, 1.553939, -0.2722797, 1, 1, 1, 1, 1,
1.286582, 0.03828496, 2.867165, 1, 1, 1, 1, 1,
1.296327, -1.147962, 2.627739, 1, 1, 1, 1, 1,
1.303376, -1.208658, 2.278446, 1, 1, 1, 1, 1,
1.315744, -1.794374, 1.484944, 1, 1, 1, 1, 1,
1.322081, 1.549126, 1.633024, 1, 1, 1, 1, 1,
1.323114, 0.6391774, 0.1185887, 1, 1, 1, 1, 1,
1.337197, -0.3354754, 0.6463307, 1, 1, 1, 1, 1,
1.340071, 3.016185, 0.5297701, 1, 1, 1, 1, 1,
1.340655, -0.5295729, 2.244739, 1, 1, 1, 1, 1,
1.34189, 0.429869, 3.754615, 0, 0, 1, 1, 1,
1.342082, -0.3917449, 2.244467, 1, 0, 0, 1, 1,
1.352365, -1.304032, 2.923398, 1, 0, 0, 1, 1,
1.358553, 0.7612048, 0.5277105, 1, 0, 0, 1, 1,
1.361601, -1.448297, 1.087603, 1, 0, 0, 1, 1,
1.365675, -0.8352894, 2.705603, 1, 0, 0, 1, 1,
1.367556, -1.008238, 3.281992, 0, 0, 0, 1, 1,
1.369308, 1.013577, -0.1931079, 0, 0, 0, 1, 1,
1.378344, 0.6109671, 1.09979, 0, 0, 0, 1, 1,
1.379683, -1.930414, 2.651612, 0, 0, 0, 1, 1,
1.385266, -0.2064365, 2.115818, 0, 0, 0, 1, 1,
1.39232, -0.2142155, 2.564123, 0, 0, 0, 1, 1,
1.404576, 0.0003510763, 2.411602, 0, 0, 0, 1, 1,
1.416096, 1.39033, -1.346617, 1, 1, 1, 1, 1,
1.429348, 0.3318177, 1.370525, 1, 1, 1, 1, 1,
1.430429, 1.929086, 0.1401365, 1, 1, 1, 1, 1,
1.443383, 0.07868333, 2.101586, 1, 1, 1, 1, 1,
1.447057, 1.938472, 2.930631, 1, 1, 1, 1, 1,
1.451192, -0.03444598, 1.672505, 1, 1, 1, 1, 1,
1.470726, 0.8988157, 1.269567, 1, 1, 1, 1, 1,
1.475514, 1.197128, 1.82263, 1, 1, 1, 1, 1,
1.481666, -0.03310961, 3.427829, 1, 1, 1, 1, 1,
1.483485, -0.03676069, 2.890575, 1, 1, 1, 1, 1,
1.484412, -0.1043933, 0.1046954, 1, 1, 1, 1, 1,
1.501279, 0.1935433, 1.223913, 1, 1, 1, 1, 1,
1.515671, 0.5440342, -1.450212, 1, 1, 1, 1, 1,
1.519562, 0.9561065, 1.369686, 1, 1, 1, 1, 1,
1.53546, 0.1716354, 1.710291, 1, 1, 1, 1, 1,
1.538623, -1.174345, 1.800839, 0, 0, 1, 1, 1,
1.543453, -0.934926, 2.343882, 1, 0, 0, 1, 1,
1.544881, 0.2723739, 0.2811738, 1, 0, 0, 1, 1,
1.547257, 0.4866007, 1.479901, 1, 0, 0, 1, 1,
1.547551, 0.256188, 0.7066169, 1, 0, 0, 1, 1,
1.560475, 0.5569465, 2.288911, 1, 0, 0, 1, 1,
1.567049, -0.5056953, 1.283582, 0, 0, 0, 1, 1,
1.567684, 1.098233, 1.978395, 0, 0, 0, 1, 1,
1.568316, -1.550841, 3.693983, 0, 0, 0, 1, 1,
1.57316, 0.7972115, 0.2139135, 0, 0, 0, 1, 1,
1.591578, -0.3708693, 1.128611, 0, 0, 0, 1, 1,
1.614896, -0.4734282, 2.03583, 0, 0, 0, 1, 1,
1.617975, -0.3381692, 1.926509, 0, 0, 0, 1, 1,
1.630741, -0.6010557, 1.082988, 1, 1, 1, 1, 1,
1.63822, -0.4838693, 1.535865, 1, 1, 1, 1, 1,
1.662655, 1.674433, 2.31338, 1, 1, 1, 1, 1,
1.674198, -0.6378247, 2.480419, 1, 1, 1, 1, 1,
1.685867, -1.469973, 2.551078, 1, 1, 1, 1, 1,
1.690235, 1.422963, -0.2875719, 1, 1, 1, 1, 1,
1.706595, -0.8395739, 2.529497, 1, 1, 1, 1, 1,
1.716796, -0.1444467, 1.81998, 1, 1, 1, 1, 1,
1.741629, -1.156196, 1.098755, 1, 1, 1, 1, 1,
1.751468, -0.8877828, 2.59776, 1, 1, 1, 1, 1,
1.753306, -1.500458, 2.758271, 1, 1, 1, 1, 1,
1.759925, 0.988488, 0.5664213, 1, 1, 1, 1, 1,
1.768574, -0.808423, 1.986022, 1, 1, 1, 1, 1,
1.786468, -1.184306, 1.995766, 1, 1, 1, 1, 1,
1.792454, -0.2040348, 1.391274, 1, 1, 1, 1, 1,
1.813999, -0.9440238, 1.489761, 0, 0, 1, 1, 1,
1.82373, 0.0850978, 1.512388, 1, 0, 0, 1, 1,
1.835116, -2.420155, 3.294463, 1, 0, 0, 1, 1,
1.84387, -0.3251808, 1.9288, 1, 0, 0, 1, 1,
1.845187, -1.456973, 1.108917, 1, 0, 0, 1, 1,
1.873652, -0.711305, 1.651472, 1, 0, 0, 1, 1,
1.883827, 0.4691752, 1.034589, 0, 0, 0, 1, 1,
1.891491, -0.804615, 3.883278, 0, 0, 0, 1, 1,
1.891905, 0.06862463, 2.067047, 0, 0, 0, 1, 1,
1.898012, 0.09927581, 2.426275, 0, 0, 0, 1, 1,
1.905648, 1.415062, 0.3966073, 0, 0, 0, 1, 1,
1.909476, -0.1671474, 1.611737, 0, 0, 0, 1, 1,
1.911146, -0.78957, 0.3441854, 0, 0, 0, 1, 1,
1.95547, 0.3862581, 1.781932, 1, 1, 1, 1, 1,
1.972382, 0.09139314, 2.257976, 1, 1, 1, 1, 1,
1.980504, -0.911047, -0.2675077, 1, 1, 1, 1, 1,
2.000583, 0.5229647, 1.555613, 1, 1, 1, 1, 1,
2.039064, -1.25433, 3.24633, 1, 1, 1, 1, 1,
2.044119, 0.2754066, 2.663012, 1, 1, 1, 1, 1,
2.051943, -0.6028164, 0.5343103, 1, 1, 1, 1, 1,
2.057357, 0.08357678, 1.819184, 1, 1, 1, 1, 1,
2.058682, -1.35019, 1.960285, 1, 1, 1, 1, 1,
2.098596, -1.585042, 1.955832, 1, 1, 1, 1, 1,
2.110719, -0.9809313, 1.870726, 1, 1, 1, 1, 1,
2.116718, 0.271201, 0.04573351, 1, 1, 1, 1, 1,
2.150334, 1.450039, 0.04105632, 1, 1, 1, 1, 1,
2.175453, 0.5574527, 0.6046532, 1, 1, 1, 1, 1,
2.194519, -2.191978, 2.473761, 1, 1, 1, 1, 1,
2.266534, 0.2904727, -1.230967, 0, 0, 1, 1, 1,
2.288846, 1.361982, -0.4005834, 1, 0, 0, 1, 1,
2.301445, -1.188138, 0.6939093, 1, 0, 0, 1, 1,
2.311802, 0.1407807, 1.515561, 1, 0, 0, 1, 1,
2.321593, 0.2670678, 1.98464, 1, 0, 0, 1, 1,
2.336795, -0.6742871, 1.066347, 1, 0, 0, 1, 1,
2.340282, 0.9787644, 1.139087, 0, 0, 0, 1, 1,
2.38808, -0.4651179, 0.5338413, 0, 0, 0, 1, 1,
2.443154, 0.8753345, 0.6880016, 0, 0, 0, 1, 1,
2.44925, 1.328205, 0.8707696, 0, 0, 0, 1, 1,
2.452287, -0.3831246, 1.489514, 0, 0, 0, 1, 1,
2.485334, 0.2404193, 2.689442, 0, 0, 0, 1, 1,
2.657444, 0.664793, 1.062185, 0, 0, 0, 1, 1,
2.706021, 1.213675, 1.217392, 1, 1, 1, 1, 1,
2.707198, 0.2533818, 1.126661, 1, 1, 1, 1, 1,
2.817747, -0.2524941, 0.8313695, 1, 1, 1, 1, 1,
2.877402, 0.4580265, 1.289028, 1, 1, 1, 1, 1,
3.122339, 0.158277, 1.973669, 1, 1, 1, 1, 1,
3.2093, -0.3058694, 1.715667, 1, 1, 1, 1, 1,
3.234967, -1.364879, 1.320312, 1, 1, 1, 1, 1
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
var radius = 9.940141;
var distance = 34.91433;
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
mvMatrix.translate( 0.2075224, -0.3522965, -0.3462007 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.91433);
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
