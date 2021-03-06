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
-3.008126, 2.043694, -1.487023, 1, 0, 0, 1,
-2.989486, 0.5667248, -2.1358, 1, 0.007843138, 0, 1,
-2.907, 0.7353864, -1.919165, 1, 0.01176471, 0, 1,
-2.863455, -1.453591, -0.5777607, 1, 0.01960784, 0, 1,
-2.787825, -2.268801, -2.270234, 1, 0.02352941, 0, 1,
-2.663531, -0.6442914, -2.453939, 1, 0.03137255, 0, 1,
-2.651228, -0.4260057, -2.17492, 1, 0.03529412, 0, 1,
-2.631399, 0.9697257, -1.093212, 1, 0.04313726, 0, 1,
-2.421944, -0.08575884, -2.791658, 1, 0.04705882, 0, 1,
-2.371269, -0.07512808, -2.302715, 1, 0.05490196, 0, 1,
-2.359344, -1.403822, -1.209524, 1, 0.05882353, 0, 1,
-2.352715, 0.4859413, 0.4883517, 1, 0.06666667, 0, 1,
-2.282636, 1.188962, -0.373152, 1, 0.07058824, 0, 1,
-2.265855, 0.9726275, -2.427476, 1, 0.07843138, 0, 1,
-2.25232, -0.6046291, -0.9458132, 1, 0.08235294, 0, 1,
-2.248641, 0.5790826, -0.3030659, 1, 0.09019608, 0, 1,
-2.218618, -1.609635, -0.9577076, 1, 0.09411765, 0, 1,
-2.129282, -1.718876, -2.607525, 1, 0.1019608, 0, 1,
-2.094728, -0.03007087, 0.01229903, 1, 0.1098039, 0, 1,
-2.08918, 0.3999829, -0.4682668, 1, 0.1137255, 0, 1,
-2.067235, -1.4547, -3.34003, 1, 0.1215686, 0, 1,
-2.029842, 0.2855487, -1.466281, 1, 0.1254902, 0, 1,
-2.016632, -1.305493, -0.6952005, 1, 0.1333333, 0, 1,
-2.009237, -0.3103884, -2.358858, 1, 0.1372549, 0, 1,
-2.001674, -0.09413995, -4.745665, 1, 0.145098, 0, 1,
-1.981771, -0.9190778, -2.473958, 1, 0.1490196, 0, 1,
-1.883387, -0.978151, -1.343818, 1, 0.1568628, 0, 1,
-1.87103, -1.148776, -2.324464, 1, 0.1607843, 0, 1,
-1.864039, 1.215747, -0.3696583, 1, 0.1686275, 0, 1,
-1.838504, -0.358825, -1.186182, 1, 0.172549, 0, 1,
-1.80241, -0.8347079, -3.002564, 1, 0.1803922, 0, 1,
-1.785441, 0.488982, -0.5060524, 1, 0.1843137, 0, 1,
-1.776342, 0.2732883, -0.5822252, 1, 0.1921569, 0, 1,
-1.769926, 0.2602398, -2.475868, 1, 0.1960784, 0, 1,
-1.769413, 0.8661534, -1.589636, 1, 0.2039216, 0, 1,
-1.766763, -1.119866, -1.17109, 1, 0.2117647, 0, 1,
-1.761692, -0.3913954, -1.843006, 1, 0.2156863, 0, 1,
-1.75707, -0.1946207, -1.954429, 1, 0.2235294, 0, 1,
-1.7485, -0.3632074, -0.6828852, 1, 0.227451, 0, 1,
-1.739827, 1.870273, -1.446205, 1, 0.2352941, 0, 1,
-1.730252, -0.3407542, -2.62466, 1, 0.2392157, 0, 1,
-1.717342, 1.440271, -0.7172393, 1, 0.2470588, 0, 1,
-1.712528, -1.417095, -2.89577, 1, 0.2509804, 0, 1,
-1.71226, 0.7973848, 0.2367602, 1, 0.2588235, 0, 1,
-1.700432, -0.1695216, -1.20666, 1, 0.2627451, 0, 1,
-1.699006, -0.2971102, -1.570933, 1, 0.2705882, 0, 1,
-1.668325, -0.3919443, -2.274058, 1, 0.2745098, 0, 1,
-1.665776, -0.8226421, -2.844514, 1, 0.282353, 0, 1,
-1.646684, 0.2852812, -1.646145, 1, 0.2862745, 0, 1,
-1.643893, 0.8058217, -2.066195, 1, 0.2941177, 0, 1,
-1.642697, -2.913046, -3.030009, 1, 0.3019608, 0, 1,
-1.618948, -1.798441, -3.856557, 1, 0.3058824, 0, 1,
-1.614586, 1.08506, -1.0829, 1, 0.3137255, 0, 1,
-1.609646, 1.181826, -1.641947, 1, 0.3176471, 0, 1,
-1.60848, -2.021641, -2.031502, 1, 0.3254902, 0, 1,
-1.608298, -0.9085422, -2.612872, 1, 0.3294118, 0, 1,
-1.606037, -1.261976, -1.966917, 1, 0.3372549, 0, 1,
-1.605258, 0.8831159, -1.82756, 1, 0.3411765, 0, 1,
-1.599963, 0.2091289, -0.9855454, 1, 0.3490196, 0, 1,
-1.567138, 1.55057, -0.8674159, 1, 0.3529412, 0, 1,
-1.562124, -0.2951917, -1.709359, 1, 0.3607843, 0, 1,
-1.548569, 0.5524858, 0.7998893, 1, 0.3647059, 0, 1,
-1.548202, 0.8091029, -2.218457, 1, 0.372549, 0, 1,
-1.535247, -1.049225, -1.490507, 1, 0.3764706, 0, 1,
-1.52287, -0.06903578, -1.454664, 1, 0.3843137, 0, 1,
-1.520853, 0.3699397, -2.594888, 1, 0.3882353, 0, 1,
-1.504772, -0.5584866, -1.927755, 1, 0.3960784, 0, 1,
-1.504674, 0.7786554, -1.801636, 1, 0.4039216, 0, 1,
-1.486953, -1.618049, -1.616091, 1, 0.4078431, 0, 1,
-1.482686, 0.2481279, -2.238652, 1, 0.4156863, 0, 1,
-1.481053, -1.656056, 0.3111146, 1, 0.4196078, 0, 1,
-1.464719, 0.3119558, -1.875074, 1, 0.427451, 0, 1,
-1.460969, -0.4721354, -2.826826, 1, 0.4313726, 0, 1,
-1.459037, 0.5759484, -1.511247, 1, 0.4392157, 0, 1,
-1.455055, -1.641871, -2.45145, 1, 0.4431373, 0, 1,
-1.443894, -0.8201597, -2.527932, 1, 0.4509804, 0, 1,
-1.429063, 2.649105, -1.98304, 1, 0.454902, 0, 1,
-1.424512, -0.3440276, -1.720725, 1, 0.4627451, 0, 1,
-1.419472, -0.7750463, -0.1831733, 1, 0.4666667, 0, 1,
-1.418463, 0.006896766, -1.217842, 1, 0.4745098, 0, 1,
-1.418195, -2.514147, -3.208627, 1, 0.4784314, 0, 1,
-1.415484, -1.376033, -3.84903, 1, 0.4862745, 0, 1,
-1.415362, 0.1394451, -2.744564, 1, 0.4901961, 0, 1,
-1.400853, -0.2715139, -1.354263, 1, 0.4980392, 0, 1,
-1.400367, -0.4994288, -0.652858, 1, 0.5058824, 0, 1,
-1.396586, 0.6634896, -0.7806584, 1, 0.509804, 0, 1,
-1.392639, 0.4641721, -0.3698707, 1, 0.5176471, 0, 1,
-1.389581, -1.843036, -2.423721, 1, 0.5215687, 0, 1,
-1.387303, -0.627408, -3.040815, 1, 0.5294118, 0, 1,
-1.385302, 0.5562227, -1.012933, 1, 0.5333334, 0, 1,
-1.377404, -0.474919, -0.870277, 1, 0.5411765, 0, 1,
-1.3764, 1.778901, -2.575774, 1, 0.5450981, 0, 1,
-1.372247, 0.1121546, -2.12379, 1, 0.5529412, 0, 1,
-1.363992, 0.1785843, -1.504026, 1, 0.5568628, 0, 1,
-1.336798, 0.7852707, -1.384483, 1, 0.5647059, 0, 1,
-1.333974, 0.9416861, -0.9697877, 1, 0.5686275, 0, 1,
-1.332806, -0.6067328, -2.549405, 1, 0.5764706, 0, 1,
-1.330092, -0.2584389, -0.4407339, 1, 0.5803922, 0, 1,
-1.31495, 0.1502793, -0.7185379, 1, 0.5882353, 0, 1,
-1.31037, 1.211612, -0.3959302, 1, 0.5921569, 0, 1,
-1.308587, 1.684618, -1.018036, 1, 0.6, 0, 1,
-1.303925, 0.6366445, -0.7592195, 1, 0.6078432, 0, 1,
-1.290449, -0.8921826, -1.467216, 1, 0.6117647, 0, 1,
-1.288061, -0.3891238, -3.648757, 1, 0.6196079, 0, 1,
-1.286021, -0.08607326, -2.993445, 1, 0.6235294, 0, 1,
-1.283467, -0.2323776, -1.644002, 1, 0.6313726, 0, 1,
-1.280322, 0.07972748, -0.4691391, 1, 0.6352941, 0, 1,
-1.271479, 1.05982, -2.197753, 1, 0.6431373, 0, 1,
-1.26838, 1.656613, 0.3874979, 1, 0.6470588, 0, 1,
-1.26807, 0.01617523, -0.4270468, 1, 0.654902, 0, 1,
-1.265682, 0.4308259, -1.561287, 1, 0.6588235, 0, 1,
-1.253911, 0.3952487, -2.524151, 1, 0.6666667, 0, 1,
-1.251671, 1.296486, 0.2008134, 1, 0.6705883, 0, 1,
-1.24221, -1.199254, -2.603729, 1, 0.6784314, 0, 1,
-1.24055, -0.2765281, -1.768203, 1, 0.682353, 0, 1,
-1.235014, -0.4388078, -1.112592, 1, 0.6901961, 0, 1,
-1.228741, 1.38964, -2.059989, 1, 0.6941177, 0, 1,
-1.228653, -0.4372441, -1.178155, 1, 0.7019608, 0, 1,
-1.228022, -0.0893136, -1.115973, 1, 0.7098039, 0, 1,
-1.225708, 1.036863, 1.556605, 1, 0.7137255, 0, 1,
-1.225334, 1.907756, -1.0223, 1, 0.7215686, 0, 1,
-1.222701, -1.502046, -1.72269, 1, 0.7254902, 0, 1,
-1.212619, -0.5633441, -1.257055, 1, 0.7333333, 0, 1,
-1.211001, -0.3578282, -1.360921, 1, 0.7372549, 0, 1,
-1.20445, -0.137277, -2.896111, 1, 0.7450981, 0, 1,
-1.200422, -0.4174536, -2.212921, 1, 0.7490196, 0, 1,
-1.19764, 0.8367147, -1.213698, 1, 0.7568628, 0, 1,
-1.189468, 0.3599578, -2.881868, 1, 0.7607843, 0, 1,
-1.188389, -0.6491422, -0.5710979, 1, 0.7686275, 0, 1,
-1.187937, 1.175403, -0.5515589, 1, 0.772549, 0, 1,
-1.186172, -0.9046625, -2.228859, 1, 0.7803922, 0, 1,
-1.184007, 1.303106, 0.3753066, 1, 0.7843137, 0, 1,
-1.181092, -1.61466, -2.993345, 1, 0.7921569, 0, 1,
-1.180815, 0.1987026, -0.4180694, 1, 0.7960784, 0, 1,
-1.172321, 1.287844, -2.291137, 1, 0.8039216, 0, 1,
-1.168271, 0.9403713, -0.1481444, 1, 0.8117647, 0, 1,
-1.16791, 1.30023, 0.7950891, 1, 0.8156863, 0, 1,
-1.15982, -0.3426776, -1.390564, 1, 0.8235294, 0, 1,
-1.158001, -1.841976, -2.529624, 1, 0.827451, 0, 1,
-1.157372, -0.5548921, -1.659644, 1, 0.8352941, 0, 1,
-1.156943, -1.970899, -1.037189, 1, 0.8392157, 0, 1,
-1.145766, -0.6373081, -1.58181, 1, 0.8470588, 0, 1,
-1.14296, 0.6524354, -0.6553614, 1, 0.8509804, 0, 1,
-1.130837, -0.9411897, -3.005265, 1, 0.8588235, 0, 1,
-1.123951, 1.496851, 1.432636, 1, 0.8627451, 0, 1,
-1.120248, -0.4725943, -2.656279, 1, 0.8705882, 0, 1,
-1.115003, 0.0425958, -2.016573, 1, 0.8745098, 0, 1,
-1.111374, -0.646439, -2.828228, 1, 0.8823529, 0, 1,
-1.099163, 0.6319214, -0.7265007, 1, 0.8862745, 0, 1,
-1.096796, 0.4919207, -0.9961417, 1, 0.8941177, 0, 1,
-1.092351, 0.6011302, -0.4031459, 1, 0.8980392, 0, 1,
-1.086717, -0.4221005, -3.980426, 1, 0.9058824, 0, 1,
-1.082204, -0.4926628, -1.572206, 1, 0.9137255, 0, 1,
-1.056557, -0.2552499, -1.744029, 1, 0.9176471, 0, 1,
-1.053669, 0.4552516, -0.5993631, 1, 0.9254902, 0, 1,
-1.052178, -0.1061927, -0.8039302, 1, 0.9294118, 0, 1,
-1.0412, -0.03505677, -2.453729, 1, 0.9372549, 0, 1,
-1.036982, 2.307287, -1.629081, 1, 0.9411765, 0, 1,
-1.03537, -0.3309122, -1.653141, 1, 0.9490196, 0, 1,
-1.025931, 1.079743, -0.584092, 1, 0.9529412, 0, 1,
-1.021491, 0.1117085, -0.2970955, 1, 0.9607843, 0, 1,
-1.021472, -0.4174459, -3.462869, 1, 0.9647059, 0, 1,
-1.012071, 0.4613792, -0.07278602, 1, 0.972549, 0, 1,
-1.009537, 1.468962, -2.421092, 1, 0.9764706, 0, 1,
-1.000136, 0.1349567, -2.305091, 1, 0.9843137, 0, 1,
-0.9921182, -1.030863, -1.520288, 1, 0.9882353, 0, 1,
-0.9917686, -0.1850742, -2.835098, 1, 0.9960784, 0, 1,
-0.9873173, 0.4849277, -2.828876, 0.9960784, 1, 0, 1,
-0.9855083, 0.6997566, -0.7066618, 0.9921569, 1, 0, 1,
-0.9781223, -0.04741266, 0.795038, 0.9843137, 1, 0, 1,
-0.9775638, 0.2802651, 0.1664185, 0.9803922, 1, 0, 1,
-0.9708559, 0.5519197, -1.060798, 0.972549, 1, 0, 1,
-0.9660354, 0.4621871, -1.123442, 0.9686275, 1, 0, 1,
-0.9635382, -1.078664, -3.978179, 0.9607843, 1, 0, 1,
-0.962107, 0.3455528, 1.004689, 0.9568627, 1, 0, 1,
-0.9418796, 0.9590043, -0.2967761, 0.9490196, 1, 0, 1,
-0.9418139, -0.8075594, -3.219327, 0.945098, 1, 0, 1,
-0.9291908, -0.5787556, -3.094894, 0.9372549, 1, 0, 1,
-0.9087417, 0.6902658, -0.4260175, 0.9333333, 1, 0, 1,
-0.9078667, 0.2340298, -1.906364, 0.9254902, 1, 0, 1,
-0.9068463, 0.8088554, 0.1793448, 0.9215686, 1, 0, 1,
-0.8976018, -1.16474, -2.377786, 0.9137255, 1, 0, 1,
-0.8906202, 0.637687, -1.389421, 0.9098039, 1, 0, 1,
-0.8900885, 0.930669, -1.332916, 0.9019608, 1, 0, 1,
-0.8856592, -0.199226, -1.654362, 0.8941177, 1, 0, 1,
-0.8830661, -0.5879092, -1.869709, 0.8901961, 1, 0, 1,
-0.8789184, 0.9338558, 0.04448111, 0.8823529, 1, 0, 1,
-0.8692534, -0.2348825, -1.987685, 0.8784314, 1, 0, 1,
-0.8675195, 0.2519442, -0.4714317, 0.8705882, 1, 0, 1,
-0.8662953, -0.1861529, -2.538295, 0.8666667, 1, 0, 1,
-0.8657755, 0.7852676, -0.9819277, 0.8588235, 1, 0, 1,
-0.8627164, -0.7875971, -1.648885, 0.854902, 1, 0, 1,
-0.8607808, -0.1743236, -2.624542, 0.8470588, 1, 0, 1,
-0.8560381, -0.5507566, -1.093836, 0.8431373, 1, 0, 1,
-0.8556446, -0.4694611, -2.64277, 0.8352941, 1, 0, 1,
-0.855575, 1.568011, 0.4602381, 0.8313726, 1, 0, 1,
-0.8550772, 0.4886128, -1.273834, 0.8235294, 1, 0, 1,
-0.84606, 0.2875735, -1.617304, 0.8196079, 1, 0, 1,
-0.8358262, -0.3946853, -4.386011, 0.8117647, 1, 0, 1,
-0.8349876, -1.502123, -2.215167, 0.8078431, 1, 0, 1,
-0.8342705, -1.078268, -4.074329, 0.8, 1, 0, 1,
-0.8336309, -0.1503929, -3.99382, 0.7921569, 1, 0, 1,
-0.8299952, 1.379361, 0.3157015, 0.7882353, 1, 0, 1,
-0.8274797, -0.4001655, -1.919801, 0.7803922, 1, 0, 1,
-0.8253179, 1.794893, -0.8271323, 0.7764706, 1, 0, 1,
-0.8203238, -0.2754322, -1.653537, 0.7686275, 1, 0, 1,
-0.8183406, -0.06107027, -0.2126311, 0.7647059, 1, 0, 1,
-0.8153309, -0.3285104, -1.882747, 0.7568628, 1, 0, 1,
-0.8145584, -0.9000053, -2.912779, 0.7529412, 1, 0, 1,
-0.8122056, -1.324441, -0.7785363, 0.7450981, 1, 0, 1,
-0.812075, -1.377309, -1.822311, 0.7411765, 1, 0, 1,
-0.8082162, 0.9085819, -1.365529, 0.7333333, 1, 0, 1,
-0.7969015, 0.3611323, -1.646287, 0.7294118, 1, 0, 1,
-0.7937853, 0.9007184, 0.6005211, 0.7215686, 1, 0, 1,
-0.788497, 1.07833, 0.5389327, 0.7176471, 1, 0, 1,
-0.785454, -1.714448, -0.6546463, 0.7098039, 1, 0, 1,
-0.7836873, 1.021448, 0.234118, 0.7058824, 1, 0, 1,
-0.7791933, 0.2393316, -0.0796997, 0.6980392, 1, 0, 1,
-0.7743616, 0.09526534, -1.961974, 0.6901961, 1, 0, 1,
-0.7677671, -0.5053853, -3.366972, 0.6862745, 1, 0, 1,
-0.7580399, -1.662419, -3.523927, 0.6784314, 1, 0, 1,
-0.7548719, 0.2882818, -1.319244, 0.6745098, 1, 0, 1,
-0.7543926, -0.5291083, -0.9628491, 0.6666667, 1, 0, 1,
-0.7523512, -0.2860706, -3.569631, 0.6627451, 1, 0, 1,
-0.7517847, 1.040744, -1.199236, 0.654902, 1, 0, 1,
-0.7467977, 2.281287, -0.01339692, 0.6509804, 1, 0, 1,
-0.7458649, 0.4442053, -0.06644673, 0.6431373, 1, 0, 1,
-0.7431073, 1.954699, 0.6979901, 0.6392157, 1, 0, 1,
-0.7428813, 1.680981, -1.448469, 0.6313726, 1, 0, 1,
-0.7424421, -1.886753, -2.321852, 0.627451, 1, 0, 1,
-0.7378707, 0.3591223, -2.877471, 0.6196079, 1, 0, 1,
-0.735187, -0.9135739, -2.984306, 0.6156863, 1, 0, 1,
-0.732195, -0.1841387, -1.711387, 0.6078432, 1, 0, 1,
-0.7276443, -1.662817, -2.583066, 0.6039216, 1, 0, 1,
-0.7275869, -0.1335127, -1.113498, 0.5960785, 1, 0, 1,
-0.7272846, -0.6224512, -2.014302, 0.5882353, 1, 0, 1,
-0.7254729, -0.04254438, -0.9485736, 0.5843138, 1, 0, 1,
-0.7169875, -0.05462139, -1.857527, 0.5764706, 1, 0, 1,
-0.7154673, 0.4832719, -0.6786983, 0.572549, 1, 0, 1,
-0.7151803, 1.620662, -0.7428265, 0.5647059, 1, 0, 1,
-0.7118873, -0.9251693, -2.528571, 0.5607843, 1, 0, 1,
-0.7112052, 0.76174, 0.2221735, 0.5529412, 1, 0, 1,
-0.7107118, -0.2208776, -2.229718, 0.5490196, 1, 0, 1,
-0.7046142, -1.216149, -1.65653, 0.5411765, 1, 0, 1,
-0.6970889, 0.2512484, -2.201461, 0.5372549, 1, 0, 1,
-0.6958594, 0.2662088, -0.779617, 0.5294118, 1, 0, 1,
-0.6948123, -1.481126, -3.148521, 0.5254902, 1, 0, 1,
-0.6933059, -0.2829296, -1.655237, 0.5176471, 1, 0, 1,
-0.6927665, 2.111326, -2.683566, 0.5137255, 1, 0, 1,
-0.6910653, 0.6437795, -0.7528222, 0.5058824, 1, 0, 1,
-0.6889976, -0.9578033, -4.106048, 0.5019608, 1, 0, 1,
-0.6865985, 1.392063, 0.3340522, 0.4941176, 1, 0, 1,
-0.6807241, 0.2291369, -1.13363, 0.4862745, 1, 0, 1,
-0.6803179, 0.5009202, -0.337654, 0.4823529, 1, 0, 1,
-0.6748347, 1.878911, 0.4108378, 0.4745098, 1, 0, 1,
-0.6723798, -0.2881858, -1.396505, 0.4705882, 1, 0, 1,
-0.6723669, 0.4542201, -1.682808, 0.4627451, 1, 0, 1,
-0.6713839, -0.4814666, -1.661548, 0.4588235, 1, 0, 1,
-0.669968, 0.8812507, -0.06878699, 0.4509804, 1, 0, 1,
-0.6666928, 1.0506, -1.649995, 0.4470588, 1, 0, 1,
-0.6623107, 0.6415445, -0.9922646, 0.4392157, 1, 0, 1,
-0.6599317, 0.4676624, -2.104484, 0.4352941, 1, 0, 1,
-0.659931, 0.5346085, -0.01092033, 0.427451, 1, 0, 1,
-0.6590954, 1.343813, 0.2792147, 0.4235294, 1, 0, 1,
-0.6584967, -1.162713, -3.723133, 0.4156863, 1, 0, 1,
-0.6523553, -1.132944, -2.63872, 0.4117647, 1, 0, 1,
-0.6452315, 1.488098, -0.181294, 0.4039216, 1, 0, 1,
-0.6351019, 0.4321798, -1.283189, 0.3960784, 1, 0, 1,
-0.6317174, 0.5892441, -2.078171, 0.3921569, 1, 0, 1,
-0.6294399, -0.5305237, -1.447876, 0.3843137, 1, 0, 1,
-0.6079744, 0.667785, -0.545434, 0.3803922, 1, 0, 1,
-0.6078079, 0.4945596, -0.5256409, 0.372549, 1, 0, 1,
-0.6071345, 1.29249, -1.302406, 0.3686275, 1, 0, 1,
-0.6050313, 0.4409418, -0.5069933, 0.3607843, 1, 0, 1,
-0.6008011, -0.6389374, -1.57688, 0.3568628, 1, 0, 1,
-0.5989801, 0.2959738, -0.2393754, 0.3490196, 1, 0, 1,
-0.5955121, 0.1775602, -1.750034, 0.345098, 1, 0, 1,
-0.5951974, -0.5219669, -3.80527, 0.3372549, 1, 0, 1,
-0.5887526, 0.7265545, -0.8031549, 0.3333333, 1, 0, 1,
-0.5862568, 0.1296439, -1.920966, 0.3254902, 1, 0, 1,
-0.5843518, 0.5974745, -0.1900476, 0.3215686, 1, 0, 1,
-0.574071, 0.07121954, -0.9502538, 0.3137255, 1, 0, 1,
-0.5722317, 1.592472, -0.7195922, 0.3098039, 1, 0, 1,
-0.5718324, 1.51684, 2.761433, 0.3019608, 1, 0, 1,
-0.5704139, -2.042738, -3.78768, 0.2941177, 1, 0, 1,
-0.5651181, -0.4418902, -2.052803, 0.2901961, 1, 0, 1,
-0.5626792, -1.909125, -2.933719, 0.282353, 1, 0, 1,
-0.5497436, -0.8294984, -3.232654, 0.2784314, 1, 0, 1,
-0.5483074, -1.169196, -2.745667, 0.2705882, 1, 0, 1,
-0.5473895, 0.3966196, -1.206411, 0.2666667, 1, 0, 1,
-0.5424559, 0.702435, -2.508402, 0.2588235, 1, 0, 1,
-0.5401234, -0.02966866, -3.260172, 0.254902, 1, 0, 1,
-0.5394287, -1.376804, -3.265248, 0.2470588, 1, 0, 1,
-0.5359361, -0.3283774, -2.882812, 0.2431373, 1, 0, 1,
-0.5346212, 0.8320556, -0.2743248, 0.2352941, 1, 0, 1,
-0.5341436, -0.2229745, -1.04065, 0.2313726, 1, 0, 1,
-0.53071, -0.8159139, -2.231101, 0.2235294, 1, 0, 1,
-0.527908, -0.1075302, -1.351827, 0.2196078, 1, 0, 1,
-0.5250481, 0.0366385, -0.9226768, 0.2117647, 1, 0, 1,
-0.5199941, 1.723971, 0.6617414, 0.2078431, 1, 0, 1,
-0.5160934, -1.701054, -3.701828, 0.2, 1, 0, 1,
-0.5138456, 0.01428815, 0.8082432, 0.1921569, 1, 0, 1,
-0.5133865, -0.8405974, -2.641225, 0.1882353, 1, 0, 1,
-0.5123018, -1.915573, -2.887837, 0.1803922, 1, 0, 1,
-0.5074905, -0.08950174, -1.825672, 0.1764706, 1, 0, 1,
-0.5073351, -0.1078119, -0.6425405, 0.1686275, 1, 0, 1,
-0.5041109, 0.4049459, -1.130072, 0.1647059, 1, 0, 1,
-0.5031889, -1.751305, -3.740144, 0.1568628, 1, 0, 1,
-0.499945, -0.03991536, -1.792351, 0.1529412, 1, 0, 1,
-0.4987604, 1.002978, -2.060435, 0.145098, 1, 0, 1,
-0.4986582, -0.6025343, -3.429855, 0.1411765, 1, 0, 1,
-0.4871476, 1.415905, 0.262121, 0.1333333, 1, 0, 1,
-0.4854451, -3.653427, -3.374947, 0.1294118, 1, 0, 1,
-0.483152, 0.7050114, -0.3566379, 0.1215686, 1, 0, 1,
-0.4778287, 0.384062, -2.218955, 0.1176471, 1, 0, 1,
-0.477417, -0.3446986, -1.301708, 0.1098039, 1, 0, 1,
-0.4729656, -0.4676203, -3.209527, 0.1058824, 1, 0, 1,
-0.4723636, 0.4891318, -0.8069824, 0.09803922, 1, 0, 1,
-0.4711797, -0.841379, -1.61297, 0.09019608, 1, 0, 1,
-0.4686071, -2.085894, -3.787878, 0.08627451, 1, 0, 1,
-0.4678044, 0.3637927, -0.949853, 0.07843138, 1, 0, 1,
-0.4610873, -0.5566862, -2.539614, 0.07450981, 1, 0, 1,
-0.4609226, 0.274761, -2.520622, 0.06666667, 1, 0, 1,
-0.4595205, -2.239155, -5.051794, 0.0627451, 1, 0, 1,
-0.4579331, 1.465242, -0.06176713, 0.05490196, 1, 0, 1,
-0.4553503, 0.7582115, -0.4659104, 0.05098039, 1, 0, 1,
-0.4544199, 1.958023, -0.7483495, 0.04313726, 1, 0, 1,
-0.4515523, -0.1903122, -1.187125, 0.03921569, 1, 0, 1,
-0.4484299, -0.6696075, -2.726459, 0.03137255, 1, 0, 1,
-0.4454765, 0.1473844, 1.32326, 0.02745098, 1, 0, 1,
-0.4429416, 0.4154022, -0.1359999, 0.01960784, 1, 0, 1,
-0.4426582, 1.620461, -0.04769624, 0.01568628, 1, 0, 1,
-0.4389127, -0.9463089, -3.744648, 0.007843138, 1, 0, 1,
-0.4351408, 0.2361275, 0.1265374, 0.003921569, 1, 0, 1,
-0.4345386, -0.2088239, -2.009485, 0, 1, 0.003921569, 1,
-0.4343479, 1.33136, -1.10407, 0, 1, 0.01176471, 1,
-0.4284396, 0.2555737, -1.945257, 0, 1, 0.01568628, 1,
-0.4273998, -0.9383765, -3.413461, 0, 1, 0.02352941, 1,
-0.4239978, 1.610674, 0.6621249, 0, 1, 0.02745098, 1,
-0.4228779, 1.884112, -1.087003, 0, 1, 0.03529412, 1,
-0.4220696, 0.6961023, -1.305211, 0, 1, 0.03921569, 1,
-0.4204901, -0.7212797, -2.528291, 0, 1, 0.04705882, 1,
-0.4190774, -0.09236603, -1.939536, 0, 1, 0.05098039, 1,
-0.4184164, 0.7906229, 0.6659102, 0, 1, 0.05882353, 1,
-0.4169236, 0.0634402, -2.2948, 0, 1, 0.0627451, 1,
-0.4138575, 0.5257139, -1.230498, 0, 1, 0.07058824, 1,
-0.4110958, 1.820869, 1.081779, 0, 1, 0.07450981, 1,
-0.4090415, -0.1867525, -1.968864, 0, 1, 0.08235294, 1,
-0.4067335, -0.264298, -2.510845, 0, 1, 0.08627451, 1,
-0.4039276, -0.01629093, -0.9156805, 0, 1, 0.09411765, 1,
-0.4025279, -0.5954718, -2.185299, 0, 1, 0.1019608, 1,
-0.4015156, 0.8775238, -1.428746, 0, 1, 0.1058824, 1,
-0.4008661, 1.359627, 0.009722406, 0, 1, 0.1137255, 1,
-0.3997528, 0.5209945, 0.7251798, 0, 1, 0.1176471, 1,
-0.3992063, 1.047268, -1.169367, 0, 1, 0.1254902, 1,
-0.3950679, -0.1042625, -1.368498, 0, 1, 0.1294118, 1,
-0.3946147, 0.3249447, -1.084019, 0, 1, 0.1372549, 1,
-0.3933824, -0.5525319, -2.139309, 0, 1, 0.1411765, 1,
-0.3923181, -0.2299521, -0.6870254, 0, 1, 0.1490196, 1,
-0.3895406, -0.9329783, -2.042069, 0, 1, 0.1529412, 1,
-0.3872926, 0.3735438, -0.9370011, 0, 1, 0.1607843, 1,
-0.3865943, -2.40731, -3.690006, 0, 1, 0.1647059, 1,
-0.3833446, 0.6406702, 1.074781, 0, 1, 0.172549, 1,
-0.3832164, -1.723042, -2.080068, 0, 1, 0.1764706, 1,
-0.3824539, 0.3527197, 0.5807481, 0, 1, 0.1843137, 1,
-0.3808717, -0.9337562, -3.850607, 0, 1, 0.1882353, 1,
-0.3740791, -1.628043, -3.353503, 0, 1, 0.1960784, 1,
-0.371422, -0.3141469, 0.08051283, 0, 1, 0.2039216, 1,
-0.366819, 0.127153, -2.096091, 0, 1, 0.2078431, 1,
-0.3667163, 0.1407038, -1.866848, 0, 1, 0.2156863, 1,
-0.3620186, 0.8553358, -0.09752408, 0, 1, 0.2196078, 1,
-0.3619307, -1.008684, -4.09763, 0, 1, 0.227451, 1,
-0.351699, -0.7734445, -1.868618, 0, 1, 0.2313726, 1,
-0.3503788, 0.9911083, 1.128856, 0, 1, 0.2392157, 1,
-0.3498187, -0.03213429, -1.981529, 0, 1, 0.2431373, 1,
-0.3479751, -0.6635634, -3.406581, 0, 1, 0.2509804, 1,
-0.339196, 0.3840321, -0.8606243, 0, 1, 0.254902, 1,
-0.338391, 0.0378717, -2.018281, 0, 1, 0.2627451, 1,
-0.337565, -0.7511783, -3.01107, 0, 1, 0.2666667, 1,
-0.3320363, 0.0204565, -0.8043861, 0, 1, 0.2745098, 1,
-0.3300481, -1.515982, -2.425196, 0, 1, 0.2784314, 1,
-0.3295648, 0.5412365, 0.2723385, 0, 1, 0.2862745, 1,
-0.3284992, -0.5170007, -3.406815, 0, 1, 0.2901961, 1,
-0.3257994, -1.361208, -4.091145, 0, 1, 0.2980392, 1,
-0.3218889, 1.120822, -0.231048, 0, 1, 0.3058824, 1,
-0.3210066, 0.7073846, 0.3310835, 0, 1, 0.3098039, 1,
-0.320593, 0.4617485, -1.495864, 0, 1, 0.3176471, 1,
-0.3176301, -0.09719722, -2.479798, 0, 1, 0.3215686, 1,
-0.3148068, -0.6235312, -2.12848, 0, 1, 0.3294118, 1,
-0.3141409, -0.422595, -1.315394, 0, 1, 0.3333333, 1,
-0.3111307, 1.616171, -1.189298, 0, 1, 0.3411765, 1,
-0.3106421, 0.8346986, 0.02952381, 0, 1, 0.345098, 1,
-0.3087733, 0.1890216, 0.1100281, 0, 1, 0.3529412, 1,
-0.3064615, 0.02155267, -2.960699, 0, 1, 0.3568628, 1,
-0.3046651, 0.5541491, -0.2066125, 0, 1, 0.3647059, 1,
-0.3005765, 1.245194, 0.1335557, 0, 1, 0.3686275, 1,
-0.2983447, 0.9608251, 0.3711603, 0, 1, 0.3764706, 1,
-0.2954597, 0.3875084, 1.139344, 0, 1, 0.3803922, 1,
-0.2939144, -0.5863757, -2.417784, 0, 1, 0.3882353, 1,
-0.2898766, 1.103997, -0.4382641, 0, 1, 0.3921569, 1,
-0.2882144, 0.699095, 0.06206312, 0, 1, 0.4, 1,
-0.2877553, -0.5453584, -3.647108, 0, 1, 0.4078431, 1,
-0.2805573, -0.1671121, -2.242235, 0, 1, 0.4117647, 1,
-0.2803119, 0.9031406, -1.728256, 0, 1, 0.4196078, 1,
-0.280154, -0.8558238, -2.924837, 0, 1, 0.4235294, 1,
-0.2696808, -2.494987, -3.130327, 0, 1, 0.4313726, 1,
-0.2696212, 0.7934934, -0.6903288, 0, 1, 0.4352941, 1,
-0.2684333, 0.9811116, 0.9725002, 0, 1, 0.4431373, 1,
-0.2619167, -1.031675, -3.812996, 0, 1, 0.4470588, 1,
-0.2602311, 0.2728965, -0.6979416, 0, 1, 0.454902, 1,
-0.2599708, 0.5510955, -0.5503579, 0, 1, 0.4588235, 1,
-0.2538704, -0.09423924, -1.19621, 0, 1, 0.4666667, 1,
-0.2525918, -0.1013021, -1.961627, 0, 1, 0.4705882, 1,
-0.2512877, -1.121543, -1.802372, 0, 1, 0.4784314, 1,
-0.2506846, 0.7449399, 0.1297853, 0, 1, 0.4823529, 1,
-0.2504351, 1.971566, -1.164506, 0, 1, 0.4901961, 1,
-0.2495351, -0.6809677, -1.426645, 0, 1, 0.4941176, 1,
-0.2495104, 2.879336, -0.6561183, 0, 1, 0.5019608, 1,
-0.2493861, -1.463632, -1.029682, 0, 1, 0.509804, 1,
-0.2438876, -2.667915, -3.871368, 0, 1, 0.5137255, 1,
-0.2401049, 1.361424, -0.7357374, 0, 1, 0.5215687, 1,
-0.236321, 0.417921, -1.247305, 0, 1, 0.5254902, 1,
-0.2314545, 1.424355, -1.610336, 0, 1, 0.5333334, 1,
-0.2309907, 0.9100298, -1.507101, 0, 1, 0.5372549, 1,
-0.2287318, -0.9509094, -3.109463, 0, 1, 0.5450981, 1,
-0.2240844, -0.3763488, -2.631048, 0, 1, 0.5490196, 1,
-0.2204419, -0.4470544, -1.810995, 0, 1, 0.5568628, 1,
-0.2115175, 1.148404, -1.959857, 0, 1, 0.5607843, 1,
-0.2054535, -3.014138, -2.995933, 0, 1, 0.5686275, 1,
-0.205194, 0.06515886, -0.5831177, 0, 1, 0.572549, 1,
-0.2026943, 2.279605, 0.9541695, 0, 1, 0.5803922, 1,
-0.1975032, 1.024946, -0.9667394, 0, 1, 0.5843138, 1,
-0.1919799, -0.8757998, -4.398305, 0, 1, 0.5921569, 1,
-0.1908846, -1.191489, -2.961487, 0, 1, 0.5960785, 1,
-0.1900241, 0.6227287, -0.6525919, 0, 1, 0.6039216, 1,
-0.1899346, 0.4723164, -0.4083369, 0, 1, 0.6117647, 1,
-0.1866962, 0.4104021, -0.1012731, 0, 1, 0.6156863, 1,
-0.1865976, 0.9376032, 0.00316248, 0, 1, 0.6235294, 1,
-0.1863136, 0.9128997, 0.02205327, 0, 1, 0.627451, 1,
-0.1862271, -0.1941197, -1.713511, 0, 1, 0.6352941, 1,
-0.1817362, -0.59969, -2.150596, 0, 1, 0.6392157, 1,
-0.1799511, -0.9311666, -1.054649, 0, 1, 0.6470588, 1,
-0.1786396, 0.1059183, -0.6033897, 0, 1, 0.6509804, 1,
-0.1774256, -1.436992, -5.212474, 0, 1, 0.6588235, 1,
-0.1747981, 0.40571, -1.716712, 0, 1, 0.6627451, 1,
-0.1747142, -1.006245, -1.464667, 0, 1, 0.6705883, 1,
-0.1739287, -1.843914, -3.906362, 0, 1, 0.6745098, 1,
-0.1727935, 0.1410801, 0.9719121, 0, 1, 0.682353, 1,
-0.1722781, -0.9490868, -4.029282, 0, 1, 0.6862745, 1,
-0.1697397, 0.04245103, -1.405464, 0, 1, 0.6941177, 1,
-0.1659413, 0.2873301, -1.508573, 0, 1, 0.7019608, 1,
-0.1605847, 2.074852, -0.6604592, 0, 1, 0.7058824, 1,
-0.1587634, 0.07660829, -2.389127, 0, 1, 0.7137255, 1,
-0.1572475, -0.6872386, -3.357375, 0, 1, 0.7176471, 1,
-0.1542778, 1.195441, 0.5434207, 0, 1, 0.7254902, 1,
-0.1531483, -1.554203, -1.52133, 0, 1, 0.7294118, 1,
-0.1516556, 0.6389276, 0.1379148, 0, 1, 0.7372549, 1,
-0.1498226, 0.1701745, 0.06708332, 0, 1, 0.7411765, 1,
-0.1495937, -0.2202265, -2.617457, 0, 1, 0.7490196, 1,
-0.1489526, 0.1533158, -1.576488, 0, 1, 0.7529412, 1,
-0.1443946, 0.9902719, 0.4897006, 0, 1, 0.7607843, 1,
-0.1412603, -0.7901909, -3.110378, 0, 1, 0.7647059, 1,
-0.1373575, -0.0388848, -1.724538, 0, 1, 0.772549, 1,
-0.1352143, 0.4697783, -0.9031396, 0, 1, 0.7764706, 1,
-0.1311965, 1.186564, -0.9241523, 0, 1, 0.7843137, 1,
-0.1302217, 0.8874801, -1.328664, 0, 1, 0.7882353, 1,
-0.1301146, -0.4586008, -3.722737, 0, 1, 0.7960784, 1,
-0.124415, -0.6427559, -3.713343, 0, 1, 0.8039216, 1,
-0.1209188, -1.014455, -2.633848, 0, 1, 0.8078431, 1,
-0.1156087, -0.5149937, -4.486594, 0, 1, 0.8156863, 1,
-0.1130015, -0.8744821, -1.551161, 0, 1, 0.8196079, 1,
-0.1116528, 0.08227602, -0.4417251, 0, 1, 0.827451, 1,
-0.1099665, 0.7424452, -1.565904, 0, 1, 0.8313726, 1,
-0.1096916, -0.9155321, -1.244928, 0, 1, 0.8392157, 1,
-0.108517, -0.5307884, -1.642204, 0, 1, 0.8431373, 1,
-0.1024172, 0.2414151, 0.5195172, 0, 1, 0.8509804, 1,
-0.1023711, -2.333514, -3.502486, 0, 1, 0.854902, 1,
-0.1009151, 2.678013, -0.823242, 0, 1, 0.8627451, 1,
-0.09311685, 0.03096995, -0.4301693, 0, 1, 0.8666667, 1,
-0.09205709, 0.709838, -1.896631, 0, 1, 0.8745098, 1,
-0.09032538, -0.1463008, -0.8662412, 0, 1, 0.8784314, 1,
-0.08943406, 1.028536, 0.2394551, 0, 1, 0.8862745, 1,
-0.08920493, 1.852062, 0.1035332, 0, 1, 0.8901961, 1,
-0.08733529, -1.47044, -3.042391, 0, 1, 0.8980392, 1,
-0.08623673, -1.059722, -3.215138, 0, 1, 0.9058824, 1,
-0.08559463, -1.862176, -5.430491, 0, 1, 0.9098039, 1,
-0.08417182, 0.3358169, 0.3818426, 0, 1, 0.9176471, 1,
-0.08330397, -0.7589818, -1.892406, 0, 1, 0.9215686, 1,
-0.08215132, -1.949974, -3.826943, 0, 1, 0.9294118, 1,
-0.07681435, 0.5554739, -0.4713028, 0, 1, 0.9333333, 1,
-0.07122187, -0.4074185, -1.618055, 0, 1, 0.9411765, 1,
-0.07024612, 0.5609483, -0.2726, 0, 1, 0.945098, 1,
-0.06663261, -0.0699169, -3.1061, 0, 1, 0.9529412, 1,
-0.06635704, -1.493089, -4.004148, 0, 1, 0.9568627, 1,
-0.06562653, -1.433027, -3.715278, 0, 1, 0.9647059, 1,
-0.05400739, 0.5860212, 0.06545141, 0, 1, 0.9686275, 1,
-0.04823952, 0.456202, -2.313597, 0, 1, 0.9764706, 1,
-0.0458622, -1.49266, -2.402354, 0, 1, 0.9803922, 1,
-0.04543865, -2.077569, -2.580365, 0, 1, 0.9882353, 1,
-0.04396475, 0.6063703, -0.1478155, 0, 1, 0.9921569, 1,
-0.0424612, -1.302333, -3.164499, 0, 1, 1, 1,
-0.04117148, 1.456335, 0.4564482, 0, 0.9921569, 1, 1,
-0.04053519, -0.8309106, -3.476071, 0, 0.9882353, 1, 1,
-0.03947506, 0.426809, -1.541258, 0, 0.9803922, 1, 1,
-0.0382119, 1.153124, 0.6304242, 0, 0.9764706, 1, 1,
-0.03754691, 1.820017, 0.5011003, 0, 0.9686275, 1, 1,
-0.03350818, 1.105793, 0.07508068, 0, 0.9647059, 1, 1,
-0.02945459, -0.0252014, -0.6374943, 0, 0.9568627, 1, 1,
-0.02581201, -0.6071285, -3.180276, 0, 0.9529412, 1, 1,
-0.02369495, -0.5379549, -1.729683, 0, 0.945098, 1, 1,
-0.01883099, 1.043601, -0.5959355, 0, 0.9411765, 1, 1,
-0.01176975, -0.2666649, -4.083333, 0, 0.9333333, 1, 1,
-0.005022631, 0.841265, -0.05195679, 0, 0.9294118, 1, 1,
-0.002039464, -0.752803, -1.752148, 0, 0.9215686, 1, 1,
-0.0008514803, -0.5458865, -2.628738, 0, 0.9176471, 1, 1,
0.0007389128, -0.7122686, 2.234524, 0, 0.9098039, 1, 1,
0.004311773, 0.1720159, 1.301409, 0, 0.9058824, 1, 1,
0.009524242, 0.9564683, -0.2740289, 0, 0.8980392, 1, 1,
0.009949583, -0.6846705, 3.009722, 0, 0.8901961, 1, 1,
0.01014928, -0.06156874, 3.178959, 0, 0.8862745, 1, 1,
0.01258157, 0.2595334, 1.435081, 0, 0.8784314, 1, 1,
0.01397703, -0.5825426, 2.529851, 0, 0.8745098, 1, 1,
0.02196583, 1.182571, -1.500083, 0, 0.8666667, 1, 1,
0.02496749, 0.37719, -2.62149, 0, 0.8627451, 1, 1,
0.03040772, 0.2910684, 0.2307983, 0, 0.854902, 1, 1,
0.03132799, -0.3083769, 3.49744, 0, 0.8509804, 1, 1,
0.03276409, 0.2313936, -0.04150528, 0, 0.8431373, 1, 1,
0.03739611, 0.9813661, -0.6763555, 0, 0.8392157, 1, 1,
0.0387731, -0.5863801, 2.563845, 0, 0.8313726, 1, 1,
0.0390657, -0.1513372, 1.842121, 0, 0.827451, 1, 1,
0.03906971, -0.1819421, 1.820855, 0, 0.8196079, 1, 1,
0.03942579, -0.6958348, 2.855221, 0, 0.8156863, 1, 1,
0.04082466, 0.6262978, 0.01416537, 0, 0.8078431, 1, 1,
0.04118213, 0.1734303, -1.332972, 0, 0.8039216, 1, 1,
0.04377915, -0.6760966, 4.916427, 0, 0.7960784, 1, 1,
0.04527098, 1.894365, 1.586404, 0, 0.7882353, 1, 1,
0.04724754, -1.142476, 4.322258, 0, 0.7843137, 1, 1,
0.04791298, -0.4623098, 3.574045, 0, 0.7764706, 1, 1,
0.05505859, -1.077513, 4.570638, 0, 0.772549, 1, 1,
0.05928409, -0.494897, 3.078938, 0, 0.7647059, 1, 1,
0.05977736, -1.022374, 2.400919, 0, 0.7607843, 1, 1,
0.07015055, 0.9615101, -1.649104, 0, 0.7529412, 1, 1,
0.07191691, -1.026764, 2.93085, 0, 0.7490196, 1, 1,
0.07238816, -0.8136966, 2.092637, 0, 0.7411765, 1, 1,
0.07650097, 0.002774388, 2.400409, 0, 0.7372549, 1, 1,
0.07862657, -1.25014, 3.497328, 0, 0.7294118, 1, 1,
0.07951377, 0.8941942, -0.004641155, 0, 0.7254902, 1, 1,
0.0876646, 0.2117806, 1.794872, 0, 0.7176471, 1, 1,
0.08971924, 0.5270251, 0.2847807, 0, 0.7137255, 1, 1,
0.08978506, -1.068358, 2.433639, 0, 0.7058824, 1, 1,
0.09089976, 1.512896, -1.213655, 0, 0.6980392, 1, 1,
0.09558673, -0.1297423, 2.813747, 0, 0.6941177, 1, 1,
0.09625507, -0.7595987, 1.92528, 0, 0.6862745, 1, 1,
0.09721718, 0.178669, 1.879948, 0, 0.682353, 1, 1,
0.098143, -0.2182357, 2.154729, 0, 0.6745098, 1, 1,
0.09873202, -0.7360067, 3.418616, 0, 0.6705883, 1, 1,
0.09885267, 0.580183, 0.7952207, 0, 0.6627451, 1, 1,
0.1056212, -0.8711391, 2.22768, 0, 0.6588235, 1, 1,
0.1075762, 0.7795666, -0.6967365, 0, 0.6509804, 1, 1,
0.1174915, 0.7946219, 2.031329, 0, 0.6470588, 1, 1,
0.1243143, 1.030131, -0.2737169, 0, 0.6392157, 1, 1,
0.12493, 1.582349, 0.4523937, 0, 0.6352941, 1, 1,
0.125931, 1.848916, -1.382455, 0, 0.627451, 1, 1,
0.1281823, -0.08780476, 2.744753, 0, 0.6235294, 1, 1,
0.131942, -0.3662986, 3.900371, 0, 0.6156863, 1, 1,
0.1327461, 1.553238, -0.4776134, 0, 0.6117647, 1, 1,
0.1367865, 0.4303566, 0.6889081, 0, 0.6039216, 1, 1,
0.1375732, 0.5337239, -1.944098, 0, 0.5960785, 1, 1,
0.1388247, -0.2747622, 0.6551827, 0, 0.5921569, 1, 1,
0.1415672, 1.644935, -2.449015, 0, 0.5843138, 1, 1,
0.1441911, 0.8864143, -0.4875268, 0, 0.5803922, 1, 1,
0.1487322, 0.764771, -0.6868216, 0, 0.572549, 1, 1,
0.1528653, 0.2268316, -1.307024, 0, 0.5686275, 1, 1,
0.1544438, -0.799448, 1.857486, 0, 0.5607843, 1, 1,
0.1577875, -1.221429, 1.33063, 0, 0.5568628, 1, 1,
0.1578772, -0.1436943, 3.79125, 0, 0.5490196, 1, 1,
0.1589865, -1.812544, 1.271415, 0, 0.5450981, 1, 1,
0.1591655, 1.285786, 2.972688, 0, 0.5372549, 1, 1,
0.1611447, 0.5397363, 0.4893567, 0, 0.5333334, 1, 1,
0.1623508, 0.5838572, 0.441589, 0, 0.5254902, 1, 1,
0.1653376, -0.2080518, 1.966449, 0, 0.5215687, 1, 1,
0.1662938, 1.603996, 1.581522, 0, 0.5137255, 1, 1,
0.1669638, 0.5889112, -0.3029448, 0, 0.509804, 1, 1,
0.1684499, -0.4295528, 2.465204, 0, 0.5019608, 1, 1,
0.1685297, -1.064688, 2.383846, 0, 0.4941176, 1, 1,
0.1703102, -0.2949558, 2.256398, 0, 0.4901961, 1, 1,
0.1706849, 0.5078258, -0.1964858, 0, 0.4823529, 1, 1,
0.1724368, 1.549959, 0.4468474, 0, 0.4784314, 1, 1,
0.1734364, 0.3785369, 0.1680703, 0, 0.4705882, 1, 1,
0.1760121, -0.2316972, 0.9382615, 0, 0.4666667, 1, 1,
0.1761295, 0.1955849, -1.581844, 0, 0.4588235, 1, 1,
0.1771862, -0.3426366, 4.98241, 0, 0.454902, 1, 1,
0.1816377, 0.2349221, 1.134447, 0, 0.4470588, 1, 1,
0.1816816, -1.169132, 2.703825, 0, 0.4431373, 1, 1,
0.1851879, 0.2417498, 2.368244, 0, 0.4352941, 1, 1,
0.1863801, -0.7458372, 3.069095, 0, 0.4313726, 1, 1,
0.1959966, 0.2288302, 1.48265, 0, 0.4235294, 1, 1,
0.1963026, 0.1583232, 2.061508, 0, 0.4196078, 1, 1,
0.197181, 1.10673, -2.198376, 0, 0.4117647, 1, 1,
0.1976717, 1.030704, -0.06368221, 0, 0.4078431, 1, 1,
0.2060507, 0.2154865, 0.6948426, 0, 0.4, 1, 1,
0.2066908, 1.12155, -0.3015806, 0, 0.3921569, 1, 1,
0.2124322, 0.3902356, 0.8935769, 0, 0.3882353, 1, 1,
0.2143186, 0.2519634, 1.2141, 0, 0.3803922, 1, 1,
0.2149603, -0.4486944, 3.78665, 0, 0.3764706, 1, 1,
0.215594, -2.163622, 3.144662, 0, 0.3686275, 1, 1,
0.2197548, -1.410544, 1.864855, 0, 0.3647059, 1, 1,
0.2209988, 0.2292511, 0.1121957, 0, 0.3568628, 1, 1,
0.2215078, 0.4652342, 0.7325926, 0, 0.3529412, 1, 1,
0.2219822, 0.3116497, 1.392336, 0, 0.345098, 1, 1,
0.2240392, -1.484506, 3.643704, 0, 0.3411765, 1, 1,
0.2249664, 0.05309534, 2.964278, 0, 0.3333333, 1, 1,
0.2266302, -0.6968665, 2.447333, 0, 0.3294118, 1, 1,
0.2273748, 1.344609, -0.8532125, 0, 0.3215686, 1, 1,
0.2282079, 0.007236864, 1.355118, 0, 0.3176471, 1, 1,
0.2308192, 0.4609774, 1.062197, 0, 0.3098039, 1, 1,
0.2328784, -0.4040822, -0.7388477, 0, 0.3058824, 1, 1,
0.2330991, 0.4752513, 1.963442, 0, 0.2980392, 1, 1,
0.2337989, -0.09534898, 2.439646, 0, 0.2901961, 1, 1,
0.2459527, -1.393437, 3.849193, 0, 0.2862745, 1, 1,
0.2481595, -0.7392709, 3.923853, 0, 0.2784314, 1, 1,
0.2505651, -0.5146099, 2.732928, 0, 0.2745098, 1, 1,
0.2558221, 0.7950303, 0.5240434, 0, 0.2666667, 1, 1,
0.2590622, -0.867457, 2.743749, 0, 0.2627451, 1, 1,
0.2605006, 0.313314, -0.8416938, 0, 0.254902, 1, 1,
0.2610107, 1.233206, 1.727924, 0, 0.2509804, 1, 1,
0.2616303, -1.93364, 2.053185, 0, 0.2431373, 1, 1,
0.2618956, 1.016997, 0.100589, 0, 0.2392157, 1, 1,
0.2657739, 0.319095, 1.398208, 0, 0.2313726, 1, 1,
0.2668349, -0.4533475, 0.2267703, 0, 0.227451, 1, 1,
0.2668646, -0.1906513, 2.977026, 0, 0.2196078, 1, 1,
0.2670909, 1.225752, -1.518507, 0, 0.2156863, 1, 1,
0.2696775, 0.06372968, 0.5549473, 0, 0.2078431, 1, 1,
0.270421, 0.3288722, -0.4937309, 0, 0.2039216, 1, 1,
0.2716599, -0.02605029, 0.9040439, 0, 0.1960784, 1, 1,
0.2753693, -0.2044812, 1.384001, 0, 0.1882353, 1, 1,
0.2785327, 0.2499627, 1.715229, 0, 0.1843137, 1, 1,
0.2799594, 0.2301275, 0.06885619, 0, 0.1764706, 1, 1,
0.2806551, 2.375309, 1.162662, 0, 0.172549, 1, 1,
0.2819816, 0.6286578, 1.756081, 0, 0.1647059, 1, 1,
0.2840694, -0.3238736, 3.350474, 0, 0.1607843, 1, 1,
0.2890488, 0.7391627, -0.2644724, 0, 0.1529412, 1, 1,
0.2956563, -0.1076116, 1.79844, 0, 0.1490196, 1, 1,
0.2967807, 0.4233176, 0.1497563, 0, 0.1411765, 1, 1,
0.3026364, 0.5126324, -0.1574386, 0, 0.1372549, 1, 1,
0.3047222, 2.036034, 0.1417397, 0, 0.1294118, 1, 1,
0.3060316, 0.3815248, 1.322158, 0, 0.1254902, 1, 1,
0.3062477, 0.6284472, 1.193811, 0, 0.1176471, 1, 1,
0.3070147, -0.7161539, 2.108125, 0, 0.1137255, 1, 1,
0.3078123, -0.7985491, 2.27572, 0, 0.1058824, 1, 1,
0.3102009, -0.9028806, 3.107462, 0, 0.09803922, 1, 1,
0.3116297, -0.8549789, 2.33855, 0, 0.09411765, 1, 1,
0.314188, 0.187321, -0.2073766, 0, 0.08627451, 1, 1,
0.3159183, -1.417391, 4.236207, 0, 0.08235294, 1, 1,
0.3187541, -0.2110327, 2.251753, 0, 0.07450981, 1, 1,
0.3197323, -0.4875964, 2.607789, 0, 0.07058824, 1, 1,
0.3210268, -1.235366, 5.304246, 0, 0.0627451, 1, 1,
0.3210639, 0.9353912, 1.039466, 0, 0.05882353, 1, 1,
0.3250601, -0.497375, 3.68357, 0, 0.05098039, 1, 1,
0.3254405, 0.07515299, 1.860073, 0, 0.04705882, 1, 1,
0.3374204, 1.668012, 1.179255, 0, 0.03921569, 1, 1,
0.3406174, 0.3155764, -0.7089332, 0, 0.03529412, 1, 1,
0.3410667, 1.169985, -0.7100308, 0, 0.02745098, 1, 1,
0.3440375, -0.595685, 3.536118, 0, 0.02352941, 1, 1,
0.3460948, 0.9733562, 0.8050579, 0, 0.01568628, 1, 1,
0.3507017, 0.2151969, 1.773968, 0, 0.01176471, 1, 1,
0.3511212, -0.2767283, 2.005213, 0, 0.003921569, 1, 1,
0.3515605, -0.6723778, 3.387119, 0.003921569, 0, 1, 1,
0.3517533, -0.324264, 2.952925, 0.007843138, 0, 1, 1,
0.3578663, 1.033163, 0.1884108, 0.01568628, 0, 1, 1,
0.3584967, 0.7497444, 0.3261635, 0.01960784, 0, 1, 1,
0.3600003, 1.750488, 1.485759, 0.02745098, 0, 1, 1,
0.3646288, 0.6634901, 1.396346, 0.03137255, 0, 1, 1,
0.3656568, -0.8615003, 2.278168, 0.03921569, 0, 1, 1,
0.3677686, 0.9765516, 2.872808, 0.04313726, 0, 1, 1,
0.369238, -0.01740417, 0.5600822, 0.05098039, 0, 1, 1,
0.3754776, -1.41323, 4.719615, 0.05490196, 0, 1, 1,
0.3805697, -0.1419055, 1.087067, 0.0627451, 0, 1, 1,
0.3836651, -0.7789634, 3.165751, 0.06666667, 0, 1, 1,
0.3837627, -1.445863, 3.843289, 0.07450981, 0, 1, 1,
0.3863842, 0.5383416, -0.4377933, 0.07843138, 0, 1, 1,
0.3875197, 2.596631, -0.6972285, 0.08627451, 0, 1, 1,
0.3885294, -0.1211912, 1.040846, 0.09019608, 0, 1, 1,
0.3920378, 0.6642612, 0.08722829, 0.09803922, 0, 1, 1,
0.3946404, -2.100017, 2.885308, 0.1058824, 0, 1, 1,
0.3950002, -0.1764855, 1.425272, 0.1098039, 0, 1, 1,
0.3981272, 0.0410453, 1.402224, 0.1176471, 0, 1, 1,
0.3988177, -2.89591, 4.269371, 0.1215686, 0, 1, 1,
0.4084502, -0.7297111, 2.18492, 0.1294118, 0, 1, 1,
0.4109883, 1.822461, 1.581886, 0.1333333, 0, 1, 1,
0.4111401, -0.333994, 0.7647076, 0.1411765, 0, 1, 1,
0.4113525, 0.9910603, 2.226305, 0.145098, 0, 1, 1,
0.41681, 0.5127825, 3.60507, 0.1529412, 0, 1, 1,
0.4211379, -1.030357, 1.173349, 0.1568628, 0, 1, 1,
0.4216163, -0.2304561, 0.7873414, 0.1647059, 0, 1, 1,
0.4231742, 0.4547686, 0.6898717, 0.1686275, 0, 1, 1,
0.4240395, -0.3997804, 2.303176, 0.1764706, 0, 1, 1,
0.4300791, -0.340925, 2.329449, 0.1803922, 0, 1, 1,
0.4308205, -1.121318, 2.826186, 0.1882353, 0, 1, 1,
0.4327035, 0.2781912, 2.63063, 0.1921569, 0, 1, 1,
0.4387161, 0.3306165, 2.123276, 0.2, 0, 1, 1,
0.4562796, -1.846599, 1.408307, 0.2078431, 0, 1, 1,
0.4570479, 2.270287, -0.03092143, 0.2117647, 0, 1, 1,
0.4622127, -0.747021, 2.081553, 0.2196078, 0, 1, 1,
0.4692254, 0.9954591, 1.09447, 0.2235294, 0, 1, 1,
0.4780612, -0.956879, 3.993783, 0.2313726, 0, 1, 1,
0.4790628, -1.122155, 3.298196, 0.2352941, 0, 1, 1,
0.4840116, 0.1607342, 0.8767493, 0.2431373, 0, 1, 1,
0.4858412, -0.3373655, 3.886422, 0.2470588, 0, 1, 1,
0.493631, -0.6104239, 3.873125, 0.254902, 0, 1, 1,
0.5001498, 1.655881, 0.6807334, 0.2588235, 0, 1, 1,
0.5032977, 0.0604515, 3.383255, 0.2666667, 0, 1, 1,
0.5041016, -0.1151, 2.970314, 0.2705882, 0, 1, 1,
0.504151, 0.3448888, 1.143149, 0.2784314, 0, 1, 1,
0.5041569, -0.006776832, 1.606721, 0.282353, 0, 1, 1,
0.5074984, -1.903547, 2.964728, 0.2901961, 0, 1, 1,
0.5088343, 1.500972, -0.2926418, 0.2941177, 0, 1, 1,
0.5151242, 0.6284067, 0.2092259, 0.3019608, 0, 1, 1,
0.5152623, -0.6869602, 4.122392, 0.3098039, 0, 1, 1,
0.5165648, 0.3017381, 0.8442545, 0.3137255, 0, 1, 1,
0.5198306, -1.441108, 3.00511, 0.3215686, 0, 1, 1,
0.5247535, 1.966299, -1.03461, 0.3254902, 0, 1, 1,
0.5315189, 0.609846, 1.520515, 0.3333333, 0, 1, 1,
0.5349962, 1.969181, 1.45592, 0.3372549, 0, 1, 1,
0.539883, 1.340606, -0.3392121, 0.345098, 0, 1, 1,
0.5465932, 0.8559725, 0.09104256, 0.3490196, 0, 1, 1,
0.5545174, 1.750263, 0.05570208, 0.3568628, 0, 1, 1,
0.5566202, -0.3633523, 1.308517, 0.3607843, 0, 1, 1,
0.5589944, 0.6493793, 0.9225708, 0.3686275, 0, 1, 1,
0.5645499, 1.519487, 1.556976, 0.372549, 0, 1, 1,
0.5677842, 0.8903826, 1.314028, 0.3803922, 0, 1, 1,
0.570666, 0.1289014, 1.758844, 0.3843137, 0, 1, 1,
0.5713509, -1.327164, 4.024415, 0.3921569, 0, 1, 1,
0.5769589, 0.1070275, 1.449497, 0.3960784, 0, 1, 1,
0.5797225, 1.329234, 0.009197154, 0.4039216, 0, 1, 1,
0.5838819, 0.8337566, 0.3291729, 0.4117647, 0, 1, 1,
0.585465, 0.4884468, 1.729104, 0.4156863, 0, 1, 1,
0.5901843, -0.3437465, 3.300381, 0.4235294, 0, 1, 1,
0.5997317, 0.5999243, 2.206027, 0.427451, 0, 1, 1,
0.601469, 0.896786, 0.5433708, 0.4352941, 0, 1, 1,
0.601827, -0.6505706, 0.9442904, 0.4392157, 0, 1, 1,
0.6037722, 0.1925155, 1.990657, 0.4470588, 0, 1, 1,
0.6079058, -2.874092, 3.057153, 0.4509804, 0, 1, 1,
0.6082209, 0.5293035, -0.7339211, 0.4588235, 0, 1, 1,
0.6129027, 0.4165761, 2.20455, 0.4627451, 0, 1, 1,
0.6130536, 0.2780842, 0.3796999, 0.4705882, 0, 1, 1,
0.6149909, 0.002981333, 1.717902, 0.4745098, 0, 1, 1,
0.6155887, 0.5742127, -0.8693757, 0.4823529, 0, 1, 1,
0.6249256, 0.7372745, 0.7504566, 0.4862745, 0, 1, 1,
0.6390038, -1.334817, 2.938184, 0.4941176, 0, 1, 1,
0.6420808, -1.982984, 1.120497, 0.5019608, 0, 1, 1,
0.643365, -0.7898383, 3.279166, 0.5058824, 0, 1, 1,
0.6458414, -0.006177301, 0.1324956, 0.5137255, 0, 1, 1,
0.6480966, -0.3704188, 3.022941, 0.5176471, 0, 1, 1,
0.6493524, 0.4163998, 1.440837, 0.5254902, 0, 1, 1,
0.6595504, -0.2422291, 1.551131, 0.5294118, 0, 1, 1,
0.6601197, -0.6802702, 1.782027, 0.5372549, 0, 1, 1,
0.6621181, 0.5762991, 1.871427, 0.5411765, 0, 1, 1,
0.6622645, -0.2909923, 2.564896, 0.5490196, 0, 1, 1,
0.6646993, 0.2048615, 0.6115422, 0.5529412, 0, 1, 1,
0.6669191, 0.02765173, 3.002518, 0.5607843, 0, 1, 1,
0.6672615, -1.729443, 2.079064, 0.5647059, 0, 1, 1,
0.6741534, 0.565638, -0.1240254, 0.572549, 0, 1, 1,
0.6742563, -0.2034652, 1.859789, 0.5764706, 0, 1, 1,
0.6810979, 0.2314295, 2.200313, 0.5843138, 0, 1, 1,
0.683035, -0.4291959, 3.020654, 0.5882353, 0, 1, 1,
0.6856629, 0.8006223, 2.581226, 0.5960785, 0, 1, 1,
0.6893189, -0.2697402, 1.125206, 0.6039216, 0, 1, 1,
0.6910694, -0.883607, 3.784581, 0.6078432, 0, 1, 1,
0.6928071, 0.4159575, 2.111148, 0.6156863, 0, 1, 1,
0.6932085, 0.8465403, 1.796555, 0.6196079, 0, 1, 1,
0.6935763, 0.8152263, 0.1441083, 0.627451, 0, 1, 1,
0.6949741, -1.125989, 1.308876, 0.6313726, 0, 1, 1,
0.6956925, -1.393903, 2.343102, 0.6392157, 0, 1, 1,
0.6958559, -0.01658801, 0.1829211, 0.6431373, 0, 1, 1,
0.6982059, -1.490298, 1.019599, 0.6509804, 0, 1, 1,
0.7010422, 0.3951826, -0.2748204, 0.654902, 0, 1, 1,
0.7022641, -0.9896172, 0.9872622, 0.6627451, 0, 1, 1,
0.7045665, -0.7191945, 1.316083, 0.6666667, 0, 1, 1,
0.7056137, 0.2039467, 1.376672, 0.6745098, 0, 1, 1,
0.715215, 0.8054844, -0.6912431, 0.6784314, 0, 1, 1,
0.7172971, -0.8202895, 1.695787, 0.6862745, 0, 1, 1,
0.7198747, -0.9927564, 2.317311, 0.6901961, 0, 1, 1,
0.7234085, 0.5935015, 0.1557767, 0.6980392, 0, 1, 1,
0.7301037, -0.01831258, 1.879995, 0.7058824, 0, 1, 1,
0.7325479, 0.121906, 1.99037, 0.7098039, 0, 1, 1,
0.7369092, 2.558056, -0.2072426, 0.7176471, 0, 1, 1,
0.7386136, 0.1198127, -0.6702003, 0.7215686, 0, 1, 1,
0.7415584, -0.911645, 1.945975, 0.7294118, 0, 1, 1,
0.7449258, 0.9373823, -0.2283664, 0.7333333, 0, 1, 1,
0.7464152, 1.503968, 0.4964612, 0.7411765, 0, 1, 1,
0.7508644, 0.8293235, 2.121735, 0.7450981, 0, 1, 1,
0.7651968, -1.942588, 1.285936, 0.7529412, 0, 1, 1,
0.7685477, -0.9445368, 3.903905, 0.7568628, 0, 1, 1,
0.771857, -0.04398988, 0.9707857, 0.7647059, 0, 1, 1,
0.7744066, -1.394826, 2.782219, 0.7686275, 0, 1, 1,
0.7752659, 0.01378398, 1.018306, 0.7764706, 0, 1, 1,
0.7795895, -1.122617, 3.495067, 0.7803922, 0, 1, 1,
0.7813647, -0.9089755, 2.78556, 0.7882353, 0, 1, 1,
0.7838398, -0.5211051, 1.171519, 0.7921569, 0, 1, 1,
0.7940047, 1.676579, 0.1391414, 0.8, 0, 1, 1,
0.8036336, -0.7678273, 2.639787, 0.8078431, 0, 1, 1,
0.8036821, 1.396293, 0.8320672, 0.8117647, 0, 1, 1,
0.8064178, 0.9279468, 1.55659, 0.8196079, 0, 1, 1,
0.8132095, -0.3896798, 2.10047, 0.8235294, 0, 1, 1,
0.8142892, 0.684644, 0.02868292, 0.8313726, 0, 1, 1,
0.825058, -1.449531, 4.198239, 0.8352941, 0, 1, 1,
0.8273611, 0.2147802, 2.181392, 0.8431373, 0, 1, 1,
0.8316016, -0.7662855, 2.343427, 0.8470588, 0, 1, 1,
0.8386069, -0.2236409, 4.358677, 0.854902, 0, 1, 1,
0.8407902, 1.403096, 0.8787315, 0.8588235, 0, 1, 1,
0.8537733, -0.3273134, -0.179702, 0.8666667, 0, 1, 1,
0.8589495, -1.760479, 2.206504, 0.8705882, 0, 1, 1,
0.8616115, 0.719344, -0.3759712, 0.8784314, 0, 1, 1,
0.863065, -0.003795548, 1.499461, 0.8823529, 0, 1, 1,
0.8693613, 0.5543854, -0.1324161, 0.8901961, 0, 1, 1,
0.8793224, 0.4700896, 0.07802857, 0.8941177, 0, 1, 1,
0.8805422, 0.690772, 2.908156, 0.9019608, 0, 1, 1,
0.8839865, -0.6139016, 4.331836, 0.9098039, 0, 1, 1,
0.8849751, -0.6671309, 0.4398895, 0.9137255, 0, 1, 1,
0.897935, 0.1866185, 0.1740922, 0.9215686, 0, 1, 1,
0.9062138, 1.426708, -1.05209, 0.9254902, 0, 1, 1,
0.9068596, 0.4449481, 2.312971, 0.9333333, 0, 1, 1,
0.910468, 0.00309223, 1.799267, 0.9372549, 0, 1, 1,
0.9151196, 1.951845, 0.451414, 0.945098, 0, 1, 1,
0.9294025, -1.673442, 1.337013, 0.9490196, 0, 1, 1,
0.9327984, 0.4429566, 0.8730384, 0.9568627, 0, 1, 1,
0.9357761, -1.227859, 1.587058, 0.9607843, 0, 1, 1,
0.9442232, -0.648776, 3.36346, 0.9686275, 0, 1, 1,
0.9584162, -0.6511219, 0.9313691, 0.972549, 0, 1, 1,
0.9604913, -0.7167687, 0.3512732, 0.9803922, 0, 1, 1,
0.9635472, 1.715293, 0.7794174, 0.9843137, 0, 1, 1,
0.9642423, 0.7923132, 1.401895, 0.9921569, 0, 1, 1,
0.9652781, -2.051554, 4.230232, 0.9960784, 0, 1, 1,
0.9667606, 1.226854, 1.724261, 1, 0, 0.9960784, 1,
0.9690069, 1.443158, 1.351114, 1, 0, 0.9882353, 1,
0.9707774, -2.050411, 3.121981, 1, 0, 0.9843137, 1,
0.9712102, -0.3194557, 2.70512, 1, 0, 0.9764706, 1,
0.9741336, 0.6153038, 1.928699, 1, 0, 0.972549, 1,
0.9762142, 0.0139047, 2.626865, 1, 0, 0.9647059, 1,
0.9777576, -0.4774796, 2.40364, 1, 0, 0.9607843, 1,
0.9803363, 0.1525998, 0.401006, 1, 0, 0.9529412, 1,
0.9864249, -0.3240159, 2.932668, 1, 0, 0.9490196, 1,
0.987057, -0.4588853, 2.271717, 1, 0, 0.9411765, 1,
0.9880032, -0.4347058, 2.815562, 1, 0, 0.9372549, 1,
0.9926066, -0.218401, 0.856001, 1, 0, 0.9294118, 1,
0.9948823, 1.488761, 0.4187388, 1, 0, 0.9254902, 1,
1.011334, 1.414085, 1.311352, 1, 0, 0.9176471, 1,
1.013932, 0.4905732, 2.024621, 1, 0, 0.9137255, 1,
1.014819, 1.539101, 1.578238, 1, 0, 0.9058824, 1,
1.015412, -0.5831568, 2.782146, 1, 0, 0.9019608, 1,
1.019286, 0.353276, 1.060407, 1, 0, 0.8941177, 1,
1.022398, 0.2542565, 2.521946, 1, 0, 0.8862745, 1,
1.024548, 0.3807719, 0.3973857, 1, 0, 0.8823529, 1,
1.024605, 0.01118266, 1.122604, 1, 0, 0.8745098, 1,
1.027096, 0.02022292, 2.481973, 1, 0, 0.8705882, 1,
1.039787, 0.7714579, 0.8523396, 1, 0, 0.8627451, 1,
1.040049, -0.3668607, 2.321713, 1, 0, 0.8588235, 1,
1.048635, 0.5905635, 0.4300818, 1, 0, 0.8509804, 1,
1.048771, 1.043573, 1.516684, 1, 0, 0.8470588, 1,
1.054472, 1.248492, 0.9453852, 1, 0, 0.8392157, 1,
1.05824, 0.5941153, 1.116169, 1, 0, 0.8352941, 1,
1.064066, 0.5750718, 1.576209, 1, 0, 0.827451, 1,
1.064364, 1.529937, 1.263138, 1, 0, 0.8235294, 1,
1.065341, 0.2297464, 3.481673, 1, 0, 0.8156863, 1,
1.065975, -0.002459234, 1.52986, 1, 0, 0.8117647, 1,
1.067274, 0.2571017, 1.406782, 1, 0, 0.8039216, 1,
1.070902, -1.026203, 3.477579, 1, 0, 0.7960784, 1,
1.075335, -1.090087, 2.083039, 1, 0, 0.7921569, 1,
1.077229, -0.4180162, 2.69839, 1, 0, 0.7843137, 1,
1.082137, -0.3769044, -0.2768984, 1, 0, 0.7803922, 1,
1.089131, -0.229209, 2.315706, 1, 0, 0.772549, 1,
1.093991, 1.273726, 1.618177, 1, 0, 0.7686275, 1,
1.100613, 0.595589, 2.220803, 1, 0, 0.7607843, 1,
1.105182, -0.5342462, 0.5349698, 1, 0, 0.7568628, 1,
1.10699, -0.8429216, 1.278079, 1, 0, 0.7490196, 1,
1.107034, 1.950104, -0.5433972, 1, 0, 0.7450981, 1,
1.113522, -1.18261, 2.67017, 1, 0, 0.7372549, 1,
1.115932, -0.6530403, 1.659355, 1, 0, 0.7333333, 1,
1.125545, -0.8534886, 1.926247, 1, 0, 0.7254902, 1,
1.130392, -1.048542, 1.986909, 1, 0, 0.7215686, 1,
1.134964, -2.189105, 3.069506, 1, 0, 0.7137255, 1,
1.136287, -0.07048701, 3.352709, 1, 0, 0.7098039, 1,
1.136291, 0.2401443, 1.590459, 1, 0, 0.7019608, 1,
1.140437, -0.1281877, 1.345336, 1, 0, 0.6941177, 1,
1.141259, -0.07971893, 1.966638, 1, 0, 0.6901961, 1,
1.174156, -0.4171981, 1.334898, 1, 0, 0.682353, 1,
1.179332, -0.7637661, 1.63548, 1, 0, 0.6784314, 1,
1.180914, 1.845782, 0.8898836, 1, 0, 0.6705883, 1,
1.18122, 0.04403973, 2.229465, 1, 0, 0.6666667, 1,
1.185211, 0.5396334, 0.2927483, 1, 0, 0.6588235, 1,
1.194099, 0.2838312, -0.1062259, 1, 0, 0.654902, 1,
1.196077, -0.8847416, 2.803889, 1, 0, 0.6470588, 1,
1.19862, -1.144702, 1.952535, 1, 0, 0.6431373, 1,
1.201432, 0.7465884, -0.2056888, 1, 0, 0.6352941, 1,
1.203237, -0.4940623, 0.8063811, 1, 0, 0.6313726, 1,
1.203662, -0.1200097, 2.321056, 1, 0, 0.6235294, 1,
1.223793, 1.159868, 0.1727642, 1, 0, 0.6196079, 1,
1.226065, -0.4096577, 0.8088751, 1, 0, 0.6117647, 1,
1.228964, -0.5663025, 1.321062, 1, 0, 0.6078432, 1,
1.230148, 1.479011, -1.452873, 1, 0, 0.6, 1,
1.235394, 0.9907838, 1.195604, 1, 0, 0.5921569, 1,
1.238115, 1.594194, -0.008949251, 1, 0, 0.5882353, 1,
1.241292, -1.809628, 2.222704, 1, 0, 0.5803922, 1,
1.244294, -0.03841555, 1.885773, 1, 0, 0.5764706, 1,
1.262977, -0.7659751, 1.20972, 1, 0, 0.5686275, 1,
1.288761, 0.1287986, 2.14657, 1, 0, 0.5647059, 1,
1.293957, -0.9355962, 1.960295, 1, 0, 0.5568628, 1,
1.304176, -1.594516, 1.521923, 1, 0, 0.5529412, 1,
1.31039, -1.101582, 3.498037, 1, 0, 0.5450981, 1,
1.310823, -0.9189491, 2.580159, 1, 0, 0.5411765, 1,
1.33056, 0.899404, 1.528549, 1, 0, 0.5333334, 1,
1.332979, 0.4900374, 1.786422, 1, 0, 0.5294118, 1,
1.34312, -0.3360763, 3.428547, 1, 0, 0.5215687, 1,
1.347216, 0.03217516, 0.8851131, 1, 0, 0.5176471, 1,
1.357028, -1.320168, 1.543063, 1, 0, 0.509804, 1,
1.359675, 1.000981, 0.5614237, 1, 0, 0.5058824, 1,
1.362225, 0.240155, -0.3078182, 1, 0, 0.4980392, 1,
1.364551, 0.9705793, 0.3823912, 1, 0, 0.4901961, 1,
1.366416, -0.3364787, 1.632581, 1, 0, 0.4862745, 1,
1.376064, -1.467424, 2.097654, 1, 0, 0.4784314, 1,
1.383945, -1.183239, 2.514627, 1, 0, 0.4745098, 1,
1.39518, -0.03453667, 2.13252, 1, 0, 0.4666667, 1,
1.401473, -0.1921868, 1.853693, 1, 0, 0.4627451, 1,
1.41314, 0.195888, 0.5610069, 1, 0, 0.454902, 1,
1.41655, 0.6382305, 1.068394, 1, 0, 0.4509804, 1,
1.418611, 0.8711004, 2.263453, 1, 0, 0.4431373, 1,
1.421503, 0.912466, -0.7567491, 1, 0, 0.4392157, 1,
1.42477, -0.3226102, 1.899568, 1, 0, 0.4313726, 1,
1.42726, 0.1677994, 1.526326, 1, 0, 0.427451, 1,
1.427708, -0.253564, 1.574531, 1, 0, 0.4196078, 1,
1.431494, -0.11398, 1.969969, 1, 0, 0.4156863, 1,
1.433865, 1.628977, 0.6266444, 1, 0, 0.4078431, 1,
1.448828, -0.05554312, 0.6789619, 1, 0, 0.4039216, 1,
1.477348, -1.261878, 1.096748, 1, 0, 0.3960784, 1,
1.48454, -0.572232, 4.167315, 1, 0, 0.3882353, 1,
1.485336, -0.6248072, 1.41609, 1, 0, 0.3843137, 1,
1.493494, 2.246582, 0.1678557, 1, 0, 0.3764706, 1,
1.503728, 0.5056347, 1.320958, 1, 0, 0.372549, 1,
1.506288, 1.245904, -0.08604378, 1, 0, 0.3647059, 1,
1.514821, 2.30085, -0.9069906, 1, 0, 0.3607843, 1,
1.518705, 1.136161, 1.197266, 1, 0, 0.3529412, 1,
1.520039, 0.1087588, 1.236202, 1, 0, 0.3490196, 1,
1.522977, -0.2862076, 2.142619, 1, 0, 0.3411765, 1,
1.55248, -0.9477164, 2.087187, 1, 0, 0.3372549, 1,
1.559, 0.4286242, 0.7448815, 1, 0, 0.3294118, 1,
1.601392, -0.2758774, 1.212607, 1, 0, 0.3254902, 1,
1.604095, -2.208329, 3.299062, 1, 0, 0.3176471, 1,
1.616117, 0.9002008, 2.048869, 1, 0, 0.3137255, 1,
1.624696, -1.103364, 0.8787798, 1, 0, 0.3058824, 1,
1.642621, 1.847082, 1.698266, 1, 0, 0.2980392, 1,
1.643157, 2.345592, 0.7313799, 1, 0, 0.2941177, 1,
1.658627, 1.11921, 0.2255583, 1, 0, 0.2862745, 1,
1.66293, -0.5445201, 3.474557, 1, 0, 0.282353, 1,
1.667152, -1.715028, 2.399861, 1, 0, 0.2745098, 1,
1.676184, -1.669792, 1.154165, 1, 0, 0.2705882, 1,
1.682796, 1.97412, 1.732201, 1, 0, 0.2627451, 1,
1.683562, 0.1775571, 2.721255, 1, 0, 0.2588235, 1,
1.684884, 0.2469718, 2.308951, 1, 0, 0.2509804, 1,
1.706222, 0.2605331, 2.070575, 1, 0, 0.2470588, 1,
1.70884, -0.6650184, 3.681961, 1, 0, 0.2392157, 1,
1.723032, 1.815041, 2.158219, 1, 0, 0.2352941, 1,
1.726774, -1.744148, 3.081136, 1, 0, 0.227451, 1,
1.733479, -0.1764022, 1.94454, 1, 0, 0.2235294, 1,
1.736259, 0.1903744, 0.8388491, 1, 0, 0.2156863, 1,
1.738049, -0.1126879, 2.164371, 1, 0, 0.2117647, 1,
1.761035, -0.4915701, 2.164844, 1, 0, 0.2039216, 1,
1.778615, -0.7467065, 2.665268, 1, 0, 0.1960784, 1,
1.783472, -1.073793, 2.53284, 1, 0, 0.1921569, 1,
1.788499, -1.526528, 2.882517, 1, 0, 0.1843137, 1,
1.807361, 0.7625983, 2.088715, 1, 0, 0.1803922, 1,
1.810747, -0.9674493, 1.798113, 1, 0, 0.172549, 1,
1.827251, 2.060308, -0.01574712, 1, 0, 0.1686275, 1,
1.827836, -1.407104, 1.907117, 1, 0, 0.1607843, 1,
1.839956, 1.861466, 0.2115918, 1, 0, 0.1568628, 1,
1.845225, -0.4872241, 3.23747, 1, 0, 0.1490196, 1,
1.858642, 1.561157, 1.32462, 1, 0, 0.145098, 1,
1.88793, 1.253305, 0.8704344, 1, 0, 0.1372549, 1,
1.911305, -0.001725352, 2.279622, 1, 0, 0.1333333, 1,
1.916868, -1.19398, 1.24891, 1, 0, 0.1254902, 1,
1.918781, -0.1630554, 0.5226916, 1, 0, 0.1215686, 1,
1.929355, 0.9559795, 0.1951598, 1, 0, 0.1137255, 1,
1.958316, 0.4696187, 1.346012, 1, 0, 0.1098039, 1,
1.991076, 2.062805, 0.7363505, 1, 0, 0.1019608, 1,
2.037724, 0.258566, 0.6448004, 1, 0, 0.09411765, 1,
2.103627, 0.2659172, 0.7899262, 1, 0, 0.09019608, 1,
2.168443, -0.1270252, 2.016276, 1, 0, 0.08235294, 1,
2.215734, 2.174685, -0.7759612, 1, 0, 0.07843138, 1,
2.226066, 0.4565797, 2.126023, 1, 0, 0.07058824, 1,
2.259871, 0.7064342, -0.1360662, 1, 0, 0.06666667, 1,
2.297951, -0.03492176, 2.74711, 1, 0, 0.05882353, 1,
2.300231, 0.1625485, -0.5550648, 1, 0, 0.05490196, 1,
2.41464, -0.1716985, 3.105819, 1, 0, 0.04705882, 1,
2.555288, 0.6501454, 1.383815, 1, 0, 0.04313726, 1,
2.579847, -1.848749, 0.9841663, 1, 0, 0.03529412, 1,
2.775064, -1.055286, 2.110199, 1, 0, 0.03137255, 1,
2.811342, -0.05112844, 1.268264, 1, 0, 0.02352941, 1,
2.946295, 2.16647, 1.128229, 1, 0, 0.01960784, 1,
2.995216, 0.4797438, 0.6959419, 1, 0, 0.01176471, 1,
3.346062, -1.873058, 3.419545, 1, 0, 0.007843138, 1
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
0.168968, -4.76073, -7.250029, 0, -0.5, 0.5, 0.5,
0.168968, -4.76073, -7.250029, 1, -0.5, 0.5, 0.5,
0.168968, -4.76073, -7.250029, 1, 1.5, 0.5, 0.5,
0.168968, -4.76073, -7.250029, 0, 1.5, 0.5, 0.5
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
-4.085162, -0.3870454, -7.250029, 0, -0.5, 0.5, 0.5,
-4.085162, -0.3870454, -7.250029, 1, -0.5, 0.5, 0.5,
-4.085162, -0.3870454, -7.250029, 1, 1.5, 0.5, 0.5,
-4.085162, -0.3870454, -7.250029, 0, 1.5, 0.5, 0.5
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
-4.085162, -4.76073, -0.06312251, 0, -0.5, 0.5, 0.5,
-4.085162, -4.76073, -0.06312251, 1, -0.5, 0.5, 0.5,
-4.085162, -4.76073, -0.06312251, 1, 1.5, 0.5, 0.5,
-4.085162, -4.76073, -0.06312251, 0, 1.5, 0.5, 0.5
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
-3, -3.751418, -5.591512,
3, -3.751418, -5.591512,
-3, -3.751418, -5.591512,
-3, -3.919637, -5.867931,
-2, -3.751418, -5.591512,
-2, -3.919637, -5.867931,
-1, -3.751418, -5.591512,
-1, -3.919637, -5.867931,
0, -3.751418, -5.591512,
0, -3.919637, -5.867931,
1, -3.751418, -5.591512,
1, -3.919637, -5.867931,
2, -3.751418, -5.591512,
2, -3.919637, -5.867931,
3, -3.751418, -5.591512,
3, -3.919637, -5.867931
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
-3, -4.256074, -6.420771, 0, -0.5, 0.5, 0.5,
-3, -4.256074, -6.420771, 1, -0.5, 0.5, 0.5,
-3, -4.256074, -6.420771, 1, 1.5, 0.5, 0.5,
-3, -4.256074, -6.420771, 0, 1.5, 0.5, 0.5,
-2, -4.256074, -6.420771, 0, -0.5, 0.5, 0.5,
-2, -4.256074, -6.420771, 1, -0.5, 0.5, 0.5,
-2, -4.256074, -6.420771, 1, 1.5, 0.5, 0.5,
-2, -4.256074, -6.420771, 0, 1.5, 0.5, 0.5,
-1, -4.256074, -6.420771, 0, -0.5, 0.5, 0.5,
-1, -4.256074, -6.420771, 1, -0.5, 0.5, 0.5,
-1, -4.256074, -6.420771, 1, 1.5, 0.5, 0.5,
-1, -4.256074, -6.420771, 0, 1.5, 0.5, 0.5,
0, -4.256074, -6.420771, 0, -0.5, 0.5, 0.5,
0, -4.256074, -6.420771, 1, -0.5, 0.5, 0.5,
0, -4.256074, -6.420771, 1, 1.5, 0.5, 0.5,
0, -4.256074, -6.420771, 0, 1.5, 0.5, 0.5,
1, -4.256074, -6.420771, 0, -0.5, 0.5, 0.5,
1, -4.256074, -6.420771, 1, -0.5, 0.5, 0.5,
1, -4.256074, -6.420771, 1, 1.5, 0.5, 0.5,
1, -4.256074, -6.420771, 0, 1.5, 0.5, 0.5,
2, -4.256074, -6.420771, 0, -0.5, 0.5, 0.5,
2, -4.256074, -6.420771, 1, -0.5, 0.5, 0.5,
2, -4.256074, -6.420771, 1, 1.5, 0.5, 0.5,
2, -4.256074, -6.420771, 0, 1.5, 0.5, 0.5,
3, -4.256074, -6.420771, 0, -0.5, 0.5, 0.5,
3, -4.256074, -6.420771, 1, -0.5, 0.5, 0.5,
3, -4.256074, -6.420771, 1, 1.5, 0.5, 0.5,
3, -4.256074, -6.420771, 0, 1.5, 0.5, 0.5
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
-3.103439, -3, -5.591512,
-3.103439, 2, -5.591512,
-3.103439, -3, -5.591512,
-3.26706, -3, -5.867931,
-3.103439, -2, -5.591512,
-3.26706, -2, -5.867931,
-3.103439, -1, -5.591512,
-3.26706, -1, -5.867931,
-3.103439, 0, -5.591512,
-3.26706, 0, -5.867931,
-3.103439, 1, -5.591512,
-3.26706, 1, -5.867931,
-3.103439, 2, -5.591512,
-3.26706, 2, -5.867931
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
-3.594301, -3, -6.420771, 0, -0.5, 0.5, 0.5,
-3.594301, -3, -6.420771, 1, -0.5, 0.5, 0.5,
-3.594301, -3, -6.420771, 1, 1.5, 0.5, 0.5,
-3.594301, -3, -6.420771, 0, 1.5, 0.5, 0.5,
-3.594301, -2, -6.420771, 0, -0.5, 0.5, 0.5,
-3.594301, -2, -6.420771, 1, -0.5, 0.5, 0.5,
-3.594301, -2, -6.420771, 1, 1.5, 0.5, 0.5,
-3.594301, -2, -6.420771, 0, 1.5, 0.5, 0.5,
-3.594301, -1, -6.420771, 0, -0.5, 0.5, 0.5,
-3.594301, -1, -6.420771, 1, -0.5, 0.5, 0.5,
-3.594301, -1, -6.420771, 1, 1.5, 0.5, 0.5,
-3.594301, -1, -6.420771, 0, 1.5, 0.5, 0.5,
-3.594301, 0, -6.420771, 0, -0.5, 0.5, 0.5,
-3.594301, 0, -6.420771, 1, -0.5, 0.5, 0.5,
-3.594301, 0, -6.420771, 1, 1.5, 0.5, 0.5,
-3.594301, 0, -6.420771, 0, 1.5, 0.5, 0.5,
-3.594301, 1, -6.420771, 0, -0.5, 0.5, 0.5,
-3.594301, 1, -6.420771, 1, -0.5, 0.5, 0.5,
-3.594301, 1, -6.420771, 1, 1.5, 0.5, 0.5,
-3.594301, 1, -6.420771, 0, 1.5, 0.5, 0.5,
-3.594301, 2, -6.420771, 0, -0.5, 0.5, 0.5,
-3.594301, 2, -6.420771, 1, -0.5, 0.5, 0.5,
-3.594301, 2, -6.420771, 1, 1.5, 0.5, 0.5,
-3.594301, 2, -6.420771, 0, 1.5, 0.5, 0.5
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
-3.103439, -3.751418, -4,
-3.103439, -3.751418, 4,
-3.103439, -3.751418, -4,
-3.26706, -3.919637, -4,
-3.103439, -3.751418, -2,
-3.26706, -3.919637, -2,
-3.103439, -3.751418, 0,
-3.26706, -3.919637, 0,
-3.103439, -3.751418, 2,
-3.26706, -3.919637, 2,
-3.103439, -3.751418, 4,
-3.26706, -3.919637, 4
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
-3.594301, -4.256074, -4, 0, -0.5, 0.5, 0.5,
-3.594301, -4.256074, -4, 1, -0.5, 0.5, 0.5,
-3.594301, -4.256074, -4, 1, 1.5, 0.5, 0.5,
-3.594301, -4.256074, -4, 0, 1.5, 0.5, 0.5,
-3.594301, -4.256074, -2, 0, -0.5, 0.5, 0.5,
-3.594301, -4.256074, -2, 1, -0.5, 0.5, 0.5,
-3.594301, -4.256074, -2, 1, 1.5, 0.5, 0.5,
-3.594301, -4.256074, -2, 0, 1.5, 0.5, 0.5,
-3.594301, -4.256074, 0, 0, -0.5, 0.5, 0.5,
-3.594301, -4.256074, 0, 1, -0.5, 0.5, 0.5,
-3.594301, -4.256074, 0, 1, 1.5, 0.5, 0.5,
-3.594301, -4.256074, 0, 0, 1.5, 0.5, 0.5,
-3.594301, -4.256074, 2, 0, -0.5, 0.5, 0.5,
-3.594301, -4.256074, 2, 1, -0.5, 0.5, 0.5,
-3.594301, -4.256074, 2, 1, 1.5, 0.5, 0.5,
-3.594301, -4.256074, 2, 0, 1.5, 0.5, 0.5,
-3.594301, -4.256074, 4, 0, -0.5, 0.5, 0.5,
-3.594301, -4.256074, 4, 1, -0.5, 0.5, 0.5,
-3.594301, -4.256074, 4, 1, 1.5, 0.5, 0.5,
-3.594301, -4.256074, 4, 0, 1.5, 0.5, 0.5
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
-3.103439, -3.751418, -5.591512,
-3.103439, 2.977327, -5.591512,
-3.103439, -3.751418, 5.465267,
-3.103439, 2.977327, 5.465267,
-3.103439, -3.751418, -5.591512,
-3.103439, -3.751418, 5.465267,
-3.103439, 2.977327, -5.591512,
-3.103439, 2.977327, 5.465267,
-3.103439, -3.751418, -5.591512,
3.441375, -3.751418, -5.591512,
-3.103439, -3.751418, 5.465267,
3.441375, -3.751418, 5.465267,
-3.103439, 2.977327, -5.591512,
3.441375, 2.977327, -5.591512,
-3.103439, 2.977327, 5.465267,
3.441375, 2.977327, 5.465267,
3.441375, -3.751418, -5.591512,
3.441375, 2.977327, -5.591512,
3.441375, -3.751418, 5.465267,
3.441375, 2.977327, 5.465267,
3.441375, -3.751418, -5.591512,
3.441375, -3.751418, 5.465267,
3.441375, 2.977327, -5.591512,
3.441375, 2.977327, 5.465267
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
var radius = 7.744798;
var distance = 34.45749;
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
mvMatrix.translate( -0.168968, 0.3870454, 0.06312251 );
mvMatrix.scale( 1.27946, 1.244486, 0.7573478 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.45749);
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
Dicarbon_monoxide<-read.table("Dicarbon_monoxide.xyz", skip=1)
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
-3.008126, 2.043694, -1.487023, 0, 0, 1, 1, 1,
-2.989486, 0.5667248, -2.1358, 1, 0, 0, 1, 1,
-2.907, 0.7353864, -1.919165, 1, 0, 0, 1, 1,
-2.863455, -1.453591, -0.5777607, 1, 0, 0, 1, 1,
-2.787825, -2.268801, -2.270234, 1, 0, 0, 1, 1,
-2.663531, -0.6442914, -2.453939, 1, 0, 0, 1, 1,
-2.651228, -0.4260057, -2.17492, 0, 0, 0, 1, 1,
-2.631399, 0.9697257, -1.093212, 0, 0, 0, 1, 1,
-2.421944, -0.08575884, -2.791658, 0, 0, 0, 1, 1,
-2.371269, -0.07512808, -2.302715, 0, 0, 0, 1, 1,
-2.359344, -1.403822, -1.209524, 0, 0, 0, 1, 1,
-2.352715, 0.4859413, 0.4883517, 0, 0, 0, 1, 1,
-2.282636, 1.188962, -0.373152, 0, 0, 0, 1, 1,
-2.265855, 0.9726275, -2.427476, 1, 1, 1, 1, 1,
-2.25232, -0.6046291, -0.9458132, 1, 1, 1, 1, 1,
-2.248641, 0.5790826, -0.3030659, 1, 1, 1, 1, 1,
-2.218618, -1.609635, -0.9577076, 1, 1, 1, 1, 1,
-2.129282, -1.718876, -2.607525, 1, 1, 1, 1, 1,
-2.094728, -0.03007087, 0.01229903, 1, 1, 1, 1, 1,
-2.08918, 0.3999829, -0.4682668, 1, 1, 1, 1, 1,
-2.067235, -1.4547, -3.34003, 1, 1, 1, 1, 1,
-2.029842, 0.2855487, -1.466281, 1, 1, 1, 1, 1,
-2.016632, -1.305493, -0.6952005, 1, 1, 1, 1, 1,
-2.009237, -0.3103884, -2.358858, 1, 1, 1, 1, 1,
-2.001674, -0.09413995, -4.745665, 1, 1, 1, 1, 1,
-1.981771, -0.9190778, -2.473958, 1, 1, 1, 1, 1,
-1.883387, -0.978151, -1.343818, 1, 1, 1, 1, 1,
-1.87103, -1.148776, -2.324464, 1, 1, 1, 1, 1,
-1.864039, 1.215747, -0.3696583, 0, 0, 1, 1, 1,
-1.838504, -0.358825, -1.186182, 1, 0, 0, 1, 1,
-1.80241, -0.8347079, -3.002564, 1, 0, 0, 1, 1,
-1.785441, 0.488982, -0.5060524, 1, 0, 0, 1, 1,
-1.776342, 0.2732883, -0.5822252, 1, 0, 0, 1, 1,
-1.769926, 0.2602398, -2.475868, 1, 0, 0, 1, 1,
-1.769413, 0.8661534, -1.589636, 0, 0, 0, 1, 1,
-1.766763, -1.119866, -1.17109, 0, 0, 0, 1, 1,
-1.761692, -0.3913954, -1.843006, 0, 0, 0, 1, 1,
-1.75707, -0.1946207, -1.954429, 0, 0, 0, 1, 1,
-1.7485, -0.3632074, -0.6828852, 0, 0, 0, 1, 1,
-1.739827, 1.870273, -1.446205, 0, 0, 0, 1, 1,
-1.730252, -0.3407542, -2.62466, 0, 0, 0, 1, 1,
-1.717342, 1.440271, -0.7172393, 1, 1, 1, 1, 1,
-1.712528, -1.417095, -2.89577, 1, 1, 1, 1, 1,
-1.71226, 0.7973848, 0.2367602, 1, 1, 1, 1, 1,
-1.700432, -0.1695216, -1.20666, 1, 1, 1, 1, 1,
-1.699006, -0.2971102, -1.570933, 1, 1, 1, 1, 1,
-1.668325, -0.3919443, -2.274058, 1, 1, 1, 1, 1,
-1.665776, -0.8226421, -2.844514, 1, 1, 1, 1, 1,
-1.646684, 0.2852812, -1.646145, 1, 1, 1, 1, 1,
-1.643893, 0.8058217, -2.066195, 1, 1, 1, 1, 1,
-1.642697, -2.913046, -3.030009, 1, 1, 1, 1, 1,
-1.618948, -1.798441, -3.856557, 1, 1, 1, 1, 1,
-1.614586, 1.08506, -1.0829, 1, 1, 1, 1, 1,
-1.609646, 1.181826, -1.641947, 1, 1, 1, 1, 1,
-1.60848, -2.021641, -2.031502, 1, 1, 1, 1, 1,
-1.608298, -0.9085422, -2.612872, 1, 1, 1, 1, 1,
-1.606037, -1.261976, -1.966917, 0, 0, 1, 1, 1,
-1.605258, 0.8831159, -1.82756, 1, 0, 0, 1, 1,
-1.599963, 0.2091289, -0.9855454, 1, 0, 0, 1, 1,
-1.567138, 1.55057, -0.8674159, 1, 0, 0, 1, 1,
-1.562124, -0.2951917, -1.709359, 1, 0, 0, 1, 1,
-1.548569, 0.5524858, 0.7998893, 1, 0, 0, 1, 1,
-1.548202, 0.8091029, -2.218457, 0, 0, 0, 1, 1,
-1.535247, -1.049225, -1.490507, 0, 0, 0, 1, 1,
-1.52287, -0.06903578, -1.454664, 0, 0, 0, 1, 1,
-1.520853, 0.3699397, -2.594888, 0, 0, 0, 1, 1,
-1.504772, -0.5584866, -1.927755, 0, 0, 0, 1, 1,
-1.504674, 0.7786554, -1.801636, 0, 0, 0, 1, 1,
-1.486953, -1.618049, -1.616091, 0, 0, 0, 1, 1,
-1.482686, 0.2481279, -2.238652, 1, 1, 1, 1, 1,
-1.481053, -1.656056, 0.3111146, 1, 1, 1, 1, 1,
-1.464719, 0.3119558, -1.875074, 1, 1, 1, 1, 1,
-1.460969, -0.4721354, -2.826826, 1, 1, 1, 1, 1,
-1.459037, 0.5759484, -1.511247, 1, 1, 1, 1, 1,
-1.455055, -1.641871, -2.45145, 1, 1, 1, 1, 1,
-1.443894, -0.8201597, -2.527932, 1, 1, 1, 1, 1,
-1.429063, 2.649105, -1.98304, 1, 1, 1, 1, 1,
-1.424512, -0.3440276, -1.720725, 1, 1, 1, 1, 1,
-1.419472, -0.7750463, -0.1831733, 1, 1, 1, 1, 1,
-1.418463, 0.006896766, -1.217842, 1, 1, 1, 1, 1,
-1.418195, -2.514147, -3.208627, 1, 1, 1, 1, 1,
-1.415484, -1.376033, -3.84903, 1, 1, 1, 1, 1,
-1.415362, 0.1394451, -2.744564, 1, 1, 1, 1, 1,
-1.400853, -0.2715139, -1.354263, 1, 1, 1, 1, 1,
-1.400367, -0.4994288, -0.652858, 0, 0, 1, 1, 1,
-1.396586, 0.6634896, -0.7806584, 1, 0, 0, 1, 1,
-1.392639, 0.4641721, -0.3698707, 1, 0, 0, 1, 1,
-1.389581, -1.843036, -2.423721, 1, 0, 0, 1, 1,
-1.387303, -0.627408, -3.040815, 1, 0, 0, 1, 1,
-1.385302, 0.5562227, -1.012933, 1, 0, 0, 1, 1,
-1.377404, -0.474919, -0.870277, 0, 0, 0, 1, 1,
-1.3764, 1.778901, -2.575774, 0, 0, 0, 1, 1,
-1.372247, 0.1121546, -2.12379, 0, 0, 0, 1, 1,
-1.363992, 0.1785843, -1.504026, 0, 0, 0, 1, 1,
-1.336798, 0.7852707, -1.384483, 0, 0, 0, 1, 1,
-1.333974, 0.9416861, -0.9697877, 0, 0, 0, 1, 1,
-1.332806, -0.6067328, -2.549405, 0, 0, 0, 1, 1,
-1.330092, -0.2584389, -0.4407339, 1, 1, 1, 1, 1,
-1.31495, 0.1502793, -0.7185379, 1, 1, 1, 1, 1,
-1.31037, 1.211612, -0.3959302, 1, 1, 1, 1, 1,
-1.308587, 1.684618, -1.018036, 1, 1, 1, 1, 1,
-1.303925, 0.6366445, -0.7592195, 1, 1, 1, 1, 1,
-1.290449, -0.8921826, -1.467216, 1, 1, 1, 1, 1,
-1.288061, -0.3891238, -3.648757, 1, 1, 1, 1, 1,
-1.286021, -0.08607326, -2.993445, 1, 1, 1, 1, 1,
-1.283467, -0.2323776, -1.644002, 1, 1, 1, 1, 1,
-1.280322, 0.07972748, -0.4691391, 1, 1, 1, 1, 1,
-1.271479, 1.05982, -2.197753, 1, 1, 1, 1, 1,
-1.26838, 1.656613, 0.3874979, 1, 1, 1, 1, 1,
-1.26807, 0.01617523, -0.4270468, 1, 1, 1, 1, 1,
-1.265682, 0.4308259, -1.561287, 1, 1, 1, 1, 1,
-1.253911, 0.3952487, -2.524151, 1, 1, 1, 1, 1,
-1.251671, 1.296486, 0.2008134, 0, 0, 1, 1, 1,
-1.24221, -1.199254, -2.603729, 1, 0, 0, 1, 1,
-1.24055, -0.2765281, -1.768203, 1, 0, 0, 1, 1,
-1.235014, -0.4388078, -1.112592, 1, 0, 0, 1, 1,
-1.228741, 1.38964, -2.059989, 1, 0, 0, 1, 1,
-1.228653, -0.4372441, -1.178155, 1, 0, 0, 1, 1,
-1.228022, -0.0893136, -1.115973, 0, 0, 0, 1, 1,
-1.225708, 1.036863, 1.556605, 0, 0, 0, 1, 1,
-1.225334, 1.907756, -1.0223, 0, 0, 0, 1, 1,
-1.222701, -1.502046, -1.72269, 0, 0, 0, 1, 1,
-1.212619, -0.5633441, -1.257055, 0, 0, 0, 1, 1,
-1.211001, -0.3578282, -1.360921, 0, 0, 0, 1, 1,
-1.20445, -0.137277, -2.896111, 0, 0, 0, 1, 1,
-1.200422, -0.4174536, -2.212921, 1, 1, 1, 1, 1,
-1.19764, 0.8367147, -1.213698, 1, 1, 1, 1, 1,
-1.189468, 0.3599578, -2.881868, 1, 1, 1, 1, 1,
-1.188389, -0.6491422, -0.5710979, 1, 1, 1, 1, 1,
-1.187937, 1.175403, -0.5515589, 1, 1, 1, 1, 1,
-1.186172, -0.9046625, -2.228859, 1, 1, 1, 1, 1,
-1.184007, 1.303106, 0.3753066, 1, 1, 1, 1, 1,
-1.181092, -1.61466, -2.993345, 1, 1, 1, 1, 1,
-1.180815, 0.1987026, -0.4180694, 1, 1, 1, 1, 1,
-1.172321, 1.287844, -2.291137, 1, 1, 1, 1, 1,
-1.168271, 0.9403713, -0.1481444, 1, 1, 1, 1, 1,
-1.16791, 1.30023, 0.7950891, 1, 1, 1, 1, 1,
-1.15982, -0.3426776, -1.390564, 1, 1, 1, 1, 1,
-1.158001, -1.841976, -2.529624, 1, 1, 1, 1, 1,
-1.157372, -0.5548921, -1.659644, 1, 1, 1, 1, 1,
-1.156943, -1.970899, -1.037189, 0, 0, 1, 1, 1,
-1.145766, -0.6373081, -1.58181, 1, 0, 0, 1, 1,
-1.14296, 0.6524354, -0.6553614, 1, 0, 0, 1, 1,
-1.130837, -0.9411897, -3.005265, 1, 0, 0, 1, 1,
-1.123951, 1.496851, 1.432636, 1, 0, 0, 1, 1,
-1.120248, -0.4725943, -2.656279, 1, 0, 0, 1, 1,
-1.115003, 0.0425958, -2.016573, 0, 0, 0, 1, 1,
-1.111374, -0.646439, -2.828228, 0, 0, 0, 1, 1,
-1.099163, 0.6319214, -0.7265007, 0, 0, 0, 1, 1,
-1.096796, 0.4919207, -0.9961417, 0, 0, 0, 1, 1,
-1.092351, 0.6011302, -0.4031459, 0, 0, 0, 1, 1,
-1.086717, -0.4221005, -3.980426, 0, 0, 0, 1, 1,
-1.082204, -0.4926628, -1.572206, 0, 0, 0, 1, 1,
-1.056557, -0.2552499, -1.744029, 1, 1, 1, 1, 1,
-1.053669, 0.4552516, -0.5993631, 1, 1, 1, 1, 1,
-1.052178, -0.1061927, -0.8039302, 1, 1, 1, 1, 1,
-1.0412, -0.03505677, -2.453729, 1, 1, 1, 1, 1,
-1.036982, 2.307287, -1.629081, 1, 1, 1, 1, 1,
-1.03537, -0.3309122, -1.653141, 1, 1, 1, 1, 1,
-1.025931, 1.079743, -0.584092, 1, 1, 1, 1, 1,
-1.021491, 0.1117085, -0.2970955, 1, 1, 1, 1, 1,
-1.021472, -0.4174459, -3.462869, 1, 1, 1, 1, 1,
-1.012071, 0.4613792, -0.07278602, 1, 1, 1, 1, 1,
-1.009537, 1.468962, -2.421092, 1, 1, 1, 1, 1,
-1.000136, 0.1349567, -2.305091, 1, 1, 1, 1, 1,
-0.9921182, -1.030863, -1.520288, 1, 1, 1, 1, 1,
-0.9917686, -0.1850742, -2.835098, 1, 1, 1, 1, 1,
-0.9873173, 0.4849277, -2.828876, 1, 1, 1, 1, 1,
-0.9855083, 0.6997566, -0.7066618, 0, 0, 1, 1, 1,
-0.9781223, -0.04741266, 0.795038, 1, 0, 0, 1, 1,
-0.9775638, 0.2802651, 0.1664185, 1, 0, 0, 1, 1,
-0.9708559, 0.5519197, -1.060798, 1, 0, 0, 1, 1,
-0.9660354, 0.4621871, -1.123442, 1, 0, 0, 1, 1,
-0.9635382, -1.078664, -3.978179, 1, 0, 0, 1, 1,
-0.962107, 0.3455528, 1.004689, 0, 0, 0, 1, 1,
-0.9418796, 0.9590043, -0.2967761, 0, 0, 0, 1, 1,
-0.9418139, -0.8075594, -3.219327, 0, 0, 0, 1, 1,
-0.9291908, -0.5787556, -3.094894, 0, 0, 0, 1, 1,
-0.9087417, 0.6902658, -0.4260175, 0, 0, 0, 1, 1,
-0.9078667, 0.2340298, -1.906364, 0, 0, 0, 1, 1,
-0.9068463, 0.8088554, 0.1793448, 0, 0, 0, 1, 1,
-0.8976018, -1.16474, -2.377786, 1, 1, 1, 1, 1,
-0.8906202, 0.637687, -1.389421, 1, 1, 1, 1, 1,
-0.8900885, 0.930669, -1.332916, 1, 1, 1, 1, 1,
-0.8856592, -0.199226, -1.654362, 1, 1, 1, 1, 1,
-0.8830661, -0.5879092, -1.869709, 1, 1, 1, 1, 1,
-0.8789184, 0.9338558, 0.04448111, 1, 1, 1, 1, 1,
-0.8692534, -0.2348825, -1.987685, 1, 1, 1, 1, 1,
-0.8675195, 0.2519442, -0.4714317, 1, 1, 1, 1, 1,
-0.8662953, -0.1861529, -2.538295, 1, 1, 1, 1, 1,
-0.8657755, 0.7852676, -0.9819277, 1, 1, 1, 1, 1,
-0.8627164, -0.7875971, -1.648885, 1, 1, 1, 1, 1,
-0.8607808, -0.1743236, -2.624542, 1, 1, 1, 1, 1,
-0.8560381, -0.5507566, -1.093836, 1, 1, 1, 1, 1,
-0.8556446, -0.4694611, -2.64277, 1, 1, 1, 1, 1,
-0.855575, 1.568011, 0.4602381, 1, 1, 1, 1, 1,
-0.8550772, 0.4886128, -1.273834, 0, 0, 1, 1, 1,
-0.84606, 0.2875735, -1.617304, 1, 0, 0, 1, 1,
-0.8358262, -0.3946853, -4.386011, 1, 0, 0, 1, 1,
-0.8349876, -1.502123, -2.215167, 1, 0, 0, 1, 1,
-0.8342705, -1.078268, -4.074329, 1, 0, 0, 1, 1,
-0.8336309, -0.1503929, -3.99382, 1, 0, 0, 1, 1,
-0.8299952, 1.379361, 0.3157015, 0, 0, 0, 1, 1,
-0.8274797, -0.4001655, -1.919801, 0, 0, 0, 1, 1,
-0.8253179, 1.794893, -0.8271323, 0, 0, 0, 1, 1,
-0.8203238, -0.2754322, -1.653537, 0, 0, 0, 1, 1,
-0.8183406, -0.06107027, -0.2126311, 0, 0, 0, 1, 1,
-0.8153309, -0.3285104, -1.882747, 0, 0, 0, 1, 1,
-0.8145584, -0.9000053, -2.912779, 0, 0, 0, 1, 1,
-0.8122056, -1.324441, -0.7785363, 1, 1, 1, 1, 1,
-0.812075, -1.377309, -1.822311, 1, 1, 1, 1, 1,
-0.8082162, 0.9085819, -1.365529, 1, 1, 1, 1, 1,
-0.7969015, 0.3611323, -1.646287, 1, 1, 1, 1, 1,
-0.7937853, 0.9007184, 0.6005211, 1, 1, 1, 1, 1,
-0.788497, 1.07833, 0.5389327, 1, 1, 1, 1, 1,
-0.785454, -1.714448, -0.6546463, 1, 1, 1, 1, 1,
-0.7836873, 1.021448, 0.234118, 1, 1, 1, 1, 1,
-0.7791933, 0.2393316, -0.0796997, 1, 1, 1, 1, 1,
-0.7743616, 0.09526534, -1.961974, 1, 1, 1, 1, 1,
-0.7677671, -0.5053853, -3.366972, 1, 1, 1, 1, 1,
-0.7580399, -1.662419, -3.523927, 1, 1, 1, 1, 1,
-0.7548719, 0.2882818, -1.319244, 1, 1, 1, 1, 1,
-0.7543926, -0.5291083, -0.9628491, 1, 1, 1, 1, 1,
-0.7523512, -0.2860706, -3.569631, 1, 1, 1, 1, 1,
-0.7517847, 1.040744, -1.199236, 0, 0, 1, 1, 1,
-0.7467977, 2.281287, -0.01339692, 1, 0, 0, 1, 1,
-0.7458649, 0.4442053, -0.06644673, 1, 0, 0, 1, 1,
-0.7431073, 1.954699, 0.6979901, 1, 0, 0, 1, 1,
-0.7428813, 1.680981, -1.448469, 1, 0, 0, 1, 1,
-0.7424421, -1.886753, -2.321852, 1, 0, 0, 1, 1,
-0.7378707, 0.3591223, -2.877471, 0, 0, 0, 1, 1,
-0.735187, -0.9135739, -2.984306, 0, 0, 0, 1, 1,
-0.732195, -0.1841387, -1.711387, 0, 0, 0, 1, 1,
-0.7276443, -1.662817, -2.583066, 0, 0, 0, 1, 1,
-0.7275869, -0.1335127, -1.113498, 0, 0, 0, 1, 1,
-0.7272846, -0.6224512, -2.014302, 0, 0, 0, 1, 1,
-0.7254729, -0.04254438, -0.9485736, 0, 0, 0, 1, 1,
-0.7169875, -0.05462139, -1.857527, 1, 1, 1, 1, 1,
-0.7154673, 0.4832719, -0.6786983, 1, 1, 1, 1, 1,
-0.7151803, 1.620662, -0.7428265, 1, 1, 1, 1, 1,
-0.7118873, -0.9251693, -2.528571, 1, 1, 1, 1, 1,
-0.7112052, 0.76174, 0.2221735, 1, 1, 1, 1, 1,
-0.7107118, -0.2208776, -2.229718, 1, 1, 1, 1, 1,
-0.7046142, -1.216149, -1.65653, 1, 1, 1, 1, 1,
-0.6970889, 0.2512484, -2.201461, 1, 1, 1, 1, 1,
-0.6958594, 0.2662088, -0.779617, 1, 1, 1, 1, 1,
-0.6948123, -1.481126, -3.148521, 1, 1, 1, 1, 1,
-0.6933059, -0.2829296, -1.655237, 1, 1, 1, 1, 1,
-0.6927665, 2.111326, -2.683566, 1, 1, 1, 1, 1,
-0.6910653, 0.6437795, -0.7528222, 1, 1, 1, 1, 1,
-0.6889976, -0.9578033, -4.106048, 1, 1, 1, 1, 1,
-0.6865985, 1.392063, 0.3340522, 1, 1, 1, 1, 1,
-0.6807241, 0.2291369, -1.13363, 0, 0, 1, 1, 1,
-0.6803179, 0.5009202, -0.337654, 1, 0, 0, 1, 1,
-0.6748347, 1.878911, 0.4108378, 1, 0, 0, 1, 1,
-0.6723798, -0.2881858, -1.396505, 1, 0, 0, 1, 1,
-0.6723669, 0.4542201, -1.682808, 1, 0, 0, 1, 1,
-0.6713839, -0.4814666, -1.661548, 1, 0, 0, 1, 1,
-0.669968, 0.8812507, -0.06878699, 0, 0, 0, 1, 1,
-0.6666928, 1.0506, -1.649995, 0, 0, 0, 1, 1,
-0.6623107, 0.6415445, -0.9922646, 0, 0, 0, 1, 1,
-0.6599317, 0.4676624, -2.104484, 0, 0, 0, 1, 1,
-0.659931, 0.5346085, -0.01092033, 0, 0, 0, 1, 1,
-0.6590954, 1.343813, 0.2792147, 0, 0, 0, 1, 1,
-0.6584967, -1.162713, -3.723133, 0, 0, 0, 1, 1,
-0.6523553, -1.132944, -2.63872, 1, 1, 1, 1, 1,
-0.6452315, 1.488098, -0.181294, 1, 1, 1, 1, 1,
-0.6351019, 0.4321798, -1.283189, 1, 1, 1, 1, 1,
-0.6317174, 0.5892441, -2.078171, 1, 1, 1, 1, 1,
-0.6294399, -0.5305237, -1.447876, 1, 1, 1, 1, 1,
-0.6079744, 0.667785, -0.545434, 1, 1, 1, 1, 1,
-0.6078079, 0.4945596, -0.5256409, 1, 1, 1, 1, 1,
-0.6071345, 1.29249, -1.302406, 1, 1, 1, 1, 1,
-0.6050313, 0.4409418, -0.5069933, 1, 1, 1, 1, 1,
-0.6008011, -0.6389374, -1.57688, 1, 1, 1, 1, 1,
-0.5989801, 0.2959738, -0.2393754, 1, 1, 1, 1, 1,
-0.5955121, 0.1775602, -1.750034, 1, 1, 1, 1, 1,
-0.5951974, -0.5219669, -3.80527, 1, 1, 1, 1, 1,
-0.5887526, 0.7265545, -0.8031549, 1, 1, 1, 1, 1,
-0.5862568, 0.1296439, -1.920966, 1, 1, 1, 1, 1,
-0.5843518, 0.5974745, -0.1900476, 0, 0, 1, 1, 1,
-0.574071, 0.07121954, -0.9502538, 1, 0, 0, 1, 1,
-0.5722317, 1.592472, -0.7195922, 1, 0, 0, 1, 1,
-0.5718324, 1.51684, 2.761433, 1, 0, 0, 1, 1,
-0.5704139, -2.042738, -3.78768, 1, 0, 0, 1, 1,
-0.5651181, -0.4418902, -2.052803, 1, 0, 0, 1, 1,
-0.5626792, -1.909125, -2.933719, 0, 0, 0, 1, 1,
-0.5497436, -0.8294984, -3.232654, 0, 0, 0, 1, 1,
-0.5483074, -1.169196, -2.745667, 0, 0, 0, 1, 1,
-0.5473895, 0.3966196, -1.206411, 0, 0, 0, 1, 1,
-0.5424559, 0.702435, -2.508402, 0, 0, 0, 1, 1,
-0.5401234, -0.02966866, -3.260172, 0, 0, 0, 1, 1,
-0.5394287, -1.376804, -3.265248, 0, 0, 0, 1, 1,
-0.5359361, -0.3283774, -2.882812, 1, 1, 1, 1, 1,
-0.5346212, 0.8320556, -0.2743248, 1, 1, 1, 1, 1,
-0.5341436, -0.2229745, -1.04065, 1, 1, 1, 1, 1,
-0.53071, -0.8159139, -2.231101, 1, 1, 1, 1, 1,
-0.527908, -0.1075302, -1.351827, 1, 1, 1, 1, 1,
-0.5250481, 0.0366385, -0.9226768, 1, 1, 1, 1, 1,
-0.5199941, 1.723971, 0.6617414, 1, 1, 1, 1, 1,
-0.5160934, -1.701054, -3.701828, 1, 1, 1, 1, 1,
-0.5138456, 0.01428815, 0.8082432, 1, 1, 1, 1, 1,
-0.5133865, -0.8405974, -2.641225, 1, 1, 1, 1, 1,
-0.5123018, -1.915573, -2.887837, 1, 1, 1, 1, 1,
-0.5074905, -0.08950174, -1.825672, 1, 1, 1, 1, 1,
-0.5073351, -0.1078119, -0.6425405, 1, 1, 1, 1, 1,
-0.5041109, 0.4049459, -1.130072, 1, 1, 1, 1, 1,
-0.5031889, -1.751305, -3.740144, 1, 1, 1, 1, 1,
-0.499945, -0.03991536, -1.792351, 0, 0, 1, 1, 1,
-0.4987604, 1.002978, -2.060435, 1, 0, 0, 1, 1,
-0.4986582, -0.6025343, -3.429855, 1, 0, 0, 1, 1,
-0.4871476, 1.415905, 0.262121, 1, 0, 0, 1, 1,
-0.4854451, -3.653427, -3.374947, 1, 0, 0, 1, 1,
-0.483152, 0.7050114, -0.3566379, 1, 0, 0, 1, 1,
-0.4778287, 0.384062, -2.218955, 0, 0, 0, 1, 1,
-0.477417, -0.3446986, -1.301708, 0, 0, 0, 1, 1,
-0.4729656, -0.4676203, -3.209527, 0, 0, 0, 1, 1,
-0.4723636, 0.4891318, -0.8069824, 0, 0, 0, 1, 1,
-0.4711797, -0.841379, -1.61297, 0, 0, 0, 1, 1,
-0.4686071, -2.085894, -3.787878, 0, 0, 0, 1, 1,
-0.4678044, 0.3637927, -0.949853, 0, 0, 0, 1, 1,
-0.4610873, -0.5566862, -2.539614, 1, 1, 1, 1, 1,
-0.4609226, 0.274761, -2.520622, 1, 1, 1, 1, 1,
-0.4595205, -2.239155, -5.051794, 1, 1, 1, 1, 1,
-0.4579331, 1.465242, -0.06176713, 1, 1, 1, 1, 1,
-0.4553503, 0.7582115, -0.4659104, 1, 1, 1, 1, 1,
-0.4544199, 1.958023, -0.7483495, 1, 1, 1, 1, 1,
-0.4515523, -0.1903122, -1.187125, 1, 1, 1, 1, 1,
-0.4484299, -0.6696075, -2.726459, 1, 1, 1, 1, 1,
-0.4454765, 0.1473844, 1.32326, 1, 1, 1, 1, 1,
-0.4429416, 0.4154022, -0.1359999, 1, 1, 1, 1, 1,
-0.4426582, 1.620461, -0.04769624, 1, 1, 1, 1, 1,
-0.4389127, -0.9463089, -3.744648, 1, 1, 1, 1, 1,
-0.4351408, 0.2361275, 0.1265374, 1, 1, 1, 1, 1,
-0.4345386, -0.2088239, -2.009485, 1, 1, 1, 1, 1,
-0.4343479, 1.33136, -1.10407, 1, 1, 1, 1, 1,
-0.4284396, 0.2555737, -1.945257, 0, 0, 1, 1, 1,
-0.4273998, -0.9383765, -3.413461, 1, 0, 0, 1, 1,
-0.4239978, 1.610674, 0.6621249, 1, 0, 0, 1, 1,
-0.4228779, 1.884112, -1.087003, 1, 0, 0, 1, 1,
-0.4220696, 0.6961023, -1.305211, 1, 0, 0, 1, 1,
-0.4204901, -0.7212797, -2.528291, 1, 0, 0, 1, 1,
-0.4190774, -0.09236603, -1.939536, 0, 0, 0, 1, 1,
-0.4184164, 0.7906229, 0.6659102, 0, 0, 0, 1, 1,
-0.4169236, 0.0634402, -2.2948, 0, 0, 0, 1, 1,
-0.4138575, 0.5257139, -1.230498, 0, 0, 0, 1, 1,
-0.4110958, 1.820869, 1.081779, 0, 0, 0, 1, 1,
-0.4090415, -0.1867525, -1.968864, 0, 0, 0, 1, 1,
-0.4067335, -0.264298, -2.510845, 0, 0, 0, 1, 1,
-0.4039276, -0.01629093, -0.9156805, 1, 1, 1, 1, 1,
-0.4025279, -0.5954718, -2.185299, 1, 1, 1, 1, 1,
-0.4015156, 0.8775238, -1.428746, 1, 1, 1, 1, 1,
-0.4008661, 1.359627, 0.009722406, 1, 1, 1, 1, 1,
-0.3997528, 0.5209945, 0.7251798, 1, 1, 1, 1, 1,
-0.3992063, 1.047268, -1.169367, 1, 1, 1, 1, 1,
-0.3950679, -0.1042625, -1.368498, 1, 1, 1, 1, 1,
-0.3946147, 0.3249447, -1.084019, 1, 1, 1, 1, 1,
-0.3933824, -0.5525319, -2.139309, 1, 1, 1, 1, 1,
-0.3923181, -0.2299521, -0.6870254, 1, 1, 1, 1, 1,
-0.3895406, -0.9329783, -2.042069, 1, 1, 1, 1, 1,
-0.3872926, 0.3735438, -0.9370011, 1, 1, 1, 1, 1,
-0.3865943, -2.40731, -3.690006, 1, 1, 1, 1, 1,
-0.3833446, 0.6406702, 1.074781, 1, 1, 1, 1, 1,
-0.3832164, -1.723042, -2.080068, 1, 1, 1, 1, 1,
-0.3824539, 0.3527197, 0.5807481, 0, 0, 1, 1, 1,
-0.3808717, -0.9337562, -3.850607, 1, 0, 0, 1, 1,
-0.3740791, -1.628043, -3.353503, 1, 0, 0, 1, 1,
-0.371422, -0.3141469, 0.08051283, 1, 0, 0, 1, 1,
-0.366819, 0.127153, -2.096091, 1, 0, 0, 1, 1,
-0.3667163, 0.1407038, -1.866848, 1, 0, 0, 1, 1,
-0.3620186, 0.8553358, -0.09752408, 0, 0, 0, 1, 1,
-0.3619307, -1.008684, -4.09763, 0, 0, 0, 1, 1,
-0.351699, -0.7734445, -1.868618, 0, 0, 0, 1, 1,
-0.3503788, 0.9911083, 1.128856, 0, 0, 0, 1, 1,
-0.3498187, -0.03213429, -1.981529, 0, 0, 0, 1, 1,
-0.3479751, -0.6635634, -3.406581, 0, 0, 0, 1, 1,
-0.339196, 0.3840321, -0.8606243, 0, 0, 0, 1, 1,
-0.338391, 0.0378717, -2.018281, 1, 1, 1, 1, 1,
-0.337565, -0.7511783, -3.01107, 1, 1, 1, 1, 1,
-0.3320363, 0.0204565, -0.8043861, 1, 1, 1, 1, 1,
-0.3300481, -1.515982, -2.425196, 1, 1, 1, 1, 1,
-0.3295648, 0.5412365, 0.2723385, 1, 1, 1, 1, 1,
-0.3284992, -0.5170007, -3.406815, 1, 1, 1, 1, 1,
-0.3257994, -1.361208, -4.091145, 1, 1, 1, 1, 1,
-0.3218889, 1.120822, -0.231048, 1, 1, 1, 1, 1,
-0.3210066, 0.7073846, 0.3310835, 1, 1, 1, 1, 1,
-0.320593, 0.4617485, -1.495864, 1, 1, 1, 1, 1,
-0.3176301, -0.09719722, -2.479798, 1, 1, 1, 1, 1,
-0.3148068, -0.6235312, -2.12848, 1, 1, 1, 1, 1,
-0.3141409, -0.422595, -1.315394, 1, 1, 1, 1, 1,
-0.3111307, 1.616171, -1.189298, 1, 1, 1, 1, 1,
-0.3106421, 0.8346986, 0.02952381, 1, 1, 1, 1, 1,
-0.3087733, 0.1890216, 0.1100281, 0, 0, 1, 1, 1,
-0.3064615, 0.02155267, -2.960699, 1, 0, 0, 1, 1,
-0.3046651, 0.5541491, -0.2066125, 1, 0, 0, 1, 1,
-0.3005765, 1.245194, 0.1335557, 1, 0, 0, 1, 1,
-0.2983447, 0.9608251, 0.3711603, 1, 0, 0, 1, 1,
-0.2954597, 0.3875084, 1.139344, 1, 0, 0, 1, 1,
-0.2939144, -0.5863757, -2.417784, 0, 0, 0, 1, 1,
-0.2898766, 1.103997, -0.4382641, 0, 0, 0, 1, 1,
-0.2882144, 0.699095, 0.06206312, 0, 0, 0, 1, 1,
-0.2877553, -0.5453584, -3.647108, 0, 0, 0, 1, 1,
-0.2805573, -0.1671121, -2.242235, 0, 0, 0, 1, 1,
-0.2803119, 0.9031406, -1.728256, 0, 0, 0, 1, 1,
-0.280154, -0.8558238, -2.924837, 0, 0, 0, 1, 1,
-0.2696808, -2.494987, -3.130327, 1, 1, 1, 1, 1,
-0.2696212, 0.7934934, -0.6903288, 1, 1, 1, 1, 1,
-0.2684333, 0.9811116, 0.9725002, 1, 1, 1, 1, 1,
-0.2619167, -1.031675, -3.812996, 1, 1, 1, 1, 1,
-0.2602311, 0.2728965, -0.6979416, 1, 1, 1, 1, 1,
-0.2599708, 0.5510955, -0.5503579, 1, 1, 1, 1, 1,
-0.2538704, -0.09423924, -1.19621, 1, 1, 1, 1, 1,
-0.2525918, -0.1013021, -1.961627, 1, 1, 1, 1, 1,
-0.2512877, -1.121543, -1.802372, 1, 1, 1, 1, 1,
-0.2506846, 0.7449399, 0.1297853, 1, 1, 1, 1, 1,
-0.2504351, 1.971566, -1.164506, 1, 1, 1, 1, 1,
-0.2495351, -0.6809677, -1.426645, 1, 1, 1, 1, 1,
-0.2495104, 2.879336, -0.6561183, 1, 1, 1, 1, 1,
-0.2493861, -1.463632, -1.029682, 1, 1, 1, 1, 1,
-0.2438876, -2.667915, -3.871368, 1, 1, 1, 1, 1,
-0.2401049, 1.361424, -0.7357374, 0, 0, 1, 1, 1,
-0.236321, 0.417921, -1.247305, 1, 0, 0, 1, 1,
-0.2314545, 1.424355, -1.610336, 1, 0, 0, 1, 1,
-0.2309907, 0.9100298, -1.507101, 1, 0, 0, 1, 1,
-0.2287318, -0.9509094, -3.109463, 1, 0, 0, 1, 1,
-0.2240844, -0.3763488, -2.631048, 1, 0, 0, 1, 1,
-0.2204419, -0.4470544, -1.810995, 0, 0, 0, 1, 1,
-0.2115175, 1.148404, -1.959857, 0, 0, 0, 1, 1,
-0.2054535, -3.014138, -2.995933, 0, 0, 0, 1, 1,
-0.205194, 0.06515886, -0.5831177, 0, 0, 0, 1, 1,
-0.2026943, 2.279605, 0.9541695, 0, 0, 0, 1, 1,
-0.1975032, 1.024946, -0.9667394, 0, 0, 0, 1, 1,
-0.1919799, -0.8757998, -4.398305, 0, 0, 0, 1, 1,
-0.1908846, -1.191489, -2.961487, 1, 1, 1, 1, 1,
-0.1900241, 0.6227287, -0.6525919, 1, 1, 1, 1, 1,
-0.1899346, 0.4723164, -0.4083369, 1, 1, 1, 1, 1,
-0.1866962, 0.4104021, -0.1012731, 1, 1, 1, 1, 1,
-0.1865976, 0.9376032, 0.00316248, 1, 1, 1, 1, 1,
-0.1863136, 0.9128997, 0.02205327, 1, 1, 1, 1, 1,
-0.1862271, -0.1941197, -1.713511, 1, 1, 1, 1, 1,
-0.1817362, -0.59969, -2.150596, 1, 1, 1, 1, 1,
-0.1799511, -0.9311666, -1.054649, 1, 1, 1, 1, 1,
-0.1786396, 0.1059183, -0.6033897, 1, 1, 1, 1, 1,
-0.1774256, -1.436992, -5.212474, 1, 1, 1, 1, 1,
-0.1747981, 0.40571, -1.716712, 1, 1, 1, 1, 1,
-0.1747142, -1.006245, -1.464667, 1, 1, 1, 1, 1,
-0.1739287, -1.843914, -3.906362, 1, 1, 1, 1, 1,
-0.1727935, 0.1410801, 0.9719121, 1, 1, 1, 1, 1,
-0.1722781, -0.9490868, -4.029282, 0, 0, 1, 1, 1,
-0.1697397, 0.04245103, -1.405464, 1, 0, 0, 1, 1,
-0.1659413, 0.2873301, -1.508573, 1, 0, 0, 1, 1,
-0.1605847, 2.074852, -0.6604592, 1, 0, 0, 1, 1,
-0.1587634, 0.07660829, -2.389127, 1, 0, 0, 1, 1,
-0.1572475, -0.6872386, -3.357375, 1, 0, 0, 1, 1,
-0.1542778, 1.195441, 0.5434207, 0, 0, 0, 1, 1,
-0.1531483, -1.554203, -1.52133, 0, 0, 0, 1, 1,
-0.1516556, 0.6389276, 0.1379148, 0, 0, 0, 1, 1,
-0.1498226, 0.1701745, 0.06708332, 0, 0, 0, 1, 1,
-0.1495937, -0.2202265, -2.617457, 0, 0, 0, 1, 1,
-0.1489526, 0.1533158, -1.576488, 0, 0, 0, 1, 1,
-0.1443946, 0.9902719, 0.4897006, 0, 0, 0, 1, 1,
-0.1412603, -0.7901909, -3.110378, 1, 1, 1, 1, 1,
-0.1373575, -0.0388848, -1.724538, 1, 1, 1, 1, 1,
-0.1352143, 0.4697783, -0.9031396, 1, 1, 1, 1, 1,
-0.1311965, 1.186564, -0.9241523, 1, 1, 1, 1, 1,
-0.1302217, 0.8874801, -1.328664, 1, 1, 1, 1, 1,
-0.1301146, -0.4586008, -3.722737, 1, 1, 1, 1, 1,
-0.124415, -0.6427559, -3.713343, 1, 1, 1, 1, 1,
-0.1209188, -1.014455, -2.633848, 1, 1, 1, 1, 1,
-0.1156087, -0.5149937, -4.486594, 1, 1, 1, 1, 1,
-0.1130015, -0.8744821, -1.551161, 1, 1, 1, 1, 1,
-0.1116528, 0.08227602, -0.4417251, 1, 1, 1, 1, 1,
-0.1099665, 0.7424452, -1.565904, 1, 1, 1, 1, 1,
-0.1096916, -0.9155321, -1.244928, 1, 1, 1, 1, 1,
-0.108517, -0.5307884, -1.642204, 1, 1, 1, 1, 1,
-0.1024172, 0.2414151, 0.5195172, 1, 1, 1, 1, 1,
-0.1023711, -2.333514, -3.502486, 0, 0, 1, 1, 1,
-0.1009151, 2.678013, -0.823242, 1, 0, 0, 1, 1,
-0.09311685, 0.03096995, -0.4301693, 1, 0, 0, 1, 1,
-0.09205709, 0.709838, -1.896631, 1, 0, 0, 1, 1,
-0.09032538, -0.1463008, -0.8662412, 1, 0, 0, 1, 1,
-0.08943406, 1.028536, 0.2394551, 1, 0, 0, 1, 1,
-0.08920493, 1.852062, 0.1035332, 0, 0, 0, 1, 1,
-0.08733529, -1.47044, -3.042391, 0, 0, 0, 1, 1,
-0.08623673, -1.059722, -3.215138, 0, 0, 0, 1, 1,
-0.08559463, -1.862176, -5.430491, 0, 0, 0, 1, 1,
-0.08417182, 0.3358169, 0.3818426, 0, 0, 0, 1, 1,
-0.08330397, -0.7589818, -1.892406, 0, 0, 0, 1, 1,
-0.08215132, -1.949974, -3.826943, 0, 0, 0, 1, 1,
-0.07681435, 0.5554739, -0.4713028, 1, 1, 1, 1, 1,
-0.07122187, -0.4074185, -1.618055, 1, 1, 1, 1, 1,
-0.07024612, 0.5609483, -0.2726, 1, 1, 1, 1, 1,
-0.06663261, -0.0699169, -3.1061, 1, 1, 1, 1, 1,
-0.06635704, -1.493089, -4.004148, 1, 1, 1, 1, 1,
-0.06562653, -1.433027, -3.715278, 1, 1, 1, 1, 1,
-0.05400739, 0.5860212, 0.06545141, 1, 1, 1, 1, 1,
-0.04823952, 0.456202, -2.313597, 1, 1, 1, 1, 1,
-0.0458622, -1.49266, -2.402354, 1, 1, 1, 1, 1,
-0.04543865, -2.077569, -2.580365, 1, 1, 1, 1, 1,
-0.04396475, 0.6063703, -0.1478155, 1, 1, 1, 1, 1,
-0.0424612, -1.302333, -3.164499, 1, 1, 1, 1, 1,
-0.04117148, 1.456335, 0.4564482, 1, 1, 1, 1, 1,
-0.04053519, -0.8309106, -3.476071, 1, 1, 1, 1, 1,
-0.03947506, 0.426809, -1.541258, 1, 1, 1, 1, 1,
-0.0382119, 1.153124, 0.6304242, 0, 0, 1, 1, 1,
-0.03754691, 1.820017, 0.5011003, 1, 0, 0, 1, 1,
-0.03350818, 1.105793, 0.07508068, 1, 0, 0, 1, 1,
-0.02945459, -0.0252014, -0.6374943, 1, 0, 0, 1, 1,
-0.02581201, -0.6071285, -3.180276, 1, 0, 0, 1, 1,
-0.02369495, -0.5379549, -1.729683, 1, 0, 0, 1, 1,
-0.01883099, 1.043601, -0.5959355, 0, 0, 0, 1, 1,
-0.01176975, -0.2666649, -4.083333, 0, 0, 0, 1, 1,
-0.005022631, 0.841265, -0.05195679, 0, 0, 0, 1, 1,
-0.002039464, -0.752803, -1.752148, 0, 0, 0, 1, 1,
-0.0008514803, -0.5458865, -2.628738, 0, 0, 0, 1, 1,
0.0007389128, -0.7122686, 2.234524, 0, 0, 0, 1, 1,
0.004311773, 0.1720159, 1.301409, 0, 0, 0, 1, 1,
0.009524242, 0.9564683, -0.2740289, 1, 1, 1, 1, 1,
0.009949583, -0.6846705, 3.009722, 1, 1, 1, 1, 1,
0.01014928, -0.06156874, 3.178959, 1, 1, 1, 1, 1,
0.01258157, 0.2595334, 1.435081, 1, 1, 1, 1, 1,
0.01397703, -0.5825426, 2.529851, 1, 1, 1, 1, 1,
0.02196583, 1.182571, -1.500083, 1, 1, 1, 1, 1,
0.02496749, 0.37719, -2.62149, 1, 1, 1, 1, 1,
0.03040772, 0.2910684, 0.2307983, 1, 1, 1, 1, 1,
0.03132799, -0.3083769, 3.49744, 1, 1, 1, 1, 1,
0.03276409, 0.2313936, -0.04150528, 1, 1, 1, 1, 1,
0.03739611, 0.9813661, -0.6763555, 1, 1, 1, 1, 1,
0.0387731, -0.5863801, 2.563845, 1, 1, 1, 1, 1,
0.0390657, -0.1513372, 1.842121, 1, 1, 1, 1, 1,
0.03906971, -0.1819421, 1.820855, 1, 1, 1, 1, 1,
0.03942579, -0.6958348, 2.855221, 1, 1, 1, 1, 1,
0.04082466, 0.6262978, 0.01416537, 0, 0, 1, 1, 1,
0.04118213, 0.1734303, -1.332972, 1, 0, 0, 1, 1,
0.04377915, -0.6760966, 4.916427, 1, 0, 0, 1, 1,
0.04527098, 1.894365, 1.586404, 1, 0, 0, 1, 1,
0.04724754, -1.142476, 4.322258, 1, 0, 0, 1, 1,
0.04791298, -0.4623098, 3.574045, 1, 0, 0, 1, 1,
0.05505859, -1.077513, 4.570638, 0, 0, 0, 1, 1,
0.05928409, -0.494897, 3.078938, 0, 0, 0, 1, 1,
0.05977736, -1.022374, 2.400919, 0, 0, 0, 1, 1,
0.07015055, 0.9615101, -1.649104, 0, 0, 0, 1, 1,
0.07191691, -1.026764, 2.93085, 0, 0, 0, 1, 1,
0.07238816, -0.8136966, 2.092637, 0, 0, 0, 1, 1,
0.07650097, 0.002774388, 2.400409, 0, 0, 0, 1, 1,
0.07862657, -1.25014, 3.497328, 1, 1, 1, 1, 1,
0.07951377, 0.8941942, -0.004641155, 1, 1, 1, 1, 1,
0.0876646, 0.2117806, 1.794872, 1, 1, 1, 1, 1,
0.08971924, 0.5270251, 0.2847807, 1, 1, 1, 1, 1,
0.08978506, -1.068358, 2.433639, 1, 1, 1, 1, 1,
0.09089976, 1.512896, -1.213655, 1, 1, 1, 1, 1,
0.09558673, -0.1297423, 2.813747, 1, 1, 1, 1, 1,
0.09625507, -0.7595987, 1.92528, 1, 1, 1, 1, 1,
0.09721718, 0.178669, 1.879948, 1, 1, 1, 1, 1,
0.098143, -0.2182357, 2.154729, 1, 1, 1, 1, 1,
0.09873202, -0.7360067, 3.418616, 1, 1, 1, 1, 1,
0.09885267, 0.580183, 0.7952207, 1, 1, 1, 1, 1,
0.1056212, -0.8711391, 2.22768, 1, 1, 1, 1, 1,
0.1075762, 0.7795666, -0.6967365, 1, 1, 1, 1, 1,
0.1174915, 0.7946219, 2.031329, 1, 1, 1, 1, 1,
0.1243143, 1.030131, -0.2737169, 0, 0, 1, 1, 1,
0.12493, 1.582349, 0.4523937, 1, 0, 0, 1, 1,
0.125931, 1.848916, -1.382455, 1, 0, 0, 1, 1,
0.1281823, -0.08780476, 2.744753, 1, 0, 0, 1, 1,
0.131942, -0.3662986, 3.900371, 1, 0, 0, 1, 1,
0.1327461, 1.553238, -0.4776134, 1, 0, 0, 1, 1,
0.1367865, 0.4303566, 0.6889081, 0, 0, 0, 1, 1,
0.1375732, 0.5337239, -1.944098, 0, 0, 0, 1, 1,
0.1388247, -0.2747622, 0.6551827, 0, 0, 0, 1, 1,
0.1415672, 1.644935, -2.449015, 0, 0, 0, 1, 1,
0.1441911, 0.8864143, -0.4875268, 0, 0, 0, 1, 1,
0.1487322, 0.764771, -0.6868216, 0, 0, 0, 1, 1,
0.1528653, 0.2268316, -1.307024, 0, 0, 0, 1, 1,
0.1544438, -0.799448, 1.857486, 1, 1, 1, 1, 1,
0.1577875, -1.221429, 1.33063, 1, 1, 1, 1, 1,
0.1578772, -0.1436943, 3.79125, 1, 1, 1, 1, 1,
0.1589865, -1.812544, 1.271415, 1, 1, 1, 1, 1,
0.1591655, 1.285786, 2.972688, 1, 1, 1, 1, 1,
0.1611447, 0.5397363, 0.4893567, 1, 1, 1, 1, 1,
0.1623508, 0.5838572, 0.441589, 1, 1, 1, 1, 1,
0.1653376, -0.2080518, 1.966449, 1, 1, 1, 1, 1,
0.1662938, 1.603996, 1.581522, 1, 1, 1, 1, 1,
0.1669638, 0.5889112, -0.3029448, 1, 1, 1, 1, 1,
0.1684499, -0.4295528, 2.465204, 1, 1, 1, 1, 1,
0.1685297, -1.064688, 2.383846, 1, 1, 1, 1, 1,
0.1703102, -0.2949558, 2.256398, 1, 1, 1, 1, 1,
0.1706849, 0.5078258, -0.1964858, 1, 1, 1, 1, 1,
0.1724368, 1.549959, 0.4468474, 1, 1, 1, 1, 1,
0.1734364, 0.3785369, 0.1680703, 0, 0, 1, 1, 1,
0.1760121, -0.2316972, 0.9382615, 1, 0, 0, 1, 1,
0.1761295, 0.1955849, -1.581844, 1, 0, 0, 1, 1,
0.1771862, -0.3426366, 4.98241, 1, 0, 0, 1, 1,
0.1816377, 0.2349221, 1.134447, 1, 0, 0, 1, 1,
0.1816816, -1.169132, 2.703825, 1, 0, 0, 1, 1,
0.1851879, 0.2417498, 2.368244, 0, 0, 0, 1, 1,
0.1863801, -0.7458372, 3.069095, 0, 0, 0, 1, 1,
0.1959966, 0.2288302, 1.48265, 0, 0, 0, 1, 1,
0.1963026, 0.1583232, 2.061508, 0, 0, 0, 1, 1,
0.197181, 1.10673, -2.198376, 0, 0, 0, 1, 1,
0.1976717, 1.030704, -0.06368221, 0, 0, 0, 1, 1,
0.2060507, 0.2154865, 0.6948426, 0, 0, 0, 1, 1,
0.2066908, 1.12155, -0.3015806, 1, 1, 1, 1, 1,
0.2124322, 0.3902356, 0.8935769, 1, 1, 1, 1, 1,
0.2143186, 0.2519634, 1.2141, 1, 1, 1, 1, 1,
0.2149603, -0.4486944, 3.78665, 1, 1, 1, 1, 1,
0.215594, -2.163622, 3.144662, 1, 1, 1, 1, 1,
0.2197548, -1.410544, 1.864855, 1, 1, 1, 1, 1,
0.2209988, 0.2292511, 0.1121957, 1, 1, 1, 1, 1,
0.2215078, 0.4652342, 0.7325926, 1, 1, 1, 1, 1,
0.2219822, 0.3116497, 1.392336, 1, 1, 1, 1, 1,
0.2240392, -1.484506, 3.643704, 1, 1, 1, 1, 1,
0.2249664, 0.05309534, 2.964278, 1, 1, 1, 1, 1,
0.2266302, -0.6968665, 2.447333, 1, 1, 1, 1, 1,
0.2273748, 1.344609, -0.8532125, 1, 1, 1, 1, 1,
0.2282079, 0.007236864, 1.355118, 1, 1, 1, 1, 1,
0.2308192, 0.4609774, 1.062197, 1, 1, 1, 1, 1,
0.2328784, -0.4040822, -0.7388477, 0, 0, 1, 1, 1,
0.2330991, 0.4752513, 1.963442, 1, 0, 0, 1, 1,
0.2337989, -0.09534898, 2.439646, 1, 0, 0, 1, 1,
0.2459527, -1.393437, 3.849193, 1, 0, 0, 1, 1,
0.2481595, -0.7392709, 3.923853, 1, 0, 0, 1, 1,
0.2505651, -0.5146099, 2.732928, 1, 0, 0, 1, 1,
0.2558221, 0.7950303, 0.5240434, 0, 0, 0, 1, 1,
0.2590622, -0.867457, 2.743749, 0, 0, 0, 1, 1,
0.2605006, 0.313314, -0.8416938, 0, 0, 0, 1, 1,
0.2610107, 1.233206, 1.727924, 0, 0, 0, 1, 1,
0.2616303, -1.93364, 2.053185, 0, 0, 0, 1, 1,
0.2618956, 1.016997, 0.100589, 0, 0, 0, 1, 1,
0.2657739, 0.319095, 1.398208, 0, 0, 0, 1, 1,
0.2668349, -0.4533475, 0.2267703, 1, 1, 1, 1, 1,
0.2668646, -0.1906513, 2.977026, 1, 1, 1, 1, 1,
0.2670909, 1.225752, -1.518507, 1, 1, 1, 1, 1,
0.2696775, 0.06372968, 0.5549473, 1, 1, 1, 1, 1,
0.270421, 0.3288722, -0.4937309, 1, 1, 1, 1, 1,
0.2716599, -0.02605029, 0.9040439, 1, 1, 1, 1, 1,
0.2753693, -0.2044812, 1.384001, 1, 1, 1, 1, 1,
0.2785327, 0.2499627, 1.715229, 1, 1, 1, 1, 1,
0.2799594, 0.2301275, 0.06885619, 1, 1, 1, 1, 1,
0.2806551, 2.375309, 1.162662, 1, 1, 1, 1, 1,
0.2819816, 0.6286578, 1.756081, 1, 1, 1, 1, 1,
0.2840694, -0.3238736, 3.350474, 1, 1, 1, 1, 1,
0.2890488, 0.7391627, -0.2644724, 1, 1, 1, 1, 1,
0.2956563, -0.1076116, 1.79844, 1, 1, 1, 1, 1,
0.2967807, 0.4233176, 0.1497563, 1, 1, 1, 1, 1,
0.3026364, 0.5126324, -0.1574386, 0, 0, 1, 1, 1,
0.3047222, 2.036034, 0.1417397, 1, 0, 0, 1, 1,
0.3060316, 0.3815248, 1.322158, 1, 0, 0, 1, 1,
0.3062477, 0.6284472, 1.193811, 1, 0, 0, 1, 1,
0.3070147, -0.7161539, 2.108125, 1, 0, 0, 1, 1,
0.3078123, -0.7985491, 2.27572, 1, 0, 0, 1, 1,
0.3102009, -0.9028806, 3.107462, 0, 0, 0, 1, 1,
0.3116297, -0.8549789, 2.33855, 0, 0, 0, 1, 1,
0.314188, 0.187321, -0.2073766, 0, 0, 0, 1, 1,
0.3159183, -1.417391, 4.236207, 0, 0, 0, 1, 1,
0.3187541, -0.2110327, 2.251753, 0, 0, 0, 1, 1,
0.3197323, -0.4875964, 2.607789, 0, 0, 0, 1, 1,
0.3210268, -1.235366, 5.304246, 0, 0, 0, 1, 1,
0.3210639, 0.9353912, 1.039466, 1, 1, 1, 1, 1,
0.3250601, -0.497375, 3.68357, 1, 1, 1, 1, 1,
0.3254405, 0.07515299, 1.860073, 1, 1, 1, 1, 1,
0.3374204, 1.668012, 1.179255, 1, 1, 1, 1, 1,
0.3406174, 0.3155764, -0.7089332, 1, 1, 1, 1, 1,
0.3410667, 1.169985, -0.7100308, 1, 1, 1, 1, 1,
0.3440375, -0.595685, 3.536118, 1, 1, 1, 1, 1,
0.3460948, 0.9733562, 0.8050579, 1, 1, 1, 1, 1,
0.3507017, 0.2151969, 1.773968, 1, 1, 1, 1, 1,
0.3511212, -0.2767283, 2.005213, 1, 1, 1, 1, 1,
0.3515605, -0.6723778, 3.387119, 1, 1, 1, 1, 1,
0.3517533, -0.324264, 2.952925, 1, 1, 1, 1, 1,
0.3578663, 1.033163, 0.1884108, 1, 1, 1, 1, 1,
0.3584967, 0.7497444, 0.3261635, 1, 1, 1, 1, 1,
0.3600003, 1.750488, 1.485759, 1, 1, 1, 1, 1,
0.3646288, 0.6634901, 1.396346, 0, 0, 1, 1, 1,
0.3656568, -0.8615003, 2.278168, 1, 0, 0, 1, 1,
0.3677686, 0.9765516, 2.872808, 1, 0, 0, 1, 1,
0.369238, -0.01740417, 0.5600822, 1, 0, 0, 1, 1,
0.3754776, -1.41323, 4.719615, 1, 0, 0, 1, 1,
0.3805697, -0.1419055, 1.087067, 1, 0, 0, 1, 1,
0.3836651, -0.7789634, 3.165751, 0, 0, 0, 1, 1,
0.3837627, -1.445863, 3.843289, 0, 0, 0, 1, 1,
0.3863842, 0.5383416, -0.4377933, 0, 0, 0, 1, 1,
0.3875197, 2.596631, -0.6972285, 0, 0, 0, 1, 1,
0.3885294, -0.1211912, 1.040846, 0, 0, 0, 1, 1,
0.3920378, 0.6642612, 0.08722829, 0, 0, 0, 1, 1,
0.3946404, -2.100017, 2.885308, 0, 0, 0, 1, 1,
0.3950002, -0.1764855, 1.425272, 1, 1, 1, 1, 1,
0.3981272, 0.0410453, 1.402224, 1, 1, 1, 1, 1,
0.3988177, -2.89591, 4.269371, 1, 1, 1, 1, 1,
0.4084502, -0.7297111, 2.18492, 1, 1, 1, 1, 1,
0.4109883, 1.822461, 1.581886, 1, 1, 1, 1, 1,
0.4111401, -0.333994, 0.7647076, 1, 1, 1, 1, 1,
0.4113525, 0.9910603, 2.226305, 1, 1, 1, 1, 1,
0.41681, 0.5127825, 3.60507, 1, 1, 1, 1, 1,
0.4211379, -1.030357, 1.173349, 1, 1, 1, 1, 1,
0.4216163, -0.2304561, 0.7873414, 1, 1, 1, 1, 1,
0.4231742, 0.4547686, 0.6898717, 1, 1, 1, 1, 1,
0.4240395, -0.3997804, 2.303176, 1, 1, 1, 1, 1,
0.4300791, -0.340925, 2.329449, 1, 1, 1, 1, 1,
0.4308205, -1.121318, 2.826186, 1, 1, 1, 1, 1,
0.4327035, 0.2781912, 2.63063, 1, 1, 1, 1, 1,
0.4387161, 0.3306165, 2.123276, 0, 0, 1, 1, 1,
0.4562796, -1.846599, 1.408307, 1, 0, 0, 1, 1,
0.4570479, 2.270287, -0.03092143, 1, 0, 0, 1, 1,
0.4622127, -0.747021, 2.081553, 1, 0, 0, 1, 1,
0.4692254, 0.9954591, 1.09447, 1, 0, 0, 1, 1,
0.4780612, -0.956879, 3.993783, 1, 0, 0, 1, 1,
0.4790628, -1.122155, 3.298196, 0, 0, 0, 1, 1,
0.4840116, 0.1607342, 0.8767493, 0, 0, 0, 1, 1,
0.4858412, -0.3373655, 3.886422, 0, 0, 0, 1, 1,
0.493631, -0.6104239, 3.873125, 0, 0, 0, 1, 1,
0.5001498, 1.655881, 0.6807334, 0, 0, 0, 1, 1,
0.5032977, 0.0604515, 3.383255, 0, 0, 0, 1, 1,
0.5041016, -0.1151, 2.970314, 0, 0, 0, 1, 1,
0.504151, 0.3448888, 1.143149, 1, 1, 1, 1, 1,
0.5041569, -0.006776832, 1.606721, 1, 1, 1, 1, 1,
0.5074984, -1.903547, 2.964728, 1, 1, 1, 1, 1,
0.5088343, 1.500972, -0.2926418, 1, 1, 1, 1, 1,
0.5151242, 0.6284067, 0.2092259, 1, 1, 1, 1, 1,
0.5152623, -0.6869602, 4.122392, 1, 1, 1, 1, 1,
0.5165648, 0.3017381, 0.8442545, 1, 1, 1, 1, 1,
0.5198306, -1.441108, 3.00511, 1, 1, 1, 1, 1,
0.5247535, 1.966299, -1.03461, 1, 1, 1, 1, 1,
0.5315189, 0.609846, 1.520515, 1, 1, 1, 1, 1,
0.5349962, 1.969181, 1.45592, 1, 1, 1, 1, 1,
0.539883, 1.340606, -0.3392121, 1, 1, 1, 1, 1,
0.5465932, 0.8559725, 0.09104256, 1, 1, 1, 1, 1,
0.5545174, 1.750263, 0.05570208, 1, 1, 1, 1, 1,
0.5566202, -0.3633523, 1.308517, 1, 1, 1, 1, 1,
0.5589944, 0.6493793, 0.9225708, 0, 0, 1, 1, 1,
0.5645499, 1.519487, 1.556976, 1, 0, 0, 1, 1,
0.5677842, 0.8903826, 1.314028, 1, 0, 0, 1, 1,
0.570666, 0.1289014, 1.758844, 1, 0, 0, 1, 1,
0.5713509, -1.327164, 4.024415, 1, 0, 0, 1, 1,
0.5769589, 0.1070275, 1.449497, 1, 0, 0, 1, 1,
0.5797225, 1.329234, 0.009197154, 0, 0, 0, 1, 1,
0.5838819, 0.8337566, 0.3291729, 0, 0, 0, 1, 1,
0.585465, 0.4884468, 1.729104, 0, 0, 0, 1, 1,
0.5901843, -0.3437465, 3.300381, 0, 0, 0, 1, 1,
0.5997317, 0.5999243, 2.206027, 0, 0, 0, 1, 1,
0.601469, 0.896786, 0.5433708, 0, 0, 0, 1, 1,
0.601827, -0.6505706, 0.9442904, 0, 0, 0, 1, 1,
0.6037722, 0.1925155, 1.990657, 1, 1, 1, 1, 1,
0.6079058, -2.874092, 3.057153, 1, 1, 1, 1, 1,
0.6082209, 0.5293035, -0.7339211, 1, 1, 1, 1, 1,
0.6129027, 0.4165761, 2.20455, 1, 1, 1, 1, 1,
0.6130536, 0.2780842, 0.3796999, 1, 1, 1, 1, 1,
0.6149909, 0.002981333, 1.717902, 1, 1, 1, 1, 1,
0.6155887, 0.5742127, -0.8693757, 1, 1, 1, 1, 1,
0.6249256, 0.7372745, 0.7504566, 1, 1, 1, 1, 1,
0.6390038, -1.334817, 2.938184, 1, 1, 1, 1, 1,
0.6420808, -1.982984, 1.120497, 1, 1, 1, 1, 1,
0.643365, -0.7898383, 3.279166, 1, 1, 1, 1, 1,
0.6458414, -0.006177301, 0.1324956, 1, 1, 1, 1, 1,
0.6480966, -0.3704188, 3.022941, 1, 1, 1, 1, 1,
0.6493524, 0.4163998, 1.440837, 1, 1, 1, 1, 1,
0.6595504, -0.2422291, 1.551131, 1, 1, 1, 1, 1,
0.6601197, -0.6802702, 1.782027, 0, 0, 1, 1, 1,
0.6621181, 0.5762991, 1.871427, 1, 0, 0, 1, 1,
0.6622645, -0.2909923, 2.564896, 1, 0, 0, 1, 1,
0.6646993, 0.2048615, 0.6115422, 1, 0, 0, 1, 1,
0.6669191, 0.02765173, 3.002518, 1, 0, 0, 1, 1,
0.6672615, -1.729443, 2.079064, 1, 0, 0, 1, 1,
0.6741534, 0.565638, -0.1240254, 0, 0, 0, 1, 1,
0.6742563, -0.2034652, 1.859789, 0, 0, 0, 1, 1,
0.6810979, 0.2314295, 2.200313, 0, 0, 0, 1, 1,
0.683035, -0.4291959, 3.020654, 0, 0, 0, 1, 1,
0.6856629, 0.8006223, 2.581226, 0, 0, 0, 1, 1,
0.6893189, -0.2697402, 1.125206, 0, 0, 0, 1, 1,
0.6910694, -0.883607, 3.784581, 0, 0, 0, 1, 1,
0.6928071, 0.4159575, 2.111148, 1, 1, 1, 1, 1,
0.6932085, 0.8465403, 1.796555, 1, 1, 1, 1, 1,
0.6935763, 0.8152263, 0.1441083, 1, 1, 1, 1, 1,
0.6949741, -1.125989, 1.308876, 1, 1, 1, 1, 1,
0.6956925, -1.393903, 2.343102, 1, 1, 1, 1, 1,
0.6958559, -0.01658801, 0.1829211, 1, 1, 1, 1, 1,
0.6982059, -1.490298, 1.019599, 1, 1, 1, 1, 1,
0.7010422, 0.3951826, -0.2748204, 1, 1, 1, 1, 1,
0.7022641, -0.9896172, 0.9872622, 1, 1, 1, 1, 1,
0.7045665, -0.7191945, 1.316083, 1, 1, 1, 1, 1,
0.7056137, 0.2039467, 1.376672, 1, 1, 1, 1, 1,
0.715215, 0.8054844, -0.6912431, 1, 1, 1, 1, 1,
0.7172971, -0.8202895, 1.695787, 1, 1, 1, 1, 1,
0.7198747, -0.9927564, 2.317311, 1, 1, 1, 1, 1,
0.7234085, 0.5935015, 0.1557767, 1, 1, 1, 1, 1,
0.7301037, -0.01831258, 1.879995, 0, 0, 1, 1, 1,
0.7325479, 0.121906, 1.99037, 1, 0, 0, 1, 1,
0.7369092, 2.558056, -0.2072426, 1, 0, 0, 1, 1,
0.7386136, 0.1198127, -0.6702003, 1, 0, 0, 1, 1,
0.7415584, -0.911645, 1.945975, 1, 0, 0, 1, 1,
0.7449258, 0.9373823, -0.2283664, 1, 0, 0, 1, 1,
0.7464152, 1.503968, 0.4964612, 0, 0, 0, 1, 1,
0.7508644, 0.8293235, 2.121735, 0, 0, 0, 1, 1,
0.7651968, -1.942588, 1.285936, 0, 0, 0, 1, 1,
0.7685477, -0.9445368, 3.903905, 0, 0, 0, 1, 1,
0.771857, -0.04398988, 0.9707857, 0, 0, 0, 1, 1,
0.7744066, -1.394826, 2.782219, 0, 0, 0, 1, 1,
0.7752659, 0.01378398, 1.018306, 0, 0, 0, 1, 1,
0.7795895, -1.122617, 3.495067, 1, 1, 1, 1, 1,
0.7813647, -0.9089755, 2.78556, 1, 1, 1, 1, 1,
0.7838398, -0.5211051, 1.171519, 1, 1, 1, 1, 1,
0.7940047, 1.676579, 0.1391414, 1, 1, 1, 1, 1,
0.8036336, -0.7678273, 2.639787, 1, 1, 1, 1, 1,
0.8036821, 1.396293, 0.8320672, 1, 1, 1, 1, 1,
0.8064178, 0.9279468, 1.55659, 1, 1, 1, 1, 1,
0.8132095, -0.3896798, 2.10047, 1, 1, 1, 1, 1,
0.8142892, 0.684644, 0.02868292, 1, 1, 1, 1, 1,
0.825058, -1.449531, 4.198239, 1, 1, 1, 1, 1,
0.8273611, 0.2147802, 2.181392, 1, 1, 1, 1, 1,
0.8316016, -0.7662855, 2.343427, 1, 1, 1, 1, 1,
0.8386069, -0.2236409, 4.358677, 1, 1, 1, 1, 1,
0.8407902, 1.403096, 0.8787315, 1, 1, 1, 1, 1,
0.8537733, -0.3273134, -0.179702, 1, 1, 1, 1, 1,
0.8589495, -1.760479, 2.206504, 0, 0, 1, 1, 1,
0.8616115, 0.719344, -0.3759712, 1, 0, 0, 1, 1,
0.863065, -0.003795548, 1.499461, 1, 0, 0, 1, 1,
0.8693613, 0.5543854, -0.1324161, 1, 0, 0, 1, 1,
0.8793224, 0.4700896, 0.07802857, 1, 0, 0, 1, 1,
0.8805422, 0.690772, 2.908156, 1, 0, 0, 1, 1,
0.8839865, -0.6139016, 4.331836, 0, 0, 0, 1, 1,
0.8849751, -0.6671309, 0.4398895, 0, 0, 0, 1, 1,
0.897935, 0.1866185, 0.1740922, 0, 0, 0, 1, 1,
0.9062138, 1.426708, -1.05209, 0, 0, 0, 1, 1,
0.9068596, 0.4449481, 2.312971, 0, 0, 0, 1, 1,
0.910468, 0.00309223, 1.799267, 0, 0, 0, 1, 1,
0.9151196, 1.951845, 0.451414, 0, 0, 0, 1, 1,
0.9294025, -1.673442, 1.337013, 1, 1, 1, 1, 1,
0.9327984, 0.4429566, 0.8730384, 1, 1, 1, 1, 1,
0.9357761, -1.227859, 1.587058, 1, 1, 1, 1, 1,
0.9442232, -0.648776, 3.36346, 1, 1, 1, 1, 1,
0.9584162, -0.6511219, 0.9313691, 1, 1, 1, 1, 1,
0.9604913, -0.7167687, 0.3512732, 1, 1, 1, 1, 1,
0.9635472, 1.715293, 0.7794174, 1, 1, 1, 1, 1,
0.9642423, 0.7923132, 1.401895, 1, 1, 1, 1, 1,
0.9652781, -2.051554, 4.230232, 1, 1, 1, 1, 1,
0.9667606, 1.226854, 1.724261, 1, 1, 1, 1, 1,
0.9690069, 1.443158, 1.351114, 1, 1, 1, 1, 1,
0.9707774, -2.050411, 3.121981, 1, 1, 1, 1, 1,
0.9712102, -0.3194557, 2.70512, 1, 1, 1, 1, 1,
0.9741336, 0.6153038, 1.928699, 1, 1, 1, 1, 1,
0.9762142, 0.0139047, 2.626865, 1, 1, 1, 1, 1,
0.9777576, -0.4774796, 2.40364, 0, 0, 1, 1, 1,
0.9803363, 0.1525998, 0.401006, 1, 0, 0, 1, 1,
0.9864249, -0.3240159, 2.932668, 1, 0, 0, 1, 1,
0.987057, -0.4588853, 2.271717, 1, 0, 0, 1, 1,
0.9880032, -0.4347058, 2.815562, 1, 0, 0, 1, 1,
0.9926066, -0.218401, 0.856001, 1, 0, 0, 1, 1,
0.9948823, 1.488761, 0.4187388, 0, 0, 0, 1, 1,
1.011334, 1.414085, 1.311352, 0, 0, 0, 1, 1,
1.013932, 0.4905732, 2.024621, 0, 0, 0, 1, 1,
1.014819, 1.539101, 1.578238, 0, 0, 0, 1, 1,
1.015412, -0.5831568, 2.782146, 0, 0, 0, 1, 1,
1.019286, 0.353276, 1.060407, 0, 0, 0, 1, 1,
1.022398, 0.2542565, 2.521946, 0, 0, 0, 1, 1,
1.024548, 0.3807719, 0.3973857, 1, 1, 1, 1, 1,
1.024605, 0.01118266, 1.122604, 1, 1, 1, 1, 1,
1.027096, 0.02022292, 2.481973, 1, 1, 1, 1, 1,
1.039787, 0.7714579, 0.8523396, 1, 1, 1, 1, 1,
1.040049, -0.3668607, 2.321713, 1, 1, 1, 1, 1,
1.048635, 0.5905635, 0.4300818, 1, 1, 1, 1, 1,
1.048771, 1.043573, 1.516684, 1, 1, 1, 1, 1,
1.054472, 1.248492, 0.9453852, 1, 1, 1, 1, 1,
1.05824, 0.5941153, 1.116169, 1, 1, 1, 1, 1,
1.064066, 0.5750718, 1.576209, 1, 1, 1, 1, 1,
1.064364, 1.529937, 1.263138, 1, 1, 1, 1, 1,
1.065341, 0.2297464, 3.481673, 1, 1, 1, 1, 1,
1.065975, -0.002459234, 1.52986, 1, 1, 1, 1, 1,
1.067274, 0.2571017, 1.406782, 1, 1, 1, 1, 1,
1.070902, -1.026203, 3.477579, 1, 1, 1, 1, 1,
1.075335, -1.090087, 2.083039, 0, 0, 1, 1, 1,
1.077229, -0.4180162, 2.69839, 1, 0, 0, 1, 1,
1.082137, -0.3769044, -0.2768984, 1, 0, 0, 1, 1,
1.089131, -0.229209, 2.315706, 1, 0, 0, 1, 1,
1.093991, 1.273726, 1.618177, 1, 0, 0, 1, 1,
1.100613, 0.595589, 2.220803, 1, 0, 0, 1, 1,
1.105182, -0.5342462, 0.5349698, 0, 0, 0, 1, 1,
1.10699, -0.8429216, 1.278079, 0, 0, 0, 1, 1,
1.107034, 1.950104, -0.5433972, 0, 0, 0, 1, 1,
1.113522, -1.18261, 2.67017, 0, 0, 0, 1, 1,
1.115932, -0.6530403, 1.659355, 0, 0, 0, 1, 1,
1.125545, -0.8534886, 1.926247, 0, 0, 0, 1, 1,
1.130392, -1.048542, 1.986909, 0, 0, 0, 1, 1,
1.134964, -2.189105, 3.069506, 1, 1, 1, 1, 1,
1.136287, -0.07048701, 3.352709, 1, 1, 1, 1, 1,
1.136291, 0.2401443, 1.590459, 1, 1, 1, 1, 1,
1.140437, -0.1281877, 1.345336, 1, 1, 1, 1, 1,
1.141259, -0.07971893, 1.966638, 1, 1, 1, 1, 1,
1.174156, -0.4171981, 1.334898, 1, 1, 1, 1, 1,
1.179332, -0.7637661, 1.63548, 1, 1, 1, 1, 1,
1.180914, 1.845782, 0.8898836, 1, 1, 1, 1, 1,
1.18122, 0.04403973, 2.229465, 1, 1, 1, 1, 1,
1.185211, 0.5396334, 0.2927483, 1, 1, 1, 1, 1,
1.194099, 0.2838312, -0.1062259, 1, 1, 1, 1, 1,
1.196077, -0.8847416, 2.803889, 1, 1, 1, 1, 1,
1.19862, -1.144702, 1.952535, 1, 1, 1, 1, 1,
1.201432, 0.7465884, -0.2056888, 1, 1, 1, 1, 1,
1.203237, -0.4940623, 0.8063811, 1, 1, 1, 1, 1,
1.203662, -0.1200097, 2.321056, 0, 0, 1, 1, 1,
1.223793, 1.159868, 0.1727642, 1, 0, 0, 1, 1,
1.226065, -0.4096577, 0.8088751, 1, 0, 0, 1, 1,
1.228964, -0.5663025, 1.321062, 1, 0, 0, 1, 1,
1.230148, 1.479011, -1.452873, 1, 0, 0, 1, 1,
1.235394, 0.9907838, 1.195604, 1, 0, 0, 1, 1,
1.238115, 1.594194, -0.008949251, 0, 0, 0, 1, 1,
1.241292, -1.809628, 2.222704, 0, 0, 0, 1, 1,
1.244294, -0.03841555, 1.885773, 0, 0, 0, 1, 1,
1.262977, -0.7659751, 1.20972, 0, 0, 0, 1, 1,
1.288761, 0.1287986, 2.14657, 0, 0, 0, 1, 1,
1.293957, -0.9355962, 1.960295, 0, 0, 0, 1, 1,
1.304176, -1.594516, 1.521923, 0, 0, 0, 1, 1,
1.31039, -1.101582, 3.498037, 1, 1, 1, 1, 1,
1.310823, -0.9189491, 2.580159, 1, 1, 1, 1, 1,
1.33056, 0.899404, 1.528549, 1, 1, 1, 1, 1,
1.332979, 0.4900374, 1.786422, 1, 1, 1, 1, 1,
1.34312, -0.3360763, 3.428547, 1, 1, 1, 1, 1,
1.347216, 0.03217516, 0.8851131, 1, 1, 1, 1, 1,
1.357028, -1.320168, 1.543063, 1, 1, 1, 1, 1,
1.359675, 1.000981, 0.5614237, 1, 1, 1, 1, 1,
1.362225, 0.240155, -0.3078182, 1, 1, 1, 1, 1,
1.364551, 0.9705793, 0.3823912, 1, 1, 1, 1, 1,
1.366416, -0.3364787, 1.632581, 1, 1, 1, 1, 1,
1.376064, -1.467424, 2.097654, 1, 1, 1, 1, 1,
1.383945, -1.183239, 2.514627, 1, 1, 1, 1, 1,
1.39518, -0.03453667, 2.13252, 1, 1, 1, 1, 1,
1.401473, -0.1921868, 1.853693, 1, 1, 1, 1, 1,
1.41314, 0.195888, 0.5610069, 0, 0, 1, 1, 1,
1.41655, 0.6382305, 1.068394, 1, 0, 0, 1, 1,
1.418611, 0.8711004, 2.263453, 1, 0, 0, 1, 1,
1.421503, 0.912466, -0.7567491, 1, 0, 0, 1, 1,
1.42477, -0.3226102, 1.899568, 1, 0, 0, 1, 1,
1.42726, 0.1677994, 1.526326, 1, 0, 0, 1, 1,
1.427708, -0.253564, 1.574531, 0, 0, 0, 1, 1,
1.431494, -0.11398, 1.969969, 0, 0, 0, 1, 1,
1.433865, 1.628977, 0.6266444, 0, 0, 0, 1, 1,
1.448828, -0.05554312, 0.6789619, 0, 0, 0, 1, 1,
1.477348, -1.261878, 1.096748, 0, 0, 0, 1, 1,
1.48454, -0.572232, 4.167315, 0, 0, 0, 1, 1,
1.485336, -0.6248072, 1.41609, 0, 0, 0, 1, 1,
1.493494, 2.246582, 0.1678557, 1, 1, 1, 1, 1,
1.503728, 0.5056347, 1.320958, 1, 1, 1, 1, 1,
1.506288, 1.245904, -0.08604378, 1, 1, 1, 1, 1,
1.514821, 2.30085, -0.9069906, 1, 1, 1, 1, 1,
1.518705, 1.136161, 1.197266, 1, 1, 1, 1, 1,
1.520039, 0.1087588, 1.236202, 1, 1, 1, 1, 1,
1.522977, -0.2862076, 2.142619, 1, 1, 1, 1, 1,
1.55248, -0.9477164, 2.087187, 1, 1, 1, 1, 1,
1.559, 0.4286242, 0.7448815, 1, 1, 1, 1, 1,
1.601392, -0.2758774, 1.212607, 1, 1, 1, 1, 1,
1.604095, -2.208329, 3.299062, 1, 1, 1, 1, 1,
1.616117, 0.9002008, 2.048869, 1, 1, 1, 1, 1,
1.624696, -1.103364, 0.8787798, 1, 1, 1, 1, 1,
1.642621, 1.847082, 1.698266, 1, 1, 1, 1, 1,
1.643157, 2.345592, 0.7313799, 1, 1, 1, 1, 1,
1.658627, 1.11921, 0.2255583, 0, 0, 1, 1, 1,
1.66293, -0.5445201, 3.474557, 1, 0, 0, 1, 1,
1.667152, -1.715028, 2.399861, 1, 0, 0, 1, 1,
1.676184, -1.669792, 1.154165, 1, 0, 0, 1, 1,
1.682796, 1.97412, 1.732201, 1, 0, 0, 1, 1,
1.683562, 0.1775571, 2.721255, 1, 0, 0, 1, 1,
1.684884, 0.2469718, 2.308951, 0, 0, 0, 1, 1,
1.706222, 0.2605331, 2.070575, 0, 0, 0, 1, 1,
1.70884, -0.6650184, 3.681961, 0, 0, 0, 1, 1,
1.723032, 1.815041, 2.158219, 0, 0, 0, 1, 1,
1.726774, -1.744148, 3.081136, 0, 0, 0, 1, 1,
1.733479, -0.1764022, 1.94454, 0, 0, 0, 1, 1,
1.736259, 0.1903744, 0.8388491, 0, 0, 0, 1, 1,
1.738049, -0.1126879, 2.164371, 1, 1, 1, 1, 1,
1.761035, -0.4915701, 2.164844, 1, 1, 1, 1, 1,
1.778615, -0.7467065, 2.665268, 1, 1, 1, 1, 1,
1.783472, -1.073793, 2.53284, 1, 1, 1, 1, 1,
1.788499, -1.526528, 2.882517, 1, 1, 1, 1, 1,
1.807361, 0.7625983, 2.088715, 1, 1, 1, 1, 1,
1.810747, -0.9674493, 1.798113, 1, 1, 1, 1, 1,
1.827251, 2.060308, -0.01574712, 1, 1, 1, 1, 1,
1.827836, -1.407104, 1.907117, 1, 1, 1, 1, 1,
1.839956, 1.861466, 0.2115918, 1, 1, 1, 1, 1,
1.845225, -0.4872241, 3.23747, 1, 1, 1, 1, 1,
1.858642, 1.561157, 1.32462, 1, 1, 1, 1, 1,
1.88793, 1.253305, 0.8704344, 1, 1, 1, 1, 1,
1.911305, -0.001725352, 2.279622, 1, 1, 1, 1, 1,
1.916868, -1.19398, 1.24891, 1, 1, 1, 1, 1,
1.918781, -0.1630554, 0.5226916, 0, 0, 1, 1, 1,
1.929355, 0.9559795, 0.1951598, 1, 0, 0, 1, 1,
1.958316, 0.4696187, 1.346012, 1, 0, 0, 1, 1,
1.991076, 2.062805, 0.7363505, 1, 0, 0, 1, 1,
2.037724, 0.258566, 0.6448004, 1, 0, 0, 1, 1,
2.103627, 0.2659172, 0.7899262, 1, 0, 0, 1, 1,
2.168443, -0.1270252, 2.016276, 0, 0, 0, 1, 1,
2.215734, 2.174685, -0.7759612, 0, 0, 0, 1, 1,
2.226066, 0.4565797, 2.126023, 0, 0, 0, 1, 1,
2.259871, 0.7064342, -0.1360662, 0, 0, 0, 1, 1,
2.297951, -0.03492176, 2.74711, 0, 0, 0, 1, 1,
2.300231, 0.1625485, -0.5550648, 0, 0, 0, 1, 1,
2.41464, -0.1716985, 3.105819, 0, 0, 0, 1, 1,
2.555288, 0.6501454, 1.383815, 1, 1, 1, 1, 1,
2.579847, -1.848749, 0.9841663, 1, 1, 1, 1, 1,
2.775064, -1.055286, 2.110199, 1, 1, 1, 1, 1,
2.811342, -0.05112844, 1.268264, 1, 1, 1, 1, 1,
2.946295, 2.16647, 1.128229, 1, 1, 1, 1, 1,
2.995216, 0.4797438, 0.6959419, 1, 1, 1, 1, 1,
3.346062, -1.873058, 3.419545, 1, 1, 1, 1, 1
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
var radius = 9.601778;
var distance = 33.72584;
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
mvMatrix.translate( -0.1689682, 0.3870454, 0.06312251 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.72584);
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
