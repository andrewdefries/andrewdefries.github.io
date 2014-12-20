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
-2.702074, 1.280556, -1.345647, 1, 0, 0, 1,
-2.671649, 0.722168, -0.05631216, 1, 0.007843138, 0, 1,
-2.613481, 0.7688612, -1.309271, 1, 0.01176471, 0, 1,
-2.604337, 1.072265, -1.554332, 1, 0.01960784, 0, 1,
-2.591107, 0.7587901, -2.125758, 1, 0.02352941, 0, 1,
-2.535219, 0.1210122, -1.316612, 1, 0.03137255, 0, 1,
-2.532516, 0.001910125, -0.569101, 1, 0.03529412, 0, 1,
-2.454013, -0.9532817, -0.9174981, 1, 0.04313726, 0, 1,
-2.430396, -0.6254956, -0.8932243, 1, 0.04705882, 0, 1,
-2.364906, -0.8024684, -1.227773, 1, 0.05490196, 0, 1,
-2.29427, -0.9588277, -1.550287, 1, 0.05882353, 0, 1,
-2.260363, 0.5810286, 0.8359625, 1, 0.06666667, 0, 1,
-2.243734, 1.155491, -0.6246185, 1, 0.07058824, 0, 1,
-2.222805, -1.581998, -2.113624, 1, 0.07843138, 0, 1,
-2.210972, 0.3661982, -1.722273, 1, 0.08235294, 0, 1,
-2.117575, 1.365712, 0.5168012, 1, 0.09019608, 0, 1,
-2.110393, 0.4636847, -3.331419, 1, 0.09411765, 0, 1,
-2.060994, -0.6147887, -1.418671, 1, 0.1019608, 0, 1,
-2.052629, -0.6431049, -2.716812, 1, 0.1098039, 0, 1,
-2.048776, 0.4016114, -0.0923861, 1, 0.1137255, 0, 1,
-1.967699, -0.3278793, 0.8282831, 1, 0.1215686, 0, 1,
-1.954996, 0.2709375, -3.112139, 1, 0.1254902, 0, 1,
-1.944818, -0.4526657, -1.586432, 1, 0.1333333, 0, 1,
-1.925344, 0.1822999, -1.370628, 1, 0.1372549, 0, 1,
-1.918933, 1.299963, -1.658993, 1, 0.145098, 0, 1,
-1.91508, 0.8475781, -1.073317, 1, 0.1490196, 0, 1,
-1.903053, 1.08938, -1.326579, 1, 0.1568628, 0, 1,
-1.900529, 0.8710378, -0.7793355, 1, 0.1607843, 0, 1,
-1.883397, 1.093432, 1.14467, 1, 0.1686275, 0, 1,
-1.879793, -1.428285, -0.3957003, 1, 0.172549, 0, 1,
-1.861825, 0.7709138, -0.5693588, 1, 0.1803922, 0, 1,
-1.857096, -2.385468, -0.7386309, 1, 0.1843137, 0, 1,
-1.854462, 0.1304027, -2.690154, 1, 0.1921569, 0, 1,
-1.852493, -1.701743, -2.448788, 1, 0.1960784, 0, 1,
-1.824183, 0.007454833, -0.9098339, 1, 0.2039216, 0, 1,
-1.767207, -0.8345661, -2.234231, 1, 0.2117647, 0, 1,
-1.762154, 1.50875, -0.8417839, 1, 0.2156863, 0, 1,
-1.753856, 0.7329965, -0.3608156, 1, 0.2235294, 0, 1,
-1.744202, -0.3927535, -2.788865, 1, 0.227451, 0, 1,
-1.725246, -0.1758486, -1.021844, 1, 0.2352941, 0, 1,
-1.701495, 0.2471791, -1.542742, 1, 0.2392157, 0, 1,
-1.687943, -2.620451, -3.947296, 1, 0.2470588, 0, 1,
-1.676993, -0.4715817, -1.155589, 1, 0.2509804, 0, 1,
-1.672118, -0.3947439, -1.705382, 1, 0.2588235, 0, 1,
-1.641609, 0.1073773, -0.4881188, 1, 0.2627451, 0, 1,
-1.632424, -0.4556475, -0.1216368, 1, 0.2705882, 0, 1,
-1.627928, -0.8213859, -2.064741, 1, 0.2745098, 0, 1,
-1.627453, 0.6821494, -0.9712763, 1, 0.282353, 0, 1,
-1.626677, -0.3187171, -0.8659331, 1, 0.2862745, 0, 1,
-1.626228, 0.06090847, -2.014406, 1, 0.2941177, 0, 1,
-1.625627, 0.557166, -0.8548938, 1, 0.3019608, 0, 1,
-1.623905, 1.380903, -1.558885, 1, 0.3058824, 0, 1,
-1.622878, -1.827906, -4.063107, 1, 0.3137255, 0, 1,
-1.619701, 1.399883, -0.7891319, 1, 0.3176471, 0, 1,
-1.617481, -0.9199846, -2.89853, 1, 0.3254902, 0, 1,
-1.610203, -0.08064019, -1.566726, 1, 0.3294118, 0, 1,
-1.606901, -0.1743986, -3.96476, 1, 0.3372549, 0, 1,
-1.599888, 1.595546, -0.7545555, 1, 0.3411765, 0, 1,
-1.596066, -1.032036, -4.460857, 1, 0.3490196, 0, 1,
-1.59161, 0.4948016, -1.858207, 1, 0.3529412, 0, 1,
-1.590766, -1.055197, -2.098328, 1, 0.3607843, 0, 1,
-1.573246, -1.780617, -2.769908, 1, 0.3647059, 0, 1,
-1.560312, 2.095857, -1.40441, 1, 0.372549, 0, 1,
-1.556594, 0.5401114, -2.027039, 1, 0.3764706, 0, 1,
-1.551718, 0.5277109, -1.038619, 1, 0.3843137, 0, 1,
-1.543382, 0.2063458, -2.754754, 1, 0.3882353, 0, 1,
-1.533755, -0.4944915, -1.826621, 1, 0.3960784, 0, 1,
-1.532445, -1.274087, -3.948837, 1, 0.4039216, 0, 1,
-1.52656, 0.2544487, -1.646113, 1, 0.4078431, 0, 1,
-1.510843, -2.490077, -3.573166, 1, 0.4156863, 0, 1,
-1.492593, -1.315134, -2.017635, 1, 0.4196078, 0, 1,
-1.486972, 0.5908598, -0.6996021, 1, 0.427451, 0, 1,
-1.47813, -0.04593685, -0.8584974, 1, 0.4313726, 0, 1,
-1.475018, 0.3391157, -2.180251, 1, 0.4392157, 0, 1,
-1.471571, -1.659188, -2.6085, 1, 0.4431373, 0, 1,
-1.439566, -0.0389799, -1.37519, 1, 0.4509804, 0, 1,
-1.434412, -0.6679801, -2.486758, 1, 0.454902, 0, 1,
-1.415302, 0.4654565, -1.42338, 1, 0.4627451, 0, 1,
-1.412775, -2.876144, -2.881091, 1, 0.4666667, 0, 1,
-1.40809, 0.3522735, -1.792393, 1, 0.4745098, 0, 1,
-1.395419, -0.3687897, -2.328611, 1, 0.4784314, 0, 1,
-1.382395, -1.606256, -2.625031, 1, 0.4862745, 0, 1,
-1.376479, 1.465649, 0.3831628, 1, 0.4901961, 0, 1,
-1.370773, 0.6380466, -0.8043587, 1, 0.4980392, 0, 1,
-1.367106, -0.4695903, -2.228675, 1, 0.5058824, 0, 1,
-1.353455, -0.8332147, -3.373812, 1, 0.509804, 0, 1,
-1.353205, 1.274956, -0.2232568, 1, 0.5176471, 0, 1,
-1.342491, -0.4455463, -2.157804, 1, 0.5215687, 0, 1,
-1.336721, 0.7796928, -0.7663882, 1, 0.5294118, 0, 1,
-1.335992, -0.4111789, -1.610372, 1, 0.5333334, 0, 1,
-1.319562, 1.951988, -1.191891, 1, 0.5411765, 0, 1,
-1.318061, -1.683824, -2.667457, 1, 0.5450981, 0, 1,
-1.316365, -0.24194, -2.400947, 1, 0.5529412, 0, 1,
-1.312614, -1.490261, -1.759169, 1, 0.5568628, 0, 1,
-1.302469, -1.914331, -2.297662, 1, 0.5647059, 0, 1,
-1.29716, -1.438983, -1.485916, 1, 0.5686275, 0, 1,
-1.293913, 2.370281, 0.3133972, 1, 0.5764706, 0, 1,
-1.293308, -1.433771, -1.170387, 1, 0.5803922, 0, 1,
-1.282447, 1.396699, -1.778172, 1, 0.5882353, 0, 1,
-1.280558, 0.2643296, -2.488966, 1, 0.5921569, 0, 1,
-1.279616, -0.1725947, -0.725982, 1, 0.6, 0, 1,
-1.269566, 0.6703652, -0.01958416, 1, 0.6078432, 0, 1,
-1.254969, 0.4130324, 0.8936222, 1, 0.6117647, 0, 1,
-1.246061, 1.359271, 0.2263013, 1, 0.6196079, 0, 1,
-1.231969, 0.3316672, -2.283824, 1, 0.6235294, 0, 1,
-1.222193, -0.1178811, -2.03006, 1, 0.6313726, 0, 1,
-1.220561, -0.2055857, -0.55318, 1, 0.6352941, 0, 1,
-1.213016, 0.398291, -0.4701827, 1, 0.6431373, 0, 1,
-1.205664, 1.191856, 0.2750339, 1, 0.6470588, 0, 1,
-1.202366, 0.8247877, -0.8525203, 1, 0.654902, 0, 1,
-1.188833, 0.07685258, -0.7759754, 1, 0.6588235, 0, 1,
-1.187242, -0.0164301, -1.917118, 1, 0.6666667, 0, 1,
-1.181711, -0.5363593, -1.507726, 1, 0.6705883, 0, 1,
-1.167202, 0.06609441, -1.587877, 1, 0.6784314, 0, 1,
-1.157627, 0.5865976, -0.6031711, 1, 0.682353, 0, 1,
-1.156287, -0.440722, -2.03721, 1, 0.6901961, 0, 1,
-1.150849, -0.8587372, 0.2467333, 1, 0.6941177, 0, 1,
-1.149669, -0.6740834, -0.9343413, 1, 0.7019608, 0, 1,
-1.142317, 0.3084076, -1.105843, 1, 0.7098039, 0, 1,
-1.134314, -1.084071, -2.289924, 1, 0.7137255, 0, 1,
-1.131133, 0.2738121, -3.124972, 1, 0.7215686, 0, 1,
-1.121678, 1.132131, 0.3982496, 1, 0.7254902, 0, 1,
-1.112532, -0.4036354, -3.510175, 1, 0.7333333, 0, 1,
-1.111257, -0.7301206, -4.637456, 1, 0.7372549, 0, 1,
-1.108408, -1.363435, -1.883468, 1, 0.7450981, 0, 1,
-1.107376, -1.611065, -1.382386, 1, 0.7490196, 0, 1,
-1.09623, 1.440099, -1.247909, 1, 0.7568628, 0, 1,
-1.09603, 1.909588, 0.7998505, 1, 0.7607843, 0, 1,
-1.091121, -0.7731725, -2.702446, 1, 0.7686275, 0, 1,
-1.088838, 0.4377815, -1.272896, 1, 0.772549, 0, 1,
-1.083069, 0.4382353, -2.795971, 1, 0.7803922, 0, 1,
-1.082926, 1.309504, -0.465304, 1, 0.7843137, 0, 1,
-1.082503, 1.174225, 0.3119395, 1, 0.7921569, 0, 1,
-1.070899, 0.4814973, -1.067304, 1, 0.7960784, 0, 1,
-1.070569, 0.94132, -1.221654, 1, 0.8039216, 0, 1,
-1.069935, -0.4309056, -1.065408, 1, 0.8117647, 0, 1,
-1.065188, -0.2307084, -3.532818, 1, 0.8156863, 0, 1,
-1.063251, -1.077783, -2.888648, 1, 0.8235294, 0, 1,
-1.060961, -0.02283119, -1.448738, 1, 0.827451, 0, 1,
-1.04942, 0.04998857, -0.2072203, 1, 0.8352941, 0, 1,
-1.041656, 0.5503559, -2.472603, 1, 0.8392157, 0, 1,
-1.037102, 0.1908659, -1.186808, 1, 0.8470588, 0, 1,
-1.030848, -1.56225, -1.757272, 1, 0.8509804, 0, 1,
-1.026077, -1.699702, -1.552138, 1, 0.8588235, 0, 1,
-1.023775, 0.09033098, -0.0533402, 1, 0.8627451, 0, 1,
-1.01324, -0.3079676, -1.427967, 1, 0.8705882, 0, 1,
-1.00299, -0.5501156, -1.583704, 1, 0.8745098, 0, 1,
-0.9950583, -0.9431883, -2.440159, 1, 0.8823529, 0, 1,
-0.992586, 0.9851167, -1.488962, 1, 0.8862745, 0, 1,
-0.979757, -0.1677587, -2.915891, 1, 0.8941177, 0, 1,
-0.9720084, -0.304602, -3.762624, 1, 0.8980392, 0, 1,
-0.9711549, -1.062188, -4.258845, 1, 0.9058824, 0, 1,
-0.9616568, 1.833914, -1.146537, 1, 0.9137255, 0, 1,
-0.9547369, -0.9091861, -2.976117, 1, 0.9176471, 0, 1,
-0.9527893, 0.09831133, -2.625318, 1, 0.9254902, 0, 1,
-0.951454, 0.05726573, -1.136063, 1, 0.9294118, 0, 1,
-0.9514368, 0.3273734, -2.995056, 1, 0.9372549, 0, 1,
-0.950995, -0.389954, -2.733399, 1, 0.9411765, 0, 1,
-0.9380625, 0.437195, -0.1920475, 1, 0.9490196, 0, 1,
-0.9379718, -0.9083896, -2.389647, 1, 0.9529412, 0, 1,
-0.9219615, -0.654474, -0.6900291, 1, 0.9607843, 0, 1,
-0.9157587, -0.9657025, -1.197156, 1, 0.9647059, 0, 1,
-0.9110289, -0.2109711, -1.24027, 1, 0.972549, 0, 1,
-0.9078855, -0.905387, -1.904198, 1, 0.9764706, 0, 1,
-0.899121, 0.3337773, 0.008377481, 1, 0.9843137, 0, 1,
-0.8969544, 2.747876, -0.4337825, 1, 0.9882353, 0, 1,
-0.8929639, -1.312372, -4.059796, 1, 0.9960784, 0, 1,
-0.8928376, 0.582921, 0.7831678, 0.9960784, 1, 0, 1,
-0.891404, 0.7788943, -1.597231, 0.9921569, 1, 0, 1,
-0.8890989, -1.888182, -3.358605, 0.9843137, 1, 0, 1,
-0.8861173, -1.106588, -2.086316, 0.9803922, 1, 0, 1,
-0.8855035, 1.246912, -0.5715847, 0.972549, 1, 0, 1,
-0.8836821, -0.5927114, -1.411269, 0.9686275, 1, 0, 1,
-0.8780872, -0.2597189, -1.782958, 0.9607843, 1, 0, 1,
-0.8753688, 1.260166, -0.5299641, 0.9568627, 1, 0, 1,
-0.8736, 0.04047079, -1.584725, 0.9490196, 1, 0, 1,
-0.8646799, 0.3188166, 0.2026659, 0.945098, 1, 0, 1,
-0.8572322, 1.383497, -0.1649773, 0.9372549, 1, 0, 1,
-0.8539991, 1.551643, -2.54784, 0.9333333, 1, 0, 1,
-0.8534827, 0.3609533, -1.48179, 0.9254902, 1, 0, 1,
-0.85005, -2.29653, -3.363842, 0.9215686, 1, 0, 1,
-0.8445821, 0.2398054, -0.9931728, 0.9137255, 1, 0, 1,
-0.836815, -0.3097408, -1.68487, 0.9098039, 1, 0, 1,
-0.8204551, -1.138816, -2.238227, 0.9019608, 1, 0, 1,
-0.8157343, -0.3875088, -2.028433, 0.8941177, 1, 0, 1,
-0.8150665, 0.5892098, -0.3965055, 0.8901961, 1, 0, 1,
-0.8131507, -1.785523, -4.06502, 0.8823529, 1, 0, 1,
-0.8116781, 0.5846608, 0.8337594, 0.8784314, 1, 0, 1,
-0.8087932, -0.02717405, -0.9024888, 0.8705882, 1, 0, 1,
-0.8060802, -1.79367, -2.802089, 0.8666667, 1, 0, 1,
-0.803803, -0.1466663, -1.551333, 0.8588235, 1, 0, 1,
-0.8016917, 0.1810935, 0.4409477, 0.854902, 1, 0, 1,
-0.789731, 0.485676, -1.870192, 0.8470588, 1, 0, 1,
-0.7883594, -0.2493522, 0.5747812, 0.8431373, 1, 0, 1,
-0.7830966, -1.059732, -4.589983, 0.8352941, 1, 0, 1,
-0.774814, -1.47792, -3.705424, 0.8313726, 1, 0, 1,
-0.7724185, 1.171687, 1.224392, 0.8235294, 1, 0, 1,
-0.7705166, 0.8676102, 0.1801437, 0.8196079, 1, 0, 1,
-0.7670555, 0.1882023, -0.8964058, 0.8117647, 1, 0, 1,
-0.7663153, -0.4470762, -1.620644, 0.8078431, 1, 0, 1,
-0.7659963, -0.5934367, -2.29417, 0.8, 1, 0, 1,
-0.7655298, -1.261895, -2.931982, 0.7921569, 1, 0, 1,
-0.7646877, 1.093754, 0.3002355, 0.7882353, 1, 0, 1,
-0.7611839, -2.44296, -1.964661, 0.7803922, 1, 0, 1,
-0.758605, -0.318302, -0.4895237, 0.7764706, 1, 0, 1,
-0.7480782, 0.2703302, 0.2803037, 0.7686275, 1, 0, 1,
-0.7477617, 0.3442208, -2.525178, 0.7647059, 1, 0, 1,
-0.7476937, 0.1934048, -1.54286, 0.7568628, 1, 0, 1,
-0.7468362, 0.7284319, -1.685625, 0.7529412, 1, 0, 1,
-0.7443196, 0.03787371, -0.3969721, 0.7450981, 1, 0, 1,
-0.7413297, 0.8788375, -0.170957, 0.7411765, 1, 0, 1,
-0.7386112, 0.5184734, -1.726655, 0.7333333, 1, 0, 1,
-0.7381431, -1.243283, -5.037162, 0.7294118, 1, 0, 1,
-0.7310767, -0.4588542, -2.016196, 0.7215686, 1, 0, 1,
-0.7289854, -0.6403392, -1.643898, 0.7176471, 1, 0, 1,
-0.7262473, 0.2885642, -0.6411066, 0.7098039, 1, 0, 1,
-0.7260239, -1.518517, -3.935209, 0.7058824, 1, 0, 1,
-0.7211679, -0.3782786, -1.263489, 0.6980392, 1, 0, 1,
-0.7190657, -0.2639, -1.504258, 0.6901961, 1, 0, 1,
-0.7174809, -1.076414, -3.467036, 0.6862745, 1, 0, 1,
-0.7137908, -1.162466, -3.389184, 0.6784314, 1, 0, 1,
-0.7081274, 0.04101432, -2.183361, 0.6745098, 1, 0, 1,
-0.7055289, 0.7565054, -1.272971, 0.6666667, 1, 0, 1,
-0.70259, 0.2759289, -1.393337, 0.6627451, 1, 0, 1,
-0.7016768, -1.638008, -1.777355, 0.654902, 1, 0, 1,
-0.6980953, 0.3862464, 0.06610513, 0.6509804, 1, 0, 1,
-0.6971346, 0.6905408, -0.7688075, 0.6431373, 1, 0, 1,
-0.6928111, 0.5686651, -2.238406, 0.6392157, 1, 0, 1,
-0.6924294, 0.3902937, -0.4520859, 0.6313726, 1, 0, 1,
-0.6921785, 0.5945821, -0.07858676, 0.627451, 1, 0, 1,
-0.6904261, 0.1751799, -1.96873, 0.6196079, 1, 0, 1,
-0.6887049, 0.3816251, 0.1070336, 0.6156863, 1, 0, 1,
-0.682251, -1.153112, -6.222156, 0.6078432, 1, 0, 1,
-0.6784936, -1.131402, -0.9673384, 0.6039216, 1, 0, 1,
-0.6772848, 0.824305, -0.2900198, 0.5960785, 1, 0, 1,
-0.6759531, 0.7681271, -0.7508552, 0.5882353, 1, 0, 1,
-0.671985, -1.12919, -1.861034, 0.5843138, 1, 0, 1,
-0.670531, -0.4011082, -2.872286, 0.5764706, 1, 0, 1,
-0.6662715, -1.234123, -2.544415, 0.572549, 1, 0, 1,
-0.6625965, -0.2913315, -3.346622, 0.5647059, 1, 0, 1,
-0.6610949, -1.756414, -3.67201, 0.5607843, 1, 0, 1,
-0.6598446, 1.704327, -1.514173, 0.5529412, 1, 0, 1,
-0.6549243, -0.2399582, -2.102999, 0.5490196, 1, 0, 1,
-0.6421506, 0.09695041, -1.311862, 0.5411765, 1, 0, 1,
-0.6376891, -0.7359344, -1.749288, 0.5372549, 1, 0, 1,
-0.6375301, 0.5574393, -1.739364, 0.5294118, 1, 0, 1,
-0.6367745, -0.6361896, -2.232563, 0.5254902, 1, 0, 1,
-0.6366346, -0.550832, -2.757205, 0.5176471, 1, 0, 1,
-0.6364114, -0.3627967, -1.871678, 0.5137255, 1, 0, 1,
-0.6310026, 0.5710792, -0.7309409, 0.5058824, 1, 0, 1,
-0.6208926, 0.2291196, -1.268874, 0.5019608, 1, 0, 1,
-0.6175271, 0.1833274, -2.754176, 0.4941176, 1, 0, 1,
-0.6146867, -0.3274271, -1.684567, 0.4862745, 1, 0, 1,
-0.6142781, -1.251335, -1.975313, 0.4823529, 1, 0, 1,
-0.6126084, -1.438646, -2.085567, 0.4745098, 1, 0, 1,
-0.6064074, -1.247678, -2.304735, 0.4705882, 1, 0, 1,
-0.6032563, -1.426191, -3.024474, 0.4627451, 1, 0, 1,
-0.6029541, 0.3338696, 0.08340554, 0.4588235, 1, 0, 1,
-0.6027833, -0.7876925, -3.877192, 0.4509804, 1, 0, 1,
-0.6009535, -0.2047372, -3.601644, 0.4470588, 1, 0, 1,
-0.599616, -0.1166282, -0.1274562, 0.4392157, 1, 0, 1,
-0.5987533, 0.02286262, 0.3190579, 0.4352941, 1, 0, 1,
-0.5974901, -1.818778, -0.9355969, 0.427451, 1, 0, 1,
-0.5914778, 1.09104, -1.326875, 0.4235294, 1, 0, 1,
-0.5901399, -0.47883, -4.175028, 0.4156863, 1, 0, 1,
-0.5890839, 0.7169998, -0.2098296, 0.4117647, 1, 0, 1,
-0.5858264, -0.5861256, -2.655018, 0.4039216, 1, 0, 1,
-0.584174, -0.1523547, -3.492989, 0.3960784, 1, 0, 1,
-0.5817218, -0.1114361, -1.313892, 0.3921569, 1, 0, 1,
-0.5810645, 1.650154, 2.144176, 0.3843137, 1, 0, 1,
-0.5801572, -0.9048555, -3.634299, 0.3803922, 1, 0, 1,
-0.5797996, -1.026949, -3.638745, 0.372549, 1, 0, 1,
-0.5785406, 0.7654731, 0.007861199, 0.3686275, 1, 0, 1,
-0.5785156, -0.4555938, -2.060197, 0.3607843, 1, 0, 1,
-0.5772321, 0.3206774, -1.619207, 0.3568628, 1, 0, 1,
-0.5770167, -1.38845, -3.130169, 0.3490196, 1, 0, 1,
-0.5739989, 0.1221685, -0.6752426, 0.345098, 1, 0, 1,
-0.5705876, -1.022069, -1.186316, 0.3372549, 1, 0, 1,
-0.5689065, 0.377477, -1.500315, 0.3333333, 1, 0, 1,
-0.5678758, 0.4405555, -1.526206, 0.3254902, 1, 0, 1,
-0.5647858, -1.446372, -1.954823, 0.3215686, 1, 0, 1,
-0.5595413, -0.4435044, -3.759168, 0.3137255, 1, 0, 1,
-0.5576696, 0.5400406, 1.106463, 0.3098039, 1, 0, 1,
-0.5556655, -0.4219967, -1.644099, 0.3019608, 1, 0, 1,
-0.5547124, -0.6393093, -2.147977, 0.2941177, 1, 0, 1,
-0.5509313, -0.4444006, -1.317351, 0.2901961, 1, 0, 1,
-0.5447876, -1.014489, -2.607188, 0.282353, 1, 0, 1,
-0.5397676, 0.459428, -1.469134, 0.2784314, 1, 0, 1,
-0.5368018, 1.471604, 0.06176468, 0.2705882, 1, 0, 1,
-0.5366955, -1.02341, -3.82882, 0.2666667, 1, 0, 1,
-0.5346808, -1.499713, -3.804733, 0.2588235, 1, 0, 1,
-0.5310165, -0.4841813, -1.110252, 0.254902, 1, 0, 1,
-0.5307559, -0.3944823, -3.99471, 0.2470588, 1, 0, 1,
-0.5304534, 0.1502551, -2.063481, 0.2431373, 1, 0, 1,
-0.5294119, 0.3616381, -0.1880455, 0.2352941, 1, 0, 1,
-0.5236985, -0.6656812, -2.687311, 0.2313726, 1, 0, 1,
-0.5216064, -0.2742637, 0.1930111, 0.2235294, 1, 0, 1,
-0.5171595, 0.6639262, -2.994952, 0.2196078, 1, 0, 1,
-0.5160424, -0.5671551, -1.69738, 0.2117647, 1, 0, 1,
-0.5155292, 0.2741776, -1.537974, 0.2078431, 1, 0, 1,
-0.5152109, 1.408629, -0.3044026, 0.2, 1, 0, 1,
-0.5060639, 0.4194246, 0.1177584, 0.1921569, 1, 0, 1,
-0.5018312, -0.2897952, -4.343078, 0.1882353, 1, 0, 1,
-0.4971041, 0.4161905, -0.8479938, 0.1803922, 1, 0, 1,
-0.4961675, -0.7939683, -3.064617, 0.1764706, 1, 0, 1,
-0.4938125, -0.4478755, -2.290303, 0.1686275, 1, 0, 1,
-0.4925795, -2.253278, -3.288227, 0.1647059, 1, 0, 1,
-0.4917249, 1.076641, -0.3749841, 0.1568628, 1, 0, 1,
-0.4893529, 0.1559937, -1.714872, 0.1529412, 1, 0, 1,
-0.4853154, -1.353055, -3.796182, 0.145098, 1, 0, 1,
-0.4845536, 1.811942, -2.028997, 0.1411765, 1, 0, 1,
-0.4822606, 0.3378039, -1.81438, 0.1333333, 1, 0, 1,
-0.4774349, -0.3862691, -3.611366, 0.1294118, 1, 0, 1,
-0.4750529, 0.08551049, -2.168675, 0.1215686, 1, 0, 1,
-0.4724687, 1.395512, -1.258498, 0.1176471, 1, 0, 1,
-0.4716052, -0.1407978, -3.026516, 0.1098039, 1, 0, 1,
-0.4687304, -0.5517735, -2.173218, 0.1058824, 1, 0, 1,
-0.4643015, -0.03832956, -1.780415, 0.09803922, 1, 0, 1,
-0.4594395, -0.1070194, -0.954183, 0.09019608, 1, 0, 1,
-0.458177, 1.957594, 1.317568, 0.08627451, 1, 0, 1,
-0.4467433, 1.688437, -1.255345, 0.07843138, 1, 0, 1,
-0.4443452, 1.574626, -0.7915301, 0.07450981, 1, 0, 1,
-0.4382223, 0.4798622, -0.1941328, 0.06666667, 1, 0, 1,
-0.4355485, -0.5406027, -0.9664623, 0.0627451, 1, 0, 1,
-0.4259322, -0.2974583, -2.200846, 0.05490196, 1, 0, 1,
-0.4225217, 0.9026369, 0.1327571, 0.05098039, 1, 0, 1,
-0.4193665, -1.946755, -2.794699, 0.04313726, 1, 0, 1,
-0.4175305, 0.4157742, -2.316201, 0.03921569, 1, 0, 1,
-0.4147445, -0.269999, -3.930484, 0.03137255, 1, 0, 1,
-0.4142646, 1.621437, -1.156534, 0.02745098, 1, 0, 1,
-0.4128112, 0.4923423, -0.1113722, 0.01960784, 1, 0, 1,
-0.4095851, -0.5889232, -2.938272, 0.01568628, 1, 0, 1,
-0.4065228, 0.9171835, -2.288179, 0.007843138, 1, 0, 1,
-0.4049515, -0.2331305, -3.628352, 0.003921569, 1, 0, 1,
-0.4022126, 1.694364, 0.2927134, 0, 1, 0.003921569, 1,
-0.4016208, 0.7325143, -0.8759894, 0, 1, 0.01176471, 1,
-0.4001423, -1.423441, -3.571893, 0, 1, 0.01568628, 1,
-0.3984731, -0.6765121, -1.781795, 0, 1, 0.02352941, 1,
-0.3977384, 0.1988322, -1.269814, 0, 1, 0.02745098, 1,
-0.3968313, 0.6046692, -1.22491, 0, 1, 0.03529412, 1,
-0.3920468, 0.366864, -1.656068, 0, 1, 0.03921569, 1,
-0.3917508, -0.2033174, -3.670781, 0, 1, 0.04705882, 1,
-0.3913434, -1.639544, -3.959501, 0, 1, 0.05098039, 1,
-0.3787175, -1.226195, -1.133423, 0, 1, 0.05882353, 1,
-0.3738619, -1.039126, -2.828593, 0, 1, 0.0627451, 1,
-0.3725913, -0.6661391, -1.193069, 0, 1, 0.07058824, 1,
-0.3657844, 1.17016, -0.8566127, 0, 1, 0.07450981, 1,
-0.3649665, 0.727114, -1.406983, 0, 1, 0.08235294, 1,
-0.3637292, -2.269612, -2.048455, 0, 1, 0.08627451, 1,
-0.3624454, 1.597466, -0.2850406, 0, 1, 0.09411765, 1,
-0.3588617, -0.1017833, -1.896678, 0, 1, 0.1019608, 1,
-0.3555519, -1.338372, -2.798951, 0, 1, 0.1058824, 1,
-0.3514103, 1.071064, 0.5547605, 0, 1, 0.1137255, 1,
-0.3508991, 1.054077, -0.390299, 0, 1, 0.1176471, 1,
-0.3504349, -1.05993, -2.801651, 0, 1, 0.1254902, 1,
-0.3453776, 0.1338094, -1.058237, 0, 1, 0.1294118, 1,
-0.3385274, -0.8269264, -2.397261, 0, 1, 0.1372549, 1,
-0.3313465, -1.416346, -3.253558, 0, 1, 0.1411765, 1,
-0.3310381, 0.9268439, -1.198778, 0, 1, 0.1490196, 1,
-0.3307703, -1.667802, -3.755747, 0, 1, 0.1529412, 1,
-0.3288615, 0.7856311, -0.08680885, 0, 1, 0.1607843, 1,
-0.3288195, -0.767321, -2.966222, 0, 1, 0.1647059, 1,
-0.3278422, -0.6793637, -1.247065, 0, 1, 0.172549, 1,
-0.3252707, -0.988726, -0.7550909, 0, 1, 0.1764706, 1,
-0.3231706, -1.347835, -3.23131, 0, 1, 0.1843137, 1,
-0.3231189, 1.340324, 1.13948, 0, 1, 0.1882353, 1,
-0.3230996, -0.4391627, -0.6642369, 0, 1, 0.1960784, 1,
-0.3200924, -1.415055, -3.051853, 0, 1, 0.2039216, 1,
-0.3112375, 1.494297, 0.2919434, 0, 1, 0.2078431, 1,
-0.3091284, -0.4350188, -2.421475, 0, 1, 0.2156863, 1,
-0.3073544, -0.4240558, -2.518907, 0, 1, 0.2196078, 1,
-0.3069902, -0.4578536, -3.838137, 0, 1, 0.227451, 1,
-0.304903, -0.144218, -1.217457, 0, 1, 0.2313726, 1,
-0.30192, 0.3790832, 0.01555299, 0, 1, 0.2392157, 1,
-0.2964114, 0.4513741, 0.7447222, 0, 1, 0.2431373, 1,
-0.2962309, -0.7621946, -3.623179, 0, 1, 0.2509804, 1,
-0.2958341, 1.011316, -0.05871996, 0, 1, 0.254902, 1,
-0.2915876, -0.8921106, -4.036376, 0, 1, 0.2627451, 1,
-0.2878814, -1.647897, -2.15935, 0, 1, 0.2666667, 1,
-0.2839057, -1.014128, -2.676995, 0, 1, 0.2745098, 1,
-0.2829828, 0.3492224, -2.006301, 0, 1, 0.2784314, 1,
-0.2823447, 1.190122, -1.954834, 0, 1, 0.2862745, 1,
-0.2801101, 0.7821979, 1.172858, 0, 1, 0.2901961, 1,
-0.2751797, -0.3806342, -0.3680675, 0, 1, 0.2980392, 1,
-0.2745299, -1.475766, -3.053273, 0, 1, 0.3058824, 1,
-0.2700765, 0.253732, -0.3289708, 0, 1, 0.3098039, 1,
-0.2679242, 0.2980391, -1.722655, 0, 1, 0.3176471, 1,
-0.2659077, 0.3744679, -1.563298, 0, 1, 0.3215686, 1,
-0.2608267, -0.3321398, -1.053493, 0, 1, 0.3294118, 1,
-0.2595344, 1.195487, -1.091276, 0, 1, 0.3333333, 1,
-0.2585735, -0.4189635, -1.16441, 0, 1, 0.3411765, 1,
-0.249457, 1.438742, 1.960471, 0, 1, 0.345098, 1,
-0.2493572, 1.530869, -0.5721216, 0, 1, 0.3529412, 1,
-0.2462777, -0.163067, -1.560085, 0, 1, 0.3568628, 1,
-0.2427494, -0.8471966, -2.763316, 0, 1, 0.3647059, 1,
-0.2287395, 0.1806546, -1.408542, 0, 1, 0.3686275, 1,
-0.2287265, -0.9159135, -4.62412, 0, 1, 0.3764706, 1,
-0.2270147, -0.3649964, -1.007707, 0, 1, 0.3803922, 1,
-0.2251792, -1.435148, -3.711492, 0, 1, 0.3882353, 1,
-0.2236287, 0.5025633, -0.2011238, 0, 1, 0.3921569, 1,
-0.2217724, 0.4874626, 0.3681111, 0, 1, 0.4, 1,
-0.2216029, -0.8029646, -2.003405, 0, 1, 0.4078431, 1,
-0.2183537, -1.256073, -2.742023, 0, 1, 0.4117647, 1,
-0.217121, -0.6645842, -3.675805, 0, 1, 0.4196078, 1,
-0.2116701, 0.8530704, 0.5288155, 0, 1, 0.4235294, 1,
-0.2104644, 0.2439542, 0.4459252, 0, 1, 0.4313726, 1,
-0.2061742, 0.8888239, 0.5121641, 0, 1, 0.4352941, 1,
-0.2057754, 1.302791, -1.635866, 0, 1, 0.4431373, 1,
-0.2027095, 1.231193, 0.8556294, 0, 1, 0.4470588, 1,
-0.2004737, -0.4811375, -2.592262, 0, 1, 0.454902, 1,
-0.1988186, -1.226666, -3.657081, 0, 1, 0.4588235, 1,
-0.1964865, 0.7655663, -0.8612836, 0, 1, 0.4666667, 1,
-0.1950262, -0.1455649, -3.726628, 0, 1, 0.4705882, 1,
-0.1915141, -0.8309717, -3.542081, 0, 1, 0.4784314, 1,
-0.1898464, 1.61764, -0.7380466, 0, 1, 0.4823529, 1,
-0.1888229, -0.672856, -5.302457, 0, 1, 0.4901961, 1,
-0.1888156, 0.3685011, 0.500874, 0, 1, 0.4941176, 1,
-0.1887057, 0.6034229, 0.3159115, 0, 1, 0.5019608, 1,
-0.1846509, -0.3678032, -1.405931, 0, 1, 0.509804, 1,
-0.1833846, 1.823577, -0.0072699, 0, 1, 0.5137255, 1,
-0.1801434, -0.3105351, -2.444863, 0, 1, 0.5215687, 1,
-0.1800365, 0.1340153, -0.644316, 0, 1, 0.5254902, 1,
-0.1784141, 0.7662064, 1.084932, 0, 1, 0.5333334, 1,
-0.1772948, -0.6690995, -2.985906, 0, 1, 0.5372549, 1,
-0.1712542, -1.133095, -4.469775, 0, 1, 0.5450981, 1,
-0.1690931, -0.8411418, -2.723924, 0, 1, 0.5490196, 1,
-0.1685441, -0.4777872, -4.05307, 0, 1, 0.5568628, 1,
-0.1673432, 1.068239, 0.4053626, 0, 1, 0.5607843, 1,
-0.1653576, 1.93832, 0.348933, 0, 1, 0.5686275, 1,
-0.161835, 0.9130946, -0.05790763, 0, 1, 0.572549, 1,
-0.1578695, 0.1851058, 1.293907, 0, 1, 0.5803922, 1,
-0.1566765, 0.7528811, -2.038036, 0, 1, 0.5843138, 1,
-0.1526876, 0.4681385, -0.9310609, 0, 1, 0.5921569, 1,
-0.1512029, -1.510123, -1.92645, 0, 1, 0.5960785, 1,
-0.1502908, -0.8842896, -2.589002, 0, 1, 0.6039216, 1,
-0.1497449, -0.6276249, -4.225191, 0, 1, 0.6117647, 1,
-0.1485812, -0.5678701, -3.502088, 0, 1, 0.6156863, 1,
-0.1477354, -2.021204, -2.452033, 0, 1, 0.6235294, 1,
-0.1475389, -0.8448772, -2.817154, 0, 1, 0.627451, 1,
-0.1461098, 0.3720702, -0.7014766, 0, 1, 0.6352941, 1,
-0.1417513, 0.3003655, -0.4251814, 0, 1, 0.6392157, 1,
-0.1411017, 1.370573, 0.3887647, 0, 1, 0.6470588, 1,
-0.1349323, 0.3345701, 0.1002399, 0, 1, 0.6509804, 1,
-0.134905, 0.2830513, -0.1285213, 0, 1, 0.6588235, 1,
-0.1348079, -0.8911445, -1.164595, 0, 1, 0.6627451, 1,
-0.133899, 0.5589153, 0.1219798, 0, 1, 0.6705883, 1,
-0.1335346, 0.3606051, -0.698698, 0, 1, 0.6745098, 1,
-0.1297026, -0.1457994, -3.050661, 0, 1, 0.682353, 1,
-0.1280076, -2.614799, -2.680137, 0, 1, 0.6862745, 1,
-0.1277717, -0.4491986, -3.281632, 0, 1, 0.6941177, 1,
-0.1268565, -1.61551, -3.061731, 0, 1, 0.7019608, 1,
-0.1240278, -0.5062514, -2.366593, 0, 1, 0.7058824, 1,
-0.1179978, 1.263091, -0.1690904, 0, 1, 0.7137255, 1,
-0.1179277, 2.374795, 0.3925779, 0, 1, 0.7176471, 1,
-0.1144351, -0.1359265, -4.062407, 0, 1, 0.7254902, 1,
-0.1124181, 1.069496, -0.1939804, 0, 1, 0.7294118, 1,
-0.1104976, 0.7171438, 0.52507, 0, 1, 0.7372549, 1,
-0.1089484, 0.769251, 0.1312982, 0, 1, 0.7411765, 1,
-0.09961978, -1.092876, -4.742276, 0, 1, 0.7490196, 1,
-0.09857409, 0.5356285, -0.463814, 0, 1, 0.7529412, 1,
-0.0944361, -0.5564141, -2.35484, 0, 1, 0.7607843, 1,
-0.09333605, -0.0997548, -2.165234, 0, 1, 0.7647059, 1,
-0.09000947, 0.2185072, -0.7934334, 0, 1, 0.772549, 1,
-0.08859622, -0.9865026, -3.068338, 0, 1, 0.7764706, 1,
-0.08763354, 1.74436, 0.2461379, 0, 1, 0.7843137, 1,
-0.07193647, 0.1648922, -0.9311686, 0, 1, 0.7882353, 1,
-0.05961083, -1.353798, -2.627863, 0, 1, 0.7960784, 1,
-0.05836489, 0.6655203, 0.2910368, 0, 1, 0.8039216, 1,
-0.05619074, 0.4767039, -0.91133, 0, 1, 0.8078431, 1,
-0.05509635, 0.795741, -1.107827, 0, 1, 0.8156863, 1,
-0.05398785, 1.729437, -0.6361508, 0, 1, 0.8196079, 1,
-0.05241768, 0.4958666, 0.2638448, 0, 1, 0.827451, 1,
-0.05193008, 0.5698829, -2.627115, 0, 1, 0.8313726, 1,
-0.05143778, 1.418193, -0.03890904, 0, 1, 0.8392157, 1,
-0.04757282, -0.8016763, -2.541701, 0, 1, 0.8431373, 1,
-0.04716877, -0.6811221, -3.012842, 0, 1, 0.8509804, 1,
-0.04350149, -1.198077, -4.05543, 0, 1, 0.854902, 1,
-0.04300372, -0.2696922, -2.448385, 0, 1, 0.8627451, 1,
-0.03909282, -0.5374838, -2.997276, 0, 1, 0.8666667, 1,
-0.0342356, 0.9772026, -1.096539, 0, 1, 0.8745098, 1,
-0.03309114, -0.1069533, -1.944008, 0, 1, 0.8784314, 1,
-0.03089228, -0.9745401, -3.215858, 0, 1, 0.8862745, 1,
-0.02966067, 0.1179018, -0.6182424, 0, 1, 0.8901961, 1,
-0.02928298, -0.8139387, -3.9719, 0, 1, 0.8980392, 1,
-0.0230392, -0.7590199, -1.92278, 0, 1, 0.9058824, 1,
-0.02243599, 0.37426, -1.847913, 0, 1, 0.9098039, 1,
-0.02068901, 0.3203594, 0.8720444, 0, 1, 0.9176471, 1,
-0.019958, -0.5585248, -2.93369, 0, 1, 0.9215686, 1,
-0.01921757, 1.689234, -1.100362, 0, 1, 0.9294118, 1,
-0.01746717, -0.398075, -4.4105, 0, 1, 0.9333333, 1,
-0.01438203, 0.4603429, -0.5400962, 0, 1, 0.9411765, 1,
-0.01098194, 0.08495184, -0.2226735, 0, 1, 0.945098, 1,
-0.009603457, -1.170609, -2.772745, 0, 1, 0.9529412, 1,
-0.008980159, -1.626432, -1.875011, 0, 1, 0.9568627, 1,
-0.007669184, 0.7473239, 0.6202406, 0, 1, 0.9647059, 1,
-0.006133601, -0.7847666, -1.345515, 0, 1, 0.9686275, 1,
-0.005274601, -0.2177557, -3.109584, 0, 1, 0.9764706, 1,
-0.002912569, 2.630233, -0.3902387, 0, 1, 0.9803922, 1,
-0.0003708741, -0.3836564, -1.436997, 0, 1, 0.9882353, 1,
4.088228e-05, 1.000076, 1.28791, 0, 1, 0.9921569, 1,
0.005416683, 2.271748, 2.540052, 0, 1, 1, 1,
0.005604878, -0.3071071, 2.205654, 0, 0.9921569, 1, 1,
0.006929177, -0.6762158, 3.616352, 0, 0.9882353, 1, 1,
0.007756232, 1.027209, -1.456301, 0, 0.9803922, 1, 1,
0.00825836, -1.613459, 1.699455, 0, 0.9764706, 1, 1,
0.01889641, 0.2617938, 0.06644442, 0, 0.9686275, 1, 1,
0.01901758, 0.5675036, 0.548565, 0, 0.9647059, 1, 1,
0.0205397, 0.3520289, 1.166932, 0, 0.9568627, 1, 1,
0.02124781, 0.7271675, -0.4295954, 0, 0.9529412, 1, 1,
0.02181001, 1.100715, -0.8928201, 0, 0.945098, 1, 1,
0.02417305, -2.078928, 0.910992, 0, 0.9411765, 1, 1,
0.02479791, -1.709573, 3.687405, 0, 0.9333333, 1, 1,
0.02586952, -0.4808153, 2.540238, 0, 0.9294118, 1, 1,
0.0264471, -2.208619, 3.607811, 0, 0.9215686, 1, 1,
0.03356477, -1.019335, 3.868704, 0, 0.9176471, 1, 1,
0.03410159, -0.6667604, 2.402871, 0, 0.9098039, 1, 1,
0.04109396, 0.05543896, 0.9995379, 0, 0.9058824, 1, 1,
0.04336699, 0.2232215, 0.3898087, 0, 0.8980392, 1, 1,
0.04356392, 0.9947434, -1.915955, 0, 0.8901961, 1, 1,
0.05096307, -0.09603505, 3.151741, 0, 0.8862745, 1, 1,
0.05161944, -1.811264, 4.396549, 0, 0.8784314, 1, 1,
0.05279964, -0.3298202, 1.780709, 0, 0.8745098, 1, 1,
0.06036707, 1.245335, 0.1180376, 0, 0.8666667, 1, 1,
0.06475589, 0.394591, 0.42555, 0, 0.8627451, 1, 1,
0.06726283, -0.4292403, 1.832006, 0, 0.854902, 1, 1,
0.06732702, 0.8411102, -0.5117255, 0, 0.8509804, 1, 1,
0.07004914, -0.3450836, 2.577088, 0, 0.8431373, 1, 1,
0.07065692, -0.5100292, 1.89639, 0, 0.8392157, 1, 1,
0.07628302, -0.7310804, 3.565905, 0, 0.8313726, 1, 1,
0.0779434, -0.3864125, 3.676101, 0, 0.827451, 1, 1,
0.07977651, 0.608482, 1.482962, 0, 0.8196079, 1, 1,
0.08049703, 0.7022648, -0.414449, 0, 0.8156863, 1, 1,
0.08192757, 1.303249, -1.252248, 0, 0.8078431, 1, 1,
0.08293287, -0.6336114, 3.297787, 0, 0.8039216, 1, 1,
0.08362749, -0.3058833, 2.471742, 0, 0.7960784, 1, 1,
0.08460641, 1.619553, 0.8088683, 0, 0.7882353, 1, 1,
0.09112176, -0.3643981, 2.52503, 0, 0.7843137, 1, 1,
0.09642296, 1.907844, -0.4091571, 0, 0.7764706, 1, 1,
0.09696735, 1.846822, 0.581941, 0, 0.772549, 1, 1,
0.1039909, 0.6611579, 0.9898273, 0, 0.7647059, 1, 1,
0.1065411, -0.9898035, 1.523592, 0, 0.7607843, 1, 1,
0.1067398, -0.2549919, 3.380524, 0, 0.7529412, 1, 1,
0.1085976, -0.4693639, 2.443247, 0, 0.7490196, 1, 1,
0.1098659, -1.795475, 2.539196, 0, 0.7411765, 1, 1,
0.11415, -0.3707986, 3.858996, 0, 0.7372549, 1, 1,
0.1150251, -1.016972, 1.787912, 0, 0.7294118, 1, 1,
0.1209104, 0.5153642, -0.8382078, 0, 0.7254902, 1, 1,
0.1213806, -2.229383, 1.328814, 0, 0.7176471, 1, 1,
0.12684, -0.1319833, 1.475597, 0, 0.7137255, 1, 1,
0.1278702, -1.288418, 2.196671, 0, 0.7058824, 1, 1,
0.1288748, -1.996135, 3.56748, 0, 0.6980392, 1, 1,
0.1320532, 1.870773, 0.9815643, 0, 0.6941177, 1, 1,
0.1362183, 0.5748836, 0.09229135, 0, 0.6862745, 1, 1,
0.1454112, 0.5433747, -0.9438685, 0, 0.682353, 1, 1,
0.1466317, -0.6433647, 2.126234, 0, 0.6745098, 1, 1,
0.1518206, -1.911306, 2.730539, 0, 0.6705883, 1, 1,
0.1521344, -1.573537, 2.919367, 0, 0.6627451, 1, 1,
0.1527753, 0.1223349, 0.2144459, 0, 0.6588235, 1, 1,
0.1559311, 0.4354368, 0.4455049, 0, 0.6509804, 1, 1,
0.1581086, 0.8024997, 1.133716, 0, 0.6470588, 1, 1,
0.1627499, -1.019309, 2.95612, 0, 0.6392157, 1, 1,
0.1640604, -0.4228411, 1.823072, 0, 0.6352941, 1, 1,
0.1643271, -0.1487342, 2.50473, 0, 0.627451, 1, 1,
0.1651316, -0.2382807, 1.772559, 0, 0.6235294, 1, 1,
0.1662154, -0.5679933, 1.507644, 0, 0.6156863, 1, 1,
0.169737, -0.0471636, 1.843275, 0, 0.6117647, 1, 1,
0.1697786, 0.2063816, 0.8374392, 0, 0.6039216, 1, 1,
0.1699275, 0.7773683, 1.81067, 0, 0.5960785, 1, 1,
0.1748516, 0.208882, 0.342162, 0, 0.5921569, 1, 1,
0.1761693, 0.5939041, 0.9013685, 0, 0.5843138, 1, 1,
0.1797861, 1.399406, 0.07916161, 0, 0.5803922, 1, 1,
0.1817221, 1.315501, 2.256749, 0, 0.572549, 1, 1,
0.1851321, -0.3358926, 3.484803, 0, 0.5686275, 1, 1,
0.1905088, -0.08386629, 2.204031, 0, 0.5607843, 1, 1,
0.1982931, -0.6462147, 3.916598, 0, 0.5568628, 1, 1,
0.2025884, 1.294651, 1.726184, 0, 0.5490196, 1, 1,
0.2050338, -1.904371, 1.560506, 0, 0.5450981, 1, 1,
0.2063012, -0.7128788, 2.5775, 0, 0.5372549, 1, 1,
0.2063753, 0.3176905, -0.3971213, 0, 0.5333334, 1, 1,
0.2078201, -0.3981723, 2.88321, 0, 0.5254902, 1, 1,
0.2155867, -0.06085882, 2.530439, 0, 0.5215687, 1, 1,
0.2180857, -0.1307764, 3.457416, 0, 0.5137255, 1, 1,
0.2240697, -0.9328817, 1.156952, 0, 0.509804, 1, 1,
0.2241762, -0.4739584, 2.536564, 0, 0.5019608, 1, 1,
0.2267224, -0.2435842, 2.284951, 0, 0.4941176, 1, 1,
0.2267874, 0.4310022, -0.9369123, 0, 0.4901961, 1, 1,
0.227978, -0.6171288, 2.939253, 0, 0.4823529, 1, 1,
0.23199, -0.679214, 2.337634, 0, 0.4784314, 1, 1,
0.2321959, 0.478382, -1.240177, 0, 0.4705882, 1, 1,
0.2359824, 1.115631, 1.185811, 0, 0.4666667, 1, 1,
0.2398306, 0.570184, 1.390723, 0, 0.4588235, 1, 1,
0.2407922, -0.216735, 3.785393, 0, 0.454902, 1, 1,
0.241894, 0.004972789, 1.215449, 0, 0.4470588, 1, 1,
0.2424797, 0.6278619, -0.399491, 0, 0.4431373, 1, 1,
0.2463613, -0.4009177, 3.592358, 0, 0.4352941, 1, 1,
0.2472292, -1.036981, 2.29133, 0, 0.4313726, 1, 1,
0.2478467, -0.7151298, 3.470902, 0, 0.4235294, 1, 1,
0.2512469, -0.4447196, 2.1186, 0, 0.4196078, 1, 1,
0.251581, 0.2772321, 1.512974, 0, 0.4117647, 1, 1,
0.2555051, -0.8126708, 3.324568, 0, 0.4078431, 1, 1,
0.2559849, 1.004791, -2.084143, 0, 0.4, 1, 1,
0.2559914, 0.01656449, 1.455515, 0, 0.3921569, 1, 1,
0.257386, -1.074301, 5.426361, 0, 0.3882353, 1, 1,
0.2590231, 0.6940951, 0.215453, 0, 0.3803922, 1, 1,
0.2593063, -0.2418212, 2.43682, 0, 0.3764706, 1, 1,
0.259961, -0.4410281, 2.135361, 0, 0.3686275, 1, 1,
0.2616126, -0.495695, 2.312006, 0, 0.3647059, 1, 1,
0.2639136, -1.005242, 2.489677, 0, 0.3568628, 1, 1,
0.2708719, -1.440763, 0.3708585, 0, 0.3529412, 1, 1,
0.2732607, -0.9103738, 3.865013, 0, 0.345098, 1, 1,
0.2763579, 1.57633, 1.327698, 0, 0.3411765, 1, 1,
0.2858442, -0.1394671, 2.693478, 0, 0.3333333, 1, 1,
0.2891171, -0.457506, 3.273086, 0, 0.3294118, 1, 1,
0.2928074, 1.601444, 0.7465404, 0, 0.3215686, 1, 1,
0.2935141, -2.042954, 3.247866, 0, 0.3176471, 1, 1,
0.2940463, -0.5285116, 1.803403, 0, 0.3098039, 1, 1,
0.2958531, -1.444348, 1.232353, 0, 0.3058824, 1, 1,
0.2962397, -1.155965, 3.344643, 0, 0.2980392, 1, 1,
0.2988411, 1.1387, -0.4100051, 0, 0.2901961, 1, 1,
0.3000045, -0.9611234, 4.528828, 0, 0.2862745, 1, 1,
0.3031138, 0.8775616, 1.087656, 0, 0.2784314, 1, 1,
0.3033828, 0.7024599, 0.6896872, 0, 0.2745098, 1, 1,
0.3066679, 0.2294004, 0.08380949, 0, 0.2666667, 1, 1,
0.3070607, -0.08450843, 1.420388, 0, 0.2627451, 1, 1,
0.3102872, 1.34229, 1.043608, 0, 0.254902, 1, 1,
0.3168336, 0.6577101, -0.2838696, 0, 0.2509804, 1, 1,
0.3172391, 0.9501036, 2.978898, 0, 0.2431373, 1, 1,
0.3245835, -0.1437954, 1.752942, 0, 0.2392157, 1, 1,
0.3250751, -1.015806, 1.873015, 0, 0.2313726, 1, 1,
0.332318, -1.134242, 2.474856, 0, 0.227451, 1, 1,
0.3357675, 0.2092812, -1.305636, 0, 0.2196078, 1, 1,
0.3415993, 0.533703, 0.7654337, 0, 0.2156863, 1, 1,
0.3417127, -0.259339, 2.948976, 0, 0.2078431, 1, 1,
0.3433694, -0.2636549, 2.23672, 0, 0.2039216, 1, 1,
0.3476716, 0.2212886, 2.485504, 0, 0.1960784, 1, 1,
0.3480309, -0.2505631, -0.4921034, 0, 0.1882353, 1, 1,
0.3483925, 0.8569322, -0.2963999, 0, 0.1843137, 1, 1,
0.3501299, -1.128269, 3.703083, 0, 0.1764706, 1, 1,
0.3534642, 0.4373867, -0.7111307, 0, 0.172549, 1, 1,
0.3542436, 0.1721872, 0.3436447, 0, 0.1647059, 1, 1,
0.3585011, 0.8818568, -0.6984237, 0, 0.1607843, 1, 1,
0.366074, -1.463718, 3.002543, 0, 0.1529412, 1, 1,
0.3671967, 0.4424847, 1.361505, 0, 0.1490196, 1, 1,
0.3673698, 0.7204506, -0.539088, 0, 0.1411765, 1, 1,
0.3690445, -0.3435188, 0.9901777, 0, 0.1372549, 1, 1,
0.370016, -1.466459, 1.288474, 0, 0.1294118, 1, 1,
0.3728788, -0.7138532, 3.741345, 0, 0.1254902, 1, 1,
0.3775888, -2.556205, 3.839739, 0, 0.1176471, 1, 1,
0.3797507, 0.2985136, 0.3879848, 0, 0.1137255, 1, 1,
0.3820783, 1.138714, 0.736232, 0, 0.1058824, 1, 1,
0.3837951, 0.3530869, 0.2945186, 0, 0.09803922, 1, 1,
0.3857064, 0.3802238, 0.3977964, 0, 0.09411765, 1, 1,
0.3864089, 0.185504, 1.46515, 0, 0.08627451, 1, 1,
0.3898261, -0.9367592, 3.387814, 0, 0.08235294, 1, 1,
0.3939466, 1.238224, 0.4699704, 0, 0.07450981, 1, 1,
0.3990377, -0.8340269, 2.636523, 0, 0.07058824, 1, 1,
0.401105, 1.078632, 2.152847, 0, 0.0627451, 1, 1,
0.410609, 1.013145, 0.6458606, 0, 0.05882353, 1, 1,
0.4120814, -0.8563855, 3.118929, 0, 0.05098039, 1, 1,
0.4185563, -0.9575503, 3.22351, 0, 0.04705882, 1, 1,
0.4232714, -2.389316, 3.013308, 0, 0.03921569, 1, 1,
0.424334, -0.5356284, 2.253634, 0, 0.03529412, 1, 1,
0.4263882, 0.9381083, -0.2092336, 0, 0.02745098, 1, 1,
0.4266432, 1.217761, -0.8731862, 0, 0.02352941, 1, 1,
0.4274772, -0.6313303, 1.70727, 0, 0.01568628, 1, 1,
0.4326958, 2.024624, -1.651684, 0, 0.01176471, 1, 1,
0.4351063, 1.559577, -0.07351058, 0, 0.003921569, 1, 1,
0.4377136, 0.7587992, 2.493886, 0.003921569, 0, 1, 1,
0.4386943, 1.957452, -0.4964626, 0.007843138, 0, 1, 1,
0.4404677, 0.2716427, 0.5719625, 0.01568628, 0, 1, 1,
0.445558, 1.673768, -0.6241387, 0.01960784, 0, 1, 1,
0.4479638, 0.0271478, 1.80969, 0.02745098, 0, 1, 1,
0.4489304, -0.5923773, 2.390756, 0.03137255, 0, 1, 1,
0.45709, -0.08953241, 0.9762971, 0.03921569, 0, 1, 1,
0.4614765, -0.8697264, 1.521904, 0.04313726, 0, 1, 1,
0.4639556, 0.8266034, 2.091272, 0.05098039, 0, 1, 1,
0.4691756, -0.6009145, 3.191609, 0.05490196, 0, 1, 1,
0.4743431, -0.2731465, 3.178315, 0.0627451, 0, 1, 1,
0.4775568, -0.3435728, 1.495621, 0.06666667, 0, 1, 1,
0.480197, -0.3665264, 1.688189, 0.07450981, 0, 1, 1,
0.4852331, -0.6438543, 2.85867, 0.07843138, 0, 1, 1,
0.4863629, -2.074128, 3.137268, 0.08627451, 0, 1, 1,
0.495151, -0.5278543, 2.831861, 0.09019608, 0, 1, 1,
0.4989578, 0.9557242, 1.444322, 0.09803922, 0, 1, 1,
0.5037002, -1.527314, 4.002486, 0.1058824, 0, 1, 1,
0.5057831, 1.219084, -0.1852826, 0.1098039, 0, 1, 1,
0.5080639, -0.6587217, 2.608238, 0.1176471, 0, 1, 1,
0.5101776, 0.7004449, 1.368608, 0.1215686, 0, 1, 1,
0.5152872, 0.3023835, -0.6971556, 0.1294118, 0, 1, 1,
0.5179113, -0.1027782, 1.542169, 0.1333333, 0, 1, 1,
0.5231453, -1.123981, 3.146644, 0.1411765, 0, 1, 1,
0.5237977, 1.655905, -0.1661854, 0.145098, 0, 1, 1,
0.5264779, 0.870082, 0.9583774, 0.1529412, 0, 1, 1,
0.5270376, 1.107553, 1.777793, 0.1568628, 0, 1, 1,
0.5280637, 0.6794643, 1.571274, 0.1647059, 0, 1, 1,
0.529604, -0.5422614, 2.406297, 0.1686275, 0, 1, 1,
0.5296291, 0.6814727, -0.1580366, 0.1764706, 0, 1, 1,
0.5362264, 0.7078986, -1.171565, 0.1803922, 0, 1, 1,
0.537478, 0.01694005, 2.109565, 0.1882353, 0, 1, 1,
0.5421172, 0.196917, 1.095978, 0.1921569, 0, 1, 1,
0.5457949, -0.1053954, 2.181286, 0.2, 0, 1, 1,
0.5508143, -0.4838073, 1.780756, 0.2078431, 0, 1, 1,
0.5526195, 0.6280693, 1.943246, 0.2117647, 0, 1, 1,
0.553215, 0.67853, -0.4432118, 0.2196078, 0, 1, 1,
0.5544163, -0.7736205, 1.434638, 0.2235294, 0, 1, 1,
0.5568458, -0.3463258, 2.409172, 0.2313726, 0, 1, 1,
0.564454, -1.651599, 2.694319, 0.2352941, 0, 1, 1,
0.5672341, 0.6340832, 0.7266906, 0.2431373, 0, 1, 1,
0.5721942, -0.6208887, 1.225343, 0.2470588, 0, 1, 1,
0.5753671, -0.2645952, 2.986356, 0.254902, 0, 1, 1,
0.5759324, -0.425015, 0.7045247, 0.2588235, 0, 1, 1,
0.586773, 0.1448419, 1.319527, 0.2666667, 0, 1, 1,
0.5868995, -0.1392236, 1.28544, 0.2705882, 0, 1, 1,
0.5911497, 1.22157, 0.6166815, 0.2784314, 0, 1, 1,
0.5923738, -2.307409, 5.499066, 0.282353, 0, 1, 1,
0.5973223, -0.07963528, 1.705259, 0.2901961, 0, 1, 1,
0.603255, 0.4416903, 1.085577, 0.2941177, 0, 1, 1,
0.6049425, 0.6720485, 0.7982689, 0.3019608, 0, 1, 1,
0.6056921, -0.8188713, 2.656538, 0.3098039, 0, 1, 1,
0.607068, 0.2245754, 1.357112, 0.3137255, 0, 1, 1,
0.6109015, -0.4172734, 2.561032, 0.3215686, 0, 1, 1,
0.6124553, 1.65911, -1.234189, 0.3254902, 0, 1, 1,
0.6161448, -0.2844698, 2.023996, 0.3333333, 0, 1, 1,
0.6180565, 0.3343597, 2.367513, 0.3372549, 0, 1, 1,
0.6188374, -1.495021, 1.599177, 0.345098, 0, 1, 1,
0.6230301, -0.8827689, 3.437382, 0.3490196, 0, 1, 1,
0.6247242, 0.2906176, 0.5917636, 0.3568628, 0, 1, 1,
0.6258159, 0.204868, -0.3446169, 0.3607843, 0, 1, 1,
0.6321727, 1.190385, 0.3174013, 0.3686275, 0, 1, 1,
0.6388454, -1.432562, 2.92456, 0.372549, 0, 1, 1,
0.6401891, -0.049281, 0.8351715, 0.3803922, 0, 1, 1,
0.6416036, -1.034746, 2.363914, 0.3843137, 0, 1, 1,
0.6549927, -0.1268845, 2.601491, 0.3921569, 0, 1, 1,
0.6557217, 0.6202874, 0.9240085, 0.3960784, 0, 1, 1,
0.6586757, -0.5636818, 2.387623, 0.4039216, 0, 1, 1,
0.6595159, -1.716159, 2.938586, 0.4117647, 0, 1, 1,
0.6603887, -0.1243883, 2.026411, 0.4156863, 0, 1, 1,
0.6686814, -1.050924, 2.696601, 0.4235294, 0, 1, 1,
0.669395, 0.518743, 1.424158, 0.427451, 0, 1, 1,
0.6699959, -0.7600698, 1.467361, 0.4352941, 0, 1, 1,
0.6721998, 0.007123453, 0.6182244, 0.4392157, 0, 1, 1,
0.6781992, -2.973622, 1.885693, 0.4470588, 0, 1, 1,
0.6855965, -0.04723923, 2.230796, 0.4509804, 0, 1, 1,
0.6857436, -0.6305439, 2.255371, 0.4588235, 0, 1, 1,
0.6952958, -1.124693, 2.290147, 0.4627451, 0, 1, 1,
0.7018061, 1.89071, -0.943822, 0.4705882, 0, 1, 1,
0.7024311, -0.07109552, 1.859482, 0.4745098, 0, 1, 1,
0.7033916, 0.5475994, 2.336655, 0.4823529, 0, 1, 1,
0.7074288, 2.100671, -0.6787273, 0.4862745, 0, 1, 1,
0.7075427, -0.01112682, 2.207072, 0.4941176, 0, 1, 1,
0.7078128, 1.272545, 0.7662163, 0.5019608, 0, 1, 1,
0.7088937, 2.652267, 0.3260444, 0.5058824, 0, 1, 1,
0.7107659, 2.072211, -0.9875371, 0.5137255, 0, 1, 1,
0.7139313, 1.499425, 0.937328, 0.5176471, 0, 1, 1,
0.7218365, 0.4277638, 1.979579, 0.5254902, 0, 1, 1,
0.7323204, -1.456287, 4.619955, 0.5294118, 0, 1, 1,
0.734543, 1.577322, 0.4599562, 0.5372549, 0, 1, 1,
0.7366032, -2.156096, 3.530837, 0.5411765, 0, 1, 1,
0.7392091, -1.948294, 2.548436, 0.5490196, 0, 1, 1,
0.7458059, 0.8754395, 0.9861438, 0.5529412, 0, 1, 1,
0.750393, -1.770362, 2.93042, 0.5607843, 0, 1, 1,
0.7520832, 0.8317438, -0.5627889, 0.5647059, 0, 1, 1,
0.7568315, -1.371088, 1.138215, 0.572549, 0, 1, 1,
0.7614895, 0.296919, 0.39906, 0.5764706, 0, 1, 1,
0.7656623, 2.63292, 2.409858, 0.5843138, 0, 1, 1,
0.7657225, 0.9897216, 1.912869, 0.5882353, 0, 1, 1,
0.7699037, -0.51075, 2.162963, 0.5960785, 0, 1, 1,
0.7711107, -0.8202769, 3.587398, 0.6039216, 0, 1, 1,
0.783533, 0.7583672, -0.3177678, 0.6078432, 0, 1, 1,
0.7839594, 0.2263817, 1.337988, 0.6156863, 0, 1, 1,
0.7869756, 0.196429, 2.423147, 0.6196079, 0, 1, 1,
0.7876749, 0.7251036, 1.527351, 0.627451, 0, 1, 1,
0.7888011, -0.6009596, 0.5552773, 0.6313726, 0, 1, 1,
0.7905431, -0.1977683, 2.716542, 0.6392157, 0, 1, 1,
0.7916462, 0.664327, 1.616409, 0.6431373, 0, 1, 1,
0.7926506, -1.655335, 3.653374, 0.6509804, 0, 1, 1,
0.8018391, 0.02249613, 3.824998, 0.654902, 0, 1, 1,
0.8041705, -1.248783, 1.922461, 0.6627451, 0, 1, 1,
0.8065041, 0.4132581, 0.9192709, 0.6666667, 0, 1, 1,
0.8086064, 0.06602864, 0.5076751, 0.6745098, 0, 1, 1,
0.8087736, 2.802581, -0.2819368, 0.6784314, 0, 1, 1,
0.8092114, -1.144082, 2.802375, 0.6862745, 0, 1, 1,
0.8127512, 1.237416, 0.4180716, 0.6901961, 0, 1, 1,
0.8143028, -0.3270738, 1.899412, 0.6980392, 0, 1, 1,
0.8163062, 0.1581279, -0.2339784, 0.7058824, 0, 1, 1,
0.8250879, -2.252189, 2.059998, 0.7098039, 0, 1, 1,
0.8309093, 0.9975639, 1.476368, 0.7176471, 0, 1, 1,
0.831209, 1.48879, 2.159082, 0.7215686, 0, 1, 1,
0.8321488, 0.3066982, 1.030292, 0.7294118, 0, 1, 1,
0.8336906, 1.027305, 1.324715, 0.7333333, 0, 1, 1,
0.8342334, -0.322006, 2.163976, 0.7411765, 0, 1, 1,
0.8367588, 0.07041946, 0.1638233, 0.7450981, 0, 1, 1,
0.8378915, 0.3705847, 0.8328355, 0.7529412, 0, 1, 1,
0.8431768, -0.6011457, 1.42511, 0.7568628, 0, 1, 1,
0.8440706, 0.5969671, 0.2326921, 0.7647059, 0, 1, 1,
0.8457624, -0.9824087, 2.28821, 0.7686275, 0, 1, 1,
0.8465789, 0.1496344, 1.220271, 0.7764706, 0, 1, 1,
0.8644187, 0.4149001, 0.8605929, 0.7803922, 0, 1, 1,
0.875586, 1.479105, 0.8027751, 0.7882353, 0, 1, 1,
0.8801142, -0.02528512, 1.946864, 0.7921569, 0, 1, 1,
0.8807139, 1.137721, 0.07610041, 0.8, 0, 1, 1,
0.8810567, 0.6226037, -1.583018, 0.8078431, 0, 1, 1,
0.8816046, 0.357847, 0.2929479, 0.8117647, 0, 1, 1,
0.8817221, -1.356514, 3.286486, 0.8196079, 0, 1, 1,
0.8865163, 1.084999, -0.06200023, 0.8235294, 0, 1, 1,
0.8884795, -1.494279, 3.517236, 0.8313726, 0, 1, 1,
0.8908697, -0.07959887, 2.598101, 0.8352941, 0, 1, 1,
0.8946164, -1.425049, 3.576212, 0.8431373, 0, 1, 1,
0.8957829, 0.7533437, -0.5601531, 0.8470588, 0, 1, 1,
0.8995552, -0.654761, 0.4441923, 0.854902, 0, 1, 1,
0.9000393, 1.298336, -0.08269437, 0.8588235, 0, 1, 1,
0.9072191, 0.09307486, 2.111383, 0.8666667, 0, 1, 1,
0.9103016, 1.763079, 0.4703495, 0.8705882, 0, 1, 1,
0.9149588, 0.03863928, 2.3203, 0.8784314, 0, 1, 1,
0.9151733, -0.4625466, 1.82444, 0.8823529, 0, 1, 1,
0.915592, 0.7620996, 0.6932792, 0.8901961, 0, 1, 1,
0.9184781, -0.0653945, 1.024957, 0.8941177, 0, 1, 1,
0.9201109, -0.164094, 2.45914, 0.9019608, 0, 1, 1,
0.92146, -0.3687415, 2.348431, 0.9098039, 0, 1, 1,
0.9286017, -2.025807, 3.26122, 0.9137255, 0, 1, 1,
0.93309, -1.253297, 3.301877, 0.9215686, 0, 1, 1,
0.9345545, 1.139037, 1.122287, 0.9254902, 0, 1, 1,
0.9363371, 0.008132898, 0.8326544, 0.9333333, 0, 1, 1,
0.9429355, -0.7375387, 1.807523, 0.9372549, 0, 1, 1,
0.943849, -0.7455862, 2.298696, 0.945098, 0, 1, 1,
0.950985, 1.383527, 0.1257801, 0.9490196, 0, 1, 1,
0.9618152, -0.9779693, 3.493889, 0.9568627, 0, 1, 1,
0.9625255, -0.2104018, 1.448413, 0.9607843, 0, 1, 1,
0.9638022, -0.570354, 1.580598, 0.9686275, 0, 1, 1,
0.9677339, -0.1281551, 1.8111, 0.972549, 0, 1, 1,
0.9761174, 0.1617505, 0.3720287, 0.9803922, 0, 1, 1,
0.986488, 1.576644, 2.175404, 0.9843137, 0, 1, 1,
0.9939443, -0.7074588, 0.3064488, 0.9921569, 0, 1, 1,
0.9966257, -0.353978, 3.01121, 0.9960784, 0, 1, 1,
1.004036, -2.191613, 4.245269, 1, 0, 0.9960784, 1,
1.005387, -1.072441, 2.955719, 1, 0, 0.9882353, 1,
1.010294, 1.226377, 1.255107, 1, 0, 0.9843137, 1,
1.023345, 0.3170537, 0.5086939, 1, 0, 0.9764706, 1,
1.029821, 0.01618179, -0.4741686, 1, 0, 0.972549, 1,
1.033952, -0.5770313, 1.467516, 1, 0, 0.9647059, 1,
1.034051, -0.3264706, 2.303021, 1, 0, 0.9607843, 1,
1.034697, 0.9521848, 2.665089, 1, 0, 0.9529412, 1,
1.039381, -0.2522714, 2.589184, 1, 0, 0.9490196, 1,
1.041445, 0.4636137, 1.787145, 1, 0, 0.9411765, 1,
1.044304, -0.1988873, 0.6619689, 1, 0, 0.9372549, 1,
1.0491, 1.141792, 0.08912596, 1, 0, 0.9294118, 1,
1.055891, -0.5831179, 2.210316, 1, 0, 0.9254902, 1,
1.057201, -1.768658, 4.858111, 1, 0, 0.9176471, 1,
1.058455, -0.8220381, 1.174827, 1, 0, 0.9137255, 1,
1.062478, -2.036443, 2.851001, 1, 0, 0.9058824, 1,
1.06338, 1.354381, 0.2826601, 1, 0, 0.9019608, 1,
1.069704, -1.248557, 2.973585, 1, 0, 0.8941177, 1,
1.075955, -1.083318, 0.3671657, 1, 0, 0.8862745, 1,
1.077924, -1.938243, 3.147948, 1, 0, 0.8823529, 1,
1.079501, 0.8283319, 2.151102, 1, 0, 0.8745098, 1,
1.087138, -0.7092918, 2.620958, 1, 0, 0.8705882, 1,
1.099803, -0.75739, 3.735836, 1, 0, 0.8627451, 1,
1.108037, 0.31008, 2.542144, 1, 0, 0.8588235, 1,
1.108359, -1.32903, 0.876259, 1, 0, 0.8509804, 1,
1.110775, 0.1808431, 1.854532, 1, 0, 0.8470588, 1,
1.110928, 0.7265218, 0.3049659, 1, 0, 0.8392157, 1,
1.113001, 0.1871289, 2.177115, 1, 0, 0.8352941, 1,
1.122998, 1.234555, 0.8993478, 1, 0, 0.827451, 1,
1.125139, 0.4838532, 0.6932101, 1, 0, 0.8235294, 1,
1.135607, 0.03424533, 1.105559, 1, 0, 0.8156863, 1,
1.136757, -0.006143711, 2.386629, 1, 0, 0.8117647, 1,
1.143997, -0.5795286, 3.667025, 1, 0, 0.8039216, 1,
1.144326, -1.397627, 4.600581, 1, 0, 0.7960784, 1,
1.145837, 1.844784, 1.394208, 1, 0, 0.7921569, 1,
1.148087, -0.1953903, 1.86367, 1, 0, 0.7843137, 1,
1.149795, 0.9455773, 0.7285167, 1, 0, 0.7803922, 1,
1.150907, -1.400878, 2.031596, 1, 0, 0.772549, 1,
1.153976, 0.07479237, 2.544652, 1, 0, 0.7686275, 1,
1.156459, -0.5662133, 1.755984, 1, 0, 0.7607843, 1,
1.158636, 0.6368928, 1.42299, 1, 0, 0.7568628, 1,
1.15943, 0.005993511, 2.140356, 1, 0, 0.7490196, 1,
1.170992, -0.8451818, 3.124518, 1, 0, 0.7450981, 1,
1.17426, 0.3163938, -0.1148711, 1, 0, 0.7372549, 1,
1.174934, 0.6869878, -1.103539, 1, 0, 0.7333333, 1,
1.176571, -0.1426525, 2.123576, 1, 0, 0.7254902, 1,
1.186301, 0.337163, 2.256564, 1, 0, 0.7215686, 1,
1.188556, -0.8410521, 2.036139, 1, 0, 0.7137255, 1,
1.197828, -0.09914177, 2.21149, 1, 0, 0.7098039, 1,
1.208226, -0.1903273, 1.535771, 1, 0, 0.7019608, 1,
1.210808, -0.6051804, 2.143615, 1, 0, 0.6941177, 1,
1.213173, -0.06298137, 0.2072096, 1, 0, 0.6901961, 1,
1.213763, -3.170847, 4.071247, 1, 0, 0.682353, 1,
1.218645, 0.4462245, 2.144206, 1, 0, 0.6784314, 1,
1.226496, -0.8674222, 2.179797, 1, 0, 0.6705883, 1,
1.232516, 0.1263109, 1.101126, 1, 0, 0.6666667, 1,
1.232771, 0.1966396, 1.655625, 1, 0, 0.6588235, 1,
1.233202, -2.503262, 1.325627, 1, 0, 0.654902, 1,
1.234014, 1.349584, 1.641044, 1, 0, 0.6470588, 1,
1.24606, 1.124901, 1.036153, 1, 0, 0.6431373, 1,
1.265494, -0.5345684, 2.200222, 1, 0, 0.6352941, 1,
1.265644, 0.7431203, 0.7314352, 1, 0, 0.6313726, 1,
1.2724, 0.7211204, 3.599742, 1, 0, 0.6235294, 1,
1.276613, 0.4364216, 1.013433, 1, 0, 0.6196079, 1,
1.27975, 0.6482657, 2.355425, 1, 0, 0.6117647, 1,
1.279948, 0.4374429, 0.1521524, 1, 0, 0.6078432, 1,
1.281531, 0.6420499, 0.169943, 1, 0, 0.6, 1,
1.287118, 1.572087, 1.385025, 1, 0, 0.5921569, 1,
1.289477, 0.1121018, 0.5292598, 1, 0, 0.5882353, 1,
1.291547, -0.187448, 1.563664, 1, 0, 0.5803922, 1,
1.292253, -0.2727221, 2.346214, 1, 0, 0.5764706, 1,
1.30095, 0.2005549, 1.41123, 1, 0, 0.5686275, 1,
1.301688, 1.250231, 1.359262, 1, 0, 0.5647059, 1,
1.301857, -0.5532919, 2.332079, 1, 0, 0.5568628, 1,
1.302698, 2.053457, 0.2259649, 1, 0, 0.5529412, 1,
1.304822, -0.2027368, 1.448792, 1, 0, 0.5450981, 1,
1.310808, 0.8407827, 1.196408, 1, 0, 0.5411765, 1,
1.314262, 1.261804, -1.391945, 1, 0, 0.5333334, 1,
1.32235, -0.2771979, 3.251808, 1, 0, 0.5294118, 1,
1.327926, -1.564412, 4.192093, 1, 0, 0.5215687, 1,
1.334368, 0.728929, 0.7019091, 1, 0, 0.5176471, 1,
1.344648, 0.2564563, 1.795426, 1, 0, 0.509804, 1,
1.347925, 1.246322, 1.934441, 1, 0, 0.5058824, 1,
1.34831, -1.421723, 1.827482, 1, 0, 0.4980392, 1,
1.348315, 1.392048, 2.358509, 1, 0, 0.4901961, 1,
1.354372, -0.7286186, 2.165549, 1, 0, 0.4862745, 1,
1.360204, -1.250085, -0.0465098, 1, 0, 0.4784314, 1,
1.391953, 0.6776158, -0.3386069, 1, 0, 0.4745098, 1,
1.399236, 0.02968357, -0.4027607, 1, 0, 0.4666667, 1,
1.429312, 0.2648722, 1.296519, 1, 0, 0.4627451, 1,
1.429878, -0.606923, 1.796556, 1, 0, 0.454902, 1,
1.430447, -0.8952782, 1.631615, 1, 0, 0.4509804, 1,
1.440167, 0.5816675, 1.580138, 1, 0, 0.4431373, 1,
1.444617, 3.133023, 0.03112007, 1, 0, 0.4392157, 1,
1.467628, -1.049644, 2.332051, 1, 0, 0.4313726, 1,
1.468386, -0.2897481, -0.2921705, 1, 0, 0.427451, 1,
1.477353, 1.125128, -1.422166, 1, 0, 0.4196078, 1,
1.497107, -1.158385, 3.089746, 1, 0, 0.4156863, 1,
1.505137, -1.144492, 2.894909, 1, 0, 0.4078431, 1,
1.510813, -0.8540207, 3.105712, 1, 0, 0.4039216, 1,
1.513731, -0.1823141, 2.688985, 1, 0, 0.3960784, 1,
1.520235, -1.285851, 2.524502, 1, 0, 0.3882353, 1,
1.523057, 1.371289, 1.152734, 1, 0, 0.3843137, 1,
1.525959, 0.007789016, 0.9526664, 1, 0, 0.3764706, 1,
1.541873, -2.503472, 3.661117, 1, 0, 0.372549, 1,
1.543311, -0.5470588, 1.976567, 1, 0, 0.3647059, 1,
1.543629, 0.4047964, -0.5428958, 1, 0, 0.3607843, 1,
1.549632, 1.074548, -0.2105114, 1, 0, 0.3529412, 1,
1.552157, 0.8223829, 0.755806, 1, 0, 0.3490196, 1,
1.554678, 0.7843868, 0.1860683, 1, 0, 0.3411765, 1,
1.559555, 0.9709529, -0.01155252, 1, 0, 0.3372549, 1,
1.56072, 0.05401796, 2.079344, 1, 0, 0.3294118, 1,
1.569677, -0.5732175, 0.6036851, 1, 0, 0.3254902, 1,
1.572448, -0.04443539, 1.784487, 1, 0, 0.3176471, 1,
1.572502, -0.2229161, 2.206281, 1, 0, 0.3137255, 1,
1.573032, 0.2281878, 0.02178055, 1, 0, 0.3058824, 1,
1.581087, 0.9694272, 0.8055585, 1, 0, 0.2980392, 1,
1.584793, -0.6518627, 1.617551, 1, 0, 0.2941177, 1,
1.598198, -0.5383667, 0.7332156, 1, 0, 0.2862745, 1,
1.612267, 1.072551, 1.179407, 1, 0, 0.282353, 1,
1.653287, 0.867301, -0.5220865, 1, 0, 0.2745098, 1,
1.663058, -0.7390536, 1.272734, 1, 0, 0.2705882, 1,
1.67566, -0.2494743, 2.201839, 1, 0, 0.2627451, 1,
1.681228, -0.3193389, 0.3036682, 1, 0, 0.2588235, 1,
1.682788, -0.7822707, 1.242664, 1, 0, 0.2509804, 1,
1.683854, 0.2640347, 0.02387495, 1, 0, 0.2470588, 1,
1.705359, 1.044428, 1.957661, 1, 0, 0.2392157, 1,
1.734981, -1.506857, 3.408526, 1, 0, 0.2352941, 1,
1.740669, 1.077007, 2.131884, 1, 0, 0.227451, 1,
1.741715, 0.4433429, 3.319073, 1, 0, 0.2235294, 1,
1.755319, 0.09593654, 2.440228, 1, 0, 0.2156863, 1,
1.757807, -0.9035046, 1.949551, 1, 0, 0.2117647, 1,
1.766455, -0.8687416, 2.200362, 1, 0, 0.2039216, 1,
1.769896, -1.006122, 1.203591, 1, 0, 0.1960784, 1,
1.776801, 1.126086, 1.540697, 1, 0, 0.1921569, 1,
1.787808, -1.443583, 2.560216, 1, 0, 0.1843137, 1,
1.791796, 0.6254786, 1.401785, 1, 0, 0.1803922, 1,
1.806807, 0.05242198, -0.4161942, 1, 0, 0.172549, 1,
1.859007, -1.009364, 0.9018842, 1, 0, 0.1686275, 1,
1.865765, 0.06207394, 1.380551, 1, 0, 0.1607843, 1,
1.969492, 2.390335, -0.6429191, 1, 0, 0.1568628, 1,
2.035427, -0.2955534, -0.9135203, 1, 0, 0.1490196, 1,
2.038722, -0.4976217, 0.8039775, 1, 0, 0.145098, 1,
2.04389, -0.001292902, 2.107708, 1, 0, 0.1372549, 1,
2.04547, -1.615054, 2.592504, 1, 0, 0.1333333, 1,
2.088452, 0.5895604, 0.9492695, 1, 0, 0.1254902, 1,
2.121866, 0.7417379, 1.589447, 1, 0, 0.1215686, 1,
2.12206, -0.3586501, 1.172561, 1, 0, 0.1137255, 1,
2.130085, 0.1745346, 0.7297909, 1, 0, 0.1098039, 1,
2.182457, 0.1217571, 1.734312, 1, 0, 0.1019608, 1,
2.197554, 0.2035497, -1.239136, 1, 0, 0.09411765, 1,
2.229891, 0.1004297, 2.802319, 1, 0, 0.09019608, 1,
2.256246, -1.129528, 2.678633, 1, 0, 0.08235294, 1,
2.293817, 0.9320653, 0.6876743, 1, 0, 0.07843138, 1,
2.31153, 0.4950711, 1.502793, 1, 0, 0.07058824, 1,
2.338454, -0.2225229, 3.419748, 1, 0, 0.06666667, 1,
2.364493, 0.4066056, -0.1924525, 1, 0, 0.05882353, 1,
2.397442, -1.587963, 3.996975, 1, 0, 0.05490196, 1,
2.398854, 0.591071, 1.611707, 1, 0, 0.04705882, 1,
2.408207, 0.7804073, 2.840564, 1, 0, 0.04313726, 1,
2.426798, -0.4982211, 0.149014, 1, 0, 0.03529412, 1,
2.450249, 0.5454649, 0.6631616, 1, 0, 0.03137255, 1,
2.475568, -0.5840902, 1.485513, 1, 0, 0.02352941, 1,
2.658602, 0.2191937, 2.287298, 1, 0, 0.01960784, 1,
2.678504, -0.2956312, 2.02676, 1, 0, 0.01176471, 1,
3.158257, -2.002616, 0.7549416, 1, 0, 0.007843138, 1
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
0.2280918, -4.239353, -8.208903, 0, -0.5, 0.5, 0.5,
0.2280918, -4.239353, -8.208903, 1, -0.5, 0.5, 0.5,
0.2280918, -4.239353, -8.208903, 1, 1.5, 0.5, 0.5,
0.2280918, -4.239353, -8.208903, 0, 1.5, 0.5, 0.5
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
-3.6954, -0.01891208, -8.208903, 0, -0.5, 0.5, 0.5,
-3.6954, -0.01891208, -8.208903, 1, -0.5, 0.5, 0.5,
-3.6954, -0.01891208, -8.208903, 1, 1.5, 0.5, 0.5,
-3.6954, -0.01891208, -8.208903, 0, 1.5, 0.5, 0.5
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
-3.6954, -4.239353, -0.3615451, 0, -0.5, 0.5, 0.5,
-3.6954, -4.239353, -0.3615451, 1, -0.5, 0.5, 0.5,
-3.6954, -4.239353, -0.3615451, 1, 1.5, 0.5, 0.5,
-3.6954, -4.239353, -0.3615451, 0, 1.5, 0.5, 0.5
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
-2, -3.265405, -6.397974,
3, -3.265405, -6.397974,
-2, -3.265405, -6.397974,
-2, -3.42773, -6.699796,
-1, -3.265405, -6.397974,
-1, -3.42773, -6.699796,
0, -3.265405, -6.397974,
0, -3.42773, -6.699796,
1, -3.265405, -6.397974,
1, -3.42773, -6.699796,
2, -3.265405, -6.397974,
2, -3.42773, -6.699796,
3, -3.265405, -6.397974,
3, -3.42773, -6.699796
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
-2, -3.752379, -7.303439, 0, -0.5, 0.5, 0.5,
-2, -3.752379, -7.303439, 1, -0.5, 0.5, 0.5,
-2, -3.752379, -7.303439, 1, 1.5, 0.5, 0.5,
-2, -3.752379, -7.303439, 0, 1.5, 0.5, 0.5,
-1, -3.752379, -7.303439, 0, -0.5, 0.5, 0.5,
-1, -3.752379, -7.303439, 1, -0.5, 0.5, 0.5,
-1, -3.752379, -7.303439, 1, 1.5, 0.5, 0.5,
-1, -3.752379, -7.303439, 0, 1.5, 0.5, 0.5,
0, -3.752379, -7.303439, 0, -0.5, 0.5, 0.5,
0, -3.752379, -7.303439, 1, -0.5, 0.5, 0.5,
0, -3.752379, -7.303439, 1, 1.5, 0.5, 0.5,
0, -3.752379, -7.303439, 0, 1.5, 0.5, 0.5,
1, -3.752379, -7.303439, 0, -0.5, 0.5, 0.5,
1, -3.752379, -7.303439, 1, -0.5, 0.5, 0.5,
1, -3.752379, -7.303439, 1, 1.5, 0.5, 0.5,
1, -3.752379, -7.303439, 0, 1.5, 0.5, 0.5,
2, -3.752379, -7.303439, 0, -0.5, 0.5, 0.5,
2, -3.752379, -7.303439, 1, -0.5, 0.5, 0.5,
2, -3.752379, -7.303439, 1, 1.5, 0.5, 0.5,
2, -3.752379, -7.303439, 0, 1.5, 0.5, 0.5,
3, -3.752379, -7.303439, 0, -0.5, 0.5, 0.5,
3, -3.752379, -7.303439, 1, -0.5, 0.5, 0.5,
3, -3.752379, -7.303439, 1, 1.5, 0.5, 0.5,
3, -3.752379, -7.303439, 0, 1.5, 0.5, 0.5
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
-2.789979, -3, -6.397974,
-2.789979, 3, -6.397974,
-2.789979, -3, -6.397974,
-2.940882, -3, -6.699796,
-2.789979, -2, -6.397974,
-2.940882, -2, -6.699796,
-2.789979, -1, -6.397974,
-2.940882, -1, -6.699796,
-2.789979, 0, -6.397974,
-2.940882, 0, -6.699796,
-2.789979, 1, -6.397974,
-2.940882, 1, -6.699796,
-2.789979, 2, -6.397974,
-2.940882, 2, -6.699796,
-2.789979, 3, -6.397974,
-2.940882, 3, -6.699796
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
-3.242689, -3, -7.303439, 0, -0.5, 0.5, 0.5,
-3.242689, -3, -7.303439, 1, -0.5, 0.5, 0.5,
-3.242689, -3, -7.303439, 1, 1.5, 0.5, 0.5,
-3.242689, -3, -7.303439, 0, 1.5, 0.5, 0.5,
-3.242689, -2, -7.303439, 0, -0.5, 0.5, 0.5,
-3.242689, -2, -7.303439, 1, -0.5, 0.5, 0.5,
-3.242689, -2, -7.303439, 1, 1.5, 0.5, 0.5,
-3.242689, -2, -7.303439, 0, 1.5, 0.5, 0.5,
-3.242689, -1, -7.303439, 0, -0.5, 0.5, 0.5,
-3.242689, -1, -7.303439, 1, -0.5, 0.5, 0.5,
-3.242689, -1, -7.303439, 1, 1.5, 0.5, 0.5,
-3.242689, -1, -7.303439, 0, 1.5, 0.5, 0.5,
-3.242689, 0, -7.303439, 0, -0.5, 0.5, 0.5,
-3.242689, 0, -7.303439, 1, -0.5, 0.5, 0.5,
-3.242689, 0, -7.303439, 1, 1.5, 0.5, 0.5,
-3.242689, 0, -7.303439, 0, 1.5, 0.5, 0.5,
-3.242689, 1, -7.303439, 0, -0.5, 0.5, 0.5,
-3.242689, 1, -7.303439, 1, -0.5, 0.5, 0.5,
-3.242689, 1, -7.303439, 1, 1.5, 0.5, 0.5,
-3.242689, 1, -7.303439, 0, 1.5, 0.5, 0.5,
-3.242689, 2, -7.303439, 0, -0.5, 0.5, 0.5,
-3.242689, 2, -7.303439, 1, -0.5, 0.5, 0.5,
-3.242689, 2, -7.303439, 1, 1.5, 0.5, 0.5,
-3.242689, 2, -7.303439, 0, 1.5, 0.5, 0.5,
-3.242689, 3, -7.303439, 0, -0.5, 0.5, 0.5,
-3.242689, 3, -7.303439, 1, -0.5, 0.5, 0.5,
-3.242689, 3, -7.303439, 1, 1.5, 0.5, 0.5,
-3.242689, 3, -7.303439, 0, 1.5, 0.5, 0.5
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
-2.789979, -3.265405, -6,
-2.789979, -3.265405, 4,
-2.789979, -3.265405, -6,
-2.940882, -3.42773, -6,
-2.789979, -3.265405, -4,
-2.940882, -3.42773, -4,
-2.789979, -3.265405, -2,
-2.940882, -3.42773, -2,
-2.789979, -3.265405, 0,
-2.940882, -3.42773, 0,
-2.789979, -3.265405, 2,
-2.940882, -3.42773, 2,
-2.789979, -3.265405, 4,
-2.940882, -3.42773, 4
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
-3.242689, -3.752379, -6, 0, -0.5, 0.5, 0.5,
-3.242689, -3.752379, -6, 1, -0.5, 0.5, 0.5,
-3.242689, -3.752379, -6, 1, 1.5, 0.5, 0.5,
-3.242689, -3.752379, -6, 0, 1.5, 0.5, 0.5,
-3.242689, -3.752379, -4, 0, -0.5, 0.5, 0.5,
-3.242689, -3.752379, -4, 1, -0.5, 0.5, 0.5,
-3.242689, -3.752379, -4, 1, 1.5, 0.5, 0.5,
-3.242689, -3.752379, -4, 0, 1.5, 0.5, 0.5,
-3.242689, -3.752379, -2, 0, -0.5, 0.5, 0.5,
-3.242689, -3.752379, -2, 1, -0.5, 0.5, 0.5,
-3.242689, -3.752379, -2, 1, 1.5, 0.5, 0.5,
-3.242689, -3.752379, -2, 0, 1.5, 0.5, 0.5,
-3.242689, -3.752379, 0, 0, -0.5, 0.5, 0.5,
-3.242689, -3.752379, 0, 1, -0.5, 0.5, 0.5,
-3.242689, -3.752379, 0, 1, 1.5, 0.5, 0.5,
-3.242689, -3.752379, 0, 0, 1.5, 0.5, 0.5,
-3.242689, -3.752379, 2, 0, -0.5, 0.5, 0.5,
-3.242689, -3.752379, 2, 1, -0.5, 0.5, 0.5,
-3.242689, -3.752379, 2, 1, 1.5, 0.5, 0.5,
-3.242689, -3.752379, 2, 0, 1.5, 0.5, 0.5,
-3.242689, -3.752379, 4, 0, -0.5, 0.5, 0.5,
-3.242689, -3.752379, 4, 1, -0.5, 0.5, 0.5,
-3.242689, -3.752379, 4, 1, 1.5, 0.5, 0.5,
-3.242689, -3.752379, 4, 0, 1.5, 0.5, 0.5
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
-2.789979, -3.265405, -6.397974,
-2.789979, 3.227581, -6.397974,
-2.789979, -3.265405, 5.674884,
-2.789979, 3.227581, 5.674884,
-2.789979, -3.265405, -6.397974,
-2.789979, -3.265405, 5.674884,
-2.789979, 3.227581, -6.397974,
-2.789979, 3.227581, 5.674884,
-2.789979, -3.265405, -6.397974,
3.246162, -3.265405, -6.397974,
-2.789979, -3.265405, 5.674884,
3.246162, -3.265405, 5.674884,
-2.789979, 3.227581, -6.397974,
3.246162, 3.227581, -6.397974,
-2.789979, 3.227581, 5.674884,
3.246162, 3.227581, 5.674884,
3.246162, -3.265405, -6.397974,
3.246162, 3.227581, -6.397974,
3.246162, -3.265405, 5.674884,
3.246162, 3.227581, 5.674884,
3.246162, -3.265405, -6.397974,
3.246162, -3.265405, 5.674884,
3.246162, 3.227581, -6.397974,
3.246162, 3.227581, 5.674884
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
var radius = 7.998092;
var distance = 35.58441;
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
mvMatrix.translate( -0.2280918, 0.01891208, 0.3615451 );
mvMatrix.scale( 1.432653, 1.331851, 0.7162921 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.58441);
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
Dicarbon_monoxide<-read.table("Dicarbon_monoxide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dicarbon_monoxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dicarbon_monoxide' not found
```

```r
y<-Dicarbon_monoxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dicarbon_monoxide' not found
```

```r
z<-Dicarbon_monoxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dicarbon_monoxide' not found
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
-2.702074, 1.280556, -1.345647, 0, 0, 1, 1, 1,
-2.671649, 0.722168, -0.05631216, 1, 0, 0, 1, 1,
-2.613481, 0.7688612, -1.309271, 1, 0, 0, 1, 1,
-2.604337, 1.072265, -1.554332, 1, 0, 0, 1, 1,
-2.591107, 0.7587901, -2.125758, 1, 0, 0, 1, 1,
-2.535219, 0.1210122, -1.316612, 1, 0, 0, 1, 1,
-2.532516, 0.001910125, -0.569101, 0, 0, 0, 1, 1,
-2.454013, -0.9532817, -0.9174981, 0, 0, 0, 1, 1,
-2.430396, -0.6254956, -0.8932243, 0, 0, 0, 1, 1,
-2.364906, -0.8024684, -1.227773, 0, 0, 0, 1, 1,
-2.29427, -0.9588277, -1.550287, 0, 0, 0, 1, 1,
-2.260363, 0.5810286, 0.8359625, 0, 0, 0, 1, 1,
-2.243734, 1.155491, -0.6246185, 0, 0, 0, 1, 1,
-2.222805, -1.581998, -2.113624, 1, 1, 1, 1, 1,
-2.210972, 0.3661982, -1.722273, 1, 1, 1, 1, 1,
-2.117575, 1.365712, 0.5168012, 1, 1, 1, 1, 1,
-2.110393, 0.4636847, -3.331419, 1, 1, 1, 1, 1,
-2.060994, -0.6147887, -1.418671, 1, 1, 1, 1, 1,
-2.052629, -0.6431049, -2.716812, 1, 1, 1, 1, 1,
-2.048776, 0.4016114, -0.0923861, 1, 1, 1, 1, 1,
-1.967699, -0.3278793, 0.8282831, 1, 1, 1, 1, 1,
-1.954996, 0.2709375, -3.112139, 1, 1, 1, 1, 1,
-1.944818, -0.4526657, -1.586432, 1, 1, 1, 1, 1,
-1.925344, 0.1822999, -1.370628, 1, 1, 1, 1, 1,
-1.918933, 1.299963, -1.658993, 1, 1, 1, 1, 1,
-1.91508, 0.8475781, -1.073317, 1, 1, 1, 1, 1,
-1.903053, 1.08938, -1.326579, 1, 1, 1, 1, 1,
-1.900529, 0.8710378, -0.7793355, 1, 1, 1, 1, 1,
-1.883397, 1.093432, 1.14467, 0, 0, 1, 1, 1,
-1.879793, -1.428285, -0.3957003, 1, 0, 0, 1, 1,
-1.861825, 0.7709138, -0.5693588, 1, 0, 0, 1, 1,
-1.857096, -2.385468, -0.7386309, 1, 0, 0, 1, 1,
-1.854462, 0.1304027, -2.690154, 1, 0, 0, 1, 1,
-1.852493, -1.701743, -2.448788, 1, 0, 0, 1, 1,
-1.824183, 0.007454833, -0.9098339, 0, 0, 0, 1, 1,
-1.767207, -0.8345661, -2.234231, 0, 0, 0, 1, 1,
-1.762154, 1.50875, -0.8417839, 0, 0, 0, 1, 1,
-1.753856, 0.7329965, -0.3608156, 0, 0, 0, 1, 1,
-1.744202, -0.3927535, -2.788865, 0, 0, 0, 1, 1,
-1.725246, -0.1758486, -1.021844, 0, 0, 0, 1, 1,
-1.701495, 0.2471791, -1.542742, 0, 0, 0, 1, 1,
-1.687943, -2.620451, -3.947296, 1, 1, 1, 1, 1,
-1.676993, -0.4715817, -1.155589, 1, 1, 1, 1, 1,
-1.672118, -0.3947439, -1.705382, 1, 1, 1, 1, 1,
-1.641609, 0.1073773, -0.4881188, 1, 1, 1, 1, 1,
-1.632424, -0.4556475, -0.1216368, 1, 1, 1, 1, 1,
-1.627928, -0.8213859, -2.064741, 1, 1, 1, 1, 1,
-1.627453, 0.6821494, -0.9712763, 1, 1, 1, 1, 1,
-1.626677, -0.3187171, -0.8659331, 1, 1, 1, 1, 1,
-1.626228, 0.06090847, -2.014406, 1, 1, 1, 1, 1,
-1.625627, 0.557166, -0.8548938, 1, 1, 1, 1, 1,
-1.623905, 1.380903, -1.558885, 1, 1, 1, 1, 1,
-1.622878, -1.827906, -4.063107, 1, 1, 1, 1, 1,
-1.619701, 1.399883, -0.7891319, 1, 1, 1, 1, 1,
-1.617481, -0.9199846, -2.89853, 1, 1, 1, 1, 1,
-1.610203, -0.08064019, -1.566726, 1, 1, 1, 1, 1,
-1.606901, -0.1743986, -3.96476, 0, 0, 1, 1, 1,
-1.599888, 1.595546, -0.7545555, 1, 0, 0, 1, 1,
-1.596066, -1.032036, -4.460857, 1, 0, 0, 1, 1,
-1.59161, 0.4948016, -1.858207, 1, 0, 0, 1, 1,
-1.590766, -1.055197, -2.098328, 1, 0, 0, 1, 1,
-1.573246, -1.780617, -2.769908, 1, 0, 0, 1, 1,
-1.560312, 2.095857, -1.40441, 0, 0, 0, 1, 1,
-1.556594, 0.5401114, -2.027039, 0, 0, 0, 1, 1,
-1.551718, 0.5277109, -1.038619, 0, 0, 0, 1, 1,
-1.543382, 0.2063458, -2.754754, 0, 0, 0, 1, 1,
-1.533755, -0.4944915, -1.826621, 0, 0, 0, 1, 1,
-1.532445, -1.274087, -3.948837, 0, 0, 0, 1, 1,
-1.52656, 0.2544487, -1.646113, 0, 0, 0, 1, 1,
-1.510843, -2.490077, -3.573166, 1, 1, 1, 1, 1,
-1.492593, -1.315134, -2.017635, 1, 1, 1, 1, 1,
-1.486972, 0.5908598, -0.6996021, 1, 1, 1, 1, 1,
-1.47813, -0.04593685, -0.8584974, 1, 1, 1, 1, 1,
-1.475018, 0.3391157, -2.180251, 1, 1, 1, 1, 1,
-1.471571, -1.659188, -2.6085, 1, 1, 1, 1, 1,
-1.439566, -0.0389799, -1.37519, 1, 1, 1, 1, 1,
-1.434412, -0.6679801, -2.486758, 1, 1, 1, 1, 1,
-1.415302, 0.4654565, -1.42338, 1, 1, 1, 1, 1,
-1.412775, -2.876144, -2.881091, 1, 1, 1, 1, 1,
-1.40809, 0.3522735, -1.792393, 1, 1, 1, 1, 1,
-1.395419, -0.3687897, -2.328611, 1, 1, 1, 1, 1,
-1.382395, -1.606256, -2.625031, 1, 1, 1, 1, 1,
-1.376479, 1.465649, 0.3831628, 1, 1, 1, 1, 1,
-1.370773, 0.6380466, -0.8043587, 1, 1, 1, 1, 1,
-1.367106, -0.4695903, -2.228675, 0, 0, 1, 1, 1,
-1.353455, -0.8332147, -3.373812, 1, 0, 0, 1, 1,
-1.353205, 1.274956, -0.2232568, 1, 0, 0, 1, 1,
-1.342491, -0.4455463, -2.157804, 1, 0, 0, 1, 1,
-1.336721, 0.7796928, -0.7663882, 1, 0, 0, 1, 1,
-1.335992, -0.4111789, -1.610372, 1, 0, 0, 1, 1,
-1.319562, 1.951988, -1.191891, 0, 0, 0, 1, 1,
-1.318061, -1.683824, -2.667457, 0, 0, 0, 1, 1,
-1.316365, -0.24194, -2.400947, 0, 0, 0, 1, 1,
-1.312614, -1.490261, -1.759169, 0, 0, 0, 1, 1,
-1.302469, -1.914331, -2.297662, 0, 0, 0, 1, 1,
-1.29716, -1.438983, -1.485916, 0, 0, 0, 1, 1,
-1.293913, 2.370281, 0.3133972, 0, 0, 0, 1, 1,
-1.293308, -1.433771, -1.170387, 1, 1, 1, 1, 1,
-1.282447, 1.396699, -1.778172, 1, 1, 1, 1, 1,
-1.280558, 0.2643296, -2.488966, 1, 1, 1, 1, 1,
-1.279616, -0.1725947, -0.725982, 1, 1, 1, 1, 1,
-1.269566, 0.6703652, -0.01958416, 1, 1, 1, 1, 1,
-1.254969, 0.4130324, 0.8936222, 1, 1, 1, 1, 1,
-1.246061, 1.359271, 0.2263013, 1, 1, 1, 1, 1,
-1.231969, 0.3316672, -2.283824, 1, 1, 1, 1, 1,
-1.222193, -0.1178811, -2.03006, 1, 1, 1, 1, 1,
-1.220561, -0.2055857, -0.55318, 1, 1, 1, 1, 1,
-1.213016, 0.398291, -0.4701827, 1, 1, 1, 1, 1,
-1.205664, 1.191856, 0.2750339, 1, 1, 1, 1, 1,
-1.202366, 0.8247877, -0.8525203, 1, 1, 1, 1, 1,
-1.188833, 0.07685258, -0.7759754, 1, 1, 1, 1, 1,
-1.187242, -0.0164301, -1.917118, 1, 1, 1, 1, 1,
-1.181711, -0.5363593, -1.507726, 0, 0, 1, 1, 1,
-1.167202, 0.06609441, -1.587877, 1, 0, 0, 1, 1,
-1.157627, 0.5865976, -0.6031711, 1, 0, 0, 1, 1,
-1.156287, -0.440722, -2.03721, 1, 0, 0, 1, 1,
-1.150849, -0.8587372, 0.2467333, 1, 0, 0, 1, 1,
-1.149669, -0.6740834, -0.9343413, 1, 0, 0, 1, 1,
-1.142317, 0.3084076, -1.105843, 0, 0, 0, 1, 1,
-1.134314, -1.084071, -2.289924, 0, 0, 0, 1, 1,
-1.131133, 0.2738121, -3.124972, 0, 0, 0, 1, 1,
-1.121678, 1.132131, 0.3982496, 0, 0, 0, 1, 1,
-1.112532, -0.4036354, -3.510175, 0, 0, 0, 1, 1,
-1.111257, -0.7301206, -4.637456, 0, 0, 0, 1, 1,
-1.108408, -1.363435, -1.883468, 0, 0, 0, 1, 1,
-1.107376, -1.611065, -1.382386, 1, 1, 1, 1, 1,
-1.09623, 1.440099, -1.247909, 1, 1, 1, 1, 1,
-1.09603, 1.909588, 0.7998505, 1, 1, 1, 1, 1,
-1.091121, -0.7731725, -2.702446, 1, 1, 1, 1, 1,
-1.088838, 0.4377815, -1.272896, 1, 1, 1, 1, 1,
-1.083069, 0.4382353, -2.795971, 1, 1, 1, 1, 1,
-1.082926, 1.309504, -0.465304, 1, 1, 1, 1, 1,
-1.082503, 1.174225, 0.3119395, 1, 1, 1, 1, 1,
-1.070899, 0.4814973, -1.067304, 1, 1, 1, 1, 1,
-1.070569, 0.94132, -1.221654, 1, 1, 1, 1, 1,
-1.069935, -0.4309056, -1.065408, 1, 1, 1, 1, 1,
-1.065188, -0.2307084, -3.532818, 1, 1, 1, 1, 1,
-1.063251, -1.077783, -2.888648, 1, 1, 1, 1, 1,
-1.060961, -0.02283119, -1.448738, 1, 1, 1, 1, 1,
-1.04942, 0.04998857, -0.2072203, 1, 1, 1, 1, 1,
-1.041656, 0.5503559, -2.472603, 0, 0, 1, 1, 1,
-1.037102, 0.1908659, -1.186808, 1, 0, 0, 1, 1,
-1.030848, -1.56225, -1.757272, 1, 0, 0, 1, 1,
-1.026077, -1.699702, -1.552138, 1, 0, 0, 1, 1,
-1.023775, 0.09033098, -0.0533402, 1, 0, 0, 1, 1,
-1.01324, -0.3079676, -1.427967, 1, 0, 0, 1, 1,
-1.00299, -0.5501156, -1.583704, 0, 0, 0, 1, 1,
-0.9950583, -0.9431883, -2.440159, 0, 0, 0, 1, 1,
-0.992586, 0.9851167, -1.488962, 0, 0, 0, 1, 1,
-0.979757, -0.1677587, -2.915891, 0, 0, 0, 1, 1,
-0.9720084, -0.304602, -3.762624, 0, 0, 0, 1, 1,
-0.9711549, -1.062188, -4.258845, 0, 0, 0, 1, 1,
-0.9616568, 1.833914, -1.146537, 0, 0, 0, 1, 1,
-0.9547369, -0.9091861, -2.976117, 1, 1, 1, 1, 1,
-0.9527893, 0.09831133, -2.625318, 1, 1, 1, 1, 1,
-0.951454, 0.05726573, -1.136063, 1, 1, 1, 1, 1,
-0.9514368, 0.3273734, -2.995056, 1, 1, 1, 1, 1,
-0.950995, -0.389954, -2.733399, 1, 1, 1, 1, 1,
-0.9380625, 0.437195, -0.1920475, 1, 1, 1, 1, 1,
-0.9379718, -0.9083896, -2.389647, 1, 1, 1, 1, 1,
-0.9219615, -0.654474, -0.6900291, 1, 1, 1, 1, 1,
-0.9157587, -0.9657025, -1.197156, 1, 1, 1, 1, 1,
-0.9110289, -0.2109711, -1.24027, 1, 1, 1, 1, 1,
-0.9078855, -0.905387, -1.904198, 1, 1, 1, 1, 1,
-0.899121, 0.3337773, 0.008377481, 1, 1, 1, 1, 1,
-0.8969544, 2.747876, -0.4337825, 1, 1, 1, 1, 1,
-0.8929639, -1.312372, -4.059796, 1, 1, 1, 1, 1,
-0.8928376, 0.582921, 0.7831678, 1, 1, 1, 1, 1,
-0.891404, 0.7788943, -1.597231, 0, 0, 1, 1, 1,
-0.8890989, -1.888182, -3.358605, 1, 0, 0, 1, 1,
-0.8861173, -1.106588, -2.086316, 1, 0, 0, 1, 1,
-0.8855035, 1.246912, -0.5715847, 1, 0, 0, 1, 1,
-0.8836821, -0.5927114, -1.411269, 1, 0, 0, 1, 1,
-0.8780872, -0.2597189, -1.782958, 1, 0, 0, 1, 1,
-0.8753688, 1.260166, -0.5299641, 0, 0, 0, 1, 1,
-0.8736, 0.04047079, -1.584725, 0, 0, 0, 1, 1,
-0.8646799, 0.3188166, 0.2026659, 0, 0, 0, 1, 1,
-0.8572322, 1.383497, -0.1649773, 0, 0, 0, 1, 1,
-0.8539991, 1.551643, -2.54784, 0, 0, 0, 1, 1,
-0.8534827, 0.3609533, -1.48179, 0, 0, 0, 1, 1,
-0.85005, -2.29653, -3.363842, 0, 0, 0, 1, 1,
-0.8445821, 0.2398054, -0.9931728, 1, 1, 1, 1, 1,
-0.836815, -0.3097408, -1.68487, 1, 1, 1, 1, 1,
-0.8204551, -1.138816, -2.238227, 1, 1, 1, 1, 1,
-0.8157343, -0.3875088, -2.028433, 1, 1, 1, 1, 1,
-0.8150665, 0.5892098, -0.3965055, 1, 1, 1, 1, 1,
-0.8131507, -1.785523, -4.06502, 1, 1, 1, 1, 1,
-0.8116781, 0.5846608, 0.8337594, 1, 1, 1, 1, 1,
-0.8087932, -0.02717405, -0.9024888, 1, 1, 1, 1, 1,
-0.8060802, -1.79367, -2.802089, 1, 1, 1, 1, 1,
-0.803803, -0.1466663, -1.551333, 1, 1, 1, 1, 1,
-0.8016917, 0.1810935, 0.4409477, 1, 1, 1, 1, 1,
-0.789731, 0.485676, -1.870192, 1, 1, 1, 1, 1,
-0.7883594, -0.2493522, 0.5747812, 1, 1, 1, 1, 1,
-0.7830966, -1.059732, -4.589983, 1, 1, 1, 1, 1,
-0.774814, -1.47792, -3.705424, 1, 1, 1, 1, 1,
-0.7724185, 1.171687, 1.224392, 0, 0, 1, 1, 1,
-0.7705166, 0.8676102, 0.1801437, 1, 0, 0, 1, 1,
-0.7670555, 0.1882023, -0.8964058, 1, 0, 0, 1, 1,
-0.7663153, -0.4470762, -1.620644, 1, 0, 0, 1, 1,
-0.7659963, -0.5934367, -2.29417, 1, 0, 0, 1, 1,
-0.7655298, -1.261895, -2.931982, 1, 0, 0, 1, 1,
-0.7646877, 1.093754, 0.3002355, 0, 0, 0, 1, 1,
-0.7611839, -2.44296, -1.964661, 0, 0, 0, 1, 1,
-0.758605, -0.318302, -0.4895237, 0, 0, 0, 1, 1,
-0.7480782, 0.2703302, 0.2803037, 0, 0, 0, 1, 1,
-0.7477617, 0.3442208, -2.525178, 0, 0, 0, 1, 1,
-0.7476937, 0.1934048, -1.54286, 0, 0, 0, 1, 1,
-0.7468362, 0.7284319, -1.685625, 0, 0, 0, 1, 1,
-0.7443196, 0.03787371, -0.3969721, 1, 1, 1, 1, 1,
-0.7413297, 0.8788375, -0.170957, 1, 1, 1, 1, 1,
-0.7386112, 0.5184734, -1.726655, 1, 1, 1, 1, 1,
-0.7381431, -1.243283, -5.037162, 1, 1, 1, 1, 1,
-0.7310767, -0.4588542, -2.016196, 1, 1, 1, 1, 1,
-0.7289854, -0.6403392, -1.643898, 1, 1, 1, 1, 1,
-0.7262473, 0.2885642, -0.6411066, 1, 1, 1, 1, 1,
-0.7260239, -1.518517, -3.935209, 1, 1, 1, 1, 1,
-0.7211679, -0.3782786, -1.263489, 1, 1, 1, 1, 1,
-0.7190657, -0.2639, -1.504258, 1, 1, 1, 1, 1,
-0.7174809, -1.076414, -3.467036, 1, 1, 1, 1, 1,
-0.7137908, -1.162466, -3.389184, 1, 1, 1, 1, 1,
-0.7081274, 0.04101432, -2.183361, 1, 1, 1, 1, 1,
-0.7055289, 0.7565054, -1.272971, 1, 1, 1, 1, 1,
-0.70259, 0.2759289, -1.393337, 1, 1, 1, 1, 1,
-0.7016768, -1.638008, -1.777355, 0, 0, 1, 1, 1,
-0.6980953, 0.3862464, 0.06610513, 1, 0, 0, 1, 1,
-0.6971346, 0.6905408, -0.7688075, 1, 0, 0, 1, 1,
-0.6928111, 0.5686651, -2.238406, 1, 0, 0, 1, 1,
-0.6924294, 0.3902937, -0.4520859, 1, 0, 0, 1, 1,
-0.6921785, 0.5945821, -0.07858676, 1, 0, 0, 1, 1,
-0.6904261, 0.1751799, -1.96873, 0, 0, 0, 1, 1,
-0.6887049, 0.3816251, 0.1070336, 0, 0, 0, 1, 1,
-0.682251, -1.153112, -6.222156, 0, 0, 0, 1, 1,
-0.6784936, -1.131402, -0.9673384, 0, 0, 0, 1, 1,
-0.6772848, 0.824305, -0.2900198, 0, 0, 0, 1, 1,
-0.6759531, 0.7681271, -0.7508552, 0, 0, 0, 1, 1,
-0.671985, -1.12919, -1.861034, 0, 0, 0, 1, 1,
-0.670531, -0.4011082, -2.872286, 1, 1, 1, 1, 1,
-0.6662715, -1.234123, -2.544415, 1, 1, 1, 1, 1,
-0.6625965, -0.2913315, -3.346622, 1, 1, 1, 1, 1,
-0.6610949, -1.756414, -3.67201, 1, 1, 1, 1, 1,
-0.6598446, 1.704327, -1.514173, 1, 1, 1, 1, 1,
-0.6549243, -0.2399582, -2.102999, 1, 1, 1, 1, 1,
-0.6421506, 0.09695041, -1.311862, 1, 1, 1, 1, 1,
-0.6376891, -0.7359344, -1.749288, 1, 1, 1, 1, 1,
-0.6375301, 0.5574393, -1.739364, 1, 1, 1, 1, 1,
-0.6367745, -0.6361896, -2.232563, 1, 1, 1, 1, 1,
-0.6366346, -0.550832, -2.757205, 1, 1, 1, 1, 1,
-0.6364114, -0.3627967, -1.871678, 1, 1, 1, 1, 1,
-0.6310026, 0.5710792, -0.7309409, 1, 1, 1, 1, 1,
-0.6208926, 0.2291196, -1.268874, 1, 1, 1, 1, 1,
-0.6175271, 0.1833274, -2.754176, 1, 1, 1, 1, 1,
-0.6146867, -0.3274271, -1.684567, 0, 0, 1, 1, 1,
-0.6142781, -1.251335, -1.975313, 1, 0, 0, 1, 1,
-0.6126084, -1.438646, -2.085567, 1, 0, 0, 1, 1,
-0.6064074, -1.247678, -2.304735, 1, 0, 0, 1, 1,
-0.6032563, -1.426191, -3.024474, 1, 0, 0, 1, 1,
-0.6029541, 0.3338696, 0.08340554, 1, 0, 0, 1, 1,
-0.6027833, -0.7876925, -3.877192, 0, 0, 0, 1, 1,
-0.6009535, -0.2047372, -3.601644, 0, 0, 0, 1, 1,
-0.599616, -0.1166282, -0.1274562, 0, 0, 0, 1, 1,
-0.5987533, 0.02286262, 0.3190579, 0, 0, 0, 1, 1,
-0.5974901, -1.818778, -0.9355969, 0, 0, 0, 1, 1,
-0.5914778, 1.09104, -1.326875, 0, 0, 0, 1, 1,
-0.5901399, -0.47883, -4.175028, 0, 0, 0, 1, 1,
-0.5890839, 0.7169998, -0.2098296, 1, 1, 1, 1, 1,
-0.5858264, -0.5861256, -2.655018, 1, 1, 1, 1, 1,
-0.584174, -0.1523547, -3.492989, 1, 1, 1, 1, 1,
-0.5817218, -0.1114361, -1.313892, 1, 1, 1, 1, 1,
-0.5810645, 1.650154, 2.144176, 1, 1, 1, 1, 1,
-0.5801572, -0.9048555, -3.634299, 1, 1, 1, 1, 1,
-0.5797996, -1.026949, -3.638745, 1, 1, 1, 1, 1,
-0.5785406, 0.7654731, 0.007861199, 1, 1, 1, 1, 1,
-0.5785156, -0.4555938, -2.060197, 1, 1, 1, 1, 1,
-0.5772321, 0.3206774, -1.619207, 1, 1, 1, 1, 1,
-0.5770167, -1.38845, -3.130169, 1, 1, 1, 1, 1,
-0.5739989, 0.1221685, -0.6752426, 1, 1, 1, 1, 1,
-0.5705876, -1.022069, -1.186316, 1, 1, 1, 1, 1,
-0.5689065, 0.377477, -1.500315, 1, 1, 1, 1, 1,
-0.5678758, 0.4405555, -1.526206, 1, 1, 1, 1, 1,
-0.5647858, -1.446372, -1.954823, 0, 0, 1, 1, 1,
-0.5595413, -0.4435044, -3.759168, 1, 0, 0, 1, 1,
-0.5576696, 0.5400406, 1.106463, 1, 0, 0, 1, 1,
-0.5556655, -0.4219967, -1.644099, 1, 0, 0, 1, 1,
-0.5547124, -0.6393093, -2.147977, 1, 0, 0, 1, 1,
-0.5509313, -0.4444006, -1.317351, 1, 0, 0, 1, 1,
-0.5447876, -1.014489, -2.607188, 0, 0, 0, 1, 1,
-0.5397676, 0.459428, -1.469134, 0, 0, 0, 1, 1,
-0.5368018, 1.471604, 0.06176468, 0, 0, 0, 1, 1,
-0.5366955, -1.02341, -3.82882, 0, 0, 0, 1, 1,
-0.5346808, -1.499713, -3.804733, 0, 0, 0, 1, 1,
-0.5310165, -0.4841813, -1.110252, 0, 0, 0, 1, 1,
-0.5307559, -0.3944823, -3.99471, 0, 0, 0, 1, 1,
-0.5304534, 0.1502551, -2.063481, 1, 1, 1, 1, 1,
-0.5294119, 0.3616381, -0.1880455, 1, 1, 1, 1, 1,
-0.5236985, -0.6656812, -2.687311, 1, 1, 1, 1, 1,
-0.5216064, -0.2742637, 0.1930111, 1, 1, 1, 1, 1,
-0.5171595, 0.6639262, -2.994952, 1, 1, 1, 1, 1,
-0.5160424, -0.5671551, -1.69738, 1, 1, 1, 1, 1,
-0.5155292, 0.2741776, -1.537974, 1, 1, 1, 1, 1,
-0.5152109, 1.408629, -0.3044026, 1, 1, 1, 1, 1,
-0.5060639, 0.4194246, 0.1177584, 1, 1, 1, 1, 1,
-0.5018312, -0.2897952, -4.343078, 1, 1, 1, 1, 1,
-0.4971041, 0.4161905, -0.8479938, 1, 1, 1, 1, 1,
-0.4961675, -0.7939683, -3.064617, 1, 1, 1, 1, 1,
-0.4938125, -0.4478755, -2.290303, 1, 1, 1, 1, 1,
-0.4925795, -2.253278, -3.288227, 1, 1, 1, 1, 1,
-0.4917249, 1.076641, -0.3749841, 1, 1, 1, 1, 1,
-0.4893529, 0.1559937, -1.714872, 0, 0, 1, 1, 1,
-0.4853154, -1.353055, -3.796182, 1, 0, 0, 1, 1,
-0.4845536, 1.811942, -2.028997, 1, 0, 0, 1, 1,
-0.4822606, 0.3378039, -1.81438, 1, 0, 0, 1, 1,
-0.4774349, -0.3862691, -3.611366, 1, 0, 0, 1, 1,
-0.4750529, 0.08551049, -2.168675, 1, 0, 0, 1, 1,
-0.4724687, 1.395512, -1.258498, 0, 0, 0, 1, 1,
-0.4716052, -0.1407978, -3.026516, 0, 0, 0, 1, 1,
-0.4687304, -0.5517735, -2.173218, 0, 0, 0, 1, 1,
-0.4643015, -0.03832956, -1.780415, 0, 0, 0, 1, 1,
-0.4594395, -0.1070194, -0.954183, 0, 0, 0, 1, 1,
-0.458177, 1.957594, 1.317568, 0, 0, 0, 1, 1,
-0.4467433, 1.688437, -1.255345, 0, 0, 0, 1, 1,
-0.4443452, 1.574626, -0.7915301, 1, 1, 1, 1, 1,
-0.4382223, 0.4798622, -0.1941328, 1, 1, 1, 1, 1,
-0.4355485, -0.5406027, -0.9664623, 1, 1, 1, 1, 1,
-0.4259322, -0.2974583, -2.200846, 1, 1, 1, 1, 1,
-0.4225217, 0.9026369, 0.1327571, 1, 1, 1, 1, 1,
-0.4193665, -1.946755, -2.794699, 1, 1, 1, 1, 1,
-0.4175305, 0.4157742, -2.316201, 1, 1, 1, 1, 1,
-0.4147445, -0.269999, -3.930484, 1, 1, 1, 1, 1,
-0.4142646, 1.621437, -1.156534, 1, 1, 1, 1, 1,
-0.4128112, 0.4923423, -0.1113722, 1, 1, 1, 1, 1,
-0.4095851, -0.5889232, -2.938272, 1, 1, 1, 1, 1,
-0.4065228, 0.9171835, -2.288179, 1, 1, 1, 1, 1,
-0.4049515, -0.2331305, -3.628352, 1, 1, 1, 1, 1,
-0.4022126, 1.694364, 0.2927134, 1, 1, 1, 1, 1,
-0.4016208, 0.7325143, -0.8759894, 1, 1, 1, 1, 1,
-0.4001423, -1.423441, -3.571893, 0, 0, 1, 1, 1,
-0.3984731, -0.6765121, -1.781795, 1, 0, 0, 1, 1,
-0.3977384, 0.1988322, -1.269814, 1, 0, 0, 1, 1,
-0.3968313, 0.6046692, -1.22491, 1, 0, 0, 1, 1,
-0.3920468, 0.366864, -1.656068, 1, 0, 0, 1, 1,
-0.3917508, -0.2033174, -3.670781, 1, 0, 0, 1, 1,
-0.3913434, -1.639544, -3.959501, 0, 0, 0, 1, 1,
-0.3787175, -1.226195, -1.133423, 0, 0, 0, 1, 1,
-0.3738619, -1.039126, -2.828593, 0, 0, 0, 1, 1,
-0.3725913, -0.6661391, -1.193069, 0, 0, 0, 1, 1,
-0.3657844, 1.17016, -0.8566127, 0, 0, 0, 1, 1,
-0.3649665, 0.727114, -1.406983, 0, 0, 0, 1, 1,
-0.3637292, -2.269612, -2.048455, 0, 0, 0, 1, 1,
-0.3624454, 1.597466, -0.2850406, 1, 1, 1, 1, 1,
-0.3588617, -0.1017833, -1.896678, 1, 1, 1, 1, 1,
-0.3555519, -1.338372, -2.798951, 1, 1, 1, 1, 1,
-0.3514103, 1.071064, 0.5547605, 1, 1, 1, 1, 1,
-0.3508991, 1.054077, -0.390299, 1, 1, 1, 1, 1,
-0.3504349, -1.05993, -2.801651, 1, 1, 1, 1, 1,
-0.3453776, 0.1338094, -1.058237, 1, 1, 1, 1, 1,
-0.3385274, -0.8269264, -2.397261, 1, 1, 1, 1, 1,
-0.3313465, -1.416346, -3.253558, 1, 1, 1, 1, 1,
-0.3310381, 0.9268439, -1.198778, 1, 1, 1, 1, 1,
-0.3307703, -1.667802, -3.755747, 1, 1, 1, 1, 1,
-0.3288615, 0.7856311, -0.08680885, 1, 1, 1, 1, 1,
-0.3288195, -0.767321, -2.966222, 1, 1, 1, 1, 1,
-0.3278422, -0.6793637, -1.247065, 1, 1, 1, 1, 1,
-0.3252707, -0.988726, -0.7550909, 1, 1, 1, 1, 1,
-0.3231706, -1.347835, -3.23131, 0, 0, 1, 1, 1,
-0.3231189, 1.340324, 1.13948, 1, 0, 0, 1, 1,
-0.3230996, -0.4391627, -0.6642369, 1, 0, 0, 1, 1,
-0.3200924, -1.415055, -3.051853, 1, 0, 0, 1, 1,
-0.3112375, 1.494297, 0.2919434, 1, 0, 0, 1, 1,
-0.3091284, -0.4350188, -2.421475, 1, 0, 0, 1, 1,
-0.3073544, -0.4240558, -2.518907, 0, 0, 0, 1, 1,
-0.3069902, -0.4578536, -3.838137, 0, 0, 0, 1, 1,
-0.304903, -0.144218, -1.217457, 0, 0, 0, 1, 1,
-0.30192, 0.3790832, 0.01555299, 0, 0, 0, 1, 1,
-0.2964114, 0.4513741, 0.7447222, 0, 0, 0, 1, 1,
-0.2962309, -0.7621946, -3.623179, 0, 0, 0, 1, 1,
-0.2958341, 1.011316, -0.05871996, 0, 0, 0, 1, 1,
-0.2915876, -0.8921106, -4.036376, 1, 1, 1, 1, 1,
-0.2878814, -1.647897, -2.15935, 1, 1, 1, 1, 1,
-0.2839057, -1.014128, -2.676995, 1, 1, 1, 1, 1,
-0.2829828, 0.3492224, -2.006301, 1, 1, 1, 1, 1,
-0.2823447, 1.190122, -1.954834, 1, 1, 1, 1, 1,
-0.2801101, 0.7821979, 1.172858, 1, 1, 1, 1, 1,
-0.2751797, -0.3806342, -0.3680675, 1, 1, 1, 1, 1,
-0.2745299, -1.475766, -3.053273, 1, 1, 1, 1, 1,
-0.2700765, 0.253732, -0.3289708, 1, 1, 1, 1, 1,
-0.2679242, 0.2980391, -1.722655, 1, 1, 1, 1, 1,
-0.2659077, 0.3744679, -1.563298, 1, 1, 1, 1, 1,
-0.2608267, -0.3321398, -1.053493, 1, 1, 1, 1, 1,
-0.2595344, 1.195487, -1.091276, 1, 1, 1, 1, 1,
-0.2585735, -0.4189635, -1.16441, 1, 1, 1, 1, 1,
-0.249457, 1.438742, 1.960471, 1, 1, 1, 1, 1,
-0.2493572, 1.530869, -0.5721216, 0, 0, 1, 1, 1,
-0.2462777, -0.163067, -1.560085, 1, 0, 0, 1, 1,
-0.2427494, -0.8471966, -2.763316, 1, 0, 0, 1, 1,
-0.2287395, 0.1806546, -1.408542, 1, 0, 0, 1, 1,
-0.2287265, -0.9159135, -4.62412, 1, 0, 0, 1, 1,
-0.2270147, -0.3649964, -1.007707, 1, 0, 0, 1, 1,
-0.2251792, -1.435148, -3.711492, 0, 0, 0, 1, 1,
-0.2236287, 0.5025633, -0.2011238, 0, 0, 0, 1, 1,
-0.2217724, 0.4874626, 0.3681111, 0, 0, 0, 1, 1,
-0.2216029, -0.8029646, -2.003405, 0, 0, 0, 1, 1,
-0.2183537, -1.256073, -2.742023, 0, 0, 0, 1, 1,
-0.217121, -0.6645842, -3.675805, 0, 0, 0, 1, 1,
-0.2116701, 0.8530704, 0.5288155, 0, 0, 0, 1, 1,
-0.2104644, 0.2439542, 0.4459252, 1, 1, 1, 1, 1,
-0.2061742, 0.8888239, 0.5121641, 1, 1, 1, 1, 1,
-0.2057754, 1.302791, -1.635866, 1, 1, 1, 1, 1,
-0.2027095, 1.231193, 0.8556294, 1, 1, 1, 1, 1,
-0.2004737, -0.4811375, -2.592262, 1, 1, 1, 1, 1,
-0.1988186, -1.226666, -3.657081, 1, 1, 1, 1, 1,
-0.1964865, 0.7655663, -0.8612836, 1, 1, 1, 1, 1,
-0.1950262, -0.1455649, -3.726628, 1, 1, 1, 1, 1,
-0.1915141, -0.8309717, -3.542081, 1, 1, 1, 1, 1,
-0.1898464, 1.61764, -0.7380466, 1, 1, 1, 1, 1,
-0.1888229, -0.672856, -5.302457, 1, 1, 1, 1, 1,
-0.1888156, 0.3685011, 0.500874, 1, 1, 1, 1, 1,
-0.1887057, 0.6034229, 0.3159115, 1, 1, 1, 1, 1,
-0.1846509, -0.3678032, -1.405931, 1, 1, 1, 1, 1,
-0.1833846, 1.823577, -0.0072699, 1, 1, 1, 1, 1,
-0.1801434, -0.3105351, -2.444863, 0, 0, 1, 1, 1,
-0.1800365, 0.1340153, -0.644316, 1, 0, 0, 1, 1,
-0.1784141, 0.7662064, 1.084932, 1, 0, 0, 1, 1,
-0.1772948, -0.6690995, -2.985906, 1, 0, 0, 1, 1,
-0.1712542, -1.133095, -4.469775, 1, 0, 0, 1, 1,
-0.1690931, -0.8411418, -2.723924, 1, 0, 0, 1, 1,
-0.1685441, -0.4777872, -4.05307, 0, 0, 0, 1, 1,
-0.1673432, 1.068239, 0.4053626, 0, 0, 0, 1, 1,
-0.1653576, 1.93832, 0.348933, 0, 0, 0, 1, 1,
-0.161835, 0.9130946, -0.05790763, 0, 0, 0, 1, 1,
-0.1578695, 0.1851058, 1.293907, 0, 0, 0, 1, 1,
-0.1566765, 0.7528811, -2.038036, 0, 0, 0, 1, 1,
-0.1526876, 0.4681385, -0.9310609, 0, 0, 0, 1, 1,
-0.1512029, -1.510123, -1.92645, 1, 1, 1, 1, 1,
-0.1502908, -0.8842896, -2.589002, 1, 1, 1, 1, 1,
-0.1497449, -0.6276249, -4.225191, 1, 1, 1, 1, 1,
-0.1485812, -0.5678701, -3.502088, 1, 1, 1, 1, 1,
-0.1477354, -2.021204, -2.452033, 1, 1, 1, 1, 1,
-0.1475389, -0.8448772, -2.817154, 1, 1, 1, 1, 1,
-0.1461098, 0.3720702, -0.7014766, 1, 1, 1, 1, 1,
-0.1417513, 0.3003655, -0.4251814, 1, 1, 1, 1, 1,
-0.1411017, 1.370573, 0.3887647, 1, 1, 1, 1, 1,
-0.1349323, 0.3345701, 0.1002399, 1, 1, 1, 1, 1,
-0.134905, 0.2830513, -0.1285213, 1, 1, 1, 1, 1,
-0.1348079, -0.8911445, -1.164595, 1, 1, 1, 1, 1,
-0.133899, 0.5589153, 0.1219798, 1, 1, 1, 1, 1,
-0.1335346, 0.3606051, -0.698698, 1, 1, 1, 1, 1,
-0.1297026, -0.1457994, -3.050661, 1, 1, 1, 1, 1,
-0.1280076, -2.614799, -2.680137, 0, 0, 1, 1, 1,
-0.1277717, -0.4491986, -3.281632, 1, 0, 0, 1, 1,
-0.1268565, -1.61551, -3.061731, 1, 0, 0, 1, 1,
-0.1240278, -0.5062514, -2.366593, 1, 0, 0, 1, 1,
-0.1179978, 1.263091, -0.1690904, 1, 0, 0, 1, 1,
-0.1179277, 2.374795, 0.3925779, 1, 0, 0, 1, 1,
-0.1144351, -0.1359265, -4.062407, 0, 0, 0, 1, 1,
-0.1124181, 1.069496, -0.1939804, 0, 0, 0, 1, 1,
-0.1104976, 0.7171438, 0.52507, 0, 0, 0, 1, 1,
-0.1089484, 0.769251, 0.1312982, 0, 0, 0, 1, 1,
-0.09961978, -1.092876, -4.742276, 0, 0, 0, 1, 1,
-0.09857409, 0.5356285, -0.463814, 0, 0, 0, 1, 1,
-0.0944361, -0.5564141, -2.35484, 0, 0, 0, 1, 1,
-0.09333605, -0.0997548, -2.165234, 1, 1, 1, 1, 1,
-0.09000947, 0.2185072, -0.7934334, 1, 1, 1, 1, 1,
-0.08859622, -0.9865026, -3.068338, 1, 1, 1, 1, 1,
-0.08763354, 1.74436, 0.2461379, 1, 1, 1, 1, 1,
-0.07193647, 0.1648922, -0.9311686, 1, 1, 1, 1, 1,
-0.05961083, -1.353798, -2.627863, 1, 1, 1, 1, 1,
-0.05836489, 0.6655203, 0.2910368, 1, 1, 1, 1, 1,
-0.05619074, 0.4767039, -0.91133, 1, 1, 1, 1, 1,
-0.05509635, 0.795741, -1.107827, 1, 1, 1, 1, 1,
-0.05398785, 1.729437, -0.6361508, 1, 1, 1, 1, 1,
-0.05241768, 0.4958666, 0.2638448, 1, 1, 1, 1, 1,
-0.05193008, 0.5698829, -2.627115, 1, 1, 1, 1, 1,
-0.05143778, 1.418193, -0.03890904, 1, 1, 1, 1, 1,
-0.04757282, -0.8016763, -2.541701, 1, 1, 1, 1, 1,
-0.04716877, -0.6811221, -3.012842, 1, 1, 1, 1, 1,
-0.04350149, -1.198077, -4.05543, 0, 0, 1, 1, 1,
-0.04300372, -0.2696922, -2.448385, 1, 0, 0, 1, 1,
-0.03909282, -0.5374838, -2.997276, 1, 0, 0, 1, 1,
-0.0342356, 0.9772026, -1.096539, 1, 0, 0, 1, 1,
-0.03309114, -0.1069533, -1.944008, 1, 0, 0, 1, 1,
-0.03089228, -0.9745401, -3.215858, 1, 0, 0, 1, 1,
-0.02966067, 0.1179018, -0.6182424, 0, 0, 0, 1, 1,
-0.02928298, -0.8139387, -3.9719, 0, 0, 0, 1, 1,
-0.0230392, -0.7590199, -1.92278, 0, 0, 0, 1, 1,
-0.02243599, 0.37426, -1.847913, 0, 0, 0, 1, 1,
-0.02068901, 0.3203594, 0.8720444, 0, 0, 0, 1, 1,
-0.019958, -0.5585248, -2.93369, 0, 0, 0, 1, 1,
-0.01921757, 1.689234, -1.100362, 0, 0, 0, 1, 1,
-0.01746717, -0.398075, -4.4105, 1, 1, 1, 1, 1,
-0.01438203, 0.4603429, -0.5400962, 1, 1, 1, 1, 1,
-0.01098194, 0.08495184, -0.2226735, 1, 1, 1, 1, 1,
-0.009603457, -1.170609, -2.772745, 1, 1, 1, 1, 1,
-0.008980159, -1.626432, -1.875011, 1, 1, 1, 1, 1,
-0.007669184, 0.7473239, 0.6202406, 1, 1, 1, 1, 1,
-0.006133601, -0.7847666, -1.345515, 1, 1, 1, 1, 1,
-0.005274601, -0.2177557, -3.109584, 1, 1, 1, 1, 1,
-0.002912569, 2.630233, -0.3902387, 1, 1, 1, 1, 1,
-0.0003708741, -0.3836564, -1.436997, 1, 1, 1, 1, 1,
4.088228e-05, 1.000076, 1.28791, 1, 1, 1, 1, 1,
0.005416683, 2.271748, 2.540052, 1, 1, 1, 1, 1,
0.005604878, -0.3071071, 2.205654, 1, 1, 1, 1, 1,
0.006929177, -0.6762158, 3.616352, 1, 1, 1, 1, 1,
0.007756232, 1.027209, -1.456301, 1, 1, 1, 1, 1,
0.00825836, -1.613459, 1.699455, 0, 0, 1, 1, 1,
0.01889641, 0.2617938, 0.06644442, 1, 0, 0, 1, 1,
0.01901758, 0.5675036, 0.548565, 1, 0, 0, 1, 1,
0.0205397, 0.3520289, 1.166932, 1, 0, 0, 1, 1,
0.02124781, 0.7271675, -0.4295954, 1, 0, 0, 1, 1,
0.02181001, 1.100715, -0.8928201, 1, 0, 0, 1, 1,
0.02417305, -2.078928, 0.910992, 0, 0, 0, 1, 1,
0.02479791, -1.709573, 3.687405, 0, 0, 0, 1, 1,
0.02586952, -0.4808153, 2.540238, 0, 0, 0, 1, 1,
0.0264471, -2.208619, 3.607811, 0, 0, 0, 1, 1,
0.03356477, -1.019335, 3.868704, 0, 0, 0, 1, 1,
0.03410159, -0.6667604, 2.402871, 0, 0, 0, 1, 1,
0.04109396, 0.05543896, 0.9995379, 0, 0, 0, 1, 1,
0.04336699, 0.2232215, 0.3898087, 1, 1, 1, 1, 1,
0.04356392, 0.9947434, -1.915955, 1, 1, 1, 1, 1,
0.05096307, -0.09603505, 3.151741, 1, 1, 1, 1, 1,
0.05161944, -1.811264, 4.396549, 1, 1, 1, 1, 1,
0.05279964, -0.3298202, 1.780709, 1, 1, 1, 1, 1,
0.06036707, 1.245335, 0.1180376, 1, 1, 1, 1, 1,
0.06475589, 0.394591, 0.42555, 1, 1, 1, 1, 1,
0.06726283, -0.4292403, 1.832006, 1, 1, 1, 1, 1,
0.06732702, 0.8411102, -0.5117255, 1, 1, 1, 1, 1,
0.07004914, -0.3450836, 2.577088, 1, 1, 1, 1, 1,
0.07065692, -0.5100292, 1.89639, 1, 1, 1, 1, 1,
0.07628302, -0.7310804, 3.565905, 1, 1, 1, 1, 1,
0.0779434, -0.3864125, 3.676101, 1, 1, 1, 1, 1,
0.07977651, 0.608482, 1.482962, 1, 1, 1, 1, 1,
0.08049703, 0.7022648, -0.414449, 1, 1, 1, 1, 1,
0.08192757, 1.303249, -1.252248, 0, 0, 1, 1, 1,
0.08293287, -0.6336114, 3.297787, 1, 0, 0, 1, 1,
0.08362749, -0.3058833, 2.471742, 1, 0, 0, 1, 1,
0.08460641, 1.619553, 0.8088683, 1, 0, 0, 1, 1,
0.09112176, -0.3643981, 2.52503, 1, 0, 0, 1, 1,
0.09642296, 1.907844, -0.4091571, 1, 0, 0, 1, 1,
0.09696735, 1.846822, 0.581941, 0, 0, 0, 1, 1,
0.1039909, 0.6611579, 0.9898273, 0, 0, 0, 1, 1,
0.1065411, -0.9898035, 1.523592, 0, 0, 0, 1, 1,
0.1067398, -0.2549919, 3.380524, 0, 0, 0, 1, 1,
0.1085976, -0.4693639, 2.443247, 0, 0, 0, 1, 1,
0.1098659, -1.795475, 2.539196, 0, 0, 0, 1, 1,
0.11415, -0.3707986, 3.858996, 0, 0, 0, 1, 1,
0.1150251, -1.016972, 1.787912, 1, 1, 1, 1, 1,
0.1209104, 0.5153642, -0.8382078, 1, 1, 1, 1, 1,
0.1213806, -2.229383, 1.328814, 1, 1, 1, 1, 1,
0.12684, -0.1319833, 1.475597, 1, 1, 1, 1, 1,
0.1278702, -1.288418, 2.196671, 1, 1, 1, 1, 1,
0.1288748, -1.996135, 3.56748, 1, 1, 1, 1, 1,
0.1320532, 1.870773, 0.9815643, 1, 1, 1, 1, 1,
0.1362183, 0.5748836, 0.09229135, 1, 1, 1, 1, 1,
0.1454112, 0.5433747, -0.9438685, 1, 1, 1, 1, 1,
0.1466317, -0.6433647, 2.126234, 1, 1, 1, 1, 1,
0.1518206, -1.911306, 2.730539, 1, 1, 1, 1, 1,
0.1521344, -1.573537, 2.919367, 1, 1, 1, 1, 1,
0.1527753, 0.1223349, 0.2144459, 1, 1, 1, 1, 1,
0.1559311, 0.4354368, 0.4455049, 1, 1, 1, 1, 1,
0.1581086, 0.8024997, 1.133716, 1, 1, 1, 1, 1,
0.1627499, -1.019309, 2.95612, 0, 0, 1, 1, 1,
0.1640604, -0.4228411, 1.823072, 1, 0, 0, 1, 1,
0.1643271, -0.1487342, 2.50473, 1, 0, 0, 1, 1,
0.1651316, -0.2382807, 1.772559, 1, 0, 0, 1, 1,
0.1662154, -0.5679933, 1.507644, 1, 0, 0, 1, 1,
0.169737, -0.0471636, 1.843275, 1, 0, 0, 1, 1,
0.1697786, 0.2063816, 0.8374392, 0, 0, 0, 1, 1,
0.1699275, 0.7773683, 1.81067, 0, 0, 0, 1, 1,
0.1748516, 0.208882, 0.342162, 0, 0, 0, 1, 1,
0.1761693, 0.5939041, 0.9013685, 0, 0, 0, 1, 1,
0.1797861, 1.399406, 0.07916161, 0, 0, 0, 1, 1,
0.1817221, 1.315501, 2.256749, 0, 0, 0, 1, 1,
0.1851321, -0.3358926, 3.484803, 0, 0, 0, 1, 1,
0.1905088, -0.08386629, 2.204031, 1, 1, 1, 1, 1,
0.1982931, -0.6462147, 3.916598, 1, 1, 1, 1, 1,
0.2025884, 1.294651, 1.726184, 1, 1, 1, 1, 1,
0.2050338, -1.904371, 1.560506, 1, 1, 1, 1, 1,
0.2063012, -0.7128788, 2.5775, 1, 1, 1, 1, 1,
0.2063753, 0.3176905, -0.3971213, 1, 1, 1, 1, 1,
0.2078201, -0.3981723, 2.88321, 1, 1, 1, 1, 1,
0.2155867, -0.06085882, 2.530439, 1, 1, 1, 1, 1,
0.2180857, -0.1307764, 3.457416, 1, 1, 1, 1, 1,
0.2240697, -0.9328817, 1.156952, 1, 1, 1, 1, 1,
0.2241762, -0.4739584, 2.536564, 1, 1, 1, 1, 1,
0.2267224, -0.2435842, 2.284951, 1, 1, 1, 1, 1,
0.2267874, 0.4310022, -0.9369123, 1, 1, 1, 1, 1,
0.227978, -0.6171288, 2.939253, 1, 1, 1, 1, 1,
0.23199, -0.679214, 2.337634, 1, 1, 1, 1, 1,
0.2321959, 0.478382, -1.240177, 0, 0, 1, 1, 1,
0.2359824, 1.115631, 1.185811, 1, 0, 0, 1, 1,
0.2398306, 0.570184, 1.390723, 1, 0, 0, 1, 1,
0.2407922, -0.216735, 3.785393, 1, 0, 0, 1, 1,
0.241894, 0.004972789, 1.215449, 1, 0, 0, 1, 1,
0.2424797, 0.6278619, -0.399491, 1, 0, 0, 1, 1,
0.2463613, -0.4009177, 3.592358, 0, 0, 0, 1, 1,
0.2472292, -1.036981, 2.29133, 0, 0, 0, 1, 1,
0.2478467, -0.7151298, 3.470902, 0, 0, 0, 1, 1,
0.2512469, -0.4447196, 2.1186, 0, 0, 0, 1, 1,
0.251581, 0.2772321, 1.512974, 0, 0, 0, 1, 1,
0.2555051, -0.8126708, 3.324568, 0, 0, 0, 1, 1,
0.2559849, 1.004791, -2.084143, 0, 0, 0, 1, 1,
0.2559914, 0.01656449, 1.455515, 1, 1, 1, 1, 1,
0.257386, -1.074301, 5.426361, 1, 1, 1, 1, 1,
0.2590231, 0.6940951, 0.215453, 1, 1, 1, 1, 1,
0.2593063, -0.2418212, 2.43682, 1, 1, 1, 1, 1,
0.259961, -0.4410281, 2.135361, 1, 1, 1, 1, 1,
0.2616126, -0.495695, 2.312006, 1, 1, 1, 1, 1,
0.2639136, -1.005242, 2.489677, 1, 1, 1, 1, 1,
0.2708719, -1.440763, 0.3708585, 1, 1, 1, 1, 1,
0.2732607, -0.9103738, 3.865013, 1, 1, 1, 1, 1,
0.2763579, 1.57633, 1.327698, 1, 1, 1, 1, 1,
0.2858442, -0.1394671, 2.693478, 1, 1, 1, 1, 1,
0.2891171, -0.457506, 3.273086, 1, 1, 1, 1, 1,
0.2928074, 1.601444, 0.7465404, 1, 1, 1, 1, 1,
0.2935141, -2.042954, 3.247866, 1, 1, 1, 1, 1,
0.2940463, -0.5285116, 1.803403, 1, 1, 1, 1, 1,
0.2958531, -1.444348, 1.232353, 0, 0, 1, 1, 1,
0.2962397, -1.155965, 3.344643, 1, 0, 0, 1, 1,
0.2988411, 1.1387, -0.4100051, 1, 0, 0, 1, 1,
0.3000045, -0.9611234, 4.528828, 1, 0, 0, 1, 1,
0.3031138, 0.8775616, 1.087656, 1, 0, 0, 1, 1,
0.3033828, 0.7024599, 0.6896872, 1, 0, 0, 1, 1,
0.3066679, 0.2294004, 0.08380949, 0, 0, 0, 1, 1,
0.3070607, -0.08450843, 1.420388, 0, 0, 0, 1, 1,
0.3102872, 1.34229, 1.043608, 0, 0, 0, 1, 1,
0.3168336, 0.6577101, -0.2838696, 0, 0, 0, 1, 1,
0.3172391, 0.9501036, 2.978898, 0, 0, 0, 1, 1,
0.3245835, -0.1437954, 1.752942, 0, 0, 0, 1, 1,
0.3250751, -1.015806, 1.873015, 0, 0, 0, 1, 1,
0.332318, -1.134242, 2.474856, 1, 1, 1, 1, 1,
0.3357675, 0.2092812, -1.305636, 1, 1, 1, 1, 1,
0.3415993, 0.533703, 0.7654337, 1, 1, 1, 1, 1,
0.3417127, -0.259339, 2.948976, 1, 1, 1, 1, 1,
0.3433694, -0.2636549, 2.23672, 1, 1, 1, 1, 1,
0.3476716, 0.2212886, 2.485504, 1, 1, 1, 1, 1,
0.3480309, -0.2505631, -0.4921034, 1, 1, 1, 1, 1,
0.3483925, 0.8569322, -0.2963999, 1, 1, 1, 1, 1,
0.3501299, -1.128269, 3.703083, 1, 1, 1, 1, 1,
0.3534642, 0.4373867, -0.7111307, 1, 1, 1, 1, 1,
0.3542436, 0.1721872, 0.3436447, 1, 1, 1, 1, 1,
0.3585011, 0.8818568, -0.6984237, 1, 1, 1, 1, 1,
0.366074, -1.463718, 3.002543, 1, 1, 1, 1, 1,
0.3671967, 0.4424847, 1.361505, 1, 1, 1, 1, 1,
0.3673698, 0.7204506, -0.539088, 1, 1, 1, 1, 1,
0.3690445, -0.3435188, 0.9901777, 0, 0, 1, 1, 1,
0.370016, -1.466459, 1.288474, 1, 0, 0, 1, 1,
0.3728788, -0.7138532, 3.741345, 1, 0, 0, 1, 1,
0.3775888, -2.556205, 3.839739, 1, 0, 0, 1, 1,
0.3797507, 0.2985136, 0.3879848, 1, 0, 0, 1, 1,
0.3820783, 1.138714, 0.736232, 1, 0, 0, 1, 1,
0.3837951, 0.3530869, 0.2945186, 0, 0, 0, 1, 1,
0.3857064, 0.3802238, 0.3977964, 0, 0, 0, 1, 1,
0.3864089, 0.185504, 1.46515, 0, 0, 0, 1, 1,
0.3898261, -0.9367592, 3.387814, 0, 0, 0, 1, 1,
0.3939466, 1.238224, 0.4699704, 0, 0, 0, 1, 1,
0.3990377, -0.8340269, 2.636523, 0, 0, 0, 1, 1,
0.401105, 1.078632, 2.152847, 0, 0, 0, 1, 1,
0.410609, 1.013145, 0.6458606, 1, 1, 1, 1, 1,
0.4120814, -0.8563855, 3.118929, 1, 1, 1, 1, 1,
0.4185563, -0.9575503, 3.22351, 1, 1, 1, 1, 1,
0.4232714, -2.389316, 3.013308, 1, 1, 1, 1, 1,
0.424334, -0.5356284, 2.253634, 1, 1, 1, 1, 1,
0.4263882, 0.9381083, -0.2092336, 1, 1, 1, 1, 1,
0.4266432, 1.217761, -0.8731862, 1, 1, 1, 1, 1,
0.4274772, -0.6313303, 1.70727, 1, 1, 1, 1, 1,
0.4326958, 2.024624, -1.651684, 1, 1, 1, 1, 1,
0.4351063, 1.559577, -0.07351058, 1, 1, 1, 1, 1,
0.4377136, 0.7587992, 2.493886, 1, 1, 1, 1, 1,
0.4386943, 1.957452, -0.4964626, 1, 1, 1, 1, 1,
0.4404677, 0.2716427, 0.5719625, 1, 1, 1, 1, 1,
0.445558, 1.673768, -0.6241387, 1, 1, 1, 1, 1,
0.4479638, 0.0271478, 1.80969, 1, 1, 1, 1, 1,
0.4489304, -0.5923773, 2.390756, 0, 0, 1, 1, 1,
0.45709, -0.08953241, 0.9762971, 1, 0, 0, 1, 1,
0.4614765, -0.8697264, 1.521904, 1, 0, 0, 1, 1,
0.4639556, 0.8266034, 2.091272, 1, 0, 0, 1, 1,
0.4691756, -0.6009145, 3.191609, 1, 0, 0, 1, 1,
0.4743431, -0.2731465, 3.178315, 1, 0, 0, 1, 1,
0.4775568, -0.3435728, 1.495621, 0, 0, 0, 1, 1,
0.480197, -0.3665264, 1.688189, 0, 0, 0, 1, 1,
0.4852331, -0.6438543, 2.85867, 0, 0, 0, 1, 1,
0.4863629, -2.074128, 3.137268, 0, 0, 0, 1, 1,
0.495151, -0.5278543, 2.831861, 0, 0, 0, 1, 1,
0.4989578, 0.9557242, 1.444322, 0, 0, 0, 1, 1,
0.5037002, -1.527314, 4.002486, 0, 0, 0, 1, 1,
0.5057831, 1.219084, -0.1852826, 1, 1, 1, 1, 1,
0.5080639, -0.6587217, 2.608238, 1, 1, 1, 1, 1,
0.5101776, 0.7004449, 1.368608, 1, 1, 1, 1, 1,
0.5152872, 0.3023835, -0.6971556, 1, 1, 1, 1, 1,
0.5179113, -0.1027782, 1.542169, 1, 1, 1, 1, 1,
0.5231453, -1.123981, 3.146644, 1, 1, 1, 1, 1,
0.5237977, 1.655905, -0.1661854, 1, 1, 1, 1, 1,
0.5264779, 0.870082, 0.9583774, 1, 1, 1, 1, 1,
0.5270376, 1.107553, 1.777793, 1, 1, 1, 1, 1,
0.5280637, 0.6794643, 1.571274, 1, 1, 1, 1, 1,
0.529604, -0.5422614, 2.406297, 1, 1, 1, 1, 1,
0.5296291, 0.6814727, -0.1580366, 1, 1, 1, 1, 1,
0.5362264, 0.7078986, -1.171565, 1, 1, 1, 1, 1,
0.537478, 0.01694005, 2.109565, 1, 1, 1, 1, 1,
0.5421172, 0.196917, 1.095978, 1, 1, 1, 1, 1,
0.5457949, -0.1053954, 2.181286, 0, 0, 1, 1, 1,
0.5508143, -0.4838073, 1.780756, 1, 0, 0, 1, 1,
0.5526195, 0.6280693, 1.943246, 1, 0, 0, 1, 1,
0.553215, 0.67853, -0.4432118, 1, 0, 0, 1, 1,
0.5544163, -0.7736205, 1.434638, 1, 0, 0, 1, 1,
0.5568458, -0.3463258, 2.409172, 1, 0, 0, 1, 1,
0.564454, -1.651599, 2.694319, 0, 0, 0, 1, 1,
0.5672341, 0.6340832, 0.7266906, 0, 0, 0, 1, 1,
0.5721942, -0.6208887, 1.225343, 0, 0, 0, 1, 1,
0.5753671, -0.2645952, 2.986356, 0, 0, 0, 1, 1,
0.5759324, -0.425015, 0.7045247, 0, 0, 0, 1, 1,
0.586773, 0.1448419, 1.319527, 0, 0, 0, 1, 1,
0.5868995, -0.1392236, 1.28544, 0, 0, 0, 1, 1,
0.5911497, 1.22157, 0.6166815, 1, 1, 1, 1, 1,
0.5923738, -2.307409, 5.499066, 1, 1, 1, 1, 1,
0.5973223, -0.07963528, 1.705259, 1, 1, 1, 1, 1,
0.603255, 0.4416903, 1.085577, 1, 1, 1, 1, 1,
0.6049425, 0.6720485, 0.7982689, 1, 1, 1, 1, 1,
0.6056921, -0.8188713, 2.656538, 1, 1, 1, 1, 1,
0.607068, 0.2245754, 1.357112, 1, 1, 1, 1, 1,
0.6109015, -0.4172734, 2.561032, 1, 1, 1, 1, 1,
0.6124553, 1.65911, -1.234189, 1, 1, 1, 1, 1,
0.6161448, -0.2844698, 2.023996, 1, 1, 1, 1, 1,
0.6180565, 0.3343597, 2.367513, 1, 1, 1, 1, 1,
0.6188374, -1.495021, 1.599177, 1, 1, 1, 1, 1,
0.6230301, -0.8827689, 3.437382, 1, 1, 1, 1, 1,
0.6247242, 0.2906176, 0.5917636, 1, 1, 1, 1, 1,
0.6258159, 0.204868, -0.3446169, 1, 1, 1, 1, 1,
0.6321727, 1.190385, 0.3174013, 0, 0, 1, 1, 1,
0.6388454, -1.432562, 2.92456, 1, 0, 0, 1, 1,
0.6401891, -0.049281, 0.8351715, 1, 0, 0, 1, 1,
0.6416036, -1.034746, 2.363914, 1, 0, 0, 1, 1,
0.6549927, -0.1268845, 2.601491, 1, 0, 0, 1, 1,
0.6557217, 0.6202874, 0.9240085, 1, 0, 0, 1, 1,
0.6586757, -0.5636818, 2.387623, 0, 0, 0, 1, 1,
0.6595159, -1.716159, 2.938586, 0, 0, 0, 1, 1,
0.6603887, -0.1243883, 2.026411, 0, 0, 0, 1, 1,
0.6686814, -1.050924, 2.696601, 0, 0, 0, 1, 1,
0.669395, 0.518743, 1.424158, 0, 0, 0, 1, 1,
0.6699959, -0.7600698, 1.467361, 0, 0, 0, 1, 1,
0.6721998, 0.007123453, 0.6182244, 0, 0, 0, 1, 1,
0.6781992, -2.973622, 1.885693, 1, 1, 1, 1, 1,
0.6855965, -0.04723923, 2.230796, 1, 1, 1, 1, 1,
0.6857436, -0.6305439, 2.255371, 1, 1, 1, 1, 1,
0.6952958, -1.124693, 2.290147, 1, 1, 1, 1, 1,
0.7018061, 1.89071, -0.943822, 1, 1, 1, 1, 1,
0.7024311, -0.07109552, 1.859482, 1, 1, 1, 1, 1,
0.7033916, 0.5475994, 2.336655, 1, 1, 1, 1, 1,
0.7074288, 2.100671, -0.6787273, 1, 1, 1, 1, 1,
0.7075427, -0.01112682, 2.207072, 1, 1, 1, 1, 1,
0.7078128, 1.272545, 0.7662163, 1, 1, 1, 1, 1,
0.7088937, 2.652267, 0.3260444, 1, 1, 1, 1, 1,
0.7107659, 2.072211, -0.9875371, 1, 1, 1, 1, 1,
0.7139313, 1.499425, 0.937328, 1, 1, 1, 1, 1,
0.7218365, 0.4277638, 1.979579, 1, 1, 1, 1, 1,
0.7323204, -1.456287, 4.619955, 1, 1, 1, 1, 1,
0.734543, 1.577322, 0.4599562, 0, 0, 1, 1, 1,
0.7366032, -2.156096, 3.530837, 1, 0, 0, 1, 1,
0.7392091, -1.948294, 2.548436, 1, 0, 0, 1, 1,
0.7458059, 0.8754395, 0.9861438, 1, 0, 0, 1, 1,
0.750393, -1.770362, 2.93042, 1, 0, 0, 1, 1,
0.7520832, 0.8317438, -0.5627889, 1, 0, 0, 1, 1,
0.7568315, -1.371088, 1.138215, 0, 0, 0, 1, 1,
0.7614895, 0.296919, 0.39906, 0, 0, 0, 1, 1,
0.7656623, 2.63292, 2.409858, 0, 0, 0, 1, 1,
0.7657225, 0.9897216, 1.912869, 0, 0, 0, 1, 1,
0.7699037, -0.51075, 2.162963, 0, 0, 0, 1, 1,
0.7711107, -0.8202769, 3.587398, 0, 0, 0, 1, 1,
0.783533, 0.7583672, -0.3177678, 0, 0, 0, 1, 1,
0.7839594, 0.2263817, 1.337988, 1, 1, 1, 1, 1,
0.7869756, 0.196429, 2.423147, 1, 1, 1, 1, 1,
0.7876749, 0.7251036, 1.527351, 1, 1, 1, 1, 1,
0.7888011, -0.6009596, 0.5552773, 1, 1, 1, 1, 1,
0.7905431, -0.1977683, 2.716542, 1, 1, 1, 1, 1,
0.7916462, 0.664327, 1.616409, 1, 1, 1, 1, 1,
0.7926506, -1.655335, 3.653374, 1, 1, 1, 1, 1,
0.8018391, 0.02249613, 3.824998, 1, 1, 1, 1, 1,
0.8041705, -1.248783, 1.922461, 1, 1, 1, 1, 1,
0.8065041, 0.4132581, 0.9192709, 1, 1, 1, 1, 1,
0.8086064, 0.06602864, 0.5076751, 1, 1, 1, 1, 1,
0.8087736, 2.802581, -0.2819368, 1, 1, 1, 1, 1,
0.8092114, -1.144082, 2.802375, 1, 1, 1, 1, 1,
0.8127512, 1.237416, 0.4180716, 1, 1, 1, 1, 1,
0.8143028, -0.3270738, 1.899412, 1, 1, 1, 1, 1,
0.8163062, 0.1581279, -0.2339784, 0, 0, 1, 1, 1,
0.8250879, -2.252189, 2.059998, 1, 0, 0, 1, 1,
0.8309093, 0.9975639, 1.476368, 1, 0, 0, 1, 1,
0.831209, 1.48879, 2.159082, 1, 0, 0, 1, 1,
0.8321488, 0.3066982, 1.030292, 1, 0, 0, 1, 1,
0.8336906, 1.027305, 1.324715, 1, 0, 0, 1, 1,
0.8342334, -0.322006, 2.163976, 0, 0, 0, 1, 1,
0.8367588, 0.07041946, 0.1638233, 0, 0, 0, 1, 1,
0.8378915, 0.3705847, 0.8328355, 0, 0, 0, 1, 1,
0.8431768, -0.6011457, 1.42511, 0, 0, 0, 1, 1,
0.8440706, 0.5969671, 0.2326921, 0, 0, 0, 1, 1,
0.8457624, -0.9824087, 2.28821, 0, 0, 0, 1, 1,
0.8465789, 0.1496344, 1.220271, 0, 0, 0, 1, 1,
0.8644187, 0.4149001, 0.8605929, 1, 1, 1, 1, 1,
0.875586, 1.479105, 0.8027751, 1, 1, 1, 1, 1,
0.8801142, -0.02528512, 1.946864, 1, 1, 1, 1, 1,
0.8807139, 1.137721, 0.07610041, 1, 1, 1, 1, 1,
0.8810567, 0.6226037, -1.583018, 1, 1, 1, 1, 1,
0.8816046, 0.357847, 0.2929479, 1, 1, 1, 1, 1,
0.8817221, -1.356514, 3.286486, 1, 1, 1, 1, 1,
0.8865163, 1.084999, -0.06200023, 1, 1, 1, 1, 1,
0.8884795, -1.494279, 3.517236, 1, 1, 1, 1, 1,
0.8908697, -0.07959887, 2.598101, 1, 1, 1, 1, 1,
0.8946164, -1.425049, 3.576212, 1, 1, 1, 1, 1,
0.8957829, 0.7533437, -0.5601531, 1, 1, 1, 1, 1,
0.8995552, -0.654761, 0.4441923, 1, 1, 1, 1, 1,
0.9000393, 1.298336, -0.08269437, 1, 1, 1, 1, 1,
0.9072191, 0.09307486, 2.111383, 1, 1, 1, 1, 1,
0.9103016, 1.763079, 0.4703495, 0, 0, 1, 1, 1,
0.9149588, 0.03863928, 2.3203, 1, 0, 0, 1, 1,
0.9151733, -0.4625466, 1.82444, 1, 0, 0, 1, 1,
0.915592, 0.7620996, 0.6932792, 1, 0, 0, 1, 1,
0.9184781, -0.0653945, 1.024957, 1, 0, 0, 1, 1,
0.9201109, -0.164094, 2.45914, 1, 0, 0, 1, 1,
0.92146, -0.3687415, 2.348431, 0, 0, 0, 1, 1,
0.9286017, -2.025807, 3.26122, 0, 0, 0, 1, 1,
0.93309, -1.253297, 3.301877, 0, 0, 0, 1, 1,
0.9345545, 1.139037, 1.122287, 0, 0, 0, 1, 1,
0.9363371, 0.008132898, 0.8326544, 0, 0, 0, 1, 1,
0.9429355, -0.7375387, 1.807523, 0, 0, 0, 1, 1,
0.943849, -0.7455862, 2.298696, 0, 0, 0, 1, 1,
0.950985, 1.383527, 0.1257801, 1, 1, 1, 1, 1,
0.9618152, -0.9779693, 3.493889, 1, 1, 1, 1, 1,
0.9625255, -0.2104018, 1.448413, 1, 1, 1, 1, 1,
0.9638022, -0.570354, 1.580598, 1, 1, 1, 1, 1,
0.9677339, -0.1281551, 1.8111, 1, 1, 1, 1, 1,
0.9761174, 0.1617505, 0.3720287, 1, 1, 1, 1, 1,
0.986488, 1.576644, 2.175404, 1, 1, 1, 1, 1,
0.9939443, -0.7074588, 0.3064488, 1, 1, 1, 1, 1,
0.9966257, -0.353978, 3.01121, 1, 1, 1, 1, 1,
1.004036, -2.191613, 4.245269, 1, 1, 1, 1, 1,
1.005387, -1.072441, 2.955719, 1, 1, 1, 1, 1,
1.010294, 1.226377, 1.255107, 1, 1, 1, 1, 1,
1.023345, 0.3170537, 0.5086939, 1, 1, 1, 1, 1,
1.029821, 0.01618179, -0.4741686, 1, 1, 1, 1, 1,
1.033952, -0.5770313, 1.467516, 1, 1, 1, 1, 1,
1.034051, -0.3264706, 2.303021, 0, 0, 1, 1, 1,
1.034697, 0.9521848, 2.665089, 1, 0, 0, 1, 1,
1.039381, -0.2522714, 2.589184, 1, 0, 0, 1, 1,
1.041445, 0.4636137, 1.787145, 1, 0, 0, 1, 1,
1.044304, -0.1988873, 0.6619689, 1, 0, 0, 1, 1,
1.0491, 1.141792, 0.08912596, 1, 0, 0, 1, 1,
1.055891, -0.5831179, 2.210316, 0, 0, 0, 1, 1,
1.057201, -1.768658, 4.858111, 0, 0, 0, 1, 1,
1.058455, -0.8220381, 1.174827, 0, 0, 0, 1, 1,
1.062478, -2.036443, 2.851001, 0, 0, 0, 1, 1,
1.06338, 1.354381, 0.2826601, 0, 0, 0, 1, 1,
1.069704, -1.248557, 2.973585, 0, 0, 0, 1, 1,
1.075955, -1.083318, 0.3671657, 0, 0, 0, 1, 1,
1.077924, -1.938243, 3.147948, 1, 1, 1, 1, 1,
1.079501, 0.8283319, 2.151102, 1, 1, 1, 1, 1,
1.087138, -0.7092918, 2.620958, 1, 1, 1, 1, 1,
1.099803, -0.75739, 3.735836, 1, 1, 1, 1, 1,
1.108037, 0.31008, 2.542144, 1, 1, 1, 1, 1,
1.108359, -1.32903, 0.876259, 1, 1, 1, 1, 1,
1.110775, 0.1808431, 1.854532, 1, 1, 1, 1, 1,
1.110928, 0.7265218, 0.3049659, 1, 1, 1, 1, 1,
1.113001, 0.1871289, 2.177115, 1, 1, 1, 1, 1,
1.122998, 1.234555, 0.8993478, 1, 1, 1, 1, 1,
1.125139, 0.4838532, 0.6932101, 1, 1, 1, 1, 1,
1.135607, 0.03424533, 1.105559, 1, 1, 1, 1, 1,
1.136757, -0.006143711, 2.386629, 1, 1, 1, 1, 1,
1.143997, -0.5795286, 3.667025, 1, 1, 1, 1, 1,
1.144326, -1.397627, 4.600581, 1, 1, 1, 1, 1,
1.145837, 1.844784, 1.394208, 0, 0, 1, 1, 1,
1.148087, -0.1953903, 1.86367, 1, 0, 0, 1, 1,
1.149795, 0.9455773, 0.7285167, 1, 0, 0, 1, 1,
1.150907, -1.400878, 2.031596, 1, 0, 0, 1, 1,
1.153976, 0.07479237, 2.544652, 1, 0, 0, 1, 1,
1.156459, -0.5662133, 1.755984, 1, 0, 0, 1, 1,
1.158636, 0.6368928, 1.42299, 0, 0, 0, 1, 1,
1.15943, 0.005993511, 2.140356, 0, 0, 0, 1, 1,
1.170992, -0.8451818, 3.124518, 0, 0, 0, 1, 1,
1.17426, 0.3163938, -0.1148711, 0, 0, 0, 1, 1,
1.174934, 0.6869878, -1.103539, 0, 0, 0, 1, 1,
1.176571, -0.1426525, 2.123576, 0, 0, 0, 1, 1,
1.186301, 0.337163, 2.256564, 0, 0, 0, 1, 1,
1.188556, -0.8410521, 2.036139, 1, 1, 1, 1, 1,
1.197828, -0.09914177, 2.21149, 1, 1, 1, 1, 1,
1.208226, -0.1903273, 1.535771, 1, 1, 1, 1, 1,
1.210808, -0.6051804, 2.143615, 1, 1, 1, 1, 1,
1.213173, -0.06298137, 0.2072096, 1, 1, 1, 1, 1,
1.213763, -3.170847, 4.071247, 1, 1, 1, 1, 1,
1.218645, 0.4462245, 2.144206, 1, 1, 1, 1, 1,
1.226496, -0.8674222, 2.179797, 1, 1, 1, 1, 1,
1.232516, 0.1263109, 1.101126, 1, 1, 1, 1, 1,
1.232771, 0.1966396, 1.655625, 1, 1, 1, 1, 1,
1.233202, -2.503262, 1.325627, 1, 1, 1, 1, 1,
1.234014, 1.349584, 1.641044, 1, 1, 1, 1, 1,
1.24606, 1.124901, 1.036153, 1, 1, 1, 1, 1,
1.265494, -0.5345684, 2.200222, 1, 1, 1, 1, 1,
1.265644, 0.7431203, 0.7314352, 1, 1, 1, 1, 1,
1.2724, 0.7211204, 3.599742, 0, 0, 1, 1, 1,
1.276613, 0.4364216, 1.013433, 1, 0, 0, 1, 1,
1.27975, 0.6482657, 2.355425, 1, 0, 0, 1, 1,
1.279948, 0.4374429, 0.1521524, 1, 0, 0, 1, 1,
1.281531, 0.6420499, 0.169943, 1, 0, 0, 1, 1,
1.287118, 1.572087, 1.385025, 1, 0, 0, 1, 1,
1.289477, 0.1121018, 0.5292598, 0, 0, 0, 1, 1,
1.291547, -0.187448, 1.563664, 0, 0, 0, 1, 1,
1.292253, -0.2727221, 2.346214, 0, 0, 0, 1, 1,
1.30095, 0.2005549, 1.41123, 0, 0, 0, 1, 1,
1.301688, 1.250231, 1.359262, 0, 0, 0, 1, 1,
1.301857, -0.5532919, 2.332079, 0, 0, 0, 1, 1,
1.302698, 2.053457, 0.2259649, 0, 0, 0, 1, 1,
1.304822, -0.2027368, 1.448792, 1, 1, 1, 1, 1,
1.310808, 0.8407827, 1.196408, 1, 1, 1, 1, 1,
1.314262, 1.261804, -1.391945, 1, 1, 1, 1, 1,
1.32235, -0.2771979, 3.251808, 1, 1, 1, 1, 1,
1.327926, -1.564412, 4.192093, 1, 1, 1, 1, 1,
1.334368, 0.728929, 0.7019091, 1, 1, 1, 1, 1,
1.344648, 0.2564563, 1.795426, 1, 1, 1, 1, 1,
1.347925, 1.246322, 1.934441, 1, 1, 1, 1, 1,
1.34831, -1.421723, 1.827482, 1, 1, 1, 1, 1,
1.348315, 1.392048, 2.358509, 1, 1, 1, 1, 1,
1.354372, -0.7286186, 2.165549, 1, 1, 1, 1, 1,
1.360204, -1.250085, -0.0465098, 1, 1, 1, 1, 1,
1.391953, 0.6776158, -0.3386069, 1, 1, 1, 1, 1,
1.399236, 0.02968357, -0.4027607, 1, 1, 1, 1, 1,
1.429312, 0.2648722, 1.296519, 1, 1, 1, 1, 1,
1.429878, -0.606923, 1.796556, 0, 0, 1, 1, 1,
1.430447, -0.8952782, 1.631615, 1, 0, 0, 1, 1,
1.440167, 0.5816675, 1.580138, 1, 0, 0, 1, 1,
1.444617, 3.133023, 0.03112007, 1, 0, 0, 1, 1,
1.467628, -1.049644, 2.332051, 1, 0, 0, 1, 1,
1.468386, -0.2897481, -0.2921705, 1, 0, 0, 1, 1,
1.477353, 1.125128, -1.422166, 0, 0, 0, 1, 1,
1.497107, -1.158385, 3.089746, 0, 0, 0, 1, 1,
1.505137, -1.144492, 2.894909, 0, 0, 0, 1, 1,
1.510813, -0.8540207, 3.105712, 0, 0, 0, 1, 1,
1.513731, -0.1823141, 2.688985, 0, 0, 0, 1, 1,
1.520235, -1.285851, 2.524502, 0, 0, 0, 1, 1,
1.523057, 1.371289, 1.152734, 0, 0, 0, 1, 1,
1.525959, 0.007789016, 0.9526664, 1, 1, 1, 1, 1,
1.541873, -2.503472, 3.661117, 1, 1, 1, 1, 1,
1.543311, -0.5470588, 1.976567, 1, 1, 1, 1, 1,
1.543629, 0.4047964, -0.5428958, 1, 1, 1, 1, 1,
1.549632, 1.074548, -0.2105114, 1, 1, 1, 1, 1,
1.552157, 0.8223829, 0.755806, 1, 1, 1, 1, 1,
1.554678, 0.7843868, 0.1860683, 1, 1, 1, 1, 1,
1.559555, 0.9709529, -0.01155252, 1, 1, 1, 1, 1,
1.56072, 0.05401796, 2.079344, 1, 1, 1, 1, 1,
1.569677, -0.5732175, 0.6036851, 1, 1, 1, 1, 1,
1.572448, -0.04443539, 1.784487, 1, 1, 1, 1, 1,
1.572502, -0.2229161, 2.206281, 1, 1, 1, 1, 1,
1.573032, 0.2281878, 0.02178055, 1, 1, 1, 1, 1,
1.581087, 0.9694272, 0.8055585, 1, 1, 1, 1, 1,
1.584793, -0.6518627, 1.617551, 1, 1, 1, 1, 1,
1.598198, -0.5383667, 0.7332156, 0, 0, 1, 1, 1,
1.612267, 1.072551, 1.179407, 1, 0, 0, 1, 1,
1.653287, 0.867301, -0.5220865, 1, 0, 0, 1, 1,
1.663058, -0.7390536, 1.272734, 1, 0, 0, 1, 1,
1.67566, -0.2494743, 2.201839, 1, 0, 0, 1, 1,
1.681228, -0.3193389, 0.3036682, 1, 0, 0, 1, 1,
1.682788, -0.7822707, 1.242664, 0, 0, 0, 1, 1,
1.683854, 0.2640347, 0.02387495, 0, 0, 0, 1, 1,
1.705359, 1.044428, 1.957661, 0, 0, 0, 1, 1,
1.734981, -1.506857, 3.408526, 0, 0, 0, 1, 1,
1.740669, 1.077007, 2.131884, 0, 0, 0, 1, 1,
1.741715, 0.4433429, 3.319073, 0, 0, 0, 1, 1,
1.755319, 0.09593654, 2.440228, 0, 0, 0, 1, 1,
1.757807, -0.9035046, 1.949551, 1, 1, 1, 1, 1,
1.766455, -0.8687416, 2.200362, 1, 1, 1, 1, 1,
1.769896, -1.006122, 1.203591, 1, 1, 1, 1, 1,
1.776801, 1.126086, 1.540697, 1, 1, 1, 1, 1,
1.787808, -1.443583, 2.560216, 1, 1, 1, 1, 1,
1.791796, 0.6254786, 1.401785, 1, 1, 1, 1, 1,
1.806807, 0.05242198, -0.4161942, 1, 1, 1, 1, 1,
1.859007, -1.009364, 0.9018842, 1, 1, 1, 1, 1,
1.865765, 0.06207394, 1.380551, 1, 1, 1, 1, 1,
1.969492, 2.390335, -0.6429191, 1, 1, 1, 1, 1,
2.035427, -0.2955534, -0.9135203, 1, 1, 1, 1, 1,
2.038722, -0.4976217, 0.8039775, 1, 1, 1, 1, 1,
2.04389, -0.001292902, 2.107708, 1, 1, 1, 1, 1,
2.04547, -1.615054, 2.592504, 1, 1, 1, 1, 1,
2.088452, 0.5895604, 0.9492695, 1, 1, 1, 1, 1,
2.121866, 0.7417379, 1.589447, 0, 0, 1, 1, 1,
2.12206, -0.3586501, 1.172561, 1, 0, 0, 1, 1,
2.130085, 0.1745346, 0.7297909, 1, 0, 0, 1, 1,
2.182457, 0.1217571, 1.734312, 1, 0, 0, 1, 1,
2.197554, 0.2035497, -1.239136, 1, 0, 0, 1, 1,
2.229891, 0.1004297, 2.802319, 1, 0, 0, 1, 1,
2.256246, -1.129528, 2.678633, 0, 0, 0, 1, 1,
2.293817, 0.9320653, 0.6876743, 0, 0, 0, 1, 1,
2.31153, 0.4950711, 1.502793, 0, 0, 0, 1, 1,
2.338454, -0.2225229, 3.419748, 0, 0, 0, 1, 1,
2.364493, 0.4066056, -0.1924525, 0, 0, 0, 1, 1,
2.397442, -1.587963, 3.996975, 0, 0, 0, 1, 1,
2.398854, 0.591071, 1.611707, 0, 0, 0, 1, 1,
2.408207, 0.7804073, 2.840564, 1, 1, 1, 1, 1,
2.426798, -0.4982211, 0.149014, 1, 1, 1, 1, 1,
2.450249, 0.5454649, 0.6631616, 1, 1, 1, 1, 1,
2.475568, -0.5840902, 1.485513, 1, 1, 1, 1, 1,
2.658602, 0.2191937, 2.287298, 1, 1, 1, 1, 1,
2.678504, -0.2956312, 2.02676, 1, 1, 1, 1, 1,
3.158257, -2.002616, 0.7549416, 1, 1, 1, 1, 1
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
var radius = 9.823483;
var distance = 34.50457;
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
mvMatrix.translate( -0.2280918, 0.01891184, 0.3615451 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50457);
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
