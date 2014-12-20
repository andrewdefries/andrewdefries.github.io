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
-3.411654, -0.7451801, -2.536314, 1, 0, 0, 1,
-3.049016, 0.5124788, -1.745894, 1, 0.007843138, 0, 1,
-2.946696, -0.3580265, 0.01712546, 1, 0.01176471, 0, 1,
-2.534543, -1.052025, -2.96937, 1, 0.01960784, 0, 1,
-2.514435, -0.01965585, -1.751252, 1, 0.02352941, 0, 1,
-2.473652, -1.92564, -1.948073, 1, 0.03137255, 0, 1,
-2.463867, 1.034142, 0.528776, 1, 0.03529412, 0, 1,
-2.437868, 1.26319, -1.039381, 1, 0.04313726, 0, 1,
-2.416548, 0.6184949, -0.1152098, 1, 0.04705882, 0, 1,
-2.28415, -1.724138, -2.692535, 1, 0.05490196, 0, 1,
-2.251326, 0.2677727, -1.645173, 1, 0.05882353, 0, 1,
-2.222217, -1.009699, -3.227162, 1, 0.06666667, 0, 1,
-2.22199, -0.1683434, -1.301713, 1, 0.07058824, 0, 1,
-2.21365, -0.7964205, -2.322035, 1, 0.07843138, 0, 1,
-2.136703, -0.6416679, -2.7867, 1, 0.08235294, 0, 1,
-2.104273, 1.29294, -0.3943354, 1, 0.09019608, 0, 1,
-2.081081, 1.964819, -1.187669, 1, 0.09411765, 0, 1,
-2.026408, 0.1654547, -2.523746, 1, 0.1019608, 0, 1,
-2.015126, -0.3838987, -1.594597, 1, 0.1098039, 0, 1,
-1.998073, 0.2294491, 0.3256424, 1, 0.1137255, 0, 1,
-1.988314, -0.04202644, -0.949661, 1, 0.1215686, 0, 1,
-1.8996, 1.257403, -2.338511, 1, 0.1254902, 0, 1,
-1.888496, -0.8758427, -0.1456384, 1, 0.1333333, 0, 1,
-1.875209, -0.2336945, -0.7240909, 1, 0.1372549, 0, 1,
-1.873915, 0.06211578, -2.149492, 1, 0.145098, 0, 1,
-1.867671, 0.4653687, -1.118263, 1, 0.1490196, 0, 1,
-1.857376, 0.3933695, -0.7175929, 1, 0.1568628, 0, 1,
-1.823655, -2.418164, -5.037436, 1, 0.1607843, 0, 1,
-1.817742, -0.885927, -3.062768, 1, 0.1686275, 0, 1,
-1.794201, 0.3925284, -0.9115239, 1, 0.172549, 0, 1,
-1.778997, 0.9821813, 0.6789452, 1, 0.1803922, 0, 1,
-1.775167, -0.8834624, 0.08711994, 1, 0.1843137, 0, 1,
-1.772212, -0.6176226, -3.417075, 1, 0.1921569, 0, 1,
-1.765978, -1.317218, -2.836838, 1, 0.1960784, 0, 1,
-1.758496, -0.711782, -3.700466, 1, 0.2039216, 0, 1,
-1.743586, -0.4864462, -3.238722, 1, 0.2117647, 0, 1,
-1.729384, -1.298684, -2.065071, 1, 0.2156863, 0, 1,
-1.721809, -1.98274, -1.679206, 1, 0.2235294, 0, 1,
-1.707264, 0.2114691, -1.083425, 1, 0.227451, 0, 1,
-1.69479, 0.1197377, -1.949561, 1, 0.2352941, 0, 1,
-1.660672, -1.386285, -1.337887, 1, 0.2392157, 0, 1,
-1.654765, 0.3924203, -0.1109218, 1, 0.2470588, 0, 1,
-1.647977, 1.248789, -0.2443479, 1, 0.2509804, 0, 1,
-1.641762, 0.9471281, -2.840313, 1, 0.2588235, 0, 1,
-1.618063, 1.279435, -1.183216, 1, 0.2627451, 0, 1,
-1.600963, -1.947463, -4.190535, 1, 0.2705882, 0, 1,
-1.598634, -1.109002, -2.450135, 1, 0.2745098, 0, 1,
-1.58799, 0.7982983, -1.934334, 1, 0.282353, 0, 1,
-1.586226, 0.7449838, -2.294035, 1, 0.2862745, 0, 1,
-1.549892, 0.5427335, -0.8478923, 1, 0.2941177, 0, 1,
-1.548828, 1.041697, -1.280068, 1, 0.3019608, 0, 1,
-1.545576, 0.706918, -0.2099131, 1, 0.3058824, 0, 1,
-1.512833, 2.086182, -0.6383958, 1, 0.3137255, 0, 1,
-1.509125, 0.8982831, -2.63712, 1, 0.3176471, 0, 1,
-1.495728, 0.08103891, -0.6732969, 1, 0.3254902, 0, 1,
-1.492763, -0.7519751, -1.413954, 1, 0.3294118, 0, 1,
-1.490425, -2.079995, -2.173318, 1, 0.3372549, 0, 1,
-1.488678, -0.5437419, -1.670274, 1, 0.3411765, 0, 1,
-1.475962, -0.4675035, -1.71112, 1, 0.3490196, 0, 1,
-1.472829, 0.8640682, -1.829742, 1, 0.3529412, 0, 1,
-1.465155, -0.915792, -0.4612029, 1, 0.3607843, 0, 1,
-1.46382, 0.8071545, -1.865932, 1, 0.3647059, 0, 1,
-1.460492, -0.5578586, -2.95885, 1, 0.372549, 0, 1,
-1.4535, -0.8905975, -1.284755, 1, 0.3764706, 0, 1,
-1.433207, -0.3667123, -2.161847, 1, 0.3843137, 0, 1,
-1.421333, -0.6639103, -1.948027, 1, 0.3882353, 0, 1,
-1.416045, 0.1359625, -0.02962611, 1, 0.3960784, 0, 1,
-1.411994, -0.7071106, -0.5004652, 1, 0.4039216, 0, 1,
-1.403682, 1.578304, -0.9190757, 1, 0.4078431, 0, 1,
-1.401512, -1.100723, -2.484229, 1, 0.4156863, 0, 1,
-1.39289, 0.8836053, -0.6503831, 1, 0.4196078, 0, 1,
-1.390337, 1.321205, 1.605263, 1, 0.427451, 0, 1,
-1.369545, -1.410795, -2.294905, 1, 0.4313726, 0, 1,
-1.369301, -1.590412, -2.975717, 1, 0.4392157, 0, 1,
-1.366511, 0.1623301, -3.143683, 1, 0.4431373, 0, 1,
-1.346371, -0.3667749, -2.123001, 1, 0.4509804, 0, 1,
-1.344146, -0.2850772, -2.402065, 1, 0.454902, 0, 1,
-1.329608, 0.1005182, -1.352457, 1, 0.4627451, 0, 1,
-1.327811, -1.158378, -0.1145475, 1, 0.4666667, 0, 1,
-1.316884, 1.432567, -1.090292, 1, 0.4745098, 0, 1,
-1.300665, -0.2115581, -0.9406351, 1, 0.4784314, 0, 1,
-1.276633, -0.249741, -1.212646, 1, 0.4862745, 0, 1,
-1.262047, -0.1378612, -3.985408, 1, 0.4901961, 0, 1,
-1.256863, 0.8859935, -2.149015, 1, 0.4980392, 0, 1,
-1.251739, 1.288944, -0.4398179, 1, 0.5058824, 0, 1,
-1.251572, -0.06457899, -2.20607, 1, 0.509804, 0, 1,
-1.250026, -0.8481254, -3.207865, 1, 0.5176471, 0, 1,
-1.239059, -0.2512146, 0.08739512, 1, 0.5215687, 0, 1,
-1.227825, -0.3787612, -1.249019, 1, 0.5294118, 0, 1,
-1.227777, 0.1089763, -2.350137, 1, 0.5333334, 0, 1,
-1.227125, -0.4829243, -1.116037, 1, 0.5411765, 0, 1,
-1.22651, 0.7002589, -0.07371087, 1, 0.5450981, 0, 1,
-1.224536, 2.049835, -1.187696, 1, 0.5529412, 0, 1,
-1.224475, -0.6292472, -2.379439, 1, 0.5568628, 0, 1,
-1.222448, 3.065216, -0.3582425, 1, 0.5647059, 0, 1,
-1.222103, 0.2720117, -1.361221, 1, 0.5686275, 0, 1,
-1.221566, -0.8731028, -2.430371, 1, 0.5764706, 0, 1,
-1.21823, 0.9044057, -1.916393, 1, 0.5803922, 0, 1,
-1.213024, -0.7511651, -4.074057, 1, 0.5882353, 0, 1,
-1.21021, -0.5192887, -1.974741, 1, 0.5921569, 0, 1,
-1.207903, 1.988357, 0.6310259, 1, 0.6, 0, 1,
-1.201468, 1.565279, -0.3215089, 1, 0.6078432, 0, 1,
-1.196051, -1.109105, -1.883715, 1, 0.6117647, 0, 1,
-1.1905, 0.7937096, -0.752188, 1, 0.6196079, 0, 1,
-1.185444, -0.263493, -2.688056, 1, 0.6235294, 0, 1,
-1.183969, -0.8576691, -2.414549, 1, 0.6313726, 0, 1,
-1.18294, -0.6454181, -4.7039, 1, 0.6352941, 0, 1,
-1.172047, 0.3559456, -1.427419, 1, 0.6431373, 0, 1,
-1.166818, -0.1921975, -1.361187, 1, 0.6470588, 0, 1,
-1.161404, 0.936718, 0.8699769, 1, 0.654902, 0, 1,
-1.159871, -0.7958757, -1.955421, 1, 0.6588235, 0, 1,
-1.156386, 0.6148162, -2.257755, 1, 0.6666667, 0, 1,
-1.154661, 0.5674942, -0.3997127, 1, 0.6705883, 0, 1,
-1.153228, -1.661722, -1.205618, 1, 0.6784314, 0, 1,
-1.153022, 0.5108644, -1.976275, 1, 0.682353, 0, 1,
-1.146001, -1.545189, -0.506032, 1, 0.6901961, 0, 1,
-1.140644, 1.980939, -1.967025, 1, 0.6941177, 0, 1,
-1.134834, 0.2155474, -0.9174823, 1, 0.7019608, 0, 1,
-1.134423, -0.2294772, -1.994499, 1, 0.7098039, 0, 1,
-1.132001, -0.8645945, -2.282555, 1, 0.7137255, 0, 1,
-1.130516, 0.2667309, -2.199699, 1, 0.7215686, 0, 1,
-1.121768, 1.370582, 0.3025292, 1, 0.7254902, 0, 1,
-1.117282, 0.6938463, -1.00194, 1, 0.7333333, 0, 1,
-1.11165, 0.8279628, -1.585642, 1, 0.7372549, 0, 1,
-1.110901, -0.9272052, -3.462986, 1, 0.7450981, 0, 1,
-1.107781, 1.238867, -0.8107721, 1, 0.7490196, 0, 1,
-1.104631, -1.745507, -2.5758, 1, 0.7568628, 0, 1,
-1.100459, -2.781883, -1.239127, 1, 0.7607843, 0, 1,
-1.099431, 0.1226002, -3.396345, 1, 0.7686275, 0, 1,
-1.092875, 0.3248304, -1.577816, 1, 0.772549, 0, 1,
-1.091297, -1.536974, -4.404552, 1, 0.7803922, 0, 1,
-1.085065, 0.5491784, -0.9486527, 1, 0.7843137, 0, 1,
-1.080377, 0.4457529, -0.3709474, 1, 0.7921569, 0, 1,
-1.072138, 0.456576, -2.516476, 1, 0.7960784, 0, 1,
-1.071054, -2.983024, -3.505305, 1, 0.8039216, 0, 1,
-1.065632, -0.2682827, -2.590954, 1, 0.8117647, 0, 1,
-1.064963, -1.342623, -1.34585, 1, 0.8156863, 0, 1,
-1.057184, -0.3531351, -0.6308841, 1, 0.8235294, 0, 1,
-1.055797, 0.2735496, 0.2754095, 1, 0.827451, 0, 1,
-1.052276, 0.2646863, -0.4571135, 1, 0.8352941, 0, 1,
-1.048481, -0.4200399, -1.30822, 1, 0.8392157, 0, 1,
-1.041431, 0.6777424, -2.197089, 1, 0.8470588, 0, 1,
-1.036269, -1.317542, -1.504339, 1, 0.8509804, 0, 1,
-1.034028, 0.4599473, -1.961185, 1, 0.8588235, 0, 1,
-1.032565, 0.6283091, -1.550432, 1, 0.8627451, 0, 1,
-1.029676, -0.7855189, -3.239359, 1, 0.8705882, 0, 1,
-1.024159, 0.9686992, -1.203594, 1, 0.8745098, 0, 1,
-1.003141, 0.8093998, -2.369152, 1, 0.8823529, 0, 1,
-1.003126, -0.2714861, -2.217915, 1, 0.8862745, 0, 1,
-1.002769, -0.2564903, -1.871806, 1, 0.8941177, 0, 1,
-1.002068, 0.1820283, -0.8315691, 1, 0.8980392, 0, 1,
-0.9995939, -0.6931862, -3.343575, 1, 0.9058824, 0, 1,
-0.9902205, 0.3063347, -0.0822845, 1, 0.9137255, 0, 1,
-0.989443, 1.300465, -0.1230985, 1, 0.9176471, 0, 1,
-0.9892508, -0.2806548, -2.482686, 1, 0.9254902, 0, 1,
-0.9884349, 0.3844563, -1.082138, 1, 0.9294118, 0, 1,
-0.9854645, 0.8557999, -0.4550228, 1, 0.9372549, 0, 1,
-0.9839258, -1.14935, -2.534713, 1, 0.9411765, 0, 1,
-0.9795344, 1.608633, -0.2199973, 1, 0.9490196, 0, 1,
-0.9756542, -0.4348201, -2.315023, 1, 0.9529412, 0, 1,
-0.9662318, -0.4717511, -0.3443968, 1, 0.9607843, 0, 1,
-0.9660028, -0.2163358, -1.774599, 1, 0.9647059, 0, 1,
-0.9440979, 0.3825101, -3.09123, 1, 0.972549, 0, 1,
-0.9347109, -0.3900635, -1.561543, 1, 0.9764706, 0, 1,
-0.9305413, 0.7358789, -0.5784668, 1, 0.9843137, 0, 1,
-0.9288811, -1.329107, -0.8903116, 1, 0.9882353, 0, 1,
-0.9265351, -2.322056, -2.99687, 1, 0.9960784, 0, 1,
-0.9220166, 2.481043, -2.404647, 0.9960784, 1, 0, 1,
-0.9151387, -0.4772934, -1.743153, 0.9921569, 1, 0, 1,
-0.9116077, -2.095282, -3.621528, 0.9843137, 1, 0, 1,
-0.8951344, -0.2045945, -4.033241, 0.9803922, 1, 0, 1,
-0.8901938, 0.6556051, -1.727403, 0.972549, 1, 0, 1,
-0.8831933, 0.0619025, -0.07859103, 0.9686275, 1, 0, 1,
-0.8809274, 0.4106413, -1.389281, 0.9607843, 1, 0, 1,
-0.8777012, 1.516018, 0.2098759, 0.9568627, 1, 0, 1,
-0.872665, 0.07586839, -1.507908, 0.9490196, 1, 0, 1,
-0.8688349, 0.6115203, -1.162072, 0.945098, 1, 0, 1,
-0.8669474, 0.04928252, -0.8689628, 0.9372549, 1, 0, 1,
-0.8611761, 2.326844, -1.066009, 0.9333333, 1, 0, 1,
-0.8591611, -0.2099005, -1.37752, 0.9254902, 1, 0, 1,
-0.845722, 0.4151527, -0.1399006, 0.9215686, 1, 0, 1,
-0.8419196, 0.1402958, 0.06343699, 0.9137255, 1, 0, 1,
-0.8371687, 2.333112, -0.05058926, 0.9098039, 1, 0, 1,
-0.8304239, -0.01297651, -1.360129, 0.9019608, 1, 0, 1,
-0.8257045, 0.6718886, -1.138226, 0.8941177, 1, 0, 1,
-0.8256552, 0.3832604, -0.3790953, 0.8901961, 1, 0, 1,
-0.8243273, -1.525461, -2.456351, 0.8823529, 1, 0, 1,
-0.82166, -1.935443, -3.530386, 0.8784314, 1, 0, 1,
-0.8180603, 1.072952, -1.386073, 0.8705882, 1, 0, 1,
-0.8153784, 0.09359764, -0.7811105, 0.8666667, 1, 0, 1,
-0.8101713, -1.21539, -3.017152, 0.8588235, 1, 0, 1,
-0.8027901, 0.5390018, -1.538751, 0.854902, 1, 0, 1,
-0.7960052, 0.290753, -0.6402639, 0.8470588, 1, 0, 1,
-0.7948969, -0.4705675, -1.618362, 0.8431373, 1, 0, 1,
-0.790511, 1.506634, -1.226431, 0.8352941, 1, 0, 1,
-0.7864379, 0.1121679, -0.05805471, 0.8313726, 1, 0, 1,
-0.7862688, 1.025275, -3.147441, 0.8235294, 1, 0, 1,
-0.7855779, -0.2097464, -1.145156, 0.8196079, 1, 0, 1,
-0.7854853, -0.5636933, -4.209423, 0.8117647, 1, 0, 1,
-0.7699802, -0.2003521, -3.757846, 0.8078431, 1, 0, 1,
-0.7698519, -0.2108071, -0.7700015, 0.8, 1, 0, 1,
-0.7671967, -0.2277467, -2.02897, 0.7921569, 1, 0, 1,
-0.7626225, 0.3626796, -0.5655195, 0.7882353, 1, 0, 1,
-0.7625754, -0.4206973, -2.523152, 0.7803922, 1, 0, 1,
-0.7613097, 1.415378, -1.58087, 0.7764706, 1, 0, 1,
-0.7600028, -0.5613921, -2.581091, 0.7686275, 1, 0, 1,
-0.7543693, -0.4646603, -1.847087, 0.7647059, 1, 0, 1,
-0.7542872, 0.2953964, -0.4572818, 0.7568628, 1, 0, 1,
-0.7535456, -0.2775542, -2.144024, 0.7529412, 1, 0, 1,
-0.751449, 0.3096543, -1.620297, 0.7450981, 1, 0, 1,
-0.7460709, 2.40104, 0.7233959, 0.7411765, 1, 0, 1,
-0.742999, 0.7101709, -0.7445441, 0.7333333, 1, 0, 1,
-0.7380947, -1.579115, -2.416702, 0.7294118, 1, 0, 1,
-0.7370356, -0.2717007, -3.599168, 0.7215686, 1, 0, 1,
-0.735667, -0.08904701, -2.019495, 0.7176471, 1, 0, 1,
-0.73172, -0.6957158, -4.365466, 0.7098039, 1, 0, 1,
-0.730997, 0.8581189, -1.199255, 0.7058824, 1, 0, 1,
-0.7305073, -0.04884383, -3.723091, 0.6980392, 1, 0, 1,
-0.7289312, 0.2379513, -2.035129, 0.6901961, 1, 0, 1,
-0.7245625, 1.041879, -0.6432753, 0.6862745, 1, 0, 1,
-0.7223719, 0.8255416, -0.9920494, 0.6784314, 1, 0, 1,
-0.7179233, -0.7051821, -1.265687, 0.6745098, 1, 0, 1,
-0.7154607, -0.06297451, -3.254664, 0.6666667, 1, 0, 1,
-0.7146642, -1.661294, -2.317415, 0.6627451, 1, 0, 1,
-0.7135838, 1.518629, 0.07766566, 0.654902, 1, 0, 1,
-0.7094432, 1.837741, -0.5130725, 0.6509804, 1, 0, 1,
-0.7089101, 1.508611, -1.612772, 0.6431373, 1, 0, 1,
-0.6969008, -0.4414828, -2.094308, 0.6392157, 1, 0, 1,
-0.6965051, 0.6293179, -1.369273, 0.6313726, 1, 0, 1,
-0.6952752, 0.4382435, 0.296945, 0.627451, 1, 0, 1,
-0.687577, 1.017702, -1.751884, 0.6196079, 1, 0, 1,
-0.6846015, 0.04746475, 0.05491377, 0.6156863, 1, 0, 1,
-0.6841108, -0.2677937, -0.9129866, 0.6078432, 1, 0, 1,
-0.6803362, -0.4482804, -3.027878, 0.6039216, 1, 0, 1,
-0.678123, -0.3812048, -0.8562136, 0.5960785, 1, 0, 1,
-0.6778268, -0.09134834, -1.352094, 0.5882353, 1, 0, 1,
-0.6757436, 0.2020783, -1.439286, 0.5843138, 1, 0, 1,
-0.6643416, -1.863254, -3.239132, 0.5764706, 1, 0, 1,
-0.6578785, -0.3157629, -3.497123, 0.572549, 1, 0, 1,
-0.657806, -0.4183055, -2.441769, 0.5647059, 1, 0, 1,
-0.6569597, 0.3305108, -2.139831, 0.5607843, 1, 0, 1,
-0.6537328, 1.451374, -0.4714453, 0.5529412, 1, 0, 1,
-0.6529074, 0.05728633, 1.055275, 0.5490196, 1, 0, 1,
-0.6483395, -0.04562544, -3.167752, 0.5411765, 1, 0, 1,
-0.643611, -0.9360241, -1.420711, 0.5372549, 1, 0, 1,
-0.6427865, 0.05430954, -2.116105, 0.5294118, 1, 0, 1,
-0.641346, -0.4299562, -2.07973, 0.5254902, 1, 0, 1,
-0.6409559, 0.7476244, 0.4622936, 0.5176471, 1, 0, 1,
-0.6403832, -1.693133, -3.48338, 0.5137255, 1, 0, 1,
-0.6303414, -0.2585878, -1.549492, 0.5058824, 1, 0, 1,
-0.6268229, -0.1859062, -1.588737, 0.5019608, 1, 0, 1,
-0.6258659, -0.738614, -2.559837, 0.4941176, 1, 0, 1,
-0.6249934, 0.6554192, -0.2927644, 0.4862745, 1, 0, 1,
-0.6191635, 1.291327, -1.656668, 0.4823529, 1, 0, 1,
-0.6159452, -2.315278, -0.9723349, 0.4745098, 1, 0, 1,
-0.6145932, 0.3437477, -2.850888, 0.4705882, 1, 0, 1,
-0.6056224, -0.4059334, -1.416648, 0.4627451, 1, 0, 1,
-0.5973736, 0.6847723, -0.2662557, 0.4588235, 1, 0, 1,
-0.5971956, -0.3133416, -0.3353226, 0.4509804, 1, 0, 1,
-0.597006, 0.6860098, -0.4785481, 0.4470588, 1, 0, 1,
-0.5931516, 0.5647993, -0.683013, 0.4392157, 1, 0, 1,
-0.5928692, -0.5827466, -3.125847, 0.4352941, 1, 0, 1,
-0.5881515, -1.088204, -2.6387, 0.427451, 1, 0, 1,
-0.5831263, 0.7185654, -2.594463, 0.4235294, 1, 0, 1,
-0.5824718, 0.3272071, -2.566618, 0.4156863, 1, 0, 1,
-0.5812993, 1.795971, -0.4557621, 0.4117647, 1, 0, 1,
-0.5803326, -0.4596641, -2.940266, 0.4039216, 1, 0, 1,
-0.5789998, -0.1552533, 0.07918691, 0.3960784, 1, 0, 1,
-0.5783505, -0.01182024, -0.6609248, 0.3921569, 1, 0, 1,
-0.5782062, 0.3701914, -1.631928, 0.3843137, 1, 0, 1,
-0.5767597, -0.283415, -2.165036, 0.3803922, 1, 0, 1,
-0.5762762, 0.6408421, -1.398878, 0.372549, 1, 0, 1,
-0.5751464, -0.05243188, -2.221218, 0.3686275, 1, 0, 1,
-0.5745842, 0.7234104, -0.8573209, 0.3607843, 1, 0, 1,
-0.5690582, -0.9923264, -4.244954, 0.3568628, 1, 0, 1,
-0.5674812, 0.1161226, -3.363753, 0.3490196, 1, 0, 1,
-0.5671206, 0.519452, -0.852431, 0.345098, 1, 0, 1,
-0.5636081, -0.5958949, -3.103816, 0.3372549, 1, 0, 1,
-0.5628726, 2.327977, -0.414574, 0.3333333, 1, 0, 1,
-0.5601817, -1.084073, -1.974822, 0.3254902, 1, 0, 1,
-0.5554605, -0.7009708, -0.8210487, 0.3215686, 1, 0, 1,
-0.550882, 0.9070444, -0.1545676, 0.3137255, 1, 0, 1,
-0.5504407, -1.16297, -2.407832, 0.3098039, 1, 0, 1,
-0.5424018, -0.4187408, -1.384909, 0.3019608, 1, 0, 1,
-0.5394015, -0.7444536, -1.241336, 0.2941177, 1, 0, 1,
-0.5391193, -0.07681875, -1.051528, 0.2901961, 1, 0, 1,
-0.5375363, -1.968519, -3.653931, 0.282353, 1, 0, 1,
-0.5284061, -1.243259, -2.603008, 0.2784314, 1, 0, 1,
-0.5262848, 0.2436113, 0.9241704, 0.2705882, 1, 0, 1,
-0.5194404, -0.1484407, -1.771943, 0.2666667, 1, 0, 1,
-0.5160698, 0.03015408, -2.815202, 0.2588235, 1, 0, 1,
-0.5154631, 0.6737978, 0.1323448, 0.254902, 1, 0, 1,
-0.5105889, 0.9729804, -1.04909, 0.2470588, 1, 0, 1,
-0.5017172, 1.586342, 0.3741518, 0.2431373, 1, 0, 1,
-0.4948539, 0.2421736, -0.420002, 0.2352941, 1, 0, 1,
-0.4945605, 0.1931775, -1.72884, 0.2313726, 1, 0, 1,
-0.4918938, 0.4056874, -1.403282, 0.2235294, 1, 0, 1,
-0.4902332, 1.469052, 0.1451388, 0.2196078, 1, 0, 1,
-0.4885212, 0.5671087, -1.709871, 0.2117647, 1, 0, 1,
-0.4884412, 0.9148923, -1.285958, 0.2078431, 1, 0, 1,
-0.4870051, -1.27603, -3.018742, 0.2, 1, 0, 1,
-0.4813529, -0.06135125, 0.6486869, 0.1921569, 1, 0, 1,
-0.4754055, 0.7811826, 0.3199049, 0.1882353, 1, 0, 1,
-0.4721915, 0.6632253, -1.008417, 0.1803922, 1, 0, 1,
-0.4718276, 0.7820054, 0.6854119, 0.1764706, 1, 0, 1,
-0.4645715, 0.06668854, -1.530579, 0.1686275, 1, 0, 1,
-0.4639297, 0.9720426, -1.388778, 0.1647059, 1, 0, 1,
-0.46324, 1.65062, 2.20661, 0.1568628, 1, 0, 1,
-0.4570786, 0.6728483, -1.449657, 0.1529412, 1, 0, 1,
-0.4524491, 0.4182157, 0.1729493, 0.145098, 1, 0, 1,
-0.4519164, 0.7618421, -2.262515, 0.1411765, 1, 0, 1,
-0.4495829, 0.2913982, -1.397279, 0.1333333, 1, 0, 1,
-0.4477895, -0.5259219, -3.816739, 0.1294118, 1, 0, 1,
-0.4411473, 1.158357, 0.4912866, 0.1215686, 1, 0, 1,
-0.4383115, 1.536888, 0.2916246, 0.1176471, 1, 0, 1,
-0.4376382, 2.174675, 0.4603726, 0.1098039, 1, 0, 1,
-0.4344098, 0.5750039, -1.881999, 0.1058824, 1, 0, 1,
-0.4307187, 1.125285, 0.04421119, 0.09803922, 1, 0, 1,
-0.429535, 1.096967, 0.9164938, 0.09019608, 1, 0, 1,
-0.4272878, -0.6012744, -3.522991, 0.08627451, 1, 0, 1,
-0.4269128, 0.3201545, -0.2100363, 0.07843138, 1, 0, 1,
-0.4267809, 0.3289809, 0.1040197, 0.07450981, 1, 0, 1,
-0.4248987, -1.287832, -3.567334, 0.06666667, 1, 0, 1,
-0.4196893, -0.8428306, -3.127263, 0.0627451, 1, 0, 1,
-0.4185284, -0.9855942, -1.711037, 0.05490196, 1, 0, 1,
-0.4182097, 2.233689, -1.520153, 0.05098039, 1, 0, 1,
-0.4127595, 0.08282458, -2.058761, 0.04313726, 1, 0, 1,
-0.4089581, -1.433702, -3.22053, 0.03921569, 1, 0, 1,
-0.4061894, 0.2564996, -0.9967808, 0.03137255, 1, 0, 1,
-0.4045121, 0.2057224, -1.527732, 0.02745098, 1, 0, 1,
-0.4040429, -0.2950069, -0.9445816, 0.01960784, 1, 0, 1,
-0.4015326, 0.001999787, -2.363465, 0.01568628, 1, 0, 1,
-0.4008716, -0.4946145, -2.480457, 0.007843138, 1, 0, 1,
-0.397868, 0.2992922, 0.7953194, 0.003921569, 1, 0, 1,
-0.3970268, -2.228578, -2.750663, 0, 1, 0.003921569, 1,
-0.3927402, -0.6656428, -3.048554, 0, 1, 0.01176471, 1,
-0.391322, 1.071409, -0.2877113, 0, 1, 0.01568628, 1,
-0.3879864, -0.688768, -4.785467, 0, 1, 0.02352941, 1,
-0.3855486, 0.6768497, 0.3994401, 0, 1, 0.02745098, 1,
-0.3829955, -0.2065255, -2.085893, 0, 1, 0.03529412, 1,
-0.3815349, 0.7899168, -0.03091944, 0, 1, 0.03921569, 1,
-0.3757265, 0.1412975, -1.173703, 0, 1, 0.04705882, 1,
-0.3700626, 0.01088237, -1.399392, 0, 1, 0.05098039, 1,
-0.3608457, 1.870681, 1.099052, 0, 1, 0.05882353, 1,
-0.3592715, 0.3279254, -0.6495956, 0, 1, 0.0627451, 1,
-0.3553527, -0.1564053, -1.215094, 0, 1, 0.07058824, 1,
-0.3538071, -2.623689, -3.026235, 0, 1, 0.07450981, 1,
-0.3537304, -1.464726, -3.316796, 0, 1, 0.08235294, 1,
-0.3527223, -0.2110721, -1.549289, 0, 1, 0.08627451, 1,
-0.3512813, 1.235664, 1.055809, 0, 1, 0.09411765, 1,
-0.3495267, -1.081721, -1.941638, 0, 1, 0.1019608, 1,
-0.3463197, 0.5571544, 0.5242537, 0, 1, 0.1058824, 1,
-0.3461918, -0.1449997, -2.57533, 0, 1, 0.1137255, 1,
-0.3451783, 0.6354595, -0.315279, 0, 1, 0.1176471, 1,
-0.332704, -2.232052, -3.846213, 0, 1, 0.1254902, 1,
-0.3313047, -0.07671068, -2.088663, 0, 1, 0.1294118, 1,
-0.3291607, 0.2967417, 0.3641864, 0, 1, 0.1372549, 1,
-0.3272191, -2.172761, -2.467699, 0, 1, 0.1411765, 1,
-0.3230553, -0.7269049, -2.957083, 0, 1, 0.1490196, 1,
-0.3226542, -0.115082, -1.219043, 0, 1, 0.1529412, 1,
-0.3202868, -1.128781, -1.794915, 0, 1, 0.1607843, 1,
-0.3197658, -0.01042915, -0.7958133, 0, 1, 0.1647059, 1,
-0.3190482, 0.8938742, 0.8293976, 0, 1, 0.172549, 1,
-0.3186063, 0.6584805, -1.352775, 0, 1, 0.1764706, 1,
-0.3181976, 0.362078, -1.50107, 0, 1, 0.1843137, 1,
-0.3159155, 0.03351637, -0.9773868, 0, 1, 0.1882353, 1,
-0.3139346, 1.504044, -0.5993478, 0, 1, 0.1960784, 1,
-0.313714, 0.05550092, -1.828111, 0, 1, 0.2039216, 1,
-0.3084023, -0.5664695, -4.570035, 0, 1, 0.2078431, 1,
-0.3062455, 1.840565, -1.310782, 0, 1, 0.2156863, 1,
-0.3044437, 1.055177, -0.1707833, 0, 1, 0.2196078, 1,
-0.3037837, 1.811956, -0.9889395, 0, 1, 0.227451, 1,
-0.3033881, -0.5786243, -2.137232, 0, 1, 0.2313726, 1,
-0.2988059, -0.9438691, -1.395886, 0, 1, 0.2392157, 1,
-0.2956576, -0.07223749, -1.576026, 0, 1, 0.2431373, 1,
-0.2801065, 1.074113, -0.6200231, 0, 1, 0.2509804, 1,
-0.274276, 0.5659222, -1.21984, 0, 1, 0.254902, 1,
-0.2732604, -0.5936623, -2.148393, 0, 1, 0.2627451, 1,
-0.2720352, -1.45229, -2.017119, 0, 1, 0.2666667, 1,
-0.2680491, -0.4962883, -2.829629, 0, 1, 0.2745098, 1,
-0.267273, -0.8291566, -2.628024, 0, 1, 0.2784314, 1,
-0.2632824, -0.2474187, -1.436794, 0, 1, 0.2862745, 1,
-0.2606869, -0.6566067, -2.808888, 0, 1, 0.2901961, 1,
-0.2591805, 0.5227386, -0.1972446, 0, 1, 0.2980392, 1,
-0.255184, -0.3181683, -1.531506, 0, 1, 0.3058824, 1,
-0.2529407, -1.09985, -5.232933, 0, 1, 0.3098039, 1,
-0.2520976, 1.422056, -0.2551474, 0, 1, 0.3176471, 1,
-0.2492048, 0.5512041, -1.328873, 0, 1, 0.3215686, 1,
-0.2475012, 0.04032282, -1.155285, 0, 1, 0.3294118, 1,
-0.2468627, -0.34249, -1.62668, 0, 1, 0.3333333, 1,
-0.2450654, -0.1224687, -0.3719877, 0, 1, 0.3411765, 1,
-0.2433503, 0.287753, -0.7861381, 0, 1, 0.345098, 1,
-0.242395, -0.7363704, -1.82699, 0, 1, 0.3529412, 1,
-0.2392644, 0.08105893, -2.402819, 0, 1, 0.3568628, 1,
-0.2387336, -0.4340403, -2.135198, 0, 1, 0.3647059, 1,
-0.2379579, 0.9895724, -0.3147768, 0, 1, 0.3686275, 1,
-0.2269066, 0.2673993, -1.666346, 0, 1, 0.3764706, 1,
-0.2249621, -0.7378032, -1.535506, 0, 1, 0.3803922, 1,
-0.2244711, 1.894006, 0.5805368, 0, 1, 0.3882353, 1,
-0.2228211, 0.283305, 1.132564, 0, 1, 0.3921569, 1,
-0.219803, -0.290164, -1.645663, 0, 1, 0.4, 1,
-0.2191467, 2.757295, 0.9969589, 0, 1, 0.4078431, 1,
-0.2174369, -1.346338, -4.392336, 0, 1, 0.4117647, 1,
-0.217154, -1.310614, -3.011874, 0, 1, 0.4196078, 1,
-0.2168645, -0.1895813, -2.805096, 0, 1, 0.4235294, 1,
-0.2166725, -0.2032467, -0.6434348, 0, 1, 0.4313726, 1,
-0.2157822, -0.6042395, -3.788997, 0, 1, 0.4352941, 1,
-0.2156444, 1.143096, -0.5432829, 0, 1, 0.4431373, 1,
-0.2155849, -0.3667064, -4.320221, 0, 1, 0.4470588, 1,
-0.2142092, -0.4273888, -2.807484, 0, 1, 0.454902, 1,
-0.2102681, 0.785919, 0.8134636, 0, 1, 0.4588235, 1,
-0.2092972, 0.5652953, -2.305562, 0, 1, 0.4666667, 1,
-0.2068503, 0.1637792, -2.078223, 0, 1, 0.4705882, 1,
-0.2010761, -1.437597, -3.699083, 0, 1, 0.4784314, 1,
-0.2006731, -0.8222654, -4.060619, 0, 1, 0.4823529, 1,
-0.1988171, 1.095181, 0.06701303, 0, 1, 0.4901961, 1,
-0.1967777, -0.05834258, -0.5505269, 0, 1, 0.4941176, 1,
-0.1950157, -1.325196, -3.440668, 0, 1, 0.5019608, 1,
-0.1782942, -0.3058241, -4.60071, 0, 1, 0.509804, 1,
-0.1761452, 0.6618413, 0.2699907, 0, 1, 0.5137255, 1,
-0.1759203, 1.236235, -0.184085, 0, 1, 0.5215687, 1,
-0.1743711, 1.623901, -1.016844, 0, 1, 0.5254902, 1,
-0.173131, -0.01457888, -2.013955, 0, 1, 0.5333334, 1,
-0.1685928, -0.1645832, -2.726796, 0, 1, 0.5372549, 1,
-0.1655104, -2.152359, -3.028752, 0, 1, 0.5450981, 1,
-0.1651269, -0.9640171, -4.922916, 0, 1, 0.5490196, 1,
-0.1595402, 0.3028439, -0.08397333, 0, 1, 0.5568628, 1,
-0.1483682, 0.6524053, -0.39758, 0, 1, 0.5607843, 1,
-0.1477102, -0.4329232, -3.212175, 0, 1, 0.5686275, 1,
-0.1463699, 1.640828, -0.9580337, 0, 1, 0.572549, 1,
-0.146064, -0.08900888, -0.2007005, 0, 1, 0.5803922, 1,
-0.1458737, -0.07378487, -0.3694529, 0, 1, 0.5843138, 1,
-0.1438716, 0.9533502, -0.2657981, 0, 1, 0.5921569, 1,
-0.1418318, -0.4590799, -0.655313, 0, 1, 0.5960785, 1,
-0.1416378, -1.116951, -1.89731, 0, 1, 0.6039216, 1,
-0.1401882, 0.3222417, -0.189849, 0, 1, 0.6117647, 1,
-0.1386089, 0.7743796, -0.5203385, 0, 1, 0.6156863, 1,
-0.1378489, 1.068722, -1.372406, 0, 1, 0.6235294, 1,
-0.134067, -0.7902059, -3.813514, 0, 1, 0.627451, 1,
-0.1286247, 0.0800295, -1.483874, 0, 1, 0.6352941, 1,
-0.1262401, -0.1072294, -2.747791, 0, 1, 0.6392157, 1,
-0.1237678, 0.360762, -2.160196, 0, 1, 0.6470588, 1,
-0.1212344, 0.8316999, -0.6991551, 0, 1, 0.6509804, 1,
-0.1211007, -0.9249486, -3.148158, 0, 1, 0.6588235, 1,
-0.1199203, 1.183724, -1.510262, 0, 1, 0.6627451, 1,
-0.1153949, -1.963367, -1.513341, 0, 1, 0.6705883, 1,
-0.1133081, -0.3036685, -3.231302, 0, 1, 0.6745098, 1,
-0.1110632, -0.7499092, -1.375741, 0, 1, 0.682353, 1,
-0.1098963, -1.604864, -4.385214, 0, 1, 0.6862745, 1,
-0.1079747, -0.2059191, -3.379222, 0, 1, 0.6941177, 1,
-0.1045818, -0.5891315, -3.306547, 0, 1, 0.7019608, 1,
-0.1000347, -1.273556, -3.021748, 0, 1, 0.7058824, 1,
-0.09818568, 0.3720895, -0.1995801, 0, 1, 0.7137255, 1,
-0.09438021, -1.129718, -2.723526, 0, 1, 0.7176471, 1,
-0.09279706, 0.123918, -2.650082, 0, 1, 0.7254902, 1,
-0.09275254, -0.4404687, -4.524811, 0, 1, 0.7294118, 1,
-0.09239297, 0.496681, 0.6663697, 0, 1, 0.7372549, 1,
-0.08886717, 0.6509648, -1.473059, 0, 1, 0.7411765, 1,
-0.08495209, 0.1185139, -1.402595, 0, 1, 0.7490196, 1,
-0.0767379, -0.9097253, -3.482874, 0, 1, 0.7529412, 1,
-0.0683114, 1.039652, -0.8822888, 0, 1, 0.7607843, 1,
-0.06640878, -0.5531117, -5.036519, 0, 1, 0.7647059, 1,
-0.06580596, 1.090809, -1.178723, 0, 1, 0.772549, 1,
-0.06240133, 1.465392, -0.9353238, 0, 1, 0.7764706, 1,
-0.06004094, -1.093209, -3.573552, 0, 1, 0.7843137, 1,
-0.05853972, -1.295423, -3.509402, 0, 1, 0.7882353, 1,
-0.05582063, -0.6156268, -2.508498, 0, 1, 0.7960784, 1,
-0.05551171, 0.7021116, -1.582885, 0, 1, 0.8039216, 1,
-0.05222837, 1.759715, -1.056876, 0, 1, 0.8078431, 1,
-0.04969768, 1.039107, 1.748466, 0, 1, 0.8156863, 1,
-0.04942675, 0.6544056, -1.414337, 0, 1, 0.8196079, 1,
-0.04236887, 0.6380859, -1.46782, 0, 1, 0.827451, 1,
-0.04214168, 0.2911575, -1.93746, 0, 1, 0.8313726, 1,
-0.0383905, 0.3313294, -1.924766, 0, 1, 0.8392157, 1,
-0.03303535, -2.06954, -2.380109, 0, 1, 0.8431373, 1,
-0.03235063, 0.6204036, 0.03989552, 0, 1, 0.8509804, 1,
-0.02968952, -1.131953, -1.226423, 0, 1, 0.854902, 1,
-0.02101371, 0.9222946, -0.6636074, 0, 1, 0.8627451, 1,
-0.01928145, 2.706563, 0.02150255, 0, 1, 0.8666667, 1,
-0.01836069, -0.8043228, -3.33259, 0, 1, 0.8745098, 1,
-0.01637196, 0.07610749, -0.2407394, 0, 1, 0.8784314, 1,
-0.01551215, -0.9529934, -2.551611, 0, 1, 0.8862745, 1,
-0.01466057, 0.6145323, 0.3626089, 0, 1, 0.8901961, 1,
-0.01184825, 0.3960901, 0.1167538, 0, 1, 0.8980392, 1,
-0.01138984, 0.5970821, 0.4865475, 0, 1, 0.9058824, 1,
-0.01131112, 0.3904213, 0.2457196, 0, 1, 0.9098039, 1,
-0.004406846, 0.007622984, 0.7694978, 0, 1, 0.9176471, 1,
-0.00232935, -0.7717598, -2.795653, 0, 1, 0.9215686, 1,
-0.0007279682, 0.6363643, -0.6214619, 0, 1, 0.9294118, 1,
0.0007588384, -0.5633485, 2.325672, 0, 1, 0.9333333, 1,
0.00438994, -1.978417, 0.3956842, 0, 1, 0.9411765, 1,
0.004938907, -0.0639691, 3.104519, 0, 1, 0.945098, 1,
0.005054037, -1.398451, 3.413681, 0, 1, 0.9529412, 1,
0.00737587, 0.6263801, -0.4185666, 0, 1, 0.9568627, 1,
0.009567077, 0.5043866, 0.3587508, 0, 1, 0.9647059, 1,
0.01025986, -0.3111128, 2.616561, 0, 1, 0.9686275, 1,
0.01070363, -1.440101, 0.962008, 0, 1, 0.9764706, 1,
0.01173478, -0.01887731, 1.909513, 0, 1, 0.9803922, 1,
0.01232674, 0.3238179, 2.394479, 0, 1, 0.9882353, 1,
0.02194769, 0.7182077, 0.6313521, 0, 1, 0.9921569, 1,
0.02282543, -0.3969519, 2.283134, 0, 1, 1, 1,
0.02508152, 1.159791, -0.9973255, 0, 0.9921569, 1, 1,
0.02694383, 0.7658157, -0.3477228, 0, 0.9882353, 1, 1,
0.03335081, -0.2059567, 1.469022, 0, 0.9803922, 1, 1,
0.03403533, 1.28892, 2.381705, 0, 0.9764706, 1, 1,
0.03461902, -1.685499, 4.637975, 0, 0.9686275, 1, 1,
0.0386773, -0.4989544, 5.070691, 0, 0.9647059, 1, 1,
0.03933787, 1.853038, -0.6194839, 0, 0.9568627, 1, 1,
0.03982179, 1.630234, -0.3173621, 0, 0.9529412, 1, 1,
0.04234498, 0.2924767, 0.747615, 0, 0.945098, 1, 1,
0.04348202, 1.327371, 0.8433566, 0, 0.9411765, 1, 1,
0.04581482, -0.2657124, 1.695366, 0, 0.9333333, 1, 1,
0.05583558, -0.6901581, 4.314775, 0, 0.9294118, 1, 1,
0.05720261, -0.929194, 0.9444453, 0, 0.9215686, 1, 1,
0.05821427, 0.8370708, -1.824635, 0, 0.9176471, 1, 1,
0.06614302, -1.270044, 1.992514, 0, 0.9098039, 1, 1,
0.06648885, -0.7065679, 3.58691, 0, 0.9058824, 1, 1,
0.06907355, -0.003208538, 2.183169, 0, 0.8980392, 1, 1,
0.07518443, -0.8727545, 3.818276, 0, 0.8901961, 1, 1,
0.07796961, 0.3460858, 0.3622403, 0, 0.8862745, 1, 1,
0.0780305, -0.1427803, 2.324722, 0, 0.8784314, 1, 1,
0.07871286, 0.1341536, 1.743355, 0, 0.8745098, 1, 1,
0.07883181, -0.7511674, 2.246013, 0, 0.8666667, 1, 1,
0.08014091, 0.7538038, 0.3471163, 0, 0.8627451, 1, 1,
0.08310445, 0.001144735, 1.625183, 0, 0.854902, 1, 1,
0.08488333, 0.5048428, -0.2559662, 0, 0.8509804, 1, 1,
0.08672429, -0.9924423, 2.906639, 0, 0.8431373, 1, 1,
0.08699585, -0.9422972, 2.834389, 0, 0.8392157, 1, 1,
0.08768598, 1.085774, 0.8530222, 0, 0.8313726, 1, 1,
0.08871581, 0.1828247, -1.265436, 0, 0.827451, 1, 1,
0.08886164, -0.04808939, 0.3294381, 0, 0.8196079, 1, 1,
0.09182427, -0.3444776, 2.409431, 0, 0.8156863, 1, 1,
0.09464663, -1.735044, 3.116464, 0, 0.8078431, 1, 1,
0.09821999, -0.176738, 1.749974, 0, 0.8039216, 1, 1,
0.1011069, 0.1912446, -0.4510798, 0, 0.7960784, 1, 1,
0.1013278, -0.3536671, 2.498392, 0, 0.7882353, 1, 1,
0.1036113, 0.2616823, 1.28272, 0, 0.7843137, 1, 1,
0.1114239, -1.088826, 3.333058, 0, 0.7764706, 1, 1,
0.1167937, 1.160348, 0.898466, 0, 0.772549, 1, 1,
0.1201247, -0.9740599, 2.351233, 0, 0.7647059, 1, 1,
0.121249, 0.4082026, -0.1231541, 0, 0.7607843, 1, 1,
0.1239785, -0.2663829, 1.307398, 0, 0.7529412, 1, 1,
0.1329731, 0.3450693, -0.3887559, 0, 0.7490196, 1, 1,
0.1340596, 0.6484263, 0.4623173, 0, 0.7411765, 1, 1,
0.1376987, 1.104586, 0.6431752, 0, 0.7372549, 1, 1,
0.1404404, 0.3319167, 1.305643, 0, 0.7294118, 1, 1,
0.1408, 0.1372491, 0.1776846, 0, 0.7254902, 1, 1,
0.1426149, -0.3579497, 1.842967, 0, 0.7176471, 1, 1,
0.1427627, 0.1066693, 3.661602, 0, 0.7137255, 1, 1,
0.1459784, 1.938584, 0.2914845, 0, 0.7058824, 1, 1,
0.1498103, -1.015563, 2.664278, 0, 0.6980392, 1, 1,
0.1508102, -0.3851121, 0.991822, 0, 0.6941177, 1, 1,
0.1511668, 0.08333495, 1.980041, 0, 0.6862745, 1, 1,
0.1522019, -1.428835, 2.540519, 0, 0.682353, 1, 1,
0.1537793, 1.401161, -0.5897191, 0, 0.6745098, 1, 1,
0.1537842, 0.1073465, 2.754208, 0, 0.6705883, 1, 1,
0.1566488, 1.270115, -0.05644114, 0, 0.6627451, 1, 1,
0.1578832, 0.5020533, -0.3736768, 0, 0.6588235, 1, 1,
0.1597498, 0.4254609, 0.1805834, 0, 0.6509804, 1, 1,
0.1611107, 0.182937, 2.277596, 0, 0.6470588, 1, 1,
0.1623562, 0.5695647, -0.493093, 0, 0.6392157, 1, 1,
0.1683995, 1.877382, -0.5309858, 0, 0.6352941, 1, 1,
0.1687119, -1.440822, 2.657327, 0, 0.627451, 1, 1,
0.1687182, -0.1579643, 1.871755, 0, 0.6235294, 1, 1,
0.1693161, -1.012961, 3.309582, 0, 0.6156863, 1, 1,
0.1703961, 0.2992136, 0.7253113, 0, 0.6117647, 1, 1,
0.1721831, -0.7374212, 2.435327, 0, 0.6039216, 1, 1,
0.1731045, 0.7330726, -0.9169703, 0, 0.5960785, 1, 1,
0.1767839, 0.8824732, -0.2067762, 0, 0.5921569, 1, 1,
0.1771265, 1.145607, 0.6925328, 0, 0.5843138, 1, 1,
0.1794009, 0.696135, -1.029926, 0, 0.5803922, 1, 1,
0.1815292, -0.1132609, 2.065691, 0, 0.572549, 1, 1,
0.1815467, 0.7941364, 1.240539, 0, 0.5686275, 1, 1,
0.195019, 0.1379427, 2.913999, 0, 0.5607843, 1, 1,
0.1999719, 0.1949754, 2.947543, 0, 0.5568628, 1, 1,
0.200425, -0.6067088, 1.463684, 0, 0.5490196, 1, 1,
0.2004462, -0.1669841, 2.400531, 0, 0.5450981, 1, 1,
0.2018933, 0.3912871, 0.7296509, 0, 0.5372549, 1, 1,
0.2023945, 0.3016725, 0.4933386, 0, 0.5333334, 1, 1,
0.2166058, 0.7185353, -2.274585, 0, 0.5254902, 1, 1,
0.2277211, -1.006045, 1.948075, 0, 0.5215687, 1, 1,
0.2303485, 0.3515561, 1.338051, 0, 0.5137255, 1, 1,
0.2339024, -0.0763142, 2.858678, 0, 0.509804, 1, 1,
0.239137, -0.839407, 4.182095, 0, 0.5019608, 1, 1,
0.2416943, 1.563031, 0.3915084, 0, 0.4941176, 1, 1,
0.242348, -1.746063, 2.679648, 0, 0.4901961, 1, 1,
0.2426792, 1.01754, 2.484277, 0, 0.4823529, 1, 1,
0.2439895, -0.6267182, 4.330215, 0, 0.4784314, 1, 1,
0.245362, 0.7642691, -0.7707663, 0, 0.4705882, 1, 1,
0.247735, 0.04124353, 2.130225, 0, 0.4666667, 1, 1,
0.251397, 0.8593721, -0.08600752, 0, 0.4588235, 1, 1,
0.2522393, -0.3772213, 1.701582, 0, 0.454902, 1, 1,
0.2544153, 0.3241628, 0.4942386, 0, 0.4470588, 1, 1,
0.2553416, -1.270651, 3.266742, 0, 0.4431373, 1, 1,
0.2572261, -2.159114, 3.049161, 0, 0.4352941, 1, 1,
0.2575953, 0.7232621, -0.3662049, 0, 0.4313726, 1, 1,
0.2582124, 0.4216809, -0.5236403, 0, 0.4235294, 1, 1,
0.2585722, 0.1329468, 2.277157, 0, 0.4196078, 1, 1,
0.27313, 1.717172, 0.9720492, 0, 0.4117647, 1, 1,
0.2737679, -1.004852, 2.808745, 0, 0.4078431, 1, 1,
0.2756106, 1.247729, 0.620586, 0, 0.4, 1, 1,
0.2781774, -0.02538578, 2.20264, 0, 0.3921569, 1, 1,
0.2793733, -1.327677, 2.981964, 0, 0.3882353, 1, 1,
0.2797839, -0.1894811, 2.26713, 0, 0.3803922, 1, 1,
0.2807277, 0.4299423, 1.435816, 0, 0.3764706, 1, 1,
0.2841303, 0.02130995, 1.499541, 0, 0.3686275, 1, 1,
0.2859483, -0.2067709, 1.763912, 0, 0.3647059, 1, 1,
0.290419, 1.227037, -0.9483309, 0, 0.3568628, 1, 1,
0.292387, 1.208525, -2.12828, 0, 0.3529412, 1, 1,
0.2947924, 0.7627562, 1.287516, 0, 0.345098, 1, 1,
0.2974553, 0.08218593, 2.629478, 0, 0.3411765, 1, 1,
0.2980681, -2.506783, 2.995311, 0, 0.3333333, 1, 1,
0.3030855, -1.399943, 3.315835, 0, 0.3294118, 1, 1,
0.3048127, -0.287746, 2.504402, 0, 0.3215686, 1, 1,
0.3071519, 0.7701598, 0.3981355, 0, 0.3176471, 1, 1,
0.30971, 0.5238076, -0.2761068, 0, 0.3098039, 1, 1,
0.3121132, 1.163694, 0.4725059, 0, 0.3058824, 1, 1,
0.3165682, -0.7226908, 2.120201, 0, 0.2980392, 1, 1,
0.3200136, 0.1295329, 0.09317113, 0, 0.2901961, 1, 1,
0.3211313, 0.2163251, 0.5003862, 0, 0.2862745, 1, 1,
0.3337455, 0.4067458, 2.449422, 0, 0.2784314, 1, 1,
0.3364517, 1.62393, 1.181759, 0, 0.2745098, 1, 1,
0.3367532, -2.155209, 4.11274, 0, 0.2666667, 1, 1,
0.3380067, -0.4846877, 0.5318184, 0, 0.2627451, 1, 1,
0.3409296, 0.4532556, 0.6965294, 0, 0.254902, 1, 1,
0.3447253, 2.282599, -0.008710491, 0, 0.2509804, 1, 1,
0.3469798, -2.071042, 3.600888, 0, 0.2431373, 1, 1,
0.3488118, -0.2868618, 0.7355639, 0, 0.2392157, 1, 1,
0.3490423, -0.8587214, 3.149515, 0, 0.2313726, 1, 1,
0.3518291, 0.6570799, 0.3196172, 0, 0.227451, 1, 1,
0.3528512, 1.372755, 1.149706, 0, 0.2196078, 1, 1,
0.3540777, -1.09665, 4.697759, 0, 0.2156863, 1, 1,
0.3546779, -0.2625818, 2.996862, 0, 0.2078431, 1, 1,
0.356288, 0.706806, 0.2852334, 0, 0.2039216, 1, 1,
0.3624301, -0.04618564, 1.430472, 0, 0.1960784, 1, 1,
0.3666565, -0.8840414, 2.089448, 0, 0.1882353, 1, 1,
0.369533, -1.453118, 3.246894, 0, 0.1843137, 1, 1,
0.3845414, -1.251355, 3.449143, 0, 0.1764706, 1, 1,
0.3856162, 0.671495, 0.9408985, 0, 0.172549, 1, 1,
0.3857733, -1.024989, 4.125464, 0, 0.1647059, 1, 1,
0.3887159, -1.512916, 4.175761, 0, 0.1607843, 1, 1,
0.3953594, -0.2589302, 2.426998, 0, 0.1529412, 1, 1,
0.3962408, -0.8983908, 0.8592156, 0, 0.1490196, 1, 1,
0.4053515, -0.0894535, 2.208789, 0, 0.1411765, 1, 1,
0.407753, -1.479714, 3.45926, 0, 0.1372549, 1, 1,
0.4099544, -0.7314928, 1.240996, 0, 0.1294118, 1, 1,
0.4150129, -0.690865, 1.022398, 0, 0.1254902, 1, 1,
0.4181892, 1.091931, 1.77695, 0, 0.1176471, 1, 1,
0.4305167, 0.1970786, 1.257577, 0, 0.1137255, 1, 1,
0.4337112, -0.01002842, 1.772284, 0, 0.1058824, 1, 1,
0.4421866, -0.9560822, 2.732919, 0, 0.09803922, 1, 1,
0.4461317, -1.129456, 1.264857, 0, 0.09411765, 1, 1,
0.4469595, -0.667659, 2.635475, 0, 0.08627451, 1, 1,
0.4495005, 0.09929846, 1.400184, 0, 0.08235294, 1, 1,
0.45555, -0.6282393, 1.277622, 0, 0.07450981, 1, 1,
0.4555608, 0.2037956, -0.5872233, 0, 0.07058824, 1, 1,
0.4557931, 0.6895418, 0.5931127, 0, 0.0627451, 1, 1,
0.4560245, -1.269081, 3.863361, 0, 0.05882353, 1, 1,
0.4567268, 0.1698831, 0.732542, 0, 0.05098039, 1, 1,
0.4616301, 1.304162, 0.5076017, 0, 0.04705882, 1, 1,
0.4628998, 0.7369055, -1.787222, 0, 0.03921569, 1, 1,
0.4643498, -1.740512, 2.205758, 0, 0.03529412, 1, 1,
0.4651085, 1.504222, 1.016229, 0, 0.02745098, 1, 1,
0.4659697, -0.6611975, 2.321399, 0, 0.02352941, 1, 1,
0.4665394, -0.2413186, 2.283516, 0, 0.01568628, 1, 1,
0.467618, 0.09432786, 0.3860089, 0, 0.01176471, 1, 1,
0.4702974, 1.725689, -0.211762, 0, 0.003921569, 1, 1,
0.4705462, 0.2799525, 1.945848, 0.003921569, 0, 1, 1,
0.4731217, -0.4369513, 1.735072, 0.007843138, 0, 1, 1,
0.4748423, -0.3314652, 2.457536, 0.01568628, 0, 1, 1,
0.4750614, 1.108373, 1.432693, 0.01960784, 0, 1, 1,
0.4772157, 0.5216191, -0.443032, 0.02745098, 0, 1, 1,
0.4813396, -0.06274779, 2.971743, 0.03137255, 0, 1, 1,
0.4823591, 0.8486131, 0.02075265, 0.03921569, 0, 1, 1,
0.4827617, -0.1721734, 2.875253, 0.04313726, 0, 1, 1,
0.4889345, -1.837647, 4.253963, 0.05098039, 0, 1, 1,
0.4902688, -0.2036606, 1.641245, 0.05490196, 0, 1, 1,
0.4925876, -0.550919, 0.7458743, 0.0627451, 0, 1, 1,
0.496202, 0.003619944, 2.61057, 0.06666667, 0, 1, 1,
0.4970144, -0.5505443, 2.922765, 0.07450981, 0, 1, 1,
0.4981572, -1.446114, 1.805905, 0.07843138, 0, 1, 1,
0.4996193, -0.9075053, 0.5180479, 0.08627451, 0, 1, 1,
0.5006736, -0.9965141, 1.952307, 0.09019608, 0, 1, 1,
0.5012286, 2.031882, 2.428651, 0.09803922, 0, 1, 1,
0.5023301, 0.6438304, -0.147786, 0.1058824, 0, 1, 1,
0.5030619, -0.2809432, 3.078973, 0.1098039, 0, 1, 1,
0.5063907, -1.257756, 2.626245, 0.1176471, 0, 1, 1,
0.506402, 1.283219, -0.9502838, 0.1215686, 0, 1, 1,
0.5199748, -0.05590788, 0.0709397, 0.1294118, 0, 1, 1,
0.5216919, 0.6191078, 0.5002851, 0.1333333, 0, 1, 1,
0.523438, -0.9798151, 3.07649, 0.1411765, 0, 1, 1,
0.5257674, 0.9961528, 0.4344436, 0.145098, 0, 1, 1,
0.5365794, -0.4628082, 3.208555, 0.1529412, 0, 1, 1,
0.5375105, 0.7107326, 0.3205655, 0.1568628, 0, 1, 1,
0.5412304, -1.196967, 2.955079, 0.1647059, 0, 1, 1,
0.5425231, 0.1832496, 2.210497, 0.1686275, 0, 1, 1,
0.5426862, 0.1891711, -0.7296225, 0.1764706, 0, 1, 1,
0.556726, 0.436509, 1.901402, 0.1803922, 0, 1, 1,
0.5580876, -0.6485989, 1.852885, 0.1882353, 0, 1, 1,
0.5695543, 2.594103, -0.0260464, 0.1921569, 0, 1, 1,
0.5724869, -0.1392362, 2.093773, 0.2, 0, 1, 1,
0.5776494, 1.829375, -0.5615248, 0.2078431, 0, 1, 1,
0.5783072, -0.7518438, 1.241124, 0.2117647, 0, 1, 1,
0.5801042, 0.1699578, 1.971613, 0.2196078, 0, 1, 1,
0.5849981, -0.418765, 2.113196, 0.2235294, 0, 1, 1,
0.5867302, 1.571733, 0.225224, 0.2313726, 0, 1, 1,
0.5871124, -0.6796308, 1.403568, 0.2352941, 0, 1, 1,
0.5896264, -0.2869816, 1.805137, 0.2431373, 0, 1, 1,
0.604104, -0.4702229, 2.639143, 0.2470588, 0, 1, 1,
0.6067287, -1.044845, 2.798583, 0.254902, 0, 1, 1,
0.6122971, -2.159888, 2.522974, 0.2588235, 0, 1, 1,
0.6167307, -1.095762, 2.208024, 0.2666667, 0, 1, 1,
0.6183843, -1.657823, 2.711356, 0.2705882, 0, 1, 1,
0.6197503, 0.9688206, -0.6925414, 0.2784314, 0, 1, 1,
0.6202785, -0.3894494, 2.41697, 0.282353, 0, 1, 1,
0.6290835, -0.5412669, 1.994292, 0.2901961, 0, 1, 1,
0.6311288, 1.10812, 0.6168805, 0.2941177, 0, 1, 1,
0.6316891, -0.6157861, 3.992127, 0.3019608, 0, 1, 1,
0.6325332, 0.07005388, 3.410424, 0.3098039, 0, 1, 1,
0.6333891, -0.2570093, 0.6296799, 0.3137255, 0, 1, 1,
0.6368836, -0.5313429, 1.328125, 0.3215686, 0, 1, 1,
0.6396834, 2.306149, 0.5102053, 0.3254902, 0, 1, 1,
0.6462356, -1.13212, 2.484577, 0.3333333, 0, 1, 1,
0.6469197, -0.01919332, 1.526598, 0.3372549, 0, 1, 1,
0.6508632, -2.133557, 2.714278, 0.345098, 0, 1, 1,
0.6531372, -0.5925264, 1.646946, 0.3490196, 0, 1, 1,
0.6575343, -2.299329, 1.129056, 0.3568628, 0, 1, 1,
0.6576431, -0.3126984, 1.060847, 0.3607843, 0, 1, 1,
0.661031, 0.5028578, 0.7320014, 0.3686275, 0, 1, 1,
0.6631104, -0.1331269, 0.4823372, 0.372549, 0, 1, 1,
0.6631234, 0.2529182, 2.606246, 0.3803922, 0, 1, 1,
0.6644062, -0.5012603, 1.725148, 0.3843137, 0, 1, 1,
0.6657842, 1.018903, 1.332009, 0.3921569, 0, 1, 1,
0.6660468, -1.980756, 3.535072, 0.3960784, 0, 1, 1,
0.6675681, -0.9133378, 3.181496, 0.4039216, 0, 1, 1,
0.6773112, 0.5712605, -0.692044, 0.4117647, 0, 1, 1,
0.6830406, -0.4163764, 2.416436, 0.4156863, 0, 1, 1,
0.6834358, -0.2089367, 2.23421, 0.4235294, 0, 1, 1,
0.6844896, -1.057305, 1.724292, 0.427451, 0, 1, 1,
0.6856931, 1.031127, 2.751911, 0.4352941, 0, 1, 1,
0.6903124, -0.8289381, 1.475664, 0.4392157, 0, 1, 1,
0.6920483, -0.9082269, 2.353115, 0.4470588, 0, 1, 1,
0.6940243, -0.1706535, 1.872585, 0.4509804, 0, 1, 1,
0.6951006, -1.820307, 3.046113, 0.4588235, 0, 1, 1,
0.6973923, 0.8744369, 0.9692767, 0.4627451, 0, 1, 1,
0.7017918, 0.4604806, 1.597409, 0.4705882, 0, 1, 1,
0.7053907, 1.19752, 2.075017, 0.4745098, 0, 1, 1,
0.7060498, -0.2784845, 2.938441, 0.4823529, 0, 1, 1,
0.712304, 0.5462321, 1.874894, 0.4862745, 0, 1, 1,
0.7128266, -0.1267456, 1.671826, 0.4941176, 0, 1, 1,
0.7159336, -0.2301524, 1.17283, 0.5019608, 0, 1, 1,
0.7221484, -0.4520113, 1.972118, 0.5058824, 0, 1, 1,
0.7236422, -0.07610796, 1.349929, 0.5137255, 0, 1, 1,
0.7236536, 0.2659729, -0.151041, 0.5176471, 0, 1, 1,
0.728173, -1.108441, 1.157036, 0.5254902, 0, 1, 1,
0.7301964, 1.651098, 0.649555, 0.5294118, 0, 1, 1,
0.7315109, 0.03354688, 0.5101233, 0.5372549, 0, 1, 1,
0.7383797, 1.047051, 1.52426, 0.5411765, 0, 1, 1,
0.7412213, 0.267083, 0.4058363, 0.5490196, 0, 1, 1,
0.7434269, -0.08169487, 3.534056, 0.5529412, 0, 1, 1,
0.7447191, -1.63145, 2.613441, 0.5607843, 0, 1, 1,
0.7564014, 2.539945, -0.7671344, 0.5647059, 0, 1, 1,
0.7641059, 1.610969, 0.8461626, 0.572549, 0, 1, 1,
0.7658765, 0.1096225, 2.149285, 0.5764706, 0, 1, 1,
0.7661673, -0.09357952, 3.085382, 0.5843138, 0, 1, 1,
0.7673019, -0.2863584, 0.9563834, 0.5882353, 0, 1, 1,
0.7692741, 1.180858, 1.193723, 0.5960785, 0, 1, 1,
0.776992, -1.232663, -0.545508, 0.6039216, 0, 1, 1,
0.7799418, 0.4526665, 1.532074, 0.6078432, 0, 1, 1,
0.7805035, 1.629294, 0.7056231, 0.6156863, 0, 1, 1,
0.7896399, -0.4571686, 2.520293, 0.6196079, 0, 1, 1,
0.8016378, -0.2863886, 2.68681, 0.627451, 0, 1, 1,
0.8088689, -2.016314, 4.17021, 0.6313726, 0, 1, 1,
0.8090699, -1.14459, 2.567251, 0.6392157, 0, 1, 1,
0.8094418, -0.8820742, 1.75458, 0.6431373, 0, 1, 1,
0.8114141, -0.7057166, 1.964553, 0.6509804, 0, 1, 1,
0.8181593, 1.560315, -1.313073, 0.654902, 0, 1, 1,
0.8202274, -1.679202, 4.226536, 0.6627451, 0, 1, 1,
0.8216543, -0.9386007, 1.528154, 0.6666667, 0, 1, 1,
0.8238762, 0.1990534, 2.110026, 0.6745098, 0, 1, 1,
0.8261768, -0.292571, 2.668745, 0.6784314, 0, 1, 1,
0.8266808, -1.141008, 2.680748, 0.6862745, 0, 1, 1,
0.8290134, 0.08186763, 2.280005, 0.6901961, 0, 1, 1,
0.8312612, 1.133831, -0.1891373, 0.6980392, 0, 1, 1,
0.831947, -0.4098472, 2.518038, 0.7058824, 0, 1, 1,
0.8361604, 0.5710794, 2.941242, 0.7098039, 0, 1, 1,
0.8402163, -0.8715612, 3.260101, 0.7176471, 0, 1, 1,
0.8415708, 1.117508, -0.683504, 0.7215686, 0, 1, 1,
0.8445713, 0.05613541, 0.7827187, 0.7294118, 0, 1, 1,
0.8458668, -1.54226, 2.819695, 0.7333333, 0, 1, 1,
0.8532487, 0.3015936, 1.403836, 0.7411765, 0, 1, 1,
0.8540912, 0.44567, 0.7211843, 0.7450981, 0, 1, 1,
0.8556625, -1.110852, 3.524925, 0.7529412, 0, 1, 1,
0.8602105, 0.6954848, -0.17454, 0.7568628, 0, 1, 1,
0.8633977, 0.3923207, 2.163952, 0.7647059, 0, 1, 1,
0.864978, 1.134101, -0.1230043, 0.7686275, 0, 1, 1,
0.8654729, -0.1067281, 2.239203, 0.7764706, 0, 1, 1,
0.8677148, 0.4638193, 0.2791325, 0.7803922, 0, 1, 1,
0.8690846, 0.6553473, 0.4464485, 0.7882353, 0, 1, 1,
0.8717379, -0.4682353, 1.595428, 0.7921569, 0, 1, 1,
0.8759147, -0.270462, 4.042712, 0.8, 0, 1, 1,
0.878287, 0.5731462, 1.454613, 0.8078431, 0, 1, 1,
0.8818091, -0.2205392, 2.08363, 0.8117647, 0, 1, 1,
0.8841606, 0.8528777, 0.6756904, 0.8196079, 0, 1, 1,
0.8856089, -0.4547282, 3.469862, 0.8235294, 0, 1, 1,
0.8890396, 0.09689837, 1.369113, 0.8313726, 0, 1, 1,
0.8907028, -0.1783608, 2.815741, 0.8352941, 0, 1, 1,
0.8916299, 1.009119, 0.8395379, 0.8431373, 0, 1, 1,
0.8938101, -1.324035, 5.224605, 0.8470588, 0, 1, 1,
0.8981764, -0.6762842, 2.685197, 0.854902, 0, 1, 1,
0.9004458, -0.9289148, 2.529479, 0.8588235, 0, 1, 1,
0.9085679, -0.4813007, 2.311634, 0.8666667, 0, 1, 1,
0.9103936, -1.176912, 1.421019, 0.8705882, 0, 1, 1,
0.9116225, 0.1726563, 0.5928287, 0.8784314, 0, 1, 1,
0.9136235, 1.62045, -0.8680083, 0.8823529, 0, 1, 1,
0.9162207, 0.06463846, 1.261828, 0.8901961, 0, 1, 1,
0.9175754, -0.09986116, 1.777923, 0.8941177, 0, 1, 1,
0.9219158, 0.03768917, 2.189569, 0.9019608, 0, 1, 1,
0.9241078, 0.676313, 0.3245915, 0.9098039, 0, 1, 1,
0.9247444, -0.5889148, 1.321627, 0.9137255, 0, 1, 1,
0.937034, -1.223544, 3.549119, 0.9215686, 0, 1, 1,
0.941089, 1.073583, 1.08959, 0.9254902, 0, 1, 1,
0.9426985, 1.071282, -0.3628414, 0.9333333, 0, 1, 1,
0.9528545, 1.493131, 2.069524, 0.9372549, 0, 1, 1,
0.9536299, -0.577747, 2.548313, 0.945098, 0, 1, 1,
0.9546623, 2.204915, 1.949437, 0.9490196, 0, 1, 1,
0.95577, 0.08936045, 1.704687, 0.9568627, 0, 1, 1,
0.9574538, -0.6318798, 2.359372, 0.9607843, 0, 1, 1,
0.9652194, -0.7240767, 1.783382, 0.9686275, 0, 1, 1,
0.9670563, 1.982613, 0.5383116, 0.972549, 0, 1, 1,
0.9670649, -0.2612249, 0.6507947, 0.9803922, 0, 1, 1,
0.9733881, 0.1920379, 1.727447, 0.9843137, 0, 1, 1,
0.9759717, 0.9280161, 1.839317, 0.9921569, 0, 1, 1,
0.9800782, -1.222216, 0.5528317, 0.9960784, 0, 1, 1,
0.9936278, 0.03774272, 1.966174, 1, 0, 0.9960784, 1,
0.999394, 1.530823, 0.3238861, 1, 0, 0.9882353, 1,
1.000244, -1.559389, 2.236731, 1, 0, 0.9843137, 1,
1.000431, 0.9395131, 2.532429, 1, 0, 0.9764706, 1,
1.000443, -1.027212, 1.617862, 1, 0, 0.972549, 1,
1.002471, -0.2850615, 0.06911336, 1, 0, 0.9647059, 1,
1.002818, -0.65071, 1.254652, 1, 0, 0.9607843, 1,
1.009528, 1.785558, 0.05305631, 1, 0, 0.9529412, 1,
1.011391, 1.131073, -0.4901429, 1, 0, 0.9490196, 1,
1.014825, 0.7970948, 1.829893, 1, 0, 0.9411765, 1,
1.019654, -0.447179, 1.283921, 1, 0, 0.9372549, 1,
1.019905, -1.132576, 4.102927, 1, 0, 0.9294118, 1,
1.020924, -0.9801076, 1.18173, 1, 0, 0.9254902, 1,
1.023626, 0.05669241, 1.097028, 1, 0, 0.9176471, 1,
1.026881, -2.02731, -0.01472066, 1, 0, 0.9137255, 1,
1.028006, 2.806006, 0.9802529, 1, 0, 0.9058824, 1,
1.043967, 0.5177974, 0.1772957, 1, 0, 0.9019608, 1,
1.046412, -0.03933974, -0.6504783, 1, 0, 0.8941177, 1,
1.049653, -0.5551289, 1.281359, 1, 0, 0.8862745, 1,
1.050982, 1.194634, 3.498463, 1, 0, 0.8823529, 1,
1.061691, 0.5076922, 0.9910624, 1, 0, 0.8745098, 1,
1.071145, -1.184665, 2.476206, 1, 0, 0.8705882, 1,
1.071334, 0.1999632, 1.432818, 1, 0, 0.8627451, 1,
1.076791, -0.8121643, 2.3711, 1, 0, 0.8588235, 1,
1.084416, -0.2128416, 2.563034, 1, 0, 0.8509804, 1,
1.087875, 1.999223, 1.54488, 1, 0, 0.8470588, 1,
1.088097, -0.474023, 4.974243, 1, 0, 0.8392157, 1,
1.091707, -1.013974, 2.316259, 1, 0, 0.8352941, 1,
1.107015, 0.9694011, 0.7509678, 1, 0, 0.827451, 1,
1.110346, -0.5991794, 1.968994, 1, 0, 0.8235294, 1,
1.116249, -0.3784701, 1.493091, 1, 0, 0.8156863, 1,
1.117143, -0.3560881, 3.303252, 1, 0, 0.8117647, 1,
1.132395, -0.4945515, 1.389049, 1, 0, 0.8039216, 1,
1.134113, -1.731245, 3.134851, 1, 0, 0.7960784, 1,
1.136916, -1.784482, 2.823537, 1, 0, 0.7921569, 1,
1.146544, 0.1150067, 2.621414, 1, 0, 0.7843137, 1,
1.154723, 1.384059, 0.8895156, 1, 0, 0.7803922, 1,
1.157059, 0.04585287, 1.131257, 1, 0, 0.772549, 1,
1.166611, -1.171823, 3.424449, 1, 0, 0.7686275, 1,
1.167375, 0.8093084, 1.178653, 1, 0, 0.7607843, 1,
1.170997, -0.9315575, 3.653602, 1, 0, 0.7568628, 1,
1.177088, 0.6269947, 0.8094437, 1, 0, 0.7490196, 1,
1.179462, 0.8106248, 0.9718195, 1, 0, 0.7450981, 1,
1.184132, -1.92154, 2.681651, 1, 0, 0.7372549, 1,
1.193986, 1.284213, 1.162503, 1, 0, 0.7333333, 1,
1.19668, 1.133241, 0.05164258, 1, 0, 0.7254902, 1,
1.206588, 0.2485051, 1.304385, 1, 0, 0.7215686, 1,
1.206744, 0.6373802, 1.051422, 1, 0, 0.7137255, 1,
1.206809, 0.2771302, 1.961017, 1, 0, 0.7098039, 1,
1.210257, -0.4000171, 0.4324322, 1, 0, 0.7019608, 1,
1.210718, 0.5116753, 0.7909759, 1, 0, 0.6941177, 1,
1.211655, 0.2066611, -0.342447, 1, 0, 0.6901961, 1,
1.222174, 0.1763126, 1.661506, 1, 0, 0.682353, 1,
1.228687, 0.7875301, -1.163713, 1, 0, 0.6784314, 1,
1.230946, -1.839778, 1.168829, 1, 0, 0.6705883, 1,
1.235496, 1.655704, -0.652228, 1, 0, 0.6666667, 1,
1.239171, 0.9591409, 2.361711, 1, 0, 0.6588235, 1,
1.270019, -1.278475, 3.386428, 1, 0, 0.654902, 1,
1.27675, 0.04623306, 3.343966, 1, 0, 0.6470588, 1,
1.279015, 0.6749279, 2.743944, 1, 0, 0.6431373, 1,
1.28451, -0.3699604, 1.420048, 1, 0, 0.6352941, 1,
1.286095, 0.2119777, 1.380479, 1, 0, 0.6313726, 1,
1.30021, 0.4442293, 1.537299, 1, 0, 0.6235294, 1,
1.302986, -0.8309302, 1.976102, 1, 0, 0.6196079, 1,
1.303579, -0.2191093, 0.8119984, 1, 0, 0.6117647, 1,
1.306453, 1.210567, 1.804512, 1, 0, 0.6078432, 1,
1.315402, -0.5418808, 2.38655, 1, 0, 0.6, 1,
1.326119, -2.330331, 3.701076, 1, 0, 0.5921569, 1,
1.32777, 2.241751, 0.2188197, 1, 0, 0.5882353, 1,
1.330991, 0.1116958, 2.248772, 1, 0, 0.5803922, 1,
1.352303, -1.384502, 2.721388, 1, 0, 0.5764706, 1,
1.356704, -0.7498361, 2.862953, 1, 0, 0.5686275, 1,
1.362496, 0.4773412, 0.5468244, 1, 0, 0.5647059, 1,
1.36324, -1.543265, 1.650177, 1, 0, 0.5568628, 1,
1.36693, 0.1305654, 2.43587, 1, 0, 0.5529412, 1,
1.372744, -0.5097272, 1.498133, 1, 0, 0.5450981, 1,
1.375199, -0.9825948, 2.422501, 1, 0, 0.5411765, 1,
1.379212, -2.188437, 0.2446246, 1, 0, 0.5333334, 1,
1.381226, -0.4015971, 2.523842, 1, 0, 0.5294118, 1,
1.38404, 0.4018292, 0.5001079, 1, 0, 0.5215687, 1,
1.390141, 0.7265747, -1.455299, 1, 0, 0.5176471, 1,
1.391292, -0.7885371, 3.74298, 1, 0, 0.509804, 1,
1.402037, 0.09536217, -0.2476462, 1, 0, 0.5058824, 1,
1.420283, -0.5727924, 1.815166, 1, 0, 0.4980392, 1,
1.420702, 1.975821, 0.5372047, 1, 0, 0.4901961, 1,
1.43406, -0.6778122, 2.790041, 1, 0, 0.4862745, 1,
1.434295, 2.066432, -1.505023, 1, 0, 0.4784314, 1,
1.437108, 1.383015, 0.6902147, 1, 0, 0.4745098, 1,
1.437723, 1.598944, -0.7923301, 1, 0, 0.4666667, 1,
1.453711, -0.6690193, 1.558561, 1, 0, 0.4627451, 1,
1.455284, -0.3164962, 2.527141, 1, 0, 0.454902, 1,
1.459114, 0.3033696, 1.878455, 1, 0, 0.4509804, 1,
1.467003, 0.9081517, 1.104253, 1, 0, 0.4431373, 1,
1.469219, -0.5669574, 1.055642, 1, 0, 0.4392157, 1,
1.471942, 0.2924503, 1.482014, 1, 0, 0.4313726, 1,
1.473876, 0.9728345, 1.258332, 1, 0, 0.427451, 1,
1.476095, -1.388545, 2.056617, 1, 0, 0.4196078, 1,
1.483262, -0.9923153, 1.46242, 1, 0, 0.4156863, 1,
1.492744, 0.4699511, 1.499626, 1, 0, 0.4078431, 1,
1.494125, -0.07256111, 0.5533343, 1, 0, 0.4039216, 1,
1.495523, 0.4684989, 2.644453, 1, 0, 0.3960784, 1,
1.496709, -0.3284969, 3.267274, 1, 0, 0.3882353, 1,
1.515902, -1.234713, 2.752443, 1, 0, 0.3843137, 1,
1.523569, -0.5478076, 1.379939, 1, 0, 0.3764706, 1,
1.53049, -0.1739112, 2.107355, 1, 0, 0.372549, 1,
1.54667, 0.7848814, 0.9621763, 1, 0, 0.3647059, 1,
1.550217, 0.01026283, 2.746959, 1, 0, 0.3607843, 1,
1.569177, 0.2492949, 1.833851, 1, 0, 0.3529412, 1,
1.57329, 0.2330398, 2.003631, 1, 0, 0.3490196, 1,
1.579046, -1.471219, 3.279548, 1, 0, 0.3411765, 1,
1.57949, -1.049411, 2.777325, 1, 0, 0.3372549, 1,
1.58266, -0.2339838, 0.9612759, 1, 0, 0.3294118, 1,
1.589375, 0.06841466, 1.409088, 1, 0, 0.3254902, 1,
1.604108, 0.9572359, 1.693292, 1, 0, 0.3176471, 1,
1.614643, 0.09313939, 1.522341, 1, 0, 0.3137255, 1,
1.618625, -1.616744, 2.38114, 1, 0, 0.3058824, 1,
1.62545, 0.6989281, 1.07067, 1, 0, 0.2980392, 1,
1.63623, -0.8925664, 2.550469, 1, 0, 0.2941177, 1,
1.639431, -1.305028, 2.690612, 1, 0, 0.2862745, 1,
1.642362, -1.404894, 3.263698, 1, 0, 0.282353, 1,
1.661077, -1.7171, 3.632686, 1, 0, 0.2745098, 1,
1.661622, 2.115841, 0.1809859, 1, 0, 0.2705882, 1,
1.662595, 0.2637397, 0.8295705, 1, 0, 0.2627451, 1,
1.663205, 0.003616182, 1.725553, 1, 0, 0.2588235, 1,
1.668458, 1.619248, 0.8165595, 1, 0, 0.2509804, 1,
1.708123, -0.4980347, 2.785819, 1, 0, 0.2470588, 1,
1.72455, -0.5965422, 2.858077, 1, 0, 0.2392157, 1,
1.739101, -0.2675227, 1.52861, 1, 0, 0.2352941, 1,
1.807489, 0.1284312, 1.209878, 1, 0, 0.227451, 1,
1.812027, -0.159135, 1.750314, 1, 0, 0.2235294, 1,
1.812714, -0.6183838, 2.705358, 1, 0, 0.2156863, 1,
1.819219, 0.166152, 3.053584, 1, 0, 0.2117647, 1,
1.836251, -0.001704958, 3.175017, 1, 0, 0.2039216, 1,
1.851171, 0.7669496, 2.686736, 1, 0, 0.1960784, 1,
1.897831, 3.661302, 1.514244, 1, 0, 0.1921569, 1,
1.909541, -1.134129, 1.608149, 1, 0, 0.1843137, 1,
1.915726, 0.6190085, 3.042724, 1, 0, 0.1803922, 1,
1.920729, 0.2667772, 1.241376, 1, 0, 0.172549, 1,
1.935128, -0.7342824, 1.738326, 1, 0, 0.1686275, 1,
1.963474, -0.9306945, -0.1634778, 1, 0, 0.1607843, 1,
1.969284, 0.4188529, 1.655238, 1, 0, 0.1568628, 1,
1.992837, 0.7596809, 0.5771447, 1, 0, 0.1490196, 1,
2.022487, 0.3711009, 1.84486, 1, 0, 0.145098, 1,
2.033833, -0.3028805, 2.504074, 1, 0, 0.1372549, 1,
2.053247, 0.4284967, 1.394934, 1, 0, 0.1333333, 1,
2.121054, 1.643942, -0.6594076, 1, 0, 0.1254902, 1,
2.177177, -0.07961287, 2.899754, 1, 0, 0.1215686, 1,
2.202678, 0.1882751, 1.672606, 1, 0, 0.1137255, 1,
2.211951, 1.517714, 0.03063892, 1, 0, 0.1098039, 1,
2.234887, -0.08589823, 1.899984, 1, 0, 0.1019608, 1,
2.309035, -1.29398, 2.061519, 1, 0, 0.09411765, 1,
2.315758, 1.316467, 2.054052, 1, 0, 0.09019608, 1,
2.325705, 0.4145023, 1.918493, 1, 0, 0.08235294, 1,
2.33298, 0.7357332, 2.118948, 1, 0, 0.07843138, 1,
2.373189, 0.3566695, 1.678625, 1, 0, 0.07058824, 1,
2.383089, 0.9408912, 0.2402682, 1, 0, 0.06666667, 1,
2.475302, 0.2437805, 1.322688, 1, 0, 0.05882353, 1,
2.516842, 0.7206847, 1.886075, 1, 0, 0.05490196, 1,
2.530579, 0.2169261, 1.862728, 1, 0, 0.04705882, 1,
2.590696, 0.1145328, 0.7586032, 1, 0, 0.04313726, 1,
2.743877, -0.0165443, 0.6594353, 1, 0, 0.03529412, 1,
2.762834, 1.450352, 0.7064872, 1, 0, 0.03137255, 1,
2.77713, 0.04650875, 4.009731, 1, 0, 0.02352941, 1,
2.779304, 0.08997525, 0.2733666, 1, 0, 0.01960784, 1,
2.975449, 1.092261, 0.4422114, 1, 0, 0.01176471, 1,
3.345146, -0.05689343, 1.278813, 1, 0, 0.007843138, 1
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
-0.03325415, -4.109237, -7.005485, 0, -0.5, 0.5, 0.5,
-0.03325415, -4.109237, -7.005485, 1, -0.5, 0.5, 0.5,
-0.03325415, -4.109237, -7.005485, 1, 1.5, 0.5, 0.5,
-0.03325415, -4.109237, -7.005485, 0, 1.5, 0.5, 0.5
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
-4.556932, 0.3391391, -7.005485, 0, -0.5, 0.5, 0.5,
-4.556932, 0.3391391, -7.005485, 1, -0.5, 0.5, 0.5,
-4.556932, 0.3391391, -7.005485, 1, 1.5, 0.5, 0.5,
-4.556932, 0.3391391, -7.005485, 0, 1.5, 0.5, 0.5
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
-4.556932, -4.109237, -0.004163742, 0, -0.5, 0.5, 0.5,
-4.556932, -4.109237, -0.004163742, 1, -0.5, 0.5, 0.5,
-4.556932, -4.109237, -0.004163742, 1, 1.5, 0.5, 0.5,
-4.556932, -4.109237, -0.004163742, 0, 1.5, 0.5, 0.5
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
-3, -3.082689, -5.389796,
3, -3.082689, -5.389796,
-3, -3.082689, -5.389796,
-3, -3.25378, -5.659077,
-2, -3.082689, -5.389796,
-2, -3.25378, -5.659077,
-1, -3.082689, -5.389796,
-1, -3.25378, -5.659077,
0, -3.082689, -5.389796,
0, -3.25378, -5.659077,
1, -3.082689, -5.389796,
1, -3.25378, -5.659077,
2, -3.082689, -5.389796,
2, -3.25378, -5.659077,
3, -3.082689, -5.389796,
3, -3.25378, -5.659077
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
-3, -3.595963, -6.19764, 0, -0.5, 0.5, 0.5,
-3, -3.595963, -6.19764, 1, -0.5, 0.5, 0.5,
-3, -3.595963, -6.19764, 1, 1.5, 0.5, 0.5,
-3, -3.595963, -6.19764, 0, 1.5, 0.5, 0.5,
-2, -3.595963, -6.19764, 0, -0.5, 0.5, 0.5,
-2, -3.595963, -6.19764, 1, -0.5, 0.5, 0.5,
-2, -3.595963, -6.19764, 1, 1.5, 0.5, 0.5,
-2, -3.595963, -6.19764, 0, 1.5, 0.5, 0.5,
-1, -3.595963, -6.19764, 0, -0.5, 0.5, 0.5,
-1, -3.595963, -6.19764, 1, -0.5, 0.5, 0.5,
-1, -3.595963, -6.19764, 1, 1.5, 0.5, 0.5,
-1, -3.595963, -6.19764, 0, 1.5, 0.5, 0.5,
0, -3.595963, -6.19764, 0, -0.5, 0.5, 0.5,
0, -3.595963, -6.19764, 1, -0.5, 0.5, 0.5,
0, -3.595963, -6.19764, 1, 1.5, 0.5, 0.5,
0, -3.595963, -6.19764, 0, 1.5, 0.5, 0.5,
1, -3.595963, -6.19764, 0, -0.5, 0.5, 0.5,
1, -3.595963, -6.19764, 1, -0.5, 0.5, 0.5,
1, -3.595963, -6.19764, 1, 1.5, 0.5, 0.5,
1, -3.595963, -6.19764, 0, 1.5, 0.5, 0.5,
2, -3.595963, -6.19764, 0, -0.5, 0.5, 0.5,
2, -3.595963, -6.19764, 1, -0.5, 0.5, 0.5,
2, -3.595963, -6.19764, 1, 1.5, 0.5, 0.5,
2, -3.595963, -6.19764, 0, 1.5, 0.5, 0.5,
3, -3.595963, -6.19764, 0, -0.5, 0.5, 0.5,
3, -3.595963, -6.19764, 1, -0.5, 0.5, 0.5,
3, -3.595963, -6.19764, 1, 1.5, 0.5, 0.5,
3, -3.595963, -6.19764, 0, 1.5, 0.5, 0.5
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
-3.513006, -2, -5.389796,
-3.513006, 3, -5.389796,
-3.513006, -2, -5.389796,
-3.686994, -2, -5.659077,
-3.513006, -1, -5.389796,
-3.686994, -1, -5.659077,
-3.513006, 0, -5.389796,
-3.686994, 0, -5.659077,
-3.513006, 1, -5.389796,
-3.686994, 1, -5.659077,
-3.513006, 2, -5.389796,
-3.686994, 2, -5.659077,
-3.513006, 3, -5.389796,
-3.686994, 3, -5.659077
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
-4.034969, -2, -6.19764, 0, -0.5, 0.5, 0.5,
-4.034969, -2, -6.19764, 1, -0.5, 0.5, 0.5,
-4.034969, -2, -6.19764, 1, 1.5, 0.5, 0.5,
-4.034969, -2, -6.19764, 0, 1.5, 0.5, 0.5,
-4.034969, -1, -6.19764, 0, -0.5, 0.5, 0.5,
-4.034969, -1, -6.19764, 1, -0.5, 0.5, 0.5,
-4.034969, -1, -6.19764, 1, 1.5, 0.5, 0.5,
-4.034969, -1, -6.19764, 0, 1.5, 0.5, 0.5,
-4.034969, 0, -6.19764, 0, -0.5, 0.5, 0.5,
-4.034969, 0, -6.19764, 1, -0.5, 0.5, 0.5,
-4.034969, 0, -6.19764, 1, 1.5, 0.5, 0.5,
-4.034969, 0, -6.19764, 0, 1.5, 0.5, 0.5,
-4.034969, 1, -6.19764, 0, -0.5, 0.5, 0.5,
-4.034969, 1, -6.19764, 1, -0.5, 0.5, 0.5,
-4.034969, 1, -6.19764, 1, 1.5, 0.5, 0.5,
-4.034969, 1, -6.19764, 0, 1.5, 0.5, 0.5,
-4.034969, 2, -6.19764, 0, -0.5, 0.5, 0.5,
-4.034969, 2, -6.19764, 1, -0.5, 0.5, 0.5,
-4.034969, 2, -6.19764, 1, 1.5, 0.5, 0.5,
-4.034969, 2, -6.19764, 0, 1.5, 0.5, 0.5,
-4.034969, 3, -6.19764, 0, -0.5, 0.5, 0.5,
-4.034969, 3, -6.19764, 1, -0.5, 0.5, 0.5,
-4.034969, 3, -6.19764, 1, 1.5, 0.5, 0.5,
-4.034969, 3, -6.19764, 0, 1.5, 0.5, 0.5
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
-3.513006, -3.082689, -4,
-3.513006, -3.082689, 4,
-3.513006, -3.082689, -4,
-3.686994, -3.25378, -4,
-3.513006, -3.082689, -2,
-3.686994, -3.25378, -2,
-3.513006, -3.082689, 0,
-3.686994, -3.25378, 0,
-3.513006, -3.082689, 2,
-3.686994, -3.25378, 2,
-3.513006, -3.082689, 4,
-3.686994, -3.25378, 4
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
-4.034969, -3.595963, -4, 0, -0.5, 0.5, 0.5,
-4.034969, -3.595963, -4, 1, -0.5, 0.5, 0.5,
-4.034969, -3.595963, -4, 1, 1.5, 0.5, 0.5,
-4.034969, -3.595963, -4, 0, 1.5, 0.5, 0.5,
-4.034969, -3.595963, -2, 0, -0.5, 0.5, 0.5,
-4.034969, -3.595963, -2, 1, -0.5, 0.5, 0.5,
-4.034969, -3.595963, -2, 1, 1.5, 0.5, 0.5,
-4.034969, -3.595963, -2, 0, 1.5, 0.5, 0.5,
-4.034969, -3.595963, 0, 0, -0.5, 0.5, 0.5,
-4.034969, -3.595963, 0, 1, -0.5, 0.5, 0.5,
-4.034969, -3.595963, 0, 1, 1.5, 0.5, 0.5,
-4.034969, -3.595963, 0, 0, 1.5, 0.5, 0.5,
-4.034969, -3.595963, 2, 0, -0.5, 0.5, 0.5,
-4.034969, -3.595963, 2, 1, -0.5, 0.5, 0.5,
-4.034969, -3.595963, 2, 1, 1.5, 0.5, 0.5,
-4.034969, -3.595963, 2, 0, 1.5, 0.5, 0.5,
-4.034969, -3.595963, 4, 0, -0.5, 0.5, 0.5,
-4.034969, -3.595963, 4, 1, -0.5, 0.5, 0.5,
-4.034969, -3.595963, 4, 1, 1.5, 0.5, 0.5,
-4.034969, -3.595963, 4, 0, 1.5, 0.5, 0.5
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
-3.513006, -3.082689, -5.389796,
-3.513006, 3.760967, -5.389796,
-3.513006, -3.082689, 5.381468,
-3.513006, 3.760967, 5.381468,
-3.513006, -3.082689, -5.389796,
-3.513006, -3.082689, 5.381468,
-3.513006, 3.760967, -5.389796,
-3.513006, 3.760967, 5.381468,
-3.513006, -3.082689, -5.389796,
3.446498, -3.082689, -5.389796,
-3.513006, -3.082689, 5.381468,
3.446498, -3.082689, 5.381468,
-3.513006, 3.760967, -5.389796,
3.446498, 3.760967, -5.389796,
-3.513006, 3.760967, 5.381468,
3.446498, 3.760967, 5.381468,
3.446498, -3.082689, -5.389796,
3.446498, 3.760967, -5.389796,
3.446498, -3.082689, 5.381468,
3.446498, 3.760967, 5.381468,
3.446498, -3.082689, -5.389796,
3.446498, -3.082689, 5.381468,
3.446498, 3.760967, -5.389796,
3.446498, 3.760967, 5.381468
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
var radius = 7.761853;
var distance = 34.53336;
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
mvMatrix.translate( 0.03325415, -0.3391391, 0.004163742 );
mvMatrix.scale( 1.205871, 1.226284, 0.7791349 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.53336);
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
-3.411654, -0.7451801, -2.536314, 0, 0, 1, 1, 1,
-3.049016, 0.5124788, -1.745894, 1, 0, 0, 1, 1,
-2.946696, -0.3580265, 0.01712546, 1, 0, 0, 1, 1,
-2.534543, -1.052025, -2.96937, 1, 0, 0, 1, 1,
-2.514435, -0.01965585, -1.751252, 1, 0, 0, 1, 1,
-2.473652, -1.92564, -1.948073, 1, 0, 0, 1, 1,
-2.463867, 1.034142, 0.528776, 0, 0, 0, 1, 1,
-2.437868, 1.26319, -1.039381, 0, 0, 0, 1, 1,
-2.416548, 0.6184949, -0.1152098, 0, 0, 0, 1, 1,
-2.28415, -1.724138, -2.692535, 0, 0, 0, 1, 1,
-2.251326, 0.2677727, -1.645173, 0, 0, 0, 1, 1,
-2.222217, -1.009699, -3.227162, 0, 0, 0, 1, 1,
-2.22199, -0.1683434, -1.301713, 0, 0, 0, 1, 1,
-2.21365, -0.7964205, -2.322035, 1, 1, 1, 1, 1,
-2.136703, -0.6416679, -2.7867, 1, 1, 1, 1, 1,
-2.104273, 1.29294, -0.3943354, 1, 1, 1, 1, 1,
-2.081081, 1.964819, -1.187669, 1, 1, 1, 1, 1,
-2.026408, 0.1654547, -2.523746, 1, 1, 1, 1, 1,
-2.015126, -0.3838987, -1.594597, 1, 1, 1, 1, 1,
-1.998073, 0.2294491, 0.3256424, 1, 1, 1, 1, 1,
-1.988314, -0.04202644, -0.949661, 1, 1, 1, 1, 1,
-1.8996, 1.257403, -2.338511, 1, 1, 1, 1, 1,
-1.888496, -0.8758427, -0.1456384, 1, 1, 1, 1, 1,
-1.875209, -0.2336945, -0.7240909, 1, 1, 1, 1, 1,
-1.873915, 0.06211578, -2.149492, 1, 1, 1, 1, 1,
-1.867671, 0.4653687, -1.118263, 1, 1, 1, 1, 1,
-1.857376, 0.3933695, -0.7175929, 1, 1, 1, 1, 1,
-1.823655, -2.418164, -5.037436, 1, 1, 1, 1, 1,
-1.817742, -0.885927, -3.062768, 0, 0, 1, 1, 1,
-1.794201, 0.3925284, -0.9115239, 1, 0, 0, 1, 1,
-1.778997, 0.9821813, 0.6789452, 1, 0, 0, 1, 1,
-1.775167, -0.8834624, 0.08711994, 1, 0, 0, 1, 1,
-1.772212, -0.6176226, -3.417075, 1, 0, 0, 1, 1,
-1.765978, -1.317218, -2.836838, 1, 0, 0, 1, 1,
-1.758496, -0.711782, -3.700466, 0, 0, 0, 1, 1,
-1.743586, -0.4864462, -3.238722, 0, 0, 0, 1, 1,
-1.729384, -1.298684, -2.065071, 0, 0, 0, 1, 1,
-1.721809, -1.98274, -1.679206, 0, 0, 0, 1, 1,
-1.707264, 0.2114691, -1.083425, 0, 0, 0, 1, 1,
-1.69479, 0.1197377, -1.949561, 0, 0, 0, 1, 1,
-1.660672, -1.386285, -1.337887, 0, 0, 0, 1, 1,
-1.654765, 0.3924203, -0.1109218, 1, 1, 1, 1, 1,
-1.647977, 1.248789, -0.2443479, 1, 1, 1, 1, 1,
-1.641762, 0.9471281, -2.840313, 1, 1, 1, 1, 1,
-1.618063, 1.279435, -1.183216, 1, 1, 1, 1, 1,
-1.600963, -1.947463, -4.190535, 1, 1, 1, 1, 1,
-1.598634, -1.109002, -2.450135, 1, 1, 1, 1, 1,
-1.58799, 0.7982983, -1.934334, 1, 1, 1, 1, 1,
-1.586226, 0.7449838, -2.294035, 1, 1, 1, 1, 1,
-1.549892, 0.5427335, -0.8478923, 1, 1, 1, 1, 1,
-1.548828, 1.041697, -1.280068, 1, 1, 1, 1, 1,
-1.545576, 0.706918, -0.2099131, 1, 1, 1, 1, 1,
-1.512833, 2.086182, -0.6383958, 1, 1, 1, 1, 1,
-1.509125, 0.8982831, -2.63712, 1, 1, 1, 1, 1,
-1.495728, 0.08103891, -0.6732969, 1, 1, 1, 1, 1,
-1.492763, -0.7519751, -1.413954, 1, 1, 1, 1, 1,
-1.490425, -2.079995, -2.173318, 0, 0, 1, 1, 1,
-1.488678, -0.5437419, -1.670274, 1, 0, 0, 1, 1,
-1.475962, -0.4675035, -1.71112, 1, 0, 0, 1, 1,
-1.472829, 0.8640682, -1.829742, 1, 0, 0, 1, 1,
-1.465155, -0.915792, -0.4612029, 1, 0, 0, 1, 1,
-1.46382, 0.8071545, -1.865932, 1, 0, 0, 1, 1,
-1.460492, -0.5578586, -2.95885, 0, 0, 0, 1, 1,
-1.4535, -0.8905975, -1.284755, 0, 0, 0, 1, 1,
-1.433207, -0.3667123, -2.161847, 0, 0, 0, 1, 1,
-1.421333, -0.6639103, -1.948027, 0, 0, 0, 1, 1,
-1.416045, 0.1359625, -0.02962611, 0, 0, 0, 1, 1,
-1.411994, -0.7071106, -0.5004652, 0, 0, 0, 1, 1,
-1.403682, 1.578304, -0.9190757, 0, 0, 0, 1, 1,
-1.401512, -1.100723, -2.484229, 1, 1, 1, 1, 1,
-1.39289, 0.8836053, -0.6503831, 1, 1, 1, 1, 1,
-1.390337, 1.321205, 1.605263, 1, 1, 1, 1, 1,
-1.369545, -1.410795, -2.294905, 1, 1, 1, 1, 1,
-1.369301, -1.590412, -2.975717, 1, 1, 1, 1, 1,
-1.366511, 0.1623301, -3.143683, 1, 1, 1, 1, 1,
-1.346371, -0.3667749, -2.123001, 1, 1, 1, 1, 1,
-1.344146, -0.2850772, -2.402065, 1, 1, 1, 1, 1,
-1.329608, 0.1005182, -1.352457, 1, 1, 1, 1, 1,
-1.327811, -1.158378, -0.1145475, 1, 1, 1, 1, 1,
-1.316884, 1.432567, -1.090292, 1, 1, 1, 1, 1,
-1.300665, -0.2115581, -0.9406351, 1, 1, 1, 1, 1,
-1.276633, -0.249741, -1.212646, 1, 1, 1, 1, 1,
-1.262047, -0.1378612, -3.985408, 1, 1, 1, 1, 1,
-1.256863, 0.8859935, -2.149015, 1, 1, 1, 1, 1,
-1.251739, 1.288944, -0.4398179, 0, 0, 1, 1, 1,
-1.251572, -0.06457899, -2.20607, 1, 0, 0, 1, 1,
-1.250026, -0.8481254, -3.207865, 1, 0, 0, 1, 1,
-1.239059, -0.2512146, 0.08739512, 1, 0, 0, 1, 1,
-1.227825, -0.3787612, -1.249019, 1, 0, 0, 1, 1,
-1.227777, 0.1089763, -2.350137, 1, 0, 0, 1, 1,
-1.227125, -0.4829243, -1.116037, 0, 0, 0, 1, 1,
-1.22651, 0.7002589, -0.07371087, 0, 0, 0, 1, 1,
-1.224536, 2.049835, -1.187696, 0, 0, 0, 1, 1,
-1.224475, -0.6292472, -2.379439, 0, 0, 0, 1, 1,
-1.222448, 3.065216, -0.3582425, 0, 0, 0, 1, 1,
-1.222103, 0.2720117, -1.361221, 0, 0, 0, 1, 1,
-1.221566, -0.8731028, -2.430371, 0, 0, 0, 1, 1,
-1.21823, 0.9044057, -1.916393, 1, 1, 1, 1, 1,
-1.213024, -0.7511651, -4.074057, 1, 1, 1, 1, 1,
-1.21021, -0.5192887, -1.974741, 1, 1, 1, 1, 1,
-1.207903, 1.988357, 0.6310259, 1, 1, 1, 1, 1,
-1.201468, 1.565279, -0.3215089, 1, 1, 1, 1, 1,
-1.196051, -1.109105, -1.883715, 1, 1, 1, 1, 1,
-1.1905, 0.7937096, -0.752188, 1, 1, 1, 1, 1,
-1.185444, -0.263493, -2.688056, 1, 1, 1, 1, 1,
-1.183969, -0.8576691, -2.414549, 1, 1, 1, 1, 1,
-1.18294, -0.6454181, -4.7039, 1, 1, 1, 1, 1,
-1.172047, 0.3559456, -1.427419, 1, 1, 1, 1, 1,
-1.166818, -0.1921975, -1.361187, 1, 1, 1, 1, 1,
-1.161404, 0.936718, 0.8699769, 1, 1, 1, 1, 1,
-1.159871, -0.7958757, -1.955421, 1, 1, 1, 1, 1,
-1.156386, 0.6148162, -2.257755, 1, 1, 1, 1, 1,
-1.154661, 0.5674942, -0.3997127, 0, 0, 1, 1, 1,
-1.153228, -1.661722, -1.205618, 1, 0, 0, 1, 1,
-1.153022, 0.5108644, -1.976275, 1, 0, 0, 1, 1,
-1.146001, -1.545189, -0.506032, 1, 0, 0, 1, 1,
-1.140644, 1.980939, -1.967025, 1, 0, 0, 1, 1,
-1.134834, 0.2155474, -0.9174823, 1, 0, 0, 1, 1,
-1.134423, -0.2294772, -1.994499, 0, 0, 0, 1, 1,
-1.132001, -0.8645945, -2.282555, 0, 0, 0, 1, 1,
-1.130516, 0.2667309, -2.199699, 0, 0, 0, 1, 1,
-1.121768, 1.370582, 0.3025292, 0, 0, 0, 1, 1,
-1.117282, 0.6938463, -1.00194, 0, 0, 0, 1, 1,
-1.11165, 0.8279628, -1.585642, 0, 0, 0, 1, 1,
-1.110901, -0.9272052, -3.462986, 0, 0, 0, 1, 1,
-1.107781, 1.238867, -0.8107721, 1, 1, 1, 1, 1,
-1.104631, -1.745507, -2.5758, 1, 1, 1, 1, 1,
-1.100459, -2.781883, -1.239127, 1, 1, 1, 1, 1,
-1.099431, 0.1226002, -3.396345, 1, 1, 1, 1, 1,
-1.092875, 0.3248304, -1.577816, 1, 1, 1, 1, 1,
-1.091297, -1.536974, -4.404552, 1, 1, 1, 1, 1,
-1.085065, 0.5491784, -0.9486527, 1, 1, 1, 1, 1,
-1.080377, 0.4457529, -0.3709474, 1, 1, 1, 1, 1,
-1.072138, 0.456576, -2.516476, 1, 1, 1, 1, 1,
-1.071054, -2.983024, -3.505305, 1, 1, 1, 1, 1,
-1.065632, -0.2682827, -2.590954, 1, 1, 1, 1, 1,
-1.064963, -1.342623, -1.34585, 1, 1, 1, 1, 1,
-1.057184, -0.3531351, -0.6308841, 1, 1, 1, 1, 1,
-1.055797, 0.2735496, 0.2754095, 1, 1, 1, 1, 1,
-1.052276, 0.2646863, -0.4571135, 1, 1, 1, 1, 1,
-1.048481, -0.4200399, -1.30822, 0, 0, 1, 1, 1,
-1.041431, 0.6777424, -2.197089, 1, 0, 0, 1, 1,
-1.036269, -1.317542, -1.504339, 1, 0, 0, 1, 1,
-1.034028, 0.4599473, -1.961185, 1, 0, 0, 1, 1,
-1.032565, 0.6283091, -1.550432, 1, 0, 0, 1, 1,
-1.029676, -0.7855189, -3.239359, 1, 0, 0, 1, 1,
-1.024159, 0.9686992, -1.203594, 0, 0, 0, 1, 1,
-1.003141, 0.8093998, -2.369152, 0, 0, 0, 1, 1,
-1.003126, -0.2714861, -2.217915, 0, 0, 0, 1, 1,
-1.002769, -0.2564903, -1.871806, 0, 0, 0, 1, 1,
-1.002068, 0.1820283, -0.8315691, 0, 0, 0, 1, 1,
-0.9995939, -0.6931862, -3.343575, 0, 0, 0, 1, 1,
-0.9902205, 0.3063347, -0.0822845, 0, 0, 0, 1, 1,
-0.989443, 1.300465, -0.1230985, 1, 1, 1, 1, 1,
-0.9892508, -0.2806548, -2.482686, 1, 1, 1, 1, 1,
-0.9884349, 0.3844563, -1.082138, 1, 1, 1, 1, 1,
-0.9854645, 0.8557999, -0.4550228, 1, 1, 1, 1, 1,
-0.9839258, -1.14935, -2.534713, 1, 1, 1, 1, 1,
-0.9795344, 1.608633, -0.2199973, 1, 1, 1, 1, 1,
-0.9756542, -0.4348201, -2.315023, 1, 1, 1, 1, 1,
-0.9662318, -0.4717511, -0.3443968, 1, 1, 1, 1, 1,
-0.9660028, -0.2163358, -1.774599, 1, 1, 1, 1, 1,
-0.9440979, 0.3825101, -3.09123, 1, 1, 1, 1, 1,
-0.9347109, -0.3900635, -1.561543, 1, 1, 1, 1, 1,
-0.9305413, 0.7358789, -0.5784668, 1, 1, 1, 1, 1,
-0.9288811, -1.329107, -0.8903116, 1, 1, 1, 1, 1,
-0.9265351, -2.322056, -2.99687, 1, 1, 1, 1, 1,
-0.9220166, 2.481043, -2.404647, 1, 1, 1, 1, 1,
-0.9151387, -0.4772934, -1.743153, 0, 0, 1, 1, 1,
-0.9116077, -2.095282, -3.621528, 1, 0, 0, 1, 1,
-0.8951344, -0.2045945, -4.033241, 1, 0, 0, 1, 1,
-0.8901938, 0.6556051, -1.727403, 1, 0, 0, 1, 1,
-0.8831933, 0.0619025, -0.07859103, 1, 0, 0, 1, 1,
-0.8809274, 0.4106413, -1.389281, 1, 0, 0, 1, 1,
-0.8777012, 1.516018, 0.2098759, 0, 0, 0, 1, 1,
-0.872665, 0.07586839, -1.507908, 0, 0, 0, 1, 1,
-0.8688349, 0.6115203, -1.162072, 0, 0, 0, 1, 1,
-0.8669474, 0.04928252, -0.8689628, 0, 0, 0, 1, 1,
-0.8611761, 2.326844, -1.066009, 0, 0, 0, 1, 1,
-0.8591611, -0.2099005, -1.37752, 0, 0, 0, 1, 1,
-0.845722, 0.4151527, -0.1399006, 0, 0, 0, 1, 1,
-0.8419196, 0.1402958, 0.06343699, 1, 1, 1, 1, 1,
-0.8371687, 2.333112, -0.05058926, 1, 1, 1, 1, 1,
-0.8304239, -0.01297651, -1.360129, 1, 1, 1, 1, 1,
-0.8257045, 0.6718886, -1.138226, 1, 1, 1, 1, 1,
-0.8256552, 0.3832604, -0.3790953, 1, 1, 1, 1, 1,
-0.8243273, -1.525461, -2.456351, 1, 1, 1, 1, 1,
-0.82166, -1.935443, -3.530386, 1, 1, 1, 1, 1,
-0.8180603, 1.072952, -1.386073, 1, 1, 1, 1, 1,
-0.8153784, 0.09359764, -0.7811105, 1, 1, 1, 1, 1,
-0.8101713, -1.21539, -3.017152, 1, 1, 1, 1, 1,
-0.8027901, 0.5390018, -1.538751, 1, 1, 1, 1, 1,
-0.7960052, 0.290753, -0.6402639, 1, 1, 1, 1, 1,
-0.7948969, -0.4705675, -1.618362, 1, 1, 1, 1, 1,
-0.790511, 1.506634, -1.226431, 1, 1, 1, 1, 1,
-0.7864379, 0.1121679, -0.05805471, 1, 1, 1, 1, 1,
-0.7862688, 1.025275, -3.147441, 0, 0, 1, 1, 1,
-0.7855779, -0.2097464, -1.145156, 1, 0, 0, 1, 1,
-0.7854853, -0.5636933, -4.209423, 1, 0, 0, 1, 1,
-0.7699802, -0.2003521, -3.757846, 1, 0, 0, 1, 1,
-0.7698519, -0.2108071, -0.7700015, 1, 0, 0, 1, 1,
-0.7671967, -0.2277467, -2.02897, 1, 0, 0, 1, 1,
-0.7626225, 0.3626796, -0.5655195, 0, 0, 0, 1, 1,
-0.7625754, -0.4206973, -2.523152, 0, 0, 0, 1, 1,
-0.7613097, 1.415378, -1.58087, 0, 0, 0, 1, 1,
-0.7600028, -0.5613921, -2.581091, 0, 0, 0, 1, 1,
-0.7543693, -0.4646603, -1.847087, 0, 0, 0, 1, 1,
-0.7542872, 0.2953964, -0.4572818, 0, 0, 0, 1, 1,
-0.7535456, -0.2775542, -2.144024, 0, 0, 0, 1, 1,
-0.751449, 0.3096543, -1.620297, 1, 1, 1, 1, 1,
-0.7460709, 2.40104, 0.7233959, 1, 1, 1, 1, 1,
-0.742999, 0.7101709, -0.7445441, 1, 1, 1, 1, 1,
-0.7380947, -1.579115, -2.416702, 1, 1, 1, 1, 1,
-0.7370356, -0.2717007, -3.599168, 1, 1, 1, 1, 1,
-0.735667, -0.08904701, -2.019495, 1, 1, 1, 1, 1,
-0.73172, -0.6957158, -4.365466, 1, 1, 1, 1, 1,
-0.730997, 0.8581189, -1.199255, 1, 1, 1, 1, 1,
-0.7305073, -0.04884383, -3.723091, 1, 1, 1, 1, 1,
-0.7289312, 0.2379513, -2.035129, 1, 1, 1, 1, 1,
-0.7245625, 1.041879, -0.6432753, 1, 1, 1, 1, 1,
-0.7223719, 0.8255416, -0.9920494, 1, 1, 1, 1, 1,
-0.7179233, -0.7051821, -1.265687, 1, 1, 1, 1, 1,
-0.7154607, -0.06297451, -3.254664, 1, 1, 1, 1, 1,
-0.7146642, -1.661294, -2.317415, 1, 1, 1, 1, 1,
-0.7135838, 1.518629, 0.07766566, 0, 0, 1, 1, 1,
-0.7094432, 1.837741, -0.5130725, 1, 0, 0, 1, 1,
-0.7089101, 1.508611, -1.612772, 1, 0, 0, 1, 1,
-0.6969008, -0.4414828, -2.094308, 1, 0, 0, 1, 1,
-0.6965051, 0.6293179, -1.369273, 1, 0, 0, 1, 1,
-0.6952752, 0.4382435, 0.296945, 1, 0, 0, 1, 1,
-0.687577, 1.017702, -1.751884, 0, 0, 0, 1, 1,
-0.6846015, 0.04746475, 0.05491377, 0, 0, 0, 1, 1,
-0.6841108, -0.2677937, -0.9129866, 0, 0, 0, 1, 1,
-0.6803362, -0.4482804, -3.027878, 0, 0, 0, 1, 1,
-0.678123, -0.3812048, -0.8562136, 0, 0, 0, 1, 1,
-0.6778268, -0.09134834, -1.352094, 0, 0, 0, 1, 1,
-0.6757436, 0.2020783, -1.439286, 0, 0, 0, 1, 1,
-0.6643416, -1.863254, -3.239132, 1, 1, 1, 1, 1,
-0.6578785, -0.3157629, -3.497123, 1, 1, 1, 1, 1,
-0.657806, -0.4183055, -2.441769, 1, 1, 1, 1, 1,
-0.6569597, 0.3305108, -2.139831, 1, 1, 1, 1, 1,
-0.6537328, 1.451374, -0.4714453, 1, 1, 1, 1, 1,
-0.6529074, 0.05728633, 1.055275, 1, 1, 1, 1, 1,
-0.6483395, -0.04562544, -3.167752, 1, 1, 1, 1, 1,
-0.643611, -0.9360241, -1.420711, 1, 1, 1, 1, 1,
-0.6427865, 0.05430954, -2.116105, 1, 1, 1, 1, 1,
-0.641346, -0.4299562, -2.07973, 1, 1, 1, 1, 1,
-0.6409559, 0.7476244, 0.4622936, 1, 1, 1, 1, 1,
-0.6403832, -1.693133, -3.48338, 1, 1, 1, 1, 1,
-0.6303414, -0.2585878, -1.549492, 1, 1, 1, 1, 1,
-0.6268229, -0.1859062, -1.588737, 1, 1, 1, 1, 1,
-0.6258659, -0.738614, -2.559837, 1, 1, 1, 1, 1,
-0.6249934, 0.6554192, -0.2927644, 0, 0, 1, 1, 1,
-0.6191635, 1.291327, -1.656668, 1, 0, 0, 1, 1,
-0.6159452, -2.315278, -0.9723349, 1, 0, 0, 1, 1,
-0.6145932, 0.3437477, -2.850888, 1, 0, 0, 1, 1,
-0.6056224, -0.4059334, -1.416648, 1, 0, 0, 1, 1,
-0.5973736, 0.6847723, -0.2662557, 1, 0, 0, 1, 1,
-0.5971956, -0.3133416, -0.3353226, 0, 0, 0, 1, 1,
-0.597006, 0.6860098, -0.4785481, 0, 0, 0, 1, 1,
-0.5931516, 0.5647993, -0.683013, 0, 0, 0, 1, 1,
-0.5928692, -0.5827466, -3.125847, 0, 0, 0, 1, 1,
-0.5881515, -1.088204, -2.6387, 0, 0, 0, 1, 1,
-0.5831263, 0.7185654, -2.594463, 0, 0, 0, 1, 1,
-0.5824718, 0.3272071, -2.566618, 0, 0, 0, 1, 1,
-0.5812993, 1.795971, -0.4557621, 1, 1, 1, 1, 1,
-0.5803326, -0.4596641, -2.940266, 1, 1, 1, 1, 1,
-0.5789998, -0.1552533, 0.07918691, 1, 1, 1, 1, 1,
-0.5783505, -0.01182024, -0.6609248, 1, 1, 1, 1, 1,
-0.5782062, 0.3701914, -1.631928, 1, 1, 1, 1, 1,
-0.5767597, -0.283415, -2.165036, 1, 1, 1, 1, 1,
-0.5762762, 0.6408421, -1.398878, 1, 1, 1, 1, 1,
-0.5751464, -0.05243188, -2.221218, 1, 1, 1, 1, 1,
-0.5745842, 0.7234104, -0.8573209, 1, 1, 1, 1, 1,
-0.5690582, -0.9923264, -4.244954, 1, 1, 1, 1, 1,
-0.5674812, 0.1161226, -3.363753, 1, 1, 1, 1, 1,
-0.5671206, 0.519452, -0.852431, 1, 1, 1, 1, 1,
-0.5636081, -0.5958949, -3.103816, 1, 1, 1, 1, 1,
-0.5628726, 2.327977, -0.414574, 1, 1, 1, 1, 1,
-0.5601817, -1.084073, -1.974822, 1, 1, 1, 1, 1,
-0.5554605, -0.7009708, -0.8210487, 0, 0, 1, 1, 1,
-0.550882, 0.9070444, -0.1545676, 1, 0, 0, 1, 1,
-0.5504407, -1.16297, -2.407832, 1, 0, 0, 1, 1,
-0.5424018, -0.4187408, -1.384909, 1, 0, 0, 1, 1,
-0.5394015, -0.7444536, -1.241336, 1, 0, 0, 1, 1,
-0.5391193, -0.07681875, -1.051528, 1, 0, 0, 1, 1,
-0.5375363, -1.968519, -3.653931, 0, 0, 0, 1, 1,
-0.5284061, -1.243259, -2.603008, 0, 0, 0, 1, 1,
-0.5262848, 0.2436113, 0.9241704, 0, 0, 0, 1, 1,
-0.5194404, -0.1484407, -1.771943, 0, 0, 0, 1, 1,
-0.5160698, 0.03015408, -2.815202, 0, 0, 0, 1, 1,
-0.5154631, 0.6737978, 0.1323448, 0, 0, 0, 1, 1,
-0.5105889, 0.9729804, -1.04909, 0, 0, 0, 1, 1,
-0.5017172, 1.586342, 0.3741518, 1, 1, 1, 1, 1,
-0.4948539, 0.2421736, -0.420002, 1, 1, 1, 1, 1,
-0.4945605, 0.1931775, -1.72884, 1, 1, 1, 1, 1,
-0.4918938, 0.4056874, -1.403282, 1, 1, 1, 1, 1,
-0.4902332, 1.469052, 0.1451388, 1, 1, 1, 1, 1,
-0.4885212, 0.5671087, -1.709871, 1, 1, 1, 1, 1,
-0.4884412, 0.9148923, -1.285958, 1, 1, 1, 1, 1,
-0.4870051, -1.27603, -3.018742, 1, 1, 1, 1, 1,
-0.4813529, -0.06135125, 0.6486869, 1, 1, 1, 1, 1,
-0.4754055, 0.7811826, 0.3199049, 1, 1, 1, 1, 1,
-0.4721915, 0.6632253, -1.008417, 1, 1, 1, 1, 1,
-0.4718276, 0.7820054, 0.6854119, 1, 1, 1, 1, 1,
-0.4645715, 0.06668854, -1.530579, 1, 1, 1, 1, 1,
-0.4639297, 0.9720426, -1.388778, 1, 1, 1, 1, 1,
-0.46324, 1.65062, 2.20661, 1, 1, 1, 1, 1,
-0.4570786, 0.6728483, -1.449657, 0, 0, 1, 1, 1,
-0.4524491, 0.4182157, 0.1729493, 1, 0, 0, 1, 1,
-0.4519164, 0.7618421, -2.262515, 1, 0, 0, 1, 1,
-0.4495829, 0.2913982, -1.397279, 1, 0, 0, 1, 1,
-0.4477895, -0.5259219, -3.816739, 1, 0, 0, 1, 1,
-0.4411473, 1.158357, 0.4912866, 1, 0, 0, 1, 1,
-0.4383115, 1.536888, 0.2916246, 0, 0, 0, 1, 1,
-0.4376382, 2.174675, 0.4603726, 0, 0, 0, 1, 1,
-0.4344098, 0.5750039, -1.881999, 0, 0, 0, 1, 1,
-0.4307187, 1.125285, 0.04421119, 0, 0, 0, 1, 1,
-0.429535, 1.096967, 0.9164938, 0, 0, 0, 1, 1,
-0.4272878, -0.6012744, -3.522991, 0, 0, 0, 1, 1,
-0.4269128, 0.3201545, -0.2100363, 0, 0, 0, 1, 1,
-0.4267809, 0.3289809, 0.1040197, 1, 1, 1, 1, 1,
-0.4248987, -1.287832, -3.567334, 1, 1, 1, 1, 1,
-0.4196893, -0.8428306, -3.127263, 1, 1, 1, 1, 1,
-0.4185284, -0.9855942, -1.711037, 1, 1, 1, 1, 1,
-0.4182097, 2.233689, -1.520153, 1, 1, 1, 1, 1,
-0.4127595, 0.08282458, -2.058761, 1, 1, 1, 1, 1,
-0.4089581, -1.433702, -3.22053, 1, 1, 1, 1, 1,
-0.4061894, 0.2564996, -0.9967808, 1, 1, 1, 1, 1,
-0.4045121, 0.2057224, -1.527732, 1, 1, 1, 1, 1,
-0.4040429, -0.2950069, -0.9445816, 1, 1, 1, 1, 1,
-0.4015326, 0.001999787, -2.363465, 1, 1, 1, 1, 1,
-0.4008716, -0.4946145, -2.480457, 1, 1, 1, 1, 1,
-0.397868, 0.2992922, 0.7953194, 1, 1, 1, 1, 1,
-0.3970268, -2.228578, -2.750663, 1, 1, 1, 1, 1,
-0.3927402, -0.6656428, -3.048554, 1, 1, 1, 1, 1,
-0.391322, 1.071409, -0.2877113, 0, 0, 1, 1, 1,
-0.3879864, -0.688768, -4.785467, 1, 0, 0, 1, 1,
-0.3855486, 0.6768497, 0.3994401, 1, 0, 0, 1, 1,
-0.3829955, -0.2065255, -2.085893, 1, 0, 0, 1, 1,
-0.3815349, 0.7899168, -0.03091944, 1, 0, 0, 1, 1,
-0.3757265, 0.1412975, -1.173703, 1, 0, 0, 1, 1,
-0.3700626, 0.01088237, -1.399392, 0, 0, 0, 1, 1,
-0.3608457, 1.870681, 1.099052, 0, 0, 0, 1, 1,
-0.3592715, 0.3279254, -0.6495956, 0, 0, 0, 1, 1,
-0.3553527, -0.1564053, -1.215094, 0, 0, 0, 1, 1,
-0.3538071, -2.623689, -3.026235, 0, 0, 0, 1, 1,
-0.3537304, -1.464726, -3.316796, 0, 0, 0, 1, 1,
-0.3527223, -0.2110721, -1.549289, 0, 0, 0, 1, 1,
-0.3512813, 1.235664, 1.055809, 1, 1, 1, 1, 1,
-0.3495267, -1.081721, -1.941638, 1, 1, 1, 1, 1,
-0.3463197, 0.5571544, 0.5242537, 1, 1, 1, 1, 1,
-0.3461918, -0.1449997, -2.57533, 1, 1, 1, 1, 1,
-0.3451783, 0.6354595, -0.315279, 1, 1, 1, 1, 1,
-0.332704, -2.232052, -3.846213, 1, 1, 1, 1, 1,
-0.3313047, -0.07671068, -2.088663, 1, 1, 1, 1, 1,
-0.3291607, 0.2967417, 0.3641864, 1, 1, 1, 1, 1,
-0.3272191, -2.172761, -2.467699, 1, 1, 1, 1, 1,
-0.3230553, -0.7269049, -2.957083, 1, 1, 1, 1, 1,
-0.3226542, -0.115082, -1.219043, 1, 1, 1, 1, 1,
-0.3202868, -1.128781, -1.794915, 1, 1, 1, 1, 1,
-0.3197658, -0.01042915, -0.7958133, 1, 1, 1, 1, 1,
-0.3190482, 0.8938742, 0.8293976, 1, 1, 1, 1, 1,
-0.3186063, 0.6584805, -1.352775, 1, 1, 1, 1, 1,
-0.3181976, 0.362078, -1.50107, 0, 0, 1, 1, 1,
-0.3159155, 0.03351637, -0.9773868, 1, 0, 0, 1, 1,
-0.3139346, 1.504044, -0.5993478, 1, 0, 0, 1, 1,
-0.313714, 0.05550092, -1.828111, 1, 0, 0, 1, 1,
-0.3084023, -0.5664695, -4.570035, 1, 0, 0, 1, 1,
-0.3062455, 1.840565, -1.310782, 1, 0, 0, 1, 1,
-0.3044437, 1.055177, -0.1707833, 0, 0, 0, 1, 1,
-0.3037837, 1.811956, -0.9889395, 0, 0, 0, 1, 1,
-0.3033881, -0.5786243, -2.137232, 0, 0, 0, 1, 1,
-0.2988059, -0.9438691, -1.395886, 0, 0, 0, 1, 1,
-0.2956576, -0.07223749, -1.576026, 0, 0, 0, 1, 1,
-0.2801065, 1.074113, -0.6200231, 0, 0, 0, 1, 1,
-0.274276, 0.5659222, -1.21984, 0, 0, 0, 1, 1,
-0.2732604, -0.5936623, -2.148393, 1, 1, 1, 1, 1,
-0.2720352, -1.45229, -2.017119, 1, 1, 1, 1, 1,
-0.2680491, -0.4962883, -2.829629, 1, 1, 1, 1, 1,
-0.267273, -0.8291566, -2.628024, 1, 1, 1, 1, 1,
-0.2632824, -0.2474187, -1.436794, 1, 1, 1, 1, 1,
-0.2606869, -0.6566067, -2.808888, 1, 1, 1, 1, 1,
-0.2591805, 0.5227386, -0.1972446, 1, 1, 1, 1, 1,
-0.255184, -0.3181683, -1.531506, 1, 1, 1, 1, 1,
-0.2529407, -1.09985, -5.232933, 1, 1, 1, 1, 1,
-0.2520976, 1.422056, -0.2551474, 1, 1, 1, 1, 1,
-0.2492048, 0.5512041, -1.328873, 1, 1, 1, 1, 1,
-0.2475012, 0.04032282, -1.155285, 1, 1, 1, 1, 1,
-0.2468627, -0.34249, -1.62668, 1, 1, 1, 1, 1,
-0.2450654, -0.1224687, -0.3719877, 1, 1, 1, 1, 1,
-0.2433503, 0.287753, -0.7861381, 1, 1, 1, 1, 1,
-0.242395, -0.7363704, -1.82699, 0, 0, 1, 1, 1,
-0.2392644, 0.08105893, -2.402819, 1, 0, 0, 1, 1,
-0.2387336, -0.4340403, -2.135198, 1, 0, 0, 1, 1,
-0.2379579, 0.9895724, -0.3147768, 1, 0, 0, 1, 1,
-0.2269066, 0.2673993, -1.666346, 1, 0, 0, 1, 1,
-0.2249621, -0.7378032, -1.535506, 1, 0, 0, 1, 1,
-0.2244711, 1.894006, 0.5805368, 0, 0, 0, 1, 1,
-0.2228211, 0.283305, 1.132564, 0, 0, 0, 1, 1,
-0.219803, -0.290164, -1.645663, 0, 0, 0, 1, 1,
-0.2191467, 2.757295, 0.9969589, 0, 0, 0, 1, 1,
-0.2174369, -1.346338, -4.392336, 0, 0, 0, 1, 1,
-0.217154, -1.310614, -3.011874, 0, 0, 0, 1, 1,
-0.2168645, -0.1895813, -2.805096, 0, 0, 0, 1, 1,
-0.2166725, -0.2032467, -0.6434348, 1, 1, 1, 1, 1,
-0.2157822, -0.6042395, -3.788997, 1, 1, 1, 1, 1,
-0.2156444, 1.143096, -0.5432829, 1, 1, 1, 1, 1,
-0.2155849, -0.3667064, -4.320221, 1, 1, 1, 1, 1,
-0.2142092, -0.4273888, -2.807484, 1, 1, 1, 1, 1,
-0.2102681, 0.785919, 0.8134636, 1, 1, 1, 1, 1,
-0.2092972, 0.5652953, -2.305562, 1, 1, 1, 1, 1,
-0.2068503, 0.1637792, -2.078223, 1, 1, 1, 1, 1,
-0.2010761, -1.437597, -3.699083, 1, 1, 1, 1, 1,
-0.2006731, -0.8222654, -4.060619, 1, 1, 1, 1, 1,
-0.1988171, 1.095181, 0.06701303, 1, 1, 1, 1, 1,
-0.1967777, -0.05834258, -0.5505269, 1, 1, 1, 1, 1,
-0.1950157, -1.325196, -3.440668, 1, 1, 1, 1, 1,
-0.1782942, -0.3058241, -4.60071, 1, 1, 1, 1, 1,
-0.1761452, 0.6618413, 0.2699907, 1, 1, 1, 1, 1,
-0.1759203, 1.236235, -0.184085, 0, 0, 1, 1, 1,
-0.1743711, 1.623901, -1.016844, 1, 0, 0, 1, 1,
-0.173131, -0.01457888, -2.013955, 1, 0, 0, 1, 1,
-0.1685928, -0.1645832, -2.726796, 1, 0, 0, 1, 1,
-0.1655104, -2.152359, -3.028752, 1, 0, 0, 1, 1,
-0.1651269, -0.9640171, -4.922916, 1, 0, 0, 1, 1,
-0.1595402, 0.3028439, -0.08397333, 0, 0, 0, 1, 1,
-0.1483682, 0.6524053, -0.39758, 0, 0, 0, 1, 1,
-0.1477102, -0.4329232, -3.212175, 0, 0, 0, 1, 1,
-0.1463699, 1.640828, -0.9580337, 0, 0, 0, 1, 1,
-0.146064, -0.08900888, -0.2007005, 0, 0, 0, 1, 1,
-0.1458737, -0.07378487, -0.3694529, 0, 0, 0, 1, 1,
-0.1438716, 0.9533502, -0.2657981, 0, 0, 0, 1, 1,
-0.1418318, -0.4590799, -0.655313, 1, 1, 1, 1, 1,
-0.1416378, -1.116951, -1.89731, 1, 1, 1, 1, 1,
-0.1401882, 0.3222417, -0.189849, 1, 1, 1, 1, 1,
-0.1386089, 0.7743796, -0.5203385, 1, 1, 1, 1, 1,
-0.1378489, 1.068722, -1.372406, 1, 1, 1, 1, 1,
-0.134067, -0.7902059, -3.813514, 1, 1, 1, 1, 1,
-0.1286247, 0.0800295, -1.483874, 1, 1, 1, 1, 1,
-0.1262401, -0.1072294, -2.747791, 1, 1, 1, 1, 1,
-0.1237678, 0.360762, -2.160196, 1, 1, 1, 1, 1,
-0.1212344, 0.8316999, -0.6991551, 1, 1, 1, 1, 1,
-0.1211007, -0.9249486, -3.148158, 1, 1, 1, 1, 1,
-0.1199203, 1.183724, -1.510262, 1, 1, 1, 1, 1,
-0.1153949, -1.963367, -1.513341, 1, 1, 1, 1, 1,
-0.1133081, -0.3036685, -3.231302, 1, 1, 1, 1, 1,
-0.1110632, -0.7499092, -1.375741, 1, 1, 1, 1, 1,
-0.1098963, -1.604864, -4.385214, 0, 0, 1, 1, 1,
-0.1079747, -0.2059191, -3.379222, 1, 0, 0, 1, 1,
-0.1045818, -0.5891315, -3.306547, 1, 0, 0, 1, 1,
-0.1000347, -1.273556, -3.021748, 1, 0, 0, 1, 1,
-0.09818568, 0.3720895, -0.1995801, 1, 0, 0, 1, 1,
-0.09438021, -1.129718, -2.723526, 1, 0, 0, 1, 1,
-0.09279706, 0.123918, -2.650082, 0, 0, 0, 1, 1,
-0.09275254, -0.4404687, -4.524811, 0, 0, 0, 1, 1,
-0.09239297, 0.496681, 0.6663697, 0, 0, 0, 1, 1,
-0.08886717, 0.6509648, -1.473059, 0, 0, 0, 1, 1,
-0.08495209, 0.1185139, -1.402595, 0, 0, 0, 1, 1,
-0.0767379, -0.9097253, -3.482874, 0, 0, 0, 1, 1,
-0.0683114, 1.039652, -0.8822888, 0, 0, 0, 1, 1,
-0.06640878, -0.5531117, -5.036519, 1, 1, 1, 1, 1,
-0.06580596, 1.090809, -1.178723, 1, 1, 1, 1, 1,
-0.06240133, 1.465392, -0.9353238, 1, 1, 1, 1, 1,
-0.06004094, -1.093209, -3.573552, 1, 1, 1, 1, 1,
-0.05853972, -1.295423, -3.509402, 1, 1, 1, 1, 1,
-0.05582063, -0.6156268, -2.508498, 1, 1, 1, 1, 1,
-0.05551171, 0.7021116, -1.582885, 1, 1, 1, 1, 1,
-0.05222837, 1.759715, -1.056876, 1, 1, 1, 1, 1,
-0.04969768, 1.039107, 1.748466, 1, 1, 1, 1, 1,
-0.04942675, 0.6544056, -1.414337, 1, 1, 1, 1, 1,
-0.04236887, 0.6380859, -1.46782, 1, 1, 1, 1, 1,
-0.04214168, 0.2911575, -1.93746, 1, 1, 1, 1, 1,
-0.0383905, 0.3313294, -1.924766, 1, 1, 1, 1, 1,
-0.03303535, -2.06954, -2.380109, 1, 1, 1, 1, 1,
-0.03235063, 0.6204036, 0.03989552, 1, 1, 1, 1, 1,
-0.02968952, -1.131953, -1.226423, 0, 0, 1, 1, 1,
-0.02101371, 0.9222946, -0.6636074, 1, 0, 0, 1, 1,
-0.01928145, 2.706563, 0.02150255, 1, 0, 0, 1, 1,
-0.01836069, -0.8043228, -3.33259, 1, 0, 0, 1, 1,
-0.01637196, 0.07610749, -0.2407394, 1, 0, 0, 1, 1,
-0.01551215, -0.9529934, -2.551611, 1, 0, 0, 1, 1,
-0.01466057, 0.6145323, 0.3626089, 0, 0, 0, 1, 1,
-0.01184825, 0.3960901, 0.1167538, 0, 0, 0, 1, 1,
-0.01138984, 0.5970821, 0.4865475, 0, 0, 0, 1, 1,
-0.01131112, 0.3904213, 0.2457196, 0, 0, 0, 1, 1,
-0.004406846, 0.007622984, 0.7694978, 0, 0, 0, 1, 1,
-0.00232935, -0.7717598, -2.795653, 0, 0, 0, 1, 1,
-0.0007279682, 0.6363643, -0.6214619, 0, 0, 0, 1, 1,
0.0007588384, -0.5633485, 2.325672, 1, 1, 1, 1, 1,
0.00438994, -1.978417, 0.3956842, 1, 1, 1, 1, 1,
0.004938907, -0.0639691, 3.104519, 1, 1, 1, 1, 1,
0.005054037, -1.398451, 3.413681, 1, 1, 1, 1, 1,
0.00737587, 0.6263801, -0.4185666, 1, 1, 1, 1, 1,
0.009567077, 0.5043866, 0.3587508, 1, 1, 1, 1, 1,
0.01025986, -0.3111128, 2.616561, 1, 1, 1, 1, 1,
0.01070363, -1.440101, 0.962008, 1, 1, 1, 1, 1,
0.01173478, -0.01887731, 1.909513, 1, 1, 1, 1, 1,
0.01232674, 0.3238179, 2.394479, 1, 1, 1, 1, 1,
0.02194769, 0.7182077, 0.6313521, 1, 1, 1, 1, 1,
0.02282543, -0.3969519, 2.283134, 1, 1, 1, 1, 1,
0.02508152, 1.159791, -0.9973255, 1, 1, 1, 1, 1,
0.02694383, 0.7658157, -0.3477228, 1, 1, 1, 1, 1,
0.03335081, -0.2059567, 1.469022, 1, 1, 1, 1, 1,
0.03403533, 1.28892, 2.381705, 0, 0, 1, 1, 1,
0.03461902, -1.685499, 4.637975, 1, 0, 0, 1, 1,
0.0386773, -0.4989544, 5.070691, 1, 0, 0, 1, 1,
0.03933787, 1.853038, -0.6194839, 1, 0, 0, 1, 1,
0.03982179, 1.630234, -0.3173621, 1, 0, 0, 1, 1,
0.04234498, 0.2924767, 0.747615, 1, 0, 0, 1, 1,
0.04348202, 1.327371, 0.8433566, 0, 0, 0, 1, 1,
0.04581482, -0.2657124, 1.695366, 0, 0, 0, 1, 1,
0.05583558, -0.6901581, 4.314775, 0, 0, 0, 1, 1,
0.05720261, -0.929194, 0.9444453, 0, 0, 0, 1, 1,
0.05821427, 0.8370708, -1.824635, 0, 0, 0, 1, 1,
0.06614302, -1.270044, 1.992514, 0, 0, 0, 1, 1,
0.06648885, -0.7065679, 3.58691, 0, 0, 0, 1, 1,
0.06907355, -0.003208538, 2.183169, 1, 1, 1, 1, 1,
0.07518443, -0.8727545, 3.818276, 1, 1, 1, 1, 1,
0.07796961, 0.3460858, 0.3622403, 1, 1, 1, 1, 1,
0.0780305, -0.1427803, 2.324722, 1, 1, 1, 1, 1,
0.07871286, 0.1341536, 1.743355, 1, 1, 1, 1, 1,
0.07883181, -0.7511674, 2.246013, 1, 1, 1, 1, 1,
0.08014091, 0.7538038, 0.3471163, 1, 1, 1, 1, 1,
0.08310445, 0.001144735, 1.625183, 1, 1, 1, 1, 1,
0.08488333, 0.5048428, -0.2559662, 1, 1, 1, 1, 1,
0.08672429, -0.9924423, 2.906639, 1, 1, 1, 1, 1,
0.08699585, -0.9422972, 2.834389, 1, 1, 1, 1, 1,
0.08768598, 1.085774, 0.8530222, 1, 1, 1, 1, 1,
0.08871581, 0.1828247, -1.265436, 1, 1, 1, 1, 1,
0.08886164, -0.04808939, 0.3294381, 1, 1, 1, 1, 1,
0.09182427, -0.3444776, 2.409431, 1, 1, 1, 1, 1,
0.09464663, -1.735044, 3.116464, 0, 0, 1, 1, 1,
0.09821999, -0.176738, 1.749974, 1, 0, 0, 1, 1,
0.1011069, 0.1912446, -0.4510798, 1, 0, 0, 1, 1,
0.1013278, -0.3536671, 2.498392, 1, 0, 0, 1, 1,
0.1036113, 0.2616823, 1.28272, 1, 0, 0, 1, 1,
0.1114239, -1.088826, 3.333058, 1, 0, 0, 1, 1,
0.1167937, 1.160348, 0.898466, 0, 0, 0, 1, 1,
0.1201247, -0.9740599, 2.351233, 0, 0, 0, 1, 1,
0.121249, 0.4082026, -0.1231541, 0, 0, 0, 1, 1,
0.1239785, -0.2663829, 1.307398, 0, 0, 0, 1, 1,
0.1329731, 0.3450693, -0.3887559, 0, 0, 0, 1, 1,
0.1340596, 0.6484263, 0.4623173, 0, 0, 0, 1, 1,
0.1376987, 1.104586, 0.6431752, 0, 0, 0, 1, 1,
0.1404404, 0.3319167, 1.305643, 1, 1, 1, 1, 1,
0.1408, 0.1372491, 0.1776846, 1, 1, 1, 1, 1,
0.1426149, -0.3579497, 1.842967, 1, 1, 1, 1, 1,
0.1427627, 0.1066693, 3.661602, 1, 1, 1, 1, 1,
0.1459784, 1.938584, 0.2914845, 1, 1, 1, 1, 1,
0.1498103, -1.015563, 2.664278, 1, 1, 1, 1, 1,
0.1508102, -0.3851121, 0.991822, 1, 1, 1, 1, 1,
0.1511668, 0.08333495, 1.980041, 1, 1, 1, 1, 1,
0.1522019, -1.428835, 2.540519, 1, 1, 1, 1, 1,
0.1537793, 1.401161, -0.5897191, 1, 1, 1, 1, 1,
0.1537842, 0.1073465, 2.754208, 1, 1, 1, 1, 1,
0.1566488, 1.270115, -0.05644114, 1, 1, 1, 1, 1,
0.1578832, 0.5020533, -0.3736768, 1, 1, 1, 1, 1,
0.1597498, 0.4254609, 0.1805834, 1, 1, 1, 1, 1,
0.1611107, 0.182937, 2.277596, 1, 1, 1, 1, 1,
0.1623562, 0.5695647, -0.493093, 0, 0, 1, 1, 1,
0.1683995, 1.877382, -0.5309858, 1, 0, 0, 1, 1,
0.1687119, -1.440822, 2.657327, 1, 0, 0, 1, 1,
0.1687182, -0.1579643, 1.871755, 1, 0, 0, 1, 1,
0.1693161, -1.012961, 3.309582, 1, 0, 0, 1, 1,
0.1703961, 0.2992136, 0.7253113, 1, 0, 0, 1, 1,
0.1721831, -0.7374212, 2.435327, 0, 0, 0, 1, 1,
0.1731045, 0.7330726, -0.9169703, 0, 0, 0, 1, 1,
0.1767839, 0.8824732, -0.2067762, 0, 0, 0, 1, 1,
0.1771265, 1.145607, 0.6925328, 0, 0, 0, 1, 1,
0.1794009, 0.696135, -1.029926, 0, 0, 0, 1, 1,
0.1815292, -0.1132609, 2.065691, 0, 0, 0, 1, 1,
0.1815467, 0.7941364, 1.240539, 0, 0, 0, 1, 1,
0.195019, 0.1379427, 2.913999, 1, 1, 1, 1, 1,
0.1999719, 0.1949754, 2.947543, 1, 1, 1, 1, 1,
0.200425, -0.6067088, 1.463684, 1, 1, 1, 1, 1,
0.2004462, -0.1669841, 2.400531, 1, 1, 1, 1, 1,
0.2018933, 0.3912871, 0.7296509, 1, 1, 1, 1, 1,
0.2023945, 0.3016725, 0.4933386, 1, 1, 1, 1, 1,
0.2166058, 0.7185353, -2.274585, 1, 1, 1, 1, 1,
0.2277211, -1.006045, 1.948075, 1, 1, 1, 1, 1,
0.2303485, 0.3515561, 1.338051, 1, 1, 1, 1, 1,
0.2339024, -0.0763142, 2.858678, 1, 1, 1, 1, 1,
0.239137, -0.839407, 4.182095, 1, 1, 1, 1, 1,
0.2416943, 1.563031, 0.3915084, 1, 1, 1, 1, 1,
0.242348, -1.746063, 2.679648, 1, 1, 1, 1, 1,
0.2426792, 1.01754, 2.484277, 1, 1, 1, 1, 1,
0.2439895, -0.6267182, 4.330215, 1, 1, 1, 1, 1,
0.245362, 0.7642691, -0.7707663, 0, 0, 1, 1, 1,
0.247735, 0.04124353, 2.130225, 1, 0, 0, 1, 1,
0.251397, 0.8593721, -0.08600752, 1, 0, 0, 1, 1,
0.2522393, -0.3772213, 1.701582, 1, 0, 0, 1, 1,
0.2544153, 0.3241628, 0.4942386, 1, 0, 0, 1, 1,
0.2553416, -1.270651, 3.266742, 1, 0, 0, 1, 1,
0.2572261, -2.159114, 3.049161, 0, 0, 0, 1, 1,
0.2575953, 0.7232621, -0.3662049, 0, 0, 0, 1, 1,
0.2582124, 0.4216809, -0.5236403, 0, 0, 0, 1, 1,
0.2585722, 0.1329468, 2.277157, 0, 0, 0, 1, 1,
0.27313, 1.717172, 0.9720492, 0, 0, 0, 1, 1,
0.2737679, -1.004852, 2.808745, 0, 0, 0, 1, 1,
0.2756106, 1.247729, 0.620586, 0, 0, 0, 1, 1,
0.2781774, -0.02538578, 2.20264, 1, 1, 1, 1, 1,
0.2793733, -1.327677, 2.981964, 1, 1, 1, 1, 1,
0.2797839, -0.1894811, 2.26713, 1, 1, 1, 1, 1,
0.2807277, 0.4299423, 1.435816, 1, 1, 1, 1, 1,
0.2841303, 0.02130995, 1.499541, 1, 1, 1, 1, 1,
0.2859483, -0.2067709, 1.763912, 1, 1, 1, 1, 1,
0.290419, 1.227037, -0.9483309, 1, 1, 1, 1, 1,
0.292387, 1.208525, -2.12828, 1, 1, 1, 1, 1,
0.2947924, 0.7627562, 1.287516, 1, 1, 1, 1, 1,
0.2974553, 0.08218593, 2.629478, 1, 1, 1, 1, 1,
0.2980681, -2.506783, 2.995311, 1, 1, 1, 1, 1,
0.3030855, -1.399943, 3.315835, 1, 1, 1, 1, 1,
0.3048127, -0.287746, 2.504402, 1, 1, 1, 1, 1,
0.3071519, 0.7701598, 0.3981355, 1, 1, 1, 1, 1,
0.30971, 0.5238076, -0.2761068, 1, 1, 1, 1, 1,
0.3121132, 1.163694, 0.4725059, 0, 0, 1, 1, 1,
0.3165682, -0.7226908, 2.120201, 1, 0, 0, 1, 1,
0.3200136, 0.1295329, 0.09317113, 1, 0, 0, 1, 1,
0.3211313, 0.2163251, 0.5003862, 1, 0, 0, 1, 1,
0.3337455, 0.4067458, 2.449422, 1, 0, 0, 1, 1,
0.3364517, 1.62393, 1.181759, 1, 0, 0, 1, 1,
0.3367532, -2.155209, 4.11274, 0, 0, 0, 1, 1,
0.3380067, -0.4846877, 0.5318184, 0, 0, 0, 1, 1,
0.3409296, 0.4532556, 0.6965294, 0, 0, 0, 1, 1,
0.3447253, 2.282599, -0.008710491, 0, 0, 0, 1, 1,
0.3469798, -2.071042, 3.600888, 0, 0, 0, 1, 1,
0.3488118, -0.2868618, 0.7355639, 0, 0, 0, 1, 1,
0.3490423, -0.8587214, 3.149515, 0, 0, 0, 1, 1,
0.3518291, 0.6570799, 0.3196172, 1, 1, 1, 1, 1,
0.3528512, 1.372755, 1.149706, 1, 1, 1, 1, 1,
0.3540777, -1.09665, 4.697759, 1, 1, 1, 1, 1,
0.3546779, -0.2625818, 2.996862, 1, 1, 1, 1, 1,
0.356288, 0.706806, 0.2852334, 1, 1, 1, 1, 1,
0.3624301, -0.04618564, 1.430472, 1, 1, 1, 1, 1,
0.3666565, -0.8840414, 2.089448, 1, 1, 1, 1, 1,
0.369533, -1.453118, 3.246894, 1, 1, 1, 1, 1,
0.3845414, -1.251355, 3.449143, 1, 1, 1, 1, 1,
0.3856162, 0.671495, 0.9408985, 1, 1, 1, 1, 1,
0.3857733, -1.024989, 4.125464, 1, 1, 1, 1, 1,
0.3887159, -1.512916, 4.175761, 1, 1, 1, 1, 1,
0.3953594, -0.2589302, 2.426998, 1, 1, 1, 1, 1,
0.3962408, -0.8983908, 0.8592156, 1, 1, 1, 1, 1,
0.4053515, -0.0894535, 2.208789, 1, 1, 1, 1, 1,
0.407753, -1.479714, 3.45926, 0, 0, 1, 1, 1,
0.4099544, -0.7314928, 1.240996, 1, 0, 0, 1, 1,
0.4150129, -0.690865, 1.022398, 1, 0, 0, 1, 1,
0.4181892, 1.091931, 1.77695, 1, 0, 0, 1, 1,
0.4305167, 0.1970786, 1.257577, 1, 0, 0, 1, 1,
0.4337112, -0.01002842, 1.772284, 1, 0, 0, 1, 1,
0.4421866, -0.9560822, 2.732919, 0, 0, 0, 1, 1,
0.4461317, -1.129456, 1.264857, 0, 0, 0, 1, 1,
0.4469595, -0.667659, 2.635475, 0, 0, 0, 1, 1,
0.4495005, 0.09929846, 1.400184, 0, 0, 0, 1, 1,
0.45555, -0.6282393, 1.277622, 0, 0, 0, 1, 1,
0.4555608, 0.2037956, -0.5872233, 0, 0, 0, 1, 1,
0.4557931, 0.6895418, 0.5931127, 0, 0, 0, 1, 1,
0.4560245, -1.269081, 3.863361, 1, 1, 1, 1, 1,
0.4567268, 0.1698831, 0.732542, 1, 1, 1, 1, 1,
0.4616301, 1.304162, 0.5076017, 1, 1, 1, 1, 1,
0.4628998, 0.7369055, -1.787222, 1, 1, 1, 1, 1,
0.4643498, -1.740512, 2.205758, 1, 1, 1, 1, 1,
0.4651085, 1.504222, 1.016229, 1, 1, 1, 1, 1,
0.4659697, -0.6611975, 2.321399, 1, 1, 1, 1, 1,
0.4665394, -0.2413186, 2.283516, 1, 1, 1, 1, 1,
0.467618, 0.09432786, 0.3860089, 1, 1, 1, 1, 1,
0.4702974, 1.725689, -0.211762, 1, 1, 1, 1, 1,
0.4705462, 0.2799525, 1.945848, 1, 1, 1, 1, 1,
0.4731217, -0.4369513, 1.735072, 1, 1, 1, 1, 1,
0.4748423, -0.3314652, 2.457536, 1, 1, 1, 1, 1,
0.4750614, 1.108373, 1.432693, 1, 1, 1, 1, 1,
0.4772157, 0.5216191, -0.443032, 1, 1, 1, 1, 1,
0.4813396, -0.06274779, 2.971743, 0, 0, 1, 1, 1,
0.4823591, 0.8486131, 0.02075265, 1, 0, 0, 1, 1,
0.4827617, -0.1721734, 2.875253, 1, 0, 0, 1, 1,
0.4889345, -1.837647, 4.253963, 1, 0, 0, 1, 1,
0.4902688, -0.2036606, 1.641245, 1, 0, 0, 1, 1,
0.4925876, -0.550919, 0.7458743, 1, 0, 0, 1, 1,
0.496202, 0.003619944, 2.61057, 0, 0, 0, 1, 1,
0.4970144, -0.5505443, 2.922765, 0, 0, 0, 1, 1,
0.4981572, -1.446114, 1.805905, 0, 0, 0, 1, 1,
0.4996193, -0.9075053, 0.5180479, 0, 0, 0, 1, 1,
0.5006736, -0.9965141, 1.952307, 0, 0, 0, 1, 1,
0.5012286, 2.031882, 2.428651, 0, 0, 0, 1, 1,
0.5023301, 0.6438304, -0.147786, 0, 0, 0, 1, 1,
0.5030619, -0.2809432, 3.078973, 1, 1, 1, 1, 1,
0.5063907, -1.257756, 2.626245, 1, 1, 1, 1, 1,
0.506402, 1.283219, -0.9502838, 1, 1, 1, 1, 1,
0.5199748, -0.05590788, 0.0709397, 1, 1, 1, 1, 1,
0.5216919, 0.6191078, 0.5002851, 1, 1, 1, 1, 1,
0.523438, -0.9798151, 3.07649, 1, 1, 1, 1, 1,
0.5257674, 0.9961528, 0.4344436, 1, 1, 1, 1, 1,
0.5365794, -0.4628082, 3.208555, 1, 1, 1, 1, 1,
0.5375105, 0.7107326, 0.3205655, 1, 1, 1, 1, 1,
0.5412304, -1.196967, 2.955079, 1, 1, 1, 1, 1,
0.5425231, 0.1832496, 2.210497, 1, 1, 1, 1, 1,
0.5426862, 0.1891711, -0.7296225, 1, 1, 1, 1, 1,
0.556726, 0.436509, 1.901402, 1, 1, 1, 1, 1,
0.5580876, -0.6485989, 1.852885, 1, 1, 1, 1, 1,
0.5695543, 2.594103, -0.0260464, 1, 1, 1, 1, 1,
0.5724869, -0.1392362, 2.093773, 0, 0, 1, 1, 1,
0.5776494, 1.829375, -0.5615248, 1, 0, 0, 1, 1,
0.5783072, -0.7518438, 1.241124, 1, 0, 0, 1, 1,
0.5801042, 0.1699578, 1.971613, 1, 0, 0, 1, 1,
0.5849981, -0.418765, 2.113196, 1, 0, 0, 1, 1,
0.5867302, 1.571733, 0.225224, 1, 0, 0, 1, 1,
0.5871124, -0.6796308, 1.403568, 0, 0, 0, 1, 1,
0.5896264, -0.2869816, 1.805137, 0, 0, 0, 1, 1,
0.604104, -0.4702229, 2.639143, 0, 0, 0, 1, 1,
0.6067287, -1.044845, 2.798583, 0, 0, 0, 1, 1,
0.6122971, -2.159888, 2.522974, 0, 0, 0, 1, 1,
0.6167307, -1.095762, 2.208024, 0, 0, 0, 1, 1,
0.6183843, -1.657823, 2.711356, 0, 0, 0, 1, 1,
0.6197503, 0.9688206, -0.6925414, 1, 1, 1, 1, 1,
0.6202785, -0.3894494, 2.41697, 1, 1, 1, 1, 1,
0.6290835, -0.5412669, 1.994292, 1, 1, 1, 1, 1,
0.6311288, 1.10812, 0.6168805, 1, 1, 1, 1, 1,
0.6316891, -0.6157861, 3.992127, 1, 1, 1, 1, 1,
0.6325332, 0.07005388, 3.410424, 1, 1, 1, 1, 1,
0.6333891, -0.2570093, 0.6296799, 1, 1, 1, 1, 1,
0.6368836, -0.5313429, 1.328125, 1, 1, 1, 1, 1,
0.6396834, 2.306149, 0.5102053, 1, 1, 1, 1, 1,
0.6462356, -1.13212, 2.484577, 1, 1, 1, 1, 1,
0.6469197, -0.01919332, 1.526598, 1, 1, 1, 1, 1,
0.6508632, -2.133557, 2.714278, 1, 1, 1, 1, 1,
0.6531372, -0.5925264, 1.646946, 1, 1, 1, 1, 1,
0.6575343, -2.299329, 1.129056, 1, 1, 1, 1, 1,
0.6576431, -0.3126984, 1.060847, 1, 1, 1, 1, 1,
0.661031, 0.5028578, 0.7320014, 0, 0, 1, 1, 1,
0.6631104, -0.1331269, 0.4823372, 1, 0, 0, 1, 1,
0.6631234, 0.2529182, 2.606246, 1, 0, 0, 1, 1,
0.6644062, -0.5012603, 1.725148, 1, 0, 0, 1, 1,
0.6657842, 1.018903, 1.332009, 1, 0, 0, 1, 1,
0.6660468, -1.980756, 3.535072, 1, 0, 0, 1, 1,
0.6675681, -0.9133378, 3.181496, 0, 0, 0, 1, 1,
0.6773112, 0.5712605, -0.692044, 0, 0, 0, 1, 1,
0.6830406, -0.4163764, 2.416436, 0, 0, 0, 1, 1,
0.6834358, -0.2089367, 2.23421, 0, 0, 0, 1, 1,
0.6844896, -1.057305, 1.724292, 0, 0, 0, 1, 1,
0.6856931, 1.031127, 2.751911, 0, 0, 0, 1, 1,
0.6903124, -0.8289381, 1.475664, 0, 0, 0, 1, 1,
0.6920483, -0.9082269, 2.353115, 1, 1, 1, 1, 1,
0.6940243, -0.1706535, 1.872585, 1, 1, 1, 1, 1,
0.6951006, -1.820307, 3.046113, 1, 1, 1, 1, 1,
0.6973923, 0.8744369, 0.9692767, 1, 1, 1, 1, 1,
0.7017918, 0.4604806, 1.597409, 1, 1, 1, 1, 1,
0.7053907, 1.19752, 2.075017, 1, 1, 1, 1, 1,
0.7060498, -0.2784845, 2.938441, 1, 1, 1, 1, 1,
0.712304, 0.5462321, 1.874894, 1, 1, 1, 1, 1,
0.7128266, -0.1267456, 1.671826, 1, 1, 1, 1, 1,
0.7159336, -0.2301524, 1.17283, 1, 1, 1, 1, 1,
0.7221484, -0.4520113, 1.972118, 1, 1, 1, 1, 1,
0.7236422, -0.07610796, 1.349929, 1, 1, 1, 1, 1,
0.7236536, 0.2659729, -0.151041, 1, 1, 1, 1, 1,
0.728173, -1.108441, 1.157036, 1, 1, 1, 1, 1,
0.7301964, 1.651098, 0.649555, 1, 1, 1, 1, 1,
0.7315109, 0.03354688, 0.5101233, 0, 0, 1, 1, 1,
0.7383797, 1.047051, 1.52426, 1, 0, 0, 1, 1,
0.7412213, 0.267083, 0.4058363, 1, 0, 0, 1, 1,
0.7434269, -0.08169487, 3.534056, 1, 0, 0, 1, 1,
0.7447191, -1.63145, 2.613441, 1, 0, 0, 1, 1,
0.7564014, 2.539945, -0.7671344, 1, 0, 0, 1, 1,
0.7641059, 1.610969, 0.8461626, 0, 0, 0, 1, 1,
0.7658765, 0.1096225, 2.149285, 0, 0, 0, 1, 1,
0.7661673, -0.09357952, 3.085382, 0, 0, 0, 1, 1,
0.7673019, -0.2863584, 0.9563834, 0, 0, 0, 1, 1,
0.7692741, 1.180858, 1.193723, 0, 0, 0, 1, 1,
0.776992, -1.232663, -0.545508, 0, 0, 0, 1, 1,
0.7799418, 0.4526665, 1.532074, 0, 0, 0, 1, 1,
0.7805035, 1.629294, 0.7056231, 1, 1, 1, 1, 1,
0.7896399, -0.4571686, 2.520293, 1, 1, 1, 1, 1,
0.8016378, -0.2863886, 2.68681, 1, 1, 1, 1, 1,
0.8088689, -2.016314, 4.17021, 1, 1, 1, 1, 1,
0.8090699, -1.14459, 2.567251, 1, 1, 1, 1, 1,
0.8094418, -0.8820742, 1.75458, 1, 1, 1, 1, 1,
0.8114141, -0.7057166, 1.964553, 1, 1, 1, 1, 1,
0.8181593, 1.560315, -1.313073, 1, 1, 1, 1, 1,
0.8202274, -1.679202, 4.226536, 1, 1, 1, 1, 1,
0.8216543, -0.9386007, 1.528154, 1, 1, 1, 1, 1,
0.8238762, 0.1990534, 2.110026, 1, 1, 1, 1, 1,
0.8261768, -0.292571, 2.668745, 1, 1, 1, 1, 1,
0.8266808, -1.141008, 2.680748, 1, 1, 1, 1, 1,
0.8290134, 0.08186763, 2.280005, 1, 1, 1, 1, 1,
0.8312612, 1.133831, -0.1891373, 1, 1, 1, 1, 1,
0.831947, -0.4098472, 2.518038, 0, 0, 1, 1, 1,
0.8361604, 0.5710794, 2.941242, 1, 0, 0, 1, 1,
0.8402163, -0.8715612, 3.260101, 1, 0, 0, 1, 1,
0.8415708, 1.117508, -0.683504, 1, 0, 0, 1, 1,
0.8445713, 0.05613541, 0.7827187, 1, 0, 0, 1, 1,
0.8458668, -1.54226, 2.819695, 1, 0, 0, 1, 1,
0.8532487, 0.3015936, 1.403836, 0, 0, 0, 1, 1,
0.8540912, 0.44567, 0.7211843, 0, 0, 0, 1, 1,
0.8556625, -1.110852, 3.524925, 0, 0, 0, 1, 1,
0.8602105, 0.6954848, -0.17454, 0, 0, 0, 1, 1,
0.8633977, 0.3923207, 2.163952, 0, 0, 0, 1, 1,
0.864978, 1.134101, -0.1230043, 0, 0, 0, 1, 1,
0.8654729, -0.1067281, 2.239203, 0, 0, 0, 1, 1,
0.8677148, 0.4638193, 0.2791325, 1, 1, 1, 1, 1,
0.8690846, 0.6553473, 0.4464485, 1, 1, 1, 1, 1,
0.8717379, -0.4682353, 1.595428, 1, 1, 1, 1, 1,
0.8759147, -0.270462, 4.042712, 1, 1, 1, 1, 1,
0.878287, 0.5731462, 1.454613, 1, 1, 1, 1, 1,
0.8818091, -0.2205392, 2.08363, 1, 1, 1, 1, 1,
0.8841606, 0.8528777, 0.6756904, 1, 1, 1, 1, 1,
0.8856089, -0.4547282, 3.469862, 1, 1, 1, 1, 1,
0.8890396, 0.09689837, 1.369113, 1, 1, 1, 1, 1,
0.8907028, -0.1783608, 2.815741, 1, 1, 1, 1, 1,
0.8916299, 1.009119, 0.8395379, 1, 1, 1, 1, 1,
0.8938101, -1.324035, 5.224605, 1, 1, 1, 1, 1,
0.8981764, -0.6762842, 2.685197, 1, 1, 1, 1, 1,
0.9004458, -0.9289148, 2.529479, 1, 1, 1, 1, 1,
0.9085679, -0.4813007, 2.311634, 1, 1, 1, 1, 1,
0.9103936, -1.176912, 1.421019, 0, 0, 1, 1, 1,
0.9116225, 0.1726563, 0.5928287, 1, 0, 0, 1, 1,
0.9136235, 1.62045, -0.8680083, 1, 0, 0, 1, 1,
0.9162207, 0.06463846, 1.261828, 1, 0, 0, 1, 1,
0.9175754, -0.09986116, 1.777923, 1, 0, 0, 1, 1,
0.9219158, 0.03768917, 2.189569, 1, 0, 0, 1, 1,
0.9241078, 0.676313, 0.3245915, 0, 0, 0, 1, 1,
0.9247444, -0.5889148, 1.321627, 0, 0, 0, 1, 1,
0.937034, -1.223544, 3.549119, 0, 0, 0, 1, 1,
0.941089, 1.073583, 1.08959, 0, 0, 0, 1, 1,
0.9426985, 1.071282, -0.3628414, 0, 0, 0, 1, 1,
0.9528545, 1.493131, 2.069524, 0, 0, 0, 1, 1,
0.9536299, -0.577747, 2.548313, 0, 0, 0, 1, 1,
0.9546623, 2.204915, 1.949437, 1, 1, 1, 1, 1,
0.95577, 0.08936045, 1.704687, 1, 1, 1, 1, 1,
0.9574538, -0.6318798, 2.359372, 1, 1, 1, 1, 1,
0.9652194, -0.7240767, 1.783382, 1, 1, 1, 1, 1,
0.9670563, 1.982613, 0.5383116, 1, 1, 1, 1, 1,
0.9670649, -0.2612249, 0.6507947, 1, 1, 1, 1, 1,
0.9733881, 0.1920379, 1.727447, 1, 1, 1, 1, 1,
0.9759717, 0.9280161, 1.839317, 1, 1, 1, 1, 1,
0.9800782, -1.222216, 0.5528317, 1, 1, 1, 1, 1,
0.9936278, 0.03774272, 1.966174, 1, 1, 1, 1, 1,
0.999394, 1.530823, 0.3238861, 1, 1, 1, 1, 1,
1.000244, -1.559389, 2.236731, 1, 1, 1, 1, 1,
1.000431, 0.9395131, 2.532429, 1, 1, 1, 1, 1,
1.000443, -1.027212, 1.617862, 1, 1, 1, 1, 1,
1.002471, -0.2850615, 0.06911336, 1, 1, 1, 1, 1,
1.002818, -0.65071, 1.254652, 0, 0, 1, 1, 1,
1.009528, 1.785558, 0.05305631, 1, 0, 0, 1, 1,
1.011391, 1.131073, -0.4901429, 1, 0, 0, 1, 1,
1.014825, 0.7970948, 1.829893, 1, 0, 0, 1, 1,
1.019654, -0.447179, 1.283921, 1, 0, 0, 1, 1,
1.019905, -1.132576, 4.102927, 1, 0, 0, 1, 1,
1.020924, -0.9801076, 1.18173, 0, 0, 0, 1, 1,
1.023626, 0.05669241, 1.097028, 0, 0, 0, 1, 1,
1.026881, -2.02731, -0.01472066, 0, 0, 0, 1, 1,
1.028006, 2.806006, 0.9802529, 0, 0, 0, 1, 1,
1.043967, 0.5177974, 0.1772957, 0, 0, 0, 1, 1,
1.046412, -0.03933974, -0.6504783, 0, 0, 0, 1, 1,
1.049653, -0.5551289, 1.281359, 0, 0, 0, 1, 1,
1.050982, 1.194634, 3.498463, 1, 1, 1, 1, 1,
1.061691, 0.5076922, 0.9910624, 1, 1, 1, 1, 1,
1.071145, -1.184665, 2.476206, 1, 1, 1, 1, 1,
1.071334, 0.1999632, 1.432818, 1, 1, 1, 1, 1,
1.076791, -0.8121643, 2.3711, 1, 1, 1, 1, 1,
1.084416, -0.2128416, 2.563034, 1, 1, 1, 1, 1,
1.087875, 1.999223, 1.54488, 1, 1, 1, 1, 1,
1.088097, -0.474023, 4.974243, 1, 1, 1, 1, 1,
1.091707, -1.013974, 2.316259, 1, 1, 1, 1, 1,
1.107015, 0.9694011, 0.7509678, 1, 1, 1, 1, 1,
1.110346, -0.5991794, 1.968994, 1, 1, 1, 1, 1,
1.116249, -0.3784701, 1.493091, 1, 1, 1, 1, 1,
1.117143, -0.3560881, 3.303252, 1, 1, 1, 1, 1,
1.132395, -0.4945515, 1.389049, 1, 1, 1, 1, 1,
1.134113, -1.731245, 3.134851, 1, 1, 1, 1, 1,
1.136916, -1.784482, 2.823537, 0, 0, 1, 1, 1,
1.146544, 0.1150067, 2.621414, 1, 0, 0, 1, 1,
1.154723, 1.384059, 0.8895156, 1, 0, 0, 1, 1,
1.157059, 0.04585287, 1.131257, 1, 0, 0, 1, 1,
1.166611, -1.171823, 3.424449, 1, 0, 0, 1, 1,
1.167375, 0.8093084, 1.178653, 1, 0, 0, 1, 1,
1.170997, -0.9315575, 3.653602, 0, 0, 0, 1, 1,
1.177088, 0.6269947, 0.8094437, 0, 0, 0, 1, 1,
1.179462, 0.8106248, 0.9718195, 0, 0, 0, 1, 1,
1.184132, -1.92154, 2.681651, 0, 0, 0, 1, 1,
1.193986, 1.284213, 1.162503, 0, 0, 0, 1, 1,
1.19668, 1.133241, 0.05164258, 0, 0, 0, 1, 1,
1.206588, 0.2485051, 1.304385, 0, 0, 0, 1, 1,
1.206744, 0.6373802, 1.051422, 1, 1, 1, 1, 1,
1.206809, 0.2771302, 1.961017, 1, 1, 1, 1, 1,
1.210257, -0.4000171, 0.4324322, 1, 1, 1, 1, 1,
1.210718, 0.5116753, 0.7909759, 1, 1, 1, 1, 1,
1.211655, 0.2066611, -0.342447, 1, 1, 1, 1, 1,
1.222174, 0.1763126, 1.661506, 1, 1, 1, 1, 1,
1.228687, 0.7875301, -1.163713, 1, 1, 1, 1, 1,
1.230946, -1.839778, 1.168829, 1, 1, 1, 1, 1,
1.235496, 1.655704, -0.652228, 1, 1, 1, 1, 1,
1.239171, 0.9591409, 2.361711, 1, 1, 1, 1, 1,
1.270019, -1.278475, 3.386428, 1, 1, 1, 1, 1,
1.27675, 0.04623306, 3.343966, 1, 1, 1, 1, 1,
1.279015, 0.6749279, 2.743944, 1, 1, 1, 1, 1,
1.28451, -0.3699604, 1.420048, 1, 1, 1, 1, 1,
1.286095, 0.2119777, 1.380479, 1, 1, 1, 1, 1,
1.30021, 0.4442293, 1.537299, 0, 0, 1, 1, 1,
1.302986, -0.8309302, 1.976102, 1, 0, 0, 1, 1,
1.303579, -0.2191093, 0.8119984, 1, 0, 0, 1, 1,
1.306453, 1.210567, 1.804512, 1, 0, 0, 1, 1,
1.315402, -0.5418808, 2.38655, 1, 0, 0, 1, 1,
1.326119, -2.330331, 3.701076, 1, 0, 0, 1, 1,
1.32777, 2.241751, 0.2188197, 0, 0, 0, 1, 1,
1.330991, 0.1116958, 2.248772, 0, 0, 0, 1, 1,
1.352303, -1.384502, 2.721388, 0, 0, 0, 1, 1,
1.356704, -0.7498361, 2.862953, 0, 0, 0, 1, 1,
1.362496, 0.4773412, 0.5468244, 0, 0, 0, 1, 1,
1.36324, -1.543265, 1.650177, 0, 0, 0, 1, 1,
1.36693, 0.1305654, 2.43587, 0, 0, 0, 1, 1,
1.372744, -0.5097272, 1.498133, 1, 1, 1, 1, 1,
1.375199, -0.9825948, 2.422501, 1, 1, 1, 1, 1,
1.379212, -2.188437, 0.2446246, 1, 1, 1, 1, 1,
1.381226, -0.4015971, 2.523842, 1, 1, 1, 1, 1,
1.38404, 0.4018292, 0.5001079, 1, 1, 1, 1, 1,
1.390141, 0.7265747, -1.455299, 1, 1, 1, 1, 1,
1.391292, -0.7885371, 3.74298, 1, 1, 1, 1, 1,
1.402037, 0.09536217, -0.2476462, 1, 1, 1, 1, 1,
1.420283, -0.5727924, 1.815166, 1, 1, 1, 1, 1,
1.420702, 1.975821, 0.5372047, 1, 1, 1, 1, 1,
1.43406, -0.6778122, 2.790041, 1, 1, 1, 1, 1,
1.434295, 2.066432, -1.505023, 1, 1, 1, 1, 1,
1.437108, 1.383015, 0.6902147, 1, 1, 1, 1, 1,
1.437723, 1.598944, -0.7923301, 1, 1, 1, 1, 1,
1.453711, -0.6690193, 1.558561, 1, 1, 1, 1, 1,
1.455284, -0.3164962, 2.527141, 0, 0, 1, 1, 1,
1.459114, 0.3033696, 1.878455, 1, 0, 0, 1, 1,
1.467003, 0.9081517, 1.104253, 1, 0, 0, 1, 1,
1.469219, -0.5669574, 1.055642, 1, 0, 0, 1, 1,
1.471942, 0.2924503, 1.482014, 1, 0, 0, 1, 1,
1.473876, 0.9728345, 1.258332, 1, 0, 0, 1, 1,
1.476095, -1.388545, 2.056617, 0, 0, 0, 1, 1,
1.483262, -0.9923153, 1.46242, 0, 0, 0, 1, 1,
1.492744, 0.4699511, 1.499626, 0, 0, 0, 1, 1,
1.494125, -0.07256111, 0.5533343, 0, 0, 0, 1, 1,
1.495523, 0.4684989, 2.644453, 0, 0, 0, 1, 1,
1.496709, -0.3284969, 3.267274, 0, 0, 0, 1, 1,
1.515902, -1.234713, 2.752443, 0, 0, 0, 1, 1,
1.523569, -0.5478076, 1.379939, 1, 1, 1, 1, 1,
1.53049, -0.1739112, 2.107355, 1, 1, 1, 1, 1,
1.54667, 0.7848814, 0.9621763, 1, 1, 1, 1, 1,
1.550217, 0.01026283, 2.746959, 1, 1, 1, 1, 1,
1.569177, 0.2492949, 1.833851, 1, 1, 1, 1, 1,
1.57329, 0.2330398, 2.003631, 1, 1, 1, 1, 1,
1.579046, -1.471219, 3.279548, 1, 1, 1, 1, 1,
1.57949, -1.049411, 2.777325, 1, 1, 1, 1, 1,
1.58266, -0.2339838, 0.9612759, 1, 1, 1, 1, 1,
1.589375, 0.06841466, 1.409088, 1, 1, 1, 1, 1,
1.604108, 0.9572359, 1.693292, 1, 1, 1, 1, 1,
1.614643, 0.09313939, 1.522341, 1, 1, 1, 1, 1,
1.618625, -1.616744, 2.38114, 1, 1, 1, 1, 1,
1.62545, 0.6989281, 1.07067, 1, 1, 1, 1, 1,
1.63623, -0.8925664, 2.550469, 1, 1, 1, 1, 1,
1.639431, -1.305028, 2.690612, 0, 0, 1, 1, 1,
1.642362, -1.404894, 3.263698, 1, 0, 0, 1, 1,
1.661077, -1.7171, 3.632686, 1, 0, 0, 1, 1,
1.661622, 2.115841, 0.1809859, 1, 0, 0, 1, 1,
1.662595, 0.2637397, 0.8295705, 1, 0, 0, 1, 1,
1.663205, 0.003616182, 1.725553, 1, 0, 0, 1, 1,
1.668458, 1.619248, 0.8165595, 0, 0, 0, 1, 1,
1.708123, -0.4980347, 2.785819, 0, 0, 0, 1, 1,
1.72455, -0.5965422, 2.858077, 0, 0, 0, 1, 1,
1.739101, -0.2675227, 1.52861, 0, 0, 0, 1, 1,
1.807489, 0.1284312, 1.209878, 0, 0, 0, 1, 1,
1.812027, -0.159135, 1.750314, 0, 0, 0, 1, 1,
1.812714, -0.6183838, 2.705358, 0, 0, 0, 1, 1,
1.819219, 0.166152, 3.053584, 1, 1, 1, 1, 1,
1.836251, -0.001704958, 3.175017, 1, 1, 1, 1, 1,
1.851171, 0.7669496, 2.686736, 1, 1, 1, 1, 1,
1.897831, 3.661302, 1.514244, 1, 1, 1, 1, 1,
1.909541, -1.134129, 1.608149, 1, 1, 1, 1, 1,
1.915726, 0.6190085, 3.042724, 1, 1, 1, 1, 1,
1.920729, 0.2667772, 1.241376, 1, 1, 1, 1, 1,
1.935128, -0.7342824, 1.738326, 1, 1, 1, 1, 1,
1.963474, -0.9306945, -0.1634778, 1, 1, 1, 1, 1,
1.969284, 0.4188529, 1.655238, 1, 1, 1, 1, 1,
1.992837, 0.7596809, 0.5771447, 1, 1, 1, 1, 1,
2.022487, 0.3711009, 1.84486, 1, 1, 1, 1, 1,
2.033833, -0.3028805, 2.504074, 1, 1, 1, 1, 1,
2.053247, 0.4284967, 1.394934, 1, 1, 1, 1, 1,
2.121054, 1.643942, -0.6594076, 1, 1, 1, 1, 1,
2.177177, -0.07961287, 2.899754, 0, 0, 1, 1, 1,
2.202678, 0.1882751, 1.672606, 1, 0, 0, 1, 1,
2.211951, 1.517714, 0.03063892, 1, 0, 0, 1, 1,
2.234887, -0.08589823, 1.899984, 1, 0, 0, 1, 1,
2.309035, -1.29398, 2.061519, 1, 0, 0, 1, 1,
2.315758, 1.316467, 2.054052, 1, 0, 0, 1, 1,
2.325705, 0.4145023, 1.918493, 0, 0, 0, 1, 1,
2.33298, 0.7357332, 2.118948, 0, 0, 0, 1, 1,
2.373189, 0.3566695, 1.678625, 0, 0, 0, 1, 1,
2.383089, 0.9408912, 0.2402682, 0, 0, 0, 1, 1,
2.475302, 0.2437805, 1.322688, 0, 0, 0, 1, 1,
2.516842, 0.7206847, 1.886075, 0, 0, 0, 1, 1,
2.530579, 0.2169261, 1.862728, 0, 0, 0, 1, 1,
2.590696, 0.1145328, 0.7586032, 1, 1, 1, 1, 1,
2.743877, -0.0165443, 0.6594353, 1, 1, 1, 1, 1,
2.762834, 1.450352, 0.7064872, 1, 1, 1, 1, 1,
2.77713, 0.04650875, 4.009731, 1, 1, 1, 1, 1,
2.779304, 0.08997525, 0.2733666, 1, 1, 1, 1, 1,
2.975449, 1.092261, 0.4422114, 1, 1, 1, 1, 1,
3.345146, -0.05689343, 1.278813, 1, 1, 1, 1, 1
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
var radius = 9.630438;
var distance = 33.82651;
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
mvMatrix.translate( 0.03325415, -0.339139, 0.004163742 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82651);
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
