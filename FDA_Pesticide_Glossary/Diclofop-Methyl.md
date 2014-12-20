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
-3.051301, 2.143217, 0.8501138, 1, 0, 0, 1,
-2.869079, 0.9512886, 0.07627611, 1, 0.007843138, 0, 1,
-2.822743, 0.7424382, -0.6749972, 1, 0.01176471, 0, 1,
-2.735689, 0.06863209, -4.087784, 1, 0.01960784, 0, 1,
-2.555013, -0.9873892, -3.487213, 1, 0.02352941, 0, 1,
-2.539038, -0.4770276, -2.083661, 1, 0.03137255, 0, 1,
-2.482708, 1.917736, -1.544788, 1, 0.03529412, 0, 1,
-2.482541, 0.5090396, -1.085864, 1, 0.04313726, 0, 1,
-2.416708, 1.264021, -1.399307, 1, 0.04705882, 0, 1,
-2.387059, 1.240952, -1.891925, 1, 0.05490196, 0, 1,
-2.384754, 1.067293, 0.2056568, 1, 0.05882353, 0, 1,
-2.368637, 0.3009851, -2.635166, 1, 0.06666667, 0, 1,
-2.309217, 2.375067, -0.03171047, 1, 0.07058824, 0, 1,
-2.29266, 0.4985462, -1.940716, 1, 0.07843138, 0, 1,
-2.283267, -1.743257, -2.387154, 1, 0.08235294, 0, 1,
-2.234673, -0.9432251, -3.084018, 1, 0.09019608, 0, 1,
-2.187375, 0.01488428, -1.618642, 1, 0.09411765, 0, 1,
-2.184404, -0.00187175, -2.469222, 1, 0.1019608, 0, 1,
-2.130719, 1.54486, -1.610405, 1, 0.1098039, 0, 1,
-2.107415, -0.192867, -2.17965, 1, 0.1137255, 0, 1,
-2.063167, 1.394788, -0.5544245, 1, 0.1215686, 0, 1,
-2.018566, 0.5148682, -2.094474, 1, 0.1254902, 0, 1,
-2.010447, -1.595195, -1.066228, 1, 0.1333333, 0, 1,
-1.997288, -0.3969208, -1.298594, 1, 0.1372549, 0, 1,
-1.993473, -1.667348, -3.442853, 1, 0.145098, 0, 1,
-1.98349, -0.5781896, -3.008774, 1, 0.1490196, 0, 1,
-1.959297, -1.858739, -3.3973, 1, 0.1568628, 0, 1,
-1.942008, 0.6267704, -0.8738971, 1, 0.1607843, 0, 1,
-1.938622, -0.4708633, -3.172112, 1, 0.1686275, 0, 1,
-1.932434, 0.3806432, -2.924956, 1, 0.172549, 0, 1,
-1.929603, -2.721905, -2.877534, 1, 0.1803922, 0, 1,
-1.89143, 1.245834, -1.18012, 1, 0.1843137, 0, 1,
-1.876547, 0.562031, -0.5419142, 1, 0.1921569, 0, 1,
-1.839911, 0.4382482, -2.261635, 1, 0.1960784, 0, 1,
-1.829692, 0.546141, -0.3081343, 1, 0.2039216, 0, 1,
-1.820986, -1.240352, -1.405675, 1, 0.2117647, 0, 1,
-1.816118, 0.2939128, -2.697426, 1, 0.2156863, 0, 1,
-1.807466, 1.394343, -0.6618806, 1, 0.2235294, 0, 1,
-1.803595, -1.156739, -2.365272, 1, 0.227451, 0, 1,
-1.790177, 0.8781524, -1.74281, 1, 0.2352941, 0, 1,
-1.788044, 0.6766237, -1.285727, 1, 0.2392157, 0, 1,
-1.781033, -2.66368, -1.329628, 1, 0.2470588, 0, 1,
-1.77583, -0.4185807, -3.743797, 1, 0.2509804, 0, 1,
-1.758784, 1.61867, -1.21516, 1, 0.2588235, 0, 1,
-1.756209, -0.959557, -1.908473, 1, 0.2627451, 0, 1,
-1.737393, -0.5353002, -1.311222, 1, 0.2705882, 0, 1,
-1.734956, -2.081364, -2.845416, 1, 0.2745098, 0, 1,
-1.731899, -0.2018443, -1.005616, 1, 0.282353, 0, 1,
-1.727351, -0.3558097, -0.5171933, 1, 0.2862745, 0, 1,
-1.719417, -0.1535007, -0.9634362, 1, 0.2941177, 0, 1,
-1.705798, -1.474049, -3.022207, 1, 0.3019608, 0, 1,
-1.689106, 1.11987, 0.31472, 1, 0.3058824, 0, 1,
-1.685933, -0.3982711, -0.8149235, 1, 0.3137255, 0, 1,
-1.673632, 1.220188, -1.828334, 1, 0.3176471, 0, 1,
-1.668988, 0.1626955, -0.8172112, 1, 0.3254902, 0, 1,
-1.660501, -1.028179, -2.736255, 1, 0.3294118, 0, 1,
-1.657276, 0.1111671, -3.111655, 1, 0.3372549, 0, 1,
-1.656791, 0.4899817, -2.477277, 1, 0.3411765, 0, 1,
-1.65651, -0.6895139, -0.2177659, 1, 0.3490196, 0, 1,
-1.65596, 0.1954673, -2.485415, 1, 0.3529412, 0, 1,
-1.653382, -0.1659478, -2.687129, 1, 0.3607843, 0, 1,
-1.64834, 1.015773, -0.7133964, 1, 0.3647059, 0, 1,
-1.628895, 0.4924068, -1.790823, 1, 0.372549, 0, 1,
-1.625852, 0.8526993, -1.610279, 1, 0.3764706, 0, 1,
-1.625065, 0.3080474, -1.80822, 1, 0.3843137, 0, 1,
-1.622751, 1.331043, -0.6697866, 1, 0.3882353, 0, 1,
-1.593153, -0.6141951, -2.334708, 1, 0.3960784, 0, 1,
-1.59308, 0.1845652, -2.205369, 1, 0.4039216, 0, 1,
-1.590742, 2.066241, -2.735313, 1, 0.4078431, 0, 1,
-1.549477, 0.9721931, -2.785842, 1, 0.4156863, 0, 1,
-1.534707, 0.6842125, 1.019618, 1, 0.4196078, 0, 1,
-1.51116, -0.5792551, -1.860068, 1, 0.427451, 0, 1,
-1.501766, 1.115234, 0.161403, 1, 0.4313726, 0, 1,
-1.499352, 0.8792834, -0.7745841, 1, 0.4392157, 0, 1,
-1.497578, 0.2702767, -0.6601377, 1, 0.4431373, 0, 1,
-1.496595, -0.9495881, -1.284345, 1, 0.4509804, 0, 1,
-1.495415, 0.4835754, -0.7167813, 1, 0.454902, 0, 1,
-1.492934, 0.6227648, -0.7533656, 1, 0.4627451, 0, 1,
-1.488532, 0.4205293, -2.610438, 1, 0.4666667, 0, 1,
-1.486478, -0.8012142, -2.375455, 1, 0.4745098, 0, 1,
-1.452834, -0.1824989, -1.299321, 1, 0.4784314, 0, 1,
-1.447192, 0.8737806, -1.790751, 1, 0.4862745, 0, 1,
-1.43433, 0.9213001, -0.008058086, 1, 0.4901961, 0, 1,
-1.432632, -0.8384194, -1.891737, 1, 0.4980392, 0, 1,
-1.418006, -0.3621434, -2.065656, 1, 0.5058824, 0, 1,
-1.393732, 0.06203729, -1.107408, 1, 0.509804, 0, 1,
-1.392961, 0.4327223, -1.242314, 1, 0.5176471, 0, 1,
-1.390817, -1.424233, -4.10888, 1, 0.5215687, 0, 1,
-1.382133, -0.8227951, -0.8632786, 1, 0.5294118, 0, 1,
-1.379859, -0.1775948, -2.14213, 1, 0.5333334, 0, 1,
-1.368638, -0.5443001, -3.497823, 1, 0.5411765, 0, 1,
-1.365007, -0.7979784, -4.000199, 1, 0.5450981, 0, 1,
-1.358323, -1.414427, -0.5617545, 1, 0.5529412, 0, 1,
-1.356577, -0.1552823, -3.049361, 1, 0.5568628, 0, 1,
-1.352946, 0.6815012, -2.73227, 1, 0.5647059, 0, 1,
-1.347023, -0.001370774, -0.4286537, 1, 0.5686275, 0, 1,
-1.341899, 0.04269612, -1.375639, 1, 0.5764706, 0, 1,
-1.334466, -1.136343, -3.243314, 1, 0.5803922, 0, 1,
-1.328217, 0.4946181, -0.1549115, 1, 0.5882353, 0, 1,
-1.323059, 0.4787778, -1.795285, 1, 0.5921569, 0, 1,
-1.309687, -0.537588, -2.46095, 1, 0.6, 0, 1,
-1.30914, 0.5338416, -0.8461918, 1, 0.6078432, 0, 1,
-1.305617, 0.5638528, -0.09545479, 1, 0.6117647, 0, 1,
-1.28636, -0.3985038, 0.9604203, 1, 0.6196079, 0, 1,
-1.27746, -0.9963455, -3.215371, 1, 0.6235294, 0, 1,
-1.272577, 0.4759268, -2.520637, 1, 0.6313726, 0, 1,
-1.264746, -0.2331405, -3.533155, 1, 0.6352941, 0, 1,
-1.259035, -0.37626, -1.894176, 1, 0.6431373, 0, 1,
-1.254703, -0.0666177, -3.619884, 1, 0.6470588, 0, 1,
-1.251992, -0.7109874, -3.018293, 1, 0.654902, 0, 1,
-1.24666, 0.4007133, -0.9196734, 1, 0.6588235, 0, 1,
-1.223169, 0.4451821, -1.145289, 1, 0.6666667, 0, 1,
-1.221957, 0.8248349, -1.45195, 1, 0.6705883, 0, 1,
-1.21461, 1.318972, -1.317683, 1, 0.6784314, 0, 1,
-1.206728, -0.002280662, -0.7653263, 1, 0.682353, 0, 1,
-1.200569, 0.7605439, -1.394293, 1, 0.6901961, 0, 1,
-1.169192, 0.3975155, -2.174787, 1, 0.6941177, 0, 1,
-1.161797, 1.342072, -0.6490197, 1, 0.7019608, 0, 1,
-1.160356, -0.00965238, -1.670582, 1, 0.7098039, 0, 1,
-1.152915, -1.609007, -3.853263, 1, 0.7137255, 0, 1,
-1.1502, -1.362795, -3.037349, 1, 0.7215686, 0, 1,
-1.148563, 1.171317, -1.232813, 1, 0.7254902, 0, 1,
-1.144871, -0.1610079, -1.543451, 1, 0.7333333, 0, 1,
-1.139249, 1.000293, -2.552239, 1, 0.7372549, 0, 1,
-1.130918, 0.7639719, -1.639577, 1, 0.7450981, 0, 1,
-1.128045, -0.4758394, -1.43941, 1, 0.7490196, 0, 1,
-1.120678, -1.569005, -1.521341, 1, 0.7568628, 0, 1,
-1.101921, -0.2801604, -0.3890198, 1, 0.7607843, 0, 1,
-1.100989, -1.335775, -3.580106, 1, 0.7686275, 0, 1,
-1.095428, -0.4111151, -2.788775, 1, 0.772549, 0, 1,
-1.0945, 0.6211658, -1.763133, 1, 0.7803922, 0, 1,
-1.093072, -1.604159, -3.850572, 1, 0.7843137, 0, 1,
-1.07856, 0.3525423, -1.238266, 1, 0.7921569, 0, 1,
-1.077495, 1.731803, 0.1781125, 1, 0.7960784, 0, 1,
-1.076802, -1.10777, -2.560784, 1, 0.8039216, 0, 1,
-1.07087, -0.1404928, -1.380807, 1, 0.8117647, 0, 1,
-1.068207, 0.4345667, -0.4926156, 1, 0.8156863, 0, 1,
-1.061698, -1.27482, -1.493443, 1, 0.8235294, 0, 1,
-1.057798, -0.4633988, -1.675233, 1, 0.827451, 0, 1,
-1.052854, -1.733244, -0.922688, 1, 0.8352941, 0, 1,
-1.044487, -1.215084, -4.286679, 1, 0.8392157, 0, 1,
-1.043507, 0.1369914, -1.625792, 1, 0.8470588, 0, 1,
-1.042497, 0.5324649, -1.707672, 1, 0.8509804, 0, 1,
-1.041237, 1.618381, -1.160235, 1, 0.8588235, 0, 1,
-1.033436, 0.3059302, -1.285123, 1, 0.8627451, 0, 1,
-1.033065, 0.525485, -2.122817, 1, 0.8705882, 0, 1,
-1.028199, 0.5946342, -2.842881, 1, 0.8745098, 0, 1,
-1.022587, 0.3871402, -0.6123834, 1, 0.8823529, 0, 1,
-1.017403, -1.504417, -4.096394, 1, 0.8862745, 0, 1,
-1.008894, 0.4732639, -1.022213, 1, 0.8941177, 0, 1,
-0.9978472, -0.747916, -3.006575, 1, 0.8980392, 0, 1,
-0.9974681, 0.4678341, -2.312833, 1, 0.9058824, 0, 1,
-0.9938945, 1.238059, -0.3518401, 1, 0.9137255, 0, 1,
-0.9930779, 0.2903015, -0.0790592, 1, 0.9176471, 0, 1,
-0.9910398, 1.449747, -2.494314, 1, 0.9254902, 0, 1,
-0.9906108, -0.9949847, -1.372899, 1, 0.9294118, 0, 1,
-0.9845705, 0.8191787, 0.8909306, 1, 0.9372549, 0, 1,
-0.9826939, -0.01875821, -0.6948925, 1, 0.9411765, 0, 1,
-0.977545, -1.602598, -4.119431, 1, 0.9490196, 0, 1,
-0.9767922, -0.3035775, -1.144614, 1, 0.9529412, 0, 1,
-0.9764212, 1.425372, -2.412133, 1, 0.9607843, 0, 1,
-0.9712442, 0.07677146, -2.702846, 1, 0.9647059, 0, 1,
-0.9705098, -0.1195636, -0.5829893, 1, 0.972549, 0, 1,
-0.962816, -1.032461, -2.099609, 1, 0.9764706, 0, 1,
-0.9588988, -1.201775, -2.940183, 1, 0.9843137, 0, 1,
-0.9568756, 0.6667262, -1.062691, 1, 0.9882353, 0, 1,
-0.9529382, -0.2247961, -1.948093, 1, 0.9960784, 0, 1,
-0.9408081, -0.5120225, -1.730924, 0.9960784, 1, 0, 1,
-0.9395009, -0.4315731, -1.590288, 0.9921569, 1, 0, 1,
-0.9361628, 0.6997657, -0.02106144, 0.9843137, 1, 0, 1,
-0.9341985, 0.5139185, -0.02999957, 0.9803922, 1, 0, 1,
-0.9315795, -0.1058237, -0.9114954, 0.972549, 1, 0, 1,
-0.9285513, 0.8805145, 1.156883, 0.9686275, 1, 0, 1,
-0.9273137, -1.163956, -1.637834, 0.9607843, 1, 0, 1,
-0.9267116, 1.826557, -0.04363209, 0.9568627, 1, 0, 1,
-0.9146343, 1.175396, -0.8545138, 0.9490196, 1, 0, 1,
-0.9102817, 0.2065526, -1.615672, 0.945098, 1, 0, 1,
-0.9033246, 0.1774348, -0.7771868, 0.9372549, 1, 0, 1,
-0.8974851, -0.849016, -0.7190866, 0.9333333, 1, 0, 1,
-0.8943619, 0.9048801, -0.6357113, 0.9254902, 1, 0, 1,
-0.8919126, 1.190643, 0.3050072, 0.9215686, 1, 0, 1,
-0.8851315, -1.523624, -2.870765, 0.9137255, 1, 0, 1,
-0.8817741, -0.3440343, -0.363418, 0.9098039, 1, 0, 1,
-0.867181, -0.8743947, -2.507392, 0.9019608, 1, 0, 1,
-0.8646329, 0.08510946, -2.962082, 0.8941177, 1, 0, 1,
-0.8580977, -0.3489125, -2.214358, 0.8901961, 1, 0, 1,
-0.8545298, 1.533842, 0.4636154, 0.8823529, 1, 0, 1,
-0.8497077, 0.08580868, -1.108449, 0.8784314, 1, 0, 1,
-0.849306, 1.706864, 0.9937249, 0.8705882, 1, 0, 1,
-0.8471221, -0.7522591, -2.618491, 0.8666667, 1, 0, 1,
-0.8323103, -0.6470646, -1.792198, 0.8588235, 1, 0, 1,
-0.8255541, -1.593269, -2.216745, 0.854902, 1, 0, 1,
-0.825395, -1.626839, -2.523069, 0.8470588, 1, 0, 1,
-0.8243261, -2.675589, -3.99947, 0.8431373, 1, 0, 1,
-0.8233385, -2.010303, -2.631801, 0.8352941, 1, 0, 1,
-0.8223308, -1.19623, -3.622724, 0.8313726, 1, 0, 1,
-0.8215685, -0.3798979, -1.568882, 0.8235294, 1, 0, 1,
-0.8209581, 1.420507, -0.7324306, 0.8196079, 1, 0, 1,
-0.8126732, -0.6168049, -3.213917, 0.8117647, 1, 0, 1,
-0.8124666, 0.6412282, -0.3176053, 0.8078431, 1, 0, 1,
-0.8087908, -2.130988, -3.716248, 0.8, 1, 0, 1,
-0.8087466, 0.2726932, -0.7970037, 0.7921569, 1, 0, 1,
-0.8077502, 1.316244, -3.527582, 0.7882353, 1, 0, 1,
-0.8073359, 0.3981614, -1.275773, 0.7803922, 1, 0, 1,
-0.8062357, 0.02698377, -0.8816722, 0.7764706, 1, 0, 1,
-0.8056275, 0.292282, -1.384472, 0.7686275, 1, 0, 1,
-0.8036202, 0.04375896, -1.687443, 0.7647059, 1, 0, 1,
-0.7967983, 0.2272297, -0.9807792, 0.7568628, 1, 0, 1,
-0.7879133, 1.314109, -0.8860909, 0.7529412, 1, 0, 1,
-0.7849016, 0.2985472, -1.082041, 0.7450981, 1, 0, 1,
-0.7847819, 3.065997, -1.354302, 0.7411765, 1, 0, 1,
-0.7807547, 0.5686032, -2.366513, 0.7333333, 1, 0, 1,
-0.7800896, 0.665521, -1.090094, 0.7294118, 1, 0, 1,
-0.7746943, -0.2917444, -1.593562, 0.7215686, 1, 0, 1,
-0.7704516, 1.317239, -2.486416, 0.7176471, 1, 0, 1,
-0.7640221, 1.05045, 0.189238, 0.7098039, 1, 0, 1,
-0.7569738, 1.695099, -0.2375735, 0.7058824, 1, 0, 1,
-0.7547948, 0.5240193, -1.518337, 0.6980392, 1, 0, 1,
-0.753096, -0.3511095, -0.4013404, 0.6901961, 1, 0, 1,
-0.7512136, 0.1111015, -0.618112, 0.6862745, 1, 0, 1,
-0.7491366, -0.01808274, -2.60093, 0.6784314, 1, 0, 1,
-0.7481145, 0.2356001, -2.868374, 0.6745098, 1, 0, 1,
-0.7477577, -1.182688, -3.351777, 0.6666667, 1, 0, 1,
-0.747112, 1.800623, 0.1693546, 0.6627451, 1, 0, 1,
-0.7458026, 1.100261, 0.6461616, 0.654902, 1, 0, 1,
-0.7406419, 1.570532, 0.186372, 0.6509804, 1, 0, 1,
-0.7392824, -0.3923013, 1.267928, 0.6431373, 1, 0, 1,
-0.7363034, 0.2266462, -1.605648, 0.6392157, 1, 0, 1,
-0.7327297, 0.7756811, -0.009205409, 0.6313726, 1, 0, 1,
-0.7317306, -1.540446, -2.754151, 0.627451, 1, 0, 1,
-0.724702, -1.008638, -1.937462, 0.6196079, 1, 0, 1,
-0.7232072, -0.7185713, -3.111547, 0.6156863, 1, 0, 1,
-0.7209531, 0.3378052, -0.6384898, 0.6078432, 1, 0, 1,
-0.71593, -0.5227734, -2.564181, 0.6039216, 1, 0, 1,
-0.7134204, -1.237418, -2.679309, 0.5960785, 1, 0, 1,
-0.7062745, -0.6891237, -3.024748, 0.5882353, 1, 0, 1,
-0.7054747, 1.98866, 0.9098239, 0.5843138, 1, 0, 1,
-0.6992508, -1.888954, -3.66205, 0.5764706, 1, 0, 1,
-0.6980075, -0.414779, -1.474075, 0.572549, 1, 0, 1,
-0.6933501, 0.4996147, 0.6568933, 0.5647059, 1, 0, 1,
-0.6902613, -1.14994, -5.844769, 0.5607843, 1, 0, 1,
-0.6899806, 0.7819026, -0.6737043, 0.5529412, 1, 0, 1,
-0.6862463, -0.6424854, -1.354145, 0.5490196, 1, 0, 1,
-0.6842893, -0.9905052, -0.1672598, 0.5411765, 1, 0, 1,
-0.6828648, 0.5566972, -2.243329, 0.5372549, 1, 0, 1,
-0.682619, -0.2552249, -2.775231, 0.5294118, 1, 0, 1,
-0.6818841, -0.5302361, -2.54976, 0.5254902, 1, 0, 1,
-0.6761186, 0.5213422, 0.4692062, 0.5176471, 1, 0, 1,
-0.6716402, 0.1014714, -1.015353, 0.5137255, 1, 0, 1,
-0.6693917, 0.6746567, 0.1076152, 0.5058824, 1, 0, 1,
-0.6645083, -0.1575304, -2.413634, 0.5019608, 1, 0, 1,
-0.6608148, -0.9115459, -1.827677, 0.4941176, 1, 0, 1,
-0.6600595, -0.672011, -0.9658521, 0.4862745, 1, 0, 1,
-0.6535491, -0.4871404, -4.087792, 0.4823529, 1, 0, 1,
-0.650581, -1.622175, -4.18008, 0.4745098, 1, 0, 1,
-0.6479809, 1.483586, -0.2447547, 0.4705882, 1, 0, 1,
-0.646584, -2.004666, -1.493276, 0.4627451, 1, 0, 1,
-0.6462302, 2.070306, -0.133014, 0.4588235, 1, 0, 1,
-0.6456727, -0.177713, -3.486619, 0.4509804, 1, 0, 1,
-0.6441727, -0.5698684, -3.894222, 0.4470588, 1, 0, 1,
-0.6384577, 1.369169, -0.05068078, 0.4392157, 1, 0, 1,
-0.6368054, 0.2735038, -1.247784, 0.4352941, 1, 0, 1,
-0.6345216, 0.2538599, -3.544316, 0.427451, 1, 0, 1,
-0.6320803, -1.645663, -3.582089, 0.4235294, 1, 0, 1,
-0.625434, -1.468998, -1.652961, 0.4156863, 1, 0, 1,
-0.6252704, -1.021841, -1.880646, 0.4117647, 1, 0, 1,
-0.6231319, -1.139678, -1.915066, 0.4039216, 1, 0, 1,
-0.6177054, 3.80584, 0.1450254, 0.3960784, 1, 0, 1,
-0.6119826, -0.4806293, -3.610877, 0.3921569, 1, 0, 1,
-0.6082013, 0.6056583, 1.773253, 0.3843137, 1, 0, 1,
-0.6070416, -0.3564508, -3.164088, 0.3803922, 1, 0, 1,
-0.6020032, -0.7136701, -2.576002, 0.372549, 1, 0, 1,
-0.6011257, -0.7541934, -4.696945, 0.3686275, 1, 0, 1,
-0.6010294, -0.8705696, -1.439794, 0.3607843, 1, 0, 1,
-0.5999836, -0.7031394, -2.478532, 0.3568628, 1, 0, 1,
-0.5842326, -0.7315108, -1.542488, 0.3490196, 1, 0, 1,
-0.5838722, 0.3234091, -1.713487, 0.345098, 1, 0, 1,
-0.5811079, -0.418288, -0.8126353, 0.3372549, 1, 0, 1,
-0.5796669, -0.03676604, -2.037896, 0.3333333, 1, 0, 1,
-0.576549, 0.6862697, -0.363651, 0.3254902, 1, 0, 1,
-0.5764784, -1.45516, -3.47545, 0.3215686, 1, 0, 1,
-0.5657179, 0.4783737, -1.814457, 0.3137255, 1, 0, 1,
-0.5614648, -0.3507571, -1.354465, 0.3098039, 1, 0, 1,
-0.5585887, -0.7862103, -3.150148, 0.3019608, 1, 0, 1,
-0.557862, 1.329704, 0.09619997, 0.2941177, 1, 0, 1,
-0.5554382, 1.457713, -1.686247, 0.2901961, 1, 0, 1,
-0.544428, -0.9066266, -2.605471, 0.282353, 1, 0, 1,
-0.5425282, -1.384356, -4.182777, 0.2784314, 1, 0, 1,
-0.5413893, -0.7323231, -1.130533, 0.2705882, 1, 0, 1,
-0.5384715, 0.1017827, 0.1220268, 0.2666667, 1, 0, 1,
-0.5362084, 1.673449, -1.854204, 0.2588235, 1, 0, 1,
-0.5348765, 0.4466305, -0.05728161, 0.254902, 1, 0, 1,
-0.5302354, 0.08250514, -0.4128702, 0.2470588, 1, 0, 1,
-0.5276113, 1.104659, 1.308865, 0.2431373, 1, 0, 1,
-0.523459, 0.5650433, -1.19829, 0.2352941, 1, 0, 1,
-0.5185192, -0.4557016, -1.490769, 0.2313726, 1, 0, 1,
-0.5175385, -2.001783, -2.118145, 0.2235294, 1, 0, 1,
-0.5174832, 1.441288, -0.9603822, 0.2196078, 1, 0, 1,
-0.5058858, 0.479263, 0.4089637, 0.2117647, 1, 0, 1,
-0.5050537, 1.423563, -1.121691, 0.2078431, 1, 0, 1,
-0.4976649, -0.07532246, -0.4503217, 0.2, 1, 0, 1,
-0.4940923, 1.256807, 0.1599863, 0.1921569, 1, 0, 1,
-0.4923483, 0.890942, -1.674375, 0.1882353, 1, 0, 1,
-0.4921806, -0.07204856, -0.8481381, 0.1803922, 1, 0, 1,
-0.4888665, 2.263782, 0.6622186, 0.1764706, 1, 0, 1,
-0.4879625, 0.1315354, -1.12528, 0.1686275, 1, 0, 1,
-0.4875446, -2.9994, -0.9977467, 0.1647059, 1, 0, 1,
-0.4869232, 0.8396279, 0.1580567, 0.1568628, 1, 0, 1,
-0.4790829, 0.6435437, -1.102362, 0.1529412, 1, 0, 1,
-0.4786469, -1.353905, -1.31506, 0.145098, 1, 0, 1,
-0.4784096, -0.4531114, -2.758059, 0.1411765, 1, 0, 1,
-0.4773962, -0.6782427, -3.927884, 0.1333333, 1, 0, 1,
-0.4681943, 2.420294, 1.403667, 0.1294118, 1, 0, 1,
-0.4673957, -0.5769163, -2.388124, 0.1215686, 1, 0, 1,
-0.4665803, -0.1303995, -2.294974, 0.1176471, 1, 0, 1,
-0.4622991, -0.8669817, -1.326944, 0.1098039, 1, 0, 1,
-0.4615304, 0.2474883, -2.286285, 0.1058824, 1, 0, 1,
-0.4595496, -3.431386, -2.909238, 0.09803922, 1, 0, 1,
-0.4571612, 1.056392, -0.7995136, 0.09019608, 1, 0, 1,
-0.4499, -0.2876264, -2.698685, 0.08627451, 1, 0, 1,
-0.4471676, 0.6810213, -0.8906651, 0.07843138, 1, 0, 1,
-0.4446831, -0.6257027, -1.89535, 0.07450981, 1, 0, 1,
-0.442254, -1.06717, -3.283844, 0.06666667, 1, 0, 1,
-0.4385723, -0.2751513, -2.949971, 0.0627451, 1, 0, 1,
-0.4300064, 0.07960738, -1.070327, 0.05490196, 1, 0, 1,
-0.4272515, 0.3109921, -2.112283, 0.05098039, 1, 0, 1,
-0.4258021, -2.086719, -1.722544, 0.04313726, 1, 0, 1,
-0.4247753, -0.2612626, -1.651448, 0.03921569, 1, 0, 1,
-0.4230219, -0.1918715, -0.8042556, 0.03137255, 1, 0, 1,
-0.4209525, -1.263967, -2.733675, 0.02745098, 1, 0, 1,
-0.4173506, 0.8269111, -1.743268, 0.01960784, 1, 0, 1,
-0.4117526, 0.2172433, -0.6279334, 0.01568628, 1, 0, 1,
-0.4054471, -0.6233978, -1.009041, 0.007843138, 1, 0, 1,
-0.4049506, -0.879895, -2.951288, 0.003921569, 1, 0, 1,
-0.4010642, 1.141629, -0.004598918, 0, 1, 0.003921569, 1,
-0.4008853, -1.308191, -3.112388, 0, 1, 0.01176471, 1,
-0.3975487, 0.6545896, -1.111853, 0, 1, 0.01568628, 1,
-0.3968549, 1.254766, -1.503694, 0, 1, 0.02352941, 1,
-0.39469, 0.8121346, -0.2363727, 0, 1, 0.02745098, 1,
-0.3933104, -1.342898, -4.058241, 0, 1, 0.03529412, 1,
-0.3926949, 0.3221863, -1.064364, 0, 1, 0.03921569, 1,
-0.3916249, 0.7545192, 0.6308582, 0, 1, 0.04705882, 1,
-0.3870484, 1.366632, -1.327188, 0, 1, 0.05098039, 1,
-0.3864732, -0.3785437, -3.364319, 0, 1, 0.05882353, 1,
-0.3859928, -0.6854607, -3.470936, 0, 1, 0.0627451, 1,
-0.3858341, 0.9399924, -1.753572, 0, 1, 0.07058824, 1,
-0.3836179, 0.9357572, 1.711067, 0, 1, 0.07450981, 1,
-0.3819246, 1.051008, 1.195086, 0, 1, 0.08235294, 1,
-0.3811493, 0.1168459, -1.463264, 0, 1, 0.08627451, 1,
-0.3806115, 1.214414, 0.03914705, 0, 1, 0.09411765, 1,
-0.37663, -1.703118, -3.480465, 0, 1, 0.1019608, 1,
-0.3685611, -1.366115, -1.644789, 0, 1, 0.1058824, 1,
-0.367448, 0.1854612, -0.4294666, 0, 1, 0.1137255, 1,
-0.3642702, 1.507033, -0.2555213, 0, 1, 0.1176471, 1,
-0.3632185, 1.303837, 0.2001018, 0, 1, 0.1254902, 1,
-0.3628372, -1.451426, -3.972051, 0, 1, 0.1294118, 1,
-0.3616447, -0.5985323, 0.2986131, 0, 1, 0.1372549, 1,
-0.3581434, 0.8192429, 0.7602658, 0, 1, 0.1411765, 1,
-0.3578992, 1.158458, 0.4432922, 0, 1, 0.1490196, 1,
-0.3571051, 0.8362291, -1.777211, 0, 1, 0.1529412, 1,
-0.3545891, -1.400458, -4.646535, 0, 1, 0.1607843, 1,
-0.3544182, -0.858041, -1.860776, 0, 1, 0.1647059, 1,
-0.3534468, -0.7228395, -1.943442, 0, 1, 0.172549, 1,
-0.3515671, 1.575965, -0.6812883, 0, 1, 0.1764706, 1,
-0.3512311, 0.4015921, -0.8728547, 0, 1, 0.1843137, 1,
-0.347644, -0.03111614, -1.675943, 0, 1, 0.1882353, 1,
-0.3437565, -0.1713083, -3.465495, 0, 1, 0.1960784, 1,
-0.3400393, -1.122764, -2.883, 0, 1, 0.2039216, 1,
-0.3389116, -0.01944754, -1.254414, 0, 1, 0.2078431, 1,
-0.3373473, 1.033707, -0.4951698, 0, 1, 0.2156863, 1,
-0.3338205, 1.600875, -1.234714, 0, 1, 0.2196078, 1,
-0.3336712, 0.1027132, -1.79196, 0, 1, 0.227451, 1,
-0.3329256, 1.136363, 2.064008, 0, 1, 0.2313726, 1,
-0.3311075, -1.626318, -2.829096, 0, 1, 0.2392157, 1,
-0.3310064, 0.4784966, -2.245535, 0, 1, 0.2431373, 1,
-0.3248498, 2.385294, 2.259269, 0, 1, 0.2509804, 1,
-0.3244754, 0.7331943, 0.09439295, 0, 1, 0.254902, 1,
-0.3158265, 0.6624177, -1.822248, 0, 1, 0.2627451, 1,
-0.3111744, 0.2026333, -1.278428, 0, 1, 0.2666667, 1,
-0.3084206, -0.7277628, -3.486165, 0, 1, 0.2745098, 1,
-0.3074191, 0.1007049, -1.704861, 0, 1, 0.2784314, 1,
-0.3059479, -0.3791172, -3.114602, 0, 1, 0.2862745, 1,
-0.302087, 1.512264, 0.2872118, 0, 1, 0.2901961, 1,
-0.3007917, -1.401402, -1.861024, 0, 1, 0.2980392, 1,
-0.2930644, 0.1646392, -0.7019668, 0, 1, 0.3058824, 1,
-0.2920784, -0.01358618, -3.080574, 0, 1, 0.3098039, 1,
-0.2824582, -1.007424, -1.484539, 0, 1, 0.3176471, 1,
-0.2787416, 0.2659686, 0.2696038, 0, 1, 0.3215686, 1,
-0.2750863, 0.2175109, -1.347685, 0, 1, 0.3294118, 1,
-0.2733729, -0.5343875, -5.064685, 0, 1, 0.3333333, 1,
-0.2723421, -0.9455355, -4.033917, 0, 1, 0.3411765, 1,
-0.2708281, -0.6080101, -3.548187, 0, 1, 0.345098, 1,
-0.2662021, -1.622612, -2.480751, 0, 1, 0.3529412, 1,
-0.2649701, 1.210506, -0.6586543, 0, 1, 0.3568628, 1,
-0.2646897, 0.808903, 0.180829, 0, 1, 0.3647059, 1,
-0.2633089, -0.8185277, -4.249916, 0, 1, 0.3686275, 1,
-0.2622603, -1.29715, -2.394906, 0, 1, 0.3764706, 1,
-0.2611631, -1.927557, -2.725133, 0, 1, 0.3803922, 1,
-0.2557299, -1.200683, -2.329182, 0, 1, 0.3882353, 1,
-0.2556684, 1.9501, -2.181772, 0, 1, 0.3921569, 1,
-0.2517105, 0.1698359, -0.3453722, 0, 1, 0.4, 1,
-0.2504559, -1.147571, -0.293694, 0, 1, 0.4078431, 1,
-0.2499858, 0.1997792, -1.216629, 0, 1, 0.4117647, 1,
-0.2484865, -0.7061624, -3.203496, 0, 1, 0.4196078, 1,
-0.2417367, 0.6987867, -1.10616, 0, 1, 0.4235294, 1,
-0.2399021, -0.3228483, -2.723183, 0, 1, 0.4313726, 1,
-0.2368654, -0.7519652, -2.536796, 0, 1, 0.4352941, 1,
-0.2368598, -1.774207, -3.304831, 0, 1, 0.4431373, 1,
-0.2356654, -0.1124388, -1.454631, 0, 1, 0.4470588, 1,
-0.2347842, -1.460174, -3.48884, 0, 1, 0.454902, 1,
-0.2340984, -1.020718, -2.329122, 0, 1, 0.4588235, 1,
-0.2339068, 0.2292083, 1.60049, 0, 1, 0.4666667, 1,
-0.2286438, -1.709898, -3.382533, 0, 1, 0.4705882, 1,
-0.2278274, 2.690655, 1.279886, 0, 1, 0.4784314, 1,
-0.227012, 0.4637617, -1.702281, 0, 1, 0.4823529, 1,
-0.2228196, -0.2039689, -2.060746, 0, 1, 0.4901961, 1,
-0.2220665, -1.217017, -2.986549, 0, 1, 0.4941176, 1,
-0.220935, 0.9676638, -1.655426, 0, 1, 0.5019608, 1,
-0.2199833, 0.7733078, -0.8790208, 0, 1, 0.509804, 1,
-0.2104278, -0.05916459, -1.534977, 0, 1, 0.5137255, 1,
-0.2032913, -1.020658, -3.833302, 0, 1, 0.5215687, 1,
-0.1954232, 0.6855413, 0.5862534, 0, 1, 0.5254902, 1,
-0.1935799, 0.4247599, -0.6047148, 0, 1, 0.5333334, 1,
-0.1922102, 0.3691678, 0.9046376, 0, 1, 0.5372549, 1,
-0.1915413, 0.5564878, -0.4504449, 0, 1, 0.5450981, 1,
-0.1892196, 0.4233862, -0.2172862, 0, 1, 0.5490196, 1,
-0.1796002, 0.4357526, -0.8030413, 0, 1, 0.5568628, 1,
-0.1795627, -0.8135795, -2.686551, 0, 1, 0.5607843, 1,
-0.177452, -1.130606, -4.404763, 0, 1, 0.5686275, 1,
-0.1760058, -1.162208, -2.843112, 0, 1, 0.572549, 1,
-0.1722973, 1.19194, 0.6802911, 0, 1, 0.5803922, 1,
-0.1684922, 0.04396187, -1.238369, 0, 1, 0.5843138, 1,
-0.1679496, 0.3009161, -0.6772599, 0, 1, 0.5921569, 1,
-0.1630243, 0.9864021, -0.5573955, 0, 1, 0.5960785, 1,
-0.1587939, 0.8897021, 2.006177, 0, 1, 0.6039216, 1,
-0.1579362, -0.5765299, -2.439609, 0, 1, 0.6117647, 1,
-0.1572307, -1.252379, -2.705117, 0, 1, 0.6156863, 1,
-0.1563425, 1.644643, -0.3687735, 0, 1, 0.6235294, 1,
-0.1551672, -1.459203, -4.468612, 0, 1, 0.627451, 1,
-0.1540529, 0.2198659, -0.07071873, 0, 1, 0.6352941, 1,
-0.1511217, 0.8276259, 0.5278409, 0, 1, 0.6392157, 1,
-0.1506827, 1.280665, -0.1157753, 0, 1, 0.6470588, 1,
-0.1490187, 0.8614089, 1.713895, 0, 1, 0.6509804, 1,
-0.1462992, -1.571712, -3.210461, 0, 1, 0.6588235, 1,
-0.1458013, -0.711015, -3.21187, 0, 1, 0.6627451, 1,
-0.1400688, 0.5423477, -0.02950008, 0, 1, 0.6705883, 1,
-0.1357261, 1.357483, 1.151461, 0, 1, 0.6745098, 1,
-0.1352566, -1.440916, -3.630076, 0, 1, 0.682353, 1,
-0.1340929, 0.1022627, -1.250916, 0, 1, 0.6862745, 1,
-0.133377, -0.6508963, -2.867245, 0, 1, 0.6941177, 1,
-0.1316842, -0.6465014, -3.334466, 0, 1, 0.7019608, 1,
-0.1283693, 1.144821, -0.1260165, 0, 1, 0.7058824, 1,
-0.1260938, 0.3749119, 0.5269951, 0, 1, 0.7137255, 1,
-0.1247969, -0.3375208, -2.326663, 0, 1, 0.7176471, 1,
-0.1244706, 0.7493865, -1.364954, 0, 1, 0.7254902, 1,
-0.1204147, -0.08083219, -2.963644, 0, 1, 0.7294118, 1,
-0.1162684, 0.6292382, -0.9457679, 0, 1, 0.7372549, 1,
-0.1159394, 1.113659, -0.8202633, 0, 1, 0.7411765, 1,
-0.115929, -0.7432115, -3.265056, 0, 1, 0.7490196, 1,
-0.1136529, -1.577755, -2.511031, 0, 1, 0.7529412, 1,
-0.113326, 2.650761, -0.5512452, 0, 1, 0.7607843, 1,
-0.1131412, 1.056453, 0.6338027, 0, 1, 0.7647059, 1,
-0.1112558, 2.302869, -0.4513142, 0, 1, 0.772549, 1,
-0.109591, 0.7936698, 1.128097, 0, 1, 0.7764706, 1,
-0.1075599, 0.2978267, 1.159564, 0, 1, 0.7843137, 1,
-0.106323, 1.572752, 0.514137, 0, 1, 0.7882353, 1,
-0.1048191, -0.5552132, -3.570812, 0, 1, 0.7960784, 1,
-0.103077, -0.6185476, -1.622294, 0, 1, 0.8039216, 1,
-0.1028866, -0.4303808, -1.193394, 0, 1, 0.8078431, 1,
-0.1012322, 1.333585, -1.06133, 0, 1, 0.8156863, 1,
-0.09565528, -0.2358242, -2.628878, 0, 1, 0.8196079, 1,
-0.0941746, 0.8439708, 0.8559754, 0, 1, 0.827451, 1,
-0.09342647, 0.2140572, -1.550233, 0, 1, 0.8313726, 1,
-0.0931742, 1.51133, 0.8281487, 0, 1, 0.8392157, 1,
-0.0893596, 1.345862, -0.6437928, 0, 1, 0.8431373, 1,
-0.08294672, 0.2290924, 0.2160448, 0, 1, 0.8509804, 1,
-0.08247133, 0.6166737, -1.262743, 0, 1, 0.854902, 1,
-0.08140612, 1.074999, -0.3100208, 0, 1, 0.8627451, 1,
-0.07659752, 0.4534663, -1.095283, 0, 1, 0.8666667, 1,
-0.07648879, -0.05021723, -1.724235, 0, 1, 0.8745098, 1,
-0.06259581, -0.8504858, -2.71132, 0, 1, 0.8784314, 1,
-0.06135539, -0.5639282, -1.771809, 0, 1, 0.8862745, 1,
-0.06078414, 0.5179614, 0.1924285, 0, 1, 0.8901961, 1,
-0.05879409, 0.4191255, -1.018027, 0, 1, 0.8980392, 1,
-0.05803031, -0.2464056, -3.237232, 0, 1, 0.9058824, 1,
-0.05703507, -0.9753334, -1.323, 0, 1, 0.9098039, 1,
-0.05228, -1.450139, -1.956187, 0, 1, 0.9176471, 1,
-0.04988424, -0.4179181, -3.334187, 0, 1, 0.9215686, 1,
-0.04987186, 1.535738, -0.2582861, 0, 1, 0.9294118, 1,
-0.04782451, 1.632558, 0.01904013, 0, 1, 0.9333333, 1,
-0.04476993, 1.34538, 0.8637648, 0, 1, 0.9411765, 1,
-0.0364217, 0.09993639, 0.3450853, 0, 1, 0.945098, 1,
-0.03514029, 1.186435, 1.059333, 0, 1, 0.9529412, 1,
-0.03253883, 1.966747, -0.1801999, 0, 1, 0.9568627, 1,
-0.03095996, -0.03484034, 0.8069351, 0, 1, 0.9647059, 1,
-0.02626778, 2.059752, -1.319375, 0, 1, 0.9686275, 1,
-0.02523116, 1.649024, -1.029232, 0, 1, 0.9764706, 1,
-0.02387634, 0.9373702, 0.1934221, 0, 1, 0.9803922, 1,
-0.02151212, -0.2195583, -1.857695, 0, 1, 0.9882353, 1,
-0.01632969, -0.9258527, -3.03041, 0, 1, 0.9921569, 1,
-0.0131581, 0.611562, 1.396141, 0, 1, 1, 1,
-0.002509464, 1.385722, -0.2926711, 0, 0.9921569, 1, 1,
0.000733941, -1.968133, 4.095169, 0, 0.9882353, 1, 1,
0.001274731, 0.1098955, 1.677751, 0, 0.9803922, 1, 1,
0.01013881, -0.05960711, 3.341922, 0, 0.9764706, 1, 1,
0.01135997, -0.6231896, 1.9028, 0, 0.9686275, 1, 1,
0.01268978, 0.2726136, 0.2183914, 0, 0.9647059, 1, 1,
0.02473321, -0.5858929, 2.159873, 0, 0.9568627, 1, 1,
0.02640106, -0.8487162, 3.067891, 0, 0.9529412, 1, 1,
0.02667619, -0.4983325, 2.661587, 0, 0.945098, 1, 1,
0.03532941, -0.893108, 1.774655, 0, 0.9411765, 1, 1,
0.03960573, 0.04745422, 0.6395918, 0, 0.9333333, 1, 1,
0.04110102, -0.5106207, 2.398304, 0, 0.9294118, 1, 1,
0.04132862, 1.272031, 0.4394355, 0, 0.9215686, 1, 1,
0.04200458, 1.152167, 0.2124983, 0, 0.9176471, 1, 1,
0.04696199, -0.9963539, 3.423986, 0, 0.9098039, 1, 1,
0.04868457, -1.789524, 3.561305, 0, 0.9058824, 1, 1,
0.05125507, -0.2630907, 2.281735, 0, 0.8980392, 1, 1,
0.05533625, -1.700282, 2.672367, 0, 0.8901961, 1, 1,
0.05736148, -0.5066916, 3.868106, 0, 0.8862745, 1, 1,
0.05802655, -1.959309, 4.561089, 0, 0.8784314, 1, 1,
0.05889798, -0.2576447, 1.847805, 0, 0.8745098, 1, 1,
0.05951715, 0.6854536, -0.05486364, 0, 0.8666667, 1, 1,
0.06609796, -0.7224364, 3.173022, 0, 0.8627451, 1, 1,
0.06846192, -0.9936321, 4.00376, 0, 0.854902, 1, 1,
0.06949785, 0.06971764, 1.232279, 0, 0.8509804, 1, 1,
0.07383081, -0.5179637, 4.79331, 0, 0.8431373, 1, 1,
0.07433507, -0.5303974, 2.810057, 0, 0.8392157, 1, 1,
0.07504051, 0.4407558, 0.4350797, 0, 0.8313726, 1, 1,
0.07635377, -0.4728276, 4.620487, 0, 0.827451, 1, 1,
0.07984019, -0.2150975, 1.384905, 0, 0.8196079, 1, 1,
0.09261524, 0.7877149, -1.909837, 0, 0.8156863, 1, 1,
0.092741, -0.1838428, 1.987616, 0, 0.8078431, 1, 1,
0.09525675, 0.09838169, 2.337237, 0, 0.8039216, 1, 1,
0.09599067, 0.3346538, -1.012477, 0, 0.7960784, 1, 1,
0.09771141, 0.6496277, -0.0008929244, 0, 0.7882353, 1, 1,
0.1003067, 0.7190787, -0.5482092, 0, 0.7843137, 1, 1,
0.1082114, -0.08680195, 2.535268, 0, 0.7764706, 1, 1,
0.109847, -0.1589124, 3.785337, 0, 0.772549, 1, 1,
0.1123039, -0.7466053, 2.180529, 0, 0.7647059, 1, 1,
0.1144562, -0.7753167, 2.80442, 0, 0.7607843, 1, 1,
0.1159764, 2.110213, -2.438388, 0, 0.7529412, 1, 1,
0.1194832, -0.2659186, 4.30027, 0, 0.7490196, 1, 1,
0.1213482, 0.1382149, 2.098515, 0, 0.7411765, 1, 1,
0.126497, -1.042371, 4.379591, 0, 0.7372549, 1, 1,
0.1272554, 0.6193909, -0.413825, 0, 0.7294118, 1, 1,
0.1305711, -0.3101568, 3.931529, 0, 0.7254902, 1, 1,
0.1306325, 0.5990945, 1.500083, 0, 0.7176471, 1, 1,
0.1330727, 0.02403257, 3.307134, 0, 0.7137255, 1, 1,
0.1332349, -1.594366, 3.820243, 0, 0.7058824, 1, 1,
0.1358995, 1.627674, 1.720016, 0, 0.6980392, 1, 1,
0.1393507, 0.5774443, 0.1718326, 0, 0.6941177, 1, 1,
0.1431521, 1.057874, 0.9971604, 0, 0.6862745, 1, 1,
0.1460752, -1.369392, 2.142702, 0, 0.682353, 1, 1,
0.1461901, 0.1387928, 0.3254084, 0, 0.6745098, 1, 1,
0.1471105, -0.8993808, 2.638331, 0, 0.6705883, 1, 1,
0.1557226, -0.1217951, 0.6522207, 0, 0.6627451, 1, 1,
0.161293, -1.651224, 4.0984, 0, 0.6588235, 1, 1,
0.1650102, 1.252537, 0.1887269, 0, 0.6509804, 1, 1,
0.1652657, 0.9776335, -0.9406154, 0, 0.6470588, 1, 1,
0.1681796, 0.2216618, 1.323358, 0, 0.6392157, 1, 1,
0.1701718, -0.2010813, 1.291752, 0, 0.6352941, 1, 1,
0.1728057, -1.272509, 2.598973, 0, 0.627451, 1, 1,
0.1813135, 0.1783399, 2.310565, 0, 0.6235294, 1, 1,
0.1840923, 0.5950921, -0.6524665, 0, 0.6156863, 1, 1,
0.1869667, 0.3916307, 1.05019, 0, 0.6117647, 1, 1,
0.188922, 0.4768662, 0.6616178, 0, 0.6039216, 1, 1,
0.1899465, -0.846476, 1.742098, 0, 0.5960785, 1, 1,
0.1973545, 1.120235, 1.853871, 0, 0.5921569, 1, 1,
0.199399, 0.424159, -0.9293386, 0, 0.5843138, 1, 1,
0.2039124, 0.6515335, 0.224256, 0, 0.5803922, 1, 1,
0.2065988, 0.4337456, 0.3112342, 0, 0.572549, 1, 1,
0.2109134, -0.5764074, 2.743922, 0, 0.5686275, 1, 1,
0.211702, -1.690221, 1.950472, 0, 0.5607843, 1, 1,
0.2134289, -0.04630022, 1.108611, 0, 0.5568628, 1, 1,
0.2201843, -0.4260167, 2.281265, 0, 0.5490196, 1, 1,
0.2221317, -0.3587289, 5.151411, 0, 0.5450981, 1, 1,
0.2245288, -0.9625018, 3.568011, 0, 0.5372549, 1, 1,
0.2260489, 0.9188761, 1.474303, 0, 0.5333334, 1, 1,
0.2278381, 0.09037582, 1.714133, 0, 0.5254902, 1, 1,
0.2323937, 0.1221817, 2.851432, 0, 0.5215687, 1, 1,
0.2334321, -0.1067567, 0.82341, 0, 0.5137255, 1, 1,
0.2393797, 0.3016441, 0.9312735, 0, 0.509804, 1, 1,
0.2402972, 1.626813, 1.973824, 0, 0.5019608, 1, 1,
0.2456513, 0.02786331, 2.783981, 0, 0.4941176, 1, 1,
0.2484689, -1.202255, 2.817867, 0, 0.4901961, 1, 1,
0.2532158, -0.3858055, 3.698014, 0, 0.4823529, 1, 1,
0.2586042, 0.8908391, -0.5032746, 0, 0.4784314, 1, 1,
0.2609818, 0.4740872, 1.950505, 0, 0.4705882, 1, 1,
0.2633924, -0.158228, 1.445611, 0, 0.4666667, 1, 1,
0.2644524, 0.319003, 1.25645, 0, 0.4588235, 1, 1,
0.265866, -0.7604424, 2.76726, 0, 0.454902, 1, 1,
0.2675602, -0.1294622, 1.981959, 0, 0.4470588, 1, 1,
0.2726269, -0.8548161, 1.469768, 0, 0.4431373, 1, 1,
0.2743277, 1.277278, -0.5200536, 0, 0.4352941, 1, 1,
0.2826719, 0.4124558, -1.684024, 0, 0.4313726, 1, 1,
0.2849103, -0.01358422, 2.229414, 0, 0.4235294, 1, 1,
0.2895812, -0.2340069, 1.924213, 0, 0.4196078, 1, 1,
0.2899211, 0.859062, 0.4572151, 0, 0.4117647, 1, 1,
0.2931243, 0.3699089, 1.783709, 0, 0.4078431, 1, 1,
0.2940274, -0.4335091, 1.380195, 0, 0.4, 1, 1,
0.2994875, 1.227916, 2.683625, 0, 0.3921569, 1, 1,
0.3011238, -1.043665, 3.652757, 0, 0.3882353, 1, 1,
0.3107476, -1.009187, 1.12393, 0, 0.3803922, 1, 1,
0.3114547, -1.128798, 1.734333, 0, 0.3764706, 1, 1,
0.3115363, -0.2396687, 2.906757, 0, 0.3686275, 1, 1,
0.3122257, 0.2005277, 3.15665, 0, 0.3647059, 1, 1,
0.3123909, -0.8338418, 1.976169, 0, 0.3568628, 1, 1,
0.3157135, 0.2532611, -1.770818, 0, 0.3529412, 1, 1,
0.3159024, 0.1780423, 0.4142668, 0, 0.345098, 1, 1,
0.3195548, 1.356729, -0.8951082, 0, 0.3411765, 1, 1,
0.3213791, 1.214323, 1.912239, 0, 0.3333333, 1, 1,
0.3290266, 0.6801261, -0.289153, 0, 0.3294118, 1, 1,
0.3329992, -0.6046106, 2.375641, 0, 0.3215686, 1, 1,
0.3356668, -0.1083113, -0.6747237, 0, 0.3176471, 1, 1,
0.336859, -0.8358179, 2.170181, 0, 0.3098039, 1, 1,
0.342378, -0.7568351, 3.055495, 0, 0.3058824, 1, 1,
0.3441214, -1.108791, 3.354927, 0, 0.2980392, 1, 1,
0.3450995, 1.655191, -1.0069, 0, 0.2901961, 1, 1,
0.3491736, 0.1891781, 0.4525475, 0, 0.2862745, 1, 1,
0.3496756, 1.185477, 0.4795158, 0, 0.2784314, 1, 1,
0.3539613, 1.58277, 0.03300153, 0, 0.2745098, 1, 1,
0.354197, -1.526329, 3.403336, 0, 0.2666667, 1, 1,
0.3556224, -0.9603431, 1.534842, 0, 0.2627451, 1, 1,
0.3562847, -0.2759973, 1.88509, 0, 0.254902, 1, 1,
0.356848, -0.1289907, 2.494473, 0, 0.2509804, 1, 1,
0.3575071, -1.671381, 2.565263, 0, 0.2431373, 1, 1,
0.3581163, 0.9140813, -0.7460312, 0, 0.2392157, 1, 1,
0.3595603, 0.4888064, 1.152913, 0, 0.2313726, 1, 1,
0.3620216, 0.0208054, 1.864421, 0, 0.227451, 1, 1,
0.3630091, 1.180905, -0.3188876, 0, 0.2196078, 1, 1,
0.3630172, 2.06166, -1.096666, 0, 0.2156863, 1, 1,
0.3680584, -0.05097035, 1.674976, 0, 0.2078431, 1, 1,
0.3705933, -1.458567, 3.569242, 0, 0.2039216, 1, 1,
0.3733231, -0.7557079, 3.716044, 0, 0.1960784, 1, 1,
0.3745384, 0.6247183, -1.354082, 0, 0.1882353, 1, 1,
0.3750202, -0.1544832, 1.6097, 0, 0.1843137, 1, 1,
0.375324, -0.6201966, 1.436907, 0, 0.1764706, 1, 1,
0.3767888, -0.09788983, 1.615218, 0, 0.172549, 1, 1,
0.3772908, -0.8447343, 2.613112, 0, 0.1647059, 1, 1,
0.3786707, -0.2665105, 1.068785, 0, 0.1607843, 1, 1,
0.3805399, 1.109041, 0.1700115, 0, 0.1529412, 1, 1,
0.380551, 0.1673558, 0.9942309, 0, 0.1490196, 1, 1,
0.3830948, -0.212885, 1.511299, 0, 0.1411765, 1, 1,
0.388817, -0.3472954, 3.405032, 0, 0.1372549, 1, 1,
0.3913102, 1.065647, 1.913183, 0, 0.1294118, 1, 1,
0.3914072, 1.739423, 1.239263, 0, 0.1254902, 1, 1,
0.3920987, -0.9032299, 3.0065, 0, 0.1176471, 1, 1,
0.3984869, -1.055338, 3.407299, 0, 0.1137255, 1, 1,
0.4028067, 0.3986058, 1.102763, 0, 0.1058824, 1, 1,
0.4050634, -0.8525733, 1.516753, 0, 0.09803922, 1, 1,
0.4080216, 0.7650772, 0.436738, 0, 0.09411765, 1, 1,
0.4098313, -0.1791344, 1.646609, 0, 0.08627451, 1, 1,
0.417502, 0.2465725, 1.454476, 0, 0.08235294, 1, 1,
0.4216866, -0.3798541, 0.8249705, 0, 0.07450981, 1, 1,
0.4289333, 0.1203029, 2.15307, 0, 0.07058824, 1, 1,
0.4300671, 0.4948858, 1.941402, 0, 0.0627451, 1, 1,
0.4329859, 0.8342317, 2.611787, 0, 0.05882353, 1, 1,
0.4332292, -0.2403314, 1.784575, 0, 0.05098039, 1, 1,
0.434109, 0.603923, -0.3819817, 0, 0.04705882, 1, 1,
0.4392302, -1.369628, -0.2054781, 0, 0.03921569, 1, 1,
0.4401657, -0.1726179, 0.4188366, 0, 0.03529412, 1, 1,
0.4403998, -0.4218118, 0.4553261, 0, 0.02745098, 1, 1,
0.4404085, 0.3438662, 1.132397, 0, 0.02352941, 1, 1,
0.445939, -1.765399, 2.736928, 0, 0.01568628, 1, 1,
0.4519261, 1.157291, -0.4097922, 0, 0.01176471, 1, 1,
0.453376, -0.8785748, 1.90568, 0, 0.003921569, 1, 1,
0.4540401, 0.1727407, -0.4157628, 0.003921569, 0, 1, 1,
0.4573523, -1.97273, 2.008721, 0.007843138, 0, 1, 1,
0.4573534, -0.5846345, 1.284235, 0.01568628, 0, 1, 1,
0.4581689, -0.24112, 1.036901, 0.01960784, 0, 1, 1,
0.4609278, 0.8578126, 0.2747413, 0.02745098, 0, 1, 1,
0.4614364, -1.826548, 2.300157, 0.03137255, 0, 1, 1,
0.4615214, 0.2945327, -0.09986113, 0.03921569, 0, 1, 1,
0.4678794, 1.374303, 1.320672, 0.04313726, 0, 1, 1,
0.4689856, 0.1043798, -1.165295, 0.05098039, 0, 1, 1,
0.4738964, -0.7564995, 2.885149, 0.05490196, 0, 1, 1,
0.4796032, 0.8489903, 1.575838, 0.0627451, 0, 1, 1,
0.4815378, 0.09494799, 0.8952929, 0.06666667, 0, 1, 1,
0.4853821, 0.1648235, 1.857879, 0.07450981, 0, 1, 1,
0.4863387, -0.5663773, 3.098574, 0.07843138, 0, 1, 1,
0.4894214, -0.8155566, 3.115568, 0.08627451, 0, 1, 1,
0.4902087, -0.7376593, 2.535352, 0.09019608, 0, 1, 1,
0.4932255, -0.2362376, 1.647788, 0.09803922, 0, 1, 1,
0.4933193, 0.8801376, -1.05937, 0.1058824, 0, 1, 1,
0.4970675, -1.143036, 2.9329, 0.1098039, 0, 1, 1,
0.5031452, -0.8221352, 0.964464, 0.1176471, 0, 1, 1,
0.5061725, 1.343273, 0.8941357, 0.1215686, 0, 1, 1,
0.508009, 0.2264238, 0.2961095, 0.1294118, 0, 1, 1,
0.5151618, -0.132978, 0.8871692, 0.1333333, 0, 1, 1,
0.5170773, -0.3634484, 2.929946, 0.1411765, 0, 1, 1,
0.5195568, 0.2119055, 1.67524, 0.145098, 0, 1, 1,
0.5244076, -1.235719, 2.713046, 0.1529412, 0, 1, 1,
0.5250792, -0.4446525, 2.421715, 0.1568628, 0, 1, 1,
0.5256293, -0.7809022, 1.204244, 0.1647059, 0, 1, 1,
0.5268148, -0.6701421, 0.8818985, 0.1686275, 0, 1, 1,
0.5289149, 1.894364, 0.3792338, 0.1764706, 0, 1, 1,
0.5313811, 0.7447135, 1.287782, 0.1803922, 0, 1, 1,
0.5314411, -2.045001, 2.493302, 0.1882353, 0, 1, 1,
0.5356781, 1.090342, -1.856354, 0.1921569, 0, 1, 1,
0.5368649, -0.608287, 2.460969, 0.2, 0, 1, 1,
0.5374524, 1.135352, 0.3776775, 0.2078431, 0, 1, 1,
0.5382578, -1.153911, 3.204368, 0.2117647, 0, 1, 1,
0.5432571, 1.631492, 0.8850905, 0.2196078, 0, 1, 1,
0.543845, -0.9400122, 2.739609, 0.2235294, 0, 1, 1,
0.5445834, 0.3349195, 0.8232779, 0.2313726, 0, 1, 1,
0.5446829, -0.9914978, 1.977135, 0.2352941, 0, 1, 1,
0.5471032, 1.240145, 0.2196521, 0.2431373, 0, 1, 1,
0.5525398, 0.4775927, 0.501251, 0.2470588, 0, 1, 1,
0.5529781, -0.5697927, 2.63427, 0.254902, 0, 1, 1,
0.557356, -0.08450273, 3.326227, 0.2588235, 0, 1, 1,
0.5612022, -0.8811895, 1.100641, 0.2666667, 0, 1, 1,
0.5653133, -0.03473233, 1.169059, 0.2705882, 0, 1, 1,
0.5722253, -1.446631, 3.729141, 0.2784314, 0, 1, 1,
0.5778493, 0.4848754, 0.6278865, 0.282353, 0, 1, 1,
0.5781136, -0.556349, 3.401229, 0.2901961, 0, 1, 1,
0.5828295, 0.5539467, -0.1836955, 0.2941177, 0, 1, 1,
0.5849494, -0.7338389, 2.885296, 0.3019608, 0, 1, 1,
0.5853538, -0.3897277, 2.420745, 0.3098039, 0, 1, 1,
0.5857872, 0.1594659, 0.712484, 0.3137255, 0, 1, 1,
0.5865412, -0.2716984, 2.206423, 0.3215686, 0, 1, 1,
0.5872006, -0.1513942, 0.9984122, 0.3254902, 0, 1, 1,
0.5917537, -0.2821006, 1.819675, 0.3333333, 0, 1, 1,
0.5917638, -1.175568, 2.800091, 0.3372549, 0, 1, 1,
0.5938061, 1.630852, 1.704383, 0.345098, 0, 1, 1,
0.594048, 0.05897985, 2.199376, 0.3490196, 0, 1, 1,
0.594081, 0.2637941, -0.2873393, 0.3568628, 0, 1, 1,
0.5961301, -1.238322, 2.729614, 0.3607843, 0, 1, 1,
0.5987475, 2.291043, 0.940719, 0.3686275, 0, 1, 1,
0.609427, -0.6773934, 2.886862, 0.372549, 0, 1, 1,
0.6175548, 0.3698227, 1.00323, 0.3803922, 0, 1, 1,
0.6177762, 0.9225923, 0.5828885, 0.3843137, 0, 1, 1,
0.624023, 0.05654912, 1.026906, 0.3921569, 0, 1, 1,
0.6244788, -0.3204146, 3.524416, 0.3960784, 0, 1, 1,
0.6271842, -0.8901932, 3.620571, 0.4039216, 0, 1, 1,
0.634383, -0.5248035, 2.809183, 0.4117647, 0, 1, 1,
0.6365781, 0.06395732, 0.1166089, 0.4156863, 0, 1, 1,
0.6372524, -0.6099734, 3.055481, 0.4235294, 0, 1, 1,
0.6411842, 1.346149, 1.246432, 0.427451, 0, 1, 1,
0.6434596, -0.0356039, 2.582488, 0.4352941, 0, 1, 1,
0.6447496, 1.220543, -1.382182, 0.4392157, 0, 1, 1,
0.649619, -0.992514, 3.114815, 0.4470588, 0, 1, 1,
0.6538379, -0.4676553, 4.48308, 0.4509804, 0, 1, 1,
0.6567947, 0.411767, 1.404652, 0.4588235, 0, 1, 1,
0.6598731, 0.8479009, 0.1322539, 0.4627451, 0, 1, 1,
0.6611261, 1.274026, 1.070265, 0.4705882, 0, 1, 1,
0.6638309, -0.5758576, 4.192438, 0.4745098, 0, 1, 1,
0.6648741, -0.358859, 0.3176773, 0.4823529, 0, 1, 1,
0.6648914, -0.04234534, 2.83897, 0.4862745, 0, 1, 1,
0.6688699, -0.09674221, 1.217825, 0.4941176, 0, 1, 1,
0.669538, 0.8894903, 1.939092, 0.5019608, 0, 1, 1,
0.6710261, 0.644474, 0.6195408, 0.5058824, 0, 1, 1,
0.6778814, 0.3237821, -0.1073497, 0.5137255, 0, 1, 1,
0.6791637, -0.5747919, 3.766431, 0.5176471, 0, 1, 1,
0.6817553, -0.5810541, 3.120332, 0.5254902, 0, 1, 1,
0.6828314, -0.7544641, 0.9945307, 0.5294118, 0, 1, 1,
0.6917779, 1.328968, 1.758319, 0.5372549, 0, 1, 1,
0.6926836, -0.7404703, 1.535617, 0.5411765, 0, 1, 1,
0.6932008, -1.354942, 0.587247, 0.5490196, 0, 1, 1,
0.6959711, 1.486035, -0.5194851, 0.5529412, 0, 1, 1,
0.7040346, 1.720668, 0.01755803, 0.5607843, 0, 1, 1,
0.7083197, 1.462393, 0.424302, 0.5647059, 0, 1, 1,
0.7321723, -0.1038745, 1.884146, 0.572549, 0, 1, 1,
0.7331234, -0.7596132, 0.8652508, 0.5764706, 0, 1, 1,
0.7362505, 0.5250658, 2.181846, 0.5843138, 0, 1, 1,
0.7393074, 0.4492265, 2.805678, 0.5882353, 0, 1, 1,
0.7394628, -0.009961024, 1.72798, 0.5960785, 0, 1, 1,
0.7435777, -0.5043396, 1.174691, 0.6039216, 0, 1, 1,
0.7466709, -0.08914641, 2.976306, 0.6078432, 0, 1, 1,
0.747632, -0.270452, 3.434828, 0.6156863, 0, 1, 1,
0.7557387, 0.1679699, 1.205635, 0.6196079, 0, 1, 1,
0.7600905, -0.3064356, 1.042602, 0.627451, 0, 1, 1,
0.7649691, 0.1383327, 1.415686, 0.6313726, 0, 1, 1,
0.7698872, 1.767968, 1.366076, 0.6392157, 0, 1, 1,
0.7702059, 0.15819, 1.114521, 0.6431373, 0, 1, 1,
0.7782369, 0.246794, 1.570654, 0.6509804, 0, 1, 1,
0.7885622, -2.29225, 4.569604, 0.654902, 0, 1, 1,
0.7901786, 1.466121, 0.02580564, 0.6627451, 0, 1, 1,
0.7923391, -0.741133, 1.674698, 0.6666667, 0, 1, 1,
0.7929112, 1.895333, -0.4050559, 0.6745098, 0, 1, 1,
0.8008351, -0.0567813, 0.4157274, 0.6784314, 0, 1, 1,
0.803107, 0.9989156, -0.4766553, 0.6862745, 0, 1, 1,
0.8058294, 0.00253881, -0.2682469, 0.6901961, 0, 1, 1,
0.8169722, 0.9372846, -0.3033604, 0.6980392, 0, 1, 1,
0.8170297, 0.2318393, 2.318837, 0.7058824, 0, 1, 1,
0.8244707, -1.20442, 2.655357, 0.7098039, 0, 1, 1,
0.830204, 1.76874, 0.09256696, 0.7176471, 0, 1, 1,
0.8334444, -1.086615, 4.297472, 0.7215686, 0, 1, 1,
0.8377594, -0.3195724, 1.376692, 0.7294118, 0, 1, 1,
0.8439877, -1.763734, 5.935441, 0.7333333, 0, 1, 1,
0.8448199, -1.747849, 2.188895, 0.7411765, 0, 1, 1,
0.8505143, -0.7139205, 2.273057, 0.7450981, 0, 1, 1,
0.851937, 0.4563619, 1.082734, 0.7529412, 0, 1, 1,
0.8548569, -0.05271871, 1.511818, 0.7568628, 0, 1, 1,
0.8557596, 0.9553307, 0.01870683, 0.7647059, 0, 1, 1,
0.8570601, -0.3099132, 2.270538, 0.7686275, 0, 1, 1,
0.8576624, -0.3995147, 1.556268, 0.7764706, 0, 1, 1,
0.8578634, 0.2779145, 1.66558, 0.7803922, 0, 1, 1,
0.8580015, -0.3113454, 2.664208, 0.7882353, 0, 1, 1,
0.8630614, -0.3107586, 3.97296, 0.7921569, 0, 1, 1,
0.8663958, 0.2066041, -1.040896, 0.8, 0, 1, 1,
0.8709871, 1.142564, 1.493163, 0.8078431, 0, 1, 1,
0.8723754, -0.1300465, 0.5128461, 0.8117647, 0, 1, 1,
0.8735151, 0.04418621, 1.970995, 0.8196079, 0, 1, 1,
0.876804, 0.5070416, 2.360931, 0.8235294, 0, 1, 1,
0.8772271, 0.4430763, 0.228119, 0.8313726, 0, 1, 1,
0.8838223, -0.7833236, 3.901394, 0.8352941, 0, 1, 1,
0.8862634, 1.112801, 0.7847119, 0.8431373, 0, 1, 1,
0.8877192, -0.4809176, 1.44457, 0.8470588, 0, 1, 1,
0.8940518, -1.453315, 2.428241, 0.854902, 0, 1, 1,
0.8949379, 0.7498531, 1.067185, 0.8588235, 0, 1, 1,
0.8983406, 0.1137153, 1.176811, 0.8666667, 0, 1, 1,
0.9096452, 0.5998397, -0.1769177, 0.8705882, 0, 1, 1,
0.9107779, -0.3101195, 2.269583, 0.8784314, 0, 1, 1,
0.9119511, -0.202694, 0.8560544, 0.8823529, 0, 1, 1,
0.9182573, 0.01319395, 0.7943226, 0.8901961, 0, 1, 1,
0.9246771, 1.131879, 0.6687044, 0.8941177, 0, 1, 1,
0.9252634, 1.072622, 0.3816743, 0.9019608, 0, 1, 1,
0.931648, -0.713844, 2.449012, 0.9098039, 0, 1, 1,
0.942013, 1.645865, -0.2216939, 0.9137255, 0, 1, 1,
0.944017, 0.6002014, 2.46377, 0.9215686, 0, 1, 1,
0.9465219, -0.905163, 2.89974, 0.9254902, 0, 1, 1,
0.9518229, -0.9029405, 3.697627, 0.9333333, 0, 1, 1,
0.9519926, -0.416554, 1.85767, 0.9372549, 0, 1, 1,
0.9537378, 2.374186, 0.60713, 0.945098, 0, 1, 1,
0.9543894, -0.5561731, 3.005712, 0.9490196, 0, 1, 1,
0.9604052, -1.955424, 3.719409, 0.9568627, 0, 1, 1,
0.9613854, -0.6134342, 2.142125, 0.9607843, 0, 1, 1,
0.9664685, -2.10162, 3.282476, 0.9686275, 0, 1, 1,
0.9720876, -0.003529506, 1.222109, 0.972549, 0, 1, 1,
0.9721566, -0.2840852, 1.373506, 0.9803922, 0, 1, 1,
0.977577, -0.6645065, 0.0961784, 0.9843137, 0, 1, 1,
0.9777782, -0.9939849, 0.9584579, 0.9921569, 0, 1, 1,
0.9863212, 0.05776091, 1.067207, 0.9960784, 0, 1, 1,
1.000874, -0.5204006, 0.2786876, 1, 0, 0.9960784, 1,
1.00237, -0.02764744, 2.96447, 1, 0, 0.9882353, 1,
1.003207, -0.4031579, 0.3937927, 1, 0, 0.9843137, 1,
1.003532, 0.397613, 1.586684, 1, 0, 0.9764706, 1,
1.004961, -0.582154, 1.133417, 1, 0, 0.972549, 1,
1.006535, 0.1635541, 1.023445, 1, 0, 0.9647059, 1,
1.007475, -0.2618791, 1.600848, 1, 0, 0.9607843, 1,
1.012665, -0.04381009, 1.831147, 1, 0, 0.9529412, 1,
1.016244, -1.526617, 2.215468, 1, 0, 0.9490196, 1,
1.016328, -1.183698, 3.748061, 1, 0, 0.9411765, 1,
1.035979, 1.688601, 1.469642, 1, 0, 0.9372549, 1,
1.037292, 0.7190318, -1.291018, 1, 0, 0.9294118, 1,
1.040042, 0.7688921, 1.335344, 1, 0, 0.9254902, 1,
1.04516, 0.2355403, 1.196471, 1, 0, 0.9176471, 1,
1.05008, -1.078934, 0.590235, 1, 0, 0.9137255, 1,
1.055698, 0.934687, 0.8563989, 1, 0, 0.9058824, 1,
1.069433, -0.3936196, 1.179049, 1, 0, 0.9019608, 1,
1.071855, 0.0556248, 0.02516955, 1, 0, 0.8941177, 1,
1.073518, 2.074304, -0.4010733, 1, 0, 0.8862745, 1,
1.073611, -0.96759, 1.580096, 1, 0, 0.8823529, 1,
1.078134, -2.136723, 2.309258, 1, 0, 0.8745098, 1,
1.078236, 1.158862, -0.9807494, 1, 0, 0.8705882, 1,
1.082597, -0.9654854, 3.170966, 1, 0, 0.8627451, 1,
1.085938, -0.4371306, 1.457042, 1, 0, 0.8588235, 1,
1.08742, 1.548273, 0.4920615, 1, 0, 0.8509804, 1,
1.105707, 2.206466, -0.5009907, 1, 0, 0.8470588, 1,
1.106468, -1.707496, 2.37578, 1, 0, 0.8392157, 1,
1.107975, -0.03243282, 2.598302, 1, 0, 0.8352941, 1,
1.111476, -0.8163627, 2.06338, 1, 0, 0.827451, 1,
1.121396, 0.4357122, 2.258825, 1, 0, 0.8235294, 1,
1.124831, -0.8434361, 1.903558, 1, 0, 0.8156863, 1,
1.127732, -1.184848, 1.55738, 1, 0, 0.8117647, 1,
1.128967, -0.3306725, 1.551315, 1, 0, 0.8039216, 1,
1.131244, -1.112533, 3.184469, 1, 0, 0.7960784, 1,
1.137054, 1.393432, 0.688674, 1, 0, 0.7921569, 1,
1.138225, -0.3436574, 1.545308, 1, 0, 0.7843137, 1,
1.138746, -1.185269, 2.536795, 1, 0, 0.7803922, 1,
1.146567, 1.479367, -0.6755949, 1, 0, 0.772549, 1,
1.149571, 0.9060644, 0.5497681, 1, 0, 0.7686275, 1,
1.155099, 0.35482, 0.1254982, 1, 0, 0.7607843, 1,
1.1574, 0.4884047, -0.7299865, 1, 0, 0.7568628, 1,
1.169275, 0.2573463, 4.936754, 1, 0, 0.7490196, 1,
1.172696, -0.8229463, 2.56798, 1, 0, 0.7450981, 1,
1.175444, -0.02128631, 0.9845121, 1, 0, 0.7372549, 1,
1.175488, 2.895497, 0.21195, 1, 0, 0.7333333, 1,
1.186887, -1.956874, 2.420432, 1, 0, 0.7254902, 1,
1.187242, 0.1027152, 1.289187, 1, 0, 0.7215686, 1,
1.19255, 0.2690983, 2.249283, 1, 0, 0.7137255, 1,
1.194809, 1.474293, 1.038268, 1, 0, 0.7098039, 1,
1.196046, 0.2740887, 2.331528, 1, 0, 0.7019608, 1,
1.197676, 0.697342, 0.1927967, 1, 0, 0.6941177, 1,
1.204738, -0.1416924, 0.485448, 1, 0, 0.6901961, 1,
1.20974, 0.0845627, 0.5476896, 1, 0, 0.682353, 1,
1.214127, -0.3702429, 1.328887, 1, 0, 0.6784314, 1,
1.223741, 0.6476998, 2.301333, 1, 0, 0.6705883, 1,
1.226194, -0.3235689, 2.916159, 1, 0, 0.6666667, 1,
1.228946, -1.06995, 2.804592, 1, 0, 0.6588235, 1,
1.237909, 1.466801, 1.45814, 1, 0, 0.654902, 1,
1.243957, -0.5930694, 1.328537, 1, 0, 0.6470588, 1,
1.24838, -0.2999782, 0.9006492, 1, 0, 0.6431373, 1,
1.250038, -1.02032, 4.013741, 1, 0, 0.6352941, 1,
1.250842, 1.119206, -0.7285053, 1, 0, 0.6313726, 1,
1.252629, 0.1305009, 0.7205055, 1, 0, 0.6235294, 1,
1.256618, 0.2324742, 1.692246, 1, 0, 0.6196079, 1,
1.260607, -1.161723, 2.633146, 1, 0, 0.6117647, 1,
1.26511, 1.187363, 0.8716557, 1, 0, 0.6078432, 1,
1.266943, 0.7404218, 0.7010624, 1, 0, 0.6, 1,
1.284279, 2.212605, -0.5208812, 1, 0, 0.5921569, 1,
1.29772, 0.06571434, 1.596132, 1, 0, 0.5882353, 1,
1.297971, 1.063193, 0.8556099, 1, 0, 0.5803922, 1,
1.329302, 0.9194484, 2.718766, 1, 0, 0.5764706, 1,
1.333075, -2.09746, 2.048133, 1, 0, 0.5686275, 1,
1.339411, -0.1017768, 0.4683958, 1, 0, 0.5647059, 1,
1.339619, 0.4359071, 1.120761, 1, 0, 0.5568628, 1,
1.348899, 0.7737526, 1.56772, 1, 0, 0.5529412, 1,
1.354216, 0.3832693, 1.413122, 1, 0, 0.5450981, 1,
1.354775, -0.6822802, 2.13141, 1, 0, 0.5411765, 1,
1.358796, -2.435858, 1.319542, 1, 0, 0.5333334, 1,
1.363188, -0.2890195, 2.161376, 1, 0, 0.5294118, 1,
1.375395, -0.7812079, 2.732105, 1, 0, 0.5215687, 1,
1.37763, -1.557184, 2.645046, 1, 0, 0.5176471, 1,
1.380361, 2.050246, -0.7324597, 1, 0, 0.509804, 1,
1.389502, -1.348529, 2.661878, 1, 0, 0.5058824, 1,
1.394426, 0.3709376, 1.346227, 1, 0, 0.4980392, 1,
1.396365, -0.9498323, 2.086193, 1, 0, 0.4901961, 1,
1.402294, 0.3801026, -0.07156649, 1, 0, 0.4862745, 1,
1.414805, -0.480536, 2.361975, 1, 0, 0.4784314, 1,
1.423952, 0.1169955, 2.035519, 1, 0, 0.4745098, 1,
1.430333, -0.8058366, 2.864214, 1, 0, 0.4666667, 1,
1.432083, 2.374117, 2.181019, 1, 0, 0.4627451, 1,
1.432574, 0.2686447, -0.4237774, 1, 0, 0.454902, 1,
1.435993, 0.5584697, 2.175037, 1, 0, 0.4509804, 1,
1.448904, -0.3779604, 1.247662, 1, 0, 0.4431373, 1,
1.4502, 1.125147, 1.391717, 1, 0, 0.4392157, 1,
1.458687, 0.4552969, -0.6548926, 1, 0, 0.4313726, 1,
1.459667, -0.7247813, 2.602181, 1, 0, 0.427451, 1,
1.46413, -2.036974, 2.912733, 1, 0, 0.4196078, 1,
1.468671, -1.1669, 2.704699, 1, 0, 0.4156863, 1,
1.469263, 0.315409, -0.1493049, 1, 0, 0.4078431, 1,
1.479571, -1.010313, 0.4836802, 1, 0, 0.4039216, 1,
1.503468, -0.06987267, 0.9700472, 1, 0, 0.3960784, 1,
1.504718, -0.7494759, 3.057627, 1, 0, 0.3882353, 1,
1.5105, -0.5330218, 3.805661, 1, 0, 0.3843137, 1,
1.527319, -0.7307929, 1.180837, 1, 0, 0.3764706, 1,
1.530781, -0.6231591, 2.192656, 1, 0, 0.372549, 1,
1.541927, -1.164918, 1.84726, 1, 0, 0.3647059, 1,
1.555165, 1.388765, 1.365558, 1, 0, 0.3607843, 1,
1.564657, 0.4415093, 3.794323, 1, 0, 0.3529412, 1,
1.571547, 0.05243634, 2.021635, 1, 0, 0.3490196, 1,
1.577667, 0.8594993, 0.9028412, 1, 0, 0.3411765, 1,
1.579674, 0.7563627, 1.956542, 1, 0, 0.3372549, 1,
1.622337, -0.4110584, 0.5040743, 1, 0, 0.3294118, 1,
1.641605, 0.7359372, -1.310385, 1, 0, 0.3254902, 1,
1.643209, -0.9599164, 3.166533, 1, 0, 0.3176471, 1,
1.643969, 0.3049917, 0.7513909, 1, 0, 0.3137255, 1,
1.646357, -0.7404462, 2.316943, 1, 0, 0.3058824, 1,
1.657774, 0.6624196, -0.002598679, 1, 0, 0.2980392, 1,
1.664102, -0.9739971, 1.336418, 1, 0, 0.2941177, 1,
1.664472, 1.64349, 1.666491, 1, 0, 0.2862745, 1,
1.672863, -0.3249254, 1.734018, 1, 0, 0.282353, 1,
1.676568, -0.5114466, 0.3191976, 1, 0, 0.2745098, 1,
1.6845, -0.322654, 0.7447723, 1, 0, 0.2705882, 1,
1.705161, -0.4665224, 2.893325, 1, 0, 0.2627451, 1,
1.729128, -0.3890309, 3.850704, 1, 0, 0.2588235, 1,
1.741083, -0.7976114, 1.579667, 1, 0, 0.2509804, 1,
1.776419, 0.9309307, 0.3826623, 1, 0, 0.2470588, 1,
1.79528, 0.7608665, 1.367501, 1, 0, 0.2392157, 1,
1.80819, 0.2617345, 0.7701002, 1, 0, 0.2352941, 1,
1.815341, -0.6087301, 4.372689, 1, 0, 0.227451, 1,
1.815448, 1.115939, 1.535097, 1, 0, 0.2235294, 1,
1.818505, 0.8799452, 2.579577, 1, 0, 0.2156863, 1,
1.820479, -2.21483, 2.008898, 1, 0, 0.2117647, 1,
1.84313, -0.08308173, 0.1495609, 1, 0, 0.2039216, 1,
1.857004, 0.9404254, 1.18189, 1, 0, 0.1960784, 1,
1.890443, -0.4746091, 2.899461, 1, 0, 0.1921569, 1,
1.903558, -1.07231, 2.0874, 1, 0, 0.1843137, 1,
1.913014, -0.8380097, 0.834016, 1, 0, 0.1803922, 1,
1.923933, 0.324266, 2.089559, 1, 0, 0.172549, 1,
1.931084, -0.1257106, -0.09074485, 1, 0, 0.1686275, 1,
1.932981, -1.391648, 1.810313, 1, 0, 0.1607843, 1,
1.960007, -1.454205, 4.192426, 1, 0, 0.1568628, 1,
1.990095, -0.1338272, 1.066361, 1, 0, 0.1490196, 1,
1.996385, -0.081065, 1.213886, 1, 0, 0.145098, 1,
2.011108, -0.2203607, 1.374232, 1, 0, 0.1372549, 1,
2.01329, 0.7048984, 3.684634, 1, 0, 0.1333333, 1,
2.014701, -0.7399837, 1.911894, 1, 0, 0.1254902, 1,
2.017372, -0.3337225, 3.165565, 1, 0, 0.1215686, 1,
2.027579, 0.7622053, 1.475996, 1, 0, 0.1137255, 1,
2.051347, 0.4397845, -0.110339, 1, 0, 0.1098039, 1,
2.079735, 0.4419922, 2.682019, 1, 0, 0.1019608, 1,
2.139352, 0.752194, -0.7397842, 1, 0, 0.09411765, 1,
2.182295, -1.359713, 2.991238, 1, 0, 0.09019608, 1,
2.183673, -0.2837718, 1.069175, 1, 0, 0.08235294, 1,
2.193296, 0.3577554, 1.06628, 1, 0, 0.07843138, 1,
2.236435, -0.3006946, 1.757681, 1, 0, 0.07058824, 1,
2.282663, -0.3535313, 2.38323, 1, 0, 0.06666667, 1,
2.301533, 0.3292208, 1.789264, 1, 0, 0.05882353, 1,
2.33206, -0.5360668, 1.315761, 1, 0, 0.05490196, 1,
2.363812, -0.1817079, 2.1415, 1, 0, 0.04705882, 1,
2.425144, 0.2854204, 1.676201, 1, 0, 0.04313726, 1,
2.430191, -1.637879, 3.510298, 1, 0, 0.03529412, 1,
2.702055, 1.184723, 0.2165859, 1, 0, 0.03137255, 1,
2.703671, 0.2342876, 1.541073, 1, 0, 0.02352941, 1,
2.75991, -0.4541933, 2.763268, 1, 0, 0.01960784, 1,
3.141438, -0.6578745, 1.776614, 1, 0, 0.01176471, 1,
3.265801, -0.08516753, 2.617289, 1, 0, 0.007843138, 1
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
0.10725, -4.658096, -7.841515, 0, -0.5, 0.5, 0.5,
0.10725, -4.658096, -7.841515, 1, -0.5, 0.5, 0.5,
0.10725, -4.658096, -7.841515, 1, 1.5, 0.5, 0.5,
0.10725, -4.658096, -7.841515, 0, 1.5, 0.5, 0.5
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
-4.122049, 0.1872268, -7.841515, 0, -0.5, 0.5, 0.5,
-4.122049, 0.1872268, -7.841515, 1, -0.5, 0.5, 0.5,
-4.122049, 0.1872268, -7.841515, 1, 1.5, 0.5, 0.5,
-4.122049, 0.1872268, -7.841515, 0, 1.5, 0.5, 0.5
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
-4.122049, -4.658096, 0.04533577, 0, -0.5, 0.5, 0.5,
-4.122049, -4.658096, 0.04533577, 1, -0.5, 0.5, 0.5,
-4.122049, -4.658096, 0.04533577, 1, 1.5, 0.5, 0.5,
-4.122049, -4.658096, 0.04533577, 0, 1.5, 0.5, 0.5
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
-3, -3.539945, -6.021472,
3, -3.539945, -6.021472,
-3, -3.539945, -6.021472,
-3, -3.726303, -6.324813,
-2, -3.539945, -6.021472,
-2, -3.726303, -6.324813,
-1, -3.539945, -6.021472,
-1, -3.726303, -6.324813,
0, -3.539945, -6.021472,
0, -3.726303, -6.324813,
1, -3.539945, -6.021472,
1, -3.726303, -6.324813,
2, -3.539945, -6.021472,
2, -3.726303, -6.324813,
3, -3.539945, -6.021472,
3, -3.726303, -6.324813
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
-3, -4.09902, -6.931494, 0, -0.5, 0.5, 0.5,
-3, -4.09902, -6.931494, 1, -0.5, 0.5, 0.5,
-3, -4.09902, -6.931494, 1, 1.5, 0.5, 0.5,
-3, -4.09902, -6.931494, 0, 1.5, 0.5, 0.5,
-2, -4.09902, -6.931494, 0, -0.5, 0.5, 0.5,
-2, -4.09902, -6.931494, 1, -0.5, 0.5, 0.5,
-2, -4.09902, -6.931494, 1, 1.5, 0.5, 0.5,
-2, -4.09902, -6.931494, 0, 1.5, 0.5, 0.5,
-1, -4.09902, -6.931494, 0, -0.5, 0.5, 0.5,
-1, -4.09902, -6.931494, 1, -0.5, 0.5, 0.5,
-1, -4.09902, -6.931494, 1, 1.5, 0.5, 0.5,
-1, -4.09902, -6.931494, 0, 1.5, 0.5, 0.5,
0, -4.09902, -6.931494, 0, -0.5, 0.5, 0.5,
0, -4.09902, -6.931494, 1, -0.5, 0.5, 0.5,
0, -4.09902, -6.931494, 1, 1.5, 0.5, 0.5,
0, -4.09902, -6.931494, 0, 1.5, 0.5, 0.5,
1, -4.09902, -6.931494, 0, -0.5, 0.5, 0.5,
1, -4.09902, -6.931494, 1, -0.5, 0.5, 0.5,
1, -4.09902, -6.931494, 1, 1.5, 0.5, 0.5,
1, -4.09902, -6.931494, 0, 1.5, 0.5, 0.5,
2, -4.09902, -6.931494, 0, -0.5, 0.5, 0.5,
2, -4.09902, -6.931494, 1, -0.5, 0.5, 0.5,
2, -4.09902, -6.931494, 1, 1.5, 0.5, 0.5,
2, -4.09902, -6.931494, 0, 1.5, 0.5, 0.5,
3, -4.09902, -6.931494, 0, -0.5, 0.5, 0.5,
3, -4.09902, -6.931494, 1, -0.5, 0.5, 0.5,
3, -4.09902, -6.931494, 1, 1.5, 0.5, 0.5,
3, -4.09902, -6.931494, 0, 1.5, 0.5, 0.5
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
-3.146057, -2, -6.021472,
-3.146057, 2, -6.021472,
-3.146057, -2, -6.021472,
-3.308723, -2, -6.324813,
-3.146057, 0, -6.021472,
-3.308723, 0, -6.324813,
-3.146057, 2, -6.021472,
-3.308723, 2, -6.324813
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
-3.634053, -2, -6.931494, 0, -0.5, 0.5, 0.5,
-3.634053, -2, -6.931494, 1, -0.5, 0.5, 0.5,
-3.634053, -2, -6.931494, 1, 1.5, 0.5, 0.5,
-3.634053, -2, -6.931494, 0, 1.5, 0.5, 0.5,
-3.634053, 0, -6.931494, 0, -0.5, 0.5, 0.5,
-3.634053, 0, -6.931494, 1, -0.5, 0.5, 0.5,
-3.634053, 0, -6.931494, 1, 1.5, 0.5, 0.5,
-3.634053, 0, -6.931494, 0, 1.5, 0.5, 0.5,
-3.634053, 2, -6.931494, 0, -0.5, 0.5, 0.5,
-3.634053, 2, -6.931494, 1, -0.5, 0.5, 0.5,
-3.634053, 2, -6.931494, 1, 1.5, 0.5, 0.5,
-3.634053, 2, -6.931494, 0, 1.5, 0.5, 0.5
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
-3.146057, -3.539945, -4,
-3.146057, -3.539945, 4,
-3.146057, -3.539945, -4,
-3.308723, -3.726303, -4,
-3.146057, -3.539945, -2,
-3.308723, -3.726303, -2,
-3.146057, -3.539945, 0,
-3.308723, -3.726303, 0,
-3.146057, -3.539945, 2,
-3.308723, -3.726303, 2,
-3.146057, -3.539945, 4,
-3.308723, -3.726303, 4
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
-3.634053, -4.09902, -4, 0, -0.5, 0.5, 0.5,
-3.634053, -4.09902, -4, 1, -0.5, 0.5, 0.5,
-3.634053, -4.09902, -4, 1, 1.5, 0.5, 0.5,
-3.634053, -4.09902, -4, 0, 1.5, 0.5, 0.5,
-3.634053, -4.09902, -2, 0, -0.5, 0.5, 0.5,
-3.634053, -4.09902, -2, 1, -0.5, 0.5, 0.5,
-3.634053, -4.09902, -2, 1, 1.5, 0.5, 0.5,
-3.634053, -4.09902, -2, 0, 1.5, 0.5, 0.5,
-3.634053, -4.09902, 0, 0, -0.5, 0.5, 0.5,
-3.634053, -4.09902, 0, 1, -0.5, 0.5, 0.5,
-3.634053, -4.09902, 0, 1, 1.5, 0.5, 0.5,
-3.634053, -4.09902, 0, 0, 1.5, 0.5, 0.5,
-3.634053, -4.09902, 2, 0, -0.5, 0.5, 0.5,
-3.634053, -4.09902, 2, 1, -0.5, 0.5, 0.5,
-3.634053, -4.09902, 2, 1, 1.5, 0.5, 0.5,
-3.634053, -4.09902, 2, 0, 1.5, 0.5, 0.5,
-3.634053, -4.09902, 4, 0, -0.5, 0.5, 0.5,
-3.634053, -4.09902, 4, 1, -0.5, 0.5, 0.5,
-3.634053, -4.09902, 4, 1, 1.5, 0.5, 0.5,
-3.634053, -4.09902, 4, 0, 1.5, 0.5, 0.5
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
-3.146057, -3.539945, -6.021472,
-3.146057, 3.914398, -6.021472,
-3.146057, -3.539945, 6.112144,
-3.146057, 3.914398, 6.112144,
-3.146057, -3.539945, -6.021472,
-3.146057, -3.539945, 6.112144,
-3.146057, 3.914398, -6.021472,
-3.146057, 3.914398, 6.112144,
-3.146057, -3.539945, -6.021472,
3.360557, -3.539945, -6.021472,
-3.146057, -3.539945, 6.112144,
3.360557, -3.539945, 6.112144,
-3.146057, 3.914398, -6.021472,
3.360557, 3.914398, -6.021472,
-3.146057, 3.914398, 6.112144,
3.360557, 3.914398, 6.112144,
3.360557, -3.539945, -6.021472,
3.360557, 3.914398, -6.021472,
3.360557, -3.539945, 6.112144,
3.360557, 3.914398, 6.112144,
3.360557, -3.539945, -6.021472,
3.360557, -3.539945, 6.112144,
3.360557, 3.914398, -6.021472,
3.360557, 3.914398, 6.112144
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
var radius = 8.3603;
var distance = 37.19592;
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
mvMatrix.translate( -0.10725, -0.1872268, -0.04533577 );
mvMatrix.scale( 1.389251, 1.212625, 0.7449815 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.19592);
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
Diclofop-Methyl<-read.table("Diclofop-Methyl.xyz")
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
-3.051301, 2.143217, 0.8501138, 0, 0, 1, 1, 1,
-2.869079, 0.9512886, 0.07627611, 1, 0, 0, 1, 1,
-2.822743, 0.7424382, -0.6749972, 1, 0, 0, 1, 1,
-2.735689, 0.06863209, -4.087784, 1, 0, 0, 1, 1,
-2.555013, -0.9873892, -3.487213, 1, 0, 0, 1, 1,
-2.539038, -0.4770276, -2.083661, 1, 0, 0, 1, 1,
-2.482708, 1.917736, -1.544788, 0, 0, 0, 1, 1,
-2.482541, 0.5090396, -1.085864, 0, 0, 0, 1, 1,
-2.416708, 1.264021, -1.399307, 0, 0, 0, 1, 1,
-2.387059, 1.240952, -1.891925, 0, 0, 0, 1, 1,
-2.384754, 1.067293, 0.2056568, 0, 0, 0, 1, 1,
-2.368637, 0.3009851, -2.635166, 0, 0, 0, 1, 1,
-2.309217, 2.375067, -0.03171047, 0, 0, 0, 1, 1,
-2.29266, 0.4985462, -1.940716, 1, 1, 1, 1, 1,
-2.283267, -1.743257, -2.387154, 1, 1, 1, 1, 1,
-2.234673, -0.9432251, -3.084018, 1, 1, 1, 1, 1,
-2.187375, 0.01488428, -1.618642, 1, 1, 1, 1, 1,
-2.184404, -0.00187175, -2.469222, 1, 1, 1, 1, 1,
-2.130719, 1.54486, -1.610405, 1, 1, 1, 1, 1,
-2.107415, -0.192867, -2.17965, 1, 1, 1, 1, 1,
-2.063167, 1.394788, -0.5544245, 1, 1, 1, 1, 1,
-2.018566, 0.5148682, -2.094474, 1, 1, 1, 1, 1,
-2.010447, -1.595195, -1.066228, 1, 1, 1, 1, 1,
-1.997288, -0.3969208, -1.298594, 1, 1, 1, 1, 1,
-1.993473, -1.667348, -3.442853, 1, 1, 1, 1, 1,
-1.98349, -0.5781896, -3.008774, 1, 1, 1, 1, 1,
-1.959297, -1.858739, -3.3973, 1, 1, 1, 1, 1,
-1.942008, 0.6267704, -0.8738971, 1, 1, 1, 1, 1,
-1.938622, -0.4708633, -3.172112, 0, 0, 1, 1, 1,
-1.932434, 0.3806432, -2.924956, 1, 0, 0, 1, 1,
-1.929603, -2.721905, -2.877534, 1, 0, 0, 1, 1,
-1.89143, 1.245834, -1.18012, 1, 0, 0, 1, 1,
-1.876547, 0.562031, -0.5419142, 1, 0, 0, 1, 1,
-1.839911, 0.4382482, -2.261635, 1, 0, 0, 1, 1,
-1.829692, 0.546141, -0.3081343, 0, 0, 0, 1, 1,
-1.820986, -1.240352, -1.405675, 0, 0, 0, 1, 1,
-1.816118, 0.2939128, -2.697426, 0, 0, 0, 1, 1,
-1.807466, 1.394343, -0.6618806, 0, 0, 0, 1, 1,
-1.803595, -1.156739, -2.365272, 0, 0, 0, 1, 1,
-1.790177, 0.8781524, -1.74281, 0, 0, 0, 1, 1,
-1.788044, 0.6766237, -1.285727, 0, 0, 0, 1, 1,
-1.781033, -2.66368, -1.329628, 1, 1, 1, 1, 1,
-1.77583, -0.4185807, -3.743797, 1, 1, 1, 1, 1,
-1.758784, 1.61867, -1.21516, 1, 1, 1, 1, 1,
-1.756209, -0.959557, -1.908473, 1, 1, 1, 1, 1,
-1.737393, -0.5353002, -1.311222, 1, 1, 1, 1, 1,
-1.734956, -2.081364, -2.845416, 1, 1, 1, 1, 1,
-1.731899, -0.2018443, -1.005616, 1, 1, 1, 1, 1,
-1.727351, -0.3558097, -0.5171933, 1, 1, 1, 1, 1,
-1.719417, -0.1535007, -0.9634362, 1, 1, 1, 1, 1,
-1.705798, -1.474049, -3.022207, 1, 1, 1, 1, 1,
-1.689106, 1.11987, 0.31472, 1, 1, 1, 1, 1,
-1.685933, -0.3982711, -0.8149235, 1, 1, 1, 1, 1,
-1.673632, 1.220188, -1.828334, 1, 1, 1, 1, 1,
-1.668988, 0.1626955, -0.8172112, 1, 1, 1, 1, 1,
-1.660501, -1.028179, -2.736255, 1, 1, 1, 1, 1,
-1.657276, 0.1111671, -3.111655, 0, 0, 1, 1, 1,
-1.656791, 0.4899817, -2.477277, 1, 0, 0, 1, 1,
-1.65651, -0.6895139, -0.2177659, 1, 0, 0, 1, 1,
-1.65596, 0.1954673, -2.485415, 1, 0, 0, 1, 1,
-1.653382, -0.1659478, -2.687129, 1, 0, 0, 1, 1,
-1.64834, 1.015773, -0.7133964, 1, 0, 0, 1, 1,
-1.628895, 0.4924068, -1.790823, 0, 0, 0, 1, 1,
-1.625852, 0.8526993, -1.610279, 0, 0, 0, 1, 1,
-1.625065, 0.3080474, -1.80822, 0, 0, 0, 1, 1,
-1.622751, 1.331043, -0.6697866, 0, 0, 0, 1, 1,
-1.593153, -0.6141951, -2.334708, 0, 0, 0, 1, 1,
-1.59308, 0.1845652, -2.205369, 0, 0, 0, 1, 1,
-1.590742, 2.066241, -2.735313, 0, 0, 0, 1, 1,
-1.549477, 0.9721931, -2.785842, 1, 1, 1, 1, 1,
-1.534707, 0.6842125, 1.019618, 1, 1, 1, 1, 1,
-1.51116, -0.5792551, -1.860068, 1, 1, 1, 1, 1,
-1.501766, 1.115234, 0.161403, 1, 1, 1, 1, 1,
-1.499352, 0.8792834, -0.7745841, 1, 1, 1, 1, 1,
-1.497578, 0.2702767, -0.6601377, 1, 1, 1, 1, 1,
-1.496595, -0.9495881, -1.284345, 1, 1, 1, 1, 1,
-1.495415, 0.4835754, -0.7167813, 1, 1, 1, 1, 1,
-1.492934, 0.6227648, -0.7533656, 1, 1, 1, 1, 1,
-1.488532, 0.4205293, -2.610438, 1, 1, 1, 1, 1,
-1.486478, -0.8012142, -2.375455, 1, 1, 1, 1, 1,
-1.452834, -0.1824989, -1.299321, 1, 1, 1, 1, 1,
-1.447192, 0.8737806, -1.790751, 1, 1, 1, 1, 1,
-1.43433, 0.9213001, -0.008058086, 1, 1, 1, 1, 1,
-1.432632, -0.8384194, -1.891737, 1, 1, 1, 1, 1,
-1.418006, -0.3621434, -2.065656, 0, 0, 1, 1, 1,
-1.393732, 0.06203729, -1.107408, 1, 0, 0, 1, 1,
-1.392961, 0.4327223, -1.242314, 1, 0, 0, 1, 1,
-1.390817, -1.424233, -4.10888, 1, 0, 0, 1, 1,
-1.382133, -0.8227951, -0.8632786, 1, 0, 0, 1, 1,
-1.379859, -0.1775948, -2.14213, 1, 0, 0, 1, 1,
-1.368638, -0.5443001, -3.497823, 0, 0, 0, 1, 1,
-1.365007, -0.7979784, -4.000199, 0, 0, 0, 1, 1,
-1.358323, -1.414427, -0.5617545, 0, 0, 0, 1, 1,
-1.356577, -0.1552823, -3.049361, 0, 0, 0, 1, 1,
-1.352946, 0.6815012, -2.73227, 0, 0, 0, 1, 1,
-1.347023, -0.001370774, -0.4286537, 0, 0, 0, 1, 1,
-1.341899, 0.04269612, -1.375639, 0, 0, 0, 1, 1,
-1.334466, -1.136343, -3.243314, 1, 1, 1, 1, 1,
-1.328217, 0.4946181, -0.1549115, 1, 1, 1, 1, 1,
-1.323059, 0.4787778, -1.795285, 1, 1, 1, 1, 1,
-1.309687, -0.537588, -2.46095, 1, 1, 1, 1, 1,
-1.30914, 0.5338416, -0.8461918, 1, 1, 1, 1, 1,
-1.305617, 0.5638528, -0.09545479, 1, 1, 1, 1, 1,
-1.28636, -0.3985038, 0.9604203, 1, 1, 1, 1, 1,
-1.27746, -0.9963455, -3.215371, 1, 1, 1, 1, 1,
-1.272577, 0.4759268, -2.520637, 1, 1, 1, 1, 1,
-1.264746, -0.2331405, -3.533155, 1, 1, 1, 1, 1,
-1.259035, -0.37626, -1.894176, 1, 1, 1, 1, 1,
-1.254703, -0.0666177, -3.619884, 1, 1, 1, 1, 1,
-1.251992, -0.7109874, -3.018293, 1, 1, 1, 1, 1,
-1.24666, 0.4007133, -0.9196734, 1, 1, 1, 1, 1,
-1.223169, 0.4451821, -1.145289, 1, 1, 1, 1, 1,
-1.221957, 0.8248349, -1.45195, 0, 0, 1, 1, 1,
-1.21461, 1.318972, -1.317683, 1, 0, 0, 1, 1,
-1.206728, -0.002280662, -0.7653263, 1, 0, 0, 1, 1,
-1.200569, 0.7605439, -1.394293, 1, 0, 0, 1, 1,
-1.169192, 0.3975155, -2.174787, 1, 0, 0, 1, 1,
-1.161797, 1.342072, -0.6490197, 1, 0, 0, 1, 1,
-1.160356, -0.00965238, -1.670582, 0, 0, 0, 1, 1,
-1.152915, -1.609007, -3.853263, 0, 0, 0, 1, 1,
-1.1502, -1.362795, -3.037349, 0, 0, 0, 1, 1,
-1.148563, 1.171317, -1.232813, 0, 0, 0, 1, 1,
-1.144871, -0.1610079, -1.543451, 0, 0, 0, 1, 1,
-1.139249, 1.000293, -2.552239, 0, 0, 0, 1, 1,
-1.130918, 0.7639719, -1.639577, 0, 0, 0, 1, 1,
-1.128045, -0.4758394, -1.43941, 1, 1, 1, 1, 1,
-1.120678, -1.569005, -1.521341, 1, 1, 1, 1, 1,
-1.101921, -0.2801604, -0.3890198, 1, 1, 1, 1, 1,
-1.100989, -1.335775, -3.580106, 1, 1, 1, 1, 1,
-1.095428, -0.4111151, -2.788775, 1, 1, 1, 1, 1,
-1.0945, 0.6211658, -1.763133, 1, 1, 1, 1, 1,
-1.093072, -1.604159, -3.850572, 1, 1, 1, 1, 1,
-1.07856, 0.3525423, -1.238266, 1, 1, 1, 1, 1,
-1.077495, 1.731803, 0.1781125, 1, 1, 1, 1, 1,
-1.076802, -1.10777, -2.560784, 1, 1, 1, 1, 1,
-1.07087, -0.1404928, -1.380807, 1, 1, 1, 1, 1,
-1.068207, 0.4345667, -0.4926156, 1, 1, 1, 1, 1,
-1.061698, -1.27482, -1.493443, 1, 1, 1, 1, 1,
-1.057798, -0.4633988, -1.675233, 1, 1, 1, 1, 1,
-1.052854, -1.733244, -0.922688, 1, 1, 1, 1, 1,
-1.044487, -1.215084, -4.286679, 0, 0, 1, 1, 1,
-1.043507, 0.1369914, -1.625792, 1, 0, 0, 1, 1,
-1.042497, 0.5324649, -1.707672, 1, 0, 0, 1, 1,
-1.041237, 1.618381, -1.160235, 1, 0, 0, 1, 1,
-1.033436, 0.3059302, -1.285123, 1, 0, 0, 1, 1,
-1.033065, 0.525485, -2.122817, 1, 0, 0, 1, 1,
-1.028199, 0.5946342, -2.842881, 0, 0, 0, 1, 1,
-1.022587, 0.3871402, -0.6123834, 0, 0, 0, 1, 1,
-1.017403, -1.504417, -4.096394, 0, 0, 0, 1, 1,
-1.008894, 0.4732639, -1.022213, 0, 0, 0, 1, 1,
-0.9978472, -0.747916, -3.006575, 0, 0, 0, 1, 1,
-0.9974681, 0.4678341, -2.312833, 0, 0, 0, 1, 1,
-0.9938945, 1.238059, -0.3518401, 0, 0, 0, 1, 1,
-0.9930779, 0.2903015, -0.0790592, 1, 1, 1, 1, 1,
-0.9910398, 1.449747, -2.494314, 1, 1, 1, 1, 1,
-0.9906108, -0.9949847, -1.372899, 1, 1, 1, 1, 1,
-0.9845705, 0.8191787, 0.8909306, 1, 1, 1, 1, 1,
-0.9826939, -0.01875821, -0.6948925, 1, 1, 1, 1, 1,
-0.977545, -1.602598, -4.119431, 1, 1, 1, 1, 1,
-0.9767922, -0.3035775, -1.144614, 1, 1, 1, 1, 1,
-0.9764212, 1.425372, -2.412133, 1, 1, 1, 1, 1,
-0.9712442, 0.07677146, -2.702846, 1, 1, 1, 1, 1,
-0.9705098, -0.1195636, -0.5829893, 1, 1, 1, 1, 1,
-0.962816, -1.032461, -2.099609, 1, 1, 1, 1, 1,
-0.9588988, -1.201775, -2.940183, 1, 1, 1, 1, 1,
-0.9568756, 0.6667262, -1.062691, 1, 1, 1, 1, 1,
-0.9529382, -0.2247961, -1.948093, 1, 1, 1, 1, 1,
-0.9408081, -0.5120225, -1.730924, 1, 1, 1, 1, 1,
-0.9395009, -0.4315731, -1.590288, 0, 0, 1, 1, 1,
-0.9361628, 0.6997657, -0.02106144, 1, 0, 0, 1, 1,
-0.9341985, 0.5139185, -0.02999957, 1, 0, 0, 1, 1,
-0.9315795, -0.1058237, -0.9114954, 1, 0, 0, 1, 1,
-0.9285513, 0.8805145, 1.156883, 1, 0, 0, 1, 1,
-0.9273137, -1.163956, -1.637834, 1, 0, 0, 1, 1,
-0.9267116, 1.826557, -0.04363209, 0, 0, 0, 1, 1,
-0.9146343, 1.175396, -0.8545138, 0, 0, 0, 1, 1,
-0.9102817, 0.2065526, -1.615672, 0, 0, 0, 1, 1,
-0.9033246, 0.1774348, -0.7771868, 0, 0, 0, 1, 1,
-0.8974851, -0.849016, -0.7190866, 0, 0, 0, 1, 1,
-0.8943619, 0.9048801, -0.6357113, 0, 0, 0, 1, 1,
-0.8919126, 1.190643, 0.3050072, 0, 0, 0, 1, 1,
-0.8851315, -1.523624, -2.870765, 1, 1, 1, 1, 1,
-0.8817741, -0.3440343, -0.363418, 1, 1, 1, 1, 1,
-0.867181, -0.8743947, -2.507392, 1, 1, 1, 1, 1,
-0.8646329, 0.08510946, -2.962082, 1, 1, 1, 1, 1,
-0.8580977, -0.3489125, -2.214358, 1, 1, 1, 1, 1,
-0.8545298, 1.533842, 0.4636154, 1, 1, 1, 1, 1,
-0.8497077, 0.08580868, -1.108449, 1, 1, 1, 1, 1,
-0.849306, 1.706864, 0.9937249, 1, 1, 1, 1, 1,
-0.8471221, -0.7522591, -2.618491, 1, 1, 1, 1, 1,
-0.8323103, -0.6470646, -1.792198, 1, 1, 1, 1, 1,
-0.8255541, -1.593269, -2.216745, 1, 1, 1, 1, 1,
-0.825395, -1.626839, -2.523069, 1, 1, 1, 1, 1,
-0.8243261, -2.675589, -3.99947, 1, 1, 1, 1, 1,
-0.8233385, -2.010303, -2.631801, 1, 1, 1, 1, 1,
-0.8223308, -1.19623, -3.622724, 1, 1, 1, 1, 1,
-0.8215685, -0.3798979, -1.568882, 0, 0, 1, 1, 1,
-0.8209581, 1.420507, -0.7324306, 1, 0, 0, 1, 1,
-0.8126732, -0.6168049, -3.213917, 1, 0, 0, 1, 1,
-0.8124666, 0.6412282, -0.3176053, 1, 0, 0, 1, 1,
-0.8087908, -2.130988, -3.716248, 1, 0, 0, 1, 1,
-0.8087466, 0.2726932, -0.7970037, 1, 0, 0, 1, 1,
-0.8077502, 1.316244, -3.527582, 0, 0, 0, 1, 1,
-0.8073359, 0.3981614, -1.275773, 0, 0, 0, 1, 1,
-0.8062357, 0.02698377, -0.8816722, 0, 0, 0, 1, 1,
-0.8056275, 0.292282, -1.384472, 0, 0, 0, 1, 1,
-0.8036202, 0.04375896, -1.687443, 0, 0, 0, 1, 1,
-0.7967983, 0.2272297, -0.9807792, 0, 0, 0, 1, 1,
-0.7879133, 1.314109, -0.8860909, 0, 0, 0, 1, 1,
-0.7849016, 0.2985472, -1.082041, 1, 1, 1, 1, 1,
-0.7847819, 3.065997, -1.354302, 1, 1, 1, 1, 1,
-0.7807547, 0.5686032, -2.366513, 1, 1, 1, 1, 1,
-0.7800896, 0.665521, -1.090094, 1, 1, 1, 1, 1,
-0.7746943, -0.2917444, -1.593562, 1, 1, 1, 1, 1,
-0.7704516, 1.317239, -2.486416, 1, 1, 1, 1, 1,
-0.7640221, 1.05045, 0.189238, 1, 1, 1, 1, 1,
-0.7569738, 1.695099, -0.2375735, 1, 1, 1, 1, 1,
-0.7547948, 0.5240193, -1.518337, 1, 1, 1, 1, 1,
-0.753096, -0.3511095, -0.4013404, 1, 1, 1, 1, 1,
-0.7512136, 0.1111015, -0.618112, 1, 1, 1, 1, 1,
-0.7491366, -0.01808274, -2.60093, 1, 1, 1, 1, 1,
-0.7481145, 0.2356001, -2.868374, 1, 1, 1, 1, 1,
-0.7477577, -1.182688, -3.351777, 1, 1, 1, 1, 1,
-0.747112, 1.800623, 0.1693546, 1, 1, 1, 1, 1,
-0.7458026, 1.100261, 0.6461616, 0, 0, 1, 1, 1,
-0.7406419, 1.570532, 0.186372, 1, 0, 0, 1, 1,
-0.7392824, -0.3923013, 1.267928, 1, 0, 0, 1, 1,
-0.7363034, 0.2266462, -1.605648, 1, 0, 0, 1, 1,
-0.7327297, 0.7756811, -0.009205409, 1, 0, 0, 1, 1,
-0.7317306, -1.540446, -2.754151, 1, 0, 0, 1, 1,
-0.724702, -1.008638, -1.937462, 0, 0, 0, 1, 1,
-0.7232072, -0.7185713, -3.111547, 0, 0, 0, 1, 1,
-0.7209531, 0.3378052, -0.6384898, 0, 0, 0, 1, 1,
-0.71593, -0.5227734, -2.564181, 0, 0, 0, 1, 1,
-0.7134204, -1.237418, -2.679309, 0, 0, 0, 1, 1,
-0.7062745, -0.6891237, -3.024748, 0, 0, 0, 1, 1,
-0.7054747, 1.98866, 0.9098239, 0, 0, 0, 1, 1,
-0.6992508, -1.888954, -3.66205, 1, 1, 1, 1, 1,
-0.6980075, -0.414779, -1.474075, 1, 1, 1, 1, 1,
-0.6933501, 0.4996147, 0.6568933, 1, 1, 1, 1, 1,
-0.6902613, -1.14994, -5.844769, 1, 1, 1, 1, 1,
-0.6899806, 0.7819026, -0.6737043, 1, 1, 1, 1, 1,
-0.6862463, -0.6424854, -1.354145, 1, 1, 1, 1, 1,
-0.6842893, -0.9905052, -0.1672598, 1, 1, 1, 1, 1,
-0.6828648, 0.5566972, -2.243329, 1, 1, 1, 1, 1,
-0.682619, -0.2552249, -2.775231, 1, 1, 1, 1, 1,
-0.6818841, -0.5302361, -2.54976, 1, 1, 1, 1, 1,
-0.6761186, 0.5213422, 0.4692062, 1, 1, 1, 1, 1,
-0.6716402, 0.1014714, -1.015353, 1, 1, 1, 1, 1,
-0.6693917, 0.6746567, 0.1076152, 1, 1, 1, 1, 1,
-0.6645083, -0.1575304, -2.413634, 1, 1, 1, 1, 1,
-0.6608148, -0.9115459, -1.827677, 1, 1, 1, 1, 1,
-0.6600595, -0.672011, -0.9658521, 0, 0, 1, 1, 1,
-0.6535491, -0.4871404, -4.087792, 1, 0, 0, 1, 1,
-0.650581, -1.622175, -4.18008, 1, 0, 0, 1, 1,
-0.6479809, 1.483586, -0.2447547, 1, 0, 0, 1, 1,
-0.646584, -2.004666, -1.493276, 1, 0, 0, 1, 1,
-0.6462302, 2.070306, -0.133014, 1, 0, 0, 1, 1,
-0.6456727, -0.177713, -3.486619, 0, 0, 0, 1, 1,
-0.6441727, -0.5698684, -3.894222, 0, 0, 0, 1, 1,
-0.6384577, 1.369169, -0.05068078, 0, 0, 0, 1, 1,
-0.6368054, 0.2735038, -1.247784, 0, 0, 0, 1, 1,
-0.6345216, 0.2538599, -3.544316, 0, 0, 0, 1, 1,
-0.6320803, -1.645663, -3.582089, 0, 0, 0, 1, 1,
-0.625434, -1.468998, -1.652961, 0, 0, 0, 1, 1,
-0.6252704, -1.021841, -1.880646, 1, 1, 1, 1, 1,
-0.6231319, -1.139678, -1.915066, 1, 1, 1, 1, 1,
-0.6177054, 3.80584, 0.1450254, 1, 1, 1, 1, 1,
-0.6119826, -0.4806293, -3.610877, 1, 1, 1, 1, 1,
-0.6082013, 0.6056583, 1.773253, 1, 1, 1, 1, 1,
-0.6070416, -0.3564508, -3.164088, 1, 1, 1, 1, 1,
-0.6020032, -0.7136701, -2.576002, 1, 1, 1, 1, 1,
-0.6011257, -0.7541934, -4.696945, 1, 1, 1, 1, 1,
-0.6010294, -0.8705696, -1.439794, 1, 1, 1, 1, 1,
-0.5999836, -0.7031394, -2.478532, 1, 1, 1, 1, 1,
-0.5842326, -0.7315108, -1.542488, 1, 1, 1, 1, 1,
-0.5838722, 0.3234091, -1.713487, 1, 1, 1, 1, 1,
-0.5811079, -0.418288, -0.8126353, 1, 1, 1, 1, 1,
-0.5796669, -0.03676604, -2.037896, 1, 1, 1, 1, 1,
-0.576549, 0.6862697, -0.363651, 1, 1, 1, 1, 1,
-0.5764784, -1.45516, -3.47545, 0, 0, 1, 1, 1,
-0.5657179, 0.4783737, -1.814457, 1, 0, 0, 1, 1,
-0.5614648, -0.3507571, -1.354465, 1, 0, 0, 1, 1,
-0.5585887, -0.7862103, -3.150148, 1, 0, 0, 1, 1,
-0.557862, 1.329704, 0.09619997, 1, 0, 0, 1, 1,
-0.5554382, 1.457713, -1.686247, 1, 0, 0, 1, 1,
-0.544428, -0.9066266, -2.605471, 0, 0, 0, 1, 1,
-0.5425282, -1.384356, -4.182777, 0, 0, 0, 1, 1,
-0.5413893, -0.7323231, -1.130533, 0, 0, 0, 1, 1,
-0.5384715, 0.1017827, 0.1220268, 0, 0, 0, 1, 1,
-0.5362084, 1.673449, -1.854204, 0, 0, 0, 1, 1,
-0.5348765, 0.4466305, -0.05728161, 0, 0, 0, 1, 1,
-0.5302354, 0.08250514, -0.4128702, 0, 0, 0, 1, 1,
-0.5276113, 1.104659, 1.308865, 1, 1, 1, 1, 1,
-0.523459, 0.5650433, -1.19829, 1, 1, 1, 1, 1,
-0.5185192, -0.4557016, -1.490769, 1, 1, 1, 1, 1,
-0.5175385, -2.001783, -2.118145, 1, 1, 1, 1, 1,
-0.5174832, 1.441288, -0.9603822, 1, 1, 1, 1, 1,
-0.5058858, 0.479263, 0.4089637, 1, 1, 1, 1, 1,
-0.5050537, 1.423563, -1.121691, 1, 1, 1, 1, 1,
-0.4976649, -0.07532246, -0.4503217, 1, 1, 1, 1, 1,
-0.4940923, 1.256807, 0.1599863, 1, 1, 1, 1, 1,
-0.4923483, 0.890942, -1.674375, 1, 1, 1, 1, 1,
-0.4921806, -0.07204856, -0.8481381, 1, 1, 1, 1, 1,
-0.4888665, 2.263782, 0.6622186, 1, 1, 1, 1, 1,
-0.4879625, 0.1315354, -1.12528, 1, 1, 1, 1, 1,
-0.4875446, -2.9994, -0.9977467, 1, 1, 1, 1, 1,
-0.4869232, 0.8396279, 0.1580567, 1, 1, 1, 1, 1,
-0.4790829, 0.6435437, -1.102362, 0, 0, 1, 1, 1,
-0.4786469, -1.353905, -1.31506, 1, 0, 0, 1, 1,
-0.4784096, -0.4531114, -2.758059, 1, 0, 0, 1, 1,
-0.4773962, -0.6782427, -3.927884, 1, 0, 0, 1, 1,
-0.4681943, 2.420294, 1.403667, 1, 0, 0, 1, 1,
-0.4673957, -0.5769163, -2.388124, 1, 0, 0, 1, 1,
-0.4665803, -0.1303995, -2.294974, 0, 0, 0, 1, 1,
-0.4622991, -0.8669817, -1.326944, 0, 0, 0, 1, 1,
-0.4615304, 0.2474883, -2.286285, 0, 0, 0, 1, 1,
-0.4595496, -3.431386, -2.909238, 0, 0, 0, 1, 1,
-0.4571612, 1.056392, -0.7995136, 0, 0, 0, 1, 1,
-0.4499, -0.2876264, -2.698685, 0, 0, 0, 1, 1,
-0.4471676, 0.6810213, -0.8906651, 0, 0, 0, 1, 1,
-0.4446831, -0.6257027, -1.89535, 1, 1, 1, 1, 1,
-0.442254, -1.06717, -3.283844, 1, 1, 1, 1, 1,
-0.4385723, -0.2751513, -2.949971, 1, 1, 1, 1, 1,
-0.4300064, 0.07960738, -1.070327, 1, 1, 1, 1, 1,
-0.4272515, 0.3109921, -2.112283, 1, 1, 1, 1, 1,
-0.4258021, -2.086719, -1.722544, 1, 1, 1, 1, 1,
-0.4247753, -0.2612626, -1.651448, 1, 1, 1, 1, 1,
-0.4230219, -0.1918715, -0.8042556, 1, 1, 1, 1, 1,
-0.4209525, -1.263967, -2.733675, 1, 1, 1, 1, 1,
-0.4173506, 0.8269111, -1.743268, 1, 1, 1, 1, 1,
-0.4117526, 0.2172433, -0.6279334, 1, 1, 1, 1, 1,
-0.4054471, -0.6233978, -1.009041, 1, 1, 1, 1, 1,
-0.4049506, -0.879895, -2.951288, 1, 1, 1, 1, 1,
-0.4010642, 1.141629, -0.004598918, 1, 1, 1, 1, 1,
-0.4008853, -1.308191, -3.112388, 1, 1, 1, 1, 1,
-0.3975487, 0.6545896, -1.111853, 0, 0, 1, 1, 1,
-0.3968549, 1.254766, -1.503694, 1, 0, 0, 1, 1,
-0.39469, 0.8121346, -0.2363727, 1, 0, 0, 1, 1,
-0.3933104, -1.342898, -4.058241, 1, 0, 0, 1, 1,
-0.3926949, 0.3221863, -1.064364, 1, 0, 0, 1, 1,
-0.3916249, 0.7545192, 0.6308582, 1, 0, 0, 1, 1,
-0.3870484, 1.366632, -1.327188, 0, 0, 0, 1, 1,
-0.3864732, -0.3785437, -3.364319, 0, 0, 0, 1, 1,
-0.3859928, -0.6854607, -3.470936, 0, 0, 0, 1, 1,
-0.3858341, 0.9399924, -1.753572, 0, 0, 0, 1, 1,
-0.3836179, 0.9357572, 1.711067, 0, 0, 0, 1, 1,
-0.3819246, 1.051008, 1.195086, 0, 0, 0, 1, 1,
-0.3811493, 0.1168459, -1.463264, 0, 0, 0, 1, 1,
-0.3806115, 1.214414, 0.03914705, 1, 1, 1, 1, 1,
-0.37663, -1.703118, -3.480465, 1, 1, 1, 1, 1,
-0.3685611, -1.366115, -1.644789, 1, 1, 1, 1, 1,
-0.367448, 0.1854612, -0.4294666, 1, 1, 1, 1, 1,
-0.3642702, 1.507033, -0.2555213, 1, 1, 1, 1, 1,
-0.3632185, 1.303837, 0.2001018, 1, 1, 1, 1, 1,
-0.3628372, -1.451426, -3.972051, 1, 1, 1, 1, 1,
-0.3616447, -0.5985323, 0.2986131, 1, 1, 1, 1, 1,
-0.3581434, 0.8192429, 0.7602658, 1, 1, 1, 1, 1,
-0.3578992, 1.158458, 0.4432922, 1, 1, 1, 1, 1,
-0.3571051, 0.8362291, -1.777211, 1, 1, 1, 1, 1,
-0.3545891, -1.400458, -4.646535, 1, 1, 1, 1, 1,
-0.3544182, -0.858041, -1.860776, 1, 1, 1, 1, 1,
-0.3534468, -0.7228395, -1.943442, 1, 1, 1, 1, 1,
-0.3515671, 1.575965, -0.6812883, 1, 1, 1, 1, 1,
-0.3512311, 0.4015921, -0.8728547, 0, 0, 1, 1, 1,
-0.347644, -0.03111614, -1.675943, 1, 0, 0, 1, 1,
-0.3437565, -0.1713083, -3.465495, 1, 0, 0, 1, 1,
-0.3400393, -1.122764, -2.883, 1, 0, 0, 1, 1,
-0.3389116, -0.01944754, -1.254414, 1, 0, 0, 1, 1,
-0.3373473, 1.033707, -0.4951698, 1, 0, 0, 1, 1,
-0.3338205, 1.600875, -1.234714, 0, 0, 0, 1, 1,
-0.3336712, 0.1027132, -1.79196, 0, 0, 0, 1, 1,
-0.3329256, 1.136363, 2.064008, 0, 0, 0, 1, 1,
-0.3311075, -1.626318, -2.829096, 0, 0, 0, 1, 1,
-0.3310064, 0.4784966, -2.245535, 0, 0, 0, 1, 1,
-0.3248498, 2.385294, 2.259269, 0, 0, 0, 1, 1,
-0.3244754, 0.7331943, 0.09439295, 0, 0, 0, 1, 1,
-0.3158265, 0.6624177, -1.822248, 1, 1, 1, 1, 1,
-0.3111744, 0.2026333, -1.278428, 1, 1, 1, 1, 1,
-0.3084206, -0.7277628, -3.486165, 1, 1, 1, 1, 1,
-0.3074191, 0.1007049, -1.704861, 1, 1, 1, 1, 1,
-0.3059479, -0.3791172, -3.114602, 1, 1, 1, 1, 1,
-0.302087, 1.512264, 0.2872118, 1, 1, 1, 1, 1,
-0.3007917, -1.401402, -1.861024, 1, 1, 1, 1, 1,
-0.2930644, 0.1646392, -0.7019668, 1, 1, 1, 1, 1,
-0.2920784, -0.01358618, -3.080574, 1, 1, 1, 1, 1,
-0.2824582, -1.007424, -1.484539, 1, 1, 1, 1, 1,
-0.2787416, 0.2659686, 0.2696038, 1, 1, 1, 1, 1,
-0.2750863, 0.2175109, -1.347685, 1, 1, 1, 1, 1,
-0.2733729, -0.5343875, -5.064685, 1, 1, 1, 1, 1,
-0.2723421, -0.9455355, -4.033917, 1, 1, 1, 1, 1,
-0.2708281, -0.6080101, -3.548187, 1, 1, 1, 1, 1,
-0.2662021, -1.622612, -2.480751, 0, 0, 1, 1, 1,
-0.2649701, 1.210506, -0.6586543, 1, 0, 0, 1, 1,
-0.2646897, 0.808903, 0.180829, 1, 0, 0, 1, 1,
-0.2633089, -0.8185277, -4.249916, 1, 0, 0, 1, 1,
-0.2622603, -1.29715, -2.394906, 1, 0, 0, 1, 1,
-0.2611631, -1.927557, -2.725133, 1, 0, 0, 1, 1,
-0.2557299, -1.200683, -2.329182, 0, 0, 0, 1, 1,
-0.2556684, 1.9501, -2.181772, 0, 0, 0, 1, 1,
-0.2517105, 0.1698359, -0.3453722, 0, 0, 0, 1, 1,
-0.2504559, -1.147571, -0.293694, 0, 0, 0, 1, 1,
-0.2499858, 0.1997792, -1.216629, 0, 0, 0, 1, 1,
-0.2484865, -0.7061624, -3.203496, 0, 0, 0, 1, 1,
-0.2417367, 0.6987867, -1.10616, 0, 0, 0, 1, 1,
-0.2399021, -0.3228483, -2.723183, 1, 1, 1, 1, 1,
-0.2368654, -0.7519652, -2.536796, 1, 1, 1, 1, 1,
-0.2368598, -1.774207, -3.304831, 1, 1, 1, 1, 1,
-0.2356654, -0.1124388, -1.454631, 1, 1, 1, 1, 1,
-0.2347842, -1.460174, -3.48884, 1, 1, 1, 1, 1,
-0.2340984, -1.020718, -2.329122, 1, 1, 1, 1, 1,
-0.2339068, 0.2292083, 1.60049, 1, 1, 1, 1, 1,
-0.2286438, -1.709898, -3.382533, 1, 1, 1, 1, 1,
-0.2278274, 2.690655, 1.279886, 1, 1, 1, 1, 1,
-0.227012, 0.4637617, -1.702281, 1, 1, 1, 1, 1,
-0.2228196, -0.2039689, -2.060746, 1, 1, 1, 1, 1,
-0.2220665, -1.217017, -2.986549, 1, 1, 1, 1, 1,
-0.220935, 0.9676638, -1.655426, 1, 1, 1, 1, 1,
-0.2199833, 0.7733078, -0.8790208, 1, 1, 1, 1, 1,
-0.2104278, -0.05916459, -1.534977, 1, 1, 1, 1, 1,
-0.2032913, -1.020658, -3.833302, 0, 0, 1, 1, 1,
-0.1954232, 0.6855413, 0.5862534, 1, 0, 0, 1, 1,
-0.1935799, 0.4247599, -0.6047148, 1, 0, 0, 1, 1,
-0.1922102, 0.3691678, 0.9046376, 1, 0, 0, 1, 1,
-0.1915413, 0.5564878, -0.4504449, 1, 0, 0, 1, 1,
-0.1892196, 0.4233862, -0.2172862, 1, 0, 0, 1, 1,
-0.1796002, 0.4357526, -0.8030413, 0, 0, 0, 1, 1,
-0.1795627, -0.8135795, -2.686551, 0, 0, 0, 1, 1,
-0.177452, -1.130606, -4.404763, 0, 0, 0, 1, 1,
-0.1760058, -1.162208, -2.843112, 0, 0, 0, 1, 1,
-0.1722973, 1.19194, 0.6802911, 0, 0, 0, 1, 1,
-0.1684922, 0.04396187, -1.238369, 0, 0, 0, 1, 1,
-0.1679496, 0.3009161, -0.6772599, 0, 0, 0, 1, 1,
-0.1630243, 0.9864021, -0.5573955, 1, 1, 1, 1, 1,
-0.1587939, 0.8897021, 2.006177, 1, 1, 1, 1, 1,
-0.1579362, -0.5765299, -2.439609, 1, 1, 1, 1, 1,
-0.1572307, -1.252379, -2.705117, 1, 1, 1, 1, 1,
-0.1563425, 1.644643, -0.3687735, 1, 1, 1, 1, 1,
-0.1551672, -1.459203, -4.468612, 1, 1, 1, 1, 1,
-0.1540529, 0.2198659, -0.07071873, 1, 1, 1, 1, 1,
-0.1511217, 0.8276259, 0.5278409, 1, 1, 1, 1, 1,
-0.1506827, 1.280665, -0.1157753, 1, 1, 1, 1, 1,
-0.1490187, 0.8614089, 1.713895, 1, 1, 1, 1, 1,
-0.1462992, -1.571712, -3.210461, 1, 1, 1, 1, 1,
-0.1458013, -0.711015, -3.21187, 1, 1, 1, 1, 1,
-0.1400688, 0.5423477, -0.02950008, 1, 1, 1, 1, 1,
-0.1357261, 1.357483, 1.151461, 1, 1, 1, 1, 1,
-0.1352566, -1.440916, -3.630076, 1, 1, 1, 1, 1,
-0.1340929, 0.1022627, -1.250916, 0, 0, 1, 1, 1,
-0.133377, -0.6508963, -2.867245, 1, 0, 0, 1, 1,
-0.1316842, -0.6465014, -3.334466, 1, 0, 0, 1, 1,
-0.1283693, 1.144821, -0.1260165, 1, 0, 0, 1, 1,
-0.1260938, 0.3749119, 0.5269951, 1, 0, 0, 1, 1,
-0.1247969, -0.3375208, -2.326663, 1, 0, 0, 1, 1,
-0.1244706, 0.7493865, -1.364954, 0, 0, 0, 1, 1,
-0.1204147, -0.08083219, -2.963644, 0, 0, 0, 1, 1,
-0.1162684, 0.6292382, -0.9457679, 0, 0, 0, 1, 1,
-0.1159394, 1.113659, -0.8202633, 0, 0, 0, 1, 1,
-0.115929, -0.7432115, -3.265056, 0, 0, 0, 1, 1,
-0.1136529, -1.577755, -2.511031, 0, 0, 0, 1, 1,
-0.113326, 2.650761, -0.5512452, 0, 0, 0, 1, 1,
-0.1131412, 1.056453, 0.6338027, 1, 1, 1, 1, 1,
-0.1112558, 2.302869, -0.4513142, 1, 1, 1, 1, 1,
-0.109591, 0.7936698, 1.128097, 1, 1, 1, 1, 1,
-0.1075599, 0.2978267, 1.159564, 1, 1, 1, 1, 1,
-0.106323, 1.572752, 0.514137, 1, 1, 1, 1, 1,
-0.1048191, -0.5552132, -3.570812, 1, 1, 1, 1, 1,
-0.103077, -0.6185476, -1.622294, 1, 1, 1, 1, 1,
-0.1028866, -0.4303808, -1.193394, 1, 1, 1, 1, 1,
-0.1012322, 1.333585, -1.06133, 1, 1, 1, 1, 1,
-0.09565528, -0.2358242, -2.628878, 1, 1, 1, 1, 1,
-0.0941746, 0.8439708, 0.8559754, 1, 1, 1, 1, 1,
-0.09342647, 0.2140572, -1.550233, 1, 1, 1, 1, 1,
-0.0931742, 1.51133, 0.8281487, 1, 1, 1, 1, 1,
-0.0893596, 1.345862, -0.6437928, 1, 1, 1, 1, 1,
-0.08294672, 0.2290924, 0.2160448, 1, 1, 1, 1, 1,
-0.08247133, 0.6166737, -1.262743, 0, 0, 1, 1, 1,
-0.08140612, 1.074999, -0.3100208, 1, 0, 0, 1, 1,
-0.07659752, 0.4534663, -1.095283, 1, 0, 0, 1, 1,
-0.07648879, -0.05021723, -1.724235, 1, 0, 0, 1, 1,
-0.06259581, -0.8504858, -2.71132, 1, 0, 0, 1, 1,
-0.06135539, -0.5639282, -1.771809, 1, 0, 0, 1, 1,
-0.06078414, 0.5179614, 0.1924285, 0, 0, 0, 1, 1,
-0.05879409, 0.4191255, -1.018027, 0, 0, 0, 1, 1,
-0.05803031, -0.2464056, -3.237232, 0, 0, 0, 1, 1,
-0.05703507, -0.9753334, -1.323, 0, 0, 0, 1, 1,
-0.05228, -1.450139, -1.956187, 0, 0, 0, 1, 1,
-0.04988424, -0.4179181, -3.334187, 0, 0, 0, 1, 1,
-0.04987186, 1.535738, -0.2582861, 0, 0, 0, 1, 1,
-0.04782451, 1.632558, 0.01904013, 1, 1, 1, 1, 1,
-0.04476993, 1.34538, 0.8637648, 1, 1, 1, 1, 1,
-0.0364217, 0.09993639, 0.3450853, 1, 1, 1, 1, 1,
-0.03514029, 1.186435, 1.059333, 1, 1, 1, 1, 1,
-0.03253883, 1.966747, -0.1801999, 1, 1, 1, 1, 1,
-0.03095996, -0.03484034, 0.8069351, 1, 1, 1, 1, 1,
-0.02626778, 2.059752, -1.319375, 1, 1, 1, 1, 1,
-0.02523116, 1.649024, -1.029232, 1, 1, 1, 1, 1,
-0.02387634, 0.9373702, 0.1934221, 1, 1, 1, 1, 1,
-0.02151212, -0.2195583, -1.857695, 1, 1, 1, 1, 1,
-0.01632969, -0.9258527, -3.03041, 1, 1, 1, 1, 1,
-0.0131581, 0.611562, 1.396141, 1, 1, 1, 1, 1,
-0.002509464, 1.385722, -0.2926711, 1, 1, 1, 1, 1,
0.000733941, -1.968133, 4.095169, 1, 1, 1, 1, 1,
0.001274731, 0.1098955, 1.677751, 1, 1, 1, 1, 1,
0.01013881, -0.05960711, 3.341922, 0, 0, 1, 1, 1,
0.01135997, -0.6231896, 1.9028, 1, 0, 0, 1, 1,
0.01268978, 0.2726136, 0.2183914, 1, 0, 0, 1, 1,
0.02473321, -0.5858929, 2.159873, 1, 0, 0, 1, 1,
0.02640106, -0.8487162, 3.067891, 1, 0, 0, 1, 1,
0.02667619, -0.4983325, 2.661587, 1, 0, 0, 1, 1,
0.03532941, -0.893108, 1.774655, 0, 0, 0, 1, 1,
0.03960573, 0.04745422, 0.6395918, 0, 0, 0, 1, 1,
0.04110102, -0.5106207, 2.398304, 0, 0, 0, 1, 1,
0.04132862, 1.272031, 0.4394355, 0, 0, 0, 1, 1,
0.04200458, 1.152167, 0.2124983, 0, 0, 0, 1, 1,
0.04696199, -0.9963539, 3.423986, 0, 0, 0, 1, 1,
0.04868457, -1.789524, 3.561305, 0, 0, 0, 1, 1,
0.05125507, -0.2630907, 2.281735, 1, 1, 1, 1, 1,
0.05533625, -1.700282, 2.672367, 1, 1, 1, 1, 1,
0.05736148, -0.5066916, 3.868106, 1, 1, 1, 1, 1,
0.05802655, -1.959309, 4.561089, 1, 1, 1, 1, 1,
0.05889798, -0.2576447, 1.847805, 1, 1, 1, 1, 1,
0.05951715, 0.6854536, -0.05486364, 1, 1, 1, 1, 1,
0.06609796, -0.7224364, 3.173022, 1, 1, 1, 1, 1,
0.06846192, -0.9936321, 4.00376, 1, 1, 1, 1, 1,
0.06949785, 0.06971764, 1.232279, 1, 1, 1, 1, 1,
0.07383081, -0.5179637, 4.79331, 1, 1, 1, 1, 1,
0.07433507, -0.5303974, 2.810057, 1, 1, 1, 1, 1,
0.07504051, 0.4407558, 0.4350797, 1, 1, 1, 1, 1,
0.07635377, -0.4728276, 4.620487, 1, 1, 1, 1, 1,
0.07984019, -0.2150975, 1.384905, 1, 1, 1, 1, 1,
0.09261524, 0.7877149, -1.909837, 1, 1, 1, 1, 1,
0.092741, -0.1838428, 1.987616, 0, 0, 1, 1, 1,
0.09525675, 0.09838169, 2.337237, 1, 0, 0, 1, 1,
0.09599067, 0.3346538, -1.012477, 1, 0, 0, 1, 1,
0.09771141, 0.6496277, -0.0008929244, 1, 0, 0, 1, 1,
0.1003067, 0.7190787, -0.5482092, 1, 0, 0, 1, 1,
0.1082114, -0.08680195, 2.535268, 1, 0, 0, 1, 1,
0.109847, -0.1589124, 3.785337, 0, 0, 0, 1, 1,
0.1123039, -0.7466053, 2.180529, 0, 0, 0, 1, 1,
0.1144562, -0.7753167, 2.80442, 0, 0, 0, 1, 1,
0.1159764, 2.110213, -2.438388, 0, 0, 0, 1, 1,
0.1194832, -0.2659186, 4.30027, 0, 0, 0, 1, 1,
0.1213482, 0.1382149, 2.098515, 0, 0, 0, 1, 1,
0.126497, -1.042371, 4.379591, 0, 0, 0, 1, 1,
0.1272554, 0.6193909, -0.413825, 1, 1, 1, 1, 1,
0.1305711, -0.3101568, 3.931529, 1, 1, 1, 1, 1,
0.1306325, 0.5990945, 1.500083, 1, 1, 1, 1, 1,
0.1330727, 0.02403257, 3.307134, 1, 1, 1, 1, 1,
0.1332349, -1.594366, 3.820243, 1, 1, 1, 1, 1,
0.1358995, 1.627674, 1.720016, 1, 1, 1, 1, 1,
0.1393507, 0.5774443, 0.1718326, 1, 1, 1, 1, 1,
0.1431521, 1.057874, 0.9971604, 1, 1, 1, 1, 1,
0.1460752, -1.369392, 2.142702, 1, 1, 1, 1, 1,
0.1461901, 0.1387928, 0.3254084, 1, 1, 1, 1, 1,
0.1471105, -0.8993808, 2.638331, 1, 1, 1, 1, 1,
0.1557226, -0.1217951, 0.6522207, 1, 1, 1, 1, 1,
0.161293, -1.651224, 4.0984, 1, 1, 1, 1, 1,
0.1650102, 1.252537, 0.1887269, 1, 1, 1, 1, 1,
0.1652657, 0.9776335, -0.9406154, 1, 1, 1, 1, 1,
0.1681796, 0.2216618, 1.323358, 0, 0, 1, 1, 1,
0.1701718, -0.2010813, 1.291752, 1, 0, 0, 1, 1,
0.1728057, -1.272509, 2.598973, 1, 0, 0, 1, 1,
0.1813135, 0.1783399, 2.310565, 1, 0, 0, 1, 1,
0.1840923, 0.5950921, -0.6524665, 1, 0, 0, 1, 1,
0.1869667, 0.3916307, 1.05019, 1, 0, 0, 1, 1,
0.188922, 0.4768662, 0.6616178, 0, 0, 0, 1, 1,
0.1899465, -0.846476, 1.742098, 0, 0, 0, 1, 1,
0.1973545, 1.120235, 1.853871, 0, 0, 0, 1, 1,
0.199399, 0.424159, -0.9293386, 0, 0, 0, 1, 1,
0.2039124, 0.6515335, 0.224256, 0, 0, 0, 1, 1,
0.2065988, 0.4337456, 0.3112342, 0, 0, 0, 1, 1,
0.2109134, -0.5764074, 2.743922, 0, 0, 0, 1, 1,
0.211702, -1.690221, 1.950472, 1, 1, 1, 1, 1,
0.2134289, -0.04630022, 1.108611, 1, 1, 1, 1, 1,
0.2201843, -0.4260167, 2.281265, 1, 1, 1, 1, 1,
0.2221317, -0.3587289, 5.151411, 1, 1, 1, 1, 1,
0.2245288, -0.9625018, 3.568011, 1, 1, 1, 1, 1,
0.2260489, 0.9188761, 1.474303, 1, 1, 1, 1, 1,
0.2278381, 0.09037582, 1.714133, 1, 1, 1, 1, 1,
0.2323937, 0.1221817, 2.851432, 1, 1, 1, 1, 1,
0.2334321, -0.1067567, 0.82341, 1, 1, 1, 1, 1,
0.2393797, 0.3016441, 0.9312735, 1, 1, 1, 1, 1,
0.2402972, 1.626813, 1.973824, 1, 1, 1, 1, 1,
0.2456513, 0.02786331, 2.783981, 1, 1, 1, 1, 1,
0.2484689, -1.202255, 2.817867, 1, 1, 1, 1, 1,
0.2532158, -0.3858055, 3.698014, 1, 1, 1, 1, 1,
0.2586042, 0.8908391, -0.5032746, 1, 1, 1, 1, 1,
0.2609818, 0.4740872, 1.950505, 0, 0, 1, 1, 1,
0.2633924, -0.158228, 1.445611, 1, 0, 0, 1, 1,
0.2644524, 0.319003, 1.25645, 1, 0, 0, 1, 1,
0.265866, -0.7604424, 2.76726, 1, 0, 0, 1, 1,
0.2675602, -0.1294622, 1.981959, 1, 0, 0, 1, 1,
0.2726269, -0.8548161, 1.469768, 1, 0, 0, 1, 1,
0.2743277, 1.277278, -0.5200536, 0, 0, 0, 1, 1,
0.2826719, 0.4124558, -1.684024, 0, 0, 0, 1, 1,
0.2849103, -0.01358422, 2.229414, 0, 0, 0, 1, 1,
0.2895812, -0.2340069, 1.924213, 0, 0, 0, 1, 1,
0.2899211, 0.859062, 0.4572151, 0, 0, 0, 1, 1,
0.2931243, 0.3699089, 1.783709, 0, 0, 0, 1, 1,
0.2940274, -0.4335091, 1.380195, 0, 0, 0, 1, 1,
0.2994875, 1.227916, 2.683625, 1, 1, 1, 1, 1,
0.3011238, -1.043665, 3.652757, 1, 1, 1, 1, 1,
0.3107476, -1.009187, 1.12393, 1, 1, 1, 1, 1,
0.3114547, -1.128798, 1.734333, 1, 1, 1, 1, 1,
0.3115363, -0.2396687, 2.906757, 1, 1, 1, 1, 1,
0.3122257, 0.2005277, 3.15665, 1, 1, 1, 1, 1,
0.3123909, -0.8338418, 1.976169, 1, 1, 1, 1, 1,
0.3157135, 0.2532611, -1.770818, 1, 1, 1, 1, 1,
0.3159024, 0.1780423, 0.4142668, 1, 1, 1, 1, 1,
0.3195548, 1.356729, -0.8951082, 1, 1, 1, 1, 1,
0.3213791, 1.214323, 1.912239, 1, 1, 1, 1, 1,
0.3290266, 0.6801261, -0.289153, 1, 1, 1, 1, 1,
0.3329992, -0.6046106, 2.375641, 1, 1, 1, 1, 1,
0.3356668, -0.1083113, -0.6747237, 1, 1, 1, 1, 1,
0.336859, -0.8358179, 2.170181, 1, 1, 1, 1, 1,
0.342378, -0.7568351, 3.055495, 0, 0, 1, 1, 1,
0.3441214, -1.108791, 3.354927, 1, 0, 0, 1, 1,
0.3450995, 1.655191, -1.0069, 1, 0, 0, 1, 1,
0.3491736, 0.1891781, 0.4525475, 1, 0, 0, 1, 1,
0.3496756, 1.185477, 0.4795158, 1, 0, 0, 1, 1,
0.3539613, 1.58277, 0.03300153, 1, 0, 0, 1, 1,
0.354197, -1.526329, 3.403336, 0, 0, 0, 1, 1,
0.3556224, -0.9603431, 1.534842, 0, 0, 0, 1, 1,
0.3562847, -0.2759973, 1.88509, 0, 0, 0, 1, 1,
0.356848, -0.1289907, 2.494473, 0, 0, 0, 1, 1,
0.3575071, -1.671381, 2.565263, 0, 0, 0, 1, 1,
0.3581163, 0.9140813, -0.7460312, 0, 0, 0, 1, 1,
0.3595603, 0.4888064, 1.152913, 0, 0, 0, 1, 1,
0.3620216, 0.0208054, 1.864421, 1, 1, 1, 1, 1,
0.3630091, 1.180905, -0.3188876, 1, 1, 1, 1, 1,
0.3630172, 2.06166, -1.096666, 1, 1, 1, 1, 1,
0.3680584, -0.05097035, 1.674976, 1, 1, 1, 1, 1,
0.3705933, -1.458567, 3.569242, 1, 1, 1, 1, 1,
0.3733231, -0.7557079, 3.716044, 1, 1, 1, 1, 1,
0.3745384, 0.6247183, -1.354082, 1, 1, 1, 1, 1,
0.3750202, -0.1544832, 1.6097, 1, 1, 1, 1, 1,
0.375324, -0.6201966, 1.436907, 1, 1, 1, 1, 1,
0.3767888, -0.09788983, 1.615218, 1, 1, 1, 1, 1,
0.3772908, -0.8447343, 2.613112, 1, 1, 1, 1, 1,
0.3786707, -0.2665105, 1.068785, 1, 1, 1, 1, 1,
0.3805399, 1.109041, 0.1700115, 1, 1, 1, 1, 1,
0.380551, 0.1673558, 0.9942309, 1, 1, 1, 1, 1,
0.3830948, -0.212885, 1.511299, 1, 1, 1, 1, 1,
0.388817, -0.3472954, 3.405032, 0, 0, 1, 1, 1,
0.3913102, 1.065647, 1.913183, 1, 0, 0, 1, 1,
0.3914072, 1.739423, 1.239263, 1, 0, 0, 1, 1,
0.3920987, -0.9032299, 3.0065, 1, 0, 0, 1, 1,
0.3984869, -1.055338, 3.407299, 1, 0, 0, 1, 1,
0.4028067, 0.3986058, 1.102763, 1, 0, 0, 1, 1,
0.4050634, -0.8525733, 1.516753, 0, 0, 0, 1, 1,
0.4080216, 0.7650772, 0.436738, 0, 0, 0, 1, 1,
0.4098313, -0.1791344, 1.646609, 0, 0, 0, 1, 1,
0.417502, 0.2465725, 1.454476, 0, 0, 0, 1, 1,
0.4216866, -0.3798541, 0.8249705, 0, 0, 0, 1, 1,
0.4289333, 0.1203029, 2.15307, 0, 0, 0, 1, 1,
0.4300671, 0.4948858, 1.941402, 0, 0, 0, 1, 1,
0.4329859, 0.8342317, 2.611787, 1, 1, 1, 1, 1,
0.4332292, -0.2403314, 1.784575, 1, 1, 1, 1, 1,
0.434109, 0.603923, -0.3819817, 1, 1, 1, 1, 1,
0.4392302, -1.369628, -0.2054781, 1, 1, 1, 1, 1,
0.4401657, -0.1726179, 0.4188366, 1, 1, 1, 1, 1,
0.4403998, -0.4218118, 0.4553261, 1, 1, 1, 1, 1,
0.4404085, 0.3438662, 1.132397, 1, 1, 1, 1, 1,
0.445939, -1.765399, 2.736928, 1, 1, 1, 1, 1,
0.4519261, 1.157291, -0.4097922, 1, 1, 1, 1, 1,
0.453376, -0.8785748, 1.90568, 1, 1, 1, 1, 1,
0.4540401, 0.1727407, -0.4157628, 1, 1, 1, 1, 1,
0.4573523, -1.97273, 2.008721, 1, 1, 1, 1, 1,
0.4573534, -0.5846345, 1.284235, 1, 1, 1, 1, 1,
0.4581689, -0.24112, 1.036901, 1, 1, 1, 1, 1,
0.4609278, 0.8578126, 0.2747413, 1, 1, 1, 1, 1,
0.4614364, -1.826548, 2.300157, 0, 0, 1, 1, 1,
0.4615214, 0.2945327, -0.09986113, 1, 0, 0, 1, 1,
0.4678794, 1.374303, 1.320672, 1, 0, 0, 1, 1,
0.4689856, 0.1043798, -1.165295, 1, 0, 0, 1, 1,
0.4738964, -0.7564995, 2.885149, 1, 0, 0, 1, 1,
0.4796032, 0.8489903, 1.575838, 1, 0, 0, 1, 1,
0.4815378, 0.09494799, 0.8952929, 0, 0, 0, 1, 1,
0.4853821, 0.1648235, 1.857879, 0, 0, 0, 1, 1,
0.4863387, -0.5663773, 3.098574, 0, 0, 0, 1, 1,
0.4894214, -0.8155566, 3.115568, 0, 0, 0, 1, 1,
0.4902087, -0.7376593, 2.535352, 0, 0, 0, 1, 1,
0.4932255, -0.2362376, 1.647788, 0, 0, 0, 1, 1,
0.4933193, 0.8801376, -1.05937, 0, 0, 0, 1, 1,
0.4970675, -1.143036, 2.9329, 1, 1, 1, 1, 1,
0.5031452, -0.8221352, 0.964464, 1, 1, 1, 1, 1,
0.5061725, 1.343273, 0.8941357, 1, 1, 1, 1, 1,
0.508009, 0.2264238, 0.2961095, 1, 1, 1, 1, 1,
0.5151618, -0.132978, 0.8871692, 1, 1, 1, 1, 1,
0.5170773, -0.3634484, 2.929946, 1, 1, 1, 1, 1,
0.5195568, 0.2119055, 1.67524, 1, 1, 1, 1, 1,
0.5244076, -1.235719, 2.713046, 1, 1, 1, 1, 1,
0.5250792, -0.4446525, 2.421715, 1, 1, 1, 1, 1,
0.5256293, -0.7809022, 1.204244, 1, 1, 1, 1, 1,
0.5268148, -0.6701421, 0.8818985, 1, 1, 1, 1, 1,
0.5289149, 1.894364, 0.3792338, 1, 1, 1, 1, 1,
0.5313811, 0.7447135, 1.287782, 1, 1, 1, 1, 1,
0.5314411, -2.045001, 2.493302, 1, 1, 1, 1, 1,
0.5356781, 1.090342, -1.856354, 1, 1, 1, 1, 1,
0.5368649, -0.608287, 2.460969, 0, 0, 1, 1, 1,
0.5374524, 1.135352, 0.3776775, 1, 0, 0, 1, 1,
0.5382578, -1.153911, 3.204368, 1, 0, 0, 1, 1,
0.5432571, 1.631492, 0.8850905, 1, 0, 0, 1, 1,
0.543845, -0.9400122, 2.739609, 1, 0, 0, 1, 1,
0.5445834, 0.3349195, 0.8232779, 1, 0, 0, 1, 1,
0.5446829, -0.9914978, 1.977135, 0, 0, 0, 1, 1,
0.5471032, 1.240145, 0.2196521, 0, 0, 0, 1, 1,
0.5525398, 0.4775927, 0.501251, 0, 0, 0, 1, 1,
0.5529781, -0.5697927, 2.63427, 0, 0, 0, 1, 1,
0.557356, -0.08450273, 3.326227, 0, 0, 0, 1, 1,
0.5612022, -0.8811895, 1.100641, 0, 0, 0, 1, 1,
0.5653133, -0.03473233, 1.169059, 0, 0, 0, 1, 1,
0.5722253, -1.446631, 3.729141, 1, 1, 1, 1, 1,
0.5778493, 0.4848754, 0.6278865, 1, 1, 1, 1, 1,
0.5781136, -0.556349, 3.401229, 1, 1, 1, 1, 1,
0.5828295, 0.5539467, -0.1836955, 1, 1, 1, 1, 1,
0.5849494, -0.7338389, 2.885296, 1, 1, 1, 1, 1,
0.5853538, -0.3897277, 2.420745, 1, 1, 1, 1, 1,
0.5857872, 0.1594659, 0.712484, 1, 1, 1, 1, 1,
0.5865412, -0.2716984, 2.206423, 1, 1, 1, 1, 1,
0.5872006, -0.1513942, 0.9984122, 1, 1, 1, 1, 1,
0.5917537, -0.2821006, 1.819675, 1, 1, 1, 1, 1,
0.5917638, -1.175568, 2.800091, 1, 1, 1, 1, 1,
0.5938061, 1.630852, 1.704383, 1, 1, 1, 1, 1,
0.594048, 0.05897985, 2.199376, 1, 1, 1, 1, 1,
0.594081, 0.2637941, -0.2873393, 1, 1, 1, 1, 1,
0.5961301, -1.238322, 2.729614, 1, 1, 1, 1, 1,
0.5987475, 2.291043, 0.940719, 0, 0, 1, 1, 1,
0.609427, -0.6773934, 2.886862, 1, 0, 0, 1, 1,
0.6175548, 0.3698227, 1.00323, 1, 0, 0, 1, 1,
0.6177762, 0.9225923, 0.5828885, 1, 0, 0, 1, 1,
0.624023, 0.05654912, 1.026906, 1, 0, 0, 1, 1,
0.6244788, -0.3204146, 3.524416, 1, 0, 0, 1, 1,
0.6271842, -0.8901932, 3.620571, 0, 0, 0, 1, 1,
0.634383, -0.5248035, 2.809183, 0, 0, 0, 1, 1,
0.6365781, 0.06395732, 0.1166089, 0, 0, 0, 1, 1,
0.6372524, -0.6099734, 3.055481, 0, 0, 0, 1, 1,
0.6411842, 1.346149, 1.246432, 0, 0, 0, 1, 1,
0.6434596, -0.0356039, 2.582488, 0, 0, 0, 1, 1,
0.6447496, 1.220543, -1.382182, 0, 0, 0, 1, 1,
0.649619, -0.992514, 3.114815, 1, 1, 1, 1, 1,
0.6538379, -0.4676553, 4.48308, 1, 1, 1, 1, 1,
0.6567947, 0.411767, 1.404652, 1, 1, 1, 1, 1,
0.6598731, 0.8479009, 0.1322539, 1, 1, 1, 1, 1,
0.6611261, 1.274026, 1.070265, 1, 1, 1, 1, 1,
0.6638309, -0.5758576, 4.192438, 1, 1, 1, 1, 1,
0.6648741, -0.358859, 0.3176773, 1, 1, 1, 1, 1,
0.6648914, -0.04234534, 2.83897, 1, 1, 1, 1, 1,
0.6688699, -0.09674221, 1.217825, 1, 1, 1, 1, 1,
0.669538, 0.8894903, 1.939092, 1, 1, 1, 1, 1,
0.6710261, 0.644474, 0.6195408, 1, 1, 1, 1, 1,
0.6778814, 0.3237821, -0.1073497, 1, 1, 1, 1, 1,
0.6791637, -0.5747919, 3.766431, 1, 1, 1, 1, 1,
0.6817553, -0.5810541, 3.120332, 1, 1, 1, 1, 1,
0.6828314, -0.7544641, 0.9945307, 1, 1, 1, 1, 1,
0.6917779, 1.328968, 1.758319, 0, 0, 1, 1, 1,
0.6926836, -0.7404703, 1.535617, 1, 0, 0, 1, 1,
0.6932008, -1.354942, 0.587247, 1, 0, 0, 1, 1,
0.6959711, 1.486035, -0.5194851, 1, 0, 0, 1, 1,
0.7040346, 1.720668, 0.01755803, 1, 0, 0, 1, 1,
0.7083197, 1.462393, 0.424302, 1, 0, 0, 1, 1,
0.7321723, -0.1038745, 1.884146, 0, 0, 0, 1, 1,
0.7331234, -0.7596132, 0.8652508, 0, 0, 0, 1, 1,
0.7362505, 0.5250658, 2.181846, 0, 0, 0, 1, 1,
0.7393074, 0.4492265, 2.805678, 0, 0, 0, 1, 1,
0.7394628, -0.009961024, 1.72798, 0, 0, 0, 1, 1,
0.7435777, -0.5043396, 1.174691, 0, 0, 0, 1, 1,
0.7466709, -0.08914641, 2.976306, 0, 0, 0, 1, 1,
0.747632, -0.270452, 3.434828, 1, 1, 1, 1, 1,
0.7557387, 0.1679699, 1.205635, 1, 1, 1, 1, 1,
0.7600905, -0.3064356, 1.042602, 1, 1, 1, 1, 1,
0.7649691, 0.1383327, 1.415686, 1, 1, 1, 1, 1,
0.7698872, 1.767968, 1.366076, 1, 1, 1, 1, 1,
0.7702059, 0.15819, 1.114521, 1, 1, 1, 1, 1,
0.7782369, 0.246794, 1.570654, 1, 1, 1, 1, 1,
0.7885622, -2.29225, 4.569604, 1, 1, 1, 1, 1,
0.7901786, 1.466121, 0.02580564, 1, 1, 1, 1, 1,
0.7923391, -0.741133, 1.674698, 1, 1, 1, 1, 1,
0.7929112, 1.895333, -0.4050559, 1, 1, 1, 1, 1,
0.8008351, -0.0567813, 0.4157274, 1, 1, 1, 1, 1,
0.803107, 0.9989156, -0.4766553, 1, 1, 1, 1, 1,
0.8058294, 0.00253881, -0.2682469, 1, 1, 1, 1, 1,
0.8169722, 0.9372846, -0.3033604, 1, 1, 1, 1, 1,
0.8170297, 0.2318393, 2.318837, 0, 0, 1, 1, 1,
0.8244707, -1.20442, 2.655357, 1, 0, 0, 1, 1,
0.830204, 1.76874, 0.09256696, 1, 0, 0, 1, 1,
0.8334444, -1.086615, 4.297472, 1, 0, 0, 1, 1,
0.8377594, -0.3195724, 1.376692, 1, 0, 0, 1, 1,
0.8439877, -1.763734, 5.935441, 1, 0, 0, 1, 1,
0.8448199, -1.747849, 2.188895, 0, 0, 0, 1, 1,
0.8505143, -0.7139205, 2.273057, 0, 0, 0, 1, 1,
0.851937, 0.4563619, 1.082734, 0, 0, 0, 1, 1,
0.8548569, -0.05271871, 1.511818, 0, 0, 0, 1, 1,
0.8557596, 0.9553307, 0.01870683, 0, 0, 0, 1, 1,
0.8570601, -0.3099132, 2.270538, 0, 0, 0, 1, 1,
0.8576624, -0.3995147, 1.556268, 0, 0, 0, 1, 1,
0.8578634, 0.2779145, 1.66558, 1, 1, 1, 1, 1,
0.8580015, -0.3113454, 2.664208, 1, 1, 1, 1, 1,
0.8630614, -0.3107586, 3.97296, 1, 1, 1, 1, 1,
0.8663958, 0.2066041, -1.040896, 1, 1, 1, 1, 1,
0.8709871, 1.142564, 1.493163, 1, 1, 1, 1, 1,
0.8723754, -0.1300465, 0.5128461, 1, 1, 1, 1, 1,
0.8735151, 0.04418621, 1.970995, 1, 1, 1, 1, 1,
0.876804, 0.5070416, 2.360931, 1, 1, 1, 1, 1,
0.8772271, 0.4430763, 0.228119, 1, 1, 1, 1, 1,
0.8838223, -0.7833236, 3.901394, 1, 1, 1, 1, 1,
0.8862634, 1.112801, 0.7847119, 1, 1, 1, 1, 1,
0.8877192, -0.4809176, 1.44457, 1, 1, 1, 1, 1,
0.8940518, -1.453315, 2.428241, 1, 1, 1, 1, 1,
0.8949379, 0.7498531, 1.067185, 1, 1, 1, 1, 1,
0.8983406, 0.1137153, 1.176811, 1, 1, 1, 1, 1,
0.9096452, 0.5998397, -0.1769177, 0, 0, 1, 1, 1,
0.9107779, -0.3101195, 2.269583, 1, 0, 0, 1, 1,
0.9119511, -0.202694, 0.8560544, 1, 0, 0, 1, 1,
0.9182573, 0.01319395, 0.7943226, 1, 0, 0, 1, 1,
0.9246771, 1.131879, 0.6687044, 1, 0, 0, 1, 1,
0.9252634, 1.072622, 0.3816743, 1, 0, 0, 1, 1,
0.931648, -0.713844, 2.449012, 0, 0, 0, 1, 1,
0.942013, 1.645865, -0.2216939, 0, 0, 0, 1, 1,
0.944017, 0.6002014, 2.46377, 0, 0, 0, 1, 1,
0.9465219, -0.905163, 2.89974, 0, 0, 0, 1, 1,
0.9518229, -0.9029405, 3.697627, 0, 0, 0, 1, 1,
0.9519926, -0.416554, 1.85767, 0, 0, 0, 1, 1,
0.9537378, 2.374186, 0.60713, 0, 0, 0, 1, 1,
0.9543894, -0.5561731, 3.005712, 1, 1, 1, 1, 1,
0.9604052, -1.955424, 3.719409, 1, 1, 1, 1, 1,
0.9613854, -0.6134342, 2.142125, 1, 1, 1, 1, 1,
0.9664685, -2.10162, 3.282476, 1, 1, 1, 1, 1,
0.9720876, -0.003529506, 1.222109, 1, 1, 1, 1, 1,
0.9721566, -0.2840852, 1.373506, 1, 1, 1, 1, 1,
0.977577, -0.6645065, 0.0961784, 1, 1, 1, 1, 1,
0.9777782, -0.9939849, 0.9584579, 1, 1, 1, 1, 1,
0.9863212, 0.05776091, 1.067207, 1, 1, 1, 1, 1,
1.000874, -0.5204006, 0.2786876, 1, 1, 1, 1, 1,
1.00237, -0.02764744, 2.96447, 1, 1, 1, 1, 1,
1.003207, -0.4031579, 0.3937927, 1, 1, 1, 1, 1,
1.003532, 0.397613, 1.586684, 1, 1, 1, 1, 1,
1.004961, -0.582154, 1.133417, 1, 1, 1, 1, 1,
1.006535, 0.1635541, 1.023445, 1, 1, 1, 1, 1,
1.007475, -0.2618791, 1.600848, 0, 0, 1, 1, 1,
1.012665, -0.04381009, 1.831147, 1, 0, 0, 1, 1,
1.016244, -1.526617, 2.215468, 1, 0, 0, 1, 1,
1.016328, -1.183698, 3.748061, 1, 0, 0, 1, 1,
1.035979, 1.688601, 1.469642, 1, 0, 0, 1, 1,
1.037292, 0.7190318, -1.291018, 1, 0, 0, 1, 1,
1.040042, 0.7688921, 1.335344, 0, 0, 0, 1, 1,
1.04516, 0.2355403, 1.196471, 0, 0, 0, 1, 1,
1.05008, -1.078934, 0.590235, 0, 0, 0, 1, 1,
1.055698, 0.934687, 0.8563989, 0, 0, 0, 1, 1,
1.069433, -0.3936196, 1.179049, 0, 0, 0, 1, 1,
1.071855, 0.0556248, 0.02516955, 0, 0, 0, 1, 1,
1.073518, 2.074304, -0.4010733, 0, 0, 0, 1, 1,
1.073611, -0.96759, 1.580096, 1, 1, 1, 1, 1,
1.078134, -2.136723, 2.309258, 1, 1, 1, 1, 1,
1.078236, 1.158862, -0.9807494, 1, 1, 1, 1, 1,
1.082597, -0.9654854, 3.170966, 1, 1, 1, 1, 1,
1.085938, -0.4371306, 1.457042, 1, 1, 1, 1, 1,
1.08742, 1.548273, 0.4920615, 1, 1, 1, 1, 1,
1.105707, 2.206466, -0.5009907, 1, 1, 1, 1, 1,
1.106468, -1.707496, 2.37578, 1, 1, 1, 1, 1,
1.107975, -0.03243282, 2.598302, 1, 1, 1, 1, 1,
1.111476, -0.8163627, 2.06338, 1, 1, 1, 1, 1,
1.121396, 0.4357122, 2.258825, 1, 1, 1, 1, 1,
1.124831, -0.8434361, 1.903558, 1, 1, 1, 1, 1,
1.127732, -1.184848, 1.55738, 1, 1, 1, 1, 1,
1.128967, -0.3306725, 1.551315, 1, 1, 1, 1, 1,
1.131244, -1.112533, 3.184469, 1, 1, 1, 1, 1,
1.137054, 1.393432, 0.688674, 0, 0, 1, 1, 1,
1.138225, -0.3436574, 1.545308, 1, 0, 0, 1, 1,
1.138746, -1.185269, 2.536795, 1, 0, 0, 1, 1,
1.146567, 1.479367, -0.6755949, 1, 0, 0, 1, 1,
1.149571, 0.9060644, 0.5497681, 1, 0, 0, 1, 1,
1.155099, 0.35482, 0.1254982, 1, 0, 0, 1, 1,
1.1574, 0.4884047, -0.7299865, 0, 0, 0, 1, 1,
1.169275, 0.2573463, 4.936754, 0, 0, 0, 1, 1,
1.172696, -0.8229463, 2.56798, 0, 0, 0, 1, 1,
1.175444, -0.02128631, 0.9845121, 0, 0, 0, 1, 1,
1.175488, 2.895497, 0.21195, 0, 0, 0, 1, 1,
1.186887, -1.956874, 2.420432, 0, 0, 0, 1, 1,
1.187242, 0.1027152, 1.289187, 0, 0, 0, 1, 1,
1.19255, 0.2690983, 2.249283, 1, 1, 1, 1, 1,
1.194809, 1.474293, 1.038268, 1, 1, 1, 1, 1,
1.196046, 0.2740887, 2.331528, 1, 1, 1, 1, 1,
1.197676, 0.697342, 0.1927967, 1, 1, 1, 1, 1,
1.204738, -0.1416924, 0.485448, 1, 1, 1, 1, 1,
1.20974, 0.0845627, 0.5476896, 1, 1, 1, 1, 1,
1.214127, -0.3702429, 1.328887, 1, 1, 1, 1, 1,
1.223741, 0.6476998, 2.301333, 1, 1, 1, 1, 1,
1.226194, -0.3235689, 2.916159, 1, 1, 1, 1, 1,
1.228946, -1.06995, 2.804592, 1, 1, 1, 1, 1,
1.237909, 1.466801, 1.45814, 1, 1, 1, 1, 1,
1.243957, -0.5930694, 1.328537, 1, 1, 1, 1, 1,
1.24838, -0.2999782, 0.9006492, 1, 1, 1, 1, 1,
1.250038, -1.02032, 4.013741, 1, 1, 1, 1, 1,
1.250842, 1.119206, -0.7285053, 1, 1, 1, 1, 1,
1.252629, 0.1305009, 0.7205055, 0, 0, 1, 1, 1,
1.256618, 0.2324742, 1.692246, 1, 0, 0, 1, 1,
1.260607, -1.161723, 2.633146, 1, 0, 0, 1, 1,
1.26511, 1.187363, 0.8716557, 1, 0, 0, 1, 1,
1.266943, 0.7404218, 0.7010624, 1, 0, 0, 1, 1,
1.284279, 2.212605, -0.5208812, 1, 0, 0, 1, 1,
1.29772, 0.06571434, 1.596132, 0, 0, 0, 1, 1,
1.297971, 1.063193, 0.8556099, 0, 0, 0, 1, 1,
1.329302, 0.9194484, 2.718766, 0, 0, 0, 1, 1,
1.333075, -2.09746, 2.048133, 0, 0, 0, 1, 1,
1.339411, -0.1017768, 0.4683958, 0, 0, 0, 1, 1,
1.339619, 0.4359071, 1.120761, 0, 0, 0, 1, 1,
1.348899, 0.7737526, 1.56772, 0, 0, 0, 1, 1,
1.354216, 0.3832693, 1.413122, 1, 1, 1, 1, 1,
1.354775, -0.6822802, 2.13141, 1, 1, 1, 1, 1,
1.358796, -2.435858, 1.319542, 1, 1, 1, 1, 1,
1.363188, -0.2890195, 2.161376, 1, 1, 1, 1, 1,
1.375395, -0.7812079, 2.732105, 1, 1, 1, 1, 1,
1.37763, -1.557184, 2.645046, 1, 1, 1, 1, 1,
1.380361, 2.050246, -0.7324597, 1, 1, 1, 1, 1,
1.389502, -1.348529, 2.661878, 1, 1, 1, 1, 1,
1.394426, 0.3709376, 1.346227, 1, 1, 1, 1, 1,
1.396365, -0.9498323, 2.086193, 1, 1, 1, 1, 1,
1.402294, 0.3801026, -0.07156649, 1, 1, 1, 1, 1,
1.414805, -0.480536, 2.361975, 1, 1, 1, 1, 1,
1.423952, 0.1169955, 2.035519, 1, 1, 1, 1, 1,
1.430333, -0.8058366, 2.864214, 1, 1, 1, 1, 1,
1.432083, 2.374117, 2.181019, 1, 1, 1, 1, 1,
1.432574, 0.2686447, -0.4237774, 0, 0, 1, 1, 1,
1.435993, 0.5584697, 2.175037, 1, 0, 0, 1, 1,
1.448904, -0.3779604, 1.247662, 1, 0, 0, 1, 1,
1.4502, 1.125147, 1.391717, 1, 0, 0, 1, 1,
1.458687, 0.4552969, -0.6548926, 1, 0, 0, 1, 1,
1.459667, -0.7247813, 2.602181, 1, 0, 0, 1, 1,
1.46413, -2.036974, 2.912733, 0, 0, 0, 1, 1,
1.468671, -1.1669, 2.704699, 0, 0, 0, 1, 1,
1.469263, 0.315409, -0.1493049, 0, 0, 0, 1, 1,
1.479571, -1.010313, 0.4836802, 0, 0, 0, 1, 1,
1.503468, -0.06987267, 0.9700472, 0, 0, 0, 1, 1,
1.504718, -0.7494759, 3.057627, 0, 0, 0, 1, 1,
1.5105, -0.5330218, 3.805661, 0, 0, 0, 1, 1,
1.527319, -0.7307929, 1.180837, 1, 1, 1, 1, 1,
1.530781, -0.6231591, 2.192656, 1, 1, 1, 1, 1,
1.541927, -1.164918, 1.84726, 1, 1, 1, 1, 1,
1.555165, 1.388765, 1.365558, 1, 1, 1, 1, 1,
1.564657, 0.4415093, 3.794323, 1, 1, 1, 1, 1,
1.571547, 0.05243634, 2.021635, 1, 1, 1, 1, 1,
1.577667, 0.8594993, 0.9028412, 1, 1, 1, 1, 1,
1.579674, 0.7563627, 1.956542, 1, 1, 1, 1, 1,
1.622337, -0.4110584, 0.5040743, 1, 1, 1, 1, 1,
1.641605, 0.7359372, -1.310385, 1, 1, 1, 1, 1,
1.643209, -0.9599164, 3.166533, 1, 1, 1, 1, 1,
1.643969, 0.3049917, 0.7513909, 1, 1, 1, 1, 1,
1.646357, -0.7404462, 2.316943, 1, 1, 1, 1, 1,
1.657774, 0.6624196, -0.002598679, 1, 1, 1, 1, 1,
1.664102, -0.9739971, 1.336418, 1, 1, 1, 1, 1,
1.664472, 1.64349, 1.666491, 0, 0, 1, 1, 1,
1.672863, -0.3249254, 1.734018, 1, 0, 0, 1, 1,
1.676568, -0.5114466, 0.3191976, 1, 0, 0, 1, 1,
1.6845, -0.322654, 0.7447723, 1, 0, 0, 1, 1,
1.705161, -0.4665224, 2.893325, 1, 0, 0, 1, 1,
1.729128, -0.3890309, 3.850704, 1, 0, 0, 1, 1,
1.741083, -0.7976114, 1.579667, 0, 0, 0, 1, 1,
1.776419, 0.9309307, 0.3826623, 0, 0, 0, 1, 1,
1.79528, 0.7608665, 1.367501, 0, 0, 0, 1, 1,
1.80819, 0.2617345, 0.7701002, 0, 0, 0, 1, 1,
1.815341, -0.6087301, 4.372689, 0, 0, 0, 1, 1,
1.815448, 1.115939, 1.535097, 0, 0, 0, 1, 1,
1.818505, 0.8799452, 2.579577, 0, 0, 0, 1, 1,
1.820479, -2.21483, 2.008898, 1, 1, 1, 1, 1,
1.84313, -0.08308173, 0.1495609, 1, 1, 1, 1, 1,
1.857004, 0.9404254, 1.18189, 1, 1, 1, 1, 1,
1.890443, -0.4746091, 2.899461, 1, 1, 1, 1, 1,
1.903558, -1.07231, 2.0874, 1, 1, 1, 1, 1,
1.913014, -0.8380097, 0.834016, 1, 1, 1, 1, 1,
1.923933, 0.324266, 2.089559, 1, 1, 1, 1, 1,
1.931084, -0.1257106, -0.09074485, 1, 1, 1, 1, 1,
1.932981, -1.391648, 1.810313, 1, 1, 1, 1, 1,
1.960007, -1.454205, 4.192426, 1, 1, 1, 1, 1,
1.990095, -0.1338272, 1.066361, 1, 1, 1, 1, 1,
1.996385, -0.081065, 1.213886, 1, 1, 1, 1, 1,
2.011108, -0.2203607, 1.374232, 1, 1, 1, 1, 1,
2.01329, 0.7048984, 3.684634, 1, 1, 1, 1, 1,
2.014701, -0.7399837, 1.911894, 1, 1, 1, 1, 1,
2.017372, -0.3337225, 3.165565, 0, 0, 1, 1, 1,
2.027579, 0.7622053, 1.475996, 1, 0, 0, 1, 1,
2.051347, 0.4397845, -0.110339, 1, 0, 0, 1, 1,
2.079735, 0.4419922, 2.682019, 1, 0, 0, 1, 1,
2.139352, 0.752194, -0.7397842, 1, 0, 0, 1, 1,
2.182295, -1.359713, 2.991238, 1, 0, 0, 1, 1,
2.183673, -0.2837718, 1.069175, 0, 0, 0, 1, 1,
2.193296, 0.3577554, 1.06628, 0, 0, 0, 1, 1,
2.236435, -0.3006946, 1.757681, 0, 0, 0, 1, 1,
2.282663, -0.3535313, 2.38323, 0, 0, 0, 1, 1,
2.301533, 0.3292208, 1.789264, 0, 0, 0, 1, 1,
2.33206, -0.5360668, 1.315761, 0, 0, 0, 1, 1,
2.363812, -0.1817079, 2.1415, 0, 0, 0, 1, 1,
2.425144, 0.2854204, 1.676201, 1, 1, 1, 1, 1,
2.430191, -1.637879, 3.510298, 1, 1, 1, 1, 1,
2.702055, 1.184723, 0.2165859, 1, 1, 1, 1, 1,
2.703671, 0.2342876, 1.541073, 1, 1, 1, 1, 1,
2.75991, -0.4541933, 2.763268, 1, 1, 1, 1, 1,
3.141438, -0.6578745, 1.776614, 1, 1, 1, 1, 1,
3.265801, -0.08516753, 2.617289, 1, 1, 1, 1, 1
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
var radius = 10.20683;
var distance = 35.85106;
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
mvMatrix.translate( -0.1072497, -0.1872268, -0.04533577 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.85106);
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
