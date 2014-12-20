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
-3.012269, 0.4615579, 0.5227526, 1, 0, 0, 1,
-2.965005, -0.1662579, -0.8225812, 1, 0.007843138, 0, 1,
-2.94064, 0.03010639, -2.636021, 1, 0.01176471, 0, 1,
-2.677774, -0.2741407, -2.457309, 1, 0.01960784, 0, 1,
-2.571933, 0.04796219, -2.486998, 1, 0.02352941, 0, 1,
-2.566788, 0.04019732, -0.9643289, 1, 0.03137255, 0, 1,
-2.553513, 1.053716, -1.198059, 1, 0.03529412, 0, 1,
-2.418091, 1.15754, -1.066536, 1, 0.04313726, 0, 1,
-2.321175, 0.7972773, -0.9502237, 1, 0.04705882, 0, 1,
-2.197967, -0.2604712, -1.259119, 1, 0.05490196, 0, 1,
-2.181829, 1.295248, -1.096483, 1, 0.05882353, 0, 1,
-2.129676, -0.3620558, -1.880686, 1, 0.06666667, 0, 1,
-2.113637, -1.071999, -1.073339, 1, 0.07058824, 0, 1,
-2.112703, 1.939962, -0.639102, 1, 0.07843138, 0, 1,
-2.108278, -0.6427659, -1.557129, 1, 0.08235294, 0, 1,
-2.098112, -0.644572, -1.647874, 1, 0.09019608, 0, 1,
-2.091321, -0.09066495, -2.147443, 1, 0.09411765, 0, 1,
-2.087311, 1.467636, -0.09642982, 1, 0.1019608, 0, 1,
-2.080252, 0.2600675, -1.239089, 1, 0.1098039, 0, 1,
-2.052845, 2.022689, -1.492139, 1, 0.1137255, 0, 1,
-2.040851, -0.548925, -4.023916, 1, 0.1215686, 0, 1,
-2.015427, 0.3225926, -2.133682, 1, 0.1254902, 0, 1,
-2.00312, -0.4606459, -2.70216, 1, 0.1333333, 0, 1,
-1.984777, 0.2363372, -1.651493, 1, 0.1372549, 0, 1,
-1.967839, -0.4469629, -1.717314, 1, 0.145098, 0, 1,
-1.958048, -1.193292, -0.829829, 1, 0.1490196, 0, 1,
-1.941578, 1.022385, -1.295616, 1, 0.1568628, 0, 1,
-1.899629, 1.107856, -1.09671, 1, 0.1607843, 0, 1,
-1.879973, -0.7381526, -1.341821, 1, 0.1686275, 0, 1,
-1.840923, -0.0182482, -1.896178, 1, 0.172549, 0, 1,
-1.818221, 0.8508692, -0.2793357, 1, 0.1803922, 0, 1,
-1.80985, 0.9805034, -2.353231, 1, 0.1843137, 0, 1,
-1.805171, -2.666352, -1.849344, 1, 0.1921569, 0, 1,
-1.797362, -0.4622666, -2.124273, 1, 0.1960784, 0, 1,
-1.7921, 0.3993435, -0.8135827, 1, 0.2039216, 0, 1,
-1.787056, -0.7477362, -0.7240138, 1, 0.2117647, 0, 1,
-1.775414, 1.486045, -1.702721, 1, 0.2156863, 0, 1,
-1.764919, 0.02565434, -2.707239, 1, 0.2235294, 0, 1,
-1.754299, 0.6657612, -1.106241, 1, 0.227451, 0, 1,
-1.73554, -0.3794359, -4.054168, 1, 0.2352941, 0, 1,
-1.713911, 0.5800087, -0.9172164, 1, 0.2392157, 0, 1,
-1.6969, 1.577341, -0.2818096, 1, 0.2470588, 0, 1,
-1.686147, -0.9773665, -1.649921, 1, 0.2509804, 0, 1,
-1.680408, -0.3028484, -0.7850662, 1, 0.2588235, 0, 1,
-1.666877, -0.8161559, -1.691088, 1, 0.2627451, 0, 1,
-1.662856, -0.1651815, -0.491137, 1, 0.2705882, 0, 1,
-1.662333, 0.08786068, -2.328352, 1, 0.2745098, 0, 1,
-1.650622, 0.09294336, -2.266654, 1, 0.282353, 0, 1,
-1.636622, 0.5317658, -1.53301, 1, 0.2862745, 0, 1,
-1.621248, -1.973332, -0.7310136, 1, 0.2941177, 0, 1,
-1.603446, -0.3124263, -2.854512, 1, 0.3019608, 0, 1,
-1.602453, -2.003453, -1.155656, 1, 0.3058824, 0, 1,
-1.58024, -1.723702, -1.632534, 1, 0.3137255, 0, 1,
-1.579052, 0.4314486, -1.084463, 1, 0.3176471, 0, 1,
-1.576293, -0.7403625, -3.531691, 1, 0.3254902, 0, 1,
-1.568527, 0.4394947, -1.394034, 1, 0.3294118, 0, 1,
-1.565825, 0.4768834, -1.303068, 1, 0.3372549, 0, 1,
-1.565122, -1.384411, -1.644855, 1, 0.3411765, 0, 1,
-1.544288, -0.9218687, -1.724491, 1, 0.3490196, 0, 1,
-1.531013, 0.9916281, -1.623516, 1, 0.3529412, 0, 1,
-1.524546, 1.236891, -1.703913, 1, 0.3607843, 0, 1,
-1.50247, 1.021852, -2.834434, 1, 0.3647059, 0, 1,
-1.498831, 0.3069693, -1.13787, 1, 0.372549, 0, 1,
-1.497461, 0.3710132, -1.396634, 1, 0.3764706, 0, 1,
-1.493115, 1.215167, -0.5333534, 1, 0.3843137, 0, 1,
-1.450093, -0.668598, -3.254478, 1, 0.3882353, 0, 1,
-1.446176, -0.5593628, -1.678479, 1, 0.3960784, 0, 1,
-1.438358, 0.6123978, -0.4236058, 1, 0.4039216, 0, 1,
-1.437923, 0.9609965, 0.03217192, 1, 0.4078431, 0, 1,
-1.424418, 0.9949922, -1.912293, 1, 0.4156863, 0, 1,
-1.395579, 0.8007686, -0.5686314, 1, 0.4196078, 0, 1,
-1.382558, -0.2145773, -4.069389, 1, 0.427451, 0, 1,
-1.364534, 0.6061666, -1.183213, 1, 0.4313726, 0, 1,
-1.36376, 0.01898829, -1.075351, 1, 0.4392157, 0, 1,
-1.357288, 0.8275748, -1.278267, 1, 0.4431373, 0, 1,
-1.350296, 0.3523797, -1.574032, 1, 0.4509804, 0, 1,
-1.345158, -0.133519, -1.445945, 1, 0.454902, 0, 1,
-1.334902, 0.6212575, -2.038374, 1, 0.4627451, 0, 1,
-1.326902, -0.6378803, -3.658012, 1, 0.4666667, 0, 1,
-1.319888, 1.07983, -0.8208565, 1, 0.4745098, 0, 1,
-1.315672, -1.23719, -2.29675, 1, 0.4784314, 0, 1,
-1.298768, 0.2802888, -2.489951, 1, 0.4862745, 0, 1,
-1.294025, -0.7761198, -2.47124, 1, 0.4901961, 0, 1,
-1.293348, -0.2084246, -2.631835, 1, 0.4980392, 0, 1,
-1.284978, -1.265733, -0.7122613, 1, 0.5058824, 0, 1,
-1.274657, -1.818155, -3.047995, 1, 0.509804, 0, 1,
-1.265539, 0.09630329, -2.17159, 1, 0.5176471, 0, 1,
-1.263694, -0.416198, -4.014982, 1, 0.5215687, 0, 1,
-1.257967, -0.6288716, -1.845507, 1, 0.5294118, 0, 1,
-1.257607, -0.4033195, -2.918806, 1, 0.5333334, 0, 1,
-1.255123, -1.063809, -3.301745, 1, 0.5411765, 0, 1,
-1.254994, -0.4271041, -0.3593257, 1, 0.5450981, 0, 1,
-1.252543, -0.9060852, -2.509178, 1, 0.5529412, 0, 1,
-1.252189, -2.130385, -4.297922, 1, 0.5568628, 0, 1,
-1.243662, -1.324793, -1.96218, 1, 0.5647059, 0, 1,
-1.240983, -0.3943141, -2.730224, 1, 0.5686275, 0, 1,
-1.238966, -1.22499, -1.851006, 1, 0.5764706, 0, 1,
-1.232909, 1.961973, -0.6681637, 1, 0.5803922, 0, 1,
-1.231374, 0.6291165, -1.510621, 1, 0.5882353, 0, 1,
-1.228098, 0.2391277, -1.75442, 1, 0.5921569, 0, 1,
-1.220557, -0.4150628, -1.098395, 1, 0.6, 0, 1,
-1.21766, -0.6053681, -2.170164, 1, 0.6078432, 0, 1,
-1.211896, 1.212596, -1.309335, 1, 0.6117647, 0, 1,
-1.199379, 2.34116, 0.6582797, 1, 0.6196079, 0, 1,
-1.19907, -0.7023306, -1.615099, 1, 0.6235294, 0, 1,
-1.197377, 1.962132, 0.4756841, 1, 0.6313726, 0, 1,
-1.186308, 0.3588657, -2.638488, 1, 0.6352941, 0, 1,
-1.18317, -0.2736686, -2.222879, 1, 0.6431373, 0, 1,
-1.174879, -0.38053, -2.684139, 1, 0.6470588, 0, 1,
-1.170602, 0.8262318, 0.4092665, 1, 0.654902, 0, 1,
-1.157054, 0.8435869, -0.7691764, 1, 0.6588235, 0, 1,
-1.152265, -0.3570141, -2.533544, 1, 0.6666667, 0, 1,
-1.150346, -1.705456, -2.765303, 1, 0.6705883, 0, 1,
-1.149235, -0.2993465, -2.474448, 1, 0.6784314, 0, 1,
-1.148532, -0.03555408, -1.393932, 1, 0.682353, 0, 1,
-1.146207, 0.8114596, 0.776656, 1, 0.6901961, 0, 1,
-1.142584, 0.7061138, -0.7939475, 1, 0.6941177, 0, 1,
-1.139241, -0.1513597, -2.637182, 1, 0.7019608, 0, 1,
-1.134839, -0.3402654, -0.7351129, 1, 0.7098039, 0, 1,
-1.11802, 1.077942, 0.1081719, 1, 0.7137255, 0, 1,
-1.113968, -1.374515, -2.000618, 1, 0.7215686, 0, 1,
-1.111337, 0.8602023, -0.415756, 1, 0.7254902, 0, 1,
-1.110695, -1.343713, -3.410197, 1, 0.7333333, 0, 1,
-1.108219, -0.9328554, -1.426, 1, 0.7372549, 0, 1,
-1.107698, 0.2388679, -1.61308, 1, 0.7450981, 0, 1,
-1.105544, -0.3333093, -0.8844234, 1, 0.7490196, 0, 1,
-1.099971, -0.1320172, -0.7754539, 1, 0.7568628, 0, 1,
-1.0969, -0.390734, -1.355354, 1, 0.7607843, 0, 1,
-1.089983, -0.5910872, -1.887228, 1, 0.7686275, 0, 1,
-1.086726, -0.9410037, -5.19312, 1, 0.772549, 0, 1,
-1.076976, 1.345308, -0.2725546, 1, 0.7803922, 0, 1,
-1.07694, 0.1770336, -2.129989, 1, 0.7843137, 0, 1,
-1.065967, -0.2463298, -0.3225787, 1, 0.7921569, 0, 1,
-1.064109, -0.2093483, -0.5509933, 1, 0.7960784, 0, 1,
-1.064058, -0.0627687, -3.245823, 1, 0.8039216, 0, 1,
-1.061529, -0.5498634, -1.929986, 1, 0.8117647, 0, 1,
-1.053535, 0.452169, -0.8501835, 1, 0.8156863, 0, 1,
-1.039614, -1.525191, -2.955207, 1, 0.8235294, 0, 1,
-1.039527, -0.2183986, -1.153112, 1, 0.827451, 0, 1,
-1.039095, -0.7429963, -3.049863, 1, 0.8352941, 0, 1,
-1.03889, 1.678869, 0.4580082, 1, 0.8392157, 0, 1,
-1.035787, 1.889412, 1.324812, 1, 0.8470588, 0, 1,
-1.033859, 1.165043, 0.7959977, 1, 0.8509804, 0, 1,
-1.03281, 1.403947, -0.2802528, 1, 0.8588235, 0, 1,
-1.031222, 0.007221334, -1.392777, 1, 0.8627451, 0, 1,
-1.026286, 0.02906024, 0.2995451, 1, 0.8705882, 0, 1,
-1.023738, -1.179138, -1.181567, 1, 0.8745098, 0, 1,
-1.023029, 0.1607859, -0.4191423, 1, 0.8823529, 0, 1,
-1.020069, 0.007868273, -4.038433, 1, 0.8862745, 0, 1,
-1.014217, -0.3087776, -2.45455, 1, 0.8941177, 0, 1,
-1.011317, -0.4378082, -1.947335, 1, 0.8980392, 0, 1,
-1.010541, -2.278092, -3.014414, 1, 0.9058824, 0, 1,
-1.009972, -1.072661, -3.331981, 1, 0.9137255, 0, 1,
-1.005878, 0.7044616, 0.2875202, 1, 0.9176471, 0, 1,
-1.005574, 2.046296, -0.4206249, 1, 0.9254902, 0, 1,
-1.002518, -0.4771158, -1.739048, 1, 0.9294118, 0, 1,
-0.996148, 0.09403818, -0.7475874, 1, 0.9372549, 0, 1,
-0.9916795, -0.2951449, -2.373344, 1, 0.9411765, 0, 1,
-0.9901791, 1.618063, -0.7297143, 1, 0.9490196, 0, 1,
-0.9837273, -0.3337834, -1.731557, 1, 0.9529412, 0, 1,
-0.9812284, -0.3666419, -2.784712, 1, 0.9607843, 0, 1,
-0.9804554, 0.4010618, -2.103055, 1, 0.9647059, 0, 1,
-0.9771994, 0.4653861, -1.652476, 1, 0.972549, 0, 1,
-0.9703821, 1.354746, -0.8877154, 1, 0.9764706, 0, 1,
-0.9556962, 1.814857, -0.07697707, 1, 0.9843137, 0, 1,
-0.9450923, 1.019283, -2.165061, 1, 0.9882353, 0, 1,
-0.9431704, 1.552917, -1.078066, 1, 0.9960784, 0, 1,
-0.9431196, 0.40665, -0.5007042, 0.9960784, 1, 0, 1,
-0.9392651, -0.4315663, -2.132677, 0.9921569, 1, 0, 1,
-0.9359857, 1.981747, 1.294819, 0.9843137, 1, 0, 1,
-0.9326895, 0.1164445, -1.679216, 0.9803922, 1, 0, 1,
-0.9297453, -1.872305, -2.166303, 0.972549, 1, 0, 1,
-0.9281793, -0.8244288, -2.251707, 0.9686275, 1, 0, 1,
-0.9224563, 0.3981152, -0.2433291, 0.9607843, 1, 0, 1,
-0.9137845, 1.129283, -0.4674274, 0.9568627, 1, 0, 1,
-0.9101511, -0.04393393, -2.21282, 0.9490196, 1, 0, 1,
-0.9080175, 2.844747, -0.2234279, 0.945098, 1, 0, 1,
-0.8877317, -0.7306495, -4.069088, 0.9372549, 1, 0, 1,
-0.8865315, 0.08046088, -0.4543694, 0.9333333, 1, 0, 1,
-0.886015, 1.1277, 0.05503577, 0.9254902, 1, 0, 1,
-0.8799336, -0.4921418, -3.635659, 0.9215686, 1, 0, 1,
-0.8765396, -0.2437989, -2.148858, 0.9137255, 1, 0, 1,
-0.8740368, 1.367316, 0.9295453, 0.9098039, 1, 0, 1,
-0.870423, -0.7479053, -2.752224, 0.9019608, 1, 0, 1,
-0.8701121, -0.7285489, -0.3156948, 0.8941177, 1, 0, 1,
-0.8677224, 1.45645, -0.9408436, 0.8901961, 1, 0, 1,
-0.8631589, 1.143806, -0.3007515, 0.8823529, 1, 0, 1,
-0.8630673, 0.866977, -1.171974, 0.8784314, 1, 0, 1,
-0.8615807, -0.6043687, -1.812948, 0.8705882, 1, 0, 1,
-0.8605506, -1.069344, -2.847029, 0.8666667, 1, 0, 1,
-0.858231, -0.7898612, -2.802057, 0.8588235, 1, 0, 1,
-0.852931, 0.6107741, -1.928898, 0.854902, 1, 0, 1,
-0.8496101, -0.4368047, -1.304023, 0.8470588, 1, 0, 1,
-0.8477578, -1.091118, -2.535426, 0.8431373, 1, 0, 1,
-0.8474987, 0.0351337, -1.413967, 0.8352941, 1, 0, 1,
-0.8389667, 0.2006686, -1.824451, 0.8313726, 1, 0, 1,
-0.8377381, -0.6186923, -3.709736, 0.8235294, 1, 0, 1,
-0.8301878, 0.3254707, -0.856186, 0.8196079, 1, 0, 1,
-0.8268551, -0.08266272, -3.390763, 0.8117647, 1, 0, 1,
-0.8259824, -0.4941413, -4.348607, 0.8078431, 1, 0, 1,
-0.8201168, 0.4923662, -2.109832, 0.8, 1, 0, 1,
-0.8171969, 0.4676729, -0.7836517, 0.7921569, 1, 0, 1,
-0.8129179, 1.282678, -1.069249, 0.7882353, 1, 0, 1,
-0.8117989, -1.246735, -2.545736, 0.7803922, 1, 0, 1,
-0.809903, -0.837055, -3.506689, 0.7764706, 1, 0, 1,
-0.8021184, 1.934768, -1.724382, 0.7686275, 1, 0, 1,
-0.794232, 0.01639134, 0.08482783, 0.7647059, 1, 0, 1,
-0.7841472, 1.071861, -1.032499, 0.7568628, 1, 0, 1,
-0.7824359, 0.10162, -1.243225, 0.7529412, 1, 0, 1,
-0.7755027, -1.071917, -1.4622, 0.7450981, 1, 0, 1,
-0.7677805, -1.208636, -2.759018, 0.7411765, 1, 0, 1,
-0.7587931, 0.4730474, -0.908703, 0.7333333, 1, 0, 1,
-0.7541226, 0.8252094, -0.6016639, 0.7294118, 1, 0, 1,
-0.7499382, -0.7909055, -1.987211, 0.7215686, 1, 0, 1,
-0.7482859, 0.1612078, -0.5952343, 0.7176471, 1, 0, 1,
-0.7465351, -0.255733, -1.254108, 0.7098039, 1, 0, 1,
-0.742302, -0.1424503, -1.515292, 0.7058824, 1, 0, 1,
-0.7408755, -0.5924629, -3.402778, 0.6980392, 1, 0, 1,
-0.7375723, 1.75009, -0.909431, 0.6901961, 1, 0, 1,
-0.7346509, -0.2728312, -2.284029, 0.6862745, 1, 0, 1,
-0.7312598, 0.7704268, -0.9984251, 0.6784314, 1, 0, 1,
-0.7245276, -1.215315, -2.264324, 0.6745098, 1, 0, 1,
-0.7230548, -0.1779179, -2.374922, 0.6666667, 1, 0, 1,
-0.7217671, 1.164069, -1.142598, 0.6627451, 1, 0, 1,
-0.7193132, -0.03204028, -1.687204, 0.654902, 1, 0, 1,
-0.7106219, 0.3411544, -0.8884521, 0.6509804, 1, 0, 1,
-0.70965, 1.845795, -0.9174089, 0.6431373, 1, 0, 1,
-0.7086155, -0.5216373, -1.08456, 0.6392157, 1, 0, 1,
-0.70508, 1.092141, 1.179233, 0.6313726, 1, 0, 1,
-0.703729, 0.505908, -0.9557639, 0.627451, 1, 0, 1,
-0.6990126, 1.074749, -0.5110078, 0.6196079, 1, 0, 1,
-0.6902254, 1.065774, -0.3098773, 0.6156863, 1, 0, 1,
-0.6866499, -0.08824661, -1.265636, 0.6078432, 1, 0, 1,
-0.6841109, 0.6590294, -0.5892251, 0.6039216, 1, 0, 1,
-0.682824, -2.159697, -2.57749, 0.5960785, 1, 0, 1,
-0.6826574, -0.8534318, -4.635833, 0.5882353, 1, 0, 1,
-0.6801252, -0.7786967, -2.102661, 0.5843138, 1, 0, 1,
-0.6727763, -0.5073304, 0.3053368, 0.5764706, 1, 0, 1,
-0.6661325, -2.221639, -3.975452, 0.572549, 1, 0, 1,
-0.665388, -0.4626728, -4.01422, 0.5647059, 1, 0, 1,
-0.6630757, -0.847055, -2.277107, 0.5607843, 1, 0, 1,
-0.6613963, -1.30478, -2.248791, 0.5529412, 1, 0, 1,
-0.6580088, 0.7953511, -1.237768, 0.5490196, 1, 0, 1,
-0.6557663, 1.510489, 0.2803699, 0.5411765, 1, 0, 1,
-0.6531802, -0.9786213, -1.663649, 0.5372549, 1, 0, 1,
-0.6530514, 0.2361613, -0.227595, 0.5294118, 1, 0, 1,
-0.6506979, -1.137005, -3.276083, 0.5254902, 1, 0, 1,
-0.6353235, 1.673185, -0.2778256, 0.5176471, 1, 0, 1,
-0.6338036, -1.013919, -3.264234, 0.5137255, 1, 0, 1,
-0.6335534, 0.6013128, -0.9104024, 0.5058824, 1, 0, 1,
-0.6322631, 0.3134292, 0.5328029, 0.5019608, 1, 0, 1,
-0.6316218, 0.559519, -1.93756, 0.4941176, 1, 0, 1,
-0.6315111, 0.7822672, -1.691095, 0.4862745, 1, 0, 1,
-0.6196638, 1.558036, -0.4337803, 0.4823529, 1, 0, 1,
-0.6154175, -0.630568, -2.057738, 0.4745098, 1, 0, 1,
-0.6130303, 0.695721, -0.6516297, 0.4705882, 1, 0, 1,
-0.6110212, 0.04531709, -2.022273, 0.4627451, 1, 0, 1,
-0.6098607, -0.8678811, -3.670333, 0.4588235, 1, 0, 1,
-0.605314, 0.2593244, -2.651502, 0.4509804, 1, 0, 1,
-0.6022263, -1.615248, -1.344858, 0.4470588, 1, 0, 1,
-0.5977935, 0.5949177, -3.33732, 0.4392157, 1, 0, 1,
-0.5941306, -0.8718758, -2.448009, 0.4352941, 1, 0, 1,
-0.5932633, 1.646686, -1.591973, 0.427451, 1, 0, 1,
-0.592343, 0.5345291, -0.4985776, 0.4235294, 1, 0, 1,
-0.589029, -1.28691, -2.446445, 0.4156863, 1, 0, 1,
-0.5887216, -0.9634305, -1.288709, 0.4117647, 1, 0, 1,
-0.5831004, 0.2463053, -1.862174, 0.4039216, 1, 0, 1,
-0.5821947, -0.996218, -3.416504, 0.3960784, 1, 0, 1,
-0.5810471, 0.01344377, -1.882485, 0.3921569, 1, 0, 1,
-0.5742678, -0.04165368, -1.488455, 0.3843137, 1, 0, 1,
-0.5719617, -0.7638353, -1.394493, 0.3803922, 1, 0, 1,
-0.5684808, -0.5624635, -2.914101, 0.372549, 1, 0, 1,
-0.5650355, -0.04756651, -1.954712, 0.3686275, 1, 0, 1,
-0.5578852, -0.6379111, -0.767206, 0.3607843, 1, 0, 1,
-0.5553644, -0.7486785, -3.304506, 0.3568628, 1, 0, 1,
-0.5482454, -0.6565441, -2.716981, 0.3490196, 1, 0, 1,
-0.5445923, -1.306459, -3.586725, 0.345098, 1, 0, 1,
-0.5334877, 1.552016, 1.327571, 0.3372549, 1, 0, 1,
-0.517032, -0.7695615, -1.30954, 0.3333333, 1, 0, 1,
-0.5153478, -0.315504, -3.910663, 0.3254902, 1, 0, 1,
-0.5129639, -0.08735825, -3.399831, 0.3215686, 1, 0, 1,
-0.5125121, 1.594028, 0.6959364, 0.3137255, 1, 0, 1,
-0.5094822, 0.2801829, 0.3003985, 0.3098039, 1, 0, 1,
-0.507886, 0.6621411, -2.052789, 0.3019608, 1, 0, 1,
-0.5064199, 0.8381306, -2.648547, 0.2941177, 1, 0, 1,
-0.505443, -1.707597, -4.434026, 0.2901961, 1, 0, 1,
-0.5054325, 1.080492, -0.7233974, 0.282353, 1, 0, 1,
-0.5051461, -0.6418914, -3.219167, 0.2784314, 1, 0, 1,
-0.5042347, -0.5618886, -0.9643942, 0.2705882, 1, 0, 1,
-0.5036187, -1.392083, -2.654527, 0.2666667, 1, 0, 1,
-0.4977869, -0.2546881, -0.9400628, 0.2588235, 1, 0, 1,
-0.497406, 0.8478678, -1.136102, 0.254902, 1, 0, 1,
-0.4966465, -0.1375122, 0.1931757, 0.2470588, 1, 0, 1,
-0.4952891, 0.07140381, -1.917618, 0.2431373, 1, 0, 1,
-0.494071, -0.9688905, -1.626346, 0.2352941, 1, 0, 1,
-0.4920957, 0.7824768, -1.057325, 0.2313726, 1, 0, 1,
-0.4896829, -1.107495, -3.076716, 0.2235294, 1, 0, 1,
-0.4880927, 0.3828503, -2.65084, 0.2196078, 1, 0, 1,
-0.488054, -0.6155285, -2.598905, 0.2117647, 1, 0, 1,
-0.4829863, -1.335009, -3.585345, 0.2078431, 1, 0, 1,
-0.4804355, -0.2573298, -1.224604, 0.2, 1, 0, 1,
-0.479219, -1.23019, -1.037916, 0.1921569, 1, 0, 1,
-0.4745067, -2.092934, -1.74802, 0.1882353, 1, 0, 1,
-0.4719029, -0.3197454, -2.239425, 0.1803922, 1, 0, 1,
-0.4653342, -1.198144, -1.928795, 0.1764706, 1, 0, 1,
-0.4648947, -0.05294562, -3.529795, 0.1686275, 1, 0, 1,
-0.4627426, 1.613083, -0.2438373, 0.1647059, 1, 0, 1,
-0.4581681, 0.0743961, -0.6526479, 0.1568628, 1, 0, 1,
-0.4573902, -0.2737751, -3.8717, 0.1529412, 1, 0, 1,
-0.4540366, -2.037529, -3.561074, 0.145098, 1, 0, 1,
-0.4539266, -0.4639684, -2.352143, 0.1411765, 1, 0, 1,
-0.4513996, -0.1851107, 0.2177277, 0.1333333, 1, 0, 1,
-0.4494489, 1.324911, -0.1497142, 0.1294118, 1, 0, 1,
-0.4482706, -0.2585262, -2.219029, 0.1215686, 1, 0, 1,
-0.4425092, 0.8155509, 0.01205765, 0.1176471, 1, 0, 1,
-0.4398312, 1.619051, 0.4043006, 0.1098039, 1, 0, 1,
-0.4379802, 1.736237, 0.2354892, 0.1058824, 1, 0, 1,
-0.4379302, 0.904385, -0.3537631, 0.09803922, 1, 0, 1,
-0.4374194, -2.356212, -3.732926, 0.09019608, 1, 0, 1,
-0.4338904, -0.2233076, -1.90462, 0.08627451, 1, 0, 1,
-0.4318771, -1.859518, -3.484972, 0.07843138, 1, 0, 1,
-0.4288326, 0.5835596, -1.628225, 0.07450981, 1, 0, 1,
-0.428179, 0.5105867, -0.2186382, 0.06666667, 1, 0, 1,
-0.4190962, 1.97734, -1.031309, 0.0627451, 1, 0, 1,
-0.4183336, -1.497741, -2.877019, 0.05490196, 1, 0, 1,
-0.4168465, -1.104614, -4.188763, 0.05098039, 1, 0, 1,
-0.4168176, -0.6805577, -2.863884, 0.04313726, 1, 0, 1,
-0.4118249, 0.2420843, -1.258485, 0.03921569, 1, 0, 1,
-0.4046402, 1.305022, 0.07040559, 0.03137255, 1, 0, 1,
-0.4035998, 0.1149197, -1.176727, 0.02745098, 1, 0, 1,
-0.4024423, 1.200415, 0.3931752, 0.01960784, 1, 0, 1,
-0.401581, 0.83531, 0.1033373, 0.01568628, 1, 0, 1,
-0.4010045, 0.384895, -0.5701911, 0.007843138, 1, 0, 1,
-0.4005977, -1.407088, -2.966114, 0.003921569, 1, 0, 1,
-0.3996131, -0.4856758, -1.93799, 0, 1, 0.003921569, 1,
-0.3896788, -0.3798375, -3.259333, 0, 1, 0.01176471, 1,
-0.3895767, -0.6713604, -1.955056, 0, 1, 0.01568628, 1,
-0.3862048, 1.185024, 1.692682, 0, 1, 0.02352941, 1,
-0.386041, -0.5717804, -1.933761, 0, 1, 0.02745098, 1,
-0.3840581, -0.5525818, -2.081982, 0, 1, 0.03529412, 1,
-0.382992, -0.858185, -1.781111, 0, 1, 0.03921569, 1,
-0.3808829, -0.5733168, -3.027214, 0, 1, 0.04705882, 1,
-0.3784396, 0.6243207, -1.764402, 0, 1, 0.05098039, 1,
-0.3781832, -1.530963, -2.256977, 0, 1, 0.05882353, 1,
-0.3773643, -1.103594, -2.41556, 0, 1, 0.0627451, 1,
-0.3734498, 2.832067, -0.7858908, 0, 1, 0.07058824, 1,
-0.3699928, -0.2002402, -2.425698, 0, 1, 0.07450981, 1,
-0.3695429, -0.4152414, -3.294923, 0, 1, 0.08235294, 1,
-0.3608293, 0.594833, 1.239322, 0, 1, 0.08627451, 1,
-0.3599374, -0.4268385, -2.740812, 0, 1, 0.09411765, 1,
-0.3569864, -0.2804163, -2.170172, 0, 1, 0.1019608, 1,
-0.3540606, 0.406175, -1.463625, 0, 1, 0.1058824, 1,
-0.352045, -1.154524, -3.491994, 0, 1, 0.1137255, 1,
-0.3511848, -0.5218412, -2.387994, 0, 1, 0.1176471, 1,
-0.3494631, -0.2787628, -0.5564294, 0, 1, 0.1254902, 1,
-0.3493191, 0.213133, -1.368007, 0, 1, 0.1294118, 1,
-0.3457215, -0.03476446, -3.376676, 0, 1, 0.1372549, 1,
-0.3448976, -2.165608, -2.236378, 0, 1, 0.1411765, 1,
-0.3423225, -1.265208, -3.148937, 0, 1, 0.1490196, 1,
-0.34044, 0.5921792, -1.280342, 0, 1, 0.1529412, 1,
-0.3401459, 2.626642, -0.1712126, 0, 1, 0.1607843, 1,
-0.3381275, -0.1830974, -2.576494, 0, 1, 0.1647059, 1,
-0.3362927, 0.7289459, 1.787964, 0, 1, 0.172549, 1,
-0.3334899, 0.8659242, 0.4050321, 0, 1, 0.1764706, 1,
-0.3319187, 1.30183, -1.634292, 0, 1, 0.1843137, 1,
-0.3294446, -0.3487873, -1.160531, 0, 1, 0.1882353, 1,
-0.3243911, -0.3808444, -1.598217, 0, 1, 0.1960784, 1,
-0.3236124, -1.907609, -1.071507, 0, 1, 0.2039216, 1,
-0.3218715, -0.6651096, -2.842267, 0, 1, 0.2078431, 1,
-0.3214068, 0.2649105, -0.9350759, 0, 1, 0.2156863, 1,
-0.3213294, -0.4519292, -1.657205, 0, 1, 0.2196078, 1,
-0.321144, 0.4602425, -0.1671529, 0, 1, 0.227451, 1,
-0.3204218, -0.03975805, -2.05655, 0, 1, 0.2313726, 1,
-0.3132914, -0.2377734, -0.878524, 0, 1, 0.2392157, 1,
-0.3122524, -1.338869, -2.064738, 0, 1, 0.2431373, 1,
-0.3093062, -0.2397249, -1.932506, 0, 1, 0.2509804, 1,
-0.3064687, -0.8170014, -2.026816, 0, 1, 0.254902, 1,
-0.2999039, 0.02529359, -2.964297, 0, 1, 0.2627451, 1,
-0.2998773, -0.1501072, -2.622162, 0, 1, 0.2666667, 1,
-0.2926694, -0.09959341, -0.5905194, 0, 1, 0.2745098, 1,
-0.290435, -0.2135265, -4.030639, 0, 1, 0.2784314, 1,
-0.2869389, 0.4161304, -1.319508, 0, 1, 0.2862745, 1,
-0.2806393, 0.6033894, -1.895977, 0, 1, 0.2901961, 1,
-0.2801765, 1.26631, 0.3330635, 0, 1, 0.2980392, 1,
-0.2768678, -0.9619161, -3.547426, 0, 1, 0.3058824, 1,
-0.2759607, 1.490009, -0.05087996, 0, 1, 0.3098039, 1,
-0.2714532, 0.1096014, -0.999262, 0, 1, 0.3176471, 1,
-0.2686526, -1.16243, -3.537655, 0, 1, 0.3215686, 1,
-0.2664961, -0.4449862, -4.675507, 0, 1, 0.3294118, 1,
-0.2609253, 0.3240916, -0.7727345, 0, 1, 0.3333333, 1,
-0.2573667, 0.3132268, -1.994163, 0, 1, 0.3411765, 1,
-0.2548653, -0.7630031, -1.390656, 0, 1, 0.345098, 1,
-0.2529274, -0.6421879, -2.973463, 0, 1, 0.3529412, 1,
-0.2477389, 0.6190786, 0.5754054, 0, 1, 0.3568628, 1,
-0.2422589, -0.6445486, -2.917934, 0, 1, 0.3647059, 1,
-0.2412844, -1.045535, -1.330388, 0, 1, 0.3686275, 1,
-0.2352515, -1.074297, -3.690029, 0, 1, 0.3764706, 1,
-0.2352227, 0.407768, -0.08394762, 0, 1, 0.3803922, 1,
-0.2291754, -1.118829, -4.396581, 0, 1, 0.3882353, 1,
-0.2218666, 0.6057511, 0.6472387, 0, 1, 0.3921569, 1,
-0.2199936, -0.02581926, -2.711063, 0, 1, 0.4, 1,
-0.2196456, 0.7237912, 2.532021, 0, 1, 0.4078431, 1,
-0.2186643, 0.7118607, -0.3467651, 0, 1, 0.4117647, 1,
-0.2177975, -0.8202149, -2.79555, 0, 1, 0.4196078, 1,
-0.2177665, 1.297879, 0.6695392, 0, 1, 0.4235294, 1,
-0.2153302, -1.224994, -3.661629, 0, 1, 0.4313726, 1,
-0.2149215, 0.5253028, -0.6566538, 0, 1, 0.4352941, 1,
-0.2143815, 1.115731, -1.251022, 0, 1, 0.4431373, 1,
-0.2112209, -1.03095, -2.261112, 0, 1, 0.4470588, 1,
-0.2108116, -0.7424591, -2.253783, 0, 1, 0.454902, 1,
-0.2101939, -1.654709, -2.783564, 0, 1, 0.4588235, 1,
-0.2096106, 0.07467828, -0.9052815, 0, 1, 0.4666667, 1,
-0.2077372, 0.2952015, -0.5114012, 0, 1, 0.4705882, 1,
-0.2068548, 0.8333859, 0.0110523, 0, 1, 0.4784314, 1,
-0.2056708, 0.3053539, 0.370758, 0, 1, 0.4823529, 1,
-0.2001233, 1.600921, -0.004312302, 0, 1, 0.4901961, 1,
-0.1932901, -0.5841575, -2.344603, 0, 1, 0.4941176, 1,
-0.1916706, 1.689955, 0.1364863, 0, 1, 0.5019608, 1,
-0.1915426, -2.577569, -3.41408, 0, 1, 0.509804, 1,
-0.1914346, -2.045119, -3.244207, 0, 1, 0.5137255, 1,
-0.187119, 1.702147, 1.860859, 0, 1, 0.5215687, 1,
-0.1862465, 0.8461394, -1.144423, 0, 1, 0.5254902, 1,
-0.16705, 0.1749617, -2.199487, 0, 1, 0.5333334, 1,
-0.1659517, -0.3138763, -3.541708, 0, 1, 0.5372549, 1,
-0.1652643, 0.6175911, 1.04561, 0, 1, 0.5450981, 1,
-0.1629576, 0.1453063, -0.5373258, 0, 1, 0.5490196, 1,
-0.1621135, -0.2426793, -3.95876, 0, 1, 0.5568628, 1,
-0.1603246, 0.3140152, -0.8025329, 0, 1, 0.5607843, 1,
-0.1535553, -0.4803555, -4.640118, 0, 1, 0.5686275, 1,
-0.1473373, 2.565148, -0.6332499, 0, 1, 0.572549, 1,
-0.1455501, 0.7683396, -0.4122359, 0, 1, 0.5803922, 1,
-0.1415158, -1.873304, -1.277342, 0, 1, 0.5843138, 1,
-0.1396929, -1.098531, -2.877433, 0, 1, 0.5921569, 1,
-0.1395464, 0.6214771, -0.06309551, 0, 1, 0.5960785, 1,
-0.1351172, -0.1955454, -1.373874, 0, 1, 0.6039216, 1,
-0.1332907, 0.136173, -1.528255, 0, 1, 0.6117647, 1,
-0.129916, 0.1921749, 0.6078818, 0, 1, 0.6156863, 1,
-0.1263535, 0.8617152, 0.9087594, 0, 1, 0.6235294, 1,
-0.1254251, 0.9163535, -0.3932866, 0, 1, 0.627451, 1,
-0.1181879, 1.178287, 0.2373351, 0, 1, 0.6352941, 1,
-0.1177044, 1.613419, 1.890994, 0, 1, 0.6392157, 1,
-0.1151674, -0.009702856, -1.298661, 0, 1, 0.6470588, 1,
-0.1126291, 0.08923243, -1.191908, 0, 1, 0.6509804, 1,
-0.1122251, 0.1884804, 0.7173106, 0, 1, 0.6588235, 1,
-0.108465, 0.4415179, 0.7638881, 0, 1, 0.6627451, 1,
-0.1072912, -1.114536, -4.15625, 0, 1, 0.6705883, 1,
-0.1068985, 0.303711, -1.953092, 0, 1, 0.6745098, 1,
-0.106566, 1.3854, -1.105417, 0, 1, 0.682353, 1,
-0.1061448, 0.2989745, -0.6920274, 0, 1, 0.6862745, 1,
-0.1003961, -0.8655726, -4.732717, 0, 1, 0.6941177, 1,
-0.1002068, 0.0978619, -2.003063, 0, 1, 0.7019608, 1,
-0.09974569, 1.196768, -1.164864, 0, 1, 0.7058824, 1,
-0.0968741, -0.01463501, 0.2520562, 0, 1, 0.7137255, 1,
-0.09635921, 0.4065399, 1.855676, 0, 1, 0.7176471, 1,
-0.09443055, -0.3360933, -3.111827, 0, 1, 0.7254902, 1,
-0.09299129, -0.5016096, -1.645217, 0, 1, 0.7294118, 1,
-0.08818149, 0.2261168, 0.08754364, 0, 1, 0.7372549, 1,
-0.08736475, 0.3006166, -0.550567, 0, 1, 0.7411765, 1,
-0.08544348, -1.029045, -3.436244, 0, 1, 0.7490196, 1,
-0.08405694, 0.01831788, -1.597848, 0, 1, 0.7529412, 1,
-0.07206008, -1.820604, -2.641703, 0, 1, 0.7607843, 1,
-0.07156102, 0.4813277, -0.4547036, 0, 1, 0.7647059, 1,
-0.07135218, -1.618876, -4.374343, 0, 1, 0.772549, 1,
-0.07074699, -1.559616, -3.595664, 0, 1, 0.7764706, 1,
-0.0696343, -0.2007494, -1.149612, 0, 1, 0.7843137, 1,
-0.06335226, -0.6765128, -3.247789, 0, 1, 0.7882353, 1,
-0.06058305, 1.714953, -0.1723658, 0, 1, 0.7960784, 1,
-0.06050719, 0.8501381, 0.2773088, 0, 1, 0.8039216, 1,
-0.0579758, -0.8541089, -3.579937, 0, 1, 0.8078431, 1,
-0.05714259, -1.146099, -2.643373, 0, 1, 0.8156863, 1,
-0.04544652, -0.4078102, -3.820407, 0, 1, 0.8196079, 1,
-0.04303472, 0.01550731, -1.668556, 0, 1, 0.827451, 1,
-0.04243056, -0.2482716, -2.501753, 0, 1, 0.8313726, 1,
-0.04206391, 0.7643187, -0.2840014, 0, 1, 0.8392157, 1,
-0.04107902, 0.4722604, -1.551117, 0, 1, 0.8431373, 1,
-0.0354204, -0.3337556, -2.26872, 0, 1, 0.8509804, 1,
-0.03512149, 0.3973925, 0.1143291, 0, 1, 0.854902, 1,
-0.03450219, 0.1859423, 0.5697896, 0, 1, 0.8627451, 1,
-0.03324175, 1.04145, -2.038281, 0, 1, 0.8666667, 1,
-0.0319012, 0.03687704, -1.72931, 0, 1, 0.8745098, 1,
-0.03050607, 0.2269505, -1.409924, 0, 1, 0.8784314, 1,
-0.0298845, 1.178897, -0.1213265, 0, 1, 0.8862745, 1,
-0.02787233, 0.02423375, 0.03737873, 0, 1, 0.8901961, 1,
-0.02628596, -0.1983563, -1.938456, 0, 1, 0.8980392, 1,
-0.02181618, -0.4822628, -1.507364, 0, 1, 0.9058824, 1,
-0.01820354, -0.5714763, -3.969686, 0, 1, 0.9098039, 1,
-0.01502471, -0.3866341, -2.348096, 0, 1, 0.9176471, 1,
-0.01480778, -0.2065822, -3.402805, 0, 1, 0.9215686, 1,
-0.01427334, -0.2815087, -2.192888, 0, 1, 0.9294118, 1,
-0.01198686, 0.2544914, -1.308661, 0, 1, 0.9333333, 1,
-0.01166398, -0.7859399, -4.456925, 0, 1, 0.9411765, 1,
-0.006987309, -1.029839, -4.287265, 0, 1, 0.945098, 1,
-0.006648706, -1.196543, -3.066815, 0, 1, 0.9529412, 1,
-0.006579357, 0.4326527, 0.7717131, 0, 1, 0.9568627, 1,
-8.068794e-05, 0.01079297, -1.328922, 0, 1, 0.9647059, 1,
0.001697495, -0.3330413, 4.263722, 0, 1, 0.9686275, 1,
0.003530385, -0.8301696, 2.179455, 0, 1, 0.9764706, 1,
0.005136165, -0.2414936, 1.806867, 0, 1, 0.9803922, 1,
0.006766197, -1.54058, 2.432892, 0, 1, 0.9882353, 1,
0.01115358, 0.8491105, 0.1212607, 0, 1, 0.9921569, 1,
0.01505894, 0.3301257, -2.372091, 0, 1, 1, 1,
0.01903559, -0.2899805, 3.412866, 0, 0.9921569, 1, 1,
0.01968085, -0.07136726, 2.619977, 0, 0.9882353, 1, 1,
0.02007738, 0.885885, -0.9612616, 0, 0.9803922, 1, 1,
0.02385464, 1.244778, -2.337939, 0, 0.9764706, 1, 1,
0.02423228, -0.06745805, 1.246923, 0, 0.9686275, 1, 1,
0.0298638, -0.5694403, 5.167204, 0, 0.9647059, 1, 1,
0.03123278, -1.133692, 1.737336, 0, 0.9568627, 1, 1,
0.03289255, -1.260307, 3.165966, 0, 0.9529412, 1, 1,
0.03346496, 0.5462261, 0.8734857, 0, 0.945098, 1, 1,
0.03624547, -1.211152, 1.142924, 0, 0.9411765, 1, 1,
0.03793009, -0.2254073, 2.759672, 0, 0.9333333, 1, 1,
0.03890163, -0.3508399, 2.309741, 0, 0.9294118, 1, 1,
0.04124966, 1.59809, 0.1406244, 0, 0.9215686, 1, 1,
0.04301993, -1.662102, 1.718515, 0, 0.9176471, 1, 1,
0.04700755, 2.207614, -1.243651, 0, 0.9098039, 1, 1,
0.05232745, 1.406807, 0.3316226, 0, 0.9058824, 1, 1,
0.0525502, -2.055179, 3.051846, 0, 0.8980392, 1, 1,
0.05366562, 1.492846, 0.4531392, 0, 0.8901961, 1, 1,
0.0545857, 2.993884, -0.8842769, 0, 0.8862745, 1, 1,
0.05872626, 0.3704241, 0.4393596, 0, 0.8784314, 1, 1,
0.06153242, -0.6371174, 2.999463, 0, 0.8745098, 1, 1,
0.06304396, 0.08600846, 0.6574781, 0, 0.8666667, 1, 1,
0.06729834, -1.2932, 4.33374, 0, 0.8627451, 1, 1,
0.06789146, -0.8331973, 3.056185, 0, 0.854902, 1, 1,
0.0698567, 1.343232, -1.242577, 0, 0.8509804, 1, 1,
0.07080774, -0.3379662, 3.683465, 0, 0.8431373, 1, 1,
0.07791496, 0.01620229, 1.209483, 0, 0.8392157, 1, 1,
0.0791536, 1.260523, 0.7657541, 0, 0.8313726, 1, 1,
0.08085313, -2.033279, 2.756308, 0, 0.827451, 1, 1,
0.08176028, -1.657226, 3.742289, 0, 0.8196079, 1, 1,
0.0847026, -0.6798918, 3.735333, 0, 0.8156863, 1, 1,
0.08684736, 0.4909207, 0.039629, 0, 0.8078431, 1, 1,
0.08872203, -0.9004052, 2.653052, 0, 0.8039216, 1, 1,
0.09208585, -0.9507697, 5.047429, 0, 0.7960784, 1, 1,
0.09261969, -1.264423, 3.746135, 0, 0.7882353, 1, 1,
0.09562206, -1.725493, 3.489087, 0, 0.7843137, 1, 1,
0.09915762, 1.167932, 1.186269, 0, 0.7764706, 1, 1,
0.1032392, -0.6197222, 2.162643, 0, 0.772549, 1, 1,
0.1078402, 0.5855207, 0.9184071, 0, 0.7647059, 1, 1,
0.115869, -0.5372565, 3.176907, 0, 0.7607843, 1, 1,
0.1159756, 0.4977238, 1.219068, 0, 0.7529412, 1, 1,
0.1161991, 0.1524653, 1.104068, 0, 0.7490196, 1, 1,
0.1188892, 1.112534, -0.02984614, 0, 0.7411765, 1, 1,
0.1272812, -1.293541, 3.056778, 0, 0.7372549, 1, 1,
0.1310665, 1.278277, 1.334648, 0, 0.7294118, 1, 1,
0.1314101, -0.2310784, 2.432522, 0, 0.7254902, 1, 1,
0.1329095, 0.1515585, 0.2479331, 0, 0.7176471, 1, 1,
0.1376884, 0.6010585, 0.1519908, 0, 0.7137255, 1, 1,
0.1402846, 0.3637225, -0.2880375, 0, 0.7058824, 1, 1,
0.1432249, -0.1363641, 2.138417, 0, 0.6980392, 1, 1,
0.1469969, 0.9589678, -0.1283226, 0, 0.6941177, 1, 1,
0.1531037, 0.1806591, 0.3414517, 0, 0.6862745, 1, 1,
0.1571407, -0.7552, 2.331695, 0, 0.682353, 1, 1,
0.1579614, 0.4357851, 0.4548731, 0, 0.6745098, 1, 1,
0.1593673, 0.3002726, 1.514565, 0, 0.6705883, 1, 1,
0.1620899, -1.03864, 2.612193, 0, 0.6627451, 1, 1,
0.1626209, 0.8830679, -0.03446632, 0, 0.6588235, 1, 1,
0.1672275, -0.4544487, 3.06533, 0, 0.6509804, 1, 1,
0.1673454, 0.7798231, -0.673379, 0, 0.6470588, 1, 1,
0.1677021, 0.2469948, 0.7162168, 0, 0.6392157, 1, 1,
0.175346, -2.03196, 3.368312, 0, 0.6352941, 1, 1,
0.1769759, -0.8751779, 1.685517, 0, 0.627451, 1, 1,
0.1810406, 0.5315996, 0.539939, 0, 0.6235294, 1, 1,
0.1834263, -0.6553704, 3.19801, 0, 0.6156863, 1, 1,
0.1835962, -3.270965, 1.36649, 0, 0.6117647, 1, 1,
0.187143, -0.3771483, 1.763491, 0, 0.6039216, 1, 1,
0.1882747, -0.5247289, 3.805329, 0, 0.5960785, 1, 1,
0.1893497, -0.8445488, 2.50545, 0, 0.5921569, 1, 1,
0.1915111, 1.690081, 2.054235, 0, 0.5843138, 1, 1,
0.1932282, -0.2015563, 2.626501, 0, 0.5803922, 1, 1,
0.194206, -0.2661991, 3.485139, 0, 0.572549, 1, 1,
0.1963197, -0.2818513, 1.689896, 0, 0.5686275, 1, 1,
0.2000951, -1.383931, 2.868172, 0, 0.5607843, 1, 1,
0.201653, -0.4614069, 2.354214, 0, 0.5568628, 1, 1,
0.2077402, -0.1806221, 3.785447, 0, 0.5490196, 1, 1,
0.2079267, -1.680148, 3.055699, 0, 0.5450981, 1, 1,
0.2082445, 0.8879116, -0.9467926, 0, 0.5372549, 1, 1,
0.2121494, -0.5345727, 3.727083, 0, 0.5333334, 1, 1,
0.2128272, -0.1931283, 2.572596, 0, 0.5254902, 1, 1,
0.2131949, -0.3339126, 3.260269, 0, 0.5215687, 1, 1,
0.2133396, -0.5327773, 2.163538, 0, 0.5137255, 1, 1,
0.2141457, -0.4547491, 3.019866, 0, 0.509804, 1, 1,
0.215977, -0.664665, 2.538752, 0, 0.5019608, 1, 1,
0.2174074, -0.02748661, 2.27326, 0, 0.4941176, 1, 1,
0.2190969, -0.3710892, 2.212064, 0, 0.4901961, 1, 1,
0.2202245, -0.2984899, 3.529929, 0, 0.4823529, 1, 1,
0.2211785, 0.6498277, 0.9044882, 0, 0.4784314, 1, 1,
0.2222648, 1.697924, -0.2926797, 0, 0.4705882, 1, 1,
0.2247113, 0.06681708, 2.3652, 0, 0.4666667, 1, 1,
0.2265917, -0.9577565, 2.116246, 0, 0.4588235, 1, 1,
0.2282314, -0.8158342, 2.143149, 0, 0.454902, 1, 1,
0.2303748, 1.281589, -0.0003735149, 0, 0.4470588, 1, 1,
0.2313426, -0.9515428, 1.384131, 0, 0.4431373, 1, 1,
0.2317648, -0.6799251, 1.840122, 0, 0.4352941, 1, 1,
0.2364749, -2.364115, 2.73054, 0, 0.4313726, 1, 1,
0.2392001, 0.6211136, -0.4899323, 0, 0.4235294, 1, 1,
0.2392152, -0.5904062, 3.463127, 0, 0.4196078, 1, 1,
0.2409637, 0.03097306, 1.280364, 0, 0.4117647, 1, 1,
0.2442787, -1.531273, 3.630753, 0, 0.4078431, 1, 1,
0.2451973, 0.3115589, 1.311737, 0, 0.4, 1, 1,
0.2526576, 0.5632914, 0.4847403, 0, 0.3921569, 1, 1,
0.2531196, 1.444037, -1.272643, 0, 0.3882353, 1, 1,
0.260096, 0.4959707, 0.4608257, 0, 0.3803922, 1, 1,
0.2614214, -0.9442907, 1.068835, 0, 0.3764706, 1, 1,
0.2630976, -0.6736713, 2.805508, 0, 0.3686275, 1, 1,
0.2673772, -0.6418617, 3.661098, 0, 0.3647059, 1, 1,
0.2697527, -0.7110458, 2.036501, 0, 0.3568628, 1, 1,
0.2709299, -0.6881472, 4.546073, 0, 0.3529412, 1, 1,
0.2771103, 1.019493, -0.4222178, 0, 0.345098, 1, 1,
0.2892143, 0.8512924, 0.09170122, 0, 0.3411765, 1, 1,
0.2952443, 0.380627, -0.2283843, 0, 0.3333333, 1, 1,
0.2953166, -0.3628517, 3.342583, 0, 0.3294118, 1, 1,
0.2995603, -0.7842211, 2.096028, 0, 0.3215686, 1, 1,
0.3001045, -0.2109437, 2.778144, 0, 0.3176471, 1, 1,
0.30612, 0.6834683, -0.4963326, 0, 0.3098039, 1, 1,
0.3069023, 0.8961131, 0.7941171, 0, 0.3058824, 1, 1,
0.3123703, 1.545487, -1.49425, 0, 0.2980392, 1, 1,
0.3131543, -1.010764, 3.175183, 0, 0.2901961, 1, 1,
0.3134699, 0.1208372, 1.364324, 0, 0.2862745, 1, 1,
0.3134989, 2.184163, -1.024525, 0, 0.2784314, 1, 1,
0.3183192, -0.3996445, 2.525959, 0, 0.2745098, 1, 1,
0.3184073, 1.043145, -0.1400426, 0, 0.2666667, 1, 1,
0.3196736, -1.748753, -0.4924792, 0, 0.2627451, 1, 1,
0.3199028, 1.319878, -0.01823416, 0, 0.254902, 1, 1,
0.3210008, -1.644494, 3.158846, 0, 0.2509804, 1, 1,
0.3215409, 0.6524165, 2.305393, 0, 0.2431373, 1, 1,
0.3278616, 0.5847106, 1.956562, 0, 0.2392157, 1, 1,
0.3294486, -0.5827488, 2.020454, 0, 0.2313726, 1, 1,
0.3373779, 1.830941, -0.7463476, 0, 0.227451, 1, 1,
0.339171, 0.3852272, 2.414769, 0, 0.2196078, 1, 1,
0.3444981, 0.9863791, 1.452571, 0, 0.2156863, 1, 1,
0.3448714, 0.02784166, 1.390112, 0, 0.2078431, 1, 1,
0.3454494, -2.266601, 2.763438, 0, 0.2039216, 1, 1,
0.3461483, 0.04841502, 3.020078, 0, 0.1960784, 1, 1,
0.3472435, -0.7840781, 4.20314, 0, 0.1882353, 1, 1,
0.3475027, 0.9970811, -0.3473001, 0, 0.1843137, 1, 1,
0.3634182, 0.1219201, 0.7557459, 0, 0.1764706, 1, 1,
0.3702673, 0.08751447, 1.029937, 0, 0.172549, 1, 1,
0.3718912, -1.271868, 4.574034, 0, 0.1647059, 1, 1,
0.3719353, 0.5011616, 0.6507524, 0, 0.1607843, 1, 1,
0.3738671, 0.1234449, 3.167271, 0, 0.1529412, 1, 1,
0.3741194, 0.5068724, 0.7328736, 0, 0.1490196, 1, 1,
0.3806622, -1.271929, 2.080478, 0, 0.1411765, 1, 1,
0.3815564, 0.184683, 1.940267, 0, 0.1372549, 1, 1,
0.381619, 0.1888254, 0.7467032, 0, 0.1294118, 1, 1,
0.3851151, -1.833862, 2.578401, 0, 0.1254902, 1, 1,
0.3852951, 0.9357571, -0.5655593, 0, 0.1176471, 1, 1,
0.3966559, 1.06357, 0.310246, 0, 0.1137255, 1, 1,
0.3970212, 0.2340128, 0.3378287, 0, 0.1058824, 1, 1,
0.3972068, -1.193087, 2.861413, 0, 0.09803922, 1, 1,
0.3988788, 0.09995382, 0.1833003, 0, 0.09411765, 1, 1,
0.4032644, -1.458823, 3.485247, 0, 0.08627451, 1, 1,
0.4034041, 0.8056881, 1.747939, 0, 0.08235294, 1, 1,
0.403441, 2.723147, 0.6875761, 0, 0.07450981, 1, 1,
0.4062253, -0.2709564, 2.58962, 0, 0.07058824, 1, 1,
0.4065883, 1.231959, -0.06553368, 0, 0.0627451, 1, 1,
0.4068323, 0.003462105, 1.389322, 0, 0.05882353, 1, 1,
0.4068866, 0.3858245, 1.778644, 0, 0.05098039, 1, 1,
0.4077256, 1.033313, 0.8191136, 0, 0.04705882, 1, 1,
0.4079931, -0.6127305, 4.045641, 0, 0.03921569, 1, 1,
0.411433, -0.07353409, 2.127989, 0, 0.03529412, 1, 1,
0.415551, 0.4582466, 0.02767222, 0, 0.02745098, 1, 1,
0.4214827, 0.3519346, -0.5328369, 0, 0.02352941, 1, 1,
0.4221258, 0.8085521, -1.777906, 0, 0.01568628, 1, 1,
0.4228381, -1.16088, 3.606278, 0, 0.01176471, 1, 1,
0.4229105, 0.1258623, 2.729851, 0, 0.003921569, 1, 1,
0.4295484, -1.254275, 2.130525, 0.003921569, 0, 1, 1,
0.4415635, -0.5101938, 4.477977, 0.007843138, 0, 1, 1,
0.4430507, -0.2123403, 4.414923, 0.01568628, 0, 1, 1,
0.4486111, -1.957788, 4.153569, 0.01960784, 0, 1, 1,
0.4497301, 0.02605164, 2.208978, 0.02745098, 0, 1, 1,
0.449734, -0.6438054, 3.188088, 0.03137255, 0, 1, 1,
0.4537707, -0.3409044, 1.882418, 0.03921569, 0, 1, 1,
0.4566242, 0.6960382, 0.379299, 0.04313726, 0, 1, 1,
0.4578817, 0.8313775, -0.8635871, 0.05098039, 0, 1, 1,
0.4607781, 1.622591, 0.5292253, 0.05490196, 0, 1, 1,
0.4623039, 0.6577898, 0.3662274, 0.0627451, 0, 1, 1,
0.4639503, 0.8123167, 0.06671651, 0.06666667, 0, 1, 1,
0.4655835, -1.177, 1.292577, 0.07450981, 0, 1, 1,
0.4668337, -0.01062729, 2.033195, 0.07843138, 0, 1, 1,
0.468, -0.09414269, 1.135107, 0.08627451, 0, 1, 1,
0.477689, 1.063884, 1.468546, 0.09019608, 0, 1, 1,
0.481966, 0.1316436, 2.436436, 0.09803922, 0, 1, 1,
0.4858822, 0.2520153, -0.639217, 0.1058824, 0, 1, 1,
0.4881423, 0.7003608, 1.967577, 0.1098039, 0, 1, 1,
0.4901537, -0.8650511, 2.035105, 0.1176471, 0, 1, 1,
0.4926809, -0.157774, 2.050863, 0.1215686, 0, 1, 1,
0.4927426, 1.189395, -0.1350049, 0.1294118, 0, 1, 1,
0.4933568, 1.266935, 0.960214, 0.1333333, 0, 1, 1,
0.4963224, -2.144231, 3.223866, 0.1411765, 0, 1, 1,
0.5002429, -0.09001192, 2.859089, 0.145098, 0, 1, 1,
0.5003656, -1.882137, 4.000806, 0.1529412, 0, 1, 1,
0.5048864, -0.1476482, 0.8329625, 0.1568628, 0, 1, 1,
0.5077454, -0.05202788, 1.718114, 0.1647059, 0, 1, 1,
0.5092846, 0.6790012, 0.5496485, 0.1686275, 0, 1, 1,
0.5178478, 0.3875951, 1.156976, 0.1764706, 0, 1, 1,
0.5179515, -1.104976, 3.049207, 0.1803922, 0, 1, 1,
0.5197834, -0.5098141, 2.778476, 0.1882353, 0, 1, 1,
0.5222132, -0.6102879, 2.620307, 0.1921569, 0, 1, 1,
0.522527, 0.9113084, -0.6724705, 0.2, 0, 1, 1,
0.5225882, 0.4313797, 1.090236, 0.2078431, 0, 1, 1,
0.5235943, 0.9575767, 0.7640364, 0.2117647, 0, 1, 1,
0.5254682, 0.4962625, 0.4806601, 0.2196078, 0, 1, 1,
0.5266593, 0.2467182, 2.170909, 0.2235294, 0, 1, 1,
0.52836, 0.5157387, 0.06022161, 0.2313726, 0, 1, 1,
0.5299153, 0.4967023, 1.45569, 0.2352941, 0, 1, 1,
0.5358167, 1.228744, 0.3226031, 0.2431373, 0, 1, 1,
0.5375534, -0.2227535, 3.20563, 0.2470588, 0, 1, 1,
0.5416492, 0.6431582, 1.006566, 0.254902, 0, 1, 1,
0.5431201, -0.5975738, 3.568193, 0.2588235, 0, 1, 1,
0.5480118, -0.3174813, 0.1120625, 0.2666667, 0, 1, 1,
0.5526152, 0.6908358, 0.6677295, 0.2705882, 0, 1, 1,
0.5599613, -0.7985234, 2.06637, 0.2784314, 0, 1, 1,
0.5612484, 0.2541951, 1.542539, 0.282353, 0, 1, 1,
0.5646813, -1.011568, 3.57254, 0.2901961, 0, 1, 1,
0.5655655, 0.4391704, 0.5970004, 0.2941177, 0, 1, 1,
0.5716866, 0.2836791, 1.648495, 0.3019608, 0, 1, 1,
0.5738173, 1.792653, -0.7041293, 0.3098039, 0, 1, 1,
0.5743859, -2.168299, 2.579587, 0.3137255, 0, 1, 1,
0.5752298, 0.5909569, 0.8583854, 0.3215686, 0, 1, 1,
0.5929603, -1.085519, 2.47101, 0.3254902, 0, 1, 1,
0.5960882, 0.9983633, 0.7678868, 0.3333333, 0, 1, 1,
0.5971783, -1.189345, 3.450799, 0.3372549, 0, 1, 1,
0.5978057, -0.06436919, 2.187279, 0.345098, 0, 1, 1,
0.603947, 1.624904, 2.838995, 0.3490196, 0, 1, 1,
0.6047395, -0.483826, 1.877759, 0.3568628, 0, 1, 1,
0.6106387, 1.271068, -0.4958242, 0.3607843, 0, 1, 1,
0.6113107, -0.1171081, 1.336867, 0.3686275, 0, 1, 1,
0.6131455, -0.6976783, 2.669183, 0.372549, 0, 1, 1,
0.6155244, -1.179459, 1.337508, 0.3803922, 0, 1, 1,
0.617555, 0.1642269, 0.4439597, 0.3843137, 0, 1, 1,
0.6198362, -0.0663205, 0.7375651, 0.3921569, 0, 1, 1,
0.6205133, -2.020406, 3.679668, 0.3960784, 0, 1, 1,
0.634055, 0.4635843, 1.350274, 0.4039216, 0, 1, 1,
0.6353917, 0.379963, 2.706711, 0.4117647, 0, 1, 1,
0.6406904, -0.4496745, 1.195756, 0.4156863, 0, 1, 1,
0.6408144, -0.4270604, 1.865712, 0.4235294, 0, 1, 1,
0.6481578, 1.428094, 1.661131, 0.427451, 0, 1, 1,
0.64921, -0.6458229, 2.231158, 0.4352941, 0, 1, 1,
0.6507608, 0.2640584, 1.250872, 0.4392157, 0, 1, 1,
0.6514189, -0.3121948, 2.079133, 0.4470588, 0, 1, 1,
0.6534952, -0.3846231, 3.132523, 0.4509804, 0, 1, 1,
0.6570483, 1.707745, 0.2945457, 0.4588235, 0, 1, 1,
0.6639811, 0.1092928, 1.550286, 0.4627451, 0, 1, 1,
0.6642228, -1.255921, 3.417501, 0.4705882, 0, 1, 1,
0.6669447, -0.05400063, 1.535586, 0.4745098, 0, 1, 1,
0.6681574, 0.3259549, 0.4885572, 0.4823529, 0, 1, 1,
0.6703796, 0.1582369, 1.269815, 0.4862745, 0, 1, 1,
0.6722023, 1.062038, -0.04950919, 0.4941176, 0, 1, 1,
0.6756223, -0.2505685, 3.160107, 0.5019608, 0, 1, 1,
0.6767215, -0.8816494, 1.092835, 0.5058824, 0, 1, 1,
0.6816252, -0.2917761, -0.3115067, 0.5137255, 0, 1, 1,
0.6843502, -1.567388, 1.80145, 0.5176471, 0, 1, 1,
0.6892014, 2.01138, 0.03252687, 0.5254902, 0, 1, 1,
0.6902196, -0.5225406, 3.10946, 0.5294118, 0, 1, 1,
0.6904855, -0.2040744, 1.581904, 0.5372549, 0, 1, 1,
0.6919809, 0.935082, 0.6268174, 0.5411765, 0, 1, 1,
0.6992588, -0.4397789, 2.729499, 0.5490196, 0, 1, 1,
0.7025015, -0.2084089, 0.6996852, 0.5529412, 0, 1, 1,
0.7074921, -0.1409785, 1.956772, 0.5607843, 0, 1, 1,
0.7105205, 1.001027, 0.4127075, 0.5647059, 0, 1, 1,
0.7130842, 1.350575, 2.593131, 0.572549, 0, 1, 1,
0.721282, 0.5579565, 0.1186576, 0.5764706, 0, 1, 1,
0.7245265, 1.52315, -0.6923921, 0.5843138, 0, 1, 1,
0.7271937, 0.1903613, 2.604645, 0.5882353, 0, 1, 1,
0.7302304, 0.01857693, 2.400896, 0.5960785, 0, 1, 1,
0.7341204, 1.178935, 1.091438, 0.6039216, 0, 1, 1,
0.7378092, -3.038246, 4.970315, 0.6078432, 0, 1, 1,
0.746546, -0.09106494, 1.264452, 0.6156863, 0, 1, 1,
0.7592873, 0.5112743, -0.2259891, 0.6196079, 0, 1, 1,
0.7621475, -0.0691157, 2.299948, 0.627451, 0, 1, 1,
0.7627776, 0.237101, 1.481618, 0.6313726, 0, 1, 1,
0.7641729, -1.995356, 3.8499, 0.6392157, 0, 1, 1,
0.764419, -1.57042, 2.537161, 0.6431373, 0, 1, 1,
0.7698299, -0.8792926, 3.275201, 0.6509804, 0, 1, 1,
0.7782727, 0.2600043, 1.443825, 0.654902, 0, 1, 1,
0.7836364, -0.1448793, 1.376675, 0.6627451, 0, 1, 1,
0.786117, -1.61658, 0.9738699, 0.6666667, 0, 1, 1,
0.7861905, -1.27443, 2.547211, 0.6745098, 0, 1, 1,
0.7924324, -0.6720099, 3.075448, 0.6784314, 0, 1, 1,
0.7931796, 0.3134635, 1.769926, 0.6862745, 0, 1, 1,
0.7943757, 0.4543509, 0.01845283, 0.6901961, 0, 1, 1,
0.7956287, -1.008044, 3.614544, 0.6980392, 0, 1, 1,
0.7995942, -0.778707, 2.484112, 0.7058824, 0, 1, 1,
0.8009767, -0.1488122, 0.3675721, 0.7098039, 0, 1, 1,
0.8021, 0.8809242, -0.2717808, 0.7176471, 0, 1, 1,
0.8029269, 0.01680985, 0.8491763, 0.7215686, 0, 1, 1,
0.8098528, -0.1885198, 0.8891958, 0.7294118, 0, 1, 1,
0.811107, 1.623533, 0.1806798, 0.7333333, 0, 1, 1,
0.8112261, 0.6500917, 0.09214569, 0.7411765, 0, 1, 1,
0.8113329, -0.4196373, 2.956571, 0.7450981, 0, 1, 1,
0.8126414, 0.7483748, 0.5020975, 0.7529412, 0, 1, 1,
0.8172142, 0.9561386, 1.684114, 0.7568628, 0, 1, 1,
0.818476, -0.4821257, 1.387043, 0.7647059, 0, 1, 1,
0.8208132, 0.7683951, 0.6367908, 0.7686275, 0, 1, 1,
0.8240039, -0.3039213, 0.4486287, 0.7764706, 0, 1, 1,
0.8241658, 0.6192613, 2.01863, 0.7803922, 0, 1, 1,
0.8252023, -2.141606, 3.745521, 0.7882353, 0, 1, 1,
0.8339791, -1.902566, 3.636981, 0.7921569, 0, 1, 1,
0.838587, -0.578666, 2.890177, 0.8, 0, 1, 1,
0.8474505, -1.540456, 3.38193, 0.8078431, 0, 1, 1,
0.8490474, -0.2265954, 1.982429, 0.8117647, 0, 1, 1,
0.8510569, -1.631693, 3.891486, 0.8196079, 0, 1, 1,
0.8518918, 1.574453, 0.3855672, 0.8235294, 0, 1, 1,
0.8533553, 1.387523, -0.7412363, 0.8313726, 0, 1, 1,
0.8542995, 1.295114, 0.4334776, 0.8352941, 0, 1, 1,
0.8628744, 0.9747648, -0.3023436, 0.8431373, 0, 1, 1,
0.862875, 1.03449, 1.841034, 0.8470588, 0, 1, 1,
0.8654473, 1.828984, 1.339729, 0.854902, 0, 1, 1,
0.868931, -1.287426, 2.01714, 0.8588235, 0, 1, 1,
0.8706411, -1.055513, 3.478839, 0.8666667, 0, 1, 1,
0.8751354, 0.83768, -0.4340078, 0.8705882, 0, 1, 1,
0.8827696, 0.8337234, 0.9363662, 0.8784314, 0, 1, 1,
0.8829948, -1.318413, 1.563891, 0.8823529, 0, 1, 1,
0.8836485, -0.8043855, 1.072597, 0.8901961, 0, 1, 1,
0.896345, -0.9746162, 2.223539, 0.8941177, 0, 1, 1,
0.89693, -0.5103916, 1.402678, 0.9019608, 0, 1, 1,
0.9017529, -0.3047269, 1.991435, 0.9098039, 0, 1, 1,
0.9023092, 0.1436033, 0.330135, 0.9137255, 0, 1, 1,
0.9052766, -0.2387244, 1.267547, 0.9215686, 0, 1, 1,
0.9203192, -0.9828113, 2.144757, 0.9254902, 0, 1, 1,
0.9208571, 0.5943861, 1.163602, 0.9333333, 0, 1, 1,
0.9209936, 0.180548, 0.806205, 0.9372549, 0, 1, 1,
0.9211621, -0.1207115, 2.48595, 0.945098, 0, 1, 1,
0.9291034, 0.5840312, 2.009581, 0.9490196, 0, 1, 1,
0.9342318, 0.01166585, 1.221786, 0.9568627, 0, 1, 1,
0.9433358, -0.2248483, 1.355438, 0.9607843, 0, 1, 1,
0.9434173, 0.4210573, 1.989181, 0.9686275, 0, 1, 1,
0.9445469, 2.002489, 0.1733139, 0.972549, 0, 1, 1,
0.9526228, 0.9417663, 1.501794, 0.9803922, 0, 1, 1,
0.957381, -0.962198, 1.110887, 0.9843137, 0, 1, 1,
0.9678283, -0.4283261, 1.42475, 0.9921569, 0, 1, 1,
0.9694834, -0.008765527, 1.638874, 0.9960784, 0, 1, 1,
0.9704855, -0.5770938, 3.257157, 1, 0, 0.9960784, 1,
0.9706725, 0.7804936, 1.691219, 1, 0, 0.9882353, 1,
0.9739639, 0.4173765, 1.850259, 1, 0, 0.9843137, 1,
0.9749842, -0.3180355, 1.421446, 1, 0, 0.9764706, 1,
0.9768215, -1.332185, 3.245248, 1, 0, 0.972549, 1,
0.9829909, -0.6773249, 3.810057, 1, 0, 0.9647059, 1,
0.9838967, 0.02702498, 2.351329, 1, 0, 0.9607843, 1,
0.9891342, 1.644688, 0.819838, 1, 0, 0.9529412, 1,
0.9909889, 0.06914684, 1.678718, 1, 0, 0.9490196, 1,
0.9935767, 0.6753158, 0.782668, 1, 0, 0.9411765, 1,
0.9950164, 0.9035425, 0.9803713, 1, 0, 0.9372549, 1,
0.9989955, 0.8690526, 2.107781, 1, 0, 0.9294118, 1,
1.000069, 1.252146, 1.128076, 1, 0, 0.9254902, 1,
1.001238, -0.09397313, 3.599028, 1, 0, 0.9176471, 1,
1.004004, 0.7675964, 0.7571094, 1, 0, 0.9137255, 1,
1.008598, 0.2105593, 1.338367, 1, 0, 0.9058824, 1,
1.010764, 0.8022568, 1.634922, 1, 0, 0.9019608, 1,
1.015261, 0.9838654, 1.252104, 1, 0, 0.8941177, 1,
1.015683, 0.033453, 2.711416, 1, 0, 0.8862745, 1,
1.024926, 0.7605892, 1.220765, 1, 0, 0.8823529, 1,
1.027778, 1.416796, -0.7085428, 1, 0, 0.8745098, 1,
1.030476, 0.2657628, 2.344833, 1, 0, 0.8705882, 1,
1.032739, -0.1351958, 0.5063834, 1, 0, 0.8627451, 1,
1.033743, 0.770489, 1.111462, 1, 0, 0.8588235, 1,
1.043686, 0.5998877, 1.679707, 1, 0, 0.8509804, 1,
1.05024, 0.841974, 0.7384871, 1, 0, 0.8470588, 1,
1.051738, 1.508645, 0.9773905, 1, 0, 0.8392157, 1,
1.056744, 0.5584164, 0.9056174, 1, 0, 0.8352941, 1,
1.056942, -0.7912816, 0.7101672, 1, 0, 0.827451, 1,
1.059081, -1.571982, 0.7502903, 1, 0, 0.8235294, 1,
1.06334, 0.6595063, 1.348828, 1, 0, 0.8156863, 1,
1.064528, -0.9598498, 3.12856, 1, 0, 0.8117647, 1,
1.066525, 1.36197, -0.9950157, 1, 0, 0.8039216, 1,
1.067163, 0.3984947, 0.8415031, 1, 0, 0.7960784, 1,
1.077205, -0.07043465, 0.829076, 1, 0, 0.7921569, 1,
1.084517, -0.1033858, 2.325763, 1, 0, 0.7843137, 1,
1.089224, -0.5539325, 2.64805, 1, 0, 0.7803922, 1,
1.09308, -0.5228848, 1.295544, 1, 0, 0.772549, 1,
1.101831, -1.248165, 2.29542, 1, 0, 0.7686275, 1,
1.103454, -0.1703516, 3.554774, 1, 0, 0.7607843, 1,
1.106161, -1.114088, 3.600564, 1, 0, 0.7568628, 1,
1.106455, -0.06015554, 0.5224548, 1, 0, 0.7490196, 1,
1.109856, 0.2691208, 2.223844, 1, 0, 0.7450981, 1,
1.124151, 1.012924, 0.9594316, 1, 0, 0.7372549, 1,
1.124706, -1.352529, 2.836815, 1, 0, 0.7333333, 1,
1.129827, -0.8057159, 2.597015, 1, 0, 0.7254902, 1,
1.130664, 0.2861165, 0.6251945, 1, 0, 0.7215686, 1,
1.136365, 2.895949, -0.716768, 1, 0, 0.7137255, 1,
1.142566, 0.6647549, 0.2032193, 1, 0, 0.7098039, 1,
1.145662, -0.6468794, 1.754213, 1, 0, 0.7019608, 1,
1.148102, -0.600423, 0.9957229, 1, 0, 0.6941177, 1,
1.148219, -0.1590553, 2.625672, 1, 0, 0.6901961, 1,
1.160096, 1.514182, 1.45885, 1, 0, 0.682353, 1,
1.162085, 0.4935524, 2.528086, 1, 0, 0.6784314, 1,
1.165717, -0.4343164, 2.910864, 1, 0, 0.6705883, 1,
1.167022, -0.4283143, 2.165156, 1, 0, 0.6666667, 1,
1.171151, -0.6795557, 3.209263, 1, 0, 0.6588235, 1,
1.171747, 0.3034724, 2.910665, 1, 0, 0.654902, 1,
1.178883, 1.36007, 0.5975205, 1, 0, 0.6470588, 1,
1.187272, 1.66989, 2.505651, 1, 0, 0.6431373, 1,
1.189609, 0.1836962, 1.441308, 1, 0, 0.6352941, 1,
1.195536, -2.4714, 2.718983, 1, 0, 0.6313726, 1,
1.196983, 0.3722552, 0.3599877, 1, 0, 0.6235294, 1,
1.199942, -0.3315226, 2.563721, 1, 0, 0.6196079, 1,
1.202109, -0.8965493, 1.085137, 1, 0, 0.6117647, 1,
1.202892, 0.1964376, 0.5420725, 1, 0, 0.6078432, 1,
1.204816, -1.478623, 2.424391, 1, 0, 0.6, 1,
1.205876, 0.02958619, 2.355342, 1, 0, 0.5921569, 1,
1.206543, -0.4548798, 3.75089, 1, 0, 0.5882353, 1,
1.214434, -0.2569689, 1.488384, 1, 0, 0.5803922, 1,
1.22518, 0.1887125, 2.846474, 1, 0, 0.5764706, 1,
1.23051, -0.1339981, 1.969688, 1, 0, 0.5686275, 1,
1.240834, -0.9443265, 3.119638, 1, 0, 0.5647059, 1,
1.251821, -0.2270834, 0.7695976, 1, 0, 0.5568628, 1,
1.251959, 1.402981, -0.1325184, 1, 0, 0.5529412, 1,
1.254934, -0.8849664, 2.024496, 1, 0, 0.5450981, 1,
1.25499, -0.993795, 2.021837, 1, 0, 0.5411765, 1,
1.255145, 0.9945123, 0.3837182, 1, 0, 0.5333334, 1,
1.260106, -1.149161, 2.644355, 1, 0, 0.5294118, 1,
1.262705, 0.2884388, -0.4139477, 1, 0, 0.5215687, 1,
1.265848, 0.3000783, 4.123164, 1, 0, 0.5176471, 1,
1.284278, 0.5446324, 3.537495, 1, 0, 0.509804, 1,
1.297502, -1.80791, 3.112133, 1, 0, 0.5058824, 1,
1.30449, -0.887578, 1.54505, 1, 0, 0.4980392, 1,
1.318048, -0.05458133, 2.738927, 1, 0, 0.4901961, 1,
1.31868, 0.00219526, 0.3619563, 1, 0, 0.4862745, 1,
1.319702, 1.575839, 0.5965944, 1, 0, 0.4784314, 1,
1.346289, 0.7656236, 1.065115, 1, 0, 0.4745098, 1,
1.352604, 0.0219727, 0.5536036, 1, 0, 0.4666667, 1,
1.352926, 0.7797032, 0.5534909, 1, 0, 0.4627451, 1,
1.372617, 0.4767409, 1.71431, 1, 0, 0.454902, 1,
1.374174, 1.629315, 2.024489, 1, 0, 0.4509804, 1,
1.382573, -0.9710343, 3.417646, 1, 0, 0.4431373, 1,
1.383903, -0.4892203, 1.383494, 1, 0, 0.4392157, 1,
1.396682, 0.352028, 2.136227, 1, 0, 0.4313726, 1,
1.398574, -1.150308, 1.218619, 1, 0, 0.427451, 1,
1.403314, -0.1236575, 2.202631, 1, 0, 0.4196078, 1,
1.411228, -1.348372, 3.686021, 1, 0, 0.4156863, 1,
1.428464, 0.3395827, 2.513738, 1, 0, 0.4078431, 1,
1.430254, -0.6987347, 1.53602, 1, 0, 0.4039216, 1,
1.436664, -0.2432307, 0.558374, 1, 0, 0.3960784, 1,
1.441511, -0.8740429, 2.656144, 1, 0, 0.3882353, 1,
1.44191, -0.7251316, 2.416034, 1, 0, 0.3843137, 1,
1.460391, 1.589513, 0.7024102, 1, 0, 0.3764706, 1,
1.475611, 0.8578876, 1.655935, 1, 0, 0.372549, 1,
1.482679, -0.01869018, 0.3497377, 1, 0, 0.3647059, 1,
1.488001, -0.4079973, 1.740835, 1, 0, 0.3607843, 1,
1.501321, 0.4054542, -1.120212, 1, 0, 0.3529412, 1,
1.504484, 0.7500551, 0.4511649, 1, 0, 0.3490196, 1,
1.512364, -1.243524, 2.195515, 1, 0, 0.3411765, 1,
1.537103, -0.8676659, 2.449572, 1, 0, 0.3372549, 1,
1.542874, -0.944035, 2.2895, 1, 0, 0.3294118, 1,
1.552751, 0.599131, 1.148041, 1, 0, 0.3254902, 1,
1.55687, -0.5611597, 2.57036, 1, 0, 0.3176471, 1,
1.562626, 0.05241549, 2.161967, 1, 0, 0.3137255, 1,
1.574115, -1.932306, 2.701432, 1, 0, 0.3058824, 1,
1.61237, -0.4985094, 2.902696, 1, 0, 0.2980392, 1,
1.613461, -1.686909, 2.544749, 1, 0, 0.2941177, 1,
1.616915, 1.22734, -0.2862065, 1, 0, 0.2862745, 1,
1.623179, -0.2534135, 3.847181, 1, 0, 0.282353, 1,
1.629197, 0.03232212, 0.0871283, 1, 0, 0.2745098, 1,
1.636895, -0.5537866, -0.3335841, 1, 0, 0.2705882, 1,
1.65264, -0.4838801, 2.10872, 1, 0, 0.2627451, 1,
1.654024, -0.5562941, 2.035245, 1, 0, 0.2588235, 1,
1.66841, 2.10743, 1.799964, 1, 0, 0.2509804, 1,
1.67567, -1.53016, 1.81941, 1, 0, 0.2470588, 1,
1.676553, -1.100201, 0.6383359, 1, 0, 0.2392157, 1,
1.681551, -0.4692264, 2.244465, 1, 0, 0.2352941, 1,
1.686475, 0.3708217, 1.50121, 1, 0, 0.227451, 1,
1.688348, 0.004228787, 1.425401, 1, 0, 0.2235294, 1,
1.722999, 1.436787, 0.7046984, 1, 0, 0.2156863, 1,
1.744065, 0.7249109, 2.488615, 1, 0, 0.2117647, 1,
1.763649, 0.855502, 1.819811, 1, 0, 0.2039216, 1,
1.785754, 1.177404, 0.7448882, 1, 0, 0.1960784, 1,
1.834881, 0.5357692, -0.7931706, 1, 0, 0.1921569, 1,
1.850835, 0.7790964, 0.9277658, 1, 0, 0.1843137, 1,
1.886956, 0.8739393, 3.378984, 1, 0, 0.1803922, 1,
1.916536, 1.858551, 3.149939, 1, 0, 0.172549, 1,
1.9384, 0.2781783, 0.9231061, 1, 0, 0.1686275, 1,
1.946416, -0.3937475, 1.638097, 1, 0, 0.1607843, 1,
1.9484, 0.01765024, 1.329798, 1, 0, 0.1568628, 1,
1.996879, -1.236721, 1.821039, 1, 0, 0.1490196, 1,
2.008788, -1.287291, 1.405841, 1, 0, 0.145098, 1,
2.027291, -1.179208, 2.816547, 1, 0, 0.1372549, 1,
2.035197, -0.8542503, 2.069708, 1, 0, 0.1333333, 1,
2.03761, -0.09683077, 1.7056, 1, 0, 0.1254902, 1,
2.040004, 2.965041, 1.569309, 1, 0, 0.1215686, 1,
2.040722, 1.128587, 1.54627, 1, 0, 0.1137255, 1,
2.042465, -0.08579304, 1.77907, 1, 0, 0.1098039, 1,
2.105781, -0.6679323, 0.6819181, 1, 0, 0.1019608, 1,
2.121773, 0.5283327, 1.08116, 1, 0, 0.09411765, 1,
2.145095, 2.034444, 1.349544, 1, 0, 0.09019608, 1,
2.160174, 0.7151802, 1.089096, 1, 0, 0.08235294, 1,
2.177005, -0.8939438, 1.560152, 1, 0, 0.07843138, 1,
2.213108, -0.6506905, 0.2407751, 1, 0, 0.07058824, 1,
2.258468, -0.06261745, 0.9468401, 1, 0, 0.06666667, 1,
2.372694, -0.8145061, 1.779099, 1, 0, 0.05882353, 1,
2.384263, 0.394048, 2.8547, 1, 0, 0.05490196, 1,
2.388107, 0.7599304, 1.450873, 1, 0, 0.04705882, 1,
2.436748, -1.473178, 0.8065284, 1, 0, 0.04313726, 1,
2.443759, 0.03809485, -0.06942805, 1, 0, 0.03529412, 1,
2.563004, 0.04620882, 1.478367, 1, 0, 0.03137255, 1,
2.716677, -0.9173019, 2.171026, 1, 0, 0.02352941, 1,
2.722062, 0.2682917, 2.641542, 1, 0, 0.01960784, 1,
2.868007, -1.084835, 2.110413, 1, 0, 0.01176471, 1,
3.287771, 1.343562, 1.701422, 1, 0, 0.007843138, 1
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
0.1377511, -4.332857, -6.949195, 0, -0.5, 0.5, 0.5,
0.1377511, -4.332857, -6.949195, 1, -0.5, 0.5, 0.5,
0.1377511, -4.332857, -6.949195, 1, 1.5, 0.5, 0.5,
0.1377511, -4.332857, -6.949195, 0, 1.5, 0.5, 0.5
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
-4.080126, -0.1385404, -6.949195, 0, -0.5, 0.5, 0.5,
-4.080126, -0.1385404, -6.949195, 1, -0.5, 0.5, 0.5,
-4.080126, -0.1385404, -6.949195, 1, 1.5, 0.5, 0.5,
-4.080126, -0.1385404, -6.949195, 0, 1.5, 0.5, 0.5
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
-4.080126, -4.332857, -0.01295781, 0, -0.5, 0.5, 0.5,
-4.080126, -4.332857, -0.01295781, 1, -0.5, 0.5, 0.5,
-4.080126, -4.332857, -0.01295781, 1, 1.5, 0.5, 0.5,
-4.080126, -4.332857, -0.01295781, 0, 1.5, 0.5, 0.5
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
-3, -3.364938, -5.348525,
3, -3.364938, -5.348525,
-3, -3.364938, -5.348525,
-3, -3.526258, -5.615303,
-2, -3.364938, -5.348525,
-2, -3.526258, -5.615303,
-1, -3.364938, -5.348525,
-1, -3.526258, -5.615303,
0, -3.364938, -5.348525,
0, -3.526258, -5.615303,
1, -3.364938, -5.348525,
1, -3.526258, -5.615303,
2, -3.364938, -5.348525,
2, -3.526258, -5.615303,
3, -3.364938, -5.348525,
3, -3.526258, -5.615303
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
-3, -3.848897, -6.14886, 0, -0.5, 0.5, 0.5,
-3, -3.848897, -6.14886, 1, -0.5, 0.5, 0.5,
-3, -3.848897, -6.14886, 1, 1.5, 0.5, 0.5,
-3, -3.848897, -6.14886, 0, 1.5, 0.5, 0.5,
-2, -3.848897, -6.14886, 0, -0.5, 0.5, 0.5,
-2, -3.848897, -6.14886, 1, -0.5, 0.5, 0.5,
-2, -3.848897, -6.14886, 1, 1.5, 0.5, 0.5,
-2, -3.848897, -6.14886, 0, 1.5, 0.5, 0.5,
-1, -3.848897, -6.14886, 0, -0.5, 0.5, 0.5,
-1, -3.848897, -6.14886, 1, -0.5, 0.5, 0.5,
-1, -3.848897, -6.14886, 1, 1.5, 0.5, 0.5,
-1, -3.848897, -6.14886, 0, 1.5, 0.5, 0.5,
0, -3.848897, -6.14886, 0, -0.5, 0.5, 0.5,
0, -3.848897, -6.14886, 1, -0.5, 0.5, 0.5,
0, -3.848897, -6.14886, 1, 1.5, 0.5, 0.5,
0, -3.848897, -6.14886, 0, 1.5, 0.5, 0.5,
1, -3.848897, -6.14886, 0, -0.5, 0.5, 0.5,
1, -3.848897, -6.14886, 1, -0.5, 0.5, 0.5,
1, -3.848897, -6.14886, 1, 1.5, 0.5, 0.5,
1, -3.848897, -6.14886, 0, 1.5, 0.5, 0.5,
2, -3.848897, -6.14886, 0, -0.5, 0.5, 0.5,
2, -3.848897, -6.14886, 1, -0.5, 0.5, 0.5,
2, -3.848897, -6.14886, 1, 1.5, 0.5, 0.5,
2, -3.848897, -6.14886, 0, 1.5, 0.5, 0.5,
3, -3.848897, -6.14886, 0, -0.5, 0.5, 0.5,
3, -3.848897, -6.14886, 1, -0.5, 0.5, 0.5,
3, -3.848897, -6.14886, 1, 1.5, 0.5, 0.5,
3, -3.848897, -6.14886, 0, 1.5, 0.5, 0.5
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
-3.10677, -3, -5.348525,
-3.10677, 2, -5.348525,
-3.10677, -3, -5.348525,
-3.268996, -3, -5.615303,
-3.10677, -2, -5.348525,
-3.268996, -2, -5.615303,
-3.10677, -1, -5.348525,
-3.268996, -1, -5.615303,
-3.10677, 0, -5.348525,
-3.268996, 0, -5.615303,
-3.10677, 1, -5.348525,
-3.268996, 1, -5.615303,
-3.10677, 2, -5.348525,
-3.268996, 2, -5.615303
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
-3.593448, -3, -6.14886, 0, -0.5, 0.5, 0.5,
-3.593448, -3, -6.14886, 1, -0.5, 0.5, 0.5,
-3.593448, -3, -6.14886, 1, 1.5, 0.5, 0.5,
-3.593448, -3, -6.14886, 0, 1.5, 0.5, 0.5,
-3.593448, -2, -6.14886, 0, -0.5, 0.5, 0.5,
-3.593448, -2, -6.14886, 1, -0.5, 0.5, 0.5,
-3.593448, -2, -6.14886, 1, 1.5, 0.5, 0.5,
-3.593448, -2, -6.14886, 0, 1.5, 0.5, 0.5,
-3.593448, -1, -6.14886, 0, -0.5, 0.5, 0.5,
-3.593448, -1, -6.14886, 1, -0.5, 0.5, 0.5,
-3.593448, -1, -6.14886, 1, 1.5, 0.5, 0.5,
-3.593448, -1, -6.14886, 0, 1.5, 0.5, 0.5,
-3.593448, 0, -6.14886, 0, -0.5, 0.5, 0.5,
-3.593448, 0, -6.14886, 1, -0.5, 0.5, 0.5,
-3.593448, 0, -6.14886, 1, 1.5, 0.5, 0.5,
-3.593448, 0, -6.14886, 0, 1.5, 0.5, 0.5,
-3.593448, 1, -6.14886, 0, -0.5, 0.5, 0.5,
-3.593448, 1, -6.14886, 1, -0.5, 0.5, 0.5,
-3.593448, 1, -6.14886, 1, 1.5, 0.5, 0.5,
-3.593448, 1, -6.14886, 0, 1.5, 0.5, 0.5,
-3.593448, 2, -6.14886, 0, -0.5, 0.5, 0.5,
-3.593448, 2, -6.14886, 1, -0.5, 0.5, 0.5,
-3.593448, 2, -6.14886, 1, 1.5, 0.5, 0.5,
-3.593448, 2, -6.14886, 0, 1.5, 0.5, 0.5
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
-3.10677, -3.364938, -4,
-3.10677, -3.364938, 4,
-3.10677, -3.364938, -4,
-3.268996, -3.526258, -4,
-3.10677, -3.364938, -2,
-3.268996, -3.526258, -2,
-3.10677, -3.364938, 0,
-3.268996, -3.526258, 0,
-3.10677, -3.364938, 2,
-3.268996, -3.526258, 2,
-3.10677, -3.364938, 4,
-3.268996, -3.526258, 4
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
-3.593448, -3.848897, -4, 0, -0.5, 0.5, 0.5,
-3.593448, -3.848897, -4, 1, -0.5, 0.5, 0.5,
-3.593448, -3.848897, -4, 1, 1.5, 0.5, 0.5,
-3.593448, -3.848897, -4, 0, 1.5, 0.5, 0.5,
-3.593448, -3.848897, -2, 0, -0.5, 0.5, 0.5,
-3.593448, -3.848897, -2, 1, -0.5, 0.5, 0.5,
-3.593448, -3.848897, -2, 1, 1.5, 0.5, 0.5,
-3.593448, -3.848897, -2, 0, 1.5, 0.5, 0.5,
-3.593448, -3.848897, 0, 0, -0.5, 0.5, 0.5,
-3.593448, -3.848897, 0, 1, -0.5, 0.5, 0.5,
-3.593448, -3.848897, 0, 1, 1.5, 0.5, 0.5,
-3.593448, -3.848897, 0, 0, 1.5, 0.5, 0.5,
-3.593448, -3.848897, 2, 0, -0.5, 0.5, 0.5,
-3.593448, -3.848897, 2, 1, -0.5, 0.5, 0.5,
-3.593448, -3.848897, 2, 1, 1.5, 0.5, 0.5,
-3.593448, -3.848897, 2, 0, 1.5, 0.5, 0.5,
-3.593448, -3.848897, 4, 0, -0.5, 0.5, 0.5,
-3.593448, -3.848897, 4, 1, -0.5, 0.5, 0.5,
-3.593448, -3.848897, 4, 1, 1.5, 0.5, 0.5,
-3.593448, -3.848897, 4, 0, 1.5, 0.5, 0.5
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
-3.10677, -3.364938, -5.348525,
-3.10677, 3.087857, -5.348525,
-3.10677, -3.364938, 5.322609,
-3.10677, 3.087857, 5.322609,
-3.10677, -3.364938, -5.348525,
-3.10677, -3.364938, 5.322609,
-3.10677, 3.087857, -5.348525,
-3.10677, 3.087857, 5.322609,
-3.10677, -3.364938, -5.348525,
3.382272, -3.364938, -5.348525,
-3.10677, -3.364938, 5.322609,
3.382272, -3.364938, 5.322609,
-3.10677, 3.087857, -5.348525,
3.382272, 3.087857, -5.348525,
-3.10677, 3.087857, 5.322609,
3.382272, 3.087857, 5.322609,
3.382272, -3.364938, -5.348525,
3.382272, 3.087857, -5.348525,
3.382272, -3.364938, 5.322609,
3.382272, 3.087857, 5.322609,
3.382272, -3.364938, -5.348525,
3.382272, -3.364938, 5.322609,
3.382272, 3.087857, -5.348525,
3.382272, 3.087857, 5.322609
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
var radius = 7.506546;
var distance = 33.39747;
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
mvMatrix.translate( -0.1377511, 0.1385404, 0.01295781 );
mvMatrix.scale( 1.250759, 1.257784, 0.7605776 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.39747);
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
Dichlorpropene<-read.table("Dichlorpropene.xyz")
```

```
## Error in read.table("Dichlorpropene.xyz"): no lines available in input
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
-3.012269, 0.4615579, 0.5227526, 0, 0, 1, 1, 1,
-2.965005, -0.1662579, -0.8225812, 1, 0, 0, 1, 1,
-2.94064, 0.03010639, -2.636021, 1, 0, 0, 1, 1,
-2.677774, -0.2741407, -2.457309, 1, 0, 0, 1, 1,
-2.571933, 0.04796219, -2.486998, 1, 0, 0, 1, 1,
-2.566788, 0.04019732, -0.9643289, 1, 0, 0, 1, 1,
-2.553513, 1.053716, -1.198059, 0, 0, 0, 1, 1,
-2.418091, 1.15754, -1.066536, 0, 0, 0, 1, 1,
-2.321175, 0.7972773, -0.9502237, 0, 0, 0, 1, 1,
-2.197967, -0.2604712, -1.259119, 0, 0, 0, 1, 1,
-2.181829, 1.295248, -1.096483, 0, 0, 0, 1, 1,
-2.129676, -0.3620558, -1.880686, 0, 0, 0, 1, 1,
-2.113637, -1.071999, -1.073339, 0, 0, 0, 1, 1,
-2.112703, 1.939962, -0.639102, 1, 1, 1, 1, 1,
-2.108278, -0.6427659, -1.557129, 1, 1, 1, 1, 1,
-2.098112, -0.644572, -1.647874, 1, 1, 1, 1, 1,
-2.091321, -0.09066495, -2.147443, 1, 1, 1, 1, 1,
-2.087311, 1.467636, -0.09642982, 1, 1, 1, 1, 1,
-2.080252, 0.2600675, -1.239089, 1, 1, 1, 1, 1,
-2.052845, 2.022689, -1.492139, 1, 1, 1, 1, 1,
-2.040851, -0.548925, -4.023916, 1, 1, 1, 1, 1,
-2.015427, 0.3225926, -2.133682, 1, 1, 1, 1, 1,
-2.00312, -0.4606459, -2.70216, 1, 1, 1, 1, 1,
-1.984777, 0.2363372, -1.651493, 1, 1, 1, 1, 1,
-1.967839, -0.4469629, -1.717314, 1, 1, 1, 1, 1,
-1.958048, -1.193292, -0.829829, 1, 1, 1, 1, 1,
-1.941578, 1.022385, -1.295616, 1, 1, 1, 1, 1,
-1.899629, 1.107856, -1.09671, 1, 1, 1, 1, 1,
-1.879973, -0.7381526, -1.341821, 0, 0, 1, 1, 1,
-1.840923, -0.0182482, -1.896178, 1, 0, 0, 1, 1,
-1.818221, 0.8508692, -0.2793357, 1, 0, 0, 1, 1,
-1.80985, 0.9805034, -2.353231, 1, 0, 0, 1, 1,
-1.805171, -2.666352, -1.849344, 1, 0, 0, 1, 1,
-1.797362, -0.4622666, -2.124273, 1, 0, 0, 1, 1,
-1.7921, 0.3993435, -0.8135827, 0, 0, 0, 1, 1,
-1.787056, -0.7477362, -0.7240138, 0, 0, 0, 1, 1,
-1.775414, 1.486045, -1.702721, 0, 0, 0, 1, 1,
-1.764919, 0.02565434, -2.707239, 0, 0, 0, 1, 1,
-1.754299, 0.6657612, -1.106241, 0, 0, 0, 1, 1,
-1.73554, -0.3794359, -4.054168, 0, 0, 0, 1, 1,
-1.713911, 0.5800087, -0.9172164, 0, 0, 0, 1, 1,
-1.6969, 1.577341, -0.2818096, 1, 1, 1, 1, 1,
-1.686147, -0.9773665, -1.649921, 1, 1, 1, 1, 1,
-1.680408, -0.3028484, -0.7850662, 1, 1, 1, 1, 1,
-1.666877, -0.8161559, -1.691088, 1, 1, 1, 1, 1,
-1.662856, -0.1651815, -0.491137, 1, 1, 1, 1, 1,
-1.662333, 0.08786068, -2.328352, 1, 1, 1, 1, 1,
-1.650622, 0.09294336, -2.266654, 1, 1, 1, 1, 1,
-1.636622, 0.5317658, -1.53301, 1, 1, 1, 1, 1,
-1.621248, -1.973332, -0.7310136, 1, 1, 1, 1, 1,
-1.603446, -0.3124263, -2.854512, 1, 1, 1, 1, 1,
-1.602453, -2.003453, -1.155656, 1, 1, 1, 1, 1,
-1.58024, -1.723702, -1.632534, 1, 1, 1, 1, 1,
-1.579052, 0.4314486, -1.084463, 1, 1, 1, 1, 1,
-1.576293, -0.7403625, -3.531691, 1, 1, 1, 1, 1,
-1.568527, 0.4394947, -1.394034, 1, 1, 1, 1, 1,
-1.565825, 0.4768834, -1.303068, 0, 0, 1, 1, 1,
-1.565122, -1.384411, -1.644855, 1, 0, 0, 1, 1,
-1.544288, -0.9218687, -1.724491, 1, 0, 0, 1, 1,
-1.531013, 0.9916281, -1.623516, 1, 0, 0, 1, 1,
-1.524546, 1.236891, -1.703913, 1, 0, 0, 1, 1,
-1.50247, 1.021852, -2.834434, 1, 0, 0, 1, 1,
-1.498831, 0.3069693, -1.13787, 0, 0, 0, 1, 1,
-1.497461, 0.3710132, -1.396634, 0, 0, 0, 1, 1,
-1.493115, 1.215167, -0.5333534, 0, 0, 0, 1, 1,
-1.450093, -0.668598, -3.254478, 0, 0, 0, 1, 1,
-1.446176, -0.5593628, -1.678479, 0, 0, 0, 1, 1,
-1.438358, 0.6123978, -0.4236058, 0, 0, 0, 1, 1,
-1.437923, 0.9609965, 0.03217192, 0, 0, 0, 1, 1,
-1.424418, 0.9949922, -1.912293, 1, 1, 1, 1, 1,
-1.395579, 0.8007686, -0.5686314, 1, 1, 1, 1, 1,
-1.382558, -0.2145773, -4.069389, 1, 1, 1, 1, 1,
-1.364534, 0.6061666, -1.183213, 1, 1, 1, 1, 1,
-1.36376, 0.01898829, -1.075351, 1, 1, 1, 1, 1,
-1.357288, 0.8275748, -1.278267, 1, 1, 1, 1, 1,
-1.350296, 0.3523797, -1.574032, 1, 1, 1, 1, 1,
-1.345158, -0.133519, -1.445945, 1, 1, 1, 1, 1,
-1.334902, 0.6212575, -2.038374, 1, 1, 1, 1, 1,
-1.326902, -0.6378803, -3.658012, 1, 1, 1, 1, 1,
-1.319888, 1.07983, -0.8208565, 1, 1, 1, 1, 1,
-1.315672, -1.23719, -2.29675, 1, 1, 1, 1, 1,
-1.298768, 0.2802888, -2.489951, 1, 1, 1, 1, 1,
-1.294025, -0.7761198, -2.47124, 1, 1, 1, 1, 1,
-1.293348, -0.2084246, -2.631835, 1, 1, 1, 1, 1,
-1.284978, -1.265733, -0.7122613, 0, 0, 1, 1, 1,
-1.274657, -1.818155, -3.047995, 1, 0, 0, 1, 1,
-1.265539, 0.09630329, -2.17159, 1, 0, 0, 1, 1,
-1.263694, -0.416198, -4.014982, 1, 0, 0, 1, 1,
-1.257967, -0.6288716, -1.845507, 1, 0, 0, 1, 1,
-1.257607, -0.4033195, -2.918806, 1, 0, 0, 1, 1,
-1.255123, -1.063809, -3.301745, 0, 0, 0, 1, 1,
-1.254994, -0.4271041, -0.3593257, 0, 0, 0, 1, 1,
-1.252543, -0.9060852, -2.509178, 0, 0, 0, 1, 1,
-1.252189, -2.130385, -4.297922, 0, 0, 0, 1, 1,
-1.243662, -1.324793, -1.96218, 0, 0, 0, 1, 1,
-1.240983, -0.3943141, -2.730224, 0, 0, 0, 1, 1,
-1.238966, -1.22499, -1.851006, 0, 0, 0, 1, 1,
-1.232909, 1.961973, -0.6681637, 1, 1, 1, 1, 1,
-1.231374, 0.6291165, -1.510621, 1, 1, 1, 1, 1,
-1.228098, 0.2391277, -1.75442, 1, 1, 1, 1, 1,
-1.220557, -0.4150628, -1.098395, 1, 1, 1, 1, 1,
-1.21766, -0.6053681, -2.170164, 1, 1, 1, 1, 1,
-1.211896, 1.212596, -1.309335, 1, 1, 1, 1, 1,
-1.199379, 2.34116, 0.6582797, 1, 1, 1, 1, 1,
-1.19907, -0.7023306, -1.615099, 1, 1, 1, 1, 1,
-1.197377, 1.962132, 0.4756841, 1, 1, 1, 1, 1,
-1.186308, 0.3588657, -2.638488, 1, 1, 1, 1, 1,
-1.18317, -0.2736686, -2.222879, 1, 1, 1, 1, 1,
-1.174879, -0.38053, -2.684139, 1, 1, 1, 1, 1,
-1.170602, 0.8262318, 0.4092665, 1, 1, 1, 1, 1,
-1.157054, 0.8435869, -0.7691764, 1, 1, 1, 1, 1,
-1.152265, -0.3570141, -2.533544, 1, 1, 1, 1, 1,
-1.150346, -1.705456, -2.765303, 0, 0, 1, 1, 1,
-1.149235, -0.2993465, -2.474448, 1, 0, 0, 1, 1,
-1.148532, -0.03555408, -1.393932, 1, 0, 0, 1, 1,
-1.146207, 0.8114596, 0.776656, 1, 0, 0, 1, 1,
-1.142584, 0.7061138, -0.7939475, 1, 0, 0, 1, 1,
-1.139241, -0.1513597, -2.637182, 1, 0, 0, 1, 1,
-1.134839, -0.3402654, -0.7351129, 0, 0, 0, 1, 1,
-1.11802, 1.077942, 0.1081719, 0, 0, 0, 1, 1,
-1.113968, -1.374515, -2.000618, 0, 0, 0, 1, 1,
-1.111337, 0.8602023, -0.415756, 0, 0, 0, 1, 1,
-1.110695, -1.343713, -3.410197, 0, 0, 0, 1, 1,
-1.108219, -0.9328554, -1.426, 0, 0, 0, 1, 1,
-1.107698, 0.2388679, -1.61308, 0, 0, 0, 1, 1,
-1.105544, -0.3333093, -0.8844234, 1, 1, 1, 1, 1,
-1.099971, -0.1320172, -0.7754539, 1, 1, 1, 1, 1,
-1.0969, -0.390734, -1.355354, 1, 1, 1, 1, 1,
-1.089983, -0.5910872, -1.887228, 1, 1, 1, 1, 1,
-1.086726, -0.9410037, -5.19312, 1, 1, 1, 1, 1,
-1.076976, 1.345308, -0.2725546, 1, 1, 1, 1, 1,
-1.07694, 0.1770336, -2.129989, 1, 1, 1, 1, 1,
-1.065967, -0.2463298, -0.3225787, 1, 1, 1, 1, 1,
-1.064109, -0.2093483, -0.5509933, 1, 1, 1, 1, 1,
-1.064058, -0.0627687, -3.245823, 1, 1, 1, 1, 1,
-1.061529, -0.5498634, -1.929986, 1, 1, 1, 1, 1,
-1.053535, 0.452169, -0.8501835, 1, 1, 1, 1, 1,
-1.039614, -1.525191, -2.955207, 1, 1, 1, 1, 1,
-1.039527, -0.2183986, -1.153112, 1, 1, 1, 1, 1,
-1.039095, -0.7429963, -3.049863, 1, 1, 1, 1, 1,
-1.03889, 1.678869, 0.4580082, 0, 0, 1, 1, 1,
-1.035787, 1.889412, 1.324812, 1, 0, 0, 1, 1,
-1.033859, 1.165043, 0.7959977, 1, 0, 0, 1, 1,
-1.03281, 1.403947, -0.2802528, 1, 0, 0, 1, 1,
-1.031222, 0.007221334, -1.392777, 1, 0, 0, 1, 1,
-1.026286, 0.02906024, 0.2995451, 1, 0, 0, 1, 1,
-1.023738, -1.179138, -1.181567, 0, 0, 0, 1, 1,
-1.023029, 0.1607859, -0.4191423, 0, 0, 0, 1, 1,
-1.020069, 0.007868273, -4.038433, 0, 0, 0, 1, 1,
-1.014217, -0.3087776, -2.45455, 0, 0, 0, 1, 1,
-1.011317, -0.4378082, -1.947335, 0, 0, 0, 1, 1,
-1.010541, -2.278092, -3.014414, 0, 0, 0, 1, 1,
-1.009972, -1.072661, -3.331981, 0, 0, 0, 1, 1,
-1.005878, 0.7044616, 0.2875202, 1, 1, 1, 1, 1,
-1.005574, 2.046296, -0.4206249, 1, 1, 1, 1, 1,
-1.002518, -0.4771158, -1.739048, 1, 1, 1, 1, 1,
-0.996148, 0.09403818, -0.7475874, 1, 1, 1, 1, 1,
-0.9916795, -0.2951449, -2.373344, 1, 1, 1, 1, 1,
-0.9901791, 1.618063, -0.7297143, 1, 1, 1, 1, 1,
-0.9837273, -0.3337834, -1.731557, 1, 1, 1, 1, 1,
-0.9812284, -0.3666419, -2.784712, 1, 1, 1, 1, 1,
-0.9804554, 0.4010618, -2.103055, 1, 1, 1, 1, 1,
-0.9771994, 0.4653861, -1.652476, 1, 1, 1, 1, 1,
-0.9703821, 1.354746, -0.8877154, 1, 1, 1, 1, 1,
-0.9556962, 1.814857, -0.07697707, 1, 1, 1, 1, 1,
-0.9450923, 1.019283, -2.165061, 1, 1, 1, 1, 1,
-0.9431704, 1.552917, -1.078066, 1, 1, 1, 1, 1,
-0.9431196, 0.40665, -0.5007042, 1, 1, 1, 1, 1,
-0.9392651, -0.4315663, -2.132677, 0, 0, 1, 1, 1,
-0.9359857, 1.981747, 1.294819, 1, 0, 0, 1, 1,
-0.9326895, 0.1164445, -1.679216, 1, 0, 0, 1, 1,
-0.9297453, -1.872305, -2.166303, 1, 0, 0, 1, 1,
-0.9281793, -0.8244288, -2.251707, 1, 0, 0, 1, 1,
-0.9224563, 0.3981152, -0.2433291, 1, 0, 0, 1, 1,
-0.9137845, 1.129283, -0.4674274, 0, 0, 0, 1, 1,
-0.9101511, -0.04393393, -2.21282, 0, 0, 0, 1, 1,
-0.9080175, 2.844747, -0.2234279, 0, 0, 0, 1, 1,
-0.8877317, -0.7306495, -4.069088, 0, 0, 0, 1, 1,
-0.8865315, 0.08046088, -0.4543694, 0, 0, 0, 1, 1,
-0.886015, 1.1277, 0.05503577, 0, 0, 0, 1, 1,
-0.8799336, -0.4921418, -3.635659, 0, 0, 0, 1, 1,
-0.8765396, -0.2437989, -2.148858, 1, 1, 1, 1, 1,
-0.8740368, 1.367316, 0.9295453, 1, 1, 1, 1, 1,
-0.870423, -0.7479053, -2.752224, 1, 1, 1, 1, 1,
-0.8701121, -0.7285489, -0.3156948, 1, 1, 1, 1, 1,
-0.8677224, 1.45645, -0.9408436, 1, 1, 1, 1, 1,
-0.8631589, 1.143806, -0.3007515, 1, 1, 1, 1, 1,
-0.8630673, 0.866977, -1.171974, 1, 1, 1, 1, 1,
-0.8615807, -0.6043687, -1.812948, 1, 1, 1, 1, 1,
-0.8605506, -1.069344, -2.847029, 1, 1, 1, 1, 1,
-0.858231, -0.7898612, -2.802057, 1, 1, 1, 1, 1,
-0.852931, 0.6107741, -1.928898, 1, 1, 1, 1, 1,
-0.8496101, -0.4368047, -1.304023, 1, 1, 1, 1, 1,
-0.8477578, -1.091118, -2.535426, 1, 1, 1, 1, 1,
-0.8474987, 0.0351337, -1.413967, 1, 1, 1, 1, 1,
-0.8389667, 0.2006686, -1.824451, 1, 1, 1, 1, 1,
-0.8377381, -0.6186923, -3.709736, 0, 0, 1, 1, 1,
-0.8301878, 0.3254707, -0.856186, 1, 0, 0, 1, 1,
-0.8268551, -0.08266272, -3.390763, 1, 0, 0, 1, 1,
-0.8259824, -0.4941413, -4.348607, 1, 0, 0, 1, 1,
-0.8201168, 0.4923662, -2.109832, 1, 0, 0, 1, 1,
-0.8171969, 0.4676729, -0.7836517, 1, 0, 0, 1, 1,
-0.8129179, 1.282678, -1.069249, 0, 0, 0, 1, 1,
-0.8117989, -1.246735, -2.545736, 0, 0, 0, 1, 1,
-0.809903, -0.837055, -3.506689, 0, 0, 0, 1, 1,
-0.8021184, 1.934768, -1.724382, 0, 0, 0, 1, 1,
-0.794232, 0.01639134, 0.08482783, 0, 0, 0, 1, 1,
-0.7841472, 1.071861, -1.032499, 0, 0, 0, 1, 1,
-0.7824359, 0.10162, -1.243225, 0, 0, 0, 1, 1,
-0.7755027, -1.071917, -1.4622, 1, 1, 1, 1, 1,
-0.7677805, -1.208636, -2.759018, 1, 1, 1, 1, 1,
-0.7587931, 0.4730474, -0.908703, 1, 1, 1, 1, 1,
-0.7541226, 0.8252094, -0.6016639, 1, 1, 1, 1, 1,
-0.7499382, -0.7909055, -1.987211, 1, 1, 1, 1, 1,
-0.7482859, 0.1612078, -0.5952343, 1, 1, 1, 1, 1,
-0.7465351, -0.255733, -1.254108, 1, 1, 1, 1, 1,
-0.742302, -0.1424503, -1.515292, 1, 1, 1, 1, 1,
-0.7408755, -0.5924629, -3.402778, 1, 1, 1, 1, 1,
-0.7375723, 1.75009, -0.909431, 1, 1, 1, 1, 1,
-0.7346509, -0.2728312, -2.284029, 1, 1, 1, 1, 1,
-0.7312598, 0.7704268, -0.9984251, 1, 1, 1, 1, 1,
-0.7245276, -1.215315, -2.264324, 1, 1, 1, 1, 1,
-0.7230548, -0.1779179, -2.374922, 1, 1, 1, 1, 1,
-0.7217671, 1.164069, -1.142598, 1, 1, 1, 1, 1,
-0.7193132, -0.03204028, -1.687204, 0, 0, 1, 1, 1,
-0.7106219, 0.3411544, -0.8884521, 1, 0, 0, 1, 1,
-0.70965, 1.845795, -0.9174089, 1, 0, 0, 1, 1,
-0.7086155, -0.5216373, -1.08456, 1, 0, 0, 1, 1,
-0.70508, 1.092141, 1.179233, 1, 0, 0, 1, 1,
-0.703729, 0.505908, -0.9557639, 1, 0, 0, 1, 1,
-0.6990126, 1.074749, -0.5110078, 0, 0, 0, 1, 1,
-0.6902254, 1.065774, -0.3098773, 0, 0, 0, 1, 1,
-0.6866499, -0.08824661, -1.265636, 0, 0, 0, 1, 1,
-0.6841109, 0.6590294, -0.5892251, 0, 0, 0, 1, 1,
-0.682824, -2.159697, -2.57749, 0, 0, 0, 1, 1,
-0.6826574, -0.8534318, -4.635833, 0, 0, 0, 1, 1,
-0.6801252, -0.7786967, -2.102661, 0, 0, 0, 1, 1,
-0.6727763, -0.5073304, 0.3053368, 1, 1, 1, 1, 1,
-0.6661325, -2.221639, -3.975452, 1, 1, 1, 1, 1,
-0.665388, -0.4626728, -4.01422, 1, 1, 1, 1, 1,
-0.6630757, -0.847055, -2.277107, 1, 1, 1, 1, 1,
-0.6613963, -1.30478, -2.248791, 1, 1, 1, 1, 1,
-0.6580088, 0.7953511, -1.237768, 1, 1, 1, 1, 1,
-0.6557663, 1.510489, 0.2803699, 1, 1, 1, 1, 1,
-0.6531802, -0.9786213, -1.663649, 1, 1, 1, 1, 1,
-0.6530514, 0.2361613, -0.227595, 1, 1, 1, 1, 1,
-0.6506979, -1.137005, -3.276083, 1, 1, 1, 1, 1,
-0.6353235, 1.673185, -0.2778256, 1, 1, 1, 1, 1,
-0.6338036, -1.013919, -3.264234, 1, 1, 1, 1, 1,
-0.6335534, 0.6013128, -0.9104024, 1, 1, 1, 1, 1,
-0.6322631, 0.3134292, 0.5328029, 1, 1, 1, 1, 1,
-0.6316218, 0.559519, -1.93756, 1, 1, 1, 1, 1,
-0.6315111, 0.7822672, -1.691095, 0, 0, 1, 1, 1,
-0.6196638, 1.558036, -0.4337803, 1, 0, 0, 1, 1,
-0.6154175, -0.630568, -2.057738, 1, 0, 0, 1, 1,
-0.6130303, 0.695721, -0.6516297, 1, 0, 0, 1, 1,
-0.6110212, 0.04531709, -2.022273, 1, 0, 0, 1, 1,
-0.6098607, -0.8678811, -3.670333, 1, 0, 0, 1, 1,
-0.605314, 0.2593244, -2.651502, 0, 0, 0, 1, 1,
-0.6022263, -1.615248, -1.344858, 0, 0, 0, 1, 1,
-0.5977935, 0.5949177, -3.33732, 0, 0, 0, 1, 1,
-0.5941306, -0.8718758, -2.448009, 0, 0, 0, 1, 1,
-0.5932633, 1.646686, -1.591973, 0, 0, 0, 1, 1,
-0.592343, 0.5345291, -0.4985776, 0, 0, 0, 1, 1,
-0.589029, -1.28691, -2.446445, 0, 0, 0, 1, 1,
-0.5887216, -0.9634305, -1.288709, 1, 1, 1, 1, 1,
-0.5831004, 0.2463053, -1.862174, 1, 1, 1, 1, 1,
-0.5821947, -0.996218, -3.416504, 1, 1, 1, 1, 1,
-0.5810471, 0.01344377, -1.882485, 1, 1, 1, 1, 1,
-0.5742678, -0.04165368, -1.488455, 1, 1, 1, 1, 1,
-0.5719617, -0.7638353, -1.394493, 1, 1, 1, 1, 1,
-0.5684808, -0.5624635, -2.914101, 1, 1, 1, 1, 1,
-0.5650355, -0.04756651, -1.954712, 1, 1, 1, 1, 1,
-0.5578852, -0.6379111, -0.767206, 1, 1, 1, 1, 1,
-0.5553644, -0.7486785, -3.304506, 1, 1, 1, 1, 1,
-0.5482454, -0.6565441, -2.716981, 1, 1, 1, 1, 1,
-0.5445923, -1.306459, -3.586725, 1, 1, 1, 1, 1,
-0.5334877, 1.552016, 1.327571, 1, 1, 1, 1, 1,
-0.517032, -0.7695615, -1.30954, 1, 1, 1, 1, 1,
-0.5153478, -0.315504, -3.910663, 1, 1, 1, 1, 1,
-0.5129639, -0.08735825, -3.399831, 0, 0, 1, 1, 1,
-0.5125121, 1.594028, 0.6959364, 1, 0, 0, 1, 1,
-0.5094822, 0.2801829, 0.3003985, 1, 0, 0, 1, 1,
-0.507886, 0.6621411, -2.052789, 1, 0, 0, 1, 1,
-0.5064199, 0.8381306, -2.648547, 1, 0, 0, 1, 1,
-0.505443, -1.707597, -4.434026, 1, 0, 0, 1, 1,
-0.5054325, 1.080492, -0.7233974, 0, 0, 0, 1, 1,
-0.5051461, -0.6418914, -3.219167, 0, 0, 0, 1, 1,
-0.5042347, -0.5618886, -0.9643942, 0, 0, 0, 1, 1,
-0.5036187, -1.392083, -2.654527, 0, 0, 0, 1, 1,
-0.4977869, -0.2546881, -0.9400628, 0, 0, 0, 1, 1,
-0.497406, 0.8478678, -1.136102, 0, 0, 0, 1, 1,
-0.4966465, -0.1375122, 0.1931757, 0, 0, 0, 1, 1,
-0.4952891, 0.07140381, -1.917618, 1, 1, 1, 1, 1,
-0.494071, -0.9688905, -1.626346, 1, 1, 1, 1, 1,
-0.4920957, 0.7824768, -1.057325, 1, 1, 1, 1, 1,
-0.4896829, -1.107495, -3.076716, 1, 1, 1, 1, 1,
-0.4880927, 0.3828503, -2.65084, 1, 1, 1, 1, 1,
-0.488054, -0.6155285, -2.598905, 1, 1, 1, 1, 1,
-0.4829863, -1.335009, -3.585345, 1, 1, 1, 1, 1,
-0.4804355, -0.2573298, -1.224604, 1, 1, 1, 1, 1,
-0.479219, -1.23019, -1.037916, 1, 1, 1, 1, 1,
-0.4745067, -2.092934, -1.74802, 1, 1, 1, 1, 1,
-0.4719029, -0.3197454, -2.239425, 1, 1, 1, 1, 1,
-0.4653342, -1.198144, -1.928795, 1, 1, 1, 1, 1,
-0.4648947, -0.05294562, -3.529795, 1, 1, 1, 1, 1,
-0.4627426, 1.613083, -0.2438373, 1, 1, 1, 1, 1,
-0.4581681, 0.0743961, -0.6526479, 1, 1, 1, 1, 1,
-0.4573902, -0.2737751, -3.8717, 0, 0, 1, 1, 1,
-0.4540366, -2.037529, -3.561074, 1, 0, 0, 1, 1,
-0.4539266, -0.4639684, -2.352143, 1, 0, 0, 1, 1,
-0.4513996, -0.1851107, 0.2177277, 1, 0, 0, 1, 1,
-0.4494489, 1.324911, -0.1497142, 1, 0, 0, 1, 1,
-0.4482706, -0.2585262, -2.219029, 1, 0, 0, 1, 1,
-0.4425092, 0.8155509, 0.01205765, 0, 0, 0, 1, 1,
-0.4398312, 1.619051, 0.4043006, 0, 0, 0, 1, 1,
-0.4379802, 1.736237, 0.2354892, 0, 0, 0, 1, 1,
-0.4379302, 0.904385, -0.3537631, 0, 0, 0, 1, 1,
-0.4374194, -2.356212, -3.732926, 0, 0, 0, 1, 1,
-0.4338904, -0.2233076, -1.90462, 0, 0, 0, 1, 1,
-0.4318771, -1.859518, -3.484972, 0, 0, 0, 1, 1,
-0.4288326, 0.5835596, -1.628225, 1, 1, 1, 1, 1,
-0.428179, 0.5105867, -0.2186382, 1, 1, 1, 1, 1,
-0.4190962, 1.97734, -1.031309, 1, 1, 1, 1, 1,
-0.4183336, -1.497741, -2.877019, 1, 1, 1, 1, 1,
-0.4168465, -1.104614, -4.188763, 1, 1, 1, 1, 1,
-0.4168176, -0.6805577, -2.863884, 1, 1, 1, 1, 1,
-0.4118249, 0.2420843, -1.258485, 1, 1, 1, 1, 1,
-0.4046402, 1.305022, 0.07040559, 1, 1, 1, 1, 1,
-0.4035998, 0.1149197, -1.176727, 1, 1, 1, 1, 1,
-0.4024423, 1.200415, 0.3931752, 1, 1, 1, 1, 1,
-0.401581, 0.83531, 0.1033373, 1, 1, 1, 1, 1,
-0.4010045, 0.384895, -0.5701911, 1, 1, 1, 1, 1,
-0.4005977, -1.407088, -2.966114, 1, 1, 1, 1, 1,
-0.3996131, -0.4856758, -1.93799, 1, 1, 1, 1, 1,
-0.3896788, -0.3798375, -3.259333, 1, 1, 1, 1, 1,
-0.3895767, -0.6713604, -1.955056, 0, 0, 1, 1, 1,
-0.3862048, 1.185024, 1.692682, 1, 0, 0, 1, 1,
-0.386041, -0.5717804, -1.933761, 1, 0, 0, 1, 1,
-0.3840581, -0.5525818, -2.081982, 1, 0, 0, 1, 1,
-0.382992, -0.858185, -1.781111, 1, 0, 0, 1, 1,
-0.3808829, -0.5733168, -3.027214, 1, 0, 0, 1, 1,
-0.3784396, 0.6243207, -1.764402, 0, 0, 0, 1, 1,
-0.3781832, -1.530963, -2.256977, 0, 0, 0, 1, 1,
-0.3773643, -1.103594, -2.41556, 0, 0, 0, 1, 1,
-0.3734498, 2.832067, -0.7858908, 0, 0, 0, 1, 1,
-0.3699928, -0.2002402, -2.425698, 0, 0, 0, 1, 1,
-0.3695429, -0.4152414, -3.294923, 0, 0, 0, 1, 1,
-0.3608293, 0.594833, 1.239322, 0, 0, 0, 1, 1,
-0.3599374, -0.4268385, -2.740812, 1, 1, 1, 1, 1,
-0.3569864, -0.2804163, -2.170172, 1, 1, 1, 1, 1,
-0.3540606, 0.406175, -1.463625, 1, 1, 1, 1, 1,
-0.352045, -1.154524, -3.491994, 1, 1, 1, 1, 1,
-0.3511848, -0.5218412, -2.387994, 1, 1, 1, 1, 1,
-0.3494631, -0.2787628, -0.5564294, 1, 1, 1, 1, 1,
-0.3493191, 0.213133, -1.368007, 1, 1, 1, 1, 1,
-0.3457215, -0.03476446, -3.376676, 1, 1, 1, 1, 1,
-0.3448976, -2.165608, -2.236378, 1, 1, 1, 1, 1,
-0.3423225, -1.265208, -3.148937, 1, 1, 1, 1, 1,
-0.34044, 0.5921792, -1.280342, 1, 1, 1, 1, 1,
-0.3401459, 2.626642, -0.1712126, 1, 1, 1, 1, 1,
-0.3381275, -0.1830974, -2.576494, 1, 1, 1, 1, 1,
-0.3362927, 0.7289459, 1.787964, 1, 1, 1, 1, 1,
-0.3334899, 0.8659242, 0.4050321, 1, 1, 1, 1, 1,
-0.3319187, 1.30183, -1.634292, 0, 0, 1, 1, 1,
-0.3294446, -0.3487873, -1.160531, 1, 0, 0, 1, 1,
-0.3243911, -0.3808444, -1.598217, 1, 0, 0, 1, 1,
-0.3236124, -1.907609, -1.071507, 1, 0, 0, 1, 1,
-0.3218715, -0.6651096, -2.842267, 1, 0, 0, 1, 1,
-0.3214068, 0.2649105, -0.9350759, 1, 0, 0, 1, 1,
-0.3213294, -0.4519292, -1.657205, 0, 0, 0, 1, 1,
-0.321144, 0.4602425, -0.1671529, 0, 0, 0, 1, 1,
-0.3204218, -0.03975805, -2.05655, 0, 0, 0, 1, 1,
-0.3132914, -0.2377734, -0.878524, 0, 0, 0, 1, 1,
-0.3122524, -1.338869, -2.064738, 0, 0, 0, 1, 1,
-0.3093062, -0.2397249, -1.932506, 0, 0, 0, 1, 1,
-0.3064687, -0.8170014, -2.026816, 0, 0, 0, 1, 1,
-0.2999039, 0.02529359, -2.964297, 1, 1, 1, 1, 1,
-0.2998773, -0.1501072, -2.622162, 1, 1, 1, 1, 1,
-0.2926694, -0.09959341, -0.5905194, 1, 1, 1, 1, 1,
-0.290435, -0.2135265, -4.030639, 1, 1, 1, 1, 1,
-0.2869389, 0.4161304, -1.319508, 1, 1, 1, 1, 1,
-0.2806393, 0.6033894, -1.895977, 1, 1, 1, 1, 1,
-0.2801765, 1.26631, 0.3330635, 1, 1, 1, 1, 1,
-0.2768678, -0.9619161, -3.547426, 1, 1, 1, 1, 1,
-0.2759607, 1.490009, -0.05087996, 1, 1, 1, 1, 1,
-0.2714532, 0.1096014, -0.999262, 1, 1, 1, 1, 1,
-0.2686526, -1.16243, -3.537655, 1, 1, 1, 1, 1,
-0.2664961, -0.4449862, -4.675507, 1, 1, 1, 1, 1,
-0.2609253, 0.3240916, -0.7727345, 1, 1, 1, 1, 1,
-0.2573667, 0.3132268, -1.994163, 1, 1, 1, 1, 1,
-0.2548653, -0.7630031, -1.390656, 1, 1, 1, 1, 1,
-0.2529274, -0.6421879, -2.973463, 0, 0, 1, 1, 1,
-0.2477389, 0.6190786, 0.5754054, 1, 0, 0, 1, 1,
-0.2422589, -0.6445486, -2.917934, 1, 0, 0, 1, 1,
-0.2412844, -1.045535, -1.330388, 1, 0, 0, 1, 1,
-0.2352515, -1.074297, -3.690029, 1, 0, 0, 1, 1,
-0.2352227, 0.407768, -0.08394762, 1, 0, 0, 1, 1,
-0.2291754, -1.118829, -4.396581, 0, 0, 0, 1, 1,
-0.2218666, 0.6057511, 0.6472387, 0, 0, 0, 1, 1,
-0.2199936, -0.02581926, -2.711063, 0, 0, 0, 1, 1,
-0.2196456, 0.7237912, 2.532021, 0, 0, 0, 1, 1,
-0.2186643, 0.7118607, -0.3467651, 0, 0, 0, 1, 1,
-0.2177975, -0.8202149, -2.79555, 0, 0, 0, 1, 1,
-0.2177665, 1.297879, 0.6695392, 0, 0, 0, 1, 1,
-0.2153302, -1.224994, -3.661629, 1, 1, 1, 1, 1,
-0.2149215, 0.5253028, -0.6566538, 1, 1, 1, 1, 1,
-0.2143815, 1.115731, -1.251022, 1, 1, 1, 1, 1,
-0.2112209, -1.03095, -2.261112, 1, 1, 1, 1, 1,
-0.2108116, -0.7424591, -2.253783, 1, 1, 1, 1, 1,
-0.2101939, -1.654709, -2.783564, 1, 1, 1, 1, 1,
-0.2096106, 0.07467828, -0.9052815, 1, 1, 1, 1, 1,
-0.2077372, 0.2952015, -0.5114012, 1, 1, 1, 1, 1,
-0.2068548, 0.8333859, 0.0110523, 1, 1, 1, 1, 1,
-0.2056708, 0.3053539, 0.370758, 1, 1, 1, 1, 1,
-0.2001233, 1.600921, -0.004312302, 1, 1, 1, 1, 1,
-0.1932901, -0.5841575, -2.344603, 1, 1, 1, 1, 1,
-0.1916706, 1.689955, 0.1364863, 1, 1, 1, 1, 1,
-0.1915426, -2.577569, -3.41408, 1, 1, 1, 1, 1,
-0.1914346, -2.045119, -3.244207, 1, 1, 1, 1, 1,
-0.187119, 1.702147, 1.860859, 0, 0, 1, 1, 1,
-0.1862465, 0.8461394, -1.144423, 1, 0, 0, 1, 1,
-0.16705, 0.1749617, -2.199487, 1, 0, 0, 1, 1,
-0.1659517, -0.3138763, -3.541708, 1, 0, 0, 1, 1,
-0.1652643, 0.6175911, 1.04561, 1, 0, 0, 1, 1,
-0.1629576, 0.1453063, -0.5373258, 1, 0, 0, 1, 1,
-0.1621135, -0.2426793, -3.95876, 0, 0, 0, 1, 1,
-0.1603246, 0.3140152, -0.8025329, 0, 0, 0, 1, 1,
-0.1535553, -0.4803555, -4.640118, 0, 0, 0, 1, 1,
-0.1473373, 2.565148, -0.6332499, 0, 0, 0, 1, 1,
-0.1455501, 0.7683396, -0.4122359, 0, 0, 0, 1, 1,
-0.1415158, -1.873304, -1.277342, 0, 0, 0, 1, 1,
-0.1396929, -1.098531, -2.877433, 0, 0, 0, 1, 1,
-0.1395464, 0.6214771, -0.06309551, 1, 1, 1, 1, 1,
-0.1351172, -0.1955454, -1.373874, 1, 1, 1, 1, 1,
-0.1332907, 0.136173, -1.528255, 1, 1, 1, 1, 1,
-0.129916, 0.1921749, 0.6078818, 1, 1, 1, 1, 1,
-0.1263535, 0.8617152, 0.9087594, 1, 1, 1, 1, 1,
-0.1254251, 0.9163535, -0.3932866, 1, 1, 1, 1, 1,
-0.1181879, 1.178287, 0.2373351, 1, 1, 1, 1, 1,
-0.1177044, 1.613419, 1.890994, 1, 1, 1, 1, 1,
-0.1151674, -0.009702856, -1.298661, 1, 1, 1, 1, 1,
-0.1126291, 0.08923243, -1.191908, 1, 1, 1, 1, 1,
-0.1122251, 0.1884804, 0.7173106, 1, 1, 1, 1, 1,
-0.108465, 0.4415179, 0.7638881, 1, 1, 1, 1, 1,
-0.1072912, -1.114536, -4.15625, 1, 1, 1, 1, 1,
-0.1068985, 0.303711, -1.953092, 1, 1, 1, 1, 1,
-0.106566, 1.3854, -1.105417, 1, 1, 1, 1, 1,
-0.1061448, 0.2989745, -0.6920274, 0, 0, 1, 1, 1,
-0.1003961, -0.8655726, -4.732717, 1, 0, 0, 1, 1,
-0.1002068, 0.0978619, -2.003063, 1, 0, 0, 1, 1,
-0.09974569, 1.196768, -1.164864, 1, 0, 0, 1, 1,
-0.0968741, -0.01463501, 0.2520562, 1, 0, 0, 1, 1,
-0.09635921, 0.4065399, 1.855676, 1, 0, 0, 1, 1,
-0.09443055, -0.3360933, -3.111827, 0, 0, 0, 1, 1,
-0.09299129, -0.5016096, -1.645217, 0, 0, 0, 1, 1,
-0.08818149, 0.2261168, 0.08754364, 0, 0, 0, 1, 1,
-0.08736475, 0.3006166, -0.550567, 0, 0, 0, 1, 1,
-0.08544348, -1.029045, -3.436244, 0, 0, 0, 1, 1,
-0.08405694, 0.01831788, -1.597848, 0, 0, 0, 1, 1,
-0.07206008, -1.820604, -2.641703, 0, 0, 0, 1, 1,
-0.07156102, 0.4813277, -0.4547036, 1, 1, 1, 1, 1,
-0.07135218, -1.618876, -4.374343, 1, 1, 1, 1, 1,
-0.07074699, -1.559616, -3.595664, 1, 1, 1, 1, 1,
-0.0696343, -0.2007494, -1.149612, 1, 1, 1, 1, 1,
-0.06335226, -0.6765128, -3.247789, 1, 1, 1, 1, 1,
-0.06058305, 1.714953, -0.1723658, 1, 1, 1, 1, 1,
-0.06050719, 0.8501381, 0.2773088, 1, 1, 1, 1, 1,
-0.0579758, -0.8541089, -3.579937, 1, 1, 1, 1, 1,
-0.05714259, -1.146099, -2.643373, 1, 1, 1, 1, 1,
-0.04544652, -0.4078102, -3.820407, 1, 1, 1, 1, 1,
-0.04303472, 0.01550731, -1.668556, 1, 1, 1, 1, 1,
-0.04243056, -0.2482716, -2.501753, 1, 1, 1, 1, 1,
-0.04206391, 0.7643187, -0.2840014, 1, 1, 1, 1, 1,
-0.04107902, 0.4722604, -1.551117, 1, 1, 1, 1, 1,
-0.0354204, -0.3337556, -2.26872, 1, 1, 1, 1, 1,
-0.03512149, 0.3973925, 0.1143291, 0, 0, 1, 1, 1,
-0.03450219, 0.1859423, 0.5697896, 1, 0, 0, 1, 1,
-0.03324175, 1.04145, -2.038281, 1, 0, 0, 1, 1,
-0.0319012, 0.03687704, -1.72931, 1, 0, 0, 1, 1,
-0.03050607, 0.2269505, -1.409924, 1, 0, 0, 1, 1,
-0.0298845, 1.178897, -0.1213265, 1, 0, 0, 1, 1,
-0.02787233, 0.02423375, 0.03737873, 0, 0, 0, 1, 1,
-0.02628596, -0.1983563, -1.938456, 0, 0, 0, 1, 1,
-0.02181618, -0.4822628, -1.507364, 0, 0, 0, 1, 1,
-0.01820354, -0.5714763, -3.969686, 0, 0, 0, 1, 1,
-0.01502471, -0.3866341, -2.348096, 0, 0, 0, 1, 1,
-0.01480778, -0.2065822, -3.402805, 0, 0, 0, 1, 1,
-0.01427334, -0.2815087, -2.192888, 0, 0, 0, 1, 1,
-0.01198686, 0.2544914, -1.308661, 1, 1, 1, 1, 1,
-0.01166398, -0.7859399, -4.456925, 1, 1, 1, 1, 1,
-0.006987309, -1.029839, -4.287265, 1, 1, 1, 1, 1,
-0.006648706, -1.196543, -3.066815, 1, 1, 1, 1, 1,
-0.006579357, 0.4326527, 0.7717131, 1, 1, 1, 1, 1,
-8.068794e-05, 0.01079297, -1.328922, 1, 1, 1, 1, 1,
0.001697495, -0.3330413, 4.263722, 1, 1, 1, 1, 1,
0.003530385, -0.8301696, 2.179455, 1, 1, 1, 1, 1,
0.005136165, -0.2414936, 1.806867, 1, 1, 1, 1, 1,
0.006766197, -1.54058, 2.432892, 1, 1, 1, 1, 1,
0.01115358, 0.8491105, 0.1212607, 1, 1, 1, 1, 1,
0.01505894, 0.3301257, -2.372091, 1, 1, 1, 1, 1,
0.01903559, -0.2899805, 3.412866, 1, 1, 1, 1, 1,
0.01968085, -0.07136726, 2.619977, 1, 1, 1, 1, 1,
0.02007738, 0.885885, -0.9612616, 1, 1, 1, 1, 1,
0.02385464, 1.244778, -2.337939, 0, 0, 1, 1, 1,
0.02423228, -0.06745805, 1.246923, 1, 0, 0, 1, 1,
0.0298638, -0.5694403, 5.167204, 1, 0, 0, 1, 1,
0.03123278, -1.133692, 1.737336, 1, 0, 0, 1, 1,
0.03289255, -1.260307, 3.165966, 1, 0, 0, 1, 1,
0.03346496, 0.5462261, 0.8734857, 1, 0, 0, 1, 1,
0.03624547, -1.211152, 1.142924, 0, 0, 0, 1, 1,
0.03793009, -0.2254073, 2.759672, 0, 0, 0, 1, 1,
0.03890163, -0.3508399, 2.309741, 0, 0, 0, 1, 1,
0.04124966, 1.59809, 0.1406244, 0, 0, 0, 1, 1,
0.04301993, -1.662102, 1.718515, 0, 0, 0, 1, 1,
0.04700755, 2.207614, -1.243651, 0, 0, 0, 1, 1,
0.05232745, 1.406807, 0.3316226, 0, 0, 0, 1, 1,
0.0525502, -2.055179, 3.051846, 1, 1, 1, 1, 1,
0.05366562, 1.492846, 0.4531392, 1, 1, 1, 1, 1,
0.0545857, 2.993884, -0.8842769, 1, 1, 1, 1, 1,
0.05872626, 0.3704241, 0.4393596, 1, 1, 1, 1, 1,
0.06153242, -0.6371174, 2.999463, 1, 1, 1, 1, 1,
0.06304396, 0.08600846, 0.6574781, 1, 1, 1, 1, 1,
0.06729834, -1.2932, 4.33374, 1, 1, 1, 1, 1,
0.06789146, -0.8331973, 3.056185, 1, 1, 1, 1, 1,
0.0698567, 1.343232, -1.242577, 1, 1, 1, 1, 1,
0.07080774, -0.3379662, 3.683465, 1, 1, 1, 1, 1,
0.07791496, 0.01620229, 1.209483, 1, 1, 1, 1, 1,
0.0791536, 1.260523, 0.7657541, 1, 1, 1, 1, 1,
0.08085313, -2.033279, 2.756308, 1, 1, 1, 1, 1,
0.08176028, -1.657226, 3.742289, 1, 1, 1, 1, 1,
0.0847026, -0.6798918, 3.735333, 1, 1, 1, 1, 1,
0.08684736, 0.4909207, 0.039629, 0, 0, 1, 1, 1,
0.08872203, -0.9004052, 2.653052, 1, 0, 0, 1, 1,
0.09208585, -0.9507697, 5.047429, 1, 0, 0, 1, 1,
0.09261969, -1.264423, 3.746135, 1, 0, 0, 1, 1,
0.09562206, -1.725493, 3.489087, 1, 0, 0, 1, 1,
0.09915762, 1.167932, 1.186269, 1, 0, 0, 1, 1,
0.1032392, -0.6197222, 2.162643, 0, 0, 0, 1, 1,
0.1078402, 0.5855207, 0.9184071, 0, 0, 0, 1, 1,
0.115869, -0.5372565, 3.176907, 0, 0, 0, 1, 1,
0.1159756, 0.4977238, 1.219068, 0, 0, 0, 1, 1,
0.1161991, 0.1524653, 1.104068, 0, 0, 0, 1, 1,
0.1188892, 1.112534, -0.02984614, 0, 0, 0, 1, 1,
0.1272812, -1.293541, 3.056778, 0, 0, 0, 1, 1,
0.1310665, 1.278277, 1.334648, 1, 1, 1, 1, 1,
0.1314101, -0.2310784, 2.432522, 1, 1, 1, 1, 1,
0.1329095, 0.1515585, 0.2479331, 1, 1, 1, 1, 1,
0.1376884, 0.6010585, 0.1519908, 1, 1, 1, 1, 1,
0.1402846, 0.3637225, -0.2880375, 1, 1, 1, 1, 1,
0.1432249, -0.1363641, 2.138417, 1, 1, 1, 1, 1,
0.1469969, 0.9589678, -0.1283226, 1, 1, 1, 1, 1,
0.1531037, 0.1806591, 0.3414517, 1, 1, 1, 1, 1,
0.1571407, -0.7552, 2.331695, 1, 1, 1, 1, 1,
0.1579614, 0.4357851, 0.4548731, 1, 1, 1, 1, 1,
0.1593673, 0.3002726, 1.514565, 1, 1, 1, 1, 1,
0.1620899, -1.03864, 2.612193, 1, 1, 1, 1, 1,
0.1626209, 0.8830679, -0.03446632, 1, 1, 1, 1, 1,
0.1672275, -0.4544487, 3.06533, 1, 1, 1, 1, 1,
0.1673454, 0.7798231, -0.673379, 1, 1, 1, 1, 1,
0.1677021, 0.2469948, 0.7162168, 0, 0, 1, 1, 1,
0.175346, -2.03196, 3.368312, 1, 0, 0, 1, 1,
0.1769759, -0.8751779, 1.685517, 1, 0, 0, 1, 1,
0.1810406, 0.5315996, 0.539939, 1, 0, 0, 1, 1,
0.1834263, -0.6553704, 3.19801, 1, 0, 0, 1, 1,
0.1835962, -3.270965, 1.36649, 1, 0, 0, 1, 1,
0.187143, -0.3771483, 1.763491, 0, 0, 0, 1, 1,
0.1882747, -0.5247289, 3.805329, 0, 0, 0, 1, 1,
0.1893497, -0.8445488, 2.50545, 0, 0, 0, 1, 1,
0.1915111, 1.690081, 2.054235, 0, 0, 0, 1, 1,
0.1932282, -0.2015563, 2.626501, 0, 0, 0, 1, 1,
0.194206, -0.2661991, 3.485139, 0, 0, 0, 1, 1,
0.1963197, -0.2818513, 1.689896, 0, 0, 0, 1, 1,
0.2000951, -1.383931, 2.868172, 1, 1, 1, 1, 1,
0.201653, -0.4614069, 2.354214, 1, 1, 1, 1, 1,
0.2077402, -0.1806221, 3.785447, 1, 1, 1, 1, 1,
0.2079267, -1.680148, 3.055699, 1, 1, 1, 1, 1,
0.2082445, 0.8879116, -0.9467926, 1, 1, 1, 1, 1,
0.2121494, -0.5345727, 3.727083, 1, 1, 1, 1, 1,
0.2128272, -0.1931283, 2.572596, 1, 1, 1, 1, 1,
0.2131949, -0.3339126, 3.260269, 1, 1, 1, 1, 1,
0.2133396, -0.5327773, 2.163538, 1, 1, 1, 1, 1,
0.2141457, -0.4547491, 3.019866, 1, 1, 1, 1, 1,
0.215977, -0.664665, 2.538752, 1, 1, 1, 1, 1,
0.2174074, -0.02748661, 2.27326, 1, 1, 1, 1, 1,
0.2190969, -0.3710892, 2.212064, 1, 1, 1, 1, 1,
0.2202245, -0.2984899, 3.529929, 1, 1, 1, 1, 1,
0.2211785, 0.6498277, 0.9044882, 1, 1, 1, 1, 1,
0.2222648, 1.697924, -0.2926797, 0, 0, 1, 1, 1,
0.2247113, 0.06681708, 2.3652, 1, 0, 0, 1, 1,
0.2265917, -0.9577565, 2.116246, 1, 0, 0, 1, 1,
0.2282314, -0.8158342, 2.143149, 1, 0, 0, 1, 1,
0.2303748, 1.281589, -0.0003735149, 1, 0, 0, 1, 1,
0.2313426, -0.9515428, 1.384131, 1, 0, 0, 1, 1,
0.2317648, -0.6799251, 1.840122, 0, 0, 0, 1, 1,
0.2364749, -2.364115, 2.73054, 0, 0, 0, 1, 1,
0.2392001, 0.6211136, -0.4899323, 0, 0, 0, 1, 1,
0.2392152, -0.5904062, 3.463127, 0, 0, 0, 1, 1,
0.2409637, 0.03097306, 1.280364, 0, 0, 0, 1, 1,
0.2442787, -1.531273, 3.630753, 0, 0, 0, 1, 1,
0.2451973, 0.3115589, 1.311737, 0, 0, 0, 1, 1,
0.2526576, 0.5632914, 0.4847403, 1, 1, 1, 1, 1,
0.2531196, 1.444037, -1.272643, 1, 1, 1, 1, 1,
0.260096, 0.4959707, 0.4608257, 1, 1, 1, 1, 1,
0.2614214, -0.9442907, 1.068835, 1, 1, 1, 1, 1,
0.2630976, -0.6736713, 2.805508, 1, 1, 1, 1, 1,
0.2673772, -0.6418617, 3.661098, 1, 1, 1, 1, 1,
0.2697527, -0.7110458, 2.036501, 1, 1, 1, 1, 1,
0.2709299, -0.6881472, 4.546073, 1, 1, 1, 1, 1,
0.2771103, 1.019493, -0.4222178, 1, 1, 1, 1, 1,
0.2892143, 0.8512924, 0.09170122, 1, 1, 1, 1, 1,
0.2952443, 0.380627, -0.2283843, 1, 1, 1, 1, 1,
0.2953166, -0.3628517, 3.342583, 1, 1, 1, 1, 1,
0.2995603, -0.7842211, 2.096028, 1, 1, 1, 1, 1,
0.3001045, -0.2109437, 2.778144, 1, 1, 1, 1, 1,
0.30612, 0.6834683, -0.4963326, 1, 1, 1, 1, 1,
0.3069023, 0.8961131, 0.7941171, 0, 0, 1, 1, 1,
0.3123703, 1.545487, -1.49425, 1, 0, 0, 1, 1,
0.3131543, -1.010764, 3.175183, 1, 0, 0, 1, 1,
0.3134699, 0.1208372, 1.364324, 1, 0, 0, 1, 1,
0.3134989, 2.184163, -1.024525, 1, 0, 0, 1, 1,
0.3183192, -0.3996445, 2.525959, 1, 0, 0, 1, 1,
0.3184073, 1.043145, -0.1400426, 0, 0, 0, 1, 1,
0.3196736, -1.748753, -0.4924792, 0, 0, 0, 1, 1,
0.3199028, 1.319878, -0.01823416, 0, 0, 0, 1, 1,
0.3210008, -1.644494, 3.158846, 0, 0, 0, 1, 1,
0.3215409, 0.6524165, 2.305393, 0, 0, 0, 1, 1,
0.3278616, 0.5847106, 1.956562, 0, 0, 0, 1, 1,
0.3294486, -0.5827488, 2.020454, 0, 0, 0, 1, 1,
0.3373779, 1.830941, -0.7463476, 1, 1, 1, 1, 1,
0.339171, 0.3852272, 2.414769, 1, 1, 1, 1, 1,
0.3444981, 0.9863791, 1.452571, 1, 1, 1, 1, 1,
0.3448714, 0.02784166, 1.390112, 1, 1, 1, 1, 1,
0.3454494, -2.266601, 2.763438, 1, 1, 1, 1, 1,
0.3461483, 0.04841502, 3.020078, 1, 1, 1, 1, 1,
0.3472435, -0.7840781, 4.20314, 1, 1, 1, 1, 1,
0.3475027, 0.9970811, -0.3473001, 1, 1, 1, 1, 1,
0.3634182, 0.1219201, 0.7557459, 1, 1, 1, 1, 1,
0.3702673, 0.08751447, 1.029937, 1, 1, 1, 1, 1,
0.3718912, -1.271868, 4.574034, 1, 1, 1, 1, 1,
0.3719353, 0.5011616, 0.6507524, 1, 1, 1, 1, 1,
0.3738671, 0.1234449, 3.167271, 1, 1, 1, 1, 1,
0.3741194, 0.5068724, 0.7328736, 1, 1, 1, 1, 1,
0.3806622, -1.271929, 2.080478, 1, 1, 1, 1, 1,
0.3815564, 0.184683, 1.940267, 0, 0, 1, 1, 1,
0.381619, 0.1888254, 0.7467032, 1, 0, 0, 1, 1,
0.3851151, -1.833862, 2.578401, 1, 0, 0, 1, 1,
0.3852951, 0.9357571, -0.5655593, 1, 0, 0, 1, 1,
0.3966559, 1.06357, 0.310246, 1, 0, 0, 1, 1,
0.3970212, 0.2340128, 0.3378287, 1, 0, 0, 1, 1,
0.3972068, -1.193087, 2.861413, 0, 0, 0, 1, 1,
0.3988788, 0.09995382, 0.1833003, 0, 0, 0, 1, 1,
0.4032644, -1.458823, 3.485247, 0, 0, 0, 1, 1,
0.4034041, 0.8056881, 1.747939, 0, 0, 0, 1, 1,
0.403441, 2.723147, 0.6875761, 0, 0, 0, 1, 1,
0.4062253, -0.2709564, 2.58962, 0, 0, 0, 1, 1,
0.4065883, 1.231959, -0.06553368, 0, 0, 0, 1, 1,
0.4068323, 0.003462105, 1.389322, 1, 1, 1, 1, 1,
0.4068866, 0.3858245, 1.778644, 1, 1, 1, 1, 1,
0.4077256, 1.033313, 0.8191136, 1, 1, 1, 1, 1,
0.4079931, -0.6127305, 4.045641, 1, 1, 1, 1, 1,
0.411433, -0.07353409, 2.127989, 1, 1, 1, 1, 1,
0.415551, 0.4582466, 0.02767222, 1, 1, 1, 1, 1,
0.4214827, 0.3519346, -0.5328369, 1, 1, 1, 1, 1,
0.4221258, 0.8085521, -1.777906, 1, 1, 1, 1, 1,
0.4228381, -1.16088, 3.606278, 1, 1, 1, 1, 1,
0.4229105, 0.1258623, 2.729851, 1, 1, 1, 1, 1,
0.4295484, -1.254275, 2.130525, 1, 1, 1, 1, 1,
0.4415635, -0.5101938, 4.477977, 1, 1, 1, 1, 1,
0.4430507, -0.2123403, 4.414923, 1, 1, 1, 1, 1,
0.4486111, -1.957788, 4.153569, 1, 1, 1, 1, 1,
0.4497301, 0.02605164, 2.208978, 1, 1, 1, 1, 1,
0.449734, -0.6438054, 3.188088, 0, 0, 1, 1, 1,
0.4537707, -0.3409044, 1.882418, 1, 0, 0, 1, 1,
0.4566242, 0.6960382, 0.379299, 1, 0, 0, 1, 1,
0.4578817, 0.8313775, -0.8635871, 1, 0, 0, 1, 1,
0.4607781, 1.622591, 0.5292253, 1, 0, 0, 1, 1,
0.4623039, 0.6577898, 0.3662274, 1, 0, 0, 1, 1,
0.4639503, 0.8123167, 0.06671651, 0, 0, 0, 1, 1,
0.4655835, -1.177, 1.292577, 0, 0, 0, 1, 1,
0.4668337, -0.01062729, 2.033195, 0, 0, 0, 1, 1,
0.468, -0.09414269, 1.135107, 0, 0, 0, 1, 1,
0.477689, 1.063884, 1.468546, 0, 0, 0, 1, 1,
0.481966, 0.1316436, 2.436436, 0, 0, 0, 1, 1,
0.4858822, 0.2520153, -0.639217, 0, 0, 0, 1, 1,
0.4881423, 0.7003608, 1.967577, 1, 1, 1, 1, 1,
0.4901537, -0.8650511, 2.035105, 1, 1, 1, 1, 1,
0.4926809, -0.157774, 2.050863, 1, 1, 1, 1, 1,
0.4927426, 1.189395, -0.1350049, 1, 1, 1, 1, 1,
0.4933568, 1.266935, 0.960214, 1, 1, 1, 1, 1,
0.4963224, -2.144231, 3.223866, 1, 1, 1, 1, 1,
0.5002429, -0.09001192, 2.859089, 1, 1, 1, 1, 1,
0.5003656, -1.882137, 4.000806, 1, 1, 1, 1, 1,
0.5048864, -0.1476482, 0.8329625, 1, 1, 1, 1, 1,
0.5077454, -0.05202788, 1.718114, 1, 1, 1, 1, 1,
0.5092846, 0.6790012, 0.5496485, 1, 1, 1, 1, 1,
0.5178478, 0.3875951, 1.156976, 1, 1, 1, 1, 1,
0.5179515, -1.104976, 3.049207, 1, 1, 1, 1, 1,
0.5197834, -0.5098141, 2.778476, 1, 1, 1, 1, 1,
0.5222132, -0.6102879, 2.620307, 1, 1, 1, 1, 1,
0.522527, 0.9113084, -0.6724705, 0, 0, 1, 1, 1,
0.5225882, 0.4313797, 1.090236, 1, 0, 0, 1, 1,
0.5235943, 0.9575767, 0.7640364, 1, 0, 0, 1, 1,
0.5254682, 0.4962625, 0.4806601, 1, 0, 0, 1, 1,
0.5266593, 0.2467182, 2.170909, 1, 0, 0, 1, 1,
0.52836, 0.5157387, 0.06022161, 1, 0, 0, 1, 1,
0.5299153, 0.4967023, 1.45569, 0, 0, 0, 1, 1,
0.5358167, 1.228744, 0.3226031, 0, 0, 0, 1, 1,
0.5375534, -0.2227535, 3.20563, 0, 0, 0, 1, 1,
0.5416492, 0.6431582, 1.006566, 0, 0, 0, 1, 1,
0.5431201, -0.5975738, 3.568193, 0, 0, 0, 1, 1,
0.5480118, -0.3174813, 0.1120625, 0, 0, 0, 1, 1,
0.5526152, 0.6908358, 0.6677295, 0, 0, 0, 1, 1,
0.5599613, -0.7985234, 2.06637, 1, 1, 1, 1, 1,
0.5612484, 0.2541951, 1.542539, 1, 1, 1, 1, 1,
0.5646813, -1.011568, 3.57254, 1, 1, 1, 1, 1,
0.5655655, 0.4391704, 0.5970004, 1, 1, 1, 1, 1,
0.5716866, 0.2836791, 1.648495, 1, 1, 1, 1, 1,
0.5738173, 1.792653, -0.7041293, 1, 1, 1, 1, 1,
0.5743859, -2.168299, 2.579587, 1, 1, 1, 1, 1,
0.5752298, 0.5909569, 0.8583854, 1, 1, 1, 1, 1,
0.5929603, -1.085519, 2.47101, 1, 1, 1, 1, 1,
0.5960882, 0.9983633, 0.7678868, 1, 1, 1, 1, 1,
0.5971783, -1.189345, 3.450799, 1, 1, 1, 1, 1,
0.5978057, -0.06436919, 2.187279, 1, 1, 1, 1, 1,
0.603947, 1.624904, 2.838995, 1, 1, 1, 1, 1,
0.6047395, -0.483826, 1.877759, 1, 1, 1, 1, 1,
0.6106387, 1.271068, -0.4958242, 1, 1, 1, 1, 1,
0.6113107, -0.1171081, 1.336867, 0, 0, 1, 1, 1,
0.6131455, -0.6976783, 2.669183, 1, 0, 0, 1, 1,
0.6155244, -1.179459, 1.337508, 1, 0, 0, 1, 1,
0.617555, 0.1642269, 0.4439597, 1, 0, 0, 1, 1,
0.6198362, -0.0663205, 0.7375651, 1, 0, 0, 1, 1,
0.6205133, -2.020406, 3.679668, 1, 0, 0, 1, 1,
0.634055, 0.4635843, 1.350274, 0, 0, 0, 1, 1,
0.6353917, 0.379963, 2.706711, 0, 0, 0, 1, 1,
0.6406904, -0.4496745, 1.195756, 0, 0, 0, 1, 1,
0.6408144, -0.4270604, 1.865712, 0, 0, 0, 1, 1,
0.6481578, 1.428094, 1.661131, 0, 0, 0, 1, 1,
0.64921, -0.6458229, 2.231158, 0, 0, 0, 1, 1,
0.6507608, 0.2640584, 1.250872, 0, 0, 0, 1, 1,
0.6514189, -0.3121948, 2.079133, 1, 1, 1, 1, 1,
0.6534952, -0.3846231, 3.132523, 1, 1, 1, 1, 1,
0.6570483, 1.707745, 0.2945457, 1, 1, 1, 1, 1,
0.6639811, 0.1092928, 1.550286, 1, 1, 1, 1, 1,
0.6642228, -1.255921, 3.417501, 1, 1, 1, 1, 1,
0.6669447, -0.05400063, 1.535586, 1, 1, 1, 1, 1,
0.6681574, 0.3259549, 0.4885572, 1, 1, 1, 1, 1,
0.6703796, 0.1582369, 1.269815, 1, 1, 1, 1, 1,
0.6722023, 1.062038, -0.04950919, 1, 1, 1, 1, 1,
0.6756223, -0.2505685, 3.160107, 1, 1, 1, 1, 1,
0.6767215, -0.8816494, 1.092835, 1, 1, 1, 1, 1,
0.6816252, -0.2917761, -0.3115067, 1, 1, 1, 1, 1,
0.6843502, -1.567388, 1.80145, 1, 1, 1, 1, 1,
0.6892014, 2.01138, 0.03252687, 1, 1, 1, 1, 1,
0.6902196, -0.5225406, 3.10946, 1, 1, 1, 1, 1,
0.6904855, -0.2040744, 1.581904, 0, 0, 1, 1, 1,
0.6919809, 0.935082, 0.6268174, 1, 0, 0, 1, 1,
0.6992588, -0.4397789, 2.729499, 1, 0, 0, 1, 1,
0.7025015, -0.2084089, 0.6996852, 1, 0, 0, 1, 1,
0.7074921, -0.1409785, 1.956772, 1, 0, 0, 1, 1,
0.7105205, 1.001027, 0.4127075, 1, 0, 0, 1, 1,
0.7130842, 1.350575, 2.593131, 0, 0, 0, 1, 1,
0.721282, 0.5579565, 0.1186576, 0, 0, 0, 1, 1,
0.7245265, 1.52315, -0.6923921, 0, 0, 0, 1, 1,
0.7271937, 0.1903613, 2.604645, 0, 0, 0, 1, 1,
0.7302304, 0.01857693, 2.400896, 0, 0, 0, 1, 1,
0.7341204, 1.178935, 1.091438, 0, 0, 0, 1, 1,
0.7378092, -3.038246, 4.970315, 0, 0, 0, 1, 1,
0.746546, -0.09106494, 1.264452, 1, 1, 1, 1, 1,
0.7592873, 0.5112743, -0.2259891, 1, 1, 1, 1, 1,
0.7621475, -0.0691157, 2.299948, 1, 1, 1, 1, 1,
0.7627776, 0.237101, 1.481618, 1, 1, 1, 1, 1,
0.7641729, -1.995356, 3.8499, 1, 1, 1, 1, 1,
0.764419, -1.57042, 2.537161, 1, 1, 1, 1, 1,
0.7698299, -0.8792926, 3.275201, 1, 1, 1, 1, 1,
0.7782727, 0.2600043, 1.443825, 1, 1, 1, 1, 1,
0.7836364, -0.1448793, 1.376675, 1, 1, 1, 1, 1,
0.786117, -1.61658, 0.9738699, 1, 1, 1, 1, 1,
0.7861905, -1.27443, 2.547211, 1, 1, 1, 1, 1,
0.7924324, -0.6720099, 3.075448, 1, 1, 1, 1, 1,
0.7931796, 0.3134635, 1.769926, 1, 1, 1, 1, 1,
0.7943757, 0.4543509, 0.01845283, 1, 1, 1, 1, 1,
0.7956287, -1.008044, 3.614544, 1, 1, 1, 1, 1,
0.7995942, -0.778707, 2.484112, 0, 0, 1, 1, 1,
0.8009767, -0.1488122, 0.3675721, 1, 0, 0, 1, 1,
0.8021, 0.8809242, -0.2717808, 1, 0, 0, 1, 1,
0.8029269, 0.01680985, 0.8491763, 1, 0, 0, 1, 1,
0.8098528, -0.1885198, 0.8891958, 1, 0, 0, 1, 1,
0.811107, 1.623533, 0.1806798, 1, 0, 0, 1, 1,
0.8112261, 0.6500917, 0.09214569, 0, 0, 0, 1, 1,
0.8113329, -0.4196373, 2.956571, 0, 0, 0, 1, 1,
0.8126414, 0.7483748, 0.5020975, 0, 0, 0, 1, 1,
0.8172142, 0.9561386, 1.684114, 0, 0, 0, 1, 1,
0.818476, -0.4821257, 1.387043, 0, 0, 0, 1, 1,
0.8208132, 0.7683951, 0.6367908, 0, 0, 0, 1, 1,
0.8240039, -0.3039213, 0.4486287, 0, 0, 0, 1, 1,
0.8241658, 0.6192613, 2.01863, 1, 1, 1, 1, 1,
0.8252023, -2.141606, 3.745521, 1, 1, 1, 1, 1,
0.8339791, -1.902566, 3.636981, 1, 1, 1, 1, 1,
0.838587, -0.578666, 2.890177, 1, 1, 1, 1, 1,
0.8474505, -1.540456, 3.38193, 1, 1, 1, 1, 1,
0.8490474, -0.2265954, 1.982429, 1, 1, 1, 1, 1,
0.8510569, -1.631693, 3.891486, 1, 1, 1, 1, 1,
0.8518918, 1.574453, 0.3855672, 1, 1, 1, 1, 1,
0.8533553, 1.387523, -0.7412363, 1, 1, 1, 1, 1,
0.8542995, 1.295114, 0.4334776, 1, 1, 1, 1, 1,
0.8628744, 0.9747648, -0.3023436, 1, 1, 1, 1, 1,
0.862875, 1.03449, 1.841034, 1, 1, 1, 1, 1,
0.8654473, 1.828984, 1.339729, 1, 1, 1, 1, 1,
0.868931, -1.287426, 2.01714, 1, 1, 1, 1, 1,
0.8706411, -1.055513, 3.478839, 1, 1, 1, 1, 1,
0.8751354, 0.83768, -0.4340078, 0, 0, 1, 1, 1,
0.8827696, 0.8337234, 0.9363662, 1, 0, 0, 1, 1,
0.8829948, -1.318413, 1.563891, 1, 0, 0, 1, 1,
0.8836485, -0.8043855, 1.072597, 1, 0, 0, 1, 1,
0.896345, -0.9746162, 2.223539, 1, 0, 0, 1, 1,
0.89693, -0.5103916, 1.402678, 1, 0, 0, 1, 1,
0.9017529, -0.3047269, 1.991435, 0, 0, 0, 1, 1,
0.9023092, 0.1436033, 0.330135, 0, 0, 0, 1, 1,
0.9052766, -0.2387244, 1.267547, 0, 0, 0, 1, 1,
0.9203192, -0.9828113, 2.144757, 0, 0, 0, 1, 1,
0.9208571, 0.5943861, 1.163602, 0, 0, 0, 1, 1,
0.9209936, 0.180548, 0.806205, 0, 0, 0, 1, 1,
0.9211621, -0.1207115, 2.48595, 0, 0, 0, 1, 1,
0.9291034, 0.5840312, 2.009581, 1, 1, 1, 1, 1,
0.9342318, 0.01166585, 1.221786, 1, 1, 1, 1, 1,
0.9433358, -0.2248483, 1.355438, 1, 1, 1, 1, 1,
0.9434173, 0.4210573, 1.989181, 1, 1, 1, 1, 1,
0.9445469, 2.002489, 0.1733139, 1, 1, 1, 1, 1,
0.9526228, 0.9417663, 1.501794, 1, 1, 1, 1, 1,
0.957381, -0.962198, 1.110887, 1, 1, 1, 1, 1,
0.9678283, -0.4283261, 1.42475, 1, 1, 1, 1, 1,
0.9694834, -0.008765527, 1.638874, 1, 1, 1, 1, 1,
0.9704855, -0.5770938, 3.257157, 1, 1, 1, 1, 1,
0.9706725, 0.7804936, 1.691219, 1, 1, 1, 1, 1,
0.9739639, 0.4173765, 1.850259, 1, 1, 1, 1, 1,
0.9749842, -0.3180355, 1.421446, 1, 1, 1, 1, 1,
0.9768215, -1.332185, 3.245248, 1, 1, 1, 1, 1,
0.9829909, -0.6773249, 3.810057, 1, 1, 1, 1, 1,
0.9838967, 0.02702498, 2.351329, 0, 0, 1, 1, 1,
0.9891342, 1.644688, 0.819838, 1, 0, 0, 1, 1,
0.9909889, 0.06914684, 1.678718, 1, 0, 0, 1, 1,
0.9935767, 0.6753158, 0.782668, 1, 0, 0, 1, 1,
0.9950164, 0.9035425, 0.9803713, 1, 0, 0, 1, 1,
0.9989955, 0.8690526, 2.107781, 1, 0, 0, 1, 1,
1.000069, 1.252146, 1.128076, 0, 0, 0, 1, 1,
1.001238, -0.09397313, 3.599028, 0, 0, 0, 1, 1,
1.004004, 0.7675964, 0.7571094, 0, 0, 0, 1, 1,
1.008598, 0.2105593, 1.338367, 0, 0, 0, 1, 1,
1.010764, 0.8022568, 1.634922, 0, 0, 0, 1, 1,
1.015261, 0.9838654, 1.252104, 0, 0, 0, 1, 1,
1.015683, 0.033453, 2.711416, 0, 0, 0, 1, 1,
1.024926, 0.7605892, 1.220765, 1, 1, 1, 1, 1,
1.027778, 1.416796, -0.7085428, 1, 1, 1, 1, 1,
1.030476, 0.2657628, 2.344833, 1, 1, 1, 1, 1,
1.032739, -0.1351958, 0.5063834, 1, 1, 1, 1, 1,
1.033743, 0.770489, 1.111462, 1, 1, 1, 1, 1,
1.043686, 0.5998877, 1.679707, 1, 1, 1, 1, 1,
1.05024, 0.841974, 0.7384871, 1, 1, 1, 1, 1,
1.051738, 1.508645, 0.9773905, 1, 1, 1, 1, 1,
1.056744, 0.5584164, 0.9056174, 1, 1, 1, 1, 1,
1.056942, -0.7912816, 0.7101672, 1, 1, 1, 1, 1,
1.059081, -1.571982, 0.7502903, 1, 1, 1, 1, 1,
1.06334, 0.6595063, 1.348828, 1, 1, 1, 1, 1,
1.064528, -0.9598498, 3.12856, 1, 1, 1, 1, 1,
1.066525, 1.36197, -0.9950157, 1, 1, 1, 1, 1,
1.067163, 0.3984947, 0.8415031, 1, 1, 1, 1, 1,
1.077205, -0.07043465, 0.829076, 0, 0, 1, 1, 1,
1.084517, -0.1033858, 2.325763, 1, 0, 0, 1, 1,
1.089224, -0.5539325, 2.64805, 1, 0, 0, 1, 1,
1.09308, -0.5228848, 1.295544, 1, 0, 0, 1, 1,
1.101831, -1.248165, 2.29542, 1, 0, 0, 1, 1,
1.103454, -0.1703516, 3.554774, 1, 0, 0, 1, 1,
1.106161, -1.114088, 3.600564, 0, 0, 0, 1, 1,
1.106455, -0.06015554, 0.5224548, 0, 0, 0, 1, 1,
1.109856, 0.2691208, 2.223844, 0, 0, 0, 1, 1,
1.124151, 1.012924, 0.9594316, 0, 0, 0, 1, 1,
1.124706, -1.352529, 2.836815, 0, 0, 0, 1, 1,
1.129827, -0.8057159, 2.597015, 0, 0, 0, 1, 1,
1.130664, 0.2861165, 0.6251945, 0, 0, 0, 1, 1,
1.136365, 2.895949, -0.716768, 1, 1, 1, 1, 1,
1.142566, 0.6647549, 0.2032193, 1, 1, 1, 1, 1,
1.145662, -0.6468794, 1.754213, 1, 1, 1, 1, 1,
1.148102, -0.600423, 0.9957229, 1, 1, 1, 1, 1,
1.148219, -0.1590553, 2.625672, 1, 1, 1, 1, 1,
1.160096, 1.514182, 1.45885, 1, 1, 1, 1, 1,
1.162085, 0.4935524, 2.528086, 1, 1, 1, 1, 1,
1.165717, -0.4343164, 2.910864, 1, 1, 1, 1, 1,
1.167022, -0.4283143, 2.165156, 1, 1, 1, 1, 1,
1.171151, -0.6795557, 3.209263, 1, 1, 1, 1, 1,
1.171747, 0.3034724, 2.910665, 1, 1, 1, 1, 1,
1.178883, 1.36007, 0.5975205, 1, 1, 1, 1, 1,
1.187272, 1.66989, 2.505651, 1, 1, 1, 1, 1,
1.189609, 0.1836962, 1.441308, 1, 1, 1, 1, 1,
1.195536, -2.4714, 2.718983, 1, 1, 1, 1, 1,
1.196983, 0.3722552, 0.3599877, 0, 0, 1, 1, 1,
1.199942, -0.3315226, 2.563721, 1, 0, 0, 1, 1,
1.202109, -0.8965493, 1.085137, 1, 0, 0, 1, 1,
1.202892, 0.1964376, 0.5420725, 1, 0, 0, 1, 1,
1.204816, -1.478623, 2.424391, 1, 0, 0, 1, 1,
1.205876, 0.02958619, 2.355342, 1, 0, 0, 1, 1,
1.206543, -0.4548798, 3.75089, 0, 0, 0, 1, 1,
1.214434, -0.2569689, 1.488384, 0, 0, 0, 1, 1,
1.22518, 0.1887125, 2.846474, 0, 0, 0, 1, 1,
1.23051, -0.1339981, 1.969688, 0, 0, 0, 1, 1,
1.240834, -0.9443265, 3.119638, 0, 0, 0, 1, 1,
1.251821, -0.2270834, 0.7695976, 0, 0, 0, 1, 1,
1.251959, 1.402981, -0.1325184, 0, 0, 0, 1, 1,
1.254934, -0.8849664, 2.024496, 1, 1, 1, 1, 1,
1.25499, -0.993795, 2.021837, 1, 1, 1, 1, 1,
1.255145, 0.9945123, 0.3837182, 1, 1, 1, 1, 1,
1.260106, -1.149161, 2.644355, 1, 1, 1, 1, 1,
1.262705, 0.2884388, -0.4139477, 1, 1, 1, 1, 1,
1.265848, 0.3000783, 4.123164, 1, 1, 1, 1, 1,
1.284278, 0.5446324, 3.537495, 1, 1, 1, 1, 1,
1.297502, -1.80791, 3.112133, 1, 1, 1, 1, 1,
1.30449, -0.887578, 1.54505, 1, 1, 1, 1, 1,
1.318048, -0.05458133, 2.738927, 1, 1, 1, 1, 1,
1.31868, 0.00219526, 0.3619563, 1, 1, 1, 1, 1,
1.319702, 1.575839, 0.5965944, 1, 1, 1, 1, 1,
1.346289, 0.7656236, 1.065115, 1, 1, 1, 1, 1,
1.352604, 0.0219727, 0.5536036, 1, 1, 1, 1, 1,
1.352926, 0.7797032, 0.5534909, 1, 1, 1, 1, 1,
1.372617, 0.4767409, 1.71431, 0, 0, 1, 1, 1,
1.374174, 1.629315, 2.024489, 1, 0, 0, 1, 1,
1.382573, -0.9710343, 3.417646, 1, 0, 0, 1, 1,
1.383903, -0.4892203, 1.383494, 1, 0, 0, 1, 1,
1.396682, 0.352028, 2.136227, 1, 0, 0, 1, 1,
1.398574, -1.150308, 1.218619, 1, 0, 0, 1, 1,
1.403314, -0.1236575, 2.202631, 0, 0, 0, 1, 1,
1.411228, -1.348372, 3.686021, 0, 0, 0, 1, 1,
1.428464, 0.3395827, 2.513738, 0, 0, 0, 1, 1,
1.430254, -0.6987347, 1.53602, 0, 0, 0, 1, 1,
1.436664, -0.2432307, 0.558374, 0, 0, 0, 1, 1,
1.441511, -0.8740429, 2.656144, 0, 0, 0, 1, 1,
1.44191, -0.7251316, 2.416034, 0, 0, 0, 1, 1,
1.460391, 1.589513, 0.7024102, 1, 1, 1, 1, 1,
1.475611, 0.8578876, 1.655935, 1, 1, 1, 1, 1,
1.482679, -0.01869018, 0.3497377, 1, 1, 1, 1, 1,
1.488001, -0.4079973, 1.740835, 1, 1, 1, 1, 1,
1.501321, 0.4054542, -1.120212, 1, 1, 1, 1, 1,
1.504484, 0.7500551, 0.4511649, 1, 1, 1, 1, 1,
1.512364, -1.243524, 2.195515, 1, 1, 1, 1, 1,
1.537103, -0.8676659, 2.449572, 1, 1, 1, 1, 1,
1.542874, -0.944035, 2.2895, 1, 1, 1, 1, 1,
1.552751, 0.599131, 1.148041, 1, 1, 1, 1, 1,
1.55687, -0.5611597, 2.57036, 1, 1, 1, 1, 1,
1.562626, 0.05241549, 2.161967, 1, 1, 1, 1, 1,
1.574115, -1.932306, 2.701432, 1, 1, 1, 1, 1,
1.61237, -0.4985094, 2.902696, 1, 1, 1, 1, 1,
1.613461, -1.686909, 2.544749, 1, 1, 1, 1, 1,
1.616915, 1.22734, -0.2862065, 0, 0, 1, 1, 1,
1.623179, -0.2534135, 3.847181, 1, 0, 0, 1, 1,
1.629197, 0.03232212, 0.0871283, 1, 0, 0, 1, 1,
1.636895, -0.5537866, -0.3335841, 1, 0, 0, 1, 1,
1.65264, -0.4838801, 2.10872, 1, 0, 0, 1, 1,
1.654024, -0.5562941, 2.035245, 1, 0, 0, 1, 1,
1.66841, 2.10743, 1.799964, 0, 0, 0, 1, 1,
1.67567, -1.53016, 1.81941, 0, 0, 0, 1, 1,
1.676553, -1.100201, 0.6383359, 0, 0, 0, 1, 1,
1.681551, -0.4692264, 2.244465, 0, 0, 0, 1, 1,
1.686475, 0.3708217, 1.50121, 0, 0, 0, 1, 1,
1.688348, 0.004228787, 1.425401, 0, 0, 0, 1, 1,
1.722999, 1.436787, 0.7046984, 0, 0, 0, 1, 1,
1.744065, 0.7249109, 2.488615, 1, 1, 1, 1, 1,
1.763649, 0.855502, 1.819811, 1, 1, 1, 1, 1,
1.785754, 1.177404, 0.7448882, 1, 1, 1, 1, 1,
1.834881, 0.5357692, -0.7931706, 1, 1, 1, 1, 1,
1.850835, 0.7790964, 0.9277658, 1, 1, 1, 1, 1,
1.886956, 0.8739393, 3.378984, 1, 1, 1, 1, 1,
1.916536, 1.858551, 3.149939, 1, 1, 1, 1, 1,
1.9384, 0.2781783, 0.9231061, 1, 1, 1, 1, 1,
1.946416, -0.3937475, 1.638097, 1, 1, 1, 1, 1,
1.9484, 0.01765024, 1.329798, 1, 1, 1, 1, 1,
1.996879, -1.236721, 1.821039, 1, 1, 1, 1, 1,
2.008788, -1.287291, 1.405841, 1, 1, 1, 1, 1,
2.027291, -1.179208, 2.816547, 1, 1, 1, 1, 1,
2.035197, -0.8542503, 2.069708, 1, 1, 1, 1, 1,
2.03761, -0.09683077, 1.7056, 1, 1, 1, 1, 1,
2.040004, 2.965041, 1.569309, 0, 0, 1, 1, 1,
2.040722, 1.128587, 1.54627, 1, 0, 0, 1, 1,
2.042465, -0.08579304, 1.77907, 1, 0, 0, 1, 1,
2.105781, -0.6679323, 0.6819181, 1, 0, 0, 1, 1,
2.121773, 0.5283327, 1.08116, 1, 0, 0, 1, 1,
2.145095, 2.034444, 1.349544, 1, 0, 0, 1, 1,
2.160174, 0.7151802, 1.089096, 0, 0, 0, 1, 1,
2.177005, -0.8939438, 1.560152, 0, 0, 0, 1, 1,
2.213108, -0.6506905, 0.2407751, 0, 0, 0, 1, 1,
2.258468, -0.06261745, 0.9468401, 0, 0, 0, 1, 1,
2.372694, -0.8145061, 1.779099, 0, 0, 0, 1, 1,
2.384263, 0.394048, 2.8547, 0, 0, 0, 1, 1,
2.388107, 0.7599304, 1.450873, 0, 0, 0, 1, 1,
2.436748, -1.473178, 0.8065284, 1, 1, 1, 1, 1,
2.443759, 0.03809485, -0.06942805, 1, 1, 1, 1, 1,
2.563004, 0.04620882, 1.478367, 1, 1, 1, 1, 1,
2.716677, -0.9173019, 2.171026, 1, 1, 1, 1, 1,
2.722062, 0.2682917, 2.641542, 1, 1, 1, 1, 1,
2.868007, -1.084835, 2.110413, 1, 1, 1, 1, 1,
3.287771, 1.343562, 1.701422, 1, 1, 1, 1, 1
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
var radius = 9.365775;
var distance = 32.89689;
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
mvMatrix.translate( -0.1377511, 0.1385403, 0.01295781 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.89689);
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
