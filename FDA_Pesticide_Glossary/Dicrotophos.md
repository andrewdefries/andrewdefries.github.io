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
-3.108657, -2.152755, -1.531951, 1, 0, 0, 1,
-2.89468, -0.8745124, -1.516501, 1, 0.007843138, 0, 1,
-2.632942, -0.9449373, -2.051755, 1, 0.01176471, 0, 1,
-2.6319, 0.7215801, -1.8469, 1, 0.01960784, 0, 1,
-2.510611, 0.3305735, -1.510879, 1, 0.02352941, 0, 1,
-2.472675, -0.2726986, -2.128772, 1, 0.03137255, 0, 1,
-2.456435, -2.052601, -2.710966, 1, 0.03529412, 0, 1,
-2.411044, -1.329818, -3.574111, 1, 0.04313726, 0, 1,
-2.408321, -0.766468, -1.216443, 1, 0.04705882, 0, 1,
-2.405095, -1.386802, -3.025206, 1, 0.05490196, 0, 1,
-2.323506, 0.6525748, -1.94503, 1, 0.05882353, 0, 1,
-2.231801, -0.5119812, -1.218508, 1, 0.06666667, 0, 1,
-2.161342, -0.1900793, -0.7453447, 1, 0.07058824, 0, 1,
-2.146173, -1.136164, -1.659866, 1, 0.07843138, 0, 1,
-2.124887, -0.6241534, -1.554971, 1, 0.08235294, 0, 1,
-2.119977, 0.3378089, -1.451566, 1, 0.09019608, 0, 1,
-2.118741, 0.758554, -1.172138, 1, 0.09411765, 0, 1,
-2.117513, -0.4974366, -2.290416, 1, 0.1019608, 0, 1,
-2.081268, 0.8281289, -1.645176, 1, 0.1098039, 0, 1,
-2.03463, 0.0534913, -1.799598, 1, 0.1137255, 0, 1,
-1.959021, 0.4421032, -1.837509, 1, 0.1215686, 0, 1,
-1.924594, -1.316544, -0.1121988, 1, 0.1254902, 0, 1,
-1.892614, 2.185985, -1.049543, 1, 0.1333333, 0, 1,
-1.887204, 0.6817317, -1.810437, 1, 0.1372549, 0, 1,
-1.862759, -1.108154, -1.047781, 1, 0.145098, 0, 1,
-1.861655, -0.9582145, -0.6261625, 1, 0.1490196, 0, 1,
-1.84808, -1.385871, -2.016568, 1, 0.1568628, 0, 1,
-1.843589, 1.087814, -0.764698, 1, 0.1607843, 0, 1,
-1.843422, -0.7686883, -1.397912, 1, 0.1686275, 0, 1,
-1.838892, 1.07572, -2.040491, 1, 0.172549, 0, 1,
-1.774093, 1.76867, -0.8527954, 1, 0.1803922, 0, 1,
-1.758184, 1.380722, -0.5291497, 1, 0.1843137, 0, 1,
-1.755866, 1.268401, -1.376138, 1, 0.1921569, 0, 1,
-1.742161, 1.268663, -1.868305, 1, 0.1960784, 0, 1,
-1.725445, 0.3454698, -1.71004, 1, 0.2039216, 0, 1,
-1.717191, -1.242747, -2.290492, 1, 0.2117647, 0, 1,
-1.699002, -0.02040031, -1.641354, 1, 0.2156863, 0, 1,
-1.68478, 2.399324, 1.029529, 1, 0.2235294, 0, 1,
-1.670427, -0.5873518, -2.455189, 1, 0.227451, 0, 1,
-1.666198, -1.279381, -1.316002, 1, 0.2352941, 0, 1,
-1.665413, 0.5394113, -0.9284142, 1, 0.2392157, 0, 1,
-1.656753, -0.9168313, -1.777706, 1, 0.2470588, 0, 1,
-1.642257, -1.463846, -0.5069001, 1, 0.2509804, 0, 1,
-1.624567, -1.936722, -2.383116, 1, 0.2588235, 0, 1,
-1.618596, 1.519448, -1.765738, 1, 0.2627451, 0, 1,
-1.598199, 0.1067304, -0.9861642, 1, 0.2705882, 0, 1,
-1.593559, 0.1460464, -3.348316, 1, 0.2745098, 0, 1,
-1.585507, -0.651589, -0.7233598, 1, 0.282353, 0, 1,
-1.577029, 0.931991, -0.9809089, 1, 0.2862745, 0, 1,
-1.559085, -0.4581157, -1.918215, 1, 0.2941177, 0, 1,
-1.545747, -0.6701379, -2.085198, 1, 0.3019608, 0, 1,
-1.54212, 0.4738919, -1.612253, 1, 0.3058824, 0, 1,
-1.521662, 1.576637, -2.036202, 1, 0.3137255, 0, 1,
-1.520099, 0.540466, -0.3774373, 1, 0.3176471, 0, 1,
-1.515439, 0.258053, -0.5868739, 1, 0.3254902, 0, 1,
-1.511178, 0.01153215, -1.782471, 1, 0.3294118, 0, 1,
-1.507965, 0.3978291, 0.5454987, 1, 0.3372549, 0, 1,
-1.501972, 0.5467099, -2.709773, 1, 0.3411765, 0, 1,
-1.466033, -0.3110546, -2.374642, 1, 0.3490196, 0, 1,
-1.464558, 0.0554796, -2.190334, 1, 0.3529412, 0, 1,
-1.463383, 2.015996, 0.7221844, 1, 0.3607843, 0, 1,
-1.437687, -1.97654, -1.887444, 1, 0.3647059, 0, 1,
-1.432179, -1.404331, -4.1912, 1, 0.372549, 0, 1,
-1.43078, -0.9811063, -0.8789977, 1, 0.3764706, 0, 1,
-1.4202, -0.1402465, -2.443717, 1, 0.3843137, 0, 1,
-1.404624, -0.1120164, -2.362457, 1, 0.3882353, 0, 1,
-1.397643, 0.002392894, -0.482934, 1, 0.3960784, 0, 1,
-1.378458, 1.140064, -1.515214, 1, 0.4039216, 0, 1,
-1.374807, -0.5978798, -1.826023, 1, 0.4078431, 0, 1,
-1.373027, -0.2269509, -2.424546, 1, 0.4156863, 0, 1,
-1.371218, -0.1343655, -0.9677871, 1, 0.4196078, 0, 1,
-1.357934, 0.2420453, -2.366879, 1, 0.427451, 0, 1,
-1.350686, -0.9056007, -3.293001, 1, 0.4313726, 0, 1,
-1.350037, 0.4919599, -1.468617, 1, 0.4392157, 0, 1,
-1.348277, 1.563556, -0.3349691, 1, 0.4431373, 0, 1,
-1.346211, -0.5627638, -2.776886, 1, 0.4509804, 0, 1,
-1.343256, -1.132453, -2.786801, 1, 0.454902, 0, 1,
-1.342399, -1.100478, -2.630101, 1, 0.4627451, 0, 1,
-1.334342, 1.862313, -2.192015, 1, 0.4666667, 0, 1,
-1.333822, 0.04155125, -1.880561, 1, 0.4745098, 0, 1,
-1.330599, 0.4662741, -2.428481, 1, 0.4784314, 0, 1,
-1.328826, 0.9086996, -0.6857021, 1, 0.4862745, 0, 1,
-1.327711, 0.6314341, -0.3594787, 1, 0.4901961, 0, 1,
-1.326716, -1.157134, 0.03997809, 1, 0.4980392, 0, 1,
-1.325172, -1.837854, -0.9072136, 1, 0.5058824, 0, 1,
-1.308739, -0.08455646, -1.056525, 1, 0.509804, 0, 1,
-1.303889, 0.6540496, -1.293733, 1, 0.5176471, 0, 1,
-1.296062, 0.1338152, 0.06370001, 1, 0.5215687, 0, 1,
-1.295809, 0.9376054, -2.229541, 1, 0.5294118, 0, 1,
-1.294799, -1.239037, -1.33508, 1, 0.5333334, 0, 1,
-1.291524, 0.4603259, -1.781651, 1, 0.5411765, 0, 1,
-1.282903, -2.576112, -4.423609, 1, 0.5450981, 0, 1,
-1.275577, -0.1953035, -2.117818, 1, 0.5529412, 0, 1,
-1.260273, 0.04809483, -1.801411, 1, 0.5568628, 0, 1,
-1.256845, -1.247793, -2.38681, 1, 0.5647059, 0, 1,
-1.256343, -0.2049115, -1.847185, 1, 0.5686275, 0, 1,
-1.253532, -0.8217471, -2.798696, 1, 0.5764706, 0, 1,
-1.248498, -0.8690552, -2.495438, 1, 0.5803922, 0, 1,
-1.239359, -0.8227125, -0.8366509, 1, 0.5882353, 0, 1,
-1.231716, 0.295911, -1.345033, 1, 0.5921569, 0, 1,
-1.22809, 0.2518462, -1.705295, 1, 0.6, 0, 1,
-1.223427, -1.672802, -3.344029, 1, 0.6078432, 0, 1,
-1.222954, -1.440248, -2.563006, 1, 0.6117647, 0, 1,
-1.216701, 1.167745, -1.381288, 1, 0.6196079, 0, 1,
-1.212075, -0.2522622, -2.398225, 1, 0.6235294, 0, 1,
-1.208937, -0.1508343, -3.231733, 1, 0.6313726, 0, 1,
-1.205499, -0.4260203, -2.995869, 1, 0.6352941, 0, 1,
-1.204368, -0.7549896, -2.631252, 1, 0.6431373, 0, 1,
-1.192041, 0.07374989, -1.132573, 1, 0.6470588, 0, 1,
-1.186983, -0.2447984, -2.802061, 1, 0.654902, 0, 1,
-1.184694, 1.307666, -0.858245, 1, 0.6588235, 0, 1,
-1.180838, -0.8571306, -1.059599, 1, 0.6666667, 0, 1,
-1.177042, -0.2143569, -1.321203, 1, 0.6705883, 0, 1,
-1.17064, -1.164702, -2.334852, 1, 0.6784314, 0, 1,
-1.165404, 1.903842, -1.292776, 1, 0.682353, 0, 1,
-1.16306, 0.6121548, -1.079155, 1, 0.6901961, 0, 1,
-1.161975, -0.3294811, -1.223163, 1, 0.6941177, 0, 1,
-1.160199, 0.3838288, -0.2658384, 1, 0.7019608, 0, 1,
-1.15989, 0.434351, -1.040017, 1, 0.7098039, 0, 1,
-1.15586, 0.7249168, -1.860348, 1, 0.7137255, 0, 1,
-1.155386, 0.3874015, 0.5716091, 1, 0.7215686, 0, 1,
-1.148495, 1.029641, 0.239256, 1, 0.7254902, 0, 1,
-1.143003, 0.3523299, -0.4733767, 1, 0.7333333, 0, 1,
-1.133195, 1.917791, -2.029524, 1, 0.7372549, 0, 1,
-1.12749, -0.4075789, -2.312074, 1, 0.7450981, 0, 1,
-1.118036, 1.59518, 0.03424425, 1, 0.7490196, 0, 1,
-1.117378, -0.6545398, -1.968866, 1, 0.7568628, 0, 1,
-1.101647, 0.2296097, -0.67234, 1, 0.7607843, 0, 1,
-1.099843, -1.376859, -1.728754, 1, 0.7686275, 0, 1,
-1.097169, -0.3328471, -2.694535, 1, 0.772549, 0, 1,
-1.096545, -1.061031, -1.975916, 1, 0.7803922, 0, 1,
-1.095848, -0.9365749, -2.164944, 1, 0.7843137, 0, 1,
-1.094554, -0.4685652, -1.617786, 1, 0.7921569, 0, 1,
-1.071102, 0.4743782, -1.127655, 1, 0.7960784, 0, 1,
-1.054883, -2.687335, -3.12564, 1, 0.8039216, 0, 1,
-1.050882, 0.826198, -0.2343832, 1, 0.8117647, 0, 1,
-1.050638, 0.2926707, -0.9121547, 1, 0.8156863, 0, 1,
-1.042566, -0.342701, -3.536877, 1, 0.8235294, 0, 1,
-1.029189, -0.8453256, -3.118609, 1, 0.827451, 0, 1,
-1.026337, -1.32612, -2.846314, 1, 0.8352941, 0, 1,
-1.025151, -0.5348984, -3.752791, 1, 0.8392157, 0, 1,
-1.016747, 0.3867938, -0.9747762, 1, 0.8470588, 0, 1,
-1.01507, 2.072648, -0.7440174, 1, 0.8509804, 0, 1,
-1.006213, 0.1479961, 0.3857385, 1, 0.8588235, 0, 1,
-1.005911, -1.068706, -1.424315, 1, 0.8627451, 0, 1,
-1.00349, -0.06458902, -0.4739626, 1, 0.8705882, 0, 1,
-1.000542, -0.1000185, -2.693392, 1, 0.8745098, 0, 1,
-0.9862103, -1.437515, -1.921839, 1, 0.8823529, 0, 1,
-0.9848765, -1.00067, -2.73126, 1, 0.8862745, 0, 1,
-0.9794717, 0.656187, -1.206678, 1, 0.8941177, 0, 1,
-0.9635129, -0.541042, -1.718814, 1, 0.8980392, 0, 1,
-0.9570307, -3.510062, -2.666223, 1, 0.9058824, 0, 1,
-0.9556217, 0.4735644, -0.6131975, 1, 0.9137255, 0, 1,
-0.9555991, -1.628583, -3.554791, 1, 0.9176471, 0, 1,
-0.9534732, -0.06540607, -2.050487, 1, 0.9254902, 0, 1,
-0.9448556, 1.012909, 0.172866, 1, 0.9294118, 0, 1,
-0.9410427, 0.3847454, -1.502705, 1, 0.9372549, 0, 1,
-0.9337279, -1.087894, -2.938832, 1, 0.9411765, 0, 1,
-0.9244013, 0.5788093, -1.255949, 1, 0.9490196, 0, 1,
-0.921436, 1.062469, 0.2824683, 1, 0.9529412, 0, 1,
-0.9192929, 0.2086082, -1.140299, 1, 0.9607843, 0, 1,
-0.9184351, 1.000222, -0.9359505, 1, 0.9647059, 0, 1,
-0.9103342, -1.537212, -2.43408, 1, 0.972549, 0, 1,
-0.9058169, 1.746903, 0.304216, 1, 0.9764706, 0, 1,
-0.9052734, -0.01966805, -1.344971, 1, 0.9843137, 0, 1,
-0.8975236, 0.6787241, -1.565063, 1, 0.9882353, 0, 1,
-0.8907315, -0.6498372, -2.580832, 1, 0.9960784, 0, 1,
-0.8840074, -1.112124, -2.625385, 0.9960784, 1, 0, 1,
-0.8734874, 0.9124729, -0.1552414, 0.9921569, 1, 0, 1,
-0.8733647, 1.095088, -2.051352, 0.9843137, 1, 0, 1,
-0.8722618, -1.750713, -2.010357, 0.9803922, 1, 0, 1,
-0.8721434, 1.583417, 1.210619, 0.972549, 1, 0, 1,
-0.8670456, -0.1048703, -2.844324, 0.9686275, 1, 0, 1,
-0.866828, -1.887885, -3.474498, 0.9607843, 1, 0, 1,
-0.8617861, 0.03052537, -1.323154, 0.9568627, 1, 0, 1,
-0.8509662, 0.909512, 1.617588, 0.9490196, 1, 0, 1,
-0.8392707, 0.1308706, -1.565039, 0.945098, 1, 0, 1,
-0.8383069, 0.01661862, -1.899118, 0.9372549, 1, 0, 1,
-0.8302155, -1.153722, -4.78966, 0.9333333, 1, 0, 1,
-0.8299473, 0.3027399, -1.292487, 0.9254902, 1, 0, 1,
-0.8288426, 0.7388243, 0.7286588, 0.9215686, 1, 0, 1,
-0.8273776, 0.03043897, -1.121013, 0.9137255, 1, 0, 1,
-0.8268583, 1.95854, -1.679574, 0.9098039, 1, 0, 1,
-0.8238397, 1.569735, -2.007579, 0.9019608, 1, 0, 1,
-0.8222573, -0.7494065, -2.771496, 0.8941177, 1, 0, 1,
-0.8179366, -0.7723758, -2.274696, 0.8901961, 1, 0, 1,
-0.8165618, 0.1396164, -1.971643, 0.8823529, 1, 0, 1,
-0.8122391, -1.244147, -2.904829, 0.8784314, 1, 0, 1,
-0.8108124, -1.152103, -0.06243668, 0.8705882, 1, 0, 1,
-0.8081923, -1.511308, -3.829043, 0.8666667, 1, 0, 1,
-0.8025196, 0.07199197, -0.8944202, 0.8588235, 1, 0, 1,
-0.799544, 0.2144094, -1.369296, 0.854902, 1, 0, 1,
-0.796818, 0.3333015, -0.9262434, 0.8470588, 1, 0, 1,
-0.7959121, -0.6556906, -2.074768, 0.8431373, 1, 0, 1,
-0.7855573, -0.07702576, -0.3303624, 0.8352941, 1, 0, 1,
-0.7799993, 1.14145, 1.267513, 0.8313726, 1, 0, 1,
-0.7753239, -1.544576, -4.137655, 0.8235294, 1, 0, 1,
-0.7745706, 1.184414, -0.2675492, 0.8196079, 1, 0, 1,
-0.7723029, -0.5211677, -1.263233, 0.8117647, 1, 0, 1,
-0.7641213, 1.115026, 0.5594376, 0.8078431, 1, 0, 1,
-0.7641111, -0.2832914, -0.6568235, 0.8, 1, 0, 1,
-0.7571883, -1.663127, -3.653808, 0.7921569, 1, 0, 1,
-0.7567549, 0.9768965, 1.146741, 0.7882353, 1, 0, 1,
-0.7494988, 1.697626, -0.3508944, 0.7803922, 1, 0, 1,
-0.7482193, 0.2542366, -1.313863, 0.7764706, 1, 0, 1,
-0.7295929, -3.072955, -2.69512, 0.7686275, 1, 0, 1,
-0.7287823, 0.07962801, -0.1582801, 0.7647059, 1, 0, 1,
-0.7281973, -0.02277277, -0.7561358, 0.7568628, 1, 0, 1,
-0.7277399, -1.328982, -1.836823, 0.7529412, 1, 0, 1,
-0.7230299, -0.2264111, -1.589997, 0.7450981, 1, 0, 1,
-0.7223226, 0.7176012, -0.2041089, 0.7411765, 1, 0, 1,
-0.7202667, 1.122679, -0.9687274, 0.7333333, 1, 0, 1,
-0.7180408, 0.8765155, -2.370632, 0.7294118, 1, 0, 1,
-0.7176544, -1.450033, -2.862706, 0.7215686, 1, 0, 1,
-0.7133898, -1.180428, -1.742283, 0.7176471, 1, 0, 1,
-0.7108915, -0.0005333136, -2.70739, 0.7098039, 1, 0, 1,
-0.7073603, -0.7160977, -1.875576, 0.7058824, 1, 0, 1,
-0.6948336, 0.7684995, -0.4114528, 0.6980392, 1, 0, 1,
-0.68372, -1.707626, -0.7836621, 0.6901961, 1, 0, 1,
-0.6832163, -0.7712056, -3.136523, 0.6862745, 1, 0, 1,
-0.6629348, 0.4219554, -0.2590041, 0.6784314, 1, 0, 1,
-0.6628764, 0.1979871, -2.218287, 0.6745098, 1, 0, 1,
-0.662672, 0.5285129, -0.3450682, 0.6666667, 1, 0, 1,
-0.6579932, 1.072771, 0.02856519, 0.6627451, 1, 0, 1,
-0.6553428, -0.9691448, -0.6946263, 0.654902, 1, 0, 1,
-0.6432511, -0.1407967, -2.299485, 0.6509804, 1, 0, 1,
-0.6418634, 0.8733432, -0.9019269, 0.6431373, 1, 0, 1,
-0.6387115, 0.944644, 0.4418772, 0.6392157, 1, 0, 1,
-0.6313775, 0.007537077, -1.251772, 0.6313726, 1, 0, 1,
-0.6311995, -0.4728682, -1.759467, 0.627451, 1, 0, 1,
-0.6310652, -0.06683262, -2.64702, 0.6196079, 1, 0, 1,
-0.6268005, 1.299084, -0.2539301, 0.6156863, 1, 0, 1,
-0.6232488, 1.496262, 1.085323, 0.6078432, 1, 0, 1,
-0.6231101, 0.2885773, -2.570216, 0.6039216, 1, 0, 1,
-0.6230918, -0.7268252, -1.866566, 0.5960785, 1, 0, 1,
-0.6218864, 1.154589, -0.2687804, 0.5882353, 1, 0, 1,
-0.6196383, 0.7357559, -1.236744, 0.5843138, 1, 0, 1,
-0.6191617, -0.2858195, -2.201964, 0.5764706, 1, 0, 1,
-0.6184573, 0.2913692, -0.06339433, 0.572549, 1, 0, 1,
-0.6167609, 1.718399, -0.3930613, 0.5647059, 1, 0, 1,
-0.6094244, -0.260471, -1.60999, 0.5607843, 1, 0, 1,
-0.6074495, 0.9124149, -0.3552106, 0.5529412, 1, 0, 1,
-0.6064607, 1.379777, 1.06027, 0.5490196, 1, 0, 1,
-0.6034744, -1.019889, -3.489294, 0.5411765, 1, 0, 1,
-0.5941346, 0.7566766, 0.1926915, 0.5372549, 1, 0, 1,
-0.5925232, -2.344327, -3.418711, 0.5294118, 1, 0, 1,
-0.5891865, 1.105731, -3.195126, 0.5254902, 1, 0, 1,
-0.5860952, 1.061626, -0.2414993, 0.5176471, 1, 0, 1,
-0.5857398, -0.6767446, -2.032679, 0.5137255, 1, 0, 1,
-0.5840489, 0.3974615, 0.20236, 0.5058824, 1, 0, 1,
-0.5837086, 0.6751433, -1.919993, 0.5019608, 1, 0, 1,
-0.5812652, 0.4047338, -1.00887, 0.4941176, 1, 0, 1,
-0.5750473, 1.4759, 0.3002401, 0.4862745, 1, 0, 1,
-0.5723062, -0.3047109, -2.918895, 0.4823529, 1, 0, 1,
-0.5638505, 1.573929, 1.117506, 0.4745098, 1, 0, 1,
-0.5638466, 0.3907686, -0.9797915, 0.4705882, 1, 0, 1,
-0.5630678, -2.028844, -3.37841, 0.4627451, 1, 0, 1,
-0.5557804, -2.113243, -2.433364, 0.4588235, 1, 0, 1,
-0.5555057, -0.5291786, -1.923453, 0.4509804, 1, 0, 1,
-0.5485048, 1.443905, 0.2666452, 0.4470588, 1, 0, 1,
-0.5446838, 0.7973549, -0.7442878, 0.4392157, 1, 0, 1,
-0.5427983, 1.435186, -0.397623, 0.4352941, 1, 0, 1,
-0.5413558, 0.3291603, -1.41654, 0.427451, 1, 0, 1,
-0.5397068, -1.725791, -2.004596, 0.4235294, 1, 0, 1,
-0.5341172, 0.7121356, -0.4546292, 0.4156863, 1, 0, 1,
-0.5335878, -1.727224, -1.822748, 0.4117647, 1, 0, 1,
-0.5302351, -0.4141075, -0.002704039, 0.4039216, 1, 0, 1,
-0.5264949, 0.4364889, -0.4927146, 0.3960784, 1, 0, 1,
-0.5259494, -1.356044, -2.703924, 0.3921569, 1, 0, 1,
-0.5212389, 0.06530539, -2.567299, 0.3843137, 1, 0, 1,
-0.5172794, 2.041772, 1.32918, 0.3803922, 1, 0, 1,
-0.5169303, 1.295467, -0.1814229, 0.372549, 1, 0, 1,
-0.5163747, 0.02486195, -0.8194063, 0.3686275, 1, 0, 1,
-0.5150126, 0.1256415, -2.231643, 0.3607843, 1, 0, 1,
-0.5134751, 1.168563, -1.842842, 0.3568628, 1, 0, 1,
-0.5100446, -1.861586, -1.697626, 0.3490196, 1, 0, 1,
-0.5079064, 0.1258265, -0.6767878, 0.345098, 1, 0, 1,
-0.5041298, 0.007677427, -1.021943, 0.3372549, 1, 0, 1,
-0.5014374, -0.4139227, -3.521051, 0.3333333, 1, 0, 1,
-0.4988431, -0.002922619, -4.33426, 0.3254902, 1, 0, 1,
-0.4980912, -1.490902, -2.220054, 0.3215686, 1, 0, 1,
-0.4929049, 0.8879894, -1.173684, 0.3137255, 1, 0, 1,
-0.4903013, 0.2360741, -1.814851, 0.3098039, 1, 0, 1,
-0.4893645, 1.34093, -2.501448, 0.3019608, 1, 0, 1,
-0.4870223, 1.253246, -0.007501752, 0.2941177, 1, 0, 1,
-0.4839948, -0.1384371, -2.204822, 0.2901961, 1, 0, 1,
-0.4820726, -1.042507, -2.698398, 0.282353, 1, 0, 1,
-0.4754229, 0.4078947, -2.99414, 0.2784314, 1, 0, 1,
-0.4634313, -1.353557, -3.306941, 0.2705882, 1, 0, 1,
-0.4620266, 0.1385474, -2.366417, 0.2666667, 1, 0, 1,
-0.4522087, -1.176699, -1.84777, 0.2588235, 1, 0, 1,
-0.4520724, -0.5203565, -2.765213, 0.254902, 1, 0, 1,
-0.4510476, -0.300632, -0.7358253, 0.2470588, 1, 0, 1,
-0.4490387, -0.6089923, -2.294528, 0.2431373, 1, 0, 1,
-0.4464065, -0.0651144, -1.54741, 0.2352941, 1, 0, 1,
-0.4429657, 0.1285932, -2.269992, 0.2313726, 1, 0, 1,
-0.4329031, -0.4356038, -0.7203053, 0.2235294, 1, 0, 1,
-0.429312, -0.7680202, -0.7406013, 0.2196078, 1, 0, 1,
-0.4229221, -1.564558, -4.022674, 0.2117647, 1, 0, 1,
-0.4213881, -1.110112, -1.909871, 0.2078431, 1, 0, 1,
-0.4172101, 1.343084, -0.006197088, 0.2, 1, 0, 1,
-0.4160053, -0.258184, -1.554464, 0.1921569, 1, 0, 1,
-0.4127581, 1.427598, -0.9375037, 0.1882353, 1, 0, 1,
-0.4126724, -0.3489584, -1.576818, 0.1803922, 1, 0, 1,
-0.4100063, 0.8243722, 0.2900511, 0.1764706, 1, 0, 1,
-0.406867, 1.458605, -0.9663917, 0.1686275, 1, 0, 1,
-0.4045288, 1.429252, 0.2484531, 0.1647059, 1, 0, 1,
-0.4025397, 1.926647, 1.155953, 0.1568628, 1, 0, 1,
-0.3990318, 0.5315389, -1.054708, 0.1529412, 1, 0, 1,
-0.395216, 1.154814, -1.232317, 0.145098, 1, 0, 1,
-0.3935682, -1.099113, -2.73476, 0.1411765, 1, 0, 1,
-0.3918452, 0.892647, -0.2785986, 0.1333333, 1, 0, 1,
-0.3911523, 0.2843966, 0.04234875, 0.1294118, 1, 0, 1,
-0.3909414, -0.5102334, -3.21563, 0.1215686, 1, 0, 1,
-0.3758944, -0.7036987, -1.821501, 0.1176471, 1, 0, 1,
-0.3752683, -1.020758, -2.321948, 0.1098039, 1, 0, 1,
-0.373679, 0.6691739, -0.6103758, 0.1058824, 1, 0, 1,
-0.370026, -0.5357197, -3.220561, 0.09803922, 1, 0, 1,
-0.3697051, -0.223214, -2.63167, 0.09019608, 1, 0, 1,
-0.369617, -0.1236738, -2.018869, 0.08627451, 1, 0, 1,
-0.365391, 2.559748, -0.8249311, 0.07843138, 1, 0, 1,
-0.3622018, -0.2685098, -1.65282, 0.07450981, 1, 0, 1,
-0.360142, -0.9766819, -0.6142223, 0.06666667, 1, 0, 1,
-0.3490305, 1.239218, 0.1312362, 0.0627451, 1, 0, 1,
-0.3478732, 0.1378244, -1.055071, 0.05490196, 1, 0, 1,
-0.3467624, 0.653926, -1.397067, 0.05098039, 1, 0, 1,
-0.3466014, -0.6071088, -2.502859, 0.04313726, 1, 0, 1,
-0.3430938, 0.3139268, -0.7564035, 0.03921569, 1, 0, 1,
-0.3427933, -1.798379, -1.466666, 0.03137255, 1, 0, 1,
-0.3423641, 1.678298, -0.5152895, 0.02745098, 1, 0, 1,
-0.3376642, -0.3038656, -1.928745, 0.01960784, 1, 0, 1,
-0.3352698, -0.6764355, -2.387208, 0.01568628, 1, 0, 1,
-0.3347017, 1.227755, -1.056681, 0.007843138, 1, 0, 1,
-0.332062, 0.9243423, -1.215174, 0.003921569, 1, 0, 1,
-0.3286837, 1.012985, 0.9018723, 0, 1, 0.003921569, 1,
-0.3262689, -1.174134, -3.14219, 0, 1, 0.01176471, 1,
-0.3232478, -0.3467375, -3.995969, 0, 1, 0.01568628, 1,
-0.3223174, 0.8022295, 0.1157028, 0, 1, 0.02352941, 1,
-0.3206311, -0.08661712, -2.655499, 0, 1, 0.02745098, 1,
-0.3170875, 1.089702, 0.1242101, 0, 1, 0.03529412, 1,
-0.3150641, -1.600607, -5.94679, 0, 1, 0.03921569, 1,
-0.3107072, 0.3853602, -0.0305612, 0, 1, 0.04705882, 1,
-0.3091417, -0.465469, -2.915579, 0, 1, 0.05098039, 1,
-0.3049534, -0.6811689, -4.235124, 0, 1, 0.05882353, 1,
-0.304048, -0.6433564, -2.033218, 0, 1, 0.0627451, 1,
-0.3008627, -0.1664106, -2.331279, 0, 1, 0.07058824, 1,
-0.2988585, -1.003481, -3.217322, 0, 1, 0.07450981, 1,
-0.2976192, 1.198541, -0.8404173, 0, 1, 0.08235294, 1,
-0.296215, 1.969771, 0.4695611, 0, 1, 0.08627451, 1,
-0.2952249, -1.73758, -3.105339, 0, 1, 0.09411765, 1,
-0.2908809, 1.096245, -0.6628092, 0, 1, 0.1019608, 1,
-0.2896032, 0.5314437, -0.9390027, 0, 1, 0.1058824, 1,
-0.2891998, 0.3537171, -1.13222, 0, 1, 0.1137255, 1,
-0.2852158, 1.068684, 0.5346256, 0, 1, 0.1176471, 1,
-0.2824045, -0.3249574, -2.370656, 0, 1, 0.1254902, 1,
-0.2805072, -0.6723973, -2.769294, 0, 1, 0.1294118, 1,
-0.2794511, -0.1965042, -1.796583, 0, 1, 0.1372549, 1,
-0.2791932, -0.8969313, -3.580298, 0, 1, 0.1411765, 1,
-0.2736797, 0.8309883, 1.17652, 0, 1, 0.1490196, 1,
-0.2730539, -1.258214, -2.912642, 0, 1, 0.1529412, 1,
-0.2709789, 1.130202, -1.449486, 0, 1, 0.1607843, 1,
-0.2697337, 0.9021341, -0.3432835, 0, 1, 0.1647059, 1,
-0.2677199, -1.416537, -4.246224, 0, 1, 0.172549, 1,
-0.2642746, 0.6853498, -2.314077, 0, 1, 0.1764706, 1,
-0.2628769, 0.08341907, -0.4166057, 0, 1, 0.1843137, 1,
-0.2616682, -0.07950152, -2.483937, 0, 1, 0.1882353, 1,
-0.2609923, -0.1629608, -2.946929, 0, 1, 0.1960784, 1,
-0.2609174, 1.388506, -1.770528, 0, 1, 0.2039216, 1,
-0.2605765, -1.055751, -2.632789, 0, 1, 0.2078431, 1,
-0.2587994, -1.316007, -3.353316, 0, 1, 0.2156863, 1,
-0.2585198, -0.7938655, -2.09897, 0, 1, 0.2196078, 1,
-0.251725, 0.09208827, -1.735294, 0, 1, 0.227451, 1,
-0.2497627, 0.5047005, 1.063289, 0, 1, 0.2313726, 1,
-0.2496129, 0.0120638, -0.7334506, 0, 1, 0.2392157, 1,
-0.2483839, -0.4094143, -2.075976, 0, 1, 0.2431373, 1,
-0.2463625, 0.7000472, -0.9838187, 0, 1, 0.2509804, 1,
-0.2419884, 1.457423, 2.481947, 0, 1, 0.254902, 1,
-0.2408416, 1.549798, -0.2088351, 0, 1, 0.2627451, 1,
-0.2383013, 1.714849, -0.8839086, 0, 1, 0.2666667, 1,
-0.2374292, 2.110846, -0.4611274, 0, 1, 0.2745098, 1,
-0.2342862, 1.202598, 0.03209594, 0, 1, 0.2784314, 1,
-0.2305027, 0.7695531, 0.2171489, 0, 1, 0.2862745, 1,
-0.2276257, 0.2944786, -0.1863845, 0, 1, 0.2901961, 1,
-0.2234097, 0.003812652, -0.8959801, 0, 1, 0.2980392, 1,
-0.2228461, -0.2565764, -2.153979, 0, 1, 0.3058824, 1,
-0.2226851, 1.217694, 0.1186636, 0, 1, 0.3098039, 1,
-0.2213473, -0.3855404, -0.2565557, 0, 1, 0.3176471, 1,
-0.2187485, 1.534796, -1.182202, 0, 1, 0.3215686, 1,
-0.2179288, -0.061059, -1.102723, 0, 1, 0.3294118, 1,
-0.2170125, -1.143328, -1.4667, 0, 1, 0.3333333, 1,
-0.2138188, -1.516748, -1.47317, 0, 1, 0.3411765, 1,
-0.2019756, 0.3667616, -2.257576, 0, 1, 0.345098, 1,
-0.2019251, 1.216745, -0.7571742, 0, 1, 0.3529412, 1,
-0.2004243, 0.7530779, 1.225808, 0, 1, 0.3568628, 1,
-0.1993483, 2.137065, 1.6299, 0, 1, 0.3647059, 1,
-0.1989217, -1.158391, -3.662135, 0, 1, 0.3686275, 1,
-0.1988405, 1.356164, -1.655463, 0, 1, 0.3764706, 1,
-0.1986474, -0.7357872, -3.243733, 0, 1, 0.3803922, 1,
-0.1863098, -2.228026, -2.851562, 0, 1, 0.3882353, 1,
-0.1852017, 0.08172249, -1.362534, 0, 1, 0.3921569, 1,
-0.1825653, 0.6006657, 0.09581898, 0, 1, 0.4, 1,
-0.1820353, -0.02933499, -2.221581, 0, 1, 0.4078431, 1,
-0.1784203, -0.4312838, -1.68877, 0, 1, 0.4117647, 1,
-0.1721809, 0.3449716, 1.282322, 0, 1, 0.4196078, 1,
-0.1681735, -2.29088, -4.224617, 0, 1, 0.4235294, 1,
-0.166293, 0.5700676, -1.014839, 0, 1, 0.4313726, 1,
-0.1661593, 0.3335803, 0.389371, 0, 1, 0.4352941, 1,
-0.1658737, 0.4325383, 0.2049941, 0, 1, 0.4431373, 1,
-0.1566397, 1.358608, -0.1408255, 0, 1, 0.4470588, 1,
-0.1557459, -0.6627705, -3.443151, 0, 1, 0.454902, 1,
-0.1487991, -0.6167172, -2.965954, 0, 1, 0.4588235, 1,
-0.1467604, -0.2458571, -2.352185, 0, 1, 0.4666667, 1,
-0.1463124, 0.520323, 0.4518336, 0, 1, 0.4705882, 1,
-0.1455195, -0.9874493, -3.103913, 0, 1, 0.4784314, 1,
-0.1445718, -1.668371, -1.602864, 0, 1, 0.4823529, 1,
-0.14333, 0.581338, -0.663564, 0, 1, 0.4901961, 1,
-0.1414151, -0.2320487, -1.545304, 0, 1, 0.4941176, 1,
-0.1411341, 0.3048639, 1.050629, 0, 1, 0.5019608, 1,
-0.1409794, 1.490016, 0.3248958, 0, 1, 0.509804, 1,
-0.1375538, 0.1178254, -1.638978, 0, 1, 0.5137255, 1,
-0.1362789, 0.0579705, -0.03065485, 0, 1, 0.5215687, 1,
-0.1338686, -1.268931, -4.445398, 0, 1, 0.5254902, 1,
-0.1327842, -1.250701, -4.724649, 0, 1, 0.5333334, 1,
-0.1319229, -1.609045, -4.305951, 0, 1, 0.5372549, 1,
-0.1223446, 0.6665871, -0.585893, 0, 1, 0.5450981, 1,
-0.1203341, 0.1299098, -0.1084025, 0, 1, 0.5490196, 1,
-0.1175201, 0.6043081, -1.476283, 0, 1, 0.5568628, 1,
-0.1168074, 0.8264363, -0.4768353, 0, 1, 0.5607843, 1,
-0.1160196, 1.271145, 0.547287, 0, 1, 0.5686275, 1,
-0.1149773, 0.6052165, -0.7556512, 0, 1, 0.572549, 1,
-0.1044911, 1.936643, 0.8295657, 0, 1, 0.5803922, 1,
-0.1013143, -1.683215, -2.970064, 0, 1, 0.5843138, 1,
-0.09983205, -0.657218, -1.220674, 0, 1, 0.5921569, 1,
-0.09673143, -1.059291, -4.610219, 0, 1, 0.5960785, 1,
-0.09587419, -0.9480842, -2.075999, 0, 1, 0.6039216, 1,
-0.09499121, -0.693963, -2.380753, 0, 1, 0.6117647, 1,
-0.09362727, -0.6688976, -2.423631, 0, 1, 0.6156863, 1,
-0.09340224, 1.156034, 1.616421, 0, 1, 0.6235294, 1,
-0.09329419, 1.878995, -1.113875, 0, 1, 0.627451, 1,
-0.09086666, 0.2852252, 0.3416832, 0, 1, 0.6352941, 1,
-0.08781205, 1.408334, 1.196661, 0, 1, 0.6392157, 1,
-0.08742595, -0.4263583, -3.1732, 0, 1, 0.6470588, 1,
-0.0822135, -0.715975, -3.344105, 0, 1, 0.6509804, 1,
-0.08107818, -1.210803, -3.898216, 0, 1, 0.6588235, 1,
-0.08059744, -0.9983549, -2.926595, 0, 1, 0.6627451, 1,
-0.07614831, 0.7300748, 0.1559651, 0, 1, 0.6705883, 1,
-0.0715351, 0.4121377, -1.345868, 0, 1, 0.6745098, 1,
-0.0656085, -1.237989, -2.924044, 0, 1, 0.682353, 1,
-0.06503886, 0.847136, -0.2145025, 0, 1, 0.6862745, 1,
-0.06126017, 0.762757, -1.391147, 0, 1, 0.6941177, 1,
-0.06055118, -1.781922, -2.035454, 0, 1, 0.7019608, 1,
-0.06041192, 0.1499527, -0.7964569, 0, 1, 0.7058824, 1,
-0.06039216, 0.4412898, -0.9161571, 0, 1, 0.7137255, 1,
-0.05970986, 0.4262715, -0.4547198, 0, 1, 0.7176471, 1,
-0.05920477, 1.899042, 1.051205, 0, 1, 0.7254902, 1,
-0.05520889, 0.2273092, -1.909732, 0, 1, 0.7294118, 1,
-0.05452421, -0.01445198, -1.74035, 0, 1, 0.7372549, 1,
-0.05340377, -0.3045787, -2.964944, 0, 1, 0.7411765, 1,
-0.05271225, -1.340303, -2.763173, 0, 1, 0.7490196, 1,
-0.0519495, -0.5847867, -2.024125, 0, 1, 0.7529412, 1,
-0.04671352, 1.125429, -0.7249787, 0, 1, 0.7607843, 1,
-0.04418372, -2.045151, -2.784461, 0, 1, 0.7647059, 1,
-0.04256333, -0.9188969, -1.968063, 0, 1, 0.772549, 1,
-0.04095479, 0.2319772, 0.07210126, 0, 1, 0.7764706, 1,
-0.03888148, 0.2343742, 0.1745097, 0, 1, 0.7843137, 1,
-0.03798969, -0.4220318, -3.12633, 0, 1, 0.7882353, 1,
-0.03234318, 1.187606, 0.02450895, 0, 1, 0.7960784, 1,
-0.03090132, -0.6681572, -3.20669, 0, 1, 0.8039216, 1,
-0.02907111, 0.5825214, 1.393581, 0, 1, 0.8078431, 1,
-0.02470554, 0.3870456, 1.406859, 0, 1, 0.8156863, 1,
-0.0238081, 0.7182598, -0.4139389, 0, 1, 0.8196079, 1,
-0.02169647, -2.124582, -4.202884, 0, 1, 0.827451, 1,
-0.01965703, -0.401528, -2.972582, 0, 1, 0.8313726, 1,
-0.01939579, 1.321231, -0.2454478, 0, 1, 0.8392157, 1,
-0.0176946, 1.393876, -1.053574, 0, 1, 0.8431373, 1,
-0.006579563, -0.3798986, -4.35149, 0, 1, 0.8509804, 1,
-0.004094736, -0.6606621, -3.574909, 0, 1, 0.854902, 1,
-0.003317521, -0.8318313, -4.38756, 0, 1, 0.8627451, 1,
-0.0007385343, -0.4536817, -2.597554, 0, 1, 0.8666667, 1,
0.004742932, 0.004100029, 1.573082, 0, 1, 0.8745098, 1,
0.009541396, -1.770487, 3.451449, 0, 1, 0.8784314, 1,
0.01354206, 1.374945, -0.09789586, 0, 1, 0.8862745, 1,
0.0154317, 1.562475, 1.394617, 0, 1, 0.8901961, 1,
0.01572712, 0.06415309, 0.5268298, 0, 1, 0.8980392, 1,
0.0164425, -1.494704, 4.657255, 0, 1, 0.9058824, 1,
0.01823955, 0.5702025, -0.04050648, 0, 1, 0.9098039, 1,
0.01963385, -0.5098623, 4.517099, 0, 1, 0.9176471, 1,
0.02133704, 1.565949, 1.546929, 0, 1, 0.9215686, 1,
0.02252952, -1.083568, 3.302634, 0, 1, 0.9294118, 1,
0.02286205, -0.2394247, 1.607743, 0, 1, 0.9333333, 1,
0.02309613, -0.02288539, 2.497252, 0, 1, 0.9411765, 1,
0.02447994, 0.842164, 1.999243, 0, 1, 0.945098, 1,
0.02816479, 0.6833714, -2.305916, 0, 1, 0.9529412, 1,
0.02981471, -0.2130053, 1.74814, 0, 1, 0.9568627, 1,
0.03150345, 0.3073057, -0.3571621, 0, 1, 0.9647059, 1,
0.03284335, 1.276836, 0.1446093, 0, 1, 0.9686275, 1,
0.03291175, 0.2563163, -0.2815296, 0, 1, 0.9764706, 1,
0.03421541, -0.03876746, 1.651999, 0, 1, 0.9803922, 1,
0.03538986, -0.1289598, 5.268264, 0, 1, 0.9882353, 1,
0.03692968, 0.9982674, -1.101805, 0, 1, 0.9921569, 1,
0.03770726, 0.7585964, -0.2937358, 0, 1, 1, 1,
0.03910323, 0.09805489, -0.6365709, 0, 0.9921569, 1, 1,
0.04386663, 0.9349309, -0.6435668, 0, 0.9882353, 1, 1,
0.04428716, -0.03998361, 3.43278, 0, 0.9803922, 1, 1,
0.04671341, -1.302242, 2.015488, 0, 0.9764706, 1, 1,
0.04742549, -1.470931, 1.929626, 0, 0.9686275, 1, 1,
0.05046465, -0.1074294, 3.00564, 0, 0.9647059, 1, 1,
0.05187975, 0.3537942, -0.7246297, 0, 0.9568627, 1, 1,
0.05538736, 0.4776378, 0.2600231, 0, 0.9529412, 1, 1,
0.05672977, -0.4175959, 3.402576, 0, 0.945098, 1, 1,
0.06034961, -1.079628, 2.380746, 0, 0.9411765, 1, 1,
0.06905237, -1.138429, 2.44781, 0, 0.9333333, 1, 1,
0.07402389, 1.079345, -0.3647487, 0, 0.9294118, 1, 1,
0.07429734, -0.2094867, 3.758047, 0, 0.9215686, 1, 1,
0.07708547, -0.2064595, 2.074507, 0, 0.9176471, 1, 1,
0.07813708, 2.28336, -1.637961, 0, 0.9098039, 1, 1,
0.08053955, 0.8941568, -0.5428559, 0, 0.9058824, 1, 1,
0.08058072, 0.1133047, -0.737781, 0, 0.8980392, 1, 1,
0.0811629, 1.021888, 0.9104103, 0, 0.8901961, 1, 1,
0.08558383, -0.7206317, 3.662076, 0, 0.8862745, 1, 1,
0.08970039, -0.6368402, 4.47158, 0, 0.8784314, 1, 1,
0.09184691, -0.08091649, 1.60527, 0, 0.8745098, 1, 1,
0.09377837, -0.4435267, 4.317606, 0, 0.8666667, 1, 1,
0.09559188, -3.032371, 3.877252, 0, 0.8627451, 1, 1,
0.09844954, -1.462596, 3.695529, 0, 0.854902, 1, 1,
0.1020666, 0.8714602, -1.462043, 0, 0.8509804, 1, 1,
0.1034527, -0.8793833, 2.849896, 0, 0.8431373, 1, 1,
0.104863, 0.7080548, -1.32993, 0, 0.8392157, 1, 1,
0.1099863, -0.009936806, 1.998083, 0, 0.8313726, 1, 1,
0.1115463, 1.151661, 0.3634253, 0, 0.827451, 1, 1,
0.1147893, -0.9454406, 2.395402, 0, 0.8196079, 1, 1,
0.1176056, -0.509526, 3.218027, 0, 0.8156863, 1, 1,
0.1180208, -0.9929152, 3.091399, 0, 0.8078431, 1, 1,
0.1202878, -0.07648994, 2.118532, 0, 0.8039216, 1, 1,
0.1207218, -0.7727007, 2.614498, 0, 0.7960784, 1, 1,
0.1213141, -0.02640174, 0.1578449, 0, 0.7882353, 1, 1,
0.1216884, -1.486394, 4.053695, 0, 0.7843137, 1, 1,
0.124038, -0.06688891, 2.480572, 0, 0.7764706, 1, 1,
0.1247816, -1.67625, 3.373953, 0, 0.772549, 1, 1,
0.1250786, -0.6469308, 4.043837, 0, 0.7647059, 1, 1,
0.1288068, -0.3576296, 3.409004, 0, 0.7607843, 1, 1,
0.1301449, 0.8915154, -0.125142, 0, 0.7529412, 1, 1,
0.1305859, 0.6892738, 0.8646759, 0, 0.7490196, 1, 1,
0.1364606, 0.4313658, -0.1155641, 0, 0.7411765, 1, 1,
0.1365182, -1.979471, 2.436749, 0, 0.7372549, 1, 1,
0.1377613, -0.8635813, 2.586661, 0, 0.7294118, 1, 1,
0.1388571, 0.1418692, -0.8945375, 0, 0.7254902, 1, 1,
0.139518, -1.23422, 3.479626, 0, 0.7176471, 1, 1,
0.1396766, 0.9164493, -0.5001849, 0, 0.7137255, 1, 1,
0.1436494, 0.1606402, 1.21047, 0, 0.7058824, 1, 1,
0.151946, -0.7218222, 3.233172, 0, 0.6980392, 1, 1,
0.1525736, -0.3622466, 2.502604, 0, 0.6941177, 1, 1,
0.1531635, -0.8371255, 3.496059, 0, 0.6862745, 1, 1,
0.1546466, -1.233087, 2.876443, 0, 0.682353, 1, 1,
0.1551238, 0.08458566, 1.353931, 0, 0.6745098, 1, 1,
0.1635967, -1.58767, 3.875596, 0, 0.6705883, 1, 1,
0.1656079, -1.432076, 2.461507, 0, 0.6627451, 1, 1,
0.1661069, 0.3176646, -1.237422, 0, 0.6588235, 1, 1,
0.1690872, 1.255817, -0.2922165, 0, 0.6509804, 1, 1,
0.1705486, 2.75437, 0.8199808, 0, 0.6470588, 1, 1,
0.1723601, 0.7362827, 0.01282264, 0, 0.6392157, 1, 1,
0.1724643, 0.3279663, -0.5884713, 0, 0.6352941, 1, 1,
0.1775637, -1.085104, 1.05856, 0, 0.627451, 1, 1,
0.1779488, 2.050148, 0.02243764, 0, 0.6235294, 1, 1,
0.1801909, 1.004666, 1.89841, 0, 0.6156863, 1, 1,
0.1816669, 0.6260752, 0.4105539, 0, 0.6117647, 1, 1,
0.1843376, 0.1632988, -0.07175113, 0, 0.6039216, 1, 1,
0.1885025, -0.07895641, 1.451793, 0, 0.5960785, 1, 1,
0.1917983, -0.6415437, 4.618803, 0, 0.5921569, 1, 1,
0.1921723, -0.9990021, 3.588373, 0, 0.5843138, 1, 1,
0.1952786, 0.4764446, 0.03087572, 0, 0.5803922, 1, 1,
0.1997427, 0.9818979, 1.479375, 0, 0.572549, 1, 1,
0.2043605, -1.885521, 2.752782, 0, 0.5686275, 1, 1,
0.2091644, 0.753343, 1.279413, 0, 0.5607843, 1, 1,
0.2116067, 0.3258576, -0.890786, 0, 0.5568628, 1, 1,
0.2196549, -0.3105561, -0.3533348, 0, 0.5490196, 1, 1,
0.222531, 2.804694, -1.100023, 0, 0.5450981, 1, 1,
0.2230594, 0.6565841, 0.2182031, 0, 0.5372549, 1, 1,
0.2267673, 0.9588435, -0.1815568, 0, 0.5333334, 1, 1,
0.2327722, 0.3291378, -0.5292947, 0, 0.5254902, 1, 1,
0.2332678, 0.5814557, 0.5321733, 0, 0.5215687, 1, 1,
0.235203, -0.9053421, 3.111532, 0, 0.5137255, 1, 1,
0.2352372, 1.147428, 1.077377, 0, 0.509804, 1, 1,
0.2394546, 1.020527, 0.4594631, 0, 0.5019608, 1, 1,
0.2416667, -1.721738, 2.561382, 0, 0.4941176, 1, 1,
0.2424286, -1.012284, 1.001635, 0, 0.4901961, 1, 1,
0.2429686, 0.4392906, 2.498511, 0, 0.4823529, 1, 1,
0.2440795, -2.697444, 3.266678, 0, 0.4784314, 1, 1,
0.2446531, 0.1514869, 0.2999357, 0, 0.4705882, 1, 1,
0.2453481, -1.723785, 4.91703, 0, 0.4666667, 1, 1,
0.2476855, 0.8883997, 0.4344189, 0, 0.4588235, 1, 1,
0.2479872, 0.5387414, 0.6373846, 0, 0.454902, 1, 1,
0.2483566, -0.07945877, 3.450113, 0, 0.4470588, 1, 1,
0.2497047, 0.2665849, 1.426861, 0, 0.4431373, 1, 1,
0.2534479, -0.4911695, 3.522181, 0, 0.4352941, 1, 1,
0.2594232, -0.9930409, 3.815754, 0, 0.4313726, 1, 1,
0.2599017, -0.999127, 2.447643, 0, 0.4235294, 1, 1,
0.2654513, 0.7834532, 0.7323158, 0, 0.4196078, 1, 1,
0.2660248, -0.1561734, 2.095139, 0, 0.4117647, 1, 1,
0.2741645, 0.7483368, 0.7795538, 0, 0.4078431, 1, 1,
0.275936, -0.2452942, 2.921885, 0, 0.4, 1, 1,
0.2782353, -0.3874273, 1.719623, 0, 0.3921569, 1, 1,
0.2804755, 1.67848, 1.124428, 0, 0.3882353, 1, 1,
0.2824274, 0.4504695, 1.239504, 0, 0.3803922, 1, 1,
0.2835753, -0.6957614, 2.225811, 0, 0.3764706, 1, 1,
0.2864798, 0.547312, -0.04398407, 0, 0.3686275, 1, 1,
0.2870747, 0.3391152, 0.6180596, 0, 0.3647059, 1, 1,
0.2871021, -1.464691, 1.599639, 0, 0.3568628, 1, 1,
0.2888351, -0.3292361, 2.483658, 0, 0.3529412, 1, 1,
0.290401, -0.9851224, 1.323939, 0, 0.345098, 1, 1,
0.2920866, 0.4593174, -0.4619975, 0, 0.3411765, 1, 1,
0.293433, 0.03312366, 0.3274544, 0, 0.3333333, 1, 1,
0.293923, 0.3033732, -0.1369558, 0, 0.3294118, 1, 1,
0.2972129, -0.2454935, 1.919116, 0, 0.3215686, 1, 1,
0.2996551, -1.916827, 5.627839, 0, 0.3176471, 1, 1,
0.3039247, 1.207452, 0.2337336, 0, 0.3098039, 1, 1,
0.3124318, 0.6006095, -0.7785626, 0, 0.3058824, 1, 1,
0.3149744, 0.01611997, 1.650504, 0, 0.2980392, 1, 1,
0.3163777, -1.082217, 5.477936, 0, 0.2901961, 1, 1,
0.3167062, -1.34152, 4.935842, 0, 0.2862745, 1, 1,
0.3196472, 0.04078006, 1.276362, 0, 0.2784314, 1, 1,
0.3227932, -0.5300565, 2.40762, 0, 0.2745098, 1, 1,
0.3274164, -0.2944095, 0.5018669, 0, 0.2666667, 1, 1,
0.3276106, 0.9570181, 2.635339, 0, 0.2627451, 1, 1,
0.3325526, 1.425822, -1.640713, 0, 0.254902, 1, 1,
0.3330773, -0.7532451, 2.586687, 0, 0.2509804, 1, 1,
0.3345121, 0.03105797, 0.9314482, 0, 0.2431373, 1, 1,
0.3390343, 0.01329286, 1.830071, 0, 0.2392157, 1, 1,
0.342632, 3.206338, 0.05930432, 0, 0.2313726, 1, 1,
0.3433714, -0.02378106, 2.650032, 0, 0.227451, 1, 1,
0.3440756, 0.3972312, 2.672135, 0, 0.2196078, 1, 1,
0.3442485, 1.299617, 0.6481255, 0, 0.2156863, 1, 1,
0.3487329, 0.0783392, 0.6917713, 0, 0.2078431, 1, 1,
0.3513938, 0.1837584, 0.2100736, 0, 0.2039216, 1, 1,
0.3515331, 0.9191332, 1.300227, 0, 0.1960784, 1, 1,
0.360495, -0.5670823, 1.446691, 0, 0.1882353, 1, 1,
0.361421, 1.000707, -0.1448383, 0, 0.1843137, 1, 1,
0.3616145, -0.6363093, 3.878137, 0, 0.1764706, 1, 1,
0.361661, -0.6030751, 1.836401, 0, 0.172549, 1, 1,
0.3687556, 0.5189574, 1.51361, 0, 0.1647059, 1, 1,
0.3689145, 2.30697, -0.3962228, 0, 0.1607843, 1, 1,
0.3710855, 1.312848, -0.256518, 0, 0.1529412, 1, 1,
0.3717182, -1.823896, 3.137595, 0, 0.1490196, 1, 1,
0.3719123, -0.5875418, 2.170242, 0, 0.1411765, 1, 1,
0.3721205, -0.7018335, 3.420201, 0, 0.1372549, 1, 1,
0.3755478, 1.305037, -1.985119, 0, 0.1294118, 1, 1,
0.3758416, 3.115119, 0.4197299, 0, 0.1254902, 1, 1,
0.3765972, -1.068961, 3.40039, 0, 0.1176471, 1, 1,
0.3802922, -0.07732208, 3.140205, 0, 0.1137255, 1, 1,
0.3814307, -0.436026, 1.665218, 0, 0.1058824, 1, 1,
0.383963, -1.154213, 3.278594, 0, 0.09803922, 1, 1,
0.3878659, -1.226076, 4.199725, 0, 0.09411765, 1, 1,
0.3901314, -2.370099, 2.056238, 0, 0.08627451, 1, 1,
0.3977767, -0.6258959, 2.866225, 0, 0.08235294, 1, 1,
0.3987347, -2.502659, 2.400266, 0, 0.07450981, 1, 1,
0.4005888, 1.065464, -0.1399112, 0, 0.07058824, 1, 1,
0.4017902, -0.1413915, 2.622276, 0, 0.0627451, 1, 1,
0.4120663, 1.545557, 0.4554639, 0, 0.05882353, 1, 1,
0.4138346, 0.1336787, 1.52372, 0, 0.05098039, 1, 1,
0.4140916, -0.530515, 3.363137, 0, 0.04705882, 1, 1,
0.4142928, 0.3070728, -0.003577864, 0, 0.03921569, 1, 1,
0.4152381, 1.020992, -0.06956081, 0, 0.03529412, 1, 1,
0.4164831, -1.18109, 2.015414, 0, 0.02745098, 1, 1,
0.4175684, -1.653717, 2.449511, 0, 0.02352941, 1, 1,
0.4183892, 0.6073237, 0.7719378, 0, 0.01568628, 1, 1,
0.4185081, -0.5654971, 3.79612, 0, 0.01176471, 1, 1,
0.4249705, 0.4648458, 0.3606061, 0, 0.003921569, 1, 1,
0.428133, 0.4958608, 1.058556, 0.003921569, 0, 1, 1,
0.4329331, -0.4052555, 2.612755, 0.007843138, 0, 1, 1,
0.4334719, -0.4794059, 1.567456, 0.01568628, 0, 1, 1,
0.4339963, -0.267985, 3.224634, 0.01960784, 0, 1, 1,
0.4366822, 0.2075735, 1.705353, 0.02745098, 0, 1, 1,
0.4439988, 0.05663724, 2.142594, 0.03137255, 0, 1, 1,
0.4442491, 0.9832698, 0.3678433, 0.03921569, 0, 1, 1,
0.4466056, 0.6909711, 0.807911, 0.04313726, 0, 1, 1,
0.4470215, -1.466832, 4.395435, 0.05098039, 0, 1, 1,
0.4479572, -0.3486226, 3.186077, 0.05490196, 0, 1, 1,
0.4508584, -1.325571, 2.429739, 0.0627451, 0, 1, 1,
0.4533188, 0.2317884, 1.849034, 0.06666667, 0, 1, 1,
0.4579334, -0.1697262, 2.499708, 0.07450981, 0, 1, 1,
0.4642769, 0.3253475, -0.8458905, 0.07843138, 0, 1, 1,
0.4648165, 0.1136735, 2.676177, 0.08627451, 0, 1, 1,
0.4655936, -2.162854, 2.932231, 0.09019608, 0, 1, 1,
0.4667272, -1.057559, 2.957226, 0.09803922, 0, 1, 1,
0.467447, -0.6297172, 0.8116615, 0.1058824, 0, 1, 1,
0.4692259, -0.3005322, 0.4999207, 0.1098039, 0, 1, 1,
0.4699188, 2.397506, 1.637365, 0.1176471, 0, 1, 1,
0.4778008, -1.703476, 2.125652, 0.1215686, 0, 1, 1,
0.4783252, -0.5987999, 2.01507, 0.1294118, 0, 1, 1,
0.4881875, -0.2535632, 2.256655, 0.1333333, 0, 1, 1,
0.4962856, -1.102914, 2.978665, 0.1411765, 0, 1, 1,
0.4966482, 0.8766326, 1.102231, 0.145098, 0, 1, 1,
0.5009739, -0.9423271, 0.4026995, 0.1529412, 0, 1, 1,
0.5026358, 1.060672, -1.483173, 0.1568628, 0, 1, 1,
0.5080287, 0.7185516, 1.803965, 0.1647059, 0, 1, 1,
0.5081788, -0.4230747, 1.281981, 0.1686275, 0, 1, 1,
0.5095135, 0.1746887, 1.025637, 0.1764706, 0, 1, 1,
0.5134837, 1.821944, -0.3930342, 0.1803922, 0, 1, 1,
0.5174224, 0.967092, 0.8946708, 0.1882353, 0, 1, 1,
0.5183287, -2.254847, 3.435297, 0.1921569, 0, 1, 1,
0.5190785, 0.3856702, 0.2768715, 0.2, 0, 1, 1,
0.5226141, -1.139022, 1.683923, 0.2078431, 0, 1, 1,
0.5241662, 0.2249629, 0.9510517, 0.2117647, 0, 1, 1,
0.5250912, 0.3096573, 1.594416, 0.2196078, 0, 1, 1,
0.5311018, 0.6090701, 0.7263901, 0.2235294, 0, 1, 1,
0.5328317, 0.3121636, 1.491035, 0.2313726, 0, 1, 1,
0.5348274, 0.008656637, -0.5996921, 0.2352941, 0, 1, 1,
0.5366097, 0.06216066, 1.5644, 0.2431373, 0, 1, 1,
0.5394291, -0.3175905, 1.135791, 0.2470588, 0, 1, 1,
0.5400019, 0.7905772, -0.5646759, 0.254902, 0, 1, 1,
0.5407571, 1.133548, 0.1061422, 0.2588235, 0, 1, 1,
0.5424722, 0.1222222, 3.402608, 0.2666667, 0, 1, 1,
0.5442948, 0.4821495, 0.8137636, 0.2705882, 0, 1, 1,
0.5467537, -0.7339042, 3.701213, 0.2784314, 0, 1, 1,
0.5480638, -1.357769, 1.420107, 0.282353, 0, 1, 1,
0.5499232, 0.05345972, 0.2501886, 0.2901961, 0, 1, 1,
0.5546133, -0.5054504, 3.023877, 0.2941177, 0, 1, 1,
0.5554677, -0.09591478, 0.86133, 0.3019608, 0, 1, 1,
0.5572336, -0.836085, 2.578595, 0.3098039, 0, 1, 1,
0.5627159, 1.394649, 1.77765, 0.3137255, 0, 1, 1,
0.5637543, 1.139765, -0.2709633, 0.3215686, 0, 1, 1,
0.5638265, -0.3329633, 1.713802, 0.3254902, 0, 1, 1,
0.569474, 0.3950289, 1.930295, 0.3333333, 0, 1, 1,
0.5742785, -1.871359, 2.436997, 0.3372549, 0, 1, 1,
0.5743361, -0.7055026, 4.528104, 0.345098, 0, 1, 1,
0.5751415, -0.9271113, 2.438583, 0.3490196, 0, 1, 1,
0.577361, 0.6549127, 1.52072, 0.3568628, 0, 1, 1,
0.5801885, -0.01324286, -0.2001654, 0.3607843, 0, 1, 1,
0.580624, -0.767487, 1.591482, 0.3686275, 0, 1, 1,
0.587213, 0.6002182, 0.6072885, 0.372549, 0, 1, 1,
0.5910855, -0.5978468, 3.644713, 0.3803922, 0, 1, 1,
0.5977769, 2.034398, 1.046762, 0.3843137, 0, 1, 1,
0.6023743, -0.636406, 3.159796, 0.3921569, 0, 1, 1,
0.6069999, -1.500109, 2.848181, 0.3960784, 0, 1, 1,
0.6084284, -1.557096, 1.631071, 0.4039216, 0, 1, 1,
0.6168703, 1.171454, 1.920088, 0.4117647, 0, 1, 1,
0.6280899, -0.02945538, 3.058743, 0.4156863, 0, 1, 1,
0.6287224, 0.5497929, 1.118213, 0.4235294, 0, 1, 1,
0.6298307, 0.7339714, 0.3226261, 0.427451, 0, 1, 1,
0.6389044, -1.29881, 2.970476, 0.4352941, 0, 1, 1,
0.6404234, -0.8200136, 1.24523, 0.4392157, 0, 1, 1,
0.641324, 0.4964492, 1.730836, 0.4470588, 0, 1, 1,
0.6459479, -0.6026291, 2.898824, 0.4509804, 0, 1, 1,
0.6502897, -0.5195654, 0.8320535, 0.4588235, 0, 1, 1,
0.6525482, -0.1020528, 2.16418, 0.4627451, 0, 1, 1,
0.6551451, 1.408921, 1.247663, 0.4705882, 0, 1, 1,
0.6591993, 0.9883159, 1.65739, 0.4745098, 0, 1, 1,
0.6680018, -0.5358767, 2.056254, 0.4823529, 0, 1, 1,
0.6695096, -1.126684, 2.783026, 0.4862745, 0, 1, 1,
0.6704184, -0.320291, 4.62866, 0.4941176, 0, 1, 1,
0.6748559, -0.02369983, 1.056891, 0.5019608, 0, 1, 1,
0.6753832, 2.686625, 0.8687207, 0.5058824, 0, 1, 1,
0.6764989, -1.885547, 3.676817, 0.5137255, 0, 1, 1,
0.6790175, 0.08999547, 0.4325056, 0.5176471, 0, 1, 1,
0.6813911, -1.413792, 1.305032, 0.5254902, 0, 1, 1,
0.6829287, 1.677698, 2.341266, 0.5294118, 0, 1, 1,
0.6848147, 2.298177, 0.2740775, 0.5372549, 0, 1, 1,
0.6866775, -0.07759149, -0.920846, 0.5411765, 0, 1, 1,
0.691197, -0.7222965, 1.638775, 0.5490196, 0, 1, 1,
0.691601, 1.316991, 1.017235, 0.5529412, 0, 1, 1,
0.6922526, -0.2326593, 0.2650567, 0.5607843, 0, 1, 1,
0.6958342, 0.5016459, -0.2604675, 0.5647059, 0, 1, 1,
0.6984122, -0.1552987, 1.938317, 0.572549, 0, 1, 1,
0.698863, 0.7686396, 0.8784053, 0.5764706, 0, 1, 1,
0.7012814, -1.349862, 2.510375, 0.5843138, 0, 1, 1,
0.7078188, -0.7769116, 2.156449, 0.5882353, 0, 1, 1,
0.7118563, 2.367611, 0.6226689, 0.5960785, 0, 1, 1,
0.7134721, -1.481989, 3.792612, 0.6039216, 0, 1, 1,
0.7135564, 0.08753517, 3.223508, 0.6078432, 0, 1, 1,
0.7151404, 0.7183678, 1.063354, 0.6156863, 0, 1, 1,
0.7152683, -0.654272, 0.8007141, 0.6196079, 0, 1, 1,
0.7159025, -1.124055, 0.3729756, 0.627451, 0, 1, 1,
0.7176911, -0.2869138, -0.2277906, 0.6313726, 0, 1, 1,
0.7211611, -2.460487, 3.82706, 0.6392157, 0, 1, 1,
0.7220398, -0.80369, 2.201564, 0.6431373, 0, 1, 1,
0.7244554, -1.076653, 2.829917, 0.6509804, 0, 1, 1,
0.7246494, -0.6460213, 3.358258, 0.654902, 0, 1, 1,
0.7256507, 0.8663233, 1.689303, 0.6627451, 0, 1, 1,
0.7273844, -1.099715, 1.294859, 0.6666667, 0, 1, 1,
0.7275454, -0.01835923, 2.250203, 0.6745098, 0, 1, 1,
0.7281266, 1.321198, 3.41699, 0.6784314, 0, 1, 1,
0.7304206, 1.121546, 1.483845, 0.6862745, 0, 1, 1,
0.7384295, 3.330915, 0.7362137, 0.6901961, 0, 1, 1,
0.7440413, 0.3504319, 1.409492, 0.6980392, 0, 1, 1,
0.7496864, 0.2070889, 3.140303, 0.7058824, 0, 1, 1,
0.7526526, 0.6204338, 1.371607, 0.7098039, 0, 1, 1,
0.7562418, -0.0158966, 3.115058, 0.7176471, 0, 1, 1,
0.7566639, -0.4755456, 1.604908, 0.7215686, 0, 1, 1,
0.7670801, -0.5154892, -0.3568481, 0.7294118, 0, 1, 1,
0.773433, -0.09825367, 0.4209915, 0.7333333, 0, 1, 1,
0.7746414, -0.106006, 2.46616, 0.7411765, 0, 1, 1,
0.7793623, -1.304916, 3.69136, 0.7450981, 0, 1, 1,
0.780557, -0.9762485, 2.444282, 0.7529412, 0, 1, 1,
0.7805679, 0.6492107, 1.35729, 0.7568628, 0, 1, 1,
0.7811859, 1.197471, 0.6926839, 0.7647059, 0, 1, 1,
0.7892058, 0.88161, -0.140258, 0.7686275, 0, 1, 1,
0.793211, 0.6208232, 2.969404, 0.7764706, 0, 1, 1,
0.7951388, 0.7565346, 1.138336, 0.7803922, 0, 1, 1,
0.7958944, 1.403733, 1.110921, 0.7882353, 0, 1, 1,
0.7985523, -0.9425462, 1.430371, 0.7921569, 0, 1, 1,
0.8008627, -1.363433, 2.184799, 0.8, 0, 1, 1,
0.8046008, -2.110357, 3.208182, 0.8078431, 0, 1, 1,
0.80509, 1.013803, 0.02095602, 0.8117647, 0, 1, 1,
0.8088455, 0.232657, 0.2906887, 0.8196079, 0, 1, 1,
0.8119586, -1.424752, 0.142956, 0.8235294, 0, 1, 1,
0.8260958, 0.5689178, -0.1537632, 0.8313726, 0, 1, 1,
0.8286191, -0.5792211, 1.580383, 0.8352941, 0, 1, 1,
0.8291535, 2.532718, 1.237208, 0.8431373, 0, 1, 1,
0.83275, 1.155892, 2.586151, 0.8470588, 0, 1, 1,
0.833532, -1.812621, 3.204624, 0.854902, 0, 1, 1,
0.8342413, -1.626612, 3.275523, 0.8588235, 0, 1, 1,
0.8412422, 0.1906441, -0.2257698, 0.8666667, 0, 1, 1,
0.844982, -2.724416, 2.311363, 0.8705882, 0, 1, 1,
0.8493305, -0.5183665, 2.730113, 0.8784314, 0, 1, 1,
0.8505924, -0.5963196, 3.311162, 0.8823529, 0, 1, 1,
0.8523443, 0.7812211, 0.4495649, 0.8901961, 0, 1, 1,
0.8640269, 0.3975245, 1.442904, 0.8941177, 0, 1, 1,
0.8667547, -1.230212, 3.076783, 0.9019608, 0, 1, 1,
0.8671843, 0.5882794, -0.06731726, 0.9098039, 0, 1, 1,
0.8702857, -1.225554, 2.995329, 0.9137255, 0, 1, 1,
0.873013, 0.8043377, 2.460889, 0.9215686, 0, 1, 1,
0.8737938, -0.09580842, 0.7913312, 0.9254902, 0, 1, 1,
0.8738968, -1.767119, 3.375222, 0.9333333, 0, 1, 1,
0.8784598, -0.1547972, 1.027686, 0.9372549, 0, 1, 1,
0.8849838, 0.9653249, 0.7505206, 0.945098, 0, 1, 1,
0.8875942, 0.3912226, 1.484409, 0.9490196, 0, 1, 1,
0.8883668, -1.130816, 3.554727, 0.9568627, 0, 1, 1,
0.8910791, -0.9372339, 1.958634, 0.9607843, 0, 1, 1,
0.8934064, -0.1783194, 2.974646, 0.9686275, 0, 1, 1,
0.8941917, -1.646194, 1.45252, 0.972549, 0, 1, 1,
0.8973166, -0.3062891, 1.419454, 0.9803922, 0, 1, 1,
0.8983432, 2.089957, 1.458023, 0.9843137, 0, 1, 1,
0.9009772, -0.9001977, 1.963395, 0.9921569, 0, 1, 1,
0.9057345, 0.6042101, 0.2392389, 0.9960784, 0, 1, 1,
0.9074324, -0.9023651, 1.625943, 1, 0, 0.9960784, 1,
0.9086339, 1.055279, -0.9579529, 1, 0, 0.9882353, 1,
0.9093491, -0.1412614, 3.956785, 1, 0, 0.9843137, 1,
0.9122214, 0.5796471, 1.736061, 1, 0, 0.9764706, 1,
0.9142373, 0.01835407, 1.139015, 1, 0, 0.972549, 1,
0.9154031, 1.10531, -0.0004092145, 1, 0, 0.9647059, 1,
0.9178266, -0.5213478, 1.696203, 1, 0, 0.9607843, 1,
0.9225887, -0.9072573, 1.463603, 1, 0, 0.9529412, 1,
0.9231679, 1.111313, -1.324936, 1, 0, 0.9490196, 1,
0.9242761, -0.1006214, 1.339946, 1, 0, 0.9411765, 1,
0.9253217, 1.676837, 1.330292, 1, 0, 0.9372549, 1,
0.9285583, 2.002365, -1.881744, 1, 0, 0.9294118, 1,
0.9285629, 0.8251617, 1.031632, 1, 0, 0.9254902, 1,
0.9292032, -2.374479, 1.145478, 1, 0, 0.9176471, 1,
0.9327806, 0.4501072, 2.290148, 1, 0, 0.9137255, 1,
0.9381412, -0.0558156, 1.285689, 1, 0, 0.9058824, 1,
0.939524, 0.6825888, 0.595417, 1, 0, 0.9019608, 1,
0.9466202, 1.385872, 0.6685869, 1, 0, 0.8941177, 1,
0.9478261, 0.9051777, -0.8420217, 1, 0, 0.8862745, 1,
0.9502568, 0.6941174, 0.4614982, 1, 0, 0.8823529, 1,
0.9508742, -0.1839603, 1.597484, 1, 0, 0.8745098, 1,
0.9509979, -0.1365985, 1.535739, 1, 0, 0.8705882, 1,
0.9515437, -0.9985379, 1.74521, 1, 0, 0.8627451, 1,
0.9569367, 0.8426786, 0.4560268, 1, 0, 0.8588235, 1,
0.9593023, 1.129024, -0.9674987, 1, 0, 0.8509804, 1,
0.9657252, -0.5839915, 3.810863, 1, 0, 0.8470588, 1,
0.9681611, -0.1072364, 1.832173, 1, 0, 0.8392157, 1,
0.971326, -2.151059, 1.799831, 1, 0, 0.8352941, 1,
0.9749047, 0.1823191, 2.697563, 1, 0, 0.827451, 1,
0.9788549, 0.6133005, 2.438639, 1, 0, 0.8235294, 1,
0.9822193, 0.4229119, 1.127959, 1, 0, 0.8156863, 1,
0.9863753, -0.1015309, 0.862844, 1, 0, 0.8117647, 1,
0.98847, 1.952393, 0.3225393, 1, 0, 0.8039216, 1,
0.9888383, -1.349199, 2.708042, 1, 0, 0.7960784, 1,
0.9926636, 0.6333554, 1.318152, 1, 0, 0.7921569, 1,
1.001469, 0.2339636, 0.8484575, 1, 0, 0.7843137, 1,
1.009256, 0.1005166, 2.021147, 1, 0, 0.7803922, 1,
1.022611, 0.2580434, -1.043402, 1, 0, 0.772549, 1,
1.028338, -1.172586, 2.598667, 1, 0, 0.7686275, 1,
1.03446, -1.280137, 2.35143, 1, 0, 0.7607843, 1,
1.035859, -0.3497618, 3.931122, 1, 0, 0.7568628, 1,
1.054744, 1.303499, 0.5049953, 1, 0, 0.7490196, 1,
1.058342, -1.165076, 4.106354, 1, 0, 0.7450981, 1,
1.065084, 0.26987, 1.023063, 1, 0, 0.7372549, 1,
1.078329, -0.976266, 2.711094, 1, 0, 0.7333333, 1,
1.087185, 2.540888, 0.3429907, 1, 0, 0.7254902, 1,
1.091684, -0.6765422, 2.078823, 1, 0, 0.7215686, 1,
1.091936, -0.5643626, 1.306213, 1, 0, 0.7137255, 1,
1.092856, -1.359046, 2.736809, 1, 0, 0.7098039, 1,
1.09514, -0.8205526, 2.681827, 1, 0, 0.7019608, 1,
1.096896, 0.03707504, -0.8398315, 1, 0, 0.6941177, 1,
1.098867, -0.1451231, 1.397224, 1, 0, 0.6901961, 1,
1.114738, -0.2131261, 1.056459, 1, 0, 0.682353, 1,
1.118512, -0.8661944, 1.106278, 1, 0, 0.6784314, 1,
1.121108, 0.725633, 0.1851946, 1, 0, 0.6705883, 1,
1.127345, 2.064577, 1.348991, 1, 0, 0.6666667, 1,
1.127683, 0.05475289, 0.9649501, 1, 0, 0.6588235, 1,
1.128609, -0.6206241, 3.246058, 1, 0, 0.654902, 1,
1.135558, 2.240223, -0.3542612, 1, 0, 0.6470588, 1,
1.137007, -1.988294, 2.792619, 1, 0, 0.6431373, 1,
1.142549, -0.1009197, 1.834986, 1, 0, 0.6352941, 1,
1.148279, -0.4851723, 1.088796, 1, 0, 0.6313726, 1,
1.149684, -0.1729483, 1.096545, 1, 0, 0.6235294, 1,
1.158261, 0.2507787, 1.527052, 1, 0, 0.6196079, 1,
1.170269, -0.5116093, 0.08280836, 1, 0, 0.6117647, 1,
1.180615, 0.3422376, 1.067483, 1, 0, 0.6078432, 1,
1.186728, -0.6487295, 1.51929, 1, 0, 0.6, 1,
1.195417, -0.2278336, 1.812629, 1, 0, 0.5921569, 1,
1.201023, -1.140484, 3.87586, 1, 0, 0.5882353, 1,
1.203555, 0.3514909, 0.2564628, 1, 0, 0.5803922, 1,
1.206374, -0.3697657, 2.060519, 1, 0, 0.5764706, 1,
1.218479, -0.04268095, 1.58641, 1, 0, 0.5686275, 1,
1.224896, 1.65948, -0.1103055, 1, 0, 0.5647059, 1,
1.231233, -1.080353, 1.3117, 1, 0, 0.5568628, 1,
1.243767, -0.5461227, 1.170672, 1, 0, 0.5529412, 1,
1.245908, -2.067539, 2.00622, 1, 0, 0.5450981, 1,
1.24854, -1.017009, 0.8310462, 1, 0, 0.5411765, 1,
1.254256, -1.814566, 2.564162, 1, 0, 0.5333334, 1,
1.255315, -1.918159, 1.085737, 1, 0, 0.5294118, 1,
1.256609, -0.2386866, 2.329267, 1, 0, 0.5215687, 1,
1.257413, 0.8160805, 4.482553, 1, 0, 0.5176471, 1,
1.262288, -0.7544131, 2.559798, 1, 0, 0.509804, 1,
1.262904, -1.000679, 1.278917, 1, 0, 0.5058824, 1,
1.276508, -0.6952192, 3.444856, 1, 0, 0.4980392, 1,
1.276716, -0.4400498, 2.748434, 1, 0, 0.4901961, 1,
1.285038, -2.08682, 3.628625, 1, 0, 0.4862745, 1,
1.288745, 0.4958265, 0.6800954, 1, 0, 0.4784314, 1,
1.292192, 1.647134, 1.996645, 1, 0, 0.4745098, 1,
1.303421, 0.9835495, -0.3028562, 1, 0, 0.4666667, 1,
1.304265, 0.6940452, 2.346634, 1, 0, 0.4627451, 1,
1.310213, -0.6664473, 2.37119, 1, 0, 0.454902, 1,
1.324426, -0.2526902, 1.313472, 1, 0, 0.4509804, 1,
1.336285, -0.7771786, 2.219672, 1, 0, 0.4431373, 1,
1.349673, 0.2108604, 2.304204, 1, 0, 0.4392157, 1,
1.350696, -1.394681, 3.627681, 1, 0, 0.4313726, 1,
1.362781, -1.37016, 3.420579, 1, 0, 0.427451, 1,
1.4079, -0.2837191, 2.247844, 1, 0, 0.4196078, 1,
1.413353, 0.4471129, 1.058702, 1, 0, 0.4156863, 1,
1.41501, -1.4317, 1.524469, 1, 0, 0.4078431, 1,
1.424205, -0.7193872, 1.739789, 1, 0, 0.4039216, 1,
1.434303, 0.9973198, 1.809127, 1, 0, 0.3960784, 1,
1.440313, -2.159004, 1.742669, 1, 0, 0.3882353, 1,
1.450759, -1.197026, 1.618575, 1, 0, 0.3843137, 1,
1.451431, 0.8170916, -0.1410202, 1, 0, 0.3764706, 1,
1.458632, -0.3262511, 1.072533, 1, 0, 0.372549, 1,
1.466185, -0.9005589, 3.904939, 1, 0, 0.3647059, 1,
1.466995, 1.213433, 0.5395055, 1, 0, 0.3607843, 1,
1.474798, 0.4258285, 0.2324665, 1, 0, 0.3529412, 1,
1.485331, -0.3438104, 0.8659216, 1, 0, 0.3490196, 1,
1.486098, -0.2818427, 1.294059, 1, 0, 0.3411765, 1,
1.502247, 0.3829579, 2.465928, 1, 0, 0.3372549, 1,
1.506196, -1.361696, 1.665568, 1, 0, 0.3294118, 1,
1.507241, 1.515269, 1.753898, 1, 0, 0.3254902, 1,
1.515619, -1.209486, 5.150059, 1, 0, 0.3176471, 1,
1.539044, 1.821989, 1.15794, 1, 0, 0.3137255, 1,
1.560626, 1.120969, -0.6937276, 1, 0, 0.3058824, 1,
1.580084, -0.164452, 2.968352, 1, 0, 0.2980392, 1,
1.595719, 0.7836949, -0.6234686, 1, 0, 0.2941177, 1,
1.614951, 1.298303, 1.13438, 1, 0, 0.2862745, 1,
1.622131, 0.6740813, 1.180754, 1, 0, 0.282353, 1,
1.624296, -0.2026409, 1.328173, 1, 0, 0.2745098, 1,
1.63596, -0.8833446, 2.942737, 1, 0, 0.2705882, 1,
1.641272, 0.5273572, 1.302115, 1, 0, 0.2627451, 1,
1.649733, -0.1864487, 3.05476, 1, 0, 0.2588235, 1,
1.670091, 1.683902, 1.697955, 1, 0, 0.2509804, 1,
1.702136, 0.1877173, 1.643791, 1, 0, 0.2470588, 1,
1.71003, -0.2693697, 1.797407, 1, 0, 0.2392157, 1,
1.755635, 1.829672, 0.3300059, 1, 0, 0.2352941, 1,
1.764141, -1.178841, 1.311012, 1, 0, 0.227451, 1,
1.766603, 0.9881418, 2.309509, 1, 0, 0.2235294, 1,
1.792417, -0.6497346, 1.672446, 1, 0, 0.2156863, 1,
1.794957, 0.4723308, 0.1983752, 1, 0, 0.2117647, 1,
1.797534, -0.4522445, 3.649342, 1, 0, 0.2039216, 1,
1.804186, -0.2926209, 0.1578831, 1, 0, 0.1960784, 1,
1.847843, 1.594384, -0.3792144, 1, 0, 0.1921569, 1,
1.898609, -0.943182, 2.384937, 1, 0, 0.1843137, 1,
1.903196, -1.236544, 2.966862, 1, 0, 0.1803922, 1,
1.904112, -0.891174, 2.260907, 1, 0, 0.172549, 1,
1.911206, -0.8328385, 1.990321, 1, 0, 0.1686275, 1,
1.941145, 0.9173889, 0.8154343, 1, 0, 0.1607843, 1,
1.949227, 0.9631433, 0.3800099, 1, 0, 0.1568628, 1,
1.955106, -0.4102891, 3.182192, 1, 0, 0.1490196, 1,
1.98012, -0.9081084, 1.515455, 1, 0, 0.145098, 1,
2.015081, 0.7294343, 1.982506, 1, 0, 0.1372549, 1,
2.030021, 0.5918831, 1.926775, 1, 0, 0.1333333, 1,
2.03627, 0.7538605, 2.76557, 1, 0, 0.1254902, 1,
2.130066, -1.199569, 2.126101, 1, 0, 0.1215686, 1,
2.175631, 0.2265038, 1.238797, 1, 0, 0.1137255, 1,
2.183676, -1.075212, 1.740327, 1, 0, 0.1098039, 1,
2.197829, -0.2509157, 1.445596, 1, 0, 0.1019608, 1,
2.280124, 0.2309864, 1.040573, 1, 0, 0.09411765, 1,
2.283958, 0.01100738, 2.098502, 1, 0, 0.09019608, 1,
2.303413, -0.2778907, 1.616063, 1, 0, 0.08235294, 1,
2.307929, 0.5123698, 0.03272938, 1, 0, 0.07843138, 1,
2.307995, -1.826385, 1.382661, 1, 0, 0.07058824, 1,
2.368062, 0.180963, 2.934837, 1, 0, 0.06666667, 1,
2.377282, 2.342852, -0.6600857, 1, 0, 0.05882353, 1,
2.392196, -0.335154, 2.63237, 1, 0, 0.05490196, 1,
2.451009, 0.09719728, 0.9779803, 1, 0, 0.04705882, 1,
2.466211, -0.1869355, -0.3313405, 1, 0, 0.04313726, 1,
2.46747, 0.02164498, 0.7136247, 1, 0, 0.03529412, 1,
2.568082, 0.7216556, 1.834457, 1, 0, 0.03137255, 1,
2.585449, -1.625581, 3.00055, 1, 0, 0.02352941, 1,
2.612754, -0.2172945, -0.6265979, 1, 0, 0.01960784, 1,
3.141461, -0.01102629, 2.915977, 1, 0, 0.01176471, 1,
3.527369, -0.8423563, 2.258763, 1, 0, 0.007843138, 1
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
0.2093562, -4.669608, -7.90869, 0, -0.5, 0.5, 0.5,
0.2093562, -4.669608, -7.90869, 1, -0.5, 0.5, 0.5,
0.2093562, -4.669608, -7.90869, 1, 1.5, 0.5, 0.5,
0.2093562, -4.669608, -7.90869, 0, 1.5, 0.5, 0.5
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
-4.233464, -0.0895735, -7.90869, 0, -0.5, 0.5, 0.5,
-4.233464, -0.0895735, -7.90869, 1, -0.5, 0.5, 0.5,
-4.233464, -0.0895735, -7.90869, 1, 1.5, 0.5, 0.5,
-4.233464, -0.0895735, -7.90869, 0, 1.5, 0.5, 0.5
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
-4.233464, -4.669608, -0.1594758, 0, -0.5, 0.5, 0.5,
-4.233464, -4.669608, -0.1594758, 1, -0.5, 0.5, 0.5,
-4.233464, -4.669608, -0.1594758, 1, 1.5, 0.5, 0.5,
-4.233464, -4.669608, -0.1594758, 0, 1.5, 0.5, 0.5
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
-3, -3.612677, -6.120409,
3, -3.612677, -6.120409,
-3, -3.612677, -6.120409,
-3, -3.788832, -6.418457,
-2, -3.612677, -6.120409,
-2, -3.788832, -6.418457,
-1, -3.612677, -6.120409,
-1, -3.788832, -6.418457,
0, -3.612677, -6.120409,
0, -3.788832, -6.418457,
1, -3.612677, -6.120409,
1, -3.788832, -6.418457,
2, -3.612677, -6.120409,
2, -3.788832, -6.418457,
3, -3.612677, -6.120409,
3, -3.788832, -6.418457
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
-3, -4.141142, -7.01455, 0, -0.5, 0.5, 0.5,
-3, -4.141142, -7.01455, 1, -0.5, 0.5, 0.5,
-3, -4.141142, -7.01455, 1, 1.5, 0.5, 0.5,
-3, -4.141142, -7.01455, 0, 1.5, 0.5, 0.5,
-2, -4.141142, -7.01455, 0, -0.5, 0.5, 0.5,
-2, -4.141142, -7.01455, 1, -0.5, 0.5, 0.5,
-2, -4.141142, -7.01455, 1, 1.5, 0.5, 0.5,
-2, -4.141142, -7.01455, 0, 1.5, 0.5, 0.5,
-1, -4.141142, -7.01455, 0, -0.5, 0.5, 0.5,
-1, -4.141142, -7.01455, 1, -0.5, 0.5, 0.5,
-1, -4.141142, -7.01455, 1, 1.5, 0.5, 0.5,
-1, -4.141142, -7.01455, 0, 1.5, 0.5, 0.5,
0, -4.141142, -7.01455, 0, -0.5, 0.5, 0.5,
0, -4.141142, -7.01455, 1, -0.5, 0.5, 0.5,
0, -4.141142, -7.01455, 1, 1.5, 0.5, 0.5,
0, -4.141142, -7.01455, 0, 1.5, 0.5, 0.5,
1, -4.141142, -7.01455, 0, -0.5, 0.5, 0.5,
1, -4.141142, -7.01455, 1, -0.5, 0.5, 0.5,
1, -4.141142, -7.01455, 1, 1.5, 0.5, 0.5,
1, -4.141142, -7.01455, 0, 1.5, 0.5, 0.5,
2, -4.141142, -7.01455, 0, -0.5, 0.5, 0.5,
2, -4.141142, -7.01455, 1, -0.5, 0.5, 0.5,
2, -4.141142, -7.01455, 1, 1.5, 0.5, 0.5,
2, -4.141142, -7.01455, 0, 1.5, 0.5, 0.5,
3, -4.141142, -7.01455, 0, -0.5, 0.5, 0.5,
3, -4.141142, -7.01455, 1, -0.5, 0.5, 0.5,
3, -4.141142, -7.01455, 1, 1.5, 0.5, 0.5,
3, -4.141142, -7.01455, 0, 1.5, 0.5, 0.5
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
-3.208198, -3, -6.120409,
-3.208198, 3, -6.120409,
-3.208198, -3, -6.120409,
-3.379075, -3, -6.418457,
-3.208198, -2, -6.120409,
-3.379075, -2, -6.418457,
-3.208198, -1, -6.120409,
-3.379075, -1, -6.418457,
-3.208198, 0, -6.120409,
-3.379075, 0, -6.418457,
-3.208198, 1, -6.120409,
-3.379075, 1, -6.418457,
-3.208198, 2, -6.120409,
-3.379075, 2, -6.418457,
-3.208198, 3, -6.120409,
-3.379075, 3, -6.418457
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
-3.720831, -3, -7.01455, 0, -0.5, 0.5, 0.5,
-3.720831, -3, -7.01455, 1, -0.5, 0.5, 0.5,
-3.720831, -3, -7.01455, 1, 1.5, 0.5, 0.5,
-3.720831, -3, -7.01455, 0, 1.5, 0.5, 0.5,
-3.720831, -2, -7.01455, 0, -0.5, 0.5, 0.5,
-3.720831, -2, -7.01455, 1, -0.5, 0.5, 0.5,
-3.720831, -2, -7.01455, 1, 1.5, 0.5, 0.5,
-3.720831, -2, -7.01455, 0, 1.5, 0.5, 0.5,
-3.720831, -1, -7.01455, 0, -0.5, 0.5, 0.5,
-3.720831, -1, -7.01455, 1, -0.5, 0.5, 0.5,
-3.720831, -1, -7.01455, 1, 1.5, 0.5, 0.5,
-3.720831, -1, -7.01455, 0, 1.5, 0.5, 0.5,
-3.720831, 0, -7.01455, 0, -0.5, 0.5, 0.5,
-3.720831, 0, -7.01455, 1, -0.5, 0.5, 0.5,
-3.720831, 0, -7.01455, 1, 1.5, 0.5, 0.5,
-3.720831, 0, -7.01455, 0, 1.5, 0.5, 0.5,
-3.720831, 1, -7.01455, 0, -0.5, 0.5, 0.5,
-3.720831, 1, -7.01455, 1, -0.5, 0.5, 0.5,
-3.720831, 1, -7.01455, 1, 1.5, 0.5, 0.5,
-3.720831, 1, -7.01455, 0, 1.5, 0.5, 0.5,
-3.720831, 2, -7.01455, 0, -0.5, 0.5, 0.5,
-3.720831, 2, -7.01455, 1, -0.5, 0.5, 0.5,
-3.720831, 2, -7.01455, 1, 1.5, 0.5, 0.5,
-3.720831, 2, -7.01455, 0, 1.5, 0.5, 0.5,
-3.720831, 3, -7.01455, 0, -0.5, 0.5, 0.5,
-3.720831, 3, -7.01455, 1, -0.5, 0.5, 0.5,
-3.720831, 3, -7.01455, 1, 1.5, 0.5, 0.5,
-3.720831, 3, -7.01455, 0, 1.5, 0.5, 0.5
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
-3.208198, -3.612677, -4,
-3.208198, -3.612677, 4,
-3.208198, -3.612677, -4,
-3.379075, -3.788832, -4,
-3.208198, -3.612677, -2,
-3.379075, -3.788832, -2,
-3.208198, -3.612677, 0,
-3.379075, -3.788832, 0,
-3.208198, -3.612677, 2,
-3.379075, -3.788832, 2,
-3.208198, -3.612677, 4,
-3.379075, -3.788832, 4
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
-3.720831, -4.141142, -4, 0, -0.5, 0.5, 0.5,
-3.720831, -4.141142, -4, 1, -0.5, 0.5, 0.5,
-3.720831, -4.141142, -4, 1, 1.5, 0.5, 0.5,
-3.720831, -4.141142, -4, 0, 1.5, 0.5, 0.5,
-3.720831, -4.141142, -2, 0, -0.5, 0.5, 0.5,
-3.720831, -4.141142, -2, 1, -0.5, 0.5, 0.5,
-3.720831, -4.141142, -2, 1, 1.5, 0.5, 0.5,
-3.720831, -4.141142, -2, 0, 1.5, 0.5, 0.5,
-3.720831, -4.141142, 0, 0, -0.5, 0.5, 0.5,
-3.720831, -4.141142, 0, 1, -0.5, 0.5, 0.5,
-3.720831, -4.141142, 0, 1, 1.5, 0.5, 0.5,
-3.720831, -4.141142, 0, 0, 1.5, 0.5, 0.5,
-3.720831, -4.141142, 2, 0, -0.5, 0.5, 0.5,
-3.720831, -4.141142, 2, 1, -0.5, 0.5, 0.5,
-3.720831, -4.141142, 2, 1, 1.5, 0.5, 0.5,
-3.720831, -4.141142, 2, 0, 1.5, 0.5, 0.5,
-3.720831, -4.141142, 4, 0, -0.5, 0.5, 0.5,
-3.720831, -4.141142, 4, 1, -0.5, 0.5, 0.5,
-3.720831, -4.141142, 4, 1, 1.5, 0.5, 0.5,
-3.720831, -4.141142, 4, 0, 1.5, 0.5, 0.5
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
-3.208198, -3.612677, -6.120409,
-3.208198, 3.43353, -6.120409,
-3.208198, -3.612677, 5.801458,
-3.208198, 3.43353, 5.801458,
-3.208198, -3.612677, -6.120409,
-3.208198, -3.612677, 5.801458,
-3.208198, 3.43353, -6.120409,
-3.208198, 3.43353, 5.801458,
-3.208198, -3.612677, -6.120409,
3.62691, -3.612677, -6.120409,
-3.208198, -3.612677, 5.801458,
3.62691, -3.612677, 5.801458,
-3.208198, 3.43353, -6.120409,
3.62691, 3.43353, -6.120409,
-3.208198, 3.43353, 5.801458,
3.62691, 3.43353, 5.801458,
3.62691, -3.612677, -6.120409,
3.62691, 3.43353, -6.120409,
3.62691, -3.612677, 5.801458,
3.62691, 3.43353, 5.801458,
3.62691, -3.612677, -6.120409,
3.62691, -3.612677, 5.801458,
3.62691, 3.43353, -6.120409,
3.62691, 3.43353, 5.801458
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
var radius = 8.246476;
var distance = 36.68951;
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
mvMatrix.translate( -0.2093562, 0.0895735, 0.1594758 );
mvMatrix.scale( 1.304479, 1.265398, 0.7478905 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.68951);
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
Dicrotophos<-read.table("Dicrotophos.xyz")
```

```
## Error in read.table("Dicrotophos.xyz"): no lines available in input
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
-3.108657, -2.152755, -1.531951, 0, 0, 1, 1, 1,
-2.89468, -0.8745124, -1.516501, 1, 0, 0, 1, 1,
-2.632942, -0.9449373, -2.051755, 1, 0, 0, 1, 1,
-2.6319, 0.7215801, -1.8469, 1, 0, 0, 1, 1,
-2.510611, 0.3305735, -1.510879, 1, 0, 0, 1, 1,
-2.472675, -0.2726986, -2.128772, 1, 0, 0, 1, 1,
-2.456435, -2.052601, -2.710966, 0, 0, 0, 1, 1,
-2.411044, -1.329818, -3.574111, 0, 0, 0, 1, 1,
-2.408321, -0.766468, -1.216443, 0, 0, 0, 1, 1,
-2.405095, -1.386802, -3.025206, 0, 0, 0, 1, 1,
-2.323506, 0.6525748, -1.94503, 0, 0, 0, 1, 1,
-2.231801, -0.5119812, -1.218508, 0, 0, 0, 1, 1,
-2.161342, -0.1900793, -0.7453447, 0, 0, 0, 1, 1,
-2.146173, -1.136164, -1.659866, 1, 1, 1, 1, 1,
-2.124887, -0.6241534, -1.554971, 1, 1, 1, 1, 1,
-2.119977, 0.3378089, -1.451566, 1, 1, 1, 1, 1,
-2.118741, 0.758554, -1.172138, 1, 1, 1, 1, 1,
-2.117513, -0.4974366, -2.290416, 1, 1, 1, 1, 1,
-2.081268, 0.8281289, -1.645176, 1, 1, 1, 1, 1,
-2.03463, 0.0534913, -1.799598, 1, 1, 1, 1, 1,
-1.959021, 0.4421032, -1.837509, 1, 1, 1, 1, 1,
-1.924594, -1.316544, -0.1121988, 1, 1, 1, 1, 1,
-1.892614, 2.185985, -1.049543, 1, 1, 1, 1, 1,
-1.887204, 0.6817317, -1.810437, 1, 1, 1, 1, 1,
-1.862759, -1.108154, -1.047781, 1, 1, 1, 1, 1,
-1.861655, -0.9582145, -0.6261625, 1, 1, 1, 1, 1,
-1.84808, -1.385871, -2.016568, 1, 1, 1, 1, 1,
-1.843589, 1.087814, -0.764698, 1, 1, 1, 1, 1,
-1.843422, -0.7686883, -1.397912, 0, 0, 1, 1, 1,
-1.838892, 1.07572, -2.040491, 1, 0, 0, 1, 1,
-1.774093, 1.76867, -0.8527954, 1, 0, 0, 1, 1,
-1.758184, 1.380722, -0.5291497, 1, 0, 0, 1, 1,
-1.755866, 1.268401, -1.376138, 1, 0, 0, 1, 1,
-1.742161, 1.268663, -1.868305, 1, 0, 0, 1, 1,
-1.725445, 0.3454698, -1.71004, 0, 0, 0, 1, 1,
-1.717191, -1.242747, -2.290492, 0, 0, 0, 1, 1,
-1.699002, -0.02040031, -1.641354, 0, 0, 0, 1, 1,
-1.68478, 2.399324, 1.029529, 0, 0, 0, 1, 1,
-1.670427, -0.5873518, -2.455189, 0, 0, 0, 1, 1,
-1.666198, -1.279381, -1.316002, 0, 0, 0, 1, 1,
-1.665413, 0.5394113, -0.9284142, 0, 0, 0, 1, 1,
-1.656753, -0.9168313, -1.777706, 1, 1, 1, 1, 1,
-1.642257, -1.463846, -0.5069001, 1, 1, 1, 1, 1,
-1.624567, -1.936722, -2.383116, 1, 1, 1, 1, 1,
-1.618596, 1.519448, -1.765738, 1, 1, 1, 1, 1,
-1.598199, 0.1067304, -0.9861642, 1, 1, 1, 1, 1,
-1.593559, 0.1460464, -3.348316, 1, 1, 1, 1, 1,
-1.585507, -0.651589, -0.7233598, 1, 1, 1, 1, 1,
-1.577029, 0.931991, -0.9809089, 1, 1, 1, 1, 1,
-1.559085, -0.4581157, -1.918215, 1, 1, 1, 1, 1,
-1.545747, -0.6701379, -2.085198, 1, 1, 1, 1, 1,
-1.54212, 0.4738919, -1.612253, 1, 1, 1, 1, 1,
-1.521662, 1.576637, -2.036202, 1, 1, 1, 1, 1,
-1.520099, 0.540466, -0.3774373, 1, 1, 1, 1, 1,
-1.515439, 0.258053, -0.5868739, 1, 1, 1, 1, 1,
-1.511178, 0.01153215, -1.782471, 1, 1, 1, 1, 1,
-1.507965, 0.3978291, 0.5454987, 0, 0, 1, 1, 1,
-1.501972, 0.5467099, -2.709773, 1, 0, 0, 1, 1,
-1.466033, -0.3110546, -2.374642, 1, 0, 0, 1, 1,
-1.464558, 0.0554796, -2.190334, 1, 0, 0, 1, 1,
-1.463383, 2.015996, 0.7221844, 1, 0, 0, 1, 1,
-1.437687, -1.97654, -1.887444, 1, 0, 0, 1, 1,
-1.432179, -1.404331, -4.1912, 0, 0, 0, 1, 1,
-1.43078, -0.9811063, -0.8789977, 0, 0, 0, 1, 1,
-1.4202, -0.1402465, -2.443717, 0, 0, 0, 1, 1,
-1.404624, -0.1120164, -2.362457, 0, 0, 0, 1, 1,
-1.397643, 0.002392894, -0.482934, 0, 0, 0, 1, 1,
-1.378458, 1.140064, -1.515214, 0, 0, 0, 1, 1,
-1.374807, -0.5978798, -1.826023, 0, 0, 0, 1, 1,
-1.373027, -0.2269509, -2.424546, 1, 1, 1, 1, 1,
-1.371218, -0.1343655, -0.9677871, 1, 1, 1, 1, 1,
-1.357934, 0.2420453, -2.366879, 1, 1, 1, 1, 1,
-1.350686, -0.9056007, -3.293001, 1, 1, 1, 1, 1,
-1.350037, 0.4919599, -1.468617, 1, 1, 1, 1, 1,
-1.348277, 1.563556, -0.3349691, 1, 1, 1, 1, 1,
-1.346211, -0.5627638, -2.776886, 1, 1, 1, 1, 1,
-1.343256, -1.132453, -2.786801, 1, 1, 1, 1, 1,
-1.342399, -1.100478, -2.630101, 1, 1, 1, 1, 1,
-1.334342, 1.862313, -2.192015, 1, 1, 1, 1, 1,
-1.333822, 0.04155125, -1.880561, 1, 1, 1, 1, 1,
-1.330599, 0.4662741, -2.428481, 1, 1, 1, 1, 1,
-1.328826, 0.9086996, -0.6857021, 1, 1, 1, 1, 1,
-1.327711, 0.6314341, -0.3594787, 1, 1, 1, 1, 1,
-1.326716, -1.157134, 0.03997809, 1, 1, 1, 1, 1,
-1.325172, -1.837854, -0.9072136, 0, 0, 1, 1, 1,
-1.308739, -0.08455646, -1.056525, 1, 0, 0, 1, 1,
-1.303889, 0.6540496, -1.293733, 1, 0, 0, 1, 1,
-1.296062, 0.1338152, 0.06370001, 1, 0, 0, 1, 1,
-1.295809, 0.9376054, -2.229541, 1, 0, 0, 1, 1,
-1.294799, -1.239037, -1.33508, 1, 0, 0, 1, 1,
-1.291524, 0.4603259, -1.781651, 0, 0, 0, 1, 1,
-1.282903, -2.576112, -4.423609, 0, 0, 0, 1, 1,
-1.275577, -0.1953035, -2.117818, 0, 0, 0, 1, 1,
-1.260273, 0.04809483, -1.801411, 0, 0, 0, 1, 1,
-1.256845, -1.247793, -2.38681, 0, 0, 0, 1, 1,
-1.256343, -0.2049115, -1.847185, 0, 0, 0, 1, 1,
-1.253532, -0.8217471, -2.798696, 0, 0, 0, 1, 1,
-1.248498, -0.8690552, -2.495438, 1, 1, 1, 1, 1,
-1.239359, -0.8227125, -0.8366509, 1, 1, 1, 1, 1,
-1.231716, 0.295911, -1.345033, 1, 1, 1, 1, 1,
-1.22809, 0.2518462, -1.705295, 1, 1, 1, 1, 1,
-1.223427, -1.672802, -3.344029, 1, 1, 1, 1, 1,
-1.222954, -1.440248, -2.563006, 1, 1, 1, 1, 1,
-1.216701, 1.167745, -1.381288, 1, 1, 1, 1, 1,
-1.212075, -0.2522622, -2.398225, 1, 1, 1, 1, 1,
-1.208937, -0.1508343, -3.231733, 1, 1, 1, 1, 1,
-1.205499, -0.4260203, -2.995869, 1, 1, 1, 1, 1,
-1.204368, -0.7549896, -2.631252, 1, 1, 1, 1, 1,
-1.192041, 0.07374989, -1.132573, 1, 1, 1, 1, 1,
-1.186983, -0.2447984, -2.802061, 1, 1, 1, 1, 1,
-1.184694, 1.307666, -0.858245, 1, 1, 1, 1, 1,
-1.180838, -0.8571306, -1.059599, 1, 1, 1, 1, 1,
-1.177042, -0.2143569, -1.321203, 0, 0, 1, 1, 1,
-1.17064, -1.164702, -2.334852, 1, 0, 0, 1, 1,
-1.165404, 1.903842, -1.292776, 1, 0, 0, 1, 1,
-1.16306, 0.6121548, -1.079155, 1, 0, 0, 1, 1,
-1.161975, -0.3294811, -1.223163, 1, 0, 0, 1, 1,
-1.160199, 0.3838288, -0.2658384, 1, 0, 0, 1, 1,
-1.15989, 0.434351, -1.040017, 0, 0, 0, 1, 1,
-1.15586, 0.7249168, -1.860348, 0, 0, 0, 1, 1,
-1.155386, 0.3874015, 0.5716091, 0, 0, 0, 1, 1,
-1.148495, 1.029641, 0.239256, 0, 0, 0, 1, 1,
-1.143003, 0.3523299, -0.4733767, 0, 0, 0, 1, 1,
-1.133195, 1.917791, -2.029524, 0, 0, 0, 1, 1,
-1.12749, -0.4075789, -2.312074, 0, 0, 0, 1, 1,
-1.118036, 1.59518, 0.03424425, 1, 1, 1, 1, 1,
-1.117378, -0.6545398, -1.968866, 1, 1, 1, 1, 1,
-1.101647, 0.2296097, -0.67234, 1, 1, 1, 1, 1,
-1.099843, -1.376859, -1.728754, 1, 1, 1, 1, 1,
-1.097169, -0.3328471, -2.694535, 1, 1, 1, 1, 1,
-1.096545, -1.061031, -1.975916, 1, 1, 1, 1, 1,
-1.095848, -0.9365749, -2.164944, 1, 1, 1, 1, 1,
-1.094554, -0.4685652, -1.617786, 1, 1, 1, 1, 1,
-1.071102, 0.4743782, -1.127655, 1, 1, 1, 1, 1,
-1.054883, -2.687335, -3.12564, 1, 1, 1, 1, 1,
-1.050882, 0.826198, -0.2343832, 1, 1, 1, 1, 1,
-1.050638, 0.2926707, -0.9121547, 1, 1, 1, 1, 1,
-1.042566, -0.342701, -3.536877, 1, 1, 1, 1, 1,
-1.029189, -0.8453256, -3.118609, 1, 1, 1, 1, 1,
-1.026337, -1.32612, -2.846314, 1, 1, 1, 1, 1,
-1.025151, -0.5348984, -3.752791, 0, 0, 1, 1, 1,
-1.016747, 0.3867938, -0.9747762, 1, 0, 0, 1, 1,
-1.01507, 2.072648, -0.7440174, 1, 0, 0, 1, 1,
-1.006213, 0.1479961, 0.3857385, 1, 0, 0, 1, 1,
-1.005911, -1.068706, -1.424315, 1, 0, 0, 1, 1,
-1.00349, -0.06458902, -0.4739626, 1, 0, 0, 1, 1,
-1.000542, -0.1000185, -2.693392, 0, 0, 0, 1, 1,
-0.9862103, -1.437515, -1.921839, 0, 0, 0, 1, 1,
-0.9848765, -1.00067, -2.73126, 0, 0, 0, 1, 1,
-0.9794717, 0.656187, -1.206678, 0, 0, 0, 1, 1,
-0.9635129, -0.541042, -1.718814, 0, 0, 0, 1, 1,
-0.9570307, -3.510062, -2.666223, 0, 0, 0, 1, 1,
-0.9556217, 0.4735644, -0.6131975, 0, 0, 0, 1, 1,
-0.9555991, -1.628583, -3.554791, 1, 1, 1, 1, 1,
-0.9534732, -0.06540607, -2.050487, 1, 1, 1, 1, 1,
-0.9448556, 1.012909, 0.172866, 1, 1, 1, 1, 1,
-0.9410427, 0.3847454, -1.502705, 1, 1, 1, 1, 1,
-0.9337279, -1.087894, -2.938832, 1, 1, 1, 1, 1,
-0.9244013, 0.5788093, -1.255949, 1, 1, 1, 1, 1,
-0.921436, 1.062469, 0.2824683, 1, 1, 1, 1, 1,
-0.9192929, 0.2086082, -1.140299, 1, 1, 1, 1, 1,
-0.9184351, 1.000222, -0.9359505, 1, 1, 1, 1, 1,
-0.9103342, -1.537212, -2.43408, 1, 1, 1, 1, 1,
-0.9058169, 1.746903, 0.304216, 1, 1, 1, 1, 1,
-0.9052734, -0.01966805, -1.344971, 1, 1, 1, 1, 1,
-0.8975236, 0.6787241, -1.565063, 1, 1, 1, 1, 1,
-0.8907315, -0.6498372, -2.580832, 1, 1, 1, 1, 1,
-0.8840074, -1.112124, -2.625385, 1, 1, 1, 1, 1,
-0.8734874, 0.9124729, -0.1552414, 0, 0, 1, 1, 1,
-0.8733647, 1.095088, -2.051352, 1, 0, 0, 1, 1,
-0.8722618, -1.750713, -2.010357, 1, 0, 0, 1, 1,
-0.8721434, 1.583417, 1.210619, 1, 0, 0, 1, 1,
-0.8670456, -0.1048703, -2.844324, 1, 0, 0, 1, 1,
-0.866828, -1.887885, -3.474498, 1, 0, 0, 1, 1,
-0.8617861, 0.03052537, -1.323154, 0, 0, 0, 1, 1,
-0.8509662, 0.909512, 1.617588, 0, 0, 0, 1, 1,
-0.8392707, 0.1308706, -1.565039, 0, 0, 0, 1, 1,
-0.8383069, 0.01661862, -1.899118, 0, 0, 0, 1, 1,
-0.8302155, -1.153722, -4.78966, 0, 0, 0, 1, 1,
-0.8299473, 0.3027399, -1.292487, 0, 0, 0, 1, 1,
-0.8288426, 0.7388243, 0.7286588, 0, 0, 0, 1, 1,
-0.8273776, 0.03043897, -1.121013, 1, 1, 1, 1, 1,
-0.8268583, 1.95854, -1.679574, 1, 1, 1, 1, 1,
-0.8238397, 1.569735, -2.007579, 1, 1, 1, 1, 1,
-0.8222573, -0.7494065, -2.771496, 1, 1, 1, 1, 1,
-0.8179366, -0.7723758, -2.274696, 1, 1, 1, 1, 1,
-0.8165618, 0.1396164, -1.971643, 1, 1, 1, 1, 1,
-0.8122391, -1.244147, -2.904829, 1, 1, 1, 1, 1,
-0.8108124, -1.152103, -0.06243668, 1, 1, 1, 1, 1,
-0.8081923, -1.511308, -3.829043, 1, 1, 1, 1, 1,
-0.8025196, 0.07199197, -0.8944202, 1, 1, 1, 1, 1,
-0.799544, 0.2144094, -1.369296, 1, 1, 1, 1, 1,
-0.796818, 0.3333015, -0.9262434, 1, 1, 1, 1, 1,
-0.7959121, -0.6556906, -2.074768, 1, 1, 1, 1, 1,
-0.7855573, -0.07702576, -0.3303624, 1, 1, 1, 1, 1,
-0.7799993, 1.14145, 1.267513, 1, 1, 1, 1, 1,
-0.7753239, -1.544576, -4.137655, 0, 0, 1, 1, 1,
-0.7745706, 1.184414, -0.2675492, 1, 0, 0, 1, 1,
-0.7723029, -0.5211677, -1.263233, 1, 0, 0, 1, 1,
-0.7641213, 1.115026, 0.5594376, 1, 0, 0, 1, 1,
-0.7641111, -0.2832914, -0.6568235, 1, 0, 0, 1, 1,
-0.7571883, -1.663127, -3.653808, 1, 0, 0, 1, 1,
-0.7567549, 0.9768965, 1.146741, 0, 0, 0, 1, 1,
-0.7494988, 1.697626, -0.3508944, 0, 0, 0, 1, 1,
-0.7482193, 0.2542366, -1.313863, 0, 0, 0, 1, 1,
-0.7295929, -3.072955, -2.69512, 0, 0, 0, 1, 1,
-0.7287823, 0.07962801, -0.1582801, 0, 0, 0, 1, 1,
-0.7281973, -0.02277277, -0.7561358, 0, 0, 0, 1, 1,
-0.7277399, -1.328982, -1.836823, 0, 0, 0, 1, 1,
-0.7230299, -0.2264111, -1.589997, 1, 1, 1, 1, 1,
-0.7223226, 0.7176012, -0.2041089, 1, 1, 1, 1, 1,
-0.7202667, 1.122679, -0.9687274, 1, 1, 1, 1, 1,
-0.7180408, 0.8765155, -2.370632, 1, 1, 1, 1, 1,
-0.7176544, -1.450033, -2.862706, 1, 1, 1, 1, 1,
-0.7133898, -1.180428, -1.742283, 1, 1, 1, 1, 1,
-0.7108915, -0.0005333136, -2.70739, 1, 1, 1, 1, 1,
-0.7073603, -0.7160977, -1.875576, 1, 1, 1, 1, 1,
-0.6948336, 0.7684995, -0.4114528, 1, 1, 1, 1, 1,
-0.68372, -1.707626, -0.7836621, 1, 1, 1, 1, 1,
-0.6832163, -0.7712056, -3.136523, 1, 1, 1, 1, 1,
-0.6629348, 0.4219554, -0.2590041, 1, 1, 1, 1, 1,
-0.6628764, 0.1979871, -2.218287, 1, 1, 1, 1, 1,
-0.662672, 0.5285129, -0.3450682, 1, 1, 1, 1, 1,
-0.6579932, 1.072771, 0.02856519, 1, 1, 1, 1, 1,
-0.6553428, -0.9691448, -0.6946263, 0, 0, 1, 1, 1,
-0.6432511, -0.1407967, -2.299485, 1, 0, 0, 1, 1,
-0.6418634, 0.8733432, -0.9019269, 1, 0, 0, 1, 1,
-0.6387115, 0.944644, 0.4418772, 1, 0, 0, 1, 1,
-0.6313775, 0.007537077, -1.251772, 1, 0, 0, 1, 1,
-0.6311995, -0.4728682, -1.759467, 1, 0, 0, 1, 1,
-0.6310652, -0.06683262, -2.64702, 0, 0, 0, 1, 1,
-0.6268005, 1.299084, -0.2539301, 0, 0, 0, 1, 1,
-0.6232488, 1.496262, 1.085323, 0, 0, 0, 1, 1,
-0.6231101, 0.2885773, -2.570216, 0, 0, 0, 1, 1,
-0.6230918, -0.7268252, -1.866566, 0, 0, 0, 1, 1,
-0.6218864, 1.154589, -0.2687804, 0, 0, 0, 1, 1,
-0.6196383, 0.7357559, -1.236744, 0, 0, 0, 1, 1,
-0.6191617, -0.2858195, -2.201964, 1, 1, 1, 1, 1,
-0.6184573, 0.2913692, -0.06339433, 1, 1, 1, 1, 1,
-0.6167609, 1.718399, -0.3930613, 1, 1, 1, 1, 1,
-0.6094244, -0.260471, -1.60999, 1, 1, 1, 1, 1,
-0.6074495, 0.9124149, -0.3552106, 1, 1, 1, 1, 1,
-0.6064607, 1.379777, 1.06027, 1, 1, 1, 1, 1,
-0.6034744, -1.019889, -3.489294, 1, 1, 1, 1, 1,
-0.5941346, 0.7566766, 0.1926915, 1, 1, 1, 1, 1,
-0.5925232, -2.344327, -3.418711, 1, 1, 1, 1, 1,
-0.5891865, 1.105731, -3.195126, 1, 1, 1, 1, 1,
-0.5860952, 1.061626, -0.2414993, 1, 1, 1, 1, 1,
-0.5857398, -0.6767446, -2.032679, 1, 1, 1, 1, 1,
-0.5840489, 0.3974615, 0.20236, 1, 1, 1, 1, 1,
-0.5837086, 0.6751433, -1.919993, 1, 1, 1, 1, 1,
-0.5812652, 0.4047338, -1.00887, 1, 1, 1, 1, 1,
-0.5750473, 1.4759, 0.3002401, 0, 0, 1, 1, 1,
-0.5723062, -0.3047109, -2.918895, 1, 0, 0, 1, 1,
-0.5638505, 1.573929, 1.117506, 1, 0, 0, 1, 1,
-0.5638466, 0.3907686, -0.9797915, 1, 0, 0, 1, 1,
-0.5630678, -2.028844, -3.37841, 1, 0, 0, 1, 1,
-0.5557804, -2.113243, -2.433364, 1, 0, 0, 1, 1,
-0.5555057, -0.5291786, -1.923453, 0, 0, 0, 1, 1,
-0.5485048, 1.443905, 0.2666452, 0, 0, 0, 1, 1,
-0.5446838, 0.7973549, -0.7442878, 0, 0, 0, 1, 1,
-0.5427983, 1.435186, -0.397623, 0, 0, 0, 1, 1,
-0.5413558, 0.3291603, -1.41654, 0, 0, 0, 1, 1,
-0.5397068, -1.725791, -2.004596, 0, 0, 0, 1, 1,
-0.5341172, 0.7121356, -0.4546292, 0, 0, 0, 1, 1,
-0.5335878, -1.727224, -1.822748, 1, 1, 1, 1, 1,
-0.5302351, -0.4141075, -0.002704039, 1, 1, 1, 1, 1,
-0.5264949, 0.4364889, -0.4927146, 1, 1, 1, 1, 1,
-0.5259494, -1.356044, -2.703924, 1, 1, 1, 1, 1,
-0.5212389, 0.06530539, -2.567299, 1, 1, 1, 1, 1,
-0.5172794, 2.041772, 1.32918, 1, 1, 1, 1, 1,
-0.5169303, 1.295467, -0.1814229, 1, 1, 1, 1, 1,
-0.5163747, 0.02486195, -0.8194063, 1, 1, 1, 1, 1,
-0.5150126, 0.1256415, -2.231643, 1, 1, 1, 1, 1,
-0.5134751, 1.168563, -1.842842, 1, 1, 1, 1, 1,
-0.5100446, -1.861586, -1.697626, 1, 1, 1, 1, 1,
-0.5079064, 0.1258265, -0.6767878, 1, 1, 1, 1, 1,
-0.5041298, 0.007677427, -1.021943, 1, 1, 1, 1, 1,
-0.5014374, -0.4139227, -3.521051, 1, 1, 1, 1, 1,
-0.4988431, -0.002922619, -4.33426, 1, 1, 1, 1, 1,
-0.4980912, -1.490902, -2.220054, 0, 0, 1, 1, 1,
-0.4929049, 0.8879894, -1.173684, 1, 0, 0, 1, 1,
-0.4903013, 0.2360741, -1.814851, 1, 0, 0, 1, 1,
-0.4893645, 1.34093, -2.501448, 1, 0, 0, 1, 1,
-0.4870223, 1.253246, -0.007501752, 1, 0, 0, 1, 1,
-0.4839948, -0.1384371, -2.204822, 1, 0, 0, 1, 1,
-0.4820726, -1.042507, -2.698398, 0, 0, 0, 1, 1,
-0.4754229, 0.4078947, -2.99414, 0, 0, 0, 1, 1,
-0.4634313, -1.353557, -3.306941, 0, 0, 0, 1, 1,
-0.4620266, 0.1385474, -2.366417, 0, 0, 0, 1, 1,
-0.4522087, -1.176699, -1.84777, 0, 0, 0, 1, 1,
-0.4520724, -0.5203565, -2.765213, 0, 0, 0, 1, 1,
-0.4510476, -0.300632, -0.7358253, 0, 0, 0, 1, 1,
-0.4490387, -0.6089923, -2.294528, 1, 1, 1, 1, 1,
-0.4464065, -0.0651144, -1.54741, 1, 1, 1, 1, 1,
-0.4429657, 0.1285932, -2.269992, 1, 1, 1, 1, 1,
-0.4329031, -0.4356038, -0.7203053, 1, 1, 1, 1, 1,
-0.429312, -0.7680202, -0.7406013, 1, 1, 1, 1, 1,
-0.4229221, -1.564558, -4.022674, 1, 1, 1, 1, 1,
-0.4213881, -1.110112, -1.909871, 1, 1, 1, 1, 1,
-0.4172101, 1.343084, -0.006197088, 1, 1, 1, 1, 1,
-0.4160053, -0.258184, -1.554464, 1, 1, 1, 1, 1,
-0.4127581, 1.427598, -0.9375037, 1, 1, 1, 1, 1,
-0.4126724, -0.3489584, -1.576818, 1, 1, 1, 1, 1,
-0.4100063, 0.8243722, 0.2900511, 1, 1, 1, 1, 1,
-0.406867, 1.458605, -0.9663917, 1, 1, 1, 1, 1,
-0.4045288, 1.429252, 0.2484531, 1, 1, 1, 1, 1,
-0.4025397, 1.926647, 1.155953, 1, 1, 1, 1, 1,
-0.3990318, 0.5315389, -1.054708, 0, 0, 1, 1, 1,
-0.395216, 1.154814, -1.232317, 1, 0, 0, 1, 1,
-0.3935682, -1.099113, -2.73476, 1, 0, 0, 1, 1,
-0.3918452, 0.892647, -0.2785986, 1, 0, 0, 1, 1,
-0.3911523, 0.2843966, 0.04234875, 1, 0, 0, 1, 1,
-0.3909414, -0.5102334, -3.21563, 1, 0, 0, 1, 1,
-0.3758944, -0.7036987, -1.821501, 0, 0, 0, 1, 1,
-0.3752683, -1.020758, -2.321948, 0, 0, 0, 1, 1,
-0.373679, 0.6691739, -0.6103758, 0, 0, 0, 1, 1,
-0.370026, -0.5357197, -3.220561, 0, 0, 0, 1, 1,
-0.3697051, -0.223214, -2.63167, 0, 0, 0, 1, 1,
-0.369617, -0.1236738, -2.018869, 0, 0, 0, 1, 1,
-0.365391, 2.559748, -0.8249311, 0, 0, 0, 1, 1,
-0.3622018, -0.2685098, -1.65282, 1, 1, 1, 1, 1,
-0.360142, -0.9766819, -0.6142223, 1, 1, 1, 1, 1,
-0.3490305, 1.239218, 0.1312362, 1, 1, 1, 1, 1,
-0.3478732, 0.1378244, -1.055071, 1, 1, 1, 1, 1,
-0.3467624, 0.653926, -1.397067, 1, 1, 1, 1, 1,
-0.3466014, -0.6071088, -2.502859, 1, 1, 1, 1, 1,
-0.3430938, 0.3139268, -0.7564035, 1, 1, 1, 1, 1,
-0.3427933, -1.798379, -1.466666, 1, 1, 1, 1, 1,
-0.3423641, 1.678298, -0.5152895, 1, 1, 1, 1, 1,
-0.3376642, -0.3038656, -1.928745, 1, 1, 1, 1, 1,
-0.3352698, -0.6764355, -2.387208, 1, 1, 1, 1, 1,
-0.3347017, 1.227755, -1.056681, 1, 1, 1, 1, 1,
-0.332062, 0.9243423, -1.215174, 1, 1, 1, 1, 1,
-0.3286837, 1.012985, 0.9018723, 1, 1, 1, 1, 1,
-0.3262689, -1.174134, -3.14219, 1, 1, 1, 1, 1,
-0.3232478, -0.3467375, -3.995969, 0, 0, 1, 1, 1,
-0.3223174, 0.8022295, 0.1157028, 1, 0, 0, 1, 1,
-0.3206311, -0.08661712, -2.655499, 1, 0, 0, 1, 1,
-0.3170875, 1.089702, 0.1242101, 1, 0, 0, 1, 1,
-0.3150641, -1.600607, -5.94679, 1, 0, 0, 1, 1,
-0.3107072, 0.3853602, -0.0305612, 1, 0, 0, 1, 1,
-0.3091417, -0.465469, -2.915579, 0, 0, 0, 1, 1,
-0.3049534, -0.6811689, -4.235124, 0, 0, 0, 1, 1,
-0.304048, -0.6433564, -2.033218, 0, 0, 0, 1, 1,
-0.3008627, -0.1664106, -2.331279, 0, 0, 0, 1, 1,
-0.2988585, -1.003481, -3.217322, 0, 0, 0, 1, 1,
-0.2976192, 1.198541, -0.8404173, 0, 0, 0, 1, 1,
-0.296215, 1.969771, 0.4695611, 0, 0, 0, 1, 1,
-0.2952249, -1.73758, -3.105339, 1, 1, 1, 1, 1,
-0.2908809, 1.096245, -0.6628092, 1, 1, 1, 1, 1,
-0.2896032, 0.5314437, -0.9390027, 1, 1, 1, 1, 1,
-0.2891998, 0.3537171, -1.13222, 1, 1, 1, 1, 1,
-0.2852158, 1.068684, 0.5346256, 1, 1, 1, 1, 1,
-0.2824045, -0.3249574, -2.370656, 1, 1, 1, 1, 1,
-0.2805072, -0.6723973, -2.769294, 1, 1, 1, 1, 1,
-0.2794511, -0.1965042, -1.796583, 1, 1, 1, 1, 1,
-0.2791932, -0.8969313, -3.580298, 1, 1, 1, 1, 1,
-0.2736797, 0.8309883, 1.17652, 1, 1, 1, 1, 1,
-0.2730539, -1.258214, -2.912642, 1, 1, 1, 1, 1,
-0.2709789, 1.130202, -1.449486, 1, 1, 1, 1, 1,
-0.2697337, 0.9021341, -0.3432835, 1, 1, 1, 1, 1,
-0.2677199, -1.416537, -4.246224, 1, 1, 1, 1, 1,
-0.2642746, 0.6853498, -2.314077, 1, 1, 1, 1, 1,
-0.2628769, 0.08341907, -0.4166057, 0, 0, 1, 1, 1,
-0.2616682, -0.07950152, -2.483937, 1, 0, 0, 1, 1,
-0.2609923, -0.1629608, -2.946929, 1, 0, 0, 1, 1,
-0.2609174, 1.388506, -1.770528, 1, 0, 0, 1, 1,
-0.2605765, -1.055751, -2.632789, 1, 0, 0, 1, 1,
-0.2587994, -1.316007, -3.353316, 1, 0, 0, 1, 1,
-0.2585198, -0.7938655, -2.09897, 0, 0, 0, 1, 1,
-0.251725, 0.09208827, -1.735294, 0, 0, 0, 1, 1,
-0.2497627, 0.5047005, 1.063289, 0, 0, 0, 1, 1,
-0.2496129, 0.0120638, -0.7334506, 0, 0, 0, 1, 1,
-0.2483839, -0.4094143, -2.075976, 0, 0, 0, 1, 1,
-0.2463625, 0.7000472, -0.9838187, 0, 0, 0, 1, 1,
-0.2419884, 1.457423, 2.481947, 0, 0, 0, 1, 1,
-0.2408416, 1.549798, -0.2088351, 1, 1, 1, 1, 1,
-0.2383013, 1.714849, -0.8839086, 1, 1, 1, 1, 1,
-0.2374292, 2.110846, -0.4611274, 1, 1, 1, 1, 1,
-0.2342862, 1.202598, 0.03209594, 1, 1, 1, 1, 1,
-0.2305027, 0.7695531, 0.2171489, 1, 1, 1, 1, 1,
-0.2276257, 0.2944786, -0.1863845, 1, 1, 1, 1, 1,
-0.2234097, 0.003812652, -0.8959801, 1, 1, 1, 1, 1,
-0.2228461, -0.2565764, -2.153979, 1, 1, 1, 1, 1,
-0.2226851, 1.217694, 0.1186636, 1, 1, 1, 1, 1,
-0.2213473, -0.3855404, -0.2565557, 1, 1, 1, 1, 1,
-0.2187485, 1.534796, -1.182202, 1, 1, 1, 1, 1,
-0.2179288, -0.061059, -1.102723, 1, 1, 1, 1, 1,
-0.2170125, -1.143328, -1.4667, 1, 1, 1, 1, 1,
-0.2138188, -1.516748, -1.47317, 1, 1, 1, 1, 1,
-0.2019756, 0.3667616, -2.257576, 1, 1, 1, 1, 1,
-0.2019251, 1.216745, -0.7571742, 0, 0, 1, 1, 1,
-0.2004243, 0.7530779, 1.225808, 1, 0, 0, 1, 1,
-0.1993483, 2.137065, 1.6299, 1, 0, 0, 1, 1,
-0.1989217, -1.158391, -3.662135, 1, 0, 0, 1, 1,
-0.1988405, 1.356164, -1.655463, 1, 0, 0, 1, 1,
-0.1986474, -0.7357872, -3.243733, 1, 0, 0, 1, 1,
-0.1863098, -2.228026, -2.851562, 0, 0, 0, 1, 1,
-0.1852017, 0.08172249, -1.362534, 0, 0, 0, 1, 1,
-0.1825653, 0.6006657, 0.09581898, 0, 0, 0, 1, 1,
-0.1820353, -0.02933499, -2.221581, 0, 0, 0, 1, 1,
-0.1784203, -0.4312838, -1.68877, 0, 0, 0, 1, 1,
-0.1721809, 0.3449716, 1.282322, 0, 0, 0, 1, 1,
-0.1681735, -2.29088, -4.224617, 0, 0, 0, 1, 1,
-0.166293, 0.5700676, -1.014839, 1, 1, 1, 1, 1,
-0.1661593, 0.3335803, 0.389371, 1, 1, 1, 1, 1,
-0.1658737, 0.4325383, 0.2049941, 1, 1, 1, 1, 1,
-0.1566397, 1.358608, -0.1408255, 1, 1, 1, 1, 1,
-0.1557459, -0.6627705, -3.443151, 1, 1, 1, 1, 1,
-0.1487991, -0.6167172, -2.965954, 1, 1, 1, 1, 1,
-0.1467604, -0.2458571, -2.352185, 1, 1, 1, 1, 1,
-0.1463124, 0.520323, 0.4518336, 1, 1, 1, 1, 1,
-0.1455195, -0.9874493, -3.103913, 1, 1, 1, 1, 1,
-0.1445718, -1.668371, -1.602864, 1, 1, 1, 1, 1,
-0.14333, 0.581338, -0.663564, 1, 1, 1, 1, 1,
-0.1414151, -0.2320487, -1.545304, 1, 1, 1, 1, 1,
-0.1411341, 0.3048639, 1.050629, 1, 1, 1, 1, 1,
-0.1409794, 1.490016, 0.3248958, 1, 1, 1, 1, 1,
-0.1375538, 0.1178254, -1.638978, 1, 1, 1, 1, 1,
-0.1362789, 0.0579705, -0.03065485, 0, 0, 1, 1, 1,
-0.1338686, -1.268931, -4.445398, 1, 0, 0, 1, 1,
-0.1327842, -1.250701, -4.724649, 1, 0, 0, 1, 1,
-0.1319229, -1.609045, -4.305951, 1, 0, 0, 1, 1,
-0.1223446, 0.6665871, -0.585893, 1, 0, 0, 1, 1,
-0.1203341, 0.1299098, -0.1084025, 1, 0, 0, 1, 1,
-0.1175201, 0.6043081, -1.476283, 0, 0, 0, 1, 1,
-0.1168074, 0.8264363, -0.4768353, 0, 0, 0, 1, 1,
-0.1160196, 1.271145, 0.547287, 0, 0, 0, 1, 1,
-0.1149773, 0.6052165, -0.7556512, 0, 0, 0, 1, 1,
-0.1044911, 1.936643, 0.8295657, 0, 0, 0, 1, 1,
-0.1013143, -1.683215, -2.970064, 0, 0, 0, 1, 1,
-0.09983205, -0.657218, -1.220674, 0, 0, 0, 1, 1,
-0.09673143, -1.059291, -4.610219, 1, 1, 1, 1, 1,
-0.09587419, -0.9480842, -2.075999, 1, 1, 1, 1, 1,
-0.09499121, -0.693963, -2.380753, 1, 1, 1, 1, 1,
-0.09362727, -0.6688976, -2.423631, 1, 1, 1, 1, 1,
-0.09340224, 1.156034, 1.616421, 1, 1, 1, 1, 1,
-0.09329419, 1.878995, -1.113875, 1, 1, 1, 1, 1,
-0.09086666, 0.2852252, 0.3416832, 1, 1, 1, 1, 1,
-0.08781205, 1.408334, 1.196661, 1, 1, 1, 1, 1,
-0.08742595, -0.4263583, -3.1732, 1, 1, 1, 1, 1,
-0.0822135, -0.715975, -3.344105, 1, 1, 1, 1, 1,
-0.08107818, -1.210803, -3.898216, 1, 1, 1, 1, 1,
-0.08059744, -0.9983549, -2.926595, 1, 1, 1, 1, 1,
-0.07614831, 0.7300748, 0.1559651, 1, 1, 1, 1, 1,
-0.0715351, 0.4121377, -1.345868, 1, 1, 1, 1, 1,
-0.0656085, -1.237989, -2.924044, 1, 1, 1, 1, 1,
-0.06503886, 0.847136, -0.2145025, 0, 0, 1, 1, 1,
-0.06126017, 0.762757, -1.391147, 1, 0, 0, 1, 1,
-0.06055118, -1.781922, -2.035454, 1, 0, 0, 1, 1,
-0.06041192, 0.1499527, -0.7964569, 1, 0, 0, 1, 1,
-0.06039216, 0.4412898, -0.9161571, 1, 0, 0, 1, 1,
-0.05970986, 0.4262715, -0.4547198, 1, 0, 0, 1, 1,
-0.05920477, 1.899042, 1.051205, 0, 0, 0, 1, 1,
-0.05520889, 0.2273092, -1.909732, 0, 0, 0, 1, 1,
-0.05452421, -0.01445198, -1.74035, 0, 0, 0, 1, 1,
-0.05340377, -0.3045787, -2.964944, 0, 0, 0, 1, 1,
-0.05271225, -1.340303, -2.763173, 0, 0, 0, 1, 1,
-0.0519495, -0.5847867, -2.024125, 0, 0, 0, 1, 1,
-0.04671352, 1.125429, -0.7249787, 0, 0, 0, 1, 1,
-0.04418372, -2.045151, -2.784461, 1, 1, 1, 1, 1,
-0.04256333, -0.9188969, -1.968063, 1, 1, 1, 1, 1,
-0.04095479, 0.2319772, 0.07210126, 1, 1, 1, 1, 1,
-0.03888148, 0.2343742, 0.1745097, 1, 1, 1, 1, 1,
-0.03798969, -0.4220318, -3.12633, 1, 1, 1, 1, 1,
-0.03234318, 1.187606, 0.02450895, 1, 1, 1, 1, 1,
-0.03090132, -0.6681572, -3.20669, 1, 1, 1, 1, 1,
-0.02907111, 0.5825214, 1.393581, 1, 1, 1, 1, 1,
-0.02470554, 0.3870456, 1.406859, 1, 1, 1, 1, 1,
-0.0238081, 0.7182598, -0.4139389, 1, 1, 1, 1, 1,
-0.02169647, -2.124582, -4.202884, 1, 1, 1, 1, 1,
-0.01965703, -0.401528, -2.972582, 1, 1, 1, 1, 1,
-0.01939579, 1.321231, -0.2454478, 1, 1, 1, 1, 1,
-0.0176946, 1.393876, -1.053574, 1, 1, 1, 1, 1,
-0.006579563, -0.3798986, -4.35149, 1, 1, 1, 1, 1,
-0.004094736, -0.6606621, -3.574909, 0, 0, 1, 1, 1,
-0.003317521, -0.8318313, -4.38756, 1, 0, 0, 1, 1,
-0.0007385343, -0.4536817, -2.597554, 1, 0, 0, 1, 1,
0.004742932, 0.004100029, 1.573082, 1, 0, 0, 1, 1,
0.009541396, -1.770487, 3.451449, 1, 0, 0, 1, 1,
0.01354206, 1.374945, -0.09789586, 1, 0, 0, 1, 1,
0.0154317, 1.562475, 1.394617, 0, 0, 0, 1, 1,
0.01572712, 0.06415309, 0.5268298, 0, 0, 0, 1, 1,
0.0164425, -1.494704, 4.657255, 0, 0, 0, 1, 1,
0.01823955, 0.5702025, -0.04050648, 0, 0, 0, 1, 1,
0.01963385, -0.5098623, 4.517099, 0, 0, 0, 1, 1,
0.02133704, 1.565949, 1.546929, 0, 0, 0, 1, 1,
0.02252952, -1.083568, 3.302634, 0, 0, 0, 1, 1,
0.02286205, -0.2394247, 1.607743, 1, 1, 1, 1, 1,
0.02309613, -0.02288539, 2.497252, 1, 1, 1, 1, 1,
0.02447994, 0.842164, 1.999243, 1, 1, 1, 1, 1,
0.02816479, 0.6833714, -2.305916, 1, 1, 1, 1, 1,
0.02981471, -0.2130053, 1.74814, 1, 1, 1, 1, 1,
0.03150345, 0.3073057, -0.3571621, 1, 1, 1, 1, 1,
0.03284335, 1.276836, 0.1446093, 1, 1, 1, 1, 1,
0.03291175, 0.2563163, -0.2815296, 1, 1, 1, 1, 1,
0.03421541, -0.03876746, 1.651999, 1, 1, 1, 1, 1,
0.03538986, -0.1289598, 5.268264, 1, 1, 1, 1, 1,
0.03692968, 0.9982674, -1.101805, 1, 1, 1, 1, 1,
0.03770726, 0.7585964, -0.2937358, 1, 1, 1, 1, 1,
0.03910323, 0.09805489, -0.6365709, 1, 1, 1, 1, 1,
0.04386663, 0.9349309, -0.6435668, 1, 1, 1, 1, 1,
0.04428716, -0.03998361, 3.43278, 1, 1, 1, 1, 1,
0.04671341, -1.302242, 2.015488, 0, 0, 1, 1, 1,
0.04742549, -1.470931, 1.929626, 1, 0, 0, 1, 1,
0.05046465, -0.1074294, 3.00564, 1, 0, 0, 1, 1,
0.05187975, 0.3537942, -0.7246297, 1, 0, 0, 1, 1,
0.05538736, 0.4776378, 0.2600231, 1, 0, 0, 1, 1,
0.05672977, -0.4175959, 3.402576, 1, 0, 0, 1, 1,
0.06034961, -1.079628, 2.380746, 0, 0, 0, 1, 1,
0.06905237, -1.138429, 2.44781, 0, 0, 0, 1, 1,
0.07402389, 1.079345, -0.3647487, 0, 0, 0, 1, 1,
0.07429734, -0.2094867, 3.758047, 0, 0, 0, 1, 1,
0.07708547, -0.2064595, 2.074507, 0, 0, 0, 1, 1,
0.07813708, 2.28336, -1.637961, 0, 0, 0, 1, 1,
0.08053955, 0.8941568, -0.5428559, 0, 0, 0, 1, 1,
0.08058072, 0.1133047, -0.737781, 1, 1, 1, 1, 1,
0.0811629, 1.021888, 0.9104103, 1, 1, 1, 1, 1,
0.08558383, -0.7206317, 3.662076, 1, 1, 1, 1, 1,
0.08970039, -0.6368402, 4.47158, 1, 1, 1, 1, 1,
0.09184691, -0.08091649, 1.60527, 1, 1, 1, 1, 1,
0.09377837, -0.4435267, 4.317606, 1, 1, 1, 1, 1,
0.09559188, -3.032371, 3.877252, 1, 1, 1, 1, 1,
0.09844954, -1.462596, 3.695529, 1, 1, 1, 1, 1,
0.1020666, 0.8714602, -1.462043, 1, 1, 1, 1, 1,
0.1034527, -0.8793833, 2.849896, 1, 1, 1, 1, 1,
0.104863, 0.7080548, -1.32993, 1, 1, 1, 1, 1,
0.1099863, -0.009936806, 1.998083, 1, 1, 1, 1, 1,
0.1115463, 1.151661, 0.3634253, 1, 1, 1, 1, 1,
0.1147893, -0.9454406, 2.395402, 1, 1, 1, 1, 1,
0.1176056, -0.509526, 3.218027, 1, 1, 1, 1, 1,
0.1180208, -0.9929152, 3.091399, 0, 0, 1, 1, 1,
0.1202878, -0.07648994, 2.118532, 1, 0, 0, 1, 1,
0.1207218, -0.7727007, 2.614498, 1, 0, 0, 1, 1,
0.1213141, -0.02640174, 0.1578449, 1, 0, 0, 1, 1,
0.1216884, -1.486394, 4.053695, 1, 0, 0, 1, 1,
0.124038, -0.06688891, 2.480572, 1, 0, 0, 1, 1,
0.1247816, -1.67625, 3.373953, 0, 0, 0, 1, 1,
0.1250786, -0.6469308, 4.043837, 0, 0, 0, 1, 1,
0.1288068, -0.3576296, 3.409004, 0, 0, 0, 1, 1,
0.1301449, 0.8915154, -0.125142, 0, 0, 0, 1, 1,
0.1305859, 0.6892738, 0.8646759, 0, 0, 0, 1, 1,
0.1364606, 0.4313658, -0.1155641, 0, 0, 0, 1, 1,
0.1365182, -1.979471, 2.436749, 0, 0, 0, 1, 1,
0.1377613, -0.8635813, 2.586661, 1, 1, 1, 1, 1,
0.1388571, 0.1418692, -0.8945375, 1, 1, 1, 1, 1,
0.139518, -1.23422, 3.479626, 1, 1, 1, 1, 1,
0.1396766, 0.9164493, -0.5001849, 1, 1, 1, 1, 1,
0.1436494, 0.1606402, 1.21047, 1, 1, 1, 1, 1,
0.151946, -0.7218222, 3.233172, 1, 1, 1, 1, 1,
0.1525736, -0.3622466, 2.502604, 1, 1, 1, 1, 1,
0.1531635, -0.8371255, 3.496059, 1, 1, 1, 1, 1,
0.1546466, -1.233087, 2.876443, 1, 1, 1, 1, 1,
0.1551238, 0.08458566, 1.353931, 1, 1, 1, 1, 1,
0.1635967, -1.58767, 3.875596, 1, 1, 1, 1, 1,
0.1656079, -1.432076, 2.461507, 1, 1, 1, 1, 1,
0.1661069, 0.3176646, -1.237422, 1, 1, 1, 1, 1,
0.1690872, 1.255817, -0.2922165, 1, 1, 1, 1, 1,
0.1705486, 2.75437, 0.8199808, 1, 1, 1, 1, 1,
0.1723601, 0.7362827, 0.01282264, 0, 0, 1, 1, 1,
0.1724643, 0.3279663, -0.5884713, 1, 0, 0, 1, 1,
0.1775637, -1.085104, 1.05856, 1, 0, 0, 1, 1,
0.1779488, 2.050148, 0.02243764, 1, 0, 0, 1, 1,
0.1801909, 1.004666, 1.89841, 1, 0, 0, 1, 1,
0.1816669, 0.6260752, 0.4105539, 1, 0, 0, 1, 1,
0.1843376, 0.1632988, -0.07175113, 0, 0, 0, 1, 1,
0.1885025, -0.07895641, 1.451793, 0, 0, 0, 1, 1,
0.1917983, -0.6415437, 4.618803, 0, 0, 0, 1, 1,
0.1921723, -0.9990021, 3.588373, 0, 0, 0, 1, 1,
0.1952786, 0.4764446, 0.03087572, 0, 0, 0, 1, 1,
0.1997427, 0.9818979, 1.479375, 0, 0, 0, 1, 1,
0.2043605, -1.885521, 2.752782, 0, 0, 0, 1, 1,
0.2091644, 0.753343, 1.279413, 1, 1, 1, 1, 1,
0.2116067, 0.3258576, -0.890786, 1, 1, 1, 1, 1,
0.2196549, -0.3105561, -0.3533348, 1, 1, 1, 1, 1,
0.222531, 2.804694, -1.100023, 1, 1, 1, 1, 1,
0.2230594, 0.6565841, 0.2182031, 1, 1, 1, 1, 1,
0.2267673, 0.9588435, -0.1815568, 1, 1, 1, 1, 1,
0.2327722, 0.3291378, -0.5292947, 1, 1, 1, 1, 1,
0.2332678, 0.5814557, 0.5321733, 1, 1, 1, 1, 1,
0.235203, -0.9053421, 3.111532, 1, 1, 1, 1, 1,
0.2352372, 1.147428, 1.077377, 1, 1, 1, 1, 1,
0.2394546, 1.020527, 0.4594631, 1, 1, 1, 1, 1,
0.2416667, -1.721738, 2.561382, 1, 1, 1, 1, 1,
0.2424286, -1.012284, 1.001635, 1, 1, 1, 1, 1,
0.2429686, 0.4392906, 2.498511, 1, 1, 1, 1, 1,
0.2440795, -2.697444, 3.266678, 1, 1, 1, 1, 1,
0.2446531, 0.1514869, 0.2999357, 0, 0, 1, 1, 1,
0.2453481, -1.723785, 4.91703, 1, 0, 0, 1, 1,
0.2476855, 0.8883997, 0.4344189, 1, 0, 0, 1, 1,
0.2479872, 0.5387414, 0.6373846, 1, 0, 0, 1, 1,
0.2483566, -0.07945877, 3.450113, 1, 0, 0, 1, 1,
0.2497047, 0.2665849, 1.426861, 1, 0, 0, 1, 1,
0.2534479, -0.4911695, 3.522181, 0, 0, 0, 1, 1,
0.2594232, -0.9930409, 3.815754, 0, 0, 0, 1, 1,
0.2599017, -0.999127, 2.447643, 0, 0, 0, 1, 1,
0.2654513, 0.7834532, 0.7323158, 0, 0, 0, 1, 1,
0.2660248, -0.1561734, 2.095139, 0, 0, 0, 1, 1,
0.2741645, 0.7483368, 0.7795538, 0, 0, 0, 1, 1,
0.275936, -0.2452942, 2.921885, 0, 0, 0, 1, 1,
0.2782353, -0.3874273, 1.719623, 1, 1, 1, 1, 1,
0.2804755, 1.67848, 1.124428, 1, 1, 1, 1, 1,
0.2824274, 0.4504695, 1.239504, 1, 1, 1, 1, 1,
0.2835753, -0.6957614, 2.225811, 1, 1, 1, 1, 1,
0.2864798, 0.547312, -0.04398407, 1, 1, 1, 1, 1,
0.2870747, 0.3391152, 0.6180596, 1, 1, 1, 1, 1,
0.2871021, -1.464691, 1.599639, 1, 1, 1, 1, 1,
0.2888351, -0.3292361, 2.483658, 1, 1, 1, 1, 1,
0.290401, -0.9851224, 1.323939, 1, 1, 1, 1, 1,
0.2920866, 0.4593174, -0.4619975, 1, 1, 1, 1, 1,
0.293433, 0.03312366, 0.3274544, 1, 1, 1, 1, 1,
0.293923, 0.3033732, -0.1369558, 1, 1, 1, 1, 1,
0.2972129, -0.2454935, 1.919116, 1, 1, 1, 1, 1,
0.2996551, -1.916827, 5.627839, 1, 1, 1, 1, 1,
0.3039247, 1.207452, 0.2337336, 1, 1, 1, 1, 1,
0.3124318, 0.6006095, -0.7785626, 0, 0, 1, 1, 1,
0.3149744, 0.01611997, 1.650504, 1, 0, 0, 1, 1,
0.3163777, -1.082217, 5.477936, 1, 0, 0, 1, 1,
0.3167062, -1.34152, 4.935842, 1, 0, 0, 1, 1,
0.3196472, 0.04078006, 1.276362, 1, 0, 0, 1, 1,
0.3227932, -0.5300565, 2.40762, 1, 0, 0, 1, 1,
0.3274164, -0.2944095, 0.5018669, 0, 0, 0, 1, 1,
0.3276106, 0.9570181, 2.635339, 0, 0, 0, 1, 1,
0.3325526, 1.425822, -1.640713, 0, 0, 0, 1, 1,
0.3330773, -0.7532451, 2.586687, 0, 0, 0, 1, 1,
0.3345121, 0.03105797, 0.9314482, 0, 0, 0, 1, 1,
0.3390343, 0.01329286, 1.830071, 0, 0, 0, 1, 1,
0.342632, 3.206338, 0.05930432, 0, 0, 0, 1, 1,
0.3433714, -0.02378106, 2.650032, 1, 1, 1, 1, 1,
0.3440756, 0.3972312, 2.672135, 1, 1, 1, 1, 1,
0.3442485, 1.299617, 0.6481255, 1, 1, 1, 1, 1,
0.3487329, 0.0783392, 0.6917713, 1, 1, 1, 1, 1,
0.3513938, 0.1837584, 0.2100736, 1, 1, 1, 1, 1,
0.3515331, 0.9191332, 1.300227, 1, 1, 1, 1, 1,
0.360495, -0.5670823, 1.446691, 1, 1, 1, 1, 1,
0.361421, 1.000707, -0.1448383, 1, 1, 1, 1, 1,
0.3616145, -0.6363093, 3.878137, 1, 1, 1, 1, 1,
0.361661, -0.6030751, 1.836401, 1, 1, 1, 1, 1,
0.3687556, 0.5189574, 1.51361, 1, 1, 1, 1, 1,
0.3689145, 2.30697, -0.3962228, 1, 1, 1, 1, 1,
0.3710855, 1.312848, -0.256518, 1, 1, 1, 1, 1,
0.3717182, -1.823896, 3.137595, 1, 1, 1, 1, 1,
0.3719123, -0.5875418, 2.170242, 1, 1, 1, 1, 1,
0.3721205, -0.7018335, 3.420201, 0, 0, 1, 1, 1,
0.3755478, 1.305037, -1.985119, 1, 0, 0, 1, 1,
0.3758416, 3.115119, 0.4197299, 1, 0, 0, 1, 1,
0.3765972, -1.068961, 3.40039, 1, 0, 0, 1, 1,
0.3802922, -0.07732208, 3.140205, 1, 0, 0, 1, 1,
0.3814307, -0.436026, 1.665218, 1, 0, 0, 1, 1,
0.383963, -1.154213, 3.278594, 0, 0, 0, 1, 1,
0.3878659, -1.226076, 4.199725, 0, 0, 0, 1, 1,
0.3901314, -2.370099, 2.056238, 0, 0, 0, 1, 1,
0.3977767, -0.6258959, 2.866225, 0, 0, 0, 1, 1,
0.3987347, -2.502659, 2.400266, 0, 0, 0, 1, 1,
0.4005888, 1.065464, -0.1399112, 0, 0, 0, 1, 1,
0.4017902, -0.1413915, 2.622276, 0, 0, 0, 1, 1,
0.4120663, 1.545557, 0.4554639, 1, 1, 1, 1, 1,
0.4138346, 0.1336787, 1.52372, 1, 1, 1, 1, 1,
0.4140916, -0.530515, 3.363137, 1, 1, 1, 1, 1,
0.4142928, 0.3070728, -0.003577864, 1, 1, 1, 1, 1,
0.4152381, 1.020992, -0.06956081, 1, 1, 1, 1, 1,
0.4164831, -1.18109, 2.015414, 1, 1, 1, 1, 1,
0.4175684, -1.653717, 2.449511, 1, 1, 1, 1, 1,
0.4183892, 0.6073237, 0.7719378, 1, 1, 1, 1, 1,
0.4185081, -0.5654971, 3.79612, 1, 1, 1, 1, 1,
0.4249705, 0.4648458, 0.3606061, 1, 1, 1, 1, 1,
0.428133, 0.4958608, 1.058556, 1, 1, 1, 1, 1,
0.4329331, -0.4052555, 2.612755, 1, 1, 1, 1, 1,
0.4334719, -0.4794059, 1.567456, 1, 1, 1, 1, 1,
0.4339963, -0.267985, 3.224634, 1, 1, 1, 1, 1,
0.4366822, 0.2075735, 1.705353, 1, 1, 1, 1, 1,
0.4439988, 0.05663724, 2.142594, 0, 0, 1, 1, 1,
0.4442491, 0.9832698, 0.3678433, 1, 0, 0, 1, 1,
0.4466056, 0.6909711, 0.807911, 1, 0, 0, 1, 1,
0.4470215, -1.466832, 4.395435, 1, 0, 0, 1, 1,
0.4479572, -0.3486226, 3.186077, 1, 0, 0, 1, 1,
0.4508584, -1.325571, 2.429739, 1, 0, 0, 1, 1,
0.4533188, 0.2317884, 1.849034, 0, 0, 0, 1, 1,
0.4579334, -0.1697262, 2.499708, 0, 0, 0, 1, 1,
0.4642769, 0.3253475, -0.8458905, 0, 0, 0, 1, 1,
0.4648165, 0.1136735, 2.676177, 0, 0, 0, 1, 1,
0.4655936, -2.162854, 2.932231, 0, 0, 0, 1, 1,
0.4667272, -1.057559, 2.957226, 0, 0, 0, 1, 1,
0.467447, -0.6297172, 0.8116615, 0, 0, 0, 1, 1,
0.4692259, -0.3005322, 0.4999207, 1, 1, 1, 1, 1,
0.4699188, 2.397506, 1.637365, 1, 1, 1, 1, 1,
0.4778008, -1.703476, 2.125652, 1, 1, 1, 1, 1,
0.4783252, -0.5987999, 2.01507, 1, 1, 1, 1, 1,
0.4881875, -0.2535632, 2.256655, 1, 1, 1, 1, 1,
0.4962856, -1.102914, 2.978665, 1, 1, 1, 1, 1,
0.4966482, 0.8766326, 1.102231, 1, 1, 1, 1, 1,
0.5009739, -0.9423271, 0.4026995, 1, 1, 1, 1, 1,
0.5026358, 1.060672, -1.483173, 1, 1, 1, 1, 1,
0.5080287, 0.7185516, 1.803965, 1, 1, 1, 1, 1,
0.5081788, -0.4230747, 1.281981, 1, 1, 1, 1, 1,
0.5095135, 0.1746887, 1.025637, 1, 1, 1, 1, 1,
0.5134837, 1.821944, -0.3930342, 1, 1, 1, 1, 1,
0.5174224, 0.967092, 0.8946708, 1, 1, 1, 1, 1,
0.5183287, -2.254847, 3.435297, 1, 1, 1, 1, 1,
0.5190785, 0.3856702, 0.2768715, 0, 0, 1, 1, 1,
0.5226141, -1.139022, 1.683923, 1, 0, 0, 1, 1,
0.5241662, 0.2249629, 0.9510517, 1, 0, 0, 1, 1,
0.5250912, 0.3096573, 1.594416, 1, 0, 0, 1, 1,
0.5311018, 0.6090701, 0.7263901, 1, 0, 0, 1, 1,
0.5328317, 0.3121636, 1.491035, 1, 0, 0, 1, 1,
0.5348274, 0.008656637, -0.5996921, 0, 0, 0, 1, 1,
0.5366097, 0.06216066, 1.5644, 0, 0, 0, 1, 1,
0.5394291, -0.3175905, 1.135791, 0, 0, 0, 1, 1,
0.5400019, 0.7905772, -0.5646759, 0, 0, 0, 1, 1,
0.5407571, 1.133548, 0.1061422, 0, 0, 0, 1, 1,
0.5424722, 0.1222222, 3.402608, 0, 0, 0, 1, 1,
0.5442948, 0.4821495, 0.8137636, 0, 0, 0, 1, 1,
0.5467537, -0.7339042, 3.701213, 1, 1, 1, 1, 1,
0.5480638, -1.357769, 1.420107, 1, 1, 1, 1, 1,
0.5499232, 0.05345972, 0.2501886, 1, 1, 1, 1, 1,
0.5546133, -0.5054504, 3.023877, 1, 1, 1, 1, 1,
0.5554677, -0.09591478, 0.86133, 1, 1, 1, 1, 1,
0.5572336, -0.836085, 2.578595, 1, 1, 1, 1, 1,
0.5627159, 1.394649, 1.77765, 1, 1, 1, 1, 1,
0.5637543, 1.139765, -0.2709633, 1, 1, 1, 1, 1,
0.5638265, -0.3329633, 1.713802, 1, 1, 1, 1, 1,
0.569474, 0.3950289, 1.930295, 1, 1, 1, 1, 1,
0.5742785, -1.871359, 2.436997, 1, 1, 1, 1, 1,
0.5743361, -0.7055026, 4.528104, 1, 1, 1, 1, 1,
0.5751415, -0.9271113, 2.438583, 1, 1, 1, 1, 1,
0.577361, 0.6549127, 1.52072, 1, 1, 1, 1, 1,
0.5801885, -0.01324286, -0.2001654, 1, 1, 1, 1, 1,
0.580624, -0.767487, 1.591482, 0, 0, 1, 1, 1,
0.587213, 0.6002182, 0.6072885, 1, 0, 0, 1, 1,
0.5910855, -0.5978468, 3.644713, 1, 0, 0, 1, 1,
0.5977769, 2.034398, 1.046762, 1, 0, 0, 1, 1,
0.6023743, -0.636406, 3.159796, 1, 0, 0, 1, 1,
0.6069999, -1.500109, 2.848181, 1, 0, 0, 1, 1,
0.6084284, -1.557096, 1.631071, 0, 0, 0, 1, 1,
0.6168703, 1.171454, 1.920088, 0, 0, 0, 1, 1,
0.6280899, -0.02945538, 3.058743, 0, 0, 0, 1, 1,
0.6287224, 0.5497929, 1.118213, 0, 0, 0, 1, 1,
0.6298307, 0.7339714, 0.3226261, 0, 0, 0, 1, 1,
0.6389044, -1.29881, 2.970476, 0, 0, 0, 1, 1,
0.6404234, -0.8200136, 1.24523, 0, 0, 0, 1, 1,
0.641324, 0.4964492, 1.730836, 1, 1, 1, 1, 1,
0.6459479, -0.6026291, 2.898824, 1, 1, 1, 1, 1,
0.6502897, -0.5195654, 0.8320535, 1, 1, 1, 1, 1,
0.6525482, -0.1020528, 2.16418, 1, 1, 1, 1, 1,
0.6551451, 1.408921, 1.247663, 1, 1, 1, 1, 1,
0.6591993, 0.9883159, 1.65739, 1, 1, 1, 1, 1,
0.6680018, -0.5358767, 2.056254, 1, 1, 1, 1, 1,
0.6695096, -1.126684, 2.783026, 1, 1, 1, 1, 1,
0.6704184, -0.320291, 4.62866, 1, 1, 1, 1, 1,
0.6748559, -0.02369983, 1.056891, 1, 1, 1, 1, 1,
0.6753832, 2.686625, 0.8687207, 1, 1, 1, 1, 1,
0.6764989, -1.885547, 3.676817, 1, 1, 1, 1, 1,
0.6790175, 0.08999547, 0.4325056, 1, 1, 1, 1, 1,
0.6813911, -1.413792, 1.305032, 1, 1, 1, 1, 1,
0.6829287, 1.677698, 2.341266, 1, 1, 1, 1, 1,
0.6848147, 2.298177, 0.2740775, 0, 0, 1, 1, 1,
0.6866775, -0.07759149, -0.920846, 1, 0, 0, 1, 1,
0.691197, -0.7222965, 1.638775, 1, 0, 0, 1, 1,
0.691601, 1.316991, 1.017235, 1, 0, 0, 1, 1,
0.6922526, -0.2326593, 0.2650567, 1, 0, 0, 1, 1,
0.6958342, 0.5016459, -0.2604675, 1, 0, 0, 1, 1,
0.6984122, -0.1552987, 1.938317, 0, 0, 0, 1, 1,
0.698863, 0.7686396, 0.8784053, 0, 0, 0, 1, 1,
0.7012814, -1.349862, 2.510375, 0, 0, 0, 1, 1,
0.7078188, -0.7769116, 2.156449, 0, 0, 0, 1, 1,
0.7118563, 2.367611, 0.6226689, 0, 0, 0, 1, 1,
0.7134721, -1.481989, 3.792612, 0, 0, 0, 1, 1,
0.7135564, 0.08753517, 3.223508, 0, 0, 0, 1, 1,
0.7151404, 0.7183678, 1.063354, 1, 1, 1, 1, 1,
0.7152683, -0.654272, 0.8007141, 1, 1, 1, 1, 1,
0.7159025, -1.124055, 0.3729756, 1, 1, 1, 1, 1,
0.7176911, -0.2869138, -0.2277906, 1, 1, 1, 1, 1,
0.7211611, -2.460487, 3.82706, 1, 1, 1, 1, 1,
0.7220398, -0.80369, 2.201564, 1, 1, 1, 1, 1,
0.7244554, -1.076653, 2.829917, 1, 1, 1, 1, 1,
0.7246494, -0.6460213, 3.358258, 1, 1, 1, 1, 1,
0.7256507, 0.8663233, 1.689303, 1, 1, 1, 1, 1,
0.7273844, -1.099715, 1.294859, 1, 1, 1, 1, 1,
0.7275454, -0.01835923, 2.250203, 1, 1, 1, 1, 1,
0.7281266, 1.321198, 3.41699, 1, 1, 1, 1, 1,
0.7304206, 1.121546, 1.483845, 1, 1, 1, 1, 1,
0.7384295, 3.330915, 0.7362137, 1, 1, 1, 1, 1,
0.7440413, 0.3504319, 1.409492, 1, 1, 1, 1, 1,
0.7496864, 0.2070889, 3.140303, 0, 0, 1, 1, 1,
0.7526526, 0.6204338, 1.371607, 1, 0, 0, 1, 1,
0.7562418, -0.0158966, 3.115058, 1, 0, 0, 1, 1,
0.7566639, -0.4755456, 1.604908, 1, 0, 0, 1, 1,
0.7670801, -0.5154892, -0.3568481, 1, 0, 0, 1, 1,
0.773433, -0.09825367, 0.4209915, 1, 0, 0, 1, 1,
0.7746414, -0.106006, 2.46616, 0, 0, 0, 1, 1,
0.7793623, -1.304916, 3.69136, 0, 0, 0, 1, 1,
0.780557, -0.9762485, 2.444282, 0, 0, 0, 1, 1,
0.7805679, 0.6492107, 1.35729, 0, 0, 0, 1, 1,
0.7811859, 1.197471, 0.6926839, 0, 0, 0, 1, 1,
0.7892058, 0.88161, -0.140258, 0, 0, 0, 1, 1,
0.793211, 0.6208232, 2.969404, 0, 0, 0, 1, 1,
0.7951388, 0.7565346, 1.138336, 1, 1, 1, 1, 1,
0.7958944, 1.403733, 1.110921, 1, 1, 1, 1, 1,
0.7985523, -0.9425462, 1.430371, 1, 1, 1, 1, 1,
0.8008627, -1.363433, 2.184799, 1, 1, 1, 1, 1,
0.8046008, -2.110357, 3.208182, 1, 1, 1, 1, 1,
0.80509, 1.013803, 0.02095602, 1, 1, 1, 1, 1,
0.8088455, 0.232657, 0.2906887, 1, 1, 1, 1, 1,
0.8119586, -1.424752, 0.142956, 1, 1, 1, 1, 1,
0.8260958, 0.5689178, -0.1537632, 1, 1, 1, 1, 1,
0.8286191, -0.5792211, 1.580383, 1, 1, 1, 1, 1,
0.8291535, 2.532718, 1.237208, 1, 1, 1, 1, 1,
0.83275, 1.155892, 2.586151, 1, 1, 1, 1, 1,
0.833532, -1.812621, 3.204624, 1, 1, 1, 1, 1,
0.8342413, -1.626612, 3.275523, 1, 1, 1, 1, 1,
0.8412422, 0.1906441, -0.2257698, 1, 1, 1, 1, 1,
0.844982, -2.724416, 2.311363, 0, 0, 1, 1, 1,
0.8493305, -0.5183665, 2.730113, 1, 0, 0, 1, 1,
0.8505924, -0.5963196, 3.311162, 1, 0, 0, 1, 1,
0.8523443, 0.7812211, 0.4495649, 1, 0, 0, 1, 1,
0.8640269, 0.3975245, 1.442904, 1, 0, 0, 1, 1,
0.8667547, -1.230212, 3.076783, 1, 0, 0, 1, 1,
0.8671843, 0.5882794, -0.06731726, 0, 0, 0, 1, 1,
0.8702857, -1.225554, 2.995329, 0, 0, 0, 1, 1,
0.873013, 0.8043377, 2.460889, 0, 0, 0, 1, 1,
0.8737938, -0.09580842, 0.7913312, 0, 0, 0, 1, 1,
0.8738968, -1.767119, 3.375222, 0, 0, 0, 1, 1,
0.8784598, -0.1547972, 1.027686, 0, 0, 0, 1, 1,
0.8849838, 0.9653249, 0.7505206, 0, 0, 0, 1, 1,
0.8875942, 0.3912226, 1.484409, 1, 1, 1, 1, 1,
0.8883668, -1.130816, 3.554727, 1, 1, 1, 1, 1,
0.8910791, -0.9372339, 1.958634, 1, 1, 1, 1, 1,
0.8934064, -0.1783194, 2.974646, 1, 1, 1, 1, 1,
0.8941917, -1.646194, 1.45252, 1, 1, 1, 1, 1,
0.8973166, -0.3062891, 1.419454, 1, 1, 1, 1, 1,
0.8983432, 2.089957, 1.458023, 1, 1, 1, 1, 1,
0.9009772, -0.9001977, 1.963395, 1, 1, 1, 1, 1,
0.9057345, 0.6042101, 0.2392389, 1, 1, 1, 1, 1,
0.9074324, -0.9023651, 1.625943, 1, 1, 1, 1, 1,
0.9086339, 1.055279, -0.9579529, 1, 1, 1, 1, 1,
0.9093491, -0.1412614, 3.956785, 1, 1, 1, 1, 1,
0.9122214, 0.5796471, 1.736061, 1, 1, 1, 1, 1,
0.9142373, 0.01835407, 1.139015, 1, 1, 1, 1, 1,
0.9154031, 1.10531, -0.0004092145, 1, 1, 1, 1, 1,
0.9178266, -0.5213478, 1.696203, 0, 0, 1, 1, 1,
0.9225887, -0.9072573, 1.463603, 1, 0, 0, 1, 1,
0.9231679, 1.111313, -1.324936, 1, 0, 0, 1, 1,
0.9242761, -0.1006214, 1.339946, 1, 0, 0, 1, 1,
0.9253217, 1.676837, 1.330292, 1, 0, 0, 1, 1,
0.9285583, 2.002365, -1.881744, 1, 0, 0, 1, 1,
0.9285629, 0.8251617, 1.031632, 0, 0, 0, 1, 1,
0.9292032, -2.374479, 1.145478, 0, 0, 0, 1, 1,
0.9327806, 0.4501072, 2.290148, 0, 0, 0, 1, 1,
0.9381412, -0.0558156, 1.285689, 0, 0, 0, 1, 1,
0.939524, 0.6825888, 0.595417, 0, 0, 0, 1, 1,
0.9466202, 1.385872, 0.6685869, 0, 0, 0, 1, 1,
0.9478261, 0.9051777, -0.8420217, 0, 0, 0, 1, 1,
0.9502568, 0.6941174, 0.4614982, 1, 1, 1, 1, 1,
0.9508742, -0.1839603, 1.597484, 1, 1, 1, 1, 1,
0.9509979, -0.1365985, 1.535739, 1, 1, 1, 1, 1,
0.9515437, -0.9985379, 1.74521, 1, 1, 1, 1, 1,
0.9569367, 0.8426786, 0.4560268, 1, 1, 1, 1, 1,
0.9593023, 1.129024, -0.9674987, 1, 1, 1, 1, 1,
0.9657252, -0.5839915, 3.810863, 1, 1, 1, 1, 1,
0.9681611, -0.1072364, 1.832173, 1, 1, 1, 1, 1,
0.971326, -2.151059, 1.799831, 1, 1, 1, 1, 1,
0.9749047, 0.1823191, 2.697563, 1, 1, 1, 1, 1,
0.9788549, 0.6133005, 2.438639, 1, 1, 1, 1, 1,
0.9822193, 0.4229119, 1.127959, 1, 1, 1, 1, 1,
0.9863753, -0.1015309, 0.862844, 1, 1, 1, 1, 1,
0.98847, 1.952393, 0.3225393, 1, 1, 1, 1, 1,
0.9888383, -1.349199, 2.708042, 1, 1, 1, 1, 1,
0.9926636, 0.6333554, 1.318152, 0, 0, 1, 1, 1,
1.001469, 0.2339636, 0.8484575, 1, 0, 0, 1, 1,
1.009256, 0.1005166, 2.021147, 1, 0, 0, 1, 1,
1.022611, 0.2580434, -1.043402, 1, 0, 0, 1, 1,
1.028338, -1.172586, 2.598667, 1, 0, 0, 1, 1,
1.03446, -1.280137, 2.35143, 1, 0, 0, 1, 1,
1.035859, -0.3497618, 3.931122, 0, 0, 0, 1, 1,
1.054744, 1.303499, 0.5049953, 0, 0, 0, 1, 1,
1.058342, -1.165076, 4.106354, 0, 0, 0, 1, 1,
1.065084, 0.26987, 1.023063, 0, 0, 0, 1, 1,
1.078329, -0.976266, 2.711094, 0, 0, 0, 1, 1,
1.087185, 2.540888, 0.3429907, 0, 0, 0, 1, 1,
1.091684, -0.6765422, 2.078823, 0, 0, 0, 1, 1,
1.091936, -0.5643626, 1.306213, 1, 1, 1, 1, 1,
1.092856, -1.359046, 2.736809, 1, 1, 1, 1, 1,
1.09514, -0.8205526, 2.681827, 1, 1, 1, 1, 1,
1.096896, 0.03707504, -0.8398315, 1, 1, 1, 1, 1,
1.098867, -0.1451231, 1.397224, 1, 1, 1, 1, 1,
1.114738, -0.2131261, 1.056459, 1, 1, 1, 1, 1,
1.118512, -0.8661944, 1.106278, 1, 1, 1, 1, 1,
1.121108, 0.725633, 0.1851946, 1, 1, 1, 1, 1,
1.127345, 2.064577, 1.348991, 1, 1, 1, 1, 1,
1.127683, 0.05475289, 0.9649501, 1, 1, 1, 1, 1,
1.128609, -0.6206241, 3.246058, 1, 1, 1, 1, 1,
1.135558, 2.240223, -0.3542612, 1, 1, 1, 1, 1,
1.137007, -1.988294, 2.792619, 1, 1, 1, 1, 1,
1.142549, -0.1009197, 1.834986, 1, 1, 1, 1, 1,
1.148279, -0.4851723, 1.088796, 1, 1, 1, 1, 1,
1.149684, -0.1729483, 1.096545, 0, 0, 1, 1, 1,
1.158261, 0.2507787, 1.527052, 1, 0, 0, 1, 1,
1.170269, -0.5116093, 0.08280836, 1, 0, 0, 1, 1,
1.180615, 0.3422376, 1.067483, 1, 0, 0, 1, 1,
1.186728, -0.6487295, 1.51929, 1, 0, 0, 1, 1,
1.195417, -0.2278336, 1.812629, 1, 0, 0, 1, 1,
1.201023, -1.140484, 3.87586, 0, 0, 0, 1, 1,
1.203555, 0.3514909, 0.2564628, 0, 0, 0, 1, 1,
1.206374, -0.3697657, 2.060519, 0, 0, 0, 1, 1,
1.218479, -0.04268095, 1.58641, 0, 0, 0, 1, 1,
1.224896, 1.65948, -0.1103055, 0, 0, 0, 1, 1,
1.231233, -1.080353, 1.3117, 0, 0, 0, 1, 1,
1.243767, -0.5461227, 1.170672, 0, 0, 0, 1, 1,
1.245908, -2.067539, 2.00622, 1, 1, 1, 1, 1,
1.24854, -1.017009, 0.8310462, 1, 1, 1, 1, 1,
1.254256, -1.814566, 2.564162, 1, 1, 1, 1, 1,
1.255315, -1.918159, 1.085737, 1, 1, 1, 1, 1,
1.256609, -0.2386866, 2.329267, 1, 1, 1, 1, 1,
1.257413, 0.8160805, 4.482553, 1, 1, 1, 1, 1,
1.262288, -0.7544131, 2.559798, 1, 1, 1, 1, 1,
1.262904, -1.000679, 1.278917, 1, 1, 1, 1, 1,
1.276508, -0.6952192, 3.444856, 1, 1, 1, 1, 1,
1.276716, -0.4400498, 2.748434, 1, 1, 1, 1, 1,
1.285038, -2.08682, 3.628625, 1, 1, 1, 1, 1,
1.288745, 0.4958265, 0.6800954, 1, 1, 1, 1, 1,
1.292192, 1.647134, 1.996645, 1, 1, 1, 1, 1,
1.303421, 0.9835495, -0.3028562, 1, 1, 1, 1, 1,
1.304265, 0.6940452, 2.346634, 1, 1, 1, 1, 1,
1.310213, -0.6664473, 2.37119, 0, 0, 1, 1, 1,
1.324426, -0.2526902, 1.313472, 1, 0, 0, 1, 1,
1.336285, -0.7771786, 2.219672, 1, 0, 0, 1, 1,
1.349673, 0.2108604, 2.304204, 1, 0, 0, 1, 1,
1.350696, -1.394681, 3.627681, 1, 0, 0, 1, 1,
1.362781, -1.37016, 3.420579, 1, 0, 0, 1, 1,
1.4079, -0.2837191, 2.247844, 0, 0, 0, 1, 1,
1.413353, 0.4471129, 1.058702, 0, 0, 0, 1, 1,
1.41501, -1.4317, 1.524469, 0, 0, 0, 1, 1,
1.424205, -0.7193872, 1.739789, 0, 0, 0, 1, 1,
1.434303, 0.9973198, 1.809127, 0, 0, 0, 1, 1,
1.440313, -2.159004, 1.742669, 0, 0, 0, 1, 1,
1.450759, -1.197026, 1.618575, 0, 0, 0, 1, 1,
1.451431, 0.8170916, -0.1410202, 1, 1, 1, 1, 1,
1.458632, -0.3262511, 1.072533, 1, 1, 1, 1, 1,
1.466185, -0.9005589, 3.904939, 1, 1, 1, 1, 1,
1.466995, 1.213433, 0.5395055, 1, 1, 1, 1, 1,
1.474798, 0.4258285, 0.2324665, 1, 1, 1, 1, 1,
1.485331, -0.3438104, 0.8659216, 1, 1, 1, 1, 1,
1.486098, -0.2818427, 1.294059, 1, 1, 1, 1, 1,
1.502247, 0.3829579, 2.465928, 1, 1, 1, 1, 1,
1.506196, -1.361696, 1.665568, 1, 1, 1, 1, 1,
1.507241, 1.515269, 1.753898, 1, 1, 1, 1, 1,
1.515619, -1.209486, 5.150059, 1, 1, 1, 1, 1,
1.539044, 1.821989, 1.15794, 1, 1, 1, 1, 1,
1.560626, 1.120969, -0.6937276, 1, 1, 1, 1, 1,
1.580084, -0.164452, 2.968352, 1, 1, 1, 1, 1,
1.595719, 0.7836949, -0.6234686, 1, 1, 1, 1, 1,
1.614951, 1.298303, 1.13438, 0, 0, 1, 1, 1,
1.622131, 0.6740813, 1.180754, 1, 0, 0, 1, 1,
1.624296, -0.2026409, 1.328173, 1, 0, 0, 1, 1,
1.63596, -0.8833446, 2.942737, 1, 0, 0, 1, 1,
1.641272, 0.5273572, 1.302115, 1, 0, 0, 1, 1,
1.649733, -0.1864487, 3.05476, 1, 0, 0, 1, 1,
1.670091, 1.683902, 1.697955, 0, 0, 0, 1, 1,
1.702136, 0.1877173, 1.643791, 0, 0, 0, 1, 1,
1.71003, -0.2693697, 1.797407, 0, 0, 0, 1, 1,
1.755635, 1.829672, 0.3300059, 0, 0, 0, 1, 1,
1.764141, -1.178841, 1.311012, 0, 0, 0, 1, 1,
1.766603, 0.9881418, 2.309509, 0, 0, 0, 1, 1,
1.792417, -0.6497346, 1.672446, 0, 0, 0, 1, 1,
1.794957, 0.4723308, 0.1983752, 1, 1, 1, 1, 1,
1.797534, -0.4522445, 3.649342, 1, 1, 1, 1, 1,
1.804186, -0.2926209, 0.1578831, 1, 1, 1, 1, 1,
1.847843, 1.594384, -0.3792144, 1, 1, 1, 1, 1,
1.898609, -0.943182, 2.384937, 1, 1, 1, 1, 1,
1.903196, -1.236544, 2.966862, 1, 1, 1, 1, 1,
1.904112, -0.891174, 2.260907, 1, 1, 1, 1, 1,
1.911206, -0.8328385, 1.990321, 1, 1, 1, 1, 1,
1.941145, 0.9173889, 0.8154343, 1, 1, 1, 1, 1,
1.949227, 0.9631433, 0.3800099, 1, 1, 1, 1, 1,
1.955106, -0.4102891, 3.182192, 1, 1, 1, 1, 1,
1.98012, -0.9081084, 1.515455, 1, 1, 1, 1, 1,
2.015081, 0.7294343, 1.982506, 1, 1, 1, 1, 1,
2.030021, 0.5918831, 1.926775, 1, 1, 1, 1, 1,
2.03627, 0.7538605, 2.76557, 1, 1, 1, 1, 1,
2.130066, -1.199569, 2.126101, 0, 0, 1, 1, 1,
2.175631, 0.2265038, 1.238797, 1, 0, 0, 1, 1,
2.183676, -1.075212, 1.740327, 1, 0, 0, 1, 1,
2.197829, -0.2509157, 1.445596, 1, 0, 0, 1, 1,
2.280124, 0.2309864, 1.040573, 1, 0, 0, 1, 1,
2.283958, 0.01100738, 2.098502, 1, 0, 0, 1, 1,
2.303413, -0.2778907, 1.616063, 0, 0, 0, 1, 1,
2.307929, 0.5123698, 0.03272938, 0, 0, 0, 1, 1,
2.307995, -1.826385, 1.382661, 0, 0, 0, 1, 1,
2.368062, 0.180963, 2.934837, 0, 0, 0, 1, 1,
2.377282, 2.342852, -0.6600857, 0, 0, 0, 1, 1,
2.392196, -0.335154, 2.63237, 0, 0, 0, 1, 1,
2.451009, 0.09719728, 0.9779803, 0, 0, 0, 1, 1,
2.466211, -0.1869355, -0.3313405, 1, 1, 1, 1, 1,
2.46747, 0.02164498, 0.7136247, 1, 1, 1, 1, 1,
2.568082, 0.7216556, 1.834457, 1, 1, 1, 1, 1,
2.585449, -1.625581, 3.00055, 1, 1, 1, 1, 1,
2.612754, -0.2172945, -0.6265979, 1, 1, 1, 1, 1,
3.141461, -0.01102629, 2.915977, 1, 1, 1, 1, 1,
3.527369, -0.8423563, 2.258763, 1, 1, 1, 1, 1
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
var radius = 10.09687;
var distance = 35.46484;
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
mvMatrix.translate( -0.2093563, 0.08957362, 0.1594758 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.46484);
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
