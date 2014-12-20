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
-2.921395, -1.527557, -3.232759, 1, 0, 0, 1,
-2.863543, 0.7808937, -0.553284, 1, 0.007843138, 0, 1,
-2.755088, 0.1932898, -0.8609827, 1, 0.01176471, 0, 1,
-2.638676, 0.5384704, -1.106873, 1, 0.01960784, 0, 1,
-2.383269, -0.1264794, -0.1024526, 1, 0.02352941, 0, 1,
-2.373664, -1.235059, -2.608863, 1, 0.03137255, 0, 1,
-2.345709, -0.8975713, -0.9851843, 1, 0.03529412, 0, 1,
-2.267102, -0.01309529, -2.280145, 1, 0.04313726, 0, 1,
-2.245965, -0.6742373, -4.068205, 1, 0.04705882, 0, 1,
-2.221734, 3.018552, -0.7326986, 1, 0.05490196, 0, 1,
-2.167251, 1.396616, -2.38459, 1, 0.05882353, 0, 1,
-2.156309, -0.6348507, -1.785866, 1, 0.06666667, 0, 1,
-2.124561, -0.1043454, -2.026639, 1, 0.07058824, 0, 1,
-2.114928, -0.5799212, -2.685576, 1, 0.07843138, 0, 1,
-2.111884, 0.5609044, -2.399925, 1, 0.08235294, 0, 1,
-2.070106, 1.24906, -2.326939, 1, 0.09019608, 0, 1,
-2.047022, 0.6061824, -0.8194798, 1, 0.09411765, 0, 1,
-1.981042, -1.139958, -3.14608, 1, 0.1019608, 0, 1,
-1.97666, 0.6032055, -0.5743078, 1, 0.1098039, 0, 1,
-1.973433, 0.04731128, -0.8261294, 1, 0.1137255, 0, 1,
-1.956398, -0.1595127, -0.6862248, 1, 0.1215686, 0, 1,
-1.9508, -1.296568, -1.586333, 1, 0.1254902, 0, 1,
-1.93998, -0.8685247, -3.116184, 1, 0.1333333, 0, 1,
-1.925682, 1.601625, -2.715075, 1, 0.1372549, 0, 1,
-1.900166, 0.5689625, -1.57104, 1, 0.145098, 0, 1,
-1.883741, 2.068508, -2.091205, 1, 0.1490196, 0, 1,
-1.835382, 0.2668459, -0.4045693, 1, 0.1568628, 0, 1,
-1.821872, 0.5938305, -2.977914, 1, 0.1607843, 0, 1,
-1.784605, 0.2711496, -2.200601, 1, 0.1686275, 0, 1,
-1.758948, -0.7735134, -1.711094, 1, 0.172549, 0, 1,
-1.757579, -0.6883971, -3.399031, 1, 0.1803922, 0, 1,
-1.756267, -0.5431525, -1.885396, 1, 0.1843137, 0, 1,
-1.725398, 1.722014, -0.2585831, 1, 0.1921569, 0, 1,
-1.724644, -0.1031111, -2.046749, 1, 0.1960784, 0, 1,
-1.706777, -0.5660178, -1.748021, 1, 0.2039216, 0, 1,
-1.705667, 0.4464755, -3.030823, 1, 0.2117647, 0, 1,
-1.701861, -0.9145692, -1.737756, 1, 0.2156863, 0, 1,
-1.694547, 0.476764, -2.405066, 1, 0.2235294, 0, 1,
-1.692414, -0.8255377, -2.755346, 1, 0.227451, 0, 1,
-1.681058, 1.051045, -0.01718905, 1, 0.2352941, 0, 1,
-1.670324, 1.572842, 0.318886, 1, 0.2392157, 0, 1,
-1.666276, 0.07977057, -1.377976, 1, 0.2470588, 0, 1,
-1.661691, 0.04465521, -2.288458, 1, 0.2509804, 0, 1,
-1.660866, 1.211277, -2.837043, 1, 0.2588235, 0, 1,
-1.658774, 1.109441, 1.169861, 1, 0.2627451, 0, 1,
-1.657886, 2.039827, -0.01422841, 1, 0.2705882, 0, 1,
-1.629995, 0.8496902, -0.973209, 1, 0.2745098, 0, 1,
-1.617123, -0.616381, -2.608293, 1, 0.282353, 0, 1,
-1.616481, -1.111415, -2.739742, 1, 0.2862745, 0, 1,
-1.600893, 0.6906269, -2.682029, 1, 0.2941177, 0, 1,
-1.599238, 1.411771, -0.866537, 1, 0.3019608, 0, 1,
-1.593067, 0.6609372, -1.185738, 1, 0.3058824, 0, 1,
-1.58564, -1.675585, -1.465384, 1, 0.3137255, 0, 1,
-1.58182, 0.1403244, 0.01189078, 1, 0.3176471, 0, 1,
-1.57923, -0.08083148, -0.1192897, 1, 0.3254902, 0, 1,
-1.569018, -0.6111796, -3.233743, 1, 0.3294118, 0, 1,
-1.547136, -0.7446067, -0.4532796, 1, 0.3372549, 0, 1,
-1.546331, 0.2036055, -2.870292, 1, 0.3411765, 0, 1,
-1.543508, -0.02518526, -1.271009, 1, 0.3490196, 0, 1,
-1.542542, -0.5175537, -2.91231, 1, 0.3529412, 0, 1,
-1.539798, 0.3345391, -0.3142771, 1, 0.3607843, 0, 1,
-1.525885, -0.6416317, -1.734928, 1, 0.3647059, 0, 1,
-1.51416, -0.01126408, -1.064389, 1, 0.372549, 0, 1,
-1.511273, 0.9300778, -1.138798, 1, 0.3764706, 0, 1,
-1.506986, 0.6076526, -2.021252, 1, 0.3843137, 0, 1,
-1.49155, 0.7862361, -0.9541437, 1, 0.3882353, 0, 1,
-1.478388, -0.9566045, -2.275715, 1, 0.3960784, 0, 1,
-1.471393, 0.9186943, -2.180095, 1, 0.4039216, 0, 1,
-1.470807, 0.5703849, -1.544826, 1, 0.4078431, 0, 1,
-1.469025, -0.6735491, -3.557471, 1, 0.4156863, 0, 1,
-1.463274, -0.8707781, -2.528715, 1, 0.4196078, 0, 1,
-1.458824, 0.9258028, -1.733125, 1, 0.427451, 0, 1,
-1.454384, 1.548943, -0.3987092, 1, 0.4313726, 0, 1,
-1.449143, 1.036595, -2.269619, 1, 0.4392157, 0, 1,
-1.445041, -0.3778239, -1.513365, 1, 0.4431373, 0, 1,
-1.428662, 0.7800301, -0.6260964, 1, 0.4509804, 0, 1,
-1.427768, 0.9345823, -1.535546, 1, 0.454902, 0, 1,
-1.402246, -0.2320165, -1.0634, 1, 0.4627451, 0, 1,
-1.401652, 0.3980039, -2.213867, 1, 0.4666667, 0, 1,
-1.400989, 0.09256783, -1.335015, 1, 0.4745098, 0, 1,
-1.390515, -1.183508, -2.05927, 1, 0.4784314, 0, 1,
-1.380061, -1.372371, -2.461494, 1, 0.4862745, 0, 1,
-1.375001, 0.2630641, -0.9259585, 1, 0.4901961, 0, 1,
-1.373829, 0.04007628, -3.187204, 1, 0.4980392, 0, 1,
-1.367874, 0.6912792, -1.61101, 1, 0.5058824, 0, 1,
-1.358327, 0.9434792, -0.01974439, 1, 0.509804, 0, 1,
-1.349371, -1.245762, -2.477583, 1, 0.5176471, 0, 1,
-1.334026, 1.605345, -1.021164, 1, 0.5215687, 0, 1,
-1.317087, -0.2525778, -2.429182, 1, 0.5294118, 0, 1,
-1.296349, -0.003473293, -2.85225, 1, 0.5333334, 0, 1,
-1.295759, 0.2335228, -2.670723, 1, 0.5411765, 0, 1,
-1.294632, 1.82311, -0.6572459, 1, 0.5450981, 0, 1,
-1.288807, 1.954809, -0.9849863, 1, 0.5529412, 0, 1,
-1.286794, 2.495253, 1.159381, 1, 0.5568628, 0, 1,
-1.264586, -0.4355856, -1.195089, 1, 0.5647059, 0, 1,
-1.260765, 0.5893905, -1.445982, 1, 0.5686275, 0, 1,
-1.253287, -0.7562318, -1.96939, 1, 0.5764706, 0, 1,
-1.245937, 0.7537257, -1.976819, 1, 0.5803922, 0, 1,
-1.245738, 0.2915377, -2.475627, 1, 0.5882353, 0, 1,
-1.245725, -0.1725287, -1.299778, 1, 0.5921569, 0, 1,
-1.245423, -0.5265231, -1.773029, 1, 0.6, 0, 1,
-1.244548, -0.1831315, -0.009147392, 1, 0.6078432, 0, 1,
-1.234093, 0.07942894, -2.60452, 1, 0.6117647, 0, 1,
-1.232643, -0.4872323, -2.168947, 1, 0.6196079, 0, 1,
-1.231266, 0.2175853, -3.072275, 1, 0.6235294, 0, 1,
-1.230186, 1.006011, 0.2119131, 1, 0.6313726, 0, 1,
-1.225832, -0.9830469, -1.696054, 1, 0.6352941, 0, 1,
-1.22059, 0.1778277, 0.2651265, 1, 0.6431373, 0, 1,
-1.219473, -1.484636, -2.632217, 1, 0.6470588, 0, 1,
-1.217208, 0.1181733, -2.101623, 1, 0.654902, 0, 1,
-1.213528, 0.1681613, -0.1655968, 1, 0.6588235, 0, 1,
-1.208345, -1.157986, -1.309424, 1, 0.6666667, 0, 1,
-1.202698, 1.21835, -1.031467, 1, 0.6705883, 0, 1,
-1.201792, -1.95106, -2.569767, 1, 0.6784314, 0, 1,
-1.200071, 0.9682401, -2.069191, 1, 0.682353, 0, 1,
-1.198412, -0.511346, 0.522533, 1, 0.6901961, 0, 1,
-1.178581, 0.4622164, -1.380915, 1, 0.6941177, 0, 1,
-1.174046, 0.2498754, -3.928498, 1, 0.7019608, 0, 1,
-1.173536, -0.1208861, -1.694231, 1, 0.7098039, 0, 1,
-1.16749, 0.2016585, -0.3283898, 1, 0.7137255, 0, 1,
-1.167058, 0.4877054, -0.7769881, 1, 0.7215686, 0, 1,
-1.161094, -0.05917862, -1.244475, 1, 0.7254902, 0, 1,
-1.153454, 0.4959812, -1.011386, 1, 0.7333333, 0, 1,
-1.141469, 1.565061, -0.9483855, 1, 0.7372549, 0, 1,
-1.133911, 1.225261, -0.9223251, 1, 0.7450981, 0, 1,
-1.131027, -2.112916, -3.881757, 1, 0.7490196, 0, 1,
-1.123178, -0.3111431, -2.224332, 1, 0.7568628, 0, 1,
-1.120639, -1.577541, -2.069481, 1, 0.7607843, 0, 1,
-1.105428, 0.2789195, -2.06899, 1, 0.7686275, 0, 1,
-1.102466, 1.716615, -0.965527, 1, 0.772549, 0, 1,
-1.09508, -0.6753196, -0.768214, 1, 0.7803922, 0, 1,
-1.092856, 0.7513016, -0.0007965607, 1, 0.7843137, 0, 1,
-1.09159, -1.115694, -2.673443, 1, 0.7921569, 0, 1,
-1.091448, 1.86583, -2.077633, 1, 0.7960784, 0, 1,
-1.087866, 0.6156666, -1.698982, 1, 0.8039216, 0, 1,
-1.068814, 1.30027, -1.195758, 1, 0.8117647, 0, 1,
-1.058172, 0.02524966, -0.5333361, 1, 0.8156863, 0, 1,
-1.057749, 0.535201, -0.3578548, 1, 0.8235294, 0, 1,
-1.052518, -1.705653, -1.546497, 1, 0.827451, 0, 1,
-1.051412, 2.204812, 0.8695564, 1, 0.8352941, 0, 1,
-1.051373, 0.08745939, -3.651983, 1, 0.8392157, 0, 1,
-1.050962, 1.804623, -0.7477365, 1, 0.8470588, 0, 1,
-1.050321, -0.1873043, -1.403473, 1, 0.8509804, 0, 1,
-1.049717, -0.02847717, -1.908983, 1, 0.8588235, 0, 1,
-1.049217, -1.76488, -2.329774, 1, 0.8627451, 0, 1,
-1.045151, 0.03564363, 0.6211031, 1, 0.8705882, 0, 1,
-1.04297, -1.350271, -2.239706, 1, 0.8745098, 0, 1,
-1.034469, -1.024648, -4.662139, 1, 0.8823529, 0, 1,
-1.031129, -1.026507, -3.279634, 1, 0.8862745, 0, 1,
-1.030557, -0.1937217, -1.694942, 1, 0.8941177, 0, 1,
-1.025324, -1.714273, -2.375133, 1, 0.8980392, 0, 1,
-1.024968, 0.08183889, -1.664, 1, 0.9058824, 0, 1,
-1.007096, -0.1808619, -1.866794, 1, 0.9137255, 0, 1,
-1.007049, -0.615828, -1.67567, 1, 0.9176471, 0, 1,
-1.006036, 0.6991153, -0.5989161, 1, 0.9254902, 0, 1,
-1.005814, -0.5600667, -0.8425539, 1, 0.9294118, 0, 1,
-0.9981954, 0.8528149, -1.635978, 1, 0.9372549, 0, 1,
-0.9955966, 0.2112869, -3.44675, 1, 0.9411765, 0, 1,
-0.9950055, 0.04757429, -0.4446352, 1, 0.9490196, 0, 1,
-0.9885803, -1.494425, -2.346402, 1, 0.9529412, 0, 1,
-0.9825027, -0.2255752, -1.883238, 1, 0.9607843, 0, 1,
-0.9795209, -1.228355, -2.125368, 1, 0.9647059, 0, 1,
-0.9786721, -0.4781673, -0.7132359, 1, 0.972549, 0, 1,
-0.9777746, 0.4667704, -1.48298, 1, 0.9764706, 0, 1,
-0.9769855, 1.559239, -0.7125434, 1, 0.9843137, 0, 1,
-0.972131, 0.1667863, -2.842544, 1, 0.9882353, 0, 1,
-0.9670498, 1.919387, 0.7217677, 1, 0.9960784, 0, 1,
-0.9655818, -0.7994305, -2.930851, 0.9960784, 1, 0, 1,
-0.9615413, -1.255158, -2.115264, 0.9921569, 1, 0, 1,
-0.9589741, -0.06683487, -3.138518, 0.9843137, 1, 0, 1,
-0.9505937, 0.5546002, -1.12706, 0.9803922, 1, 0, 1,
-0.9490333, 0.06983676, -0.1570055, 0.972549, 1, 0, 1,
-0.9442968, 0.5600777, -2.830224, 0.9686275, 1, 0, 1,
-0.9424589, -0.3723611, -1.834444, 0.9607843, 1, 0, 1,
-0.9413466, 0.5284904, -2.057142, 0.9568627, 1, 0, 1,
-0.9349155, 0.324628, -1.044927, 0.9490196, 1, 0, 1,
-0.9304279, 0.7899829, 1.491171, 0.945098, 1, 0, 1,
-0.925915, -1.585436, -3.580755, 0.9372549, 1, 0, 1,
-0.9197927, 2.0315, -1.474502, 0.9333333, 1, 0, 1,
-0.9185175, -1.227541, -2.309768, 0.9254902, 1, 0, 1,
-0.9156794, -0.08551567, -3.461964, 0.9215686, 1, 0, 1,
-0.9091495, 0.897552, -0.1076938, 0.9137255, 1, 0, 1,
-0.9040132, 0.2836988, -3.122429, 0.9098039, 1, 0, 1,
-0.8912068, 0.4045421, -1.410828, 0.9019608, 1, 0, 1,
-0.8902817, 0.09560541, -0.8222027, 0.8941177, 1, 0, 1,
-0.8857304, 0.3652226, 0.0001073786, 0.8901961, 1, 0, 1,
-0.8808561, 0.9137942, 0.3182316, 0.8823529, 1, 0, 1,
-0.8758526, -1.697237, -3.342282, 0.8784314, 1, 0, 1,
-0.8756106, 0.1994449, -0.4406213, 0.8705882, 1, 0, 1,
-0.8742505, 0.1311382, -1.623389, 0.8666667, 1, 0, 1,
-0.8625773, 0.7861527, -1.845867, 0.8588235, 1, 0, 1,
-0.8619832, -0.5459844, -1.369426, 0.854902, 1, 0, 1,
-0.8534384, -0.4239011, -3.115479, 0.8470588, 1, 0, 1,
-0.848763, -0.317221, -1.912515, 0.8431373, 1, 0, 1,
-0.8480929, -0.9925939, -2.218506, 0.8352941, 1, 0, 1,
-0.8451062, 0.6405116, -0.05992769, 0.8313726, 1, 0, 1,
-0.8446481, 0.06121953, -3.930485, 0.8235294, 1, 0, 1,
-0.8406383, 0.5960852, -1.751061, 0.8196079, 1, 0, 1,
-0.837972, -0.237719, -0.8795613, 0.8117647, 1, 0, 1,
-0.8294066, 1.262583, -1.673628, 0.8078431, 1, 0, 1,
-0.8292663, -0.4459887, -2.471, 0.8, 1, 0, 1,
-0.8258815, 0.4387488, -0.4530933, 0.7921569, 1, 0, 1,
-0.8252098, 1.506502, 0.1589697, 0.7882353, 1, 0, 1,
-0.8250123, -0.672479, -4.39179, 0.7803922, 1, 0, 1,
-0.8234788, 1.407913, -0.3549809, 0.7764706, 1, 0, 1,
-0.8210483, -0.6468579, -2.100034, 0.7686275, 1, 0, 1,
-0.8204414, 1.149376, 0.8588176, 0.7647059, 1, 0, 1,
-0.8197421, 2.633694, 0.8926745, 0.7568628, 1, 0, 1,
-0.8117378, 0.9048936, -0.7559185, 0.7529412, 1, 0, 1,
-0.8065676, -0.3892437, -2.395395, 0.7450981, 1, 0, 1,
-0.8040217, -0.8168129, -2.405669, 0.7411765, 1, 0, 1,
-0.8017397, 2.408227, -1.326552, 0.7333333, 1, 0, 1,
-0.8000736, -0.990767, -2.93777, 0.7294118, 1, 0, 1,
-0.7965297, -1.775813, -2.199584, 0.7215686, 1, 0, 1,
-0.7932006, 1.08215, -1.497293, 0.7176471, 1, 0, 1,
-0.7890397, 1.050506, -0.7828321, 0.7098039, 1, 0, 1,
-0.7832028, -0.3580619, -2.126637, 0.7058824, 1, 0, 1,
-0.7762819, -0.3365562, -2.425432, 0.6980392, 1, 0, 1,
-0.7728771, 1.299778, -0.3536423, 0.6901961, 1, 0, 1,
-0.7702695, -0.3275358, -2.032329, 0.6862745, 1, 0, 1,
-0.7623404, -0.3926086, -2.91677, 0.6784314, 1, 0, 1,
-0.7586791, -0.02663739, -2.167351, 0.6745098, 1, 0, 1,
-0.7550815, 0.6410843, -0.0364419, 0.6666667, 1, 0, 1,
-0.7545407, -1.010785, -3.156571, 0.6627451, 1, 0, 1,
-0.7535446, -0.6180473, -1.772376, 0.654902, 1, 0, 1,
-0.7514952, -0.1008401, -2.276944, 0.6509804, 1, 0, 1,
-0.742125, 0.9222699, -0.459421, 0.6431373, 1, 0, 1,
-0.7420413, -0.3047832, -2.137458, 0.6392157, 1, 0, 1,
-0.7245353, 0.3721046, -1.330813, 0.6313726, 1, 0, 1,
-0.7237691, -0.4794351, -2.197091, 0.627451, 1, 0, 1,
-0.7181422, -0.5133103, -1.106306, 0.6196079, 1, 0, 1,
-0.7154809, -0.5237602, -2.08176, 0.6156863, 1, 0, 1,
-0.7133352, 0.2731689, -0.6574227, 0.6078432, 1, 0, 1,
-0.7108583, -0.6046121, -1.844323, 0.6039216, 1, 0, 1,
-0.7077743, -0.3087214, -4.231748, 0.5960785, 1, 0, 1,
-0.7067165, -0.005914255, -1.819629, 0.5882353, 1, 0, 1,
-0.7065192, -1.355742, -2.63895, 0.5843138, 1, 0, 1,
-0.7057238, 0.05970859, -3.054763, 0.5764706, 1, 0, 1,
-0.7042338, 0.07675911, -3.134602, 0.572549, 1, 0, 1,
-0.6972355, -0.359802, -2.752859, 0.5647059, 1, 0, 1,
-0.6949465, -1.413036, -2.994722, 0.5607843, 1, 0, 1,
-0.6941611, 0.5471797, -1.231122, 0.5529412, 1, 0, 1,
-0.6885737, 0.06275883, -1.716392, 0.5490196, 1, 0, 1,
-0.6841645, -1.376653, -1.649974, 0.5411765, 1, 0, 1,
-0.6808422, 0.6195706, -0.2374253, 0.5372549, 1, 0, 1,
-0.6770805, -0.3657273, -0.4387693, 0.5294118, 1, 0, 1,
-0.672197, 1.338686, 0.8333416, 0.5254902, 1, 0, 1,
-0.6709723, -0.6245464, -2.217921, 0.5176471, 1, 0, 1,
-0.6703149, 0.5304929, -1.413166, 0.5137255, 1, 0, 1,
-0.6669533, -0.1123825, -3.312146, 0.5058824, 1, 0, 1,
-0.6659576, -0.9102728, -3.552881, 0.5019608, 1, 0, 1,
-0.6622614, 0.4704532, -1.610762, 0.4941176, 1, 0, 1,
-0.6621469, -1.214789, -4.638242, 0.4862745, 1, 0, 1,
-0.6580313, -0.80273, -2.751778, 0.4823529, 1, 0, 1,
-0.6573542, 2.363782, 0.2345429, 0.4745098, 1, 0, 1,
-0.6570414, -0.410322, -1.895655, 0.4705882, 1, 0, 1,
-0.6437799, -1.68943, -2.960608, 0.4627451, 1, 0, 1,
-0.6413321, 0.1384735, -2.638937, 0.4588235, 1, 0, 1,
-0.6358413, -0.1413763, -2.121479, 0.4509804, 1, 0, 1,
-0.6337404, 0.4216469, -1.641509, 0.4470588, 1, 0, 1,
-0.6331162, 0.6497228, -0.1915203, 0.4392157, 1, 0, 1,
-0.6323811, -0.02901394, -3.53582, 0.4352941, 1, 0, 1,
-0.6220543, -0.7392139, -3.610325, 0.427451, 1, 0, 1,
-0.6191418, -1.830961, -4.182423, 0.4235294, 1, 0, 1,
-0.6138541, -0.9885463, -3.198615, 0.4156863, 1, 0, 1,
-0.6127015, 1.321119, 1.058676, 0.4117647, 1, 0, 1,
-0.6060258, -0.7516199, -2.347924, 0.4039216, 1, 0, 1,
-0.6054532, -0.2793754, -3.296698, 0.3960784, 1, 0, 1,
-0.5916089, -0.2110422, -1.683459, 0.3921569, 1, 0, 1,
-0.5871038, 2.276374, 0.749351, 0.3843137, 1, 0, 1,
-0.5747443, -0.4949557, -1.438681, 0.3803922, 1, 0, 1,
-0.5727532, -1.413605, -1.156231, 0.372549, 1, 0, 1,
-0.5688294, 0.5307896, -0.08066889, 0.3686275, 1, 0, 1,
-0.5681169, 0.4479023, -0.7001508, 0.3607843, 1, 0, 1,
-0.5644124, -0.3163007, -1.946465, 0.3568628, 1, 0, 1,
-0.5638023, 0.01937889, -1.499397, 0.3490196, 1, 0, 1,
-0.5612353, -0.831835, -1.984562, 0.345098, 1, 0, 1,
-0.5550843, 2.569111, 1.49097, 0.3372549, 1, 0, 1,
-0.5455645, 0.4264713, -3.001971, 0.3333333, 1, 0, 1,
-0.543339, 1.601519, -0.665659, 0.3254902, 1, 0, 1,
-0.5412565, -0.3420821, -1.413682, 0.3215686, 1, 0, 1,
-0.5408925, 0.09191865, -2.138803, 0.3137255, 1, 0, 1,
-0.5401549, -0.5354887, -2.660991, 0.3098039, 1, 0, 1,
-0.5387309, -0.9408294, -3.325159, 0.3019608, 1, 0, 1,
-0.5374544, -1.273488, -3.154754, 0.2941177, 1, 0, 1,
-0.536972, 1.989998, -1.632495, 0.2901961, 1, 0, 1,
-0.5365005, -0.1300293, -0.9245558, 0.282353, 1, 0, 1,
-0.5322587, 0.6437999, -0.1807687, 0.2784314, 1, 0, 1,
-0.5308235, 0.02473218, -0.7357666, 0.2705882, 1, 0, 1,
-0.5305118, 0.3950363, -1.463361, 0.2666667, 1, 0, 1,
-0.5295476, 1.235411, -1.401149, 0.2588235, 1, 0, 1,
-0.5282869, -1.548466, -2.892448, 0.254902, 1, 0, 1,
-0.5280645, -1.326772, -2.723766, 0.2470588, 1, 0, 1,
-0.5269696, 1.251468, 0.1423413, 0.2431373, 1, 0, 1,
-0.5205573, 2.784837, 0.00938269, 0.2352941, 1, 0, 1,
-0.5140535, 1.278492, -0.03892272, 0.2313726, 1, 0, 1,
-0.509864, 0.4578555, -0.7556005, 0.2235294, 1, 0, 1,
-0.5072538, -0.2179915, -0.8467716, 0.2196078, 1, 0, 1,
-0.5060382, -1.743734, -0.3106787, 0.2117647, 1, 0, 1,
-0.5021532, -0.6827583, -2.385369, 0.2078431, 1, 0, 1,
-0.5005446, -0.659919, -1.656679, 0.2, 1, 0, 1,
-0.4988589, 0.315922, -2.895823, 0.1921569, 1, 0, 1,
-0.4933978, 1.013224, 0.04485606, 0.1882353, 1, 0, 1,
-0.4892735, 0.2543253, 0.07384685, 0.1803922, 1, 0, 1,
-0.4873944, -0.1821986, -0.4864225, 0.1764706, 1, 0, 1,
-0.4779967, -0.5396819, -2.337675, 0.1686275, 1, 0, 1,
-0.4776654, -1.241511, -3.386614, 0.1647059, 1, 0, 1,
-0.4666701, -0.7772495, -2.092487, 0.1568628, 1, 0, 1,
-0.4654585, -1.019499, -1.769202, 0.1529412, 1, 0, 1,
-0.4631081, -2.99459, -4.285941, 0.145098, 1, 0, 1,
-0.4612049, 0.6580877, 1.513774, 0.1411765, 1, 0, 1,
-0.4599108, 0.4915902, -2.167241, 0.1333333, 1, 0, 1,
-0.4546182, 1.336387, -1.863409, 0.1294118, 1, 0, 1,
-0.4533038, -0.1242301, -1.252083, 0.1215686, 1, 0, 1,
-0.4511824, -0.008614803, -1.85374, 0.1176471, 1, 0, 1,
-0.4461882, 0.7358655, -0.3568335, 0.1098039, 1, 0, 1,
-0.4449452, 1.204648, -0.8108813, 0.1058824, 1, 0, 1,
-0.4436813, 0.5698485, -0.2326616, 0.09803922, 1, 0, 1,
-0.4412619, -0.2865897, -1.361539, 0.09019608, 1, 0, 1,
-0.4405155, -0.6490138, -2.358675, 0.08627451, 1, 0, 1,
-0.438767, -0.5547382, -2.973648, 0.07843138, 1, 0, 1,
-0.4297047, -0.3903035, -0.4776324, 0.07450981, 1, 0, 1,
-0.4289835, 0.2436169, -2.570024, 0.06666667, 1, 0, 1,
-0.419664, -0.6022491, -2.591102, 0.0627451, 1, 0, 1,
-0.4154079, 0.4734539, -2.789993, 0.05490196, 1, 0, 1,
-0.4147035, -0.01301108, -3.21762, 0.05098039, 1, 0, 1,
-0.4136069, 0.2041274, -1.271305, 0.04313726, 1, 0, 1,
-0.4124768, 1.238338, -0.08187819, 0.03921569, 1, 0, 1,
-0.4072084, 0.8072914, 0.2612507, 0.03137255, 1, 0, 1,
-0.4069426, 1.007564, 0.09535893, 0.02745098, 1, 0, 1,
-0.4047388, 0.0164889, -2.767557, 0.01960784, 1, 0, 1,
-0.4005792, -1.324041, -4.101921, 0.01568628, 1, 0, 1,
-0.4002492, -0.5184943, -1.411967, 0.007843138, 1, 0, 1,
-0.3978747, 0.155884, -2.231697, 0.003921569, 1, 0, 1,
-0.3961966, -1.184712, -2.323375, 0, 1, 0.003921569, 1,
-0.395777, -0.387721, -2.036767, 0, 1, 0.01176471, 1,
-0.3892805, -1.900245, -2.050179, 0, 1, 0.01568628, 1,
-0.385938, 1.076432, -1.394333, 0, 1, 0.02352941, 1,
-0.3832272, 0.7322327, 0.2447692, 0, 1, 0.02745098, 1,
-0.3824878, -1.018263, -1.700262, 0, 1, 0.03529412, 1,
-0.3815697, 1.612194, -0.6472371, 0, 1, 0.03921569, 1,
-0.3813954, 0.09998702, -0.7835501, 0, 1, 0.04705882, 1,
-0.3769129, -0.9979229, -5.096375, 0, 1, 0.05098039, 1,
-0.3749691, 0.9101062, 0.2758483, 0, 1, 0.05882353, 1,
-0.3729165, -0.4160833, -2.281523, 0, 1, 0.0627451, 1,
-0.3721225, -1.49171, -2.80941, 0, 1, 0.07058824, 1,
-0.3689364, -0.65031, -4.111623, 0, 1, 0.07450981, 1,
-0.3649403, 0.03523967, -0.9948098, 0, 1, 0.08235294, 1,
-0.3648371, 0.5448291, 0.3178753, 0, 1, 0.08627451, 1,
-0.362194, -0.09135094, -1.994704, 0, 1, 0.09411765, 1,
-0.3608187, -1.28457, -4.231694, 0, 1, 0.1019608, 1,
-0.3605952, -0.646673, -1.209493, 0, 1, 0.1058824, 1,
-0.3600077, 0.1756374, -3.099734, 0, 1, 0.1137255, 1,
-0.3589196, 1.506948, -0.4074582, 0, 1, 0.1176471, 1,
-0.3525198, 0.1439802, -0.1445467, 0, 1, 0.1254902, 1,
-0.3477666, -0.7160119, -4.142064, 0, 1, 0.1294118, 1,
-0.3452597, -0.2488731, -1.955415, 0, 1, 0.1372549, 1,
-0.3403955, 0.5146528, -2.924542, 0, 1, 0.1411765, 1,
-0.3286916, -0.1271001, -0.3997179, 0, 1, 0.1490196, 1,
-0.3280372, -0.07254796, -0.9503358, 0, 1, 0.1529412, 1,
-0.3278389, -1.023242, -3.840077, 0, 1, 0.1607843, 1,
-0.3195044, -0.7545673, -0.2849665, 0, 1, 0.1647059, 1,
-0.3185724, 1.920315, -0.8651549, 0, 1, 0.172549, 1,
-0.3184928, 0.2234856, -1.869983, 0, 1, 0.1764706, 1,
-0.3169061, 1.037583, 0.1460756, 0, 1, 0.1843137, 1,
-0.3155293, -0.1835167, -4.068501, 0, 1, 0.1882353, 1,
-0.308373, -0.8598294, -3.472912, 0, 1, 0.1960784, 1,
-0.3057668, -0.8529391, -2.14898, 0, 1, 0.2039216, 1,
-0.3015176, -1.109177, -3.45683, 0, 1, 0.2078431, 1,
-0.2997979, 0.6023479, -0.09761237, 0, 1, 0.2156863, 1,
-0.2984153, 0.3627012, 0.06166963, 0, 1, 0.2196078, 1,
-0.295947, -0.1422644, -1.620256, 0, 1, 0.227451, 1,
-0.2946926, -0.2932038, -2.203892, 0, 1, 0.2313726, 1,
-0.2918743, -2.046728, -2.191504, 0, 1, 0.2392157, 1,
-0.2883749, -0.715246, -2.999658, 0, 1, 0.2431373, 1,
-0.2858973, -1.268375, -2.192677, 0, 1, 0.2509804, 1,
-0.2751339, 1.470568, -1.567388, 0, 1, 0.254902, 1,
-0.2722495, -0.06247011, -3.044403, 0, 1, 0.2627451, 1,
-0.2715202, 0.7113454, 1.474419, 0, 1, 0.2666667, 1,
-0.263281, -0.05638268, -2.820919, 0, 1, 0.2745098, 1,
-0.2587695, -0.3054391, -4.42046, 0, 1, 0.2784314, 1,
-0.2585388, 1.572103, -1.399327, 0, 1, 0.2862745, 1,
-0.2525281, -0.2315073, -3.520058, 0, 1, 0.2901961, 1,
-0.2498422, 1.295272, 0.5268267, 0, 1, 0.2980392, 1,
-0.2454696, -1.39871, -2.919774, 0, 1, 0.3058824, 1,
-0.2448959, -1.283898, -3.63333, 0, 1, 0.3098039, 1,
-0.2432464, 0.759831, 0.6202254, 0, 1, 0.3176471, 1,
-0.2415757, -0.317883, -3.320276, 0, 1, 0.3215686, 1,
-0.2413783, 0.1248161, 0.4498712, 0, 1, 0.3294118, 1,
-0.2411563, 0.1923835, -0.6240083, 0, 1, 0.3333333, 1,
-0.2406421, 0.4880572, -1.435992, 0, 1, 0.3411765, 1,
-0.2369317, -0.4308688, -4.307933, 0, 1, 0.345098, 1,
-0.2368292, -1.433393, -3.4827, 0, 1, 0.3529412, 1,
-0.2350609, 1.099051, 0.6050482, 0, 1, 0.3568628, 1,
-0.2343995, -0.4312875, -2.418904, 0, 1, 0.3647059, 1,
-0.2342176, -1.090956, -3.741714, 0, 1, 0.3686275, 1,
-0.2338414, -2.001954, -2.685163, 0, 1, 0.3764706, 1,
-0.2305365, 0.6606943, -1.533372, 0, 1, 0.3803922, 1,
-0.2282856, 0.8714256, -0.7891859, 0, 1, 0.3882353, 1,
-0.2256875, 0.1903851, -1.174868, 0, 1, 0.3921569, 1,
-0.2249786, 0.3224452, 1.153437, 0, 1, 0.4, 1,
-0.2248023, 0.3201423, 0.8615977, 0, 1, 0.4078431, 1,
-0.2240043, -0.1971286, -1.499409, 0, 1, 0.4117647, 1,
-0.2175993, 0.006884439, -0.7761766, 0, 1, 0.4196078, 1,
-0.2147393, -0.2103071, -4.563119, 0, 1, 0.4235294, 1,
-0.2123862, -0.07827009, -1.476437, 0, 1, 0.4313726, 1,
-0.2103909, -0.8529195, -1.525379, 0, 1, 0.4352941, 1,
-0.2072469, 0.07151744, -0.4967008, 0, 1, 0.4431373, 1,
-0.2062024, 0.5520163, -2.307389, 0, 1, 0.4470588, 1,
-0.2061329, -2.603609, -1.755398, 0, 1, 0.454902, 1,
-0.2023391, 0.8637044, -1.03545, 0, 1, 0.4588235, 1,
-0.2022974, -0.8025554, -3.204858, 0, 1, 0.4666667, 1,
-0.2020665, -0.3002312, -1.483471, 0, 1, 0.4705882, 1,
-0.2009996, 0.03564908, -1.096163, 0, 1, 0.4784314, 1,
-0.198577, -0.2084484, -2.33438, 0, 1, 0.4823529, 1,
-0.1969042, 2.352886, -0.02575153, 0, 1, 0.4901961, 1,
-0.1961788, -0.3194988, -4.459773, 0, 1, 0.4941176, 1,
-0.1912695, 0.6153438, -1.869085, 0, 1, 0.5019608, 1,
-0.1900287, -0.2125719, -3.916551, 0, 1, 0.509804, 1,
-0.188357, -0.2275036, -3.103513, 0, 1, 0.5137255, 1,
-0.1871208, -0.9579508, -2.366141, 0, 1, 0.5215687, 1,
-0.1865197, 0.9154699, 0.2653276, 0, 1, 0.5254902, 1,
-0.1845155, -1.343371, -1.474714, 0, 1, 0.5333334, 1,
-0.1806258, -0.5449601, -1.220538, 0, 1, 0.5372549, 1,
-0.1804022, -1.957829, -2.858361, 0, 1, 0.5450981, 1,
-0.1744818, -0.9356596, -3.604623, 0, 1, 0.5490196, 1,
-0.1727513, -0.4609301, -0.6689914, 0, 1, 0.5568628, 1,
-0.1723459, 1.082116, -0.5068716, 0, 1, 0.5607843, 1,
-0.169964, -2.000145, -3.345694, 0, 1, 0.5686275, 1,
-0.1632399, -0.3386188, -1.827056, 0, 1, 0.572549, 1,
-0.1621121, 0.06463376, -0.6787111, 0, 1, 0.5803922, 1,
-0.1617199, 0.1457573, 0.3373017, 0, 1, 0.5843138, 1,
-0.1603031, 1.639896, -1.102991, 0, 1, 0.5921569, 1,
-0.1544169, 1.16245, 0.2056982, 0, 1, 0.5960785, 1,
-0.1524384, 1.251709, -1.403263, 0, 1, 0.6039216, 1,
-0.1505045, -1.533822, -3.108835, 0, 1, 0.6117647, 1,
-0.1409565, -0.9140956, -3.91814, 0, 1, 0.6156863, 1,
-0.1404378, 1.164232, 0.05347322, 0, 1, 0.6235294, 1,
-0.1403907, -1.163124, -3.389543, 0, 1, 0.627451, 1,
-0.1385375, -1.148092, -3.907036, 0, 1, 0.6352941, 1,
-0.1331095, 0.2266114, -0.8212614, 0, 1, 0.6392157, 1,
-0.132065, -0.6763517, -3.387604, 0, 1, 0.6470588, 1,
-0.1304864, -0.1843475, -3.488637, 0, 1, 0.6509804, 1,
-0.1221276, 0.4150407, 0.4396232, 0, 1, 0.6588235, 1,
-0.1206086, 0.4037865, 0.4850663, 0, 1, 0.6627451, 1,
-0.1193251, -0.1222, -3.746706, 0, 1, 0.6705883, 1,
-0.1185806, 2.126377, 1.077737, 0, 1, 0.6745098, 1,
-0.1182001, 1.462303, -1.354241, 0, 1, 0.682353, 1,
-0.1094529, -1.203194, -4.494398, 0, 1, 0.6862745, 1,
-0.09921481, -0.7342855, -3.060055, 0, 1, 0.6941177, 1,
-0.09892127, 1.331622, -0.4232781, 0, 1, 0.7019608, 1,
-0.09807336, 0.2948875, -0.6364846, 0, 1, 0.7058824, 1,
-0.09583391, -0.4747837, -3.166803, 0, 1, 0.7137255, 1,
-0.09127016, 0.8969796, 0.6161587, 0, 1, 0.7176471, 1,
-0.09060351, 1.956555, -0.2810045, 0, 1, 0.7254902, 1,
-0.08967271, -0.3974708, -3.890251, 0, 1, 0.7294118, 1,
-0.08830431, 1.270742, 1.105745, 0, 1, 0.7372549, 1,
-0.08483962, 0.5558501, -0.3559422, 0, 1, 0.7411765, 1,
-0.08469874, 0.5478058, -0.4302769, 0, 1, 0.7490196, 1,
-0.08282908, -1.259099, -3.051888, 0, 1, 0.7529412, 1,
-0.08261647, -1.268559, -1.61187, 0, 1, 0.7607843, 1,
-0.08186574, -0.4669687, -3.830991, 0, 1, 0.7647059, 1,
-0.08088303, 0.5597096, -1.81087, 0, 1, 0.772549, 1,
-0.0751, 1.092376, 0.7562668, 0, 1, 0.7764706, 1,
-0.07495754, 1.230702, 0.3087001, 0, 1, 0.7843137, 1,
-0.07379376, -1.125458, -3.522584, 0, 1, 0.7882353, 1,
-0.07284378, -1.136722, -3.73223, 0, 1, 0.7960784, 1,
-0.07249268, -1.349349, -3.061397, 0, 1, 0.8039216, 1,
-0.072367, -0.5498027, -2.426261, 0, 1, 0.8078431, 1,
-0.07199785, 0.7379546, 0.1697352, 0, 1, 0.8156863, 1,
-0.0714168, 0.7685769, 0.4089507, 0, 1, 0.8196079, 1,
-0.06333051, 0.9222462, 1.869867, 0, 1, 0.827451, 1,
-0.06296083, -1.387926, -2.108898, 0, 1, 0.8313726, 1,
-0.05631166, -0.1977211, -0.9857742, 0, 1, 0.8392157, 1,
-0.05192202, 0.4419834, -1.77151, 0, 1, 0.8431373, 1,
-0.04958739, -0.6737512, -5.210541, 0, 1, 0.8509804, 1,
-0.04736023, 0.06914826, -2.753301, 0, 1, 0.854902, 1,
-0.04583216, -0.1323515, -1.370512, 0, 1, 0.8627451, 1,
-0.03933591, -0.05072664, -1.553851, 0, 1, 0.8666667, 1,
-0.03903288, 0.838669, -0.428173, 0, 1, 0.8745098, 1,
-0.03828293, -0.3340669, -3.668369, 0, 1, 0.8784314, 1,
-0.02998289, 0.7366513, -0.2199307, 0, 1, 0.8862745, 1,
-0.02980374, 0.1144334, -0.2745326, 0, 1, 0.8901961, 1,
-0.02937564, 1.835122, -0.7608674, 0, 1, 0.8980392, 1,
-0.02856239, -0.178409, -2.149928, 0, 1, 0.9058824, 1,
-0.02448182, -1.122168, -4.237627, 0, 1, 0.9098039, 1,
-0.02256743, 0.8863925, 0.4806909, 0, 1, 0.9176471, 1,
-0.02097764, 0.8411638, -0.3055678, 0, 1, 0.9215686, 1,
-0.02030167, 0.1675423, -0.534246, 0, 1, 0.9294118, 1,
-0.01771371, -0.004401618, -3.148262, 0, 1, 0.9333333, 1,
-0.01770844, 0.9262618, -1.397764, 0, 1, 0.9411765, 1,
-0.01392423, 0.9498216, 1.30385, 0, 1, 0.945098, 1,
-0.01158976, -0.8003341, -2.311091, 0, 1, 0.9529412, 1,
-0.009691478, 0.4031928, -0.6370821, 0, 1, 0.9568627, 1,
-0.005599176, -0.1738621, -2.249998, 0, 1, 0.9647059, 1,
-0.002937501, 1.308894, 0.9931554, 0, 1, 0.9686275, 1,
-0.0009984724, -1.976565, -4.595346, 0, 1, 0.9764706, 1,
-0.0002008162, -0.3053978, -3.396054, 0, 1, 0.9803922, 1,
0.0002343461, -0.1605297, 3.190322, 0, 1, 0.9882353, 1,
0.005282305, -0.5902221, 4.070995, 0, 1, 0.9921569, 1,
0.006327916, 0.7539575, -0.1965756, 0, 1, 1, 1,
0.007373977, -0.457326, 3.072036, 0, 0.9921569, 1, 1,
0.007661117, 0.3871224, -0.8341976, 0, 0.9882353, 1, 1,
0.01047515, -1.178887, 3.768896, 0, 0.9803922, 1, 1,
0.01655811, 0.9735872, -0.5484903, 0, 0.9764706, 1, 1,
0.01683878, 0.3247106, 0.1881706, 0, 0.9686275, 1, 1,
0.01710748, 0.130172, 0.4288305, 0, 0.9647059, 1, 1,
0.01728903, 1.197375, 1.541811, 0, 0.9568627, 1, 1,
0.02113907, 0.8558037, -0.6642608, 0, 0.9529412, 1, 1,
0.02157094, -0.3934578, 2.216832, 0, 0.945098, 1, 1,
0.02296765, 2.249837, 0.03833495, 0, 0.9411765, 1, 1,
0.02340003, 1.311872, 1.989912, 0, 0.9333333, 1, 1,
0.02497904, -2.056929, 3.681481, 0, 0.9294118, 1, 1,
0.0307123, 1.805002, -0.5448242, 0, 0.9215686, 1, 1,
0.03879046, -1.446119, 3.685464, 0, 0.9176471, 1, 1,
0.04116498, 0.6255653, -0.7474227, 0, 0.9098039, 1, 1,
0.04120702, 1.675381, 0.8093461, 0, 0.9058824, 1, 1,
0.04229825, -0.02382482, 1.767437, 0, 0.8980392, 1, 1,
0.04473552, 0.7085972, -0.601346, 0, 0.8901961, 1, 1,
0.05368318, 0.6010651, -0.8371052, 0, 0.8862745, 1, 1,
0.05375394, -0.4997137, 3.570489, 0, 0.8784314, 1, 1,
0.05375482, 1.11906, -1.049033, 0, 0.8745098, 1, 1,
0.055509, 1.759738, -0.4607549, 0, 0.8666667, 1, 1,
0.05580559, -1.56119, 1.11137, 0, 0.8627451, 1, 1,
0.05718598, -0.2195567, 3.359972, 0, 0.854902, 1, 1,
0.05738119, 0.4421419, 0.6607412, 0, 0.8509804, 1, 1,
0.05816628, 1.423418, -0.9810066, 0, 0.8431373, 1, 1,
0.05877871, -0.5182821, 2.890099, 0, 0.8392157, 1, 1,
0.05975213, 0.372225, 1.823252, 0, 0.8313726, 1, 1,
0.06083852, -0.9949988, 4.15895, 0, 0.827451, 1, 1,
0.06507673, -0.7801434, 3.008857, 0, 0.8196079, 1, 1,
0.06545821, -1.159628, 4.04105, 0, 0.8156863, 1, 1,
0.06680103, 2.247408, -0.1160501, 0, 0.8078431, 1, 1,
0.06722652, 0.1119633, 0.7074425, 0, 0.8039216, 1, 1,
0.07109062, -0.3503804, 2.928201, 0, 0.7960784, 1, 1,
0.07161058, 0.05939981, 1.372636, 0, 0.7882353, 1, 1,
0.07258591, -0.1287475, 3.311968, 0, 0.7843137, 1, 1,
0.07307255, 1.733032, -0.9020259, 0, 0.7764706, 1, 1,
0.07529835, -1.051943, 2.006951, 0, 0.772549, 1, 1,
0.07769535, -0.7402829, 1.971342, 0, 0.7647059, 1, 1,
0.07859413, -0.3838648, 1.066914, 0, 0.7607843, 1, 1,
0.0792871, -1.896958, 2.606244, 0, 0.7529412, 1, 1,
0.08497116, 0.3453158, 0.4945709, 0, 0.7490196, 1, 1,
0.08710519, 1.350191, 1.933176, 0, 0.7411765, 1, 1,
0.08887179, 0.2392353, -0.1263414, 0, 0.7372549, 1, 1,
0.08961311, -0.4692026, 5.094572, 0, 0.7294118, 1, 1,
0.08970411, 0.3949892, 0.2271145, 0, 0.7254902, 1, 1,
0.09200823, 0.1104316, -0.110987, 0, 0.7176471, 1, 1,
0.09209216, 0.302061, 0.5891324, 0, 0.7137255, 1, 1,
0.09318867, 0.669284, 1.38189, 0, 0.7058824, 1, 1,
0.09489536, -2.227837, 2.505844, 0, 0.6980392, 1, 1,
0.1008441, -0.07595827, 4.755912, 0, 0.6941177, 1, 1,
0.1054519, 0.02185328, 0.5768113, 0, 0.6862745, 1, 1,
0.1082874, 1.167113, 1.969681, 0, 0.682353, 1, 1,
0.1093965, -1.503081, 3.697145, 0, 0.6745098, 1, 1,
0.1126316, -1.071282, 2.350748, 0, 0.6705883, 1, 1,
0.116924, 0.8958633, -0.5938436, 0, 0.6627451, 1, 1,
0.1170895, -0.5534946, 2.366085, 0, 0.6588235, 1, 1,
0.1176725, 0.6851152, 1.499751, 0, 0.6509804, 1, 1,
0.1222708, -1.77605, 4.080526, 0, 0.6470588, 1, 1,
0.1223706, -1.602466, 2.631028, 0, 0.6392157, 1, 1,
0.1293806, 1.117534, -1.439597, 0, 0.6352941, 1, 1,
0.1326645, -1.011637, 3.806694, 0, 0.627451, 1, 1,
0.1336237, -0.7664266, 3.263067, 0, 0.6235294, 1, 1,
0.1340463, 0.699536, 1.337596, 0, 0.6156863, 1, 1,
0.1351033, 0.2239859, -1.915073, 0, 0.6117647, 1, 1,
0.1357688, -2.340665, 4.220123, 0, 0.6039216, 1, 1,
0.1358021, 0.1473327, -0.1816445, 0, 0.5960785, 1, 1,
0.1373771, -0.2841389, 2.751557, 0, 0.5921569, 1, 1,
0.1388951, 0.7510546, -1.296456, 0, 0.5843138, 1, 1,
0.143359, -0.379074, 2.266277, 0, 0.5803922, 1, 1,
0.1440368, -1.491418, 2.437129, 0, 0.572549, 1, 1,
0.1484286, -0.7182026, 2.83586, 0, 0.5686275, 1, 1,
0.1531179, -1.268136, 0.500507, 0, 0.5607843, 1, 1,
0.1584577, -0.9568326, 4.10801, 0, 0.5568628, 1, 1,
0.1661626, 1.835713, 2.383561, 0, 0.5490196, 1, 1,
0.1664954, -0.09098136, 1.397327, 0, 0.5450981, 1, 1,
0.1688613, 0.5057197, -0.3014427, 0, 0.5372549, 1, 1,
0.1691996, -0.1320922, 1.499676, 0, 0.5333334, 1, 1,
0.1693091, -1.452403, 2.610062, 0, 0.5254902, 1, 1,
0.1753151, 0.5520906, 1.544755, 0, 0.5215687, 1, 1,
0.1754095, -0.379746, 0.1641091, 0, 0.5137255, 1, 1,
0.1765147, 0.3353094, -0.1479876, 0, 0.509804, 1, 1,
0.1770037, 1.827905, 0.4236234, 0, 0.5019608, 1, 1,
0.1826917, 0.875724, 1.319183, 0, 0.4941176, 1, 1,
0.1871662, -0.2869318, 3.400198, 0, 0.4901961, 1, 1,
0.195184, 0.9586687, 0.2579367, 0, 0.4823529, 1, 1,
0.1990031, 0.0854934, 0.7391505, 0, 0.4784314, 1, 1,
0.2050084, -2.504022, 2.721618, 0, 0.4705882, 1, 1,
0.2156108, -0.4513697, 4.218932, 0, 0.4666667, 1, 1,
0.217694, -0.02300209, 3.014608, 0, 0.4588235, 1, 1,
0.2278724, -1.296837, 3.660526, 0, 0.454902, 1, 1,
0.2384916, 0.7881368, -0.3765762, 0, 0.4470588, 1, 1,
0.2452809, 1.487189, -0.2512542, 0, 0.4431373, 1, 1,
0.2462222, -2.019417, 3.60982, 0, 0.4352941, 1, 1,
0.2471738, -0.5665386, 2.712641, 0, 0.4313726, 1, 1,
0.2489967, -1.458878, 3.711985, 0, 0.4235294, 1, 1,
0.2518491, 1.619663, -0.9453977, 0, 0.4196078, 1, 1,
0.2548281, 0.1765384, 1.670328, 0, 0.4117647, 1, 1,
0.2558874, -0.2493976, 0.9228753, 0, 0.4078431, 1, 1,
0.2580954, 0.7334451, -1.642618, 0, 0.4, 1, 1,
0.2596138, 0.1751154, 0.2413846, 0, 0.3921569, 1, 1,
0.2613032, 0.9226505, 0.7149821, 0, 0.3882353, 1, 1,
0.2628272, -1.078819, 1.38682, 0, 0.3803922, 1, 1,
0.262951, 0.4834971, 1.466095, 0, 0.3764706, 1, 1,
0.272722, 0.1791364, -0.1323487, 0, 0.3686275, 1, 1,
0.273877, -1.868706, 3.204094, 0, 0.3647059, 1, 1,
0.2739831, -2.382813, 3.211246, 0, 0.3568628, 1, 1,
0.2754363, -0.6407747, 1.940069, 0, 0.3529412, 1, 1,
0.2768581, -0.731676, 3.762278, 0, 0.345098, 1, 1,
0.2787887, 0.003549948, 0.4749216, 0, 0.3411765, 1, 1,
0.2802248, 0.6092933, 2.554878, 0, 0.3333333, 1, 1,
0.2836096, 0.9342311, 2.117437, 0, 0.3294118, 1, 1,
0.2851179, -0.2428136, 2.643901, 0, 0.3215686, 1, 1,
0.2874214, 0.5866773, 0.3236294, 0, 0.3176471, 1, 1,
0.2876423, 0.07043202, 1.612663, 0, 0.3098039, 1, 1,
0.2911132, 1.653088, 0.7549108, 0, 0.3058824, 1, 1,
0.2960638, -0.1917793, 3.156935, 0, 0.2980392, 1, 1,
0.300705, -0.3103312, 1.14541, 0, 0.2901961, 1, 1,
0.3051466, 1.083293, 1.246477, 0, 0.2862745, 1, 1,
0.3064699, -0.9926916, 1.154251, 0, 0.2784314, 1, 1,
0.3079295, -1.733071, 4.368036, 0, 0.2745098, 1, 1,
0.3086891, -0.5429196, 2.84993, 0, 0.2666667, 1, 1,
0.3090263, -0.1283969, 2.156158, 0, 0.2627451, 1, 1,
0.3108898, -1.034261, 3.964504, 0, 0.254902, 1, 1,
0.3136914, 0.6146953, 0.5175074, 0, 0.2509804, 1, 1,
0.3170638, -0.9054983, 2.559579, 0, 0.2431373, 1, 1,
0.3214474, 0.1939771, -0.03926154, 0, 0.2392157, 1, 1,
0.3224405, -0.5539412, 3.543663, 0, 0.2313726, 1, 1,
0.3264711, -1.357883, 3.306604, 0, 0.227451, 1, 1,
0.3269364, 1.184332, 0.1739161, 0, 0.2196078, 1, 1,
0.3272913, -0.7465199, 2.728985, 0, 0.2156863, 1, 1,
0.3370066, -0.2719864, 3.003151, 0, 0.2078431, 1, 1,
0.3390679, -0.5075481, 3.169674, 0, 0.2039216, 1, 1,
0.3428974, -0.2123374, 3.09116, 0, 0.1960784, 1, 1,
0.349512, -0.9138774, 3.884886, 0, 0.1882353, 1, 1,
0.3508427, 0.5561705, 0.3669851, 0, 0.1843137, 1, 1,
0.354519, -0.03916141, 2.011576, 0, 0.1764706, 1, 1,
0.356967, 1.954156, 0.8012548, 0, 0.172549, 1, 1,
0.3584122, -0.06937019, 2.580879, 0, 0.1647059, 1, 1,
0.3621263, -1.344981, 1.911261, 0, 0.1607843, 1, 1,
0.3622136, 0.1339795, 1.961436, 0, 0.1529412, 1, 1,
0.3631625, -1.172329, 3.441888, 0, 0.1490196, 1, 1,
0.365015, -1.023449, 3.405571, 0, 0.1411765, 1, 1,
0.3651511, 1.160725, 1.687363, 0, 0.1372549, 1, 1,
0.3698168, 0.3425597, -0.6492357, 0, 0.1294118, 1, 1,
0.3733359, -0.1415159, 2.205881, 0, 0.1254902, 1, 1,
0.3781907, 0.6110444, -0.9470093, 0, 0.1176471, 1, 1,
0.3806191, -0.8855088, 3.12114, 0, 0.1137255, 1, 1,
0.3810717, 0.6841799, 1.825878, 0, 0.1058824, 1, 1,
0.3857509, -1.632284, 3.311512, 0, 0.09803922, 1, 1,
0.4009939, 0.09660913, 0.7140114, 0, 0.09411765, 1, 1,
0.4063185, 1.125144, 1.070992, 0, 0.08627451, 1, 1,
0.4064861, 1.151959, -0.3650709, 0, 0.08235294, 1, 1,
0.4093636, 1.085066, -1.523458, 0, 0.07450981, 1, 1,
0.4095112, 0.4624252, -0.7826815, 0, 0.07058824, 1, 1,
0.4101394, 1.59033, 1.103592, 0, 0.0627451, 1, 1,
0.412851, -0.2793061, 0.5311158, 0, 0.05882353, 1, 1,
0.4132377, 0.04761185, 1.473775, 0, 0.05098039, 1, 1,
0.4141167, -0.2798395, 1.285922, 0, 0.04705882, 1, 1,
0.4143706, 1.071748, 0.005838212, 0, 0.03921569, 1, 1,
0.4185062, 0.1653916, -0.3872655, 0, 0.03529412, 1, 1,
0.4187142, -1.01813, 1.723608, 0, 0.02745098, 1, 1,
0.4209068, 0.4431701, 0.06199173, 0, 0.02352941, 1, 1,
0.4253067, -1.159141, 4.794553, 0, 0.01568628, 1, 1,
0.4256333, 0.3240587, 1.247515, 0, 0.01176471, 1, 1,
0.4269583, 0.9430909, 0.03249437, 0, 0.003921569, 1, 1,
0.4310354, -1.29674, 2.914268, 0.003921569, 0, 1, 1,
0.4314657, -0.03057642, -0.01628042, 0.007843138, 0, 1, 1,
0.431793, -2.675942, 4.552506, 0.01568628, 0, 1, 1,
0.4380581, 2.041996, 0.2648086, 0.01960784, 0, 1, 1,
0.4449875, -0.7013124, 1.530953, 0.02745098, 0, 1, 1,
0.4450709, -0.2993092, 3.001867, 0.03137255, 0, 1, 1,
0.4464448, -0.5982581, 2.639439, 0.03921569, 0, 1, 1,
0.4478501, -0.4536481, 3.275368, 0.04313726, 0, 1, 1,
0.4485888, 1.08669, -1.251886, 0.05098039, 0, 1, 1,
0.4514089, 0.6393771, -0.1616425, 0.05490196, 0, 1, 1,
0.4567906, 0.6220832, 1.16977, 0.0627451, 0, 1, 1,
0.4568146, 1.009546, 1.536944, 0.06666667, 0, 1, 1,
0.4619291, 0.3350928, 1.125731, 0.07450981, 0, 1, 1,
0.4619857, -0.902047, 3.406948, 0.07843138, 0, 1, 1,
0.4666763, -0.7391516, 1.509938, 0.08627451, 0, 1, 1,
0.4685683, 0.4327521, 0.4387638, 0.09019608, 0, 1, 1,
0.4703746, 0.05591477, -0.1112709, 0.09803922, 0, 1, 1,
0.470674, -0.2997316, 3.637799, 0.1058824, 0, 1, 1,
0.4744031, 0.04631665, 2.044353, 0.1098039, 0, 1, 1,
0.4760046, 0.3907178, -0.7238036, 0.1176471, 0, 1, 1,
0.4760315, 0.4604044, 0.7731767, 0.1215686, 0, 1, 1,
0.48156, -0.6045292, 1.630091, 0.1294118, 0, 1, 1,
0.486395, -0.06865607, 2.457861, 0.1333333, 0, 1, 1,
0.4885106, -1.270835, 3.62222, 0.1411765, 0, 1, 1,
0.4887505, 0.3885964, 1.338507, 0.145098, 0, 1, 1,
0.4889551, -1.412627, 1.692553, 0.1529412, 0, 1, 1,
0.4898678, 0.6920277, 2.66521, 0.1568628, 0, 1, 1,
0.490055, 1.057448, -0.1441205, 0.1647059, 0, 1, 1,
0.4940056, -0.6795774, 3.150107, 0.1686275, 0, 1, 1,
0.4952852, 1.036148, 1.226829, 0.1764706, 0, 1, 1,
0.4967214, 1.262807, -0.6173433, 0.1803922, 0, 1, 1,
0.5081904, -1.606375, 2.367047, 0.1882353, 0, 1, 1,
0.5114412, -0.3812125, 2.904302, 0.1921569, 0, 1, 1,
0.5131884, 0.1803026, 1.657589, 0.2, 0, 1, 1,
0.5152513, 0.5929179, 1.101086, 0.2078431, 0, 1, 1,
0.5204135, 1.230895, 1.888556, 0.2117647, 0, 1, 1,
0.5242189, -1.610295, 1.974381, 0.2196078, 0, 1, 1,
0.5257323, -0.1834189, 3.437808, 0.2235294, 0, 1, 1,
0.5272729, 0.3117111, 2.348341, 0.2313726, 0, 1, 1,
0.5284176, 0.9023528, 1.336249, 0.2352941, 0, 1, 1,
0.5284435, 0.2892777, -0.00497792, 0.2431373, 0, 1, 1,
0.5373784, 0.9308445, -0.4912604, 0.2470588, 0, 1, 1,
0.539207, -1.348065, 1.795013, 0.254902, 0, 1, 1,
0.5430002, 0.8776519, -0.8506362, 0.2588235, 0, 1, 1,
0.5438363, 0.5479966, 0.632556, 0.2666667, 0, 1, 1,
0.5477524, 2.827737, -0.8805355, 0.2705882, 0, 1, 1,
0.5478902, 2.262616, 1.537429, 0.2784314, 0, 1, 1,
0.5488905, 2.335026, 1.244629, 0.282353, 0, 1, 1,
0.5591603, 0.4225767, 1.478344, 0.2901961, 0, 1, 1,
0.5639951, 0.9963502, 1.093121, 0.2941177, 0, 1, 1,
0.565491, -0.7508757, 2.099072, 0.3019608, 0, 1, 1,
0.5655382, -1.36898, 3.527639, 0.3098039, 0, 1, 1,
0.5660679, -0.9375878, 1.293464, 0.3137255, 0, 1, 1,
0.5685123, 0.7380021, 2.309357, 0.3215686, 0, 1, 1,
0.5693796, 2.068771, 0.6570303, 0.3254902, 0, 1, 1,
0.5707675, -0.2618653, 1.87855, 0.3333333, 0, 1, 1,
0.577073, 0.1099533, -1.266916, 0.3372549, 0, 1, 1,
0.5800647, -1.753502, 3.419958, 0.345098, 0, 1, 1,
0.580477, -0.5951334, 3.185388, 0.3490196, 0, 1, 1,
0.5808844, 0.5032933, 1.456207, 0.3568628, 0, 1, 1,
0.5837997, -0.7863034, 1.999918, 0.3607843, 0, 1, 1,
0.5858781, -0.7915573, 2.56634, 0.3686275, 0, 1, 1,
0.5889974, -0.3956257, 2.860556, 0.372549, 0, 1, 1,
0.5891517, -0.9424227, 2.661713, 0.3803922, 0, 1, 1,
0.5915825, -0.3348758, 1.109002, 0.3843137, 0, 1, 1,
0.5922616, 0.8733257, 0.4442084, 0.3921569, 0, 1, 1,
0.5942201, -0.9028308, 2.716234, 0.3960784, 0, 1, 1,
0.6017583, -1.217194, 3.046167, 0.4039216, 0, 1, 1,
0.6034323, -0.7444162, 4.245099, 0.4117647, 0, 1, 1,
0.6061123, 0.1556427, 0.6600807, 0.4156863, 0, 1, 1,
0.6064062, 1.397218, 0.2718053, 0.4235294, 0, 1, 1,
0.6069818, -0.9308354, 1.532045, 0.427451, 0, 1, 1,
0.6131676, -2.019781, 3.768241, 0.4352941, 0, 1, 1,
0.6132057, 0.305177, 2.008416, 0.4392157, 0, 1, 1,
0.6135854, 0.6254843, 1.725679, 0.4470588, 0, 1, 1,
0.6138533, 0.583286, 1.718508, 0.4509804, 0, 1, 1,
0.6174574, 0.1347809, -0.02201723, 0.4588235, 0, 1, 1,
0.6177785, -0.4186651, 2.830119, 0.4627451, 0, 1, 1,
0.6197252, 0.8419662, -0.09637875, 0.4705882, 0, 1, 1,
0.6221499, 0.6886722, 0.5578098, 0.4745098, 0, 1, 1,
0.6268574, -0.4962477, 3.593861, 0.4823529, 0, 1, 1,
0.630578, -0.2865686, 3.45564, 0.4862745, 0, 1, 1,
0.6309601, 1.212126, -1.901569, 0.4941176, 0, 1, 1,
0.6338275, 0.359654, 0.8551937, 0.5019608, 0, 1, 1,
0.6385395, 0.4332178, 1.158741, 0.5058824, 0, 1, 1,
0.6386449, -0.4330292, 4.946399, 0.5137255, 0, 1, 1,
0.6419812, -0.06691363, 1.696662, 0.5176471, 0, 1, 1,
0.6426094, 0.451369, -1.696185, 0.5254902, 0, 1, 1,
0.6434211, 0.04392591, 0.4915531, 0.5294118, 0, 1, 1,
0.6449521, -1.92666, 1.103598, 0.5372549, 0, 1, 1,
0.645199, -0.5084487, 2.67917, 0.5411765, 0, 1, 1,
0.65866, 0.9527486, 0.7562025, 0.5490196, 0, 1, 1,
0.6669428, -0.6711074, 1.868547, 0.5529412, 0, 1, 1,
0.6727874, 1.189443, 0.1432281, 0.5607843, 0, 1, 1,
0.6754005, 1.66529, 0.7361442, 0.5647059, 0, 1, 1,
0.6784301, -0.5334606, 2.220386, 0.572549, 0, 1, 1,
0.6794706, 0.4777151, 1.891642, 0.5764706, 0, 1, 1,
0.6816013, -1.746937, 2.273894, 0.5843138, 0, 1, 1,
0.6853756, 1.708189, 0.1294351, 0.5882353, 0, 1, 1,
0.6872265, 0.3423596, 1.459266, 0.5960785, 0, 1, 1,
0.6902307, -1.319477, 1.957982, 0.6039216, 0, 1, 1,
0.6911591, -0.3199314, 2.757598, 0.6078432, 0, 1, 1,
0.6930376, 0.7550368, 2.415783, 0.6156863, 0, 1, 1,
0.6965158, -0.4093364, 2.271203, 0.6196079, 0, 1, 1,
0.6967914, 0.4895139, 2.084902, 0.627451, 0, 1, 1,
0.7025122, 1.961856, 0.3923331, 0.6313726, 0, 1, 1,
0.7068648, -0.8976182, 3.040786, 0.6392157, 0, 1, 1,
0.7089903, -0.5956846, 2.696993, 0.6431373, 0, 1, 1,
0.7091852, 1.498226, -1.543731, 0.6509804, 0, 1, 1,
0.7098899, 0.6962082, -0.3072981, 0.654902, 0, 1, 1,
0.7123322, 1.117765, 0.7704778, 0.6627451, 0, 1, 1,
0.7183072, 1.666612, 0.7643437, 0.6666667, 0, 1, 1,
0.7249148, -1.080237, 3.296821, 0.6745098, 0, 1, 1,
0.7276406, -0.5175558, 2.937048, 0.6784314, 0, 1, 1,
0.7336572, -0.1726778, 3.110119, 0.6862745, 0, 1, 1,
0.7396871, 0.3076256, 2.187527, 0.6901961, 0, 1, 1,
0.7466435, 0.3764625, 4.080496, 0.6980392, 0, 1, 1,
0.7505085, 1.735882, 1.532375, 0.7058824, 0, 1, 1,
0.753815, 0.02934073, 2.623104, 0.7098039, 0, 1, 1,
0.7543011, 1.260955, -1.556837, 0.7176471, 0, 1, 1,
0.7568006, 0.6204896, 2.550273, 0.7215686, 0, 1, 1,
0.7568231, 0.8296899, -0.7220032, 0.7294118, 0, 1, 1,
0.7591847, -1.186564, 2.752338, 0.7333333, 0, 1, 1,
0.7695793, -1.697238, 2.647248, 0.7411765, 0, 1, 1,
0.7741299, -1.469233, 3.26787, 0.7450981, 0, 1, 1,
0.7741818, -1.153983, 1.17528, 0.7529412, 0, 1, 1,
0.7751173, -0.7293351, 2.662711, 0.7568628, 0, 1, 1,
0.7751673, 0.4986022, 0.8776457, 0.7647059, 0, 1, 1,
0.7840149, -1.43684, 3.479406, 0.7686275, 0, 1, 1,
0.7867029, -0.1116462, 1.56486, 0.7764706, 0, 1, 1,
0.7883063, -0.2753595, 1.098208, 0.7803922, 0, 1, 1,
0.7912195, 0.261213, -0.6594486, 0.7882353, 0, 1, 1,
0.7938241, 0.3108192, 1.437181, 0.7921569, 0, 1, 1,
0.799862, -0.172407, 0.4506181, 0.8, 0, 1, 1,
0.8003098, 0.3664449, 0.7801402, 0.8078431, 0, 1, 1,
0.80361, -1.936394, 3.414468, 0.8117647, 0, 1, 1,
0.8071226, 0.2123613, 0.8211013, 0.8196079, 0, 1, 1,
0.8086277, 0.5639129, 1.617111, 0.8235294, 0, 1, 1,
0.8096158, -1.024205, 2.765939, 0.8313726, 0, 1, 1,
0.8225228, 1.135688, -1.115826, 0.8352941, 0, 1, 1,
0.82298, -0.5858241, 2.849827, 0.8431373, 0, 1, 1,
0.8266661, 1.396851, 0.6758785, 0.8470588, 0, 1, 1,
0.8273169, 0.9733568, -0.1599021, 0.854902, 0, 1, 1,
0.8329648, -0.512083, 2.228461, 0.8588235, 0, 1, 1,
0.8383492, 0.08305284, -0.03234699, 0.8666667, 0, 1, 1,
0.8409549, 1.069486, 0.3193716, 0.8705882, 0, 1, 1,
0.8433681, -0.0003621524, 2.490032, 0.8784314, 0, 1, 1,
0.8458548, 1.158671, 0.3087704, 0.8823529, 0, 1, 1,
0.8485066, -0.09830828, 0.5196016, 0.8901961, 0, 1, 1,
0.8486221, 0.8393757, -1.074618, 0.8941177, 0, 1, 1,
0.8551052, 1.267701, -0.4308246, 0.9019608, 0, 1, 1,
0.8641872, -0.04409365, 1.286888, 0.9098039, 0, 1, 1,
0.8657786, 0.2193954, 2.686307, 0.9137255, 0, 1, 1,
0.8687599, -1.144005, 3.403302, 0.9215686, 0, 1, 1,
0.8697945, 0.4750639, 3.394509, 0.9254902, 0, 1, 1,
0.8751799, -0.1783624, 1.540207, 0.9333333, 0, 1, 1,
0.8772565, 0.4731463, -0.2611, 0.9372549, 0, 1, 1,
0.8790091, -0.3926421, 0.9583763, 0.945098, 0, 1, 1,
0.8847169, 0.6660517, 1.757596, 0.9490196, 0, 1, 1,
0.8850152, -0.5212203, 1.617447, 0.9568627, 0, 1, 1,
0.8885669, 0.02831497, 2.264969, 0.9607843, 0, 1, 1,
0.8919013, -0.009886472, 1.126311, 0.9686275, 0, 1, 1,
0.8921556, 0.3158758, 1.696711, 0.972549, 0, 1, 1,
0.8941237, -0.5047112, 3.538554, 0.9803922, 0, 1, 1,
0.894366, -0.2464454, 0.4806264, 0.9843137, 0, 1, 1,
0.8970233, 0.6447168, -0.2598759, 0.9921569, 0, 1, 1,
0.8984334, -0.2366406, 2.828999, 0.9960784, 0, 1, 1,
0.8997136, -1.708588, 3.217471, 1, 0, 0.9960784, 1,
0.9039444, 1.617177, -0.6743454, 1, 0, 0.9882353, 1,
0.9039924, 1.656513, 2.296313, 1, 0, 0.9843137, 1,
0.9071336, 0.06356189, -0.8228557, 1, 0, 0.9764706, 1,
0.9271855, -1.643447, 2.436225, 1, 0, 0.972549, 1,
0.929892, -0.5283346, 0.9800804, 1, 0, 0.9647059, 1,
0.935625, -0.4174162, 2.114604, 1, 0, 0.9607843, 1,
0.9370139, 0.9221798, 2.776238, 1, 0, 0.9529412, 1,
0.937389, -0.7492265, 2.550289, 1, 0, 0.9490196, 1,
0.9379139, 0.06259803, 0.8201286, 1, 0, 0.9411765, 1,
0.941641, 0.212113, 1.492573, 1, 0, 0.9372549, 1,
0.9533058, -0.355581, 2.651553, 1, 0, 0.9294118, 1,
0.9560195, -0.4509059, 2.772452, 1, 0, 0.9254902, 1,
0.9655811, 0.2074683, 1.610504, 1, 0, 0.9176471, 1,
0.965741, 0.5336293, 0.435255, 1, 0, 0.9137255, 1,
0.9721822, -0.541227, 3.090896, 1, 0, 0.9058824, 1,
0.9730595, 1.664816, 0.6987652, 1, 0, 0.9019608, 1,
0.9844148, -0.8133779, 3.027243, 1, 0, 0.8941177, 1,
0.9914563, -1.26946, 1.04691, 1, 0, 0.8862745, 1,
0.9926926, -0.02482764, 1.115269, 1, 0, 0.8823529, 1,
0.997011, -1.683256, 1.500182, 1, 0, 0.8745098, 1,
0.9979738, -2.455513, 2.163524, 1, 0, 0.8705882, 1,
1.0018, -1.613465, 3.137777, 1, 0, 0.8627451, 1,
1.004686, 0.4005355, 1.634859, 1, 0, 0.8588235, 1,
1.006483, 1.993506, 0.7137402, 1, 0, 0.8509804, 1,
1.007224, -1.065866, 0.2886433, 1, 0, 0.8470588, 1,
1.007693, 0.2831729, 2.584793, 1, 0, 0.8392157, 1,
1.007926, 0.1295557, 2.190757, 1, 0, 0.8352941, 1,
1.01933, 3.011873, 0.5292996, 1, 0, 0.827451, 1,
1.025532, -0.5228511, 3.632018, 1, 0, 0.8235294, 1,
1.034434, -0.3188746, 2.936287, 1, 0, 0.8156863, 1,
1.044953, -0.6277996, 3.750019, 1, 0, 0.8117647, 1,
1.046113, -0.8881665, 3.211544, 1, 0, 0.8039216, 1,
1.047694, 1.338177, 2.002469, 1, 0, 0.7960784, 1,
1.052528, -0.9754074, 1.066581, 1, 0, 0.7921569, 1,
1.068747, 1.421406, -0.9766793, 1, 0, 0.7843137, 1,
1.073627, 0.3511706, -0.5622674, 1, 0, 0.7803922, 1,
1.077963, -0.4936223, 4.471472, 1, 0, 0.772549, 1,
1.079266, 1.55138, 1.759303, 1, 0, 0.7686275, 1,
1.085762, -0.301482, 1.551425, 1, 0, 0.7607843, 1,
1.094424, -1.861621, 2.702893, 1, 0, 0.7568628, 1,
1.100538, 0.950379, 1.573551, 1, 0, 0.7490196, 1,
1.101721, 0.5287947, 1.98818, 1, 0, 0.7450981, 1,
1.104213, 0.6572222, 3.21103, 1, 0, 0.7372549, 1,
1.110587, 0.9080614, 1.848626, 1, 0, 0.7333333, 1,
1.11237, -0.1488575, 1.19408, 1, 0, 0.7254902, 1,
1.118169, 0.7034808, 0.7177987, 1, 0, 0.7215686, 1,
1.121945, -0.1799729, 2.266958, 1, 0, 0.7137255, 1,
1.124963, -0.3173835, 0.3961051, 1, 0, 0.7098039, 1,
1.125302, 0.5900546, 1.802486, 1, 0, 0.7019608, 1,
1.1261, -1.550431, 1.646374, 1, 0, 0.6941177, 1,
1.126472, -1.487214, 1.330623, 1, 0, 0.6901961, 1,
1.127255, -0.8165748, 0.1032917, 1, 0, 0.682353, 1,
1.129699, 0.8216364, -0.4683122, 1, 0, 0.6784314, 1,
1.130214, 1.225297, 0.7081099, 1, 0, 0.6705883, 1,
1.133071, -1.274084, 0.2522113, 1, 0, 0.6666667, 1,
1.141635, 0.04763417, 1.562785, 1, 0, 0.6588235, 1,
1.147177, 0.2814952, 1.554965, 1, 0, 0.654902, 1,
1.161438, -0.8823448, 3.27, 1, 0, 0.6470588, 1,
1.166513, 2.609608, 1.63894, 1, 0, 0.6431373, 1,
1.167931, -0.81527, 2.403962, 1, 0, 0.6352941, 1,
1.19093, 0.1149362, 0.5667252, 1, 0, 0.6313726, 1,
1.199028, 0.508684, 2.344064, 1, 0, 0.6235294, 1,
1.20164, 0.5870573, 0.5944282, 1, 0, 0.6196079, 1,
1.203315, -0.2876805, 0.3811106, 1, 0, 0.6117647, 1,
1.205909, 0.3940694, -0.01443109, 1, 0, 0.6078432, 1,
1.218619, 2.05865, -0.3820879, 1, 0, 0.6, 1,
1.225658, -0.7640525, 1.007985, 1, 0, 0.5921569, 1,
1.226891, -0.7229837, 0.3573085, 1, 0, 0.5882353, 1,
1.229717, -1.128174, 1.781313, 1, 0, 0.5803922, 1,
1.241762, 0.561834, -0.07527895, 1, 0, 0.5764706, 1,
1.244235, 1.760273, -1.052605, 1, 0, 0.5686275, 1,
1.24473, -1.505383, 2.944544, 1, 0, 0.5647059, 1,
1.253784, -0.6185156, 2.070669, 1, 0, 0.5568628, 1,
1.268729, 0.8101633, 0.8050947, 1, 0, 0.5529412, 1,
1.277346, -1.578352, 1.488234, 1, 0, 0.5450981, 1,
1.278041, 2.176492, 1.334679, 1, 0, 0.5411765, 1,
1.288835, 2.398182, -0.4720781, 1, 0, 0.5333334, 1,
1.290078, -0.2733087, 1.844515, 1, 0, 0.5294118, 1,
1.294865, -0.01408084, 1.510965, 1, 0, 0.5215687, 1,
1.298258, 1.561271, 1.80599, 1, 0, 0.5176471, 1,
1.301271, -0.4122177, 0.887419, 1, 0, 0.509804, 1,
1.311905, -0.3361825, 2.107886, 1, 0, 0.5058824, 1,
1.316213, -0.9971901, 1.79852, 1, 0, 0.4980392, 1,
1.337345, 0.3670496, 0.8209726, 1, 0, 0.4901961, 1,
1.354373, 2.204427, 0.6976027, 1, 0, 0.4862745, 1,
1.354968, -1.932888, 3.930472, 1, 0, 0.4784314, 1,
1.355654, 1.903145, 0.3432584, 1, 0, 0.4745098, 1,
1.355746, -1.285552, 1.690027, 1, 0, 0.4666667, 1,
1.355974, -0.9880869, 1.905543, 1, 0, 0.4627451, 1,
1.360145, -0.0367447, 0.6675789, 1, 0, 0.454902, 1,
1.368706, -0.1726696, 4.101506, 1, 0, 0.4509804, 1,
1.374019, 0.5902273, 1.015791, 1, 0, 0.4431373, 1,
1.375729, 0.2084362, 1.92099, 1, 0, 0.4392157, 1,
1.381893, -0.6684621, 0.5444989, 1, 0, 0.4313726, 1,
1.384827, -0.6463611, 4.096038, 1, 0, 0.427451, 1,
1.399087, -0.6754627, 3.943978, 1, 0, 0.4196078, 1,
1.4105, 0.3322984, 1.489393, 1, 0, 0.4156863, 1,
1.422749, 1.243602, 1.403741, 1, 0, 0.4078431, 1,
1.430048, 0.5824396, 2.011181, 1, 0, 0.4039216, 1,
1.431944, -1.656377, 1.572434, 1, 0, 0.3960784, 1,
1.452091, 0.907561, 1.191329, 1, 0, 0.3882353, 1,
1.456622, -0.9961638, 4.232733, 1, 0, 0.3843137, 1,
1.456862, -0.9370614, 2.727166, 1, 0, 0.3764706, 1,
1.459285, 0.3593268, -0.4845679, 1, 0, 0.372549, 1,
1.472373, 1.745833, 2.565362, 1, 0, 0.3647059, 1,
1.483784, -1.436313, 1.719912, 1, 0, 0.3607843, 1,
1.492222, 0.1232405, 2.872484, 1, 0, 0.3529412, 1,
1.504731, 1.930417, -1.004702, 1, 0, 0.3490196, 1,
1.51093, -0.5085214, 0.9013854, 1, 0, 0.3411765, 1,
1.511826, 2.260748, 1.725922, 1, 0, 0.3372549, 1,
1.512857, -0.4817646, 0.2904252, 1, 0, 0.3294118, 1,
1.520608, 0.6761408, 0.7205383, 1, 0, 0.3254902, 1,
1.521901, 0.2120252, 0.1397981, 1, 0, 0.3176471, 1,
1.52767, 1.339449, 0.2822282, 1, 0, 0.3137255, 1,
1.545919, 1.479783, 1.377439, 1, 0, 0.3058824, 1,
1.57422, 0.8118406, 1.256942, 1, 0, 0.2980392, 1,
1.576643, 1.272637, 0.8593057, 1, 0, 0.2941177, 1,
1.578681, 0.9028019, 2.526227, 1, 0, 0.2862745, 1,
1.600743, 0.7541115, 2.664474, 1, 0, 0.282353, 1,
1.616957, -0.5830701, 2.704195, 1, 0, 0.2745098, 1,
1.625822, 0.5827514, 1.562747, 1, 0, 0.2705882, 1,
1.632642, -0.9170975, 0.3714375, 1, 0, 0.2627451, 1,
1.655144, 0.4051112, 0.03223362, 1, 0, 0.2588235, 1,
1.662562, 0.137734, 0.7339274, 1, 0, 0.2509804, 1,
1.666655, 1.056382, 0.4556478, 1, 0, 0.2470588, 1,
1.681497, 0.9710677, 1.188508, 1, 0, 0.2392157, 1,
1.681726, 0.882885, 0.9255669, 1, 0, 0.2352941, 1,
1.712953, -0.386216, 2.153667, 1, 0, 0.227451, 1,
1.721603, -0.4237186, 2.34216, 1, 0, 0.2235294, 1,
1.729038, 0.9132039, 1.831854, 1, 0, 0.2156863, 1,
1.738518, 0.6872857, 1.002133, 1, 0, 0.2117647, 1,
1.760611, 0.8524909, 2.172945, 1, 0, 0.2039216, 1,
1.764412, -1.758561, 1.934412, 1, 0, 0.1960784, 1,
1.768268, -1.942454, 2.89594, 1, 0, 0.1921569, 1,
1.789275, 0.8700581, 0.1551839, 1, 0, 0.1843137, 1,
1.794257, -1.301386, 1.963874, 1, 0, 0.1803922, 1,
1.797614, 1.782103, 1.336148, 1, 0, 0.172549, 1,
1.836676, 0.6686585, 1.349278, 1, 0, 0.1686275, 1,
1.859561, -1.903623, 1.073711, 1, 0, 0.1607843, 1,
1.860739, 0.7151823, 0.8110203, 1, 0, 0.1568628, 1,
1.884734, 1.417609, 1.706596, 1, 0, 0.1490196, 1,
1.88567, -2.379689, 2.41393, 1, 0, 0.145098, 1,
1.916498, 0.7785189, 1.474442, 1, 0, 0.1372549, 1,
1.924225, -0.9587225, 1.690117, 1, 0, 0.1333333, 1,
1.933035, -0.6495048, 0.6606327, 1, 0, 0.1254902, 1,
1.954722, 0.7925699, 1.680582, 1, 0, 0.1215686, 1,
1.963651, -1.46779, 4.747171, 1, 0, 0.1137255, 1,
2.014197, 0.6740556, 0.6263014, 1, 0, 0.1098039, 1,
2.035276, -1.503382, 3.808405, 1, 0, 0.1019608, 1,
2.091933, 1.080418, -0.3687549, 1, 0, 0.09411765, 1,
2.119953, -0.2667539, 2.871414, 1, 0, 0.09019608, 1,
2.132313, 0.1835015, 1.203278, 1, 0, 0.08235294, 1,
2.138402, 0.5408451, 1.00136, 1, 0, 0.07843138, 1,
2.151541, -1.763023, 2.851575, 1, 0, 0.07058824, 1,
2.154568, 1.317474, -0.1955794, 1, 0, 0.06666667, 1,
2.161921, 2.776163, 0.5544491, 1, 0, 0.05882353, 1,
2.228571, -0.3139502, 2.978564, 1, 0, 0.05490196, 1,
2.245636, 2.428943, 0.7354104, 1, 0, 0.04705882, 1,
2.364117, -0.8290734, 0.8752433, 1, 0, 0.04313726, 1,
2.404366, 0.9126172, 1.088365, 1, 0, 0.03529412, 1,
2.439151, 0.06594885, 2.361166, 1, 0, 0.03137255, 1,
2.460259, -0.6427841, 3.608335, 1, 0, 0.02352941, 1,
2.687036, 0.6213593, 1.583519, 1, 0, 0.01960784, 1,
2.871111, 0.4643896, 1.894437, 1, 0, 0.01176471, 1,
3.615731, 1.356217, 2.638045, 1, 0, 0.007843138, 1
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
0.3471682, -4.013818, -6.957258, 0, -0.5, 0.5, 0.5,
0.3471682, -4.013818, -6.957258, 1, -0.5, 0.5, 0.5,
0.3471682, -4.013818, -6.957258, 1, 1.5, 0.5, 0.5,
0.3471682, -4.013818, -6.957258, 0, 1.5, 0.5, 0.5
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
-4.029438, 0.01198089, -6.957258, 0, -0.5, 0.5, 0.5,
-4.029438, 0.01198089, -6.957258, 1, -0.5, 0.5, 0.5,
-4.029438, 0.01198089, -6.957258, 1, 1.5, 0.5, 0.5,
-4.029438, 0.01198089, -6.957258, 0, 1.5, 0.5, 0.5
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
-4.029438, -4.013818, -0.05798459, 0, -0.5, 0.5, 0.5,
-4.029438, -4.013818, -0.05798459, 1, -0.5, 0.5, 0.5,
-4.029438, -4.013818, -0.05798459, 1, 1.5, 0.5, 0.5,
-4.029438, -4.013818, -0.05798459, 0, 1.5, 0.5, 0.5
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
-2, -3.084787, -5.365118,
3, -3.084787, -5.365118,
-2, -3.084787, -5.365118,
-2, -3.239626, -5.630475,
-1, -3.084787, -5.365118,
-1, -3.239626, -5.630475,
0, -3.084787, -5.365118,
0, -3.239626, -5.630475,
1, -3.084787, -5.365118,
1, -3.239626, -5.630475,
2, -3.084787, -5.365118,
2, -3.239626, -5.630475,
3, -3.084787, -5.365118,
3, -3.239626, -5.630475
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
-2, -3.549303, -6.161188, 0, -0.5, 0.5, 0.5,
-2, -3.549303, -6.161188, 1, -0.5, 0.5, 0.5,
-2, -3.549303, -6.161188, 1, 1.5, 0.5, 0.5,
-2, -3.549303, -6.161188, 0, 1.5, 0.5, 0.5,
-1, -3.549303, -6.161188, 0, -0.5, 0.5, 0.5,
-1, -3.549303, -6.161188, 1, -0.5, 0.5, 0.5,
-1, -3.549303, -6.161188, 1, 1.5, 0.5, 0.5,
-1, -3.549303, -6.161188, 0, 1.5, 0.5, 0.5,
0, -3.549303, -6.161188, 0, -0.5, 0.5, 0.5,
0, -3.549303, -6.161188, 1, -0.5, 0.5, 0.5,
0, -3.549303, -6.161188, 1, 1.5, 0.5, 0.5,
0, -3.549303, -6.161188, 0, 1.5, 0.5, 0.5,
1, -3.549303, -6.161188, 0, -0.5, 0.5, 0.5,
1, -3.549303, -6.161188, 1, -0.5, 0.5, 0.5,
1, -3.549303, -6.161188, 1, 1.5, 0.5, 0.5,
1, -3.549303, -6.161188, 0, 1.5, 0.5, 0.5,
2, -3.549303, -6.161188, 0, -0.5, 0.5, 0.5,
2, -3.549303, -6.161188, 1, -0.5, 0.5, 0.5,
2, -3.549303, -6.161188, 1, 1.5, 0.5, 0.5,
2, -3.549303, -6.161188, 0, 1.5, 0.5, 0.5,
3, -3.549303, -6.161188, 0, -0.5, 0.5, 0.5,
3, -3.549303, -6.161188, 1, -0.5, 0.5, 0.5,
3, -3.549303, -6.161188, 1, 1.5, 0.5, 0.5,
3, -3.549303, -6.161188, 0, 1.5, 0.5, 0.5
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
-3.019452, -2, -5.365118,
-3.019452, 3, -5.365118,
-3.019452, -2, -5.365118,
-3.187783, -2, -5.630475,
-3.019452, -1, -5.365118,
-3.187783, -1, -5.630475,
-3.019452, 0, -5.365118,
-3.187783, 0, -5.630475,
-3.019452, 1, -5.365118,
-3.187783, 1, -5.630475,
-3.019452, 2, -5.365118,
-3.187783, 2, -5.630475,
-3.019452, 3, -5.365118,
-3.187783, 3, -5.630475
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
-3.524445, -2, -6.161188, 0, -0.5, 0.5, 0.5,
-3.524445, -2, -6.161188, 1, -0.5, 0.5, 0.5,
-3.524445, -2, -6.161188, 1, 1.5, 0.5, 0.5,
-3.524445, -2, -6.161188, 0, 1.5, 0.5, 0.5,
-3.524445, -1, -6.161188, 0, -0.5, 0.5, 0.5,
-3.524445, -1, -6.161188, 1, -0.5, 0.5, 0.5,
-3.524445, -1, -6.161188, 1, 1.5, 0.5, 0.5,
-3.524445, -1, -6.161188, 0, 1.5, 0.5, 0.5,
-3.524445, 0, -6.161188, 0, -0.5, 0.5, 0.5,
-3.524445, 0, -6.161188, 1, -0.5, 0.5, 0.5,
-3.524445, 0, -6.161188, 1, 1.5, 0.5, 0.5,
-3.524445, 0, -6.161188, 0, 1.5, 0.5, 0.5,
-3.524445, 1, -6.161188, 0, -0.5, 0.5, 0.5,
-3.524445, 1, -6.161188, 1, -0.5, 0.5, 0.5,
-3.524445, 1, -6.161188, 1, 1.5, 0.5, 0.5,
-3.524445, 1, -6.161188, 0, 1.5, 0.5, 0.5,
-3.524445, 2, -6.161188, 0, -0.5, 0.5, 0.5,
-3.524445, 2, -6.161188, 1, -0.5, 0.5, 0.5,
-3.524445, 2, -6.161188, 1, 1.5, 0.5, 0.5,
-3.524445, 2, -6.161188, 0, 1.5, 0.5, 0.5,
-3.524445, 3, -6.161188, 0, -0.5, 0.5, 0.5,
-3.524445, 3, -6.161188, 1, -0.5, 0.5, 0.5,
-3.524445, 3, -6.161188, 1, 1.5, 0.5, 0.5,
-3.524445, 3, -6.161188, 0, 1.5, 0.5, 0.5
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
-3.019452, -3.084787, -4,
-3.019452, -3.084787, 4,
-3.019452, -3.084787, -4,
-3.187783, -3.239626, -4,
-3.019452, -3.084787, -2,
-3.187783, -3.239626, -2,
-3.019452, -3.084787, 0,
-3.187783, -3.239626, 0,
-3.019452, -3.084787, 2,
-3.187783, -3.239626, 2,
-3.019452, -3.084787, 4,
-3.187783, -3.239626, 4
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
-3.524445, -3.549303, -4, 0, -0.5, 0.5, 0.5,
-3.524445, -3.549303, -4, 1, -0.5, 0.5, 0.5,
-3.524445, -3.549303, -4, 1, 1.5, 0.5, 0.5,
-3.524445, -3.549303, -4, 0, 1.5, 0.5, 0.5,
-3.524445, -3.549303, -2, 0, -0.5, 0.5, 0.5,
-3.524445, -3.549303, -2, 1, -0.5, 0.5, 0.5,
-3.524445, -3.549303, -2, 1, 1.5, 0.5, 0.5,
-3.524445, -3.549303, -2, 0, 1.5, 0.5, 0.5,
-3.524445, -3.549303, 0, 0, -0.5, 0.5, 0.5,
-3.524445, -3.549303, 0, 1, -0.5, 0.5, 0.5,
-3.524445, -3.549303, 0, 1, 1.5, 0.5, 0.5,
-3.524445, -3.549303, 0, 0, 1.5, 0.5, 0.5,
-3.524445, -3.549303, 2, 0, -0.5, 0.5, 0.5,
-3.524445, -3.549303, 2, 1, -0.5, 0.5, 0.5,
-3.524445, -3.549303, 2, 1, 1.5, 0.5, 0.5,
-3.524445, -3.549303, 2, 0, 1.5, 0.5, 0.5,
-3.524445, -3.549303, 4, 0, -0.5, 0.5, 0.5,
-3.524445, -3.549303, 4, 1, -0.5, 0.5, 0.5,
-3.524445, -3.549303, 4, 1, 1.5, 0.5, 0.5,
-3.524445, -3.549303, 4, 0, 1.5, 0.5, 0.5
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
-3.019452, -3.084787, -5.365118,
-3.019452, 3.108749, -5.365118,
-3.019452, -3.084787, 5.249149,
-3.019452, 3.108749, 5.249149,
-3.019452, -3.084787, -5.365118,
-3.019452, -3.084787, 5.249149,
-3.019452, 3.108749, -5.365118,
-3.019452, 3.108749, 5.249149,
-3.019452, -3.084787, -5.365118,
3.713788, -3.084787, -5.365118,
-3.019452, -3.084787, 5.249149,
3.713788, -3.084787, 5.249149,
-3.019452, 3.108749, -5.365118,
3.713788, 3.108749, -5.365118,
-3.019452, 3.108749, 5.249149,
3.713788, 3.108749, 5.249149,
3.713788, -3.084787, -5.365118,
3.713788, 3.108749, -5.365118,
3.713788, -3.084787, 5.249149,
3.713788, 3.108749, 5.249149,
3.713788, -3.084787, -5.365118,
3.713788, -3.084787, 5.249149,
3.713788, 3.108749, -5.365118,
3.713788, 3.108749, 5.249149
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
var radius = 7.482573;
var distance = 33.29081;
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
mvMatrix.translate( -0.3471682, -0.01198089, 0.05798459 );
mvMatrix.scale( 1.201547, 1.306249, 0.7622104 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.29081);
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


