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
-2.985424, -0.08868067, -2.085551, 1, 0, 0, 1,
-2.912439, -2.780334, -4.439715, 1, 0.007843138, 0, 1,
-2.662975, -0.2142338, -1.973165, 1, 0.01176471, 0, 1,
-2.646957, 0.6129532, -2.19838, 1, 0.01960784, 0, 1,
-2.585771, -1.453556, -0.7812295, 1, 0.02352941, 0, 1,
-2.565743, 1.01549, -1.204448, 1, 0.03137255, 0, 1,
-2.522109, 0.3639229, -1.360193, 1, 0.03529412, 0, 1,
-2.465726, -0.5172869, -2.816801, 1, 0.04313726, 0, 1,
-2.426951, 2.518785, -1.545952, 1, 0.04705882, 0, 1,
-2.418214, -0.2806498, 0.2627241, 1, 0.05490196, 0, 1,
-2.417844, -0.7769046, -2.375232, 1, 0.05882353, 0, 1,
-2.32919, 0.6833817, -1.755181, 1, 0.06666667, 0, 1,
-2.295053, 0.8958614, -0.2222624, 1, 0.07058824, 0, 1,
-2.293973, -1.56985, -2.077961, 1, 0.07843138, 0, 1,
-2.23962, 0.360666, -1.679679, 1, 0.08235294, 0, 1,
-2.208766, -0.2691428, 0.2467999, 1, 0.09019608, 0, 1,
-2.176754, -0.4770991, -2.226292, 1, 0.09411765, 0, 1,
-2.173541, -1.134954, -3.32012, 1, 0.1019608, 0, 1,
-2.169192, -0.4383928, -0.7295471, 1, 0.1098039, 0, 1,
-2.15823, -2.069486, -3.666987, 1, 0.1137255, 0, 1,
-2.089533, 0.4896535, -0.2868121, 1, 0.1215686, 0, 1,
-2.087628, 0.5328708, -0.9126972, 1, 0.1254902, 0, 1,
-2.075758, 0.4609953, -1.775556, 1, 0.1333333, 0, 1,
-2.048778, 1.128942, -0.9212261, 1, 0.1372549, 0, 1,
-1.97464, -0.03804965, 0.01014458, 1, 0.145098, 0, 1,
-1.974354, -0.4945373, -0.7936067, 1, 0.1490196, 0, 1,
-1.962267, -0.7164888, -1.183548, 1, 0.1568628, 0, 1,
-1.959723, -0.7010087, -2.861031, 1, 0.1607843, 0, 1,
-1.923405, -1.142869, -3.460482, 1, 0.1686275, 0, 1,
-1.913339, 1.285344, -2.115871, 1, 0.172549, 0, 1,
-1.908055, -2.188434, -2.175756, 1, 0.1803922, 0, 1,
-1.89486, 0.4397769, 0.2819867, 1, 0.1843137, 0, 1,
-1.888496, 0.8641952, -1.299604, 1, 0.1921569, 0, 1,
-1.886229, -0.6586255, -1.528217, 1, 0.1960784, 0, 1,
-1.874271, 1.403571, -1.875792, 1, 0.2039216, 0, 1,
-1.848558, 1.145444, -1.078423, 1, 0.2117647, 0, 1,
-1.839219, 0.3233733, -2.218417, 1, 0.2156863, 0, 1,
-1.803552, 1.399286, -1.783141, 1, 0.2235294, 0, 1,
-1.798247, -1.277047, -2.702085, 1, 0.227451, 0, 1,
-1.785547, -0.5599744, -3.355814, 1, 0.2352941, 0, 1,
-1.761315, 1.696923, -1.249343, 1, 0.2392157, 0, 1,
-1.758598, 0.9377688, -1.546023, 1, 0.2470588, 0, 1,
-1.73914, -1.059149, -2.244171, 1, 0.2509804, 0, 1,
-1.737742, 1.173829, -1.243433, 1, 0.2588235, 0, 1,
-1.726629, 0.5861928, -0.6707096, 1, 0.2627451, 0, 1,
-1.713805, 2.302404, -2.118955, 1, 0.2705882, 0, 1,
-1.713793, 1.298926, -0.3637294, 1, 0.2745098, 0, 1,
-1.701395, 0.9557298, -2.215692, 1, 0.282353, 0, 1,
-1.687613, 2.325275, 0.2197202, 1, 0.2862745, 0, 1,
-1.68567, 0.9032851, -0.7460639, 1, 0.2941177, 0, 1,
-1.660406, 0.6056529, -0.6072366, 1, 0.3019608, 0, 1,
-1.653553, 1.092936, -2.071255, 1, 0.3058824, 0, 1,
-1.65063, 0.1871686, -0.7033394, 1, 0.3137255, 0, 1,
-1.645282, -0.2102371, -1.784445, 1, 0.3176471, 0, 1,
-1.64169, -0.8004746, -1.666614, 1, 0.3254902, 0, 1,
-1.632948, -0.2377005, -0.08169962, 1, 0.3294118, 0, 1,
-1.619416, 0.2325278, -1.799116, 1, 0.3372549, 0, 1,
-1.604026, 0.193982, -0.8861757, 1, 0.3411765, 0, 1,
-1.595887, 0.3201806, -1.212246, 1, 0.3490196, 0, 1,
-1.584655, 0.769859, -1.937731, 1, 0.3529412, 0, 1,
-1.579347, 0.17451, 0.7479833, 1, 0.3607843, 0, 1,
-1.575824, -0.5278161, -3.033352, 1, 0.3647059, 0, 1,
-1.562371, 1.89716, -1.431847, 1, 0.372549, 0, 1,
-1.56163, 0.4136442, -0.8295273, 1, 0.3764706, 0, 1,
-1.55659, 1.93503, 0.7005104, 1, 0.3843137, 0, 1,
-1.548458, -0.6665329, -1.227481, 1, 0.3882353, 0, 1,
-1.544749, 0.05112853, -1.5315, 1, 0.3960784, 0, 1,
-1.532115, -0.6345391, -0.1488829, 1, 0.4039216, 0, 1,
-1.53168, 1.769663, -1.052454, 1, 0.4078431, 0, 1,
-1.500856, -1.336099, -1.829711, 1, 0.4156863, 0, 1,
-1.495023, -0.1568866, -1.154993, 1, 0.4196078, 0, 1,
-1.493505, -1.029918, 0.1765672, 1, 0.427451, 0, 1,
-1.492774, -2.188339, -3.231918, 1, 0.4313726, 0, 1,
-1.48158, 0.5244451, -1.76488, 1, 0.4392157, 0, 1,
-1.475079, -0.05936697, -3.218719, 1, 0.4431373, 0, 1,
-1.466376, 0.8425725, -4.065388, 1, 0.4509804, 0, 1,
-1.465091, 0.4437683, -1.973441, 1, 0.454902, 0, 1,
-1.454962, -0.1190401, -1.479357, 1, 0.4627451, 0, 1,
-1.453842, -0.7665992, -1.595839, 1, 0.4666667, 0, 1,
-1.437687, -0.8027983, -2.171206, 1, 0.4745098, 0, 1,
-1.436358, -2.763626, -1.398896, 1, 0.4784314, 0, 1,
-1.431318, 0.5343872, -1.178889, 1, 0.4862745, 0, 1,
-1.421188, -1.644113, -3.463297, 1, 0.4901961, 0, 1,
-1.420776, 2.198498, -0.01471762, 1, 0.4980392, 0, 1,
-1.420433, -0.6279173, -1.264675, 1, 0.5058824, 0, 1,
-1.408948, -0.6891463, -3.263547, 1, 0.509804, 0, 1,
-1.406952, 0.3736505, -0.9014181, 1, 0.5176471, 0, 1,
-1.400363, -1.359226, -1.419456, 1, 0.5215687, 0, 1,
-1.399078, -0.5856555, -1.015928, 1, 0.5294118, 0, 1,
-1.397878, -0.05338387, -2.176345, 1, 0.5333334, 0, 1,
-1.392291, 0.4763506, -1.385785, 1, 0.5411765, 0, 1,
-1.381318, 0.546867, -2.262652, 1, 0.5450981, 0, 1,
-1.376431, -1.909891, -3.760337, 1, 0.5529412, 0, 1,
-1.375474, 0.1098407, -1.113192, 1, 0.5568628, 0, 1,
-1.374161, -0.1670038, -1.616525, 1, 0.5647059, 0, 1,
-1.369625, 0.7876896, -0.9012166, 1, 0.5686275, 0, 1,
-1.367356, 2.413156, -0.68635, 1, 0.5764706, 0, 1,
-1.366739, -2.30958, -3.717139, 1, 0.5803922, 0, 1,
-1.361223, 0.5673527, -1.896532, 1, 0.5882353, 0, 1,
-1.348269, 0.2549279, -2.148209, 1, 0.5921569, 0, 1,
-1.347865, -2.180533, -2.825943, 1, 0.6, 0, 1,
-1.340728, 0.5616727, -1.641749, 1, 0.6078432, 0, 1,
-1.333331, 1.290426, 0.04367191, 1, 0.6117647, 0, 1,
-1.324041, -0.009074514, -1.646839, 1, 0.6196079, 0, 1,
-1.320323, 1.258094, -0.8801288, 1, 0.6235294, 0, 1,
-1.317946, -0.5858626, -2.545642, 1, 0.6313726, 0, 1,
-1.316807, 0.4477729, -0.4519994, 1, 0.6352941, 0, 1,
-1.316159, 0.3992196, 0.7777531, 1, 0.6431373, 0, 1,
-1.316141, -2.014073, -1.024284, 1, 0.6470588, 0, 1,
-1.311196, 1.734641, -0.135809, 1, 0.654902, 0, 1,
-1.309034, -1.397738, -1.761135, 1, 0.6588235, 0, 1,
-1.294404, 1.41178, -0.5911573, 1, 0.6666667, 0, 1,
-1.284438, 1.250142, -1.228193, 1, 0.6705883, 0, 1,
-1.283553, -0.4641337, -4.018257, 1, 0.6784314, 0, 1,
-1.280393, -0.01050123, -0.4828516, 1, 0.682353, 0, 1,
-1.26618, 1.003193, 0.04271293, 1, 0.6901961, 0, 1,
-1.258928, -1.193949, -3.574752, 1, 0.6941177, 0, 1,
-1.258319, -1.416886, -1.588151, 1, 0.7019608, 0, 1,
-1.256663, -1.219775, -0.7584702, 1, 0.7098039, 0, 1,
-1.25612, 0.5472067, 0.5404276, 1, 0.7137255, 0, 1,
-1.254853, -1.088489, -1.918967, 1, 0.7215686, 0, 1,
-1.245163, -0.856041, -3.038807, 1, 0.7254902, 0, 1,
-1.233499, 0.2116519, -2.119765, 1, 0.7333333, 0, 1,
-1.230243, -0.296655, -1.996615, 1, 0.7372549, 0, 1,
-1.227272, -0.4990564, -1.307041, 1, 0.7450981, 0, 1,
-1.201867, -0.829952, -1.058725, 1, 0.7490196, 0, 1,
-1.19692, -0.7040234, -3.111463, 1, 0.7568628, 0, 1,
-1.195597, -0.9745833, -1.610786, 1, 0.7607843, 0, 1,
-1.195024, -0.9237798, -1.573999, 1, 0.7686275, 0, 1,
-1.19202, -0.9490113, -1.918334, 1, 0.772549, 0, 1,
-1.184703, 3.098414, 0.7726511, 1, 0.7803922, 0, 1,
-1.167199, -0.9292942, -2.75824, 1, 0.7843137, 0, 1,
-1.155887, -0.05826864, -4.906056, 1, 0.7921569, 0, 1,
-1.153919, -0.5687599, -2.723747, 1, 0.7960784, 0, 1,
-1.149927, 0.9117494, 0.1609947, 1, 0.8039216, 0, 1,
-1.146099, 0.8048691, -0.5214113, 1, 0.8117647, 0, 1,
-1.144596, 0.05705332, -2.150191, 1, 0.8156863, 0, 1,
-1.143237, -0.6980633, -3.621691, 1, 0.8235294, 0, 1,
-1.139417, -1.801012, -2.554278, 1, 0.827451, 0, 1,
-1.138342, 0.8717763, 0.7930565, 1, 0.8352941, 0, 1,
-1.130736, 0.3341747, 1.399448, 1, 0.8392157, 0, 1,
-1.130321, -0.2946124, -2.32496, 1, 0.8470588, 0, 1,
-1.121975, 2.256875, -0.6449878, 1, 0.8509804, 0, 1,
-1.115543, -1.450646, -2.797583, 1, 0.8588235, 0, 1,
-1.105658, -0.0728351, -1.677453, 1, 0.8627451, 0, 1,
-1.101973, 0.3431448, 0.7775652, 1, 0.8705882, 0, 1,
-1.099927, -1.413449, -2.486593, 1, 0.8745098, 0, 1,
-1.097238, -0.843628, -1.298326, 1, 0.8823529, 0, 1,
-1.091345, -0.180488, -0.5671952, 1, 0.8862745, 0, 1,
-1.082742, -1.427049, -3.355627, 1, 0.8941177, 0, 1,
-1.078676, 2.138084, -1.737397, 1, 0.8980392, 0, 1,
-1.077019, 0.5853693, -0.7837184, 1, 0.9058824, 0, 1,
-1.074874, -0.2660352, -1.291776, 1, 0.9137255, 0, 1,
-1.062791, 1.52138, -0.04352783, 1, 0.9176471, 0, 1,
-1.060138, -2.397115, -0.1457063, 1, 0.9254902, 0, 1,
-1.049123, 0.3397299, -2.530525, 1, 0.9294118, 0, 1,
-1.048634, 0.293366, 1.010376, 1, 0.9372549, 0, 1,
-1.030892, -2.186384, -4.148135, 1, 0.9411765, 0, 1,
-1.027494, 0.7453965, -1.106472, 1, 0.9490196, 0, 1,
-1.026552, 0.5365013, -0.9774147, 1, 0.9529412, 0, 1,
-1.018421, -0.5510395, -0.04648469, 1, 0.9607843, 0, 1,
-1.017826, 0.6131227, 0.3454991, 1, 0.9647059, 0, 1,
-1.013085, -1.513041, -2.149963, 1, 0.972549, 0, 1,
-1.012719, 0.03923671, -0.7508155, 1, 0.9764706, 0, 1,
-1.00629, -1.188344, -2.193637, 1, 0.9843137, 0, 1,
-1.002809, -0.2850437, -2.598145, 1, 0.9882353, 0, 1,
-0.9954937, -0.9921428, 0.008075574, 1, 0.9960784, 0, 1,
-0.9891987, -0.6389266, 0.01799302, 0.9960784, 1, 0, 1,
-0.9816375, -1.727172, -3.713528, 0.9921569, 1, 0, 1,
-0.9786977, -0.9527969, -4.8427, 0.9843137, 1, 0, 1,
-0.9782097, 1.105555, -0.6649482, 0.9803922, 1, 0, 1,
-0.9781935, -0.06671046, -1.571179, 0.972549, 1, 0, 1,
-0.9680518, -1.860903, -1.575372, 0.9686275, 1, 0, 1,
-0.9659465, 0.5705188, 0.0879207, 0.9607843, 1, 0, 1,
-0.9646159, 1.006507, -1.148065, 0.9568627, 1, 0, 1,
-0.9593937, -1.614719, -1.622737, 0.9490196, 1, 0, 1,
-0.9590024, -0.9357166, -4.151137, 0.945098, 1, 0, 1,
-0.9544948, -0.1653689, -2.525492, 0.9372549, 1, 0, 1,
-0.9385901, 2.116644, -0.1480857, 0.9333333, 1, 0, 1,
-0.9371218, 1.392597, 1.030454, 0.9254902, 1, 0, 1,
-0.9363266, 1.608727, 0.06684857, 0.9215686, 1, 0, 1,
-0.935066, -1.139323, -2.100368, 0.9137255, 1, 0, 1,
-0.9252771, -0.447257, -3.684156, 0.9098039, 1, 0, 1,
-0.9213407, 1.127031, 0.03867805, 0.9019608, 1, 0, 1,
-0.9151085, 0.9536647, -1.185606, 0.8941177, 1, 0, 1,
-0.907602, -0.4357185, -3.069599, 0.8901961, 1, 0, 1,
-0.8999902, -0.2025762, -1.433551, 0.8823529, 1, 0, 1,
-0.8930867, 0.1964461, -2.908227, 0.8784314, 1, 0, 1,
-0.8929363, 1.493739, -0.928086, 0.8705882, 1, 0, 1,
-0.8850906, -0.2484765, -1.743018, 0.8666667, 1, 0, 1,
-0.8765655, -0.4062554, -1.301659, 0.8588235, 1, 0, 1,
-0.8755673, -0.2324561, -2.628354, 0.854902, 1, 0, 1,
-0.8747908, 0.2515267, -1.483519, 0.8470588, 1, 0, 1,
-0.8746043, 1.108205, -0.00568802, 0.8431373, 1, 0, 1,
-0.8656754, 0.1845502, -1.952146, 0.8352941, 1, 0, 1,
-0.8640909, -1.432077, -0.1573886, 0.8313726, 1, 0, 1,
-0.8609084, 1.787908, 1.261608, 0.8235294, 1, 0, 1,
-0.8568674, -0.4885224, -1.404065, 0.8196079, 1, 0, 1,
-0.8561996, -0.6499274, -2.683939, 0.8117647, 1, 0, 1,
-0.8559343, -0.05038626, 0.2750249, 0.8078431, 1, 0, 1,
-0.8551796, 0.07030307, 0.96064, 0.8, 1, 0, 1,
-0.853083, 1.313511, -1.343317, 0.7921569, 1, 0, 1,
-0.850733, 0.4921345, -1.418713, 0.7882353, 1, 0, 1,
-0.8472807, -0.6510981, -1.49276, 0.7803922, 1, 0, 1,
-0.8433108, -0.416111, -0.5462114, 0.7764706, 1, 0, 1,
-0.8409029, 1.294429, 1.050338, 0.7686275, 1, 0, 1,
-0.8373306, 0.593525, -0.3034184, 0.7647059, 1, 0, 1,
-0.8319826, -0.9949234, -0.6227845, 0.7568628, 1, 0, 1,
-0.8314564, 0.1382354, -0.5968016, 0.7529412, 1, 0, 1,
-0.8287067, -0.1052941, -0.8591738, 0.7450981, 1, 0, 1,
-0.8196655, 0.2229881, -0.3376144, 0.7411765, 1, 0, 1,
-0.8185927, -2.680023, -3.030871, 0.7333333, 1, 0, 1,
-0.8176809, 0.9900951, 0.3803076, 0.7294118, 1, 0, 1,
-0.8173789, -1.596508, -2.714156, 0.7215686, 1, 0, 1,
-0.8161831, 0.9663677, 0.5807356, 0.7176471, 1, 0, 1,
-0.8155776, -0.5487057, -1.644085, 0.7098039, 1, 0, 1,
-0.8116609, -0.5350622, -1.428016, 0.7058824, 1, 0, 1,
-0.8074939, 0.4906771, -1.315758, 0.6980392, 1, 0, 1,
-0.8049368, 0.352688, -1.206009, 0.6901961, 1, 0, 1,
-0.8037534, 1.025736, -2.170208, 0.6862745, 1, 0, 1,
-0.8012058, 2.075994, -1.386211, 0.6784314, 1, 0, 1,
-0.800468, -0.5532233, -2.42091, 0.6745098, 1, 0, 1,
-0.7951707, -2.086749, -1.313518, 0.6666667, 1, 0, 1,
-0.7831017, -1.260925, -1.979717, 0.6627451, 1, 0, 1,
-0.7826319, -0.6895574, -1.49978, 0.654902, 1, 0, 1,
-0.7813647, 0.2055403, 0.01950425, 0.6509804, 1, 0, 1,
-0.7792645, 1.029588, -1.516858, 0.6431373, 1, 0, 1,
-0.7774966, 0.02108042, -0.7451745, 0.6392157, 1, 0, 1,
-0.7769985, -0.1340735, -1.967027, 0.6313726, 1, 0, 1,
-0.7754385, 1.154161, 2.108631, 0.627451, 1, 0, 1,
-0.7749083, 1.179802, -3.571961, 0.6196079, 1, 0, 1,
-0.7728418, 0.9844739, 0.04521069, 0.6156863, 1, 0, 1,
-0.768145, 0.507754, -0.350957, 0.6078432, 1, 0, 1,
-0.7621022, 2.479453, 0.9019125, 0.6039216, 1, 0, 1,
-0.7597046, -0.002468827, -3.451805, 0.5960785, 1, 0, 1,
-0.7586322, 0.9992302, -0.8848466, 0.5882353, 1, 0, 1,
-0.7561216, -0.5427767, -0.9257463, 0.5843138, 1, 0, 1,
-0.7546954, 1.099617, -1.321644, 0.5764706, 1, 0, 1,
-0.7522571, -2.026321, -2.110052, 0.572549, 1, 0, 1,
-0.7499044, 0.6501679, -0.5833103, 0.5647059, 1, 0, 1,
-0.7463709, 2.174896, 0.6919858, 0.5607843, 1, 0, 1,
-0.7461754, 0.1414145, -0.1869208, 0.5529412, 1, 0, 1,
-0.7457147, -0.5892401, -2.821276, 0.5490196, 1, 0, 1,
-0.7415926, -0.07145488, -2.634495, 0.5411765, 1, 0, 1,
-0.7396914, 0.3582243, -1.601985, 0.5372549, 1, 0, 1,
-0.7394137, -0.4797225, -3.794495, 0.5294118, 1, 0, 1,
-0.7375895, 0.9547539, -0.4549709, 0.5254902, 1, 0, 1,
-0.7374641, 1.68525, -0.6299489, 0.5176471, 1, 0, 1,
-0.7367383, 0.3912886, -2.399773, 0.5137255, 1, 0, 1,
-0.7348708, 0.4786343, -2.893889, 0.5058824, 1, 0, 1,
-0.7265643, 0.3573351, -0.6578505, 0.5019608, 1, 0, 1,
-0.7244062, -0.01672477, -2.237722, 0.4941176, 1, 0, 1,
-0.723064, 0.03784665, 0.02169652, 0.4862745, 1, 0, 1,
-0.7229993, 0.1214995, 0.03203518, 0.4823529, 1, 0, 1,
-0.7227154, -0.3506116, -2.709982, 0.4745098, 1, 0, 1,
-0.7120861, -0.6700361, -1.810551, 0.4705882, 1, 0, 1,
-0.7090827, 1.521614, -0.211635, 0.4627451, 1, 0, 1,
-0.702457, 2.336753, 0.2869298, 0.4588235, 1, 0, 1,
-0.7012376, 0.6947057, -0.01518953, 0.4509804, 1, 0, 1,
-0.6956854, 1.245534, -1.358046, 0.4470588, 1, 0, 1,
-0.6915936, -0.4391476, -2.028911, 0.4392157, 1, 0, 1,
-0.6891056, -0.1085256, -1.346374, 0.4352941, 1, 0, 1,
-0.6836967, 0.7025076, 0.2401481, 0.427451, 1, 0, 1,
-0.6817408, 0.5433683, -0.8439089, 0.4235294, 1, 0, 1,
-0.6796483, 0.9020351, -1.525553, 0.4156863, 1, 0, 1,
-0.6744918, 0.1009061, -1.472312, 0.4117647, 1, 0, 1,
-0.673324, -0.1487843, 0.09935649, 0.4039216, 1, 0, 1,
-0.6712722, -1.592244, -2.488886, 0.3960784, 1, 0, 1,
-0.6710926, -1.96782, -1.636325, 0.3921569, 1, 0, 1,
-0.6674895, -0.8746046, -3.65158, 0.3843137, 1, 0, 1,
-0.6668163, 0.2044901, -2.547117, 0.3803922, 1, 0, 1,
-0.6636479, 0.9460827, -1.598126, 0.372549, 1, 0, 1,
-0.6633547, 0.8001019, -0.2118271, 0.3686275, 1, 0, 1,
-0.6597078, 0.0842763, -2.069342, 0.3607843, 1, 0, 1,
-0.659127, 1.39375, -0.1074445, 0.3568628, 1, 0, 1,
-0.6584057, -0.07425292, -1.005339, 0.3490196, 1, 0, 1,
-0.6539889, -0.4958724, -1.043499, 0.345098, 1, 0, 1,
-0.6529848, -1.034948, 0.3481728, 0.3372549, 1, 0, 1,
-0.6462111, -1.092316, -3.569811, 0.3333333, 1, 0, 1,
-0.6447651, -0.4191422, -0.6027252, 0.3254902, 1, 0, 1,
-0.6435561, -0.01595764, -2.425603, 0.3215686, 1, 0, 1,
-0.6349381, 1.440198, 0.2497651, 0.3137255, 1, 0, 1,
-0.6286194, -3.169516, -4.585288, 0.3098039, 1, 0, 1,
-0.6275002, -0.4799372, -4.2589, 0.3019608, 1, 0, 1,
-0.6259444, 0.1927611, -2.363318, 0.2941177, 1, 0, 1,
-0.6249917, -1.536168, -1.71132, 0.2901961, 1, 0, 1,
-0.6217051, -0.8804858, -1.758881, 0.282353, 1, 0, 1,
-0.621272, -1.091446, -1.982728, 0.2784314, 1, 0, 1,
-0.6201659, 1.681138, -0.490244, 0.2705882, 1, 0, 1,
-0.6140813, 0.3926173, -1.286311, 0.2666667, 1, 0, 1,
-0.6131409, -0.8251424, -3.342914, 0.2588235, 1, 0, 1,
-0.6074186, -1.082143, -2.23282, 0.254902, 1, 0, 1,
-0.6071314, 0.1532116, -0.4982907, 0.2470588, 1, 0, 1,
-0.599633, -0.0215955, -0.6536089, 0.2431373, 1, 0, 1,
-0.598035, -0.03092086, -0.3458365, 0.2352941, 1, 0, 1,
-0.5973489, -1.66011, -3.019806, 0.2313726, 1, 0, 1,
-0.5915662, -0.1676703, -3.522014, 0.2235294, 1, 0, 1,
-0.5907131, 1.293662, 2.697191, 0.2196078, 1, 0, 1,
-0.5895272, 1.091718, 0.6626456, 0.2117647, 1, 0, 1,
-0.5809748, -0.9319778, -1.78294, 0.2078431, 1, 0, 1,
-0.5806005, 0.4277664, -1.515613, 0.2, 1, 0, 1,
-0.5794482, -1.464555, -3.79653, 0.1921569, 1, 0, 1,
-0.5791708, 1.369028, -1.356297, 0.1882353, 1, 0, 1,
-0.5765887, -1.467911, -0.8174778, 0.1803922, 1, 0, 1,
-0.5717812, 1.101212, -0.4231777, 0.1764706, 1, 0, 1,
-0.570734, 0.2138087, -0.7671869, 0.1686275, 1, 0, 1,
-0.5647879, -0.5623147, -0.7471125, 0.1647059, 1, 0, 1,
-0.5630991, 0.5112264, -1.223399, 0.1568628, 1, 0, 1,
-0.5612836, -1.776229, -1.749842, 0.1529412, 1, 0, 1,
-0.5553356, -0.5458028, -3.889493, 0.145098, 1, 0, 1,
-0.551282, 2.695849, 0.6082015, 0.1411765, 1, 0, 1,
-0.5501609, -2.808234, -2.008349, 0.1333333, 1, 0, 1,
-0.5476767, 1.125379, -1.879609, 0.1294118, 1, 0, 1,
-0.547559, 0.500054, -0.7929782, 0.1215686, 1, 0, 1,
-0.5471937, 1.12347, -0.191257, 0.1176471, 1, 0, 1,
-0.5420577, -1.07761, -3.168264, 0.1098039, 1, 0, 1,
-0.5385008, -0.427868, -1.470133, 0.1058824, 1, 0, 1,
-0.5365598, 0.1797923, 0.3750521, 0.09803922, 1, 0, 1,
-0.5351834, 1.180567, -1.276906, 0.09019608, 1, 0, 1,
-0.5348749, 0.7013468, 0.005389261, 0.08627451, 1, 0, 1,
-0.530266, -1.182699, -4.083089, 0.07843138, 1, 0, 1,
-0.5299476, -0.2514857, -1.367076, 0.07450981, 1, 0, 1,
-0.5281748, 0.2430216, -2.46901, 0.06666667, 1, 0, 1,
-0.5271618, -1.204473, -3.280721, 0.0627451, 1, 0, 1,
-0.5256175, -0.07491191, -0.3752488, 0.05490196, 1, 0, 1,
-0.5242503, 1.619666, 0.4195921, 0.05098039, 1, 0, 1,
-0.5206605, -2.172728, -2.042778, 0.04313726, 1, 0, 1,
-0.5204845, -1.015424, -4.384368, 0.03921569, 1, 0, 1,
-0.5177826, 0.7022851, -0.3057307, 0.03137255, 1, 0, 1,
-0.5146115, 0.03200647, -2.077924, 0.02745098, 1, 0, 1,
-0.5142915, 3.955676, 0.7078582, 0.01960784, 1, 0, 1,
-0.5130316, -1.293482, -2.776322, 0.01568628, 1, 0, 1,
-0.5126375, -0.9867399, -2.946189, 0.007843138, 1, 0, 1,
-0.5069078, -0.7648091, -1.906621, 0.003921569, 1, 0, 1,
-0.5034119, -1.215778, -1.848703, 0, 1, 0.003921569, 1,
-0.4960505, -0.3499061, -1.93716, 0, 1, 0.01176471, 1,
-0.4873438, -0.7534597, -2.898657, 0, 1, 0.01568628, 1,
-0.486382, 0.2961222, -0.6061665, 0, 1, 0.02352941, 1,
-0.4861057, 0.8334714, -1.191828, 0, 1, 0.02745098, 1,
-0.4843008, 0.1511196, -1.311302, 0, 1, 0.03529412, 1,
-0.4786843, -0.2780203, -2.071457, 0, 1, 0.03921569, 1,
-0.4745809, 0.3547577, -0.7433034, 0, 1, 0.04705882, 1,
-0.4701566, 0.6166037, 0.1865349, 0, 1, 0.05098039, 1,
-0.4685672, -1.444322, -3.60502, 0, 1, 0.05882353, 1,
-0.4684283, 1.534273, 0.4550413, 0, 1, 0.0627451, 1,
-0.464586, -1.546006, -1.251287, 0, 1, 0.07058824, 1,
-0.4623305, -1.238436, -3.1254, 0, 1, 0.07450981, 1,
-0.4615617, -0.7514715, -2.360739, 0, 1, 0.08235294, 1,
-0.4530838, 0.04380665, -0.2049358, 0, 1, 0.08627451, 1,
-0.4525839, 0.008395338, -2.889359, 0, 1, 0.09411765, 1,
-0.4517847, 1.077987, 0.1178016, 0, 1, 0.1019608, 1,
-0.4516776, -0.787621, -3.40497, 0, 1, 0.1058824, 1,
-0.4503823, -0.4673131, -2.654676, 0, 1, 0.1137255, 1,
-0.4437698, 1.17348, -0.2551108, 0, 1, 0.1176471, 1,
-0.4431369, 0.4284466, 0.2381072, 0, 1, 0.1254902, 1,
-0.4415681, -0.1794032, -0.1218432, 0, 1, 0.1294118, 1,
-0.4405635, -0.7928085, -3.097916, 0, 1, 0.1372549, 1,
-0.4395766, 0.5820932, -0.1418159, 0, 1, 0.1411765, 1,
-0.4360962, -0.2426161, -2.303669, 0, 1, 0.1490196, 1,
-0.4340172, -0.1280852, -1.585513, 0, 1, 0.1529412, 1,
-0.4303656, -1.578618, -1.215696, 0, 1, 0.1607843, 1,
-0.4302503, -3.16565, -3.220495, 0, 1, 0.1647059, 1,
-0.4292583, 0.05674772, 0.1743295, 0, 1, 0.172549, 1,
-0.4250746, 0.1664842, -0.008695782, 0, 1, 0.1764706, 1,
-0.4237581, -1.316799, -2.19152, 0, 1, 0.1843137, 1,
-0.4215559, -0.1851584, -1.672078, 0, 1, 0.1882353, 1,
-0.418294, 0.2611353, 0.5564984, 0, 1, 0.1960784, 1,
-0.4148938, -1.793482, -2.529923, 0, 1, 0.2039216, 1,
-0.4134477, 1.7671, -0.1282437, 0, 1, 0.2078431, 1,
-0.4124425, -0.593362, -2.695943, 0, 1, 0.2156863, 1,
-0.4109754, -0.5982383, -1.15357, 0, 1, 0.2196078, 1,
-0.406682, -0.2042701, -2.540462, 0, 1, 0.227451, 1,
-0.4059224, 0.7126368, -0.447401, 0, 1, 0.2313726, 1,
-0.4022545, 0.82675, 0.9066765, 0, 1, 0.2392157, 1,
-0.4011474, 1.417895, -0.8781863, 0, 1, 0.2431373, 1,
-0.3980353, -0.6163458, -1.074529, 0, 1, 0.2509804, 1,
-0.3969668, -1.494328, -4.880705, 0, 1, 0.254902, 1,
-0.3965069, 0.469392, -1.612922, 0, 1, 0.2627451, 1,
-0.3945116, 0.2886804, -2.648852, 0, 1, 0.2666667, 1,
-0.3939953, -0.221743, -0.4530857, 0, 1, 0.2745098, 1,
-0.3904605, 1.299468, 0.3068419, 0, 1, 0.2784314, 1,
-0.388557, 0.5039731, -1.889786, 0, 1, 0.2862745, 1,
-0.3817807, 2.508011, -0.6367776, 0, 1, 0.2901961, 1,
-0.3786119, -0.1272567, -1.168285, 0, 1, 0.2980392, 1,
-0.371124, 0.4041212, 0.2912688, 0, 1, 0.3058824, 1,
-0.363252, -0.8686826, -2.666924, 0, 1, 0.3098039, 1,
-0.3620273, 0.4443879, -1.514255, 0, 1, 0.3176471, 1,
-0.3542117, -0.2492693, -1.91031, 0, 1, 0.3215686, 1,
-0.352592, 0.5902358, -0.7668555, 0, 1, 0.3294118, 1,
-0.3519406, -0.2151331, -0.7203438, 0, 1, 0.3333333, 1,
-0.3451174, -0.9310778, -2.900135, 0, 1, 0.3411765, 1,
-0.3432312, -0.1988346, -2.492293, 0, 1, 0.345098, 1,
-0.340111, 2.021041, -0.00146548, 0, 1, 0.3529412, 1,
-0.3383561, -1.542574, -3.08305, 0, 1, 0.3568628, 1,
-0.3350239, 0.7811618, 1.039252, 0, 1, 0.3647059, 1,
-0.3285068, -2.692014, -2.235273, 0, 1, 0.3686275, 1,
-0.3282132, -1.358927, -3.0051, 0, 1, 0.3764706, 1,
-0.3244963, 0.8610059, -1.278045, 0, 1, 0.3803922, 1,
-0.3198679, 0.9356937, 0.1266259, 0, 1, 0.3882353, 1,
-0.3151469, 0.7359093, -0.5226394, 0, 1, 0.3921569, 1,
-0.310777, 0.290508, 0.1909109, 0, 1, 0.4, 1,
-0.3099006, -1.038561, -3.6376, 0, 1, 0.4078431, 1,
-0.3038828, -0.12995, -0.168965, 0, 1, 0.4117647, 1,
-0.2993973, 0.270585, -0.5642117, 0, 1, 0.4196078, 1,
-0.2993838, -0.2234498, -2.712414, 0, 1, 0.4235294, 1,
-0.2921524, 1.135732, 0.5775132, 0, 1, 0.4313726, 1,
-0.2915254, -0.1155142, -0.5828439, 0, 1, 0.4352941, 1,
-0.2912467, -0.1461481, -0.6545666, 0, 1, 0.4431373, 1,
-0.2900673, 1.027659, 0.3885429, 0, 1, 0.4470588, 1,
-0.2895974, 0.6077472, -1.892322, 0, 1, 0.454902, 1,
-0.2880996, -0.3148913, -1.763342, 0, 1, 0.4588235, 1,
-0.2873514, -0.1105743, -1.071262, 0, 1, 0.4666667, 1,
-0.2866414, -0.3542786, -3.987447, 0, 1, 0.4705882, 1,
-0.28507, 0.8620642, -0.856663, 0, 1, 0.4784314, 1,
-0.2836353, -0.5031324, -2.756103, 0, 1, 0.4823529, 1,
-0.2813263, -0.3103305, -1.25551, 0, 1, 0.4901961, 1,
-0.2734661, 0.1565337, 0.7225486, 0, 1, 0.4941176, 1,
-0.2719039, 1.230681, 1.572556, 0, 1, 0.5019608, 1,
-0.2677487, 1.25491, -0.7782252, 0, 1, 0.509804, 1,
-0.2677234, -0.8678972, -2.115698, 0, 1, 0.5137255, 1,
-0.2632414, 1.680043, -0.1944079, 0, 1, 0.5215687, 1,
-0.2628428, 0.9456988, 0.884914, 0, 1, 0.5254902, 1,
-0.2586688, -0.7779365, -1.082187, 0, 1, 0.5333334, 1,
-0.2542615, 0.1236427, -1.235514, 0, 1, 0.5372549, 1,
-0.2498671, 0.9183014, 0.8883504, 0, 1, 0.5450981, 1,
-0.249433, -1.868655, -1.055275, 0, 1, 0.5490196, 1,
-0.2483087, -0.7598133, -4.234756, 0, 1, 0.5568628, 1,
-0.2480987, 0.9720421, 0.1182237, 0, 1, 0.5607843, 1,
-0.242363, -0.4017566, -0.819963, 0, 1, 0.5686275, 1,
-0.241841, -1.230034, -3.597906, 0, 1, 0.572549, 1,
-0.2416659, 0.7223981, 0.04530616, 0, 1, 0.5803922, 1,
-0.2377132, 0.1734447, 0.2008394, 0, 1, 0.5843138, 1,
-0.2353233, -0.4640806, -1.616052, 0, 1, 0.5921569, 1,
-0.2315906, -0.5596923, -2.60216, 0, 1, 0.5960785, 1,
-0.2282246, -0.4941593, -3.305669, 0, 1, 0.6039216, 1,
-0.2278691, 2.004904, -0.4348764, 0, 1, 0.6117647, 1,
-0.2268966, 0.2089244, -2.177209, 0, 1, 0.6156863, 1,
-0.226633, -0.400409, -3.002264, 0, 1, 0.6235294, 1,
-0.2253735, 0.7513933, 0.5509715, 0, 1, 0.627451, 1,
-0.2222984, -0.7086208, -2.042546, 0, 1, 0.6352941, 1,
-0.2167737, -0.3250588, -2.051692, 0, 1, 0.6392157, 1,
-0.2161469, 2.296812, -0.3453911, 0, 1, 0.6470588, 1,
-0.2161462, 0.184289, -1.292539, 0, 1, 0.6509804, 1,
-0.2110154, -1.449641, -5.38541, 0, 1, 0.6588235, 1,
-0.2080495, -0.6427487, -3.704935, 0, 1, 0.6627451, 1,
-0.2055523, 0.3900104, 0.3810633, 0, 1, 0.6705883, 1,
-0.2053646, 0.365332, -1.22247, 0, 1, 0.6745098, 1,
-0.2046218, 1.608978, -0.2677351, 0, 1, 0.682353, 1,
-0.2034068, 1.009701, 0.1349417, 0, 1, 0.6862745, 1,
-0.2027255, 0.982779, -1.071428, 0, 1, 0.6941177, 1,
-0.1922288, 0.6591647, 1.343218, 0, 1, 0.7019608, 1,
-0.1889782, 0.4694007, -0.8424454, 0, 1, 0.7058824, 1,
-0.1877966, -0.9040991, -4.810872, 0, 1, 0.7137255, 1,
-0.1865356, 0.8838051, -2.322028, 0, 1, 0.7176471, 1,
-0.1863395, -0.5188658, -2.13572, 0, 1, 0.7254902, 1,
-0.1845492, 1.190751, 0.05143254, 0, 1, 0.7294118, 1,
-0.1835808, 0.3980162, 0.266073, 0, 1, 0.7372549, 1,
-0.1832091, -0.6995583, -2.537779, 0, 1, 0.7411765, 1,
-0.1825622, 0.4652883, 2.235495, 0, 1, 0.7490196, 1,
-0.1766392, 1.428045, 0.6072719, 0, 1, 0.7529412, 1,
-0.1766051, -0.6477971, -2.41175, 0, 1, 0.7607843, 1,
-0.1743614, -0.05194883, -0.3036744, 0, 1, 0.7647059, 1,
-0.1741551, -0.7337426, -3.423806, 0, 1, 0.772549, 1,
-0.1688297, 0.4022304, -0.5360838, 0, 1, 0.7764706, 1,
-0.1654355, -0.956392, -3.427494, 0, 1, 0.7843137, 1,
-0.1605173, -1.345056, -2.860885, 0, 1, 0.7882353, 1,
-0.1585469, 0.1529426, 0.7279261, 0, 1, 0.7960784, 1,
-0.1563339, 0.6598673, -1.609791, 0, 1, 0.8039216, 1,
-0.1556105, -0.8922968, -1.976437, 0, 1, 0.8078431, 1,
-0.1551712, 0.957462, 1.090179, 0, 1, 0.8156863, 1,
-0.1535215, -0.04642063, -2.435846, 0, 1, 0.8196079, 1,
-0.1507197, 1.7633, -0.9457265, 0, 1, 0.827451, 1,
-0.149631, 0.3527372, -0.2543995, 0, 1, 0.8313726, 1,
-0.1493834, -0.2384377, -2.697953, 0, 1, 0.8392157, 1,
-0.139645, -0.9584506, -3.250393, 0, 1, 0.8431373, 1,
-0.1369813, 2.405274, -0.6608332, 0, 1, 0.8509804, 1,
-0.1363241, 0.4289559, -2.542342, 0, 1, 0.854902, 1,
-0.1358738, -0.482655, -1.585377, 0, 1, 0.8627451, 1,
-0.1331244, -0.02448114, -1.879168, 0, 1, 0.8666667, 1,
-0.1328106, -0.6394646, -1.345937, 0, 1, 0.8745098, 1,
-0.1260956, -0.3132383, -2.744313, 0, 1, 0.8784314, 1,
-0.1248797, 0.9192705, 0.411012, 0, 1, 0.8862745, 1,
-0.1246464, 0.03405891, -1.849181, 0, 1, 0.8901961, 1,
-0.123736, -1.858885, -3.611697, 0, 1, 0.8980392, 1,
-0.1191197, 2.066958, 1.299232, 0, 1, 0.9058824, 1,
-0.1145157, -0.7302369, -3.608799, 0, 1, 0.9098039, 1,
-0.1034255, -0.6225375, -4.506617, 0, 1, 0.9176471, 1,
-0.1000595, -0.7313238, -1.770369, 0, 1, 0.9215686, 1,
-0.09986103, 0.5061026, 1.022951, 0, 1, 0.9294118, 1,
-0.09132524, 1.444886, -0.5767776, 0, 1, 0.9333333, 1,
-0.09102707, 2.561419, 1.736666, 0, 1, 0.9411765, 1,
-0.08894457, 0.7938831, -1.480562, 0, 1, 0.945098, 1,
-0.08401541, -0.006241582, -0.7958396, 0, 1, 0.9529412, 1,
-0.08264653, -0.5342571, -2.835028, 0, 1, 0.9568627, 1,
-0.08079451, 0.02580269, -2.667574, 0, 1, 0.9647059, 1,
-0.08025207, -1.184763, -2.01072, 0, 1, 0.9686275, 1,
-0.07881733, -0.4065534, -3.795525, 0, 1, 0.9764706, 1,
-0.07687272, -0.869697, -2.982623, 0, 1, 0.9803922, 1,
-0.07600175, -0.3133355, -2.860094, 0, 1, 0.9882353, 1,
-0.06823428, -1.041282, -2.707268, 0, 1, 0.9921569, 1,
-0.06683475, -1.054433, -2.395298, 0, 1, 1, 1,
-0.06494796, -1.37468, -3.084619, 0, 0.9921569, 1, 1,
-0.06040588, -0.3543531, -2.978829, 0, 0.9882353, 1, 1,
-0.06009877, -1.554161, -4.260795, 0, 0.9803922, 1, 1,
-0.05748036, -0.8575463, -2.280893, 0, 0.9764706, 1, 1,
-0.05725165, -0.0971133, -1.875634, 0, 0.9686275, 1, 1,
-0.05627368, 0.003552069, -0.2989893, 0, 0.9647059, 1, 1,
-0.05268435, 0.05141756, -1.542019, 0, 0.9568627, 1, 1,
-0.0510336, -0.3029124, -2.160559, 0, 0.9529412, 1, 1,
-0.04960193, -0.05685003, -1.923839, 0, 0.945098, 1, 1,
-0.048696, 0.9843568, -0.2573394, 0, 0.9411765, 1, 1,
-0.04765589, -0.83999, -3.267559, 0, 0.9333333, 1, 1,
-0.04758833, -0.8370351, -3.220982, 0, 0.9294118, 1, 1,
-0.03639727, 0.326735, 0.6359897, 0, 0.9215686, 1, 1,
-0.03578862, -1.288013, -3.404114, 0, 0.9176471, 1, 1,
-0.03405045, 0.9216232, 1.389727, 0, 0.9098039, 1, 1,
-0.03371652, -0.8487372, -3.612615, 0, 0.9058824, 1, 1,
-0.03188851, 0.6362624, 0.3481262, 0, 0.8980392, 1, 1,
-0.03007189, 0.0929679, -0.7244523, 0, 0.8901961, 1, 1,
-0.02723042, 0.006659874, -0.8433679, 0, 0.8862745, 1, 1,
-0.02458818, -0.7509839, -4.464362, 0, 0.8784314, 1, 1,
-0.02434854, 0.02533629, 0.4117102, 0, 0.8745098, 1, 1,
-0.02278368, 1.431524, 0.7154605, 0, 0.8666667, 1, 1,
-0.01825093, -0.3965746, -3.155163, 0, 0.8627451, 1, 1,
-0.01479744, -0.08090317, -3.907275, 0, 0.854902, 1, 1,
-0.009058792, 0.03090563, -0.6232663, 0, 0.8509804, 1, 1,
-0.008608494, 1.127562, 1.022924, 0, 0.8431373, 1, 1,
-0.007349567, 1.556553, 0.4246662, 0, 0.8392157, 1, 1,
-0.005807039, -0.2212867, -5.453136, 0, 0.8313726, 1, 1,
-0.004537805, -1.232622, -2.079168, 0, 0.827451, 1, 1,
-0.00286847, 1.265576, 1.077134, 0, 0.8196079, 1, 1,
-0.001653909, 1.23377, 0.9224735, 0, 0.8156863, 1, 1,
0.0002165151, 1.223467, 0.9541104, 0, 0.8078431, 1, 1,
0.0008737036, 0.1117763, -1.635075, 0, 0.8039216, 1, 1,
0.002698188, 0.9782526, 0.7843503, 0, 0.7960784, 1, 1,
0.006163666, 0.3105334, -0.3991165, 0, 0.7882353, 1, 1,
0.006351538, -0.6389428, 3.324107, 0, 0.7843137, 1, 1,
0.006492673, 0.2530368, 0.3863828, 0, 0.7764706, 1, 1,
0.007830624, 0.6959687, -1.575801, 0, 0.772549, 1, 1,
0.01180468, 1.025418, -0.5468879, 0, 0.7647059, 1, 1,
0.01270943, -1.045076, 2.961876, 0, 0.7607843, 1, 1,
0.01773237, 2.348697, 0.2988156, 0, 0.7529412, 1, 1,
0.02256705, -0.4963676, 3.557142, 0, 0.7490196, 1, 1,
0.02945573, -0.9623991, 2.21626, 0, 0.7411765, 1, 1,
0.02968426, -0.7754734, 4.543008, 0, 0.7372549, 1, 1,
0.03031338, 0.5441742, 0.2688391, 0, 0.7294118, 1, 1,
0.03133407, 0.81406, -0.3830011, 0, 0.7254902, 1, 1,
0.03203367, -0.8952027, 4.200172, 0, 0.7176471, 1, 1,
0.03934763, -0.1341881, 2.564107, 0, 0.7137255, 1, 1,
0.04015119, -2.107856, 1.919214, 0, 0.7058824, 1, 1,
0.05226868, 1.084783, -1.004584, 0, 0.6980392, 1, 1,
0.05362012, 1.001097, -0.3750969, 0, 0.6941177, 1, 1,
0.05587528, -1.430191, 3.669713, 0, 0.6862745, 1, 1,
0.05701027, -0.04829844, 0.991366, 0, 0.682353, 1, 1,
0.05727221, 0.4385099, 0.6141251, 0, 0.6745098, 1, 1,
0.0596006, -0.1219285, 3.539476, 0, 0.6705883, 1, 1,
0.06202507, -1.266011, 2.286837, 0, 0.6627451, 1, 1,
0.07052889, 0.7370341, 0.3444081, 0, 0.6588235, 1, 1,
0.07398748, 0.00568884, 1.05869, 0, 0.6509804, 1, 1,
0.07461405, -1.100191, 0.01276743, 0, 0.6470588, 1, 1,
0.07486244, 0.9936593, 0.2505383, 0, 0.6392157, 1, 1,
0.07644083, 1.012891, -0.4720246, 0, 0.6352941, 1, 1,
0.07824588, 0.4664851, -0.7243834, 0, 0.627451, 1, 1,
0.07853769, -1.22251, 3.789726, 0, 0.6235294, 1, 1,
0.07880279, 0.3185711, -0.9799551, 0, 0.6156863, 1, 1,
0.08100899, 0.2243315, 0.9372502, 0, 0.6117647, 1, 1,
0.08270577, -0.3011808, 4.004482, 0, 0.6039216, 1, 1,
0.08387986, -0.06037633, 1.550318, 0, 0.5960785, 1, 1,
0.08567162, -1.791476, 2.120875, 0, 0.5921569, 1, 1,
0.09191301, 0.1270006, 1.600191, 0, 0.5843138, 1, 1,
0.09896299, -0.1052739, 3.503156, 0, 0.5803922, 1, 1,
0.09958202, -1.207162, 2.994051, 0, 0.572549, 1, 1,
0.1022201, 0.6772671, 0.7446389, 0, 0.5686275, 1, 1,
0.1023322, -0.8621811, 2.638023, 0, 0.5607843, 1, 1,
0.1027594, 0.1478093, 1.069402, 0, 0.5568628, 1, 1,
0.1044019, 0.5460857, -1.556094, 0, 0.5490196, 1, 1,
0.1069152, -1.595496, 2.721698, 0, 0.5450981, 1, 1,
0.1129468, -1.443026, 2.126545, 0, 0.5372549, 1, 1,
0.1133193, -0.7502347, 0.9917709, 0, 0.5333334, 1, 1,
0.1190516, -1.48087, 3.194024, 0, 0.5254902, 1, 1,
0.1252081, -0.9225959, 4.883608, 0, 0.5215687, 1, 1,
0.1259639, 0.45796, 0.9341889, 0, 0.5137255, 1, 1,
0.1267306, 0.1427582, 1.887738, 0, 0.509804, 1, 1,
0.1286844, -0.8666599, 2.191877, 0, 0.5019608, 1, 1,
0.1320162, -1.264747, 1.838244, 0, 0.4941176, 1, 1,
0.1322937, 0.6511547, -0.7627726, 0, 0.4901961, 1, 1,
0.1441643, 1.195053, 0.7949853, 0, 0.4823529, 1, 1,
0.1444313, 2.002156, 0.6410487, 0, 0.4784314, 1, 1,
0.1498655, -0.1536577, 1.830156, 0, 0.4705882, 1, 1,
0.1519923, -0.3217531, 1.7568, 0, 0.4666667, 1, 1,
0.1527575, -0.1758748, 0.8975161, 0, 0.4588235, 1, 1,
0.1530315, -1.600671, 3.230515, 0, 0.454902, 1, 1,
0.1544669, -0.4661708, 2.548366, 0, 0.4470588, 1, 1,
0.1566688, -0.3083816, 2.73613, 0, 0.4431373, 1, 1,
0.1634246, -1.601585, 2.908219, 0, 0.4352941, 1, 1,
0.1676382, -0.3742692, 3.143002, 0, 0.4313726, 1, 1,
0.1691402, -0.5101167, 4.273554, 0, 0.4235294, 1, 1,
0.1724647, 0.7846554, -0.253875, 0, 0.4196078, 1, 1,
0.1728618, -0.9355431, 2.613711, 0, 0.4117647, 1, 1,
0.1741011, -1.284553, 3.041245, 0, 0.4078431, 1, 1,
0.174359, -0.2124794, 1.475697, 0, 0.4, 1, 1,
0.1779945, -0.1585338, 1.079398, 0, 0.3921569, 1, 1,
0.1798808, -1.474811, 3.414445, 0, 0.3882353, 1, 1,
0.1864382, -0.7906983, 4.157204, 0, 0.3803922, 1, 1,
0.1873969, 0.119816, -0.4875855, 0, 0.3764706, 1, 1,
0.1901351, 0.8910015, 0.6301717, 0, 0.3686275, 1, 1,
0.1917066, 0.4036579, 1.206627, 0, 0.3647059, 1, 1,
0.1967718, 1.05442, 0.002876983, 0, 0.3568628, 1, 1,
0.1982528, 0.2549163, -0.2179751, 0, 0.3529412, 1, 1,
0.1982704, 0.9403526, -0.3944409, 0, 0.345098, 1, 1,
0.2083463, 1.239211, 2.314239, 0, 0.3411765, 1, 1,
0.210143, 0.7744204, -0.07810885, 0, 0.3333333, 1, 1,
0.2162673, -0.0177156, -0.1325944, 0, 0.3294118, 1, 1,
0.2172963, 0.5606266, -0.06663618, 0, 0.3215686, 1, 1,
0.226602, 0.6899155, 0.3637865, 0, 0.3176471, 1, 1,
0.23007, 1.42994, -1.367777, 0, 0.3098039, 1, 1,
0.2303439, -0.04360043, 2.465483, 0, 0.3058824, 1, 1,
0.2317508, 1.337759, 1.426573, 0, 0.2980392, 1, 1,
0.2337134, -0.3042454, 3.072737, 0, 0.2901961, 1, 1,
0.2376897, -0.1557105, 2.41697, 0, 0.2862745, 1, 1,
0.2418375, -1.997075, 2.597589, 0, 0.2784314, 1, 1,
0.2440428, 0.3200315, 1.340996, 0, 0.2745098, 1, 1,
0.2451186, 0.6966067, 1.157101, 0, 0.2666667, 1, 1,
0.246947, -0.7355271, 3.656216, 0, 0.2627451, 1, 1,
0.2477058, -0.744862, 2.49292, 0, 0.254902, 1, 1,
0.2479684, 0.09594058, -0.07802987, 0, 0.2509804, 1, 1,
0.2504803, 0.5108635, -1.431833, 0, 0.2431373, 1, 1,
0.2515692, 0.7662924, 0.2468647, 0, 0.2392157, 1, 1,
0.2536339, 1.975003, 0.7993372, 0, 0.2313726, 1, 1,
0.2551002, 0.07807299, 2.732903, 0, 0.227451, 1, 1,
0.2562836, -0.1367057, 1.276869, 0, 0.2196078, 1, 1,
0.2578041, 0.5486562, 1.079049, 0, 0.2156863, 1, 1,
0.2596721, 0.7207921, -0.5940425, 0, 0.2078431, 1, 1,
0.2643874, -1.667176, 3.375148, 0, 0.2039216, 1, 1,
0.2649, 0.2593638, 1.025701, 0, 0.1960784, 1, 1,
0.2721957, 0.7571232, 0.3423292, 0, 0.1882353, 1, 1,
0.2745007, 0.2035347, 2.899365, 0, 0.1843137, 1, 1,
0.2764104, 0.8602027, 1.358142, 0, 0.1764706, 1, 1,
0.2805848, 0.7878897, 1.096886, 0, 0.172549, 1, 1,
0.293649, 0.5402262, 0.681372, 0, 0.1647059, 1, 1,
0.2944455, -1.403991, 3.047035, 0, 0.1607843, 1, 1,
0.2983396, -1.62522, 1.935163, 0, 0.1529412, 1, 1,
0.2995693, 0.5662042, 1.30655, 0, 0.1490196, 1, 1,
0.303933, -0.2708579, 2.577442, 0, 0.1411765, 1, 1,
0.3144281, -0.6142511, 3.145571, 0, 0.1372549, 1, 1,
0.3147803, -0.0354685, 0.3503896, 0, 0.1294118, 1, 1,
0.315635, -0.299452, 2.694478, 0, 0.1254902, 1, 1,
0.3158071, -1.044554, 1.931132, 0, 0.1176471, 1, 1,
0.3203217, 1.852014, 0.3825714, 0, 0.1137255, 1, 1,
0.3228021, -1.650904, 3.15405, 0, 0.1058824, 1, 1,
0.3237708, -0.7066672, 2.841332, 0, 0.09803922, 1, 1,
0.3264009, 0.556601, 0.4070603, 0, 0.09411765, 1, 1,
0.3275034, -0.6518084, 4.364404, 0, 0.08627451, 1, 1,
0.3295446, -1.411632, 3.13157, 0, 0.08235294, 1, 1,
0.3304567, -0.05334052, 1.44366, 0, 0.07450981, 1, 1,
0.3307695, -1.001404, 5.070324, 0, 0.07058824, 1, 1,
0.3338815, 0.2239528, 0.7826641, 0, 0.0627451, 1, 1,
0.3339249, 0.260901, 0.2480843, 0, 0.05882353, 1, 1,
0.3379165, 0.1051547, 1.27946, 0, 0.05098039, 1, 1,
0.3445362, 1.109235, -2.959542, 0, 0.04705882, 1, 1,
0.3454123, 1.291266, 1.024521, 0, 0.03921569, 1, 1,
0.350197, 0.2922024, 0.7312344, 0, 0.03529412, 1, 1,
0.3530948, -1.725047, 2.155658, 0, 0.02745098, 1, 1,
0.3545687, -0.5556617, 0.8108809, 0, 0.02352941, 1, 1,
0.3552028, -0.6689754, 3.498166, 0, 0.01568628, 1, 1,
0.3554532, -0.445042, 2.242022, 0, 0.01176471, 1, 1,
0.3582172, 1.393867, -1.210453, 0, 0.003921569, 1, 1,
0.3596868, -0.1521038, 2.549323, 0.003921569, 0, 1, 1,
0.3614537, -1.190817, 4.229967, 0.007843138, 0, 1, 1,
0.366163, -0.7475885, 1.470967, 0.01568628, 0, 1, 1,
0.3674765, -1.205932, 4.307493, 0.01960784, 0, 1, 1,
0.3703819, -1.046828, 3.358407, 0.02745098, 0, 1, 1,
0.3703867, -0.1170987, 3.82067, 0.03137255, 0, 1, 1,
0.3766213, 0.1726699, 0.3410553, 0.03921569, 0, 1, 1,
0.3780561, -1.272576, 3.124863, 0.04313726, 0, 1, 1,
0.378691, 0.7530688, 1.29873, 0.05098039, 0, 1, 1,
0.3822147, 0.7918357, -0.3956936, 0.05490196, 0, 1, 1,
0.3824336, -1.507399, 3.334066, 0.0627451, 0, 1, 1,
0.3907238, -1.026828, 2.663897, 0.06666667, 0, 1, 1,
0.392076, -1.362888, 4.071107, 0.07450981, 0, 1, 1,
0.3938307, 0.2055492, 2.56383, 0.07843138, 0, 1, 1,
0.3952124, 0.8478465, 1.10626, 0.08627451, 0, 1, 1,
0.399578, -0.3819413, 0.8223382, 0.09019608, 0, 1, 1,
0.3995929, -1.127522, 2.005887, 0.09803922, 0, 1, 1,
0.4037869, 0.2444742, 0.4665297, 0.1058824, 0, 1, 1,
0.4041977, -1.15219, 3.497018, 0.1098039, 0, 1, 1,
0.4047058, -0.9702042, 4.385038, 0.1176471, 0, 1, 1,
0.4062604, -0.4889963, 1.5702, 0.1215686, 0, 1, 1,
0.4082133, 0.5723951, 0.8731807, 0.1294118, 0, 1, 1,
0.4090334, 1.104649, 1.133942, 0.1333333, 0, 1, 1,
0.4091739, 1.236712, 0.4041643, 0.1411765, 0, 1, 1,
0.4137237, -0.09270156, 1.05038, 0.145098, 0, 1, 1,
0.4170976, 0.5761089, 0.3093779, 0.1529412, 0, 1, 1,
0.4185421, -0.7312942, 2.605269, 0.1568628, 0, 1, 1,
0.4197368, -1.055422, 2.857264, 0.1647059, 0, 1, 1,
0.4216066, -0.1827796, 2.694145, 0.1686275, 0, 1, 1,
0.4237782, 0.2114589, 0.5788688, 0.1764706, 0, 1, 1,
0.4255099, 1.362761, 0.1242848, 0.1803922, 0, 1, 1,
0.4373313, -2.50702, 2.640403, 0.1882353, 0, 1, 1,
0.439227, -0.1931514, 1.317862, 0.1921569, 0, 1, 1,
0.439418, 0.9695513, -0.2662829, 0.2, 0, 1, 1,
0.4414108, 1.947277, 1.273028, 0.2078431, 0, 1, 1,
0.4435703, 1.167811, 1.35155, 0.2117647, 0, 1, 1,
0.4467258, 0.3701825, 0.795297, 0.2196078, 0, 1, 1,
0.4467652, 0.3198705, 1.300574, 0.2235294, 0, 1, 1,
0.4490075, 0.9013955, -0.2185165, 0.2313726, 0, 1, 1,
0.449824, 0.9574376, 0.6985631, 0.2352941, 0, 1, 1,
0.4515508, 1.027751, 1.72862, 0.2431373, 0, 1, 1,
0.4538784, 1.308729, 0.03936226, 0.2470588, 0, 1, 1,
0.4578995, 0.2261822, 1.4094, 0.254902, 0, 1, 1,
0.4615754, 0.69353, 0.7136165, 0.2588235, 0, 1, 1,
0.4636494, 0.5729119, 2.897946, 0.2666667, 0, 1, 1,
0.4681691, -0.4842739, 2.364189, 0.2705882, 0, 1, 1,
0.4711025, 1.252431, 1.349365, 0.2784314, 0, 1, 1,
0.4727184, -0.2832436, 1.563557, 0.282353, 0, 1, 1,
0.4774875, 1.639842, -0.2054072, 0.2901961, 0, 1, 1,
0.4780554, -0.1627196, 1.970524, 0.2941177, 0, 1, 1,
0.4793407, 0.1883747, 3.552254, 0.3019608, 0, 1, 1,
0.4815518, -0.6011573, 3.869941, 0.3098039, 0, 1, 1,
0.4855853, -0.2465787, 1.928849, 0.3137255, 0, 1, 1,
0.4860969, 0.1526449, -0.09716535, 0.3215686, 0, 1, 1,
0.4927205, 0.2948614, 0.3287135, 0.3254902, 0, 1, 1,
0.4978186, 0.5012881, 0.6952643, 0.3333333, 0, 1, 1,
0.4992171, 1.77117, 1.25428, 0.3372549, 0, 1, 1,
0.5093366, 1.273242, 1.623361, 0.345098, 0, 1, 1,
0.5107438, -1.23134, 2.504737, 0.3490196, 0, 1, 1,
0.5169566, -0.9109874, 1.346427, 0.3568628, 0, 1, 1,
0.524934, 0.167629, 1.694165, 0.3607843, 0, 1, 1,
0.5257674, -0.5766552, 2.498342, 0.3686275, 0, 1, 1,
0.5259748, 1.271248, 0.4458846, 0.372549, 0, 1, 1,
0.5263075, -1.057378, 3.020108, 0.3803922, 0, 1, 1,
0.5275564, -0.5009316, 3.484125, 0.3843137, 0, 1, 1,
0.5309297, 0.07273234, 2.302357, 0.3921569, 0, 1, 1,
0.5320157, 0.6016079, 0.613727, 0.3960784, 0, 1, 1,
0.5368885, -0.1712569, 3.055007, 0.4039216, 0, 1, 1,
0.5370326, -1.035013, 2.781246, 0.4117647, 0, 1, 1,
0.5414324, 0.04420055, 3.628329, 0.4156863, 0, 1, 1,
0.5417144, -0.2524156, 2.990559, 0.4235294, 0, 1, 1,
0.5422941, 1.181539, 1.108326, 0.427451, 0, 1, 1,
0.5437914, 0.2221602, 0.3769998, 0.4352941, 0, 1, 1,
0.5526963, 0.8633636, 0.5391233, 0.4392157, 0, 1, 1,
0.5538449, 0.6486788, 2.105874, 0.4470588, 0, 1, 1,
0.5637914, 0.9473627, 0.2817985, 0.4509804, 0, 1, 1,
0.5705987, 0.1676251, 1.213495, 0.4588235, 0, 1, 1,
0.5875722, -0.4105329, 2.34473, 0.4627451, 0, 1, 1,
0.5888307, 1.952058, -0.860631, 0.4705882, 0, 1, 1,
0.5998312, -0.0681173, 3.80106, 0.4745098, 0, 1, 1,
0.6038859, -0.4621982, 1.924515, 0.4823529, 0, 1, 1,
0.6114973, -0.6603599, 1.019333, 0.4862745, 0, 1, 1,
0.6119954, -0.7342734, 1.571724, 0.4941176, 0, 1, 1,
0.6141852, -0.5421293, 3.956414, 0.5019608, 0, 1, 1,
0.6169873, 0.4585212, -0.8681372, 0.5058824, 0, 1, 1,
0.6172111, 1.62136, 0.4964059, 0.5137255, 0, 1, 1,
0.633616, 1.552219, -0.642091, 0.5176471, 0, 1, 1,
0.6399581, -0.6738279, 2.236581, 0.5254902, 0, 1, 1,
0.6400992, -0.3797789, 1.024324, 0.5294118, 0, 1, 1,
0.6418093, -0.7025148, 1.600378, 0.5372549, 0, 1, 1,
0.6456446, 0.5438801, 1.223413, 0.5411765, 0, 1, 1,
0.6460019, 0.88672, -0.1405294, 0.5490196, 0, 1, 1,
0.6498301, 0.1393306, 1.142799, 0.5529412, 0, 1, 1,
0.6499523, -0.380303, 0.3194658, 0.5607843, 0, 1, 1,
0.6534038, 0.1872651, 2.155847, 0.5647059, 0, 1, 1,
0.6547567, 0.02576585, 0.4061228, 0.572549, 0, 1, 1,
0.6551519, -0.4511598, 4.28544, 0.5764706, 0, 1, 1,
0.6583828, -1.330388, 3.680171, 0.5843138, 0, 1, 1,
0.6587929, -0.8531529, 2.20522, 0.5882353, 0, 1, 1,
0.6592162, 0.8080918, 0.7956336, 0.5960785, 0, 1, 1,
0.6592655, 0.06346111, -0.696757, 0.6039216, 0, 1, 1,
0.6609952, -1.34824, 1.633744, 0.6078432, 0, 1, 1,
0.6641291, -2.297049, 1.025235, 0.6156863, 0, 1, 1,
0.6645902, 0.3796033, 1.04655, 0.6196079, 0, 1, 1,
0.6683741, 0.2498341, 0.5724381, 0.627451, 0, 1, 1,
0.6734332, 0.8084715, 0.460936, 0.6313726, 0, 1, 1,
0.6753911, 1.310252, -0.4585479, 0.6392157, 0, 1, 1,
0.6782454, -1.414718, 1.416307, 0.6431373, 0, 1, 1,
0.6853289, 1.261824, -0.153836, 0.6509804, 0, 1, 1,
0.6864643, 0.8161493, 1.291478, 0.654902, 0, 1, 1,
0.6868036, 0.03661696, 0.8281093, 0.6627451, 0, 1, 1,
0.6872963, -0.6468015, 1.921204, 0.6666667, 0, 1, 1,
0.6928666, -1.897694, 1.413578, 0.6745098, 0, 1, 1,
0.7048306, 0.2311802, 1.87829, 0.6784314, 0, 1, 1,
0.7053834, -0.1816379, 2.784426, 0.6862745, 0, 1, 1,
0.7106797, 0.6751977, 1.350119, 0.6901961, 0, 1, 1,
0.7130652, -0.09448455, 1.713423, 0.6980392, 0, 1, 1,
0.7259652, 0.668341, 0.8214206, 0.7058824, 0, 1, 1,
0.7284732, -0.3389298, 1.83296, 0.7098039, 0, 1, 1,
0.729481, 0.1239538, 1.786552, 0.7176471, 0, 1, 1,
0.7325094, 0.7869459, 1.210253, 0.7215686, 0, 1, 1,
0.7404583, 0.9612173, 0.3482151, 0.7294118, 0, 1, 1,
0.7461216, -1.329952, 3.81267, 0.7333333, 0, 1, 1,
0.7540175, -0.4048907, 1.676324, 0.7411765, 0, 1, 1,
0.7541701, 0.1184989, 3.339418, 0.7450981, 0, 1, 1,
0.7543057, 0.9701776, 0.5546706, 0.7529412, 0, 1, 1,
0.75432, -1.924799, 3.083908, 0.7568628, 0, 1, 1,
0.7564703, -1.113216, 2.357905, 0.7647059, 0, 1, 1,
0.7587449, -1.27118, 2.666247, 0.7686275, 0, 1, 1,
0.7639268, -1.165497, 0.5438613, 0.7764706, 0, 1, 1,
0.7729098, 0.7062526, -0.6937171, 0.7803922, 0, 1, 1,
0.7740426, 2.431392, 0.489159, 0.7882353, 0, 1, 1,
0.7783879, -1.307658, 3.041665, 0.7921569, 0, 1, 1,
0.7785929, 0.3476204, 1.270018, 0.8, 0, 1, 1,
0.7790813, 0.2185853, 1.637608, 0.8078431, 0, 1, 1,
0.7803285, 1.73536, 1.908274, 0.8117647, 0, 1, 1,
0.7815273, -0.1332539, 1.578129, 0.8196079, 0, 1, 1,
0.7881803, -0.2049769, 1.673292, 0.8235294, 0, 1, 1,
0.7920475, 0.472977, 0.8081639, 0.8313726, 0, 1, 1,
0.795354, -0.7453486, 2.398172, 0.8352941, 0, 1, 1,
0.7962561, -1.296361, 4.523247, 0.8431373, 0, 1, 1,
0.7970166, -0.9050246, 2.571388, 0.8470588, 0, 1, 1,
0.8069876, 0.9921821, -0.02632546, 0.854902, 0, 1, 1,
0.8248962, 1.286665, 1.034757, 0.8588235, 0, 1, 1,
0.8315693, 0.7864569, -0.08492123, 0.8666667, 0, 1, 1,
0.8326219, -1.523147, 3.35883, 0.8705882, 0, 1, 1,
0.8386124, -0.9803029, 2.125952, 0.8784314, 0, 1, 1,
0.8464141, -1.302269, 1.928193, 0.8823529, 0, 1, 1,
0.8470975, -0.2042199, 1.916345, 0.8901961, 0, 1, 1,
0.8594207, 2.039438, -0.6235458, 0.8941177, 0, 1, 1,
0.8614157, -1.784431, 1.822716, 0.9019608, 0, 1, 1,
0.8626369, -0.1817614, 2.906693, 0.9098039, 0, 1, 1,
0.8684313, -1.583475, 1.322189, 0.9137255, 0, 1, 1,
0.8740563, 1.545299, 1.318152, 0.9215686, 0, 1, 1,
0.8778656, 0.1447684, 1.478289, 0.9254902, 0, 1, 1,
0.8895418, 0.5306131, 1.929731, 0.9333333, 0, 1, 1,
0.8897489, -1.323292, 2.130574, 0.9372549, 0, 1, 1,
0.9002157, -1.148032, 1.085369, 0.945098, 0, 1, 1,
0.9126268, 0.1654147, 2.086984, 0.9490196, 0, 1, 1,
0.9158118, 0.01743175, 0.9479042, 0.9568627, 0, 1, 1,
0.9208325, -0.3425231, 1.349405, 0.9607843, 0, 1, 1,
0.9223779, 0.6166386, 0.8654675, 0.9686275, 0, 1, 1,
0.9290214, -1.128672, 1.968732, 0.972549, 0, 1, 1,
0.9321331, 0.1203169, 2.209352, 0.9803922, 0, 1, 1,
0.9331585, -0.4136805, 1.68214, 0.9843137, 0, 1, 1,
0.936802, -0.8446963, 3.674043, 0.9921569, 0, 1, 1,
0.9372312, 0.2956536, 1.588821, 0.9960784, 0, 1, 1,
0.9415475, 0.4532372, 2.332329, 1, 0, 0.9960784, 1,
0.9425799, 0.6954625, -0.2761494, 1, 0, 0.9882353, 1,
0.9466806, 0.9615546, 1.495028, 1, 0, 0.9843137, 1,
0.952294, -0.4794606, 0.6094552, 1, 0, 0.9764706, 1,
0.9554756, -1.726899, 5.240226, 1, 0, 0.972549, 1,
0.9583177, 1.200043, -0.642956, 1, 0, 0.9647059, 1,
0.9602113, -1.258443, 2.171998, 1, 0, 0.9607843, 1,
0.9624341, 0.1523278, -0.7009175, 1, 0, 0.9529412, 1,
0.96596, -1.06419, 1.813357, 1, 0, 0.9490196, 1,
0.9677426, -0.381538, 1.282119, 1, 0, 0.9411765, 1,
0.9764427, 1.107797, 2.115966, 1, 0, 0.9372549, 1,
0.976621, -0.898366, 1.810563, 1, 0, 0.9294118, 1,
0.9778687, 1.99558, 1.135563, 1, 0, 0.9254902, 1,
0.9799859, 0.003846343, 3.072219, 1, 0, 0.9176471, 1,
0.9804251, 0.07259277, 1.073952, 1, 0, 0.9137255, 1,
0.9867502, -1.758612, 1.147131, 1, 0, 0.9058824, 1,
0.9923516, -0.9064077, 2.682871, 1, 0, 0.9019608, 1,
0.9986235, 0.0891007, 2.417625, 1, 0, 0.8941177, 1,
1.004337, -1.661551, 1.944866, 1, 0, 0.8862745, 1,
1.011437, -0.7789209, 3.074485, 1, 0, 0.8823529, 1,
1.011588, 0.6834737, 0.6926475, 1, 0, 0.8745098, 1,
1.014146, -0.7146463, 1.932644, 1, 0, 0.8705882, 1,
1.01469, -1.534064, 1.256599, 1, 0, 0.8627451, 1,
1.017736, 0.0002240664, 1.691789, 1, 0, 0.8588235, 1,
1.025089, 1.846934, 0.4527073, 1, 0, 0.8509804, 1,
1.027474, -0.6641459, 0.632059, 1, 0, 0.8470588, 1,
1.029235, -0.1749252, 0.8394091, 1, 0, 0.8392157, 1,
1.036349, -0.9985009, 3.181827, 1, 0, 0.8352941, 1,
1.03798, -1.330345, 4.667531, 1, 0, 0.827451, 1,
1.039239, -0.7665132, 2.416233, 1, 0, 0.8235294, 1,
1.046263, 0.7187864, 0.7743213, 1, 0, 0.8156863, 1,
1.046396, -0.8893787, 3.111608, 1, 0, 0.8117647, 1,
1.050954, 0.4581987, 1.629857, 1, 0, 0.8039216, 1,
1.054095, -0.02054439, 0.2447759, 1, 0, 0.7960784, 1,
1.059709, 1.147898, 1.472886, 1, 0, 0.7921569, 1,
1.065546, -1.017238, 2.114271, 1, 0, 0.7843137, 1,
1.066857, -0.394038, 2.880448, 1, 0, 0.7803922, 1,
1.076389, 0.001720265, 0.6901094, 1, 0, 0.772549, 1,
1.089426, 0.9591524, -0.6449493, 1, 0, 0.7686275, 1,
1.089695, -0.1091073, 2.171555, 1, 0, 0.7607843, 1,
1.090329, -0.7691029, 3.275814, 1, 0, 0.7568628, 1,
1.091272, -0.3129131, 0.6782, 1, 0, 0.7490196, 1,
1.095208, -0.8099956, 3.512108, 1, 0, 0.7450981, 1,
1.098531, -1.12786, 1.47655, 1, 0, 0.7372549, 1,
1.100215, 1.985247, 0.3222239, 1, 0, 0.7333333, 1,
1.100241, 1.961277, 0.9045368, 1, 0, 0.7254902, 1,
1.109797, -0.6745673, 1.269786, 1, 0, 0.7215686, 1,
1.110399, -0.5263545, 0.5941625, 1, 0, 0.7137255, 1,
1.117052, 0.7119637, 1.712907, 1, 0, 0.7098039, 1,
1.118328, 0.269825, 0.8455942, 1, 0, 0.7019608, 1,
1.118749, -1.655116, 1.369203, 1, 0, 0.6941177, 1,
1.119801, -0.2522791, 1.106527, 1, 0, 0.6901961, 1,
1.128254, 0.7806381, -0.8839503, 1, 0, 0.682353, 1,
1.136416, -1.884327, 3.253114, 1, 0, 0.6784314, 1,
1.13824, -0.9542415, 3.002895, 1, 0, 0.6705883, 1,
1.140753, 0.4756796, 2.03089, 1, 0, 0.6666667, 1,
1.149051, 0.6774878, 2.00038, 1, 0, 0.6588235, 1,
1.16285, 0.4592184, 1.315774, 1, 0, 0.654902, 1,
1.169697, -0.9675667, 0.6664226, 1, 0, 0.6470588, 1,
1.180327, 0.7715584, 3.096862, 1, 0, 0.6431373, 1,
1.187809, -0.7794971, 3.046888, 1, 0, 0.6352941, 1,
1.196405, -0.1339591, 2.257124, 1, 0, 0.6313726, 1,
1.202501, -0.3082704, 1.241574, 1, 0, 0.6235294, 1,
1.205559, 0.8234679, 1.342098, 1, 0, 0.6196079, 1,
1.209545, -2.238804, 2.39, 1, 0, 0.6117647, 1,
1.217546, 0.678357, 2.17897, 1, 0, 0.6078432, 1,
1.219147, 1.056359, -0.9746763, 1, 0, 0.6, 1,
1.223283, -2.265913, 2.248914, 1, 0, 0.5921569, 1,
1.230241, 0.3153479, 3.509757, 1, 0, 0.5882353, 1,
1.232689, 0.2260199, 0.5301642, 1, 0, 0.5803922, 1,
1.237879, 0.04550328, 2.870045, 1, 0, 0.5764706, 1,
1.244284, 1.35191, 0.8989408, 1, 0, 0.5686275, 1,
1.250099, -0.5563904, 1.349061, 1, 0, 0.5647059, 1,
1.253078, -0.6337049, 3.079751, 1, 0, 0.5568628, 1,
1.256412, -0.5073679, 0.6275276, 1, 0, 0.5529412, 1,
1.260981, -1.987346, 2.588292, 1, 0, 0.5450981, 1,
1.264423, -0.6391712, 3.261325, 1, 0, 0.5411765, 1,
1.26663, -1.618215, 3.595079, 1, 0, 0.5333334, 1,
1.26769, 0.25865, 3.574847, 1, 0, 0.5294118, 1,
1.271118, -0.001937831, 2.272393, 1, 0, 0.5215687, 1,
1.271637, -0.5926222, 4.392446, 1, 0, 0.5176471, 1,
1.275178, -0.9316221, 3.275341, 1, 0, 0.509804, 1,
1.278711, -1.0027, 3.164454, 1, 0, 0.5058824, 1,
1.281542, 0.5518626, 0.2223952, 1, 0, 0.4980392, 1,
1.282246, 0.7077588, 1.707551, 1, 0, 0.4901961, 1,
1.288396, -0.8720675, 2.168733, 1, 0, 0.4862745, 1,
1.321522, 0.0218385, 1.690799, 1, 0, 0.4784314, 1,
1.336205, 0.1063547, -0.230408, 1, 0, 0.4745098, 1,
1.37652, -0.8952804, 1.190045, 1, 0, 0.4666667, 1,
1.379517, -0.8917285, 1.124315, 1, 0, 0.4627451, 1,
1.379773, 1.081154, 0.3639077, 1, 0, 0.454902, 1,
1.385401, -0.8620954, 2.719095, 1, 0, 0.4509804, 1,
1.391652, 0.5851679, 0.6722936, 1, 0, 0.4431373, 1,
1.394324, -0.7547165, 2.197911, 1, 0, 0.4392157, 1,
1.40032, 2.448212, 0.9112151, 1, 0, 0.4313726, 1,
1.418404, 1.71449, 0.8103374, 1, 0, 0.427451, 1,
1.419743, 0.2568994, 2.353888, 1, 0, 0.4196078, 1,
1.422669, 1.93922, 0.8030582, 1, 0, 0.4156863, 1,
1.425367, 1.136286, 1.033599, 1, 0, 0.4078431, 1,
1.427824, -0.6635332, 2.144276, 1, 0, 0.4039216, 1,
1.439906, 0.6737363, 1.162369, 1, 0, 0.3960784, 1,
1.447998, 1.00542, 1.336522, 1, 0, 0.3882353, 1,
1.452545, 0.8531984, 0.7606713, 1, 0, 0.3843137, 1,
1.480504, 1.18985, -1.961069, 1, 0, 0.3764706, 1,
1.49203, -0.7375464, 1.285834, 1, 0, 0.372549, 1,
1.510682, 0.420608, 1.388294, 1, 0, 0.3647059, 1,
1.512815, 0.5333425, 1.131627, 1, 0, 0.3607843, 1,
1.512859, -0.3527497, 2.138301, 1, 0, 0.3529412, 1,
1.523609, -0.01688378, -0.004721961, 1, 0, 0.3490196, 1,
1.543121, 0.9998659, 2.110723, 1, 0, 0.3411765, 1,
1.546993, 0.2960232, -2.159277, 1, 0, 0.3372549, 1,
1.549222, -0.3148475, -0.2804665, 1, 0, 0.3294118, 1,
1.55287, 0.9270927, -0.2019998, 1, 0, 0.3254902, 1,
1.566771, -1.334264, 1.874903, 1, 0, 0.3176471, 1,
1.569975, -0.9767808, 2.154764, 1, 0, 0.3137255, 1,
1.579387, -0.5917878, -0.1721265, 1, 0, 0.3058824, 1,
1.587707, -0.5581501, 3.923873, 1, 0, 0.2980392, 1,
1.624934, 1.490386, 2.14434, 1, 0, 0.2941177, 1,
1.63405, -0.2999123, 1.484313, 1, 0, 0.2862745, 1,
1.637709, 0.8066238, 3.040075, 1, 0, 0.282353, 1,
1.640686, -0.3684944, 1.514913, 1, 0, 0.2745098, 1,
1.642348, -0.06581339, 1.434582, 1, 0, 0.2705882, 1,
1.656905, -1.052662, 1.999491, 1, 0, 0.2627451, 1,
1.689975, 0.605008, 0.4399361, 1, 0, 0.2588235, 1,
1.732494, 1.456279, 0.4241396, 1, 0, 0.2509804, 1,
1.736232, -0.5318294, 1.833838, 1, 0, 0.2470588, 1,
1.751297, -0.8539984, 2.175725, 1, 0, 0.2392157, 1,
1.763688, 0.3434802, 1.679985, 1, 0, 0.2352941, 1,
1.766236, 1.771648, 1.433597, 1, 0, 0.227451, 1,
1.775493, 0.2549682, 1.659494, 1, 0, 0.2235294, 1,
1.790956, -0.1863611, 1.472755, 1, 0, 0.2156863, 1,
1.802551, 0.7700904, 1.126437, 1, 0, 0.2117647, 1,
1.813095, -0.2083436, 1.719198, 1, 0, 0.2039216, 1,
1.853938, -0.767996, 2.007191, 1, 0, 0.1960784, 1,
1.876683, -0.3208763, 3.192043, 1, 0, 0.1921569, 1,
1.877612, -0.0555601, 3.218241, 1, 0, 0.1843137, 1,
1.886765, -1.209174, 3.756629, 1, 0, 0.1803922, 1,
1.891896, 2.285922, 0.3736045, 1, 0, 0.172549, 1,
1.919611, 1.417095, 0.8333594, 1, 0, 0.1686275, 1,
1.92813, 0.7730352, 1.516969, 1, 0, 0.1607843, 1,
1.931627, -1.223949, 1.784466, 1, 0, 0.1568628, 1,
1.954329, 1.869645, 1.690109, 1, 0, 0.1490196, 1,
1.974703, 0.01416833, 0.9164356, 1, 0, 0.145098, 1,
1.986064, 0.9871644, 3.148478, 1, 0, 0.1372549, 1,
1.988193, 0.6928562, -0.1534782, 1, 0, 0.1333333, 1,
1.998248, 1.142547, -0.0488104, 1, 0, 0.1254902, 1,
2.018729, 0.9383134, 1.775594, 1, 0, 0.1215686, 1,
2.029461, 0.3783779, 1.145968, 1, 0, 0.1137255, 1,
2.03499, 0.1724366, 2.000939, 1, 0, 0.1098039, 1,
2.051924, -0.2087244, 1.39571, 1, 0, 0.1019608, 1,
2.077588, -1.941532, 3.997351, 1, 0, 0.09411765, 1,
2.103394, 1.243071, 0.3273018, 1, 0, 0.09019608, 1,
2.105505, 1.141583, 0.5685189, 1, 0, 0.08235294, 1,
2.14185, 0.5293637, 2.86941, 1, 0, 0.07843138, 1,
2.155946, -0.7804577, 0.078183, 1, 0, 0.07058824, 1,
2.172064, -2.082942, 1.975936, 1, 0, 0.06666667, 1,
2.423433, 0.4005119, 1.494922, 1, 0, 0.05882353, 1,
2.487947, 0.5307117, 1.549245, 1, 0, 0.05490196, 1,
2.534269, -0.5461717, 0.6289821, 1, 0, 0.04705882, 1,
2.589714, -0.2961879, 1.023642, 1, 0, 0.04313726, 1,
2.638566, 0.3864484, -0.3338024, 1, 0, 0.03529412, 1,
2.695403, -0.6786892, 1.78485, 1, 0, 0.03137255, 1,
2.706554, 0.2149304, 1.647164, 1, 0, 0.02352941, 1,
2.923515, 0.7087588, 0.1280346, 1, 0, 0.01960784, 1,
2.933966, 0.3794645, 1.623825, 1, 0, 0.01176471, 1,
2.936939, 0.2651412, 1.446289, 1, 0, 0.007843138, 1
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
-0.02424276, -4.377235, -7.265661, 0, -0.5, 0.5, 0.5,
-0.02424276, -4.377235, -7.265661, 1, -0.5, 0.5, 0.5,
-0.02424276, -4.377235, -7.265661, 1, 1.5, 0.5, 0.5,
-0.02424276, -4.377235, -7.265661, 0, 1.5, 0.5, 0.5
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
-3.989265, 0.39308, -7.265661, 0, -0.5, 0.5, 0.5,
-3.989265, 0.39308, -7.265661, 1, -0.5, 0.5, 0.5,
-3.989265, 0.39308, -7.265661, 1, 1.5, 0.5, 0.5,
-3.989265, 0.39308, -7.265661, 0, 1.5, 0.5, 0.5
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
-3.989265, -4.377235, -0.1064548, 0, -0.5, 0.5, 0.5,
-3.989265, -4.377235, -0.1064548, 1, -0.5, 0.5, 0.5,
-3.989265, -4.377235, -0.1064548, 1, 1.5, 0.5, 0.5,
-3.989265, -4.377235, -0.1064548, 0, 1.5, 0.5, 0.5
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
-2, -3.276393, -5.613536,
2, -3.276393, -5.613536,
-2, -3.276393, -5.613536,
-2, -3.459867, -5.88889,
-1, -3.276393, -5.613536,
-1, -3.459867, -5.88889,
0, -3.276393, -5.613536,
0, -3.459867, -5.88889,
1, -3.276393, -5.613536,
1, -3.459867, -5.88889,
2, -3.276393, -5.613536,
2, -3.459867, -5.88889
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
-2, -3.826814, -6.439599, 0, -0.5, 0.5, 0.5,
-2, -3.826814, -6.439599, 1, -0.5, 0.5, 0.5,
-2, -3.826814, -6.439599, 1, 1.5, 0.5, 0.5,
-2, -3.826814, -6.439599, 0, 1.5, 0.5, 0.5,
-1, -3.826814, -6.439599, 0, -0.5, 0.5, 0.5,
-1, -3.826814, -6.439599, 1, -0.5, 0.5, 0.5,
-1, -3.826814, -6.439599, 1, 1.5, 0.5, 0.5,
-1, -3.826814, -6.439599, 0, 1.5, 0.5, 0.5,
0, -3.826814, -6.439599, 0, -0.5, 0.5, 0.5,
0, -3.826814, -6.439599, 1, -0.5, 0.5, 0.5,
0, -3.826814, -6.439599, 1, 1.5, 0.5, 0.5,
0, -3.826814, -6.439599, 0, 1.5, 0.5, 0.5,
1, -3.826814, -6.439599, 0, -0.5, 0.5, 0.5,
1, -3.826814, -6.439599, 1, -0.5, 0.5, 0.5,
1, -3.826814, -6.439599, 1, 1.5, 0.5, 0.5,
1, -3.826814, -6.439599, 0, 1.5, 0.5, 0.5,
2, -3.826814, -6.439599, 0, -0.5, 0.5, 0.5,
2, -3.826814, -6.439599, 1, -0.5, 0.5, 0.5,
2, -3.826814, -6.439599, 1, 1.5, 0.5, 0.5,
2, -3.826814, -6.439599, 0, 1.5, 0.5, 0.5
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
-3.07426, -2, -5.613536,
-3.07426, 2, -5.613536,
-3.07426, -2, -5.613536,
-3.226761, -2, -5.88889,
-3.07426, 0, -5.613536,
-3.226761, 0, -5.88889,
-3.07426, 2, -5.613536,
-3.226761, 2, -5.88889
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
"0",
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
-3.531762, -2, -6.439599, 0, -0.5, 0.5, 0.5,
-3.531762, -2, -6.439599, 1, -0.5, 0.5, 0.5,
-3.531762, -2, -6.439599, 1, 1.5, 0.5, 0.5,
-3.531762, -2, -6.439599, 0, 1.5, 0.5, 0.5,
-3.531762, 0, -6.439599, 0, -0.5, 0.5, 0.5,
-3.531762, 0, -6.439599, 1, -0.5, 0.5, 0.5,
-3.531762, 0, -6.439599, 1, 1.5, 0.5, 0.5,
-3.531762, 0, -6.439599, 0, 1.5, 0.5, 0.5,
-3.531762, 2, -6.439599, 0, -0.5, 0.5, 0.5,
-3.531762, 2, -6.439599, 1, -0.5, 0.5, 0.5,
-3.531762, 2, -6.439599, 1, 1.5, 0.5, 0.5,
-3.531762, 2, -6.439599, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.07426, -3.276393, -4,
-3.07426, -3.276393, 4,
-3.07426, -3.276393, -4,
-3.226761, -3.459867, -4,
-3.07426, -3.276393, -2,
-3.226761, -3.459867, -2,
-3.07426, -3.276393, 0,
-3.226761, -3.459867, 0,
-3.07426, -3.276393, 2,
-3.226761, -3.459867, 2,
-3.07426, -3.276393, 4,
-3.226761, -3.459867, 4
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
-3.531762, -3.826814, -4, 0, -0.5, 0.5, 0.5,
-3.531762, -3.826814, -4, 1, -0.5, 0.5, 0.5,
-3.531762, -3.826814, -4, 1, 1.5, 0.5, 0.5,
-3.531762, -3.826814, -4, 0, 1.5, 0.5, 0.5,
-3.531762, -3.826814, -2, 0, -0.5, 0.5, 0.5,
-3.531762, -3.826814, -2, 1, -0.5, 0.5, 0.5,
-3.531762, -3.826814, -2, 1, 1.5, 0.5, 0.5,
-3.531762, -3.826814, -2, 0, 1.5, 0.5, 0.5,
-3.531762, -3.826814, 0, 0, -0.5, 0.5, 0.5,
-3.531762, -3.826814, 0, 1, -0.5, 0.5, 0.5,
-3.531762, -3.826814, 0, 1, 1.5, 0.5, 0.5,
-3.531762, -3.826814, 0, 0, 1.5, 0.5, 0.5,
-3.531762, -3.826814, 2, 0, -0.5, 0.5, 0.5,
-3.531762, -3.826814, 2, 1, -0.5, 0.5, 0.5,
-3.531762, -3.826814, 2, 1, 1.5, 0.5, 0.5,
-3.531762, -3.826814, 2, 0, 1.5, 0.5, 0.5,
-3.531762, -3.826814, 4, 0, -0.5, 0.5, 0.5,
-3.531762, -3.826814, 4, 1, -0.5, 0.5, 0.5,
-3.531762, -3.826814, 4, 1, 1.5, 0.5, 0.5,
-3.531762, -3.826814, 4, 0, 1.5, 0.5, 0.5
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
-3.07426, -3.276393, -5.613536,
-3.07426, 4.062553, -5.613536,
-3.07426, -3.276393, 5.400627,
-3.07426, 4.062553, 5.400627,
-3.07426, -3.276393, -5.613536,
-3.07426, -3.276393, 5.400627,
-3.07426, 4.062553, -5.613536,
-3.07426, 4.062553, 5.400627,
-3.07426, -3.276393, -5.613536,
3.025774, -3.276393, -5.613536,
-3.07426, -3.276393, 5.400627,
3.025774, -3.276393, 5.400627,
-3.07426, 4.062553, -5.613536,
3.025774, 4.062553, -5.613536,
-3.07426, 4.062553, 5.400627,
3.025774, 4.062553, 5.400627,
3.025774, -3.276393, -5.613536,
3.025774, 4.062553, -5.613536,
3.025774, -3.276393, 5.400627,
3.025774, 4.062553, 5.400627,
3.025774, -3.276393, -5.613536,
3.025774, -3.276393, 5.400627,
3.025774, 4.062553, -5.613536,
3.025774, 4.062553, 5.400627
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
var radius = 7.781883;
var distance = 34.62247;
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
mvMatrix.translate( 0.02424276, -0.39308, 0.1064548 );
mvMatrix.scale( 1.379324, 1.146476, 0.7639186 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62247);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Dichlorpropene<-read.table("Dichlorpropene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dichlorpropene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dichlorpropene' not found
```

```r
y<-Dichlorpropene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dichlorpropene' not found
```

```r
z<-Dichlorpropene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dichlorpropene' not found
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
-2.985424, -0.08868067, -2.085551, 0, 0, 1, 1, 1,
-2.912439, -2.780334, -4.439715, 1, 0, 0, 1, 1,
-2.662975, -0.2142338, -1.973165, 1, 0, 0, 1, 1,
-2.646957, 0.6129532, -2.19838, 1, 0, 0, 1, 1,
-2.585771, -1.453556, -0.7812295, 1, 0, 0, 1, 1,
-2.565743, 1.01549, -1.204448, 1, 0, 0, 1, 1,
-2.522109, 0.3639229, -1.360193, 0, 0, 0, 1, 1,
-2.465726, -0.5172869, -2.816801, 0, 0, 0, 1, 1,
-2.426951, 2.518785, -1.545952, 0, 0, 0, 1, 1,
-2.418214, -0.2806498, 0.2627241, 0, 0, 0, 1, 1,
-2.417844, -0.7769046, -2.375232, 0, 0, 0, 1, 1,
-2.32919, 0.6833817, -1.755181, 0, 0, 0, 1, 1,
-2.295053, 0.8958614, -0.2222624, 0, 0, 0, 1, 1,
-2.293973, -1.56985, -2.077961, 1, 1, 1, 1, 1,
-2.23962, 0.360666, -1.679679, 1, 1, 1, 1, 1,
-2.208766, -0.2691428, 0.2467999, 1, 1, 1, 1, 1,
-2.176754, -0.4770991, -2.226292, 1, 1, 1, 1, 1,
-2.173541, -1.134954, -3.32012, 1, 1, 1, 1, 1,
-2.169192, -0.4383928, -0.7295471, 1, 1, 1, 1, 1,
-2.15823, -2.069486, -3.666987, 1, 1, 1, 1, 1,
-2.089533, 0.4896535, -0.2868121, 1, 1, 1, 1, 1,
-2.087628, 0.5328708, -0.9126972, 1, 1, 1, 1, 1,
-2.075758, 0.4609953, -1.775556, 1, 1, 1, 1, 1,
-2.048778, 1.128942, -0.9212261, 1, 1, 1, 1, 1,
-1.97464, -0.03804965, 0.01014458, 1, 1, 1, 1, 1,
-1.974354, -0.4945373, -0.7936067, 1, 1, 1, 1, 1,
-1.962267, -0.7164888, -1.183548, 1, 1, 1, 1, 1,
-1.959723, -0.7010087, -2.861031, 1, 1, 1, 1, 1,
-1.923405, -1.142869, -3.460482, 0, 0, 1, 1, 1,
-1.913339, 1.285344, -2.115871, 1, 0, 0, 1, 1,
-1.908055, -2.188434, -2.175756, 1, 0, 0, 1, 1,
-1.89486, 0.4397769, 0.2819867, 1, 0, 0, 1, 1,
-1.888496, 0.8641952, -1.299604, 1, 0, 0, 1, 1,
-1.886229, -0.6586255, -1.528217, 1, 0, 0, 1, 1,
-1.874271, 1.403571, -1.875792, 0, 0, 0, 1, 1,
-1.848558, 1.145444, -1.078423, 0, 0, 0, 1, 1,
-1.839219, 0.3233733, -2.218417, 0, 0, 0, 1, 1,
-1.803552, 1.399286, -1.783141, 0, 0, 0, 1, 1,
-1.798247, -1.277047, -2.702085, 0, 0, 0, 1, 1,
-1.785547, -0.5599744, -3.355814, 0, 0, 0, 1, 1,
-1.761315, 1.696923, -1.249343, 0, 0, 0, 1, 1,
-1.758598, 0.9377688, -1.546023, 1, 1, 1, 1, 1,
-1.73914, -1.059149, -2.244171, 1, 1, 1, 1, 1,
-1.737742, 1.173829, -1.243433, 1, 1, 1, 1, 1,
-1.726629, 0.5861928, -0.6707096, 1, 1, 1, 1, 1,
-1.713805, 2.302404, -2.118955, 1, 1, 1, 1, 1,
-1.713793, 1.298926, -0.3637294, 1, 1, 1, 1, 1,
-1.701395, 0.9557298, -2.215692, 1, 1, 1, 1, 1,
-1.687613, 2.325275, 0.2197202, 1, 1, 1, 1, 1,
-1.68567, 0.9032851, -0.7460639, 1, 1, 1, 1, 1,
-1.660406, 0.6056529, -0.6072366, 1, 1, 1, 1, 1,
-1.653553, 1.092936, -2.071255, 1, 1, 1, 1, 1,
-1.65063, 0.1871686, -0.7033394, 1, 1, 1, 1, 1,
-1.645282, -0.2102371, -1.784445, 1, 1, 1, 1, 1,
-1.64169, -0.8004746, -1.666614, 1, 1, 1, 1, 1,
-1.632948, -0.2377005, -0.08169962, 1, 1, 1, 1, 1,
-1.619416, 0.2325278, -1.799116, 0, 0, 1, 1, 1,
-1.604026, 0.193982, -0.8861757, 1, 0, 0, 1, 1,
-1.595887, 0.3201806, -1.212246, 1, 0, 0, 1, 1,
-1.584655, 0.769859, -1.937731, 1, 0, 0, 1, 1,
-1.579347, 0.17451, 0.7479833, 1, 0, 0, 1, 1,
-1.575824, -0.5278161, -3.033352, 1, 0, 0, 1, 1,
-1.562371, 1.89716, -1.431847, 0, 0, 0, 1, 1,
-1.56163, 0.4136442, -0.8295273, 0, 0, 0, 1, 1,
-1.55659, 1.93503, 0.7005104, 0, 0, 0, 1, 1,
-1.548458, -0.6665329, -1.227481, 0, 0, 0, 1, 1,
-1.544749, 0.05112853, -1.5315, 0, 0, 0, 1, 1,
-1.532115, -0.6345391, -0.1488829, 0, 0, 0, 1, 1,
-1.53168, 1.769663, -1.052454, 0, 0, 0, 1, 1,
-1.500856, -1.336099, -1.829711, 1, 1, 1, 1, 1,
-1.495023, -0.1568866, -1.154993, 1, 1, 1, 1, 1,
-1.493505, -1.029918, 0.1765672, 1, 1, 1, 1, 1,
-1.492774, -2.188339, -3.231918, 1, 1, 1, 1, 1,
-1.48158, 0.5244451, -1.76488, 1, 1, 1, 1, 1,
-1.475079, -0.05936697, -3.218719, 1, 1, 1, 1, 1,
-1.466376, 0.8425725, -4.065388, 1, 1, 1, 1, 1,
-1.465091, 0.4437683, -1.973441, 1, 1, 1, 1, 1,
-1.454962, -0.1190401, -1.479357, 1, 1, 1, 1, 1,
-1.453842, -0.7665992, -1.595839, 1, 1, 1, 1, 1,
-1.437687, -0.8027983, -2.171206, 1, 1, 1, 1, 1,
-1.436358, -2.763626, -1.398896, 1, 1, 1, 1, 1,
-1.431318, 0.5343872, -1.178889, 1, 1, 1, 1, 1,
-1.421188, -1.644113, -3.463297, 1, 1, 1, 1, 1,
-1.420776, 2.198498, -0.01471762, 1, 1, 1, 1, 1,
-1.420433, -0.6279173, -1.264675, 0, 0, 1, 1, 1,
-1.408948, -0.6891463, -3.263547, 1, 0, 0, 1, 1,
-1.406952, 0.3736505, -0.9014181, 1, 0, 0, 1, 1,
-1.400363, -1.359226, -1.419456, 1, 0, 0, 1, 1,
-1.399078, -0.5856555, -1.015928, 1, 0, 0, 1, 1,
-1.397878, -0.05338387, -2.176345, 1, 0, 0, 1, 1,
-1.392291, 0.4763506, -1.385785, 0, 0, 0, 1, 1,
-1.381318, 0.546867, -2.262652, 0, 0, 0, 1, 1,
-1.376431, -1.909891, -3.760337, 0, 0, 0, 1, 1,
-1.375474, 0.1098407, -1.113192, 0, 0, 0, 1, 1,
-1.374161, -0.1670038, -1.616525, 0, 0, 0, 1, 1,
-1.369625, 0.7876896, -0.9012166, 0, 0, 0, 1, 1,
-1.367356, 2.413156, -0.68635, 0, 0, 0, 1, 1,
-1.366739, -2.30958, -3.717139, 1, 1, 1, 1, 1,
-1.361223, 0.5673527, -1.896532, 1, 1, 1, 1, 1,
-1.348269, 0.2549279, -2.148209, 1, 1, 1, 1, 1,
-1.347865, -2.180533, -2.825943, 1, 1, 1, 1, 1,
-1.340728, 0.5616727, -1.641749, 1, 1, 1, 1, 1,
-1.333331, 1.290426, 0.04367191, 1, 1, 1, 1, 1,
-1.324041, -0.009074514, -1.646839, 1, 1, 1, 1, 1,
-1.320323, 1.258094, -0.8801288, 1, 1, 1, 1, 1,
-1.317946, -0.5858626, -2.545642, 1, 1, 1, 1, 1,
-1.316807, 0.4477729, -0.4519994, 1, 1, 1, 1, 1,
-1.316159, 0.3992196, 0.7777531, 1, 1, 1, 1, 1,
-1.316141, -2.014073, -1.024284, 1, 1, 1, 1, 1,
-1.311196, 1.734641, -0.135809, 1, 1, 1, 1, 1,
-1.309034, -1.397738, -1.761135, 1, 1, 1, 1, 1,
-1.294404, 1.41178, -0.5911573, 1, 1, 1, 1, 1,
-1.284438, 1.250142, -1.228193, 0, 0, 1, 1, 1,
-1.283553, -0.4641337, -4.018257, 1, 0, 0, 1, 1,
-1.280393, -0.01050123, -0.4828516, 1, 0, 0, 1, 1,
-1.26618, 1.003193, 0.04271293, 1, 0, 0, 1, 1,
-1.258928, -1.193949, -3.574752, 1, 0, 0, 1, 1,
-1.258319, -1.416886, -1.588151, 1, 0, 0, 1, 1,
-1.256663, -1.219775, -0.7584702, 0, 0, 0, 1, 1,
-1.25612, 0.5472067, 0.5404276, 0, 0, 0, 1, 1,
-1.254853, -1.088489, -1.918967, 0, 0, 0, 1, 1,
-1.245163, -0.856041, -3.038807, 0, 0, 0, 1, 1,
-1.233499, 0.2116519, -2.119765, 0, 0, 0, 1, 1,
-1.230243, -0.296655, -1.996615, 0, 0, 0, 1, 1,
-1.227272, -0.4990564, -1.307041, 0, 0, 0, 1, 1,
-1.201867, -0.829952, -1.058725, 1, 1, 1, 1, 1,
-1.19692, -0.7040234, -3.111463, 1, 1, 1, 1, 1,
-1.195597, -0.9745833, -1.610786, 1, 1, 1, 1, 1,
-1.195024, -0.9237798, -1.573999, 1, 1, 1, 1, 1,
-1.19202, -0.9490113, -1.918334, 1, 1, 1, 1, 1,
-1.184703, 3.098414, 0.7726511, 1, 1, 1, 1, 1,
-1.167199, -0.9292942, -2.75824, 1, 1, 1, 1, 1,
-1.155887, -0.05826864, -4.906056, 1, 1, 1, 1, 1,
-1.153919, -0.5687599, -2.723747, 1, 1, 1, 1, 1,
-1.149927, 0.9117494, 0.1609947, 1, 1, 1, 1, 1,
-1.146099, 0.8048691, -0.5214113, 1, 1, 1, 1, 1,
-1.144596, 0.05705332, -2.150191, 1, 1, 1, 1, 1,
-1.143237, -0.6980633, -3.621691, 1, 1, 1, 1, 1,
-1.139417, -1.801012, -2.554278, 1, 1, 1, 1, 1,
-1.138342, 0.8717763, 0.7930565, 1, 1, 1, 1, 1,
-1.130736, 0.3341747, 1.399448, 0, 0, 1, 1, 1,
-1.130321, -0.2946124, -2.32496, 1, 0, 0, 1, 1,
-1.121975, 2.256875, -0.6449878, 1, 0, 0, 1, 1,
-1.115543, -1.450646, -2.797583, 1, 0, 0, 1, 1,
-1.105658, -0.0728351, -1.677453, 1, 0, 0, 1, 1,
-1.101973, 0.3431448, 0.7775652, 1, 0, 0, 1, 1,
-1.099927, -1.413449, -2.486593, 0, 0, 0, 1, 1,
-1.097238, -0.843628, -1.298326, 0, 0, 0, 1, 1,
-1.091345, -0.180488, -0.5671952, 0, 0, 0, 1, 1,
-1.082742, -1.427049, -3.355627, 0, 0, 0, 1, 1,
-1.078676, 2.138084, -1.737397, 0, 0, 0, 1, 1,
-1.077019, 0.5853693, -0.7837184, 0, 0, 0, 1, 1,
-1.074874, -0.2660352, -1.291776, 0, 0, 0, 1, 1,
-1.062791, 1.52138, -0.04352783, 1, 1, 1, 1, 1,
-1.060138, -2.397115, -0.1457063, 1, 1, 1, 1, 1,
-1.049123, 0.3397299, -2.530525, 1, 1, 1, 1, 1,
-1.048634, 0.293366, 1.010376, 1, 1, 1, 1, 1,
-1.030892, -2.186384, -4.148135, 1, 1, 1, 1, 1,
-1.027494, 0.7453965, -1.106472, 1, 1, 1, 1, 1,
-1.026552, 0.5365013, -0.9774147, 1, 1, 1, 1, 1,
-1.018421, -0.5510395, -0.04648469, 1, 1, 1, 1, 1,
-1.017826, 0.6131227, 0.3454991, 1, 1, 1, 1, 1,
-1.013085, -1.513041, -2.149963, 1, 1, 1, 1, 1,
-1.012719, 0.03923671, -0.7508155, 1, 1, 1, 1, 1,
-1.00629, -1.188344, -2.193637, 1, 1, 1, 1, 1,
-1.002809, -0.2850437, -2.598145, 1, 1, 1, 1, 1,
-0.9954937, -0.9921428, 0.008075574, 1, 1, 1, 1, 1,
-0.9891987, -0.6389266, 0.01799302, 1, 1, 1, 1, 1,
-0.9816375, -1.727172, -3.713528, 0, 0, 1, 1, 1,
-0.9786977, -0.9527969, -4.8427, 1, 0, 0, 1, 1,
-0.9782097, 1.105555, -0.6649482, 1, 0, 0, 1, 1,
-0.9781935, -0.06671046, -1.571179, 1, 0, 0, 1, 1,
-0.9680518, -1.860903, -1.575372, 1, 0, 0, 1, 1,
-0.9659465, 0.5705188, 0.0879207, 1, 0, 0, 1, 1,
-0.9646159, 1.006507, -1.148065, 0, 0, 0, 1, 1,
-0.9593937, -1.614719, -1.622737, 0, 0, 0, 1, 1,
-0.9590024, -0.9357166, -4.151137, 0, 0, 0, 1, 1,
-0.9544948, -0.1653689, -2.525492, 0, 0, 0, 1, 1,
-0.9385901, 2.116644, -0.1480857, 0, 0, 0, 1, 1,
-0.9371218, 1.392597, 1.030454, 0, 0, 0, 1, 1,
-0.9363266, 1.608727, 0.06684857, 0, 0, 0, 1, 1,
-0.935066, -1.139323, -2.100368, 1, 1, 1, 1, 1,
-0.9252771, -0.447257, -3.684156, 1, 1, 1, 1, 1,
-0.9213407, 1.127031, 0.03867805, 1, 1, 1, 1, 1,
-0.9151085, 0.9536647, -1.185606, 1, 1, 1, 1, 1,
-0.907602, -0.4357185, -3.069599, 1, 1, 1, 1, 1,
-0.8999902, -0.2025762, -1.433551, 1, 1, 1, 1, 1,
-0.8930867, 0.1964461, -2.908227, 1, 1, 1, 1, 1,
-0.8929363, 1.493739, -0.928086, 1, 1, 1, 1, 1,
-0.8850906, -0.2484765, -1.743018, 1, 1, 1, 1, 1,
-0.8765655, -0.4062554, -1.301659, 1, 1, 1, 1, 1,
-0.8755673, -0.2324561, -2.628354, 1, 1, 1, 1, 1,
-0.8747908, 0.2515267, -1.483519, 1, 1, 1, 1, 1,
-0.8746043, 1.108205, -0.00568802, 1, 1, 1, 1, 1,
-0.8656754, 0.1845502, -1.952146, 1, 1, 1, 1, 1,
-0.8640909, -1.432077, -0.1573886, 1, 1, 1, 1, 1,
-0.8609084, 1.787908, 1.261608, 0, 0, 1, 1, 1,
-0.8568674, -0.4885224, -1.404065, 1, 0, 0, 1, 1,
-0.8561996, -0.6499274, -2.683939, 1, 0, 0, 1, 1,
-0.8559343, -0.05038626, 0.2750249, 1, 0, 0, 1, 1,
-0.8551796, 0.07030307, 0.96064, 1, 0, 0, 1, 1,
-0.853083, 1.313511, -1.343317, 1, 0, 0, 1, 1,
-0.850733, 0.4921345, -1.418713, 0, 0, 0, 1, 1,
-0.8472807, -0.6510981, -1.49276, 0, 0, 0, 1, 1,
-0.8433108, -0.416111, -0.5462114, 0, 0, 0, 1, 1,
-0.8409029, 1.294429, 1.050338, 0, 0, 0, 1, 1,
-0.8373306, 0.593525, -0.3034184, 0, 0, 0, 1, 1,
-0.8319826, -0.9949234, -0.6227845, 0, 0, 0, 1, 1,
-0.8314564, 0.1382354, -0.5968016, 0, 0, 0, 1, 1,
-0.8287067, -0.1052941, -0.8591738, 1, 1, 1, 1, 1,
-0.8196655, 0.2229881, -0.3376144, 1, 1, 1, 1, 1,
-0.8185927, -2.680023, -3.030871, 1, 1, 1, 1, 1,
-0.8176809, 0.9900951, 0.3803076, 1, 1, 1, 1, 1,
-0.8173789, -1.596508, -2.714156, 1, 1, 1, 1, 1,
-0.8161831, 0.9663677, 0.5807356, 1, 1, 1, 1, 1,
-0.8155776, -0.5487057, -1.644085, 1, 1, 1, 1, 1,
-0.8116609, -0.5350622, -1.428016, 1, 1, 1, 1, 1,
-0.8074939, 0.4906771, -1.315758, 1, 1, 1, 1, 1,
-0.8049368, 0.352688, -1.206009, 1, 1, 1, 1, 1,
-0.8037534, 1.025736, -2.170208, 1, 1, 1, 1, 1,
-0.8012058, 2.075994, -1.386211, 1, 1, 1, 1, 1,
-0.800468, -0.5532233, -2.42091, 1, 1, 1, 1, 1,
-0.7951707, -2.086749, -1.313518, 1, 1, 1, 1, 1,
-0.7831017, -1.260925, -1.979717, 1, 1, 1, 1, 1,
-0.7826319, -0.6895574, -1.49978, 0, 0, 1, 1, 1,
-0.7813647, 0.2055403, 0.01950425, 1, 0, 0, 1, 1,
-0.7792645, 1.029588, -1.516858, 1, 0, 0, 1, 1,
-0.7774966, 0.02108042, -0.7451745, 1, 0, 0, 1, 1,
-0.7769985, -0.1340735, -1.967027, 1, 0, 0, 1, 1,
-0.7754385, 1.154161, 2.108631, 1, 0, 0, 1, 1,
-0.7749083, 1.179802, -3.571961, 0, 0, 0, 1, 1,
-0.7728418, 0.9844739, 0.04521069, 0, 0, 0, 1, 1,
-0.768145, 0.507754, -0.350957, 0, 0, 0, 1, 1,
-0.7621022, 2.479453, 0.9019125, 0, 0, 0, 1, 1,
-0.7597046, -0.002468827, -3.451805, 0, 0, 0, 1, 1,
-0.7586322, 0.9992302, -0.8848466, 0, 0, 0, 1, 1,
-0.7561216, -0.5427767, -0.9257463, 0, 0, 0, 1, 1,
-0.7546954, 1.099617, -1.321644, 1, 1, 1, 1, 1,
-0.7522571, -2.026321, -2.110052, 1, 1, 1, 1, 1,
-0.7499044, 0.6501679, -0.5833103, 1, 1, 1, 1, 1,
-0.7463709, 2.174896, 0.6919858, 1, 1, 1, 1, 1,
-0.7461754, 0.1414145, -0.1869208, 1, 1, 1, 1, 1,
-0.7457147, -0.5892401, -2.821276, 1, 1, 1, 1, 1,
-0.7415926, -0.07145488, -2.634495, 1, 1, 1, 1, 1,
-0.7396914, 0.3582243, -1.601985, 1, 1, 1, 1, 1,
-0.7394137, -0.4797225, -3.794495, 1, 1, 1, 1, 1,
-0.7375895, 0.9547539, -0.4549709, 1, 1, 1, 1, 1,
-0.7374641, 1.68525, -0.6299489, 1, 1, 1, 1, 1,
-0.7367383, 0.3912886, -2.399773, 1, 1, 1, 1, 1,
-0.7348708, 0.4786343, -2.893889, 1, 1, 1, 1, 1,
-0.7265643, 0.3573351, -0.6578505, 1, 1, 1, 1, 1,
-0.7244062, -0.01672477, -2.237722, 1, 1, 1, 1, 1,
-0.723064, 0.03784665, 0.02169652, 0, 0, 1, 1, 1,
-0.7229993, 0.1214995, 0.03203518, 1, 0, 0, 1, 1,
-0.7227154, -0.3506116, -2.709982, 1, 0, 0, 1, 1,
-0.7120861, -0.6700361, -1.810551, 1, 0, 0, 1, 1,
-0.7090827, 1.521614, -0.211635, 1, 0, 0, 1, 1,
-0.702457, 2.336753, 0.2869298, 1, 0, 0, 1, 1,
-0.7012376, 0.6947057, -0.01518953, 0, 0, 0, 1, 1,
-0.6956854, 1.245534, -1.358046, 0, 0, 0, 1, 1,
-0.6915936, -0.4391476, -2.028911, 0, 0, 0, 1, 1,
-0.6891056, -0.1085256, -1.346374, 0, 0, 0, 1, 1,
-0.6836967, 0.7025076, 0.2401481, 0, 0, 0, 1, 1,
-0.6817408, 0.5433683, -0.8439089, 0, 0, 0, 1, 1,
-0.6796483, 0.9020351, -1.525553, 0, 0, 0, 1, 1,
-0.6744918, 0.1009061, -1.472312, 1, 1, 1, 1, 1,
-0.673324, -0.1487843, 0.09935649, 1, 1, 1, 1, 1,
-0.6712722, -1.592244, -2.488886, 1, 1, 1, 1, 1,
-0.6710926, -1.96782, -1.636325, 1, 1, 1, 1, 1,
-0.6674895, -0.8746046, -3.65158, 1, 1, 1, 1, 1,
-0.6668163, 0.2044901, -2.547117, 1, 1, 1, 1, 1,
-0.6636479, 0.9460827, -1.598126, 1, 1, 1, 1, 1,
-0.6633547, 0.8001019, -0.2118271, 1, 1, 1, 1, 1,
-0.6597078, 0.0842763, -2.069342, 1, 1, 1, 1, 1,
-0.659127, 1.39375, -0.1074445, 1, 1, 1, 1, 1,
-0.6584057, -0.07425292, -1.005339, 1, 1, 1, 1, 1,
-0.6539889, -0.4958724, -1.043499, 1, 1, 1, 1, 1,
-0.6529848, -1.034948, 0.3481728, 1, 1, 1, 1, 1,
-0.6462111, -1.092316, -3.569811, 1, 1, 1, 1, 1,
-0.6447651, -0.4191422, -0.6027252, 1, 1, 1, 1, 1,
-0.6435561, -0.01595764, -2.425603, 0, 0, 1, 1, 1,
-0.6349381, 1.440198, 0.2497651, 1, 0, 0, 1, 1,
-0.6286194, -3.169516, -4.585288, 1, 0, 0, 1, 1,
-0.6275002, -0.4799372, -4.2589, 1, 0, 0, 1, 1,
-0.6259444, 0.1927611, -2.363318, 1, 0, 0, 1, 1,
-0.6249917, -1.536168, -1.71132, 1, 0, 0, 1, 1,
-0.6217051, -0.8804858, -1.758881, 0, 0, 0, 1, 1,
-0.621272, -1.091446, -1.982728, 0, 0, 0, 1, 1,
-0.6201659, 1.681138, -0.490244, 0, 0, 0, 1, 1,
-0.6140813, 0.3926173, -1.286311, 0, 0, 0, 1, 1,
-0.6131409, -0.8251424, -3.342914, 0, 0, 0, 1, 1,
-0.6074186, -1.082143, -2.23282, 0, 0, 0, 1, 1,
-0.6071314, 0.1532116, -0.4982907, 0, 0, 0, 1, 1,
-0.599633, -0.0215955, -0.6536089, 1, 1, 1, 1, 1,
-0.598035, -0.03092086, -0.3458365, 1, 1, 1, 1, 1,
-0.5973489, -1.66011, -3.019806, 1, 1, 1, 1, 1,
-0.5915662, -0.1676703, -3.522014, 1, 1, 1, 1, 1,
-0.5907131, 1.293662, 2.697191, 1, 1, 1, 1, 1,
-0.5895272, 1.091718, 0.6626456, 1, 1, 1, 1, 1,
-0.5809748, -0.9319778, -1.78294, 1, 1, 1, 1, 1,
-0.5806005, 0.4277664, -1.515613, 1, 1, 1, 1, 1,
-0.5794482, -1.464555, -3.79653, 1, 1, 1, 1, 1,
-0.5791708, 1.369028, -1.356297, 1, 1, 1, 1, 1,
-0.5765887, -1.467911, -0.8174778, 1, 1, 1, 1, 1,
-0.5717812, 1.101212, -0.4231777, 1, 1, 1, 1, 1,
-0.570734, 0.2138087, -0.7671869, 1, 1, 1, 1, 1,
-0.5647879, -0.5623147, -0.7471125, 1, 1, 1, 1, 1,
-0.5630991, 0.5112264, -1.223399, 1, 1, 1, 1, 1,
-0.5612836, -1.776229, -1.749842, 0, 0, 1, 1, 1,
-0.5553356, -0.5458028, -3.889493, 1, 0, 0, 1, 1,
-0.551282, 2.695849, 0.6082015, 1, 0, 0, 1, 1,
-0.5501609, -2.808234, -2.008349, 1, 0, 0, 1, 1,
-0.5476767, 1.125379, -1.879609, 1, 0, 0, 1, 1,
-0.547559, 0.500054, -0.7929782, 1, 0, 0, 1, 1,
-0.5471937, 1.12347, -0.191257, 0, 0, 0, 1, 1,
-0.5420577, -1.07761, -3.168264, 0, 0, 0, 1, 1,
-0.5385008, -0.427868, -1.470133, 0, 0, 0, 1, 1,
-0.5365598, 0.1797923, 0.3750521, 0, 0, 0, 1, 1,
-0.5351834, 1.180567, -1.276906, 0, 0, 0, 1, 1,
-0.5348749, 0.7013468, 0.005389261, 0, 0, 0, 1, 1,
-0.530266, -1.182699, -4.083089, 0, 0, 0, 1, 1,
-0.5299476, -0.2514857, -1.367076, 1, 1, 1, 1, 1,
-0.5281748, 0.2430216, -2.46901, 1, 1, 1, 1, 1,
-0.5271618, -1.204473, -3.280721, 1, 1, 1, 1, 1,
-0.5256175, -0.07491191, -0.3752488, 1, 1, 1, 1, 1,
-0.5242503, 1.619666, 0.4195921, 1, 1, 1, 1, 1,
-0.5206605, -2.172728, -2.042778, 1, 1, 1, 1, 1,
-0.5204845, -1.015424, -4.384368, 1, 1, 1, 1, 1,
-0.5177826, 0.7022851, -0.3057307, 1, 1, 1, 1, 1,
-0.5146115, 0.03200647, -2.077924, 1, 1, 1, 1, 1,
-0.5142915, 3.955676, 0.7078582, 1, 1, 1, 1, 1,
-0.5130316, -1.293482, -2.776322, 1, 1, 1, 1, 1,
-0.5126375, -0.9867399, -2.946189, 1, 1, 1, 1, 1,
-0.5069078, -0.7648091, -1.906621, 1, 1, 1, 1, 1,
-0.5034119, -1.215778, -1.848703, 1, 1, 1, 1, 1,
-0.4960505, -0.3499061, -1.93716, 1, 1, 1, 1, 1,
-0.4873438, -0.7534597, -2.898657, 0, 0, 1, 1, 1,
-0.486382, 0.2961222, -0.6061665, 1, 0, 0, 1, 1,
-0.4861057, 0.8334714, -1.191828, 1, 0, 0, 1, 1,
-0.4843008, 0.1511196, -1.311302, 1, 0, 0, 1, 1,
-0.4786843, -0.2780203, -2.071457, 1, 0, 0, 1, 1,
-0.4745809, 0.3547577, -0.7433034, 1, 0, 0, 1, 1,
-0.4701566, 0.6166037, 0.1865349, 0, 0, 0, 1, 1,
-0.4685672, -1.444322, -3.60502, 0, 0, 0, 1, 1,
-0.4684283, 1.534273, 0.4550413, 0, 0, 0, 1, 1,
-0.464586, -1.546006, -1.251287, 0, 0, 0, 1, 1,
-0.4623305, -1.238436, -3.1254, 0, 0, 0, 1, 1,
-0.4615617, -0.7514715, -2.360739, 0, 0, 0, 1, 1,
-0.4530838, 0.04380665, -0.2049358, 0, 0, 0, 1, 1,
-0.4525839, 0.008395338, -2.889359, 1, 1, 1, 1, 1,
-0.4517847, 1.077987, 0.1178016, 1, 1, 1, 1, 1,
-0.4516776, -0.787621, -3.40497, 1, 1, 1, 1, 1,
-0.4503823, -0.4673131, -2.654676, 1, 1, 1, 1, 1,
-0.4437698, 1.17348, -0.2551108, 1, 1, 1, 1, 1,
-0.4431369, 0.4284466, 0.2381072, 1, 1, 1, 1, 1,
-0.4415681, -0.1794032, -0.1218432, 1, 1, 1, 1, 1,
-0.4405635, -0.7928085, -3.097916, 1, 1, 1, 1, 1,
-0.4395766, 0.5820932, -0.1418159, 1, 1, 1, 1, 1,
-0.4360962, -0.2426161, -2.303669, 1, 1, 1, 1, 1,
-0.4340172, -0.1280852, -1.585513, 1, 1, 1, 1, 1,
-0.4303656, -1.578618, -1.215696, 1, 1, 1, 1, 1,
-0.4302503, -3.16565, -3.220495, 1, 1, 1, 1, 1,
-0.4292583, 0.05674772, 0.1743295, 1, 1, 1, 1, 1,
-0.4250746, 0.1664842, -0.008695782, 1, 1, 1, 1, 1,
-0.4237581, -1.316799, -2.19152, 0, 0, 1, 1, 1,
-0.4215559, -0.1851584, -1.672078, 1, 0, 0, 1, 1,
-0.418294, 0.2611353, 0.5564984, 1, 0, 0, 1, 1,
-0.4148938, -1.793482, -2.529923, 1, 0, 0, 1, 1,
-0.4134477, 1.7671, -0.1282437, 1, 0, 0, 1, 1,
-0.4124425, -0.593362, -2.695943, 1, 0, 0, 1, 1,
-0.4109754, -0.5982383, -1.15357, 0, 0, 0, 1, 1,
-0.406682, -0.2042701, -2.540462, 0, 0, 0, 1, 1,
-0.4059224, 0.7126368, -0.447401, 0, 0, 0, 1, 1,
-0.4022545, 0.82675, 0.9066765, 0, 0, 0, 1, 1,
-0.4011474, 1.417895, -0.8781863, 0, 0, 0, 1, 1,
-0.3980353, -0.6163458, -1.074529, 0, 0, 0, 1, 1,
-0.3969668, -1.494328, -4.880705, 0, 0, 0, 1, 1,
-0.3965069, 0.469392, -1.612922, 1, 1, 1, 1, 1,
-0.3945116, 0.2886804, -2.648852, 1, 1, 1, 1, 1,
-0.3939953, -0.221743, -0.4530857, 1, 1, 1, 1, 1,
-0.3904605, 1.299468, 0.3068419, 1, 1, 1, 1, 1,
-0.388557, 0.5039731, -1.889786, 1, 1, 1, 1, 1,
-0.3817807, 2.508011, -0.6367776, 1, 1, 1, 1, 1,
-0.3786119, -0.1272567, -1.168285, 1, 1, 1, 1, 1,
-0.371124, 0.4041212, 0.2912688, 1, 1, 1, 1, 1,
-0.363252, -0.8686826, -2.666924, 1, 1, 1, 1, 1,
-0.3620273, 0.4443879, -1.514255, 1, 1, 1, 1, 1,
-0.3542117, -0.2492693, -1.91031, 1, 1, 1, 1, 1,
-0.352592, 0.5902358, -0.7668555, 1, 1, 1, 1, 1,
-0.3519406, -0.2151331, -0.7203438, 1, 1, 1, 1, 1,
-0.3451174, -0.9310778, -2.900135, 1, 1, 1, 1, 1,
-0.3432312, -0.1988346, -2.492293, 1, 1, 1, 1, 1,
-0.340111, 2.021041, -0.00146548, 0, 0, 1, 1, 1,
-0.3383561, -1.542574, -3.08305, 1, 0, 0, 1, 1,
-0.3350239, 0.7811618, 1.039252, 1, 0, 0, 1, 1,
-0.3285068, -2.692014, -2.235273, 1, 0, 0, 1, 1,
-0.3282132, -1.358927, -3.0051, 1, 0, 0, 1, 1,
-0.3244963, 0.8610059, -1.278045, 1, 0, 0, 1, 1,
-0.3198679, 0.9356937, 0.1266259, 0, 0, 0, 1, 1,
-0.3151469, 0.7359093, -0.5226394, 0, 0, 0, 1, 1,
-0.310777, 0.290508, 0.1909109, 0, 0, 0, 1, 1,
-0.3099006, -1.038561, -3.6376, 0, 0, 0, 1, 1,
-0.3038828, -0.12995, -0.168965, 0, 0, 0, 1, 1,
-0.2993973, 0.270585, -0.5642117, 0, 0, 0, 1, 1,
-0.2993838, -0.2234498, -2.712414, 0, 0, 0, 1, 1,
-0.2921524, 1.135732, 0.5775132, 1, 1, 1, 1, 1,
-0.2915254, -0.1155142, -0.5828439, 1, 1, 1, 1, 1,
-0.2912467, -0.1461481, -0.6545666, 1, 1, 1, 1, 1,
-0.2900673, 1.027659, 0.3885429, 1, 1, 1, 1, 1,
-0.2895974, 0.6077472, -1.892322, 1, 1, 1, 1, 1,
-0.2880996, -0.3148913, -1.763342, 1, 1, 1, 1, 1,
-0.2873514, -0.1105743, -1.071262, 1, 1, 1, 1, 1,
-0.2866414, -0.3542786, -3.987447, 1, 1, 1, 1, 1,
-0.28507, 0.8620642, -0.856663, 1, 1, 1, 1, 1,
-0.2836353, -0.5031324, -2.756103, 1, 1, 1, 1, 1,
-0.2813263, -0.3103305, -1.25551, 1, 1, 1, 1, 1,
-0.2734661, 0.1565337, 0.7225486, 1, 1, 1, 1, 1,
-0.2719039, 1.230681, 1.572556, 1, 1, 1, 1, 1,
-0.2677487, 1.25491, -0.7782252, 1, 1, 1, 1, 1,
-0.2677234, -0.8678972, -2.115698, 1, 1, 1, 1, 1,
-0.2632414, 1.680043, -0.1944079, 0, 0, 1, 1, 1,
-0.2628428, 0.9456988, 0.884914, 1, 0, 0, 1, 1,
-0.2586688, -0.7779365, -1.082187, 1, 0, 0, 1, 1,
-0.2542615, 0.1236427, -1.235514, 1, 0, 0, 1, 1,
-0.2498671, 0.9183014, 0.8883504, 1, 0, 0, 1, 1,
-0.249433, -1.868655, -1.055275, 1, 0, 0, 1, 1,
-0.2483087, -0.7598133, -4.234756, 0, 0, 0, 1, 1,
-0.2480987, 0.9720421, 0.1182237, 0, 0, 0, 1, 1,
-0.242363, -0.4017566, -0.819963, 0, 0, 0, 1, 1,
-0.241841, -1.230034, -3.597906, 0, 0, 0, 1, 1,
-0.2416659, 0.7223981, 0.04530616, 0, 0, 0, 1, 1,
-0.2377132, 0.1734447, 0.2008394, 0, 0, 0, 1, 1,
-0.2353233, -0.4640806, -1.616052, 0, 0, 0, 1, 1,
-0.2315906, -0.5596923, -2.60216, 1, 1, 1, 1, 1,
-0.2282246, -0.4941593, -3.305669, 1, 1, 1, 1, 1,
-0.2278691, 2.004904, -0.4348764, 1, 1, 1, 1, 1,
-0.2268966, 0.2089244, -2.177209, 1, 1, 1, 1, 1,
-0.226633, -0.400409, -3.002264, 1, 1, 1, 1, 1,
-0.2253735, 0.7513933, 0.5509715, 1, 1, 1, 1, 1,
-0.2222984, -0.7086208, -2.042546, 1, 1, 1, 1, 1,
-0.2167737, -0.3250588, -2.051692, 1, 1, 1, 1, 1,
-0.2161469, 2.296812, -0.3453911, 1, 1, 1, 1, 1,
-0.2161462, 0.184289, -1.292539, 1, 1, 1, 1, 1,
-0.2110154, -1.449641, -5.38541, 1, 1, 1, 1, 1,
-0.2080495, -0.6427487, -3.704935, 1, 1, 1, 1, 1,
-0.2055523, 0.3900104, 0.3810633, 1, 1, 1, 1, 1,
-0.2053646, 0.365332, -1.22247, 1, 1, 1, 1, 1,
-0.2046218, 1.608978, -0.2677351, 1, 1, 1, 1, 1,
-0.2034068, 1.009701, 0.1349417, 0, 0, 1, 1, 1,
-0.2027255, 0.982779, -1.071428, 1, 0, 0, 1, 1,
-0.1922288, 0.6591647, 1.343218, 1, 0, 0, 1, 1,
-0.1889782, 0.4694007, -0.8424454, 1, 0, 0, 1, 1,
-0.1877966, -0.9040991, -4.810872, 1, 0, 0, 1, 1,
-0.1865356, 0.8838051, -2.322028, 1, 0, 0, 1, 1,
-0.1863395, -0.5188658, -2.13572, 0, 0, 0, 1, 1,
-0.1845492, 1.190751, 0.05143254, 0, 0, 0, 1, 1,
-0.1835808, 0.3980162, 0.266073, 0, 0, 0, 1, 1,
-0.1832091, -0.6995583, -2.537779, 0, 0, 0, 1, 1,
-0.1825622, 0.4652883, 2.235495, 0, 0, 0, 1, 1,
-0.1766392, 1.428045, 0.6072719, 0, 0, 0, 1, 1,
-0.1766051, -0.6477971, -2.41175, 0, 0, 0, 1, 1,
-0.1743614, -0.05194883, -0.3036744, 1, 1, 1, 1, 1,
-0.1741551, -0.7337426, -3.423806, 1, 1, 1, 1, 1,
-0.1688297, 0.4022304, -0.5360838, 1, 1, 1, 1, 1,
-0.1654355, -0.956392, -3.427494, 1, 1, 1, 1, 1,
-0.1605173, -1.345056, -2.860885, 1, 1, 1, 1, 1,
-0.1585469, 0.1529426, 0.7279261, 1, 1, 1, 1, 1,
-0.1563339, 0.6598673, -1.609791, 1, 1, 1, 1, 1,
-0.1556105, -0.8922968, -1.976437, 1, 1, 1, 1, 1,
-0.1551712, 0.957462, 1.090179, 1, 1, 1, 1, 1,
-0.1535215, -0.04642063, -2.435846, 1, 1, 1, 1, 1,
-0.1507197, 1.7633, -0.9457265, 1, 1, 1, 1, 1,
-0.149631, 0.3527372, -0.2543995, 1, 1, 1, 1, 1,
-0.1493834, -0.2384377, -2.697953, 1, 1, 1, 1, 1,
-0.139645, -0.9584506, -3.250393, 1, 1, 1, 1, 1,
-0.1369813, 2.405274, -0.6608332, 1, 1, 1, 1, 1,
-0.1363241, 0.4289559, -2.542342, 0, 0, 1, 1, 1,
-0.1358738, -0.482655, -1.585377, 1, 0, 0, 1, 1,
-0.1331244, -0.02448114, -1.879168, 1, 0, 0, 1, 1,
-0.1328106, -0.6394646, -1.345937, 1, 0, 0, 1, 1,
-0.1260956, -0.3132383, -2.744313, 1, 0, 0, 1, 1,
-0.1248797, 0.9192705, 0.411012, 1, 0, 0, 1, 1,
-0.1246464, 0.03405891, -1.849181, 0, 0, 0, 1, 1,
-0.123736, -1.858885, -3.611697, 0, 0, 0, 1, 1,
-0.1191197, 2.066958, 1.299232, 0, 0, 0, 1, 1,
-0.1145157, -0.7302369, -3.608799, 0, 0, 0, 1, 1,
-0.1034255, -0.6225375, -4.506617, 0, 0, 0, 1, 1,
-0.1000595, -0.7313238, -1.770369, 0, 0, 0, 1, 1,
-0.09986103, 0.5061026, 1.022951, 0, 0, 0, 1, 1,
-0.09132524, 1.444886, -0.5767776, 1, 1, 1, 1, 1,
-0.09102707, 2.561419, 1.736666, 1, 1, 1, 1, 1,
-0.08894457, 0.7938831, -1.480562, 1, 1, 1, 1, 1,
-0.08401541, -0.006241582, -0.7958396, 1, 1, 1, 1, 1,
-0.08264653, -0.5342571, -2.835028, 1, 1, 1, 1, 1,
-0.08079451, 0.02580269, -2.667574, 1, 1, 1, 1, 1,
-0.08025207, -1.184763, -2.01072, 1, 1, 1, 1, 1,
-0.07881733, -0.4065534, -3.795525, 1, 1, 1, 1, 1,
-0.07687272, -0.869697, -2.982623, 1, 1, 1, 1, 1,
-0.07600175, -0.3133355, -2.860094, 1, 1, 1, 1, 1,
-0.06823428, -1.041282, -2.707268, 1, 1, 1, 1, 1,
-0.06683475, -1.054433, -2.395298, 1, 1, 1, 1, 1,
-0.06494796, -1.37468, -3.084619, 1, 1, 1, 1, 1,
-0.06040588, -0.3543531, -2.978829, 1, 1, 1, 1, 1,
-0.06009877, -1.554161, -4.260795, 1, 1, 1, 1, 1,
-0.05748036, -0.8575463, -2.280893, 0, 0, 1, 1, 1,
-0.05725165, -0.0971133, -1.875634, 1, 0, 0, 1, 1,
-0.05627368, 0.003552069, -0.2989893, 1, 0, 0, 1, 1,
-0.05268435, 0.05141756, -1.542019, 1, 0, 0, 1, 1,
-0.0510336, -0.3029124, -2.160559, 1, 0, 0, 1, 1,
-0.04960193, -0.05685003, -1.923839, 1, 0, 0, 1, 1,
-0.048696, 0.9843568, -0.2573394, 0, 0, 0, 1, 1,
-0.04765589, -0.83999, -3.267559, 0, 0, 0, 1, 1,
-0.04758833, -0.8370351, -3.220982, 0, 0, 0, 1, 1,
-0.03639727, 0.326735, 0.6359897, 0, 0, 0, 1, 1,
-0.03578862, -1.288013, -3.404114, 0, 0, 0, 1, 1,
-0.03405045, 0.9216232, 1.389727, 0, 0, 0, 1, 1,
-0.03371652, -0.8487372, -3.612615, 0, 0, 0, 1, 1,
-0.03188851, 0.6362624, 0.3481262, 1, 1, 1, 1, 1,
-0.03007189, 0.0929679, -0.7244523, 1, 1, 1, 1, 1,
-0.02723042, 0.006659874, -0.8433679, 1, 1, 1, 1, 1,
-0.02458818, -0.7509839, -4.464362, 1, 1, 1, 1, 1,
-0.02434854, 0.02533629, 0.4117102, 1, 1, 1, 1, 1,
-0.02278368, 1.431524, 0.7154605, 1, 1, 1, 1, 1,
-0.01825093, -0.3965746, -3.155163, 1, 1, 1, 1, 1,
-0.01479744, -0.08090317, -3.907275, 1, 1, 1, 1, 1,
-0.009058792, 0.03090563, -0.6232663, 1, 1, 1, 1, 1,
-0.008608494, 1.127562, 1.022924, 1, 1, 1, 1, 1,
-0.007349567, 1.556553, 0.4246662, 1, 1, 1, 1, 1,
-0.005807039, -0.2212867, -5.453136, 1, 1, 1, 1, 1,
-0.004537805, -1.232622, -2.079168, 1, 1, 1, 1, 1,
-0.00286847, 1.265576, 1.077134, 1, 1, 1, 1, 1,
-0.001653909, 1.23377, 0.9224735, 1, 1, 1, 1, 1,
0.0002165151, 1.223467, 0.9541104, 0, 0, 1, 1, 1,
0.0008737036, 0.1117763, -1.635075, 1, 0, 0, 1, 1,
0.002698188, 0.9782526, 0.7843503, 1, 0, 0, 1, 1,
0.006163666, 0.3105334, -0.3991165, 1, 0, 0, 1, 1,
0.006351538, -0.6389428, 3.324107, 1, 0, 0, 1, 1,
0.006492673, 0.2530368, 0.3863828, 1, 0, 0, 1, 1,
0.007830624, 0.6959687, -1.575801, 0, 0, 0, 1, 1,
0.01180468, 1.025418, -0.5468879, 0, 0, 0, 1, 1,
0.01270943, -1.045076, 2.961876, 0, 0, 0, 1, 1,
0.01773237, 2.348697, 0.2988156, 0, 0, 0, 1, 1,
0.02256705, -0.4963676, 3.557142, 0, 0, 0, 1, 1,
0.02945573, -0.9623991, 2.21626, 0, 0, 0, 1, 1,
0.02968426, -0.7754734, 4.543008, 0, 0, 0, 1, 1,
0.03031338, 0.5441742, 0.2688391, 1, 1, 1, 1, 1,
0.03133407, 0.81406, -0.3830011, 1, 1, 1, 1, 1,
0.03203367, -0.8952027, 4.200172, 1, 1, 1, 1, 1,
0.03934763, -0.1341881, 2.564107, 1, 1, 1, 1, 1,
0.04015119, -2.107856, 1.919214, 1, 1, 1, 1, 1,
0.05226868, 1.084783, -1.004584, 1, 1, 1, 1, 1,
0.05362012, 1.001097, -0.3750969, 1, 1, 1, 1, 1,
0.05587528, -1.430191, 3.669713, 1, 1, 1, 1, 1,
0.05701027, -0.04829844, 0.991366, 1, 1, 1, 1, 1,
0.05727221, 0.4385099, 0.6141251, 1, 1, 1, 1, 1,
0.0596006, -0.1219285, 3.539476, 1, 1, 1, 1, 1,
0.06202507, -1.266011, 2.286837, 1, 1, 1, 1, 1,
0.07052889, 0.7370341, 0.3444081, 1, 1, 1, 1, 1,
0.07398748, 0.00568884, 1.05869, 1, 1, 1, 1, 1,
0.07461405, -1.100191, 0.01276743, 1, 1, 1, 1, 1,
0.07486244, 0.9936593, 0.2505383, 0, 0, 1, 1, 1,
0.07644083, 1.012891, -0.4720246, 1, 0, 0, 1, 1,
0.07824588, 0.4664851, -0.7243834, 1, 0, 0, 1, 1,
0.07853769, -1.22251, 3.789726, 1, 0, 0, 1, 1,
0.07880279, 0.3185711, -0.9799551, 1, 0, 0, 1, 1,
0.08100899, 0.2243315, 0.9372502, 1, 0, 0, 1, 1,
0.08270577, -0.3011808, 4.004482, 0, 0, 0, 1, 1,
0.08387986, -0.06037633, 1.550318, 0, 0, 0, 1, 1,
0.08567162, -1.791476, 2.120875, 0, 0, 0, 1, 1,
0.09191301, 0.1270006, 1.600191, 0, 0, 0, 1, 1,
0.09896299, -0.1052739, 3.503156, 0, 0, 0, 1, 1,
0.09958202, -1.207162, 2.994051, 0, 0, 0, 1, 1,
0.1022201, 0.6772671, 0.7446389, 0, 0, 0, 1, 1,
0.1023322, -0.8621811, 2.638023, 1, 1, 1, 1, 1,
0.1027594, 0.1478093, 1.069402, 1, 1, 1, 1, 1,
0.1044019, 0.5460857, -1.556094, 1, 1, 1, 1, 1,
0.1069152, -1.595496, 2.721698, 1, 1, 1, 1, 1,
0.1129468, -1.443026, 2.126545, 1, 1, 1, 1, 1,
0.1133193, -0.7502347, 0.9917709, 1, 1, 1, 1, 1,
0.1190516, -1.48087, 3.194024, 1, 1, 1, 1, 1,
0.1252081, -0.9225959, 4.883608, 1, 1, 1, 1, 1,
0.1259639, 0.45796, 0.9341889, 1, 1, 1, 1, 1,
0.1267306, 0.1427582, 1.887738, 1, 1, 1, 1, 1,
0.1286844, -0.8666599, 2.191877, 1, 1, 1, 1, 1,
0.1320162, -1.264747, 1.838244, 1, 1, 1, 1, 1,
0.1322937, 0.6511547, -0.7627726, 1, 1, 1, 1, 1,
0.1441643, 1.195053, 0.7949853, 1, 1, 1, 1, 1,
0.1444313, 2.002156, 0.6410487, 1, 1, 1, 1, 1,
0.1498655, -0.1536577, 1.830156, 0, 0, 1, 1, 1,
0.1519923, -0.3217531, 1.7568, 1, 0, 0, 1, 1,
0.1527575, -0.1758748, 0.8975161, 1, 0, 0, 1, 1,
0.1530315, -1.600671, 3.230515, 1, 0, 0, 1, 1,
0.1544669, -0.4661708, 2.548366, 1, 0, 0, 1, 1,
0.1566688, -0.3083816, 2.73613, 1, 0, 0, 1, 1,
0.1634246, -1.601585, 2.908219, 0, 0, 0, 1, 1,
0.1676382, -0.3742692, 3.143002, 0, 0, 0, 1, 1,
0.1691402, -0.5101167, 4.273554, 0, 0, 0, 1, 1,
0.1724647, 0.7846554, -0.253875, 0, 0, 0, 1, 1,
0.1728618, -0.9355431, 2.613711, 0, 0, 0, 1, 1,
0.1741011, -1.284553, 3.041245, 0, 0, 0, 1, 1,
0.174359, -0.2124794, 1.475697, 0, 0, 0, 1, 1,
0.1779945, -0.1585338, 1.079398, 1, 1, 1, 1, 1,
0.1798808, -1.474811, 3.414445, 1, 1, 1, 1, 1,
0.1864382, -0.7906983, 4.157204, 1, 1, 1, 1, 1,
0.1873969, 0.119816, -0.4875855, 1, 1, 1, 1, 1,
0.1901351, 0.8910015, 0.6301717, 1, 1, 1, 1, 1,
0.1917066, 0.4036579, 1.206627, 1, 1, 1, 1, 1,
0.1967718, 1.05442, 0.002876983, 1, 1, 1, 1, 1,
0.1982528, 0.2549163, -0.2179751, 1, 1, 1, 1, 1,
0.1982704, 0.9403526, -0.3944409, 1, 1, 1, 1, 1,
0.2083463, 1.239211, 2.314239, 1, 1, 1, 1, 1,
0.210143, 0.7744204, -0.07810885, 1, 1, 1, 1, 1,
0.2162673, -0.0177156, -0.1325944, 1, 1, 1, 1, 1,
0.2172963, 0.5606266, -0.06663618, 1, 1, 1, 1, 1,
0.226602, 0.6899155, 0.3637865, 1, 1, 1, 1, 1,
0.23007, 1.42994, -1.367777, 1, 1, 1, 1, 1,
0.2303439, -0.04360043, 2.465483, 0, 0, 1, 1, 1,
0.2317508, 1.337759, 1.426573, 1, 0, 0, 1, 1,
0.2337134, -0.3042454, 3.072737, 1, 0, 0, 1, 1,
0.2376897, -0.1557105, 2.41697, 1, 0, 0, 1, 1,
0.2418375, -1.997075, 2.597589, 1, 0, 0, 1, 1,
0.2440428, 0.3200315, 1.340996, 1, 0, 0, 1, 1,
0.2451186, 0.6966067, 1.157101, 0, 0, 0, 1, 1,
0.246947, -0.7355271, 3.656216, 0, 0, 0, 1, 1,
0.2477058, -0.744862, 2.49292, 0, 0, 0, 1, 1,
0.2479684, 0.09594058, -0.07802987, 0, 0, 0, 1, 1,
0.2504803, 0.5108635, -1.431833, 0, 0, 0, 1, 1,
0.2515692, 0.7662924, 0.2468647, 0, 0, 0, 1, 1,
0.2536339, 1.975003, 0.7993372, 0, 0, 0, 1, 1,
0.2551002, 0.07807299, 2.732903, 1, 1, 1, 1, 1,
0.2562836, -0.1367057, 1.276869, 1, 1, 1, 1, 1,
0.2578041, 0.5486562, 1.079049, 1, 1, 1, 1, 1,
0.2596721, 0.7207921, -0.5940425, 1, 1, 1, 1, 1,
0.2643874, -1.667176, 3.375148, 1, 1, 1, 1, 1,
0.2649, 0.2593638, 1.025701, 1, 1, 1, 1, 1,
0.2721957, 0.7571232, 0.3423292, 1, 1, 1, 1, 1,
0.2745007, 0.2035347, 2.899365, 1, 1, 1, 1, 1,
0.2764104, 0.8602027, 1.358142, 1, 1, 1, 1, 1,
0.2805848, 0.7878897, 1.096886, 1, 1, 1, 1, 1,
0.293649, 0.5402262, 0.681372, 1, 1, 1, 1, 1,
0.2944455, -1.403991, 3.047035, 1, 1, 1, 1, 1,
0.2983396, -1.62522, 1.935163, 1, 1, 1, 1, 1,
0.2995693, 0.5662042, 1.30655, 1, 1, 1, 1, 1,
0.303933, -0.2708579, 2.577442, 1, 1, 1, 1, 1,
0.3144281, -0.6142511, 3.145571, 0, 0, 1, 1, 1,
0.3147803, -0.0354685, 0.3503896, 1, 0, 0, 1, 1,
0.315635, -0.299452, 2.694478, 1, 0, 0, 1, 1,
0.3158071, -1.044554, 1.931132, 1, 0, 0, 1, 1,
0.3203217, 1.852014, 0.3825714, 1, 0, 0, 1, 1,
0.3228021, -1.650904, 3.15405, 1, 0, 0, 1, 1,
0.3237708, -0.7066672, 2.841332, 0, 0, 0, 1, 1,
0.3264009, 0.556601, 0.4070603, 0, 0, 0, 1, 1,
0.3275034, -0.6518084, 4.364404, 0, 0, 0, 1, 1,
0.3295446, -1.411632, 3.13157, 0, 0, 0, 1, 1,
0.3304567, -0.05334052, 1.44366, 0, 0, 0, 1, 1,
0.3307695, -1.001404, 5.070324, 0, 0, 0, 1, 1,
0.3338815, 0.2239528, 0.7826641, 0, 0, 0, 1, 1,
0.3339249, 0.260901, 0.2480843, 1, 1, 1, 1, 1,
0.3379165, 0.1051547, 1.27946, 1, 1, 1, 1, 1,
0.3445362, 1.109235, -2.959542, 1, 1, 1, 1, 1,
0.3454123, 1.291266, 1.024521, 1, 1, 1, 1, 1,
0.350197, 0.2922024, 0.7312344, 1, 1, 1, 1, 1,
0.3530948, -1.725047, 2.155658, 1, 1, 1, 1, 1,
0.3545687, -0.5556617, 0.8108809, 1, 1, 1, 1, 1,
0.3552028, -0.6689754, 3.498166, 1, 1, 1, 1, 1,
0.3554532, -0.445042, 2.242022, 1, 1, 1, 1, 1,
0.3582172, 1.393867, -1.210453, 1, 1, 1, 1, 1,
0.3596868, -0.1521038, 2.549323, 1, 1, 1, 1, 1,
0.3614537, -1.190817, 4.229967, 1, 1, 1, 1, 1,
0.366163, -0.7475885, 1.470967, 1, 1, 1, 1, 1,
0.3674765, -1.205932, 4.307493, 1, 1, 1, 1, 1,
0.3703819, -1.046828, 3.358407, 1, 1, 1, 1, 1,
0.3703867, -0.1170987, 3.82067, 0, 0, 1, 1, 1,
0.3766213, 0.1726699, 0.3410553, 1, 0, 0, 1, 1,
0.3780561, -1.272576, 3.124863, 1, 0, 0, 1, 1,
0.378691, 0.7530688, 1.29873, 1, 0, 0, 1, 1,
0.3822147, 0.7918357, -0.3956936, 1, 0, 0, 1, 1,
0.3824336, -1.507399, 3.334066, 1, 0, 0, 1, 1,
0.3907238, -1.026828, 2.663897, 0, 0, 0, 1, 1,
0.392076, -1.362888, 4.071107, 0, 0, 0, 1, 1,
0.3938307, 0.2055492, 2.56383, 0, 0, 0, 1, 1,
0.3952124, 0.8478465, 1.10626, 0, 0, 0, 1, 1,
0.399578, -0.3819413, 0.8223382, 0, 0, 0, 1, 1,
0.3995929, -1.127522, 2.005887, 0, 0, 0, 1, 1,
0.4037869, 0.2444742, 0.4665297, 0, 0, 0, 1, 1,
0.4041977, -1.15219, 3.497018, 1, 1, 1, 1, 1,
0.4047058, -0.9702042, 4.385038, 1, 1, 1, 1, 1,
0.4062604, -0.4889963, 1.5702, 1, 1, 1, 1, 1,
0.4082133, 0.5723951, 0.8731807, 1, 1, 1, 1, 1,
0.4090334, 1.104649, 1.133942, 1, 1, 1, 1, 1,
0.4091739, 1.236712, 0.4041643, 1, 1, 1, 1, 1,
0.4137237, -0.09270156, 1.05038, 1, 1, 1, 1, 1,
0.4170976, 0.5761089, 0.3093779, 1, 1, 1, 1, 1,
0.4185421, -0.7312942, 2.605269, 1, 1, 1, 1, 1,
0.4197368, -1.055422, 2.857264, 1, 1, 1, 1, 1,
0.4216066, -0.1827796, 2.694145, 1, 1, 1, 1, 1,
0.4237782, 0.2114589, 0.5788688, 1, 1, 1, 1, 1,
0.4255099, 1.362761, 0.1242848, 1, 1, 1, 1, 1,
0.4373313, -2.50702, 2.640403, 1, 1, 1, 1, 1,
0.439227, -0.1931514, 1.317862, 1, 1, 1, 1, 1,
0.439418, 0.9695513, -0.2662829, 0, 0, 1, 1, 1,
0.4414108, 1.947277, 1.273028, 1, 0, 0, 1, 1,
0.4435703, 1.167811, 1.35155, 1, 0, 0, 1, 1,
0.4467258, 0.3701825, 0.795297, 1, 0, 0, 1, 1,
0.4467652, 0.3198705, 1.300574, 1, 0, 0, 1, 1,
0.4490075, 0.9013955, -0.2185165, 1, 0, 0, 1, 1,
0.449824, 0.9574376, 0.6985631, 0, 0, 0, 1, 1,
0.4515508, 1.027751, 1.72862, 0, 0, 0, 1, 1,
0.4538784, 1.308729, 0.03936226, 0, 0, 0, 1, 1,
0.4578995, 0.2261822, 1.4094, 0, 0, 0, 1, 1,
0.4615754, 0.69353, 0.7136165, 0, 0, 0, 1, 1,
0.4636494, 0.5729119, 2.897946, 0, 0, 0, 1, 1,
0.4681691, -0.4842739, 2.364189, 0, 0, 0, 1, 1,
0.4711025, 1.252431, 1.349365, 1, 1, 1, 1, 1,
0.4727184, -0.2832436, 1.563557, 1, 1, 1, 1, 1,
0.4774875, 1.639842, -0.2054072, 1, 1, 1, 1, 1,
0.4780554, -0.1627196, 1.970524, 1, 1, 1, 1, 1,
0.4793407, 0.1883747, 3.552254, 1, 1, 1, 1, 1,
0.4815518, -0.6011573, 3.869941, 1, 1, 1, 1, 1,
0.4855853, -0.2465787, 1.928849, 1, 1, 1, 1, 1,
0.4860969, 0.1526449, -0.09716535, 1, 1, 1, 1, 1,
0.4927205, 0.2948614, 0.3287135, 1, 1, 1, 1, 1,
0.4978186, 0.5012881, 0.6952643, 1, 1, 1, 1, 1,
0.4992171, 1.77117, 1.25428, 1, 1, 1, 1, 1,
0.5093366, 1.273242, 1.623361, 1, 1, 1, 1, 1,
0.5107438, -1.23134, 2.504737, 1, 1, 1, 1, 1,
0.5169566, -0.9109874, 1.346427, 1, 1, 1, 1, 1,
0.524934, 0.167629, 1.694165, 1, 1, 1, 1, 1,
0.5257674, -0.5766552, 2.498342, 0, 0, 1, 1, 1,
0.5259748, 1.271248, 0.4458846, 1, 0, 0, 1, 1,
0.5263075, -1.057378, 3.020108, 1, 0, 0, 1, 1,
0.5275564, -0.5009316, 3.484125, 1, 0, 0, 1, 1,
0.5309297, 0.07273234, 2.302357, 1, 0, 0, 1, 1,
0.5320157, 0.6016079, 0.613727, 1, 0, 0, 1, 1,
0.5368885, -0.1712569, 3.055007, 0, 0, 0, 1, 1,
0.5370326, -1.035013, 2.781246, 0, 0, 0, 1, 1,
0.5414324, 0.04420055, 3.628329, 0, 0, 0, 1, 1,
0.5417144, -0.2524156, 2.990559, 0, 0, 0, 1, 1,
0.5422941, 1.181539, 1.108326, 0, 0, 0, 1, 1,
0.5437914, 0.2221602, 0.3769998, 0, 0, 0, 1, 1,
0.5526963, 0.8633636, 0.5391233, 0, 0, 0, 1, 1,
0.5538449, 0.6486788, 2.105874, 1, 1, 1, 1, 1,
0.5637914, 0.9473627, 0.2817985, 1, 1, 1, 1, 1,
0.5705987, 0.1676251, 1.213495, 1, 1, 1, 1, 1,
0.5875722, -0.4105329, 2.34473, 1, 1, 1, 1, 1,
0.5888307, 1.952058, -0.860631, 1, 1, 1, 1, 1,
0.5998312, -0.0681173, 3.80106, 1, 1, 1, 1, 1,
0.6038859, -0.4621982, 1.924515, 1, 1, 1, 1, 1,
0.6114973, -0.6603599, 1.019333, 1, 1, 1, 1, 1,
0.6119954, -0.7342734, 1.571724, 1, 1, 1, 1, 1,
0.6141852, -0.5421293, 3.956414, 1, 1, 1, 1, 1,
0.6169873, 0.4585212, -0.8681372, 1, 1, 1, 1, 1,
0.6172111, 1.62136, 0.4964059, 1, 1, 1, 1, 1,
0.633616, 1.552219, -0.642091, 1, 1, 1, 1, 1,
0.6399581, -0.6738279, 2.236581, 1, 1, 1, 1, 1,
0.6400992, -0.3797789, 1.024324, 1, 1, 1, 1, 1,
0.6418093, -0.7025148, 1.600378, 0, 0, 1, 1, 1,
0.6456446, 0.5438801, 1.223413, 1, 0, 0, 1, 1,
0.6460019, 0.88672, -0.1405294, 1, 0, 0, 1, 1,
0.6498301, 0.1393306, 1.142799, 1, 0, 0, 1, 1,
0.6499523, -0.380303, 0.3194658, 1, 0, 0, 1, 1,
0.6534038, 0.1872651, 2.155847, 1, 0, 0, 1, 1,
0.6547567, 0.02576585, 0.4061228, 0, 0, 0, 1, 1,
0.6551519, -0.4511598, 4.28544, 0, 0, 0, 1, 1,
0.6583828, -1.330388, 3.680171, 0, 0, 0, 1, 1,
0.6587929, -0.8531529, 2.20522, 0, 0, 0, 1, 1,
0.6592162, 0.8080918, 0.7956336, 0, 0, 0, 1, 1,
0.6592655, 0.06346111, -0.696757, 0, 0, 0, 1, 1,
0.6609952, -1.34824, 1.633744, 0, 0, 0, 1, 1,
0.6641291, -2.297049, 1.025235, 1, 1, 1, 1, 1,
0.6645902, 0.3796033, 1.04655, 1, 1, 1, 1, 1,
0.6683741, 0.2498341, 0.5724381, 1, 1, 1, 1, 1,
0.6734332, 0.8084715, 0.460936, 1, 1, 1, 1, 1,
0.6753911, 1.310252, -0.4585479, 1, 1, 1, 1, 1,
0.6782454, -1.414718, 1.416307, 1, 1, 1, 1, 1,
0.6853289, 1.261824, -0.153836, 1, 1, 1, 1, 1,
0.6864643, 0.8161493, 1.291478, 1, 1, 1, 1, 1,
0.6868036, 0.03661696, 0.8281093, 1, 1, 1, 1, 1,
0.6872963, -0.6468015, 1.921204, 1, 1, 1, 1, 1,
0.6928666, -1.897694, 1.413578, 1, 1, 1, 1, 1,
0.7048306, 0.2311802, 1.87829, 1, 1, 1, 1, 1,
0.7053834, -0.1816379, 2.784426, 1, 1, 1, 1, 1,
0.7106797, 0.6751977, 1.350119, 1, 1, 1, 1, 1,
0.7130652, -0.09448455, 1.713423, 1, 1, 1, 1, 1,
0.7259652, 0.668341, 0.8214206, 0, 0, 1, 1, 1,
0.7284732, -0.3389298, 1.83296, 1, 0, 0, 1, 1,
0.729481, 0.1239538, 1.786552, 1, 0, 0, 1, 1,
0.7325094, 0.7869459, 1.210253, 1, 0, 0, 1, 1,
0.7404583, 0.9612173, 0.3482151, 1, 0, 0, 1, 1,
0.7461216, -1.329952, 3.81267, 1, 0, 0, 1, 1,
0.7540175, -0.4048907, 1.676324, 0, 0, 0, 1, 1,
0.7541701, 0.1184989, 3.339418, 0, 0, 0, 1, 1,
0.7543057, 0.9701776, 0.5546706, 0, 0, 0, 1, 1,
0.75432, -1.924799, 3.083908, 0, 0, 0, 1, 1,
0.7564703, -1.113216, 2.357905, 0, 0, 0, 1, 1,
0.7587449, -1.27118, 2.666247, 0, 0, 0, 1, 1,
0.7639268, -1.165497, 0.5438613, 0, 0, 0, 1, 1,
0.7729098, 0.7062526, -0.6937171, 1, 1, 1, 1, 1,
0.7740426, 2.431392, 0.489159, 1, 1, 1, 1, 1,
0.7783879, -1.307658, 3.041665, 1, 1, 1, 1, 1,
0.7785929, 0.3476204, 1.270018, 1, 1, 1, 1, 1,
0.7790813, 0.2185853, 1.637608, 1, 1, 1, 1, 1,
0.7803285, 1.73536, 1.908274, 1, 1, 1, 1, 1,
0.7815273, -0.1332539, 1.578129, 1, 1, 1, 1, 1,
0.7881803, -0.2049769, 1.673292, 1, 1, 1, 1, 1,
0.7920475, 0.472977, 0.8081639, 1, 1, 1, 1, 1,
0.795354, -0.7453486, 2.398172, 1, 1, 1, 1, 1,
0.7962561, -1.296361, 4.523247, 1, 1, 1, 1, 1,
0.7970166, -0.9050246, 2.571388, 1, 1, 1, 1, 1,
0.8069876, 0.9921821, -0.02632546, 1, 1, 1, 1, 1,
0.8248962, 1.286665, 1.034757, 1, 1, 1, 1, 1,
0.8315693, 0.7864569, -0.08492123, 1, 1, 1, 1, 1,
0.8326219, -1.523147, 3.35883, 0, 0, 1, 1, 1,
0.8386124, -0.9803029, 2.125952, 1, 0, 0, 1, 1,
0.8464141, -1.302269, 1.928193, 1, 0, 0, 1, 1,
0.8470975, -0.2042199, 1.916345, 1, 0, 0, 1, 1,
0.8594207, 2.039438, -0.6235458, 1, 0, 0, 1, 1,
0.8614157, -1.784431, 1.822716, 1, 0, 0, 1, 1,
0.8626369, -0.1817614, 2.906693, 0, 0, 0, 1, 1,
0.8684313, -1.583475, 1.322189, 0, 0, 0, 1, 1,
0.8740563, 1.545299, 1.318152, 0, 0, 0, 1, 1,
0.8778656, 0.1447684, 1.478289, 0, 0, 0, 1, 1,
0.8895418, 0.5306131, 1.929731, 0, 0, 0, 1, 1,
0.8897489, -1.323292, 2.130574, 0, 0, 0, 1, 1,
0.9002157, -1.148032, 1.085369, 0, 0, 0, 1, 1,
0.9126268, 0.1654147, 2.086984, 1, 1, 1, 1, 1,
0.9158118, 0.01743175, 0.9479042, 1, 1, 1, 1, 1,
0.9208325, -0.3425231, 1.349405, 1, 1, 1, 1, 1,
0.9223779, 0.6166386, 0.8654675, 1, 1, 1, 1, 1,
0.9290214, -1.128672, 1.968732, 1, 1, 1, 1, 1,
0.9321331, 0.1203169, 2.209352, 1, 1, 1, 1, 1,
0.9331585, -0.4136805, 1.68214, 1, 1, 1, 1, 1,
0.936802, -0.8446963, 3.674043, 1, 1, 1, 1, 1,
0.9372312, 0.2956536, 1.588821, 1, 1, 1, 1, 1,
0.9415475, 0.4532372, 2.332329, 1, 1, 1, 1, 1,
0.9425799, 0.6954625, -0.2761494, 1, 1, 1, 1, 1,
0.9466806, 0.9615546, 1.495028, 1, 1, 1, 1, 1,
0.952294, -0.4794606, 0.6094552, 1, 1, 1, 1, 1,
0.9554756, -1.726899, 5.240226, 1, 1, 1, 1, 1,
0.9583177, 1.200043, -0.642956, 1, 1, 1, 1, 1,
0.9602113, -1.258443, 2.171998, 0, 0, 1, 1, 1,
0.9624341, 0.1523278, -0.7009175, 1, 0, 0, 1, 1,
0.96596, -1.06419, 1.813357, 1, 0, 0, 1, 1,
0.9677426, -0.381538, 1.282119, 1, 0, 0, 1, 1,
0.9764427, 1.107797, 2.115966, 1, 0, 0, 1, 1,
0.976621, -0.898366, 1.810563, 1, 0, 0, 1, 1,
0.9778687, 1.99558, 1.135563, 0, 0, 0, 1, 1,
0.9799859, 0.003846343, 3.072219, 0, 0, 0, 1, 1,
0.9804251, 0.07259277, 1.073952, 0, 0, 0, 1, 1,
0.9867502, -1.758612, 1.147131, 0, 0, 0, 1, 1,
0.9923516, -0.9064077, 2.682871, 0, 0, 0, 1, 1,
0.9986235, 0.0891007, 2.417625, 0, 0, 0, 1, 1,
1.004337, -1.661551, 1.944866, 0, 0, 0, 1, 1,
1.011437, -0.7789209, 3.074485, 1, 1, 1, 1, 1,
1.011588, 0.6834737, 0.6926475, 1, 1, 1, 1, 1,
1.014146, -0.7146463, 1.932644, 1, 1, 1, 1, 1,
1.01469, -1.534064, 1.256599, 1, 1, 1, 1, 1,
1.017736, 0.0002240664, 1.691789, 1, 1, 1, 1, 1,
1.025089, 1.846934, 0.4527073, 1, 1, 1, 1, 1,
1.027474, -0.6641459, 0.632059, 1, 1, 1, 1, 1,
1.029235, -0.1749252, 0.8394091, 1, 1, 1, 1, 1,
1.036349, -0.9985009, 3.181827, 1, 1, 1, 1, 1,
1.03798, -1.330345, 4.667531, 1, 1, 1, 1, 1,
1.039239, -0.7665132, 2.416233, 1, 1, 1, 1, 1,
1.046263, 0.7187864, 0.7743213, 1, 1, 1, 1, 1,
1.046396, -0.8893787, 3.111608, 1, 1, 1, 1, 1,
1.050954, 0.4581987, 1.629857, 1, 1, 1, 1, 1,
1.054095, -0.02054439, 0.2447759, 1, 1, 1, 1, 1,
1.059709, 1.147898, 1.472886, 0, 0, 1, 1, 1,
1.065546, -1.017238, 2.114271, 1, 0, 0, 1, 1,
1.066857, -0.394038, 2.880448, 1, 0, 0, 1, 1,
1.076389, 0.001720265, 0.6901094, 1, 0, 0, 1, 1,
1.089426, 0.9591524, -0.6449493, 1, 0, 0, 1, 1,
1.089695, -0.1091073, 2.171555, 1, 0, 0, 1, 1,
1.090329, -0.7691029, 3.275814, 0, 0, 0, 1, 1,
1.091272, -0.3129131, 0.6782, 0, 0, 0, 1, 1,
1.095208, -0.8099956, 3.512108, 0, 0, 0, 1, 1,
1.098531, -1.12786, 1.47655, 0, 0, 0, 1, 1,
1.100215, 1.985247, 0.3222239, 0, 0, 0, 1, 1,
1.100241, 1.961277, 0.9045368, 0, 0, 0, 1, 1,
1.109797, -0.6745673, 1.269786, 0, 0, 0, 1, 1,
1.110399, -0.5263545, 0.5941625, 1, 1, 1, 1, 1,
1.117052, 0.7119637, 1.712907, 1, 1, 1, 1, 1,
1.118328, 0.269825, 0.8455942, 1, 1, 1, 1, 1,
1.118749, -1.655116, 1.369203, 1, 1, 1, 1, 1,
1.119801, -0.2522791, 1.106527, 1, 1, 1, 1, 1,
1.128254, 0.7806381, -0.8839503, 1, 1, 1, 1, 1,
1.136416, -1.884327, 3.253114, 1, 1, 1, 1, 1,
1.13824, -0.9542415, 3.002895, 1, 1, 1, 1, 1,
1.140753, 0.4756796, 2.03089, 1, 1, 1, 1, 1,
1.149051, 0.6774878, 2.00038, 1, 1, 1, 1, 1,
1.16285, 0.4592184, 1.315774, 1, 1, 1, 1, 1,
1.169697, -0.9675667, 0.6664226, 1, 1, 1, 1, 1,
1.180327, 0.7715584, 3.096862, 1, 1, 1, 1, 1,
1.187809, -0.7794971, 3.046888, 1, 1, 1, 1, 1,
1.196405, -0.1339591, 2.257124, 1, 1, 1, 1, 1,
1.202501, -0.3082704, 1.241574, 0, 0, 1, 1, 1,
1.205559, 0.8234679, 1.342098, 1, 0, 0, 1, 1,
1.209545, -2.238804, 2.39, 1, 0, 0, 1, 1,
1.217546, 0.678357, 2.17897, 1, 0, 0, 1, 1,
1.219147, 1.056359, -0.9746763, 1, 0, 0, 1, 1,
1.223283, -2.265913, 2.248914, 1, 0, 0, 1, 1,
1.230241, 0.3153479, 3.509757, 0, 0, 0, 1, 1,
1.232689, 0.2260199, 0.5301642, 0, 0, 0, 1, 1,
1.237879, 0.04550328, 2.870045, 0, 0, 0, 1, 1,
1.244284, 1.35191, 0.8989408, 0, 0, 0, 1, 1,
1.250099, -0.5563904, 1.349061, 0, 0, 0, 1, 1,
1.253078, -0.6337049, 3.079751, 0, 0, 0, 1, 1,
1.256412, -0.5073679, 0.6275276, 0, 0, 0, 1, 1,
1.260981, -1.987346, 2.588292, 1, 1, 1, 1, 1,
1.264423, -0.6391712, 3.261325, 1, 1, 1, 1, 1,
1.26663, -1.618215, 3.595079, 1, 1, 1, 1, 1,
1.26769, 0.25865, 3.574847, 1, 1, 1, 1, 1,
1.271118, -0.001937831, 2.272393, 1, 1, 1, 1, 1,
1.271637, -0.5926222, 4.392446, 1, 1, 1, 1, 1,
1.275178, -0.9316221, 3.275341, 1, 1, 1, 1, 1,
1.278711, -1.0027, 3.164454, 1, 1, 1, 1, 1,
1.281542, 0.5518626, 0.2223952, 1, 1, 1, 1, 1,
1.282246, 0.7077588, 1.707551, 1, 1, 1, 1, 1,
1.288396, -0.8720675, 2.168733, 1, 1, 1, 1, 1,
1.321522, 0.0218385, 1.690799, 1, 1, 1, 1, 1,
1.336205, 0.1063547, -0.230408, 1, 1, 1, 1, 1,
1.37652, -0.8952804, 1.190045, 1, 1, 1, 1, 1,
1.379517, -0.8917285, 1.124315, 1, 1, 1, 1, 1,
1.379773, 1.081154, 0.3639077, 0, 0, 1, 1, 1,
1.385401, -0.8620954, 2.719095, 1, 0, 0, 1, 1,
1.391652, 0.5851679, 0.6722936, 1, 0, 0, 1, 1,
1.394324, -0.7547165, 2.197911, 1, 0, 0, 1, 1,
1.40032, 2.448212, 0.9112151, 1, 0, 0, 1, 1,
1.418404, 1.71449, 0.8103374, 1, 0, 0, 1, 1,
1.419743, 0.2568994, 2.353888, 0, 0, 0, 1, 1,
1.422669, 1.93922, 0.8030582, 0, 0, 0, 1, 1,
1.425367, 1.136286, 1.033599, 0, 0, 0, 1, 1,
1.427824, -0.6635332, 2.144276, 0, 0, 0, 1, 1,
1.439906, 0.6737363, 1.162369, 0, 0, 0, 1, 1,
1.447998, 1.00542, 1.336522, 0, 0, 0, 1, 1,
1.452545, 0.8531984, 0.7606713, 0, 0, 0, 1, 1,
1.480504, 1.18985, -1.961069, 1, 1, 1, 1, 1,
1.49203, -0.7375464, 1.285834, 1, 1, 1, 1, 1,
1.510682, 0.420608, 1.388294, 1, 1, 1, 1, 1,
1.512815, 0.5333425, 1.131627, 1, 1, 1, 1, 1,
1.512859, -0.3527497, 2.138301, 1, 1, 1, 1, 1,
1.523609, -0.01688378, -0.004721961, 1, 1, 1, 1, 1,
1.543121, 0.9998659, 2.110723, 1, 1, 1, 1, 1,
1.546993, 0.2960232, -2.159277, 1, 1, 1, 1, 1,
1.549222, -0.3148475, -0.2804665, 1, 1, 1, 1, 1,
1.55287, 0.9270927, -0.2019998, 1, 1, 1, 1, 1,
1.566771, -1.334264, 1.874903, 1, 1, 1, 1, 1,
1.569975, -0.9767808, 2.154764, 1, 1, 1, 1, 1,
1.579387, -0.5917878, -0.1721265, 1, 1, 1, 1, 1,
1.587707, -0.5581501, 3.923873, 1, 1, 1, 1, 1,
1.624934, 1.490386, 2.14434, 1, 1, 1, 1, 1,
1.63405, -0.2999123, 1.484313, 0, 0, 1, 1, 1,
1.637709, 0.8066238, 3.040075, 1, 0, 0, 1, 1,
1.640686, -0.3684944, 1.514913, 1, 0, 0, 1, 1,
1.642348, -0.06581339, 1.434582, 1, 0, 0, 1, 1,
1.656905, -1.052662, 1.999491, 1, 0, 0, 1, 1,
1.689975, 0.605008, 0.4399361, 1, 0, 0, 1, 1,
1.732494, 1.456279, 0.4241396, 0, 0, 0, 1, 1,
1.736232, -0.5318294, 1.833838, 0, 0, 0, 1, 1,
1.751297, -0.8539984, 2.175725, 0, 0, 0, 1, 1,
1.763688, 0.3434802, 1.679985, 0, 0, 0, 1, 1,
1.766236, 1.771648, 1.433597, 0, 0, 0, 1, 1,
1.775493, 0.2549682, 1.659494, 0, 0, 0, 1, 1,
1.790956, -0.1863611, 1.472755, 0, 0, 0, 1, 1,
1.802551, 0.7700904, 1.126437, 1, 1, 1, 1, 1,
1.813095, -0.2083436, 1.719198, 1, 1, 1, 1, 1,
1.853938, -0.767996, 2.007191, 1, 1, 1, 1, 1,
1.876683, -0.3208763, 3.192043, 1, 1, 1, 1, 1,
1.877612, -0.0555601, 3.218241, 1, 1, 1, 1, 1,
1.886765, -1.209174, 3.756629, 1, 1, 1, 1, 1,
1.891896, 2.285922, 0.3736045, 1, 1, 1, 1, 1,
1.919611, 1.417095, 0.8333594, 1, 1, 1, 1, 1,
1.92813, 0.7730352, 1.516969, 1, 1, 1, 1, 1,
1.931627, -1.223949, 1.784466, 1, 1, 1, 1, 1,
1.954329, 1.869645, 1.690109, 1, 1, 1, 1, 1,
1.974703, 0.01416833, 0.9164356, 1, 1, 1, 1, 1,
1.986064, 0.9871644, 3.148478, 1, 1, 1, 1, 1,
1.988193, 0.6928562, -0.1534782, 1, 1, 1, 1, 1,
1.998248, 1.142547, -0.0488104, 1, 1, 1, 1, 1,
2.018729, 0.9383134, 1.775594, 0, 0, 1, 1, 1,
2.029461, 0.3783779, 1.145968, 1, 0, 0, 1, 1,
2.03499, 0.1724366, 2.000939, 1, 0, 0, 1, 1,
2.051924, -0.2087244, 1.39571, 1, 0, 0, 1, 1,
2.077588, -1.941532, 3.997351, 1, 0, 0, 1, 1,
2.103394, 1.243071, 0.3273018, 1, 0, 0, 1, 1,
2.105505, 1.141583, 0.5685189, 0, 0, 0, 1, 1,
2.14185, 0.5293637, 2.86941, 0, 0, 0, 1, 1,
2.155946, -0.7804577, 0.078183, 0, 0, 0, 1, 1,
2.172064, -2.082942, 1.975936, 0, 0, 0, 1, 1,
2.423433, 0.4005119, 1.494922, 0, 0, 0, 1, 1,
2.487947, 0.5307117, 1.549245, 0, 0, 0, 1, 1,
2.534269, -0.5461717, 0.6289821, 0, 0, 0, 1, 1,
2.589714, -0.2961879, 1.023642, 1, 1, 1, 1, 1,
2.638566, 0.3864484, -0.3338024, 1, 1, 1, 1, 1,
2.695403, -0.6786892, 1.78485, 1, 1, 1, 1, 1,
2.706554, 0.2149304, 1.647164, 1, 1, 1, 1, 1,
2.923515, 0.7087588, 0.1280346, 1, 1, 1, 1, 1,
2.933966, 0.3794645, 1.623825, 1, 1, 1, 1, 1,
2.936939, 0.2651412, 1.446289, 1, 1, 1, 1, 1
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
var radius = 9.639201;
var distance = 33.85728;
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
mvMatrix.translate( 0.02424276, -0.39308, 0.1064548 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.85728);
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
