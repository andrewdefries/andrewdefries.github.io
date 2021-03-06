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
-3.111057, 0.4951456, 0.1262474, 1, 0, 0, 1,
-3.043545, -1.507632, -2.71938, 1, 0.007843138, 0, 1,
-2.535603, -1.225027, -1.486373, 1, 0.01176471, 0, 1,
-2.47779, 0.2231113, -0.6234427, 1, 0.01960784, 0, 1,
-2.474104, -0.3219725, -1.266284, 1, 0.02352941, 0, 1,
-2.445946, -1.19896, -3.165515, 1, 0.03137255, 0, 1,
-2.393814, 1.796059, -1.200245, 1, 0.03529412, 0, 1,
-2.348614, 1.530194, -2.878167, 1, 0.04313726, 0, 1,
-2.322966, 2.009279, -1.639319, 1, 0.04705882, 0, 1,
-2.312662, 0.003007061, -0.590703, 1, 0.05490196, 0, 1,
-2.312526, -0.6424538, -2.245617, 1, 0.05882353, 0, 1,
-2.252645, 1.002817, -1.391111, 1, 0.06666667, 0, 1,
-2.204132, 0.6203215, -0.349673, 1, 0.07058824, 0, 1,
-2.145979, -0.6698735, -2.147387, 1, 0.07843138, 0, 1,
-2.143782, -0.4608092, -2.216383, 1, 0.08235294, 0, 1,
-2.130991, 1.460492, -0.8142931, 1, 0.09019608, 0, 1,
-2.096913, -0.08084538, 0.06447504, 1, 0.09411765, 0, 1,
-2.086432, 1.054277, -0.2295434, 1, 0.1019608, 0, 1,
-2.069887, 0.2812744, -0.8694041, 1, 0.1098039, 0, 1,
-2.019788, -0.8292621, -0.7336072, 1, 0.1137255, 0, 1,
-2.005008, -0.317853, -2.39949, 1, 0.1215686, 0, 1,
-1.990648, -0.1907391, -0.9002461, 1, 0.1254902, 0, 1,
-1.989637, 1.710491, -1.736312, 1, 0.1333333, 0, 1,
-1.980355, -0.9253088, -3.145005, 1, 0.1372549, 0, 1,
-1.964301, -0.3598573, -0.8127806, 1, 0.145098, 0, 1,
-1.959375, -1.055864, -3.850187, 1, 0.1490196, 0, 1,
-1.953553, -0.6143307, -0.9440995, 1, 0.1568628, 0, 1,
-1.922981, 0.2573264, -1.819732, 1, 0.1607843, 0, 1,
-1.901141, -1.004931, -1.033975, 1, 0.1686275, 0, 1,
-1.875959, -1.133883, -4.011998, 1, 0.172549, 0, 1,
-1.865637, 0.9505457, -2.434328, 1, 0.1803922, 0, 1,
-1.863616, -0.1800723, -2.904333, 1, 0.1843137, 0, 1,
-1.859517, -1.644697, -2.357222, 1, 0.1921569, 0, 1,
-1.849419, -0.1970179, -2.062261, 1, 0.1960784, 0, 1,
-1.810919, 0.4468764, -0.6208436, 1, 0.2039216, 0, 1,
-1.810287, -1.148082, -2.581654, 1, 0.2117647, 0, 1,
-1.794233, -1.014124, -1.58035, 1, 0.2156863, 0, 1,
-1.779673, -0.2621506, -2.437811, 1, 0.2235294, 0, 1,
-1.77102, 0.509293, -1.206913, 1, 0.227451, 0, 1,
-1.770369, -0.1046578, -1.854689, 1, 0.2352941, 0, 1,
-1.770127, 1.250439, -0.4700375, 1, 0.2392157, 0, 1,
-1.756577, -0.2391055, -0.8444247, 1, 0.2470588, 0, 1,
-1.752819, -0.07091831, -1.035914, 1, 0.2509804, 0, 1,
-1.751149, -0.5047592, -1.66467, 1, 0.2588235, 0, 1,
-1.723454, 0.08300495, 0.2440447, 1, 0.2627451, 0, 1,
-1.718179, -0.3787095, -1.11305, 1, 0.2705882, 0, 1,
-1.703125, -0.2133149, -1.184074, 1, 0.2745098, 0, 1,
-1.690108, 1.139751, -1.216506, 1, 0.282353, 0, 1,
-1.689084, 1.355473, -0.460792, 1, 0.2862745, 0, 1,
-1.688303, 0.1896398, -3.061132, 1, 0.2941177, 0, 1,
-1.683951, 0.6931572, -0.7152484, 1, 0.3019608, 0, 1,
-1.676105, -0.6134461, -3.199482, 1, 0.3058824, 0, 1,
-1.671785, -0.7389199, -1.285647, 1, 0.3137255, 0, 1,
-1.666293, 0.0507804, -2.027177, 1, 0.3176471, 0, 1,
-1.663524, 0.5817999, -1.439305, 1, 0.3254902, 0, 1,
-1.642938, -0.3281476, -2.870146, 1, 0.3294118, 0, 1,
-1.617622, -0.03158871, 0.2656502, 1, 0.3372549, 0, 1,
-1.61229, -0.1183844, -2.748755, 1, 0.3411765, 0, 1,
-1.608643, -0.4979901, -1.908096, 1, 0.3490196, 0, 1,
-1.590197, -2.033663, -1.72839, 1, 0.3529412, 0, 1,
-1.563106, -0.3220952, -3.252157, 1, 0.3607843, 0, 1,
-1.552812, -1.716702, -1.8778, 1, 0.3647059, 0, 1,
-1.551585, 0.5629588, -2.442686, 1, 0.372549, 0, 1,
-1.520373, -0.7467331, -1.786021, 1, 0.3764706, 0, 1,
-1.514748, -0.85089, -2.9866, 1, 0.3843137, 0, 1,
-1.50786, 0.3993074, -0.5346226, 1, 0.3882353, 0, 1,
-1.503479, -1.771136, -2.576479, 1, 0.3960784, 0, 1,
-1.500728, -0.5077989, -2.620281, 1, 0.4039216, 0, 1,
-1.50014, 0.1876722, -2.155395, 1, 0.4078431, 0, 1,
-1.495752, -0.1838516, -3.191113, 1, 0.4156863, 0, 1,
-1.49107, 0.3304243, -1.601301, 1, 0.4196078, 0, 1,
-1.472704, -0.5306684, -2.583114, 1, 0.427451, 0, 1,
-1.47151, 0.1454739, -2.30874, 1, 0.4313726, 0, 1,
-1.470687, 0.8800672, 0.8787213, 1, 0.4392157, 0, 1,
-1.468565, 0.518006, -0.6606861, 1, 0.4431373, 0, 1,
-1.467964, -0.8805043, -1.95603, 1, 0.4509804, 0, 1,
-1.465217, -0.4952411, -0.3863409, 1, 0.454902, 0, 1,
-1.464883, -0.6007912, -2.311075, 1, 0.4627451, 0, 1,
-1.449695, -1.525057, -2.029126, 1, 0.4666667, 0, 1,
-1.438961, -0.5920534, -2.536543, 1, 0.4745098, 0, 1,
-1.438752, -1.103543, -2.603961, 1, 0.4784314, 0, 1,
-1.431182, -0.06100533, -2.607396, 1, 0.4862745, 0, 1,
-1.429944, -2.579734, -2.071729, 1, 0.4901961, 0, 1,
-1.429695, -0.6341846, -4.349977, 1, 0.4980392, 0, 1,
-1.4219, -0.05518161, -1.250174, 1, 0.5058824, 0, 1,
-1.410212, -1.819547, -3.289312, 1, 0.509804, 0, 1,
-1.403279, -2.740652, -1.83795, 1, 0.5176471, 0, 1,
-1.400812, 0.3908617, -2.18891, 1, 0.5215687, 0, 1,
-1.395867, -0.6510578, -3.050575, 1, 0.5294118, 0, 1,
-1.392719, -1.303901, -2.126304, 1, 0.5333334, 0, 1,
-1.391229, 0.1301927, -1.408388, 1, 0.5411765, 0, 1,
-1.388422, -1.156413, -3.653507, 1, 0.5450981, 0, 1,
-1.374794, 0.4639254, -0.804079, 1, 0.5529412, 0, 1,
-1.361472, -1.203625, -2.567281, 1, 0.5568628, 0, 1,
-1.356083, 0.2529766, -2.366085, 1, 0.5647059, 0, 1,
-1.3556, -0.1169253, 0.8048564, 1, 0.5686275, 0, 1,
-1.35291, 2.116884, -1.835266, 1, 0.5764706, 0, 1,
-1.352556, -0.5647762, -1.507299, 1, 0.5803922, 0, 1,
-1.351865, -0.6801957, -0.8935944, 1, 0.5882353, 0, 1,
-1.348297, 0.9727494, 0.6182486, 1, 0.5921569, 0, 1,
-1.344055, -0.2877003, -1.631523, 1, 0.6, 0, 1,
-1.339262, 0.8257864, -0.6706728, 1, 0.6078432, 0, 1,
-1.333638, 1.766982, -0.7421633, 1, 0.6117647, 0, 1,
-1.33209, 1.255791, 0.8361924, 1, 0.6196079, 0, 1,
-1.307557, -2.005905, -5.175711, 1, 0.6235294, 0, 1,
-1.304688, -0.6537578, -1.929884, 1, 0.6313726, 0, 1,
-1.303791, -1.015024, -1.966758, 1, 0.6352941, 0, 1,
-1.274944, 0.6910084, -1.241315, 1, 0.6431373, 0, 1,
-1.272912, -0.3982558, -2.60535, 1, 0.6470588, 0, 1,
-1.272836, -0.3660163, -1.525339, 1, 0.654902, 0, 1,
-1.264286, 0.404624, -1.575484, 1, 0.6588235, 0, 1,
-1.263075, 1.601031, -1.390699, 1, 0.6666667, 0, 1,
-1.262334, -0.9918838, -3.540854, 1, 0.6705883, 0, 1,
-1.259427, -0.3780414, -2.82721, 1, 0.6784314, 0, 1,
-1.259423, -0.7274243, -3.010062, 1, 0.682353, 0, 1,
-1.255531, -1.418105, -2.778394, 1, 0.6901961, 0, 1,
-1.248051, 0.8997134, -0.612582, 1, 0.6941177, 0, 1,
-1.24766, 0.6425334, 0.05416832, 1, 0.7019608, 0, 1,
-1.24112, 0.05213434, -2.095092, 1, 0.7098039, 0, 1,
-1.240376, -0.5840734, -1.97198, 1, 0.7137255, 0, 1,
-1.237854, -1.123812, -2.616985, 1, 0.7215686, 0, 1,
-1.233943, 0.2997435, 0.1260252, 1, 0.7254902, 0, 1,
-1.231352, -0.5258201, -2.617672, 1, 0.7333333, 0, 1,
-1.215636, 0.1199593, -0.6447066, 1, 0.7372549, 0, 1,
-1.214942, 0.8232135, -1.521127, 1, 0.7450981, 0, 1,
-1.214134, -0.9271107, -2.091714, 1, 0.7490196, 0, 1,
-1.209724, 1.465073, -0.5257099, 1, 0.7568628, 0, 1,
-1.209206, -0.2089346, -2.577206, 1, 0.7607843, 0, 1,
-1.208757, 2.639909, -1.381089, 1, 0.7686275, 0, 1,
-1.205348, 0.5658038, -0.7090597, 1, 0.772549, 0, 1,
-1.200811, -0.5681412, -3.763437, 1, 0.7803922, 0, 1,
-1.177098, 0.285253, -0.4815109, 1, 0.7843137, 0, 1,
-1.175152, -0.04590259, -2.36089, 1, 0.7921569, 0, 1,
-1.172364, 1.087647, 0.1628439, 1, 0.7960784, 0, 1,
-1.171612, 0.004661156, -1.793646, 1, 0.8039216, 0, 1,
-1.167722, -1.450515, -2.084453, 1, 0.8117647, 0, 1,
-1.158162, 1.540122, -1.14557, 1, 0.8156863, 0, 1,
-1.154049, -1.500045, -3.067961, 1, 0.8235294, 0, 1,
-1.151907, -1.055367, -3.720586, 1, 0.827451, 0, 1,
-1.149143, 0.4657375, -1.696291, 1, 0.8352941, 0, 1,
-1.142156, -0.04600156, -1.267707, 1, 0.8392157, 0, 1,
-1.128011, -0.163495, -0.793443, 1, 0.8470588, 0, 1,
-1.114334, -0.3703281, -2.433084, 1, 0.8509804, 0, 1,
-1.1067, 2.937204, 0.8738589, 1, 0.8588235, 0, 1,
-1.1057, 0.03326723, -0.4230314, 1, 0.8627451, 0, 1,
-1.104097, 0.4244753, -0.5436949, 1, 0.8705882, 0, 1,
-1.099036, 0.6413399, -3.023469, 1, 0.8745098, 0, 1,
-1.089684, 0.1546023, -2.021386, 1, 0.8823529, 0, 1,
-1.089382, 0.4972848, -3.917535, 1, 0.8862745, 0, 1,
-1.082801, -0.699827, -2.341131, 1, 0.8941177, 0, 1,
-1.076886, -0.7851205, -1.035513, 1, 0.8980392, 0, 1,
-1.071151, 0.3583926, -1.827841, 1, 0.9058824, 0, 1,
-1.066322, 0.08899403, 0.3182931, 1, 0.9137255, 0, 1,
-1.063626, 0.805872, -0.9078731, 1, 0.9176471, 0, 1,
-1.063326, 1.054154, 0.60688, 1, 0.9254902, 0, 1,
-1.061505, 0.8856291, -2.831416, 1, 0.9294118, 0, 1,
-1.043588, -1.521659, -4.318676, 1, 0.9372549, 0, 1,
-1.037663, -0.7615703, -1.856409, 1, 0.9411765, 0, 1,
-1.035385, 1.113427, -1.582494, 1, 0.9490196, 0, 1,
-1.033646, 1.071464, 0.5610524, 1, 0.9529412, 0, 1,
-1.026535, -0.74829, -2.266629, 1, 0.9607843, 0, 1,
-1.025496, -0.3495131, -2.813619, 1, 0.9647059, 0, 1,
-1.023057, 1.63281, 0.09976265, 1, 0.972549, 0, 1,
-1.016673, -0.2476495, -3.114023, 1, 0.9764706, 0, 1,
-1.016461, 0.8384362, -1.674882, 1, 0.9843137, 0, 1,
-1.006101, 0.2318534, -1.485391, 1, 0.9882353, 0, 1,
-1.002398, 0.9996712, -1.98385, 1, 0.9960784, 0, 1,
-0.9991522, -0.03752051, -0.6475577, 0.9960784, 1, 0, 1,
-0.9980558, 0.003923301, -0.7823067, 0.9921569, 1, 0, 1,
-0.9954267, -0.8489611, -0.593702, 0.9843137, 1, 0, 1,
-0.9925857, 2.561196, -0.09142908, 0.9803922, 1, 0, 1,
-0.988079, -0.6049455, -2.530426, 0.972549, 1, 0, 1,
-0.9799343, -0.5296751, -2.514938, 0.9686275, 1, 0, 1,
-0.9777815, -0.4513825, -1.125502, 0.9607843, 1, 0, 1,
-0.9777272, 0.6799316, -1.165938, 0.9568627, 1, 0, 1,
-0.9758458, -0.7930489, -2.597784, 0.9490196, 1, 0, 1,
-0.9576047, 0.7839294, -1.519407, 0.945098, 1, 0, 1,
-0.9547188, 0.3119879, 0.01168121, 0.9372549, 1, 0, 1,
-0.9429389, 0.1854057, -0.8884443, 0.9333333, 1, 0, 1,
-0.9404526, 1.952109, -1.170065, 0.9254902, 1, 0, 1,
-0.9377754, -0.9270653, -2.904812, 0.9215686, 1, 0, 1,
-0.9365355, -0.9667917, -1.599295, 0.9137255, 1, 0, 1,
-0.9314145, 0.1921539, -0.5716349, 0.9098039, 1, 0, 1,
-0.9310881, 1.328568, -0.2595245, 0.9019608, 1, 0, 1,
-0.9266878, 1.064173, -1.161162, 0.8941177, 1, 0, 1,
-0.9259942, -0.8081588, -1.864823, 0.8901961, 1, 0, 1,
-0.9228364, -0.4036881, -2.430903, 0.8823529, 1, 0, 1,
-0.9170873, -0.5584116, -3.18699, 0.8784314, 1, 0, 1,
-0.9133949, 1.856536, 0.994277, 0.8705882, 1, 0, 1,
-0.9106606, 0.6292362, -0.8195909, 0.8666667, 1, 0, 1,
-0.9028649, 1.07764, -1.523078, 0.8588235, 1, 0, 1,
-0.902249, -0.7078596, -4.538629, 0.854902, 1, 0, 1,
-0.8967246, -0.2159961, -0.01824722, 0.8470588, 1, 0, 1,
-0.8920521, -0.02726043, -1.344644, 0.8431373, 1, 0, 1,
-0.8917903, 0.2373001, -1.329115, 0.8352941, 1, 0, 1,
-0.8904307, 0.01337571, -1.157245, 0.8313726, 1, 0, 1,
-0.8897092, -0.5015564, -1.029336, 0.8235294, 1, 0, 1,
-0.8842947, 1.310758, -0.8652932, 0.8196079, 1, 0, 1,
-0.876346, 0.3272294, -0.3829464, 0.8117647, 1, 0, 1,
-0.8682931, 1.251338, 0.5560061, 0.8078431, 1, 0, 1,
-0.8669711, -0.1857944, -2.464406, 0.8, 1, 0, 1,
-0.8586156, 0.3159709, -3.505772, 0.7921569, 1, 0, 1,
-0.8517376, -0.8099725, -3.506986, 0.7882353, 1, 0, 1,
-0.8503866, -0.4553405, -1.239878, 0.7803922, 1, 0, 1,
-0.8447177, -0.6823692, -3.793191, 0.7764706, 1, 0, 1,
-0.8441095, -0.4896262, -1.219296, 0.7686275, 1, 0, 1,
-0.8426136, 0.09128078, -0.05348608, 0.7647059, 1, 0, 1,
-0.8420816, -0.4852517, -1.390002, 0.7568628, 1, 0, 1,
-0.8416852, -0.2403287, -0.6412427, 0.7529412, 1, 0, 1,
-0.8412361, -1.163938, -1.624752, 0.7450981, 1, 0, 1,
-0.8374855, 0.07788073, -0.75453, 0.7411765, 1, 0, 1,
-0.8372258, 0.7314835, 0.08858833, 0.7333333, 1, 0, 1,
-0.829521, 0.8256676, -1.191734, 0.7294118, 1, 0, 1,
-0.8244334, 0.7293897, -0.3992528, 0.7215686, 1, 0, 1,
-0.8243707, 0.4173627, -1.171957, 0.7176471, 1, 0, 1,
-0.8194891, -0.5520846, -1.165219, 0.7098039, 1, 0, 1,
-0.8138325, -0.9171764, -2.430731, 0.7058824, 1, 0, 1,
-0.8138152, 0.5740231, -0.8371539, 0.6980392, 1, 0, 1,
-0.8117122, -1.061387, -1.14196, 0.6901961, 1, 0, 1,
-0.8093373, -0.0931617, -2.111184, 0.6862745, 1, 0, 1,
-0.8078523, 1.07234, 0.03805322, 0.6784314, 1, 0, 1,
-0.8076005, -1.296801, -2.969999, 0.6745098, 1, 0, 1,
-0.7919453, 0.4054863, 0.2130792, 0.6666667, 1, 0, 1,
-0.7900044, -0.6373336, -3.861593, 0.6627451, 1, 0, 1,
-0.7792624, 0.04387811, -1.694198, 0.654902, 1, 0, 1,
-0.7788723, 1.304227, -0.5587639, 0.6509804, 1, 0, 1,
-0.7688274, -1.819678, -4.157537, 0.6431373, 1, 0, 1,
-0.7642308, 0.6419299, -1.10894, 0.6392157, 1, 0, 1,
-0.7634417, 0.27008, -1.303548, 0.6313726, 1, 0, 1,
-0.7618728, 0.4709575, -2.166397, 0.627451, 1, 0, 1,
-0.7608517, 1.374693, -0.8480637, 0.6196079, 1, 0, 1,
-0.7586484, 0.282529, 1.132149, 0.6156863, 1, 0, 1,
-0.7562344, -1.750742, -3.774566, 0.6078432, 1, 0, 1,
-0.7502719, 1.520898, -3.496667, 0.6039216, 1, 0, 1,
-0.7417654, -0.3788143, -1.261763, 0.5960785, 1, 0, 1,
-0.740979, -1.572646, -2.771574, 0.5882353, 1, 0, 1,
-0.7383946, 0.6409486, -1.790595, 0.5843138, 1, 0, 1,
-0.7356608, -0.3741051, -3.50034, 0.5764706, 1, 0, 1,
-0.7352487, -1.089002, -0.7714465, 0.572549, 1, 0, 1,
-0.7346125, -0.3456846, -1.642807, 0.5647059, 1, 0, 1,
-0.7340738, 0.8659018, -1.294247, 0.5607843, 1, 0, 1,
-0.7339692, 0.9105558, -0.9962015, 0.5529412, 1, 0, 1,
-0.7300812, 1.383685, -0.776778, 0.5490196, 1, 0, 1,
-0.7282903, 0.8440403, -1.248742, 0.5411765, 1, 0, 1,
-0.7232335, -2.299647, -0.9473316, 0.5372549, 1, 0, 1,
-0.7217865, 0.3954131, -1.208285, 0.5294118, 1, 0, 1,
-0.7185392, 0.6770132, -1.441109, 0.5254902, 1, 0, 1,
-0.7179399, 0.4799777, -1.40251, 0.5176471, 1, 0, 1,
-0.7169602, 2.945718, -0.1112876, 0.5137255, 1, 0, 1,
-0.7168813, -0.2343152, -0.8156861, 0.5058824, 1, 0, 1,
-0.7135277, 1.125493, 0.5214008, 0.5019608, 1, 0, 1,
-0.7128748, 0.9406199, 0.008094057, 0.4941176, 1, 0, 1,
-0.7127314, -0.9818262, -3.463453, 0.4862745, 1, 0, 1,
-0.7088036, 0.5893043, 0.2482767, 0.4823529, 1, 0, 1,
-0.7081974, -0.7865036, -1.748541, 0.4745098, 1, 0, 1,
-0.7081324, 1.061394, -1.083024, 0.4705882, 1, 0, 1,
-0.7038094, 0.281441, -0.6838998, 0.4627451, 1, 0, 1,
-0.6989598, 1.138758, -2.442989, 0.4588235, 1, 0, 1,
-0.6961309, -1.243195, -2.160799, 0.4509804, 1, 0, 1,
-0.6957705, -1.178051, -3.425419, 0.4470588, 1, 0, 1,
-0.6949499, -1.010057, -3.323107, 0.4392157, 1, 0, 1,
-0.6917576, -0.7719933, -1.218157, 0.4352941, 1, 0, 1,
-0.6881711, -0.9615891, -2.296228, 0.427451, 1, 0, 1,
-0.6874545, -1.447767, -1.58391, 0.4235294, 1, 0, 1,
-0.6844752, 0.2069814, -1.621945, 0.4156863, 1, 0, 1,
-0.6828274, -0.7726849, -1.537052, 0.4117647, 1, 0, 1,
-0.681007, -0.7154184, -4.891215, 0.4039216, 1, 0, 1,
-0.6799194, 0.7913037, -2.838345, 0.3960784, 1, 0, 1,
-0.6762539, -1.670626, -1.530888, 0.3921569, 1, 0, 1,
-0.6750588, -0.4985877, -1.437956, 0.3843137, 1, 0, 1,
-0.6736253, -1.031106, -2.585975, 0.3803922, 1, 0, 1,
-0.6692756, 0.1881624, -0.7597659, 0.372549, 1, 0, 1,
-0.6666778, -0.2634036, -2.890938, 0.3686275, 1, 0, 1,
-0.6640591, -0.8573482, -1.825963, 0.3607843, 1, 0, 1,
-0.6609043, 0.6626926, -1.710015, 0.3568628, 1, 0, 1,
-0.6519347, -1.365356, -2.498011, 0.3490196, 1, 0, 1,
-0.6492847, -1.33565, -3.829261, 0.345098, 1, 0, 1,
-0.6491761, -0.2975207, -1.063287, 0.3372549, 1, 0, 1,
-0.6464186, -0.2108675, -2.079676, 0.3333333, 1, 0, 1,
-0.6377406, -1.099842, -3.170564, 0.3254902, 1, 0, 1,
-0.6353921, -1.613236, -3.488752, 0.3215686, 1, 0, 1,
-0.6322771, 1.611439, -1.324009, 0.3137255, 1, 0, 1,
-0.6300682, -0.3913136, -3.54597, 0.3098039, 1, 0, 1,
-0.6268055, -1.504165, -1.270283, 0.3019608, 1, 0, 1,
-0.6257083, -1.731453, -2.592467, 0.2941177, 1, 0, 1,
-0.6117195, -0.2745217, -3.279884, 0.2901961, 1, 0, 1,
-0.6078685, -0.9218096, -3.099169, 0.282353, 1, 0, 1,
-0.6008772, -0.4098071, -1.719779, 0.2784314, 1, 0, 1,
-0.5965878, -0.7353111, -2.228513, 0.2705882, 1, 0, 1,
-0.5912249, -0.2463749, -2.716791, 0.2666667, 1, 0, 1,
-0.5904382, -0.05352529, -1.209016, 0.2588235, 1, 0, 1,
-0.5900746, -0.8343416, -1.142825, 0.254902, 1, 0, 1,
-0.5846465, 0.2948188, 0.3442833, 0.2470588, 1, 0, 1,
-0.5831913, 0.5990298, -0.9404658, 0.2431373, 1, 0, 1,
-0.5800515, -1.223082, -4.336289, 0.2352941, 1, 0, 1,
-0.5762053, -1.725596, -0.9083287, 0.2313726, 1, 0, 1,
-0.5744196, -0.4406009, -0.8620407, 0.2235294, 1, 0, 1,
-0.5680825, -0.6825615, -4.238781, 0.2196078, 1, 0, 1,
-0.5676882, 0.6872914, -1.515814, 0.2117647, 1, 0, 1,
-0.5665308, -1.05707, -2.521211, 0.2078431, 1, 0, 1,
-0.5659078, -1.400928, -2.489916, 0.2, 1, 0, 1,
-0.5603956, 0.3381422, 0.1045278, 0.1921569, 1, 0, 1,
-0.5588227, -0.583138, -2.783885, 0.1882353, 1, 0, 1,
-0.5574563, 1.029621, -0.5272932, 0.1803922, 1, 0, 1,
-0.5574237, 0.01220234, 0.2130522, 0.1764706, 1, 0, 1,
-0.5540857, 1.503002, -0.01666947, 0.1686275, 1, 0, 1,
-0.5511129, 1.972662, -0.1801588, 0.1647059, 1, 0, 1,
-0.5418893, 0.8249357, 0.2173799, 0.1568628, 1, 0, 1,
-0.5379661, 1.391422, 1.07823, 0.1529412, 1, 0, 1,
-0.5294653, 1.322296, 0.8303186, 0.145098, 1, 0, 1,
-0.5264719, -0.7327917, -2.114278, 0.1411765, 1, 0, 1,
-0.5251775, 0.09492454, -1.499431, 0.1333333, 1, 0, 1,
-0.5239928, 0.3485462, -0.6025187, 0.1294118, 1, 0, 1,
-0.5239513, -0.7623612, -2.5055, 0.1215686, 1, 0, 1,
-0.5216837, 0.1164366, -2.810013, 0.1176471, 1, 0, 1,
-0.5193786, 0.659273, 0.8346696, 0.1098039, 1, 0, 1,
-0.5185331, -1.210849, -1.137997, 0.1058824, 1, 0, 1,
-0.5184856, -1.016201, -2.348849, 0.09803922, 1, 0, 1,
-0.5099469, -1.200412, -1.598916, 0.09019608, 1, 0, 1,
-0.5070679, -0.8476189, -1.0737, 0.08627451, 1, 0, 1,
-0.5066373, -0.7723003, -3.453064, 0.07843138, 1, 0, 1,
-0.5036227, 0.5366048, -0.2113461, 0.07450981, 1, 0, 1,
-0.5031957, 0.3455716, -1.241324, 0.06666667, 1, 0, 1,
-0.4998282, 1.382712, -1.020267, 0.0627451, 1, 0, 1,
-0.4986652, 0.6630941, -0.5347672, 0.05490196, 1, 0, 1,
-0.4979427, -0.5014741, -2.437311, 0.05098039, 1, 0, 1,
-0.4720615, -0.4649136, -3.329008, 0.04313726, 1, 0, 1,
-0.4689417, 0.4283587, -0.4031695, 0.03921569, 1, 0, 1,
-0.4653209, 3.001415, -0.8874051, 0.03137255, 1, 0, 1,
-0.4628902, 0.2802254, -2.423907, 0.02745098, 1, 0, 1,
-0.4606723, -0.1572316, -4.142314, 0.01960784, 1, 0, 1,
-0.4583732, -0.03959066, 1.091739, 0.01568628, 1, 0, 1,
-0.4514571, -0.09675443, -1.929827, 0.007843138, 1, 0, 1,
-0.4500324, 0.2861027, -1.408525, 0.003921569, 1, 0, 1,
-0.4498062, 2.904375, 0.1026641, 0, 1, 0.003921569, 1,
-0.448884, -0.8257002, -3.372007, 0, 1, 0.01176471, 1,
-0.4475144, 1.72462, -0.01780925, 0, 1, 0.01568628, 1,
-0.447403, -2.291111, -2.29201, 0, 1, 0.02352941, 1,
-0.446857, -0.9695174, -2.893558, 0, 1, 0.02745098, 1,
-0.4412056, -2.409987, -1.007211, 0, 1, 0.03529412, 1,
-0.4393733, -0.9548655, -3.104112, 0, 1, 0.03921569, 1,
-0.4381592, 0.006102397, -0.9242326, 0, 1, 0.04705882, 1,
-0.4330885, 0.9459134, -1.736903, 0, 1, 0.05098039, 1,
-0.431736, -0.6174121, -2.612159, 0, 1, 0.05882353, 1,
-0.4310131, -1.053904, -4.584116, 0, 1, 0.0627451, 1,
-0.4248874, 0.137146, -1.414003, 0, 1, 0.07058824, 1,
-0.4235587, 1.097239, -0.5730574, 0, 1, 0.07450981, 1,
-0.4203292, 0.669576, -2.729149, 0, 1, 0.08235294, 1,
-0.4169688, 0.8263963, -0.7444692, 0, 1, 0.08627451, 1,
-0.4163151, -0.3144789, -2.281951, 0, 1, 0.09411765, 1,
-0.4149705, 0.1890041, -2.492473, 0, 1, 0.1019608, 1,
-0.4103008, 1.491383, -1.172891, 0, 1, 0.1058824, 1,
-0.4079132, 0.4703877, -1.294372, 0, 1, 0.1137255, 1,
-0.4070902, -0.9467621, -4.443743, 0, 1, 0.1176471, 1,
-0.4044344, -1.028791, -1.643365, 0, 1, 0.1254902, 1,
-0.3986806, -0.09012004, -4.62701, 0, 1, 0.1294118, 1,
-0.3976331, 0.4133172, -0.1195338, 0, 1, 0.1372549, 1,
-0.3924727, -1.591385, -2.492723, 0, 1, 0.1411765, 1,
-0.3923636, 2.128605, 0.677005, 0, 1, 0.1490196, 1,
-0.3905176, -2.199307, -2.104933, 0, 1, 0.1529412, 1,
-0.3853355, 0.04344657, -1.060795, 0, 1, 0.1607843, 1,
-0.3824463, 0.2700155, 0.01459078, 0, 1, 0.1647059, 1,
-0.3818161, -1.334936, -2.697846, 0, 1, 0.172549, 1,
-0.3804662, -0.5797294, -2.523613, 0, 1, 0.1764706, 1,
-0.3780247, 0.3244584, -0.7296801, 0, 1, 0.1843137, 1,
-0.3720674, 0.04305458, -1.622326, 0, 1, 0.1882353, 1,
-0.3692392, -1.071666, -3.796413, 0, 1, 0.1960784, 1,
-0.3682448, -1.099889, -1.096893, 0, 1, 0.2039216, 1,
-0.3576868, 0.3942928, -0.3073326, 0, 1, 0.2078431, 1,
-0.3572304, 0.4193071, -1.017375, 0, 1, 0.2156863, 1,
-0.3532639, -0.169567, -3.238292, 0, 1, 0.2196078, 1,
-0.3513171, -0.1310522, -1.458764, 0, 1, 0.227451, 1,
-0.3474063, -0.9808522, -3.925079, 0, 1, 0.2313726, 1,
-0.3471424, -1.187126, -2.163215, 0, 1, 0.2392157, 1,
-0.3458884, -0.5747101, -1.417996, 0, 1, 0.2431373, 1,
-0.3377629, -0.3089952, -2.109273, 0, 1, 0.2509804, 1,
-0.3341477, -2.0507, -2.541091, 0, 1, 0.254902, 1,
-0.3339176, 0.311583, -2.455839, 0, 1, 0.2627451, 1,
-0.3310397, 0.6857246, 0.3365032, 0, 1, 0.2666667, 1,
-0.3305293, 0.03126626, -2.272793, 0, 1, 0.2745098, 1,
-0.3293877, -0.8786029, -2.588441, 0, 1, 0.2784314, 1,
-0.3286511, -1.145813, -4.532796, 0, 1, 0.2862745, 1,
-0.3275835, -0.2037624, -2.192653, 0, 1, 0.2901961, 1,
-0.3272043, 0.7428507, 0.5996491, 0, 1, 0.2980392, 1,
-0.3257686, 2.021138, -0.5118221, 0, 1, 0.3058824, 1,
-0.3228435, -0.7642279, -2.753742, 0, 1, 0.3098039, 1,
-0.3201824, 0.1742639, -0.7157934, 0, 1, 0.3176471, 1,
-0.3162176, -1.404382, -4.09819, 0, 1, 0.3215686, 1,
-0.3140608, -0.5516442, -1.52851, 0, 1, 0.3294118, 1,
-0.3131119, 3.187429, 0.5614341, 0, 1, 0.3333333, 1,
-0.3129414, 0.737158, -0.9238751, 0, 1, 0.3411765, 1,
-0.3126064, 0.3854935, -1.115673, 0, 1, 0.345098, 1,
-0.3107082, 0.3232896, 0.7836593, 0, 1, 0.3529412, 1,
-0.3095259, -0.05790917, -2.107547, 0, 1, 0.3568628, 1,
-0.3077019, 1.072325, -0.4596965, 0, 1, 0.3647059, 1,
-0.3029367, -1.08567, -2.237038, 0, 1, 0.3686275, 1,
-0.2967199, 0.371773, 0.6678966, 0, 1, 0.3764706, 1,
-0.2926563, -1.271583, -3.289151, 0, 1, 0.3803922, 1,
-0.2911276, 1.314674, -0.4740477, 0, 1, 0.3882353, 1,
-0.2880706, -0.3582939, -2.443857, 0, 1, 0.3921569, 1,
-0.2851601, 0.9959245, 0.9127734, 0, 1, 0.4, 1,
-0.2752774, 0.5379044, -0.4521829, 0, 1, 0.4078431, 1,
-0.2666551, 0.4696723, 2.36704, 0, 1, 0.4117647, 1,
-0.2623243, -2.24235, -0.6667529, 0, 1, 0.4196078, 1,
-0.2604767, -1.200397, -2.966722, 0, 1, 0.4235294, 1,
-0.2571038, -0.412568, -2.02093, 0, 1, 0.4313726, 1,
-0.2570873, 0.07076187, -2.509104, 0, 1, 0.4352941, 1,
-0.2531699, 0.2683814, -0.7259008, 0, 1, 0.4431373, 1,
-0.2522056, -0.1999985, -2.190072, 0, 1, 0.4470588, 1,
-0.2461259, 1.159641, -2.906675, 0, 1, 0.454902, 1,
-0.2440325, -0.9870952, -3.292491, 0, 1, 0.4588235, 1,
-0.2431025, 0.294856, -0.4033208, 0, 1, 0.4666667, 1,
-0.2422812, 1.380779, -0.3199331, 0, 1, 0.4705882, 1,
-0.2402832, -1.452421, -2.738034, 0, 1, 0.4784314, 1,
-0.2312643, -0.7263145, -2.6983, 0, 1, 0.4823529, 1,
-0.2286578, -0.716739, -3.240196, 0, 1, 0.4901961, 1,
-0.2282379, 1.417864, -1.105555, 0, 1, 0.4941176, 1,
-0.2266264, -0.877694, -2.413343, 0, 1, 0.5019608, 1,
-0.2262398, 0.06704388, -3.194908, 0, 1, 0.509804, 1,
-0.2255447, -1.022525, -1.863546, 0, 1, 0.5137255, 1,
-0.2244206, 0.6109343, 1.010206, 0, 1, 0.5215687, 1,
-0.2195577, -0.02688367, -2.071276, 0, 1, 0.5254902, 1,
-0.2193841, 1.22834, 0.8686929, 0, 1, 0.5333334, 1,
-0.2190751, -0.8705856, -1.676726, 0, 1, 0.5372549, 1,
-0.2183062, 1.18192, -1.718935, 0, 1, 0.5450981, 1,
-0.2181134, -1.473812, -2.071069, 0, 1, 0.5490196, 1,
-0.2144127, -1.903174, -3.578277, 0, 1, 0.5568628, 1,
-0.2098275, -0.07860272, -1.462207, 0, 1, 0.5607843, 1,
-0.2097677, -1.57531, -3.781886, 0, 1, 0.5686275, 1,
-0.2087079, 0.1275595, -1.814007, 0, 1, 0.572549, 1,
-0.2083198, -0.2471289, -0.1348749, 0, 1, 0.5803922, 1,
-0.2026398, -1.671499, -1.256593, 0, 1, 0.5843138, 1,
-0.2002751, -1.064912, -1.880551, 0, 1, 0.5921569, 1,
-0.1994956, 0.08890223, -1.41278, 0, 1, 0.5960785, 1,
-0.1946264, -0.9330355, -1.688016, 0, 1, 0.6039216, 1,
-0.1928335, -0.4089719, -4.700724, 0, 1, 0.6117647, 1,
-0.1891614, 0.7119504, 1.110348, 0, 1, 0.6156863, 1,
-0.178963, -0.2004933, -2.674374, 0, 1, 0.6235294, 1,
-0.174851, 1.182484, 0.6866311, 0, 1, 0.627451, 1,
-0.1744614, -1.593729, -3.41113, 0, 1, 0.6352941, 1,
-0.1734619, 0.6782286, -0.9535156, 0, 1, 0.6392157, 1,
-0.1670769, 0.07041841, -1.411049, 0, 1, 0.6470588, 1,
-0.1670327, -0.1966713, -1.890395, 0, 1, 0.6509804, 1,
-0.1626141, 1.155248, 0.4070173, 0, 1, 0.6588235, 1,
-0.1621916, 0.01021318, -1.515347, 0, 1, 0.6627451, 1,
-0.1615153, -0.5328931, -3.336161, 0, 1, 0.6705883, 1,
-0.1577687, -0.5461865, -2.342971, 0, 1, 0.6745098, 1,
-0.1519575, 1.733976, 0.6132511, 0, 1, 0.682353, 1,
-0.1491637, -0.699505, -0.2136475, 0, 1, 0.6862745, 1,
-0.1484974, 1.297986, -1.070239, 0, 1, 0.6941177, 1,
-0.1483011, -0.0170642, -1.749031, 0, 1, 0.7019608, 1,
-0.1480592, -1.049436, -2.072251, 0, 1, 0.7058824, 1,
-0.1478252, 1.067294, -1.67452, 0, 1, 0.7137255, 1,
-0.1471714, 0.9310887, -0.4740101, 0, 1, 0.7176471, 1,
-0.1405701, -0.7460519, -2.451465, 0, 1, 0.7254902, 1,
-0.1353226, 0.3315917, -1.259441, 0, 1, 0.7294118, 1,
-0.1309086, 0.008965218, -1.000128, 0, 1, 0.7372549, 1,
-0.1256711, -1.673925, -4.00564, 0, 1, 0.7411765, 1,
-0.1244038, 0.04622413, -0.7999308, 0, 1, 0.7490196, 1,
-0.124056, -1.382555, -3.387009, 0, 1, 0.7529412, 1,
-0.1233031, 1.070232, -0.4979748, 0, 1, 0.7607843, 1,
-0.1206477, -1.601273, -2.526119, 0, 1, 0.7647059, 1,
-0.1196681, 0.7137353, -0.5244389, 0, 1, 0.772549, 1,
-0.1166075, -1.104679, -3.837875, 0, 1, 0.7764706, 1,
-0.1165582, -2.03835, -1.932955, 0, 1, 0.7843137, 1,
-0.1164153, -2.194233, -3.033345, 0, 1, 0.7882353, 1,
-0.1158744, -0.3268418, -2.543997, 0, 1, 0.7960784, 1,
-0.1154619, 0.6639883, 1.558349, 0, 1, 0.8039216, 1,
-0.107501, 1.172201, 0.1376518, 0, 1, 0.8078431, 1,
-0.107262, 0.7617918, 0.6873191, 0, 1, 0.8156863, 1,
-0.1045744, 0.3575588, 0.04965755, 0, 1, 0.8196079, 1,
-0.1044711, 0.8720157, 0.9300355, 0, 1, 0.827451, 1,
-0.1042521, -0.002743922, -1.0809, 0, 1, 0.8313726, 1,
-0.1034362, -0.5512226, -4.64022, 0, 1, 0.8392157, 1,
-0.09628489, 0.2384187, 0.0568751, 0, 1, 0.8431373, 1,
-0.09499067, -0.1292993, -3.751196, 0, 1, 0.8509804, 1,
-0.09494402, -0.0897688, -2.766943, 0, 1, 0.854902, 1,
-0.09279559, 0.6210341, 0.267437, 0, 1, 0.8627451, 1,
-0.0922276, 0.9621088, 0.02730415, 0, 1, 0.8666667, 1,
-0.08997712, 0.7277153, 0.04598304, 0, 1, 0.8745098, 1,
-0.08917315, -0.3191071, -1.523649, 0, 1, 0.8784314, 1,
-0.08627307, 2.528088, -1.755777, 0, 1, 0.8862745, 1,
-0.07855898, 1.41802, -1.000415, 0, 1, 0.8901961, 1,
-0.07597079, 0.3513265, -1.841235, 0, 1, 0.8980392, 1,
-0.0701277, -0.2364799, -3.021674, 0, 1, 0.9058824, 1,
-0.0699781, 0.9464179, 0.413937, 0, 1, 0.9098039, 1,
-0.0640352, 0.827531, 0.8300389, 0, 1, 0.9176471, 1,
-0.06314848, 0.1492075, 0.03609966, 0, 1, 0.9215686, 1,
-0.05956735, -0.7345036, -1.679776, 0, 1, 0.9294118, 1,
-0.04614709, 0.05347477, -1.158893, 0, 1, 0.9333333, 1,
-0.04393312, 0.2142576, -0.9412419, 0, 1, 0.9411765, 1,
-0.03941727, -0.1131386, -2.014081, 0, 1, 0.945098, 1,
-0.03844531, -0.2241177, -1.14756, 0, 1, 0.9529412, 1,
-0.03698676, 0.1628448, -2.026142, 0, 1, 0.9568627, 1,
-0.02698564, -0.1260075, -3.031424, 0, 1, 0.9647059, 1,
-0.02606935, 0.6777778, 0.2601793, 0, 1, 0.9686275, 1,
-0.01934177, 0.2170147, 0.7482861, 0, 1, 0.9764706, 1,
-0.01505717, -0.7951371, -3.673066, 0, 1, 0.9803922, 1,
-0.01388348, 0.1985974, 0.4051571, 0, 1, 0.9882353, 1,
-0.01324183, -0.4987191, -2.229265, 0, 1, 0.9921569, 1,
-0.01287723, 0.2057148, 1.241291, 0, 1, 1, 1,
-0.01002022, -1.835745, -3.370869, 0, 0.9921569, 1, 1,
-0.00747957, 0.337672, -0.2216058, 0, 0.9882353, 1, 1,
-0.006852779, 0.7892187, -0.7436464, 0, 0.9803922, 1, 1,
-0.004849613, 0.5941897, -0.8992581, 0, 0.9764706, 1, 1,
0.0002777561, -0.5457245, 4.298471, 0, 0.9686275, 1, 1,
0.01039792, 0.6653791, -0.6577831, 0, 0.9647059, 1, 1,
0.01157755, 0.8882951, -0.7571015, 0, 0.9568627, 1, 1,
0.01273443, 0.7495123, -1.8274, 0, 0.9529412, 1, 1,
0.01311185, -0.8012363, 3.246782, 0, 0.945098, 1, 1,
0.01541297, 1.200498, 0.01895767, 0, 0.9411765, 1, 1,
0.01603244, -0.05282042, 3.937354, 0, 0.9333333, 1, 1,
0.01606341, 0.2884446, 1.569557, 0, 0.9294118, 1, 1,
0.01774089, -0.4088055, 3.280242, 0, 0.9215686, 1, 1,
0.02097475, -0.6932521, 1.732075, 0, 0.9176471, 1, 1,
0.02223875, 0.5541612, -1.048876, 0, 0.9098039, 1, 1,
0.02897567, 0.004092006, 1.341089, 0, 0.9058824, 1, 1,
0.02935482, -0.2745793, 2.298591, 0, 0.8980392, 1, 1,
0.0322375, 0.569088, 1.822719, 0, 0.8901961, 1, 1,
0.03512391, -0.3507756, 4.444068, 0, 0.8862745, 1, 1,
0.03516852, 1.117165, -0.5780586, 0, 0.8784314, 1, 1,
0.03747606, 1.152949, 0.9909121, 0, 0.8745098, 1, 1,
0.0494077, 0.3613571, 0.2002807, 0, 0.8666667, 1, 1,
0.05121512, -0.7756211, 4.800631, 0, 0.8627451, 1, 1,
0.05139744, -1.169895, 2.252512, 0, 0.854902, 1, 1,
0.05217348, 0.7759762, 0.1193053, 0, 0.8509804, 1, 1,
0.0530702, 0.1909559, 0.970085, 0, 0.8431373, 1, 1,
0.05346397, 0.1150797, -0.05249256, 0, 0.8392157, 1, 1,
0.05508997, -0.3727227, 3.775049, 0, 0.8313726, 1, 1,
0.056554, 0.5052506, 1.525676, 0, 0.827451, 1, 1,
0.05695373, 0.3868741, -0.1119875, 0, 0.8196079, 1, 1,
0.06335635, -0.2284461, 2.246892, 0, 0.8156863, 1, 1,
0.06339233, 0.7778835, -0.2799782, 0, 0.8078431, 1, 1,
0.06481945, -0.9965806, 3.041334, 0, 0.8039216, 1, 1,
0.06884801, -1.150453, 3.512344, 0, 0.7960784, 1, 1,
0.06921739, -2.508751, 2.998553, 0, 0.7882353, 1, 1,
0.07312682, -1.626357, 3.791269, 0, 0.7843137, 1, 1,
0.07318056, -1.780802, 2.313953, 0, 0.7764706, 1, 1,
0.07434616, 0.04946085, -0.8127891, 0, 0.772549, 1, 1,
0.07435786, 0.6534607, -0.3960995, 0, 0.7647059, 1, 1,
0.08211312, 0.1435678, -0.4372596, 0, 0.7607843, 1, 1,
0.08236662, -1.212724, 3.492089, 0, 0.7529412, 1, 1,
0.08674763, -0.3144159, 3.026604, 0, 0.7490196, 1, 1,
0.08848024, -0.1112088, 1.982326, 0, 0.7411765, 1, 1,
0.08934195, 0.001574229, 2.111635, 0, 0.7372549, 1, 1,
0.08945124, -0.1732352, 1.396863, 0, 0.7294118, 1, 1,
0.09275535, -0.4026457, 2.386369, 0, 0.7254902, 1, 1,
0.09561048, -1.010881, 3.186345, 0, 0.7176471, 1, 1,
0.0976759, 2.678166, -0.2737233, 0, 0.7137255, 1, 1,
0.1111123, -0.005386527, 0.09491797, 0, 0.7058824, 1, 1,
0.1133016, 1.245637, 0.9000146, 0, 0.6980392, 1, 1,
0.1154976, 0.2545978, -0.04113444, 0, 0.6941177, 1, 1,
0.1160709, 0.4834168, 0.718251, 0, 0.6862745, 1, 1,
0.1192222, 0.08350481, 1.056931, 0, 0.682353, 1, 1,
0.1208169, -0.4707209, 2.651577, 0, 0.6745098, 1, 1,
0.1291055, 0.2364576, 0.4000685, 0, 0.6705883, 1, 1,
0.1325466, 0.1025484, 1.718154, 0, 0.6627451, 1, 1,
0.1326451, 1.881411, -1.82354, 0, 0.6588235, 1, 1,
0.1342704, 2.12891, 0.3334256, 0, 0.6509804, 1, 1,
0.1400628, 1.723031, -1.544816, 0, 0.6470588, 1, 1,
0.1406521, -0.2145758, 2.932703, 0, 0.6392157, 1, 1,
0.1412371, -0.01794174, 1.996656, 0, 0.6352941, 1, 1,
0.1440176, -0.512499, 2.576874, 0, 0.627451, 1, 1,
0.1446952, -0.3380319, 1.538277, 0, 0.6235294, 1, 1,
0.1460369, 1.83549, -1.704902, 0, 0.6156863, 1, 1,
0.1488321, 1.754823, -0.5001332, 0, 0.6117647, 1, 1,
0.155576, 1.165315, 0.5491543, 0, 0.6039216, 1, 1,
0.1575634, 0.09257471, 0.8693125, 0, 0.5960785, 1, 1,
0.1577915, 1.719442, 0.7638269, 0, 0.5921569, 1, 1,
0.1613061, 0.4507777, -1.067189, 0, 0.5843138, 1, 1,
0.1641993, -0.4737106, 4.064108, 0, 0.5803922, 1, 1,
0.1727411, 0.7238902, 1.751189, 0, 0.572549, 1, 1,
0.1752851, -0.4007774, 2.79434, 0, 0.5686275, 1, 1,
0.1755494, -1.33081, 3.376017, 0, 0.5607843, 1, 1,
0.1758186, -0.1352328, 1.978086, 0, 0.5568628, 1, 1,
0.1766644, 1.082622, 0.5186095, 0, 0.5490196, 1, 1,
0.181603, -0.02268797, 2.880254, 0, 0.5450981, 1, 1,
0.1847113, -0.274445, 1.663763, 0, 0.5372549, 1, 1,
0.1864056, -0.5368735, 1.920552, 0, 0.5333334, 1, 1,
0.1886875, 0.6724896, 0.4574533, 0, 0.5254902, 1, 1,
0.1954235, 0.8150824, 0.7388558, 0, 0.5215687, 1, 1,
0.1957417, -0.2549012, 1.173015, 0, 0.5137255, 1, 1,
0.1969073, 0.6683934, 0.0626045, 0, 0.509804, 1, 1,
0.1969782, 0.3052756, 1.356559, 0, 0.5019608, 1, 1,
0.1989349, -1.127167, 3.415996, 0, 0.4941176, 1, 1,
0.2005553, 0.4747756, 0.8693451, 0, 0.4901961, 1, 1,
0.2033273, 0.8858993, -0.3052251, 0, 0.4823529, 1, 1,
0.2053366, -0.7831219, 2.631116, 0, 0.4784314, 1, 1,
0.2245153, -2.102913, 1.517692, 0, 0.4705882, 1, 1,
0.2248162, -0.8590961, 3.644567, 0, 0.4666667, 1, 1,
0.22734, -0.7471071, 2.643107, 0, 0.4588235, 1, 1,
0.2274049, -0.5643373, 4.018978, 0, 0.454902, 1, 1,
0.2282779, -0.02559597, 0.6289771, 0, 0.4470588, 1, 1,
0.2304748, 1.022719, -0.1429862, 0, 0.4431373, 1, 1,
0.2305515, -0.3875391, 3.610425, 0, 0.4352941, 1, 1,
0.2319914, 0.6850932, -0.1574205, 0, 0.4313726, 1, 1,
0.2353473, 0.4192417, 1.317072, 0, 0.4235294, 1, 1,
0.2360768, -0.4839217, 2.359041, 0, 0.4196078, 1, 1,
0.2405352, -0.7371249, 3.166294, 0, 0.4117647, 1, 1,
0.2416984, -1.152682, 3.926022, 0, 0.4078431, 1, 1,
0.2417243, -0.1093614, 3.245193, 0, 0.4, 1, 1,
0.2418347, 1.952207, 0.0156115, 0, 0.3921569, 1, 1,
0.2452215, 2.432462, 0.8099249, 0, 0.3882353, 1, 1,
0.2453737, -0.7976954, 1.8443, 0, 0.3803922, 1, 1,
0.2479169, -0.6774293, 3.044586, 0, 0.3764706, 1, 1,
0.2510721, 0.6865799, 2.782247, 0, 0.3686275, 1, 1,
0.2536485, -0.7839153, 2.044837, 0, 0.3647059, 1, 1,
0.2538943, -0.5222021, 1.567657, 0, 0.3568628, 1, 1,
0.2543631, 0.7587069, -0.5327998, 0, 0.3529412, 1, 1,
0.2570577, 1.641853, 2.649861, 0, 0.345098, 1, 1,
0.2608905, 0.4130042, -0.9913036, 0, 0.3411765, 1, 1,
0.263346, -0.9596401, 1.780831, 0, 0.3333333, 1, 1,
0.263895, 0.5696304, 0.6921757, 0, 0.3294118, 1, 1,
0.2791792, -0.9461172, 2.399941, 0, 0.3215686, 1, 1,
0.2792159, -0.8107665, 2.220275, 0, 0.3176471, 1, 1,
0.2794832, 0.2729022, 0.5086964, 0, 0.3098039, 1, 1,
0.2846992, 0.3656167, 0.6485511, 0, 0.3058824, 1, 1,
0.2899639, 0.9873846, -0.7173646, 0, 0.2980392, 1, 1,
0.2916421, 1.184078, -0.05495803, 0, 0.2901961, 1, 1,
0.295847, -1.537228, 2.582192, 0, 0.2862745, 1, 1,
0.3017957, 2.354882, -0.1873335, 0, 0.2784314, 1, 1,
0.3028343, 0.3864886, 0.9296489, 0, 0.2745098, 1, 1,
0.3032266, -1.222366, 3.48918, 0, 0.2666667, 1, 1,
0.3055053, 1.180005, 2.233093, 0, 0.2627451, 1, 1,
0.3100069, 0.153609, 0.3612739, 0, 0.254902, 1, 1,
0.3128534, -1.016852, 5.127727, 0, 0.2509804, 1, 1,
0.313024, 0.4684241, -0.07958043, 0, 0.2431373, 1, 1,
0.3135691, -0.5665496, 2.631002, 0, 0.2392157, 1, 1,
0.3137296, -0.2249774, 2.177529, 0, 0.2313726, 1, 1,
0.3142239, -0.3279941, 2.788446, 0, 0.227451, 1, 1,
0.3153265, -0.4990844, 1.233271, 0, 0.2196078, 1, 1,
0.3226128, -0.1379555, 2.578626, 0, 0.2156863, 1, 1,
0.3235551, 0.3986427, -0.8091872, 0, 0.2078431, 1, 1,
0.324079, 0.5150368, 0.1906522, 0, 0.2039216, 1, 1,
0.3292246, -0.2339729, 2.348469, 0, 0.1960784, 1, 1,
0.3350652, 1.196602, 1.071547, 0, 0.1882353, 1, 1,
0.3358713, -2.638015, 0.8808404, 0, 0.1843137, 1, 1,
0.3422413, -0.4361823, 2.512215, 0, 0.1764706, 1, 1,
0.3424017, -0.9567738, 2.515399, 0, 0.172549, 1, 1,
0.3483596, -0.5230761, 2.09163, 0, 0.1647059, 1, 1,
0.3494081, 0.339209, 1.353565, 0, 0.1607843, 1, 1,
0.353507, -0.08929057, 0.1726509, 0, 0.1529412, 1, 1,
0.3543516, 0.1953136, -0.2248936, 0, 0.1490196, 1, 1,
0.3566925, -1.430026, 2.530493, 0, 0.1411765, 1, 1,
0.3585302, -1.656024, 3.952857, 0, 0.1372549, 1, 1,
0.36109, 0.3985104, 2.262637, 0, 0.1294118, 1, 1,
0.3650959, 0.7230526, -0.6755386, 0, 0.1254902, 1, 1,
0.3699187, 0.9226099, 0.06410641, 0, 0.1176471, 1, 1,
0.372293, 0.07498278, 1.51028, 0, 0.1137255, 1, 1,
0.3775193, 0.316786, 1.935502, 0, 0.1058824, 1, 1,
0.3778488, -0.765044, 3.1824, 0, 0.09803922, 1, 1,
0.3799433, 1.964728, 0.6483793, 0, 0.09411765, 1, 1,
0.3810307, 0.6375197, 0.4656021, 0, 0.08627451, 1, 1,
0.3865921, 0.09772737, -0.03080067, 0, 0.08235294, 1, 1,
0.3893507, 0.02483118, 1.492509, 0, 0.07450981, 1, 1,
0.39318, 0.6198385, -0.3687325, 0, 0.07058824, 1, 1,
0.3969137, -0.1980577, 2.046968, 0, 0.0627451, 1, 1,
0.4019928, -0.8498248, 3.697227, 0, 0.05882353, 1, 1,
0.4034576, -0.03650027, 2.843411, 0, 0.05098039, 1, 1,
0.4035472, 0.7607921, -2.139328, 0, 0.04705882, 1, 1,
0.4061833, -1.348686, 2.052663, 0, 0.03921569, 1, 1,
0.410444, 0.515799, 0.955206, 0, 0.03529412, 1, 1,
0.4127957, -0.357761, 1.889957, 0, 0.02745098, 1, 1,
0.4191089, -0.8731403, 3.779734, 0, 0.02352941, 1, 1,
0.4191412, -0.4869421, 3.21405, 0, 0.01568628, 1, 1,
0.424022, -0.1793193, 2.847521, 0, 0.01176471, 1, 1,
0.4297723, -0.8868479, 1.189102, 0, 0.003921569, 1, 1,
0.431373, -1.498965, 3.852692, 0.003921569, 0, 1, 1,
0.4319306, -1.113128, 2.612621, 0.007843138, 0, 1, 1,
0.4346665, 0.6961939, -1.149453, 0.01568628, 0, 1, 1,
0.434696, -0.03198585, 2.855521, 0.01960784, 0, 1, 1,
0.4448687, -1.553285, 4.024801, 0.02745098, 0, 1, 1,
0.4450143, 0.9522437, -0.1740576, 0.03137255, 0, 1, 1,
0.4466254, 0.1576823, 1.714228, 0.03921569, 0, 1, 1,
0.4474502, -1.875131, 3.467494, 0.04313726, 0, 1, 1,
0.4510119, 1.260685, -1.331731, 0.05098039, 0, 1, 1,
0.4532784, 0.4596982, 0.887729, 0.05490196, 0, 1, 1,
0.4582882, -0.08316941, 0.8481616, 0.0627451, 0, 1, 1,
0.4585476, -1.004904, 0.7626798, 0.06666667, 0, 1, 1,
0.4632953, -0.5946026, 3.799451, 0.07450981, 0, 1, 1,
0.4645041, 0.9305395, 0.2088102, 0.07843138, 0, 1, 1,
0.4648343, 0.9398937, 1.652113, 0.08627451, 0, 1, 1,
0.4699248, -1.110391, 2.133472, 0.09019608, 0, 1, 1,
0.4720965, 1.628141, -0.04495785, 0.09803922, 0, 1, 1,
0.4776734, 1.715908, 1.065419, 0.1058824, 0, 1, 1,
0.4807622, 0.09662861, 1.541428, 0.1098039, 0, 1, 1,
0.4829399, -0.1271223, 2.946533, 0.1176471, 0, 1, 1,
0.4833155, 1.885185, 0.3125817, 0.1215686, 0, 1, 1,
0.4887873, -1.691084, 3.220166, 0.1294118, 0, 1, 1,
0.489372, -0.02337973, 4.31047, 0.1333333, 0, 1, 1,
0.4963832, 0.5614455, -0.4743034, 0.1411765, 0, 1, 1,
0.4988853, -0.2157815, 2.268397, 0.145098, 0, 1, 1,
0.5001002, -0.1029651, 0.869347, 0.1529412, 0, 1, 1,
0.501013, 0.2486768, -0.1090044, 0.1568628, 0, 1, 1,
0.5012821, 0.6220365, 0.5007041, 0.1647059, 0, 1, 1,
0.5029321, -0.6813843, 1.633492, 0.1686275, 0, 1, 1,
0.5033046, 1.273802, 0.2280134, 0.1764706, 0, 1, 1,
0.5040706, -0.07540978, 2.184845, 0.1803922, 0, 1, 1,
0.5121382, 0.5428455, 1.467209, 0.1882353, 0, 1, 1,
0.5121884, -0.6650903, 3.50494, 0.1921569, 0, 1, 1,
0.5137703, -1.25504, 1.659466, 0.2, 0, 1, 1,
0.5139477, -0.8931604, 3.354547, 0.2078431, 0, 1, 1,
0.5178916, 0.3392, 0.5004036, 0.2117647, 0, 1, 1,
0.518611, -1.524783, 3.275259, 0.2196078, 0, 1, 1,
0.5221499, -0.8591681, 2.623863, 0.2235294, 0, 1, 1,
0.5259299, -0.9637259, 2.846884, 0.2313726, 0, 1, 1,
0.5272596, -0.08414792, 2.890013, 0.2352941, 0, 1, 1,
0.5282819, 0.9797828, 0.5887825, 0.2431373, 0, 1, 1,
0.5297146, -1.200577, 2.899926, 0.2470588, 0, 1, 1,
0.5308745, -0.08884603, 0.4930566, 0.254902, 0, 1, 1,
0.5329881, -1.636388, 2.668295, 0.2588235, 0, 1, 1,
0.5333703, 1.002569, 0.3040412, 0.2666667, 0, 1, 1,
0.5346503, -0.5146813, 2.44278, 0.2705882, 0, 1, 1,
0.5354033, -0.3427264, 3.017298, 0.2784314, 0, 1, 1,
0.542953, -0.142548, 1.54539, 0.282353, 0, 1, 1,
0.5446665, 1.807117, 0.7006386, 0.2901961, 0, 1, 1,
0.5447916, 0.9027687, 1.711251, 0.2941177, 0, 1, 1,
0.5462232, 2.239825, 1.046199, 0.3019608, 0, 1, 1,
0.5491261, -0.1623684, 1.527336, 0.3098039, 0, 1, 1,
0.5520899, -0.3344002, 1.220196, 0.3137255, 0, 1, 1,
0.5539792, 2.10322, 1.602033, 0.3215686, 0, 1, 1,
0.5574912, 1.003595, -1.204788, 0.3254902, 0, 1, 1,
0.5615739, -0.00141069, 2.093138, 0.3333333, 0, 1, 1,
0.5620452, 2.603695, 0.5283139, 0.3372549, 0, 1, 1,
0.5655373, 1.203841, 0.8285219, 0.345098, 0, 1, 1,
0.5676277, 1.091509, 0.1987138, 0.3490196, 0, 1, 1,
0.5725786, 0.3887584, 0.5656403, 0.3568628, 0, 1, 1,
0.575969, 1.047743, -0.5134543, 0.3607843, 0, 1, 1,
0.5762781, -0.9093994, 2.7357, 0.3686275, 0, 1, 1,
0.5779608, 1.112521, -0.4147645, 0.372549, 0, 1, 1,
0.5795587, -0.7687075, 1.890541, 0.3803922, 0, 1, 1,
0.5825129, 0.142878, 2.533473, 0.3843137, 0, 1, 1,
0.5880105, -0.3262323, 2.587411, 0.3921569, 0, 1, 1,
0.5882938, 1.240991, 0.423748, 0.3960784, 0, 1, 1,
0.590932, -1.513356, 1.246331, 0.4039216, 0, 1, 1,
0.5919787, 0.2696274, 1.986044, 0.4117647, 0, 1, 1,
0.5925036, -1.301609, 1.360599, 0.4156863, 0, 1, 1,
0.5939242, 1.021881, 0.6364989, 0.4235294, 0, 1, 1,
0.5996544, 0.569743, -1.20073, 0.427451, 0, 1, 1,
0.5997118, -0.9596735, 2.439101, 0.4352941, 0, 1, 1,
0.6001546, -1.051936, 3.487116, 0.4392157, 0, 1, 1,
0.6022303, 1.047078, 0.4795703, 0.4470588, 0, 1, 1,
0.607704, 1.015023, -2.165515, 0.4509804, 0, 1, 1,
0.6233038, -1.050465, 2.084457, 0.4588235, 0, 1, 1,
0.633374, -0.0113499, 1.360742, 0.4627451, 0, 1, 1,
0.6344314, -0.4162346, 2.113814, 0.4705882, 0, 1, 1,
0.635286, -0.8055115, 3.073967, 0.4745098, 0, 1, 1,
0.6391318, -0.08027248, 1.488353, 0.4823529, 0, 1, 1,
0.641009, 0.2014945, 1.227911, 0.4862745, 0, 1, 1,
0.6435285, 0.249634, 1.396579, 0.4941176, 0, 1, 1,
0.6439106, 0.8671222, 0.7184456, 0.5019608, 0, 1, 1,
0.6448197, 0.9160764, 0.8282341, 0.5058824, 0, 1, 1,
0.6457368, 2.061598, 1.53418, 0.5137255, 0, 1, 1,
0.6482678, -1.838777, 2.64046, 0.5176471, 0, 1, 1,
0.6505064, -1.121435, 3.116746, 0.5254902, 0, 1, 1,
0.6563852, -0.4583256, 2.732218, 0.5294118, 0, 1, 1,
0.6574337, -1.932031, 1.046108, 0.5372549, 0, 1, 1,
0.660227, -1.259602, 4.122101, 0.5411765, 0, 1, 1,
0.6768343, 0.3422388, 2.41998, 0.5490196, 0, 1, 1,
0.6833658, -1.054083, 1.362506, 0.5529412, 0, 1, 1,
0.6899818, 0.8384883, 2.587735, 0.5607843, 0, 1, 1,
0.6907746, -0.03376332, 2.979771, 0.5647059, 0, 1, 1,
0.6935523, 0.3480147, 0.02784847, 0.572549, 0, 1, 1,
0.694345, -0.3683509, 2.470642, 0.5764706, 0, 1, 1,
0.6948055, 0.2869006, -0.165761, 0.5843138, 0, 1, 1,
0.6983382, -1.387454, 5.704317, 0.5882353, 0, 1, 1,
0.7060273, -0.4326712, 2.474511, 0.5960785, 0, 1, 1,
0.7065004, 0.872592, 0.946374, 0.6039216, 0, 1, 1,
0.7066175, -0.8173735, 4.457678, 0.6078432, 0, 1, 1,
0.7152639, -0.17059, 2.553564, 0.6156863, 0, 1, 1,
0.7175704, -1.119852, 0.8592372, 0.6196079, 0, 1, 1,
0.7187674, 0.9406694, 0.9991906, 0.627451, 0, 1, 1,
0.7214431, 0.438288, 1.80361, 0.6313726, 0, 1, 1,
0.7215922, -1.633361, 2.387269, 0.6392157, 0, 1, 1,
0.7330226, 1.38362, 0.7947685, 0.6431373, 0, 1, 1,
0.7343405, -0.8920895, 2.699851, 0.6509804, 0, 1, 1,
0.7374813, -0.06527023, 1.731731, 0.654902, 0, 1, 1,
0.7381997, 2.120095, 2.194622, 0.6627451, 0, 1, 1,
0.7415648, -0.7154243, 2.64291, 0.6666667, 0, 1, 1,
0.7430245, 0.700121, 0.2984128, 0.6745098, 0, 1, 1,
0.7448009, -0.08916306, 1.506266, 0.6784314, 0, 1, 1,
0.7451488, 0.1296506, 1.398173, 0.6862745, 0, 1, 1,
0.7459843, 0.6856045, 0.6802675, 0.6901961, 0, 1, 1,
0.7510905, 0.3794666, 0.4447896, 0.6980392, 0, 1, 1,
0.7577206, 0.1715694, -0.3863326, 0.7058824, 0, 1, 1,
0.7614813, 0.159429, 0.7447532, 0.7098039, 0, 1, 1,
0.761799, -1.514764, 2.736659, 0.7176471, 0, 1, 1,
0.7722523, -0.2270773, 2.406343, 0.7215686, 0, 1, 1,
0.7828869, 0.125771, 0.7644307, 0.7294118, 0, 1, 1,
0.7834386, 1.427234, -0.1594027, 0.7333333, 0, 1, 1,
0.788439, -1.208243, 2.080877, 0.7411765, 0, 1, 1,
0.7884666, -1.052393, 1.248901, 0.7450981, 0, 1, 1,
0.7939553, 0.7603986, 0.9815, 0.7529412, 0, 1, 1,
0.7948604, -1.459644, 3.319447, 0.7568628, 0, 1, 1,
0.797556, -2.001853, 4.36098, 0.7647059, 0, 1, 1,
0.8006537, -0.2885436, 1.35019, 0.7686275, 0, 1, 1,
0.803532, -1.19628, 3.437936, 0.7764706, 0, 1, 1,
0.8071312, 2.495342, -0.7709601, 0.7803922, 0, 1, 1,
0.8086668, -0.6571241, 5.327675, 0.7882353, 0, 1, 1,
0.8153848, 0.3806682, -0.02692039, 0.7921569, 0, 1, 1,
0.8189179, 0.9678211, -2.058277, 0.8, 0, 1, 1,
0.8229021, 0.7901453, -0.2313459, 0.8078431, 0, 1, 1,
0.8238916, -0.9898829, 1.535418, 0.8117647, 0, 1, 1,
0.8259624, 1.191841, 0.5097553, 0.8196079, 0, 1, 1,
0.8262269, -0.8793351, 3.95742, 0.8235294, 0, 1, 1,
0.8288766, -0.507318, 3.058165, 0.8313726, 0, 1, 1,
0.82907, 0.9214121, 2.770013, 0.8352941, 0, 1, 1,
0.8452795, -1.261658, 1.221346, 0.8431373, 0, 1, 1,
0.8545191, 0.06292237, 1.607302, 0.8470588, 0, 1, 1,
0.8554463, 1.733414, 0.822653, 0.854902, 0, 1, 1,
0.8557978, -0.6452037, 3.65748, 0.8588235, 0, 1, 1,
0.8568011, -1.985589, 2.679723, 0.8666667, 0, 1, 1,
0.8582144, -0.9874641, 1.438811, 0.8705882, 0, 1, 1,
0.862955, 0.531781, 0.2454676, 0.8784314, 0, 1, 1,
0.8645559, -0.2979107, 3.663908, 0.8823529, 0, 1, 1,
0.8675171, 0.7543429, 1.564688, 0.8901961, 0, 1, 1,
0.8690775, 1.411063, -1.09609, 0.8941177, 0, 1, 1,
0.8705375, -2.439531, 1.566062, 0.9019608, 0, 1, 1,
0.8773516, -0.302469, 2.185354, 0.9098039, 0, 1, 1,
0.8842118, -0.250144, 2.563376, 0.9137255, 0, 1, 1,
0.8867041, 0.1508594, -0.1762487, 0.9215686, 0, 1, 1,
0.8955587, -0.2456966, 2.728557, 0.9254902, 0, 1, 1,
0.8960785, -1.520871, 0.682777, 0.9333333, 0, 1, 1,
0.9073839, 1.338886, 0.9051444, 0.9372549, 0, 1, 1,
0.9075224, 0.1833123, 0.7938755, 0.945098, 0, 1, 1,
0.9078414, 1.724478, 0.596654, 0.9490196, 0, 1, 1,
0.9114821, 1.425442, 0.5385086, 0.9568627, 0, 1, 1,
0.9144736, 0.5904695, 2.301277, 0.9607843, 0, 1, 1,
0.9166855, -0.4136685, 3.147525, 0.9686275, 0, 1, 1,
0.9168083, 0.8349803, -0.6615236, 0.972549, 0, 1, 1,
0.9243039, 0.5029038, 1.487003, 0.9803922, 0, 1, 1,
0.9285375, -0.460973, 1.925137, 0.9843137, 0, 1, 1,
0.9343013, -0.6385059, 0.9213668, 0.9921569, 0, 1, 1,
0.9410509, -0.1567509, 3.971446, 0.9960784, 0, 1, 1,
0.9444824, 0.98655, 2.522239, 1, 0, 0.9960784, 1,
0.9555512, -2.020483, 2.604275, 1, 0, 0.9882353, 1,
0.9561493, -0.8696316, 0.857621, 1, 0, 0.9843137, 1,
0.9563823, -0.08792365, 0.9027948, 1, 0, 0.9764706, 1,
0.9605498, -0.2280871, 2.718683, 1, 0, 0.972549, 1,
0.9605702, -1.084397, 2.39997, 1, 0, 0.9647059, 1,
0.9640712, -0.7825822, 3.918479, 1, 0, 0.9607843, 1,
0.9678379, -1.825212, 3.68012, 1, 0, 0.9529412, 1,
0.9718626, 0.3040092, 0.09786699, 1, 0, 0.9490196, 1,
0.9725457, -0.3044884, 1.279001, 1, 0, 0.9411765, 1,
0.9731711, 2.097898, -0.2070555, 1, 0, 0.9372549, 1,
0.975015, 0.7427505, 1.853063, 1, 0, 0.9294118, 1,
0.9764819, 1.3087, 0.5625591, 1, 0, 0.9254902, 1,
0.9825289, -0.5674401, 0.6969026, 1, 0, 0.9176471, 1,
0.9844725, -0.3219272, 0.6131374, 1, 0, 0.9137255, 1,
0.9882736, -0.9297317, 2.301926, 1, 0, 0.9058824, 1,
0.9896356, -0.8900111, 2.578043, 1, 0, 0.9019608, 1,
0.9914606, -0.2132108, 1.695827, 1, 0, 0.8941177, 1,
0.9958346, 0.715034, 0.932786, 1, 0, 0.8862745, 1,
0.9974326, 0.08550275, 0.1791177, 1, 0, 0.8823529, 1,
1.000368, 0.156864, 1.17254, 1, 0, 0.8745098, 1,
1.013518, 1.114458, 0.9368522, 1, 0, 0.8705882, 1,
1.018453, 0.3702315, 0.7236902, 1, 0, 0.8627451, 1,
1.024742, -1.620317, 1.406661, 1, 0, 0.8588235, 1,
1.025603, -0.119142, 1.36566, 1, 0, 0.8509804, 1,
1.02932, -1.399573, 2.075564, 1, 0, 0.8470588, 1,
1.031034, -0.7051239, 0.2257761, 1, 0, 0.8392157, 1,
1.034526, 0.04891337, 3.228708, 1, 0, 0.8352941, 1,
1.040219, -1.018425, 1.252769, 1, 0, 0.827451, 1,
1.043016, -1.782688, 3.275111, 1, 0, 0.8235294, 1,
1.057506, -0.6310513, 3.337674, 1, 0, 0.8156863, 1,
1.062011, 0.1742849, 0.5401325, 1, 0, 0.8117647, 1,
1.074632, 0.2331426, 1.819742, 1, 0, 0.8039216, 1,
1.087574, -0.4627746, 1.879656, 1, 0, 0.7960784, 1,
1.090637, 0.2866468, 4.371586, 1, 0, 0.7921569, 1,
1.091758, 1.43598, -0.1514666, 1, 0, 0.7843137, 1,
1.093475, 0.3728859, 2.468347, 1, 0, 0.7803922, 1,
1.096153, -0.1359448, 2.254311, 1, 0, 0.772549, 1,
1.097421, -1.932148, 3.211507, 1, 0, 0.7686275, 1,
1.099784, 0.685803, 2.130048, 1, 0, 0.7607843, 1,
1.100485, 0.6761028, -0.4578894, 1, 0, 0.7568628, 1,
1.101482, -0.806917, 3.234202, 1, 0, 0.7490196, 1,
1.122974, 0.5051772, 1.442483, 1, 0, 0.7450981, 1,
1.131965, -1.123254, 2.246029, 1, 0, 0.7372549, 1,
1.149945, 1.003818, 2.390583, 1, 0, 0.7333333, 1,
1.155963, 0.2160304, 0.7020451, 1, 0, 0.7254902, 1,
1.158317, 0.450484, 1.458866, 1, 0, 0.7215686, 1,
1.158327, 1.006065, -0.8905883, 1, 0, 0.7137255, 1,
1.176443, 0.5340363, 1.737268, 1, 0, 0.7098039, 1,
1.192103, 0.9941872, 0.5788944, 1, 0, 0.7019608, 1,
1.193562, 0.3484367, 2.419968, 1, 0, 0.6941177, 1,
1.205283, -0.6977258, 3.509681, 1, 0, 0.6901961, 1,
1.207943, 0.1443997, 3.213046, 1, 0, 0.682353, 1,
1.227436, 1.327987, 1.989466, 1, 0, 0.6784314, 1,
1.237203, -1.327307, 1.855712, 1, 0, 0.6705883, 1,
1.246248, 0.85559, 1.307584, 1, 0, 0.6666667, 1,
1.259448, 0.5853394, 0.4026482, 1, 0, 0.6588235, 1,
1.286176, -0.5552874, 2.95035, 1, 0, 0.654902, 1,
1.294666, 0.5217896, -0.1421423, 1, 0, 0.6470588, 1,
1.300525, 1.336224, 1.657961, 1, 0, 0.6431373, 1,
1.300773, -1.070099, 2.528983, 1, 0, 0.6352941, 1,
1.316545, 0.1753461, 2.347489, 1, 0, 0.6313726, 1,
1.332485, -0.1079845, 1.21575, 1, 0, 0.6235294, 1,
1.334458, 0.6644478, 0.4574335, 1, 0, 0.6196079, 1,
1.340828, 0.002135246, 0.8738135, 1, 0, 0.6117647, 1,
1.357051, 1.331138, 1.533734, 1, 0, 0.6078432, 1,
1.361713, 0.2539413, 1.069397, 1, 0, 0.6, 1,
1.369858, 1.118328, -0.1485867, 1, 0, 0.5921569, 1,
1.381044, 0.1025501, 1.69741, 1, 0, 0.5882353, 1,
1.38153, 2.004158, 0.06151038, 1, 0, 0.5803922, 1,
1.383298, -0.6261544, 1.641254, 1, 0, 0.5764706, 1,
1.393946, -0.3393798, 3.237411, 1, 0, 0.5686275, 1,
1.396592, 0.3436366, 1.951489, 1, 0, 0.5647059, 1,
1.402997, 0.6937796, 0.9984744, 1, 0, 0.5568628, 1,
1.408808, 0.1216604, 1.818999, 1, 0, 0.5529412, 1,
1.417015, -2.107952, 3.189018, 1, 0, 0.5450981, 1,
1.429119, 0.8668581, 2.275121, 1, 0, 0.5411765, 1,
1.440774, -0.607842, 3.494897, 1, 0, 0.5333334, 1,
1.446868, -0.8410191, 1.779865, 1, 0, 0.5294118, 1,
1.455689, -1.105103, 3.095731, 1, 0, 0.5215687, 1,
1.459749, -0.2250719, 3.077776, 1, 0, 0.5176471, 1,
1.48138, 0.5270929, 1.863634, 1, 0, 0.509804, 1,
1.531981, -0.2202782, 1.832846, 1, 0, 0.5058824, 1,
1.539462, -0.2007874, 1.587209, 1, 0, 0.4980392, 1,
1.54098, 0.6193968, 1.789316, 1, 0, 0.4901961, 1,
1.542174, -1.490664, 0.8492669, 1, 0, 0.4862745, 1,
1.549353, 1.207007, 1.0654, 1, 0, 0.4784314, 1,
1.558139, 1.034925, -0.6430945, 1, 0, 0.4745098, 1,
1.561717, 0.4018919, 1.437528, 1, 0, 0.4666667, 1,
1.585538, -0.01594518, 1.987889, 1, 0, 0.4627451, 1,
1.589462, 0.7618458, -0.9542994, 1, 0, 0.454902, 1,
1.599968, 0.6134046, 1.645635, 1, 0, 0.4509804, 1,
1.610118, 1.125841, 1.658175, 1, 0, 0.4431373, 1,
1.613083, -0.04884319, -0.4415589, 1, 0, 0.4392157, 1,
1.645861, -0.7228749, 1.78694, 1, 0, 0.4313726, 1,
1.651752, -0.6154112, 1.597172, 1, 0, 0.427451, 1,
1.661001, 1.688232, 0.7930837, 1, 0, 0.4196078, 1,
1.665402, -0.1197298, 2.366679, 1, 0, 0.4156863, 1,
1.683454, 0.02987825, 1.09846, 1, 0, 0.4078431, 1,
1.687152, 0.7756203, 0.9873242, 1, 0, 0.4039216, 1,
1.691137, -2.595793, 3.596846, 1, 0, 0.3960784, 1,
1.701264, 0.3422733, 0.6417301, 1, 0, 0.3882353, 1,
1.704472, -0.4232631, 1.776179, 1, 0, 0.3843137, 1,
1.739128, -0.5571335, 2.584167, 1, 0, 0.3764706, 1,
1.752218, -1.503498, 2.84275, 1, 0, 0.372549, 1,
1.75534, 1.537255, 0.09152197, 1, 0, 0.3647059, 1,
1.755572, -0.7030987, 1.100847, 1, 0, 0.3607843, 1,
1.759454, 0.7480245, 2.65555, 1, 0, 0.3529412, 1,
1.766416, -0.6743462, 1.658129, 1, 0, 0.3490196, 1,
1.7715, -1.426739, 2.164221, 1, 0, 0.3411765, 1,
1.77841, 0.472034, 1.519739, 1, 0, 0.3372549, 1,
1.782176, -0.9697146, 1.742105, 1, 0, 0.3294118, 1,
1.787307, -1.23941, 2.008315, 1, 0, 0.3254902, 1,
1.798894, 0.5272723, 2.25831, 1, 0, 0.3176471, 1,
1.807299, 0.7819804, 2.506013, 1, 0, 0.3137255, 1,
1.811459, 0.5111673, 2.681787, 1, 0, 0.3058824, 1,
1.828841, 0.9177365, 1.133835, 1, 0, 0.2980392, 1,
1.830268, 0.4681794, 0.6102807, 1, 0, 0.2941177, 1,
1.849293, 0.9315489, 1.726445, 1, 0, 0.2862745, 1,
1.850523, 0.9800486, 1.359727, 1, 0, 0.282353, 1,
1.856551, 0.07009899, 2.101697, 1, 0, 0.2745098, 1,
1.861343, -1.839226, 2.750993, 1, 0, 0.2705882, 1,
1.86834, -0.3840219, 1.408448, 1, 0, 0.2627451, 1,
1.868801, -0.04604257, 1.829003, 1, 0, 0.2588235, 1,
1.87057, 1.206872, 1.199024, 1, 0, 0.2509804, 1,
1.870745, 0.4638124, 3.061782, 1, 0, 0.2470588, 1,
1.87504, 0.3812459, 2.232411, 1, 0, 0.2392157, 1,
1.88477, 0.2828182, 2.000086, 1, 0, 0.2352941, 1,
1.885797, 0.2822882, 1.662041, 1, 0, 0.227451, 1,
1.919938, -0.8747467, 2.605907, 1, 0, 0.2235294, 1,
1.929567, -1.289877, 0.3395861, 1, 0, 0.2156863, 1,
1.937264, -0.516555, 1.905322, 1, 0, 0.2117647, 1,
1.940978, -0.3756059, 2.90438, 1, 0, 0.2039216, 1,
1.945186, 0.6574568, 0.8798961, 1, 0, 0.1960784, 1,
1.946522, 0.9721311, 2.34068, 1, 0, 0.1921569, 1,
1.947055, 0.3621597, 4.422781, 1, 0, 0.1843137, 1,
1.965987, -1.206954, 3.412909, 1, 0, 0.1803922, 1,
1.968065, 0.7151372, 2.173478, 1, 0, 0.172549, 1,
1.98826, -0.610221, 1.882379, 1, 0, 0.1686275, 1,
1.989659, -0.8992367, 1.383774, 1, 0, 0.1607843, 1,
2.013845, 0.4709614, 0.2361275, 1, 0, 0.1568628, 1,
2.01756, 1.299164, 2.613997, 1, 0, 0.1490196, 1,
2.023457, -0.3037569, 1.92144, 1, 0, 0.145098, 1,
2.029372, -0.2820195, 1.813533, 1, 0, 0.1372549, 1,
2.033355, 0.1887834, 1.500282, 1, 0, 0.1333333, 1,
2.060351, 0.1831723, 4.039715, 1, 0, 0.1254902, 1,
2.076213, 1.099284, 3.175713, 1, 0, 0.1215686, 1,
2.085931, 0.2230512, 0.2659105, 1, 0, 0.1137255, 1,
2.114434, -0.6092505, 2.097221, 1, 0, 0.1098039, 1,
2.144209, 1.291143, 2.470685, 1, 0, 0.1019608, 1,
2.155511, 1.768437, 0.7693233, 1, 0, 0.09411765, 1,
2.158248, -0.247202, 4.399327, 1, 0, 0.09019608, 1,
2.164054, 1.305709, -0.1507529, 1, 0, 0.08235294, 1,
2.197645, -0.02273904, 2.626838, 1, 0, 0.07843138, 1,
2.201725, -0.145271, 0.7365972, 1, 0, 0.07058824, 1,
2.284351, -0.2962465, 3.371542, 1, 0, 0.06666667, 1,
2.296473, -0.02545942, 0.5564576, 1, 0, 0.05882353, 1,
2.348572, 1.1063, 1.629571, 1, 0, 0.05490196, 1,
2.370089, 0.4108902, 0.6740484, 1, 0, 0.04705882, 1,
2.396419, 0.7244077, 0.746161, 1, 0, 0.04313726, 1,
2.482964, -1.047654, 2.398022, 1, 0, 0.03529412, 1,
2.588891, 0.03110764, 0.2943555, 1, 0, 0.03137255, 1,
2.655171, 0.2343421, 2.592766, 1, 0, 0.02352941, 1,
2.823968, 0.8197563, 3.761422, 1, 0, 0.01960784, 1,
2.86658, -0.9061598, 2.355028, 1, 0, 0.01176471, 1,
3.057185, 0.5354878, 1.327389, 1, 0, 0.007843138, 1
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
-0.02693617, -3.745461, -7.019876, 0, -0.5, 0.5, 0.5,
-0.02693617, -3.745461, -7.019876, 1, -0.5, 0.5, 0.5,
-0.02693617, -3.745461, -7.019876, 1, 1.5, 0.5, 0.5,
-0.02693617, -3.745461, -7.019876, 0, 1.5, 0.5, 0.5
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
-4.156574, 0.2233886, -7.019876, 0, -0.5, 0.5, 0.5,
-4.156574, 0.2233886, -7.019876, 1, -0.5, 0.5, 0.5,
-4.156574, 0.2233886, -7.019876, 1, 1.5, 0.5, 0.5,
-4.156574, 0.2233886, -7.019876, 0, 1.5, 0.5, 0.5
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
-4.156574, -3.745461, 0.264303, 0, -0.5, 0.5, 0.5,
-4.156574, -3.745461, 0.264303, 1, -0.5, 0.5, 0.5,
-4.156574, -3.745461, 0.264303, 1, 1.5, 0.5, 0.5,
-4.156574, -3.745461, 0.264303, 0, 1.5, 0.5, 0.5
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
-3, -2.829573, -5.338912,
3, -2.829573, -5.338912,
-3, -2.829573, -5.338912,
-3, -2.982221, -5.619072,
-2, -2.829573, -5.338912,
-2, -2.982221, -5.619072,
-1, -2.829573, -5.338912,
-1, -2.982221, -5.619072,
0, -2.829573, -5.338912,
0, -2.982221, -5.619072,
1, -2.829573, -5.338912,
1, -2.982221, -5.619072,
2, -2.829573, -5.338912,
2, -2.982221, -5.619072,
3, -2.829573, -5.338912,
3, -2.982221, -5.619072
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
-3, -3.287517, -6.179394, 0, -0.5, 0.5, 0.5,
-3, -3.287517, -6.179394, 1, -0.5, 0.5, 0.5,
-3, -3.287517, -6.179394, 1, 1.5, 0.5, 0.5,
-3, -3.287517, -6.179394, 0, 1.5, 0.5, 0.5,
-2, -3.287517, -6.179394, 0, -0.5, 0.5, 0.5,
-2, -3.287517, -6.179394, 1, -0.5, 0.5, 0.5,
-2, -3.287517, -6.179394, 1, 1.5, 0.5, 0.5,
-2, -3.287517, -6.179394, 0, 1.5, 0.5, 0.5,
-1, -3.287517, -6.179394, 0, -0.5, 0.5, 0.5,
-1, -3.287517, -6.179394, 1, -0.5, 0.5, 0.5,
-1, -3.287517, -6.179394, 1, 1.5, 0.5, 0.5,
-1, -3.287517, -6.179394, 0, 1.5, 0.5, 0.5,
0, -3.287517, -6.179394, 0, -0.5, 0.5, 0.5,
0, -3.287517, -6.179394, 1, -0.5, 0.5, 0.5,
0, -3.287517, -6.179394, 1, 1.5, 0.5, 0.5,
0, -3.287517, -6.179394, 0, 1.5, 0.5, 0.5,
1, -3.287517, -6.179394, 0, -0.5, 0.5, 0.5,
1, -3.287517, -6.179394, 1, -0.5, 0.5, 0.5,
1, -3.287517, -6.179394, 1, 1.5, 0.5, 0.5,
1, -3.287517, -6.179394, 0, 1.5, 0.5, 0.5,
2, -3.287517, -6.179394, 0, -0.5, 0.5, 0.5,
2, -3.287517, -6.179394, 1, -0.5, 0.5, 0.5,
2, -3.287517, -6.179394, 1, 1.5, 0.5, 0.5,
2, -3.287517, -6.179394, 0, 1.5, 0.5, 0.5,
3, -3.287517, -6.179394, 0, -0.5, 0.5, 0.5,
3, -3.287517, -6.179394, 1, -0.5, 0.5, 0.5,
3, -3.287517, -6.179394, 1, 1.5, 0.5, 0.5,
3, -3.287517, -6.179394, 0, 1.5, 0.5, 0.5
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
-3.203581, -2, -5.338912,
-3.203581, 3, -5.338912,
-3.203581, -2, -5.338912,
-3.362413, -2, -5.619072,
-3.203581, -1, -5.338912,
-3.362413, -1, -5.619072,
-3.203581, 0, -5.338912,
-3.362413, 0, -5.619072,
-3.203581, 1, -5.338912,
-3.362413, 1, -5.619072,
-3.203581, 2, -5.338912,
-3.362413, 2, -5.619072,
-3.203581, 3, -5.338912,
-3.362413, 3, -5.619072
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
-3.680077, -2, -6.179394, 0, -0.5, 0.5, 0.5,
-3.680077, -2, -6.179394, 1, -0.5, 0.5, 0.5,
-3.680077, -2, -6.179394, 1, 1.5, 0.5, 0.5,
-3.680077, -2, -6.179394, 0, 1.5, 0.5, 0.5,
-3.680077, -1, -6.179394, 0, -0.5, 0.5, 0.5,
-3.680077, -1, -6.179394, 1, -0.5, 0.5, 0.5,
-3.680077, -1, -6.179394, 1, 1.5, 0.5, 0.5,
-3.680077, -1, -6.179394, 0, 1.5, 0.5, 0.5,
-3.680077, 0, -6.179394, 0, -0.5, 0.5, 0.5,
-3.680077, 0, -6.179394, 1, -0.5, 0.5, 0.5,
-3.680077, 0, -6.179394, 1, 1.5, 0.5, 0.5,
-3.680077, 0, -6.179394, 0, 1.5, 0.5, 0.5,
-3.680077, 1, -6.179394, 0, -0.5, 0.5, 0.5,
-3.680077, 1, -6.179394, 1, -0.5, 0.5, 0.5,
-3.680077, 1, -6.179394, 1, 1.5, 0.5, 0.5,
-3.680077, 1, -6.179394, 0, 1.5, 0.5, 0.5,
-3.680077, 2, -6.179394, 0, -0.5, 0.5, 0.5,
-3.680077, 2, -6.179394, 1, -0.5, 0.5, 0.5,
-3.680077, 2, -6.179394, 1, 1.5, 0.5, 0.5,
-3.680077, 2, -6.179394, 0, 1.5, 0.5, 0.5,
-3.680077, 3, -6.179394, 0, -0.5, 0.5, 0.5,
-3.680077, 3, -6.179394, 1, -0.5, 0.5, 0.5,
-3.680077, 3, -6.179394, 1, 1.5, 0.5, 0.5,
-3.680077, 3, -6.179394, 0, 1.5, 0.5, 0.5
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
-3.203581, -2.829573, -4,
-3.203581, -2.829573, 4,
-3.203581, -2.829573, -4,
-3.362413, -2.982221, -4,
-3.203581, -2.829573, -2,
-3.362413, -2.982221, -2,
-3.203581, -2.829573, 0,
-3.362413, -2.982221, 0,
-3.203581, -2.829573, 2,
-3.362413, -2.982221, 2,
-3.203581, -2.829573, 4,
-3.362413, -2.982221, 4
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
-3.680077, -3.287517, -4, 0, -0.5, 0.5, 0.5,
-3.680077, -3.287517, -4, 1, -0.5, 0.5, 0.5,
-3.680077, -3.287517, -4, 1, 1.5, 0.5, 0.5,
-3.680077, -3.287517, -4, 0, 1.5, 0.5, 0.5,
-3.680077, -3.287517, -2, 0, -0.5, 0.5, 0.5,
-3.680077, -3.287517, -2, 1, -0.5, 0.5, 0.5,
-3.680077, -3.287517, -2, 1, 1.5, 0.5, 0.5,
-3.680077, -3.287517, -2, 0, 1.5, 0.5, 0.5,
-3.680077, -3.287517, 0, 0, -0.5, 0.5, 0.5,
-3.680077, -3.287517, 0, 1, -0.5, 0.5, 0.5,
-3.680077, -3.287517, 0, 1, 1.5, 0.5, 0.5,
-3.680077, -3.287517, 0, 0, 1.5, 0.5, 0.5,
-3.680077, -3.287517, 2, 0, -0.5, 0.5, 0.5,
-3.680077, -3.287517, 2, 1, -0.5, 0.5, 0.5,
-3.680077, -3.287517, 2, 1, 1.5, 0.5, 0.5,
-3.680077, -3.287517, 2, 0, 1.5, 0.5, 0.5,
-3.680077, -3.287517, 4, 0, -0.5, 0.5, 0.5,
-3.680077, -3.287517, 4, 1, -0.5, 0.5, 0.5,
-3.680077, -3.287517, 4, 1, 1.5, 0.5, 0.5,
-3.680077, -3.287517, 4, 0, 1.5, 0.5, 0.5
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
-3.203581, -2.829573, -5.338912,
-3.203581, 3.27635, -5.338912,
-3.203581, -2.829573, 5.867517,
-3.203581, 3.27635, 5.867517,
-3.203581, -2.829573, -5.338912,
-3.203581, -2.829573, 5.867517,
-3.203581, 3.27635, -5.338912,
-3.203581, 3.27635, 5.867517,
-3.203581, -2.829573, -5.338912,
3.149708, -2.829573, -5.338912,
-3.203581, -2.829573, 5.867517,
3.149708, -2.829573, 5.867517,
-3.203581, 3.27635, -5.338912,
3.149708, 3.27635, -5.338912,
-3.203581, 3.27635, 5.867517,
3.149708, 3.27635, 5.867517,
3.149708, -2.829573, -5.338912,
3.149708, 3.27635, -5.338912,
3.149708, -2.829573, 5.867517,
3.149708, 3.27635, 5.867517,
3.149708, -2.829573, -5.338912,
3.149708, -2.829573, 5.867517,
3.149708, 3.27635, -5.338912,
3.149708, 3.27635, 5.867517
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
var radius = 7.612373;
var distance = 33.86831;
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
mvMatrix.translate( 0.02693617, -0.2233886, -0.264303 );
mvMatrix.scale( 1.295494, 1.347978, 0.7344576 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.86831);
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
Diclofop-Methyl<-read.table("Diclofop-Methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Diclofop-Methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Diclofop' not found
```

```r
y<-Diclofop-Methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Diclofop' not found
```

```r
z<-Diclofop-Methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Diclofop' not found
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
-3.111057, 0.4951456, 0.1262474, 0, 0, 1, 1, 1,
-3.043545, -1.507632, -2.71938, 1, 0, 0, 1, 1,
-2.535603, -1.225027, -1.486373, 1, 0, 0, 1, 1,
-2.47779, 0.2231113, -0.6234427, 1, 0, 0, 1, 1,
-2.474104, -0.3219725, -1.266284, 1, 0, 0, 1, 1,
-2.445946, -1.19896, -3.165515, 1, 0, 0, 1, 1,
-2.393814, 1.796059, -1.200245, 0, 0, 0, 1, 1,
-2.348614, 1.530194, -2.878167, 0, 0, 0, 1, 1,
-2.322966, 2.009279, -1.639319, 0, 0, 0, 1, 1,
-2.312662, 0.003007061, -0.590703, 0, 0, 0, 1, 1,
-2.312526, -0.6424538, -2.245617, 0, 0, 0, 1, 1,
-2.252645, 1.002817, -1.391111, 0, 0, 0, 1, 1,
-2.204132, 0.6203215, -0.349673, 0, 0, 0, 1, 1,
-2.145979, -0.6698735, -2.147387, 1, 1, 1, 1, 1,
-2.143782, -0.4608092, -2.216383, 1, 1, 1, 1, 1,
-2.130991, 1.460492, -0.8142931, 1, 1, 1, 1, 1,
-2.096913, -0.08084538, 0.06447504, 1, 1, 1, 1, 1,
-2.086432, 1.054277, -0.2295434, 1, 1, 1, 1, 1,
-2.069887, 0.2812744, -0.8694041, 1, 1, 1, 1, 1,
-2.019788, -0.8292621, -0.7336072, 1, 1, 1, 1, 1,
-2.005008, -0.317853, -2.39949, 1, 1, 1, 1, 1,
-1.990648, -0.1907391, -0.9002461, 1, 1, 1, 1, 1,
-1.989637, 1.710491, -1.736312, 1, 1, 1, 1, 1,
-1.980355, -0.9253088, -3.145005, 1, 1, 1, 1, 1,
-1.964301, -0.3598573, -0.8127806, 1, 1, 1, 1, 1,
-1.959375, -1.055864, -3.850187, 1, 1, 1, 1, 1,
-1.953553, -0.6143307, -0.9440995, 1, 1, 1, 1, 1,
-1.922981, 0.2573264, -1.819732, 1, 1, 1, 1, 1,
-1.901141, -1.004931, -1.033975, 0, 0, 1, 1, 1,
-1.875959, -1.133883, -4.011998, 1, 0, 0, 1, 1,
-1.865637, 0.9505457, -2.434328, 1, 0, 0, 1, 1,
-1.863616, -0.1800723, -2.904333, 1, 0, 0, 1, 1,
-1.859517, -1.644697, -2.357222, 1, 0, 0, 1, 1,
-1.849419, -0.1970179, -2.062261, 1, 0, 0, 1, 1,
-1.810919, 0.4468764, -0.6208436, 0, 0, 0, 1, 1,
-1.810287, -1.148082, -2.581654, 0, 0, 0, 1, 1,
-1.794233, -1.014124, -1.58035, 0, 0, 0, 1, 1,
-1.779673, -0.2621506, -2.437811, 0, 0, 0, 1, 1,
-1.77102, 0.509293, -1.206913, 0, 0, 0, 1, 1,
-1.770369, -0.1046578, -1.854689, 0, 0, 0, 1, 1,
-1.770127, 1.250439, -0.4700375, 0, 0, 0, 1, 1,
-1.756577, -0.2391055, -0.8444247, 1, 1, 1, 1, 1,
-1.752819, -0.07091831, -1.035914, 1, 1, 1, 1, 1,
-1.751149, -0.5047592, -1.66467, 1, 1, 1, 1, 1,
-1.723454, 0.08300495, 0.2440447, 1, 1, 1, 1, 1,
-1.718179, -0.3787095, -1.11305, 1, 1, 1, 1, 1,
-1.703125, -0.2133149, -1.184074, 1, 1, 1, 1, 1,
-1.690108, 1.139751, -1.216506, 1, 1, 1, 1, 1,
-1.689084, 1.355473, -0.460792, 1, 1, 1, 1, 1,
-1.688303, 0.1896398, -3.061132, 1, 1, 1, 1, 1,
-1.683951, 0.6931572, -0.7152484, 1, 1, 1, 1, 1,
-1.676105, -0.6134461, -3.199482, 1, 1, 1, 1, 1,
-1.671785, -0.7389199, -1.285647, 1, 1, 1, 1, 1,
-1.666293, 0.0507804, -2.027177, 1, 1, 1, 1, 1,
-1.663524, 0.5817999, -1.439305, 1, 1, 1, 1, 1,
-1.642938, -0.3281476, -2.870146, 1, 1, 1, 1, 1,
-1.617622, -0.03158871, 0.2656502, 0, 0, 1, 1, 1,
-1.61229, -0.1183844, -2.748755, 1, 0, 0, 1, 1,
-1.608643, -0.4979901, -1.908096, 1, 0, 0, 1, 1,
-1.590197, -2.033663, -1.72839, 1, 0, 0, 1, 1,
-1.563106, -0.3220952, -3.252157, 1, 0, 0, 1, 1,
-1.552812, -1.716702, -1.8778, 1, 0, 0, 1, 1,
-1.551585, 0.5629588, -2.442686, 0, 0, 0, 1, 1,
-1.520373, -0.7467331, -1.786021, 0, 0, 0, 1, 1,
-1.514748, -0.85089, -2.9866, 0, 0, 0, 1, 1,
-1.50786, 0.3993074, -0.5346226, 0, 0, 0, 1, 1,
-1.503479, -1.771136, -2.576479, 0, 0, 0, 1, 1,
-1.500728, -0.5077989, -2.620281, 0, 0, 0, 1, 1,
-1.50014, 0.1876722, -2.155395, 0, 0, 0, 1, 1,
-1.495752, -0.1838516, -3.191113, 1, 1, 1, 1, 1,
-1.49107, 0.3304243, -1.601301, 1, 1, 1, 1, 1,
-1.472704, -0.5306684, -2.583114, 1, 1, 1, 1, 1,
-1.47151, 0.1454739, -2.30874, 1, 1, 1, 1, 1,
-1.470687, 0.8800672, 0.8787213, 1, 1, 1, 1, 1,
-1.468565, 0.518006, -0.6606861, 1, 1, 1, 1, 1,
-1.467964, -0.8805043, -1.95603, 1, 1, 1, 1, 1,
-1.465217, -0.4952411, -0.3863409, 1, 1, 1, 1, 1,
-1.464883, -0.6007912, -2.311075, 1, 1, 1, 1, 1,
-1.449695, -1.525057, -2.029126, 1, 1, 1, 1, 1,
-1.438961, -0.5920534, -2.536543, 1, 1, 1, 1, 1,
-1.438752, -1.103543, -2.603961, 1, 1, 1, 1, 1,
-1.431182, -0.06100533, -2.607396, 1, 1, 1, 1, 1,
-1.429944, -2.579734, -2.071729, 1, 1, 1, 1, 1,
-1.429695, -0.6341846, -4.349977, 1, 1, 1, 1, 1,
-1.4219, -0.05518161, -1.250174, 0, 0, 1, 1, 1,
-1.410212, -1.819547, -3.289312, 1, 0, 0, 1, 1,
-1.403279, -2.740652, -1.83795, 1, 0, 0, 1, 1,
-1.400812, 0.3908617, -2.18891, 1, 0, 0, 1, 1,
-1.395867, -0.6510578, -3.050575, 1, 0, 0, 1, 1,
-1.392719, -1.303901, -2.126304, 1, 0, 0, 1, 1,
-1.391229, 0.1301927, -1.408388, 0, 0, 0, 1, 1,
-1.388422, -1.156413, -3.653507, 0, 0, 0, 1, 1,
-1.374794, 0.4639254, -0.804079, 0, 0, 0, 1, 1,
-1.361472, -1.203625, -2.567281, 0, 0, 0, 1, 1,
-1.356083, 0.2529766, -2.366085, 0, 0, 0, 1, 1,
-1.3556, -0.1169253, 0.8048564, 0, 0, 0, 1, 1,
-1.35291, 2.116884, -1.835266, 0, 0, 0, 1, 1,
-1.352556, -0.5647762, -1.507299, 1, 1, 1, 1, 1,
-1.351865, -0.6801957, -0.8935944, 1, 1, 1, 1, 1,
-1.348297, 0.9727494, 0.6182486, 1, 1, 1, 1, 1,
-1.344055, -0.2877003, -1.631523, 1, 1, 1, 1, 1,
-1.339262, 0.8257864, -0.6706728, 1, 1, 1, 1, 1,
-1.333638, 1.766982, -0.7421633, 1, 1, 1, 1, 1,
-1.33209, 1.255791, 0.8361924, 1, 1, 1, 1, 1,
-1.307557, -2.005905, -5.175711, 1, 1, 1, 1, 1,
-1.304688, -0.6537578, -1.929884, 1, 1, 1, 1, 1,
-1.303791, -1.015024, -1.966758, 1, 1, 1, 1, 1,
-1.274944, 0.6910084, -1.241315, 1, 1, 1, 1, 1,
-1.272912, -0.3982558, -2.60535, 1, 1, 1, 1, 1,
-1.272836, -0.3660163, -1.525339, 1, 1, 1, 1, 1,
-1.264286, 0.404624, -1.575484, 1, 1, 1, 1, 1,
-1.263075, 1.601031, -1.390699, 1, 1, 1, 1, 1,
-1.262334, -0.9918838, -3.540854, 0, 0, 1, 1, 1,
-1.259427, -0.3780414, -2.82721, 1, 0, 0, 1, 1,
-1.259423, -0.7274243, -3.010062, 1, 0, 0, 1, 1,
-1.255531, -1.418105, -2.778394, 1, 0, 0, 1, 1,
-1.248051, 0.8997134, -0.612582, 1, 0, 0, 1, 1,
-1.24766, 0.6425334, 0.05416832, 1, 0, 0, 1, 1,
-1.24112, 0.05213434, -2.095092, 0, 0, 0, 1, 1,
-1.240376, -0.5840734, -1.97198, 0, 0, 0, 1, 1,
-1.237854, -1.123812, -2.616985, 0, 0, 0, 1, 1,
-1.233943, 0.2997435, 0.1260252, 0, 0, 0, 1, 1,
-1.231352, -0.5258201, -2.617672, 0, 0, 0, 1, 1,
-1.215636, 0.1199593, -0.6447066, 0, 0, 0, 1, 1,
-1.214942, 0.8232135, -1.521127, 0, 0, 0, 1, 1,
-1.214134, -0.9271107, -2.091714, 1, 1, 1, 1, 1,
-1.209724, 1.465073, -0.5257099, 1, 1, 1, 1, 1,
-1.209206, -0.2089346, -2.577206, 1, 1, 1, 1, 1,
-1.208757, 2.639909, -1.381089, 1, 1, 1, 1, 1,
-1.205348, 0.5658038, -0.7090597, 1, 1, 1, 1, 1,
-1.200811, -0.5681412, -3.763437, 1, 1, 1, 1, 1,
-1.177098, 0.285253, -0.4815109, 1, 1, 1, 1, 1,
-1.175152, -0.04590259, -2.36089, 1, 1, 1, 1, 1,
-1.172364, 1.087647, 0.1628439, 1, 1, 1, 1, 1,
-1.171612, 0.004661156, -1.793646, 1, 1, 1, 1, 1,
-1.167722, -1.450515, -2.084453, 1, 1, 1, 1, 1,
-1.158162, 1.540122, -1.14557, 1, 1, 1, 1, 1,
-1.154049, -1.500045, -3.067961, 1, 1, 1, 1, 1,
-1.151907, -1.055367, -3.720586, 1, 1, 1, 1, 1,
-1.149143, 0.4657375, -1.696291, 1, 1, 1, 1, 1,
-1.142156, -0.04600156, -1.267707, 0, 0, 1, 1, 1,
-1.128011, -0.163495, -0.793443, 1, 0, 0, 1, 1,
-1.114334, -0.3703281, -2.433084, 1, 0, 0, 1, 1,
-1.1067, 2.937204, 0.8738589, 1, 0, 0, 1, 1,
-1.1057, 0.03326723, -0.4230314, 1, 0, 0, 1, 1,
-1.104097, 0.4244753, -0.5436949, 1, 0, 0, 1, 1,
-1.099036, 0.6413399, -3.023469, 0, 0, 0, 1, 1,
-1.089684, 0.1546023, -2.021386, 0, 0, 0, 1, 1,
-1.089382, 0.4972848, -3.917535, 0, 0, 0, 1, 1,
-1.082801, -0.699827, -2.341131, 0, 0, 0, 1, 1,
-1.076886, -0.7851205, -1.035513, 0, 0, 0, 1, 1,
-1.071151, 0.3583926, -1.827841, 0, 0, 0, 1, 1,
-1.066322, 0.08899403, 0.3182931, 0, 0, 0, 1, 1,
-1.063626, 0.805872, -0.9078731, 1, 1, 1, 1, 1,
-1.063326, 1.054154, 0.60688, 1, 1, 1, 1, 1,
-1.061505, 0.8856291, -2.831416, 1, 1, 1, 1, 1,
-1.043588, -1.521659, -4.318676, 1, 1, 1, 1, 1,
-1.037663, -0.7615703, -1.856409, 1, 1, 1, 1, 1,
-1.035385, 1.113427, -1.582494, 1, 1, 1, 1, 1,
-1.033646, 1.071464, 0.5610524, 1, 1, 1, 1, 1,
-1.026535, -0.74829, -2.266629, 1, 1, 1, 1, 1,
-1.025496, -0.3495131, -2.813619, 1, 1, 1, 1, 1,
-1.023057, 1.63281, 0.09976265, 1, 1, 1, 1, 1,
-1.016673, -0.2476495, -3.114023, 1, 1, 1, 1, 1,
-1.016461, 0.8384362, -1.674882, 1, 1, 1, 1, 1,
-1.006101, 0.2318534, -1.485391, 1, 1, 1, 1, 1,
-1.002398, 0.9996712, -1.98385, 1, 1, 1, 1, 1,
-0.9991522, -0.03752051, -0.6475577, 1, 1, 1, 1, 1,
-0.9980558, 0.003923301, -0.7823067, 0, 0, 1, 1, 1,
-0.9954267, -0.8489611, -0.593702, 1, 0, 0, 1, 1,
-0.9925857, 2.561196, -0.09142908, 1, 0, 0, 1, 1,
-0.988079, -0.6049455, -2.530426, 1, 0, 0, 1, 1,
-0.9799343, -0.5296751, -2.514938, 1, 0, 0, 1, 1,
-0.9777815, -0.4513825, -1.125502, 1, 0, 0, 1, 1,
-0.9777272, 0.6799316, -1.165938, 0, 0, 0, 1, 1,
-0.9758458, -0.7930489, -2.597784, 0, 0, 0, 1, 1,
-0.9576047, 0.7839294, -1.519407, 0, 0, 0, 1, 1,
-0.9547188, 0.3119879, 0.01168121, 0, 0, 0, 1, 1,
-0.9429389, 0.1854057, -0.8884443, 0, 0, 0, 1, 1,
-0.9404526, 1.952109, -1.170065, 0, 0, 0, 1, 1,
-0.9377754, -0.9270653, -2.904812, 0, 0, 0, 1, 1,
-0.9365355, -0.9667917, -1.599295, 1, 1, 1, 1, 1,
-0.9314145, 0.1921539, -0.5716349, 1, 1, 1, 1, 1,
-0.9310881, 1.328568, -0.2595245, 1, 1, 1, 1, 1,
-0.9266878, 1.064173, -1.161162, 1, 1, 1, 1, 1,
-0.9259942, -0.8081588, -1.864823, 1, 1, 1, 1, 1,
-0.9228364, -0.4036881, -2.430903, 1, 1, 1, 1, 1,
-0.9170873, -0.5584116, -3.18699, 1, 1, 1, 1, 1,
-0.9133949, 1.856536, 0.994277, 1, 1, 1, 1, 1,
-0.9106606, 0.6292362, -0.8195909, 1, 1, 1, 1, 1,
-0.9028649, 1.07764, -1.523078, 1, 1, 1, 1, 1,
-0.902249, -0.7078596, -4.538629, 1, 1, 1, 1, 1,
-0.8967246, -0.2159961, -0.01824722, 1, 1, 1, 1, 1,
-0.8920521, -0.02726043, -1.344644, 1, 1, 1, 1, 1,
-0.8917903, 0.2373001, -1.329115, 1, 1, 1, 1, 1,
-0.8904307, 0.01337571, -1.157245, 1, 1, 1, 1, 1,
-0.8897092, -0.5015564, -1.029336, 0, 0, 1, 1, 1,
-0.8842947, 1.310758, -0.8652932, 1, 0, 0, 1, 1,
-0.876346, 0.3272294, -0.3829464, 1, 0, 0, 1, 1,
-0.8682931, 1.251338, 0.5560061, 1, 0, 0, 1, 1,
-0.8669711, -0.1857944, -2.464406, 1, 0, 0, 1, 1,
-0.8586156, 0.3159709, -3.505772, 1, 0, 0, 1, 1,
-0.8517376, -0.8099725, -3.506986, 0, 0, 0, 1, 1,
-0.8503866, -0.4553405, -1.239878, 0, 0, 0, 1, 1,
-0.8447177, -0.6823692, -3.793191, 0, 0, 0, 1, 1,
-0.8441095, -0.4896262, -1.219296, 0, 0, 0, 1, 1,
-0.8426136, 0.09128078, -0.05348608, 0, 0, 0, 1, 1,
-0.8420816, -0.4852517, -1.390002, 0, 0, 0, 1, 1,
-0.8416852, -0.2403287, -0.6412427, 0, 0, 0, 1, 1,
-0.8412361, -1.163938, -1.624752, 1, 1, 1, 1, 1,
-0.8374855, 0.07788073, -0.75453, 1, 1, 1, 1, 1,
-0.8372258, 0.7314835, 0.08858833, 1, 1, 1, 1, 1,
-0.829521, 0.8256676, -1.191734, 1, 1, 1, 1, 1,
-0.8244334, 0.7293897, -0.3992528, 1, 1, 1, 1, 1,
-0.8243707, 0.4173627, -1.171957, 1, 1, 1, 1, 1,
-0.8194891, -0.5520846, -1.165219, 1, 1, 1, 1, 1,
-0.8138325, -0.9171764, -2.430731, 1, 1, 1, 1, 1,
-0.8138152, 0.5740231, -0.8371539, 1, 1, 1, 1, 1,
-0.8117122, -1.061387, -1.14196, 1, 1, 1, 1, 1,
-0.8093373, -0.0931617, -2.111184, 1, 1, 1, 1, 1,
-0.8078523, 1.07234, 0.03805322, 1, 1, 1, 1, 1,
-0.8076005, -1.296801, -2.969999, 1, 1, 1, 1, 1,
-0.7919453, 0.4054863, 0.2130792, 1, 1, 1, 1, 1,
-0.7900044, -0.6373336, -3.861593, 1, 1, 1, 1, 1,
-0.7792624, 0.04387811, -1.694198, 0, 0, 1, 1, 1,
-0.7788723, 1.304227, -0.5587639, 1, 0, 0, 1, 1,
-0.7688274, -1.819678, -4.157537, 1, 0, 0, 1, 1,
-0.7642308, 0.6419299, -1.10894, 1, 0, 0, 1, 1,
-0.7634417, 0.27008, -1.303548, 1, 0, 0, 1, 1,
-0.7618728, 0.4709575, -2.166397, 1, 0, 0, 1, 1,
-0.7608517, 1.374693, -0.8480637, 0, 0, 0, 1, 1,
-0.7586484, 0.282529, 1.132149, 0, 0, 0, 1, 1,
-0.7562344, -1.750742, -3.774566, 0, 0, 0, 1, 1,
-0.7502719, 1.520898, -3.496667, 0, 0, 0, 1, 1,
-0.7417654, -0.3788143, -1.261763, 0, 0, 0, 1, 1,
-0.740979, -1.572646, -2.771574, 0, 0, 0, 1, 1,
-0.7383946, 0.6409486, -1.790595, 0, 0, 0, 1, 1,
-0.7356608, -0.3741051, -3.50034, 1, 1, 1, 1, 1,
-0.7352487, -1.089002, -0.7714465, 1, 1, 1, 1, 1,
-0.7346125, -0.3456846, -1.642807, 1, 1, 1, 1, 1,
-0.7340738, 0.8659018, -1.294247, 1, 1, 1, 1, 1,
-0.7339692, 0.9105558, -0.9962015, 1, 1, 1, 1, 1,
-0.7300812, 1.383685, -0.776778, 1, 1, 1, 1, 1,
-0.7282903, 0.8440403, -1.248742, 1, 1, 1, 1, 1,
-0.7232335, -2.299647, -0.9473316, 1, 1, 1, 1, 1,
-0.7217865, 0.3954131, -1.208285, 1, 1, 1, 1, 1,
-0.7185392, 0.6770132, -1.441109, 1, 1, 1, 1, 1,
-0.7179399, 0.4799777, -1.40251, 1, 1, 1, 1, 1,
-0.7169602, 2.945718, -0.1112876, 1, 1, 1, 1, 1,
-0.7168813, -0.2343152, -0.8156861, 1, 1, 1, 1, 1,
-0.7135277, 1.125493, 0.5214008, 1, 1, 1, 1, 1,
-0.7128748, 0.9406199, 0.008094057, 1, 1, 1, 1, 1,
-0.7127314, -0.9818262, -3.463453, 0, 0, 1, 1, 1,
-0.7088036, 0.5893043, 0.2482767, 1, 0, 0, 1, 1,
-0.7081974, -0.7865036, -1.748541, 1, 0, 0, 1, 1,
-0.7081324, 1.061394, -1.083024, 1, 0, 0, 1, 1,
-0.7038094, 0.281441, -0.6838998, 1, 0, 0, 1, 1,
-0.6989598, 1.138758, -2.442989, 1, 0, 0, 1, 1,
-0.6961309, -1.243195, -2.160799, 0, 0, 0, 1, 1,
-0.6957705, -1.178051, -3.425419, 0, 0, 0, 1, 1,
-0.6949499, -1.010057, -3.323107, 0, 0, 0, 1, 1,
-0.6917576, -0.7719933, -1.218157, 0, 0, 0, 1, 1,
-0.6881711, -0.9615891, -2.296228, 0, 0, 0, 1, 1,
-0.6874545, -1.447767, -1.58391, 0, 0, 0, 1, 1,
-0.6844752, 0.2069814, -1.621945, 0, 0, 0, 1, 1,
-0.6828274, -0.7726849, -1.537052, 1, 1, 1, 1, 1,
-0.681007, -0.7154184, -4.891215, 1, 1, 1, 1, 1,
-0.6799194, 0.7913037, -2.838345, 1, 1, 1, 1, 1,
-0.6762539, -1.670626, -1.530888, 1, 1, 1, 1, 1,
-0.6750588, -0.4985877, -1.437956, 1, 1, 1, 1, 1,
-0.6736253, -1.031106, -2.585975, 1, 1, 1, 1, 1,
-0.6692756, 0.1881624, -0.7597659, 1, 1, 1, 1, 1,
-0.6666778, -0.2634036, -2.890938, 1, 1, 1, 1, 1,
-0.6640591, -0.8573482, -1.825963, 1, 1, 1, 1, 1,
-0.6609043, 0.6626926, -1.710015, 1, 1, 1, 1, 1,
-0.6519347, -1.365356, -2.498011, 1, 1, 1, 1, 1,
-0.6492847, -1.33565, -3.829261, 1, 1, 1, 1, 1,
-0.6491761, -0.2975207, -1.063287, 1, 1, 1, 1, 1,
-0.6464186, -0.2108675, -2.079676, 1, 1, 1, 1, 1,
-0.6377406, -1.099842, -3.170564, 1, 1, 1, 1, 1,
-0.6353921, -1.613236, -3.488752, 0, 0, 1, 1, 1,
-0.6322771, 1.611439, -1.324009, 1, 0, 0, 1, 1,
-0.6300682, -0.3913136, -3.54597, 1, 0, 0, 1, 1,
-0.6268055, -1.504165, -1.270283, 1, 0, 0, 1, 1,
-0.6257083, -1.731453, -2.592467, 1, 0, 0, 1, 1,
-0.6117195, -0.2745217, -3.279884, 1, 0, 0, 1, 1,
-0.6078685, -0.9218096, -3.099169, 0, 0, 0, 1, 1,
-0.6008772, -0.4098071, -1.719779, 0, 0, 0, 1, 1,
-0.5965878, -0.7353111, -2.228513, 0, 0, 0, 1, 1,
-0.5912249, -0.2463749, -2.716791, 0, 0, 0, 1, 1,
-0.5904382, -0.05352529, -1.209016, 0, 0, 0, 1, 1,
-0.5900746, -0.8343416, -1.142825, 0, 0, 0, 1, 1,
-0.5846465, 0.2948188, 0.3442833, 0, 0, 0, 1, 1,
-0.5831913, 0.5990298, -0.9404658, 1, 1, 1, 1, 1,
-0.5800515, -1.223082, -4.336289, 1, 1, 1, 1, 1,
-0.5762053, -1.725596, -0.9083287, 1, 1, 1, 1, 1,
-0.5744196, -0.4406009, -0.8620407, 1, 1, 1, 1, 1,
-0.5680825, -0.6825615, -4.238781, 1, 1, 1, 1, 1,
-0.5676882, 0.6872914, -1.515814, 1, 1, 1, 1, 1,
-0.5665308, -1.05707, -2.521211, 1, 1, 1, 1, 1,
-0.5659078, -1.400928, -2.489916, 1, 1, 1, 1, 1,
-0.5603956, 0.3381422, 0.1045278, 1, 1, 1, 1, 1,
-0.5588227, -0.583138, -2.783885, 1, 1, 1, 1, 1,
-0.5574563, 1.029621, -0.5272932, 1, 1, 1, 1, 1,
-0.5574237, 0.01220234, 0.2130522, 1, 1, 1, 1, 1,
-0.5540857, 1.503002, -0.01666947, 1, 1, 1, 1, 1,
-0.5511129, 1.972662, -0.1801588, 1, 1, 1, 1, 1,
-0.5418893, 0.8249357, 0.2173799, 1, 1, 1, 1, 1,
-0.5379661, 1.391422, 1.07823, 0, 0, 1, 1, 1,
-0.5294653, 1.322296, 0.8303186, 1, 0, 0, 1, 1,
-0.5264719, -0.7327917, -2.114278, 1, 0, 0, 1, 1,
-0.5251775, 0.09492454, -1.499431, 1, 0, 0, 1, 1,
-0.5239928, 0.3485462, -0.6025187, 1, 0, 0, 1, 1,
-0.5239513, -0.7623612, -2.5055, 1, 0, 0, 1, 1,
-0.5216837, 0.1164366, -2.810013, 0, 0, 0, 1, 1,
-0.5193786, 0.659273, 0.8346696, 0, 0, 0, 1, 1,
-0.5185331, -1.210849, -1.137997, 0, 0, 0, 1, 1,
-0.5184856, -1.016201, -2.348849, 0, 0, 0, 1, 1,
-0.5099469, -1.200412, -1.598916, 0, 0, 0, 1, 1,
-0.5070679, -0.8476189, -1.0737, 0, 0, 0, 1, 1,
-0.5066373, -0.7723003, -3.453064, 0, 0, 0, 1, 1,
-0.5036227, 0.5366048, -0.2113461, 1, 1, 1, 1, 1,
-0.5031957, 0.3455716, -1.241324, 1, 1, 1, 1, 1,
-0.4998282, 1.382712, -1.020267, 1, 1, 1, 1, 1,
-0.4986652, 0.6630941, -0.5347672, 1, 1, 1, 1, 1,
-0.4979427, -0.5014741, -2.437311, 1, 1, 1, 1, 1,
-0.4720615, -0.4649136, -3.329008, 1, 1, 1, 1, 1,
-0.4689417, 0.4283587, -0.4031695, 1, 1, 1, 1, 1,
-0.4653209, 3.001415, -0.8874051, 1, 1, 1, 1, 1,
-0.4628902, 0.2802254, -2.423907, 1, 1, 1, 1, 1,
-0.4606723, -0.1572316, -4.142314, 1, 1, 1, 1, 1,
-0.4583732, -0.03959066, 1.091739, 1, 1, 1, 1, 1,
-0.4514571, -0.09675443, -1.929827, 1, 1, 1, 1, 1,
-0.4500324, 0.2861027, -1.408525, 1, 1, 1, 1, 1,
-0.4498062, 2.904375, 0.1026641, 1, 1, 1, 1, 1,
-0.448884, -0.8257002, -3.372007, 1, 1, 1, 1, 1,
-0.4475144, 1.72462, -0.01780925, 0, 0, 1, 1, 1,
-0.447403, -2.291111, -2.29201, 1, 0, 0, 1, 1,
-0.446857, -0.9695174, -2.893558, 1, 0, 0, 1, 1,
-0.4412056, -2.409987, -1.007211, 1, 0, 0, 1, 1,
-0.4393733, -0.9548655, -3.104112, 1, 0, 0, 1, 1,
-0.4381592, 0.006102397, -0.9242326, 1, 0, 0, 1, 1,
-0.4330885, 0.9459134, -1.736903, 0, 0, 0, 1, 1,
-0.431736, -0.6174121, -2.612159, 0, 0, 0, 1, 1,
-0.4310131, -1.053904, -4.584116, 0, 0, 0, 1, 1,
-0.4248874, 0.137146, -1.414003, 0, 0, 0, 1, 1,
-0.4235587, 1.097239, -0.5730574, 0, 0, 0, 1, 1,
-0.4203292, 0.669576, -2.729149, 0, 0, 0, 1, 1,
-0.4169688, 0.8263963, -0.7444692, 0, 0, 0, 1, 1,
-0.4163151, -0.3144789, -2.281951, 1, 1, 1, 1, 1,
-0.4149705, 0.1890041, -2.492473, 1, 1, 1, 1, 1,
-0.4103008, 1.491383, -1.172891, 1, 1, 1, 1, 1,
-0.4079132, 0.4703877, -1.294372, 1, 1, 1, 1, 1,
-0.4070902, -0.9467621, -4.443743, 1, 1, 1, 1, 1,
-0.4044344, -1.028791, -1.643365, 1, 1, 1, 1, 1,
-0.3986806, -0.09012004, -4.62701, 1, 1, 1, 1, 1,
-0.3976331, 0.4133172, -0.1195338, 1, 1, 1, 1, 1,
-0.3924727, -1.591385, -2.492723, 1, 1, 1, 1, 1,
-0.3923636, 2.128605, 0.677005, 1, 1, 1, 1, 1,
-0.3905176, -2.199307, -2.104933, 1, 1, 1, 1, 1,
-0.3853355, 0.04344657, -1.060795, 1, 1, 1, 1, 1,
-0.3824463, 0.2700155, 0.01459078, 1, 1, 1, 1, 1,
-0.3818161, -1.334936, -2.697846, 1, 1, 1, 1, 1,
-0.3804662, -0.5797294, -2.523613, 1, 1, 1, 1, 1,
-0.3780247, 0.3244584, -0.7296801, 0, 0, 1, 1, 1,
-0.3720674, 0.04305458, -1.622326, 1, 0, 0, 1, 1,
-0.3692392, -1.071666, -3.796413, 1, 0, 0, 1, 1,
-0.3682448, -1.099889, -1.096893, 1, 0, 0, 1, 1,
-0.3576868, 0.3942928, -0.3073326, 1, 0, 0, 1, 1,
-0.3572304, 0.4193071, -1.017375, 1, 0, 0, 1, 1,
-0.3532639, -0.169567, -3.238292, 0, 0, 0, 1, 1,
-0.3513171, -0.1310522, -1.458764, 0, 0, 0, 1, 1,
-0.3474063, -0.9808522, -3.925079, 0, 0, 0, 1, 1,
-0.3471424, -1.187126, -2.163215, 0, 0, 0, 1, 1,
-0.3458884, -0.5747101, -1.417996, 0, 0, 0, 1, 1,
-0.3377629, -0.3089952, -2.109273, 0, 0, 0, 1, 1,
-0.3341477, -2.0507, -2.541091, 0, 0, 0, 1, 1,
-0.3339176, 0.311583, -2.455839, 1, 1, 1, 1, 1,
-0.3310397, 0.6857246, 0.3365032, 1, 1, 1, 1, 1,
-0.3305293, 0.03126626, -2.272793, 1, 1, 1, 1, 1,
-0.3293877, -0.8786029, -2.588441, 1, 1, 1, 1, 1,
-0.3286511, -1.145813, -4.532796, 1, 1, 1, 1, 1,
-0.3275835, -0.2037624, -2.192653, 1, 1, 1, 1, 1,
-0.3272043, 0.7428507, 0.5996491, 1, 1, 1, 1, 1,
-0.3257686, 2.021138, -0.5118221, 1, 1, 1, 1, 1,
-0.3228435, -0.7642279, -2.753742, 1, 1, 1, 1, 1,
-0.3201824, 0.1742639, -0.7157934, 1, 1, 1, 1, 1,
-0.3162176, -1.404382, -4.09819, 1, 1, 1, 1, 1,
-0.3140608, -0.5516442, -1.52851, 1, 1, 1, 1, 1,
-0.3131119, 3.187429, 0.5614341, 1, 1, 1, 1, 1,
-0.3129414, 0.737158, -0.9238751, 1, 1, 1, 1, 1,
-0.3126064, 0.3854935, -1.115673, 1, 1, 1, 1, 1,
-0.3107082, 0.3232896, 0.7836593, 0, 0, 1, 1, 1,
-0.3095259, -0.05790917, -2.107547, 1, 0, 0, 1, 1,
-0.3077019, 1.072325, -0.4596965, 1, 0, 0, 1, 1,
-0.3029367, -1.08567, -2.237038, 1, 0, 0, 1, 1,
-0.2967199, 0.371773, 0.6678966, 1, 0, 0, 1, 1,
-0.2926563, -1.271583, -3.289151, 1, 0, 0, 1, 1,
-0.2911276, 1.314674, -0.4740477, 0, 0, 0, 1, 1,
-0.2880706, -0.3582939, -2.443857, 0, 0, 0, 1, 1,
-0.2851601, 0.9959245, 0.9127734, 0, 0, 0, 1, 1,
-0.2752774, 0.5379044, -0.4521829, 0, 0, 0, 1, 1,
-0.2666551, 0.4696723, 2.36704, 0, 0, 0, 1, 1,
-0.2623243, -2.24235, -0.6667529, 0, 0, 0, 1, 1,
-0.2604767, -1.200397, -2.966722, 0, 0, 0, 1, 1,
-0.2571038, -0.412568, -2.02093, 1, 1, 1, 1, 1,
-0.2570873, 0.07076187, -2.509104, 1, 1, 1, 1, 1,
-0.2531699, 0.2683814, -0.7259008, 1, 1, 1, 1, 1,
-0.2522056, -0.1999985, -2.190072, 1, 1, 1, 1, 1,
-0.2461259, 1.159641, -2.906675, 1, 1, 1, 1, 1,
-0.2440325, -0.9870952, -3.292491, 1, 1, 1, 1, 1,
-0.2431025, 0.294856, -0.4033208, 1, 1, 1, 1, 1,
-0.2422812, 1.380779, -0.3199331, 1, 1, 1, 1, 1,
-0.2402832, -1.452421, -2.738034, 1, 1, 1, 1, 1,
-0.2312643, -0.7263145, -2.6983, 1, 1, 1, 1, 1,
-0.2286578, -0.716739, -3.240196, 1, 1, 1, 1, 1,
-0.2282379, 1.417864, -1.105555, 1, 1, 1, 1, 1,
-0.2266264, -0.877694, -2.413343, 1, 1, 1, 1, 1,
-0.2262398, 0.06704388, -3.194908, 1, 1, 1, 1, 1,
-0.2255447, -1.022525, -1.863546, 1, 1, 1, 1, 1,
-0.2244206, 0.6109343, 1.010206, 0, 0, 1, 1, 1,
-0.2195577, -0.02688367, -2.071276, 1, 0, 0, 1, 1,
-0.2193841, 1.22834, 0.8686929, 1, 0, 0, 1, 1,
-0.2190751, -0.8705856, -1.676726, 1, 0, 0, 1, 1,
-0.2183062, 1.18192, -1.718935, 1, 0, 0, 1, 1,
-0.2181134, -1.473812, -2.071069, 1, 0, 0, 1, 1,
-0.2144127, -1.903174, -3.578277, 0, 0, 0, 1, 1,
-0.2098275, -0.07860272, -1.462207, 0, 0, 0, 1, 1,
-0.2097677, -1.57531, -3.781886, 0, 0, 0, 1, 1,
-0.2087079, 0.1275595, -1.814007, 0, 0, 0, 1, 1,
-0.2083198, -0.2471289, -0.1348749, 0, 0, 0, 1, 1,
-0.2026398, -1.671499, -1.256593, 0, 0, 0, 1, 1,
-0.2002751, -1.064912, -1.880551, 0, 0, 0, 1, 1,
-0.1994956, 0.08890223, -1.41278, 1, 1, 1, 1, 1,
-0.1946264, -0.9330355, -1.688016, 1, 1, 1, 1, 1,
-0.1928335, -0.4089719, -4.700724, 1, 1, 1, 1, 1,
-0.1891614, 0.7119504, 1.110348, 1, 1, 1, 1, 1,
-0.178963, -0.2004933, -2.674374, 1, 1, 1, 1, 1,
-0.174851, 1.182484, 0.6866311, 1, 1, 1, 1, 1,
-0.1744614, -1.593729, -3.41113, 1, 1, 1, 1, 1,
-0.1734619, 0.6782286, -0.9535156, 1, 1, 1, 1, 1,
-0.1670769, 0.07041841, -1.411049, 1, 1, 1, 1, 1,
-0.1670327, -0.1966713, -1.890395, 1, 1, 1, 1, 1,
-0.1626141, 1.155248, 0.4070173, 1, 1, 1, 1, 1,
-0.1621916, 0.01021318, -1.515347, 1, 1, 1, 1, 1,
-0.1615153, -0.5328931, -3.336161, 1, 1, 1, 1, 1,
-0.1577687, -0.5461865, -2.342971, 1, 1, 1, 1, 1,
-0.1519575, 1.733976, 0.6132511, 1, 1, 1, 1, 1,
-0.1491637, -0.699505, -0.2136475, 0, 0, 1, 1, 1,
-0.1484974, 1.297986, -1.070239, 1, 0, 0, 1, 1,
-0.1483011, -0.0170642, -1.749031, 1, 0, 0, 1, 1,
-0.1480592, -1.049436, -2.072251, 1, 0, 0, 1, 1,
-0.1478252, 1.067294, -1.67452, 1, 0, 0, 1, 1,
-0.1471714, 0.9310887, -0.4740101, 1, 0, 0, 1, 1,
-0.1405701, -0.7460519, -2.451465, 0, 0, 0, 1, 1,
-0.1353226, 0.3315917, -1.259441, 0, 0, 0, 1, 1,
-0.1309086, 0.008965218, -1.000128, 0, 0, 0, 1, 1,
-0.1256711, -1.673925, -4.00564, 0, 0, 0, 1, 1,
-0.1244038, 0.04622413, -0.7999308, 0, 0, 0, 1, 1,
-0.124056, -1.382555, -3.387009, 0, 0, 0, 1, 1,
-0.1233031, 1.070232, -0.4979748, 0, 0, 0, 1, 1,
-0.1206477, -1.601273, -2.526119, 1, 1, 1, 1, 1,
-0.1196681, 0.7137353, -0.5244389, 1, 1, 1, 1, 1,
-0.1166075, -1.104679, -3.837875, 1, 1, 1, 1, 1,
-0.1165582, -2.03835, -1.932955, 1, 1, 1, 1, 1,
-0.1164153, -2.194233, -3.033345, 1, 1, 1, 1, 1,
-0.1158744, -0.3268418, -2.543997, 1, 1, 1, 1, 1,
-0.1154619, 0.6639883, 1.558349, 1, 1, 1, 1, 1,
-0.107501, 1.172201, 0.1376518, 1, 1, 1, 1, 1,
-0.107262, 0.7617918, 0.6873191, 1, 1, 1, 1, 1,
-0.1045744, 0.3575588, 0.04965755, 1, 1, 1, 1, 1,
-0.1044711, 0.8720157, 0.9300355, 1, 1, 1, 1, 1,
-0.1042521, -0.002743922, -1.0809, 1, 1, 1, 1, 1,
-0.1034362, -0.5512226, -4.64022, 1, 1, 1, 1, 1,
-0.09628489, 0.2384187, 0.0568751, 1, 1, 1, 1, 1,
-0.09499067, -0.1292993, -3.751196, 1, 1, 1, 1, 1,
-0.09494402, -0.0897688, -2.766943, 0, 0, 1, 1, 1,
-0.09279559, 0.6210341, 0.267437, 1, 0, 0, 1, 1,
-0.0922276, 0.9621088, 0.02730415, 1, 0, 0, 1, 1,
-0.08997712, 0.7277153, 0.04598304, 1, 0, 0, 1, 1,
-0.08917315, -0.3191071, -1.523649, 1, 0, 0, 1, 1,
-0.08627307, 2.528088, -1.755777, 1, 0, 0, 1, 1,
-0.07855898, 1.41802, -1.000415, 0, 0, 0, 1, 1,
-0.07597079, 0.3513265, -1.841235, 0, 0, 0, 1, 1,
-0.0701277, -0.2364799, -3.021674, 0, 0, 0, 1, 1,
-0.0699781, 0.9464179, 0.413937, 0, 0, 0, 1, 1,
-0.0640352, 0.827531, 0.8300389, 0, 0, 0, 1, 1,
-0.06314848, 0.1492075, 0.03609966, 0, 0, 0, 1, 1,
-0.05956735, -0.7345036, -1.679776, 0, 0, 0, 1, 1,
-0.04614709, 0.05347477, -1.158893, 1, 1, 1, 1, 1,
-0.04393312, 0.2142576, -0.9412419, 1, 1, 1, 1, 1,
-0.03941727, -0.1131386, -2.014081, 1, 1, 1, 1, 1,
-0.03844531, -0.2241177, -1.14756, 1, 1, 1, 1, 1,
-0.03698676, 0.1628448, -2.026142, 1, 1, 1, 1, 1,
-0.02698564, -0.1260075, -3.031424, 1, 1, 1, 1, 1,
-0.02606935, 0.6777778, 0.2601793, 1, 1, 1, 1, 1,
-0.01934177, 0.2170147, 0.7482861, 1, 1, 1, 1, 1,
-0.01505717, -0.7951371, -3.673066, 1, 1, 1, 1, 1,
-0.01388348, 0.1985974, 0.4051571, 1, 1, 1, 1, 1,
-0.01324183, -0.4987191, -2.229265, 1, 1, 1, 1, 1,
-0.01287723, 0.2057148, 1.241291, 1, 1, 1, 1, 1,
-0.01002022, -1.835745, -3.370869, 1, 1, 1, 1, 1,
-0.00747957, 0.337672, -0.2216058, 1, 1, 1, 1, 1,
-0.006852779, 0.7892187, -0.7436464, 1, 1, 1, 1, 1,
-0.004849613, 0.5941897, -0.8992581, 0, 0, 1, 1, 1,
0.0002777561, -0.5457245, 4.298471, 1, 0, 0, 1, 1,
0.01039792, 0.6653791, -0.6577831, 1, 0, 0, 1, 1,
0.01157755, 0.8882951, -0.7571015, 1, 0, 0, 1, 1,
0.01273443, 0.7495123, -1.8274, 1, 0, 0, 1, 1,
0.01311185, -0.8012363, 3.246782, 1, 0, 0, 1, 1,
0.01541297, 1.200498, 0.01895767, 0, 0, 0, 1, 1,
0.01603244, -0.05282042, 3.937354, 0, 0, 0, 1, 1,
0.01606341, 0.2884446, 1.569557, 0, 0, 0, 1, 1,
0.01774089, -0.4088055, 3.280242, 0, 0, 0, 1, 1,
0.02097475, -0.6932521, 1.732075, 0, 0, 0, 1, 1,
0.02223875, 0.5541612, -1.048876, 0, 0, 0, 1, 1,
0.02897567, 0.004092006, 1.341089, 0, 0, 0, 1, 1,
0.02935482, -0.2745793, 2.298591, 1, 1, 1, 1, 1,
0.0322375, 0.569088, 1.822719, 1, 1, 1, 1, 1,
0.03512391, -0.3507756, 4.444068, 1, 1, 1, 1, 1,
0.03516852, 1.117165, -0.5780586, 1, 1, 1, 1, 1,
0.03747606, 1.152949, 0.9909121, 1, 1, 1, 1, 1,
0.0494077, 0.3613571, 0.2002807, 1, 1, 1, 1, 1,
0.05121512, -0.7756211, 4.800631, 1, 1, 1, 1, 1,
0.05139744, -1.169895, 2.252512, 1, 1, 1, 1, 1,
0.05217348, 0.7759762, 0.1193053, 1, 1, 1, 1, 1,
0.0530702, 0.1909559, 0.970085, 1, 1, 1, 1, 1,
0.05346397, 0.1150797, -0.05249256, 1, 1, 1, 1, 1,
0.05508997, -0.3727227, 3.775049, 1, 1, 1, 1, 1,
0.056554, 0.5052506, 1.525676, 1, 1, 1, 1, 1,
0.05695373, 0.3868741, -0.1119875, 1, 1, 1, 1, 1,
0.06335635, -0.2284461, 2.246892, 1, 1, 1, 1, 1,
0.06339233, 0.7778835, -0.2799782, 0, 0, 1, 1, 1,
0.06481945, -0.9965806, 3.041334, 1, 0, 0, 1, 1,
0.06884801, -1.150453, 3.512344, 1, 0, 0, 1, 1,
0.06921739, -2.508751, 2.998553, 1, 0, 0, 1, 1,
0.07312682, -1.626357, 3.791269, 1, 0, 0, 1, 1,
0.07318056, -1.780802, 2.313953, 1, 0, 0, 1, 1,
0.07434616, 0.04946085, -0.8127891, 0, 0, 0, 1, 1,
0.07435786, 0.6534607, -0.3960995, 0, 0, 0, 1, 1,
0.08211312, 0.1435678, -0.4372596, 0, 0, 0, 1, 1,
0.08236662, -1.212724, 3.492089, 0, 0, 0, 1, 1,
0.08674763, -0.3144159, 3.026604, 0, 0, 0, 1, 1,
0.08848024, -0.1112088, 1.982326, 0, 0, 0, 1, 1,
0.08934195, 0.001574229, 2.111635, 0, 0, 0, 1, 1,
0.08945124, -0.1732352, 1.396863, 1, 1, 1, 1, 1,
0.09275535, -0.4026457, 2.386369, 1, 1, 1, 1, 1,
0.09561048, -1.010881, 3.186345, 1, 1, 1, 1, 1,
0.0976759, 2.678166, -0.2737233, 1, 1, 1, 1, 1,
0.1111123, -0.005386527, 0.09491797, 1, 1, 1, 1, 1,
0.1133016, 1.245637, 0.9000146, 1, 1, 1, 1, 1,
0.1154976, 0.2545978, -0.04113444, 1, 1, 1, 1, 1,
0.1160709, 0.4834168, 0.718251, 1, 1, 1, 1, 1,
0.1192222, 0.08350481, 1.056931, 1, 1, 1, 1, 1,
0.1208169, -0.4707209, 2.651577, 1, 1, 1, 1, 1,
0.1291055, 0.2364576, 0.4000685, 1, 1, 1, 1, 1,
0.1325466, 0.1025484, 1.718154, 1, 1, 1, 1, 1,
0.1326451, 1.881411, -1.82354, 1, 1, 1, 1, 1,
0.1342704, 2.12891, 0.3334256, 1, 1, 1, 1, 1,
0.1400628, 1.723031, -1.544816, 1, 1, 1, 1, 1,
0.1406521, -0.2145758, 2.932703, 0, 0, 1, 1, 1,
0.1412371, -0.01794174, 1.996656, 1, 0, 0, 1, 1,
0.1440176, -0.512499, 2.576874, 1, 0, 0, 1, 1,
0.1446952, -0.3380319, 1.538277, 1, 0, 0, 1, 1,
0.1460369, 1.83549, -1.704902, 1, 0, 0, 1, 1,
0.1488321, 1.754823, -0.5001332, 1, 0, 0, 1, 1,
0.155576, 1.165315, 0.5491543, 0, 0, 0, 1, 1,
0.1575634, 0.09257471, 0.8693125, 0, 0, 0, 1, 1,
0.1577915, 1.719442, 0.7638269, 0, 0, 0, 1, 1,
0.1613061, 0.4507777, -1.067189, 0, 0, 0, 1, 1,
0.1641993, -0.4737106, 4.064108, 0, 0, 0, 1, 1,
0.1727411, 0.7238902, 1.751189, 0, 0, 0, 1, 1,
0.1752851, -0.4007774, 2.79434, 0, 0, 0, 1, 1,
0.1755494, -1.33081, 3.376017, 1, 1, 1, 1, 1,
0.1758186, -0.1352328, 1.978086, 1, 1, 1, 1, 1,
0.1766644, 1.082622, 0.5186095, 1, 1, 1, 1, 1,
0.181603, -0.02268797, 2.880254, 1, 1, 1, 1, 1,
0.1847113, -0.274445, 1.663763, 1, 1, 1, 1, 1,
0.1864056, -0.5368735, 1.920552, 1, 1, 1, 1, 1,
0.1886875, 0.6724896, 0.4574533, 1, 1, 1, 1, 1,
0.1954235, 0.8150824, 0.7388558, 1, 1, 1, 1, 1,
0.1957417, -0.2549012, 1.173015, 1, 1, 1, 1, 1,
0.1969073, 0.6683934, 0.0626045, 1, 1, 1, 1, 1,
0.1969782, 0.3052756, 1.356559, 1, 1, 1, 1, 1,
0.1989349, -1.127167, 3.415996, 1, 1, 1, 1, 1,
0.2005553, 0.4747756, 0.8693451, 1, 1, 1, 1, 1,
0.2033273, 0.8858993, -0.3052251, 1, 1, 1, 1, 1,
0.2053366, -0.7831219, 2.631116, 1, 1, 1, 1, 1,
0.2245153, -2.102913, 1.517692, 0, 0, 1, 1, 1,
0.2248162, -0.8590961, 3.644567, 1, 0, 0, 1, 1,
0.22734, -0.7471071, 2.643107, 1, 0, 0, 1, 1,
0.2274049, -0.5643373, 4.018978, 1, 0, 0, 1, 1,
0.2282779, -0.02559597, 0.6289771, 1, 0, 0, 1, 1,
0.2304748, 1.022719, -0.1429862, 1, 0, 0, 1, 1,
0.2305515, -0.3875391, 3.610425, 0, 0, 0, 1, 1,
0.2319914, 0.6850932, -0.1574205, 0, 0, 0, 1, 1,
0.2353473, 0.4192417, 1.317072, 0, 0, 0, 1, 1,
0.2360768, -0.4839217, 2.359041, 0, 0, 0, 1, 1,
0.2405352, -0.7371249, 3.166294, 0, 0, 0, 1, 1,
0.2416984, -1.152682, 3.926022, 0, 0, 0, 1, 1,
0.2417243, -0.1093614, 3.245193, 0, 0, 0, 1, 1,
0.2418347, 1.952207, 0.0156115, 1, 1, 1, 1, 1,
0.2452215, 2.432462, 0.8099249, 1, 1, 1, 1, 1,
0.2453737, -0.7976954, 1.8443, 1, 1, 1, 1, 1,
0.2479169, -0.6774293, 3.044586, 1, 1, 1, 1, 1,
0.2510721, 0.6865799, 2.782247, 1, 1, 1, 1, 1,
0.2536485, -0.7839153, 2.044837, 1, 1, 1, 1, 1,
0.2538943, -0.5222021, 1.567657, 1, 1, 1, 1, 1,
0.2543631, 0.7587069, -0.5327998, 1, 1, 1, 1, 1,
0.2570577, 1.641853, 2.649861, 1, 1, 1, 1, 1,
0.2608905, 0.4130042, -0.9913036, 1, 1, 1, 1, 1,
0.263346, -0.9596401, 1.780831, 1, 1, 1, 1, 1,
0.263895, 0.5696304, 0.6921757, 1, 1, 1, 1, 1,
0.2791792, -0.9461172, 2.399941, 1, 1, 1, 1, 1,
0.2792159, -0.8107665, 2.220275, 1, 1, 1, 1, 1,
0.2794832, 0.2729022, 0.5086964, 1, 1, 1, 1, 1,
0.2846992, 0.3656167, 0.6485511, 0, 0, 1, 1, 1,
0.2899639, 0.9873846, -0.7173646, 1, 0, 0, 1, 1,
0.2916421, 1.184078, -0.05495803, 1, 0, 0, 1, 1,
0.295847, -1.537228, 2.582192, 1, 0, 0, 1, 1,
0.3017957, 2.354882, -0.1873335, 1, 0, 0, 1, 1,
0.3028343, 0.3864886, 0.9296489, 1, 0, 0, 1, 1,
0.3032266, -1.222366, 3.48918, 0, 0, 0, 1, 1,
0.3055053, 1.180005, 2.233093, 0, 0, 0, 1, 1,
0.3100069, 0.153609, 0.3612739, 0, 0, 0, 1, 1,
0.3128534, -1.016852, 5.127727, 0, 0, 0, 1, 1,
0.313024, 0.4684241, -0.07958043, 0, 0, 0, 1, 1,
0.3135691, -0.5665496, 2.631002, 0, 0, 0, 1, 1,
0.3137296, -0.2249774, 2.177529, 0, 0, 0, 1, 1,
0.3142239, -0.3279941, 2.788446, 1, 1, 1, 1, 1,
0.3153265, -0.4990844, 1.233271, 1, 1, 1, 1, 1,
0.3226128, -0.1379555, 2.578626, 1, 1, 1, 1, 1,
0.3235551, 0.3986427, -0.8091872, 1, 1, 1, 1, 1,
0.324079, 0.5150368, 0.1906522, 1, 1, 1, 1, 1,
0.3292246, -0.2339729, 2.348469, 1, 1, 1, 1, 1,
0.3350652, 1.196602, 1.071547, 1, 1, 1, 1, 1,
0.3358713, -2.638015, 0.8808404, 1, 1, 1, 1, 1,
0.3422413, -0.4361823, 2.512215, 1, 1, 1, 1, 1,
0.3424017, -0.9567738, 2.515399, 1, 1, 1, 1, 1,
0.3483596, -0.5230761, 2.09163, 1, 1, 1, 1, 1,
0.3494081, 0.339209, 1.353565, 1, 1, 1, 1, 1,
0.353507, -0.08929057, 0.1726509, 1, 1, 1, 1, 1,
0.3543516, 0.1953136, -0.2248936, 1, 1, 1, 1, 1,
0.3566925, -1.430026, 2.530493, 1, 1, 1, 1, 1,
0.3585302, -1.656024, 3.952857, 0, 0, 1, 1, 1,
0.36109, 0.3985104, 2.262637, 1, 0, 0, 1, 1,
0.3650959, 0.7230526, -0.6755386, 1, 0, 0, 1, 1,
0.3699187, 0.9226099, 0.06410641, 1, 0, 0, 1, 1,
0.372293, 0.07498278, 1.51028, 1, 0, 0, 1, 1,
0.3775193, 0.316786, 1.935502, 1, 0, 0, 1, 1,
0.3778488, -0.765044, 3.1824, 0, 0, 0, 1, 1,
0.3799433, 1.964728, 0.6483793, 0, 0, 0, 1, 1,
0.3810307, 0.6375197, 0.4656021, 0, 0, 0, 1, 1,
0.3865921, 0.09772737, -0.03080067, 0, 0, 0, 1, 1,
0.3893507, 0.02483118, 1.492509, 0, 0, 0, 1, 1,
0.39318, 0.6198385, -0.3687325, 0, 0, 0, 1, 1,
0.3969137, -0.1980577, 2.046968, 0, 0, 0, 1, 1,
0.4019928, -0.8498248, 3.697227, 1, 1, 1, 1, 1,
0.4034576, -0.03650027, 2.843411, 1, 1, 1, 1, 1,
0.4035472, 0.7607921, -2.139328, 1, 1, 1, 1, 1,
0.4061833, -1.348686, 2.052663, 1, 1, 1, 1, 1,
0.410444, 0.515799, 0.955206, 1, 1, 1, 1, 1,
0.4127957, -0.357761, 1.889957, 1, 1, 1, 1, 1,
0.4191089, -0.8731403, 3.779734, 1, 1, 1, 1, 1,
0.4191412, -0.4869421, 3.21405, 1, 1, 1, 1, 1,
0.424022, -0.1793193, 2.847521, 1, 1, 1, 1, 1,
0.4297723, -0.8868479, 1.189102, 1, 1, 1, 1, 1,
0.431373, -1.498965, 3.852692, 1, 1, 1, 1, 1,
0.4319306, -1.113128, 2.612621, 1, 1, 1, 1, 1,
0.4346665, 0.6961939, -1.149453, 1, 1, 1, 1, 1,
0.434696, -0.03198585, 2.855521, 1, 1, 1, 1, 1,
0.4448687, -1.553285, 4.024801, 1, 1, 1, 1, 1,
0.4450143, 0.9522437, -0.1740576, 0, 0, 1, 1, 1,
0.4466254, 0.1576823, 1.714228, 1, 0, 0, 1, 1,
0.4474502, -1.875131, 3.467494, 1, 0, 0, 1, 1,
0.4510119, 1.260685, -1.331731, 1, 0, 0, 1, 1,
0.4532784, 0.4596982, 0.887729, 1, 0, 0, 1, 1,
0.4582882, -0.08316941, 0.8481616, 1, 0, 0, 1, 1,
0.4585476, -1.004904, 0.7626798, 0, 0, 0, 1, 1,
0.4632953, -0.5946026, 3.799451, 0, 0, 0, 1, 1,
0.4645041, 0.9305395, 0.2088102, 0, 0, 0, 1, 1,
0.4648343, 0.9398937, 1.652113, 0, 0, 0, 1, 1,
0.4699248, -1.110391, 2.133472, 0, 0, 0, 1, 1,
0.4720965, 1.628141, -0.04495785, 0, 0, 0, 1, 1,
0.4776734, 1.715908, 1.065419, 0, 0, 0, 1, 1,
0.4807622, 0.09662861, 1.541428, 1, 1, 1, 1, 1,
0.4829399, -0.1271223, 2.946533, 1, 1, 1, 1, 1,
0.4833155, 1.885185, 0.3125817, 1, 1, 1, 1, 1,
0.4887873, -1.691084, 3.220166, 1, 1, 1, 1, 1,
0.489372, -0.02337973, 4.31047, 1, 1, 1, 1, 1,
0.4963832, 0.5614455, -0.4743034, 1, 1, 1, 1, 1,
0.4988853, -0.2157815, 2.268397, 1, 1, 1, 1, 1,
0.5001002, -0.1029651, 0.869347, 1, 1, 1, 1, 1,
0.501013, 0.2486768, -0.1090044, 1, 1, 1, 1, 1,
0.5012821, 0.6220365, 0.5007041, 1, 1, 1, 1, 1,
0.5029321, -0.6813843, 1.633492, 1, 1, 1, 1, 1,
0.5033046, 1.273802, 0.2280134, 1, 1, 1, 1, 1,
0.5040706, -0.07540978, 2.184845, 1, 1, 1, 1, 1,
0.5121382, 0.5428455, 1.467209, 1, 1, 1, 1, 1,
0.5121884, -0.6650903, 3.50494, 1, 1, 1, 1, 1,
0.5137703, -1.25504, 1.659466, 0, 0, 1, 1, 1,
0.5139477, -0.8931604, 3.354547, 1, 0, 0, 1, 1,
0.5178916, 0.3392, 0.5004036, 1, 0, 0, 1, 1,
0.518611, -1.524783, 3.275259, 1, 0, 0, 1, 1,
0.5221499, -0.8591681, 2.623863, 1, 0, 0, 1, 1,
0.5259299, -0.9637259, 2.846884, 1, 0, 0, 1, 1,
0.5272596, -0.08414792, 2.890013, 0, 0, 0, 1, 1,
0.5282819, 0.9797828, 0.5887825, 0, 0, 0, 1, 1,
0.5297146, -1.200577, 2.899926, 0, 0, 0, 1, 1,
0.5308745, -0.08884603, 0.4930566, 0, 0, 0, 1, 1,
0.5329881, -1.636388, 2.668295, 0, 0, 0, 1, 1,
0.5333703, 1.002569, 0.3040412, 0, 0, 0, 1, 1,
0.5346503, -0.5146813, 2.44278, 0, 0, 0, 1, 1,
0.5354033, -0.3427264, 3.017298, 1, 1, 1, 1, 1,
0.542953, -0.142548, 1.54539, 1, 1, 1, 1, 1,
0.5446665, 1.807117, 0.7006386, 1, 1, 1, 1, 1,
0.5447916, 0.9027687, 1.711251, 1, 1, 1, 1, 1,
0.5462232, 2.239825, 1.046199, 1, 1, 1, 1, 1,
0.5491261, -0.1623684, 1.527336, 1, 1, 1, 1, 1,
0.5520899, -0.3344002, 1.220196, 1, 1, 1, 1, 1,
0.5539792, 2.10322, 1.602033, 1, 1, 1, 1, 1,
0.5574912, 1.003595, -1.204788, 1, 1, 1, 1, 1,
0.5615739, -0.00141069, 2.093138, 1, 1, 1, 1, 1,
0.5620452, 2.603695, 0.5283139, 1, 1, 1, 1, 1,
0.5655373, 1.203841, 0.8285219, 1, 1, 1, 1, 1,
0.5676277, 1.091509, 0.1987138, 1, 1, 1, 1, 1,
0.5725786, 0.3887584, 0.5656403, 1, 1, 1, 1, 1,
0.575969, 1.047743, -0.5134543, 1, 1, 1, 1, 1,
0.5762781, -0.9093994, 2.7357, 0, 0, 1, 1, 1,
0.5779608, 1.112521, -0.4147645, 1, 0, 0, 1, 1,
0.5795587, -0.7687075, 1.890541, 1, 0, 0, 1, 1,
0.5825129, 0.142878, 2.533473, 1, 0, 0, 1, 1,
0.5880105, -0.3262323, 2.587411, 1, 0, 0, 1, 1,
0.5882938, 1.240991, 0.423748, 1, 0, 0, 1, 1,
0.590932, -1.513356, 1.246331, 0, 0, 0, 1, 1,
0.5919787, 0.2696274, 1.986044, 0, 0, 0, 1, 1,
0.5925036, -1.301609, 1.360599, 0, 0, 0, 1, 1,
0.5939242, 1.021881, 0.6364989, 0, 0, 0, 1, 1,
0.5996544, 0.569743, -1.20073, 0, 0, 0, 1, 1,
0.5997118, -0.9596735, 2.439101, 0, 0, 0, 1, 1,
0.6001546, -1.051936, 3.487116, 0, 0, 0, 1, 1,
0.6022303, 1.047078, 0.4795703, 1, 1, 1, 1, 1,
0.607704, 1.015023, -2.165515, 1, 1, 1, 1, 1,
0.6233038, -1.050465, 2.084457, 1, 1, 1, 1, 1,
0.633374, -0.0113499, 1.360742, 1, 1, 1, 1, 1,
0.6344314, -0.4162346, 2.113814, 1, 1, 1, 1, 1,
0.635286, -0.8055115, 3.073967, 1, 1, 1, 1, 1,
0.6391318, -0.08027248, 1.488353, 1, 1, 1, 1, 1,
0.641009, 0.2014945, 1.227911, 1, 1, 1, 1, 1,
0.6435285, 0.249634, 1.396579, 1, 1, 1, 1, 1,
0.6439106, 0.8671222, 0.7184456, 1, 1, 1, 1, 1,
0.6448197, 0.9160764, 0.8282341, 1, 1, 1, 1, 1,
0.6457368, 2.061598, 1.53418, 1, 1, 1, 1, 1,
0.6482678, -1.838777, 2.64046, 1, 1, 1, 1, 1,
0.6505064, -1.121435, 3.116746, 1, 1, 1, 1, 1,
0.6563852, -0.4583256, 2.732218, 1, 1, 1, 1, 1,
0.6574337, -1.932031, 1.046108, 0, 0, 1, 1, 1,
0.660227, -1.259602, 4.122101, 1, 0, 0, 1, 1,
0.6768343, 0.3422388, 2.41998, 1, 0, 0, 1, 1,
0.6833658, -1.054083, 1.362506, 1, 0, 0, 1, 1,
0.6899818, 0.8384883, 2.587735, 1, 0, 0, 1, 1,
0.6907746, -0.03376332, 2.979771, 1, 0, 0, 1, 1,
0.6935523, 0.3480147, 0.02784847, 0, 0, 0, 1, 1,
0.694345, -0.3683509, 2.470642, 0, 0, 0, 1, 1,
0.6948055, 0.2869006, -0.165761, 0, 0, 0, 1, 1,
0.6983382, -1.387454, 5.704317, 0, 0, 0, 1, 1,
0.7060273, -0.4326712, 2.474511, 0, 0, 0, 1, 1,
0.7065004, 0.872592, 0.946374, 0, 0, 0, 1, 1,
0.7066175, -0.8173735, 4.457678, 0, 0, 0, 1, 1,
0.7152639, -0.17059, 2.553564, 1, 1, 1, 1, 1,
0.7175704, -1.119852, 0.8592372, 1, 1, 1, 1, 1,
0.7187674, 0.9406694, 0.9991906, 1, 1, 1, 1, 1,
0.7214431, 0.438288, 1.80361, 1, 1, 1, 1, 1,
0.7215922, -1.633361, 2.387269, 1, 1, 1, 1, 1,
0.7330226, 1.38362, 0.7947685, 1, 1, 1, 1, 1,
0.7343405, -0.8920895, 2.699851, 1, 1, 1, 1, 1,
0.7374813, -0.06527023, 1.731731, 1, 1, 1, 1, 1,
0.7381997, 2.120095, 2.194622, 1, 1, 1, 1, 1,
0.7415648, -0.7154243, 2.64291, 1, 1, 1, 1, 1,
0.7430245, 0.700121, 0.2984128, 1, 1, 1, 1, 1,
0.7448009, -0.08916306, 1.506266, 1, 1, 1, 1, 1,
0.7451488, 0.1296506, 1.398173, 1, 1, 1, 1, 1,
0.7459843, 0.6856045, 0.6802675, 1, 1, 1, 1, 1,
0.7510905, 0.3794666, 0.4447896, 1, 1, 1, 1, 1,
0.7577206, 0.1715694, -0.3863326, 0, 0, 1, 1, 1,
0.7614813, 0.159429, 0.7447532, 1, 0, 0, 1, 1,
0.761799, -1.514764, 2.736659, 1, 0, 0, 1, 1,
0.7722523, -0.2270773, 2.406343, 1, 0, 0, 1, 1,
0.7828869, 0.125771, 0.7644307, 1, 0, 0, 1, 1,
0.7834386, 1.427234, -0.1594027, 1, 0, 0, 1, 1,
0.788439, -1.208243, 2.080877, 0, 0, 0, 1, 1,
0.7884666, -1.052393, 1.248901, 0, 0, 0, 1, 1,
0.7939553, 0.7603986, 0.9815, 0, 0, 0, 1, 1,
0.7948604, -1.459644, 3.319447, 0, 0, 0, 1, 1,
0.797556, -2.001853, 4.36098, 0, 0, 0, 1, 1,
0.8006537, -0.2885436, 1.35019, 0, 0, 0, 1, 1,
0.803532, -1.19628, 3.437936, 0, 0, 0, 1, 1,
0.8071312, 2.495342, -0.7709601, 1, 1, 1, 1, 1,
0.8086668, -0.6571241, 5.327675, 1, 1, 1, 1, 1,
0.8153848, 0.3806682, -0.02692039, 1, 1, 1, 1, 1,
0.8189179, 0.9678211, -2.058277, 1, 1, 1, 1, 1,
0.8229021, 0.7901453, -0.2313459, 1, 1, 1, 1, 1,
0.8238916, -0.9898829, 1.535418, 1, 1, 1, 1, 1,
0.8259624, 1.191841, 0.5097553, 1, 1, 1, 1, 1,
0.8262269, -0.8793351, 3.95742, 1, 1, 1, 1, 1,
0.8288766, -0.507318, 3.058165, 1, 1, 1, 1, 1,
0.82907, 0.9214121, 2.770013, 1, 1, 1, 1, 1,
0.8452795, -1.261658, 1.221346, 1, 1, 1, 1, 1,
0.8545191, 0.06292237, 1.607302, 1, 1, 1, 1, 1,
0.8554463, 1.733414, 0.822653, 1, 1, 1, 1, 1,
0.8557978, -0.6452037, 3.65748, 1, 1, 1, 1, 1,
0.8568011, -1.985589, 2.679723, 1, 1, 1, 1, 1,
0.8582144, -0.9874641, 1.438811, 0, 0, 1, 1, 1,
0.862955, 0.531781, 0.2454676, 1, 0, 0, 1, 1,
0.8645559, -0.2979107, 3.663908, 1, 0, 0, 1, 1,
0.8675171, 0.7543429, 1.564688, 1, 0, 0, 1, 1,
0.8690775, 1.411063, -1.09609, 1, 0, 0, 1, 1,
0.8705375, -2.439531, 1.566062, 1, 0, 0, 1, 1,
0.8773516, -0.302469, 2.185354, 0, 0, 0, 1, 1,
0.8842118, -0.250144, 2.563376, 0, 0, 0, 1, 1,
0.8867041, 0.1508594, -0.1762487, 0, 0, 0, 1, 1,
0.8955587, -0.2456966, 2.728557, 0, 0, 0, 1, 1,
0.8960785, -1.520871, 0.682777, 0, 0, 0, 1, 1,
0.9073839, 1.338886, 0.9051444, 0, 0, 0, 1, 1,
0.9075224, 0.1833123, 0.7938755, 0, 0, 0, 1, 1,
0.9078414, 1.724478, 0.596654, 1, 1, 1, 1, 1,
0.9114821, 1.425442, 0.5385086, 1, 1, 1, 1, 1,
0.9144736, 0.5904695, 2.301277, 1, 1, 1, 1, 1,
0.9166855, -0.4136685, 3.147525, 1, 1, 1, 1, 1,
0.9168083, 0.8349803, -0.6615236, 1, 1, 1, 1, 1,
0.9243039, 0.5029038, 1.487003, 1, 1, 1, 1, 1,
0.9285375, -0.460973, 1.925137, 1, 1, 1, 1, 1,
0.9343013, -0.6385059, 0.9213668, 1, 1, 1, 1, 1,
0.9410509, -0.1567509, 3.971446, 1, 1, 1, 1, 1,
0.9444824, 0.98655, 2.522239, 1, 1, 1, 1, 1,
0.9555512, -2.020483, 2.604275, 1, 1, 1, 1, 1,
0.9561493, -0.8696316, 0.857621, 1, 1, 1, 1, 1,
0.9563823, -0.08792365, 0.9027948, 1, 1, 1, 1, 1,
0.9605498, -0.2280871, 2.718683, 1, 1, 1, 1, 1,
0.9605702, -1.084397, 2.39997, 1, 1, 1, 1, 1,
0.9640712, -0.7825822, 3.918479, 0, 0, 1, 1, 1,
0.9678379, -1.825212, 3.68012, 1, 0, 0, 1, 1,
0.9718626, 0.3040092, 0.09786699, 1, 0, 0, 1, 1,
0.9725457, -0.3044884, 1.279001, 1, 0, 0, 1, 1,
0.9731711, 2.097898, -0.2070555, 1, 0, 0, 1, 1,
0.975015, 0.7427505, 1.853063, 1, 0, 0, 1, 1,
0.9764819, 1.3087, 0.5625591, 0, 0, 0, 1, 1,
0.9825289, -0.5674401, 0.6969026, 0, 0, 0, 1, 1,
0.9844725, -0.3219272, 0.6131374, 0, 0, 0, 1, 1,
0.9882736, -0.9297317, 2.301926, 0, 0, 0, 1, 1,
0.9896356, -0.8900111, 2.578043, 0, 0, 0, 1, 1,
0.9914606, -0.2132108, 1.695827, 0, 0, 0, 1, 1,
0.9958346, 0.715034, 0.932786, 0, 0, 0, 1, 1,
0.9974326, 0.08550275, 0.1791177, 1, 1, 1, 1, 1,
1.000368, 0.156864, 1.17254, 1, 1, 1, 1, 1,
1.013518, 1.114458, 0.9368522, 1, 1, 1, 1, 1,
1.018453, 0.3702315, 0.7236902, 1, 1, 1, 1, 1,
1.024742, -1.620317, 1.406661, 1, 1, 1, 1, 1,
1.025603, -0.119142, 1.36566, 1, 1, 1, 1, 1,
1.02932, -1.399573, 2.075564, 1, 1, 1, 1, 1,
1.031034, -0.7051239, 0.2257761, 1, 1, 1, 1, 1,
1.034526, 0.04891337, 3.228708, 1, 1, 1, 1, 1,
1.040219, -1.018425, 1.252769, 1, 1, 1, 1, 1,
1.043016, -1.782688, 3.275111, 1, 1, 1, 1, 1,
1.057506, -0.6310513, 3.337674, 1, 1, 1, 1, 1,
1.062011, 0.1742849, 0.5401325, 1, 1, 1, 1, 1,
1.074632, 0.2331426, 1.819742, 1, 1, 1, 1, 1,
1.087574, -0.4627746, 1.879656, 1, 1, 1, 1, 1,
1.090637, 0.2866468, 4.371586, 0, 0, 1, 1, 1,
1.091758, 1.43598, -0.1514666, 1, 0, 0, 1, 1,
1.093475, 0.3728859, 2.468347, 1, 0, 0, 1, 1,
1.096153, -0.1359448, 2.254311, 1, 0, 0, 1, 1,
1.097421, -1.932148, 3.211507, 1, 0, 0, 1, 1,
1.099784, 0.685803, 2.130048, 1, 0, 0, 1, 1,
1.100485, 0.6761028, -0.4578894, 0, 0, 0, 1, 1,
1.101482, -0.806917, 3.234202, 0, 0, 0, 1, 1,
1.122974, 0.5051772, 1.442483, 0, 0, 0, 1, 1,
1.131965, -1.123254, 2.246029, 0, 0, 0, 1, 1,
1.149945, 1.003818, 2.390583, 0, 0, 0, 1, 1,
1.155963, 0.2160304, 0.7020451, 0, 0, 0, 1, 1,
1.158317, 0.450484, 1.458866, 0, 0, 0, 1, 1,
1.158327, 1.006065, -0.8905883, 1, 1, 1, 1, 1,
1.176443, 0.5340363, 1.737268, 1, 1, 1, 1, 1,
1.192103, 0.9941872, 0.5788944, 1, 1, 1, 1, 1,
1.193562, 0.3484367, 2.419968, 1, 1, 1, 1, 1,
1.205283, -0.6977258, 3.509681, 1, 1, 1, 1, 1,
1.207943, 0.1443997, 3.213046, 1, 1, 1, 1, 1,
1.227436, 1.327987, 1.989466, 1, 1, 1, 1, 1,
1.237203, -1.327307, 1.855712, 1, 1, 1, 1, 1,
1.246248, 0.85559, 1.307584, 1, 1, 1, 1, 1,
1.259448, 0.5853394, 0.4026482, 1, 1, 1, 1, 1,
1.286176, -0.5552874, 2.95035, 1, 1, 1, 1, 1,
1.294666, 0.5217896, -0.1421423, 1, 1, 1, 1, 1,
1.300525, 1.336224, 1.657961, 1, 1, 1, 1, 1,
1.300773, -1.070099, 2.528983, 1, 1, 1, 1, 1,
1.316545, 0.1753461, 2.347489, 1, 1, 1, 1, 1,
1.332485, -0.1079845, 1.21575, 0, 0, 1, 1, 1,
1.334458, 0.6644478, 0.4574335, 1, 0, 0, 1, 1,
1.340828, 0.002135246, 0.8738135, 1, 0, 0, 1, 1,
1.357051, 1.331138, 1.533734, 1, 0, 0, 1, 1,
1.361713, 0.2539413, 1.069397, 1, 0, 0, 1, 1,
1.369858, 1.118328, -0.1485867, 1, 0, 0, 1, 1,
1.381044, 0.1025501, 1.69741, 0, 0, 0, 1, 1,
1.38153, 2.004158, 0.06151038, 0, 0, 0, 1, 1,
1.383298, -0.6261544, 1.641254, 0, 0, 0, 1, 1,
1.393946, -0.3393798, 3.237411, 0, 0, 0, 1, 1,
1.396592, 0.3436366, 1.951489, 0, 0, 0, 1, 1,
1.402997, 0.6937796, 0.9984744, 0, 0, 0, 1, 1,
1.408808, 0.1216604, 1.818999, 0, 0, 0, 1, 1,
1.417015, -2.107952, 3.189018, 1, 1, 1, 1, 1,
1.429119, 0.8668581, 2.275121, 1, 1, 1, 1, 1,
1.440774, -0.607842, 3.494897, 1, 1, 1, 1, 1,
1.446868, -0.8410191, 1.779865, 1, 1, 1, 1, 1,
1.455689, -1.105103, 3.095731, 1, 1, 1, 1, 1,
1.459749, -0.2250719, 3.077776, 1, 1, 1, 1, 1,
1.48138, 0.5270929, 1.863634, 1, 1, 1, 1, 1,
1.531981, -0.2202782, 1.832846, 1, 1, 1, 1, 1,
1.539462, -0.2007874, 1.587209, 1, 1, 1, 1, 1,
1.54098, 0.6193968, 1.789316, 1, 1, 1, 1, 1,
1.542174, -1.490664, 0.8492669, 1, 1, 1, 1, 1,
1.549353, 1.207007, 1.0654, 1, 1, 1, 1, 1,
1.558139, 1.034925, -0.6430945, 1, 1, 1, 1, 1,
1.561717, 0.4018919, 1.437528, 1, 1, 1, 1, 1,
1.585538, -0.01594518, 1.987889, 1, 1, 1, 1, 1,
1.589462, 0.7618458, -0.9542994, 0, 0, 1, 1, 1,
1.599968, 0.6134046, 1.645635, 1, 0, 0, 1, 1,
1.610118, 1.125841, 1.658175, 1, 0, 0, 1, 1,
1.613083, -0.04884319, -0.4415589, 1, 0, 0, 1, 1,
1.645861, -0.7228749, 1.78694, 1, 0, 0, 1, 1,
1.651752, -0.6154112, 1.597172, 1, 0, 0, 1, 1,
1.661001, 1.688232, 0.7930837, 0, 0, 0, 1, 1,
1.665402, -0.1197298, 2.366679, 0, 0, 0, 1, 1,
1.683454, 0.02987825, 1.09846, 0, 0, 0, 1, 1,
1.687152, 0.7756203, 0.9873242, 0, 0, 0, 1, 1,
1.691137, -2.595793, 3.596846, 0, 0, 0, 1, 1,
1.701264, 0.3422733, 0.6417301, 0, 0, 0, 1, 1,
1.704472, -0.4232631, 1.776179, 0, 0, 0, 1, 1,
1.739128, -0.5571335, 2.584167, 1, 1, 1, 1, 1,
1.752218, -1.503498, 2.84275, 1, 1, 1, 1, 1,
1.75534, 1.537255, 0.09152197, 1, 1, 1, 1, 1,
1.755572, -0.7030987, 1.100847, 1, 1, 1, 1, 1,
1.759454, 0.7480245, 2.65555, 1, 1, 1, 1, 1,
1.766416, -0.6743462, 1.658129, 1, 1, 1, 1, 1,
1.7715, -1.426739, 2.164221, 1, 1, 1, 1, 1,
1.77841, 0.472034, 1.519739, 1, 1, 1, 1, 1,
1.782176, -0.9697146, 1.742105, 1, 1, 1, 1, 1,
1.787307, -1.23941, 2.008315, 1, 1, 1, 1, 1,
1.798894, 0.5272723, 2.25831, 1, 1, 1, 1, 1,
1.807299, 0.7819804, 2.506013, 1, 1, 1, 1, 1,
1.811459, 0.5111673, 2.681787, 1, 1, 1, 1, 1,
1.828841, 0.9177365, 1.133835, 1, 1, 1, 1, 1,
1.830268, 0.4681794, 0.6102807, 1, 1, 1, 1, 1,
1.849293, 0.9315489, 1.726445, 0, 0, 1, 1, 1,
1.850523, 0.9800486, 1.359727, 1, 0, 0, 1, 1,
1.856551, 0.07009899, 2.101697, 1, 0, 0, 1, 1,
1.861343, -1.839226, 2.750993, 1, 0, 0, 1, 1,
1.86834, -0.3840219, 1.408448, 1, 0, 0, 1, 1,
1.868801, -0.04604257, 1.829003, 1, 0, 0, 1, 1,
1.87057, 1.206872, 1.199024, 0, 0, 0, 1, 1,
1.870745, 0.4638124, 3.061782, 0, 0, 0, 1, 1,
1.87504, 0.3812459, 2.232411, 0, 0, 0, 1, 1,
1.88477, 0.2828182, 2.000086, 0, 0, 0, 1, 1,
1.885797, 0.2822882, 1.662041, 0, 0, 0, 1, 1,
1.919938, -0.8747467, 2.605907, 0, 0, 0, 1, 1,
1.929567, -1.289877, 0.3395861, 0, 0, 0, 1, 1,
1.937264, -0.516555, 1.905322, 1, 1, 1, 1, 1,
1.940978, -0.3756059, 2.90438, 1, 1, 1, 1, 1,
1.945186, 0.6574568, 0.8798961, 1, 1, 1, 1, 1,
1.946522, 0.9721311, 2.34068, 1, 1, 1, 1, 1,
1.947055, 0.3621597, 4.422781, 1, 1, 1, 1, 1,
1.965987, -1.206954, 3.412909, 1, 1, 1, 1, 1,
1.968065, 0.7151372, 2.173478, 1, 1, 1, 1, 1,
1.98826, -0.610221, 1.882379, 1, 1, 1, 1, 1,
1.989659, -0.8992367, 1.383774, 1, 1, 1, 1, 1,
2.013845, 0.4709614, 0.2361275, 1, 1, 1, 1, 1,
2.01756, 1.299164, 2.613997, 1, 1, 1, 1, 1,
2.023457, -0.3037569, 1.92144, 1, 1, 1, 1, 1,
2.029372, -0.2820195, 1.813533, 1, 1, 1, 1, 1,
2.033355, 0.1887834, 1.500282, 1, 1, 1, 1, 1,
2.060351, 0.1831723, 4.039715, 1, 1, 1, 1, 1,
2.076213, 1.099284, 3.175713, 0, 0, 1, 1, 1,
2.085931, 0.2230512, 0.2659105, 1, 0, 0, 1, 1,
2.114434, -0.6092505, 2.097221, 1, 0, 0, 1, 1,
2.144209, 1.291143, 2.470685, 1, 0, 0, 1, 1,
2.155511, 1.768437, 0.7693233, 1, 0, 0, 1, 1,
2.158248, -0.247202, 4.399327, 1, 0, 0, 1, 1,
2.164054, 1.305709, -0.1507529, 0, 0, 0, 1, 1,
2.197645, -0.02273904, 2.626838, 0, 0, 0, 1, 1,
2.201725, -0.145271, 0.7365972, 0, 0, 0, 1, 1,
2.284351, -0.2962465, 3.371542, 0, 0, 0, 1, 1,
2.296473, -0.02545942, 0.5564576, 0, 0, 0, 1, 1,
2.348572, 1.1063, 1.629571, 0, 0, 0, 1, 1,
2.370089, 0.4108902, 0.6740484, 0, 0, 0, 1, 1,
2.396419, 0.7244077, 0.746161, 1, 1, 1, 1, 1,
2.482964, -1.047654, 2.398022, 1, 1, 1, 1, 1,
2.588891, 0.03110764, 0.2943555, 1, 1, 1, 1, 1,
2.655171, 0.2343421, 2.592766, 1, 1, 1, 1, 1,
2.823968, 0.8197563, 3.761422, 1, 1, 1, 1, 1,
2.86658, -0.9061598, 2.355028, 1, 1, 1, 1, 1,
3.057185, 0.5354878, 1.327389, 1, 1, 1, 1, 1
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
var radius = 9.454079;
var distance = 33.20705;
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
mvMatrix.translate( 0.02693629, -0.2233884, -0.264303 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.20705);
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
