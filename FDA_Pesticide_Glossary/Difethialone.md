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
-2.912756, 0.4972168, -0.436139, 1, 0, 0, 1,
-2.676033, 0.9292065, -2.03051, 1, 0.007843138, 0, 1,
-2.611419, 1.1065, -2.305743, 1, 0.01176471, 0, 1,
-2.61042, 0.3216322, -2.364519, 1, 0.01960784, 0, 1,
-2.568749, 0.4374718, -2.387652, 1, 0.02352941, 0, 1,
-2.264506, -1.615082, -1.960717, 1, 0.03137255, 0, 1,
-2.230787, 0.6448325, -0.760559, 1, 0.03529412, 0, 1,
-2.185148, -0.6457083, -1.711622, 1, 0.04313726, 0, 1,
-2.181172, 0.5434527, -0.6617998, 1, 0.04705882, 0, 1,
-2.140483, 0.6393048, -2.450323, 1, 0.05490196, 0, 1,
-2.135366, 0.1376938, -2.789851, 1, 0.05882353, 0, 1,
-2.084698, 0.04119407, -1.921088, 1, 0.06666667, 0, 1,
-1.993518, -0.6934023, -3.404781, 1, 0.07058824, 0, 1,
-1.988565, -0.944271, -0.7498553, 1, 0.07843138, 0, 1,
-1.96741, -2.608671, -4.269597, 1, 0.08235294, 0, 1,
-1.960179, 0.9659529, 1.918162, 1, 0.09019608, 0, 1,
-1.879816, -0.7941068, -2.179047, 1, 0.09411765, 0, 1,
-1.867177, 0.78289, -1.121313, 1, 0.1019608, 0, 1,
-1.844539, 0.7147001, -0.7066706, 1, 0.1098039, 0, 1,
-1.843303, 0.9846764, -1.569309, 1, 0.1137255, 0, 1,
-1.841694, 1.738622, -1.177347, 1, 0.1215686, 0, 1,
-1.831939, 0.358839, -0.459076, 1, 0.1254902, 0, 1,
-1.817906, 1.302272, -2.212994, 1, 0.1333333, 0, 1,
-1.797604, -0.5448064, -3.19827, 1, 0.1372549, 0, 1,
-1.772731, 0.4303982, -1.427871, 1, 0.145098, 0, 1,
-1.75835, 1.062003, -0.7396501, 1, 0.1490196, 0, 1,
-1.752761, 0.7523073, -1.159023, 1, 0.1568628, 0, 1,
-1.744377, -1.342706, -2.927611, 1, 0.1607843, 0, 1,
-1.739971, -1.016385, -2.704577, 1, 0.1686275, 0, 1,
-1.734887, -0.719868, -1.963979, 1, 0.172549, 0, 1,
-1.731194, 2.63535, -1.371951, 1, 0.1803922, 0, 1,
-1.719327, -0.6174827, -3.078893, 1, 0.1843137, 0, 1,
-1.716531, -1.34224, -1.918611, 1, 0.1921569, 0, 1,
-1.706655, -1.076153, -3.714792, 1, 0.1960784, 0, 1,
-1.705461, -1.13977, -2.219431, 1, 0.2039216, 0, 1,
-1.670995, -0.8765756, -4.294281, 1, 0.2117647, 0, 1,
-1.664195, -0.9599459, -2.696415, 1, 0.2156863, 0, 1,
-1.66323, -0.03866959, -0.7673218, 1, 0.2235294, 0, 1,
-1.654882, -0.2346085, -1.817814, 1, 0.227451, 0, 1,
-1.653506, 0.3482445, -1.814286, 1, 0.2352941, 0, 1,
-1.645578, 1.773447, -0.3002022, 1, 0.2392157, 0, 1,
-1.619572, 0.4502728, -0.9593604, 1, 0.2470588, 0, 1,
-1.610304, 2.225346, -2.068298, 1, 0.2509804, 0, 1,
-1.598425, -2.323629, -2.009751, 1, 0.2588235, 0, 1,
-1.59521, -0.6412105, -2.551577, 1, 0.2627451, 0, 1,
-1.586457, 0.2752721, -2.958764, 1, 0.2705882, 0, 1,
-1.585416, 0.3942371, -3.659973, 1, 0.2745098, 0, 1,
-1.561787, -2.049799, -2.985931, 1, 0.282353, 0, 1,
-1.559315, -1.835725, -2.34861, 1, 0.2862745, 0, 1,
-1.543439, 0.07249001, -2.323357, 1, 0.2941177, 0, 1,
-1.534948, 1.113462, -0.6130271, 1, 0.3019608, 0, 1,
-1.532844, 0.3240628, -3.344523, 1, 0.3058824, 0, 1,
-1.52852, 1.180761, -1.06828, 1, 0.3137255, 0, 1,
-1.527199, 0.7093382, -2.087792, 1, 0.3176471, 0, 1,
-1.491748, 0.6795722, -1.47453, 1, 0.3254902, 0, 1,
-1.483157, 0.9518713, -1.062737, 1, 0.3294118, 0, 1,
-1.475368, -1.259701, -2.11501, 1, 0.3372549, 0, 1,
-1.471778, 0.3687374, -0.4718516, 1, 0.3411765, 0, 1,
-1.469101, 1.563867, -0.1883799, 1, 0.3490196, 0, 1,
-1.465679, 0.5647863, -1.629253, 1, 0.3529412, 0, 1,
-1.463597, -1.123502, -3.927835, 1, 0.3607843, 0, 1,
-1.45823, 0.9891393, -0.6155262, 1, 0.3647059, 0, 1,
-1.445113, -1.375359, -2.509621, 1, 0.372549, 0, 1,
-1.444983, 0.001802984, -0.1096166, 1, 0.3764706, 0, 1,
-1.443187, -0.4896383, -1.84653, 1, 0.3843137, 0, 1,
-1.435593, -1.082285, -2.872822, 1, 0.3882353, 0, 1,
-1.434332, -0.5900851, -2.37544, 1, 0.3960784, 0, 1,
-1.399159, 0.5709525, -0.4090878, 1, 0.4039216, 0, 1,
-1.398293, 0.3947254, -1.314031, 1, 0.4078431, 0, 1,
-1.394881, 1.458866, -1.623378, 1, 0.4156863, 0, 1,
-1.38744, 0.8450735, -1.417373, 1, 0.4196078, 0, 1,
-1.387131, 0.4176734, 0.5190645, 1, 0.427451, 0, 1,
-1.385392, -0.02398739, -0.2826879, 1, 0.4313726, 0, 1,
-1.370889, 0.5302877, -0.7305554, 1, 0.4392157, 0, 1,
-1.356382, -0.562054, -1.242121, 1, 0.4431373, 0, 1,
-1.35525, -0.6585596, -1.368838, 1, 0.4509804, 0, 1,
-1.352788, 0.06909747, -3.139148, 1, 0.454902, 0, 1,
-1.351649, -0.5043294, -2.349491, 1, 0.4627451, 0, 1,
-1.350109, 0.5520422, -1.412896, 1, 0.4666667, 0, 1,
-1.347342, -0.1839778, -2.382783, 1, 0.4745098, 0, 1,
-1.333745, -0.1804796, -0.0834351, 1, 0.4784314, 0, 1,
-1.323599, 0.08757226, -1.264409, 1, 0.4862745, 0, 1,
-1.321275, 0.5259588, -2.556563, 1, 0.4901961, 0, 1,
-1.320644, -1.886025, -2.859219, 1, 0.4980392, 0, 1,
-1.317525, 0.2208884, -1.578337, 1, 0.5058824, 0, 1,
-1.312643, 0.04626284, -1.930138, 1, 0.509804, 0, 1,
-1.304519, -1.002063, 0.09656166, 1, 0.5176471, 0, 1,
-1.29305, 0.2621234, -1.339399, 1, 0.5215687, 0, 1,
-1.291722, -0.04299515, -2.285152, 1, 0.5294118, 0, 1,
-1.286288, -0.04346197, -2.178688, 1, 0.5333334, 0, 1,
-1.279834, -1.228001, -1.250532, 1, 0.5411765, 0, 1,
-1.278675, 0.2858942, -2.578292, 1, 0.5450981, 0, 1,
-1.273473, 0.3372966, -3.198559, 1, 0.5529412, 0, 1,
-1.263025, -1.358684, -2.30668, 1, 0.5568628, 0, 1,
-1.254148, -1.440801, -3.895026, 1, 0.5647059, 0, 1,
-1.242808, 0.1533464, -2.397086, 1, 0.5686275, 0, 1,
-1.238249, -0.2924228, -1.442856, 1, 0.5764706, 0, 1,
-1.222902, -1.973903, -3.880033, 1, 0.5803922, 0, 1,
-1.222323, -1.249957, -1.714724, 1, 0.5882353, 0, 1,
-1.222196, 0.3227099, -2.223253, 1, 0.5921569, 0, 1,
-1.221192, -0.9050983, -2.801702, 1, 0.6, 0, 1,
-1.202501, -0.1029476, -0.4133795, 1, 0.6078432, 0, 1,
-1.18805, 0.6867973, -1.914703, 1, 0.6117647, 0, 1,
-1.186009, -2.108968, -3.236337, 1, 0.6196079, 0, 1,
-1.174641, 0.7524488, -1.479613, 1, 0.6235294, 0, 1,
-1.163902, 0.1980099, -0.2207185, 1, 0.6313726, 0, 1,
-1.158734, -0.1340322, 0.5234978, 1, 0.6352941, 0, 1,
-1.147183, 0.40075, -1.690071, 1, 0.6431373, 0, 1,
-1.143861, -1.89632, -3.275348, 1, 0.6470588, 0, 1,
-1.140399, -0.6471891, -4.366469, 1, 0.654902, 0, 1,
-1.134528, 0.5512268, -0.8055657, 1, 0.6588235, 0, 1,
-1.126349, 1.704384, -1.38822, 1, 0.6666667, 0, 1,
-1.12555, -0.1331568, -2.743142, 1, 0.6705883, 0, 1,
-1.12007, -0.7749017, -1.588133, 1, 0.6784314, 0, 1,
-1.119402, -0.4364251, -2.446136, 1, 0.682353, 0, 1,
-1.119254, 0.2789903, -1.178235, 1, 0.6901961, 0, 1,
-1.110481, 0.2573825, -0.3421544, 1, 0.6941177, 0, 1,
-1.099097, -0.9343393, -2.136181, 1, 0.7019608, 0, 1,
-1.09209, 0.02034261, -1.642856, 1, 0.7098039, 0, 1,
-1.090415, 0.8924474, 0.9738916, 1, 0.7137255, 0, 1,
-1.086902, -0.6567379, -3.43887, 1, 0.7215686, 0, 1,
-1.084628, 0.1180971, -1.675909, 1, 0.7254902, 0, 1,
-1.08434, 0.1581894, -2.995265, 1, 0.7333333, 0, 1,
-1.080779, 0.04274528, -1.829748, 1, 0.7372549, 0, 1,
-1.075083, -0.3053445, -3.074754, 1, 0.7450981, 0, 1,
-1.057611, -1.138009, -2.692384, 1, 0.7490196, 0, 1,
-1.055825, 1.131384, 0.348696, 1, 0.7568628, 0, 1,
-1.054311, -1.158258, -1.588732, 1, 0.7607843, 0, 1,
-1.053875, -1.684268, -1.653991, 1, 0.7686275, 0, 1,
-1.049483, 1.262705, -0.8102123, 1, 0.772549, 0, 1,
-1.046199, 0.9795672, 1.049249, 1, 0.7803922, 0, 1,
-1.04354, 0.09450252, -0.8862755, 1, 0.7843137, 0, 1,
-1.037908, 1.068629, -0.5281529, 1, 0.7921569, 0, 1,
-1.028803, 0.4316479, -0.6199661, 1, 0.7960784, 0, 1,
-1.026776, 0.4852567, -0.2308088, 1, 0.8039216, 0, 1,
-1.025884, -1.64147, -3.809536, 1, 0.8117647, 0, 1,
-1.023594, 1.130139, -0.1841256, 1, 0.8156863, 0, 1,
-1.021291, -0.02266398, -1.548906, 1, 0.8235294, 0, 1,
-1.020659, 0.03902669, -1.294231, 1, 0.827451, 0, 1,
-1.018828, -0.8063613, -0.8220917, 1, 0.8352941, 0, 1,
-1.017897, -0.4875915, -1.986877, 1, 0.8392157, 0, 1,
-1.017186, -1.264457, -1.587587, 1, 0.8470588, 0, 1,
-1.01667, 0.357384, -0.6589362, 1, 0.8509804, 0, 1,
-1.014166, 1.111369, -2.018818, 1, 0.8588235, 0, 1,
-1.013854, -1.192315, -2.400218, 1, 0.8627451, 0, 1,
-1.007708, 0.09384566, -3.082374, 1, 0.8705882, 0, 1,
-1.006078, 0.83603, -0.9539573, 1, 0.8745098, 0, 1,
-1.000954, 0.1459038, -1.208222, 1, 0.8823529, 0, 1,
-0.9975072, -0.6612859, -2.037176, 1, 0.8862745, 0, 1,
-0.9876716, 0.2017466, -3.685575, 1, 0.8941177, 0, 1,
-0.9873925, 1.407406, -0.3942654, 1, 0.8980392, 0, 1,
-0.9806884, 1.065324, -2.057047, 1, 0.9058824, 0, 1,
-0.9770826, 0.7597039, -3.215356, 1, 0.9137255, 0, 1,
-0.9695612, 0.9123892, -1.384031, 1, 0.9176471, 0, 1,
-0.9636139, -0.1325298, -2.15649, 1, 0.9254902, 0, 1,
-0.9602523, 0.450663, -3.577407, 1, 0.9294118, 0, 1,
-0.9573019, -1.237348, 0.3309247, 1, 0.9372549, 0, 1,
-0.9413874, -1.182729, -1.916391, 1, 0.9411765, 0, 1,
-0.9350451, -1.444899, -2.249097, 1, 0.9490196, 0, 1,
-0.9285218, 0.9253984, -2.703611, 1, 0.9529412, 0, 1,
-0.926727, -0.8762525, -1.437336, 1, 0.9607843, 0, 1,
-0.9260002, -0.07977121, -1.876241, 1, 0.9647059, 0, 1,
-0.9259938, -1.134649, -2.001331, 1, 0.972549, 0, 1,
-0.925369, 0.8443569, -1.109873, 1, 0.9764706, 0, 1,
-0.9059532, 0.6081862, -1.828463, 1, 0.9843137, 0, 1,
-0.9022241, 0.814509, 0.6967566, 1, 0.9882353, 0, 1,
-0.8978958, -0.3140097, -4.08917, 1, 0.9960784, 0, 1,
-0.8972515, -0.2802714, -0.7522497, 0.9960784, 1, 0, 1,
-0.8920971, 1.035618, -1.350619, 0.9921569, 1, 0, 1,
-0.8909573, -0.1594316, -0.71209, 0.9843137, 1, 0, 1,
-0.8850435, -0.3121342, -2.903302, 0.9803922, 1, 0, 1,
-0.8806251, -1.040078, -0.2356896, 0.972549, 1, 0, 1,
-0.8770419, 1.449615, 0.193434, 0.9686275, 1, 0, 1,
-0.8768935, -1.484213, -2.28644, 0.9607843, 1, 0, 1,
-0.8732769, -0.9829438, -2.767154, 0.9568627, 1, 0, 1,
-0.8717285, 2.261738, -0.04594574, 0.9490196, 1, 0, 1,
-0.851465, 0.08622691, -2.652516, 0.945098, 1, 0, 1,
-0.8460007, -0.4132979, -2.695013, 0.9372549, 1, 0, 1,
-0.8452519, -1.554655, -2.808227, 0.9333333, 1, 0, 1,
-0.8451025, -0.2803631, -1.23137, 0.9254902, 1, 0, 1,
-0.8422399, 1.983051, -1.440953, 0.9215686, 1, 0, 1,
-0.8397585, 0.08495174, -2.281708, 0.9137255, 1, 0, 1,
-0.8306639, 0.6646582, -1.079537, 0.9098039, 1, 0, 1,
-0.8286504, -0.8009524, -1.599589, 0.9019608, 1, 0, 1,
-0.8261878, 0.600413, -1.4052, 0.8941177, 1, 0, 1,
-0.8073336, -1.800776, -3.5289, 0.8901961, 1, 0, 1,
-0.8061248, -1.168926, -3.621748, 0.8823529, 1, 0, 1,
-0.8056846, 0.4352682, -1.37708, 0.8784314, 1, 0, 1,
-0.8011489, 0.1358556, -1.793715, 0.8705882, 1, 0, 1,
-0.7956505, 0.02456515, -1.891608, 0.8666667, 1, 0, 1,
-0.7943066, 0.4748865, -0.2668947, 0.8588235, 1, 0, 1,
-0.7862961, -2.07973, -3.662722, 0.854902, 1, 0, 1,
-0.7830839, 0.4271081, -1.055695, 0.8470588, 1, 0, 1,
-0.7821322, 0.8501153, 0.1167957, 0.8431373, 1, 0, 1,
-0.7791722, -2.168341, -2.519356, 0.8352941, 1, 0, 1,
-0.7780126, -0.5213574, -2.036463, 0.8313726, 1, 0, 1,
-0.7771614, 1.704571, -1.38395, 0.8235294, 1, 0, 1,
-0.7699389, -0.5190539, -2.742103, 0.8196079, 1, 0, 1,
-0.7688774, -0.6025247, -3.648729, 0.8117647, 1, 0, 1,
-0.7619509, 1.416809, -1.823478, 0.8078431, 1, 0, 1,
-0.7617458, -0.6049715, -2.371532, 0.8, 1, 0, 1,
-0.7547, -0.3311546, -0.9345104, 0.7921569, 1, 0, 1,
-0.7542859, -2.298072, -3.867955, 0.7882353, 1, 0, 1,
-0.7537865, 1.506478, 0.9550716, 0.7803922, 1, 0, 1,
-0.7508397, -1.070832, -1.566079, 0.7764706, 1, 0, 1,
-0.7445593, 0.1330238, 0.3013354, 0.7686275, 1, 0, 1,
-0.7388182, -1.311441, -2.466662, 0.7647059, 1, 0, 1,
-0.7367089, 0.7087929, -0.8379771, 0.7568628, 1, 0, 1,
-0.7310922, -1.933773, -1.552533, 0.7529412, 1, 0, 1,
-0.7298054, 1.400545, -1.894483, 0.7450981, 1, 0, 1,
-0.7287033, -0.5513536, -3.05803, 0.7411765, 1, 0, 1,
-0.7269002, -0.5120365, -0.8547527, 0.7333333, 1, 0, 1,
-0.7246063, -0.348657, -1.397557, 0.7294118, 1, 0, 1,
-0.7237412, 0.2429797, -2.795275, 0.7215686, 1, 0, 1,
-0.7228247, -0.779348, -2.764292, 0.7176471, 1, 0, 1,
-0.7168751, -0.4745031, -1.834098, 0.7098039, 1, 0, 1,
-0.7095954, -0.6030741, -3.77422, 0.7058824, 1, 0, 1,
-0.7079248, 0.7706863, 0.8048815, 0.6980392, 1, 0, 1,
-0.7062943, -1.164392, -1.851419, 0.6901961, 1, 0, 1,
-0.7028291, 1.183598, -2.259303, 0.6862745, 1, 0, 1,
-0.7017304, -0.2760212, -0.7477213, 0.6784314, 1, 0, 1,
-0.6937415, 0.7437069, 1.296953, 0.6745098, 1, 0, 1,
-0.6858504, -1.287455, -2.822417, 0.6666667, 1, 0, 1,
-0.6840556, -1.510953, -1.488673, 0.6627451, 1, 0, 1,
-0.6798854, -0.1561554, -1.81099, 0.654902, 1, 0, 1,
-0.6767383, 0.8402467, -1.714547, 0.6509804, 1, 0, 1,
-0.6765421, 0.1497553, -2.105932, 0.6431373, 1, 0, 1,
-0.6741341, 0.3214746, -0.3179091, 0.6392157, 1, 0, 1,
-0.6732734, -0.3074503, -1.572331, 0.6313726, 1, 0, 1,
-0.670293, -1.148645, -2.02038, 0.627451, 1, 0, 1,
-0.6697873, 0.05850099, -2.994818, 0.6196079, 1, 0, 1,
-0.6697008, -0.5953909, -1.427, 0.6156863, 1, 0, 1,
-0.667936, -1.356168, -2.690229, 0.6078432, 1, 0, 1,
-0.6604519, -2.656699, -2.448199, 0.6039216, 1, 0, 1,
-0.6579271, 1.468161, -0.8917679, 0.5960785, 1, 0, 1,
-0.6576151, -0.1953757, 0.212775, 0.5882353, 1, 0, 1,
-0.6537551, 0.4529085, -1.401816, 0.5843138, 1, 0, 1,
-0.6533983, 0.2355973, -2.256043, 0.5764706, 1, 0, 1,
-0.6513036, 0.3519002, 0.2187696, 0.572549, 1, 0, 1,
-0.6394545, 0.3508475, -1.391173, 0.5647059, 1, 0, 1,
-0.6388716, 0.1026153, -2.215934, 0.5607843, 1, 0, 1,
-0.6358782, -0.2703501, -2.443354, 0.5529412, 1, 0, 1,
-0.6357371, 0.9198892, -0.100883, 0.5490196, 1, 0, 1,
-0.6333449, 0.6513506, -0.3939546, 0.5411765, 1, 0, 1,
-0.6327977, -1.59461, -3.110092, 0.5372549, 1, 0, 1,
-0.6327272, 0.3796108, -0.09428456, 0.5294118, 1, 0, 1,
-0.6281, -0.6661115, -4.099079, 0.5254902, 1, 0, 1,
-0.6273301, -0.9963858, -0.2814527, 0.5176471, 1, 0, 1,
-0.6268961, 0.6386364, 0.07237131, 0.5137255, 1, 0, 1,
-0.6246642, -0.05414776, -2.692488, 0.5058824, 1, 0, 1,
-0.6217515, 0.1752633, 0.008255644, 0.5019608, 1, 0, 1,
-0.6207001, 1.216797, -0.2560195, 0.4941176, 1, 0, 1,
-0.6205853, -0.1348488, -1.307554, 0.4862745, 1, 0, 1,
-0.6192943, -0.7869037, -3.420738, 0.4823529, 1, 0, 1,
-0.6117055, 0.3507477, 0.207997, 0.4745098, 1, 0, 1,
-0.6064095, 1.597178, 0.009283729, 0.4705882, 1, 0, 1,
-0.5993978, -0.02385812, 0.3522876, 0.4627451, 1, 0, 1,
-0.599172, -0.964857, -2.324651, 0.4588235, 1, 0, 1,
-0.5949253, 2.042283, 0.9561918, 0.4509804, 1, 0, 1,
-0.5903748, -0.01727259, -2.611018, 0.4470588, 1, 0, 1,
-0.5749683, 0.4259913, -1.838533, 0.4392157, 1, 0, 1,
-0.5742159, 0.8736993, 0.2185301, 0.4352941, 1, 0, 1,
-0.5722677, -0.0690273, -0.2521996, 0.427451, 1, 0, 1,
-0.5713556, 0.2915849, -2.551416, 0.4235294, 1, 0, 1,
-0.5681514, -0.1192535, -2.08517, 0.4156863, 1, 0, 1,
-0.5657427, 1.134773, -0.2196184, 0.4117647, 1, 0, 1,
-0.5647086, 0.08044776, -2.895829, 0.4039216, 1, 0, 1,
-0.5614684, -0.04396132, -2.814102, 0.3960784, 1, 0, 1,
-0.5609902, 1.564679, -0.007361895, 0.3921569, 1, 0, 1,
-0.5593359, 0.4071916, -0.8616008, 0.3843137, 1, 0, 1,
-0.5571443, 0.07132795, -0.5461563, 0.3803922, 1, 0, 1,
-0.5541309, -0.7412891, -2.264013, 0.372549, 1, 0, 1,
-0.5515714, -0.1486889, -0.9868132, 0.3686275, 1, 0, 1,
-0.5443227, -0.2740383, -0.9933364, 0.3607843, 1, 0, 1,
-0.5431248, 1.749852, -0.9823861, 0.3568628, 1, 0, 1,
-0.5403771, -0.633413, -2.244991, 0.3490196, 1, 0, 1,
-0.5313185, -0.6189979, -1.801879, 0.345098, 1, 0, 1,
-0.5266061, -0.06794232, -1.491586, 0.3372549, 1, 0, 1,
-0.5256231, -0.5687507, -2.065647, 0.3333333, 1, 0, 1,
-0.5250952, -0.1302664, -2.035302, 0.3254902, 1, 0, 1,
-0.5111786, 0.7633113, -0.6399755, 0.3215686, 1, 0, 1,
-0.5055926, 1.58964, -0.1869266, 0.3137255, 1, 0, 1,
-0.5030369, 0.7694873, -0.643584, 0.3098039, 1, 0, 1,
-0.5009478, 0.7201514, 0.2398893, 0.3019608, 1, 0, 1,
-0.4992373, 0.8033174, 0.5563578, 0.2941177, 1, 0, 1,
-0.4977861, 0.1316058, -1.804059, 0.2901961, 1, 0, 1,
-0.4849249, -1.242004, -2.575466, 0.282353, 1, 0, 1,
-0.4794675, -0.1411356, -1.582884, 0.2784314, 1, 0, 1,
-0.478436, 0.7080957, 0.9388626, 0.2705882, 1, 0, 1,
-0.4769025, 0.04601179, -3.06096, 0.2666667, 1, 0, 1,
-0.469794, -1.020469, -1.308105, 0.2588235, 1, 0, 1,
-0.4688875, 0.1649501, -0.5597097, 0.254902, 1, 0, 1,
-0.4667397, -0.9400913, -1.631471, 0.2470588, 1, 0, 1,
-0.4653684, 0.7364947, -1.162588, 0.2431373, 1, 0, 1,
-0.462693, 1.506935, -2.129813, 0.2352941, 1, 0, 1,
-0.4624064, -1.118611, -3.861806, 0.2313726, 1, 0, 1,
-0.4606407, 0.04672404, -0.6771907, 0.2235294, 1, 0, 1,
-0.4562457, -0.3337973, -0.8748907, 0.2196078, 1, 0, 1,
-0.4561658, 1.105827, 0.9288502, 0.2117647, 1, 0, 1,
-0.4517643, 0.7341408, 0.129964, 0.2078431, 1, 0, 1,
-0.4504252, 0.02897002, -2.655485, 0.2, 1, 0, 1,
-0.4454203, -1.22074, -4.264002, 0.1921569, 1, 0, 1,
-0.4392779, -0.5655721, -1.272834, 0.1882353, 1, 0, 1,
-0.4377161, 0.8704718, -1.013334, 0.1803922, 1, 0, 1,
-0.4310547, -0.403249, -1.861319, 0.1764706, 1, 0, 1,
-0.4289315, -0.6510995, -1.944338, 0.1686275, 1, 0, 1,
-0.4279734, -1.434522, -4.523336, 0.1647059, 1, 0, 1,
-0.4267943, -2.118621, -2.053357, 0.1568628, 1, 0, 1,
-0.4260145, 0.9513734, 0.3211099, 0.1529412, 1, 0, 1,
-0.4244705, 1.881287, 2.484028, 0.145098, 1, 0, 1,
-0.4220152, 0.3515927, 0.1478706, 0.1411765, 1, 0, 1,
-0.4183283, 0.03892886, -1.599955, 0.1333333, 1, 0, 1,
-0.4175312, 1.579567, -0.722947, 0.1294118, 1, 0, 1,
-0.4168765, 1.124844, -1.176342, 0.1215686, 1, 0, 1,
-0.4009183, -0.03397226, -2.492124, 0.1176471, 1, 0, 1,
-0.3981512, -0.1340216, -1.859003, 0.1098039, 1, 0, 1,
-0.3967852, -0.356564, -4.505966, 0.1058824, 1, 0, 1,
-0.3961394, -0.5728062, -2.089273, 0.09803922, 1, 0, 1,
-0.390626, 0.6977668, -1.439174, 0.09019608, 1, 0, 1,
-0.3898471, -1.056157, -3.824375, 0.08627451, 1, 0, 1,
-0.3879687, 0.01914254, -2.705117, 0.07843138, 1, 0, 1,
-0.3879358, 0.8626777, -0.9367033, 0.07450981, 1, 0, 1,
-0.3839256, -0.0779888, -1.647441, 0.06666667, 1, 0, 1,
-0.3827905, 0.2299686, -0.04141349, 0.0627451, 1, 0, 1,
-0.3822075, 1.4114, -0.6816754, 0.05490196, 1, 0, 1,
-0.3813234, 1.752647, 0.217677, 0.05098039, 1, 0, 1,
-0.3804301, 1.922442, -0.1743095, 0.04313726, 1, 0, 1,
-0.380325, 0.3358448, -1.308957, 0.03921569, 1, 0, 1,
-0.3799226, -1.61582, -2.311574, 0.03137255, 1, 0, 1,
-0.3782401, -0.6068134, -1.077302, 0.02745098, 1, 0, 1,
-0.3781736, 0.3948181, -0.3167867, 0.01960784, 1, 0, 1,
-0.3704485, -0.4663252, -1.488307, 0.01568628, 1, 0, 1,
-0.3683185, 0.3164071, -1.460258, 0.007843138, 1, 0, 1,
-0.3659954, 2.212259, 1.59353, 0.003921569, 1, 0, 1,
-0.3589407, 0.8932968, 1.027668, 0, 1, 0.003921569, 1,
-0.351734, 0.9851649, 0.5230981, 0, 1, 0.01176471, 1,
-0.3438696, 0.5523753, -1.339692, 0, 1, 0.01568628, 1,
-0.3390015, 2.337662, 1.3464, 0, 1, 0.02352941, 1,
-0.3366547, 0.4725707, -2.877087, 0, 1, 0.02745098, 1,
-0.334572, 0.059839, -0.5070798, 0, 1, 0.03529412, 1,
-0.3279872, -0.5143864, -3.859302, 0, 1, 0.03921569, 1,
-0.3274887, -2.609059, -2.517603, 0, 1, 0.04705882, 1,
-0.3252748, 2.778516, -0.2889235, 0, 1, 0.05098039, 1,
-0.3236066, 0.004580195, -0.7453411, 0, 1, 0.05882353, 1,
-0.3213699, 0.202032, -0.2883415, 0, 1, 0.0627451, 1,
-0.3156932, -0.6726795, -1.71589, 0, 1, 0.07058824, 1,
-0.3116234, 0.08528771, -1.211441, 0, 1, 0.07450981, 1,
-0.3057781, -1.542796, -2.033972, 0, 1, 0.08235294, 1,
-0.3052344, -2.052105, -3.849256, 0, 1, 0.08627451, 1,
-0.3047491, 0.1492563, -1.33128, 0, 1, 0.09411765, 1,
-0.3045509, 0.587493, -0.4456972, 0, 1, 0.1019608, 1,
-0.3030555, -1.964309, -3.187817, 0, 1, 0.1058824, 1,
-0.2985185, 0.3552822, 0.0688371, 0, 1, 0.1137255, 1,
-0.2977729, -1.638468, -3.487974, 0, 1, 0.1176471, 1,
-0.2973686, 0.3374296, -0.2064934, 0, 1, 0.1254902, 1,
-0.2961544, -0.5043511, -3.009954, 0, 1, 0.1294118, 1,
-0.2938451, -1.153487, -3.968428, 0, 1, 0.1372549, 1,
-0.2927777, 0.2938108, -0.6732196, 0, 1, 0.1411765, 1,
-0.2919884, 0.05059567, -0.2613873, 0, 1, 0.1490196, 1,
-0.2865847, 0.8523945, -1.645604, 0, 1, 0.1529412, 1,
-0.2863198, 0.6077313, 0.5758133, 0, 1, 0.1607843, 1,
-0.2804136, -0.7294319, -3.075008, 0, 1, 0.1647059, 1,
-0.2796302, -0.3641534, -3.788368, 0, 1, 0.172549, 1,
-0.2770886, 1.043363, -1.242679, 0, 1, 0.1764706, 1,
-0.2764733, 0.153902, -0.4835788, 0, 1, 0.1843137, 1,
-0.2755217, -0.207216, -3.26266, 0, 1, 0.1882353, 1,
-0.2755111, 2.714644, -0.2568376, 0, 1, 0.1960784, 1,
-0.273517, -0.01280595, -1.344118, 0, 1, 0.2039216, 1,
-0.2701587, 0.3768837, -0.53255, 0, 1, 0.2078431, 1,
-0.2649581, 0.2625573, -0.2661219, 0, 1, 0.2156863, 1,
-0.2553546, 0.5775946, -1.159297, 0, 1, 0.2196078, 1,
-0.2528234, -0.5625328, -2.744953, 0, 1, 0.227451, 1,
-0.2515115, -0.924538, -3.272445, 0, 1, 0.2313726, 1,
-0.245368, 0.6651424, 0.1443464, 0, 1, 0.2392157, 1,
-0.2384042, 0.8928062, 0.8768178, 0, 1, 0.2431373, 1,
-0.2373705, 0.6384597, -1.93664, 0, 1, 0.2509804, 1,
-0.2330491, 0.6349767, -0.4382071, 0, 1, 0.254902, 1,
-0.231265, 1.529333, 0.658649, 0, 1, 0.2627451, 1,
-0.2311257, -0.39603, -1.410356, 0, 1, 0.2666667, 1,
-0.2310052, 0.471808, -1.040072, 0, 1, 0.2745098, 1,
-0.2265608, 0.02112695, -0.9647677, 0, 1, 0.2784314, 1,
-0.2234056, 0.4214764, -1.507305, 0, 1, 0.2862745, 1,
-0.2228335, -1.11474, -3.491058, 0, 1, 0.2901961, 1,
-0.2176131, 0.9838854, -1.821022, 0, 1, 0.2980392, 1,
-0.214348, -0.2323107, -3.821055, 0, 1, 0.3058824, 1,
-0.2143214, 0.1573955, 0.858286, 0, 1, 0.3098039, 1,
-0.2135934, 1.394819, 0.2966771, 0, 1, 0.3176471, 1,
-0.2115897, -0.09794596, -2.275553, 0, 1, 0.3215686, 1,
-0.2067206, -0.8387625, -2.890256, 0, 1, 0.3294118, 1,
-0.2038199, 0.34372, -1.329387, 0, 1, 0.3333333, 1,
-0.1954842, -0.2441175, -2.236359, 0, 1, 0.3411765, 1,
-0.1952566, -0.1352892, -0.7257426, 0, 1, 0.345098, 1,
-0.1905982, 0.6626709, 0.3828825, 0, 1, 0.3529412, 1,
-0.1879622, 0.2961076, -0.1958421, 0, 1, 0.3568628, 1,
-0.1848855, 2.302253, 0.6897711, 0, 1, 0.3647059, 1,
-0.1803966, -1.285142, -2.434396, 0, 1, 0.3686275, 1,
-0.1747761, 1.058733, 0.03972535, 0, 1, 0.3764706, 1,
-0.1690785, -1.459572, -4.110383, 0, 1, 0.3803922, 1,
-0.1631971, -1.425431, -2.557676, 0, 1, 0.3882353, 1,
-0.1594021, -1.017976, -2.375059, 0, 1, 0.3921569, 1,
-0.1481731, -0.8505121, -3.894953, 0, 1, 0.4, 1,
-0.1440631, 0.132824, -0.4023328, 0, 1, 0.4078431, 1,
-0.1423858, 0.552375, 0.1092884, 0, 1, 0.4117647, 1,
-0.1406483, -0.4588703, -2.409052, 0, 1, 0.4196078, 1,
-0.1344864, 1.819678, 0.7037539, 0, 1, 0.4235294, 1,
-0.1339367, -1.854026, -4.784596, 0, 1, 0.4313726, 1,
-0.1318737, -0.6469575, -3.678376, 0, 1, 0.4352941, 1,
-0.1277536, 0.1498507, 0.3196369, 0, 1, 0.4431373, 1,
-0.1264312, 0.2691071, -1.001629, 0, 1, 0.4470588, 1,
-0.125897, -0.5648285, -1.028659, 0, 1, 0.454902, 1,
-0.125406, 0.6119295, -0.7048382, 0, 1, 0.4588235, 1,
-0.1244686, 0.04289161, -0.1774987, 0, 1, 0.4666667, 1,
-0.1226448, 0.6896822, 0.1117176, 0, 1, 0.4705882, 1,
-0.1198335, -0.7736726, -3.682755, 0, 1, 0.4784314, 1,
-0.1197252, 0.9531282, -1.641296, 0, 1, 0.4823529, 1,
-0.1139323, 0.8869754, 1.118442, 0, 1, 0.4901961, 1,
-0.1120701, 0.6180496, 1.814922, 0, 1, 0.4941176, 1,
-0.1119759, 0.89245, -0.8538539, 0, 1, 0.5019608, 1,
-0.10728, 1.168105, 0.2087815, 0, 1, 0.509804, 1,
-0.1069215, 0.1311913, -0.6200038, 0, 1, 0.5137255, 1,
-0.1067478, 0.2060923, -0.4288845, 0, 1, 0.5215687, 1,
-0.1062463, -0.3322057, -1.876016, 0, 1, 0.5254902, 1,
-0.1057033, 1.017215, -0.07169618, 0, 1, 0.5333334, 1,
-0.1056518, 0.5808553, -1.180568, 0, 1, 0.5372549, 1,
-0.105215, 0.5268135, -0.07830112, 0, 1, 0.5450981, 1,
-0.1040579, -0.8965786, -1.918191, 0, 1, 0.5490196, 1,
-0.1036505, -1.479345, -1.754177, 0, 1, 0.5568628, 1,
-0.1026922, 1.144799, -0.385338, 0, 1, 0.5607843, 1,
-0.1021778, -0.07496355, -1.683447, 0, 1, 0.5686275, 1,
-0.1020135, -0.5769508, -1.090952, 0, 1, 0.572549, 1,
-0.09881375, -0.5343963, -5.203006, 0, 1, 0.5803922, 1,
-0.09650982, -0.2257251, -3.287582, 0, 1, 0.5843138, 1,
-0.09600415, -0.2854298, -2.412125, 0, 1, 0.5921569, 1,
-0.09151469, -0.4086772, -3.182733, 0, 1, 0.5960785, 1,
-0.08901105, 0.3590943, -0.8638033, 0, 1, 0.6039216, 1,
-0.07289275, -0.410384, -2.817062, 0, 1, 0.6117647, 1,
-0.06673157, -0.5908225, -4.117957, 0, 1, 0.6156863, 1,
-0.06576429, 0.4439989, -1.033742, 0, 1, 0.6235294, 1,
-0.065249, 1.153367, 0.8644537, 0, 1, 0.627451, 1,
-0.06524676, -0.177, -2.23612, 0, 1, 0.6352941, 1,
-0.06465679, 0.4185599, 0.5366865, 0, 1, 0.6392157, 1,
-0.06190178, -0.3088651, -2.11599, 0, 1, 0.6470588, 1,
-0.0615622, -0.8032867, -3.159131, 0, 1, 0.6509804, 1,
-0.06052443, -0.5918415, -2.105318, 0, 1, 0.6588235, 1,
-0.05925489, 0.4785871, -0.9216241, 0, 1, 0.6627451, 1,
-0.05789644, 0.5551738, -0.8562405, 0, 1, 0.6705883, 1,
-0.05585102, -1.143178, -2.805782, 0, 1, 0.6745098, 1,
-0.05584111, 1.234135, -1.347876, 0, 1, 0.682353, 1,
-0.05580443, -0.9922696, -4.361092, 0, 1, 0.6862745, 1,
-0.05577838, 0.965287, -0.3350492, 0, 1, 0.6941177, 1,
-0.05253022, 0.4631864, 1.686372, 0, 1, 0.7019608, 1,
-0.05244072, -0.08158953, -2.648481, 0, 1, 0.7058824, 1,
-0.05137487, -1.557654, -3.5395, 0, 1, 0.7137255, 1,
-0.04977721, 1.714558, 0.3971071, 0, 1, 0.7176471, 1,
-0.04977393, 0.5605054, 0.005581082, 0, 1, 0.7254902, 1,
-0.04753834, 0.7985981, -1.121379, 0, 1, 0.7294118, 1,
-0.0457043, -1.204976, -4.298429, 0, 1, 0.7372549, 1,
-0.04461318, 0.7956737, -0.7494903, 0, 1, 0.7411765, 1,
-0.04227444, -0.9414375, -2.598757, 0, 1, 0.7490196, 1,
-0.03698066, 0.06478187, -0.6550309, 0, 1, 0.7529412, 1,
-0.03697634, 0.2221248, -0.08022662, 0, 1, 0.7607843, 1,
-0.03446306, -0.4437798, -2.351814, 0, 1, 0.7647059, 1,
-0.03233642, 0.4472239, -1.197007, 0, 1, 0.772549, 1,
-0.03188431, 1.038524, -2.519497, 0, 1, 0.7764706, 1,
-0.03176269, -0.9057934, -5.030913, 0, 1, 0.7843137, 1,
-0.03059456, -0.1771256, -2.762357, 0, 1, 0.7882353, 1,
-0.02751039, -1.469929, -3.568867, 0, 1, 0.7960784, 1,
-0.02408269, 0.6865934, 1.429691, 0, 1, 0.8039216, 1,
-0.02328258, 0.046785, -1.152635, 0, 1, 0.8078431, 1,
-0.02282564, 0.3312392, 0.1296383, 0, 1, 0.8156863, 1,
-0.01983561, -0.433326, -4.422318, 0, 1, 0.8196079, 1,
-0.01754376, 0.7786433, 2.194293, 0, 1, 0.827451, 1,
-0.01664994, -0.08925613, -2.512681, 0, 1, 0.8313726, 1,
-0.01611804, 1.356774, 0.7287545, 0, 1, 0.8392157, 1,
-0.01140044, 0.2594951, -0.4797566, 0, 1, 0.8431373, 1,
-0.008101803, -0.6916708, -2.8319, 0, 1, 0.8509804, 1,
0.001310279, 2.197651, -0.1214427, 0, 1, 0.854902, 1,
0.004658287, -2.029133, 2.87059, 0, 1, 0.8627451, 1,
0.004702445, 0.5919896, -0.47759, 0, 1, 0.8666667, 1,
0.00640334, -0.952759, 2.177456, 0, 1, 0.8745098, 1,
0.008698902, 0.07976206, 0.8099822, 0, 1, 0.8784314, 1,
0.009118963, 0.174089, -0.05602817, 0, 1, 0.8862745, 1,
0.01237971, -0.9434193, 5.260681, 0, 1, 0.8901961, 1,
0.01644637, -0.8414968, 3.645745, 0, 1, 0.8980392, 1,
0.01722517, 0.9120837, 0.3241209, 0, 1, 0.9058824, 1,
0.01753222, -0.02279316, 1.862084, 0, 1, 0.9098039, 1,
0.01958011, 0.4188794, -1.270968, 0, 1, 0.9176471, 1,
0.02054775, 0.1075663, -0.3959362, 0, 1, 0.9215686, 1,
0.02350176, 0.1145022, 0.8263848, 0, 1, 0.9294118, 1,
0.02736847, -0.6460425, 3.525446, 0, 1, 0.9333333, 1,
0.02763427, 2.014553, 0.5086078, 0, 1, 0.9411765, 1,
0.02771181, -0.2324731, 2.36709, 0, 1, 0.945098, 1,
0.0311807, -0.7178749, 3.968804, 0, 1, 0.9529412, 1,
0.03264475, 0.3769345, -1.314699, 0, 1, 0.9568627, 1,
0.03426875, -0.3360573, 4.023387, 0, 1, 0.9647059, 1,
0.03525129, -0.2329117, 3.56356, 0, 1, 0.9686275, 1,
0.03598538, -1.462832, 2.725557, 0, 1, 0.9764706, 1,
0.0404373, -0.46796, 3.306243, 0, 1, 0.9803922, 1,
0.04370914, -1.166849, 2.880193, 0, 1, 0.9882353, 1,
0.04540223, -0.9992242, 3.769616, 0, 1, 0.9921569, 1,
0.04590027, -0.4158931, 3.433042, 0, 1, 1, 1,
0.04736008, -0.3314235, 4.053127, 0, 0.9921569, 1, 1,
0.04754256, -0.03188883, 2.567322, 0, 0.9882353, 1, 1,
0.05004231, -1.464348, 2.742064, 0, 0.9803922, 1, 1,
0.05071842, 0.4274921, 0.01715536, 0, 0.9764706, 1, 1,
0.05213613, 0.05839632, 1.025537, 0, 0.9686275, 1, 1,
0.05716246, 1.251326, -0.8536279, 0, 0.9647059, 1, 1,
0.05742927, 1.169615, 0.4270546, 0, 0.9568627, 1, 1,
0.05765491, 0.4131536, -1.259345, 0, 0.9529412, 1, 1,
0.05966247, 0.569734, -0.541288, 0, 0.945098, 1, 1,
0.06451046, -0.1700617, 1.64071, 0, 0.9411765, 1, 1,
0.06734984, 1.2622, -1.095457, 0, 0.9333333, 1, 1,
0.06979489, -1.201248, 3.366936, 0, 0.9294118, 1, 1,
0.07037673, -0.9818591, 1.481249, 0, 0.9215686, 1, 1,
0.0714509, 1.146757, -0.514097, 0, 0.9176471, 1, 1,
0.07593449, 0.7522286, -0.5341951, 0, 0.9098039, 1, 1,
0.07917576, -0.05104926, 3.384665, 0, 0.9058824, 1, 1,
0.08482076, 0.6878933, -1.467883, 0, 0.8980392, 1, 1,
0.08488864, 0.5974112, -0.3112021, 0, 0.8901961, 1, 1,
0.09019976, -0.2415598, 2.574955, 0, 0.8862745, 1, 1,
0.09103871, 0.1011673, 2.851321, 0, 0.8784314, 1, 1,
0.09273008, 0.5525396, 0.833735, 0, 0.8745098, 1, 1,
0.09623304, 0.5901362, 0.4723896, 0, 0.8666667, 1, 1,
0.09686954, -2.461234, 3.796878, 0, 0.8627451, 1, 1,
0.09853191, -2.135501, 4.188359, 0, 0.854902, 1, 1,
0.103677, 1.58629, 0.5341516, 0, 0.8509804, 1, 1,
0.1067578, -0.7344745, 3.791488, 0, 0.8431373, 1, 1,
0.1095261, -1.352342, 3.948818, 0, 0.8392157, 1, 1,
0.1105968, 1.492366, 0.5393173, 0, 0.8313726, 1, 1,
0.116863, -0.3761166, 3.092602, 0, 0.827451, 1, 1,
0.1183168, -1.409893, 3.420132, 0, 0.8196079, 1, 1,
0.121213, 0.9547443, 0.3330374, 0, 0.8156863, 1, 1,
0.1245718, -0.5311651, 5.173579, 0, 0.8078431, 1, 1,
0.1280294, -1.010214, 4.70153, 0, 0.8039216, 1, 1,
0.1282443, 1.566624, -1.255477, 0, 0.7960784, 1, 1,
0.1286876, -0.474139, 2.202566, 0, 0.7882353, 1, 1,
0.1351874, 0.4637111, 0.9216211, 0, 0.7843137, 1, 1,
0.1359828, 2.481131, -1.08785, 0, 0.7764706, 1, 1,
0.1389665, 0.7905367, 0.2404937, 0, 0.772549, 1, 1,
0.1418306, -0.44698, 0.9510874, 0, 0.7647059, 1, 1,
0.1470653, 1.749992, 0.7298945, 0, 0.7607843, 1, 1,
0.1484472, 0.02943888, 1.701662, 0, 0.7529412, 1, 1,
0.1491386, -0.2923429, 3.765549, 0, 0.7490196, 1, 1,
0.1612824, -0.9490767, 1.700512, 0, 0.7411765, 1, 1,
0.1619591, -0.06497071, 1.740953, 0, 0.7372549, 1, 1,
0.1654261, -1.895298, 3.217847, 0, 0.7294118, 1, 1,
0.1664011, 0.7532395, -0.4569304, 0, 0.7254902, 1, 1,
0.1671306, 0.07016587, -0.4936332, 0, 0.7176471, 1, 1,
0.1690716, 0.1643464, 1.20468, 0, 0.7137255, 1, 1,
0.1693615, 1.733338, 0.9000693, 0, 0.7058824, 1, 1,
0.1713843, 0.1190616, 0.5232518, 0, 0.6980392, 1, 1,
0.1755778, -0.1820441, 1.171677, 0, 0.6941177, 1, 1,
0.1761734, -0.5053391, 2.372509, 0, 0.6862745, 1, 1,
0.1779085, -0.7777672, 5.265085, 0, 0.682353, 1, 1,
0.1865976, 1.164734, -0.4123989, 0, 0.6745098, 1, 1,
0.1882298, -1.305343, 3.154196, 0, 0.6705883, 1, 1,
0.192477, -1.258045, 3.139899, 0, 0.6627451, 1, 1,
0.1973654, -0.02424796, 1.427069, 0, 0.6588235, 1, 1,
0.2047961, 0.1701725, 1.50578, 0, 0.6509804, 1, 1,
0.205895, 1.730372, -1.455851, 0, 0.6470588, 1, 1,
0.2133231, 0.2112504, 0.4599761, 0, 0.6392157, 1, 1,
0.2135718, 0.5501262, -0.5816789, 0, 0.6352941, 1, 1,
0.2137495, -0.1916666, 1.501121, 0, 0.627451, 1, 1,
0.2187875, -1.954539, 3.97052, 0, 0.6235294, 1, 1,
0.2208735, 0.9395546, 1.836738, 0, 0.6156863, 1, 1,
0.2244585, -0.6502066, 3.478113, 0, 0.6117647, 1, 1,
0.2264576, 0.5835005, -0.4540509, 0, 0.6039216, 1, 1,
0.2375919, -0.216104, 2.373497, 0, 0.5960785, 1, 1,
0.2404576, -0.2293969, 3.511589, 0, 0.5921569, 1, 1,
0.250978, -0.6464682, 2.652767, 0, 0.5843138, 1, 1,
0.2516184, 0.2782097, 1.494753, 0, 0.5803922, 1, 1,
0.2517919, 0.4341113, -1.565125, 0, 0.572549, 1, 1,
0.2519074, 1.416809, 1.355663, 0, 0.5686275, 1, 1,
0.2561247, -1.004263, 3.937556, 0, 0.5607843, 1, 1,
0.2569293, -0.1259264, 2.080934, 0, 0.5568628, 1, 1,
0.259596, 3.005054, 0.3603535, 0, 0.5490196, 1, 1,
0.2644424, -0.9122257, 2.314873, 0, 0.5450981, 1, 1,
0.2762555, 0.7000071, 0.8335134, 0, 0.5372549, 1, 1,
0.2781878, 0.8103572, 2.514013, 0, 0.5333334, 1, 1,
0.2808246, 0.3488882, 0.3951707, 0, 0.5254902, 1, 1,
0.2823417, 1.461707, -0.7815284, 0, 0.5215687, 1, 1,
0.2829489, 0.8086167, -0.4758235, 0, 0.5137255, 1, 1,
0.2837976, 0.1632005, 1.639336, 0, 0.509804, 1, 1,
0.2842329, 0.3740564, -0.3138196, 0, 0.5019608, 1, 1,
0.2852342, 0.7493269, 0.09993215, 0, 0.4941176, 1, 1,
0.2881748, 0.2899187, 0.5603899, 0, 0.4901961, 1, 1,
0.2902319, 0.4258768, 2.8455, 0, 0.4823529, 1, 1,
0.2911887, 0.5282932, -0.1901403, 0, 0.4784314, 1, 1,
0.2913415, -1.486348, 3.386026, 0, 0.4705882, 1, 1,
0.2921351, 1.179723, 0.8633971, 0, 0.4666667, 1, 1,
0.2959671, 0.3354184, 1.676389, 0, 0.4588235, 1, 1,
0.2962014, -0.1310077, 3.77367, 0, 0.454902, 1, 1,
0.296279, -0.6032696, 4.089438, 0, 0.4470588, 1, 1,
0.2999761, 0.4708864, -0.7204822, 0, 0.4431373, 1, 1,
0.3000298, -0.1336609, 2.073083, 0, 0.4352941, 1, 1,
0.3022014, -0.3376023, 1.32565, 0, 0.4313726, 1, 1,
0.3023517, 0.9594565, 1.363213, 0, 0.4235294, 1, 1,
0.3057549, -0.4803734, 0.7260113, 0, 0.4196078, 1, 1,
0.3095916, -0.3478769, 2.379943, 0, 0.4117647, 1, 1,
0.3177738, -0.7956475, 3.906882, 0, 0.4078431, 1, 1,
0.3240636, -0.6115277, 3.667909, 0, 0.4, 1, 1,
0.324761, 0.3885539, 2.077887, 0, 0.3921569, 1, 1,
0.3304964, 0.47767, 1.666226, 0, 0.3882353, 1, 1,
0.3310188, -1.194756, 3.355273, 0, 0.3803922, 1, 1,
0.3325355, 0.3611499, 1.984936, 0, 0.3764706, 1, 1,
0.3339881, -1.0135, 4.073751, 0, 0.3686275, 1, 1,
0.3383337, -0.5246384, 2.201775, 0, 0.3647059, 1, 1,
0.339413, 0.2846319, 0.3117104, 0, 0.3568628, 1, 1,
0.3415708, -0.1496277, 1.585025, 0, 0.3529412, 1, 1,
0.3453209, 0.6570568, 0.6862816, 0, 0.345098, 1, 1,
0.3468357, -1.342734, 1.248921, 0, 0.3411765, 1, 1,
0.3471198, -1.023211, 3.581812, 0, 0.3333333, 1, 1,
0.3474562, -1.93765, 4.431038, 0, 0.3294118, 1, 1,
0.347758, -0.5813154, 2.737848, 0, 0.3215686, 1, 1,
0.3495987, -3.33525, 3.183608, 0, 0.3176471, 1, 1,
0.3511082, 1.060343, -0.979594, 0, 0.3098039, 1, 1,
0.3515568, -0.1305571, 1.509187, 0, 0.3058824, 1, 1,
0.3544734, 0.6360573, 0.5289891, 0, 0.2980392, 1, 1,
0.3606553, -1.255075, 2.558739, 0, 0.2901961, 1, 1,
0.3611369, 0.4275365, 1.205268, 0, 0.2862745, 1, 1,
0.367651, -1.458003, 3.607505, 0, 0.2784314, 1, 1,
0.3697929, 0.4392438, -0.05705591, 0, 0.2745098, 1, 1,
0.3807037, 0.1071059, 1.066186, 0, 0.2666667, 1, 1,
0.3816364, -1.508954, 1.627153, 0, 0.2627451, 1, 1,
0.38876, 0.683353, -0.7566896, 0, 0.254902, 1, 1,
0.3901522, 0.9064839, 1.721895, 0, 0.2509804, 1, 1,
0.3904791, 0.9087438, 0.6052954, 0, 0.2431373, 1, 1,
0.3965504, 0.4528944, 2.0115, 0, 0.2392157, 1, 1,
0.39668, -0.1243507, 3.266252, 0, 0.2313726, 1, 1,
0.3976655, 0.9751792, 2.311826, 0, 0.227451, 1, 1,
0.398014, 0.4821921, 0.6186722, 0, 0.2196078, 1, 1,
0.3980522, 1.147355, 1.033036, 0, 0.2156863, 1, 1,
0.3987625, 0.8322358, 0.2499349, 0, 0.2078431, 1, 1,
0.399585, 0.4812647, -1.069061, 0, 0.2039216, 1, 1,
0.4057375, -0.9628673, 3.244099, 0, 0.1960784, 1, 1,
0.4075836, 1.678035, 2.090091, 0, 0.1882353, 1, 1,
0.4078865, 0.4089051, -1.476248, 0, 0.1843137, 1, 1,
0.4103035, 1.418616, -0.01254919, 0, 0.1764706, 1, 1,
0.4108002, 0.9525648, 0.9272778, 0, 0.172549, 1, 1,
0.4116537, 0.2096728, -0.3162885, 0, 0.1647059, 1, 1,
0.4157789, 0.4328164, 0.08721252, 0, 0.1607843, 1, 1,
0.4168477, 0.3356395, -0.02794472, 0, 0.1529412, 1, 1,
0.4176153, 2.648221, 0.1711471, 0, 0.1490196, 1, 1,
0.4184959, 1.148103, 0.271968, 0, 0.1411765, 1, 1,
0.4216273, -0.8443605, 2.294961, 0, 0.1372549, 1, 1,
0.4246483, 1.550128, 1.184067, 0, 0.1294118, 1, 1,
0.4250813, 0.7090803, -0.5675707, 0, 0.1254902, 1, 1,
0.430303, 1.193814, 0.4862048, 0, 0.1176471, 1, 1,
0.4349223, -1.466336, 2.701538, 0, 0.1137255, 1, 1,
0.4360342, -2.412281, 2.329261, 0, 0.1058824, 1, 1,
0.4416653, 1.998119, 2.296088, 0, 0.09803922, 1, 1,
0.4462135, 0.9408596, 0.7013134, 0, 0.09411765, 1, 1,
0.4495656, -0.5556044, 1.841401, 0, 0.08627451, 1, 1,
0.4534461, 0.8238111, -0.07023705, 0, 0.08235294, 1, 1,
0.4579489, 1.320281, 0.02236955, 0, 0.07450981, 1, 1,
0.4604066, -0.5959762, 2.448398, 0, 0.07058824, 1, 1,
0.4609214, -0.03256853, 1.30711, 0, 0.0627451, 1, 1,
0.4632312, -0.3217251, 2.16351, 0, 0.05882353, 1, 1,
0.4643741, 1.479961, 1.121124, 0, 0.05098039, 1, 1,
0.4643859, 0.5054529, 0.02991513, 0, 0.04705882, 1, 1,
0.4658172, 0.1868059, 1.548974, 0, 0.03921569, 1, 1,
0.4687425, -0.217829, 0.8859806, 0, 0.03529412, 1, 1,
0.4722945, 0.4136937, 1.521796, 0, 0.02745098, 1, 1,
0.4742158, -0.07925346, 1.808954, 0, 0.02352941, 1, 1,
0.4809389, -1.098642, 1.23683, 0, 0.01568628, 1, 1,
0.4863352, 0.8087401, 0.2513717, 0, 0.01176471, 1, 1,
0.4863554, 0.9215242, 0.9057453, 0, 0.003921569, 1, 1,
0.4925305, -0.4561272, 3.911294, 0.003921569, 0, 1, 1,
0.4936161, 1.253141, 0.5880435, 0.007843138, 0, 1, 1,
0.4939925, -1.399943, 1.95655, 0.01568628, 0, 1, 1,
0.502873, -0.1012386, 1.97311, 0.01960784, 0, 1, 1,
0.5116975, -0.1159279, 1.020837, 0.02745098, 0, 1, 1,
0.5153102, 0.05675441, 1.635496, 0.03137255, 0, 1, 1,
0.516938, -0.6791174, 3.33147, 0.03921569, 0, 1, 1,
0.517051, -1.926192, 4.176406, 0.04313726, 0, 1, 1,
0.5215605, -1.026846, 1.472476, 0.05098039, 0, 1, 1,
0.5221106, -1.782368, 4.461468, 0.05490196, 0, 1, 1,
0.523303, -0.3650593, 2.077205, 0.0627451, 0, 1, 1,
0.5233215, -0.4748212, 2.830288, 0.06666667, 0, 1, 1,
0.523999, 1.227225, -0.243929, 0.07450981, 0, 1, 1,
0.5273618, 0.6532025, 1.700533, 0.07843138, 0, 1, 1,
0.5299237, -1.118197, 2.743928, 0.08627451, 0, 1, 1,
0.5307714, -0.1925496, 1.397996, 0.09019608, 0, 1, 1,
0.5368321, -0.6441679, 1.501396, 0.09803922, 0, 1, 1,
0.5408824, 0.3332921, 1.730277, 0.1058824, 0, 1, 1,
0.5440139, 0.1284474, 0.9535558, 0.1098039, 0, 1, 1,
0.5474741, -2.143015, 3.875388, 0.1176471, 0, 1, 1,
0.5491009, 0.5800265, 1.070851, 0.1215686, 0, 1, 1,
0.5529831, -0.9248556, 1.296214, 0.1294118, 0, 1, 1,
0.553035, 0.4486203, 1.003361, 0.1333333, 0, 1, 1,
0.5566134, 1.332778, 0.1971014, 0.1411765, 0, 1, 1,
0.5585281, 1.64634, 0.3220111, 0.145098, 0, 1, 1,
0.5680408, 0.646666, -0.7964158, 0.1529412, 0, 1, 1,
0.5761299, -1.035297, 3.620596, 0.1568628, 0, 1, 1,
0.5763743, 2.11649, 1.208529, 0.1647059, 0, 1, 1,
0.5765109, 1.382927, 0.491423, 0.1686275, 0, 1, 1,
0.5793684, -0.1535649, 3.93892, 0.1764706, 0, 1, 1,
0.5827935, 1.042061, -0.8554856, 0.1803922, 0, 1, 1,
0.584893, -0.3323562, 1.586315, 0.1882353, 0, 1, 1,
0.5861076, 0.6953239, -0.2820866, 0.1921569, 0, 1, 1,
0.588482, 0.6711605, 1.302661, 0.2, 0, 1, 1,
0.598179, 3.029284, -0.4428621, 0.2078431, 0, 1, 1,
0.5996869, 1.552878, 0.421811, 0.2117647, 0, 1, 1,
0.6034274, 1.648041, 0.6601402, 0.2196078, 0, 1, 1,
0.6048488, 0.6228032, -0.263607, 0.2235294, 0, 1, 1,
0.6051807, -0.2616189, 1.018526, 0.2313726, 0, 1, 1,
0.6068403, -0.6978045, 3.349338, 0.2352941, 0, 1, 1,
0.6077085, 0.1254581, 2.276137, 0.2431373, 0, 1, 1,
0.6081832, 0.7190397, 0.3053106, 0.2470588, 0, 1, 1,
0.609707, 1.323931, -0.4050813, 0.254902, 0, 1, 1,
0.6108133, 0.5611642, 0.07880536, 0.2588235, 0, 1, 1,
0.6146033, 0.113815, 1.937467, 0.2666667, 0, 1, 1,
0.6151005, -0.7534842, 4.161864, 0.2705882, 0, 1, 1,
0.618363, 0.165617, 2.217691, 0.2784314, 0, 1, 1,
0.6196973, -1.49814, 4.421831, 0.282353, 0, 1, 1,
0.6205521, 0.5084674, 1.697012, 0.2901961, 0, 1, 1,
0.6209174, -0.9122484, 2.942369, 0.2941177, 0, 1, 1,
0.6240774, 0.8968877, -0.7674131, 0.3019608, 0, 1, 1,
0.6259974, -0.1752701, 1.66219, 0.3098039, 0, 1, 1,
0.6269796, 0.9628907, 0.2487751, 0.3137255, 0, 1, 1,
0.6278776, 0.4713279, 1.092882, 0.3215686, 0, 1, 1,
0.628756, 0.1421579, 2.011811, 0.3254902, 0, 1, 1,
0.6472076, -0.2827676, 3.36173, 0.3333333, 0, 1, 1,
0.6488511, 1.238104, 2.148614, 0.3372549, 0, 1, 1,
0.6494762, 0.3033769, 1.058452, 0.345098, 0, 1, 1,
0.6513915, 0.3677598, 1.54444, 0.3490196, 0, 1, 1,
0.6521831, -0.2527139, 2.090776, 0.3568628, 0, 1, 1,
0.6526788, 0.6768587, 0.1354391, 0.3607843, 0, 1, 1,
0.6528736, 0.7771094, -0.8678241, 0.3686275, 0, 1, 1,
0.6571603, -0.3884293, 1.696942, 0.372549, 0, 1, 1,
0.6580327, -0.7219619, 1.48358, 0.3803922, 0, 1, 1,
0.6581841, 0.5817337, -0.03598602, 0.3843137, 0, 1, 1,
0.6621972, 2.167616, 2.399439, 0.3921569, 0, 1, 1,
0.6636761, -1.186141, 2.590377, 0.3960784, 0, 1, 1,
0.6673338, 1.456724, -0.6106035, 0.4039216, 0, 1, 1,
0.6698005, -0.8337092, 1.441716, 0.4117647, 0, 1, 1,
0.6699101, 0.8050181, 0.2611334, 0.4156863, 0, 1, 1,
0.6730492, -0.3935097, 1.201577, 0.4235294, 0, 1, 1,
0.6763336, -0.4034171, 0.7073122, 0.427451, 0, 1, 1,
0.6764339, -0.02325093, 0.18279, 0.4352941, 0, 1, 1,
0.6766804, 0.2358874, 1.641018, 0.4392157, 0, 1, 1,
0.6801671, 0.5774378, 0.7660733, 0.4470588, 0, 1, 1,
0.6815186, 0.2111343, 0.439767, 0.4509804, 0, 1, 1,
0.6893743, -0.8856267, 1.361211, 0.4588235, 0, 1, 1,
0.6895641, 0.01811485, 2.076941, 0.4627451, 0, 1, 1,
0.6914164, 1.966919, 0.8935947, 0.4705882, 0, 1, 1,
0.6929991, 0.1780535, 0.1319626, 0.4745098, 0, 1, 1,
0.6934676, -0.1821377, 1.996881, 0.4823529, 0, 1, 1,
0.695061, -0.7207758, 2.616104, 0.4862745, 0, 1, 1,
0.6962292, -2.093652, 2.158763, 0.4941176, 0, 1, 1,
0.6974449, -0.3646217, 1.483437, 0.5019608, 0, 1, 1,
0.6978298, 0.6231882, 2.449204, 0.5058824, 0, 1, 1,
0.6990538, 0.6009238, 1.739612, 0.5137255, 0, 1, 1,
0.7070149, 0.1098724, -0.2231781, 0.5176471, 0, 1, 1,
0.7075464, 3.493051, -0.6908324, 0.5254902, 0, 1, 1,
0.7077331, 0.3491236, 2.150633, 0.5294118, 0, 1, 1,
0.7093378, 0.5274622, 2.107779, 0.5372549, 0, 1, 1,
0.7096431, -0.668389, 2.834027, 0.5411765, 0, 1, 1,
0.7105138, -1.433117, 3.101322, 0.5490196, 0, 1, 1,
0.712102, 1.849957, 0.7558857, 0.5529412, 0, 1, 1,
0.7163273, 1.151244, -0.3552167, 0.5607843, 0, 1, 1,
0.7170383, -1.736822, 1.663646, 0.5647059, 0, 1, 1,
0.7187269, 1.51669, 1.213961, 0.572549, 0, 1, 1,
0.7198872, 1.223338, 0.8534334, 0.5764706, 0, 1, 1,
0.7204707, -2.0032, 1.342064, 0.5843138, 0, 1, 1,
0.722883, -0.6334789, 2.853472, 0.5882353, 0, 1, 1,
0.7242799, 0.08737818, 1.548419, 0.5960785, 0, 1, 1,
0.726281, 0.6833248, 1.86761, 0.6039216, 0, 1, 1,
0.731713, -2.201159, 1.876954, 0.6078432, 0, 1, 1,
0.7321314, 0.4467513, 0.1879474, 0.6156863, 0, 1, 1,
0.7418965, -1.057302, 2.326053, 0.6196079, 0, 1, 1,
0.7456784, 0.7438665, 0.1712177, 0.627451, 0, 1, 1,
0.7458456, -0.6127189, 2.863906, 0.6313726, 0, 1, 1,
0.750462, -1.585254, 2.848803, 0.6392157, 0, 1, 1,
0.7511813, 1.008555, -0.6437255, 0.6431373, 0, 1, 1,
0.7542689, -0.722918, 3.607619, 0.6509804, 0, 1, 1,
0.7587608, -0.5200655, 4.518719, 0.654902, 0, 1, 1,
0.7591625, -0.2522905, 4.083776, 0.6627451, 0, 1, 1,
0.7638268, -0.3471628, 2.744875, 0.6666667, 0, 1, 1,
0.7647578, -0.203082, 1.397936, 0.6745098, 0, 1, 1,
0.7671221, -1.79161, 2.439811, 0.6784314, 0, 1, 1,
0.7687372, 0.1873531, 0.5888007, 0.6862745, 0, 1, 1,
0.7694967, 0.08953082, 2.736522, 0.6901961, 0, 1, 1,
0.7744092, -0.8286985, 1.701712, 0.6980392, 0, 1, 1,
0.7781755, -0.9113028, 2.466231, 0.7058824, 0, 1, 1,
0.7821128, 0.6719795, 0.9093551, 0.7098039, 0, 1, 1,
0.7863544, -0.1226698, 2.657192, 0.7176471, 0, 1, 1,
0.7866131, -1.28646, 2.431033, 0.7215686, 0, 1, 1,
0.7870416, 0.5486861, -0.7939745, 0.7294118, 0, 1, 1,
0.7916077, 0.4458387, 2.69691, 0.7333333, 0, 1, 1,
0.7937633, 0.1910767, 2.37412, 0.7411765, 0, 1, 1,
0.7941994, 0.4977608, 2.42753, 0.7450981, 0, 1, 1,
0.7942069, -1.384369, 2.946767, 0.7529412, 0, 1, 1,
0.8033644, -0.8981315, 3.409889, 0.7568628, 0, 1, 1,
0.8039674, -0.2579121, 2.595331, 0.7647059, 0, 1, 1,
0.8173944, -0.1638422, 0.398693, 0.7686275, 0, 1, 1,
0.8218983, 1.15543, 1.714375, 0.7764706, 0, 1, 1,
0.8254532, 0.4113827, 2.37819, 0.7803922, 0, 1, 1,
0.8268863, -0.940163, 1.12856, 0.7882353, 0, 1, 1,
0.8269579, -0.6228995, 4.480501, 0.7921569, 0, 1, 1,
0.8306624, 1.661402, 0.2209059, 0.8, 0, 1, 1,
0.831208, 0.1939005, 2.976933, 0.8078431, 0, 1, 1,
0.8322223, -0.6171604, 0.7247923, 0.8117647, 0, 1, 1,
0.8350985, -2.231543, 0.3537605, 0.8196079, 0, 1, 1,
0.8367991, -0.2976969, 2.181086, 0.8235294, 0, 1, 1,
0.8387823, -0.4748404, 3.017829, 0.8313726, 0, 1, 1,
0.8415633, 2.556174, 0.5672497, 0.8352941, 0, 1, 1,
0.8443777, 0.6001756, 1.274419, 0.8431373, 0, 1, 1,
0.8481215, 0.08977294, 1.427073, 0.8470588, 0, 1, 1,
0.872583, 0.7221435, 0.7135531, 0.854902, 0, 1, 1,
0.8741215, 0.7889306, 0.7947349, 0.8588235, 0, 1, 1,
0.8756961, -0.07736547, 1.040023, 0.8666667, 0, 1, 1,
0.8817672, -0.1685847, 2.778828, 0.8705882, 0, 1, 1,
0.8818763, -1.118459, 0.7217029, 0.8784314, 0, 1, 1,
0.8869289, 1.320848, 1.724194, 0.8823529, 0, 1, 1,
0.8943874, 1.06318, 1.545337, 0.8901961, 0, 1, 1,
0.8953607, -0.7093464, 4.453017, 0.8941177, 0, 1, 1,
0.898542, -0.1195039, 2.424359, 0.9019608, 0, 1, 1,
0.8997299, 0.7489223, 1.43289, 0.9098039, 0, 1, 1,
0.9035871, 0.8066197, 0.7783645, 0.9137255, 0, 1, 1,
0.9037815, 0.02383259, -0.06221087, 0.9215686, 0, 1, 1,
0.9096885, 0.5267071, 0.4306893, 0.9254902, 0, 1, 1,
0.9128878, -0.8513399, 1.773188, 0.9333333, 0, 1, 1,
0.9142668, -0.8192464, 4.746871, 0.9372549, 0, 1, 1,
0.9180318, -0.01034845, 1.764145, 0.945098, 0, 1, 1,
0.9267424, -0.7055125, 2.688744, 0.9490196, 0, 1, 1,
0.9378988, -1.998791, 0.8889892, 0.9568627, 0, 1, 1,
0.9461485, 0.3053975, 1.163303, 0.9607843, 0, 1, 1,
0.9502208, -0.5626194, 1.344278, 0.9686275, 0, 1, 1,
0.9509531, 1.290639, 2.295134, 0.972549, 0, 1, 1,
0.9546655, 1.845352, -0.1507355, 0.9803922, 0, 1, 1,
0.9662458, -0.3849102, 2.439835, 0.9843137, 0, 1, 1,
0.9691011, 1.269178, 1.31482, 0.9921569, 0, 1, 1,
0.9691707, -0.6491758, 3.376682, 0.9960784, 0, 1, 1,
0.9744605, 2.318468, 0.07374585, 1, 0, 0.9960784, 1,
0.9751147, -1.081165, 1.316127, 1, 0, 0.9882353, 1,
0.9788634, 0.639439, 1.180952, 1, 0, 0.9843137, 1,
0.9813054, 0.7683618, 2.514925, 1, 0, 0.9764706, 1,
0.9819415, -0.6729627, 1.617151, 1, 0, 0.972549, 1,
0.982289, -0.04718491, 1.894058, 1, 0, 0.9647059, 1,
0.9845465, 1.008515, 2.046851, 1, 0, 0.9607843, 1,
0.9884251, -0.5529262, 0.5531793, 1, 0, 0.9529412, 1,
0.988816, 0.1100362, 0.9658444, 1, 0, 0.9490196, 1,
0.9929849, -1.124485, 1.704777, 1, 0, 0.9411765, 1,
1.003845, 0.07613263, 0.1536692, 1, 0, 0.9372549, 1,
1.010383, 0.5669967, 2.159524, 1, 0, 0.9294118, 1,
1.010866, -1.119298, 2.608329, 1, 0, 0.9254902, 1,
1.011874, -0.3967658, 1.99893, 1, 0, 0.9176471, 1,
1.013443, -1.153011, 3.330642, 1, 0, 0.9137255, 1,
1.02075, 0.08704247, 2.623809, 1, 0, 0.9058824, 1,
1.023387, 0.05592856, 0.4973606, 1, 0, 0.9019608, 1,
1.028038, 0.5871752, 1.804611, 1, 0, 0.8941177, 1,
1.028781, 0.5182011, 0.9172744, 1, 0, 0.8862745, 1,
1.033313, 0.1539997, 0.3996713, 1, 0, 0.8823529, 1,
1.036796, -2.028962, 1.558425, 1, 0, 0.8745098, 1,
1.039735, -1.029269, 3.513735, 1, 0, 0.8705882, 1,
1.041121, 1.241826, 1.140971, 1, 0, 0.8627451, 1,
1.046217, 1.602885, -0.05933681, 1, 0, 0.8588235, 1,
1.062037, 0.7714558, -0.7646257, 1, 0, 0.8509804, 1,
1.070498, -0.02321881, 2.211669, 1, 0, 0.8470588, 1,
1.070789, -0.07511947, 1.282503, 1, 0, 0.8392157, 1,
1.080148, -0.9875104, 0.5806682, 1, 0, 0.8352941, 1,
1.080857, 0.8787385, 0.2190456, 1, 0, 0.827451, 1,
1.08761, 0.03496098, 2.390631, 1, 0, 0.8235294, 1,
1.099798, -0.2774503, 2.261471, 1, 0, 0.8156863, 1,
1.105365, 0.3892221, 2.774346, 1, 0, 0.8117647, 1,
1.118711, -0.1957877, 3.363668, 1, 0, 0.8039216, 1,
1.12732, 1.399896, -0.3179024, 1, 0, 0.7960784, 1,
1.129381, -0.1931394, 2.382328, 1, 0, 0.7921569, 1,
1.132994, 0.4191027, 1.804102, 1, 0, 0.7843137, 1,
1.133533, -0.1571747, 0.323206, 1, 0, 0.7803922, 1,
1.134122, -1.12937, 2.919578, 1, 0, 0.772549, 1,
1.139747, 0.7109343, -1.1067, 1, 0, 0.7686275, 1,
1.146983, 0.1674667, 2.148054, 1, 0, 0.7607843, 1,
1.157157, 0.4593958, 1.791221, 1, 0, 0.7568628, 1,
1.163834, 0.4527934, -0.6691312, 1, 0, 0.7490196, 1,
1.165323, 1.360514, 1.788779, 1, 0, 0.7450981, 1,
1.166556, 1.746271, -0.5905516, 1, 0, 0.7372549, 1,
1.167158, 1.581256, 0.0655193, 1, 0, 0.7333333, 1,
1.169198, -0.7699649, 3.630604, 1, 0, 0.7254902, 1,
1.171891, 0.04200863, 0.6589571, 1, 0, 0.7215686, 1,
1.181, 1.595529, 0.2019499, 1, 0, 0.7137255, 1,
1.183168, 0.6533585, 1.090836, 1, 0, 0.7098039, 1,
1.185065, -0.04090514, 0.4012643, 1, 0, 0.7019608, 1,
1.18753, -1.525304, 3.194674, 1, 0, 0.6941177, 1,
1.193017, 0.971801, -0.540665, 1, 0, 0.6901961, 1,
1.195442, 0.08783421, 1.956402, 1, 0, 0.682353, 1,
1.198428, 0.2247401, 1.586604, 1, 0, 0.6784314, 1,
1.210694, 1.198841, -0.2358716, 1, 0, 0.6705883, 1,
1.21686, 0.4675851, 0.6439933, 1, 0, 0.6666667, 1,
1.21872, 0.1629306, 1.313162, 1, 0, 0.6588235, 1,
1.22212, -0.2804333, 2.467227, 1, 0, 0.654902, 1,
1.22895, 0.3039441, 3.289835, 1, 0, 0.6470588, 1,
1.237587, -0.3154175, 2.873017, 1, 0, 0.6431373, 1,
1.248394, 0.3133107, 3.142899, 1, 0, 0.6352941, 1,
1.254915, -0.03578188, 2.33338, 1, 0, 0.6313726, 1,
1.273506, 2.441035, 1.604948, 1, 0, 0.6235294, 1,
1.276011, -0.1503846, 0.2996459, 1, 0, 0.6196079, 1,
1.276711, 0.3202277, 0.6179472, 1, 0, 0.6117647, 1,
1.280956, 0.7140489, 0.4619404, 1, 0, 0.6078432, 1,
1.281665, -0.3466505, 0.923934, 1, 0, 0.6, 1,
1.290664, 0.6586059, 2.688703, 1, 0, 0.5921569, 1,
1.307431, -2.364837, 2.010576, 1, 0, 0.5882353, 1,
1.31288, 1.574775, -0.5541124, 1, 0, 0.5803922, 1,
1.316726, 1.83095, 1.118112, 1, 0, 0.5764706, 1,
1.320071, -0.5830752, 2.521271, 1, 0, 0.5686275, 1,
1.348369, 0.3640026, 2.592942, 1, 0, 0.5647059, 1,
1.364247, 0.2054095, 2.464376, 1, 0, 0.5568628, 1,
1.366516, 0.8697496, 1.32146, 1, 0, 0.5529412, 1,
1.380447, -0.04775395, 2.204306, 1, 0, 0.5450981, 1,
1.38087, -1.68264, 2.403594, 1, 0, 0.5411765, 1,
1.397506, -0.04548067, 1.827972, 1, 0, 0.5333334, 1,
1.397557, -1.006778, 2.939366, 1, 0, 0.5294118, 1,
1.399535, 0.5422305, -0.8070404, 1, 0, 0.5215687, 1,
1.402042, 1.147577, -0.5552296, 1, 0, 0.5176471, 1,
1.409188, 0.4022611, 1.300466, 1, 0, 0.509804, 1,
1.41083, -0.2014592, -0.3852001, 1, 0, 0.5058824, 1,
1.426104, 0.532016, 0.5263997, 1, 0, 0.4980392, 1,
1.438488, -1.209579, 1.850305, 1, 0, 0.4901961, 1,
1.439005, -2.280917, 2.676272, 1, 0, 0.4862745, 1,
1.442473, 1.114182, 1.262587, 1, 0, 0.4784314, 1,
1.459376, 0.7752638, 0.339779, 1, 0, 0.4745098, 1,
1.46397, 0.7024009, -0.143909, 1, 0, 0.4666667, 1,
1.498978, 0.09674487, 1.561999, 1, 0, 0.4627451, 1,
1.50031, 1.988931, 2.697912, 1, 0, 0.454902, 1,
1.50507, 0.5389692, 0.2137273, 1, 0, 0.4509804, 1,
1.506068, 0.8969809, 3.884015, 1, 0, 0.4431373, 1,
1.514325, 0.8546059, 1.364422, 1, 0, 0.4392157, 1,
1.518605, -1.09364, 3.522027, 1, 0, 0.4313726, 1,
1.524183, 0.1981098, 2.468079, 1, 0, 0.427451, 1,
1.525694, 0.1962496, 0.9538867, 1, 0, 0.4196078, 1,
1.544957, 0.1101237, 0.09624317, 1, 0, 0.4156863, 1,
1.56463, -1.713247, 1.156716, 1, 0, 0.4078431, 1,
1.571544, -0.8032892, 0.4429694, 1, 0, 0.4039216, 1,
1.581772, -0.03255056, 2.458697, 1, 0, 0.3960784, 1,
1.593097, -1.049458, 3.128913, 1, 0, 0.3882353, 1,
1.595066, 0.6670596, 1.271625, 1, 0, 0.3843137, 1,
1.607438, -1.692414, 1.551334, 1, 0, 0.3764706, 1,
1.608659, -0.7021196, 2.224784, 1, 0, 0.372549, 1,
1.609693, -0.03853429, 2.861907, 1, 0, 0.3647059, 1,
1.611797, -0.03163772, 1.057812, 1, 0, 0.3607843, 1,
1.618593, -0.5936232, 2.084205, 1, 0, 0.3529412, 1,
1.619473, 0.2422851, 0.4407742, 1, 0, 0.3490196, 1,
1.629101, -0.8312548, 2.939588, 1, 0, 0.3411765, 1,
1.631051, 1.112937, -0.8649922, 1, 0, 0.3372549, 1,
1.641292, -0.06710943, 0.9506811, 1, 0, 0.3294118, 1,
1.641305, -0.411111, 0.1518025, 1, 0, 0.3254902, 1,
1.641794, 0.5535659, 0.8251822, 1, 0, 0.3176471, 1,
1.645012, -0.01045494, 0.5164401, 1, 0, 0.3137255, 1,
1.653838, -0.7469335, 1.838515, 1, 0, 0.3058824, 1,
1.654427, 0.9969013, 1.045435, 1, 0, 0.2980392, 1,
1.658003, -0.9998116, 2.320871, 1, 0, 0.2941177, 1,
1.67353, 0.8883421, 1.305019, 1, 0, 0.2862745, 1,
1.674338, 1.383773, 1.652257, 1, 0, 0.282353, 1,
1.67641, 0.2882473, -0.704455, 1, 0, 0.2745098, 1,
1.681816, -0.5839505, 0.8401254, 1, 0, 0.2705882, 1,
1.688564, 0.3433812, 2.691097, 1, 0, 0.2627451, 1,
1.694425, 0.507443, 3.017468, 1, 0, 0.2588235, 1,
1.73057, -1.394057, 3.643417, 1, 0, 0.2509804, 1,
1.736318, 1.628499, 0.7574496, 1, 0, 0.2470588, 1,
1.752767, -1.646966, 0.1724345, 1, 0, 0.2392157, 1,
1.753264, 1.097214, 2.545228, 1, 0, 0.2352941, 1,
1.796209, 0.3307078, 1.302888, 1, 0, 0.227451, 1,
1.79996, 0.3206019, 1.341518, 1, 0, 0.2235294, 1,
1.805215, 0.5100892, 1.385484, 1, 0, 0.2156863, 1,
1.808527, -0.6132804, 1.418605, 1, 0, 0.2117647, 1,
1.829431, 0.3212031, 1.134176, 1, 0, 0.2039216, 1,
1.849708, 1.585778, 1.993593, 1, 0, 0.1960784, 1,
1.854032, -0.2525136, 2.833601, 1, 0, 0.1921569, 1,
1.895813, -1.487831, 1.347656, 1, 0, 0.1843137, 1,
1.924626, -1.545647, 1.797023, 1, 0, 0.1803922, 1,
1.928591, 0.2777285, 1.680577, 1, 0, 0.172549, 1,
1.948468, 0.8319831, 1.722027, 1, 0, 0.1686275, 1,
1.981397, -1.437394, 2.441751, 1, 0, 0.1607843, 1,
1.988134, -0.4981469, 2.159733, 1, 0, 0.1568628, 1,
2.016832, -0.3265131, 0.8047963, 1, 0, 0.1490196, 1,
2.04819, -1.027834, 2.303, 1, 0, 0.145098, 1,
2.06394, -0.3744003, 0.5864911, 1, 0, 0.1372549, 1,
2.108478, 0.2881299, 0.85967, 1, 0, 0.1333333, 1,
2.118054, -0.6884953, 2.320213, 1, 0, 0.1254902, 1,
2.137814, -1.761849, 2.326941, 1, 0, 0.1215686, 1,
2.161889, -0.2263616, 0.8627183, 1, 0, 0.1137255, 1,
2.174667, -1.474424, 2.196017, 1, 0, 0.1098039, 1,
2.190944, 0.07119346, 1.790982, 1, 0, 0.1019608, 1,
2.216098, 2.431828, -0.1192357, 1, 0, 0.09411765, 1,
2.252331, 0.8984569, 1.305755, 1, 0, 0.09019608, 1,
2.304214, 1.0365, 0.9744046, 1, 0, 0.08235294, 1,
2.339395, -0.6019533, 3.176819, 1, 0, 0.07843138, 1,
2.359334, 0.4419712, 0.8986007, 1, 0, 0.07058824, 1,
2.389158, -1.901015, 2.350386, 1, 0, 0.06666667, 1,
2.425378, -0.1894666, 1.67464, 1, 0, 0.05882353, 1,
2.465694, 1.612278, -0.4218498, 1, 0, 0.05490196, 1,
2.48286, 0.2863479, 2.311938, 1, 0, 0.04705882, 1,
2.508677, -0.8459945, 1.412094, 1, 0, 0.04313726, 1,
2.631071, -0.9554591, 1.587448, 1, 0, 0.03529412, 1,
2.652943, 0.1267412, 1.930227, 1, 0, 0.03137255, 1,
2.713244, -1.265195, 1.11857, 1, 0, 0.02352941, 1,
2.823453, -0.2864433, 1.855763, 1, 0, 0.01960784, 1,
2.922384, -0.430535, 1.88434, 1, 0, 0.01176471, 1,
3.554944, -0.2566712, 0.7219758, 1, 0, 0.007843138, 1
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
0.3210939, -4.492647, -6.977348, 0, -0.5, 0.5, 0.5,
0.3210939, -4.492647, -6.977348, 1, -0.5, 0.5, 0.5,
0.3210939, -4.492647, -6.977348, 1, 1.5, 0.5, 0.5,
0.3210939, -4.492647, -6.977348, 0, 1.5, 0.5, 0.5
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
-4.009032, 0.07890022, -6.977348, 0, -0.5, 0.5, 0.5,
-4.009032, 0.07890022, -6.977348, 1, -0.5, 0.5, 0.5,
-4.009032, 0.07890022, -6.977348, 1, 1.5, 0.5, 0.5,
-4.009032, 0.07890022, -6.977348, 0, 1.5, 0.5, 0.5
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
-4.009032, -4.492647, 0.03103924, 0, -0.5, 0.5, 0.5,
-4.009032, -4.492647, 0.03103924, 1, -0.5, 0.5, 0.5,
-4.009032, -4.492647, 0.03103924, 1, 1.5, 0.5, 0.5,
-4.009032, -4.492647, 0.03103924, 0, 1.5, 0.5, 0.5
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
-2, -3.437675, -5.360028,
3, -3.437675, -5.360028,
-2, -3.437675, -5.360028,
-2, -3.613503, -5.629581,
-1, -3.437675, -5.360028,
-1, -3.613503, -5.629581,
0, -3.437675, -5.360028,
0, -3.613503, -5.629581,
1, -3.437675, -5.360028,
1, -3.613503, -5.629581,
2, -3.437675, -5.360028,
2, -3.613503, -5.629581,
3, -3.437675, -5.360028,
3, -3.613503, -5.629581
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
-2, -3.965161, -6.168688, 0, -0.5, 0.5, 0.5,
-2, -3.965161, -6.168688, 1, -0.5, 0.5, 0.5,
-2, -3.965161, -6.168688, 1, 1.5, 0.5, 0.5,
-2, -3.965161, -6.168688, 0, 1.5, 0.5, 0.5,
-1, -3.965161, -6.168688, 0, -0.5, 0.5, 0.5,
-1, -3.965161, -6.168688, 1, -0.5, 0.5, 0.5,
-1, -3.965161, -6.168688, 1, 1.5, 0.5, 0.5,
-1, -3.965161, -6.168688, 0, 1.5, 0.5, 0.5,
0, -3.965161, -6.168688, 0, -0.5, 0.5, 0.5,
0, -3.965161, -6.168688, 1, -0.5, 0.5, 0.5,
0, -3.965161, -6.168688, 1, 1.5, 0.5, 0.5,
0, -3.965161, -6.168688, 0, 1.5, 0.5, 0.5,
1, -3.965161, -6.168688, 0, -0.5, 0.5, 0.5,
1, -3.965161, -6.168688, 1, -0.5, 0.5, 0.5,
1, -3.965161, -6.168688, 1, 1.5, 0.5, 0.5,
1, -3.965161, -6.168688, 0, 1.5, 0.5, 0.5,
2, -3.965161, -6.168688, 0, -0.5, 0.5, 0.5,
2, -3.965161, -6.168688, 1, -0.5, 0.5, 0.5,
2, -3.965161, -6.168688, 1, 1.5, 0.5, 0.5,
2, -3.965161, -6.168688, 0, 1.5, 0.5, 0.5,
3, -3.965161, -6.168688, 0, -0.5, 0.5, 0.5,
3, -3.965161, -6.168688, 1, -0.5, 0.5, 0.5,
3, -3.965161, -6.168688, 1, 1.5, 0.5, 0.5,
3, -3.965161, -6.168688, 0, 1.5, 0.5, 0.5
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
-3.009772, -3, -5.360028,
-3.009772, 3, -5.360028,
-3.009772, -3, -5.360028,
-3.176315, -3, -5.629581,
-3.009772, -2, -5.360028,
-3.176315, -2, -5.629581,
-3.009772, -1, -5.360028,
-3.176315, -1, -5.629581,
-3.009772, 0, -5.360028,
-3.176315, 0, -5.629581,
-3.009772, 1, -5.360028,
-3.176315, 1, -5.629581,
-3.009772, 2, -5.360028,
-3.176315, 2, -5.629581,
-3.009772, 3, -5.360028,
-3.176315, 3, -5.629581
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
-3.509402, -3, -6.168688, 0, -0.5, 0.5, 0.5,
-3.509402, -3, -6.168688, 1, -0.5, 0.5, 0.5,
-3.509402, -3, -6.168688, 1, 1.5, 0.5, 0.5,
-3.509402, -3, -6.168688, 0, 1.5, 0.5, 0.5,
-3.509402, -2, -6.168688, 0, -0.5, 0.5, 0.5,
-3.509402, -2, -6.168688, 1, -0.5, 0.5, 0.5,
-3.509402, -2, -6.168688, 1, 1.5, 0.5, 0.5,
-3.509402, -2, -6.168688, 0, 1.5, 0.5, 0.5,
-3.509402, -1, -6.168688, 0, -0.5, 0.5, 0.5,
-3.509402, -1, -6.168688, 1, -0.5, 0.5, 0.5,
-3.509402, -1, -6.168688, 1, 1.5, 0.5, 0.5,
-3.509402, -1, -6.168688, 0, 1.5, 0.5, 0.5,
-3.509402, 0, -6.168688, 0, -0.5, 0.5, 0.5,
-3.509402, 0, -6.168688, 1, -0.5, 0.5, 0.5,
-3.509402, 0, -6.168688, 1, 1.5, 0.5, 0.5,
-3.509402, 0, -6.168688, 0, 1.5, 0.5, 0.5,
-3.509402, 1, -6.168688, 0, -0.5, 0.5, 0.5,
-3.509402, 1, -6.168688, 1, -0.5, 0.5, 0.5,
-3.509402, 1, -6.168688, 1, 1.5, 0.5, 0.5,
-3.509402, 1, -6.168688, 0, 1.5, 0.5, 0.5,
-3.509402, 2, -6.168688, 0, -0.5, 0.5, 0.5,
-3.509402, 2, -6.168688, 1, -0.5, 0.5, 0.5,
-3.509402, 2, -6.168688, 1, 1.5, 0.5, 0.5,
-3.509402, 2, -6.168688, 0, 1.5, 0.5, 0.5,
-3.509402, 3, -6.168688, 0, -0.5, 0.5, 0.5,
-3.509402, 3, -6.168688, 1, -0.5, 0.5, 0.5,
-3.509402, 3, -6.168688, 1, 1.5, 0.5, 0.5,
-3.509402, 3, -6.168688, 0, 1.5, 0.5, 0.5
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
-3.009772, -3.437675, -4,
-3.009772, -3.437675, 4,
-3.009772, -3.437675, -4,
-3.176315, -3.613503, -4,
-3.009772, -3.437675, -2,
-3.176315, -3.613503, -2,
-3.009772, -3.437675, 0,
-3.176315, -3.613503, 0,
-3.009772, -3.437675, 2,
-3.176315, -3.613503, 2,
-3.009772, -3.437675, 4,
-3.176315, -3.613503, 4
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
-3.509402, -3.965161, -4, 0, -0.5, 0.5, 0.5,
-3.509402, -3.965161, -4, 1, -0.5, 0.5, 0.5,
-3.509402, -3.965161, -4, 1, 1.5, 0.5, 0.5,
-3.509402, -3.965161, -4, 0, 1.5, 0.5, 0.5,
-3.509402, -3.965161, -2, 0, -0.5, 0.5, 0.5,
-3.509402, -3.965161, -2, 1, -0.5, 0.5, 0.5,
-3.509402, -3.965161, -2, 1, 1.5, 0.5, 0.5,
-3.509402, -3.965161, -2, 0, 1.5, 0.5, 0.5,
-3.509402, -3.965161, 0, 0, -0.5, 0.5, 0.5,
-3.509402, -3.965161, 0, 1, -0.5, 0.5, 0.5,
-3.509402, -3.965161, 0, 1, 1.5, 0.5, 0.5,
-3.509402, -3.965161, 0, 0, 1.5, 0.5, 0.5,
-3.509402, -3.965161, 2, 0, -0.5, 0.5, 0.5,
-3.509402, -3.965161, 2, 1, -0.5, 0.5, 0.5,
-3.509402, -3.965161, 2, 1, 1.5, 0.5, 0.5,
-3.509402, -3.965161, 2, 0, 1.5, 0.5, 0.5,
-3.509402, -3.965161, 4, 0, -0.5, 0.5, 0.5,
-3.509402, -3.965161, 4, 1, -0.5, 0.5, 0.5,
-3.509402, -3.965161, 4, 1, 1.5, 0.5, 0.5,
-3.509402, -3.965161, 4, 0, 1.5, 0.5, 0.5
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
-3.009772, -3.437675, -5.360028,
-3.009772, 3.595475, -5.360028,
-3.009772, -3.437675, 5.422106,
-3.009772, 3.595475, 5.422106,
-3.009772, -3.437675, -5.360028,
-3.009772, -3.437675, 5.422106,
-3.009772, 3.595475, -5.360028,
-3.009772, 3.595475, 5.422106,
-3.009772, -3.437675, -5.360028,
3.65196, -3.437675, -5.360028,
-3.009772, -3.437675, 5.422106,
3.65196, -3.437675, 5.422106,
-3.009772, 3.595475, -5.360028,
3.65196, 3.595475, -5.360028,
-3.009772, 3.595475, 5.422106,
3.65196, 3.595475, 5.422106,
3.65196, -3.437675, -5.360028,
3.65196, 3.595475, -5.360028,
3.65196, -3.437675, 5.422106,
3.65196, 3.595475, 5.422106,
3.65196, -3.437675, -5.360028,
3.65196, -3.437675, 5.422106,
3.65196, 3.595475, -5.360028,
3.65196, 3.595475, 5.422106
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
var radius = 7.739924;
var distance = 34.4358;
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
mvMatrix.translate( -0.3210939, -0.07890022, -0.03103924 );
mvMatrix.scale( 1.256214, 1.189873, 0.7761504 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.4358);
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
-2.912756, 0.4972168, -0.436139, 0, 0, 1, 1, 1,
-2.676033, 0.9292065, -2.03051, 1, 0, 0, 1, 1,
-2.611419, 1.1065, -2.305743, 1, 0, 0, 1, 1,
-2.61042, 0.3216322, -2.364519, 1, 0, 0, 1, 1,
-2.568749, 0.4374718, -2.387652, 1, 0, 0, 1, 1,
-2.264506, -1.615082, -1.960717, 1, 0, 0, 1, 1,
-2.230787, 0.6448325, -0.760559, 0, 0, 0, 1, 1,
-2.185148, -0.6457083, -1.711622, 0, 0, 0, 1, 1,
-2.181172, 0.5434527, -0.6617998, 0, 0, 0, 1, 1,
-2.140483, 0.6393048, -2.450323, 0, 0, 0, 1, 1,
-2.135366, 0.1376938, -2.789851, 0, 0, 0, 1, 1,
-2.084698, 0.04119407, -1.921088, 0, 0, 0, 1, 1,
-1.993518, -0.6934023, -3.404781, 0, 0, 0, 1, 1,
-1.988565, -0.944271, -0.7498553, 1, 1, 1, 1, 1,
-1.96741, -2.608671, -4.269597, 1, 1, 1, 1, 1,
-1.960179, 0.9659529, 1.918162, 1, 1, 1, 1, 1,
-1.879816, -0.7941068, -2.179047, 1, 1, 1, 1, 1,
-1.867177, 0.78289, -1.121313, 1, 1, 1, 1, 1,
-1.844539, 0.7147001, -0.7066706, 1, 1, 1, 1, 1,
-1.843303, 0.9846764, -1.569309, 1, 1, 1, 1, 1,
-1.841694, 1.738622, -1.177347, 1, 1, 1, 1, 1,
-1.831939, 0.358839, -0.459076, 1, 1, 1, 1, 1,
-1.817906, 1.302272, -2.212994, 1, 1, 1, 1, 1,
-1.797604, -0.5448064, -3.19827, 1, 1, 1, 1, 1,
-1.772731, 0.4303982, -1.427871, 1, 1, 1, 1, 1,
-1.75835, 1.062003, -0.7396501, 1, 1, 1, 1, 1,
-1.752761, 0.7523073, -1.159023, 1, 1, 1, 1, 1,
-1.744377, -1.342706, -2.927611, 1, 1, 1, 1, 1,
-1.739971, -1.016385, -2.704577, 0, 0, 1, 1, 1,
-1.734887, -0.719868, -1.963979, 1, 0, 0, 1, 1,
-1.731194, 2.63535, -1.371951, 1, 0, 0, 1, 1,
-1.719327, -0.6174827, -3.078893, 1, 0, 0, 1, 1,
-1.716531, -1.34224, -1.918611, 1, 0, 0, 1, 1,
-1.706655, -1.076153, -3.714792, 1, 0, 0, 1, 1,
-1.705461, -1.13977, -2.219431, 0, 0, 0, 1, 1,
-1.670995, -0.8765756, -4.294281, 0, 0, 0, 1, 1,
-1.664195, -0.9599459, -2.696415, 0, 0, 0, 1, 1,
-1.66323, -0.03866959, -0.7673218, 0, 0, 0, 1, 1,
-1.654882, -0.2346085, -1.817814, 0, 0, 0, 1, 1,
-1.653506, 0.3482445, -1.814286, 0, 0, 0, 1, 1,
-1.645578, 1.773447, -0.3002022, 0, 0, 0, 1, 1,
-1.619572, 0.4502728, -0.9593604, 1, 1, 1, 1, 1,
-1.610304, 2.225346, -2.068298, 1, 1, 1, 1, 1,
-1.598425, -2.323629, -2.009751, 1, 1, 1, 1, 1,
-1.59521, -0.6412105, -2.551577, 1, 1, 1, 1, 1,
-1.586457, 0.2752721, -2.958764, 1, 1, 1, 1, 1,
-1.585416, 0.3942371, -3.659973, 1, 1, 1, 1, 1,
-1.561787, -2.049799, -2.985931, 1, 1, 1, 1, 1,
-1.559315, -1.835725, -2.34861, 1, 1, 1, 1, 1,
-1.543439, 0.07249001, -2.323357, 1, 1, 1, 1, 1,
-1.534948, 1.113462, -0.6130271, 1, 1, 1, 1, 1,
-1.532844, 0.3240628, -3.344523, 1, 1, 1, 1, 1,
-1.52852, 1.180761, -1.06828, 1, 1, 1, 1, 1,
-1.527199, 0.7093382, -2.087792, 1, 1, 1, 1, 1,
-1.491748, 0.6795722, -1.47453, 1, 1, 1, 1, 1,
-1.483157, 0.9518713, -1.062737, 1, 1, 1, 1, 1,
-1.475368, -1.259701, -2.11501, 0, 0, 1, 1, 1,
-1.471778, 0.3687374, -0.4718516, 1, 0, 0, 1, 1,
-1.469101, 1.563867, -0.1883799, 1, 0, 0, 1, 1,
-1.465679, 0.5647863, -1.629253, 1, 0, 0, 1, 1,
-1.463597, -1.123502, -3.927835, 1, 0, 0, 1, 1,
-1.45823, 0.9891393, -0.6155262, 1, 0, 0, 1, 1,
-1.445113, -1.375359, -2.509621, 0, 0, 0, 1, 1,
-1.444983, 0.001802984, -0.1096166, 0, 0, 0, 1, 1,
-1.443187, -0.4896383, -1.84653, 0, 0, 0, 1, 1,
-1.435593, -1.082285, -2.872822, 0, 0, 0, 1, 1,
-1.434332, -0.5900851, -2.37544, 0, 0, 0, 1, 1,
-1.399159, 0.5709525, -0.4090878, 0, 0, 0, 1, 1,
-1.398293, 0.3947254, -1.314031, 0, 0, 0, 1, 1,
-1.394881, 1.458866, -1.623378, 1, 1, 1, 1, 1,
-1.38744, 0.8450735, -1.417373, 1, 1, 1, 1, 1,
-1.387131, 0.4176734, 0.5190645, 1, 1, 1, 1, 1,
-1.385392, -0.02398739, -0.2826879, 1, 1, 1, 1, 1,
-1.370889, 0.5302877, -0.7305554, 1, 1, 1, 1, 1,
-1.356382, -0.562054, -1.242121, 1, 1, 1, 1, 1,
-1.35525, -0.6585596, -1.368838, 1, 1, 1, 1, 1,
-1.352788, 0.06909747, -3.139148, 1, 1, 1, 1, 1,
-1.351649, -0.5043294, -2.349491, 1, 1, 1, 1, 1,
-1.350109, 0.5520422, -1.412896, 1, 1, 1, 1, 1,
-1.347342, -0.1839778, -2.382783, 1, 1, 1, 1, 1,
-1.333745, -0.1804796, -0.0834351, 1, 1, 1, 1, 1,
-1.323599, 0.08757226, -1.264409, 1, 1, 1, 1, 1,
-1.321275, 0.5259588, -2.556563, 1, 1, 1, 1, 1,
-1.320644, -1.886025, -2.859219, 1, 1, 1, 1, 1,
-1.317525, 0.2208884, -1.578337, 0, 0, 1, 1, 1,
-1.312643, 0.04626284, -1.930138, 1, 0, 0, 1, 1,
-1.304519, -1.002063, 0.09656166, 1, 0, 0, 1, 1,
-1.29305, 0.2621234, -1.339399, 1, 0, 0, 1, 1,
-1.291722, -0.04299515, -2.285152, 1, 0, 0, 1, 1,
-1.286288, -0.04346197, -2.178688, 1, 0, 0, 1, 1,
-1.279834, -1.228001, -1.250532, 0, 0, 0, 1, 1,
-1.278675, 0.2858942, -2.578292, 0, 0, 0, 1, 1,
-1.273473, 0.3372966, -3.198559, 0, 0, 0, 1, 1,
-1.263025, -1.358684, -2.30668, 0, 0, 0, 1, 1,
-1.254148, -1.440801, -3.895026, 0, 0, 0, 1, 1,
-1.242808, 0.1533464, -2.397086, 0, 0, 0, 1, 1,
-1.238249, -0.2924228, -1.442856, 0, 0, 0, 1, 1,
-1.222902, -1.973903, -3.880033, 1, 1, 1, 1, 1,
-1.222323, -1.249957, -1.714724, 1, 1, 1, 1, 1,
-1.222196, 0.3227099, -2.223253, 1, 1, 1, 1, 1,
-1.221192, -0.9050983, -2.801702, 1, 1, 1, 1, 1,
-1.202501, -0.1029476, -0.4133795, 1, 1, 1, 1, 1,
-1.18805, 0.6867973, -1.914703, 1, 1, 1, 1, 1,
-1.186009, -2.108968, -3.236337, 1, 1, 1, 1, 1,
-1.174641, 0.7524488, -1.479613, 1, 1, 1, 1, 1,
-1.163902, 0.1980099, -0.2207185, 1, 1, 1, 1, 1,
-1.158734, -0.1340322, 0.5234978, 1, 1, 1, 1, 1,
-1.147183, 0.40075, -1.690071, 1, 1, 1, 1, 1,
-1.143861, -1.89632, -3.275348, 1, 1, 1, 1, 1,
-1.140399, -0.6471891, -4.366469, 1, 1, 1, 1, 1,
-1.134528, 0.5512268, -0.8055657, 1, 1, 1, 1, 1,
-1.126349, 1.704384, -1.38822, 1, 1, 1, 1, 1,
-1.12555, -0.1331568, -2.743142, 0, 0, 1, 1, 1,
-1.12007, -0.7749017, -1.588133, 1, 0, 0, 1, 1,
-1.119402, -0.4364251, -2.446136, 1, 0, 0, 1, 1,
-1.119254, 0.2789903, -1.178235, 1, 0, 0, 1, 1,
-1.110481, 0.2573825, -0.3421544, 1, 0, 0, 1, 1,
-1.099097, -0.9343393, -2.136181, 1, 0, 0, 1, 1,
-1.09209, 0.02034261, -1.642856, 0, 0, 0, 1, 1,
-1.090415, 0.8924474, 0.9738916, 0, 0, 0, 1, 1,
-1.086902, -0.6567379, -3.43887, 0, 0, 0, 1, 1,
-1.084628, 0.1180971, -1.675909, 0, 0, 0, 1, 1,
-1.08434, 0.1581894, -2.995265, 0, 0, 0, 1, 1,
-1.080779, 0.04274528, -1.829748, 0, 0, 0, 1, 1,
-1.075083, -0.3053445, -3.074754, 0, 0, 0, 1, 1,
-1.057611, -1.138009, -2.692384, 1, 1, 1, 1, 1,
-1.055825, 1.131384, 0.348696, 1, 1, 1, 1, 1,
-1.054311, -1.158258, -1.588732, 1, 1, 1, 1, 1,
-1.053875, -1.684268, -1.653991, 1, 1, 1, 1, 1,
-1.049483, 1.262705, -0.8102123, 1, 1, 1, 1, 1,
-1.046199, 0.9795672, 1.049249, 1, 1, 1, 1, 1,
-1.04354, 0.09450252, -0.8862755, 1, 1, 1, 1, 1,
-1.037908, 1.068629, -0.5281529, 1, 1, 1, 1, 1,
-1.028803, 0.4316479, -0.6199661, 1, 1, 1, 1, 1,
-1.026776, 0.4852567, -0.2308088, 1, 1, 1, 1, 1,
-1.025884, -1.64147, -3.809536, 1, 1, 1, 1, 1,
-1.023594, 1.130139, -0.1841256, 1, 1, 1, 1, 1,
-1.021291, -0.02266398, -1.548906, 1, 1, 1, 1, 1,
-1.020659, 0.03902669, -1.294231, 1, 1, 1, 1, 1,
-1.018828, -0.8063613, -0.8220917, 1, 1, 1, 1, 1,
-1.017897, -0.4875915, -1.986877, 0, 0, 1, 1, 1,
-1.017186, -1.264457, -1.587587, 1, 0, 0, 1, 1,
-1.01667, 0.357384, -0.6589362, 1, 0, 0, 1, 1,
-1.014166, 1.111369, -2.018818, 1, 0, 0, 1, 1,
-1.013854, -1.192315, -2.400218, 1, 0, 0, 1, 1,
-1.007708, 0.09384566, -3.082374, 1, 0, 0, 1, 1,
-1.006078, 0.83603, -0.9539573, 0, 0, 0, 1, 1,
-1.000954, 0.1459038, -1.208222, 0, 0, 0, 1, 1,
-0.9975072, -0.6612859, -2.037176, 0, 0, 0, 1, 1,
-0.9876716, 0.2017466, -3.685575, 0, 0, 0, 1, 1,
-0.9873925, 1.407406, -0.3942654, 0, 0, 0, 1, 1,
-0.9806884, 1.065324, -2.057047, 0, 0, 0, 1, 1,
-0.9770826, 0.7597039, -3.215356, 0, 0, 0, 1, 1,
-0.9695612, 0.9123892, -1.384031, 1, 1, 1, 1, 1,
-0.9636139, -0.1325298, -2.15649, 1, 1, 1, 1, 1,
-0.9602523, 0.450663, -3.577407, 1, 1, 1, 1, 1,
-0.9573019, -1.237348, 0.3309247, 1, 1, 1, 1, 1,
-0.9413874, -1.182729, -1.916391, 1, 1, 1, 1, 1,
-0.9350451, -1.444899, -2.249097, 1, 1, 1, 1, 1,
-0.9285218, 0.9253984, -2.703611, 1, 1, 1, 1, 1,
-0.926727, -0.8762525, -1.437336, 1, 1, 1, 1, 1,
-0.9260002, -0.07977121, -1.876241, 1, 1, 1, 1, 1,
-0.9259938, -1.134649, -2.001331, 1, 1, 1, 1, 1,
-0.925369, 0.8443569, -1.109873, 1, 1, 1, 1, 1,
-0.9059532, 0.6081862, -1.828463, 1, 1, 1, 1, 1,
-0.9022241, 0.814509, 0.6967566, 1, 1, 1, 1, 1,
-0.8978958, -0.3140097, -4.08917, 1, 1, 1, 1, 1,
-0.8972515, -0.2802714, -0.7522497, 1, 1, 1, 1, 1,
-0.8920971, 1.035618, -1.350619, 0, 0, 1, 1, 1,
-0.8909573, -0.1594316, -0.71209, 1, 0, 0, 1, 1,
-0.8850435, -0.3121342, -2.903302, 1, 0, 0, 1, 1,
-0.8806251, -1.040078, -0.2356896, 1, 0, 0, 1, 1,
-0.8770419, 1.449615, 0.193434, 1, 0, 0, 1, 1,
-0.8768935, -1.484213, -2.28644, 1, 0, 0, 1, 1,
-0.8732769, -0.9829438, -2.767154, 0, 0, 0, 1, 1,
-0.8717285, 2.261738, -0.04594574, 0, 0, 0, 1, 1,
-0.851465, 0.08622691, -2.652516, 0, 0, 0, 1, 1,
-0.8460007, -0.4132979, -2.695013, 0, 0, 0, 1, 1,
-0.8452519, -1.554655, -2.808227, 0, 0, 0, 1, 1,
-0.8451025, -0.2803631, -1.23137, 0, 0, 0, 1, 1,
-0.8422399, 1.983051, -1.440953, 0, 0, 0, 1, 1,
-0.8397585, 0.08495174, -2.281708, 1, 1, 1, 1, 1,
-0.8306639, 0.6646582, -1.079537, 1, 1, 1, 1, 1,
-0.8286504, -0.8009524, -1.599589, 1, 1, 1, 1, 1,
-0.8261878, 0.600413, -1.4052, 1, 1, 1, 1, 1,
-0.8073336, -1.800776, -3.5289, 1, 1, 1, 1, 1,
-0.8061248, -1.168926, -3.621748, 1, 1, 1, 1, 1,
-0.8056846, 0.4352682, -1.37708, 1, 1, 1, 1, 1,
-0.8011489, 0.1358556, -1.793715, 1, 1, 1, 1, 1,
-0.7956505, 0.02456515, -1.891608, 1, 1, 1, 1, 1,
-0.7943066, 0.4748865, -0.2668947, 1, 1, 1, 1, 1,
-0.7862961, -2.07973, -3.662722, 1, 1, 1, 1, 1,
-0.7830839, 0.4271081, -1.055695, 1, 1, 1, 1, 1,
-0.7821322, 0.8501153, 0.1167957, 1, 1, 1, 1, 1,
-0.7791722, -2.168341, -2.519356, 1, 1, 1, 1, 1,
-0.7780126, -0.5213574, -2.036463, 1, 1, 1, 1, 1,
-0.7771614, 1.704571, -1.38395, 0, 0, 1, 1, 1,
-0.7699389, -0.5190539, -2.742103, 1, 0, 0, 1, 1,
-0.7688774, -0.6025247, -3.648729, 1, 0, 0, 1, 1,
-0.7619509, 1.416809, -1.823478, 1, 0, 0, 1, 1,
-0.7617458, -0.6049715, -2.371532, 1, 0, 0, 1, 1,
-0.7547, -0.3311546, -0.9345104, 1, 0, 0, 1, 1,
-0.7542859, -2.298072, -3.867955, 0, 0, 0, 1, 1,
-0.7537865, 1.506478, 0.9550716, 0, 0, 0, 1, 1,
-0.7508397, -1.070832, -1.566079, 0, 0, 0, 1, 1,
-0.7445593, 0.1330238, 0.3013354, 0, 0, 0, 1, 1,
-0.7388182, -1.311441, -2.466662, 0, 0, 0, 1, 1,
-0.7367089, 0.7087929, -0.8379771, 0, 0, 0, 1, 1,
-0.7310922, -1.933773, -1.552533, 0, 0, 0, 1, 1,
-0.7298054, 1.400545, -1.894483, 1, 1, 1, 1, 1,
-0.7287033, -0.5513536, -3.05803, 1, 1, 1, 1, 1,
-0.7269002, -0.5120365, -0.8547527, 1, 1, 1, 1, 1,
-0.7246063, -0.348657, -1.397557, 1, 1, 1, 1, 1,
-0.7237412, 0.2429797, -2.795275, 1, 1, 1, 1, 1,
-0.7228247, -0.779348, -2.764292, 1, 1, 1, 1, 1,
-0.7168751, -0.4745031, -1.834098, 1, 1, 1, 1, 1,
-0.7095954, -0.6030741, -3.77422, 1, 1, 1, 1, 1,
-0.7079248, 0.7706863, 0.8048815, 1, 1, 1, 1, 1,
-0.7062943, -1.164392, -1.851419, 1, 1, 1, 1, 1,
-0.7028291, 1.183598, -2.259303, 1, 1, 1, 1, 1,
-0.7017304, -0.2760212, -0.7477213, 1, 1, 1, 1, 1,
-0.6937415, 0.7437069, 1.296953, 1, 1, 1, 1, 1,
-0.6858504, -1.287455, -2.822417, 1, 1, 1, 1, 1,
-0.6840556, -1.510953, -1.488673, 1, 1, 1, 1, 1,
-0.6798854, -0.1561554, -1.81099, 0, 0, 1, 1, 1,
-0.6767383, 0.8402467, -1.714547, 1, 0, 0, 1, 1,
-0.6765421, 0.1497553, -2.105932, 1, 0, 0, 1, 1,
-0.6741341, 0.3214746, -0.3179091, 1, 0, 0, 1, 1,
-0.6732734, -0.3074503, -1.572331, 1, 0, 0, 1, 1,
-0.670293, -1.148645, -2.02038, 1, 0, 0, 1, 1,
-0.6697873, 0.05850099, -2.994818, 0, 0, 0, 1, 1,
-0.6697008, -0.5953909, -1.427, 0, 0, 0, 1, 1,
-0.667936, -1.356168, -2.690229, 0, 0, 0, 1, 1,
-0.6604519, -2.656699, -2.448199, 0, 0, 0, 1, 1,
-0.6579271, 1.468161, -0.8917679, 0, 0, 0, 1, 1,
-0.6576151, -0.1953757, 0.212775, 0, 0, 0, 1, 1,
-0.6537551, 0.4529085, -1.401816, 0, 0, 0, 1, 1,
-0.6533983, 0.2355973, -2.256043, 1, 1, 1, 1, 1,
-0.6513036, 0.3519002, 0.2187696, 1, 1, 1, 1, 1,
-0.6394545, 0.3508475, -1.391173, 1, 1, 1, 1, 1,
-0.6388716, 0.1026153, -2.215934, 1, 1, 1, 1, 1,
-0.6358782, -0.2703501, -2.443354, 1, 1, 1, 1, 1,
-0.6357371, 0.9198892, -0.100883, 1, 1, 1, 1, 1,
-0.6333449, 0.6513506, -0.3939546, 1, 1, 1, 1, 1,
-0.6327977, -1.59461, -3.110092, 1, 1, 1, 1, 1,
-0.6327272, 0.3796108, -0.09428456, 1, 1, 1, 1, 1,
-0.6281, -0.6661115, -4.099079, 1, 1, 1, 1, 1,
-0.6273301, -0.9963858, -0.2814527, 1, 1, 1, 1, 1,
-0.6268961, 0.6386364, 0.07237131, 1, 1, 1, 1, 1,
-0.6246642, -0.05414776, -2.692488, 1, 1, 1, 1, 1,
-0.6217515, 0.1752633, 0.008255644, 1, 1, 1, 1, 1,
-0.6207001, 1.216797, -0.2560195, 1, 1, 1, 1, 1,
-0.6205853, -0.1348488, -1.307554, 0, 0, 1, 1, 1,
-0.6192943, -0.7869037, -3.420738, 1, 0, 0, 1, 1,
-0.6117055, 0.3507477, 0.207997, 1, 0, 0, 1, 1,
-0.6064095, 1.597178, 0.009283729, 1, 0, 0, 1, 1,
-0.5993978, -0.02385812, 0.3522876, 1, 0, 0, 1, 1,
-0.599172, -0.964857, -2.324651, 1, 0, 0, 1, 1,
-0.5949253, 2.042283, 0.9561918, 0, 0, 0, 1, 1,
-0.5903748, -0.01727259, -2.611018, 0, 0, 0, 1, 1,
-0.5749683, 0.4259913, -1.838533, 0, 0, 0, 1, 1,
-0.5742159, 0.8736993, 0.2185301, 0, 0, 0, 1, 1,
-0.5722677, -0.0690273, -0.2521996, 0, 0, 0, 1, 1,
-0.5713556, 0.2915849, -2.551416, 0, 0, 0, 1, 1,
-0.5681514, -0.1192535, -2.08517, 0, 0, 0, 1, 1,
-0.5657427, 1.134773, -0.2196184, 1, 1, 1, 1, 1,
-0.5647086, 0.08044776, -2.895829, 1, 1, 1, 1, 1,
-0.5614684, -0.04396132, -2.814102, 1, 1, 1, 1, 1,
-0.5609902, 1.564679, -0.007361895, 1, 1, 1, 1, 1,
-0.5593359, 0.4071916, -0.8616008, 1, 1, 1, 1, 1,
-0.5571443, 0.07132795, -0.5461563, 1, 1, 1, 1, 1,
-0.5541309, -0.7412891, -2.264013, 1, 1, 1, 1, 1,
-0.5515714, -0.1486889, -0.9868132, 1, 1, 1, 1, 1,
-0.5443227, -0.2740383, -0.9933364, 1, 1, 1, 1, 1,
-0.5431248, 1.749852, -0.9823861, 1, 1, 1, 1, 1,
-0.5403771, -0.633413, -2.244991, 1, 1, 1, 1, 1,
-0.5313185, -0.6189979, -1.801879, 1, 1, 1, 1, 1,
-0.5266061, -0.06794232, -1.491586, 1, 1, 1, 1, 1,
-0.5256231, -0.5687507, -2.065647, 1, 1, 1, 1, 1,
-0.5250952, -0.1302664, -2.035302, 1, 1, 1, 1, 1,
-0.5111786, 0.7633113, -0.6399755, 0, 0, 1, 1, 1,
-0.5055926, 1.58964, -0.1869266, 1, 0, 0, 1, 1,
-0.5030369, 0.7694873, -0.643584, 1, 0, 0, 1, 1,
-0.5009478, 0.7201514, 0.2398893, 1, 0, 0, 1, 1,
-0.4992373, 0.8033174, 0.5563578, 1, 0, 0, 1, 1,
-0.4977861, 0.1316058, -1.804059, 1, 0, 0, 1, 1,
-0.4849249, -1.242004, -2.575466, 0, 0, 0, 1, 1,
-0.4794675, -0.1411356, -1.582884, 0, 0, 0, 1, 1,
-0.478436, 0.7080957, 0.9388626, 0, 0, 0, 1, 1,
-0.4769025, 0.04601179, -3.06096, 0, 0, 0, 1, 1,
-0.469794, -1.020469, -1.308105, 0, 0, 0, 1, 1,
-0.4688875, 0.1649501, -0.5597097, 0, 0, 0, 1, 1,
-0.4667397, -0.9400913, -1.631471, 0, 0, 0, 1, 1,
-0.4653684, 0.7364947, -1.162588, 1, 1, 1, 1, 1,
-0.462693, 1.506935, -2.129813, 1, 1, 1, 1, 1,
-0.4624064, -1.118611, -3.861806, 1, 1, 1, 1, 1,
-0.4606407, 0.04672404, -0.6771907, 1, 1, 1, 1, 1,
-0.4562457, -0.3337973, -0.8748907, 1, 1, 1, 1, 1,
-0.4561658, 1.105827, 0.9288502, 1, 1, 1, 1, 1,
-0.4517643, 0.7341408, 0.129964, 1, 1, 1, 1, 1,
-0.4504252, 0.02897002, -2.655485, 1, 1, 1, 1, 1,
-0.4454203, -1.22074, -4.264002, 1, 1, 1, 1, 1,
-0.4392779, -0.5655721, -1.272834, 1, 1, 1, 1, 1,
-0.4377161, 0.8704718, -1.013334, 1, 1, 1, 1, 1,
-0.4310547, -0.403249, -1.861319, 1, 1, 1, 1, 1,
-0.4289315, -0.6510995, -1.944338, 1, 1, 1, 1, 1,
-0.4279734, -1.434522, -4.523336, 1, 1, 1, 1, 1,
-0.4267943, -2.118621, -2.053357, 1, 1, 1, 1, 1,
-0.4260145, 0.9513734, 0.3211099, 0, 0, 1, 1, 1,
-0.4244705, 1.881287, 2.484028, 1, 0, 0, 1, 1,
-0.4220152, 0.3515927, 0.1478706, 1, 0, 0, 1, 1,
-0.4183283, 0.03892886, -1.599955, 1, 0, 0, 1, 1,
-0.4175312, 1.579567, -0.722947, 1, 0, 0, 1, 1,
-0.4168765, 1.124844, -1.176342, 1, 0, 0, 1, 1,
-0.4009183, -0.03397226, -2.492124, 0, 0, 0, 1, 1,
-0.3981512, -0.1340216, -1.859003, 0, 0, 0, 1, 1,
-0.3967852, -0.356564, -4.505966, 0, 0, 0, 1, 1,
-0.3961394, -0.5728062, -2.089273, 0, 0, 0, 1, 1,
-0.390626, 0.6977668, -1.439174, 0, 0, 0, 1, 1,
-0.3898471, -1.056157, -3.824375, 0, 0, 0, 1, 1,
-0.3879687, 0.01914254, -2.705117, 0, 0, 0, 1, 1,
-0.3879358, 0.8626777, -0.9367033, 1, 1, 1, 1, 1,
-0.3839256, -0.0779888, -1.647441, 1, 1, 1, 1, 1,
-0.3827905, 0.2299686, -0.04141349, 1, 1, 1, 1, 1,
-0.3822075, 1.4114, -0.6816754, 1, 1, 1, 1, 1,
-0.3813234, 1.752647, 0.217677, 1, 1, 1, 1, 1,
-0.3804301, 1.922442, -0.1743095, 1, 1, 1, 1, 1,
-0.380325, 0.3358448, -1.308957, 1, 1, 1, 1, 1,
-0.3799226, -1.61582, -2.311574, 1, 1, 1, 1, 1,
-0.3782401, -0.6068134, -1.077302, 1, 1, 1, 1, 1,
-0.3781736, 0.3948181, -0.3167867, 1, 1, 1, 1, 1,
-0.3704485, -0.4663252, -1.488307, 1, 1, 1, 1, 1,
-0.3683185, 0.3164071, -1.460258, 1, 1, 1, 1, 1,
-0.3659954, 2.212259, 1.59353, 1, 1, 1, 1, 1,
-0.3589407, 0.8932968, 1.027668, 1, 1, 1, 1, 1,
-0.351734, 0.9851649, 0.5230981, 1, 1, 1, 1, 1,
-0.3438696, 0.5523753, -1.339692, 0, 0, 1, 1, 1,
-0.3390015, 2.337662, 1.3464, 1, 0, 0, 1, 1,
-0.3366547, 0.4725707, -2.877087, 1, 0, 0, 1, 1,
-0.334572, 0.059839, -0.5070798, 1, 0, 0, 1, 1,
-0.3279872, -0.5143864, -3.859302, 1, 0, 0, 1, 1,
-0.3274887, -2.609059, -2.517603, 1, 0, 0, 1, 1,
-0.3252748, 2.778516, -0.2889235, 0, 0, 0, 1, 1,
-0.3236066, 0.004580195, -0.7453411, 0, 0, 0, 1, 1,
-0.3213699, 0.202032, -0.2883415, 0, 0, 0, 1, 1,
-0.3156932, -0.6726795, -1.71589, 0, 0, 0, 1, 1,
-0.3116234, 0.08528771, -1.211441, 0, 0, 0, 1, 1,
-0.3057781, -1.542796, -2.033972, 0, 0, 0, 1, 1,
-0.3052344, -2.052105, -3.849256, 0, 0, 0, 1, 1,
-0.3047491, 0.1492563, -1.33128, 1, 1, 1, 1, 1,
-0.3045509, 0.587493, -0.4456972, 1, 1, 1, 1, 1,
-0.3030555, -1.964309, -3.187817, 1, 1, 1, 1, 1,
-0.2985185, 0.3552822, 0.0688371, 1, 1, 1, 1, 1,
-0.2977729, -1.638468, -3.487974, 1, 1, 1, 1, 1,
-0.2973686, 0.3374296, -0.2064934, 1, 1, 1, 1, 1,
-0.2961544, -0.5043511, -3.009954, 1, 1, 1, 1, 1,
-0.2938451, -1.153487, -3.968428, 1, 1, 1, 1, 1,
-0.2927777, 0.2938108, -0.6732196, 1, 1, 1, 1, 1,
-0.2919884, 0.05059567, -0.2613873, 1, 1, 1, 1, 1,
-0.2865847, 0.8523945, -1.645604, 1, 1, 1, 1, 1,
-0.2863198, 0.6077313, 0.5758133, 1, 1, 1, 1, 1,
-0.2804136, -0.7294319, -3.075008, 1, 1, 1, 1, 1,
-0.2796302, -0.3641534, -3.788368, 1, 1, 1, 1, 1,
-0.2770886, 1.043363, -1.242679, 1, 1, 1, 1, 1,
-0.2764733, 0.153902, -0.4835788, 0, 0, 1, 1, 1,
-0.2755217, -0.207216, -3.26266, 1, 0, 0, 1, 1,
-0.2755111, 2.714644, -0.2568376, 1, 0, 0, 1, 1,
-0.273517, -0.01280595, -1.344118, 1, 0, 0, 1, 1,
-0.2701587, 0.3768837, -0.53255, 1, 0, 0, 1, 1,
-0.2649581, 0.2625573, -0.2661219, 1, 0, 0, 1, 1,
-0.2553546, 0.5775946, -1.159297, 0, 0, 0, 1, 1,
-0.2528234, -0.5625328, -2.744953, 0, 0, 0, 1, 1,
-0.2515115, -0.924538, -3.272445, 0, 0, 0, 1, 1,
-0.245368, 0.6651424, 0.1443464, 0, 0, 0, 1, 1,
-0.2384042, 0.8928062, 0.8768178, 0, 0, 0, 1, 1,
-0.2373705, 0.6384597, -1.93664, 0, 0, 0, 1, 1,
-0.2330491, 0.6349767, -0.4382071, 0, 0, 0, 1, 1,
-0.231265, 1.529333, 0.658649, 1, 1, 1, 1, 1,
-0.2311257, -0.39603, -1.410356, 1, 1, 1, 1, 1,
-0.2310052, 0.471808, -1.040072, 1, 1, 1, 1, 1,
-0.2265608, 0.02112695, -0.9647677, 1, 1, 1, 1, 1,
-0.2234056, 0.4214764, -1.507305, 1, 1, 1, 1, 1,
-0.2228335, -1.11474, -3.491058, 1, 1, 1, 1, 1,
-0.2176131, 0.9838854, -1.821022, 1, 1, 1, 1, 1,
-0.214348, -0.2323107, -3.821055, 1, 1, 1, 1, 1,
-0.2143214, 0.1573955, 0.858286, 1, 1, 1, 1, 1,
-0.2135934, 1.394819, 0.2966771, 1, 1, 1, 1, 1,
-0.2115897, -0.09794596, -2.275553, 1, 1, 1, 1, 1,
-0.2067206, -0.8387625, -2.890256, 1, 1, 1, 1, 1,
-0.2038199, 0.34372, -1.329387, 1, 1, 1, 1, 1,
-0.1954842, -0.2441175, -2.236359, 1, 1, 1, 1, 1,
-0.1952566, -0.1352892, -0.7257426, 1, 1, 1, 1, 1,
-0.1905982, 0.6626709, 0.3828825, 0, 0, 1, 1, 1,
-0.1879622, 0.2961076, -0.1958421, 1, 0, 0, 1, 1,
-0.1848855, 2.302253, 0.6897711, 1, 0, 0, 1, 1,
-0.1803966, -1.285142, -2.434396, 1, 0, 0, 1, 1,
-0.1747761, 1.058733, 0.03972535, 1, 0, 0, 1, 1,
-0.1690785, -1.459572, -4.110383, 1, 0, 0, 1, 1,
-0.1631971, -1.425431, -2.557676, 0, 0, 0, 1, 1,
-0.1594021, -1.017976, -2.375059, 0, 0, 0, 1, 1,
-0.1481731, -0.8505121, -3.894953, 0, 0, 0, 1, 1,
-0.1440631, 0.132824, -0.4023328, 0, 0, 0, 1, 1,
-0.1423858, 0.552375, 0.1092884, 0, 0, 0, 1, 1,
-0.1406483, -0.4588703, -2.409052, 0, 0, 0, 1, 1,
-0.1344864, 1.819678, 0.7037539, 0, 0, 0, 1, 1,
-0.1339367, -1.854026, -4.784596, 1, 1, 1, 1, 1,
-0.1318737, -0.6469575, -3.678376, 1, 1, 1, 1, 1,
-0.1277536, 0.1498507, 0.3196369, 1, 1, 1, 1, 1,
-0.1264312, 0.2691071, -1.001629, 1, 1, 1, 1, 1,
-0.125897, -0.5648285, -1.028659, 1, 1, 1, 1, 1,
-0.125406, 0.6119295, -0.7048382, 1, 1, 1, 1, 1,
-0.1244686, 0.04289161, -0.1774987, 1, 1, 1, 1, 1,
-0.1226448, 0.6896822, 0.1117176, 1, 1, 1, 1, 1,
-0.1198335, -0.7736726, -3.682755, 1, 1, 1, 1, 1,
-0.1197252, 0.9531282, -1.641296, 1, 1, 1, 1, 1,
-0.1139323, 0.8869754, 1.118442, 1, 1, 1, 1, 1,
-0.1120701, 0.6180496, 1.814922, 1, 1, 1, 1, 1,
-0.1119759, 0.89245, -0.8538539, 1, 1, 1, 1, 1,
-0.10728, 1.168105, 0.2087815, 1, 1, 1, 1, 1,
-0.1069215, 0.1311913, -0.6200038, 1, 1, 1, 1, 1,
-0.1067478, 0.2060923, -0.4288845, 0, 0, 1, 1, 1,
-0.1062463, -0.3322057, -1.876016, 1, 0, 0, 1, 1,
-0.1057033, 1.017215, -0.07169618, 1, 0, 0, 1, 1,
-0.1056518, 0.5808553, -1.180568, 1, 0, 0, 1, 1,
-0.105215, 0.5268135, -0.07830112, 1, 0, 0, 1, 1,
-0.1040579, -0.8965786, -1.918191, 1, 0, 0, 1, 1,
-0.1036505, -1.479345, -1.754177, 0, 0, 0, 1, 1,
-0.1026922, 1.144799, -0.385338, 0, 0, 0, 1, 1,
-0.1021778, -0.07496355, -1.683447, 0, 0, 0, 1, 1,
-0.1020135, -0.5769508, -1.090952, 0, 0, 0, 1, 1,
-0.09881375, -0.5343963, -5.203006, 0, 0, 0, 1, 1,
-0.09650982, -0.2257251, -3.287582, 0, 0, 0, 1, 1,
-0.09600415, -0.2854298, -2.412125, 0, 0, 0, 1, 1,
-0.09151469, -0.4086772, -3.182733, 1, 1, 1, 1, 1,
-0.08901105, 0.3590943, -0.8638033, 1, 1, 1, 1, 1,
-0.07289275, -0.410384, -2.817062, 1, 1, 1, 1, 1,
-0.06673157, -0.5908225, -4.117957, 1, 1, 1, 1, 1,
-0.06576429, 0.4439989, -1.033742, 1, 1, 1, 1, 1,
-0.065249, 1.153367, 0.8644537, 1, 1, 1, 1, 1,
-0.06524676, -0.177, -2.23612, 1, 1, 1, 1, 1,
-0.06465679, 0.4185599, 0.5366865, 1, 1, 1, 1, 1,
-0.06190178, -0.3088651, -2.11599, 1, 1, 1, 1, 1,
-0.0615622, -0.8032867, -3.159131, 1, 1, 1, 1, 1,
-0.06052443, -0.5918415, -2.105318, 1, 1, 1, 1, 1,
-0.05925489, 0.4785871, -0.9216241, 1, 1, 1, 1, 1,
-0.05789644, 0.5551738, -0.8562405, 1, 1, 1, 1, 1,
-0.05585102, -1.143178, -2.805782, 1, 1, 1, 1, 1,
-0.05584111, 1.234135, -1.347876, 1, 1, 1, 1, 1,
-0.05580443, -0.9922696, -4.361092, 0, 0, 1, 1, 1,
-0.05577838, 0.965287, -0.3350492, 1, 0, 0, 1, 1,
-0.05253022, 0.4631864, 1.686372, 1, 0, 0, 1, 1,
-0.05244072, -0.08158953, -2.648481, 1, 0, 0, 1, 1,
-0.05137487, -1.557654, -3.5395, 1, 0, 0, 1, 1,
-0.04977721, 1.714558, 0.3971071, 1, 0, 0, 1, 1,
-0.04977393, 0.5605054, 0.005581082, 0, 0, 0, 1, 1,
-0.04753834, 0.7985981, -1.121379, 0, 0, 0, 1, 1,
-0.0457043, -1.204976, -4.298429, 0, 0, 0, 1, 1,
-0.04461318, 0.7956737, -0.7494903, 0, 0, 0, 1, 1,
-0.04227444, -0.9414375, -2.598757, 0, 0, 0, 1, 1,
-0.03698066, 0.06478187, -0.6550309, 0, 0, 0, 1, 1,
-0.03697634, 0.2221248, -0.08022662, 0, 0, 0, 1, 1,
-0.03446306, -0.4437798, -2.351814, 1, 1, 1, 1, 1,
-0.03233642, 0.4472239, -1.197007, 1, 1, 1, 1, 1,
-0.03188431, 1.038524, -2.519497, 1, 1, 1, 1, 1,
-0.03176269, -0.9057934, -5.030913, 1, 1, 1, 1, 1,
-0.03059456, -0.1771256, -2.762357, 1, 1, 1, 1, 1,
-0.02751039, -1.469929, -3.568867, 1, 1, 1, 1, 1,
-0.02408269, 0.6865934, 1.429691, 1, 1, 1, 1, 1,
-0.02328258, 0.046785, -1.152635, 1, 1, 1, 1, 1,
-0.02282564, 0.3312392, 0.1296383, 1, 1, 1, 1, 1,
-0.01983561, -0.433326, -4.422318, 1, 1, 1, 1, 1,
-0.01754376, 0.7786433, 2.194293, 1, 1, 1, 1, 1,
-0.01664994, -0.08925613, -2.512681, 1, 1, 1, 1, 1,
-0.01611804, 1.356774, 0.7287545, 1, 1, 1, 1, 1,
-0.01140044, 0.2594951, -0.4797566, 1, 1, 1, 1, 1,
-0.008101803, -0.6916708, -2.8319, 1, 1, 1, 1, 1,
0.001310279, 2.197651, -0.1214427, 0, 0, 1, 1, 1,
0.004658287, -2.029133, 2.87059, 1, 0, 0, 1, 1,
0.004702445, 0.5919896, -0.47759, 1, 0, 0, 1, 1,
0.00640334, -0.952759, 2.177456, 1, 0, 0, 1, 1,
0.008698902, 0.07976206, 0.8099822, 1, 0, 0, 1, 1,
0.009118963, 0.174089, -0.05602817, 1, 0, 0, 1, 1,
0.01237971, -0.9434193, 5.260681, 0, 0, 0, 1, 1,
0.01644637, -0.8414968, 3.645745, 0, 0, 0, 1, 1,
0.01722517, 0.9120837, 0.3241209, 0, 0, 0, 1, 1,
0.01753222, -0.02279316, 1.862084, 0, 0, 0, 1, 1,
0.01958011, 0.4188794, -1.270968, 0, 0, 0, 1, 1,
0.02054775, 0.1075663, -0.3959362, 0, 0, 0, 1, 1,
0.02350176, 0.1145022, 0.8263848, 0, 0, 0, 1, 1,
0.02736847, -0.6460425, 3.525446, 1, 1, 1, 1, 1,
0.02763427, 2.014553, 0.5086078, 1, 1, 1, 1, 1,
0.02771181, -0.2324731, 2.36709, 1, 1, 1, 1, 1,
0.0311807, -0.7178749, 3.968804, 1, 1, 1, 1, 1,
0.03264475, 0.3769345, -1.314699, 1, 1, 1, 1, 1,
0.03426875, -0.3360573, 4.023387, 1, 1, 1, 1, 1,
0.03525129, -0.2329117, 3.56356, 1, 1, 1, 1, 1,
0.03598538, -1.462832, 2.725557, 1, 1, 1, 1, 1,
0.0404373, -0.46796, 3.306243, 1, 1, 1, 1, 1,
0.04370914, -1.166849, 2.880193, 1, 1, 1, 1, 1,
0.04540223, -0.9992242, 3.769616, 1, 1, 1, 1, 1,
0.04590027, -0.4158931, 3.433042, 1, 1, 1, 1, 1,
0.04736008, -0.3314235, 4.053127, 1, 1, 1, 1, 1,
0.04754256, -0.03188883, 2.567322, 1, 1, 1, 1, 1,
0.05004231, -1.464348, 2.742064, 1, 1, 1, 1, 1,
0.05071842, 0.4274921, 0.01715536, 0, 0, 1, 1, 1,
0.05213613, 0.05839632, 1.025537, 1, 0, 0, 1, 1,
0.05716246, 1.251326, -0.8536279, 1, 0, 0, 1, 1,
0.05742927, 1.169615, 0.4270546, 1, 0, 0, 1, 1,
0.05765491, 0.4131536, -1.259345, 1, 0, 0, 1, 1,
0.05966247, 0.569734, -0.541288, 1, 0, 0, 1, 1,
0.06451046, -0.1700617, 1.64071, 0, 0, 0, 1, 1,
0.06734984, 1.2622, -1.095457, 0, 0, 0, 1, 1,
0.06979489, -1.201248, 3.366936, 0, 0, 0, 1, 1,
0.07037673, -0.9818591, 1.481249, 0, 0, 0, 1, 1,
0.0714509, 1.146757, -0.514097, 0, 0, 0, 1, 1,
0.07593449, 0.7522286, -0.5341951, 0, 0, 0, 1, 1,
0.07917576, -0.05104926, 3.384665, 0, 0, 0, 1, 1,
0.08482076, 0.6878933, -1.467883, 1, 1, 1, 1, 1,
0.08488864, 0.5974112, -0.3112021, 1, 1, 1, 1, 1,
0.09019976, -0.2415598, 2.574955, 1, 1, 1, 1, 1,
0.09103871, 0.1011673, 2.851321, 1, 1, 1, 1, 1,
0.09273008, 0.5525396, 0.833735, 1, 1, 1, 1, 1,
0.09623304, 0.5901362, 0.4723896, 1, 1, 1, 1, 1,
0.09686954, -2.461234, 3.796878, 1, 1, 1, 1, 1,
0.09853191, -2.135501, 4.188359, 1, 1, 1, 1, 1,
0.103677, 1.58629, 0.5341516, 1, 1, 1, 1, 1,
0.1067578, -0.7344745, 3.791488, 1, 1, 1, 1, 1,
0.1095261, -1.352342, 3.948818, 1, 1, 1, 1, 1,
0.1105968, 1.492366, 0.5393173, 1, 1, 1, 1, 1,
0.116863, -0.3761166, 3.092602, 1, 1, 1, 1, 1,
0.1183168, -1.409893, 3.420132, 1, 1, 1, 1, 1,
0.121213, 0.9547443, 0.3330374, 1, 1, 1, 1, 1,
0.1245718, -0.5311651, 5.173579, 0, 0, 1, 1, 1,
0.1280294, -1.010214, 4.70153, 1, 0, 0, 1, 1,
0.1282443, 1.566624, -1.255477, 1, 0, 0, 1, 1,
0.1286876, -0.474139, 2.202566, 1, 0, 0, 1, 1,
0.1351874, 0.4637111, 0.9216211, 1, 0, 0, 1, 1,
0.1359828, 2.481131, -1.08785, 1, 0, 0, 1, 1,
0.1389665, 0.7905367, 0.2404937, 0, 0, 0, 1, 1,
0.1418306, -0.44698, 0.9510874, 0, 0, 0, 1, 1,
0.1470653, 1.749992, 0.7298945, 0, 0, 0, 1, 1,
0.1484472, 0.02943888, 1.701662, 0, 0, 0, 1, 1,
0.1491386, -0.2923429, 3.765549, 0, 0, 0, 1, 1,
0.1612824, -0.9490767, 1.700512, 0, 0, 0, 1, 1,
0.1619591, -0.06497071, 1.740953, 0, 0, 0, 1, 1,
0.1654261, -1.895298, 3.217847, 1, 1, 1, 1, 1,
0.1664011, 0.7532395, -0.4569304, 1, 1, 1, 1, 1,
0.1671306, 0.07016587, -0.4936332, 1, 1, 1, 1, 1,
0.1690716, 0.1643464, 1.20468, 1, 1, 1, 1, 1,
0.1693615, 1.733338, 0.9000693, 1, 1, 1, 1, 1,
0.1713843, 0.1190616, 0.5232518, 1, 1, 1, 1, 1,
0.1755778, -0.1820441, 1.171677, 1, 1, 1, 1, 1,
0.1761734, -0.5053391, 2.372509, 1, 1, 1, 1, 1,
0.1779085, -0.7777672, 5.265085, 1, 1, 1, 1, 1,
0.1865976, 1.164734, -0.4123989, 1, 1, 1, 1, 1,
0.1882298, -1.305343, 3.154196, 1, 1, 1, 1, 1,
0.192477, -1.258045, 3.139899, 1, 1, 1, 1, 1,
0.1973654, -0.02424796, 1.427069, 1, 1, 1, 1, 1,
0.2047961, 0.1701725, 1.50578, 1, 1, 1, 1, 1,
0.205895, 1.730372, -1.455851, 1, 1, 1, 1, 1,
0.2133231, 0.2112504, 0.4599761, 0, 0, 1, 1, 1,
0.2135718, 0.5501262, -0.5816789, 1, 0, 0, 1, 1,
0.2137495, -0.1916666, 1.501121, 1, 0, 0, 1, 1,
0.2187875, -1.954539, 3.97052, 1, 0, 0, 1, 1,
0.2208735, 0.9395546, 1.836738, 1, 0, 0, 1, 1,
0.2244585, -0.6502066, 3.478113, 1, 0, 0, 1, 1,
0.2264576, 0.5835005, -0.4540509, 0, 0, 0, 1, 1,
0.2375919, -0.216104, 2.373497, 0, 0, 0, 1, 1,
0.2404576, -0.2293969, 3.511589, 0, 0, 0, 1, 1,
0.250978, -0.6464682, 2.652767, 0, 0, 0, 1, 1,
0.2516184, 0.2782097, 1.494753, 0, 0, 0, 1, 1,
0.2517919, 0.4341113, -1.565125, 0, 0, 0, 1, 1,
0.2519074, 1.416809, 1.355663, 0, 0, 0, 1, 1,
0.2561247, -1.004263, 3.937556, 1, 1, 1, 1, 1,
0.2569293, -0.1259264, 2.080934, 1, 1, 1, 1, 1,
0.259596, 3.005054, 0.3603535, 1, 1, 1, 1, 1,
0.2644424, -0.9122257, 2.314873, 1, 1, 1, 1, 1,
0.2762555, 0.7000071, 0.8335134, 1, 1, 1, 1, 1,
0.2781878, 0.8103572, 2.514013, 1, 1, 1, 1, 1,
0.2808246, 0.3488882, 0.3951707, 1, 1, 1, 1, 1,
0.2823417, 1.461707, -0.7815284, 1, 1, 1, 1, 1,
0.2829489, 0.8086167, -0.4758235, 1, 1, 1, 1, 1,
0.2837976, 0.1632005, 1.639336, 1, 1, 1, 1, 1,
0.2842329, 0.3740564, -0.3138196, 1, 1, 1, 1, 1,
0.2852342, 0.7493269, 0.09993215, 1, 1, 1, 1, 1,
0.2881748, 0.2899187, 0.5603899, 1, 1, 1, 1, 1,
0.2902319, 0.4258768, 2.8455, 1, 1, 1, 1, 1,
0.2911887, 0.5282932, -0.1901403, 1, 1, 1, 1, 1,
0.2913415, -1.486348, 3.386026, 0, 0, 1, 1, 1,
0.2921351, 1.179723, 0.8633971, 1, 0, 0, 1, 1,
0.2959671, 0.3354184, 1.676389, 1, 0, 0, 1, 1,
0.2962014, -0.1310077, 3.77367, 1, 0, 0, 1, 1,
0.296279, -0.6032696, 4.089438, 1, 0, 0, 1, 1,
0.2999761, 0.4708864, -0.7204822, 1, 0, 0, 1, 1,
0.3000298, -0.1336609, 2.073083, 0, 0, 0, 1, 1,
0.3022014, -0.3376023, 1.32565, 0, 0, 0, 1, 1,
0.3023517, 0.9594565, 1.363213, 0, 0, 0, 1, 1,
0.3057549, -0.4803734, 0.7260113, 0, 0, 0, 1, 1,
0.3095916, -0.3478769, 2.379943, 0, 0, 0, 1, 1,
0.3177738, -0.7956475, 3.906882, 0, 0, 0, 1, 1,
0.3240636, -0.6115277, 3.667909, 0, 0, 0, 1, 1,
0.324761, 0.3885539, 2.077887, 1, 1, 1, 1, 1,
0.3304964, 0.47767, 1.666226, 1, 1, 1, 1, 1,
0.3310188, -1.194756, 3.355273, 1, 1, 1, 1, 1,
0.3325355, 0.3611499, 1.984936, 1, 1, 1, 1, 1,
0.3339881, -1.0135, 4.073751, 1, 1, 1, 1, 1,
0.3383337, -0.5246384, 2.201775, 1, 1, 1, 1, 1,
0.339413, 0.2846319, 0.3117104, 1, 1, 1, 1, 1,
0.3415708, -0.1496277, 1.585025, 1, 1, 1, 1, 1,
0.3453209, 0.6570568, 0.6862816, 1, 1, 1, 1, 1,
0.3468357, -1.342734, 1.248921, 1, 1, 1, 1, 1,
0.3471198, -1.023211, 3.581812, 1, 1, 1, 1, 1,
0.3474562, -1.93765, 4.431038, 1, 1, 1, 1, 1,
0.347758, -0.5813154, 2.737848, 1, 1, 1, 1, 1,
0.3495987, -3.33525, 3.183608, 1, 1, 1, 1, 1,
0.3511082, 1.060343, -0.979594, 1, 1, 1, 1, 1,
0.3515568, -0.1305571, 1.509187, 0, 0, 1, 1, 1,
0.3544734, 0.6360573, 0.5289891, 1, 0, 0, 1, 1,
0.3606553, -1.255075, 2.558739, 1, 0, 0, 1, 1,
0.3611369, 0.4275365, 1.205268, 1, 0, 0, 1, 1,
0.367651, -1.458003, 3.607505, 1, 0, 0, 1, 1,
0.3697929, 0.4392438, -0.05705591, 1, 0, 0, 1, 1,
0.3807037, 0.1071059, 1.066186, 0, 0, 0, 1, 1,
0.3816364, -1.508954, 1.627153, 0, 0, 0, 1, 1,
0.38876, 0.683353, -0.7566896, 0, 0, 0, 1, 1,
0.3901522, 0.9064839, 1.721895, 0, 0, 0, 1, 1,
0.3904791, 0.9087438, 0.6052954, 0, 0, 0, 1, 1,
0.3965504, 0.4528944, 2.0115, 0, 0, 0, 1, 1,
0.39668, -0.1243507, 3.266252, 0, 0, 0, 1, 1,
0.3976655, 0.9751792, 2.311826, 1, 1, 1, 1, 1,
0.398014, 0.4821921, 0.6186722, 1, 1, 1, 1, 1,
0.3980522, 1.147355, 1.033036, 1, 1, 1, 1, 1,
0.3987625, 0.8322358, 0.2499349, 1, 1, 1, 1, 1,
0.399585, 0.4812647, -1.069061, 1, 1, 1, 1, 1,
0.4057375, -0.9628673, 3.244099, 1, 1, 1, 1, 1,
0.4075836, 1.678035, 2.090091, 1, 1, 1, 1, 1,
0.4078865, 0.4089051, -1.476248, 1, 1, 1, 1, 1,
0.4103035, 1.418616, -0.01254919, 1, 1, 1, 1, 1,
0.4108002, 0.9525648, 0.9272778, 1, 1, 1, 1, 1,
0.4116537, 0.2096728, -0.3162885, 1, 1, 1, 1, 1,
0.4157789, 0.4328164, 0.08721252, 1, 1, 1, 1, 1,
0.4168477, 0.3356395, -0.02794472, 1, 1, 1, 1, 1,
0.4176153, 2.648221, 0.1711471, 1, 1, 1, 1, 1,
0.4184959, 1.148103, 0.271968, 1, 1, 1, 1, 1,
0.4216273, -0.8443605, 2.294961, 0, 0, 1, 1, 1,
0.4246483, 1.550128, 1.184067, 1, 0, 0, 1, 1,
0.4250813, 0.7090803, -0.5675707, 1, 0, 0, 1, 1,
0.430303, 1.193814, 0.4862048, 1, 0, 0, 1, 1,
0.4349223, -1.466336, 2.701538, 1, 0, 0, 1, 1,
0.4360342, -2.412281, 2.329261, 1, 0, 0, 1, 1,
0.4416653, 1.998119, 2.296088, 0, 0, 0, 1, 1,
0.4462135, 0.9408596, 0.7013134, 0, 0, 0, 1, 1,
0.4495656, -0.5556044, 1.841401, 0, 0, 0, 1, 1,
0.4534461, 0.8238111, -0.07023705, 0, 0, 0, 1, 1,
0.4579489, 1.320281, 0.02236955, 0, 0, 0, 1, 1,
0.4604066, -0.5959762, 2.448398, 0, 0, 0, 1, 1,
0.4609214, -0.03256853, 1.30711, 0, 0, 0, 1, 1,
0.4632312, -0.3217251, 2.16351, 1, 1, 1, 1, 1,
0.4643741, 1.479961, 1.121124, 1, 1, 1, 1, 1,
0.4643859, 0.5054529, 0.02991513, 1, 1, 1, 1, 1,
0.4658172, 0.1868059, 1.548974, 1, 1, 1, 1, 1,
0.4687425, -0.217829, 0.8859806, 1, 1, 1, 1, 1,
0.4722945, 0.4136937, 1.521796, 1, 1, 1, 1, 1,
0.4742158, -0.07925346, 1.808954, 1, 1, 1, 1, 1,
0.4809389, -1.098642, 1.23683, 1, 1, 1, 1, 1,
0.4863352, 0.8087401, 0.2513717, 1, 1, 1, 1, 1,
0.4863554, 0.9215242, 0.9057453, 1, 1, 1, 1, 1,
0.4925305, -0.4561272, 3.911294, 1, 1, 1, 1, 1,
0.4936161, 1.253141, 0.5880435, 1, 1, 1, 1, 1,
0.4939925, -1.399943, 1.95655, 1, 1, 1, 1, 1,
0.502873, -0.1012386, 1.97311, 1, 1, 1, 1, 1,
0.5116975, -0.1159279, 1.020837, 1, 1, 1, 1, 1,
0.5153102, 0.05675441, 1.635496, 0, 0, 1, 1, 1,
0.516938, -0.6791174, 3.33147, 1, 0, 0, 1, 1,
0.517051, -1.926192, 4.176406, 1, 0, 0, 1, 1,
0.5215605, -1.026846, 1.472476, 1, 0, 0, 1, 1,
0.5221106, -1.782368, 4.461468, 1, 0, 0, 1, 1,
0.523303, -0.3650593, 2.077205, 1, 0, 0, 1, 1,
0.5233215, -0.4748212, 2.830288, 0, 0, 0, 1, 1,
0.523999, 1.227225, -0.243929, 0, 0, 0, 1, 1,
0.5273618, 0.6532025, 1.700533, 0, 0, 0, 1, 1,
0.5299237, -1.118197, 2.743928, 0, 0, 0, 1, 1,
0.5307714, -0.1925496, 1.397996, 0, 0, 0, 1, 1,
0.5368321, -0.6441679, 1.501396, 0, 0, 0, 1, 1,
0.5408824, 0.3332921, 1.730277, 0, 0, 0, 1, 1,
0.5440139, 0.1284474, 0.9535558, 1, 1, 1, 1, 1,
0.5474741, -2.143015, 3.875388, 1, 1, 1, 1, 1,
0.5491009, 0.5800265, 1.070851, 1, 1, 1, 1, 1,
0.5529831, -0.9248556, 1.296214, 1, 1, 1, 1, 1,
0.553035, 0.4486203, 1.003361, 1, 1, 1, 1, 1,
0.5566134, 1.332778, 0.1971014, 1, 1, 1, 1, 1,
0.5585281, 1.64634, 0.3220111, 1, 1, 1, 1, 1,
0.5680408, 0.646666, -0.7964158, 1, 1, 1, 1, 1,
0.5761299, -1.035297, 3.620596, 1, 1, 1, 1, 1,
0.5763743, 2.11649, 1.208529, 1, 1, 1, 1, 1,
0.5765109, 1.382927, 0.491423, 1, 1, 1, 1, 1,
0.5793684, -0.1535649, 3.93892, 1, 1, 1, 1, 1,
0.5827935, 1.042061, -0.8554856, 1, 1, 1, 1, 1,
0.584893, -0.3323562, 1.586315, 1, 1, 1, 1, 1,
0.5861076, 0.6953239, -0.2820866, 1, 1, 1, 1, 1,
0.588482, 0.6711605, 1.302661, 0, 0, 1, 1, 1,
0.598179, 3.029284, -0.4428621, 1, 0, 0, 1, 1,
0.5996869, 1.552878, 0.421811, 1, 0, 0, 1, 1,
0.6034274, 1.648041, 0.6601402, 1, 0, 0, 1, 1,
0.6048488, 0.6228032, -0.263607, 1, 0, 0, 1, 1,
0.6051807, -0.2616189, 1.018526, 1, 0, 0, 1, 1,
0.6068403, -0.6978045, 3.349338, 0, 0, 0, 1, 1,
0.6077085, 0.1254581, 2.276137, 0, 0, 0, 1, 1,
0.6081832, 0.7190397, 0.3053106, 0, 0, 0, 1, 1,
0.609707, 1.323931, -0.4050813, 0, 0, 0, 1, 1,
0.6108133, 0.5611642, 0.07880536, 0, 0, 0, 1, 1,
0.6146033, 0.113815, 1.937467, 0, 0, 0, 1, 1,
0.6151005, -0.7534842, 4.161864, 0, 0, 0, 1, 1,
0.618363, 0.165617, 2.217691, 1, 1, 1, 1, 1,
0.6196973, -1.49814, 4.421831, 1, 1, 1, 1, 1,
0.6205521, 0.5084674, 1.697012, 1, 1, 1, 1, 1,
0.6209174, -0.9122484, 2.942369, 1, 1, 1, 1, 1,
0.6240774, 0.8968877, -0.7674131, 1, 1, 1, 1, 1,
0.6259974, -0.1752701, 1.66219, 1, 1, 1, 1, 1,
0.6269796, 0.9628907, 0.2487751, 1, 1, 1, 1, 1,
0.6278776, 0.4713279, 1.092882, 1, 1, 1, 1, 1,
0.628756, 0.1421579, 2.011811, 1, 1, 1, 1, 1,
0.6472076, -0.2827676, 3.36173, 1, 1, 1, 1, 1,
0.6488511, 1.238104, 2.148614, 1, 1, 1, 1, 1,
0.6494762, 0.3033769, 1.058452, 1, 1, 1, 1, 1,
0.6513915, 0.3677598, 1.54444, 1, 1, 1, 1, 1,
0.6521831, -0.2527139, 2.090776, 1, 1, 1, 1, 1,
0.6526788, 0.6768587, 0.1354391, 1, 1, 1, 1, 1,
0.6528736, 0.7771094, -0.8678241, 0, 0, 1, 1, 1,
0.6571603, -0.3884293, 1.696942, 1, 0, 0, 1, 1,
0.6580327, -0.7219619, 1.48358, 1, 0, 0, 1, 1,
0.6581841, 0.5817337, -0.03598602, 1, 0, 0, 1, 1,
0.6621972, 2.167616, 2.399439, 1, 0, 0, 1, 1,
0.6636761, -1.186141, 2.590377, 1, 0, 0, 1, 1,
0.6673338, 1.456724, -0.6106035, 0, 0, 0, 1, 1,
0.6698005, -0.8337092, 1.441716, 0, 0, 0, 1, 1,
0.6699101, 0.8050181, 0.2611334, 0, 0, 0, 1, 1,
0.6730492, -0.3935097, 1.201577, 0, 0, 0, 1, 1,
0.6763336, -0.4034171, 0.7073122, 0, 0, 0, 1, 1,
0.6764339, -0.02325093, 0.18279, 0, 0, 0, 1, 1,
0.6766804, 0.2358874, 1.641018, 0, 0, 0, 1, 1,
0.6801671, 0.5774378, 0.7660733, 1, 1, 1, 1, 1,
0.6815186, 0.2111343, 0.439767, 1, 1, 1, 1, 1,
0.6893743, -0.8856267, 1.361211, 1, 1, 1, 1, 1,
0.6895641, 0.01811485, 2.076941, 1, 1, 1, 1, 1,
0.6914164, 1.966919, 0.8935947, 1, 1, 1, 1, 1,
0.6929991, 0.1780535, 0.1319626, 1, 1, 1, 1, 1,
0.6934676, -0.1821377, 1.996881, 1, 1, 1, 1, 1,
0.695061, -0.7207758, 2.616104, 1, 1, 1, 1, 1,
0.6962292, -2.093652, 2.158763, 1, 1, 1, 1, 1,
0.6974449, -0.3646217, 1.483437, 1, 1, 1, 1, 1,
0.6978298, 0.6231882, 2.449204, 1, 1, 1, 1, 1,
0.6990538, 0.6009238, 1.739612, 1, 1, 1, 1, 1,
0.7070149, 0.1098724, -0.2231781, 1, 1, 1, 1, 1,
0.7075464, 3.493051, -0.6908324, 1, 1, 1, 1, 1,
0.7077331, 0.3491236, 2.150633, 1, 1, 1, 1, 1,
0.7093378, 0.5274622, 2.107779, 0, 0, 1, 1, 1,
0.7096431, -0.668389, 2.834027, 1, 0, 0, 1, 1,
0.7105138, -1.433117, 3.101322, 1, 0, 0, 1, 1,
0.712102, 1.849957, 0.7558857, 1, 0, 0, 1, 1,
0.7163273, 1.151244, -0.3552167, 1, 0, 0, 1, 1,
0.7170383, -1.736822, 1.663646, 1, 0, 0, 1, 1,
0.7187269, 1.51669, 1.213961, 0, 0, 0, 1, 1,
0.7198872, 1.223338, 0.8534334, 0, 0, 0, 1, 1,
0.7204707, -2.0032, 1.342064, 0, 0, 0, 1, 1,
0.722883, -0.6334789, 2.853472, 0, 0, 0, 1, 1,
0.7242799, 0.08737818, 1.548419, 0, 0, 0, 1, 1,
0.726281, 0.6833248, 1.86761, 0, 0, 0, 1, 1,
0.731713, -2.201159, 1.876954, 0, 0, 0, 1, 1,
0.7321314, 0.4467513, 0.1879474, 1, 1, 1, 1, 1,
0.7418965, -1.057302, 2.326053, 1, 1, 1, 1, 1,
0.7456784, 0.7438665, 0.1712177, 1, 1, 1, 1, 1,
0.7458456, -0.6127189, 2.863906, 1, 1, 1, 1, 1,
0.750462, -1.585254, 2.848803, 1, 1, 1, 1, 1,
0.7511813, 1.008555, -0.6437255, 1, 1, 1, 1, 1,
0.7542689, -0.722918, 3.607619, 1, 1, 1, 1, 1,
0.7587608, -0.5200655, 4.518719, 1, 1, 1, 1, 1,
0.7591625, -0.2522905, 4.083776, 1, 1, 1, 1, 1,
0.7638268, -0.3471628, 2.744875, 1, 1, 1, 1, 1,
0.7647578, -0.203082, 1.397936, 1, 1, 1, 1, 1,
0.7671221, -1.79161, 2.439811, 1, 1, 1, 1, 1,
0.7687372, 0.1873531, 0.5888007, 1, 1, 1, 1, 1,
0.7694967, 0.08953082, 2.736522, 1, 1, 1, 1, 1,
0.7744092, -0.8286985, 1.701712, 1, 1, 1, 1, 1,
0.7781755, -0.9113028, 2.466231, 0, 0, 1, 1, 1,
0.7821128, 0.6719795, 0.9093551, 1, 0, 0, 1, 1,
0.7863544, -0.1226698, 2.657192, 1, 0, 0, 1, 1,
0.7866131, -1.28646, 2.431033, 1, 0, 0, 1, 1,
0.7870416, 0.5486861, -0.7939745, 1, 0, 0, 1, 1,
0.7916077, 0.4458387, 2.69691, 1, 0, 0, 1, 1,
0.7937633, 0.1910767, 2.37412, 0, 0, 0, 1, 1,
0.7941994, 0.4977608, 2.42753, 0, 0, 0, 1, 1,
0.7942069, -1.384369, 2.946767, 0, 0, 0, 1, 1,
0.8033644, -0.8981315, 3.409889, 0, 0, 0, 1, 1,
0.8039674, -0.2579121, 2.595331, 0, 0, 0, 1, 1,
0.8173944, -0.1638422, 0.398693, 0, 0, 0, 1, 1,
0.8218983, 1.15543, 1.714375, 0, 0, 0, 1, 1,
0.8254532, 0.4113827, 2.37819, 1, 1, 1, 1, 1,
0.8268863, -0.940163, 1.12856, 1, 1, 1, 1, 1,
0.8269579, -0.6228995, 4.480501, 1, 1, 1, 1, 1,
0.8306624, 1.661402, 0.2209059, 1, 1, 1, 1, 1,
0.831208, 0.1939005, 2.976933, 1, 1, 1, 1, 1,
0.8322223, -0.6171604, 0.7247923, 1, 1, 1, 1, 1,
0.8350985, -2.231543, 0.3537605, 1, 1, 1, 1, 1,
0.8367991, -0.2976969, 2.181086, 1, 1, 1, 1, 1,
0.8387823, -0.4748404, 3.017829, 1, 1, 1, 1, 1,
0.8415633, 2.556174, 0.5672497, 1, 1, 1, 1, 1,
0.8443777, 0.6001756, 1.274419, 1, 1, 1, 1, 1,
0.8481215, 0.08977294, 1.427073, 1, 1, 1, 1, 1,
0.872583, 0.7221435, 0.7135531, 1, 1, 1, 1, 1,
0.8741215, 0.7889306, 0.7947349, 1, 1, 1, 1, 1,
0.8756961, -0.07736547, 1.040023, 1, 1, 1, 1, 1,
0.8817672, -0.1685847, 2.778828, 0, 0, 1, 1, 1,
0.8818763, -1.118459, 0.7217029, 1, 0, 0, 1, 1,
0.8869289, 1.320848, 1.724194, 1, 0, 0, 1, 1,
0.8943874, 1.06318, 1.545337, 1, 0, 0, 1, 1,
0.8953607, -0.7093464, 4.453017, 1, 0, 0, 1, 1,
0.898542, -0.1195039, 2.424359, 1, 0, 0, 1, 1,
0.8997299, 0.7489223, 1.43289, 0, 0, 0, 1, 1,
0.9035871, 0.8066197, 0.7783645, 0, 0, 0, 1, 1,
0.9037815, 0.02383259, -0.06221087, 0, 0, 0, 1, 1,
0.9096885, 0.5267071, 0.4306893, 0, 0, 0, 1, 1,
0.9128878, -0.8513399, 1.773188, 0, 0, 0, 1, 1,
0.9142668, -0.8192464, 4.746871, 0, 0, 0, 1, 1,
0.9180318, -0.01034845, 1.764145, 0, 0, 0, 1, 1,
0.9267424, -0.7055125, 2.688744, 1, 1, 1, 1, 1,
0.9378988, -1.998791, 0.8889892, 1, 1, 1, 1, 1,
0.9461485, 0.3053975, 1.163303, 1, 1, 1, 1, 1,
0.9502208, -0.5626194, 1.344278, 1, 1, 1, 1, 1,
0.9509531, 1.290639, 2.295134, 1, 1, 1, 1, 1,
0.9546655, 1.845352, -0.1507355, 1, 1, 1, 1, 1,
0.9662458, -0.3849102, 2.439835, 1, 1, 1, 1, 1,
0.9691011, 1.269178, 1.31482, 1, 1, 1, 1, 1,
0.9691707, -0.6491758, 3.376682, 1, 1, 1, 1, 1,
0.9744605, 2.318468, 0.07374585, 1, 1, 1, 1, 1,
0.9751147, -1.081165, 1.316127, 1, 1, 1, 1, 1,
0.9788634, 0.639439, 1.180952, 1, 1, 1, 1, 1,
0.9813054, 0.7683618, 2.514925, 1, 1, 1, 1, 1,
0.9819415, -0.6729627, 1.617151, 1, 1, 1, 1, 1,
0.982289, -0.04718491, 1.894058, 1, 1, 1, 1, 1,
0.9845465, 1.008515, 2.046851, 0, 0, 1, 1, 1,
0.9884251, -0.5529262, 0.5531793, 1, 0, 0, 1, 1,
0.988816, 0.1100362, 0.9658444, 1, 0, 0, 1, 1,
0.9929849, -1.124485, 1.704777, 1, 0, 0, 1, 1,
1.003845, 0.07613263, 0.1536692, 1, 0, 0, 1, 1,
1.010383, 0.5669967, 2.159524, 1, 0, 0, 1, 1,
1.010866, -1.119298, 2.608329, 0, 0, 0, 1, 1,
1.011874, -0.3967658, 1.99893, 0, 0, 0, 1, 1,
1.013443, -1.153011, 3.330642, 0, 0, 0, 1, 1,
1.02075, 0.08704247, 2.623809, 0, 0, 0, 1, 1,
1.023387, 0.05592856, 0.4973606, 0, 0, 0, 1, 1,
1.028038, 0.5871752, 1.804611, 0, 0, 0, 1, 1,
1.028781, 0.5182011, 0.9172744, 0, 0, 0, 1, 1,
1.033313, 0.1539997, 0.3996713, 1, 1, 1, 1, 1,
1.036796, -2.028962, 1.558425, 1, 1, 1, 1, 1,
1.039735, -1.029269, 3.513735, 1, 1, 1, 1, 1,
1.041121, 1.241826, 1.140971, 1, 1, 1, 1, 1,
1.046217, 1.602885, -0.05933681, 1, 1, 1, 1, 1,
1.062037, 0.7714558, -0.7646257, 1, 1, 1, 1, 1,
1.070498, -0.02321881, 2.211669, 1, 1, 1, 1, 1,
1.070789, -0.07511947, 1.282503, 1, 1, 1, 1, 1,
1.080148, -0.9875104, 0.5806682, 1, 1, 1, 1, 1,
1.080857, 0.8787385, 0.2190456, 1, 1, 1, 1, 1,
1.08761, 0.03496098, 2.390631, 1, 1, 1, 1, 1,
1.099798, -0.2774503, 2.261471, 1, 1, 1, 1, 1,
1.105365, 0.3892221, 2.774346, 1, 1, 1, 1, 1,
1.118711, -0.1957877, 3.363668, 1, 1, 1, 1, 1,
1.12732, 1.399896, -0.3179024, 1, 1, 1, 1, 1,
1.129381, -0.1931394, 2.382328, 0, 0, 1, 1, 1,
1.132994, 0.4191027, 1.804102, 1, 0, 0, 1, 1,
1.133533, -0.1571747, 0.323206, 1, 0, 0, 1, 1,
1.134122, -1.12937, 2.919578, 1, 0, 0, 1, 1,
1.139747, 0.7109343, -1.1067, 1, 0, 0, 1, 1,
1.146983, 0.1674667, 2.148054, 1, 0, 0, 1, 1,
1.157157, 0.4593958, 1.791221, 0, 0, 0, 1, 1,
1.163834, 0.4527934, -0.6691312, 0, 0, 0, 1, 1,
1.165323, 1.360514, 1.788779, 0, 0, 0, 1, 1,
1.166556, 1.746271, -0.5905516, 0, 0, 0, 1, 1,
1.167158, 1.581256, 0.0655193, 0, 0, 0, 1, 1,
1.169198, -0.7699649, 3.630604, 0, 0, 0, 1, 1,
1.171891, 0.04200863, 0.6589571, 0, 0, 0, 1, 1,
1.181, 1.595529, 0.2019499, 1, 1, 1, 1, 1,
1.183168, 0.6533585, 1.090836, 1, 1, 1, 1, 1,
1.185065, -0.04090514, 0.4012643, 1, 1, 1, 1, 1,
1.18753, -1.525304, 3.194674, 1, 1, 1, 1, 1,
1.193017, 0.971801, -0.540665, 1, 1, 1, 1, 1,
1.195442, 0.08783421, 1.956402, 1, 1, 1, 1, 1,
1.198428, 0.2247401, 1.586604, 1, 1, 1, 1, 1,
1.210694, 1.198841, -0.2358716, 1, 1, 1, 1, 1,
1.21686, 0.4675851, 0.6439933, 1, 1, 1, 1, 1,
1.21872, 0.1629306, 1.313162, 1, 1, 1, 1, 1,
1.22212, -0.2804333, 2.467227, 1, 1, 1, 1, 1,
1.22895, 0.3039441, 3.289835, 1, 1, 1, 1, 1,
1.237587, -0.3154175, 2.873017, 1, 1, 1, 1, 1,
1.248394, 0.3133107, 3.142899, 1, 1, 1, 1, 1,
1.254915, -0.03578188, 2.33338, 1, 1, 1, 1, 1,
1.273506, 2.441035, 1.604948, 0, 0, 1, 1, 1,
1.276011, -0.1503846, 0.2996459, 1, 0, 0, 1, 1,
1.276711, 0.3202277, 0.6179472, 1, 0, 0, 1, 1,
1.280956, 0.7140489, 0.4619404, 1, 0, 0, 1, 1,
1.281665, -0.3466505, 0.923934, 1, 0, 0, 1, 1,
1.290664, 0.6586059, 2.688703, 1, 0, 0, 1, 1,
1.307431, -2.364837, 2.010576, 0, 0, 0, 1, 1,
1.31288, 1.574775, -0.5541124, 0, 0, 0, 1, 1,
1.316726, 1.83095, 1.118112, 0, 0, 0, 1, 1,
1.320071, -0.5830752, 2.521271, 0, 0, 0, 1, 1,
1.348369, 0.3640026, 2.592942, 0, 0, 0, 1, 1,
1.364247, 0.2054095, 2.464376, 0, 0, 0, 1, 1,
1.366516, 0.8697496, 1.32146, 0, 0, 0, 1, 1,
1.380447, -0.04775395, 2.204306, 1, 1, 1, 1, 1,
1.38087, -1.68264, 2.403594, 1, 1, 1, 1, 1,
1.397506, -0.04548067, 1.827972, 1, 1, 1, 1, 1,
1.397557, -1.006778, 2.939366, 1, 1, 1, 1, 1,
1.399535, 0.5422305, -0.8070404, 1, 1, 1, 1, 1,
1.402042, 1.147577, -0.5552296, 1, 1, 1, 1, 1,
1.409188, 0.4022611, 1.300466, 1, 1, 1, 1, 1,
1.41083, -0.2014592, -0.3852001, 1, 1, 1, 1, 1,
1.426104, 0.532016, 0.5263997, 1, 1, 1, 1, 1,
1.438488, -1.209579, 1.850305, 1, 1, 1, 1, 1,
1.439005, -2.280917, 2.676272, 1, 1, 1, 1, 1,
1.442473, 1.114182, 1.262587, 1, 1, 1, 1, 1,
1.459376, 0.7752638, 0.339779, 1, 1, 1, 1, 1,
1.46397, 0.7024009, -0.143909, 1, 1, 1, 1, 1,
1.498978, 0.09674487, 1.561999, 1, 1, 1, 1, 1,
1.50031, 1.988931, 2.697912, 0, 0, 1, 1, 1,
1.50507, 0.5389692, 0.2137273, 1, 0, 0, 1, 1,
1.506068, 0.8969809, 3.884015, 1, 0, 0, 1, 1,
1.514325, 0.8546059, 1.364422, 1, 0, 0, 1, 1,
1.518605, -1.09364, 3.522027, 1, 0, 0, 1, 1,
1.524183, 0.1981098, 2.468079, 1, 0, 0, 1, 1,
1.525694, 0.1962496, 0.9538867, 0, 0, 0, 1, 1,
1.544957, 0.1101237, 0.09624317, 0, 0, 0, 1, 1,
1.56463, -1.713247, 1.156716, 0, 0, 0, 1, 1,
1.571544, -0.8032892, 0.4429694, 0, 0, 0, 1, 1,
1.581772, -0.03255056, 2.458697, 0, 0, 0, 1, 1,
1.593097, -1.049458, 3.128913, 0, 0, 0, 1, 1,
1.595066, 0.6670596, 1.271625, 0, 0, 0, 1, 1,
1.607438, -1.692414, 1.551334, 1, 1, 1, 1, 1,
1.608659, -0.7021196, 2.224784, 1, 1, 1, 1, 1,
1.609693, -0.03853429, 2.861907, 1, 1, 1, 1, 1,
1.611797, -0.03163772, 1.057812, 1, 1, 1, 1, 1,
1.618593, -0.5936232, 2.084205, 1, 1, 1, 1, 1,
1.619473, 0.2422851, 0.4407742, 1, 1, 1, 1, 1,
1.629101, -0.8312548, 2.939588, 1, 1, 1, 1, 1,
1.631051, 1.112937, -0.8649922, 1, 1, 1, 1, 1,
1.641292, -0.06710943, 0.9506811, 1, 1, 1, 1, 1,
1.641305, -0.411111, 0.1518025, 1, 1, 1, 1, 1,
1.641794, 0.5535659, 0.8251822, 1, 1, 1, 1, 1,
1.645012, -0.01045494, 0.5164401, 1, 1, 1, 1, 1,
1.653838, -0.7469335, 1.838515, 1, 1, 1, 1, 1,
1.654427, 0.9969013, 1.045435, 1, 1, 1, 1, 1,
1.658003, -0.9998116, 2.320871, 1, 1, 1, 1, 1,
1.67353, 0.8883421, 1.305019, 0, 0, 1, 1, 1,
1.674338, 1.383773, 1.652257, 1, 0, 0, 1, 1,
1.67641, 0.2882473, -0.704455, 1, 0, 0, 1, 1,
1.681816, -0.5839505, 0.8401254, 1, 0, 0, 1, 1,
1.688564, 0.3433812, 2.691097, 1, 0, 0, 1, 1,
1.694425, 0.507443, 3.017468, 1, 0, 0, 1, 1,
1.73057, -1.394057, 3.643417, 0, 0, 0, 1, 1,
1.736318, 1.628499, 0.7574496, 0, 0, 0, 1, 1,
1.752767, -1.646966, 0.1724345, 0, 0, 0, 1, 1,
1.753264, 1.097214, 2.545228, 0, 0, 0, 1, 1,
1.796209, 0.3307078, 1.302888, 0, 0, 0, 1, 1,
1.79996, 0.3206019, 1.341518, 0, 0, 0, 1, 1,
1.805215, 0.5100892, 1.385484, 0, 0, 0, 1, 1,
1.808527, -0.6132804, 1.418605, 1, 1, 1, 1, 1,
1.829431, 0.3212031, 1.134176, 1, 1, 1, 1, 1,
1.849708, 1.585778, 1.993593, 1, 1, 1, 1, 1,
1.854032, -0.2525136, 2.833601, 1, 1, 1, 1, 1,
1.895813, -1.487831, 1.347656, 1, 1, 1, 1, 1,
1.924626, -1.545647, 1.797023, 1, 1, 1, 1, 1,
1.928591, 0.2777285, 1.680577, 1, 1, 1, 1, 1,
1.948468, 0.8319831, 1.722027, 1, 1, 1, 1, 1,
1.981397, -1.437394, 2.441751, 1, 1, 1, 1, 1,
1.988134, -0.4981469, 2.159733, 1, 1, 1, 1, 1,
2.016832, -0.3265131, 0.8047963, 1, 1, 1, 1, 1,
2.04819, -1.027834, 2.303, 1, 1, 1, 1, 1,
2.06394, -0.3744003, 0.5864911, 1, 1, 1, 1, 1,
2.108478, 0.2881299, 0.85967, 1, 1, 1, 1, 1,
2.118054, -0.6884953, 2.320213, 1, 1, 1, 1, 1,
2.137814, -1.761849, 2.326941, 0, 0, 1, 1, 1,
2.161889, -0.2263616, 0.8627183, 1, 0, 0, 1, 1,
2.174667, -1.474424, 2.196017, 1, 0, 0, 1, 1,
2.190944, 0.07119346, 1.790982, 1, 0, 0, 1, 1,
2.216098, 2.431828, -0.1192357, 1, 0, 0, 1, 1,
2.252331, 0.8984569, 1.305755, 1, 0, 0, 1, 1,
2.304214, 1.0365, 0.9744046, 0, 0, 0, 1, 1,
2.339395, -0.6019533, 3.176819, 0, 0, 0, 1, 1,
2.359334, 0.4419712, 0.8986007, 0, 0, 0, 1, 1,
2.389158, -1.901015, 2.350386, 0, 0, 0, 1, 1,
2.425378, -0.1894666, 1.67464, 0, 0, 0, 1, 1,
2.465694, 1.612278, -0.4218498, 0, 0, 0, 1, 1,
2.48286, 0.2863479, 2.311938, 0, 0, 0, 1, 1,
2.508677, -0.8459945, 1.412094, 1, 1, 1, 1, 1,
2.631071, -0.9554591, 1.587448, 1, 1, 1, 1, 1,
2.652943, 0.1267412, 1.930227, 1, 1, 1, 1, 1,
2.713244, -1.265195, 1.11857, 1, 1, 1, 1, 1,
2.823453, -0.2864433, 1.855763, 1, 1, 1, 1, 1,
2.922384, -0.430535, 1.88434, 1, 1, 1, 1, 1,
3.554944, -0.2566712, 0.7219758, 1, 1, 1, 1, 1
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
var radius = 9.606819;
var distance = 33.74355;
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
mvMatrix.translate( -0.3210938, -0.07890034, -0.03103924 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.74355);
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
