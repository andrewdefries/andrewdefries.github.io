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
-2.96154, -0.4940911, -1.05458, 1, 0, 0, 1,
-2.839101, -0.0475792, -0.4802439, 1, 0.007843138, 0, 1,
-2.754822, -0.6555324, -1.711444, 1, 0.01176471, 0, 1,
-2.564961, 0.4840183, -1.219402, 1, 0.01960784, 0, 1,
-2.553866, -1.184681, -2.296293, 1, 0.02352941, 0, 1,
-2.514366, -0.2320243, -1.224508, 1, 0.03137255, 0, 1,
-2.424615, 2.097528, -0.5707287, 1, 0.03529412, 0, 1,
-2.392032, -2.185493, -1.781499, 1, 0.04313726, 0, 1,
-2.375842, -1.07444, -2.045899, 1, 0.04705882, 0, 1,
-2.356285, 0.2313715, -2.84406, 1, 0.05490196, 0, 1,
-2.263476, 1.543799, -1.835563, 1, 0.05882353, 0, 1,
-2.188326, -0.569239, -2.29935, 1, 0.06666667, 0, 1,
-2.185321, 1.320052, -0.9626902, 1, 0.07058824, 0, 1,
-2.159185, -0.6808719, -3.092079, 1, 0.07843138, 0, 1,
-2.15513, 0.02395222, -2.288834, 1, 0.08235294, 0, 1,
-2.120727, -1.088032, -2.501283, 1, 0.09019608, 0, 1,
-2.114482, 1.555017, -1.348825, 1, 0.09411765, 0, 1,
-2.093275, 1.144403, -0.7314622, 1, 0.1019608, 0, 1,
-2.05868, 0.2217716, -3.536242, 1, 0.1098039, 0, 1,
-1.996165, 1.705666, -1.169374, 1, 0.1137255, 0, 1,
-1.991318, 0.8231416, -1.592039, 1, 0.1215686, 0, 1,
-1.988449, 0.6478452, -1.760807, 1, 0.1254902, 0, 1,
-1.978293, 0.4489749, -0.5920683, 1, 0.1333333, 0, 1,
-1.95059, 0.7753371, -0.2662241, 1, 0.1372549, 0, 1,
-1.93607, -0.1390183, -0.1390293, 1, 0.145098, 0, 1,
-1.932697, -0.2177823, 0.6078295, 1, 0.1490196, 0, 1,
-1.918194, -1.353307, -0.8164054, 1, 0.1568628, 0, 1,
-1.909613, 0.6575011, 1.381123, 1, 0.1607843, 0, 1,
-1.89918, -0.3986202, -0.508522, 1, 0.1686275, 0, 1,
-1.890408, 0.1534947, -2.058238, 1, 0.172549, 0, 1,
-1.888971, 0.9040454, -2.202753, 1, 0.1803922, 0, 1,
-1.88873, 1.123391, -0.7268408, 1, 0.1843137, 0, 1,
-1.879161, -0.5790759, -0.938081, 1, 0.1921569, 0, 1,
-1.872632, 1.248102, -1.075038, 1, 0.1960784, 0, 1,
-1.854199, 0.3106842, 0.4426064, 1, 0.2039216, 0, 1,
-1.843917, -1.406938, -3.228045, 1, 0.2117647, 0, 1,
-1.842878, 0.6220946, 0.3297983, 1, 0.2156863, 0, 1,
-1.835841, -0.791698, -3.738836, 1, 0.2235294, 0, 1,
-1.825241, -0.6476856, -1.670691, 1, 0.227451, 0, 1,
-1.823892, 0.0104616, -2.072727, 1, 0.2352941, 0, 1,
-1.821891, 0.790902, -0.0569744, 1, 0.2392157, 0, 1,
-1.81122, -0.08305819, -0.6839728, 1, 0.2470588, 0, 1,
-1.805337, 1.350687, -4.109945, 1, 0.2509804, 0, 1,
-1.793692, -0.7311972, -0.9292287, 1, 0.2588235, 0, 1,
-1.787015, 0.5459787, -1.325856, 1, 0.2627451, 0, 1,
-1.780634, -0.06861643, -3.166314, 1, 0.2705882, 0, 1,
-1.772698, -0.7021506, -1.205408, 1, 0.2745098, 0, 1,
-1.743104, 0.758252, -1.704554, 1, 0.282353, 0, 1,
-1.740455, -0.1799764, -1.257026, 1, 0.2862745, 0, 1,
-1.73633, 0.4709759, -0.6678866, 1, 0.2941177, 0, 1,
-1.735105, 0.2047096, -1.459503, 1, 0.3019608, 0, 1,
-1.733931, 0.05955283, -2.862573, 1, 0.3058824, 0, 1,
-1.720426, 1.95853, -0.5779384, 1, 0.3137255, 0, 1,
-1.676991, 1.768963, 0.6827075, 1, 0.3176471, 0, 1,
-1.662573, -0.5068703, -3.038737, 1, 0.3254902, 0, 1,
-1.661666, 0.2588165, -2.232395, 1, 0.3294118, 0, 1,
-1.614009, -0.1816108, -0.4111988, 1, 0.3372549, 0, 1,
-1.594958, -0.6199687, -0.22755, 1, 0.3411765, 0, 1,
-1.580541, -2.039562, -3.344631, 1, 0.3490196, 0, 1,
-1.578811, 1.41591, -0.99075, 1, 0.3529412, 0, 1,
-1.577992, 0.3150363, -3.295493, 1, 0.3607843, 0, 1,
-1.577732, 1.01799, -0.8984681, 1, 0.3647059, 0, 1,
-1.574782, -0.4231457, -3.177776, 1, 0.372549, 0, 1,
-1.566147, -1.452254, -2.758105, 1, 0.3764706, 0, 1,
-1.565816, 0.2383743, 0.1653323, 1, 0.3843137, 0, 1,
-1.557175, -0.646772, -2.054269, 1, 0.3882353, 0, 1,
-1.540182, 0.06446754, -0.4478185, 1, 0.3960784, 0, 1,
-1.529959, 0.08331235, -3.495714, 1, 0.4039216, 0, 1,
-1.525044, -0.1970773, -0.6454239, 1, 0.4078431, 0, 1,
-1.51923, -1.661935, -1.620103, 1, 0.4156863, 0, 1,
-1.513026, 1.521802, -0.506094, 1, 0.4196078, 0, 1,
-1.503629, -0.4554666, -2.097027, 1, 0.427451, 0, 1,
-1.500736, 0.548614, 0.1676059, 1, 0.4313726, 0, 1,
-1.493699, 0.851828, -0.6529091, 1, 0.4392157, 0, 1,
-1.480784, 1.41531, -0.3681684, 1, 0.4431373, 0, 1,
-1.47084, -1.071213, -2.149285, 1, 0.4509804, 0, 1,
-1.469632, 0.1793056, -1.540289, 1, 0.454902, 0, 1,
-1.467639, -1.905207, -3.655885, 1, 0.4627451, 0, 1,
-1.459172, 0.438035, 0.5442638, 1, 0.4666667, 0, 1,
-1.433216, 0.1017302, -1.519291, 1, 0.4745098, 0, 1,
-1.41855, -0.2356768, -1.893362, 1, 0.4784314, 0, 1,
-1.41666, -1.247106, -2.16152, 1, 0.4862745, 0, 1,
-1.403774, 1.544249, -3.03098, 1, 0.4901961, 0, 1,
-1.402622, -0.9418631, -0.9039545, 1, 0.4980392, 0, 1,
-1.400508, -0.8969382, -1.495946, 1, 0.5058824, 0, 1,
-1.381745, 0.1200181, -1.365548, 1, 0.509804, 0, 1,
-1.34393, -0.09879293, -0.9669144, 1, 0.5176471, 0, 1,
-1.32914, -0.7191079, -2.014342, 1, 0.5215687, 0, 1,
-1.327348, -0.8263892, -2.297013, 1, 0.5294118, 0, 1,
-1.315423, 0.1583677, 0.7738096, 1, 0.5333334, 0, 1,
-1.313574, -0.880931, -1.313763, 1, 0.5411765, 0, 1,
-1.303672, -2.498248, -0.7103817, 1, 0.5450981, 0, 1,
-1.295507, 0.1842785, -0.7682471, 1, 0.5529412, 0, 1,
-1.292575, 0.2972631, -1.663205, 1, 0.5568628, 0, 1,
-1.288967, 2.443656, 0.2404363, 1, 0.5647059, 0, 1,
-1.279524, -1.405576, -4.223125, 1, 0.5686275, 0, 1,
-1.279362, -0.6397145, -1.840297, 1, 0.5764706, 0, 1,
-1.272367, -0.135508, -1.841718, 1, 0.5803922, 0, 1,
-1.26798, 0.8328197, -2.355928, 1, 0.5882353, 0, 1,
-1.267363, -1.396882, -1.913391, 1, 0.5921569, 0, 1,
-1.247485, -0.4716497, -1.189526, 1, 0.6, 0, 1,
-1.247361, -0.7694254, -3.183453, 1, 0.6078432, 0, 1,
-1.246792, 1.30289, -0.144661, 1, 0.6117647, 0, 1,
-1.234648, 0.7325681, -0.6518981, 1, 0.6196079, 0, 1,
-1.232299, -0.8229389, -1.91019, 1, 0.6235294, 0, 1,
-1.221668, 0.2912732, -1.211475, 1, 0.6313726, 0, 1,
-1.220242, -0.5821559, -2.751724, 1, 0.6352941, 0, 1,
-1.219331, -0.7150356, -1.599364, 1, 0.6431373, 0, 1,
-1.219156, -0.2338165, -0.008178923, 1, 0.6470588, 0, 1,
-1.214652, -0.710067, -3.572467, 1, 0.654902, 0, 1,
-1.204043, 0.9036195, -0.3225127, 1, 0.6588235, 0, 1,
-1.19822, -1.698438, -2.211063, 1, 0.6666667, 0, 1,
-1.194929, -1.881562, -4.780117, 1, 0.6705883, 0, 1,
-1.188938, -0.006744386, -1.238584, 1, 0.6784314, 0, 1,
-1.188585, -1.10644, -2.549209, 1, 0.682353, 0, 1,
-1.1883, -1.613559, -2.39675, 1, 0.6901961, 0, 1,
-1.179329, -0.1358423, -2.067068, 1, 0.6941177, 0, 1,
-1.174824, -0.05007102, -1.270605, 1, 0.7019608, 0, 1,
-1.169471, 0.4874744, -1.536347, 1, 0.7098039, 0, 1,
-1.168743, 0.02406212, -2.085776, 1, 0.7137255, 0, 1,
-1.156367, -0.4378598, -3.047799, 1, 0.7215686, 0, 1,
-1.132404, 0.8057335, 0.004991735, 1, 0.7254902, 0, 1,
-1.131972, -0.06090922, -2.196277, 1, 0.7333333, 0, 1,
-1.127706, 0.6319001, -1.274426, 1, 0.7372549, 0, 1,
-1.122669, 0.7698215, -0.3961559, 1, 0.7450981, 0, 1,
-1.118704, 0.4591376, -2.728995, 1, 0.7490196, 0, 1,
-1.108591, 1.924753, -1.529485, 1, 0.7568628, 0, 1,
-1.107747, -1.543502, -2.166532, 1, 0.7607843, 0, 1,
-1.106225, 0.1856763, -1.488025, 1, 0.7686275, 0, 1,
-1.097324, 0.5689424, 0.4352662, 1, 0.772549, 0, 1,
-1.093434, 2.191072, 0.3695707, 1, 0.7803922, 0, 1,
-1.092148, 0.9823202, -0.9210613, 1, 0.7843137, 0, 1,
-1.079885, -0.1574345, -2.296453, 1, 0.7921569, 0, 1,
-1.075451, -0.2881942, -2.46442, 1, 0.7960784, 0, 1,
-1.075141, -0.1374285, -2.019252, 1, 0.8039216, 0, 1,
-1.072659, 1.468079, -2.743328, 1, 0.8117647, 0, 1,
-1.071867, -1.357817, -2.007366, 1, 0.8156863, 0, 1,
-1.068192, -1.287713, -2.321053, 1, 0.8235294, 0, 1,
-1.0678, -1.407433, -2.759596, 1, 0.827451, 0, 1,
-1.067726, -2.812447, -3.766708, 1, 0.8352941, 0, 1,
-1.067106, -1.107448, -2.078011, 1, 0.8392157, 0, 1,
-1.061466, 0.3280314, -1.852261, 1, 0.8470588, 0, 1,
-1.05803, 0.1168201, -0.7238743, 1, 0.8509804, 0, 1,
-1.054586, 0.3953634, -3.716312, 1, 0.8588235, 0, 1,
-1.052503, -0.2559046, -2.63357, 1, 0.8627451, 0, 1,
-1.052163, 0.9640097, 0.6718789, 1, 0.8705882, 0, 1,
-1.048964, 0.8527074, -1.165917, 1, 0.8745098, 0, 1,
-1.035473, 0.01368304, -3.025843, 1, 0.8823529, 0, 1,
-1.032944, 0.8984094, -1.195817, 1, 0.8862745, 0, 1,
-1.029377, -0.1670567, -0.3094828, 1, 0.8941177, 0, 1,
-1.029159, 1.520702, -0.02495731, 1, 0.8980392, 0, 1,
-1.012929, 0.1087462, -0.9342942, 1, 0.9058824, 0, 1,
-1.012843, 0.1600062, -1.978051, 1, 0.9137255, 0, 1,
-1.011489, -1.199754, -1.747762, 1, 0.9176471, 0, 1,
-1.010865, -1.072908, -3.008193, 1, 0.9254902, 0, 1,
-1.004631, 0.2269765, -0.1718344, 1, 0.9294118, 0, 1,
-1.004415, -1.714212, -1.556293, 1, 0.9372549, 0, 1,
-1.003902, 0.8452916, -0.2393571, 1, 0.9411765, 0, 1,
-1.002912, -1.068251, -2.223323, 1, 0.9490196, 0, 1,
-0.9953452, -0.4337945, -3.06502, 1, 0.9529412, 0, 1,
-0.9951041, -0.3628098, -0.1599127, 1, 0.9607843, 0, 1,
-0.9938867, 1.559159, 0.4004593, 1, 0.9647059, 0, 1,
-0.9914822, 2.257163, -2.182585, 1, 0.972549, 0, 1,
-0.9900367, -0.5272064, -1.67129, 1, 0.9764706, 0, 1,
-0.9892147, 0.4199075, -3.155231, 1, 0.9843137, 0, 1,
-0.9792025, -0.9467434, -2.808135, 1, 0.9882353, 0, 1,
-0.9737728, -1.223105, -2.392802, 1, 0.9960784, 0, 1,
-0.9696085, -0.04057281, -2.011162, 0.9960784, 1, 0, 1,
-0.9681276, -0.7712561, -2.138014, 0.9921569, 1, 0, 1,
-0.9679227, 0.6424934, 0.2951009, 0.9843137, 1, 0, 1,
-0.963346, -0.3254134, -3.147248, 0.9803922, 1, 0, 1,
-0.9617735, 1.018669, -0.7915723, 0.972549, 1, 0, 1,
-0.958828, -0.617297, -4.029568, 0.9686275, 1, 0, 1,
-0.958697, -1.292478, -2.743012, 0.9607843, 1, 0, 1,
-0.9541023, 0.4711696, -0.3987165, 0.9568627, 1, 0, 1,
-0.9526888, 0.3874262, 0.7224393, 0.9490196, 1, 0, 1,
-0.9523703, -1.05867, -4.361254, 0.945098, 1, 0, 1,
-0.9485106, 1.004635, 1.159136, 0.9372549, 1, 0, 1,
-0.9463233, -0.6474298, -3.969397, 0.9333333, 1, 0, 1,
-0.9445251, -0.7806349, -0.5473298, 0.9254902, 1, 0, 1,
-0.9412643, 0.1406805, -1.518579, 0.9215686, 1, 0, 1,
-0.9389107, 0.881678, -1.389259, 0.9137255, 1, 0, 1,
-0.9255376, -1.060227, -2.783194, 0.9098039, 1, 0, 1,
-0.9251427, 0.3543455, -0.1377709, 0.9019608, 1, 0, 1,
-0.9166222, 0.6274617, 2.388682, 0.8941177, 1, 0, 1,
-0.9129525, -0.7464754, -2.580244, 0.8901961, 1, 0, 1,
-0.9124507, 0.1552864, -0.7813281, 0.8823529, 1, 0, 1,
-0.9122046, 0.370859, -1.69532, 0.8784314, 1, 0, 1,
-0.9079132, -1.828725, -1.620983, 0.8705882, 1, 0, 1,
-0.9070594, 0.6767175, -0.8829545, 0.8666667, 1, 0, 1,
-0.9043423, 0.9616948, 0.1871198, 0.8588235, 1, 0, 1,
-0.9038065, 0.03110627, -1.223002, 0.854902, 1, 0, 1,
-0.9010695, -1.566682, -2.825361, 0.8470588, 1, 0, 1,
-0.9002599, 0.1518393, -2.343605, 0.8431373, 1, 0, 1,
-0.9000955, 0.7438197, 0.6511133, 0.8352941, 1, 0, 1,
-0.8979585, -0.419576, -3.206138, 0.8313726, 1, 0, 1,
-0.8975101, -2.359456, -3.121374, 0.8235294, 1, 0, 1,
-0.8938096, 0.1451115, -1.367808, 0.8196079, 1, 0, 1,
-0.892161, 1.191345, -0.1289021, 0.8117647, 1, 0, 1,
-0.8770958, -1.170512, -2.687787, 0.8078431, 1, 0, 1,
-0.8768871, -0.7176707, -2.600982, 0.8, 1, 0, 1,
-0.8723946, 1.230274, 0.4276296, 0.7921569, 1, 0, 1,
-0.86279, 1.77523, -0.59179, 0.7882353, 1, 0, 1,
-0.8622679, 1.387101, 0.2081891, 0.7803922, 1, 0, 1,
-0.8599397, -0.3915132, -2.352084, 0.7764706, 1, 0, 1,
-0.8560207, -0.6543331, -1.653419, 0.7686275, 1, 0, 1,
-0.847141, -1.036084, -2.659763, 0.7647059, 1, 0, 1,
-0.8442776, -0.2877069, -1.577587, 0.7568628, 1, 0, 1,
-0.8415513, -3.081172, -1.897748, 0.7529412, 1, 0, 1,
-0.8413696, 0.3559256, -1.793865, 0.7450981, 1, 0, 1,
-0.836153, -1.724742, -3.304177, 0.7411765, 1, 0, 1,
-0.8322148, -1.21458, -2.324134, 0.7333333, 1, 0, 1,
-0.8279122, 1.978216, -0.1764139, 0.7294118, 1, 0, 1,
-0.8244814, -0.01081547, -1.735657, 0.7215686, 1, 0, 1,
-0.8165931, -1.264292, -3.065243, 0.7176471, 1, 0, 1,
-0.8050235, 1.061227, -1.862893, 0.7098039, 1, 0, 1,
-0.8041549, 1.068738, -0.06226581, 0.7058824, 1, 0, 1,
-0.7978324, -0.6540658, -1.762055, 0.6980392, 1, 0, 1,
-0.7942472, -0.2401735, -3.035586, 0.6901961, 1, 0, 1,
-0.7937291, 0.1890344, -1.319306, 0.6862745, 1, 0, 1,
-0.7904996, -0.9265296, -3.371486, 0.6784314, 1, 0, 1,
-0.7873878, -0.4621702, -1.710703, 0.6745098, 1, 0, 1,
-0.7745937, -0.0273626, -2.13413, 0.6666667, 1, 0, 1,
-0.773095, -1.084556, -4.019591, 0.6627451, 1, 0, 1,
-0.7711004, -0.06727938, -3.42695, 0.654902, 1, 0, 1,
-0.7656093, -1.920824, -1.286996, 0.6509804, 1, 0, 1,
-0.7650968, -0.1283474, -0.07149552, 0.6431373, 1, 0, 1,
-0.7566288, 0.07728004, -1.248069, 0.6392157, 1, 0, 1,
-0.7539601, 0.5250347, -1.25221, 0.6313726, 1, 0, 1,
-0.7501399, 1.204144, 0.00545454, 0.627451, 1, 0, 1,
-0.735017, -0.4526679, -2.22396, 0.6196079, 1, 0, 1,
-0.7325899, 0.5929657, 0.1493821, 0.6156863, 1, 0, 1,
-0.7316592, 0.9529679, 0.1815734, 0.6078432, 1, 0, 1,
-0.7311211, -0.40648, -2.654941, 0.6039216, 1, 0, 1,
-0.7286728, -1.269578, -2.289089, 0.5960785, 1, 0, 1,
-0.7281865, 0.7071041, -0.7971184, 0.5882353, 1, 0, 1,
-0.7245097, -1.252899, -2.596206, 0.5843138, 1, 0, 1,
-0.7215089, 1.12971, -0.07970998, 0.5764706, 1, 0, 1,
-0.7209532, 0.7722371, -0.5624306, 0.572549, 1, 0, 1,
-0.7201097, -0.08489543, -0.8354102, 0.5647059, 1, 0, 1,
-0.7195088, -1.174983, -1.640514, 0.5607843, 1, 0, 1,
-0.7048993, -1.340799, -3.031487, 0.5529412, 1, 0, 1,
-0.695442, -0.4811039, -1.306396, 0.5490196, 1, 0, 1,
-0.6923435, -0.9371817, -2.765704, 0.5411765, 1, 0, 1,
-0.6790717, -1.230745, -1.728076, 0.5372549, 1, 0, 1,
-0.6790212, 1.829843, 0.06172503, 0.5294118, 1, 0, 1,
-0.6734593, 0.6073453, -0.4279407, 0.5254902, 1, 0, 1,
-0.6709914, -1.264415, -2.520928, 0.5176471, 1, 0, 1,
-0.6706483, 0.746069, -1.963901, 0.5137255, 1, 0, 1,
-0.6693692, -1.963493, -2.807141, 0.5058824, 1, 0, 1,
-0.6523713, -1.102528, -3.021335, 0.5019608, 1, 0, 1,
-0.6518863, 0.4304659, -0.796937, 0.4941176, 1, 0, 1,
-0.6493421, -0.4311379, -3.275742, 0.4862745, 1, 0, 1,
-0.6464404, -0.9367404, -3.626642, 0.4823529, 1, 0, 1,
-0.6427867, 0.4753595, 0.2494424, 0.4745098, 1, 0, 1,
-0.6406959, -1.936823, -2.965785, 0.4705882, 1, 0, 1,
-0.6394865, -0.3299982, -2.347585, 0.4627451, 1, 0, 1,
-0.6370087, -1.127817, -2.561368, 0.4588235, 1, 0, 1,
-0.631516, -1.579693, -2.504663, 0.4509804, 1, 0, 1,
-0.6305863, -0.597901, -3.097645, 0.4470588, 1, 0, 1,
-0.6286651, 0.8626754, -0.238116, 0.4392157, 1, 0, 1,
-0.6281477, 0.4062444, -0.02898659, 0.4352941, 1, 0, 1,
-0.6245788, -0.8471324, -2.103327, 0.427451, 1, 0, 1,
-0.6232762, -0.03371786, -1.464402, 0.4235294, 1, 0, 1,
-0.6213853, -0.1461647, -1.405922, 0.4156863, 1, 0, 1,
-0.6172963, 0.2458684, -1.842417, 0.4117647, 1, 0, 1,
-0.6127545, -0.8563823, -2.352993, 0.4039216, 1, 0, 1,
-0.610354, 0.9444118, 0.1590427, 0.3960784, 1, 0, 1,
-0.6096725, -0.8264756, -1.083161, 0.3921569, 1, 0, 1,
-0.602507, -1.049419, -4.801478, 0.3843137, 1, 0, 1,
-0.6013933, 0.09206247, -2.2541, 0.3803922, 1, 0, 1,
-0.5982794, -0.05512901, -2.82375, 0.372549, 1, 0, 1,
-0.5962986, 0.5207288, -1.117154, 0.3686275, 1, 0, 1,
-0.5945327, 0.35208, 1.032035, 0.3607843, 1, 0, 1,
-0.5880167, -0.9116085, -3.23371, 0.3568628, 1, 0, 1,
-0.5845771, -0.4202536, -2.976216, 0.3490196, 1, 0, 1,
-0.5828668, 0.5155281, 0.8728058, 0.345098, 1, 0, 1,
-0.5820716, -0.2697231, -1.627437, 0.3372549, 1, 0, 1,
-0.5819353, -0.6770792, -3.012363, 0.3333333, 1, 0, 1,
-0.5818096, 0.05421085, -1.705544, 0.3254902, 1, 0, 1,
-0.5772278, 0.7477081, -1.608751, 0.3215686, 1, 0, 1,
-0.5752825, -0.6964832, -1.7251, 0.3137255, 1, 0, 1,
-0.5711237, -1.45031, -3.512315, 0.3098039, 1, 0, 1,
-0.5708733, 0.0866447, -1.802375, 0.3019608, 1, 0, 1,
-0.5698804, 0.8906963, 1.40892, 0.2941177, 1, 0, 1,
-0.5694686, -0.5747477, -3.252849, 0.2901961, 1, 0, 1,
-0.5664585, 0.5129313, -1.795399, 0.282353, 1, 0, 1,
-0.564715, 0.9714156, -1.937063, 0.2784314, 1, 0, 1,
-0.56101, -0.1876958, -1.725274, 0.2705882, 1, 0, 1,
-0.5609534, 1.060591, -0.8199066, 0.2666667, 1, 0, 1,
-0.5555295, -0.3815889, -1.795949, 0.2588235, 1, 0, 1,
-0.5535845, 0.425952, -1.543419, 0.254902, 1, 0, 1,
-0.548129, 1.119281, -0.4271194, 0.2470588, 1, 0, 1,
-0.5360045, -2.241325, -2.442635, 0.2431373, 1, 0, 1,
-0.5250669, 1.791471, -1.034962, 0.2352941, 1, 0, 1,
-0.5228952, 1.97043, 2.0456, 0.2313726, 1, 0, 1,
-0.5206053, -0.1807071, -1.635429, 0.2235294, 1, 0, 1,
-0.5182342, -0.4383422, -1.824168, 0.2196078, 1, 0, 1,
-0.5153941, 1.725675, -0.2570751, 0.2117647, 1, 0, 1,
-0.5141711, -0.3116174, -2.367102, 0.2078431, 1, 0, 1,
-0.5101011, 0.5280508, -0.4642411, 0.2, 1, 0, 1,
-0.50947, 0.6025747, -1.616621, 0.1921569, 1, 0, 1,
-0.50657, 1.304596, -0.6564607, 0.1882353, 1, 0, 1,
-0.506514, 0.2705132, -0.05331573, 0.1803922, 1, 0, 1,
-0.5036236, 0.8825324, -1.086345, 0.1764706, 1, 0, 1,
-0.5014982, 0.5631944, 0.7722632, 0.1686275, 1, 0, 1,
-0.4995413, 0.5723627, -0.7647609, 0.1647059, 1, 0, 1,
-0.4913818, 0.8938789, 0.0885703, 0.1568628, 1, 0, 1,
-0.4877929, 1.159495, 0.949575, 0.1529412, 1, 0, 1,
-0.485231, -0.07715527, -2.31924, 0.145098, 1, 0, 1,
-0.4798073, 0.5920694, -0.2674835, 0.1411765, 1, 0, 1,
-0.4792668, 0.1579491, -0.9064844, 0.1333333, 1, 0, 1,
-0.4783174, 1.118917, -0.1613259, 0.1294118, 1, 0, 1,
-0.4755032, -0.4406024, -2.63168, 0.1215686, 1, 0, 1,
-0.4752688, 1.975234, -1.039368, 0.1176471, 1, 0, 1,
-0.4725031, -1.050836, -3.746655, 0.1098039, 1, 0, 1,
-0.4702434, -1.544391, -2.205546, 0.1058824, 1, 0, 1,
-0.4679433, 0.7500314, -1.207119, 0.09803922, 1, 0, 1,
-0.4659879, -0.369025, -3.554049, 0.09019608, 1, 0, 1,
-0.463733, 0.6047113, 0.2726859, 0.08627451, 1, 0, 1,
-0.4617447, -0.7718505, -3.358466, 0.07843138, 1, 0, 1,
-0.4609246, -0.9047761, -3.550432, 0.07450981, 1, 0, 1,
-0.4588412, -1.001454, -3.263583, 0.06666667, 1, 0, 1,
-0.4575863, -1.409779, -2.765431, 0.0627451, 1, 0, 1,
-0.4496075, -0.2775221, -3.246394, 0.05490196, 1, 0, 1,
-0.4494271, 2.81984, 0.2803604, 0.05098039, 1, 0, 1,
-0.4488375, -1.263906, -2.624272, 0.04313726, 1, 0, 1,
-0.4466554, 1.691403, 1.524624, 0.03921569, 1, 0, 1,
-0.4442807, 1.811075, -0.418598, 0.03137255, 1, 0, 1,
-0.4415958, -2.480322, -4.570284, 0.02745098, 1, 0, 1,
-0.4360661, -1.286873, -3.096733, 0.01960784, 1, 0, 1,
-0.428666, 0.5836517, 0.1742046, 0.01568628, 1, 0, 1,
-0.4254387, -1.472052, -2.88799, 0.007843138, 1, 0, 1,
-0.4247409, 0.2461589, 0.1750847, 0.003921569, 1, 0, 1,
-0.4166015, 0.60451, -1.188805, 0, 1, 0.003921569, 1,
-0.4156777, 0.8995462, -0.6523702, 0, 1, 0.01176471, 1,
-0.412288, -0.1546826, -0.02760649, 0, 1, 0.01568628, 1,
-0.4097264, -1.470331, -3.037315, 0, 1, 0.02352941, 1,
-0.4042716, 0.4835793, -0.9872815, 0, 1, 0.02745098, 1,
-0.4037805, -0.244157, -1.524561, 0, 1, 0.03529412, 1,
-0.4027629, -0.1301947, -1.876284, 0, 1, 0.03921569, 1,
-0.3902402, -1.777401, -5.464564, 0, 1, 0.04705882, 1,
-0.3877142, 0.1021157, -0.7946749, 0, 1, 0.05098039, 1,
-0.387625, -0.8078108, -2.295976, 0, 1, 0.05882353, 1,
-0.3874935, 0.2094375, -2.221489, 0, 1, 0.0627451, 1,
-0.3865314, 0.5018166, -2.570668, 0, 1, 0.07058824, 1,
-0.3847525, 2.286333, -1.439096, 0, 1, 0.07450981, 1,
-0.3826162, -0.3708797, -1.893011, 0, 1, 0.08235294, 1,
-0.3815685, -1.267957, -2.901028, 0, 1, 0.08627451, 1,
-0.3757331, 0.1558862, -1.068297, 0, 1, 0.09411765, 1,
-0.3739197, 0.8929259, 0.2751547, 0, 1, 0.1019608, 1,
-0.3621323, -0.494158, -2.91225, 0, 1, 0.1058824, 1,
-0.3610301, -0.1033437, -0.974824, 0, 1, 0.1137255, 1,
-0.3610049, -1.428927, -4.550959, 0, 1, 0.1176471, 1,
-0.3580949, 0.5834074, -1.075432, 0, 1, 0.1254902, 1,
-0.3554424, 1.136192, -1.032294, 0, 1, 0.1294118, 1,
-0.3528318, -0.7974126, -3.930699, 0, 1, 0.1372549, 1,
-0.352548, -1.156823, -3.198662, 0, 1, 0.1411765, 1,
-0.3513581, -1.446711, -2.956077, 0, 1, 0.1490196, 1,
-0.3481623, 1.387037, 0.8876272, 0, 1, 0.1529412, 1,
-0.3437572, -0.5522497, -1.349833, 0, 1, 0.1607843, 1,
-0.3367011, 1.151171, 0.1914695, 0, 1, 0.1647059, 1,
-0.336454, 0.03834981, -0.6554103, 0, 1, 0.172549, 1,
-0.3332203, -0.5834552, -2.291456, 0, 1, 0.1764706, 1,
-0.3279956, 0.6950701, -1.195315, 0, 1, 0.1843137, 1,
-0.3267371, 1.278251, -0.3114608, 0, 1, 0.1882353, 1,
-0.3255009, 0.7141232, -0.6425129, 0, 1, 0.1960784, 1,
-0.3178982, -0.527122, -2.055365, 0, 1, 0.2039216, 1,
-0.3177151, -0.9537002, -1.516026, 0, 1, 0.2078431, 1,
-0.3124695, -0.08003262, -2.942474, 0, 1, 0.2156863, 1,
-0.3103656, 0.05378408, -0.399568, 0, 1, 0.2196078, 1,
-0.3096588, -0.9489605, -2.101753, 0, 1, 0.227451, 1,
-0.3092971, 0.9096366, -1.017536, 0, 1, 0.2313726, 1,
-0.3046027, -0.8807309, -3.299282, 0, 1, 0.2392157, 1,
-0.3023885, -0.3196394, -2.704209, 0, 1, 0.2431373, 1,
-0.3017828, 0.08978006, -2.410053, 0, 1, 0.2509804, 1,
-0.2989733, -0.1996259, -2.608596, 0, 1, 0.254902, 1,
-0.2988414, -0.1836912, -0.8602285, 0, 1, 0.2627451, 1,
-0.2953341, 0.09596687, 0.3404232, 0, 1, 0.2666667, 1,
-0.2925279, -1.142422, -3.950464, 0, 1, 0.2745098, 1,
-0.2918569, -2.349158, -3.736951, 0, 1, 0.2784314, 1,
-0.2890665, 0.2221337, -2.228633, 0, 1, 0.2862745, 1,
-0.2856273, -0.1586989, -1.472255, 0, 1, 0.2901961, 1,
-0.2855696, -0.6740485, -2.423862, 0, 1, 0.2980392, 1,
-0.2810575, -0.07287326, -0.5929867, 0, 1, 0.3058824, 1,
-0.2798758, 0.09201972, -0.6842398, 0, 1, 0.3098039, 1,
-0.2766546, -0.451923, -2.708649, 0, 1, 0.3176471, 1,
-0.2723374, -0.8380362, -3.719119, 0, 1, 0.3215686, 1,
-0.2722698, 0.07985202, -1.217838, 0, 1, 0.3294118, 1,
-0.2712908, -1.029794, -4.018543, 0, 1, 0.3333333, 1,
-0.2706628, -0.009240559, -1.604115, 0, 1, 0.3411765, 1,
-0.2702762, 0.7503425, -0.801142, 0, 1, 0.345098, 1,
-0.2701807, -0.5906844, -0.5705791, 0, 1, 0.3529412, 1,
-0.267075, 0.2814221, -1.468576, 0, 1, 0.3568628, 1,
-0.2645555, -1.480941, -2.670973, 0, 1, 0.3647059, 1,
-0.2635161, 0.7644144, -0.9442638, 0, 1, 0.3686275, 1,
-0.2631733, 1.265173, 1.59303, 0, 1, 0.3764706, 1,
-0.2629929, 1.409125, -0.7220926, 0, 1, 0.3803922, 1,
-0.2569473, 0.6452821, -0.6605193, 0, 1, 0.3882353, 1,
-0.2551698, 0.6256667, -1.079214, 0, 1, 0.3921569, 1,
-0.2549203, -1.887319, -2.603053, 0, 1, 0.4, 1,
-0.2542961, 2.256614, -1.808234, 0, 1, 0.4078431, 1,
-0.253177, 0.8100855, -1.863922, 0, 1, 0.4117647, 1,
-0.2522623, 2.054364, -0.7456627, 0, 1, 0.4196078, 1,
-0.2484854, 0.0143826, -1.702451, 0, 1, 0.4235294, 1,
-0.2454337, 1.175639, 0.05994635, 0, 1, 0.4313726, 1,
-0.2411891, -0.4692211, -2.508157, 0, 1, 0.4352941, 1,
-0.2342869, -0.801205, -1.708375, 0, 1, 0.4431373, 1,
-0.2330239, 1.223996, -1.571977, 0, 1, 0.4470588, 1,
-0.2300864, -1.682587, -1.624576, 0, 1, 0.454902, 1,
-0.2267491, -0.07309604, -1.0543, 0, 1, 0.4588235, 1,
-0.225416, -1.05906, -3.361603, 0, 1, 0.4666667, 1,
-0.2250918, 1.644683, -1.347368, 0, 1, 0.4705882, 1,
-0.2239523, 1.457536, -0.1746355, 0, 1, 0.4784314, 1,
-0.2227213, -0.7014186, -3.514622, 0, 1, 0.4823529, 1,
-0.2209949, 0.7458459, 1.789338, 0, 1, 0.4901961, 1,
-0.2147475, -0.7774265, -4.028213, 0, 1, 0.4941176, 1,
-0.2136881, -0.05161482, -2.137576, 0, 1, 0.5019608, 1,
-0.2112009, -0.6776845, -1.531794, 0, 1, 0.509804, 1,
-0.2109259, -0.5215909, -4.580067, 0, 1, 0.5137255, 1,
-0.1979622, -0.692552, -4.59313, 0, 1, 0.5215687, 1,
-0.1956783, 0.9693316, -1.168327, 0, 1, 0.5254902, 1,
-0.194868, 0.6812633, -0.9026515, 0, 1, 0.5333334, 1,
-0.1941238, 0.4244346, 0.01126899, 0, 1, 0.5372549, 1,
-0.1935229, 0.1580899, -0.0441336, 0, 1, 0.5450981, 1,
-0.1924803, 0.7820618, 0.3158948, 0, 1, 0.5490196, 1,
-0.1883486, -0.6368986, -0.9458097, 0, 1, 0.5568628, 1,
-0.1871511, 0.1989799, -0.616493, 0, 1, 0.5607843, 1,
-0.1850705, -0.2590102, -3.033453, 0, 1, 0.5686275, 1,
-0.1827751, -1.646073, -3.894109, 0, 1, 0.572549, 1,
-0.1815332, -0.3961877, -2.826018, 0, 1, 0.5803922, 1,
-0.1805255, 0.3358868, -0.7614106, 0, 1, 0.5843138, 1,
-0.176367, 1.110533, -1.557276, 0, 1, 0.5921569, 1,
-0.1730612, 0.7189502, -2.352228, 0, 1, 0.5960785, 1,
-0.1682194, 1.568695, -0.471974, 0, 1, 0.6039216, 1,
-0.1662336, -0.1407185, -1.220123, 0, 1, 0.6117647, 1,
-0.1638201, -1.034548, -2.67539, 0, 1, 0.6156863, 1,
-0.1591817, 0.6090102, -0.08326506, 0, 1, 0.6235294, 1,
-0.1450027, 1.685775, -0.04243871, 0, 1, 0.627451, 1,
-0.1442747, 0.3548773, 0.5050856, 0, 1, 0.6352941, 1,
-0.1423812, 0.7356689, 0.462071, 0, 1, 0.6392157, 1,
-0.1415249, 1.18529, 0.03438565, 0, 1, 0.6470588, 1,
-0.1408481, -0.2658008, -1.162803, 0, 1, 0.6509804, 1,
-0.140673, -0.4264498, -3.0964, 0, 1, 0.6588235, 1,
-0.1397349, -0.5226269, -2.621626, 0, 1, 0.6627451, 1,
-0.1330706, -0.6123423, -2.682651, 0, 1, 0.6705883, 1,
-0.132834, -0.6273074, -0.7057354, 0, 1, 0.6745098, 1,
-0.1248712, -0.326229, -3.88336, 0, 1, 0.682353, 1,
-0.1247859, -0.3040397, -3.220654, 0, 1, 0.6862745, 1,
-0.1184964, 1.250146, -0.7691776, 0, 1, 0.6941177, 1,
-0.1147602, 0.8750657, -0.6435145, 0, 1, 0.7019608, 1,
-0.1147448, -0.4354325, -2.79322, 0, 1, 0.7058824, 1,
-0.1116956, 0.1404001, -1.681342, 0, 1, 0.7137255, 1,
-0.1107842, 0.07769392, -0.6886815, 0, 1, 0.7176471, 1,
-0.1100177, 0.05696715, -1.736418, 0, 1, 0.7254902, 1,
-0.1060157, -0.8521853, -2.595379, 0, 1, 0.7294118, 1,
-0.102823, -0.3425398, -2.098442, 0, 1, 0.7372549, 1,
-0.1000454, 1.330815, -0.8192153, 0, 1, 0.7411765, 1,
-0.09808878, -0.6124219, -2.090475, 0, 1, 0.7490196, 1,
-0.09537482, -0.6336054, -1.641844, 0, 1, 0.7529412, 1,
-0.09158558, 0.3252565, 0.4419201, 0, 1, 0.7607843, 1,
-0.08802518, -2.939317, -3.735367, 0, 1, 0.7647059, 1,
-0.08777081, -0.376538, -2.715676, 0, 1, 0.772549, 1,
-0.08580352, -0.5325426, -2.15919, 0, 1, 0.7764706, 1,
-0.0816955, 0.1650029, 0.4738367, 0, 1, 0.7843137, 1,
-0.08062732, -0.9917019, -4.952197, 0, 1, 0.7882353, 1,
-0.0718497, 0.124394, -1.383028, 0, 1, 0.7960784, 1,
-0.06947143, 0.6222523, 0.7405841, 0, 1, 0.8039216, 1,
-0.06917325, 1.371868, -0.7753921, 0, 1, 0.8078431, 1,
-0.06914308, 0.6292873, 1.126968, 0, 1, 0.8156863, 1,
-0.06898838, -0.1705202, -3.801285, 0, 1, 0.8196079, 1,
-0.06765202, -0.3081423, -3.710376, 0, 1, 0.827451, 1,
-0.06719396, -0.4359304, -3.833159, 0, 1, 0.8313726, 1,
-0.06576703, -0.791689, -3.179047, 0, 1, 0.8392157, 1,
-0.06537055, 0.978774, 0.597671, 0, 1, 0.8431373, 1,
-0.06277464, -1.208532, -3.919213, 0, 1, 0.8509804, 1,
-0.06267671, -1.995871, -2.265502, 0, 1, 0.854902, 1,
-0.06013713, -1.967887, -2.859928, 0, 1, 0.8627451, 1,
-0.0598086, -0.2551888, -4.510139, 0, 1, 0.8666667, 1,
-0.0582539, 1.642536, 1.483302, 0, 1, 0.8745098, 1,
-0.05678132, -0.6016878, -4.785651, 0, 1, 0.8784314, 1,
-0.05353641, 0.1351155, -1.669264, 0, 1, 0.8862745, 1,
-0.05239705, -1.552768, -4.307083, 0, 1, 0.8901961, 1,
-0.04416483, 0.3414544, -1.135049, 0, 1, 0.8980392, 1,
-0.04403174, -1.804914, -5.826271, 0, 1, 0.9058824, 1,
-0.04323349, -0.7745466, -3.197145, 0, 1, 0.9098039, 1,
-0.0392229, -0.8789476, -3.88816, 0, 1, 0.9176471, 1,
-0.03905534, -0.8573542, -2.667563, 0, 1, 0.9215686, 1,
-0.03889146, -0.653025, -4.152466, 0, 1, 0.9294118, 1,
-0.03786846, -1.037608, -2.470277, 0, 1, 0.9333333, 1,
-0.0350449, -0.3168446, -3.401233, 0, 1, 0.9411765, 1,
-0.03347171, -1.226588, -2.913321, 0, 1, 0.945098, 1,
-0.03315055, 0.8002367, -1.03134, 0, 1, 0.9529412, 1,
-0.03272407, -0.0166717, -1.346623, 0, 1, 0.9568627, 1,
-0.03271834, -0.7222376, -1.126785, 0, 1, 0.9647059, 1,
-0.03219906, 0.3329512, -1.3028, 0, 1, 0.9686275, 1,
-0.02766433, -1.272044, -2.512575, 0, 1, 0.9764706, 1,
-0.02583459, -1.184633, -2.481434, 0, 1, 0.9803922, 1,
-0.02181957, -0.8493885, -1.644464, 0, 1, 0.9882353, 1,
-0.02165781, -0.1758152, -3.554789, 0, 1, 0.9921569, 1,
-0.01298734, -0.9937175, -2.804112, 0, 1, 1, 1,
-0.005352471, -0.3796346, -3.606991, 0, 0.9921569, 1, 1,
-0.004190359, 0.6262613, -0.8327871, 0, 0.9882353, 1, 1,
-0.0004088382, -0.588172, -3.23088, 0, 0.9803922, 1, 1,
0.001884861, -0.07121374, 0.8249485, 0, 0.9764706, 1, 1,
0.002294922, -0.2456652, 2.540786, 0, 0.9686275, 1, 1,
0.003445465, 0.04061188, 0.7241893, 0, 0.9647059, 1, 1,
0.008212928, -0.8779396, 3.232413, 0, 0.9568627, 1, 1,
0.01096157, -0.4315806, 4.715583, 0, 0.9529412, 1, 1,
0.0111229, 0.5972685, -0.2059531, 0, 0.945098, 1, 1,
0.01284976, 0.2736351, 1.943391, 0, 0.9411765, 1, 1,
0.01356103, 0.8945121, -0.082698, 0, 0.9333333, 1, 1,
0.01398122, -0.7564471, 4.261182, 0, 0.9294118, 1, 1,
0.0193215, -0.3530608, 3.499232, 0, 0.9215686, 1, 1,
0.01950992, -0.8501001, 3.490814, 0, 0.9176471, 1, 1,
0.02912946, 0.1933473, -0.5116343, 0, 0.9098039, 1, 1,
0.030066, 0.6859062, 0.4139636, 0, 0.9058824, 1, 1,
0.03467139, -0.9889563, 3.535413, 0, 0.8980392, 1, 1,
0.03679211, -1.342096, 3.629372, 0, 0.8901961, 1, 1,
0.03808298, 0.5947365, 0.04079792, 0, 0.8862745, 1, 1,
0.04835835, 1.004854, -0.6357297, 0, 0.8784314, 1, 1,
0.04989086, -0.4936095, 3.205714, 0, 0.8745098, 1, 1,
0.05438798, -0.8234927, 1.909427, 0, 0.8666667, 1, 1,
0.05585896, -1.855472, 2.160844, 0, 0.8627451, 1, 1,
0.05606065, 0.02307859, -0.1278793, 0, 0.854902, 1, 1,
0.0578093, -0.5243946, 3.808046, 0, 0.8509804, 1, 1,
0.0604595, 0.5867262, 1.728974, 0, 0.8431373, 1, 1,
0.06443214, -0.07156703, 1.904077, 0, 0.8392157, 1, 1,
0.07247616, 0.5277835, 1.814149, 0, 0.8313726, 1, 1,
0.07698476, -1.419995, 2.947379, 0, 0.827451, 1, 1,
0.07979677, -0.2662139, 2.212821, 0, 0.8196079, 1, 1,
0.08041618, -0.4669635, 3.772671, 0, 0.8156863, 1, 1,
0.08218803, -0.0522352, 3.210949, 0, 0.8078431, 1, 1,
0.08251458, -0.5843404, 1.954425, 0, 0.8039216, 1, 1,
0.08372928, -0.8452863, 1.561194, 0, 0.7960784, 1, 1,
0.08746813, 0.05299867, -1.412363, 0, 0.7882353, 1, 1,
0.08916833, -0.234792, 3.377563, 0, 0.7843137, 1, 1,
0.09251603, -0.8004354, 2.727115, 0, 0.7764706, 1, 1,
0.09405474, -1.14848, 3.771771, 0, 0.772549, 1, 1,
0.09457844, 1.636645, -0.576705, 0, 0.7647059, 1, 1,
0.09623969, -0.8077933, 1.647985, 0, 0.7607843, 1, 1,
0.09881562, 0.3597097, -0.1042217, 0, 0.7529412, 1, 1,
0.09946116, 0.5870915, 0.1897193, 0, 0.7490196, 1, 1,
0.1009356, 0.6375256, -0.4356138, 0, 0.7411765, 1, 1,
0.1067447, -2.464984, 1.670563, 0, 0.7372549, 1, 1,
0.1088885, -2.559062, 4.815063, 0, 0.7294118, 1, 1,
0.110043, 0.7485403, 0.5753187, 0, 0.7254902, 1, 1,
0.1115563, 1.341846, 0.2125435, 0, 0.7176471, 1, 1,
0.1129897, -0.8765658, 2.449099, 0, 0.7137255, 1, 1,
0.1135216, 2.002132, 0.01698942, 0, 0.7058824, 1, 1,
0.1161313, 1.801369, 0.4608411, 0, 0.6980392, 1, 1,
0.1178314, 0.2091983, 1.010374, 0, 0.6941177, 1, 1,
0.1237759, 0.6477621, 1.874384, 0, 0.6862745, 1, 1,
0.1247321, -0.6342375, 4.171465, 0, 0.682353, 1, 1,
0.1255033, 0.6101235, -1.126049, 0, 0.6745098, 1, 1,
0.1258542, 0.679671, -0.2157654, 0, 0.6705883, 1, 1,
0.1262266, 0.614843, 0.6696535, 0, 0.6627451, 1, 1,
0.1273657, -0.3537519, 2.783989, 0, 0.6588235, 1, 1,
0.1353301, -0.02059842, 0.832314, 0, 0.6509804, 1, 1,
0.1357418, -0.3128804, 1.762592, 0, 0.6470588, 1, 1,
0.1368823, 0.8165206, -2.094401, 0, 0.6392157, 1, 1,
0.1395296, 0.7476579, 1.149506, 0, 0.6352941, 1, 1,
0.1416484, 0.5851964, 0.1511814, 0, 0.627451, 1, 1,
0.145303, 0.2012381, 0.5867281, 0, 0.6235294, 1, 1,
0.146269, 0.5854703, 0.6729866, 0, 0.6156863, 1, 1,
0.146476, 0.393191, -0.7575955, 0, 0.6117647, 1, 1,
0.1497268, 0.3291098, -0.03090673, 0, 0.6039216, 1, 1,
0.1560236, -0.7061946, 3.814576, 0, 0.5960785, 1, 1,
0.1562992, -0.289306, 1.70076, 0, 0.5921569, 1, 1,
0.1580373, 1.967775, 0.7101189, 0, 0.5843138, 1, 1,
0.1588081, 0.4424874, 0.1757401, 0, 0.5803922, 1, 1,
0.1729584, -0.7889703, 3.445947, 0, 0.572549, 1, 1,
0.176222, -1.543471, 2.183611, 0, 0.5686275, 1, 1,
0.1791665, 0.08620484, 0.4700238, 0, 0.5607843, 1, 1,
0.1820816, -0.33442, 1.028922, 0, 0.5568628, 1, 1,
0.1850311, 0.6024417, 0.8652539, 0, 0.5490196, 1, 1,
0.1871165, 1.925341, -0.1213374, 0, 0.5450981, 1, 1,
0.187488, 0.1263479, 0.6756646, 0, 0.5372549, 1, 1,
0.1875493, -0.5937467, 2.153876, 0, 0.5333334, 1, 1,
0.1876711, 2.185466, -1.554676, 0, 0.5254902, 1, 1,
0.1890139, -0.3442709, 1.302549, 0, 0.5215687, 1, 1,
0.1926912, -0.5148461, 4.360522, 0, 0.5137255, 1, 1,
0.1928893, 0.01766566, 2.533167, 0, 0.509804, 1, 1,
0.1958796, 1.302573, -0.5441868, 0, 0.5019608, 1, 1,
0.2026568, -2.356811, 3.864972, 0, 0.4941176, 1, 1,
0.2029194, -0.7976856, 3.936388, 0, 0.4901961, 1, 1,
0.2065896, -0.2187616, 2.145972, 0, 0.4823529, 1, 1,
0.2108422, 0.3396395, -0.02140673, 0, 0.4784314, 1, 1,
0.2121466, -0.8049833, 2.853516, 0, 0.4705882, 1, 1,
0.2126599, -0.4990758, 2.416178, 0, 0.4666667, 1, 1,
0.2142729, 2.083053, -0.0576739, 0, 0.4588235, 1, 1,
0.2149292, 0.1033757, 1.614936, 0, 0.454902, 1, 1,
0.2188658, -0.2957825, 2.448591, 0, 0.4470588, 1, 1,
0.2223733, -1.683731, 2.315553, 0, 0.4431373, 1, 1,
0.2264894, 0.03904725, 1.285222, 0, 0.4352941, 1, 1,
0.2275559, 0.8453578, 0.731323, 0, 0.4313726, 1, 1,
0.230185, -2.760359, 3.671023, 0, 0.4235294, 1, 1,
0.2351386, -1.175344, 4.059039, 0, 0.4196078, 1, 1,
0.2412949, -0.4856684, 0.3568452, 0, 0.4117647, 1, 1,
0.2416067, 1.282816, -0.3174669, 0, 0.4078431, 1, 1,
0.242044, 0.3465914, 0.5486355, 0, 0.4, 1, 1,
0.2433307, -0.6135333, 2.315013, 0, 0.3921569, 1, 1,
0.2463099, -1.388133, 4.982852, 0, 0.3882353, 1, 1,
0.2466239, -1.41039, 3.868285, 0, 0.3803922, 1, 1,
0.2483732, 1.185368, 0.5139191, 0, 0.3764706, 1, 1,
0.2504364, 0.6931335, -0.6239185, 0, 0.3686275, 1, 1,
0.2559253, 0.4409738, 0.5556576, 0, 0.3647059, 1, 1,
0.256045, -1.718666, 3.211254, 0, 0.3568628, 1, 1,
0.2613384, -0.1763259, 3.02628, 0, 0.3529412, 1, 1,
0.2622235, 0.496584, -0.03283742, 0, 0.345098, 1, 1,
0.2622561, -0.1264625, 3.278333, 0, 0.3411765, 1, 1,
0.2633406, 0.3315965, -0.6058583, 0, 0.3333333, 1, 1,
0.2712292, 0.2198453, 0.8205268, 0, 0.3294118, 1, 1,
0.2748682, -0.3968675, 1.236179, 0, 0.3215686, 1, 1,
0.2772413, 0.3041205, -0.1530414, 0, 0.3176471, 1, 1,
0.2811791, -0.960938, 2.736671, 0, 0.3098039, 1, 1,
0.2814606, -0.8017577, 2.12224, 0, 0.3058824, 1, 1,
0.2841412, -0.3434439, 3.514078, 0, 0.2980392, 1, 1,
0.294026, -1.16518, 2.983824, 0, 0.2901961, 1, 1,
0.2950533, -1.573879, 1.270549, 0, 0.2862745, 1, 1,
0.2951839, 0.67631, 0.007368128, 0, 0.2784314, 1, 1,
0.2999762, 0.645629, 0.6711547, 0, 0.2745098, 1, 1,
0.3027528, 0.4921159, 1.604749, 0, 0.2666667, 1, 1,
0.3062465, -0.1407173, 2.833543, 0, 0.2627451, 1, 1,
0.3072727, 0.8878741, 1.243527, 0, 0.254902, 1, 1,
0.3087091, -1.279246, 4.2883, 0, 0.2509804, 1, 1,
0.3097669, -0.2983584, 3.473464, 0, 0.2431373, 1, 1,
0.3105384, -0.5728657, 1.869255, 0, 0.2392157, 1, 1,
0.3144525, 0.1575041, 1.417076, 0, 0.2313726, 1, 1,
0.3149468, -0.5141436, 2.978015, 0, 0.227451, 1, 1,
0.3176456, -0.2765239, 2.040055, 0, 0.2196078, 1, 1,
0.3232371, -0.3562892, 1.972395, 0, 0.2156863, 1, 1,
0.3252138, -0.1019487, 2.483643, 0, 0.2078431, 1, 1,
0.3266334, 0.5272086, -0.7641773, 0, 0.2039216, 1, 1,
0.3274321, 0.2138867, 1.156528, 0, 0.1960784, 1, 1,
0.3302398, 0.08410213, 1.383257, 0, 0.1882353, 1, 1,
0.3321731, 0.633584, -0.55563, 0, 0.1843137, 1, 1,
0.3352935, -0.6717385, 1.186458, 0, 0.1764706, 1, 1,
0.3367904, -0.532023, 1.661639, 0, 0.172549, 1, 1,
0.3378778, 0.6621, 1.545224, 0, 0.1647059, 1, 1,
0.3407463, -1.902499, 0.2838375, 0, 0.1607843, 1, 1,
0.3436653, -1.027777, 3.506925, 0, 0.1529412, 1, 1,
0.3441823, 0.9870521, -1.899444, 0, 0.1490196, 1, 1,
0.3445179, -0.09270944, 3.75325, 0, 0.1411765, 1, 1,
0.3446884, -0.03520791, 0.3720267, 0, 0.1372549, 1, 1,
0.3462232, 0.3690756, 1.14782, 0, 0.1294118, 1, 1,
0.3467969, -0.5259264, 3.349677, 0, 0.1254902, 1, 1,
0.35127, -0.7330608, 3.573211, 0, 0.1176471, 1, 1,
0.3554013, 0.08916803, 1.404324, 0, 0.1137255, 1, 1,
0.3560679, 1.031959, 0.5846303, 0, 0.1058824, 1, 1,
0.3571207, -0.1143565, 1.641395, 0, 0.09803922, 1, 1,
0.360407, 0.6056225, 1.063786, 0, 0.09411765, 1, 1,
0.3606825, -1.078275, 2.380407, 0, 0.08627451, 1, 1,
0.3610179, -0.3443551, 2.825904, 0, 0.08235294, 1, 1,
0.3614155, -0.5219941, 2.616857, 0, 0.07450981, 1, 1,
0.3675615, 0.6735478, 0.8110464, 0, 0.07058824, 1, 1,
0.3689235, 0.4945924, 1.261499, 0, 0.0627451, 1, 1,
0.3690265, -1.517366, 4.405695, 0, 0.05882353, 1, 1,
0.3695857, -0.4803614, 1.808322, 0, 0.05098039, 1, 1,
0.3712944, -0.4227656, 1.311932, 0, 0.04705882, 1, 1,
0.3746828, 0.3070982, -0.7536, 0, 0.03921569, 1, 1,
0.3757099, 0.2309841, 1.484344, 0, 0.03529412, 1, 1,
0.3763539, -0.3696666, 1.858494, 0, 0.02745098, 1, 1,
0.3764102, 0.02630918, 1.023406, 0, 0.02352941, 1, 1,
0.3766147, 0.664888, -0.5767561, 0, 0.01568628, 1, 1,
0.3778546, -1.830466, 4.062011, 0, 0.01176471, 1, 1,
0.3782759, 0.2433366, -0.009096558, 0, 0.003921569, 1, 1,
0.3804261, 1.362438, 0.6159459, 0.003921569, 0, 1, 1,
0.3841714, -0.4160233, 2.402514, 0.007843138, 0, 1, 1,
0.3949973, -1.029169, 2.269304, 0.01568628, 0, 1, 1,
0.4016289, 0.526364, 0.1083453, 0.01960784, 0, 1, 1,
0.4078304, 1.086958, 0.1453275, 0.02745098, 0, 1, 1,
0.4081084, -0.3544125, 0.4941825, 0.03137255, 0, 1, 1,
0.4144311, -0.5509832, 3.426677, 0.03921569, 0, 1, 1,
0.4154342, -1.872782, 5.478152, 0.04313726, 0, 1, 1,
0.4220371, -0.9559884, 3.185061, 0.05098039, 0, 1, 1,
0.4256741, 0.3395946, 0.926564, 0.05490196, 0, 1, 1,
0.4271755, 0.1031683, 1.66013, 0.0627451, 0, 1, 1,
0.4280132, 1.438086, -1.094588, 0.06666667, 0, 1, 1,
0.4295042, 0.4140363, 1.187546, 0.07450981, 0, 1, 1,
0.4372007, 1.136056, -0.3865497, 0.07843138, 0, 1, 1,
0.4436132, -0.3728257, 2.449067, 0.08627451, 0, 1, 1,
0.4455741, -1.072959, 2.645387, 0.09019608, 0, 1, 1,
0.4462936, -0.4220472, 0.5201224, 0.09803922, 0, 1, 1,
0.4488447, -1.039479, 3.558469, 0.1058824, 0, 1, 1,
0.4512215, -0.8296941, 4.093284, 0.1098039, 0, 1, 1,
0.4531893, -0.1033262, 3.33824, 0.1176471, 0, 1, 1,
0.4563975, 2.014436, 0.7133791, 0.1215686, 0, 1, 1,
0.4611997, -0.1406348, 2.452698, 0.1294118, 0, 1, 1,
0.462522, 1.330381, 0.515077, 0.1333333, 0, 1, 1,
0.4658647, 0.2442096, 0.6963785, 0.1411765, 0, 1, 1,
0.4684231, -1.970281, 3.756031, 0.145098, 0, 1, 1,
0.4701244, -0.9738517, 2.852446, 0.1529412, 0, 1, 1,
0.4704012, -0.1736685, 1.973397, 0.1568628, 0, 1, 1,
0.4729343, 0.4185698, -0.6781831, 0.1647059, 0, 1, 1,
0.473462, -1.252361, 2.94329, 0.1686275, 0, 1, 1,
0.4752684, 0.8532435, -1.348165, 0.1764706, 0, 1, 1,
0.476905, 0.5965013, 0.8557106, 0.1803922, 0, 1, 1,
0.4780054, -1.721304, 3.710425, 0.1882353, 0, 1, 1,
0.4820401, 0.9212496, -1.111666, 0.1921569, 0, 1, 1,
0.4855193, -1.442435, 4.135983, 0.2, 0, 1, 1,
0.4910817, -1.102322, -0.02032067, 0.2078431, 0, 1, 1,
0.4967903, -2.673528, 4.364923, 0.2117647, 0, 1, 1,
0.5038824, -1.069591, 3.152982, 0.2196078, 0, 1, 1,
0.5127236, 1.911234, -1.10142, 0.2235294, 0, 1, 1,
0.5136011, -0.2444614, 0.6613142, 0.2313726, 0, 1, 1,
0.5342161, -0.4240073, 0.534881, 0.2352941, 0, 1, 1,
0.5346889, -1.944615, 3.398613, 0.2431373, 0, 1, 1,
0.537726, 0.04492782, 2.909961, 0.2470588, 0, 1, 1,
0.5389479, 0.1749835, 1.305167, 0.254902, 0, 1, 1,
0.5459546, -0.4787112, 1.57027, 0.2588235, 0, 1, 1,
0.5485983, 1.159878, -0.5031875, 0.2666667, 0, 1, 1,
0.5494569, -0.9912115, 1.97415, 0.2705882, 0, 1, 1,
0.5507883, 0.4816517, -0.8311863, 0.2784314, 0, 1, 1,
0.5519721, 2.054275, -0.9213938, 0.282353, 0, 1, 1,
0.5523889, -0.6331752, 2.634957, 0.2901961, 0, 1, 1,
0.5538671, -1.493357, 4.327439, 0.2941177, 0, 1, 1,
0.5546642, -0.4751064, 3.730018, 0.3019608, 0, 1, 1,
0.5561246, 0.1280086, 1.160679, 0.3098039, 0, 1, 1,
0.5589291, 0.8427186, 0.8316448, 0.3137255, 0, 1, 1,
0.566497, -0.2635556, 1.112487, 0.3215686, 0, 1, 1,
0.5680265, -0.6673937, 2.489354, 0.3254902, 0, 1, 1,
0.5698441, -0.1000826, 1.947052, 0.3333333, 0, 1, 1,
0.5700352, 0.2367156, 0.3018622, 0.3372549, 0, 1, 1,
0.5718005, -1.459128, 2.606782, 0.345098, 0, 1, 1,
0.5748604, 0.1244204, 0.901767, 0.3490196, 0, 1, 1,
0.5756372, -0.3768682, 0.9802068, 0.3568628, 0, 1, 1,
0.5764664, -0.540613, 1.249701, 0.3607843, 0, 1, 1,
0.5926311, -0.4455788, 2.021331, 0.3686275, 0, 1, 1,
0.5977674, -0.2206209, 2.292873, 0.372549, 0, 1, 1,
0.5991794, 1.129061, -0.1022855, 0.3803922, 0, 1, 1,
0.6005726, -1.125133, 0.7850316, 0.3843137, 0, 1, 1,
0.6031002, -0.3726637, 2.329722, 0.3921569, 0, 1, 1,
0.6037609, 1.131017, 1.10376, 0.3960784, 0, 1, 1,
0.6047348, -0.2928541, 1.496132, 0.4039216, 0, 1, 1,
0.6188706, 0.1763871, 2.742057, 0.4117647, 0, 1, 1,
0.6194933, -0.9884794, 2.291921, 0.4156863, 0, 1, 1,
0.621487, -0.07224452, 0.8540066, 0.4235294, 0, 1, 1,
0.6220571, -0.4693708, 1.367988, 0.427451, 0, 1, 1,
0.6251104, -1.067989, 3.067695, 0.4352941, 0, 1, 1,
0.6345159, -1.712669, 3.968095, 0.4392157, 0, 1, 1,
0.6364047, -0.4917916, 2.265574, 0.4470588, 0, 1, 1,
0.6622953, 1.342644, -0.2137908, 0.4509804, 0, 1, 1,
0.6657108, 0.08517423, 2.104137, 0.4588235, 0, 1, 1,
0.6670556, -1.508373, 2.746354, 0.4627451, 0, 1, 1,
0.6673183, -0.2904017, 1.907201, 0.4705882, 0, 1, 1,
0.6682611, 0.01169232, 1.706812, 0.4745098, 0, 1, 1,
0.6691476, 0.1151896, 0.3797337, 0.4823529, 0, 1, 1,
0.6721053, -2.579037, 3.68238, 0.4862745, 0, 1, 1,
0.6730555, -0.5063328, 4.49324, 0.4941176, 0, 1, 1,
0.677304, -2.637029, 2.777261, 0.5019608, 0, 1, 1,
0.6781259, 0.8962526, 2.912905, 0.5058824, 0, 1, 1,
0.6827267, 0.7811632, -0.5662215, 0.5137255, 0, 1, 1,
0.6835194, -0.05037466, 3.947084, 0.5176471, 0, 1, 1,
0.6866867, 0.2517719, 0.7659526, 0.5254902, 0, 1, 1,
0.6933598, -1.917019, 3.386036, 0.5294118, 0, 1, 1,
0.6984758, 0.8308951, 1.817055, 0.5372549, 0, 1, 1,
0.6997301, 1.205954, 1.945297, 0.5411765, 0, 1, 1,
0.6998005, 0.562497, 0.7685324, 0.5490196, 0, 1, 1,
0.7007282, -0.6087877, 2.591394, 0.5529412, 0, 1, 1,
0.706348, 0.3013909, 0.7443771, 0.5607843, 0, 1, 1,
0.7178379, 1.71615, 0.07812693, 0.5647059, 0, 1, 1,
0.7188216, 0.1886166, 1.309386, 0.572549, 0, 1, 1,
0.7283661, 0.2895162, 1.589728, 0.5764706, 0, 1, 1,
0.7297807, 0.03461588, 1.705378, 0.5843138, 0, 1, 1,
0.736056, -0.3138244, 0.680882, 0.5882353, 0, 1, 1,
0.7363219, 0.3229379, 1.125543, 0.5960785, 0, 1, 1,
0.7386748, -0.3377202, 0.5296301, 0.6039216, 0, 1, 1,
0.7444881, 0.02689813, -0.7910554, 0.6078432, 0, 1, 1,
0.7495009, 0.6925365, 0.9900026, 0.6156863, 0, 1, 1,
0.7518802, -1.276305, 2.224613, 0.6196079, 0, 1, 1,
0.7567355, 0.6907102, -0.03038813, 0.627451, 0, 1, 1,
0.7584357, 1.298652, -0.6089677, 0.6313726, 0, 1, 1,
0.7628605, 1.177312, 0.04243753, 0.6392157, 0, 1, 1,
0.769178, -0.5176452, 2.409575, 0.6431373, 0, 1, 1,
0.7729669, -0.3586734, 1.415387, 0.6509804, 0, 1, 1,
0.775712, 1.396602, 1.777022, 0.654902, 0, 1, 1,
0.7898028, -1.224797, 2.945952, 0.6627451, 0, 1, 1,
0.7951975, 0.8479576, 0.190633, 0.6666667, 0, 1, 1,
0.7974124, 0.01793783, 3.252871, 0.6745098, 0, 1, 1,
0.7977207, 0.602861, 2.680556, 0.6784314, 0, 1, 1,
0.8032033, 1.09467, 0.7132699, 0.6862745, 0, 1, 1,
0.8073754, -0.4432484, 1.942196, 0.6901961, 0, 1, 1,
0.8088422, 0.8745558, 1.560848, 0.6980392, 0, 1, 1,
0.8107477, 0.9197002, 0.08114916, 0.7058824, 0, 1, 1,
0.8164079, 0.2210432, 0.8644947, 0.7098039, 0, 1, 1,
0.818059, -0.5213318, 1.18687, 0.7176471, 0, 1, 1,
0.8211836, 0.6638035, -0.743939, 0.7215686, 0, 1, 1,
0.8230234, 0.5191249, 2.264715, 0.7294118, 0, 1, 1,
0.8277439, 1.474063, 0.9384784, 0.7333333, 0, 1, 1,
0.8379529, -3.312515, 3.621465, 0.7411765, 0, 1, 1,
0.8412768, 1.070876, 0.9014141, 0.7450981, 0, 1, 1,
0.8489162, 1.946631, 0.4965749, 0.7529412, 0, 1, 1,
0.8505675, 0.01500835, 1.712664, 0.7568628, 0, 1, 1,
0.8537396, -0.7444041, 1.400134, 0.7647059, 0, 1, 1,
0.8565252, 0.7479553, 0.009290935, 0.7686275, 0, 1, 1,
0.8569254, 1.393168, 0.3951506, 0.7764706, 0, 1, 1,
0.8571301, 0.07725319, 1.939419, 0.7803922, 0, 1, 1,
0.8677217, 0.2548985, -1.19453, 0.7882353, 0, 1, 1,
0.8687711, -0.1170075, 0.3420641, 0.7921569, 0, 1, 1,
0.8690233, 0.6233174, 0.8067165, 0.8, 0, 1, 1,
0.8702442, -0.06035726, 1.986879, 0.8078431, 0, 1, 1,
0.8708751, 1.970737, -0.08720385, 0.8117647, 0, 1, 1,
0.87501, -1.516934, 2.600832, 0.8196079, 0, 1, 1,
0.8753496, 1.67153, 1.804302, 0.8235294, 0, 1, 1,
0.8757672, 0.3190179, 1.469211, 0.8313726, 0, 1, 1,
0.8922416, 0.02703372, 1.587653, 0.8352941, 0, 1, 1,
0.8945444, 0.006560602, 1.255551, 0.8431373, 0, 1, 1,
0.9063248, 2.191709e-05, 1.779455, 0.8470588, 0, 1, 1,
0.9171047, -0.9116145, 2.849874, 0.854902, 0, 1, 1,
0.9184824, -1.191818, 3.109541, 0.8588235, 0, 1, 1,
0.9191008, 2.566159, 1.039179, 0.8666667, 0, 1, 1,
0.9220454, 0.3934166, -0.1185912, 0.8705882, 0, 1, 1,
0.9274206, 0.5873682, 1.305795, 0.8784314, 0, 1, 1,
0.9276363, 1.055353, 0.70053, 0.8823529, 0, 1, 1,
0.9383386, 0.5203639, 0.1452918, 0.8901961, 0, 1, 1,
0.9412719, 0.2558714, -1.46776, 0.8941177, 0, 1, 1,
0.9499725, -0.7344766, 3.625024, 0.9019608, 0, 1, 1,
0.9510471, -2.307266, 4.471281, 0.9098039, 0, 1, 1,
0.9587096, 1.518861, 0.2901598, 0.9137255, 0, 1, 1,
0.9661826, 0.2663296, 1.123238, 0.9215686, 0, 1, 1,
0.9702734, 1.108462, -0.2883337, 0.9254902, 0, 1, 1,
0.9731327, 0.1568233, 2.727034, 0.9333333, 0, 1, 1,
0.9748129, -0.9509649, 3.536293, 0.9372549, 0, 1, 1,
0.9768503, 0.636582, -0.2796415, 0.945098, 0, 1, 1,
0.9823806, -0.03506587, 2.192472, 0.9490196, 0, 1, 1,
0.9835876, -0.3605492, 1.63167, 0.9568627, 0, 1, 1,
0.9879927, -0.5428546, 1.825619, 0.9607843, 0, 1, 1,
0.9891477, 1.359697, 0.3016901, 0.9686275, 0, 1, 1,
0.9910838, 1.674341, 2.225972, 0.972549, 0, 1, 1,
0.99213, 0.1462228, -0.2719475, 0.9803922, 0, 1, 1,
0.9949387, 0.7103665, 0.9205439, 0.9843137, 0, 1, 1,
0.9958984, -1.540882, 2.929368, 0.9921569, 0, 1, 1,
0.9975864, -1.969377, 2.624801, 0.9960784, 0, 1, 1,
1.002199, 0.9448677, -0.06142117, 1, 0, 0.9960784, 1,
1.002291, 0.05010856, -0.3832316, 1, 0, 0.9882353, 1,
1.003107, 0.5239758, 2.207141, 1, 0, 0.9843137, 1,
1.004262, -0.8695278, 1.851326, 1, 0, 0.9764706, 1,
1.004644, 0.1884169, 1.112652, 1, 0, 0.972549, 1,
1.00986, -0.03702483, 2.703305, 1, 0, 0.9647059, 1,
1.019464, 1.300661, 0.2062552, 1, 0, 0.9607843, 1,
1.032891, 0.9423807, 0.4479777, 1, 0, 0.9529412, 1,
1.037001, -0.2247907, 1.99635, 1, 0, 0.9490196, 1,
1.037106, -0.01649164, 2.761141, 1, 0, 0.9411765, 1,
1.05889, 0.1813341, 1.589202, 1, 0, 0.9372549, 1,
1.061111, -0.783693, -0.2786447, 1, 0, 0.9294118, 1,
1.063805, -2.608288, 3.636521, 1, 0, 0.9254902, 1,
1.072883, 0.9753183, 1.221832, 1, 0, 0.9176471, 1,
1.079491, 1.608801, -0.8726256, 1, 0, 0.9137255, 1,
1.08695, -0.5362011, 0.5057326, 1, 0, 0.9058824, 1,
1.08809, 0.1311118, 0.9285304, 1, 0, 0.9019608, 1,
1.088784, -0.5011795, 1.679214, 1, 0, 0.8941177, 1,
1.095006, 0.2425373, 2.871129, 1, 0, 0.8862745, 1,
1.099389, 1.095804, 0.8028789, 1, 0, 0.8823529, 1,
1.100359, 1.4513, 0.1314268, 1, 0, 0.8745098, 1,
1.102207, -0.1029718, 1.87406, 1, 0, 0.8705882, 1,
1.13147, 0.2383439, 2.279646, 1, 0, 0.8627451, 1,
1.133841, -0.5430421, 1.61477, 1, 0, 0.8588235, 1,
1.133999, -1.251966, 0.3925333, 1, 0, 0.8509804, 1,
1.13407, 0.2436436, 1.982029, 1, 0, 0.8470588, 1,
1.146565, -0.3274118, 1.387786, 1, 0, 0.8392157, 1,
1.151829, -1.410318, 2.305536, 1, 0, 0.8352941, 1,
1.152068, 0.5558473, 3.062849, 1, 0, 0.827451, 1,
1.154041, 1.34011, 2.023715, 1, 0, 0.8235294, 1,
1.15802, -0.7581227, 2.97822, 1, 0, 0.8156863, 1,
1.162667, 0.4748211, -0.856492, 1, 0, 0.8117647, 1,
1.163084, 1.023119, 0.9297467, 1, 0, 0.8039216, 1,
1.165481, 1.80457, 0.2559304, 1, 0, 0.7960784, 1,
1.167387, -1.30004, 2.508712, 1, 0, 0.7921569, 1,
1.170394, 1.447886, 0.02163567, 1, 0, 0.7843137, 1,
1.178934, -0.5550478, 2.688955, 1, 0, 0.7803922, 1,
1.193647, 0.7772404, 1.670844, 1, 0, 0.772549, 1,
1.200149, 0.3936963, 2.464305, 1, 0, 0.7686275, 1,
1.200384, -1.232983, 2.343878, 1, 0, 0.7607843, 1,
1.200928, -0.1731256, 4.050503, 1, 0, 0.7568628, 1,
1.201964, -0.0235295, 1.100864, 1, 0, 0.7490196, 1,
1.204064, -1.971698, 0.3136522, 1, 0, 0.7450981, 1,
1.207843, -0.8983515, 2.782005, 1, 0, 0.7372549, 1,
1.208113, 1.369608, 1.88217, 1, 0, 0.7333333, 1,
1.212978, 0.7304228, 0.170371, 1, 0, 0.7254902, 1,
1.219821, -0.7009839, 1.325396, 1, 0, 0.7215686, 1,
1.225553, -1.084982, 2.670475, 1, 0, 0.7137255, 1,
1.23049, -1.19073, 2.627264, 1, 0, 0.7098039, 1,
1.237692, -1.249348, 2.84683, 1, 0, 0.7019608, 1,
1.24284, 0.06343501, 0.07170482, 1, 0, 0.6941177, 1,
1.253835, -0.03649685, 1.554551, 1, 0, 0.6901961, 1,
1.256628, -0.072763, 0.1995567, 1, 0, 0.682353, 1,
1.263565, -0.7473502, 1.537762, 1, 0, 0.6784314, 1,
1.271139, 0.3080185, 1.314036, 1, 0, 0.6705883, 1,
1.272027, -1.012446, 3.621238, 1, 0, 0.6666667, 1,
1.280918, 0.733112, 2.195935, 1, 0, 0.6588235, 1,
1.285131, -3.318278, 3.12542, 1, 0, 0.654902, 1,
1.290658, 0.1282408, -0.4479568, 1, 0, 0.6470588, 1,
1.297364, -1.137995, 1.340865, 1, 0, 0.6431373, 1,
1.300127, -0.7068607, 1.475321, 1, 0, 0.6352941, 1,
1.302827, 0.1349625, -0.6170335, 1, 0, 0.6313726, 1,
1.306716, 1.714095, 0.4001173, 1, 0, 0.6235294, 1,
1.310142, -0.3001275, 0.9897605, 1, 0, 0.6196079, 1,
1.31163, 1.884859, 0.1096111, 1, 0, 0.6117647, 1,
1.316319, 1.040784, 0.07125284, 1, 0, 0.6078432, 1,
1.328798, 0.1807556, 0.4069645, 1, 0, 0.6, 1,
1.339408, 1.252032, 0.1733988, 1, 0, 0.5921569, 1,
1.343912, 1.742746, 0.7805255, 1, 0, 0.5882353, 1,
1.347417, 0.982409, 0.7235581, 1, 0, 0.5803922, 1,
1.352588, 0.9943088, 1.500062, 1, 0, 0.5764706, 1,
1.353726, 0.07248462, 2.467445, 1, 0, 0.5686275, 1,
1.361734, 2.115506, -1.225723, 1, 0, 0.5647059, 1,
1.365997, -0.1433818, 1.621974, 1, 0, 0.5568628, 1,
1.369689, 0.4660083, 0.7707664, 1, 0, 0.5529412, 1,
1.376716, 1.022741, 2.137703, 1, 0, 0.5450981, 1,
1.379269, -0.3131149, 0.6075192, 1, 0, 0.5411765, 1,
1.385861, 0.07038052, 2.963396, 1, 0, 0.5333334, 1,
1.385868, -1.027894, 2.059051, 1, 0, 0.5294118, 1,
1.391332, -0.9856957, 1.702506, 1, 0, 0.5215687, 1,
1.398288, -0.07340965, 2.07896, 1, 0, 0.5176471, 1,
1.398658, -1.942361, 2.579359, 1, 0, 0.509804, 1,
1.405222, -0.9253688, 0.152246, 1, 0, 0.5058824, 1,
1.405943, -0.1059928, 1.262191, 1, 0, 0.4980392, 1,
1.439319, 1.37863, -0.9299443, 1, 0, 0.4901961, 1,
1.441757, -0.122198, 0.9262339, 1, 0, 0.4862745, 1,
1.443947, 0.5843773, 1.707257, 1, 0, 0.4784314, 1,
1.452646, 0.3554784, 0.1185561, 1, 0, 0.4745098, 1,
1.463811, 0.5873802, 0.5004303, 1, 0, 0.4666667, 1,
1.477279, -0.3303189, 1.114626, 1, 0, 0.4627451, 1,
1.487277, 2.043517, 0.05596801, 1, 0, 0.454902, 1,
1.504144, -1.251966, 2.945997, 1, 0, 0.4509804, 1,
1.507951, 0.5996388, -1.511696, 1, 0, 0.4431373, 1,
1.509006, 0.2511671, -0.2776486, 1, 0, 0.4392157, 1,
1.513678, 1.889711, -0.6923853, 1, 0, 0.4313726, 1,
1.513986, 0.07946803, -0.7061553, 1, 0, 0.427451, 1,
1.51845, -0.8446065, 2.018867, 1, 0, 0.4196078, 1,
1.523321, 0.5077419, 2.066994, 1, 0, 0.4156863, 1,
1.542652, 0.3753842, 2.602797, 1, 0, 0.4078431, 1,
1.571344, 0.09154689, 1.533037, 1, 0, 0.4039216, 1,
1.57431, 0.1273993, 2.448206, 1, 0, 0.3960784, 1,
1.583187, 0.6757584, 1.288933, 1, 0, 0.3882353, 1,
1.591749, 0.2208789, 0.4020265, 1, 0, 0.3843137, 1,
1.59181, -0.457587, 2.935218, 1, 0, 0.3764706, 1,
1.592241, 0.6052106, 1.036913, 1, 0, 0.372549, 1,
1.601302, -0.486153, 0.9298438, 1, 0, 0.3647059, 1,
1.601678, -1.686695, 3.364318, 1, 0, 0.3607843, 1,
1.602974, 0.3477783, 1.098321, 1, 0, 0.3529412, 1,
1.603456, 0.3127468, 0.9244576, 1, 0, 0.3490196, 1,
1.611851, 0.6604467, -0.1170472, 1, 0, 0.3411765, 1,
1.643782, -0.4123723, 1.718282, 1, 0, 0.3372549, 1,
1.644507, -1.611513, 1.682554, 1, 0, 0.3294118, 1,
1.646354, -0.5560572, 0.7563895, 1, 0, 0.3254902, 1,
1.647829, 0.4751455, 2.781889, 1, 0, 0.3176471, 1,
1.648714, -1.356508, 2.569392, 1, 0, 0.3137255, 1,
1.658784, -0.7732276, -0.06301938, 1, 0, 0.3058824, 1,
1.659219, -0.6314476, 2.729192, 1, 0, 0.2980392, 1,
1.662097, -0.8776963, 1.593726, 1, 0, 0.2941177, 1,
1.669642, 1.191251, 0.9494295, 1, 0, 0.2862745, 1,
1.688565, 0.2423391, 1.033102, 1, 0, 0.282353, 1,
1.688858, -1.901781, 3.315815, 1, 0, 0.2745098, 1,
1.692863, -1.097504, 0.8205577, 1, 0, 0.2705882, 1,
1.718518, -0.3444402, 2.241018, 1, 0, 0.2627451, 1,
1.718892, 0.4822246, 0.8360274, 1, 0, 0.2588235, 1,
1.724711, -0.2004301, 2.434732, 1, 0, 0.2509804, 1,
1.726258, 1.596896, 1.481568, 1, 0, 0.2470588, 1,
1.727879, 0.4649985, 0.913489, 1, 0, 0.2392157, 1,
1.729954, 0.1191555, 0.2643328, 1, 0, 0.2352941, 1,
1.737302, -0.1475807, 3.048882, 1, 0, 0.227451, 1,
1.754318, -0.0436207, 1.81327, 1, 0, 0.2235294, 1,
1.763467, -1.784912, 4.545677, 1, 0, 0.2156863, 1,
1.773234, 1.2658, 0.730197, 1, 0, 0.2117647, 1,
1.776155, -0.1942095, 0.020122, 1, 0, 0.2039216, 1,
1.786225, 1.423536, 0.1328896, 1, 0, 0.1960784, 1,
1.786746, 0.8362402, 0.2047328, 1, 0, 0.1921569, 1,
1.798734, 0.0927046, 1.939042, 1, 0, 0.1843137, 1,
1.801223, -0.4366438, 2.965039, 1, 0, 0.1803922, 1,
1.80183, 0.006781419, 1.557764, 1, 0, 0.172549, 1,
1.803337, -0.249363, 1.638364, 1, 0, 0.1686275, 1,
1.819383, -0.249065, 0.2874196, 1, 0, 0.1607843, 1,
1.819586, 1.347143, 0.8312575, 1, 0, 0.1568628, 1,
1.835804, -0.6430084, 2.187738, 1, 0, 0.1490196, 1,
1.836864, 0.7494986, -0.8300517, 1, 0, 0.145098, 1,
1.840159, 0.5582249, 1.166539, 1, 0, 0.1372549, 1,
1.845294, -1.419334, 3.267738, 1, 0, 0.1333333, 1,
1.851634, -0.2217622, 2.346145, 1, 0, 0.1254902, 1,
1.852715, 0.6393027, 1.734158, 1, 0, 0.1215686, 1,
1.860856, 0.0878162, 1.243603, 1, 0, 0.1137255, 1,
1.892126, 1.149703, 1.912048, 1, 0, 0.1098039, 1,
2.025128, 1.118054, 0.1848461, 1, 0, 0.1019608, 1,
2.063977, 0.5958871, 0.1546865, 1, 0, 0.09411765, 1,
2.11542, 0.7265779, 0.4002932, 1, 0, 0.09019608, 1,
2.136881, -0.394231, 0.9771277, 1, 0, 0.08235294, 1,
2.140526, -0.7058802, 1.651954, 1, 0, 0.07843138, 1,
2.140743, -1.849205, 4.647262, 1, 0, 0.07058824, 1,
2.142001, 0.3840795, 1.136325, 1, 0, 0.06666667, 1,
2.142065, 1.663733, -0.1521716, 1, 0, 0.05882353, 1,
2.143664, -1.285455, 2.301059, 1, 0, 0.05490196, 1,
2.185194, 0.4668221, 2.675416, 1, 0, 0.04705882, 1,
2.255536, 1.029636, 2.810015, 1, 0, 0.04313726, 1,
2.260209, 0.3191655, 2.410118, 1, 0, 0.03529412, 1,
2.309462, 0.9333797, 0.8749132, 1, 0, 0.03137255, 1,
2.338459, -0.3617359, 1.991634, 1, 0, 0.02352941, 1,
2.342922, 0.3996227, 1.406324, 1, 0, 0.01960784, 1,
2.553368, -2.218918, 3.502563, 1, 0, 0.01176471, 1,
3.351842, -0.5641642, 1.466305, 1, 0, 0.007843138, 1
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
0.1951507, -4.358689, -7.74237, 0, -0.5, 0.5, 0.5,
0.1951507, -4.358689, -7.74237, 1, -0.5, 0.5, 0.5,
0.1951507, -4.358689, -7.74237, 1, 1.5, 0.5, 0.5,
0.1951507, -4.358689, -7.74237, 0, 1.5, 0.5, 0.5
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
-4.031659, -0.2492189, -7.74237, 0, -0.5, 0.5, 0.5,
-4.031659, -0.2492189, -7.74237, 1, -0.5, 0.5, 0.5,
-4.031659, -0.2492189, -7.74237, 1, 1.5, 0.5, 0.5,
-4.031659, -0.2492189, -7.74237, 0, 1.5, 0.5, 0.5
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
-4.031659, -4.358689, -0.1740592, 0, -0.5, 0.5, 0.5,
-4.031659, -4.358689, -0.1740592, 1, -0.5, 0.5, 0.5,
-4.031659, -4.358689, -0.1740592, 1, 1.5, 0.5, 0.5,
-4.031659, -4.358689, -0.1740592, 0, 1.5, 0.5, 0.5
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
-2, -3.41035, -5.995837,
3, -3.41035, -5.995837,
-2, -3.41035, -5.995837,
-2, -3.568407, -6.286926,
-1, -3.41035, -5.995837,
-1, -3.568407, -6.286926,
0, -3.41035, -5.995837,
0, -3.568407, -6.286926,
1, -3.41035, -5.995837,
1, -3.568407, -6.286926,
2, -3.41035, -5.995837,
2, -3.568407, -6.286926,
3, -3.41035, -5.995837,
3, -3.568407, -6.286926
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
-2, -3.88452, -6.869103, 0, -0.5, 0.5, 0.5,
-2, -3.88452, -6.869103, 1, -0.5, 0.5, 0.5,
-2, -3.88452, -6.869103, 1, 1.5, 0.5, 0.5,
-2, -3.88452, -6.869103, 0, 1.5, 0.5, 0.5,
-1, -3.88452, -6.869103, 0, -0.5, 0.5, 0.5,
-1, -3.88452, -6.869103, 1, -0.5, 0.5, 0.5,
-1, -3.88452, -6.869103, 1, 1.5, 0.5, 0.5,
-1, -3.88452, -6.869103, 0, 1.5, 0.5, 0.5,
0, -3.88452, -6.869103, 0, -0.5, 0.5, 0.5,
0, -3.88452, -6.869103, 1, -0.5, 0.5, 0.5,
0, -3.88452, -6.869103, 1, 1.5, 0.5, 0.5,
0, -3.88452, -6.869103, 0, 1.5, 0.5, 0.5,
1, -3.88452, -6.869103, 0, -0.5, 0.5, 0.5,
1, -3.88452, -6.869103, 1, -0.5, 0.5, 0.5,
1, -3.88452, -6.869103, 1, 1.5, 0.5, 0.5,
1, -3.88452, -6.869103, 0, 1.5, 0.5, 0.5,
2, -3.88452, -6.869103, 0, -0.5, 0.5, 0.5,
2, -3.88452, -6.869103, 1, -0.5, 0.5, 0.5,
2, -3.88452, -6.869103, 1, 1.5, 0.5, 0.5,
2, -3.88452, -6.869103, 0, 1.5, 0.5, 0.5,
3, -3.88452, -6.869103, 0, -0.5, 0.5, 0.5,
3, -3.88452, -6.869103, 1, -0.5, 0.5, 0.5,
3, -3.88452, -6.869103, 1, 1.5, 0.5, 0.5,
3, -3.88452, -6.869103, 0, 1.5, 0.5, 0.5
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
-3.056241, -3, -5.995837,
-3.056241, 2, -5.995837,
-3.056241, -3, -5.995837,
-3.218811, -3, -6.286926,
-3.056241, -2, -5.995837,
-3.218811, -2, -6.286926,
-3.056241, -1, -5.995837,
-3.218811, -1, -6.286926,
-3.056241, 0, -5.995837,
-3.218811, 0, -6.286926,
-3.056241, 1, -5.995837,
-3.218811, 1, -6.286926,
-3.056241, 2, -5.995837,
-3.218811, 2, -6.286926
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
-3.54395, -3, -6.869103, 0, -0.5, 0.5, 0.5,
-3.54395, -3, -6.869103, 1, -0.5, 0.5, 0.5,
-3.54395, -3, -6.869103, 1, 1.5, 0.5, 0.5,
-3.54395, -3, -6.869103, 0, 1.5, 0.5, 0.5,
-3.54395, -2, -6.869103, 0, -0.5, 0.5, 0.5,
-3.54395, -2, -6.869103, 1, -0.5, 0.5, 0.5,
-3.54395, -2, -6.869103, 1, 1.5, 0.5, 0.5,
-3.54395, -2, -6.869103, 0, 1.5, 0.5, 0.5,
-3.54395, -1, -6.869103, 0, -0.5, 0.5, 0.5,
-3.54395, -1, -6.869103, 1, -0.5, 0.5, 0.5,
-3.54395, -1, -6.869103, 1, 1.5, 0.5, 0.5,
-3.54395, -1, -6.869103, 0, 1.5, 0.5, 0.5,
-3.54395, 0, -6.869103, 0, -0.5, 0.5, 0.5,
-3.54395, 0, -6.869103, 1, -0.5, 0.5, 0.5,
-3.54395, 0, -6.869103, 1, 1.5, 0.5, 0.5,
-3.54395, 0, -6.869103, 0, 1.5, 0.5, 0.5,
-3.54395, 1, -6.869103, 0, -0.5, 0.5, 0.5,
-3.54395, 1, -6.869103, 1, -0.5, 0.5, 0.5,
-3.54395, 1, -6.869103, 1, 1.5, 0.5, 0.5,
-3.54395, 1, -6.869103, 0, 1.5, 0.5, 0.5,
-3.54395, 2, -6.869103, 0, -0.5, 0.5, 0.5,
-3.54395, 2, -6.869103, 1, -0.5, 0.5, 0.5,
-3.54395, 2, -6.869103, 1, 1.5, 0.5, 0.5,
-3.54395, 2, -6.869103, 0, 1.5, 0.5, 0.5
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
-3.056241, -3.41035, -4,
-3.056241, -3.41035, 4,
-3.056241, -3.41035, -4,
-3.218811, -3.568407, -4,
-3.056241, -3.41035, -2,
-3.218811, -3.568407, -2,
-3.056241, -3.41035, 0,
-3.218811, -3.568407, 0,
-3.056241, -3.41035, 2,
-3.218811, -3.568407, 2,
-3.056241, -3.41035, 4,
-3.218811, -3.568407, 4
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
-3.54395, -3.88452, -4, 0, -0.5, 0.5, 0.5,
-3.54395, -3.88452, -4, 1, -0.5, 0.5, 0.5,
-3.54395, -3.88452, -4, 1, 1.5, 0.5, 0.5,
-3.54395, -3.88452, -4, 0, 1.5, 0.5, 0.5,
-3.54395, -3.88452, -2, 0, -0.5, 0.5, 0.5,
-3.54395, -3.88452, -2, 1, -0.5, 0.5, 0.5,
-3.54395, -3.88452, -2, 1, 1.5, 0.5, 0.5,
-3.54395, -3.88452, -2, 0, 1.5, 0.5, 0.5,
-3.54395, -3.88452, 0, 0, -0.5, 0.5, 0.5,
-3.54395, -3.88452, 0, 1, -0.5, 0.5, 0.5,
-3.54395, -3.88452, 0, 1, 1.5, 0.5, 0.5,
-3.54395, -3.88452, 0, 0, 1.5, 0.5, 0.5,
-3.54395, -3.88452, 2, 0, -0.5, 0.5, 0.5,
-3.54395, -3.88452, 2, 1, -0.5, 0.5, 0.5,
-3.54395, -3.88452, 2, 1, 1.5, 0.5, 0.5,
-3.54395, -3.88452, 2, 0, 1.5, 0.5, 0.5,
-3.54395, -3.88452, 4, 0, -0.5, 0.5, 0.5,
-3.54395, -3.88452, 4, 1, -0.5, 0.5, 0.5,
-3.54395, -3.88452, 4, 1, 1.5, 0.5, 0.5,
-3.54395, -3.88452, 4, 0, 1.5, 0.5, 0.5
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
-3.056241, -3.41035, -5.995837,
-3.056241, 2.911912, -5.995837,
-3.056241, -3.41035, 5.647718,
-3.056241, 2.911912, 5.647718,
-3.056241, -3.41035, -5.995837,
-3.056241, -3.41035, 5.647718,
-3.056241, 2.911912, -5.995837,
-3.056241, 2.911912, 5.647718,
-3.056241, -3.41035, -5.995837,
3.446543, -3.41035, -5.995837,
-3.056241, -3.41035, 5.647718,
3.446543, -3.41035, 5.647718,
-3.056241, 2.911912, -5.995837,
3.446543, 2.911912, -5.995837,
-3.056241, 2.911912, 5.647718,
3.446543, 2.911912, 5.647718,
3.446543, -3.41035, -5.995837,
3.446543, 2.911912, -5.995837,
3.446543, -3.41035, 5.647718,
3.446543, 2.911912, 5.647718,
3.446543, -3.41035, -5.995837,
3.446543, -3.41035, 5.647718,
3.446543, 2.911912, -5.995837,
3.446543, 2.911912, 5.647718
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
var radius = 7.881047;
var distance = 35.06367;
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
mvMatrix.translate( -0.1951507, 0.2492189, 0.1740592 );
mvMatrix.scale( 1.310384, 1.3478, 0.7318333 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.06367);
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
Difethialone<-read.table("Difethialone.xyz")
```

```
## Error in read.table("Difethialone.xyz"): no lines available in input
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
-2.96154, -0.4940911, -1.05458, 0, 0, 1, 1, 1,
-2.839101, -0.0475792, -0.4802439, 1, 0, 0, 1, 1,
-2.754822, -0.6555324, -1.711444, 1, 0, 0, 1, 1,
-2.564961, 0.4840183, -1.219402, 1, 0, 0, 1, 1,
-2.553866, -1.184681, -2.296293, 1, 0, 0, 1, 1,
-2.514366, -0.2320243, -1.224508, 1, 0, 0, 1, 1,
-2.424615, 2.097528, -0.5707287, 0, 0, 0, 1, 1,
-2.392032, -2.185493, -1.781499, 0, 0, 0, 1, 1,
-2.375842, -1.07444, -2.045899, 0, 0, 0, 1, 1,
-2.356285, 0.2313715, -2.84406, 0, 0, 0, 1, 1,
-2.263476, 1.543799, -1.835563, 0, 0, 0, 1, 1,
-2.188326, -0.569239, -2.29935, 0, 0, 0, 1, 1,
-2.185321, 1.320052, -0.9626902, 0, 0, 0, 1, 1,
-2.159185, -0.6808719, -3.092079, 1, 1, 1, 1, 1,
-2.15513, 0.02395222, -2.288834, 1, 1, 1, 1, 1,
-2.120727, -1.088032, -2.501283, 1, 1, 1, 1, 1,
-2.114482, 1.555017, -1.348825, 1, 1, 1, 1, 1,
-2.093275, 1.144403, -0.7314622, 1, 1, 1, 1, 1,
-2.05868, 0.2217716, -3.536242, 1, 1, 1, 1, 1,
-1.996165, 1.705666, -1.169374, 1, 1, 1, 1, 1,
-1.991318, 0.8231416, -1.592039, 1, 1, 1, 1, 1,
-1.988449, 0.6478452, -1.760807, 1, 1, 1, 1, 1,
-1.978293, 0.4489749, -0.5920683, 1, 1, 1, 1, 1,
-1.95059, 0.7753371, -0.2662241, 1, 1, 1, 1, 1,
-1.93607, -0.1390183, -0.1390293, 1, 1, 1, 1, 1,
-1.932697, -0.2177823, 0.6078295, 1, 1, 1, 1, 1,
-1.918194, -1.353307, -0.8164054, 1, 1, 1, 1, 1,
-1.909613, 0.6575011, 1.381123, 1, 1, 1, 1, 1,
-1.89918, -0.3986202, -0.508522, 0, 0, 1, 1, 1,
-1.890408, 0.1534947, -2.058238, 1, 0, 0, 1, 1,
-1.888971, 0.9040454, -2.202753, 1, 0, 0, 1, 1,
-1.88873, 1.123391, -0.7268408, 1, 0, 0, 1, 1,
-1.879161, -0.5790759, -0.938081, 1, 0, 0, 1, 1,
-1.872632, 1.248102, -1.075038, 1, 0, 0, 1, 1,
-1.854199, 0.3106842, 0.4426064, 0, 0, 0, 1, 1,
-1.843917, -1.406938, -3.228045, 0, 0, 0, 1, 1,
-1.842878, 0.6220946, 0.3297983, 0, 0, 0, 1, 1,
-1.835841, -0.791698, -3.738836, 0, 0, 0, 1, 1,
-1.825241, -0.6476856, -1.670691, 0, 0, 0, 1, 1,
-1.823892, 0.0104616, -2.072727, 0, 0, 0, 1, 1,
-1.821891, 0.790902, -0.0569744, 0, 0, 0, 1, 1,
-1.81122, -0.08305819, -0.6839728, 1, 1, 1, 1, 1,
-1.805337, 1.350687, -4.109945, 1, 1, 1, 1, 1,
-1.793692, -0.7311972, -0.9292287, 1, 1, 1, 1, 1,
-1.787015, 0.5459787, -1.325856, 1, 1, 1, 1, 1,
-1.780634, -0.06861643, -3.166314, 1, 1, 1, 1, 1,
-1.772698, -0.7021506, -1.205408, 1, 1, 1, 1, 1,
-1.743104, 0.758252, -1.704554, 1, 1, 1, 1, 1,
-1.740455, -0.1799764, -1.257026, 1, 1, 1, 1, 1,
-1.73633, 0.4709759, -0.6678866, 1, 1, 1, 1, 1,
-1.735105, 0.2047096, -1.459503, 1, 1, 1, 1, 1,
-1.733931, 0.05955283, -2.862573, 1, 1, 1, 1, 1,
-1.720426, 1.95853, -0.5779384, 1, 1, 1, 1, 1,
-1.676991, 1.768963, 0.6827075, 1, 1, 1, 1, 1,
-1.662573, -0.5068703, -3.038737, 1, 1, 1, 1, 1,
-1.661666, 0.2588165, -2.232395, 1, 1, 1, 1, 1,
-1.614009, -0.1816108, -0.4111988, 0, 0, 1, 1, 1,
-1.594958, -0.6199687, -0.22755, 1, 0, 0, 1, 1,
-1.580541, -2.039562, -3.344631, 1, 0, 0, 1, 1,
-1.578811, 1.41591, -0.99075, 1, 0, 0, 1, 1,
-1.577992, 0.3150363, -3.295493, 1, 0, 0, 1, 1,
-1.577732, 1.01799, -0.8984681, 1, 0, 0, 1, 1,
-1.574782, -0.4231457, -3.177776, 0, 0, 0, 1, 1,
-1.566147, -1.452254, -2.758105, 0, 0, 0, 1, 1,
-1.565816, 0.2383743, 0.1653323, 0, 0, 0, 1, 1,
-1.557175, -0.646772, -2.054269, 0, 0, 0, 1, 1,
-1.540182, 0.06446754, -0.4478185, 0, 0, 0, 1, 1,
-1.529959, 0.08331235, -3.495714, 0, 0, 0, 1, 1,
-1.525044, -0.1970773, -0.6454239, 0, 0, 0, 1, 1,
-1.51923, -1.661935, -1.620103, 1, 1, 1, 1, 1,
-1.513026, 1.521802, -0.506094, 1, 1, 1, 1, 1,
-1.503629, -0.4554666, -2.097027, 1, 1, 1, 1, 1,
-1.500736, 0.548614, 0.1676059, 1, 1, 1, 1, 1,
-1.493699, 0.851828, -0.6529091, 1, 1, 1, 1, 1,
-1.480784, 1.41531, -0.3681684, 1, 1, 1, 1, 1,
-1.47084, -1.071213, -2.149285, 1, 1, 1, 1, 1,
-1.469632, 0.1793056, -1.540289, 1, 1, 1, 1, 1,
-1.467639, -1.905207, -3.655885, 1, 1, 1, 1, 1,
-1.459172, 0.438035, 0.5442638, 1, 1, 1, 1, 1,
-1.433216, 0.1017302, -1.519291, 1, 1, 1, 1, 1,
-1.41855, -0.2356768, -1.893362, 1, 1, 1, 1, 1,
-1.41666, -1.247106, -2.16152, 1, 1, 1, 1, 1,
-1.403774, 1.544249, -3.03098, 1, 1, 1, 1, 1,
-1.402622, -0.9418631, -0.9039545, 1, 1, 1, 1, 1,
-1.400508, -0.8969382, -1.495946, 0, 0, 1, 1, 1,
-1.381745, 0.1200181, -1.365548, 1, 0, 0, 1, 1,
-1.34393, -0.09879293, -0.9669144, 1, 0, 0, 1, 1,
-1.32914, -0.7191079, -2.014342, 1, 0, 0, 1, 1,
-1.327348, -0.8263892, -2.297013, 1, 0, 0, 1, 1,
-1.315423, 0.1583677, 0.7738096, 1, 0, 0, 1, 1,
-1.313574, -0.880931, -1.313763, 0, 0, 0, 1, 1,
-1.303672, -2.498248, -0.7103817, 0, 0, 0, 1, 1,
-1.295507, 0.1842785, -0.7682471, 0, 0, 0, 1, 1,
-1.292575, 0.2972631, -1.663205, 0, 0, 0, 1, 1,
-1.288967, 2.443656, 0.2404363, 0, 0, 0, 1, 1,
-1.279524, -1.405576, -4.223125, 0, 0, 0, 1, 1,
-1.279362, -0.6397145, -1.840297, 0, 0, 0, 1, 1,
-1.272367, -0.135508, -1.841718, 1, 1, 1, 1, 1,
-1.26798, 0.8328197, -2.355928, 1, 1, 1, 1, 1,
-1.267363, -1.396882, -1.913391, 1, 1, 1, 1, 1,
-1.247485, -0.4716497, -1.189526, 1, 1, 1, 1, 1,
-1.247361, -0.7694254, -3.183453, 1, 1, 1, 1, 1,
-1.246792, 1.30289, -0.144661, 1, 1, 1, 1, 1,
-1.234648, 0.7325681, -0.6518981, 1, 1, 1, 1, 1,
-1.232299, -0.8229389, -1.91019, 1, 1, 1, 1, 1,
-1.221668, 0.2912732, -1.211475, 1, 1, 1, 1, 1,
-1.220242, -0.5821559, -2.751724, 1, 1, 1, 1, 1,
-1.219331, -0.7150356, -1.599364, 1, 1, 1, 1, 1,
-1.219156, -0.2338165, -0.008178923, 1, 1, 1, 1, 1,
-1.214652, -0.710067, -3.572467, 1, 1, 1, 1, 1,
-1.204043, 0.9036195, -0.3225127, 1, 1, 1, 1, 1,
-1.19822, -1.698438, -2.211063, 1, 1, 1, 1, 1,
-1.194929, -1.881562, -4.780117, 0, 0, 1, 1, 1,
-1.188938, -0.006744386, -1.238584, 1, 0, 0, 1, 1,
-1.188585, -1.10644, -2.549209, 1, 0, 0, 1, 1,
-1.1883, -1.613559, -2.39675, 1, 0, 0, 1, 1,
-1.179329, -0.1358423, -2.067068, 1, 0, 0, 1, 1,
-1.174824, -0.05007102, -1.270605, 1, 0, 0, 1, 1,
-1.169471, 0.4874744, -1.536347, 0, 0, 0, 1, 1,
-1.168743, 0.02406212, -2.085776, 0, 0, 0, 1, 1,
-1.156367, -0.4378598, -3.047799, 0, 0, 0, 1, 1,
-1.132404, 0.8057335, 0.004991735, 0, 0, 0, 1, 1,
-1.131972, -0.06090922, -2.196277, 0, 0, 0, 1, 1,
-1.127706, 0.6319001, -1.274426, 0, 0, 0, 1, 1,
-1.122669, 0.7698215, -0.3961559, 0, 0, 0, 1, 1,
-1.118704, 0.4591376, -2.728995, 1, 1, 1, 1, 1,
-1.108591, 1.924753, -1.529485, 1, 1, 1, 1, 1,
-1.107747, -1.543502, -2.166532, 1, 1, 1, 1, 1,
-1.106225, 0.1856763, -1.488025, 1, 1, 1, 1, 1,
-1.097324, 0.5689424, 0.4352662, 1, 1, 1, 1, 1,
-1.093434, 2.191072, 0.3695707, 1, 1, 1, 1, 1,
-1.092148, 0.9823202, -0.9210613, 1, 1, 1, 1, 1,
-1.079885, -0.1574345, -2.296453, 1, 1, 1, 1, 1,
-1.075451, -0.2881942, -2.46442, 1, 1, 1, 1, 1,
-1.075141, -0.1374285, -2.019252, 1, 1, 1, 1, 1,
-1.072659, 1.468079, -2.743328, 1, 1, 1, 1, 1,
-1.071867, -1.357817, -2.007366, 1, 1, 1, 1, 1,
-1.068192, -1.287713, -2.321053, 1, 1, 1, 1, 1,
-1.0678, -1.407433, -2.759596, 1, 1, 1, 1, 1,
-1.067726, -2.812447, -3.766708, 1, 1, 1, 1, 1,
-1.067106, -1.107448, -2.078011, 0, 0, 1, 1, 1,
-1.061466, 0.3280314, -1.852261, 1, 0, 0, 1, 1,
-1.05803, 0.1168201, -0.7238743, 1, 0, 0, 1, 1,
-1.054586, 0.3953634, -3.716312, 1, 0, 0, 1, 1,
-1.052503, -0.2559046, -2.63357, 1, 0, 0, 1, 1,
-1.052163, 0.9640097, 0.6718789, 1, 0, 0, 1, 1,
-1.048964, 0.8527074, -1.165917, 0, 0, 0, 1, 1,
-1.035473, 0.01368304, -3.025843, 0, 0, 0, 1, 1,
-1.032944, 0.8984094, -1.195817, 0, 0, 0, 1, 1,
-1.029377, -0.1670567, -0.3094828, 0, 0, 0, 1, 1,
-1.029159, 1.520702, -0.02495731, 0, 0, 0, 1, 1,
-1.012929, 0.1087462, -0.9342942, 0, 0, 0, 1, 1,
-1.012843, 0.1600062, -1.978051, 0, 0, 0, 1, 1,
-1.011489, -1.199754, -1.747762, 1, 1, 1, 1, 1,
-1.010865, -1.072908, -3.008193, 1, 1, 1, 1, 1,
-1.004631, 0.2269765, -0.1718344, 1, 1, 1, 1, 1,
-1.004415, -1.714212, -1.556293, 1, 1, 1, 1, 1,
-1.003902, 0.8452916, -0.2393571, 1, 1, 1, 1, 1,
-1.002912, -1.068251, -2.223323, 1, 1, 1, 1, 1,
-0.9953452, -0.4337945, -3.06502, 1, 1, 1, 1, 1,
-0.9951041, -0.3628098, -0.1599127, 1, 1, 1, 1, 1,
-0.9938867, 1.559159, 0.4004593, 1, 1, 1, 1, 1,
-0.9914822, 2.257163, -2.182585, 1, 1, 1, 1, 1,
-0.9900367, -0.5272064, -1.67129, 1, 1, 1, 1, 1,
-0.9892147, 0.4199075, -3.155231, 1, 1, 1, 1, 1,
-0.9792025, -0.9467434, -2.808135, 1, 1, 1, 1, 1,
-0.9737728, -1.223105, -2.392802, 1, 1, 1, 1, 1,
-0.9696085, -0.04057281, -2.011162, 1, 1, 1, 1, 1,
-0.9681276, -0.7712561, -2.138014, 0, 0, 1, 1, 1,
-0.9679227, 0.6424934, 0.2951009, 1, 0, 0, 1, 1,
-0.963346, -0.3254134, -3.147248, 1, 0, 0, 1, 1,
-0.9617735, 1.018669, -0.7915723, 1, 0, 0, 1, 1,
-0.958828, -0.617297, -4.029568, 1, 0, 0, 1, 1,
-0.958697, -1.292478, -2.743012, 1, 0, 0, 1, 1,
-0.9541023, 0.4711696, -0.3987165, 0, 0, 0, 1, 1,
-0.9526888, 0.3874262, 0.7224393, 0, 0, 0, 1, 1,
-0.9523703, -1.05867, -4.361254, 0, 0, 0, 1, 1,
-0.9485106, 1.004635, 1.159136, 0, 0, 0, 1, 1,
-0.9463233, -0.6474298, -3.969397, 0, 0, 0, 1, 1,
-0.9445251, -0.7806349, -0.5473298, 0, 0, 0, 1, 1,
-0.9412643, 0.1406805, -1.518579, 0, 0, 0, 1, 1,
-0.9389107, 0.881678, -1.389259, 1, 1, 1, 1, 1,
-0.9255376, -1.060227, -2.783194, 1, 1, 1, 1, 1,
-0.9251427, 0.3543455, -0.1377709, 1, 1, 1, 1, 1,
-0.9166222, 0.6274617, 2.388682, 1, 1, 1, 1, 1,
-0.9129525, -0.7464754, -2.580244, 1, 1, 1, 1, 1,
-0.9124507, 0.1552864, -0.7813281, 1, 1, 1, 1, 1,
-0.9122046, 0.370859, -1.69532, 1, 1, 1, 1, 1,
-0.9079132, -1.828725, -1.620983, 1, 1, 1, 1, 1,
-0.9070594, 0.6767175, -0.8829545, 1, 1, 1, 1, 1,
-0.9043423, 0.9616948, 0.1871198, 1, 1, 1, 1, 1,
-0.9038065, 0.03110627, -1.223002, 1, 1, 1, 1, 1,
-0.9010695, -1.566682, -2.825361, 1, 1, 1, 1, 1,
-0.9002599, 0.1518393, -2.343605, 1, 1, 1, 1, 1,
-0.9000955, 0.7438197, 0.6511133, 1, 1, 1, 1, 1,
-0.8979585, -0.419576, -3.206138, 1, 1, 1, 1, 1,
-0.8975101, -2.359456, -3.121374, 0, 0, 1, 1, 1,
-0.8938096, 0.1451115, -1.367808, 1, 0, 0, 1, 1,
-0.892161, 1.191345, -0.1289021, 1, 0, 0, 1, 1,
-0.8770958, -1.170512, -2.687787, 1, 0, 0, 1, 1,
-0.8768871, -0.7176707, -2.600982, 1, 0, 0, 1, 1,
-0.8723946, 1.230274, 0.4276296, 1, 0, 0, 1, 1,
-0.86279, 1.77523, -0.59179, 0, 0, 0, 1, 1,
-0.8622679, 1.387101, 0.2081891, 0, 0, 0, 1, 1,
-0.8599397, -0.3915132, -2.352084, 0, 0, 0, 1, 1,
-0.8560207, -0.6543331, -1.653419, 0, 0, 0, 1, 1,
-0.847141, -1.036084, -2.659763, 0, 0, 0, 1, 1,
-0.8442776, -0.2877069, -1.577587, 0, 0, 0, 1, 1,
-0.8415513, -3.081172, -1.897748, 0, 0, 0, 1, 1,
-0.8413696, 0.3559256, -1.793865, 1, 1, 1, 1, 1,
-0.836153, -1.724742, -3.304177, 1, 1, 1, 1, 1,
-0.8322148, -1.21458, -2.324134, 1, 1, 1, 1, 1,
-0.8279122, 1.978216, -0.1764139, 1, 1, 1, 1, 1,
-0.8244814, -0.01081547, -1.735657, 1, 1, 1, 1, 1,
-0.8165931, -1.264292, -3.065243, 1, 1, 1, 1, 1,
-0.8050235, 1.061227, -1.862893, 1, 1, 1, 1, 1,
-0.8041549, 1.068738, -0.06226581, 1, 1, 1, 1, 1,
-0.7978324, -0.6540658, -1.762055, 1, 1, 1, 1, 1,
-0.7942472, -0.2401735, -3.035586, 1, 1, 1, 1, 1,
-0.7937291, 0.1890344, -1.319306, 1, 1, 1, 1, 1,
-0.7904996, -0.9265296, -3.371486, 1, 1, 1, 1, 1,
-0.7873878, -0.4621702, -1.710703, 1, 1, 1, 1, 1,
-0.7745937, -0.0273626, -2.13413, 1, 1, 1, 1, 1,
-0.773095, -1.084556, -4.019591, 1, 1, 1, 1, 1,
-0.7711004, -0.06727938, -3.42695, 0, 0, 1, 1, 1,
-0.7656093, -1.920824, -1.286996, 1, 0, 0, 1, 1,
-0.7650968, -0.1283474, -0.07149552, 1, 0, 0, 1, 1,
-0.7566288, 0.07728004, -1.248069, 1, 0, 0, 1, 1,
-0.7539601, 0.5250347, -1.25221, 1, 0, 0, 1, 1,
-0.7501399, 1.204144, 0.00545454, 1, 0, 0, 1, 1,
-0.735017, -0.4526679, -2.22396, 0, 0, 0, 1, 1,
-0.7325899, 0.5929657, 0.1493821, 0, 0, 0, 1, 1,
-0.7316592, 0.9529679, 0.1815734, 0, 0, 0, 1, 1,
-0.7311211, -0.40648, -2.654941, 0, 0, 0, 1, 1,
-0.7286728, -1.269578, -2.289089, 0, 0, 0, 1, 1,
-0.7281865, 0.7071041, -0.7971184, 0, 0, 0, 1, 1,
-0.7245097, -1.252899, -2.596206, 0, 0, 0, 1, 1,
-0.7215089, 1.12971, -0.07970998, 1, 1, 1, 1, 1,
-0.7209532, 0.7722371, -0.5624306, 1, 1, 1, 1, 1,
-0.7201097, -0.08489543, -0.8354102, 1, 1, 1, 1, 1,
-0.7195088, -1.174983, -1.640514, 1, 1, 1, 1, 1,
-0.7048993, -1.340799, -3.031487, 1, 1, 1, 1, 1,
-0.695442, -0.4811039, -1.306396, 1, 1, 1, 1, 1,
-0.6923435, -0.9371817, -2.765704, 1, 1, 1, 1, 1,
-0.6790717, -1.230745, -1.728076, 1, 1, 1, 1, 1,
-0.6790212, 1.829843, 0.06172503, 1, 1, 1, 1, 1,
-0.6734593, 0.6073453, -0.4279407, 1, 1, 1, 1, 1,
-0.6709914, -1.264415, -2.520928, 1, 1, 1, 1, 1,
-0.6706483, 0.746069, -1.963901, 1, 1, 1, 1, 1,
-0.6693692, -1.963493, -2.807141, 1, 1, 1, 1, 1,
-0.6523713, -1.102528, -3.021335, 1, 1, 1, 1, 1,
-0.6518863, 0.4304659, -0.796937, 1, 1, 1, 1, 1,
-0.6493421, -0.4311379, -3.275742, 0, 0, 1, 1, 1,
-0.6464404, -0.9367404, -3.626642, 1, 0, 0, 1, 1,
-0.6427867, 0.4753595, 0.2494424, 1, 0, 0, 1, 1,
-0.6406959, -1.936823, -2.965785, 1, 0, 0, 1, 1,
-0.6394865, -0.3299982, -2.347585, 1, 0, 0, 1, 1,
-0.6370087, -1.127817, -2.561368, 1, 0, 0, 1, 1,
-0.631516, -1.579693, -2.504663, 0, 0, 0, 1, 1,
-0.6305863, -0.597901, -3.097645, 0, 0, 0, 1, 1,
-0.6286651, 0.8626754, -0.238116, 0, 0, 0, 1, 1,
-0.6281477, 0.4062444, -0.02898659, 0, 0, 0, 1, 1,
-0.6245788, -0.8471324, -2.103327, 0, 0, 0, 1, 1,
-0.6232762, -0.03371786, -1.464402, 0, 0, 0, 1, 1,
-0.6213853, -0.1461647, -1.405922, 0, 0, 0, 1, 1,
-0.6172963, 0.2458684, -1.842417, 1, 1, 1, 1, 1,
-0.6127545, -0.8563823, -2.352993, 1, 1, 1, 1, 1,
-0.610354, 0.9444118, 0.1590427, 1, 1, 1, 1, 1,
-0.6096725, -0.8264756, -1.083161, 1, 1, 1, 1, 1,
-0.602507, -1.049419, -4.801478, 1, 1, 1, 1, 1,
-0.6013933, 0.09206247, -2.2541, 1, 1, 1, 1, 1,
-0.5982794, -0.05512901, -2.82375, 1, 1, 1, 1, 1,
-0.5962986, 0.5207288, -1.117154, 1, 1, 1, 1, 1,
-0.5945327, 0.35208, 1.032035, 1, 1, 1, 1, 1,
-0.5880167, -0.9116085, -3.23371, 1, 1, 1, 1, 1,
-0.5845771, -0.4202536, -2.976216, 1, 1, 1, 1, 1,
-0.5828668, 0.5155281, 0.8728058, 1, 1, 1, 1, 1,
-0.5820716, -0.2697231, -1.627437, 1, 1, 1, 1, 1,
-0.5819353, -0.6770792, -3.012363, 1, 1, 1, 1, 1,
-0.5818096, 0.05421085, -1.705544, 1, 1, 1, 1, 1,
-0.5772278, 0.7477081, -1.608751, 0, 0, 1, 1, 1,
-0.5752825, -0.6964832, -1.7251, 1, 0, 0, 1, 1,
-0.5711237, -1.45031, -3.512315, 1, 0, 0, 1, 1,
-0.5708733, 0.0866447, -1.802375, 1, 0, 0, 1, 1,
-0.5698804, 0.8906963, 1.40892, 1, 0, 0, 1, 1,
-0.5694686, -0.5747477, -3.252849, 1, 0, 0, 1, 1,
-0.5664585, 0.5129313, -1.795399, 0, 0, 0, 1, 1,
-0.564715, 0.9714156, -1.937063, 0, 0, 0, 1, 1,
-0.56101, -0.1876958, -1.725274, 0, 0, 0, 1, 1,
-0.5609534, 1.060591, -0.8199066, 0, 0, 0, 1, 1,
-0.5555295, -0.3815889, -1.795949, 0, 0, 0, 1, 1,
-0.5535845, 0.425952, -1.543419, 0, 0, 0, 1, 1,
-0.548129, 1.119281, -0.4271194, 0, 0, 0, 1, 1,
-0.5360045, -2.241325, -2.442635, 1, 1, 1, 1, 1,
-0.5250669, 1.791471, -1.034962, 1, 1, 1, 1, 1,
-0.5228952, 1.97043, 2.0456, 1, 1, 1, 1, 1,
-0.5206053, -0.1807071, -1.635429, 1, 1, 1, 1, 1,
-0.5182342, -0.4383422, -1.824168, 1, 1, 1, 1, 1,
-0.5153941, 1.725675, -0.2570751, 1, 1, 1, 1, 1,
-0.5141711, -0.3116174, -2.367102, 1, 1, 1, 1, 1,
-0.5101011, 0.5280508, -0.4642411, 1, 1, 1, 1, 1,
-0.50947, 0.6025747, -1.616621, 1, 1, 1, 1, 1,
-0.50657, 1.304596, -0.6564607, 1, 1, 1, 1, 1,
-0.506514, 0.2705132, -0.05331573, 1, 1, 1, 1, 1,
-0.5036236, 0.8825324, -1.086345, 1, 1, 1, 1, 1,
-0.5014982, 0.5631944, 0.7722632, 1, 1, 1, 1, 1,
-0.4995413, 0.5723627, -0.7647609, 1, 1, 1, 1, 1,
-0.4913818, 0.8938789, 0.0885703, 1, 1, 1, 1, 1,
-0.4877929, 1.159495, 0.949575, 0, 0, 1, 1, 1,
-0.485231, -0.07715527, -2.31924, 1, 0, 0, 1, 1,
-0.4798073, 0.5920694, -0.2674835, 1, 0, 0, 1, 1,
-0.4792668, 0.1579491, -0.9064844, 1, 0, 0, 1, 1,
-0.4783174, 1.118917, -0.1613259, 1, 0, 0, 1, 1,
-0.4755032, -0.4406024, -2.63168, 1, 0, 0, 1, 1,
-0.4752688, 1.975234, -1.039368, 0, 0, 0, 1, 1,
-0.4725031, -1.050836, -3.746655, 0, 0, 0, 1, 1,
-0.4702434, -1.544391, -2.205546, 0, 0, 0, 1, 1,
-0.4679433, 0.7500314, -1.207119, 0, 0, 0, 1, 1,
-0.4659879, -0.369025, -3.554049, 0, 0, 0, 1, 1,
-0.463733, 0.6047113, 0.2726859, 0, 0, 0, 1, 1,
-0.4617447, -0.7718505, -3.358466, 0, 0, 0, 1, 1,
-0.4609246, -0.9047761, -3.550432, 1, 1, 1, 1, 1,
-0.4588412, -1.001454, -3.263583, 1, 1, 1, 1, 1,
-0.4575863, -1.409779, -2.765431, 1, 1, 1, 1, 1,
-0.4496075, -0.2775221, -3.246394, 1, 1, 1, 1, 1,
-0.4494271, 2.81984, 0.2803604, 1, 1, 1, 1, 1,
-0.4488375, -1.263906, -2.624272, 1, 1, 1, 1, 1,
-0.4466554, 1.691403, 1.524624, 1, 1, 1, 1, 1,
-0.4442807, 1.811075, -0.418598, 1, 1, 1, 1, 1,
-0.4415958, -2.480322, -4.570284, 1, 1, 1, 1, 1,
-0.4360661, -1.286873, -3.096733, 1, 1, 1, 1, 1,
-0.428666, 0.5836517, 0.1742046, 1, 1, 1, 1, 1,
-0.4254387, -1.472052, -2.88799, 1, 1, 1, 1, 1,
-0.4247409, 0.2461589, 0.1750847, 1, 1, 1, 1, 1,
-0.4166015, 0.60451, -1.188805, 1, 1, 1, 1, 1,
-0.4156777, 0.8995462, -0.6523702, 1, 1, 1, 1, 1,
-0.412288, -0.1546826, -0.02760649, 0, 0, 1, 1, 1,
-0.4097264, -1.470331, -3.037315, 1, 0, 0, 1, 1,
-0.4042716, 0.4835793, -0.9872815, 1, 0, 0, 1, 1,
-0.4037805, -0.244157, -1.524561, 1, 0, 0, 1, 1,
-0.4027629, -0.1301947, -1.876284, 1, 0, 0, 1, 1,
-0.3902402, -1.777401, -5.464564, 1, 0, 0, 1, 1,
-0.3877142, 0.1021157, -0.7946749, 0, 0, 0, 1, 1,
-0.387625, -0.8078108, -2.295976, 0, 0, 0, 1, 1,
-0.3874935, 0.2094375, -2.221489, 0, 0, 0, 1, 1,
-0.3865314, 0.5018166, -2.570668, 0, 0, 0, 1, 1,
-0.3847525, 2.286333, -1.439096, 0, 0, 0, 1, 1,
-0.3826162, -0.3708797, -1.893011, 0, 0, 0, 1, 1,
-0.3815685, -1.267957, -2.901028, 0, 0, 0, 1, 1,
-0.3757331, 0.1558862, -1.068297, 1, 1, 1, 1, 1,
-0.3739197, 0.8929259, 0.2751547, 1, 1, 1, 1, 1,
-0.3621323, -0.494158, -2.91225, 1, 1, 1, 1, 1,
-0.3610301, -0.1033437, -0.974824, 1, 1, 1, 1, 1,
-0.3610049, -1.428927, -4.550959, 1, 1, 1, 1, 1,
-0.3580949, 0.5834074, -1.075432, 1, 1, 1, 1, 1,
-0.3554424, 1.136192, -1.032294, 1, 1, 1, 1, 1,
-0.3528318, -0.7974126, -3.930699, 1, 1, 1, 1, 1,
-0.352548, -1.156823, -3.198662, 1, 1, 1, 1, 1,
-0.3513581, -1.446711, -2.956077, 1, 1, 1, 1, 1,
-0.3481623, 1.387037, 0.8876272, 1, 1, 1, 1, 1,
-0.3437572, -0.5522497, -1.349833, 1, 1, 1, 1, 1,
-0.3367011, 1.151171, 0.1914695, 1, 1, 1, 1, 1,
-0.336454, 0.03834981, -0.6554103, 1, 1, 1, 1, 1,
-0.3332203, -0.5834552, -2.291456, 1, 1, 1, 1, 1,
-0.3279956, 0.6950701, -1.195315, 0, 0, 1, 1, 1,
-0.3267371, 1.278251, -0.3114608, 1, 0, 0, 1, 1,
-0.3255009, 0.7141232, -0.6425129, 1, 0, 0, 1, 1,
-0.3178982, -0.527122, -2.055365, 1, 0, 0, 1, 1,
-0.3177151, -0.9537002, -1.516026, 1, 0, 0, 1, 1,
-0.3124695, -0.08003262, -2.942474, 1, 0, 0, 1, 1,
-0.3103656, 0.05378408, -0.399568, 0, 0, 0, 1, 1,
-0.3096588, -0.9489605, -2.101753, 0, 0, 0, 1, 1,
-0.3092971, 0.9096366, -1.017536, 0, 0, 0, 1, 1,
-0.3046027, -0.8807309, -3.299282, 0, 0, 0, 1, 1,
-0.3023885, -0.3196394, -2.704209, 0, 0, 0, 1, 1,
-0.3017828, 0.08978006, -2.410053, 0, 0, 0, 1, 1,
-0.2989733, -0.1996259, -2.608596, 0, 0, 0, 1, 1,
-0.2988414, -0.1836912, -0.8602285, 1, 1, 1, 1, 1,
-0.2953341, 0.09596687, 0.3404232, 1, 1, 1, 1, 1,
-0.2925279, -1.142422, -3.950464, 1, 1, 1, 1, 1,
-0.2918569, -2.349158, -3.736951, 1, 1, 1, 1, 1,
-0.2890665, 0.2221337, -2.228633, 1, 1, 1, 1, 1,
-0.2856273, -0.1586989, -1.472255, 1, 1, 1, 1, 1,
-0.2855696, -0.6740485, -2.423862, 1, 1, 1, 1, 1,
-0.2810575, -0.07287326, -0.5929867, 1, 1, 1, 1, 1,
-0.2798758, 0.09201972, -0.6842398, 1, 1, 1, 1, 1,
-0.2766546, -0.451923, -2.708649, 1, 1, 1, 1, 1,
-0.2723374, -0.8380362, -3.719119, 1, 1, 1, 1, 1,
-0.2722698, 0.07985202, -1.217838, 1, 1, 1, 1, 1,
-0.2712908, -1.029794, -4.018543, 1, 1, 1, 1, 1,
-0.2706628, -0.009240559, -1.604115, 1, 1, 1, 1, 1,
-0.2702762, 0.7503425, -0.801142, 1, 1, 1, 1, 1,
-0.2701807, -0.5906844, -0.5705791, 0, 0, 1, 1, 1,
-0.267075, 0.2814221, -1.468576, 1, 0, 0, 1, 1,
-0.2645555, -1.480941, -2.670973, 1, 0, 0, 1, 1,
-0.2635161, 0.7644144, -0.9442638, 1, 0, 0, 1, 1,
-0.2631733, 1.265173, 1.59303, 1, 0, 0, 1, 1,
-0.2629929, 1.409125, -0.7220926, 1, 0, 0, 1, 1,
-0.2569473, 0.6452821, -0.6605193, 0, 0, 0, 1, 1,
-0.2551698, 0.6256667, -1.079214, 0, 0, 0, 1, 1,
-0.2549203, -1.887319, -2.603053, 0, 0, 0, 1, 1,
-0.2542961, 2.256614, -1.808234, 0, 0, 0, 1, 1,
-0.253177, 0.8100855, -1.863922, 0, 0, 0, 1, 1,
-0.2522623, 2.054364, -0.7456627, 0, 0, 0, 1, 1,
-0.2484854, 0.0143826, -1.702451, 0, 0, 0, 1, 1,
-0.2454337, 1.175639, 0.05994635, 1, 1, 1, 1, 1,
-0.2411891, -0.4692211, -2.508157, 1, 1, 1, 1, 1,
-0.2342869, -0.801205, -1.708375, 1, 1, 1, 1, 1,
-0.2330239, 1.223996, -1.571977, 1, 1, 1, 1, 1,
-0.2300864, -1.682587, -1.624576, 1, 1, 1, 1, 1,
-0.2267491, -0.07309604, -1.0543, 1, 1, 1, 1, 1,
-0.225416, -1.05906, -3.361603, 1, 1, 1, 1, 1,
-0.2250918, 1.644683, -1.347368, 1, 1, 1, 1, 1,
-0.2239523, 1.457536, -0.1746355, 1, 1, 1, 1, 1,
-0.2227213, -0.7014186, -3.514622, 1, 1, 1, 1, 1,
-0.2209949, 0.7458459, 1.789338, 1, 1, 1, 1, 1,
-0.2147475, -0.7774265, -4.028213, 1, 1, 1, 1, 1,
-0.2136881, -0.05161482, -2.137576, 1, 1, 1, 1, 1,
-0.2112009, -0.6776845, -1.531794, 1, 1, 1, 1, 1,
-0.2109259, -0.5215909, -4.580067, 1, 1, 1, 1, 1,
-0.1979622, -0.692552, -4.59313, 0, 0, 1, 1, 1,
-0.1956783, 0.9693316, -1.168327, 1, 0, 0, 1, 1,
-0.194868, 0.6812633, -0.9026515, 1, 0, 0, 1, 1,
-0.1941238, 0.4244346, 0.01126899, 1, 0, 0, 1, 1,
-0.1935229, 0.1580899, -0.0441336, 1, 0, 0, 1, 1,
-0.1924803, 0.7820618, 0.3158948, 1, 0, 0, 1, 1,
-0.1883486, -0.6368986, -0.9458097, 0, 0, 0, 1, 1,
-0.1871511, 0.1989799, -0.616493, 0, 0, 0, 1, 1,
-0.1850705, -0.2590102, -3.033453, 0, 0, 0, 1, 1,
-0.1827751, -1.646073, -3.894109, 0, 0, 0, 1, 1,
-0.1815332, -0.3961877, -2.826018, 0, 0, 0, 1, 1,
-0.1805255, 0.3358868, -0.7614106, 0, 0, 0, 1, 1,
-0.176367, 1.110533, -1.557276, 0, 0, 0, 1, 1,
-0.1730612, 0.7189502, -2.352228, 1, 1, 1, 1, 1,
-0.1682194, 1.568695, -0.471974, 1, 1, 1, 1, 1,
-0.1662336, -0.1407185, -1.220123, 1, 1, 1, 1, 1,
-0.1638201, -1.034548, -2.67539, 1, 1, 1, 1, 1,
-0.1591817, 0.6090102, -0.08326506, 1, 1, 1, 1, 1,
-0.1450027, 1.685775, -0.04243871, 1, 1, 1, 1, 1,
-0.1442747, 0.3548773, 0.5050856, 1, 1, 1, 1, 1,
-0.1423812, 0.7356689, 0.462071, 1, 1, 1, 1, 1,
-0.1415249, 1.18529, 0.03438565, 1, 1, 1, 1, 1,
-0.1408481, -0.2658008, -1.162803, 1, 1, 1, 1, 1,
-0.140673, -0.4264498, -3.0964, 1, 1, 1, 1, 1,
-0.1397349, -0.5226269, -2.621626, 1, 1, 1, 1, 1,
-0.1330706, -0.6123423, -2.682651, 1, 1, 1, 1, 1,
-0.132834, -0.6273074, -0.7057354, 1, 1, 1, 1, 1,
-0.1248712, -0.326229, -3.88336, 1, 1, 1, 1, 1,
-0.1247859, -0.3040397, -3.220654, 0, 0, 1, 1, 1,
-0.1184964, 1.250146, -0.7691776, 1, 0, 0, 1, 1,
-0.1147602, 0.8750657, -0.6435145, 1, 0, 0, 1, 1,
-0.1147448, -0.4354325, -2.79322, 1, 0, 0, 1, 1,
-0.1116956, 0.1404001, -1.681342, 1, 0, 0, 1, 1,
-0.1107842, 0.07769392, -0.6886815, 1, 0, 0, 1, 1,
-0.1100177, 0.05696715, -1.736418, 0, 0, 0, 1, 1,
-0.1060157, -0.8521853, -2.595379, 0, 0, 0, 1, 1,
-0.102823, -0.3425398, -2.098442, 0, 0, 0, 1, 1,
-0.1000454, 1.330815, -0.8192153, 0, 0, 0, 1, 1,
-0.09808878, -0.6124219, -2.090475, 0, 0, 0, 1, 1,
-0.09537482, -0.6336054, -1.641844, 0, 0, 0, 1, 1,
-0.09158558, 0.3252565, 0.4419201, 0, 0, 0, 1, 1,
-0.08802518, -2.939317, -3.735367, 1, 1, 1, 1, 1,
-0.08777081, -0.376538, -2.715676, 1, 1, 1, 1, 1,
-0.08580352, -0.5325426, -2.15919, 1, 1, 1, 1, 1,
-0.0816955, 0.1650029, 0.4738367, 1, 1, 1, 1, 1,
-0.08062732, -0.9917019, -4.952197, 1, 1, 1, 1, 1,
-0.0718497, 0.124394, -1.383028, 1, 1, 1, 1, 1,
-0.06947143, 0.6222523, 0.7405841, 1, 1, 1, 1, 1,
-0.06917325, 1.371868, -0.7753921, 1, 1, 1, 1, 1,
-0.06914308, 0.6292873, 1.126968, 1, 1, 1, 1, 1,
-0.06898838, -0.1705202, -3.801285, 1, 1, 1, 1, 1,
-0.06765202, -0.3081423, -3.710376, 1, 1, 1, 1, 1,
-0.06719396, -0.4359304, -3.833159, 1, 1, 1, 1, 1,
-0.06576703, -0.791689, -3.179047, 1, 1, 1, 1, 1,
-0.06537055, 0.978774, 0.597671, 1, 1, 1, 1, 1,
-0.06277464, -1.208532, -3.919213, 1, 1, 1, 1, 1,
-0.06267671, -1.995871, -2.265502, 0, 0, 1, 1, 1,
-0.06013713, -1.967887, -2.859928, 1, 0, 0, 1, 1,
-0.0598086, -0.2551888, -4.510139, 1, 0, 0, 1, 1,
-0.0582539, 1.642536, 1.483302, 1, 0, 0, 1, 1,
-0.05678132, -0.6016878, -4.785651, 1, 0, 0, 1, 1,
-0.05353641, 0.1351155, -1.669264, 1, 0, 0, 1, 1,
-0.05239705, -1.552768, -4.307083, 0, 0, 0, 1, 1,
-0.04416483, 0.3414544, -1.135049, 0, 0, 0, 1, 1,
-0.04403174, -1.804914, -5.826271, 0, 0, 0, 1, 1,
-0.04323349, -0.7745466, -3.197145, 0, 0, 0, 1, 1,
-0.0392229, -0.8789476, -3.88816, 0, 0, 0, 1, 1,
-0.03905534, -0.8573542, -2.667563, 0, 0, 0, 1, 1,
-0.03889146, -0.653025, -4.152466, 0, 0, 0, 1, 1,
-0.03786846, -1.037608, -2.470277, 1, 1, 1, 1, 1,
-0.0350449, -0.3168446, -3.401233, 1, 1, 1, 1, 1,
-0.03347171, -1.226588, -2.913321, 1, 1, 1, 1, 1,
-0.03315055, 0.8002367, -1.03134, 1, 1, 1, 1, 1,
-0.03272407, -0.0166717, -1.346623, 1, 1, 1, 1, 1,
-0.03271834, -0.7222376, -1.126785, 1, 1, 1, 1, 1,
-0.03219906, 0.3329512, -1.3028, 1, 1, 1, 1, 1,
-0.02766433, -1.272044, -2.512575, 1, 1, 1, 1, 1,
-0.02583459, -1.184633, -2.481434, 1, 1, 1, 1, 1,
-0.02181957, -0.8493885, -1.644464, 1, 1, 1, 1, 1,
-0.02165781, -0.1758152, -3.554789, 1, 1, 1, 1, 1,
-0.01298734, -0.9937175, -2.804112, 1, 1, 1, 1, 1,
-0.005352471, -0.3796346, -3.606991, 1, 1, 1, 1, 1,
-0.004190359, 0.6262613, -0.8327871, 1, 1, 1, 1, 1,
-0.0004088382, -0.588172, -3.23088, 1, 1, 1, 1, 1,
0.001884861, -0.07121374, 0.8249485, 0, 0, 1, 1, 1,
0.002294922, -0.2456652, 2.540786, 1, 0, 0, 1, 1,
0.003445465, 0.04061188, 0.7241893, 1, 0, 0, 1, 1,
0.008212928, -0.8779396, 3.232413, 1, 0, 0, 1, 1,
0.01096157, -0.4315806, 4.715583, 1, 0, 0, 1, 1,
0.0111229, 0.5972685, -0.2059531, 1, 0, 0, 1, 1,
0.01284976, 0.2736351, 1.943391, 0, 0, 0, 1, 1,
0.01356103, 0.8945121, -0.082698, 0, 0, 0, 1, 1,
0.01398122, -0.7564471, 4.261182, 0, 0, 0, 1, 1,
0.0193215, -0.3530608, 3.499232, 0, 0, 0, 1, 1,
0.01950992, -0.8501001, 3.490814, 0, 0, 0, 1, 1,
0.02912946, 0.1933473, -0.5116343, 0, 0, 0, 1, 1,
0.030066, 0.6859062, 0.4139636, 0, 0, 0, 1, 1,
0.03467139, -0.9889563, 3.535413, 1, 1, 1, 1, 1,
0.03679211, -1.342096, 3.629372, 1, 1, 1, 1, 1,
0.03808298, 0.5947365, 0.04079792, 1, 1, 1, 1, 1,
0.04835835, 1.004854, -0.6357297, 1, 1, 1, 1, 1,
0.04989086, -0.4936095, 3.205714, 1, 1, 1, 1, 1,
0.05438798, -0.8234927, 1.909427, 1, 1, 1, 1, 1,
0.05585896, -1.855472, 2.160844, 1, 1, 1, 1, 1,
0.05606065, 0.02307859, -0.1278793, 1, 1, 1, 1, 1,
0.0578093, -0.5243946, 3.808046, 1, 1, 1, 1, 1,
0.0604595, 0.5867262, 1.728974, 1, 1, 1, 1, 1,
0.06443214, -0.07156703, 1.904077, 1, 1, 1, 1, 1,
0.07247616, 0.5277835, 1.814149, 1, 1, 1, 1, 1,
0.07698476, -1.419995, 2.947379, 1, 1, 1, 1, 1,
0.07979677, -0.2662139, 2.212821, 1, 1, 1, 1, 1,
0.08041618, -0.4669635, 3.772671, 1, 1, 1, 1, 1,
0.08218803, -0.0522352, 3.210949, 0, 0, 1, 1, 1,
0.08251458, -0.5843404, 1.954425, 1, 0, 0, 1, 1,
0.08372928, -0.8452863, 1.561194, 1, 0, 0, 1, 1,
0.08746813, 0.05299867, -1.412363, 1, 0, 0, 1, 1,
0.08916833, -0.234792, 3.377563, 1, 0, 0, 1, 1,
0.09251603, -0.8004354, 2.727115, 1, 0, 0, 1, 1,
0.09405474, -1.14848, 3.771771, 0, 0, 0, 1, 1,
0.09457844, 1.636645, -0.576705, 0, 0, 0, 1, 1,
0.09623969, -0.8077933, 1.647985, 0, 0, 0, 1, 1,
0.09881562, 0.3597097, -0.1042217, 0, 0, 0, 1, 1,
0.09946116, 0.5870915, 0.1897193, 0, 0, 0, 1, 1,
0.1009356, 0.6375256, -0.4356138, 0, 0, 0, 1, 1,
0.1067447, -2.464984, 1.670563, 0, 0, 0, 1, 1,
0.1088885, -2.559062, 4.815063, 1, 1, 1, 1, 1,
0.110043, 0.7485403, 0.5753187, 1, 1, 1, 1, 1,
0.1115563, 1.341846, 0.2125435, 1, 1, 1, 1, 1,
0.1129897, -0.8765658, 2.449099, 1, 1, 1, 1, 1,
0.1135216, 2.002132, 0.01698942, 1, 1, 1, 1, 1,
0.1161313, 1.801369, 0.4608411, 1, 1, 1, 1, 1,
0.1178314, 0.2091983, 1.010374, 1, 1, 1, 1, 1,
0.1237759, 0.6477621, 1.874384, 1, 1, 1, 1, 1,
0.1247321, -0.6342375, 4.171465, 1, 1, 1, 1, 1,
0.1255033, 0.6101235, -1.126049, 1, 1, 1, 1, 1,
0.1258542, 0.679671, -0.2157654, 1, 1, 1, 1, 1,
0.1262266, 0.614843, 0.6696535, 1, 1, 1, 1, 1,
0.1273657, -0.3537519, 2.783989, 1, 1, 1, 1, 1,
0.1353301, -0.02059842, 0.832314, 1, 1, 1, 1, 1,
0.1357418, -0.3128804, 1.762592, 1, 1, 1, 1, 1,
0.1368823, 0.8165206, -2.094401, 0, 0, 1, 1, 1,
0.1395296, 0.7476579, 1.149506, 1, 0, 0, 1, 1,
0.1416484, 0.5851964, 0.1511814, 1, 0, 0, 1, 1,
0.145303, 0.2012381, 0.5867281, 1, 0, 0, 1, 1,
0.146269, 0.5854703, 0.6729866, 1, 0, 0, 1, 1,
0.146476, 0.393191, -0.7575955, 1, 0, 0, 1, 1,
0.1497268, 0.3291098, -0.03090673, 0, 0, 0, 1, 1,
0.1560236, -0.7061946, 3.814576, 0, 0, 0, 1, 1,
0.1562992, -0.289306, 1.70076, 0, 0, 0, 1, 1,
0.1580373, 1.967775, 0.7101189, 0, 0, 0, 1, 1,
0.1588081, 0.4424874, 0.1757401, 0, 0, 0, 1, 1,
0.1729584, -0.7889703, 3.445947, 0, 0, 0, 1, 1,
0.176222, -1.543471, 2.183611, 0, 0, 0, 1, 1,
0.1791665, 0.08620484, 0.4700238, 1, 1, 1, 1, 1,
0.1820816, -0.33442, 1.028922, 1, 1, 1, 1, 1,
0.1850311, 0.6024417, 0.8652539, 1, 1, 1, 1, 1,
0.1871165, 1.925341, -0.1213374, 1, 1, 1, 1, 1,
0.187488, 0.1263479, 0.6756646, 1, 1, 1, 1, 1,
0.1875493, -0.5937467, 2.153876, 1, 1, 1, 1, 1,
0.1876711, 2.185466, -1.554676, 1, 1, 1, 1, 1,
0.1890139, -0.3442709, 1.302549, 1, 1, 1, 1, 1,
0.1926912, -0.5148461, 4.360522, 1, 1, 1, 1, 1,
0.1928893, 0.01766566, 2.533167, 1, 1, 1, 1, 1,
0.1958796, 1.302573, -0.5441868, 1, 1, 1, 1, 1,
0.2026568, -2.356811, 3.864972, 1, 1, 1, 1, 1,
0.2029194, -0.7976856, 3.936388, 1, 1, 1, 1, 1,
0.2065896, -0.2187616, 2.145972, 1, 1, 1, 1, 1,
0.2108422, 0.3396395, -0.02140673, 1, 1, 1, 1, 1,
0.2121466, -0.8049833, 2.853516, 0, 0, 1, 1, 1,
0.2126599, -0.4990758, 2.416178, 1, 0, 0, 1, 1,
0.2142729, 2.083053, -0.0576739, 1, 0, 0, 1, 1,
0.2149292, 0.1033757, 1.614936, 1, 0, 0, 1, 1,
0.2188658, -0.2957825, 2.448591, 1, 0, 0, 1, 1,
0.2223733, -1.683731, 2.315553, 1, 0, 0, 1, 1,
0.2264894, 0.03904725, 1.285222, 0, 0, 0, 1, 1,
0.2275559, 0.8453578, 0.731323, 0, 0, 0, 1, 1,
0.230185, -2.760359, 3.671023, 0, 0, 0, 1, 1,
0.2351386, -1.175344, 4.059039, 0, 0, 0, 1, 1,
0.2412949, -0.4856684, 0.3568452, 0, 0, 0, 1, 1,
0.2416067, 1.282816, -0.3174669, 0, 0, 0, 1, 1,
0.242044, 0.3465914, 0.5486355, 0, 0, 0, 1, 1,
0.2433307, -0.6135333, 2.315013, 1, 1, 1, 1, 1,
0.2463099, -1.388133, 4.982852, 1, 1, 1, 1, 1,
0.2466239, -1.41039, 3.868285, 1, 1, 1, 1, 1,
0.2483732, 1.185368, 0.5139191, 1, 1, 1, 1, 1,
0.2504364, 0.6931335, -0.6239185, 1, 1, 1, 1, 1,
0.2559253, 0.4409738, 0.5556576, 1, 1, 1, 1, 1,
0.256045, -1.718666, 3.211254, 1, 1, 1, 1, 1,
0.2613384, -0.1763259, 3.02628, 1, 1, 1, 1, 1,
0.2622235, 0.496584, -0.03283742, 1, 1, 1, 1, 1,
0.2622561, -0.1264625, 3.278333, 1, 1, 1, 1, 1,
0.2633406, 0.3315965, -0.6058583, 1, 1, 1, 1, 1,
0.2712292, 0.2198453, 0.8205268, 1, 1, 1, 1, 1,
0.2748682, -0.3968675, 1.236179, 1, 1, 1, 1, 1,
0.2772413, 0.3041205, -0.1530414, 1, 1, 1, 1, 1,
0.2811791, -0.960938, 2.736671, 1, 1, 1, 1, 1,
0.2814606, -0.8017577, 2.12224, 0, 0, 1, 1, 1,
0.2841412, -0.3434439, 3.514078, 1, 0, 0, 1, 1,
0.294026, -1.16518, 2.983824, 1, 0, 0, 1, 1,
0.2950533, -1.573879, 1.270549, 1, 0, 0, 1, 1,
0.2951839, 0.67631, 0.007368128, 1, 0, 0, 1, 1,
0.2999762, 0.645629, 0.6711547, 1, 0, 0, 1, 1,
0.3027528, 0.4921159, 1.604749, 0, 0, 0, 1, 1,
0.3062465, -0.1407173, 2.833543, 0, 0, 0, 1, 1,
0.3072727, 0.8878741, 1.243527, 0, 0, 0, 1, 1,
0.3087091, -1.279246, 4.2883, 0, 0, 0, 1, 1,
0.3097669, -0.2983584, 3.473464, 0, 0, 0, 1, 1,
0.3105384, -0.5728657, 1.869255, 0, 0, 0, 1, 1,
0.3144525, 0.1575041, 1.417076, 0, 0, 0, 1, 1,
0.3149468, -0.5141436, 2.978015, 1, 1, 1, 1, 1,
0.3176456, -0.2765239, 2.040055, 1, 1, 1, 1, 1,
0.3232371, -0.3562892, 1.972395, 1, 1, 1, 1, 1,
0.3252138, -0.1019487, 2.483643, 1, 1, 1, 1, 1,
0.3266334, 0.5272086, -0.7641773, 1, 1, 1, 1, 1,
0.3274321, 0.2138867, 1.156528, 1, 1, 1, 1, 1,
0.3302398, 0.08410213, 1.383257, 1, 1, 1, 1, 1,
0.3321731, 0.633584, -0.55563, 1, 1, 1, 1, 1,
0.3352935, -0.6717385, 1.186458, 1, 1, 1, 1, 1,
0.3367904, -0.532023, 1.661639, 1, 1, 1, 1, 1,
0.3378778, 0.6621, 1.545224, 1, 1, 1, 1, 1,
0.3407463, -1.902499, 0.2838375, 1, 1, 1, 1, 1,
0.3436653, -1.027777, 3.506925, 1, 1, 1, 1, 1,
0.3441823, 0.9870521, -1.899444, 1, 1, 1, 1, 1,
0.3445179, -0.09270944, 3.75325, 1, 1, 1, 1, 1,
0.3446884, -0.03520791, 0.3720267, 0, 0, 1, 1, 1,
0.3462232, 0.3690756, 1.14782, 1, 0, 0, 1, 1,
0.3467969, -0.5259264, 3.349677, 1, 0, 0, 1, 1,
0.35127, -0.7330608, 3.573211, 1, 0, 0, 1, 1,
0.3554013, 0.08916803, 1.404324, 1, 0, 0, 1, 1,
0.3560679, 1.031959, 0.5846303, 1, 0, 0, 1, 1,
0.3571207, -0.1143565, 1.641395, 0, 0, 0, 1, 1,
0.360407, 0.6056225, 1.063786, 0, 0, 0, 1, 1,
0.3606825, -1.078275, 2.380407, 0, 0, 0, 1, 1,
0.3610179, -0.3443551, 2.825904, 0, 0, 0, 1, 1,
0.3614155, -0.5219941, 2.616857, 0, 0, 0, 1, 1,
0.3675615, 0.6735478, 0.8110464, 0, 0, 0, 1, 1,
0.3689235, 0.4945924, 1.261499, 0, 0, 0, 1, 1,
0.3690265, -1.517366, 4.405695, 1, 1, 1, 1, 1,
0.3695857, -0.4803614, 1.808322, 1, 1, 1, 1, 1,
0.3712944, -0.4227656, 1.311932, 1, 1, 1, 1, 1,
0.3746828, 0.3070982, -0.7536, 1, 1, 1, 1, 1,
0.3757099, 0.2309841, 1.484344, 1, 1, 1, 1, 1,
0.3763539, -0.3696666, 1.858494, 1, 1, 1, 1, 1,
0.3764102, 0.02630918, 1.023406, 1, 1, 1, 1, 1,
0.3766147, 0.664888, -0.5767561, 1, 1, 1, 1, 1,
0.3778546, -1.830466, 4.062011, 1, 1, 1, 1, 1,
0.3782759, 0.2433366, -0.009096558, 1, 1, 1, 1, 1,
0.3804261, 1.362438, 0.6159459, 1, 1, 1, 1, 1,
0.3841714, -0.4160233, 2.402514, 1, 1, 1, 1, 1,
0.3949973, -1.029169, 2.269304, 1, 1, 1, 1, 1,
0.4016289, 0.526364, 0.1083453, 1, 1, 1, 1, 1,
0.4078304, 1.086958, 0.1453275, 1, 1, 1, 1, 1,
0.4081084, -0.3544125, 0.4941825, 0, 0, 1, 1, 1,
0.4144311, -0.5509832, 3.426677, 1, 0, 0, 1, 1,
0.4154342, -1.872782, 5.478152, 1, 0, 0, 1, 1,
0.4220371, -0.9559884, 3.185061, 1, 0, 0, 1, 1,
0.4256741, 0.3395946, 0.926564, 1, 0, 0, 1, 1,
0.4271755, 0.1031683, 1.66013, 1, 0, 0, 1, 1,
0.4280132, 1.438086, -1.094588, 0, 0, 0, 1, 1,
0.4295042, 0.4140363, 1.187546, 0, 0, 0, 1, 1,
0.4372007, 1.136056, -0.3865497, 0, 0, 0, 1, 1,
0.4436132, -0.3728257, 2.449067, 0, 0, 0, 1, 1,
0.4455741, -1.072959, 2.645387, 0, 0, 0, 1, 1,
0.4462936, -0.4220472, 0.5201224, 0, 0, 0, 1, 1,
0.4488447, -1.039479, 3.558469, 0, 0, 0, 1, 1,
0.4512215, -0.8296941, 4.093284, 1, 1, 1, 1, 1,
0.4531893, -0.1033262, 3.33824, 1, 1, 1, 1, 1,
0.4563975, 2.014436, 0.7133791, 1, 1, 1, 1, 1,
0.4611997, -0.1406348, 2.452698, 1, 1, 1, 1, 1,
0.462522, 1.330381, 0.515077, 1, 1, 1, 1, 1,
0.4658647, 0.2442096, 0.6963785, 1, 1, 1, 1, 1,
0.4684231, -1.970281, 3.756031, 1, 1, 1, 1, 1,
0.4701244, -0.9738517, 2.852446, 1, 1, 1, 1, 1,
0.4704012, -0.1736685, 1.973397, 1, 1, 1, 1, 1,
0.4729343, 0.4185698, -0.6781831, 1, 1, 1, 1, 1,
0.473462, -1.252361, 2.94329, 1, 1, 1, 1, 1,
0.4752684, 0.8532435, -1.348165, 1, 1, 1, 1, 1,
0.476905, 0.5965013, 0.8557106, 1, 1, 1, 1, 1,
0.4780054, -1.721304, 3.710425, 1, 1, 1, 1, 1,
0.4820401, 0.9212496, -1.111666, 1, 1, 1, 1, 1,
0.4855193, -1.442435, 4.135983, 0, 0, 1, 1, 1,
0.4910817, -1.102322, -0.02032067, 1, 0, 0, 1, 1,
0.4967903, -2.673528, 4.364923, 1, 0, 0, 1, 1,
0.5038824, -1.069591, 3.152982, 1, 0, 0, 1, 1,
0.5127236, 1.911234, -1.10142, 1, 0, 0, 1, 1,
0.5136011, -0.2444614, 0.6613142, 1, 0, 0, 1, 1,
0.5342161, -0.4240073, 0.534881, 0, 0, 0, 1, 1,
0.5346889, -1.944615, 3.398613, 0, 0, 0, 1, 1,
0.537726, 0.04492782, 2.909961, 0, 0, 0, 1, 1,
0.5389479, 0.1749835, 1.305167, 0, 0, 0, 1, 1,
0.5459546, -0.4787112, 1.57027, 0, 0, 0, 1, 1,
0.5485983, 1.159878, -0.5031875, 0, 0, 0, 1, 1,
0.5494569, -0.9912115, 1.97415, 0, 0, 0, 1, 1,
0.5507883, 0.4816517, -0.8311863, 1, 1, 1, 1, 1,
0.5519721, 2.054275, -0.9213938, 1, 1, 1, 1, 1,
0.5523889, -0.6331752, 2.634957, 1, 1, 1, 1, 1,
0.5538671, -1.493357, 4.327439, 1, 1, 1, 1, 1,
0.5546642, -0.4751064, 3.730018, 1, 1, 1, 1, 1,
0.5561246, 0.1280086, 1.160679, 1, 1, 1, 1, 1,
0.5589291, 0.8427186, 0.8316448, 1, 1, 1, 1, 1,
0.566497, -0.2635556, 1.112487, 1, 1, 1, 1, 1,
0.5680265, -0.6673937, 2.489354, 1, 1, 1, 1, 1,
0.5698441, -0.1000826, 1.947052, 1, 1, 1, 1, 1,
0.5700352, 0.2367156, 0.3018622, 1, 1, 1, 1, 1,
0.5718005, -1.459128, 2.606782, 1, 1, 1, 1, 1,
0.5748604, 0.1244204, 0.901767, 1, 1, 1, 1, 1,
0.5756372, -0.3768682, 0.9802068, 1, 1, 1, 1, 1,
0.5764664, -0.540613, 1.249701, 1, 1, 1, 1, 1,
0.5926311, -0.4455788, 2.021331, 0, 0, 1, 1, 1,
0.5977674, -0.2206209, 2.292873, 1, 0, 0, 1, 1,
0.5991794, 1.129061, -0.1022855, 1, 0, 0, 1, 1,
0.6005726, -1.125133, 0.7850316, 1, 0, 0, 1, 1,
0.6031002, -0.3726637, 2.329722, 1, 0, 0, 1, 1,
0.6037609, 1.131017, 1.10376, 1, 0, 0, 1, 1,
0.6047348, -0.2928541, 1.496132, 0, 0, 0, 1, 1,
0.6188706, 0.1763871, 2.742057, 0, 0, 0, 1, 1,
0.6194933, -0.9884794, 2.291921, 0, 0, 0, 1, 1,
0.621487, -0.07224452, 0.8540066, 0, 0, 0, 1, 1,
0.6220571, -0.4693708, 1.367988, 0, 0, 0, 1, 1,
0.6251104, -1.067989, 3.067695, 0, 0, 0, 1, 1,
0.6345159, -1.712669, 3.968095, 0, 0, 0, 1, 1,
0.6364047, -0.4917916, 2.265574, 1, 1, 1, 1, 1,
0.6622953, 1.342644, -0.2137908, 1, 1, 1, 1, 1,
0.6657108, 0.08517423, 2.104137, 1, 1, 1, 1, 1,
0.6670556, -1.508373, 2.746354, 1, 1, 1, 1, 1,
0.6673183, -0.2904017, 1.907201, 1, 1, 1, 1, 1,
0.6682611, 0.01169232, 1.706812, 1, 1, 1, 1, 1,
0.6691476, 0.1151896, 0.3797337, 1, 1, 1, 1, 1,
0.6721053, -2.579037, 3.68238, 1, 1, 1, 1, 1,
0.6730555, -0.5063328, 4.49324, 1, 1, 1, 1, 1,
0.677304, -2.637029, 2.777261, 1, 1, 1, 1, 1,
0.6781259, 0.8962526, 2.912905, 1, 1, 1, 1, 1,
0.6827267, 0.7811632, -0.5662215, 1, 1, 1, 1, 1,
0.6835194, -0.05037466, 3.947084, 1, 1, 1, 1, 1,
0.6866867, 0.2517719, 0.7659526, 1, 1, 1, 1, 1,
0.6933598, -1.917019, 3.386036, 1, 1, 1, 1, 1,
0.6984758, 0.8308951, 1.817055, 0, 0, 1, 1, 1,
0.6997301, 1.205954, 1.945297, 1, 0, 0, 1, 1,
0.6998005, 0.562497, 0.7685324, 1, 0, 0, 1, 1,
0.7007282, -0.6087877, 2.591394, 1, 0, 0, 1, 1,
0.706348, 0.3013909, 0.7443771, 1, 0, 0, 1, 1,
0.7178379, 1.71615, 0.07812693, 1, 0, 0, 1, 1,
0.7188216, 0.1886166, 1.309386, 0, 0, 0, 1, 1,
0.7283661, 0.2895162, 1.589728, 0, 0, 0, 1, 1,
0.7297807, 0.03461588, 1.705378, 0, 0, 0, 1, 1,
0.736056, -0.3138244, 0.680882, 0, 0, 0, 1, 1,
0.7363219, 0.3229379, 1.125543, 0, 0, 0, 1, 1,
0.7386748, -0.3377202, 0.5296301, 0, 0, 0, 1, 1,
0.7444881, 0.02689813, -0.7910554, 0, 0, 0, 1, 1,
0.7495009, 0.6925365, 0.9900026, 1, 1, 1, 1, 1,
0.7518802, -1.276305, 2.224613, 1, 1, 1, 1, 1,
0.7567355, 0.6907102, -0.03038813, 1, 1, 1, 1, 1,
0.7584357, 1.298652, -0.6089677, 1, 1, 1, 1, 1,
0.7628605, 1.177312, 0.04243753, 1, 1, 1, 1, 1,
0.769178, -0.5176452, 2.409575, 1, 1, 1, 1, 1,
0.7729669, -0.3586734, 1.415387, 1, 1, 1, 1, 1,
0.775712, 1.396602, 1.777022, 1, 1, 1, 1, 1,
0.7898028, -1.224797, 2.945952, 1, 1, 1, 1, 1,
0.7951975, 0.8479576, 0.190633, 1, 1, 1, 1, 1,
0.7974124, 0.01793783, 3.252871, 1, 1, 1, 1, 1,
0.7977207, 0.602861, 2.680556, 1, 1, 1, 1, 1,
0.8032033, 1.09467, 0.7132699, 1, 1, 1, 1, 1,
0.8073754, -0.4432484, 1.942196, 1, 1, 1, 1, 1,
0.8088422, 0.8745558, 1.560848, 1, 1, 1, 1, 1,
0.8107477, 0.9197002, 0.08114916, 0, 0, 1, 1, 1,
0.8164079, 0.2210432, 0.8644947, 1, 0, 0, 1, 1,
0.818059, -0.5213318, 1.18687, 1, 0, 0, 1, 1,
0.8211836, 0.6638035, -0.743939, 1, 0, 0, 1, 1,
0.8230234, 0.5191249, 2.264715, 1, 0, 0, 1, 1,
0.8277439, 1.474063, 0.9384784, 1, 0, 0, 1, 1,
0.8379529, -3.312515, 3.621465, 0, 0, 0, 1, 1,
0.8412768, 1.070876, 0.9014141, 0, 0, 0, 1, 1,
0.8489162, 1.946631, 0.4965749, 0, 0, 0, 1, 1,
0.8505675, 0.01500835, 1.712664, 0, 0, 0, 1, 1,
0.8537396, -0.7444041, 1.400134, 0, 0, 0, 1, 1,
0.8565252, 0.7479553, 0.009290935, 0, 0, 0, 1, 1,
0.8569254, 1.393168, 0.3951506, 0, 0, 0, 1, 1,
0.8571301, 0.07725319, 1.939419, 1, 1, 1, 1, 1,
0.8677217, 0.2548985, -1.19453, 1, 1, 1, 1, 1,
0.8687711, -0.1170075, 0.3420641, 1, 1, 1, 1, 1,
0.8690233, 0.6233174, 0.8067165, 1, 1, 1, 1, 1,
0.8702442, -0.06035726, 1.986879, 1, 1, 1, 1, 1,
0.8708751, 1.970737, -0.08720385, 1, 1, 1, 1, 1,
0.87501, -1.516934, 2.600832, 1, 1, 1, 1, 1,
0.8753496, 1.67153, 1.804302, 1, 1, 1, 1, 1,
0.8757672, 0.3190179, 1.469211, 1, 1, 1, 1, 1,
0.8922416, 0.02703372, 1.587653, 1, 1, 1, 1, 1,
0.8945444, 0.006560602, 1.255551, 1, 1, 1, 1, 1,
0.9063248, 2.191709e-05, 1.779455, 1, 1, 1, 1, 1,
0.9171047, -0.9116145, 2.849874, 1, 1, 1, 1, 1,
0.9184824, -1.191818, 3.109541, 1, 1, 1, 1, 1,
0.9191008, 2.566159, 1.039179, 1, 1, 1, 1, 1,
0.9220454, 0.3934166, -0.1185912, 0, 0, 1, 1, 1,
0.9274206, 0.5873682, 1.305795, 1, 0, 0, 1, 1,
0.9276363, 1.055353, 0.70053, 1, 0, 0, 1, 1,
0.9383386, 0.5203639, 0.1452918, 1, 0, 0, 1, 1,
0.9412719, 0.2558714, -1.46776, 1, 0, 0, 1, 1,
0.9499725, -0.7344766, 3.625024, 1, 0, 0, 1, 1,
0.9510471, -2.307266, 4.471281, 0, 0, 0, 1, 1,
0.9587096, 1.518861, 0.2901598, 0, 0, 0, 1, 1,
0.9661826, 0.2663296, 1.123238, 0, 0, 0, 1, 1,
0.9702734, 1.108462, -0.2883337, 0, 0, 0, 1, 1,
0.9731327, 0.1568233, 2.727034, 0, 0, 0, 1, 1,
0.9748129, -0.9509649, 3.536293, 0, 0, 0, 1, 1,
0.9768503, 0.636582, -0.2796415, 0, 0, 0, 1, 1,
0.9823806, -0.03506587, 2.192472, 1, 1, 1, 1, 1,
0.9835876, -0.3605492, 1.63167, 1, 1, 1, 1, 1,
0.9879927, -0.5428546, 1.825619, 1, 1, 1, 1, 1,
0.9891477, 1.359697, 0.3016901, 1, 1, 1, 1, 1,
0.9910838, 1.674341, 2.225972, 1, 1, 1, 1, 1,
0.99213, 0.1462228, -0.2719475, 1, 1, 1, 1, 1,
0.9949387, 0.7103665, 0.9205439, 1, 1, 1, 1, 1,
0.9958984, -1.540882, 2.929368, 1, 1, 1, 1, 1,
0.9975864, -1.969377, 2.624801, 1, 1, 1, 1, 1,
1.002199, 0.9448677, -0.06142117, 1, 1, 1, 1, 1,
1.002291, 0.05010856, -0.3832316, 1, 1, 1, 1, 1,
1.003107, 0.5239758, 2.207141, 1, 1, 1, 1, 1,
1.004262, -0.8695278, 1.851326, 1, 1, 1, 1, 1,
1.004644, 0.1884169, 1.112652, 1, 1, 1, 1, 1,
1.00986, -0.03702483, 2.703305, 1, 1, 1, 1, 1,
1.019464, 1.300661, 0.2062552, 0, 0, 1, 1, 1,
1.032891, 0.9423807, 0.4479777, 1, 0, 0, 1, 1,
1.037001, -0.2247907, 1.99635, 1, 0, 0, 1, 1,
1.037106, -0.01649164, 2.761141, 1, 0, 0, 1, 1,
1.05889, 0.1813341, 1.589202, 1, 0, 0, 1, 1,
1.061111, -0.783693, -0.2786447, 1, 0, 0, 1, 1,
1.063805, -2.608288, 3.636521, 0, 0, 0, 1, 1,
1.072883, 0.9753183, 1.221832, 0, 0, 0, 1, 1,
1.079491, 1.608801, -0.8726256, 0, 0, 0, 1, 1,
1.08695, -0.5362011, 0.5057326, 0, 0, 0, 1, 1,
1.08809, 0.1311118, 0.9285304, 0, 0, 0, 1, 1,
1.088784, -0.5011795, 1.679214, 0, 0, 0, 1, 1,
1.095006, 0.2425373, 2.871129, 0, 0, 0, 1, 1,
1.099389, 1.095804, 0.8028789, 1, 1, 1, 1, 1,
1.100359, 1.4513, 0.1314268, 1, 1, 1, 1, 1,
1.102207, -0.1029718, 1.87406, 1, 1, 1, 1, 1,
1.13147, 0.2383439, 2.279646, 1, 1, 1, 1, 1,
1.133841, -0.5430421, 1.61477, 1, 1, 1, 1, 1,
1.133999, -1.251966, 0.3925333, 1, 1, 1, 1, 1,
1.13407, 0.2436436, 1.982029, 1, 1, 1, 1, 1,
1.146565, -0.3274118, 1.387786, 1, 1, 1, 1, 1,
1.151829, -1.410318, 2.305536, 1, 1, 1, 1, 1,
1.152068, 0.5558473, 3.062849, 1, 1, 1, 1, 1,
1.154041, 1.34011, 2.023715, 1, 1, 1, 1, 1,
1.15802, -0.7581227, 2.97822, 1, 1, 1, 1, 1,
1.162667, 0.4748211, -0.856492, 1, 1, 1, 1, 1,
1.163084, 1.023119, 0.9297467, 1, 1, 1, 1, 1,
1.165481, 1.80457, 0.2559304, 1, 1, 1, 1, 1,
1.167387, -1.30004, 2.508712, 0, 0, 1, 1, 1,
1.170394, 1.447886, 0.02163567, 1, 0, 0, 1, 1,
1.178934, -0.5550478, 2.688955, 1, 0, 0, 1, 1,
1.193647, 0.7772404, 1.670844, 1, 0, 0, 1, 1,
1.200149, 0.3936963, 2.464305, 1, 0, 0, 1, 1,
1.200384, -1.232983, 2.343878, 1, 0, 0, 1, 1,
1.200928, -0.1731256, 4.050503, 0, 0, 0, 1, 1,
1.201964, -0.0235295, 1.100864, 0, 0, 0, 1, 1,
1.204064, -1.971698, 0.3136522, 0, 0, 0, 1, 1,
1.207843, -0.8983515, 2.782005, 0, 0, 0, 1, 1,
1.208113, 1.369608, 1.88217, 0, 0, 0, 1, 1,
1.212978, 0.7304228, 0.170371, 0, 0, 0, 1, 1,
1.219821, -0.7009839, 1.325396, 0, 0, 0, 1, 1,
1.225553, -1.084982, 2.670475, 1, 1, 1, 1, 1,
1.23049, -1.19073, 2.627264, 1, 1, 1, 1, 1,
1.237692, -1.249348, 2.84683, 1, 1, 1, 1, 1,
1.24284, 0.06343501, 0.07170482, 1, 1, 1, 1, 1,
1.253835, -0.03649685, 1.554551, 1, 1, 1, 1, 1,
1.256628, -0.072763, 0.1995567, 1, 1, 1, 1, 1,
1.263565, -0.7473502, 1.537762, 1, 1, 1, 1, 1,
1.271139, 0.3080185, 1.314036, 1, 1, 1, 1, 1,
1.272027, -1.012446, 3.621238, 1, 1, 1, 1, 1,
1.280918, 0.733112, 2.195935, 1, 1, 1, 1, 1,
1.285131, -3.318278, 3.12542, 1, 1, 1, 1, 1,
1.290658, 0.1282408, -0.4479568, 1, 1, 1, 1, 1,
1.297364, -1.137995, 1.340865, 1, 1, 1, 1, 1,
1.300127, -0.7068607, 1.475321, 1, 1, 1, 1, 1,
1.302827, 0.1349625, -0.6170335, 1, 1, 1, 1, 1,
1.306716, 1.714095, 0.4001173, 0, 0, 1, 1, 1,
1.310142, -0.3001275, 0.9897605, 1, 0, 0, 1, 1,
1.31163, 1.884859, 0.1096111, 1, 0, 0, 1, 1,
1.316319, 1.040784, 0.07125284, 1, 0, 0, 1, 1,
1.328798, 0.1807556, 0.4069645, 1, 0, 0, 1, 1,
1.339408, 1.252032, 0.1733988, 1, 0, 0, 1, 1,
1.343912, 1.742746, 0.7805255, 0, 0, 0, 1, 1,
1.347417, 0.982409, 0.7235581, 0, 0, 0, 1, 1,
1.352588, 0.9943088, 1.500062, 0, 0, 0, 1, 1,
1.353726, 0.07248462, 2.467445, 0, 0, 0, 1, 1,
1.361734, 2.115506, -1.225723, 0, 0, 0, 1, 1,
1.365997, -0.1433818, 1.621974, 0, 0, 0, 1, 1,
1.369689, 0.4660083, 0.7707664, 0, 0, 0, 1, 1,
1.376716, 1.022741, 2.137703, 1, 1, 1, 1, 1,
1.379269, -0.3131149, 0.6075192, 1, 1, 1, 1, 1,
1.385861, 0.07038052, 2.963396, 1, 1, 1, 1, 1,
1.385868, -1.027894, 2.059051, 1, 1, 1, 1, 1,
1.391332, -0.9856957, 1.702506, 1, 1, 1, 1, 1,
1.398288, -0.07340965, 2.07896, 1, 1, 1, 1, 1,
1.398658, -1.942361, 2.579359, 1, 1, 1, 1, 1,
1.405222, -0.9253688, 0.152246, 1, 1, 1, 1, 1,
1.405943, -0.1059928, 1.262191, 1, 1, 1, 1, 1,
1.439319, 1.37863, -0.9299443, 1, 1, 1, 1, 1,
1.441757, -0.122198, 0.9262339, 1, 1, 1, 1, 1,
1.443947, 0.5843773, 1.707257, 1, 1, 1, 1, 1,
1.452646, 0.3554784, 0.1185561, 1, 1, 1, 1, 1,
1.463811, 0.5873802, 0.5004303, 1, 1, 1, 1, 1,
1.477279, -0.3303189, 1.114626, 1, 1, 1, 1, 1,
1.487277, 2.043517, 0.05596801, 0, 0, 1, 1, 1,
1.504144, -1.251966, 2.945997, 1, 0, 0, 1, 1,
1.507951, 0.5996388, -1.511696, 1, 0, 0, 1, 1,
1.509006, 0.2511671, -0.2776486, 1, 0, 0, 1, 1,
1.513678, 1.889711, -0.6923853, 1, 0, 0, 1, 1,
1.513986, 0.07946803, -0.7061553, 1, 0, 0, 1, 1,
1.51845, -0.8446065, 2.018867, 0, 0, 0, 1, 1,
1.523321, 0.5077419, 2.066994, 0, 0, 0, 1, 1,
1.542652, 0.3753842, 2.602797, 0, 0, 0, 1, 1,
1.571344, 0.09154689, 1.533037, 0, 0, 0, 1, 1,
1.57431, 0.1273993, 2.448206, 0, 0, 0, 1, 1,
1.583187, 0.6757584, 1.288933, 0, 0, 0, 1, 1,
1.591749, 0.2208789, 0.4020265, 0, 0, 0, 1, 1,
1.59181, -0.457587, 2.935218, 1, 1, 1, 1, 1,
1.592241, 0.6052106, 1.036913, 1, 1, 1, 1, 1,
1.601302, -0.486153, 0.9298438, 1, 1, 1, 1, 1,
1.601678, -1.686695, 3.364318, 1, 1, 1, 1, 1,
1.602974, 0.3477783, 1.098321, 1, 1, 1, 1, 1,
1.603456, 0.3127468, 0.9244576, 1, 1, 1, 1, 1,
1.611851, 0.6604467, -0.1170472, 1, 1, 1, 1, 1,
1.643782, -0.4123723, 1.718282, 1, 1, 1, 1, 1,
1.644507, -1.611513, 1.682554, 1, 1, 1, 1, 1,
1.646354, -0.5560572, 0.7563895, 1, 1, 1, 1, 1,
1.647829, 0.4751455, 2.781889, 1, 1, 1, 1, 1,
1.648714, -1.356508, 2.569392, 1, 1, 1, 1, 1,
1.658784, -0.7732276, -0.06301938, 1, 1, 1, 1, 1,
1.659219, -0.6314476, 2.729192, 1, 1, 1, 1, 1,
1.662097, -0.8776963, 1.593726, 1, 1, 1, 1, 1,
1.669642, 1.191251, 0.9494295, 0, 0, 1, 1, 1,
1.688565, 0.2423391, 1.033102, 1, 0, 0, 1, 1,
1.688858, -1.901781, 3.315815, 1, 0, 0, 1, 1,
1.692863, -1.097504, 0.8205577, 1, 0, 0, 1, 1,
1.718518, -0.3444402, 2.241018, 1, 0, 0, 1, 1,
1.718892, 0.4822246, 0.8360274, 1, 0, 0, 1, 1,
1.724711, -0.2004301, 2.434732, 0, 0, 0, 1, 1,
1.726258, 1.596896, 1.481568, 0, 0, 0, 1, 1,
1.727879, 0.4649985, 0.913489, 0, 0, 0, 1, 1,
1.729954, 0.1191555, 0.2643328, 0, 0, 0, 1, 1,
1.737302, -0.1475807, 3.048882, 0, 0, 0, 1, 1,
1.754318, -0.0436207, 1.81327, 0, 0, 0, 1, 1,
1.763467, -1.784912, 4.545677, 0, 0, 0, 1, 1,
1.773234, 1.2658, 0.730197, 1, 1, 1, 1, 1,
1.776155, -0.1942095, 0.020122, 1, 1, 1, 1, 1,
1.786225, 1.423536, 0.1328896, 1, 1, 1, 1, 1,
1.786746, 0.8362402, 0.2047328, 1, 1, 1, 1, 1,
1.798734, 0.0927046, 1.939042, 1, 1, 1, 1, 1,
1.801223, -0.4366438, 2.965039, 1, 1, 1, 1, 1,
1.80183, 0.006781419, 1.557764, 1, 1, 1, 1, 1,
1.803337, -0.249363, 1.638364, 1, 1, 1, 1, 1,
1.819383, -0.249065, 0.2874196, 1, 1, 1, 1, 1,
1.819586, 1.347143, 0.8312575, 1, 1, 1, 1, 1,
1.835804, -0.6430084, 2.187738, 1, 1, 1, 1, 1,
1.836864, 0.7494986, -0.8300517, 1, 1, 1, 1, 1,
1.840159, 0.5582249, 1.166539, 1, 1, 1, 1, 1,
1.845294, -1.419334, 3.267738, 1, 1, 1, 1, 1,
1.851634, -0.2217622, 2.346145, 1, 1, 1, 1, 1,
1.852715, 0.6393027, 1.734158, 0, 0, 1, 1, 1,
1.860856, 0.0878162, 1.243603, 1, 0, 0, 1, 1,
1.892126, 1.149703, 1.912048, 1, 0, 0, 1, 1,
2.025128, 1.118054, 0.1848461, 1, 0, 0, 1, 1,
2.063977, 0.5958871, 0.1546865, 1, 0, 0, 1, 1,
2.11542, 0.7265779, 0.4002932, 1, 0, 0, 1, 1,
2.136881, -0.394231, 0.9771277, 0, 0, 0, 1, 1,
2.140526, -0.7058802, 1.651954, 0, 0, 0, 1, 1,
2.140743, -1.849205, 4.647262, 0, 0, 0, 1, 1,
2.142001, 0.3840795, 1.136325, 0, 0, 0, 1, 1,
2.142065, 1.663733, -0.1521716, 0, 0, 0, 1, 1,
2.143664, -1.285455, 2.301059, 0, 0, 0, 1, 1,
2.185194, 0.4668221, 2.675416, 0, 0, 0, 1, 1,
2.255536, 1.029636, 2.810015, 1, 1, 1, 1, 1,
2.260209, 0.3191655, 2.410118, 1, 1, 1, 1, 1,
2.309462, 0.9333797, 0.8749132, 1, 1, 1, 1, 1,
2.338459, -0.3617359, 1.991634, 1, 1, 1, 1, 1,
2.342922, 0.3996227, 1.406324, 1, 1, 1, 1, 1,
2.553368, -2.218918, 3.502563, 1, 1, 1, 1, 1,
3.351842, -0.5641642, 1.466305, 1, 1, 1, 1, 1
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
var radius = 9.720368;
var distance = 34.14238;
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
mvMatrix.translate( -0.1951509, 0.2492189, 0.1740592 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.14238);
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
