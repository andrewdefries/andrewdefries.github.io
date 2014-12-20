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
-3.478873, -0.9754518, -0.8383077, 1, 0, 0, 1,
-3.374681, -1.438003, -1.367077, 1, 0.007843138, 0, 1,
-3.365173, -1.071322, -2.330579, 1, 0.01176471, 0, 1,
-2.968873, 1.610713, -1.700904, 1, 0.01960784, 0, 1,
-2.862682, 1.032621, -0.6552641, 1, 0.02352941, 0, 1,
-2.669621, 0.245344, -1.608965, 1, 0.03137255, 0, 1,
-2.657502, 0.6098099, -2.167546, 1, 0.03529412, 0, 1,
-2.492088, 1.06907, -1.857692, 1, 0.04313726, 0, 1,
-2.464043, -1.076381, -1.397461, 1, 0.04705882, 0, 1,
-2.436738, 1.459924, -2.970852, 1, 0.05490196, 0, 1,
-2.308378, 0.4244601, -1.202879, 1, 0.05882353, 0, 1,
-2.279303, 0.002920057, -1.028895, 1, 0.06666667, 0, 1,
-2.246111, -0.6882894, -3.555056, 1, 0.07058824, 0, 1,
-2.235097, -0.7544292, -2.928083, 1, 0.07843138, 0, 1,
-2.150093, -0.4163686, -1.284156, 1, 0.08235294, 0, 1,
-2.146546, -0.2874177, -1.944014, 1, 0.09019608, 0, 1,
-2.144974, -1.003329, -2.442545, 1, 0.09411765, 0, 1,
-2.090568, -1.069461, -3.248493, 1, 0.1019608, 0, 1,
-2.057344, -0.505921, -2.099645, 1, 0.1098039, 0, 1,
-1.993337, 0.6573434, -0.9765887, 1, 0.1137255, 0, 1,
-1.977487, -0.6063589, -1.589761, 1, 0.1215686, 0, 1,
-1.958608, -1.894249, -1.284914, 1, 0.1254902, 0, 1,
-1.946443, -1.442481, -1.77937, 1, 0.1333333, 0, 1,
-1.938567, 0.353519, -2.441202, 1, 0.1372549, 0, 1,
-1.891535, -1.066704, -1.575964, 1, 0.145098, 0, 1,
-1.888689, -0.5069103, -2.250662, 1, 0.1490196, 0, 1,
-1.859152, -0.5434469, -1.685029, 1, 0.1568628, 0, 1,
-1.84042, 1.957539, -0.617332, 1, 0.1607843, 0, 1,
-1.82042, -0.6166744, -1.524068, 1, 0.1686275, 0, 1,
-1.795702, 0.4321011, -1.234412, 1, 0.172549, 0, 1,
-1.792782, -0.6976305, -2.887022, 1, 0.1803922, 0, 1,
-1.788993, 1.158996, 0.5004557, 1, 0.1843137, 0, 1,
-1.76285, 1.84246, -0.4791681, 1, 0.1921569, 0, 1,
-1.755672, 1.561236, -0.3926693, 1, 0.1960784, 0, 1,
-1.745914, -0.8107139, -2.596328, 1, 0.2039216, 0, 1,
-1.72357, -0.311962, -1.684839, 1, 0.2117647, 0, 1,
-1.716838, -0.575915, -0.4660979, 1, 0.2156863, 0, 1,
-1.714466, 1.085711, -1.699802, 1, 0.2235294, 0, 1,
-1.700978, -0.8196375, -0.3441563, 1, 0.227451, 0, 1,
-1.692957, 0.0734525, -1.589292, 1, 0.2352941, 0, 1,
-1.65861, -1.080215, -2.600437, 1, 0.2392157, 0, 1,
-1.633541, -0.7355045, -2.153271, 1, 0.2470588, 0, 1,
-1.61339, 0.1042277, -0.5165958, 1, 0.2509804, 0, 1,
-1.612915, 1.658395, -1.303589, 1, 0.2588235, 0, 1,
-1.609835, -0.4678042, -2.494567, 1, 0.2627451, 0, 1,
-1.595711, -1.001725, -3.209646, 1, 0.2705882, 0, 1,
-1.595299, 1.594117, -1.395998, 1, 0.2745098, 0, 1,
-1.586464, -0.9537595, -2.748071, 1, 0.282353, 0, 1,
-1.584978, -0.02414193, -2.684223, 1, 0.2862745, 0, 1,
-1.574238, 0.1749906, -0.2757834, 1, 0.2941177, 0, 1,
-1.571509, -0.445568, -1.927747, 1, 0.3019608, 0, 1,
-1.559577, 1.106817, -0.8172354, 1, 0.3058824, 0, 1,
-1.552314, -0.2217906, -2.994709, 1, 0.3137255, 0, 1,
-1.551823, 0.01384456, -1.48811, 1, 0.3176471, 0, 1,
-1.535105, -0.9866727, -0.7915058, 1, 0.3254902, 0, 1,
-1.526641, -1.055799, -2.339107, 1, 0.3294118, 0, 1,
-1.520246, -0.5721824, -2.185483, 1, 0.3372549, 0, 1,
-1.518318, -0.3846534, -0.6677573, 1, 0.3411765, 0, 1,
-1.512074, -1.119936, -2.094292, 1, 0.3490196, 0, 1,
-1.508735, 1.371826, 0.4781654, 1, 0.3529412, 0, 1,
-1.500536, -1.097809, -2.389502, 1, 0.3607843, 0, 1,
-1.490533, -0.03769555, -0.399737, 1, 0.3647059, 0, 1,
-1.470749, -1.191736, -1.892302, 1, 0.372549, 0, 1,
-1.459792, 1.159973, -0.8599989, 1, 0.3764706, 0, 1,
-1.458536, 0.1642632, 0.8202989, 1, 0.3843137, 0, 1,
-1.448672, 1.217312, 0.1835599, 1, 0.3882353, 0, 1,
-1.44753, 0.05982358, -1.666133, 1, 0.3960784, 0, 1,
-1.430372, 0.1420456, 0.3448207, 1, 0.4039216, 0, 1,
-1.418478, -0.6333539, -1.174738, 1, 0.4078431, 0, 1,
-1.409647, 0.5277341, -1.834244, 1, 0.4156863, 0, 1,
-1.391835, -0.5861195, -2.330858, 1, 0.4196078, 0, 1,
-1.378675, 1.443206, -1.194727, 1, 0.427451, 0, 1,
-1.378663, -0.4144571, -0.169893, 1, 0.4313726, 0, 1,
-1.373802, 0.3748622, -1.667067, 1, 0.4392157, 0, 1,
-1.362961, 0.2031094, -0.9407745, 1, 0.4431373, 0, 1,
-1.356102, -0.710124, -3.590459, 1, 0.4509804, 0, 1,
-1.354343, 1.561266, -0.445169, 1, 0.454902, 0, 1,
-1.34785, 0.9206063, -0.733552, 1, 0.4627451, 0, 1,
-1.346425, 0.2020125, -2.471621, 1, 0.4666667, 0, 1,
-1.311374, -0.6789727, -2.645006, 1, 0.4745098, 0, 1,
-1.311217, 1.454299, -1.014614, 1, 0.4784314, 0, 1,
-1.309211, 0.5887629, -0.9675804, 1, 0.4862745, 0, 1,
-1.304623, 1.874286, -0.5806963, 1, 0.4901961, 0, 1,
-1.294462, -0.6577255, -2.634913, 1, 0.4980392, 0, 1,
-1.293073, -0.3141135, -2.865717, 1, 0.5058824, 0, 1,
-1.284038, 1.047845, -0.6992908, 1, 0.509804, 0, 1,
-1.284038, -0.3512323, -2.242006, 1, 0.5176471, 0, 1,
-1.279936, -0.1413203, -1.049991, 1, 0.5215687, 0, 1,
-1.278514, -1.000774, -1.365395, 1, 0.5294118, 0, 1,
-1.266808, -1.3318, -1.655116, 1, 0.5333334, 0, 1,
-1.246, -0.3002775, -1.767799, 1, 0.5411765, 0, 1,
-1.235616, -1.207548, -1.552753, 1, 0.5450981, 0, 1,
-1.228872, -0.4612556, -2.497716, 1, 0.5529412, 0, 1,
-1.22282, -0.4794843, -0.9173546, 1, 0.5568628, 0, 1,
-1.222362, -0.7462631, -3.134079, 1, 0.5647059, 0, 1,
-1.221372, -2.157694, -4.556916, 1, 0.5686275, 0, 1,
-1.214925, 0.9296847, -0.692041, 1, 0.5764706, 0, 1,
-1.209572, -1.224363, -2.292019, 1, 0.5803922, 0, 1,
-1.209215, -1.618416, -3.421619, 1, 0.5882353, 0, 1,
-1.207451, 0.4734021, -0.7942069, 1, 0.5921569, 0, 1,
-1.200969, 0.2159851, -2.27675, 1, 0.6, 0, 1,
-1.191877, -2.135347, -2.671349, 1, 0.6078432, 0, 1,
-1.176099, -0.3595575, -2.3884, 1, 0.6117647, 0, 1,
-1.166184, 1.986198, 0.04204395, 1, 0.6196079, 0, 1,
-1.162301, -0.7035683, -3.485032, 1, 0.6235294, 0, 1,
-1.159759, 0.6818841, -2.094838, 1, 0.6313726, 0, 1,
-1.153288, -0.9563426, -2.488531, 1, 0.6352941, 0, 1,
-1.149853, 0.3177465, 0.5200919, 1, 0.6431373, 0, 1,
-1.142363, 0.8073782, -0.3358794, 1, 0.6470588, 0, 1,
-1.133459, -0.03169621, -1.256548, 1, 0.654902, 0, 1,
-1.126755, 1.026719, -0.725287, 1, 0.6588235, 0, 1,
-1.117675, 1.127883, -1.22345, 1, 0.6666667, 0, 1,
-1.113217, 0.1536732, -2.202316, 1, 0.6705883, 0, 1,
-1.106284, -1.68143, -2.982397, 1, 0.6784314, 0, 1,
-1.101359, -1.735303, -3.009378, 1, 0.682353, 0, 1,
-1.084032, -0.02101329, -0.6631414, 1, 0.6901961, 0, 1,
-1.079974, -0.4004831, -3.190464, 1, 0.6941177, 0, 1,
-1.076074, 0.5237935, -2.25278, 1, 0.7019608, 0, 1,
-1.07228, 1.197437, 0.3980672, 1, 0.7098039, 0, 1,
-1.059383, -0.3360517, -2.492242, 1, 0.7137255, 0, 1,
-1.059214, 0.01121064, -2.160466, 1, 0.7215686, 0, 1,
-1.048365, 1.018934, -1.738903, 1, 0.7254902, 0, 1,
-1.046905, 0.5022156, -0.3340117, 1, 0.7333333, 0, 1,
-1.046808, 0.0005757846, -0.4075131, 1, 0.7372549, 0, 1,
-1.038347, -1.477703, -3.163366, 1, 0.7450981, 0, 1,
-1.037352, 0.3084564, -2.538835, 1, 0.7490196, 0, 1,
-1.034127, -1.370151, -2.832307, 1, 0.7568628, 0, 1,
-1.030024, -1.367631, -1.814768, 1, 0.7607843, 0, 1,
-1.025479, -2.473417, -1.50235, 1, 0.7686275, 0, 1,
-1.02288, 2.255661, -0.1918321, 1, 0.772549, 0, 1,
-1.010282, -1.057073, -2.314407, 1, 0.7803922, 0, 1,
-1.00637, 0.7437359, -1.623608, 1, 0.7843137, 0, 1,
-1.004404, 0.6786444, -1.942801, 1, 0.7921569, 0, 1,
-1.00211, 1.435382, 0.2373628, 1, 0.7960784, 0, 1,
-0.9947519, 2.073637, 0.07877259, 1, 0.8039216, 0, 1,
-0.9933097, 0.5413553, -1.104878, 1, 0.8117647, 0, 1,
-0.9920137, 0.2622527, -1.984715, 1, 0.8156863, 0, 1,
-0.9771134, 0.1278, -1.064632, 1, 0.8235294, 0, 1,
-0.975605, 0.1611799, 0.2533817, 1, 0.827451, 0, 1,
-0.9721445, 0.6755589, -0.2819216, 1, 0.8352941, 0, 1,
-0.9718482, 0.4886075, -0.2012789, 1, 0.8392157, 0, 1,
-0.9653122, 0.1372234, -1.274832, 1, 0.8470588, 0, 1,
-0.9620036, -1.526515, -0.6085092, 1, 0.8509804, 0, 1,
-0.9566826, -0.05483596, -1.479095, 1, 0.8588235, 0, 1,
-0.9526729, -1.305321, -1.971138, 1, 0.8627451, 0, 1,
-0.9489116, 1.06675, -0.2530209, 1, 0.8705882, 0, 1,
-0.946312, -0.1578536, -0.7828594, 1, 0.8745098, 0, 1,
-0.9445549, 0.5697904, -1.069527, 1, 0.8823529, 0, 1,
-0.9419191, -1.256799, -4.12708, 1, 0.8862745, 0, 1,
-0.9397384, 0.2708066, -1.723464, 1, 0.8941177, 0, 1,
-0.9339153, -0.7007037, -3.609618, 1, 0.8980392, 0, 1,
-0.929783, -0.4708009, -2.097783, 1, 0.9058824, 0, 1,
-0.9171193, 0.405845, -0.1704063, 1, 0.9137255, 0, 1,
-0.916947, 1.782211, 0.5118158, 1, 0.9176471, 0, 1,
-0.9163808, -0.1536065, -3.295949, 1, 0.9254902, 0, 1,
-0.9154936, -1.634278, -0.2933636, 1, 0.9294118, 0, 1,
-0.9145516, 0.3179736, -2.726504, 1, 0.9372549, 0, 1,
-0.9094753, 0.9008293, -3.311301, 1, 0.9411765, 0, 1,
-0.9094273, -0.3500586, -4.271741, 1, 0.9490196, 0, 1,
-0.9048884, -0.09434917, -2.457168, 1, 0.9529412, 0, 1,
-0.9016606, -0.3222951, -2.670757, 1, 0.9607843, 0, 1,
-0.8997851, 1.482655, -0.5995468, 1, 0.9647059, 0, 1,
-0.8798784, 0.5460957, -0.7230853, 1, 0.972549, 0, 1,
-0.8703465, 1.032093, 0.5769035, 1, 0.9764706, 0, 1,
-0.866857, -0.3537589, -1.072022, 1, 0.9843137, 0, 1,
-0.8665569, -0.3133355, -1.855901, 1, 0.9882353, 0, 1,
-0.8591641, 2.91985, -0.2183029, 1, 0.9960784, 0, 1,
-0.8547419, -1.548706, -1.795918, 0.9960784, 1, 0, 1,
-0.8470191, -0.7720453, -3.554071, 0.9921569, 1, 0, 1,
-0.8438666, 1.658117, 1.606634, 0.9843137, 1, 0, 1,
-0.8425021, 1.116453, -1.233868, 0.9803922, 1, 0, 1,
-0.8409957, -0.1627893, 0.0008392922, 0.972549, 1, 0, 1,
-0.839173, -0.3418254, -2.091339, 0.9686275, 1, 0, 1,
-0.8258862, -1.405108, -3.405958, 0.9607843, 1, 0, 1,
-0.8249851, -0.4717247, -1.329276, 0.9568627, 1, 0, 1,
-0.8241873, 1.759369, -0.437144, 0.9490196, 1, 0, 1,
-0.8224567, 0.4183758, -2.112173, 0.945098, 1, 0, 1,
-0.8127727, -0.7352712, -1.46639, 0.9372549, 1, 0, 1,
-0.8048834, -1.882387, -2.623724, 0.9333333, 1, 0, 1,
-0.8011799, 0.7238246, -1.008868, 0.9254902, 1, 0, 1,
-0.7903078, 0.6954336, 0.2985479, 0.9215686, 1, 0, 1,
-0.7892133, 1.015309, -0.1988315, 0.9137255, 1, 0, 1,
-0.7890984, -0.1643156, -2.618437, 0.9098039, 1, 0, 1,
-0.7800699, 0.7556056, -0.5173506, 0.9019608, 1, 0, 1,
-0.7750745, 0.1082981, -1.168343, 0.8941177, 1, 0, 1,
-0.7712331, -0.0876824, -2.854924, 0.8901961, 1, 0, 1,
-0.7711565, 0.9539837, -0.04100398, 0.8823529, 1, 0, 1,
-0.7710069, 0.7433298, -2.650504, 0.8784314, 1, 0, 1,
-0.7694772, 0.1668203, -2.526678, 0.8705882, 1, 0, 1,
-0.7565604, -0.7286887, -2.645447, 0.8666667, 1, 0, 1,
-0.752161, -0.8697091, -2.333511, 0.8588235, 1, 0, 1,
-0.750465, 1.495736, -1.69725, 0.854902, 1, 0, 1,
-0.7410018, -0.549966, -1.359711, 0.8470588, 1, 0, 1,
-0.7408611, -0.2204874, -2.418082, 0.8431373, 1, 0, 1,
-0.7389874, 0.4545805, -0.4486701, 0.8352941, 1, 0, 1,
-0.7282774, 0.7371858, 0.2199647, 0.8313726, 1, 0, 1,
-0.7275633, 0.7480197, 0.9468621, 0.8235294, 1, 0, 1,
-0.7266529, -1.204679, -1.935493, 0.8196079, 1, 0, 1,
-0.7196397, 0.6591787, -1.279162, 0.8117647, 1, 0, 1,
-0.71737, -0.435229, -1.295473, 0.8078431, 1, 0, 1,
-0.7138172, -0.6674373, -3.27529, 0.8, 1, 0, 1,
-0.7115127, 0.5179898, -0.1914065, 0.7921569, 1, 0, 1,
-0.7080373, 1.399826, -0.7496536, 0.7882353, 1, 0, 1,
-0.702627, 1.63628, -0.7194002, 0.7803922, 1, 0, 1,
-0.6980635, -0.6376416, -2.305866, 0.7764706, 1, 0, 1,
-0.696963, 0.0699717, -2.175063, 0.7686275, 1, 0, 1,
-0.6943864, 1.889657, 0.4053948, 0.7647059, 1, 0, 1,
-0.6927506, 0.4923083, -1.798869, 0.7568628, 1, 0, 1,
-0.692491, 0.3882325, -0.8488111, 0.7529412, 1, 0, 1,
-0.689604, 0.05793602, -0.9542863, 0.7450981, 1, 0, 1,
-0.6893221, 1.243902, 0.3892863, 0.7411765, 1, 0, 1,
-0.6888115, 0.5282926, -1.634845, 0.7333333, 1, 0, 1,
-0.687748, 1.768612, -0.6894493, 0.7294118, 1, 0, 1,
-0.6739196, 1.058511, -1.655613, 0.7215686, 1, 0, 1,
-0.6722884, 2.428454, -1.920782, 0.7176471, 1, 0, 1,
-0.6718809, 0.6487384, 0.4361512, 0.7098039, 1, 0, 1,
-0.6685374, -1.041851, -3.373528, 0.7058824, 1, 0, 1,
-0.664099, -0.8450872, -1.910893, 0.6980392, 1, 0, 1,
-0.6637552, -0.6802487, -2.177434, 0.6901961, 1, 0, 1,
-0.6628793, 0.3914302, -2.105663, 0.6862745, 1, 0, 1,
-0.6606043, -0.2630793, -2.856081, 0.6784314, 1, 0, 1,
-0.6533438, -0.6122752, -1.073108, 0.6745098, 1, 0, 1,
-0.6510161, -0.3474874, -3.181462, 0.6666667, 1, 0, 1,
-0.6470027, 0.4560663, -1.462861, 0.6627451, 1, 0, 1,
-0.6438277, -0.7240152, -1.474452, 0.654902, 1, 0, 1,
-0.640172, 0.8032008, -1.310005, 0.6509804, 1, 0, 1,
-0.6388925, 0.2211406, -1.416221, 0.6431373, 1, 0, 1,
-0.6378298, -0.9522061, -3.100632, 0.6392157, 1, 0, 1,
-0.6357186, 1.317428, -0.6773506, 0.6313726, 1, 0, 1,
-0.6321872, -0.3746574, -1.535003, 0.627451, 1, 0, 1,
-0.6267421, -0.2969739, 0.4221914, 0.6196079, 1, 0, 1,
-0.624198, 0.3643735, -1.69874, 0.6156863, 1, 0, 1,
-0.6156685, 1.697928, -1.838269, 0.6078432, 1, 0, 1,
-0.6146575, -0.3520257, -2.286668, 0.6039216, 1, 0, 1,
-0.6103013, 1.248904, -2.187469, 0.5960785, 1, 0, 1,
-0.6099747, -0.9962278, -3.035906, 0.5882353, 1, 0, 1,
-0.6096892, -0.4470041, -0.5948707, 0.5843138, 1, 0, 1,
-0.5958544, -1.229216, -3.706131, 0.5764706, 1, 0, 1,
-0.5942367, -0.4670343, -3.409547, 0.572549, 1, 0, 1,
-0.5903671, 0.2065276, -0.6462519, 0.5647059, 1, 0, 1,
-0.5893487, 0.7921919, -0.002697752, 0.5607843, 1, 0, 1,
-0.5794781, 0.8394838, -0.1989077, 0.5529412, 1, 0, 1,
-0.5741054, 0.2579853, 1.994928, 0.5490196, 1, 0, 1,
-0.5731773, 0.8970031, -0.1924132, 0.5411765, 1, 0, 1,
-0.5670375, -0.4044831, -2.976274, 0.5372549, 1, 0, 1,
-0.5661782, -0.06332397, -1.775757, 0.5294118, 1, 0, 1,
-0.5652146, -0.2948153, -2.791246, 0.5254902, 1, 0, 1,
-0.5635097, -0.9329342, -4.787658, 0.5176471, 1, 0, 1,
-0.5581148, -0.1822238, -1.793571, 0.5137255, 1, 0, 1,
-0.5568802, 1.330263, 0.5901764, 0.5058824, 1, 0, 1,
-0.5558768, -0.9528923, -1.923965, 0.5019608, 1, 0, 1,
-0.5510508, -1.493435, -2.420416, 0.4941176, 1, 0, 1,
-0.5482679, 0.4293932, -2.025467, 0.4862745, 1, 0, 1,
-0.5472845, 0.1716094, -2.287634, 0.4823529, 1, 0, 1,
-0.5435951, -0.1626455, -1.048454, 0.4745098, 1, 0, 1,
-0.5433168, 1.523995, -0.138893, 0.4705882, 1, 0, 1,
-0.5422652, -1.246454, -3.089361, 0.4627451, 1, 0, 1,
-0.5374233, 1.511734, -0.1009028, 0.4588235, 1, 0, 1,
-0.536541, 2.066393, -1.499474, 0.4509804, 1, 0, 1,
-0.5349329, -1.076129, -1.254917, 0.4470588, 1, 0, 1,
-0.5293548, 0.1307637, -1.922295, 0.4392157, 1, 0, 1,
-0.5288703, 0.04728634, -1.418209, 0.4352941, 1, 0, 1,
-0.5282493, 0.07580701, -1.570891, 0.427451, 1, 0, 1,
-0.5232445, 0.2640661, 0.06612036, 0.4235294, 1, 0, 1,
-0.5195876, -0.5955518, -0.7981924, 0.4156863, 1, 0, 1,
-0.5195797, -1.649565, -2.537904, 0.4117647, 1, 0, 1,
-0.5167955, -1.861251, -4.915781, 0.4039216, 1, 0, 1,
-0.5125477, 0.3677576, -0.4420893, 0.3960784, 1, 0, 1,
-0.5119719, 0.5241414, -1.236221, 0.3921569, 1, 0, 1,
-0.5081437, 1.316224, -0.9059797, 0.3843137, 1, 0, 1,
-0.5073134, -0.06911056, -1.660653, 0.3803922, 1, 0, 1,
-0.5034353, 0.5207538, -2.288573, 0.372549, 1, 0, 1,
-0.5015488, -0.2222317, -1.109248, 0.3686275, 1, 0, 1,
-0.4979592, -0.3973189, -1.348166, 0.3607843, 1, 0, 1,
-0.4914071, 0.9893437, -1.542081, 0.3568628, 1, 0, 1,
-0.4896206, -0.727358, -4.00265, 0.3490196, 1, 0, 1,
-0.487034, -1.212794, -2.424217, 0.345098, 1, 0, 1,
-0.4860704, -1.208454, 0.1248842, 0.3372549, 1, 0, 1,
-0.4835939, 1.769551, -0.7751859, 0.3333333, 1, 0, 1,
-0.4818549, -0.622181, -1.958316, 0.3254902, 1, 0, 1,
-0.481838, -1.463181, -3.719218, 0.3215686, 1, 0, 1,
-0.480228, 1.429944, -0.3284054, 0.3137255, 1, 0, 1,
-0.4752441, 0.02399489, -1.83019, 0.3098039, 1, 0, 1,
-0.4745353, 0.518479, -1.040984, 0.3019608, 1, 0, 1,
-0.4739464, -0.1909073, -2.312072, 0.2941177, 1, 0, 1,
-0.4710661, -0.6261222, -3.071062, 0.2901961, 1, 0, 1,
-0.4685182, -0.2696049, -1.629421, 0.282353, 1, 0, 1,
-0.4679942, 1.335921, -0.978367, 0.2784314, 1, 0, 1,
-0.4607761, 0.08620404, -2.434281, 0.2705882, 1, 0, 1,
-0.453726, -0.5343068, -2.568148, 0.2666667, 1, 0, 1,
-0.4481172, 2.646708, 0.7594007, 0.2588235, 1, 0, 1,
-0.4478487, 0.4493286, -1.077585, 0.254902, 1, 0, 1,
-0.4466983, 0.7681215, 0.7924624, 0.2470588, 1, 0, 1,
-0.4466843, 0.1673039, -0.7900293, 0.2431373, 1, 0, 1,
-0.4361905, 0.714677, -1.687683, 0.2352941, 1, 0, 1,
-0.4347766, 0.6114827, -0.972446, 0.2313726, 1, 0, 1,
-0.4312654, 0.7150894, -1.664387, 0.2235294, 1, 0, 1,
-0.4291958, 1.042303, -0.5034581, 0.2196078, 1, 0, 1,
-0.4291484, 2.890055, -0.5512058, 0.2117647, 1, 0, 1,
-0.4274853, -0.2067504, -1.463627, 0.2078431, 1, 0, 1,
-0.4246036, 0.7367955, 0.2156141, 0.2, 1, 0, 1,
-0.4241578, -0.5124674, -4.099871, 0.1921569, 1, 0, 1,
-0.4206354, 0.07448804, -0.6816134, 0.1882353, 1, 0, 1,
-0.4184675, -2.399494, -3.794474, 0.1803922, 1, 0, 1,
-0.4168863, 1.321175, -1.240643, 0.1764706, 1, 0, 1,
-0.415468, 0.4049386, -1.06748, 0.1686275, 1, 0, 1,
-0.4057119, 1.282741, -0.2276203, 0.1647059, 1, 0, 1,
-0.4009004, 0.8730856, -0.4361672, 0.1568628, 1, 0, 1,
-0.4002618, -0.08717398, -1.818158, 0.1529412, 1, 0, 1,
-0.3985021, 0.1904317, -0.8436427, 0.145098, 1, 0, 1,
-0.392461, -0.3844275, -3.645025, 0.1411765, 1, 0, 1,
-0.3875724, 1.29915, 0.7458159, 0.1333333, 1, 0, 1,
-0.383705, -1.358709, -2.825991, 0.1294118, 1, 0, 1,
-0.3809302, -0.4314837, -1.46473, 0.1215686, 1, 0, 1,
-0.3773068, -0.3687979, -5.23087, 0.1176471, 1, 0, 1,
-0.3768242, -0.7371472, -2.071718, 0.1098039, 1, 0, 1,
-0.3737466, 1.992949, -0.791017, 0.1058824, 1, 0, 1,
-0.3689041, 2.290379, 0.1387971, 0.09803922, 1, 0, 1,
-0.3655367, -0.1846354, -1.927832, 0.09019608, 1, 0, 1,
-0.3655234, 0.5448592, -0.8506753, 0.08627451, 1, 0, 1,
-0.3632925, 1.345974, 0.2354014, 0.07843138, 1, 0, 1,
-0.3624773, -0.382503, -3.735599, 0.07450981, 1, 0, 1,
-0.3574088, -0.7333189, -1.514092, 0.06666667, 1, 0, 1,
-0.3559518, -1.59642, -2.294461, 0.0627451, 1, 0, 1,
-0.3534907, 0.5336362, -2.131901, 0.05490196, 1, 0, 1,
-0.3479665, 1.232995, -1.381406, 0.05098039, 1, 0, 1,
-0.3459589, -1.648716, -1.430591, 0.04313726, 1, 0, 1,
-0.3458934, 0.2051002, -1.441504, 0.03921569, 1, 0, 1,
-0.3454769, 0.7020495, -0.9182985, 0.03137255, 1, 0, 1,
-0.3438217, -1.042584, -2.156034, 0.02745098, 1, 0, 1,
-0.3396721, -0.6753191, -3.906581, 0.01960784, 1, 0, 1,
-0.3374003, 0.1273748, -1.168391, 0.01568628, 1, 0, 1,
-0.3371871, 0.2348112, 0.7075518, 0.007843138, 1, 0, 1,
-0.3331555, 1.209018, -1.401447, 0.003921569, 1, 0, 1,
-0.3227931, -0.2621342, -2.450476, 0, 1, 0.003921569, 1,
-0.318108, -0.5977963, -4.003836, 0, 1, 0.01176471, 1,
-0.3162867, -2.157975, -3.90587, 0, 1, 0.01568628, 1,
-0.3160236, 0.2886558, -1.057161, 0, 1, 0.02352941, 1,
-0.3134615, -0.9700615, -3.473997, 0, 1, 0.02745098, 1,
-0.3058779, -0.1785881, -1.796621, 0, 1, 0.03529412, 1,
-0.3035882, -1.054669, -0.7857834, 0, 1, 0.03921569, 1,
-0.2965508, 0.5122728, -1.260237, 0, 1, 0.04705882, 1,
-0.2953837, 0.6795252, 0.6616108, 0, 1, 0.05098039, 1,
-0.2926227, -1.61371, -2.299057, 0, 1, 0.05882353, 1,
-0.2918036, -0.2676429, -1.826384, 0, 1, 0.0627451, 1,
-0.2890507, 1.111048, 0.1520754, 0, 1, 0.07058824, 1,
-0.2813686, 0.4531101, -0.4476943, 0, 1, 0.07450981, 1,
-0.2795675, 0.2173136, 0.1288746, 0, 1, 0.08235294, 1,
-0.2792538, 0.9037814, 0.03789217, 0, 1, 0.08627451, 1,
-0.2775235, -1.29873, -3.374623, 0, 1, 0.09411765, 1,
-0.2762468, 0.4503167, -0.006660541, 0, 1, 0.1019608, 1,
-0.2688439, 0.7484506, -0.5245724, 0, 1, 0.1058824, 1,
-0.2686497, 0.05789218, 0.06833288, 0, 1, 0.1137255, 1,
-0.2674389, 0.8619877, 0.04197986, 0, 1, 0.1176471, 1,
-0.2673479, 2.667542, 0.3704105, 0, 1, 0.1254902, 1,
-0.2604096, 1.002894, -1.007285, 0, 1, 0.1294118, 1,
-0.2580493, -0.503508, -4.12123, 0, 1, 0.1372549, 1,
-0.2564284, 0.7253263, -0.1175039, 0, 1, 0.1411765, 1,
-0.2552467, 0.8261686, 0.2326329, 0, 1, 0.1490196, 1,
-0.2521112, 0.05894029, -2.238056, 0, 1, 0.1529412, 1,
-0.2512575, 0.6986646, 0.05285483, 0, 1, 0.1607843, 1,
-0.2510201, -0.1130012, -1.319285, 0, 1, 0.1647059, 1,
-0.2502064, 0.4130202, -0.2570842, 0, 1, 0.172549, 1,
-0.2454032, 0.1568057, -0.05788086, 0, 1, 0.1764706, 1,
-0.2441487, -1.062772, -2.943334, 0, 1, 0.1843137, 1,
-0.2420351, 0.3252414, -0.7243838, 0, 1, 0.1882353, 1,
-0.2409902, -0.759062, -2.528414, 0, 1, 0.1960784, 1,
-0.2383966, -1.034516, -2.068626, 0, 1, 0.2039216, 1,
-0.2383834, 1.238149, -0.5608296, 0, 1, 0.2078431, 1,
-0.237342, -0.8199841, -2.95444, 0, 1, 0.2156863, 1,
-0.2328613, 0.9323021, -1.147543, 0, 1, 0.2196078, 1,
-0.2238775, 0.7783632, -0.6218409, 0, 1, 0.227451, 1,
-0.2169968, -0.01064159, -1.886223, 0, 1, 0.2313726, 1,
-0.2166006, -0.4144861, -2.936741, 0, 1, 0.2392157, 1,
-0.2134041, -0.005650308, -1.613583, 0, 1, 0.2431373, 1,
-0.2132046, -1.14904, -3.603202, 0, 1, 0.2509804, 1,
-0.2129897, -0.4369809, -2.032856, 0, 1, 0.254902, 1,
-0.2111685, 1.981233, -0.0791873, 0, 1, 0.2627451, 1,
-0.2108081, -1.913036, -3.053567, 0, 1, 0.2666667, 1,
-0.2105661, 0.8790646, 0.6960511, 0, 1, 0.2745098, 1,
-0.2039376, -0.4501743, -2.439674, 0, 1, 0.2784314, 1,
-0.2025393, -0.492814, -4.26476, 0, 1, 0.2862745, 1,
-0.2019834, 0.472385, -0.270389, 0, 1, 0.2901961, 1,
-0.2018947, -0.9300129, -1.601623, 0, 1, 0.2980392, 1,
-0.2009159, -1.878487, -2.305999, 0, 1, 0.3058824, 1,
-0.1997136, 0.4098649, -1.806739, 0, 1, 0.3098039, 1,
-0.198323, 1.678483, 0.1563956, 0, 1, 0.3176471, 1,
-0.1976829, -0.1899191, -1.978128, 0, 1, 0.3215686, 1,
-0.1967416, 0.8902015, -0.5188257, 0, 1, 0.3294118, 1,
-0.195286, 1.181041, 0.04539829, 0, 1, 0.3333333, 1,
-0.1923702, -0.7546356, -0.6962492, 0, 1, 0.3411765, 1,
-0.1912555, -1.656861, -4.252905, 0, 1, 0.345098, 1,
-0.1911013, 0.2351165, -1.738104, 0, 1, 0.3529412, 1,
-0.1906313, 2.561873, -0.4905652, 0, 1, 0.3568628, 1,
-0.1891886, -1.555046, -5.076246, 0, 1, 0.3647059, 1,
-0.1887835, -0.3834993, -2.298256, 0, 1, 0.3686275, 1,
-0.1847146, 0.09053904, -0.1919735, 0, 1, 0.3764706, 1,
-0.1834302, 0.0135253, 0.8683469, 0, 1, 0.3803922, 1,
-0.1793542, -0.7363369, -1.842956, 0, 1, 0.3882353, 1,
-0.1735981, -0.96495, -2.05601, 0, 1, 0.3921569, 1,
-0.16998, -1.634556, -2.209938, 0, 1, 0.4, 1,
-0.1681755, -0.2894464, -4.657224, 0, 1, 0.4078431, 1,
-0.1657532, -1.184823, -3.013518, 0, 1, 0.4117647, 1,
-0.1626087, -0.4104077, -3.204807, 0, 1, 0.4196078, 1,
-0.1545536, -0.399481, -1.7062, 0, 1, 0.4235294, 1,
-0.151571, 0.7184198, 0.03535165, 0, 1, 0.4313726, 1,
-0.1497941, 0.2301309, -0.6728697, 0, 1, 0.4352941, 1,
-0.1496223, 1.451354, -0.6413761, 0, 1, 0.4431373, 1,
-0.1407299, -0.08581517, -0.770125, 0, 1, 0.4470588, 1,
-0.1348179, -0.9411703, -3.148225, 0, 1, 0.454902, 1,
-0.1347359, -0.5849019, -4.483408, 0, 1, 0.4588235, 1,
-0.1346933, 1.556806, -0.1374401, 0, 1, 0.4666667, 1,
-0.13329, -0.3991836, -1.738467, 0, 1, 0.4705882, 1,
-0.1319749, -1.572571, -2.614743, 0, 1, 0.4784314, 1,
-0.12562, -0.1971582, -2.76488, 0, 1, 0.4823529, 1,
-0.1248364, 0.9646536, -0.2741364, 0, 1, 0.4901961, 1,
-0.1166537, -0.9150748, -3.582023, 0, 1, 0.4941176, 1,
-0.1153311, -0.64073, -5.485574, 0, 1, 0.5019608, 1,
-0.1115364, 0.1860071, -1.806779, 0, 1, 0.509804, 1,
-0.1114569, 0.06474051, -0.8541703, 0, 1, 0.5137255, 1,
-0.1111543, 0.9904973, 1.470975, 0, 1, 0.5215687, 1,
-0.1107954, 0.07514855, -0.8768803, 0, 1, 0.5254902, 1,
-0.108859, -0.6793663, -1.939841, 0, 1, 0.5333334, 1,
-0.1079128, 0.7127771, -0.1105561, 0, 1, 0.5372549, 1,
-0.1063197, 0.7317473, 0.4293317, 0, 1, 0.5450981, 1,
-0.1015988, -0.6474575, -2.014565, 0, 1, 0.5490196, 1,
-0.1002666, 0.4638115, -0.1300946, 0, 1, 0.5568628, 1,
-0.09939449, -1.324497, -2.519447, 0, 1, 0.5607843, 1,
-0.09611451, -1.518664, -3.656587, 0, 1, 0.5686275, 1,
-0.09529521, -1.086762, -2.345064, 0, 1, 0.572549, 1,
-0.09357108, 0.09461755, -0.05485328, 0, 1, 0.5803922, 1,
-0.09336096, -0.0272033, -1.936107, 0, 1, 0.5843138, 1,
-0.09152657, -1.781522, -2.328007, 0, 1, 0.5921569, 1,
-0.08840196, -0.1553048, -2.661133, 0, 1, 0.5960785, 1,
-0.08658138, -1.421275, -3.590593, 0, 1, 0.6039216, 1,
-0.0841755, 0.5019413, 0.2862489, 0, 1, 0.6117647, 1,
-0.07959726, 0.1443632, -0.8500659, 0, 1, 0.6156863, 1,
-0.07808767, 1.339475, 0.5584633, 0, 1, 0.6235294, 1,
-0.07327002, 0.847995, -0.4558369, 0, 1, 0.627451, 1,
-0.07303896, 1.581996, -0.278983, 0, 1, 0.6352941, 1,
-0.07215927, 2.172406, 1.452832, 0, 1, 0.6392157, 1,
-0.06913509, 0.4449252, -0.8625314, 0, 1, 0.6470588, 1,
-0.06844837, 0.5157058, 0.004225775, 0, 1, 0.6509804, 1,
-0.05963644, 0.8578629, 1.8486, 0, 1, 0.6588235, 1,
-0.05818331, 0.4992342, 0.2756735, 0, 1, 0.6627451, 1,
-0.05045176, -1.000002, -3.17243, 0, 1, 0.6705883, 1,
-0.04758265, -0.1369643, -2.476174, 0, 1, 0.6745098, 1,
-0.04446185, -0.6421713, -2.080642, 0, 1, 0.682353, 1,
-0.04309564, -0.3819011, -6.444954, 0, 1, 0.6862745, 1,
-0.04298529, -1.318048, -3.305826, 0, 1, 0.6941177, 1,
-0.04188244, -0.5856826, -1.961402, 0, 1, 0.7019608, 1,
-0.0405235, -0.2896568, -2.852509, 0, 1, 0.7058824, 1,
-0.0395029, 1.03102, -0.7132838, 0, 1, 0.7137255, 1,
-0.03289044, 1.078901, 0.962983, 0, 1, 0.7176471, 1,
-0.02795783, -0.4254119, -2.230228, 0, 1, 0.7254902, 1,
-0.02586826, 0.2089432, -1.343752, 0, 1, 0.7294118, 1,
-0.02535163, 0.3952399, -1.103499, 0, 1, 0.7372549, 1,
-0.02092307, 0.1079645, -2.013934, 0, 1, 0.7411765, 1,
-0.01834955, 0.2116448, -0.9206193, 0, 1, 0.7490196, 1,
-0.01507943, -0.5039226, -3.713175, 0, 1, 0.7529412, 1,
-0.01047897, -0.470391, -4.245203, 0, 1, 0.7607843, 1,
-0.01008734, 1.799057, 0.4319451, 0, 1, 0.7647059, 1,
-0.003341281, 0.2697033, -0.8511661, 0, 1, 0.772549, 1,
-0.002786553, 0.7239776, 0.4379816, 0, 1, 0.7764706, 1,
-0.002318275, 0.9192678, -1.029346, 0, 1, 0.7843137, 1,
0.005931188, -0.190704, 3.633766, 0, 1, 0.7882353, 1,
0.008150558, -0.2256231, 1.187394, 0, 1, 0.7960784, 1,
0.00888057, -0.2935311, 4.089339, 0, 1, 0.8039216, 1,
0.009070122, -0.7184088, 2.266527, 0, 1, 0.8078431, 1,
0.01392676, 0.2023894, 1.498912, 0, 1, 0.8156863, 1,
0.01645563, 0.4587587, 1.097445, 0, 1, 0.8196079, 1,
0.01834438, 1.305759, -1.070308, 0, 1, 0.827451, 1,
0.01897738, 0.7023132, 0.5019029, 0, 1, 0.8313726, 1,
0.02081653, 1.874822, 2.600628, 0, 1, 0.8392157, 1,
0.0220576, -0.1068294, 3.754158, 0, 1, 0.8431373, 1,
0.02426108, 0.1064528, 0.9902057, 0, 1, 0.8509804, 1,
0.0270543, -1.015017, 2.800771, 0, 1, 0.854902, 1,
0.03009932, -0.4583952, 4.583091, 0, 1, 0.8627451, 1,
0.03388401, 1.10563, -0.2534685, 0, 1, 0.8666667, 1,
0.0360533, -0.1511919, 2.315342, 0, 1, 0.8745098, 1,
0.03619006, 0.3536102, 0.5521712, 0, 1, 0.8784314, 1,
0.03919525, -0.5375648, 2.484707, 0, 1, 0.8862745, 1,
0.04244733, -2.459177, 4.151669, 0, 1, 0.8901961, 1,
0.0426391, -0.1267318, 0.7965212, 0, 1, 0.8980392, 1,
0.04451878, 1.44104, 1.468023, 0, 1, 0.9058824, 1,
0.05146662, -0.2157785, 4.077864, 0, 1, 0.9098039, 1,
0.05445533, 0.45689, -0.3228001, 0, 1, 0.9176471, 1,
0.05482714, -1.403888, 2.277526, 0, 1, 0.9215686, 1,
0.05878906, 1.617688, 1.081691, 0, 1, 0.9294118, 1,
0.06090216, 0.6719588, 0.262553, 0, 1, 0.9333333, 1,
0.06454721, 0.3709099, -0.4388534, 0, 1, 0.9411765, 1,
0.06479177, 0.1321206, 2.574557, 0, 1, 0.945098, 1,
0.06897319, 0.6241472, 0.4181708, 0, 1, 0.9529412, 1,
0.07042027, -1.101908, 3.846666, 0, 1, 0.9568627, 1,
0.07054847, 0.3930579, -1.620423, 0, 1, 0.9647059, 1,
0.07406885, 0.3845577, -1.311791, 0, 1, 0.9686275, 1,
0.07497481, -0.02758988, 0.4242171, 0, 1, 0.9764706, 1,
0.07517723, 0.3343296, -1.182115, 0, 1, 0.9803922, 1,
0.08014516, -1.865189, 3.447015, 0, 1, 0.9882353, 1,
0.08446072, 0.1400185, 0.7152272, 0, 1, 0.9921569, 1,
0.08508535, 0.561308, -0.2859026, 0, 1, 1, 1,
0.0861363, 0.01279171, 0.6279527, 0, 0.9921569, 1, 1,
0.08615076, 2.05685, -1.104586, 0, 0.9882353, 1, 1,
0.08738663, -1.589028, 3.782244, 0, 0.9803922, 1, 1,
0.08799698, -0.4149397, 4.044465, 0, 0.9764706, 1, 1,
0.09156115, -0.2490296, 3.944632, 0, 0.9686275, 1, 1,
0.09371144, -0.3235123, 3.132764, 0, 0.9647059, 1, 1,
0.09392094, -2.00608, 2.251597, 0, 0.9568627, 1, 1,
0.09530207, 1.250291, -0.6750914, 0, 0.9529412, 1, 1,
0.09629635, -0.5712578, 3.323764, 0, 0.945098, 1, 1,
0.09960286, 1.68215, -0.2784663, 0, 0.9411765, 1, 1,
0.1019001, 0.2734698, 2.761239, 0, 0.9333333, 1, 1,
0.1036278, 0.01444703, 0.7157431, 0, 0.9294118, 1, 1,
0.1040966, -0.3412828, 2.301176, 0, 0.9215686, 1, 1,
0.1085156, -0.1958452, 2.732596, 0, 0.9176471, 1, 1,
0.1099141, -0.7582574, 4.035968, 0, 0.9098039, 1, 1,
0.1142297, 0.3109503, -1.515411, 0, 0.9058824, 1, 1,
0.1158551, 0.6545734, 2.522463, 0, 0.8980392, 1, 1,
0.1204566, -0.07936125, 1.272086, 0, 0.8901961, 1, 1,
0.1249774, 0.7923729, -1.675035, 0, 0.8862745, 1, 1,
0.1294483, -0.05363475, 0.2858793, 0, 0.8784314, 1, 1,
0.1327282, -0.6493031, 2.579973, 0, 0.8745098, 1, 1,
0.13387, -0.5598186, 3.616214, 0, 0.8666667, 1, 1,
0.1345049, -1.566019, 3.72897, 0, 0.8627451, 1, 1,
0.1347135, -0.5012631, 2.456795, 0, 0.854902, 1, 1,
0.1348947, 2.887631, -0.1117222, 0, 0.8509804, 1, 1,
0.1374745, -0.4989388, 2.959493, 0, 0.8431373, 1, 1,
0.1411194, 0.1598675, 0.7691032, 0, 0.8392157, 1, 1,
0.1419665, 0.2700255, 0.8166649, 0, 0.8313726, 1, 1,
0.1460997, -0.2296749, 5.092374, 0, 0.827451, 1, 1,
0.1461849, 0.5348229, -0.02605293, 0, 0.8196079, 1, 1,
0.1527832, 0.4456896, 0.8048552, 0, 0.8156863, 1, 1,
0.154954, -0.001975791, 1.656555, 0, 0.8078431, 1, 1,
0.159986, -2.13454, 3.817707, 0, 0.8039216, 1, 1,
0.1616153, 1.541545, -0.9127913, 0, 0.7960784, 1, 1,
0.1616632, -1.492714, 2.298436, 0, 0.7882353, 1, 1,
0.1623412, -0.2304879, 3.594911, 0, 0.7843137, 1, 1,
0.1663001, 0.2424289, 0.05785396, 0, 0.7764706, 1, 1,
0.1674298, 0.7597651, 1.671621, 0, 0.772549, 1, 1,
0.1677756, 0.7525481, -1.526161, 0, 0.7647059, 1, 1,
0.1680196, -0.2255457, 0.5591743, 0, 0.7607843, 1, 1,
0.1698221, -1.09183, 4.029441, 0, 0.7529412, 1, 1,
0.170385, 0.5530412, 1.302593, 0, 0.7490196, 1, 1,
0.1715567, 0.8779867, -0.8148912, 0, 0.7411765, 1, 1,
0.1717062, 1.31303, 0.04825866, 0, 0.7372549, 1, 1,
0.1724019, -0.8073332, 1.740137, 0, 0.7294118, 1, 1,
0.1775334, -0.07332931, -0.193486, 0, 0.7254902, 1, 1,
0.1780774, -1.249064, 2.957932, 0, 0.7176471, 1, 1,
0.1792206, 1.445834, 0.5847849, 0, 0.7137255, 1, 1,
0.1823988, -0.9346355, 2.726743, 0, 0.7058824, 1, 1,
0.1869175, 0.7691827, 1.826059, 0, 0.6980392, 1, 1,
0.188231, 1.176336, 0.6821125, 0, 0.6941177, 1, 1,
0.1894085, 0.6903454, -1.32575, 0, 0.6862745, 1, 1,
0.1907058, -0.4743657, 1.954265, 0, 0.682353, 1, 1,
0.1943032, -0.3957964, 3.179575, 0, 0.6745098, 1, 1,
0.1961195, -1.23417, 5.756732, 0, 0.6705883, 1, 1,
0.1972689, -0.3743585, 1.201876, 0, 0.6627451, 1, 1,
0.1979834, 0.487597, 0.3886543, 0, 0.6588235, 1, 1,
0.1983856, -0.7182928, 2.098016, 0, 0.6509804, 1, 1,
0.2028147, 0.9561259, 0.416572, 0, 0.6470588, 1, 1,
0.2034836, -0.05261806, 2.417761, 0, 0.6392157, 1, 1,
0.2045031, 1.534795, -0.7716314, 0, 0.6352941, 1, 1,
0.2055297, -1.021267, 3.082746, 0, 0.627451, 1, 1,
0.2092328, -2.34941, 2.951444, 0, 0.6235294, 1, 1,
0.2203681, 0.2367309, 1.016462, 0, 0.6156863, 1, 1,
0.224262, -1.04928, 3.193657, 0, 0.6117647, 1, 1,
0.229824, 0.129525, 1.305225, 0, 0.6039216, 1, 1,
0.2303778, -1.366358, 3.307724, 0, 0.5960785, 1, 1,
0.2312776, 0.7878665, -0.6982805, 0, 0.5921569, 1, 1,
0.2315172, -0.7997448, 3.338648, 0, 0.5843138, 1, 1,
0.231737, 2.240175, -1.192147, 0, 0.5803922, 1, 1,
0.2335076, -0.7318785, 2.892025, 0, 0.572549, 1, 1,
0.2352002, 0.551837, -1.215363, 0, 0.5686275, 1, 1,
0.2360716, -1.675225, 2.306884, 0, 0.5607843, 1, 1,
0.237518, 1.153435, 0.3363174, 0, 0.5568628, 1, 1,
0.2404526, 0.2532513, 0.788534, 0, 0.5490196, 1, 1,
0.2428186, -1.813323, 1.178396, 0, 0.5450981, 1, 1,
0.2435209, 1.619583, 0.9025187, 0, 0.5372549, 1, 1,
0.245172, -0.4574531, 3.896548, 0, 0.5333334, 1, 1,
0.2497218, -0.0531873, 1.623775, 0, 0.5254902, 1, 1,
0.2593035, -2.163934, 2.54929, 0, 0.5215687, 1, 1,
0.2613124, 1.064509, 1.214715, 0, 0.5137255, 1, 1,
0.2624664, -1.221298, 2.916633, 0, 0.509804, 1, 1,
0.2666278, 1.493158, 0.1360161, 0, 0.5019608, 1, 1,
0.2697012, -0.3174706, 2.219062, 0, 0.4941176, 1, 1,
0.2704078, -0.3915888, 3.139022, 0, 0.4901961, 1, 1,
0.2724366, -1.508809, 2.551356, 0, 0.4823529, 1, 1,
0.2741334, 1.9273, 1.594716, 0, 0.4784314, 1, 1,
0.2744026, -1.242201, 3.983739, 0, 0.4705882, 1, 1,
0.2747008, 0.3494885, 1.817123, 0, 0.4666667, 1, 1,
0.278947, -0.5894635, 2.884194, 0, 0.4588235, 1, 1,
0.2802852, 0.5410757, 0.7399638, 0, 0.454902, 1, 1,
0.283851, 1.321881, 0.4221823, 0, 0.4470588, 1, 1,
0.2850791, 0.82344, -0.6371028, 0, 0.4431373, 1, 1,
0.2853709, 0.1578688, 0.8245925, 0, 0.4352941, 1, 1,
0.2885771, 0.9459516, -0.9866042, 0, 0.4313726, 1, 1,
0.2886276, 0.06017964, 2.178818, 0, 0.4235294, 1, 1,
0.2960766, -0.729663, 2.155543, 0, 0.4196078, 1, 1,
0.2964411, -0.4736026, 4.290191, 0, 0.4117647, 1, 1,
0.2981302, -0.7864258, 1.830589, 0, 0.4078431, 1, 1,
0.3044873, 0.7761953, 0.5535524, 0, 0.4, 1, 1,
0.3049133, 0.6414558, 1.052455, 0, 0.3921569, 1, 1,
0.3076234, 0.0950114, -1.039237, 0, 0.3882353, 1, 1,
0.3086176, 0.4937681, -0.4749067, 0, 0.3803922, 1, 1,
0.3092574, -0.3066502, 3.083027, 0, 0.3764706, 1, 1,
0.3134553, 0.7952732, 1.123392, 0, 0.3686275, 1, 1,
0.3235294, -0.4265665, 4.020638, 0, 0.3647059, 1, 1,
0.3238888, -1.455451, 3.98511, 0, 0.3568628, 1, 1,
0.3240758, -0.1867727, 1.969293, 0, 0.3529412, 1, 1,
0.325891, -1.554204, 4.025846, 0, 0.345098, 1, 1,
0.3271766, -1.498121, 2.150355, 0, 0.3411765, 1, 1,
0.3271854, -0.8383288, 2.767197, 0, 0.3333333, 1, 1,
0.3330575, -0.2684062, 2.206091, 0, 0.3294118, 1, 1,
0.3337018, -1.323795, 3.334144, 0, 0.3215686, 1, 1,
0.3337938, -0.4380281, 2.578103, 0, 0.3176471, 1, 1,
0.3361043, 0.9713348, 0.9013922, 0, 0.3098039, 1, 1,
0.3408238, -0.6785676, 2.52722, 0, 0.3058824, 1, 1,
0.3422818, 0.49284, 1.532241, 0, 0.2980392, 1, 1,
0.3512701, 0.7107933, -1.06042, 0, 0.2901961, 1, 1,
0.353395, -0.5199738, 3.238375, 0, 0.2862745, 1, 1,
0.3563469, -1.428067, 4.110186, 0, 0.2784314, 1, 1,
0.3564824, 0.7765271, -1.828046, 0, 0.2745098, 1, 1,
0.364157, -0.7400056, 1.781634, 0, 0.2666667, 1, 1,
0.3705313, -0.692964, 1.342723, 0, 0.2627451, 1, 1,
0.3715546, 0.04694778, 0.3220367, 0, 0.254902, 1, 1,
0.3718374, -0.2019899, 2.348204, 0, 0.2509804, 1, 1,
0.3721182, -0.7018951, 2.548675, 0, 0.2431373, 1, 1,
0.3745891, -0.05280821, 1.5619, 0, 0.2392157, 1, 1,
0.3751864, 0.581218, 1.797459, 0, 0.2313726, 1, 1,
0.3800644, -0.6444277, 3.53902, 0, 0.227451, 1, 1,
0.3810762, 0.5529262, 1.515497, 0, 0.2196078, 1, 1,
0.3870438, 0.6859313, -0.3932612, 0, 0.2156863, 1, 1,
0.3903925, -0.5341761, 2.097929, 0, 0.2078431, 1, 1,
0.393764, -1.357562, 2.87859, 0, 0.2039216, 1, 1,
0.3993235, 0.05527968, 1.744865, 0, 0.1960784, 1, 1,
0.4067371, 0.08943222, 0.4703351, 0, 0.1882353, 1, 1,
0.4068452, 1.146003, 1.691098, 0, 0.1843137, 1, 1,
0.4075333, -0.8744166, 2.813949, 0, 0.1764706, 1, 1,
0.4076822, 0.1023896, 0.7807298, 0, 0.172549, 1, 1,
0.4097853, -0.03090555, 1.130664, 0, 0.1647059, 1, 1,
0.4107577, -0.09724627, 1.221868, 0, 0.1607843, 1, 1,
0.4123994, -0.8229066, 1.557547, 0, 0.1529412, 1, 1,
0.4152713, -2.110624, 3.769473, 0, 0.1490196, 1, 1,
0.4162607, -0.503146, 2.003766, 0, 0.1411765, 1, 1,
0.4189552, 0.8897029, 1.435015, 0, 0.1372549, 1, 1,
0.4194538, -0.849035, 3.438179, 0, 0.1294118, 1, 1,
0.4224641, 0.1246503, 0.63432, 0, 0.1254902, 1, 1,
0.4232051, 0.9618553, 0.1215433, 0, 0.1176471, 1, 1,
0.4243183, -0.8195031, 2.25108, 0, 0.1137255, 1, 1,
0.4250909, 1.045012, -0.1900066, 0, 0.1058824, 1, 1,
0.4376304, 0.09885577, 2.092597, 0, 0.09803922, 1, 1,
0.44163, 0.7968058, -0.5566134, 0, 0.09411765, 1, 1,
0.4445233, 0.1160463, 1.130132, 0, 0.08627451, 1, 1,
0.4498589, 0.08496446, 0.4883491, 0, 0.08235294, 1, 1,
0.4560926, 1.025884, -0.5134016, 0, 0.07450981, 1, 1,
0.4566434, 1.518221, -2.918116, 0, 0.07058824, 1, 1,
0.4683067, -0.8214765, 5.963245, 0, 0.0627451, 1, 1,
0.4694377, 1.178042, 0.5603206, 0, 0.05882353, 1, 1,
0.4733636, -1.146093, 3.550735, 0, 0.05098039, 1, 1,
0.47406, -1.273478, 2.801767, 0, 0.04705882, 1, 1,
0.4743813, -0.1782464, 0.5187111, 0, 0.03921569, 1, 1,
0.4782433, 0.6301171, -1.051366, 0, 0.03529412, 1, 1,
0.4926015, -0.2218306, 1.553064, 0, 0.02745098, 1, 1,
0.4944161, -0.2843942, 2.538738, 0, 0.02352941, 1, 1,
0.5023338, 0.2430966, 1.678506, 0, 0.01568628, 1, 1,
0.5026721, -0.4941815, 1.724645, 0, 0.01176471, 1, 1,
0.5104348, -1.260124, 2.415344, 0, 0.003921569, 1, 1,
0.5117041, -1.146404, 3.203731, 0.003921569, 0, 1, 1,
0.5128899, 0.871563, 1.089946, 0.007843138, 0, 1, 1,
0.5183483, 0.4982618, 0.5712099, 0.01568628, 0, 1, 1,
0.5194533, 0.2366999, 2.017136, 0.01960784, 0, 1, 1,
0.5230348, -0.3184167, 1.235505, 0.02745098, 0, 1, 1,
0.5258737, 1.184434, -0.404963, 0.03137255, 0, 1, 1,
0.5259951, -0.09024376, 0.8386718, 0.03921569, 0, 1, 1,
0.5264073, -1.682837, 2.053966, 0.04313726, 0, 1, 1,
0.5272497, 0.906048, 1.197275, 0.05098039, 0, 1, 1,
0.5276024, 1.020323, 0.7743945, 0.05490196, 0, 1, 1,
0.5278541, 0.7902805, -0.1342721, 0.0627451, 0, 1, 1,
0.5289648, 0.9941472, -0.1891869, 0.06666667, 0, 1, 1,
0.5304607, 0.6247518, 1.390021, 0.07450981, 0, 1, 1,
0.5310297, 1.144805, 0.04510318, 0.07843138, 0, 1, 1,
0.5370007, -0.8652859, 1.278318, 0.08627451, 0, 1, 1,
0.5395995, 0.236746, 2.002372, 0.09019608, 0, 1, 1,
0.5411476, 2.746635, 0.1987506, 0.09803922, 0, 1, 1,
0.5413504, -0.2075999, 1.76839, 0.1058824, 0, 1, 1,
0.541946, 0.3087499, 0.9450915, 0.1098039, 0, 1, 1,
0.5455949, -0.5482106, 1.31725, 0.1176471, 0, 1, 1,
0.5478952, 1.597213, 0.4426702, 0.1215686, 0, 1, 1,
0.548683, -0.4862397, 2.470237, 0.1294118, 0, 1, 1,
0.5494096, -1.457631, 2.264831, 0.1333333, 0, 1, 1,
0.5500271, 0.8101456, 0.72457, 0.1411765, 0, 1, 1,
0.55049, -0.4098927, 1.362658, 0.145098, 0, 1, 1,
0.5566824, 0.6951569, 1.006746, 0.1529412, 0, 1, 1,
0.5584237, -0.4062417, 0.2048708, 0.1568628, 0, 1, 1,
0.5589762, -0.8384421, 2.950672, 0.1647059, 0, 1, 1,
0.5592995, -1.292895, 2.869403, 0.1686275, 0, 1, 1,
0.5609865, -0.5922776, 3.411469, 0.1764706, 0, 1, 1,
0.5649251, -0.1670576, 3.500161, 0.1803922, 0, 1, 1,
0.5664994, -1.571334, 3.265712, 0.1882353, 0, 1, 1,
0.569735, 1.122189, 3.324935, 0.1921569, 0, 1, 1,
0.5829269, 1.026302, 1.965249, 0.2, 0, 1, 1,
0.5882289, -1.288318, 1.989267, 0.2078431, 0, 1, 1,
0.5886825, 1.210616, 2.57497, 0.2117647, 0, 1, 1,
0.5905532, -0.7330912, 2.549505, 0.2196078, 0, 1, 1,
0.5925243, 1.325332, 0.1007054, 0.2235294, 0, 1, 1,
0.59599, 0.6505727, 0.4119021, 0.2313726, 0, 1, 1,
0.596568, 1.389747, 0.7802175, 0.2352941, 0, 1, 1,
0.5987571, 0.5839545, 2.570358, 0.2431373, 0, 1, 1,
0.6000026, 0.02019791, -0.4603491, 0.2470588, 0, 1, 1,
0.6001128, 0.5055658, -0.8232324, 0.254902, 0, 1, 1,
0.601315, 1.090439, 0.8873086, 0.2588235, 0, 1, 1,
0.6015363, 0.3925582, 1.095171, 0.2666667, 0, 1, 1,
0.6025417, 1.258164, -0.5141482, 0.2705882, 0, 1, 1,
0.6044985, 0.09366149, 3.735102, 0.2784314, 0, 1, 1,
0.6053213, -0.8091143, 2.884655, 0.282353, 0, 1, 1,
0.6065534, -0.2816724, 2.586664, 0.2901961, 0, 1, 1,
0.6115175, 0.6773244, 2.14685, 0.2941177, 0, 1, 1,
0.6130534, 0.108221, 1.341369, 0.3019608, 0, 1, 1,
0.6152712, 0.9285485, 0.9986103, 0.3098039, 0, 1, 1,
0.6175914, 0.2060681, 0.8217826, 0.3137255, 0, 1, 1,
0.6197815, -1.557148, 1.96707, 0.3215686, 0, 1, 1,
0.6210322, -0.4015847, 1.90469, 0.3254902, 0, 1, 1,
0.6219665, -0.2798117, 3.629222, 0.3333333, 0, 1, 1,
0.6242078, -0.6548223, 0.7720711, 0.3372549, 0, 1, 1,
0.629756, -0.6636418, 1.577171, 0.345098, 0, 1, 1,
0.6303624, -0.1694283, 2.841045, 0.3490196, 0, 1, 1,
0.6319855, -0.3685962, 1.996654, 0.3568628, 0, 1, 1,
0.632937, 0.240602, 1.663082, 0.3607843, 0, 1, 1,
0.6367097, 1.702105, 0.9452702, 0.3686275, 0, 1, 1,
0.6412892, 0.1749481, 0.643971, 0.372549, 0, 1, 1,
0.6436024, -0.1260496, 1.324899, 0.3803922, 0, 1, 1,
0.6492088, -1.440956, 2.718642, 0.3843137, 0, 1, 1,
0.6497924, 0.5032209, 0.3776919, 0.3921569, 0, 1, 1,
0.6575195, -0.777133, 2.754682, 0.3960784, 0, 1, 1,
0.6660091, 2.446846, 0.7558283, 0.4039216, 0, 1, 1,
0.669256, -0.1453889, 2.834214, 0.4117647, 0, 1, 1,
0.6696633, -0.6721452, 0.1503381, 0.4156863, 0, 1, 1,
0.6719158, -0.5594389, 1.398971, 0.4235294, 0, 1, 1,
0.6758261, -0.9641235, 2.246876, 0.427451, 0, 1, 1,
0.6800715, -1.808933, 1.562891, 0.4352941, 0, 1, 1,
0.6866521, -0.6870595, 2.42055, 0.4392157, 0, 1, 1,
0.688519, -0.7872356, 2.795972, 0.4470588, 0, 1, 1,
0.6889964, -1.530626, 2.1676, 0.4509804, 0, 1, 1,
0.6919383, 1.418888, -0.1962372, 0.4588235, 0, 1, 1,
0.6964781, -0.6996168, 1.139195, 0.4627451, 0, 1, 1,
0.6971793, -2.107742, 3.587092, 0.4705882, 0, 1, 1,
0.6997032, -1.735358, 3.523008, 0.4745098, 0, 1, 1,
0.7008887, 0.2203048, 1.053902, 0.4823529, 0, 1, 1,
0.7058803, -1.295019, 0.9114658, 0.4862745, 0, 1, 1,
0.7075763, 0.0597729, 2.089967, 0.4941176, 0, 1, 1,
0.7109852, 1.319251, -0.007779813, 0.5019608, 0, 1, 1,
0.7147476, -1.053373, 2.934781, 0.5058824, 0, 1, 1,
0.7162702, 0.9304262, 1.166643, 0.5137255, 0, 1, 1,
0.7206732, 0.217006, 2.099766, 0.5176471, 0, 1, 1,
0.7226148, 0.4974322, 0.7496228, 0.5254902, 0, 1, 1,
0.7233346, 0.9059689, 1.190359, 0.5294118, 0, 1, 1,
0.7260422, -0.3744692, 0.5452855, 0.5372549, 0, 1, 1,
0.7270871, -0.4468845, 2.459819, 0.5411765, 0, 1, 1,
0.7296247, 0.1814743, 3.142726, 0.5490196, 0, 1, 1,
0.7307966, 0.5261151, -0.003060066, 0.5529412, 0, 1, 1,
0.7313704, -1.419395, 1.399058, 0.5607843, 0, 1, 1,
0.7318304, 1.056035, 1.220953, 0.5647059, 0, 1, 1,
0.7336991, 1.039511, -0.4349402, 0.572549, 0, 1, 1,
0.7378632, 0.6589955, 0.8075786, 0.5764706, 0, 1, 1,
0.7385868, -0.7511339, 2.28706, 0.5843138, 0, 1, 1,
0.7439604, -2.626407, 2.082297, 0.5882353, 0, 1, 1,
0.7440448, -1.636073, 3.301929, 0.5960785, 0, 1, 1,
0.7442862, 1.132506, 2.247208, 0.6039216, 0, 1, 1,
0.7478403, -1.335999, 2.554599, 0.6078432, 0, 1, 1,
0.7497538, 0.5510157, 0.3739968, 0.6156863, 0, 1, 1,
0.7647033, -0.6202429, 2.310242, 0.6196079, 0, 1, 1,
0.7718167, 0.1147952, 1.996846, 0.627451, 0, 1, 1,
0.7738266, 0.6624552, 2.462998, 0.6313726, 0, 1, 1,
0.7764629, 0.591746, 0.6443406, 0.6392157, 0, 1, 1,
0.7782825, -0.6003889, 2.147858, 0.6431373, 0, 1, 1,
0.7853299, 0.2336494, 2.654085, 0.6509804, 0, 1, 1,
0.7876009, -0.637333, 2.056579, 0.654902, 0, 1, 1,
0.7887985, -0.5183522, 1.676843, 0.6627451, 0, 1, 1,
0.7925639, -0.8479847, 2.655809, 0.6666667, 0, 1, 1,
0.7931426, 1.123883, 2.012282, 0.6745098, 0, 1, 1,
0.7973143, -1.328503, 3.704043, 0.6784314, 0, 1, 1,
0.7976214, 1.189971, 1.088071, 0.6862745, 0, 1, 1,
0.8017919, -0.4045181, 4.517881, 0.6901961, 0, 1, 1,
0.8019507, -0.6941217, 1.705297, 0.6980392, 0, 1, 1,
0.8054379, -1.051183, 2.872707, 0.7058824, 0, 1, 1,
0.8072419, -2.025499, 2.66497, 0.7098039, 0, 1, 1,
0.8197381, -0.1328856, 1.481603, 0.7176471, 0, 1, 1,
0.8226511, -1.366694, 3.460385, 0.7215686, 0, 1, 1,
0.8242032, -0.05134597, 1.087728, 0.7294118, 0, 1, 1,
0.8258911, -1.046295, 3.45404, 0.7333333, 0, 1, 1,
0.8323098, 0.02465849, 2.328837, 0.7411765, 0, 1, 1,
0.8329055, -1.546958, 2.28679, 0.7450981, 0, 1, 1,
0.8387577, -1.321046, 3.604319, 0.7529412, 0, 1, 1,
0.8391135, 0.583156, 0.2834437, 0.7568628, 0, 1, 1,
0.8415987, -0.7170703, 3.107628, 0.7647059, 0, 1, 1,
0.8423025, 0.1759715, 1.668929, 0.7686275, 0, 1, 1,
0.8450666, -0.8335767, 1.465267, 0.7764706, 0, 1, 1,
0.8482822, -0.3122435, 2.349174, 0.7803922, 0, 1, 1,
0.848731, -1.228058, 1.332412, 0.7882353, 0, 1, 1,
0.851122, -0.1148813, 1.203519, 0.7921569, 0, 1, 1,
0.8513177, -0.5491193, 2.091989, 0.8, 0, 1, 1,
0.8588341, 0.7058289, 1.518703, 0.8078431, 0, 1, 1,
0.864952, -0.05277661, 1.474573, 0.8117647, 0, 1, 1,
0.8669155, -0.6990097, 1.674091, 0.8196079, 0, 1, 1,
0.869885, 0.3830193, 0.5849575, 0.8235294, 0, 1, 1,
0.8734739, 0.4667618, 0.4413886, 0.8313726, 0, 1, 1,
0.8771926, 0.9608383, -0.3373162, 0.8352941, 0, 1, 1,
0.8818071, -0.7295659, 1.609295, 0.8431373, 0, 1, 1,
0.8825673, 1.131125, 0.9384316, 0.8470588, 0, 1, 1,
0.901741, -0.5824736, 2.700692, 0.854902, 0, 1, 1,
0.902254, -0.2078132, 0.3940906, 0.8588235, 0, 1, 1,
0.903657, -0.4226531, 2.513555, 0.8666667, 0, 1, 1,
0.9046489, 2.217593, -0.4857841, 0.8705882, 0, 1, 1,
0.9066295, 0.6788598, 0.5031522, 0.8784314, 0, 1, 1,
0.9097629, -0.5855749, 1.27107, 0.8823529, 0, 1, 1,
0.9122995, 0.8088953, 1.125059, 0.8901961, 0, 1, 1,
0.9197831, -0.0902429, 2.217651, 0.8941177, 0, 1, 1,
0.9202238, -1.647753, 1.237556, 0.9019608, 0, 1, 1,
0.923149, -0.4257345, 2.508375, 0.9098039, 0, 1, 1,
0.9287448, -0.01344415, 1.35172, 0.9137255, 0, 1, 1,
0.9292588, -1.332141, 1.789234, 0.9215686, 0, 1, 1,
0.9344109, 2.317292, 1.493737, 0.9254902, 0, 1, 1,
0.9348001, -0.7746649, 2.381146, 0.9333333, 0, 1, 1,
0.9394923, -0.85794, 1.5393, 0.9372549, 0, 1, 1,
0.9395247, -1.669538, 3.471222, 0.945098, 0, 1, 1,
0.9427363, 0.7097775, 0.7937022, 0.9490196, 0, 1, 1,
0.94351, 0.7200866, -0.4163253, 0.9568627, 0, 1, 1,
0.945473, 0.6487175, 1.188354, 0.9607843, 0, 1, 1,
0.9482735, -0.641625, 2.705376, 0.9686275, 0, 1, 1,
0.9509211, -1.136781, 3.189016, 0.972549, 0, 1, 1,
0.9515011, 0.6590279, 1.856148, 0.9803922, 0, 1, 1,
0.9561747, 0.05328265, 1.448628, 0.9843137, 0, 1, 1,
0.9589045, 0.2603116, 1.312005, 0.9921569, 0, 1, 1,
0.9591379, -0.9449889, 2.257703, 0.9960784, 0, 1, 1,
0.9609045, -0.9503653, 1.700956, 1, 0, 0.9960784, 1,
0.9661645, -0.5475944, 4.213484, 1, 0, 0.9882353, 1,
0.9703395, -0.1477987, 2.062942, 1, 0, 0.9843137, 1,
0.9711569, -1.076151, 1.636778, 1, 0, 0.9764706, 1,
0.9715885, -1.827496, 1.648104, 1, 0, 0.972549, 1,
0.9725723, 0.1429329, 1.668927, 1, 0, 0.9647059, 1,
0.9749529, -0.7772249, 2.802399, 1, 0, 0.9607843, 1,
0.9853286, -0.8364412, 3.229195, 1, 0, 0.9529412, 1,
0.9936658, -0.7026778, 1.9398, 1, 0, 0.9490196, 1,
0.9936808, 1.447118, 1.843204, 1, 0, 0.9411765, 1,
0.9982337, -0.8658849, 1.242853, 1, 0, 0.9372549, 1,
0.9990767, -1.615743, 2.099038, 1, 0, 0.9294118, 1,
1.005165, -0.1243364, 1.90764, 1, 0, 0.9254902, 1,
1.008736, -0.4193473, 3.792476, 1, 0, 0.9176471, 1,
1.009581, -0.977258, 3.469048, 1, 0, 0.9137255, 1,
1.01032, 0.424064, 0.5482645, 1, 0, 0.9058824, 1,
1.012724, 2.069267, -0.2905727, 1, 0, 0.9019608, 1,
1.015591, -1.930497, 2.550976, 1, 0, 0.8941177, 1,
1.023721, 0.4424137, -0.4732212, 1, 0, 0.8862745, 1,
1.025627, -1.652289, 3.035884, 1, 0, 0.8823529, 1,
1.027615, 0.8858668, -0.1632453, 1, 0, 0.8745098, 1,
1.03009, 0.1134954, 1.841753, 1, 0, 0.8705882, 1,
1.031995, -1.841009, 3.627529, 1, 0, 0.8627451, 1,
1.0491, 1.634132, 0.02229443, 1, 0, 0.8588235, 1,
1.050504, -0.7146528, 1.186841, 1, 0, 0.8509804, 1,
1.05112, 1.460746, 0.02412097, 1, 0, 0.8470588, 1,
1.054957, 1.115917, 3.371573, 1, 0, 0.8392157, 1,
1.061794, 0.9114195, -0.363932, 1, 0, 0.8352941, 1,
1.062708, -0.2285847, 2.391749, 1, 0, 0.827451, 1,
1.069592, -1.249838, 0.3455268, 1, 0, 0.8235294, 1,
1.070338, 0.5651605, 3.096026, 1, 0, 0.8156863, 1,
1.084515, 0.3082614, 2.604707, 1, 0, 0.8117647, 1,
1.091403, 0.1532932, 1.035824, 1, 0, 0.8039216, 1,
1.094145, -2.04361, 2.513582, 1, 0, 0.7960784, 1,
1.098222, -1.428766, 1.417307, 1, 0, 0.7921569, 1,
1.111297, 1.371456, -0.2489241, 1, 0, 0.7843137, 1,
1.1113, -1.010518, 1.284321, 1, 0, 0.7803922, 1,
1.111428, -0.7799751, 1.074008, 1, 0, 0.772549, 1,
1.114166, -0.4493218, 0.9674245, 1, 0, 0.7686275, 1,
1.116094, 1.193873, 0.5097466, 1, 0, 0.7607843, 1,
1.11697, -0.3452813, 1.613881, 1, 0, 0.7568628, 1,
1.119968, -0.4187014, 2.052511, 1, 0, 0.7490196, 1,
1.127766, 1.54267, 0.9400662, 1, 0, 0.7450981, 1,
1.132487, 0.5331176, -0.525988, 1, 0, 0.7372549, 1,
1.142424, 0.3867311, 0.9461035, 1, 0, 0.7333333, 1,
1.149377, 0.9058484, 0.8145555, 1, 0, 0.7254902, 1,
1.154202, -0.1359177, 0.7245263, 1, 0, 0.7215686, 1,
1.157341, 1.231832, 1.29361, 1, 0, 0.7137255, 1,
1.159479, -0.4956002, 1.513038, 1, 0, 0.7098039, 1,
1.163441, -0.5378833, 1.723369, 1, 0, 0.7019608, 1,
1.165233, -0.375129, 2.11836, 1, 0, 0.6941177, 1,
1.167803, -0.3726209, 1.876303, 1, 0, 0.6901961, 1,
1.168688, 0.1164851, 0.3586484, 1, 0, 0.682353, 1,
1.169404, 0.8219041, 0.8186868, 1, 0, 0.6784314, 1,
1.172076, -1.30123, 2.859409, 1, 0, 0.6705883, 1,
1.180233, 0.7905613, 0.8961576, 1, 0, 0.6666667, 1,
1.181961, -0.7907115, 2.583014, 1, 0, 0.6588235, 1,
1.185225, 1.060358, 2.232796, 1, 0, 0.654902, 1,
1.198053, 0.6697518, 0.3847382, 1, 0, 0.6470588, 1,
1.20301, -1.048191, 2.904784, 1, 0, 0.6431373, 1,
1.210447, 0.4961355, -1.370278, 1, 0, 0.6352941, 1,
1.216933, 0.8776992, 0.2333373, 1, 0, 0.6313726, 1,
1.218599, 0.5773247, -0.07446337, 1, 0, 0.6235294, 1,
1.218631, 1.366825, -0.1206264, 1, 0, 0.6196079, 1,
1.221203, 0.821934, 2.210732, 1, 0, 0.6117647, 1,
1.224458, 0.4704722, 0.9667914, 1, 0, 0.6078432, 1,
1.240154, 1.667377, 2.280956, 1, 0, 0.6, 1,
1.246675, -0.1596066, 2.470344, 1, 0, 0.5921569, 1,
1.246796, -0.4220633, 0.4315604, 1, 0, 0.5882353, 1,
1.246848, -0.5761794, 0.2801202, 1, 0, 0.5803922, 1,
1.252239, 0.6200057, 1.706267, 1, 0, 0.5764706, 1,
1.255334, 0.1860375, 1.624398, 1, 0, 0.5686275, 1,
1.256679, 0.8890372, 1.125156, 1, 0, 0.5647059, 1,
1.257936, -0.9107288, 1.491756, 1, 0, 0.5568628, 1,
1.259376, 1.498066, -0.05808417, 1, 0, 0.5529412, 1,
1.273078, 0.7280263, 0.9836826, 1, 0, 0.5450981, 1,
1.278762, 0.4292915, 2.730584, 1, 0, 0.5411765, 1,
1.283848, -0.236079, 2.855543, 1, 0, 0.5333334, 1,
1.287672, -0.5928444, 0.1496006, 1, 0, 0.5294118, 1,
1.28892, 3.007339, 1.843864, 1, 0, 0.5215687, 1,
1.290856, -1.885389, 1.897454, 1, 0, 0.5176471, 1,
1.297999, 2.708452, 0.9780915, 1, 0, 0.509804, 1,
1.302506, 2.331532, -0.1444473, 1, 0, 0.5058824, 1,
1.307291, 1.72065, 0.768114, 1, 0, 0.4980392, 1,
1.31203, 2.272383, -2.236474, 1, 0, 0.4901961, 1,
1.313291, 1.019366, 0.9321334, 1, 0, 0.4862745, 1,
1.317087, 0.9756295, 0.9845757, 1, 0, 0.4784314, 1,
1.328771, -0.3098323, 2.002522, 1, 0, 0.4745098, 1,
1.335885, -2.085426, 3.276816, 1, 0, 0.4666667, 1,
1.354156, -0.1966372, 3.304603, 1, 0, 0.4627451, 1,
1.373217, -1.327758, 0.6977016, 1, 0, 0.454902, 1,
1.384479, 0.4448248, 0.9566115, 1, 0, 0.4509804, 1,
1.386001, 0.01522452, -0.6517352, 1, 0, 0.4431373, 1,
1.412314, -1.716699, 0.8294466, 1, 0, 0.4392157, 1,
1.414675, -0.2723102, 2.79154, 1, 0, 0.4313726, 1,
1.416963, 0.0519186, 2.424901, 1, 0, 0.427451, 1,
1.428556, 0.02619855, 2.920953, 1, 0, 0.4196078, 1,
1.430149, 1.045107, 2.241042, 1, 0, 0.4156863, 1,
1.449318, 2.477219, 1.837885, 1, 0, 0.4078431, 1,
1.462075, 1.195721, 2.060315, 1, 0, 0.4039216, 1,
1.472354, 0.2784475, 1.128721, 1, 0, 0.3960784, 1,
1.484545, -0.4333474, 1.946869, 1, 0, 0.3882353, 1,
1.502476, 0.3551528, 2.157401, 1, 0, 0.3843137, 1,
1.508217, 0.2336709, 0.2280124, 1, 0, 0.3764706, 1,
1.509083, 0.03213399, -0.374434, 1, 0, 0.372549, 1,
1.51535, -0.03941137, 0.7059462, 1, 0, 0.3647059, 1,
1.518359, 0.0614824, 2.260925, 1, 0, 0.3607843, 1,
1.530563, 0.7436242, 0.2066377, 1, 0, 0.3529412, 1,
1.547691, 2.94225, -0.5858021, 1, 0, 0.3490196, 1,
1.555204, 1.384968, -0.04425957, 1, 0, 0.3411765, 1,
1.556831, -1.060646, 1.378341, 1, 0, 0.3372549, 1,
1.575077, -2.832007, 1.741263, 1, 0, 0.3294118, 1,
1.584222, -0.3031462, 2.328642, 1, 0, 0.3254902, 1,
1.613887, -1.251412, 1.82179, 1, 0, 0.3176471, 1,
1.651966, 0.5575529, 1.399573, 1, 0, 0.3137255, 1,
1.652702, -1.427655, 0.7919387, 1, 0, 0.3058824, 1,
1.653213, 0.6628526, 1.613408, 1, 0, 0.2980392, 1,
1.6541, -1.984648, 3.632644, 1, 0, 0.2941177, 1,
1.666283, -1.822811, 2.76909, 1, 0, 0.2862745, 1,
1.669334, 0.1596386, 1.383231, 1, 0, 0.282353, 1,
1.6815, -0.2309672, -0.269636, 1, 0, 0.2745098, 1,
1.695675, 0.7047046, 0.4968467, 1, 0, 0.2705882, 1,
1.704492, 0.1389895, 1.7585, 1, 0, 0.2627451, 1,
1.726361, 1.931464, -0.138071, 1, 0, 0.2588235, 1,
1.727831, 1.057713, -2.221, 1, 0, 0.2509804, 1,
1.741752, 0.8689566, 2.774851, 1, 0, 0.2470588, 1,
1.783085, 0.3805822, 0.8574307, 1, 0, 0.2392157, 1,
1.792613, -0.7264964, 1.999762, 1, 0, 0.2352941, 1,
1.802594, 0.1722268, 0.3915848, 1, 0, 0.227451, 1,
1.805609, -0.7895644, 2.422069, 1, 0, 0.2235294, 1,
1.815505, -0.6568932, 0.6113977, 1, 0, 0.2156863, 1,
1.828132, 0.02439674, 0.1545565, 1, 0, 0.2117647, 1,
1.83852, -1.683971, 1.812043, 1, 0, 0.2039216, 1,
1.839124, 0.02047246, 2.898526, 1, 0, 0.1960784, 1,
1.839674, -0.7204661, 2.973988, 1, 0, 0.1921569, 1,
1.842508, 0.1734528, 1.389075, 1, 0, 0.1843137, 1,
1.847018, -2.320528, 3.507807, 1, 0, 0.1803922, 1,
1.849407, 1.406375, -0.1565744, 1, 0, 0.172549, 1,
1.854391, 0.3808486, 1.717044, 1, 0, 0.1686275, 1,
1.85935, 1.107163, 1.870553, 1, 0, 0.1607843, 1,
1.870427, -0.1462211, 1.395186, 1, 0, 0.1568628, 1,
1.898248, 2.552233, 2.05364, 1, 0, 0.1490196, 1,
1.909976, -0.4468539, 1.700828, 1, 0, 0.145098, 1,
1.914439, 0.3773216, 2.556419, 1, 0, 0.1372549, 1,
1.936109, 0.5876337, 0.6835032, 1, 0, 0.1333333, 1,
1.947198, -1.165087, 1.116715, 1, 0, 0.1254902, 1,
1.949688, -1.176725, 0.955282, 1, 0, 0.1215686, 1,
1.960433, 0.8816292, -0.08994498, 1, 0, 0.1137255, 1,
2.050855, -0.3445817, -0.4875906, 1, 0, 0.1098039, 1,
2.051579, 1.093768, 1.133086, 1, 0, 0.1019608, 1,
2.060696, 0.968852, -0.07220795, 1, 0, 0.09411765, 1,
2.080484, -0.2883278, 0.5595415, 1, 0, 0.09019608, 1,
2.227449, -0.2291822, 3.560569, 1, 0, 0.08235294, 1,
2.227574, -0.7410743, 2.155265, 1, 0, 0.07843138, 1,
2.359616, 0.8321425, 1.137867, 1, 0, 0.07058824, 1,
2.381545, -1.551349, 2.931957, 1, 0, 0.06666667, 1,
2.421811, 1.577717, 0.5915599, 1, 0, 0.05882353, 1,
2.446026, 1.119421, 2.844821, 1, 0, 0.05490196, 1,
2.448009, 0.6886191, 2.99983, 1, 0, 0.04705882, 1,
2.491042, -1.425155, 3.084116, 1, 0, 0.04313726, 1,
2.579812, 0.124346, 1.80311, 1, 0, 0.03529412, 1,
2.593047, 0.6980394, 2.525876, 1, 0, 0.03137255, 1,
2.625777, 0.009001521, 1.615225, 1, 0, 0.02352941, 1,
2.69906, 0.4219956, 0.6477289, 1, 0, 0.01960784, 1,
2.824773, 0.3544197, 1.092134, 1, 0, 0.01176471, 1,
3.112704, 2.914932, 0.2572511, 1, 0, 0.007843138, 1
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
-0.1830847, -3.821776, -8.548143, 0, -0.5, 0.5, 0.5,
-0.1830847, -3.821776, -8.548143, 1, -0.5, 0.5, 0.5,
-0.1830847, -3.821776, -8.548143, 1, 1.5, 0.5, 0.5,
-0.1830847, -3.821776, -8.548143, 0, 1.5, 0.5, 0.5
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
-4.596146, 0.08766568, -8.548143, 0, -0.5, 0.5, 0.5,
-4.596146, 0.08766568, -8.548143, 1, -0.5, 0.5, 0.5,
-4.596146, 0.08766568, -8.548143, 1, 1.5, 0.5, 0.5,
-4.596146, 0.08766568, -8.548143, 0, 1.5, 0.5, 0.5
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
-4.596146, -3.821776, -0.2408543, 0, -0.5, 0.5, 0.5,
-4.596146, -3.821776, -0.2408543, 1, -0.5, 0.5, 0.5,
-4.596146, -3.821776, -0.2408543, 1, 1.5, 0.5, 0.5,
-4.596146, -3.821776, -0.2408543, 0, 1.5, 0.5, 0.5
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
-3, -2.919597, -6.631077,
3, -2.919597, -6.631077,
-3, -2.919597, -6.631077,
-3, -3.069961, -6.950588,
-2, -2.919597, -6.631077,
-2, -3.069961, -6.950588,
-1, -2.919597, -6.631077,
-1, -3.069961, -6.950588,
0, -2.919597, -6.631077,
0, -3.069961, -6.950588,
1, -2.919597, -6.631077,
1, -3.069961, -6.950588,
2, -2.919597, -6.631077,
2, -3.069961, -6.950588,
3, -2.919597, -6.631077,
3, -3.069961, -6.950588
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
-3, -3.370687, -7.58961, 0, -0.5, 0.5, 0.5,
-3, -3.370687, -7.58961, 1, -0.5, 0.5, 0.5,
-3, -3.370687, -7.58961, 1, 1.5, 0.5, 0.5,
-3, -3.370687, -7.58961, 0, 1.5, 0.5, 0.5,
-2, -3.370687, -7.58961, 0, -0.5, 0.5, 0.5,
-2, -3.370687, -7.58961, 1, -0.5, 0.5, 0.5,
-2, -3.370687, -7.58961, 1, 1.5, 0.5, 0.5,
-2, -3.370687, -7.58961, 0, 1.5, 0.5, 0.5,
-1, -3.370687, -7.58961, 0, -0.5, 0.5, 0.5,
-1, -3.370687, -7.58961, 1, -0.5, 0.5, 0.5,
-1, -3.370687, -7.58961, 1, 1.5, 0.5, 0.5,
-1, -3.370687, -7.58961, 0, 1.5, 0.5, 0.5,
0, -3.370687, -7.58961, 0, -0.5, 0.5, 0.5,
0, -3.370687, -7.58961, 1, -0.5, 0.5, 0.5,
0, -3.370687, -7.58961, 1, 1.5, 0.5, 0.5,
0, -3.370687, -7.58961, 0, 1.5, 0.5, 0.5,
1, -3.370687, -7.58961, 0, -0.5, 0.5, 0.5,
1, -3.370687, -7.58961, 1, -0.5, 0.5, 0.5,
1, -3.370687, -7.58961, 1, 1.5, 0.5, 0.5,
1, -3.370687, -7.58961, 0, 1.5, 0.5, 0.5,
2, -3.370687, -7.58961, 0, -0.5, 0.5, 0.5,
2, -3.370687, -7.58961, 1, -0.5, 0.5, 0.5,
2, -3.370687, -7.58961, 1, 1.5, 0.5, 0.5,
2, -3.370687, -7.58961, 0, 1.5, 0.5, 0.5,
3, -3.370687, -7.58961, 0, -0.5, 0.5, 0.5,
3, -3.370687, -7.58961, 1, -0.5, 0.5, 0.5,
3, -3.370687, -7.58961, 1, 1.5, 0.5, 0.5,
3, -3.370687, -7.58961, 0, 1.5, 0.5, 0.5
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
-3.577747, -2, -6.631077,
-3.577747, 3, -6.631077,
-3.577747, -2, -6.631077,
-3.74748, -2, -6.950588,
-3.577747, -1, -6.631077,
-3.74748, -1, -6.950588,
-3.577747, 0, -6.631077,
-3.74748, 0, -6.950588,
-3.577747, 1, -6.631077,
-3.74748, 1, -6.950588,
-3.577747, 2, -6.631077,
-3.74748, 2, -6.950588,
-3.577747, 3, -6.631077,
-3.74748, 3, -6.950588
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
-4.086946, -2, -7.58961, 0, -0.5, 0.5, 0.5,
-4.086946, -2, -7.58961, 1, -0.5, 0.5, 0.5,
-4.086946, -2, -7.58961, 1, 1.5, 0.5, 0.5,
-4.086946, -2, -7.58961, 0, 1.5, 0.5, 0.5,
-4.086946, -1, -7.58961, 0, -0.5, 0.5, 0.5,
-4.086946, -1, -7.58961, 1, -0.5, 0.5, 0.5,
-4.086946, -1, -7.58961, 1, 1.5, 0.5, 0.5,
-4.086946, -1, -7.58961, 0, 1.5, 0.5, 0.5,
-4.086946, 0, -7.58961, 0, -0.5, 0.5, 0.5,
-4.086946, 0, -7.58961, 1, -0.5, 0.5, 0.5,
-4.086946, 0, -7.58961, 1, 1.5, 0.5, 0.5,
-4.086946, 0, -7.58961, 0, 1.5, 0.5, 0.5,
-4.086946, 1, -7.58961, 0, -0.5, 0.5, 0.5,
-4.086946, 1, -7.58961, 1, -0.5, 0.5, 0.5,
-4.086946, 1, -7.58961, 1, 1.5, 0.5, 0.5,
-4.086946, 1, -7.58961, 0, 1.5, 0.5, 0.5,
-4.086946, 2, -7.58961, 0, -0.5, 0.5, 0.5,
-4.086946, 2, -7.58961, 1, -0.5, 0.5, 0.5,
-4.086946, 2, -7.58961, 1, 1.5, 0.5, 0.5,
-4.086946, 2, -7.58961, 0, 1.5, 0.5, 0.5,
-4.086946, 3, -7.58961, 0, -0.5, 0.5, 0.5,
-4.086946, 3, -7.58961, 1, -0.5, 0.5, 0.5,
-4.086946, 3, -7.58961, 1, 1.5, 0.5, 0.5,
-4.086946, 3, -7.58961, 0, 1.5, 0.5, 0.5
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
-3.577747, -2.919597, -6,
-3.577747, -2.919597, 4,
-3.577747, -2.919597, -6,
-3.74748, -3.069961, -6,
-3.577747, -2.919597, -4,
-3.74748, -3.069961, -4,
-3.577747, -2.919597, -2,
-3.74748, -3.069961, -2,
-3.577747, -2.919597, 0,
-3.74748, -3.069961, 0,
-3.577747, -2.919597, 2,
-3.74748, -3.069961, 2,
-3.577747, -2.919597, 4,
-3.74748, -3.069961, 4
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
-4.086946, -3.370687, -6, 0, -0.5, 0.5, 0.5,
-4.086946, -3.370687, -6, 1, -0.5, 0.5, 0.5,
-4.086946, -3.370687, -6, 1, 1.5, 0.5, 0.5,
-4.086946, -3.370687, -6, 0, 1.5, 0.5, 0.5,
-4.086946, -3.370687, -4, 0, -0.5, 0.5, 0.5,
-4.086946, -3.370687, -4, 1, -0.5, 0.5, 0.5,
-4.086946, -3.370687, -4, 1, 1.5, 0.5, 0.5,
-4.086946, -3.370687, -4, 0, 1.5, 0.5, 0.5,
-4.086946, -3.370687, -2, 0, -0.5, 0.5, 0.5,
-4.086946, -3.370687, -2, 1, -0.5, 0.5, 0.5,
-4.086946, -3.370687, -2, 1, 1.5, 0.5, 0.5,
-4.086946, -3.370687, -2, 0, 1.5, 0.5, 0.5,
-4.086946, -3.370687, 0, 0, -0.5, 0.5, 0.5,
-4.086946, -3.370687, 0, 1, -0.5, 0.5, 0.5,
-4.086946, -3.370687, 0, 1, 1.5, 0.5, 0.5,
-4.086946, -3.370687, 0, 0, 1.5, 0.5, 0.5,
-4.086946, -3.370687, 2, 0, -0.5, 0.5, 0.5,
-4.086946, -3.370687, 2, 1, -0.5, 0.5, 0.5,
-4.086946, -3.370687, 2, 1, 1.5, 0.5, 0.5,
-4.086946, -3.370687, 2, 0, 1.5, 0.5, 0.5,
-4.086946, -3.370687, 4, 0, -0.5, 0.5, 0.5,
-4.086946, -3.370687, 4, 1, -0.5, 0.5, 0.5,
-4.086946, -3.370687, 4, 1, 1.5, 0.5, 0.5,
-4.086946, -3.370687, 4, 0, 1.5, 0.5, 0.5
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
-3.577747, -2.919597, -6.631077,
-3.577747, 3.094929, -6.631077,
-3.577747, -2.919597, 6.149368,
-3.577747, 3.094929, 6.149368,
-3.577747, -2.919597, -6.631077,
-3.577747, -2.919597, 6.149368,
-3.577747, 3.094929, -6.631077,
-3.577747, 3.094929, 6.149368,
-3.577747, -2.919597, -6.631077,
3.211577, -2.919597, -6.631077,
-3.577747, -2.919597, 6.149368,
3.211577, -2.919597, 6.149368,
-3.577747, 3.094929, -6.631077,
3.211577, 3.094929, -6.631077,
-3.577747, 3.094929, 6.149368,
3.211577, 3.094929, 6.149368,
3.211577, -2.919597, -6.631077,
3.211577, 3.094929, -6.631077,
3.211577, -2.919597, 6.149368,
3.211577, 3.094929, 6.149368,
3.211577, -2.919597, -6.631077,
3.211577, -2.919597, 6.149368,
3.211577, 3.094929, -6.631077,
3.211577, 3.094929, 6.149368
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
var radius = 8.368504;
var distance = 37.23242;
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
mvMatrix.translate( 0.1830847, -0.08766568, 0.2408543 );
mvMatrix.scale( 1.332708, 1.50439, 0.7079715 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.23242);
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
Dieldrin<-read.table("Dieldrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dieldrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dieldrin' not found
```

```r
y<-Dieldrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dieldrin' not found
```

```r
z<-Dieldrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dieldrin' not found
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
-3.478873, -0.9754518, -0.8383077, 0, 0, 1, 1, 1,
-3.374681, -1.438003, -1.367077, 1, 0, 0, 1, 1,
-3.365173, -1.071322, -2.330579, 1, 0, 0, 1, 1,
-2.968873, 1.610713, -1.700904, 1, 0, 0, 1, 1,
-2.862682, 1.032621, -0.6552641, 1, 0, 0, 1, 1,
-2.669621, 0.245344, -1.608965, 1, 0, 0, 1, 1,
-2.657502, 0.6098099, -2.167546, 0, 0, 0, 1, 1,
-2.492088, 1.06907, -1.857692, 0, 0, 0, 1, 1,
-2.464043, -1.076381, -1.397461, 0, 0, 0, 1, 1,
-2.436738, 1.459924, -2.970852, 0, 0, 0, 1, 1,
-2.308378, 0.4244601, -1.202879, 0, 0, 0, 1, 1,
-2.279303, 0.002920057, -1.028895, 0, 0, 0, 1, 1,
-2.246111, -0.6882894, -3.555056, 0, 0, 0, 1, 1,
-2.235097, -0.7544292, -2.928083, 1, 1, 1, 1, 1,
-2.150093, -0.4163686, -1.284156, 1, 1, 1, 1, 1,
-2.146546, -0.2874177, -1.944014, 1, 1, 1, 1, 1,
-2.144974, -1.003329, -2.442545, 1, 1, 1, 1, 1,
-2.090568, -1.069461, -3.248493, 1, 1, 1, 1, 1,
-2.057344, -0.505921, -2.099645, 1, 1, 1, 1, 1,
-1.993337, 0.6573434, -0.9765887, 1, 1, 1, 1, 1,
-1.977487, -0.6063589, -1.589761, 1, 1, 1, 1, 1,
-1.958608, -1.894249, -1.284914, 1, 1, 1, 1, 1,
-1.946443, -1.442481, -1.77937, 1, 1, 1, 1, 1,
-1.938567, 0.353519, -2.441202, 1, 1, 1, 1, 1,
-1.891535, -1.066704, -1.575964, 1, 1, 1, 1, 1,
-1.888689, -0.5069103, -2.250662, 1, 1, 1, 1, 1,
-1.859152, -0.5434469, -1.685029, 1, 1, 1, 1, 1,
-1.84042, 1.957539, -0.617332, 1, 1, 1, 1, 1,
-1.82042, -0.6166744, -1.524068, 0, 0, 1, 1, 1,
-1.795702, 0.4321011, -1.234412, 1, 0, 0, 1, 1,
-1.792782, -0.6976305, -2.887022, 1, 0, 0, 1, 1,
-1.788993, 1.158996, 0.5004557, 1, 0, 0, 1, 1,
-1.76285, 1.84246, -0.4791681, 1, 0, 0, 1, 1,
-1.755672, 1.561236, -0.3926693, 1, 0, 0, 1, 1,
-1.745914, -0.8107139, -2.596328, 0, 0, 0, 1, 1,
-1.72357, -0.311962, -1.684839, 0, 0, 0, 1, 1,
-1.716838, -0.575915, -0.4660979, 0, 0, 0, 1, 1,
-1.714466, 1.085711, -1.699802, 0, 0, 0, 1, 1,
-1.700978, -0.8196375, -0.3441563, 0, 0, 0, 1, 1,
-1.692957, 0.0734525, -1.589292, 0, 0, 0, 1, 1,
-1.65861, -1.080215, -2.600437, 0, 0, 0, 1, 1,
-1.633541, -0.7355045, -2.153271, 1, 1, 1, 1, 1,
-1.61339, 0.1042277, -0.5165958, 1, 1, 1, 1, 1,
-1.612915, 1.658395, -1.303589, 1, 1, 1, 1, 1,
-1.609835, -0.4678042, -2.494567, 1, 1, 1, 1, 1,
-1.595711, -1.001725, -3.209646, 1, 1, 1, 1, 1,
-1.595299, 1.594117, -1.395998, 1, 1, 1, 1, 1,
-1.586464, -0.9537595, -2.748071, 1, 1, 1, 1, 1,
-1.584978, -0.02414193, -2.684223, 1, 1, 1, 1, 1,
-1.574238, 0.1749906, -0.2757834, 1, 1, 1, 1, 1,
-1.571509, -0.445568, -1.927747, 1, 1, 1, 1, 1,
-1.559577, 1.106817, -0.8172354, 1, 1, 1, 1, 1,
-1.552314, -0.2217906, -2.994709, 1, 1, 1, 1, 1,
-1.551823, 0.01384456, -1.48811, 1, 1, 1, 1, 1,
-1.535105, -0.9866727, -0.7915058, 1, 1, 1, 1, 1,
-1.526641, -1.055799, -2.339107, 1, 1, 1, 1, 1,
-1.520246, -0.5721824, -2.185483, 0, 0, 1, 1, 1,
-1.518318, -0.3846534, -0.6677573, 1, 0, 0, 1, 1,
-1.512074, -1.119936, -2.094292, 1, 0, 0, 1, 1,
-1.508735, 1.371826, 0.4781654, 1, 0, 0, 1, 1,
-1.500536, -1.097809, -2.389502, 1, 0, 0, 1, 1,
-1.490533, -0.03769555, -0.399737, 1, 0, 0, 1, 1,
-1.470749, -1.191736, -1.892302, 0, 0, 0, 1, 1,
-1.459792, 1.159973, -0.8599989, 0, 0, 0, 1, 1,
-1.458536, 0.1642632, 0.8202989, 0, 0, 0, 1, 1,
-1.448672, 1.217312, 0.1835599, 0, 0, 0, 1, 1,
-1.44753, 0.05982358, -1.666133, 0, 0, 0, 1, 1,
-1.430372, 0.1420456, 0.3448207, 0, 0, 0, 1, 1,
-1.418478, -0.6333539, -1.174738, 0, 0, 0, 1, 1,
-1.409647, 0.5277341, -1.834244, 1, 1, 1, 1, 1,
-1.391835, -0.5861195, -2.330858, 1, 1, 1, 1, 1,
-1.378675, 1.443206, -1.194727, 1, 1, 1, 1, 1,
-1.378663, -0.4144571, -0.169893, 1, 1, 1, 1, 1,
-1.373802, 0.3748622, -1.667067, 1, 1, 1, 1, 1,
-1.362961, 0.2031094, -0.9407745, 1, 1, 1, 1, 1,
-1.356102, -0.710124, -3.590459, 1, 1, 1, 1, 1,
-1.354343, 1.561266, -0.445169, 1, 1, 1, 1, 1,
-1.34785, 0.9206063, -0.733552, 1, 1, 1, 1, 1,
-1.346425, 0.2020125, -2.471621, 1, 1, 1, 1, 1,
-1.311374, -0.6789727, -2.645006, 1, 1, 1, 1, 1,
-1.311217, 1.454299, -1.014614, 1, 1, 1, 1, 1,
-1.309211, 0.5887629, -0.9675804, 1, 1, 1, 1, 1,
-1.304623, 1.874286, -0.5806963, 1, 1, 1, 1, 1,
-1.294462, -0.6577255, -2.634913, 1, 1, 1, 1, 1,
-1.293073, -0.3141135, -2.865717, 0, 0, 1, 1, 1,
-1.284038, 1.047845, -0.6992908, 1, 0, 0, 1, 1,
-1.284038, -0.3512323, -2.242006, 1, 0, 0, 1, 1,
-1.279936, -0.1413203, -1.049991, 1, 0, 0, 1, 1,
-1.278514, -1.000774, -1.365395, 1, 0, 0, 1, 1,
-1.266808, -1.3318, -1.655116, 1, 0, 0, 1, 1,
-1.246, -0.3002775, -1.767799, 0, 0, 0, 1, 1,
-1.235616, -1.207548, -1.552753, 0, 0, 0, 1, 1,
-1.228872, -0.4612556, -2.497716, 0, 0, 0, 1, 1,
-1.22282, -0.4794843, -0.9173546, 0, 0, 0, 1, 1,
-1.222362, -0.7462631, -3.134079, 0, 0, 0, 1, 1,
-1.221372, -2.157694, -4.556916, 0, 0, 0, 1, 1,
-1.214925, 0.9296847, -0.692041, 0, 0, 0, 1, 1,
-1.209572, -1.224363, -2.292019, 1, 1, 1, 1, 1,
-1.209215, -1.618416, -3.421619, 1, 1, 1, 1, 1,
-1.207451, 0.4734021, -0.7942069, 1, 1, 1, 1, 1,
-1.200969, 0.2159851, -2.27675, 1, 1, 1, 1, 1,
-1.191877, -2.135347, -2.671349, 1, 1, 1, 1, 1,
-1.176099, -0.3595575, -2.3884, 1, 1, 1, 1, 1,
-1.166184, 1.986198, 0.04204395, 1, 1, 1, 1, 1,
-1.162301, -0.7035683, -3.485032, 1, 1, 1, 1, 1,
-1.159759, 0.6818841, -2.094838, 1, 1, 1, 1, 1,
-1.153288, -0.9563426, -2.488531, 1, 1, 1, 1, 1,
-1.149853, 0.3177465, 0.5200919, 1, 1, 1, 1, 1,
-1.142363, 0.8073782, -0.3358794, 1, 1, 1, 1, 1,
-1.133459, -0.03169621, -1.256548, 1, 1, 1, 1, 1,
-1.126755, 1.026719, -0.725287, 1, 1, 1, 1, 1,
-1.117675, 1.127883, -1.22345, 1, 1, 1, 1, 1,
-1.113217, 0.1536732, -2.202316, 0, 0, 1, 1, 1,
-1.106284, -1.68143, -2.982397, 1, 0, 0, 1, 1,
-1.101359, -1.735303, -3.009378, 1, 0, 0, 1, 1,
-1.084032, -0.02101329, -0.6631414, 1, 0, 0, 1, 1,
-1.079974, -0.4004831, -3.190464, 1, 0, 0, 1, 1,
-1.076074, 0.5237935, -2.25278, 1, 0, 0, 1, 1,
-1.07228, 1.197437, 0.3980672, 0, 0, 0, 1, 1,
-1.059383, -0.3360517, -2.492242, 0, 0, 0, 1, 1,
-1.059214, 0.01121064, -2.160466, 0, 0, 0, 1, 1,
-1.048365, 1.018934, -1.738903, 0, 0, 0, 1, 1,
-1.046905, 0.5022156, -0.3340117, 0, 0, 0, 1, 1,
-1.046808, 0.0005757846, -0.4075131, 0, 0, 0, 1, 1,
-1.038347, -1.477703, -3.163366, 0, 0, 0, 1, 1,
-1.037352, 0.3084564, -2.538835, 1, 1, 1, 1, 1,
-1.034127, -1.370151, -2.832307, 1, 1, 1, 1, 1,
-1.030024, -1.367631, -1.814768, 1, 1, 1, 1, 1,
-1.025479, -2.473417, -1.50235, 1, 1, 1, 1, 1,
-1.02288, 2.255661, -0.1918321, 1, 1, 1, 1, 1,
-1.010282, -1.057073, -2.314407, 1, 1, 1, 1, 1,
-1.00637, 0.7437359, -1.623608, 1, 1, 1, 1, 1,
-1.004404, 0.6786444, -1.942801, 1, 1, 1, 1, 1,
-1.00211, 1.435382, 0.2373628, 1, 1, 1, 1, 1,
-0.9947519, 2.073637, 0.07877259, 1, 1, 1, 1, 1,
-0.9933097, 0.5413553, -1.104878, 1, 1, 1, 1, 1,
-0.9920137, 0.2622527, -1.984715, 1, 1, 1, 1, 1,
-0.9771134, 0.1278, -1.064632, 1, 1, 1, 1, 1,
-0.975605, 0.1611799, 0.2533817, 1, 1, 1, 1, 1,
-0.9721445, 0.6755589, -0.2819216, 1, 1, 1, 1, 1,
-0.9718482, 0.4886075, -0.2012789, 0, 0, 1, 1, 1,
-0.9653122, 0.1372234, -1.274832, 1, 0, 0, 1, 1,
-0.9620036, -1.526515, -0.6085092, 1, 0, 0, 1, 1,
-0.9566826, -0.05483596, -1.479095, 1, 0, 0, 1, 1,
-0.9526729, -1.305321, -1.971138, 1, 0, 0, 1, 1,
-0.9489116, 1.06675, -0.2530209, 1, 0, 0, 1, 1,
-0.946312, -0.1578536, -0.7828594, 0, 0, 0, 1, 1,
-0.9445549, 0.5697904, -1.069527, 0, 0, 0, 1, 1,
-0.9419191, -1.256799, -4.12708, 0, 0, 0, 1, 1,
-0.9397384, 0.2708066, -1.723464, 0, 0, 0, 1, 1,
-0.9339153, -0.7007037, -3.609618, 0, 0, 0, 1, 1,
-0.929783, -0.4708009, -2.097783, 0, 0, 0, 1, 1,
-0.9171193, 0.405845, -0.1704063, 0, 0, 0, 1, 1,
-0.916947, 1.782211, 0.5118158, 1, 1, 1, 1, 1,
-0.9163808, -0.1536065, -3.295949, 1, 1, 1, 1, 1,
-0.9154936, -1.634278, -0.2933636, 1, 1, 1, 1, 1,
-0.9145516, 0.3179736, -2.726504, 1, 1, 1, 1, 1,
-0.9094753, 0.9008293, -3.311301, 1, 1, 1, 1, 1,
-0.9094273, -0.3500586, -4.271741, 1, 1, 1, 1, 1,
-0.9048884, -0.09434917, -2.457168, 1, 1, 1, 1, 1,
-0.9016606, -0.3222951, -2.670757, 1, 1, 1, 1, 1,
-0.8997851, 1.482655, -0.5995468, 1, 1, 1, 1, 1,
-0.8798784, 0.5460957, -0.7230853, 1, 1, 1, 1, 1,
-0.8703465, 1.032093, 0.5769035, 1, 1, 1, 1, 1,
-0.866857, -0.3537589, -1.072022, 1, 1, 1, 1, 1,
-0.8665569, -0.3133355, -1.855901, 1, 1, 1, 1, 1,
-0.8591641, 2.91985, -0.2183029, 1, 1, 1, 1, 1,
-0.8547419, -1.548706, -1.795918, 1, 1, 1, 1, 1,
-0.8470191, -0.7720453, -3.554071, 0, 0, 1, 1, 1,
-0.8438666, 1.658117, 1.606634, 1, 0, 0, 1, 1,
-0.8425021, 1.116453, -1.233868, 1, 0, 0, 1, 1,
-0.8409957, -0.1627893, 0.0008392922, 1, 0, 0, 1, 1,
-0.839173, -0.3418254, -2.091339, 1, 0, 0, 1, 1,
-0.8258862, -1.405108, -3.405958, 1, 0, 0, 1, 1,
-0.8249851, -0.4717247, -1.329276, 0, 0, 0, 1, 1,
-0.8241873, 1.759369, -0.437144, 0, 0, 0, 1, 1,
-0.8224567, 0.4183758, -2.112173, 0, 0, 0, 1, 1,
-0.8127727, -0.7352712, -1.46639, 0, 0, 0, 1, 1,
-0.8048834, -1.882387, -2.623724, 0, 0, 0, 1, 1,
-0.8011799, 0.7238246, -1.008868, 0, 0, 0, 1, 1,
-0.7903078, 0.6954336, 0.2985479, 0, 0, 0, 1, 1,
-0.7892133, 1.015309, -0.1988315, 1, 1, 1, 1, 1,
-0.7890984, -0.1643156, -2.618437, 1, 1, 1, 1, 1,
-0.7800699, 0.7556056, -0.5173506, 1, 1, 1, 1, 1,
-0.7750745, 0.1082981, -1.168343, 1, 1, 1, 1, 1,
-0.7712331, -0.0876824, -2.854924, 1, 1, 1, 1, 1,
-0.7711565, 0.9539837, -0.04100398, 1, 1, 1, 1, 1,
-0.7710069, 0.7433298, -2.650504, 1, 1, 1, 1, 1,
-0.7694772, 0.1668203, -2.526678, 1, 1, 1, 1, 1,
-0.7565604, -0.7286887, -2.645447, 1, 1, 1, 1, 1,
-0.752161, -0.8697091, -2.333511, 1, 1, 1, 1, 1,
-0.750465, 1.495736, -1.69725, 1, 1, 1, 1, 1,
-0.7410018, -0.549966, -1.359711, 1, 1, 1, 1, 1,
-0.7408611, -0.2204874, -2.418082, 1, 1, 1, 1, 1,
-0.7389874, 0.4545805, -0.4486701, 1, 1, 1, 1, 1,
-0.7282774, 0.7371858, 0.2199647, 1, 1, 1, 1, 1,
-0.7275633, 0.7480197, 0.9468621, 0, 0, 1, 1, 1,
-0.7266529, -1.204679, -1.935493, 1, 0, 0, 1, 1,
-0.7196397, 0.6591787, -1.279162, 1, 0, 0, 1, 1,
-0.71737, -0.435229, -1.295473, 1, 0, 0, 1, 1,
-0.7138172, -0.6674373, -3.27529, 1, 0, 0, 1, 1,
-0.7115127, 0.5179898, -0.1914065, 1, 0, 0, 1, 1,
-0.7080373, 1.399826, -0.7496536, 0, 0, 0, 1, 1,
-0.702627, 1.63628, -0.7194002, 0, 0, 0, 1, 1,
-0.6980635, -0.6376416, -2.305866, 0, 0, 0, 1, 1,
-0.696963, 0.0699717, -2.175063, 0, 0, 0, 1, 1,
-0.6943864, 1.889657, 0.4053948, 0, 0, 0, 1, 1,
-0.6927506, 0.4923083, -1.798869, 0, 0, 0, 1, 1,
-0.692491, 0.3882325, -0.8488111, 0, 0, 0, 1, 1,
-0.689604, 0.05793602, -0.9542863, 1, 1, 1, 1, 1,
-0.6893221, 1.243902, 0.3892863, 1, 1, 1, 1, 1,
-0.6888115, 0.5282926, -1.634845, 1, 1, 1, 1, 1,
-0.687748, 1.768612, -0.6894493, 1, 1, 1, 1, 1,
-0.6739196, 1.058511, -1.655613, 1, 1, 1, 1, 1,
-0.6722884, 2.428454, -1.920782, 1, 1, 1, 1, 1,
-0.6718809, 0.6487384, 0.4361512, 1, 1, 1, 1, 1,
-0.6685374, -1.041851, -3.373528, 1, 1, 1, 1, 1,
-0.664099, -0.8450872, -1.910893, 1, 1, 1, 1, 1,
-0.6637552, -0.6802487, -2.177434, 1, 1, 1, 1, 1,
-0.6628793, 0.3914302, -2.105663, 1, 1, 1, 1, 1,
-0.6606043, -0.2630793, -2.856081, 1, 1, 1, 1, 1,
-0.6533438, -0.6122752, -1.073108, 1, 1, 1, 1, 1,
-0.6510161, -0.3474874, -3.181462, 1, 1, 1, 1, 1,
-0.6470027, 0.4560663, -1.462861, 1, 1, 1, 1, 1,
-0.6438277, -0.7240152, -1.474452, 0, 0, 1, 1, 1,
-0.640172, 0.8032008, -1.310005, 1, 0, 0, 1, 1,
-0.6388925, 0.2211406, -1.416221, 1, 0, 0, 1, 1,
-0.6378298, -0.9522061, -3.100632, 1, 0, 0, 1, 1,
-0.6357186, 1.317428, -0.6773506, 1, 0, 0, 1, 1,
-0.6321872, -0.3746574, -1.535003, 1, 0, 0, 1, 1,
-0.6267421, -0.2969739, 0.4221914, 0, 0, 0, 1, 1,
-0.624198, 0.3643735, -1.69874, 0, 0, 0, 1, 1,
-0.6156685, 1.697928, -1.838269, 0, 0, 0, 1, 1,
-0.6146575, -0.3520257, -2.286668, 0, 0, 0, 1, 1,
-0.6103013, 1.248904, -2.187469, 0, 0, 0, 1, 1,
-0.6099747, -0.9962278, -3.035906, 0, 0, 0, 1, 1,
-0.6096892, -0.4470041, -0.5948707, 0, 0, 0, 1, 1,
-0.5958544, -1.229216, -3.706131, 1, 1, 1, 1, 1,
-0.5942367, -0.4670343, -3.409547, 1, 1, 1, 1, 1,
-0.5903671, 0.2065276, -0.6462519, 1, 1, 1, 1, 1,
-0.5893487, 0.7921919, -0.002697752, 1, 1, 1, 1, 1,
-0.5794781, 0.8394838, -0.1989077, 1, 1, 1, 1, 1,
-0.5741054, 0.2579853, 1.994928, 1, 1, 1, 1, 1,
-0.5731773, 0.8970031, -0.1924132, 1, 1, 1, 1, 1,
-0.5670375, -0.4044831, -2.976274, 1, 1, 1, 1, 1,
-0.5661782, -0.06332397, -1.775757, 1, 1, 1, 1, 1,
-0.5652146, -0.2948153, -2.791246, 1, 1, 1, 1, 1,
-0.5635097, -0.9329342, -4.787658, 1, 1, 1, 1, 1,
-0.5581148, -0.1822238, -1.793571, 1, 1, 1, 1, 1,
-0.5568802, 1.330263, 0.5901764, 1, 1, 1, 1, 1,
-0.5558768, -0.9528923, -1.923965, 1, 1, 1, 1, 1,
-0.5510508, -1.493435, -2.420416, 1, 1, 1, 1, 1,
-0.5482679, 0.4293932, -2.025467, 0, 0, 1, 1, 1,
-0.5472845, 0.1716094, -2.287634, 1, 0, 0, 1, 1,
-0.5435951, -0.1626455, -1.048454, 1, 0, 0, 1, 1,
-0.5433168, 1.523995, -0.138893, 1, 0, 0, 1, 1,
-0.5422652, -1.246454, -3.089361, 1, 0, 0, 1, 1,
-0.5374233, 1.511734, -0.1009028, 1, 0, 0, 1, 1,
-0.536541, 2.066393, -1.499474, 0, 0, 0, 1, 1,
-0.5349329, -1.076129, -1.254917, 0, 0, 0, 1, 1,
-0.5293548, 0.1307637, -1.922295, 0, 0, 0, 1, 1,
-0.5288703, 0.04728634, -1.418209, 0, 0, 0, 1, 1,
-0.5282493, 0.07580701, -1.570891, 0, 0, 0, 1, 1,
-0.5232445, 0.2640661, 0.06612036, 0, 0, 0, 1, 1,
-0.5195876, -0.5955518, -0.7981924, 0, 0, 0, 1, 1,
-0.5195797, -1.649565, -2.537904, 1, 1, 1, 1, 1,
-0.5167955, -1.861251, -4.915781, 1, 1, 1, 1, 1,
-0.5125477, 0.3677576, -0.4420893, 1, 1, 1, 1, 1,
-0.5119719, 0.5241414, -1.236221, 1, 1, 1, 1, 1,
-0.5081437, 1.316224, -0.9059797, 1, 1, 1, 1, 1,
-0.5073134, -0.06911056, -1.660653, 1, 1, 1, 1, 1,
-0.5034353, 0.5207538, -2.288573, 1, 1, 1, 1, 1,
-0.5015488, -0.2222317, -1.109248, 1, 1, 1, 1, 1,
-0.4979592, -0.3973189, -1.348166, 1, 1, 1, 1, 1,
-0.4914071, 0.9893437, -1.542081, 1, 1, 1, 1, 1,
-0.4896206, -0.727358, -4.00265, 1, 1, 1, 1, 1,
-0.487034, -1.212794, -2.424217, 1, 1, 1, 1, 1,
-0.4860704, -1.208454, 0.1248842, 1, 1, 1, 1, 1,
-0.4835939, 1.769551, -0.7751859, 1, 1, 1, 1, 1,
-0.4818549, -0.622181, -1.958316, 1, 1, 1, 1, 1,
-0.481838, -1.463181, -3.719218, 0, 0, 1, 1, 1,
-0.480228, 1.429944, -0.3284054, 1, 0, 0, 1, 1,
-0.4752441, 0.02399489, -1.83019, 1, 0, 0, 1, 1,
-0.4745353, 0.518479, -1.040984, 1, 0, 0, 1, 1,
-0.4739464, -0.1909073, -2.312072, 1, 0, 0, 1, 1,
-0.4710661, -0.6261222, -3.071062, 1, 0, 0, 1, 1,
-0.4685182, -0.2696049, -1.629421, 0, 0, 0, 1, 1,
-0.4679942, 1.335921, -0.978367, 0, 0, 0, 1, 1,
-0.4607761, 0.08620404, -2.434281, 0, 0, 0, 1, 1,
-0.453726, -0.5343068, -2.568148, 0, 0, 0, 1, 1,
-0.4481172, 2.646708, 0.7594007, 0, 0, 0, 1, 1,
-0.4478487, 0.4493286, -1.077585, 0, 0, 0, 1, 1,
-0.4466983, 0.7681215, 0.7924624, 0, 0, 0, 1, 1,
-0.4466843, 0.1673039, -0.7900293, 1, 1, 1, 1, 1,
-0.4361905, 0.714677, -1.687683, 1, 1, 1, 1, 1,
-0.4347766, 0.6114827, -0.972446, 1, 1, 1, 1, 1,
-0.4312654, 0.7150894, -1.664387, 1, 1, 1, 1, 1,
-0.4291958, 1.042303, -0.5034581, 1, 1, 1, 1, 1,
-0.4291484, 2.890055, -0.5512058, 1, 1, 1, 1, 1,
-0.4274853, -0.2067504, -1.463627, 1, 1, 1, 1, 1,
-0.4246036, 0.7367955, 0.2156141, 1, 1, 1, 1, 1,
-0.4241578, -0.5124674, -4.099871, 1, 1, 1, 1, 1,
-0.4206354, 0.07448804, -0.6816134, 1, 1, 1, 1, 1,
-0.4184675, -2.399494, -3.794474, 1, 1, 1, 1, 1,
-0.4168863, 1.321175, -1.240643, 1, 1, 1, 1, 1,
-0.415468, 0.4049386, -1.06748, 1, 1, 1, 1, 1,
-0.4057119, 1.282741, -0.2276203, 1, 1, 1, 1, 1,
-0.4009004, 0.8730856, -0.4361672, 1, 1, 1, 1, 1,
-0.4002618, -0.08717398, -1.818158, 0, 0, 1, 1, 1,
-0.3985021, 0.1904317, -0.8436427, 1, 0, 0, 1, 1,
-0.392461, -0.3844275, -3.645025, 1, 0, 0, 1, 1,
-0.3875724, 1.29915, 0.7458159, 1, 0, 0, 1, 1,
-0.383705, -1.358709, -2.825991, 1, 0, 0, 1, 1,
-0.3809302, -0.4314837, -1.46473, 1, 0, 0, 1, 1,
-0.3773068, -0.3687979, -5.23087, 0, 0, 0, 1, 1,
-0.3768242, -0.7371472, -2.071718, 0, 0, 0, 1, 1,
-0.3737466, 1.992949, -0.791017, 0, 0, 0, 1, 1,
-0.3689041, 2.290379, 0.1387971, 0, 0, 0, 1, 1,
-0.3655367, -0.1846354, -1.927832, 0, 0, 0, 1, 1,
-0.3655234, 0.5448592, -0.8506753, 0, 0, 0, 1, 1,
-0.3632925, 1.345974, 0.2354014, 0, 0, 0, 1, 1,
-0.3624773, -0.382503, -3.735599, 1, 1, 1, 1, 1,
-0.3574088, -0.7333189, -1.514092, 1, 1, 1, 1, 1,
-0.3559518, -1.59642, -2.294461, 1, 1, 1, 1, 1,
-0.3534907, 0.5336362, -2.131901, 1, 1, 1, 1, 1,
-0.3479665, 1.232995, -1.381406, 1, 1, 1, 1, 1,
-0.3459589, -1.648716, -1.430591, 1, 1, 1, 1, 1,
-0.3458934, 0.2051002, -1.441504, 1, 1, 1, 1, 1,
-0.3454769, 0.7020495, -0.9182985, 1, 1, 1, 1, 1,
-0.3438217, -1.042584, -2.156034, 1, 1, 1, 1, 1,
-0.3396721, -0.6753191, -3.906581, 1, 1, 1, 1, 1,
-0.3374003, 0.1273748, -1.168391, 1, 1, 1, 1, 1,
-0.3371871, 0.2348112, 0.7075518, 1, 1, 1, 1, 1,
-0.3331555, 1.209018, -1.401447, 1, 1, 1, 1, 1,
-0.3227931, -0.2621342, -2.450476, 1, 1, 1, 1, 1,
-0.318108, -0.5977963, -4.003836, 1, 1, 1, 1, 1,
-0.3162867, -2.157975, -3.90587, 0, 0, 1, 1, 1,
-0.3160236, 0.2886558, -1.057161, 1, 0, 0, 1, 1,
-0.3134615, -0.9700615, -3.473997, 1, 0, 0, 1, 1,
-0.3058779, -0.1785881, -1.796621, 1, 0, 0, 1, 1,
-0.3035882, -1.054669, -0.7857834, 1, 0, 0, 1, 1,
-0.2965508, 0.5122728, -1.260237, 1, 0, 0, 1, 1,
-0.2953837, 0.6795252, 0.6616108, 0, 0, 0, 1, 1,
-0.2926227, -1.61371, -2.299057, 0, 0, 0, 1, 1,
-0.2918036, -0.2676429, -1.826384, 0, 0, 0, 1, 1,
-0.2890507, 1.111048, 0.1520754, 0, 0, 0, 1, 1,
-0.2813686, 0.4531101, -0.4476943, 0, 0, 0, 1, 1,
-0.2795675, 0.2173136, 0.1288746, 0, 0, 0, 1, 1,
-0.2792538, 0.9037814, 0.03789217, 0, 0, 0, 1, 1,
-0.2775235, -1.29873, -3.374623, 1, 1, 1, 1, 1,
-0.2762468, 0.4503167, -0.006660541, 1, 1, 1, 1, 1,
-0.2688439, 0.7484506, -0.5245724, 1, 1, 1, 1, 1,
-0.2686497, 0.05789218, 0.06833288, 1, 1, 1, 1, 1,
-0.2674389, 0.8619877, 0.04197986, 1, 1, 1, 1, 1,
-0.2673479, 2.667542, 0.3704105, 1, 1, 1, 1, 1,
-0.2604096, 1.002894, -1.007285, 1, 1, 1, 1, 1,
-0.2580493, -0.503508, -4.12123, 1, 1, 1, 1, 1,
-0.2564284, 0.7253263, -0.1175039, 1, 1, 1, 1, 1,
-0.2552467, 0.8261686, 0.2326329, 1, 1, 1, 1, 1,
-0.2521112, 0.05894029, -2.238056, 1, 1, 1, 1, 1,
-0.2512575, 0.6986646, 0.05285483, 1, 1, 1, 1, 1,
-0.2510201, -0.1130012, -1.319285, 1, 1, 1, 1, 1,
-0.2502064, 0.4130202, -0.2570842, 1, 1, 1, 1, 1,
-0.2454032, 0.1568057, -0.05788086, 1, 1, 1, 1, 1,
-0.2441487, -1.062772, -2.943334, 0, 0, 1, 1, 1,
-0.2420351, 0.3252414, -0.7243838, 1, 0, 0, 1, 1,
-0.2409902, -0.759062, -2.528414, 1, 0, 0, 1, 1,
-0.2383966, -1.034516, -2.068626, 1, 0, 0, 1, 1,
-0.2383834, 1.238149, -0.5608296, 1, 0, 0, 1, 1,
-0.237342, -0.8199841, -2.95444, 1, 0, 0, 1, 1,
-0.2328613, 0.9323021, -1.147543, 0, 0, 0, 1, 1,
-0.2238775, 0.7783632, -0.6218409, 0, 0, 0, 1, 1,
-0.2169968, -0.01064159, -1.886223, 0, 0, 0, 1, 1,
-0.2166006, -0.4144861, -2.936741, 0, 0, 0, 1, 1,
-0.2134041, -0.005650308, -1.613583, 0, 0, 0, 1, 1,
-0.2132046, -1.14904, -3.603202, 0, 0, 0, 1, 1,
-0.2129897, -0.4369809, -2.032856, 0, 0, 0, 1, 1,
-0.2111685, 1.981233, -0.0791873, 1, 1, 1, 1, 1,
-0.2108081, -1.913036, -3.053567, 1, 1, 1, 1, 1,
-0.2105661, 0.8790646, 0.6960511, 1, 1, 1, 1, 1,
-0.2039376, -0.4501743, -2.439674, 1, 1, 1, 1, 1,
-0.2025393, -0.492814, -4.26476, 1, 1, 1, 1, 1,
-0.2019834, 0.472385, -0.270389, 1, 1, 1, 1, 1,
-0.2018947, -0.9300129, -1.601623, 1, 1, 1, 1, 1,
-0.2009159, -1.878487, -2.305999, 1, 1, 1, 1, 1,
-0.1997136, 0.4098649, -1.806739, 1, 1, 1, 1, 1,
-0.198323, 1.678483, 0.1563956, 1, 1, 1, 1, 1,
-0.1976829, -0.1899191, -1.978128, 1, 1, 1, 1, 1,
-0.1967416, 0.8902015, -0.5188257, 1, 1, 1, 1, 1,
-0.195286, 1.181041, 0.04539829, 1, 1, 1, 1, 1,
-0.1923702, -0.7546356, -0.6962492, 1, 1, 1, 1, 1,
-0.1912555, -1.656861, -4.252905, 1, 1, 1, 1, 1,
-0.1911013, 0.2351165, -1.738104, 0, 0, 1, 1, 1,
-0.1906313, 2.561873, -0.4905652, 1, 0, 0, 1, 1,
-0.1891886, -1.555046, -5.076246, 1, 0, 0, 1, 1,
-0.1887835, -0.3834993, -2.298256, 1, 0, 0, 1, 1,
-0.1847146, 0.09053904, -0.1919735, 1, 0, 0, 1, 1,
-0.1834302, 0.0135253, 0.8683469, 1, 0, 0, 1, 1,
-0.1793542, -0.7363369, -1.842956, 0, 0, 0, 1, 1,
-0.1735981, -0.96495, -2.05601, 0, 0, 0, 1, 1,
-0.16998, -1.634556, -2.209938, 0, 0, 0, 1, 1,
-0.1681755, -0.2894464, -4.657224, 0, 0, 0, 1, 1,
-0.1657532, -1.184823, -3.013518, 0, 0, 0, 1, 1,
-0.1626087, -0.4104077, -3.204807, 0, 0, 0, 1, 1,
-0.1545536, -0.399481, -1.7062, 0, 0, 0, 1, 1,
-0.151571, 0.7184198, 0.03535165, 1, 1, 1, 1, 1,
-0.1497941, 0.2301309, -0.6728697, 1, 1, 1, 1, 1,
-0.1496223, 1.451354, -0.6413761, 1, 1, 1, 1, 1,
-0.1407299, -0.08581517, -0.770125, 1, 1, 1, 1, 1,
-0.1348179, -0.9411703, -3.148225, 1, 1, 1, 1, 1,
-0.1347359, -0.5849019, -4.483408, 1, 1, 1, 1, 1,
-0.1346933, 1.556806, -0.1374401, 1, 1, 1, 1, 1,
-0.13329, -0.3991836, -1.738467, 1, 1, 1, 1, 1,
-0.1319749, -1.572571, -2.614743, 1, 1, 1, 1, 1,
-0.12562, -0.1971582, -2.76488, 1, 1, 1, 1, 1,
-0.1248364, 0.9646536, -0.2741364, 1, 1, 1, 1, 1,
-0.1166537, -0.9150748, -3.582023, 1, 1, 1, 1, 1,
-0.1153311, -0.64073, -5.485574, 1, 1, 1, 1, 1,
-0.1115364, 0.1860071, -1.806779, 1, 1, 1, 1, 1,
-0.1114569, 0.06474051, -0.8541703, 1, 1, 1, 1, 1,
-0.1111543, 0.9904973, 1.470975, 0, 0, 1, 1, 1,
-0.1107954, 0.07514855, -0.8768803, 1, 0, 0, 1, 1,
-0.108859, -0.6793663, -1.939841, 1, 0, 0, 1, 1,
-0.1079128, 0.7127771, -0.1105561, 1, 0, 0, 1, 1,
-0.1063197, 0.7317473, 0.4293317, 1, 0, 0, 1, 1,
-0.1015988, -0.6474575, -2.014565, 1, 0, 0, 1, 1,
-0.1002666, 0.4638115, -0.1300946, 0, 0, 0, 1, 1,
-0.09939449, -1.324497, -2.519447, 0, 0, 0, 1, 1,
-0.09611451, -1.518664, -3.656587, 0, 0, 0, 1, 1,
-0.09529521, -1.086762, -2.345064, 0, 0, 0, 1, 1,
-0.09357108, 0.09461755, -0.05485328, 0, 0, 0, 1, 1,
-0.09336096, -0.0272033, -1.936107, 0, 0, 0, 1, 1,
-0.09152657, -1.781522, -2.328007, 0, 0, 0, 1, 1,
-0.08840196, -0.1553048, -2.661133, 1, 1, 1, 1, 1,
-0.08658138, -1.421275, -3.590593, 1, 1, 1, 1, 1,
-0.0841755, 0.5019413, 0.2862489, 1, 1, 1, 1, 1,
-0.07959726, 0.1443632, -0.8500659, 1, 1, 1, 1, 1,
-0.07808767, 1.339475, 0.5584633, 1, 1, 1, 1, 1,
-0.07327002, 0.847995, -0.4558369, 1, 1, 1, 1, 1,
-0.07303896, 1.581996, -0.278983, 1, 1, 1, 1, 1,
-0.07215927, 2.172406, 1.452832, 1, 1, 1, 1, 1,
-0.06913509, 0.4449252, -0.8625314, 1, 1, 1, 1, 1,
-0.06844837, 0.5157058, 0.004225775, 1, 1, 1, 1, 1,
-0.05963644, 0.8578629, 1.8486, 1, 1, 1, 1, 1,
-0.05818331, 0.4992342, 0.2756735, 1, 1, 1, 1, 1,
-0.05045176, -1.000002, -3.17243, 1, 1, 1, 1, 1,
-0.04758265, -0.1369643, -2.476174, 1, 1, 1, 1, 1,
-0.04446185, -0.6421713, -2.080642, 1, 1, 1, 1, 1,
-0.04309564, -0.3819011, -6.444954, 0, 0, 1, 1, 1,
-0.04298529, -1.318048, -3.305826, 1, 0, 0, 1, 1,
-0.04188244, -0.5856826, -1.961402, 1, 0, 0, 1, 1,
-0.0405235, -0.2896568, -2.852509, 1, 0, 0, 1, 1,
-0.0395029, 1.03102, -0.7132838, 1, 0, 0, 1, 1,
-0.03289044, 1.078901, 0.962983, 1, 0, 0, 1, 1,
-0.02795783, -0.4254119, -2.230228, 0, 0, 0, 1, 1,
-0.02586826, 0.2089432, -1.343752, 0, 0, 0, 1, 1,
-0.02535163, 0.3952399, -1.103499, 0, 0, 0, 1, 1,
-0.02092307, 0.1079645, -2.013934, 0, 0, 0, 1, 1,
-0.01834955, 0.2116448, -0.9206193, 0, 0, 0, 1, 1,
-0.01507943, -0.5039226, -3.713175, 0, 0, 0, 1, 1,
-0.01047897, -0.470391, -4.245203, 0, 0, 0, 1, 1,
-0.01008734, 1.799057, 0.4319451, 1, 1, 1, 1, 1,
-0.003341281, 0.2697033, -0.8511661, 1, 1, 1, 1, 1,
-0.002786553, 0.7239776, 0.4379816, 1, 1, 1, 1, 1,
-0.002318275, 0.9192678, -1.029346, 1, 1, 1, 1, 1,
0.005931188, -0.190704, 3.633766, 1, 1, 1, 1, 1,
0.008150558, -0.2256231, 1.187394, 1, 1, 1, 1, 1,
0.00888057, -0.2935311, 4.089339, 1, 1, 1, 1, 1,
0.009070122, -0.7184088, 2.266527, 1, 1, 1, 1, 1,
0.01392676, 0.2023894, 1.498912, 1, 1, 1, 1, 1,
0.01645563, 0.4587587, 1.097445, 1, 1, 1, 1, 1,
0.01834438, 1.305759, -1.070308, 1, 1, 1, 1, 1,
0.01897738, 0.7023132, 0.5019029, 1, 1, 1, 1, 1,
0.02081653, 1.874822, 2.600628, 1, 1, 1, 1, 1,
0.0220576, -0.1068294, 3.754158, 1, 1, 1, 1, 1,
0.02426108, 0.1064528, 0.9902057, 1, 1, 1, 1, 1,
0.0270543, -1.015017, 2.800771, 0, 0, 1, 1, 1,
0.03009932, -0.4583952, 4.583091, 1, 0, 0, 1, 1,
0.03388401, 1.10563, -0.2534685, 1, 0, 0, 1, 1,
0.0360533, -0.1511919, 2.315342, 1, 0, 0, 1, 1,
0.03619006, 0.3536102, 0.5521712, 1, 0, 0, 1, 1,
0.03919525, -0.5375648, 2.484707, 1, 0, 0, 1, 1,
0.04244733, -2.459177, 4.151669, 0, 0, 0, 1, 1,
0.0426391, -0.1267318, 0.7965212, 0, 0, 0, 1, 1,
0.04451878, 1.44104, 1.468023, 0, 0, 0, 1, 1,
0.05146662, -0.2157785, 4.077864, 0, 0, 0, 1, 1,
0.05445533, 0.45689, -0.3228001, 0, 0, 0, 1, 1,
0.05482714, -1.403888, 2.277526, 0, 0, 0, 1, 1,
0.05878906, 1.617688, 1.081691, 0, 0, 0, 1, 1,
0.06090216, 0.6719588, 0.262553, 1, 1, 1, 1, 1,
0.06454721, 0.3709099, -0.4388534, 1, 1, 1, 1, 1,
0.06479177, 0.1321206, 2.574557, 1, 1, 1, 1, 1,
0.06897319, 0.6241472, 0.4181708, 1, 1, 1, 1, 1,
0.07042027, -1.101908, 3.846666, 1, 1, 1, 1, 1,
0.07054847, 0.3930579, -1.620423, 1, 1, 1, 1, 1,
0.07406885, 0.3845577, -1.311791, 1, 1, 1, 1, 1,
0.07497481, -0.02758988, 0.4242171, 1, 1, 1, 1, 1,
0.07517723, 0.3343296, -1.182115, 1, 1, 1, 1, 1,
0.08014516, -1.865189, 3.447015, 1, 1, 1, 1, 1,
0.08446072, 0.1400185, 0.7152272, 1, 1, 1, 1, 1,
0.08508535, 0.561308, -0.2859026, 1, 1, 1, 1, 1,
0.0861363, 0.01279171, 0.6279527, 1, 1, 1, 1, 1,
0.08615076, 2.05685, -1.104586, 1, 1, 1, 1, 1,
0.08738663, -1.589028, 3.782244, 1, 1, 1, 1, 1,
0.08799698, -0.4149397, 4.044465, 0, 0, 1, 1, 1,
0.09156115, -0.2490296, 3.944632, 1, 0, 0, 1, 1,
0.09371144, -0.3235123, 3.132764, 1, 0, 0, 1, 1,
0.09392094, -2.00608, 2.251597, 1, 0, 0, 1, 1,
0.09530207, 1.250291, -0.6750914, 1, 0, 0, 1, 1,
0.09629635, -0.5712578, 3.323764, 1, 0, 0, 1, 1,
0.09960286, 1.68215, -0.2784663, 0, 0, 0, 1, 1,
0.1019001, 0.2734698, 2.761239, 0, 0, 0, 1, 1,
0.1036278, 0.01444703, 0.7157431, 0, 0, 0, 1, 1,
0.1040966, -0.3412828, 2.301176, 0, 0, 0, 1, 1,
0.1085156, -0.1958452, 2.732596, 0, 0, 0, 1, 1,
0.1099141, -0.7582574, 4.035968, 0, 0, 0, 1, 1,
0.1142297, 0.3109503, -1.515411, 0, 0, 0, 1, 1,
0.1158551, 0.6545734, 2.522463, 1, 1, 1, 1, 1,
0.1204566, -0.07936125, 1.272086, 1, 1, 1, 1, 1,
0.1249774, 0.7923729, -1.675035, 1, 1, 1, 1, 1,
0.1294483, -0.05363475, 0.2858793, 1, 1, 1, 1, 1,
0.1327282, -0.6493031, 2.579973, 1, 1, 1, 1, 1,
0.13387, -0.5598186, 3.616214, 1, 1, 1, 1, 1,
0.1345049, -1.566019, 3.72897, 1, 1, 1, 1, 1,
0.1347135, -0.5012631, 2.456795, 1, 1, 1, 1, 1,
0.1348947, 2.887631, -0.1117222, 1, 1, 1, 1, 1,
0.1374745, -0.4989388, 2.959493, 1, 1, 1, 1, 1,
0.1411194, 0.1598675, 0.7691032, 1, 1, 1, 1, 1,
0.1419665, 0.2700255, 0.8166649, 1, 1, 1, 1, 1,
0.1460997, -0.2296749, 5.092374, 1, 1, 1, 1, 1,
0.1461849, 0.5348229, -0.02605293, 1, 1, 1, 1, 1,
0.1527832, 0.4456896, 0.8048552, 1, 1, 1, 1, 1,
0.154954, -0.001975791, 1.656555, 0, 0, 1, 1, 1,
0.159986, -2.13454, 3.817707, 1, 0, 0, 1, 1,
0.1616153, 1.541545, -0.9127913, 1, 0, 0, 1, 1,
0.1616632, -1.492714, 2.298436, 1, 0, 0, 1, 1,
0.1623412, -0.2304879, 3.594911, 1, 0, 0, 1, 1,
0.1663001, 0.2424289, 0.05785396, 1, 0, 0, 1, 1,
0.1674298, 0.7597651, 1.671621, 0, 0, 0, 1, 1,
0.1677756, 0.7525481, -1.526161, 0, 0, 0, 1, 1,
0.1680196, -0.2255457, 0.5591743, 0, 0, 0, 1, 1,
0.1698221, -1.09183, 4.029441, 0, 0, 0, 1, 1,
0.170385, 0.5530412, 1.302593, 0, 0, 0, 1, 1,
0.1715567, 0.8779867, -0.8148912, 0, 0, 0, 1, 1,
0.1717062, 1.31303, 0.04825866, 0, 0, 0, 1, 1,
0.1724019, -0.8073332, 1.740137, 1, 1, 1, 1, 1,
0.1775334, -0.07332931, -0.193486, 1, 1, 1, 1, 1,
0.1780774, -1.249064, 2.957932, 1, 1, 1, 1, 1,
0.1792206, 1.445834, 0.5847849, 1, 1, 1, 1, 1,
0.1823988, -0.9346355, 2.726743, 1, 1, 1, 1, 1,
0.1869175, 0.7691827, 1.826059, 1, 1, 1, 1, 1,
0.188231, 1.176336, 0.6821125, 1, 1, 1, 1, 1,
0.1894085, 0.6903454, -1.32575, 1, 1, 1, 1, 1,
0.1907058, -0.4743657, 1.954265, 1, 1, 1, 1, 1,
0.1943032, -0.3957964, 3.179575, 1, 1, 1, 1, 1,
0.1961195, -1.23417, 5.756732, 1, 1, 1, 1, 1,
0.1972689, -0.3743585, 1.201876, 1, 1, 1, 1, 1,
0.1979834, 0.487597, 0.3886543, 1, 1, 1, 1, 1,
0.1983856, -0.7182928, 2.098016, 1, 1, 1, 1, 1,
0.2028147, 0.9561259, 0.416572, 1, 1, 1, 1, 1,
0.2034836, -0.05261806, 2.417761, 0, 0, 1, 1, 1,
0.2045031, 1.534795, -0.7716314, 1, 0, 0, 1, 1,
0.2055297, -1.021267, 3.082746, 1, 0, 0, 1, 1,
0.2092328, -2.34941, 2.951444, 1, 0, 0, 1, 1,
0.2203681, 0.2367309, 1.016462, 1, 0, 0, 1, 1,
0.224262, -1.04928, 3.193657, 1, 0, 0, 1, 1,
0.229824, 0.129525, 1.305225, 0, 0, 0, 1, 1,
0.2303778, -1.366358, 3.307724, 0, 0, 0, 1, 1,
0.2312776, 0.7878665, -0.6982805, 0, 0, 0, 1, 1,
0.2315172, -0.7997448, 3.338648, 0, 0, 0, 1, 1,
0.231737, 2.240175, -1.192147, 0, 0, 0, 1, 1,
0.2335076, -0.7318785, 2.892025, 0, 0, 0, 1, 1,
0.2352002, 0.551837, -1.215363, 0, 0, 0, 1, 1,
0.2360716, -1.675225, 2.306884, 1, 1, 1, 1, 1,
0.237518, 1.153435, 0.3363174, 1, 1, 1, 1, 1,
0.2404526, 0.2532513, 0.788534, 1, 1, 1, 1, 1,
0.2428186, -1.813323, 1.178396, 1, 1, 1, 1, 1,
0.2435209, 1.619583, 0.9025187, 1, 1, 1, 1, 1,
0.245172, -0.4574531, 3.896548, 1, 1, 1, 1, 1,
0.2497218, -0.0531873, 1.623775, 1, 1, 1, 1, 1,
0.2593035, -2.163934, 2.54929, 1, 1, 1, 1, 1,
0.2613124, 1.064509, 1.214715, 1, 1, 1, 1, 1,
0.2624664, -1.221298, 2.916633, 1, 1, 1, 1, 1,
0.2666278, 1.493158, 0.1360161, 1, 1, 1, 1, 1,
0.2697012, -0.3174706, 2.219062, 1, 1, 1, 1, 1,
0.2704078, -0.3915888, 3.139022, 1, 1, 1, 1, 1,
0.2724366, -1.508809, 2.551356, 1, 1, 1, 1, 1,
0.2741334, 1.9273, 1.594716, 1, 1, 1, 1, 1,
0.2744026, -1.242201, 3.983739, 0, 0, 1, 1, 1,
0.2747008, 0.3494885, 1.817123, 1, 0, 0, 1, 1,
0.278947, -0.5894635, 2.884194, 1, 0, 0, 1, 1,
0.2802852, 0.5410757, 0.7399638, 1, 0, 0, 1, 1,
0.283851, 1.321881, 0.4221823, 1, 0, 0, 1, 1,
0.2850791, 0.82344, -0.6371028, 1, 0, 0, 1, 1,
0.2853709, 0.1578688, 0.8245925, 0, 0, 0, 1, 1,
0.2885771, 0.9459516, -0.9866042, 0, 0, 0, 1, 1,
0.2886276, 0.06017964, 2.178818, 0, 0, 0, 1, 1,
0.2960766, -0.729663, 2.155543, 0, 0, 0, 1, 1,
0.2964411, -0.4736026, 4.290191, 0, 0, 0, 1, 1,
0.2981302, -0.7864258, 1.830589, 0, 0, 0, 1, 1,
0.3044873, 0.7761953, 0.5535524, 0, 0, 0, 1, 1,
0.3049133, 0.6414558, 1.052455, 1, 1, 1, 1, 1,
0.3076234, 0.0950114, -1.039237, 1, 1, 1, 1, 1,
0.3086176, 0.4937681, -0.4749067, 1, 1, 1, 1, 1,
0.3092574, -0.3066502, 3.083027, 1, 1, 1, 1, 1,
0.3134553, 0.7952732, 1.123392, 1, 1, 1, 1, 1,
0.3235294, -0.4265665, 4.020638, 1, 1, 1, 1, 1,
0.3238888, -1.455451, 3.98511, 1, 1, 1, 1, 1,
0.3240758, -0.1867727, 1.969293, 1, 1, 1, 1, 1,
0.325891, -1.554204, 4.025846, 1, 1, 1, 1, 1,
0.3271766, -1.498121, 2.150355, 1, 1, 1, 1, 1,
0.3271854, -0.8383288, 2.767197, 1, 1, 1, 1, 1,
0.3330575, -0.2684062, 2.206091, 1, 1, 1, 1, 1,
0.3337018, -1.323795, 3.334144, 1, 1, 1, 1, 1,
0.3337938, -0.4380281, 2.578103, 1, 1, 1, 1, 1,
0.3361043, 0.9713348, 0.9013922, 1, 1, 1, 1, 1,
0.3408238, -0.6785676, 2.52722, 0, 0, 1, 1, 1,
0.3422818, 0.49284, 1.532241, 1, 0, 0, 1, 1,
0.3512701, 0.7107933, -1.06042, 1, 0, 0, 1, 1,
0.353395, -0.5199738, 3.238375, 1, 0, 0, 1, 1,
0.3563469, -1.428067, 4.110186, 1, 0, 0, 1, 1,
0.3564824, 0.7765271, -1.828046, 1, 0, 0, 1, 1,
0.364157, -0.7400056, 1.781634, 0, 0, 0, 1, 1,
0.3705313, -0.692964, 1.342723, 0, 0, 0, 1, 1,
0.3715546, 0.04694778, 0.3220367, 0, 0, 0, 1, 1,
0.3718374, -0.2019899, 2.348204, 0, 0, 0, 1, 1,
0.3721182, -0.7018951, 2.548675, 0, 0, 0, 1, 1,
0.3745891, -0.05280821, 1.5619, 0, 0, 0, 1, 1,
0.3751864, 0.581218, 1.797459, 0, 0, 0, 1, 1,
0.3800644, -0.6444277, 3.53902, 1, 1, 1, 1, 1,
0.3810762, 0.5529262, 1.515497, 1, 1, 1, 1, 1,
0.3870438, 0.6859313, -0.3932612, 1, 1, 1, 1, 1,
0.3903925, -0.5341761, 2.097929, 1, 1, 1, 1, 1,
0.393764, -1.357562, 2.87859, 1, 1, 1, 1, 1,
0.3993235, 0.05527968, 1.744865, 1, 1, 1, 1, 1,
0.4067371, 0.08943222, 0.4703351, 1, 1, 1, 1, 1,
0.4068452, 1.146003, 1.691098, 1, 1, 1, 1, 1,
0.4075333, -0.8744166, 2.813949, 1, 1, 1, 1, 1,
0.4076822, 0.1023896, 0.7807298, 1, 1, 1, 1, 1,
0.4097853, -0.03090555, 1.130664, 1, 1, 1, 1, 1,
0.4107577, -0.09724627, 1.221868, 1, 1, 1, 1, 1,
0.4123994, -0.8229066, 1.557547, 1, 1, 1, 1, 1,
0.4152713, -2.110624, 3.769473, 1, 1, 1, 1, 1,
0.4162607, -0.503146, 2.003766, 1, 1, 1, 1, 1,
0.4189552, 0.8897029, 1.435015, 0, 0, 1, 1, 1,
0.4194538, -0.849035, 3.438179, 1, 0, 0, 1, 1,
0.4224641, 0.1246503, 0.63432, 1, 0, 0, 1, 1,
0.4232051, 0.9618553, 0.1215433, 1, 0, 0, 1, 1,
0.4243183, -0.8195031, 2.25108, 1, 0, 0, 1, 1,
0.4250909, 1.045012, -0.1900066, 1, 0, 0, 1, 1,
0.4376304, 0.09885577, 2.092597, 0, 0, 0, 1, 1,
0.44163, 0.7968058, -0.5566134, 0, 0, 0, 1, 1,
0.4445233, 0.1160463, 1.130132, 0, 0, 0, 1, 1,
0.4498589, 0.08496446, 0.4883491, 0, 0, 0, 1, 1,
0.4560926, 1.025884, -0.5134016, 0, 0, 0, 1, 1,
0.4566434, 1.518221, -2.918116, 0, 0, 0, 1, 1,
0.4683067, -0.8214765, 5.963245, 0, 0, 0, 1, 1,
0.4694377, 1.178042, 0.5603206, 1, 1, 1, 1, 1,
0.4733636, -1.146093, 3.550735, 1, 1, 1, 1, 1,
0.47406, -1.273478, 2.801767, 1, 1, 1, 1, 1,
0.4743813, -0.1782464, 0.5187111, 1, 1, 1, 1, 1,
0.4782433, 0.6301171, -1.051366, 1, 1, 1, 1, 1,
0.4926015, -0.2218306, 1.553064, 1, 1, 1, 1, 1,
0.4944161, -0.2843942, 2.538738, 1, 1, 1, 1, 1,
0.5023338, 0.2430966, 1.678506, 1, 1, 1, 1, 1,
0.5026721, -0.4941815, 1.724645, 1, 1, 1, 1, 1,
0.5104348, -1.260124, 2.415344, 1, 1, 1, 1, 1,
0.5117041, -1.146404, 3.203731, 1, 1, 1, 1, 1,
0.5128899, 0.871563, 1.089946, 1, 1, 1, 1, 1,
0.5183483, 0.4982618, 0.5712099, 1, 1, 1, 1, 1,
0.5194533, 0.2366999, 2.017136, 1, 1, 1, 1, 1,
0.5230348, -0.3184167, 1.235505, 1, 1, 1, 1, 1,
0.5258737, 1.184434, -0.404963, 0, 0, 1, 1, 1,
0.5259951, -0.09024376, 0.8386718, 1, 0, 0, 1, 1,
0.5264073, -1.682837, 2.053966, 1, 0, 0, 1, 1,
0.5272497, 0.906048, 1.197275, 1, 0, 0, 1, 1,
0.5276024, 1.020323, 0.7743945, 1, 0, 0, 1, 1,
0.5278541, 0.7902805, -0.1342721, 1, 0, 0, 1, 1,
0.5289648, 0.9941472, -0.1891869, 0, 0, 0, 1, 1,
0.5304607, 0.6247518, 1.390021, 0, 0, 0, 1, 1,
0.5310297, 1.144805, 0.04510318, 0, 0, 0, 1, 1,
0.5370007, -0.8652859, 1.278318, 0, 0, 0, 1, 1,
0.5395995, 0.236746, 2.002372, 0, 0, 0, 1, 1,
0.5411476, 2.746635, 0.1987506, 0, 0, 0, 1, 1,
0.5413504, -0.2075999, 1.76839, 0, 0, 0, 1, 1,
0.541946, 0.3087499, 0.9450915, 1, 1, 1, 1, 1,
0.5455949, -0.5482106, 1.31725, 1, 1, 1, 1, 1,
0.5478952, 1.597213, 0.4426702, 1, 1, 1, 1, 1,
0.548683, -0.4862397, 2.470237, 1, 1, 1, 1, 1,
0.5494096, -1.457631, 2.264831, 1, 1, 1, 1, 1,
0.5500271, 0.8101456, 0.72457, 1, 1, 1, 1, 1,
0.55049, -0.4098927, 1.362658, 1, 1, 1, 1, 1,
0.5566824, 0.6951569, 1.006746, 1, 1, 1, 1, 1,
0.5584237, -0.4062417, 0.2048708, 1, 1, 1, 1, 1,
0.5589762, -0.8384421, 2.950672, 1, 1, 1, 1, 1,
0.5592995, -1.292895, 2.869403, 1, 1, 1, 1, 1,
0.5609865, -0.5922776, 3.411469, 1, 1, 1, 1, 1,
0.5649251, -0.1670576, 3.500161, 1, 1, 1, 1, 1,
0.5664994, -1.571334, 3.265712, 1, 1, 1, 1, 1,
0.569735, 1.122189, 3.324935, 1, 1, 1, 1, 1,
0.5829269, 1.026302, 1.965249, 0, 0, 1, 1, 1,
0.5882289, -1.288318, 1.989267, 1, 0, 0, 1, 1,
0.5886825, 1.210616, 2.57497, 1, 0, 0, 1, 1,
0.5905532, -0.7330912, 2.549505, 1, 0, 0, 1, 1,
0.5925243, 1.325332, 0.1007054, 1, 0, 0, 1, 1,
0.59599, 0.6505727, 0.4119021, 1, 0, 0, 1, 1,
0.596568, 1.389747, 0.7802175, 0, 0, 0, 1, 1,
0.5987571, 0.5839545, 2.570358, 0, 0, 0, 1, 1,
0.6000026, 0.02019791, -0.4603491, 0, 0, 0, 1, 1,
0.6001128, 0.5055658, -0.8232324, 0, 0, 0, 1, 1,
0.601315, 1.090439, 0.8873086, 0, 0, 0, 1, 1,
0.6015363, 0.3925582, 1.095171, 0, 0, 0, 1, 1,
0.6025417, 1.258164, -0.5141482, 0, 0, 0, 1, 1,
0.6044985, 0.09366149, 3.735102, 1, 1, 1, 1, 1,
0.6053213, -0.8091143, 2.884655, 1, 1, 1, 1, 1,
0.6065534, -0.2816724, 2.586664, 1, 1, 1, 1, 1,
0.6115175, 0.6773244, 2.14685, 1, 1, 1, 1, 1,
0.6130534, 0.108221, 1.341369, 1, 1, 1, 1, 1,
0.6152712, 0.9285485, 0.9986103, 1, 1, 1, 1, 1,
0.6175914, 0.2060681, 0.8217826, 1, 1, 1, 1, 1,
0.6197815, -1.557148, 1.96707, 1, 1, 1, 1, 1,
0.6210322, -0.4015847, 1.90469, 1, 1, 1, 1, 1,
0.6219665, -0.2798117, 3.629222, 1, 1, 1, 1, 1,
0.6242078, -0.6548223, 0.7720711, 1, 1, 1, 1, 1,
0.629756, -0.6636418, 1.577171, 1, 1, 1, 1, 1,
0.6303624, -0.1694283, 2.841045, 1, 1, 1, 1, 1,
0.6319855, -0.3685962, 1.996654, 1, 1, 1, 1, 1,
0.632937, 0.240602, 1.663082, 1, 1, 1, 1, 1,
0.6367097, 1.702105, 0.9452702, 0, 0, 1, 1, 1,
0.6412892, 0.1749481, 0.643971, 1, 0, 0, 1, 1,
0.6436024, -0.1260496, 1.324899, 1, 0, 0, 1, 1,
0.6492088, -1.440956, 2.718642, 1, 0, 0, 1, 1,
0.6497924, 0.5032209, 0.3776919, 1, 0, 0, 1, 1,
0.6575195, -0.777133, 2.754682, 1, 0, 0, 1, 1,
0.6660091, 2.446846, 0.7558283, 0, 0, 0, 1, 1,
0.669256, -0.1453889, 2.834214, 0, 0, 0, 1, 1,
0.6696633, -0.6721452, 0.1503381, 0, 0, 0, 1, 1,
0.6719158, -0.5594389, 1.398971, 0, 0, 0, 1, 1,
0.6758261, -0.9641235, 2.246876, 0, 0, 0, 1, 1,
0.6800715, -1.808933, 1.562891, 0, 0, 0, 1, 1,
0.6866521, -0.6870595, 2.42055, 0, 0, 0, 1, 1,
0.688519, -0.7872356, 2.795972, 1, 1, 1, 1, 1,
0.6889964, -1.530626, 2.1676, 1, 1, 1, 1, 1,
0.6919383, 1.418888, -0.1962372, 1, 1, 1, 1, 1,
0.6964781, -0.6996168, 1.139195, 1, 1, 1, 1, 1,
0.6971793, -2.107742, 3.587092, 1, 1, 1, 1, 1,
0.6997032, -1.735358, 3.523008, 1, 1, 1, 1, 1,
0.7008887, 0.2203048, 1.053902, 1, 1, 1, 1, 1,
0.7058803, -1.295019, 0.9114658, 1, 1, 1, 1, 1,
0.7075763, 0.0597729, 2.089967, 1, 1, 1, 1, 1,
0.7109852, 1.319251, -0.007779813, 1, 1, 1, 1, 1,
0.7147476, -1.053373, 2.934781, 1, 1, 1, 1, 1,
0.7162702, 0.9304262, 1.166643, 1, 1, 1, 1, 1,
0.7206732, 0.217006, 2.099766, 1, 1, 1, 1, 1,
0.7226148, 0.4974322, 0.7496228, 1, 1, 1, 1, 1,
0.7233346, 0.9059689, 1.190359, 1, 1, 1, 1, 1,
0.7260422, -0.3744692, 0.5452855, 0, 0, 1, 1, 1,
0.7270871, -0.4468845, 2.459819, 1, 0, 0, 1, 1,
0.7296247, 0.1814743, 3.142726, 1, 0, 0, 1, 1,
0.7307966, 0.5261151, -0.003060066, 1, 0, 0, 1, 1,
0.7313704, -1.419395, 1.399058, 1, 0, 0, 1, 1,
0.7318304, 1.056035, 1.220953, 1, 0, 0, 1, 1,
0.7336991, 1.039511, -0.4349402, 0, 0, 0, 1, 1,
0.7378632, 0.6589955, 0.8075786, 0, 0, 0, 1, 1,
0.7385868, -0.7511339, 2.28706, 0, 0, 0, 1, 1,
0.7439604, -2.626407, 2.082297, 0, 0, 0, 1, 1,
0.7440448, -1.636073, 3.301929, 0, 0, 0, 1, 1,
0.7442862, 1.132506, 2.247208, 0, 0, 0, 1, 1,
0.7478403, -1.335999, 2.554599, 0, 0, 0, 1, 1,
0.7497538, 0.5510157, 0.3739968, 1, 1, 1, 1, 1,
0.7647033, -0.6202429, 2.310242, 1, 1, 1, 1, 1,
0.7718167, 0.1147952, 1.996846, 1, 1, 1, 1, 1,
0.7738266, 0.6624552, 2.462998, 1, 1, 1, 1, 1,
0.7764629, 0.591746, 0.6443406, 1, 1, 1, 1, 1,
0.7782825, -0.6003889, 2.147858, 1, 1, 1, 1, 1,
0.7853299, 0.2336494, 2.654085, 1, 1, 1, 1, 1,
0.7876009, -0.637333, 2.056579, 1, 1, 1, 1, 1,
0.7887985, -0.5183522, 1.676843, 1, 1, 1, 1, 1,
0.7925639, -0.8479847, 2.655809, 1, 1, 1, 1, 1,
0.7931426, 1.123883, 2.012282, 1, 1, 1, 1, 1,
0.7973143, -1.328503, 3.704043, 1, 1, 1, 1, 1,
0.7976214, 1.189971, 1.088071, 1, 1, 1, 1, 1,
0.8017919, -0.4045181, 4.517881, 1, 1, 1, 1, 1,
0.8019507, -0.6941217, 1.705297, 1, 1, 1, 1, 1,
0.8054379, -1.051183, 2.872707, 0, 0, 1, 1, 1,
0.8072419, -2.025499, 2.66497, 1, 0, 0, 1, 1,
0.8197381, -0.1328856, 1.481603, 1, 0, 0, 1, 1,
0.8226511, -1.366694, 3.460385, 1, 0, 0, 1, 1,
0.8242032, -0.05134597, 1.087728, 1, 0, 0, 1, 1,
0.8258911, -1.046295, 3.45404, 1, 0, 0, 1, 1,
0.8323098, 0.02465849, 2.328837, 0, 0, 0, 1, 1,
0.8329055, -1.546958, 2.28679, 0, 0, 0, 1, 1,
0.8387577, -1.321046, 3.604319, 0, 0, 0, 1, 1,
0.8391135, 0.583156, 0.2834437, 0, 0, 0, 1, 1,
0.8415987, -0.7170703, 3.107628, 0, 0, 0, 1, 1,
0.8423025, 0.1759715, 1.668929, 0, 0, 0, 1, 1,
0.8450666, -0.8335767, 1.465267, 0, 0, 0, 1, 1,
0.8482822, -0.3122435, 2.349174, 1, 1, 1, 1, 1,
0.848731, -1.228058, 1.332412, 1, 1, 1, 1, 1,
0.851122, -0.1148813, 1.203519, 1, 1, 1, 1, 1,
0.8513177, -0.5491193, 2.091989, 1, 1, 1, 1, 1,
0.8588341, 0.7058289, 1.518703, 1, 1, 1, 1, 1,
0.864952, -0.05277661, 1.474573, 1, 1, 1, 1, 1,
0.8669155, -0.6990097, 1.674091, 1, 1, 1, 1, 1,
0.869885, 0.3830193, 0.5849575, 1, 1, 1, 1, 1,
0.8734739, 0.4667618, 0.4413886, 1, 1, 1, 1, 1,
0.8771926, 0.9608383, -0.3373162, 1, 1, 1, 1, 1,
0.8818071, -0.7295659, 1.609295, 1, 1, 1, 1, 1,
0.8825673, 1.131125, 0.9384316, 1, 1, 1, 1, 1,
0.901741, -0.5824736, 2.700692, 1, 1, 1, 1, 1,
0.902254, -0.2078132, 0.3940906, 1, 1, 1, 1, 1,
0.903657, -0.4226531, 2.513555, 1, 1, 1, 1, 1,
0.9046489, 2.217593, -0.4857841, 0, 0, 1, 1, 1,
0.9066295, 0.6788598, 0.5031522, 1, 0, 0, 1, 1,
0.9097629, -0.5855749, 1.27107, 1, 0, 0, 1, 1,
0.9122995, 0.8088953, 1.125059, 1, 0, 0, 1, 1,
0.9197831, -0.0902429, 2.217651, 1, 0, 0, 1, 1,
0.9202238, -1.647753, 1.237556, 1, 0, 0, 1, 1,
0.923149, -0.4257345, 2.508375, 0, 0, 0, 1, 1,
0.9287448, -0.01344415, 1.35172, 0, 0, 0, 1, 1,
0.9292588, -1.332141, 1.789234, 0, 0, 0, 1, 1,
0.9344109, 2.317292, 1.493737, 0, 0, 0, 1, 1,
0.9348001, -0.7746649, 2.381146, 0, 0, 0, 1, 1,
0.9394923, -0.85794, 1.5393, 0, 0, 0, 1, 1,
0.9395247, -1.669538, 3.471222, 0, 0, 0, 1, 1,
0.9427363, 0.7097775, 0.7937022, 1, 1, 1, 1, 1,
0.94351, 0.7200866, -0.4163253, 1, 1, 1, 1, 1,
0.945473, 0.6487175, 1.188354, 1, 1, 1, 1, 1,
0.9482735, -0.641625, 2.705376, 1, 1, 1, 1, 1,
0.9509211, -1.136781, 3.189016, 1, 1, 1, 1, 1,
0.9515011, 0.6590279, 1.856148, 1, 1, 1, 1, 1,
0.9561747, 0.05328265, 1.448628, 1, 1, 1, 1, 1,
0.9589045, 0.2603116, 1.312005, 1, 1, 1, 1, 1,
0.9591379, -0.9449889, 2.257703, 1, 1, 1, 1, 1,
0.9609045, -0.9503653, 1.700956, 1, 1, 1, 1, 1,
0.9661645, -0.5475944, 4.213484, 1, 1, 1, 1, 1,
0.9703395, -0.1477987, 2.062942, 1, 1, 1, 1, 1,
0.9711569, -1.076151, 1.636778, 1, 1, 1, 1, 1,
0.9715885, -1.827496, 1.648104, 1, 1, 1, 1, 1,
0.9725723, 0.1429329, 1.668927, 1, 1, 1, 1, 1,
0.9749529, -0.7772249, 2.802399, 0, 0, 1, 1, 1,
0.9853286, -0.8364412, 3.229195, 1, 0, 0, 1, 1,
0.9936658, -0.7026778, 1.9398, 1, 0, 0, 1, 1,
0.9936808, 1.447118, 1.843204, 1, 0, 0, 1, 1,
0.9982337, -0.8658849, 1.242853, 1, 0, 0, 1, 1,
0.9990767, -1.615743, 2.099038, 1, 0, 0, 1, 1,
1.005165, -0.1243364, 1.90764, 0, 0, 0, 1, 1,
1.008736, -0.4193473, 3.792476, 0, 0, 0, 1, 1,
1.009581, -0.977258, 3.469048, 0, 0, 0, 1, 1,
1.01032, 0.424064, 0.5482645, 0, 0, 0, 1, 1,
1.012724, 2.069267, -0.2905727, 0, 0, 0, 1, 1,
1.015591, -1.930497, 2.550976, 0, 0, 0, 1, 1,
1.023721, 0.4424137, -0.4732212, 0, 0, 0, 1, 1,
1.025627, -1.652289, 3.035884, 1, 1, 1, 1, 1,
1.027615, 0.8858668, -0.1632453, 1, 1, 1, 1, 1,
1.03009, 0.1134954, 1.841753, 1, 1, 1, 1, 1,
1.031995, -1.841009, 3.627529, 1, 1, 1, 1, 1,
1.0491, 1.634132, 0.02229443, 1, 1, 1, 1, 1,
1.050504, -0.7146528, 1.186841, 1, 1, 1, 1, 1,
1.05112, 1.460746, 0.02412097, 1, 1, 1, 1, 1,
1.054957, 1.115917, 3.371573, 1, 1, 1, 1, 1,
1.061794, 0.9114195, -0.363932, 1, 1, 1, 1, 1,
1.062708, -0.2285847, 2.391749, 1, 1, 1, 1, 1,
1.069592, -1.249838, 0.3455268, 1, 1, 1, 1, 1,
1.070338, 0.5651605, 3.096026, 1, 1, 1, 1, 1,
1.084515, 0.3082614, 2.604707, 1, 1, 1, 1, 1,
1.091403, 0.1532932, 1.035824, 1, 1, 1, 1, 1,
1.094145, -2.04361, 2.513582, 1, 1, 1, 1, 1,
1.098222, -1.428766, 1.417307, 0, 0, 1, 1, 1,
1.111297, 1.371456, -0.2489241, 1, 0, 0, 1, 1,
1.1113, -1.010518, 1.284321, 1, 0, 0, 1, 1,
1.111428, -0.7799751, 1.074008, 1, 0, 0, 1, 1,
1.114166, -0.4493218, 0.9674245, 1, 0, 0, 1, 1,
1.116094, 1.193873, 0.5097466, 1, 0, 0, 1, 1,
1.11697, -0.3452813, 1.613881, 0, 0, 0, 1, 1,
1.119968, -0.4187014, 2.052511, 0, 0, 0, 1, 1,
1.127766, 1.54267, 0.9400662, 0, 0, 0, 1, 1,
1.132487, 0.5331176, -0.525988, 0, 0, 0, 1, 1,
1.142424, 0.3867311, 0.9461035, 0, 0, 0, 1, 1,
1.149377, 0.9058484, 0.8145555, 0, 0, 0, 1, 1,
1.154202, -0.1359177, 0.7245263, 0, 0, 0, 1, 1,
1.157341, 1.231832, 1.29361, 1, 1, 1, 1, 1,
1.159479, -0.4956002, 1.513038, 1, 1, 1, 1, 1,
1.163441, -0.5378833, 1.723369, 1, 1, 1, 1, 1,
1.165233, -0.375129, 2.11836, 1, 1, 1, 1, 1,
1.167803, -0.3726209, 1.876303, 1, 1, 1, 1, 1,
1.168688, 0.1164851, 0.3586484, 1, 1, 1, 1, 1,
1.169404, 0.8219041, 0.8186868, 1, 1, 1, 1, 1,
1.172076, -1.30123, 2.859409, 1, 1, 1, 1, 1,
1.180233, 0.7905613, 0.8961576, 1, 1, 1, 1, 1,
1.181961, -0.7907115, 2.583014, 1, 1, 1, 1, 1,
1.185225, 1.060358, 2.232796, 1, 1, 1, 1, 1,
1.198053, 0.6697518, 0.3847382, 1, 1, 1, 1, 1,
1.20301, -1.048191, 2.904784, 1, 1, 1, 1, 1,
1.210447, 0.4961355, -1.370278, 1, 1, 1, 1, 1,
1.216933, 0.8776992, 0.2333373, 1, 1, 1, 1, 1,
1.218599, 0.5773247, -0.07446337, 0, 0, 1, 1, 1,
1.218631, 1.366825, -0.1206264, 1, 0, 0, 1, 1,
1.221203, 0.821934, 2.210732, 1, 0, 0, 1, 1,
1.224458, 0.4704722, 0.9667914, 1, 0, 0, 1, 1,
1.240154, 1.667377, 2.280956, 1, 0, 0, 1, 1,
1.246675, -0.1596066, 2.470344, 1, 0, 0, 1, 1,
1.246796, -0.4220633, 0.4315604, 0, 0, 0, 1, 1,
1.246848, -0.5761794, 0.2801202, 0, 0, 0, 1, 1,
1.252239, 0.6200057, 1.706267, 0, 0, 0, 1, 1,
1.255334, 0.1860375, 1.624398, 0, 0, 0, 1, 1,
1.256679, 0.8890372, 1.125156, 0, 0, 0, 1, 1,
1.257936, -0.9107288, 1.491756, 0, 0, 0, 1, 1,
1.259376, 1.498066, -0.05808417, 0, 0, 0, 1, 1,
1.273078, 0.7280263, 0.9836826, 1, 1, 1, 1, 1,
1.278762, 0.4292915, 2.730584, 1, 1, 1, 1, 1,
1.283848, -0.236079, 2.855543, 1, 1, 1, 1, 1,
1.287672, -0.5928444, 0.1496006, 1, 1, 1, 1, 1,
1.28892, 3.007339, 1.843864, 1, 1, 1, 1, 1,
1.290856, -1.885389, 1.897454, 1, 1, 1, 1, 1,
1.297999, 2.708452, 0.9780915, 1, 1, 1, 1, 1,
1.302506, 2.331532, -0.1444473, 1, 1, 1, 1, 1,
1.307291, 1.72065, 0.768114, 1, 1, 1, 1, 1,
1.31203, 2.272383, -2.236474, 1, 1, 1, 1, 1,
1.313291, 1.019366, 0.9321334, 1, 1, 1, 1, 1,
1.317087, 0.9756295, 0.9845757, 1, 1, 1, 1, 1,
1.328771, -0.3098323, 2.002522, 1, 1, 1, 1, 1,
1.335885, -2.085426, 3.276816, 1, 1, 1, 1, 1,
1.354156, -0.1966372, 3.304603, 1, 1, 1, 1, 1,
1.373217, -1.327758, 0.6977016, 0, 0, 1, 1, 1,
1.384479, 0.4448248, 0.9566115, 1, 0, 0, 1, 1,
1.386001, 0.01522452, -0.6517352, 1, 0, 0, 1, 1,
1.412314, -1.716699, 0.8294466, 1, 0, 0, 1, 1,
1.414675, -0.2723102, 2.79154, 1, 0, 0, 1, 1,
1.416963, 0.0519186, 2.424901, 1, 0, 0, 1, 1,
1.428556, 0.02619855, 2.920953, 0, 0, 0, 1, 1,
1.430149, 1.045107, 2.241042, 0, 0, 0, 1, 1,
1.449318, 2.477219, 1.837885, 0, 0, 0, 1, 1,
1.462075, 1.195721, 2.060315, 0, 0, 0, 1, 1,
1.472354, 0.2784475, 1.128721, 0, 0, 0, 1, 1,
1.484545, -0.4333474, 1.946869, 0, 0, 0, 1, 1,
1.502476, 0.3551528, 2.157401, 0, 0, 0, 1, 1,
1.508217, 0.2336709, 0.2280124, 1, 1, 1, 1, 1,
1.509083, 0.03213399, -0.374434, 1, 1, 1, 1, 1,
1.51535, -0.03941137, 0.7059462, 1, 1, 1, 1, 1,
1.518359, 0.0614824, 2.260925, 1, 1, 1, 1, 1,
1.530563, 0.7436242, 0.2066377, 1, 1, 1, 1, 1,
1.547691, 2.94225, -0.5858021, 1, 1, 1, 1, 1,
1.555204, 1.384968, -0.04425957, 1, 1, 1, 1, 1,
1.556831, -1.060646, 1.378341, 1, 1, 1, 1, 1,
1.575077, -2.832007, 1.741263, 1, 1, 1, 1, 1,
1.584222, -0.3031462, 2.328642, 1, 1, 1, 1, 1,
1.613887, -1.251412, 1.82179, 1, 1, 1, 1, 1,
1.651966, 0.5575529, 1.399573, 1, 1, 1, 1, 1,
1.652702, -1.427655, 0.7919387, 1, 1, 1, 1, 1,
1.653213, 0.6628526, 1.613408, 1, 1, 1, 1, 1,
1.6541, -1.984648, 3.632644, 1, 1, 1, 1, 1,
1.666283, -1.822811, 2.76909, 0, 0, 1, 1, 1,
1.669334, 0.1596386, 1.383231, 1, 0, 0, 1, 1,
1.6815, -0.2309672, -0.269636, 1, 0, 0, 1, 1,
1.695675, 0.7047046, 0.4968467, 1, 0, 0, 1, 1,
1.704492, 0.1389895, 1.7585, 1, 0, 0, 1, 1,
1.726361, 1.931464, -0.138071, 1, 0, 0, 1, 1,
1.727831, 1.057713, -2.221, 0, 0, 0, 1, 1,
1.741752, 0.8689566, 2.774851, 0, 0, 0, 1, 1,
1.783085, 0.3805822, 0.8574307, 0, 0, 0, 1, 1,
1.792613, -0.7264964, 1.999762, 0, 0, 0, 1, 1,
1.802594, 0.1722268, 0.3915848, 0, 0, 0, 1, 1,
1.805609, -0.7895644, 2.422069, 0, 0, 0, 1, 1,
1.815505, -0.6568932, 0.6113977, 0, 0, 0, 1, 1,
1.828132, 0.02439674, 0.1545565, 1, 1, 1, 1, 1,
1.83852, -1.683971, 1.812043, 1, 1, 1, 1, 1,
1.839124, 0.02047246, 2.898526, 1, 1, 1, 1, 1,
1.839674, -0.7204661, 2.973988, 1, 1, 1, 1, 1,
1.842508, 0.1734528, 1.389075, 1, 1, 1, 1, 1,
1.847018, -2.320528, 3.507807, 1, 1, 1, 1, 1,
1.849407, 1.406375, -0.1565744, 1, 1, 1, 1, 1,
1.854391, 0.3808486, 1.717044, 1, 1, 1, 1, 1,
1.85935, 1.107163, 1.870553, 1, 1, 1, 1, 1,
1.870427, -0.1462211, 1.395186, 1, 1, 1, 1, 1,
1.898248, 2.552233, 2.05364, 1, 1, 1, 1, 1,
1.909976, -0.4468539, 1.700828, 1, 1, 1, 1, 1,
1.914439, 0.3773216, 2.556419, 1, 1, 1, 1, 1,
1.936109, 0.5876337, 0.6835032, 1, 1, 1, 1, 1,
1.947198, -1.165087, 1.116715, 1, 1, 1, 1, 1,
1.949688, -1.176725, 0.955282, 0, 0, 1, 1, 1,
1.960433, 0.8816292, -0.08994498, 1, 0, 0, 1, 1,
2.050855, -0.3445817, -0.4875906, 1, 0, 0, 1, 1,
2.051579, 1.093768, 1.133086, 1, 0, 0, 1, 1,
2.060696, 0.968852, -0.07220795, 1, 0, 0, 1, 1,
2.080484, -0.2883278, 0.5595415, 1, 0, 0, 1, 1,
2.227449, -0.2291822, 3.560569, 0, 0, 0, 1, 1,
2.227574, -0.7410743, 2.155265, 0, 0, 0, 1, 1,
2.359616, 0.8321425, 1.137867, 0, 0, 0, 1, 1,
2.381545, -1.551349, 2.931957, 0, 0, 0, 1, 1,
2.421811, 1.577717, 0.5915599, 0, 0, 0, 1, 1,
2.446026, 1.119421, 2.844821, 0, 0, 0, 1, 1,
2.448009, 0.6886191, 2.99983, 0, 0, 0, 1, 1,
2.491042, -1.425155, 3.084116, 1, 1, 1, 1, 1,
2.579812, 0.124346, 1.80311, 1, 1, 1, 1, 1,
2.593047, 0.6980394, 2.525876, 1, 1, 1, 1, 1,
2.625777, 0.009001521, 1.615225, 1, 1, 1, 1, 1,
2.69906, 0.4219956, 0.6477289, 1, 1, 1, 1, 1,
2.824773, 0.3544197, 1.092134, 1, 1, 1, 1, 1,
3.112704, 2.914932, 0.2572511, 1, 1, 1, 1, 1
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
var radius = 10.18416;
var distance = 35.77145;
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
mvMatrix.translate( 0.1830847, -0.08766568, 0.2408543 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.77145);
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
