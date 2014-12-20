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
-2.962495, -0.8797813, -1.589288, 1, 0, 0, 1,
-2.818825, 2.073516, -3.532159, 1, 0.007843138, 0, 1,
-2.745694, -1.127207, -1.417349, 1, 0.01176471, 0, 1,
-2.669323, -1.949928, -1.909094, 1, 0.01960784, 0, 1,
-2.649708, 2.295539, 0.6798119, 1, 0.02352941, 0, 1,
-2.601037, 0.09116395, -1.489549, 1, 0.03137255, 0, 1,
-2.590671, -0.5947727, -0.9113147, 1, 0.03529412, 0, 1,
-2.552522, 1.481005, -0.6337023, 1, 0.04313726, 0, 1,
-2.510422, -0.9619433, -2.581445, 1, 0.04705882, 0, 1,
-2.499646, 0.2507659, -4.017413, 1, 0.05490196, 0, 1,
-2.39596, -0.9182827, -1.162936, 1, 0.05882353, 0, 1,
-2.394481, 0.2628436, -2.114069, 1, 0.06666667, 0, 1,
-2.365409, 0.1269638, -4.004474, 1, 0.07058824, 0, 1,
-2.294541, 1.586873, 0.1471332, 1, 0.07843138, 0, 1,
-2.239873, 0.5571691, -2.671309, 1, 0.08235294, 0, 1,
-2.177525, -0.949168, -0.5623733, 1, 0.09019608, 0, 1,
-2.173841, -1.825581, -2.791205, 1, 0.09411765, 0, 1,
-2.169279, 1.183488, -2.088822, 1, 0.1019608, 0, 1,
-2.167586, -0.3274708, -0.8955404, 1, 0.1098039, 0, 1,
-2.165074, -0.253757, -1.54363, 1, 0.1137255, 0, 1,
-2.135337, 0.3489225, -2.320307, 1, 0.1215686, 0, 1,
-2.073395, 1.216822, 0.2514137, 1, 0.1254902, 0, 1,
-2.058826, -1.043123, -4.409149, 1, 0.1333333, 0, 1,
-2.050246, -0.5443473, -2.020221, 1, 0.1372549, 0, 1,
-2.039462, 1.11041, -1.878571, 1, 0.145098, 0, 1,
-2.004709, 0.2680088, -0.6309472, 1, 0.1490196, 0, 1,
-1.997217, 0.1558605, -1.060646, 1, 0.1568628, 0, 1,
-1.960167, 1.000375, -0.002791665, 1, 0.1607843, 0, 1,
-1.958262, -0.01546107, -1.072604, 1, 0.1686275, 0, 1,
-1.957949, -0.4353991, -1.791132, 1, 0.172549, 0, 1,
-1.921862, -0.8077278, -1.952322, 1, 0.1803922, 0, 1,
-1.883292, 0.8340818, -1.549968, 1, 0.1843137, 0, 1,
-1.857463, 0.4125779, -2.031987, 1, 0.1921569, 0, 1,
-1.81254, -0.01670776, -1.44927, 1, 0.1960784, 0, 1,
-1.796843, -0.7335976, -2.496363, 1, 0.2039216, 0, 1,
-1.748029, 0.3277358, -1.527009, 1, 0.2117647, 0, 1,
-1.743948, -0.1004646, -1.981897, 1, 0.2156863, 0, 1,
-1.734021, 1.432979, -1.662178, 1, 0.2235294, 0, 1,
-1.662962, -0.4291697, -2.454424, 1, 0.227451, 0, 1,
-1.657602, 0.6471345, 0.6573747, 1, 0.2352941, 0, 1,
-1.656367, -0.8758641, -1.419046, 1, 0.2392157, 0, 1,
-1.651209, 0.4032653, -0.2980134, 1, 0.2470588, 0, 1,
-1.646419, -2.069521, -2.307446, 1, 0.2509804, 0, 1,
-1.643135, 0.002831473, -1.812397, 1, 0.2588235, 0, 1,
-1.633863, -0.927775, -3.127178, 1, 0.2627451, 0, 1,
-1.633066, -0.3112755, -0.3551867, 1, 0.2705882, 0, 1,
-1.622976, -0.2787577, -2.810751, 1, 0.2745098, 0, 1,
-1.621626, -0.8906702, -2.442069, 1, 0.282353, 0, 1,
-1.613565, 0.4730104, -1.718027, 1, 0.2862745, 0, 1,
-1.608668, -0.8350077, -1.962444, 1, 0.2941177, 0, 1,
-1.589652, 0.4424767, -0.7642771, 1, 0.3019608, 0, 1,
-1.574124, -0.1945301, -1.103222, 1, 0.3058824, 0, 1,
-1.54956, 0.05646554, -2.042801, 1, 0.3137255, 0, 1,
-1.542393, 1.647415, -1.649968, 1, 0.3176471, 0, 1,
-1.541032, -2.249671, -3.552038, 1, 0.3254902, 0, 1,
-1.530233, -0.5044106, -2.120804, 1, 0.3294118, 0, 1,
-1.526111, -0.09408541, -2.912363, 1, 0.3372549, 0, 1,
-1.52493, -0.7337306, -2.248846, 1, 0.3411765, 0, 1,
-1.506476, -0.4045537, -0.7969386, 1, 0.3490196, 0, 1,
-1.496437, -0.2317409, -1.576878, 1, 0.3529412, 0, 1,
-1.466503, 1.391589, -2.017873, 1, 0.3607843, 0, 1,
-1.430557, -1.591734, -2.911507, 1, 0.3647059, 0, 1,
-1.423233, -0.1421836, -0.3773151, 1, 0.372549, 0, 1,
-1.41952, -0.04291834, -1.048269, 1, 0.3764706, 0, 1,
-1.39976, 0.8869904, -0.506376, 1, 0.3843137, 0, 1,
-1.388427, -0.1011264, -1.382859, 1, 0.3882353, 0, 1,
-1.377888, -0.3811965, -1.509846, 1, 0.3960784, 0, 1,
-1.363109, 0.2942861, -1.326045, 1, 0.4039216, 0, 1,
-1.360863, 2.258492, -1.60758, 1, 0.4078431, 0, 1,
-1.3599, 0.1737411, 0.09966033, 1, 0.4156863, 0, 1,
-1.359265, -0.6220008, -2.074913, 1, 0.4196078, 0, 1,
-1.350748, 0.1627316, -0.9112055, 1, 0.427451, 0, 1,
-1.348535, -0.561604, -2.445683, 1, 0.4313726, 0, 1,
-1.338385, -0.2015748, -3.838755, 1, 0.4392157, 0, 1,
-1.331143, 0.7604117, -0.3390346, 1, 0.4431373, 0, 1,
-1.330969, -2.46308, -5.032168, 1, 0.4509804, 0, 1,
-1.317811, -1.321457, -2.38381, 1, 0.454902, 0, 1,
-1.317241, 0.3607464, -1.578142, 1, 0.4627451, 0, 1,
-1.308844, 0.1797083, -0.8481296, 1, 0.4666667, 0, 1,
-1.286322, -1.347198, -3.200208, 1, 0.4745098, 0, 1,
-1.2795, -0.1288552, -2.293475, 1, 0.4784314, 0, 1,
-1.278852, 0.02771159, -4.118918, 1, 0.4862745, 0, 1,
-1.274679, 0.9724091, -0.6002775, 1, 0.4901961, 0, 1,
-1.274415, 0.6857861, -2.061788, 1, 0.4980392, 0, 1,
-1.271317, 0.2060469, -0.2949892, 1, 0.5058824, 0, 1,
-1.261026, -1.187413, -2.311894, 1, 0.509804, 0, 1,
-1.255203, -0.1246185, -3.271622, 1, 0.5176471, 0, 1,
-1.254146, 0.05163494, -2.282524, 1, 0.5215687, 0, 1,
-1.253141, 0.5175353, -1.083609, 1, 0.5294118, 0, 1,
-1.251848, 1.786723, 1.001039, 1, 0.5333334, 0, 1,
-1.244842, -0.006289854, 0.3493744, 1, 0.5411765, 0, 1,
-1.23188, -0.2995787, -1.217313, 1, 0.5450981, 0, 1,
-1.225957, -0.5738949, -2.150764, 1, 0.5529412, 0, 1,
-1.221159, -1.038436, -2.478635, 1, 0.5568628, 0, 1,
-1.212317, -0.78495, -4.134454, 1, 0.5647059, 0, 1,
-1.210985, 0.2059673, -0.717235, 1, 0.5686275, 0, 1,
-1.203502, 0.06624043, -2.604922, 1, 0.5764706, 0, 1,
-1.193907, 0.4178422, -0.843195, 1, 0.5803922, 0, 1,
-1.191722, 0.1819702, 0.2723368, 1, 0.5882353, 0, 1,
-1.186661, -0.6080251, -1.22056, 1, 0.5921569, 0, 1,
-1.180295, 1.433638, -2.633023, 1, 0.6, 0, 1,
-1.174897, -1.546355, -2.017392, 1, 0.6078432, 0, 1,
-1.174763, 1.256017, 0.548763, 1, 0.6117647, 0, 1,
-1.174655, -0.9729809, -1.830755, 1, 0.6196079, 0, 1,
-1.173027, 1.02719, 0.6532462, 1, 0.6235294, 0, 1,
-1.166893, 0.8189175, -2.436899, 1, 0.6313726, 0, 1,
-1.158548, -0.007784148, -2.339987, 1, 0.6352941, 0, 1,
-1.156798, 0.07185813, -1.355024, 1, 0.6431373, 0, 1,
-1.156651, -1.697405, -1.871519, 1, 0.6470588, 0, 1,
-1.154031, 0.001397648, -1.436233, 1, 0.654902, 0, 1,
-1.146198, -0.7871273, -0.7161636, 1, 0.6588235, 0, 1,
-1.143196, -1.104961, -1.709022, 1, 0.6666667, 0, 1,
-1.138866, 0.0906477, -0.7415798, 1, 0.6705883, 0, 1,
-1.138496, -0.4233701, 0.4559897, 1, 0.6784314, 0, 1,
-1.132252, 0.7475727, 0.6171662, 1, 0.682353, 0, 1,
-1.12659, -1.468743, -3.295829, 1, 0.6901961, 0, 1,
-1.125211, 0.2869351, -1.675859, 1, 0.6941177, 0, 1,
-1.12164, 1.434821, -1.241159, 1, 0.7019608, 0, 1,
-1.11955, -1.622027, -3.558705, 1, 0.7098039, 0, 1,
-1.108601, -0.3728647, -1.259223, 1, 0.7137255, 0, 1,
-1.108098, 0.2057652, -0.03825482, 1, 0.7215686, 0, 1,
-1.107924, -0.3989605, 0.1836444, 1, 0.7254902, 0, 1,
-1.103415, 0.2218529, -1.359237, 1, 0.7333333, 0, 1,
-1.102166, -1.007169, -0.2706534, 1, 0.7372549, 0, 1,
-1.101739, -0.9031131, -3.178135, 1, 0.7450981, 0, 1,
-1.100883, -0.7079813, -2.40334, 1, 0.7490196, 0, 1,
-1.100877, -0.3785937, -1.979978, 1, 0.7568628, 0, 1,
-1.088908, 0.1179621, -2.516168, 1, 0.7607843, 0, 1,
-1.088399, -0.1376427, -1.831479, 1, 0.7686275, 0, 1,
-1.0816, -0.5393813, -2.798609, 1, 0.772549, 0, 1,
-1.081531, 0.7604493, -3.214806, 1, 0.7803922, 0, 1,
-1.077291, -0.2898854, -1.316407, 1, 0.7843137, 0, 1,
-1.07663, -0.4794434, -1.020337, 1, 0.7921569, 0, 1,
-1.073656, 0.2415372, 0.9682497, 1, 0.7960784, 0, 1,
-1.071478, -1.386294, -1.127119, 1, 0.8039216, 0, 1,
-1.066, -1.10999, -5.375832, 1, 0.8117647, 0, 1,
-1.063309, 0.6475834, -0.6365243, 1, 0.8156863, 0, 1,
-1.059859, 2.291109, 0.5259022, 1, 0.8235294, 0, 1,
-1.05894, -0.6325944, -1.420873, 1, 0.827451, 0, 1,
-1.051831, -0.04492548, -1.820154, 1, 0.8352941, 0, 1,
-1.04579, -0.1281082, -1.006534, 1, 0.8392157, 0, 1,
-1.045014, -0.9473363, -3.085034, 1, 0.8470588, 0, 1,
-1.04439, 1.172228, 1.642738, 1, 0.8509804, 0, 1,
-1.038319, 0.0509528, -0.09316345, 1, 0.8588235, 0, 1,
-1.037678, 0.8784499, -2.554636, 1, 0.8627451, 0, 1,
-1.033945, -0.03563568, -2.572674, 1, 0.8705882, 0, 1,
-1.01728, -2.022378, -2.224418, 1, 0.8745098, 0, 1,
-1.016478, 1.315065, -0.4106247, 1, 0.8823529, 0, 1,
-1.013747, -0.2743119, -1.90067, 1, 0.8862745, 0, 1,
-1.01016, 0.9757038, -1.075752, 1, 0.8941177, 0, 1,
-1.010055, 0.2456075, -2.168522, 1, 0.8980392, 0, 1,
-0.9980272, -1.578102, -1.990814, 1, 0.9058824, 0, 1,
-0.9948865, 1.2426, -0.07621899, 1, 0.9137255, 0, 1,
-0.9937901, -1.305037, -2.575939, 1, 0.9176471, 0, 1,
-0.9933934, -0.1800388, -2.129951, 1, 0.9254902, 0, 1,
-0.9732401, -2.860983, -2.642711, 1, 0.9294118, 0, 1,
-0.971909, -2.000416, -2.070073, 1, 0.9372549, 0, 1,
-0.9656609, 0.5388467, -2.73516, 1, 0.9411765, 0, 1,
-0.9639827, -0.2665914, -1.2801, 1, 0.9490196, 0, 1,
-0.9638495, -1.309597, -3.925246, 1, 0.9529412, 0, 1,
-0.962896, 0.1623087, -2.029971, 1, 0.9607843, 0, 1,
-0.962084, 0.3194734, -2.73679, 1, 0.9647059, 0, 1,
-0.9576722, 0.09757718, -0.2016957, 1, 0.972549, 0, 1,
-0.9531723, -1.276126, -2.690504, 1, 0.9764706, 0, 1,
-0.93479, -1.155807, -4.108675, 1, 0.9843137, 0, 1,
-0.9307209, -0.4153487, -0.837803, 1, 0.9882353, 0, 1,
-0.9275441, -1.358785, -3.84201, 1, 0.9960784, 0, 1,
-0.9156952, -0.1036275, -2.366683, 0.9960784, 1, 0, 1,
-0.9053424, 0.384824, -1.557644, 0.9921569, 1, 0, 1,
-0.9036638, 0.03133382, -3.318335, 0.9843137, 1, 0, 1,
-0.9028243, 1.659266, 1.131642, 0.9803922, 1, 0, 1,
-0.9017918, -0.6966636, -0.8726575, 0.972549, 1, 0, 1,
-0.8984708, 2.473543, -0.4413942, 0.9686275, 1, 0, 1,
-0.8963636, -0.09595045, 0.275475, 0.9607843, 1, 0, 1,
-0.8916919, 1.33482, 0.4712807, 0.9568627, 1, 0, 1,
-0.8876734, -0.4118283, -1.779211, 0.9490196, 1, 0, 1,
-0.8839023, -0.3047691, -1.116742, 0.945098, 1, 0, 1,
-0.8740662, -0.4348435, -2.57792, 0.9372549, 1, 0, 1,
-0.8684455, 0.2819885, -1.125612, 0.9333333, 1, 0, 1,
-0.8656955, -0.3611246, 0.4181786, 0.9254902, 1, 0, 1,
-0.862785, -1.294059, -4.553863, 0.9215686, 1, 0, 1,
-0.8562336, 1.019659, 0.5021315, 0.9137255, 1, 0, 1,
-0.8550276, -1.358582, -3.825402, 0.9098039, 1, 0, 1,
-0.8544419, 0.06631937, -2.815439, 0.9019608, 1, 0, 1,
-0.8473701, 0.04788511, -1.075985, 0.8941177, 1, 0, 1,
-0.8424414, -0.09826544, -2.785069, 0.8901961, 1, 0, 1,
-0.8404693, 0.4921343, -1.549073, 0.8823529, 1, 0, 1,
-0.8389179, 0.3955325, -1.144143, 0.8784314, 1, 0, 1,
-0.8341392, 0.927578, -1.082388, 0.8705882, 1, 0, 1,
-0.8332559, 0.653138, -0.1337542, 0.8666667, 1, 0, 1,
-0.8320534, -0.2844749, -3.04336, 0.8588235, 1, 0, 1,
-0.8297768, -0.816195, 0.2680394, 0.854902, 1, 0, 1,
-0.8295843, 0.5385643, -0.6415468, 0.8470588, 1, 0, 1,
-0.8288167, -0.2315093, -2.054872, 0.8431373, 1, 0, 1,
-0.8209836, -0.2467147, -1.030854, 0.8352941, 1, 0, 1,
-0.8186979, -0.2359019, -3.389366, 0.8313726, 1, 0, 1,
-0.8181266, -0.9471214, -3.162346, 0.8235294, 1, 0, 1,
-0.8160581, 0.4869184, -1.564836, 0.8196079, 1, 0, 1,
-0.8030517, -0.4574903, -1.713011, 0.8117647, 1, 0, 1,
-0.7985865, -0.8687218, -4.393436, 0.8078431, 1, 0, 1,
-0.7966018, 1.630266, -0.3505819, 0.8, 1, 0, 1,
-0.7917299, -0.7774487, -2.894449, 0.7921569, 1, 0, 1,
-0.7916359, 0.9782454, -0.819035, 0.7882353, 1, 0, 1,
-0.7903758, 1.399158, -2.496288, 0.7803922, 1, 0, 1,
-0.7903581, -0.07623913, -2.922051, 0.7764706, 1, 0, 1,
-0.7862303, 1.687424, -0.4593837, 0.7686275, 1, 0, 1,
-0.7862172, -0.07386066, -1.563544, 0.7647059, 1, 0, 1,
-0.7777728, -1.731148, -2.075204, 0.7568628, 1, 0, 1,
-0.7755272, 0.4163862, -2.71188, 0.7529412, 1, 0, 1,
-0.7738303, 0.382872, -0.2880632, 0.7450981, 1, 0, 1,
-0.7699887, 0.7775893, -0.7237774, 0.7411765, 1, 0, 1,
-0.769147, -1.140354, -1.796892, 0.7333333, 1, 0, 1,
-0.7675238, -1.201765, -2.281902, 0.7294118, 1, 0, 1,
-0.7660509, 0.2885814, -2.384104, 0.7215686, 1, 0, 1,
-0.7607643, 0.03049878, -2.626849, 0.7176471, 1, 0, 1,
-0.7601768, -0.5017337, -1.962804, 0.7098039, 1, 0, 1,
-0.7594478, -1.38668, -3.696078, 0.7058824, 1, 0, 1,
-0.7452244, 0.8119666, -1.034104, 0.6980392, 1, 0, 1,
-0.7443776, -0.5324683, -3.299085, 0.6901961, 1, 0, 1,
-0.7413067, 0.2854042, 0.1182398, 0.6862745, 1, 0, 1,
-0.7375481, 0.3678586, -0.7982874, 0.6784314, 1, 0, 1,
-0.732392, 0.3652781, -3.242477, 0.6745098, 1, 0, 1,
-0.7254209, -0.1067509, -1.011526, 0.6666667, 1, 0, 1,
-0.7221656, 0.1693364, -0.52382, 0.6627451, 1, 0, 1,
-0.7188097, -1.957978, -1.831922, 0.654902, 1, 0, 1,
-0.7152281, 0.297663, -0.1987159, 0.6509804, 1, 0, 1,
-0.7144563, -0.8552427, -1.944168, 0.6431373, 1, 0, 1,
-0.7114202, -0.04234754, -2.064291, 0.6392157, 1, 0, 1,
-0.7091306, 0.5786603, -2.081023, 0.6313726, 1, 0, 1,
-0.7037925, -0.2979335, -2.637171, 0.627451, 1, 0, 1,
-0.7031457, -0.9246123, -4.051009, 0.6196079, 1, 0, 1,
-0.6984772, 2.406838, 1.097828, 0.6156863, 1, 0, 1,
-0.6978273, 1.054371, -1.252407, 0.6078432, 1, 0, 1,
-0.6869885, 0.03178148, 0.4836785, 0.6039216, 1, 0, 1,
-0.6869742, 0.7977038, 0.7157795, 0.5960785, 1, 0, 1,
-0.6790183, -2.070717, -3.343762, 0.5882353, 1, 0, 1,
-0.6770052, 1.114622, -2.449945, 0.5843138, 1, 0, 1,
-0.6757449, 0.03529995, -3.143295, 0.5764706, 1, 0, 1,
-0.6702328, -0.128583, -2.343912, 0.572549, 1, 0, 1,
-0.6697701, 0.4638507, -1.24565, 0.5647059, 1, 0, 1,
-0.6677129, -0.2859697, -0.8447794, 0.5607843, 1, 0, 1,
-0.6608762, 1.111102, -0.005295496, 0.5529412, 1, 0, 1,
-0.6605556, -1.674866, -2.795395, 0.5490196, 1, 0, 1,
-0.6480412, 0.4963401, -1.155862, 0.5411765, 1, 0, 1,
-0.6478746, 1.320581, -0.8276073, 0.5372549, 1, 0, 1,
-0.6455777, -1.321874, -3.341996, 0.5294118, 1, 0, 1,
-0.6421951, 1.096495, 0.4751734, 0.5254902, 1, 0, 1,
-0.6415944, -0.5595189, -1.945463, 0.5176471, 1, 0, 1,
-0.6410445, -0.3151647, -0.9005058, 0.5137255, 1, 0, 1,
-0.6377189, -0.4458638, -2.558747, 0.5058824, 1, 0, 1,
-0.6366167, -1.190277, -3.177495, 0.5019608, 1, 0, 1,
-0.6320145, -1.380037, -2.941752, 0.4941176, 1, 0, 1,
-0.6312989, -1.10241, -2.814679, 0.4862745, 1, 0, 1,
-0.6305862, -0.2878795, -0.9674504, 0.4823529, 1, 0, 1,
-0.6275305, -1.217689, -2.75034, 0.4745098, 1, 0, 1,
-0.6264856, -1.10252, -4.222618, 0.4705882, 1, 0, 1,
-0.6192521, 0.5701016, 0.6200278, 0.4627451, 1, 0, 1,
-0.6175098, -0.07220246, -2.230576, 0.4588235, 1, 0, 1,
-0.6165843, 0.9112979, -0.2849653, 0.4509804, 1, 0, 1,
-0.6156597, -3.192681, -2.341463, 0.4470588, 1, 0, 1,
-0.6153641, -1.717408, -3.603211, 0.4392157, 1, 0, 1,
-0.615083, -0.8638033, -3.723548, 0.4352941, 1, 0, 1,
-0.6147662, -0.1702325, -0.7038346, 0.427451, 1, 0, 1,
-0.6118985, 0.3284405, -0.6173552, 0.4235294, 1, 0, 1,
-0.6031438, 0.0146355, -1.176566, 0.4156863, 1, 0, 1,
-0.6020338, -0.3699267, -2.46105, 0.4117647, 1, 0, 1,
-0.5968463, 0.4580303, -0.6243057, 0.4039216, 1, 0, 1,
-0.5921944, -2.958251, -5.102079, 0.3960784, 1, 0, 1,
-0.5919988, -0.905512, -3.222559, 0.3921569, 1, 0, 1,
-0.5854779, 1.391062, -2.294117, 0.3843137, 1, 0, 1,
-0.5828881, 0.4456454, -1.425766, 0.3803922, 1, 0, 1,
-0.5828629, 0.9307112, -1.295603, 0.372549, 1, 0, 1,
-0.5791922, -1.17021, -1.911936, 0.3686275, 1, 0, 1,
-0.5777774, -0.1848421, -1.984751, 0.3607843, 1, 0, 1,
-0.5723454, 0.04332528, -1.582406, 0.3568628, 1, 0, 1,
-0.5712788, 0.3800751, 0.138154, 0.3490196, 1, 0, 1,
-0.5712259, -0.2187867, -1.545484, 0.345098, 1, 0, 1,
-0.5640804, -0.2831075, -4.053926, 0.3372549, 1, 0, 1,
-0.5638234, -0.7949719, -1.27617, 0.3333333, 1, 0, 1,
-0.5597295, -0.7829224, -3.428768, 0.3254902, 1, 0, 1,
-0.5572655, 0.4344287, -2.112522, 0.3215686, 1, 0, 1,
-0.5563927, -0.7631563, -1.218952, 0.3137255, 1, 0, 1,
-0.5509712, 1.354038, 0.7710066, 0.3098039, 1, 0, 1,
-0.5502002, -0.3595913, -2.848015, 0.3019608, 1, 0, 1,
-0.5498575, -0.5251856, -3.208956, 0.2941177, 1, 0, 1,
-0.5428892, -1.529328, -3.033047, 0.2901961, 1, 0, 1,
-0.5399459, 0.9141432, -1.14069, 0.282353, 1, 0, 1,
-0.5386246, 0.7514744, -0.9580041, 0.2784314, 1, 0, 1,
-0.5368708, -1.67495, -4.884367, 0.2705882, 1, 0, 1,
-0.5335169, 0.6679497, -1.721365, 0.2666667, 1, 0, 1,
-0.5311028, 0.691516, -2.666239, 0.2588235, 1, 0, 1,
-0.5309837, -0.3640185, -2.816973, 0.254902, 1, 0, 1,
-0.5288263, -1.47032, -1.145378, 0.2470588, 1, 0, 1,
-0.5273286, -1.424921, -2.130524, 0.2431373, 1, 0, 1,
-0.5269842, -0.8942095, -3.855777, 0.2352941, 1, 0, 1,
-0.5248109, 0.1869654, -1.889546, 0.2313726, 1, 0, 1,
-0.5192125, 1.583997, 1.016304, 0.2235294, 1, 0, 1,
-0.5167897, -0.7388709, -2.01875, 0.2196078, 1, 0, 1,
-0.5166603, 0.6877171, 0.5475391, 0.2117647, 1, 0, 1,
-0.5151543, 0.1801575, -0.9300433, 0.2078431, 1, 0, 1,
-0.5148939, 0.1061712, -2.007262, 0.2, 1, 0, 1,
-0.5141644, 0.9644815, -2.291987, 0.1921569, 1, 0, 1,
-0.5115949, 0.07668635, -1.068089, 0.1882353, 1, 0, 1,
-0.5097446, -0.7080151, -3.736403, 0.1803922, 1, 0, 1,
-0.5016615, 0.960601, 0.9007554, 0.1764706, 1, 0, 1,
-0.4979152, 1.093697, -1.979239, 0.1686275, 1, 0, 1,
-0.497695, -0.6729618, -2.408094, 0.1647059, 1, 0, 1,
-0.495333, 0.8420413, -0.1929767, 0.1568628, 1, 0, 1,
-0.4900068, 0.3620032, -1.807937, 0.1529412, 1, 0, 1,
-0.4872146, -0.7047336, -2.370208, 0.145098, 1, 0, 1,
-0.4797066, 0.05365413, -2.842205, 0.1411765, 1, 0, 1,
-0.4793028, -0.432141, -3.388771, 0.1333333, 1, 0, 1,
-0.4758595, 1.21305, -1.404603, 0.1294118, 1, 0, 1,
-0.4731931, 0.9569377, -1.72438, 0.1215686, 1, 0, 1,
-0.462034, -2.07578, -3.270155, 0.1176471, 1, 0, 1,
-0.4589764, 1.334935, 2.661996, 0.1098039, 1, 0, 1,
-0.4557959, -1.750157, -1.387741, 0.1058824, 1, 0, 1,
-0.4546824, 2.426938, 0.1187726, 0.09803922, 1, 0, 1,
-0.4528812, -1.762744, -4.245998, 0.09019608, 1, 0, 1,
-0.4512586, 0.5786559, -0.7750825, 0.08627451, 1, 0, 1,
-0.4475054, 0.827358, -0.06621447, 0.07843138, 1, 0, 1,
-0.4440959, -0.8515257, -1.360701, 0.07450981, 1, 0, 1,
-0.4371646, -0.3836742, -3.308746, 0.06666667, 1, 0, 1,
-0.4303108, 0.1661219, 0.9293438, 0.0627451, 1, 0, 1,
-0.4211915, -0.5523324, -1.972007, 0.05490196, 1, 0, 1,
-0.4169865, 0.2420124, -0.2430365, 0.05098039, 1, 0, 1,
-0.4143063, 0.350273, -0.7928852, 0.04313726, 1, 0, 1,
-0.4140117, 1.477055, 0.297693, 0.03921569, 1, 0, 1,
-0.4119204, -1.590679, -1.939511, 0.03137255, 1, 0, 1,
-0.4098131, 1.49822, -0.4668021, 0.02745098, 1, 0, 1,
-0.4063069, -0.8075004, -1.657073, 0.01960784, 1, 0, 1,
-0.4061286, -0.6823916, -1.845885, 0.01568628, 1, 0, 1,
-0.4028997, -0.01620253, -3.254867, 0.007843138, 1, 0, 1,
-0.3994243, 0.2581834, -2.321962, 0.003921569, 1, 0, 1,
-0.3986841, -1.31827, -3.786254, 0, 1, 0.003921569, 1,
-0.3983604, 0.8575372, -0.4241697, 0, 1, 0.01176471, 1,
-0.3973981, 0.2777701, -0.7483237, 0, 1, 0.01568628, 1,
-0.396216, 0.8294611, -2.185215, 0, 1, 0.02352941, 1,
-0.3948569, -0.02386131, 0.5952277, 0, 1, 0.02745098, 1,
-0.3945656, 0.06379608, -1.207265, 0, 1, 0.03529412, 1,
-0.3942737, -0.6839284, -3.227601, 0, 1, 0.03921569, 1,
-0.3927341, 0.3198083, 0.6851062, 0, 1, 0.04705882, 1,
-0.3926914, -1.063264, -2.460464, 0, 1, 0.05098039, 1,
-0.3877953, -0.1716253, -3.09804, 0, 1, 0.05882353, 1,
-0.3831472, 0.5241718, -1.321441, 0, 1, 0.0627451, 1,
-0.3818002, 1.231979, 1.147507, 0, 1, 0.07058824, 1,
-0.3816028, -0.7955254, -3.210352, 0, 1, 0.07450981, 1,
-0.3804488, -1.099521, -1.87816, 0, 1, 0.08235294, 1,
-0.3763455, -0.8860889, -4.287443, 0, 1, 0.08627451, 1,
-0.3756281, -0.3821167, -2.469845, 0, 1, 0.09411765, 1,
-0.374994, 0.1899554, -0.6888067, 0, 1, 0.1019608, 1,
-0.3748703, -0.2237415, -0.5946808, 0, 1, 0.1058824, 1,
-0.3696517, 0.8285432, 0.7602971, 0, 1, 0.1137255, 1,
-0.3664981, 0.2123533, -0.5338398, 0, 1, 0.1176471, 1,
-0.3659737, 1.041385, -1.167695, 0, 1, 0.1254902, 1,
-0.3624645, 1.627931, -1.034171, 0, 1, 0.1294118, 1,
-0.3600158, -0.1627656, -0.537568, 0, 1, 0.1372549, 1,
-0.3542607, -1.013765, -4.756512, 0, 1, 0.1411765, 1,
-0.3512706, -1.18152, -2.19315, 0, 1, 0.1490196, 1,
-0.3506538, -0.8134027, -4.84486, 0, 1, 0.1529412, 1,
-0.3477858, -1.016629, -4.630747, 0, 1, 0.1607843, 1,
-0.3462442, 1.618551, -0.573755, 0, 1, 0.1647059, 1,
-0.3443688, 0.584245, 0.7378335, 0, 1, 0.172549, 1,
-0.3442601, -0.6783479, -2.478492, 0, 1, 0.1764706, 1,
-0.3439929, -0.1010638, -3.123565, 0, 1, 0.1843137, 1,
-0.3422414, -1.281991, -4.246282, 0, 1, 0.1882353, 1,
-0.3420872, -0.472471, -2.776205, 0, 1, 0.1960784, 1,
-0.3385029, 1.425452, -0.8310885, 0, 1, 0.2039216, 1,
-0.3331043, -0.4299638, -1.448344, 0, 1, 0.2078431, 1,
-0.3282793, -0.4574769, -4.091733, 0, 1, 0.2156863, 1,
-0.3278238, 0.8151236, -0.8309877, 0, 1, 0.2196078, 1,
-0.3131148, -0.6098305, -1.434168, 0, 1, 0.227451, 1,
-0.3127782, 0.2088506, 0.2205912, 0, 1, 0.2313726, 1,
-0.308167, 0.6972622, -1.762464, 0, 1, 0.2392157, 1,
-0.3075466, 0.5466239, -2.428195, 0, 1, 0.2431373, 1,
-0.305047, -0.9401143, -4.564467, 0, 1, 0.2509804, 1,
-0.2974654, -1.469742, -2.908446, 0, 1, 0.254902, 1,
-0.2972662, -0.6287603, -0.9812751, 0, 1, 0.2627451, 1,
-0.2970196, -0.9360422, -3.443892, 0, 1, 0.2666667, 1,
-0.2929421, -1.026084, -2.266863, 0, 1, 0.2745098, 1,
-0.2928664, -1.818551, -3.669158, 0, 1, 0.2784314, 1,
-0.2922323, 0.9070893, 0.2330357, 0, 1, 0.2862745, 1,
-0.2890832, -0.159213, -3.589162, 0, 1, 0.2901961, 1,
-0.2888943, -0.1183731, -1.097904, 0, 1, 0.2980392, 1,
-0.28096, -2.162416, -2.875428, 0, 1, 0.3058824, 1,
-0.2799744, -0.6055256, -2.368533, 0, 1, 0.3098039, 1,
-0.2789784, -1.763134, -4.166048, 0, 1, 0.3176471, 1,
-0.276011, 0.07202461, -3.206976, 0, 1, 0.3215686, 1,
-0.2702546, -0.3117124, -4.11665, 0, 1, 0.3294118, 1,
-0.2669092, 0.5359381, 0.1311599, 0, 1, 0.3333333, 1,
-0.2664167, 0.1429741, -0.4614696, 0, 1, 0.3411765, 1,
-0.2654755, 0.5084266, -0.166946, 0, 1, 0.345098, 1,
-0.2650281, 1.021974, -0.8240782, 0, 1, 0.3529412, 1,
-0.2645823, -0.6114292, -2.455661, 0, 1, 0.3568628, 1,
-0.2628807, 0.1059595, -1.491215, 0, 1, 0.3647059, 1,
-0.2565898, -0.2876329, -3.347937, 0, 1, 0.3686275, 1,
-0.2504096, -0.5784568, -2.931205, 0, 1, 0.3764706, 1,
-0.2439162, -2.874359, -2.563854, 0, 1, 0.3803922, 1,
-0.2416016, -2.047555, -3.294595, 0, 1, 0.3882353, 1,
-0.2347177, 0.5410771, -0.8995714, 0, 1, 0.3921569, 1,
-0.2213828, 0.7209225, -0.105637, 0, 1, 0.4, 1,
-0.2207406, -1.351162, -2.285883, 0, 1, 0.4078431, 1,
-0.2175726, 0.9622252, 1.335164, 0, 1, 0.4117647, 1,
-0.216376, 2.200725, 1.135589, 0, 1, 0.4196078, 1,
-0.214777, 0.6931202, 0.05046961, 0, 1, 0.4235294, 1,
-0.2110288, -2.125397, -2.072769, 0, 1, 0.4313726, 1,
-0.2090997, -0.2485514, -3.389192, 0, 1, 0.4352941, 1,
-0.2056832, 0.2307488, 0.6494077, 0, 1, 0.4431373, 1,
-0.2050541, -1.688133, -4.655495, 0, 1, 0.4470588, 1,
-0.2009419, 0.7708202, -1.6291, 0, 1, 0.454902, 1,
-0.2005417, -0.280773, -2.856452, 0, 1, 0.4588235, 1,
-0.1949146, -0.4928478, -2.73438, 0, 1, 0.4666667, 1,
-0.1941687, 0.2054099, -2.25992, 0, 1, 0.4705882, 1,
-0.1895759, 0.901015, -2.119862, 0, 1, 0.4784314, 1,
-0.1856889, 1.569887, -0.2733226, 0, 1, 0.4823529, 1,
-0.1808157, 0.2224752, 1.25937, 0, 1, 0.4901961, 1,
-0.1804758, 0.743852, -0.400351, 0, 1, 0.4941176, 1,
-0.1786433, 1.734265, -0.2092355, 0, 1, 0.5019608, 1,
-0.1738547, -1.011773, -3.521735, 0, 1, 0.509804, 1,
-0.1723683, 0.5353601, -1.061082, 0, 1, 0.5137255, 1,
-0.1701318, -1.552091, -3.512776, 0, 1, 0.5215687, 1,
-0.1679983, -0.3704535, -2.619035, 0, 1, 0.5254902, 1,
-0.1630917, -0.3518654, -2.214645, 0, 1, 0.5333334, 1,
-0.1627751, 0.6339215, -2.519305, 0, 1, 0.5372549, 1,
-0.1616723, -1.533637, -1.554619, 0, 1, 0.5450981, 1,
-0.1609921, -0.05815398, -1.495617, 0, 1, 0.5490196, 1,
-0.1581126, -0.8762762, -3.278679, 0, 1, 0.5568628, 1,
-0.1571322, -1.23598, -3.153234, 0, 1, 0.5607843, 1,
-0.1558351, -2.224488, -1.316866, 0, 1, 0.5686275, 1,
-0.1542066, 0.3888372, -1.743998, 0, 1, 0.572549, 1,
-0.1533666, -1.787482, -1.58428, 0, 1, 0.5803922, 1,
-0.1502286, -0.7522221, -2.169303, 0, 1, 0.5843138, 1,
-0.1485313, 0.1114278, -0.4545161, 0, 1, 0.5921569, 1,
-0.1464038, 0.7293915, -0.04311083, 0, 1, 0.5960785, 1,
-0.1459529, 0.3950005, -1.260816, 0, 1, 0.6039216, 1,
-0.1448973, 1.076887, -2.716069, 0, 1, 0.6117647, 1,
-0.1447557, -0.504325, -3.265121, 0, 1, 0.6156863, 1,
-0.1445193, -0.03816012, 0.008755012, 0, 1, 0.6235294, 1,
-0.1443095, 0.1384359, -1.117385, 0, 1, 0.627451, 1,
-0.1437723, 0.8530266, 1.517698, 0, 1, 0.6352941, 1,
-0.1428097, 0.374257, -1.122157, 0, 1, 0.6392157, 1,
-0.1382196, 1.282331, 0.9097412, 0, 1, 0.6470588, 1,
-0.1359265, -0.1464345, -1.771396, 0, 1, 0.6509804, 1,
-0.1331267, 0.4507867, 0.4958613, 0, 1, 0.6588235, 1,
-0.1317652, -0.2036344, -1.699481, 0, 1, 0.6627451, 1,
-0.1275261, 0.09684205, -0.5408257, 0, 1, 0.6705883, 1,
-0.1240916, 0.7361559, -0.8288429, 0, 1, 0.6745098, 1,
-0.1196043, 0.821811, 0.9720172, 0, 1, 0.682353, 1,
-0.117046, 1.15783, -1.042927, 0, 1, 0.6862745, 1,
-0.1134696, 0.3536891, 0.8591201, 0, 1, 0.6941177, 1,
-0.1117956, -1.967392, -4.181973, 0, 1, 0.7019608, 1,
-0.106636, 0.470346, -0.1935112, 0, 1, 0.7058824, 1,
-0.1041794, 0.09555463, -0.9537455, 0, 1, 0.7137255, 1,
-0.1017915, 1.125883, -0.5385268, 0, 1, 0.7176471, 1,
-0.1013075, -0.03363738, -0.7526137, 0, 1, 0.7254902, 1,
-0.09901728, 0.2821622, -1.033304, 0, 1, 0.7294118, 1,
-0.09426661, -1.30137, -1.956972, 0, 1, 0.7372549, 1,
-0.09411108, 0.2891894, 0.1097725, 0, 1, 0.7411765, 1,
-0.09143215, -0.1759005, -2.857827, 0, 1, 0.7490196, 1,
-0.09087877, -0.8170049, -4.542165, 0, 1, 0.7529412, 1,
-0.09053871, -1.162494, -1.213348, 0, 1, 0.7607843, 1,
-0.08810101, 1.893185, 0.6599237, 0, 1, 0.7647059, 1,
-0.08753091, -0.542789, -3.839646, 0, 1, 0.772549, 1,
-0.08401702, -1.184775, -3.426328, 0, 1, 0.7764706, 1,
-0.08138902, 1.567631, 0.08619535, 0, 1, 0.7843137, 1,
-0.0740035, -1.353943, -0.09439534, 0, 1, 0.7882353, 1,
-0.07202613, 1.031085, 0.3938893, 0, 1, 0.7960784, 1,
-0.06798787, -1.826899, -3.441325, 0, 1, 0.8039216, 1,
-0.06503489, -0.6662752, -1.645844, 0, 1, 0.8078431, 1,
-0.06454837, 0.1355107, 0.3351624, 0, 1, 0.8156863, 1,
-0.05836935, -0.7112711, -2.293715, 0, 1, 0.8196079, 1,
-0.05520365, 0.9800289, 0.442594, 0, 1, 0.827451, 1,
-0.05400154, -0.6194589, -3.372022, 0, 1, 0.8313726, 1,
-0.04910244, -0.4949561, -3.659476, 0, 1, 0.8392157, 1,
-0.047356, -1.036655, -1.719084, 0, 1, 0.8431373, 1,
-0.04633585, 0.7550635, 0.1497474, 0, 1, 0.8509804, 1,
-0.04364415, 0.9952465, -1.111677, 0, 1, 0.854902, 1,
-0.03948832, -1.220939, -2.966244, 0, 1, 0.8627451, 1,
-0.0390992, 1.065623, 0.7082011, 0, 1, 0.8666667, 1,
-0.037495, 0.1218495, 0.7426717, 0, 1, 0.8745098, 1,
-0.03557921, 0.4528722, -0.6993876, 0, 1, 0.8784314, 1,
-0.03451814, 0.8894027, -1.494047, 0, 1, 0.8862745, 1,
-0.0310594, -0.8176088, -1.141904, 0, 1, 0.8901961, 1,
-0.03103472, -0.6620552, -3.911772, 0, 1, 0.8980392, 1,
-0.02720443, 1.426879, -2.35382, 0, 1, 0.9058824, 1,
-0.02705225, -0.02763861, -2.373155, 0, 1, 0.9098039, 1,
-0.02586959, 0.7140021, -0.6365604, 0, 1, 0.9176471, 1,
-0.02024127, -0.246416, -3.13565, 0, 1, 0.9215686, 1,
-0.0163262, -0.4344845, -2.319137, 0, 1, 0.9294118, 1,
-0.01362208, 0.6469924, 0.4437425, 0, 1, 0.9333333, 1,
-0.01289686, 0.5793929, 1.177924, 0, 1, 0.9411765, 1,
-0.01189246, 0.01247517, -0.3369679, 0, 1, 0.945098, 1,
-0.01111393, 0.8366411, 0.6617694, 0, 1, 0.9529412, 1,
-0.01082839, -0.1296904, -3.353729, 0, 1, 0.9568627, 1,
-0.01075153, 0.1978367, -1.775865, 0, 1, 0.9647059, 1,
-0.009183326, 2.069843, 2.122421, 0, 1, 0.9686275, 1,
-0.007105492, 1.511336, 0.8715343, 0, 1, 0.9764706, 1,
-0.006992503, 0.1238577, 0.07066669, 0, 1, 0.9803922, 1,
-0.004735216, -0.7276924, -4.709688, 0, 1, 0.9882353, 1,
-0.003529039, 1.093916, 0.6852826, 0, 1, 0.9921569, 1,
0.002572097, 1.677984, 0.2076149, 0, 1, 1, 1,
0.003371147, -2.491177, 2.93296, 0, 0.9921569, 1, 1,
0.005970008, -0.6563429, 4.797153, 0, 0.9882353, 1, 1,
0.006885435, -0.9026302, 2.678989, 0, 0.9803922, 1, 1,
0.007822311, 0.8567806, -1.504324, 0, 0.9764706, 1, 1,
0.007953945, 0.8258656, 0.7622892, 0, 0.9686275, 1, 1,
0.009488516, 1.934243, -0.5720235, 0, 0.9647059, 1, 1,
0.01002272, -0.127798, 4.239305, 0, 0.9568627, 1, 1,
0.01178975, 0.3293155, -0.2711019, 0, 0.9529412, 1, 1,
0.01390662, -0.5612564, 2.678225, 0, 0.945098, 1, 1,
0.02012767, 1.102928, -1.432312, 0, 0.9411765, 1, 1,
0.02247139, 0.6212075, 1.172771, 0, 0.9333333, 1, 1,
0.02653271, 1.531759, -0.3652646, 0, 0.9294118, 1, 1,
0.0276485, 1.077516, -0.6493883, 0, 0.9215686, 1, 1,
0.02888627, -0.3063702, 5.054029, 0, 0.9176471, 1, 1,
0.0301723, 2.004257, -1.076175, 0, 0.9098039, 1, 1,
0.03292936, 0.1529713, -1.458639, 0, 0.9058824, 1, 1,
0.03534662, -1.010402, 2.462475, 0, 0.8980392, 1, 1,
0.04382895, -0.6742161, 2.391284, 0, 0.8901961, 1, 1,
0.04639315, -2.338415, 3.863263, 0, 0.8862745, 1, 1,
0.05072125, 0.07509392, -0.4166498, 0, 0.8784314, 1, 1,
0.05491551, 1.183634, 0.6146321, 0, 0.8745098, 1, 1,
0.05767706, 0.9153927, -0.5316737, 0, 0.8666667, 1, 1,
0.05883175, -0.2653103, 3.48507, 0, 0.8627451, 1, 1,
0.06145413, 1.850916, 2.030853, 0, 0.854902, 1, 1,
0.06316411, -1.83954, 3.040948, 0, 0.8509804, 1, 1,
0.06385122, 1.794981, -0.547627, 0, 0.8431373, 1, 1,
0.06694637, -1.139196, 2.667134, 0, 0.8392157, 1, 1,
0.07549624, 0.0640102, 0.8299311, 0, 0.8313726, 1, 1,
0.07603785, -0.5791345, 3.111678, 0, 0.827451, 1, 1,
0.08107523, 1.626348, 0.3975164, 0, 0.8196079, 1, 1,
0.0819264, -0.2937214, 3.015993, 0, 0.8156863, 1, 1,
0.08393942, -0.5759409, 5.165313, 0, 0.8078431, 1, 1,
0.0867584, -0.3801328, 1.462883, 0, 0.8039216, 1, 1,
0.08736211, 0.06880088, 1.982479, 0, 0.7960784, 1, 1,
0.0876675, 1.020787, 1.63596, 0, 0.7882353, 1, 1,
0.0897861, -0.3552621, 1.993837, 0, 0.7843137, 1, 1,
0.08998189, 0.1323085, 0.3502791, 0, 0.7764706, 1, 1,
0.0926239, 1.022421, -0.0242092, 0, 0.772549, 1, 1,
0.09400724, -0.8498856, 3.496176, 0, 0.7647059, 1, 1,
0.09687047, -0.7495949, 2.422781, 0, 0.7607843, 1, 1,
0.09776261, -1.42928, 3.122821, 0, 0.7529412, 1, 1,
0.1015607, 0.07304472, 1.553457, 0, 0.7490196, 1, 1,
0.1041459, 1.926238, -0.5587429, 0, 0.7411765, 1, 1,
0.104431, 0.3296427, 1.633112, 0, 0.7372549, 1, 1,
0.1050711, 0.6721331, 1.228478, 0, 0.7294118, 1, 1,
0.1056259, 0.1717111, 0.2999817, 0, 0.7254902, 1, 1,
0.109942, -0.1900883, 2.600093, 0, 0.7176471, 1, 1,
0.1114448, -0.6818669, 3.459184, 0, 0.7137255, 1, 1,
0.1117957, 0.3109094, 0.0266393, 0, 0.7058824, 1, 1,
0.1136031, -1.187633, 3.591041, 0, 0.6980392, 1, 1,
0.1171858, -0.3933882, 3.239347, 0, 0.6941177, 1, 1,
0.1199139, -0.6851646, 2.724824, 0, 0.6862745, 1, 1,
0.1286829, -0.8156499, 3.882349, 0, 0.682353, 1, 1,
0.1287526, -3.261371, 4.991832, 0, 0.6745098, 1, 1,
0.1311566, -1.312267, 1.830972, 0, 0.6705883, 1, 1,
0.1326386, -1.868518, 3.102374, 0, 0.6627451, 1, 1,
0.133509, -2.794841, 3.564253, 0, 0.6588235, 1, 1,
0.1342083, -0.6014822, 1.969508, 0, 0.6509804, 1, 1,
0.1386133, 1.086064, -0.2550825, 0, 0.6470588, 1, 1,
0.1404516, 1.352188, -0.3965557, 0, 0.6392157, 1, 1,
0.1412563, -0.2827037, 1.288288, 0, 0.6352941, 1, 1,
0.1419857, -1.162231, 4.109471, 0, 0.627451, 1, 1,
0.1433755, 0.7533232, 0.830072, 0, 0.6235294, 1, 1,
0.1439684, 0.5608519, -0.4017663, 0, 0.6156863, 1, 1,
0.1501553, -1.020373, 4.840938, 0, 0.6117647, 1, 1,
0.1505779, 0.7903157, 0.7728276, 0, 0.6039216, 1, 1,
0.151665, -0.5349031, 3.59935, 0, 0.5960785, 1, 1,
0.1521433, -0.3371307, 2.720678, 0, 0.5921569, 1, 1,
0.1574477, -0.3414889, 3.0176, 0, 0.5843138, 1, 1,
0.1583497, 0.5010089, 1.107153, 0, 0.5803922, 1, 1,
0.1606904, -0.0812882, 0.561068, 0, 0.572549, 1, 1,
0.1631634, -1.078532, 2.385079, 0, 0.5686275, 1, 1,
0.1632857, 0.444228, 1.161458, 0, 0.5607843, 1, 1,
0.1643289, 0.926536, 0.4895739, 0, 0.5568628, 1, 1,
0.167917, 0.5469763, -0.2574832, 0, 0.5490196, 1, 1,
0.1693377, -1.248987, 3.988026, 0, 0.5450981, 1, 1,
0.1712837, -0.3328418, 2.835514, 0, 0.5372549, 1, 1,
0.1731509, -0.7720173, 3.932152, 0, 0.5333334, 1, 1,
0.174751, 0.8139092, 0.7917466, 0, 0.5254902, 1, 1,
0.1748141, -1.079031, 3.226914, 0, 0.5215687, 1, 1,
0.1748442, 0.298756, 0.380385, 0, 0.5137255, 1, 1,
0.1751725, -1.506414, 3.519382, 0, 0.509804, 1, 1,
0.1775859, -0.8290632, 3.49976, 0, 0.5019608, 1, 1,
0.1778316, -0.1631142, 2.194966, 0, 0.4941176, 1, 1,
0.1781999, -0.4198986, 2.389071, 0, 0.4901961, 1, 1,
0.1787701, 0.3441635, 0.03541427, 0, 0.4823529, 1, 1,
0.1808439, 0.2156945, 1.73614, 0, 0.4784314, 1, 1,
0.182587, 2.821381, -0.4686106, 0, 0.4705882, 1, 1,
0.1826726, -1.157448, 3.0699, 0, 0.4666667, 1, 1,
0.1832535, 0.976003, 0.1866891, 0, 0.4588235, 1, 1,
0.1869009, -0.08389807, 1.801594, 0, 0.454902, 1, 1,
0.1924876, -0.6516289, 2.526308, 0, 0.4470588, 1, 1,
0.195738, 0.9921702, -0.4315887, 0, 0.4431373, 1, 1,
0.196659, -1.879787, 2.558103, 0, 0.4352941, 1, 1,
0.2048601, -0.5998976, 3.406023, 0, 0.4313726, 1, 1,
0.207567, -0.9312884, 2.517149, 0, 0.4235294, 1, 1,
0.2098702, 0.004878765, 0.5287105, 0, 0.4196078, 1, 1,
0.2155199, -1.312126, 3.61621, 0, 0.4117647, 1, 1,
0.2307127, -0.1199534, 1.118468, 0, 0.4078431, 1, 1,
0.2344248, 1.239022, -1.350586, 0, 0.4, 1, 1,
0.2378114, -0.1571855, 2.796819, 0, 0.3921569, 1, 1,
0.2416057, -0.4463383, 2.318283, 0, 0.3882353, 1, 1,
0.242873, -0.07034971, 0.7235568, 0, 0.3803922, 1, 1,
0.2473434, 0.3594839, -0.4905193, 0, 0.3764706, 1, 1,
0.2520965, 0.3645554, 1.486494, 0, 0.3686275, 1, 1,
0.2556392, -1.810845, 4.107253, 0, 0.3647059, 1, 1,
0.2578498, -1.16061, 2.938414, 0, 0.3568628, 1, 1,
0.2628586, -0.4612771, 4.216619, 0, 0.3529412, 1, 1,
0.2653267, -0.01360224, 1.583363, 0, 0.345098, 1, 1,
0.2701806, -0.8269771, 2.962878, 0, 0.3411765, 1, 1,
0.2727373, -1.595141, 4.100904, 0, 0.3333333, 1, 1,
0.2748121, 0.787105, 0.7722765, 0, 0.3294118, 1, 1,
0.2748841, 0.9574314, 0.2282475, 0, 0.3215686, 1, 1,
0.2758024, -0.6460482, 4.05722, 0, 0.3176471, 1, 1,
0.2764941, 0.6334815, -0.973841, 0, 0.3098039, 1, 1,
0.2771735, 1.155052, 0.4661628, 0, 0.3058824, 1, 1,
0.284502, -1.993979, 2.841389, 0, 0.2980392, 1, 1,
0.2889397, 0.817802, 0.2403694, 0, 0.2901961, 1, 1,
0.2913783, -2.015767, 3.996122, 0, 0.2862745, 1, 1,
0.2945813, -0.400103, 4.64525, 0, 0.2784314, 1, 1,
0.295461, 1.325619, 0.9074826, 0, 0.2745098, 1, 1,
0.2991543, 1.590108, -1.509424, 0, 0.2666667, 1, 1,
0.3021249, -0.4284383, 3.139242, 0, 0.2627451, 1, 1,
0.30304, 0.9876249, -1.76479, 0, 0.254902, 1, 1,
0.303252, 0.212721, -0.5401612, 0, 0.2509804, 1, 1,
0.3063028, 0.6797969, 0.9178851, 0, 0.2431373, 1, 1,
0.3078502, 0.6900339, 1.53325, 0, 0.2392157, 1, 1,
0.3138274, 1.674992, -0.339994, 0, 0.2313726, 1, 1,
0.3167181, 0.1312579, 2.351228, 0, 0.227451, 1, 1,
0.3181561, 0.1957294, 1.259516, 0, 0.2196078, 1, 1,
0.3200523, 0.2438827, -0.01485607, 0, 0.2156863, 1, 1,
0.3219638, -1.368934, 1.161839, 0, 0.2078431, 1, 1,
0.3243307, -1.029681, 5.224846, 0, 0.2039216, 1, 1,
0.3252433, 1.080418, -0.5102953, 0, 0.1960784, 1, 1,
0.3254252, -0.03564768, 0.9742705, 0, 0.1882353, 1, 1,
0.3289947, 0.1838249, 1.886302, 0, 0.1843137, 1, 1,
0.3296499, 0.5620509, 0.5244076, 0, 0.1764706, 1, 1,
0.3309296, 0.6420159, 0.2082932, 0, 0.172549, 1, 1,
0.3356836, -1.598827, 3.875994, 0, 0.1647059, 1, 1,
0.3364573, 0.3746151, -0.6543663, 0, 0.1607843, 1, 1,
0.3388802, -2.919323, 3.941596, 0, 0.1529412, 1, 1,
0.340826, 1.069401, -0.1580723, 0, 0.1490196, 1, 1,
0.3413003, -0.2354634, 1.150222, 0, 0.1411765, 1, 1,
0.3467322, -0.558651, 1.417524, 0, 0.1372549, 1, 1,
0.3485624, 0.5784565, 1.474899, 0, 0.1294118, 1, 1,
0.3503432, 1.822694, 1.631429, 0, 0.1254902, 1, 1,
0.3515684, -1.002795, 2.637639, 0, 0.1176471, 1, 1,
0.3537773, -0.299788, 2.471408, 0, 0.1137255, 1, 1,
0.3543181, -1.636458, 4.926269, 0, 0.1058824, 1, 1,
0.3546585, -0.3584548, 3.99301, 0, 0.09803922, 1, 1,
0.3555878, -0.6088562, 2.293829, 0, 0.09411765, 1, 1,
0.3558457, -0.5267227, 4.129073, 0, 0.08627451, 1, 1,
0.357951, -0.3991807, 1.547434, 0, 0.08235294, 1, 1,
0.358408, 1.409546, 1.437356, 0, 0.07450981, 1, 1,
0.3600152, -0.3381678, 2.627565, 0, 0.07058824, 1, 1,
0.3620685, -1.402926, 2.783252, 0, 0.0627451, 1, 1,
0.3621802, -0.6686265, 3.30224, 0, 0.05882353, 1, 1,
0.3651538, -1.348894, 2.955435, 0, 0.05098039, 1, 1,
0.3680034, -0.5598105, 2.243679, 0, 0.04705882, 1, 1,
0.368154, -0.04843371, 2.921512, 0, 0.03921569, 1, 1,
0.3699933, -0.2220632, 3.165809, 0, 0.03529412, 1, 1,
0.3704281, 0.2094691, 0.6402735, 0, 0.02745098, 1, 1,
0.3706737, -0.5023931, 1.286674, 0, 0.02352941, 1, 1,
0.3748277, -0.4519229, 3.978746, 0, 0.01568628, 1, 1,
0.3766443, 0.3891144, -0.589211, 0, 0.01176471, 1, 1,
0.3777961, -0.1556784, 1.45061, 0, 0.003921569, 1, 1,
0.3823229, -0.7442513, 2.870394, 0.003921569, 0, 1, 1,
0.3825035, 0.4076728, 1.950469, 0.007843138, 0, 1, 1,
0.3830324, 0.6575598, -3.092598, 0.01568628, 0, 1, 1,
0.3845347, 0.3922104, 1.962239, 0.01960784, 0, 1, 1,
0.3848416, 0.2139983, -0.5245379, 0.02745098, 0, 1, 1,
0.3865109, 0.2869387, -0.1012626, 0.03137255, 0, 1, 1,
0.3915662, 0.6041662, -0.8570848, 0.03921569, 0, 1, 1,
0.3932351, -0.6660231, 3.452002, 0.04313726, 0, 1, 1,
0.3940931, 0.2214206, 0.9777793, 0.05098039, 0, 1, 1,
0.3954577, 0.06943398, 1.776284, 0.05490196, 0, 1, 1,
0.395583, 0.6745827, -0.05375945, 0.0627451, 0, 1, 1,
0.3957266, 0.2773067, 1.298763, 0.06666667, 0, 1, 1,
0.3988205, 0.2503161, 1.042885, 0.07450981, 0, 1, 1,
0.3995379, -1.018906, 4.106059, 0.07843138, 0, 1, 1,
0.4005811, 1.623812, 0.6094381, 0.08627451, 0, 1, 1,
0.4026968, -1.256264, 3.577984, 0.09019608, 0, 1, 1,
0.4048574, 1.635665, -0.3656381, 0.09803922, 0, 1, 1,
0.4068723, 0.8693258, 2.517726, 0.1058824, 0, 1, 1,
0.4093188, -1.055468, 3.647406, 0.1098039, 0, 1, 1,
0.41085, -1.628256, 3.304177, 0.1176471, 0, 1, 1,
0.4148424, 0.3435637, 1.588717, 0.1215686, 0, 1, 1,
0.4166711, -1.074541, 2.442754, 0.1294118, 0, 1, 1,
0.4214965, 0.769183, -0.1464372, 0.1333333, 0, 1, 1,
0.4242036, 0.2824104, 0.6214554, 0.1411765, 0, 1, 1,
0.4242519, 1.346195, 0.6473377, 0.145098, 0, 1, 1,
0.4258974, 0.4755828, 0.3112735, 0.1529412, 0, 1, 1,
0.4283623, -0.05820388, 2.743576, 0.1568628, 0, 1, 1,
0.4290066, -1.041706, 2.590269, 0.1647059, 0, 1, 1,
0.4362903, -0.3892297, 3.150814, 0.1686275, 0, 1, 1,
0.4363942, -2.280058, 2.704129, 0.1764706, 0, 1, 1,
0.4381741, -0.3249296, 1.689721, 0.1803922, 0, 1, 1,
0.439404, 0.8742958, 1.470185, 0.1882353, 0, 1, 1,
0.4396055, -0.03200683, 2.600038, 0.1921569, 0, 1, 1,
0.4415064, -0.354889, 1.998705, 0.2, 0, 1, 1,
0.4416247, -2.081257, 2.304013, 0.2078431, 0, 1, 1,
0.4453165, -0.9950279, 2.422502, 0.2117647, 0, 1, 1,
0.4468845, 1.44105, 0.534568, 0.2196078, 0, 1, 1,
0.4490219, 0.8444955, 0.07411807, 0.2235294, 0, 1, 1,
0.4520161, -0.7043152, 3.635081, 0.2313726, 0, 1, 1,
0.4559772, -1.434928, 4.777221, 0.2352941, 0, 1, 1,
0.4572365, 0.0942108, 1.665318, 0.2431373, 0, 1, 1,
0.4596489, -1.008176, 4.046133, 0.2470588, 0, 1, 1,
0.4661726, 2.730097, -0.6091183, 0.254902, 0, 1, 1,
0.4717924, 1.07943, 0.6271704, 0.2588235, 0, 1, 1,
0.4733488, 0.7448182, 1.78676, 0.2666667, 0, 1, 1,
0.4901914, 0.1909103, 2.334086, 0.2705882, 0, 1, 1,
0.4948044, 0.8100256, 1.038354, 0.2784314, 0, 1, 1,
0.4961902, 1.323495, 0.3294167, 0.282353, 0, 1, 1,
0.4966706, -0.1721303, 1.992579, 0.2901961, 0, 1, 1,
0.5007595, -1.489187, 1.279942, 0.2941177, 0, 1, 1,
0.50298, -0.6451576, 1.111291, 0.3019608, 0, 1, 1,
0.5048478, 0.3199541, 2.150682, 0.3098039, 0, 1, 1,
0.5050305, 0.2000295, 1.445201, 0.3137255, 0, 1, 1,
0.5109615, -0.1440571, 1.713692, 0.3215686, 0, 1, 1,
0.5112303, -0.912703, 2.210289, 0.3254902, 0, 1, 1,
0.5113521, -0.9689262, 2.644524, 0.3333333, 0, 1, 1,
0.5113799, -0.09409846, 1.306702, 0.3372549, 0, 1, 1,
0.5132405, 1.616568, 0.469386, 0.345098, 0, 1, 1,
0.5169187, -1.01311, 3.581185, 0.3490196, 0, 1, 1,
0.5236548, -1.063937, 3.814513, 0.3568628, 0, 1, 1,
0.5239908, -0.7688258, 2.193939, 0.3607843, 0, 1, 1,
0.5246041, 0.287433, 2.815598, 0.3686275, 0, 1, 1,
0.5304239, 0.6825351, 1.145242, 0.372549, 0, 1, 1,
0.5336315, -0.5579528, 2.130692, 0.3803922, 0, 1, 1,
0.5336657, -0.6655146, 3.355829, 0.3843137, 0, 1, 1,
0.5383161, -0.2246024, 0.5474358, 0.3921569, 0, 1, 1,
0.5383872, -0.5543704, 1.2902, 0.3960784, 0, 1, 1,
0.5460335, -0.1837072, 2.492679, 0.4039216, 0, 1, 1,
0.5582515, -0.9374216, 2.547578, 0.4117647, 0, 1, 1,
0.5587849, -1.522615, 2.033128, 0.4156863, 0, 1, 1,
0.5588257, -1.048, 2.061901, 0.4235294, 0, 1, 1,
0.5590442, -0.6615134, 1.580015, 0.427451, 0, 1, 1,
0.5591831, -0.04868553, 1.268557, 0.4352941, 0, 1, 1,
0.5614678, -0.9900775, 2.32651, 0.4392157, 0, 1, 1,
0.5615517, 1.178495, 0.2181797, 0.4470588, 0, 1, 1,
0.5637797, 1.150137, -0.785317, 0.4509804, 0, 1, 1,
0.5728861, -0.5660859, 2.827433, 0.4588235, 0, 1, 1,
0.5747952, -0.01682954, 1.930739, 0.4627451, 0, 1, 1,
0.5800586, 0.2046523, 1.56204, 0.4705882, 0, 1, 1,
0.5800723, 1.008218, 0.1860235, 0.4745098, 0, 1, 1,
0.5820321, 0.6248174, 1.007067, 0.4823529, 0, 1, 1,
0.5866814, 0.8682922, 1.27262, 0.4862745, 0, 1, 1,
0.5880387, 0.3576998, 1.158329, 0.4941176, 0, 1, 1,
0.5883079, 1.264334, -1.294618, 0.5019608, 0, 1, 1,
0.5886235, -0.3613256, 0.9579542, 0.5058824, 0, 1, 1,
0.5989298, -0.6115817, 2.124107, 0.5137255, 0, 1, 1,
0.6000009, -0.7771665, 2.047412, 0.5176471, 0, 1, 1,
0.603709, -0.08547324, 2.622686, 0.5254902, 0, 1, 1,
0.6045308, -0.2416554, 0.05909105, 0.5294118, 0, 1, 1,
0.6060259, -0.2040682, 3.075504, 0.5372549, 0, 1, 1,
0.6101109, 0.07424884, 2.305067, 0.5411765, 0, 1, 1,
0.6116937, 1.665791, 0.8499624, 0.5490196, 0, 1, 1,
0.6125485, -0.06621105, 3.547987, 0.5529412, 0, 1, 1,
0.6158111, -0.2466495, 1.463395, 0.5607843, 0, 1, 1,
0.6364744, -1.157908, 3.351334, 0.5647059, 0, 1, 1,
0.6431723, 0.3276744, 1.16198, 0.572549, 0, 1, 1,
0.6433506, -0.6593928, 2.037998, 0.5764706, 0, 1, 1,
0.6461414, 1.086877, 0.4720539, 0.5843138, 0, 1, 1,
0.6466425, 1.443358, 1.340011, 0.5882353, 0, 1, 1,
0.6468047, 0.7595747, -0.5599248, 0.5960785, 0, 1, 1,
0.6559786, 0.4823543, 0.4692482, 0.6039216, 0, 1, 1,
0.659517, 0.2158718, 0.1984373, 0.6078432, 0, 1, 1,
0.6611187, -0.2257491, 2.649764, 0.6156863, 0, 1, 1,
0.6615061, 0.6012523, -0.4358397, 0.6196079, 0, 1, 1,
0.6619862, 1.096678, 0.8286117, 0.627451, 0, 1, 1,
0.662025, -1.293893, 1.865736, 0.6313726, 0, 1, 1,
0.6633205, 0.52453, -0.8104917, 0.6392157, 0, 1, 1,
0.6667842, 0.1049376, 3.563133, 0.6431373, 0, 1, 1,
0.670236, 1.240691, 1.455608, 0.6509804, 0, 1, 1,
0.6719741, 0.7506877, 1.333227, 0.654902, 0, 1, 1,
0.6748996, -0.3261119, 2.811935, 0.6627451, 0, 1, 1,
0.6786782, 1.734435, 0.6950603, 0.6666667, 0, 1, 1,
0.6798899, -0.0436842, 1.80758, 0.6745098, 0, 1, 1,
0.6806511, 0.9413807, 1.771738, 0.6784314, 0, 1, 1,
0.6826469, -0.6583162, 1.862801, 0.6862745, 0, 1, 1,
0.6835141, -0.9565666, 2.373626, 0.6901961, 0, 1, 1,
0.6861788, -0.1603321, 2.555004, 0.6980392, 0, 1, 1,
0.6894222, -1.007899, 2.733081, 0.7058824, 0, 1, 1,
0.6904897, -0.1191144, 2.68785, 0.7098039, 0, 1, 1,
0.6911134, 1.286656, 1.463291, 0.7176471, 0, 1, 1,
0.6981744, -2.197791, 2.661264, 0.7215686, 0, 1, 1,
0.6989208, 0.3707402, -0.4269297, 0.7294118, 0, 1, 1,
0.6989642, -1.035566, 2.654971, 0.7333333, 0, 1, 1,
0.7006667, 0.6509792, -0.4302433, 0.7411765, 0, 1, 1,
0.7007262, 1.054007, 1.496514, 0.7450981, 0, 1, 1,
0.7076074, 0.2424661, 1.463343, 0.7529412, 0, 1, 1,
0.7107788, 1.061626, 1.648438, 0.7568628, 0, 1, 1,
0.7134866, -0.6576943, 3.825611, 0.7647059, 0, 1, 1,
0.7134948, 1.782964, 0.05842059, 0.7686275, 0, 1, 1,
0.7161142, 0.2621565, -0.5402124, 0.7764706, 0, 1, 1,
0.7172201, -1.051262, 3.134633, 0.7803922, 0, 1, 1,
0.7175095, -0.4964266, 1.551082, 0.7882353, 0, 1, 1,
0.7274503, -0.2965083, 1.187366, 0.7921569, 0, 1, 1,
0.7276035, -0.1425224, 2.344794, 0.8, 0, 1, 1,
0.7352807, -0.2809389, 0.7897515, 0.8078431, 0, 1, 1,
0.7462426, -0.09219057, 1.497006, 0.8117647, 0, 1, 1,
0.748227, 1.000054, 0.08114537, 0.8196079, 0, 1, 1,
0.7555393, 2.746512, 1.415754, 0.8235294, 0, 1, 1,
0.7567151, -1.150748, 1.680872, 0.8313726, 0, 1, 1,
0.7640166, 0.3508232, 2.017654, 0.8352941, 0, 1, 1,
0.769379, 0.3669417, -0.05336862, 0.8431373, 0, 1, 1,
0.7702715, 0.4764707, 0.4874413, 0.8470588, 0, 1, 1,
0.771366, 0.3677236, 0.8228673, 0.854902, 0, 1, 1,
0.7720221, -1.341305, 4.566773, 0.8588235, 0, 1, 1,
0.7755906, 0.2829636, 0.9976726, 0.8666667, 0, 1, 1,
0.781875, -1.347345, 3.101127, 0.8705882, 0, 1, 1,
0.7835552, 0.2992801, 1.058113, 0.8784314, 0, 1, 1,
0.7884409, -0.4141511, 0.1626658, 0.8823529, 0, 1, 1,
0.7948478, -2.191509, 3.449614, 0.8901961, 0, 1, 1,
0.7956681, 0.4730071, 0.4442138, 0.8941177, 0, 1, 1,
0.8009159, 0.2343165, 2.395702, 0.9019608, 0, 1, 1,
0.8020815, 0.9263916, -0.6862927, 0.9098039, 0, 1, 1,
0.8044348, 1.150554, 0.9619367, 0.9137255, 0, 1, 1,
0.8045696, 0.01325407, 2.326958, 0.9215686, 0, 1, 1,
0.8126522, 0.5670509, 1.631159, 0.9254902, 0, 1, 1,
0.8147212, -0.4140656, 0.9921997, 0.9333333, 0, 1, 1,
0.8175356, -0.7735963, 1.16501, 0.9372549, 0, 1, 1,
0.8232802, -1.380918, 1.564284, 0.945098, 0, 1, 1,
0.8324629, -1.826782, 3.531521, 0.9490196, 0, 1, 1,
0.8331143, -0.05138941, 0.9327208, 0.9568627, 0, 1, 1,
0.8351839, 0.05477916, 2.972796, 0.9607843, 0, 1, 1,
0.8371316, -0.7222046, 3.032348, 0.9686275, 0, 1, 1,
0.8424242, 1.016387, -0.2614896, 0.972549, 0, 1, 1,
0.8426364, -0.2429359, 1.88544, 0.9803922, 0, 1, 1,
0.8436803, -0.8703265, 3.562867, 0.9843137, 0, 1, 1,
0.8438765, -1.010333, 2.391522, 0.9921569, 0, 1, 1,
0.8445601, -0.0879666, 3.756514, 0.9960784, 0, 1, 1,
0.8518755, 0.04974858, 0.2680671, 1, 0, 0.9960784, 1,
0.8528697, 0.2026072, 0.1329048, 1, 0, 0.9882353, 1,
0.8633186, 2.513637, 1.661109, 1, 0, 0.9843137, 1,
0.8682869, 0.4649802, 1.040235, 1, 0, 0.9764706, 1,
0.8710299, -0.8155774, 3.608129, 1, 0, 0.972549, 1,
0.874876, 0.427863, 1.113949, 1, 0, 0.9647059, 1,
0.8754067, -0.4457515, 2.6722, 1, 0, 0.9607843, 1,
0.8760569, -0.8624187, 2.06831, 1, 0, 0.9529412, 1,
0.878414, -0.4999795, 0.6547675, 1, 0, 0.9490196, 1,
0.8829449, -0.129729, 2.207658, 1, 0, 0.9411765, 1,
0.8847514, -1.436415, 5.21859, 1, 0, 0.9372549, 1,
0.8871701, -0.7707943, 1.047815, 1, 0, 0.9294118, 1,
0.8877354, -1.418838, 1.817534, 1, 0, 0.9254902, 1,
0.8914061, -0.630556, 3.950913, 1, 0, 0.9176471, 1,
0.8933374, -1.13551, 3.009506, 1, 0, 0.9137255, 1,
0.8933513, 0.8866264, -0.2514418, 1, 0, 0.9058824, 1,
0.8959196, 2.830802, -1.036564, 1, 0, 0.9019608, 1,
0.9017738, -1.106242, 1.248025, 1, 0, 0.8941177, 1,
0.9039932, -0.1525104, 1.232333, 1, 0, 0.8862745, 1,
0.9098826, -0.5318891, 0.7033674, 1, 0, 0.8823529, 1,
0.9142442, -0.6895826, 2.929316, 1, 0, 0.8745098, 1,
0.9149424, 0.9691672, 0.439678, 1, 0, 0.8705882, 1,
0.9257452, -0.5750224, 2.221905, 1, 0, 0.8627451, 1,
0.9283309, 1.492168, 1.639954, 1, 0, 0.8588235, 1,
0.9298258, 1.373418, 0.6105397, 1, 0, 0.8509804, 1,
0.9316382, 0.5651256, 1.345094, 1, 0, 0.8470588, 1,
0.9430244, 0.1962393, 2.015354, 1, 0, 0.8392157, 1,
0.9470698, 0.1321469, 3.243342, 1, 0, 0.8352941, 1,
0.9510364, 0.3569007, 0.871761, 1, 0, 0.827451, 1,
0.9631066, 1.078544, 1.983428, 1, 0, 0.8235294, 1,
0.9646712, 1.767827, -0.6830316, 1, 0, 0.8156863, 1,
0.973187, 0.2471622, 1.709085, 1, 0, 0.8117647, 1,
0.9750414, 1.890534, -0.1953711, 1, 0, 0.8039216, 1,
0.9794821, 0.9146378, 0.5929976, 1, 0, 0.7960784, 1,
0.9887254, 2.681577, -0.2766098, 1, 0, 0.7921569, 1,
1.00062, 1.308357, 0.4889141, 1, 0, 0.7843137, 1,
1.000657, 1.794394, 1.280275, 1, 0, 0.7803922, 1,
1.002479, 0.2786592, 0.4493831, 1, 0, 0.772549, 1,
1.004963, -0.3223794, 1.055524, 1, 0, 0.7686275, 1,
1.005083, 0.8384685, 0.7579071, 1, 0, 0.7607843, 1,
1.008756, 0.5638769, 2.331426, 1, 0, 0.7568628, 1,
1.009642, -0.1836172, 1.694526, 1, 0, 0.7490196, 1,
1.014133, 0.2097829, 4.075562, 1, 0, 0.7450981, 1,
1.02344, -0.8907661, 1.771312, 1, 0, 0.7372549, 1,
1.029321, -0.2962228, 2.511529, 1, 0, 0.7333333, 1,
1.032622, 1.164297, -0.08437393, 1, 0, 0.7254902, 1,
1.037844, 0.7572577, 1.52182, 1, 0, 0.7215686, 1,
1.038033, -0.1469046, 1.506043, 1, 0, 0.7137255, 1,
1.049214, -0.2749319, 3.229433, 1, 0, 0.7098039, 1,
1.052476, -0.3933753, 3.978366, 1, 0, 0.7019608, 1,
1.066061, 0.8331854, 2.373428, 1, 0, 0.6941177, 1,
1.066393, 0.0310731, 2.163454, 1, 0, 0.6901961, 1,
1.066961, -0.4556548, 2.024832, 1, 0, 0.682353, 1,
1.06917, 0.2475983, 0.06879914, 1, 0, 0.6784314, 1,
1.087922, 0.6456335, 0.6925408, 1, 0, 0.6705883, 1,
1.095632, 0.1357572, -0.6979249, 1, 0, 0.6666667, 1,
1.098731, -0.9856725, 1.040523, 1, 0, 0.6588235, 1,
1.102036, 0.08286618, 1.680492, 1, 0, 0.654902, 1,
1.104891, 1.406177, 1.413823, 1, 0, 0.6470588, 1,
1.106895, 0.1920215, 2.100082, 1, 0, 0.6431373, 1,
1.118611, -0.03462823, 2.061968, 1, 0, 0.6352941, 1,
1.123803, 0.6817995, 1.761287, 1, 0, 0.6313726, 1,
1.140022, 0.975283, 0.5748289, 1, 0, 0.6235294, 1,
1.14916, -1.91263, 1.901889, 1, 0, 0.6196079, 1,
1.150991, -1.5138, 2.147048, 1, 0, 0.6117647, 1,
1.157355, -0.08568647, 1.099261, 1, 0, 0.6078432, 1,
1.161974, 0.2086084, 1.964867, 1, 0, 0.6, 1,
1.175149, 0.6153687, 1.185429, 1, 0, 0.5921569, 1,
1.179184, -0.367463, 2.908995, 1, 0, 0.5882353, 1,
1.183288, 0.106571, 2.841832, 1, 0, 0.5803922, 1,
1.185809, -0.3599399, 0.7708709, 1, 0, 0.5764706, 1,
1.193574, -2.087923, 1.543392, 1, 0, 0.5686275, 1,
1.202198, -0.9818291, 1.928915, 1, 0, 0.5647059, 1,
1.213682, -0.04846784, 0.7371573, 1, 0, 0.5568628, 1,
1.215614, 0.01642403, 1.999033, 1, 0, 0.5529412, 1,
1.229517, -1.087124, 3.29805, 1, 0, 0.5450981, 1,
1.231408, -0.3797583, 1.399682, 1, 0, 0.5411765, 1,
1.232981, -0.1306781, 1.250327, 1, 0, 0.5333334, 1,
1.260115, 0.6039428, 1.825936, 1, 0, 0.5294118, 1,
1.261641, -1.178019, 3.339262, 1, 0, 0.5215687, 1,
1.261704, -0.07746764, 0.7253109, 1, 0, 0.5176471, 1,
1.272404, 0.00497701, -0.4737839, 1, 0, 0.509804, 1,
1.292891, 1.131602, 1.713734, 1, 0, 0.5058824, 1,
1.298254, 0.08239529, 0.5641301, 1, 0, 0.4980392, 1,
1.299699, 1.141156, 0.7949302, 1, 0, 0.4901961, 1,
1.300844, -0.2543352, 1.935863, 1, 0, 0.4862745, 1,
1.317328, -1.063964, 2.464943, 1, 0, 0.4784314, 1,
1.339735, 0.7222599, 1.66555, 1, 0, 0.4745098, 1,
1.345783, -0.05044414, 4.197988, 1, 0, 0.4666667, 1,
1.364665, -0.006164095, 3.294086, 1, 0, 0.4627451, 1,
1.368412, -1.891843, 3.195882, 1, 0, 0.454902, 1,
1.383382, 0.8092873, -0.754485, 1, 0, 0.4509804, 1,
1.390848, 0.1144494, 1.962352, 1, 0, 0.4431373, 1,
1.393378, 0.4198516, 1.386953, 1, 0, 0.4392157, 1,
1.393666, 1.857931, 0.5090864, 1, 0, 0.4313726, 1,
1.399825, -0.3506249, 2.75086, 1, 0, 0.427451, 1,
1.407401, -0.2853263, 2.535673, 1, 0, 0.4196078, 1,
1.419671, 0.8755063, 1.404685, 1, 0, 0.4156863, 1,
1.430456, 1.027255, -0.8520789, 1, 0, 0.4078431, 1,
1.432204, -0.136757, 3.767678, 1, 0, 0.4039216, 1,
1.434557, -0.05675093, 1.837243, 1, 0, 0.3960784, 1,
1.480608, 0.05333411, 3.622996, 1, 0, 0.3882353, 1,
1.486338, -0.6746677, 2.87042, 1, 0, 0.3843137, 1,
1.502911, -1.002386, 2.719655, 1, 0, 0.3764706, 1,
1.509985, -0.5284551, 1.578655, 1, 0, 0.372549, 1,
1.51336, -0.618636, 1.852441, 1, 0, 0.3647059, 1,
1.518084, 0.8865346, 1.441205, 1, 0, 0.3607843, 1,
1.518216, -2.261949, 3.340965, 1, 0, 0.3529412, 1,
1.518798, -0.7363604, 1.234081, 1, 0, 0.3490196, 1,
1.523935, 1.34238, 2.199355, 1, 0, 0.3411765, 1,
1.545118, 0.08824762, 0.7408386, 1, 0, 0.3372549, 1,
1.556232, -0.4391967, 0.1619878, 1, 0, 0.3294118, 1,
1.560851, -0.7896642, 3.767415, 1, 0, 0.3254902, 1,
1.561016, -0.6397317, 2.530776, 1, 0, 0.3176471, 1,
1.572766, 0.5472293, 2.799466, 1, 0, 0.3137255, 1,
1.575848, -0.5313368, 2.945437, 1, 0, 0.3058824, 1,
1.578381, 2.28311, -0.9522465, 1, 0, 0.2980392, 1,
1.60389, 1.310725, 0.6804224, 1, 0, 0.2941177, 1,
1.60839, -0.4822691, 1.228122, 1, 0, 0.2862745, 1,
1.6248, -0.1096242, 1.647429, 1, 0, 0.282353, 1,
1.654285, -0.5867974, 0.9712308, 1, 0, 0.2745098, 1,
1.658524, 0.2375606, 2.912868, 1, 0, 0.2705882, 1,
1.659463, 0.07159116, 0.845208, 1, 0, 0.2627451, 1,
1.69711, -0.1640598, 0.8809309, 1, 0, 0.2588235, 1,
1.715597, 0.4848894, 3.919615, 1, 0, 0.2509804, 1,
1.717972, 1.673751, 1.388371, 1, 0, 0.2470588, 1,
1.725918, -0.54285, 1.399979, 1, 0, 0.2392157, 1,
1.72599, 0.5428442, 2.27573, 1, 0, 0.2352941, 1,
1.762035, 0.3459061, -0.4024152, 1, 0, 0.227451, 1,
1.774509, 1.57271, 1.972117, 1, 0, 0.2235294, 1,
1.775481, 0.2582938, 2.962152, 1, 0, 0.2156863, 1,
1.791336, 0.5741655, 0.378528, 1, 0, 0.2117647, 1,
1.803425, -0.2975336, 3.650324, 1, 0, 0.2039216, 1,
1.818577, 0.5386996, 2.554844, 1, 0, 0.1960784, 1,
1.833828, 2.162392, 1.192893, 1, 0, 0.1921569, 1,
1.842582, 0.285376, 1.453238, 1, 0, 0.1843137, 1,
1.88008, -0.4608102, 2.010926, 1, 0, 0.1803922, 1,
1.881408, 2.082639, 1.398136, 1, 0, 0.172549, 1,
1.881817, -0.5381789, 1.105812, 1, 0, 0.1686275, 1,
1.892318, -0.3078343, 2.861707, 1, 0, 0.1607843, 1,
1.907066, -0.6859079, 3.070099, 1, 0, 0.1568628, 1,
1.907343, -2.481328, 1.617328, 1, 0, 0.1490196, 1,
1.931914, 0.8401924, 2.336169, 1, 0, 0.145098, 1,
1.978166, -0.02514883, 2.012765, 1, 0, 0.1372549, 1,
1.996436, 0.5522479, 1.221217, 1, 0, 0.1333333, 1,
2.008293, -0.5348671, 2.294523, 1, 0, 0.1254902, 1,
2.019848, -0.5920518, 1.91863, 1, 0, 0.1215686, 1,
2.035434, -0.9551535, 1.928326, 1, 0, 0.1137255, 1,
2.062112, 0.2374927, 2.758824, 1, 0, 0.1098039, 1,
2.069945, 0.4422478, 1.151373, 1, 0, 0.1019608, 1,
2.077794, 0.491832, 2.594301, 1, 0, 0.09411765, 1,
2.108701, -0.914863, 2.090204, 1, 0, 0.09019608, 1,
2.161759, -0.3635367, -0.5582783, 1, 0, 0.08235294, 1,
2.18918, -1.819155, 3.535113, 1, 0, 0.07843138, 1,
2.200228, 0.1300718, 1.042545, 1, 0, 0.07058824, 1,
2.200981, 0.3773995, 1.406252, 1, 0, 0.06666667, 1,
2.219696, -0.5578486, 1.978057, 1, 0, 0.05882353, 1,
2.376051, -0.6263862, 1.231503, 1, 0, 0.05490196, 1,
2.434152, -1.944638, 1.910656, 1, 0, 0.04705882, 1,
2.501054, -1.127126, 1.912224, 1, 0, 0.04313726, 1,
2.535126, -0.6831239, -0.4842102, 1, 0, 0.03529412, 1,
2.615584, 0.9491372, 0.1825108, 1, 0, 0.03137255, 1,
2.733874, 1.291125, 2.298916, 1, 0, 0.02352941, 1,
2.74031, -0.5042046, 0.8621368, 1, 0, 0.01960784, 1,
2.962829, 1.061193, 1.185572, 1, 0, 0.01176471, 1,
2.967879, 0.9294325, 2.12714, 1, 0, 0.007843138, 1
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
0.002691627, -4.293994, -7.172647, 0, -0.5, 0.5, 0.5,
0.002691627, -4.293994, -7.172647, 1, -0.5, 0.5, 0.5,
0.002691627, -4.293994, -7.172647, 1, 1.5, 0.5, 0.5,
0.002691627, -4.293994, -7.172647, 0, 1.5, 0.5, 0.5
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
-3.967694, -0.2152843, -7.172647, 0, -0.5, 0.5, 0.5,
-3.967694, -0.2152843, -7.172647, 1, -0.5, 0.5, 0.5,
-3.967694, -0.2152843, -7.172647, 1, 1.5, 0.5, 0.5,
-3.967694, -0.2152843, -7.172647, 0, 1.5, 0.5, 0.5
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
-3.967694, -4.293994, -0.07549286, 0, -0.5, 0.5, 0.5,
-3.967694, -4.293994, -0.07549286, 1, -0.5, 0.5, 0.5,
-3.967694, -4.293994, -0.07549286, 1, 1.5, 0.5, 0.5,
-3.967694, -4.293994, -0.07549286, 0, 1.5, 0.5, 0.5
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
-2, -3.352754, -5.534842,
2, -3.352754, -5.534842,
-2, -3.352754, -5.534842,
-2, -3.509627, -5.807809,
-1, -3.352754, -5.534842,
-1, -3.509627, -5.807809,
0, -3.352754, -5.534842,
0, -3.509627, -5.807809,
1, -3.352754, -5.534842,
1, -3.509627, -5.807809,
2, -3.352754, -5.534842,
2, -3.509627, -5.807809
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
-2, -3.823374, -6.353744, 0, -0.5, 0.5, 0.5,
-2, -3.823374, -6.353744, 1, -0.5, 0.5, 0.5,
-2, -3.823374, -6.353744, 1, 1.5, 0.5, 0.5,
-2, -3.823374, -6.353744, 0, 1.5, 0.5, 0.5,
-1, -3.823374, -6.353744, 0, -0.5, 0.5, 0.5,
-1, -3.823374, -6.353744, 1, -0.5, 0.5, 0.5,
-1, -3.823374, -6.353744, 1, 1.5, 0.5, 0.5,
-1, -3.823374, -6.353744, 0, 1.5, 0.5, 0.5,
0, -3.823374, -6.353744, 0, -0.5, 0.5, 0.5,
0, -3.823374, -6.353744, 1, -0.5, 0.5, 0.5,
0, -3.823374, -6.353744, 1, 1.5, 0.5, 0.5,
0, -3.823374, -6.353744, 0, 1.5, 0.5, 0.5,
1, -3.823374, -6.353744, 0, -0.5, 0.5, 0.5,
1, -3.823374, -6.353744, 1, -0.5, 0.5, 0.5,
1, -3.823374, -6.353744, 1, 1.5, 0.5, 0.5,
1, -3.823374, -6.353744, 0, 1.5, 0.5, 0.5,
2, -3.823374, -6.353744, 0, -0.5, 0.5, 0.5,
2, -3.823374, -6.353744, 1, -0.5, 0.5, 0.5,
2, -3.823374, -6.353744, 1, 1.5, 0.5, 0.5,
2, -3.823374, -6.353744, 0, 1.5, 0.5, 0.5
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
-3.051451, -3, -5.534842,
-3.051451, 2, -5.534842,
-3.051451, -3, -5.534842,
-3.204158, -3, -5.807809,
-3.051451, -2, -5.534842,
-3.204158, -2, -5.807809,
-3.051451, -1, -5.534842,
-3.204158, -1, -5.807809,
-3.051451, 0, -5.534842,
-3.204158, 0, -5.807809,
-3.051451, 1, -5.534842,
-3.204158, 1, -5.807809,
-3.051451, 2, -5.534842,
-3.204158, 2, -5.807809
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
-3.509572, -3, -6.353744, 0, -0.5, 0.5, 0.5,
-3.509572, -3, -6.353744, 1, -0.5, 0.5, 0.5,
-3.509572, -3, -6.353744, 1, 1.5, 0.5, 0.5,
-3.509572, -3, -6.353744, 0, 1.5, 0.5, 0.5,
-3.509572, -2, -6.353744, 0, -0.5, 0.5, 0.5,
-3.509572, -2, -6.353744, 1, -0.5, 0.5, 0.5,
-3.509572, -2, -6.353744, 1, 1.5, 0.5, 0.5,
-3.509572, -2, -6.353744, 0, 1.5, 0.5, 0.5,
-3.509572, -1, -6.353744, 0, -0.5, 0.5, 0.5,
-3.509572, -1, -6.353744, 1, -0.5, 0.5, 0.5,
-3.509572, -1, -6.353744, 1, 1.5, 0.5, 0.5,
-3.509572, -1, -6.353744, 0, 1.5, 0.5, 0.5,
-3.509572, 0, -6.353744, 0, -0.5, 0.5, 0.5,
-3.509572, 0, -6.353744, 1, -0.5, 0.5, 0.5,
-3.509572, 0, -6.353744, 1, 1.5, 0.5, 0.5,
-3.509572, 0, -6.353744, 0, 1.5, 0.5, 0.5,
-3.509572, 1, -6.353744, 0, -0.5, 0.5, 0.5,
-3.509572, 1, -6.353744, 1, -0.5, 0.5, 0.5,
-3.509572, 1, -6.353744, 1, 1.5, 0.5, 0.5,
-3.509572, 1, -6.353744, 0, 1.5, 0.5, 0.5,
-3.509572, 2, -6.353744, 0, -0.5, 0.5, 0.5,
-3.509572, 2, -6.353744, 1, -0.5, 0.5, 0.5,
-3.509572, 2, -6.353744, 1, 1.5, 0.5, 0.5,
-3.509572, 2, -6.353744, 0, 1.5, 0.5, 0.5
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
-3.051451, -3.352754, -4,
-3.051451, -3.352754, 4,
-3.051451, -3.352754, -4,
-3.204158, -3.509627, -4,
-3.051451, -3.352754, -2,
-3.204158, -3.509627, -2,
-3.051451, -3.352754, 0,
-3.204158, -3.509627, 0,
-3.051451, -3.352754, 2,
-3.204158, -3.509627, 2,
-3.051451, -3.352754, 4,
-3.204158, -3.509627, 4
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
-3.509572, -3.823374, -4, 0, -0.5, 0.5, 0.5,
-3.509572, -3.823374, -4, 1, -0.5, 0.5, 0.5,
-3.509572, -3.823374, -4, 1, 1.5, 0.5, 0.5,
-3.509572, -3.823374, -4, 0, 1.5, 0.5, 0.5,
-3.509572, -3.823374, -2, 0, -0.5, 0.5, 0.5,
-3.509572, -3.823374, -2, 1, -0.5, 0.5, 0.5,
-3.509572, -3.823374, -2, 1, 1.5, 0.5, 0.5,
-3.509572, -3.823374, -2, 0, 1.5, 0.5, 0.5,
-3.509572, -3.823374, 0, 0, -0.5, 0.5, 0.5,
-3.509572, -3.823374, 0, 1, -0.5, 0.5, 0.5,
-3.509572, -3.823374, 0, 1, 1.5, 0.5, 0.5,
-3.509572, -3.823374, 0, 0, 1.5, 0.5, 0.5,
-3.509572, -3.823374, 2, 0, -0.5, 0.5, 0.5,
-3.509572, -3.823374, 2, 1, -0.5, 0.5, 0.5,
-3.509572, -3.823374, 2, 1, 1.5, 0.5, 0.5,
-3.509572, -3.823374, 2, 0, 1.5, 0.5, 0.5,
-3.509572, -3.823374, 4, 0, -0.5, 0.5, 0.5,
-3.509572, -3.823374, 4, 1, -0.5, 0.5, 0.5,
-3.509572, -3.823374, 4, 1, 1.5, 0.5, 0.5,
-3.509572, -3.823374, 4, 0, 1.5, 0.5, 0.5
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
-3.051451, -3.352754, -5.534842,
-3.051451, 2.922185, -5.534842,
-3.051451, -3.352754, 5.383856,
-3.051451, 2.922185, 5.383856,
-3.051451, -3.352754, -5.534842,
-3.051451, -3.352754, 5.383856,
-3.051451, 2.922185, -5.534842,
-3.051451, 2.922185, 5.383856,
-3.051451, -3.352754, -5.534842,
3.056834, -3.352754, -5.534842,
-3.051451, -3.352754, 5.383856,
3.056834, -3.352754, 5.383856,
-3.051451, 2.922185, -5.534842,
3.056834, 2.922185, -5.534842,
-3.051451, 2.922185, 5.383856,
3.056834, 2.922185, 5.383856,
3.056834, -3.352754, -5.534842,
3.056834, 2.922185, -5.534842,
3.056834, -3.352754, 5.383856,
3.056834, 2.922185, 5.383856,
3.056834, -3.352754, -5.534842,
3.056834, -3.352754, 5.383856,
3.056834, 2.922185, -5.534842,
3.056834, 2.922185, 5.383856
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
var radius = 7.473896;
var distance = 33.25221;
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
mvMatrix.translate( -0.002691627, 0.2152843, 0.07549286 );
mvMatrix.scale( 1.322945, 1.287809, 0.7400995 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.25221);
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
Dichlorprop<-read.table("Dichlorprop.xyz")
```

```
## Error in read.table("Dichlorprop.xyz"): no lines available in input
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
-2.962495, -0.8797813, -1.589288, 0, 0, 1, 1, 1,
-2.818825, 2.073516, -3.532159, 1, 0, 0, 1, 1,
-2.745694, -1.127207, -1.417349, 1, 0, 0, 1, 1,
-2.669323, -1.949928, -1.909094, 1, 0, 0, 1, 1,
-2.649708, 2.295539, 0.6798119, 1, 0, 0, 1, 1,
-2.601037, 0.09116395, -1.489549, 1, 0, 0, 1, 1,
-2.590671, -0.5947727, -0.9113147, 0, 0, 0, 1, 1,
-2.552522, 1.481005, -0.6337023, 0, 0, 0, 1, 1,
-2.510422, -0.9619433, -2.581445, 0, 0, 0, 1, 1,
-2.499646, 0.2507659, -4.017413, 0, 0, 0, 1, 1,
-2.39596, -0.9182827, -1.162936, 0, 0, 0, 1, 1,
-2.394481, 0.2628436, -2.114069, 0, 0, 0, 1, 1,
-2.365409, 0.1269638, -4.004474, 0, 0, 0, 1, 1,
-2.294541, 1.586873, 0.1471332, 1, 1, 1, 1, 1,
-2.239873, 0.5571691, -2.671309, 1, 1, 1, 1, 1,
-2.177525, -0.949168, -0.5623733, 1, 1, 1, 1, 1,
-2.173841, -1.825581, -2.791205, 1, 1, 1, 1, 1,
-2.169279, 1.183488, -2.088822, 1, 1, 1, 1, 1,
-2.167586, -0.3274708, -0.8955404, 1, 1, 1, 1, 1,
-2.165074, -0.253757, -1.54363, 1, 1, 1, 1, 1,
-2.135337, 0.3489225, -2.320307, 1, 1, 1, 1, 1,
-2.073395, 1.216822, 0.2514137, 1, 1, 1, 1, 1,
-2.058826, -1.043123, -4.409149, 1, 1, 1, 1, 1,
-2.050246, -0.5443473, -2.020221, 1, 1, 1, 1, 1,
-2.039462, 1.11041, -1.878571, 1, 1, 1, 1, 1,
-2.004709, 0.2680088, -0.6309472, 1, 1, 1, 1, 1,
-1.997217, 0.1558605, -1.060646, 1, 1, 1, 1, 1,
-1.960167, 1.000375, -0.002791665, 1, 1, 1, 1, 1,
-1.958262, -0.01546107, -1.072604, 0, 0, 1, 1, 1,
-1.957949, -0.4353991, -1.791132, 1, 0, 0, 1, 1,
-1.921862, -0.8077278, -1.952322, 1, 0, 0, 1, 1,
-1.883292, 0.8340818, -1.549968, 1, 0, 0, 1, 1,
-1.857463, 0.4125779, -2.031987, 1, 0, 0, 1, 1,
-1.81254, -0.01670776, -1.44927, 1, 0, 0, 1, 1,
-1.796843, -0.7335976, -2.496363, 0, 0, 0, 1, 1,
-1.748029, 0.3277358, -1.527009, 0, 0, 0, 1, 1,
-1.743948, -0.1004646, -1.981897, 0, 0, 0, 1, 1,
-1.734021, 1.432979, -1.662178, 0, 0, 0, 1, 1,
-1.662962, -0.4291697, -2.454424, 0, 0, 0, 1, 1,
-1.657602, 0.6471345, 0.6573747, 0, 0, 0, 1, 1,
-1.656367, -0.8758641, -1.419046, 0, 0, 0, 1, 1,
-1.651209, 0.4032653, -0.2980134, 1, 1, 1, 1, 1,
-1.646419, -2.069521, -2.307446, 1, 1, 1, 1, 1,
-1.643135, 0.002831473, -1.812397, 1, 1, 1, 1, 1,
-1.633863, -0.927775, -3.127178, 1, 1, 1, 1, 1,
-1.633066, -0.3112755, -0.3551867, 1, 1, 1, 1, 1,
-1.622976, -0.2787577, -2.810751, 1, 1, 1, 1, 1,
-1.621626, -0.8906702, -2.442069, 1, 1, 1, 1, 1,
-1.613565, 0.4730104, -1.718027, 1, 1, 1, 1, 1,
-1.608668, -0.8350077, -1.962444, 1, 1, 1, 1, 1,
-1.589652, 0.4424767, -0.7642771, 1, 1, 1, 1, 1,
-1.574124, -0.1945301, -1.103222, 1, 1, 1, 1, 1,
-1.54956, 0.05646554, -2.042801, 1, 1, 1, 1, 1,
-1.542393, 1.647415, -1.649968, 1, 1, 1, 1, 1,
-1.541032, -2.249671, -3.552038, 1, 1, 1, 1, 1,
-1.530233, -0.5044106, -2.120804, 1, 1, 1, 1, 1,
-1.526111, -0.09408541, -2.912363, 0, 0, 1, 1, 1,
-1.52493, -0.7337306, -2.248846, 1, 0, 0, 1, 1,
-1.506476, -0.4045537, -0.7969386, 1, 0, 0, 1, 1,
-1.496437, -0.2317409, -1.576878, 1, 0, 0, 1, 1,
-1.466503, 1.391589, -2.017873, 1, 0, 0, 1, 1,
-1.430557, -1.591734, -2.911507, 1, 0, 0, 1, 1,
-1.423233, -0.1421836, -0.3773151, 0, 0, 0, 1, 1,
-1.41952, -0.04291834, -1.048269, 0, 0, 0, 1, 1,
-1.39976, 0.8869904, -0.506376, 0, 0, 0, 1, 1,
-1.388427, -0.1011264, -1.382859, 0, 0, 0, 1, 1,
-1.377888, -0.3811965, -1.509846, 0, 0, 0, 1, 1,
-1.363109, 0.2942861, -1.326045, 0, 0, 0, 1, 1,
-1.360863, 2.258492, -1.60758, 0, 0, 0, 1, 1,
-1.3599, 0.1737411, 0.09966033, 1, 1, 1, 1, 1,
-1.359265, -0.6220008, -2.074913, 1, 1, 1, 1, 1,
-1.350748, 0.1627316, -0.9112055, 1, 1, 1, 1, 1,
-1.348535, -0.561604, -2.445683, 1, 1, 1, 1, 1,
-1.338385, -0.2015748, -3.838755, 1, 1, 1, 1, 1,
-1.331143, 0.7604117, -0.3390346, 1, 1, 1, 1, 1,
-1.330969, -2.46308, -5.032168, 1, 1, 1, 1, 1,
-1.317811, -1.321457, -2.38381, 1, 1, 1, 1, 1,
-1.317241, 0.3607464, -1.578142, 1, 1, 1, 1, 1,
-1.308844, 0.1797083, -0.8481296, 1, 1, 1, 1, 1,
-1.286322, -1.347198, -3.200208, 1, 1, 1, 1, 1,
-1.2795, -0.1288552, -2.293475, 1, 1, 1, 1, 1,
-1.278852, 0.02771159, -4.118918, 1, 1, 1, 1, 1,
-1.274679, 0.9724091, -0.6002775, 1, 1, 1, 1, 1,
-1.274415, 0.6857861, -2.061788, 1, 1, 1, 1, 1,
-1.271317, 0.2060469, -0.2949892, 0, 0, 1, 1, 1,
-1.261026, -1.187413, -2.311894, 1, 0, 0, 1, 1,
-1.255203, -0.1246185, -3.271622, 1, 0, 0, 1, 1,
-1.254146, 0.05163494, -2.282524, 1, 0, 0, 1, 1,
-1.253141, 0.5175353, -1.083609, 1, 0, 0, 1, 1,
-1.251848, 1.786723, 1.001039, 1, 0, 0, 1, 1,
-1.244842, -0.006289854, 0.3493744, 0, 0, 0, 1, 1,
-1.23188, -0.2995787, -1.217313, 0, 0, 0, 1, 1,
-1.225957, -0.5738949, -2.150764, 0, 0, 0, 1, 1,
-1.221159, -1.038436, -2.478635, 0, 0, 0, 1, 1,
-1.212317, -0.78495, -4.134454, 0, 0, 0, 1, 1,
-1.210985, 0.2059673, -0.717235, 0, 0, 0, 1, 1,
-1.203502, 0.06624043, -2.604922, 0, 0, 0, 1, 1,
-1.193907, 0.4178422, -0.843195, 1, 1, 1, 1, 1,
-1.191722, 0.1819702, 0.2723368, 1, 1, 1, 1, 1,
-1.186661, -0.6080251, -1.22056, 1, 1, 1, 1, 1,
-1.180295, 1.433638, -2.633023, 1, 1, 1, 1, 1,
-1.174897, -1.546355, -2.017392, 1, 1, 1, 1, 1,
-1.174763, 1.256017, 0.548763, 1, 1, 1, 1, 1,
-1.174655, -0.9729809, -1.830755, 1, 1, 1, 1, 1,
-1.173027, 1.02719, 0.6532462, 1, 1, 1, 1, 1,
-1.166893, 0.8189175, -2.436899, 1, 1, 1, 1, 1,
-1.158548, -0.007784148, -2.339987, 1, 1, 1, 1, 1,
-1.156798, 0.07185813, -1.355024, 1, 1, 1, 1, 1,
-1.156651, -1.697405, -1.871519, 1, 1, 1, 1, 1,
-1.154031, 0.001397648, -1.436233, 1, 1, 1, 1, 1,
-1.146198, -0.7871273, -0.7161636, 1, 1, 1, 1, 1,
-1.143196, -1.104961, -1.709022, 1, 1, 1, 1, 1,
-1.138866, 0.0906477, -0.7415798, 0, 0, 1, 1, 1,
-1.138496, -0.4233701, 0.4559897, 1, 0, 0, 1, 1,
-1.132252, 0.7475727, 0.6171662, 1, 0, 0, 1, 1,
-1.12659, -1.468743, -3.295829, 1, 0, 0, 1, 1,
-1.125211, 0.2869351, -1.675859, 1, 0, 0, 1, 1,
-1.12164, 1.434821, -1.241159, 1, 0, 0, 1, 1,
-1.11955, -1.622027, -3.558705, 0, 0, 0, 1, 1,
-1.108601, -0.3728647, -1.259223, 0, 0, 0, 1, 1,
-1.108098, 0.2057652, -0.03825482, 0, 0, 0, 1, 1,
-1.107924, -0.3989605, 0.1836444, 0, 0, 0, 1, 1,
-1.103415, 0.2218529, -1.359237, 0, 0, 0, 1, 1,
-1.102166, -1.007169, -0.2706534, 0, 0, 0, 1, 1,
-1.101739, -0.9031131, -3.178135, 0, 0, 0, 1, 1,
-1.100883, -0.7079813, -2.40334, 1, 1, 1, 1, 1,
-1.100877, -0.3785937, -1.979978, 1, 1, 1, 1, 1,
-1.088908, 0.1179621, -2.516168, 1, 1, 1, 1, 1,
-1.088399, -0.1376427, -1.831479, 1, 1, 1, 1, 1,
-1.0816, -0.5393813, -2.798609, 1, 1, 1, 1, 1,
-1.081531, 0.7604493, -3.214806, 1, 1, 1, 1, 1,
-1.077291, -0.2898854, -1.316407, 1, 1, 1, 1, 1,
-1.07663, -0.4794434, -1.020337, 1, 1, 1, 1, 1,
-1.073656, 0.2415372, 0.9682497, 1, 1, 1, 1, 1,
-1.071478, -1.386294, -1.127119, 1, 1, 1, 1, 1,
-1.066, -1.10999, -5.375832, 1, 1, 1, 1, 1,
-1.063309, 0.6475834, -0.6365243, 1, 1, 1, 1, 1,
-1.059859, 2.291109, 0.5259022, 1, 1, 1, 1, 1,
-1.05894, -0.6325944, -1.420873, 1, 1, 1, 1, 1,
-1.051831, -0.04492548, -1.820154, 1, 1, 1, 1, 1,
-1.04579, -0.1281082, -1.006534, 0, 0, 1, 1, 1,
-1.045014, -0.9473363, -3.085034, 1, 0, 0, 1, 1,
-1.04439, 1.172228, 1.642738, 1, 0, 0, 1, 1,
-1.038319, 0.0509528, -0.09316345, 1, 0, 0, 1, 1,
-1.037678, 0.8784499, -2.554636, 1, 0, 0, 1, 1,
-1.033945, -0.03563568, -2.572674, 1, 0, 0, 1, 1,
-1.01728, -2.022378, -2.224418, 0, 0, 0, 1, 1,
-1.016478, 1.315065, -0.4106247, 0, 0, 0, 1, 1,
-1.013747, -0.2743119, -1.90067, 0, 0, 0, 1, 1,
-1.01016, 0.9757038, -1.075752, 0, 0, 0, 1, 1,
-1.010055, 0.2456075, -2.168522, 0, 0, 0, 1, 1,
-0.9980272, -1.578102, -1.990814, 0, 0, 0, 1, 1,
-0.9948865, 1.2426, -0.07621899, 0, 0, 0, 1, 1,
-0.9937901, -1.305037, -2.575939, 1, 1, 1, 1, 1,
-0.9933934, -0.1800388, -2.129951, 1, 1, 1, 1, 1,
-0.9732401, -2.860983, -2.642711, 1, 1, 1, 1, 1,
-0.971909, -2.000416, -2.070073, 1, 1, 1, 1, 1,
-0.9656609, 0.5388467, -2.73516, 1, 1, 1, 1, 1,
-0.9639827, -0.2665914, -1.2801, 1, 1, 1, 1, 1,
-0.9638495, -1.309597, -3.925246, 1, 1, 1, 1, 1,
-0.962896, 0.1623087, -2.029971, 1, 1, 1, 1, 1,
-0.962084, 0.3194734, -2.73679, 1, 1, 1, 1, 1,
-0.9576722, 0.09757718, -0.2016957, 1, 1, 1, 1, 1,
-0.9531723, -1.276126, -2.690504, 1, 1, 1, 1, 1,
-0.93479, -1.155807, -4.108675, 1, 1, 1, 1, 1,
-0.9307209, -0.4153487, -0.837803, 1, 1, 1, 1, 1,
-0.9275441, -1.358785, -3.84201, 1, 1, 1, 1, 1,
-0.9156952, -0.1036275, -2.366683, 1, 1, 1, 1, 1,
-0.9053424, 0.384824, -1.557644, 0, 0, 1, 1, 1,
-0.9036638, 0.03133382, -3.318335, 1, 0, 0, 1, 1,
-0.9028243, 1.659266, 1.131642, 1, 0, 0, 1, 1,
-0.9017918, -0.6966636, -0.8726575, 1, 0, 0, 1, 1,
-0.8984708, 2.473543, -0.4413942, 1, 0, 0, 1, 1,
-0.8963636, -0.09595045, 0.275475, 1, 0, 0, 1, 1,
-0.8916919, 1.33482, 0.4712807, 0, 0, 0, 1, 1,
-0.8876734, -0.4118283, -1.779211, 0, 0, 0, 1, 1,
-0.8839023, -0.3047691, -1.116742, 0, 0, 0, 1, 1,
-0.8740662, -0.4348435, -2.57792, 0, 0, 0, 1, 1,
-0.8684455, 0.2819885, -1.125612, 0, 0, 0, 1, 1,
-0.8656955, -0.3611246, 0.4181786, 0, 0, 0, 1, 1,
-0.862785, -1.294059, -4.553863, 0, 0, 0, 1, 1,
-0.8562336, 1.019659, 0.5021315, 1, 1, 1, 1, 1,
-0.8550276, -1.358582, -3.825402, 1, 1, 1, 1, 1,
-0.8544419, 0.06631937, -2.815439, 1, 1, 1, 1, 1,
-0.8473701, 0.04788511, -1.075985, 1, 1, 1, 1, 1,
-0.8424414, -0.09826544, -2.785069, 1, 1, 1, 1, 1,
-0.8404693, 0.4921343, -1.549073, 1, 1, 1, 1, 1,
-0.8389179, 0.3955325, -1.144143, 1, 1, 1, 1, 1,
-0.8341392, 0.927578, -1.082388, 1, 1, 1, 1, 1,
-0.8332559, 0.653138, -0.1337542, 1, 1, 1, 1, 1,
-0.8320534, -0.2844749, -3.04336, 1, 1, 1, 1, 1,
-0.8297768, -0.816195, 0.2680394, 1, 1, 1, 1, 1,
-0.8295843, 0.5385643, -0.6415468, 1, 1, 1, 1, 1,
-0.8288167, -0.2315093, -2.054872, 1, 1, 1, 1, 1,
-0.8209836, -0.2467147, -1.030854, 1, 1, 1, 1, 1,
-0.8186979, -0.2359019, -3.389366, 1, 1, 1, 1, 1,
-0.8181266, -0.9471214, -3.162346, 0, 0, 1, 1, 1,
-0.8160581, 0.4869184, -1.564836, 1, 0, 0, 1, 1,
-0.8030517, -0.4574903, -1.713011, 1, 0, 0, 1, 1,
-0.7985865, -0.8687218, -4.393436, 1, 0, 0, 1, 1,
-0.7966018, 1.630266, -0.3505819, 1, 0, 0, 1, 1,
-0.7917299, -0.7774487, -2.894449, 1, 0, 0, 1, 1,
-0.7916359, 0.9782454, -0.819035, 0, 0, 0, 1, 1,
-0.7903758, 1.399158, -2.496288, 0, 0, 0, 1, 1,
-0.7903581, -0.07623913, -2.922051, 0, 0, 0, 1, 1,
-0.7862303, 1.687424, -0.4593837, 0, 0, 0, 1, 1,
-0.7862172, -0.07386066, -1.563544, 0, 0, 0, 1, 1,
-0.7777728, -1.731148, -2.075204, 0, 0, 0, 1, 1,
-0.7755272, 0.4163862, -2.71188, 0, 0, 0, 1, 1,
-0.7738303, 0.382872, -0.2880632, 1, 1, 1, 1, 1,
-0.7699887, 0.7775893, -0.7237774, 1, 1, 1, 1, 1,
-0.769147, -1.140354, -1.796892, 1, 1, 1, 1, 1,
-0.7675238, -1.201765, -2.281902, 1, 1, 1, 1, 1,
-0.7660509, 0.2885814, -2.384104, 1, 1, 1, 1, 1,
-0.7607643, 0.03049878, -2.626849, 1, 1, 1, 1, 1,
-0.7601768, -0.5017337, -1.962804, 1, 1, 1, 1, 1,
-0.7594478, -1.38668, -3.696078, 1, 1, 1, 1, 1,
-0.7452244, 0.8119666, -1.034104, 1, 1, 1, 1, 1,
-0.7443776, -0.5324683, -3.299085, 1, 1, 1, 1, 1,
-0.7413067, 0.2854042, 0.1182398, 1, 1, 1, 1, 1,
-0.7375481, 0.3678586, -0.7982874, 1, 1, 1, 1, 1,
-0.732392, 0.3652781, -3.242477, 1, 1, 1, 1, 1,
-0.7254209, -0.1067509, -1.011526, 1, 1, 1, 1, 1,
-0.7221656, 0.1693364, -0.52382, 1, 1, 1, 1, 1,
-0.7188097, -1.957978, -1.831922, 0, 0, 1, 1, 1,
-0.7152281, 0.297663, -0.1987159, 1, 0, 0, 1, 1,
-0.7144563, -0.8552427, -1.944168, 1, 0, 0, 1, 1,
-0.7114202, -0.04234754, -2.064291, 1, 0, 0, 1, 1,
-0.7091306, 0.5786603, -2.081023, 1, 0, 0, 1, 1,
-0.7037925, -0.2979335, -2.637171, 1, 0, 0, 1, 1,
-0.7031457, -0.9246123, -4.051009, 0, 0, 0, 1, 1,
-0.6984772, 2.406838, 1.097828, 0, 0, 0, 1, 1,
-0.6978273, 1.054371, -1.252407, 0, 0, 0, 1, 1,
-0.6869885, 0.03178148, 0.4836785, 0, 0, 0, 1, 1,
-0.6869742, 0.7977038, 0.7157795, 0, 0, 0, 1, 1,
-0.6790183, -2.070717, -3.343762, 0, 0, 0, 1, 1,
-0.6770052, 1.114622, -2.449945, 0, 0, 0, 1, 1,
-0.6757449, 0.03529995, -3.143295, 1, 1, 1, 1, 1,
-0.6702328, -0.128583, -2.343912, 1, 1, 1, 1, 1,
-0.6697701, 0.4638507, -1.24565, 1, 1, 1, 1, 1,
-0.6677129, -0.2859697, -0.8447794, 1, 1, 1, 1, 1,
-0.6608762, 1.111102, -0.005295496, 1, 1, 1, 1, 1,
-0.6605556, -1.674866, -2.795395, 1, 1, 1, 1, 1,
-0.6480412, 0.4963401, -1.155862, 1, 1, 1, 1, 1,
-0.6478746, 1.320581, -0.8276073, 1, 1, 1, 1, 1,
-0.6455777, -1.321874, -3.341996, 1, 1, 1, 1, 1,
-0.6421951, 1.096495, 0.4751734, 1, 1, 1, 1, 1,
-0.6415944, -0.5595189, -1.945463, 1, 1, 1, 1, 1,
-0.6410445, -0.3151647, -0.9005058, 1, 1, 1, 1, 1,
-0.6377189, -0.4458638, -2.558747, 1, 1, 1, 1, 1,
-0.6366167, -1.190277, -3.177495, 1, 1, 1, 1, 1,
-0.6320145, -1.380037, -2.941752, 1, 1, 1, 1, 1,
-0.6312989, -1.10241, -2.814679, 0, 0, 1, 1, 1,
-0.6305862, -0.2878795, -0.9674504, 1, 0, 0, 1, 1,
-0.6275305, -1.217689, -2.75034, 1, 0, 0, 1, 1,
-0.6264856, -1.10252, -4.222618, 1, 0, 0, 1, 1,
-0.6192521, 0.5701016, 0.6200278, 1, 0, 0, 1, 1,
-0.6175098, -0.07220246, -2.230576, 1, 0, 0, 1, 1,
-0.6165843, 0.9112979, -0.2849653, 0, 0, 0, 1, 1,
-0.6156597, -3.192681, -2.341463, 0, 0, 0, 1, 1,
-0.6153641, -1.717408, -3.603211, 0, 0, 0, 1, 1,
-0.615083, -0.8638033, -3.723548, 0, 0, 0, 1, 1,
-0.6147662, -0.1702325, -0.7038346, 0, 0, 0, 1, 1,
-0.6118985, 0.3284405, -0.6173552, 0, 0, 0, 1, 1,
-0.6031438, 0.0146355, -1.176566, 0, 0, 0, 1, 1,
-0.6020338, -0.3699267, -2.46105, 1, 1, 1, 1, 1,
-0.5968463, 0.4580303, -0.6243057, 1, 1, 1, 1, 1,
-0.5921944, -2.958251, -5.102079, 1, 1, 1, 1, 1,
-0.5919988, -0.905512, -3.222559, 1, 1, 1, 1, 1,
-0.5854779, 1.391062, -2.294117, 1, 1, 1, 1, 1,
-0.5828881, 0.4456454, -1.425766, 1, 1, 1, 1, 1,
-0.5828629, 0.9307112, -1.295603, 1, 1, 1, 1, 1,
-0.5791922, -1.17021, -1.911936, 1, 1, 1, 1, 1,
-0.5777774, -0.1848421, -1.984751, 1, 1, 1, 1, 1,
-0.5723454, 0.04332528, -1.582406, 1, 1, 1, 1, 1,
-0.5712788, 0.3800751, 0.138154, 1, 1, 1, 1, 1,
-0.5712259, -0.2187867, -1.545484, 1, 1, 1, 1, 1,
-0.5640804, -0.2831075, -4.053926, 1, 1, 1, 1, 1,
-0.5638234, -0.7949719, -1.27617, 1, 1, 1, 1, 1,
-0.5597295, -0.7829224, -3.428768, 1, 1, 1, 1, 1,
-0.5572655, 0.4344287, -2.112522, 0, 0, 1, 1, 1,
-0.5563927, -0.7631563, -1.218952, 1, 0, 0, 1, 1,
-0.5509712, 1.354038, 0.7710066, 1, 0, 0, 1, 1,
-0.5502002, -0.3595913, -2.848015, 1, 0, 0, 1, 1,
-0.5498575, -0.5251856, -3.208956, 1, 0, 0, 1, 1,
-0.5428892, -1.529328, -3.033047, 1, 0, 0, 1, 1,
-0.5399459, 0.9141432, -1.14069, 0, 0, 0, 1, 1,
-0.5386246, 0.7514744, -0.9580041, 0, 0, 0, 1, 1,
-0.5368708, -1.67495, -4.884367, 0, 0, 0, 1, 1,
-0.5335169, 0.6679497, -1.721365, 0, 0, 0, 1, 1,
-0.5311028, 0.691516, -2.666239, 0, 0, 0, 1, 1,
-0.5309837, -0.3640185, -2.816973, 0, 0, 0, 1, 1,
-0.5288263, -1.47032, -1.145378, 0, 0, 0, 1, 1,
-0.5273286, -1.424921, -2.130524, 1, 1, 1, 1, 1,
-0.5269842, -0.8942095, -3.855777, 1, 1, 1, 1, 1,
-0.5248109, 0.1869654, -1.889546, 1, 1, 1, 1, 1,
-0.5192125, 1.583997, 1.016304, 1, 1, 1, 1, 1,
-0.5167897, -0.7388709, -2.01875, 1, 1, 1, 1, 1,
-0.5166603, 0.6877171, 0.5475391, 1, 1, 1, 1, 1,
-0.5151543, 0.1801575, -0.9300433, 1, 1, 1, 1, 1,
-0.5148939, 0.1061712, -2.007262, 1, 1, 1, 1, 1,
-0.5141644, 0.9644815, -2.291987, 1, 1, 1, 1, 1,
-0.5115949, 0.07668635, -1.068089, 1, 1, 1, 1, 1,
-0.5097446, -0.7080151, -3.736403, 1, 1, 1, 1, 1,
-0.5016615, 0.960601, 0.9007554, 1, 1, 1, 1, 1,
-0.4979152, 1.093697, -1.979239, 1, 1, 1, 1, 1,
-0.497695, -0.6729618, -2.408094, 1, 1, 1, 1, 1,
-0.495333, 0.8420413, -0.1929767, 1, 1, 1, 1, 1,
-0.4900068, 0.3620032, -1.807937, 0, 0, 1, 1, 1,
-0.4872146, -0.7047336, -2.370208, 1, 0, 0, 1, 1,
-0.4797066, 0.05365413, -2.842205, 1, 0, 0, 1, 1,
-0.4793028, -0.432141, -3.388771, 1, 0, 0, 1, 1,
-0.4758595, 1.21305, -1.404603, 1, 0, 0, 1, 1,
-0.4731931, 0.9569377, -1.72438, 1, 0, 0, 1, 1,
-0.462034, -2.07578, -3.270155, 0, 0, 0, 1, 1,
-0.4589764, 1.334935, 2.661996, 0, 0, 0, 1, 1,
-0.4557959, -1.750157, -1.387741, 0, 0, 0, 1, 1,
-0.4546824, 2.426938, 0.1187726, 0, 0, 0, 1, 1,
-0.4528812, -1.762744, -4.245998, 0, 0, 0, 1, 1,
-0.4512586, 0.5786559, -0.7750825, 0, 0, 0, 1, 1,
-0.4475054, 0.827358, -0.06621447, 0, 0, 0, 1, 1,
-0.4440959, -0.8515257, -1.360701, 1, 1, 1, 1, 1,
-0.4371646, -0.3836742, -3.308746, 1, 1, 1, 1, 1,
-0.4303108, 0.1661219, 0.9293438, 1, 1, 1, 1, 1,
-0.4211915, -0.5523324, -1.972007, 1, 1, 1, 1, 1,
-0.4169865, 0.2420124, -0.2430365, 1, 1, 1, 1, 1,
-0.4143063, 0.350273, -0.7928852, 1, 1, 1, 1, 1,
-0.4140117, 1.477055, 0.297693, 1, 1, 1, 1, 1,
-0.4119204, -1.590679, -1.939511, 1, 1, 1, 1, 1,
-0.4098131, 1.49822, -0.4668021, 1, 1, 1, 1, 1,
-0.4063069, -0.8075004, -1.657073, 1, 1, 1, 1, 1,
-0.4061286, -0.6823916, -1.845885, 1, 1, 1, 1, 1,
-0.4028997, -0.01620253, -3.254867, 1, 1, 1, 1, 1,
-0.3994243, 0.2581834, -2.321962, 1, 1, 1, 1, 1,
-0.3986841, -1.31827, -3.786254, 1, 1, 1, 1, 1,
-0.3983604, 0.8575372, -0.4241697, 1, 1, 1, 1, 1,
-0.3973981, 0.2777701, -0.7483237, 0, 0, 1, 1, 1,
-0.396216, 0.8294611, -2.185215, 1, 0, 0, 1, 1,
-0.3948569, -0.02386131, 0.5952277, 1, 0, 0, 1, 1,
-0.3945656, 0.06379608, -1.207265, 1, 0, 0, 1, 1,
-0.3942737, -0.6839284, -3.227601, 1, 0, 0, 1, 1,
-0.3927341, 0.3198083, 0.6851062, 1, 0, 0, 1, 1,
-0.3926914, -1.063264, -2.460464, 0, 0, 0, 1, 1,
-0.3877953, -0.1716253, -3.09804, 0, 0, 0, 1, 1,
-0.3831472, 0.5241718, -1.321441, 0, 0, 0, 1, 1,
-0.3818002, 1.231979, 1.147507, 0, 0, 0, 1, 1,
-0.3816028, -0.7955254, -3.210352, 0, 0, 0, 1, 1,
-0.3804488, -1.099521, -1.87816, 0, 0, 0, 1, 1,
-0.3763455, -0.8860889, -4.287443, 0, 0, 0, 1, 1,
-0.3756281, -0.3821167, -2.469845, 1, 1, 1, 1, 1,
-0.374994, 0.1899554, -0.6888067, 1, 1, 1, 1, 1,
-0.3748703, -0.2237415, -0.5946808, 1, 1, 1, 1, 1,
-0.3696517, 0.8285432, 0.7602971, 1, 1, 1, 1, 1,
-0.3664981, 0.2123533, -0.5338398, 1, 1, 1, 1, 1,
-0.3659737, 1.041385, -1.167695, 1, 1, 1, 1, 1,
-0.3624645, 1.627931, -1.034171, 1, 1, 1, 1, 1,
-0.3600158, -0.1627656, -0.537568, 1, 1, 1, 1, 1,
-0.3542607, -1.013765, -4.756512, 1, 1, 1, 1, 1,
-0.3512706, -1.18152, -2.19315, 1, 1, 1, 1, 1,
-0.3506538, -0.8134027, -4.84486, 1, 1, 1, 1, 1,
-0.3477858, -1.016629, -4.630747, 1, 1, 1, 1, 1,
-0.3462442, 1.618551, -0.573755, 1, 1, 1, 1, 1,
-0.3443688, 0.584245, 0.7378335, 1, 1, 1, 1, 1,
-0.3442601, -0.6783479, -2.478492, 1, 1, 1, 1, 1,
-0.3439929, -0.1010638, -3.123565, 0, 0, 1, 1, 1,
-0.3422414, -1.281991, -4.246282, 1, 0, 0, 1, 1,
-0.3420872, -0.472471, -2.776205, 1, 0, 0, 1, 1,
-0.3385029, 1.425452, -0.8310885, 1, 0, 0, 1, 1,
-0.3331043, -0.4299638, -1.448344, 1, 0, 0, 1, 1,
-0.3282793, -0.4574769, -4.091733, 1, 0, 0, 1, 1,
-0.3278238, 0.8151236, -0.8309877, 0, 0, 0, 1, 1,
-0.3131148, -0.6098305, -1.434168, 0, 0, 0, 1, 1,
-0.3127782, 0.2088506, 0.2205912, 0, 0, 0, 1, 1,
-0.308167, 0.6972622, -1.762464, 0, 0, 0, 1, 1,
-0.3075466, 0.5466239, -2.428195, 0, 0, 0, 1, 1,
-0.305047, -0.9401143, -4.564467, 0, 0, 0, 1, 1,
-0.2974654, -1.469742, -2.908446, 0, 0, 0, 1, 1,
-0.2972662, -0.6287603, -0.9812751, 1, 1, 1, 1, 1,
-0.2970196, -0.9360422, -3.443892, 1, 1, 1, 1, 1,
-0.2929421, -1.026084, -2.266863, 1, 1, 1, 1, 1,
-0.2928664, -1.818551, -3.669158, 1, 1, 1, 1, 1,
-0.2922323, 0.9070893, 0.2330357, 1, 1, 1, 1, 1,
-0.2890832, -0.159213, -3.589162, 1, 1, 1, 1, 1,
-0.2888943, -0.1183731, -1.097904, 1, 1, 1, 1, 1,
-0.28096, -2.162416, -2.875428, 1, 1, 1, 1, 1,
-0.2799744, -0.6055256, -2.368533, 1, 1, 1, 1, 1,
-0.2789784, -1.763134, -4.166048, 1, 1, 1, 1, 1,
-0.276011, 0.07202461, -3.206976, 1, 1, 1, 1, 1,
-0.2702546, -0.3117124, -4.11665, 1, 1, 1, 1, 1,
-0.2669092, 0.5359381, 0.1311599, 1, 1, 1, 1, 1,
-0.2664167, 0.1429741, -0.4614696, 1, 1, 1, 1, 1,
-0.2654755, 0.5084266, -0.166946, 1, 1, 1, 1, 1,
-0.2650281, 1.021974, -0.8240782, 0, 0, 1, 1, 1,
-0.2645823, -0.6114292, -2.455661, 1, 0, 0, 1, 1,
-0.2628807, 0.1059595, -1.491215, 1, 0, 0, 1, 1,
-0.2565898, -0.2876329, -3.347937, 1, 0, 0, 1, 1,
-0.2504096, -0.5784568, -2.931205, 1, 0, 0, 1, 1,
-0.2439162, -2.874359, -2.563854, 1, 0, 0, 1, 1,
-0.2416016, -2.047555, -3.294595, 0, 0, 0, 1, 1,
-0.2347177, 0.5410771, -0.8995714, 0, 0, 0, 1, 1,
-0.2213828, 0.7209225, -0.105637, 0, 0, 0, 1, 1,
-0.2207406, -1.351162, -2.285883, 0, 0, 0, 1, 1,
-0.2175726, 0.9622252, 1.335164, 0, 0, 0, 1, 1,
-0.216376, 2.200725, 1.135589, 0, 0, 0, 1, 1,
-0.214777, 0.6931202, 0.05046961, 0, 0, 0, 1, 1,
-0.2110288, -2.125397, -2.072769, 1, 1, 1, 1, 1,
-0.2090997, -0.2485514, -3.389192, 1, 1, 1, 1, 1,
-0.2056832, 0.2307488, 0.6494077, 1, 1, 1, 1, 1,
-0.2050541, -1.688133, -4.655495, 1, 1, 1, 1, 1,
-0.2009419, 0.7708202, -1.6291, 1, 1, 1, 1, 1,
-0.2005417, -0.280773, -2.856452, 1, 1, 1, 1, 1,
-0.1949146, -0.4928478, -2.73438, 1, 1, 1, 1, 1,
-0.1941687, 0.2054099, -2.25992, 1, 1, 1, 1, 1,
-0.1895759, 0.901015, -2.119862, 1, 1, 1, 1, 1,
-0.1856889, 1.569887, -0.2733226, 1, 1, 1, 1, 1,
-0.1808157, 0.2224752, 1.25937, 1, 1, 1, 1, 1,
-0.1804758, 0.743852, -0.400351, 1, 1, 1, 1, 1,
-0.1786433, 1.734265, -0.2092355, 1, 1, 1, 1, 1,
-0.1738547, -1.011773, -3.521735, 1, 1, 1, 1, 1,
-0.1723683, 0.5353601, -1.061082, 1, 1, 1, 1, 1,
-0.1701318, -1.552091, -3.512776, 0, 0, 1, 1, 1,
-0.1679983, -0.3704535, -2.619035, 1, 0, 0, 1, 1,
-0.1630917, -0.3518654, -2.214645, 1, 0, 0, 1, 1,
-0.1627751, 0.6339215, -2.519305, 1, 0, 0, 1, 1,
-0.1616723, -1.533637, -1.554619, 1, 0, 0, 1, 1,
-0.1609921, -0.05815398, -1.495617, 1, 0, 0, 1, 1,
-0.1581126, -0.8762762, -3.278679, 0, 0, 0, 1, 1,
-0.1571322, -1.23598, -3.153234, 0, 0, 0, 1, 1,
-0.1558351, -2.224488, -1.316866, 0, 0, 0, 1, 1,
-0.1542066, 0.3888372, -1.743998, 0, 0, 0, 1, 1,
-0.1533666, -1.787482, -1.58428, 0, 0, 0, 1, 1,
-0.1502286, -0.7522221, -2.169303, 0, 0, 0, 1, 1,
-0.1485313, 0.1114278, -0.4545161, 0, 0, 0, 1, 1,
-0.1464038, 0.7293915, -0.04311083, 1, 1, 1, 1, 1,
-0.1459529, 0.3950005, -1.260816, 1, 1, 1, 1, 1,
-0.1448973, 1.076887, -2.716069, 1, 1, 1, 1, 1,
-0.1447557, -0.504325, -3.265121, 1, 1, 1, 1, 1,
-0.1445193, -0.03816012, 0.008755012, 1, 1, 1, 1, 1,
-0.1443095, 0.1384359, -1.117385, 1, 1, 1, 1, 1,
-0.1437723, 0.8530266, 1.517698, 1, 1, 1, 1, 1,
-0.1428097, 0.374257, -1.122157, 1, 1, 1, 1, 1,
-0.1382196, 1.282331, 0.9097412, 1, 1, 1, 1, 1,
-0.1359265, -0.1464345, -1.771396, 1, 1, 1, 1, 1,
-0.1331267, 0.4507867, 0.4958613, 1, 1, 1, 1, 1,
-0.1317652, -0.2036344, -1.699481, 1, 1, 1, 1, 1,
-0.1275261, 0.09684205, -0.5408257, 1, 1, 1, 1, 1,
-0.1240916, 0.7361559, -0.8288429, 1, 1, 1, 1, 1,
-0.1196043, 0.821811, 0.9720172, 1, 1, 1, 1, 1,
-0.117046, 1.15783, -1.042927, 0, 0, 1, 1, 1,
-0.1134696, 0.3536891, 0.8591201, 1, 0, 0, 1, 1,
-0.1117956, -1.967392, -4.181973, 1, 0, 0, 1, 1,
-0.106636, 0.470346, -0.1935112, 1, 0, 0, 1, 1,
-0.1041794, 0.09555463, -0.9537455, 1, 0, 0, 1, 1,
-0.1017915, 1.125883, -0.5385268, 1, 0, 0, 1, 1,
-0.1013075, -0.03363738, -0.7526137, 0, 0, 0, 1, 1,
-0.09901728, 0.2821622, -1.033304, 0, 0, 0, 1, 1,
-0.09426661, -1.30137, -1.956972, 0, 0, 0, 1, 1,
-0.09411108, 0.2891894, 0.1097725, 0, 0, 0, 1, 1,
-0.09143215, -0.1759005, -2.857827, 0, 0, 0, 1, 1,
-0.09087877, -0.8170049, -4.542165, 0, 0, 0, 1, 1,
-0.09053871, -1.162494, -1.213348, 0, 0, 0, 1, 1,
-0.08810101, 1.893185, 0.6599237, 1, 1, 1, 1, 1,
-0.08753091, -0.542789, -3.839646, 1, 1, 1, 1, 1,
-0.08401702, -1.184775, -3.426328, 1, 1, 1, 1, 1,
-0.08138902, 1.567631, 0.08619535, 1, 1, 1, 1, 1,
-0.0740035, -1.353943, -0.09439534, 1, 1, 1, 1, 1,
-0.07202613, 1.031085, 0.3938893, 1, 1, 1, 1, 1,
-0.06798787, -1.826899, -3.441325, 1, 1, 1, 1, 1,
-0.06503489, -0.6662752, -1.645844, 1, 1, 1, 1, 1,
-0.06454837, 0.1355107, 0.3351624, 1, 1, 1, 1, 1,
-0.05836935, -0.7112711, -2.293715, 1, 1, 1, 1, 1,
-0.05520365, 0.9800289, 0.442594, 1, 1, 1, 1, 1,
-0.05400154, -0.6194589, -3.372022, 1, 1, 1, 1, 1,
-0.04910244, -0.4949561, -3.659476, 1, 1, 1, 1, 1,
-0.047356, -1.036655, -1.719084, 1, 1, 1, 1, 1,
-0.04633585, 0.7550635, 0.1497474, 1, 1, 1, 1, 1,
-0.04364415, 0.9952465, -1.111677, 0, 0, 1, 1, 1,
-0.03948832, -1.220939, -2.966244, 1, 0, 0, 1, 1,
-0.0390992, 1.065623, 0.7082011, 1, 0, 0, 1, 1,
-0.037495, 0.1218495, 0.7426717, 1, 0, 0, 1, 1,
-0.03557921, 0.4528722, -0.6993876, 1, 0, 0, 1, 1,
-0.03451814, 0.8894027, -1.494047, 1, 0, 0, 1, 1,
-0.0310594, -0.8176088, -1.141904, 0, 0, 0, 1, 1,
-0.03103472, -0.6620552, -3.911772, 0, 0, 0, 1, 1,
-0.02720443, 1.426879, -2.35382, 0, 0, 0, 1, 1,
-0.02705225, -0.02763861, -2.373155, 0, 0, 0, 1, 1,
-0.02586959, 0.7140021, -0.6365604, 0, 0, 0, 1, 1,
-0.02024127, -0.246416, -3.13565, 0, 0, 0, 1, 1,
-0.0163262, -0.4344845, -2.319137, 0, 0, 0, 1, 1,
-0.01362208, 0.6469924, 0.4437425, 1, 1, 1, 1, 1,
-0.01289686, 0.5793929, 1.177924, 1, 1, 1, 1, 1,
-0.01189246, 0.01247517, -0.3369679, 1, 1, 1, 1, 1,
-0.01111393, 0.8366411, 0.6617694, 1, 1, 1, 1, 1,
-0.01082839, -0.1296904, -3.353729, 1, 1, 1, 1, 1,
-0.01075153, 0.1978367, -1.775865, 1, 1, 1, 1, 1,
-0.009183326, 2.069843, 2.122421, 1, 1, 1, 1, 1,
-0.007105492, 1.511336, 0.8715343, 1, 1, 1, 1, 1,
-0.006992503, 0.1238577, 0.07066669, 1, 1, 1, 1, 1,
-0.004735216, -0.7276924, -4.709688, 1, 1, 1, 1, 1,
-0.003529039, 1.093916, 0.6852826, 1, 1, 1, 1, 1,
0.002572097, 1.677984, 0.2076149, 1, 1, 1, 1, 1,
0.003371147, -2.491177, 2.93296, 1, 1, 1, 1, 1,
0.005970008, -0.6563429, 4.797153, 1, 1, 1, 1, 1,
0.006885435, -0.9026302, 2.678989, 1, 1, 1, 1, 1,
0.007822311, 0.8567806, -1.504324, 0, 0, 1, 1, 1,
0.007953945, 0.8258656, 0.7622892, 1, 0, 0, 1, 1,
0.009488516, 1.934243, -0.5720235, 1, 0, 0, 1, 1,
0.01002272, -0.127798, 4.239305, 1, 0, 0, 1, 1,
0.01178975, 0.3293155, -0.2711019, 1, 0, 0, 1, 1,
0.01390662, -0.5612564, 2.678225, 1, 0, 0, 1, 1,
0.02012767, 1.102928, -1.432312, 0, 0, 0, 1, 1,
0.02247139, 0.6212075, 1.172771, 0, 0, 0, 1, 1,
0.02653271, 1.531759, -0.3652646, 0, 0, 0, 1, 1,
0.0276485, 1.077516, -0.6493883, 0, 0, 0, 1, 1,
0.02888627, -0.3063702, 5.054029, 0, 0, 0, 1, 1,
0.0301723, 2.004257, -1.076175, 0, 0, 0, 1, 1,
0.03292936, 0.1529713, -1.458639, 0, 0, 0, 1, 1,
0.03534662, -1.010402, 2.462475, 1, 1, 1, 1, 1,
0.04382895, -0.6742161, 2.391284, 1, 1, 1, 1, 1,
0.04639315, -2.338415, 3.863263, 1, 1, 1, 1, 1,
0.05072125, 0.07509392, -0.4166498, 1, 1, 1, 1, 1,
0.05491551, 1.183634, 0.6146321, 1, 1, 1, 1, 1,
0.05767706, 0.9153927, -0.5316737, 1, 1, 1, 1, 1,
0.05883175, -0.2653103, 3.48507, 1, 1, 1, 1, 1,
0.06145413, 1.850916, 2.030853, 1, 1, 1, 1, 1,
0.06316411, -1.83954, 3.040948, 1, 1, 1, 1, 1,
0.06385122, 1.794981, -0.547627, 1, 1, 1, 1, 1,
0.06694637, -1.139196, 2.667134, 1, 1, 1, 1, 1,
0.07549624, 0.0640102, 0.8299311, 1, 1, 1, 1, 1,
0.07603785, -0.5791345, 3.111678, 1, 1, 1, 1, 1,
0.08107523, 1.626348, 0.3975164, 1, 1, 1, 1, 1,
0.0819264, -0.2937214, 3.015993, 1, 1, 1, 1, 1,
0.08393942, -0.5759409, 5.165313, 0, 0, 1, 1, 1,
0.0867584, -0.3801328, 1.462883, 1, 0, 0, 1, 1,
0.08736211, 0.06880088, 1.982479, 1, 0, 0, 1, 1,
0.0876675, 1.020787, 1.63596, 1, 0, 0, 1, 1,
0.0897861, -0.3552621, 1.993837, 1, 0, 0, 1, 1,
0.08998189, 0.1323085, 0.3502791, 1, 0, 0, 1, 1,
0.0926239, 1.022421, -0.0242092, 0, 0, 0, 1, 1,
0.09400724, -0.8498856, 3.496176, 0, 0, 0, 1, 1,
0.09687047, -0.7495949, 2.422781, 0, 0, 0, 1, 1,
0.09776261, -1.42928, 3.122821, 0, 0, 0, 1, 1,
0.1015607, 0.07304472, 1.553457, 0, 0, 0, 1, 1,
0.1041459, 1.926238, -0.5587429, 0, 0, 0, 1, 1,
0.104431, 0.3296427, 1.633112, 0, 0, 0, 1, 1,
0.1050711, 0.6721331, 1.228478, 1, 1, 1, 1, 1,
0.1056259, 0.1717111, 0.2999817, 1, 1, 1, 1, 1,
0.109942, -0.1900883, 2.600093, 1, 1, 1, 1, 1,
0.1114448, -0.6818669, 3.459184, 1, 1, 1, 1, 1,
0.1117957, 0.3109094, 0.0266393, 1, 1, 1, 1, 1,
0.1136031, -1.187633, 3.591041, 1, 1, 1, 1, 1,
0.1171858, -0.3933882, 3.239347, 1, 1, 1, 1, 1,
0.1199139, -0.6851646, 2.724824, 1, 1, 1, 1, 1,
0.1286829, -0.8156499, 3.882349, 1, 1, 1, 1, 1,
0.1287526, -3.261371, 4.991832, 1, 1, 1, 1, 1,
0.1311566, -1.312267, 1.830972, 1, 1, 1, 1, 1,
0.1326386, -1.868518, 3.102374, 1, 1, 1, 1, 1,
0.133509, -2.794841, 3.564253, 1, 1, 1, 1, 1,
0.1342083, -0.6014822, 1.969508, 1, 1, 1, 1, 1,
0.1386133, 1.086064, -0.2550825, 1, 1, 1, 1, 1,
0.1404516, 1.352188, -0.3965557, 0, 0, 1, 1, 1,
0.1412563, -0.2827037, 1.288288, 1, 0, 0, 1, 1,
0.1419857, -1.162231, 4.109471, 1, 0, 0, 1, 1,
0.1433755, 0.7533232, 0.830072, 1, 0, 0, 1, 1,
0.1439684, 0.5608519, -0.4017663, 1, 0, 0, 1, 1,
0.1501553, -1.020373, 4.840938, 1, 0, 0, 1, 1,
0.1505779, 0.7903157, 0.7728276, 0, 0, 0, 1, 1,
0.151665, -0.5349031, 3.59935, 0, 0, 0, 1, 1,
0.1521433, -0.3371307, 2.720678, 0, 0, 0, 1, 1,
0.1574477, -0.3414889, 3.0176, 0, 0, 0, 1, 1,
0.1583497, 0.5010089, 1.107153, 0, 0, 0, 1, 1,
0.1606904, -0.0812882, 0.561068, 0, 0, 0, 1, 1,
0.1631634, -1.078532, 2.385079, 0, 0, 0, 1, 1,
0.1632857, 0.444228, 1.161458, 1, 1, 1, 1, 1,
0.1643289, 0.926536, 0.4895739, 1, 1, 1, 1, 1,
0.167917, 0.5469763, -0.2574832, 1, 1, 1, 1, 1,
0.1693377, -1.248987, 3.988026, 1, 1, 1, 1, 1,
0.1712837, -0.3328418, 2.835514, 1, 1, 1, 1, 1,
0.1731509, -0.7720173, 3.932152, 1, 1, 1, 1, 1,
0.174751, 0.8139092, 0.7917466, 1, 1, 1, 1, 1,
0.1748141, -1.079031, 3.226914, 1, 1, 1, 1, 1,
0.1748442, 0.298756, 0.380385, 1, 1, 1, 1, 1,
0.1751725, -1.506414, 3.519382, 1, 1, 1, 1, 1,
0.1775859, -0.8290632, 3.49976, 1, 1, 1, 1, 1,
0.1778316, -0.1631142, 2.194966, 1, 1, 1, 1, 1,
0.1781999, -0.4198986, 2.389071, 1, 1, 1, 1, 1,
0.1787701, 0.3441635, 0.03541427, 1, 1, 1, 1, 1,
0.1808439, 0.2156945, 1.73614, 1, 1, 1, 1, 1,
0.182587, 2.821381, -0.4686106, 0, 0, 1, 1, 1,
0.1826726, -1.157448, 3.0699, 1, 0, 0, 1, 1,
0.1832535, 0.976003, 0.1866891, 1, 0, 0, 1, 1,
0.1869009, -0.08389807, 1.801594, 1, 0, 0, 1, 1,
0.1924876, -0.6516289, 2.526308, 1, 0, 0, 1, 1,
0.195738, 0.9921702, -0.4315887, 1, 0, 0, 1, 1,
0.196659, -1.879787, 2.558103, 0, 0, 0, 1, 1,
0.2048601, -0.5998976, 3.406023, 0, 0, 0, 1, 1,
0.207567, -0.9312884, 2.517149, 0, 0, 0, 1, 1,
0.2098702, 0.004878765, 0.5287105, 0, 0, 0, 1, 1,
0.2155199, -1.312126, 3.61621, 0, 0, 0, 1, 1,
0.2307127, -0.1199534, 1.118468, 0, 0, 0, 1, 1,
0.2344248, 1.239022, -1.350586, 0, 0, 0, 1, 1,
0.2378114, -0.1571855, 2.796819, 1, 1, 1, 1, 1,
0.2416057, -0.4463383, 2.318283, 1, 1, 1, 1, 1,
0.242873, -0.07034971, 0.7235568, 1, 1, 1, 1, 1,
0.2473434, 0.3594839, -0.4905193, 1, 1, 1, 1, 1,
0.2520965, 0.3645554, 1.486494, 1, 1, 1, 1, 1,
0.2556392, -1.810845, 4.107253, 1, 1, 1, 1, 1,
0.2578498, -1.16061, 2.938414, 1, 1, 1, 1, 1,
0.2628586, -0.4612771, 4.216619, 1, 1, 1, 1, 1,
0.2653267, -0.01360224, 1.583363, 1, 1, 1, 1, 1,
0.2701806, -0.8269771, 2.962878, 1, 1, 1, 1, 1,
0.2727373, -1.595141, 4.100904, 1, 1, 1, 1, 1,
0.2748121, 0.787105, 0.7722765, 1, 1, 1, 1, 1,
0.2748841, 0.9574314, 0.2282475, 1, 1, 1, 1, 1,
0.2758024, -0.6460482, 4.05722, 1, 1, 1, 1, 1,
0.2764941, 0.6334815, -0.973841, 1, 1, 1, 1, 1,
0.2771735, 1.155052, 0.4661628, 0, 0, 1, 1, 1,
0.284502, -1.993979, 2.841389, 1, 0, 0, 1, 1,
0.2889397, 0.817802, 0.2403694, 1, 0, 0, 1, 1,
0.2913783, -2.015767, 3.996122, 1, 0, 0, 1, 1,
0.2945813, -0.400103, 4.64525, 1, 0, 0, 1, 1,
0.295461, 1.325619, 0.9074826, 1, 0, 0, 1, 1,
0.2991543, 1.590108, -1.509424, 0, 0, 0, 1, 1,
0.3021249, -0.4284383, 3.139242, 0, 0, 0, 1, 1,
0.30304, 0.9876249, -1.76479, 0, 0, 0, 1, 1,
0.303252, 0.212721, -0.5401612, 0, 0, 0, 1, 1,
0.3063028, 0.6797969, 0.9178851, 0, 0, 0, 1, 1,
0.3078502, 0.6900339, 1.53325, 0, 0, 0, 1, 1,
0.3138274, 1.674992, -0.339994, 0, 0, 0, 1, 1,
0.3167181, 0.1312579, 2.351228, 1, 1, 1, 1, 1,
0.3181561, 0.1957294, 1.259516, 1, 1, 1, 1, 1,
0.3200523, 0.2438827, -0.01485607, 1, 1, 1, 1, 1,
0.3219638, -1.368934, 1.161839, 1, 1, 1, 1, 1,
0.3243307, -1.029681, 5.224846, 1, 1, 1, 1, 1,
0.3252433, 1.080418, -0.5102953, 1, 1, 1, 1, 1,
0.3254252, -0.03564768, 0.9742705, 1, 1, 1, 1, 1,
0.3289947, 0.1838249, 1.886302, 1, 1, 1, 1, 1,
0.3296499, 0.5620509, 0.5244076, 1, 1, 1, 1, 1,
0.3309296, 0.6420159, 0.2082932, 1, 1, 1, 1, 1,
0.3356836, -1.598827, 3.875994, 1, 1, 1, 1, 1,
0.3364573, 0.3746151, -0.6543663, 1, 1, 1, 1, 1,
0.3388802, -2.919323, 3.941596, 1, 1, 1, 1, 1,
0.340826, 1.069401, -0.1580723, 1, 1, 1, 1, 1,
0.3413003, -0.2354634, 1.150222, 1, 1, 1, 1, 1,
0.3467322, -0.558651, 1.417524, 0, 0, 1, 1, 1,
0.3485624, 0.5784565, 1.474899, 1, 0, 0, 1, 1,
0.3503432, 1.822694, 1.631429, 1, 0, 0, 1, 1,
0.3515684, -1.002795, 2.637639, 1, 0, 0, 1, 1,
0.3537773, -0.299788, 2.471408, 1, 0, 0, 1, 1,
0.3543181, -1.636458, 4.926269, 1, 0, 0, 1, 1,
0.3546585, -0.3584548, 3.99301, 0, 0, 0, 1, 1,
0.3555878, -0.6088562, 2.293829, 0, 0, 0, 1, 1,
0.3558457, -0.5267227, 4.129073, 0, 0, 0, 1, 1,
0.357951, -0.3991807, 1.547434, 0, 0, 0, 1, 1,
0.358408, 1.409546, 1.437356, 0, 0, 0, 1, 1,
0.3600152, -0.3381678, 2.627565, 0, 0, 0, 1, 1,
0.3620685, -1.402926, 2.783252, 0, 0, 0, 1, 1,
0.3621802, -0.6686265, 3.30224, 1, 1, 1, 1, 1,
0.3651538, -1.348894, 2.955435, 1, 1, 1, 1, 1,
0.3680034, -0.5598105, 2.243679, 1, 1, 1, 1, 1,
0.368154, -0.04843371, 2.921512, 1, 1, 1, 1, 1,
0.3699933, -0.2220632, 3.165809, 1, 1, 1, 1, 1,
0.3704281, 0.2094691, 0.6402735, 1, 1, 1, 1, 1,
0.3706737, -0.5023931, 1.286674, 1, 1, 1, 1, 1,
0.3748277, -0.4519229, 3.978746, 1, 1, 1, 1, 1,
0.3766443, 0.3891144, -0.589211, 1, 1, 1, 1, 1,
0.3777961, -0.1556784, 1.45061, 1, 1, 1, 1, 1,
0.3823229, -0.7442513, 2.870394, 1, 1, 1, 1, 1,
0.3825035, 0.4076728, 1.950469, 1, 1, 1, 1, 1,
0.3830324, 0.6575598, -3.092598, 1, 1, 1, 1, 1,
0.3845347, 0.3922104, 1.962239, 1, 1, 1, 1, 1,
0.3848416, 0.2139983, -0.5245379, 1, 1, 1, 1, 1,
0.3865109, 0.2869387, -0.1012626, 0, 0, 1, 1, 1,
0.3915662, 0.6041662, -0.8570848, 1, 0, 0, 1, 1,
0.3932351, -0.6660231, 3.452002, 1, 0, 0, 1, 1,
0.3940931, 0.2214206, 0.9777793, 1, 0, 0, 1, 1,
0.3954577, 0.06943398, 1.776284, 1, 0, 0, 1, 1,
0.395583, 0.6745827, -0.05375945, 1, 0, 0, 1, 1,
0.3957266, 0.2773067, 1.298763, 0, 0, 0, 1, 1,
0.3988205, 0.2503161, 1.042885, 0, 0, 0, 1, 1,
0.3995379, -1.018906, 4.106059, 0, 0, 0, 1, 1,
0.4005811, 1.623812, 0.6094381, 0, 0, 0, 1, 1,
0.4026968, -1.256264, 3.577984, 0, 0, 0, 1, 1,
0.4048574, 1.635665, -0.3656381, 0, 0, 0, 1, 1,
0.4068723, 0.8693258, 2.517726, 0, 0, 0, 1, 1,
0.4093188, -1.055468, 3.647406, 1, 1, 1, 1, 1,
0.41085, -1.628256, 3.304177, 1, 1, 1, 1, 1,
0.4148424, 0.3435637, 1.588717, 1, 1, 1, 1, 1,
0.4166711, -1.074541, 2.442754, 1, 1, 1, 1, 1,
0.4214965, 0.769183, -0.1464372, 1, 1, 1, 1, 1,
0.4242036, 0.2824104, 0.6214554, 1, 1, 1, 1, 1,
0.4242519, 1.346195, 0.6473377, 1, 1, 1, 1, 1,
0.4258974, 0.4755828, 0.3112735, 1, 1, 1, 1, 1,
0.4283623, -0.05820388, 2.743576, 1, 1, 1, 1, 1,
0.4290066, -1.041706, 2.590269, 1, 1, 1, 1, 1,
0.4362903, -0.3892297, 3.150814, 1, 1, 1, 1, 1,
0.4363942, -2.280058, 2.704129, 1, 1, 1, 1, 1,
0.4381741, -0.3249296, 1.689721, 1, 1, 1, 1, 1,
0.439404, 0.8742958, 1.470185, 1, 1, 1, 1, 1,
0.4396055, -0.03200683, 2.600038, 1, 1, 1, 1, 1,
0.4415064, -0.354889, 1.998705, 0, 0, 1, 1, 1,
0.4416247, -2.081257, 2.304013, 1, 0, 0, 1, 1,
0.4453165, -0.9950279, 2.422502, 1, 0, 0, 1, 1,
0.4468845, 1.44105, 0.534568, 1, 0, 0, 1, 1,
0.4490219, 0.8444955, 0.07411807, 1, 0, 0, 1, 1,
0.4520161, -0.7043152, 3.635081, 1, 0, 0, 1, 1,
0.4559772, -1.434928, 4.777221, 0, 0, 0, 1, 1,
0.4572365, 0.0942108, 1.665318, 0, 0, 0, 1, 1,
0.4596489, -1.008176, 4.046133, 0, 0, 0, 1, 1,
0.4661726, 2.730097, -0.6091183, 0, 0, 0, 1, 1,
0.4717924, 1.07943, 0.6271704, 0, 0, 0, 1, 1,
0.4733488, 0.7448182, 1.78676, 0, 0, 0, 1, 1,
0.4901914, 0.1909103, 2.334086, 0, 0, 0, 1, 1,
0.4948044, 0.8100256, 1.038354, 1, 1, 1, 1, 1,
0.4961902, 1.323495, 0.3294167, 1, 1, 1, 1, 1,
0.4966706, -0.1721303, 1.992579, 1, 1, 1, 1, 1,
0.5007595, -1.489187, 1.279942, 1, 1, 1, 1, 1,
0.50298, -0.6451576, 1.111291, 1, 1, 1, 1, 1,
0.5048478, 0.3199541, 2.150682, 1, 1, 1, 1, 1,
0.5050305, 0.2000295, 1.445201, 1, 1, 1, 1, 1,
0.5109615, -0.1440571, 1.713692, 1, 1, 1, 1, 1,
0.5112303, -0.912703, 2.210289, 1, 1, 1, 1, 1,
0.5113521, -0.9689262, 2.644524, 1, 1, 1, 1, 1,
0.5113799, -0.09409846, 1.306702, 1, 1, 1, 1, 1,
0.5132405, 1.616568, 0.469386, 1, 1, 1, 1, 1,
0.5169187, -1.01311, 3.581185, 1, 1, 1, 1, 1,
0.5236548, -1.063937, 3.814513, 1, 1, 1, 1, 1,
0.5239908, -0.7688258, 2.193939, 1, 1, 1, 1, 1,
0.5246041, 0.287433, 2.815598, 0, 0, 1, 1, 1,
0.5304239, 0.6825351, 1.145242, 1, 0, 0, 1, 1,
0.5336315, -0.5579528, 2.130692, 1, 0, 0, 1, 1,
0.5336657, -0.6655146, 3.355829, 1, 0, 0, 1, 1,
0.5383161, -0.2246024, 0.5474358, 1, 0, 0, 1, 1,
0.5383872, -0.5543704, 1.2902, 1, 0, 0, 1, 1,
0.5460335, -0.1837072, 2.492679, 0, 0, 0, 1, 1,
0.5582515, -0.9374216, 2.547578, 0, 0, 0, 1, 1,
0.5587849, -1.522615, 2.033128, 0, 0, 0, 1, 1,
0.5588257, -1.048, 2.061901, 0, 0, 0, 1, 1,
0.5590442, -0.6615134, 1.580015, 0, 0, 0, 1, 1,
0.5591831, -0.04868553, 1.268557, 0, 0, 0, 1, 1,
0.5614678, -0.9900775, 2.32651, 0, 0, 0, 1, 1,
0.5615517, 1.178495, 0.2181797, 1, 1, 1, 1, 1,
0.5637797, 1.150137, -0.785317, 1, 1, 1, 1, 1,
0.5728861, -0.5660859, 2.827433, 1, 1, 1, 1, 1,
0.5747952, -0.01682954, 1.930739, 1, 1, 1, 1, 1,
0.5800586, 0.2046523, 1.56204, 1, 1, 1, 1, 1,
0.5800723, 1.008218, 0.1860235, 1, 1, 1, 1, 1,
0.5820321, 0.6248174, 1.007067, 1, 1, 1, 1, 1,
0.5866814, 0.8682922, 1.27262, 1, 1, 1, 1, 1,
0.5880387, 0.3576998, 1.158329, 1, 1, 1, 1, 1,
0.5883079, 1.264334, -1.294618, 1, 1, 1, 1, 1,
0.5886235, -0.3613256, 0.9579542, 1, 1, 1, 1, 1,
0.5989298, -0.6115817, 2.124107, 1, 1, 1, 1, 1,
0.6000009, -0.7771665, 2.047412, 1, 1, 1, 1, 1,
0.603709, -0.08547324, 2.622686, 1, 1, 1, 1, 1,
0.6045308, -0.2416554, 0.05909105, 1, 1, 1, 1, 1,
0.6060259, -0.2040682, 3.075504, 0, 0, 1, 1, 1,
0.6101109, 0.07424884, 2.305067, 1, 0, 0, 1, 1,
0.6116937, 1.665791, 0.8499624, 1, 0, 0, 1, 1,
0.6125485, -0.06621105, 3.547987, 1, 0, 0, 1, 1,
0.6158111, -0.2466495, 1.463395, 1, 0, 0, 1, 1,
0.6364744, -1.157908, 3.351334, 1, 0, 0, 1, 1,
0.6431723, 0.3276744, 1.16198, 0, 0, 0, 1, 1,
0.6433506, -0.6593928, 2.037998, 0, 0, 0, 1, 1,
0.6461414, 1.086877, 0.4720539, 0, 0, 0, 1, 1,
0.6466425, 1.443358, 1.340011, 0, 0, 0, 1, 1,
0.6468047, 0.7595747, -0.5599248, 0, 0, 0, 1, 1,
0.6559786, 0.4823543, 0.4692482, 0, 0, 0, 1, 1,
0.659517, 0.2158718, 0.1984373, 0, 0, 0, 1, 1,
0.6611187, -0.2257491, 2.649764, 1, 1, 1, 1, 1,
0.6615061, 0.6012523, -0.4358397, 1, 1, 1, 1, 1,
0.6619862, 1.096678, 0.8286117, 1, 1, 1, 1, 1,
0.662025, -1.293893, 1.865736, 1, 1, 1, 1, 1,
0.6633205, 0.52453, -0.8104917, 1, 1, 1, 1, 1,
0.6667842, 0.1049376, 3.563133, 1, 1, 1, 1, 1,
0.670236, 1.240691, 1.455608, 1, 1, 1, 1, 1,
0.6719741, 0.7506877, 1.333227, 1, 1, 1, 1, 1,
0.6748996, -0.3261119, 2.811935, 1, 1, 1, 1, 1,
0.6786782, 1.734435, 0.6950603, 1, 1, 1, 1, 1,
0.6798899, -0.0436842, 1.80758, 1, 1, 1, 1, 1,
0.6806511, 0.9413807, 1.771738, 1, 1, 1, 1, 1,
0.6826469, -0.6583162, 1.862801, 1, 1, 1, 1, 1,
0.6835141, -0.9565666, 2.373626, 1, 1, 1, 1, 1,
0.6861788, -0.1603321, 2.555004, 1, 1, 1, 1, 1,
0.6894222, -1.007899, 2.733081, 0, 0, 1, 1, 1,
0.6904897, -0.1191144, 2.68785, 1, 0, 0, 1, 1,
0.6911134, 1.286656, 1.463291, 1, 0, 0, 1, 1,
0.6981744, -2.197791, 2.661264, 1, 0, 0, 1, 1,
0.6989208, 0.3707402, -0.4269297, 1, 0, 0, 1, 1,
0.6989642, -1.035566, 2.654971, 1, 0, 0, 1, 1,
0.7006667, 0.6509792, -0.4302433, 0, 0, 0, 1, 1,
0.7007262, 1.054007, 1.496514, 0, 0, 0, 1, 1,
0.7076074, 0.2424661, 1.463343, 0, 0, 0, 1, 1,
0.7107788, 1.061626, 1.648438, 0, 0, 0, 1, 1,
0.7134866, -0.6576943, 3.825611, 0, 0, 0, 1, 1,
0.7134948, 1.782964, 0.05842059, 0, 0, 0, 1, 1,
0.7161142, 0.2621565, -0.5402124, 0, 0, 0, 1, 1,
0.7172201, -1.051262, 3.134633, 1, 1, 1, 1, 1,
0.7175095, -0.4964266, 1.551082, 1, 1, 1, 1, 1,
0.7274503, -0.2965083, 1.187366, 1, 1, 1, 1, 1,
0.7276035, -0.1425224, 2.344794, 1, 1, 1, 1, 1,
0.7352807, -0.2809389, 0.7897515, 1, 1, 1, 1, 1,
0.7462426, -0.09219057, 1.497006, 1, 1, 1, 1, 1,
0.748227, 1.000054, 0.08114537, 1, 1, 1, 1, 1,
0.7555393, 2.746512, 1.415754, 1, 1, 1, 1, 1,
0.7567151, -1.150748, 1.680872, 1, 1, 1, 1, 1,
0.7640166, 0.3508232, 2.017654, 1, 1, 1, 1, 1,
0.769379, 0.3669417, -0.05336862, 1, 1, 1, 1, 1,
0.7702715, 0.4764707, 0.4874413, 1, 1, 1, 1, 1,
0.771366, 0.3677236, 0.8228673, 1, 1, 1, 1, 1,
0.7720221, -1.341305, 4.566773, 1, 1, 1, 1, 1,
0.7755906, 0.2829636, 0.9976726, 1, 1, 1, 1, 1,
0.781875, -1.347345, 3.101127, 0, 0, 1, 1, 1,
0.7835552, 0.2992801, 1.058113, 1, 0, 0, 1, 1,
0.7884409, -0.4141511, 0.1626658, 1, 0, 0, 1, 1,
0.7948478, -2.191509, 3.449614, 1, 0, 0, 1, 1,
0.7956681, 0.4730071, 0.4442138, 1, 0, 0, 1, 1,
0.8009159, 0.2343165, 2.395702, 1, 0, 0, 1, 1,
0.8020815, 0.9263916, -0.6862927, 0, 0, 0, 1, 1,
0.8044348, 1.150554, 0.9619367, 0, 0, 0, 1, 1,
0.8045696, 0.01325407, 2.326958, 0, 0, 0, 1, 1,
0.8126522, 0.5670509, 1.631159, 0, 0, 0, 1, 1,
0.8147212, -0.4140656, 0.9921997, 0, 0, 0, 1, 1,
0.8175356, -0.7735963, 1.16501, 0, 0, 0, 1, 1,
0.8232802, -1.380918, 1.564284, 0, 0, 0, 1, 1,
0.8324629, -1.826782, 3.531521, 1, 1, 1, 1, 1,
0.8331143, -0.05138941, 0.9327208, 1, 1, 1, 1, 1,
0.8351839, 0.05477916, 2.972796, 1, 1, 1, 1, 1,
0.8371316, -0.7222046, 3.032348, 1, 1, 1, 1, 1,
0.8424242, 1.016387, -0.2614896, 1, 1, 1, 1, 1,
0.8426364, -0.2429359, 1.88544, 1, 1, 1, 1, 1,
0.8436803, -0.8703265, 3.562867, 1, 1, 1, 1, 1,
0.8438765, -1.010333, 2.391522, 1, 1, 1, 1, 1,
0.8445601, -0.0879666, 3.756514, 1, 1, 1, 1, 1,
0.8518755, 0.04974858, 0.2680671, 1, 1, 1, 1, 1,
0.8528697, 0.2026072, 0.1329048, 1, 1, 1, 1, 1,
0.8633186, 2.513637, 1.661109, 1, 1, 1, 1, 1,
0.8682869, 0.4649802, 1.040235, 1, 1, 1, 1, 1,
0.8710299, -0.8155774, 3.608129, 1, 1, 1, 1, 1,
0.874876, 0.427863, 1.113949, 1, 1, 1, 1, 1,
0.8754067, -0.4457515, 2.6722, 0, 0, 1, 1, 1,
0.8760569, -0.8624187, 2.06831, 1, 0, 0, 1, 1,
0.878414, -0.4999795, 0.6547675, 1, 0, 0, 1, 1,
0.8829449, -0.129729, 2.207658, 1, 0, 0, 1, 1,
0.8847514, -1.436415, 5.21859, 1, 0, 0, 1, 1,
0.8871701, -0.7707943, 1.047815, 1, 0, 0, 1, 1,
0.8877354, -1.418838, 1.817534, 0, 0, 0, 1, 1,
0.8914061, -0.630556, 3.950913, 0, 0, 0, 1, 1,
0.8933374, -1.13551, 3.009506, 0, 0, 0, 1, 1,
0.8933513, 0.8866264, -0.2514418, 0, 0, 0, 1, 1,
0.8959196, 2.830802, -1.036564, 0, 0, 0, 1, 1,
0.9017738, -1.106242, 1.248025, 0, 0, 0, 1, 1,
0.9039932, -0.1525104, 1.232333, 0, 0, 0, 1, 1,
0.9098826, -0.5318891, 0.7033674, 1, 1, 1, 1, 1,
0.9142442, -0.6895826, 2.929316, 1, 1, 1, 1, 1,
0.9149424, 0.9691672, 0.439678, 1, 1, 1, 1, 1,
0.9257452, -0.5750224, 2.221905, 1, 1, 1, 1, 1,
0.9283309, 1.492168, 1.639954, 1, 1, 1, 1, 1,
0.9298258, 1.373418, 0.6105397, 1, 1, 1, 1, 1,
0.9316382, 0.5651256, 1.345094, 1, 1, 1, 1, 1,
0.9430244, 0.1962393, 2.015354, 1, 1, 1, 1, 1,
0.9470698, 0.1321469, 3.243342, 1, 1, 1, 1, 1,
0.9510364, 0.3569007, 0.871761, 1, 1, 1, 1, 1,
0.9631066, 1.078544, 1.983428, 1, 1, 1, 1, 1,
0.9646712, 1.767827, -0.6830316, 1, 1, 1, 1, 1,
0.973187, 0.2471622, 1.709085, 1, 1, 1, 1, 1,
0.9750414, 1.890534, -0.1953711, 1, 1, 1, 1, 1,
0.9794821, 0.9146378, 0.5929976, 1, 1, 1, 1, 1,
0.9887254, 2.681577, -0.2766098, 0, 0, 1, 1, 1,
1.00062, 1.308357, 0.4889141, 1, 0, 0, 1, 1,
1.000657, 1.794394, 1.280275, 1, 0, 0, 1, 1,
1.002479, 0.2786592, 0.4493831, 1, 0, 0, 1, 1,
1.004963, -0.3223794, 1.055524, 1, 0, 0, 1, 1,
1.005083, 0.8384685, 0.7579071, 1, 0, 0, 1, 1,
1.008756, 0.5638769, 2.331426, 0, 0, 0, 1, 1,
1.009642, -0.1836172, 1.694526, 0, 0, 0, 1, 1,
1.014133, 0.2097829, 4.075562, 0, 0, 0, 1, 1,
1.02344, -0.8907661, 1.771312, 0, 0, 0, 1, 1,
1.029321, -0.2962228, 2.511529, 0, 0, 0, 1, 1,
1.032622, 1.164297, -0.08437393, 0, 0, 0, 1, 1,
1.037844, 0.7572577, 1.52182, 0, 0, 0, 1, 1,
1.038033, -0.1469046, 1.506043, 1, 1, 1, 1, 1,
1.049214, -0.2749319, 3.229433, 1, 1, 1, 1, 1,
1.052476, -0.3933753, 3.978366, 1, 1, 1, 1, 1,
1.066061, 0.8331854, 2.373428, 1, 1, 1, 1, 1,
1.066393, 0.0310731, 2.163454, 1, 1, 1, 1, 1,
1.066961, -0.4556548, 2.024832, 1, 1, 1, 1, 1,
1.06917, 0.2475983, 0.06879914, 1, 1, 1, 1, 1,
1.087922, 0.6456335, 0.6925408, 1, 1, 1, 1, 1,
1.095632, 0.1357572, -0.6979249, 1, 1, 1, 1, 1,
1.098731, -0.9856725, 1.040523, 1, 1, 1, 1, 1,
1.102036, 0.08286618, 1.680492, 1, 1, 1, 1, 1,
1.104891, 1.406177, 1.413823, 1, 1, 1, 1, 1,
1.106895, 0.1920215, 2.100082, 1, 1, 1, 1, 1,
1.118611, -0.03462823, 2.061968, 1, 1, 1, 1, 1,
1.123803, 0.6817995, 1.761287, 1, 1, 1, 1, 1,
1.140022, 0.975283, 0.5748289, 0, 0, 1, 1, 1,
1.14916, -1.91263, 1.901889, 1, 0, 0, 1, 1,
1.150991, -1.5138, 2.147048, 1, 0, 0, 1, 1,
1.157355, -0.08568647, 1.099261, 1, 0, 0, 1, 1,
1.161974, 0.2086084, 1.964867, 1, 0, 0, 1, 1,
1.175149, 0.6153687, 1.185429, 1, 0, 0, 1, 1,
1.179184, -0.367463, 2.908995, 0, 0, 0, 1, 1,
1.183288, 0.106571, 2.841832, 0, 0, 0, 1, 1,
1.185809, -0.3599399, 0.7708709, 0, 0, 0, 1, 1,
1.193574, -2.087923, 1.543392, 0, 0, 0, 1, 1,
1.202198, -0.9818291, 1.928915, 0, 0, 0, 1, 1,
1.213682, -0.04846784, 0.7371573, 0, 0, 0, 1, 1,
1.215614, 0.01642403, 1.999033, 0, 0, 0, 1, 1,
1.229517, -1.087124, 3.29805, 1, 1, 1, 1, 1,
1.231408, -0.3797583, 1.399682, 1, 1, 1, 1, 1,
1.232981, -0.1306781, 1.250327, 1, 1, 1, 1, 1,
1.260115, 0.6039428, 1.825936, 1, 1, 1, 1, 1,
1.261641, -1.178019, 3.339262, 1, 1, 1, 1, 1,
1.261704, -0.07746764, 0.7253109, 1, 1, 1, 1, 1,
1.272404, 0.00497701, -0.4737839, 1, 1, 1, 1, 1,
1.292891, 1.131602, 1.713734, 1, 1, 1, 1, 1,
1.298254, 0.08239529, 0.5641301, 1, 1, 1, 1, 1,
1.299699, 1.141156, 0.7949302, 1, 1, 1, 1, 1,
1.300844, -0.2543352, 1.935863, 1, 1, 1, 1, 1,
1.317328, -1.063964, 2.464943, 1, 1, 1, 1, 1,
1.339735, 0.7222599, 1.66555, 1, 1, 1, 1, 1,
1.345783, -0.05044414, 4.197988, 1, 1, 1, 1, 1,
1.364665, -0.006164095, 3.294086, 1, 1, 1, 1, 1,
1.368412, -1.891843, 3.195882, 0, 0, 1, 1, 1,
1.383382, 0.8092873, -0.754485, 1, 0, 0, 1, 1,
1.390848, 0.1144494, 1.962352, 1, 0, 0, 1, 1,
1.393378, 0.4198516, 1.386953, 1, 0, 0, 1, 1,
1.393666, 1.857931, 0.5090864, 1, 0, 0, 1, 1,
1.399825, -0.3506249, 2.75086, 1, 0, 0, 1, 1,
1.407401, -0.2853263, 2.535673, 0, 0, 0, 1, 1,
1.419671, 0.8755063, 1.404685, 0, 0, 0, 1, 1,
1.430456, 1.027255, -0.8520789, 0, 0, 0, 1, 1,
1.432204, -0.136757, 3.767678, 0, 0, 0, 1, 1,
1.434557, -0.05675093, 1.837243, 0, 0, 0, 1, 1,
1.480608, 0.05333411, 3.622996, 0, 0, 0, 1, 1,
1.486338, -0.6746677, 2.87042, 0, 0, 0, 1, 1,
1.502911, -1.002386, 2.719655, 1, 1, 1, 1, 1,
1.509985, -0.5284551, 1.578655, 1, 1, 1, 1, 1,
1.51336, -0.618636, 1.852441, 1, 1, 1, 1, 1,
1.518084, 0.8865346, 1.441205, 1, 1, 1, 1, 1,
1.518216, -2.261949, 3.340965, 1, 1, 1, 1, 1,
1.518798, -0.7363604, 1.234081, 1, 1, 1, 1, 1,
1.523935, 1.34238, 2.199355, 1, 1, 1, 1, 1,
1.545118, 0.08824762, 0.7408386, 1, 1, 1, 1, 1,
1.556232, -0.4391967, 0.1619878, 1, 1, 1, 1, 1,
1.560851, -0.7896642, 3.767415, 1, 1, 1, 1, 1,
1.561016, -0.6397317, 2.530776, 1, 1, 1, 1, 1,
1.572766, 0.5472293, 2.799466, 1, 1, 1, 1, 1,
1.575848, -0.5313368, 2.945437, 1, 1, 1, 1, 1,
1.578381, 2.28311, -0.9522465, 1, 1, 1, 1, 1,
1.60389, 1.310725, 0.6804224, 1, 1, 1, 1, 1,
1.60839, -0.4822691, 1.228122, 0, 0, 1, 1, 1,
1.6248, -0.1096242, 1.647429, 1, 0, 0, 1, 1,
1.654285, -0.5867974, 0.9712308, 1, 0, 0, 1, 1,
1.658524, 0.2375606, 2.912868, 1, 0, 0, 1, 1,
1.659463, 0.07159116, 0.845208, 1, 0, 0, 1, 1,
1.69711, -0.1640598, 0.8809309, 1, 0, 0, 1, 1,
1.715597, 0.4848894, 3.919615, 0, 0, 0, 1, 1,
1.717972, 1.673751, 1.388371, 0, 0, 0, 1, 1,
1.725918, -0.54285, 1.399979, 0, 0, 0, 1, 1,
1.72599, 0.5428442, 2.27573, 0, 0, 0, 1, 1,
1.762035, 0.3459061, -0.4024152, 0, 0, 0, 1, 1,
1.774509, 1.57271, 1.972117, 0, 0, 0, 1, 1,
1.775481, 0.2582938, 2.962152, 0, 0, 0, 1, 1,
1.791336, 0.5741655, 0.378528, 1, 1, 1, 1, 1,
1.803425, -0.2975336, 3.650324, 1, 1, 1, 1, 1,
1.818577, 0.5386996, 2.554844, 1, 1, 1, 1, 1,
1.833828, 2.162392, 1.192893, 1, 1, 1, 1, 1,
1.842582, 0.285376, 1.453238, 1, 1, 1, 1, 1,
1.88008, -0.4608102, 2.010926, 1, 1, 1, 1, 1,
1.881408, 2.082639, 1.398136, 1, 1, 1, 1, 1,
1.881817, -0.5381789, 1.105812, 1, 1, 1, 1, 1,
1.892318, -0.3078343, 2.861707, 1, 1, 1, 1, 1,
1.907066, -0.6859079, 3.070099, 1, 1, 1, 1, 1,
1.907343, -2.481328, 1.617328, 1, 1, 1, 1, 1,
1.931914, 0.8401924, 2.336169, 1, 1, 1, 1, 1,
1.978166, -0.02514883, 2.012765, 1, 1, 1, 1, 1,
1.996436, 0.5522479, 1.221217, 1, 1, 1, 1, 1,
2.008293, -0.5348671, 2.294523, 1, 1, 1, 1, 1,
2.019848, -0.5920518, 1.91863, 0, 0, 1, 1, 1,
2.035434, -0.9551535, 1.928326, 1, 0, 0, 1, 1,
2.062112, 0.2374927, 2.758824, 1, 0, 0, 1, 1,
2.069945, 0.4422478, 1.151373, 1, 0, 0, 1, 1,
2.077794, 0.491832, 2.594301, 1, 0, 0, 1, 1,
2.108701, -0.914863, 2.090204, 1, 0, 0, 1, 1,
2.161759, -0.3635367, -0.5582783, 0, 0, 0, 1, 1,
2.18918, -1.819155, 3.535113, 0, 0, 0, 1, 1,
2.200228, 0.1300718, 1.042545, 0, 0, 0, 1, 1,
2.200981, 0.3773995, 1.406252, 0, 0, 0, 1, 1,
2.219696, -0.5578486, 1.978057, 0, 0, 0, 1, 1,
2.376051, -0.6263862, 1.231503, 0, 0, 0, 1, 1,
2.434152, -1.944638, 1.910656, 0, 0, 0, 1, 1,
2.501054, -1.127126, 1.912224, 1, 1, 1, 1, 1,
2.535126, -0.6831239, -0.4842102, 1, 1, 1, 1, 1,
2.615584, 0.9491372, 0.1825108, 1, 1, 1, 1, 1,
2.733874, 1.291125, 2.298916, 1, 1, 1, 1, 1,
2.74031, -0.5042046, 0.8621368, 1, 1, 1, 1, 1,
2.962829, 1.061193, 1.185572, 1, 1, 1, 1, 1,
2.967879, 0.9294325, 2.12714, 1, 1, 1, 1, 1
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
var radius = 9.320045;
var distance = 32.73626;
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
mvMatrix.translate( -0.002691627, 0.2152843, 0.07549286 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73626);
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
