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
-2.915078, 1.367282, -0.3462255, 1, 0, 0, 1,
-2.874227, 0.7346631, -1.109755, 1, 0.007843138, 0, 1,
-2.695911, -0.536588, -3.380771, 1, 0.01176471, 0, 1,
-2.684552, -0.2997312, -0.6197582, 1, 0.01960784, 0, 1,
-2.653153, -0.2377533, -1.423841, 1, 0.02352941, 0, 1,
-2.493442, -0.3966227, -1.461798, 1, 0.03137255, 0, 1,
-2.421443, 0.08814507, -1.714564, 1, 0.03529412, 0, 1,
-2.409033, -1.042697, -2.475132, 1, 0.04313726, 0, 1,
-2.397376, -0.1665219, -2.593129, 1, 0.04705882, 0, 1,
-2.340641, -0.08327585, -1.044043, 1, 0.05490196, 0, 1,
-2.242219, -0.89384, -2.404594, 1, 0.05882353, 0, 1,
-2.240327, -0.3959063, -1.663369, 1, 0.06666667, 0, 1,
-2.239565, 1.453359, 0.7910858, 1, 0.07058824, 0, 1,
-2.224437, -0.7873428, -0.1915085, 1, 0.07843138, 0, 1,
-2.200462, -1.027333, -0.3855394, 1, 0.08235294, 0, 1,
-2.194462, 0.8119779, 0.8470487, 1, 0.09019608, 0, 1,
-2.185194, -1.142782, -0.8671597, 1, 0.09411765, 0, 1,
-2.180439, -0.7752668, -1.921669, 1, 0.1019608, 0, 1,
-2.082493, 1.148059, -1.118729, 1, 0.1098039, 0, 1,
-2.047101, 0.7113393, -1.449619, 1, 0.1137255, 0, 1,
-2.036311, 0.9807724, -0.1931647, 1, 0.1215686, 0, 1,
-1.98954, 0.4090723, -0.6264865, 1, 0.1254902, 0, 1,
-1.946252, 0.9694626, -0.8771181, 1, 0.1333333, 0, 1,
-1.943792, 1.039172, -1.127801, 1, 0.1372549, 0, 1,
-1.943705, -2.029762, -3.374956, 1, 0.145098, 0, 1,
-1.928005, 1.241449, -2.783401, 1, 0.1490196, 0, 1,
-1.927709, -0.5834276, -0.7085294, 1, 0.1568628, 0, 1,
-1.919427, 1.667587, -0.569293, 1, 0.1607843, 0, 1,
-1.873959, 0.2272038, -1.733412, 1, 0.1686275, 0, 1,
-1.862738, 0.04617704, 0.2545179, 1, 0.172549, 0, 1,
-1.854279, -0.2801764, -2.428914, 1, 0.1803922, 0, 1,
-1.848977, 0.552045, -0.3661321, 1, 0.1843137, 0, 1,
-1.837186, -0.01782516, -0.8293591, 1, 0.1921569, 0, 1,
-1.810072, 0.6978724, -0.4018661, 1, 0.1960784, 0, 1,
-1.803914, 0.5413126, -1.075865, 1, 0.2039216, 0, 1,
-1.803436, 0.1602712, -0.6789129, 1, 0.2117647, 0, 1,
-1.798563, 0.3347408, -1.385393, 1, 0.2156863, 0, 1,
-1.770865, 1.05323, -0.4574192, 1, 0.2235294, 0, 1,
-1.757478, 1.963457, -0.1537566, 1, 0.227451, 0, 1,
-1.753654, 0.2426141, -2.091866, 1, 0.2352941, 0, 1,
-1.751143, 0.9416125, -0.5936135, 1, 0.2392157, 0, 1,
-1.744429, 0.08548337, -0.4782306, 1, 0.2470588, 0, 1,
-1.742186, 1.604223, -2.246917, 1, 0.2509804, 0, 1,
-1.713771, 0.8158978, -1.618024, 1, 0.2588235, 0, 1,
-1.701079, 1.928786, 0.4253848, 1, 0.2627451, 0, 1,
-1.694878, -0.6917658, -2.320312, 1, 0.2705882, 0, 1,
-1.689418, 0.1462159, -2.34937, 1, 0.2745098, 0, 1,
-1.675425, -0.7532457, -2.522087, 1, 0.282353, 0, 1,
-1.671706, 0.7766917, -1.099065, 1, 0.2862745, 0, 1,
-1.667353, -1.11262, -1.132697, 1, 0.2941177, 0, 1,
-1.666509, -1.085794, -2.158793, 1, 0.3019608, 0, 1,
-1.64746, 0.7544098, -1.168451, 1, 0.3058824, 0, 1,
-1.635794, 0.4214958, -1.244568, 1, 0.3137255, 0, 1,
-1.621329, -0.4795643, -1.254216, 1, 0.3176471, 0, 1,
-1.617777, 0.4353561, -2.589039, 1, 0.3254902, 0, 1,
-1.611759, 0.3982589, -1.226007, 1, 0.3294118, 0, 1,
-1.60836, 0.6979391, -1.568349, 1, 0.3372549, 0, 1,
-1.607597, 0.0009930803, -1.511651, 1, 0.3411765, 0, 1,
-1.603988, 0.7641335, -1.772665, 1, 0.3490196, 0, 1,
-1.592738, -0.18858, -3.05955, 1, 0.3529412, 0, 1,
-1.576467, -0.1874356, -2.875707, 1, 0.3607843, 0, 1,
-1.566, -1.481883, -2.875578, 1, 0.3647059, 0, 1,
-1.560044, 0.4823779, -1.967028, 1, 0.372549, 0, 1,
-1.557005, 0.3302828, -0.7371924, 1, 0.3764706, 0, 1,
-1.547278, -0.6704559, -1.268255, 1, 0.3843137, 0, 1,
-1.535641, -0.3465956, -2.358332, 1, 0.3882353, 0, 1,
-1.528977, 2.905825, 0.7661332, 1, 0.3960784, 0, 1,
-1.509867, 2.830472, -0.3728296, 1, 0.4039216, 0, 1,
-1.505575, 0.6610424, -3.227902, 1, 0.4078431, 0, 1,
-1.497922, 2.658264, 0.8966047, 1, 0.4156863, 0, 1,
-1.476573, -0.378502, -2.640083, 1, 0.4196078, 0, 1,
-1.464506, -0.04067951, -2.197172, 1, 0.427451, 0, 1,
-1.453238, 1.207098, 0.6152503, 1, 0.4313726, 0, 1,
-1.451085, -0.3726947, -3.035648, 1, 0.4392157, 0, 1,
-1.448136, -1.063121, -2.695351, 1, 0.4431373, 0, 1,
-1.447774, -1.210387, -2.529748, 1, 0.4509804, 0, 1,
-1.435272, -1.563633, -3.280248, 1, 0.454902, 0, 1,
-1.42889, 0.7307311, -0.8716213, 1, 0.4627451, 0, 1,
-1.422396, -1.281376, -0.9605789, 1, 0.4666667, 0, 1,
-1.421883, -0.4888343, -1.456709, 1, 0.4745098, 0, 1,
-1.420722, 1.47278, -1.316923, 1, 0.4784314, 0, 1,
-1.418659, 1.280551, -0.4580469, 1, 0.4862745, 0, 1,
-1.406305, 1.105496, -0.02115415, 1, 0.4901961, 0, 1,
-1.396854, 1.871846, 1.266416, 1, 0.4980392, 0, 1,
-1.389434, 1.247484, -1.404018, 1, 0.5058824, 0, 1,
-1.386311, 0.265917, -0.8789265, 1, 0.509804, 0, 1,
-1.379349, 0.1631481, -1.717844, 1, 0.5176471, 0, 1,
-1.377329, -0.6469296, -2.021864, 1, 0.5215687, 0, 1,
-1.369629, -0.7057105, -2.397534, 1, 0.5294118, 0, 1,
-1.360181, -1.180242, -4.192933, 1, 0.5333334, 0, 1,
-1.357155, -0.06182611, -0.3980661, 1, 0.5411765, 0, 1,
-1.344055, 1.729902, -0.8972018, 1, 0.5450981, 0, 1,
-1.335907, 0.2112094, -1.739095, 1, 0.5529412, 0, 1,
-1.33516, 0.03354804, -0.4957262, 1, 0.5568628, 0, 1,
-1.334238, -0.4671145, -2.654249, 1, 0.5647059, 0, 1,
-1.329857, 1.304127, -0.5186315, 1, 0.5686275, 0, 1,
-1.326738, -1.040062, -1.693644, 1, 0.5764706, 0, 1,
-1.320171, 0.04895129, -0.3970865, 1, 0.5803922, 0, 1,
-1.319396, -0.7265477, -2.327352, 1, 0.5882353, 0, 1,
-1.317863, -0.7846194, -3.819217, 1, 0.5921569, 0, 1,
-1.314697, 0.6691536, -0.8615892, 1, 0.6, 0, 1,
-1.30997, 1.916349, -2.428232, 1, 0.6078432, 0, 1,
-1.308588, -2.282899, -1.261971, 1, 0.6117647, 0, 1,
-1.297861, 0.5495016, 0.0398244, 1, 0.6196079, 0, 1,
-1.266025, -0.9799833, -3.061, 1, 0.6235294, 0, 1,
-1.26522, 1.136832, -1.748472, 1, 0.6313726, 0, 1,
-1.252027, 0.5876651, -2.079288, 1, 0.6352941, 0, 1,
-1.249663, -1.540455, -1.53861, 1, 0.6431373, 0, 1,
-1.239062, 0.2152893, -2.012849, 1, 0.6470588, 0, 1,
-1.232773, 0.4363748, -0.8062814, 1, 0.654902, 0, 1,
-1.223061, 0.3607826, -1.196185, 1, 0.6588235, 0, 1,
-1.220426, -1.782716, -2.040011, 1, 0.6666667, 0, 1,
-1.220249, 1.23521, 0.1426913, 1, 0.6705883, 0, 1,
-1.217917, -1.952513, -1.537512, 1, 0.6784314, 0, 1,
-1.204097, -0.007806059, -3.11307, 1, 0.682353, 0, 1,
-1.201637, 1.945103, 0.9830978, 1, 0.6901961, 0, 1,
-1.198562, -1.365148, -2.354979, 1, 0.6941177, 0, 1,
-1.196281, 0.598784, -2.028301, 1, 0.7019608, 0, 1,
-1.186038, -0.7863775, -2.023305, 1, 0.7098039, 0, 1,
-1.178584, -0.9141584, -3.353516, 1, 0.7137255, 0, 1,
-1.178578, 0.7410377, -1.740007, 1, 0.7215686, 0, 1,
-1.172106, 0.0676866, -0.5470144, 1, 0.7254902, 0, 1,
-1.169448, 0.9220505, -0.6180081, 1, 0.7333333, 0, 1,
-1.169222, -0.3408693, -1.79273, 1, 0.7372549, 0, 1,
-1.168398, 1.038324, -1.645235, 1, 0.7450981, 0, 1,
-1.167919, 1.549981, -1.639607, 1, 0.7490196, 0, 1,
-1.163859, 0.6704699, 0.4092717, 1, 0.7568628, 0, 1,
-1.161934, 1.098258, -1.67269, 1, 0.7607843, 0, 1,
-1.153938, 0.4506058, -2.947361, 1, 0.7686275, 0, 1,
-1.148323, 0.7781128, -1.022644, 1, 0.772549, 0, 1,
-1.148156, -0.6208457, -2.936611, 1, 0.7803922, 0, 1,
-1.140186, 0.7807208, -1.680051, 1, 0.7843137, 0, 1,
-1.135257, 0.9809225, -0.8821266, 1, 0.7921569, 0, 1,
-1.135183, -1.548259, -2.793381, 1, 0.7960784, 0, 1,
-1.134176, 0.2665717, -1.076002, 1, 0.8039216, 0, 1,
-1.132277, -1.27192, -1.141203, 1, 0.8117647, 0, 1,
-1.127378, -1.43951, -1.317905, 1, 0.8156863, 0, 1,
-1.120101, -1.713123, -2.535245, 1, 0.8235294, 0, 1,
-1.115771, 0.3506226, -1.46272, 1, 0.827451, 0, 1,
-1.113278, 0.8813311, -2.120426, 1, 0.8352941, 0, 1,
-1.107877, -0.7218502, -1.42808, 1, 0.8392157, 0, 1,
-1.1044, -0.4517727, -2.169094, 1, 0.8470588, 0, 1,
-1.100569, 0.1943542, -2.456234, 1, 0.8509804, 0, 1,
-1.099673, -1.254156, -3.088495, 1, 0.8588235, 0, 1,
-1.090843, 0.06433652, -1.222553, 1, 0.8627451, 0, 1,
-1.0862, -0.08680286, -0.9189972, 1, 0.8705882, 0, 1,
-1.083569, -0.9563534, -1.440247, 1, 0.8745098, 0, 1,
-1.072085, 0.7111474, -0.9315529, 1, 0.8823529, 0, 1,
-1.06428, -0.921046, -1.366764, 1, 0.8862745, 0, 1,
-1.061684, -0.730074, -3.000029, 1, 0.8941177, 0, 1,
-1.058039, -0.08996601, -0.8210233, 1, 0.8980392, 0, 1,
-1.050301, -0.2871058, -0.7006, 1, 0.9058824, 0, 1,
-1.047789, -1.846216, -2.446234, 1, 0.9137255, 0, 1,
-1.04323, 1.536512, 0.3397115, 1, 0.9176471, 0, 1,
-1.042482, -0.5651218, -2.952153, 1, 0.9254902, 0, 1,
-1.042115, 0.5081236, -2.99021, 1, 0.9294118, 0, 1,
-1.040248, 0.3023916, -1.374115, 1, 0.9372549, 0, 1,
-1.026674, 0.4388701, -0.9459128, 1, 0.9411765, 0, 1,
-1.011389, 0.4292817, -1.450532, 1, 0.9490196, 0, 1,
-1.010962, -0.1230031, -1.892453, 1, 0.9529412, 0, 1,
-1.008223, -0.4482927, -3.619678, 1, 0.9607843, 0, 1,
-1.005997, -0.3727022, -1.144985, 1, 0.9647059, 0, 1,
-1.004972, 0.9852497, 0.6037334, 1, 0.972549, 0, 1,
-1.004, 0.1644883, -1.543004, 1, 0.9764706, 0, 1,
-1.000415, 0.4622124, -4.064681, 1, 0.9843137, 0, 1,
-0.9997917, 1.451399, 0.3294288, 1, 0.9882353, 0, 1,
-0.9937449, -1.35357, -1.966041, 1, 0.9960784, 0, 1,
-0.9898944, -2.433535, -0.2817936, 0.9960784, 1, 0, 1,
-0.9886272, -0.7563205, -4.940826, 0.9921569, 1, 0, 1,
-0.9868494, 1.716191, -0.05367566, 0.9843137, 1, 0, 1,
-0.985499, 0.8174186, -0.4109697, 0.9803922, 1, 0, 1,
-0.9837024, 0.7998625, -0.4139378, 0.972549, 1, 0, 1,
-0.9792693, 0.5264088, -1.015909, 0.9686275, 1, 0, 1,
-0.9769869, -0.02348112, -1.737431, 0.9607843, 1, 0, 1,
-0.9760326, -2.308157, -4.397364, 0.9568627, 1, 0, 1,
-0.9725628, 0.9861176, -0.8937395, 0.9490196, 1, 0, 1,
-0.9699609, 0.7159009, -0.6502063, 0.945098, 1, 0, 1,
-0.9679374, -0.6793987, -2.935046, 0.9372549, 1, 0, 1,
-0.9613417, -0.4864686, -2.417369, 0.9333333, 1, 0, 1,
-0.9590044, 2.291698, 0.0422205, 0.9254902, 1, 0, 1,
-0.9445086, -1.343798, -2.459526, 0.9215686, 1, 0, 1,
-0.9437113, 1.143526, -1.322121, 0.9137255, 1, 0, 1,
-0.9414579, 0.3780273, -1.278716, 0.9098039, 1, 0, 1,
-0.9407654, -0.7608704, -1.136174, 0.9019608, 1, 0, 1,
-0.9355981, -1.172259, -3.64444, 0.8941177, 1, 0, 1,
-0.9237294, -2.552806, -3.37067, 0.8901961, 1, 0, 1,
-0.9229236, -0.6573693, -2.595645, 0.8823529, 1, 0, 1,
-0.9172813, -0.7917283, -1.998756, 0.8784314, 1, 0, 1,
-0.9165843, -0.1750011, -1.869672, 0.8705882, 1, 0, 1,
-0.9155842, 0.4233167, -1.240815, 0.8666667, 1, 0, 1,
-0.9071499, -0.4535261, -1.266029, 0.8588235, 1, 0, 1,
-0.9038101, 0.5736735, 0.3010572, 0.854902, 1, 0, 1,
-0.9024493, 1.167517, -0.5269921, 0.8470588, 1, 0, 1,
-0.8977419, -0.5908909, -1.795505, 0.8431373, 1, 0, 1,
-0.891565, -0.4107181, -1.586172, 0.8352941, 1, 0, 1,
-0.8902144, 0.6880365, -1.529182, 0.8313726, 1, 0, 1,
-0.886416, -0.05937471, -1.960182, 0.8235294, 1, 0, 1,
-0.8847571, -1.026962, -2.700891, 0.8196079, 1, 0, 1,
-0.8846708, 1.70456, -0.331317, 0.8117647, 1, 0, 1,
-0.8837029, 0.4609348, -2.426237, 0.8078431, 1, 0, 1,
-0.8787721, 0.1832362, -3.088432, 0.8, 1, 0, 1,
-0.8760771, -0.9688875, -1.882176, 0.7921569, 1, 0, 1,
-0.8716309, 0.6070513, -0.377808, 0.7882353, 1, 0, 1,
-0.8714786, -0.6977724, -0.6234447, 0.7803922, 1, 0, 1,
-0.8714032, 0.1439183, -0.6278341, 0.7764706, 1, 0, 1,
-0.8691666, 0.06214688, -1.141746, 0.7686275, 1, 0, 1,
-0.8651192, 0.08451615, -1.351509, 0.7647059, 1, 0, 1,
-0.8647604, 0.4738725, -1.731354, 0.7568628, 1, 0, 1,
-0.8625131, 0.1402865, 0.2926837, 0.7529412, 1, 0, 1,
-0.8518407, 0.6039608, -2.399791, 0.7450981, 1, 0, 1,
-0.8452441, 0.7834895, -1.008506, 0.7411765, 1, 0, 1,
-0.8444766, 1.828709, 0.08126387, 0.7333333, 1, 0, 1,
-0.840695, -1.15543, -3.461959, 0.7294118, 1, 0, 1,
-0.8344278, 0.3688332, -1.056623, 0.7215686, 1, 0, 1,
-0.8307774, -1.895995, -1.890133, 0.7176471, 1, 0, 1,
-0.8294964, 0.2071761, -0.1461793, 0.7098039, 1, 0, 1,
-0.8227338, -0.1528176, -4.283481, 0.7058824, 1, 0, 1,
-0.8196722, -1.227313, -2.41171, 0.6980392, 1, 0, 1,
-0.8176771, -0.1477718, -2.057438, 0.6901961, 1, 0, 1,
-0.8125892, 0.487809, -1.048916, 0.6862745, 1, 0, 1,
-0.8115884, 1.556151, -0.1715125, 0.6784314, 1, 0, 1,
-0.8005212, 0.9573081, -1.323002, 0.6745098, 1, 0, 1,
-0.7985823, -0.1792577, 0.1079329, 0.6666667, 1, 0, 1,
-0.7972823, -0.3642141, -2.335433, 0.6627451, 1, 0, 1,
-0.7954708, 0.3480246, -2.457578, 0.654902, 1, 0, 1,
-0.795358, 0.1065024, -2.673018, 0.6509804, 1, 0, 1,
-0.7949574, -1.380164, -1.752102, 0.6431373, 1, 0, 1,
-0.7914587, 1.01449, 1.273024, 0.6392157, 1, 0, 1,
-0.7911645, 0.9458997, -1.527504, 0.6313726, 1, 0, 1,
-0.7861534, 0.5392252, -2.520987, 0.627451, 1, 0, 1,
-0.7805013, -0.1847274, -0.6980078, 0.6196079, 1, 0, 1,
-0.7804654, -0.4331866, -2.332879, 0.6156863, 1, 0, 1,
-0.7754566, 0.6896055, 2.112143, 0.6078432, 1, 0, 1,
-0.7711084, -1.194886, -1.419454, 0.6039216, 1, 0, 1,
-0.770878, -0.2003232, -1.541917, 0.5960785, 1, 0, 1,
-0.7688732, 0.0519063, -1.638505, 0.5882353, 1, 0, 1,
-0.7642981, 0.2220488, 0.2413708, 0.5843138, 1, 0, 1,
-0.7449202, -0.4756064, -0.3463508, 0.5764706, 1, 0, 1,
-0.7301929, -2.329934, -2.202902, 0.572549, 1, 0, 1,
-0.7270302, 0.1979621, -2.013212, 0.5647059, 1, 0, 1,
-0.7267582, -0.6376204, -1.258443, 0.5607843, 1, 0, 1,
-0.7249849, -1.866291, -2.401206, 0.5529412, 1, 0, 1,
-0.7243947, 0.4220817, -2.832114, 0.5490196, 1, 0, 1,
-0.7187943, -0.6894673, -3.715056, 0.5411765, 1, 0, 1,
-0.7083426, 0.1802532, -0.545712, 0.5372549, 1, 0, 1,
-0.7078905, -0.427753, -1.100103, 0.5294118, 1, 0, 1,
-0.706898, -0.8995903, -2.152007, 0.5254902, 1, 0, 1,
-0.7063685, 0.17826, -0.4578956, 0.5176471, 1, 0, 1,
-0.7056971, 0.94662, -1.725347, 0.5137255, 1, 0, 1,
-0.7005, 0.7647666, 1.084113, 0.5058824, 1, 0, 1,
-0.6960143, -1.063797, -3.47066, 0.5019608, 1, 0, 1,
-0.6935238, 0.03924846, -0.2222701, 0.4941176, 1, 0, 1,
-0.68997, -0.7018229, -2.535729, 0.4862745, 1, 0, 1,
-0.6844329, -0.5094129, -1.829375, 0.4823529, 1, 0, 1,
-0.6822411, -1.902452, -2.638412, 0.4745098, 1, 0, 1,
-0.6803972, 0.06885417, -1.564049, 0.4705882, 1, 0, 1,
-0.6673207, -0.2905759, -1.121356, 0.4627451, 1, 0, 1,
-0.6647478, -1.169415, -2.235144, 0.4588235, 1, 0, 1,
-0.6637415, -1.113779, -3.066037, 0.4509804, 1, 0, 1,
-0.6628792, -1.272533, -1.972139, 0.4470588, 1, 0, 1,
-0.6624243, 0.7896276, 0.08249379, 0.4392157, 1, 0, 1,
-0.6609589, 0.4519331, -0.343742, 0.4352941, 1, 0, 1,
-0.6605123, -0.08294177, -1.037618, 0.427451, 1, 0, 1,
-0.6594157, -1.205876, -1.836775, 0.4235294, 1, 0, 1,
-0.6560627, 0.2958579, -1.190899, 0.4156863, 1, 0, 1,
-0.647611, 0.4819762, -0.3917629, 0.4117647, 1, 0, 1,
-0.6464819, -1.643999, -3.994703, 0.4039216, 1, 0, 1,
-0.6421369, 1.557226, -0.6380913, 0.3960784, 1, 0, 1,
-0.6401038, -0.000166079, -2.219894, 0.3921569, 1, 0, 1,
-0.6376837, -1.309562, -1.064142, 0.3843137, 1, 0, 1,
-0.6361382, 0.8832235, -0.4611671, 0.3803922, 1, 0, 1,
-0.6282339, 0.3034096, -0.6663252, 0.372549, 1, 0, 1,
-0.6271024, -0.5570163, -2.43002, 0.3686275, 1, 0, 1,
-0.6244186, 0.5185326, 0.6098557, 0.3607843, 1, 0, 1,
-0.61862, -2.332979, -4.747493, 0.3568628, 1, 0, 1,
-0.6156933, 0.2641538, -0.787823, 0.3490196, 1, 0, 1,
-0.615491, 0.6859692, 2.345926, 0.345098, 1, 0, 1,
-0.613472, -0.7262153, -2.371197, 0.3372549, 1, 0, 1,
-0.6123257, 0.2129733, -2.607336, 0.3333333, 1, 0, 1,
-0.6116704, -1.139523, -1.856552, 0.3254902, 1, 0, 1,
-0.6082513, -0.3225769, -2.654209, 0.3215686, 1, 0, 1,
-0.6070772, -1.005125, -2.021293, 0.3137255, 1, 0, 1,
-0.6012574, -1.537129, -2.864872, 0.3098039, 1, 0, 1,
-0.5995451, 0.1576619, 0.3836749, 0.3019608, 1, 0, 1,
-0.5980919, 0.2888373, -0.87901, 0.2941177, 1, 0, 1,
-0.591591, 0.4486603, 0.5728942, 0.2901961, 1, 0, 1,
-0.5903361, -0.04434724, -0.1154941, 0.282353, 1, 0, 1,
-0.5897714, 1.181795, -0.1209568, 0.2784314, 1, 0, 1,
-0.5874243, -1.050495, -4.210001, 0.2705882, 1, 0, 1,
-0.5829892, 1.56005, -0.3755009, 0.2666667, 1, 0, 1,
-0.5735693, 0.3538654, 0.3149289, 0.2588235, 1, 0, 1,
-0.5679842, 0.1603104, 0.7184307, 0.254902, 1, 0, 1,
-0.5581993, 0.9133046, -1.856375, 0.2470588, 1, 0, 1,
-0.5570958, -1.404325, -5.304108, 0.2431373, 1, 0, 1,
-0.5493268, -0.7883541, -1.571275, 0.2352941, 1, 0, 1,
-0.5477197, -1.117256, -4.067271, 0.2313726, 1, 0, 1,
-0.5461494, 0.7791793, -0.02512019, 0.2235294, 1, 0, 1,
-0.542663, -0.3919223, -2.363936, 0.2196078, 1, 0, 1,
-0.5426083, 0.2628728, -0.1413063, 0.2117647, 1, 0, 1,
-0.5420293, -0.1169923, -1.875456, 0.2078431, 1, 0, 1,
-0.5401019, -0.8290834, -3.355756, 0.2, 1, 0, 1,
-0.5390477, 1.722185, -1.053214, 0.1921569, 1, 0, 1,
-0.5353524, 1.205847, 0.218324, 0.1882353, 1, 0, 1,
-0.5342816, -0.06099455, -2.761412, 0.1803922, 1, 0, 1,
-0.5341106, 0.5362321, -2.329434, 0.1764706, 1, 0, 1,
-0.5332357, 0.6108446, -1.166082, 0.1686275, 1, 0, 1,
-0.5327924, -0.1516597, -1.689911, 0.1647059, 1, 0, 1,
-0.5301903, -0.62086, -2.511042, 0.1568628, 1, 0, 1,
-0.5298728, -1.026777, -2.79142, 0.1529412, 1, 0, 1,
-0.5289348, 0.4088728, 1.012673, 0.145098, 1, 0, 1,
-0.5256338, 1.278621, 0.09126328, 0.1411765, 1, 0, 1,
-0.5242165, -1.491972, -2.943622, 0.1333333, 1, 0, 1,
-0.5208024, 1.822431, -1.140215, 0.1294118, 1, 0, 1,
-0.5164691, -0.04941949, -1.547551, 0.1215686, 1, 0, 1,
-0.5132418, 0.8010449, -2.548418, 0.1176471, 1, 0, 1,
-0.5094243, -0.7231642, -2.57075, 0.1098039, 1, 0, 1,
-0.508505, -0.3855581, -2.580991, 0.1058824, 1, 0, 1,
-0.507864, 1.050814, 0.02615816, 0.09803922, 1, 0, 1,
-0.5052418, 2.337085, -0.455849, 0.09019608, 1, 0, 1,
-0.503883, -0.2999058, -1.9656, 0.08627451, 1, 0, 1,
-0.5035373, -1.798223, -3.276805, 0.07843138, 1, 0, 1,
-0.5023596, -0.09931599, -1.884161, 0.07450981, 1, 0, 1,
-0.4971873, 0.9406462, 0.3954907, 0.06666667, 1, 0, 1,
-0.4899132, -0.02948307, 0.09055452, 0.0627451, 1, 0, 1,
-0.4768012, -0.2922457, -2.618678, 0.05490196, 1, 0, 1,
-0.4726918, 2.302523, -0.3107599, 0.05098039, 1, 0, 1,
-0.4726167, -0.564625, -2.408185, 0.04313726, 1, 0, 1,
-0.4703641, -0.3857853, -3.560742, 0.03921569, 1, 0, 1,
-0.4679125, -0.3363694, -1.056875, 0.03137255, 1, 0, 1,
-0.4657224, -1.192404, -4.299488, 0.02745098, 1, 0, 1,
-0.4653813, 1.560459, -0.4942847, 0.01960784, 1, 0, 1,
-0.4638973, -0.7607853, -3.649378, 0.01568628, 1, 0, 1,
-0.4555811, -0.5989729, -3.105775, 0.007843138, 1, 0, 1,
-0.454325, 0.5760689, -1.644495, 0.003921569, 1, 0, 1,
-0.4523964, -1.559877, -3.472917, 0, 1, 0.003921569, 1,
-0.4502016, -0.04047196, -1.04027, 0, 1, 0.01176471, 1,
-0.4461528, -1.332088, -4.072612, 0, 1, 0.01568628, 1,
-0.4461235, -1.054113, -3.459819, 0, 1, 0.02352941, 1,
-0.44384, 0.5234388, 2.134849, 0, 1, 0.02745098, 1,
-0.4434572, -0.3775051, -3.542557, 0, 1, 0.03529412, 1,
-0.4422226, 0.1415851, -1.228759, 0, 1, 0.03921569, 1,
-0.4351886, -0.6225581, -4.012632, 0, 1, 0.04705882, 1,
-0.4347596, -0.2656395, -0.9947148, 0, 1, 0.05098039, 1,
-0.4346683, 0.02026077, 0.2127778, 0, 1, 0.05882353, 1,
-0.4124051, -0.396685, -2.244086, 0, 1, 0.0627451, 1,
-0.4123937, -1.247838, -3.852388, 0, 1, 0.07058824, 1,
-0.408299, -1.544564, -2.068037, 0, 1, 0.07450981, 1,
-0.3936803, 0.4154598, -0.3275586, 0, 1, 0.08235294, 1,
-0.3935945, -1.327237, -1.701827, 0, 1, 0.08627451, 1,
-0.387899, -1.131571, -1.826214, 0, 1, 0.09411765, 1,
-0.3845365, -0.619646, -3.620017, 0, 1, 0.1019608, 1,
-0.3825333, -1.05855, -1.784793, 0, 1, 0.1058824, 1,
-0.3807091, 0.8664028, -0.2876474, 0, 1, 0.1137255, 1,
-0.3805977, -0.2043847, -0.8477119, 0, 1, 0.1176471, 1,
-0.3795668, 0.04482886, -0.1827172, 0, 1, 0.1254902, 1,
-0.3776447, -0.005696115, -0.9203694, 0, 1, 0.1294118, 1,
-0.3702667, -0.5368178, -2.316861, 0, 1, 0.1372549, 1,
-0.3663812, 1.424557, -1.294148, 0, 1, 0.1411765, 1,
-0.3655244, 1.572697, -0.1038577, 0, 1, 0.1490196, 1,
-0.3546872, 0.7725591, -0.04224736, 0, 1, 0.1529412, 1,
-0.3524194, -0.213105, -0.9701461, 0, 1, 0.1607843, 1,
-0.3511383, -1.156743, -3.631845, 0, 1, 0.1647059, 1,
-0.3498484, 0.9790262, 0.0548857, 0, 1, 0.172549, 1,
-0.3461677, 0.1066778, -1.566492, 0, 1, 0.1764706, 1,
-0.3410978, 1.50072, -0.9330185, 0, 1, 0.1843137, 1,
-0.3375256, -0.0102354, -1.780178, 0, 1, 0.1882353, 1,
-0.3367221, 0.8191786, -0.5030106, 0, 1, 0.1960784, 1,
-0.3351744, -1.559755, -3.469104, 0, 1, 0.2039216, 1,
-0.3338106, -0.3413152, -1.746168, 0, 1, 0.2078431, 1,
-0.3319983, 0.201393, -3.542932, 0, 1, 0.2156863, 1,
-0.3316661, 0.512867, 1.100797, 0, 1, 0.2196078, 1,
-0.3298804, 1.005884, -0.8906605, 0, 1, 0.227451, 1,
-0.3298229, -1.091305, -2.99047, 0, 1, 0.2313726, 1,
-0.3294034, -0.2077584, -1.987157, 0, 1, 0.2392157, 1,
-0.3261233, 1.56574, -0.4402051, 0, 1, 0.2431373, 1,
-0.3250154, -0.037535, -3.040014, 0, 1, 0.2509804, 1,
-0.3219824, -0.731749, -3.473575, 0, 1, 0.254902, 1,
-0.3176865, -1.000055, -3.305874, 0, 1, 0.2627451, 1,
-0.3159601, 0.3619861, -0.7966439, 0, 1, 0.2666667, 1,
-0.3141184, -0.584688, -2.697011, 0, 1, 0.2745098, 1,
-0.3073241, -1.492569, -0.9700261, 0, 1, 0.2784314, 1,
-0.3049303, -0.4128832, -4.813154, 0, 1, 0.2862745, 1,
-0.2984196, 1.224766, 0.9696209, 0, 1, 0.2901961, 1,
-0.2941856, -0.4630513, -2.779058, 0, 1, 0.2980392, 1,
-0.2912503, 0.6111214, 0.1821628, 0, 1, 0.3058824, 1,
-0.2870831, -0.6841518, -4.480341, 0, 1, 0.3098039, 1,
-0.2756613, -1.642963, -2.91151, 0, 1, 0.3176471, 1,
-0.2750502, 0.2310525, -0.8626553, 0, 1, 0.3215686, 1,
-0.2743548, 0.2561716, -1.236927, 0, 1, 0.3294118, 1,
-0.2719079, 0.9953999, -1.572537, 0, 1, 0.3333333, 1,
-0.269985, 0.882211, 0.9543769, 0, 1, 0.3411765, 1,
-0.266351, -0.454275, -3.598735, 0, 1, 0.345098, 1,
-0.2649785, -0.7477133, -2.454159, 0, 1, 0.3529412, 1,
-0.2630119, 0.6849398, -0.4306872, 0, 1, 0.3568628, 1,
-0.2609819, 0.7179013, -1.778872, 0, 1, 0.3647059, 1,
-0.2603697, 0.5569357, -0.1687635, 0, 1, 0.3686275, 1,
-0.2587191, -0.08637639, -1.195555, 0, 1, 0.3764706, 1,
-0.2555419, -0.1706354, -2.719636, 0, 1, 0.3803922, 1,
-0.2510474, -1.518781, -3.510215, 0, 1, 0.3882353, 1,
-0.2506161, -0.7097206, -2.677171, 0, 1, 0.3921569, 1,
-0.2493191, 0.1405993, -1.097115, 0, 1, 0.4, 1,
-0.2458913, 1.272419, -0.260476, 0, 1, 0.4078431, 1,
-0.242587, -1.080987, -4.049001, 0, 1, 0.4117647, 1,
-0.2420349, 0.6022336, -1.501928, 0, 1, 0.4196078, 1,
-0.2353224, 1.046933, 1.641578, 0, 1, 0.4235294, 1,
-0.2330297, -0.7653896, -4.254186, 0, 1, 0.4313726, 1,
-0.2311437, 0.3025879, 0.7937735, 0, 1, 0.4352941, 1,
-0.2288963, -0.6452488, -2.656362, 0, 1, 0.4431373, 1,
-0.2278705, -1.460028, -4.968816, 0, 1, 0.4470588, 1,
-0.226517, -1.06746, -2.187885, 0, 1, 0.454902, 1,
-0.2247858, -0.4796762, -2.637247, 0, 1, 0.4588235, 1,
-0.224677, 0.2399988, 1.586385, 0, 1, 0.4666667, 1,
-0.2174089, 0.2447176, -1.423777, 0, 1, 0.4705882, 1,
-0.215375, -1.666694, -0.7028233, 0, 1, 0.4784314, 1,
-0.2139303, 0.2890592, -0.3721938, 0, 1, 0.4823529, 1,
-0.2104479, 0.4359356, 0.9150556, 0, 1, 0.4901961, 1,
-0.203888, -1.794427, -1.74506, 0, 1, 0.4941176, 1,
-0.2036731, -0.3296065, -2.126726, 0, 1, 0.5019608, 1,
-0.203402, -2.336993, -3.645755, 0, 1, 0.509804, 1,
-0.197522, 0.514206, -1.153813, 0, 1, 0.5137255, 1,
-0.1887256, 0.1324849, -1.467337, 0, 1, 0.5215687, 1,
-0.1875295, -0.604868, -2.164088, 0, 1, 0.5254902, 1,
-0.1869092, 0.6967434, 0.377642, 0, 1, 0.5333334, 1,
-0.1748195, -0.7642115, -1.450935, 0, 1, 0.5372549, 1,
-0.1720911, -1.653328, -3.556531, 0, 1, 0.5450981, 1,
-0.1714779, 0.8689573, -0.8173608, 0, 1, 0.5490196, 1,
-0.1708414, -1.425598, -2.765974, 0, 1, 0.5568628, 1,
-0.1693782, -0.7485469, -1.636409, 0, 1, 0.5607843, 1,
-0.1685151, 0.7566799, 0.1632532, 0, 1, 0.5686275, 1,
-0.1613619, -0.4204949, -2.871327, 0, 1, 0.572549, 1,
-0.1602504, -0.736017, -4.807822, 0, 1, 0.5803922, 1,
-0.1580267, 0.1268951, 0.1312282, 0, 1, 0.5843138, 1,
-0.1550652, -0.4480367, -3.101243, 0, 1, 0.5921569, 1,
-0.1528664, 0.4807145, -0.1891164, 0, 1, 0.5960785, 1,
-0.1524627, -0.1633317, -3.715655, 0, 1, 0.6039216, 1,
-0.1504404, 0.3045736, -0.3052661, 0, 1, 0.6117647, 1,
-0.1475782, 0.5581792, -2.492283, 0, 1, 0.6156863, 1,
-0.1473981, -1.380875, -2.644129, 0, 1, 0.6235294, 1,
-0.1470521, 0.1906614, -0.7742735, 0, 1, 0.627451, 1,
-0.1326337, -1.398925, -2.640772, 0, 1, 0.6352941, 1,
-0.1287044, 0.3565199, 0.9708298, 0, 1, 0.6392157, 1,
-0.1218647, 0.4406573, 0.42011, 0, 1, 0.6470588, 1,
-0.1207039, -1.775292, -4.518957, 0, 1, 0.6509804, 1,
-0.1205087, -0.5697987, -3.647665, 0, 1, 0.6588235, 1,
-0.1201517, -1.509339, -2.50556, 0, 1, 0.6627451, 1,
-0.1149125, 0.4617446, -0.06380891, 0, 1, 0.6705883, 1,
-0.1136364, 1.523616, 1.369588, 0, 1, 0.6745098, 1,
-0.113505, -0.1106398, -3.718673, 0, 1, 0.682353, 1,
-0.1085777, 0.1842271, -1.163142, 0, 1, 0.6862745, 1,
-0.1066359, 0.7720484, -2.251289, 0, 1, 0.6941177, 1,
-0.1063062, 1.04798, 0.4611709, 0, 1, 0.7019608, 1,
-0.105175, 0.2401557, -3.061488, 0, 1, 0.7058824, 1,
-0.1050683, -1.096309, -2.535277, 0, 1, 0.7137255, 1,
-0.09787399, -0.8983544, -3.572572, 0, 1, 0.7176471, 1,
-0.0937907, 0.7945086, -0.9142285, 0, 1, 0.7254902, 1,
-0.09360421, 1.395217, 1.03435, 0, 1, 0.7294118, 1,
-0.09292211, 0.5072261, 0.4632967, 0, 1, 0.7372549, 1,
-0.09171821, -0.01243407, -2.383744, 0, 1, 0.7411765, 1,
-0.08405066, -0.1358101, -2.384154, 0, 1, 0.7490196, 1,
-0.07820369, -1.033976, -3.331022, 0, 1, 0.7529412, 1,
-0.07811823, 0.3683063, -0.567559, 0, 1, 0.7607843, 1,
-0.07731846, -1.248461, -4.994577, 0, 1, 0.7647059, 1,
-0.07559945, -3.12817, -2.462436, 0, 1, 0.772549, 1,
-0.07540388, 0.3420382, -1.363305, 0, 1, 0.7764706, 1,
-0.0752007, -0.4396283, -1.901622, 0, 1, 0.7843137, 1,
-0.07477231, 2.06087, 0.5915259, 0, 1, 0.7882353, 1,
-0.07365688, 0.6422825, -1.386942, 0, 1, 0.7960784, 1,
-0.07179545, -0.1067374, -4.009885, 0, 1, 0.8039216, 1,
-0.06221816, -0.1840867, -2.784541, 0, 1, 0.8078431, 1,
-0.06143959, 1.011425, -0.2485234, 0, 1, 0.8156863, 1,
-0.06084721, -0.7284102, -4.752727, 0, 1, 0.8196079, 1,
-0.06029484, 0.2486499, -0.7131923, 0, 1, 0.827451, 1,
-0.06022094, 0.4706067, -1.813951, 0, 1, 0.8313726, 1,
-0.05873288, -1.196947, -2.821424, 0, 1, 0.8392157, 1,
-0.05850381, 1.025595, -0.7226803, 0, 1, 0.8431373, 1,
-0.05831395, -2.792212, -1.297505, 0, 1, 0.8509804, 1,
-0.05785437, -1.261343, -4.079777, 0, 1, 0.854902, 1,
-0.05575515, -0.7486477, -4.456925, 0, 1, 0.8627451, 1,
-0.05252292, -0.1528211, -3.833509, 0, 1, 0.8666667, 1,
-0.04640531, -1.240329, -3.268965, 0, 1, 0.8745098, 1,
-0.04168329, -0.6335775, -2.154782, 0, 1, 0.8784314, 1,
-0.03542639, 0.2914734, -0.2948853, 0, 1, 0.8862745, 1,
-0.03414679, -1.986653, -3.297044, 0, 1, 0.8901961, 1,
-0.03354345, 2.345601, 1.760739, 0, 1, 0.8980392, 1,
-0.03211841, -0.9094584, -2.249977, 0, 1, 0.9058824, 1,
-0.03194967, -0.05847337, -2.413661, 0, 1, 0.9098039, 1,
-0.0307663, -1.284418, -3.858802, 0, 1, 0.9176471, 1,
-0.02652104, 0.0661615, -1.352242, 0, 1, 0.9215686, 1,
-0.02612171, 0.9679797, 0.1107127, 0, 1, 0.9294118, 1,
-0.02416306, 0.6025558, 0.9096991, 0, 1, 0.9333333, 1,
-0.02313803, 0.1964971, 0.6878175, 0, 1, 0.9411765, 1,
-0.02267478, 1.840711, -0.526976, 0, 1, 0.945098, 1,
-0.02041247, -0.4681502, -2.877693, 0, 1, 0.9529412, 1,
-0.01384779, -1.589509, -3.54505, 0, 1, 0.9568627, 1,
-0.01228261, 0.8526244, 1.793087, 0, 1, 0.9647059, 1,
-0.01213511, -1.669634, -4.079629, 0, 1, 0.9686275, 1,
-0.01188139, 0.6525797, -1.158731, 0, 1, 0.9764706, 1,
-0.01137935, 0.7823511, -0.3071924, 0, 1, 0.9803922, 1,
-0.007898904, -1.52123, -3.317178, 0, 1, 0.9882353, 1,
-0.007228403, -0.2345674, -2.086142, 0, 1, 0.9921569, 1,
-0.005163594, -0.7809926, -4.228166, 0, 1, 1, 1,
-0.004862292, -0.6727763, -1.722432, 0, 0.9921569, 1, 1,
-0.003103888, 0.001155723, -2.106068, 0, 0.9882353, 1, 1,
-0.001940523, 0.7054693, -0.4775931, 0, 0.9803922, 1, 1,
-0.0002982464, -1.361056, -2.3414, 0, 0.9764706, 1, 1,
-7.536632e-05, -1.944268, -2.847514, 0, 0.9686275, 1, 1,
0.00144208, -1.282274, 4.583062, 0, 0.9647059, 1, 1,
0.003028168, -0.4393909, 3.906025, 0, 0.9568627, 1, 1,
0.008419976, 0.8661017, -0.160808, 0, 0.9529412, 1, 1,
0.01292918, 1.73635, 0.9110141, 0, 0.945098, 1, 1,
0.01379588, 1.181213, -0.1008411, 0, 0.9411765, 1, 1,
0.01507847, -0.07567691, 4.868951, 0, 0.9333333, 1, 1,
0.01618537, 0.5344833, 0.1212716, 0, 0.9294118, 1, 1,
0.01823987, 0.1677283, 0.02084304, 0, 0.9215686, 1, 1,
0.02022656, 0.7477444, -1.590398, 0, 0.9176471, 1, 1,
0.02043012, -0.6819142, 2.644723, 0, 0.9098039, 1, 1,
0.02076355, 1.459818, 0.01840025, 0, 0.9058824, 1, 1,
0.02097164, 1.055016, -0.3152802, 0, 0.8980392, 1, 1,
0.02814635, 0.7730046, -0.816498, 0, 0.8901961, 1, 1,
0.0342432, 2.155148, 0.8582883, 0, 0.8862745, 1, 1,
0.03604143, 0.697794, 0.397897, 0, 0.8784314, 1, 1,
0.03733216, 1.982815, 1.061731, 0, 0.8745098, 1, 1,
0.03906932, -0.4296425, 4.150053, 0, 0.8666667, 1, 1,
0.04524843, 0.2739516, 0.4904146, 0, 0.8627451, 1, 1,
0.04613415, -0.8696508, 2.889106, 0, 0.854902, 1, 1,
0.05010445, -0.5557063, 5.143483, 0, 0.8509804, 1, 1,
0.05127015, -0.8636934, 1.577929, 0, 0.8431373, 1, 1,
0.05444505, -0.464415, 2.084754, 0, 0.8392157, 1, 1,
0.05484308, -0.8056219, 3.231561, 0, 0.8313726, 1, 1,
0.05577698, 1.224854, -0.5442063, 0, 0.827451, 1, 1,
0.05583751, -1.141971, 4.438533, 0, 0.8196079, 1, 1,
0.0591864, -0.9364529, 1.433893, 0, 0.8156863, 1, 1,
0.06155857, 0.8907402, 1.396368, 0, 0.8078431, 1, 1,
0.0635302, 0.07974323, 0.4985679, 0, 0.8039216, 1, 1,
0.06375822, 1.051909, -0.6567063, 0, 0.7960784, 1, 1,
0.06704975, 0.07509662, 0.590148, 0, 0.7882353, 1, 1,
0.06792068, -0.2714355, 1.153062, 0, 0.7843137, 1, 1,
0.0696511, -0.4184358, 2.172762, 0, 0.7764706, 1, 1,
0.07718872, 0.9807888, -2.928675, 0, 0.772549, 1, 1,
0.08049971, -1.464435, 3.91391, 0, 0.7647059, 1, 1,
0.08076769, -0.02962109, 3.943592, 0, 0.7607843, 1, 1,
0.08335924, -0.1563275, 1.629997, 0, 0.7529412, 1, 1,
0.08472128, -0.7254944, 4.627284, 0, 0.7490196, 1, 1,
0.08723117, -1.139237, 3.966117, 0, 0.7411765, 1, 1,
0.09193119, -0.5451241, 2.807696, 0, 0.7372549, 1, 1,
0.09387676, 0.3451, -0.08583066, 0, 0.7294118, 1, 1,
0.09518167, -0.421826, 1.032217, 0, 0.7254902, 1, 1,
0.09653853, -0.4049257, 2.919845, 0, 0.7176471, 1, 1,
0.09971642, -0.6895768, 2.884159, 0, 0.7137255, 1, 1,
0.1014105, -1.446215, 2.887635, 0, 0.7058824, 1, 1,
0.1079867, -0.2599204, 3.226404, 0, 0.6980392, 1, 1,
0.1083824, 0.0755072, 1.773505, 0, 0.6941177, 1, 1,
0.1102606, -0.6330348, 3.236589, 0, 0.6862745, 1, 1,
0.1106206, -0.5128975, 2.141738, 0, 0.682353, 1, 1,
0.1157594, -0.05146988, 2.140475, 0, 0.6745098, 1, 1,
0.1236874, -2.584343, 2.918593, 0, 0.6705883, 1, 1,
0.1243375, -1.118913, 4.181492, 0, 0.6627451, 1, 1,
0.141413, 0.1681783, -1.044685, 0, 0.6588235, 1, 1,
0.1438469, -0.08195242, 1.968255, 0, 0.6509804, 1, 1,
0.145749, 1.20716, -0.6706482, 0, 0.6470588, 1, 1,
0.1472574, 2.274541, 0.9266282, 0, 0.6392157, 1, 1,
0.1592266, 1.021469, -1.05386, 0, 0.6352941, 1, 1,
0.1607015, -2.037875, 3.171814, 0, 0.627451, 1, 1,
0.1643241, 1.644687, -0.2771021, 0, 0.6235294, 1, 1,
0.1658712, 2.012042, -1.250393, 0, 0.6156863, 1, 1,
0.1671028, -0.6925557, 2.841839, 0, 0.6117647, 1, 1,
0.1694235, -0.7722595, 4.280255, 0, 0.6039216, 1, 1,
0.1759427, 1.271603, 0.3208678, 0, 0.5960785, 1, 1,
0.1827997, -0.2656564, 0.9766915, 0, 0.5921569, 1, 1,
0.1854381, 0.4879344, 1.227826, 0, 0.5843138, 1, 1,
0.1869449, -0.5696328, 2.340651, 0, 0.5803922, 1, 1,
0.1870657, -1.092788, 3.272844, 0, 0.572549, 1, 1,
0.1870887, -1.201454, 2.018341, 0, 0.5686275, 1, 1,
0.1893988, 2.424286, 0.07095695, 0, 0.5607843, 1, 1,
0.1929837, -0.250722, 2.385698, 0, 0.5568628, 1, 1,
0.1975026, 2.125634, 1.512393, 0, 0.5490196, 1, 1,
0.1986306, -0.7100111, 2.645756, 0, 0.5450981, 1, 1,
0.200115, 0.4951705, 0.5714145, 0, 0.5372549, 1, 1,
0.2006493, -0.5727109, 3.352575, 0, 0.5333334, 1, 1,
0.2007464, 0.2664038, -0.8592239, 0, 0.5254902, 1, 1,
0.202178, -0.2300336, 2.179519, 0, 0.5215687, 1, 1,
0.2054911, 0.4936241, -1.150718, 0, 0.5137255, 1, 1,
0.2084969, -0.9079738, 1.690598, 0, 0.509804, 1, 1,
0.2104878, -1.166579, 1.782471, 0, 0.5019608, 1, 1,
0.2123358, -1.025794, 2.924461, 0, 0.4941176, 1, 1,
0.2133907, -1.511008, 5.804394, 0, 0.4901961, 1, 1,
0.2145988, 0.09685749, 0.6949635, 0, 0.4823529, 1, 1,
0.2184939, 1.353169, -0.3868433, 0, 0.4784314, 1, 1,
0.2219355, -0.07003247, 4.96349, 0, 0.4705882, 1, 1,
0.2256412, -0.0238352, 3.232663, 0, 0.4666667, 1, 1,
0.2311453, 1.623212, 0.5686267, 0, 0.4588235, 1, 1,
0.2346684, 0.2570912, 0.7440751, 0, 0.454902, 1, 1,
0.240381, -0.2046775, 2.494897, 0, 0.4470588, 1, 1,
0.2423451, -0.08763962, 2.786082, 0, 0.4431373, 1, 1,
0.2430108, 1.064768, 1.077791, 0, 0.4352941, 1, 1,
0.2500107, 0.6679277, -0.3315632, 0, 0.4313726, 1, 1,
0.2504483, 0.8846211, -0.4117927, 0, 0.4235294, 1, 1,
0.2530662, 1.021263, -1.868112, 0, 0.4196078, 1, 1,
0.253368, -0.03258077, 1.458575, 0, 0.4117647, 1, 1,
0.2536149, 0.1670642, 1.708358, 0, 0.4078431, 1, 1,
0.2643333, 0.8076684, 0.1051425, 0, 0.4, 1, 1,
0.2652563, -0.3463957, 4.20051, 0, 0.3921569, 1, 1,
0.2670843, -1.821974, 3.364621, 0, 0.3882353, 1, 1,
0.2686476, 0.2994831, 1.352746, 0, 0.3803922, 1, 1,
0.2687486, -0.6408081, 4.294089, 0, 0.3764706, 1, 1,
0.2760401, -0.6571083, 2.692433, 0, 0.3686275, 1, 1,
0.2785645, -0.7388713, 2.159521, 0, 0.3647059, 1, 1,
0.281601, 1.634612, 1.30704, 0, 0.3568628, 1, 1,
0.2834981, 0.3402919, 1.040578, 0, 0.3529412, 1, 1,
0.2864065, -0.2900257, 2.294668, 0, 0.345098, 1, 1,
0.286925, 0.3668136, -0.3097586, 0, 0.3411765, 1, 1,
0.2925294, 0.6463049, 0.3127009, 0, 0.3333333, 1, 1,
0.2925342, 0.6179585, 1.168919, 0, 0.3294118, 1, 1,
0.2928184, -1.475335, 1.476172, 0, 0.3215686, 1, 1,
0.2952325, -1.483825, 4.44328, 0, 0.3176471, 1, 1,
0.299757, 0.5859918, -0.3398083, 0, 0.3098039, 1, 1,
0.3006253, 0.3958737, 0.7218007, 0, 0.3058824, 1, 1,
0.3032758, -0.5629273, 2.262414, 0, 0.2980392, 1, 1,
0.3049474, 1.551141, 0.1044005, 0, 0.2901961, 1, 1,
0.3090908, 1.389711, 0.1984055, 0, 0.2862745, 1, 1,
0.3139576, 0.04957391, 0.7588181, 0, 0.2784314, 1, 1,
0.3154996, -0.3267387, 2.920318, 0, 0.2745098, 1, 1,
0.3163204, 0.3469911, 3.190664, 0, 0.2666667, 1, 1,
0.3203428, 0.9093201, -0.4770912, 0, 0.2627451, 1, 1,
0.3226204, 0.1716342, 0.7406113, 0, 0.254902, 1, 1,
0.3273725, -1.336028, 4.782925, 0, 0.2509804, 1, 1,
0.3324108, -2.042213, 4.762145, 0, 0.2431373, 1, 1,
0.3328563, -0.7184532, 2.613101, 0, 0.2392157, 1, 1,
0.3334913, 0.1796209, 1.710585, 0, 0.2313726, 1, 1,
0.3382214, 0.435636, 1.957972, 0, 0.227451, 1, 1,
0.3385069, -0.4614324, 3.137443, 0, 0.2196078, 1, 1,
0.338554, 0.1400695, 0.8233018, 0, 0.2156863, 1, 1,
0.3395593, -0.05240088, 1.246505, 0, 0.2078431, 1, 1,
0.3489889, 1.923608, -0.6153616, 0, 0.2039216, 1, 1,
0.3532195, 0.6106451, -0.5485322, 0, 0.1960784, 1, 1,
0.3541967, -0.5799939, 2.973411, 0, 0.1882353, 1, 1,
0.3548017, -0.5408178, 2.859055, 0, 0.1843137, 1, 1,
0.3571405, 1.275557, -1.031179, 0, 0.1764706, 1, 1,
0.3582498, 0.9181072, -0.1028755, 0, 0.172549, 1, 1,
0.3621377, 0.8677211, 1.068105, 0, 0.1647059, 1, 1,
0.3648143, -0.437357, 3.36823, 0, 0.1607843, 1, 1,
0.3674158, 0.3891727, -0.7586183, 0, 0.1529412, 1, 1,
0.3683423, -1.720809, 3.291705, 0, 0.1490196, 1, 1,
0.3699179, 0.9277259, -0.7440094, 0, 0.1411765, 1, 1,
0.372797, -0.2136442, 4.018718, 0, 0.1372549, 1, 1,
0.3767344, 0.2514729, 1.330173, 0, 0.1294118, 1, 1,
0.3780618, -1.560328, 1.60239, 0, 0.1254902, 1, 1,
0.3789529, -0.9530007, 3.742988, 0, 0.1176471, 1, 1,
0.3802519, 1.537102, -0.3456205, 0, 0.1137255, 1, 1,
0.3806421, -0.1963257, 0.2909371, 0, 0.1058824, 1, 1,
0.3831517, -0.5156211, 1.96902, 0, 0.09803922, 1, 1,
0.3841024, -0.6079929, 2.523007, 0, 0.09411765, 1, 1,
0.384769, 0.04093332, 0.2326564, 0, 0.08627451, 1, 1,
0.3853247, 1.309354, 0.6169888, 0, 0.08235294, 1, 1,
0.3887904, -0.2659568, 1.686058, 0, 0.07450981, 1, 1,
0.3908892, 0.819495, -0.4545006, 0, 0.07058824, 1, 1,
0.393099, -0.538094, 1.49594, 0, 0.0627451, 1, 1,
0.3992948, 0.2538249, 1.063563, 0, 0.05882353, 1, 1,
0.4009992, 0.7905149, 0.4942076, 0, 0.05098039, 1, 1,
0.4012833, 1.733943, 0.9827395, 0, 0.04705882, 1, 1,
0.4020886, -0.5589759, 1.439701, 0, 0.03921569, 1, 1,
0.4043561, -1.040296, 3.539535, 0, 0.03529412, 1, 1,
0.4074127, -1.378833, 4.086941, 0, 0.02745098, 1, 1,
0.4097782, 1.406547, -1.588408, 0, 0.02352941, 1, 1,
0.4100253, 0.6079781, 0.02600363, 0, 0.01568628, 1, 1,
0.4114915, -1.648509, 1.909066, 0, 0.01176471, 1, 1,
0.4123843, 0.2830427, 2.997133, 0, 0.003921569, 1, 1,
0.4148726, 0.6477785, -0.1137254, 0.003921569, 0, 1, 1,
0.4155561, 0.6564746, -0.2478134, 0.007843138, 0, 1, 1,
0.4162461, 0.4654316, 0.2838775, 0.01568628, 0, 1, 1,
0.4181845, 2.229898, -1.330569, 0.01960784, 0, 1, 1,
0.4230483, -0.7590585, 1.294521, 0.02745098, 0, 1, 1,
0.4310455, -0.3203067, 2.528907, 0.03137255, 0, 1, 1,
0.4320929, -2.001393, 4.860208, 0.03921569, 0, 1, 1,
0.435214, 1.016987, -0.3877844, 0.04313726, 0, 1, 1,
0.4369364, 0.4774839, 1.618061, 0.05098039, 0, 1, 1,
0.4431269, -0.5624779, 1.085193, 0.05490196, 0, 1, 1,
0.4473264, 0.02960162, 2.392272, 0.0627451, 0, 1, 1,
0.4491603, 0.03096377, 0.9429188, 0.06666667, 0, 1, 1,
0.450283, 1.187825, -0.1099656, 0.07450981, 0, 1, 1,
0.4528016, -0.4885447, 0.9840193, 0.07843138, 0, 1, 1,
0.4568973, -0.2925312, 3.384642, 0.08627451, 0, 1, 1,
0.4589221, 2.023973, -0.1866575, 0.09019608, 0, 1, 1,
0.4637838, -0.3622761, 2.983977, 0.09803922, 0, 1, 1,
0.4644994, -0.4665802, 1.135893, 0.1058824, 0, 1, 1,
0.4648135, 0.570127, -0.03812892, 0.1098039, 0, 1, 1,
0.4667771, 0.8480493, 0.5532075, 0.1176471, 0, 1, 1,
0.4766728, -0.1649925, 2.059332, 0.1215686, 0, 1, 1,
0.4780991, 0.2175139, 1.545861, 0.1294118, 0, 1, 1,
0.4820586, 0.3307324, 1.017725, 0.1333333, 0, 1, 1,
0.483787, -0.391559, 2.00603, 0.1411765, 0, 1, 1,
0.4873648, -0.2906902, 1.661402, 0.145098, 0, 1, 1,
0.4888746, -0.09438663, 3.659359, 0.1529412, 0, 1, 1,
0.4921778, 0.4463122, 0.9796535, 0.1568628, 0, 1, 1,
0.4921902, -0.06160609, -0.332232, 0.1647059, 0, 1, 1,
0.4971304, -0.7649314, 4.241046, 0.1686275, 0, 1, 1,
0.4991429, -1.316002, 3.462477, 0.1764706, 0, 1, 1,
0.4998884, -0.2858476, 0.5674238, 0.1803922, 0, 1, 1,
0.5011601, -1.401518, 3.27032, 0.1882353, 0, 1, 1,
0.5086717, -0.5101415, 2.544612, 0.1921569, 0, 1, 1,
0.5111166, 1.23897, 0.6957539, 0.2, 0, 1, 1,
0.5116826, -0.4638685, 2.855192, 0.2078431, 0, 1, 1,
0.5163833, 0.6606305, -0.3255734, 0.2117647, 0, 1, 1,
0.5224614, -0.3786834, 3.505568, 0.2196078, 0, 1, 1,
0.5228491, -0.700597, 2.884562, 0.2235294, 0, 1, 1,
0.5235791, 0.9956369, -0.319602, 0.2313726, 0, 1, 1,
0.5290158, 1.829781, -0.9195101, 0.2352941, 0, 1, 1,
0.5306723, -0.9170334, 2.983699, 0.2431373, 0, 1, 1,
0.5336001, -0.3668427, 1.567474, 0.2470588, 0, 1, 1,
0.536964, 0.6215014, 0.3196988, 0.254902, 0, 1, 1,
0.5447932, -0.5452231, 4.757566, 0.2588235, 0, 1, 1,
0.5456992, -0.2004755, 1.920353, 0.2666667, 0, 1, 1,
0.5475096, 1.303183, 1.792822, 0.2705882, 0, 1, 1,
0.5500283, -1.770754, 2.492536, 0.2784314, 0, 1, 1,
0.5530818, 0.009478529, 1.466628, 0.282353, 0, 1, 1,
0.5584094, -0.8974361, 2.326966, 0.2901961, 0, 1, 1,
0.5584952, -0.5661516, 3.139752, 0.2941177, 0, 1, 1,
0.5590672, -0.4923792, 0.4813834, 0.3019608, 0, 1, 1,
0.5591168, 0.5610152, -0.1001472, 0.3098039, 0, 1, 1,
0.5621924, 0.5773804, 0.8040529, 0.3137255, 0, 1, 1,
0.5634416, -1.509718, 0.6775405, 0.3215686, 0, 1, 1,
0.5703605, -0.1679178, 0.9420351, 0.3254902, 0, 1, 1,
0.5705949, 0.6359766, 1.01476, 0.3333333, 0, 1, 1,
0.5747757, -1.795614, 4.111074, 0.3372549, 0, 1, 1,
0.5791323, -0.5528559, 2.999705, 0.345098, 0, 1, 1,
0.5817344, -0.08661059, 3.54202, 0.3490196, 0, 1, 1,
0.5832815, -0.1324505, 3.573776, 0.3568628, 0, 1, 1,
0.5845804, -1.229568, 2.402873, 0.3607843, 0, 1, 1,
0.5860183, 0.4215792, -0.3015281, 0.3686275, 0, 1, 1,
0.5904191, -0.436809, 1.192345, 0.372549, 0, 1, 1,
0.591708, 0.3310651, -0.5277276, 0.3803922, 0, 1, 1,
0.5945264, -0.8189893, 2.8461, 0.3843137, 0, 1, 1,
0.5965847, 0.04139776, 1.526794, 0.3921569, 0, 1, 1,
0.6034518, -0.1228765, 3.272831, 0.3960784, 0, 1, 1,
0.6047193, -0.6151705, 1.846791, 0.4039216, 0, 1, 1,
0.6049322, -0.5338958, 2.326422, 0.4117647, 0, 1, 1,
0.6087136, -0.6833926, 1.512463, 0.4156863, 0, 1, 1,
0.6098241, 1.167455, -1.461635, 0.4235294, 0, 1, 1,
0.6171898, 1.053664, 1.248691, 0.427451, 0, 1, 1,
0.6254261, -0.2846799, 1.359357, 0.4352941, 0, 1, 1,
0.6333821, 1.039106, 1.848764, 0.4392157, 0, 1, 1,
0.6361684, 0.6655588, -0.1738092, 0.4470588, 0, 1, 1,
0.6364258, -0.9861639, 1.465253, 0.4509804, 0, 1, 1,
0.6436422, 0.6922712, 0.8036537, 0.4588235, 0, 1, 1,
0.6458617, 0.04788868, 2.819178, 0.4627451, 0, 1, 1,
0.6468229, -0.5983853, 2.474394, 0.4705882, 0, 1, 1,
0.6530068, -1.007919, 2.764145, 0.4745098, 0, 1, 1,
0.6595041, -0.2849709, 2.063597, 0.4823529, 0, 1, 1,
0.6601399, 1.78728, -0.5775287, 0.4862745, 0, 1, 1,
0.6643835, -0.4697808, 2.447633, 0.4941176, 0, 1, 1,
0.6686692, 0.7304938, 0.1351214, 0.5019608, 0, 1, 1,
0.6749188, -0.7438527, 3.893428, 0.5058824, 0, 1, 1,
0.676324, -0.1596727, 1.641842, 0.5137255, 0, 1, 1,
0.6808879, 0.667597, -0.04199106, 0.5176471, 0, 1, 1,
0.6892148, -0.2145898, 2.853215, 0.5254902, 0, 1, 1,
0.6893314, -0.75962, 2.191022, 0.5294118, 0, 1, 1,
0.6907244, -0.6546291, 0.7497357, 0.5372549, 0, 1, 1,
0.6951413, -0.5971062, 1.59238, 0.5411765, 0, 1, 1,
0.702755, -0.9326814, 2.385705, 0.5490196, 0, 1, 1,
0.7029252, 0.0532871, -0.9621421, 0.5529412, 0, 1, 1,
0.7033691, 1.2635, -0.6911448, 0.5607843, 0, 1, 1,
0.7142357, -0.6255102, 3.417804, 0.5647059, 0, 1, 1,
0.715753, 0.1410495, 1.067106, 0.572549, 0, 1, 1,
0.7220685, -0.7364717, 2.533078, 0.5764706, 0, 1, 1,
0.7260231, 0.7386728, 1.565974, 0.5843138, 0, 1, 1,
0.734736, -0.907291, 0.7637396, 0.5882353, 0, 1, 1,
0.7347937, 0.2474906, 0.9793774, 0.5960785, 0, 1, 1,
0.7387437, -0.4316178, 1.800436, 0.6039216, 0, 1, 1,
0.7416437, 0.2812704, 1.25767, 0.6078432, 0, 1, 1,
0.7444247, 0.8389165, 1.430021, 0.6156863, 0, 1, 1,
0.7449574, -1.500493, 1.269251, 0.6196079, 0, 1, 1,
0.753053, 0.5090938, 2.49146, 0.627451, 0, 1, 1,
0.7531216, -0.2207199, 0.4738969, 0.6313726, 0, 1, 1,
0.7569387, -0.2255133, 2.50179, 0.6392157, 0, 1, 1,
0.7573893, -0.4743973, 0.2858571, 0.6431373, 0, 1, 1,
0.7595657, 0.5302095, 2.897228, 0.6509804, 0, 1, 1,
0.7633454, -0.6648493, 1.160695, 0.654902, 0, 1, 1,
0.763485, -1.520401, 2.890403, 0.6627451, 0, 1, 1,
0.7641367, -0.6602232, 2.18302, 0.6666667, 0, 1, 1,
0.7733365, -2.575139, 2.302665, 0.6745098, 0, 1, 1,
0.7733877, -0.3647064, 0.4566778, 0.6784314, 0, 1, 1,
0.7985471, -0.07300524, 3.318997, 0.6862745, 0, 1, 1,
0.7986215, -0.37513, 2.434939, 0.6901961, 0, 1, 1,
0.8017603, -0.6573345, 2.04239, 0.6980392, 0, 1, 1,
0.8031714, 1.264277, 1.428558, 0.7058824, 0, 1, 1,
0.8084414, -0.5186048, 3.225256, 0.7098039, 0, 1, 1,
0.8225651, -0.3855424, 2.614916, 0.7176471, 0, 1, 1,
0.8251105, -1.058686, 2.569996, 0.7215686, 0, 1, 1,
0.8261136, 0.8084413, 2.516541, 0.7294118, 0, 1, 1,
0.8289854, -0.9290638, 3.435636, 0.7333333, 0, 1, 1,
0.8399035, -2.017789, 3.719336, 0.7411765, 0, 1, 1,
0.8443903, -0.7308111, 2.653665, 0.7450981, 0, 1, 1,
0.8490068, -1.155188, 4.149498, 0.7529412, 0, 1, 1,
0.8509455, 0.1638985, 2.408349, 0.7568628, 0, 1, 1,
0.8527704, -1.357934, 4.071177, 0.7647059, 0, 1, 1,
0.8558626, 0.7273504, 1.527625, 0.7686275, 0, 1, 1,
0.8606403, 1.623944, 0.8619987, 0.7764706, 0, 1, 1,
0.8636339, -0.7490163, 2.553015, 0.7803922, 0, 1, 1,
0.8650306, 1.757558, 0.0500469, 0.7882353, 0, 1, 1,
0.8658845, -1.252907, 0.5350945, 0.7921569, 0, 1, 1,
0.8670585, 1.775208, 2.242001, 0.8, 0, 1, 1,
0.8696482, -0.4420438, 3.690617, 0.8078431, 0, 1, 1,
0.8933817, -0.03542612, 1.885721, 0.8117647, 0, 1, 1,
0.8942104, -1.195696, 3.119821, 0.8196079, 0, 1, 1,
0.8984508, -0.7334793, 1.856712, 0.8235294, 0, 1, 1,
0.8988312, -0.4100405, 2.368782, 0.8313726, 0, 1, 1,
0.9056349, 0.6706704, 0.6656955, 0.8352941, 0, 1, 1,
0.9072526, -0.9568031, 1.446111, 0.8431373, 0, 1, 1,
0.9092526, 1.029014, -0.5621384, 0.8470588, 0, 1, 1,
0.9111226, -1.867044, 0.8202306, 0.854902, 0, 1, 1,
0.9113069, 0.4747197, 1.023379, 0.8588235, 0, 1, 1,
0.9113731, 1.801952, -0.6155757, 0.8666667, 0, 1, 1,
0.9233572, -1.238895, 2.371773, 0.8705882, 0, 1, 1,
0.9260449, -0.8294886, 2.411215, 0.8784314, 0, 1, 1,
0.9285816, 1.17817, 0.9675581, 0.8823529, 0, 1, 1,
0.9336585, -1.743555, 3.185068, 0.8901961, 0, 1, 1,
0.9373929, -0.20961, 1.995724, 0.8941177, 0, 1, 1,
0.9382112, -0.1658964, -0.3211073, 0.9019608, 0, 1, 1,
0.9391366, 1.267403, 1.673568, 0.9098039, 0, 1, 1,
0.9417553, 0.3374514, 0.7956163, 0.9137255, 0, 1, 1,
0.9479553, 0.07896955, 2.790693, 0.9215686, 0, 1, 1,
0.9494343, 0.1559819, 0.5735196, 0.9254902, 0, 1, 1,
0.9515542, 0.8033411, 0.8210191, 0.9333333, 0, 1, 1,
0.9518191, -0.3568233, 1.93757, 0.9372549, 0, 1, 1,
0.9570881, 0.07613441, 0.9009496, 0.945098, 0, 1, 1,
0.9586071, -1.2179, 2.395422, 0.9490196, 0, 1, 1,
0.9621155, 0.3669174, 2.267494, 0.9568627, 0, 1, 1,
0.9680512, -0.1521935, 2.096638, 0.9607843, 0, 1, 1,
0.9686715, -1.246599, 1.99743, 0.9686275, 0, 1, 1,
0.9757131, 1.186176, 2.5394, 0.972549, 0, 1, 1,
0.9764157, 0.8130555, 0.9828831, 0.9803922, 0, 1, 1,
0.9792303, 2.114478, 0.1084113, 0.9843137, 0, 1, 1,
0.9853277, -0.262588, 2.024906, 0.9921569, 0, 1, 1,
0.9873182, -0.9600626, 3.504365, 0.9960784, 0, 1, 1,
0.9897707, 0.6054533, 0.07661928, 1, 0, 0.9960784, 1,
0.990299, 0.08634195, 1.39758, 1, 0, 0.9882353, 1,
0.9906563, -1.69023, 2.021087, 1, 0, 0.9843137, 1,
1.00081, 0.9362535, -1.227489, 1, 0, 0.9764706, 1,
1.004944, 0.7349662, 0.4527079, 1, 0, 0.972549, 1,
1.014822, -2.316939, 0.6784722, 1, 0, 0.9647059, 1,
1.023564, 0.5857119, 1.971496, 1, 0, 0.9607843, 1,
1.02897, 0.2402787, 1.957764, 1, 0, 0.9529412, 1,
1.029358, -0.2897109, 1.864633, 1, 0, 0.9490196, 1,
1.032909, -0.8836184, 2.778738, 1, 0, 0.9411765, 1,
1.033816, -0.9877228, 2.970465, 1, 0, 0.9372549, 1,
1.034425, -0.6684738, 1.112375, 1, 0, 0.9294118, 1,
1.044196, 0.7609601, 1.708861, 1, 0, 0.9254902, 1,
1.047306, 0.2516209, 0.4686498, 1, 0, 0.9176471, 1,
1.047624, -1.413928, 2.216468, 1, 0, 0.9137255, 1,
1.047815, -0.004474717, 1.46924, 1, 0, 0.9058824, 1,
1.049467, 1.361849, 0.01597399, 1, 0, 0.9019608, 1,
1.050838, -0.5826176, 3.36776, 1, 0, 0.8941177, 1,
1.051873, -0.2022372, 1.253636, 1, 0, 0.8862745, 1,
1.053642, 0.2716859, 1.822965, 1, 0, 0.8823529, 1,
1.058194, 0.2545369, 2.560346, 1, 0, 0.8745098, 1,
1.058551, -1.218556, 2.138836, 1, 0, 0.8705882, 1,
1.059806, -2.052755, 3.202487, 1, 0, 0.8627451, 1,
1.060048, 0.1610381, 1.224056, 1, 0, 0.8588235, 1,
1.065539, 0.9828866, 1.057651, 1, 0, 0.8509804, 1,
1.066258, -0.6690591, 2.79527, 1, 0, 0.8470588, 1,
1.066629, 0.01434351, 1.51439, 1, 0, 0.8392157, 1,
1.078682, 0.08434546, 1.410185, 1, 0, 0.8352941, 1,
1.081647, -1.200017, 3.90087, 1, 0, 0.827451, 1,
1.102612, -0.1822962, 1.785286, 1, 0, 0.8235294, 1,
1.105392, -0.309359, 2.822864, 1, 0, 0.8156863, 1,
1.106125, -0.0901607, 1.983895, 1, 0, 0.8117647, 1,
1.111008, -0.3671525, 1.119886, 1, 0, 0.8039216, 1,
1.111303, -0.102156, 1.605489, 1, 0, 0.7960784, 1,
1.113064, -0.3434881, 2.002016, 1, 0, 0.7921569, 1,
1.113918, 0.4393144, 0.6256836, 1, 0, 0.7843137, 1,
1.124868, -1.087237, 2.74109, 1, 0, 0.7803922, 1,
1.131363, -0.6859667, 2.543758, 1, 0, 0.772549, 1,
1.132083, 1.901566, 1.799245, 1, 0, 0.7686275, 1,
1.134985, -0.4333271, 1.666644, 1, 0, 0.7607843, 1,
1.148187, -0.1159365, 1.130626, 1, 0, 0.7568628, 1,
1.148379, -0.7261294, 2.232196, 1, 0, 0.7490196, 1,
1.14862, -0.5377401, 1.191681, 1, 0, 0.7450981, 1,
1.15001, -0.9241487, 2.310534, 1, 0, 0.7372549, 1,
1.156276, 0.6900365, 1.211822, 1, 0, 0.7333333, 1,
1.160634, 1.195717, 2.081358, 1, 0, 0.7254902, 1,
1.163307, 0.8810415, -0.7267776, 1, 0, 0.7215686, 1,
1.16549, -0.2217885, 1.805237, 1, 0, 0.7137255, 1,
1.172223, 0.6869037, 2.691469, 1, 0, 0.7098039, 1,
1.182313, 0.4208624, 1.606704, 1, 0, 0.7019608, 1,
1.195297, 0.2649451, 2.30842, 1, 0, 0.6941177, 1,
1.196149, 0.3679942, 1.237359, 1, 0, 0.6901961, 1,
1.199871, -1.222921, 1.42404, 1, 0, 0.682353, 1,
1.218308, -2.36201, 1.135653, 1, 0, 0.6784314, 1,
1.233198, 0.345405, 1.262347, 1, 0, 0.6705883, 1,
1.241017, -0.7018043, 0.6123018, 1, 0, 0.6666667, 1,
1.247484, 0.0006248388, 1.8325, 1, 0, 0.6588235, 1,
1.249357, -1.001317, 1.669264, 1, 0, 0.654902, 1,
1.252729, -0.6439869, 2.536943, 1, 0, 0.6470588, 1,
1.25311, -0.7987956, 1.445842, 1, 0, 0.6431373, 1,
1.263412, -1.452998, 3.234015, 1, 0, 0.6352941, 1,
1.266059, 0.1930777, 0.5652121, 1, 0, 0.6313726, 1,
1.266128, -0.5164797, 2.522352, 1, 0, 0.6235294, 1,
1.266423, -0.4177734, 0.6117119, 1, 0, 0.6196079, 1,
1.271307, -0.2694732, 0.2060793, 1, 0, 0.6117647, 1,
1.274302, 0.1896457, -0.3439959, 1, 0, 0.6078432, 1,
1.279056, -0.6638712, 2.414431, 1, 0, 0.6, 1,
1.279364, 1.772271, 1.771396, 1, 0, 0.5921569, 1,
1.280717, 0.1005607, 1.932539, 1, 0, 0.5882353, 1,
1.285087, 1.000203, 0.03817368, 1, 0, 0.5803922, 1,
1.296843, 0.1205885, 0.6623197, 1, 0, 0.5764706, 1,
1.296863, -1.185263, 1.812976, 1, 0, 0.5686275, 1,
1.300438, 0.6418919, -0.2194144, 1, 0, 0.5647059, 1,
1.30166, -0.2735945, -0.8666204, 1, 0, 0.5568628, 1,
1.309222, -1.425419, 3.120561, 1, 0, 0.5529412, 1,
1.315132, -2.018903, 2.44601, 1, 0, 0.5450981, 1,
1.316688, 1.123643, 1.334932, 1, 0, 0.5411765, 1,
1.333384, -0.4941736, 1.018014, 1, 0, 0.5333334, 1,
1.335175, 0.1386453, 0.7897887, 1, 0, 0.5294118, 1,
1.337855, 1.728684, -0.04134687, 1, 0, 0.5215687, 1,
1.339309, -1.026257, 1.567495, 1, 0, 0.5176471, 1,
1.345351, 1.295881, 0.634975, 1, 0, 0.509804, 1,
1.346121, -0.9513245, 3.937461, 1, 0, 0.5058824, 1,
1.347324, -0.3497482, 2.626505, 1, 0, 0.4980392, 1,
1.349618, 0.228765, 2.840607, 1, 0, 0.4901961, 1,
1.35525, -0.557054, 1.4162, 1, 0, 0.4862745, 1,
1.366405, 0.5495074, 1.960028, 1, 0, 0.4784314, 1,
1.377681, -0.7280828, 1.932532, 1, 0, 0.4745098, 1,
1.387791, -0.3302031, 1.809681, 1, 0, 0.4666667, 1,
1.401945, -0.01422724, 1.213891, 1, 0, 0.4627451, 1,
1.411125, -0.4843779, 3.87857, 1, 0, 0.454902, 1,
1.412708, -0.04814458, 2.602211, 1, 0, 0.4509804, 1,
1.413776, -0.1756558, 1.631453, 1, 0, 0.4431373, 1,
1.42552, -0.04030602, 1.082283, 1, 0, 0.4392157, 1,
1.4283, 0.4294639, 1.249166, 1, 0, 0.4313726, 1,
1.429497, 1.285539, 0.02104441, 1, 0, 0.427451, 1,
1.455367, 0.533983, 0.7669907, 1, 0, 0.4196078, 1,
1.45874, 0.05565413, 0.7844085, 1, 0, 0.4156863, 1,
1.460602, 2.369027, 0.6201482, 1, 0, 0.4078431, 1,
1.460794, -0.08865064, 1.300688, 1, 0, 0.4039216, 1,
1.461167, 1.00281, 0.4391665, 1, 0, 0.3960784, 1,
1.467135, 1.151745, -1.168328, 1, 0, 0.3882353, 1,
1.467938, 0.6720217, 0.9509759, 1, 0, 0.3843137, 1,
1.477407, 0.7279985, -0.1168534, 1, 0, 0.3764706, 1,
1.483795, 0.4123636, -1.685423, 1, 0, 0.372549, 1,
1.497321, 0.3481662, 1.78659, 1, 0, 0.3647059, 1,
1.520249, -0.118242, 2.071841, 1, 0, 0.3607843, 1,
1.524482, 0.8250085, 2.839249, 1, 0, 0.3529412, 1,
1.528712, -0.09158991, 1.256654, 1, 0, 0.3490196, 1,
1.530821, 0.6956169, 0.8317469, 1, 0, 0.3411765, 1,
1.556361, 0.6350069, 1.440042, 1, 0, 0.3372549, 1,
1.557407, 0.6783122, 0.2252561, 1, 0, 0.3294118, 1,
1.574736, 2.388428, 1.454688, 1, 0, 0.3254902, 1,
1.574785, 1.093781, 1.533677, 1, 0, 0.3176471, 1,
1.585235, 1.391246, 1.057363, 1, 0, 0.3137255, 1,
1.606681, 0.02751097, 1.326459, 1, 0, 0.3058824, 1,
1.608137, 1.043596, 1.456242, 1, 0, 0.2980392, 1,
1.638374, -2.306876, 3.828232, 1, 0, 0.2941177, 1,
1.670083, -1.3716, 3.327127, 1, 0, 0.2862745, 1,
1.67346, -1.208376, 1.480226, 1, 0, 0.282353, 1,
1.697667, 0.03199812, 0.233774, 1, 0, 0.2745098, 1,
1.734289, -1.121368, 0.7850543, 1, 0, 0.2705882, 1,
1.735789, -1.05601, 3.573273, 1, 0, 0.2627451, 1,
1.742488, -1.193198, 1.714346, 1, 0, 0.2588235, 1,
1.745856, 0.5581247, 1.563177, 1, 0, 0.2509804, 1,
1.753571, 1.665607, 2.319886, 1, 0, 0.2470588, 1,
1.771208, -0.1246545, 1.157863, 1, 0, 0.2392157, 1,
1.771734, -0.3099213, 1.895174, 1, 0, 0.2352941, 1,
1.77367, -0.001767112, 1.073731, 1, 0, 0.227451, 1,
1.786338, 0.678579, 1.087135, 1, 0, 0.2235294, 1,
1.792371, 0.5965512, -0.8519722, 1, 0, 0.2156863, 1,
1.793901, -0.04838983, -0.492608, 1, 0, 0.2117647, 1,
1.806411, 0.8817889, -0.1248467, 1, 0, 0.2039216, 1,
1.810225, -0.8221636, 3.240512, 1, 0, 0.1960784, 1,
1.843807, 1.218478, 1.813621, 1, 0, 0.1921569, 1,
1.868842, -0.9358146, 2.11245, 1, 0, 0.1843137, 1,
1.900305, -0.2441696, 2.851932, 1, 0, 0.1803922, 1,
1.904578, -1.080999, 1.131994, 1, 0, 0.172549, 1,
1.909978, -0.2466556, 1.941129, 1, 0, 0.1686275, 1,
1.918334, 1.223451, 2.676916, 1, 0, 0.1607843, 1,
1.950723, 0.2943214, 0.9159524, 1, 0, 0.1568628, 1,
2.048339, 1.228198, 0.2028985, 1, 0, 0.1490196, 1,
2.052513, 0.7443379, 0.9277546, 1, 0, 0.145098, 1,
2.074378, 0.3872557, 0.2163952, 1, 0, 0.1372549, 1,
2.179567, -1.235027, 1.663039, 1, 0, 0.1333333, 1,
2.180908, -0.2031899, 1.850601, 1, 0, 0.1254902, 1,
2.187433, 0.502521, 0.5257011, 1, 0, 0.1215686, 1,
2.194943, 0.4746554, 2.468226, 1, 0, 0.1137255, 1,
2.226425, 0.3176687, -0.6828272, 1, 0, 0.1098039, 1,
2.249463, -0.2291813, 2.550022, 1, 0, 0.1019608, 1,
2.301546, 1.710438, -0.8599395, 1, 0, 0.09411765, 1,
2.306713, 1.388847, 0.9304214, 1, 0, 0.09019608, 1,
2.314571, -1.079772, 1.693483, 1, 0, 0.08235294, 1,
2.364449, 0.4450525, 0.5104023, 1, 0, 0.07843138, 1,
2.369178, -1.293641, -0.6616935, 1, 0, 0.07058824, 1,
2.380497, 0.1809593, 1.101251, 1, 0, 0.06666667, 1,
2.574753, 0.9203867, 0.1754291, 1, 0, 0.05882353, 1,
2.643796, 1.27709, 0.2284713, 1, 0, 0.05490196, 1,
2.67464, 2.084194, 0.2060208, 1, 0, 0.04705882, 1,
2.710647, -0.1600352, 0.8441738, 1, 0, 0.04313726, 1,
2.715656, 1.708015, 1.376544, 1, 0, 0.03529412, 1,
2.796414, 0.0789014, 1.575094, 1, 0, 0.03137255, 1,
2.841547, -0.6087294, 3.36611, 1, 0, 0.02352941, 1,
2.869332, 0.4072458, 0.1916761, 1, 0, 0.01960784, 1,
3.23147, -1.455387, 1.906832, 1, 0, 0.01176471, 1,
3.65499, 1.918533, -0.2754129, 1, 0, 0.007843138, 1
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
0.369956, -4.150932, -7.186999, 0, -0.5, 0.5, 0.5,
0.369956, -4.150932, -7.186999, 1, -0.5, 0.5, 0.5,
0.369956, -4.150932, -7.186999, 1, 1.5, 0.5, 0.5,
0.369956, -4.150932, -7.186999, 0, 1.5, 0.5, 0.5
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
-4.028705, -0.1111724, -7.186999, 0, -0.5, 0.5, 0.5,
-4.028705, -0.1111724, -7.186999, 1, -0.5, 0.5, 0.5,
-4.028705, -0.1111724, -7.186999, 1, 1.5, 0.5, 0.5,
-4.028705, -0.1111724, -7.186999, 0, 1.5, 0.5, 0.5
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
-4.028705, -4.150932, 0.2501431, 0, -0.5, 0.5, 0.5,
-4.028705, -4.150932, 0.2501431, 1, -0.5, 0.5, 0.5,
-4.028705, -4.150932, 0.2501431, 1, 1.5, 0.5, 0.5,
-4.028705, -4.150932, 0.2501431, 0, 1.5, 0.5, 0.5
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
-2, -3.21868, -5.470735,
3, -3.21868, -5.470735,
-2, -3.21868, -5.470735,
-2, -3.374056, -5.756779,
-1, -3.21868, -5.470735,
-1, -3.374056, -5.756779,
0, -3.21868, -5.470735,
0, -3.374056, -5.756779,
1, -3.21868, -5.470735,
1, -3.374056, -5.756779,
2, -3.21868, -5.470735,
2, -3.374056, -5.756779,
3, -3.21868, -5.470735,
3, -3.374056, -5.756779
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
-2, -3.684806, -6.328867, 0, -0.5, 0.5, 0.5,
-2, -3.684806, -6.328867, 1, -0.5, 0.5, 0.5,
-2, -3.684806, -6.328867, 1, 1.5, 0.5, 0.5,
-2, -3.684806, -6.328867, 0, 1.5, 0.5, 0.5,
-1, -3.684806, -6.328867, 0, -0.5, 0.5, 0.5,
-1, -3.684806, -6.328867, 1, -0.5, 0.5, 0.5,
-1, -3.684806, -6.328867, 1, 1.5, 0.5, 0.5,
-1, -3.684806, -6.328867, 0, 1.5, 0.5, 0.5,
0, -3.684806, -6.328867, 0, -0.5, 0.5, 0.5,
0, -3.684806, -6.328867, 1, -0.5, 0.5, 0.5,
0, -3.684806, -6.328867, 1, 1.5, 0.5, 0.5,
0, -3.684806, -6.328867, 0, 1.5, 0.5, 0.5,
1, -3.684806, -6.328867, 0, -0.5, 0.5, 0.5,
1, -3.684806, -6.328867, 1, -0.5, 0.5, 0.5,
1, -3.684806, -6.328867, 1, 1.5, 0.5, 0.5,
1, -3.684806, -6.328867, 0, 1.5, 0.5, 0.5,
2, -3.684806, -6.328867, 0, -0.5, 0.5, 0.5,
2, -3.684806, -6.328867, 1, -0.5, 0.5, 0.5,
2, -3.684806, -6.328867, 1, 1.5, 0.5, 0.5,
2, -3.684806, -6.328867, 0, 1.5, 0.5, 0.5,
3, -3.684806, -6.328867, 0, -0.5, 0.5, 0.5,
3, -3.684806, -6.328867, 1, -0.5, 0.5, 0.5,
3, -3.684806, -6.328867, 1, 1.5, 0.5, 0.5,
3, -3.684806, -6.328867, 0, 1.5, 0.5, 0.5
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
-3.013629, -3, -5.470735,
-3.013629, 2, -5.470735,
-3.013629, -3, -5.470735,
-3.182809, -3, -5.756779,
-3.013629, -2, -5.470735,
-3.182809, -2, -5.756779,
-3.013629, -1, -5.470735,
-3.182809, -1, -5.756779,
-3.013629, 0, -5.470735,
-3.182809, 0, -5.756779,
-3.013629, 1, -5.470735,
-3.182809, 1, -5.756779,
-3.013629, 2, -5.470735,
-3.182809, 2, -5.756779
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
-3.521167, -3, -6.328867, 0, -0.5, 0.5, 0.5,
-3.521167, -3, -6.328867, 1, -0.5, 0.5, 0.5,
-3.521167, -3, -6.328867, 1, 1.5, 0.5, 0.5,
-3.521167, -3, -6.328867, 0, 1.5, 0.5, 0.5,
-3.521167, -2, -6.328867, 0, -0.5, 0.5, 0.5,
-3.521167, -2, -6.328867, 1, -0.5, 0.5, 0.5,
-3.521167, -2, -6.328867, 1, 1.5, 0.5, 0.5,
-3.521167, -2, -6.328867, 0, 1.5, 0.5, 0.5,
-3.521167, -1, -6.328867, 0, -0.5, 0.5, 0.5,
-3.521167, -1, -6.328867, 1, -0.5, 0.5, 0.5,
-3.521167, -1, -6.328867, 1, 1.5, 0.5, 0.5,
-3.521167, -1, -6.328867, 0, 1.5, 0.5, 0.5,
-3.521167, 0, -6.328867, 0, -0.5, 0.5, 0.5,
-3.521167, 0, -6.328867, 1, -0.5, 0.5, 0.5,
-3.521167, 0, -6.328867, 1, 1.5, 0.5, 0.5,
-3.521167, 0, -6.328867, 0, 1.5, 0.5, 0.5,
-3.521167, 1, -6.328867, 0, -0.5, 0.5, 0.5,
-3.521167, 1, -6.328867, 1, -0.5, 0.5, 0.5,
-3.521167, 1, -6.328867, 1, 1.5, 0.5, 0.5,
-3.521167, 1, -6.328867, 0, 1.5, 0.5, 0.5,
-3.521167, 2, -6.328867, 0, -0.5, 0.5, 0.5,
-3.521167, 2, -6.328867, 1, -0.5, 0.5, 0.5,
-3.521167, 2, -6.328867, 1, 1.5, 0.5, 0.5,
-3.521167, 2, -6.328867, 0, 1.5, 0.5, 0.5
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
-3.013629, -3.21868, -4,
-3.013629, -3.21868, 4,
-3.013629, -3.21868, -4,
-3.182809, -3.374056, -4,
-3.013629, -3.21868, -2,
-3.182809, -3.374056, -2,
-3.013629, -3.21868, 0,
-3.182809, -3.374056, 0,
-3.013629, -3.21868, 2,
-3.182809, -3.374056, 2,
-3.013629, -3.21868, 4,
-3.182809, -3.374056, 4
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
-3.521167, -3.684806, -4, 0, -0.5, 0.5, 0.5,
-3.521167, -3.684806, -4, 1, -0.5, 0.5, 0.5,
-3.521167, -3.684806, -4, 1, 1.5, 0.5, 0.5,
-3.521167, -3.684806, -4, 0, 1.5, 0.5, 0.5,
-3.521167, -3.684806, -2, 0, -0.5, 0.5, 0.5,
-3.521167, -3.684806, -2, 1, -0.5, 0.5, 0.5,
-3.521167, -3.684806, -2, 1, 1.5, 0.5, 0.5,
-3.521167, -3.684806, -2, 0, 1.5, 0.5, 0.5,
-3.521167, -3.684806, 0, 0, -0.5, 0.5, 0.5,
-3.521167, -3.684806, 0, 1, -0.5, 0.5, 0.5,
-3.521167, -3.684806, 0, 1, 1.5, 0.5, 0.5,
-3.521167, -3.684806, 0, 0, 1.5, 0.5, 0.5,
-3.521167, -3.684806, 2, 0, -0.5, 0.5, 0.5,
-3.521167, -3.684806, 2, 1, -0.5, 0.5, 0.5,
-3.521167, -3.684806, 2, 1, 1.5, 0.5, 0.5,
-3.521167, -3.684806, 2, 0, 1.5, 0.5, 0.5,
-3.521167, -3.684806, 4, 0, -0.5, 0.5, 0.5,
-3.521167, -3.684806, 4, 1, -0.5, 0.5, 0.5,
-3.521167, -3.684806, 4, 1, 1.5, 0.5, 0.5,
-3.521167, -3.684806, 4, 0, 1.5, 0.5, 0.5
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
-3.013629, -3.21868, -5.470735,
-3.013629, 2.996335, -5.470735,
-3.013629, -3.21868, 5.971021,
-3.013629, 2.996335, 5.971021,
-3.013629, -3.21868, -5.470735,
-3.013629, -3.21868, 5.971021,
-3.013629, 2.996335, -5.470735,
-3.013629, 2.996335, 5.971021,
-3.013629, -3.21868, -5.470735,
3.753541, -3.21868, -5.470735,
-3.013629, -3.21868, 5.971021,
3.753541, -3.21868, 5.971021,
-3.013629, 2.996335, -5.470735,
3.753541, 2.996335, -5.470735,
-3.013629, 2.996335, 5.971021,
3.753541, 2.996335, 5.971021,
3.753541, -3.21868, -5.470735,
3.753541, 2.996335, -5.470735,
3.753541, -3.21868, 5.971021,
3.753541, 2.996335, 5.971021,
3.753541, -3.21868, -5.470735,
3.753541, -3.21868, 5.971021,
3.753541, 2.996335, -5.470735,
3.753541, 2.996335, 5.971021
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
var radius = 7.835786;
var distance = 34.8623;
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
mvMatrix.translate( -0.369956, 0.1111724, -0.2501431 );
mvMatrix.scale( 1.251957, 1.363183, 0.7404637 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.8623);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Difethialone<-read.table("Difethialone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Difethialone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Difethialone' not found
```

```r
y<-Difethialone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Difethialone' not found
```

```r
z<-Difethialone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Difethialone' not found
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
-2.915078, 1.367282, -0.3462255, 0, 0, 1, 1, 1,
-2.874227, 0.7346631, -1.109755, 1, 0, 0, 1, 1,
-2.695911, -0.536588, -3.380771, 1, 0, 0, 1, 1,
-2.684552, -0.2997312, -0.6197582, 1, 0, 0, 1, 1,
-2.653153, -0.2377533, -1.423841, 1, 0, 0, 1, 1,
-2.493442, -0.3966227, -1.461798, 1, 0, 0, 1, 1,
-2.421443, 0.08814507, -1.714564, 0, 0, 0, 1, 1,
-2.409033, -1.042697, -2.475132, 0, 0, 0, 1, 1,
-2.397376, -0.1665219, -2.593129, 0, 0, 0, 1, 1,
-2.340641, -0.08327585, -1.044043, 0, 0, 0, 1, 1,
-2.242219, -0.89384, -2.404594, 0, 0, 0, 1, 1,
-2.240327, -0.3959063, -1.663369, 0, 0, 0, 1, 1,
-2.239565, 1.453359, 0.7910858, 0, 0, 0, 1, 1,
-2.224437, -0.7873428, -0.1915085, 1, 1, 1, 1, 1,
-2.200462, -1.027333, -0.3855394, 1, 1, 1, 1, 1,
-2.194462, 0.8119779, 0.8470487, 1, 1, 1, 1, 1,
-2.185194, -1.142782, -0.8671597, 1, 1, 1, 1, 1,
-2.180439, -0.7752668, -1.921669, 1, 1, 1, 1, 1,
-2.082493, 1.148059, -1.118729, 1, 1, 1, 1, 1,
-2.047101, 0.7113393, -1.449619, 1, 1, 1, 1, 1,
-2.036311, 0.9807724, -0.1931647, 1, 1, 1, 1, 1,
-1.98954, 0.4090723, -0.6264865, 1, 1, 1, 1, 1,
-1.946252, 0.9694626, -0.8771181, 1, 1, 1, 1, 1,
-1.943792, 1.039172, -1.127801, 1, 1, 1, 1, 1,
-1.943705, -2.029762, -3.374956, 1, 1, 1, 1, 1,
-1.928005, 1.241449, -2.783401, 1, 1, 1, 1, 1,
-1.927709, -0.5834276, -0.7085294, 1, 1, 1, 1, 1,
-1.919427, 1.667587, -0.569293, 1, 1, 1, 1, 1,
-1.873959, 0.2272038, -1.733412, 0, 0, 1, 1, 1,
-1.862738, 0.04617704, 0.2545179, 1, 0, 0, 1, 1,
-1.854279, -0.2801764, -2.428914, 1, 0, 0, 1, 1,
-1.848977, 0.552045, -0.3661321, 1, 0, 0, 1, 1,
-1.837186, -0.01782516, -0.8293591, 1, 0, 0, 1, 1,
-1.810072, 0.6978724, -0.4018661, 1, 0, 0, 1, 1,
-1.803914, 0.5413126, -1.075865, 0, 0, 0, 1, 1,
-1.803436, 0.1602712, -0.6789129, 0, 0, 0, 1, 1,
-1.798563, 0.3347408, -1.385393, 0, 0, 0, 1, 1,
-1.770865, 1.05323, -0.4574192, 0, 0, 0, 1, 1,
-1.757478, 1.963457, -0.1537566, 0, 0, 0, 1, 1,
-1.753654, 0.2426141, -2.091866, 0, 0, 0, 1, 1,
-1.751143, 0.9416125, -0.5936135, 0, 0, 0, 1, 1,
-1.744429, 0.08548337, -0.4782306, 1, 1, 1, 1, 1,
-1.742186, 1.604223, -2.246917, 1, 1, 1, 1, 1,
-1.713771, 0.8158978, -1.618024, 1, 1, 1, 1, 1,
-1.701079, 1.928786, 0.4253848, 1, 1, 1, 1, 1,
-1.694878, -0.6917658, -2.320312, 1, 1, 1, 1, 1,
-1.689418, 0.1462159, -2.34937, 1, 1, 1, 1, 1,
-1.675425, -0.7532457, -2.522087, 1, 1, 1, 1, 1,
-1.671706, 0.7766917, -1.099065, 1, 1, 1, 1, 1,
-1.667353, -1.11262, -1.132697, 1, 1, 1, 1, 1,
-1.666509, -1.085794, -2.158793, 1, 1, 1, 1, 1,
-1.64746, 0.7544098, -1.168451, 1, 1, 1, 1, 1,
-1.635794, 0.4214958, -1.244568, 1, 1, 1, 1, 1,
-1.621329, -0.4795643, -1.254216, 1, 1, 1, 1, 1,
-1.617777, 0.4353561, -2.589039, 1, 1, 1, 1, 1,
-1.611759, 0.3982589, -1.226007, 1, 1, 1, 1, 1,
-1.60836, 0.6979391, -1.568349, 0, 0, 1, 1, 1,
-1.607597, 0.0009930803, -1.511651, 1, 0, 0, 1, 1,
-1.603988, 0.7641335, -1.772665, 1, 0, 0, 1, 1,
-1.592738, -0.18858, -3.05955, 1, 0, 0, 1, 1,
-1.576467, -0.1874356, -2.875707, 1, 0, 0, 1, 1,
-1.566, -1.481883, -2.875578, 1, 0, 0, 1, 1,
-1.560044, 0.4823779, -1.967028, 0, 0, 0, 1, 1,
-1.557005, 0.3302828, -0.7371924, 0, 0, 0, 1, 1,
-1.547278, -0.6704559, -1.268255, 0, 0, 0, 1, 1,
-1.535641, -0.3465956, -2.358332, 0, 0, 0, 1, 1,
-1.528977, 2.905825, 0.7661332, 0, 0, 0, 1, 1,
-1.509867, 2.830472, -0.3728296, 0, 0, 0, 1, 1,
-1.505575, 0.6610424, -3.227902, 0, 0, 0, 1, 1,
-1.497922, 2.658264, 0.8966047, 1, 1, 1, 1, 1,
-1.476573, -0.378502, -2.640083, 1, 1, 1, 1, 1,
-1.464506, -0.04067951, -2.197172, 1, 1, 1, 1, 1,
-1.453238, 1.207098, 0.6152503, 1, 1, 1, 1, 1,
-1.451085, -0.3726947, -3.035648, 1, 1, 1, 1, 1,
-1.448136, -1.063121, -2.695351, 1, 1, 1, 1, 1,
-1.447774, -1.210387, -2.529748, 1, 1, 1, 1, 1,
-1.435272, -1.563633, -3.280248, 1, 1, 1, 1, 1,
-1.42889, 0.7307311, -0.8716213, 1, 1, 1, 1, 1,
-1.422396, -1.281376, -0.9605789, 1, 1, 1, 1, 1,
-1.421883, -0.4888343, -1.456709, 1, 1, 1, 1, 1,
-1.420722, 1.47278, -1.316923, 1, 1, 1, 1, 1,
-1.418659, 1.280551, -0.4580469, 1, 1, 1, 1, 1,
-1.406305, 1.105496, -0.02115415, 1, 1, 1, 1, 1,
-1.396854, 1.871846, 1.266416, 1, 1, 1, 1, 1,
-1.389434, 1.247484, -1.404018, 0, 0, 1, 1, 1,
-1.386311, 0.265917, -0.8789265, 1, 0, 0, 1, 1,
-1.379349, 0.1631481, -1.717844, 1, 0, 0, 1, 1,
-1.377329, -0.6469296, -2.021864, 1, 0, 0, 1, 1,
-1.369629, -0.7057105, -2.397534, 1, 0, 0, 1, 1,
-1.360181, -1.180242, -4.192933, 1, 0, 0, 1, 1,
-1.357155, -0.06182611, -0.3980661, 0, 0, 0, 1, 1,
-1.344055, 1.729902, -0.8972018, 0, 0, 0, 1, 1,
-1.335907, 0.2112094, -1.739095, 0, 0, 0, 1, 1,
-1.33516, 0.03354804, -0.4957262, 0, 0, 0, 1, 1,
-1.334238, -0.4671145, -2.654249, 0, 0, 0, 1, 1,
-1.329857, 1.304127, -0.5186315, 0, 0, 0, 1, 1,
-1.326738, -1.040062, -1.693644, 0, 0, 0, 1, 1,
-1.320171, 0.04895129, -0.3970865, 1, 1, 1, 1, 1,
-1.319396, -0.7265477, -2.327352, 1, 1, 1, 1, 1,
-1.317863, -0.7846194, -3.819217, 1, 1, 1, 1, 1,
-1.314697, 0.6691536, -0.8615892, 1, 1, 1, 1, 1,
-1.30997, 1.916349, -2.428232, 1, 1, 1, 1, 1,
-1.308588, -2.282899, -1.261971, 1, 1, 1, 1, 1,
-1.297861, 0.5495016, 0.0398244, 1, 1, 1, 1, 1,
-1.266025, -0.9799833, -3.061, 1, 1, 1, 1, 1,
-1.26522, 1.136832, -1.748472, 1, 1, 1, 1, 1,
-1.252027, 0.5876651, -2.079288, 1, 1, 1, 1, 1,
-1.249663, -1.540455, -1.53861, 1, 1, 1, 1, 1,
-1.239062, 0.2152893, -2.012849, 1, 1, 1, 1, 1,
-1.232773, 0.4363748, -0.8062814, 1, 1, 1, 1, 1,
-1.223061, 0.3607826, -1.196185, 1, 1, 1, 1, 1,
-1.220426, -1.782716, -2.040011, 1, 1, 1, 1, 1,
-1.220249, 1.23521, 0.1426913, 0, 0, 1, 1, 1,
-1.217917, -1.952513, -1.537512, 1, 0, 0, 1, 1,
-1.204097, -0.007806059, -3.11307, 1, 0, 0, 1, 1,
-1.201637, 1.945103, 0.9830978, 1, 0, 0, 1, 1,
-1.198562, -1.365148, -2.354979, 1, 0, 0, 1, 1,
-1.196281, 0.598784, -2.028301, 1, 0, 0, 1, 1,
-1.186038, -0.7863775, -2.023305, 0, 0, 0, 1, 1,
-1.178584, -0.9141584, -3.353516, 0, 0, 0, 1, 1,
-1.178578, 0.7410377, -1.740007, 0, 0, 0, 1, 1,
-1.172106, 0.0676866, -0.5470144, 0, 0, 0, 1, 1,
-1.169448, 0.9220505, -0.6180081, 0, 0, 0, 1, 1,
-1.169222, -0.3408693, -1.79273, 0, 0, 0, 1, 1,
-1.168398, 1.038324, -1.645235, 0, 0, 0, 1, 1,
-1.167919, 1.549981, -1.639607, 1, 1, 1, 1, 1,
-1.163859, 0.6704699, 0.4092717, 1, 1, 1, 1, 1,
-1.161934, 1.098258, -1.67269, 1, 1, 1, 1, 1,
-1.153938, 0.4506058, -2.947361, 1, 1, 1, 1, 1,
-1.148323, 0.7781128, -1.022644, 1, 1, 1, 1, 1,
-1.148156, -0.6208457, -2.936611, 1, 1, 1, 1, 1,
-1.140186, 0.7807208, -1.680051, 1, 1, 1, 1, 1,
-1.135257, 0.9809225, -0.8821266, 1, 1, 1, 1, 1,
-1.135183, -1.548259, -2.793381, 1, 1, 1, 1, 1,
-1.134176, 0.2665717, -1.076002, 1, 1, 1, 1, 1,
-1.132277, -1.27192, -1.141203, 1, 1, 1, 1, 1,
-1.127378, -1.43951, -1.317905, 1, 1, 1, 1, 1,
-1.120101, -1.713123, -2.535245, 1, 1, 1, 1, 1,
-1.115771, 0.3506226, -1.46272, 1, 1, 1, 1, 1,
-1.113278, 0.8813311, -2.120426, 1, 1, 1, 1, 1,
-1.107877, -0.7218502, -1.42808, 0, 0, 1, 1, 1,
-1.1044, -0.4517727, -2.169094, 1, 0, 0, 1, 1,
-1.100569, 0.1943542, -2.456234, 1, 0, 0, 1, 1,
-1.099673, -1.254156, -3.088495, 1, 0, 0, 1, 1,
-1.090843, 0.06433652, -1.222553, 1, 0, 0, 1, 1,
-1.0862, -0.08680286, -0.9189972, 1, 0, 0, 1, 1,
-1.083569, -0.9563534, -1.440247, 0, 0, 0, 1, 1,
-1.072085, 0.7111474, -0.9315529, 0, 0, 0, 1, 1,
-1.06428, -0.921046, -1.366764, 0, 0, 0, 1, 1,
-1.061684, -0.730074, -3.000029, 0, 0, 0, 1, 1,
-1.058039, -0.08996601, -0.8210233, 0, 0, 0, 1, 1,
-1.050301, -0.2871058, -0.7006, 0, 0, 0, 1, 1,
-1.047789, -1.846216, -2.446234, 0, 0, 0, 1, 1,
-1.04323, 1.536512, 0.3397115, 1, 1, 1, 1, 1,
-1.042482, -0.5651218, -2.952153, 1, 1, 1, 1, 1,
-1.042115, 0.5081236, -2.99021, 1, 1, 1, 1, 1,
-1.040248, 0.3023916, -1.374115, 1, 1, 1, 1, 1,
-1.026674, 0.4388701, -0.9459128, 1, 1, 1, 1, 1,
-1.011389, 0.4292817, -1.450532, 1, 1, 1, 1, 1,
-1.010962, -0.1230031, -1.892453, 1, 1, 1, 1, 1,
-1.008223, -0.4482927, -3.619678, 1, 1, 1, 1, 1,
-1.005997, -0.3727022, -1.144985, 1, 1, 1, 1, 1,
-1.004972, 0.9852497, 0.6037334, 1, 1, 1, 1, 1,
-1.004, 0.1644883, -1.543004, 1, 1, 1, 1, 1,
-1.000415, 0.4622124, -4.064681, 1, 1, 1, 1, 1,
-0.9997917, 1.451399, 0.3294288, 1, 1, 1, 1, 1,
-0.9937449, -1.35357, -1.966041, 1, 1, 1, 1, 1,
-0.9898944, -2.433535, -0.2817936, 1, 1, 1, 1, 1,
-0.9886272, -0.7563205, -4.940826, 0, 0, 1, 1, 1,
-0.9868494, 1.716191, -0.05367566, 1, 0, 0, 1, 1,
-0.985499, 0.8174186, -0.4109697, 1, 0, 0, 1, 1,
-0.9837024, 0.7998625, -0.4139378, 1, 0, 0, 1, 1,
-0.9792693, 0.5264088, -1.015909, 1, 0, 0, 1, 1,
-0.9769869, -0.02348112, -1.737431, 1, 0, 0, 1, 1,
-0.9760326, -2.308157, -4.397364, 0, 0, 0, 1, 1,
-0.9725628, 0.9861176, -0.8937395, 0, 0, 0, 1, 1,
-0.9699609, 0.7159009, -0.6502063, 0, 0, 0, 1, 1,
-0.9679374, -0.6793987, -2.935046, 0, 0, 0, 1, 1,
-0.9613417, -0.4864686, -2.417369, 0, 0, 0, 1, 1,
-0.9590044, 2.291698, 0.0422205, 0, 0, 0, 1, 1,
-0.9445086, -1.343798, -2.459526, 0, 0, 0, 1, 1,
-0.9437113, 1.143526, -1.322121, 1, 1, 1, 1, 1,
-0.9414579, 0.3780273, -1.278716, 1, 1, 1, 1, 1,
-0.9407654, -0.7608704, -1.136174, 1, 1, 1, 1, 1,
-0.9355981, -1.172259, -3.64444, 1, 1, 1, 1, 1,
-0.9237294, -2.552806, -3.37067, 1, 1, 1, 1, 1,
-0.9229236, -0.6573693, -2.595645, 1, 1, 1, 1, 1,
-0.9172813, -0.7917283, -1.998756, 1, 1, 1, 1, 1,
-0.9165843, -0.1750011, -1.869672, 1, 1, 1, 1, 1,
-0.9155842, 0.4233167, -1.240815, 1, 1, 1, 1, 1,
-0.9071499, -0.4535261, -1.266029, 1, 1, 1, 1, 1,
-0.9038101, 0.5736735, 0.3010572, 1, 1, 1, 1, 1,
-0.9024493, 1.167517, -0.5269921, 1, 1, 1, 1, 1,
-0.8977419, -0.5908909, -1.795505, 1, 1, 1, 1, 1,
-0.891565, -0.4107181, -1.586172, 1, 1, 1, 1, 1,
-0.8902144, 0.6880365, -1.529182, 1, 1, 1, 1, 1,
-0.886416, -0.05937471, -1.960182, 0, 0, 1, 1, 1,
-0.8847571, -1.026962, -2.700891, 1, 0, 0, 1, 1,
-0.8846708, 1.70456, -0.331317, 1, 0, 0, 1, 1,
-0.8837029, 0.4609348, -2.426237, 1, 0, 0, 1, 1,
-0.8787721, 0.1832362, -3.088432, 1, 0, 0, 1, 1,
-0.8760771, -0.9688875, -1.882176, 1, 0, 0, 1, 1,
-0.8716309, 0.6070513, -0.377808, 0, 0, 0, 1, 1,
-0.8714786, -0.6977724, -0.6234447, 0, 0, 0, 1, 1,
-0.8714032, 0.1439183, -0.6278341, 0, 0, 0, 1, 1,
-0.8691666, 0.06214688, -1.141746, 0, 0, 0, 1, 1,
-0.8651192, 0.08451615, -1.351509, 0, 0, 0, 1, 1,
-0.8647604, 0.4738725, -1.731354, 0, 0, 0, 1, 1,
-0.8625131, 0.1402865, 0.2926837, 0, 0, 0, 1, 1,
-0.8518407, 0.6039608, -2.399791, 1, 1, 1, 1, 1,
-0.8452441, 0.7834895, -1.008506, 1, 1, 1, 1, 1,
-0.8444766, 1.828709, 0.08126387, 1, 1, 1, 1, 1,
-0.840695, -1.15543, -3.461959, 1, 1, 1, 1, 1,
-0.8344278, 0.3688332, -1.056623, 1, 1, 1, 1, 1,
-0.8307774, -1.895995, -1.890133, 1, 1, 1, 1, 1,
-0.8294964, 0.2071761, -0.1461793, 1, 1, 1, 1, 1,
-0.8227338, -0.1528176, -4.283481, 1, 1, 1, 1, 1,
-0.8196722, -1.227313, -2.41171, 1, 1, 1, 1, 1,
-0.8176771, -0.1477718, -2.057438, 1, 1, 1, 1, 1,
-0.8125892, 0.487809, -1.048916, 1, 1, 1, 1, 1,
-0.8115884, 1.556151, -0.1715125, 1, 1, 1, 1, 1,
-0.8005212, 0.9573081, -1.323002, 1, 1, 1, 1, 1,
-0.7985823, -0.1792577, 0.1079329, 1, 1, 1, 1, 1,
-0.7972823, -0.3642141, -2.335433, 1, 1, 1, 1, 1,
-0.7954708, 0.3480246, -2.457578, 0, 0, 1, 1, 1,
-0.795358, 0.1065024, -2.673018, 1, 0, 0, 1, 1,
-0.7949574, -1.380164, -1.752102, 1, 0, 0, 1, 1,
-0.7914587, 1.01449, 1.273024, 1, 0, 0, 1, 1,
-0.7911645, 0.9458997, -1.527504, 1, 0, 0, 1, 1,
-0.7861534, 0.5392252, -2.520987, 1, 0, 0, 1, 1,
-0.7805013, -0.1847274, -0.6980078, 0, 0, 0, 1, 1,
-0.7804654, -0.4331866, -2.332879, 0, 0, 0, 1, 1,
-0.7754566, 0.6896055, 2.112143, 0, 0, 0, 1, 1,
-0.7711084, -1.194886, -1.419454, 0, 0, 0, 1, 1,
-0.770878, -0.2003232, -1.541917, 0, 0, 0, 1, 1,
-0.7688732, 0.0519063, -1.638505, 0, 0, 0, 1, 1,
-0.7642981, 0.2220488, 0.2413708, 0, 0, 0, 1, 1,
-0.7449202, -0.4756064, -0.3463508, 1, 1, 1, 1, 1,
-0.7301929, -2.329934, -2.202902, 1, 1, 1, 1, 1,
-0.7270302, 0.1979621, -2.013212, 1, 1, 1, 1, 1,
-0.7267582, -0.6376204, -1.258443, 1, 1, 1, 1, 1,
-0.7249849, -1.866291, -2.401206, 1, 1, 1, 1, 1,
-0.7243947, 0.4220817, -2.832114, 1, 1, 1, 1, 1,
-0.7187943, -0.6894673, -3.715056, 1, 1, 1, 1, 1,
-0.7083426, 0.1802532, -0.545712, 1, 1, 1, 1, 1,
-0.7078905, -0.427753, -1.100103, 1, 1, 1, 1, 1,
-0.706898, -0.8995903, -2.152007, 1, 1, 1, 1, 1,
-0.7063685, 0.17826, -0.4578956, 1, 1, 1, 1, 1,
-0.7056971, 0.94662, -1.725347, 1, 1, 1, 1, 1,
-0.7005, 0.7647666, 1.084113, 1, 1, 1, 1, 1,
-0.6960143, -1.063797, -3.47066, 1, 1, 1, 1, 1,
-0.6935238, 0.03924846, -0.2222701, 1, 1, 1, 1, 1,
-0.68997, -0.7018229, -2.535729, 0, 0, 1, 1, 1,
-0.6844329, -0.5094129, -1.829375, 1, 0, 0, 1, 1,
-0.6822411, -1.902452, -2.638412, 1, 0, 0, 1, 1,
-0.6803972, 0.06885417, -1.564049, 1, 0, 0, 1, 1,
-0.6673207, -0.2905759, -1.121356, 1, 0, 0, 1, 1,
-0.6647478, -1.169415, -2.235144, 1, 0, 0, 1, 1,
-0.6637415, -1.113779, -3.066037, 0, 0, 0, 1, 1,
-0.6628792, -1.272533, -1.972139, 0, 0, 0, 1, 1,
-0.6624243, 0.7896276, 0.08249379, 0, 0, 0, 1, 1,
-0.6609589, 0.4519331, -0.343742, 0, 0, 0, 1, 1,
-0.6605123, -0.08294177, -1.037618, 0, 0, 0, 1, 1,
-0.6594157, -1.205876, -1.836775, 0, 0, 0, 1, 1,
-0.6560627, 0.2958579, -1.190899, 0, 0, 0, 1, 1,
-0.647611, 0.4819762, -0.3917629, 1, 1, 1, 1, 1,
-0.6464819, -1.643999, -3.994703, 1, 1, 1, 1, 1,
-0.6421369, 1.557226, -0.6380913, 1, 1, 1, 1, 1,
-0.6401038, -0.000166079, -2.219894, 1, 1, 1, 1, 1,
-0.6376837, -1.309562, -1.064142, 1, 1, 1, 1, 1,
-0.6361382, 0.8832235, -0.4611671, 1, 1, 1, 1, 1,
-0.6282339, 0.3034096, -0.6663252, 1, 1, 1, 1, 1,
-0.6271024, -0.5570163, -2.43002, 1, 1, 1, 1, 1,
-0.6244186, 0.5185326, 0.6098557, 1, 1, 1, 1, 1,
-0.61862, -2.332979, -4.747493, 1, 1, 1, 1, 1,
-0.6156933, 0.2641538, -0.787823, 1, 1, 1, 1, 1,
-0.615491, 0.6859692, 2.345926, 1, 1, 1, 1, 1,
-0.613472, -0.7262153, -2.371197, 1, 1, 1, 1, 1,
-0.6123257, 0.2129733, -2.607336, 1, 1, 1, 1, 1,
-0.6116704, -1.139523, -1.856552, 1, 1, 1, 1, 1,
-0.6082513, -0.3225769, -2.654209, 0, 0, 1, 1, 1,
-0.6070772, -1.005125, -2.021293, 1, 0, 0, 1, 1,
-0.6012574, -1.537129, -2.864872, 1, 0, 0, 1, 1,
-0.5995451, 0.1576619, 0.3836749, 1, 0, 0, 1, 1,
-0.5980919, 0.2888373, -0.87901, 1, 0, 0, 1, 1,
-0.591591, 0.4486603, 0.5728942, 1, 0, 0, 1, 1,
-0.5903361, -0.04434724, -0.1154941, 0, 0, 0, 1, 1,
-0.5897714, 1.181795, -0.1209568, 0, 0, 0, 1, 1,
-0.5874243, -1.050495, -4.210001, 0, 0, 0, 1, 1,
-0.5829892, 1.56005, -0.3755009, 0, 0, 0, 1, 1,
-0.5735693, 0.3538654, 0.3149289, 0, 0, 0, 1, 1,
-0.5679842, 0.1603104, 0.7184307, 0, 0, 0, 1, 1,
-0.5581993, 0.9133046, -1.856375, 0, 0, 0, 1, 1,
-0.5570958, -1.404325, -5.304108, 1, 1, 1, 1, 1,
-0.5493268, -0.7883541, -1.571275, 1, 1, 1, 1, 1,
-0.5477197, -1.117256, -4.067271, 1, 1, 1, 1, 1,
-0.5461494, 0.7791793, -0.02512019, 1, 1, 1, 1, 1,
-0.542663, -0.3919223, -2.363936, 1, 1, 1, 1, 1,
-0.5426083, 0.2628728, -0.1413063, 1, 1, 1, 1, 1,
-0.5420293, -0.1169923, -1.875456, 1, 1, 1, 1, 1,
-0.5401019, -0.8290834, -3.355756, 1, 1, 1, 1, 1,
-0.5390477, 1.722185, -1.053214, 1, 1, 1, 1, 1,
-0.5353524, 1.205847, 0.218324, 1, 1, 1, 1, 1,
-0.5342816, -0.06099455, -2.761412, 1, 1, 1, 1, 1,
-0.5341106, 0.5362321, -2.329434, 1, 1, 1, 1, 1,
-0.5332357, 0.6108446, -1.166082, 1, 1, 1, 1, 1,
-0.5327924, -0.1516597, -1.689911, 1, 1, 1, 1, 1,
-0.5301903, -0.62086, -2.511042, 1, 1, 1, 1, 1,
-0.5298728, -1.026777, -2.79142, 0, 0, 1, 1, 1,
-0.5289348, 0.4088728, 1.012673, 1, 0, 0, 1, 1,
-0.5256338, 1.278621, 0.09126328, 1, 0, 0, 1, 1,
-0.5242165, -1.491972, -2.943622, 1, 0, 0, 1, 1,
-0.5208024, 1.822431, -1.140215, 1, 0, 0, 1, 1,
-0.5164691, -0.04941949, -1.547551, 1, 0, 0, 1, 1,
-0.5132418, 0.8010449, -2.548418, 0, 0, 0, 1, 1,
-0.5094243, -0.7231642, -2.57075, 0, 0, 0, 1, 1,
-0.508505, -0.3855581, -2.580991, 0, 0, 0, 1, 1,
-0.507864, 1.050814, 0.02615816, 0, 0, 0, 1, 1,
-0.5052418, 2.337085, -0.455849, 0, 0, 0, 1, 1,
-0.503883, -0.2999058, -1.9656, 0, 0, 0, 1, 1,
-0.5035373, -1.798223, -3.276805, 0, 0, 0, 1, 1,
-0.5023596, -0.09931599, -1.884161, 1, 1, 1, 1, 1,
-0.4971873, 0.9406462, 0.3954907, 1, 1, 1, 1, 1,
-0.4899132, -0.02948307, 0.09055452, 1, 1, 1, 1, 1,
-0.4768012, -0.2922457, -2.618678, 1, 1, 1, 1, 1,
-0.4726918, 2.302523, -0.3107599, 1, 1, 1, 1, 1,
-0.4726167, -0.564625, -2.408185, 1, 1, 1, 1, 1,
-0.4703641, -0.3857853, -3.560742, 1, 1, 1, 1, 1,
-0.4679125, -0.3363694, -1.056875, 1, 1, 1, 1, 1,
-0.4657224, -1.192404, -4.299488, 1, 1, 1, 1, 1,
-0.4653813, 1.560459, -0.4942847, 1, 1, 1, 1, 1,
-0.4638973, -0.7607853, -3.649378, 1, 1, 1, 1, 1,
-0.4555811, -0.5989729, -3.105775, 1, 1, 1, 1, 1,
-0.454325, 0.5760689, -1.644495, 1, 1, 1, 1, 1,
-0.4523964, -1.559877, -3.472917, 1, 1, 1, 1, 1,
-0.4502016, -0.04047196, -1.04027, 1, 1, 1, 1, 1,
-0.4461528, -1.332088, -4.072612, 0, 0, 1, 1, 1,
-0.4461235, -1.054113, -3.459819, 1, 0, 0, 1, 1,
-0.44384, 0.5234388, 2.134849, 1, 0, 0, 1, 1,
-0.4434572, -0.3775051, -3.542557, 1, 0, 0, 1, 1,
-0.4422226, 0.1415851, -1.228759, 1, 0, 0, 1, 1,
-0.4351886, -0.6225581, -4.012632, 1, 0, 0, 1, 1,
-0.4347596, -0.2656395, -0.9947148, 0, 0, 0, 1, 1,
-0.4346683, 0.02026077, 0.2127778, 0, 0, 0, 1, 1,
-0.4124051, -0.396685, -2.244086, 0, 0, 0, 1, 1,
-0.4123937, -1.247838, -3.852388, 0, 0, 0, 1, 1,
-0.408299, -1.544564, -2.068037, 0, 0, 0, 1, 1,
-0.3936803, 0.4154598, -0.3275586, 0, 0, 0, 1, 1,
-0.3935945, -1.327237, -1.701827, 0, 0, 0, 1, 1,
-0.387899, -1.131571, -1.826214, 1, 1, 1, 1, 1,
-0.3845365, -0.619646, -3.620017, 1, 1, 1, 1, 1,
-0.3825333, -1.05855, -1.784793, 1, 1, 1, 1, 1,
-0.3807091, 0.8664028, -0.2876474, 1, 1, 1, 1, 1,
-0.3805977, -0.2043847, -0.8477119, 1, 1, 1, 1, 1,
-0.3795668, 0.04482886, -0.1827172, 1, 1, 1, 1, 1,
-0.3776447, -0.005696115, -0.9203694, 1, 1, 1, 1, 1,
-0.3702667, -0.5368178, -2.316861, 1, 1, 1, 1, 1,
-0.3663812, 1.424557, -1.294148, 1, 1, 1, 1, 1,
-0.3655244, 1.572697, -0.1038577, 1, 1, 1, 1, 1,
-0.3546872, 0.7725591, -0.04224736, 1, 1, 1, 1, 1,
-0.3524194, -0.213105, -0.9701461, 1, 1, 1, 1, 1,
-0.3511383, -1.156743, -3.631845, 1, 1, 1, 1, 1,
-0.3498484, 0.9790262, 0.0548857, 1, 1, 1, 1, 1,
-0.3461677, 0.1066778, -1.566492, 1, 1, 1, 1, 1,
-0.3410978, 1.50072, -0.9330185, 0, 0, 1, 1, 1,
-0.3375256, -0.0102354, -1.780178, 1, 0, 0, 1, 1,
-0.3367221, 0.8191786, -0.5030106, 1, 0, 0, 1, 1,
-0.3351744, -1.559755, -3.469104, 1, 0, 0, 1, 1,
-0.3338106, -0.3413152, -1.746168, 1, 0, 0, 1, 1,
-0.3319983, 0.201393, -3.542932, 1, 0, 0, 1, 1,
-0.3316661, 0.512867, 1.100797, 0, 0, 0, 1, 1,
-0.3298804, 1.005884, -0.8906605, 0, 0, 0, 1, 1,
-0.3298229, -1.091305, -2.99047, 0, 0, 0, 1, 1,
-0.3294034, -0.2077584, -1.987157, 0, 0, 0, 1, 1,
-0.3261233, 1.56574, -0.4402051, 0, 0, 0, 1, 1,
-0.3250154, -0.037535, -3.040014, 0, 0, 0, 1, 1,
-0.3219824, -0.731749, -3.473575, 0, 0, 0, 1, 1,
-0.3176865, -1.000055, -3.305874, 1, 1, 1, 1, 1,
-0.3159601, 0.3619861, -0.7966439, 1, 1, 1, 1, 1,
-0.3141184, -0.584688, -2.697011, 1, 1, 1, 1, 1,
-0.3073241, -1.492569, -0.9700261, 1, 1, 1, 1, 1,
-0.3049303, -0.4128832, -4.813154, 1, 1, 1, 1, 1,
-0.2984196, 1.224766, 0.9696209, 1, 1, 1, 1, 1,
-0.2941856, -0.4630513, -2.779058, 1, 1, 1, 1, 1,
-0.2912503, 0.6111214, 0.1821628, 1, 1, 1, 1, 1,
-0.2870831, -0.6841518, -4.480341, 1, 1, 1, 1, 1,
-0.2756613, -1.642963, -2.91151, 1, 1, 1, 1, 1,
-0.2750502, 0.2310525, -0.8626553, 1, 1, 1, 1, 1,
-0.2743548, 0.2561716, -1.236927, 1, 1, 1, 1, 1,
-0.2719079, 0.9953999, -1.572537, 1, 1, 1, 1, 1,
-0.269985, 0.882211, 0.9543769, 1, 1, 1, 1, 1,
-0.266351, -0.454275, -3.598735, 1, 1, 1, 1, 1,
-0.2649785, -0.7477133, -2.454159, 0, 0, 1, 1, 1,
-0.2630119, 0.6849398, -0.4306872, 1, 0, 0, 1, 1,
-0.2609819, 0.7179013, -1.778872, 1, 0, 0, 1, 1,
-0.2603697, 0.5569357, -0.1687635, 1, 0, 0, 1, 1,
-0.2587191, -0.08637639, -1.195555, 1, 0, 0, 1, 1,
-0.2555419, -0.1706354, -2.719636, 1, 0, 0, 1, 1,
-0.2510474, -1.518781, -3.510215, 0, 0, 0, 1, 1,
-0.2506161, -0.7097206, -2.677171, 0, 0, 0, 1, 1,
-0.2493191, 0.1405993, -1.097115, 0, 0, 0, 1, 1,
-0.2458913, 1.272419, -0.260476, 0, 0, 0, 1, 1,
-0.242587, -1.080987, -4.049001, 0, 0, 0, 1, 1,
-0.2420349, 0.6022336, -1.501928, 0, 0, 0, 1, 1,
-0.2353224, 1.046933, 1.641578, 0, 0, 0, 1, 1,
-0.2330297, -0.7653896, -4.254186, 1, 1, 1, 1, 1,
-0.2311437, 0.3025879, 0.7937735, 1, 1, 1, 1, 1,
-0.2288963, -0.6452488, -2.656362, 1, 1, 1, 1, 1,
-0.2278705, -1.460028, -4.968816, 1, 1, 1, 1, 1,
-0.226517, -1.06746, -2.187885, 1, 1, 1, 1, 1,
-0.2247858, -0.4796762, -2.637247, 1, 1, 1, 1, 1,
-0.224677, 0.2399988, 1.586385, 1, 1, 1, 1, 1,
-0.2174089, 0.2447176, -1.423777, 1, 1, 1, 1, 1,
-0.215375, -1.666694, -0.7028233, 1, 1, 1, 1, 1,
-0.2139303, 0.2890592, -0.3721938, 1, 1, 1, 1, 1,
-0.2104479, 0.4359356, 0.9150556, 1, 1, 1, 1, 1,
-0.203888, -1.794427, -1.74506, 1, 1, 1, 1, 1,
-0.2036731, -0.3296065, -2.126726, 1, 1, 1, 1, 1,
-0.203402, -2.336993, -3.645755, 1, 1, 1, 1, 1,
-0.197522, 0.514206, -1.153813, 1, 1, 1, 1, 1,
-0.1887256, 0.1324849, -1.467337, 0, 0, 1, 1, 1,
-0.1875295, -0.604868, -2.164088, 1, 0, 0, 1, 1,
-0.1869092, 0.6967434, 0.377642, 1, 0, 0, 1, 1,
-0.1748195, -0.7642115, -1.450935, 1, 0, 0, 1, 1,
-0.1720911, -1.653328, -3.556531, 1, 0, 0, 1, 1,
-0.1714779, 0.8689573, -0.8173608, 1, 0, 0, 1, 1,
-0.1708414, -1.425598, -2.765974, 0, 0, 0, 1, 1,
-0.1693782, -0.7485469, -1.636409, 0, 0, 0, 1, 1,
-0.1685151, 0.7566799, 0.1632532, 0, 0, 0, 1, 1,
-0.1613619, -0.4204949, -2.871327, 0, 0, 0, 1, 1,
-0.1602504, -0.736017, -4.807822, 0, 0, 0, 1, 1,
-0.1580267, 0.1268951, 0.1312282, 0, 0, 0, 1, 1,
-0.1550652, -0.4480367, -3.101243, 0, 0, 0, 1, 1,
-0.1528664, 0.4807145, -0.1891164, 1, 1, 1, 1, 1,
-0.1524627, -0.1633317, -3.715655, 1, 1, 1, 1, 1,
-0.1504404, 0.3045736, -0.3052661, 1, 1, 1, 1, 1,
-0.1475782, 0.5581792, -2.492283, 1, 1, 1, 1, 1,
-0.1473981, -1.380875, -2.644129, 1, 1, 1, 1, 1,
-0.1470521, 0.1906614, -0.7742735, 1, 1, 1, 1, 1,
-0.1326337, -1.398925, -2.640772, 1, 1, 1, 1, 1,
-0.1287044, 0.3565199, 0.9708298, 1, 1, 1, 1, 1,
-0.1218647, 0.4406573, 0.42011, 1, 1, 1, 1, 1,
-0.1207039, -1.775292, -4.518957, 1, 1, 1, 1, 1,
-0.1205087, -0.5697987, -3.647665, 1, 1, 1, 1, 1,
-0.1201517, -1.509339, -2.50556, 1, 1, 1, 1, 1,
-0.1149125, 0.4617446, -0.06380891, 1, 1, 1, 1, 1,
-0.1136364, 1.523616, 1.369588, 1, 1, 1, 1, 1,
-0.113505, -0.1106398, -3.718673, 1, 1, 1, 1, 1,
-0.1085777, 0.1842271, -1.163142, 0, 0, 1, 1, 1,
-0.1066359, 0.7720484, -2.251289, 1, 0, 0, 1, 1,
-0.1063062, 1.04798, 0.4611709, 1, 0, 0, 1, 1,
-0.105175, 0.2401557, -3.061488, 1, 0, 0, 1, 1,
-0.1050683, -1.096309, -2.535277, 1, 0, 0, 1, 1,
-0.09787399, -0.8983544, -3.572572, 1, 0, 0, 1, 1,
-0.0937907, 0.7945086, -0.9142285, 0, 0, 0, 1, 1,
-0.09360421, 1.395217, 1.03435, 0, 0, 0, 1, 1,
-0.09292211, 0.5072261, 0.4632967, 0, 0, 0, 1, 1,
-0.09171821, -0.01243407, -2.383744, 0, 0, 0, 1, 1,
-0.08405066, -0.1358101, -2.384154, 0, 0, 0, 1, 1,
-0.07820369, -1.033976, -3.331022, 0, 0, 0, 1, 1,
-0.07811823, 0.3683063, -0.567559, 0, 0, 0, 1, 1,
-0.07731846, -1.248461, -4.994577, 1, 1, 1, 1, 1,
-0.07559945, -3.12817, -2.462436, 1, 1, 1, 1, 1,
-0.07540388, 0.3420382, -1.363305, 1, 1, 1, 1, 1,
-0.0752007, -0.4396283, -1.901622, 1, 1, 1, 1, 1,
-0.07477231, 2.06087, 0.5915259, 1, 1, 1, 1, 1,
-0.07365688, 0.6422825, -1.386942, 1, 1, 1, 1, 1,
-0.07179545, -0.1067374, -4.009885, 1, 1, 1, 1, 1,
-0.06221816, -0.1840867, -2.784541, 1, 1, 1, 1, 1,
-0.06143959, 1.011425, -0.2485234, 1, 1, 1, 1, 1,
-0.06084721, -0.7284102, -4.752727, 1, 1, 1, 1, 1,
-0.06029484, 0.2486499, -0.7131923, 1, 1, 1, 1, 1,
-0.06022094, 0.4706067, -1.813951, 1, 1, 1, 1, 1,
-0.05873288, -1.196947, -2.821424, 1, 1, 1, 1, 1,
-0.05850381, 1.025595, -0.7226803, 1, 1, 1, 1, 1,
-0.05831395, -2.792212, -1.297505, 1, 1, 1, 1, 1,
-0.05785437, -1.261343, -4.079777, 0, 0, 1, 1, 1,
-0.05575515, -0.7486477, -4.456925, 1, 0, 0, 1, 1,
-0.05252292, -0.1528211, -3.833509, 1, 0, 0, 1, 1,
-0.04640531, -1.240329, -3.268965, 1, 0, 0, 1, 1,
-0.04168329, -0.6335775, -2.154782, 1, 0, 0, 1, 1,
-0.03542639, 0.2914734, -0.2948853, 1, 0, 0, 1, 1,
-0.03414679, -1.986653, -3.297044, 0, 0, 0, 1, 1,
-0.03354345, 2.345601, 1.760739, 0, 0, 0, 1, 1,
-0.03211841, -0.9094584, -2.249977, 0, 0, 0, 1, 1,
-0.03194967, -0.05847337, -2.413661, 0, 0, 0, 1, 1,
-0.0307663, -1.284418, -3.858802, 0, 0, 0, 1, 1,
-0.02652104, 0.0661615, -1.352242, 0, 0, 0, 1, 1,
-0.02612171, 0.9679797, 0.1107127, 0, 0, 0, 1, 1,
-0.02416306, 0.6025558, 0.9096991, 1, 1, 1, 1, 1,
-0.02313803, 0.1964971, 0.6878175, 1, 1, 1, 1, 1,
-0.02267478, 1.840711, -0.526976, 1, 1, 1, 1, 1,
-0.02041247, -0.4681502, -2.877693, 1, 1, 1, 1, 1,
-0.01384779, -1.589509, -3.54505, 1, 1, 1, 1, 1,
-0.01228261, 0.8526244, 1.793087, 1, 1, 1, 1, 1,
-0.01213511, -1.669634, -4.079629, 1, 1, 1, 1, 1,
-0.01188139, 0.6525797, -1.158731, 1, 1, 1, 1, 1,
-0.01137935, 0.7823511, -0.3071924, 1, 1, 1, 1, 1,
-0.007898904, -1.52123, -3.317178, 1, 1, 1, 1, 1,
-0.007228403, -0.2345674, -2.086142, 1, 1, 1, 1, 1,
-0.005163594, -0.7809926, -4.228166, 1, 1, 1, 1, 1,
-0.004862292, -0.6727763, -1.722432, 1, 1, 1, 1, 1,
-0.003103888, 0.001155723, -2.106068, 1, 1, 1, 1, 1,
-0.001940523, 0.7054693, -0.4775931, 1, 1, 1, 1, 1,
-0.0002982464, -1.361056, -2.3414, 0, 0, 1, 1, 1,
-7.536632e-05, -1.944268, -2.847514, 1, 0, 0, 1, 1,
0.00144208, -1.282274, 4.583062, 1, 0, 0, 1, 1,
0.003028168, -0.4393909, 3.906025, 1, 0, 0, 1, 1,
0.008419976, 0.8661017, -0.160808, 1, 0, 0, 1, 1,
0.01292918, 1.73635, 0.9110141, 1, 0, 0, 1, 1,
0.01379588, 1.181213, -0.1008411, 0, 0, 0, 1, 1,
0.01507847, -0.07567691, 4.868951, 0, 0, 0, 1, 1,
0.01618537, 0.5344833, 0.1212716, 0, 0, 0, 1, 1,
0.01823987, 0.1677283, 0.02084304, 0, 0, 0, 1, 1,
0.02022656, 0.7477444, -1.590398, 0, 0, 0, 1, 1,
0.02043012, -0.6819142, 2.644723, 0, 0, 0, 1, 1,
0.02076355, 1.459818, 0.01840025, 0, 0, 0, 1, 1,
0.02097164, 1.055016, -0.3152802, 1, 1, 1, 1, 1,
0.02814635, 0.7730046, -0.816498, 1, 1, 1, 1, 1,
0.0342432, 2.155148, 0.8582883, 1, 1, 1, 1, 1,
0.03604143, 0.697794, 0.397897, 1, 1, 1, 1, 1,
0.03733216, 1.982815, 1.061731, 1, 1, 1, 1, 1,
0.03906932, -0.4296425, 4.150053, 1, 1, 1, 1, 1,
0.04524843, 0.2739516, 0.4904146, 1, 1, 1, 1, 1,
0.04613415, -0.8696508, 2.889106, 1, 1, 1, 1, 1,
0.05010445, -0.5557063, 5.143483, 1, 1, 1, 1, 1,
0.05127015, -0.8636934, 1.577929, 1, 1, 1, 1, 1,
0.05444505, -0.464415, 2.084754, 1, 1, 1, 1, 1,
0.05484308, -0.8056219, 3.231561, 1, 1, 1, 1, 1,
0.05577698, 1.224854, -0.5442063, 1, 1, 1, 1, 1,
0.05583751, -1.141971, 4.438533, 1, 1, 1, 1, 1,
0.0591864, -0.9364529, 1.433893, 1, 1, 1, 1, 1,
0.06155857, 0.8907402, 1.396368, 0, 0, 1, 1, 1,
0.0635302, 0.07974323, 0.4985679, 1, 0, 0, 1, 1,
0.06375822, 1.051909, -0.6567063, 1, 0, 0, 1, 1,
0.06704975, 0.07509662, 0.590148, 1, 0, 0, 1, 1,
0.06792068, -0.2714355, 1.153062, 1, 0, 0, 1, 1,
0.0696511, -0.4184358, 2.172762, 1, 0, 0, 1, 1,
0.07718872, 0.9807888, -2.928675, 0, 0, 0, 1, 1,
0.08049971, -1.464435, 3.91391, 0, 0, 0, 1, 1,
0.08076769, -0.02962109, 3.943592, 0, 0, 0, 1, 1,
0.08335924, -0.1563275, 1.629997, 0, 0, 0, 1, 1,
0.08472128, -0.7254944, 4.627284, 0, 0, 0, 1, 1,
0.08723117, -1.139237, 3.966117, 0, 0, 0, 1, 1,
0.09193119, -0.5451241, 2.807696, 0, 0, 0, 1, 1,
0.09387676, 0.3451, -0.08583066, 1, 1, 1, 1, 1,
0.09518167, -0.421826, 1.032217, 1, 1, 1, 1, 1,
0.09653853, -0.4049257, 2.919845, 1, 1, 1, 1, 1,
0.09971642, -0.6895768, 2.884159, 1, 1, 1, 1, 1,
0.1014105, -1.446215, 2.887635, 1, 1, 1, 1, 1,
0.1079867, -0.2599204, 3.226404, 1, 1, 1, 1, 1,
0.1083824, 0.0755072, 1.773505, 1, 1, 1, 1, 1,
0.1102606, -0.6330348, 3.236589, 1, 1, 1, 1, 1,
0.1106206, -0.5128975, 2.141738, 1, 1, 1, 1, 1,
0.1157594, -0.05146988, 2.140475, 1, 1, 1, 1, 1,
0.1236874, -2.584343, 2.918593, 1, 1, 1, 1, 1,
0.1243375, -1.118913, 4.181492, 1, 1, 1, 1, 1,
0.141413, 0.1681783, -1.044685, 1, 1, 1, 1, 1,
0.1438469, -0.08195242, 1.968255, 1, 1, 1, 1, 1,
0.145749, 1.20716, -0.6706482, 1, 1, 1, 1, 1,
0.1472574, 2.274541, 0.9266282, 0, 0, 1, 1, 1,
0.1592266, 1.021469, -1.05386, 1, 0, 0, 1, 1,
0.1607015, -2.037875, 3.171814, 1, 0, 0, 1, 1,
0.1643241, 1.644687, -0.2771021, 1, 0, 0, 1, 1,
0.1658712, 2.012042, -1.250393, 1, 0, 0, 1, 1,
0.1671028, -0.6925557, 2.841839, 1, 0, 0, 1, 1,
0.1694235, -0.7722595, 4.280255, 0, 0, 0, 1, 1,
0.1759427, 1.271603, 0.3208678, 0, 0, 0, 1, 1,
0.1827997, -0.2656564, 0.9766915, 0, 0, 0, 1, 1,
0.1854381, 0.4879344, 1.227826, 0, 0, 0, 1, 1,
0.1869449, -0.5696328, 2.340651, 0, 0, 0, 1, 1,
0.1870657, -1.092788, 3.272844, 0, 0, 0, 1, 1,
0.1870887, -1.201454, 2.018341, 0, 0, 0, 1, 1,
0.1893988, 2.424286, 0.07095695, 1, 1, 1, 1, 1,
0.1929837, -0.250722, 2.385698, 1, 1, 1, 1, 1,
0.1975026, 2.125634, 1.512393, 1, 1, 1, 1, 1,
0.1986306, -0.7100111, 2.645756, 1, 1, 1, 1, 1,
0.200115, 0.4951705, 0.5714145, 1, 1, 1, 1, 1,
0.2006493, -0.5727109, 3.352575, 1, 1, 1, 1, 1,
0.2007464, 0.2664038, -0.8592239, 1, 1, 1, 1, 1,
0.202178, -0.2300336, 2.179519, 1, 1, 1, 1, 1,
0.2054911, 0.4936241, -1.150718, 1, 1, 1, 1, 1,
0.2084969, -0.9079738, 1.690598, 1, 1, 1, 1, 1,
0.2104878, -1.166579, 1.782471, 1, 1, 1, 1, 1,
0.2123358, -1.025794, 2.924461, 1, 1, 1, 1, 1,
0.2133907, -1.511008, 5.804394, 1, 1, 1, 1, 1,
0.2145988, 0.09685749, 0.6949635, 1, 1, 1, 1, 1,
0.2184939, 1.353169, -0.3868433, 1, 1, 1, 1, 1,
0.2219355, -0.07003247, 4.96349, 0, 0, 1, 1, 1,
0.2256412, -0.0238352, 3.232663, 1, 0, 0, 1, 1,
0.2311453, 1.623212, 0.5686267, 1, 0, 0, 1, 1,
0.2346684, 0.2570912, 0.7440751, 1, 0, 0, 1, 1,
0.240381, -0.2046775, 2.494897, 1, 0, 0, 1, 1,
0.2423451, -0.08763962, 2.786082, 1, 0, 0, 1, 1,
0.2430108, 1.064768, 1.077791, 0, 0, 0, 1, 1,
0.2500107, 0.6679277, -0.3315632, 0, 0, 0, 1, 1,
0.2504483, 0.8846211, -0.4117927, 0, 0, 0, 1, 1,
0.2530662, 1.021263, -1.868112, 0, 0, 0, 1, 1,
0.253368, -0.03258077, 1.458575, 0, 0, 0, 1, 1,
0.2536149, 0.1670642, 1.708358, 0, 0, 0, 1, 1,
0.2643333, 0.8076684, 0.1051425, 0, 0, 0, 1, 1,
0.2652563, -0.3463957, 4.20051, 1, 1, 1, 1, 1,
0.2670843, -1.821974, 3.364621, 1, 1, 1, 1, 1,
0.2686476, 0.2994831, 1.352746, 1, 1, 1, 1, 1,
0.2687486, -0.6408081, 4.294089, 1, 1, 1, 1, 1,
0.2760401, -0.6571083, 2.692433, 1, 1, 1, 1, 1,
0.2785645, -0.7388713, 2.159521, 1, 1, 1, 1, 1,
0.281601, 1.634612, 1.30704, 1, 1, 1, 1, 1,
0.2834981, 0.3402919, 1.040578, 1, 1, 1, 1, 1,
0.2864065, -0.2900257, 2.294668, 1, 1, 1, 1, 1,
0.286925, 0.3668136, -0.3097586, 1, 1, 1, 1, 1,
0.2925294, 0.6463049, 0.3127009, 1, 1, 1, 1, 1,
0.2925342, 0.6179585, 1.168919, 1, 1, 1, 1, 1,
0.2928184, -1.475335, 1.476172, 1, 1, 1, 1, 1,
0.2952325, -1.483825, 4.44328, 1, 1, 1, 1, 1,
0.299757, 0.5859918, -0.3398083, 1, 1, 1, 1, 1,
0.3006253, 0.3958737, 0.7218007, 0, 0, 1, 1, 1,
0.3032758, -0.5629273, 2.262414, 1, 0, 0, 1, 1,
0.3049474, 1.551141, 0.1044005, 1, 0, 0, 1, 1,
0.3090908, 1.389711, 0.1984055, 1, 0, 0, 1, 1,
0.3139576, 0.04957391, 0.7588181, 1, 0, 0, 1, 1,
0.3154996, -0.3267387, 2.920318, 1, 0, 0, 1, 1,
0.3163204, 0.3469911, 3.190664, 0, 0, 0, 1, 1,
0.3203428, 0.9093201, -0.4770912, 0, 0, 0, 1, 1,
0.3226204, 0.1716342, 0.7406113, 0, 0, 0, 1, 1,
0.3273725, -1.336028, 4.782925, 0, 0, 0, 1, 1,
0.3324108, -2.042213, 4.762145, 0, 0, 0, 1, 1,
0.3328563, -0.7184532, 2.613101, 0, 0, 0, 1, 1,
0.3334913, 0.1796209, 1.710585, 0, 0, 0, 1, 1,
0.3382214, 0.435636, 1.957972, 1, 1, 1, 1, 1,
0.3385069, -0.4614324, 3.137443, 1, 1, 1, 1, 1,
0.338554, 0.1400695, 0.8233018, 1, 1, 1, 1, 1,
0.3395593, -0.05240088, 1.246505, 1, 1, 1, 1, 1,
0.3489889, 1.923608, -0.6153616, 1, 1, 1, 1, 1,
0.3532195, 0.6106451, -0.5485322, 1, 1, 1, 1, 1,
0.3541967, -0.5799939, 2.973411, 1, 1, 1, 1, 1,
0.3548017, -0.5408178, 2.859055, 1, 1, 1, 1, 1,
0.3571405, 1.275557, -1.031179, 1, 1, 1, 1, 1,
0.3582498, 0.9181072, -0.1028755, 1, 1, 1, 1, 1,
0.3621377, 0.8677211, 1.068105, 1, 1, 1, 1, 1,
0.3648143, -0.437357, 3.36823, 1, 1, 1, 1, 1,
0.3674158, 0.3891727, -0.7586183, 1, 1, 1, 1, 1,
0.3683423, -1.720809, 3.291705, 1, 1, 1, 1, 1,
0.3699179, 0.9277259, -0.7440094, 1, 1, 1, 1, 1,
0.372797, -0.2136442, 4.018718, 0, 0, 1, 1, 1,
0.3767344, 0.2514729, 1.330173, 1, 0, 0, 1, 1,
0.3780618, -1.560328, 1.60239, 1, 0, 0, 1, 1,
0.3789529, -0.9530007, 3.742988, 1, 0, 0, 1, 1,
0.3802519, 1.537102, -0.3456205, 1, 0, 0, 1, 1,
0.3806421, -0.1963257, 0.2909371, 1, 0, 0, 1, 1,
0.3831517, -0.5156211, 1.96902, 0, 0, 0, 1, 1,
0.3841024, -0.6079929, 2.523007, 0, 0, 0, 1, 1,
0.384769, 0.04093332, 0.2326564, 0, 0, 0, 1, 1,
0.3853247, 1.309354, 0.6169888, 0, 0, 0, 1, 1,
0.3887904, -0.2659568, 1.686058, 0, 0, 0, 1, 1,
0.3908892, 0.819495, -0.4545006, 0, 0, 0, 1, 1,
0.393099, -0.538094, 1.49594, 0, 0, 0, 1, 1,
0.3992948, 0.2538249, 1.063563, 1, 1, 1, 1, 1,
0.4009992, 0.7905149, 0.4942076, 1, 1, 1, 1, 1,
0.4012833, 1.733943, 0.9827395, 1, 1, 1, 1, 1,
0.4020886, -0.5589759, 1.439701, 1, 1, 1, 1, 1,
0.4043561, -1.040296, 3.539535, 1, 1, 1, 1, 1,
0.4074127, -1.378833, 4.086941, 1, 1, 1, 1, 1,
0.4097782, 1.406547, -1.588408, 1, 1, 1, 1, 1,
0.4100253, 0.6079781, 0.02600363, 1, 1, 1, 1, 1,
0.4114915, -1.648509, 1.909066, 1, 1, 1, 1, 1,
0.4123843, 0.2830427, 2.997133, 1, 1, 1, 1, 1,
0.4148726, 0.6477785, -0.1137254, 1, 1, 1, 1, 1,
0.4155561, 0.6564746, -0.2478134, 1, 1, 1, 1, 1,
0.4162461, 0.4654316, 0.2838775, 1, 1, 1, 1, 1,
0.4181845, 2.229898, -1.330569, 1, 1, 1, 1, 1,
0.4230483, -0.7590585, 1.294521, 1, 1, 1, 1, 1,
0.4310455, -0.3203067, 2.528907, 0, 0, 1, 1, 1,
0.4320929, -2.001393, 4.860208, 1, 0, 0, 1, 1,
0.435214, 1.016987, -0.3877844, 1, 0, 0, 1, 1,
0.4369364, 0.4774839, 1.618061, 1, 0, 0, 1, 1,
0.4431269, -0.5624779, 1.085193, 1, 0, 0, 1, 1,
0.4473264, 0.02960162, 2.392272, 1, 0, 0, 1, 1,
0.4491603, 0.03096377, 0.9429188, 0, 0, 0, 1, 1,
0.450283, 1.187825, -0.1099656, 0, 0, 0, 1, 1,
0.4528016, -0.4885447, 0.9840193, 0, 0, 0, 1, 1,
0.4568973, -0.2925312, 3.384642, 0, 0, 0, 1, 1,
0.4589221, 2.023973, -0.1866575, 0, 0, 0, 1, 1,
0.4637838, -0.3622761, 2.983977, 0, 0, 0, 1, 1,
0.4644994, -0.4665802, 1.135893, 0, 0, 0, 1, 1,
0.4648135, 0.570127, -0.03812892, 1, 1, 1, 1, 1,
0.4667771, 0.8480493, 0.5532075, 1, 1, 1, 1, 1,
0.4766728, -0.1649925, 2.059332, 1, 1, 1, 1, 1,
0.4780991, 0.2175139, 1.545861, 1, 1, 1, 1, 1,
0.4820586, 0.3307324, 1.017725, 1, 1, 1, 1, 1,
0.483787, -0.391559, 2.00603, 1, 1, 1, 1, 1,
0.4873648, -0.2906902, 1.661402, 1, 1, 1, 1, 1,
0.4888746, -0.09438663, 3.659359, 1, 1, 1, 1, 1,
0.4921778, 0.4463122, 0.9796535, 1, 1, 1, 1, 1,
0.4921902, -0.06160609, -0.332232, 1, 1, 1, 1, 1,
0.4971304, -0.7649314, 4.241046, 1, 1, 1, 1, 1,
0.4991429, -1.316002, 3.462477, 1, 1, 1, 1, 1,
0.4998884, -0.2858476, 0.5674238, 1, 1, 1, 1, 1,
0.5011601, -1.401518, 3.27032, 1, 1, 1, 1, 1,
0.5086717, -0.5101415, 2.544612, 1, 1, 1, 1, 1,
0.5111166, 1.23897, 0.6957539, 0, 0, 1, 1, 1,
0.5116826, -0.4638685, 2.855192, 1, 0, 0, 1, 1,
0.5163833, 0.6606305, -0.3255734, 1, 0, 0, 1, 1,
0.5224614, -0.3786834, 3.505568, 1, 0, 0, 1, 1,
0.5228491, -0.700597, 2.884562, 1, 0, 0, 1, 1,
0.5235791, 0.9956369, -0.319602, 1, 0, 0, 1, 1,
0.5290158, 1.829781, -0.9195101, 0, 0, 0, 1, 1,
0.5306723, -0.9170334, 2.983699, 0, 0, 0, 1, 1,
0.5336001, -0.3668427, 1.567474, 0, 0, 0, 1, 1,
0.536964, 0.6215014, 0.3196988, 0, 0, 0, 1, 1,
0.5447932, -0.5452231, 4.757566, 0, 0, 0, 1, 1,
0.5456992, -0.2004755, 1.920353, 0, 0, 0, 1, 1,
0.5475096, 1.303183, 1.792822, 0, 0, 0, 1, 1,
0.5500283, -1.770754, 2.492536, 1, 1, 1, 1, 1,
0.5530818, 0.009478529, 1.466628, 1, 1, 1, 1, 1,
0.5584094, -0.8974361, 2.326966, 1, 1, 1, 1, 1,
0.5584952, -0.5661516, 3.139752, 1, 1, 1, 1, 1,
0.5590672, -0.4923792, 0.4813834, 1, 1, 1, 1, 1,
0.5591168, 0.5610152, -0.1001472, 1, 1, 1, 1, 1,
0.5621924, 0.5773804, 0.8040529, 1, 1, 1, 1, 1,
0.5634416, -1.509718, 0.6775405, 1, 1, 1, 1, 1,
0.5703605, -0.1679178, 0.9420351, 1, 1, 1, 1, 1,
0.5705949, 0.6359766, 1.01476, 1, 1, 1, 1, 1,
0.5747757, -1.795614, 4.111074, 1, 1, 1, 1, 1,
0.5791323, -0.5528559, 2.999705, 1, 1, 1, 1, 1,
0.5817344, -0.08661059, 3.54202, 1, 1, 1, 1, 1,
0.5832815, -0.1324505, 3.573776, 1, 1, 1, 1, 1,
0.5845804, -1.229568, 2.402873, 1, 1, 1, 1, 1,
0.5860183, 0.4215792, -0.3015281, 0, 0, 1, 1, 1,
0.5904191, -0.436809, 1.192345, 1, 0, 0, 1, 1,
0.591708, 0.3310651, -0.5277276, 1, 0, 0, 1, 1,
0.5945264, -0.8189893, 2.8461, 1, 0, 0, 1, 1,
0.5965847, 0.04139776, 1.526794, 1, 0, 0, 1, 1,
0.6034518, -0.1228765, 3.272831, 1, 0, 0, 1, 1,
0.6047193, -0.6151705, 1.846791, 0, 0, 0, 1, 1,
0.6049322, -0.5338958, 2.326422, 0, 0, 0, 1, 1,
0.6087136, -0.6833926, 1.512463, 0, 0, 0, 1, 1,
0.6098241, 1.167455, -1.461635, 0, 0, 0, 1, 1,
0.6171898, 1.053664, 1.248691, 0, 0, 0, 1, 1,
0.6254261, -0.2846799, 1.359357, 0, 0, 0, 1, 1,
0.6333821, 1.039106, 1.848764, 0, 0, 0, 1, 1,
0.6361684, 0.6655588, -0.1738092, 1, 1, 1, 1, 1,
0.6364258, -0.9861639, 1.465253, 1, 1, 1, 1, 1,
0.6436422, 0.6922712, 0.8036537, 1, 1, 1, 1, 1,
0.6458617, 0.04788868, 2.819178, 1, 1, 1, 1, 1,
0.6468229, -0.5983853, 2.474394, 1, 1, 1, 1, 1,
0.6530068, -1.007919, 2.764145, 1, 1, 1, 1, 1,
0.6595041, -0.2849709, 2.063597, 1, 1, 1, 1, 1,
0.6601399, 1.78728, -0.5775287, 1, 1, 1, 1, 1,
0.6643835, -0.4697808, 2.447633, 1, 1, 1, 1, 1,
0.6686692, 0.7304938, 0.1351214, 1, 1, 1, 1, 1,
0.6749188, -0.7438527, 3.893428, 1, 1, 1, 1, 1,
0.676324, -0.1596727, 1.641842, 1, 1, 1, 1, 1,
0.6808879, 0.667597, -0.04199106, 1, 1, 1, 1, 1,
0.6892148, -0.2145898, 2.853215, 1, 1, 1, 1, 1,
0.6893314, -0.75962, 2.191022, 1, 1, 1, 1, 1,
0.6907244, -0.6546291, 0.7497357, 0, 0, 1, 1, 1,
0.6951413, -0.5971062, 1.59238, 1, 0, 0, 1, 1,
0.702755, -0.9326814, 2.385705, 1, 0, 0, 1, 1,
0.7029252, 0.0532871, -0.9621421, 1, 0, 0, 1, 1,
0.7033691, 1.2635, -0.6911448, 1, 0, 0, 1, 1,
0.7142357, -0.6255102, 3.417804, 1, 0, 0, 1, 1,
0.715753, 0.1410495, 1.067106, 0, 0, 0, 1, 1,
0.7220685, -0.7364717, 2.533078, 0, 0, 0, 1, 1,
0.7260231, 0.7386728, 1.565974, 0, 0, 0, 1, 1,
0.734736, -0.907291, 0.7637396, 0, 0, 0, 1, 1,
0.7347937, 0.2474906, 0.9793774, 0, 0, 0, 1, 1,
0.7387437, -0.4316178, 1.800436, 0, 0, 0, 1, 1,
0.7416437, 0.2812704, 1.25767, 0, 0, 0, 1, 1,
0.7444247, 0.8389165, 1.430021, 1, 1, 1, 1, 1,
0.7449574, -1.500493, 1.269251, 1, 1, 1, 1, 1,
0.753053, 0.5090938, 2.49146, 1, 1, 1, 1, 1,
0.7531216, -0.2207199, 0.4738969, 1, 1, 1, 1, 1,
0.7569387, -0.2255133, 2.50179, 1, 1, 1, 1, 1,
0.7573893, -0.4743973, 0.2858571, 1, 1, 1, 1, 1,
0.7595657, 0.5302095, 2.897228, 1, 1, 1, 1, 1,
0.7633454, -0.6648493, 1.160695, 1, 1, 1, 1, 1,
0.763485, -1.520401, 2.890403, 1, 1, 1, 1, 1,
0.7641367, -0.6602232, 2.18302, 1, 1, 1, 1, 1,
0.7733365, -2.575139, 2.302665, 1, 1, 1, 1, 1,
0.7733877, -0.3647064, 0.4566778, 1, 1, 1, 1, 1,
0.7985471, -0.07300524, 3.318997, 1, 1, 1, 1, 1,
0.7986215, -0.37513, 2.434939, 1, 1, 1, 1, 1,
0.8017603, -0.6573345, 2.04239, 1, 1, 1, 1, 1,
0.8031714, 1.264277, 1.428558, 0, 0, 1, 1, 1,
0.8084414, -0.5186048, 3.225256, 1, 0, 0, 1, 1,
0.8225651, -0.3855424, 2.614916, 1, 0, 0, 1, 1,
0.8251105, -1.058686, 2.569996, 1, 0, 0, 1, 1,
0.8261136, 0.8084413, 2.516541, 1, 0, 0, 1, 1,
0.8289854, -0.9290638, 3.435636, 1, 0, 0, 1, 1,
0.8399035, -2.017789, 3.719336, 0, 0, 0, 1, 1,
0.8443903, -0.7308111, 2.653665, 0, 0, 0, 1, 1,
0.8490068, -1.155188, 4.149498, 0, 0, 0, 1, 1,
0.8509455, 0.1638985, 2.408349, 0, 0, 0, 1, 1,
0.8527704, -1.357934, 4.071177, 0, 0, 0, 1, 1,
0.8558626, 0.7273504, 1.527625, 0, 0, 0, 1, 1,
0.8606403, 1.623944, 0.8619987, 0, 0, 0, 1, 1,
0.8636339, -0.7490163, 2.553015, 1, 1, 1, 1, 1,
0.8650306, 1.757558, 0.0500469, 1, 1, 1, 1, 1,
0.8658845, -1.252907, 0.5350945, 1, 1, 1, 1, 1,
0.8670585, 1.775208, 2.242001, 1, 1, 1, 1, 1,
0.8696482, -0.4420438, 3.690617, 1, 1, 1, 1, 1,
0.8933817, -0.03542612, 1.885721, 1, 1, 1, 1, 1,
0.8942104, -1.195696, 3.119821, 1, 1, 1, 1, 1,
0.8984508, -0.7334793, 1.856712, 1, 1, 1, 1, 1,
0.8988312, -0.4100405, 2.368782, 1, 1, 1, 1, 1,
0.9056349, 0.6706704, 0.6656955, 1, 1, 1, 1, 1,
0.9072526, -0.9568031, 1.446111, 1, 1, 1, 1, 1,
0.9092526, 1.029014, -0.5621384, 1, 1, 1, 1, 1,
0.9111226, -1.867044, 0.8202306, 1, 1, 1, 1, 1,
0.9113069, 0.4747197, 1.023379, 1, 1, 1, 1, 1,
0.9113731, 1.801952, -0.6155757, 1, 1, 1, 1, 1,
0.9233572, -1.238895, 2.371773, 0, 0, 1, 1, 1,
0.9260449, -0.8294886, 2.411215, 1, 0, 0, 1, 1,
0.9285816, 1.17817, 0.9675581, 1, 0, 0, 1, 1,
0.9336585, -1.743555, 3.185068, 1, 0, 0, 1, 1,
0.9373929, -0.20961, 1.995724, 1, 0, 0, 1, 1,
0.9382112, -0.1658964, -0.3211073, 1, 0, 0, 1, 1,
0.9391366, 1.267403, 1.673568, 0, 0, 0, 1, 1,
0.9417553, 0.3374514, 0.7956163, 0, 0, 0, 1, 1,
0.9479553, 0.07896955, 2.790693, 0, 0, 0, 1, 1,
0.9494343, 0.1559819, 0.5735196, 0, 0, 0, 1, 1,
0.9515542, 0.8033411, 0.8210191, 0, 0, 0, 1, 1,
0.9518191, -0.3568233, 1.93757, 0, 0, 0, 1, 1,
0.9570881, 0.07613441, 0.9009496, 0, 0, 0, 1, 1,
0.9586071, -1.2179, 2.395422, 1, 1, 1, 1, 1,
0.9621155, 0.3669174, 2.267494, 1, 1, 1, 1, 1,
0.9680512, -0.1521935, 2.096638, 1, 1, 1, 1, 1,
0.9686715, -1.246599, 1.99743, 1, 1, 1, 1, 1,
0.9757131, 1.186176, 2.5394, 1, 1, 1, 1, 1,
0.9764157, 0.8130555, 0.9828831, 1, 1, 1, 1, 1,
0.9792303, 2.114478, 0.1084113, 1, 1, 1, 1, 1,
0.9853277, -0.262588, 2.024906, 1, 1, 1, 1, 1,
0.9873182, -0.9600626, 3.504365, 1, 1, 1, 1, 1,
0.9897707, 0.6054533, 0.07661928, 1, 1, 1, 1, 1,
0.990299, 0.08634195, 1.39758, 1, 1, 1, 1, 1,
0.9906563, -1.69023, 2.021087, 1, 1, 1, 1, 1,
1.00081, 0.9362535, -1.227489, 1, 1, 1, 1, 1,
1.004944, 0.7349662, 0.4527079, 1, 1, 1, 1, 1,
1.014822, -2.316939, 0.6784722, 1, 1, 1, 1, 1,
1.023564, 0.5857119, 1.971496, 0, 0, 1, 1, 1,
1.02897, 0.2402787, 1.957764, 1, 0, 0, 1, 1,
1.029358, -0.2897109, 1.864633, 1, 0, 0, 1, 1,
1.032909, -0.8836184, 2.778738, 1, 0, 0, 1, 1,
1.033816, -0.9877228, 2.970465, 1, 0, 0, 1, 1,
1.034425, -0.6684738, 1.112375, 1, 0, 0, 1, 1,
1.044196, 0.7609601, 1.708861, 0, 0, 0, 1, 1,
1.047306, 0.2516209, 0.4686498, 0, 0, 0, 1, 1,
1.047624, -1.413928, 2.216468, 0, 0, 0, 1, 1,
1.047815, -0.004474717, 1.46924, 0, 0, 0, 1, 1,
1.049467, 1.361849, 0.01597399, 0, 0, 0, 1, 1,
1.050838, -0.5826176, 3.36776, 0, 0, 0, 1, 1,
1.051873, -0.2022372, 1.253636, 0, 0, 0, 1, 1,
1.053642, 0.2716859, 1.822965, 1, 1, 1, 1, 1,
1.058194, 0.2545369, 2.560346, 1, 1, 1, 1, 1,
1.058551, -1.218556, 2.138836, 1, 1, 1, 1, 1,
1.059806, -2.052755, 3.202487, 1, 1, 1, 1, 1,
1.060048, 0.1610381, 1.224056, 1, 1, 1, 1, 1,
1.065539, 0.9828866, 1.057651, 1, 1, 1, 1, 1,
1.066258, -0.6690591, 2.79527, 1, 1, 1, 1, 1,
1.066629, 0.01434351, 1.51439, 1, 1, 1, 1, 1,
1.078682, 0.08434546, 1.410185, 1, 1, 1, 1, 1,
1.081647, -1.200017, 3.90087, 1, 1, 1, 1, 1,
1.102612, -0.1822962, 1.785286, 1, 1, 1, 1, 1,
1.105392, -0.309359, 2.822864, 1, 1, 1, 1, 1,
1.106125, -0.0901607, 1.983895, 1, 1, 1, 1, 1,
1.111008, -0.3671525, 1.119886, 1, 1, 1, 1, 1,
1.111303, -0.102156, 1.605489, 1, 1, 1, 1, 1,
1.113064, -0.3434881, 2.002016, 0, 0, 1, 1, 1,
1.113918, 0.4393144, 0.6256836, 1, 0, 0, 1, 1,
1.124868, -1.087237, 2.74109, 1, 0, 0, 1, 1,
1.131363, -0.6859667, 2.543758, 1, 0, 0, 1, 1,
1.132083, 1.901566, 1.799245, 1, 0, 0, 1, 1,
1.134985, -0.4333271, 1.666644, 1, 0, 0, 1, 1,
1.148187, -0.1159365, 1.130626, 0, 0, 0, 1, 1,
1.148379, -0.7261294, 2.232196, 0, 0, 0, 1, 1,
1.14862, -0.5377401, 1.191681, 0, 0, 0, 1, 1,
1.15001, -0.9241487, 2.310534, 0, 0, 0, 1, 1,
1.156276, 0.6900365, 1.211822, 0, 0, 0, 1, 1,
1.160634, 1.195717, 2.081358, 0, 0, 0, 1, 1,
1.163307, 0.8810415, -0.7267776, 0, 0, 0, 1, 1,
1.16549, -0.2217885, 1.805237, 1, 1, 1, 1, 1,
1.172223, 0.6869037, 2.691469, 1, 1, 1, 1, 1,
1.182313, 0.4208624, 1.606704, 1, 1, 1, 1, 1,
1.195297, 0.2649451, 2.30842, 1, 1, 1, 1, 1,
1.196149, 0.3679942, 1.237359, 1, 1, 1, 1, 1,
1.199871, -1.222921, 1.42404, 1, 1, 1, 1, 1,
1.218308, -2.36201, 1.135653, 1, 1, 1, 1, 1,
1.233198, 0.345405, 1.262347, 1, 1, 1, 1, 1,
1.241017, -0.7018043, 0.6123018, 1, 1, 1, 1, 1,
1.247484, 0.0006248388, 1.8325, 1, 1, 1, 1, 1,
1.249357, -1.001317, 1.669264, 1, 1, 1, 1, 1,
1.252729, -0.6439869, 2.536943, 1, 1, 1, 1, 1,
1.25311, -0.7987956, 1.445842, 1, 1, 1, 1, 1,
1.263412, -1.452998, 3.234015, 1, 1, 1, 1, 1,
1.266059, 0.1930777, 0.5652121, 1, 1, 1, 1, 1,
1.266128, -0.5164797, 2.522352, 0, 0, 1, 1, 1,
1.266423, -0.4177734, 0.6117119, 1, 0, 0, 1, 1,
1.271307, -0.2694732, 0.2060793, 1, 0, 0, 1, 1,
1.274302, 0.1896457, -0.3439959, 1, 0, 0, 1, 1,
1.279056, -0.6638712, 2.414431, 1, 0, 0, 1, 1,
1.279364, 1.772271, 1.771396, 1, 0, 0, 1, 1,
1.280717, 0.1005607, 1.932539, 0, 0, 0, 1, 1,
1.285087, 1.000203, 0.03817368, 0, 0, 0, 1, 1,
1.296843, 0.1205885, 0.6623197, 0, 0, 0, 1, 1,
1.296863, -1.185263, 1.812976, 0, 0, 0, 1, 1,
1.300438, 0.6418919, -0.2194144, 0, 0, 0, 1, 1,
1.30166, -0.2735945, -0.8666204, 0, 0, 0, 1, 1,
1.309222, -1.425419, 3.120561, 0, 0, 0, 1, 1,
1.315132, -2.018903, 2.44601, 1, 1, 1, 1, 1,
1.316688, 1.123643, 1.334932, 1, 1, 1, 1, 1,
1.333384, -0.4941736, 1.018014, 1, 1, 1, 1, 1,
1.335175, 0.1386453, 0.7897887, 1, 1, 1, 1, 1,
1.337855, 1.728684, -0.04134687, 1, 1, 1, 1, 1,
1.339309, -1.026257, 1.567495, 1, 1, 1, 1, 1,
1.345351, 1.295881, 0.634975, 1, 1, 1, 1, 1,
1.346121, -0.9513245, 3.937461, 1, 1, 1, 1, 1,
1.347324, -0.3497482, 2.626505, 1, 1, 1, 1, 1,
1.349618, 0.228765, 2.840607, 1, 1, 1, 1, 1,
1.35525, -0.557054, 1.4162, 1, 1, 1, 1, 1,
1.366405, 0.5495074, 1.960028, 1, 1, 1, 1, 1,
1.377681, -0.7280828, 1.932532, 1, 1, 1, 1, 1,
1.387791, -0.3302031, 1.809681, 1, 1, 1, 1, 1,
1.401945, -0.01422724, 1.213891, 1, 1, 1, 1, 1,
1.411125, -0.4843779, 3.87857, 0, 0, 1, 1, 1,
1.412708, -0.04814458, 2.602211, 1, 0, 0, 1, 1,
1.413776, -0.1756558, 1.631453, 1, 0, 0, 1, 1,
1.42552, -0.04030602, 1.082283, 1, 0, 0, 1, 1,
1.4283, 0.4294639, 1.249166, 1, 0, 0, 1, 1,
1.429497, 1.285539, 0.02104441, 1, 0, 0, 1, 1,
1.455367, 0.533983, 0.7669907, 0, 0, 0, 1, 1,
1.45874, 0.05565413, 0.7844085, 0, 0, 0, 1, 1,
1.460602, 2.369027, 0.6201482, 0, 0, 0, 1, 1,
1.460794, -0.08865064, 1.300688, 0, 0, 0, 1, 1,
1.461167, 1.00281, 0.4391665, 0, 0, 0, 1, 1,
1.467135, 1.151745, -1.168328, 0, 0, 0, 1, 1,
1.467938, 0.6720217, 0.9509759, 0, 0, 0, 1, 1,
1.477407, 0.7279985, -0.1168534, 1, 1, 1, 1, 1,
1.483795, 0.4123636, -1.685423, 1, 1, 1, 1, 1,
1.497321, 0.3481662, 1.78659, 1, 1, 1, 1, 1,
1.520249, -0.118242, 2.071841, 1, 1, 1, 1, 1,
1.524482, 0.8250085, 2.839249, 1, 1, 1, 1, 1,
1.528712, -0.09158991, 1.256654, 1, 1, 1, 1, 1,
1.530821, 0.6956169, 0.8317469, 1, 1, 1, 1, 1,
1.556361, 0.6350069, 1.440042, 1, 1, 1, 1, 1,
1.557407, 0.6783122, 0.2252561, 1, 1, 1, 1, 1,
1.574736, 2.388428, 1.454688, 1, 1, 1, 1, 1,
1.574785, 1.093781, 1.533677, 1, 1, 1, 1, 1,
1.585235, 1.391246, 1.057363, 1, 1, 1, 1, 1,
1.606681, 0.02751097, 1.326459, 1, 1, 1, 1, 1,
1.608137, 1.043596, 1.456242, 1, 1, 1, 1, 1,
1.638374, -2.306876, 3.828232, 1, 1, 1, 1, 1,
1.670083, -1.3716, 3.327127, 0, 0, 1, 1, 1,
1.67346, -1.208376, 1.480226, 1, 0, 0, 1, 1,
1.697667, 0.03199812, 0.233774, 1, 0, 0, 1, 1,
1.734289, -1.121368, 0.7850543, 1, 0, 0, 1, 1,
1.735789, -1.05601, 3.573273, 1, 0, 0, 1, 1,
1.742488, -1.193198, 1.714346, 1, 0, 0, 1, 1,
1.745856, 0.5581247, 1.563177, 0, 0, 0, 1, 1,
1.753571, 1.665607, 2.319886, 0, 0, 0, 1, 1,
1.771208, -0.1246545, 1.157863, 0, 0, 0, 1, 1,
1.771734, -0.3099213, 1.895174, 0, 0, 0, 1, 1,
1.77367, -0.001767112, 1.073731, 0, 0, 0, 1, 1,
1.786338, 0.678579, 1.087135, 0, 0, 0, 1, 1,
1.792371, 0.5965512, -0.8519722, 0, 0, 0, 1, 1,
1.793901, -0.04838983, -0.492608, 1, 1, 1, 1, 1,
1.806411, 0.8817889, -0.1248467, 1, 1, 1, 1, 1,
1.810225, -0.8221636, 3.240512, 1, 1, 1, 1, 1,
1.843807, 1.218478, 1.813621, 1, 1, 1, 1, 1,
1.868842, -0.9358146, 2.11245, 1, 1, 1, 1, 1,
1.900305, -0.2441696, 2.851932, 1, 1, 1, 1, 1,
1.904578, -1.080999, 1.131994, 1, 1, 1, 1, 1,
1.909978, -0.2466556, 1.941129, 1, 1, 1, 1, 1,
1.918334, 1.223451, 2.676916, 1, 1, 1, 1, 1,
1.950723, 0.2943214, 0.9159524, 1, 1, 1, 1, 1,
2.048339, 1.228198, 0.2028985, 1, 1, 1, 1, 1,
2.052513, 0.7443379, 0.9277546, 1, 1, 1, 1, 1,
2.074378, 0.3872557, 0.2163952, 1, 1, 1, 1, 1,
2.179567, -1.235027, 1.663039, 1, 1, 1, 1, 1,
2.180908, -0.2031899, 1.850601, 1, 1, 1, 1, 1,
2.187433, 0.502521, 0.5257011, 0, 0, 1, 1, 1,
2.194943, 0.4746554, 2.468226, 1, 0, 0, 1, 1,
2.226425, 0.3176687, -0.6828272, 1, 0, 0, 1, 1,
2.249463, -0.2291813, 2.550022, 1, 0, 0, 1, 1,
2.301546, 1.710438, -0.8599395, 1, 0, 0, 1, 1,
2.306713, 1.388847, 0.9304214, 1, 0, 0, 1, 1,
2.314571, -1.079772, 1.693483, 0, 0, 0, 1, 1,
2.364449, 0.4450525, 0.5104023, 0, 0, 0, 1, 1,
2.369178, -1.293641, -0.6616935, 0, 0, 0, 1, 1,
2.380497, 0.1809593, 1.101251, 0, 0, 0, 1, 1,
2.574753, 0.9203867, 0.1754291, 0, 0, 0, 1, 1,
2.643796, 1.27709, 0.2284713, 0, 0, 0, 1, 1,
2.67464, 2.084194, 0.2060208, 0, 0, 0, 1, 1,
2.710647, -0.1600352, 0.8441738, 1, 1, 1, 1, 1,
2.715656, 1.708015, 1.376544, 1, 1, 1, 1, 1,
2.796414, 0.0789014, 1.575094, 1, 1, 1, 1, 1,
2.841547, -0.6087294, 3.36611, 1, 1, 1, 1, 1,
2.869332, 0.4072458, 0.1916761, 1, 1, 1, 1, 1,
3.23147, -1.455387, 1.906832, 1, 1, 1, 1, 1,
3.65499, 1.918533, -0.2754129, 1, 1, 1, 1, 1
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
var radius = 9.680999;
var distance = 34.0041;
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
mvMatrix.translate( -0.3699559, 0.1111723, -0.2501431 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0041);
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
