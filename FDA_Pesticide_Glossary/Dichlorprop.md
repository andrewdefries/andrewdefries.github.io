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
-3.488623, 1.388999, -2.31124, 1, 0, 0, 1,
-3.258506, -0.2399252, -0.3670745, 1, 0.007843138, 0, 1,
-2.804854, 0.5368471, -1.894486, 1, 0.01176471, 0, 1,
-2.696548, -1.359625, -1.789578, 1, 0.01960784, 0, 1,
-2.574625, 2.590235, 0.00212987, 1, 0.02352941, 0, 1,
-2.565566, 0.6724615, -2.915351, 1, 0.03137255, 0, 1,
-2.458289, 3.18765, 0.6813411, 1, 0.03529412, 0, 1,
-2.443495, -1.136134, -2.165479, 1, 0.04313726, 0, 1,
-2.409179, 0.01153849, 0.2481839, 1, 0.04705882, 0, 1,
-2.378176, 0.6406658, -3.528052, 1, 0.05490196, 0, 1,
-2.372759, 0.009582766, -2.283459, 1, 0.05882353, 0, 1,
-2.298297, -0.6356739, -2.067933, 1, 0.06666667, 0, 1,
-2.212316, 1.203285, -0.4391481, 1, 0.07058824, 0, 1,
-2.19886, 1.264894, -1.137888, 1, 0.07843138, 0, 1,
-2.15977, -1.224072, -3.024727, 1, 0.08235294, 0, 1,
-2.142774, -0.32799, -1.754695, 1, 0.09019608, 0, 1,
-2.134952, 1.156538, -1.56615, 1, 0.09411765, 0, 1,
-2.11416, 1.521792, 0.9933207, 1, 0.1019608, 0, 1,
-2.100019, -0.7789884, -0.02995487, 1, 0.1098039, 0, 1,
-2.099188, 1.011904, -2.061148, 1, 0.1137255, 0, 1,
-2.089062, 0.7919663, -0.4917683, 1, 0.1215686, 0, 1,
-2.058853, 0.196503, -2.214138, 1, 0.1254902, 0, 1,
-2.051707, 1.300114, 0.5325346, 1, 0.1333333, 0, 1,
-2.04262, 1.021116, -0.3422554, 1, 0.1372549, 0, 1,
-2.030711, 0.1332977, -1.37778, 1, 0.145098, 0, 1,
-2.029735, 0.9662912, -0.1807955, 1, 0.1490196, 0, 1,
-1.979944, -0.7561842, -1.975517, 1, 0.1568628, 0, 1,
-1.955905, -0.6660215, -1.337536, 1, 0.1607843, 0, 1,
-1.933697, -0.1787198, -2.928603, 1, 0.1686275, 0, 1,
-1.914463, 1.186362, -1.971758, 1, 0.172549, 0, 1,
-1.911938, -0.2638632, -1.113841, 1, 0.1803922, 0, 1,
-1.897741, -1.406436, -2.351563, 1, 0.1843137, 0, 1,
-1.865928, -0.7009751, -1.835641, 1, 0.1921569, 0, 1,
-1.856323, -0.7762584, -2.70272, 1, 0.1960784, 0, 1,
-1.840807, -0.2065654, -0.3721606, 1, 0.2039216, 0, 1,
-1.840016, -0.8685365, -1.377207, 1, 0.2117647, 0, 1,
-1.835376, -1.480453, -3.352306, 1, 0.2156863, 0, 1,
-1.828517, -0.8932629, -2.005086, 1, 0.2235294, 0, 1,
-1.827787, -0.5594237, -1.08389, 1, 0.227451, 0, 1,
-1.819617, -0.9694903, -1.451251, 1, 0.2352941, 0, 1,
-1.802451, 0.1792126, -1.537683, 1, 0.2392157, 0, 1,
-1.782712, 2.947331, 0.5613946, 1, 0.2470588, 0, 1,
-1.776886, -0.989776, -2.592851, 1, 0.2509804, 0, 1,
-1.774125, -0.3391069, -0.9400939, 1, 0.2588235, 0, 1,
-1.761747, -0.6838476, -3.434842, 1, 0.2627451, 0, 1,
-1.746883, 0.5363894, -1.34661, 1, 0.2705882, 0, 1,
-1.744172, 0.3729629, -2.672548, 1, 0.2745098, 0, 1,
-1.736598, -1.33248, -2.403306, 1, 0.282353, 0, 1,
-1.705567, 0.9152287, -0.3535732, 1, 0.2862745, 0, 1,
-1.699866, 0.0680926, -0.9433358, 1, 0.2941177, 0, 1,
-1.698866, -0.5852945, -1.753484, 1, 0.3019608, 0, 1,
-1.69794, -0.05111396, -1.389209, 1, 0.3058824, 0, 1,
-1.695749, 1.214289, -0.6637947, 1, 0.3137255, 0, 1,
-1.695011, 0.2944358, -1.28572, 1, 0.3176471, 0, 1,
-1.687753, -0.2858728, -2.362302, 1, 0.3254902, 0, 1,
-1.686689, 0.2190488, 0.5244241, 1, 0.3294118, 0, 1,
-1.660153, -0.1014307, -0.849663, 1, 0.3372549, 0, 1,
-1.64795, 0.7360225, -2.799542, 1, 0.3411765, 0, 1,
-1.628877, 0.6209425, -2.190572, 1, 0.3490196, 0, 1,
-1.626263, -0.2999041, -0.5206148, 1, 0.3529412, 0, 1,
-1.616454, 0.09168027, -0.05830023, 1, 0.3607843, 0, 1,
-1.616167, 0.07292754, -1.512599, 1, 0.3647059, 0, 1,
-1.602445, -0.1035328, -2.307806, 1, 0.372549, 0, 1,
-1.602436, -0.6036307, -2.94516, 1, 0.3764706, 0, 1,
-1.582075, 1.150216, -0.6116278, 1, 0.3843137, 0, 1,
-1.580781, 0.5652628, 0.03801204, 1, 0.3882353, 0, 1,
-1.575048, -0.07393195, -1.259127, 1, 0.3960784, 0, 1,
-1.57368, 2.314472, -0.2723232, 1, 0.4039216, 0, 1,
-1.570731, -0.2263576, -3.262115, 1, 0.4078431, 0, 1,
-1.531432, -0.4626259, -2.447989, 1, 0.4156863, 0, 1,
-1.531081, 0.1444758, -1.682522, 1, 0.4196078, 0, 1,
-1.52399, 1.300178, -0.5961756, 1, 0.427451, 0, 1,
-1.520855, -1.184622, -2.85338, 1, 0.4313726, 0, 1,
-1.517437, -0.5387762, -1.701543, 1, 0.4392157, 0, 1,
-1.507355, 0.3042145, -2.425849, 1, 0.4431373, 0, 1,
-1.49215, 1.672573, 0.4167319, 1, 0.4509804, 0, 1,
-1.488281, -0.8417159, -3.379932, 1, 0.454902, 0, 1,
-1.483187, -2.902577, -5.569253, 1, 0.4627451, 0, 1,
-1.482004, -1.882435, -2.856049, 1, 0.4666667, 0, 1,
-1.478799, -1.881651, -1.02932, 1, 0.4745098, 0, 1,
-1.47327, -1.436739, -2.014173, 1, 0.4784314, 0, 1,
-1.470972, 0.2554833, -2.453988, 1, 0.4862745, 0, 1,
-1.459491, 0.5046701, -2.254035, 1, 0.4901961, 0, 1,
-1.452463, -0.6070085, -2.47822, 1, 0.4980392, 0, 1,
-1.442051, -0.4595563, -1.529368, 1, 0.5058824, 0, 1,
-1.431182, -1.063097, -2.657172, 1, 0.509804, 0, 1,
-1.427923, -0.6624212, -3.613742, 1, 0.5176471, 0, 1,
-1.424448, 0.5586218, -0.01366289, 1, 0.5215687, 0, 1,
-1.418465, 0.6220495, -1.174675, 1, 0.5294118, 0, 1,
-1.409488, 0.3188438, -1.006528, 1, 0.5333334, 0, 1,
-1.408022, 0.2031463, -1.408645, 1, 0.5411765, 0, 1,
-1.404136, 0.9298604, -2.441538, 1, 0.5450981, 0, 1,
-1.392529, 0.4078864, -0.8525871, 1, 0.5529412, 0, 1,
-1.376622, -1.017959, -1.549547, 1, 0.5568628, 0, 1,
-1.364678, 0.3641101, 0.569383, 1, 0.5647059, 0, 1,
-1.359502, 0.3362793, -1.511576, 1, 0.5686275, 0, 1,
-1.355681, -0.08592395, -2.488928, 1, 0.5764706, 0, 1,
-1.352626, 1.558158, 0.284512, 1, 0.5803922, 0, 1,
-1.342616, -1.118409, -1.730313, 1, 0.5882353, 0, 1,
-1.340367, 0.5779384, 0.4578654, 1, 0.5921569, 0, 1,
-1.339145, -0.02225665, -1.41948, 1, 0.6, 0, 1,
-1.33213, 1.019791, 0.2570754, 1, 0.6078432, 0, 1,
-1.32673, -0.3586266, -3.110428, 1, 0.6117647, 0, 1,
-1.320993, 1.901978, 0.3756609, 1, 0.6196079, 0, 1,
-1.312922, 0.05704878, -0.8643616, 1, 0.6235294, 0, 1,
-1.30151, -1.880924, -2.627252, 1, 0.6313726, 0, 1,
-1.300084, 0.3181586, -1.617936, 1, 0.6352941, 0, 1,
-1.293529, 1.254611, -0.7977438, 1, 0.6431373, 0, 1,
-1.288597, -0.4809975, -2.262591, 1, 0.6470588, 0, 1,
-1.281651, 0.6304361, -2.559883, 1, 0.654902, 0, 1,
-1.279134, -1.413996, -2.064092, 1, 0.6588235, 0, 1,
-1.270845, -0.4733405, -0.7079993, 1, 0.6666667, 0, 1,
-1.264023, -1.580241, -3.765862, 1, 0.6705883, 0, 1,
-1.25235, -0.05541855, -1.251998, 1, 0.6784314, 0, 1,
-1.24152, 0.06820364, -2.763552, 1, 0.682353, 0, 1,
-1.2394, -0.856385, -1.989298, 1, 0.6901961, 0, 1,
-1.234878, -0.04958033, -1.865765, 1, 0.6941177, 0, 1,
-1.233824, -1.38979, -1.350047, 1, 0.7019608, 0, 1,
-1.231102, 1.007082, -0.8153717, 1, 0.7098039, 0, 1,
-1.22916, 0.4848631, -2.534673, 1, 0.7137255, 0, 1,
-1.228778, -1.30746, -3.02032, 1, 0.7215686, 0, 1,
-1.22414, 1.102302, -2.313054, 1, 0.7254902, 0, 1,
-1.222864, 0.524685, -1.98084, 1, 0.7333333, 0, 1,
-1.222306, -2.43825, -3.205244, 1, 0.7372549, 0, 1,
-1.221452, -0.8740022, -1.575198, 1, 0.7450981, 0, 1,
-1.22016, -0.03302868, -0.5778821, 1, 0.7490196, 0, 1,
-1.215371, -0.7420197, -1.886805, 1, 0.7568628, 0, 1,
-1.212599, -0.1444559, -3.748132, 1, 0.7607843, 0, 1,
-1.208055, 1.478695, -0.8004909, 1, 0.7686275, 0, 1,
-1.200978, 0.3362681, -0.2693618, 1, 0.772549, 0, 1,
-1.198646, 1.079746, -1.31547, 1, 0.7803922, 0, 1,
-1.198077, -0.4139974, -4.377679, 1, 0.7843137, 0, 1,
-1.193433, -0.653885, -1.534475, 1, 0.7921569, 0, 1,
-1.191009, 0.9741381, -0.8312252, 1, 0.7960784, 0, 1,
-1.187985, -1.551425, -2.153916, 1, 0.8039216, 0, 1,
-1.186596, 0.9324017, -0.009430937, 1, 0.8117647, 0, 1,
-1.184633, 1.492576, -1.195467, 1, 0.8156863, 0, 1,
-1.184103, -0.2932845, -0.8097594, 1, 0.8235294, 0, 1,
-1.178271, 2.269389, -0.04619658, 1, 0.827451, 0, 1,
-1.176857, 0.2622793, -1.744082, 1, 0.8352941, 0, 1,
-1.168992, 1.574264, -0.9311717, 1, 0.8392157, 0, 1,
-1.161267, -0.6675971, -3.593061, 1, 0.8470588, 0, 1,
-1.158975, -1.673524, -3.601474, 1, 0.8509804, 0, 1,
-1.157838, 1.036276, -1.315219, 1, 0.8588235, 0, 1,
-1.143644, -0.2904961, -1.934033, 1, 0.8627451, 0, 1,
-1.140743, 0.8960633, -1.525004, 1, 0.8705882, 0, 1,
-1.140357, 0.245629, -0.1123088, 1, 0.8745098, 0, 1,
-1.137516, 1.272832, 0.6579564, 1, 0.8823529, 0, 1,
-1.134466, -0.1674925, -1.5901, 1, 0.8862745, 0, 1,
-1.134413, 1.109355, -0.7815623, 1, 0.8941177, 0, 1,
-1.128409, 0.1260101, -2.790756, 1, 0.8980392, 0, 1,
-1.124252, 0.1274265, -1.296799, 1, 0.9058824, 0, 1,
-1.119496, 0.2420414, 0.09099085, 1, 0.9137255, 0, 1,
-1.111372, -0.1213698, -2.154496, 1, 0.9176471, 0, 1,
-1.110742, -1.142192, -2.025489, 1, 0.9254902, 0, 1,
-1.11072, 0.3917379, 0.3246679, 1, 0.9294118, 0, 1,
-1.109226, 1.301648, 0.2401604, 1, 0.9372549, 0, 1,
-1.107475, -0.09055843, -0.6771098, 1, 0.9411765, 0, 1,
-1.092953, 0.386059, -1.057416, 1, 0.9490196, 0, 1,
-1.090971, -0.8370473, -3.369622, 1, 0.9529412, 0, 1,
-1.088388, -0.9579603, -3.296046, 1, 0.9607843, 0, 1,
-1.087951, -0.2647637, -2.281104, 1, 0.9647059, 0, 1,
-1.085205, -0.09788584, -0.8580043, 1, 0.972549, 0, 1,
-1.08044, -1.193605, -1.861452, 1, 0.9764706, 0, 1,
-1.070294, -1.472952, -2.45897, 1, 0.9843137, 0, 1,
-1.07018, -0.9241528, -2.749333, 1, 0.9882353, 0, 1,
-1.067119, 0.6667861, 0.2063814, 1, 0.9960784, 0, 1,
-1.066053, 1.09926, -1.600271, 0.9960784, 1, 0, 1,
-1.053732, 0.1708828, -1.570963, 0.9921569, 1, 0, 1,
-1.047972, 0.190208, -1.26861, 0.9843137, 1, 0, 1,
-1.046349, -1.267361, -1.786278, 0.9803922, 1, 0, 1,
-1.038597, 1.212955, -2.083946, 0.972549, 1, 0, 1,
-1.034687, 1.666101, -2.25269, 0.9686275, 1, 0, 1,
-1.030819, -0.8727846, -1.05418, 0.9607843, 1, 0, 1,
-1.027484, 0.6570141, -0.6046806, 0.9568627, 1, 0, 1,
-1.019233, 0.07538467, -1.725353, 0.9490196, 1, 0, 1,
-1.018836, -0.07445295, -0.262763, 0.945098, 1, 0, 1,
-1.005781, 1.576361, -0.5474938, 0.9372549, 1, 0, 1,
-1.001503, 0.1029206, -1.652245, 0.9333333, 1, 0, 1,
-1.00015, 2.060408, 0.09836326, 0.9254902, 1, 0, 1,
-0.9929149, 0.4752052, -1.613195, 0.9215686, 1, 0, 1,
-0.9927145, -0.4735222, -3.0314, 0.9137255, 1, 0, 1,
-0.9915734, -0.2695605, -1.11668, 0.9098039, 1, 0, 1,
-0.9868819, -1.8671, -2.085377, 0.9019608, 1, 0, 1,
-0.9806001, -2.73959, -3.159867, 0.8941177, 1, 0, 1,
-0.9774927, -0.6688858, -3.618896, 0.8901961, 1, 0, 1,
-0.9767066, -2.400697, -4.243957, 0.8823529, 1, 0, 1,
-0.9761184, -0.2784494, -0.3705955, 0.8784314, 1, 0, 1,
-0.9755551, -1.529292, -3.320068, 0.8705882, 1, 0, 1,
-0.9733868, 0.3883055, -1.01876, 0.8666667, 1, 0, 1,
-0.972595, -1.977559, -1.489296, 0.8588235, 1, 0, 1,
-0.964673, -0.6533512, -1.023462, 0.854902, 1, 0, 1,
-0.9633797, -0.2146485, -2.117768, 0.8470588, 1, 0, 1,
-0.9614583, -0.6088315, -2.522213, 0.8431373, 1, 0, 1,
-0.9607397, -0.4732536, -1.908435, 0.8352941, 1, 0, 1,
-0.9506279, 0.05614739, -0.3431236, 0.8313726, 1, 0, 1,
-0.9479907, 0.5797704, -2.674938, 0.8235294, 1, 0, 1,
-0.9479223, -1.878096, -2.568885, 0.8196079, 1, 0, 1,
-0.9478059, -1.986785, -2.977871, 0.8117647, 1, 0, 1,
-0.9469034, -0.2463253, -1.267407, 0.8078431, 1, 0, 1,
-0.9467231, -0.8233451, -0.3603545, 0.8, 1, 0, 1,
-0.9463568, -0.5664284, -1.815863, 0.7921569, 1, 0, 1,
-0.9457325, -1.055152, -4.107333, 0.7882353, 1, 0, 1,
-0.9439593, -0.7327839, -0.8312453, 0.7803922, 1, 0, 1,
-0.9363503, 0.07397567, -1.860391, 0.7764706, 1, 0, 1,
-0.9283346, 1.810536, -0.229537, 0.7686275, 1, 0, 1,
-0.92613, -1.066942, -2.484192, 0.7647059, 1, 0, 1,
-0.9253964, -1.621233, -3.242351, 0.7568628, 1, 0, 1,
-0.9243258, 0.3323857, -1.387791, 0.7529412, 1, 0, 1,
-0.9239575, -1.224939, -2.773775, 0.7450981, 1, 0, 1,
-0.9186468, 1.395456, -2.191895, 0.7411765, 1, 0, 1,
-0.915032, -0.2504463, -3.87677, 0.7333333, 1, 0, 1,
-0.9143961, -0.7919976, -2.89379, 0.7294118, 1, 0, 1,
-0.9136403, 0.3237181, -0.6376058, 0.7215686, 1, 0, 1,
-0.9135157, 0.1561692, -3.008701, 0.7176471, 1, 0, 1,
-0.9106606, 0.4472579, -1.784506, 0.7098039, 1, 0, 1,
-0.9019135, -0.9945009, -1.213695, 0.7058824, 1, 0, 1,
-0.8983331, -1.062954, -1.022529, 0.6980392, 1, 0, 1,
-0.8965291, -0.230393, -0.6695104, 0.6901961, 1, 0, 1,
-0.8918069, -0.2456689, -2.213918, 0.6862745, 1, 0, 1,
-0.889351, -0.1599744, -1.541865, 0.6784314, 1, 0, 1,
-0.8850642, -1.226292, -1.827038, 0.6745098, 1, 0, 1,
-0.8773604, 2.533526, 0.03142299, 0.6666667, 1, 0, 1,
-0.8734248, 0.6222118, 0.4360162, 0.6627451, 1, 0, 1,
-0.8717009, 0.4558431, -0.5309151, 0.654902, 1, 0, 1,
-0.8698245, 1.169697, 0.5299756, 0.6509804, 1, 0, 1,
-0.8683322, 0.1683287, -0.4562238, 0.6431373, 1, 0, 1,
-0.8437365, 0.1120779, -0.5446005, 0.6392157, 1, 0, 1,
-0.8397332, -0.4671955, -3.261215, 0.6313726, 1, 0, 1,
-0.8308905, -0.1718788, -3.711763, 0.627451, 1, 0, 1,
-0.8190768, 2.214483, -0.7302336, 0.6196079, 1, 0, 1,
-0.8151261, 0.7727991, -0.7821051, 0.6156863, 1, 0, 1,
-0.8123765, -0.8154457, -3.354622, 0.6078432, 1, 0, 1,
-0.8091518, -1.571131, -2.231316, 0.6039216, 1, 0, 1,
-0.8085184, 0.1239907, -0.9231231, 0.5960785, 1, 0, 1,
-0.8030105, 0.05393013, -0.7697752, 0.5882353, 1, 0, 1,
-0.8017395, -1.002253, -1.972039, 0.5843138, 1, 0, 1,
-0.7985334, -0.2011071, -0.915924, 0.5764706, 1, 0, 1,
-0.7846126, -0.7961516, -2.052785, 0.572549, 1, 0, 1,
-0.7781367, -0.5358428, -1.303285, 0.5647059, 1, 0, 1,
-0.7754258, -0.2713253, -2.741232, 0.5607843, 1, 0, 1,
-0.7751667, -1.989384, -1.693435, 0.5529412, 1, 0, 1,
-0.7723677, -1.713302, -1.99956, 0.5490196, 1, 0, 1,
-0.7672635, -2.105673, -2.777617, 0.5411765, 1, 0, 1,
-0.7664632, 0.1115824, -1.596269, 0.5372549, 1, 0, 1,
-0.766269, -1.463475, -1.421341, 0.5294118, 1, 0, 1,
-0.7660657, -0.9654453, -3.513422, 0.5254902, 1, 0, 1,
-0.7651556, 0.863117, -0.05772878, 0.5176471, 1, 0, 1,
-0.7602655, 0.2975436, -1.380115, 0.5137255, 1, 0, 1,
-0.7542161, 1.830531, 0.4304954, 0.5058824, 1, 0, 1,
-0.751388, -0.2525969, -2.344653, 0.5019608, 1, 0, 1,
-0.7497017, -0.1297141, -1.049948, 0.4941176, 1, 0, 1,
-0.7403705, -1.279957, -2.836965, 0.4862745, 1, 0, 1,
-0.7393993, 0.1283824, -2.741131, 0.4823529, 1, 0, 1,
-0.7382418, -0.2165943, -1.699435, 0.4745098, 1, 0, 1,
-0.7377183, -0.946855, -1.633563, 0.4705882, 1, 0, 1,
-0.7357078, -1.186191, -2.558866, 0.4627451, 1, 0, 1,
-0.7356293, 0.5690958, -0.7401519, 0.4588235, 1, 0, 1,
-0.7347249, -1.675882, -3.33814, 0.4509804, 1, 0, 1,
-0.73413, 1.134881, -2.280894, 0.4470588, 1, 0, 1,
-0.7327556, -2.335642, -3.130328, 0.4392157, 1, 0, 1,
-0.7263537, 1.67384, 1.072576, 0.4352941, 1, 0, 1,
-0.7252932, 0.3881129, 0.4571926, 0.427451, 1, 0, 1,
-0.7225592, -0.2601027, -0.7623109, 0.4235294, 1, 0, 1,
-0.7218003, -0.6168589, -4.141115, 0.4156863, 1, 0, 1,
-0.7193531, 1.539551, -0.644744, 0.4117647, 1, 0, 1,
-0.7134966, 0.481214, -1.829865, 0.4039216, 1, 0, 1,
-0.6967804, 0.3043796, -0.9625831, 0.3960784, 1, 0, 1,
-0.6858972, 0.7329173, -0.081233, 0.3921569, 1, 0, 1,
-0.6774771, 0.08946548, -1.70774, 0.3843137, 1, 0, 1,
-0.6756209, 0.6708099, -0.9552966, 0.3803922, 1, 0, 1,
-0.6753439, 0.9891816, -1.180275, 0.372549, 1, 0, 1,
-0.6745667, -0.7600982, -0.3267479, 0.3686275, 1, 0, 1,
-0.6683755, -1.231971, -2.359782, 0.3607843, 1, 0, 1,
-0.6683468, 0.6096477, -2.149043, 0.3568628, 1, 0, 1,
-0.6673882, 0.8821774, -0.4556626, 0.3490196, 1, 0, 1,
-0.6651899, -1.105956, -3.476273, 0.345098, 1, 0, 1,
-0.6638604, -2.058736, -3.686269, 0.3372549, 1, 0, 1,
-0.6589661, -0.3132029, -1.268618, 0.3333333, 1, 0, 1,
-0.6494893, 1.268729, 0.1307435, 0.3254902, 1, 0, 1,
-0.6465688, -1.720515, -1.043721, 0.3215686, 1, 0, 1,
-0.6379745, -0.7389305, -2.260628, 0.3137255, 1, 0, 1,
-0.6279245, 0.8827451, -1.626133, 0.3098039, 1, 0, 1,
-0.6148665, 0.5630468, -0.1941833, 0.3019608, 1, 0, 1,
-0.6146667, -0.04640565, -2.958266, 0.2941177, 1, 0, 1,
-0.6140499, -0.355099, -2.041618, 0.2901961, 1, 0, 1,
-0.6134719, -0.09359697, -1.567641, 0.282353, 1, 0, 1,
-0.6040174, -0.6767962, -3.131016, 0.2784314, 1, 0, 1,
-0.6027326, -1.287298, -2.572551, 0.2705882, 1, 0, 1,
-0.6020988, -1.207144, -2.24335, 0.2666667, 1, 0, 1,
-0.5940083, 0.3958178, -0.910915, 0.2588235, 1, 0, 1,
-0.5875711, 2.275084, 0.4881203, 0.254902, 1, 0, 1,
-0.5790982, -1.073757, -0.8457868, 0.2470588, 1, 0, 1,
-0.5776709, 0.6860234, -0.9534467, 0.2431373, 1, 0, 1,
-0.5762665, -0.6251587, -1.185491, 0.2352941, 1, 0, 1,
-0.5710593, -0.4460624, -1.26754, 0.2313726, 1, 0, 1,
-0.5709202, -1.965829, -2.641238, 0.2235294, 1, 0, 1,
-0.5691663, -2.500186, -3.04941, 0.2196078, 1, 0, 1,
-0.5637352, 0.5630948, 0.6843996, 0.2117647, 1, 0, 1,
-0.5615126, -1.159072, -4.719113, 0.2078431, 1, 0, 1,
-0.5603319, -0.4419952, -3.288743, 0.2, 1, 0, 1,
-0.55922, -1.726579, -2.237819, 0.1921569, 1, 0, 1,
-0.554, -0.1105969, -1.859706, 0.1882353, 1, 0, 1,
-0.5447318, -0.7371841, -3.131695, 0.1803922, 1, 0, 1,
-0.5436451, -0.1883097, -1.868152, 0.1764706, 1, 0, 1,
-0.5404531, -1.058449, -6.048638, 0.1686275, 1, 0, 1,
-0.540252, -0.0648196, -3.312689, 0.1647059, 1, 0, 1,
-0.5338622, -1.509408, -3.602322, 0.1568628, 1, 0, 1,
-0.5331393, 0.798237, -1.279772, 0.1529412, 1, 0, 1,
-0.5298302, -0.01427349, -2.131339, 0.145098, 1, 0, 1,
-0.5273012, 0.1909241, -0.8613398, 0.1411765, 1, 0, 1,
-0.5264748, 1.093953, 0.09681118, 0.1333333, 1, 0, 1,
-0.5213343, -0.480661, -2.330233, 0.1294118, 1, 0, 1,
-0.5178317, -0.2398983, -2.988011, 0.1215686, 1, 0, 1,
-0.5168577, -1.291113, -2.652546, 0.1176471, 1, 0, 1,
-0.5154083, 0.9207222, -0.9515346, 0.1098039, 1, 0, 1,
-0.51158, 0.523051, -1.527704, 0.1058824, 1, 0, 1,
-0.5112537, 1.33416, -0.4560853, 0.09803922, 1, 0, 1,
-0.5110312, 1.114945, -1.596134, 0.09019608, 1, 0, 1,
-0.5102002, 0.8311275, -1.43726, 0.08627451, 1, 0, 1,
-0.5082989, -0.1202002, -1.631474, 0.07843138, 1, 0, 1,
-0.5030091, 1.03517, -0.6950772, 0.07450981, 1, 0, 1,
-0.5026222, 0.8437594, -0.4290526, 0.06666667, 1, 0, 1,
-0.502441, 0.1557763, -2.799444, 0.0627451, 1, 0, 1,
-0.4983371, -1.320526, -1.852969, 0.05490196, 1, 0, 1,
-0.4944816, 0.414177, -0.4717405, 0.05098039, 1, 0, 1,
-0.4930335, -0.9145297, -3.363401, 0.04313726, 1, 0, 1,
-0.4896476, 0.4319583, 0.2764277, 0.03921569, 1, 0, 1,
-0.4888106, 0.675997, -0.3313591, 0.03137255, 1, 0, 1,
-0.4846655, 0.7698737, -1.656364, 0.02745098, 1, 0, 1,
-0.4827297, 0.6596279, -1.609119, 0.01960784, 1, 0, 1,
-0.4812762, -0.09025975, -2.411741, 0.01568628, 1, 0, 1,
-0.4791119, 0.2062631, -1.576622, 0.007843138, 1, 0, 1,
-0.4730454, 0.5655305, -1.089604, 0.003921569, 1, 0, 1,
-0.4649931, 0.3123172, -0.5955931, 0, 1, 0.003921569, 1,
-0.4597414, 0.4680331, -0.5569782, 0, 1, 0.01176471, 1,
-0.4586069, 0.5769158, -0.2091677, 0, 1, 0.01568628, 1,
-0.451368, -2.069801, -1.762191, 0, 1, 0.02352941, 1,
-0.4485325, 0.3010461, -1.006299, 0, 1, 0.02745098, 1,
-0.4428248, 0.4308201, 0.6836904, 0, 1, 0.03529412, 1,
-0.435596, -0.01453811, -0.8486553, 0, 1, 0.03921569, 1,
-0.4332479, 1.148049, -0.9647337, 0, 1, 0.04705882, 1,
-0.4285755, 1.247872, -0.1347383, 0, 1, 0.05098039, 1,
-0.4272141, -0.2503181, -2.95453, 0, 1, 0.05882353, 1,
-0.4165773, -0.04410134, -1.99177, 0, 1, 0.0627451, 1,
-0.4154955, -2.234238, -3.221721, 0, 1, 0.07058824, 1,
-0.414221, -0.0002831211, 0.2875836, 0, 1, 0.07450981, 1,
-0.4141023, 1.149826, -1.022661, 0, 1, 0.08235294, 1,
-0.4130442, -0.9594615, -3.623288, 0, 1, 0.08627451, 1,
-0.4127519, 1.040989, -0.05145979, 0, 1, 0.09411765, 1,
-0.4062859, -0.6036246, -2.134955, 0, 1, 0.1019608, 1,
-0.4036033, -0.8160957, -3.419732, 0, 1, 0.1058824, 1,
-0.4033054, 0.8497326, 0.02955811, 0, 1, 0.1137255, 1,
-0.4029526, -0.05017897, -0.4383928, 0, 1, 0.1176471, 1,
-0.3969795, 1.429755, 1.465391, 0, 1, 0.1254902, 1,
-0.3903842, 1.67505, 1.28182, 0, 1, 0.1294118, 1,
-0.388831, 0.9454516, 0.8458981, 0, 1, 0.1372549, 1,
-0.3799979, -0.3102092, -2.29904, 0, 1, 0.1411765, 1,
-0.3756164, 0.01794006, 0.01133255, 0, 1, 0.1490196, 1,
-0.3745294, 0.3764472, -0.5944172, 0, 1, 0.1529412, 1,
-0.3685399, 0.4897484, -0.2136348, 0, 1, 0.1607843, 1,
-0.3661745, 0.70935, 2.587712, 0, 1, 0.1647059, 1,
-0.3626454, 1.412005, -0.7970987, 0, 1, 0.172549, 1,
-0.3623449, 0.9106742, -1.05485, 0, 1, 0.1764706, 1,
-0.3595676, 0.8917022, -0.5583465, 0, 1, 0.1843137, 1,
-0.3590943, -0.2057576, -1.734133, 0, 1, 0.1882353, 1,
-0.358828, -0.1603745, -2.324406, 0, 1, 0.1960784, 1,
-0.3570682, -0.02004334, -3.542864, 0, 1, 0.2039216, 1,
-0.3550865, 0.1736747, -0.6660338, 0, 1, 0.2078431, 1,
-0.3548906, 0.004830681, -1.854258, 0, 1, 0.2156863, 1,
-0.3503791, -0.3326462, -2.376898, 0, 1, 0.2196078, 1,
-0.3503146, -0.03004907, -2.281397, 0, 1, 0.227451, 1,
-0.3450351, 0.7118825, 0.121005, 0, 1, 0.2313726, 1,
-0.3399203, -1.594014, -2.310279, 0, 1, 0.2392157, 1,
-0.3394806, -1.222052, -2.4415, 0, 1, 0.2431373, 1,
-0.3386039, 1.436751, -0.7634112, 0, 1, 0.2509804, 1,
-0.3379281, 1.611956, -1.379731, 0, 1, 0.254902, 1,
-0.3358839, -1.273121, -3.09473, 0, 1, 0.2627451, 1,
-0.3356803, 0.4445762, -0.8220104, 0, 1, 0.2666667, 1,
-0.330233, 0.1601785, 0.9986054, 0, 1, 0.2745098, 1,
-0.326805, 0.202052, -1.19499, 0, 1, 0.2784314, 1,
-0.3235564, -1.065065, -1.832467, 0, 1, 0.2862745, 1,
-0.3189285, 1.102081, -0.9359754, 0, 1, 0.2901961, 1,
-0.3169006, 0.5430694, 1.080726, 0, 1, 0.2980392, 1,
-0.3133724, 1.952891, -0.7795766, 0, 1, 0.3058824, 1,
-0.3099608, -0.2010815, -1.273048, 0, 1, 0.3098039, 1,
-0.3084467, 0.2150653, -2.450872, 0, 1, 0.3176471, 1,
-0.2951384, -0.7411041, -3.196624, 0, 1, 0.3215686, 1,
-0.2894162, 1.20209, 0.3638809, 0, 1, 0.3294118, 1,
-0.2881209, 1.095284, 0.7088934, 0, 1, 0.3333333, 1,
-0.2842544, -2.495479, -2.355817, 0, 1, 0.3411765, 1,
-0.2781616, 0.1310917, -2.75236, 0, 1, 0.345098, 1,
-0.2770377, 0.7220674, -0.4073666, 0, 1, 0.3529412, 1,
-0.2763684, -3.08907, -3.139674, 0, 1, 0.3568628, 1,
-0.2760901, 1.940497, 0.1156685, 0, 1, 0.3647059, 1,
-0.2716693, -2.065779, -1.858408, 0, 1, 0.3686275, 1,
-0.2676106, -1.379049, -4.271983, 0, 1, 0.3764706, 1,
-0.2660342, 0.2597912, 0.3275359, 0, 1, 0.3803922, 1,
-0.2639912, 0.3024643, -1.03768, 0, 1, 0.3882353, 1,
-0.2634213, -0.1861904, -2.595198, 0, 1, 0.3921569, 1,
-0.2629399, 0.3071438, -1.227933, 0, 1, 0.4, 1,
-0.2584996, 0.1518547, -0.5930319, 0, 1, 0.4078431, 1,
-0.2574782, -1.911387, -3.918515, 0, 1, 0.4117647, 1,
-0.2557794, 0.7385816, 0.5603271, 0, 1, 0.4196078, 1,
-0.2540567, 1.754853, 0.5156825, 0, 1, 0.4235294, 1,
-0.2507791, 0.5534227, -0.2868754, 0, 1, 0.4313726, 1,
-0.249888, 0.9390967, 1.006529, 0, 1, 0.4352941, 1,
-0.2480836, -0.4955943, -3.40931, 0, 1, 0.4431373, 1,
-0.2445609, 0.7800819, 0.8058158, 0, 1, 0.4470588, 1,
-0.2416904, -0.1200464, -2.503855, 0, 1, 0.454902, 1,
-0.2405335, 0.1943863, -1.424787, 0, 1, 0.4588235, 1,
-0.2394749, -0.4234302, -4.060342, 0, 1, 0.4666667, 1,
-0.2383398, -0.2027481, -0.9111266, 0, 1, 0.4705882, 1,
-0.233277, -0.05121396, -2.844831, 0, 1, 0.4784314, 1,
-0.2292782, -2.472967, -2.555732, 0, 1, 0.4823529, 1,
-0.2290268, 0.7522222, 3.196638, 0, 1, 0.4901961, 1,
-0.2275922, -0.3187179, -1.055158, 0, 1, 0.4941176, 1,
-0.220121, -0.7323097, -1.166005, 0, 1, 0.5019608, 1,
-0.21934, -2.367067, -4.249954, 0, 1, 0.509804, 1,
-0.2180879, 0.8985603, -0.1310553, 0, 1, 0.5137255, 1,
-0.2138965, -1.197541, -2.004936, 0, 1, 0.5215687, 1,
-0.2132736, 0.9708642, -0.395735, 0, 1, 0.5254902, 1,
-0.2108908, 0.09073591, -1.250663, 0, 1, 0.5333334, 1,
-0.2100022, 1.985196, -0.3995389, 0, 1, 0.5372549, 1,
-0.2098549, -0.7090564, -3.640572, 0, 1, 0.5450981, 1,
-0.2098246, 1.469905, 0.4465328, 0, 1, 0.5490196, 1,
-0.2092669, 1.736203, -0.04908475, 0, 1, 0.5568628, 1,
-0.2074214, -0.3421167, -2.96615, 0, 1, 0.5607843, 1,
-0.2068471, 0.2491125, 0.5598646, 0, 1, 0.5686275, 1,
-0.2029951, -0.9417454, -2.612299, 0, 1, 0.572549, 1,
-0.1982596, -0.08990196, -2.060231, 0, 1, 0.5803922, 1,
-0.1954412, 1.330609, 0.5772273, 0, 1, 0.5843138, 1,
-0.1936015, -0.8972852, -2.605698, 0, 1, 0.5921569, 1,
-0.1914281, -0.9281194, -3.169118, 0, 1, 0.5960785, 1,
-0.1909752, -2.66639, -3.442402, 0, 1, 0.6039216, 1,
-0.19081, 0.1016051, -0.2590762, 0, 1, 0.6117647, 1,
-0.188568, 0.05161753, -2.064351, 0, 1, 0.6156863, 1,
-0.188319, 1.247398, 0.5616602, 0, 1, 0.6235294, 1,
-0.1879995, 1.329765, -0.0002348139, 0, 1, 0.627451, 1,
-0.1867129, -1.69956, -0.9005453, 0, 1, 0.6352941, 1,
-0.182876, 0.2968233, -0.8017378, 0, 1, 0.6392157, 1,
-0.178986, 0.1442087, -1.327572, 0, 1, 0.6470588, 1,
-0.1746208, -0.7850626, -2.387913, 0, 1, 0.6509804, 1,
-0.1693503, -0.8117524, -1.285805, 0, 1, 0.6588235, 1,
-0.16669, 0.9854695, 0.03510837, 0, 1, 0.6627451, 1,
-0.1662063, 0.2632298, 1.312757, 0, 1, 0.6705883, 1,
-0.1648948, -0.3704906, -2.760509, 0, 1, 0.6745098, 1,
-0.1635595, -0.5357283, -3.773566, 0, 1, 0.682353, 1,
-0.1622622, -1.567558, -2.402918, 0, 1, 0.6862745, 1,
-0.1619571, -2.09711, -1.789911, 0, 1, 0.6941177, 1,
-0.1615393, 2.032399, -1.702949, 0, 1, 0.7019608, 1,
-0.1584578, -0.170732, -4.254608, 0, 1, 0.7058824, 1,
-0.1559708, -0.05325798, -0.07880121, 0, 1, 0.7137255, 1,
-0.1541319, 0.5400406, -1.100105, 0, 1, 0.7176471, 1,
-0.1488006, 1.418305, 0.3656234, 0, 1, 0.7254902, 1,
-0.148449, 0.5573705, -0.2006394, 0, 1, 0.7294118, 1,
-0.146897, -1.503313, -2.222474, 0, 1, 0.7372549, 1,
-0.1451329, -0.1025925, -0.9525567, 0, 1, 0.7411765, 1,
-0.1439275, 0.2020901, -0.5473994, 0, 1, 0.7490196, 1,
-0.1437085, 0.5253565, -0.8679498, 0, 1, 0.7529412, 1,
-0.1423508, -0.1723127, -5.056548, 0, 1, 0.7607843, 1,
-0.1361301, -1.702764, -3.547135, 0, 1, 0.7647059, 1,
-0.1356045, 0.3996016, 0.2548833, 0, 1, 0.772549, 1,
-0.1344034, 2.037894, -0.2562959, 0, 1, 0.7764706, 1,
-0.1338952, -0.713888, -1.738806, 0, 1, 0.7843137, 1,
-0.1311942, 1.014165, -1.270674, 0, 1, 0.7882353, 1,
-0.1301581, -0.9812245, -2.85724, 0, 1, 0.7960784, 1,
-0.1294183, -0.3393757, -3.212656, 0, 1, 0.8039216, 1,
-0.1293227, 0.8477911, -0.7749489, 0, 1, 0.8078431, 1,
-0.1283469, 0.3469312, -1.229856, 0, 1, 0.8156863, 1,
-0.1270964, 0.5799444, -1.335895, 0, 1, 0.8196079, 1,
-0.1216981, -0.03933097, -2.620028, 0, 1, 0.827451, 1,
-0.1216934, -0.9632989, -2.594527, 0, 1, 0.8313726, 1,
-0.1195034, -0.9126784, -3.333972, 0, 1, 0.8392157, 1,
-0.1077027, -0.9978544, -1.603287, 0, 1, 0.8431373, 1,
-0.1052157, 1.330173, -0.3280033, 0, 1, 0.8509804, 1,
-0.1010884, 0.4275187, -0.3520004, 0, 1, 0.854902, 1,
-0.09947527, 1.147075, 0.6053302, 0, 1, 0.8627451, 1,
-0.08788372, 1.425414, -0.6133591, 0, 1, 0.8666667, 1,
-0.08328398, 0.007384493, 0.1448596, 0, 1, 0.8745098, 1,
-0.07911648, -1.231147, -2.756278, 0, 1, 0.8784314, 1,
-0.07653652, 1.239974, 0.04167305, 0, 1, 0.8862745, 1,
-0.07414951, -0.0007025303, -0.3338288, 0, 1, 0.8901961, 1,
-0.07088175, 1.475934, -1.37926, 0, 1, 0.8980392, 1,
-0.06194903, -1.614522, -2.60076, 0, 1, 0.9058824, 1,
-0.06173632, 0.955807, 0.9557814, 0, 1, 0.9098039, 1,
-0.05986036, 1.291931, 1.766793, 0, 1, 0.9176471, 1,
-0.05930927, -0.8638939, -2.648637, 0, 1, 0.9215686, 1,
-0.05464723, 0.1193599, -1.743636, 0, 1, 0.9294118, 1,
-0.05418526, -0.2647408, -0.9115018, 0, 1, 0.9333333, 1,
-0.0498811, 0.05457952, -2.233845, 0, 1, 0.9411765, 1,
-0.04927655, -0.6042192, -3.282636, 0, 1, 0.945098, 1,
-0.04891399, -1.736629, -3.726278, 0, 1, 0.9529412, 1,
-0.046586, -0.5869019, -2.730511, 0, 1, 0.9568627, 1,
-0.04618838, 0.5510513, -0.0009230412, 0, 1, 0.9647059, 1,
-0.04585436, -0.002139274, -0.7693541, 0, 1, 0.9686275, 1,
-0.04287998, -0.4867271, -4.202718, 0, 1, 0.9764706, 1,
-0.04044747, 0.9762526, 1.347176, 0, 1, 0.9803922, 1,
-0.03829288, 0.7350248, -0.598906, 0, 1, 0.9882353, 1,
-0.03331722, 0.2054789, -0.06923151, 0, 1, 0.9921569, 1,
-0.0291908, -0.4876361, -2.0241, 0, 1, 1, 1,
-0.02863257, 0.9773105, 0.4753659, 0, 0.9921569, 1, 1,
-0.02646429, -0.9023329, -2.44462, 0, 0.9882353, 1, 1,
-0.02265598, -0.394614, -2.051137, 0, 0.9803922, 1, 1,
-0.02139127, -0.145376, -3.89939, 0, 0.9764706, 1, 1,
-0.02027825, -1.832398, -5.04665, 0, 0.9686275, 1, 1,
-0.01871489, 0.1962574, 0.5840923, 0, 0.9647059, 1, 1,
-0.01833583, -2.092452, -4.516021, 0, 0.9568627, 1, 1,
-0.01708857, -0.8676987, -4.176108, 0, 0.9529412, 1, 1,
-0.006898873, -2.153414, -3.482406, 0, 0.945098, 1, 1,
-0.00599234, 0.005743043, -0.5164173, 0, 0.9411765, 1, 1,
-0.004870204, -0.4698656, -2.05258, 0, 0.9333333, 1, 1,
-0.002039913, -0.3185717, -3.057135, 0, 0.9294118, 1, 1,
-0.001053181, -1.700845, -1.304398, 0, 0.9215686, 1, 1,
-1.798722e-05, 0.3546988, -0.1728986, 0, 0.9176471, 1, 1,
0.000991773, -0.3760717, 1.085286, 0, 0.9098039, 1, 1,
0.007311198, -0.7589725, 3.150719, 0, 0.9058824, 1, 1,
0.02006093, -0.1131535, 1.161794, 0, 0.8980392, 1, 1,
0.02108789, 0.1659619, 2.061784, 0, 0.8901961, 1, 1,
0.02192233, 0.01240982, 1.413378, 0, 0.8862745, 1, 1,
0.0381958, -1.070596, 3.814939, 0, 0.8784314, 1, 1,
0.04174497, 1.287141, 2.601706, 0, 0.8745098, 1, 1,
0.04194558, -0.07902425, 3.607487, 0, 0.8666667, 1, 1,
0.04256691, -1.059467, 3.055866, 0, 0.8627451, 1, 1,
0.04651601, -0.9681382, 2.997523, 0, 0.854902, 1, 1,
0.05356004, -0.4011187, -0.2860807, 0, 0.8509804, 1, 1,
0.05531206, 0.9499859, 1.209397, 0, 0.8431373, 1, 1,
0.05954845, -1.354701, 1.601412, 0, 0.8392157, 1, 1,
0.06414904, -0.6677963, 2.764646, 0, 0.8313726, 1, 1,
0.06952739, -0.1181447, 1.005698, 0, 0.827451, 1, 1,
0.07396992, -1.023811, 4.418083, 0, 0.8196079, 1, 1,
0.07430732, -0.4383749, 2.890909, 0, 0.8156863, 1, 1,
0.08906055, 0.06969449, 0.5665865, 0, 0.8078431, 1, 1,
0.09872957, -0.09462997, 1.428557, 0, 0.8039216, 1, 1,
0.1002656, 1.155983, 0.2156602, 0, 0.7960784, 1, 1,
0.1065502, -0.4694307, 2.817983, 0, 0.7882353, 1, 1,
0.1072828, 0.128392, -0.2030245, 0, 0.7843137, 1, 1,
0.1094593, -0.1774002, 3.728294, 0, 0.7764706, 1, 1,
0.1135087, -0.1386493, 3.954676, 0, 0.772549, 1, 1,
0.115771, -0.3715461, 2.718092, 0, 0.7647059, 1, 1,
0.1182937, 1.329734, -1.116604, 0, 0.7607843, 1, 1,
0.1188029, -0.02155753, 2.795836, 0, 0.7529412, 1, 1,
0.1196622, -0.03620217, 0.5734743, 0, 0.7490196, 1, 1,
0.1213453, 1.042228, 0.05796548, 0, 0.7411765, 1, 1,
0.1216706, -1.613262, 1.018171, 0, 0.7372549, 1, 1,
0.1219152, -0.6036066, 3.188141, 0, 0.7294118, 1, 1,
0.1256645, 0.1165091, 1.588477, 0, 0.7254902, 1, 1,
0.1260644, 0.8030084, 1.526544, 0, 0.7176471, 1, 1,
0.128925, -1.128461, 3.510838, 0, 0.7137255, 1, 1,
0.1295927, 0.7631888, -0.06684678, 0, 0.7058824, 1, 1,
0.1298629, -0.6810172, 3.723816, 0, 0.6980392, 1, 1,
0.1306484, 0.1459338, 1.774531, 0, 0.6941177, 1, 1,
0.1315877, -0.3121391, 0.7713249, 0, 0.6862745, 1, 1,
0.1321738, -1.065555, 2.394736, 0, 0.682353, 1, 1,
0.1375214, 0.5458051, 1.620991, 0, 0.6745098, 1, 1,
0.1389672, -0.5471869, 4.95532, 0, 0.6705883, 1, 1,
0.1390518, -0.6006495, 2.902959, 0, 0.6627451, 1, 1,
0.1461162, -1.044961, 3.554339, 0, 0.6588235, 1, 1,
0.1531495, -1.392396, 3.213772, 0, 0.6509804, 1, 1,
0.1556372, 1.108249, 0.945052, 0, 0.6470588, 1, 1,
0.1604216, 0.2156257, 1.393293, 0, 0.6392157, 1, 1,
0.1692851, -1.031133, 2.653779, 0, 0.6352941, 1, 1,
0.1712094, 1.056816, 1.20847, 0, 0.627451, 1, 1,
0.174929, -2.294469, 3.368879, 0, 0.6235294, 1, 1,
0.1759892, -0.7683633, 4.391245, 0, 0.6156863, 1, 1,
0.1760046, -0.08817395, 2.678451, 0, 0.6117647, 1, 1,
0.1782221, -1.55034, 3.006814, 0, 0.6039216, 1, 1,
0.1800139, 0.1472947, 1.763277, 0, 0.5960785, 1, 1,
0.1812468, -0.06279854, 1.508381, 0, 0.5921569, 1, 1,
0.1877614, -0.149068, 2.220558, 0, 0.5843138, 1, 1,
0.1920619, 0.9404571, 0.7747023, 0, 0.5803922, 1, 1,
0.1945521, 0.1249905, 0.2408333, 0, 0.572549, 1, 1,
0.1979076, 0.7343459, 0.5795399, 0, 0.5686275, 1, 1,
0.1991997, 0.684952, 2.080665, 0, 0.5607843, 1, 1,
0.2041064, -0.4214377, 3.050318, 0, 0.5568628, 1, 1,
0.2076235, -0.4887145, 0.9000112, 0, 0.5490196, 1, 1,
0.21515, 0.6875837, 1.033805, 0, 0.5450981, 1, 1,
0.2201849, -0.4810514, 3.94202, 0, 0.5372549, 1, 1,
0.2202981, -0.7691103, 2.290258, 0, 0.5333334, 1, 1,
0.2211178, -0.2335027, 2.328796, 0, 0.5254902, 1, 1,
0.226775, 2.438609, -1.693005, 0, 0.5215687, 1, 1,
0.2308844, 0.07348444, 0.5908085, 0, 0.5137255, 1, 1,
0.2341715, 0.8742201, -0.526361, 0, 0.509804, 1, 1,
0.2353178, -0.5173583, 4.230686, 0, 0.5019608, 1, 1,
0.2369002, -0.4035017, 0.2330344, 0, 0.4941176, 1, 1,
0.2412749, 0.8861284, -1.66115, 0, 0.4901961, 1, 1,
0.2433874, -1.119738, 1.43513, 0, 0.4823529, 1, 1,
0.2499923, 0.5695794, 2.373307, 0, 0.4784314, 1, 1,
0.252653, -0.442769, 2.844146, 0, 0.4705882, 1, 1,
0.2527731, 0.2001691, 1.406132, 0, 0.4666667, 1, 1,
0.2543269, -0.1248665, 2.237729, 0, 0.4588235, 1, 1,
0.2555907, -1.950735, 2.803818, 0, 0.454902, 1, 1,
0.2571832, 1.616456, 0.5640246, 0, 0.4470588, 1, 1,
0.2620874, -0.4149859, 2.627253, 0, 0.4431373, 1, 1,
0.2636757, -0.3845946, 2.182911, 0, 0.4352941, 1, 1,
0.2664978, 1.129137, -0.1415979, 0, 0.4313726, 1, 1,
0.268454, 2.352369, -0.3305035, 0, 0.4235294, 1, 1,
0.2695489, -1.545145, 3.911776, 0, 0.4196078, 1, 1,
0.2717577, -1.035429, 5.219799, 0, 0.4117647, 1, 1,
0.2739975, -0.3648547, 1.577862, 0, 0.4078431, 1, 1,
0.2780473, -0.8761478, 4.383535, 0, 0.4, 1, 1,
0.2806282, -0.1173738, 1.177146, 0, 0.3921569, 1, 1,
0.2814126, -0.4673934, 3.11141, 0, 0.3882353, 1, 1,
0.2844764, 1.212548, 0.9131911, 0, 0.3803922, 1, 1,
0.2865541, 2.223736, -0.6913108, 0, 0.3764706, 1, 1,
0.2896762, -0.1914377, 2.471318, 0, 0.3686275, 1, 1,
0.2898559, -1.208754, 2.197489, 0, 0.3647059, 1, 1,
0.2906144, 0.2795343, -0.6471332, 0, 0.3568628, 1, 1,
0.2990702, -0.4402555, 3.444152, 0, 0.3529412, 1, 1,
0.2995335, -0.07287433, 2.811862, 0, 0.345098, 1, 1,
0.2999651, 1.625533, 0.3700714, 0, 0.3411765, 1, 1,
0.3052687, -1.739065, 2.852367, 0, 0.3333333, 1, 1,
0.3096542, 1.099808, 0.9727303, 0, 0.3294118, 1, 1,
0.3131917, 0.1861296, 0.4478503, 0, 0.3215686, 1, 1,
0.3133266, 0.3240967, 0.4357699, 0, 0.3176471, 1, 1,
0.3161742, 0.970464, -1.697647, 0, 0.3098039, 1, 1,
0.3163991, 0.1949054, 0.4884928, 0, 0.3058824, 1, 1,
0.3176919, 0.1407949, 1.343468, 0, 0.2980392, 1, 1,
0.3208671, 1.365374, 0.2190144, 0, 0.2901961, 1, 1,
0.3238393, -1.327144, 1.579294, 0, 0.2862745, 1, 1,
0.3270676, -0.1892277, 2.540383, 0, 0.2784314, 1, 1,
0.3273579, 1.174769, 0.5150887, 0, 0.2745098, 1, 1,
0.3275004, 0.1395498, 0.927827, 0, 0.2666667, 1, 1,
0.3281775, -1.20495, 2.474443, 0, 0.2627451, 1, 1,
0.3302908, 0.3769179, -0.04915399, 0, 0.254902, 1, 1,
0.3319595, 2.332842, 0.08865274, 0, 0.2509804, 1, 1,
0.3325607, 0.8666331, 0.06011522, 0, 0.2431373, 1, 1,
0.3341364, 0.5888343, -1.228774, 0, 0.2392157, 1, 1,
0.3353686, 0.001213193, 1.855483, 0, 0.2313726, 1, 1,
0.3432997, 0.233086, 0.7834696, 0, 0.227451, 1, 1,
0.3467123, -0.5949095, 2.757585, 0, 0.2196078, 1, 1,
0.350467, 1.741827, 1.387874, 0, 0.2156863, 1, 1,
0.351597, 0.8681228, -0.7162139, 0, 0.2078431, 1, 1,
0.3556752, 0.2600372, 1.811934, 0, 0.2039216, 1, 1,
0.3615567, -1.342646, 4.031877, 0, 0.1960784, 1, 1,
0.3623545, -0.7091995, 3.612499, 0, 0.1882353, 1, 1,
0.3699702, -0.9409448, 3.379959, 0, 0.1843137, 1, 1,
0.371402, -0.379261, 2.023561, 0, 0.1764706, 1, 1,
0.3722357, -0.8930807, 3.232869, 0, 0.172549, 1, 1,
0.3791404, -0.8848411, 4.019471, 0, 0.1647059, 1, 1,
0.3806807, -0.6436931, 1.37821, 0, 0.1607843, 1, 1,
0.3846743, -0.08567051, 1.739113, 0, 0.1529412, 1, 1,
0.3847919, -1.235446, 1.949017, 0, 0.1490196, 1, 1,
0.3857577, 0.08154967, 0.8097089, 0, 0.1411765, 1, 1,
0.3863413, -0.1829184, 1.522367, 0, 0.1372549, 1, 1,
0.3904834, 0.07585788, 1.815539, 0, 0.1294118, 1, 1,
0.3917888, 0.7976518, -1.109963, 0, 0.1254902, 1, 1,
0.3939629, 0.0224957, 0.3574277, 0, 0.1176471, 1, 1,
0.3949424, 1.162829, -1.039417, 0, 0.1137255, 1, 1,
0.3954883, 1.175259, 2.516484, 0, 0.1058824, 1, 1,
0.3966458, 0.8684953, 1.14311, 0, 0.09803922, 1, 1,
0.3982287, -1.271618, 2.309244, 0, 0.09411765, 1, 1,
0.4014221, 1.160622, -0.06328539, 0, 0.08627451, 1, 1,
0.4014472, -0.4825247, 3.35216, 0, 0.08235294, 1, 1,
0.4027891, -1.04083, 3.624282, 0, 0.07450981, 1, 1,
0.4084324, -0.3028271, 2.327978, 0, 0.07058824, 1, 1,
0.4124624, 1.386463, 0.2356628, 0, 0.0627451, 1, 1,
0.4220659, -0.5724217, 1.780742, 0, 0.05882353, 1, 1,
0.4227078, -0.9745528, 2.376295, 0, 0.05098039, 1, 1,
0.423378, -1.014164, 2.612699, 0, 0.04705882, 1, 1,
0.4249919, -2.22544, 3.21125, 0, 0.03921569, 1, 1,
0.4292411, 1.213233, -0.06483485, 0, 0.03529412, 1, 1,
0.4328715, -0.1548533, 1.946432, 0, 0.02745098, 1, 1,
0.4361371, -0.4688987, 2.753288, 0, 0.02352941, 1, 1,
0.4376994, -0.6603585, 2.307187, 0, 0.01568628, 1, 1,
0.4419902, 1.665412, -0.09779735, 0, 0.01176471, 1, 1,
0.4439135, 0.2435752, -0.5969428, 0, 0.003921569, 1, 1,
0.4442901, -0.5668117, 2.75403, 0.003921569, 0, 1, 1,
0.4600041, 0.05035431, 0.8375177, 0.007843138, 0, 1, 1,
0.4609558, 1.267378, -1.422479, 0.01568628, 0, 1, 1,
0.4661958, 1.795445, -0.3065616, 0.01960784, 0, 1, 1,
0.4691634, -1.15926, 3.864743, 0.02745098, 0, 1, 1,
0.4719709, 1.986097, -0.867044, 0.03137255, 0, 1, 1,
0.4834333, -0.1983368, 2.700365, 0.03921569, 0, 1, 1,
0.4857013, 1.01602, -1.235718, 0.04313726, 0, 1, 1,
0.4872238, 0.3965117, 0.4328806, 0.05098039, 0, 1, 1,
0.4884579, 0.7181234, 0.6078851, 0.05490196, 0, 1, 1,
0.4921953, 0.2139971, 2.215833, 0.0627451, 0, 1, 1,
0.4936537, -0.2553613, 3.294008, 0.06666667, 0, 1, 1,
0.4942586, 0.6784775, 0.1571922, 0.07450981, 0, 1, 1,
0.4989667, -0.6025442, 3.039902, 0.07843138, 0, 1, 1,
0.5055668, 0.4889153, 0.8634384, 0.08627451, 0, 1, 1,
0.5106336, 2.513564, 2.388491, 0.09019608, 0, 1, 1,
0.5127144, 0.2321388, 1.171004, 0.09803922, 0, 1, 1,
0.5136515, -0.6245074, 2.777325, 0.1058824, 0, 1, 1,
0.5162081, -0.145994, 1.989897, 0.1098039, 0, 1, 1,
0.516476, -0.1544635, 1.820061, 0.1176471, 0, 1, 1,
0.5166599, -0.3410021, 3.681042, 0.1215686, 0, 1, 1,
0.5201557, -0.4685572, 2.384552, 0.1294118, 0, 1, 1,
0.5209333, -0.9386093, 2.926068, 0.1333333, 0, 1, 1,
0.5249492, -1.618937, 3.204212, 0.1411765, 0, 1, 1,
0.5253074, 1.019135, 1.205725, 0.145098, 0, 1, 1,
0.5261877, -0.7820968, 2.49225, 0.1529412, 0, 1, 1,
0.5266457, -0.4699004, 1.841283, 0.1568628, 0, 1, 1,
0.5273232, -0.4806481, 1.675233, 0.1647059, 0, 1, 1,
0.5285928, -1.150877, 3.375163, 0.1686275, 0, 1, 1,
0.5357562, 0.3650957, 2.808566, 0.1764706, 0, 1, 1,
0.5411734, -0.2013356, 0.8254681, 0.1803922, 0, 1, 1,
0.5436418, 0.8428755, 1.114353, 0.1882353, 0, 1, 1,
0.544655, -0.4166093, 2.409249, 0.1921569, 0, 1, 1,
0.5449806, 0.2355914, 1.155256, 0.2, 0, 1, 1,
0.5451161, -1.811553, 3.646703, 0.2078431, 0, 1, 1,
0.5458162, -1.00726, 2.622534, 0.2117647, 0, 1, 1,
0.5467251, 0.2310974, 0.1290693, 0.2196078, 0, 1, 1,
0.5473989, 1.624779, -1.648939, 0.2235294, 0, 1, 1,
0.5493352, -0.877534, 2.252685, 0.2313726, 0, 1, 1,
0.5556862, 0.9589001, 0.4778031, 0.2352941, 0, 1, 1,
0.5586211, -1.024327, 3.952015, 0.2431373, 0, 1, 1,
0.567043, -0.615362, 3.001271, 0.2470588, 0, 1, 1,
0.5697914, 0.6069536, 0.5939232, 0.254902, 0, 1, 1,
0.5700798, 0.5075189, 1.437577, 0.2588235, 0, 1, 1,
0.5703261, -1.626882, 2.740202, 0.2666667, 0, 1, 1,
0.5744603, -0.9007255, 2.637773, 0.2705882, 0, 1, 1,
0.5788365, -0.8191313, 2.655499, 0.2784314, 0, 1, 1,
0.5792713, 0.4784075, 1.126347, 0.282353, 0, 1, 1,
0.5824661, 0.182621, -0.6675943, 0.2901961, 0, 1, 1,
0.5840948, -1.277889, 4.154014, 0.2941177, 0, 1, 1,
0.5880056, 0.003779468, 2.058954, 0.3019608, 0, 1, 1,
0.5882029, 2.885231, -1.237748, 0.3098039, 0, 1, 1,
0.5922593, 0.1037977, 3.706857, 0.3137255, 0, 1, 1,
0.5943938, -0.0285343, 1.297039, 0.3215686, 0, 1, 1,
0.5951789, -0.6896868, 3.783056, 0.3254902, 0, 1, 1,
0.5963923, -0.4168005, 1.20832, 0.3333333, 0, 1, 1,
0.5967736, -0.2893457, 1.785405, 0.3372549, 0, 1, 1,
0.6007419, -1.051189, 1.593988, 0.345098, 0, 1, 1,
0.6013238, 0.3362726, 1.956235, 0.3490196, 0, 1, 1,
0.6104084, -1.153265, 1.595668, 0.3568628, 0, 1, 1,
0.6104901, 0.8292391, 0.5093777, 0.3607843, 0, 1, 1,
0.6174508, -0.3743044, 2.496756, 0.3686275, 0, 1, 1,
0.6176254, -1.114837, 1.917731, 0.372549, 0, 1, 1,
0.6179424, -1.470145, 1.587286, 0.3803922, 0, 1, 1,
0.6212078, 0.09958766, 1.651155, 0.3843137, 0, 1, 1,
0.6292301, 0.3173339, 0.04280759, 0.3921569, 0, 1, 1,
0.6302577, -0.6725065, 1.750353, 0.3960784, 0, 1, 1,
0.6322913, 0.6781322, -0.06925816, 0.4039216, 0, 1, 1,
0.6368133, -0.03375015, 2.257436, 0.4117647, 0, 1, 1,
0.6451226, -0.1721378, 1.759079, 0.4156863, 0, 1, 1,
0.6489432, -0.6148211, 0.932439, 0.4235294, 0, 1, 1,
0.6562683, -1.445043, 3.61379, 0.427451, 0, 1, 1,
0.6581583, 0.9769765, 1.136561, 0.4352941, 0, 1, 1,
0.6604152, -1.141139, 1.414978, 0.4392157, 0, 1, 1,
0.6614535, 1.679002, 0.5830979, 0.4470588, 0, 1, 1,
0.6617074, 0.4913932, 1.78549, 0.4509804, 0, 1, 1,
0.6723979, -1.022092, 4.665251, 0.4588235, 0, 1, 1,
0.6753974, 1.289095, 1.093306, 0.4627451, 0, 1, 1,
0.6817525, 1.567206, -0.09042098, 0.4705882, 0, 1, 1,
0.6863252, -0.9591944, 1.243745, 0.4745098, 0, 1, 1,
0.6918103, -1.715088, 2.134597, 0.4823529, 0, 1, 1,
0.6939655, 1.149039, 0.4391781, 0.4862745, 0, 1, 1,
0.6980531, -1.818543, 2.784348, 0.4941176, 0, 1, 1,
0.7063727, 0.811904, -0.1406118, 0.5019608, 0, 1, 1,
0.708257, 0.3704436, 0.6684533, 0.5058824, 0, 1, 1,
0.7109435, -0.7161661, 3.472556, 0.5137255, 0, 1, 1,
0.7123646, -2.24095, 2.617634, 0.5176471, 0, 1, 1,
0.7130075, -0.9699296, 1.721119, 0.5254902, 0, 1, 1,
0.7147487, 0.840466, 1.878995, 0.5294118, 0, 1, 1,
0.7168601, 0.365321, 1.748307, 0.5372549, 0, 1, 1,
0.7180851, -0.05389595, 1.281091, 0.5411765, 0, 1, 1,
0.7186347, -0.2983645, 3.229619, 0.5490196, 0, 1, 1,
0.7229148, 0.5071234, 0.4664827, 0.5529412, 0, 1, 1,
0.7243527, -0.3631956, 1.769284, 0.5607843, 0, 1, 1,
0.7288328, -0.5659974, 3.052749, 0.5647059, 0, 1, 1,
0.7364789, -1.115142, 1.205386, 0.572549, 0, 1, 1,
0.7485311, -1.336817, 2.08864, 0.5764706, 0, 1, 1,
0.7485405, -0.1761446, 2.187726, 0.5843138, 0, 1, 1,
0.7500976, -1.513044, 2.383075, 0.5882353, 0, 1, 1,
0.7533123, 1.125339, 0.7422531, 0.5960785, 0, 1, 1,
0.7533544, 0.6341039, 0.4578429, 0.6039216, 0, 1, 1,
0.7544871, 1.415727, -1.800167, 0.6078432, 0, 1, 1,
0.7555819, -0.7694051, 2.142901, 0.6156863, 0, 1, 1,
0.7618504, -0.4550166, 2.367208, 0.6196079, 0, 1, 1,
0.7632536, -0.537907, 0.9535397, 0.627451, 0, 1, 1,
0.7677237, 0.7806984, 0.314331, 0.6313726, 0, 1, 1,
0.7688124, 1.165447, 0.2096208, 0.6392157, 0, 1, 1,
0.7746938, -0.04221255, 2.498207, 0.6431373, 0, 1, 1,
0.7776791, 0.659137, -0.5018909, 0.6509804, 0, 1, 1,
0.7782381, -1.060167, 1.416214, 0.654902, 0, 1, 1,
0.7845088, 0.3361255, 0.8430738, 0.6627451, 0, 1, 1,
0.7851398, -0.7657768, 2.195853, 0.6666667, 0, 1, 1,
0.7857974, -0.3258764, 0.05440763, 0.6745098, 0, 1, 1,
0.7859945, 2.217256, -0.5237417, 0.6784314, 0, 1, 1,
0.7864335, -0.3827098, 1.127317, 0.6862745, 0, 1, 1,
0.7893797, 0.6919656, 0.7687666, 0.6901961, 0, 1, 1,
0.7935355, -1.594799, 4.1839, 0.6980392, 0, 1, 1,
0.7938904, 0.4453391, -0.7674351, 0.7058824, 0, 1, 1,
0.8054509, -0.816186, 2.568587, 0.7098039, 0, 1, 1,
0.8062641, -1.057889, 2.978956, 0.7176471, 0, 1, 1,
0.8082561, -0.04271729, 2.590142, 0.7215686, 0, 1, 1,
0.8100814, -0.3842058, 0.3159636, 0.7294118, 0, 1, 1,
0.8135527, -1.101428, 3.456252, 0.7333333, 0, 1, 1,
0.8155175, 1.303901, 1.048276, 0.7411765, 0, 1, 1,
0.8195713, -0.9887041, 0.6429744, 0.7450981, 0, 1, 1,
0.8229645, -0.8583527, 2.616124, 0.7529412, 0, 1, 1,
0.8262876, -0.0002693729, 1.694814, 0.7568628, 0, 1, 1,
0.8278063, 1.738219, 0.03280196, 0.7647059, 0, 1, 1,
0.8461699, 0.350925, -0.2228424, 0.7686275, 0, 1, 1,
0.8603172, -0.1602401, 0.6092399, 0.7764706, 0, 1, 1,
0.8643373, 0.6052142, -1.111198, 0.7803922, 0, 1, 1,
0.864629, 0.4285693, 2.076107, 0.7882353, 0, 1, 1,
0.8677475, -1.565517, 3.516512, 0.7921569, 0, 1, 1,
0.8679564, -1.414008, 1.321044, 0.8, 0, 1, 1,
0.8694323, -0.1683965, 1.867215, 0.8078431, 0, 1, 1,
0.8729796, -0.2642396, 2.009214, 0.8117647, 0, 1, 1,
0.8776441, -0.7832366, 1.907936, 0.8196079, 0, 1, 1,
0.8834718, 0.1927716, 0.168795, 0.8235294, 0, 1, 1,
0.8841769, 0.2272655, 1.277364, 0.8313726, 0, 1, 1,
0.8881748, -0.5452009, 3.140565, 0.8352941, 0, 1, 1,
0.8893052, -0.3864261, 2.415961, 0.8431373, 0, 1, 1,
0.8944469, -1.312052, 1.36756, 0.8470588, 0, 1, 1,
0.9034443, -0.01470662, 0.4300928, 0.854902, 0, 1, 1,
0.9052145, 2.247846, -0.1423298, 0.8588235, 0, 1, 1,
0.905404, 0.1924275, -0.2828276, 0.8666667, 0, 1, 1,
0.9061916, -1.483157, 2.65465, 0.8705882, 0, 1, 1,
0.9087599, -0.4708795, 3.702053, 0.8784314, 0, 1, 1,
0.9101052, 0.2535495, 0.2395297, 0.8823529, 0, 1, 1,
0.917722, 0.5721422, 0.6147414, 0.8901961, 0, 1, 1,
0.9191013, -0.238341, 1.625498, 0.8941177, 0, 1, 1,
0.9248661, -0.1710076, 1.396491, 0.9019608, 0, 1, 1,
0.9251563, -0.8775216, 2.654546, 0.9098039, 0, 1, 1,
0.9267102, 0.2588024, 1.131752, 0.9137255, 0, 1, 1,
0.9279315, 0.08655181, 1.273369, 0.9215686, 0, 1, 1,
0.9298368, -0.5557731, 1.838163, 0.9254902, 0, 1, 1,
0.9299974, -2.238849, 3.020975, 0.9333333, 0, 1, 1,
0.9404777, -0.4820832, 1.551198, 0.9372549, 0, 1, 1,
0.9407054, 1.392155, 1.130054, 0.945098, 0, 1, 1,
0.9457802, 0.9805356, 0.6908752, 0.9490196, 0, 1, 1,
0.9530697, -1.729249, 2.213465, 0.9568627, 0, 1, 1,
0.9536657, 1.091864, 1.634309, 0.9607843, 0, 1, 1,
0.9635718, -0.05229888, 1.00749, 0.9686275, 0, 1, 1,
0.9648458, -0.5041331, 1.292148, 0.972549, 0, 1, 1,
0.967394, 0.5380204, 2.477354, 0.9803922, 0, 1, 1,
0.9692905, -0.509904, 1.244701, 0.9843137, 0, 1, 1,
0.9723832, -0.7892173, 1.144862, 0.9921569, 0, 1, 1,
0.9798085, -1.598705, 3.355479, 0.9960784, 0, 1, 1,
0.985487, -0.5721241, 1.851185, 1, 0, 0.9960784, 1,
0.9860849, 0.8453897, 1.184305, 1, 0, 0.9882353, 1,
0.9954067, 1.10679, 1.546475, 1, 0, 0.9843137, 1,
1.005955, -0.1722756, 0.5478452, 1, 0, 0.9764706, 1,
1.01272, 0.8861177, 0.8127997, 1, 0, 0.972549, 1,
1.018867, 0.04946268, 1.614596, 1, 0, 0.9647059, 1,
1.036907, -0.2833413, 2.187651, 1, 0, 0.9607843, 1,
1.041927, -1.125078, 2.039631, 1, 0, 0.9529412, 1,
1.062817, 0.5243214, 1.030699, 1, 0, 0.9490196, 1,
1.063198, 0.4263029, 2.05051, 1, 0, 0.9411765, 1,
1.063902, -0.4579981, 2.235456, 1, 0, 0.9372549, 1,
1.071792, -0.07206688, 2.18166, 1, 0, 0.9294118, 1,
1.073275, -0.5339862, 2.118252, 1, 0, 0.9254902, 1,
1.080846, -1.876272, 3.099809, 1, 0, 0.9176471, 1,
1.083854, 0.5440818, 2.040542, 1, 0, 0.9137255, 1,
1.086176, 0.4706457, -0.2396413, 1, 0, 0.9058824, 1,
1.08824, 0.9626491, 2.840444, 1, 0, 0.9019608, 1,
1.090687, 3.143346, 1.213795, 1, 0, 0.8941177, 1,
1.098659, 0.5006506, -0.2383209, 1, 0, 0.8862745, 1,
1.098766, 0.2089854, 0.7870168, 1, 0, 0.8823529, 1,
1.101438, -0.7503704, 2.071037, 1, 0, 0.8745098, 1,
1.102412, -0.2582485, 2.208102, 1, 0, 0.8705882, 1,
1.102857, 1.45669, 0.3928168, 1, 0, 0.8627451, 1,
1.104217, 0.02001945, 1.494253, 1, 0, 0.8588235, 1,
1.107531, -0.3089858, 3.610375, 1, 0, 0.8509804, 1,
1.112181, 1.022197, 1.872939, 1, 0, 0.8470588, 1,
1.120234, -1.137734, 2.095415, 1, 0, 0.8392157, 1,
1.139817, -1.43789, 2.404973, 1, 0, 0.8352941, 1,
1.139857, -0.08811955, 1.829413, 1, 0, 0.827451, 1,
1.140252, 1.337369, -0.05119984, 1, 0, 0.8235294, 1,
1.149, 0.1180407, 0.2878824, 1, 0, 0.8156863, 1,
1.149527, 0.7518437, 1.767348, 1, 0, 0.8117647, 1,
1.152082, -0.3864437, 2.434326, 1, 0, 0.8039216, 1,
1.157249, 1.053247, -0.9263579, 1, 0, 0.7960784, 1,
1.159014, 1.458219, 1.358768, 1, 0, 0.7921569, 1,
1.162041, -0.9183982, 3.727636, 1, 0, 0.7843137, 1,
1.183236, -0.5029376, 1.979246, 1, 0, 0.7803922, 1,
1.186887, 0.648863, 2.877545, 1, 0, 0.772549, 1,
1.192881, 1.259532, -0.02935338, 1, 0, 0.7686275, 1,
1.195672, -0.01418775, 2.190242, 1, 0, 0.7607843, 1,
1.196354, 0.4199021, -0.4179947, 1, 0, 0.7568628, 1,
1.199544, 1.842685, 1.095509, 1, 0, 0.7490196, 1,
1.21118, 2.938241, -0.172453, 1, 0, 0.7450981, 1,
1.219635, -0.6175995, 1.46511, 1, 0, 0.7372549, 1,
1.242863, -0.7250657, 1.717043, 1, 0, 0.7333333, 1,
1.249573, -0.9941924, 0.5013976, 1, 0, 0.7254902, 1,
1.260443, -0.03441655, 2.032111, 1, 0, 0.7215686, 1,
1.264696, -0.5422993, 2.118846, 1, 0, 0.7137255, 1,
1.268831, -0.1873814, 2.264431, 1, 0, 0.7098039, 1,
1.27222, -1.202979, 2.975203, 1, 0, 0.7019608, 1,
1.276253, 0.228095, 1.301063, 1, 0, 0.6941177, 1,
1.290371, -0.1903349, -0.02763112, 1, 0, 0.6901961, 1,
1.298982, 0.9785501, -0.08251843, 1, 0, 0.682353, 1,
1.300396, 1.245535, -0.2743627, 1, 0, 0.6784314, 1,
1.305626, -1.057211, 1.895458, 1, 0, 0.6705883, 1,
1.305828, 0.8279682, 0.8423871, 1, 0, 0.6666667, 1,
1.313504, -0.5622064, 2.686795, 1, 0, 0.6588235, 1,
1.328418, -1.17714, 1.637439, 1, 0, 0.654902, 1,
1.356949, 1.632484, -0.3470701, 1, 0, 0.6470588, 1,
1.357074, -0.5648837, 3.633348, 1, 0, 0.6431373, 1,
1.361987, 1.912717, 1.760877, 1, 0, 0.6352941, 1,
1.364504, 0.1133248, 0.4870605, 1, 0, 0.6313726, 1,
1.365475, 1.430871, 0.5678099, 1, 0, 0.6235294, 1,
1.368504, -1.409614, 1.611963, 1, 0, 0.6196079, 1,
1.369049, 1.489178, 1.767115, 1, 0, 0.6117647, 1,
1.371183, -0.02878568, 1.160651, 1, 0, 0.6078432, 1,
1.376653, -0.4119969, 2.206396, 1, 0, 0.6, 1,
1.380743, 0.1388671, 3.802116, 1, 0, 0.5921569, 1,
1.383031, -0.1886956, 1.482729, 1, 0, 0.5882353, 1,
1.383682, -0.9559528, 1.941684, 1, 0, 0.5803922, 1,
1.38513, -2.514309, 0.9249464, 1, 0, 0.5764706, 1,
1.387596, -0.4414385, 2.124115, 1, 0, 0.5686275, 1,
1.392141, -0.3067633, 1.198458, 1, 0, 0.5647059, 1,
1.392562, 0.03572444, 2.371215, 1, 0, 0.5568628, 1,
1.397295, 0.1471881, 2.057762, 1, 0, 0.5529412, 1,
1.397539, -0.4484682, 1.981588, 1, 0, 0.5450981, 1,
1.403815, 0.1837187, 2.943517, 1, 0, 0.5411765, 1,
1.405712, -0.118595, 2.532271, 1, 0, 0.5333334, 1,
1.405751, 1.579797, 0.06313982, 1, 0, 0.5294118, 1,
1.421422, 0.4683633, 0.001560306, 1, 0, 0.5215687, 1,
1.441561, 0.4824195, 0.7580873, 1, 0, 0.5176471, 1,
1.447958, 1.11688, -0.9274664, 1, 0, 0.509804, 1,
1.451959, -0.8483094, 0.7229339, 1, 0, 0.5058824, 1,
1.461009, -0.06665249, 0.3526691, 1, 0, 0.4980392, 1,
1.463709, 0.07189811, 0.7565121, 1, 0, 0.4901961, 1,
1.475239, 0.1239852, 2.195638, 1, 0, 0.4862745, 1,
1.48526, 0.4049141, 0.8567839, 1, 0, 0.4784314, 1,
1.48561, -0.1209371, 1.443047, 1, 0, 0.4745098, 1,
1.492034, -0.7024845, 2.622327, 1, 0, 0.4666667, 1,
1.515136, 1.058907, 0.4731557, 1, 0, 0.4627451, 1,
1.515354, -0.2623997, 2.681367, 1, 0, 0.454902, 1,
1.535543, 0.4302073, 0.07723296, 1, 0, 0.4509804, 1,
1.538863, 1.342797, 0.3722844, 1, 0, 0.4431373, 1,
1.554198, -0.8108388, 0.9924118, 1, 0, 0.4392157, 1,
1.558405, 1.228749, 0.5125867, 1, 0, 0.4313726, 1,
1.567525, -0.4488515, 1.50482, 1, 0, 0.427451, 1,
1.567698, 0.9961383, 1.755266, 1, 0, 0.4196078, 1,
1.569368, 1.129176, 0.6697157, 1, 0, 0.4156863, 1,
1.569888, 0.6704783, 1.986929, 1, 0, 0.4078431, 1,
1.570153, 1.145508, 0.6455038, 1, 0, 0.4039216, 1,
1.572637, -1.296142, 2.947881, 1, 0, 0.3960784, 1,
1.578329, 1.182659, 2.284462, 1, 0, 0.3882353, 1,
1.583306, -0.1935133, 2.817376, 1, 0, 0.3843137, 1,
1.585338, -0.5033809, 3.952332, 1, 0, 0.3764706, 1,
1.585701, -1.460255, 2.704466, 1, 0, 0.372549, 1,
1.589235, -0.4079617, 0.9321046, 1, 0, 0.3647059, 1,
1.593516, -1.015923, 4.39751, 1, 0, 0.3607843, 1,
1.602502, -0.4874804, 3.19579, 1, 0, 0.3529412, 1,
1.616323, -0.5397552, 0.7904633, 1, 0, 0.3490196, 1,
1.620988, -0.01883912, 2.58514, 1, 0, 0.3411765, 1,
1.624423, -0.8252345, 0.3497949, 1, 0, 0.3372549, 1,
1.628579, 0.007541541, 1.396906, 1, 0, 0.3294118, 1,
1.657183, -0.6651888, 0.9778037, 1, 0, 0.3254902, 1,
1.657426, -0.6376649, 2.248867, 1, 0, 0.3176471, 1,
1.659545, -0.4946968, 3.364523, 1, 0, 0.3137255, 1,
1.670972, -0.5573823, 1.004493, 1, 0, 0.3058824, 1,
1.679398, 0.988757, 1.02807, 1, 0, 0.2980392, 1,
1.702503, 0.1676595, 1.723233, 1, 0, 0.2941177, 1,
1.714873, -0.6502093, 0.788891, 1, 0, 0.2862745, 1,
1.72062, -1.219147, 4.659459, 1, 0, 0.282353, 1,
1.784788, 1.444175, 2.656096, 1, 0, 0.2745098, 1,
1.805667, -1.566081, 1.728223, 1, 0, 0.2705882, 1,
1.815707, 0.1906605, 1.309955, 1, 0, 0.2627451, 1,
1.820333, 0.3741693, 2.064305, 1, 0, 0.2588235, 1,
1.824385, 1.663524, 0.7881684, 1, 0, 0.2509804, 1,
1.827983, -2.118012, 4.19176, 1, 0, 0.2470588, 1,
1.832833, 2.265665, 1.499614, 1, 0, 0.2392157, 1,
1.847964, 0.7445332, 0.7017727, 1, 0, 0.2352941, 1,
1.882002, -1.440126, 1.767046, 1, 0, 0.227451, 1,
1.90441, -0.8648617, 2.183497, 1, 0, 0.2235294, 1,
1.917441, -0.6551279, 2.307325, 1, 0, 0.2156863, 1,
1.927867, -1.553845, 1.911892, 1, 0, 0.2117647, 1,
1.966347, 0.7779275, 0.9137431, 1, 0, 0.2039216, 1,
2.017879, -0.9301689, 1.233262, 1, 0, 0.1960784, 1,
2.045673, -1.946212, 3.423541, 1, 0, 0.1921569, 1,
2.117105, -1.319616, 0.8955028, 1, 0, 0.1843137, 1,
2.129885, 0.6169699, 0.8484997, 1, 0, 0.1803922, 1,
2.13736, -0.9129171, 4.021774, 1, 0, 0.172549, 1,
2.141554, -0.6513882, 3.21593, 1, 0, 0.1686275, 1,
2.166959, -1.440931, 4.682225, 1, 0, 0.1607843, 1,
2.167595, 0.6090825, 1.179628, 1, 0, 0.1568628, 1,
2.180553, -0.04864293, 1.993746, 1, 0, 0.1490196, 1,
2.196703, -0.9601183, 2.156353, 1, 0, 0.145098, 1,
2.202489, -0.1773272, 1.552799, 1, 0, 0.1372549, 1,
2.210325, 0.9766144, 1.008394, 1, 0, 0.1333333, 1,
2.211268, -0.388601, 2.82281, 1, 0, 0.1254902, 1,
2.216089, -0.5834411, 2.803533, 1, 0, 0.1215686, 1,
2.220588, 0.02535421, 0.6138718, 1, 0, 0.1137255, 1,
2.226748, -0.1893223, 2.78363, 1, 0, 0.1098039, 1,
2.290737, 1.034542, 0.9841409, 1, 0, 0.1019608, 1,
2.359628, -0.9024127, 0.3540407, 1, 0, 0.09411765, 1,
2.433182, -1.346823, 1.871408, 1, 0, 0.09019608, 1,
2.46503, 0.2749119, 1.930525, 1, 0, 0.08235294, 1,
2.512461, 2.137368, 0.309673, 1, 0, 0.07843138, 1,
2.538751, 0.8057387, 0.6429838, 1, 0, 0.07058824, 1,
2.617171, 1.827057, 0.5529644, 1, 0, 0.06666667, 1,
2.689275, 0.7060229, 2.516229, 1, 0, 0.05882353, 1,
2.693274, 1.21002, -0.2071169, 1, 0, 0.05490196, 1,
2.7236, 0.3329884, 1.329283, 1, 0, 0.04705882, 1,
2.732106, 0.635307, 2.458694, 1, 0, 0.04313726, 1,
2.766529, 0.8423836, 1.942136, 1, 0, 0.03529412, 1,
2.881001, -0.6686214, 0.7085314, 1, 0, 0.03137255, 1,
2.937689, -0.8410413, 2.227527, 1, 0, 0.02352941, 1,
2.944602, -1.121008, 3.104435, 1, 0, 0.01960784, 1,
3.212239, -0.4861658, 2.236135, 1, 0, 0.01176471, 1,
3.216418, -1.342839, 0.948534, 1, 0, 0.007843138, 1
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
-0.1361028, -4.152974, -7.958639, 0, -0.5, 0.5, 0.5,
-0.1361028, -4.152974, -7.958639, 1, -0.5, 0.5, 0.5,
-0.1361028, -4.152974, -7.958639, 1, 1.5, 0.5, 0.5,
-0.1361028, -4.152974, -7.958639, 0, 1.5, 0.5, 0.5
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
-4.625128, 0.04929006, -7.958639, 0, -0.5, 0.5, 0.5,
-4.625128, 0.04929006, -7.958639, 1, -0.5, 0.5, 0.5,
-4.625128, 0.04929006, -7.958639, 1, 1.5, 0.5, 0.5,
-4.625128, 0.04929006, -7.958639, 0, 1.5, 0.5, 0.5
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
-4.625128, -4.152974, -0.4144197, 0, -0.5, 0.5, 0.5,
-4.625128, -4.152974, -0.4144197, 1, -0.5, 0.5, 0.5,
-4.625128, -4.152974, -0.4144197, 1, 1.5, 0.5, 0.5,
-4.625128, -4.152974, -0.4144197, 0, 1.5, 0.5, 0.5
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
-3, -3.183221, -6.217665,
3, -3.183221, -6.217665,
-3, -3.183221, -6.217665,
-3, -3.344846, -6.507827,
-2, -3.183221, -6.217665,
-2, -3.344846, -6.507827,
-1, -3.183221, -6.217665,
-1, -3.344846, -6.507827,
0, -3.183221, -6.217665,
0, -3.344846, -6.507827,
1, -3.183221, -6.217665,
1, -3.344846, -6.507827,
2, -3.183221, -6.217665,
2, -3.344846, -6.507827,
3, -3.183221, -6.217665,
3, -3.344846, -6.507827
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
-3, -3.668097, -7.088151, 0, -0.5, 0.5, 0.5,
-3, -3.668097, -7.088151, 1, -0.5, 0.5, 0.5,
-3, -3.668097, -7.088151, 1, 1.5, 0.5, 0.5,
-3, -3.668097, -7.088151, 0, 1.5, 0.5, 0.5,
-2, -3.668097, -7.088151, 0, -0.5, 0.5, 0.5,
-2, -3.668097, -7.088151, 1, -0.5, 0.5, 0.5,
-2, -3.668097, -7.088151, 1, 1.5, 0.5, 0.5,
-2, -3.668097, -7.088151, 0, 1.5, 0.5, 0.5,
-1, -3.668097, -7.088151, 0, -0.5, 0.5, 0.5,
-1, -3.668097, -7.088151, 1, -0.5, 0.5, 0.5,
-1, -3.668097, -7.088151, 1, 1.5, 0.5, 0.5,
-1, -3.668097, -7.088151, 0, 1.5, 0.5, 0.5,
0, -3.668097, -7.088151, 0, -0.5, 0.5, 0.5,
0, -3.668097, -7.088151, 1, -0.5, 0.5, 0.5,
0, -3.668097, -7.088151, 1, 1.5, 0.5, 0.5,
0, -3.668097, -7.088151, 0, 1.5, 0.5, 0.5,
1, -3.668097, -7.088151, 0, -0.5, 0.5, 0.5,
1, -3.668097, -7.088151, 1, -0.5, 0.5, 0.5,
1, -3.668097, -7.088151, 1, 1.5, 0.5, 0.5,
1, -3.668097, -7.088151, 0, 1.5, 0.5, 0.5,
2, -3.668097, -7.088151, 0, -0.5, 0.5, 0.5,
2, -3.668097, -7.088151, 1, -0.5, 0.5, 0.5,
2, -3.668097, -7.088151, 1, 1.5, 0.5, 0.5,
2, -3.668097, -7.088151, 0, 1.5, 0.5, 0.5,
3, -3.668097, -7.088151, 0, -0.5, 0.5, 0.5,
3, -3.668097, -7.088151, 1, -0.5, 0.5, 0.5,
3, -3.668097, -7.088151, 1, 1.5, 0.5, 0.5,
3, -3.668097, -7.088151, 0, 1.5, 0.5, 0.5
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
-3.589199, -3, -6.217665,
-3.589199, 3, -6.217665,
-3.589199, -3, -6.217665,
-3.761854, -3, -6.507827,
-3.589199, -2, -6.217665,
-3.761854, -2, -6.507827,
-3.589199, -1, -6.217665,
-3.761854, -1, -6.507827,
-3.589199, 0, -6.217665,
-3.761854, 0, -6.507827,
-3.589199, 1, -6.217665,
-3.761854, 1, -6.507827,
-3.589199, 2, -6.217665,
-3.761854, 2, -6.507827,
-3.589199, 3, -6.217665,
-3.761854, 3, -6.507827
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
-4.107163, -3, -7.088151, 0, -0.5, 0.5, 0.5,
-4.107163, -3, -7.088151, 1, -0.5, 0.5, 0.5,
-4.107163, -3, -7.088151, 1, 1.5, 0.5, 0.5,
-4.107163, -3, -7.088151, 0, 1.5, 0.5, 0.5,
-4.107163, -2, -7.088151, 0, -0.5, 0.5, 0.5,
-4.107163, -2, -7.088151, 1, -0.5, 0.5, 0.5,
-4.107163, -2, -7.088151, 1, 1.5, 0.5, 0.5,
-4.107163, -2, -7.088151, 0, 1.5, 0.5, 0.5,
-4.107163, -1, -7.088151, 0, -0.5, 0.5, 0.5,
-4.107163, -1, -7.088151, 1, -0.5, 0.5, 0.5,
-4.107163, -1, -7.088151, 1, 1.5, 0.5, 0.5,
-4.107163, -1, -7.088151, 0, 1.5, 0.5, 0.5,
-4.107163, 0, -7.088151, 0, -0.5, 0.5, 0.5,
-4.107163, 0, -7.088151, 1, -0.5, 0.5, 0.5,
-4.107163, 0, -7.088151, 1, 1.5, 0.5, 0.5,
-4.107163, 0, -7.088151, 0, 1.5, 0.5, 0.5,
-4.107163, 1, -7.088151, 0, -0.5, 0.5, 0.5,
-4.107163, 1, -7.088151, 1, -0.5, 0.5, 0.5,
-4.107163, 1, -7.088151, 1, 1.5, 0.5, 0.5,
-4.107163, 1, -7.088151, 0, 1.5, 0.5, 0.5,
-4.107163, 2, -7.088151, 0, -0.5, 0.5, 0.5,
-4.107163, 2, -7.088151, 1, -0.5, 0.5, 0.5,
-4.107163, 2, -7.088151, 1, 1.5, 0.5, 0.5,
-4.107163, 2, -7.088151, 0, 1.5, 0.5, 0.5,
-4.107163, 3, -7.088151, 0, -0.5, 0.5, 0.5,
-4.107163, 3, -7.088151, 1, -0.5, 0.5, 0.5,
-4.107163, 3, -7.088151, 1, 1.5, 0.5, 0.5,
-4.107163, 3, -7.088151, 0, 1.5, 0.5, 0.5
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
-3.589199, -3.183221, -6,
-3.589199, -3.183221, 4,
-3.589199, -3.183221, -6,
-3.761854, -3.344846, -6,
-3.589199, -3.183221, -4,
-3.761854, -3.344846, -4,
-3.589199, -3.183221, -2,
-3.761854, -3.344846, -2,
-3.589199, -3.183221, 0,
-3.761854, -3.344846, 0,
-3.589199, -3.183221, 2,
-3.761854, -3.344846, 2,
-3.589199, -3.183221, 4,
-3.761854, -3.344846, 4
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
-4.107163, -3.668097, -6, 0, -0.5, 0.5, 0.5,
-4.107163, -3.668097, -6, 1, -0.5, 0.5, 0.5,
-4.107163, -3.668097, -6, 1, 1.5, 0.5, 0.5,
-4.107163, -3.668097, -6, 0, 1.5, 0.5, 0.5,
-4.107163, -3.668097, -4, 0, -0.5, 0.5, 0.5,
-4.107163, -3.668097, -4, 1, -0.5, 0.5, 0.5,
-4.107163, -3.668097, -4, 1, 1.5, 0.5, 0.5,
-4.107163, -3.668097, -4, 0, 1.5, 0.5, 0.5,
-4.107163, -3.668097, -2, 0, -0.5, 0.5, 0.5,
-4.107163, -3.668097, -2, 1, -0.5, 0.5, 0.5,
-4.107163, -3.668097, -2, 1, 1.5, 0.5, 0.5,
-4.107163, -3.668097, -2, 0, 1.5, 0.5, 0.5,
-4.107163, -3.668097, 0, 0, -0.5, 0.5, 0.5,
-4.107163, -3.668097, 0, 1, -0.5, 0.5, 0.5,
-4.107163, -3.668097, 0, 1, 1.5, 0.5, 0.5,
-4.107163, -3.668097, 0, 0, 1.5, 0.5, 0.5,
-4.107163, -3.668097, 2, 0, -0.5, 0.5, 0.5,
-4.107163, -3.668097, 2, 1, -0.5, 0.5, 0.5,
-4.107163, -3.668097, 2, 1, 1.5, 0.5, 0.5,
-4.107163, -3.668097, 2, 0, 1.5, 0.5, 0.5,
-4.107163, -3.668097, 4, 0, -0.5, 0.5, 0.5,
-4.107163, -3.668097, 4, 1, -0.5, 0.5, 0.5,
-4.107163, -3.668097, 4, 1, 1.5, 0.5, 0.5,
-4.107163, -3.668097, 4, 0, 1.5, 0.5, 0.5
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
-3.589199, -3.183221, -6.217665,
-3.589199, 3.281801, -6.217665,
-3.589199, -3.183221, 5.388825,
-3.589199, 3.281801, 5.388825,
-3.589199, -3.183221, -6.217665,
-3.589199, -3.183221, 5.388825,
-3.589199, 3.281801, -6.217665,
-3.589199, 3.281801, 5.388825,
-3.589199, -3.183221, -6.217665,
3.316993, -3.183221, -6.217665,
-3.589199, -3.183221, 5.388825,
3.316993, -3.183221, 5.388825,
-3.589199, 3.281801, -6.217665,
3.316993, 3.281801, -6.217665,
-3.589199, 3.281801, 5.388825,
3.316993, 3.281801, 5.388825,
3.316993, -3.183221, -6.217665,
3.316993, 3.281801, -6.217665,
3.316993, -3.183221, 5.388825,
3.316993, 3.281801, 5.388825,
3.316993, -3.183221, -6.217665,
3.316993, -3.183221, 5.388825,
3.316993, 3.281801, -6.217665,
3.316993, 3.281801, 5.388825
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
var radius = 7.995503;
var distance = 35.5729;
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
mvMatrix.translate( 0.1361028, -0.04929006, 0.4144197 );
mvMatrix.scale( 1.25176, 1.33718, 0.7448328 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.5729);
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
Dichlorprop<-read.table("Dichlorprop.xyz", skip=1)
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
-3.488623, 1.388999, -2.31124, 0, 0, 1, 1, 1,
-3.258506, -0.2399252, -0.3670745, 1, 0, 0, 1, 1,
-2.804854, 0.5368471, -1.894486, 1, 0, 0, 1, 1,
-2.696548, -1.359625, -1.789578, 1, 0, 0, 1, 1,
-2.574625, 2.590235, 0.00212987, 1, 0, 0, 1, 1,
-2.565566, 0.6724615, -2.915351, 1, 0, 0, 1, 1,
-2.458289, 3.18765, 0.6813411, 0, 0, 0, 1, 1,
-2.443495, -1.136134, -2.165479, 0, 0, 0, 1, 1,
-2.409179, 0.01153849, 0.2481839, 0, 0, 0, 1, 1,
-2.378176, 0.6406658, -3.528052, 0, 0, 0, 1, 1,
-2.372759, 0.009582766, -2.283459, 0, 0, 0, 1, 1,
-2.298297, -0.6356739, -2.067933, 0, 0, 0, 1, 1,
-2.212316, 1.203285, -0.4391481, 0, 0, 0, 1, 1,
-2.19886, 1.264894, -1.137888, 1, 1, 1, 1, 1,
-2.15977, -1.224072, -3.024727, 1, 1, 1, 1, 1,
-2.142774, -0.32799, -1.754695, 1, 1, 1, 1, 1,
-2.134952, 1.156538, -1.56615, 1, 1, 1, 1, 1,
-2.11416, 1.521792, 0.9933207, 1, 1, 1, 1, 1,
-2.100019, -0.7789884, -0.02995487, 1, 1, 1, 1, 1,
-2.099188, 1.011904, -2.061148, 1, 1, 1, 1, 1,
-2.089062, 0.7919663, -0.4917683, 1, 1, 1, 1, 1,
-2.058853, 0.196503, -2.214138, 1, 1, 1, 1, 1,
-2.051707, 1.300114, 0.5325346, 1, 1, 1, 1, 1,
-2.04262, 1.021116, -0.3422554, 1, 1, 1, 1, 1,
-2.030711, 0.1332977, -1.37778, 1, 1, 1, 1, 1,
-2.029735, 0.9662912, -0.1807955, 1, 1, 1, 1, 1,
-1.979944, -0.7561842, -1.975517, 1, 1, 1, 1, 1,
-1.955905, -0.6660215, -1.337536, 1, 1, 1, 1, 1,
-1.933697, -0.1787198, -2.928603, 0, 0, 1, 1, 1,
-1.914463, 1.186362, -1.971758, 1, 0, 0, 1, 1,
-1.911938, -0.2638632, -1.113841, 1, 0, 0, 1, 1,
-1.897741, -1.406436, -2.351563, 1, 0, 0, 1, 1,
-1.865928, -0.7009751, -1.835641, 1, 0, 0, 1, 1,
-1.856323, -0.7762584, -2.70272, 1, 0, 0, 1, 1,
-1.840807, -0.2065654, -0.3721606, 0, 0, 0, 1, 1,
-1.840016, -0.8685365, -1.377207, 0, 0, 0, 1, 1,
-1.835376, -1.480453, -3.352306, 0, 0, 0, 1, 1,
-1.828517, -0.8932629, -2.005086, 0, 0, 0, 1, 1,
-1.827787, -0.5594237, -1.08389, 0, 0, 0, 1, 1,
-1.819617, -0.9694903, -1.451251, 0, 0, 0, 1, 1,
-1.802451, 0.1792126, -1.537683, 0, 0, 0, 1, 1,
-1.782712, 2.947331, 0.5613946, 1, 1, 1, 1, 1,
-1.776886, -0.989776, -2.592851, 1, 1, 1, 1, 1,
-1.774125, -0.3391069, -0.9400939, 1, 1, 1, 1, 1,
-1.761747, -0.6838476, -3.434842, 1, 1, 1, 1, 1,
-1.746883, 0.5363894, -1.34661, 1, 1, 1, 1, 1,
-1.744172, 0.3729629, -2.672548, 1, 1, 1, 1, 1,
-1.736598, -1.33248, -2.403306, 1, 1, 1, 1, 1,
-1.705567, 0.9152287, -0.3535732, 1, 1, 1, 1, 1,
-1.699866, 0.0680926, -0.9433358, 1, 1, 1, 1, 1,
-1.698866, -0.5852945, -1.753484, 1, 1, 1, 1, 1,
-1.69794, -0.05111396, -1.389209, 1, 1, 1, 1, 1,
-1.695749, 1.214289, -0.6637947, 1, 1, 1, 1, 1,
-1.695011, 0.2944358, -1.28572, 1, 1, 1, 1, 1,
-1.687753, -0.2858728, -2.362302, 1, 1, 1, 1, 1,
-1.686689, 0.2190488, 0.5244241, 1, 1, 1, 1, 1,
-1.660153, -0.1014307, -0.849663, 0, 0, 1, 1, 1,
-1.64795, 0.7360225, -2.799542, 1, 0, 0, 1, 1,
-1.628877, 0.6209425, -2.190572, 1, 0, 0, 1, 1,
-1.626263, -0.2999041, -0.5206148, 1, 0, 0, 1, 1,
-1.616454, 0.09168027, -0.05830023, 1, 0, 0, 1, 1,
-1.616167, 0.07292754, -1.512599, 1, 0, 0, 1, 1,
-1.602445, -0.1035328, -2.307806, 0, 0, 0, 1, 1,
-1.602436, -0.6036307, -2.94516, 0, 0, 0, 1, 1,
-1.582075, 1.150216, -0.6116278, 0, 0, 0, 1, 1,
-1.580781, 0.5652628, 0.03801204, 0, 0, 0, 1, 1,
-1.575048, -0.07393195, -1.259127, 0, 0, 0, 1, 1,
-1.57368, 2.314472, -0.2723232, 0, 0, 0, 1, 1,
-1.570731, -0.2263576, -3.262115, 0, 0, 0, 1, 1,
-1.531432, -0.4626259, -2.447989, 1, 1, 1, 1, 1,
-1.531081, 0.1444758, -1.682522, 1, 1, 1, 1, 1,
-1.52399, 1.300178, -0.5961756, 1, 1, 1, 1, 1,
-1.520855, -1.184622, -2.85338, 1, 1, 1, 1, 1,
-1.517437, -0.5387762, -1.701543, 1, 1, 1, 1, 1,
-1.507355, 0.3042145, -2.425849, 1, 1, 1, 1, 1,
-1.49215, 1.672573, 0.4167319, 1, 1, 1, 1, 1,
-1.488281, -0.8417159, -3.379932, 1, 1, 1, 1, 1,
-1.483187, -2.902577, -5.569253, 1, 1, 1, 1, 1,
-1.482004, -1.882435, -2.856049, 1, 1, 1, 1, 1,
-1.478799, -1.881651, -1.02932, 1, 1, 1, 1, 1,
-1.47327, -1.436739, -2.014173, 1, 1, 1, 1, 1,
-1.470972, 0.2554833, -2.453988, 1, 1, 1, 1, 1,
-1.459491, 0.5046701, -2.254035, 1, 1, 1, 1, 1,
-1.452463, -0.6070085, -2.47822, 1, 1, 1, 1, 1,
-1.442051, -0.4595563, -1.529368, 0, 0, 1, 1, 1,
-1.431182, -1.063097, -2.657172, 1, 0, 0, 1, 1,
-1.427923, -0.6624212, -3.613742, 1, 0, 0, 1, 1,
-1.424448, 0.5586218, -0.01366289, 1, 0, 0, 1, 1,
-1.418465, 0.6220495, -1.174675, 1, 0, 0, 1, 1,
-1.409488, 0.3188438, -1.006528, 1, 0, 0, 1, 1,
-1.408022, 0.2031463, -1.408645, 0, 0, 0, 1, 1,
-1.404136, 0.9298604, -2.441538, 0, 0, 0, 1, 1,
-1.392529, 0.4078864, -0.8525871, 0, 0, 0, 1, 1,
-1.376622, -1.017959, -1.549547, 0, 0, 0, 1, 1,
-1.364678, 0.3641101, 0.569383, 0, 0, 0, 1, 1,
-1.359502, 0.3362793, -1.511576, 0, 0, 0, 1, 1,
-1.355681, -0.08592395, -2.488928, 0, 0, 0, 1, 1,
-1.352626, 1.558158, 0.284512, 1, 1, 1, 1, 1,
-1.342616, -1.118409, -1.730313, 1, 1, 1, 1, 1,
-1.340367, 0.5779384, 0.4578654, 1, 1, 1, 1, 1,
-1.339145, -0.02225665, -1.41948, 1, 1, 1, 1, 1,
-1.33213, 1.019791, 0.2570754, 1, 1, 1, 1, 1,
-1.32673, -0.3586266, -3.110428, 1, 1, 1, 1, 1,
-1.320993, 1.901978, 0.3756609, 1, 1, 1, 1, 1,
-1.312922, 0.05704878, -0.8643616, 1, 1, 1, 1, 1,
-1.30151, -1.880924, -2.627252, 1, 1, 1, 1, 1,
-1.300084, 0.3181586, -1.617936, 1, 1, 1, 1, 1,
-1.293529, 1.254611, -0.7977438, 1, 1, 1, 1, 1,
-1.288597, -0.4809975, -2.262591, 1, 1, 1, 1, 1,
-1.281651, 0.6304361, -2.559883, 1, 1, 1, 1, 1,
-1.279134, -1.413996, -2.064092, 1, 1, 1, 1, 1,
-1.270845, -0.4733405, -0.7079993, 1, 1, 1, 1, 1,
-1.264023, -1.580241, -3.765862, 0, 0, 1, 1, 1,
-1.25235, -0.05541855, -1.251998, 1, 0, 0, 1, 1,
-1.24152, 0.06820364, -2.763552, 1, 0, 0, 1, 1,
-1.2394, -0.856385, -1.989298, 1, 0, 0, 1, 1,
-1.234878, -0.04958033, -1.865765, 1, 0, 0, 1, 1,
-1.233824, -1.38979, -1.350047, 1, 0, 0, 1, 1,
-1.231102, 1.007082, -0.8153717, 0, 0, 0, 1, 1,
-1.22916, 0.4848631, -2.534673, 0, 0, 0, 1, 1,
-1.228778, -1.30746, -3.02032, 0, 0, 0, 1, 1,
-1.22414, 1.102302, -2.313054, 0, 0, 0, 1, 1,
-1.222864, 0.524685, -1.98084, 0, 0, 0, 1, 1,
-1.222306, -2.43825, -3.205244, 0, 0, 0, 1, 1,
-1.221452, -0.8740022, -1.575198, 0, 0, 0, 1, 1,
-1.22016, -0.03302868, -0.5778821, 1, 1, 1, 1, 1,
-1.215371, -0.7420197, -1.886805, 1, 1, 1, 1, 1,
-1.212599, -0.1444559, -3.748132, 1, 1, 1, 1, 1,
-1.208055, 1.478695, -0.8004909, 1, 1, 1, 1, 1,
-1.200978, 0.3362681, -0.2693618, 1, 1, 1, 1, 1,
-1.198646, 1.079746, -1.31547, 1, 1, 1, 1, 1,
-1.198077, -0.4139974, -4.377679, 1, 1, 1, 1, 1,
-1.193433, -0.653885, -1.534475, 1, 1, 1, 1, 1,
-1.191009, 0.9741381, -0.8312252, 1, 1, 1, 1, 1,
-1.187985, -1.551425, -2.153916, 1, 1, 1, 1, 1,
-1.186596, 0.9324017, -0.009430937, 1, 1, 1, 1, 1,
-1.184633, 1.492576, -1.195467, 1, 1, 1, 1, 1,
-1.184103, -0.2932845, -0.8097594, 1, 1, 1, 1, 1,
-1.178271, 2.269389, -0.04619658, 1, 1, 1, 1, 1,
-1.176857, 0.2622793, -1.744082, 1, 1, 1, 1, 1,
-1.168992, 1.574264, -0.9311717, 0, 0, 1, 1, 1,
-1.161267, -0.6675971, -3.593061, 1, 0, 0, 1, 1,
-1.158975, -1.673524, -3.601474, 1, 0, 0, 1, 1,
-1.157838, 1.036276, -1.315219, 1, 0, 0, 1, 1,
-1.143644, -0.2904961, -1.934033, 1, 0, 0, 1, 1,
-1.140743, 0.8960633, -1.525004, 1, 0, 0, 1, 1,
-1.140357, 0.245629, -0.1123088, 0, 0, 0, 1, 1,
-1.137516, 1.272832, 0.6579564, 0, 0, 0, 1, 1,
-1.134466, -0.1674925, -1.5901, 0, 0, 0, 1, 1,
-1.134413, 1.109355, -0.7815623, 0, 0, 0, 1, 1,
-1.128409, 0.1260101, -2.790756, 0, 0, 0, 1, 1,
-1.124252, 0.1274265, -1.296799, 0, 0, 0, 1, 1,
-1.119496, 0.2420414, 0.09099085, 0, 0, 0, 1, 1,
-1.111372, -0.1213698, -2.154496, 1, 1, 1, 1, 1,
-1.110742, -1.142192, -2.025489, 1, 1, 1, 1, 1,
-1.11072, 0.3917379, 0.3246679, 1, 1, 1, 1, 1,
-1.109226, 1.301648, 0.2401604, 1, 1, 1, 1, 1,
-1.107475, -0.09055843, -0.6771098, 1, 1, 1, 1, 1,
-1.092953, 0.386059, -1.057416, 1, 1, 1, 1, 1,
-1.090971, -0.8370473, -3.369622, 1, 1, 1, 1, 1,
-1.088388, -0.9579603, -3.296046, 1, 1, 1, 1, 1,
-1.087951, -0.2647637, -2.281104, 1, 1, 1, 1, 1,
-1.085205, -0.09788584, -0.8580043, 1, 1, 1, 1, 1,
-1.08044, -1.193605, -1.861452, 1, 1, 1, 1, 1,
-1.070294, -1.472952, -2.45897, 1, 1, 1, 1, 1,
-1.07018, -0.9241528, -2.749333, 1, 1, 1, 1, 1,
-1.067119, 0.6667861, 0.2063814, 1, 1, 1, 1, 1,
-1.066053, 1.09926, -1.600271, 1, 1, 1, 1, 1,
-1.053732, 0.1708828, -1.570963, 0, 0, 1, 1, 1,
-1.047972, 0.190208, -1.26861, 1, 0, 0, 1, 1,
-1.046349, -1.267361, -1.786278, 1, 0, 0, 1, 1,
-1.038597, 1.212955, -2.083946, 1, 0, 0, 1, 1,
-1.034687, 1.666101, -2.25269, 1, 0, 0, 1, 1,
-1.030819, -0.8727846, -1.05418, 1, 0, 0, 1, 1,
-1.027484, 0.6570141, -0.6046806, 0, 0, 0, 1, 1,
-1.019233, 0.07538467, -1.725353, 0, 0, 0, 1, 1,
-1.018836, -0.07445295, -0.262763, 0, 0, 0, 1, 1,
-1.005781, 1.576361, -0.5474938, 0, 0, 0, 1, 1,
-1.001503, 0.1029206, -1.652245, 0, 0, 0, 1, 1,
-1.00015, 2.060408, 0.09836326, 0, 0, 0, 1, 1,
-0.9929149, 0.4752052, -1.613195, 0, 0, 0, 1, 1,
-0.9927145, -0.4735222, -3.0314, 1, 1, 1, 1, 1,
-0.9915734, -0.2695605, -1.11668, 1, 1, 1, 1, 1,
-0.9868819, -1.8671, -2.085377, 1, 1, 1, 1, 1,
-0.9806001, -2.73959, -3.159867, 1, 1, 1, 1, 1,
-0.9774927, -0.6688858, -3.618896, 1, 1, 1, 1, 1,
-0.9767066, -2.400697, -4.243957, 1, 1, 1, 1, 1,
-0.9761184, -0.2784494, -0.3705955, 1, 1, 1, 1, 1,
-0.9755551, -1.529292, -3.320068, 1, 1, 1, 1, 1,
-0.9733868, 0.3883055, -1.01876, 1, 1, 1, 1, 1,
-0.972595, -1.977559, -1.489296, 1, 1, 1, 1, 1,
-0.964673, -0.6533512, -1.023462, 1, 1, 1, 1, 1,
-0.9633797, -0.2146485, -2.117768, 1, 1, 1, 1, 1,
-0.9614583, -0.6088315, -2.522213, 1, 1, 1, 1, 1,
-0.9607397, -0.4732536, -1.908435, 1, 1, 1, 1, 1,
-0.9506279, 0.05614739, -0.3431236, 1, 1, 1, 1, 1,
-0.9479907, 0.5797704, -2.674938, 0, 0, 1, 1, 1,
-0.9479223, -1.878096, -2.568885, 1, 0, 0, 1, 1,
-0.9478059, -1.986785, -2.977871, 1, 0, 0, 1, 1,
-0.9469034, -0.2463253, -1.267407, 1, 0, 0, 1, 1,
-0.9467231, -0.8233451, -0.3603545, 1, 0, 0, 1, 1,
-0.9463568, -0.5664284, -1.815863, 1, 0, 0, 1, 1,
-0.9457325, -1.055152, -4.107333, 0, 0, 0, 1, 1,
-0.9439593, -0.7327839, -0.8312453, 0, 0, 0, 1, 1,
-0.9363503, 0.07397567, -1.860391, 0, 0, 0, 1, 1,
-0.9283346, 1.810536, -0.229537, 0, 0, 0, 1, 1,
-0.92613, -1.066942, -2.484192, 0, 0, 0, 1, 1,
-0.9253964, -1.621233, -3.242351, 0, 0, 0, 1, 1,
-0.9243258, 0.3323857, -1.387791, 0, 0, 0, 1, 1,
-0.9239575, -1.224939, -2.773775, 1, 1, 1, 1, 1,
-0.9186468, 1.395456, -2.191895, 1, 1, 1, 1, 1,
-0.915032, -0.2504463, -3.87677, 1, 1, 1, 1, 1,
-0.9143961, -0.7919976, -2.89379, 1, 1, 1, 1, 1,
-0.9136403, 0.3237181, -0.6376058, 1, 1, 1, 1, 1,
-0.9135157, 0.1561692, -3.008701, 1, 1, 1, 1, 1,
-0.9106606, 0.4472579, -1.784506, 1, 1, 1, 1, 1,
-0.9019135, -0.9945009, -1.213695, 1, 1, 1, 1, 1,
-0.8983331, -1.062954, -1.022529, 1, 1, 1, 1, 1,
-0.8965291, -0.230393, -0.6695104, 1, 1, 1, 1, 1,
-0.8918069, -0.2456689, -2.213918, 1, 1, 1, 1, 1,
-0.889351, -0.1599744, -1.541865, 1, 1, 1, 1, 1,
-0.8850642, -1.226292, -1.827038, 1, 1, 1, 1, 1,
-0.8773604, 2.533526, 0.03142299, 1, 1, 1, 1, 1,
-0.8734248, 0.6222118, 0.4360162, 1, 1, 1, 1, 1,
-0.8717009, 0.4558431, -0.5309151, 0, 0, 1, 1, 1,
-0.8698245, 1.169697, 0.5299756, 1, 0, 0, 1, 1,
-0.8683322, 0.1683287, -0.4562238, 1, 0, 0, 1, 1,
-0.8437365, 0.1120779, -0.5446005, 1, 0, 0, 1, 1,
-0.8397332, -0.4671955, -3.261215, 1, 0, 0, 1, 1,
-0.8308905, -0.1718788, -3.711763, 1, 0, 0, 1, 1,
-0.8190768, 2.214483, -0.7302336, 0, 0, 0, 1, 1,
-0.8151261, 0.7727991, -0.7821051, 0, 0, 0, 1, 1,
-0.8123765, -0.8154457, -3.354622, 0, 0, 0, 1, 1,
-0.8091518, -1.571131, -2.231316, 0, 0, 0, 1, 1,
-0.8085184, 0.1239907, -0.9231231, 0, 0, 0, 1, 1,
-0.8030105, 0.05393013, -0.7697752, 0, 0, 0, 1, 1,
-0.8017395, -1.002253, -1.972039, 0, 0, 0, 1, 1,
-0.7985334, -0.2011071, -0.915924, 1, 1, 1, 1, 1,
-0.7846126, -0.7961516, -2.052785, 1, 1, 1, 1, 1,
-0.7781367, -0.5358428, -1.303285, 1, 1, 1, 1, 1,
-0.7754258, -0.2713253, -2.741232, 1, 1, 1, 1, 1,
-0.7751667, -1.989384, -1.693435, 1, 1, 1, 1, 1,
-0.7723677, -1.713302, -1.99956, 1, 1, 1, 1, 1,
-0.7672635, -2.105673, -2.777617, 1, 1, 1, 1, 1,
-0.7664632, 0.1115824, -1.596269, 1, 1, 1, 1, 1,
-0.766269, -1.463475, -1.421341, 1, 1, 1, 1, 1,
-0.7660657, -0.9654453, -3.513422, 1, 1, 1, 1, 1,
-0.7651556, 0.863117, -0.05772878, 1, 1, 1, 1, 1,
-0.7602655, 0.2975436, -1.380115, 1, 1, 1, 1, 1,
-0.7542161, 1.830531, 0.4304954, 1, 1, 1, 1, 1,
-0.751388, -0.2525969, -2.344653, 1, 1, 1, 1, 1,
-0.7497017, -0.1297141, -1.049948, 1, 1, 1, 1, 1,
-0.7403705, -1.279957, -2.836965, 0, 0, 1, 1, 1,
-0.7393993, 0.1283824, -2.741131, 1, 0, 0, 1, 1,
-0.7382418, -0.2165943, -1.699435, 1, 0, 0, 1, 1,
-0.7377183, -0.946855, -1.633563, 1, 0, 0, 1, 1,
-0.7357078, -1.186191, -2.558866, 1, 0, 0, 1, 1,
-0.7356293, 0.5690958, -0.7401519, 1, 0, 0, 1, 1,
-0.7347249, -1.675882, -3.33814, 0, 0, 0, 1, 1,
-0.73413, 1.134881, -2.280894, 0, 0, 0, 1, 1,
-0.7327556, -2.335642, -3.130328, 0, 0, 0, 1, 1,
-0.7263537, 1.67384, 1.072576, 0, 0, 0, 1, 1,
-0.7252932, 0.3881129, 0.4571926, 0, 0, 0, 1, 1,
-0.7225592, -0.2601027, -0.7623109, 0, 0, 0, 1, 1,
-0.7218003, -0.6168589, -4.141115, 0, 0, 0, 1, 1,
-0.7193531, 1.539551, -0.644744, 1, 1, 1, 1, 1,
-0.7134966, 0.481214, -1.829865, 1, 1, 1, 1, 1,
-0.6967804, 0.3043796, -0.9625831, 1, 1, 1, 1, 1,
-0.6858972, 0.7329173, -0.081233, 1, 1, 1, 1, 1,
-0.6774771, 0.08946548, -1.70774, 1, 1, 1, 1, 1,
-0.6756209, 0.6708099, -0.9552966, 1, 1, 1, 1, 1,
-0.6753439, 0.9891816, -1.180275, 1, 1, 1, 1, 1,
-0.6745667, -0.7600982, -0.3267479, 1, 1, 1, 1, 1,
-0.6683755, -1.231971, -2.359782, 1, 1, 1, 1, 1,
-0.6683468, 0.6096477, -2.149043, 1, 1, 1, 1, 1,
-0.6673882, 0.8821774, -0.4556626, 1, 1, 1, 1, 1,
-0.6651899, -1.105956, -3.476273, 1, 1, 1, 1, 1,
-0.6638604, -2.058736, -3.686269, 1, 1, 1, 1, 1,
-0.6589661, -0.3132029, -1.268618, 1, 1, 1, 1, 1,
-0.6494893, 1.268729, 0.1307435, 1, 1, 1, 1, 1,
-0.6465688, -1.720515, -1.043721, 0, 0, 1, 1, 1,
-0.6379745, -0.7389305, -2.260628, 1, 0, 0, 1, 1,
-0.6279245, 0.8827451, -1.626133, 1, 0, 0, 1, 1,
-0.6148665, 0.5630468, -0.1941833, 1, 0, 0, 1, 1,
-0.6146667, -0.04640565, -2.958266, 1, 0, 0, 1, 1,
-0.6140499, -0.355099, -2.041618, 1, 0, 0, 1, 1,
-0.6134719, -0.09359697, -1.567641, 0, 0, 0, 1, 1,
-0.6040174, -0.6767962, -3.131016, 0, 0, 0, 1, 1,
-0.6027326, -1.287298, -2.572551, 0, 0, 0, 1, 1,
-0.6020988, -1.207144, -2.24335, 0, 0, 0, 1, 1,
-0.5940083, 0.3958178, -0.910915, 0, 0, 0, 1, 1,
-0.5875711, 2.275084, 0.4881203, 0, 0, 0, 1, 1,
-0.5790982, -1.073757, -0.8457868, 0, 0, 0, 1, 1,
-0.5776709, 0.6860234, -0.9534467, 1, 1, 1, 1, 1,
-0.5762665, -0.6251587, -1.185491, 1, 1, 1, 1, 1,
-0.5710593, -0.4460624, -1.26754, 1, 1, 1, 1, 1,
-0.5709202, -1.965829, -2.641238, 1, 1, 1, 1, 1,
-0.5691663, -2.500186, -3.04941, 1, 1, 1, 1, 1,
-0.5637352, 0.5630948, 0.6843996, 1, 1, 1, 1, 1,
-0.5615126, -1.159072, -4.719113, 1, 1, 1, 1, 1,
-0.5603319, -0.4419952, -3.288743, 1, 1, 1, 1, 1,
-0.55922, -1.726579, -2.237819, 1, 1, 1, 1, 1,
-0.554, -0.1105969, -1.859706, 1, 1, 1, 1, 1,
-0.5447318, -0.7371841, -3.131695, 1, 1, 1, 1, 1,
-0.5436451, -0.1883097, -1.868152, 1, 1, 1, 1, 1,
-0.5404531, -1.058449, -6.048638, 1, 1, 1, 1, 1,
-0.540252, -0.0648196, -3.312689, 1, 1, 1, 1, 1,
-0.5338622, -1.509408, -3.602322, 1, 1, 1, 1, 1,
-0.5331393, 0.798237, -1.279772, 0, 0, 1, 1, 1,
-0.5298302, -0.01427349, -2.131339, 1, 0, 0, 1, 1,
-0.5273012, 0.1909241, -0.8613398, 1, 0, 0, 1, 1,
-0.5264748, 1.093953, 0.09681118, 1, 0, 0, 1, 1,
-0.5213343, -0.480661, -2.330233, 1, 0, 0, 1, 1,
-0.5178317, -0.2398983, -2.988011, 1, 0, 0, 1, 1,
-0.5168577, -1.291113, -2.652546, 0, 0, 0, 1, 1,
-0.5154083, 0.9207222, -0.9515346, 0, 0, 0, 1, 1,
-0.51158, 0.523051, -1.527704, 0, 0, 0, 1, 1,
-0.5112537, 1.33416, -0.4560853, 0, 0, 0, 1, 1,
-0.5110312, 1.114945, -1.596134, 0, 0, 0, 1, 1,
-0.5102002, 0.8311275, -1.43726, 0, 0, 0, 1, 1,
-0.5082989, -0.1202002, -1.631474, 0, 0, 0, 1, 1,
-0.5030091, 1.03517, -0.6950772, 1, 1, 1, 1, 1,
-0.5026222, 0.8437594, -0.4290526, 1, 1, 1, 1, 1,
-0.502441, 0.1557763, -2.799444, 1, 1, 1, 1, 1,
-0.4983371, -1.320526, -1.852969, 1, 1, 1, 1, 1,
-0.4944816, 0.414177, -0.4717405, 1, 1, 1, 1, 1,
-0.4930335, -0.9145297, -3.363401, 1, 1, 1, 1, 1,
-0.4896476, 0.4319583, 0.2764277, 1, 1, 1, 1, 1,
-0.4888106, 0.675997, -0.3313591, 1, 1, 1, 1, 1,
-0.4846655, 0.7698737, -1.656364, 1, 1, 1, 1, 1,
-0.4827297, 0.6596279, -1.609119, 1, 1, 1, 1, 1,
-0.4812762, -0.09025975, -2.411741, 1, 1, 1, 1, 1,
-0.4791119, 0.2062631, -1.576622, 1, 1, 1, 1, 1,
-0.4730454, 0.5655305, -1.089604, 1, 1, 1, 1, 1,
-0.4649931, 0.3123172, -0.5955931, 1, 1, 1, 1, 1,
-0.4597414, 0.4680331, -0.5569782, 1, 1, 1, 1, 1,
-0.4586069, 0.5769158, -0.2091677, 0, 0, 1, 1, 1,
-0.451368, -2.069801, -1.762191, 1, 0, 0, 1, 1,
-0.4485325, 0.3010461, -1.006299, 1, 0, 0, 1, 1,
-0.4428248, 0.4308201, 0.6836904, 1, 0, 0, 1, 1,
-0.435596, -0.01453811, -0.8486553, 1, 0, 0, 1, 1,
-0.4332479, 1.148049, -0.9647337, 1, 0, 0, 1, 1,
-0.4285755, 1.247872, -0.1347383, 0, 0, 0, 1, 1,
-0.4272141, -0.2503181, -2.95453, 0, 0, 0, 1, 1,
-0.4165773, -0.04410134, -1.99177, 0, 0, 0, 1, 1,
-0.4154955, -2.234238, -3.221721, 0, 0, 0, 1, 1,
-0.414221, -0.0002831211, 0.2875836, 0, 0, 0, 1, 1,
-0.4141023, 1.149826, -1.022661, 0, 0, 0, 1, 1,
-0.4130442, -0.9594615, -3.623288, 0, 0, 0, 1, 1,
-0.4127519, 1.040989, -0.05145979, 1, 1, 1, 1, 1,
-0.4062859, -0.6036246, -2.134955, 1, 1, 1, 1, 1,
-0.4036033, -0.8160957, -3.419732, 1, 1, 1, 1, 1,
-0.4033054, 0.8497326, 0.02955811, 1, 1, 1, 1, 1,
-0.4029526, -0.05017897, -0.4383928, 1, 1, 1, 1, 1,
-0.3969795, 1.429755, 1.465391, 1, 1, 1, 1, 1,
-0.3903842, 1.67505, 1.28182, 1, 1, 1, 1, 1,
-0.388831, 0.9454516, 0.8458981, 1, 1, 1, 1, 1,
-0.3799979, -0.3102092, -2.29904, 1, 1, 1, 1, 1,
-0.3756164, 0.01794006, 0.01133255, 1, 1, 1, 1, 1,
-0.3745294, 0.3764472, -0.5944172, 1, 1, 1, 1, 1,
-0.3685399, 0.4897484, -0.2136348, 1, 1, 1, 1, 1,
-0.3661745, 0.70935, 2.587712, 1, 1, 1, 1, 1,
-0.3626454, 1.412005, -0.7970987, 1, 1, 1, 1, 1,
-0.3623449, 0.9106742, -1.05485, 1, 1, 1, 1, 1,
-0.3595676, 0.8917022, -0.5583465, 0, 0, 1, 1, 1,
-0.3590943, -0.2057576, -1.734133, 1, 0, 0, 1, 1,
-0.358828, -0.1603745, -2.324406, 1, 0, 0, 1, 1,
-0.3570682, -0.02004334, -3.542864, 1, 0, 0, 1, 1,
-0.3550865, 0.1736747, -0.6660338, 1, 0, 0, 1, 1,
-0.3548906, 0.004830681, -1.854258, 1, 0, 0, 1, 1,
-0.3503791, -0.3326462, -2.376898, 0, 0, 0, 1, 1,
-0.3503146, -0.03004907, -2.281397, 0, 0, 0, 1, 1,
-0.3450351, 0.7118825, 0.121005, 0, 0, 0, 1, 1,
-0.3399203, -1.594014, -2.310279, 0, 0, 0, 1, 1,
-0.3394806, -1.222052, -2.4415, 0, 0, 0, 1, 1,
-0.3386039, 1.436751, -0.7634112, 0, 0, 0, 1, 1,
-0.3379281, 1.611956, -1.379731, 0, 0, 0, 1, 1,
-0.3358839, -1.273121, -3.09473, 1, 1, 1, 1, 1,
-0.3356803, 0.4445762, -0.8220104, 1, 1, 1, 1, 1,
-0.330233, 0.1601785, 0.9986054, 1, 1, 1, 1, 1,
-0.326805, 0.202052, -1.19499, 1, 1, 1, 1, 1,
-0.3235564, -1.065065, -1.832467, 1, 1, 1, 1, 1,
-0.3189285, 1.102081, -0.9359754, 1, 1, 1, 1, 1,
-0.3169006, 0.5430694, 1.080726, 1, 1, 1, 1, 1,
-0.3133724, 1.952891, -0.7795766, 1, 1, 1, 1, 1,
-0.3099608, -0.2010815, -1.273048, 1, 1, 1, 1, 1,
-0.3084467, 0.2150653, -2.450872, 1, 1, 1, 1, 1,
-0.2951384, -0.7411041, -3.196624, 1, 1, 1, 1, 1,
-0.2894162, 1.20209, 0.3638809, 1, 1, 1, 1, 1,
-0.2881209, 1.095284, 0.7088934, 1, 1, 1, 1, 1,
-0.2842544, -2.495479, -2.355817, 1, 1, 1, 1, 1,
-0.2781616, 0.1310917, -2.75236, 1, 1, 1, 1, 1,
-0.2770377, 0.7220674, -0.4073666, 0, 0, 1, 1, 1,
-0.2763684, -3.08907, -3.139674, 1, 0, 0, 1, 1,
-0.2760901, 1.940497, 0.1156685, 1, 0, 0, 1, 1,
-0.2716693, -2.065779, -1.858408, 1, 0, 0, 1, 1,
-0.2676106, -1.379049, -4.271983, 1, 0, 0, 1, 1,
-0.2660342, 0.2597912, 0.3275359, 1, 0, 0, 1, 1,
-0.2639912, 0.3024643, -1.03768, 0, 0, 0, 1, 1,
-0.2634213, -0.1861904, -2.595198, 0, 0, 0, 1, 1,
-0.2629399, 0.3071438, -1.227933, 0, 0, 0, 1, 1,
-0.2584996, 0.1518547, -0.5930319, 0, 0, 0, 1, 1,
-0.2574782, -1.911387, -3.918515, 0, 0, 0, 1, 1,
-0.2557794, 0.7385816, 0.5603271, 0, 0, 0, 1, 1,
-0.2540567, 1.754853, 0.5156825, 0, 0, 0, 1, 1,
-0.2507791, 0.5534227, -0.2868754, 1, 1, 1, 1, 1,
-0.249888, 0.9390967, 1.006529, 1, 1, 1, 1, 1,
-0.2480836, -0.4955943, -3.40931, 1, 1, 1, 1, 1,
-0.2445609, 0.7800819, 0.8058158, 1, 1, 1, 1, 1,
-0.2416904, -0.1200464, -2.503855, 1, 1, 1, 1, 1,
-0.2405335, 0.1943863, -1.424787, 1, 1, 1, 1, 1,
-0.2394749, -0.4234302, -4.060342, 1, 1, 1, 1, 1,
-0.2383398, -0.2027481, -0.9111266, 1, 1, 1, 1, 1,
-0.233277, -0.05121396, -2.844831, 1, 1, 1, 1, 1,
-0.2292782, -2.472967, -2.555732, 1, 1, 1, 1, 1,
-0.2290268, 0.7522222, 3.196638, 1, 1, 1, 1, 1,
-0.2275922, -0.3187179, -1.055158, 1, 1, 1, 1, 1,
-0.220121, -0.7323097, -1.166005, 1, 1, 1, 1, 1,
-0.21934, -2.367067, -4.249954, 1, 1, 1, 1, 1,
-0.2180879, 0.8985603, -0.1310553, 1, 1, 1, 1, 1,
-0.2138965, -1.197541, -2.004936, 0, 0, 1, 1, 1,
-0.2132736, 0.9708642, -0.395735, 1, 0, 0, 1, 1,
-0.2108908, 0.09073591, -1.250663, 1, 0, 0, 1, 1,
-0.2100022, 1.985196, -0.3995389, 1, 0, 0, 1, 1,
-0.2098549, -0.7090564, -3.640572, 1, 0, 0, 1, 1,
-0.2098246, 1.469905, 0.4465328, 1, 0, 0, 1, 1,
-0.2092669, 1.736203, -0.04908475, 0, 0, 0, 1, 1,
-0.2074214, -0.3421167, -2.96615, 0, 0, 0, 1, 1,
-0.2068471, 0.2491125, 0.5598646, 0, 0, 0, 1, 1,
-0.2029951, -0.9417454, -2.612299, 0, 0, 0, 1, 1,
-0.1982596, -0.08990196, -2.060231, 0, 0, 0, 1, 1,
-0.1954412, 1.330609, 0.5772273, 0, 0, 0, 1, 1,
-0.1936015, -0.8972852, -2.605698, 0, 0, 0, 1, 1,
-0.1914281, -0.9281194, -3.169118, 1, 1, 1, 1, 1,
-0.1909752, -2.66639, -3.442402, 1, 1, 1, 1, 1,
-0.19081, 0.1016051, -0.2590762, 1, 1, 1, 1, 1,
-0.188568, 0.05161753, -2.064351, 1, 1, 1, 1, 1,
-0.188319, 1.247398, 0.5616602, 1, 1, 1, 1, 1,
-0.1879995, 1.329765, -0.0002348139, 1, 1, 1, 1, 1,
-0.1867129, -1.69956, -0.9005453, 1, 1, 1, 1, 1,
-0.182876, 0.2968233, -0.8017378, 1, 1, 1, 1, 1,
-0.178986, 0.1442087, -1.327572, 1, 1, 1, 1, 1,
-0.1746208, -0.7850626, -2.387913, 1, 1, 1, 1, 1,
-0.1693503, -0.8117524, -1.285805, 1, 1, 1, 1, 1,
-0.16669, 0.9854695, 0.03510837, 1, 1, 1, 1, 1,
-0.1662063, 0.2632298, 1.312757, 1, 1, 1, 1, 1,
-0.1648948, -0.3704906, -2.760509, 1, 1, 1, 1, 1,
-0.1635595, -0.5357283, -3.773566, 1, 1, 1, 1, 1,
-0.1622622, -1.567558, -2.402918, 0, 0, 1, 1, 1,
-0.1619571, -2.09711, -1.789911, 1, 0, 0, 1, 1,
-0.1615393, 2.032399, -1.702949, 1, 0, 0, 1, 1,
-0.1584578, -0.170732, -4.254608, 1, 0, 0, 1, 1,
-0.1559708, -0.05325798, -0.07880121, 1, 0, 0, 1, 1,
-0.1541319, 0.5400406, -1.100105, 1, 0, 0, 1, 1,
-0.1488006, 1.418305, 0.3656234, 0, 0, 0, 1, 1,
-0.148449, 0.5573705, -0.2006394, 0, 0, 0, 1, 1,
-0.146897, -1.503313, -2.222474, 0, 0, 0, 1, 1,
-0.1451329, -0.1025925, -0.9525567, 0, 0, 0, 1, 1,
-0.1439275, 0.2020901, -0.5473994, 0, 0, 0, 1, 1,
-0.1437085, 0.5253565, -0.8679498, 0, 0, 0, 1, 1,
-0.1423508, -0.1723127, -5.056548, 0, 0, 0, 1, 1,
-0.1361301, -1.702764, -3.547135, 1, 1, 1, 1, 1,
-0.1356045, 0.3996016, 0.2548833, 1, 1, 1, 1, 1,
-0.1344034, 2.037894, -0.2562959, 1, 1, 1, 1, 1,
-0.1338952, -0.713888, -1.738806, 1, 1, 1, 1, 1,
-0.1311942, 1.014165, -1.270674, 1, 1, 1, 1, 1,
-0.1301581, -0.9812245, -2.85724, 1, 1, 1, 1, 1,
-0.1294183, -0.3393757, -3.212656, 1, 1, 1, 1, 1,
-0.1293227, 0.8477911, -0.7749489, 1, 1, 1, 1, 1,
-0.1283469, 0.3469312, -1.229856, 1, 1, 1, 1, 1,
-0.1270964, 0.5799444, -1.335895, 1, 1, 1, 1, 1,
-0.1216981, -0.03933097, -2.620028, 1, 1, 1, 1, 1,
-0.1216934, -0.9632989, -2.594527, 1, 1, 1, 1, 1,
-0.1195034, -0.9126784, -3.333972, 1, 1, 1, 1, 1,
-0.1077027, -0.9978544, -1.603287, 1, 1, 1, 1, 1,
-0.1052157, 1.330173, -0.3280033, 1, 1, 1, 1, 1,
-0.1010884, 0.4275187, -0.3520004, 0, 0, 1, 1, 1,
-0.09947527, 1.147075, 0.6053302, 1, 0, 0, 1, 1,
-0.08788372, 1.425414, -0.6133591, 1, 0, 0, 1, 1,
-0.08328398, 0.007384493, 0.1448596, 1, 0, 0, 1, 1,
-0.07911648, -1.231147, -2.756278, 1, 0, 0, 1, 1,
-0.07653652, 1.239974, 0.04167305, 1, 0, 0, 1, 1,
-0.07414951, -0.0007025303, -0.3338288, 0, 0, 0, 1, 1,
-0.07088175, 1.475934, -1.37926, 0, 0, 0, 1, 1,
-0.06194903, -1.614522, -2.60076, 0, 0, 0, 1, 1,
-0.06173632, 0.955807, 0.9557814, 0, 0, 0, 1, 1,
-0.05986036, 1.291931, 1.766793, 0, 0, 0, 1, 1,
-0.05930927, -0.8638939, -2.648637, 0, 0, 0, 1, 1,
-0.05464723, 0.1193599, -1.743636, 0, 0, 0, 1, 1,
-0.05418526, -0.2647408, -0.9115018, 1, 1, 1, 1, 1,
-0.0498811, 0.05457952, -2.233845, 1, 1, 1, 1, 1,
-0.04927655, -0.6042192, -3.282636, 1, 1, 1, 1, 1,
-0.04891399, -1.736629, -3.726278, 1, 1, 1, 1, 1,
-0.046586, -0.5869019, -2.730511, 1, 1, 1, 1, 1,
-0.04618838, 0.5510513, -0.0009230412, 1, 1, 1, 1, 1,
-0.04585436, -0.002139274, -0.7693541, 1, 1, 1, 1, 1,
-0.04287998, -0.4867271, -4.202718, 1, 1, 1, 1, 1,
-0.04044747, 0.9762526, 1.347176, 1, 1, 1, 1, 1,
-0.03829288, 0.7350248, -0.598906, 1, 1, 1, 1, 1,
-0.03331722, 0.2054789, -0.06923151, 1, 1, 1, 1, 1,
-0.0291908, -0.4876361, -2.0241, 1, 1, 1, 1, 1,
-0.02863257, 0.9773105, 0.4753659, 1, 1, 1, 1, 1,
-0.02646429, -0.9023329, -2.44462, 1, 1, 1, 1, 1,
-0.02265598, -0.394614, -2.051137, 1, 1, 1, 1, 1,
-0.02139127, -0.145376, -3.89939, 0, 0, 1, 1, 1,
-0.02027825, -1.832398, -5.04665, 1, 0, 0, 1, 1,
-0.01871489, 0.1962574, 0.5840923, 1, 0, 0, 1, 1,
-0.01833583, -2.092452, -4.516021, 1, 0, 0, 1, 1,
-0.01708857, -0.8676987, -4.176108, 1, 0, 0, 1, 1,
-0.006898873, -2.153414, -3.482406, 1, 0, 0, 1, 1,
-0.00599234, 0.005743043, -0.5164173, 0, 0, 0, 1, 1,
-0.004870204, -0.4698656, -2.05258, 0, 0, 0, 1, 1,
-0.002039913, -0.3185717, -3.057135, 0, 0, 0, 1, 1,
-0.001053181, -1.700845, -1.304398, 0, 0, 0, 1, 1,
-1.798722e-05, 0.3546988, -0.1728986, 0, 0, 0, 1, 1,
0.000991773, -0.3760717, 1.085286, 0, 0, 0, 1, 1,
0.007311198, -0.7589725, 3.150719, 0, 0, 0, 1, 1,
0.02006093, -0.1131535, 1.161794, 1, 1, 1, 1, 1,
0.02108789, 0.1659619, 2.061784, 1, 1, 1, 1, 1,
0.02192233, 0.01240982, 1.413378, 1, 1, 1, 1, 1,
0.0381958, -1.070596, 3.814939, 1, 1, 1, 1, 1,
0.04174497, 1.287141, 2.601706, 1, 1, 1, 1, 1,
0.04194558, -0.07902425, 3.607487, 1, 1, 1, 1, 1,
0.04256691, -1.059467, 3.055866, 1, 1, 1, 1, 1,
0.04651601, -0.9681382, 2.997523, 1, 1, 1, 1, 1,
0.05356004, -0.4011187, -0.2860807, 1, 1, 1, 1, 1,
0.05531206, 0.9499859, 1.209397, 1, 1, 1, 1, 1,
0.05954845, -1.354701, 1.601412, 1, 1, 1, 1, 1,
0.06414904, -0.6677963, 2.764646, 1, 1, 1, 1, 1,
0.06952739, -0.1181447, 1.005698, 1, 1, 1, 1, 1,
0.07396992, -1.023811, 4.418083, 1, 1, 1, 1, 1,
0.07430732, -0.4383749, 2.890909, 1, 1, 1, 1, 1,
0.08906055, 0.06969449, 0.5665865, 0, 0, 1, 1, 1,
0.09872957, -0.09462997, 1.428557, 1, 0, 0, 1, 1,
0.1002656, 1.155983, 0.2156602, 1, 0, 0, 1, 1,
0.1065502, -0.4694307, 2.817983, 1, 0, 0, 1, 1,
0.1072828, 0.128392, -0.2030245, 1, 0, 0, 1, 1,
0.1094593, -0.1774002, 3.728294, 1, 0, 0, 1, 1,
0.1135087, -0.1386493, 3.954676, 0, 0, 0, 1, 1,
0.115771, -0.3715461, 2.718092, 0, 0, 0, 1, 1,
0.1182937, 1.329734, -1.116604, 0, 0, 0, 1, 1,
0.1188029, -0.02155753, 2.795836, 0, 0, 0, 1, 1,
0.1196622, -0.03620217, 0.5734743, 0, 0, 0, 1, 1,
0.1213453, 1.042228, 0.05796548, 0, 0, 0, 1, 1,
0.1216706, -1.613262, 1.018171, 0, 0, 0, 1, 1,
0.1219152, -0.6036066, 3.188141, 1, 1, 1, 1, 1,
0.1256645, 0.1165091, 1.588477, 1, 1, 1, 1, 1,
0.1260644, 0.8030084, 1.526544, 1, 1, 1, 1, 1,
0.128925, -1.128461, 3.510838, 1, 1, 1, 1, 1,
0.1295927, 0.7631888, -0.06684678, 1, 1, 1, 1, 1,
0.1298629, -0.6810172, 3.723816, 1, 1, 1, 1, 1,
0.1306484, 0.1459338, 1.774531, 1, 1, 1, 1, 1,
0.1315877, -0.3121391, 0.7713249, 1, 1, 1, 1, 1,
0.1321738, -1.065555, 2.394736, 1, 1, 1, 1, 1,
0.1375214, 0.5458051, 1.620991, 1, 1, 1, 1, 1,
0.1389672, -0.5471869, 4.95532, 1, 1, 1, 1, 1,
0.1390518, -0.6006495, 2.902959, 1, 1, 1, 1, 1,
0.1461162, -1.044961, 3.554339, 1, 1, 1, 1, 1,
0.1531495, -1.392396, 3.213772, 1, 1, 1, 1, 1,
0.1556372, 1.108249, 0.945052, 1, 1, 1, 1, 1,
0.1604216, 0.2156257, 1.393293, 0, 0, 1, 1, 1,
0.1692851, -1.031133, 2.653779, 1, 0, 0, 1, 1,
0.1712094, 1.056816, 1.20847, 1, 0, 0, 1, 1,
0.174929, -2.294469, 3.368879, 1, 0, 0, 1, 1,
0.1759892, -0.7683633, 4.391245, 1, 0, 0, 1, 1,
0.1760046, -0.08817395, 2.678451, 1, 0, 0, 1, 1,
0.1782221, -1.55034, 3.006814, 0, 0, 0, 1, 1,
0.1800139, 0.1472947, 1.763277, 0, 0, 0, 1, 1,
0.1812468, -0.06279854, 1.508381, 0, 0, 0, 1, 1,
0.1877614, -0.149068, 2.220558, 0, 0, 0, 1, 1,
0.1920619, 0.9404571, 0.7747023, 0, 0, 0, 1, 1,
0.1945521, 0.1249905, 0.2408333, 0, 0, 0, 1, 1,
0.1979076, 0.7343459, 0.5795399, 0, 0, 0, 1, 1,
0.1991997, 0.684952, 2.080665, 1, 1, 1, 1, 1,
0.2041064, -0.4214377, 3.050318, 1, 1, 1, 1, 1,
0.2076235, -0.4887145, 0.9000112, 1, 1, 1, 1, 1,
0.21515, 0.6875837, 1.033805, 1, 1, 1, 1, 1,
0.2201849, -0.4810514, 3.94202, 1, 1, 1, 1, 1,
0.2202981, -0.7691103, 2.290258, 1, 1, 1, 1, 1,
0.2211178, -0.2335027, 2.328796, 1, 1, 1, 1, 1,
0.226775, 2.438609, -1.693005, 1, 1, 1, 1, 1,
0.2308844, 0.07348444, 0.5908085, 1, 1, 1, 1, 1,
0.2341715, 0.8742201, -0.526361, 1, 1, 1, 1, 1,
0.2353178, -0.5173583, 4.230686, 1, 1, 1, 1, 1,
0.2369002, -0.4035017, 0.2330344, 1, 1, 1, 1, 1,
0.2412749, 0.8861284, -1.66115, 1, 1, 1, 1, 1,
0.2433874, -1.119738, 1.43513, 1, 1, 1, 1, 1,
0.2499923, 0.5695794, 2.373307, 1, 1, 1, 1, 1,
0.252653, -0.442769, 2.844146, 0, 0, 1, 1, 1,
0.2527731, 0.2001691, 1.406132, 1, 0, 0, 1, 1,
0.2543269, -0.1248665, 2.237729, 1, 0, 0, 1, 1,
0.2555907, -1.950735, 2.803818, 1, 0, 0, 1, 1,
0.2571832, 1.616456, 0.5640246, 1, 0, 0, 1, 1,
0.2620874, -0.4149859, 2.627253, 1, 0, 0, 1, 1,
0.2636757, -0.3845946, 2.182911, 0, 0, 0, 1, 1,
0.2664978, 1.129137, -0.1415979, 0, 0, 0, 1, 1,
0.268454, 2.352369, -0.3305035, 0, 0, 0, 1, 1,
0.2695489, -1.545145, 3.911776, 0, 0, 0, 1, 1,
0.2717577, -1.035429, 5.219799, 0, 0, 0, 1, 1,
0.2739975, -0.3648547, 1.577862, 0, 0, 0, 1, 1,
0.2780473, -0.8761478, 4.383535, 0, 0, 0, 1, 1,
0.2806282, -0.1173738, 1.177146, 1, 1, 1, 1, 1,
0.2814126, -0.4673934, 3.11141, 1, 1, 1, 1, 1,
0.2844764, 1.212548, 0.9131911, 1, 1, 1, 1, 1,
0.2865541, 2.223736, -0.6913108, 1, 1, 1, 1, 1,
0.2896762, -0.1914377, 2.471318, 1, 1, 1, 1, 1,
0.2898559, -1.208754, 2.197489, 1, 1, 1, 1, 1,
0.2906144, 0.2795343, -0.6471332, 1, 1, 1, 1, 1,
0.2990702, -0.4402555, 3.444152, 1, 1, 1, 1, 1,
0.2995335, -0.07287433, 2.811862, 1, 1, 1, 1, 1,
0.2999651, 1.625533, 0.3700714, 1, 1, 1, 1, 1,
0.3052687, -1.739065, 2.852367, 1, 1, 1, 1, 1,
0.3096542, 1.099808, 0.9727303, 1, 1, 1, 1, 1,
0.3131917, 0.1861296, 0.4478503, 1, 1, 1, 1, 1,
0.3133266, 0.3240967, 0.4357699, 1, 1, 1, 1, 1,
0.3161742, 0.970464, -1.697647, 1, 1, 1, 1, 1,
0.3163991, 0.1949054, 0.4884928, 0, 0, 1, 1, 1,
0.3176919, 0.1407949, 1.343468, 1, 0, 0, 1, 1,
0.3208671, 1.365374, 0.2190144, 1, 0, 0, 1, 1,
0.3238393, -1.327144, 1.579294, 1, 0, 0, 1, 1,
0.3270676, -0.1892277, 2.540383, 1, 0, 0, 1, 1,
0.3273579, 1.174769, 0.5150887, 1, 0, 0, 1, 1,
0.3275004, 0.1395498, 0.927827, 0, 0, 0, 1, 1,
0.3281775, -1.20495, 2.474443, 0, 0, 0, 1, 1,
0.3302908, 0.3769179, -0.04915399, 0, 0, 0, 1, 1,
0.3319595, 2.332842, 0.08865274, 0, 0, 0, 1, 1,
0.3325607, 0.8666331, 0.06011522, 0, 0, 0, 1, 1,
0.3341364, 0.5888343, -1.228774, 0, 0, 0, 1, 1,
0.3353686, 0.001213193, 1.855483, 0, 0, 0, 1, 1,
0.3432997, 0.233086, 0.7834696, 1, 1, 1, 1, 1,
0.3467123, -0.5949095, 2.757585, 1, 1, 1, 1, 1,
0.350467, 1.741827, 1.387874, 1, 1, 1, 1, 1,
0.351597, 0.8681228, -0.7162139, 1, 1, 1, 1, 1,
0.3556752, 0.2600372, 1.811934, 1, 1, 1, 1, 1,
0.3615567, -1.342646, 4.031877, 1, 1, 1, 1, 1,
0.3623545, -0.7091995, 3.612499, 1, 1, 1, 1, 1,
0.3699702, -0.9409448, 3.379959, 1, 1, 1, 1, 1,
0.371402, -0.379261, 2.023561, 1, 1, 1, 1, 1,
0.3722357, -0.8930807, 3.232869, 1, 1, 1, 1, 1,
0.3791404, -0.8848411, 4.019471, 1, 1, 1, 1, 1,
0.3806807, -0.6436931, 1.37821, 1, 1, 1, 1, 1,
0.3846743, -0.08567051, 1.739113, 1, 1, 1, 1, 1,
0.3847919, -1.235446, 1.949017, 1, 1, 1, 1, 1,
0.3857577, 0.08154967, 0.8097089, 1, 1, 1, 1, 1,
0.3863413, -0.1829184, 1.522367, 0, 0, 1, 1, 1,
0.3904834, 0.07585788, 1.815539, 1, 0, 0, 1, 1,
0.3917888, 0.7976518, -1.109963, 1, 0, 0, 1, 1,
0.3939629, 0.0224957, 0.3574277, 1, 0, 0, 1, 1,
0.3949424, 1.162829, -1.039417, 1, 0, 0, 1, 1,
0.3954883, 1.175259, 2.516484, 1, 0, 0, 1, 1,
0.3966458, 0.8684953, 1.14311, 0, 0, 0, 1, 1,
0.3982287, -1.271618, 2.309244, 0, 0, 0, 1, 1,
0.4014221, 1.160622, -0.06328539, 0, 0, 0, 1, 1,
0.4014472, -0.4825247, 3.35216, 0, 0, 0, 1, 1,
0.4027891, -1.04083, 3.624282, 0, 0, 0, 1, 1,
0.4084324, -0.3028271, 2.327978, 0, 0, 0, 1, 1,
0.4124624, 1.386463, 0.2356628, 0, 0, 0, 1, 1,
0.4220659, -0.5724217, 1.780742, 1, 1, 1, 1, 1,
0.4227078, -0.9745528, 2.376295, 1, 1, 1, 1, 1,
0.423378, -1.014164, 2.612699, 1, 1, 1, 1, 1,
0.4249919, -2.22544, 3.21125, 1, 1, 1, 1, 1,
0.4292411, 1.213233, -0.06483485, 1, 1, 1, 1, 1,
0.4328715, -0.1548533, 1.946432, 1, 1, 1, 1, 1,
0.4361371, -0.4688987, 2.753288, 1, 1, 1, 1, 1,
0.4376994, -0.6603585, 2.307187, 1, 1, 1, 1, 1,
0.4419902, 1.665412, -0.09779735, 1, 1, 1, 1, 1,
0.4439135, 0.2435752, -0.5969428, 1, 1, 1, 1, 1,
0.4442901, -0.5668117, 2.75403, 1, 1, 1, 1, 1,
0.4600041, 0.05035431, 0.8375177, 1, 1, 1, 1, 1,
0.4609558, 1.267378, -1.422479, 1, 1, 1, 1, 1,
0.4661958, 1.795445, -0.3065616, 1, 1, 1, 1, 1,
0.4691634, -1.15926, 3.864743, 1, 1, 1, 1, 1,
0.4719709, 1.986097, -0.867044, 0, 0, 1, 1, 1,
0.4834333, -0.1983368, 2.700365, 1, 0, 0, 1, 1,
0.4857013, 1.01602, -1.235718, 1, 0, 0, 1, 1,
0.4872238, 0.3965117, 0.4328806, 1, 0, 0, 1, 1,
0.4884579, 0.7181234, 0.6078851, 1, 0, 0, 1, 1,
0.4921953, 0.2139971, 2.215833, 1, 0, 0, 1, 1,
0.4936537, -0.2553613, 3.294008, 0, 0, 0, 1, 1,
0.4942586, 0.6784775, 0.1571922, 0, 0, 0, 1, 1,
0.4989667, -0.6025442, 3.039902, 0, 0, 0, 1, 1,
0.5055668, 0.4889153, 0.8634384, 0, 0, 0, 1, 1,
0.5106336, 2.513564, 2.388491, 0, 0, 0, 1, 1,
0.5127144, 0.2321388, 1.171004, 0, 0, 0, 1, 1,
0.5136515, -0.6245074, 2.777325, 0, 0, 0, 1, 1,
0.5162081, -0.145994, 1.989897, 1, 1, 1, 1, 1,
0.516476, -0.1544635, 1.820061, 1, 1, 1, 1, 1,
0.5166599, -0.3410021, 3.681042, 1, 1, 1, 1, 1,
0.5201557, -0.4685572, 2.384552, 1, 1, 1, 1, 1,
0.5209333, -0.9386093, 2.926068, 1, 1, 1, 1, 1,
0.5249492, -1.618937, 3.204212, 1, 1, 1, 1, 1,
0.5253074, 1.019135, 1.205725, 1, 1, 1, 1, 1,
0.5261877, -0.7820968, 2.49225, 1, 1, 1, 1, 1,
0.5266457, -0.4699004, 1.841283, 1, 1, 1, 1, 1,
0.5273232, -0.4806481, 1.675233, 1, 1, 1, 1, 1,
0.5285928, -1.150877, 3.375163, 1, 1, 1, 1, 1,
0.5357562, 0.3650957, 2.808566, 1, 1, 1, 1, 1,
0.5411734, -0.2013356, 0.8254681, 1, 1, 1, 1, 1,
0.5436418, 0.8428755, 1.114353, 1, 1, 1, 1, 1,
0.544655, -0.4166093, 2.409249, 1, 1, 1, 1, 1,
0.5449806, 0.2355914, 1.155256, 0, 0, 1, 1, 1,
0.5451161, -1.811553, 3.646703, 1, 0, 0, 1, 1,
0.5458162, -1.00726, 2.622534, 1, 0, 0, 1, 1,
0.5467251, 0.2310974, 0.1290693, 1, 0, 0, 1, 1,
0.5473989, 1.624779, -1.648939, 1, 0, 0, 1, 1,
0.5493352, -0.877534, 2.252685, 1, 0, 0, 1, 1,
0.5556862, 0.9589001, 0.4778031, 0, 0, 0, 1, 1,
0.5586211, -1.024327, 3.952015, 0, 0, 0, 1, 1,
0.567043, -0.615362, 3.001271, 0, 0, 0, 1, 1,
0.5697914, 0.6069536, 0.5939232, 0, 0, 0, 1, 1,
0.5700798, 0.5075189, 1.437577, 0, 0, 0, 1, 1,
0.5703261, -1.626882, 2.740202, 0, 0, 0, 1, 1,
0.5744603, -0.9007255, 2.637773, 0, 0, 0, 1, 1,
0.5788365, -0.8191313, 2.655499, 1, 1, 1, 1, 1,
0.5792713, 0.4784075, 1.126347, 1, 1, 1, 1, 1,
0.5824661, 0.182621, -0.6675943, 1, 1, 1, 1, 1,
0.5840948, -1.277889, 4.154014, 1, 1, 1, 1, 1,
0.5880056, 0.003779468, 2.058954, 1, 1, 1, 1, 1,
0.5882029, 2.885231, -1.237748, 1, 1, 1, 1, 1,
0.5922593, 0.1037977, 3.706857, 1, 1, 1, 1, 1,
0.5943938, -0.0285343, 1.297039, 1, 1, 1, 1, 1,
0.5951789, -0.6896868, 3.783056, 1, 1, 1, 1, 1,
0.5963923, -0.4168005, 1.20832, 1, 1, 1, 1, 1,
0.5967736, -0.2893457, 1.785405, 1, 1, 1, 1, 1,
0.6007419, -1.051189, 1.593988, 1, 1, 1, 1, 1,
0.6013238, 0.3362726, 1.956235, 1, 1, 1, 1, 1,
0.6104084, -1.153265, 1.595668, 1, 1, 1, 1, 1,
0.6104901, 0.8292391, 0.5093777, 1, 1, 1, 1, 1,
0.6174508, -0.3743044, 2.496756, 0, 0, 1, 1, 1,
0.6176254, -1.114837, 1.917731, 1, 0, 0, 1, 1,
0.6179424, -1.470145, 1.587286, 1, 0, 0, 1, 1,
0.6212078, 0.09958766, 1.651155, 1, 0, 0, 1, 1,
0.6292301, 0.3173339, 0.04280759, 1, 0, 0, 1, 1,
0.6302577, -0.6725065, 1.750353, 1, 0, 0, 1, 1,
0.6322913, 0.6781322, -0.06925816, 0, 0, 0, 1, 1,
0.6368133, -0.03375015, 2.257436, 0, 0, 0, 1, 1,
0.6451226, -0.1721378, 1.759079, 0, 0, 0, 1, 1,
0.6489432, -0.6148211, 0.932439, 0, 0, 0, 1, 1,
0.6562683, -1.445043, 3.61379, 0, 0, 0, 1, 1,
0.6581583, 0.9769765, 1.136561, 0, 0, 0, 1, 1,
0.6604152, -1.141139, 1.414978, 0, 0, 0, 1, 1,
0.6614535, 1.679002, 0.5830979, 1, 1, 1, 1, 1,
0.6617074, 0.4913932, 1.78549, 1, 1, 1, 1, 1,
0.6723979, -1.022092, 4.665251, 1, 1, 1, 1, 1,
0.6753974, 1.289095, 1.093306, 1, 1, 1, 1, 1,
0.6817525, 1.567206, -0.09042098, 1, 1, 1, 1, 1,
0.6863252, -0.9591944, 1.243745, 1, 1, 1, 1, 1,
0.6918103, -1.715088, 2.134597, 1, 1, 1, 1, 1,
0.6939655, 1.149039, 0.4391781, 1, 1, 1, 1, 1,
0.6980531, -1.818543, 2.784348, 1, 1, 1, 1, 1,
0.7063727, 0.811904, -0.1406118, 1, 1, 1, 1, 1,
0.708257, 0.3704436, 0.6684533, 1, 1, 1, 1, 1,
0.7109435, -0.7161661, 3.472556, 1, 1, 1, 1, 1,
0.7123646, -2.24095, 2.617634, 1, 1, 1, 1, 1,
0.7130075, -0.9699296, 1.721119, 1, 1, 1, 1, 1,
0.7147487, 0.840466, 1.878995, 1, 1, 1, 1, 1,
0.7168601, 0.365321, 1.748307, 0, 0, 1, 1, 1,
0.7180851, -0.05389595, 1.281091, 1, 0, 0, 1, 1,
0.7186347, -0.2983645, 3.229619, 1, 0, 0, 1, 1,
0.7229148, 0.5071234, 0.4664827, 1, 0, 0, 1, 1,
0.7243527, -0.3631956, 1.769284, 1, 0, 0, 1, 1,
0.7288328, -0.5659974, 3.052749, 1, 0, 0, 1, 1,
0.7364789, -1.115142, 1.205386, 0, 0, 0, 1, 1,
0.7485311, -1.336817, 2.08864, 0, 0, 0, 1, 1,
0.7485405, -0.1761446, 2.187726, 0, 0, 0, 1, 1,
0.7500976, -1.513044, 2.383075, 0, 0, 0, 1, 1,
0.7533123, 1.125339, 0.7422531, 0, 0, 0, 1, 1,
0.7533544, 0.6341039, 0.4578429, 0, 0, 0, 1, 1,
0.7544871, 1.415727, -1.800167, 0, 0, 0, 1, 1,
0.7555819, -0.7694051, 2.142901, 1, 1, 1, 1, 1,
0.7618504, -0.4550166, 2.367208, 1, 1, 1, 1, 1,
0.7632536, -0.537907, 0.9535397, 1, 1, 1, 1, 1,
0.7677237, 0.7806984, 0.314331, 1, 1, 1, 1, 1,
0.7688124, 1.165447, 0.2096208, 1, 1, 1, 1, 1,
0.7746938, -0.04221255, 2.498207, 1, 1, 1, 1, 1,
0.7776791, 0.659137, -0.5018909, 1, 1, 1, 1, 1,
0.7782381, -1.060167, 1.416214, 1, 1, 1, 1, 1,
0.7845088, 0.3361255, 0.8430738, 1, 1, 1, 1, 1,
0.7851398, -0.7657768, 2.195853, 1, 1, 1, 1, 1,
0.7857974, -0.3258764, 0.05440763, 1, 1, 1, 1, 1,
0.7859945, 2.217256, -0.5237417, 1, 1, 1, 1, 1,
0.7864335, -0.3827098, 1.127317, 1, 1, 1, 1, 1,
0.7893797, 0.6919656, 0.7687666, 1, 1, 1, 1, 1,
0.7935355, -1.594799, 4.1839, 1, 1, 1, 1, 1,
0.7938904, 0.4453391, -0.7674351, 0, 0, 1, 1, 1,
0.8054509, -0.816186, 2.568587, 1, 0, 0, 1, 1,
0.8062641, -1.057889, 2.978956, 1, 0, 0, 1, 1,
0.8082561, -0.04271729, 2.590142, 1, 0, 0, 1, 1,
0.8100814, -0.3842058, 0.3159636, 1, 0, 0, 1, 1,
0.8135527, -1.101428, 3.456252, 1, 0, 0, 1, 1,
0.8155175, 1.303901, 1.048276, 0, 0, 0, 1, 1,
0.8195713, -0.9887041, 0.6429744, 0, 0, 0, 1, 1,
0.8229645, -0.8583527, 2.616124, 0, 0, 0, 1, 1,
0.8262876, -0.0002693729, 1.694814, 0, 0, 0, 1, 1,
0.8278063, 1.738219, 0.03280196, 0, 0, 0, 1, 1,
0.8461699, 0.350925, -0.2228424, 0, 0, 0, 1, 1,
0.8603172, -0.1602401, 0.6092399, 0, 0, 0, 1, 1,
0.8643373, 0.6052142, -1.111198, 1, 1, 1, 1, 1,
0.864629, 0.4285693, 2.076107, 1, 1, 1, 1, 1,
0.8677475, -1.565517, 3.516512, 1, 1, 1, 1, 1,
0.8679564, -1.414008, 1.321044, 1, 1, 1, 1, 1,
0.8694323, -0.1683965, 1.867215, 1, 1, 1, 1, 1,
0.8729796, -0.2642396, 2.009214, 1, 1, 1, 1, 1,
0.8776441, -0.7832366, 1.907936, 1, 1, 1, 1, 1,
0.8834718, 0.1927716, 0.168795, 1, 1, 1, 1, 1,
0.8841769, 0.2272655, 1.277364, 1, 1, 1, 1, 1,
0.8881748, -0.5452009, 3.140565, 1, 1, 1, 1, 1,
0.8893052, -0.3864261, 2.415961, 1, 1, 1, 1, 1,
0.8944469, -1.312052, 1.36756, 1, 1, 1, 1, 1,
0.9034443, -0.01470662, 0.4300928, 1, 1, 1, 1, 1,
0.9052145, 2.247846, -0.1423298, 1, 1, 1, 1, 1,
0.905404, 0.1924275, -0.2828276, 1, 1, 1, 1, 1,
0.9061916, -1.483157, 2.65465, 0, 0, 1, 1, 1,
0.9087599, -0.4708795, 3.702053, 1, 0, 0, 1, 1,
0.9101052, 0.2535495, 0.2395297, 1, 0, 0, 1, 1,
0.917722, 0.5721422, 0.6147414, 1, 0, 0, 1, 1,
0.9191013, -0.238341, 1.625498, 1, 0, 0, 1, 1,
0.9248661, -0.1710076, 1.396491, 1, 0, 0, 1, 1,
0.9251563, -0.8775216, 2.654546, 0, 0, 0, 1, 1,
0.9267102, 0.2588024, 1.131752, 0, 0, 0, 1, 1,
0.9279315, 0.08655181, 1.273369, 0, 0, 0, 1, 1,
0.9298368, -0.5557731, 1.838163, 0, 0, 0, 1, 1,
0.9299974, -2.238849, 3.020975, 0, 0, 0, 1, 1,
0.9404777, -0.4820832, 1.551198, 0, 0, 0, 1, 1,
0.9407054, 1.392155, 1.130054, 0, 0, 0, 1, 1,
0.9457802, 0.9805356, 0.6908752, 1, 1, 1, 1, 1,
0.9530697, -1.729249, 2.213465, 1, 1, 1, 1, 1,
0.9536657, 1.091864, 1.634309, 1, 1, 1, 1, 1,
0.9635718, -0.05229888, 1.00749, 1, 1, 1, 1, 1,
0.9648458, -0.5041331, 1.292148, 1, 1, 1, 1, 1,
0.967394, 0.5380204, 2.477354, 1, 1, 1, 1, 1,
0.9692905, -0.509904, 1.244701, 1, 1, 1, 1, 1,
0.9723832, -0.7892173, 1.144862, 1, 1, 1, 1, 1,
0.9798085, -1.598705, 3.355479, 1, 1, 1, 1, 1,
0.985487, -0.5721241, 1.851185, 1, 1, 1, 1, 1,
0.9860849, 0.8453897, 1.184305, 1, 1, 1, 1, 1,
0.9954067, 1.10679, 1.546475, 1, 1, 1, 1, 1,
1.005955, -0.1722756, 0.5478452, 1, 1, 1, 1, 1,
1.01272, 0.8861177, 0.8127997, 1, 1, 1, 1, 1,
1.018867, 0.04946268, 1.614596, 1, 1, 1, 1, 1,
1.036907, -0.2833413, 2.187651, 0, 0, 1, 1, 1,
1.041927, -1.125078, 2.039631, 1, 0, 0, 1, 1,
1.062817, 0.5243214, 1.030699, 1, 0, 0, 1, 1,
1.063198, 0.4263029, 2.05051, 1, 0, 0, 1, 1,
1.063902, -0.4579981, 2.235456, 1, 0, 0, 1, 1,
1.071792, -0.07206688, 2.18166, 1, 0, 0, 1, 1,
1.073275, -0.5339862, 2.118252, 0, 0, 0, 1, 1,
1.080846, -1.876272, 3.099809, 0, 0, 0, 1, 1,
1.083854, 0.5440818, 2.040542, 0, 0, 0, 1, 1,
1.086176, 0.4706457, -0.2396413, 0, 0, 0, 1, 1,
1.08824, 0.9626491, 2.840444, 0, 0, 0, 1, 1,
1.090687, 3.143346, 1.213795, 0, 0, 0, 1, 1,
1.098659, 0.5006506, -0.2383209, 0, 0, 0, 1, 1,
1.098766, 0.2089854, 0.7870168, 1, 1, 1, 1, 1,
1.101438, -0.7503704, 2.071037, 1, 1, 1, 1, 1,
1.102412, -0.2582485, 2.208102, 1, 1, 1, 1, 1,
1.102857, 1.45669, 0.3928168, 1, 1, 1, 1, 1,
1.104217, 0.02001945, 1.494253, 1, 1, 1, 1, 1,
1.107531, -0.3089858, 3.610375, 1, 1, 1, 1, 1,
1.112181, 1.022197, 1.872939, 1, 1, 1, 1, 1,
1.120234, -1.137734, 2.095415, 1, 1, 1, 1, 1,
1.139817, -1.43789, 2.404973, 1, 1, 1, 1, 1,
1.139857, -0.08811955, 1.829413, 1, 1, 1, 1, 1,
1.140252, 1.337369, -0.05119984, 1, 1, 1, 1, 1,
1.149, 0.1180407, 0.2878824, 1, 1, 1, 1, 1,
1.149527, 0.7518437, 1.767348, 1, 1, 1, 1, 1,
1.152082, -0.3864437, 2.434326, 1, 1, 1, 1, 1,
1.157249, 1.053247, -0.9263579, 1, 1, 1, 1, 1,
1.159014, 1.458219, 1.358768, 0, 0, 1, 1, 1,
1.162041, -0.9183982, 3.727636, 1, 0, 0, 1, 1,
1.183236, -0.5029376, 1.979246, 1, 0, 0, 1, 1,
1.186887, 0.648863, 2.877545, 1, 0, 0, 1, 1,
1.192881, 1.259532, -0.02935338, 1, 0, 0, 1, 1,
1.195672, -0.01418775, 2.190242, 1, 0, 0, 1, 1,
1.196354, 0.4199021, -0.4179947, 0, 0, 0, 1, 1,
1.199544, 1.842685, 1.095509, 0, 0, 0, 1, 1,
1.21118, 2.938241, -0.172453, 0, 0, 0, 1, 1,
1.219635, -0.6175995, 1.46511, 0, 0, 0, 1, 1,
1.242863, -0.7250657, 1.717043, 0, 0, 0, 1, 1,
1.249573, -0.9941924, 0.5013976, 0, 0, 0, 1, 1,
1.260443, -0.03441655, 2.032111, 0, 0, 0, 1, 1,
1.264696, -0.5422993, 2.118846, 1, 1, 1, 1, 1,
1.268831, -0.1873814, 2.264431, 1, 1, 1, 1, 1,
1.27222, -1.202979, 2.975203, 1, 1, 1, 1, 1,
1.276253, 0.228095, 1.301063, 1, 1, 1, 1, 1,
1.290371, -0.1903349, -0.02763112, 1, 1, 1, 1, 1,
1.298982, 0.9785501, -0.08251843, 1, 1, 1, 1, 1,
1.300396, 1.245535, -0.2743627, 1, 1, 1, 1, 1,
1.305626, -1.057211, 1.895458, 1, 1, 1, 1, 1,
1.305828, 0.8279682, 0.8423871, 1, 1, 1, 1, 1,
1.313504, -0.5622064, 2.686795, 1, 1, 1, 1, 1,
1.328418, -1.17714, 1.637439, 1, 1, 1, 1, 1,
1.356949, 1.632484, -0.3470701, 1, 1, 1, 1, 1,
1.357074, -0.5648837, 3.633348, 1, 1, 1, 1, 1,
1.361987, 1.912717, 1.760877, 1, 1, 1, 1, 1,
1.364504, 0.1133248, 0.4870605, 1, 1, 1, 1, 1,
1.365475, 1.430871, 0.5678099, 0, 0, 1, 1, 1,
1.368504, -1.409614, 1.611963, 1, 0, 0, 1, 1,
1.369049, 1.489178, 1.767115, 1, 0, 0, 1, 1,
1.371183, -0.02878568, 1.160651, 1, 0, 0, 1, 1,
1.376653, -0.4119969, 2.206396, 1, 0, 0, 1, 1,
1.380743, 0.1388671, 3.802116, 1, 0, 0, 1, 1,
1.383031, -0.1886956, 1.482729, 0, 0, 0, 1, 1,
1.383682, -0.9559528, 1.941684, 0, 0, 0, 1, 1,
1.38513, -2.514309, 0.9249464, 0, 0, 0, 1, 1,
1.387596, -0.4414385, 2.124115, 0, 0, 0, 1, 1,
1.392141, -0.3067633, 1.198458, 0, 0, 0, 1, 1,
1.392562, 0.03572444, 2.371215, 0, 0, 0, 1, 1,
1.397295, 0.1471881, 2.057762, 0, 0, 0, 1, 1,
1.397539, -0.4484682, 1.981588, 1, 1, 1, 1, 1,
1.403815, 0.1837187, 2.943517, 1, 1, 1, 1, 1,
1.405712, -0.118595, 2.532271, 1, 1, 1, 1, 1,
1.405751, 1.579797, 0.06313982, 1, 1, 1, 1, 1,
1.421422, 0.4683633, 0.001560306, 1, 1, 1, 1, 1,
1.441561, 0.4824195, 0.7580873, 1, 1, 1, 1, 1,
1.447958, 1.11688, -0.9274664, 1, 1, 1, 1, 1,
1.451959, -0.8483094, 0.7229339, 1, 1, 1, 1, 1,
1.461009, -0.06665249, 0.3526691, 1, 1, 1, 1, 1,
1.463709, 0.07189811, 0.7565121, 1, 1, 1, 1, 1,
1.475239, 0.1239852, 2.195638, 1, 1, 1, 1, 1,
1.48526, 0.4049141, 0.8567839, 1, 1, 1, 1, 1,
1.48561, -0.1209371, 1.443047, 1, 1, 1, 1, 1,
1.492034, -0.7024845, 2.622327, 1, 1, 1, 1, 1,
1.515136, 1.058907, 0.4731557, 1, 1, 1, 1, 1,
1.515354, -0.2623997, 2.681367, 0, 0, 1, 1, 1,
1.535543, 0.4302073, 0.07723296, 1, 0, 0, 1, 1,
1.538863, 1.342797, 0.3722844, 1, 0, 0, 1, 1,
1.554198, -0.8108388, 0.9924118, 1, 0, 0, 1, 1,
1.558405, 1.228749, 0.5125867, 1, 0, 0, 1, 1,
1.567525, -0.4488515, 1.50482, 1, 0, 0, 1, 1,
1.567698, 0.9961383, 1.755266, 0, 0, 0, 1, 1,
1.569368, 1.129176, 0.6697157, 0, 0, 0, 1, 1,
1.569888, 0.6704783, 1.986929, 0, 0, 0, 1, 1,
1.570153, 1.145508, 0.6455038, 0, 0, 0, 1, 1,
1.572637, -1.296142, 2.947881, 0, 0, 0, 1, 1,
1.578329, 1.182659, 2.284462, 0, 0, 0, 1, 1,
1.583306, -0.1935133, 2.817376, 0, 0, 0, 1, 1,
1.585338, -0.5033809, 3.952332, 1, 1, 1, 1, 1,
1.585701, -1.460255, 2.704466, 1, 1, 1, 1, 1,
1.589235, -0.4079617, 0.9321046, 1, 1, 1, 1, 1,
1.593516, -1.015923, 4.39751, 1, 1, 1, 1, 1,
1.602502, -0.4874804, 3.19579, 1, 1, 1, 1, 1,
1.616323, -0.5397552, 0.7904633, 1, 1, 1, 1, 1,
1.620988, -0.01883912, 2.58514, 1, 1, 1, 1, 1,
1.624423, -0.8252345, 0.3497949, 1, 1, 1, 1, 1,
1.628579, 0.007541541, 1.396906, 1, 1, 1, 1, 1,
1.657183, -0.6651888, 0.9778037, 1, 1, 1, 1, 1,
1.657426, -0.6376649, 2.248867, 1, 1, 1, 1, 1,
1.659545, -0.4946968, 3.364523, 1, 1, 1, 1, 1,
1.670972, -0.5573823, 1.004493, 1, 1, 1, 1, 1,
1.679398, 0.988757, 1.02807, 1, 1, 1, 1, 1,
1.702503, 0.1676595, 1.723233, 1, 1, 1, 1, 1,
1.714873, -0.6502093, 0.788891, 0, 0, 1, 1, 1,
1.72062, -1.219147, 4.659459, 1, 0, 0, 1, 1,
1.784788, 1.444175, 2.656096, 1, 0, 0, 1, 1,
1.805667, -1.566081, 1.728223, 1, 0, 0, 1, 1,
1.815707, 0.1906605, 1.309955, 1, 0, 0, 1, 1,
1.820333, 0.3741693, 2.064305, 1, 0, 0, 1, 1,
1.824385, 1.663524, 0.7881684, 0, 0, 0, 1, 1,
1.827983, -2.118012, 4.19176, 0, 0, 0, 1, 1,
1.832833, 2.265665, 1.499614, 0, 0, 0, 1, 1,
1.847964, 0.7445332, 0.7017727, 0, 0, 0, 1, 1,
1.882002, -1.440126, 1.767046, 0, 0, 0, 1, 1,
1.90441, -0.8648617, 2.183497, 0, 0, 0, 1, 1,
1.917441, -0.6551279, 2.307325, 0, 0, 0, 1, 1,
1.927867, -1.553845, 1.911892, 1, 1, 1, 1, 1,
1.966347, 0.7779275, 0.9137431, 1, 1, 1, 1, 1,
2.017879, -0.9301689, 1.233262, 1, 1, 1, 1, 1,
2.045673, -1.946212, 3.423541, 1, 1, 1, 1, 1,
2.117105, -1.319616, 0.8955028, 1, 1, 1, 1, 1,
2.129885, 0.6169699, 0.8484997, 1, 1, 1, 1, 1,
2.13736, -0.9129171, 4.021774, 1, 1, 1, 1, 1,
2.141554, -0.6513882, 3.21593, 1, 1, 1, 1, 1,
2.166959, -1.440931, 4.682225, 1, 1, 1, 1, 1,
2.167595, 0.6090825, 1.179628, 1, 1, 1, 1, 1,
2.180553, -0.04864293, 1.993746, 1, 1, 1, 1, 1,
2.196703, -0.9601183, 2.156353, 1, 1, 1, 1, 1,
2.202489, -0.1773272, 1.552799, 1, 1, 1, 1, 1,
2.210325, 0.9766144, 1.008394, 1, 1, 1, 1, 1,
2.211268, -0.388601, 2.82281, 1, 1, 1, 1, 1,
2.216089, -0.5834411, 2.803533, 0, 0, 1, 1, 1,
2.220588, 0.02535421, 0.6138718, 1, 0, 0, 1, 1,
2.226748, -0.1893223, 2.78363, 1, 0, 0, 1, 1,
2.290737, 1.034542, 0.9841409, 1, 0, 0, 1, 1,
2.359628, -0.9024127, 0.3540407, 1, 0, 0, 1, 1,
2.433182, -1.346823, 1.871408, 1, 0, 0, 1, 1,
2.46503, 0.2749119, 1.930525, 0, 0, 0, 1, 1,
2.512461, 2.137368, 0.309673, 0, 0, 0, 1, 1,
2.538751, 0.8057387, 0.6429838, 0, 0, 0, 1, 1,
2.617171, 1.827057, 0.5529644, 0, 0, 0, 1, 1,
2.689275, 0.7060229, 2.516229, 0, 0, 0, 1, 1,
2.693274, 1.21002, -0.2071169, 0, 0, 0, 1, 1,
2.7236, 0.3329884, 1.329283, 0, 0, 0, 1, 1,
2.732106, 0.635307, 2.458694, 1, 1, 1, 1, 1,
2.766529, 0.8423836, 1.942136, 1, 1, 1, 1, 1,
2.881001, -0.6686214, 0.7085314, 1, 1, 1, 1, 1,
2.937689, -0.8410413, 2.227527, 1, 1, 1, 1, 1,
2.944602, -1.121008, 3.104435, 1, 1, 1, 1, 1,
3.212239, -0.4861658, 2.236135, 1, 1, 1, 1, 1,
3.216418, -1.342839, 0.948534, 1, 1, 1, 1, 1
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
var radius = 9.843821;
var distance = 34.57601;
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
mvMatrix.translate( 0.1361029, -0.04928994, 0.4144197 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.57601);
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