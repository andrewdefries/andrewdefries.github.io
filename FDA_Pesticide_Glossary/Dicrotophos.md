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
-2.714324, 0.7637802, -0.6301516, 1, 0, 0, 1,
-2.6536, -1.190447, -0.5992208, 1, 0.007843138, 0, 1,
-2.59571, 0.0558235, -1.673365, 1, 0.01176471, 0, 1,
-2.527042, -0.1812711, -1.437329, 1, 0.01960784, 0, 1,
-2.492862, -0.7108501, -2.109475, 1, 0.02352941, 0, 1,
-2.440293, -1.05126, -2.595849, 1, 0.03137255, 0, 1,
-2.392575, -1.258228, -2.121875, 1, 0.03529412, 0, 1,
-2.385095, -1.594495, -2.569679, 1, 0.04313726, 0, 1,
-2.342833, -1.358192, -2.336617, 1, 0.04705882, 0, 1,
-2.316823, -1.428166, -1.908099, 1, 0.05490196, 0, 1,
-2.275003, -2.112219, -1.865363, 1, 0.05882353, 0, 1,
-2.219857, -0.2244547, -1.672249, 1, 0.06666667, 0, 1,
-2.17819, -0.8753209, -3.819965, 1, 0.07058824, 0, 1,
-2.151288, 2.205273, 0.1441113, 1, 0.07843138, 0, 1,
-2.14778, 0.1292283, -0.7816639, 1, 0.08235294, 0, 1,
-2.134745, -2.103851, -0.5388607, 1, 0.09019608, 0, 1,
-2.090373, 0.994256, 0.06047595, 1, 0.09411765, 0, 1,
-2.07632, 0.06606744, -2.096211, 1, 0.1019608, 0, 1,
-2.05854, 0.5224018, -3.151259, 1, 0.1098039, 0, 1,
-2.033477, -0.9314439, -2.80635, 1, 0.1137255, 0, 1,
-2.032771, -1.909278, -3.09589, 1, 0.1215686, 0, 1,
-2.031549, 1.364636, -2.423613, 1, 0.1254902, 0, 1,
-2.017328, -0.4347215, 0.1071901, 1, 0.1333333, 0, 1,
-2.012167, 0.05096508, -1.285923, 1, 0.1372549, 0, 1,
-1.978852, -0.03756927, -1.169339, 1, 0.145098, 0, 1,
-1.97174, -1.660964, -1.970973, 1, 0.1490196, 0, 1,
-1.969875, -0.7023864, -2.746053, 1, 0.1568628, 0, 1,
-1.95563, 1.07341, -2.328967, 1, 0.1607843, 0, 1,
-1.920991, 0.6818586, -1.582571, 1, 0.1686275, 0, 1,
-1.913067, 1.605845, -0.07013719, 1, 0.172549, 0, 1,
-1.907418, -0.5080236, -2.797015, 1, 0.1803922, 0, 1,
-1.901969, 0.4917302, -2.067435, 1, 0.1843137, 0, 1,
-1.871008, 0.4028022, -1.969922, 1, 0.1921569, 0, 1,
-1.868898, -1.680891, -0.6050537, 1, 0.1960784, 0, 1,
-1.861225, -0.880789, -1.392513, 1, 0.2039216, 0, 1,
-1.858922, 0.04564362, -0.3135534, 1, 0.2117647, 0, 1,
-1.83198, -0.5529684, 0.9787661, 1, 0.2156863, 0, 1,
-1.820744, -0.6882067, -3.283149, 1, 0.2235294, 0, 1,
-1.816341, 0.3342137, 0.6585011, 1, 0.227451, 0, 1,
-1.785288, -1.072886, -2.204803, 1, 0.2352941, 0, 1,
-1.779678, 0.2471082, -1.511744, 1, 0.2392157, 0, 1,
-1.765553, 1.267126, -1.626041, 1, 0.2470588, 0, 1,
-1.763272, -0.1529477, -1.224115, 1, 0.2509804, 0, 1,
-1.741231, -1.328298, -1.273609, 1, 0.2588235, 0, 1,
-1.726523, -0.2386143, -1.173787, 1, 0.2627451, 0, 1,
-1.724344, 1.223034, -0.2480529, 1, 0.2705882, 0, 1,
-1.699033, -0.347396, -3.058528, 1, 0.2745098, 0, 1,
-1.692592, 1.611599, 0.1235379, 1, 0.282353, 0, 1,
-1.671941, 0.4742804, -2.170349, 1, 0.2862745, 0, 1,
-1.662645, 0.6651355, -0.5510536, 1, 0.2941177, 0, 1,
-1.653769, -0.5075098, -1.18472, 1, 0.3019608, 0, 1,
-1.640394, -0.1958971, -0.9583048, 1, 0.3058824, 0, 1,
-1.634022, -0.3660535, 0.1364453, 1, 0.3137255, 0, 1,
-1.628171, 1.513365, -1.650428, 1, 0.3176471, 0, 1,
-1.626561, -2.291721, -2.15534, 1, 0.3254902, 0, 1,
-1.622535, 0.3763905, -2.89078, 1, 0.3294118, 0, 1,
-1.618596, -0.07636619, -1.20365, 1, 0.3372549, 0, 1,
-1.615872, 1.577773, -0.9910765, 1, 0.3411765, 0, 1,
-1.612186, 0.7476342, -1.474334, 1, 0.3490196, 0, 1,
-1.595413, -0.006459658, -1.357595, 1, 0.3529412, 0, 1,
-1.584875, -0.618606, -0.3667015, 1, 0.3607843, 0, 1,
-1.565936, 1.602006, -1.662235, 1, 0.3647059, 0, 1,
-1.563076, 0.2036505, -0.3206174, 1, 0.372549, 0, 1,
-1.55712, -1.225449, -2.581316, 1, 0.3764706, 0, 1,
-1.556915, 0.3795757, -1.769157, 1, 0.3843137, 0, 1,
-1.54175, 2.196319, -0.105484, 1, 0.3882353, 0, 1,
-1.525073, -0.7777072, -3.856942, 1, 0.3960784, 0, 1,
-1.525022, -0.6756914, -2.374529, 1, 0.4039216, 0, 1,
-1.521223, -1.107311, -1.556877, 1, 0.4078431, 0, 1,
-1.506532, -0.8332899, -2.137287, 1, 0.4156863, 0, 1,
-1.504113, -1.518826, -2.566494, 1, 0.4196078, 0, 1,
-1.500847, 0.7873101, -0.7933409, 1, 0.427451, 0, 1,
-1.495132, 0.2139654, -3.029686, 1, 0.4313726, 0, 1,
-1.491543, 0.5022365, -1.418054, 1, 0.4392157, 0, 1,
-1.489227, 0.7409792, -0.220717, 1, 0.4431373, 0, 1,
-1.477112, 0.1746733, -1.507929, 1, 0.4509804, 0, 1,
-1.474515, 0.886878, -2.899348, 1, 0.454902, 0, 1,
-1.453599, 1.99485, -1.633566, 1, 0.4627451, 0, 1,
-1.447929, -0.8898296, 1.21792, 1, 0.4666667, 0, 1,
-1.428095, 1.272798, -0.4239742, 1, 0.4745098, 0, 1,
-1.427444, -1.778931, -0.7622226, 1, 0.4784314, 0, 1,
-1.420462, -0.342766, -2.299348, 1, 0.4862745, 0, 1,
-1.406404, 0.02996553, -0.6674547, 1, 0.4901961, 0, 1,
-1.399939, 0.9786083, -0.08398055, 1, 0.4980392, 0, 1,
-1.392603, -0.417683, -1.675399, 1, 0.5058824, 0, 1,
-1.384393, -0.8125639, -1.045779, 1, 0.509804, 0, 1,
-1.369328, 2.301938, -0.5707954, 1, 0.5176471, 0, 1,
-1.359974, -0.3151786, -3.308144, 1, 0.5215687, 0, 1,
-1.350731, 1.802346, 0.4962754, 1, 0.5294118, 0, 1,
-1.336128, 0.6749603, -1.856782, 1, 0.5333334, 0, 1,
-1.332781, -1.077909, -2.937918, 1, 0.5411765, 0, 1,
-1.332609, 0.3481158, -1.46259, 1, 0.5450981, 0, 1,
-1.316704, 1.848226, -0.8117269, 1, 0.5529412, 0, 1,
-1.309297, 0.6244802, -0.654929, 1, 0.5568628, 0, 1,
-1.307306, -0.1668461, -2.267992, 1, 0.5647059, 0, 1,
-1.300292, 2.104378, -0.6225421, 1, 0.5686275, 0, 1,
-1.296448, 0.3553846, -0.09944807, 1, 0.5764706, 0, 1,
-1.294009, -1.337349, -3.115944, 1, 0.5803922, 0, 1,
-1.293841, 0.05387996, -2.552845, 1, 0.5882353, 0, 1,
-1.270059, 3.084331, 0.1572195, 1, 0.5921569, 0, 1,
-1.256358, -0.6684008, -2.762656, 1, 0.6, 0, 1,
-1.251539, -2.333928, -2.013627, 1, 0.6078432, 0, 1,
-1.247918, -1.803082, -3.226438, 1, 0.6117647, 0, 1,
-1.246747, -1.750331, -2.095939, 1, 0.6196079, 0, 1,
-1.243034, 0.8670757, -0.01001484, 1, 0.6235294, 0, 1,
-1.242536, 0.1539752, -2.220948, 1, 0.6313726, 0, 1,
-1.229107, -0.9722522, -4.013638, 1, 0.6352941, 0, 1,
-1.222822, -1.43166, -2.378944, 1, 0.6431373, 0, 1,
-1.221458, 0.3604312, -1.233186, 1, 0.6470588, 0, 1,
-1.219481, -1.252526, -1.268274, 1, 0.654902, 0, 1,
-1.207864, 1.027976, -0.2718654, 1, 0.6588235, 0, 1,
-1.207854, -0.2238937, -2.064447, 1, 0.6666667, 0, 1,
-1.20616, -0.8531947, -2.964462, 1, 0.6705883, 0, 1,
-1.203764, 0.2815645, -1.80509, 1, 0.6784314, 0, 1,
-1.196945, 0.6953181, -1.167945, 1, 0.682353, 0, 1,
-1.186386, -0.2019297, -1.922793, 1, 0.6901961, 0, 1,
-1.185443, -0.3800138, -1.452898, 1, 0.6941177, 0, 1,
-1.184286, 0.7532697, -1.551461, 1, 0.7019608, 0, 1,
-1.18281, -2.023292, -3.904983, 1, 0.7098039, 0, 1,
-1.177313, -0.7207726, -2.111901, 1, 0.7137255, 0, 1,
-1.176704, 0.7918038, -0.769709, 1, 0.7215686, 0, 1,
-1.165011, 0.9281946, -1.593443, 1, 0.7254902, 0, 1,
-1.164897, -0.2285106, -1.332708, 1, 0.7333333, 0, 1,
-1.161928, -0.5259997, -4.102968, 1, 0.7372549, 0, 1,
-1.151417, -0.1378614, -1.21193, 1, 0.7450981, 0, 1,
-1.135716, 0.3490192, -1.401882, 1, 0.7490196, 0, 1,
-1.128447, -0.03789514, 0.1530453, 1, 0.7568628, 0, 1,
-1.110363, -0.4214577, -0.9503734, 1, 0.7607843, 0, 1,
-1.107059, -1.15025, -3.802574, 1, 0.7686275, 0, 1,
-1.105553, -1.145207, -2.47045, 1, 0.772549, 0, 1,
-1.095946, -1.653502, -1.485009, 1, 0.7803922, 0, 1,
-1.094003, -0.2810347, -3.984993, 1, 0.7843137, 0, 1,
-1.090127, 0.08395154, -2.742197, 1, 0.7921569, 0, 1,
-1.080013, 1.648469, -1.216711, 1, 0.7960784, 0, 1,
-1.076214, 1.640335, -1.920228, 1, 0.8039216, 0, 1,
-1.073367, 1.785927, 1.320204, 1, 0.8117647, 0, 1,
-1.059099, -0.7193565, -2.240043, 1, 0.8156863, 0, 1,
-1.045613, -0.1300202, -0.02528127, 1, 0.8235294, 0, 1,
-1.043018, 1.983787, 0.7583752, 1, 0.827451, 0, 1,
-1.04159, -0.5385351, -1.461472, 1, 0.8352941, 0, 1,
-1.027173, 0.4189029, -1.661917, 1, 0.8392157, 0, 1,
-1.0262, -0.7935349, -1.975636, 1, 0.8470588, 0, 1,
-1.026034, -0.2092236, -0.5346524, 1, 0.8509804, 0, 1,
-1.025393, 1.579569, 1.685683, 1, 0.8588235, 0, 1,
-1.020845, -1.542172, -1.889612, 1, 0.8627451, 0, 1,
-1.014363, 0.07619147, -0.5190542, 1, 0.8705882, 0, 1,
-1.014125, -0.5554414, -3.601764, 1, 0.8745098, 0, 1,
-1.010909, 0.2769148, -1.155595, 1, 0.8823529, 0, 1,
-1.008047, -0.4130946, -3.358521, 1, 0.8862745, 0, 1,
-1.005994, -0.6502869, -1.685799, 1, 0.8941177, 0, 1,
-1.004257, 0.4472482, -2.443893, 1, 0.8980392, 0, 1,
-0.995007, -0.6932247, -1.193636, 1, 0.9058824, 0, 1,
-0.9923324, 0.124066, -1.079623, 1, 0.9137255, 0, 1,
-0.9920284, 0.3319193, 0.9292645, 1, 0.9176471, 0, 1,
-0.9746561, -0.510807, -1.392484, 1, 0.9254902, 0, 1,
-0.9675922, -1.836355, -2.033062, 1, 0.9294118, 0, 1,
-0.9631502, 0.0006433864, -0.5103964, 1, 0.9372549, 0, 1,
-0.9564253, 0.2795355, 0.6819721, 1, 0.9411765, 0, 1,
-0.9551193, 1.192659, -0.9611912, 1, 0.9490196, 0, 1,
-0.9531353, 1.289498, 0.07610693, 1, 0.9529412, 0, 1,
-0.9452318, 2.608793, -0.5704722, 1, 0.9607843, 0, 1,
-0.9390697, -1.029294, -1.775515, 1, 0.9647059, 0, 1,
-0.9390421, -0.468888, -1.541466, 1, 0.972549, 0, 1,
-0.9336676, 1.235332, -0.8010404, 1, 0.9764706, 0, 1,
-0.9232416, 0.8845336, -1.061376, 1, 0.9843137, 0, 1,
-0.9184319, 1.387372, -1.040785, 1, 0.9882353, 0, 1,
-0.916361, -0.7358825, -2.003656, 1, 0.9960784, 0, 1,
-0.9132553, -0.2618003, -0.8969775, 0.9960784, 1, 0, 1,
-0.9111628, -2.29305, -2.078174, 0.9921569, 1, 0, 1,
-0.9103885, -0.2431603, -4.291665, 0.9843137, 1, 0, 1,
-0.9097879, -0.03532742, -2.56592, 0.9803922, 1, 0, 1,
-0.9038666, 0.2227582, -1.753333, 0.972549, 1, 0, 1,
-0.9011058, 1.020372, -1.698904, 0.9686275, 1, 0, 1,
-0.8943008, 0.9256111, -0.1044715, 0.9607843, 1, 0, 1,
-0.8940557, 0.07014959, -1.255556, 0.9568627, 1, 0, 1,
-0.8783411, -0.7350785, -3.001618, 0.9490196, 1, 0, 1,
-0.8760265, 0.3765819, -3.398988, 0.945098, 1, 0, 1,
-0.8708189, 0.1122267, -0.9280217, 0.9372549, 1, 0, 1,
-0.8692701, -0.4079842, -1.190843, 0.9333333, 1, 0, 1,
-0.8663259, 0.4234496, -1.715318, 0.9254902, 1, 0, 1,
-0.8653149, 1.546989, -0.8396517, 0.9215686, 1, 0, 1,
-0.8650851, 1.525812, -0.1864184, 0.9137255, 1, 0, 1,
-0.8639853, -0.4786136, -1.954067, 0.9098039, 1, 0, 1,
-0.8638052, -2.292559, -1.744078, 0.9019608, 1, 0, 1,
-0.861927, -0.04554116, -1.553038, 0.8941177, 1, 0, 1,
-0.8552666, -0.874927, -3.270016, 0.8901961, 1, 0, 1,
-0.8551247, -0.5569125, -4.216876, 0.8823529, 1, 0, 1,
-0.8464488, -1.22816, -4.524852, 0.8784314, 1, 0, 1,
-0.8423778, 0.6253924, -1.513573, 0.8705882, 1, 0, 1,
-0.8397529, -0.6665852, -2.004169, 0.8666667, 1, 0, 1,
-0.8372433, 0.9104681, -1.619592, 0.8588235, 1, 0, 1,
-0.8306215, -0.940683, -3.07007, 0.854902, 1, 0, 1,
-0.8251151, 1.634951, -0.1066303, 0.8470588, 1, 0, 1,
-0.8250954, -0.2524734, -3.134678, 0.8431373, 1, 0, 1,
-0.8174309, 1.751939, -0.3748504, 0.8352941, 1, 0, 1,
-0.8147556, -0.8561447, -3.053538, 0.8313726, 1, 0, 1,
-0.8133537, -0.9211717, -1.099893, 0.8235294, 1, 0, 1,
-0.8107862, 0.02081474, -1.190017, 0.8196079, 1, 0, 1,
-0.8064266, 0.007474717, -0.6805326, 0.8117647, 1, 0, 1,
-0.8041509, -0.4502429, -2.964883, 0.8078431, 1, 0, 1,
-0.8019944, -1.04732, -0.5023268, 0.8, 1, 0, 1,
-0.790171, 0.4923544, -3.129415, 0.7921569, 1, 0, 1,
-0.7875701, -1.706433, -3.586937, 0.7882353, 1, 0, 1,
-0.7852533, -0.3062407, -2.079003, 0.7803922, 1, 0, 1,
-0.7852338, 0.4319716, 0.06782354, 0.7764706, 1, 0, 1,
-0.7843419, -0.5555804, -2.757419, 0.7686275, 1, 0, 1,
-0.7825588, 0.8259017, -0.5410625, 0.7647059, 1, 0, 1,
-0.7815641, -0.5437421, 0.09730127, 0.7568628, 1, 0, 1,
-0.7802479, 0.9255884, -0.2826949, 0.7529412, 1, 0, 1,
-0.7761335, -0.3954218, -2.711922, 0.7450981, 1, 0, 1,
-0.7614163, -1.555076, -1.685602, 0.7411765, 1, 0, 1,
-0.7606222, -0.09353814, -2.909047, 0.7333333, 1, 0, 1,
-0.7591265, 1.188731, -1.757847, 0.7294118, 1, 0, 1,
-0.7571505, 0.3470409, -1.300017, 0.7215686, 1, 0, 1,
-0.755452, 0.7018118, -0.5287514, 0.7176471, 1, 0, 1,
-0.7514371, 1.126713, 0.6040817, 0.7098039, 1, 0, 1,
-0.7474145, -0.3913726, -1.074555, 0.7058824, 1, 0, 1,
-0.742732, 1.212343, 0.2382394, 0.6980392, 1, 0, 1,
-0.7379115, 1.084744, 1.205979, 0.6901961, 1, 0, 1,
-0.7361843, -1.308361, -2.439917, 0.6862745, 1, 0, 1,
-0.7349259, 0.8617929, -1.479503, 0.6784314, 1, 0, 1,
-0.7334062, 0.6142685, -1.139355, 0.6745098, 1, 0, 1,
-0.7299306, 0.8294792, -0.3814075, 0.6666667, 1, 0, 1,
-0.7269329, -0.7833546, -1.612842, 0.6627451, 1, 0, 1,
-0.7222031, 1.266267, -0.6147947, 0.654902, 1, 0, 1,
-0.7213858, -0.1615351, -2.556903, 0.6509804, 1, 0, 1,
-0.7202891, -0.2468825, -2.54005, 0.6431373, 1, 0, 1,
-0.7181701, 0.7957268, -1.675021, 0.6392157, 1, 0, 1,
-0.7112241, 0.8767829, -1.754087, 0.6313726, 1, 0, 1,
-0.7095047, 1.701412, -1.667601, 0.627451, 1, 0, 1,
-0.7039285, 0.8029379, -0.8000556, 0.6196079, 1, 0, 1,
-0.6927767, -0.2729232, -1.837156, 0.6156863, 1, 0, 1,
-0.6904336, -1.408273, -2.281052, 0.6078432, 1, 0, 1,
-0.6868147, 1.145401, 0.3382746, 0.6039216, 1, 0, 1,
-0.6864918, -1.586275, -1.895365, 0.5960785, 1, 0, 1,
-0.6854616, 3.047024, -0.2327038, 0.5882353, 1, 0, 1,
-0.6853443, 0.1263401, -0.4552099, 0.5843138, 1, 0, 1,
-0.6834965, 0.4029783, -1.016137, 0.5764706, 1, 0, 1,
-0.681495, 1.390702, -1.836809, 0.572549, 1, 0, 1,
-0.6796883, 0.7008004, -2.447014, 0.5647059, 1, 0, 1,
-0.6758211, -0.9241894, -3.454597, 0.5607843, 1, 0, 1,
-0.6744239, -0.3257733, -3.277019, 0.5529412, 1, 0, 1,
-0.670391, 0.4385983, -1.099316, 0.5490196, 1, 0, 1,
-0.6700732, -0.3373879, -2.525361, 0.5411765, 1, 0, 1,
-0.6690912, 1.011933, -1.635139, 0.5372549, 1, 0, 1,
-0.6686217, 0.1312007, -1.387308, 0.5294118, 1, 0, 1,
-0.6655073, -0.1736947, -1.361035, 0.5254902, 1, 0, 1,
-0.6555475, 0.384611, -2.362369, 0.5176471, 1, 0, 1,
-0.6555345, -2.713286, -1.904539, 0.5137255, 1, 0, 1,
-0.6529165, 0.8026891, -2.168618, 0.5058824, 1, 0, 1,
-0.6471415, 0.4610362, -1.297481, 0.5019608, 1, 0, 1,
-0.6415896, 0.6224069, -0.6624152, 0.4941176, 1, 0, 1,
-0.6405894, 1.544584, 1.083534, 0.4862745, 1, 0, 1,
-0.6305674, -1.123695, -2.958606, 0.4823529, 1, 0, 1,
-0.6269046, -0.1446746, -0.9326883, 0.4745098, 1, 0, 1,
-0.6262948, 1.594926, -0.5735516, 0.4705882, 1, 0, 1,
-0.6259041, -1.400488, -3.564275, 0.4627451, 1, 0, 1,
-0.6254592, -0.3776791, -3.280136, 0.4588235, 1, 0, 1,
-0.6242206, -1.334311, -1.057875, 0.4509804, 1, 0, 1,
-0.6239561, -0.1972864, -2.049765, 0.4470588, 1, 0, 1,
-0.6226217, -0.01315513, -0.7324324, 0.4392157, 1, 0, 1,
-0.6181399, -1.134013, -3.452975, 0.4352941, 1, 0, 1,
-0.6127967, 1.413404, -1.512097, 0.427451, 1, 0, 1,
-0.6066186, 1.893956, 0.3939908, 0.4235294, 1, 0, 1,
-0.6061066, 0.2725888, -0.1123447, 0.4156863, 1, 0, 1,
-0.6032161, 2.162494, 1.081394, 0.4117647, 1, 0, 1,
-0.6018349, -1.442596, -2.514203, 0.4039216, 1, 0, 1,
-0.6015176, 1.481816, -0.9535583, 0.3960784, 1, 0, 1,
-0.5999086, -0.2413563, -2.528485, 0.3921569, 1, 0, 1,
-0.5996628, 0.2438616, -0.7999318, 0.3843137, 1, 0, 1,
-0.5984142, 0.7612323, 3.610387e-05, 0.3803922, 1, 0, 1,
-0.597521, 0.4492153, -0.2400564, 0.372549, 1, 0, 1,
-0.5922952, -2.050088, -3.081853, 0.3686275, 1, 0, 1,
-0.5914791, 1.660593, -1.106529, 0.3607843, 1, 0, 1,
-0.5883424, -0.7176237, -3.459587, 0.3568628, 1, 0, 1,
-0.5819575, -1.543775, -2.372163, 0.3490196, 1, 0, 1,
-0.5783808, -1.017748, 0.428674, 0.345098, 1, 0, 1,
-0.577875, 0.7634336, 0.119983, 0.3372549, 1, 0, 1,
-0.5778633, -2.227271, -2.497085, 0.3333333, 1, 0, 1,
-0.5776634, 0.5742761, -0.7389304, 0.3254902, 1, 0, 1,
-0.5775687, -1.438377, -1.871213, 0.3215686, 1, 0, 1,
-0.5678489, 0.7763512, -1.553535, 0.3137255, 1, 0, 1,
-0.5659255, -0.2713858, -2.659339, 0.3098039, 1, 0, 1,
-0.5624085, -0.03904663, -1.475783, 0.3019608, 1, 0, 1,
-0.5607679, -1.795604, -4.9404, 0.2941177, 1, 0, 1,
-0.5605426, 0.8947487, -1.540051, 0.2901961, 1, 0, 1,
-0.5590959, -0.2782246, -1.600258, 0.282353, 1, 0, 1,
-0.5577301, 1.37529, 0.357361, 0.2784314, 1, 0, 1,
-0.5544965, 0.2697183, -0.4877431, 0.2705882, 1, 0, 1,
-0.5542972, -0.3698813, -1.951346, 0.2666667, 1, 0, 1,
-0.552768, -0.5122497, -3.260523, 0.2588235, 1, 0, 1,
-0.5526673, -2.651087, -5.013036, 0.254902, 1, 0, 1,
-0.5516199, 0.8218513, -0.3607343, 0.2470588, 1, 0, 1,
-0.5511751, 2.149673, 0.1247757, 0.2431373, 1, 0, 1,
-0.5509313, -0.1252556, -1.057364, 0.2352941, 1, 0, 1,
-0.549519, -0.5809628, -2.735689, 0.2313726, 1, 0, 1,
-0.547979, -2.423527, -3.004102, 0.2235294, 1, 0, 1,
-0.5447485, -0.2970078, -2.492973, 0.2196078, 1, 0, 1,
-0.5400386, -3.148454, -2.420959, 0.2117647, 1, 0, 1,
-0.5387127, 1.543171, 1.094373, 0.2078431, 1, 0, 1,
-0.5365428, -0.1699783, -2.668215, 0.2, 1, 0, 1,
-0.5323074, -0.7273762, -2.305485, 0.1921569, 1, 0, 1,
-0.5320999, -0.5420591, -1.006371, 0.1882353, 1, 0, 1,
-0.5314973, 0.06496345, -0.1012351, 0.1803922, 1, 0, 1,
-0.5314539, -0.112029, -2.471521, 0.1764706, 1, 0, 1,
-0.5296208, -0.4708493, -2.277062, 0.1686275, 1, 0, 1,
-0.5272923, 0.2275123, -1.513215, 0.1647059, 1, 0, 1,
-0.5240272, -0.2415457, -2.820959, 0.1568628, 1, 0, 1,
-0.5227076, 0.4420241, -1.44244, 0.1529412, 1, 0, 1,
-0.5177458, 0.4008039, -0.4388618, 0.145098, 1, 0, 1,
-0.5150511, -1.043845, -3.098676, 0.1411765, 1, 0, 1,
-0.514464, 0.8695015, -1.421699, 0.1333333, 1, 0, 1,
-0.5123718, 0.3699421, -1.341817, 0.1294118, 1, 0, 1,
-0.5045903, -0.1104669, -1.055527, 0.1215686, 1, 0, 1,
-0.5043927, -0.321098, -2.880245, 0.1176471, 1, 0, 1,
-0.4990919, 1.379252, 0.4893089, 0.1098039, 1, 0, 1,
-0.4986533, 0.1053268, 0.5704421, 0.1058824, 1, 0, 1,
-0.4948034, -1.308894, -3.726217, 0.09803922, 1, 0, 1,
-0.4922908, 1.537915, 0.4557445, 0.09019608, 1, 0, 1,
-0.4893949, -0.9421842, -3.478131, 0.08627451, 1, 0, 1,
-0.4880563, 0.6468838, 0.1770734, 0.07843138, 1, 0, 1,
-0.4789416, 0.3768414, 0.7915634, 0.07450981, 1, 0, 1,
-0.4763762, 0.8040231, -1.233858, 0.06666667, 1, 0, 1,
-0.4741604, -0.07920873, -1.481316, 0.0627451, 1, 0, 1,
-0.4709235, -1.286514, -2.031987, 0.05490196, 1, 0, 1,
-0.4702536, 0.04268534, -0.7924284, 0.05098039, 1, 0, 1,
-0.468158, 0.3044643, -0.2463959, 0.04313726, 1, 0, 1,
-0.4656723, -1.145457, -1.170239, 0.03921569, 1, 0, 1,
-0.4655587, -1.076879, -3.650672, 0.03137255, 1, 0, 1,
-0.465417, 0.03181989, -3.408796, 0.02745098, 1, 0, 1,
-0.4645911, 0.9427, -0.539699, 0.01960784, 1, 0, 1,
-0.4605371, 0.07422978, -2.449934, 0.01568628, 1, 0, 1,
-0.4584701, -0.8056579, -3.091711, 0.007843138, 1, 0, 1,
-0.4572249, -0.3132105, -1.799975, 0.003921569, 1, 0, 1,
-0.4470536, -0.5447711, -2.479349, 0, 1, 0.003921569, 1,
-0.4360831, 0.9485649, 1.360832, 0, 1, 0.01176471, 1,
-0.4347217, -1.114615, -2.355313, 0, 1, 0.01568628, 1,
-0.434671, -1.166708, -4.028468, 0, 1, 0.02352941, 1,
-0.4344141, -1.984436, -2.946119, 0, 1, 0.02745098, 1,
-0.4316908, 0.2888489, -0.06382088, 0, 1, 0.03529412, 1,
-0.4289228, -0.0683991, -2.158184, 0, 1, 0.03921569, 1,
-0.426101, 0.1310214, -1.890598, 0, 1, 0.04705882, 1,
-0.4242786, 0.3449791, -1.338709, 0, 1, 0.05098039, 1,
-0.4187685, -0.8329092, -2.913248, 0, 1, 0.05882353, 1,
-0.4150756, -0.6444506, -2.607471, 0, 1, 0.0627451, 1,
-0.4128755, -1.024883, -2.273082, 0, 1, 0.07058824, 1,
-0.4123726, 0.3913981, -0.8610931, 0, 1, 0.07450981, 1,
-0.4090048, 0.8621229, -0.2769157, 0, 1, 0.08235294, 1,
-0.4080492, -1.064594, -3.122181, 0, 1, 0.08627451, 1,
-0.3931538, 0.7554155, -1.044303, 0, 1, 0.09411765, 1,
-0.3922516, -0.3887427, -0.3934073, 0, 1, 0.1019608, 1,
-0.3893001, -0.5470908, -0.8830414, 0, 1, 0.1058824, 1,
-0.3859485, 0.8228628, -0.6062177, 0, 1, 0.1137255, 1,
-0.3803567, -0.2825023, -0.8475799, 0, 1, 0.1176471, 1,
-0.3764408, 0.531216, -0.6296172, 0, 1, 0.1254902, 1,
-0.3756351, -0.9678267, -2.884648, 0, 1, 0.1294118, 1,
-0.3722331, 0.149615, -1.888029, 0, 1, 0.1372549, 1,
-0.3700933, 1.672051, -0.2719356, 0, 1, 0.1411765, 1,
-0.3686448, 0.4468745, -1.073612, 0, 1, 0.1490196, 1,
-0.3676687, -0.5885403, -2.254077, 0, 1, 0.1529412, 1,
-0.3649717, -2.620042, -2.145223, 0, 1, 0.1607843, 1,
-0.3622379, -0.1419602, -1.487364, 0, 1, 0.1647059, 1,
-0.3598427, 0.798621, -0.740916, 0, 1, 0.172549, 1,
-0.3592164, -0.6429147, -2.880256, 0, 1, 0.1764706, 1,
-0.3577749, 0.07288004, 0.5492475, 0, 1, 0.1843137, 1,
-0.3458308, 2.28368, -1.343698, 0, 1, 0.1882353, 1,
-0.3444649, 0.1372919, -0.4427864, 0, 1, 0.1960784, 1,
-0.3363021, -1.92111, -4.289423, 0, 1, 0.2039216, 1,
-0.3351758, 1.858269, -1.199018, 0, 1, 0.2078431, 1,
-0.3325693, 0.8081149, -1.578428, 0, 1, 0.2156863, 1,
-0.3313844, -0.9885563, -4.640365, 0, 1, 0.2196078, 1,
-0.3277424, -0.9836357, -2.080231, 0, 1, 0.227451, 1,
-0.3232822, -1.091693, -2.820548, 0, 1, 0.2313726, 1,
-0.3186704, -1.344891, -3.797264, 0, 1, 0.2392157, 1,
-0.3154078, 0.04909808, 0.486213, 0, 1, 0.2431373, 1,
-0.3116781, 1.735654, 0.6421583, 0, 1, 0.2509804, 1,
-0.3093665, 0.5340846, -1.929276, 0, 1, 0.254902, 1,
-0.3053575, 0.2182066, 0.2217922, 0, 1, 0.2627451, 1,
-0.3038274, -0.4750027, -2.827466, 0, 1, 0.2666667, 1,
-0.3033483, 0.111233, -1.791873, 0, 1, 0.2745098, 1,
-0.3028021, 0.0794846, -0.2637966, 0, 1, 0.2784314, 1,
-0.3021462, 1.043089, -0.2973095, 0, 1, 0.2862745, 1,
-0.3015903, -1.191942, -3.714684, 0, 1, 0.2901961, 1,
-0.3006074, -0.09883179, -1.306427, 0, 1, 0.2980392, 1,
-0.2970961, 0.463789, 0.3016622, 0, 1, 0.3058824, 1,
-0.2957868, -0.3682875, -0.556434, 0, 1, 0.3098039, 1,
-0.2952263, -0.8260906, -3.000307, 0, 1, 0.3176471, 1,
-0.2855313, -0.03069206, -2.212738, 0, 1, 0.3215686, 1,
-0.2781588, -0.279832, -2.031316, 0, 1, 0.3294118, 1,
-0.2763116, 0.8432012, 0.8484547, 0, 1, 0.3333333, 1,
-0.2756843, -0.3195838, -2.598801, 0, 1, 0.3411765, 1,
-0.2703502, 2.448439, -1.571436, 0, 1, 0.345098, 1,
-0.2656798, -0.005125596, -2.985949, 0, 1, 0.3529412, 1,
-0.2600177, 2.921573, -0.04881744, 0, 1, 0.3568628, 1,
-0.2547072, -1.340077, -3.205061, 0, 1, 0.3647059, 1,
-0.2504311, -0.7444231, -3.771103, 0, 1, 0.3686275, 1,
-0.246964, 1.218002, 0.8389654, 0, 1, 0.3764706, 1,
-0.2436541, -0.7133984, -2.983199, 0, 1, 0.3803922, 1,
-0.2422658, -0.4706842, -1.895957, 0, 1, 0.3882353, 1,
-0.2372124, -1.641085, -2.719219, 0, 1, 0.3921569, 1,
-0.2358343, -0.9546664, -4.644411, 0, 1, 0.4, 1,
-0.226225, -1.935194, -2.60152, 0, 1, 0.4078431, 1,
-0.2218539, -0.5291058, -4.369034, 0, 1, 0.4117647, 1,
-0.2186176, -0.01108772, -1.425221, 0, 1, 0.4196078, 1,
-0.2183551, 0.2069992, -2.183176, 0, 1, 0.4235294, 1,
-0.2140526, 0.1519398, 0.5557638, 0, 1, 0.4313726, 1,
-0.2126888, 0.01842554, -1.428085, 0, 1, 0.4352941, 1,
-0.2125859, 0.7541115, 0.6499615, 0, 1, 0.4431373, 1,
-0.2102458, -1.384292, -2.802005, 0, 1, 0.4470588, 1,
-0.2095547, 0.6377903, -1.024596, 0, 1, 0.454902, 1,
-0.2090641, -1.149977, -5.050189, 0, 1, 0.4588235, 1,
-0.2087167, 1.192934, 2.06314, 0, 1, 0.4666667, 1,
-0.2086911, 1.737551, -0.041333, 0, 1, 0.4705882, 1,
-0.2029855, 0.921762, -0.08172909, 0, 1, 0.4784314, 1,
-0.1979989, -1.071305, -3.896569, 0, 1, 0.4823529, 1,
-0.1924467, 1.503186, 0.3189386, 0, 1, 0.4901961, 1,
-0.1913169, -1.771423, -4.186192, 0, 1, 0.4941176, 1,
-0.1907689, 0.1992943, -0.07379989, 0, 1, 0.5019608, 1,
-0.1907153, -0.2141035, -2.628471, 0, 1, 0.509804, 1,
-0.1887502, 0.6760619, -1.029552, 0, 1, 0.5137255, 1,
-0.186882, -0.9321663, -2.139728, 0, 1, 0.5215687, 1,
-0.1867221, 0.414396, 1.199731, 0, 1, 0.5254902, 1,
-0.1835704, -0.336892, -2.339574, 0, 1, 0.5333334, 1,
-0.1830785, 0.75122, -0.769181, 0, 1, 0.5372549, 1,
-0.1806272, -0.08012579, -0.8764092, 0, 1, 0.5450981, 1,
-0.1794655, 1.083733, -0.6662415, 0, 1, 0.5490196, 1,
-0.177392, -0.1316998, -2.443975, 0, 1, 0.5568628, 1,
-0.1733995, -0.2831769, -3.741369, 0, 1, 0.5607843, 1,
-0.1693649, -1.821384, -3.235738, 0, 1, 0.5686275, 1,
-0.1637485, -1.51739, -2.320252, 0, 1, 0.572549, 1,
-0.1605632, 0.5503442, 0.04107624, 0, 1, 0.5803922, 1,
-0.1588159, 0.1525439, -0.6407984, 0, 1, 0.5843138, 1,
-0.1547728, -0.9412671, -1.985116, 0, 1, 0.5921569, 1,
-0.1516319, -0.4685545, -3.196269, 0, 1, 0.5960785, 1,
-0.1515985, -0.2802495, -2.291075, 0, 1, 0.6039216, 1,
-0.1495356, -0.5360215, -2.81396, 0, 1, 0.6117647, 1,
-0.1483347, -1.134766, -3.139799, 0, 1, 0.6156863, 1,
-0.1481819, -0.8449004, -6.201571, 0, 1, 0.6235294, 1,
-0.1466862, -2.273323, -2.260735, 0, 1, 0.627451, 1,
-0.1424551, -0.5870708, -3.460829, 0, 1, 0.6352941, 1,
-0.1420301, -0.3567146, -0.6605452, 0, 1, 0.6392157, 1,
-0.1414304, 1.21946, 1.603786, 0, 1, 0.6470588, 1,
-0.1394705, -0.335509, -1.510918, 0, 1, 0.6509804, 1,
-0.139018, -0.2803074, -2.176307, 0, 1, 0.6588235, 1,
-0.1360658, 1.0034, -1.404185, 0, 1, 0.6627451, 1,
-0.1349145, 0.586448, -0.7871559, 0, 1, 0.6705883, 1,
-0.1322225, 0.04628607, -0.7902564, 0, 1, 0.6745098, 1,
-0.1290039, -0.6557965, -3.254085, 0, 1, 0.682353, 1,
-0.1264162, 0.02384537, -1.999609, 0, 1, 0.6862745, 1,
-0.1251389, 2.579781, 0.627032, 0, 1, 0.6941177, 1,
-0.1242726, -0.4190117, -3.884966, 0, 1, 0.7019608, 1,
-0.1216024, 0.05675202, -0.3795105, 0, 1, 0.7058824, 1,
-0.1190546, 0.8376816, -0.9946059, 0, 1, 0.7137255, 1,
-0.1164404, -0.1627274, -1.804346, 0, 1, 0.7176471, 1,
-0.1091677, 0.4489147, -0.3354884, 0, 1, 0.7254902, 1,
-0.1067672, 0.6763869, 0.4901626, 0, 1, 0.7294118, 1,
-0.1067301, -0.3472239, -1.73016, 0, 1, 0.7372549, 1,
-0.1025997, 0.7772735, 0.97855, 0, 1, 0.7411765, 1,
-0.1020546, -1.83294, -3.172563, 0, 1, 0.7490196, 1,
-0.1005472, 1.025011, -0.3881263, 0, 1, 0.7529412, 1,
-0.09909708, -0.5348737, -3.521346, 0, 1, 0.7607843, 1,
-0.09883941, 1.309058, 0.5330057, 0, 1, 0.7647059, 1,
-0.09365449, -0.3840412, -3.017059, 0, 1, 0.772549, 1,
-0.08655819, -0.2798603, -2.048354, 0, 1, 0.7764706, 1,
-0.08479647, -1.114372, -4.069604, 0, 1, 0.7843137, 1,
-0.08435237, 0.6052222, -0.2765734, 0, 1, 0.7882353, 1,
-0.08360516, -0.3031616, -2.70598, 0, 1, 0.7960784, 1,
-0.08359103, -0.3678651, -4.310639, 0, 1, 0.8039216, 1,
-0.08176038, 0.04164179, -1.134222, 0, 1, 0.8078431, 1,
-0.07416955, -1.290999, -2.809784, 0, 1, 0.8156863, 1,
-0.0696499, 0.6043565, 0.6229326, 0, 1, 0.8196079, 1,
-0.06678509, 0.190938, -1.124539, 0, 1, 0.827451, 1,
-0.06550617, 0.002391177, -0.846888, 0, 1, 0.8313726, 1,
-0.06260557, 0.02940295, -0.4810723, 0, 1, 0.8392157, 1,
-0.06099301, -0.7844376, -3.48777, 0, 1, 0.8431373, 1,
-0.05925779, 0.7285577, -1.056963, 0, 1, 0.8509804, 1,
-0.05804772, 1.739617, -0.4614049, 0, 1, 0.854902, 1,
-0.05729311, -0.03852114, -1.43892, 0, 1, 0.8627451, 1,
-0.05655577, 0.6700698, 1.406424, 0, 1, 0.8666667, 1,
-0.05406281, 0.1293653, 0.2635273, 0, 1, 0.8745098, 1,
-0.05353398, 1.771737, 0.2269462, 0, 1, 0.8784314, 1,
-0.05015856, 0.5409227, -0.1783448, 0, 1, 0.8862745, 1,
-0.04920905, 0.8726778, 0.234582, 0, 1, 0.8901961, 1,
-0.04782604, -0.2955741, -1.405806, 0, 1, 0.8980392, 1,
-0.04417748, -0.4527898, -3.886635, 0, 1, 0.9058824, 1,
-0.04208485, 0.0008116593, -1.494887, 0, 1, 0.9098039, 1,
-0.04008412, -0.8475836, -5.39629, 0, 1, 0.9176471, 1,
-0.03926265, -1.904247, -2.994563, 0, 1, 0.9215686, 1,
-0.03711413, -1.020135, -2.359555, 0, 1, 0.9294118, 1,
-0.03354998, -0.3339247, -3.16311, 0, 1, 0.9333333, 1,
-0.02565877, -0.3116892, -2.577129, 0, 1, 0.9411765, 1,
-0.02029141, 0.7875661, 1.820272, 0, 1, 0.945098, 1,
-0.01882768, -0.1468454, -3.2548, 0, 1, 0.9529412, 1,
-0.01671674, -0.09363832, -2.610434, 0, 1, 0.9568627, 1,
-0.01462658, -0.8181147, -2.503803, 0, 1, 0.9647059, 1,
-0.01165728, 2.748634, -1.307252, 0, 1, 0.9686275, 1,
-0.009850936, 0.4376944, 0.63613, 0, 1, 0.9764706, 1,
-0.007967244, -0.08173279, -1.924034, 0, 1, 0.9803922, 1,
-0.007509765, 1.494021, -1.322987, 0, 1, 0.9882353, 1,
-0.004700497, -1.092542, -3.415578, 0, 1, 0.9921569, 1,
-9.258179e-06, -2.297575, -3.540747, 0, 1, 1, 1,
0.001525999, 0.0919124, 0.6002966, 0, 0.9921569, 1, 1,
0.002548795, 1.588636, 1.736945, 0, 0.9882353, 1, 1,
0.002729219, 0.4766145, -0.06494677, 0, 0.9803922, 1, 1,
0.003172847, -1.187576, 3.327474, 0, 0.9764706, 1, 1,
0.0145475, -0.2084417, 2.485892, 0, 0.9686275, 1, 1,
0.01481255, 0.3722866, -0.0162852, 0, 0.9647059, 1, 1,
0.01554608, 0.09807704, 1.174848, 0, 0.9568627, 1, 1,
0.02112064, 0.7165155, 2.125915, 0, 0.9529412, 1, 1,
0.02724516, 0.3227193, 0.2883282, 0, 0.945098, 1, 1,
0.02822222, 0.1961327, 0.8832317, 0, 0.9411765, 1, 1,
0.02884836, -2.443951, 3.671221, 0, 0.9333333, 1, 1,
0.03075339, 2.309427, 0.6424765, 0, 0.9294118, 1, 1,
0.0359953, -2.547423, 0.0787432, 0, 0.9215686, 1, 1,
0.03717384, 0.8079559, 0.3451512, 0, 0.9176471, 1, 1,
0.03722132, 0.1779784, -0.2149883, 0, 0.9098039, 1, 1,
0.03750424, 0.7105586, 0.1881289, 0, 0.9058824, 1, 1,
0.04080509, -0.4404594, 4.680973, 0, 0.8980392, 1, 1,
0.04564035, -0.1331439, 3.044911, 0, 0.8901961, 1, 1,
0.05169238, 0.4075723, -0.1047715, 0, 0.8862745, 1, 1,
0.05235037, 0.1528475, 1.471292, 0, 0.8784314, 1, 1,
0.05297541, 0.4873246, -2.597054, 0, 0.8745098, 1, 1,
0.0536149, 1.273652, 1.441573, 0, 0.8666667, 1, 1,
0.05492988, 1.670779, -1.226769, 0, 0.8627451, 1, 1,
0.05696761, 0.1013891, 1.476119, 0, 0.854902, 1, 1,
0.05741498, -0.4395694, 2.975075, 0, 0.8509804, 1, 1,
0.05766032, -0.3831542, 2.386834, 0, 0.8431373, 1, 1,
0.05801794, 0.8736841, -1.786648, 0, 0.8392157, 1, 1,
0.05917776, -0.2707522, 2.490693, 0, 0.8313726, 1, 1,
0.05976668, -0.6028567, 4.835351, 0, 0.827451, 1, 1,
0.06259915, 1.226901, -0.2165086, 0, 0.8196079, 1, 1,
0.06280715, -0.6805624, 2.891945, 0, 0.8156863, 1, 1,
0.06607779, -0.4811656, 3.734012, 0, 0.8078431, 1, 1,
0.06931572, 0.710945, 0.3376197, 0, 0.8039216, 1, 1,
0.07013343, 2.172161, -1.050276, 0, 0.7960784, 1, 1,
0.07450773, -0.4587611, 0.7534493, 0, 0.7882353, 1, 1,
0.07825129, -1.555607, 2.938787, 0, 0.7843137, 1, 1,
0.07988477, 0.5813101, 0.7347037, 0, 0.7764706, 1, 1,
0.08099711, 0.2458712, -0.6918624, 0, 0.772549, 1, 1,
0.08239875, -1.070809, 2.566133, 0, 0.7647059, 1, 1,
0.08367257, -1.10301, 3.623608, 0, 0.7607843, 1, 1,
0.08594066, -1.355454, 3.427932, 0, 0.7529412, 1, 1,
0.08636932, 1.429341, -1.163394, 0, 0.7490196, 1, 1,
0.08876947, 0.2425735, 0.7409524, 0, 0.7411765, 1, 1,
0.09375304, -0.9884942, 3.154009, 0, 0.7372549, 1, 1,
0.09747595, -1.028104, 3.906544, 0, 0.7294118, 1, 1,
0.09800107, 1.087134, -0.215241, 0, 0.7254902, 1, 1,
0.1016686, 0.234484, 0.7364135, 0, 0.7176471, 1, 1,
0.101706, -0.1683891, 2.509586, 0, 0.7137255, 1, 1,
0.1094589, -0.3336084, 1.985996, 0, 0.7058824, 1, 1,
0.1118208, 0.1025439, -0.4172082, 0, 0.6980392, 1, 1,
0.1131456, 0.8009074, 1.105798, 0, 0.6941177, 1, 1,
0.1191792, -1.13361, 3.050725, 0, 0.6862745, 1, 1,
0.1313483, 1.675655, 0.1404016, 0, 0.682353, 1, 1,
0.132779, 0.8429419, 1.859353, 0, 0.6745098, 1, 1,
0.1350845, 0.07635213, -0.1709065, 0, 0.6705883, 1, 1,
0.1442602, 1.014416, -0.1577662, 0, 0.6627451, 1, 1,
0.1479747, 0.4294811, 0.5655357, 0, 0.6588235, 1, 1,
0.149368, 0.009875431, 1.010052, 0, 0.6509804, 1, 1,
0.1607878, 0.5107894, 0.6999719, 0, 0.6470588, 1, 1,
0.1612238, 1.347297, 0.9856564, 0, 0.6392157, 1, 1,
0.1682117, 0.1672659, 0.2243028, 0, 0.6352941, 1, 1,
0.169239, 1.509284, -2.23644, 0, 0.627451, 1, 1,
0.170185, 1.697656, -0.3696111, 0, 0.6235294, 1, 1,
0.1705047, -1.285065, 3.129122, 0, 0.6156863, 1, 1,
0.1714257, 0.2571595, 0.6169581, 0, 0.6117647, 1, 1,
0.1731135, -0.1964971, 3.094361, 0, 0.6039216, 1, 1,
0.1847637, -0.7808562, 2.431737, 0, 0.5960785, 1, 1,
0.1886062, 1.190399, 0.8153587, 0, 0.5921569, 1, 1,
0.1915829, -0.3100934, 3.036357, 0, 0.5843138, 1, 1,
0.1936162, -1.290493, 4.957786, 0, 0.5803922, 1, 1,
0.1966026, -1.757587, 3.026721, 0, 0.572549, 1, 1,
0.201743, 0.4614134, 0.06066215, 0, 0.5686275, 1, 1,
0.2023034, 0.001675928, 0.8423955, 0, 0.5607843, 1, 1,
0.2027337, 0.8079533, 1.056844, 0, 0.5568628, 1, 1,
0.2057157, -0.303776, 2.68908, 0, 0.5490196, 1, 1,
0.2072451, -0.6966189, 4.921209, 0, 0.5450981, 1, 1,
0.2108926, 1.413419, 0.3481132, 0, 0.5372549, 1, 1,
0.2122603, 0.04768924, 1.624367, 0, 0.5333334, 1, 1,
0.2168907, -0.002087707, -0.5069305, 0, 0.5254902, 1, 1,
0.223099, -0.9658547, 3.53914, 0, 0.5215687, 1, 1,
0.2272539, -0.3191111, 2.541789, 0, 0.5137255, 1, 1,
0.2304861, 0.4861377, -0.6415485, 0, 0.509804, 1, 1,
0.2305771, -0.1521955, 3.150497, 0, 0.5019608, 1, 1,
0.2351855, 0.7453125, 1.330532, 0, 0.4941176, 1, 1,
0.2403631, -1.281468, 2.652288, 0, 0.4901961, 1, 1,
0.245334, -1.054716, 1.708909, 0, 0.4823529, 1, 1,
0.2459855, 0.9748301, 1.395315, 0, 0.4784314, 1, 1,
0.2481523, 0.1734779, 2.441576, 0, 0.4705882, 1, 1,
0.2491164, 0.9381425, -0.6356751, 0, 0.4666667, 1, 1,
0.2515855, -0.48502, 3.640178, 0, 0.4588235, 1, 1,
0.2518717, -0.6566577, 2.826946, 0, 0.454902, 1, 1,
0.2526563, 1.592692, -2.443787, 0, 0.4470588, 1, 1,
0.26468, -1.108644, 3.652347, 0, 0.4431373, 1, 1,
0.2692102, 1.390212, 1.020291, 0, 0.4352941, 1, 1,
0.2699347, 0.5089185, 1.985225, 0, 0.4313726, 1, 1,
0.271973, -2.05149, 5.153908, 0, 0.4235294, 1, 1,
0.2740298, 1.041166, -0.7035444, 0, 0.4196078, 1, 1,
0.2751874, -0.444719, 3.388886, 0, 0.4117647, 1, 1,
0.2798451, -0.3420641, 2.127461, 0, 0.4078431, 1, 1,
0.2854529, -0.8934039, 1.02832, 0, 0.4, 1, 1,
0.2905938, -1.146285, 2.773906, 0, 0.3921569, 1, 1,
0.2908282, -0.6400915, 3.636018, 0, 0.3882353, 1, 1,
0.2965184, -0.2766331, 1.55214, 0, 0.3803922, 1, 1,
0.2971906, 0.5473281, -0.569487, 0, 0.3764706, 1, 1,
0.2983947, -1.970628, 2.384154, 0, 0.3686275, 1, 1,
0.2996104, 0.6786604, 1.935404, 0, 0.3647059, 1, 1,
0.3001701, -1.403509, 3.332402, 0, 0.3568628, 1, 1,
0.3019171, 0.2963726, 2.030028, 0, 0.3529412, 1, 1,
0.3165015, -1.286307, 2.653681, 0, 0.345098, 1, 1,
0.3186319, 0.7891243, 0.7961889, 0, 0.3411765, 1, 1,
0.3286824, -0.03999367, 0.8889245, 0, 0.3333333, 1, 1,
0.3317291, -0.6225559, 1.996132, 0, 0.3294118, 1, 1,
0.3352993, -1.113844, 2.71611, 0, 0.3215686, 1, 1,
0.339045, -0.3568609, 1.960593, 0, 0.3176471, 1, 1,
0.3444183, 0.4772602, 1.885825, 0, 0.3098039, 1, 1,
0.3505442, -1.922699, 2.970849, 0, 0.3058824, 1, 1,
0.3519875, -0.08780361, 2.015914, 0, 0.2980392, 1, 1,
0.3541937, 0.2403053, 0.4327023, 0, 0.2901961, 1, 1,
0.3593709, -0.4379615, 3.123057, 0, 0.2862745, 1, 1,
0.3608516, -0.4046928, 2.111671, 0, 0.2784314, 1, 1,
0.3625348, -0.1115896, 2.030362, 0, 0.2745098, 1, 1,
0.3635309, -1.037804, 0.795641, 0, 0.2666667, 1, 1,
0.3692265, 0.2148459, 0.5395613, 0, 0.2627451, 1, 1,
0.3705286, -2.132698, 4.733822, 0, 0.254902, 1, 1,
0.3760549, 0.2086078, -0.00917892, 0, 0.2509804, 1, 1,
0.3803547, 2.14127, -0.2918044, 0, 0.2431373, 1, 1,
0.3862295, 1.36329, -2.447075, 0, 0.2392157, 1, 1,
0.3862578, -0.5023804, 2.654234, 0, 0.2313726, 1, 1,
0.3896037, -0.1631794, 2.890793, 0, 0.227451, 1, 1,
0.3917418, -2.093156, 2.68079, 0, 0.2196078, 1, 1,
0.3933622, -1.566549, 2.981827, 0, 0.2156863, 1, 1,
0.393544, -0.7487976, 3.258137, 0, 0.2078431, 1, 1,
0.3955649, -0.0332261, 1.986629, 0, 0.2039216, 1, 1,
0.3986408, -1.828342, 2.555586, 0, 0.1960784, 1, 1,
0.401403, 0.02025808, 2.700626, 0, 0.1882353, 1, 1,
0.4050312, -1.514726, 3.952607, 0, 0.1843137, 1, 1,
0.407394, -0.4327952, 2.252085, 0, 0.1764706, 1, 1,
0.4126962, -0.6522591, 0.165255, 0, 0.172549, 1, 1,
0.4131121, -0.9199095, 2.381332, 0, 0.1647059, 1, 1,
0.4176083, -0.4184957, 2.548384, 0, 0.1607843, 1, 1,
0.4310641, -0.1200311, 1.133152, 0, 0.1529412, 1, 1,
0.4320256, 0.4125864, 1.563156, 0, 0.1490196, 1, 1,
0.4328267, -0.9479258, 2.856684, 0, 0.1411765, 1, 1,
0.4434664, 0.5622509, 0.9473738, 0, 0.1372549, 1, 1,
0.4460224, 1.105066, 0.6162018, 0, 0.1294118, 1, 1,
0.4464115, -0.5520253, 1.335613, 0, 0.1254902, 1, 1,
0.4464775, -1.990365, 2.32476, 0, 0.1176471, 1, 1,
0.4472297, -1.900788, 2.516867, 0, 0.1137255, 1, 1,
0.4495999, -0.3135, 2.033142, 0, 0.1058824, 1, 1,
0.4504962, -0.3455647, 2.550091, 0, 0.09803922, 1, 1,
0.4532311, 0.6415351, 0.2170713, 0, 0.09411765, 1, 1,
0.4539775, -0.7771739, 3.36941, 0, 0.08627451, 1, 1,
0.4548116, -2.15678, 3.487043, 0, 0.08235294, 1, 1,
0.459317, 0.4230319, 0.5227953, 0, 0.07450981, 1, 1,
0.4598575, 0.01602768, 2.835552, 0, 0.07058824, 1, 1,
0.4602651, 0.9026585, 2.313132, 0, 0.0627451, 1, 1,
0.4681498, 0.4368258, 0.1277912, 0, 0.05882353, 1, 1,
0.470008, 0.1990976, 1.171523, 0, 0.05098039, 1, 1,
0.4703845, -0.09270546, 2.795068, 0, 0.04705882, 1, 1,
0.4740724, 1.068632, -0.4103142, 0, 0.03921569, 1, 1,
0.476956, -0.3502118, 2.556551, 0, 0.03529412, 1, 1,
0.4811281, 3.205103, 2.234937, 0, 0.02745098, 1, 1,
0.4833091, -0.03059802, -0.03378267, 0, 0.02352941, 1, 1,
0.484495, -1.734926, 2.657528, 0, 0.01568628, 1, 1,
0.4864388, -0.9940189, 4.857454, 0, 0.01176471, 1, 1,
0.4865254, -1.381972, 3.887927, 0, 0.003921569, 1, 1,
0.4898297, -0.05110521, 0.8089028, 0.003921569, 0, 1, 1,
0.4957407, 0.6813359, 0.57704, 0.007843138, 0, 1, 1,
0.5042265, 0.08530025, 0.943106, 0.01568628, 0, 1, 1,
0.5073072, 0.8146241, -0.001499111, 0.01960784, 0, 1, 1,
0.5073773, 0.3748603, 0.9933621, 0.02745098, 0, 1, 1,
0.5081987, 0.008884405, 1.344181, 0.03137255, 0, 1, 1,
0.5110069, 0.4726756, 1.381606, 0.03921569, 0, 1, 1,
0.5118517, 1.807473, 1.21981, 0.04313726, 0, 1, 1,
0.5122552, 1.246042, 3.168259, 0.05098039, 0, 1, 1,
0.5142003, -0.6629789, 3.41388, 0.05490196, 0, 1, 1,
0.515461, 0.4567441, -0.2795317, 0.0627451, 0, 1, 1,
0.5218068, -1.32125, 1.858911, 0.06666667, 0, 1, 1,
0.5243931, -0.7235537, 1.677728, 0.07450981, 0, 1, 1,
0.5250397, 0.129344, 2.104388, 0.07843138, 0, 1, 1,
0.527064, 0.2632794, 1.106456, 0.08627451, 0, 1, 1,
0.5285655, 0.2999116, 1.294178, 0.09019608, 0, 1, 1,
0.5317642, -0.2159656, 1.846655, 0.09803922, 0, 1, 1,
0.5318729, 0.1890203, 2.538036, 0.1058824, 0, 1, 1,
0.5341505, -0.3561359, 3.63573, 0.1098039, 0, 1, 1,
0.5381116, -1.041173, 3.562772, 0.1176471, 0, 1, 1,
0.5409697, -0.2665085, 2.93358, 0.1215686, 0, 1, 1,
0.5410705, 0.5409866, 1.710154, 0.1294118, 0, 1, 1,
0.5415197, 0.3965472, 0.3074766, 0.1333333, 0, 1, 1,
0.5459255, -1.297519, 1.469198, 0.1411765, 0, 1, 1,
0.5506654, -1.600737, 2.72428, 0.145098, 0, 1, 1,
0.5523074, -1.183414, 3.004265, 0.1529412, 0, 1, 1,
0.5543569, 1.639462, -0.5064835, 0.1568628, 0, 1, 1,
0.5544287, -1.120362, 3.390239, 0.1647059, 0, 1, 1,
0.5598283, -0.5690299, 2.85159, 0.1686275, 0, 1, 1,
0.5636204, 1.426753, 0.3886614, 0.1764706, 0, 1, 1,
0.5640734, -2.4708, 3.634398, 0.1803922, 0, 1, 1,
0.5681803, 0.7015957, -0.5498261, 0.1882353, 0, 1, 1,
0.5713064, 1.205483, 0.222917, 0.1921569, 0, 1, 1,
0.5723727, 0.8902891, 1.836807, 0.2, 0, 1, 1,
0.5725642, 1.9736, 1.526432, 0.2078431, 0, 1, 1,
0.5739409, -0.02125789, 2.158775, 0.2117647, 0, 1, 1,
0.576914, 0.1183976, 2.028649, 0.2196078, 0, 1, 1,
0.5834711, 0.875684, 0.5026782, 0.2235294, 0, 1, 1,
0.6067924, -0.7178848, 3.909253, 0.2313726, 0, 1, 1,
0.6070847, -0.2357924, 1.479795, 0.2352941, 0, 1, 1,
0.6072318, -0.1255002, 3.134118, 0.2431373, 0, 1, 1,
0.6113604, 0.5161113, 0.778412, 0.2470588, 0, 1, 1,
0.6223523, 2.159387, 2.192381, 0.254902, 0, 1, 1,
0.6253202, 0.352406, 1.631462, 0.2588235, 0, 1, 1,
0.6272888, -1.116366, 0.6801245, 0.2666667, 0, 1, 1,
0.6306851, 0.06467759, 0.7313663, 0.2705882, 0, 1, 1,
0.6318312, 1.796794, 0.0748556, 0.2784314, 0, 1, 1,
0.6320486, -0.2844347, -0.1477455, 0.282353, 0, 1, 1,
0.6350049, -1.305657, 2.381664, 0.2901961, 0, 1, 1,
0.6360453, 0.8014167, 1.927992, 0.2941177, 0, 1, 1,
0.6404346, -0.01061069, 3.518686, 0.3019608, 0, 1, 1,
0.6413958, 0.7365707, -0.2525658, 0.3098039, 0, 1, 1,
0.6426644, -0.1830368, 2.81765, 0.3137255, 0, 1, 1,
0.6460478, -1.596155, 1.802247, 0.3215686, 0, 1, 1,
0.6468178, 0.4203372, 1.869527, 0.3254902, 0, 1, 1,
0.6566978, -0.5359003, 1.296303, 0.3333333, 0, 1, 1,
0.6585707, -0.6112165, 2.843476, 0.3372549, 0, 1, 1,
0.6589316, 0.9514642, 0.5064231, 0.345098, 0, 1, 1,
0.6612203, -0.6681587, 1.991889, 0.3490196, 0, 1, 1,
0.6618822, 0.2135972, 1.589131, 0.3568628, 0, 1, 1,
0.6655143, 0.4044943, 0.2410285, 0.3607843, 0, 1, 1,
0.6662582, 0.8253251, 0.1845971, 0.3686275, 0, 1, 1,
0.6697709, 0.3587181, 1.763264, 0.372549, 0, 1, 1,
0.6710314, -1.242177, 2.191081, 0.3803922, 0, 1, 1,
0.6762176, -1.23411, 2.863844, 0.3843137, 0, 1, 1,
0.689489, -0.1861202, 3.118829, 0.3921569, 0, 1, 1,
0.6941685, 0.9553643, -1.422367, 0.3960784, 0, 1, 1,
0.6974377, -0.1409067, 2.904384, 0.4039216, 0, 1, 1,
0.7003251, -0.3369728, 1.341196, 0.4117647, 0, 1, 1,
0.7011278, -0.7734566, 3.203932, 0.4156863, 0, 1, 1,
0.7015137, -0.7672024, 3.151164, 0.4235294, 0, 1, 1,
0.7035139, 0.5448605, 1.228967, 0.427451, 0, 1, 1,
0.7049331, -0.4920882, 1.822081, 0.4352941, 0, 1, 1,
0.7140923, 0.7554812, 2.445242, 0.4392157, 0, 1, 1,
0.7173008, 2.956825, -0.5324278, 0.4470588, 0, 1, 1,
0.7173467, -0.5172426, 2.154412, 0.4509804, 0, 1, 1,
0.7192083, -0.04704539, 1.236678, 0.4588235, 0, 1, 1,
0.7203194, -0.5535152, 1.676723, 0.4627451, 0, 1, 1,
0.7242029, 0.6334255, -0.7397668, 0.4705882, 0, 1, 1,
0.7289955, -0.3640487, 1.133916, 0.4745098, 0, 1, 1,
0.7314062, -0.116376, 2.762704, 0.4823529, 0, 1, 1,
0.733687, 0.9010369, 2.578916, 0.4862745, 0, 1, 1,
0.7400052, -2.18292, 2.51186, 0.4941176, 0, 1, 1,
0.7460866, -0.8959007, 0.03288266, 0.5019608, 0, 1, 1,
0.7461556, -0.07303542, 2.441491, 0.5058824, 0, 1, 1,
0.7560994, -0.01802735, 0.4570766, 0.5137255, 0, 1, 1,
0.756313, -0.1343632, 1.513561, 0.5176471, 0, 1, 1,
0.7611793, -0.8962481, 2.659451, 0.5254902, 0, 1, 1,
0.7612351, -0.5536975, 4.426363, 0.5294118, 0, 1, 1,
0.7648568, 0.2824141, 1.328135, 0.5372549, 0, 1, 1,
0.76568, -0.2000938, 3.544487, 0.5411765, 0, 1, 1,
0.7693709, -1.326106, 2.15136, 0.5490196, 0, 1, 1,
0.7707454, -0.3693462, 0.9808238, 0.5529412, 0, 1, 1,
0.7718801, 0.9872007, 0.527162, 0.5607843, 0, 1, 1,
0.7724626, 0.506956, 1.413264, 0.5647059, 0, 1, 1,
0.7776428, 1.043982, 0.2969777, 0.572549, 0, 1, 1,
0.7806381, 1.530324, 0.8633283, 0.5764706, 0, 1, 1,
0.7825348, -0.7919911, 3.221333, 0.5843138, 0, 1, 1,
0.7837205, -1.060996, 4.316278, 0.5882353, 0, 1, 1,
0.7839602, 0.3518947, -0.07823925, 0.5960785, 0, 1, 1,
0.7917619, -0.9443039, 2.263496, 0.6039216, 0, 1, 1,
0.7967348, 0.2926776, 2.70399, 0.6078432, 0, 1, 1,
0.7979588, -0.5123432, 2.832794, 0.6156863, 0, 1, 1,
0.8012162, -0.4426481, 2.494183, 0.6196079, 0, 1, 1,
0.8035154, 0.6421193, 0.5223274, 0.627451, 0, 1, 1,
0.8036379, 0.2434717, 3.182903, 0.6313726, 0, 1, 1,
0.8122305, -0.2416665, 1.260394, 0.6392157, 0, 1, 1,
0.8151689, 0.8834533, 1.207229, 0.6431373, 0, 1, 1,
0.8166496, 0.4321173, 1.065402, 0.6509804, 0, 1, 1,
0.8318304, 1.19491, -0.6953889, 0.654902, 0, 1, 1,
0.8327462, 0.2535461, 4.118285, 0.6627451, 0, 1, 1,
0.8329163, 0.8701914, 1.384501, 0.6666667, 0, 1, 1,
0.8348319, 0.5649871, -1.5713, 0.6745098, 0, 1, 1,
0.8349274, 0.7838735, -0.3624176, 0.6784314, 0, 1, 1,
0.8426008, 0.6275733, -0.8518458, 0.6862745, 0, 1, 1,
0.8428372, -0.06366973, 1.754382, 0.6901961, 0, 1, 1,
0.8453022, 0.4884212, 1.183545, 0.6980392, 0, 1, 1,
0.8485314, -0.3029544, 1.682166, 0.7058824, 0, 1, 1,
0.8502329, -2.058444, 3.287195, 0.7098039, 0, 1, 1,
0.8538358, 0.8867092, -0.06351461, 0.7176471, 0, 1, 1,
0.8575498, -1.944065, 1.919078, 0.7215686, 0, 1, 1,
0.85783, 0.1227272, 1.01197, 0.7294118, 0, 1, 1,
0.8648967, -0.1969198, 0.6222349, 0.7333333, 0, 1, 1,
0.8688908, 0.7287652, 0.713003, 0.7411765, 0, 1, 1,
0.8731287, -0.6313466, 1.308335, 0.7450981, 0, 1, 1,
0.8789558, -1.488862, 1.421907, 0.7529412, 0, 1, 1,
0.8803341, -2.28063, 3.176098, 0.7568628, 0, 1, 1,
0.8846511, -0.2852816, 1.149572, 0.7647059, 0, 1, 1,
0.8847558, 0.9152889, -0.1845515, 0.7686275, 0, 1, 1,
0.885262, 1.146183, 1.644275, 0.7764706, 0, 1, 1,
0.888599, 0.9573655, 0.08422906, 0.7803922, 0, 1, 1,
0.8921215, 1.492481, -1.473621, 0.7882353, 0, 1, 1,
0.8931205, -0.575283, 2.268125, 0.7921569, 0, 1, 1,
0.8976843, -1.866766, 2.307224, 0.8, 0, 1, 1,
0.8988236, -0.03562473, 3.083067, 0.8078431, 0, 1, 1,
0.8997811, -1.01532, 2.071107, 0.8117647, 0, 1, 1,
0.9002556, 0.0117138, 0.9646735, 0.8196079, 0, 1, 1,
0.9003943, -0.6073422, 3.019818, 0.8235294, 0, 1, 1,
0.9017984, -0.8202552, 1.923588, 0.8313726, 0, 1, 1,
0.9022158, 0.2006068, 0.1923613, 0.8352941, 0, 1, 1,
0.9061978, 1.145275, 1.396113, 0.8431373, 0, 1, 1,
0.9100298, 1.60767, 0.7087662, 0.8470588, 0, 1, 1,
0.9204806, 0.9232523, 0.591059, 0.854902, 0, 1, 1,
0.9204827, 0.5419275, 1.721453, 0.8588235, 0, 1, 1,
0.9387146, -0.9549798, 3.458728, 0.8666667, 0, 1, 1,
0.9392657, -1.756054, 0.2615443, 0.8705882, 0, 1, 1,
0.9402938, 0.8838696, 0.6187299, 0.8784314, 0, 1, 1,
0.9465227, -2.240303, 1.565147, 0.8823529, 0, 1, 1,
0.9533073, -0.7870554, 1.753695, 0.8901961, 0, 1, 1,
0.9566308, -0.1106118, 0.4425943, 0.8941177, 0, 1, 1,
0.9582619, -0.3778056, 1.024497, 0.9019608, 0, 1, 1,
0.9677873, -0.08927099, 1.131982, 0.9098039, 0, 1, 1,
0.9681169, -0.1990325, 2.020295, 0.9137255, 0, 1, 1,
0.976033, -0.7880077, 3.488976, 0.9215686, 0, 1, 1,
0.9836332, -0.01355972, 2.474944, 0.9254902, 0, 1, 1,
0.9904292, 1.574564, 0.6050069, 0.9333333, 0, 1, 1,
0.9975727, -2.00703, 4.034136, 0.9372549, 0, 1, 1,
1.004825, -0.6728753, 2.699064, 0.945098, 0, 1, 1,
1.008866, 0.809818, 0.0197076, 0.9490196, 0, 1, 1,
1.009849, -0.4118632, 1.244435, 0.9568627, 0, 1, 1,
1.011953, -1.923557, 2.599488, 0.9607843, 0, 1, 1,
1.017649, 1.443104, 0.4664497, 0.9686275, 0, 1, 1,
1.021852, -1.978941, 5.396641, 0.972549, 0, 1, 1,
1.024839, -0.9732007, 2.29558, 0.9803922, 0, 1, 1,
1.0281, 1.08419, 0.2309389, 0.9843137, 0, 1, 1,
1.030242, 0.1117991, 1.127439, 0.9921569, 0, 1, 1,
1.035835, -0.5797772, 1.812137, 0.9960784, 0, 1, 1,
1.037738, 0.1329031, 0.9998257, 1, 0, 0.9960784, 1,
1.045185, -1.820466, 2.188943, 1, 0, 0.9882353, 1,
1.045729, -0.4177293, 4.31664, 1, 0, 0.9843137, 1,
1.052146, -1.383552, 2.113621, 1, 0, 0.9764706, 1,
1.061518, -1.333428, 3.028143, 1, 0, 0.972549, 1,
1.063397, -0.2533394, 2.069079, 1, 0, 0.9647059, 1,
1.069992, 0.9133602, 2.597439, 1, 0, 0.9607843, 1,
1.070487, 0.6649945, 2.548285, 1, 0, 0.9529412, 1,
1.07139, 1.927657, 1.451314, 1, 0, 0.9490196, 1,
1.074615, -1.655833, 0.3352995, 1, 0, 0.9411765, 1,
1.075997, -1.822337, 3.215966, 1, 0, 0.9372549, 1,
1.080464, 3.02928, 1.073087, 1, 0, 0.9294118, 1,
1.084025, -1.052653, 3.293774, 1, 0, 0.9254902, 1,
1.093585, -0.6323292, 1.958184, 1, 0, 0.9176471, 1,
1.098424, -0.1166374, 0.9550558, 1, 0, 0.9137255, 1,
1.103316, -0.3970519, 1.689375, 1, 0, 0.9058824, 1,
1.104076, -0.6763065, 3.151668, 1, 0, 0.9019608, 1,
1.107953, -1.335797, 1.754988, 1, 0, 0.8941177, 1,
1.117298, 2.30481, -0.2676334, 1, 0, 0.8862745, 1,
1.121312, 0.7220693, 1.559841, 1, 0, 0.8823529, 1,
1.130417, -2.259782, 2.310218, 1, 0, 0.8745098, 1,
1.137976, 0.8537198, 2.48709, 1, 0, 0.8705882, 1,
1.139638, -0.00357313, 2.341768, 1, 0, 0.8627451, 1,
1.139689, -0.8654624, 1.136301, 1, 0, 0.8588235, 1,
1.140526, 2.435499, 0.05508829, 1, 0, 0.8509804, 1,
1.152859, -1.712076, 3.137728, 1, 0, 0.8470588, 1,
1.153049, 3.144329, -1.326309, 1, 0, 0.8392157, 1,
1.157509, 0.5535434, 0.7609348, 1, 0, 0.8352941, 1,
1.170006, -0.7883607, 3.739042, 1, 0, 0.827451, 1,
1.170255, 0.6630342, 1.039721, 1, 0, 0.8235294, 1,
1.174845, 0.4932583, 2.313034, 1, 0, 0.8156863, 1,
1.17896, 1.483159, 1.009444, 1, 0, 0.8117647, 1,
1.181067, 1.132358, 0.09890491, 1, 0, 0.8039216, 1,
1.181543, 0.7258912, 0.6481867, 1, 0, 0.7960784, 1,
1.185343, -0.8284683, 1.774561, 1, 0, 0.7921569, 1,
1.186218, 1.041095, 1.42864, 1, 0, 0.7843137, 1,
1.18652, 0.7621419, 1.490061, 1, 0, 0.7803922, 1,
1.187629, 0.2660969, 1.002159, 1, 0, 0.772549, 1,
1.190652, 0.3703196, 0.7029541, 1, 0, 0.7686275, 1,
1.192908, 0.5076265, 1.175997, 1, 0, 0.7607843, 1,
1.195539, 0.4985688, 0.6431708, 1, 0, 0.7568628, 1,
1.209634, 0.8269418, 0.2139999, 1, 0, 0.7490196, 1,
1.214924, 0.896367, 2.047146, 1, 0, 0.7450981, 1,
1.216041, -1.243585, 2.65334, 1, 0, 0.7372549, 1,
1.221578, 0.5115375, 0.5168775, 1, 0, 0.7333333, 1,
1.22254, 1.63143, 0.2251256, 1, 0, 0.7254902, 1,
1.222549, -0.08588276, 3.576516, 1, 0, 0.7215686, 1,
1.223333, -0.9494446, 1.616789, 1, 0, 0.7137255, 1,
1.229965, -0.4053552, 3.591748, 1, 0, 0.7098039, 1,
1.234947, -0.9272295, 3.003445, 1, 0, 0.7019608, 1,
1.24551, 1.239945, 0.7217408, 1, 0, 0.6941177, 1,
1.247003, 0.2557839, 2.623772, 1, 0, 0.6901961, 1,
1.262415, 0.1007592, 0.6917086, 1, 0, 0.682353, 1,
1.265105, 0.1971578, 0.6937129, 1, 0, 0.6784314, 1,
1.269744, -0.977401, 1.470361, 1, 0, 0.6705883, 1,
1.27033, -0.01140749, 2.248547, 1, 0, 0.6666667, 1,
1.272684, -0.04949415, 1.383261, 1, 0, 0.6588235, 1,
1.277335, -0.5879451, 3.744262, 1, 0, 0.654902, 1,
1.285454, -0.2559987, 0.6497953, 1, 0, 0.6470588, 1,
1.291384, -1.406085, 1.997545, 1, 0, 0.6431373, 1,
1.296186, -0.3384852, 1.454939, 1, 0, 0.6352941, 1,
1.305488, -1.015593, 2.389951, 1, 0, 0.6313726, 1,
1.306637, -1.084457, 1.038441, 1, 0, 0.6235294, 1,
1.307236, -0.4687232, 2.086151, 1, 0, 0.6196079, 1,
1.33461, 0.9608468, 1.11857, 1, 0, 0.6117647, 1,
1.342035, 0.1536221, 1.463181, 1, 0, 0.6078432, 1,
1.34315, 1.929306, 2.166145, 1, 0, 0.6, 1,
1.348359, 1.012273, 1.670262, 1, 0, 0.5921569, 1,
1.356962, 2.778745, 2.064023, 1, 0, 0.5882353, 1,
1.366915, -0.2388131, 2.100276, 1, 0, 0.5803922, 1,
1.369642, 1.284729, 0.25943, 1, 0, 0.5764706, 1,
1.373612, 0.1123911, 2.641563, 1, 0, 0.5686275, 1,
1.387048, -0.4411999, 1.210984, 1, 0, 0.5647059, 1,
1.387736, 2.724415, 1.338233, 1, 0, 0.5568628, 1,
1.390036, -0.04665609, 1.711815, 1, 0, 0.5529412, 1,
1.390271, 0.08085917, 2.507778, 1, 0, 0.5450981, 1,
1.398719, -1.204086, 2.654985, 1, 0, 0.5411765, 1,
1.39921, 0.4492033, 2.853827, 1, 0, 0.5333334, 1,
1.402068, -0.08581196, 1.220832, 1, 0, 0.5294118, 1,
1.402398, 1.186392, -0.240583, 1, 0, 0.5215687, 1,
1.40267, 0.4410771, 1.593202, 1, 0, 0.5176471, 1,
1.418619, -0.9381602, -1.498851, 1, 0, 0.509804, 1,
1.431791, 1.275888, 2.60104, 1, 0, 0.5058824, 1,
1.437753, 0.4944351, -0.03780617, 1, 0, 0.4980392, 1,
1.438629, -0.8484771, 2.304203, 1, 0, 0.4901961, 1,
1.447722, -1.395192, 1.961903, 1, 0, 0.4862745, 1,
1.448211, 0.1035813, 0.4296198, 1, 0, 0.4784314, 1,
1.4526, 0.2625188, 2.169652, 1, 0, 0.4745098, 1,
1.457411, 0.1341983, -0.01322532, 1, 0, 0.4666667, 1,
1.457701, 0.07691468, 0.6783471, 1, 0, 0.4627451, 1,
1.462884, 1.506562, 0.4741828, 1, 0, 0.454902, 1,
1.465128, -1.397406, 2.192482, 1, 0, 0.4509804, 1,
1.473703, 1.784523, 0.7922587, 1, 0, 0.4431373, 1,
1.475368, -0.1948909, 2.149252, 1, 0, 0.4392157, 1,
1.479671, 0.6059068, 1.226646, 1, 0, 0.4313726, 1,
1.48346, -0.04312779, 2.177601, 1, 0, 0.427451, 1,
1.485745, -0.0575371, 0.9421203, 1, 0, 0.4196078, 1,
1.491138, -1.43561, 1.574235, 1, 0, 0.4156863, 1,
1.495555, 0.5088356, -0.5982977, 1, 0, 0.4078431, 1,
1.505594, 1.648175, 1.101325, 1, 0, 0.4039216, 1,
1.514329, 0.9386266, 2.395172, 1, 0, 0.3960784, 1,
1.518647, -1.267512, 2.921338, 1, 0, 0.3882353, 1,
1.53102, -0.5263847, 2.747522, 1, 0, 0.3843137, 1,
1.532998, -0.2338708, 1.366268, 1, 0, 0.3764706, 1,
1.551322, 1.092254, 0.02371983, 1, 0, 0.372549, 1,
1.555386, 0.2228162, 1.717052, 1, 0, 0.3647059, 1,
1.558553, -0.2638244, 1.468234, 1, 0, 0.3607843, 1,
1.566577, -0.182712, 1.321414, 1, 0, 0.3529412, 1,
1.577145, -0.7714809, 2.372016, 1, 0, 0.3490196, 1,
1.584364, 0.8884435, -0.2818321, 1, 0, 0.3411765, 1,
1.608792, 1.337632, 1.074394, 1, 0, 0.3372549, 1,
1.620373, -0.7129591, 3.504482, 1, 0, 0.3294118, 1,
1.623657, 1.034297, 2.071135, 1, 0, 0.3254902, 1,
1.631318, -1.470176, 2.791264, 1, 0, 0.3176471, 1,
1.631349, -1.029868, 3.282059, 1, 0, 0.3137255, 1,
1.644495, -0.5856134, 3.169415, 1, 0, 0.3058824, 1,
1.671968, 0.3704117, 1.07443, 1, 0, 0.2980392, 1,
1.683527, -0.6083677, 1.60748, 1, 0, 0.2941177, 1,
1.685724, 0.8706833, 0.5458114, 1, 0, 0.2862745, 1,
1.686365, 2.192245, -0.2140849, 1, 0, 0.282353, 1,
1.68757, -0.5184942, -0.2554878, 1, 0, 0.2745098, 1,
1.696101, -0.9255283, 2.104624, 1, 0, 0.2705882, 1,
1.698987, -0.08066437, 1.075333, 1, 0, 0.2627451, 1,
1.70658, -1.378838, 0.8364221, 1, 0, 0.2588235, 1,
1.728091, 0.7681343, 1.258044, 1, 0, 0.2509804, 1,
1.731841, -0.4591269, 2.511621, 1, 0, 0.2470588, 1,
1.752383, 0.1647548, 2.28491, 1, 0, 0.2392157, 1,
1.753102, 1.325767, 2.246775, 1, 0, 0.2352941, 1,
1.789268, -0.4503291, 3.838538, 1, 0, 0.227451, 1,
1.791403, 0.336481, 0.776623, 1, 0, 0.2235294, 1,
1.796595, 0.4500838, -0.7069663, 1, 0, 0.2156863, 1,
1.807968, 2.210865, 0.2529908, 1, 0, 0.2117647, 1,
1.811994, 1.872057, 0.5522008, 1, 0, 0.2039216, 1,
1.813414, 0.5828692, 0.6668762, 1, 0, 0.1960784, 1,
1.859914, -0.540258, 0.5978966, 1, 0, 0.1921569, 1,
1.860768, 0.0846849, 1.124278, 1, 0, 0.1843137, 1,
1.865757, -0.8762717, 3.158399, 1, 0, 0.1803922, 1,
1.866034, -0.5744296, 2.174886, 1, 0, 0.172549, 1,
1.934319, 1.381023, 2.193134, 1, 0, 0.1686275, 1,
1.948066, -0.6222795, 2.241213, 1, 0, 0.1607843, 1,
1.959721, 1.359522, 2.337806, 1, 0, 0.1568628, 1,
1.97785, 2.301648, 1.067365, 1, 0, 0.1490196, 1,
2.010025, -0.9055839, 2.87482, 1, 0, 0.145098, 1,
2.083992, -0.05051913, 1.174827, 1, 0, 0.1372549, 1,
2.09097, 1.199315, -0.8029019, 1, 0, 0.1333333, 1,
2.09297, -0.502588, 0.1516895, 1, 0, 0.1254902, 1,
2.165596, 1.341672, -1.150063, 1, 0, 0.1215686, 1,
2.184911, 1.661504, 0.6694182, 1, 0, 0.1137255, 1,
2.185963, 1.002638, 1.091461, 1, 0, 0.1098039, 1,
2.232409, -0.678185, 0.1878753, 1, 0, 0.1019608, 1,
2.24115, 0.4723184, 1.852809, 1, 0, 0.09411765, 1,
2.260952, 0.6740679, 1.08768, 1, 0, 0.09019608, 1,
2.274721, -1.433899, 3.702207, 1, 0, 0.08235294, 1,
2.300549, 1.115594, 1.349142, 1, 0, 0.07843138, 1,
2.310804, 1.161614, 1.612134, 1, 0, 0.07058824, 1,
2.325676, 1.302709, 1.258568, 1, 0, 0.06666667, 1,
2.356016, 0.1608832, 1.232091, 1, 0, 0.05882353, 1,
2.384614, -0.7941913, 0.7495944, 1, 0, 0.05490196, 1,
2.419931, -0.8624548, 2.036958, 1, 0, 0.04705882, 1,
2.422307, 1.881986, 0.3116833, 1, 0, 0.04313726, 1,
2.471656, -1.036826, 1.855057, 1, 0, 0.03529412, 1,
2.480384, 0.2153216, 1.454152, 1, 0, 0.03137255, 1,
2.529736, -1.154183, -0.2038063, 1, 0, 0.02352941, 1,
2.589265, -0.6849437, 1.704746, 1, 0, 0.01960784, 1,
2.595887, -0.4898732, 2.491243, 1, 0, 0.01176471, 1,
3.288183, -0.6009881, 2.942107, 1, 0, 0.007843138, 1
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
0.2869294, -4.225382, -8.167468, 0, -0.5, 0.5, 0.5,
0.2869294, -4.225382, -8.167468, 1, -0.5, 0.5, 0.5,
0.2869294, -4.225382, -8.167468, 1, 1.5, 0.5, 0.5,
0.2869294, -4.225382, -8.167468, 0, 1.5, 0.5, 0.5
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
-3.731749, 0.02832437, -8.167468, 0, -0.5, 0.5, 0.5,
-3.731749, 0.02832437, -8.167468, 1, -0.5, 0.5, 0.5,
-3.731749, 0.02832437, -8.167468, 1, 1.5, 0.5, 0.5,
-3.731749, 0.02832437, -8.167468, 0, 1.5, 0.5, 0.5
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
-3.731749, -4.225382, -0.4024653, 0, -0.5, 0.5, 0.5,
-3.731749, -4.225382, -0.4024653, 1, -0.5, 0.5, 0.5,
-3.731749, -4.225382, -0.4024653, 1, 1.5, 0.5, 0.5,
-3.731749, -4.225382, -0.4024653, 0, 1.5, 0.5, 0.5
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
-2, -3.243757, -6.375545,
3, -3.243757, -6.375545,
-2, -3.243757, -6.375545,
-2, -3.407362, -6.674199,
-1, -3.243757, -6.375545,
-1, -3.407362, -6.674199,
0, -3.243757, -6.375545,
0, -3.407362, -6.674199,
1, -3.243757, -6.375545,
1, -3.407362, -6.674199,
2, -3.243757, -6.375545,
2, -3.407362, -6.674199,
3, -3.243757, -6.375545,
3, -3.407362, -6.674199
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
-2, -3.73457, -7.271506, 0, -0.5, 0.5, 0.5,
-2, -3.73457, -7.271506, 1, -0.5, 0.5, 0.5,
-2, -3.73457, -7.271506, 1, 1.5, 0.5, 0.5,
-2, -3.73457, -7.271506, 0, 1.5, 0.5, 0.5,
-1, -3.73457, -7.271506, 0, -0.5, 0.5, 0.5,
-1, -3.73457, -7.271506, 1, -0.5, 0.5, 0.5,
-1, -3.73457, -7.271506, 1, 1.5, 0.5, 0.5,
-1, -3.73457, -7.271506, 0, 1.5, 0.5, 0.5,
0, -3.73457, -7.271506, 0, -0.5, 0.5, 0.5,
0, -3.73457, -7.271506, 1, -0.5, 0.5, 0.5,
0, -3.73457, -7.271506, 1, 1.5, 0.5, 0.5,
0, -3.73457, -7.271506, 0, 1.5, 0.5, 0.5,
1, -3.73457, -7.271506, 0, -0.5, 0.5, 0.5,
1, -3.73457, -7.271506, 1, -0.5, 0.5, 0.5,
1, -3.73457, -7.271506, 1, 1.5, 0.5, 0.5,
1, -3.73457, -7.271506, 0, 1.5, 0.5, 0.5,
2, -3.73457, -7.271506, 0, -0.5, 0.5, 0.5,
2, -3.73457, -7.271506, 1, -0.5, 0.5, 0.5,
2, -3.73457, -7.271506, 1, 1.5, 0.5, 0.5,
2, -3.73457, -7.271506, 0, 1.5, 0.5, 0.5,
3, -3.73457, -7.271506, 0, -0.5, 0.5, 0.5,
3, -3.73457, -7.271506, 1, -0.5, 0.5, 0.5,
3, -3.73457, -7.271506, 1, 1.5, 0.5, 0.5,
3, -3.73457, -7.271506, 0, 1.5, 0.5, 0.5
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
-2.804362, -3, -6.375545,
-2.804362, 3, -6.375545,
-2.804362, -3, -6.375545,
-2.958926, -3, -6.674199,
-2.804362, -2, -6.375545,
-2.958926, -2, -6.674199,
-2.804362, -1, -6.375545,
-2.958926, -1, -6.674199,
-2.804362, 0, -6.375545,
-2.958926, 0, -6.674199,
-2.804362, 1, -6.375545,
-2.958926, 1, -6.674199,
-2.804362, 2, -6.375545,
-2.958926, 2, -6.674199,
-2.804362, 3, -6.375545,
-2.958926, 3, -6.674199
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
-3.268055, -3, -7.271506, 0, -0.5, 0.5, 0.5,
-3.268055, -3, -7.271506, 1, -0.5, 0.5, 0.5,
-3.268055, -3, -7.271506, 1, 1.5, 0.5, 0.5,
-3.268055, -3, -7.271506, 0, 1.5, 0.5, 0.5,
-3.268055, -2, -7.271506, 0, -0.5, 0.5, 0.5,
-3.268055, -2, -7.271506, 1, -0.5, 0.5, 0.5,
-3.268055, -2, -7.271506, 1, 1.5, 0.5, 0.5,
-3.268055, -2, -7.271506, 0, 1.5, 0.5, 0.5,
-3.268055, -1, -7.271506, 0, -0.5, 0.5, 0.5,
-3.268055, -1, -7.271506, 1, -0.5, 0.5, 0.5,
-3.268055, -1, -7.271506, 1, 1.5, 0.5, 0.5,
-3.268055, -1, -7.271506, 0, 1.5, 0.5, 0.5,
-3.268055, 0, -7.271506, 0, -0.5, 0.5, 0.5,
-3.268055, 0, -7.271506, 1, -0.5, 0.5, 0.5,
-3.268055, 0, -7.271506, 1, 1.5, 0.5, 0.5,
-3.268055, 0, -7.271506, 0, 1.5, 0.5, 0.5,
-3.268055, 1, -7.271506, 0, -0.5, 0.5, 0.5,
-3.268055, 1, -7.271506, 1, -0.5, 0.5, 0.5,
-3.268055, 1, -7.271506, 1, 1.5, 0.5, 0.5,
-3.268055, 1, -7.271506, 0, 1.5, 0.5, 0.5,
-3.268055, 2, -7.271506, 0, -0.5, 0.5, 0.5,
-3.268055, 2, -7.271506, 1, -0.5, 0.5, 0.5,
-3.268055, 2, -7.271506, 1, 1.5, 0.5, 0.5,
-3.268055, 2, -7.271506, 0, 1.5, 0.5, 0.5,
-3.268055, 3, -7.271506, 0, -0.5, 0.5, 0.5,
-3.268055, 3, -7.271506, 1, -0.5, 0.5, 0.5,
-3.268055, 3, -7.271506, 1, 1.5, 0.5, 0.5,
-3.268055, 3, -7.271506, 0, 1.5, 0.5, 0.5
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
-2.804362, -3.243757, -6,
-2.804362, -3.243757, 4,
-2.804362, -3.243757, -6,
-2.958926, -3.407362, -6,
-2.804362, -3.243757, -4,
-2.958926, -3.407362, -4,
-2.804362, -3.243757, -2,
-2.958926, -3.407362, -2,
-2.804362, -3.243757, 0,
-2.958926, -3.407362, 0,
-2.804362, -3.243757, 2,
-2.958926, -3.407362, 2,
-2.804362, -3.243757, 4,
-2.958926, -3.407362, 4
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
-3.268055, -3.73457, -6, 0, -0.5, 0.5, 0.5,
-3.268055, -3.73457, -6, 1, -0.5, 0.5, 0.5,
-3.268055, -3.73457, -6, 1, 1.5, 0.5, 0.5,
-3.268055, -3.73457, -6, 0, 1.5, 0.5, 0.5,
-3.268055, -3.73457, -4, 0, -0.5, 0.5, 0.5,
-3.268055, -3.73457, -4, 1, -0.5, 0.5, 0.5,
-3.268055, -3.73457, -4, 1, 1.5, 0.5, 0.5,
-3.268055, -3.73457, -4, 0, 1.5, 0.5, 0.5,
-3.268055, -3.73457, -2, 0, -0.5, 0.5, 0.5,
-3.268055, -3.73457, -2, 1, -0.5, 0.5, 0.5,
-3.268055, -3.73457, -2, 1, 1.5, 0.5, 0.5,
-3.268055, -3.73457, -2, 0, 1.5, 0.5, 0.5,
-3.268055, -3.73457, 0, 0, -0.5, 0.5, 0.5,
-3.268055, -3.73457, 0, 1, -0.5, 0.5, 0.5,
-3.268055, -3.73457, 0, 1, 1.5, 0.5, 0.5,
-3.268055, -3.73457, 0, 0, 1.5, 0.5, 0.5,
-3.268055, -3.73457, 2, 0, -0.5, 0.5, 0.5,
-3.268055, -3.73457, 2, 1, -0.5, 0.5, 0.5,
-3.268055, -3.73457, 2, 1, 1.5, 0.5, 0.5,
-3.268055, -3.73457, 2, 0, 1.5, 0.5, 0.5,
-3.268055, -3.73457, 4, 0, -0.5, 0.5, 0.5,
-3.268055, -3.73457, 4, 1, -0.5, 0.5, 0.5,
-3.268055, -3.73457, 4, 1, 1.5, 0.5, 0.5,
-3.268055, -3.73457, 4, 0, 1.5, 0.5, 0.5
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
-2.804362, -3.243757, -6.375545,
-2.804362, 3.300406, -6.375545,
-2.804362, -3.243757, 5.570614,
-2.804362, 3.300406, 5.570614,
-2.804362, -3.243757, -6.375545,
-2.804362, -3.243757, 5.570614,
-2.804362, 3.300406, -6.375545,
-2.804362, 3.300406, 5.570614,
-2.804362, -3.243757, -6.375545,
3.378221, -3.243757, -6.375545,
-2.804362, -3.243757, 5.570614,
3.378221, -3.243757, 5.570614,
-2.804362, 3.300406, -6.375545,
3.378221, 3.300406, -6.375545,
-2.804362, 3.300406, 5.570614,
3.378221, 3.300406, 5.570614,
3.378221, -3.243757, -6.375545,
3.378221, 3.300406, -6.375545,
3.378221, -3.243757, 5.570614,
3.378221, 3.300406, 5.570614,
3.378221, -3.243757, -6.375545,
3.378221, -3.243757, 5.570614,
3.378221, 3.300406, -6.375545,
3.378221, 3.300406, 5.570614
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
var radius = 7.987627;
var distance = 35.53785;
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
mvMatrix.translate( -0.2869294, -0.02832437, 0.4024653 );
mvMatrix.scale( 1.396889, 1.319707, 0.7229419 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.53785);
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
Dicrotophos<-read.table("Dicrotophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dicrotophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dicrotophos' not found
```

```r
y<-Dicrotophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dicrotophos' not found
```

```r
z<-Dicrotophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dicrotophos' not found
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
-2.714324, 0.7637802, -0.6301516, 0, 0, 1, 1, 1,
-2.6536, -1.190447, -0.5992208, 1, 0, 0, 1, 1,
-2.59571, 0.0558235, -1.673365, 1, 0, 0, 1, 1,
-2.527042, -0.1812711, -1.437329, 1, 0, 0, 1, 1,
-2.492862, -0.7108501, -2.109475, 1, 0, 0, 1, 1,
-2.440293, -1.05126, -2.595849, 1, 0, 0, 1, 1,
-2.392575, -1.258228, -2.121875, 0, 0, 0, 1, 1,
-2.385095, -1.594495, -2.569679, 0, 0, 0, 1, 1,
-2.342833, -1.358192, -2.336617, 0, 0, 0, 1, 1,
-2.316823, -1.428166, -1.908099, 0, 0, 0, 1, 1,
-2.275003, -2.112219, -1.865363, 0, 0, 0, 1, 1,
-2.219857, -0.2244547, -1.672249, 0, 0, 0, 1, 1,
-2.17819, -0.8753209, -3.819965, 0, 0, 0, 1, 1,
-2.151288, 2.205273, 0.1441113, 1, 1, 1, 1, 1,
-2.14778, 0.1292283, -0.7816639, 1, 1, 1, 1, 1,
-2.134745, -2.103851, -0.5388607, 1, 1, 1, 1, 1,
-2.090373, 0.994256, 0.06047595, 1, 1, 1, 1, 1,
-2.07632, 0.06606744, -2.096211, 1, 1, 1, 1, 1,
-2.05854, 0.5224018, -3.151259, 1, 1, 1, 1, 1,
-2.033477, -0.9314439, -2.80635, 1, 1, 1, 1, 1,
-2.032771, -1.909278, -3.09589, 1, 1, 1, 1, 1,
-2.031549, 1.364636, -2.423613, 1, 1, 1, 1, 1,
-2.017328, -0.4347215, 0.1071901, 1, 1, 1, 1, 1,
-2.012167, 0.05096508, -1.285923, 1, 1, 1, 1, 1,
-1.978852, -0.03756927, -1.169339, 1, 1, 1, 1, 1,
-1.97174, -1.660964, -1.970973, 1, 1, 1, 1, 1,
-1.969875, -0.7023864, -2.746053, 1, 1, 1, 1, 1,
-1.95563, 1.07341, -2.328967, 1, 1, 1, 1, 1,
-1.920991, 0.6818586, -1.582571, 0, 0, 1, 1, 1,
-1.913067, 1.605845, -0.07013719, 1, 0, 0, 1, 1,
-1.907418, -0.5080236, -2.797015, 1, 0, 0, 1, 1,
-1.901969, 0.4917302, -2.067435, 1, 0, 0, 1, 1,
-1.871008, 0.4028022, -1.969922, 1, 0, 0, 1, 1,
-1.868898, -1.680891, -0.6050537, 1, 0, 0, 1, 1,
-1.861225, -0.880789, -1.392513, 0, 0, 0, 1, 1,
-1.858922, 0.04564362, -0.3135534, 0, 0, 0, 1, 1,
-1.83198, -0.5529684, 0.9787661, 0, 0, 0, 1, 1,
-1.820744, -0.6882067, -3.283149, 0, 0, 0, 1, 1,
-1.816341, 0.3342137, 0.6585011, 0, 0, 0, 1, 1,
-1.785288, -1.072886, -2.204803, 0, 0, 0, 1, 1,
-1.779678, 0.2471082, -1.511744, 0, 0, 0, 1, 1,
-1.765553, 1.267126, -1.626041, 1, 1, 1, 1, 1,
-1.763272, -0.1529477, -1.224115, 1, 1, 1, 1, 1,
-1.741231, -1.328298, -1.273609, 1, 1, 1, 1, 1,
-1.726523, -0.2386143, -1.173787, 1, 1, 1, 1, 1,
-1.724344, 1.223034, -0.2480529, 1, 1, 1, 1, 1,
-1.699033, -0.347396, -3.058528, 1, 1, 1, 1, 1,
-1.692592, 1.611599, 0.1235379, 1, 1, 1, 1, 1,
-1.671941, 0.4742804, -2.170349, 1, 1, 1, 1, 1,
-1.662645, 0.6651355, -0.5510536, 1, 1, 1, 1, 1,
-1.653769, -0.5075098, -1.18472, 1, 1, 1, 1, 1,
-1.640394, -0.1958971, -0.9583048, 1, 1, 1, 1, 1,
-1.634022, -0.3660535, 0.1364453, 1, 1, 1, 1, 1,
-1.628171, 1.513365, -1.650428, 1, 1, 1, 1, 1,
-1.626561, -2.291721, -2.15534, 1, 1, 1, 1, 1,
-1.622535, 0.3763905, -2.89078, 1, 1, 1, 1, 1,
-1.618596, -0.07636619, -1.20365, 0, 0, 1, 1, 1,
-1.615872, 1.577773, -0.9910765, 1, 0, 0, 1, 1,
-1.612186, 0.7476342, -1.474334, 1, 0, 0, 1, 1,
-1.595413, -0.006459658, -1.357595, 1, 0, 0, 1, 1,
-1.584875, -0.618606, -0.3667015, 1, 0, 0, 1, 1,
-1.565936, 1.602006, -1.662235, 1, 0, 0, 1, 1,
-1.563076, 0.2036505, -0.3206174, 0, 0, 0, 1, 1,
-1.55712, -1.225449, -2.581316, 0, 0, 0, 1, 1,
-1.556915, 0.3795757, -1.769157, 0, 0, 0, 1, 1,
-1.54175, 2.196319, -0.105484, 0, 0, 0, 1, 1,
-1.525073, -0.7777072, -3.856942, 0, 0, 0, 1, 1,
-1.525022, -0.6756914, -2.374529, 0, 0, 0, 1, 1,
-1.521223, -1.107311, -1.556877, 0, 0, 0, 1, 1,
-1.506532, -0.8332899, -2.137287, 1, 1, 1, 1, 1,
-1.504113, -1.518826, -2.566494, 1, 1, 1, 1, 1,
-1.500847, 0.7873101, -0.7933409, 1, 1, 1, 1, 1,
-1.495132, 0.2139654, -3.029686, 1, 1, 1, 1, 1,
-1.491543, 0.5022365, -1.418054, 1, 1, 1, 1, 1,
-1.489227, 0.7409792, -0.220717, 1, 1, 1, 1, 1,
-1.477112, 0.1746733, -1.507929, 1, 1, 1, 1, 1,
-1.474515, 0.886878, -2.899348, 1, 1, 1, 1, 1,
-1.453599, 1.99485, -1.633566, 1, 1, 1, 1, 1,
-1.447929, -0.8898296, 1.21792, 1, 1, 1, 1, 1,
-1.428095, 1.272798, -0.4239742, 1, 1, 1, 1, 1,
-1.427444, -1.778931, -0.7622226, 1, 1, 1, 1, 1,
-1.420462, -0.342766, -2.299348, 1, 1, 1, 1, 1,
-1.406404, 0.02996553, -0.6674547, 1, 1, 1, 1, 1,
-1.399939, 0.9786083, -0.08398055, 1, 1, 1, 1, 1,
-1.392603, -0.417683, -1.675399, 0, 0, 1, 1, 1,
-1.384393, -0.8125639, -1.045779, 1, 0, 0, 1, 1,
-1.369328, 2.301938, -0.5707954, 1, 0, 0, 1, 1,
-1.359974, -0.3151786, -3.308144, 1, 0, 0, 1, 1,
-1.350731, 1.802346, 0.4962754, 1, 0, 0, 1, 1,
-1.336128, 0.6749603, -1.856782, 1, 0, 0, 1, 1,
-1.332781, -1.077909, -2.937918, 0, 0, 0, 1, 1,
-1.332609, 0.3481158, -1.46259, 0, 0, 0, 1, 1,
-1.316704, 1.848226, -0.8117269, 0, 0, 0, 1, 1,
-1.309297, 0.6244802, -0.654929, 0, 0, 0, 1, 1,
-1.307306, -0.1668461, -2.267992, 0, 0, 0, 1, 1,
-1.300292, 2.104378, -0.6225421, 0, 0, 0, 1, 1,
-1.296448, 0.3553846, -0.09944807, 0, 0, 0, 1, 1,
-1.294009, -1.337349, -3.115944, 1, 1, 1, 1, 1,
-1.293841, 0.05387996, -2.552845, 1, 1, 1, 1, 1,
-1.270059, 3.084331, 0.1572195, 1, 1, 1, 1, 1,
-1.256358, -0.6684008, -2.762656, 1, 1, 1, 1, 1,
-1.251539, -2.333928, -2.013627, 1, 1, 1, 1, 1,
-1.247918, -1.803082, -3.226438, 1, 1, 1, 1, 1,
-1.246747, -1.750331, -2.095939, 1, 1, 1, 1, 1,
-1.243034, 0.8670757, -0.01001484, 1, 1, 1, 1, 1,
-1.242536, 0.1539752, -2.220948, 1, 1, 1, 1, 1,
-1.229107, -0.9722522, -4.013638, 1, 1, 1, 1, 1,
-1.222822, -1.43166, -2.378944, 1, 1, 1, 1, 1,
-1.221458, 0.3604312, -1.233186, 1, 1, 1, 1, 1,
-1.219481, -1.252526, -1.268274, 1, 1, 1, 1, 1,
-1.207864, 1.027976, -0.2718654, 1, 1, 1, 1, 1,
-1.207854, -0.2238937, -2.064447, 1, 1, 1, 1, 1,
-1.20616, -0.8531947, -2.964462, 0, 0, 1, 1, 1,
-1.203764, 0.2815645, -1.80509, 1, 0, 0, 1, 1,
-1.196945, 0.6953181, -1.167945, 1, 0, 0, 1, 1,
-1.186386, -0.2019297, -1.922793, 1, 0, 0, 1, 1,
-1.185443, -0.3800138, -1.452898, 1, 0, 0, 1, 1,
-1.184286, 0.7532697, -1.551461, 1, 0, 0, 1, 1,
-1.18281, -2.023292, -3.904983, 0, 0, 0, 1, 1,
-1.177313, -0.7207726, -2.111901, 0, 0, 0, 1, 1,
-1.176704, 0.7918038, -0.769709, 0, 0, 0, 1, 1,
-1.165011, 0.9281946, -1.593443, 0, 0, 0, 1, 1,
-1.164897, -0.2285106, -1.332708, 0, 0, 0, 1, 1,
-1.161928, -0.5259997, -4.102968, 0, 0, 0, 1, 1,
-1.151417, -0.1378614, -1.21193, 0, 0, 0, 1, 1,
-1.135716, 0.3490192, -1.401882, 1, 1, 1, 1, 1,
-1.128447, -0.03789514, 0.1530453, 1, 1, 1, 1, 1,
-1.110363, -0.4214577, -0.9503734, 1, 1, 1, 1, 1,
-1.107059, -1.15025, -3.802574, 1, 1, 1, 1, 1,
-1.105553, -1.145207, -2.47045, 1, 1, 1, 1, 1,
-1.095946, -1.653502, -1.485009, 1, 1, 1, 1, 1,
-1.094003, -0.2810347, -3.984993, 1, 1, 1, 1, 1,
-1.090127, 0.08395154, -2.742197, 1, 1, 1, 1, 1,
-1.080013, 1.648469, -1.216711, 1, 1, 1, 1, 1,
-1.076214, 1.640335, -1.920228, 1, 1, 1, 1, 1,
-1.073367, 1.785927, 1.320204, 1, 1, 1, 1, 1,
-1.059099, -0.7193565, -2.240043, 1, 1, 1, 1, 1,
-1.045613, -0.1300202, -0.02528127, 1, 1, 1, 1, 1,
-1.043018, 1.983787, 0.7583752, 1, 1, 1, 1, 1,
-1.04159, -0.5385351, -1.461472, 1, 1, 1, 1, 1,
-1.027173, 0.4189029, -1.661917, 0, 0, 1, 1, 1,
-1.0262, -0.7935349, -1.975636, 1, 0, 0, 1, 1,
-1.026034, -0.2092236, -0.5346524, 1, 0, 0, 1, 1,
-1.025393, 1.579569, 1.685683, 1, 0, 0, 1, 1,
-1.020845, -1.542172, -1.889612, 1, 0, 0, 1, 1,
-1.014363, 0.07619147, -0.5190542, 1, 0, 0, 1, 1,
-1.014125, -0.5554414, -3.601764, 0, 0, 0, 1, 1,
-1.010909, 0.2769148, -1.155595, 0, 0, 0, 1, 1,
-1.008047, -0.4130946, -3.358521, 0, 0, 0, 1, 1,
-1.005994, -0.6502869, -1.685799, 0, 0, 0, 1, 1,
-1.004257, 0.4472482, -2.443893, 0, 0, 0, 1, 1,
-0.995007, -0.6932247, -1.193636, 0, 0, 0, 1, 1,
-0.9923324, 0.124066, -1.079623, 0, 0, 0, 1, 1,
-0.9920284, 0.3319193, 0.9292645, 1, 1, 1, 1, 1,
-0.9746561, -0.510807, -1.392484, 1, 1, 1, 1, 1,
-0.9675922, -1.836355, -2.033062, 1, 1, 1, 1, 1,
-0.9631502, 0.0006433864, -0.5103964, 1, 1, 1, 1, 1,
-0.9564253, 0.2795355, 0.6819721, 1, 1, 1, 1, 1,
-0.9551193, 1.192659, -0.9611912, 1, 1, 1, 1, 1,
-0.9531353, 1.289498, 0.07610693, 1, 1, 1, 1, 1,
-0.9452318, 2.608793, -0.5704722, 1, 1, 1, 1, 1,
-0.9390697, -1.029294, -1.775515, 1, 1, 1, 1, 1,
-0.9390421, -0.468888, -1.541466, 1, 1, 1, 1, 1,
-0.9336676, 1.235332, -0.8010404, 1, 1, 1, 1, 1,
-0.9232416, 0.8845336, -1.061376, 1, 1, 1, 1, 1,
-0.9184319, 1.387372, -1.040785, 1, 1, 1, 1, 1,
-0.916361, -0.7358825, -2.003656, 1, 1, 1, 1, 1,
-0.9132553, -0.2618003, -0.8969775, 1, 1, 1, 1, 1,
-0.9111628, -2.29305, -2.078174, 0, 0, 1, 1, 1,
-0.9103885, -0.2431603, -4.291665, 1, 0, 0, 1, 1,
-0.9097879, -0.03532742, -2.56592, 1, 0, 0, 1, 1,
-0.9038666, 0.2227582, -1.753333, 1, 0, 0, 1, 1,
-0.9011058, 1.020372, -1.698904, 1, 0, 0, 1, 1,
-0.8943008, 0.9256111, -0.1044715, 1, 0, 0, 1, 1,
-0.8940557, 0.07014959, -1.255556, 0, 0, 0, 1, 1,
-0.8783411, -0.7350785, -3.001618, 0, 0, 0, 1, 1,
-0.8760265, 0.3765819, -3.398988, 0, 0, 0, 1, 1,
-0.8708189, 0.1122267, -0.9280217, 0, 0, 0, 1, 1,
-0.8692701, -0.4079842, -1.190843, 0, 0, 0, 1, 1,
-0.8663259, 0.4234496, -1.715318, 0, 0, 0, 1, 1,
-0.8653149, 1.546989, -0.8396517, 0, 0, 0, 1, 1,
-0.8650851, 1.525812, -0.1864184, 1, 1, 1, 1, 1,
-0.8639853, -0.4786136, -1.954067, 1, 1, 1, 1, 1,
-0.8638052, -2.292559, -1.744078, 1, 1, 1, 1, 1,
-0.861927, -0.04554116, -1.553038, 1, 1, 1, 1, 1,
-0.8552666, -0.874927, -3.270016, 1, 1, 1, 1, 1,
-0.8551247, -0.5569125, -4.216876, 1, 1, 1, 1, 1,
-0.8464488, -1.22816, -4.524852, 1, 1, 1, 1, 1,
-0.8423778, 0.6253924, -1.513573, 1, 1, 1, 1, 1,
-0.8397529, -0.6665852, -2.004169, 1, 1, 1, 1, 1,
-0.8372433, 0.9104681, -1.619592, 1, 1, 1, 1, 1,
-0.8306215, -0.940683, -3.07007, 1, 1, 1, 1, 1,
-0.8251151, 1.634951, -0.1066303, 1, 1, 1, 1, 1,
-0.8250954, -0.2524734, -3.134678, 1, 1, 1, 1, 1,
-0.8174309, 1.751939, -0.3748504, 1, 1, 1, 1, 1,
-0.8147556, -0.8561447, -3.053538, 1, 1, 1, 1, 1,
-0.8133537, -0.9211717, -1.099893, 0, 0, 1, 1, 1,
-0.8107862, 0.02081474, -1.190017, 1, 0, 0, 1, 1,
-0.8064266, 0.007474717, -0.6805326, 1, 0, 0, 1, 1,
-0.8041509, -0.4502429, -2.964883, 1, 0, 0, 1, 1,
-0.8019944, -1.04732, -0.5023268, 1, 0, 0, 1, 1,
-0.790171, 0.4923544, -3.129415, 1, 0, 0, 1, 1,
-0.7875701, -1.706433, -3.586937, 0, 0, 0, 1, 1,
-0.7852533, -0.3062407, -2.079003, 0, 0, 0, 1, 1,
-0.7852338, 0.4319716, 0.06782354, 0, 0, 0, 1, 1,
-0.7843419, -0.5555804, -2.757419, 0, 0, 0, 1, 1,
-0.7825588, 0.8259017, -0.5410625, 0, 0, 0, 1, 1,
-0.7815641, -0.5437421, 0.09730127, 0, 0, 0, 1, 1,
-0.7802479, 0.9255884, -0.2826949, 0, 0, 0, 1, 1,
-0.7761335, -0.3954218, -2.711922, 1, 1, 1, 1, 1,
-0.7614163, -1.555076, -1.685602, 1, 1, 1, 1, 1,
-0.7606222, -0.09353814, -2.909047, 1, 1, 1, 1, 1,
-0.7591265, 1.188731, -1.757847, 1, 1, 1, 1, 1,
-0.7571505, 0.3470409, -1.300017, 1, 1, 1, 1, 1,
-0.755452, 0.7018118, -0.5287514, 1, 1, 1, 1, 1,
-0.7514371, 1.126713, 0.6040817, 1, 1, 1, 1, 1,
-0.7474145, -0.3913726, -1.074555, 1, 1, 1, 1, 1,
-0.742732, 1.212343, 0.2382394, 1, 1, 1, 1, 1,
-0.7379115, 1.084744, 1.205979, 1, 1, 1, 1, 1,
-0.7361843, -1.308361, -2.439917, 1, 1, 1, 1, 1,
-0.7349259, 0.8617929, -1.479503, 1, 1, 1, 1, 1,
-0.7334062, 0.6142685, -1.139355, 1, 1, 1, 1, 1,
-0.7299306, 0.8294792, -0.3814075, 1, 1, 1, 1, 1,
-0.7269329, -0.7833546, -1.612842, 1, 1, 1, 1, 1,
-0.7222031, 1.266267, -0.6147947, 0, 0, 1, 1, 1,
-0.7213858, -0.1615351, -2.556903, 1, 0, 0, 1, 1,
-0.7202891, -0.2468825, -2.54005, 1, 0, 0, 1, 1,
-0.7181701, 0.7957268, -1.675021, 1, 0, 0, 1, 1,
-0.7112241, 0.8767829, -1.754087, 1, 0, 0, 1, 1,
-0.7095047, 1.701412, -1.667601, 1, 0, 0, 1, 1,
-0.7039285, 0.8029379, -0.8000556, 0, 0, 0, 1, 1,
-0.6927767, -0.2729232, -1.837156, 0, 0, 0, 1, 1,
-0.6904336, -1.408273, -2.281052, 0, 0, 0, 1, 1,
-0.6868147, 1.145401, 0.3382746, 0, 0, 0, 1, 1,
-0.6864918, -1.586275, -1.895365, 0, 0, 0, 1, 1,
-0.6854616, 3.047024, -0.2327038, 0, 0, 0, 1, 1,
-0.6853443, 0.1263401, -0.4552099, 0, 0, 0, 1, 1,
-0.6834965, 0.4029783, -1.016137, 1, 1, 1, 1, 1,
-0.681495, 1.390702, -1.836809, 1, 1, 1, 1, 1,
-0.6796883, 0.7008004, -2.447014, 1, 1, 1, 1, 1,
-0.6758211, -0.9241894, -3.454597, 1, 1, 1, 1, 1,
-0.6744239, -0.3257733, -3.277019, 1, 1, 1, 1, 1,
-0.670391, 0.4385983, -1.099316, 1, 1, 1, 1, 1,
-0.6700732, -0.3373879, -2.525361, 1, 1, 1, 1, 1,
-0.6690912, 1.011933, -1.635139, 1, 1, 1, 1, 1,
-0.6686217, 0.1312007, -1.387308, 1, 1, 1, 1, 1,
-0.6655073, -0.1736947, -1.361035, 1, 1, 1, 1, 1,
-0.6555475, 0.384611, -2.362369, 1, 1, 1, 1, 1,
-0.6555345, -2.713286, -1.904539, 1, 1, 1, 1, 1,
-0.6529165, 0.8026891, -2.168618, 1, 1, 1, 1, 1,
-0.6471415, 0.4610362, -1.297481, 1, 1, 1, 1, 1,
-0.6415896, 0.6224069, -0.6624152, 1, 1, 1, 1, 1,
-0.6405894, 1.544584, 1.083534, 0, 0, 1, 1, 1,
-0.6305674, -1.123695, -2.958606, 1, 0, 0, 1, 1,
-0.6269046, -0.1446746, -0.9326883, 1, 0, 0, 1, 1,
-0.6262948, 1.594926, -0.5735516, 1, 0, 0, 1, 1,
-0.6259041, -1.400488, -3.564275, 1, 0, 0, 1, 1,
-0.6254592, -0.3776791, -3.280136, 1, 0, 0, 1, 1,
-0.6242206, -1.334311, -1.057875, 0, 0, 0, 1, 1,
-0.6239561, -0.1972864, -2.049765, 0, 0, 0, 1, 1,
-0.6226217, -0.01315513, -0.7324324, 0, 0, 0, 1, 1,
-0.6181399, -1.134013, -3.452975, 0, 0, 0, 1, 1,
-0.6127967, 1.413404, -1.512097, 0, 0, 0, 1, 1,
-0.6066186, 1.893956, 0.3939908, 0, 0, 0, 1, 1,
-0.6061066, 0.2725888, -0.1123447, 0, 0, 0, 1, 1,
-0.6032161, 2.162494, 1.081394, 1, 1, 1, 1, 1,
-0.6018349, -1.442596, -2.514203, 1, 1, 1, 1, 1,
-0.6015176, 1.481816, -0.9535583, 1, 1, 1, 1, 1,
-0.5999086, -0.2413563, -2.528485, 1, 1, 1, 1, 1,
-0.5996628, 0.2438616, -0.7999318, 1, 1, 1, 1, 1,
-0.5984142, 0.7612323, 3.610387e-05, 1, 1, 1, 1, 1,
-0.597521, 0.4492153, -0.2400564, 1, 1, 1, 1, 1,
-0.5922952, -2.050088, -3.081853, 1, 1, 1, 1, 1,
-0.5914791, 1.660593, -1.106529, 1, 1, 1, 1, 1,
-0.5883424, -0.7176237, -3.459587, 1, 1, 1, 1, 1,
-0.5819575, -1.543775, -2.372163, 1, 1, 1, 1, 1,
-0.5783808, -1.017748, 0.428674, 1, 1, 1, 1, 1,
-0.577875, 0.7634336, 0.119983, 1, 1, 1, 1, 1,
-0.5778633, -2.227271, -2.497085, 1, 1, 1, 1, 1,
-0.5776634, 0.5742761, -0.7389304, 1, 1, 1, 1, 1,
-0.5775687, -1.438377, -1.871213, 0, 0, 1, 1, 1,
-0.5678489, 0.7763512, -1.553535, 1, 0, 0, 1, 1,
-0.5659255, -0.2713858, -2.659339, 1, 0, 0, 1, 1,
-0.5624085, -0.03904663, -1.475783, 1, 0, 0, 1, 1,
-0.5607679, -1.795604, -4.9404, 1, 0, 0, 1, 1,
-0.5605426, 0.8947487, -1.540051, 1, 0, 0, 1, 1,
-0.5590959, -0.2782246, -1.600258, 0, 0, 0, 1, 1,
-0.5577301, 1.37529, 0.357361, 0, 0, 0, 1, 1,
-0.5544965, 0.2697183, -0.4877431, 0, 0, 0, 1, 1,
-0.5542972, -0.3698813, -1.951346, 0, 0, 0, 1, 1,
-0.552768, -0.5122497, -3.260523, 0, 0, 0, 1, 1,
-0.5526673, -2.651087, -5.013036, 0, 0, 0, 1, 1,
-0.5516199, 0.8218513, -0.3607343, 0, 0, 0, 1, 1,
-0.5511751, 2.149673, 0.1247757, 1, 1, 1, 1, 1,
-0.5509313, -0.1252556, -1.057364, 1, 1, 1, 1, 1,
-0.549519, -0.5809628, -2.735689, 1, 1, 1, 1, 1,
-0.547979, -2.423527, -3.004102, 1, 1, 1, 1, 1,
-0.5447485, -0.2970078, -2.492973, 1, 1, 1, 1, 1,
-0.5400386, -3.148454, -2.420959, 1, 1, 1, 1, 1,
-0.5387127, 1.543171, 1.094373, 1, 1, 1, 1, 1,
-0.5365428, -0.1699783, -2.668215, 1, 1, 1, 1, 1,
-0.5323074, -0.7273762, -2.305485, 1, 1, 1, 1, 1,
-0.5320999, -0.5420591, -1.006371, 1, 1, 1, 1, 1,
-0.5314973, 0.06496345, -0.1012351, 1, 1, 1, 1, 1,
-0.5314539, -0.112029, -2.471521, 1, 1, 1, 1, 1,
-0.5296208, -0.4708493, -2.277062, 1, 1, 1, 1, 1,
-0.5272923, 0.2275123, -1.513215, 1, 1, 1, 1, 1,
-0.5240272, -0.2415457, -2.820959, 1, 1, 1, 1, 1,
-0.5227076, 0.4420241, -1.44244, 0, 0, 1, 1, 1,
-0.5177458, 0.4008039, -0.4388618, 1, 0, 0, 1, 1,
-0.5150511, -1.043845, -3.098676, 1, 0, 0, 1, 1,
-0.514464, 0.8695015, -1.421699, 1, 0, 0, 1, 1,
-0.5123718, 0.3699421, -1.341817, 1, 0, 0, 1, 1,
-0.5045903, -0.1104669, -1.055527, 1, 0, 0, 1, 1,
-0.5043927, -0.321098, -2.880245, 0, 0, 0, 1, 1,
-0.4990919, 1.379252, 0.4893089, 0, 0, 0, 1, 1,
-0.4986533, 0.1053268, 0.5704421, 0, 0, 0, 1, 1,
-0.4948034, -1.308894, -3.726217, 0, 0, 0, 1, 1,
-0.4922908, 1.537915, 0.4557445, 0, 0, 0, 1, 1,
-0.4893949, -0.9421842, -3.478131, 0, 0, 0, 1, 1,
-0.4880563, 0.6468838, 0.1770734, 0, 0, 0, 1, 1,
-0.4789416, 0.3768414, 0.7915634, 1, 1, 1, 1, 1,
-0.4763762, 0.8040231, -1.233858, 1, 1, 1, 1, 1,
-0.4741604, -0.07920873, -1.481316, 1, 1, 1, 1, 1,
-0.4709235, -1.286514, -2.031987, 1, 1, 1, 1, 1,
-0.4702536, 0.04268534, -0.7924284, 1, 1, 1, 1, 1,
-0.468158, 0.3044643, -0.2463959, 1, 1, 1, 1, 1,
-0.4656723, -1.145457, -1.170239, 1, 1, 1, 1, 1,
-0.4655587, -1.076879, -3.650672, 1, 1, 1, 1, 1,
-0.465417, 0.03181989, -3.408796, 1, 1, 1, 1, 1,
-0.4645911, 0.9427, -0.539699, 1, 1, 1, 1, 1,
-0.4605371, 0.07422978, -2.449934, 1, 1, 1, 1, 1,
-0.4584701, -0.8056579, -3.091711, 1, 1, 1, 1, 1,
-0.4572249, -0.3132105, -1.799975, 1, 1, 1, 1, 1,
-0.4470536, -0.5447711, -2.479349, 1, 1, 1, 1, 1,
-0.4360831, 0.9485649, 1.360832, 1, 1, 1, 1, 1,
-0.4347217, -1.114615, -2.355313, 0, 0, 1, 1, 1,
-0.434671, -1.166708, -4.028468, 1, 0, 0, 1, 1,
-0.4344141, -1.984436, -2.946119, 1, 0, 0, 1, 1,
-0.4316908, 0.2888489, -0.06382088, 1, 0, 0, 1, 1,
-0.4289228, -0.0683991, -2.158184, 1, 0, 0, 1, 1,
-0.426101, 0.1310214, -1.890598, 1, 0, 0, 1, 1,
-0.4242786, 0.3449791, -1.338709, 0, 0, 0, 1, 1,
-0.4187685, -0.8329092, -2.913248, 0, 0, 0, 1, 1,
-0.4150756, -0.6444506, -2.607471, 0, 0, 0, 1, 1,
-0.4128755, -1.024883, -2.273082, 0, 0, 0, 1, 1,
-0.4123726, 0.3913981, -0.8610931, 0, 0, 0, 1, 1,
-0.4090048, 0.8621229, -0.2769157, 0, 0, 0, 1, 1,
-0.4080492, -1.064594, -3.122181, 0, 0, 0, 1, 1,
-0.3931538, 0.7554155, -1.044303, 1, 1, 1, 1, 1,
-0.3922516, -0.3887427, -0.3934073, 1, 1, 1, 1, 1,
-0.3893001, -0.5470908, -0.8830414, 1, 1, 1, 1, 1,
-0.3859485, 0.8228628, -0.6062177, 1, 1, 1, 1, 1,
-0.3803567, -0.2825023, -0.8475799, 1, 1, 1, 1, 1,
-0.3764408, 0.531216, -0.6296172, 1, 1, 1, 1, 1,
-0.3756351, -0.9678267, -2.884648, 1, 1, 1, 1, 1,
-0.3722331, 0.149615, -1.888029, 1, 1, 1, 1, 1,
-0.3700933, 1.672051, -0.2719356, 1, 1, 1, 1, 1,
-0.3686448, 0.4468745, -1.073612, 1, 1, 1, 1, 1,
-0.3676687, -0.5885403, -2.254077, 1, 1, 1, 1, 1,
-0.3649717, -2.620042, -2.145223, 1, 1, 1, 1, 1,
-0.3622379, -0.1419602, -1.487364, 1, 1, 1, 1, 1,
-0.3598427, 0.798621, -0.740916, 1, 1, 1, 1, 1,
-0.3592164, -0.6429147, -2.880256, 1, 1, 1, 1, 1,
-0.3577749, 0.07288004, 0.5492475, 0, 0, 1, 1, 1,
-0.3458308, 2.28368, -1.343698, 1, 0, 0, 1, 1,
-0.3444649, 0.1372919, -0.4427864, 1, 0, 0, 1, 1,
-0.3363021, -1.92111, -4.289423, 1, 0, 0, 1, 1,
-0.3351758, 1.858269, -1.199018, 1, 0, 0, 1, 1,
-0.3325693, 0.8081149, -1.578428, 1, 0, 0, 1, 1,
-0.3313844, -0.9885563, -4.640365, 0, 0, 0, 1, 1,
-0.3277424, -0.9836357, -2.080231, 0, 0, 0, 1, 1,
-0.3232822, -1.091693, -2.820548, 0, 0, 0, 1, 1,
-0.3186704, -1.344891, -3.797264, 0, 0, 0, 1, 1,
-0.3154078, 0.04909808, 0.486213, 0, 0, 0, 1, 1,
-0.3116781, 1.735654, 0.6421583, 0, 0, 0, 1, 1,
-0.3093665, 0.5340846, -1.929276, 0, 0, 0, 1, 1,
-0.3053575, 0.2182066, 0.2217922, 1, 1, 1, 1, 1,
-0.3038274, -0.4750027, -2.827466, 1, 1, 1, 1, 1,
-0.3033483, 0.111233, -1.791873, 1, 1, 1, 1, 1,
-0.3028021, 0.0794846, -0.2637966, 1, 1, 1, 1, 1,
-0.3021462, 1.043089, -0.2973095, 1, 1, 1, 1, 1,
-0.3015903, -1.191942, -3.714684, 1, 1, 1, 1, 1,
-0.3006074, -0.09883179, -1.306427, 1, 1, 1, 1, 1,
-0.2970961, 0.463789, 0.3016622, 1, 1, 1, 1, 1,
-0.2957868, -0.3682875, -0.556434, 1, 1, 1, 1, 1,
-0.2952263, -0.8260906, -3.000307, 1, 1, 1, 1, 1,
-0.2855313, -0.03069206, -2.212738, 1, 1, 1, 1, 1,
-0.2781588, -0.279832, -2.031316, 1, 1, 1, 1, 1,
-0.2763116, 0.8432012, 0.8484547, 1, 1, 1, 1, 1,
-0.2756843, -0.3195838, -2.598801, 1, 1, 1, 1, 1,
-0.2703502, 2.448439, -1.571436, 1, 1, 1, 1, 1,
-0.2656798, -0.005125596, -2.985949, 0, 0, 1, 1, 1,
-0.2600177, 2.921573, -0.04881744, 1, 0, 0, 1, 1,
-0.2547072, -1.340077, -3.205061, 1, 0, 0, 1, 1,
-0.2504311, -0.7444231, -3.771103, 1, 0, 0, 1, 1,
-0.246964, 1.218002, 0.8389654, 1, 0, 0, 1, 1,
-0.2436541, -0.7133984, -2.983199, 1, 0, 0, 1, 1,
-0.2422658, -0.4706842, -1.895957, 0, 0, 0, 1, 1,
-0.2372124, -1.641085, -2.719219, 0, 0, 0, 1, 1,
-0.2358343, -0.9546664, -4.644411, 0, 0, 0, 1, 1,
-0.226225, -1.935194, -2.60152, 0, 0, 0, 1, 1,
-0.2218539, -0.5291058, -4.369034, 0, 0, 0, 1, 1,
-0.2186176, -0.01108772, -1.425221, 0, 0, 0, 1, 1,
-0.2183551, 0.2069992, -2.183176, 0, 0, 0, 1, 1,
-0.2140526, 0.1519398, 0.5557638, 1, 1, 1, 1, 1,
-0.2126888, 0.01842554, -1.428085, 1, 1, 1, 1, 1,
-0.2125859, 0.7541115, 0.6499615, 1, 1, 1, 1, 1,
-0.2102458, -1.384292, -2.802005, 1, 1, 1, 1, 1,
-0.2095547, 0.6377903, -1.024596, 1, 1, 1, 1, 1,
-0.2090641, -1.149977, -5.050189, 1, 1, 1, 1, 1,
-0.2087167, 1.192934, 2.06314, 1, 1, 1, 1, 1,
-0.2086911, 1.737551, -0.041333, 1, 1, 1, 1, 1,
-0.2029855, 0.921762, -0.08172909, 1, 1, 1, 1, 1,
-0.1979989, -1.071305, -3.896569, 1, 1, 1, 1, 1,
-0.1924467, 1.503186, 0.3189386, 1, 1, 1, 1, 1,
-0.1913169, -1.771423, -4.186192, 1, 1, 1, 1, 1,
-0.1907689, 0.1992943, -0.07379989, 1, 1, 1, 1, 1,
-0.1907153, -0.2141035, -2.628471, 1, 1, 1, 1, 1,
-0.1887502, 0.6760619, -1.029552, 1, 1, 1, 1, 1,
-0.186882, -0.9321663, -2.139728, 0, 0, 1, 1, 1,
-0.1867221, 0.414396, 1.199731, 1, 0, 0, 1, 1,
-0.1835704, -0.336892, -2.339574, 1, 0, 0, 1, 1,
-0.1830785, 0.75122, -0.769181, 1, 0, 0, 1, 1,
-0.1806272, -0.08012579, -0.8764092, 1, 0, 0, 1, 1,
-0.1794655, 1.083733, -0.6662415, 1, 0, 0, 1, 1,
-0.177392, -0.1316998, -2.443975, 0, 0, 0, 1, 1,
-0.1733995, -0.2831769, -3.741369, 0, 0, 0, 1, 1,
-0.1693649, -1.821384, -3.235738, 0, 0, 0, 1, 1,
-0.1637485, -1.51739, -2.320252, 0, 0, 0, 1, 1,
-0.1605632, 0.5503442, 0.04107624, 0, 0, 0, 1, 1,
-0.1588159, 0.1525439, -0.6407984, 0, 0, 0, 1, 1,
-0.1547728, -0.9412671, -1.985116, 0, 0, 0, 1, 1,
-0.1516319, -0.4685545, -3.196269, 1, 1, 1, 1, 1,
-0.1515985, -0.2802495, -2.291075, 1, 1, 1, 1, 1,
-0.1495356, -0.5360215, -2.81396, 1, 1, 1, 1, 1,
-0.1483347, -1.134766, -3.139799, 1, 1, 1, 1, 1,
-0.1481819, -0.8449004, -6.201571, 1, 1, 1, 1, 1,
-0.1466862, -2.273323, -2.260735, 1, 1, 1, 1, 1,
-0.1424551, -0.5870708, -3.460829, 1, 1, 1, 1, 1,
-0.1420301, -0.3567146, -0.6605452, 1, 1, 1, 1, 1,
-0.1414304, 1.21946, 1.603786, 1, 1, 1, 1, 1,
-0.1394705, -0.335509, -1.510918, 1, 1, 1, 1, 1,
-0.139018, -0.2803074, -2.176307, 1, 1, 1, 1, 1,
-0.1360658, 1.0034, -1.404185, 1, 1, 1, 1, 1,
-0.1349145, 0.586448, -0.7871559, 1, 1, 1, 1, 1,
-0.1322225, 0.04628607, -0.7902564, 1, 1, 1, 1, 1,
-0.1290039, -0.6557965, -3.254085, 1, 1, 1, 1, 1,
-0.1264162, 0.02384537, -1.999609, 0, 0, 1, 1, 1,
-0.1251389, 2.579781, 0.627032, 1, 0, 0, 1, 1,
-0.1242726, -0.4190117, -3.884966, 1, 0, 0, 1, 1,
-0.1216024, 0.05675202, -0.3795105, 1, 0, 0, 1, 1,
-0.1190546, 0.8376816, -0.9946059, 1, 0, 0, 1, 1,
-0.1164404, -0.1627274, -1.804346, 1, 0, 0, 1, 1,
-0.1091677, 0.4489147, -0.3354884, 0, 0, 0, 1, 1,
-0.1067672, 0.6763869, 0.4901626, 0, 0, 0, 1, 1,
-0.1067301, -0.3472239, -1.73016, 0, 0, 0, 1, 1,
-0.1025997, 0.7772735, 0.97855, 0, 0, 0, 1, 1,
-0.1020546, -1.83294, -3.172563, 0, 0, 0, 1, 1,
-0.1005472, 1.025011, -0.3881263, 0, 0, 0, 1, 1,
-0.09909708, -0.5348737, -3.521346, 0, 0, 0, 1, 1,
-0.09883941, 1.309058, 0.5330057, 1, 1, 1, 1, 1,
-0.09365449, -0.3840412, -3.017059, 1, 1, 1, 1, 1,
-0.08655819, -0.2798603, -2.048354, 1, 1, 1, 1, 1,
-0.08479647, -1.114372, -4.069604, 1, 1, 1, 1, 1,
-0.08435237, 0.6052222, -0.2765734, 1, 1, 1, 1, 1,
-0.08360516, -0.3031616, -2.70598, 1, 1, 1, 1, 1,
-0.08359103, -0.3678651, -4.310639, 1, 1, 1, 1, 1,
-0.08176038, 0.04164179, -1.134222, 1, 1, 1, 1, 1,
-0.07416955, -1.290999, -2.809784, 1, 1, 1, 1, 1,
-0.0696499, 0.6043565, 0.6229326, 1, 1, 1, 1, 1,
-0.06678509, 0.190938, -1.124539, 1, 1, 1, 1, 1,
-0.06550617, 0.002391177, -0.846888, 1, 1, 1, 1, 1,
-0.06260557, 0.02940295, -0.4810723, 1, 1, 1, 1, 1,
-0.06099301, -0.7844376, -3.48777, 1, 1, 1, 1, 1,
-0.05925779, 0.7285577, -1.056963, 1, 1, 1, 1, 1,
-0.05804772, 1.739617, -0.4614049, 0, 0, 1, 1, 1,
-0.05729311, -0.03852114, -1.43892, 1, 0, 0, 1, 1,
-0.05655577, 0.6700698, 1.406424, 1, 0, 0, 1, 1,
-0.05406281, 0.1293653, 0.2635273, 1, 0, 0, 1, 1,
-0.05353398, 1.771737, 0.2269462, 1, 0, 0, 1, 1,
-0.05015856, 0.5409227, -0.1783448, 1, 0, 0, 1, 1,
-0.04920905, 0.8726778, 0.234582, 0, 0, 0, 1, 1,
-0.04782604, -0.2955741, -1.405806, 0, 0, 0, 1, 1,
-0.04417748, -0.4527898, -3.886635, 0, 0, 0, 1, 1,
-0.04208485, 0.0008116593, -1.494887, 0, 0, 0, 1, 1,
-0.04008412, -0.8475836, -5.39629, 0, 0, 0, 1, 1,
-0.03926265, -1.904247, -2.994563, 0, 0, 0, 1, 1,
-0.03711413, -1.020135, -2.359555, 0, 0, 0, 1, 1,
-0.03354998, -0.3339247, -3.16311, 1, 1, 1, 1, 1,
-0.02565877, -0.3116892, -2.577129, 1, 1, 1, 1, 1,
-0.02029141, 0.7875661, 1.820272, 1, 1, 1, 1, 1,
-0.01882768, -0.1468454, -3.2548, 1, 1, 1, 1, 1,
-0.01671674, -0.09363832, -2.610434, 1, 1, 1, 1, 1,
-0.01462658, -0.8181147, -2.503803, 1, 1, 1, 1, 1,
-0.01165728, 2.748634, -1.307252, 1, 1, 1, 1, 1,
-0.009850936, 0.4376944, 0.63613, 1, 1, 1, 1, 1,
-0.007967244, -0.08173279, -1.924034, 1, 1, 1, 1, 1,
-0.007509765, 1.494021, -1.322987, 1, 1, 1, 1, 1,
-0.004700497, -1.092542, -3.415578, 1, 1, 1, 1, 1,
-9.258179e-06, -2.297575, -3.540747, 1, 1, 1, 1, 1,
0.001525999, 0.0919124, 0.6002966, 1, 1, 1, 1, 1,
0.002548795, 1.588636, 1.736945, 1, 1, 1, 1, 1,
0.002729219, 0.4766145, -0.06494677, 1, 1, 1, 1, 1,
0.003172847, -1.187576, 3.327474, 0, 0, 1, 1, 1,
0.0145475, -0.2084417, 2.485892, 1, 0, 0, 1, 1,
0.01481255, 0.3722866, -0.0162852, 1, 0, 0, 1, 1,
0.01554608, 0.09807704, 1.174848, 1, 0, 0, 1, 1,
0.02112064, 0.7165155, 2.125915, 1, 0, 0, 1, 1,
0.02724516, 0.3227193, 0.2883282, 1, 0, 0, 1, 1,
0.02822222, 0.1961327, 0.8832317, 0, 0, 0, 1, 1,
0.02884836, -2.443951, 3.671221, 0, 0, 0, 1, 1,
0.03075339, 2.309427, 0.6424765, 0, 0, 0, 1, 1,
0.0359953, -2.547423, 0.0787432, 0, 0, 0, 1, 1,
0.03717384, 0.8079559, 0.3451512, 0, 0, 0, 1, 1,
0.03722132, 0.1779784, -0.2149883, 0, 0, 0, 1, 1,
0.03750424, 0.7105586, 0.1881289, 0, 0, 0, 1, 1,
0.04080509, -0.4404594, 4.680973, 1, 1, 1, 1, 1,
0.04564035, -0.1331439, 3.044911, 1, 1, 1, 1, 1,
0.05169238, 0.4075723, -0.1047715, 1, 1, 1, 1, 1,
0.05235037, 0.1528475, 1.471292, 1, 1, 1, 1, 1,
0.05297541, 0.4873246, -2.597054, 1, 1, 1, 1, 1,
0.0536149, 1.273652, 1.441573, 1, 1, 1, 1, 1,
0.05492988, 1.670779, -1.226769, 1, 1, 1, 1, 1,
0.05696761, 0.1013891, 1.476119, 1, 1, 1, 1, 1,
0.05741498, -0.4395694, 2.975075, 1, 1, 1, 1, 1,
0.05766032, -0.3831542, 2.386834, 1, 1, 1, 1, 1,
0.05801794, 0.8736841, -1.786648, 1, 1, 1, 1, 1,
0.05917776, -0.2707522, 2.490693, 1, 1, 1, 1, 1,
0.05976668, -0.6028567, 4.835351, 1, 1, 1, 1, 1,
0.06259915, 1.226901, -0.2165086, 1, 1, 1, 1, 1,
0.06280715, -0.6805624, 2.891945, 1, 1, 1, 1, 1,
0.06607779, -0.4811656, 3.734012, 0, 0, 1, 1, 1,
0.06931572, 0.710945, 0.3376197, 1, 0, 0, 1, 1,
0.07013343, 2.172161, -1.050276, 1, 0, 0, 1, 1,
0.07450773, -0.4587611, 0.7534493, 1, 0, 0, 1, 1,
0.07825129, -1.555607, 2.938787, 1, 0, 0, 1, 1,
0.07988477, 0.5813101, 0.7347037, 1, 0, 0, 1, 1,
0.08099711, 0.2458712, -0.6918624, 0, 0, 0, 1, 1,
0.08239875, -1.070809, 2.566133, 0, 0, 0, 1, 1,
0.08367257, -1.10301, 3.623608, 0, 0, 0, 1, 1,
0.08594066, -1.355454, 3.427932, 0, 0, 0, 1, 1,
0.08636932, 1.429341, -1.163394, 0, 0, 0, 1, 1,
0.08876947, 0.2425735, 0.7409524, 0, 0, 0, 1, 1,
0.09375304, -0.9884942, 3.154009, 0, 0, 0, 1, 1,
0.09747595, -1.028104, 3.906544, 1, 1, 1, 1, 1,
0.09800107, 1.087134, -0.215241, 1, 1, 1, 1, 1,
0.1016686, 0.234484, 0.7364135, 1, 1, 1, 1, 1,
0.101706, -0.1683891, 2.509586, 1, 1, 1, 1, 1,
0.1094589, -0.3336084, 1.985996, 1, 1, 1, 1, 1,
0.1118208, 0.1025439, -0.4172082, 1, 1, 1, 1, 1,
0.1131456, 0.8009074, 1.105798, 1, 1, 1, 1, 1,
0.1191792, -1.13361, 3.050725, 1, 1, 1, 1, 1,
0.1313483, 1.675655, 0.1404016, 1, 1, 1, 1, 1,
0.132779, 0.8429419, 1.859353, 1, 1, 1, 1, 1,
0.1350845, 0.07635213, -0.1709065, 1, 1, 1, 1, 1,
0.1442602, 1.014416, -0.1577662, 1, 1, 1, 1, 1,
0.1479747, 0.4294811, 0.5655357, 1, 1, 1, 1, 1,
0.149368, 0.009875431, 1.010052, 1, 1, 1, 1, 1,
0.1607878, 0.5107894, 0.6999719, 1, 1, 1, 1, 1,
0.1612238, 1.347297, 0.9856564, 0, 0, 1, 1, 1,
0.1682117, 0.1672659, 0.2243028, 1, 0, 0, 1, 1,
0.169239, 1.509284, -2.23644, 1, 0, 0, 1, 1,
0.170185, 1.697656, -0.3696111, 1, 0, 0, 1, 1,
0.1705047, -1.285065, 3.129122, 1, 0, 0, 1, 1,
0.1714257, 0.2571595, 0.6169581, 1, 0, 0, 1, 1,
0.1731135, -0.1964971, 3.094361, 0, 0, 0, 1, 1,
0.1847637, -0.7808562, 2.431737, 0, 0, 0, 1, 1,
0.1886062, 1.190399, 0.8153587, 0, 0, 0, 1, 1,
0.1915829, -0.3100934, 3.036357, 0, 0, 0, 1, 1,
0.1936162, -1.290493, 4.957786, 0, 0, 0, 1, 1,
0.1966026, -1.757587, 3.026721, 0, 0, 0, 1, 1,
0.201743, 0.4614134, 0.06066215, 0, 0, 0, 1, 1,
0.2023034, 0.001675928, 0.8423955, 1, 1, 1, 1, 1,
0.2027337, 0.8079533, 1.056844, 1, 1, 1, 1, 1,
0.2057157, -0.303776, 2.68908, 1, 1, 1, 1, 1,
0.2072451, -0.6966189, 4.921209, 1, 1, 1, 1, 1,
0.2108926, 1.413419, 0.3481132, 1, 1, 1, 1, 1,
0.2122603, 0.04768924, 1.624367, 1, 1, 1, 1, 1,
0.2168907, -0.002087707, -0.5069305, 1, 1, 1, 1, 1,
0.223099, -0.9658547, 3.53914, 1, 1, 1, 1, 1,
0.2272539, -0.3191111, 2.541789, 1, 1, 1, 1, 1,
0.2304861, 0.4861377, -0.6415485, 1, 1, 1, 1, 1,
0.2305771, -0.1521955, 3.150497, 1, 1, 1, 1, 1,
0.2351855, 0.7453125, 1.330532, 1, 1, 1, 1, 1,
0.2403631, -1.281468, 2.652288, 1, 1, 1, 1, 1,
0.245334, -1.054716, 1.708909, 1, 1, 1, 1, 1,
0.2459855, 0.9748301, 1.395315, 1, 1, 1, 1, 1,
0.2481523, 0.1734779, 2.441576, 0, 0, 1, 1, 1,
0.2491164, 0.9381425, -0.6356751, 1, 0, 0, 1, 1,
0.2515855, -0.48502, 3.640178, 1, 0, 0, 1, 1,
0.2518717, -0.6566577, 2.826946, 1, 0, 0, 1, 1,
0.2526563, 1.592692, -2.443787, 1, 0, 0, 1, 1,
0.26468, -1.108644, 3.652347, 1, 0, 0, 1, 1,
0.2692102, 1.390212, 1.020291, 0, 0, 0, 1, 1,
0.2699347, 0.5089185, 1.985225, 0, 0, 0, 1, 1,
0.271973, -2.05149, 5.153908, 0, 0, 0, 1, 1,
0.2740298, 1.041166, -0.7035444, 0, 0, 0, 1, 1,
0.2751874, -0.444719, 3.388886, 0, 0, 0, 1, 1,
0.2798451, -0.3420641, 2.127461, 0, 0, 0, 1, 1,
0.2854529, -0.8934039, 1.02832, 0, 0, 0, 1, 1,
0.2905938, -1.146285, 2.773906, 1, 1, 1, 1, 1,
0.2908282, -0.6400915, 3.636018, 1, 1, 1, 1, 1,
0.2965184, -0.2766331, 1.55214, 1, 1, 1, 1, 1,
0.2971906, 0.5473281, -0.569487, 1, 1, 1, 1, 1,
0.2983947, -1.970628, 2.384154, 1, 1, 1, 1, 1,
0.2996104, 0.6786604, 1.935404, 1, 1, 1, 1, 1,
0.3001701, -1.403509, 3.332402, 1, 1, 1, 1, 1,
0.3019171, 0.2963726, 2.030028, 1, 1, 1, 1, 1,
0.3165015, -1.286307, 2.653681, 1, 1, 1, 1, 1,
0.3186319, 0.7891243, 0.7961889, 1, 1, 1, 1, 1,
0.3286824, -0.03999367, 0.8889245, 1, 1, 1, 1, 1,
0.3317291, -0.6225559, 1.996132, 1, 1, 1, 1, 1,
0.3352993, -1.113844, 2.71611, 1, 1, 1, 1, 1,
0.339045, -0.3568609, 1.960593, 1, 1, 1, 1, 1,
0.3444183, 0.4772602, 1.885825, 1, 1, 1, 1, 1,
0.3505442, -1.922699, 2.970849, 0, 0, 1, 1, 1,
0.3519875, -0.08780361, 2.015914, 1, 0, 0, 1, 1,
0.3541937, 0.2403053, 0.4327023, 1, 0, 0, 1, 1,
0.3593709, -0.4379615, 3.123057, 1, 0, 0, 1, 1,
0.3608516, -0.4046928, 2.111671, 1, 0, 0, 1, 1,
0.3625348, -0.1115896, 2.030362, 1, 0, 0, 1, 1,
0.3635309, -1.037804, 0.795641, 0, 0, 0, 1, 1,
0.3692265, 0.2148459, 0.5395613, 0, 0, 0, 1, 1,
0.3705286, -2.132698, 4.733822, 0, 0, 0, 1, 1,
0.3760549, 0.2086078, -0.00917892, 0, 0, 0, 1, 1,
0.3803547, 2.14127, -0.2918044, 0, 0, 0, 1, 1,
0.3862295, 1.36329, -2.447075, 0, 0, 0, 1, 1,
0.3862578, -0.5023804, 2.654234, 0, 0, 0, 1, 1,
0.3896037, -0.1631794, 2.890793, 1, 1, 1, 1, 1,
0.3917418, -2.093156, 2.68079, 1, 1, 1, 1, 1,
0.3933622, -1.566549, 2.981827, 1, 1, 1, 1, 1,
0.393544, -0.7487976, 3.258137, 1, 1, 1, 1, 1,
0.3955649, -0.0332261, 1.986629, 1, 1, 1, 1, 1,
0.3986408, -1.828342, 2.555586, 1, 1, 1, 1, 1,
0.401403, 0.02025808, 2.700626, 1, 1, 1, 1, 1,
0.4050312, -1.514726, 3.952607, 1, 1, 1, 1, 1,
0.407394, -0.4327952, 2.252085, 1, 1, 1, 1, 1,
0.4126962, -0.6522591, 0.165255, 1, 1, 1, 1, 1,
0.4131121, -0.9199095, 2.381332, 1, 1, 1, 1, 1,
0.4176083, -0.4184957, 2.548384, 1, 1, 1, 1, 1,
0.4310641, -0.1200311, 1.133152, 1, 1, 1, 1, 1,
0.4320256, 0.4125864, 1.563156, 1, 1, 1, 1, 1,
0.4328267, -0.9479258, 2.856684, 1, 1, 1, 1, 1,
0.4434664, 0.5622509, 0.9473738, 0, 0, 1, 1, 1,
0.4460224, 1.105066, 0.6162018, 1, 0, 0, 1, 1,
0.4464115, -0.5520253, 1.335613, 1, 0, 0, 1, 1,
0.4464775, -1.990365, 2.32476, 1, 0, 0, 1, 1,
0.4472297, -1.900788, 2.516867, 1, 0, 0, 1, 1,
0.4495999, -0.3135, 2.033142, 1, 0, 0, 1, 1,
0.4504962, -0.3455647, 2.550091, 0, 0, 0, 1, 1,
0.4532311, 0.6415351, 0.2170713, 0, 0, 0, 1, 1,
0.4539775, -0.7771739, 3.36941, 0, 0, 0, 1, 1,
0.4548116, -2.15678, 3.487043, 0, 0, 0, 1, 1,
0.459317, 0.4230319, 0.5227953, 0, 0, 0, 1, 1,
0.4598575, 0.01602768, 2.835552, 0, 0, 0, 1, 1,
0.4602651, 0.9026585, 2.313132, 0, 0, 0, 1, 1,
0.4681498, 0.4368258, 0.1277912, 1, 1, 1, 1, 1,
0.470008, 0.1990976, 1.171523, 1, 1, 1, 1, 1,
0.4703845, -0.09270546, 2.795068, 1, 1, 1, 1, 1,
0.4740724, 1.068632, -0.4103142, 1, 1, 1, 1, 1,
0.476956, -0.3502118, 2.556551, 1, 1, 1, 1, 1,
0.4811281, 3.205103, 2.234937, 1, 1, 1, 1, 1,
0.4833091, -0.03059802, -0.03378267, 1, 1, 1, 1, 1,
0.484495, -1.734926, 2.657528, 1, 1, 1, 1, 1,
0.4864388, -0.9940189, 4.857454, 1, 1, 1, 1, 1,
0.4865254, -1.381972, 3.887927, 1, 1, 1, 1, 1,
0.4898297, -0.05110521, 0.8089028, 1, 1, 1, 1, 1,
0.4957407, 0.6813359, 0.57704, 1, 1, 1, 1, 1,
0.5042265, 0.08530025, 0.943106, 1, 1, 1, 1, 1,
0.5073072, 0.8146241, -0.001499111, 1, 1, 1, 1, 1,
0.5073773, 0.3748603, 0.9933621, 1, 1, 1, 1, 1,
0.5081987, 0.008884405, 1.344181, 0, 0, 1, 1, 1,
0.5110069, 0.4726756, 1.381606, 1, 0, 0, 1, 1,
0.5118517, 1.807473, 1.21981, 1, 0, 0, 1, 1,
0.5122552, 1.246042, 3.168259, 1, 0, 0, 1, 1,
0.5142003, -0.6629789, 3.41388, 1, 0, 0, 1, 1,
0.515461, 0.4567441, -0.2795317, 1, 0, 0, 1, 1,
0.5218068, -1.32125, 1.858911, 0, 0, 0, 1, 1,
0.5243931, -0.7235537, 1.677728, 0, 0, 0, 1, 1,
0.5250397, 0.129344, 2.104388, 0, 0, 0, 1, 1,
0.527064, 0.2632794, 1.106456, 0, 0, 0, 1, 1,
0.5285655, 0.2999116, 1.294178, 0, 0, 0, 1, 1,
0.5317642, -0.2159656, 1.846655, 0, 0, 0, 1, 1,
0.5318729, 0.1890203, 2.538036, 0, 0, 0, 1, 1,
0.5341505, -0.3561359, 3.63573, 1, 1, 1, 1, 1,
0.5381116, -1.041173, 3.562772, 1, 1, 1, 1, 1,
0.5409697, -0.2665085, 2.93358, 1, 1, 1, 1, 1,
0.5410705, 0.5409866, 1.710154, 1, 1, 1, 1, 1,
0.5415197, 0.3965472, 0.3074766, 1, 1, 1, 1, 1,
0.5459255, -1.297519, 1.469198, 1, 1, 1, 1, 1,
0.5506654, -1.600737, 2.72428, 1, 1, 1, 1, 1,
0.5523074, -1.183414, 3.004265, 1, 1, 1, 1, 1,
0.5543569, 1.639462, -0.5064835, 1, 1, 1, 1, 1,
0.5544287, -1.120362, 3.390239, 1, 1, 1, 1, 1,
0.5598283, -0.5690299, 2.85159, 1, 1, 1, 1, 1,
0.5636204, 1.426753, 0.3886614, 1, 1, 1, 1, 1,
0.5640734, -2.4708, 3.634398, 1, 1, 1, 1, 1,
0.5681803, 0.7015957, -0.5498261, 1, 1, 1, 1, 1,
0.5713064, 1.205483, 0.222917, 1, 1, 1, 1, 1,
0.5723727, 0.8902891, 1.836807, 0, 0, 1, 1, 1,
0.5725642, 1.9736, 1.526432, 1, 0, 0, 1, 1,
0.5739409, -0.02125789, 2.158775, 1, 0, 0, 1, 1,
0.576914, 0.1183976, 2.028649, 1, 0, 0, 1, 1,
0.5834711, 0.875684, 0.5026782, 1, 0, 0, 1, 1,
0.6067924, -0.7178848, 3.909253, 1, 0, 0, 1, 1,
0.6070847, -0.2357924, 1.479795, 0, 0, 0, 1, 1,
0.6072318, -0.1255002, 3.134118, 0, 0, 0, 1, 1,
0.6113604, 0.5161113, 0.778412, 0, 0, 0, 1, 1,
0.6223523, 2.159387, 2.192381, 0, 0, 0, 1, 1,
0.6253202, 0.352406, 1.631462, 0, 0, 0, 1, 1,
0.6272888, -1.116366, 0.6801245, 0, 0, 0, 1, 1,
0.6306851, 0.06467759, 0.7313663, 0, 0, 0, 1, 1,
0.6318312, 1.796794, 0.0748556, 1, 1, 1, 1, 1,
0.6320486, -0.2844347, -0.1477455, 1, 1, 1, 1, 1,
0.6350049, -1.305657, 2.381664, 1, 1, 1, 1, 1,
0.6360453, 0.8014167, 1.927992, 1, 1, 1, 1, 1,
0.6404346, -0.01061069, 3.518686, 1, 1, 1, 1, 1,
0.6413958, 0.7365707, -0.2525658, 1, 1, 1, 1, 1,
0.6426644, -0.1830368, 2.81765, 1, 1, 1, 1, 1,
0.6460478, -1.596155, 1.802247, 1, 1, 1, 1, 1,
0.6468178, 0.4203372, 1.869527, 1, 1, 1, 1, 1,
0.6566978, -0.5359003, 1.296303, 1, 1, 1, 1, 1,
0.6585707, -0.6112165, 2.843476, 1, 1, 1, 1, 1,
0.6589316, 0.9514642, 0.5064231, 1, 1, 1, 1, 1,
0.6612203, -0.6681587, 1.991889, 1, 1, 1, 1, 1,
0.6618822, 0.2135972, 1.589131, 1, 1, 1, 1, 1,
0.6655143, 0.4044943, 0.2410285, 1, 1, 1, 1, 1,
0.6662582, 0.8253251, 0.1845971, 0, 0, 1, 1, 1,
0.6697709, 0.3587181, 1.763264, 1, 0, 0, 1, 1,
0.6710314, -1.242177, 2.191081, 1, 0, 0, 1, 1,
0.6762176, -1.23411, 2.863844, 1, 0, 0, 1, 1,
0.689489, -0.1861202, 3.118829, 1, 0, 0, 1, 1,
0.6941685, 0.9553643, -1.422367, 1, 0, 0, 1, 1,
0.6974377, -0.1409067, 2.904384, 0, 0, 0, 1, 1,
0.7003251, -0.3369728, 1.341196, 0, 0, 0, 1, 1,
0.7011278, -0.7734566, 3.203932, 0, 0, 0, 1, 1,
0.7015137, -0.7672024, 3.151164, 0, 0, 0, 1, 1,
0.7035139, 0.5448605, 1.228967, 0, 0, 0, 1, 1,
0.7049331, -0.4920882, 1.822081, 0, 0, 0, 1, 1,
0.7140923, 0.7554812, 2.445242, 0, 0, 0, 1, 1,
0.7173008, 2.956825, -0.5324278, 1, 1, 1, 1, 1,
0.7173467, -0.5172426, 2.154412, 1, 1, 1, 1, 1,
0.7192083, -0.04704539, 1.236678, 1, 1, 1, 1, 1,
0.7203194, -0.5535152, 1.676723, 1, 1, 1, 1, 1,
0.7242029, 0.6334255, -0.7397668, 1, 1, 1, 1, 1,
0.7289955, -0.3640487, 1.133916, 1, 1, 1, 1, 1,
0.7314062, -0.116376, 2.762704, 1, 1, 1, 1, 1,
0.733687, 0.9010369, 2.578916, 1, 1, 1, 1, 1,
0.7400052, -2.18292, 2.51186, 1, 1, 1, 1, 1,
0.7460866, -0.8959007, 0.03288266, 1, 1, 1, 1, 1,
0.7461556, -0.07303542, 2.441491, 1, 1, 1, 1, 1,
0.7560994, -0.01802735, 0.4570766, 1, 1, 1, 1, 1,
0.756313, -0.1343632, 1.513561, 1, 1, 1, 1, 1,
0.7611793, -0.8962481, 2.659451, 1, 1, 1, 1, 1,
0.7612351, -0.5536975, 4.426363, 1, 1, 1, 1, 1,
0.7648568, 0.2824141, 1.328135, 0, 0, 1, 1, 1,
0.76568, -0.2000938, 3.544487, 1, 0, 0, 1, 1,
0.7693709, -1.326106, 2.15136, 1, 0, 0, 1, 1,
0.7707454, -0.3693462, 0.9808238, 1, 0, 0, 1, 1,
0.7718801, 0.9872007, 0.527162, 1, 0, 0, 1, 1,
0.7724626, 0.506956, 1.413264, 1, 0, 0, 1, 1,
0.7776428, 1.043982, 0.2969777, 0, 0, 0, 1, 1,
0.7806381, 1.530324, 0.8633283, 0, 0, 0, 1, 1,
0.7825348, -0.7919911, 3.221333, 0, 0, 0, 1, 1,
0.7837205, -1.060996, 4.316278, 0, 0, 0, 1, 1,
0.7839602, 0.3518947, -0.07823925, 0, 0, 0, 1, 1,
0.7917619, -0.9443039, 2.263496, 0, 0, 0, 1, 1,
0.7967348, 0.2926776, 2.70399, 0, 0, 0, 1, 1,
0.7979588, -0.5123432, 2.832794, 1, 1, 1, 1, 1,
0.8012162, -0.4426481, 2.494183, 1, 1, 1, 1, 1,
0.8035154, 0.6421193, 0.5223274, 1, 1, 1, 1, 1,
0.8036379, 0.2434717, 3.182903, 1, 1, 1, 1, 1,
0.8122305, -0.2416665, 1.260394, 1, 1, 1, 1, 1,
0.8151689, 0.8834533, 1.207229, 1, 1, 1, 1, 1,
0.8166496, 0.4321173, 1.065402, 1, 1, 1, 1, 1,
0.8318304, 1.19491, -0.6953889, 1, 1, 1, 1, 1,
0.8327462, 0.2535461, 4.118285, 1, 1, 1, 1, 1,
0.8329163, 0.8701914, 1.384501, 1, 1, 1, 1, 1,
0.8348319, 0.5649871, -1.5713, 1, 1, 1, 1, 1,
0.8349274, 0.7838735, -0.3624176, 1, 1, 1, 1, 1,
0.8426008, 0.6275733, -0.8518458, 1, 1, 1, 1, 1,
0.8428372, -0.06366973, 1.754382, 1, 1, 1, 1, 1,
0.8453022, 0.4884212, 1.183545, 1, 1, 1, 1, 1,
0.8485314, -0.3029544, 1.682166, 0, 0, 1, 1, 1,
0.8502329, -2.058444, 3.287195, 1, 0, 0, 1, 1,
0.8538358, 0.8867092, -0.06351461, 1, 0, 0, 1, 1,
0.8575498, -1.944065, 1.919078, 1, 0, 0, 1, 1,
0.85783, 0.1227272, 1.01197, 1, 0, 0, 1, 1,
0.8648967, -0.1969198, 0.6222349, 1, 0, 0, 1, 1,
0.8688908, 0.7287652, 0.713003, 0, 0, 0, 1, 1,
0.8731287, -0.6313466, 1.308335, 0, 0, 0, 1, 1,
0.8789558, -1.488862, 1.421907, 0, 0, 0, 1, 1,
0.8803341, -2.28063, 3.176098, 0, 0, 0, 1, 1,
0.8846511, -0.2852816, 1.149572, 0, 0, 0, 1, 1,
0.8847558, 0.9152889, -0.1845515, 0, 0, 0, 1, 1,
0.885262, 1.146183, 1.644275, 0, 0, 0, 1, 1,
0.888599, 0.9573655, 0.08422906, 1, 1, 1, 1, 1,
0.8921215, 1.492481, -1.473621, 1, 1, 1, 1, 1,
0.8931205, -0.575283, 2.268125, 1, 1, 1, 1, 1,
0.8976843, -1.866766, 2.307224, 1, 1, 1, 1, 1,
0.8988236, -0.03562473, 3.083067, 1, 1, 1, 1, 1,
0.8997811, -1.01532, 2.071107, 1, 1, 1, 1, 1,
0.9002556, 0.0117138, 0.9646735, 1, 1, 1, 1, 1,
0.9003943, -0.6073422, 3.019818, 1, 1, 1, 1, 1,
0.9017984, -0.8202552, 1.923588, 1, 1, 1, 1, 1,
0.9022158, 0.2006068, 0.1923613, 1, 1, 1, 1, 1,
0.9061978, 1.145275, 1.396113, 1, 1, 1, 1, 1,
0.9100298, 1.60767, 0.7087662, 1, 1, 1, 1, 1,
0.9204806, 0.9232523, 0.591059, 1, 1, 1, 1, 1,
0.9204827, 0.5419275, 1.721453, 1, 1, 1, 1, 1,
0.9387146, -0.9549798, 3.458728, 1, 1, 1, 1, 1,
0.9392657, -1.756054, 0.2615443, 0, 0, 1, 1, 1,
0.9402938, 0.8838696, 0.6187299, 1, 0, 0, 1, 1,
0.9465227, -2.240303, 1.565147, 1, 0, 0, 1, 1,
0.9533073, -0.7870554, 1.753695, 1, 0, 0, 1, 1,
0.9566308, -0.1106118, 0.4425943, 1, 0, 0, 1, 1,
0.9582619, -0.3778056, 1.024497, 1, 0, 0, 1, 1,
0.9677873, -0.08927099, 1.131982, 0, 0, 0, 1, 1,
0.9681169, -0.1990325, 2.020295, 0, 0, 0, 1, 1,
0.976033, -0.7880077, 3.488976, 0, 0, 0, 1, 1,
0.9836332, -0.01355972, 2.474944, 0, 0, 0, 1, 1,
0.9904292, 1.574564, 0.6050069, 0, 0, 0, 1, 1,
0.9975727, -2.00703, 4.034136, 0, 0, 0, 1, 1,
1.004825, -0.6728753, 2.699064, 0, 0, 0, 1, 1,
1.008866, 0.809818, 0.0197076, 1, 1, 1, 1, 1,
1.009849, -0.4118632, 1.244435, 1, 1, 1, 1, 1,
1.011953, -1.923557, 2.599488, 1, 1, 1, 1, 1,
1.017649, 1.443104, 0.4664497, 1, 1, 1, 1, 1,
1.021852, -1.978941, 5.396641, 1, 1, 1, 1, 1,
1.024839, -0.9732007, 2.29558, 1, 1, 1, 1, 1,
1.0281, 1.08419, 0.2309389, 1, 1, 1, 1, 1,
1.030242, 0.1117991, 1.127439, 1, 1, 1, 1, 1,
1.035835, -0.5797772, 1.812137, 1, 1, 1, 1, 1,
1.037738, 0.1329031, 0.9998257, 1, 1, 1, 1, 1,
1.045185, -1.820466, 2.188943, 1, 1, 1, 1, 1,
1.045729, -0.4177293, 4.31664, 1, 1, 1, 1, 1,
1.052146, -1.383552, 2.113621, 1, 1, 1, 1, 1,
1.061518, -1.333428, 3.028143, 1, 1, 1, 1, 1,
1.063397, -0.2533394, 2.069079, 1, 1, 1, 1, 1,
1.069992, 0.9133602, 2.597439, 0, 0, 1, 1, 1,
1.070487, 0.6649945, 2.548285, 1, 0, 0, 1, 1,
1.07139, 1.927657, 1.451314, 1, 0, 0, 1, 1,
1.074615, -1.655833, 0.3352995, 1, 0, 0, 1, 1,
1.075997, -1.822337, 3.215966, 1, 0, 0, 1, 1,
1.080464, 3.02928, 1.073087, 1, 0, 0, 1, 1,
1.084025, -1.052653, 3.293774, 0, 0, 0, 1, 1,
1.093585, -0.6323292, 1.958184, 0, 0, 0, 1, 1,
1.098424, -0.1166374, 0.9550558, 0, 0, 0, 1, 1,
1.103316, -0.3970519, 1.689375, 0, 0, 0, 1, 1,
1.104076, -0.6763065, 3.151668, 0, 0, 0, 1, 1,
1.107953, -1.335797, 1.754988, 0, 0, 0, 1, 1,
1.117298, 2.30481, -0.2676334, 0, 0, 0, 1, 1,
1.121312, 0.7220693, 1.559841, 1, 1, 1, 1, 1,
1.130417, -2.259782, 2.310218, 1, 1, 1, 1, 1,
1.137976, 0.8537198, 2.48709, 1, 1, 1, 1, 1,
1.139638, -0.00357313, 2.341768, 1, 1, 1, 1, 1,
1.139689, -0.8654624, 1.136301, 1, 1, 1, 1, 1,
1.140526, 2.435499, 0.05508829, 1, 1, 1, 1, 1,
1.152859, -1.712076, 3.137728, 1, 1, 1, 1, 1,
1.153049, 3.144329, -1.326309, 1, 1, 1, 1, 1,
1.157509, 0.5535434, 0.7609348, 1, 1, 1, 1, 1,
1.170006, -0.7883607, 3.739042, 1, 1, 1, 1, 1,
1.170255, 0.6630342, 1.039721, 1, 1, 1, 1, 1,
1.174845, 0.4932583, 2.313034, 1, 1, 1, 1, 1,
1.17896, 1.483159, 1.009444, 1, 1, 1, 1, 1,
1.181067, 1.132358, 0.09890491, 1, 1, 1, 1, 1,
1.181543, 0.7258912, 0.6481867, 1, 1, 1, 1, 1,
1.185343, -0.8284683, 1.774561, 0, 0, 1, 1, 1,
1.186218, 1.041095, 1.42864, 1, 0, 0, 1, 1,
1.18652, 0.7621419, 1.490061, 1, 0, 0, 1, 1,
1.187629, 0.2660969, 1.002159, 1, 0, 0, 1, 1,
1.190652, 0.3703196, 0.7029541, 1, 0, 0, 1, 1,
1.192908, 0.5076265, 1.175997, 1, 0, 0, 1, 1,
1.195539, 0.4985688, 0.6431708, 0, 0, 0, 1, 1,
1.209634, 0.8269418, 0.2139999, 0, 0, 0, 1, 1,
1.214924, 0.896367, 2.047146, 0, 0, 0, 1, 1,
1.216041, -1.243585, 2.65334, 0, 0, 0, 1, 1,
1.221578, 0.5115375, 0.5168775, 0, 0, 0, 1, 1,
1.22254, 1.63143, 0.2251256, 0, 0, 0, 1, 1,
1.222549, -0.08588276, 3.576516, 0, 0, 0, 1, 1,
1.223333, -0.9494446, 1.616789, 1, 1, 1, 1, 1,
1.229965, -0.4053552, 3.591748, 1, 1, 1, 1, 1,
1.234947, -0.9272295, 3.003445, 1, 1, 1, 1, 1,
1.24551, 1.239945, 0.7217408, 1, 1, 1, 1, 1,
1.247003, 0.2557839, 2.623772, 1, 1, 1, 1, 1,
1.262415, 0.1007592, 0.6917086, 1, 1, 1, 1, 1,
1.265105, 0.1971578, 0.6937129, 1, 1, 1, 1, 1,
1.269744, -0.977401, 1.470361, 1, 1, 1, 1, 1,
1.27033, -0.01140749, 2.248547, 1, 1, 1, 1, 1,
1.272684, -0.04949415, 1.383261, 1, 1, 1, 1, 1,
1.277335, -0.5879451, 3.744262, 1, 1, 1, 1, 1,
1.285454, -0.2559987, 0.6497953, 1, 1, 1, 1, 1,
1.291384, -1.406085, 1.997545, 1, 1, 1, 1, 1,
1.296186, -0.3384852, 1.454939, 1, 1, 1, 1, 1,
1.305488, -1.015593, 2.389951, 1, 1, 1, 1, 1,
1.306637, -1.084457, 1.038441, 0, 0, 1, 1, 1,
1.307236, -0.4687232, 2.086151, 1, 0, 0, 1, 1,
1.33461, 0.9608468, 1.11857, 1, 0, 0, 1, 1,
1.342035, 0.1536221, 1.463181, 1, 0, 0, 1, 1,
1.34315, 1.929306, 2.166145, 1, 0, 0, 1, 1,
1.348359, 1.012273, 1.670262, 1, 0, 0, 1, 1,
1.356962, 2.778745, 2.064023, 0, 0, 0, 1, 1,
1.366915, -0.2388131, 2.100276, 0, 0, 0, 1, 1,
1.369642, 1.284729, 0.25943, 0, 0, 0, 1, 1,
1.373612, 0.1123911, 2.641563, 0, 0, 0, 1, 1,
1.387048, -0.4411999, 1.210984, 0, 0, 0, 1, 1,
1.387736, 2.724415, 1.338233, 0, 0, 0, 1, 1,
1.390036, -0.04665609, 1.711815, 0, 0, 0, 1, 1,
1.390271, 0.08085917, 2.507778, 1, 1, 1, 1, 1,
1.398719, -1.204086, 2.654985, 1, 1, 1, 1, 1,
1.39921, 0.4492033, 2.853827, 1, 1, 1, 1, 1,
1.402068, -0.08581196, 1.220832, 1, 1, 1, 1, 1,
1.402398, 1.186392, -0.240583, 1, 1, 1, 1, 1,
1.40267, 0.4410771, 1.593202, 1, 1, 1, 1, 1,
1.418619, -0.9381602, -1.498851, 1, 1, 1, 1, 1,
1.431791, 1.275888, 2.60104, 1, 1, 1, 1, 1,
1.437753, 0.4944351, -0.03780617, 1, 1, 1, 1, 1,
1.438629, -0.8484771, 2.304203, 1, 1, 1, 1, 1,
1.447722, -1.395192, 1.961903, 1, 1, 1, 1, 1,
1.448211, 0.1035813, 0.4296198, 1, 1, 1, 1, 1,
1.4526, 0.2625188, 2.169652, 1, 1, 1, 1, 1,
1.457411, 0.1341983, -0.01322532, 1, 1, 1, 1, 1,
1.457701, 0.07691468, 0.6783471, 1, 1, 1, 1, 1,
1.462884, 1.506562, 0.4741828, 0, 0, 1, 1, 1,
1.465128, -1.397406, 2.192482, 1, 0, 0, 1, 1,
1.473703, 1.784523, 0.7922587, 1, 0, 0, 1, 1,
1.475368, -0.1948909, 2.149252, 1, 0, 0, 1, 1,
1.479671, 0.6059068, 1.226646, 1, 0, 0, 1, 1,
1.48346, -0.04312779, 2.177601, 1, 0, 0, 1, 1,
1.485745, -0.0575371, 0.9421203, 0, 0, 0, 1, 1,
1.491138, -1.43561, 1.574235, 0, 0, 0, 1, 1,
1.495555, 0.5088356, -0.5982977, 0, 0, 0, 1, 1,
1.505594, 1.648175, 1.101325, 0, 0, 0, 1, 1,
1.514329, 0.9386266, 2.395172, 0, 0, 0, 1, 1,
1.518647, -1.267512, 2.921338, 0, 0, 0, 1, 1,
1.53102, -0.5263847, 2.747522, 0, 0, 0, 1, 1,
1.532998, -0.2338708, 1.366268, 1, 1, 1, 1, 1,
1.551322, 1.092254, 0.02371983, 1, 1, 1, 1, 1,
1.555386, 0.2228162, 1.717052, 1, 1, 1, 1, 1,
1.558553, -0.2638244, 1.468234, 1, 1, 1, 1, 1,
1.566577, -0.182712, 1.321414, 1, 1, 1, 1, 1,
1.577145, -0.7714809, 2.372016, 1, 1, 1, 1, 1,
1.584364, 0.8884435, -0.2818321, 1, 1, 1, 1, 1,
1.608792, 1.337632, 1.074394, 1, 1, 1, 1, 1,
1.620373, -0.7129591, 3.504482, 1, 1, 1, 1, 1,
1.623657, 1.034297, 2.071135, 1, 1, 1, 1, 1,
1.631318, -1.470176, 2.791264, 1, 1, 1, 1, 1,
1.631349, -1.029868, 3.282059, 1, 1, 1, 1, 1,
1.644495, -0.5856134, 3.169415, 1, 1, 1, 1, 1,
1.671968, 0.3704117, 1.07443, 1, 1, 1, 1, 1,
1.683527, -0.6083677, 1.60748, 1, 1, 1, 1, 1,
1.685724, 0.8706833, 0.5458114, 0, 0, 1, 1, 1,
1.686365, 2.192245, -0.2140849, 1, 0, 0, 1, 1,
1.68757, -0.5184942, -0.2554878, 1, 0, 0, 1, 1,
1.696101, -0.9255283, 2.104624, 1, 0, 0, 1, 1,
1.698987, -0.08066437, 1.075333, 1, 0, 0, 1, 1,
1.70658, -1.378838, 0.8364221, 1, 0, 0, 1, 1,
1.728091, 0.7681343, 1.258044, 0, 0, 0, 1, 1,
1.731841, -0.4591269, 2.511621, 0, 0, 0, 1, 1,
1.752383, 0.1647548, 2.28491, 0, 0, 0, 1, 1,
1.753102, 1.325767, 2.246775, 0, 0, 0, 1, 1,
1.789268, -0.4503291, 3.838538, 0, 0, 0, 1, 1,
1.791403, 0.336481, 0.776623, 0, 0, 0, 1, 1,
1.796595, 0.4500838, -0.7069663, 0, 0, 0, 1, 1,
1.807968, 2.210865, 0.2529908, 1, 1, 1, 1, 1,
1.811994, 1.872057, 0.5522008, 1, 1, 1, 1, 1,
1.813414, 0.5828692, 0.6668762, 1, 1, 1, 1, 1,
1.859914, -0.540258, 0.5978966, 1, 1, 1, 1, 1,
1.860768, 0.0846849, 1.124278, 1, 1, 1, 1, 1,
1.865757, -0.8762717, 3.158399, 1, 1, 1, 1, 1,
1.866034, -0.5744296, 2.174886, 1, 1, 1, 1, 1,
1.934319, 1.381023, 2.193134, 1, 1, 1, 1, 1,
1.948066, -0.6222795, 2.241213, 1, 1, 1, 1, 1,
1.959721, 1.359522, 2.337806, 1, 1, 1, 1, 1,
1.97785, 2.301648, 1.067365, 1, 1, 1, 1, 1,
2.010025, -0.9055839, 2.87482, 1, 1, 1, 1, 1,
2.083992, -0.05051913, 1.174827, 1, 1, 1, 1, 1,
2.09097, 1.199315, -0.8029019, 1, 1, 1, 1, 1,
2.09297, -0.502588, 0.1516895, 1, 1, 1, 1, 1,
2.165596, 1.341672, -1.150063, 0, 0, 1, 1, 1,
2.184911, 1.661504, 0.6694182, 1, 0, 0, 1, 1,
2.185963, 1.002638, 1.091461, 1, 0, 0, 1, 1,
2.232409, -0.678185, 0.1878753, 1, 0, 0, 1, 1,
2.24115, 0.4723184, 1.852809, 1, 0, 0, 1, 1,
2.260952, 0.6740679, 1.08768, 1, 0, 0, 1, 1,
2.274721, -1.433899, 3.702207, 0, 0, 0, 1, 1,
2.300549, 1.115594, 1.349142, 0, 0, 0, 1, 1,
2.310804, 1.161614, 1.612134, 0, 0, 0, 1, 1,
2.325676, 1.302709, 1.258568, 0, 0, 0, 1, 1,
2.356016, 0.1608832, 1.232091, 0, 0, 0, 1, 1,
2.384614, -0.7941913, 0.7495944, 0, 0, 0, 1, 1,
2.419931, -0.8624548, 2.036958, 0, 0, 0, 1, 1,
2.422307, 1.881986, 0.3116833, 1, 1, 1, 1, 1,
2.471656, -1.036826, 1.855057, 1, 1, 1, 1, 1,
2.480384, 0.2153216, 1.454152, 1, 1, 1, 1, 1,
2.529736, -1.154183, -0.2038063, 1, 1, 1, 1, 1,
2.589265, -0.6849437, 1.704746, 1, 1, 1, 1, 1,
2.595887, -0.4898732, 2.491243, 1, 1, 1, 1, 1,
3.288183, -0.6009881, 2.942107, 1, 1, 1, 1, 1
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
var radius = 9.819209;
var distance = 34.48956;
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
mvMatrix.translate( -0.2869295, -0.02832437, 0.4024653 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.48956);
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
