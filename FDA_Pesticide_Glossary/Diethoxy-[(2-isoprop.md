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
-3.939775, 0.2106331, -0.7027311, 1, 0, 0, 1,
-3.524089, 0.1050073, -3.402004, 1, 0.007843138, 0, 1,
-3.410979, -0.491129, -0.6973099, 1, 0.01176471, 0, 1,
-3.268557, -0.6881609, -2.309216, 1, 0.01960784, 0, 1,
-3.026556, 1.786094, -2.23291, 1, 0.02352941, 0, 1,
-2.992831, -0.4028562, -2.4415, 1, 0.03137255, 0, 1,
-2.538442, 1.453307, -0.7793146, 1, 0.03529412, 0, 1,
-2.528616, 1.376797, -0.04570032, 1, 0.04313726, 0, 1,
-2.406036, 0.8862393, -1.934257, 1, 0.04705882, 0, 1,
-2.394749, -1.071561, -2.44088, 1, 0.05490196, 0, 1,
-2.390054, 1.21761, -0.9788123, 1, 0.05882353, 0, 1,
-2.387784, -0.9120052, -1.472368, 1, 0.06666667, 0, 1,
-2.380663, -1.008342, -3.550719, 1, 0.07058824, 0, 1,
-2.353711, 0.8718344, -0.05559107, 1, 0.07843138, 0, 1,
-2.340229, 1.45092, -0.0284045, 1, 0.08235294, 0, 1,
-2.323067, -0.3564559, -2.56501, 1, 0.09019608, 0, 1,
-2.311228, -0.1196718, -0.5326724, 1, 0.09411765, 0, 1,
-2.257821, 0.1143635, -2.346334, 1, 0.1019608, 0, 1,
-2.234187, 0.9463606, -0.3125957, 1, 0.1098039, 0, 1,
-2.22875, 0.7350767, -0.4850149, 1, 0.1137255, 0, 1,
-2.22555, 2.409216, -1.333709, 1, 0.1215686, 0, 1,
-2.200222, -1.108778, -2.964033, 1, 0.1254902, 0, 1,
-2.197142, -0.2666978, -2.324108, 1, 0.1333333, 0, 1,
-2.190929, 2.182604, -2.030861, 1, 0.1372549, 0, 1,
-2.185393, 0.2040937, -1.647134, 1, 0.145098, 0, 1,
-2.14665, 0.9847181, -2.132066, 1, 0.1490196, 0, 1,
-2.121126, -0.0962364, -1.218609, 1, 0.1568628, 0, 1,
-2.106027, 0.01177451, -0.8428299, 1, 0.1607843, 0, 1,
-2.094035, 2.053947, -1.827401, 1, 0.1686275, 0, 1,
-2.058178, -1.123421, -1.414088, 1, 0.172549, 0, 1,
-2.010787, 0.753399, -0.5191672, 1, 0.1803922, 0, 1,
-2.000804, -0.09169857, -1.458662, 1, 0.1843137, 0, 1,
-1.989903, 0.02585483, -1.911827, 1, 0.1921569, 0, 1,
-1.900841, 0.0630215, -0.796497, 1, 0.1960784, 0, 1,
-1.872488, -0.1306917, -1.553604, 1, 0.2039216, 0, 1,
-1.869709, 0.935524, -2.585695, 1, 0.2117647, 0, 1,
-1.860804, -0.1066411, -1.057936, 1, 0.2156863, 0, 1,
-1.845804, 0.6137909, -1.295832, 1, 0.2235294, 0, 1,
-1.844157, -0.1528977, -1.634962, 1, 0.227451, 0, 1,
-1.799718, -0.3689448, -1.741159, 1, 0.2352941, 0, 1,
-1.798142, 2.29671, -0.3223408, 1, 0.2392157, 0, 1,
-1.787511, 2.326637, 1.531494, 1, 0.2470588, 0, 1,
-1.785347, -0.8946536, -2.952697, 1, 0.2509804, 0, 1,
-1.779006, -0.6703845, -2.011211, 1, 0.2588235, 0, 1,
-1.746469, 0.4611435, -0.7130019, 1, 0.2627451, 0, 1,
-1.742587, 0.4935265, -0.4827998, 1, 0.2705882, 0, 1,
-1.735299, -1.441789, -3.781868, 1, 0.2745098, 0, 1,
-1.718487, 1.442809, -1.236918, 1, 0.282353, 0, 1,
-1.715109, -0.7659177, -1.030668, 1, 0.2862745, 0, 1,
-1.696153, -0.1575255, -2.829472, 1, 0.2941177, 0, 1,
-1.688239, 0.5406897, -2.844571, 1, 0.3019608, 0, 1,
-1.681583, 0.6489836, -2.276563, 1, 0.3058824, 0, 1,
-1.673355, 1.580373, -2.316918, 1, 0.3137255, 0, 1,
-1.655464, -0.4697858, 0.6254749, 1, 0.3176471, 0, 1,
-1.654224, 1.076797, -1.126059, 1, 0.3254902, 0, 1,
-1.640687, 1.65281, -0.6888164, 1, 0.3294118, 0, 1,
-1.626158, -1.9616, -1.529897, 1, 0.3372549, 0, 1,
-1.625435, 1.196675, -1.04613, 1, 0.3411765, 0, 1,
-1.623388, 2.556112, 0.9446086, 1, 0.3490196, 0, 1,
-1.617188, -1.380167, -2.692658, 1, 0.3529412, 0, 1,
-1.614502, 0.9065468, -1.99428, 1, 0.3607843, 0, 1,
-1.612396, 1.017199, -1.5744, 1, 0.3647059, 0, 1,
-1.611013, 0.5597407, -2.934225, 1, 0.372549, 0, 1,
-1.610816, 1.887432, -2.00809, 1, 0.3764706, 0, 1,
-1.604621, -1.884197, -1.309618, 1, 0.3843137, 0, 1,
-1.604066, -0.4945386, -1.157313, 1, 0.3882353, 0, 1,
-1.600427, -0.1876582, -0.436167, 1, 0.3960784, 0, 1,
-1.590557, -1.247025, -3.620083, 1, 0.4039216, 0, 1,
-1.583444, 1.278394, -0.5159345, 1, 0.4078431, 0, 1,
-1.577478, -1.813238, -3.69461, 1, 0.4156863, 0, 1,
-1.570886, -1.020239, -2.475671, 1, 0.4196078, 0, 1,
-1.564665, -0.1079624, -0.1770159, 1, 0.427451, 0, 1,
-1.563835, 0.410408, -0.07560422, 1, 0.4313726, 0, 1,
-1.554339, -0.6998265, -0.4653617, 1, 0.4392157, 0, 1,
-1.540798, 0.06125942, 0.3386671, 1, 0.4431373, 0, 1,
-1.527098, 0.3726736, 0.01560377, 1, 0.4509804, 0, 1,
-1.511715, -0.1944724, -1.73638, 1, 0.454902, 0, 1,
-1.508142, -0.2234645, -2.082686, 1, 0.4627451, 0, 1,
-1.506338, -0.6176417, -1.815747, 1, 0.4666667, 0, 1,
-1.500266, -0.7779397, -2.927046, 1, 0.4745098, 0, 1,
-1.499861, -0.5287956, -3.126543, 1, 0.4784314, 0, 1,
-1.491597, -0.6096913, -0.9869949, 1, 0.4862745, 0, 1,
-1.480888, 1.026734, -1.865278, 1, 0.4901961, 0, 1,
-1.475193, -1.777253, -0.7070912, 1, 0.4980392, 0, 1,
-1.462685, 0.1539364, -0.2903133, 1, 0.5058824, 0, 1,
-1.452848, -0.6378601, -1.269768, 1, 0.509804, 0, 1,
-1.448406, -0.7726675, -1.631051, 1, 0.5176471, 0, 1,
-1.443799, 0.6899571, -1.131925, 1, 0.5215687, 0, 1,
-1.438498, 0.2028282, -2.917989, 1, 0.5294118, 0, 1,
-1.436772, -1.488941, -0.3564282, 1, 0.5333334, 0, 1,
-1.436152, -0.04747577, 1.184368, 1, 0.5411765, 0, 1,
-1.427363, 2.093229, -0.1043114, 1, 0.5450981, 0, 1,
-1.424566, -1.000144, -2.275546, 1, 0.5529412, 0, 1,
-1.423308, 0.6430346, -2.421868, 1, 0.5568628, 0, 1,
-1.418268, 0.214701, -1.983275, 1, 0.5647059, 0, 1,
-1.417063, 1.238333, -0.1328383, 1, 0.5686275, 0, 1,
-1.413597, 0.5969647, -4.048604, 1, 0.5764706, 0, 1,
-1.381, 1.975184, -0.4999442, 1, 0.5803922, 0, 1,
-1.359972, -1.246605, -2.495652, 1, 0.5882353, 0, 1,
-1.355857, 0.1353711, -1.513286, 1, 0.5921569, 0, 1,
-1.339064, 0.1229377, -2.95151, 1, 0.6, 0, 1,
-1.337844, -0.3834193, -2.575176, 1, 0.6078432, 0, 1,
-1.331541, -0.2643643, -1.485008, 1, 0.6117647, 0, 1,
-1.328711, -1.324534, -0.989977, 1, 0.6196079, 0, 1,
-1.324447, 0.9524304, -0.8816038, 1, 0.6235294, 0, 1,
-1.311647, 0.4681651, -2.740034, 1, 0.6313726, 0, 1,
-1.311456, -1.443773, -2.595389, 1, 0.6352941, 0, 1,
-1.30989, 0.3233048, -1.67072, 1, 0.6431373, 0, 1,
-1.302335, 0.5440375, -1.493878, 1, 0.6470588, 0, 1,
-1.298601, -0.1484883, -3.244944, 1, 0.654902, 0, 1,
-1.295502, -1.26878, -0.4480437, 1, 0.6588235, 0, 1,
-1.294779, -0.1226182, -1.814425, 1, 0.6666667, 0, 1,
-1.289854, -1.817573, -1.496592, 1, 0.6705883, 0, 1,
-1.287429, -1.812697, -1.283035, 1, 0.6784314, 0, 1,
-1.282073, -0.7694655, -2.840313, 1, 0.682353, 0, 1,
-1.282041, 0.1329145, -0.59571, 1, 0.6901961, 0, 1,
-1.280041, -0.9263687, -1.411553, 1, 0.6941177, 0, 1,
-1.279141, -1.126985, -2.761395, 1, 0.7019608, 0, 1,
-1.278302, -0.8530561, -3.949166, 1, 0.7098039, 0, 1,
-1.275787, 0.6285443, -1.63537, 1, 0.7137255, 0, 1,
-1.265654, -1.336942, -1.03282, 1, 0.7215686, 0, 1,
-1.263608, 0.6146506, -3.026048, 1, 0.7254902, 0, 1,
-1.259511, 0.9914314, -0.2462945, 1, 0.7333333, 0, 1,
-1.256272, -0.323611, -1.949461, 1, 0.7372549, 0, 1,
-1.248895, 2.14478, -1.033349, 1, 0.7450981, 0, 1,
-1.248227, 1.672663, 0.3477385, 1, 0.7490196, 0, 1,
-1.247519, -0.7212119, -1.183769, 1, 0.7568628, 0, 1,
-1.238091, -1.375044, -3.926776, 1, 0.7607843, 0, 1,
-1.233544, 1.33499, -0.8565544, 1, 0.7686275, 0, 1,
-1.229643, 0.9337931, -1.691185, 1, 0.772549, 0, 1,
-1.229435, 0.9507034, -2.118921, 1, 0.7803922, 0, 1,
-1.219787, 0.7174627, -0.05598505, 1, 0.7843137, 0, 1,
-1.21966, 0.5705222, -2.387973, 1, 0.7921569, 0, 1,
-1.216267, 0.5976821, -2.805818, 1, 0.7960784, 0, 1,
-1.206817, -0.5713551, -1.972608, 1, 0.8039216, 0, 1,
-1.203444, -0.6634245, -2.903783, 1, 0.8117647, 0, 1,
-1.203266, -0.4622436, -1.892657, 1, 0.8156863, 0, 1,
-1.200324, -0.2643066, -3.016784, 1, 0.8235294, 0, 1,
-1.191404, -0.3052004, -0.9901973, 1, 0.827451, 0, 1,
-1.187436, 0.6886029, -1.70879, 1, 0.8352941, 0, 1,
-1.185548, -0.8424529, -1.380592, 1, 0.8392157, 0, 1,
-1.185078, -0.1524187, -1.584244, 1, 0.8470588, 0, 1,
-1.174255, 0.5519118, -0.06757304, 1, 0.8509804, 0, 1,
-1.155338, -0.4625234, -2.693722, 1, 0.8588235, 0, 1,
-1.149775, 0.3875813, 0.1906616, 1, 0.8627451, 0, 1,
-1.144661, -0.6486962, -0.5936654, 1, 0.8705882, 0, 1,
-1.142934, 0.4508037, -0.8371996, 1, 0.8745098, 0, 1,
-1.138671, -0.9639342, -2.391618, 1, 0.8823529, 0, 1,
-1.137266, 0.5222272, -1.2238, 1, 0.8862745, 0, 1,
-1.135613, 0.1711664, 0.6909063, 1, 0.8941177, 0, 1,
-1.134907, -1.704275, -3.849314, 1, 0.8980392, 0, 1,
-1.130211, -1.310019, -1.374718, 1, 0.9058824, 0, 1,
-1.128968, 1.035158, -1.54161, 1, 0.9137255, 0, 1,
-1.121526, -0.6045453, -1.372431, 1, 0.9176471, 0, 1,
-1.11863, -0.5252606, -4.044008, 1, 0.9254902, 0, 1,
-1.117516, 1.449692, -0.3313805, 1, 0.9294118, 0, 1,
-1.116657, -0.009539499, -2.876116, 1, 0.9372549, 0, 1,
-1.114195, 0.7664149, 0.3789064, 1, 0.9411765, 0, 1,
-1.111367, 1.183385, -0.3475566, 1, 0.9490196, 0, 1,
-1.110322, 1.115165, -1.730821, 1, 0.9529412, 0, 1,
-1.108865, 0.6581209, -1.397179, 1, 0.9607843, 0, 1,
-1.104715, -0.08045338, -0.2989199, 1, 0.9647059, 0, 1,
-1.101696, -0.7306529, -2.489068, 1, 0.972549, 0, 1,
-1.092905, 0.7443739, -0.5658613, 1, 0.9764706, 0, 1,
-1.090405, 0.5934534, -1.508546, 1, 0.9843137, 0, 1,
-1.087928, -0.1672934, -1.680691, 1, 0.9882353, 0, 1,
-1.085472, 0.354395, -1.537966, 1, 0.9960784, 0, 1,
-1.083519, 1.659524, -0.1874737, 0.9960784, 1, 0, 1,
-1.080748, 1.497897, -1.865253, 0.9921569, 1, 0, 1,
-1.079455, 0.9517536, -0.7097394, 0.9843137, 1, 0, 1,
-1.079339, -1.214243, -3.168456, 0.9803922, 1, 0, 1,
-1.078146, -1.13486, -3.026768, 0.972549, 1, 0, 1,
-1.07289, -1.008701, -3.019277, 0.9686275, 1, 0, 1,
-1.072664, 1.042409, -2.488367, 0.9607843, 1, 0, 1,
-1.059514, -0.4385399, -1.383616, 0.9568627, 1, 0, 1,
-1.055549, 0.4132052, -1.612592, 0.9490196, 1, 0, 1,
-1.049551, 1.049834, -1.611318, 0.945098, 1, 0, 1,
-1.039881, -0.5950962, -1.487962, 0.9372549, 1, 0, 1,
-1.032816, -0.4139027, -1.59182, 0.9333333, 1, 0, 1,
-1.026349, 1.130025, -1.842551, 0.9254902, 1, 0, 1,
-1.022832, -0.3421585, -3.445088, 0.9215686, 1, 0, 1,
-1.015537, -0.9497908, -2.164868, 0.9137255, 1, 0, 1,
-1.010158, 0.4482552, -0.8137302, 0.9098039, 1, 0, 1,
-1.006608, -1.146791, -3.841592, 0.9019608, 1, 0, 1,
-1.005888, 0.860857, -1.476102, 0.8941177, 1, 0, 1,
-1.005391, -0.3300577, -2.823835, 0.8901961, 1, 0, 1,
-1.004192, 1.01018, -1.395129, 0.8823529, 1, 0, 1,
-0.9956424, 0.6440873, -0.1353169, 0.8784314, 1, 0, 1,
-0.9941835, 1.265131, -0.08418218, 0.8705882, 1, 0, 1,
-0.9915509, -0.1328908, -2.971262, 0.8666667, 1, 0, 1,
-0.9849609, 0.8041392, -0.395739, 0.8588235, 1, 0, 1,
-0.9841301, -0.8966831, -1.464816, 0.854902, 1, 0, 1,
-0.981891, -0.6405622, -1.345625, 0.8470588, 1, 0, 1,
-0.9801614, 0.02775254, -3.548672, 0.8431373, 1, 0, 1,
-0.9671587, 1.658978, -1.019702, 0.8352941, 1, 0, 1,
-0.9574639, -0.5289943, -0.7645718, 0.8313726, 1, 0, 1,
-0.9562011, 0.9775697, -0.1947304, 0.8235294, 1, 0, 1,
-0.9468198, -1.024889, -1.746969, 0.8196079, 1, 0, 1,
-0.942533, -0.2514141, -2.331749, 0.8117647, 1, 0, 1,
-0.9410762, 0.2859598, -1.494809, 0.8078431, 1, 0, 1,
-0.9257953, -0.4975746, -2.492417, 0.8, 1, 0, 1,
-0.9251095, -0.6903048, -0.8867806, 0.7921569, 1, 0, 1,
-0.9196765, -0.1306766, -1.35677, 0.7882353, 1, 0, 1,
-0.9171765, 0.7400491, -1.951684, 0.7803922, 1, 0, 1,
-0.9162415, -0.08375401, -0.5369791, 0.7764706, 1, 0, 1,
-0.9162025, 0.6219859, -0.1055914, 0.7686275, 1, 0, 1,
-0.9160203, -0.4819567, -1.379436, 0.7647059, 1, 0, 1,
-0.9133499, -1.037073, -1.478494, 0.7568628, 1, 0, 1,
-0.9119301, 0.9565051, -1.395139, 0.7529412, 1, 0, 1,
-0.9113405, 0.4131034, -0.9854215, 0.7450981, 1, 0, 1,
-0.9103659, 0.0144526, -0.9121129, 0.7411765, 1, 0, 1,
-0.9083585, -0.2518732, -1.067659, 0.7333333, 1, 0, 1,
-0.9081354, -1.188049, -3.191475, 0.7294118, 1, 0, 1,
-0.9063886, -0.5064684, -3.250247, 0.7215686, 1, 0, 1,
-0.9063776, 0.13042, 0.7927417, 0.7176471, 1, 0, 1,
-0.9028723, 2.193969, -2.42749, 0.7098039, 1, 0, 1,
-0.8999707, -0.6390448, -2.835731, 0.7058824, 1, 0, 1,
-0.8802872, 0.8916486, -0.7413965, 0.6980392, 1, 0, 1,
-0.8802538, -1.534021, -3.336212, 0.6901961, 1, 0, 1,
-0.8791124, 0.8766791, -0.4190678, 0.6862745, 1, 0, 1,
-0.8787934, 0.1799297, -2.214712, 0.6784314, 1, 0, 1,
-0.8755494, 0.3355976, -2.45138, 0.6745098, 1, 0, 1,
-0.8744495, -0.28725, -2.887159, 0.6666667, 1, 0, 1,
-0.8729519, 0.763787, -1.06247, 0.6627451, 1, 0, 1,
-0.8725491, -0.2808688, -1.01329, 0.654902, 1, 0, 1,
-0.8701922, 0.9591399, -2.201159, 0.6509804, 1, 0, 1,
-0.86735, -1.625276, -4.457816, 0.6431373, 1, 0, 1,
-0.8649117, -1.404977, -3.929198, 0.6392157, 1, 0, 1,
-0.8646664, 1.473774, -0.2881389, 0.6313726, 1, 0, 1,
-0.8624024, 0.03803097, -0.4028746, 0.627451, 1, 0, 1,
-0.8590103, 0.2564809, -1.360059, 0.6196079, 1, 0, 1,
-0.8512194, -0.5975108, -1.423525, 0.6156863, 1, 0, 1,
-0.8495708, 0.3936765, -1.62554, 0.6078432, 1, 0, 1,
-0.8491229, 0.5481561, -1.236399, 0.6039216, 1, 0, 1,
-0.8467874, -2.429881, -3.56529, 0.5960785, 1, 0, 1,
-0.840152, -0.3353791, -1.646332, 0.5882353, 1, 0, 1,
-0.8385829, -0.9935578, -3.237917, 0.5843138, 1, 0, 1,
-0.8345724, -1.700982, -2.757476, 0.5764706, 1, 0, 1,
-0.8337724, -1.66312, -3.389463, 0.572549, 1, 0, 1,
-0.8203788, -0.7199405, -3.080908, 0.5647059, 1, 0, 1,
-0.8165222, -0.3217178, -0.7335361, 0.5607843, 1, 0, 1,
-0.8153825, -2.15445, -2.395268, 0.5529412, 1, 0, 1,
-0.814541, 0.4420812, -1.177264, 0.5490196, 1, 0, 1,
-0.8119786, 0.5985442, -0.9755725, 0.5411765, 1, 0, 1,
-0.8101959, 0.01749218, -2.168549, 0.5372549, 1, 0, 1,
-0.8082116, 1.101314, -0.6753877, 0.5294118, 1, 0, 1,
-0.799835, -0.5329374, -1.514227, 0.5254902, 1, 0, 1,
-0.797055, -0.7892206, -2.555435, 0.5176471, 1, 0, 1,
-0.7967832, -0.3482829, -2.782489, 0.5137255, 1, 0, 1,
-0.7942506, 0.6488307, 1.509474, 0.5058824, 1, 0, 1,
-0.7937638, 1.473554, -1.523186, 0.5019608, 1, 0, 1,
-0.7914898, -0.9215072, -2.092798, 0.4941176, 1, 0, 1,
-0.7898155, -0.2492806, -0.3394642, 0.4862745, 1, 0, 1,
-0.7845445, -0.4451659, -2.332438, 0.4823529, 1, 0, 1,
-0.7798489, -0.1585167, -1.618919, 0.4745098, 1, 0, 1,
-0.7755324, 0.08150135, 0.0622388, 0.4705882, 1, 0, 1,
-0.7740756, -0.799509, -2.780921, 0.4627451, 1, 0, 1,
-0.7733714, -0.7296094, -1.952259, 0.4588235, 1, 0, 1,
-0.7709773, -1.405449, -2.365979, 0.4509804, 1, 0, 1,
-0.7675864, -0.5765206, -1.18923, 0.4470588, 1, 0, 1,
-0.7633176, 0.2675031, 0.6316197, 0.4392157, 1, 0, 1,
-0.7612412, -0.8752252, -2.293406, 0.4352941, 1, 0, 1,
-0.7606654, -1.489832, -2.534841, 0.427451, 1, 0, 1,
-0.7539826, -0.03923912, -0.1204334, 0.4235294, 1, 0, 1,
-0.7529002, -0.7640664, -2.875917, 0.4156863, 1, 0, 1,
-0.7501546, 0.1492803, 0.1100248, 0.4117647, 1, 0, 1,
-0.750107, 0.1208526, -1.088878, 0.4039216, 1, 0, 1,
-0.7493043, 1.848141, 0.1082125, 0.3960784, 1, 0, 1,
-0.7461682, 0.7184157, -2.300367, 0.3921569, 1, 0, 1,
-0.7453875, 0.4209639, 1.0676, 0.3843137, 1, 0, 1,
-0.7430127, -0.1967404, -2.666238, 0.3803922, 1, 0, 1,
-0.7370053, -0.5352909, -2.969454, 0.372549, 1, 0, 1,
-0.7136, 1.007176, 1.062072, 0.3686275, 1, 0, 1,
-0.7126935, 0.8658751, 0.6731459, 0.3607843, 1, 0, 1,
-0.7088022, 2.103883, -1.862548, 0.3568628, 1, 0, 1,
-0.6939606, 0.7109531, -1.198731, 0.3490196, 1, 0, 1,
-0.6923445, -0.9029073, -2.613096, 0.345098, 1, 0, 1,
-0.6860567, 1.759974, -0.1250846, 0.3372549, 1, 0, 1,
-0.6807932, -0.612403, -3.767273, 0.3333333, 1, 0, 1,
-0.6794084, -0.7315011, -1.088261, 0.3254902, 1, 0, 1,
-0.6789876, -0.1707227, 0.2853722, 0.3215686, 1, 0, 1,
-0.6786864, 1.002172, 1.118662, 0.3137255, 1, 0, 1,
-0.6765579, -2.092527, -2.72606, 0.3098039, 1, 0, 1,
-0.6745194, -0.2736343, -2.616826, 0.3019608, 1, 0, 1,
-0.6743396, -0.5501019, -1.292184, 0.2941177, 1, 0, 1,
-0.6730151, 0.3271971, -2.080989, 0.2901961, 1, 0, 1,
-0.6674012, 0.8602241, 2.254701, 0.282353, 1, 0, 1,
-0.6654012, 0.4733267, -2.208299, 0.2784314, 1, 0, 1,
-0.6635855, 0.2956409, -2.252015, 0.2705882, 1, 0, 1,
-0.6630226, 0.2499279, 0.2594821, 0.2666667, 1, 0, 1,
-0.6617475, 0.6587541, 1.403548, 0.2588235, 1, 0, 1,
-0.6571288, 0.2405202, -0.3147699, 0.254902, 1, 0, 1,
-0.6570759, -0.152625, -1.250301, 0.2470588, 1, 0, 1,
-0.653407, -1.618522, -2.586361, 0.2431373, 1, 0, 1,
-0.6494717, 1.516434, 0.8993962, 0.2352941, 1, 0, 1,
-0.641955, 0.1987656, -1.470577, 0.2313726, 1, 0, 1,
-0.6408686, 0.8651677, 0.5596542, 0.2235294, 1, 0, 1,
-0.6382711, -1.577705, -1.745789, 0.2196078, 1, 0, 1,
-0.6346611, -0.3019655, -1.030894, 0.2117647, 1, 0, 1,
-0.6307673, -1.086481, -1.645527, 0.2078431, 1, 0, 1,
-0.6282033, -0.9306635, -3.640481, 0.2, 1, 0, 1,
-0.6278052, 0.141816, -0.02659158, 0.1921569, 1, 0, 1,
-0.6270664, -0.2382703, -1.802045, 0.1882353, 1, 0, 1,
-0.6253394, 0.9893047, 1.384561, 0.1803922, 1, 0, 1,
-0.6252453, -0.1958219, -3.08534, 0.1764706, 1, 0, 1,
-0.6221555, 0.5147644, -2.497595, 0.1686275, 1, 0, 1,
-0.6177961, 0.262955, -1.263413, 0.1647059, 1, 0, 1,
-0.6173925, -1.243863, -2.627713, 0.1568628, 1, 0, 1,
-0.610804, -0.005413573, -0.6196938, 0.1529412, 1, 0, 1,
-0.6090543, -0.7857401, -2.327925, 0.145098, 1, 0, 1,
-0.609013, 0.4686409, -0.5205168, 0.1411765, 1, 0, 1,
-0.6088775, 0.7031903, -1.922744, 0.1333333, 1, 0, 1,
-0.6060228, -1.393987, -2.811533, 0.1294118, 1, 0, 1,
-0.6057668, -0.5577306, -1.684249, 0.1215686, 1, 0, 1,
-0.6046606, -0.2842216, -1.838948, 0.1176471, 1, 0, 1,
-0.6045919, -0.4248426, -2.424321, 0.1098039, 1, 0, 1,
-0.6010336, 0.3450403, -3.192782, 0.1058824, 1, 0, 1,
-0.5976728, -0.2529679, -1.092422, 0.09803922, 1, 0, 1,
-0.5890806, 0.339437, -2.982059, 0.09019608, 1, 0, 1,
-0.5889605, -1.483153, -1.910226, 0.08627451, 1, 0, 1,
-0.5879008, 0.8880528, -1.545121, 0.07843138, 1, 0, 1,
-0.5849983, -0.5091835, -2.326135, 0.07450981, 1, 0, 1,
-0.583464, 0.7297825, -1.152436, 0.06666667, 1, 0, 1,
-0.5751028, -1.768148, -1.677487, 0.0627451, 1, 0, 1,
-0.5748476, 1.235338, -0.8515181, 0.05490196, 1, 0, 1,
-0.572892, -0.3991523, -2.512472, 0.05098039, 1, 0, 1,
-0.5693642, -0.2351817, -1.85411, 0.04313726, 1, 0, 1,
-0.5685513, 0.2096972, -2.187942, 0.03921569, 1, 0, 1,
-0.5604563, 1.037886, -1.620761, 0.03137255, 1, 0, 1,
-0.5604296, -0.08507634, -2.649159, 0.02745098, 1, 0, 1,
-0.5557501, -0.56366, -4.178858, 0.01960784, 1, 0, 1,
-0.5481889, 0.8522952, 2.218019, 0.01568628, 1, 0, 1,
-0.5464415, 0.7668744, -0.1801994, 0.007843138, 1, 0, 1,
-0.5437193, 0.6659315, -1.116856, 0.003921569, 1, 0, 1,
-0.5429979, -1.980943, -3.391621, 0, 1, 0.003921569, 1,
-0.5429696, 0.1997799, -1.693579, 0, 1, 0.01176471, 1,
-0.538865, -0.6309949, -2.940308, 0, 1, 0.01568628, 1,
-0.5351018, 0.04135259, -1.340838, 0, 1, 0.02352941, 1,
-0.529436, -1.66697, -1.825676, 0, 1, 0.02745098, 1,
-0.5203609, -0.1024824, -1.105147, 0, 1, 0.03529412, 1,
-0.5175939, 0.9809873, -0.7143686, 0, 1, 0.03921569, 1,
-0.5146959, 0.1799117, -1.484198, 0, 1, 0.04705882, 1,
-0.5104371, -0.2501226, -3.199219, 0, 1, 0.05098039, 1,
-0.5011302, 0.3409179, -0.6153324, 0, 1, 0.05882353, 1,
-0.4918659, -1.40712, -3.917677, 0, 1, 0.0627451, 1,
-0.490349, 0.8046203, -1.529078, 0, 1, 0.07058824, 1,
-0.489894, -1.111388, -3.311208, 0, 1, 0.07450981, 1,
-0.4887511, 0.4297945, -1.03857, 0, 1, 0.08235294, 1,
-0.4864077, 2.14153, -1.831448, 0, 1, 0.08627451, 1,
-0.4842558, -0.9724091, -2.568739, 0, 1, 0.09411765, 1,
-0.476129, 1.107888, -1.792944, 0, 1, 0.1019608, 1,
-0.4761126, -0.1209392, 0.6282349, 0, 1, 0.1058824, 1,
-0.4752805, 0.6010351, -1.943385, 0, 1, 0.1137255, 1,
-0.4745096, 2.065584, -0.1319593, 0, 1, 0.1176471, 1,
-0.474118, -0.4147036, -2.352905, 0, 1, 0.1254902, 1,
-0.4738649, -1.223477, -2.564112, 0, 1, 0.1294118, 1,
-0.4669366, -0.5914541, -2.768006, 0, 1, 0.1372549, 1,
-0.4610348, 0.9637851, -0.4929599, 0, 1, 0.1411765, 1,
-0.4574302, 1.135477, -0.6038311, 0, 1, 0.1490196, 1,
-0.4548519, -0.9417512, -2.819693, 0, 1, 0.1529412, 1,
-0.4547436, 0.5551279, -1.000076, 0, 1, 0.1607843, 1,
-0.4528614, -0.1417039, -0.4205855, 0, 1, 0.1647059, 1,
-0.4361331, 0.1410588, -0.5146889, 0, 1, 0.172549, 1,
-0.4314564, 0.1139064, 1.40038, 0, 1, 0.1764706, 1,
-0.4296067, -1.468095, -1.373059, 0, 1, 0.1843137, 1,
-0.4295404, 0.07892929, -1.885575, 0, 1, 0.1882353, 1,
-0.4291592, -0.926969, -3.594632, 0, 1, 0.1960784, 1,
-0.4263863, -0.4131275, -1.321866, 0, 1, 0.2039216, 1,
-0.4217757, 1.865844, -0.7082148, 0, 1, 0.2078431, 1,
-0.4198048, 0.0907153, -1.858647, 0, 1, 0.2156863, 1,
-0.419726, -0.5817987, -1.758125, 0, 1, 0.2196078, 1,
-0.4165806, -1.054742, -2.05168, 0, 1, 0.227451, 1,
-0.4148864, -1.542042, -1.93989, 0, 1, 0.2313726, 1,
-0.4131225, 0.1976681, -1.974921, 0, 1, 0.2392157, 1,
-0.4095051, -0.4131387, -2.283741, 0, 1, 0.2431373, 1,
-0.4087944, -1.046652, -0.7591314, 0, 1, 0.2509804, 1,
-0.4078779, 0.2201709, -1.005504, 0, 1, 0.254902, 1,
-0.4034548, 2.052837, -0.412182, 0, 1, 0.2627451, 1,
-0.3956976, 0.1136115, -0.6325172, 0, 1, 0.2666667, 1,
-0.394531, 2.352946, 0.6862715, 0, 1, 0.2745098, 1,
-0.3923222, -0.3035482, -1.70046, 0, 1, 0.2784314, 1,
-0.3897515, 0.5513588, -2.113036, 0, 1, 0.2862745, 1,
-0.3880937, -1.512654, -4.582264, 0, 1, 0.2901961, 1,
-0.3872354, -2.72489, -2.381913, 0, 1, 0.2980392, 1,
-0.3867279, -0.2281585, -2.749494, 0, 1, 0.3058824, 1,
-0.3714461, 0.01202839, -0.9932119, 0, 1, 0.3098039, 1,
-0.3714131, 0.7357267, 0.1451251, 0, 1, 0.3176471, 1,
-0.3672695, -0.6176367, -2.647586, 0, 1, 0.3215686, 1,
-0.3665101, -0.3981147, -2.555091, 0, 1, 0.3294118, 1,
-0.3636905, -0.00764516, -1.484293, 0, 1, 0.3333333, 1,
-0.3625171, 0.9080507, -0.04957671, 0, 1, 0.3411765, 1,
-0.3614932, 0.2176986, 1.327513, 0, 1, 0.345098, 1,
-0.3607515, 1.205107, -0.5916015, 0, 1, 0.3529412, 1,
-0.3500838, 1.814903, 0.1881289, 0, 1, 0.3568628, 1,
-0.349257, 1.880489, 0.3865612, 0, 1, 0.3647059, 1,
-0.3482272, -1.137003, -1.743132, 0, 1, 0.3686275, 1,
-0.3463725, -1.988924, -2.561783, 0, 1, 0.3764706, 1,
-0.3427459, -0.9007772, -3.097611, 0, 1, 0.3803922, 1,
-0.3410048, -0.2991059, -1.76474, 0, 1, 0.3882353, 1,
-0.3393688, -1.052435, -2.33752, 0, 1, 0.3921569, 1,
-0.3388955, 1.586806, 1.144422, 0, 1, 0.4, 1,
-0.3370674, 0.1055143, -1.050965, 0, 1, 0.4078431, 1,
-0.3324384, 0.378021, 0.1787244, 0, 1, 0.4117647, 1,
-0.3283081, 0.336222, -0.6207654, 0, 1, 0.4196078, 1,
-0.322888, -0.3451854, -2.514437, 0, 1, 0.4235294, 1,
-0.3202301, 1.773276, 0.2219534, 0, 1, 0.4313726, 1,
-0.3186808, -2.129808, -4.439749, 0, 1, 0.4352941, 1,
-0.3174066, -0.5324519, -2.20108, 0, 1, 0.4431373, 1,
-0.3145855, -1.06965, -3.699561, 0, 1, 0.4470588, 1,
-0.3113133, 0.01412531, -1.091899, 0, 1, 0.454902, 1,
-0.3031623, -0.02166538, -1.181851, 0, 1, 0.4588235, 1,
-0.3020901, -0.7341328, -2.245182, 0, 1, 0.4666667, 1,
-0.3013923, 0.9651589, -0.497907, 0, 1, 0.4705882, 1,
-0.2832167, -0.4312968, -2.859994, 0, 1, 0.4784314, 1,
-0.2826916, -1.415179, -3.748816, 0, 1, 0.4823529, 1,
-0.280837, 0.02821625, -3.186704, 0, 1, 0.4901961, 1,
-0.2777544, -0.003577269, -4.50543, 0, 1, 0.4941176, 1,
-0.2768986, -0.02541476, -1.282299, 0, 1, 0.5019608, 1,
-0.2696113, -0.6473586, -3.065742, 0, 1, 0.509804, 1,
-0.2625619, 0.7189475, -1.083177, 0, 1, 0.5137255, 1,
-0.2607226, 0.2767662, -0.6583445, 0, 1, 0.5215687, 1,
-0.2582655, -0.6926935, -1.017001, 0, 1, 0.5254902, 1,
-0.2578671, -0.06802215, -2.310341, 0, 1, 0.5333334, 1,
-0.2572509, 0.4332102, -2.23562, 0, 1, 0.5372549, 1,
-0.2554103, -0.6560143, -3.889849, 0, 1, 0.5450981, 1,
-0.2472592, -0.1275073, -1.651038, 0, 1, 0.5490196, 1,
-0.2415712, 0.06554141, -0.08785373, 0, 1, 0.5568628, 1,
-0.2378068, 0.0752321, -0.2087308, 0, 1, 0.5607843, 1,
-0.2364904, -0.4497544, -1.714714, 0, 1, 0.5686275, 1,
-0.2333327, 0.1854603, -1.900386, 0, 1, 0.572549, 1,
-0.2290188, -1.355235, -4.334365, 0, 1, 0.5803922, 1,
-0.2288797, 1.813179, -0.8019453, 0, 1, 0.5843138, 1,
-0.2280115, -0.2029531, -1.430405, 0, 1, 0.5921569, 1,
-0.2257504, 1.417983, -0.9147102, 0, 1, 0.5960785, 1,
-0.2230531, -0.1124937, -0.711481, 0, 1, 0.6039216, 1,
-0.2209789, -1.480461, -2.263336, 0, 1, 0.6117647, 1,
-0.2201385, 0.5588286, 0.9406796, 0, 1, 0.6156863, 1,
-0.2142595, 0.5444763, -0.8979408, 0, 1, 0.6235294, 1,
-0.2120573, -0.8992496, -1.572959, 0, 1, 0.627451, 1,
-0.2114301, 1.264146, -0.9606571, 0, 1, 0.6352941, 1,
-0.2074856, -1.193248, -1.032138, 0, 1, 0.6392157, 1,
-0.2036542, -0.6051636, -2.485722, 0, 1, 0.6470588, 1,
-0.1984199, -0.3131596, -1.940115, 0, 1, 0.6509804, 1,
-0.1980528, -1.697485, -2.28219, 0, 1, 0.6588235, 1,
-0.1974081, -0.7082668, -2.517608, 0, 1, 0.6627451, 1,
-0.1943727, 1.50946, 1.258457, 0, 1, 0.6705883, 1,
-0.1909813, -0.2124038, -3.29627, 0, 1, 0.6745098, 1,
-0.1901789, -0.4518645, -5.253497, 0, 1, 0.682353, 1,
-0.1858801, 0.7520975, -1.033426, 0, 1, 0.6862745, 1,
-0.1838119, 0.2022567, 0.6983135, 0, 1, 0.6941177, 1,
-0.1824138, 1.297073, -0.7743174, 0, 1, 0.7019608, 1,
-0.1801623, 1.051085, 0.7235346, 0, 1, 0.7058824, 1,
-0.1737642, -1.453196, -3.046346, 0, 1, 0.7137255, 1,
-0.1674564, 0.7247747, 1.083613, 0, 1, 0.7176471, 1,
-0.1631363, 0.7907524, -0.6101344, 0, 1, 0.7254902, 1,
-0.1625575, -0.4047656, -2.148673, 0, 1, 0.7294118, 1,
-0.16159, -0.3557704, -2.208241, 0, 1, 0.7372549, 1,
-0.1600508, 1.742237, 0.211521, 0, 1, 0.7411765, 1,
-0.1595769, 1.998877, -0.03379107, 0, 1, 0.7490196, 1,
-0.1572078, -2.35145, -4.866242, 0, 1, 0.7529412, 1,
-0.1544653, 0.530111, -0.5307379, 0, 1, 0.7607843, 1,
-0.1496495, -0.7112331, -2.433837, 0, 1, 0.7647059, 1,
-0.1493641, 1.149148, -0.5465277, 0, 1, 0.772549, 1,
-0.1465801, -0.9229971, -3.422769, 0, 1, 0.7764706, 1,
-0.1462523, 1.339604, 0.05240178, 0, 1, 0.7843137, 1,
-0.142108, 0.4400749, -0.5538716, 0, 1, 0.7882353, 1,
-0.1393531, 0.03174903, -2.813226, 0, 1, 0.7960784, 1,
-0.1382852, 1.437709, -0.227937, 0, 1, 0.8039216, 1,
-0.1339547, 1.934374, -0.9251583, 0, 1, 0.8078431, 1,
-0.1326407, -0.9425263, -4.104549, 0, 1, 0.8156863, 1,
-0.1321808, -0.6045694, -1.868056, 0, 1, 0.8196079, 1,
-0.1316779, 1.482115, -0.2618514, 0, 1, 0.827451, 1,
-0.131176, 0.5382572, -0.6433814, 0, 1, 0.8313726, 1,
-0.1311478, 1.067728, 0.3773043, 0, 1, 0.8392157, 1,
-0.1258721, -0.1629071, -1.750331, 0, 1, 0.8431373, 1,
-0.120153, 1.341966, -0.7380506, 0, 1, 0.8509804, 1,
-0.1195764, -0.1127792, -1.805052, 0, 1, 0.854902, 1,
-0.1175412, -2.277938, -2.104168, 0, 1, 0.8627451, 1,
-0.117274, 0.1667646, -0.8955779, 0, 1, 0.8666667, 1,
-0.1139264, 1.424868, -1.686989, 0, 1, 0.8745098, 1,
-0.1137133, 2.387671, -0.360907, 0, 1, 0.8784314, 1,
-0.1132646, 1.32472, -0.8107829, 0, 1, 0.8862745, 1,
-0.1118649, 0.01669553, -1.362554, 0, 1, 0.8901961, 1,
-0.09841088, -1.165498, -1.887314, 0, 1, 0.8980392, 1,
-0.09784946, -0.2497357, -4.017478, 0, 1, 0.9058824, 1,
-0.09760586, -0.1900818, -4.360078, 0, 1, 0.9098039, 1,
-0.09540167, 1.324412, 0.2939267, 0, 1, 0.9176471, 1,
-0.09416892, -0.2384877, -3.896425, 0, 1, 0.9215686, 1,
-0.09016268, 0.305575, 0.6735858, 0, 1, 0.9294118, 1,
-0.08961911, 0.645428, -2.502018, 0, 1, 0.9333333, 1,
-0.07714856, 1.32961, 0.2764348, 0, 1, 0.9411765, 1,
-0.07296464, 0.1518435, 1.024211, 0, 1, 0.945098, 1,
-0.05945249, 0.7812099, 0.9361497, 0, 1, 0.9529412, 1,
-0.05944429, -1.726037, -2.465487, 0, 1, 0.9568627, 1,
-0.05473436, 0.02911342, -1.641939, 0, 1, 0.9647059, 1,
-0.05451831, -1.05907, -5.021024, 0, 1, 0.9686275, 1,
-0.04839247, -0.1918013, -3.167658, 0, 1, 0.9764706, 1,
-0.04764692, 0.009847359, -0.9734897, 0, 1, 0.9803922, 1,
-0.0461894, -0.2475677, -3.942136, 0, 1, 0.9882353, 1,
-0.04518192, -0.2597364, -2.828468, 0, 1, 0.9921569, 1,
-0.04367114, 1.754979, 0.1306334, 0, 1, 1, 1,
-0.04265478, -1.482666, -3.450314, 0, 0.9921569, 1, 1,
-0.04188909, 1.762234, -0.6343094, 0, 0.9882353, 1, 1,
-0.03690822, 0.05384479, -0.6883387, 0, 0.9803922, 1, 1,
-0.03677268, -0.6033194, -3.968977, 0, 0.9764706, 1, 1,
-0.03421752, -0.2425275, -2.242976, 0, 0.9686275, 1, 1,
-0.03408919, 0.2110318, 2.740122, 0, 0.9647059, 1, 1,
-0.03327626, 0.8256978, 0.7782479, 0, 0.9568627, 1, 1,
-0.02879633, 1.02466, -1.204833, 0, 0.9529412, 1, 1,
-0.02628846, -0.9204119, -3.617739, 0, 0.945098, 1, 1,
-0.01979718, -1.378817, -4.341366, 0, 0.9411765, 1, 1,
-0.01856311, -1.732678, -4.011044, 0, 0.9333333, 1, 1,
-0.0153354, -0.1256728, -2.494669, 0, 0.9294118, 1, 1,
-0.01487973, -0.9993108, -3.925331, 0, 0.9215686, 1, 1,
-0.01072144, -0.148291, -2.447958, 0, 0.9176471, 1, 1,
-0.00737219, -3.178242, -3.647609, 0, 0.9098039, 1, 1,
-0.005629717, -0.4998085, -2.662789, 0, 0.9058824, 1, 1,
-0.002741367, -2.073295, -1.693754, 0, 0.8980392, 1, 1,
-0.002329737, 0.1616309, 0.9942979, 0, 0.8901961, 1, 1,
0.001944036, 0.6924346, -1.266428, 0, 0.8862745, 1, 1,
0.004785775, -1.00418, 4.428479, 0, 0.8784314, 1, 1,
0.005880679, -0.3449421, 2.375577, 0, 0.8745098, 1, 1,
0.006202048, 0.3534785, -0.4745158, 0, 0.8666667, 1, 1,
0.01560017, -0.01079669, 2.59677, 0, 0.8627451, 1, 1,
0.02439279, -0.7011099, 3.480177, 0, 0.854902, 1, 1,
0.02595136, 1.935524, -1.038823, 0, 0.8509804, 1, 1,
0.02888376, -1.115334, 2.857167, 0, 0.8431373, 1, 1,
0.03423333, -1.122847, 1.704822, 0, 0.8392157, 1, 1,
0.03545633, 0.6740934, 2.208667, 0, 0.8313726, 1, 1,
0.03617216, 1.112012, -1.656422, 0, 0.827451, 1, 1,
0.04102603, -1.160146, 3.093193, 0, 0.8196079, 1, 1,
0.04506651, 1.252846, 0.6313559, 0, 0.8156863, 1, 1,
0.04871858, 1.022928, 2.239504, 0, 0.8078431, 1, 1,
0.04960446, 1.97345, 0.132129, 0, 0.8039216, 1, 1,
0.04960511, 0.1303832, 0.8042908, 0, 0.7960784, 1, 1,
0.05478147, -1.677677, 4.662908, 0, 0.7882353, 1, 1,
0.06779537, 0.7851638, -0.9210042, 0, 0.7843137, 1, 1,
0.06804213, -1.841333, 2.203289, 0, 0.7764706, 1, 1,
0.07420261, 0.8282722, -0.7039196, 0, 0.772549, 1, 1,
0.07509134, -1.464029, 5.534167, 0, 0.7647059, 1, 1,
0.07619786, 1.107083, 0.3141526, 0, 0.7607843, 1, 1,
0.08011302, -0.4608529, 3.070903, 0, 0.7529412, 1, 1,
0.08045279, -0.7252942, 1.992239, 0, 0.7490196, 1, 1,
0.08243565, 1.360843, 0.4633105, 0, 0.7411765, 1, 1,
0.08465731, -0.004446535, 3.158959, 0, 0.7372549, 1, 1,
0.08557317, 1.060523, 0.4139189, 0, 0.7294118, 1, 1,
0.08642053, 0.6382644, 0.04672292, 0, 0.7254902, 1, 1,
0.09152622, -0.1511642, 3.722549, 0, 0.7176471, 1, 1,
0.09421757, -1.913553, 4.30363, 0, 0.7137255, 1, 1,
0.09605508, -2.283074, 2.185624, 0, 0.7058824, 1, 1,
0.09793999, -1.445309, 2.600121, 0, 0.6980392, 1, 1,
0.1031955, -0.4473509, 2.009574, 0, 0.6941177, 1, 1,
0.1039618, -1.06794, 3.539048, 0, 0.6862745, 1, 1,
0.1059263, -0.8148336, 3.212629, 0, 0.682353, 1, 1,
0.1077351, -1.204898, 4.11988, 0, 0.6745098, 1, 1,
0.1126155, 0.2514924, 1.091778, 0, 0.6705883, 1, 1,
0.1140271, -0.6482212, 3.675055, 0, 0.6627451, 1, 1,
0.1157367, 0.1455871, -0.775519, 0, 0.6588235, 1, 1,
0.1205606, 0.3547247, -0.8794495, 0, 0.6509804, 1, 1,
0.1230611, -0.259845, 3.583881, 0, 0.6470588, 1, 1,
0.123116, -1.032495, 2.430227, 0, 0.6392157, 1, 1,
0.1270542, -0.2838981, 3.955843, 0, 0.6352941, 1, 1,
0.1308053, -0.142053, 0.7748343, 0, 0.627451, 1, 1,
0.1352322, 0.2067756, -0.8123074, 0, 0.6235294, 1, 1,
0.1381961, 0.850243, -0.9671217, 0, 0.6156863, 1, 1,
0.1400658, 0.8215683, 0.1604984, 0, 0.6117647, 1, 1,
0.1425719, -1.377281, 4.038421, 0, 0.6039216, 1, 1,
0.144422, 0.8666877, 1.438207, 0, 0.5960785, 1, 1,
0.1446634, -0.9519479, 2.729816, 0, 0.5921569, 1, 1,
0.1449344, -0.1363821, 2.897166, 0, 0.5843138, 1, 1,
0.1509729, 0.005837768, 0.6856478, 0, 0.5803922, 1, 1,
0.1553623, 0.1425611, 1.801077, 0, 0.572549, 1, 1,
0.1553853, -2.084948, 3.431456, 0, 0.5686275, 1, 1,
0.1554102, -1.833688, 3.284135, 0, 0.5607843, 1, 1,
0.1632024, 1.618643, -0.8630434, 0, 0.5568628, 1, 1,
0.1632917, -1.689873, 3.666596, 0, 0.5490196, 1, 1,
0.1671209, 0.986819, 0.3232302, 0, 0.5450981, 1, 1,
0.1674745, -0.02677129, 1.525722, 0, 0.5372549, 1, 1,
0.1706116, 0.5386016, 0.2156206, 0, 0.5333334, 1, 1,
0.1744168, 1.07297, 1.043207, 0, 0.5254902, 1, 1,
0.1746276, 1.288323, -0.1842663, 0, 0.5215687, 1, 1,
0.1749052, 0.1845971, 0.6351475, 0, 0.5137255, 1, 1,
0.1770724, 0.6025403, 1.334761, 0, 0.509804, 1, 1,
0.1796012, 2.12676, -0.07239038, 0, 0.5019608, 1, 1,
0.1808565, -0.4851595, 2.476227, 0, 0.4941176, 1, 1,
0.18748, -0.5610621, 1.852307, 0, 0.4901961, 1, 1,
0.1885756, 1.532287, -0.2140623, 0, 0.4823529, 1, 1,
0.1906169, -0.540275, 3.400615, 0, 0.4784314, 1, 1,
0.1907545, -0.2669604, 2.495862, 0, 0.4705882, 1, 1,
0.193134, 0.4977979, 1.470281, 0, 0.4666667, 1, 1,
0.1973691, 2.057414, 2.381062, 0, 0.4588235, 1, 1,
0.1986527, -1.246227, 2.859451, 0, 0.454902, 1, 1,
0.2007235, -0.08858635, 2.288819, 0, 0.4470588, 1, 1,
0.2020663, 0.9714075, -0.5431985, 0, 0.4431373, 1, 1,
0.2090421, 3.105182, 0.3590872, 0, 0.4352941, 1, 1,
0.2095162, 0.6041744, 0.4342094, 0, 0.4313726, 1, 1,
0.2115402, -0.5112733, 2.137104, 0, 0.4235294, 1, 1,
0.2154981, 0.5143301, -0.383135, 0, 0.4196078, 1, 1,
0.2156969, 1.586184, 0.6502206, 0, 0.4117647, 1, 1,
0.2164623, -0.9122388, 2.765999, 0, 0.4078431, 1, 1,
0.2179784, -0.5420182, 2.972058, 0, 0.4, 1, 1,
0.2235723, -1.164816, 3.834011, 0, 0.3921569, 1, 1,
0.2238242, -1.170431, 2.570416, 0, 0.3882353, 1, 1,
0.2253051, 0.6406323, -1.607383, 0, 0.3803922, 1, 1,
0.2296488, 1.346975, -0.08634944, 0, 0.3764706, 1, 1,
0.2327025, 0.8441114, -0.1379869, 0, 0.3686275, 1, 1,
0.2345566, 0.6403991, 1.459707, 0, 0.3647059, 1, 1,
0.2442208, -1.312257, 5.112555, 0, 0.3568628, 1, 1,
0.2463751, 0.4303234, 2.352243, 0, 0.3529412, 1, 1,
0.2466206, -0.868385, 1.970844, 0, 0.345098, 1, 1,
0.2477345, -1.393287, 3.149606, 0, 0.3411765, 1, 1,
0.2503263, -0.2404694, 3.900621, 0, 0.3333333, 1, 1,
0.251916, -0.005170337, 1.280347, 0, 0.3294118, 1, 1,
0.2644511, 1.15446, 0.1228775, 0, 0.3215686, 1, 1,
0.2796901, -0.5639191, 1.13532, 0, 0.3176471, 1, 1,
0.2829493, 1.304188, 1.219937, 0, 0.3098039, 1, 1,
0.2863161, 0.1239572, 1.859559, 0, 0.3058824, 1, 1,
0.2866795, -1.578996, 4.701119, 0, 0.2980392, 1, 1,
0.2931575, -1.274179, 3.988757, 0, 0.2901961, 1, 1,
0.2943102, -1.632594, 2.933775, 0, 0.2862745, 1, 1,
0.2960162, 0.5222414, 0.7256637, 0, 0.2784314, 1, 1,
0.3037857, -1.498431, 3.392081, 0, 0.2745098, 1, 1,
0.304138, -1.197909, 3.073102, 0, 0.2666667, 1, 1,
0.3064841, -1.115703, 3.777692, 0, 0.2627451, 1, 1,
0.3085032, 0.02840856, 2.918469, 0, 0.254902, 1, 1,
0.3097432, 0.8007222, 1.87765, 0, 0.2509804, 1, 1,
0.3100294, -0.8544234, 3.03694, 0, 0.2431373, 1, 1,
0.3119473, -0.03215166, -0.5977642, 0, 0.2392157, 1, 1,
0.3124972, -1.711331, 1.618204, 0, 0.2313726, 1, 1,
0.3144624, 0.6936111, 0.342922, 0, 0.227451, 1, 1,
0.3160998, 1.025568, -0.6303847, 0, 0.2196078, 1, 1,
0.3177431, 0.7708058, 0.6460299, 0, 0.2156863, 1, 1,
0.3196907, -1.420642, 2.777713, 0, 0.2078431, 1, 1,
0.3201077, -0.6844974, 3.956626, 0, 0.2039216, 1, 1,
0.3221664, 0.3109633, -0.8712121, 0, 0.1960784, 1, 1,
0.3281599, -0.03084287, 1.295029, 0, 0.1882353, 1, 1,
0.3344288, 0.3009354, -0.2887692, 0, 0.1843137, 1, 1,
0.3357114, -0.8279955, 1.920553, 0, 0.1764706, 1, 1,
0.3407488, -1.417403, 2.460198, 0, 0.172549, 1, 1,
0.3455279, -0.9604971, 2.904185, 0, 0.1647059, 1, 1,
0.3468852, 1.31248, -0.2097256, 0, 0.1607843, 1, 1,
0.3516867, 0.5704179, 0.976796, 0, 0.1529412, 1, 1,
0.3534599, -0.663219, 2.904447, 0, 0.1490196, 1, 1,
0.3563945, 0.6380019, 0.6899312, 0, 0.1411765, 1, 1,
0.3566643, 0.4857785, 0.5508935, 0, 0.1372549, 1, 1,
0.3578267, 0.4625618, -0.1407724, 0, 0.1294118, 1, 1,
0.3593632, -2.526702, 4.147398, 0, 0.1254902, 1, 1,
0.3597963, -0.05114847, 0.7605553, 0, 0.1176471, 1, 1,
0.3651977, 0.3297488, 0.7926784, 0, 0.1137255, 1, 1,
0.3660654, 1.081348, 0.4716004, 0, 0.1058824, 1, 1,
0.3662457, 0.9102688, -0.495634, 0, 0.09803922, 1, 1,
0.3674436, -0.1281552, 1.42305, 0, 0.09411765, 1, 1,
0.3682382, 0.21793, 1.023423, 0, 0.08627451, 1, 1,
0.3723716, 0.1072694, 0.7307504, 0, 0.08235294, 1, 1,
0.373061, 1.261191, 1.448527, 0, 0.07450981, 1, 1,
0.3748991, 0.1868932, 1.60384, 0, 0.07058824, 1, 1,
0.376617, -0.3676806, 3.437301, 0, 0.0627451, 1, 1,
0.3774462, 0.3576094, 0.2377195, 0, 0.05882353, 1, 1,
0.3792755, 0.09482635, 0.6983298, 0, 0.05098039, 1, 1,
0.3817576, 1.09447, -0.2207173, 0, 0.04705882, 1, 1,
0.3826148, 1.170338, -0.2455166, 0, 0.03921569, 1, 1,
0.3839124, 0.1401708, 2.164129, 0, 0.03529412, 1, 1,
0.3930595, 0.8558734, -0.7952241, 0, 0.02745098, 1, 1,
0.3951572, -1.092359, 4.023939, 0, 0.02352941, 1, 1,
0.4013762, -0.6076389, 2.377561, 0, 0.01568628, 1, 1,
0.4017254, -0.02326652, -0.1585732, 0, 0.01176471, 1, 1,
0.4042172, -2.240724, 3.408917, 0, 0.003921569, 1, 1,
0.4058681, -1.393799, 2.42427, 0.003921569, 0, 1, 1,
0.4247563, 0.6563883, 0.1273941, 0.007843138, 0, 1, 1,
0.4265253, -0.3028507, 2.097273, 0.01568628, 0, 1, 1,
0.4322605, -0.4701158, 2.935086, 0.01960784, 0, 1, 1,
0.4326082, 0.2048069, -0.06049524, 0.02745098, 0, 1, 1,
0.4350519, -0.8237491, 3.603694, 0.03137255, 0, 1, 1,
0.4351198, -0.942909, 2.180001, 0.03921569, 0, 1, 1,
0.4390704, -0.2962484, 2.106154, 0.04313726, 0, 1, 1,
0.4405162, -0.4926691, 2.373683, 0.05098039, 0, 1, 1,
0.4410262, 0.731207, -0.5340868, 0.05490196, 0, 1, 1,
0.4418347, -1.257898, 3.502658, 0.0627451, 0, 1, 1,
0.442297, -1.318547, 2.806408, 0.06666667, 0, 1, 1,
0.4498745, 1.732043, -0.06639162, 0.07450981, 0, 1, 1,
0.4520235, -0.5472028, 1.553933, 0.07843138, 0, 1, 1,
0.4542495, 0.8822668, -0.5933193, 0.08627451, 0, 1, 1,
0.4569996, 0.1124213, 1.742335, 0.09019608, 0, 1, 1,
0.4574197, -1.321007, 2.347946, 0.09803922, 0, 1, 1,
0.4700048, -0.8716382, 3.800559, 0.1058824, 0, 1, 1,
0.472709, 0.3027911, 1.320275, 0.1098039, 0, 1, 1,
0.4729802, 0.1020104, 0.4446467, 0.1176471, 0, 1, 1,
0.4739401, -1.221555, 3.065552, 0.1215686, 0, 1, 1,
0.4752429, -0.6042339, 3.02585, 0.1294118, 0, 1, 1,
0.483361, 0.1125543, -0.321538, 0.1333333, 0, 1, 1,
0.4897728, -0.1409589, 1.557551, 0.1411765, 0, 1, 1,
0.4905754, 0.5901974, 0.4242675, 0.145098, 0, 1, 1,
0.5042131, 0.5020044, 0.3809841, 0.1529412, 0, 1, 1,
0.5076348, -1.201989, 3.254228, 0.1568628, 0, 1, 1,
0.5076392, 0.4453257, 2.009786, 0.1647059, 0, 1, 1,
0.5095668, -0.7798275, 3.127023, 0.1686275, 0, 1, 1,
0.5099791, 1.644333, 0.7943228, 0.1764706, 0, 1, 1,
0.5100545, 1.29185, 0.1673604, 0.1803922, 0, 1, 1,
0.5107267, -1.934954, 3.896697, 0.1882353, 0, 1, 1,
0.5129512, 1.157439, -1.110855, 0.1921569, 0, 1, 1,
0.514625, 0.7697554, -0.3303563, 0.2, 0, 1, 1,
0.5189395, -0.313991, 1.494594, 0.2078431, 0, 1, 1,
0.5206308, 1.386931, -0.7696386, 0.2117647, 0, 1, 1,
0.5246872, 0.5017507, 1.218098, 0.2196078, 0, 1, 1,
0.5258908, -0.4650087, 2.578546, 0.2235294, 0, 1, 1,
0.5262443, -0.2425776, 2.67824, 0.2313726, 0, 1, 1,
0.5269327, -2.304164, 5.076306, 0.2352941, 0, 1, 1,
0.5341883, 1.008435, 0.7527434, 0.2431373, 0, 1, 1,
0.5510882, -1.130388, 1.489384, 0.2470588, 0, 1, 1,
0.5547869, 0.1726456, 1.167017, 0.254902, 0, 1, 1,
0.5568835, -0.9585261, 2.987173, 0.2588235, 0, 1, 1,
0.5601297, -0.3850949, 2.40806, 0.2666667, 0, 1, 1,
0.5644163, 0.3772861, -0.9354394, 0.2705882, 0, 1, 1,
0.5681978, 0.1698967, -0.5755156, 0.2784314, 0, 1, 1,
0.573025, -0.9512568, 2.786294, 0.282353, 0, 1, 1,
0.5740822, 1.184151, 0.1440397, 0.2901961, 0, 1, 1,
0.5754352, -0.4795575, 1.883507, 0.2941177, 0, 1, 1,
0.5766544, 0.8435947, 1.183963, 0.3019608, 0, 1, 1,
0.5782096, 0.5970388, 2.476817, 0.3098039, 0, 1, 1,
0.5789967, 1.398382, -0.5425203, 0.3137255, 0, 1, 1,
0.5824125, 0.2431491, -0.02519629, 0.3215686, 0, 1, 1,
0.5828655, -0.2689553, 3.279301, 0.3254902, 0, 1, 1,
0.5846186, -0.6044014, 4.376078, 0.3333333, 0, 1, 1,
0.5846803, -0.6247417, 3.031068, 0.3372549, 0, 1, 1,
0.5849468, 0.3839069, 1.079487, 0.345098, 0, 1, 1,
0.5915557, 0.04804983, 1.897669, 0.3490196, 0, 1, 1,
0.5943585, -0.3031786, -0.6787602, 0.3568628, 0, 1, 1,
0.5944977, -0.7530002, 4.249485, 0.3607843, 0, 1, 1,
0.5945101, -0.2668838, 1.367722, 0.3686275, 0, 1, 1,
0.5965475, 0.1977018, 1.261576, 0.372549, 0, 1, 1,
0.5971595, -1.349963, 3.34581, 0.3803922, 0, 1, 1,
0.5975055, 0.5626069, 0.1975751, 0.3843137, 0, 1, 1,
0.59756, -1.217263, 2.896701, 0.3921569, 0, 1, 1,
0.5984132, -0.7409717, 0.6034355, 0.3960784, 0, 1, 1,
0.6005806, 0.6151199, 0.6938977, 0.4039216, 0, 1, 1,
0.6123715, 0.8768769, 0.4841033, 0.4117647, 0, 1, 1,
0.6138167, 1.209456, 0.8803274, 0.4156863, 0, 1, 1,
0.6146667, -0.02385939, 2.275917, 0.4235294, 0, 1, 1,
0.6211016, -1.557047, 2.383995, 0.427451, 0, 1, 1,
0.627143, -0.4595704, 1.568663, 0.4352941, 0, 1, 1,
0.6295983, 0.0160915, 2.328783, 0.4392157, 0, 1, 1,
0.6360133, -0.910776, 2.24306, 0.4470588, 0, 1, 1,
0.6399136, -0.3812929, 2.232823, 0.4509804, 0, 1, 1,
0.6404402, 0.2562839, -0.1831376, 0.4588235, 0, 1, 1,
0.6434252, 0.327173, -1.221313, 0.4627451, 0, 1, 1,
0.6438115, -0.007446197, 2.353326, 0.4705882, 0, 1, 1,
0.6526085, -0.1154233, 2.334791, 0.4745098, 0, 1, 1,
0.6559291, 1.305162, 1.498966, 0.4823529, 0, 1, 1,
0.6568044, -0.2017863, 2.070196, 0.4862745, 0, 1, 1,
0.6579791, 0.16021, 1.529318, 0.4941176, 0, 1, 1,
0.6586658, -0.1617331, 2.489574, 0.5019608, 0, 1, 1,
0.658777, 0.1030204, 1.407481, 0.5058824, 0, 1, 1,
0.6614479, -0.8683311, 2.081015, 0.5137255, 0, 1, 1,
0.6635568, 0.5408455, 0.3702118, 0.5176471, 0, 1, 1,
0.6662272, 0.5418168, 0.8103772, 0.5254902, 0, 1, 1,
0.6669305, -1.738232, 2.11746, 0.5294118, 0, 1, 1,
0.6682178, -0.7585256, 3.563623, 0.5372549, 0, 1, 1,
0.6684347, 0.1271976, 0.3175827, 0.5411765, 0, 1, 1,
0.6693594, -1.071198, 2.862719, 0.5490196, 0, 1, 1,
0.6707968, -0.5005721, 3.968072, 0.5529412, 0, 1, 1,
0.686821, -0.0715771, 1.467663, 0.5607843, 0, 1, 1,
0.6908419, 0.3396696, 1.728958, 0.5647059, 0, 1, 1,
0.6969434, 1.359526, 0.3004256, 0.572549, 0, 1, 1,
0.7005903, 0.06259092, -0.5185421, 0.5764706, 0, 1, 1,
0.7016132, 1.320074, 0.7423257, 0.5843138, 0, 1, 1,
0.7150944, 0.7560276, -0.2065758, 0.5882353, 0, 1, 1,
0.7210324, 0.392622, 2.108811, 0.5960785, 0, 1, 1,
0.724012, -1.296193, 2.933188, 0.6039216, 0, 1, 1,
0.7320252, 0.9262422, 0.1850701, 0.6078432, 0, 1, 1,
0.7321892, -1.244421, 2.608647, 0.6156863, 0, 1, 1,
0.7362413, -1.152892, 1.984319, 0.6196079, 0, 1, 1,
0.7365047, 0.3997609, 0.84543, 0.627451, 0, 1, 1,
0.7461477, -0.703711, 2.316294, 0.6313726, 0, 1, 1,
0.7504084, 0.8050195, -0.07613748, 0.6392157, 0, 1, 1,
0.7524695, 1.18848, 1.972915, 0.6431373, 0, 1, 1,
0.7528158, -0.04071939, 0.9222639, 0.6509804, 0, 1, 1,
0.7565188, -0.2605252, 0.6762965, 0.654902, 0, 1, 1,
0.7577652, 0.9505395, 0.3510109, 0.6627451, 0, 1, 1,
0.7591966, 0.356952, -0.00436266, 0.6666667, 0, 1, 1,
0.7602626, -0.5066575, 3.434158, 0.6745098, 0, 1, 1,
0.7631569, 0.9567373, 1.727003, 0.6784314, 0, 1, 1,
0.7639002, -0.70214, 1.863774, 0.6862745, 0, 1, 1,
0.7644193, 0.4075676, 2.735232, 0.6901961, 0, 1, 1,
0.7657101, 0.1501451, 1.921931, 0.6980392, 0, 1, 1,
0.7713334, -1.540206, 2.517982, 0.7058824, 0, 1, 1,
0.7753388, -0.5421187, 1.037908, 0.7098039, 0, 1, 1,
0.7918822, -0.7992164, 1.265035, 0.7176471, 0, 1, 1,
0.7932121, -0.007984403, 3.519594, 0.7215686, 0, 1, 1,
0.8077255, 1.808419, 0.3678627, 0.7294118, 0, 1, 1,
0.8095556, 0.526236, 0.8387712, 0.7333333, 0, 1, 1,
0.8131766, 0.523862, 0.9473097, 0.7411765, 0, 1, 1,
0.8135607, -1.797494, 2.403147, 0.7450981, 0, 1, 1,
0.8189651, 0.6434036, -0.1329709, 0.7529412, 0, 1, 1,
0.8209409, 1.851001, -0.168048, 0.7568628, 0, 1, 1,
0.8297814, 0.1745531, 1.57737, 0.7647059, 0, 1, 1,
0.8359022, -0.2522589, 1.365906, 0.7686275, 0, 1, 1,
0.8389284, 0.3717464, 2.351797, 0.7764706, 0, 1, 1,
0.8396062, -0.4673579, -0.1666223, 0.7803922, 0, 1, 1,
0.8415815, 0.09756701, 2.771767, 0.7882353, 0, 1, 1,
0.8437194, -0.1427017, 1.205505, 0.7921569, 0, 1, 1,
0.8514379, 0.9856823, 1.07272, 0.8, 0, 1, 1,
0.8529964, 2.043486, 0.1292078, 0.8078431, 0, 1, 1,
0.8545616, 0.7804659, 0.7494643, 0.8117647, 0, 1, 1,
0.8623062, -0.2037863, 1.196465, 0.8196079, 0, 1, 1,
0.8748534, -1.393744, 3.203903, 0.8235294, 0, 1, 1,
0.8940019, 0.1576192, 3.325423, 0.8313726, 0, 1, 1,
0.9041697, 2.497414, 0.3970301, 0.8352941, 0, 1, 1,
0.9093667, -1.058931, 3.574768, 0.8431373, 0, 1, 1,
0.9118304, -0.9969658, 3.493047, 0.8470588, 0, 1, 1,
0.9138035, 1.621934, -0.2831894, 0.854902, 0, 1, 1,
0.9208632, -0.1043356, 2.612841, 0.8588235, 0, 1, 1,
0.9261093, 0.6899584, 0.3168997, 0.8666667, 0, 1, 1,
0.929931, 1.948159, -0.05603871, 0.8705882, 0, 1, 1,
0.9523202, 0.464852, 1.74058, 0.8784314, 0, 1, 1,
0.9524978, -1.535599, 2.151484, 0.8823529, 0, 1, 1,
0.9596171, -0.9317413, 1.92397, 0.8901961, 0, 1, 1,
0.96224, -1.056632, 4.804835, 0.8941177, 0, 1, 1,
0.9638677, -0.9360281, 1.466557, 0.9019608, 0, 1, 1,
0.9650295, 1.683162, 0.8274438, 0.9098039, 0, 1, 1,
0.9722798, -0.6653172, 3.760302, 0.9137255, 0, 1, 1,
0.9756851, 0.09284011, 1.890859, 0.9215686, 0, 1, 1,
0.9817355, -0.5650741, 1.881244, 0.9254902, 0, 1, 1,
0.9842886, -0.8843269, 2.433344, 0.9333333, 0, 1, 1,
0.9937853, 1.944208, 1.619839, 0.9372549, 0, 1, 1,
1.000116, -0.4896379, 2.64712, 0.945098, 0, 1, 1,
1.009602, -1.593568, 2.390923, 0.9490196, 0, 1, 1,
1.017294, -1.907565, 2.248651, 0.9568627, 0, 1, 1,
1.018578, -0.6988262, 2.340055, 0.9607843, 0, 1, 1,
1.018998, -0.6307991, 3.112517, 0.9686275, 0, 1, 1,
1.034783, 1.812873, 1.256912, 0.972549, 0, 1, 1,
1.038784, -0.6116726, 3.451201, 0.9803922, 0, 1, 1,
1.043803, 0.8664771, 1.614835, 0.9843137, 0, 1, 1,
1.049387, 2.27019, 1.752895, 0.9921569, 0, 1, 1,
1.056922, -2.050609, 2.001848, 0.9960784, 0, 1, 1,
1.059024, -0.3209266, 1.603654, 1, 0, 0.9960784, 1,
1.059798, 0.3244815, 2.09222, 1, 0, 0.9882353, 1,
1.060423, 0.1859801, 2.062486, 1, 0, 0.9843137, 1,
1.065078, 2.312219, 1.586532, 1, 0, 0.9764706, 1,
1.069232, 0.0908676, 1.824203, 1, 0, 0.972549, 1,
1.070201, 0.5073876, 2.81749, 1, 0, 0.9647059, 1,
1.075388, -0.1313419, 3.914272, 1, 0, 0.9607843, 1,
1.078423, 1.619697, 0.4328683, 1, 0, 0.9529412, 1,
1.07969, 0.4840875, 1.807036, 1, 0, 0.9490196, 1,
1.090424, 0.1855121, -0.3441438, 1, 0, 0.9411765, 1,
1.094208, 0.8630211, 0.4176286, 1, 0, 0.9372549, 1,
1.094361, -0.8872603, 1.16436, 1, 0, 0.9294118, 1,
1.095735, -0.06921582, 2.882138, 1, 0, 0.9254902, 1,
1.095831, 0.1770514, 0.961857, 1, 0, 0.9176471, 1,
1.099682, -2.164685, 2.735124, 1, 0, 0.9137255, 1,
1.121303, -0.3102071, 1.145476, 1, 0, 0.9058824, 1,
1.121421, -1.441809, 0.5752694, 1, 0, 0.9019608, 1,
1.12977, 1.018455, 0.9254149, 1, 0, 0.8941177, 1,
1.13083, 1.810504, 0.8122764, 1, 0, 0.8862745, 1,
1.131532, 2.030892, 1.543468, 1, 0, 0.8823529, 1,
1.139669, -0.1294976, 1.883033, 1, 0, 0.8745098, 1,
1.139844, -1.135266, 2.210151, 1, 0, 0.8705882, 1,
1.150051, -0.2411058, 1.497881, 1, 0, 0.8627451, 1,
1.15439, 0.839006, 0.6318801, 1, 0, 0.8588235, 1,
1.156474, 0.860698, 1.524886, 1, 0, 0.8509804, 1,
1.156722, 0.867654, -0.1519992, 1, 0, 0.8470588, 1,
1.168291, 0.9287249, 1.327972, 1, 0, 0.8392157, 1,
1.171737, -0.5864643, 1.950872, 1, 0, 0.8352941, 1,
1.180771, -0.4900065, 2.663436, 1, 0, 0.827451, 1,
1.186113, -0.3995739, 2.43037, 1, 0, 0.8235294, 1,
1.18664, -0.8778967, 1.825102, 1, 0, 0.8156863, 1,
1.189995, 1.137275, 1.819427, 1, 0, 0.8117647, 1,
1.190841, 0.341506, -0.6781599, 1, 0, 0.8039216, 1,
1.191261, -2.297941, 0.8394908, 1, 0, 0.7960784, 1,
1.19485, 0.6818036, 1.762215, 1, 0, 0.7921569, 1,
1.197857, 0.4219495, 2.387344, 1, 0, 0.7843137, 1,
1.199454, -0.3754722, 1.983289, 1, 0, 0.7803922, 1,
1.206897, 2.050364, 0.1636415, 1, 0, 0.772549, 1,
1.207965, 0.2305966, 2.935797, 1, 0, 0.7686275, 1,
1.216702, 1.299063, 2.10355, 1, 0, 0.7607843, 1,
1.223991, -1.182729, 1.91137, 1, 0, 0.7568628, 1,
1.22571, 0.3420588, 0.07042842, 1, 0, 0.7490196, 1,
1.232944, 1.575413, -0.707436, 1, 0, 0.7450981, 1,
1.235258, -0.6329194, 1.675537, 1, 0, 0.7372549, 1,
1.238616, 0.2833639, 1.923621, 1, 0, 0.7333333, 1,
1.244137, -0.8211114, 2.138495, 1, 0, 0.7254902, 1,
1.260351, -1.235736, 2.290248, 1, 0, 0.7215686, 1,
1.264523, 0.6893649, 2.211871, 1, 0, 0.7137255, 1,
1.265819, -0.2267473, 0.2656658, 1, 0, 0.7098039, 1,
1.265912, 1.839773, 1.042268, 1, 0, 0.7019608, 1,
1.273532, -0.2004124, 2.433503, 1, 0, 0.6941177, 1,
1.273876, 0.3530196, 2.075554, 1, 0, 0.6901961, 1,
1.274425, 0.2090013, 0.8865562, 1, 0, 0.682353, 1,
1.275017, 1.159313, 1.003511, 1, 0, 0.6784314, 1,
1.275922, 0.4276921, 2.049492, 1, 0, 0.6705883, 1,
1.282751, -0.3229676, 2.641691, 1, 0, 0.6666667, 1,
1.283937, 0.20308, 1.244028, 1, 0, 0.6588235, 1,
1.287797, 0.5651613, 1.365597, 1, 0, 0.654902, 1,
1.291738, 0.6477629, 0.6807725, 1, 0, 0.6470588, 1,
1.294791, 1.044696, 2.668573, 1, 0, 0.6431373, 1,
1.295206, -0.9222303, 1.594184, 1, 0, 0.6352941, 1,
1.296181, 1.772396, -0.2122978, 1, 0, 0.6313726, 1,
1.310535, 0.9690188, -0.1237705, 1, 0, 0.6235294, 1,
1.311827, -0.2632497, 1.632088, 1, 0, 0.6196079, 1,
1.312666, -2.385757, 3.358201, 1, 0, 0.6117647, 1,
1.314066, -2.29848, 2.097153, 1, 0, 0.6078432, 1,
1.327951, 0.299245, 1.356624, 1, 0, 0.6, 1,
1.335795, -1.17202, 2.924638, 1, 0, 0.5921569, 1,
1.340642, 0.6227679, 0.7617439, 1, 0, 0.5882353, 1,
1.34322, 0.2116286, 2.003963, 1, 0, 0.5803922, 1,
1.355204, 0.03908204, -1.161277, 1, 0, 0.5764706, 1,
1.355456, 1.091142, 0.7070702, 1, 0, 0.5686275, 1,
1.369278, 0.8267273, 0.418408, 1, 0, 0.5647059, 1,
1.370869, 0.843224, -0.2014753, 1, 0, 0.5568628, 1,
1.376574, -0.3974412, 1.81764, 1, 0, 0.5529412, 1,
1.384496, 1.555603, 1.25063, 1, 0, 0.5450981, 1,
1.390935, 0.560865, 1.685959, 1, 0, 0.5411765, 1,
1.394903, -0.442472, -0.01511651, 1, 0, 0.5333334, 1,
1.395562, 0.2826434, 0.5521825, 1, 0, 0.5294118, 1,
1.399138, 1.75763, -0.733775, 1, 0, 0.5215687, 1,
1.399637, 1.431466, 0.4217617, 1, 0, 0.5176471, 1,
1.4175, -2.416991, 3.079814, 1, 0, 0.509804, 1,
1.421837, 0.03721157, 2.772075, 1, 0, 0.5058824, 1,
1.42766, -0.07980724, 1.420671, 1, 0, 0.4980392, 1,
1.432859, -0.6240875, 1.627814, 1, 0, 0.4901961, 1,
1.433733, -0.9478627, 2.580772, 1, 0, 0.4862745, 1,
1.436913, 1.068576, 1.755104, 1, 0, 0.4784314, 1,
1.440644, 1.151326, 1.985396, 1, 0, 0.4745098, 1,
1.442563, 0.9021315, 0.02659419, 1, 0, 0.4666667, 1,
1.449431, 0.5684448, 2.204516, 1, 0, 0.4627451, 1,
1.451386, 1.537576, 1.968142, 1, 0, 0.454902, 1,
1.453934, -0.409344, 1.631634, 1, 0, 0.4509804, 1,
1.464982, 0.1780596, 2.956243, 1, 0, 0.4431373, 1,
1.468285, 1.662208, 1.091055, 1, 0, 0.4392157, 1,
1.469169, 0.04187002, 3.115933, 1, 0, 0.4313726, 1,
1.477972, 0.1469756, -0.1986704, 1, 0, 0.427451, 1,
1.491091, 0.2916102, 0.3195136, 1, 0, 0.4196078, 1,
1.496845, -1.127193, 2.419932, 1, 0, 0.4156863, 1,
1.517427, -0.01398263, 0.08669422, 1, 0, 0.4078431, 1,
1.536309, 0.6260098, 0.4135467, 1, 0, 0.4039216, 1,
1.552573, -0.1687905, 0.22204, 1, 0, 0.3960784, 1,
1.555184, -1.641046, 2.195445, 1, 0, 0.3882353, 1,
1.55556, -0.8980861, 1.23416, 1, 0, 0.3843137, 1,
1.560915, -0.580837, 3.361788, 1, 0, 0.3764706, 1,
1.562252, 0.1723857, 2.212167, 1, 0, 0.372549, 1,
1.562823, 0.1741412, 1.413778, 1, 0, 0.3647059, 1,
1.565797, -0.4095281, 3.042758, 1, 0, 0.3607843, 1,
1.577786, -0.8593596, 2.83861, 1, 0, 0.3529412, 1,
1.603144, -0.1630204, 1.415953, 1, 0, 0.3490196, 1,
1.616354, -0.5983437, 1.526407, 1, 0, 0.3411765, 1,
1.617719, 0.8233783, 0.6760316, 1, 0, 0.3372549, 1,
1.632347, 0.981306, -0.8893746, 1, 0, 0.3294118, 1,
1.63689, -0.2158324, 1.445662, 1, 0, 0.3254902, 1,
1.641505, -0.2821071, 0.2482488, 1, 0, 0.3176471, 1,
1.642909, -1.548206, 3.204059, 1, 0, 0.3137255, 1,
1.653282, 1.829679, -2.218024, 1, 0, 0.3058824, 1,
1.654265, -0.8622065, 2.341555, 1, 0, 0.2980392, 1,
1.660476, -1.491504, 1.132467, 1, 0, 0.2941177, 1,
1.666965, 0.4969975, 0.6907996, 1, 0, 0.2862745, 1,
1.672036, -0.7122225, 1.19515, 1, 0, 0.282353, 1,
1.674873, -1.418745, 1.244603, 1, 0, 0.2745098, 1,
1.681442, 0.825451, -0.6536549, 1, 0, 0.2705882, 1,
1.692953, -1.898996, 3.253189, 1, 0, 0.2627451, 1,
1.709943, 0.2535127, 0.9647028, 1, 0, 0.2588235, 1,
1.7116, 0.1467223, -0.04234381, 1, 0, 0.2509804, 1,
1.723395, 0.4288776, -0.2405178, 1, 0, 0.2470588, 1,
1.728145, 0.6808471, 1.014456, 1, 0, 0.2392157, 1,
1.736818, 1.254503, 0.6946993, 1, 0, 0.2352941, 1,
1.761693, -0.2159918, 2.559428, 1, 0, 0.227451, 1,
1.774448, 0.2459003, 2.225844, 1, 0, 0.2235294, 1,
1.787558, 0.7215979, 2.326747, 1, 0, 0.2156863, 1,
1.801833, 0.09537548, 1.334645, 1, 0, 0.2117647, 1,
1.814999, -1.577839, 1.887391, 1, 0, 0.2039216, 1,
1.853895, -2.508159, 3.611276, 1, 0, 0.1960784, 1,
1.88464, 0.4644986, 2.196969, 1, 0, 0.1921569, 1,
1.889149, 0.934671, -0.2545082, 1, 0, 0.1843137, 1,
1.889182, -0.01982228, 2.012271, 1, 0, 0.1803922, 1,
1.900653, 0.0161017, 1.550167, 1, 0, 0.172549, 1,
1.94573, -0.4546151, 1.865106, 1, 0, 0.1686275, 1,
1.946294, 1.20337, 0.3419835, 1, 0, 0.1607843, 1,
1.952228, -0.1649128, 4.359376, 1, 0, 0.1568628, 1,
1.961229, 0.5255505, 0.9641545, 1, 0, 0.1490196, 1,
1.964745, 0.8569815, 1.600059, 1, 0, 0.145098, 1,
1.980211, -0.4853202, 3.315757, 1, 0, 0.1372549, 1,
2.049252, 0.1990304, 1.100932, 1, 0, 0.1333333, 1,
2.068825, 1.429861, 2.323606, 1, 0, 0.1254902, 1,
2.088347, 0.5269039, 0.9443083, 1, 0, 0.1215686, 1,
2.089496, 0.8838961, 1.120795, 1, 0, 0.1137255, 1,
2.09994, -0.5595999, 2.326181, 1, 0, 0.1098039, 1,
2.102649, -1.311192, 2.703514, 1, 0, 0.1019608, 1,
2.106506, 0.6991626, 0.4043145, 1, 0, 0.09411765, 1,
2.190726, 0.7768491, -1.516782, 1, 0, 0.09019608, 1,
2.212891, -0.2897288, 1.78119, 1, 0, 0.08235294, 1,
2.26317, 0.2187388, 2.871444, 1, 0, 0.07843138, 1,
2.274848, -0.8563748, 0.4805078, 1, 0, 0.07058824, 1,
2.309656, 1.645512, 1.180354, 1, 0, 0.06666667, 1,
2.320904, 1.458176, 1.948756, 1, 0, 0.05882353, 1,
2.337038, 0.09117806, 1.825008, 1, 0, 0.05490196, 1,
2.383919, -0.4898358, 1.923513, 1, 0, 0.04705882, 1,
2.430316, 0.4414245, 1.033182, 1, 0, 0.04313726, 1,
2.557127, 0.02049932, 0.7305318, 1, 0, 0.03529412, 1,
2.783782, -1.517769, 2.100072, 1, 0, 0.03137255, 1,
2.848381, -0.1030179, 2.259741, 1, 0, 0.02352941, 1,
2.857789, -0.3293456, 0.6739778, 1, 0, 0.01960784, 1,
3.053926, -1.493486, 3.384363, 1, 0, 0.01176471, 1,
3.096952, -2.599215, 4.214588, 1, 0, 0.007843138, 1
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
-0.4214118, -4.243282, -7.082006, 0, -0.5, 0.5, 0.5,
-0.4214118, -4.243282, -7.082006, 1, -0.5, 0.5, 0.5,
-0.4214118, -4.243282, -7.082006, 1, 1.5, 0.5, 0.5,
-0.4214118, -4.243282, -7.082006, 0, 1.5, 0.5, 0.5
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
-5.132501, -0.0365299, -7.082006, 0, -0.5, 0.5, 0.5,
-5.132501, -0.0365299, -7.082006, 1, -0.5, 0.5, 0.5,
-5.132501, -0.0365299, -7.082006, 1, 1.5, 0.5, 0.5,
-5.132501, -0.0365299, -7.082006, 0, 1.5, 0.5, 0.5
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
-5.132501, -4.243282, 0.1403351, 0, -0.5, 0.5, 0.5,
-5.132501, -4.243282, 0.1403351, 1, -0.5, 0.5, 0.5,
-5.132501, -4.243282, 0.1403351, 1, 1.5, 0.5, 0.5,
-5.132501, -4.243282, 0.1403351, 0, 1.5, 0.5, 0.5
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
-2, -3.272493, -5.415312,
2, -3.272493, -5.415312,
-2, -3.272493, -5.415312,
-2, -3.434291, -5.693094,
0, -3.272493, -5.415312,
0, -3.434291, -5.693094,
2, -3.272493, -5.415312,
2, -3.434291, -5.693094
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
"0",
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
-2, -3.757888, -6.248659, 0, -0.5, 0.5, 0.5,
-2, -3.757888, -6.248659, 1, -0.5, 0.5, 0.5,
-2, -3.757888, -6.248659, 1, 1.5, 0.5, 0.5,
-2, -3.757888, -6.248659, 0, 1.5, 0.5, 0.5,
0, -3.757888, -6.248659, 0, -0.5, 0.5, 0.5,
0, -3.757888, -6.248659, 1, -0.5, 0.5, 0.5,
0, -3.757888, -6.248659, 1, 1.5, 0.5, 0.5,
0, -3.757888, -6.248659, 0, 1.5, 0.5, 0.5,
2, -3.757888, -6.248659, 0, -0.5, 0.5, 0.5,
2, -3.757888, -6.248659, 1, -0.5, 0.5, 0.5,
2, -3.757888, -6.248659, 1, 1.5, 0.5, 0.5,
2, -3.757888, -6.248659, 0, 1.5, 0.5, 0.5
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
-4.045326, -3, -5.415312,
-4.045326, 3, -5.415312,
-4.045326, -3, -5.415312,
-4.226522, -3, -5.693094,
-4.045326, -2, -5.415312,
-4.226522, -2, -5.693094,
-4.045326, -1, -5.415312,
-4.226522, -1, -5.693094,
-4.045326, 0, -5.415312,
-4.226522, 0, -5.693094,
-4.045326, 1, -5.415312,
-4.226522, 1, -5.693094,
-4.045326, 2, -5.415312,
-4.226522, 2, -5.693094,
-4.045326, 3, -5.415312,
-4.226522, 3, -5.693094
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
-4.588913, -3, -6.248659, 0, -0.5, 0.5, 0.5,
-4.588913, -3, -6.248659, 1, -0.5, 0.5, 0.5,
-4.588913, -3, -6.248659, 1, 1.5, 0.5, 0.5,
-4.588913, -3, -6.248659, 0, 1.5, 0.5, 0.5,
-4.588913, -2, -6.248659, 0, -0.5, 0.5, 0.5,
-4.588913, -2, -6.248659, 1, -0.5, 0.5, 0.5,
-4.588913, -2, -6.248659, 1, 1.5, 0.5, 0.5,
-4.588913, -2, -6.248659, 0, 1.5, 0.5, 0.5,
-4.588913, -1, -6.248659, 0, -0.5, 0.5, 0.5,
-4.588913, -1, -6.248659, 1, -0.5, 0.5, 0.5,
-4.588913, -1, -6.248659, 1, 1.5, 0.5, 0.5,
-4.588913, -1, -6.248659, 0, 1.5, 0.5, 0.5,
-4.588913, 0, -6.248659, 0, -0.5, 0.5, 0.5,
-4.588913, 0, -6.248659, 1, -0.5, 0.5, 0.5,
-4.588913, 0, -6.248659, 1, 1.5, 0.5, 0.5,
-4.588913, 0, -6.248659, 0, 1.5, 0.5, 0.5,
-4.588913, 1, -6.248659, 0, -0.5, 0.5, 0.5,
-4.588913, 1, -6.248659, 1, -0.5, 0.5, 0.5,
-4.588913, 1, -6.248659, 1, 1.5, 0.5, 0.5,
-4.588913, 1, -6.248659, 0, 1.5, 0.5, 0.5,
-4.588913, 2, -6.248659, 0, -0.5, 0.5, 0.5,
-4.588913, 2, -6.248659, 1, -0.5, 0.5, 0.5,
-4.588913, 2, -6.248659, 1, 1.5, 0.5, 0.5,
-4.588913, 2, -6.248659, 0, 1.5, 0.5, 0.5,
-4.588913, 3, -6.248659, 0, -0.5, 0.5, 0.5,
-4.588913, 3, -6.248659, 1, -0.5, 0.5, 0.5,
-4.588913, 3, -6.248659, 1, 1.5, 0.5, 0.5,
-4.588913, 3, -6.248659, 0, 1.5, 0.5, 0.5
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
-4.045326, -3.272493, -4,
-4.045326, -3.272493, 4,
-4.045326, -3.272493, -4,
-4.226522, -3.434291, -4,
-4.045326, -3.272493, -2,
-4.226522, -3.434291, -2,
-4.045326, -3.272493, 0,
-4.226522, -3.434291, 0,
-4.045326, -3.272493, 2,
-4.226522, -3.434291, 2,
-4.045326, -3.272493, 4,
-4.226522, -3.434291, 4
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
-4.588913, -3.757888, -4, 0, -0.5, 0.5, 0.5,
-4.588913, -3.757888, -4, 1, -0.5, 0.5, 0.5,
-4.588913, -3.757888, -4, 1, 1.5, 0.5, 0.5,
-4.588913, -3.757888, -4, 0, 1.5, 0.5, 0.5,
-4.588913, -3.757888, -2, 0, -0.5, 0.5, 0.5,
-4.588913, -3.757888, -2, 1, -0.5, 0.5, 0.5,
-4.588913, -3.757888, -2, 1, 1.5, 0.5, 0.5,
-4.588913, -3.757888, -2, 0, 1.5, 0.5, 0.5,
-4.588913, -3.757888, 0, 0, -0.5, 0.5, 0.5,
-4.588913, -3.757888, 0, 1, -0.5, 0.5, 0.5,
-4.588913, -3.757888, 0, 1, 1.5, 0.5, 0.5,
-4.588913, -3.757888, 0, 0, 1.5, 0.5, 0.5,
-4.588913, -3.757888, 2, 0, -0.5, 0.5, 0.5,
-4.588913, -3.757888, 2, 1, -0.5, 0.5, 0.5,
-4.588913, -3.757888, 2, 1, 1.5, 0.5, 0.5,
-4.588913, -3.757888, 2, 0, 1.5, 0.5, 0.5,
-4.588913, -3.757888, 4, 0, -0.5, 0.5, 0.5,
-4.588913, -3.757888, 4, 1, -0.5, 0.5, 0.5,
-4.588913, -3.757888, 4, 1, 1.5, 0.5, 0.5,
-4.588913, -3.757888, 4, 0, 1.5, 0.5, 0.5
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
-4.045326, -3.272493, -5.415312,
-4.045326, 3.199433, -5.415312,
-4.045326, -3.272493, 5.695982,
-4.045326, 3.199433, 5.695982,
-4.045326, -3.272493, -5.415312,
-4.045326, -3.272493, 5.695982,
-4.045326, 3.199433, -5.415312,
-4.045326, 3.199433, 5.695982,
-4.045326, -3.272493, -5.415312,
3.202503, -3.272493, -5.415312,
-4.045326, -3.272493, 5.695982,
3.202503, -3.272493, 5.695982,
-4.045326, 3.199433, -5.415312,
3.202503, 3.199433, -5.415312,
-4.045326, 3.199433, 5.695982,
3.202503, 3.199433, 5.695982,
3.202503, -3.272493, -5.415312,
3.202503, 3.199433, -5.415312,
3.202503, -3.272493, 5.695982,
3.202503, 3.199433, 5.695982,
3.202503, -3.272493, -5.415312,
3.202503, -3.272493, 5.695982,
3.202503, 3.199433, -5.415312,
3.202503, 3.199433, 5.695982
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
var radius = 7.881917;
var distance = 35.06754;
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
mvMatrix.translate( 0.4214118, 0.0365299, -0.1403351 );
mvMatrix.scale( 1.175812, 1.316777, 0.7669749 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.06754);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


