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
-2.7119, -0.05290702, -0.7585403, 1, 0, 0, 1,
-2.587703, 0.9853438, 0.872839, 1, 0.007843138, 0, 1,
-2.473405, 0.7919117, -1.156908, 1, 0.01176471, 0, 1,
-2.468392, 0.4490947, -0.09698612, 1, 0.01960784, 0, 1,
-2.441255, -0.7624644, -2.256788, 1, 0.02352941, 0, 1,
-2.32655, 1.342414, -0.4988151, 1, 0.03137255, 0, 1,
-2.287843, -0.9272141, -5.350312, 1, 0.03529412, 0, 1,
-2.236675, 0.2983432, -0.7434837, 1, 0.04313726, 0, 1,
-2.216731, -0.3854481, -0.9339092, 1, 0.04705882, 0, 1,
-2.152378, -0.4517979, -1.213885, 1, 0.05490196, 0, 1,
-2.144917, -1.505106, -0.6587196, 1, 0.05882353, 0, 1,
-2.14488, 1.062256, 0.7138278, 1, 0.06666667, 0, 1,
-2.142579, 1.101413, -1.280378, 1, 0.07058824, 0, 1,
-2.052385, -0.7087447, -2.641145, 1, 0.07843138, 0, 1,
-2.04196, -0.7675027, -1.400939, 1, 0.08235294, 0, 1,
-2.019842, 0.9121555, -2.004271, 1, 0.09019608, 0, 1,
-2.01345, -0.9143769, -1.977896, 1, 0.09411765, 0, 1,
-2.002589, -0.9584853, -1.583858, 1, 0.1019608, 0, 1,
-1.96805, 1.288998, -1.214722, 1, 0.1098039, 0, 1,
-1.947717, 0.2880472, -1.325565, 1, 0.1137255, 0, 1,
-1.928118, -1.206086, -0.7295135, 1, 0.1215686, 0, 1,
-1.923036, 0.4655016, -0.8689344, 1, 0.1254902, 0, 1,
-1.920761, -0.8037515, -0.5068353, 1, 0.1333333, 0, 1,
-1.902685, 0.8361285, -1.057083, 1, 0.1372549, 0, 1,
-1.898982, 0.2408436, -1.985541, 1, 0.145098, 0, 1,
-1.862051, -1.03757, -2.726124, 1, 0.1490196, 0, 1,
-1.860372, 1.180317, 0.3961782, 1, 0.1568628, 0, 1,
-1.859838, -0.5474721, -2.911429, 1, 0.1607843, 0, 1,
-1.858104, 1.618946, -0.6284388, 1, 0.1686275, 0, 1,
-1.84551, 1.518776, -2.241696, 1, 0.172549, 0, 1,
-1.844221, 0.333111, 0.8187141, 1, 0.1803922, 0, 1,
-1.837134, -0.3323765, -1.284521, 1, 0.1843137, 0, 1,
-1.803064, -1.439166, -3.527814, 1, 0.1921569, 0, 1,
-1.79871, -0.1221253, 0.03646309, 1, 0.1960784, 0, 1,
-1.796269, 1.331766, -1.180928, 1, 0.2039216, 0, 1,
-1.791506, -0.4930171, -0.9530893, 1, 0.2117647, 0, 1,
-1.764733, -2.222851, -2.473153, 1, 0.2156863, 0, 1,
-1.763653, -0.1528374, -1.401824, 1, 0.2235294, 0, 1,
-1.756163, -1.032974, -2.043153, 1, 0.227451, 0, 1,
-1.753638, -0.9906731, -2.703363, 1, 0.2352941, 0, 1,
-1.734292, 0.2723802, -1.696207, 1, 0.2392157, 0, 1,
-1.715817, -2.003152, -1.222831, 1, 0.2470588, 0, 1,
-1.698417, 0.5424662, -2.138185, 1, 0.2509804, 0, 1,
-1.692646, 0.04410627, -1.22348, 1, 0.2588235, 0, 1,
-1.684968, 0.295556, -0.9107079, 1, 0.2627451, 0, 1,
-1.683175, -0.07642522, -1.764597, 1, 0.2705882, 0, 1,
-1.681351, -0.09084667, -0.05919879, 1, 0.2745098, 0, 1,
-1.680817, -0.7353399, -2.650816, 1, 0.282353, 0, 1,
-1.659558, 0.9384465, -1.495593, 1, 0.2862745, 0, 1,
-1.647827, 0.1521624, -1.545125, 1, 0.2941177, 0, 1,
-1.645769, 0.4620827, -2.057987, 1, 0.3019608, 0, 1,
-1.636951, 0.3629478, -0.08583399, 1, 0.3058824, 0, 1,
-1.626509, 0.1333455, -1.267365, 1, 0.3137255, 0, 1,
-1.622102, 0.4049961, -0.7504629, 1, 0.3176471, 0, 1,
-1.619513, 0.6973137, -1.274505, 1, 0.3254902, 0, 1,
-1.615789, -0.5381595, -2.463681, 1, 0.3294118, 0, 1,
-1.586706, 0.1460952, -2.244135, 1, 0.3372549, 0, 1,
-1.562017, -1.347557, -1.259795, 1, 0.3411765, 0, 1,
-1.556915, -0.1975245, -1.879369, 1, 0.3490196, 0, 1,
-1.522889, 2.725418, 0.1206464, 1, 0.3529412, 0, 1,
-1.510309, -1.743491, -1.653775, 1, 0.3607843, 0, 1,
-1.508596, 0.0491077, -2.297235, 1, 0.3647059, 0, 1,
-1.495836, -1.076423, -2.618256, 1, 0.372549, 0, 1,
-1.492591, -0.5151528, -1.264335, 1, 0.3764706, 0, 1,
-1.480232, -0.9302504, -3.110835, 1, 0.3843137, 0, 1,
-1.4605, -0.9344624, -1.655853, 1, 0.3882353, 0, 1,
-1.441043, 0.7728143, -0.5634188, 1, 0.3960784, 0, 1,
-1.433506, -0.05098358, -1.464679, 1, 0.4039216, 0, 1,
-1.428118, -0.3851263, -2.946947, 1, 0.4078431, 0, 1,
-1.424535, 1.211606, 0.3990455, 1, 0.4156863, 0, 1,
-1.423111, 1.207529, -1.733405, 1, 0.4196078, 0, 1,
-1.421735, 1.050093, -0.2252528, 1, 0.427451, 0, 1,
-1.410785, -0.4790766, -2.361262, 1, 0.4313726, 0, 1,
-1.408425, -0.1906599, -2.540334, 1, 0.4392157, 0, 1,
-1.404631, -0.8732399, -2.074884, 1, 0.4431373, 0, 1,
-1.398158, 0.2814353, -1.036233, 1, 0.4509804, 0, 1,
-1.398143, 1.738995, -0.1241486, 1, 0.454902, 0, 1,
-1.380241, -0.9324086, -1.918445, 1, 0.4627451, 0, 1,
-1.366135, 0.7106715, -1.833217, 1, 0.4666667, 0, 1,
-1.351283, -0.5164866, -3.335973, 1, 0.4745098, 0, 1,
-1.345175, -0.03741409, -1.362125, 1, 0.4784314, 0, 1,
-1.337688, -0.9477997, -1.46374, 1, 0.4862745, 0, 1,
-1.323402, -1.844538, -1.85228, 1, 0.4901961, 0, 1,
-1.32166, 0.5421911, -2.14517, 1, 0.4980392, 0, 1,
-1.31874, -0.4970363, -1.209288, 1, 0.5058824, 0, 1,
-1.310473, 0.7409746, 0.15244, 1, 0.509804, 0, 1,
-1.302892, 0.4219475, -0.3979191, 1, 0.5176471, 0, 1,
-1.297775, 1.828304, -2.476356, 1, 0.5215687, 0, 1,
-1.278364, -1.786984, -2.438165, 1, 0.5294118, 0, 1,
-1.259196, -0.881104, -1.836779, 1, 0.5333334, 0, 1,
-1.249982, 1.253004, -1.941318, 1, 0.5411765, 0, 1,
-1.242605, 0.4902426, -1.034836, 1, 0.5450981, 0, 1,
-1.241752, -0.1458056, -1.808096, 1, 0.5529412, 0, 1,
-1.239509, -0.5194094, -3.000294, 1, 0.5568628, 0, 1,
-1.231444, -1.103672, -3.029011, 1, 0.5647059, 0, 1,
-1.228171, -0.1386007, -1.253911, 1, 0.5686275, 0, 1,
-1.223596, -0.4432628, -3.157438, 1, 0.5764706, 0, 1,
-1.21452, 0.756159, -0.5301188, 1, 0.5803922, 0, 1,
-1.211468, 1.282803, -1.651599, 1, 0.5882353, 0, 1,
-1.208913, 0.2412504, -2.660586, 1, 0.5921569, 0, 1,
-1.202765, -0.6199056, -3.054409, 1, 0.6, 0, 1,
-1.197793, -0.206179, -3.718365, 1, 0.6078432, 0, 1,
-1.194939, 0.43592, -2.379616, 1, 0.6117647, 0, 1,
-1.193914, 0.8385953, -0.8518301, 1, 0.6196079, 0, 1,
-1.189601, 0.1637843, -1.479258, 1, 0.6235294, 0, 1,
-1.187147, 0.4984862, -1.490794, 1, 0.6313726, 0, 1,
-1.187052, 0.4456846, -1.993182, 1, 0.6352941, 0, 1,
-1.184182, 1.484995, -0.906658, 1, 0.6431373, 0, 1,
-1.173118, -0.6325285, -2.010905, 1, 0.6470588, 0, 1,
-1.171748, 1.324787, -1.926677, 1, 0.654902, 0, 1,
-1.165535, -2.479298, -4.144584, 1, 0.6588235, 0, 1,
-1.158535, 0.5711845, -0.2741286, 1, 0.6666667, 0, 1,
-1.158414, -0.9302552, -2.749588, 1, 0.6705883, 0, 1,
-1.148097, -0.6124829, -1.788941, 1, 0.6784314, 0, 1,
-1.144767, 0.5320381, -1.038493, 1, 0.682353, 0, 1,
-1.14228, 1.24962, -1.146107, 1, 0.6901961, 0, 1,
-1.142153, -0.5926057, -2.72115, 1, 0.6941177, 0, 1,
-1.14193, 0.3070198, -1.663855, 1, 0.7019608, 0, 1,
-1.140122, 0.6795297, -0.05905496, 1, 0.7098039, 0, 1,
-1.136982, 0.3325563, -2.019459, 1, 0.7137255, 0, 1,
-1.133478, -0.3439932, -1.971264, 1, 0.7215686, 0, 1,
-1.133099, -1.544954, -4.041162, 1, 0.7254902, 0, 1,
-1.127545, 0.2201633, -0.2146235, 1, 0.7333333, 0, 1,
-1.124275, 0.970332, 0.04707457, 1, 0.7372549, 0, 1,
-1.115628, 0.1943432, -1.061336, 1, 0.7450981, 0, 1,
-1.112252, -1.843992, -2.196429, 1, 0.7490196, 0, 1,
-1.090841, 0.1366856, -1.633066, 1, 0.7568628, 0, 1,
-1.081387, -0.003148194, -0.2057483, 1, 0.7607843, 0, 1,
-1.069802, 0.130036, -0.9679993, 1, 0.7686275, 0, 1,
-1.069332, -2.222848, -3.131672, 1, 0.772549, 0, 1,
-1.068296, 1.723056, -1.257154, 1, 0.7803922, 0, 1,
-1.062497, -1.088287, -3.502659, 1, 0.7843137, 0, 1,
-1.062192, -0.2672162, -3.192674, 1, 0.7921569, 0, 1,
-1.056437, -1.077235, -2.066608, 1, 0.7960784, 0, 1,
-1.053027, -0.6054107, -1.889782, 1, 0.8039216, 0, 1,
-1.050812, 1.177752, -0.1110038, 1, 0.8117647, 0, 1,
-1.048781, -1.300598, -2.218255, 1, 0.8156863, 0, 1,
-1.048575, 0.3007023, -0.8395926, 1, 0.8235294, 0, 1,
-1.04125, -0.6587218, -1.201303, 1, 0.827451, 0, 1,
-1.04003, -1.083884, -2.847109, 1, 0.8352941, 0, 1,
-1.039459, 1.726908, -0.3921376, 1, 0.8392157, 0, 1,
-1.02565, 1.00974, -1.005097, 1, 0.8470588, 0, 1,
-1.017436, -2.683124, -1.640073, 1, 0.8509804, 0, 1,
-1.000837, 1.195938, 0.4409374, 1, 0.8588235, 0, 1,
-0.9920068, -0.09771071, -2.117566, 1, 0.8627451, 0, 1,
-0.9896898, 0.2593649, -1.152285, 1, 0.8705882, 0, 1,
-0.9886004, -0.9395442, -2.8413, 1, 0.8745098, 0, 1,
-0.9877531, 0.8133306, -1.662016, 1, 0.8823529, 0, 1,
-0.9841232, -0.1435537, -2.228363, 1, 0.8862745, 0, 1,
-0.9830979, -0.6103858, -2.747123, 1, 0.8941177, 0, 1,
-0.9807197, -0.02826383, -2.489334, 1, 0.8980392, 0, 1,
-0.9737063, -0.06472421, -3.186718, 1, 0.9058824, 0, 1,
-0.9712047, -0.03958872, 0.2154827, 1, 0.9137255, 0, 1,
-0.970295, 0.4053449, -1.150566, 1, 0.9176471, 0, 1,
-0.9675083, -0.6052413, -2.736817, 1, 0.9254902, 0, 1,
-0.9435453, -0.6350172, -1.55918, 1, 0.9294118, 0, 1,
-0.9421088, 0.5063107, -0.3389568, 1, 0.9372549, 0, 1,
-0.912726, -0.2187133, -1.540411, 1, 0.9411765, 0, 1,
-0.912099, 1.99069, -1.056214, 1, 0.9490196, 0, 1,
-0.9114922, -0.09107319, -3.627097, 1, 0.9529412, 0, 1,
-0.9104045, -1.29546, -4.124255, 1, 0.9607843, 0, 1,
-0.9057633, -0.2424267, -1.224548, 1, 0.9647059, 0, 1,
-0.8997356, 1.764919, -1.105056, 1, 0.972549, 0, 1,
-0.891131, 1.239202, -0.1981954, 1, 0.9764706, 0, 1,
-0.8891342, -0.09130764, -3.400002, 1, 0.9843137, 0, 1,
-0.8863428, 0.9255124, 0.4732323, 1, 0.9882353, 0, 1,
-0.8862999, -1.326997, -3.212432, 1, 0.9960784, 0, 1,
-0.8775281, -0.1671696, -1.407749, 0.9960784, 1, 0, 1,
-0.8727307, -1.168574, -2.929364, 0.9921569, 1, 0, 1,
-0.8720637, -0.5749387, -1.251213, 0.9843137, 1, 0, 1,
-0.868201, 0.01894985, -1.241415, 0.9803922, 1, 0, 1,
-0.8672506, -0.320989, -2.347489, 0.972549, 1, 0, 1,
-0.8667622, 1.693542, -1.426569, 0.9686275, 1, 0, 1,
-0.8646641, 0.6983959, -3.09142, 0.9607843, 1, 0, 1,
-0.8643103, 1.023704, 0.971762, 0.9568627, 1, 0, 1,
-0.8600305, 0.6647885, 0.03689298, 0.9490196, 1, 0, 1,
-0.8575469, -0.001497635, -1.905689, 0.945098, 1, 0, 1,
-0.8470962, -2.12977, -3.248288, 0.9372549, 1, 0, 1,
-0.8419573, -1.528888, -1.083866, 0.9333333, 1, 0, 1,
-0.8418301, -1.822665, -2.014977, 0.9254902, 1, 0, 1,
-0.8380499, 0.3448597, -0.6916497, 0.9215686, 1, 0, 1,
-0.8354208, -0.04522622, -1.004842, 0.9137255, 1, 0, 1,
-0.8229188, 1.274472, 0.2686537, 0.9098039, 1, 0, 1,
-0.8146158, 1.684677, -3.211583, 0.9019608, 1, 0, 1,
-0.8134581, 1.28662, -2.1545, 0.8941177, 1, 0, 1,
-0.8132297, -2.229295, -1.594939, 0.8901961, 1, 0, 1,
-0.8101394, 0.004428484, -1.410457, 0.8823529, 1, 0, 1,
-0.8061608, -2.48338, -2.702775, 0.8784314, 1, 0, 1,
-0.8044866, 0.4181111, 0.2967544, 0.8705882, 1, 0, 1,
-0.802908, -0.8643656, -1.939898, 0.8666667, 1, 0, 1,
-0.8022242, 1.248172, -0.9606123, 0.8588235, 1, 0, 1,
-0.8013057, -0.3128892, -0.2627474, 0.854902, 1, 0, 1,
-0.7836279, -0.9136168, -3.04506, 0.8470588, 1, 0, 1,
-0.7765924, -0.2943837, -1.645777, 0.8431373, 1, 0, 1,
-0.7754467, -1.569861, -1.479178, 0.8352941, 1, 0, 1,
-0.7679564, -0.4832318, -2.368816, 0.8313726, 1, 0, 1,
-0.7616164, 0.07741458, -1.838846, 0.8235294, 1, 0, 1,
-0.7577215, -1.104292, -2.921456, 0.8196079, 1, 0, 1,
-0.7544994, 0.6671177, -0.8359462, 0.8117647, 1, 0, 1,
-0.7543925, 2.058841, -1.402874, 0.8078431, 1, 0, 1,
-0.7540767, 1.3862, -0.5080859, 0.8, 1, 0, 1,
-0.7538655, 0.5523064, -1.935787, 0.7921569, 1, 0, 1,
-0.7521071, 0.06617473, -0.4495476, 0.7882353, 1, 0, 1,
-0.7501308, 0.4958054, -1.764436, 0.7803922, 1, 0, 1,
-0.749521, 0.3140158, -0.159196, 0.7764706, 1, 0, 1,
-0.747815, 0.6800052, -1.057451, 0.7686275, 1, 0, 1,
-0.7430077, -2.186098, -2.573922, 0.7647059, 1, 0, 1,
-0.7395803, -0.2410453, -0.707181, 0.7568628, 1, 0, 1,
-0.7271225, 1.387389, -0.4905888, 0.7529412, 1, 0, 1,
-0.7175959, -0.5541086, -0.8078521, 0.7450981, 1, 0, 1,
-0.7135257, 0.4109339, -0.4262826, 0.7411765, 1, 0, 1,
-0.7083745, 0.04540926, -0.6798201, 0.7333333, 1, 0, 1,
-0.7052428, -0.449228, -2.686986, 0.7294118, 1, 0, 1,
-0.7012699, 1.55938, 0.1895892, 0.7215686, 1, 0, 1,
-0.6943372, 0.08734325, -2.479125, 0.7176471, 1, 0, 1,
-0.6914799, 0.6760397, -2.781305, 0.7098039, 1, 0, 1,
-0.6910092, -2.110547, -3.606702, 0.7058824, 1, 0, 1,
-0.6880875, -1.652851, -3.94483, 0.6980392, 1, 0, 1,
-0.684853, -0.5045, -2.559167, 0.6901961, 1, 0, 1,
-0.6830768, -1.071089, -2.940466, 0.6862745, 1, 0, 1,
-0.6799631, -0.3488496, -2.144939, 0.6784314, 1, 0, 1,
-0.6775799, 0.1924234, -1.298027, 0.6745098, 1, 0, 1,
-0.6767379, -0.2945965, -2.56592, 0.6666667, 1, 0, 1,
-0.6736454, -0.4030976, -3.409958, 0.6627451, 1, 0, 1,
-0.6692558, -0.7274862, -3.014425, 0.654902, 1, 0, 1,
-0.6668734, 1.185481, -0.6102782, 0.6509804, 1, 0, 1,
-0.6664647, 1.867562, -1.128948, 0.6431373, 1, 0, 1,
-0.6603764, -0.7779927, -0.728422, 0.6392157, 1, 0, 1,
-0.6597462, -2.063679, -1.657842, 0.6313726, 1, 0, 1,
-0.6571682, -0.1215196, -2.075581, 0.627451, 1, 0, 1,
-0.656166, 0.2909788, -0.3419167, 0.6196079, 1, 0, 1,
-0.6561398, -1.523091, -3.073634, 0.6156863, 1, 0, 1,
-0.653461, -1.534042, -1.802528, 0.6078432, 1, 0, 1,
-0.6517001, -0.9939261, -1.110262, 0.6039216, 1, 0, 1,
-0.6413469, -2.043, -3.526822, 0.5960785, 1, 0, 1,
-0.64124, 2.588924, -1.006191, 0.5882353, 1, 0, 1,
-0.6390619, -0.8695214, -2.791667, 0.5843138, 1, 0, 1,
-0.6356075, -0.7780108, -3.926455, 0.5764706, 1, 0, 1,
-0.6323821, 0.9522781, 0.1639907, 0.572549, 1, 0, 1,
-0.6306547, 1.080033, -1.552628, 0.5647059, 1, 0, 1,
-0.6254675, -1.030969, -2.825757, 0.5607843, 1, 0, 1,
-0.6247439, -0.4949718, -2.561117, 0.5529412, 1, 0, 1,
-0.6230381, -1.269081, -3.971823, 0.5490196, 1, 0, 1,
-0.6226597, 0.381512, 0.41488, 0.5411765, 1, 0, 1,
-0.6223775, 0.5422489, -0.8751848, 0.5372549, 1, 0, 1,
-0.6204358, 1.642089, -2.448741, 0.5294118, 1, 0, 1,
-0.6190568, 1.100698, -0.536086, 0.5254902, 1, 0, 1,
-0.6076033, -0.3556879, -3.038129, 0.5176471, 1, 0, 1,
-0.6034995, -0.2864438, -1.219169, 0.5137255, 1, 0, 1,
-0.6029353, -0.444254, -2.195337, 0.5058824, 1, 0, 1,
-0.6013968, -0.6323478, -1.47974, 0.5019608, 1, 0, 1,
-0.5990567, -0.002135225, -2.286587, 0.4941176, 1, 0, 1,
-0.597218, -1.263216, -2.521863, 0.4862745, 1, 0, 1,
-0.5949341, -0.1251394, -0.8831723, 0.4823529, 1, 0, 1,
-0.5942339, -0.3061171, -0.9736287, 0.4745098, 1, 0, 1,
-0.5941501, 0.9547298, -0.1005145, 0.4705882, 1, 0, 1,
-0.5936828, 0.635277, -0.2566232, 0.4627451, 1, 0, 1,
-0.5930253, 0.3743367, -2.119708, 0.4588235, 1, 0, 1,
-0.5929723, 0.3805548, -1.008508, 0.4509804, 1, 0, 1,
-0.5924878, -0.8417518, -2.415704, 0.4470588, 1, 0, 1,
-0.5921475, 1.61763, 0.2006612, 0.4392157, 1, 0, 1,
-0.5885213, -1.518845, -3.317173, 0.4352941, 1, 0, 1,
-0.5878369, 0.9645843, -1.239562, 0.427451, 1, 0, 1,
-0.5877933, 0.1828052, -0.4719367, 0.4235294, 1, 0, 1,
-0.5869875, -0.02743595, -1.680752, 0.4156863, 1, 0, 1,
-0.5867967, -1.399553, -3.496043, 0.4117647, 1, 0, 1,
-0.5810547, 1.784263, -1.191069, 0.4039216, 1, 0, 1,
-0.5803035, -0.00343528, -1.312145, 0.3960784, 1, 0, 1,
-0.5791525, 1.327079, -0.1591, 0.3921569, 1, 0, 1,
-0.5771791, -0.2024725, -3.249434, 0.3843137, 1, 0, 1,
-0.5750678, -0.004374221, -0.2906375, 0.3803922, 1, 0, 1,
-0.5749226, -0.7786755, -2.664032, 0.372549, 1, 0, 1,
-0.559027, -0.704131, -2.899351, 0.3686275, 1, 0, 1,
-0.5568862, -0.4423349, -3.899771, 0.3607843, 1, 0, 1,
-0.5565181, -0.3412343, -0.9102128, 0.3568628, 1, 0, 1,
-0.5562192, -0.2455676, -1.863764, 0.3490196, 1, 0, 1,
-0.5559849, 0.03196677, -1.130818, 0.345098, 1, 0, 1,
-0.5507718, -1.658553, -3.202093, 0.3372549, 1, 0, 1,
-0.5420823, -1.391866, -2.115749, 0.3333333, 1, 0, 1,
-0.53665, -2.387218, -4.621245, 0.3254902, 1, 0, 1,
-0.5366368, 1.237814, 1.316984, 0.3215686, 1, 0, 1,
-0.5354016, 1.65999, 0.06014913, 0.3137255, 1, 0, 1,
-0.5342604, -0.1769662, -3.221315, 0.3098039, 1, 0, 1,
-0.5333222, 0.6798201, 0.7306497, 0.3019608, 1, 0, 1,
-0.5330202, -0.4040137, -3.781749, 0.2941177, 1, 0, 1,
-0.5326834, -1.606636, -2.42785, 0.2901961, 1, 0, 1,
-0.5320984, -0.5161859, -2.496833, 0.282353, 1, 0, 1,
-0.530459, -0.8675742, -3.398496, 0.2784314, 1, 0, 1,
-0.5303662, 1.018021, -1.097251, 0.2705882, 1, 0, 1,
-0.5299863, 0.2429707, -1.380308, 0.2666667, 1, 0, 1,
-0.5188224, 2.052709, 0.5977957, 0.2588235, 1, 0, 1,
-0.5089571, 1.404522, -0.5553036, 0.254902, 1, 0, 1,
-0.5050375, 0.4649692, -2.39588, 0.2470588, 1, 0, 1,
-0.502822, -2.652706, -0.8970211, 0.2431373, 1, 0, 1,
-0.5015956, 1.532155, 0.3554406, 0.2352941, 1, 0, 1,
-0.5007623, -0.6349063, -1.367479, 0.2313726, 1, 0, 1,
-0.4992983, -0.02196655, -2.58538, 0.2235294, 1, 0, 1,
-0.4988912, -0.2523893, -2.568786, 0.2196078, 1, 0, 1,
-0.4933186, 0.7019459, 0.6275013, 0.2117647, 1, 0, 1,
-0.491252, -0.06731234, -0.2741656, 0.2078431, 1, 0, 1,
-0.4886148, -0.09676933, -1.726947, 0.2, 1, 0, 1,
-0.4851838, 1.028973, -0.2736166, 0.1921569, 1, 0, 1,
-0.4844199, -0.8423834, -3.141236, 0.1882353, 1, 0, 1,
-0.4843911, -0.2311586, -0.1697381, 0.1803922, 1, 0, 1,
-0.4773235, -0.5995336, 0.1745647, 0.1764706, 1, 0, 1,
-0.4772393, 1.572706, 1.717239, 0.1686275, 1, 0, 1,
-0.4660619, -0.367489, -2.489488, 0.1647059, 1, 0, 1,
-0.4638428, 0.335719, -1.789623, 0.1568628, 1, 0, 1,
-0.4612287, -0.6526147, -1.305945, 0.1529412, 1, 0, 1,
-0.4610953, -1.040396, -2.499378, 0.145098, 1, 0, 1,
-0.4596123, -1.1166, -1.73713, 0.1411765, 1, 0, 1,
-0.458721, -0.3548805, -4.087556, 0.1333333, 1, 0, 1,
-0.4536299, 1.100326, 1.175411, 0.1294118, 1, 0, 1,
-0.4527673, 0.4958322, -1.796196, 0.1215686, 1, 0, 1,
-0.4508161, 0.9930744, -0.9499906, 0.1176471, 1, 0, 1,
-0.44704, -0.08565141, -1.191512, 0.1098039, 1, 0, 1,
-0.4458237, -0.8256693, -3.888048, 0.1058824, 1, 0, 1,
-0.4455559, 0.9322878, -0.3266635, 0.09803922, 1, 0, 1,
-0.4408082, 0.115294, -2.780029, 0.09019608, 1, 0, 1,
-0.4397213, 1.289391, -0.431122, 0.08627451, 1, 0, 1,
-0.4395854, 1.50569, 0.1476671, 0.07843138, 1, 0, 1,
-0.4334354, 1.628119, -0.001865022, 0.07450981, 1, 0, 1,
-0.4308498, -0.7512029, -1.888825, 0.06666667, 1, 0, 1,
-0.4292503, -0.774152, -2.839597, 0.0627451, 1, 0, 1,
-0.4270633, -0.001086293, -2.576869, 0.05490196, 1, 0, 1,
-0.4268099, 0.5347039, -1.365336, 0.05098039, 1, 0, 1,
-0.4202074, 0.4675623, -1.62003, 0.04313726, 1, 0, 1,
-0.4196433, 1.667732, -0.3512492, 0.03921569, 1, 0, 1,
-0.4148324, 1.017963, 0.2067612, 0.03137255, 1, 0, 1,
-0.4112262, 1.673583, -0.09701674, 0.02745098, 1, 0, 1,
-0.4086501, -0.4385175, -2.536108, 0.01960784, 1, 0, 1,
-0.407101, 1.848793, -2.089436, 0.01568628, 1, 0, 1,
-0.4068636, -0.3433942, -1.502333, 0.007843138, 1, 0, 1,
-0.4054387, 1.127736, -0.3856207, 0.003921569, 1, 0, 1,
-0.4012752, 0.6616363, 1.013876, 0, 1, 0.003921569, 1,
-0.4006439, 1.368038, -0.5551988, 0, 1, 0.01176471, 1,
-0.3998308, -0.9617448, -2.868886, 0, 1, 0.01568628, 1,
-0.3938805, -0.411511, -3.338969, 0, 1, 0.02352941, 1,
-0.387149, -1.330498, -2.994919, 0, 1, 0.02745098, 1,
-0.3841923, 0.6029731, -0.4614273, 0, 1, 0.03529412, 1,
-0.3837354, 0.2066009, -0.1102397, 0, 1, 0.03921569, 1,
-0.3827214, 0.8482641, -0.5442737, 0, 1, 0.04705882, 1,
-0.3820733, -1.132517, -0.7788703, 0, 1, 0.05098039, 1,
-0.3792273, 0.246592, -0.6092731, 0, 1, 0.05882353, 1,
-0.3764524, 0.4250378, -1.732733, 0, 1, 0.0627451, 1,
-0.3752596, 0.3769543, -3.043584, 0, 1, 0.07058824, 1,
-0.3744217, 0.1560741, -0.5091116, 0, 1, 0.07450981, 1,
-0.3742129, -0.07481501, -2.260497, 0, 1, 0.08235294, 1,
-0.3611686, -0.1903106, -1.131258, 0, 1, 0.08627451, 1,
-0.359603, -2.280811, -3.09232, 0, 1, 0.09411765, 1,
-0.3583346, 1.773097, 1.639615, 0, 1, 0.1019608, 1,
-0.3536205, -0.3073113, -2.299903, 0, 1, 0.1058824, 1,
-0.3530905, -2.068465, -2.546232, 0, 1, 0.1137255, 1,
-0.3497063, 0.637614, -1.279078, 0, 1, 0.1176471, 1,
-0.3478712, -1.157854, -2.716067, 0, 1, 0.1254902, 1,
-0.347758, -0.1211669, -1.15865, 0, 1, 0.1294118, 1,
-0.3399835, 1.766167, 1.383643, 0, 1, 0.1372549, 1,
-0.3292015, -0.6963297, -1.600433, 0, 1, 0.1411765, 1,
-0.3288633, 0.8314425, 0.5927547, 0, 1, 0.1490196, 1,
-0.3270866, -0.909381, -1.379107, 0, 1, 0.1529412, 1,
-0.3266748, -0.6389085, -3.545588, 0, 1, 0.1607843, 1,
-0.3226734, 0.1275173, -1.29229, 0, 1, 0.1647059, 1,
-0.3219756, -0.6254264, -1.45009, 0, 1, 0.172549, 1,
-0.3203324, -0.2837903, -2.877299, 0, 1, 0.1764706, 1,
-0.3164015, -0.4680352, -3.736521, 0, 1, 0.1843137, 1,
-0.3075246, -1.296327, -3.564957, 0, 1, 0.1882353, 1,
-0.3070083, -0.02230005, -3.347816, 0, 1, 0.1960784, 1,
-0.3054397, -0.3056488, -1.673417, 0, 1, 0.2039216, 1,
-0.3052259, 0.402083, -0.8044536, 0, 1, 0.2078431, 1,
-0.3000979, -1.098407, -1.909151, 0, 1, 0.2156863, 1,
-0.2946226, -0.6326625, -1.42806, 0, 1, 0.2196078, 1,
-0.2945252, 1.333357, -1.491508, 0, 1, 0.227451, 1,
-0.2929841, 0.601935, 0.9754511, 0, 1, 0.2313726, 1,
-0.2921465, -0.6548319, -2.736427, 0, 1, 0.2392157, 1,
-0.2878287, -0.608886, -2.941628, 0, 1, 0.2431373, 1,
-0.2872737, -1.322529, -3.352587, 0, 1, 0.2509804, 1,
-0.2663207, 0.1772149, -0.01819412, 0, 1, 0.254902, 1,
-0.2598148, -0.2171704, -0.6526291, 0, 1, 0.2627451, 1,
-0.2586108, 1.807971, -0.4977512, 0, 1, 0.2666667, 1,
-0.2582374, 1.026164, 0.3408901, 0, 1, 0.2745098, 1,
-0.2575585, 0.4954479, -0.0006053977, 0, 1, 0.2784314, 1,
-0.2518576, 1.091663, 1.115191, 0, 1, 0.2862745, 1,
-0.2490995, 1.752187, 1.52771, 0, 1, 0.2901961, 1,
-0.2468861, 0.116662, -1.146875, 0, 1, 0.2980392, 1,
-0.2462936, 0.1322825, -1.217687, 0, 1, 0.3058824, 1,
-0.2443608, 1.033777, -1.172147, 0, 1, 0.3098039, 1,
-0.2398119, -1.218488, -3.256112, 0, 1, 0.3176471, 1,
-0.2395511, 1.027526, -0.04353333, 0, 1, 0.3215686, 1,
-0.2373501, 0.0785948, -1.018232, 0, 1, 0.3294118, 1,
-0.2371776, -0.5862672, -2.253895, 0, 1, 0.3333333, 1,
-0.2360781, -0.1824236, -0.4354492, 0, 1, 0.3411765, 1,
-0.2347073, -1.919863, -2.924951, 0, 1, 0.345098, 1,
-0.2310589, -1.589141, -3.653422, 0, 1, 0.3529412, 1,
-0.2291098, 0.8855425, 0.4447803, 0, 1, 0.3568628, 1,
-0.2258685, 0.3072157, -0.1058844, 0, 1, 0.3647059, 1,
-0.2247549, 1.009848, -0.1887673, 0, 1, 0.3686275, 1,
-0.2226639, 0.727259, -0.2354534, 0, 1, 0.3764706, 1,
-0.2207177, 0.6802673, 0.2462583, 0, 1, 0.3803922, 1,
-0.2184316, 0.3931838, -0.6977292, 0, 1, 0.3882353, 1,
-0.2181797, -0.4149285, -2.620956, 0, 1, 0.3921569, 1,
-0.2176802, 0.3157532, 1.079542, 0, 1, 0.4, 1,
-0.212789, -0.1389144, -1.997117, 0, 1, 0.4078431, 1,
-0.2110223, -1.935932, -3.448354, 0, 1, 0.4117647, 1,
-0.2088858, -1.242641, -1.423476, 0, 1, 0.4196078, 1,
-0.2067562, -0.2884832, -3.581621, 0, 1, 0.4235294, 1,
-0.2058403, 1.361076, -1.959191, 0, 1, 0.4313726, 1,
-0.205145, 1.342011, -1.946005, 0, 1, 0.4352941, 1,
-0.2028584, 0.07899963, 1.312712, 0, 1, 0.4431373, 1,
-0.2012299, 2.150454, 1.968423, 0, 1, 0.4470588, 1,
-0.2011414, -0.3958661, -2.085384, 0, 1, 0.454902, 1,
-0.198466, -0.9786679, -4.867807, 0, 1, 0.4588235, 1,
-0.1984024, -0.2772867, -2.821064, 0, 1, 0.4666667, 1,
-0.1952094, -2.203931, -5.350724, 0, 1, 0.4705882, 1,
-0.1935325, 0.2199696, -0.6113874, 0, 1, 0.4784314, 1,
-0.193272, 1.642675, -1.253189, 0, 1, 0.4823529, 1,
-0.1882725, 0.6329053, -2.348848, 0, 1, 0.4901961, 1,
-0.1859796, 0.2308308, -0.8587278, 0, 1, 0.4941176, 1,
-0.1848904, 0.9415902, 0.3331127, 0, 1, 0.5019608, 1,
-0.1847214, -0.5651315, -2.94535, 0, 1, 0.509804, 1,
-0.1827089, 0.3323384, 0.6208984, 0, 1, 0.5137255, 1,
-0.1772768, -0.5782508, -2.48525, 0, 1, 0.5215687, 1,
-0.1764079, -1.705745, -2.420633, 0, 1, 0.5254902, 1,
-0.17561, -0.1828809, -2.171225, 0, 1, 0.5333334, 1,
-0.1728853, 2.816795, -0.4741486, 0, 1, 0.5372549, 1,
-0.1710781, -2.040618, -4.945539, 0, 1, 0.5450981, 1,
-0.1537439, -0.9809961, -4.701931, 0, 1, 0.5490196, 1,
-0.1495199, -0.7905011, -1.095368, 0, 1, 0.5568628, 1,
-0.1480569, -0.0956853, -1.721329, 0, 1, 0.5607843, 1,
-0.1459092, -0.5285319, -3.774111, 0, 1, 0.5686275, 1,
-0.1425672, 2.553226, 0.7843609, 0, 1, 0.572549, 1,
-0.1404959, -1.945596, -3.850457, 0, 1, 0.5803922, 1,
-0.1396778, -0.2313504, -3.123784, 0, 1, 0.5843138, 1,
-0.1392814, -0.6133272, -4.240447, 0, 1, 0.5921569, 1,
-0.1378814, 1.016862, -1.328381, 0, 1, 0.5960785, 1,
-0.135696, -0.3951999, -4.162048, 0, 1, 0.6039216, 1,
-0.1316733, -0.7338865, -2.447019, 0, 1, 0.6117647, 1,
-0.1289953, 0.6091542, -1.031585, 0, 1, 0.6156863, 1,
-0.1262771, -0.1119441, -2.365937, 0, 1, 0.6235294, 1,
-0.1244683, -1.061315, -3.181212, 0, 1, 0.627451, 1,
-0.1237205, -0.3148365, -3.414375, 0, 1, 0.6352941, 1,
-0.1159341, -0.7759054, -5.923399, 0, 1, 0.6392157, 1,
-0.1132763, 0.1103915, -1.032648, 0, 1, 0.6470588, 1,
-0.1124556, -1.165248, -5.276354, 0, 1, 0.6509804, 1,
-0.1121972, -0.8091676, -2.206109, 0, 1, 0.6588235, 1,
-0.1086213, 0.1176706, -0.1254268, 0, 1, 0.6627451, 1,
-0.1077147, 0.0050812, -2.217688, 0, 1, 0.6705883, 1,
-0.1069287, -1.747829, -3.206011, 0, 1, 0.6745098, 1,
-0.1057273, 0.6876511, -0.06837077, 0, 1, 0.682353, 1,
-0.1051132, -0.2578942, -4.194654, 0, 1, 0.6862745, 1,
-0.1046496, 0.7862655, -0.2225488, 0, 1, 0.6941177, 1,
-0.1045087, 0.185941, 0.4299215, 0, 1, 0.7019608, 1,
-0.1043615, 1.175105, 0.4248713, 0, 1, 0.7058824, 1,
-0.103967, -0.1784884, -4.192276, 0, 1, 0.7137255, 1,
-0.103691, 1.208855, 0.1866427, 0, 1, 0.7176471, 1,
-0.09528425, -0.4221172, -2.745628, 0, 1, 0.7254902, 1,
-0.09304083, 0.2640136, 0.9895133, 0, 1, 0.7294118, 1,
-0.09270035, -1.00585, -3.768365, 0, 1, 0.7372549, 1,
-0.09236332, -0.7695185, -3.387448, 0, 1, 0.7411765, 1,
-0.09029649, -1.101044, -2.825461, 0, 1, 0.7490196, 1,
-0.08929738, 0.4431629, -1.449334, 0, 1, 0.7529412, 1,
-0.08794205, -1.119843, -1.472872, 0, 1, 0.7607843, 1,
-0.08772486, 1.542736, 0.2316532, 0, 1, 0.7647059, 1,
-0.08765008, 0.3996813, -1.540915, 0, 1, 0.772549, 1,
-0.08708213, -1.16469, -3.885159, 0, 1, 0.7764706, 1,
-0.07956982, 0.299116, -0.02672467, 0, 1, 0.7843137, 1,
-0.07925843, -0.4529759, -5.387406, 0, 1, 0.7882353, 1,
-0.07698065, -2.521267, -2.908547, 0, 1, 0.7960784, 1,
-0.07611471, 0.6012449, -1.180126, 0, 1, 0.8039216, 1,
-0.07564878, 0.3871524, -0.3778779, 0, 1, 0.8078431, 1,
-0.07422692, 0.5169743, -2.327315, 0, 1, 0.8156863, 1,
-0.06144713, 0.4577092, 0.04002734, 0, 1, 0.8196079, 1,
-0.05704756, -0.2740258, -4.663114, 0, 1, 0.827451, 1,
-0.05594793, 1.313344, 0.1114516, 0, 1, 0.8313726, 1,
-0.05506619, -0.2586972, -3.346349, 0, 1, 0.8392157, 1,
-0.05333203, 0.7449151, -0.5291085, 0, 1, 0.8431373, 1,
-0.05022426, -0.5181262, -3.076022, 0, 1, 0.8509804, 1,
-0.04998926, -0.2577515, 0.07157648, 0, 1, 0.854902, 1,
-0.04779001, -0.6073345, -2.042356, 0, 1, 0.8627451, 1,
-0.04666199, -1.030493, -3.05018, 0, 1, 0.8666667, 1,
-0.04623364, 0.7060348, -2.907222, 0, 1, 0.8745098, 1,
-0.04397899, 1.520025, -0.1095125, 0, 1, 0.8784314, 1,
-0.04294846, -0.09764159, -2.418162, 0, 1, 0.8862745, 1,
-0.0418978, -0.3413574, -2.469971, 0, 1, 0.8901961, 1,
-0.04005869, -1.748864, -4.052879, 0, 1, 0.8980392, 1,
-0.03908461, -0.7241142, -4.584527, 0, 1, 0.9058824, 1,
-0.03706524, -0.5884513, -5.819758, 0, 1, 0.9098039, 1,
-0.02859452, 0.01398955, 0.05843703, 0, 1, 0.9176471, 1,
-0.02736064, -0.4455975, -2.028856, 0, 1, 0.9215686, 1,
-0.02701642, 0.9395068, -1.446047, 0, 1, 0.9294118, 1,
-0.0241425, -0.2521309, -4.622394, 0, 1, 0.9333333, 1,
-0.02251446, -1.691239, -4.472263, 0, 1, 0.9411765, 1,
-0.02153305, -0.4756697, -2.923893, 0, 1, 0.945098, 1,
-0.02090538, 0.3402923, 0.1134809, 0, 1, 0.9529412, 1,
-0.01886474, 0.9439911, 0.2909284, 0, 1, 0.9568627, 1,
-0.01530711, 0.8783786, 1.235103, 0, 1, 0.9647059, 1,
-0.01325105, 0.2308799, -0.06037736, 0, 1, 0.9686275, 1,
-0.01237873, -2.604401, -4.883765, 0, 1, 0.9764706, 1,
-0.009598964, 1.347229, -0.6267027, 0, 1, 0.9803922, 1,
-0.009447091, -0.477947, -3.945178, 0, 1, 0.9882353, 1,
-0.0041924, -0.031112, -3.0512, 0, 1, 0.9921569, 1,
-0.003685895, 0.4764845, -1.929834, 0, 1, 1, 1,
-0.003104934, 0.408313, 0.4350658, 0, 0.9921569, 1, 1,
-0.002869561, -1.617953, -3.372026, 0, 0.9882353, 1, 1,
-0.002264561, -0.2526782, -2.585384, 0, 0.9803922, 1, 1,
0.0008580599, 1.035962, -0.1794575, 0, 0.9764706, 1, 1,
0.003753595, 0.1193282, 0.2751729, 0, 0.9686275, 1, 1,
0.004484508, 0.8044985, 1.526066, 0, 0.9647059, 1, 1,
0.007716939, -0.7947736, 2.964333, 0, 0.9568627, 1, 1,
0.01227482, -1.198534, 3.577258, 0, 0.9529412, 1, 1,
0.01364297, -0.2966929, 3.987529, 0, 0.945098, 1, 1,
0.01423409, 0.2362583, -0.4522466, 0, 0.9411765, 1, 1,
0.01654716, -1.485569, 1.925417, 0, 0.9333333, 1, 1,
0.01669894, 0.02280875, 1.079738, 0, 0.9294118, 1, 1,
0.02197143, 0.740213, 0.7926228, 0, 0.9215686, 1, 1,
0.02222267, 0.4359927, 0.339315, 0, 0.9176471, 1, 1,
0.0266372, -0.7488634, 3.428207, 0, 0.9098039, 1, 1,
0.03907875, -0.007448596, 1.72391, 0, 0.9058824, 1, 1,
0.0399057, -0.05097821, 1.554457, 0, 0.8980392, 1, 1,
0.04156342, 0.3407842, 0.2496097, 0, 0.8901961, 1, 1,
0.04272716, 0.469581, -1.732889, 0, 0.8862745, 1, 1,
0.04347289, -0.5278398, 1.475472, 0, 0.8784314, 1, 1,
0.04455692, -0.8909469, 2.101608, 0, 0.8745098, 1, 1,
0.05360752, 1.51874, -0.9312133, 0, 0.8666667, 1, 1,
0.05639715, -0.7449598, 2.253135, 0, 0.8627451, 1, 1,
0.05802189, 0.3115952, 0.6510789, 0, 0.854902, 1, 1,
0.06051718, -0.03431904, -0.08643702, 0, 0.8509804, 1, 1,
0.0640385, -0.729633, 3.297765, 0, 0.8431373, 1, 1,
0.06637451, 1.116964, 1.088856, 0, 0.8392157, 1, 1,
0.06804848, 0.6595318, 0.4518833, 0, 0.8313726, 1, 1,
0.07084227, 1.25456, 0.9319412, 0, 0.827451, 1, 1,
0.08085813, -0.6603993, 3.349638, 0, 0.8196079, 1, 1,
0.08143719, -0.05896853, 0.6048735, 0, 0.8156863, 1, 1,
0.08249747, 1.776553, 0.797971, 0, 0.8078431, 1, 1,
0.08923237, -0.9940057, 4.434673, 0, 0.8039216, 1, 1,
0.0923557, 0.1232507, 2.111948, 0, 0.7960784, 1, 1,
0.09333485, 2.632126, -0.6786577, 0, 0.7882353, 1, 1,
0.0952921, 0.2374662, -0.07021966, 0, 0.7843137, 1, 1,
0.0965987, -0.2367412, 4.69315, 0, 0.7764706, 1, 1,
0.09777158, -0.03034617, 0.4426539, 0, 0.772549, 1, 1,
0.09778611, -0.9147463, 3.584398, 0, 0.7647059, 1, 1,
0.09862462, 0.08210522, -1.170702, 0, 0.7607843, 1, 1,
0.1017717, -0.01993791, 0.1674366, 0, 0.7529412, 1, 1,
0.1130434, 1.858963, -0.672713, 0, 0.7490196, 1, 1,
0.1226151, -2.784008, 2.96906, 0, 0.7411765, 1, 1,
0.1235045, -0.1911921, 3.334478, 0, 0.7372549, 1, 1,
0.1272815, -0.09734428, 0.5022942, 0, 0.7294118, 1, 1,
0.1276314, -0.3304092, 2.797175, 0, 0.7254902, 1, 1,
0.1291171, 0.2775991, 0.2626871, 0, 0.7176471, 1, 1,
0.1310174, -0.5229235, 3.958282, 0, 0.7137255, 1, 1,
0.1362929, -0.4209699, 4.224785, 0, 0.7058824, 1, 1,
0.1371756, 0.1980975, 1.126829, 0, 0.6980392, 1, 1,
0.139956, -0.671061, 3.127971, 0, 0.6941177, 1, 1,
0.1412629, -0.2775466, 2.535442, 0, 0.6862745, 1, 1,
0.14303, 0.2908958, -0.3964043, 0, 0.682353, 1, 1,
0.1455609, -0.640925, 4.348433, 0, 0.6745098, 1, 1,
0.1562719, -0.2981489, 3.953312, 0, 0.6705883, 1, 1,
0.1563403, -0.4116895, 2.774749, 0, 0.6627451, 1, 1,
0.1576652, 0.741616, -2.618088, 0, 0.6588235, 1, 1,
0.1579629, -2.581126, 2.400249, 0, 0.6509804, 1, 1,
0.1593172, -0.9287041, 3.530662, 0, 0.6470588, 1, 1,
0.1620457, 1.861084, 0.8977404, 0, 0.6392157, 1, 1,
0.1635215, -0.412336, 2.506537, 0, 0.6352941, 1, 1,
0.1682878, 2.157977, -0.08172541, 0, 0.627451, 1, 1,
0.1684862, -0.5561376, 1.400174, 0, 0.6235294, 1, 1,
0.1691819, -1.85686, 2.244484, 0, 0.6156863, 1, 1,
0.170673, 0.9812511, 1.004387, 0, 0.6117647, 1, 1,
0.175909, 0.6150991, 1.041238, 0, 0.6039216, 1, 1,
0.179606, 0.05636362, 2.845143, 0, 0.5960785, 1, 1,
0.1851725, 0.1076257, 0.02118245, 0, 0.5921569, 1, 1,
0.1887483, -0.1529417, 1.526912, 0, 0.5843138, 1, 1,
0.1887873, 0.5997673, 0.14891, 0, 0.5803922, 1, 1,
0.1893999, -0.7610919, 2.848173, 0, 0.572549, 1, 1,
0.1908482, -0.3318525, 2.787108, 0, 0.5686275, 1, 1,
0.1916732, -0.1522478, 2.523119, 0, 0.5607843, 1, 1,
0.1939625, -0.7251166, 2.85516, 0, 0.5568628, 1, 1,
0.1997312, -0.304644, 1.762628, 0, 0.5490196, 1, 1,
0.1997496, 2.366843, -0.1136106, 0, 0.5450981, 1, 1,
0.2049966, 0.77903, -0.9645734, 0, 0.5372549, 1, 1,
0.2053802, 0.8425666, -1.289746, 0, 0.5333334, 1, 1,
0.2124529, 1.847104, -1.56243, 0, 0.5254902, 1, 1,
0.2140631, -1.610242, 3.205434, 0, 0.5215687, 1, 1,
0.2162118, 1.94428, -0.0418671, 0, 0.5137255, 1, 1,
0.2198346, 0.1125987, 0.7511816, 0, 0.509804, 1, 1,
0.2267139, -0.5930286, 2.362755, 0, 0.5019608, 1, 1,
0.2281566, 1.517791, 2.135442, 0, 0.4941176, 1, 1,
0.2363833, 0.4736833, -0.3592359, 0, 0.4901961, 1, 1,
0.236468, -0.6940062, 1.800692, 0, 0.4823529, 1, 1,
0.2369743, 1.116382, 0.08875829, 0, 0.4784314, 1, 1,
0.2378644, -0.5669343, 3.420044, 0, 0.4705882, 1, 1,
0.2387182, -0.1478834, 1.369151, 0, 0.4666667, 1, 1,
0.2413418, 0.1475516, 0.829527, 0, 0.4588235, 1, 1,
0.2418392, -0.2993853, 3.319171, 0, 0.454902, 1, 1,
0.2420294, -0.6870544, 3.506177, 0, 0.4470588, 1, 1,
0.2423083, 0.9818406, -0.4385351, 0, 0.4431373, 1, 1,
0.2423454, -0.8576904, 1.967869, 0, 0.4352941, 1, 1,
0.2425595, 0.4383388, 0.1147773, 0, 0.4313726, 1, 1,
0.2428746, -0.2345103, 1.374937, 0, 0.4235294, 1, 1,
0.2439068, -0.9628391, 3.080348, 0, 0.4196078, 1, 1,
0.2440571, -0.8350992, 1.328137, 0, 0.4117647, 1, 1,
0.2467794, -0.8581021, 1.498757, 0, 0.4078431, 1, 1,
0.2525584, -2.119226, 2.562629, 0, 0.4, 1, 1,
0.2551065, -1.731806, 1.735077, 0, 0.3921569, 1, 1,
0.2552436, 0.4679701, 0.8463731, 0, 0.3882353, 1, 1,
0.2651456, -0.2314226, 2.410462, 0, 0.3803922, 1, 1,
0.2654077, -0.2124915, 2.322439, 0, 0.3764706, 1, 1,
0.2680942, -0.8643426, 3.636746, 0, 0.3686275, 1, 1,
0.2703545, 0.472771, 0.4718272, 0, 0.3647059, 1, 1,
0.2738191, -0.3137118, 2.753772, 0, 0.3568628, 1, 1,
0.2752278, 0.1234099, 1.083182, 0, 0.3529412, 1, 1,
0.2753543, -0.3994765, 2.431802, 0, 0.345098, 1, 1,
0.2764827, -1.067267, 4.974814, 0, 0.3411765, 1, 1,
0.2849747, -0.1576097, 0.8548086, 0, 0.3333333, 1, 1,
0.290379, 0.4512006, 2.083913, 0, 0.3294118, 1, 1,
0.2917526, -0.3848415, 3.141959, 0, 0.3215686, 1, 1,
0.2929824, 0.2273556, 0.5529739, 0, 0.3176471, 1, 1,
0.305771, 0.6026254, 0.4030008, 0, 0.3098039, 1, 1,
0.3102154, -0.2858204, 3.57974, 0, 0.3058824, 1, 1,
0.3112595, 0.6310245, 1.481649, 0, 0.2980392, 1, 1,
0.3121649, 0.7426076, 1.505469, 0, 0.2901961, 1, 1,
0.3154591, -1.346315, 2.712259, 0, 0.2862745, 1, 1,
0.3171783, -1.25627, 2.555131, 0, 0.2784314, 1, 1,
0.3194473, 0.6676817, -0.320038, 0, 0.2745098, 1, 1,
0.3216549, 2.132427, -0.9924641, 0, 0.2666667, 1, 1,
0.3220724, -0.8442068, 2.737641, 0, 0.2627451, 1, 1,
0.323012, -1.963416, 2.643081, 0, 0.254902, 1, 1,
0.3362838, 0.6935486, -0.1000735, 0, 0.2509804, 1, 1,
0.3384404, -1.269038, 2.3302, 0, 0.2431373, 1, 1,
0.3426724, -1.861682, 3.943937, 0, 0.2392157, 1, 1,
0.3458612, 0.241642, 1.7204, 0, 0.2313726, 1, 1,
0.3464354, -1.065462, 3.567747, 0, 0.227451, 1, 1,
0.3469247, 0.3990766, 0.4496787, 0, 0.2196078, 1, 1,
0.3491492, 0.5614183, -0.4907905, 0, 0.2156863, 1, 1,
0.3492785, -1.530865, 3.095906, 0, 0.2078431, 1, 1,
0.3512797, -0.4629268, 3.003236, 0, 0.2039216, 1, 1,
0.3519674, -1.379243, 2.159511, 0, 0.1960784, 1, 1,
0.3557881, -0.1714592, 3.287026, 0, 0.1882353, 1, 1,
0.3575248, -0.8569324, 2.265758, 0, 0.1843137, 1, 1,
0.3606068, 1.114005, -0.04681329, 0, 0.1764706, 1, 1,
0.3614018, 0.1000158, 1.532544, 0, 0.172549, 1, 1,
0.3630505, 0.6832788, 1.800927, 0, 0.1647059, 1, 1,
0.3630841, 0.01799236, 1.2737, 0, 0.1607843, 1, 1,
0.3677039, -0.5446138, 1.480023, 0, 0.1529412, 1, 1,
0.3703599, -0.02624001, 1.284888, 0, 0.1490196, 1, 1,
0.3707542, -1.210926, 3.683016, 0, 0.1411765, 1, 1,
0.3742536, -1.317686, 2.139544, 0, 0.1372549, 1, 1,
0.3768601, 1.516458, 0.6542801, 0, 0.1294118, 1, 1,
0.3803556, -1.100618, 1.961274, 0, 0.1254902, 1, 1,
0.3804276, -1.912516, 2.668846, 0, 0.1176471, 1, 1,
0.3835752, -0.4539337, 3.370926, 0, 0.1137255, 1, 1,
0.3885013, -1.276074, 2.692647, 0, 0.1058824, 1, 1,
0.3889089, 2.024039, -0.8687814, 0, 0.09803922, 1, 1,
0.3998235, -0.7902779, 2.671478, 0, 0.09411765, 1, 1,
0.4001765, 0.5505124, 2.915934, 0, 0.08627451, 1, 1,
0.4015264, -0.4284968, 1.786471, 0, 0.08235294, 1, 1,
0.4052067, -0.1956519, 2.704239, 0, 0.07450981, 1, 1,
0.4093212, -0.262973, 3.922024, 0, 0.07058824, 1, 1,
0.4176667, 0.6883914, 1.32424, 0, 0.0627451, 1, 1,
0.4180138, -1.686891, 4.395012, 0, 0.05882353, 1, 1,
0.4186611, -0.3749044, 1.262773, 0, 0.05098039, 1, 1,
0.4188611, -0.4008476, 1.292027, 0, 0.04705882, 1, 1,
0.4195626, 1.152847, 1.646588, 0, 0.03921569, 1, 1,
0.4232298, -1.744792, 3.284471, 0, 0.03529412, 1, 1,
0.4265117, -0.5438284, 2.367831, 0, 0.02745098, 1, 1,
0.4281664, -0.4192459, 2.081644, 0, 0.02352941, 1, 1,
0.4282299, 0.1709321, -1.020486, 0, 0.01568628, 1, 1,
0.4398112, -0.635507, 2.373731, 0, 0.01176471, 1, 1,
0.4433069, -0.9291218, 2.207973, 0, 0.003921569, 1, 1,
0.443417, 1.250605, 1.201336, 0.003921569, 0, 1, 1,
0.4461211, 0.481569, 0.6533031, 0.007843138, 0, 1, 1,
0.4504626, -0.1018147, 0.9306832, 0.01568628, 0, 1, 1,
0.4515062, 1.004911, 0.3110868, 0.01960784, 0, 1, 1,
0.4536327, 1.103579, -0.642662, 0.02745098, 0, 1, 1,
0.4575138, 0.2886554, 0.9620376, 0.03137255, 0, 1, 1,
0.4575912, -1.750632, 2.223888, 0.03921569, 0, 1, 1,
0.4602031, -0.7363828, -0.1803235, 0.04313726, 0, 1, 1,
0.4647788, -0.05354105, 1.092326, 0.05098039, 0, 1, 1,
0.4663883, 0.2343664, 1.427144, 0.05490196, 0, 1, 1,
0.4758458, 0.8235077, 0.09719374, 0.0627451, 0, 1, 1,
0.4765738, -0.5907121, 1.760877, 0.06666667, 0, 1, 1,
0.4802091, 0.4531655, 0.8269656, 0.07450981, 0, 1, 1,
0.4825778, 1.078176, -0.9134139, 0.07843138, 0, 1, 1,
0.487538, -0.0730906, 1.775813, 0.08627451, 0, 1, 1,
0.4883261, -0.8322079, 2.654762, 0.09019608, 0, 1, 1,
0.4933185, 0.02307036, 0.8806498, 0.09803922, 0, 1, 1,
0.5014269, -0.6660403, 2.622314, 0.1058824, 0, 1, 1,
0.5015852, 0.6821833, 0.8865282, 0.1098039, 0, 1, 1,
0.5025016, -0.06025783, 1.372803, 0.1176471, 0, 1, 1,
0.5059885, -0.1918354, 0.5087615, 0.1215686, 0, 1, 1,
0.5128521, 0.0179521, 1.60488, 0.1294118, 0, 1, 1,
0.5148946, -1.769679, 4.496034, 0.1333333, 0, 1, 1,
0.5235859, -0.1472602, 2.446763, 0.1411765, 0, 1, 1,
0.5330496, -2.090821, 3.076863, 0.145098, 0, 1, 1,
0.534174, 0.7434942, 1.084354, 0.1529412, 0, 1, 1,
0.5373967, 1.027908, 1.032109, 0.1568628, 0, 1, 1,
0.5377834, 0.7757767, -0.5489007, 0.1647059, 0, 1, 1,
0.5430207, 0.2692704, -0.0252709, 0.1686275, 0, 1, 1,
0.5431168, 0.4795049, 0.1782349, 0.1764706, 0, 1, 1,
0.5442396, -1.643383, 2.380789, 0.1803922, 0, 1, 1,
0.545659, 0.3848314, -0.6158051, 0.1882353, 0, 1, 1,
0.5467433, -0.3979238, 2.947638, 0.1921569, 0, 1, 1,
0.5506731, 0.01596972, 1.490807, 0.2, 0, 1, 1,
0.5557565, 0.9086054, 1.131734, 0.2078431, 0, 1, 1,
0.5567172, -2.314015, 4.246674, 0.2117647, 0, 1, 1,
0.5583189, -0.6024383, 2.102198, 0.2196078, 0, 1, 1,
0.5610511, 1.038741, -0.0916607, 0.2235294, 0, 1, 1,
0.5714766, -0.2459066, 3.266639, 0.2313726, 0, 1, 1,
0.5741707, 0.581092, -2.168298, 0.2352941, 0, 1, 1,
0.5766543, 0.04247153, 0.06274915, 0.2431373, 0, 1, 1,
0.5777697, 0.881072, 0.2085993, 0.2470588, 0, 1, 1,
0.5968695, -0.5988526, 1.622124, 0.254902, 0, 1, 1,
0.6045413, -0.7540907, 1.462987, 0.2588235, 0, 1, 1,
0.6060717, 0.1780351, 0.6161647, 0.2666667, 0, 1, 1,
0.60614, -0.8691083, 2.575289, 0.2705882, 0, 1, 1,
0.6067775, -0.3756975, 0.94164, 0.2784314, 0, 1, 1,
0.6104327, 1.505537, 0.7263072, 0.282353, 0, 1, 1,
0.6181034, 1.239512, 0.04246496, 0.2901961, 0, 1, 1,
0.6208568, 0.7586386, -0.5020867, 0.2941177, 0, 1, 1,
0.6226572, -0.09331226, 2.757359, 0.3019608, 0, 1, 1,
0.6244498, 0.1661109, 0.7095267, 0.3098039, 0, 1, 1,
0.6253377, -0.5404546, 0.6767954, 0.3137255, 0, 1, 1,
0.630214, 0.7005556, 0.6478524, 0.3215686, 0, 1, 1,
0.6350954, 0.9432128, -0.1321337, 0.3254902, 0, 1, 1,
0.6369752, -0.3493778, 1.932999, 0.3333333, 0, 1, 1,
0.6425809, 0.7373882, -0.5523887, 0.3372549, 0, 1, 1,
0.6453758, -0.3792453, 2.375433, 0.345098, 0, 1, 1,
0.6480575, -1.568485, 3.257256, 0.3490196, 0, 1, 1,
0.6494616, 1.824316, 2.016623, 0.3568628, 0, 1, 1,
0.6532055, 0.3467103, -0.0575826, 0.3607843, 0, 1, 1,
0.6559311, 0.7898903, 1.913615, 0.3686275, 0, 1, 1,
0.6601924, -0.3564342, 1.354583, 0.372549, 0, 1, 1,
0.6615691, -0.1997449, 1.816091, 0.3803922, 0, 1, 1,
0.6618073, 0.2738628, 2.705305, 0.3843137, 0, 1, 1,
0.6620743, 0.1909703, 2.297071, 0.3921569, 0, 1, 1,
0.6622704, -0.573549, 1.275577, 0.3960784, 0, 1, 1,
0.6632605, 0.3368851, 0.9260783, 0.4039216, 0, 1, 1,
0.6676219, 0.6886443, 0.7786212, 0.4117647, 0, 1, 1,
0.6693999, -0.4270009, 1.049794, 0.4156863, 0, 1, 1,
0.6741784, -1.052624, 3.285539, 0.4235294, 0, 1, 1,
0.681359, -0.06647992, -0.2230528, 0.427451, 0, 1, 1,
0.682342, 0.1231105, 1.536656, 0.4352941, 0, 1, 1,
0.6846292, -0.5980563, 3.435363, 0.4392157, 0, 1, 1,
0.6853832, 0.3888395, 1.15084, 0.4470588, 0, 1, 1,
0.6903276, -0.9127668, 4.206369, 0.4509804, 0, 1, 1,
0.6911634, -1.121409, 4.325331, 0.4588235, 0, 1, 1,
0.6922153, 2.427867, 0.5307927, 0.4627451, 0, 1, 1,
0.6929496, 0.8934047, 0.6287168, 0.4705882, 0, 1, 1,
0.6930505, -1.53697, 2.620072, 0.4745098, 0, 1, 1,
0.6948472, 2.052217, 0.9319177, 0.4823529, 0, 1, 1,
0.7000323, -0.9847701, 0.915531, 0.4862745, 0, 1, 1,
0.7040783, -0.3284492, 1.230191, 0.4941176, 0, 1, 1,
0.7041987, 0.8160016, 2.116701, 0.5019608, 0, 1, 1,
0.7070807, -0.02119321, 3.23874, 0.5058824, 0, 1, 1,
0.7096452, 0.3038964, 1.293745, 0.5137255, 0, 1, 1,
0.7126946, 0.1449435, 2.905575, 0.5176471, 0, 1, 1,
0.7127205, 0.7064028, 1.65895, 0.5254902, 0, 1, 1,
0.7142019, 0.8873914, 1.00657, 0.5294118, 0, 1, 1,
0.7148278, -0.00851441, 1.476467, 0.5372549, 0, 1, 1,
0.7150655, -1.365222, 1.986938, 0.5411765, 0, 1, 1,
0.7212144, 0.1604833, 0.8520629, 0.5490196, 0, 1, 1,
0.7216798, 0.2614982, 0.1144857, 0.5529412, 0, 1, 1,
0.7248087, -1.113119, 2.45046, 0.5607843, 0, 1, 1,
0.7291106, -1.029304, 1.681497, 0.5647059, 0, 1, 1,
0.7360704, -0.9958315, 1.877491, 0.572549, 0, 1, 1,
0.7362181, 0.2924866, 0.3644504, 0.5764706, 0, 1, 1,
0.7397528, -0.4833784, 3.133763, 0.5843138, 0, 1, 1,
0.7406496, -1.361481, 2.955704, 0.5882353, 0, 1, 1,
0.7425252, -1.132396, 1.791356, 0.5960785, 0, 1, 1,
0.7475436, -0.1459156, 2.069457, 0.6039216, 0, 1, 1,
0.7586524, -2.347556, 1.7905, 0.6078432, 0, 1, 1,
0.7601283, 0.681735, -0.1977073, 0.6156863, 0, 1, 1,
0.762714, 0.3760075, 0.793104, 0.6196079, 0, 1, 1,
0.7646379, 0.7741678, 0.784069, 0.627451, 0, 1, 1,
0.7658316, 0.06601889, 2.522488, 0.6313726, 0, 1, 1,
0.7669911, -1.305645, 2.41457, 0.6392157, 0, 1, 1,
0.7674439, -1.213148, 2.246922, 0.6431373, 0, 1, 1,
0.7704802, -1.130761, 1.128189, 0.6509804, 0, 1, 1,
0.7758183, -0.6539606, 3.285775, 0.654902, 0, 1, 1,
0.778824, -1.79573, 1.177408, 0.6627451, 0, 1, 1,
0.7803691, -0.5547196, 2.132163, 0.6666667, 0, 1, 1,
0.7886783, -1.508209, 4.234634, 0.6745098, 0, 1, 1,
0.7909625, -1.179707, 3.578177, 0.6784314, 0, 1, 1,
0.7956045, -0.2830057, 1.330863, 0.6862745, 0, 1, 1,
0.7970358, -0.19886, 1.481376, 0.6901961, 0, 1, 1,
0.7978435, 1.203453, 0.3092808, 0.6980392, 0, 1, 1,
0.7985152, -0.5095851, 2.163686, 0.7058824, 0, 1, 1,
0.7989323, 0.1096909, -0.0220453, 0.7098039, 0, 1, 1,
0.8091489, 0.04266306, 1.206539, 0.7176471, 0, 1, 1,
0.8219042, -0.9759704, 3.178035, 0.7215686, 0, 1, 1,
0.8273743, -0.006414083, 2.255265, 0.7294118, 0, 1, 1,
0.8293761, 0.1368061, 1.200405, 0.7333333, 0, 1, 1,
0.8303464, -1.132405, 1.364961, 0.7411765, 0, 1, 1,
0.8303878, -0.5991912, 3.290195, 0.7450981, 0, 1, 1,
0.8337502, 0.2057042, 0.4082758, 0.7529412, 0, 1, 1,
0.836539, 1.926859, 2.135096, 0.7568628, 0, 1, 1,
0.8383846, -0.3628, 1.49837, 0.7647059, 0, 1, 1,
0.8395448, -0.7275878, 3.73178, 0.7686275, 0, 1, 1,
0.8398973, -1.317647, 2.378223, 0.7764706, 0, 1, 1,
0.8417854, 0.309921, 1.572869, 0.7803922, 0, 1, 1,
0.8436674, 0.8356245, 0.7382691, 0.7882353, 0, 1, 1,
0.8438734, 1.813165, 0.1277891, 0.7921569, 0, 1, 1,
0.8510702, 0.7300353, 1.360663, 0.8, 0, 1, 1,
0.8577273, -1.639315, 2.628043, 0.8078431, 0, 1, 1,
0.8578804, 0.07796293, 3.094249, 0.8117647, 0, 1, 1,
0.8585315, 0.05129293, 2.501456, 0.8196079, 0, 1, 1,
0.8663766, -1.988054, 2.527982, 0.8235294, 0, 1, 1,
0.8680574, 1.27455, -1.176429, 0.8313726, 0, 1, 1,
0.8765958, -0.004942006, 2.012842, 0.8352941, 0, 1, 1,
0.8838301, -0.4783786, 1.701188, 0.8431373, 0, 1, 1,
0.8870109, 0.5802118, -0.6859776, 0.8470588, 0, 1, 1,
0.8886604, 0.1521248, 2.456212, 0.854902, 0, 1, 1,
0.8919883, 0.7184727, 0.8889922, 0.8588235, 0, 1, 1,
0.8928877, -0.4851685, 3.097123, 0.8666667, 0, 1, 1,
0.8949736, 0.2694974, 0.4960281, 0.8705882, 0, 1, 1,
0.8984769, -0.3229716, 2.458744, 0.8784314, 0, 1, 1,
0.9013111, 2.437073, -0.9931811, 0.8823529, 0, 1, 1,
0.9054479, -0.7104338, 0.2378458, 0.8901961, 0, 1, 1,
0.9064088, 0.3242633, 1.157663, 0.8941177, 0, 1, 1,
0.9068009, -0.6235625, 0.4674535, 0.9019608, 0, 1, 1,
0.9125774, 1.084716, 1.419337, 0.9098039, 0, 1, 1,
0.9168326, 0.1249748, 0.9037244, 0.9137255, 0, 1, 1,
0.9245285, 1.483157, -0.3208437, 0.9215686, 0, 1, 1,
0.9270855, -0.6158794, 2.588754, 0.9254902, 0, 1, 1,
0.9275885, 0.8643963, 2.187855, 0.9333333, 0, 1, 1,
0.9375082, -1.447242, 3.100761, 0.9372549, 0, 1, 1,
0.9493181, -0.5401085, 0.9711784, 0.945098, 0, 1, 1,
0.9531261, 0.001286353, 2.170428, 0.9490196, 0, 1, 1,
0.9557034, 0.9296283, 0.2364663, 0.9568627, 0, 1, 1,
0.9603586, -0.1561139, 1.472722, 0.9607843, 0, 1, 1,
0.9611639, 0.6162665, -0.7549731, 0.9686275, 0, 1, 1,
0.9621414, 0.5833654, -1.332579, 0.972549, 0, 1, 1,
0.9634579, 0.01580616, 0.3720622, 0.9803922, 0, 1, 1,
0.9706543, -1.052674, 1.401305, 0.9843137, 0, 1, 1,
0.9899735, 1.542078, -0.01755959, 0.9921569, 0, 1, 1,
0.9902898, 1.724244, 1.038047, 0.9960784, 0, 1, 1,
0.9915023, -0.8293102, 2.949432, 1, 0, 0.9960784, 1,
0.9920363, 0.1972255, 1.326884, 1, 0, 0.9882353, 1,
0.9923792, 0.1186647, 0.7876204, 1, 0, 0.9843137, 1,
0.9925849, 1.369695, 1.835056, 1, 0, 0.9764706, 1,
0.9933106, -0.5394477, 2.718847, 1, 0, 0.972549, 1,
0.9937957, 1.275467, -0.5110296, 1, 0, 0.9647059, 1,
0.9996124, 1.012048, 0.9374635, 1, 0, 0.9607843, 1,
1.003584, -0.4485987, 2.99563, 1, 0, 0.9529412, 1,
1.004689, -0.4845401, 0.5684595, 1, 0, 0.9490196, 1,
1.00551, 0.1217078, -0.5918654, 1, 0, 0.9411765, 1,
1.005559, -0.4303171, 1.834783, 1, 0, 0.9372549, 1,
1.005664, -1.236677, 3.879988, 1, 0, 0.9294118, 1,
1.012148, -0.7618356, 2.511623, 1, 0, 0.9254902, 1,
1.02523, 0.4735621, -1.361585, 1, 0, 0.9176471, 1,
1.025861, 0.6704687, 2.489487, 1, 0, 0.9137255, 1,
1.035793, -1.786869, 0.4301703, 1, 0, 0.9058824, 1,
1.03681, -0.1031797, 1.728676, 1, 0, 0.9019608, 1,
1.041381, -0.303541, 1.451594, 1, 0, 0.8941177, 1,
1.048386, -0.06979852, 1.091599, 1, 0, 0.8862745, 1,
1.049011, -0.6398811, 3.804791, 1, 0, 0.8823529, 1,
1.053935, 0.06362233, 0.8937634, 1, 0, 0.8745098, 1,
1.06231, 0.3329439, 1.291093, 1, 0, 0.8705882, 1,
1.0639, 0.2350365, 2.372446, 1, 0, 0.8627451, 1,
1.064084, -0.4483983, 3.746415, 1, 0, 0.8588235, 1,
1.069859, 0.6919414, 2.034527, 1, 0, 0.8509804, 1,
1.070932, -0.304193, 0.336795, 1, 0, 0.8470588, 1,
1.07485, 0.151757, 0.9427556, 1, 0, 0.8392157, 1,
1.081769, -0.4441602, 1.234793, 1, 0, 0.8352941, 1,
1.084723, -0.1184931, 0.7436368, 1, 0, 0.827451, 1,
1.085326, -0.3167771, 2.378498, 1, 0, 0.8235294, 1,
1.088243, -1.091453, 3.424954, 1, 0, 0.8156863, 1,
1.092247, -0.4287831, 2.130697, 1, 0, 0.8117647, 1,
1.098114, 0.2609172, 1.446968, 1, 0, 0.8039216, 1,
1.098531, 0.2683221, 1.921491, 1, 0, 0.7960784, 1,
1.102854, -0.6840653, 2.845064, 1, 0, 0.7921569, 1,
1.103334, -0.2197432, 1.478944, 1, 0, 0.7843137, 1,
1.109871, 0.8991029, 0.7056662, 1, 0, 0.7803922, 1,
1.120355, -0.1042023, 1.103641, 1, 0, 0.772549, 1,
1.121217, -0.2587015, 1.699082, 1, 0, 0.7686275, 1,
1.122187, -1.574625, 2.15569, 1, 0, 0.7607843, 1,
1.12235, 0.9733698, -0.367562, 1, 0, 0.7568628, 1,
1.123475, 1.153187, 0.161912, 1, 0, 0.7490196, 1,
1.136028, -1.06947, 2.498305, 1, 0, 0.7450981, 1,
1.138467, 2.101195, -0.9025317, 1, 0, 0.7372549, 1,
1.139884, 0.7904766, 1.443916, 1, 0, 0.7333333, 1,
1.150472, -0.03899123, 0.7468892, 1, 0, 0.7254902, 1,
1.152108, -0.8398062, 2.854299, 1, 0, 0.7215686, 1,
1.152534, 1.26246, -0.5416006, 1, 0, 0.7137255, 1,
1.158002, 1.334648, 2.357987, 1, 0, 0.7098039, 1,
1.158421, 0.5642437, 0.1247858, 1, 0, 0.7019608, 1,
1.16304, -0.7029296, 3.271237, 1, 0, 0.6941177, 1,
1.166405, 0.9456277, 2.078615, 1, 0, 0.6901961, 1,
1.176969, -0.3326448, 2.135148, 1, 0, 0.682353, 1,
1.183175, 0.3534482, 2.88717, 1, 0, 0.6784314, 1,
1.186079, -0.8373985, 1.077566, 1, 0, 0.6705883, 1,
1.186242, 0.916085, 2.578361, 1, 0, 0.6666667, 1,
1.204135, -0.2140627, 2.081583, 1, 0, 0.6588235, 1,
1.215981, 0.7754655, 2.270106, 1, 0, 0.654902, 1,
1.216102, -0.7119463, 3.103305, 1, 0, 0.6470588, 1,
1.230405, 0.3448233, 0.9483758, 1, 0, 0.6431373, 1,
1.233766, 0.7588612, 0.7446623, 1, 0, 0.6352941, 1,
1.237996, 0.5746262, 1.772169, 1, 0, 0.6313726, 1,
1.240419, 1.770821, 0.626348, 1, 0, 0.6235294, 1,
1.246773, 1.474477, 1.495077, 1, 0, 0.6196079, 1,
1.255109, 1.77132, 0.5892659, 1, 0, 0.6117647, 1,
1.263191, -0.4800253, 2.775074, 1, 0, 0.6078432, 1,
1.266964, 0.7348742, 1.052552, 1, 0, 0.6, 1,
1.269271, 0.4906884, 0.9336145, 1, 0, 0.5921569, 1,
1.27453, -0.2732191, 1.519804, 1, 0, 0.5882353, 1,
1.277431, 0.8108509, 0.24032, 1, 0, 0.5803922, 1,
1.279002, 1.839699, 0.3021624, 1, 0, 0.5764706, 1,
1.28644, 0.2933768, 1.899839, 1, 0, 0.5686275, 1,
1.297732, -0.9585131, 4.047615, 1, 0, 0.5647059, 1,
1.30233, -0.3468418, 1.296169, 1, 0, 0.5568628, 1,
1.30328, -0.444274, 0.9744639, 1, 0, 0.5529412, 1,
1.303639, 0.6464579, 0.8608183, 1, 0, 0.5450981, 1,
1.308248, 1.273949, -0.5899082, 1, 0, 0.5411765, 1,
1.311902, -1.748946, 1.65761, 1, 0, 0.5333334, 1,
1.318351, -0.5613739, 3.090949, 1, 0, 0.5294118, 1,
1.322123, 0.2615186, 1.93366, 1, 0, 0.5215687, 1,
1.32616, 0.5549806, -0.2511164, 1, 0, 0.5176471, 1,
1.3295, -0.8176368, 1.89626, 1, 0, 0.509804, 1,
1.329613, 1.935569, 0.6406945, 1, 0, 0.5058824, 1,
1.333249, -1.316601, 1.254335, 1, 0, 0.4980392, 1,
1.350285, 0.7912347, 0.8408799, 1, 0, 0.4901961, 1,
1.357687, 0.1411318, 2.521537, 1, 0, 0.4862745, 1,
1.359539, 0.9307638, 3.004676, 1, 0, 0.4784314, 1,
1.366621, 0.1768396, 1.554387, 1, 0, 0.4745098, 1,
1.378442, 0.5453715, -1.283298, 1, 0, 0.4666667, 1,
1.379422, 0.4475704, 1.110932, 1, 0, 0.4627451, 1,
1.386694, -0.7073716, 3.793583, 1, 0, 0.454902, 1,
1.399497, -0.4244181, 1.570284, 1, 0, 0.4509804, 1,
1.444302, -1.177982, 1.596651, 1, 0, 0.4431373, 1,
1.450436, 0.3523925, 3.91634, 1, 0, 0.4392157, 1,
1.4531, -0.4920885, 2.303796, 1, 0, 0.4313726, 1,
1.46196, 1.857066, 1.994041, 1, 0, 0.427451, 1,
1.46542, 1.196357, 0.2321017, 1, 0, 0.4196078, 1,
1.468847, 0.664582, 2.350841, 1, 0, 0.4156863, 1,
1.473556, 0.7609125, 1.153127, 1, 0, 0.4078431, 1,
1.503451, 2.294602, 1.250872, 1, 0, 0.4039216, 1,
1.514194, -1.107224, 2.54848, 1, 0, 0.3960784, 1,
1.518815, 0.8911035, 1.316612, 1, 0, 0.3882353, 1,
1.536743, 0.9146659, -0.2960844, 1, 0, 0.3843137, 1,
1.546782, 1.000798, 0.08730114, 1, 0, 0.3764706, 1,
1.553894, -0.1749981, 0.3893848, 1, 0, 0.372549, 1,
1.583652, -1.21356, 1.189171, 1, 0, 0.3647059, 1,
1.591504, -0.5532358, 1.04145, 1, 0, 0.3607843, 1,
1.624009, 0.1062989, 1.169764, 1, 0, 0.3529412, 1,
1.632397, -0.7293004, 1.294684, 1, 0, 0.3490196, 1,
1.668421, -0.6281149, -0.401259, 1, 0, 0.3411765, 1,
1.669919, 0.4803947, 1.576347, 1, 0, 0.3372549, 1,
1.673262, 0.7631316, 2.503417, 1, 0, 0.3294118, 1,
1.673981, -0.1495325, 1.171934, 1, 0, 0.3254902, 1,
1.679814, -0.03598899, 2.531491, 1, 0, 0.3176471, 1,
1.692996, 0.6532071, 0.2694732, 1, 0, 0.3137255, 1,
1.69834, -1.696927, 0.635868, 1, 0, 0.3058824, 1,
1.709677, 0.07186359, -0.4394248, 1, 0, 0.2980392, 1,
1.721221, 1.299563, 0.6712396, 1, 0, 0.2941177, 1,
1.728153, -0.716182, 2.683997, 1, 0, 0.2862745, 1,
1.734142, -2.26254, 1.388319, 1, 0, 0.282353, 1,
1.745815, 0.3004729, 1.251843, 1, 0, 0.2745098, 1,
1.746982, 0.8643952, 1.543748, 1, 0, 0.2705882, 1,
1.764762, -0.7671164, 2.728016, 1, 0, 0.2627451, 1,
1.766633, 0.9463928, 2.568752, 1, 0, 0.2588235, 1,
1.807708, 0.433276, 1.036618, 1, 0, 0.2509804, 1,
1.815595, 0.2922782, 1.93675, 1, 0, 0.2470588, 1,
1.815948, -0.2469106, 1.51012, 1, 0, 0.2392157, 1,
1.825551, 1.081681, 0.4508299, 1, 0, 0.2352941, 1,
1.855203, 0.1096864, 1.088452, 1, 0, 0.227451, 1,
1.881704, -1.117082, 1.525644, 1, 0, 0.2235294, 1,
1.882197, 0.07199256, 1.450464, 1, 0, 0.2156863, 1,
1.884061, 0.6446604, 0.3486504, 1, 0, 0.2117647, 1,
1.888659, -1.314065, 2.891453, 1, 0, 0.2039216, 1,
1.889874, 0.2722184, -1.840986, 1, 0, 0.1960784, 1,
1.901774, 2.052549, -0.4508824, 1, 0, 0.1921569, 1,
1.93696, 0.7936253, -0.7103418, 1, 0, 0.1843137, 1,
1.986889, -1.388569, 1.088367, 1, 0, 0.1803922, 1,
1.99306, -0.2822766, 1.209975, 1, 0, 0.172549, 1,
2.000941, 0.6137616, -0.2150598, 1, 0, 0.1686275, 1,
2.032225, -1.156047, 0.8644884, 1, 0, 0.1607843, 1,
2.061365, -1.253559, 2.554029, 1, 0, 0.1568628, 1,
2.064655, -0.03462778, 1.566654, 1, 0, 0.1490196, 1,
2.068942, -0.8245385, 1.019577, 1, 0, 0.145098, 1,
2.080238, 0.8780693, 1.556264, 1, 0, 0.1372549, 1,
2.102721, 1.060398, -0.25512, 1, 0, 0.1333333, 1,
2.148823, 1.314708, 1.833957, 1, 0, 0.1254902, 1,
2.1772, -1.977107, 2.06229, 1, 0, 0.1215686, 1,
2.201854, 0.811889, 1.748329, 1, 0, 0.1137255, 1,
2.218283, -0.218337, 1.389274, 1, 0, 0.1098039, 1,
2.221968, 1.635563, 0.6532419, 1, 0, 0.1019608, 1,
2.225601, -0.2352009, 1.403763, 1, 0, 0.09411765, 1,
2.236993, 0.2626017, 1.391281, 1, 0, 0.09019608, 1,
2.298484, 0.525027, 0.8817981, 1, 0, 0.08235294, 1,
2.313297, -0.2009646, 3.200012, 1, 0, 0.07843138, 1,
2.352381, -0.130137, 1.507216, 1, 0, 0.07058824, 1,
2.380875, 1.894203, 0.900412, 1, 0, 0.06666667, 1,
2.395059, -2.108023, 4.708938, 1, 0, 0.05882353, 1,
2.418318, -0.763303, 2.063599, 1, 0, 0.05490196, 1,
2.503938, 0.7861745, 2.681779, 1, 0, 0.04705882, 1,
2.529812, -0.7054281, 0.9856188, 1, 0, 0.04313726, 1,
2.540795, -0.635399, 1.923899, 1, 0, 0.03529412, 1,
2.60487, -1.007203, 3.186899, 1, 0, 0.03137255, 1,
2.697107, -0.457807, 2.640893, 1, 0, 0.02352941, 1,
2.832416, 0.5197275, -0.1959375, 1, 0, 0.01960784, 1,
3.5297, 1.996659, 0.5451482, 1, 0, 0.01176471, 1,
3.647608, -1.029256, 3.345721, 1, 0, 0.007843138, 1
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
0.4678541, -3.733345, -7.770646, 0, -0.5, 0.5, 0.5,
0.4678541, -3.733345, -7.770646, 1, -0.5, 0.5, 0.5,
0.4678541, -3.733345, -7.770646, 1, 1.5, 0.5, 0.5,
0.4678541, -3.733345, -7.770646, 0, 1.5, 0.5, 0.5
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
-3.789837, 0.01639354, -7.770646, 0, -0.5, 0.5, 0.5,
-3.789837, 0.01639354, -7.770646, 1, -0.5, 0.5, 0.5,
-3.789837, 0.01639354, -7.770646, 1, 1.5, 0.5, 0.5,
-3.789837, 0.01639354, -7.770646, 0, 1.5, 0.5, 0.5
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
-3.789837, -3.733345, -0.4742923, 0, -0.5, 0.5, 0.5,
-3.789837, -3.733345, -0.4742923, 1, -0.5, 0.5, 0.5,
-3.789837, -3.733345, -0.4742923, 1, 1.5, 0.5, 0.5,
-3.789837, -3.733345, -0.4742923, 0, 1.5, 0.5, 0.5
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
-2, -2.86802, -6.086872,
3, -2.86802, -6.086872,
-2, -2.86802, -6.086872,
-2, -3.012241, -6.367501,
-1, -2.86802, -6.086872,
-1, -3.012241, -6.367501,
0, -2.86802, -6.086872,
0, -3.012241, -6.367501,
1, -2.86802, -6.086872,
1, -3.012241, -6.367501,
2, -2.86802, -6.086872,
2, -3.012241, -6.367501,
3, -2.86802, -6.086872,
3, -3.012241, -6.367501
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
-2, -3.300682, -6.928759, 0, -0.5, 0.5, 0.5,
-2, -3.300682, -6.928759, 1, -0.5, 0.5, 0.5,
-2, -3.300682, -6.928759, 1, 1.5, 0.5, 0.5,
-2, -3.300682, -6.928759, 0, 1.5, 0.5, 0.5,
-1, -3.300682, -6.928759, 0, -0.5, 0.5, 0.5,
-1, -3.300682, -6.928759, 1, -0.5, 0.5, 0.5,
-1, -3.300682, -6.928759, 1, 1.5, 0.5, 0.5,
-1, -3.300682, -6.928759, 0, 1.5, 0.5, 0.5,
0, -3.300682, -6.928759, 0, -0.5, 0.5, 0.5,
0, -3.300682, -6.928759, 1, -0.5, 0.5, 0.5,
0, -3.300682, -6.928759, 1, 1.5, 0.5, 0.5,
0, -3.300682, -6.928759, 0, 1.5, 0.5, 0.5,
1, -3.300682, -6.928759, 0, -0.5, 0.5, 0.5,
1, -3.300682, -6.928759, 1, -0.5, 0.5, 0.5,
1, -3.300682, -6.928759, 1, 1.5, 0.5, 0.5,
1, -3.300682, -6.928759, 0, 1.5, 0.5, 0.5,
2, -3.300682, -6.928759, 0, -0.5, 0.5, 0.5,
2, -3.300682, -6.928759, 1, -0.5, 0.5, 0.5,
2, -3.300682, -6.928759, 1, 1.5, 0.5, 0.5,
2, -3.300682, -6.928759, 0, 1.5, 0.5, 0.5,
3, -3.300682, -6.928759, 0, -0.5, 0.5, 0.5,
3, -3.300682, -6.928759, 1, -0.5, 0.5, 0.5,
3, -3.300682, -6.928759, 1, 1.5, 0.5, 0.5,
3, -3.300682, -6.928759, 0, 1.5, 0.5, 0.5
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
-2.807293, -2, -6.086872,
-2.807293, 2, -6.086872,
-2.807293, -2, -6.086872,
-2.97105, -2, -6.367501,
-2.807293, -1, -6.086872,
-2.97105, -1, -6.367501,
-2.807293, 0, -6.086872,
-2.97105, 0, -6.367501,
-2.807293, 1, -6.086872,
-2.97105, 1, -6.367501,
-2.807293, 2, -6.086872,
-2.97105, 2, -6.367501
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
-3.298565, -2, -6.928759, 0, -0.5, 0.5, 0.5,
-3.298565, -2, -6.928759, 1, -0.5, 0.5, 0.5,
-3.298565, -2, -6.928759, 1, 1.5, 0.5, 0.5,
-3.298565, -2, -6.928759, 0, 1.5, 0.5, 0.5,
-3.298565, -1, -6.928759, 0, -0.5, 0.5, 0.5,
-3.298565, -1, -6.928759, 1, -0.5, 0.5, 0.5,
-3.298565, -1, -6.928759, 1, 1.5, 0.5, 0.5,
-3.298565, -1, -6.928759, 0, 1.5, 0.5, 0.5,
-3.298565, 0, -6.928759, 0, -0.5, 0.5, 0.5,
-3.298565, 0, -6.928759, 1, -0.5, 0.5, 0.5,
-3.298565, 0, -6.928759, 1, 1.5, 0.5, 0.5,
-3.298565, 0, -6.928759, 0, 1.5, 0.5, 0.5,
-3.298565, 1, -6.928759, 0, -0.5, 0.5, 0.5,
-3.298565, 1, -6.928759, 1, -0.5, 0.5, 0.5,
-3.298565, 1, -6.928759, 1, 1.5, 0.5, 0.5,
-3.298565, 1, -6.928759, 0, 1.5, 0.5, 0.5,
-3.298565, 2, -6.928759, 0, -0.5, 0.5, 0.5,
-3.298565, 2, -6.928759, 1, -0.5, 0.5, 0.5,
-3.298565, 2, -6.928759, 1, 1.5, 0.5, 0.5,
-3.298565, 2, -6.928759, 0, 1.5, 0.5, 0.5
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
-2.807293, -2.86802, -4,
-2.807293, -2.86802, 4,
-2.807293, -2.86802, -4,
-2.97105, -3.012241, -4,
-2.807293, -2.86802, -2,
-2.97105, -3.012241, -2,
-2.807293, -2.86802, 0,
-2.97105, -3.012241, 0,
-2.807293, -2.86802, 2,
-2.97105, -3.012241, 2,
-2.807293, -2.86802, 4,
-2.97105, -3.012241, 4
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
-3.298565, -3.300682, -4, 0, -0.5, 0.5, 0.5,
-3.298565, -3.300682, -4, 1, -0.5, 0.5, 0.5,
-3.298565, -3.300682, -4, 1, 1.5, 0.5, 0.5,
-3.298565, -3.300682, -4, 0, 1.5, 0.5, 0.5,
-3.298565, -3.300682, -2, 0, -0.5, 0.5, 0.5,
-3.298565, -3.300682, -2, 1, -0.5, 0.5, 0.5,
-3.298565, -3.300682, -2, 1, 1.5, 0.5, 0.5,
-3.298565, -3.300682, -2, 0, 1.5, 0.5, 0.5,
-3.298565, -3.300682, 0, 0, -0.5, 0.5, 0.5,
-3.298565, -3.300682, 0, 1, -0.5, 0.5, 0.5,
-3.298565, -3.300682, 0, 1, 1.5, 0.5, 0.5,
-3.298565, -3.300682, 0, 0, 1.5, 0.5, 0.5,
-3.298565, -3.300682, 2, 0, -0.5, 0.5, 0.5,
-3.298565, -3.300682, 2, 1, -0.5, 0.5, 0.5,
-3.298565, -3.300682, 2, 1, 1.5, 0.5, 0.5,
-3.298565, -3.300682, 2, 0, 1.5, 0.5, 0.5,
-3.298565, -3.300682, 4, 0, -0.5, 0.5, 0.5,
-3.298565, -3.300682, 4, 1, -0.5, 0.5, 0.5,
-3.298565, -3.300682, 4, 1, 1.5, 0.5, 0.5,
-3.298565, -3.300682, 4, 0, 1.5, 0.5, 0.5
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
-2.807293, -2.86802, -6.086872,
-2.807293, 2.900807, -6.086872,
-2.807293, -2.86802, 5.138288,
-2.807293, 2.900807, 5.138288,
-2.807293, -2.86802, -6.086872,
-2.807293, -2.86802, 5.138288,
-2.807293, 2.900807, -6.086872,
-2.807293, 2.900807, 5.138288,
-2.807293, -2.86802, -6.086872,
3.743001, -2.86802, -6.086872,
-2.807293, -2.86802, 5.138288,
3.743001, -2.86802, 5.138288,
-2.807293, 2.900807, -6.086872,
3.743001, 2.900807, -6.086872,
-2.807293, 2.900807, 5.138288,
3.743001, 2.900807, 5.138288,
3.743001, -2.86802, -6.086872,
3.743001, 2.900807, -6.086872,
3.743001, -2.86802, 5.138288,
3.743001, 2.900807, 5.138288,
3.743001, -2.86802, -6.086872,
3.743001, -2.86802, 5.138288,
3.743001, 2.900807, -6.086872,
3.743001, 2.900807, 5.138288
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
var radius = 7.592857;
var distance = 33.78148;
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
mvMatrix.translate( -0.4678541, -0.01639354, 0.4742923 );
mvMatrix.scale( 1.25331, 1.423087, 0.7313523 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.78148);
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
Dichlorprop<-read.table("Dichlorprop.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dichlorprop$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dichlorprop' not found
```

```r
y<-Dichlorprop$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dichlorprop' not found
```

```r
z<-Dichlorprop$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dichlorprop' not found
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
-2.7119, -0.05290702, -0.7585403, 0, 0, 1, 1, 1,
-2.587703, 0.9853438, 0.872839, 1, 0, 0, 1, 1,
-2.473405, 0.7919117, -1.156908, 1, 0, 0, 1, 1,
-2.468392, 0.4490947, -0.09698612, 1, 0, 0, 1, 1,
-2.441255, -0.7624644, -2.256788, 1, 0, 0, 1, 1,
-2.32655, 1.342414, -0.4988151, 1, 0, 0, 1, 1,
-2.287843, -0.9272141, -5.350312, 0, 0, 0, 1, 1,
-2.236675, 0.2983432, -0.7434837, 0, 0, 0, 1, 1,
-2.216731, -0.3854481, -0.9339092, 0, 0, 0, 1, 1,
-2.152378, -0.4517979, -1.213885, 0, 0, 0, 1, 1,
-2.144917, -1.505106, -0.6587196, 0, 0, 0, 1, 1,
-2.14488, 1.062256, 0.7138278, 0, 0, 0, 1, 1,
-2.142579, 1.101413, -1.280378, 0, 0, 0, 1, 1,
-2.052385, -0.7087447, -2.641145, 1, 1, 1, 1, 1,
-2.04196, -0.7675027, -1.400939, 1, 1, 1, 1, 1,
-2.019842, 0.9121555, -2.004271, 1, 1, 1, 1, 1,
-2.01345, -0.9143769, -1.977896, 1, 1, 1, 1, 1,
-2.002589, -0.9584853, -1.583858, 1, 1, 1, 1, 1,
-1.96805, 1.288998, -1.214722, 1, 1, 1, 1, 1,
-1.947717, 0.2880472, -1.325565, 1, 1, 1, 1, 1,
-1.928118, -1.206086, -0.7295135, 1, 1, 1, 1, 1,
-1.923036, 0.4655016, -0.8689344, 1, 1, 1, 1, 1,
-1.920761, -0.8037515, -0.5068353, 1, 1, 1, 1, 1,
-1.902685, 0.8361285, -1.057083, 1, 1, 1, 1, 1,
-1.898982, 0.2408436, -1.985541, 1, 1, 1, 1, 1,
-1.862051, -1.03757, -2.726124, 1, 1, 1, 1, 1,
-1.860372, 1.180317, 0.3961782, 1, 1, 1, 1, 1,
-1.859838, -0.5474721, -2.911429, 1, 1, 1, 1, 1,
-1.858104, 1.618946, -0.6284388, 0, 0, 1, 1, 1,
-1.84551, 1.518776, -2.241696, 1, 0, 0, 1, 1,
-1.844221, 0.333111, 0.8187141, 1, 0, 0, 1, 1,
-1.837134, -0.3323765, -1.284521, 1, 0, 0, 1, 1,
-1.803064, -1.439166, -3.527814, 1, 0, 0, 1, 1,
-1.79871, -0.1221253, 0.03646309, 1, 0, 0, 1, 1,
-1.796269, 1.331766, -1.180928, 0, 0, 0, 1, 1,
-1.791506, -0.4930171, -0.9530893, 0, 0, 0, 1, 1,
-1.764733, -2.222851, -2.473153, 0, 0, 0, 1, 1,
-1.763653, -0.1528374, -1.401824, 0, 0, 0, 1, 1,
-1.756163, -1.032974, -2.043153, 0, 0, 0, 1, 1,
-1.753638, -0.9906731, -2.703363, 0, 0, 0, 1, 1,
-1.734292, 0.2723802, -1.696207, 0, 0, 0, 1, 1,
-1.715817, -2.003152, -1.222831, 1, 1, 1, 1, 1,
-1.698417, 0.5424662, -2.138185, 1, 1, 1, 1, 1,
-1.692646, 0.04410627, -1.22348, 1, 1, 1, 1, 1,
-1.684968, 0.295556, -0.9107079, 1, 1, 1, 1, 1,
-1.683175, -0.07642522, -1.764597, 1, 1, 1, 1, 1,
-1.681351, -0.09084667, -0.05919879, 1, 1, 1, 1, 1,
-1.680817, -0.7353399, -2.650816, 1, 1, 1, 1, 1,
-1.659558, 0.9384465, -1.495593, 1, 1, 1, 1, 1,
-1.647827, 0.1521624, -1.545125, 1, 1, 1, 1, 1,
-1.645769, 0.4620827, -2.057987, 1, 1, 1, 1, 1,
-1.636951, 0.3629478, -0.08583399, 1, 1, 1, 1, 1,
-1.626509, 0.1333455, -1.267365, 1, 1, 1, 1, 1,
-1.622102, 0.4049961, -0.7504629, 1, 1, 1, 1, 1,
-1.619513, 0.6973137, -1.274505, 1, 1, 1, 1, 1,
-1.615789, -0.5381595, -2.463681, 1, 1, 1, 1, 1,
-1.586706, 0.1460952, -2.244135, 0, 0, 1, 1, 1,
-1.562017, -1.347557, -1.259795, 1, 0, 0, 1, 1,
-1.556915, -0.1975245, -1.879369, 1, 0, 0, 1, 1,
-1.522889, 2.725418, 0.1206464, 1, 0, 0, 1, 1,
-1.510309, -1.743491, -1.653775, 1, 0, 0, 1, 1,
-1.508596, 0.0491077, -2.297235, 1, 0, 0, 1, 1,
-1.495836, -1.076423, -2.618256, 0, 0, 0, 1, 1,
-1.492591, -0.5151528, -1.264335, 0, 0, 0, 1, 1,
-1.480232, -0.9302504, -3.110835, 0, 0, 0, 1, 1,
-1.4605, -0.9344624, -1.655853, 0, 0, 0, 1, 1,
-1.441043, 0.7728143, -0.5634188, 0, 0, 0, 1, 1,
-1.433506, -0.05098358, -1.464679, 0, 0, 0, 1, 1,
-1.428118, -0.3851263, -2.946947, 0, 0, 0, 1, 1,
-1.424535, 1.211606, 0.3990455, 1, 1, 1, 1, 1,
-1.423111, 1.207529, -1.733405, 1, 1, 1, 1, 1,
-1.421735, 1.050093, -0.2252528, 1, 1, 1, 1, 1,
-1.410785, -0.4790766, -2.361262, 1, 1, 1, 1, 1,
-1.408425, -0.1906599, -2.540334, 1, 1, 1, 1, 1,
-1.404631, -0.8732399, -2.074884, 1, 1, 1, 1, 1,
-1.398158, 0.2814353, -1.036233, 1, 1, 1, 1, 1,
-1.398143, 1.738995, -0.1241486, 1, 1, 1, 1, 1,
-1.380241, -0.9324086, -1.918445, 1, 1, 1, 1, 1,
-1.366135, 0.7106715, -1.833217, 1, 1, 1, 1, 1,
-1.351283, -0.5164866, -3.335973, 1, 1, 1, 1, 1,
-1.345175, -0.03741409, -1.362125, 1, 1, 1, 1, 1,
-1.337688, -0.9477997, -1.46374, 1, 1, 1, 1, 1,
-1.323402, -1.844538, -1.85228, 1, 1, 1, 1, 1,
-1.32166, 0.5421911, -2.14517, 1, 1, 1, 1, 1,
-1.31874, -0.4970363, -1.209288, 0, 0, 1, 1, 1,
-1.310473, 0.7409746, 0.15244, 1, 0, 0, 1, 1,
-1.302892, 0.4219475, -0.3979191, 1, 0, 0, 1, 1,
-1.297775, 1.828304, -2.476356, 1, 0, 0, 1, 1,
-1.278364, -1.786984, -2.438165, 1, 0, 0, 1, 1,
-1.259196, -0.881104, -1.836779, 1, 0, 0, 1, 1,
-1.249982, 1.253004, -1.941318, 0, 0, 0, 1, 1,
-1.242605, 0.4902426, -1.034836, 0, 0, 0, 1, 1,
-1.241752, -0.1458056, -1.808096, 0, 0, 0, 1, 1,
-1.239509, -0.5194094, -3.000294, 0, 0, 0, 1, 1,
-1.231444, -1.103672, -3.029011, 0, 0, 0, 1, 1,
-1.228171, -0.1386007, -1.253911, 0, 0, 0, 1, 1,
-1.223596, -0.4432628, -3.157438, 0, 0, 0, 1, 1,
-1.21452, 0.756159, -0.5301188, 1, 1, 1, 1, 1,
-1.211468, 1.282803, -1.651599, 1, 1, 1, 1, 1,
-1.208913, 0.2412504, -2.660586, 1, 1, 1, 1, 1,
-1.202765, -0.6199056, -3.054409, 1, 1, 1, 1, 1,
-1.197793, -0.206179, -3.718365, 1, 1, 1, 1, 1,
-1.194939, 0.43592, -2.379616, 1, 1, 1, 1, 1,
-1.193914, 0.8385953, -0.8518301, 1, 1, 1, 1, 1,
-1.189601, 0.1637843, -1.479258, 1, 1, 1, 1, 1,
-1.187147, 0.4984862, -1.490794, 1, 1, 1, 1, 1,
-1.187052, 0.4456846, -1.993182, 1, 1, 1, 1, 1,
-1.184182, 1.484995, -0.906658, 1, 1, 1, 1, 1,
-1.173118, -0.6325285, -2.010905, 1, 1, 1, 1, 1,
-1.171748, 1.324787, -1.926677, 1, 1, 1, 1, 1,
-1.165535, -2.479298, -4.144584, 1, 1, 1, 1, 1,
-1.158535, 0.5711845, -0.2741286, 1, 1, 1, 1, 1,
-1.158414, -0.9302552, -2.749588, 0, 0, 1, 1, 1,
-1.148097, -0.6124829, -1.788941, 1, 0, 0, 1, 1,
-1.144767, 0.5320381, -1.038493, 1, 0, 0, 1, 1,
-1.14228, 1.24962, -1.146107, 1, 0, 0, 1, 1,
-1.142153, -0.5926057, -2.72115, 1, 0, 0, 1, 1,
-1.14193, 0.3070198, -1.663855, 1, 0, 0, 1, 1,
-1.140122, 0.6795297, -0.05905496, 0, 0, 0, 1, 1,
-1.136982, 0.3325563, -2.019459, 0, 0, 0, 1, 1,
-1.133478, -0.3439932, -1.971264, 0, 0, 0, 1, 1,
-1.133099, -1.544954, -4.041162, 0, 0, 0, 1, 1,
-1.127545, 0.2201633, -0.2146235, 0, 0, 0, 1, 1,
-1.124275, 0.970332, 0.04707457, 0, 0, 0, 1, 1,
-1.115628, 0.1943432, -1.061336, 0, 0, 0, 1, 1,
-1.112252, -1.843992, -2.196429, 1, 1, 1, 1, 1,
-1.090841, 0.1366856, -1.633066, 1, 1, 1, 1, 1,
-1.081387, -0.003148194, -0.2057483, 1, 1, 1, 1, 1,
-1.069802, 0.130036, -0.9679993, 1, 1, 1, 1, 1,
-1.069332, -2.222848, -3.131672, 1, 1, 1, 1, 1,
-1.068296, 1.723056, -1.257154, 1, 1, 1, 1, 1,
-1.062497, -1.088287, -3.502659, 1, 1, 1, 1, 1,
-1.062192, -0.2672162, -3.192674, 1, 1, 1, 1, 1,
-1.056437, -1.077235, -2.066608, 1, 1, 1, 1, 1,
-1.053027, -0.6054107, -1.889782, 1, 1, 1, 1, 1,
-1.050812, 1.177752, -0.1110038, 1, 1, 1, 1, 1,
-1.048781, -1.300598, -2.218255, 1, 1, 1, 1, 1,
-1.048575, 0.3007023, -0.8395926, 1, 1, 1, 1, 1,
-1.04125, -0.6587218, -1.201303, 1, 1, 1, 1, 1,
-1.04003, -1.083884, -2.847109, 1, 1, 1, 1, 1,
-1.039459, 1.726908, -0.3921376, 0, 0, 1, 1, 1,
-1.02565, 1.00974, -1.005097, 1, 0, 0, 1, 1,
-1.017436, -2.683124, -1.640073, 1, 0, 0, 1, 1,
-1.000837, 1.195938, 0.4409374, 1, 0, 0, 1, 1,
-0.9920068, -0.09771071, -2.117566, 1, 0, 0, 1, 1,
-0.9896898, 0.2593649, -1.152285, 1, 0, 0, 1, 1,
-0.9886004, -0.9395442, -2.8413, 0, 0, 0, 1, 1,
-0.9877531, 0.8133306, -1.662016, 0, 0, 0, 1, 1,
-0.9841232, -0.1435537, -2.228363, 0, 0, 0, 1, 1,
-0.9830979, -0.6103858, -2.747123, 0, 0, 0, 1, 1,
-0.9807197, -0.02826383, -2.489334, 0, 0, 0, 1, 1,
-0.9737063, -0.06472421, -3.186718, 0, 0, 0, 1, 1,
-0.9712047, -0.03958872, 0.2154827, 0, 0, 0, 1, 1,
-0.970295, 0.4053449, -1.150566, 1, 1, 1, 1, 1,
-0.9675083, -0.6052413, -2.736817, 1, 1, 1, 1, 1,
-0.9435453, -0.6350172, -1.55918, 1, 1, 1, 1, 1,
-0.9421088, 0.5063107, -0.3389568, 1, 1, 1, 1, 1,
-0.912726, -0.2187133, -1.540411, 1, 1, 1, 1, 1,
-0.912099, 1.99069, -1.056214, 1, 1, 1, 1, 1,
-0.9114922, -0.09107319, -3.627097, 1, 1, 1, 1, 1,
-0.9104045, -1.29546, -4.124255, 1, 1, 1, 1, 1,
-0.9057633, -0.2424267, -1.224548, 1, 1, 1, 1, 1,
-0.8997356, 1.764919, -1.105056, 1, 1, 1, 1, 1,
-0.891131, 1.239202, -0.1981954, 1, 1, 1, 1, 1,
-0.8891342, -0.09130764, -3.400002, 1, 1, 1, 1, 1,
-0.8863428, 0.9255124, 0.4732323, 1, 1, 1, 1, 1,
-0.8862999, -1.326997, -3.212432, 1, 1, 1, 1, 1,
-0.8775281, -0.1671696, -1.407749, 1, 1, 1, 1, 1,
-0.8727307, -1.168574, -2.929364, 0, 0, 1, 1, 1,
-0.8720637, -0.5749387, -1.251213, 1, 0, 0, 1, 1,
-0.868201, 0.01894985, -1.241415, 1, 0, 0, 1, 1,
-0.8672506, -0.320989, -2.347489, 1, 0, 0, 1, 1,
-0.8667622, 1.693542, -1.426569, 1, 0, 0, 1, 1,
-0.8646641, 0.6983959, -3.09142, 1, 0, 0, 1, 1,
-0.8643103, 1.023704, 0.971762, 0, 0, 0, 1, 1,
-0.8600305, 0.6647885, 0.03689298, 0, 0, 0, 1, 1,
-0.8575469, -0.001497635, -1.905689, 0, 0, 0, 1, 1,
-0.8470962, -2.12977, -3.248288, 0, 0, 0, 1, 1,
-0.8419573, -1.528888, -1.083866, 0, 0, 0, 1, 1,
-0.8418301, -1.822665, -2.014977, 0, 0, 0, 1, 1,
-0.8380499, 0.3448597, -0.6916497, 0, 0, 0, 1, 1,
-0.8354208, -0.04522622, -1.004842, 1, 1, 1, 1, 1,
-0.8229188, 1.274472, 0.2686537, 1, 1, 1, 1, 1,
-0.8146158, 1.684677, -3.211583, 1, 1, 1, 1, 1,
-0.8134581, 1.28662, -2.1545, 1, 1, 1, 1, 1,
-0.8132297, -2.229295, -1.594939, 1, 1, 1, 1, 1,
-0.8101394, 0.004428484, -1.410457, 1, 1, 1, 1, 1,
-0.8061608, -2.48338, -2.702775, 1, 1, 1, 1, 1,
-0.8044866, 0.4181111, 0.2967544, 1, 1, 1, 1, 1,
-0.802908, -0.8643656, -1.939898, 1, 1, 1, 1, 1,
-0.8022242, 1.248172, -0.9606123, 1, 1, 1, 1, 1,
-0.8013057, -0.3128892, -0.2627474, 1, 1, 1, 1, 1,
-0.7836279, -0.9136168, -3.04506, 1, 1, 1, 1, 1,
-0.7765924, -0.2943837, -1.645777, 1, 1, 1, 1, 1,
-0.7754467, -1.569861, -1.479178, 1, 1, 1, 1, 1,
-0.7679564, -0.4832318, -2.368816, 1, 1, 1, 1, 1,
-0.7616164, 0.07741458, -1.838846, 0, 0, 1, 1, 1,
-0.7577215, -1.104292, -2.921456, 1, 0, 0, 1, 1,
-0.7544994, 0.6671177, -0.8359462, 1, 0, 0, 1, 1,
-0.7543925, 2.058841, -1.402874, 1, 0, 0, 1, 1,
-0.7540767, 1.3862, -0.5080859, 1, 0, 0, 1, 1,
-0.7538655, 0.5523064, -1.935787, 1, 0, 0, 1, 1,
-0.7521071, 0.06617473, -0.4495476, 0, 0, 0, 1, 1,
-0.7501308, 0.4958054, -1.764436, 0, 0, 0, 1, 1,
-0.749521, 0.3140158, -0.159196, 0, 0, 0, 1, 1,
-0.747815, 0.6800052, -1.057451, 0, 0, 0, 1, 1,
-0.7430077, -2.186098, -2.573922, 0, 0, 0, 1, 1,
-0.7395803, -0.2410453, -0.707181, 0, 0, 0, 1, 1,
-0.7271225, 1.387389, -0.4905888, 0, 0, 0, 1, 1,
-0.7175959, -0.5541086, -0.8078521, 1, 1, 1, 1, 1,
-0.7135257, 0.4109339, -0.4262826, 1, 1, 1, 1, 1,
-0.7083745, 0.04540926, -0.6798201, 1, 1, 1, 1, 1,
-0.7052428, -0.449228, -2.686986, 1, 1, 1, 1, 1,
-0.7012699, 1.55938, 0.1895892, 1, 1, 1, 1, 1,
-0.6943372, 0.08734325, -2.479125, 1, 1, 1, 1, 1,
-0.6914799, 0.6760397, -2.781305, 1, 1, 1, 1, 1,
-0.6910092, -2.110547, -3.606702, 1, 1, 1, 1, 1,
-0.6880875, -1.652851, -3.94483, 1, 1, 1, 1, 1,
-0.684853, -0.5045, -2.559167, 1, 1, 1, 1, 1,
-0.6830768, -1.071089, -2.940466, 1, 1, 1, 1, 1,
-0.6799631, -0.3488496, -2.144939, 1, 1, 1, 1, 1,
-0.6775799, 0.1924234, -1.298027, 1, 1, 1, 1, 1,
-0.6767379, -0.2945965, -2.56592, 1, 1, 1, 1, 1,
-0.6736454, -0.4030976, -3.409958, 1, 1, 1, 1, 1,
-0.6692558, -0.7274862, -3.014425, 0, 0, 1, 1, 1,
-0.6668734, 1.185481, -0.6102782, 1, 0, 0, 1, 1,
-0.6664647, 1.867562, -1.128948, 1, 0, 0, 1, 1,
-0.6603764, -0.7779927, -0.728422, 1, 0, 0, 1, 1,
-0.6597462, -2.063679, -1.657842, 1, 0, 0, 1, 1,
-0.6571682, -0.1215196, -2.075581, 1, 0, 0, 1, 1,
-0.656166, 0.2909788, -0.3419167, 0, 0, 0, 1, 1,
-0.6561398, -1.523091, -3.073634, 0, 0, 0, 1, 1,
-0.653461, -1.534042, -1.802528, 0, 0, 0, 1, 1,
-0.6517001, -0.9939261, -1.110262, 0, 0, 0, 1, 1,
-0.6413469, -2.043, -3.526822, 0, 0, 0, 1, 1,
-0.64124, 2.588924, -1.006191, 0, 0, 0, 1, 1,
-0.6390619, -0.8695214, -2.791667, 0, 0, 0, 1, 1,
-0.6356075, -0.7780108, -3.926455, 1, 1, 1, 1, 1,
-0.6323821, 0.9522781, 0.1639907, 1, 1, 1, 1, 1,
-0.6306547, 1.080033, -1.552628, 1, 1, 1, 1, 1,
-0.6254675, -1.030969, -2.825757, 1, 1, 1, 1, 1,
-0.6247439, -0.4949718, -2.561117, 1, 1, 1, 1, 1,
-0.6230381, -1.269081, -3.971823, 1, 1, 1, 1, 1,
-0.6226597, 0.381512, 0.41488, 1, 1, 1, 1, 1,
-0.6223775, 0.5422489, -0.8751848, 1, 1, 1, 1, 1,
-0.6204358, 1.642089, -2.448741, 1, 1, 1, 1, 1,
-0.6190568, 1.100698, -0.536086, 1, 1, 1, 1, 1,
-0.6076033, -0.3556879, -3.038129, 1, 1, 1, 1, 1,
-0.6034995, -0.2864438, -1.219169, 1, 1, 1, 1, 1,
-0.6029353, -0.444254, -2.195337, 1, 1, 1, 1, 1,
-0.6013968, -0.6323478, -1.47974, 1, 1, 1, 1, 1,
-0.5990567, -0.002135225, -2.286587, 1, 1, 1, 1, 1,
-0.597218, -1.263216, -2.521863, 0, 0, 1, 1, 1,
-0.5949341, -0.1251394, -0.8831723, 1, 0, 0, 1, 1,
-0.5942339, -0.3061171, -0.9736287, 1, 0, 0, 1, 1,
-0.5941501, 0.9547298, -0.1005145, 1, 0, 0, 1, 1,
-0.5936828, 0.635277, -0.2566232, 1, 0, 0, 1, 1,
-0.5930253, 0.3743367, -2.119708, 1, 0, 0, 1, 1,
-0.5929723, 0.3805548, -1.008508, 0, 0, 0, 1, 1,
-0.5924878, -0.8417518, -2.415704, 0, 0, 0, 1, 1,
-0.5921475, 1.61763, 0.2006612, 0, 0, 0, 1, 1,
-0.5885213, -1.518845, -3.317173, 0, 0, 0, 1, 1,
-0.5878369, 0.9645843, -1.239562, 0, 0, 0, 1, 1,
-0.5877933, 0.1828052, -0.4719367, 0, 0, 0, 1, 1,
-0.5869875, -0.02743595, -1.680752, 0, 0, 0, 1, 1,
-0.5867967, -1.399553, -3.496043, 1, 1, 1, 1, 1,
-0.5810547, 1.784263, -1.191069, 1, 1, 1, 1, 1,
-0.5803035, -0.00343528, -1.312145, 1, 1, 1, 1, 1,
-0.5791525, 1.327079, -0.1591, 1, 1, 1, 1, 1,
-0.5771791, -0.2024725, -3.249434, 1, 1, 1, 1, 1,
-0.5750678, -0.004374221, -0.2906375, 1, 1, 1, 1, 1,
-0.5749226, -0.7786755, -2.664032, 1, 1, 1, 1, 1,
-0.559027, -0.704131, -2.899351, 1, 1, 1, 1, 1,
-0.5568862, -0.4423349, -3.899771, 1, 1, 1, 1, 1,
-0.5565181, -0.3412343, -0.9102128, 1, 1, 1, 1, 1,
-0.5562192, -0.2455676, -1.863764, 1, 1, 1, 1, 1,
-0.5559849, 0.03196677, -1.130818, 1, 1, 1, 1, 1,
-0.5507718, -1.658553, -3.202093, 1, 1, 1, 1, 1,
-0.5420823, -1.391866, -2.115749, 1, 1, 1, 1, 1,
-0.53665, -2.387218, -4.621245, 1, 1, 1, 1, 1,
-0.5366368, 1.237814, 1.316984, 0, 0, 1, 1, 1,
-0.5354016, 1.65999, 0.06014913, 1, 0, 0, 1, 1,
-0.5342604, -0.1769662, -3.221315, 1, 0, 0, 1, 1,
-0.5333222, 0.6798201, 0.7306497, 1, 0, 0, 1, 1,
-0.5330202, -0.4040137, -3.781749, 1, 0, 0, 1, 1,
-0.5326834, -1.606636, -2.42785, 1, 0, 0, 1, 1,
-0.5320984, -0.5161859, -2.496833, 0, 0, 0, 1, 1,
-0.530459, -0.8675742, -3.398496, 0, 0, 0, 1, 1,
-0.5303662, 1.018021, -1.097251, 0, 0, 0, 1, 1,
-0.5299863, 0.2429707, -1.380308, 0, 0, 0, 1, 1,
-0.5188224, 2.052709, 0.5977957, 0, 0, 0, 1, 1,
-0.5089571, 1.404522, -0.5553036, 0, 0, 0, 1, 1,
-0.5050375, 0.4649692, -2.39588, 0, 0, 0, 1, 1,
-0.502822, -2.652706, -0.8970211, 1, 1, 1, 1, 1,
-0.5015956, 1.532155, 0.3554406, 1, 1, 1, 1, 1,
-0.5007623, -0.6349063, -1.367479, 1, 1, 1, 1, 1,
-0.4992983, -0.02196655, -2.58538, 1, 1, 1, 1, 1,
-0.4988912, -0.2523893, -2.568786, 1, 1, 1, 1, 1,
-0.4933186, 0.7019459, 0.6275013, 1, 1, 1, 1, 1,
-0.491252, -0.06731234, -0.2741656, 1, 1, 1, 1, 1,
-0.4886148, -0.09676933, -1.726947, 1, 1, 1, 1, 1,
-0.4851838, 1.028973, -0.2736166, 1, 1, 1, 1, 1,
-0.4844199, -0.8423834, -3.141236, 1, 1, 1, 1, 1,
-0.4843911, -0.2311586, -0.1697381, 1, 1, 1, 1, 1,
-0.4773235, -0.5995336, 0.1745647, 1, 1, 1, 1, 1,
-0.4772393, 1.572706, 1.717239, 1, 1, 1, 1, 1,
-0.4660619, -0.367489, -2.489488, 1, 1, 1, 1, 1,
-0.4638428, 0.335719, -1.789623, 1, 1, 1, 1, 1,
-0.4612287, -0.6526147, -1.305945, 0, 0, 1, 1, 1,
-0.4610953, -1.040396, -2.499378, 1, 0, 0, 1, 1,
-0.4596123, -1.1166, -1.73713, 1, 0, 0, 1, 1,
-0.458721, -0.3548805, -4.087556, 1, 0, 0, 1, 1,
-0.4536299, 1.100326, 1.175411, 1, 0, 0, 1, 1,
-0.4527673, 0.4958322, -1.796196, 1, 0, 0, 1, 1,
-0.4508161, 0.9930744, -0.9499906, 0, 0, 0, 1, 1,
-0.44704, -0.08565141, -1.191512, 0, 0, 0, 1, 1,
-0.4458237, -0.8256693, -3.888048, 0, 0, 0, 1, 1,
-0.4455559, 0.9322878, -0.3266635, 0, 0, 0, 1, 1,
-0.4408082, 0.115294, -2.780029, 0, 0, 0, 1, 1,
-0.4397213, 1.289391, -0.431122, 0, 0, 0, 1, 1,
-0.4395854, 1.50569, 0.1476671, 0, 0, 0, 1, 1,
-0.4334354, 1.628119, -0.001865022, 1, 1, 1, 1, 1,
-0.4308498, -0.7512029, -1.888825, 1, 1, 1, 1, 1,
-0.4292503, -0.774152, -2.839597, 1, 1, 1, 1, 1,
-0.4270633, -0.001086293, -2.576869, 1, 1, 1, 1, 1,
-0.4268099, 0.5347039, -1.365336, 1, 1, 1, 1, 1,
-0.4202074, 0.4675623, -1.62003, 1, 1, 1, 1, 1,
-0.4196433, 1.667732, -0.3512492, 1, 1, 1, 1, 1,
-0.4148324, 1.017963, 0.2067612, 1, 1, 1, 1, 1,
-0.4112262, 1.673583, -0.09701674, 1, 1, 1, 1, 1,
-0.4086501, -0.4385175, -2.536108, 1, 1, 1, 1, 1,
-0.407101, 1.848793, -2.089436, 1, 1, 1, 1, 1,
-0.4068636, -0.3433942, -1.502333, 1, 1, 1, 1, 1,
-0.4054387, 1.127736, -0.3856207, 1, 1, 1, 1, 1,
-0.4012752, 0.6616363, 1.013876, 1, 1, 1, 1, 1,
-0.4006439, 1.368038, -0.5551988, 1, 1, 1, 1, 1,
-0.3998308, -0.9617448, -2.868886, 0, 0, 1, 1, 1,
-0.3938805, -0.411511, -3.338969, 1, 0, 0, 1, 1,
-0.387149, -1.330498, -2.994919, 1, 0, 0, 1, 1,
-0.3841923, 0.6029731, -0.4614273, 1, 0, 0, 1, 1,
-0.3837354, 0.2066009, -0.1102397, 1, 0, 0, 1, 1,
-0.3827214, 0.8482641, -0.5442737, 1, 0, 0, 1, 1,
-0.3820733, -1.132517, -0.7788703, 0, 0, 0, 1, 1,
-0.3792273, 0.246592, -0.6092731, 0, 0, 0, 1, 1,
-0.3764524, 0.4250378, -1.732733, 0, 0, 0, 1, 1,
-0.3752596, 0.3769543, -3.043584, 0, 0, 0, 1, 1,
-0.3744217, 0.1560741, -0.5091116, 0, 0, 0, 1, 1,
-0.3742129, -0.07481501, -2.260497, 0, 0, 0, 1, 1,
-0.3611686, -0.1903106, -1.131258, 0, 0, 0, 1, 1,
-0.359603, -2.280811, -3.09232, 1, 1, 1, 1, 1,
-0.3583346, 1.773097, 1.639615, 1, 1, 1, 1, 1,
-0.3536205, -0.3073113, -2.299903, 1, 1, 1, 1, 1,
-0.3530905, -2.068465, -2.546232, 1, 1, 1, 1, 1,
-0.3497063, 0.637614, -1.279078, 1, 1, 1, 1, 1,
-0.3478712, -1.157854, -2.716067, 1, 1, 1, 1, 1,
-0.347758, -0.1211669, -1.15865, 1, 1, 1, 1, 1,
-0.3399835, 1.766167, 1.383643, 1, 1, 1, 1, 1,
-0.3292015, -0.6963297, -1.600433, 1, 1, 1, 1, 1,
-0.3288633, 0.8314425, 0.5927547, 1, 1, 1, 1, 1,
-0.3270866, -0.909381, -1.379107, 1, 1, 1, 1, 1,
-0.3266748, -0.6389085, -3.545588, 1, 1, 1, 1, 1,
-0.3226734, 0.1275173, -1.29229, 1, 1, 1, 1, 1,
-0.3219756, -0.6254264, -1.45009, 1, 1, 1, 1, 1,
-0.3203324, -0.2837903, -2.877299, 1, 1, 1, 1, 1,
-0.3164015, -0.4680352, -3.736521, 0, 0, 1, 1, 1,
-0.3075246, -1.296327, -3.564957, 1, 0, 0, 1, 1,
-0.3070083, -0.02230005, -3.347816, 1, 0, 0, 1, 1,
-0.3054397, -0.3056488, -1.673417, 1, 0, 0, 1, 1,
-0.3052259, 0.402083, -0.8044536, 1, 0, 0, 1, 1,
-0.3000979, -1.098407, -1.909151, 1, 0, 0, 1, 1,
-0.2946226, -0.6326625, -1.42806, 0, 0, 0, 1, 1,
-0.2945252, 1.333357, -1.491508, 0, 0, 0, 1, 1,
-0.2929841, 0.601935, 0.9754511, 0, 0, 0, 1, 1,
-0.2921465, -0.6548319, -2.736427, 0, 0, 0, 1, 1,
-0.2878287, -0.608886, -2.941628, 0, 0, 0, 1, 1,
-0.2872737, -1.322529, -3.352587, 0, 0, 0, 1, 1,
-0.2663207, 0.1772149, -0.01819412, 0, 0, 0, 1, 1,
-0.2598148, -0.2171704, -0.6526291, 1, 1, 1, 1, 1,
-0.2586108, 1.807971, -0.4977512, 1, 1, 1, 1, 1,
-0.2582374, 1.026164, 0.3408901, 1, 1, 1, 1, 1,
-0.2575585, 0.4954479, -0.0006053977, 1, 1, 1, 1, 1,
-0.2518576, 1.091663, 1.115191, 1, 1, 1, 1, 1,
-0.2490995, 1.752187, 1.52771, 1, 1, 1, 1, 1,
-0.2468861, 0.116662, -1.146875, 1, 1, 1, 1, 1,
-0.2462936, 0.1322825, -1.217687, 1, 1, 1, 1, 1,
-0.2443608, 1.033777, -1.172147, 1, 1, 1, 1, 1,
-0.2398119, -1.218488, -3.256112, 1, 1, 1, 1, 1,
-0.2395511, 1.027526, -0.04353333, 1, 1, 1, 1, 1,
-0.2373501, 0.0785948, -1.018232, 1, 1, 1, 1, 1,
-0.2371776, -0.5862672, -2.253895, 1, 1, 1, 1, 1,
-0.2360781, -0.1824236, -0.4354492, 1, 1, 1, 1, 1,
-0.2347073, -1.919863, -2.924951, 1, 1, 1, 1, 1,
-0.2310589, -1.589141, -3.653422, 0, 0, 1, 1, 1,
-0.2291098, 0.8855425, 0.4447803, 1, 0, 0, 1, 1,
-0.2258685, 0.3072157, -0.1058844, 1, 0, 0, 1, 1,
-0.2247549, 1.009848, -0.1887673, 1, 0, 0, 1, 1,
-0.2226639, 0.727259, -0.2354534, 1, 0, 0, 1, 1,
-0.2207177, 0.6802673, 0.2462583, 1, 0, 0, 1, 1,
-0.2184316, 0.3931838, -0.6977292, 0, 0, 0, 1, 1,
-0.2181797, -0.4149285, -2.620956, 0, 0, 0, 1, 1,
-0.2176802, 0.3157532, 1.079542, 0, 0, 0, 1, 1,
-0.212789, -0.1389144, -1.997117, 0, 0, 0, 1, 1,
-0.2110223, -1.935932, -3.448354, 0, 0, 0, 1, 1,
-0.2088858, -1.242641, -1.423476, 0, 0, 0, 1, 1,
-0.2067562, -0.2884832, -3.581621, 0, 0, 0, 1, 1,
-0.2058403, 1.361076, -1.959191, 1, 1, 1, 1, 1,
-0.205145, 1.342011, -1.946005, 1, 1, 1, 1, 1,
-0.2028584, 0.07899963, 1.312712, 1, 1, 1, 1, 1,
-0.2012299, 2.150454, 1.968423, 1, 1, 1, 1, 1,
-0.2011414, -0.3958661, -2.085384, 1, 1, 1, 1, 1,
-0.198466, -0.9786679, -4.867807, 1, 1, 1, 1, 1,
-0.1984024, -0.2772867, -2.821064, 1, 1, 1, 1, 1,
-0.1952094, -2.203931, -5.350724, 1, 1, 1, 1, 1,
-0.1935325, 0.2199696, -0.6113874, 1, 1, 1, 1, 1,
-0.193272, 1.642675, -1.253189, 1, 1, 1, 1, 1,
-0.1882725, 0.6329053, -2.348848, 1, 1, 1, 1, 1,
-0.1859796, 0.2308308, -0.8587278, 1, 1, 1, 1, 1,
-0.1848904, 0.9415902, 0.3331127, 1, 1, 1, 1, 1,
-0.1847214, -0.5651315, -2.94535, 1, 1, 1, 1, 1,
-0.1827089, 0.3323384, 0.6208984, 1, 1, 1, 1, 1,
-0.1772768, -0.5782508, -2.48525, 0, 0, 1, 1, 1,
-0.1764079, -1.705745, -2.420633, 1, 0, 0, 1, 1,
-0.17561, -0.1828809, -2.171225, 1, 0, 0, 1, 1,
-0.1728853, 2.816795, -0.4741486, 1, 0, 0, 1, 1,
-0.1710781, -2.040618, -4.945539, 1, 0, 0, 1, 1,
-0.1537439, -0.9809961, -4.701931, 1, 0, 0, 1, 1,
-0.1495199, -0.7905011, -1.095368, 0, 0, 0, 1, 1,
-0.1480569, -0.0956853, -1.721329, 0, 0, 0, 1, 1,
-0.1459092, -0.5285319, -3.774111, 0, 0, 0, 1, 1,
-0.1425672, 2.553226, 0.7843609, 0, 0, 0, 1, 1,
-0.1404959, -1.945596, -3.850457, 0, 0, 0, 1, 1,
-0.1396778, -0.2313504, -3.123784, 0, 0, 0, 1, 1,
-0.1392814, -0.6133272, -4.240447, 0, 0, 0, 1, 1,
-0.1378814, 1.016862, -1.328381, 1, 1, 1, 1, 1,
-0.135696, -0.3951999, -4.162048, 1, 1, 1, 1, 1,
-0.1316733, -0.7338865, -2.447019, 1, 1, 1, 1, 1,
-0.1289953, 0.6091542, -1.031585, 1, 1, 1, 1, 1,
-0.1262771, -0.1119441, -2.365937, 1, 1, 1, 1, 1,
-0.1244683, -1.061315, -3.181212, 1, 1, 1, 1, 1,
-0.1237205, -0.3148365, -3.414375, 1, 1, 1, 1, 1,
-0.1159341, -0.7759054, -5.923399, 1, 1, 1, 1, 1,
-0.1132763, 0.1103915, -1.032648, 1, 1, 1, 1, 1,
-0.1124556, -1.165248, -5.276354, 1, 1, 1, 1, 1,
-0.1121972, -0.8091676, -2.206109, 1, 1, 1, 1, 1,
-0.1086213, 0.1176706, -0.1254268, 1, 1, 1, 1, 1,
-0.1077147, 0.0050812, -2.217688, 1, 1, 1, 1, 1,
-0.1069287, -1.747829, -3.206011, 1, 1, 1, 1, 1,
-0.1057273, 0.6876511, -0.06837077, 1, 1, 1, 1, 1,
-0.1051132, -0.2578942, -4.194654, 0, 0, 1, 1, 1,
-0.1046496, 0.7862655, -0.2225488, 1, 0, 0, 1, 1,
-0.1045087, 0.185941, 0.4299215, 1, 0, 0, 1, 1,
-0.1043615, 1.175105, 0.4248713, 1, 0, 0, 1, 1,
-0.103967, -0.1784884, -4.192276, 1, 0, 0, 1, 1,
-0.103691, 1.208855, 0.1866427, 1, 0, 0, 1, 1,
-0.09528425, -0.4221172, -2.745628, 0, 0, 0, 1, 1,
-0.09304083, 0.2640136, 0.9895133, 0, 0, 0, 1, 1,
-0.09270035, -1.00585, -3.768365, 0, 0, 0, 1, 1,
-0.09236332, -0.7695185, -3.387448, 0, 0, 0, 1, 1,
-0.09029649, -1.101044, -2.825461, 0, 0, 0, 1, 1,
-0.08929738, 0.4431629, -1.449334, 0, 0, 0, 1, 1,
-0.08794205, -1.119843, -1.472872, 0, 0, 0, 1, 1,
-0.08772486, 1.542736, 0.2316532, 1, 1, 1, 1, 1,
-0.08765008, 0.3996813, -1.540915, 1, 1, 1, 1, 1,
-0.08708213, -1.16469, -3.885159, 1, 1, 1, 1, 1,
-0.07956982, 0.299116, -0.02672467, 1, 1, 1, 1, 1,
-0.07925843, -0.4529759, -5.387406, 1, 1, 1, 1, 1,
-0.07698065, -2.521267, -2.908547, 1, 1, 1, 1, 1,
-0.07611471, 0.6012449, -1.180126, 1, 1, 1, 1, 1,
-0.07564878, 0.3871524, -0.3778779, 1, 1, 1, 1, 1,
-0.07422692, 0.5169743, -2.327315, 1, 1, 1, 1, 1,
-0.06144713, 0.4577092, 0.04002734, 1, 1, 1, 1, 1,
-0.05704756, -0.2740258, -4.663114, 1, 1, 1, 1, 1,
-0.05594793, 1.313344, 0.1114516, 1, 1, 1, 1, 1,
-0.05506619, -0.2586972, -3.346349, 1, 1, 1, 1, 1,
-0.05333203, 0.7449151, -0.5291085, 1, 1, 1, 1, 1,
-0.05022426, -0.5181262, -3.076022, 1, 1, 1, 1, 1,
-0.04998926, -0.2577515, 0.07157648, 0, 0, 1, 1, 1,
-0.04779001, -0.6073345, -2.042356, 1, 0, 0, 1, 1,
-0.04666199, -1.030493, -3.05018, 1, 0, 0, 1, 1,
-0.04623364, 0.7060348, -2.907222, 1, 0, 0, 1, 1,
-0.04397899, 1.520025, -0.1095125, 1, 0, 0, 1, 1,
-0.04294846, -0.09764159, -2.418162, 1, 0, 0, 1, 1,
-0.0418978, -0.3413574, -2.469971, 0, 0, 0, 1, 1,
-0.04005869, -1.748864, -4.052879, 0, 0, 0, 1, 1,
-0.03908461, -0.7241142, -4.584527, 0, 0, 0, 1, 1,
-0.03706524, -0.5884513, -5.819758, 0, 0, 0, 1, 1,
-0.02859452, 0.01398955, 0.05843703, 0, 0, 0, 1, 1,
-0.02736064, -0.4455975, -2.028856, 0, 0, 0, 1, 1,
-0.02701642, 0.9395068, -1.446047, 0, 0, 0, 1, 1,
-0.0241425, -0.2521309, -4.622394, 1, 1, 1, 1, 1,
-0.02251446, -1.691239, -4.472263, 1, 1, 1, 1, 1,
-0.02153305, -0.4756697, -2.923893, 1, 1, 1, 1, 1,
-0.02090538, 0.3402923, 0.1134809, 1, 1, 1, 1, 1,
-0.01886474, 0.9439911, 0.2909284, 1, 1, 1, 1, 1,
-0.01530711, 0.8783786, 1.235103, 1, 1, 1, 1, 1,
-0.01325105, 0.2308799, -0.06037736, 1, 1, 1, 1, 1,
-0.01237873, -2.604401, -4.883765, 1, 1, 1, 1, 1,
-0.009598964, 1.347229, -0.6267027, 1, 1, 1, 1, 1,
-0.009447091, -0.477947, -3.945178, 1, 1, 1, 1, 1,
-0.0041924, -0.031112, -3.0512, 1, 1, 1, 1, 1,
-0.003685895, 0.4764845, -1.929834, 1, 1, 1, 1, 1,
-0.003104934, 0.408313, 0.4350658, 1, 1, 1, 1, 1,
-0.002869561, -1.617953, -3.372026, 1, 1, 1, 1, 1,
-0.002264561, -0.2526782, -2.585384, 1, 1, 1, 1, 1,
0.0008580599, 1.035962, -0.1794575, 0, 0, 1, 1, 1,
0.003753595, 0.1193282, 0.2751729, 1, 0, 0, 1, 1,
0.004484508, 0.8044985, 1.526066, 1, 0, 0, 1, 1,
0.007716939, -0.7947736, 2.964333, 1, 0, 0, 1, 1,
0.01227482, -1.198534, 3.577258, 1, 0, 0, 1, 1,
0.01364297, -0.2966929, 3.987529, 1, 0, 0, 1, 1,
0.01423409, 0.2362583, -0.4522466, 0, 0, 0, 1, 1,
0.01654716, -1.485569, 1.925417, 0, 0, 0, 1, 1,
0.01669894, 0.02280875, 1.079738, 0, 0, 0, 1, 1,
0.02197143, 0.740213, 0.7926228, 0, 0, 0, 1, 1,
0.02222267, 0.4359927, 0.339315, 0, 0, 0, 1, 1,
0.0266372, -0.7488634, 3.428207, 0, 0, 0, 1, 1,
0.03907875, -0.007448596, 1.72391, 0, 0, 0, 1, 1,
0.0399057, -0.05097821, 1.554457, 1, 1, 1, 1, 1,
0.04156342, 0.3407842, 0.2496097, 1, 1, 1, 1, 1,
0.04272716, 0.469581, -1.732889, 1, 1, 1, 1, 1,
0.04347289, -0.5278398, 1.475472, 1, 1, 1, 1, 1,
0.04455692, -0.8909469, 2.101608, 1, 1, 1, 1, 1,
0.05360752, 1.51874, -0.9312133, 1, 1, 1, 1, 1,
0.05639715, -0.7449598, 2.253135, 1, 1, 1, 1, 1,
0.05802189, 0.3115952, 0.6510789, 1, 1, 1, 1, 1,
0.06051718, -0.03431904, -0.08643702, 1, 1, 1, 1, 1,
0.0640385, -0.729633, 3.297765, 1, 1, 1, 1, 1,
0.06637451, 1.116964, 1.088856, 1, 1, 1, 1, 1,
0.06804848, 0.6595318, 0.4518833, 1, 1, 1, 1, 1,
0.07084227, 1.25456, 0.9319412, 1, 1, 1, 1, 1,
0.08085813, -0.6603993, 3.349638, 1, 1, 1, 1, 1,
0.08143719, -0.05896853, 0.6048735, 1, 1, 1, 1, 1,
0.08249747, 1.776553, 0.797971, 0, 0, 1, 1, 1,
0.08923237, -0.9940057, 4.434673, 1, 0, 0, 1, 1,
0.0923557, 0.1232507, 2.111948, 1, 0, 0, 1, 1,
0.09333485, 2.632126, -0.6786577, 1, 0, 0, 1, 1,
0.0952921, 0.2374662, -0.07021966, 1, 0, 0, 1, 1,
0.0965987, -0.2367412, 4.69315, 1, 0, 0, 1, 1,
0.09777158, -0.03034617, 0.4426539, 0, 0, 0, 1, 1,
0.09778611, -0.9147463, 3.584398, 0, 0, 0, 1, 1,
0.09862462, 0.08210522, -1.170702, 0, 0, 0, 1, 1,
0.1017717, -0.01993791, 0.1674366, 0, 0, 0, 1, 1,
0.1130434, 1.858963, -0.672713, 0, 0, 0, 1, 1,
0.1226151, -2.784008, 2.96906, 0, 0, 0, 1, 1,
0.1235045, -0.1911921, 3.334478, 0, 0, 0, 1, 1,
0.1272815, -0.09734428, 0.5022942, 1, 1, 1, 1, 1,
0.1276314, -0.3304092, 2.797175, 1, 1, 1, 1, 1,
0.1291171, 0.2775991, 0.2626871, 1, 1, 1, 1, 1,
0.1310174, -0.5229235, 3.958282, 1, 1, 1, 1, 1,
0.1362929, -0.4209699, 4.224785, 1, 1, 1, 1, 1,
0.1371756, 0.1980975, 1.126829, 1, 1, 1, 1, 1,
0.139956, -0.671061, 3.127971, 1, 1, 1, 1, 1,
0.1412629, -0.2775466, 2.535442, 1, 1, 1, 1, 1,
0.14303, 0.2908958, -0.3964043, 1, 1, 1, 1, 1,
0.1455609, -0.640925, 4.348433, 1, 1, 1, 1, 1,
0.1562719, -0.2981489, 3.953312, 1, 1, 1, 1, 1,
0.1563403, -0.4116895, 2.774749, 1, 1, 1, 1, 1,
0.1576652, 0.741616, -2.618088, 1, 1, 1, 1, 1,
0.1579629, -2.581126, 2.400249, 1, 1, 1, 1, 1,
0.1593172, -0.9287041, 3.530662, 1, 1, 1, 1, 1,
0.1620457, 1.861084, 0.8977404, 0, 0, 1, 1, 1,
0.1635215, -0.412336, 2.506537, 1, 0, 0, 1, 1,
0.1682878, 2.157977, -0.08172541, 1, 0, 0, 1, 1,
0.1684862, -0.5561376, 1.400174, 1, 0, 0, 1, 1,
0.1691819, -1.85686, 2.244484, 1, 0, 0, 1, 1,
0.170673, 0.9812511, 1.004387, 1, 0, 0, 1, 1,
0.175909, 0.6150991, 1.041238, 0, 0, 0, 1, 1,
0.179606, 0.05636362, 2.845143, 0, 0, 0, 1, 1,
0.1851725, 0.1076257, 0.02118245, 0, 0, 0, 1, 1,
0.1887483, -0.1529417, 1.526912, 0, 0, 0, 1, 1,
0.1887873, 0.5997673, 0.14891, 0, 0, 0, 1, 1,
0.1893999, -0.7610919, 2.848173, 0, 0, 0, 1, 1,
0.1908482, -0.3318525, 2.787108, 0, 0, 0, 1, 1,
0.1916732, -0.1522478, 2.523119, 1, 1, 1, 1, 1,
0.1939625, -0.7251166, 2.85516, 1, 1, 1, 1, 1,
0.1997312, -0.304644, 1.762628, 1, 1, 1, 1, 1,
0.1997496, 2.366843, -0.1136106, 1, 1, 1, 1, 1,
0.2049966, 0.77903, -0.9645734, 1, 1, 1, 1, 1,
0.2053802, 0.8425666, -1.289746, 1, 1, 1, 1, 1,
0.2124529, 1.847104, -1.56243, 1, 1, 1, 1, 1,
0.2140631, -1.610242, 3.205434, 1, 1, 1, 1, 1,
0.2162118, 1.94428, -0.0418671, 1, 1, 1, 1, 1,
0.2198346, 0.1125987, 0.7511816, 1, 1, 1, 1, 1,
0.2267139, -0.5930286, 2.362755, 1, 1, 1, 1, 1,
0.2281566, 1.517791, 2.135442, 1, 1, 1, 1, 1,
0.2363833, 0.4736833, -0.3592359, 1, 1, 1, 1, 1,
0.236468, -0.6940062, 1.800692, 1, 1, 1, 1, 1,
0.2369743, 1.116382, 0.08875829, 1, 1, 1, 1, 1,
0.2378644, -0.5669343, 3.420044, 0, 0, 1, 1, 1,
0.2387182, -0.1478834, 1.369151, 1, 0, 0, 1, 1,
0.2413418, 0.1475516, 0.829527, 1, 0, 0, 1, 1,
0.2418392, -0.2993853, 3.319171, 1, 0, 0, 1, 1,
0.2420294, -0.6870544, 3.506177, 1, 0, 0, 1, 1,
0.2423083, 0.9818406, -0.4385351, 1, 0, 0, 1, 1,
0.2423454, -0.8576904, 1.967869, 0, 0, 0, 1, 1,
0.2425595, 0.4383388, 0.1147773, 0, 0, 0, 1, 1,
0.2428746, -0.2345103, 1.374937, 0, 0, 0, 1, 1,
0.2439068, -0.9628391, 3.080348, 0, 0, 0, 1, 1,
0.2440571, -0.8350992, 1.328137, 0, 0, 0, 1, 1,
0.2467794, -0.8581021, 1.498757, 0, 0, 0, 1, 1,
0.2525584, -2.119226, 2.562629, 0, 0, 0, 1, 1,
0.2551065, -1.731806, 1.735077, 1, 1, 1, 1, 1,
0.2552436, 0.4679701, 0.8463731, 1, 1, 1, 1, 1,
0.2651456, -0.2314226, 2.410462, 1, 1, 1, 1, 1,
0.2654077, -0.2124915, 2.322439, 1, 1, 1, 1, 1,
0.2680942, -0.8643426, 3.636746, 1, 1, 1, 1, 1,
0.2703545, 0.472771, 0.4718272, 1, 1, 1, 1, 1,
0.2738191, -0.3137118, 2.753772, 1, 1, 1, 1, 1,
0.2752278, 0.1234099, 1.083182, 1, 1, 1, 1, 1,
0.2753543, -0.3994765, 2.431802, 1, 1, 1, 1, 1,
0.2764827, -1.067267, 4.974814, 1, 1, 1, 1, 1,
0.2849747, -0.1576097, 0.8548086, 1, 1, 1, 1, 1,
0.290379, 0.4512006, 2.083913, 1, 1, 1, 1, 1,
0.2917526, -0.3848415, 3.141959, 1, 1, 1, 1, 1,
0.2929824, 0.2273556, 0.5529739, 1, 1, 1, 1, 1,
0.305771, 0.6026254, 0.4030008, 1, 1, 1, 1, 1,
0.3102154, -0.2858204, 3.57974, 0, 0, 1, 1, 1,
0.3112595, 0.6310245, 1.481649, 1, 0, 0, 1, 1,
0.3121649, 0.7426076, 1.505469, 1, 0, 0, 1, 1,
0.3154591, -1.346315, 2.712259, 1, 0, 0, 1, 1,
0.3171783, -1.25627, 2.555131, 1, 0, 0, 1, 1,
0.3194473, 0.6676817, -0.320038, 1, 0, 0, 1, 1,
0.3216549, 2.132427, -0.9924641, 0, 0, 0, 1, 1,
0.3220724, -0.8442068, 2.737641, 0, 0, 0, 1, 1,
0.323012, -1.963416, 2.643081, 0, 0, 0, 1, 1,
0.3362838, 0.6935486, -0.1000735, 0, 0, 0, 1, 1,
0.3384404, -1.269038, 2.3302, 0, 0, 0, 1, 1,
0.3426724, -1.861682, 3.943937, 0, 0, 0, 1, 1,
0.3458612, 0.241642, 1.7204, 0, 0, 0, 1, 1,
0.3464354, -1.065462, 3.567747, 1, 1, 1, 1, 1,
0.3469247, 0.3990766, 0.4496787, 1, 1, 1, 1, 1,
0.3491492, 0.5614183, -0.4907905, 1, 1, 1, 1, 1,
0.3492785, -1.530865, 3.095906, 1, 1, 1, 1, 1,
0.3512797, -0.4629268, 3.003236, 1, 1, 1, 1, 1,
0.3519674, -1.379243, 2.159511, 1, 1, 1, 1, 1,
0.3557881, -0.1714592, 3.287026, 1, 1, 1, 1, 1,
0.3575248, -0.8569324, 2.265758, 1, 1, 1, 1, 1,
0.3606068, 1.114005, -0.04681329, 1, 1, 1, 1, 1,
0.3614018, 0.1000158, 1.532544, 1, 1, 1, 1, 1,
0.3630505, 0.6832788, 1.800927, 1, 1, 1, 1, 1,
0.3630841, 0.01799236, 1.2737, 1, 1, 1, 1, 1,
0.3677039, -0.5446138, 1.480023, 1, 1, 1, 1, 1,
0.3703599, -0.02624001, 1.284888, 1, 1, 1, 1, 1,
0.3707542, -1.210926, 3.683016, 1, 1, 1, 1, 1,
0.3742536, -1.317686, 2.139544, 0, 0, 1, 1, 1,
0.3768601, 1.516458, 0.6542801, 1, 0, 0, 1, 1,
0.3803556, -1.100618, 1.961274, 1, 0, 0, 1, 1,
0.3804276, -1.912516, 2.668846, 1, 0, 0, 1, 1,
0.3835752, -0.4539337, 3.370926, 1, 0, 0, 1, 1,
0.3885013, -1.276074, 2.692647, 1, 0, 0, 1, 1,
0.3889089, 2.024039, -0.8687814, 0, 0, 0, 1, 1,
0.3998235, -0.7902779, 2.671478, 0, 0, 0, 1, 1,
0.4001765, 0.5505124, 2.915934, 0, 0, 0, 1, 1,
0.4015264, -0.4284968, 1.786471, 0, 0, 0, 1, 1,
0.4052067, -0.1956519, 2.704239, 0, 0, 0, 1, 1,
0.4093212, -0.262973, 3.922024, 0, 0, 0, 1, 1,
0.4176667, 0.6883914, 1.32424, 0, 0, 0, 1, 1,
0.4180138, -1.686891, 4.395012, 1, 1, 1, 1, 1,
0.4186611, -0.3749044, 1.262773, 1, 1, 1, 1, 1,
0.4188611, -0.4008476, 1.292027, 1, 1, 1, 1, 1,
0.4195626, 1.152847, 1.646588, 1, 1, 1, 1, 1,
0.4232298, -1.744792, 3.284471, 1, 1, 1, 1, 1,
0.4265117, -0.5438284, 2.367831, 1, 1, 1, 1, 1,
0.4281664, -0.4192459, 2.081644, 1, 1, 1, 1, 1,
0.4282299, 0.1709321, -1.020486, 1, 1, 1, 1, 1,
0.4398112, -0.635507, 2.373731, 1, 1, 1, 1, 1,
0.4433069, -0.9291218, 2.207973, 1, 1, 1, 1, 1,
0.443417, 1.250605, 1.201336, 1, 1, 1, 1, 1,
0.4461211, 0.481569, 0.6533031, 1, 1, 1, 1, 1,
0.4504626, -0.1018147, 0.9306832, 1, 1, 1, 1, 1,
0.4515062, 1.004911, 0.3110868, 1, 1, 1, 1, 1,
0.4536327, 1.103579, -0.642662, 1, 1, 1, 1, 1,
0.4575138, 0.2886554, 0.9620376, 0, 0, 1, 1, 1,
0.4575912, -1.750632, 2.223888, 1, 0, 0, 1, 1,
0.4602031, -0.7363828, -0.1803235, 1, 0, 0, 1, 1,
0.4647788, -0.05354105, 1.092326, 1, 0, 0, 1, 1,
0.4663883, 0.2343664, 1.427144, 1, 0, 0, 1, 1,
0.4758458, 0.8235077, 0.09719374, 1, 0, 0, 1, 1,
0.4765738, -0.5907121, 1.760877, 0, 0, 0, 1, 1,
0.4802091, 0.4531655, 0.8269656, 0, 0, 0, 1, 1,
0.4825778, 1.078176, -0.9134139, 0, 0, 0, 1, 1,
0.487538, -0.0730906, 1.775813, 0, 0, 0, 1, 1,
0.4883261, -0.8322079, 2.654762, 0, 0, 0, 1, 1,
0.4933185, 0.02307036, 0.8806498, 0, 0, 0, 1, 1,
0.5014269, -0.6660403, 2.622314, 0, 0, 0, 1, 1,
0.5015852, 0.6821833, 0.8865282, 1, 1, 1, 1, 1,
0.5025016, -0.06025783, 1.372803, 1, 1, 1, 1, 1,
0.5059885, -0.1918354, 0.5087615, 1, 1, 1, 1, 1,
0.5128521, 0.0179521, 1.60488, 1, 1, 1, 1, 1,
0.5148946, -1.769679, 4.496034, 1, 1, 1, 1, 1,
0.5235859, -0.1472602, 2.446763, 1, 1, 1, 1, 1,
0.5330496, -2.090821, 3.076863, 1, 1, 1, 1, 1,
0.534174, 0.7434942, 1.084354, 1, 1, 1, 1, 1,
0.5373967, 1.027908, 1.032109, 1, 1, 1, 1, 1,
0.5377834, 0.7757767, -0.5489007, 1, 1, 1, 1, 1,
0.5430207, 0.2692704, -0.0252709, 1, 1, 1, 1, 1,
0.5431168, 0.4795049, 0.1782349, 1, 1, 1, 1, 1,
0.5442396, -1.643383, 2.380789, 1, 1, 1, 1, 1,
0.545659, 0.3848314, -0.6158051, 1, 1, 1, 1, 1,
0.5467433, -0.3979238, 2.947638, 1, 1, 1, 1, 1,
0.5506731, 0.01596972, 1.490807, 0, 0, 1, 1, 1,
0.5557565, 0.9086054, 1.131734, 1, 0, 0, 1, 1,
0.5567172, -2.314015, 4.246674, 1, 0, 0, 1, 1,
0.5583189, -0.6024383, 2.102198, 1, 0, 0, 1, 1,
0.5610511, 1.038741, -0.0916607, 1, 0, 0, 1, 1,
0.5714766, -0.2459066, 3.266639, 1, 0, 0, 1, 1,
0.5741707, 0.581092, -2.168298, 0, 0, 0, 1, 1,
0.5766543, 0.04247153, 0.06274915, 0, 0, 0, 1, 1,
0.5777697, 0.881072, 0.2085993, 0, 0, 0, 1, 1,
0.5968695, -0.5988526, 1.622124, 0, 0, 0, 1, 1,
0.6045413, -0.7540907, 1.462987, 0, 0, 0, 1, 1,
0.6060717, 0.1780351, 0.6161647, 0, 0, 0, 1, 1,
0.60614, -0.8691083, 2.575289, 0, 0, 0, 1, 1,
0.6067775, -0.3756975, 0.94164, 1, 1, 1, 1, 1,
0.6104327, 1.505537, 0.7263072, 1, 1, 1, 1, 1,
0.6181034, 1.239512, 0.04246496, 1, 1, 1, 1, 1,
0.6208568, 0.7586386, -0.5020867, 1, 1, 1, 1, 1,
0.6226572, -0.09331226, 2.757359, 1, 1, 1, 1, 1,
0.6244498, 0.1661109, 0.7095267, 1, 1, 1, 1, 1,
0.6253377, -0.5404546, 0.6767954, 1, 1, 1, 1, 1,
0.630214, 0.7005556, 0.6478524, 1, 1, 1, 1, 1,
0.6350954, 0.9432128, -0.1321337, 1, 1, 1, 1, 1,
0.6369752, -0.3493778, 1.932999, 1, 1, 1, 1, 1,
0.6425809, 0.7373882, -0.5523887, 1, 1, 1, 1, 1,
0.6453758, -0.3792453, 2.375433, 1, 1, 1, 1, 1,
0.6480575, -1.568485, 3.257256, 1, 1, 1, 1, 1,
0.6494616, 1.824316, 2.016623, 1, 1, 1, 1, 1,
0.6532055, 0.3467103, -0.0575826, 1, 1, 1, 1, 1,
0.6559311, 0.7898903, 1.913615, 0, 0, 1, 1, 1,
0.6601924, -0.3564342, 1.354583, 1, 0, 0, 1, 1,
0.6615691, -0.1997449, 1.816091, 1, 0, 0, 1, 1,
0.6618073, 0.2738628, 2.705305, 1, 0, 0, 1, 1,
0.6620743, 0.1909703, 2.297071, 1, 0, 0, 1, 1,
0.6622704, -0.573549, 1.275577, 1, 0, 0, 1, 1,
0.6632605, 0.3368851, 0.9260783, 0, 0, 0, 1, 1,
0.6676219, 0.6886443, 0.7786212, 0, 0, 0, 1, 1,
0.6693999, -0.4270009, 1.049794, 0, 0, 0, 1, 1,
0.6741784, -1.052624, 3.285539, 0, 0, 0, 1, 1,
0.681359, -0.06647992, -0.2230528, 0, 0, 0, 1, 1,
0.682342, 0.1231105, 1.536656, 0, 0, 0, 1, 1,
0.6846292, -0.5980563, 3.435363, 0, 0, 0, 1, 1,
0.6853832, 0.3888395, 1.15084, 1, 1, 1, 1, 1,
0.6903276, -0.9127668, 4.206369, 1, 1, 1, 1, 1,
0.6911634, -1.121409, 4.325331, 1, 1, 1, 1, 1,
0.6922153, 2.427867, 0.5307927, 1, 1, 1, 1, 1,
0.6929496, 0.8934047, 0.6287168, 1, 1, 1, 1, 1,
0.6930505, -1.53697, 2.620072, 1, 1, 1, 1, 1,
0.6948472, 2.052217, 0.9319177, 1, 1, 1, 1, 1,
0.7000323, -0.9847701, 0.915531, 1, 1, 1, 1, 1,
0.7040783, -0.3284492, 1.230191, 1, 1, 1, 1, 1,
0.7041987, 0.8160016, 2.116701, 1, 1, 1, 1, 1,
0.7070807, -0.02119321, 3.23874, 1, 1, 1, 1, 1,
0.7096452, 0.3038964, 1.293745, 1, 1, 1, 1, 1,
0.7126946, 0.1449435, 2.905575, 1, 1, 1, 1, 1,
0.7127205, 0.7064028, 1.65895, 1, 1, 1, 1, 1,
0.7142019, 0.8873914, 1.00657, 1, 1, 1, 1, 1,
0.7148278, -0.00851441, 1.476467, 0, 0, 1, 1, 1,
0.7150655, -1.365222, 1.986938, 1, 0, 0, 1, 1,
0.7212144, 0.1604833, 0.8520629, 1, 0, 0, 1, 1,
0.7216798, 0.2614982, 0.1144857, 1, 0, 0, 1, 1,
0.7248087, -1.113119, 2.45046, 1, 0, 0, 1, 1,
0.7291106, -1.029304, 1.681497, 1, 0, 0, 1, 1,
0.7360704, -0.9958315, 1.877491, 0, 0, 0, 1, 1,
0.7362181, 0.2924866, 0.3644504, 0, 0, 0, 1, 1,
0.7397528, -0.4833784, 3.133763, 0, 0, 0, 1, 1,
0.7406496, -1.361481, 2.955704, 0, 0, 0, 1, 1,
0.7425252, -1.132396, 1.791356, 0, 0, 0, 1, 1,
0.7475436, -0.1459156, 2.069457, 0, 0, 0, 1, 1,
0.7586524, -2.347556, 1.7905, 0, 0, 0, 1, 1,
0.7601283, 0.681735, -0.1977073, 1, 1, 1, 1, 1,
0.762714, 0.3760075, 0.793104, 1, 1, 1, 1, 1,
0.7646379, 0.7741678, 0.784069, 1, 1, 1, 1, 1,
0.7658316, 0.06601889, 2.522488, 1, 1, 1, 1, 1,
0.7669911, -1.305645, 2.41457, 1, 1, 1, 1, 1,
0.7674439, -1.213148, 2.246922, 1, 1, 1, 1, 1,
0.7704802, -1.130761, 1.128189, 1, 1, 1, 1, 1,
0.7758183, -0.6539606, 3.285775, 1, 1, 1, 1, 1,
0.778824, -1.79573, 1.177408, 1, 1, 1, 1, 1,
0.7803691, -0.5547196, 2.132163, 1, 1, 1, 1, 1,
0.7886783, -1.508209, 4.234634, 1, 1, 1, 1, 1,
0.7909625, -1.179707, 3.578177, 1, 1, 1, 1, 1,
0.7956045, -0.2830057, 1.330863, 1, 1, 1, 1, 1,
0.7970358, -0.19886, 1.481376, 1, 1, 1, 1, 1,
0.7978435, 1.203453, 0.3092808, 1, 1, 1, 1, 1,
0.7985152, -0.5095851, 2.163686, 0, 0, 1, 1, 1,
0.7989323, 0.1096909, -0.0220453, 1, 0, 0, 1, 1,
0.8091489, 0.04266306, 1.206539, 1, 0, 0, 1, 1,
0.8219042, -0.9759704, 3.178035, 1, 0, 0, 1, 1,
0.8273743, -0.006414083, 2.255265, 1, 0, 0, 1, 1,
0.8293761, 0.1368061, 1.200405, 1, 0, 0, 1, 1,
0.8303464, -1.132405, 1.364961, 0, 0, 0, 1, 1,
0.8303878, -0.5991912, 3.290195, 0, 0, 0, 1, 1,
0.8337502, 0.2057042, 0.4082758, 0, 0, 0, 1, 1,
0.836539, 1.926859, 2.135096, 0, 0, 0, 1, 1,
0.8383846, -0.3628, 1.49837, 0, 0, 0, 1, 1,
0.8395448, -0.7275878, 3.73178, 0, 0, 0, 1, 1,
0.8398973, -1.317647, 2.378223, 0, 0, 0, 1, 1,
0.8417854, 0.309921, 1.572869, 1, 1, 1, 1, 1,
0.8436674, 0.8356245, 0.7382691, 1, 1, 1, 1, 1,
0.8438734, 1.813165, 0.1277891, 1, 1, 1, 1, 1,
0.8510702, 0.7300353, 1.360663, 1, 1, 1, 1, 1,
0.8577273, -1.639315, 2.628043, 1, 1, 1, 1, 1,
0.8578804, 0.07796293, 3.094249, 1, 1, 1, 1, 1,
0.8585315, 0.05129293, 2.501456, 1, 1, 1, 1, 1,
0.8663766, -1.988054, 2.527982, 1, 1, 1, 1, 1,
0.8680574, 1.27455, -1.176429, 1, 1, 1, 1, 1,
0.8765958, -0.004942006, 2.012842, 1, 1, 1, 1, 1,
0.8838301, -0.4783786, 1.701188, 1, 1, 1, 1, 1,
0.8870109, 0.5802118, -0.6859776, 1, 1, 1, 1, 1,
0.8886604, 0.1521248, 2.456212, 1, 1, 1, 1, 1,
0.8919883, 0.7184727, 0.8889922, 1, 1, 1, 1, 1,
0.8928877, -0.4851685, 3.097123, 1, 1, 1, 1, 1,
0.8949736, 0.2694974, 0.4960281, 0, 0, 1, 1, 1,
0.8984769, -0.3229716, 2.458744, 1, 0, 0, 1, 1,
0.9013111, 2.437073, -0.9931811, 1, 0, 0, 1, 1,
0.9054479, -0.7104338, 0.2378458, 1, 0, 0, 1, 1,
0.9064088, 0.3242633, 1.157663, 1, 0, 0, 1, 1,
0.9068009, -0.6235625, 0.4674535, 1, 0, 0, 1, 1,
0.9125774, 1.084716, 1.419337, 0, 0, 0, 1, 1,
0.9168326, 0.1249748, 0.9037244, 0, 0, 0, 1, 1,
0.9245285, 1.483157, -0.3208437, 0, 0, 0, 1, 1,
0.9270855, -0.6158794, 2.588754, 0, 0, 0, 1, 1,
0.9275885, 0.8643963, 2.187855, 0, 0, 0, 1, 1,
0.9375082, -1.447242, 3.100761, 0, 0, 0, 1, 1,
0.9493181, -0.5401085, 0.9711784, 0, 0, 0, 1, 1,
0.9531261, 0.001286353, 2.170428, 1, 1, 1, 1, 1,
0.9557034, 0.9296283, 0.2364663, 1, 1, 1, 1, 1,
0.9603586, -0.1561139, 1.472722, 1, 1, 1, 1, 1,
0.9611639, 0.6162665, -0.7549731, 1, 1, 1, 1, 1,
0.9621414, 0.5833654, -1.332579, 1, 1, 1, 1, 1,
0.9634579, 0.01580616, 0.3720622, 1, 1, 1, 1, 1,
0.9706543, -1.052674, 1.401305, 1, 1, 1, 1, 1,
0.9899735, 1.542078, -0.01755959, 1, 1, 1, 1, 1,
0.9902898, 1.724244, 1.038047, 1, 1, 1, 1, 1,
0.9915023, -0.8293102, 2.949432, 1, 1, 1, 1, 1,
0.9920363, 0.1972255, 1.326884, 1, 1, 1, 1, 1,
0.9923792, 0.1186647, 0.7876204, 1, 1, 1, 1, 1,
0.9925849, 1.369695, 1.835056, 1, 1, 1, 1, 1,
0.9933106, -0.5394477, 2.718847, 1, 1, 1, 1, 1,
0.9937957, 1.275467, -0.5110296, 1, 1, 1, 1, 1,
0.9996124, 1.012048, 0.9374635, 0, 0, 1, 1, 1,
1.003584, -0.4485987, 2.99563, 1, 0, 0, 1, 1,
1.004689, -0.4845401, 0.5684595, 1, 0, 0, 1, 1,
1.00551, 0.1217078, -0.5918654, 1, 0, 0, 1, 1,
1.005559, -0.4303171, 1.834783, 1, 0, 0, 1, 1,
1.005664, -1.236677, 3.879988, 1, 0, 0, 1, 1,
1.012148, -0.7618356, 2.511623, 0, 0, 0, 1, 1,
1.02523, 0.4735621, -1.361585, 0, 0, 0, 1, 1,
1.025861, 0.6704687, 2.489487, 0, 0, 0, 1, 1,
1.035793, -1.786869, 0.4301703, 0, 0, 0, 1, 1,
1.03681, -0.1031797, 1.728676, 0, 0, 0, 1, 1,
1.041381, -0.303541, 1.451594, 0, 0, 0, 1, 1,
1.048386, -0.06979852, 1.091599, 0, 0, 0, 1, 1,
1.049011, -0.6398811, 3.804791, 1, 1, 1, 1, 1,
1.053935, 0.06362233, 0.8937634, 1, 1, 1, 1, 1,
1.06231, 0.3329439, 1.291093, 1, 1, 1, 1, 1,
1.0639, 0.2350365, 2.372446, 1, 1, 1, 1, 1,
1.064084, -0.4483983, 3.746415, 1, 1, 1, 1, 1,
1.069859, 0.6919414, 2.034527, 1, 1, 1, 1, 1,
1.070932, -0.304193, 0.336795, 1, 1, 1, 1, 1,
1.07485, 0.151757, 0.9427556, 1, 1, 1, 1, 1,
1.081769, -0.4441602, 1.234793, 1, 1, 1, 1, 1,
1.084723, -0.1184931, 0.7436368, 1, 1, 1, 1, 1,
1.085326, -0.3167771, 2.378498, 1, 1, 1, 1, 1,
1.088243, -1.091453, 3.424954, 1, 1, 1, 1, 1,
1.092247, -0.4287831, 2.130697, 1, 1, 1, 1, 1,
1.098114, 0.2609172, 1.446968, 1, 1, 1, 1, 1,
1.098531, 0.2683221, 1.921491, 1, 1, 1, 1, 1,
1.102854, -0.6840653, 2.845064, 0, 0, 1, 1, 1,
1.103334, -0.2197432, 1.478944, 1, 0, 0, 1, 1,
1.109871, 0.8991029, 0.7056662, 1, 0, 0, 1, 1,
1.120355, -0.1042023, 1.103641, 1, 0, 0, 1, 1,
1.121217, -0.2587015, 1.699082, 1, 0, 0, 1, 1,
1.122187, -1.574625, 2.15569, 1, 0, 0, 1, 1,
1.12235, 0.9733698, -0.367562, 0, 0, 0, 1, 1,
1.123475, 1.153187, 0.161912, 0, 0, 0, 1, 1,
1.136028, -1.06947, 2.498305, 0, 0, 0, 1, 1,
1.138467, 2.101195, -0.9025317, 0, 0, 0, 1, 1,
1.139884, 0.7904766, 1.443916, 0, 0, 0, 1, 1,
1.150472, -0.03899123, 0.7468892, 0, 0, 0, 1, 1,
1.152108, -0.8398062, 2.854299, 0, 0, 0, 1, 1,
1.152534, 1.26246, -0.5416006, 1, 1, 1, 1, 1,
1.158002, 1.334648, 2.357987, 1, 1, 1, 1, 1,
1.158421, 0.5642437, 0.1247858, 1, 1, 1, 1, 1,
1.16304, -0.7029296, 3.271237, 1, 1, 1, 1, 1,
1.166405, 0.9456277, 2.078615, 1, 1, 1, 1, 1,
1.176969, -0.3326448, 2.135148, 1, 1, 1, 1, 1,
1.183175, 0.3534482, 2.88717, 1, 1, 1, 1, 1,
1.186079, -0.8373985, 1.077566, 1, 1, 1, 1, 1,
1.186242, 0.916085, 2.578361, 1, 1, 1, 1, 1,
1.204135, -0.2140627, 2.081583, 1, 1, 1, 1, 1,
1.215981, 0.7754655, 2.270106, 1, 1, 1, 1, 1,
1.216102, -0.7119463, 3.103305, 1, 1, 1, 1, 1,
1.230405, 0.3448233, 0.9483758, 1, 1, 1, 1, 1,
1.233766, 0.7588612, 0.7446623, 1, 1, 1, 1, 1,
1.237996, 0.5746262, 1.772169, 1, 1, 1, 1, 1,
1.240419, 1.770821, 0.626348, 0, 0, 1, 1, 1,
1.246773, 1.474477, 1.495077, 1, 0, 0, 1, 1,
1.255109, 1.77132, 0.5892659, 1, 0, 0, 1, 1,
1.263191, -0.4800253, 2.775074, 1, 0, 0, 1, 1,
1.266964, 0.7348742, 1.052552, 1, 0, 0, 1, 1,
1.269271, 0.4906884, 0.9336145, 1, 0, 0, 1, 1,
1.27453, -0.2732191, 1.519804, 0, 0, 0, 1, 1,
1.277431, 0.8108509, 0.24032, 0, 0, 0, 1, 1,
1.279002, 1.839699, 0.3021624, 0, 0, 0, 1, 1,
1.28644, 0.2933768, 1.899839, 0, 0, 0, 1, 1,
1.297732, -0.9585131, 4.047615, 0, 0, 0, 1, 1,
1.30233, -0.3468418, 1.296169, 0, 0, 0, 1, 1,
1.30328, -0.444274, 0.9744639, 0, 0, 0, 1, 1,
1.303639, 0.6464579, 0.8608183, 1, 1, 1, 1, 1,
1.308248, 1.273949, -0.5899082, 1, 1, 1, 1, 1,
1.311902, -1.748946, 1.65761, 1, 1, 1, 1, 1,
1.318351, -0.5613739, 3.090949, 1, 1, 1, 1, 1,
1.322123, 0.2615186, 1.93366, 1, 1, 1, 1, 1,
1.32616, 0.5549806, -0.2511164, 1, 1, 1, 1, 1,
1.3295, -0.8176368, 1.89626, 1, 1, 1, 1, 1,
1.329613, 1.935569, 0.6406945, 1, 1, 1, 1, 1,
1.333249, -1.316601, 1.254335, 1, 1, 1, 1, 1,
1.350285, 0.7912347, 0.8408799, 1, 1, 1, 1, 1,
1.357687, 0.1411318, 2.521537, 1, 1, 1, 1, 1,
1.359539, 0.9307638, 3.004676, 1, 1, 1, 1, 1,
1.366621, 0.1768396, 1.554387, 1, 1, 1, 1, 1,
1.378442, 0.5453715, -1.283298, 1, 1, 1, 1, 1,
1.379422, 0.4475704, 1.110932, 1, 1, 1, 1, 1,
1.386694, -0.7073716, 3.793583, 0, 0, 1, 1, 1,
1.399497, -0.4244181, 1.570284, 1, 0, 0, 1, 1,
1.444302, -1.177982, 1.596651, 1, 0, 0, 1, 1,
1.450436, 0.3523925, 3.91634, 1, 0, 0, 1, 1,
1.4531, -0.4920885, 2.303796, 1, 0, 0, 1, 1,
1.46196, 1.857066, 1.994041, 1, 0, 0, 1, 1,
1.46542, 1.196357, 0.2321017, 0, 0, 0, 1, 1,
1.468847, 0.664582, 2.350841, 0, 0, 0, 1, 1,
1.473556, 0.7609125, 1.153127, 0, 0, 0, 1, 1,
1.503451, 2.294602, 1.250872, 0, 0, 0, 1, 1,
1.514194, -1.107224, 2.54848, 0, 0, 0, 1, 1,
1.518815, 0.8911035, 1.316612, 0, 0, 0, 1, 1,
1.536743, 0.9146659, -0.2960844, 0, 0, 0, 1, 1,
1.546782, 1.000798, 0.08730114, 1, 1, 1, 1, 1,
1.553894, -0.1749981, 0.3893848, 1, 1, 1, 1, 1,
1.583652, -1.21356, 1.189171, 1, 1, 1, 1, 1,
1.591504, -0.5532358, 1.04145, 1, 1, 1, 1, 1,
1.624009, 0.1062989, 1.169764, 1, 1, 1, 1, 1,
1.632397, -0.7293004, 1.294684, 1, 1, 1, 1, 1,
1.668421, -0.6281149, -0.401259, 1, 1, 1, 1, 1,
1.669919, 0.4803947, 1.576347, 1, 1, 1, 1, 1,
1.673262, 0.7631316, 2.503417, 1, 1, 1, 1, 1,
1.673981, -0.1495325, 1.171934, 1, 1, 1, 1, 1,
1.679814, -0.03598899, 2.531491, 1, 1, 1, 1, 1,
1.692996, 0.6532071, 0.2694732, 1, 1, 1, 1, 1,
1.69834, -1.696927, 0.635868, 1, 1, 1, 1, 1,
1.709677, 0.07186359, -0.4394248, 1, 1, 1, 1, 1,
1.721221, 1.299563, 0.6712396, 1, 1, 1, 1, 1,
1.728153, -0.716182, 2.683997, 0, 0, 1, 1, 1,
1.734142, -2.26254, 1.388319, 1, 0, 0, 1, 1,
1.745815, 0.3004729, 1.251843, 1, 0, 0, 1, 1,
1.746982, 0.8643952, 1.543748, 1, 0, 0, 1, 1,
1.764762, -0.7671164, 2.728016, 1, 0, 0, 1, 1,
1.766633, 0.9463928, 2.568752, 1, 0, 0, 1, 1,
1.807708, 0.433276, 1.036618, 0, 0, 0, 1, 1,
1.815595, 0.2922782, 1.93675, 0, 0, 0, 1, 1,
1.815948, -0.2469106, 1.51012, 0, 0, 0, 1, 1,
1.825551, 1.081681, 0.4508299, 0, 0, 0, 1, 1,
1.855203, 0.1096864, 1.088452, 0, 0, 0, 1, 1,
1.881704, -1.117082, 1.525644, 0, 0, 0, 1, 1,
1.882197, 0.07199256, 1.450464, 0, 0, 0, 1, 1,
1.884061, 0.6446604, 0.3486504, 1, 1, 1, 1, 1,
1.888659, -1.314065, 2.891453, 1, 1, 1, 1, 1,
1.889874, 0.2722184, -1.840986, 1, 1, 1, 1, 1,
1.901774, 2.052549, -0.4508824, 1, 1, 1, 1, 1,
1.93696, 0.7936253, -0.7103418, 1, 1, 1, 1, 1,
1.986889, -1.388569, 1.088367, 1, 1, 1, 1, 1,
1.99306, -0.2822766, 1.209975, 1, 1, 1, 1, 1,
2.000941, 0.6137616, -0.2150598, 1, 1, 1, 1, 1,
2.032225, -1.156047, 0.8644884, 1, 1, 1, 1, 1,
2.061365, -1.253559, 2.554029, 1, 1, 1, 1, 1,
2.064655, -0.03462778, 1.566654, 1, 1, 1, 1, 1,
2.068942, -0.8245385, 1.019577, 1, 1, 1, 1, 1,
2.080238, 0.8780693, 1.556264, 1, 1, 1, 1, 1,
2.102721, 1.060398, -0.25512, 1, 1, 1, 1, 1,
2.148823, 1.314708, 1.833957, 1, 1, 1, 1, 1,
2.1772, -1.977107, 2.06229, 0, 0, 1, 1, 1,
2.201854, 0.811889, 1.748329, 1, 0, 0, 1, 1,
2.218283, -0.218337, 1.389274, 1, 0, 0, 1, 1,
2.221968, 1.635563, 0.6532419, 1, 0, 0, 1, 1,
2.225601, -0.2352009, 1.403763, 1, 0, 0, 1, 1,
2.236993, 0.2626017, 1.391281, 1, 0, 0, 1, 1,
2.298484, 0.525027, 0.8817981, 0, 0, 0, 1, 1,
2.313297, -0.2009646, 3.200012, 0, 0, 0, 1, 1,
2.352381, -0.130137, 1.507216, 0, 0, 0, 1, 1,
2.380875, 1.894203, 0.900412, 0, 0, 0, 1, 1,
2.395059, -2.108023, 4.708938, 0, 0, 0, 1, 1,
2.418318, -0.763303, 2.063599, 0, 0, 0, 1, 1,
2.503938, 0.7861745, 2.681779, 0, 0, 0, 1, 1,
2.529812, -0.7054281, 0.9856188, 1, 1, 1, 1, 1,
2.540795, -0.635399, 1.923899, 1, 1, 1, 1, 1,
2.60487, -1.007203, 3.186899, 1, 1, 1, 1, 1,
2.697107, -0.457807, 2.640893, 1, 1, 1, 1, 1,
2.832416, 0.5197275, -0.1959375, 1, 1, 1, 1, 1,
3.5297, 1.996659, 0.5451482, 1, 1, 1, 1, 1,
3.647608, -1.029256, 3.345721, 1, 1, 1, 1, 1
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
var radius = 9.430816;
var distance = 33.12534;
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
mvMatrix.translate( -0.4678541, -0.01639354, 0.4742923 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.12534);
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
