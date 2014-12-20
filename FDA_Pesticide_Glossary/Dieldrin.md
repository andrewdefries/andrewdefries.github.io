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
-3.342397, 0.637964, -1.385578, 1, 0, 0, 1,
-2.734303, 0.5147926, -1.507679, 1, 0.007843138, 0, 1,
-2.427214, 0.5906466, -1.213616, 1, 0.01176471, 0, 1,
-2.418858, -2.552066, -2.978894, 1, 0.01960784, 0, 1,
-2.39652, -0.6442677, -3.17754, 1, 0.02352941, 0, 1,
-2.367589, -0.3453546, -0.8850066, 1, 0.03137255, 0, 1,
-2.24513, -0.5054609, -0.5144981, 1, 0.03529412, 0, 1,
-2.233516, 0.1266193, 0.2470588, 1, 0.04313726, 0, 1,
-2.210545, -1.238302, -2.042887, 1, 0.04705882, 0, 1,
-2.182921, -0.3547824, -1.880252, 1, 0.05490196, 0, 1,
-2.176748, 0.2962762, 0.1785147, 1, 0.05882353, 0, 1,
-2.171048, 0.03293084, -1.489137, 1, 0.06666667, 0, 1,
-2.118459, 0.2185545, -1.236391, 1, 0.07058824, 0, 1,
-2.111621, 0.7992147, -1.93134, 1, 0.07843138, 0, 1,
-2.095662, 0.2566316, -2.127636, 1, 0.08235294, 0, 1,
-2.075067, -1.936156, -1.786323, 1, 0.09019608, 0, 1,
-2.041991, -0.3033884, -0.4913293, 1, 0.09411765, 0, 1,
-2.005849, 1.553823, 0.2707285, 1, 0.1019608, 0, 1,
-1.959323, 1.336353, -1.388695, 1, 0.1098039, 0, 1,
-1.951786, -0.0603671, 0.7202903, 1, 0.1137255, 0, 1,
-1.917658, 0.7699025, -1.730284, 1, 0.1215686, 0, 1,
-1.905816, -1.994752, -0.3568304, 1, 0.1254902, 0, 1,
-1.900749, 1.386878, -0.6174903, 1, 0.1333333, 0, 1,
-1.861415, 1.725491, -0.1205176, 1, 0.1372549, 0, 1,
-1.850514, -0.7015251, -0.6796674, 1, 0.145098, 0, 1,
-1.837906, 0.2928983, -1.15115, 1, 0.1490196, 0, 1,
-1.832611, 0.1279439, -0.5159814, 1, 0.1568628, 0, 1,
-1.825, 0.224279, -1.968601, 1, 0.1607843, 0, 1,
-1.824286, 0.2219049, -1.667697, 1, 0.1686275, 0, 1,
-1.82417, 0.3990037, -0.6237137, 1, 0.172549, 0, 1,
-1.807286, -1.758066, -0.2724977, 1, 0.1803922, 0, 1,
-1.791647, -1.280626, -2.963387, 1, 0.1843137, 0, 1,
-1.76344, 0.3773838, -1.824713, 1, 0.1921569, 0, 1,
-1.759694, 0.4586553, -0.7339846, 1, 0.1960784, 0, 1,
-1.756806, -0.5559607, -0.7264503, 1, 0.2039216, 0, 1,
-1.723117, -0.5587928, -1.621008, 1, 0.2117647, 0, 1,
-1.696105, 0.6183128, -0.06283017, 1, 0.2156863, 0, 1,
-1.692057, 0.0942836, -0.1268935, 1, 0.2235294, 0, 1,
-1.67444, -1.424733, -1.287866, 1, 0.227451, 0, 1,
-1.672718, 0.5444821, -0.1641811, 1, 0.2352941, 0, 1,
-1.668669, -0.5281913, -0.9044856, 1, 0.2392157, 0, 1,
-1.66704, 0.3602503, -2.354694, 1, 0.2470588, 0, 1,
-1.659358, 0.6393193, -1.843707, 1, 0.2509804, 0, 1,
-1.652396, 0.6989073, -0.8038995, 1, 0.2588235, 0, 1,
-1.636649, 1.167432, -0.837473, 1, 0.2627451, 0, 1,
-1.629244, 0.7068806, -0.5018698, 1, 0.2705882, 0, 1,
-1.612015, -1.152159, -2.189946, 1, 0.2745098, 0, 1,
-1.610163, -1.094561, -2.710254, 1, 0.282353, 0, 1,
-1.602453, -0.3005258, -0.627152, 1, 0.2862745, 0, 1,
-1.591602, 0.7895435, 0.5962033, 1, 0.2941177, 0, 1,
-1.585345, 1.661112, -0.8482838, 1, 0.3019608, 0, 1,
-1.56396, 0.4362856, -0.5751423, 1, 0.3058824, 0, 1,
-1.561348, -0.7747592, -0.4664893, 1, 0.3137255, 0, 1,
-1.555853, -1.032105, -1.748575, 1, 0.3176471, 0, 1,
-1.549574, 0.4255639, -2.657483, 1, 0.3254902, 0, 1,
-1.548683, -0.6644009, -2.005093, 1, 0.3294118, 0, 1,
-1.542441, 0.5969042, -0.9103294, 1, 0.3372549, 0, 1,
-1.534991, -0.3016165, -2.762818, 1, 0.3411765, 0, 1,
-1.488016, 1.489007, -0.7650301, 1, 0.3490196, 0, 1,
-1.480953, -1.337978, -3.093518, 1, 0.3529412, 0, 1,
-1.469282, -0.4602988, -2.092119, 1, 0.3607843, 0, 1,
-1.467182, -0.148188, -3.21176, 1, 0.3647059, 0, 1,
-1.461478, 0.7436907, -2.484179, 1, 0.372549, 0, 1,
-1.460595, 0.8541657, -0.1022393, 1, 0.3764706, 0, 1,
-1.458408, -0.3833826, -0.9240686, 1, 0.3843137, 0, 1,
-1.456205, -0.5322649, -2.81654, 1, 0.3882353, 0, 1,
-1.456167, -0.9463358, -4.042993, 1, 0.3960784, 0, 1,
-1.445041, 0.778739, 0.1917077, 1, 0.4039216, 0, 1,
-1.435641, 2.212689, -0.877746, 1, 0.4078431, 0, 1,
-1.428691, -0.5305544, 0.3611299, 1, 0.4156863, 0, 1,
-1.422991, 0.6199639, -1.325398, 1, 0.4196078, 0, 1,
-1.410767, 1.047921, -1.983179, 1, 0.427451, 0, 1,
-1.408292, 0.3439052, -2.263726, 1, 0.4313726, 0, 1,
-1.390711, -2.694575, -3.323499, 1, 0.4392157, 0, 1,
-1.385774, 2.601605, -2.67454, 1, 0.4431373, 0, 1,
-1.383621, -0.5216568, 0.3468954, 1, 0.4509804, 0, 1,
-1.350659, -0.4799751, -1.968388, 1, 0.454902, 0, 1,
-1.345962, 0.7241462, -1.109764, 1, 0.4627451, 0, 1,
-1.344059, -0.5155961, 0.5278927, 1, 0.4666667, 0, 1,
-1.342101, -0.2455445, -2.855159, 1, 0.4745098, 0, 1,
-1.340696, 0.3716991, -0.1462669, 1, 0.4784314, 0, 1,
-1.340452, -0.9505997, -2.08396, 1, 0.4862745, 0, 1,
-1.313352, -0.5482208, -2.311847, 1, 0.4901961, 0, 1,
-1.31249, 1.572529, -0.6319, 1, 0.4980392, 0, 1,
-1.304, -0.4343456, -3.564998, 1, 0.5058824, 0, 1,
-1.289927, -0.6135376, -1.983662, 1, 0.509804, 0, 1,
-1.28062, 1.72633, -1.830424, 1, 0.5176471, 0, 1,
-1.280455, -0.2599975, -1.024826, 1, 0.5215687, 0, 1,
-1.258352, 0.771657, -0.948496, 1, 0.5294118, 0, 1,
-1.25295, -0.4494826, -2.985466, 1, 0.5333334, 0, 1,
-1.235566, -2.45481, -1.367613, 1, 0.5411765, 0, 1,
-1.234983, -0.9274621, -2.050717, 1, 0.5450981, 0, 1,
-1.230357, -0.3759869, -1.859658, 1, 0.5529412, 0, 1,
-1.228873, 0.825298, -1.034053, 1, 0.5568628, 0, 1,
-1.224149, 0.2716615, -0.4036934, 1, 0.5647059, 0, 1,
-1.222398, 1.223997, -0.4668222, 1, 0.5686275, 0, 1,
-1.217071, 1.092881, 0.6276149, 1, 0.5764706, 0, 1,
-1.211836, -0.3644473, -3.251363, 1, 0.5803922, 0, 1,
-1.210318, 1.226697, -0.445684, 1, 0.5882353, 0, 1,
-1.208406, -1.855595, -1.854687, 1, 0.5921569, 0, 1,
-1.199364, 1.31511, 0.7299541, 1, 0.6, 0, 1,
-1.197583, -0.8451182, -2.77844, 1, 0.6078432, 0, 1,
-1.193939, 2.478039, 0.7825295, 1, 0.6117647, 0, 1,
-1.19365, -0.5108631, -0.9147588, 1, 0.6196079, 0, 1,
-1.185596, -0.5741409, -1.758799, 1, 0.6235294, 0, 1,
-1.177552, 0.1008391, -2.132978, 1, 0.6313726, 0, 1,
-1.172157, 0.4484548, -2.452519, 1, 0.6352941, 0, 1,
-1.170822, 0.7626512, -0.1789251, 1, 0.6431373, 0, 1,
-1.164512, -2.304401, -2.712468, 1, 0.6470588, 0, 1,
-1.15876, 0.1716922, -2.29514, 1, 0.654902, 0, 1,
-1.158554, -0.905391, -3.420998, 1, 0.6588235, 0, 1,
-1.146815, -0.3868174, -0.9339381, 1, 0.6666667, 0, 1,
-1.145199, -0.7436945, -0.6471075, 1, 0.6705883, 0, 1,
-1.144956, 0.50718, -1.950855, 1, 0.6784314, 0, 1,
-1.140959, 0.298402, -2.436744, 1, 0.682353, 0, 1,
-1.129984, 0.9526336, -1.840873, 1, 0.6901961, 0, 1,
-1.127228, -1.89713, -0.2497349, 1, 0.6941177, 0, 1,
-1.125816, -1.228093, -2.959795, 1, 0.7019608, 0, 1,
-1.120692, -1.687557, -3.869966, 1, 0.7098039, 0, 1,
-1.115291, -0.3664527, -4.39338, 1, 0.7137255, 0, 1,
-1.112993, -0.1978151, -2.504626, 1, 0.7215686, 0, 1,
-1.112878, -0.4034194, -1.300623, 1, 0.7254902, 0, 1,
-1.112603, 1.362067, 0.2848666, 1, 0.7333333, 0, 1,
-1.097874, 1.718851, -0.3249214, 1, 0.7372549, 0, 1,
-1.093244, 2.421235, -1.963114, 1, 0.7450981, 0, 1,
-1.090867, -0.04304072, -1.264612, 1, 0.7490196, 0, 1,
-1.086966, 0.273068, -1.99694, 1, 0.7568628, 0, 1,
-1.085222, -1.170126, -2.965945, 1, 0.7607843, 0, 1,
-1.084579, 0.618684, -0.9397671, 1, 0.7686275, 0, 1,
-1.064111, 1.76595, -0.1556034, 1, 0.772549, 0, 1,
-1.061636, -0.06698999, -1.803792, 1, 0.7803922, 0, 1,
-1.055578, 3.575657, 2.394458, 1, 0.7843137, 0, 1,
-1.055461, 0.005231247, -2.450716, 1, 0.7921569, 0, 1,
-1.054136, -0.8025423, -3.757948, 1, 0.7960784, 0, 1,
-1.052662, -0.5807803, -2.322466, 1, 0.8039216, 0, 1,
-1.046752, 0.6081365, -0.07213727, 1, 0.8117647, 0, 1,
-1.04628, -0.448588, -2.249159, 1, 0.8156863, 0, 1,
-1.046232, -0.1611913, -1.396652, 1, 0.8235294, 0, 1,
-1.030952, 0.7380838, 0.07952522, 1, 0.827451, 0, 1,
-1.027364, -0.1967332, -2.728561, 1, 0.8352941, 0, 1,
-1.026921, -1.244917, -1.308757, 1, 0.8392157, 0, 1,
-1.010059, 0.2367517, -0.8547704, 1, 0.8470588, 0, 1,
-1.007725, 0.5120471, -1.449335, 1, 0.8509804, 0, 1,
-1.007594, 0.4847429, -2.306887, 1, 0.8588235, 0, 1,
-1.006679, 2.753219, 0.8217201, 1, 0.8627451, 0, 1,
-0.9981217, -0.4598512, -2.497406, 1, 0.8705882, 0, 1,
-0.9962244, 1.985487, 0.02889064, 1, 0.8745098, 0, 1,
-0.9956553, 0.1250416, -2.266203, 1, 0.8823529, 0, 1,
-0.9894655, 1.038117, -0.6366384, 1, 0.8862745, 0, 1,
-0.9877306, 0.03418974, -0.6009143, 1, 0.8941177, 0, 1,
-0.9860945, 0.009905445, -0.9215246, 1, 0.8980392, 0, 1,
-0.9760658, -0.1162007, -0.08001132, 1, 0.9058824, 0, 1,
-0.9756286, -0.3714393, -2.65356, 1, 0.9137255, 0, 1,
-0.9747157, -1.107953, -2.356542, 1, 0.9176471, 0, 1,
-0.9745703, -1.318672, -0.08169226, 1, 0.9254902, 0, 1,
-0.9694713, 1.929805, -1.020975, 1, 0.9294118, 0, 1,
-0.9659449, 0.08297186, -2.423327, 1, 0.9372549, 0, 1,
-0.9654986, 0.07390349, -2.429677, 1, 0.9411765, 0, 1,
-0.9647964, 0.5674511, -2.045403, 1, 0.9490196, 0, 1,
-0.9593263, 1.788745, 0.7532089, 1, 0.9529412, 0, 1,
-0.9535512, -0.3608615, -1.630371, 1, 0.9607843, 0, 1,
-0.9517813, -0.3978536, -1.250466, 1, 0.9647059, 0, 1,
-0.9503513, 0.002723771, -0.2858455, 1, 0.972549, 0, 1,
-0.9495556, 2.055976, -1.225738, 1, 0.9764706, 0, 1,
-0.9489176, -0.5225025, -1.212871, 1, 0.9843137, 0, 1,
-0.9465292, 0.01923172, -2.055379, 1, 0.9882353, 0, 1,
-0.9428511, -0.7195891, -1.121701, 1, 0.9960784, 0, 1,
-0.9413037, 0.0457449, 0.08910576, 0.9960784, 1, 0, 1,
-0.9391449, -0.1451101, -2.205884, 0.9921569, 1, 0, 1,
-0.9288352, 0.6122303, -2.624586, 0.9843137, 1, 0, 1,
-0.9249738, 0.6096467, 0.3510698, 0.9803922, 1, 0, 1,
-0.9225758, 0.4512276, 0.05908378, 0.972549, 1, 0, 1,
-0.9115444, -0.9012266, -2.786322, 0.9686275, 1, 0, 1,
-0.9109872, -1.710965, -3.216324, 0.9607843, 1, 0, 1,
-0.9095494, -0.2052116, -1.309075, 0.9568627, 1, 0, 1,
-0.9040262, -1.306139, -2.786386, 0.9490196, 1, 0, 1,
-0.9019364, -0.384298, -0.7008009, 0.945098, 1, 0, 1,
-0.8952991, 0.7211674, -0.7268932, 0.9372549, 1, 0, 1,
-0.8925108, 0.8124861, 0.3549835, 0.9333333, 1, 0, 1,
-0.889018, 0.9519453, -1.531481, 0.9254902, 1, 0, 1,
-0.8808104, 1.628336, 0.01355586, 0.9215686, 1, 0, 1,
-0.880143, 1.527005, -0.4041108, 0.9137255, 1, 0, 1,
-0.875845, -0.3788187, -1.347662, 0.9098039, 1, 0, 1,
-0.8751481, -1.471556, -2.754883, 0.9019608, 1, 0, 1,
-0.8738307, -0.2977232, -1.357416, 0.8941177, 1, 0, 1,
-0.8736227, -0.2929843, -2.155026, 0.8901961, 1, 0, 1,
-0.8685436, -2.523859, -5.223974, 0.8823529, 1, 0, 1,
-0.8656989, -0.2976785, -1.802777, 0.8784314, 1, 0, 1,
-0.8607273, 1.823827, -1.112155, 0.8705882, 1, 0, 1,
-0.85863, -0.1418823, -3.299655, 0.8666667, 1, 0, 1,
-0.8494546, -0.3055381, -1.489131, 0.8588235, 1, 0, 1,
-0.8478574, 0.266376, -0.6600195, 0.854902, 1, 0, 1,
-0.8452059, -0.4157818, -2.597362, 0.8470588, 1, 0, 1,
-0.8411872, 2.164442, -1.224227, 0.8431373, 1, 0, 1,
-0.8383502, 1.335857, -2.925214, 0.8352941, 1, 0, 1,
-0.8306591, -1.677597, -2.464484, 0.8313726, 1, 0, 1,
-0.8285208, 0.1922042, -0.9903476, 0.8235294, 1, 0, 1,
-0.820169, 0.8733376, -0.2344261, 0.8196079, 1, 0, 1,
-0.8153957, 0.8451421, 0.8677812, 0.8117647, 1, 0, 1,
-0.8079212, 0.6811411, -1.482699, 0.8078431, 1, 0, 1,
-0.8079006, -0.8413725, -2.762864, 0.8, 1, 0, 1,
-0.8061495, -0.9456723, -2.027612, 0.7921569, 1, 0, 1,
-0.7968476, -0.711804, -1.412877, 0.7882353, 1, 0, 1,
-0.7953751, 0.4608822, -1.831085, 0.7803922, 1, 0, 1,
-0.7889401, 1.799109, -0.4398488, 0.7764706, 1, 0, 1,
-0.7882034, -0.02464237, 0.1639257, 0.7686275, 1, 0, 1,
-0.7850176, 1.160422, -1.927627, 0.7647059, 1, 0, 1,
-0.7846624, 1.593895, -0.01432695, 0.7568628, 1, 0, 1,
-0.7809077, 0.6561442, -0.1673758, 0.7529412, 1, 0, 1,
-0.7793733, 1.24112, -0.9974485, 0.7450981, 1, 0, 1,
-0.7750537, -0.3662134, -1.783, 0.7411765, 1, 0, 1,
-0.7743615, -0.6928084, -1.516238, 0.7333333, 1, 0, 1,
-0.7726229, -0.2376015, -0.9861774, 0.7294118, 1, 0, 1,
-0.7709596, 0.2481816, -0.01014825, 0.7215686, 1, 0, 1,
-0.7651517, -0.1087134, -2.578569, 0.7176471, 1, 0, 1,
-0.7638555, 0.2334916, -3.374963, 0.7098039, 1, 0, 1,
-0.7595757, 0.602681, -0.8381826, 0.7058824, 1, 0, 1,
-0.7537603, 0.3957008, -2.699975, 0.6980392, 1, 0, 1,
-0.7517526, -0.7044227, -2.64615, 0.6901961, 1, 0, 1,
-0.7492269, -0.2234087, -1.05111, 0.6862745, 1, 0, 1,
-0.7385612, 0.1832453, -1.202892, 0.6784314, 1, 0, 1,
-0.7334774, -0.6756212, -3.0136, 0.6745098, 1, 0, 1,
-0.7293975, -0.5522838, -1.848972, 0.6666667, 1, 0, 1,
-0.7275999, -0.0002521115, -2.68944, 0.6627451, 1, 0, 1,
-0.726129, 0.8203891, -0.2290045, 0.654902, 1, 0, 1,
-0.7250825, -1.052721, -3.86739, 0.6509804, 1, 0, 1,
-0.7240379, -0.5527037, -1.548517, 0.6431373, 1, 0, 1,
-0.7234914, 2.255665, -0.2243057, 0.6392157, 1, 0, 1,
-0.7227517, -0.4210735, -1.901833, 0.6313726, 1, 0, 1,
-0.7138118, 1.321779, -1.976913, 0.627451, 1, 0, 1,
-0.7112615, 0.1028433, -1.07243, 0.6196079, 1, 0, 1,
-0.7111823, 0.3014826, -2.388197, 0.6156863, 1, 0, 1,
-0.7078702, -0.4277841, -0.8853402, 0.6078432, 1, 0, 1,
-0.6978652, -0.07511669, -0.8520331, 0.6039216, 1, 0, 1,
-0.6940205, -1.185897, -4.302508, 0.5960785, 1, 0, 1,
-0.6902533, 0.1966646, -0.7595463, 0.5882353, 1, 0, 1,
-0.6841229, 1.620397, -0.4932085, 0.5843138, 1, 0, 1,
-0.6791145, 1.332046, -2.11875, 0.5764706, 1, 0, 1,
-0.6785254, 0.3992955, -1.815619, 0.572549, 1, 0, 1,
-0.6758724, 0.7102178, -0.9796479, 0.5647059, 1, 0, 1,
-0.6723216, -0.4963184, -1.230927, 0.5607843, 1, 0, 1,
-0.6722375, 0.4721054, 0.3966425, 0.5529412, 1, 0, 1,
-0.6713948, -0.7160342, -0.5742231, 0.5490196, 1, 0, 1,
-0.6600609, 1.245863, -2.028856, 0.5411765, 1, 0, 1,
-0.6595966, 0.03775184, -0.984143, 0.5372549, 1, 0, 1,
-0.6590811, 0.3958645, -0.6519895, 0.5294118, 1, 0, 1,
-0.6559643, -0.3994411, -1.697356, 0.5254902, 1, 0, 1,
-0.653966, -0.2318107, -4.26072, 0.5176471, 1, 0, 1,
-0.650656, 0.3234583, -0.2866003, 0.5137255, 1, 0, 1,
-0.6502894, 0.4867819, -0.5575119, 0.5058824, 1, 0, 1,
-0.6499301, -0.8078861, -2.465236, 0.5019608, 1, 0, 1,
-0.638693, 0.3925303, 0.4215614, 0.4941176, 1, 0, 1,
-0.6371401, 0.2995957, -0.9738315, 0.4862745, 1, 0, 1,
-0.6337641, -1.189384, -3.588593, 0.4823529, 1, 0, 1,
-0.6319841, -0.394657, -2.106447, 0.4745098, 1, 0, 1,
-0.6262717, 1.409149, -0.9691756, 0.4705882, 1, 0, 1,
-0.6247674, -0.5866585, -1.70925, 0.4627451, 1, 0, 1,
-0.6244928, 0.1222808, -0.8484381, 0.4588235, 1, 0, 1,
-0.620006, 0.07256909, -0.6309398, 0.4509804, 1, 0, 1,
-0.6184146, 0.5281611, -1.556483, 0.4470588, 1, 0, 1,
-0.6159703, -0.9024839, -3.574038, 0.4392157, 1, 0, 1,
-0.6099398, -0.5415905, -1.285203, 0.4352941, 1, 0, 1,
-0.609449, 0.6461186, -0.3301716, 0.427451, 1, 0, 1,
-0.6076033, 0.5535678, -0.1322789, 0.4235294, 1, 0, 1,
-0.6061314, -0.06379141, -1.903823, 0.4156863, 1, 0, 1,
-0.6054972, -0.5646047, -2.016647, 0.4117647, 1, 0, 1,
-0.6052234, 1.236151, 1.377312, 0.4039216, 1, 0, 1,
-0.6045551, -0.5542953, -3.151432, 0.3960784, 1, 0, 1,
-0.6040043, -0.6133154, -1.320109, 0.3921569, 1, 0, 1,
-0.60037, 0.003445726, -1.983459, 0.3843137, 1, 0, 1,
-0.5967252, -1.164675, -1.699436, 0.3803922, 1, 0, 1,
-0.5959014, 0.8837869, -1.485823, 0.372549, 1, 0, 1,
-0.5941455, 0.07946612, -3.233178, 0.3686275, 1, 0, 1,
-0.5935419, 1.721094, -0.6653072, 0.3607843, 1, 0, 1,
-0.5910197, 1.296833, -0.6806165, 0.3568628, 1, 0, 1,
-0.5890255, 1.584783, -0.5022485, 0.3490196, 1, 0, 1,
-0.5877218, -1.335226, -4.400377, 0.345098, 1, 0, 1,
-0.5867791, -0.7062065, -2.556881, 0.3372549, 1, 0, 1,
-0.5863872, -0.7219866, -1.07311, 0.3333333, 1, 0, 1,
-0.5813148, -0.8830892, -1.608153, 0.3254902, 1, 0, 1,
-0.5769778, 2.272645, -1.039862, 0.3215686, 1, 0, 1,
-0.5732682, 1.813777, 0.8657209, 0.3137255, 1, 0, 1,
-0.5699452, -0.2416721, -2.018261, 0.3098039, 1, 0, 1,
-0.5634612, -0.5881068, -1.876973, 0.3019608, 1, 0, 1,
-0.5609189, 0.2441968, -1.527915, 0.2941177, 1, 0, 1,
-0.5582315, -0.3747589, -1.554873, 0.2901961, 1, 0, 1,
-0.5546688, 0.04853644, -3.007046, 0.282353, 1, 0, 1,
-0.5526287, 0.4078243, -1.384829, 0.2784314, 1, 0, 1,
-0.5517876, -1.356512, -3.761828, 0.2705882, 1, 0, 1,
-0.5506606, -0.1400832, -2.515099, 0.2666667, 1, 0, 1,
-0.5504063, -1.807311, -3.852999, 0.2588235, 1, 0, 1,
-0.5435185, 0.08147494, -0.4558562, 0.254902, 1, 0, 1,
-0.5426023, 0.9694245, -2.358879, 0.2470588, 1, 0, 1,
-0.5416712, -1.220665, -2.121793, 0.2431373, 1, 0, 1,
-0.5407873, -0.8185416, -3.80156, 0.2352941, 1, 0, 1,
-0.5260535, -1.012422, -3.167994, 0.2313726, 1, 0, 1,
-0.5256547, -1.110476, -3.166792, 0.2235294, 1, 0, 1,
-0.5179842, 0.53619, -0.2066913, 0.2196078, 1, 0, 1,
-0.5147179, -0.2311017, -0.9035977, 0.2117647, 1, 0, 1,
-0.5135115, 2.883876, -0.6329462, 0.2078431, 1, 0, 1,
-0.5101131, -2.3689, -1.942398, 0.2, 1, 0, 1,
-0.5093789, -0.1954195, -1.663941, 0.1921569, 1, 0, 1,
-0.5085536, -1.573969, -1.553521, 0.1882353, 1, 0, 1,
-0.5082322, -0.5087854, -1.661388, 0.1803922, 1, 0, 1,
-0.5069781, -0.2728819, -3.109692, 0.1764706, 1, 0, 1,
-0.505729, 0.3025728, 0.3150936, 0.1686275, 1, 0, 1,
-0.5055999, 2.1579, -1.520985, 0.1647059, 1, 0, 1,
-0.5047362, 1.006357, 1.028833, 0.1568628, 1, 0, 1,
-0.4993964, -0.3951711, -2.72784, 0.1529412, 1, 0, 1,
-0.4989624, -1.875499, -1.732117, 0.145098, 1, 0, 1,
-0.4983173, 0.7382664, -0.7315547, 0.1411765, 1, 0, 1,
-0.4954534, -0.05440972, -4.05626, 0.1333333, 1, 0, 1,
-0.4938818, 1.294135, -0.8427088, 0.1294118, 1, 0, 1,
-0.4907811, 0.1915626, -1.488764, 0.1215686, 1, 0, 1,
-0.4890006, -1.236102, -2.736281, 0.1176471, 1, 0, 1,
-0.4875672, 0.5841606, 0.04188548, 0.1098039, 1, 0, 1,
-0.4848658, -1.226377, -1.165659, 0.1058824, 1, 0, 1,
-0.483305, -2.950735, -3.664892, 0.09803922, 1, 0, 1,
-0.4830291, -0.02976925, -0.9086093, 0.09019608, 1, 0, 1,
-0.4810569, -0.8733508, -2.041901, 0.08627451, 1, 0, 1,
-0.4784033, 0.5632493, 0.5702246, 0.07843138, 1, 0, 1,
-0.4770567, -0.5496746, -2.698014, 0.07450981, 1, 0, 1,
-0.476153, 1.053159, -1.920845, 0.06666667, 1, 0, 1,
-0.4757069, 1.903069, -0.03807038, 0.0627451, 1, 0, 1,
-0.4728314, 0.02968765, -2.951716, 0.05490196, 1, 0, 1,
-0.4656444, -0.562345, -2.247309, 0.05098039, 1, 0, 1,
-0.4584324, -0.2130986, -2.208578, 0.04313726, 1, 0, 1,
-0.458063, -0.6386805, -2.808867, 0.03921569, 1, 0, 1,
-0.4500121, -1.119238, -2.781451, 0.03137255, 1, 0, 1,
-0.4489547, -1.249039, -1.573453, 0.02745098, 1, 0, 1,
-0.4436392, -1.165541, -0.9771985, 0.01960784, 1, 0, 1,
-0.4420798, 1.69524, -0.02786889, 0.01568628, 1, 0, 1,
-0.4367898, 0.4732778, -0.08328981, 0.007843138, 1, 0, 1,
-0.4351747, -0.7325774, -2.009079, 0.003921569, 1, 0, 1,
-0.4330074, -1.655312, -2.70957, 0, 1, 0.003921569, 1,
-0.4323359, -0.1404077, -0.3464217, 0, 1, 0.01176471, 1,
-0.4307199, 1.350732, -0.9644871, 0, 1, 0.01568628, 1,
-0.4259354, -0.3704155, -1.979834, 0, 1, 0.02352941, 1,
-0.4253543, -0.3769001, -2.244396, 0, 1, 0.02745098, 1,
-0.4201393, -0.6300168, -0.7416531, 0, 1, 0.03529412, 1,
-0.4183514, -1.033546, -2.939337, 0, 1, 0.03921569, 1,
-0.4152721, -0.3936118, -4.550867, 0, 1, 0.04705882, 1,
-0.40158, 0.5162869, -0.3420268, 0, 1, 0.05098039, 1,
-0.4004215, 1.178282, -0.2990642, 0, 1, 0.05882353, 1,
-0.3978669, 0.8514615, -0.759689, 0, 1, 0.0627451, 1,
-0.3959236, 0.4118234, -1.401909, 0, 1, 0.07058824, 1,
-0.3930285, -0.2148077, 0.5967565, 0, 1, 0.07450981, 1,
-0.3874374, -0.6232857, -3.181417, 0, 1, 0.08235294, 1,
-0.3837774, 1.272279, 0.1181528, 0, 1, 0.08627451, 1,
-0.3827591, -0.751533, -5.06091, 0, 1, 0.09411765, 1,
-0.3812893, -0.2446827, -1.558502, 0, 1, 0.1019608, 1,
-0.3781528, -1.242108, -0.8466645, 0, 1, 0.1058824, 1,
-0.3766704, -0.5314631, -5.222244, 0, 1, 0.1137255, 1,
-0.3743005, -0.1878927, -1.492973, 0, 1, 0.1176471, 1,
-0.3734956, -0.02327042, -2.212512, 0, 1, 0.1254902, 1,
-0.3730372, -0.783245, -3.498653, 0, 1, 0.1294118, 1,
-0.3720536, 0.7958567, 0.2795442, 0, 1, 0.1372549, 1,
-0.3663463, -0.3801214, -2.035075, 0, 1, 0.1411765, 1,
-0.3659183, 0.3789825, -2.12113, 0, 1, 0.1490196, 1,
-0.364936, 0.0473772, -2.044785, 0, 1, 0.1529412, 1,
-0.3648355, 0.1614739, -1.53954, 0, 1, 0.1607843, 1,
-0.3641205, -0.6954607, -3.517521, 0, 1, 0.1647059, 1,
-0.3596121, -3.159608, -3.240944, 0, 1, 0.172549, 1,
-0.3508106, -1.397097, -1.150537, 0, 1, 0.1764706, 1,
-0.3500095, -1.810372, -0.7219353, 0, 1, 0.1843137, 1,
-0.3494371, 0.3044858, -0.55294, 0, 1, 0.1882353, 1,
-0.3485819, 0.1983549, -0.446479, 0, 1, 0.1960784, 1,
-0.3463924, 0.5531837, 1.013547, 0, 1, 0.2039216, 1,
-0.3463568, -0.3304582, -2.550148, 0, 1, 0.2078431, 1,
-0.3458752, 0.008782404, -0.9074156, 0, 1, 0.2156863, 1,
-0.3446257, 0.1584679, 0.687646, 0, 1, 0.2196078, 1,
-0.3391594, 1.196159, 1.594989, 0, 1, 0.227451, 1,
-0.336275, 0.734734, -0.1488214, 0, 1, 0.2313726, 1,
-0.3362207, -0.3504033, -1.870571, 0, 1, 0.2392157, 1,
-0.3353355, 0.3616369, -0.5058978, 0, 1, 0.2431373, 1,
-0.3313458, 0.35556, -0.5853336, 0, 1, 0.2509804, 1,
-0.3303873, 0.1115238, -1.127146, 0, 1, 0.254902, 1,
-0.3294441, 0.3097205, -2.328701, 0, 1, 0.2627451, 1,
-0.3294206, 0.5840865, -1.136573, 0, 1, 0.2666667, 1,
-0.3174257, 1.109477, -0.752116, 0, 1, 0.2745098, 1,
-0.3158349, 1.261142, -0.8870657, 0, 1, 0.2784314, 1,
-0.3107682, -0.1714984, -2.813729, 0, 1, 0.2862745, 1,
-0.3103561, -0.4813276, -1.817149, 0, 1, 0.2901961, 1,
-0.3102931, -0.1726914, -1.129448, 0, 1, 0.2980392, 1,
-0.3054576, 1.856214, -0.9509079, 0, 1, 0.3058824, 1,
-0.3024781, 0.7713273, -1.324797, 0, 1, 0.3098039, 1,
-0.3021743, -1.106506, -4.362454, 0, 1, 0.3176471, 1,
-0.3013801, 1.017823, 0.2335531, 0, 1, 0.3215686, 1,
-0.2989449, -0.6120248, -2.836414, 0, 1, 0.3294118, 1,
-0.2967477, 0.7698318, -0.6064308, 0, 1, 0.3333333, 1,
-0.2962855, 0.6350867, -0.1326973, 0, 1, 0.3411765, 1,
-0.2955981, 0.8824354, -0.0873024, 0, 1, 0.345098, 1,
-0.2955699, 0.9649121, 0.57111, 0, 1, 0.3529412, 1,
-0.2945778, -0.8439199, -2.168169, 0, 1, 0.3568628, 1,
-0.2916839, -1.03024, -3.878844, 0, 1, 0.3647059, 1,
-0.29162, -1.834201, -3.101787, 0, 1, 0.3686275, 1,
-0.2857521, -0.8436704, -3.241798, 0, 1, 0.3764706, 1,
-0.2850488, 0.5222157, 0.4602755, 0, 1, 0.3803922, 1,
-0.284261, -0.3114075, -1.355295, 0, 1, 0.3882353, 1,
-0.2795447, 1.49008, -1.913506, 0, 1, 0.3921569, 1,
-0.2741199, 1.396366, 0.1133959, 0, 1, 0.4, 1,
-0.2648667, -0.7346727, -1.185536, 0, 1, 0.4078431, 1,
-0.2630553, 0.6760522, -0.7547038, 0, 1, 0.4117647, 1,
-0.2588604, -0.9626004, -3.823635, 0, 1, 0.4196078, 1,
-0.2570432, -0.3961197, -1.999483, 0, 1, 0.4235294, 1,
-0.2566793, -1.000333, -3.328099, 0, 1, 0.4313726, 1,
-0.2522618, 1.107903, 0.8057295, 0, 1, 0.4352941, 1,
-0.2506798, 0.6938203, -0.1276801, 0, 1, 0.4431373, 1,
-0.2418358, 0.4612593, -0.5124446, 0, 1, 0.4470588, 1,
-0.2390545, -0.8818372, -2.211583, 0, 1, 0.454902, 1,
-0.238017, 1.205292, 1.398585, 0, 1, 0.4588235, 1,
-0.2365112, -0.5611817, -1.931467, 0, 1, 0.4666667, 1,
-0.2308407, -0.7900404, -4.374554, 0, 1, 0.4705882, 1,
-0.2288541, -0.3092274, -3.655337, 0, 1, 0.4784314, 1,
-0.2271569, -0.5168487, -4.281526, 0, 1, 0.4823529, 1,
-0.218406, 0.06963234, -1.272486, 0, 1, 0.4901961, 1,
-0.2169632, 0.1511827, -1.243077, 0, 1, 0.4941176, 1,
-0.2146564, -1.333302, -2.300932, 0, 1, 0.5019608, 1,
-0.2135054, -1.374846, -2.717948, 0, 1, 0.509804, 1,
-0.2093278, -1.138824, -1.650437, 0, 1, 0.5137255, 1,
-0.209175, -1.125477, -4.829369, 0, 1, 0.5215687, 1,
-0.2018209, -0.06993235, 0.244514, 0, 1, 0.5254902, 1,
-0.1981385, 1.267556, 0.4597417, 0, 1, 0.5333334, 1,
-0.1968344, 0.003409368, -1.630893, 0, 1, 0.5372549, 1,
-0.1938162, 0.0976333, -1.120419, 0, 1, 0.5450981, 1,
-0.1902258, -0.384064, -2.577082, 0, 1, 0.5490196, 1,
-0.1886193, 0.7954733, -0.426761, 0, 1, 0.5568628, 1,
-0.1852273, 0.7124088, 1.049931, 0, 1, 0.5607843, 1,
-0.1845211, -1.109643, -3.345464, 0, 1, 0.5686275, 1,
-0.17673, 1.138513, -0.7566673, 0, 1, 0.572549, 1,
-0.1748966, 0.9696772, -0.2561204, 0, 1, 0.5803922, 1,
-0.1748811, -0.7314584, -2.235259, 0, 1, 0.5843138, 1,
-0.1727643, -0.495862, -3.974757, 0, 1, 0.5921569, 1,
-0.1723941, -0.8941907, -1.447446, 0, 1, 0.5960785, 1,
-0.1687934, 0.6386987, 0.5450044, 0, 1, 0.6039216, 1,
-0.1680724, 0.8881476, -0.6556806, 0, 1, 0.6117647, 1,
-0.1660285, 1.43585, 1.451677, 0, 1, 0.6156863, 1,
-0.1645675, -0.3946789, -3.511761, 0, 1, 0.6235294, 1,
-0.154719, -0.5668036, -3.486234, 0, 1, 0.627451, 1,
-0.1543791, -0.2050734, -2.251605, 0, 1, 0.6352941, 1,
-0.1483696, 1.085449, 1.02435, 0, 1, 0.6392157, 1,
-0.1482916, -1.167052, -5.709683, 0, 1, 0.6470588, 1,
-0.1476196, -2.254579, -4.1866, 0, 1, 0.6509804, 1,
-0.1470917, -0.4409579, -4.215431, 0, 1, 0.6588235, 1,
-0.1447967, 0.08365947, -0.8579516, 0, 1, 0.6627451, 1,
-0.1446362, -1.095605, -1.44507, 0, 1, 0.6705883, 1,
-0.1436523, -0.320605, -3.651708, 0, 1, 0.6745098, 1,
-0.1421807, 0.08132105, -0.1821373, 0, 1, 0.682353, 1,
-0.1420026, -0.312861, -2.838401, 0, 1, 0.6862745, 1,
-0.1369633, 1.313707, 0.4274292, 0, 1, 0.6941177, 1,
-0.1326142, 0.5490844, -0.289622, 0, 1, 0.7019608, 1,
-0.1300261, 2.13482, 0.9869894, 0, 1, 0.7058824, 1,
-0.1293151, 0.03146011, -2.523707, 0, 1, 0.7137255, 1,
-0.1270069, -2.10696, -2.893734, 0, 1, 0.7176471, 1,
-0.1243096, -0.8107307, -1.923882, 0, 1, 0.7254902, 1,
-0.1231404, 3.485644, 0.7473125, 0, 1, 0.7294118, 1,
-0.1211003, 1.249714, -1.224915, 0, 1, 0.7372549, 1,
-0.1176597, -0.1297206, -2.364695, 0, 1, 0.7411765, 1,
-0.1131353, -0.723185, -3.95439, 0, 1, 0.7490196, 1,
-0.1125123, -0.8174648, -1.916236, 0, 1, 0.7529412, 1,
-0.1106873, 0.2293573, -0.02876603, 0, 1, 0.7607843, 1,
-0.1074296, -0.3459825, -3.58365, 0, 1, 0.7647059, 1,
-0.1058561, 0.2620094, 1.017395, 0, 1, 0.772549, 1,
-0.1047637, -0.9374004, -2.771265, 0, 1, 0.7764706, 1,
-0.1030356, 0.302967, -0.01785037, 0, 1, 0.7843137, 1,
-0.101955, -0.5908983, -3.531589, 0, 1, 0.7882353, 1,
-0.09254397, -0.3350945, -2.757879, 0, 1, 0.7960784, 1,
-0.08922584, -0.1939424, -2.510058, 0, 1, 0.8039216, 1,
-0.08789907, -0.500561, -0.7854602, 0, 1, 0.8078431, 1,
-0.08766215, 0.1822817, -0.4654549, 0, 1, 0.8156863, 1,
-0.0853179, -1.422029, -3.378922, 0, 1, 0.8196079, 1,
-0.07809441, -0.09672424, -3.203623, 0, 1, 0.827451, 1,
-0.07184401, 0.371031, -0.8617481, 0, 1, 0.8313726, 1,
-0.07071875, -0.7113074, -3.754521, 0, 1, 0.8392157, 1,
-0.06605984, -0.01249093, -1.408065, 0, 1, 0.8431373, 1,
-0.06425133, 0.742574, -0.05146115, 0, 1, 0.8509804, 1,
-0.06402467, 0.5782083, -0.4915907, 0, 1, 0.854902, 1,
-0.06348959, 1.39086, 0.4942104, 0, 1, 0.8627451, 1,
-0.06215826, -0.1265621, -4.331049, 0, 1, 0.8666667, 1,
-0.06126635, 1.671619, 0.6377301, 0, 1, 0.8745098, 1,
-0.0612594, 0.5240616, -1.218149, 0, 1, 0.8784314, 1,
-0.06050657, 0.3058493, 0.1075603, 0, 1, 0.8862745, 1,
-0.05982213, -0.3396541, -3.632272, 0, 1, 0.8901961, 1,
-0.05553844, -2.260587, -4.124241, 0, 1, 0.8980392, 1,
-0.0553511, 1.281936, 1.409313, 0, 1, 0.9058824, 1,
-0.04956973, -0.07262002, -1.223993, 0, 1, 0.9098039, 1,
-0.04852096, 0.1104564, -1.544296, 0, 1, 0.9176471, 1,
-0.04592426, 1.005297, 1.2101, 0, 1, 0.9215686, 1,
-0.04477528, -2.577336, -3.641218, 0, 1, 0.9294118, 1,
-0.04261902, 0.3064329, 0.4722439, 0, 1, 0.9333333, 1,
-0.03695996, 1.197952, -0.3067095, 0, 1, 0.9411765, 1,
-0.03551178, -1.71304, -3.330132, 0, 1, 0.945098, 1,
-0.02983152, 1.332337, 1.108031, 0, 1, 0.9529412, 1,
-0.02846592, -0.5894477, -3.4739, 0, 1, 0.9568627, 1,
-0.0267116, -0.5294703, -3.863014, 0, 1, 0.9647059, 1,
-0.02596918, -0.3347717, -3.304924, 0, 1, 0.9686275, 1,
-0.0239076, -0.5271322, -3.109443, 0, 1, 0.9764706, 1,
-0.01935396, 2.047092, 0.7297041, 0, 1, 0.9803922, 1,
-0.0189584, 0.412766, 0.5286741, 0, 1, 0.9882353, 1,
-0.01801107, -1.394422, -3.214215, 0, 1, 0.9921569, 1,
-0.01789729, 0.2481163, 1.111291, 0, 1, 1, 1,
-0.01622377, 0.129817, -1.593657, 0, 0.9921569, 1, 1,
-0.01273431, -1.168016, -3.329137, 0, 0.9882353, 1, 1,
-0.01117595, -0.7319254, -4.168817, 0, 0.9803922, 1, 1,
-0.0105247, -0.283621, -4.135529, 0, 0.9764706, 1, 1,
-0.005137631, -0.03420034, -2.527828, 0, 0.9686275, 1, 1,
-0.003661636, -0.3220997, -2.552462, 0, 0.9647059, 1, 1,
-0.0032629, -1.044162, -6.041305, 0, 0.9568627, 1, 1,
-0.002102873, -0.1955364, -4.415731, 0, 0.9529412, 1, 1,
0.007689167, 0.06765229, 0.5972408, 0, 0.945098, 1, 1,
0.009684781, 0.5705938, 1.321914, 0, 0.9411765, 1, 1,
0.01273004, -0.6765046, 2.175296, 0, 0.9333333, 1, 1,
0.01452564, -0.3438088, 0.7293012, 0, 0.9294118, 1, 1,
0.01616744, 0.6086542, 0.9779717, 0, 0.9215686, 1, 1,
0.03105326, 0.2128352, 2.118834, 0, 0.9176471, 1, 1,
0.03280707, 0.7411302, -0.1706778, 0, 0.9098039, 1, 1,
0.04125601, 1.534086, -1.368157, 0, 0.9058824, 1, 1,
0.04176835, 1.270178, 0.315387, 0, 0.8980392, 1, 1,
0.05231682, -0.9665697, 3.095499, 0, 0.8901961, 1, 1,
0.05484981, 0.1265018, 1.475825, 0, 0.8862745, 1, 1,
0.05631072, 0.571927, 1.196131, 0, 0.8784314, 1, 1,
0.06261171, -1.009067, 2.934393, 0, 0.8745098, 1, 1,
0.06644709, -0.4504705, 2.038681, 0, 0.8666667, 1, 1,
0.06957216, 1.345546, -1.615716, 0, 0.8627451, 1, 1,
0.07542578, -0.4625783, 1.669925, 0, 0.854902, 1, 1,
0.07751584, -1.055973, 2.266107, 0, 0.8509804, 1, 1,
0.0847183, -1.710835, 2.512936, 0, 0.8431373, 1, 1,
0.08794158, -0.6049309, 2.284224, 0, 0.8392157, 1, 1,
0.09877995, 0.1439782, 0.1839866, 0, 0.8313726, 1, 1,
0.1096267, -0.9845909, 1.598133, 0, 0.827451, 1, 1,
0.1099857, -0.1076277, 2.425427, 0, 0.8196079, 1, 1,
0.1116373, 0.5661501, 0.380889, 0, 0.8156863, 1, 1,
0.1118864, 0.375727, -0.2673725, 0, 0.8078431, 1, 1,
0.1167493, -0.872454, 2.927334, 0, 0.8039216, 1, 1,
0.116882, 0.2532241, 0.08088964, 0, 0.7960784, 1, 1,
0.1209152, 0.5824708, -1.210613, 0, 0.7882353, 1, 1,
0.1218266, -1.237502, 2.747777, 0, 0.7843137, 1, 1,
0.1274459, -0.6150474, 3.138868, 0, 0.7764706, 1, 1,
0.127558, -1.625294, 4.531848, 0, 0.772549, 1, 1,
0.1291528, 0.1275848, -0.439727, 0, 0.7647059, 1, 1,
0.131895, -0.8194513, 4.23539, 0, 0.7607843, 1, 1,
0.134317, 0.5737923, -0.9544477, 0, 0.7529412, 1, 1,
0.1351737, -1.474991, 2.893326, 0, 0.7490196, 1, 1,
0.1381894, -1.679579, 3.200001, 0, 0.7411765, 1, 1,
0.1405222, -0.738121, 3.209266, 0, 0.7372549, 1, 1,
0.1438365, -0.8799258, 4.079137, 0, 0.7294118, 1, 1,
0.145927, 0.1550112, 0.7176, 0, 0.7254902, 1, 1,
0.1477193, 0.6832203, 1.177241, 0, 0.7176471, 1, 1,
0.1493234, -0.8349977, 3.960701, 0, 0.7137255, 1, 1,
0.150561, -0.4011669, 2.857677, 0, 0.7058824, 1, 1,
0.1512333, 0.5497571, -0.2901005, 0, 0.6980392, 1, 1,
0.1521784, -0.6315601, 3.376491, 0, 0.6941177, 1, 1,
0.1523215, -0.6209697, 2.178649, 0, 0.6862745, 1, 1,
0.1525581, 2.202223, 0.9241772, 0, 0.682353, 1, 1,
0.1616891, -1.129407, 0.7472501, 0, 0.6745098, 1, 1,
0.1645472, -0.8195043, 2.817329, 0, 0.6705883, 1, 1,
0.1712804, -0.389967, 1.301543, 0, 0.6627451, 1, 1,
0.173163, 1.240875, -0.6497023, 0, 0.6588235, 1, 1,
0.174692, 0.62672, 0.3176423, 0, 0.6509804, 1, 1,
0.1765878, -0.7511895, 4.091807, 0, 0.6470588, 1, 1,
0.1790247, 0.7258127, 0.1788002, 0, 0.6392157, 1, 1,
0.1816275, -0.5872781, 3.650462, 0, 0.6352941, 1, 1,
0.1824175, -0.8258886, 3.995086, 0, 0.627451, 1, 1,
0.1825547, -0.3677042, 1.352476, 0, 0.6235294, 1, 1,
0.1838377, 0.9991903, -0.2228792, 0, 0.6156863, 1, 1,
0.1858429, 0.361079, 1.418326, 0, 0.6117647, 1, 1,
0.186693, -0.2895598, 3.673339, 0, 0.6039216, 1, 1,
0.1890598, 0.008986543, 2.739019, 0, 0.5960785, 1, 1,
0.19427, 1.131132, 1.081033, 0, 0.5921569, 1, 1,
0.1956073, -0.6894322, 4.362771, 0, 0.5843138, 1, 1,
0.1989142, -1.50736, 2.563088, 0, 0.5803922, 1, 1,
0.199331, 0.5673404, 1.143161, 0, 0.572549, 1, 1,
0.201825, -0.6009478, 2.472007, 0, 0.5686275, 1, 1,
0.2049786, -0.9478356, 4.206941, 0, 0.5607843, 1, 1,
0.2055522, 0.6558599, -0.01236999, 0, 0.5568628, 1, 1,
0.2108167, 0.1277863, 0.1179819, 0, 0.5490196, 1, 1,
0.2109569, 0.9576637, -0.4957391, 0, 0.5450981, 1, 1,
0.2120777, 0.497142, -0.2061395, 0, 0.5372549, 1, 1,
0.212336, -1.75145, 4.286081, 0, 0.5333334, 1, 1,
0.2125784, 0.7933269, 1.331947, 0, 0.5254902, 1, 1,
0.2164681, -2.197472, 2.980276, 0, 0.5215687, 1, 1,
0.2173661, 0.3346762, 0.008657679, 0, 0.5137255, 1, 1,
0.2288495, -0.9049549, 3.547883, 0, 0.509804, 1, 1,
0.2385651, -0.02284852, 2.153375, 0, 0.5019608, 1, 1,
0.2391598, -2.036857, 1.88262, 0, 0.4941176, 1, 1,
0.2410718, 0.2702303, 1.894123, 0, 0.4901961, 1, 1,
0.2423179, -0.1597698, 1.735118, 0, 0.4823529, 1, 1,
0.2429281, 0.924709, 0.7710267, 0, 0.4784314, 1, 1,
0.2463113, 0.4737723, 1.394901, 0, 0.4705882, 1, 1,
0.2496042, 0.1887212, -0.1264987, 0, 0.4666667, 1, 1,
0.2501169, -0.09401825, 1.559767, 0, 0.4588235, 1, 1,
0.2519042, 0.3932373, -0.1505899, 0, 0.454902, 1, 1,
0.2522441, -0.1076074, 3.056767, 0, 0.4470588, 1, 1,
0.252295, 1.273047, -0.4347994, 0, 0.4431373, 1, 1,
0.2557189, 0.4790017, -0.03466953, 0, 0.4352941, 1, 1,
0.2579951, -0.1215573, 1.035023, 0, 0.4313726, 1, 1,
0.2583101, 1.42656, -1.492905, 0, 0.4235294, 1, 1,
0.2591834, -1.063686, 3.731497, 0, 0.4196078, 1, 1,
0.2593014, -0.6068348, 0.6084872, 0, 0.4117647, 1, 1,
0.2655293, 0.8778542, 1.45577, 0, 0.4078431, 1, 1,
0.2656933, -1.020845, 4.137218, 0, 0.4, 1, 1,
0.2657002, -0.2988302, 2.236795, 0, 0.3921569, 1, 1,
0.2661425, 0.9342754, 1.503006, 0, 0.3882353, 1, 1,
0.2713572, 0.3432424, -0.3658974, 0, 0.3803922, 1, 1,
0.2713647, -1.43248, 3.533728, 0, 0.3764706, 1, 1,
0.2722249, 0.2696639, 0.8142534, 0, 0.3686275, 1, 1,
0.2726959, 1.799348, -1.437769, 0, 0.3647059, 1, 1,
0.2741839, -0.9418417, 1.766383, 0, 0.3568628, 1, 1,
0.2763215, 1.220195, 1.594002, 0, 0.3529412, 1, 1,
0.2853306, -1.217851, 2.68477, 0, 0.345098, 1, 1,
0.2895203, -0.3833002, 2.839087, 0, 0.3411765, 1, 1,
0.2928924, -1.484237, 2.612413, 0, 0.3333333, 1, 1,
0.2941779, -0.5369871, 2.222882, 0, 0.3294118, 1, 1,
0.2943024, -0.9561594, 2.691883, 0, 0.3215686, 1, 1,
0.2947475, 0.6504542, -0.1719716, 0, 0.3176471, 1, 1,
0.2971424, 0.4111294, 0.5846539, 0, 0.3098039, 1, 1,
0.3012467, -0.3848688, 0.6853523, 0, 0.3058824, 1, 1,
0.3018497, 0.2661325, 2.172572, 0, 0.2980392, 1, 1,
0.3043608, 0.1596957, 0.6355516, 0, 0.2901961, 1, 1,
0.3051516, -0.9790395, 2.267805, 0, 0.2862745, 1, 1,
0.3075026, -0.4085774, 4.062819, 0, 0.2784314, 1, 1,
0.3116085, 0.1782163, 0.654851, 0, 0.2745098, 1, 1,
0.3184172, -0.05386844, 3.109019, 0, 0.2666667, 1, 1,
0.3187168, -0.2342661, 1.770952, 0, 0.2627451, 1, 1,
0.3189088, -0.0008270217, 0.9130817, 0, 0.254902, 1, 1,
0.3234275, -0.5031779, 3.994674, 0, 0.2509804, 1, 1,
0.3246451, -0.3986472, 2.364123, 0, 0.2431373, 1, 1,
0.3261943, -0.0570168, 0.8975816, 0, 0.2392157, 1, 1,
0.3272848, -0.03477177, 1.514369, 0, 0.2313726, 1, 1,
0.3273375, -0.2073023, 2.868617, 0, 0.227451, 1, 1,
0.3292186, 0.792293, 1.216634, 0, 0.2196078, 1, 1,
0.3296561, -0.189668, 3.408724, 0, 0.2156863, 1, 1,
0.3299368, -0.002944706, 1.150509, 0, 0.2078431, 1, 1,
0.3304261, 0.6590653, -1.976293, 0, 0.2039216, 1, 1,
0.3333298, 0.3603181, -0.4722623, 0, 0.1960784, 1, 1,
0.3342646, 0.2036819, 0.6474484, 0, 0.1882353, 1, 1,
0.3354036, -1.155064, 0.8111474, 0, 0.1843137, 1, 1,
0.3389906, -0.2086658, 1.42666, 0, 0.1764706, 1, 1,
0.3402657, -0.3477687, 2.596463, 0, 0.172549, 1, 1,
0.3425102, 1.032034, 0.2062523, 0, 0.1647059, 1, 1,
0.3520827, -0.3846793, 2.161479, 0, 0.1607843, 1, 1,
0.3534829, -0.8717549, 2.322834, 0, 0.1529412, 1, 1,
0.3536563, 1.547905, 1.61446, 0, 0.1490196, 1, 1,
0.3566184, -0.8572162, 3.427328, 0, 0.1411765, 1, 1,
0.3578547, 0.1488729, 1.359874, 0, 0.1372549, 1, 1,
0.3591775, -0.02411394, 1.438789, 0, 0.1294118, 1, 1,
0.3614624, -1.04945, 1.686026, 0, 0.1254902, 1, 1,
0.3624545, -0.5449944, 3.386925, 0, 0.1176471, 1, 1,
0.3697855, -0.1237641, 1.089227, 0, 0.1137255, 1, 1,
0.3731278, 0.2750613, -0.2776423, 0, 0.1058824, 1, 1,
0.3732891, 1.027304, -0.3863443, 0, 0.09803922, 1, 1,
0.3750137, 0.8914835, 0.6955104, 0, 0.09411765, 1, 1,
0.3754116, -0.05486768, 1.393798, 0, 0.08627451, 1, 1,
0.3769544, 0.379286, 0.2323566, 0, 0.08235294, 1, 1,
0.377886, -0.128375, 0.9066611, 0, 0.07450981, 1, 1,
0.3781078, -0.06658692, 0.9721272, 0, 0.07058824, 1, 1,
0.3785672, -0.131663, 3.173186, 0, 0.0627451, 1, 1,
0.3811959, 0.5373728, 1.265946, 0, 0.05882353, 1, 1,
0.381291, 0.6839929, -0.04877339, 0, 0.05098039, 1, 1,
0.3835114, -1.183352, 2.488812, 0, 0.04705882, 1, 1,
0.3883943, -0.7696546, 2.779466, 0, 0.03921569, 1, 1,
0.3898417, -0.2416048, 3.386867, 0, 0.03529412, 1, 1,
0.3953251, 0.6126793, -0.004227319, 0, 0.02745098, 1, 1,
0.4016459, 1.841712, -0.6797535, 0, 0.02352941, 1, 1,
0.4050714, -0.1879355, 1.237022, 0, 0.01568628, 1, 1,
0.4079814, 0.6262975, 1.188513, 0, 0.01176471, 1, 1,
0.4090286, 0.9902676, -0.6865344, 0, 0.003921569, 1, 1,
0.4108399, 1.760323, 0.3915816, 0.003921569, 0, 1, 1,
0.412277, 0.1380241, 1.258233, 0.007843138, 0, 1, 1,
0.4130288, -0.07593653, 0.2807194, 0.01568628, 0, 1, 1,
0.4171525, -1.654008, 3.882238, 0.01960784, 0, 1, 1,
0.4178252, -1.824577, 3.239553, 0.02745098, 0, 1, 1,
0.4187517, -0.01055961, 1.239168, 0.03137255, 0, 1, 1,
0.4188065, 0.31083, -2.033873, 0.03921569, 0, 1, 1,
0.4213766, -0.6184275, 3.78428, 0.04313726, 0, 1, 1,
0.4282048, 0.3235058, -0.9650514, 0.05098039, 0, 1, 1,
0.429529, 0.08914208, 2.516647, 0.05490196, 0, 1, 1,
0.4348056, 0.8325503, 1.103662, 0.0627451, 0, 1, 1,
0.4364505, -1.291156, 2.640915, 0.06666667, 0, 1, 1,
0.4381983, 0.9298997, 0.3249526, 0.07450981, 0, 1, 1,
0.4405234, 0.4408539, 2.022398, 0.07843138, 0, 1, 1,
0.443426, -0.7739297, 3.68569, 0.08627451, 0, 1, 1,
0.4470154, 0.04599364, 0.349552, 0.09019608, 0, 1, 1,
0.4478762, -0.1942418, 1.368201, 0.09803922, 0, 1, 1,
0.45208, 1.561677, 0.5650083, 0.1058824, 0, 1, 1,
0.4560033, -0.7735373, 2.077348, 0.1098039, 0, 1, 1,
0.4566075, 0.3817828, 1.959043, 0.1176471, 0, 1, 1,
0.4586616, -0.5214539, 3.588279, 0.1215686, 0, 1, 1,
0.4717675, -0.1188785, 2.539695, 0.1294118, 0, 1, 1,
0.4744632, -0.7781243, 1.201548, 0.1333333, 0, 1, 1,
0.4757181, 0.7453871, -0.9752078, 0.1411765, 0, 1, 1,
0.4779113, -0.1593613, 2.716209, 0.145098, 0, 1, 1,
0.4788167, -0.01088452, 1.46302, 0.1529412, 0, 1, 1,
0.4808075, 0.5461943, -0.1807206, 0.1568628, 0, 1, 1,
0.4847758, -1.276824, 1.202962, 0.1647059, 0, 1, 1,
0.4855924, -0.5681252, 3.626695, 0.1686275, 0, 1, 1,
0.4907026, -1.976114, 2.848703, 0.1764706, 0, 1, 1,
0.4910243, -1.473273, 4.113632, 0.1803922, 0, 1, 1,
0.4920407, 0.6814051, 2.195526, 0.1882353, 0, 1, 1,
0.4944604, -0.6165422, 3.360327, 0.1921569, 0, 1, 1,
0.5038339, 0.8642938, -0.9186566, 0.2, 0, 1, 1,
0.5042883, -0.7122078, 3.052099, 0.2078431, 0, 1, 1,
0.5045001, 0.9274421, 0.5016683, 0.2117647, 0, 1, 1,
0.5051515, -0.7336044, 2.146192, 0.2196078, 0, 1, 1,
0.5080035, -0.1943051, 0.771673, 0.2235294, 0, 1, 1,
0.5084229, 0.9312819, 0.2957453, 0.2313726, 0, 1, 1,
0.5088876, -0.9366568, 2.430124, 0.2352941, 0, 1, 1,
0.5107279, -1.430154, 1.400662, 0.2431373, 0, 1, 1,
0.5127888, -0.8593294, 1.465124, 0.2470588, 0, 1, 1,
0.5153984, 0.6597837, -0.9846418, 0.254902, 0, 1, 1,
0.5216922, -0.2280376, 2.384494, 0.2588235, 0, 1, 1,
0.522554, 0.8757893, 0.242083, 0.2666667, 0, 1, 1,
0.5244309, -0.1163729, 2.170618, 0.2705882, 0, 1, 1,
0.5269592, -0.2003713, 2.36533, 0.2784314, 0, 1, 1,
0.5298107, -0.5974724, 3.393172, 0.282353, 0, 1, 1,
0.5299799, -0.9334882, 4.905267, 0.2901961, 0, 1, 1,
0.5349067, -0.6997501, 4.22963, 0.2941177, 0, 1, 1,
0.5373497, -0.8885909, 2.097215, 0.3019608, 0, 1, 1,
0.5387193, 1.176497, 0.6448667, 0.3098039, 0, 1, 1,
0.5426841, -1.192234, 1.614224, 0.3137255, 0, 1, 1,
0.5462365, -0.1529335, 1.268054, 0.3215686, 0, 1, 1,
0.5504799, 0.5091931, 2.022887, 0.3254902, 0, 1, 1,
0.5618011, 1.844259, -0.003238624, 0.3333333, 0, 1, 1,
0.5633056, -2.328373, 3.442064, 0.3372549, 0, 1, 1,
0.5651287, -1.069949, 1.822523, 0.345098, 0, 1, 1,
0.5655772, -1.401973, 2.486859, 0.3490196, 0, 1, 1,
0.5676867, -0.02229228, 2.75528, 0.3568628, 0, 1, 1,
0.5684941, 0.802496, 0.5117534, 0.3607843, 0, 1, 1,
0.568672, -0.3015302, 2.337249, 0.3686275, 0, 1, 1,
0.5690074, 0.5574197, -0.1082842, 0.372549, 0, 1, 1,
0.5690963, -0.01095466, 0.871682, 0.3803922, 0, 1, 1,
0.5748989, 0.4269873, -1.771461, 0.3843137, 0, 1, 1,
0.5863637, 0.5375513, 1.217036, 0.3921569, 0, 1, 1,
0.5878527, 0.6840162, -0.6187733, 0.3960784, 0, 1, 1,
0.5888919, 0.3114326, 1.024547, 0.4039216, 0, 1, 1,
0.5898783, 0.5549691, -0.7042551, 0.4117647, 0, 1, 1,
0.5929346, 0.6506925, 0.7718356, 0.4156863, 0, 1, 1,
0.5944028, -0.2159349, 2.545863, 0.4235294, 0, 1, 1,
0.5988934, -0.929966, 1.950044, 0.427451, 0, 1, 1,
0.6024399, 0.903635, -0.06075455, 0.4352941, 0, 1, 1,
0.6041716, -1.405458, 2.665204, 0.4392157, 0, 1, 1,
0.6056832, -1.156401, 4.211909, 0.4470588, 0, 1, 1,
0.6057035, -1.199688, 2.857963, 0.4509804, 0, 1, 1,
0.6130694, -0.9091217, 2.788771, 0.4588235, 0, 1, 1,
0.6143327, 1.380776, 0.4244831, 0.4627451, 0, 1, 1,
0.6239156, 0.1502262, 1.246133, 0.4705882, 0, 1, 1,
0.6315544, 0.9960827, -0.3636856, 0.4745098, 0, 1, 1,
0.6320452, 0.4631929, 0.9426616, 0.4823529, 0, 1, 1,
0.6338184, 0.5990769, -0.153075, 0.4862745, 0, 1, 1,
0.6348286, 0.6268668, -0.03288803, 0.4941176, 0, 1, 1,
0.6385288, 0.2718344, 1.66041, 0.5019608, 0, 1, 1,
0.6403013, -0.793473, 1.659821, 0.5058824, 0, 1, 1,
0.6407592, -0.4407667, 3.017621, 0.5137255, 0, 1, 1,
0.6507494, 0.2980794, 0.8457842, 0.5176471, 0, 1, 1,
0.6513205, -1.082498, 3.044568, 0.5254902, 0, 1, 1,
0.6547165, 0.67361, 1.169616, 0.5294118, 0, 1, 1,
0.6565302, 1.770468, 0.230642, 0.5372549, 0, 1, 1,
0.6591798, -0.4194658, 2.416263, 0.5411765, 0, 1, 1,
0.6624992, 0.02139619, 1.788196, 0.5490196, 0, 1, 1,
0.6652538, 0.2077583, 1.360283, 0.5529412, 0, 1, 1,
0.6672083, -0.1891596, 1.725617, 0.5607843, 0, 1, 1,
0.6672153, 0.5292733, 1.677766, 0.5647059, 0, 1, 1,
0.6683832, 0.187365, 1.209375, 0.572549, 0, 1, 1,
0.6688069, 0.6386398, -0.4149114, 0.5764706, 0, 1, 1,
0.6722087, -0.7555111, 2.514649, 0.5843138, 0, 1, 1,
0.6817041, -0.6688939, 0.855358, 0.5882353, 0, 1, 1,
0.6818558, 2.084953, 0.4304854, 0.5960785, 0, 1, 1,
0.6825096, 0.4184316, 0.5474876, 0.6039216, 0, 1, 1,
0.6844295, -1.110513, 0.8138624, 0.6078432, 0, 1, 1,
0.6870307, 1.179418, -0.8648777, 0.6156863, 0, 1, 1,
0.6875623, -0.4896989, 1.955987, 0.6196079, 0, 1, 1,
0.688409, 0.05340482, 1.074322, 0.627451, 0, 1, 1,
0.6907967, -0.2511635, 0.6037863, 0.6313726, 0, 1, 1,
0.6910436, -0.44119, 2.650168, 0.6392157, 0, 1, 1,
0.6921422, 0.8897855, -0.3761553, 0.6431373, 0, 1, 1,
0.6928437, -0.3986226, 0.7193147, 0.6509804, 0, 1, 1,
0.6952211, -0.01462628, 2.603805, 0.654902, 0, 1, 1,
0.6964045, -0.9108195, 1.502629, 0.6627451, 0, 1, 1,
0.6976346, -1.139418, 2.951776, 0.6666667, 0, 1, 1,
0.7007166, 0.6839537, 1.757954, 0.6745098, 0, 1, 1,
0.7012318, -0.07488017, 1.517338, 0.6784314, 0, 1, 1,
0.7018722, -0.7963387, 1.629684, 0.6862745, 0, 1, 1,
0.703269, -2.675794, 3.296763, 0.6901961, 0, 1, 1,
0.7039652, -0.2067706, 2.193167, 0.6980392, 0, 1, 1,
0.7050917, -1.399648, 3.535385, 0.7058824, 0, 1, 1,
0.7101741, -1.297505, 2.941666, 0.7098039, 0, 1, 1,
0.7155996, 0.2618985, 1.899691, 0.7176471, 0, 1, 1,
0.7185017, -0.6502118, 3.187527, 0.7215686, 0, 1, 1,
0.7266478, -1.115047, 2.863719, 0.7294118, 0, 1, 1,
0.7305256, 0.1471333, 0.9688734, 0.7333333, 0, 1, 1,
0.7314015, 0.9108468, -0.7025285, 0.7411765, 0, 1, 1,
0.733027, -0.7716131, 1.805527, 0.7450981, 0, 1, 1,
0.735827, 0.7445074, -1.412286, 0.7529412, 0, 1, 1,
0.7407883, 0.02461117, 0.1245107, 0.7568628, 0, 1, 1,
0.7443274, 0.1805542, 0.5149674, 0.7647059, 0, 1, 1,
0.745639, 1.11121, -0.4342994, 0.7686275, 0, 1, 1,
0.7478317, -0.468625, -0.3266893, 0.7764706, 0, 1, 1,
0.7549373, 0.2123345, 2.669952, 0.7803922, 0, 1, 1,
0.7565039, -2.193933, 1.47107, 0.7882353, 0, 1, 1,
0.7572613, 1.555658, 0.1349079, 0.7921569, 0, 1, 1,
0.7604624, -0.3470757, 2.53578, 0.8, 0, 1, 1,
0.7608752, 0.2534514, 0.9644577, 0.8078431, 0, 1, 1,
0.7620511, 0.7546027, -0.2666348, 0.8117647, 0, 1, 1,
0.7639908, 0.781258, 1.538927, 0.8196079, 0, 1, 1,
0.7691528, -1.545558, 2.919238, 0.8235294, 0, 1, 1,
0.7737607, -1.253705, 1.449161, 0.8313726, 0, 1, 1,
0.7769283, -0.003131896, 1.318106, 0.8352941, 0, 1, 1,
0.7800643, -0.9007776, 2.732103, 0.8431373, 0, 1, 1,
0.7810434, 0.7397858, 1.178267, 0.8470588, 0, 1, 1,
0.7857174, 0.6945148, 0.8903386, 0.854902, 0, 1, 1,
0.7875927, 0.2737622, 2.524163, 0.8588235, 0, 1, 1,
0.7880033, 0.3305476, 0.6552978, 0.8666667, 0, 1, 1,
0.7889581, 1.227724, 2.182172, 0.8705882, 0, 1, 1,
0.7905824, 0.2937559, 2.139828, 0.8784314, 0, 1, 1,
0.7940348, 0.5711322, 2.038952, 0.8823529, 0, 1, 1,
0.8206892, 0.6864657, 0.7064028, 0.8901961, 0, 1, 1,
0.8222395, 0.3007469, 0.7313316, 0.8941177, 0, 1, 1,
0.8228837, 0.9756561, -0.1709607, 0.9019608, 0, 1, 1,
0.8241769, 0.18632, 2.356516, 0.9098039, 0, 1, 1,
0.8302281, 2.05957, -1.309052, 0.9137255, 0, 1, 1,
0.8307908, 0.1701994, 1.728371, 0.9215686, 0, 1, 1,
0.8314317, -0.8218304, 2.404979, 0.9254902, 0, 1, 1,
0.8337228, 0.1108426, 1.528783, 0.9333333, 0, 1, 1,
0.8376708, -1.01476, 2.615474, 0.9372549, 0, 1, 1,
0.8391486, 0.2367796, 2.404345, 0.945098, 0, 1, 1,
0.8423678, 0.4900007, 1.831851, 0.9490196, 0, 1, 1,
0.8433363, 0.6549728, 0.5006378, 0.9568627, 0, 1, 1,
0.8469208, 1.00678, 0.6281321, 0.9607843, 0, 1, 1,
0.8497267, 0.9310819, 2.345277, 0.9686275, 0, 1, 1,
0.8516717, -0.03415962, 1.301388, 0.972549, 0, 1, 1,
0.8517832, -1.573599, 2.258641, 0.9803922, 0, 1, 1,
0.8566371, 0.6572282, 0.7168291, 0.9843137, 0, 1, 1,
0.8632616, -0.8053448, 3.638869, 0.9921569, 0, 1, 1,
0.8636218, 0.4123665, 1.858325, 0.9960784, 0, 1, 1,
0.8785969, 0.3140319, 1.503554, 1, 0, 0.9960784, 1,
0.8860161, -0.3288111, 0.9480458, 1, 0, 0.9882353, 1,
0.8891788, -1.43369, 1.52086, 1, 0, 0.9843137, 1,
0.8896878, 0.6196128, 1.234793, 1, 0, 0.9764706, 1,
0.8900625, 0.0625948, 1.956004, 1, 0, 0.972549, 1,
0.8906213, -0.6794826, 1.945504, 1, 0, 0.9647059, 1,
0.8920056, -0.3409942, 1.112594, 1, 0, 0.9607843, 1,
0.892434, -0.9604047, 1.426211, 1, 0, 0.9529412, 1,
0.9009882, -1.024468, 3.060248, 1, 0, 0.9490196, 1,
0.9017666, -1.840115, 0.9156632, 1, 0, 0.9411765, 1,
0.9024338, 0.8676042, -0.6052096, 1, 0, 0.9372549, 1,
0.9298409, -0.4399001, 2.430266, 1, 0, 0.9294118, 1,
0.9321529, 1.975556, 0.2901622, 1, 0, 0.9254902, 1,
0.9374679, 0.05885974, 1.00672, 1, 0, 0.9176471, 1,
0.9376366, -1.785427, 3.587126, 1, 0, 0.9137255, 1,
0.9424129, -1.732173, 3.717715, 1, 0, 0.9058824, 1,
0.9480629, -0.3865809, 1.128168, 1, 0, 0.9019608, 1,
0.9558396, -0.9994391, 4.260759, 1, 0, 0.8941177, 1,
0.9568977, -1.574959, 2.493863, 1, 0, 0.8862745, 1,
0.9673501, 0.8065484, -0.5638676, 1, 0, 0.8823529, 1,
0.9703955, -1.761117, 1.431637, 1, 0, 0.8745098, 1,
0.9823079, -0.9959203, 2.100399, 1, 0, 0.8705882, 1,
0.9840613, 0.780058, 2.377219, 1, 0, 0.8627451, 1,
0.9864506, -0.1688734, 0.3652601, 1, 0, 0.8588235, 1,
0.9940943, -0.4138947, 1.887464, 1, 0, 0.8509804, 1,
0.9954817, 0.3009646, 0.3676172, 1, 0, 0.8470588, 1,
1.007814, 2.360477, 0.8934327, 1, 0, 0.8392157, 1,
1.014735, -0.6072329, 2.003902, 1, 0, 0.8352941, 1,
1.020699, 1.448034, -0.3249551, 1, 0, 0.827451, 1,
1.020913, 0.7968062, 2.336087, 1, 0, 0.8235294, 1,
1.022358, -2.024584, 5.10565, 1, 0, 0.8156863, 1,
1.036576, -1.241428, 3.034892, 1, 0, 0.8117647, 1,
1.040314, 1.839649, 1.708498, 1, 0, 0.8039216, 1,
1.057074, 0.2998914, 0.4359438, 1, 0, 0.7960784, 1,
1.066298, -0.423568, 2.021237, 1, 0, 0.7921569, 1,
1.082135, -0.823248, 2.307946, 1, 0, 0.7843137, 1,
1.086957, 0.8507282, 0.8924536, 1, 0, 0.7803922, 1,
1.089544, -0.6046757, 1.359297, 1, 0, 0.772549, 1,
1.095346, -0.2912435, 1.855393, 1, 0, 0.7686275, 1,
1.098855, -1.587313, 0.9998656, 1, 0, 0.7607843, 1,
1.099126, -0.3745094, 1.052565, 1, 0, 0.7568628, 1,
1.104437, -1.343227, 3.118175, 1, 0, 0.7490196, 1,
1.114467, -0.07113665, 1.270004, 1, 0, 0.7450981, 1,
1.116845, -0.1655349, 2.275722, 1, 0, 0.7372549, 1,
1.119375, -0.5431306, 2.11127, 1, 0, 0.7333333, 1,
1.123695, 1.520004, -1.882645, 1, 0, 0.7254902, 1,
1.125968, 0.8430451, 1.780501, 1, 0, 0.7215686, 1,
1.129071, -1.08141, 1.935139, 1, 0, 0.7137255, 1,
1.129189, -1.314586, 0.4398479, 1, 0, 0.7098039, 1,
1.12973, -2.465305, 3.537342, 1, 0, 0.7019608, 1,
1.130526, 1.637063, 0.09239001, 1, 0, 0.6941177, 1,
1.13235, 0.382019, 2.639918, 1, 0, 0.6901961, 1,
1.135071, -0.2407703, 1.959866, 1, 0, 0.682353, 1,
1.144929, 1.817229, 0.9325807, 1, 0, 0.6784314, 1,
1.14949, 1.346056, 0.2436751, 1, 0, 0.6705883, 1,
1.15693, -0.1301134, 1.487744, 1, 0, 0.6666667, 1,
1.162078, 1.668572, 1.333979, 1, 0, 0.6588235, 1,
1.162499, -1.317024, 2.986984, 1, 0, 0.654902, 1,
1.178, -2.11073, 3.599092, 1, 0, 0.6470588, 1,
1.17984, -0.7456033, 0.9629154, 1, 0, 0.6431373, 1,
1.188685, -0.1376465, 1.232565, 1, 0, 0.6352941, 1,
1.190055, 1.2006, -1.414134, 1, 0, 0.6313726, 1,
1.190391, 0.2408108, 1.703173, 1, 0, 0.6235294, 1,
1.191263, 1.194383, 0.1117955, 1, 0, 0.6196079, 1,
1.198066, 0.4397511, 1.858886, 1, 0, 0.6117647, 1,
1.198656, 0.8192012, 1.461691, 1, 0, 0.6078432, 1,
1.206305, 1.828614, 1.039142, 1, 0, 0.6, 1,
1.214445, 0.3845229, 0.2314496, 1, 0, 0.5921569, 1,
1.215711, 0.773605, 0.3483869, 1, 0, 0.5882353, 1,
1.220119, -0.0575076, 0.375028, 1, 0, 0.5803922, 1,
1.222934, 0.928131, 0.3662124, 1, 0, 0.5764706, 1,
1.223849, -0.6649881, 1.125631, 1, 0, 0.5686275, 1,
1.25786, -0.6839131, 2.21091, 1, 0, 0.5647059, 1,
1.259323, 0.4123494, -0.6671175, 1, 0, 0.5568628, 1,
1.259736, 0.9725453, 2.53629, 1, 0, 0.5529412, 1,
1.296088, 0.2293952, 2.239156, 1, 0, 0.5450981, 1,
1.296837, 0.758687, 0.442931, 1, 0, 0.5411765, 1,
1.300787, 0.2463538, 1.112901, 1, 0, 0.5333334, 1,
1.301333, 0.2704605, 1.261712, 1, 0, 0.5294118, 1,
1.307741, -0.08015746, 1.616091, 1, 0, 0.5215687, 1,
1.30869, 1.136396, 1.264148, 1, 0, 0.5176471, 1,
1.315118, 0.526647, 1.429614, 1, 0, 0.509804, 1,
1.319555, -0.45762, 1.306699, 1, 0, 0.5058824, 1,
1.322121, 1.382001, 1.388648, 1, 0, 0.4980392, 1,
1.322727, 0.08904495, 1.394941, 1, 0, 0.4901961, 1,
1.332949, 1.138007, -0.2054264, 1, 0, 0.4862745, 1,
1.347066, -0.3245896, 3.209617, 1, 0, 0.4784314, 1,
1.356298, 0.9482121, 1.212732, 1, 0, 0.4745098, 1,
1.359561, -0.3125258, 2.916594, 1, 0, 0.4666667, 1,
1.374892, 0.5449709, 1.145216, 1, 0, 0.4627451, 1,
1.375018, 2.044548, -1.56232, 1, 0, 0.454902, 1,
1.377243, 0.1660898, 1.751041, 1, 0, 0.4509804, 1,
1.40135, 1.31317, 2.494482, 1, 0, 0.4431373, 1,
1.402661, 0.203627, 1.921257, 1, 0, 0.4392157, 1,
1.408675, -0.8812379, 1.983615, 1, 0, 0.4313726, 1,
1.40944, 0.5195385, 1.949542, 1, 0, 0.427451, 1,
1.426629, 0.592209, 1.244868, 1, 0, 0.4196078, 1,
1.440498, 0.7630303, -0.6637614, 1, 0, 0.4156863, 1,
1.441529, -2.267912, 1.81875, 1, 0, 0.4078431, 1,
1.442978, -0.7024048, 0.7463006, 1, 0, 0.4039216, 1,
1.45761, -1.439497, 2.422779, 1, 0, 0.3960784, 1,
1.470249, -0.3842525, 1.484498, 1, 0, 0.3882353, 1,
1.473577, -0.04613611, -0.4933668, 1, 0, 0.3843137, 1,
1.492602, 0.2291337, 1.474558, 1, 0, 0.3764706, 1,
1.495536, -0.8498213, 1.031551, 1, 0, 0.372549, 1,
1.508627, -1.2988, 2.031537, 1, 0, 0.3647059, 1,
1.509007, 0.8990739, 1.213797, 1, 0, 0.3607843, 1,
1.530649, 1.049631, 1.513903, 1, 0, 0.3529412, 1,
1.53609, 1.027238, 1.225098, 1, 0, 0.3490196, 1,
1.543505, -0.722868, 3.949886, 1, 0, 0.3411765, 1,
1.552307, 1.288421, 2.254962, 1, 0, 0.3372549, 1,
1.56629, -0.6027033, 3.246438, 1, 0, 0.3294118, 1,
1.568402, -0.5484008, 0.9550574, 1, 0, 0.3254902, 1,
1.589432, 0.7240865, 0.006292962, 1, 0, 0.3176471, 1,
1.611412, 0.4938221, 1.01424, 1, 0, 0.3137255, 1,
1.618225, -0.3074945, 2.964275, 1, 0, 0.3058824, 1,
1.619254, 0.4693118, 2.71084, 1, 0, 0.2980392, 1,
1.621155, 1.759105, 1.405729, 1, 0, 0.2941177, 1,
1.626194, 1.024834, 0.4217012, 1, 0, 0.2862745, 1,
1.634684, 0.9650186, -0.6626186, 1, 0, 0.282353, 1,
1.639864, 0.1477835, 0.6989534, 1, 0, 0.2745098, 1,
1.642561, -0.8238575, 0.6843362, 1, 0, 0.2705882, 1,
1.644604, -1.158241, 2.97324, 1, 0, 0.2627451, 1,
1.647664, -0.3886846, 2.285222, 1, 0, 0.2588235, 1,
1.655842, -1.24233, 1.754107, 1, 0, 0.2509804, 1,
1.660735, -0.1208822, 2.470352, 1, 0, 0.2470588, 1,
1.677486, 0.07514416, 1.853012, 1, 0, 0.2392157, 1,
1.681913, 0.2177615, 2.722044, 1, 0, 0.2352941, 1,
1.683164, 1.015912, 2.740847, 1, 0, 0.227451, 1,
1.694169, 0.1287287, 0.3843162, 1, 0, 0.2235294, 1,
1.706059, 0.138285, 1.454991, 1, 0, 0.2156863, 1,
1.714076, 0.8203266, 0.7048825, 1, 0, 0.2117647, 1,
1.722041, -0.290785, 1.794094, 1, 0, 0.2039216, 1,
1.745124, 2.142177, -0.106984, 1, 0, 0.1960784, 1,
1.77808, 0.7754176, 1.600616, 1, 0, 0.1921569, 1,
1.778101, 0.1107991, 1.797927, 1, 0, 0.1843137, 1,
1.779193, -0.2477178, 1.7054, 1, 0, 0.1803922, 1,
1.812279, 1.859458, 0.9927249, 1, 0, 0.172549, 1,
1.825474, -0.4458652, 1.608675, 1, 0, 0.1686275, 1,
1.829916, -0.63521, 3.411222, 1, 0, 0.1607843, 1,
1.835797, 0.1620935, 0.9685531, 1, 0, 0.1568628, 1,
1.838669, -0.1152638, 3.191923, 1, 0, 0.1490196, 1,
1.840836, -0.5374573, 1.31059, 1, 0, 0.145098, 1,
1.849853, 0.8235198, 2.439642, 1, 0, 0.1372549, 1,
1.850231, -0.07495178, 1.350069, 1, 0, 0.1333333, 1,
1.91726, -0.4262046, 2.723921, 1, 0, 0.1254902, 1,
1.919515, 0.1737046, -0.03486292, 1, 0, 0.1215686, 1,
1.920163, -0.6403984, 2.268704, 1, 0, 0.1137255, 1,
1.958435, -0.2282904, 1.321437, 1, 0, 0.1098039, 1,
1.979888, 0.1489251, 2.287576, 1, 0, 0.1019608, 1,
2.08944, -0.2244728, 1.794853, 1, 0, 0.09411765, 1,
2.169776, -0.911485, 2.089234, 1, 0, 0.09019608, 1,
2.1707, 0.2485881, 1.204837, 1, 0, 0.08235294, 1,
2.190255, 1.893839, 0.5973893, 1, 0, 0.07843138, 1,
2.201854, -1.563797, 3.166576, 1, 0, 0.07058824, 1,
2.253257, 0.5463615, 1.919616, 1, 0, 0.06666667, 1,
2.299963, 0.0149229, 1.623128, 1, 0, 0.05882353, 1,
2.326642, -0.3699389, -0.4936767, 1, 0, 0.05490196, 1,
2.392031, 0.2410101, -0.7228169, 1, 0, 0.04705882, 1,
2.452458, 1.558361, 1.250585, 1, 0, 0.04313726, 1,
2.643734, 0.941741, -0.7607576, 1, 0, 0.03529412, 1,
2.775225, -1.41361, 1.373894, 1, 0, 0.03137255, 1,
2.864859, -1.050881, 2.636051, 1, 0, 0.02352941, 1,
2.958938, 0.4798436, 1.711633, 1, 0, 0.01960784, 1,
2.964021, 0.3576289, 3.136835, 1, 0, 0.01176471, 1,
3.003108, 0.109702, 1.516717, 1, 0, 0.007843138, 1
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
-0.1696447, -4.301235, -7.930714, 0, -0.5, 0.5, 0.5,
-0.1696447, -4.301235, -7.930714, 1, -0.5, 0.5, 0.5,
-0.1696447, -4.301235, -7.930714, 1, 1.5, 0.5, 0.5,
-0.1696447, -4.301235, -7.930714, 0, 1.5, 0.5, 0.5
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
-4.417961, 0.2080249, -7.930714, 0, -0.5, 0.5, 0.5,
-4.417961, 0.2080249, -7.930714, 1, -0.5, 0.5, 0.5,
-4.417961, 0.2080249, -7.930714, 1, 1.5, 0.5, 0.5,
-4.417961, 0.2080249, -7.930714, 0, 1.5, 0.5, 0.5
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
-4.417961, -4.301235, -0.4678276, 0, -0.5, 0.5, 0.5,
-4.417961, -4.301235, -0.4678276, 1, -0.5, 0.5, 0.5,
-4.417961, -4.301235, -0.4678276, 1, 1.5, 0.5, 0.5,
-4.417961, -4.301235, -0.4678276, 0, 1.5, 0.5, 0.5
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
-3, -3.260637, -6.208509,
3, -3.260637, -6.208509,
-3, -3.260637, -6.208509,
-3, -3.43407, -6.495543,
-2, -3.260637, -6.208509,
-2, -3.43407, -6.495543,
-1, -3.260637, -6.208509,
-1, -3.43407, -6.495543,
0, -3.260637, -6.208509,
0, -3.43407, -6.495543,
1, -3.260637, -6.208509,
1, -3.43407, -6.495543,
2, -3.260637, -6.208509,
2, -3.43407, -6.495543,
3, -3.260637, -6.208509,
3, -3.43407, -6.495543
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
-3, -3.780936, -7.069612, 0, -0.5, 0.5, 0.5,
-3, -3.780936, -7.069612, 1, -0.5, 0.5, 0.5,
-3, -3.780936, -7.069612, 1, 1.5, 0.5, 0.5,
-3, -3.780936, -7.069612, 0, 1.5, 0.5, 0.5,
-2, -3.780936, -7.069612, 0, -0.5, 0.5, 0.5,
-2, -3.780936, -7.069612, 1, -0.5, 0.5, 0.5,
-2, -3.780936, -7.069612, 1, 1.5, 0.5, 0.5,
-2, -3.780936, -7.069612, 0, 1.5, 0.5, 0.5,
-1, -3.780936, -7.069612, 0, -0.5, 0.5, 0.5,
-1, -3.780936, -7.069612, 1, -0.5, 0.5, 0.5,
-1, -3.780936, -7.069612, 1, 1.5, 0.5, 0.5,
-1, -3.780936, -7.069612, 0, 1.5, 0.5, 0.5,
0, -3.780936, -7.069612, 0, -0.5, 0.5, 0.5,
0, -3.780936, -7.069612, 1, -0.5, 0.5, 0.5,
0, -3.780936, -7.069612, 1, 1.5, 0.5, 0.5,
0, -3.780936, -7.069612, 0, 1.5, 0.5, 0.5,
1, -3.780936, -7.069612, 0, -0.5, 0.5, 0.5,
1, -3.780936, -7.069612, 1, -0.5, 0.5, 0.5,
1, -3.780936, -7.069612, 1, 1.5, 0.5, 0.5,
1, -3.780936, -7.069612, 0, 1.5, 0.5, 0.5,
2, -3.780936, -7.069612, 0, -0.5, 0.5, 0.5,
2, -3.780936, -7.069612, 1, -0.5, 0.5, 0.5,
2, -3.780936, -7.069612, 1, 1.5, 0.5, 0.5,
2, -3.780936, -7.069612, 0, 1.5, 0.5, 0.5,
3, -3.780936, -7.069612, 0, -0.5, 0.5, 0.5,
3, -3.780936, -7.069612, 1, -0.5, 0.5, 0.5,
3, -3.780936, -7.069612, 1, 1.5, 0.5, 0.5,
3, -3.780936, -7.069612, 0, 1.5, 0.5, 0.5
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
-3.43758, -3, -6.208509,
-3.43758, 3, -6.208509,
-3.43758, -3, -6.208509,
-3.600977, -3, -6.495543,
-3.43758, -2, -6.208509,
-3.600977, -2, -6.495543,
-3.43758, -1, -6.208509,
-3.600977, -1, -6.495543,
-3.43758, 0, -6.208509,
-3.600977, 0, -6.495543,
-3.43758, 1, -6.208509,
-3.600977, 1, -6.495543,
-3.43758, 2, -6.208509,
-3.600977, 2, -6.495543,
-3.43758, 3, -6.208509,
-3.600977, 3, -6.495543
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
-3.92777, -3, -7.069612, 0, -0.5, 0.5, 0.5,
-3.92777, -3, -7.069612, 1, -0.5, 0.5, 0.5,
-3.92777, -3, -7.069612, 1, 1.5, 0.5, 0.5,
-3.92777, -3, -7.069612, 0, 1.5, 0.5, 0.5,
-3.92777, -2, -7.069612, 0, -0.5, 0.5, 0.5,
-3.92777, -2, -7.069612, 1, -0.5, 0.5, 0.5,
-3.92777, -2, -7.069612, 1, 1.5, 0.5, 0.5,
-3.92777, -2, -7.069612, 0, 1.5, 0.5, 0.5,
-3.92777, -1, -7.069612, 0, -0.5, 0.5, 0.5,
-3.92777, -1, -7.069612, 1, -0.5, 0.5, 0.5,
-3.92777, -1, -7.069612, 1, 1.5, 0.5, 0.5,
-3.92777, -1, -7.069612, 0, 1.5, 0.5, 0.5,
-3.92777, 0, -7.069612, 0, -0.5, 0.5, 0.5,
-3.92777, 0, -7.069612, 1, -0.5, 0.5, 0.5,
-3.92777, 0, -7.069612, 1, 1.5, 0.5, 0.5,
-3.92777, 0, -7.069612, 0, 1.5, 0.5, 0.5,
-3.92777, 1, -7.069612, 0, -0.5, 0.5, 0.5,
-3.92777, 1, -7.069612, 1, -0.5, 0.5, 0.5,
-3.92777, 1, -7.069612, 1, 1.5, 0.5, 0.5,
-3.92777, 1, -7.069612, 0, 1.5, 0.5, 0.5,
-3.92777, 2, -7.069612, 0, -0.5, 0.5, 0.5,
-3.92777, 2, -7.069612, 1, -0.5, 0.5, 0.5,
-3.92777, 2, -7.069612, 1, 1.5, 0.5, 0.5,
-3.92777, 2, -7.069612, 0, 1.5, 0.5, 0.5,
-3.92777, 3, -7.069612, 0, -0.5, 0.5, 0.5,
-3.92777, 3, -7.069612, 1, -0.5, 0.5, 0.5,
-3.92777, 3, -7.069612, 1, 1.5, 0.5, 0.5,
-3.92777, 3, -7.069612, 0, 1.5, 0.5, 0.5
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
-3.43758, -3.260637, -6,
-3.43758, -3.260637, 4,
-3.43758, -3.260637, -6,
-3.600977, -3.43407, -6,
-3.43758, -3.260637, -4,
-3.600977, -3.43407, -4,
-3.43758, -3.260637, -2,
-3.600977, -3.43407, -2,
-3.43758, -3.260637, 0,
-3.600977, -3.43407, 0,
-3.43758, -3.260637, 2,
-3.600977, -3.43407, 2,
-3.43758, -3.260637, 4,
-3.600977, -3.43407, 4
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
-3.92777, -3.780936, -6, 0, -0.5, 0.5, 0.5,
-3.92777, -3.780936, -6, 1, -0.5, 0.5, 0.5,
-3.92777, -3.780936, -6, 1, 1.5, 0.5, 0.5,
-3.92777, -3.780936, -6, 0, 1.5, 0.5, 0.5,
-3.92777, -3.780936, -4, 0, -0.5, 0.5, 0.5,
-3.92777, -3.780936, -4, 1, -0.5, 0.5, 0.5,
-3.92777, -3.780936, -4, 1, 1.5, 0.5, 0.5,
-3.92777, -3.780936, -4, 0, 1.5, 0.5, 0.5,
-3.92777, -3.780936, -2, 0, -0.5, 0.5, 0.5,
-3.92777, -3.780936, -2, 1, -0.5, 0.5, 0.5,
-3.92777, -3.780936, -2, 1, 1.5, 0.5, 0.5,
-3.92777, -3.780936, -2, 0, 1.5, 0.5, 0.5,
-3.92777, -3.780936, 0, 0, -0.5, 0.5, 0.5,
-3.92777, -3.780936, 0, 1, -0.5, 0.5, 0.5,
-3.92777, -3.780936, 0, 1, 1.5, 0.5, 0.5,
-3.92777, -3.780936, 0, 0, 1.5, 0.5, 0.5,
-3.92777, -3.780936, 2, 0, -0.5, 0.5, 0.5,
-3.92777, -3.780936, 2, 1, -0.5, 0.5, 0.5,
-3.92777, -3.780936, 2, 1, 1.5, 0.5, 0.5,
-3.92777, -3.780936, 2, 0, 1.5, 0.5, 0.5,
-3.92777, -3.780936, 4, 0, -0.5, 0.5, 0.5,
-3.92777, -3.780936, 4, 1, -0.5, 0.5, 0.5,
-3.92777, -3.780936, 4, 1, 1.5, 0.5, 0.5,
-3.92777, -3.780936, 4, 0, 1.5, 0.5, 0.5
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
-3.43758, -3.260637, -6.208509,
-3.43758, 3.676686, -6.208509,
-3.43758, -3.260637, 5.272854,
-3.43758, 3.676686, 5.272854,
-3.43758, -3.260637, -6.208509,
-3.43758, -3.260637, 5.272854,
-3.43758, 3.676686, -6.208509,
-3.43758, 3.676686, 5.272854,
-3.43758, -3.260637, -6.208509,
3.098291, -3.260637, -6.208509,
-3.43758, -3.260637, 5.272854,
3.098291, -3.260637, 5.272854,
-3.43758, 3.676686, -6.208509,
3.098291, 3.676686, -6.208509,
-3.43758, 3.676686, 5.272854,
3.098291, 3.676686, 5.272854,
3.098291, -3.260637, -6.208509,
3.098291, 3.676686, -6.208509,
3.098291, -3.260637, 5.272854,
3.098291, 3.676686, 5.272854,
3.098291, -3.260637, -6.208509,
3.098291, -3.260637, 5.272854,
3.098291, 3.676686, -6.208509,
3.098291, 3.676686, 5.272854
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
var radius = 7.968053;
var distance = 35.45076;
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
mvMatrix.translate( 0.1696447, -0.2080249, 0.4678276 );
mvMatrix.scale( 1.318143, 1.241864, 0.7503651 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.45076);
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
Dieldrin<-read.table("Dieldrin.xyz")
```

```
## Error in read.table("Dieldrin.xyz"): no lines available in input
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
-3.342397, 0.637964, -1.385578, 0, 0, 1, 1, 1,
-2.734303, 0.5147926, -1.507679, 1, 0, 0, 1, 1,
-2.427214, 0.5906466, -1.213616, 1, 0, 0, 1, 1,
-2.418858, -2.552066, -2.978894, 1, 0, 0, 1, 1,
-2.39652, -0.6442677, -3.17754, 1, 0, 0, 1, 1,
-2.367589, -0.3453546, -0.8850066, 1, 0, 0, 1, 1,
-2.24513, -0.5054609, -0.5144981, 0, 0, 0, 1, 1,
-2.233516, 0.1266193, 0.2470588, 0, 0, 0, 1, 1,
-2.210545, -1.238302, -2.042887, 0, 0, 0, 1, 1,
-2.182921, -0.3547824, -1.880252, 0, 0, 0, 1, 1,
-2.176748, 0.2962762, 0.1785147, 0, 0, 0, 1, 1,
-2.171048, 0.03293084, -1.489137, 0, 0, 0, 1, 1,
-2.118459, 0.2185545, -1.236391, 0, 0, 0, 1, 1,
-2.111621, 0.7992147, -1.93134, 1, 1, 1, 1, 1,
-2.095662, 0.2566316, -2.127636, 1, 1, 1, 1, 1,
-2.075067, -1.936156, -1.786323, 1, 1, 1, 1, 1,
-2.041991, -0.3033884, -0.4913293, 1, 1, 1, 1, 1,
-2.005849, 1.553823, 0.2707285, 1, 1, 1, 1, 1,
-1.959323, 1.336353, -1.388695, 1, 1, 1, 1, 1,
-1.951786, -0.0603671, 0.7202903, 1, 1, 1, 1, 1,
-1.917658, 0.7699025, -1.730284, 1, 1, 1, 1, 1,
-1.905816, -1.994752, -0.3568304, 1, 1, 1, 1, 1,
-1.900749, 1.386878, -0.6174903, 1, 1, 1, 1, 1,
-1.861415, 1.725491, -0.1205176, 1, 1, 1, 1, 1,
-1.850514, -0.7015251, -0.6796674, 1, 1, 1, 1, 1,
-1.837906, 0.2928983, -1.15115, 1, 1, 1, 1, 1,
-1.832611, 0.1279439, -0.5159814, 1, 1, 1, 1, 1,
-1.825, 0.224279, -1.968601, 1, 1, 1, 1, 1,
-1.824286, 0.2219049, -1.667697, 0, 0, 1, 1, 1,
-1.82417, 0.3990037, -0.6237137, 1, 0, 0, 1, 1,
-1.807286, -1.758066, -0.2724977, 1, 0, 0, 1, 1,
-1.791647, -1.280626, -2.963387, 1, 0, 0, 1, 1,
-1.76344, 0.3773838, -1.824713, 1, 0, 0, 1, 1,
-1.759694, 0.4586553, -0.7339846, 1, 0, 0, 1, 1,
-1.756806, -0.5559607, -0.7264503, 0, 0, 0, 1, 1,
-1.723117, -0.5587928, -1.621008, 0, 0, 0, 1, 1,
-1.696105, 0.6183128, -0.06283017, 0, 0, 0, 1, 1,
-1.692057, 0.0942836, -0.1268935, 0, 0, 0, 1, 1,
-1.67444, -1.424733, -1.287866, 0, 0, 0, 1, 1,
-1.672718, 0.5444821, -0.1641811, 0, 0, 0, 1, 1,
-1.668669, -0.5281913, -0.9044856, 0, 0, 0, 1, 1,
-1.66704, 0.3602503, -2.354694, 1, 1, 1, 1, 1,
-1.659358, 0.6393193, -1.843707, 1, 1, 1, 1, 1,
-1.652396, 0.6989073, -0.8038995, 1, 1, 1, 1, 1,
-1.636649, 1.167432, -0.837473, 1, 1, 1, 1, 1,
-1.629244, 0.7068806, -0.5018698, 1, 1, 1, 1, 1,
-1.612015, -1.152159, -2.189946, 1, 1, 1, 1, 1,
-1.610163, -1.094561, -2.710254, 1, 1, 1, 1, 1,
-1.602453, -0.3005258, -0.627152, 1, 1, 1, 1, 1,
-1.591602, 0.7895435, 0.5962033, 1, 1, 1, 1, 1,
-1.585345, 1.661112, -0.8482838, 1, 1, 1, 1, 1,
-1.56396, 0.4362856, -0.5751423, 1, 1, 1, 1, 1,
-1.561348, -0.7747592, -0.4664893, 1, 1, 1, 1, 1,
-1.555853, -1.032105, -1.748575, 1, 1, 1, 1, 1,
-1.549574, 0.4255639, -2.657483, 1, 1, 1, 1, 1,
-1.548683, -0.6644009, -2.005093, 1, 1, 1, 1, 1,
-1.542441, 0.5969042, -0.9103294, 0, 0, 1, 1, 1,
-1.534991, -0.3016165, -2.762818, 1, 0, 0, 1, 1,
-1.488016, 1.489007, -0.7650301, 1, 0, 0, 1, 1,
-1.480953, -1.337978, -3.093518, 1, 0, 0, 1, 1,
-1.469282, -0.4602988, -2.092119, 1, 0, 0, 1, 1,
-1.467182, -0.148188, -3.21176, 1, 0, 0, 1, 1,
-1.461478, 0.7436907, -2.484179, 0, 0, 0, 1, 1,
-1.460595, 0.8541657, -0.1022393, 0, 0, 0, 1, 1,
-1.458408, -0.3833826, -0.9240686, 0, 0, 0, 1, 1,
-1.456205, -0.5322649, -2.81654, 0, 0, 0, 1, 1,
-1.456167, -0.9463358, -4.042993, 0, 0, 0, 1, 1,
-1.445041, 0.778739, 0.1917077, 0, 0, 0, 1, 1,
-1.435641, 2.212689, -0.877746, 0, 0, 0, 1, 1,
-1.428691, -0.5305544, 0.3611299, 1, 1, 1, 1, 1,
-1.422991, 0.6199639, -1.325398, 1, 1, 1, 1, 1,
-1.410767, 1.047921, -1.983179, 1, 1, 1, 1, 1,
-1.408292, 0.3439052, -2.263726, 1, 1, 1, 1, 1,
-1.390711, -2.694575, -3.323499, 1, 1, 1, 1, 1,
-1.385774, 2.601605, -2.67454, 1, 1, 1, 1, 1,
-1.383621, -0.5216568, 0.3468954, 1, 1, 1, 1, 1,
-1.350659, -0.4799751, -1.968388, 1, 1, 1, 1, 1,
-1.345962, 0.7241462, -1.109764, 1, 1, 1, 1, 1,
-1.344059, -0.5155961, 0.5278927, 1, 1, 1, 1, 1,
-1.342101, -0.2455445, -2.855159, 1, 1, 1, 1, 1,
-1.340696, 0.3716991, -0.1462669, 1, 1, 1, 1, 1,
-1.340452, -0.9505997, -2.08396, 1, 1, 1, 1, 1,
-1.313352, -0.5482208, -2.311847, 1, 1, 1, 1, 1,
-1.31249, 1.572529, -0.6319, 1, 1, 1, 1, 1,
-1.304, -0.4343456, -3.564998, 0, 0, 1, 1, 1,
-1.289927, -0.6135376, -1.983662, 1, 0, 0, 1, 1,
-1.28062, 1.72633, -1.830424, 1, 0, 0, 1, 1,
-1.280455, -0.2599975, -1.024826, 1, 0, 0, 1, 1,
-1.258352, 0.771657, -0.948496, 1, 0, 0, 1, 1,
-1.25295, -0.4494826, -2.985466, 1, 0, 0, 1, 1,
-1.235566, -2.45481, -1.367613, 0, 0, 0, 1, 1,
-1.234983, -0.9274621, -2.050717, 0, 0, 0, 1, 1,
-1.230357, -0.3759869, -1.859658, 0, 0, 0, 1, 1,
-1.228873, 0.825298, -1.034053, 0, 0, 0, 1, 1,
-1.224149, 0.2716615, -0.4036934, 0, 0, 0, 1, 1,
-1.222398, 1.223997, -0.4668222, 0, 0, 0, 1, 1,
-1.217071, 1.092881, 0.6276149, 0, 0, 0, 1, 1,
-1.211836, -0.3644473, -3.251363, 1, 1, 1, 1, 1,
-1.210318, 1.226697, -0.445684, 1, 1, 1, 1, 1,
-1.208406, -1.855595, -1.854687, 1, 1, 1, 1, 1,
-1.199364, 1.31511, 0.7299541, 1, 1, 1, 1, 1,
-1.197583, -0.8451182, -2.77844, 1, 1, 1, 1, 1,
-1.193939, 2.478039, 0.7825295, 1, 1, 1, 1, 1,
-1.19365, -0.5108631, -0.9147588, 1, 1, 1, 1, 1,
-1.185596, -0.5741409, -1.758799, 1, 1, 1, 1, 1,
-1.177552, 0.1008391, -2.132978, 1, 1, 1, 1, 1,
-1.172157, 0.4484548, -2.452519, 1, 1, 1, 1, 1,
-1.170822, 0.7626512, -0.1789251, 1, 1, 1, 1, 1,
-1.164512, -2.304401, -2.712468, 1, 1, 1, 1, 1,
-1.15876, 0.1716922, -2.29514, 1, 1, 1, 1, 1,
-1.158554, -0.905391, -3.420998, 1, 1, 1, 1, 1,
-1.146815, -0.3868174, -0.9339381, 1, 1, 1, 1, 1,
-1.145199, -0.7436945, -0.6471075, 0, 0, 1, 1, 1,
-1.144956, 0.50718, -1.950855, 1, 0, 0, 1, 1,
-1.140959, 0.298402, -2.436744, 1, 0, 0, 1, 1,
-1.129984, 0.9526336, -1.840873, 1, 0, 0, 1, 1,
-1.127228, -1.89713, -0.2497349, 1, 0, 0, 1, 1,
-1.125816, -1.228093, -2.959795, 1, 0, 0, 1, 1,
-1.120692, -1.687557, -3.869966, 0, 0, 0, 1, 1,
-1.115291, -0.3664527, -4.39338, 0, 0, 0, 1, 1,
-1.112993, -0.1978151, -2.504626, 0, 0, 0, 1, 1,
-1.112878, -0.4034194, -1.300623, 0, 0, 0, 1, 1,
-1.112603, 1.362067, 0.2848666, 0, 0, 0, 1, 1,
-1.097874, 1.718851, -0.3249214, 0, 0, 0, 1, 1,
-1.093244, 2.421235, -1.963114, 0, 0, 0, 1, 1,
-1.090867, -0.04304072, -1.264612, 1, 1, 1, 1, 1,
-1.086966, 0.273068, -1.99694, 1, 1, 1, 1, 1,
-1.085222, -1.170126, -2.965945, 1, 1, 1, 1, 1,
-1.084579, 0.618684, -0.9397671, 1, 1, 1, 1, 1,
-1.064111, 1.76595, -0.1556034, 1, 1, 1, 1, 1,
-1.061636, -0.06698999, -1.803792, 1, 1, 1, 1, 1,
-1.055578, 3.575657, 2.394458, 1, 1, 1, 1, 1,
-1.055461, 0.005231247, -2.450716, 1, 1, 1, 1, 1,
-1.054136, -0.8025423, -3.757948, 1, 1, 1, 1, 1,
-1.052662, -0.5807803, -2.322466, 1, 1, 1, 1, 1,
-1.046752, 0.6081365, -0.07213727, 1, 1, 1, 1, 1,
-1.04628, -0.448588, -2.249159, 1, 1, 1, 1, 1,
-1.046232, -0.1611913, -1.396652, 1, 1, 1, 1, 1,
-1.030952, 0.7380838, 0.07952522, 1, 1, 1, 1, 1,
-1.027364, -0.1967332, -2.728561, 1, 1, 1, 1, 1,
-1.026921, -1.244917, -1.308757, 0, 0, 1, 1, 1,
-1.010059, 0.2367517, -0.8547704, 1, 0, 0, 1, 1,
-1.007725, 0.5120471, -1.449335, 1, 0, 0, 1, 1,
-1.007594, 0.4847429, -2.306887, 1, 0, 0, 1, 1,
-1.006679, 2.753219, 0.8217201, 1, 0, 0, 1, 1,
-0.9981217, -0.4598512, -2.497406, 1, 0, 0, 1, 1,
-0.9962244, 1.985487, 0.02889064, 0, 0, 0, 1, 1,
-0.9956553, 0.1250416, -2.266203, 0, 0, 0, 1, 1,
-0.9894655, 1.038117, -0.6366384, 0, 0, 0, 1, 1,
-0.9877306, 0.03418974, -0.6009143, 0, 0, 0, 1, 1,
-0.9860945, 0.009905445, -0.9215246, 0, 0, 0, 1, 1,
-0.9760658, -0.1162007, -0.08001132, 0, 0, 0, 1, 1,
-0.9756286, -0.3714393, -2.65356, 0, 0, 0, 1, 1,
-0.9747157, -1.107953, -2.356542, 1, 1, 1, 1, 1,
-0.9745703, -1.318672, -0.08169226, 1, 1, 1, 1, 1,
-0.9694713, 1.929805, -1.020975, 1, 1, 1, 1, 1,
-0.9659449, 0.08297186, -2.423327, 1, 1, 1, 1, 1,
-0.9654986, 0.07390349, -2.429677, 1, 1, 1, 1, 1,
-0.9647964, 0.5674511, -2.045403, 1, 1, 1, 1, 1,
-0.9593263, 1.788745, 0.7532089, 1, 1, 1, 1, 1,
-0.9535512, -0.3608615, -1.630371, 1, 1, 1, 1, 1,
-0.9517813, -0.3978536, -1.250466, 1, 1, 1, 1, 1,
-0.9503513, 0.002723771, -0.2858455, 1, 1, 1, 1, 1,
-0.9495556, 2.055976, -1.225738, 1, 1, 1, 1, 1,
-0.9489176, -0.5225025, -1.212871, 1, 1, 1, 1, 1,
-0.9465292, 0.01923172, -2.055379, 1, 1, 1, 1, 1,
-0.9428511, -0.7195891, -1.121701, 1, 1, 1, 1, 1,
-0.9413037, 0.0457449, 0.08910576, 1, 1, 1, 1, 1,
-0.9391449, -0.1451101, -2.205884, 0, 0, 1, 1, 1,
-0.9288352, 0.6122303, -2.624586, 1, 0, 0, 1, 1,
-0.9249738, 0.6096467, 0.3510698, 1, 0, 0, 1, 1,
-0.9225758, 0.4512276, 0.05908378, 1, 0, 0, 1, 1,
-0.9115444, -0.9012266, -2.786322, 1, 0, 0, 1, 1,
-0.9109872, -1.710965, -3.216324, 1, 0, 0, 1, 1,
-0.9095494, -0.2052116, -1.309075, 0, 0, 0, 1, 1,
-0.9040262, -1.306139, -2.786386, 0, 0, 0, 1, 1,
-0.9019364, -0.384298, -0.7008009, 0, 0, 0, 1, 1,
-0.8952991, 0.7211674, -0.7268932, 0, 0, 0, 1, 1,
-0.8925108, 0.8124861, 0.3549835, 0, 0, 0, 1, 1,
-0.889018, 0.9519453, -1.531481, 0, 0, 0, 1, 1,
-0.8808104, 1.628336, 0.01355586, 0, 0, 0, 1, 1,
-0.880143, 1.527005, -0.4041108, 1, 1, 1, 1, 1,
-0.875845, -0.3788187, -1.347662, 1, 1, 1, 1, 1,
-0.8751481, -1.471556, -2.754883, 1, 1, 1, 1, 1,
-0.8738307, -0.2977232, -1.357416, 1, 1, 1, 1, 1,
-0.8736227, -0.2929843, -2.155026, 1, 1, 1, 1, 1,
-0.8685436, -2.523859, -5.223974, 1, 1, 1, 1, 1,
-0.8656989, -0.2976785, -1.802777, 1, 1, 1, 1, 1,
-0.8607273, 1.823827, -1.112155, 1, 1, 1, 1, 1,
-0.85863, -0.1418823, -3.299655, 1, 1, 1, 1, 1,
-0.8494546, -0.3055381, -1.489131, 1, 1, 1, 1, 1,
-0.8478574, 0.266376, -0.6600195, 1, 1, 1, 1, 1,
-0.8452059, -0.4157818, -2.597362, 1, 1, 1, 1, 1,
-0.8411872, 2.164442, -1.224227, 1, 1, 1, 1, 1,
-0.8383502, 1.335857, -2.925214, 1, 1, 1, 1, 1,
-0.8306591, -1.677597, -2.464484, 1, 1, 1, 1, 1,
-0.8285208, 0.1922042, -0.9903476, 0, 0, 1, 1, 1,
-0.820169, 0.8733376, -0.2344261, 1, 0, 0, 1, 1,
-0.8153957, 0.8451421, 0.8677812, 1, 0, 0, 1, 1,
-0.8079212, 0.6811411, -1.482699, 1, 0, 0, 1, 1,
-0.8079006, -0.8413725, -2.762864, 1, 0, 0, 1, 1,
-0.8061495, -0.9456723, -2.027612, 1, 0, 0, 1, 1,
-0.7968476, -0.711804, -1.412877, 0, 0, 0, 1, 1,
-0.7953751, 0.4608822, -1.831085, 0, 0, 0, 1, 1,
-0.7889401, 1.799109, -0.4398488, 0, 0, 0, 1, 1,
-0.7882034, -0.02464237, 0.1639257, 0, 0, 0, 1, 1,
-0.7850176, 1.160422, -1.927627, 0, 0, 0, 1, 1,
-0.7846624, 1.593895, -0.01432695, 0, 0, 0, 1, 1,
-0.7809077, 0.6561442, -0.1673758, 0, 0, 0, 1, 1,
-0.7793733, 1.24112, -0.9974485, 1, 1, 1, 1, 1,
-0.7750537, -0.3662134, -1.783, 1, 1, 1, 1, 1,
-0.7743615, -0.6928084, -1.516238, 1, 1, 1, 1, 1,
-0.7726229, -0.2376015, -0.9861774, 1, 1, 1, 1, 1,
-0.7709596, 0.2481816, -0.01014825, 1, 1, 1, 1, 1,
-0.7651517, -0.1087134, -2.578569, 1, 1, 1, 1, 1,
-0.7638555, 0.2334916, -3.374963, 1, 1, 1, 1, 1,
-0.7595757, 0.602681, -0.8381826, 1, 1, 1, 1, 1,
-0.7537603, 0.3957008, -2.699975, 1, 1, 1, 1, 1,
-0.7517526, -0.7044227, -2.64615, 1, 1, 1, 1, 1,
-0.7492269, -0.2234087, -1.05111, 1, 1, 1, 1, 1,
-0.7385612, 0.1832453, -1.202892, 1, 1, 1, 1, 1,
-0.7334774, -0.6756212, -3.0136, 1, 1, 1, 1, 1,
-0.7293975, -0.5522838, -1.848972, 1, 1, 1, 1, 1,
-0.7275999, -0.0002521115, -2.68944, 1, 1, 1, 1, 1,
-0.726129, 0.8203891, -0.2290045, 0, 0, 1, 1, 1,
-0.7250825, -1.052721, -3.86739, 1, 0, 0, 1, 1,
-0.7240379, -0.5527037, -1.548517, 1, 0, 0, 1, 1,
-0.7234914, 2.255665, -0.2243057, 1, 0, 0, 1, 1,
-0.7227517, -0.4210735, -1.901833, 1, 0, 0, 1, 1,
-0.7138118, 1.321779, -1.976913, 1, 0, 0, 1, 1,
-0.7112615, 0.1028433, -1.07243, 0, 0, 0, 1, 1,
-0.7111823, 0.3014826, -2.388197, 0, 0, 0, 1, 1,
-0.7078702, -0.4277841, -0.8853402, 0, 0, 0, 1, 1,
-0.6978652, -0.07511669, -0.8520331, 0, 0, 0, 1, 1,
-0.6940205, -1.185897, -4.302508, 0, 0, 0, 1, 1,
-0.6902533, 0.1966646, -0.7595463, 0, 0, 0, 1, 1,
-0.6841229, 1.620397, -0.4932085, 0, 0, 0, 1, 1,
-0.6791145, 1.332046, -2.11875, 1, 1, 1, 1, 1,
-0.6785254, 0.3992955, -1.815619, 1, 1, 1, 1, 1,
-0.6758724, 0.7102178, -0.9796479, 1, 1, 1, 1, 1,
-0.6723216, -0.4963184, -1.230927, 1, 1, 1, 1, 1,
-0.6722375, 0.4721054, 0.3966425, 1, 1, 1, 1, 1,
-0.6713948, -0.7160342, -0.5742231, 1, 1, 1, 1, 1,
-0.6600609, 1.245863, -2.028856, 1, 1, 1, 1, 1,
-0.6595966, 0.03775184, -0.984143, 1, 1, 1, 1, 1,
-0.6590811, 0.3958645, -0.6519895, 1, 1, 1, 1, 1,
-0.6559643, -0.3994411, -1.697356, 1, 1, 1, 1, 1,
-0.653966, -0.2318107, -4.26072, 1, 1, 1, 1, 1,
-0.650656, 0.3234583, -0.2866003, 1, 1, 1, 1, 1,
-0.6502894, 0.4867819, -0.5575119, 1, 1, 1, 1, 1,
-0.6499301, -0.8078861, -2.465236, 1, 1, 1, 1, 1,
-0.638693, 0.3925303, 0.4215614, 1, 1, 1, 1, 1,
-0.6371401, 0.2995957, -0.9738315, 0, 0, 1, 1, 1,
-0.6337641, -1.189384, -3.588593, 1, 0, 0, 1, 1,
-0.6319841, -0.394657, -2.106447, 1, 0, 0, 1, 1,
-0.6262717, 1.409149, -0.9691756, 1, 0, 0, 1, 1,
-0.6247674, -0.5866585, -1.70925, 1, 0, 0, 1, 1,
-0.6244928, 0.1222808, -0.8484381, 1, 0, 0, 1, 1,
-0.620006, 0.07256909, -0.6309398, 0, 0, 0, 1, 1,
-0.6184146, 0.5281611, -1.556483, 0, 0, 0, 1, 1,
-0.6159703, -0.9024839, -3.574038, 0, 0, 0, 1, 1,
-0.6099398, -0.5415905, -1.285203, 0, 0, 0, 1, 1,
-0.609449, 0.6461186, -0.3301716, 0, 0, 0, 1, 1,
-0.6076033, 0.5535678, -0.1322789, 0, 0, 0, 1, 1,
-0.6061314, -0.06379141, -1.903823, 0, 0, 0, 1, 1,
-0.6054972, -0.5646047, -2.016647, 1, 1, 1, 1, 1,
-0.6052234, 1.236151, 1.377312, 1, 1, 1, 1, 1,
-0.6045551, -0.5542953, -3.151432, 1, 1, 1, 1, 1,
-0.6040043, -0.6133154, -1.320109, 1, 1, 1, 1, 1,
-0.60037, 0.003445726, -1.983459, 1, 1, 1, 1, 1,
-0.5967252, -1.164675, -1.699436, 1, 1, 1, 1, 1,
-0.5959014, 0.8837869, -1.485823, 1, 1, 1, 1, 1,
-0.5941455, 0.07946612, -3.233178, 1, 1, 1, 1, 1,
-0.5935419, 1.721094, -0.6653072, 1, 1, 1, 1, 1,
-0.5910197, 1.296833, -0.6806165, 1, 1, 1, 1, 1,
-0.5890255, 1.584783, -0.5022485, 1, 1, 1, 1, 1,
-0.5877218, -1.335226, -4.400377, 1, 1, 1, 1, 1,
-0.5867791, -0.7062065, -2.556881, 1, 1, 1, 1, 1,
-0.5863872, -0.7219866, -1.07311, 1, 1, 1, 1, 1,
-0.5813148, -0.8830892, -1.608153, 1, 1, 1, 1, 1,
-0.5769778, 2.272645, -1.039862, 0, 0, 1, 1, 1,
-0.5732682, 1.813777, 0.8657209, 1, 0, 0, 1, 1,
-0.5699452, -0.2416721, -2.018261, 1, 0, 0, 1, 1,
-0.5634612, -0.5881068, -1.876973, 1, 0, 0, 1, 1,
-0.5609189, 0.2441968, -1.527915, 1, 0, 0, 1, 1,
-0.5582315, -0.3747589, -1.554873, 1, 0, 0, 1, 1,
-0.5546688, 0.04853644, -3.007046, 0, 0, 0, 1, 1,
-0.5526287, 0.4078243, -1.384829, 0, 0, 0, 1, 1,
-0.5517876, -1.356512, -3.761828, 0, 0, 0, 1, 1,
-0.5506606, -0.1400832, -2.515099, 0, 0, 0, 1, 1,
-0.5504063, -1.807311, -3.852999, 0, 0, 0, 1, 1,
-0.5435185, 0.08147494, -0.4558562, 0, 0, 0, 1, 1,
-0.5426023, 0.9694245, -2.358879, 0, 0, 0, 1, 1,
-0.5416712, -1.220665, -2.121793, 1, 1, 1, 1, 1,
-0.5407873, -0.8185416, -3.80156, 1, 1, 1, 1, 1,
-0.5260535, -1.012422, -3.167994, 1, 1, 1, 1, 1,
-0.5256547, -1.110476, -3.166792, 1, 1, 1, 1, 1,
-0.5179842, 0.53619, -0.2066913, 1, 1, 1, 1, 1,
-0.5147179, -0.2311017, -0.9035977, 1, 1, 1, 1, 1,
-0.5135115, 2.883876, -0.6329462, 1, 1, 1, 1, 1,
-0.5101131, -2.3689, -1.942398, 1, 1, 1, 1, 1,
-0.5093789, -0.1954195, -1.663941, 1, 1, 1, 1, 1,
-0.5085536, -1.573969, -1.553521, 1, 1, 1, 1, 1,
-0.5082322, -0.5087854, -1.661388, 1, 1, 1, 1, 1,
-0.5069781, -0.2728819, -3.109692, 1, 1, 1, 1, 1,
-0.505729, 0.3025728, 0.3150936, 1, 1, 1, 1, 1,
-0.5055999, 2.1579, -1.520985, 1, 1, 1, 1, 1,
-0.5047362, 1.006357, 1.028833, 1, 1, 1, 1, 1,
-0.4993964, -0.3951711, -2.72784, 0, 0, 1, 1, 1,
-0.4989624, -1.875499, -1.732117, 1, 0, 0, 1, 1,
-0.4983173, 0.7382664, -0.7315547, 1, 0, 0, 1, 1,
-0.4954534, -0.05440972, -4.05626, 1, 0, 0, 1, 1,
-0.4938818, 1.294135, -0.8427088, 1, 0, 0, 1, 1,
-0.4907811, 0.1915626, -1.488764, 1, 0, 0, 1, 1,
-0.4890006, -1.236102, -2.736281, 0, 0, 0, 1, 1,
-0.4875672, 0.5841606, 0.04188548, 0, 0, 0, 1, 1,
-0.4848658, -1.226377, -1.165659, 0, 0, 0, 1, 1,
-0.483305, -2.950735, -3.664892, 0, 0, 0, 1, 1,
-0.4830291, -0.02976925, -0.9086093, 0, 0, 0, 1, 1,
-0.4810569, -0.8733508, -2.041901, 0, 0, 0, 1, 1,
-0.4784033, 0.5632493, 0.5702246, 0, 0, 0, 1, 1,
-0.4770567, -0.5496746, -2.698014, 1, 1, 1, 1, 1,
-0.476153, 1.053159, -1.920845, 1, 1, 1, 1, 1,
-0.4757069, 1.903069, -0.03807038, 1, 1, 1, 1, 1,
-0.4728314, 0.02968765, -2.951716, 1, 1, 1, 1, 1,
-0.4656444, -0.562345, -2.247309, 1, 1, 1, 1, 1,
-0.4584324, -0.2130986, -2.208578, 1, 1, 1, 1, 1,
-0.458063, -0.6386805, -2.808867, 1, 1, 1, 1, 1,
-0.4500121, -1.119238, -2.781451, 1, 1, 1, 1, 1,
-0.4489547, -1.249039, -1.573453, 1, 1, 1, 1, 1,
-0.4436392, -1.165541, -0.9771985, 1, 1, 1, 1, 1,
-0.4420798, 1.69524, -0.02786889, 1, 1, 1, 1, 1,
-0.4367898, 0.4732778, -0.08328981, 1, 1, 1, 1, 1,
-0.4351747, -0.7325774, -2.009079, 1, 1, 1, 1, 1,
-0.4330074, -1.655312, -2.70957, 1, 1, 1, 1, 1,
-0.4323359, -0.1404077, -0.3464217, 1, 1, 1, 1, 1,
-0.4307199, 1.350732, -0.9644871, 0, 0, 1, 1, 1,
-0.4259354, -0.3704155, -1.979834, 1, 0, 0, 1, 1,
-0.4253543, -0.3769001, -2.244396, 1, 0, 0, 1, 1,
-0.4201393, -0.6300168, -0.7416531, 1, 0, 0, 1, 1,
-0.4183514, -1.033546, -2.939337, 1, 0, 0, 1, 1,
-0.4152721, -0.3936118, -4.550867, 1, 0, 0, 1, 1,
-0.40158, 0.5162869, -0.3420268, 0, 0, 0, 1, 1,
-0.4004215, 1.178282, -0.2990642, 0, 0, 0, 1, 1,
-0.3978669, 0.8514615, -0.759689, 0, 0, 0, 1, 1,
-0.3959236, 0.4118234, -1.401909, 0, 0, 0, 1, 1,
-0.3930285, -0.2148077, 0.5967565, 0, 0, 0, 1, 1,
-0.3874374, -0.6232857, -3.181417, 0, 0, 0, 1, 1,
-0.3837774, 1.272279, 0.1181528, 0, 0, 0, 1, 1,
-0.3827591, -0.751533, -5.06091, 1, 1, 1, 1, 1,
-0.3812893, -0.2446827, -1.558502, 1, 1, 1, 1, 1,
-0.3781528, -1.242108, -0.8466645, 1, 1, 1, 1, 1,
-0.3766704, -0.5314631, -5.222244, 1, 1, 1, 1, 1,
-0.3743005, -0.1878927, -1.492973, 1, 1, 1, 1, 1,
-0.3734956, -0.02327042, -2.212512, 1, 1, 1, 1, 1,
-0.3730372, -0.783245, -3.498653, 1, 1, 1, 1, 1,
-0.3720536, 0.7958567, 0.2795442, 1, 1, 1, 1, 1,
-0.3663463, -0.3801214, -2.035075, 1, 1, 1, 1, 1,
-0.3659183, 0.3789825, -2.12113, 1, 1, 1, 1, 1,
-0.364936, 0.0473772, -2.044785, 1, 1, 1, 1, 1,
-0.3648355, 0.1614739, -1.53954, 1, 1, 1, 1, 1,
-0.3641205, -0.6954607, -3.517521, 1, 1, 1, 1, 1,
-0.3596121, -3.159608, -3.240944, 1, 1, 1, 1, 1,
-0.3508106, -1.397097, -1.150537, 1, 1, 1, 1, 1,
-0.3500095, -1.810372, -0.7219353, 0, 0, 1, 1, 1,
-0.3494371, 0.3044858, -0.55294, 1, 0, 0, 1, 1,
-0.3485819, 0.1983549, -0.446479, 1, 0, 0, 1, 1,
-0.3463924, 0.5531837, 1.013547, 1, 0, 0, 1, 1,
-0.3463568, -0.3304582, -2.550148, 1, 0, 0, 1, 1,
-0.3458752, 0.008782404, -0.9074156, 1, 0, 0, 1, 1,
-0.3446257, 0.1584679, 0.687646, 0, 0, 0, 1, 1,
-0.3391594, 1.196159, 1.594989, 0, 0, 0, 1, 1,
-0.336275, 0.734734, -0.1488214, 0, 0, 0, 1, 1,
-0.3362207, -0.3504033, -1.870571, 0, 0, 0, 1, 1,
-0.3353355, 0.3616369, -0.5058978, 0, 0, 0, 1, 1,
-0.3313458, 0.35556, -0.5853336, 0, 0, 0, 1, 1,
-0.3303873, 0.1115238, -1.127146, 0, 0, 0, 1, 1,
-0.3294441, 0.3097205, -2.328701, 1, 1, 1, 1, 1,
-0.3294206, 0.5840865, -1.136573, 1, 1, 1, 1, 1,
-0.3174257, 1.109477, -0.752116, 1, 1, 1, 1, 1,
-0.3158349, 1.261142, -0.8870657, 1, 1, 1, 1, 1,
-0.3107682, -0.1714984, -2.813729, 1, 1, 1, 1, 1,
-0.3103561, -0.4813276, -1.817149, 1, 1, 1, 1, 1,
-0.3102931, -0.1726914, -1.129448, 1, 1, 1, 1, 1,
-0.3054576, 1.856214, -0.9509079, 1, 1, 1, 1, 1,
-0.3024781, 0.7713273, -1.324797, 1, 1, 1, 1, 1,
-0.3021743, -1.106506, -4.362454, 1, 1, 1, 1, 1,
-0.3013801, 1.017823, 0.2335531, 1, 1, 1, 1, 1,
-0.2989449, -0.6120248, -2.836414, 1, 1, 1, 1, 1,
-0.2967477, 0.7698318, -0.6064308, 1, 1, 1, 1, 1,
-0.2962855, 0.6350867, -0.1326973, 1, 1, 1, 1, 1,
-0.2955981, 0.8824354, -0.0873024, 1, 1, 1, 1, 1,
-0.2955699, 0.9649121, 0.57111, 0, 0, 1, 1, 1,
-0.2945778, -0.8439199, -2.168169, 1, 0, 0, 1, 1,
-0.2916839, -1.03024, -3.878844, 1, 0, 0, 1, 1,
-0.29162, -1.834201, -3.101787, 1, 0, 0, 1, 1,
-0.2857521, -0.8436704, -3.241798, 1, 0, 0, 1, 1,
-0.2850488, 0.5222157, 0.4602755, 1, 0, 0, 1, 1,
-0.284261, -0.3114075, -1.355295, 0, 0, 0, 1, 1,
-0.2795447, 1.49008, -1.913506, 0, 0, 0, 1, 1,
-0.2741199, 1.396366, 0.1133959, 0, 0, 0, 1, 1,
-0.2648667, -0.7346727, -1.185536, 0, 0, 0, 1, 1,
-0.2630553, 0.6760522, -0.7547038, 0, 0, 0, 1, 1,
-0.2588604, -0.9626004, -3.823635, 0, 0, 0, 1, 1,
-0.2570432, -0.3961197, -1.999483, 0, 0, 0, 1, 1,
-0.2566793, -1.000333, -3.328099, 1, 1, 1, 1, 1,
-0.2522618, 1.107903, 0.8057295, 1, 1, 1, 1, 1,
-0.2506798, 0.6938203, -0.1276801, 1, 1, 1, 1, 1,
-0.2418358, 0.4612593, -0.5124446, 1, 1, 1, 1, 1,
-0.2390545, -0.8818372, -2.211583, 1, 1, 1, 1, 1,
-0.238017, 1.205292, 1.398585, 1, 1, 1, 1, 1,
-0.2365112, -0.5611817, -1.931467, 1, 1, 1, 1, 1,
-0.2308407, -0.7900404, -4.374554, 1, 1, 1, 1, 1,
-0.2288541, -0.3092274, -3.655337, 1, 1, 1, 1, 1,
-0.2271569, -0.5168487, -4.281526, 1, 1, 1, 1, 1,
-0.218406, 0.06963234, -1.272486, 1, 1, 1, 1, 1,
-0.2169632, 0.1511827, -1.243077, 1, 1, 1, 1, 1,
-0.2146564, -1.333302, -2.300932, 1, 1, 1, 1, 1,
-0.2135054, -1.374846, -2.717948, 1, 1, 1, 1, 1,
-0.2093278, -1.138824, -1.650437, 1, 1, 1, 1, 1,
-0.209175, -1.125477, -4.829369, 0, 0, 1, 1, 1,
-0.2018209, -0.06993235, 0.244514, 1, 0, 0, 1, 1,
-0.1981385, 1.267556, 0.4597417, 1, 0, 0, 1, 1,
-0.1968344, 0.003409368, -1.630893, 1, 0, 0, 1, 1,
-0.1938162, 0.0976333, -1.120419, 1, 0, 0, 1, 1,
-0.1902258, -0.384064, -2.577082, 1, 0, 0, 1, 1,
-0.1886193, 0.7954733, -0.426761, 0, 0, 0, 1, 1,
-0.1852273, 0.7124088, 1.049931, 0, 0, 0, 1, 1,
-0.1845211, -1.109643, -3.345464, 0, 0, 0, 1, 1,
-0.17673, 1.138513, -0.7566673, 0, 0, 0, 1, 1,
-0.1748966, 0.9696772, -0.2561204, 0, 0, 0, 1, 1,
-0.1748811, -0.7314584, -2.235259, 0, 0, 0, 1, 1,
-0.1727643, -0.495862, -3.974757, 0, 0, 0, 1, 1,
-0.1723941, -0.8941907, -1.447446, 1, 1, 1, 1, 1,
-0.1687934, 0.6386987, 0.5450044, 1, 1, 1, 1, 1,
-0.1680724, 0.8881476, -0.6556806, 1, 1, 1, 1, 1,
-0.1660285, 1.43585, 1.451677, 1, 1, 1, 1, 1,
-0.1645675, -0.3946789, -3.511761, 1, 1, 1, 1, 1,
-0.154719, -0.5668036, -3.486234, 1, 1, 1, 1, 1,
-0.1543791, -0.2050734, -2.251605, 1, 1, 1, 1, 1,
-0.1483696, 1.085449, 1.02435, 1, 1, 1, 1, 1,
-0.1482916, -1.167052, -5.709683, 1, 1, 1, 1, 1,
-0.1476196, -2.254579, -4.1866, 1, 1, 1, 1, 1,
-0.1470917, -0.4409579, -4.215431, 1, 1, 1, 1, 1,
-0.1447967, 0.08365947, -0.8579516, 1, 1, 1, 1, 1,
-0.1446362, -1.095605, -1.44507, 1, 1, 1, 1, 1,
-0.1436523, -0.320605, -3.651708, 1, 1, 1, 1, 1,
-0.1421807, 0.08132105, -0.1821373, 1, 1, 1, 1, 1,
-0.1420026, -0.312861, -2.838401, 0, 0, 1, 1, 1,
-0.1369633, 1.313707, 0.4274292, 1, 0, 0, 1, 1,
-0.1326142, 0.5490844, -0.289622, 1, 0, 0, 1, 1,
-0.1300261, 2.13482, 0.9869894, 1, 0, 0, 1, 1,
-0.1293151, 0.03146011, -2.523707, 1, 0, 0, 1, 1,
-0.1270069, -2.10696, -2.893734, 1, 0, 0, 1, 1,
-0.1243096, -0.8107307, -1.923882, 0, 0, 0, 1, 1,
-0.1231404, 3.485644, 0.7473125, 0, 0, 0, 1, 1,
-0.1211003, 1.249714, -1.224915, 0, 0, 0, 1, 1,
-0.1176597, -0.1297206, -2.364695, 0, 0, 0, 1, 1,
-0.1131353, -0.723185, -3.95439, 0, 0, 0, 1, 1,
-0.1125123, -0.8174648, -1.916236, 0, 0, 0, 1, 1,
-0.1106873, 0.2293573, -0.02876603, 0, 0, 0, 1, 1,
-0.1074296, -0.3459825, -3.58365, 1, 1, 1, 1, 1,
-0.1058561, 0.2620094, 1.017395, 1, 1, 1, 1, 1,
-0.1047637, -0.9374004, -2.771265, 1, 1, 1, 1, 1,
-0.1030356, 0.302967, -0.01785037, 1, 1, 1, 1, 1,
-0.101955, -0.5908983, -3.531589, 1, 1, 1, 1, 1,
-0.09254397, -0.3350945, -2.757879, 1, 1, 1, 1, 1,
-0.08922584, -0.1939424, -2.510058, 1, 1, 1, 1, 1,
-0.08789907, -0.500561, -0.7854602, 1, 1, 1, 1, 1,
-0.08766215, 0.1822817, -0.4654549, 1, 1, 1, 1, 1,
-0.0853179, -1.422029, -3.378922, 1, 1, 1, 1, 1,
-0.07809441, -0.09672424, -3.203623, 1, 1, 1, 1, 1,
-0.07184401, 0.371031, -0.8617481, 1, 1, 1, 1, 1,
-0.07071875, -0.7113074, -3.754521, 1, 1, 1, 1, 1,
-0.06605984, -0.01249093, -1.408065, 1, 1, 1, 1, 1,
-0.06425133, 0.742574, -0.05146115, 1, 1, 1, 1, 1,
-0.06402467, 0.5782083, -0.4915907, 0, 0, 1, 1, 1,
-0.06348959, 1.39086, 0.4942104, 1, 0, 0, 1, 1,
-0.06215826, -0.1265621, -4.331049, 1, 0, 0, 1, 1,
-0.06126635, 1.671619, 0.6377301, 1, 0, 0, 1, 1,
-0.0612594, 0.5240616, -1.218149, 1, 0, 0, 1, 1,
-0.06050657, 0.3058493, 0.1075603, 1, 0, 0, 1, 1,
-0.05982213, -0.3396541, -3.632272, 0, 0, 0, 1, 1,
-0.05553844, -2.260587, -4.124241, 0, 0, 0, 1, 1,
-0.0553511, 1.281936, 1.409313, 0, 0, 0, 1, 1,
-0.04956973, -0.07262002, -1.223993, 0, 0, 0, 1, 1,
-0.04852096, 0.1104564, -1.544296, 0, 0, 0, 1, 1,
-0.04592426, 1.005297, 1.2101, 0, 0, 0, 1, 1,
-0.04477528, -2.577336, -3.641218, 0, 0, 0, 1, 1,
-0.04261902, 0.3064329, 0.4722439, 1, 1, 1, 1, 1,
-0.03695996, 1.197952, -0.3067095, 1, 1, 1, 1, 1,
-0.03551178, -1.71304, -3.330132, 1, 1, 1, 1, 1,
-0.02983152, 1.332337, 1.108031, 1, 1, 1, 1, 1,
-0.02846592, -0.5894477, -3.4739, 1, 1, 1, 1, 1,
-0.0267116, -0.5294703, -3.863014, 1, 1, 1, 1, 1,
-0.02596918, -0.3347717, -3.304924, 1, 1, 1, 1, 1,
-0.0239076, -0.5271322, -3.109443, 1, 1, 1, 1, 1,
-0.01935396, 2.047092, 0.7297041, 1, 1, 1, 1, 1,
-0.0189584, 0.412766, 0.5286741, 1, 1, 1, 1, 1,
-0.01801107, -1.394422, -3.214215, 1, 1, 1, 1, 1,
-0.01789729, 0.2481163, 1.111291, 1, 1, 1, 1, 1,
-0.01622377, 0.129817, -1.593657, 1, 1, 1, 1, 1,
-0.01273431, -1.168016, -3.329137, 1, 1, 1, 1, 1,
-0.01117595, -0.7319254, -4.168817, 1, 1, 1, 1, 1,
-0.0105247, -0.283621, -4.135529, 0, 0, 1, 1, 1,
-0.005137631, -0.03420034, -2.527828, 1, 0, 0, 1, 1,
-0.003661636, -0.3220997, -2.552462, 1, 0, 0, 1, 1,
-0.0032629, -1.044162, -6.041305, 1, 0, 0, 1, 1,
-0.002102873, -0.1955364, -4.415731, 1, 0, 0, 1, 1,
0.007689167, 0.06765229, 0.5972408, 1, 0, 0, 1, 1,
0.009684781, 0.5705938, 1.321914, 0, 0, 0, 1, 1,
0.01273004, -0.6765046, 2.175296, 0, 0, 0, 1, 1,
0.01452564, -0.3438088, 0.7293012, 0, 0, 0, 1, 1,
0.01616744, 0.6086542, 0.9779717, 0, 0, 0, 1, 1,
0.03105326, 0.2128352, 2.118834, 0, 0, 0, 1, 1,
0.03280707, 0.7411302, -0.1706778, 0, 0, 0, 1, 1,
0.04125601, 1.534086, -1.368157, 0, 0, 0, 1, 1,
0.04176835, 1.270178, 0.315387, 1, 1, 1, 1, 1,
0.05231682, -0.9665697, 3.095499, 1, 1, 1, 1, 1,
0.05484981, 0.1265018, 1.475825, 1, 1, 1, 1, 1,
0.05631072, 0.571927, 1.196131, 1, 1, 1, 1, 1,
0.06261171, -1.009067, 2.934393, 1, 1, 1, 1, 1,
0.06644709, -0.4504705, 2.038681, 1, 1, 1, 1, 1,
0.06957216, 1.345546, -1.615716, 1, 1, 1, 1, 1,
0.07542578, -0.4625783, 1.669925, 1, 1, 1, 1, 1,
0.07751584, -1.055973, 2.266107, 1, 1, 1, 1, 1,
0.0847183, -1.710835, 2.512936, 1, 1, 1, 1, 1,
0.08794158, -0.6049309, 2.284224, 1, 1, 1, 1, 1,
0.09877995, 0.1439782, 0.1839866, 1, 1, 1, 1, 1,
0.1096267, -0.9845909, 1.598133, 1, 1, 1, 1, 1,
0.1099857, -0.1076277, 2.425427, 1, 1, 1, 1, 1,
0.1116373, 0.5661501, 0.380889, 1, 1, 1, 1, 1,
0.1118864, 0.375727, -0.2673725, 0, 0, 1, 1, 1,
0.1167493, -0.872454, 2.927334, 1, 0, 0, 1, 1,
0.116882, 0.2532241, 0.08088964, 1, 0, 0, 1, 1,
0.1209152, 0.5824708, -1.210613, 1, 0, 0, 1, 1,
0.1218266, -1.237502, 2.747777, 1, 0, 0, 1, 1,
0.1274459, -0.6150474, 3.138868, 1, 0, 0, 1, 1,
0.127558, -1.625294, 4.531848, 0, 0, 0, 1, 1,
0.1291528, 0.1275848, -0.439727, 0, 0, 0, 1, 1,
0.131895, -0.8194513, 4.23539, 0, 0, 0, 1, 1,
0.134317, 0.5737923, -0.9544477, 0, 0, 0, 1, 1,
0.1351737, -1.474991, 2.893326, 0, 0, 0, 1, 1,
0.1381894, -1.679579, 3.200001, 0, 0, 0, 1, 1,
0.1405222, -0.738121, 3.209266, 0, 0, 0, 1, 1,
0.1438365, -0.8799258, 4.079137, 1, 1, 1, 1, 1,
0.145927, 0.1550112, 0.7176, 1, 1, 1, 1, 1,
0.1477193, 0.6832203, 1.177241, 1, 1, 1, 1, 1,
0.1493234, -0.8349977, 3.960701, 1, 1, 1, 1, 1,
0.150561, -0.4011669, 2.857677, 1, 1, 1, 1, 1,
0.1512333, 0.5497571, -0.2901005, 1, 1, 1, 1, 1,
0.1521784, -0.6315601, 3.376491, 1, 1, 1, 1, 1,
0.1523215, -0.6209697, 2.178649, 1, 1, 1, 1, 1,
0.1525581, 2.202223, 0.9241772, 1, 1, 1, 1, 1,
0.1616891, -1.129407, 0.7472501, 1, 1, 1, 1, 1,
0.1645472, -0.8195043, 2.817329, 1, 1, 1, 1, 1,
0.1712804, -0.389967, 1.301543, 1, 1, 1, 1, 1,
0.173163, 1.240875, -0.6497023, 1, 1, 1, 1, 1,
0.174692, 0.62672, 0.3176423, 1, 1, 1, 1, 1,
0.1765878, -0.7511895, 4.091807, 1, 1, 1, 1, 1,
0.1790247, 0.7258127, 0.1788002, 0, 0, 1, 1, 1,
0.1816275, -0.5872781, 3.650462, 1, 0, 0, 1, 1,
0.1824175, -0.8258886, 3.995086, 1, 0, 0, 1, 1,
0.1825547, -0.3677042, 1.352476, 1, 0, 0, 1, 1,
0.1838377, 0.9991903, -0.2228792, 1, 0, 0, 1, 1,
0.1858429, 0.361079, 1.418326, 1, 0, 0, 1, 1,
0.186693, -0.2895598, 3.673339, 0, 0, 0, 1, 1,
0.1890598, 0.008986543, 2.739019, 0, 0, 0, 1, 1,
0.19427, 1.131132, 1.081033, 0, 0, 0, 1, 1,
0.1956073, -0.6894322, 4.362771, 0, 0, 0, 1, 1,
0.1989142, -1.50736, 2.563088, 0, 0, 0, 1, 1,
0.199331, 0.5673404, 1.143161, 0, 0, 0, 1, 1,
0.201825, -0.6009478, 2.472007, 0, 0, 0, 1, 1,
0.2049786, -0.9478356, 4.206941, 1, 1, 1, 1, 1,
0.2055522, 0.6558599, -0.01236999, 1, 1, 1, 1, 1,
0.2108167, 0.1277863, 0.1179819, 1, 1, 1, 1, 1,
0.2109569, 0.9576637, -0.4957391, 1, 1, 1, 1, 1,
0.2120777, 0.497142, -0.2061395, 1, 1, 1, 1, 1,
0.212336, -1.75145, 4.286081, 1, 1, 1, 1, 1,
0.2125784, 0.7933269, 1.331947, 1, 1, 1, 1, 1,
0.2164681, -2.197472, 2.980276, 1, 1, 1, 1, 1,
0.2173661, 0.3346762, 0.008657679, 1, 1, 1, 1, 1,
0.2288495, -0.9049549, 3.547883, 1, 1, 1, 1, 1,
0.2385651, -0.02284852, 2.153375, 1, 1, 1, 1, 1,
0.2391598, -2.036857, 1.88262, 1, 1, 1, 1, 1,
0.2410718, 0.2702303, 1.894123, 1, 1, 1, 1, 1,
0.2423179, -0.1597698, 1.735118, 1, 1, 1, 1, 1,
0.2429281, 0.924709, 0.7710267, 1, 1, 1, 1, 1,
0.2463113, 0.4737723, 1.394901, 0, 0, 1, 1, 1,
0.2496042, 0.1887212, -0.1264987, 1, 0, 0, 1, 1,
0.2501169, -0.09401825, 1.559767, 1, 0, 0, 1, 1,
0.2519042, 0.3932373, -0.1505899, 1, 0, 0, 1, 1,
0.2522441, -0.1076074, 3.056767, 1, 0, 0, 1, 1,
0.252295, 1.273047, -0.4347994, 1, 0, 0, 1, 1,
0.2557189, 0.4790017, -0.03466953, 0, 0, 0, 1, 1,
0.2579951, -0.1215573, 1.035023, 0, 0, 0, 1, 1,
0.2583101, 1.42656, -1.492905, 0, 0, 0, 1, 1,
0.2591834, -1.063686, 3.731497, 0, 0, 0, 1, 1,
0.2593014, -0.6068348, 0.6084872, 0, 0, 0, 1, 1,
0.2655293, 0.8778542, 1.45577, 0, 0, 0, 1, 1,
0.2656933, -1.020845, 4.137218, 0, 0, 0, 1, 1,
0.2657002, -0.2988302, 2.236795, 1, 1, 1, 1, 1,
0.2661425, 0.9342754, 1.503006, 1, 1, 1, 1, 1,
0.2713572, 0.3432424, -0.3658974, 1, 1, 1, 1, 1,
0.2713647, -1.43248, 3.533728, 1, 1, 1, 1, 1,
0.2722249, 0.2696639, 0.8142534, 1, 1, 1, 1, 1,
0.2726959, 1.799348, -1.437769, 1, 1, 1, 1, 1,
0.2741839, -0.9418417, 1.766383, 1, 1, 1, 1, 1,
0.2763215, 1.220195, 1.594002, 1, 1, 1, 1, 1,
0.2853306, -1.217851, 2.68477, 1, 1, 1, 1, 1,
0.2895203, -0.3833002, 2.839087, 1, 1, 1, 1, 1,
0.2928924, -1.484237, 2.612413, 1, 1, 1, 1, 1,
0.2941779, -0.5369871, 2.222882, 1, 1, 1, 1, 1,
0.2943024, -0.9561594, 2.691883, 1, 1, 1, 1, 1,
0.2947475, 0.6504542, -0.1719716, 1, 1, 1, 1, 1,
0.2971424, 0.4111294, 0.5846539, 1, 1, 1, 1, 1,
0.3012467, -0.3848688, 0.6853523, 0, 0, 1, 1, 1,
0.3018497, 0.2661325, 2.172572, 1, 0, 0, 1, 1,
0.3043608, 0.1596957, 0.6355516, 1, 0, 0, 1, 1,
0.3051516, -0.9790395, 2.267805, 1, 0, 0, 1, 1,
0.3075026, -0.4085774, 4.062819, 1, 0, 0, 1, 1,
0.3116085, 0.1782163, 0.654851, 1, 0, 0, 1, 1,
0.3184172, -0.05386844, 3.109019, 0, 0, 0, 1, 1,
0.3187168, -0.2342661, 1.770952, 0, 0, 0, 1, 1,
0.3189088, -0.0008270217, 0.9130817, 0, 0, 0, 1, 1,
0.3234275, -0.5031779, 3.994674, 0, 0, 0, 1, 1,
0.3246451, -0.3986472, 2.364123, 0, 0, 0, 1, 1,
0.3261943, -0.0570168, 0.8975816, 0, 0, 0, 1, 1,
0.3272848, -0.03477177, 1.514369, 0, 0, 0, 1, 1,
0.3273375, -0.2073023, 2.868617, 1, 1, 1, 1, 1,
0.3292186, 0.792293, 1.216634, 1, 1, 1, 1, 1,
0.3296561, -0.189668, 3.408724, 1, 1, 1, 1, 1,
0.3299368, -0.002944706, 1.150509, 1, 1, 1, 1, 1,
0.3304261, 0.6590653, -1.976293, 1, 1, 1, 1, 1,
0.3333298, 0.3603181, -0.4722623, 1, 1, 1, 1, 1,
0.3342646, 0.2036819, 0.6474484, 1, 1, 1, 1, 1,
0.3354036, -1.155064, 0.8111474, 1, 1, 1, 1, 1,
0.3389906, -0.2086658, 1.42666, 1, 1, 1, 1, 1,
0.3402657, -0.3477687, 2.596463, 1, 1, 1, 1, 1,
0.3425102, 1.032034, 0.2062523, 1, 1, 1, 1, 1,
0.3520827, -0.3846793, 2.161479, 1, 1, 1, 1, 1,
0.3534829, -0.8717549, 2.322834, 1, 1, 1, 1, 1,
0.3536563, 1.547905, 1.61446, 1, 1, 1, 1, 1,
0.3566184, -0.8572162, 3.427328, 1, 1, 1, 1, 1,
0.3578547, 0.1488729, 1.359874, 0, 0, 1, 1, 1,
0.3591775, -0.02411394, 1.438789, 1, 0, 0, 1, 1,
0.3614624, -1.04945, 1.686026, 1, 0, 0, 1, 1,
0.3624545, -0.5449944, 3.386925, 1, 0, 0, 1, 1,
0.3697855, -0.1237641, 1.089227, 1, 0, 0, 1, 1,
0.3731278, 0.2750613, -0.2776423, 1, 0, 0, 1, 1,
0.3732891, 1.027304, -0.3863443, 0, 0, 0, 1, 1,
0.3750137, 0.8914835, 0.6955104, 0, 0, 0, 1, 1,
0.3754116, -0.05486768, 1.393798, 0, 0, 0, 1, 1,
0.3769544, 0.379286, 0.2323566, 0, 0, 0, 1, 1,
0.377886, -0.128375, 0.9066611, 0, 0, 0, 1, 1,
0.3781078, -0.06658692, 0.9721272, 0, 0, 0, 1, 1,
0.3785672, -0.131663, 3.173186, 0, 0, 0, 1, 1,
0.3811959, 0.5373728, 1.265946, 1, 1, 1, 1, 1,
0.381291, 0.6839929, -0.04877339, 1, 1, 1, 1, 1,
0.3835114, -1.183352, 2.488812, 1, 1, 1, 1, 1,
0.3883943, -0.7696546, 2.779466, 1, 1, 1, 1, 1,
0.3898417, -0.2416048, 3.386867, 1, 1, 1, 1, 1,
0.3953251, 0.6126793, -0.004227319, 1, 1, 1, 1, 1,
0.4016459, 1.841712, -0.6797535, 1, 1, 1, 1, 1,
0.4050714, -0.1879355, 1.237022, 1, 1, 1, 1, 1,
0.4079814, 0.6262975, 1.188513, 1, 1, 1, 1, 1,
0.4090286, 0.9902676, -0.6865344, 1, 1, 1, 1, 1,
0.4108399, 1.760323, 0.3915816, 1, 1, 1, 1, 1,
0.412277, 0.1380241, 1.258233, 1, 1, 1, 1, 1,
0.4130288, -0.07593653, 0.2807194, 1, 1, 1, 1, 1,
0.4171525, -1.654008, 3.882238, 1, 1, 1, 1, 1,
0.4178252, -1.824577, 3.239553, 1, 1, 1, 1, 1,
0.4187517, -0.01055961, 1.239168, 0, 0, 1, 1, 1,
0.4188065, 0.31083, -2.033873, 1, 0, 0, 1, 1,
0.4213766, -0.6184275, 3.78428, 1, 0, 0, 1, 1,
0.4282048, 0.3235058, -0.9650514, 1, 0, 0, 1, 1,
0.429529, 0.08914208, 2.516647, 1, 0, 0, 1, 1,
0.4348056, 0.8325503, 1.103662, 1, 0, 0, 1, 1,
0.4364505, -1.291156, 2.640915, 0, 0, 0, 1, 1,
0.4381983, 0.9298997, 0.3249526, 0, 0, 0, 1, 1,
0.4405234, 0.4408539, 2.022398, 0, 0, 0, 1, 1,
0.443426, -0.7739297, 3.68569, 0, 0, 0, 1, 1,
0.4470154, 0.04599364, 0.349552, 0, 0, 0, 1, 1,
0.4478762, -0.1942418, 1.368201, 0, 0, 0, 1, 1,
0.45208, 1.561677, 0.5650083, 0, 0, 0, 1, 1,
0.4560033, -0.7735373, 2.077348, 1, 1, 1, 1, 1,
0.4566075, 0.3817828, 1.959043, 1, 1, 1, 1, 1,
0.4586616, -0.5214539, 3.588279, 1, 1, 1, 1, 1,
0.4717675, -0.1188785, 2.539695, 1, 1, 1, 1, 1,
0.4744632, -0.7781243, 1.201548, 1, 1, 1, 1, 1,
0.4757181, 0.7453871, -0.9752078, 1, 1, 1, 1, 1,
0.4779113, -0.1593613, 2.716209, 1, 1, 1, 1, 1,
0.4788167, -0.01088452, 1.46302, 1, 1, 1, 1, 1,
0.4808075, 0.5461943, -0.1807206, 1, 1, 1, 1, 1,
0.4847758, -1.276824, 1.202962, 1, 1, 1, 1, 1,
0.4855924, -0.5681252, 3.626695, 1, 1, 1, 1, 1,
0.4907026, -1.976114, 2.848703, 1, 1, 1, 1, 1,
0.4910243, -1.473273, 4.113632, 1, 1, 1, 1, 1,
0.4920407, 0.6814051, 2.195526, 1, 1, 1, 1, 1,
0.4944604, -0.6165422, 3.360327, 1, 1, 1, 1, 1,
0.5038339, 0.8642938, -0.9186566, 0, 0, 1, 1, 1,
0.5042883, -0.7122078, 3.052099, 1, 0, 0, 1, 1,
0.5045001, 0.9274421, 0.5016683, 1, 0, 0, 1, 1,
0.5051515, -0.7336044, 2.146192, 1, 0, 0, 1, 1,
0.5080035, -0.1943051, 0.771673, 1, 0, 0, 1, 1,
0.5084229, 0.9312819, 0.2957453, 1, 0, 0, 1, 1,
0.5088876, -0.9366568, 2.430124, 0, 0, 0, 1, 1,
0.5107279, -1.430154, 1.400662, 0, 0, 0, 1, 1,
0.5127888, -0.8593294, 1.465124, 0, 0, 0, 1, 1,
0.5153984, 0.6597837, -0.9846418, 0, 0, 0, 1, 1,
0.5216922, -0.2280376, 2.384494, 0, 0, 0, 1, 1,
0.522554, 0.8757893, 0.242083, 0, 0, 0, 1, 1,
0.5244309, -0.1163729, 2.170618, 0, 0, 0, 1, 1,
0.5269592, -0.2003713, 2.36533, 1, 1, 1, 1, 1,
0.5298107, -0.5974724, 3.393172, 1, 1, 1, 1, 1,
0.5299799, -0.9334882, 4.905267, 1, 1, 1, 1, 1,
0.5349067, -0.6997501, 4.22963, 1, 1, 1, 1, 1,
0.5373497, -0.8885909, 2.097215, 1, 1, 1, 1, 1,
0.5387193, 1.176497, 0.6448667, 1, 1, 1, 1, 1,
0.5426841, -1.192234, 1.614224, 1, 1, 1, 1, 1,
0.5462365, -0.1529335, 1.268054, 1, 1, 1, 1, 1,
0.5504799, 0.5091931, 2.022887, 1, 1, 1, 1, 1,
0.5618011, 1.844259, -0.003238624, 1, 1, 1, 1, 1,
0.5633056, -2.328373, 3.442064, 1, 1, 1, 1, 1,
0.5651287, -1.069949, 1.822523, 1, 1, 1, 1, 1,
0.5655772, -1.401973, 2.486859, 1, 1, 1, 1, 1,
0.5676867, -0.02229228, 2.75528, 1, 1, 1, 1, 1,
0.5684941, 0.802496, 0.5117534, 1, 1, 1, 1, 1,
0.568672, -0.3015302, 2.337249, 0, 0, 1, 1, 1,
0.5690074, 0.5574197, -0.1082842, 1, 0, 0, 1, 1,
0.5690963, -0.01095466, 0.871682, 1, 0, 0, 1, 1,
0.5748989, 0.4269873, -1.771461, 1, 0, 0, 1, 1,
0.5863637, 0.5375513, 1.217036, 1, 0, 0, 1, 1,
0.5878527, 0.6840162, -0.6187733, 1, 0, 0, 1, 1,
0.5888919, 0.3114326, 1.024547, 0, 0, 0, 1, 1,
0.5898783, 0.5549691, -0.7042551, 0, 0, 0, 1, 1,
0.5929346, 0.6506925, 0.7718356, 0, 0, 0, 1, 1,
0.5944028, -0.2159349, 2.545863, 0, 0, 0, 1, 1,
0.5988934, -0.929966, 1.950044, 0, 0, 0, 1, 1,
0.6024399, 0.903635, -0.06075455, 0, 0, 0, 1, 1,
0.6041716, -1.405458, 2.665204, 0, 0, 0, 1, 1,
0.6056832, -1.156401, 4.211909, 1, 1, 1, 1, 1,
0.6057035, -1.199688, 2.857963, 1, 1, 1, 1, 1,
0.6130694, -0.9091217, 2.788771, 1, 1, 1, 1, 1,
0.6143327, 1.380776, 0.4244831, 1, 1, 1, 1, 1,
0.6239156, 0.1502262, 1.246133, 1, 1, 1, 1, 1,
0.6315544, 0.9960827, -0.3636856, 1, 1, 1, 1, 1,
0.6320452, 0.4631929, 0.9426616, 1, 1, 1, 1, 1,
0.6338184, 0.5990769, -0.153075, 1, 1, 1, 1, 1,
0.6348286, 0.6268668, -0.03288803, 1, 1, 1, 1, 1,
0.6385288, 0.2718344, 1.66041, 1, 1, 1, 1, 1,
0.6403013, -0.793473, 1.659821, 1, 1, 1, 1, 1,
0.6407592, -0.4407667, 3.017621, 1, 1, 1, 1, 1,
0.6507494, 0.2980794, 0.8457842, 1, 1, 1, 1, 1,
0.6513205, -1.082498, 3.044568, 1, 1, 1, 1, 1,
0.6547165, 0.67361, 1.169616, 1, 1, 1, 1, 1,
0.6565302, 1.770468, 0.230642, 0, 0, 1, 1, 1,
0.6591798, -0.4194658, 2.416263, 1, 0, 0, 1, 1,
0.6624992, 0.02139619, 1.788196, 1, 0, 0, 1, 1,
0.6652538, 0.2077583, 1.360283, 1, 0, 0, 1, 1,
0.6672083, -0.1891596, 1.725617, 1, 0, 0, 1, 1,
0.6672153, 0.5292733, 1.677766, 1, 0, 0, 1, 1,
0.6683832, 0.187365, 1.209375, 0, 0, 0, 1, 1,
0.6688069, 0.6386398, -0.4149114, 0, 0, 0, 1, 1,
0.6722087, -0.7555111, 2.514649, 0, 0, 0, 1, 1,
0.6817041, -0.6688939, 0.855358, 0, 0, 0, 1, 1,
0.6818558, 2.084953, 0.4304854, 0, 0, 0, 1, 1,
0.6825096, 0.4184316, 0.5474876, 0, 0, 0, 1, 1,
0.6844295, -1.110513, 0.8138624, 0, 0, 0, 1, 1,
0.6870307, 1.179418, -0.8648777, 1, 1, 1, 1, 1,
0.6875623, -0.4896989, 1.955987, 1, 1, 1, 1, 1,
0.688409, 0.05340482, 1.074322, 1, 1, 1, 1, 1,
0.6907967, -0.2511635, 0.6037863, 1, 1, 1, 1, 1,
0.6910436, -0.44119, 2.650168, 1, 1, 1, 1, 1,
0.6921422, 0.8897855, -0.3761553, 1, 1, 1, 1, 1,
0.6928437, -0.3986226, 0.7193147, 1, 1, 1, 1, 1,
0.6952211, -0.01462628, 2.603805, 1, 1, 1, 1, 1,
0.6964045, -0.9108195, 1.502629, 1, 1, 1, 1, 1,
0.6976346, -1.139418, 2.951776, 1, 1, 1, 1, 1,
0.7007166, 0.6839537, 1.757954, 1, 1, 1, 1, 1,
0.7012318, -0.07488017, 1.517338, 1, 1, 1, 1, 1,
0.7018722, -0.7963387, 1.629684, 1, 1, 1, 1, 1,
0.703269, -2.675794, 3.296763, 1, 1, 1, 1, 1,
0.7039652, -0.2067706, 2.193167, 1, 1, 1, 1, 1,
0.7050917, -1.399648, 3.535385, 0, 0, 1, 1, 1,
0.7101741, -1.297505, 2.941666, 1, 0, 0, 1, 1,
0.7155996, 0.2618985, 1.899691, 1, 0, 0, 1, 1,
0.7185017, -0.6502118, 3.187527, 1, 0, 0, 1, 1,
0.7266478, -1.115047, 2.863719, 1, 0, 0, 1, 1,
0.7305256, 0.1471333, 0.9688734, 1, 0, 0, 1, 1,
0.7314015, 0.9108468, -0.7025285, 0, 0, 0, 1, 1,
0.733027, -0.7716131, 1.805527, 0, 0, 0, 1, 1,
0.735827, 0.7445074, -1.412286, 0, 0, 0, 1, 1,
0.7407883, 0.02461117, 0.1245107, 0, 0, 0, 1, 1,
0.7443274, 0.1805542, 0.5149674, 0, 0, 0, 1, 1,
0.745639, 1.11121, -0.4342994, 0, 0, 0, 1, 1,
0.7478317, -0.468625, -0.3266893, 0, 0, 0, 1, 1,
0.7549373, 0.2123345, 2.669952, 1, 1, 1, 1, 1,
0.7565039, -2.193933, 1.47107, 1, 1, 1, 1, 1,
0.7572613, 1.555658, 0.1349079, 1, 1, 1, 1, 1,
0.7604624, -0.3470757, 2.53578, 1, 1, 1, 1, 1,
0.7608752, 0.2534514, 0.9644577, 1, 1, 1, 1, 1,
0.7620511, 0.7546027, -0.2666348, 1, 1, 1, 1, 1,
0.7639908, 0.781258, 1.538927, 1, 1, 1, 1, 1,
0.7691528, -1.545558, 2.919238, 1, 1, 1, 1, 1,
0.7737607, -1.253705, 1.449161, 1, 1, 1, 1, 1,
0.7769283, -0.003131896, 1.318106, 1, 1, 1, 1, 1,
0.7800643, -0.9007776, 2.732103, 1, 1, 1, 1, 1,
0.7810434, 0.7397858, 1.178267, 1, 1, 1, 1, 1,
0.7857174, 0.6945148, 0.8903386, 1, 1, 1, 1, 1,
0.7875927, 0.2737622, 2.524163, 1, 1, 1, 1, 1,
0.7880033, 0.3305476, 0.6552978, 1, 1, 1, 1, 1,
0.7889581, 1.227724, 2.182172, 0, 0, 1, 1, 1,
0.7905824, 0.2937559, 2.139828, 1, 0, 0, 1, 1,
0.7940348, 0.5711322, 2.038952, 1, 0, 0, 1, 1,
0.8206892, 0.6864657, 0.7064028, 1, 0, 0, 1, 1,
0.8222395, 0.3007469, 0.7313316, 1, 0, 0, 1, 1,
0.8228837, 0.9756561, -0.1709607, 1, 0, 0, 1, 1,
0.8241769, 0.18632, 2.356516, 0, 0, 0, 1, 1,
0.8302281, 2.05957, -1.309052, 0, 0, 0, 1, 1,
0.8307908, 0.1701994, 1.728371, 0, 0, 0, 1, 1,
0.8314317, -0.8218304, 2.404979, 0, 0, 0, 1, 1,
0.8337228, 0.1108426, 1.528783, 0, 0, 0, 1, 1,
0.8376708, -1.01476, 2.615474, 0, 0, 0, 1, 1,
0.8391486, 0.2367796, 2.404345, 0, 0, 0, 1, 1,
0.8423678, 0.4900007, 1.831851, 1, 1, 1, 1, 1,
0.8433363, 0.6549728, 0.5006378, 1, 1, 1, 1, 1,
0.8469208, 1.00678, 0.6281321, 1, 1, 1, 1, 1,
0.8497267, 0.9310819, 2.345277, 1, 1, 1, 1, 1,
0.8516717, -0.03415962, 1.301388, 1, 1, 1, 1, 1,
0.8517832, -1.573599, 2.258641, 1, 1, 1, 1, 1,
0.8566371, 0.6572282, 0.7168291, 1, 1, 1, 1, 1,
0.8632616, -0.8053448, 3.638869, 1, 1, 1, 1, 1,
0.8636218, 0.4123665, 1.858325, 1, 1, 1, 1, 1,
0.8785969, 0.3140319, 1.503554, 1, 1, 1, 1, 1,
0.8860161, -0.3288111, 0.9480458, 1, 1, 1, 1, 1,
0.8891788, -1.43369, 1.52086, 1, 1, 1, 1, 1,
0.8896878, 0.6196128, 1.234793, 1, 1, 1, 1, 1,
0.8900625, 0.0625948, 1.956004, 1, 1, 1, 1, 1,
0.8906213, -0.6794826, 1.945504, 1, 1, 1, 1, 1,
0.8920056, -0.3409942, 1.112594, 0, 0, 1, 1, 1,
0.892434, -0.9604047, 1.426211, 1, 0, 0, 1, 1,
0.9009882, -1.024468, 3.060248, 1, 0, 0, 1, 1,
0.9017666, -1.840115, 0.9156632, 1, 0, 0, 1, 1,
0.9024338, 0.8676042, -0.6052096, 1, 0, 0, 1, 1,
0.9298409, -0.4399001, 2.430266, 1, 0, 0, 1, 1,
0.9321529, 1.975556, 0.2901622, 0, 0, 0, 1, 1,
0.9374679, 0.05885974, 1.00672, 0, 0, 0, 1, 1,
0.9376366, -1.785427, 3.587126, 0, 0, 0, 1, 1,
0.9424129, -1.732173, 3.717715, 0, 0, 0, 1, 1,
0.9480629, -0.3865809, 1.128168, 0, 0, 0, 1, 1,
0.9558396, -0.9994391, 4.260759, 0, 0, 0, 1, 1,
0.9568977, -1.574959, 2.493863, 0, 0, 0, 1, 1,
0.9673501, 0.8065484, -0.5638676, 1, 1, 1, 1, 1,
0.9703955, -1.761117, 1.431637, 1, 1, 1, 1, 1,
0.9823079, -0.9959203, 2.100399, 1, 1, 1, 1, 1,
0.9840613, 0.780058, 2.377219, 1, 1, 1, 1, 1,
0.9864506, -0.1688734, 0.3652601, 1, 1, 1, 1, 1,
0.9940943, -0.4138947, 1.887464, 1, 1, 1, 1, 1,
0.9954817, 0.3009646, 0.3676172, 1, 1, 1, 1, 1,
1.007814, 2.360477, 0.8934327, 1, 1, 1, 1, 1,
1.014735, -0.6072329, 2.003902, 1, 1, 1, 1, 1,
1.020699, 1.448034, -0.3249551, 1, 1, 1, 1, 1,
1.020913, 0.7968062, 2.336087, 1, 1, 1, 1, 1,
1.022358, -2.024584, 5.10565, 1, 1, 1, 1, 1,
1.036576, -1.241428, 3.034892, 1, 1, 1, 1, 1,
1.040314, 1.839649, 1.708498, 1, 1, 1, 1, 1,
1.057074, 0.2998914, 0.4359438, 1, 1, 1, 1, 1,
1.066298, -0.423568, 2.021237, 0, 0, 1, 1, 1,
1.082135, -0.823248, 2.307946, 1, 0, 0, 1, 1,
1.086957, 0.8507282, 0.8924536, 1, 0, 0, 1, 1,
1.089544, -0.6046757, 1.359297, 1, 0, 0, 1, 1,
1.095346, -0.2912435, 1.855393, 1, 0, 0, 1, 1,
1.098855, -1.587313, 0.9998656, 1, 0, 0, 1, 1,
1.099126, -0.3745094, 1.052565, 0, 0, 0, 1, 1,
1.104437, -1.343227, 3.118175, 0, 0, 0, 1, 1,
1.114467, -0.07113665, 1.270004, 0, 0, 0, 1, 1,
1.116845, -0.1655349, 2.275722, 0, 0, 0, 1, 1,
1.119375, -0.5431306, 2.11127, 0, 0, 0, 1, 1,
1.123695, 1.520004, -1.882645, 0, 0, 0, 1, 1,
1.125968, 0.8430451, 1.780501, 0, 0, 0, 1, 1,
1.129071, -1.08141, 1.935139, 1, 1, 1, 1, 1,
1.129189, -1.314586, 0.4398479, 1, 1, 1, 1, 1,
1.12973, -2.465305, 3.537342, 1, 1, 1, 1, 1,
1.130526, 1.637063, 0.09239001, 1, 1, 1, 1, 1,
1.13235, 0.382019, 2.639918, 1, 1, 1, 1, 1,
1.135071, -0.2407703, 1.959866, 1, 1, 1, 1, 1,
1.144929, 1.817229, 0.9325807, 1, 1, 1, 1, 1,
1.14949, 1.346056, 0.2436751, 1, 1, 1, 1, 1,
1.15693, -0.1301134, 1.487744, 1, 1, 1, 1, 1,
1.162078, 1.668572, 1.333979, 1, 1, 1, 1, 1,
1.162499, -1.317024, 2.986984, 1, 1, 1, 1, 1,
1.178, -2.11073, 3.599092, 1, 1, 1, 1, 1,
1.17984, -0.7456033, 0.9629154, 1, 1, 1, 1, 1,
1.188685, -0.1376465, 1.232565, 1, 1, 1, 1, 1,
1.190055, 1.2006, -1.414134, 1, 1, 1, 1, 1,
1.190391, 0.2408108, 1.703173, 0, 0, 1, 1, 1,
1.191263, 1.194383, 0.1117955, 1, 0, 0, 1, 1,
1.198066, 0.4397511, 1.858886, 1, 0, 0, 1, 1,
1.198656, 0.8192012, 1.461691, 1, 0, 0, 1, 1,
1.206305, 1.828614, 1.039142, 1, 0, 0, 1, 1,
1.214445, 0.3845229, 0.2314496, 1, 0, 0, 1, 1,
1.215711, 0.773605, 0.3483869, 0, 0, 0, 1, 1,
1.220119, -0.0575076, 0.375028, 0, 0, 0, 1, 1,
1.222934, 0.928131, 0.3662124, 0, 0, 0, 1, 1,
1.223849, -0.6649881, 1.125631, 0, 0, 0, 1, 1,
1.25786, -0.6839131, 2.21091, 0, 0, 0, 1, 1,
1.259323, 0.4123494, -0.6671175, 0, 0, 0, 1, 1,
1.259736, 0.9725453, 2.53629, 0, 0, 0, 1, 1,
1.296088, 0.2293952, 2.239156, 1, 1, 1, 1, 1,
1.296837, 0.758687, 0.442931, 1, 1, 1, 1, 1,
1.300787, 0.2463538, 1.112901, 1, 1, 1, 1, 1,
1.301333, 0.2704605, 1.261712, 1, 1, 1, 1, 1,
1.307741, -0.08015746, 1.616091, 1, 1, 1, 1, 1,
1.30869, 1.136396, 1.264148, 1, 1, 1, 1, 1,
1.315118, 0.526647, 1.429614, 1, 1, 1, 1, 1,
1.319555, -0.45762, 1.306699, 1, 1, 1, 1, 1,
1.322121, 1.382001, 1.388648, 1, 1, 1, 1, 1,
1.322727, 0.08904495, 1.394941, 1, 1, 1, 1, 1,
1.332949, 1.138007, -0.2054264, 1, 1, 1, 1, 1,
1.347066, -0.3245896, 3.209617, 1, 1, 1, 1, 1,
1.356298, 0.9482121, 1.212732, 1, 1, 1, 1, 1,
1.359561, -0.3125258, 2.916594, 1, 1, 1, 1, 1,
1.374892, 0.5449709, 1.145216, 1, 1, 1, 1, 1,
1.375018, 2.044548, -1.56232, 0, 0, 1, 1, 1,
1.377243, 0.1660898, 1.751041, 1, 0, 0, 1, 1,
1.40135, 1.31317, 2.494482, 1, 0, 0, 1, 1,
1.402661, 0.203627, 1.921257, 1, 0, 0, 1, 1,
1.408675, -0.8812379, 1.983615, 1, 0, 0, 1, 1,
1.40944, 0.5195385, 1.949542, 1, 0, 0, 1, 1,
1.426629, 0.592209, 1.244868, 0, 0, 0, 1, 1,
1.440498, 0.7630303, -0.6637614, 0, 0, 0, 1, 1,
1.441529, -2.267912, 1.81875, 0, 0, 0, 1, 1,
1.442978, -0.7024048, 0.7463006, 0, 0, 0, 1, 1,
1.45761, -1.439497, 2.422779, 0, 0, 0, 1, 1,
1.470249, -0.3842525, 1.484498, 0, 0, 0, 1, 1,
1.473577, -0.04613611, -0.4933668, 0, 0, 0, 1, 1,
1.492602, 0.2291337, 1.474558, 1, 1, 1, 1, 1,
1.495536, -0.8498213, 1.031551, 1, 1, 1, 1, 1,
1.508627, -1.2988, 2.031537, 1, 1, 1, 1, 1,
1.509007, 0.8990739, 1.213797, 1, 1, 1, 1, 1,
1.530649, 1.049631, 1.513903, 1, 1, 1, 1, 1,
1.53609, 1.027238, 1.225098, 1, 1, 1, 1, 1,
1.543505, -0.722868, 3.949886, 1, 1, 1, 1, 1,
1.552307, 1.288421, 2.254962, 1, 1, 1, 1, 1,
1.56629, -0.6027033, 3.246438, 1, 1, 1, 1, 1,
1.568402, -0.5484008, 0.9550574, 1, 1, 1, 1, 1,
1.589432, 0.7240865, 0.006292962, 1, 1, 1, 1, 1,
1.611412, 0.4938221, 1.01424, 1, 1, 1, 1, 1,
1.618225, -0.3074945, 2.964275, 1, 1, 1, 1, 1,
1.619254, 0.4693118, 2.71084, 1, 1, 1, 1, 1,
1.621155, 1.759105, 1.405729, 1, 1, 1, 1, 1,
1.626194, 1.024834, 0.4217012, 0, 0, 1, 1, 1,
1.634684, 0.9650186, -0.6626186, 1, 0, 0, 1, 1,
1.639864, 0.1477835, 0.6989534, 1, 0, 0, 1, 1,
1.642561, -0.8238575, 0.6843362, 1, 0, 0, 1, 1,
1.644604, -1.158241, 2.97324, 1, 0, 0, 1, 1,
1.647664, -0.3886846, 2.285222, 1, 0, 0, 1, 1,
1.655842, -1.24233, 1.754107, 0, 0, 0, 1, 1,
1.660735, -0.1208822, 2.470352, 0, 0, 0, 1, 1,
1.677486, 0.07514416, 1.853012, 0, 0, 0, 1, 1,
1.681913, 0.2177615, 2.722044, 0, 0, 0, 1, 1,
1.683164, 1.015912, 2.740847, 0, 0, 0, 1, 1,
1.694169, 0.1287287, 0.3843162, 0, 0, 0, 1, 1,
1.706059, 0.138285, 1.454991, 0, 0, 0, 1, 1,
1.714076, 0.8203266, 0.7048825, 1, 1, 1, 1, 1,
1.722041, -0.290785, 1.794094, 1, 1, 1, 1, 1,
1.745124, 2.142177, -0.106984, 1, 1, 1, 1, 1,
1.77808, 0.7754176, 1.600616, 1, 1, 1, 1, 1,
1.778101, 0.1107991, 1.797927, 1, 1, 1, 1, 1,
1.779193, -0.2477178, 1.7054, 1, 1, 1, 1, 1,
1.812279, 1.859458, 0.9927249, 1, 1, 1, 1, 1,
1.825474, -0.4458652, 1.608675, 1, 1, 1, 1, 1,
1.829916, -0.63521, 3.411222, 1, 1, 1, 1, 1,
1.835797, 0.1620935, 0.9685531, 1, 1, 1, 1, 1,
1.838669, -0.1152638, 3.191923, 1, 1, 1, 1, 1,
1.840836, -0.5374573, 1.31059, 1, 1, 1, 1, 1,
1.849853, 0.8235198, 2.439642, 1, 1, 1, 1, 1,
1.850231, -0.07495178, 1.350069, 1, 1, 1, 1, 1,
1.91726, -0.4262046, 2.723921, 1, 1, 1, 1, 1,
1.919515, 0.1737046, -0.03486292, 0, 0, 1, 1, 1,
1.920163, -0.6403984, 2.268704, 1, 0, 0, 1, 1,
1.958435, -0.2282904, 1.321437, 1, 0, 0, 1, 1,
1.979888, 0.1489251, 2.287576, 1, 0, 0, 1, 1,
2.08944, -0.2244728, 1.794853, 1, 0, 0, 1, 1,
2.169776, -0.911485, 2.089234, 1, 0, 0, 1, 1,
2.1707, 0.2485881, 1.204837, 0, 0, 0, 1, 1,
2.190255, 1.893839, 0.5973893, 0, 0, 0, 1, 1,
2.201854, -1.563797, 3.166576, 0, 0, 0, 1, 1,
2.253257, 0.5463615, 1.919616, 0, 0, 0, 1, 1,
2.299963, 0.0149229, 1.623128, 0, 0, 0, 1, 1,
2.326642, -0.3699389, -0.4936767, 0, 0, 0, 1, 1,
2.392031, 0.2410101, -0.7228169, 0, 0, 0, 1, 1,
2.452458, 1.558361, 1.250585, 1, 1, 1, 1, 1,
2.643734, 0.941741, -0.7607576, 1, 1, 1, 1, 1,
2.775225, -1.41361, 1.373894, 1, 1, 1, 1, 1,
2.864859, -1.050881, 2.636051, 1, 1, 1, 1, 1,
2.958938, 0.4798436, 1.711633, 1, 1, 1, 1, 1,
2.964021, 0.3576289, 3.136835, 1, 1, 1, 1, 1,
3.003108, 0.109702, 1.516717, 1, 1, 1, 1, 1
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
var radius = 9.820153;
var distance = 34.49287;
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
mvMatrix.translate( 0.1696448, -0.2080247, 0.4678276 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.49287);
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
