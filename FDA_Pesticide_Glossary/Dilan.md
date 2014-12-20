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
-2.768747, -0.3027961, -2.203974, 1, 0, 0, 1,
-2.756464, -0.1390312, -0.7243983, 1, 0.007843138, 0, 1,
-2.731446, -0.8386492, -2.560786, 1, 0.01176471, 0, 1,
-2.671121, -0.6576955, -0.7316576, 1, 0.01960784, 0, 1,
-2.596945, -0.1086229, -1.617203, 1, 0.02352941, 0, 1,
-2.441522, -0.8515147, -0.2672248, 1, 0.03137255, 0, 1,
-2.409193, -0.2950828, -3.661148, 1, 0.03529412, 0, 1,
-2.394493, -0.1920557, 0.04772956, 1, 0.04313726, 0, 1,
-2.385849, 1.200493, -1.732735, 1, 0.04705882, 0, 1,
-2.339324, 0.1400345, -1.34031, 1, 0.05490196, 0, 1,
-2.311236, -0.6802438, -0.2138621, 1, 0.05882353, 0, 1,
-2.27131, 1.681937, -1.11761, 1, 0.06666667, 0, 1,
-2.199602, -0.3475435, -1.675728, 1, 0.07058824, 0, 1,
-2.173056, -2.015386, -2.809348, 1, 0.07843138, 0, 1,
-2.163158, 0.06786117, -0.6551601, 1, 0.08235294, 0, 1,
-2.116826, -0.389912, -0.4050758, 1, 0.09019608, 0, 1,
-2.086406, -0.1684698, -2.692028, 1, 0.09411765, 0, 1,
-2.045979, 0.4943611, -1.262712, 1, 0.1019608, 0, 1,
-2.0395, 3.494402, -0.9791135, 1, 0.1098039, 0, 1,
-2.035386, 0.04664358, -1.184693, 1, 0.1137255, 0, 1,
-2.016623, 0.6735713, -1.685221, 1, 0.1215686, 0, 1,
-2.016218, -0.8919186, -1.987718, 1, 0.1254902, 0, 1,
-1.996412, -1.24974, -2.54097, 1, 0.1333333, 0, 1,
-1.968976, -0.04900163, -1.979039, 1, 0.1372549, 0, 1,
-1.952724, -1.366976, -3.546434, 1, 0.145098, 0, 1,
-1.949506, 0.3181227, -0.8070608, 1, 0.1490196, 0, 1,
-1.947689, 1.901272, -0.5226502, 1, 0.1568628, 0, 1,
-1.942726, -0.7038952, -0.1845483, 1, 0.1607843, 0, 1,
-1.933756, 0.3092252, -1.426531, 1, 0.1686275, 0, 1,
-1.914627, 0.7668136, -0.9954355, 1, 0.172549, 0, 1,
-1.9042, 1.029078, -0.5632209, 1, 0.1803922, 0, 1,
-1.903614, -0.2788744, -2.473325, 1, 0.1843137, 0, 1,
-1.8685, -1.163561, -1.063338, 1, 0.1921569, 0, 1,
-1.866263, -0.6158644, -0.9515716, 1, 0.1960784, 0, 1,
-1.865083, -0.1314014, -1.911821, 1, 0.2039216, 0, 1,
-1.857638, 0.08315596, -2.878938, 1, 0.2117647, 0, 1,
-1.851402, -0.4531331, -2.044687, 1, 0.2156863, 0, 1,
-1.845717, -1.689985, -2.047989, 1, 0.2235294, 0, 1,
-1.83351, 0.2237874, -0.2734551, 1, 0.227451, 0, 1,
-1.832151, -0.2689277, -1.755139, 1, 0.2352941, 0, 1,
-1.819578, -1.584283, -1.686532, 1, 0.2392157, 0, 1,
-1.818596, 1.729249, -0.5946457, 1, 0.2470588, 0, 1,
-1.817967, 0.9397851, -0.9180386, 1, 0.2509804, 0, 1,
-1.813788, -0.919827, -1.392041, 1, 0.2588235, 0, 1,
-1.810776, 0.4561327, -1.219693, 1, 0.2627451, 0, 1,
-1.787639, -0.5295162, -3.56026, 1, 0.2705882, 0, 1,
-1.770617, -0.5277026, -2.956026, 1, 0.2745098, 0, 1,
-1.728844, -0.3044018, -1.605209, 1, 0.282353, 0, 1,
-1.726779, -0.04379945, -2.13875, 1, 0.2862745, 0, 1,
-1.683545, -0.9583448, -2.39518, 1, 0.2941177, 0, 1,
-1.681355, -0.275407, -1.404463, 1, 0.3019608, 0, 1,
-1.653356, -0.8294197, -1.828655, 1, 0.3058824, 0, 1,
-1.652817, 0.6112359, -1.000917, 1, 0.3137255, 0, 1,
-1.651392, -1.282193, -2.964128, 1, 0.3176471, 0, 1,
-1.642757, -0.09365117, -2.398079, 1, 0.3254902, 0, 1,
-1.636491, -1.596497, -2.926898, 1, 0.3294118, 0, 1,
-1.6256, -0.3733921, -1.757511, 1, 0.3372549, 0, 1,
-1.624176, -0.8401149, -2.222506, 1, 0.3411765, 0, 1,
-1.606783, -0.5930684, -0.3194361, 1, 0.3490196, 0, 1,
-1.575214, -1.125141, -5.113974, 1, 0.3529412, 0, 1,
-1.560824, -0.5654959, -1.556633, 1, 0.3607843, 0, 1,
-1.556238, 0.389482, -0.7949327, 1, 0.3647059, 0, 1,
-1.552169, 0.6235127, -0.9566556, 1, 0.372549, 0, 1,
-1.551396, 1.323072, 0.6188694, 1, 0.3764706, 0, 1,
-1.549175, 1.426723, -1.411964, 1, 0.3843137, 0, 1,
-1.538893, 0.6750948, -2.524022, 1, 0.3882353, 0, 1,
-1.530231, 0.2586978, -0.9480349, 1, 0.3960784, 0, 1,
-1.530165, 1.824494, -0.7382392, 1, 0.4039216, 0, 1,
-1.525228, 0.9559606, -1.293094, 1, 0.4078431, 0, 1,
-1.519917, -2.270992, -2.670947, 1, 0.4156863, 0, 1,
-1.511503, -0.2314381, -2.002521, 1, 0.4196078, 0, 1,
-1.505704, 0.9368508, -0.5632411, 1, 0.427451, 0, 1,
-1.504781, -0.6931459, -1.429833, 1, 0.4313726, 0, 1,
-1.497666, 1.660928, 0.2564846, 1, 0.4392157, 0, 1,
-1.495725, 1.292049, -2.38389, 1, 0.4431373, 0, 1,
-1.495632, 1.551252, -0.8332477, 1, 0.4509804, 0, 1,
-1.494451, 0.754906, -2.162034, 1, 0.454902, 0, 1,
-1.491245, -1.671791, -2.575888, 1, 0.4627451, 0, 1,
-1.477197, -0.3261563, -1.28761, 1, 0.4666667, 0, 1,
-1.471034, -2.360344, -3.039988, 1, 0.4745098, 0, 1,
-1.45766, 1.222671, -1.419679, 1, 0.4784314, 0, 1,
-1.452222, 1.798688, -1.508493, 1, 0.4862745, 0, 1,
-1.448467, -0.02880482, -1.775799, 1, 0.4901961, 0, 1,
-1.448221, -2.13484, -1.895585, 1, 0.4980392, 0, 1,
-1.43503, 0.411357, -0.3976291, 1, 0.5058824, 0, 1,
-1.425173, 0.1274572, -0.9740364, 1, 0.509804, 0, 1,
-1.42459, -2.15324, -3.147907, 1, 0.5176471, 0, 1,
-1.423883, 0.691106, -2.942166, 1, 0.5215687, 0, 1,
-1.422411, -0.7084993, -1.170095, 1, 0.5294118, 0, 1,
-1.420796, 0.8293584, -2.215875, 1, 0.5333334, 0, 1,
-1.41339, 0.8708499, -0.8248784, 1, 0.5411765, 0, 1,
-1.395847, -1.020738, -1.932135, 1, 0.5450981, 0, 1,
-1.383743, -0.5319263, -2.284028, 1, 0.5529412, 0, 1,
-1.382767, -0.4928746, -2.780467, 1, 0.5568628, 0, 1,
-1.377329, 1.44224, -0.345734, 1, 0.5647059, 0, 1,
-1.370576, -1.331956, -3.937355, 1, 0.5686275, 0, 1,
-1.353123, 2.07207, -0.6774864, 1, 0.5764706, 0, 1,
-1.342227, -0.7525306, -2.973674, 1, 0.5803922, 0, 1,
-1.339335, 1.816122, -2.21523, 1, 0.5882353, 0, 1,
-1.338431, 0.1997367, -0.3897284, 1, 0.5921569, 0, 1,
-1.337724, -0.4091759, -1.035199, 1, 0.6, 0, 1,
-1.333104, -0.2425718, -1.95323, 1, 0.6078432, 0, 1,
-1.332624, 1.119089, -0.6977242, 1, 0.6117647, 0, 1,
-1.331872, -1.148115, -1.69888, 1, 0.6196079, 0, 1,
-1.315226, 0.5064744, -0.6381994, 1, 0.6235294, 0, 1,
-1.30824, -1.548375, -1.587494, 1, 0.6313726, 0, 1,
-1.304504, 0.9247854, -2.885754, 1, 0.6352941, 0, 1,
-1.296837, 0.02863048, -0.3083971, 1, 0.6431373, 0, 1,
-1.296265, -2.642857, -0.8132878, 1, 0.6470588, 0, 1,
-1.296194, 1.505105, -2.48222, 1, 0.654902, 0, 1,
-1.29497, -1.305748, -3.08576, 1, 0.6588235, 0, 1,
-1.262589, -0.2204728, -2.102228, 1, 0.6666667, 0, 1,
-1.257469, -0.4539185, -1.829081, 1, 0.6705883, 0, 1,
-1.252443, 1.280687, -2.156339, 1, 0.6784314, 0, 1,
-1.249539, -1.749174, -0.6449283, 1, 0.682353, 0, 1,
-1.246002, -0.2644883, -2.345201, 1, 0.6901961, 0, 1,
-1.237411, -1.525686, -2.124662, 1, 0.6941177, 0, 1,
-1.234812, -0.3224958, -3.874957, 1, 0.7019608, 0, 1,
-1.230569, -0.4667784, -5.2242, 1, 0.7098039, 0, 1,
-1.226692, 1.247265, 1.357405, 1, 0.7137255, 0, 1,
-1.213344, -0.5627121, -0.4862417, 1, 0.7215686, 0, 1,
-1.204486, 1.038092, -1.217292, 1, 0.7254902, 0, 1,
-1.199922, -0.5610341, -1.573099, 1, 0.7333333, 0, 1,
-1.189816, -2.036962, -2.675945, 1, 0.7372549, 0, 1,
-1.188589, 0.09070799, 0.643855, 1, 0.7450981, 0, 1,
-1.175974, -0.1733722, -1.834712, 1, 0.7490196, 0, 1,
-1.174976, -1.440281, -3.679163, 1, 0.7568628, 0, 1,
-1.16904, -0.7985825, -2.085685, 1, 0.7607843, 0, 1,
-1.164054, -0.711432, -2.550677, 1, 0.7686275, 0, 1,
-1.16215, 0.3555959, -1.274984, 1, 0.772549, 0, 1,
-1.162002, -0.02470355, -0.8313549, 1, 0.7803922, 0, 1,
-1.156326, 0.9441308, 0.0173976, 1, 0.7843137, 0, 1,
-1.15388, -0.6984547, -3.650556, 1, 0.7921569, 0, 1,
-1.152507, -0.152736, -1.649289, 1, 0.7960784, 0, 1,
-1.152394, -0.9056271, -2.879226, 1, 0.8039216, 0, 1,
-1.138531, 1.099127, -3.033937, 1, 0.8117647, 0, 1,
-1.136501, 0.4665089, -0.1253974, 1, 0.8156863, 0, 1,
-1.130027, -0.9838818, -2.698871, 1, 0.8235294, 0, 1,
-1.129429, -0.7684108, -2.259696, 1, 0.827451, 0, 1,
-1.127302, 0.4728864, -2.603946, 1, 0.8352941, 0, 1,
-1.125741, 0.6529509, -0.7061916, 1, 0.8392157, 0, 1,
-1.121862, -0.7369482, -0.7696263, 1, 0.8470588, 0, 1,
-1.116324, 0.4324732, -2.97708, 1, 0.8509804, 0, 1,
-1.115123, 0.1381304, -1.609848, 1, 0.8588235, 0, 1,
-1.112907, 0.6257426, 0.7694097, 1, 0.8627451, 0, 1,
-1.097989, 1.847765, -1.86758, 1, 0.8705882, 0, 1,
-1.094507, -0.2760111, -1.176769, 1, 0.8745098, 0, 1,
-1.084861, -1.272713, -1.674547, 1, 0.8823529, 0, 1,
-1.068927, 0.9457166, -2.661017, 1, 0.8862745, 0, 1,
-1.056264, -0.1807096, -0.5102261, 1, 0.8941177, 0, 1,
-1.055789, 0.4438527, -1.507388, 1, 0.8980392, 0, 1,
-1.049316, -0.103315, -2.014977, 1, 0.9058824, 0, 1,
-1.047977, -1.237337, -1.841317, 1, 0.9137255, 0, 1,
-1.041944, -0.2369067, -2.963311, 1, 0.9176471, 0, 1,
-1.037024, -0.3785869, -0.946687, 1, 0.9254902, 0, 1,
-1.033712, -0.2456908, -1.395484, 1, 0.9294118, 0, 1,
-1.022335, 0.7412603, 0.2882022, 1, 0.9372549, 0, 1,
-1.021611, 0.168036, -0.6115707, 1, 0.9411765, 0, 1,
-0.9999118, 1.644317, -2.468238, 1, 0.9490196, 0, 1,
-0.9992005, -0.700348, -1.528768, 1, 0.9529412, 0, 1,
-0.9954723, 2.714892, -1.160205, 1, 0.9607843, 0, 1,
-0.9910099, 1.44365, -1.505397, 1, 0.9647059, 0, 1,
-0.9898272, 1.698912, -1.336281, 1, 0.972549, 0, 1,
-0.9785821, -0.6075207, -1.464522, 1, 0.9764706, 0, 1,
-0.9730354, -0.2573162, -1.782254, 1, 0.9843137, 0, 1,
-0.9719841, -1.93474, -3.288204, 1, 0.9882353, 0, 1,
-0.9715314, 0.3572914, 0.01857458, 1, 0.9960784, 0, 1,
-0.9533193, -0.6795835, -2.177019, 0.9960784, 1, 0, 1,
-0.9510954, 2.630091, 0.8340896, 0.9921569, 1, 0, 1,
-0.9436695, 1.092437, -0.1611728, 0.9843137, 1, 0, 1,
-0.9409259, 0.6447791, -0.1760802, 0.9803922, 1, 0, 1,
-0.9305007, -1.534743, -3.281342, 0.972549, 1, 0, 1,
-0.9143423, 1.3793, -1.400721, 0.9686275, 1, 0, 1,
-0.9114252, 0.01172486, -0.3313679, 0.9607843, 1, 0, 1,
-0.9105782, -0.1245274, -1.785622, 0.9568627, 1, 0, 1,
-0.9060342, -0.06748012, -1.819522, 0.9490196, 1, 0, 1,
-0.9045384, 1.504873, -0.5588536, 0.945098, 1, 0, 1,
-0.9040515, -0.3041992, -2.753829, 0.9372549, 1, 0, 1,
-0.8975125, 0.1451433, -1.770703, 0.9333333, 1, 0, 1,
-0.8961353, 0.1062637, -2.054104, 0.9254902, 1, 0, 1,
-0.8947912, 0.8468467, -2.919642, 0.9215686, 1, 0, 1,
-0.888498, 0.1558665, -3.653736, 0.9137255, 1, 0, 1,
-0.8859303, -1.053128, -3.082165, 0.9098039, 1, 0, 1,
-0.8857565, 1.019181, -1.258291, 0.9019608, 1, 0, 1,
-0.8826944, 1.052656, -2.410979, 0.8941177, 1, 0, 1,
-0.8765167, -0.8058804, -2.327028, 0.8901961, 1, 0, 1,
-0.8684151, 0.1499446, -0.1004332, 0.8823529, 1, 0, 1,
-0.8668401, 1.34371, -1.096453, 0.8784314, 1, 0, 1,
-0.8630072, -0.675873, -3.610406, 0.8705882, 1, 0, 1,
-0.8605332, 0.8147812, -0.2985629, 0.8666667, 1, 0, 1,
-0.8594568, -0.1124088, -2.610638, 0.8588235, 1, 0, 1,
-0.8587949, 0.9519237, 0.1934011, 0.854902, 1, 0, 1,
-0.8579353, 0.5808148, -2.874791, 0.8470588, 1, 0, 1,
-0.8573751, -1.259895, -3.384302, 0.8431373, 1, 0, 1,
-0.85456, 0.6339993, -2.310879, 0.8352941, 1, 0, 1,
-0.8473961, -2.524542, -3.38709, 0.8313726, 1, 0, 1,
-0.8466914, 0.9381959, -0.9489685, 0.8235294, 1, 0, 1,
-0.8462139, 0.6253992, -1.943649, 0.8196079, 1, 0, 1,
-0.8433249, 0.2445637, -0.7377496, 0.8117647, 1, 0, 1,
-0.8355091, 0.5557925, -0.4415861, 0.8078431, 1, 0, 1,
-0.8279356, 0.6859272, 0.6844519, 0.8, 1, 0, 1,
-0.8277121, -1.450852, -4.820701, 0.7921569, 1, 0, 1,
-0.8216681, 0.9956955, -0.9426086, 0.7882353, 1, 0, 1,
-0.8191418, -0.1732269, -1.597501, 0.7803922, 1, 0, 1,
-0.8168575, 0.07104506, -0.148506, 0.7764706, 1, 0, 1,
-0.8161268, 1.294527, 0.08604357, 0.7686275, 1, 0, 1,
-0.8087849, -0.6359236, -2.218168, 0.7647059, 1, 0, 1,
-0.8047677, -0.0752336, -2.752596, 0.7568628, 1, 0, 1,
-0.8018146, -0.2750683, -1.008083, 0.7529412, 1, 0, 1,
-0.7946662, -0.1785346, -1.069519, 0.7450981, 1, 0, 1,
-0.792168, -0.1092619, -2.052852, 0.7411765, 1, 0, 1,
-0.7848154, 0.8150223, 0.8148476, 0.7333333, 1, 0, 1,
-0.7827513, -0.190096, -2.015307, 0.7294118, 1, 0, 1,
-0.7719275, 1.218731, 0.1750142, 0.7215686, 1, 0, 1,
-0.7711146, -0.6239023, -1.968526, 0.7176471, 1, 0, 1,
-0.7707562, 1.719847, -1.107334, 0.7098039, 1, 0, 1,
-0.7689865, 0.5678943, -0.3747331, 0.7058824, 1, 0, 1,
-0.7675068, -0.1183145, -0.7317514, 0.6980392, 1, 0, 1,
-0.7668803, -0.5390364, -1.390841, 0.6901961, 1, 0, 1,
-0.7609718, -2.032978, -3.059459, 0.6862745, 1, 0, 1,
-0.7600324, -0.9615102, -3.641826, 0.6784314, 1, 0, 1,
-0.7569221, -0.7121454, -2.898266, 0.6745098, 1, 0, 1,
-0.7556859, -0.06729793, -4.314307, 0.6666667, 1, 0, 1,
-0.753292, 1.869518, -3.197631, 0.6627451, 1, 0, 1,
-0.7499021, 0.1401705, 0.3901725, 0.654902, 1, 0, 1,
-0.7470582, 1.694576, 0.793224, 0.6509804, 1, 0, 1,
-0.7425483, 0.3327232, -0.597467, 0.6431373, 1, 0, 1,
-0.7402956, -0.0568327, -2.426271, 0.6392157, 1, 0, 1,
-0.7358745, -1.731938, -2.424214, 0.6313726, 1, 0, 1,
-0.7328907, 0.4093961, -2.475766, 0.627451, 1, 0, 1,
-0.7267002, 0.3975867, -1.274138, 0.6196079, 1, 0, 1,
-0.726566, 0.3335778, -3.451359, 0.6156863, 1, 0, 1,
-0.7253258, 0.8679718, -0.4934943, 0.6078432, 1, 0, 1,
-0.7175381, 0.1583136, -0.5288845, 0.6039216, 1, 0, 1,
-0.7163957, -0.2174769, -4.107768, 0.5960785, 1, 0, 1,
-0.7104483, -0.5287094, -1.541768, 0.5882353, 1, 0, 1,
-0.7039845, 1.514992, -1.576078, 0.5843138, 1, 0, 1,
-0.7037058, 0.718784, -1.176226, 0.5764706, 1, 0, 1,
-0.6998774, -0.6564279, -1.383422, 0.572549, 1, 0, 1,
-0.6993915, 0.286656, -3.132924, 0.5647059, 1, 0, 1,
-0.6977792, -0.6335368, -2.405501, 0.5607843, 1, 0, 1,
-0.6942602, -0.1315179, -1.634779, 0.5529412, 1, 0, 1,
-0.6938034, -0.3854204, -2.747796, 0.5490196, 1, 0, 1,
-0.6892541, 0.1922633, -0.9639376, 0.5411765, 1, 0, 1,
-0.6789683, -0.09582105, -0.5159815, 0.5372549, 1, 0, 1,
-0.6780561, 1.37878, -0.5571394, 0.5294118, 1, 0, 1,
-0.6755521, 0.365414, -2.294887, 0.5254902, 1, 0, 1,
-0.6727146, 0.5884821, 1.008751, 0.5176471, 1, 0, 1,
-0.6696195, -1.998453, -3.082409, 0.5137255, 1, 0, 1,
-0.6670778, 0.7141435, -0.5438063, 0.5058824, 1, 0, 1,
-0.6631768, 1.293663, -1.326923, 0.5019608, 1, 0, 1,
-0.6590048, 1.198422, 0.543712, 0.4941176, 1, 0, 1,
-0.6585138, 1.11839, -1.419602, 0.4862745, 1, 0, 1,
-0.6580626, 0.9659613, -0.4595672, 0.4823529, 1, 0, 1,
-0.6573423, 1.137876, -1.44821, 0.4745098, 1, 0, 1,
-0.6531567, 1.054087, -0.5177666, 0.4705882, 1, 0, 1,
-0.6490338, 0.448843, -0.164812, 0.4627451, 1, 0, 1,
-0.6486598, 0.2302889, -0.2100959, 0.4588235, 1, 0, 1,
-0.6480373, -1.080714, -2.716704, 0.4509804, 1, 0, 1,
-0.6427763, -0.3665275, -2.20146, 0.4470588, 1, 0, 1,
-0.6410919, -0.09485877, -1.112377, 0.4392157, 1, 0, 1,
-0.6347213, -1.079918, -1.493781, 0.4352941, 1, 0, 1,
-0.6306208, -0.2789248, -1.204142, 0.427451, 1, 0, 1,
-0.6304852, -0.04785649, -1.693311, 0.4235294, 1, 0, 1,
-0.6288556, -1.888163, -1.60372, 0.4156863, 1, 0, 1,
-0.622582, -0.6087613, -3.117822, 0.4117647, 1, 0, 1,
-0.6187919, -1.545414, -3.537717, 0.4039216, 1, 0, 1,
-0.6122528, 0.2450965, -0.01895163, 0.3960784, 1, 0, 1,
-0.6069158, -1.387173, -2.621986, 0.3921569, 1, 0, 1,
-0.6055769, 0.8226717, 1.052113, 0.3843137, 1, 0, 1,
-0.6029803, -0.9283409, -3.449279, 0.3803922, 1, 0, 1,
-0.6026824, 0.3175174, -0.3041502, 0.372549, 1, 0, 1,
-0.6008617, -0.1922992, -1.844402, 0.3686275, 1, 0, 1,
-0.5988628, -1.54009, -2.475192, 0.3607843, 1, 0, 1,
-0.5892956, -1.011657, -1.414693, 0.3568628, 1, 0, 1,
-0.588354, 1.72894, -0.5679735, 0.3490196, 1, 0, 1,
-0.5854473, 0.9841748, -0.6476883, 0.345098, 1, 0, 1,
-0.5831889, -0.8715591, -2.179791, 0.3372549, 1, 0, 1,
-0.5831538, -0.6043985, -1.735247, 0.3333333, 1, 0, 1,
-0.582579, -0.8853335, -2.519895, 0.3254902, 1, 0, 1,
-0.5821197, -1.228373, -3.167309, 0.3215686, 1, 0, 1,
-0.580763, 0.6940894, -0.4244388, 0.3137255, 1, 0, 1,
-0.5783741, 1.034085, 0.9930797, 0.3098039, 1, 0, 1,
-0.5567421, -0.4318404, -1.707556, 0.3019608, 1, 0, 1,
-0.5529999, -0.8725356, -4.144264, 0.2941177, 1, 0, 1,
-0.5503154, -0.6542009, -2.660931, 0.2901961, 1, 0, 1,
-0.5433656, -0.7492391, -4.654186, 0.282353, 1, 0, 1,
-0.5377622, 2.074418, -2.799804, 0.2784314, 1, 0, 1,
-0.5278502, -0.02755802, -2.823105, 0.2705882, 1, 0, 1,
-0.5270547, -1.102151, -0.9440787, 0.2666667, 1, 0, 1,
-0.5263698, 1.121859, 0.06357315, 0.2588235, 1, 0, 1,
-0.5260695, 0.6853663, -2.402028, 0.254902, 1, 0, 1,
-0.5253744, 1.317799, -2.3476, 0.2470588, 1, 0, 1,
-0.5184866, 0.4430465, -0.382883, 0.2431373, 1, 0, 1,
-0.5162188, 0.4591001, -2.275879, 0.2352941, 1, 0, 1,
-0.5110934, -1.341542, -3.474911, 0.2313726, 1, 0, 1,
-0.5024141, 0.2336875, -0.4404494, 0.2235294, 1, 0, 1,
-0.5022941, 0.9824811, 0.4359533, 0.2196078, 1, 0, 1,
-0.5007636, -0.4197336, -2.155877, 0.2117647, 1, 0, 1,
-0.5001519, 0.5928184, -0.08101184, 0.2078431, 1, 0, 1,
-0.4957927, -0.3721526, -1.63754, 0.2, 1, 0, 1,
-0.49516, -0.3633367, -1.08129, 0.1921569, 1, 0, 1,
-0.4911182, -0.1104098, -2.086813, 0.1882353, 1, 0, 1,
-0.4888462, 0.1091871, -0.2047443, 0.1803922, 1, 0, 1,
-0.4866189, 2.392462, 0.7688242, 0.1764706, 1, 0, 1,
-0.4858428, -0.1044214, -0.9751914, 0.1686275, 1, 0, 1,
-0.4765312, -0.8959414, -1.913895, 0.1647059, 1, 0, 1,
-0.4754777, 1.012033, -3.152218, 0.1568628, 1, 0, 1,
-0.470692, -0.3701098, -1.871581, 0.1529412, 1, 0, 1,
-0.4603802, 1.064215, -0.3019302, 0.145098, 1, 0, 1,
-0.4577755, -0.2394069, -3.25938, 0.1411765, 1, 0, 1,
-0.4530047, 0.4032696, -3.028571, 0.1333333, 1, 0, 1,
-0.4506332, -1.110872, -2.977923, 0.1294118, 1, 0, 1,
-0.4465537, 0.1653997, -1.910202, 0.1215686, 1, 0, 1,
-0.4431834, -0.9676592, -2.609132, 0.1176471, 1, 0, 1,
-0.4426113, 0.6309776, -1.593969, 0.1098039, 1, 0, 1,
-0.4423684, 0.2297405, -0.8559765, 0.1058824, 1, 0, 1,
-0.4420034, 0.49505, -1.980607, 0.09803922, 1, 0, 1,
-0.4411252, -0.1093749, -1.653112, 0.09019608, 1, 0, 1,
-0.4363463, 0.5967525, -0.8703673, 0.08627451, 1, 0, 1,
-0.4311588, 0.3578625, -1.64127, 0.07843138, 1, 0, 1,
-0.4276075, 0.4234986, 0.7337379, 0.07450981, 1, 0, 1,
-0.4252099, 1.364313, -0.02195739, 0.06666667, 1, 0, 1,
-0.4251975, 0.5993384, 0.3671379, 0.0627451, 1, 0, 1,
-0.4202772, -1.861661, -3.454876, 0.05490196, 1, 0, 1,
-0.4051935, 0.7712875, -3.352695, 0.05098039, 1, 0, 1,
-0.4048836, 1.025797, -0.2756371, 0.04313726, 1, 0, 1,
-0.4040477, 1.492635, 0.002085427, 0.03921569, 1, 0, 1,
-0.4040023, -1.594393, -3.153483, 0.03137255, 1, 0, 1,
-0.4014674, 0.8840794, -1.022266, 0.02745098, 1, 0, 1,
-0.397278, -0.02858794, -0.7080629, 0.01960784, 1, 0, 1,
-0.3950676, 0.6747805, -0.9359408, 0.01568628, 1, 0, 1,
-0.3950465, 0.7686486, 0.3616846, 0.007843138, 1, 0, 1,
-0.3935076, -0.0229982, -1.548335, 0.003921569, 1, 0, 1,
-0.3889012, 0.9256349, -0.1062969, 0, 1, 0.003921569, 1,
-0.3868797, 1.536298, -0.2865537, 0, 1, 0.01176471, 1,
-0.368855, 0.5580466, -1.650886, 0, 1, 0.01568628, 1,
-0.3657526, 0.7556521, -0.8777074, 0, 1, 0.02352941, 1,
-0.3656461, 0.2856179, -0.7061285, 0, 1, 0.02745098, 1,
-0.3648758, 0.2560128, -1.88802, 0, 1, 0.03529412, 1,
-0.3595748, 0.04669992, -2.605806, 0, 1, 0.03921569, 1,
-0.3589588, 0.7570608, -0.6556244, 0, 1, 0.04705882, 1,
-0.3515377, -0.676373, -2.997052, 0, 1, 0.05098039, 1,
-0.3513528, -0.310784, -2.158342, 0, 1, 0.05882353, 1,
-0.3513222, -0.7063504, -2.259024, 0, 1, 0.0627451, 1,
-0.350427, -0.1325693, -3.064069, 0, 1, 0.07058824, 1,
-0.3487643, -0.02636147, -2.489828, 0, 1, 0.07450981, 1,
-0.3484868, -0.4219936, -4.636271, 0, 1, 0.08235294, 1,
-0.3468782, -0.5604957, -1.57257, 0, 1, 0.08627451, 1,
-0.3416548, 1.535215, -0.8647842, 0, 1, 0.09411765, 1,
-0.340339, -0.1280751, -2.947136, 0, 1, 0.1019608, 1,
-0.339122, 0.6017399, -0.5562696, 0, 1, 0.1058824, 1,
-0.3390034, 1.111211, -1.963616, 0, 1, 0.1137255, 1,
-0.3387709, 0.3689514, -0.4207762, 0, 1, 0.1176471, 1,
-0.3386277, 1.589988, 0.6191349, 0, 1, 0.1254902, 1,
-0.3340185, -0.529968, -2.919249, 0, 1, 0.1294118, 1,
-0.3333007, 0.4278423, -1.006749, 0, 1, 0.1372549, 1,
-0.332101, 0.1499821, -1.342397, 0, 1, 0.1411765, 1,
-0.3288805, -2.348681, -2.856225, 0, 1, 0.1490196, 1,
-0.3273454, -1.400878, -3.665918, 0, 1, 0.1529412, 1,
-0.3269201, 1.777848, 0.8071342, 0, 1, 0.1607843, 1,
-0.3247955, 0.4256778, -1.807387, 0, 1, 0.1647059, 1,
-0.3223348, 1.975017, -1.212447, 0, 1, 0.172549, 1,
-0.3202335, 0.1693267, -0.4665662, 0, 1, 0.1764706, 1,
-0.3166939, -0.9340183, -4.376833, 0, 1, 0.1843137, 1,
-0.3126417, 1.020794, 1.341698, 0, 1, 0.1882353, 1,
-0.3049663, -2.444762, -2.359152, 0, 1, 0.1960784, 1,
-0.3048255, 0.07452199, -1.743972, 0, 1, 0.2039216, 1,
-0.3032674, -0.2841418, -1.509453, 0, 1, 0.2078431, 1,
-0.3025357, 0.09783455, -1.120782, 0, 1, 0.2156863, 1,
-0.300871, -0.8206611, -4.144388, 0, 1, 0.2196078, 1,
-0.2997555, 1.220083, 0.1081669, 0, 1, 0.227451, 1,
-0.2991651, 0.3224275, -1.8889, 0, 1, 0.2313726, 1,
-0.2978689, -0.4944926, -3.733148, 0, 1, 0.2392157, 1,
-0.293007, -0.1064226, -3.085621, 0, 1, 0.2431373, 1,
-0.2911179, -1.58367, -1.067399, 0, 1, 0.2509804, 1,
-0.2881032, 0.3085103, -3.14169, 0, 1, 0.254902, 1,
-0.2854162, 0.9523894, -1.360971, 0, 1, 0.2627451, 1,
-0.2809449, 0.5941702, 0.1046367, 0, 1, 0.2666667, 1,
-0.2720709, 0.4624268, -2.229996, 0, 1, 0.2745098, 1,
-0.271399, -0.3647736, -3.190191, 0, 1, 0.2784314, 1,
-0.2690962, -0.6922342, -3.307748, 0, 1, 0.2862745, 1,
-0.2688563, 0.2441986, 1.22972, 0, 1, 0.2901961, 1,
-0.2583304, 0.8720307, -0.863831, 0, 1, 0.2980392, 1,
-0.25103, -1.386279, -4.010552, 0, 1, 0.3058824, 1,
-0.2490526, -0.1003612, -1.028052, 0, 1, 0.3098039, 1,
-0.233637, -1.111968, -3.354012, 0, 1, 0.3176471, 1,
-0.2296042, -0.211715, -0.1832397, 0, 1, 0.3215686, 1,
-0.2271227, 0.6543247, -0.9250923, 0, 1, 0.3294118, 1,
-0.2259621, 0.8897317, -0.8792368, 0, 1, 0.3333333, 1,
-0.2198647, 0.04871365, -2.132787, 0, 1, 0.3411765, 1,
-0.219602, 0.1099149, -1.987301, 0, 1, 0.345098, 1,
-0.2193167, 1.603759, 0.008970429, 0, 1, 0.3529412, 1,
-0.2172904, -0.5031742, -3.371097, 0, 1, 0.3568628, 1,
-0.212781, 1.380092, -0.00442476, 0, 1, 0.3647059, 1,
-0.2106746, 0.6599609, 0.4287313, 0, 1, 0.3686275, 1,
-0.2097479, 0.3954356, 0.3414643, 0, 1, 0.3764706, 1,
-0.2094741, 0.6546261, -1.908248, 0, 1, 0.3803922, 1,
-0.2062119, -0.5355721, -2.910389, 0, 1, 0.3882353, 1,
-0.2044094, -0.1355497, -3.552362, 0, 1, 0.3921569, 1,
-0.1978147, -0.6269954, -2.246815, 0, 1, 0.4, 1,
-0.1957363, -1.011024, -3.434357, 0, 1, 0.4078431, 1,
-0.1926224, 0.588881, 0.6350336, 0, 1, 0.4117647, 1,
-0.1862681, 0.299944, -0.4362998, 0, 1, 0.4196078, 1,
-0.1853736, 0.6291973, 1.342561, 0, 1, 0.4235294, 1,
-0.1841744, -0.4914445, -1.924082, 0, 1, 0.4313726, 1,
-0.1800279, 0.1566111, -1.939497, 0, 1, 0.4352941, 1,
-0.1783768, 1.832714, 1.283034, 0, 1, 0.4431373, 1,
-0.1753852, -0.0920142, -0.9911055, 0, 1, 0.4470588, 1,
-0.1715022, -1.835348, -2.945996, 0, 1, 0.454902, 1,
-0.1697334, 0.3981327, -0.3144822, 0, 1, 0.4588235, 1,
-0.1677826, 1.861924, 1.485049, 0, 1, 0.4666667, 1,
-0.1669528, 0.2575299, 1.397084, 0, 1, 0.4705882, 1,
-0.159617, -0.8887705, -4.064284, 0, 1, 0.4784314, 1,
-0.1514559, -0.9624935, -2.414587, 0, 1, 0.4823529, 1,
-0.1490505, 0.383839, -1.573971, 0, 1, 0.4901961, 1,
-0.1474535, 1.638956, -1.903677, 0, 1, 0.4941176, 1,
-0.1448648, 1.889191, 1.614911, 0, 1, 0.5019608, 1,
-0.1427944, -1.076036, -3.325444, 0, 1, 0.509804, 1,
-0.1402297, -1.176621, -2.485311, 0, 1, 0.5137255, 1,
-0.1368624, -0.1093095, -0.4262275, 0, 1, 0.5215687, 1,
-0.1324152, -0.4827971, -2.067319, 0, 1, 0.5254902, 1,
-0.1249037, 1.878353, 0.7591739, 0, 1, 0.5333334, 1,
-0.1244671, 0.6190957, -0.9637797, 0, 1, 0.5372549, 1,
-0.1190969, -0.8027656, -2.155944, 0, 1, 0.5450981, 1,
-0.1178173, -1.045604, -2.523158, 0, 1, 0.5490196, 1,
-0.1175344, 0.3172921, -0.3540999, 0, 1, 0.5568628, 1,
-0.1175078, 1.301993, 0.6339679, 0, 1, 0.5607843, 1,
-0.1173118, -1.23, -1.858968, 0, 1, 0.5686275, 1,
-0.1169483, 0.5770475, 0.572081, 0, 1, 0.572549, 1,
-0.114173, 2.550275, 0.8364798, 0, 1, 0.5803922, 1,
-0.1096952, 1.227082, 0.7072496, 0, 1, 0.5843138, 1,
-0.1060135, -0.839495, -2.548652, 0, 1, 0.5921569, 1,
-0.1052856, -0.3777221, -2.256157, 0, 1, 0.5960785, 1,
-0.1025941, 1.855631, 0.5495318, 0, 1, 0.6039216, 1,
-0.1004499, -0.9890031, -2.379221, 0, 1, 0.6117647, 1,
-0.09897865, -0.1385177, -2.641517, 0, 1, 0.6156863, 1,
-0.09421216, 0.297855, -1.84318, 0, 1, 0.6235294, 1,
-0.09391087, 0.4720895, -1.418834, 0, 1, 0.627451, 1,
-0.09007386, -0.09790049, -3.307556, 0, 1, 0.6352941, 1,
-0.08609762, -0.8486838, -4.225855, 0, 1, 0.6392157, 1,
-0.08556087, 0.9226968, -0.1097118, 0, 1, 0.6470588, 1,
-0.08401832, 0.2320896, -0.2078847, 0, 1, 0.6509804, 1,
-0.08311503, -0.1278566, -2.280892, 0, 1, 0.6588235, 1,
-0.08044078, -0.3756831, -4.308447, 0, 1, 0.6627451, 1,
-0.08041634, 0.2275268, 0.2328811, 0, 1, 0.6705883, 1,
-0.08021808, -1.015607, -2.743032, 0, 1, 0.6745098, 1,
-0.08007254, 0.7654223, 0.3382035, 0, 1, 0.682353, 1,
-0.07276648, 0.06325471, -1.308934, 0, 1, 0.6862745, 1,
-0.0722138, -1.040335, -2.481039, 0, 1, 0.6941177, 1,
-0.06673232, -0.5317023, -0.3078311, 0, 1, 0.7019608, 1,
-0.0642534, -1.424227, -2.94285, 0, 1, 0.7058824, 1,
-0.0562649, 0.1458664, -1.130279, 0, 1, 0.7137255, 1,
-0.05232549, 1.392914, -0.0774371, 0, 1, 0.7176471, 1,
-0.05212533, 0.6605096, 0.5551504, 0, 1, 0.7254902, 1,
-0.04610889, -0.981123, -2.273452, 0, 1, 0.7294118, 1,
-0.04511143, 1.374241, 0.05653845, 0, 1, 0.7372549, 1,
-0.04221812, -0.356777, -4.007679, 0, 1, 0.7411765, 1,
-0.03296265, 1.163829, -0.586679, 0, 1, 0.7490196, 1,
-0.03294267, 0.3475839, 0.9903855, 0, 1, 0.7529412, 1,
-0.03068468, -1.048783, -3.163816, 0, 1, 0.7607843, 1,
-0.02455687, -0.4461116, -3.131397, 0, 1, 0.7647059, 1,
-0.02288399, 0.4801019, 0.6479815, 0, 1, 0.772549, 1,
-0.02197176, -0.1654445, -4.157485, 0, 1, 0.7764706, 1,
-0.02193492, 0.09858304, -2.7955, 0, 1, 0.7843137, 1,
-0.01945207, -0.0453959, -4.003014, 0, 1, 0.7882353, 1,
-0.01563773, -0.506666, -3.939073, 0, 1, 0.7960784, 1,
-0.01494318, 1.442132, 0.5414059, 0, 1, 0.8039216, 1,
-0.01426857, -1.446432, -2.602742, 0, 1, 0.8078431, 1,
-0.01222755, 0.4088, 0.5835371, 0, 1, 0.8156863, 1,
-0.01128803, -1.266843, -3.965536, 0, 1, 0.8196079, 1,
-0.009818834, -0.1842236, -2.441024, 0, 1, 0.827451, 1,
-0.007188722, -0.2105612, -3.985053, 0, 1, 0.8313726, 1,
-0.006471274, -0.7915368, -2.174072, 0, 1, 0.8392157, 1,
-0.001493988, -0.2804865, -3.217195, 0, 1, 0.8431373, 1,
0.002100815, -0.308245, 3.497597, 0, 1, 0.8509804, 1,
0.002314685, 0.1157551, 1.068377, 0, 1, 0.854902, 1,
0.003286276, -1.766967, 2.563281, 0, 1, 0.8627451, 1,
0.01045709, -1.918549, 1.448114, 0, 1, 0.8666667, 1,
0.01388774, 0.4425558, -0.1709225, 0, 1, 0.8745098, 1,
0.01550708, -2.204427, 4.356631, 0, 1, 0.8784314, 1,
0.01731301, -0.350197, 3.744373, 0, 1, 0.8862745, 1,
0.01797243, -1.888346, 3.569561, 0, 1, 0.8901961, 1,
0.01834032, -0.09404252, 3.404219, 0, 1, 0.8980392, 1,
0.02144668, -1.017918, 2.162662, 0, 1, 0.9058824, 1,
0.03342617, -0.1821221, 2.259294, 0, 1, 0.9098039, 1,
0.03376973, 0.3649097, 0.7698241, 0, 1, 0.9176471, 1,
0.03402144, 1.299915, -0.2264586, 0, 1, 0.9215686, 1,
0.04131099, -0.1447594, 3.68356, 0, 1, 0.9294118, 1,
0.04164553, -0.3829157, 2.261121, 0, 1, 0.9333333, 1,
0.04241814, 0.5054091, -0.211233, 0, 1, 0.9411765, 1,
0.04953369, 0.8310544, 0.0460619, 0, 1, 0.945098, 1,
0.05212781, -0.8809687, 2.847862, 0, 1, 0.9529412, 1,
0.05225315, -1.856447, 1.761752, 0, 1, 0.9568627, 1,
0.05502165, 0.2675117, -1.016083, 0, 1, 0.9647059, 1,
0.05655662, -0.04575301, -0.1908704, 0, 1, 0.9686275, 1,
0.05913273, -0.8536412, 3.6855, 0, 1, 0.9764706, 1,
0.06059092, -0.7846164, 3.488223, 0, 1, 0.9803922, 1,
0.06403457, 0.8609029, -1.848876, 0, 1, 0.9882353, 1,
0.06411458, -0.08009098, 1.994112, 0, 1, 0.9921569, 1,
0.06483546, -1.016735, 2.963454, 0, 1, 1, 1,
0.07217404, 0.334191, -1.204908, 0, 0.9921569, 1, 1,
0.0764433, 1.828389, 0.08662407, 0, 0.9882353, 1, 1,
0.0791617, 0.3156001, 0.7222818, 0, 0.9803922, 1, 1,
0.08499707, -0.4409107, 2.691612, 0, 0.9764706, 1, 1,
0.08548497, -0.7047842, 4.383317, 0, 0.9686275, 1, 1,
0.09081656, 0.2095831, 0.9220092, 0, 0.9647059, 1, 1,
0.09094542, -1.15351, 2.967997, 0, 0.9568627, 1, 1,
0.09292235, -1.094493, 2.598036, 0, 0.9529412, 1, 1,
0.09792955, -0.4187482, 2.313228, 0, 0.945098, 1, 1,
0.1111545, -0.5856465, 2.918428, 0, 0.9411765, 1, 1,
0.1126723, 1.385528, 0.758379, 0, 0.9333333, 1, 1,
0.1146647, -1.695581, 2.689646, 0, 0.9294118, 1, 1,
0.1178534, 0.6524237, -0.1519722, 0, 0.9215686, 1, 1,
0.1219121, -1.177999, 2.773958, 0, 0.9176471, 1, 1,
0.1219897, -0.6540665, 2.863639, 0, 0.9098039, 1, 1,
0.122295, 1.498291, 0.1256072, 0, 0.9058824, 1, 1,
0.1246603, -1.961592, 4.803178, 0, 0.8980392, 1, 1,
0.1251002, 0.2502735, 1.086488, 0, 0.8901961, 1, 1,
0.1258375, -1.083464, 2.677464, 0, 0.8862745, 1, 1,
0.1279035, 0.3696637, -0.4838407, 0, 0.8784314, 1, 1,
0.1290018, 0.2695634, 0.4200158, 0, 0.8745098, 1, 1,
0.1298382, 1.584559, -1.479417, 0, 0.8666667, 1, 1,
0.1309694, -0.3345439, 2.249499, 0, 0.8627451, 1, 1,
0.1366894, 2.368108, 1.002269, 0, 0.854902, 1, 1,
0.1388501, 0.1492012, -1.165934, 0, 0.8509804, 1, 1,
0.1391221, 1.904653, -0.4045619, 0, 0.8431373, 1, 1,
0.140887, -0.1189696, 4.059193, 0, 0.8392157, 1, 1,
0.1447629, -0.6569718, 3.984686, 0, 0.8313726, 1, 1,
0.1475586, -0.7614395, 1.149046, 0, 0.827451, 1, 1,
0.1510813, -1.425773, 2.387625, 0, 0.8196079, 1, 1,
0.1542657, 0.7162299, 0.8149287, 0, 0.8156863, 1, 1,
0.1549801, 0.07945412, 0.5575345, 0, 0.8078431, 1, 1,
0.16079, -1.263907, 1.972075, 0, 0.8039216, 1, 1,
0.1617791, 0.0955389, -0.736534, 0, 0.7960784, 1, 1,
0.1632586, 1.370873, 1.529743, 0, 0.7882353, 1, 1,
0.16692, -1.653461, 2.717262, 0, 0.7843137, 1, 1,
0.1705359, -0.79522, 3.566692, 0, 0.7764706, 1, 1,
0.1718923, 1.01203, 1.192492, 0, 0.772549, 1, 1,
0.173525, 0.290197, -0.2015686, 0, 0.7647059, 1, 1,
0.1751958, 0.03405769, 0.7993762, 0, 0.7607843, 1, 1,
0.1786882, -1.132323, 3.262645, 0, 0.7529412, 1, 1,
0.1829511, -1.422895, 5.229637, 0, 0.7490196, 1, 1,
0.1894603, -0.5147108, 2.068429, 0, 0.7411765, 1, 1,
0.1917298, -0.03144337, -0.03915265, 0, 0.7372549, 1, 1,
0.1921471, 0.6993148, 0.1754707, 0, 0.7294118, 1, 1,
0.1922942, -0.6381274, 4.12177, 0, 0.7254902, 1, 1,
0.1948867, -0.8863262, 1.994335, 0, 0.7176471, 1, 1,
0.2014782, 1.388995, -0.4231966, 0, 0.7137255, 1, 1,
0.2018823, -0.1348899, 3.335596, 0, 0.7058824, 1, 1,
0.2024354, 0.4394211, 2.603465, 0, 0.6980392, 1, 1,
0.2047818, -1.221054, 4.944506, 0, 0.6941177, 1, 1,
0.2050476, -0.4803886, 4.462429, 0, 0.6862745, 1, 1,
0.2145417, 0.06371009, 1.000043, 0, 0.682353, 1, 1,
0.2148619, 0.2692068, 1.59737, 0, 0.6745098, 1, 1,
0.2153712, 0.5008057, -0.5379038, 0, 0.6705883, 1, 1,
0.2203885, -0.3269233, 1.670889, 0, 0.6627451, 1, 1,
0.2207393, -1.236671, 2.402117, 0, 0.6588235, 1, 1,
0.2290179, -0.2523994, 2.389908, 0, 0.6509804, 1, 1,
0.2292863, 2.644645, 1.202931, 0, 0.6470588, 1, 1,
0.23121, -0.219893, 3.618343, 0, 0.6392157, 1, 1,
0.2345358, 0.1676313, 2.839164, 0, 0.6352941, 1, 1,
0.2357963, -0.7885841, 2.510088, 0, 0.627451, 1, 1,
0.2362999, 0.2985653, 2.121735, 0, 0.6235294, 1, 1,
0.2413822, 0.09207159, 2.362986, 0, 0.6156863, 1, 1,
0.243827, 0.5037246, 1.307199, 0, 0.6117647, 1, 1,
0.2444191, 0.2544654, -0.1905335, 0, 0.6039216, 1, 1,
0.2450774, -1.491282, 3.838119, 0, 0.5960785, 1, 1,
0.2500885, -0.4357486, 2.326712, 0, 0.5921569, 1, 1,
0.2531419, -1.211036, 2.199132, 0, 0.5843138, 1, 1,
0.2554675, 1.099576, 0.5449146, 0, 0.5803922, 1, 1,
0.2559301, 1.340792, 1.49142, 0, 0.572549, 1, 1,
0.2596859, -0.2904459, 1.723193, 0, 0.5686275, 1, 1,
0.2607118, 0.02243519, 2.095178, 0, 0.5607843, 1, 1,
0.2607413, -0.7931967, 4.429945, 0, 0.5568628, 1, 1,
0.2613592, 0.8273813, 1.879447, 0, 0.5490196, 1, 1,
0.2666221, 0.1573474, 1.484727, 0, 0.5450981, 1, 1,
0.2674692, 1.577515, 0.8400259, 0, 0.5372549, 1, 1,
0.2707278, -1.190448, 3.286024, 0, 0.5333334, 1, 1,
0.2711264, -0.3273391, 3.375204, 0, 0.5254902, 1, 1,
0.2755193, 0.3185844, 0.9934523, 0, 0.5215687, 1, 1,
0.2759596, 0.9236107, 0.002666889, 0, 0.5137255, 1, 1,
0.2759899, -0.1992863, 1.067707, 0, 0.509804, 1, 1,
0.277117, -0.7932721, 2.329764, 0, 0.5019608, 1, 1,
0.2782671, 0.214432, -1.459138, 0, 0.4941176, 1, 1,
0.2790824, -1.506872, 1.722567, 0, 0.4901961, 1, 1,
0.2793897, 0.8564363, 1.925159, 0, 0.4823529, 1, 1,
0.2820776, -0.2603194, 1.280385, 0, 0.4784314, 1, 1,
0.2820898, 1.911738, -0.9916838, 0, 0.4705882, 1, 1,
0.2831532, -1.418839, 1.68664, 0, 0.4666667, 1, 1,
0.2840542, -0.1649655, 1.519966, 0, 0.4588235, 1, 1,
0.2849768, 0.3805884, 1.850044, 0, 0.454902, 1, 1,
0.2854415, -0.7284682, 2.264932, 0, 0.4470588, 1, 1,
0.286007, -1.13522, 1.661578, 0, 0.4431373, 1, 1,
0.2890068, -0.2754661, 0.69561, 0, 0.4352941, 1, 1,
0.290778, 0.5361549, 0.5936226, 0, 0.4313726, 1, 1,
0.291816, 1.968345, 2.496964, 0, 0.4235294, 1, 1,
0.2945632, 0.1359991, 1.472476, 0, 0.4196078, 1, 1,
0.3072986, -0.06048908, 1.624907, 0, 0.4117647, 1, 1,
0.3093018, 0.3974855, 1.549995, 0, 0.4078431, 1, 1,
0.315578, -0.0324598, 3.886281, 0, 0.4, 1, 1,
0.3160102, -1.598191, 1.234281, 0, 0.3921569, 1, 1,
0.3259457, 1.010118, 2.241709, 0, 0.3882353, 1, 1,
0.3279094, -1.078132, 1.844432, 0, 0.3803922, 1, 1,
0.3283183, -0.8120789, 3.592804, 0, 0.3764706, 1, 1,
0.3292275, 1.143401, -1.494327, 0, 0.3686275, 1, 1,
0.3318675, 0.2781502, 1.571908, 0, 0.3647059, 1, 1,
0.3353062, -0.758296, 3.037653, 0, 0.3568628, 1, 1,
0.339543, 1.404985, -0.3870269, 0, 0.3529412, 1, 1,
0.3399884, -1.387039, 1.73031, 0, 0.345098, 1, 1,
0.3402066, -0.3503886, 1.016273, 0, 0.3411765, 1, 1,
0.3406804, 0.5975788, 0.6452872, 0, 0.3333333, 1, 1,
0.3409563, 1.04644, 0.32982, 0, 0.3294118, 1, 1,
0.3417527, -0.5621563, 2.205765, 0, 0.3215686, 1, 1,
0.3428474, 0.8561395, -0.05017659, 0, 0.3176471, 1, 1,
0.3453782, 1.015421, -1.604885, 0, 0.3098039, 1, 1,
0.3467439, -3.13837, 4.177034, 0, 0.3058824, 1, 1,
0.3475606, -1.316088, 4.995915, 0, 0.2980392, 1, 1,
0.3548031, -1.564067, 4.298105, 0, 0.2901961, 1, 1,
0.3555708, -0.426789, 0.2395369, 0, 0.2862745, 1, 1,
0.3578214, -1.143251, 1.55221, 0, 0.2784314, 1, 1,
0.3630989, 1.490425, -0.1373075, 0, 0.2745098, 1, 1,
0.3656626, 1.759161, -0.5323403, 0, 0.2666667, 1, 1,
0.3696457, -1.472318, 1.562471, 0, 0.2627451, 1, 1,
0.3697293, -0.2318713, 1.492033, 0, 0.254902, 1, 1,
0.3753497, 0.5706571, 0.8730273, 0, 0.2509804, 1, 1,
0.3780904, -0.779738, 4.227031, 0, 0.2431373, 1, 1,
0.3790541, -0.3557223, 3.280784, 0, 0.2392157, 1, 1,
0.3798429, -0.6386521, 3.868999, 0, 0.2313726, 1, 1,
0.3808563, 0.009241794, 1.127043, 0, 0.227451, 1, 1,
0.3871742, 0.1727444, 1.022365, 0, 0.2196078, 1, 1,
0.3879203, -1.241617, 3.225384, 0, 0.2156863, 1, 1,
0.3914678, 1.285354, 1.612823, 0, 0.2078431, 1, 1,
0.3938507, -0.6843151, 2.009581, 0, 0.2039216, 1, 1,
0.3973258, -0.08041216, 1.342918, 0, 0.1960784, 1, 1,
0.3998297, -1.783029, 1.266896, 0, 0.1882353, 1, 1,
0.4014236, 0.7987961, 0.6335179, 0, 0.1843137, 1, 1,
0.4032093, 0.8733201, 2.08321, 0, 0.1764706, 1, 1,
0.4056683, 0.07213252, 2.249539, 0, 0.172549, 1, 1,
0.4138127, -0.2272671, 4.113152, 0, 0.1647059, 1, 1,
0.4140256, 1.12185, 1.935491, 0, 0.1607843, 1, 1,
0.4147979, -1.421353, 3.348122, 0, 0.1529412, 1, 1,
0.4179153, -0.3501568, 1.075691, 0, 0.1490196, 1, 1,
0.4188335, 0.08853647, 1.866277, 0, 0.1411765, 1, 1,
0.4198858, 0.3729979, 0.6802345, 0, 0.1372549, 1, 1,
0.4224004, 0.6608156, -0.3072479, 0, 0.1294118, 1, 1,
0.4244958, 1.352671, -1.187035, 0, 0.1254902, 1, 1,
0.4261357, -0.3162949, 2.408239, 0, 0.1176471, 1, 1,
0.4279826, -1.215603, 3.483884, 0, 0.1137255, 1, 1,
0.4282398, 2.409651, 0.6960675, 0, 0.1058824, 1, 1,
0.4306901, 0.4204866, 2.517612, 0, 0.09803922, 1, 1,
0.431865, 0.9041684, -0.6680574, 0, 0.09411765, 1, 1,
0.4350666, 0.4670831, 0.3746438, 0, 0.08627451, 1, 1,
0.4367304, -2.022606, 4.159178, 0, 0.08235294, 1, 1,
0.447796, -0.06312948, 2.335166, 0, 0.07450981, 1, 1,
0.4489624, -1.745287, 2.640018, 0, 0.07058824, 1, 1,
0.454579, 1.590525, -0.2134695, 0, 0.0627451, 1, 1,
0.4549631, -1.1075, 3.004429, 0, 0.05882353, 1, 1,
0.4583755, -0.3466424, 1.273263, 0, 0.05098039, 1, 1,
0.459204, 1.029064, -1.004469, 0, 0.04705882, 1, 1,
0.4600689, -0.4112701, 1.594614, 0, 0.03921569, 1, 1,
0.465873, -1.036885, 2.31673, 0, 0.03529412, 1, 1,
0.4671673, 0.4872233, -0.2062987, 0, 0.02745098, 1, 1,
0.4673341, 2.173352, -1.485779, 0, 0.02352941, 1, 1,
0.4679075, 1.077694, -0.6843766, 0, 0.01568628, 1, 1,
0.468654, -1.295442, 1.814111, 0, 0.01176471, 1, 1,
0.4695241, 2.520858, -0.3644365, 0, 0.003921569, 1, 1,
0.4695775, 1.501873, -0.08242721, 0.003921569, 0, 1, 1,
0.4771605, -0.02602722, 2.657349, 0.007843138, 0, 1, 1,
0.4797376, -0.7414429, 1.156112, 0.01568628, 0, 1, 1,
0.4810931, 0.4433485, 2.913384, 0.01960784, 0, 1, 1,
0.4822285, -1.246262, 0.7228183, 0.02745098, 0, 1, 1,
0.4841079, 0.6188994, 0.382168, 0.03137255, 0, 1, 1,
0.4848701, 1.402315, 0.4234191, 0.03921569, 0, 1, 1,
0.492982, 1.637188, -0.5039831, 0.04313726, 0, 1, 1,
0.4945081, 0.3255937, 2.32743, 0.05098039, 0, 1, 1,
0.4952881, 0.2497242, 3.642744, 0.05490196, 0, 1, 1,
0.4974314, -0.1423616, 1.737943, 0.0627451, 0, 1, 1,
0.5014638, -0.2442357, 2.664325, 0.06666667, 0, 1, 1,
0.5069121, 0.2619862, -0.4391304, 0.07450981, 0, 1, 1,
0.5079672, -0.5801858, 3.147021, 0.07843138, 0, 1, 1,
0.5119805, 1.384712, 0.4655941, 0.08627451, 0, 1, 1,
0.5131807, -1.006874, 1.728447, 0.09019608, 0, 1, 1,
0.5133073, 0.5553148, 0.2463778, 0.09803922, 0, 1, 1,
0.5145389, 0.5502563, -0.4515325, 0.1058824, 0, 1, 1,
0.5170151, 0.5723668, 0.5393667, 0.1098039, 0, 1, 1,
0.5201163, -0.6054071, -0.117768, 0.1176471, 0, 1, 1,
0.5214048, 0.3718233, 1.499508, 0.1215686, 0, 1, 1,
0.5240126, -1.194181, 2.95368, 0.1294118, 0, 1, 1,
0.5255457, -0.4176609, 2.252209, 0.1333333, 0, 1, 1,
0.5289995, 0.2649504, 1.361457, 0.1411765, 0, 1, 1,
0.5295181, 0.6940417, 0.6744123, 0.145098, 0, 1, 1,
0.5304486, 0.5907485, -0.04345491, 0.1529412, 0, 1, 1,
0.5342482, -0.4153218, 1.454445, 0.1568628, 0, 1, 1,
0.5355457, -0.5356142, 2.835122, 0.1647059, 0, 1, 1,
0.5487863, 2.3341, -0.5068054, 0.1686275, 0, 1, 1,
0.5491026, -0.2719097, 1.958459, 0.1764706, 0, 1, 1,
0.5494397, -0.09146088, 0.4614507, 0.1803922, 0, 1, 1,
0.5525628, -0.1508827, 2.653406, 0.1882353, 0, 1, 1,
0.5574498, -0.04725982, 0.7728479, 0.1921569, 0, 1, 1,
0.5593706, -0.3302336, 4.268564, 0.2, 0, 1, 1,
0.5660724, 0.3249241, 0.5886375, 0.2078431, 0, 1, 1,
0.5669625, -0.4542941, 3.269846, 0.2117647, 0, 1, 1,
0.5670976, -0.968894, 3.295664, 0.2196078, 0, 1, 1,
0.5717166, -1.210168, 2.154395, 0.2235294, 0, 1, 1,
0.5746562, -0.7495576, 1.777951, 0.2313726, 0, 1, 1,
0.574729, -1.146795, 2.115584, 0.2352941, 0, 1, 1,
0.5752636, 0.5441814, 2.735607, 0.2431373, 0, 1, 1,
0.5820265, 1.292826, 1.136975, 0.2470588, 0, 1, 1,
0.5830999, -0.01875982, 1.301801, 0.254902, 0, 1, 1,
0.5873306, 0.5948152, 2.425678, 0.2588235, 0, 1, 1,
0.5876167, 2.285479, 1.095033, 0.2666667, 0, 1, 1,
0.5878826, -0.6477351, 0.843492, 0.2705882, 0, 1, 1,
0.5934011, -1.183449, 3.900791, 0.2784314, 0, 1, 1,
0.5977396, -0.6573971, 2.391995, 0.282353, 0, 1, 1,
0.601974, -1.337511, 3.598481, 0.2901961, 0, 1, 1,
0.605212, -0.1725661, 1.993825, 0.2941177, 0, 1, 1,
0.6112329, 0.1218337, -0.4481445, 0.3019608, 0, 1, 1,
0.61357, -0.8605224, 1.20669, 0.3098039, 0, 1, 1,
0.6197503, 0.2306461, -0.03139189, 0.3137255, 0, 1, 1,
0.6230971, -0.1104306, 2.383923, 0.3215686, 0, 1, 1,
0.6280597, -0.7646136, 2.491299, 0.3254902, 0, 1, 1,
0.6286708, -0.9511744, 2.540557, 0.3333333, 0, 1, 1,
0.6302906, 0.3912698, -0.6736765, 0.3372549, 0, 1, 1,
0.6318772, -1.218657, 0.8999563, 0.345098, 0, 1, 1,
0.6419941, 0.4440852, -0.065398, 0.3490196, 0, 1, 1,
0.6438892, 1.28661, -0.7111768, 0.3568628, 0, 1, 1,
0.6466624, 1.276704, 0.8213757, 0.3607843, 0, 1, 1,
0.6527761, -1.652912, 3.842389, 0.3686275, 0, 1, 1,
0.6547242, -1.324059, 3.724395, 0.372549, 0, 1, 1,
0.6548607, -0.420406, 2.820991, 0.3803922, 0, 1, 1,
0.6554322, 0.3540302, 2.20515, 0.3843137, 0, 1, 1,
0.6607031, 1.520554, -0.1668513, 0.3921569, 0, 1, 1,
0.6677889, -0.1540589, 1.409182, 0.3960784, 0, 1, 1,
0.6682639, 0.5953803, 0.4884177, 0.4039216, 0, 1, 1,
0.6737701, -0.6711582, 2.591562, 0.4117647, 0, 1, 1,
0.6756329, 1.000617, 1.148, 0.4156863, 0, 1, 1,
0.676174, 0.3297603, 1.0633, 0.4235294, 0, 1, 1,
0.6830304, -1.734825, 1.831763, 0.427451, 0, 1, 1,
0.6871774, 0.7714587, 0.1513811, 0.4352941, 0, 1, 1,
0.6913716, 1.630185, 1.508682, 0.4392157, 0, 1, 1,
0.6973438, 0.1036409, 0.716005, 0.4470588, 0, 1, 1,
0.698431, 0.9443148, -0.7220873, 0.4509804, 0, 1, 1,
0.7015365, -0.8597195, 2.357547, 0.4588235, 0, 1, 1,
0.7069793, -1.968557, 3.24053, 0.4627451, 0, 1, 1,
0.7086248, -0.5867569, 2.116862, 0.4705882, 0, 1, 1,
0.7174677, 0.2112433, 3.910212, 0.4745098, 0, 1, 1,
0.7252556, -0.1282614, 2.122087, 0.4823529, 0, 1, 1,
0.726954, -0.4062929, 0.8042892, 0.4862745, 0, 1, 1,
0.7288135, -1.343539, 1.740982, 0.4941176, 0, 1, 1,
0.7314659, 0.8327887, 0.2926883, 0.5019608, 0, 1, 1,
0.7336453, -2.077384, 3.720331, 0.5058824, 0, 1, 1,
0.733754, -1.546849, 2.741827, 0.5137255, 0, 1, 1,
0.7358182, -0.3441746, 1.747342, 0.5176471, 0, 1, 1,
0.7392352, -0.02731618, 0.9504639, 0.5254902, 0, 1, 1,
0.7453883, -0.321989, 1.11734, 0.5294118, 0, 1, 1,
0.7454883, 0.6837894, 0.4583334, 0.5372549, 0, 1, 1,
0.7488473, 0.3095211, 1.820994, 0.5411765, 0, 1, 1,
0.7489891, -1.175642, 4.592803, 0.5490196, 0, 1, 1,
0.7499632, -1.173344, 1.674417, 0.5529412, 0, 1, 1,
0.7544082, 0.7571591, 1.373962, 0.5607843, 0, 1, 1,
0.7552015, -0.7069401, 1.106289, 0.5647059, 0, 1, 1,
0.7552847, -1.451556, 2.447736, 0.572549, 0, 1, 1,
0.7587056, 1.678969, -0.1920354, 0.5764706, 0, 1, 1,
0.7593634, -2.580675, 2.673662, 0.5843138, 0, 1, 1,
0.7688153, -0.1542019, 1.956047, 0.5882353, 0, 1, 1,
0.7705862, 0.5753452, 1.989502, 0.5960785, 0, 1, 1,
0.7707701, 0.4032675, 0.7072549, 0.6039216, 0, 1, 1,
0.7718678, -0.1362153, 2.318033, 0.6078432, 0, 1, 1,
0.7720448, 0.8645465, 1.13694, 0.6156863, 0, 1, 1,
0.7723849, 0.104807, 1.706864, 0.6196079, 0, 1, 1,
0.7726079, 1.161403, -0.3731254, 0.627451, 0, 1, 1,
0.7756962, -0.103004, 2.563743, 0.6313726, 0, 1, 1,
0.7800115, -1.34367, 1.847149, 0.6392157, 0, 1, 1,
0.780355, 0.07804497, -0.2237354, 0.6431373, 0, 1, 1,
0.7841628, -1.255798, 1.179299, 0.6509804, 0, 1, 1,
0.7896909, -1.303023, 2.680342, 0.654902, 0, 1, 1,
0.7919234, 1.44849, 0.231228, 0.6627451, 0, 1, 1,
0.7949592, 0.6499649, 2.013041, 0.6666667, 0, 1, 1,
0.7998905, 0.5197058, 1.281449, 0.6745098, 0, 1, 1,
0.8093351, 0.4787125, 1.280253, 0.6784314, 0, 1, 1,
0.8141529, 0.08209331, 3.478101, 0.6862745, 0, 1, 1,
0.815927, -0.287487, 3.31012, 0.6901961, 0, 1, 1,
0.8191761, 0.9698754, -1.98009, 0.6980392, 0, 1, 1,
0.8202848, 0.03458079, 1.285403, 0.7058824, 0, 1, 1,
0.8227075, -1.179789, 1.893078, 0.7098039, 0, 1, 1,
0.8264639, -0.7476049, 1.775249, 0.7176471, 0, 1, 1,
0.8310825, 0.2858984, 2.374912, 0.7215686, 0, 1, 1,
0.8314627, -1.107937, 3.149056, 0.7294118, 0, 1, 1,
0.8352507, 0.4959022, 1.73257, 0.7333333, 0, 1, 1,
0.8368898, -0.3947677, 1.692238, 0.7411765, 0, 1, 1,
0.8410757, 1.202381, 0.3928402, 0.7450981, 0, 1, 1,
0.852572, 1.537411, 0.5535579, 0.7529412, 0, 1, 1,
0.8594386, -0.8381176, 1.479094, 0.7568628, 0, 1, 1,
0.8594808, 0.699692, -1.129395, 0.7647059, 0, 1, 1,
0.8600091, -0.6901123, 2.669665, 0.7686275, 0, 1, 1,
0.8642591, -0.8056701, 2.217904, 0.7764706, 0, 1, 1,
0.8651645, 0.9139999, 0.4181403, 0.7803922, 0, 1, 1,
0.8672161, 1.311897, 0.1571323, 0.7882353, 0, 1, 1,
0.8693501, -0.1530573, 1.446869, 0.7921569, 0, 1, 1,
0.8810799, 0.8122345, 0.7390376, 0.8, 0, 1, 1,
0.8896448, -0.04627682, 1.703046, 0.8078431, 0, 1, 1,
0.891786, -0.9555744, 2.78881, 0.8117647, 0, 1, 1,
0.8976144, -0.04778048, 2.625309, 0.8196079, 0, 1, 1,
0.8993391, 2.322506, -0.2391001, 0.8235294, 0, 1, 1,
0.8997555, -0.7315257, 0.2772529, 0.8313726, 0, 1, 1,
0.9020977, -1.003285, 3.342397, 0.8352941, 0, 1, 1,
0.9029534, -0.1100864, 3.656597, 0.8431373, 0, 1, 1,
0.9100013, 0.9299777, -0.441282, 0.8470588, 0, 1, 1,
0.9173063, -0.01080417, 1.877119, 0.854902, 0, 1, 1,
0.9365837, 0.8761792, 1.359342, 0.8588235, 0, 1, 1,
0.9401299, -0.9169484, -0.3412415, 0.8666667, 0, 1, 1,
0.9450283, 1.433516, 0.837755, 0.8705882, 0, 1, 1,
0.9483106, -1.361201, 2.027417, 0.8784314, 0, 1, 1,
0.9493281, -0.7801386, 1.206608, 0.8823529, 0, 1, 1,
0.9501402, -1.166262, 4.30874, 0.8901961, 0, 1, 1,
0.9509896, 0.3051024, 2.337103, 0.8941177, 0, 1, 1,
0.9564592, -2.816262, 5.639346, 0.9019608, 0, 1, 1,
0.9648543, 0.9518895, 1.737359, 0.9098039, 0, 1, 1,
0.9651375, -0.3240319, 2.829767, 0.9137255, 0, 1, 1,
0.9667495, -0.6547493, 3.155769, 0.9215686, 0, 1, 1,
0.9682209, -1.327526, 3.314288, 0.9254902, 0, 1, 1,
0.9705089, -0.3217899, 0.8971691, 0.9333333, 0, 1, 1,
0.9724334, -0.7857077, 1.757939, 0.9372549, 0, 1, 1,
0.974172, -0.3788588, 2.914183, 0.945098, 0, 1, 1,
0.9779818, -0.1752244, 0.879387, 0.9490196, 0, 1, 1,
0.9786057, 0.3426843, -0.05455878, 0.9568627, 0, 1, 1,
0.9793465, 0.6625171, 2.046732, 0.9607843, 0, 1, 1,
0.9794101, 0.3335949, 1.429595, 0.9686275, 0, 1, 1,
0.9812748, -1.127144, 2.583565, 0.972549, 0, 1, 1,
0.9846392, 0.6541687, 2.780143, 0.9803922, 0, 1, 1,
0.9857517, 0.6947085, 1.202621, 0.9843137, 0, 1, 1,
0.9858276, 1.004867, 1.672354, 0.9921569, 0, 1, 1,
0.9863042, 0.2530511, 0.9846997, 0.9960784, 0, 1, 1,
0.9875284, -0.3496279, 2.951573, 1, 0, 0.9960784, 1,
0.9933709, 0.3406285, -0.1993184, 1, 0, 0.9882353, 1,
0.9970851, 0.4497567, 0.1322527, 1, 0, 0.9843137, 1,
1.007899, 0.1034994, 1.365249, 1, 0, 0.9764706, 1,
1.009694, -1.345375, 3.499289, 1, 0, 0.972549, 1,
1.010082, -0.6597739, 2.39549, 1, 0, 0.9647059, 1,
1.012828, -0.1328584, 1.354109, 1, 0, 0.9607843, 1,
1.015679, 0.2979803, 0.6059049, 1, 0, 0.9529412, 1,
1.028736, -0.415091, 1.641075, 1, 0, 0.9490196, 1,
1.035125, -2.070886, 0.5767014, 1, 0, 0.9411765, 1,
1.03713, 0.3884588, 1.627493, 1, 0, 0.9372549, 1,
1.042679, -0.4415932, 3.490426, 1, 0, 0.9294118, 1,
1.045195, -1.459062, 3.209696, 1, 0, 0.9254902, 1,
1.075908, -1.868771, 2.264125, 1, 0, 0.9176471, 1,
1.0802, -0.191492, 0.2790865, 1, 0, 0.9137255, 1,
1.084976, 0.1041589, 2.222764, 1, 0, 0.9058824, 1,
1.086422, -0.2793677, 2.051064, 1, 0, 0.9019608, 1,
1.094369, -0.3558261, 2.741282, 1, 0, 0.8941177, 1,
1.09987, 1.470467, -2.598163, 1, 0, 0.8862745, 1,
1.106683, -0.1951501, 3.514206, 1, 0, 0.8823529, 1,
1.115611, 1.323679, 0.4034033, 1, 0, 0.8745098, 1,
1.118153, -0.3663553, 1.469866, 1, 0, 0.8705882, 1,
1.119233, 0.16921, 1.032421, 1, 0, 0.8627451, 1,
1.136861, -0.7516684, 2.888016, 1, 0, 0.8588235, 1,
1.137115, 2.432013, -1.043604, 1, 0, 0.8509804, 1,
1.141285, 0.3406269, 0.4743912, 1, 0, 0.8470588, 1,
1.142294, -0.8907807, 2.683353, 1, 0, 0.8392157, 1,
1.143303, 0.4217375, 1.85477, 1, 0, 0.8352941, 1,
1.14782, 2.096242, 1.470951, 1, 0, 0.827451, 1,
1.158226, 1.595498, 0.7248129, 1, 0, 0.8235294, 1,
1.164202, 0.6652211, -0.3838089, 1, 0, 0.8156863, 1,
1.165579, 2.378906, 1.103786, 1, 0, 0.8117647, 1,
1.169348, -0.9508923, 3.037086, 1, 0, 0.8039216, 1,
1.188627, -0.5329813, 3.176785, 1, 0, 0.7960784, 1,
1.189771, -0.2149431, 0.6465968, 1, 0, 0.7921569, 1,
1.190287, -1.894145, 1.100891, 1, 0, 0.7843137, 1,
1.190295, -0.5476217, 2.4092, 1, 0, 0.7803922, 1,
1.192975, -1.179282, 3.648902, 1, 0, 0.772549, 1,
1.199585, 0.9250048, 0.912427, 1, 0, 0.7686275, 1,
1.200032, 0.6441452, 1.983563, 1, 0, 0.7607843, 1,
1.200253, 0.8880278, 0.6019149, 1, 0, 0.7568628, 1,
1.200374, 0.2533624, 2.924432, 1, 0, 0.7490196, 1,
1.205133, -1.883575, 1.136339, 1, 0, 0.7450981, 1,
1.205891, -1.133441, 2.277203, 1, 0, 0.7372549, 1,
1.221755, 0.09019808, 1.600372, 1, 0, 0.7333333, 1,
1.223542, -0.5610092, 1.169584, 1, 0, 0.7254902, 1,
1.223991, -0.811063, 1.098958, 1, 0, 0.7215686, 1,
1.224042, 0.1876365, 0.4932047, 1, 0, 0.7137255, 1,
1.228383, -0.4377981, 0.4700204, 1, 0, 0.7098039, 1,
1.233286, -0.1345882, 3.12567, 1, 0, 0.7019608, 1,
1.236603, -2.535622, 5.065445, 1, 0, 0.6941177, 1,
1.24303, -1.124518, 3.00396, 1, 0, 0.6901961, 1,
1.250002, 1.55429, 1.82979, 1, 0, 0.682353, 1,
1.252861, 0.3189941, 1.057375, 1, 0, 0.6784314, 1,
1.257568, 1.402724, 0.5383424, 1, 0, 0.6705883, 1,
1.260839, -0.7806077, 1.736739, 1, 0, 0.6666667, 1,
1.269485, 0.242005, 1.914066, 1, 0, 0.6588235, 1,
1.270618, -1.445918, 1.912642, 1, 0, 0.654902, 1,
1.270762, -0.2811895, 4.000238, 1, 0, 0.6470588, 1,
1.274489, 0.1775017, 1.711147, 1, 0, 0.6431373, 1,
1.279453, -0.2472408, 3.611327, 1, 0, 0.6352941, 1,
1.280876, 0.2065449, 0.2455321, 1, 0, 0.6313726, 1,
1.283504, 0.9619252, 0.8641423, 1, 0, 0.6235294, 1,
1.285258, -0.6175579, 3.694959, 1, 0, 0.6196079, 1,
1.286579, 0.1647428, 1.40081, 1, 0, 0.6117647, 1,
1.29703, -1.163829, 3.338859, 1, 0, 0.6078432, 1,
1.306, -0.7753276, 2.285809, 1, 0, 0.6, 1,
1.306231, -1.234917, 2.735502, 1, 0, 0.5921569, 1,
1.31434, 1.369346, -0.3114628, 1, 0, 0.5882353, 1,
1.323561, -0.5339503, 1.022365, 1, 0, 0.5803922, 1,
1.334547, -0.07355069, -0.3941416, 1, 0, 0.5764706, 1,
1.335806, 1.347723, 0.8190053, 1, 0, 0.5686275, 1,
1.336863, 0.06391313, 0.7331305, 1, 0, 0.5647059, 1,
1.337806, 1.683513, -1.3313, 1, 0, 0.5568628, 1,
1.342374, 0.9532317, 1.753155, 1, 0, 0.5529412, 1,
1.342917, 0.6397187, 2.024419, 1, 0, 0.5450981, 1,
1.343069, -0.7766212, 3.229204, 1, 0, 0.5411765, 1,
1.355113, -0.1814523, 0.9474458, 1, 0, 0.5333334, 1,
1.358199, -0.2452713, 2.273163, 1, 0, 0.5294118, 1,
1.37493, 1.684094, 2.702146, 1, 0, 0.5215687, 1,
1.376735, -0.7340503, 1.310407, 1, 0, 0.5176471, 1,
1.385043, 0.4589963, 0.6216034, 1, 0, 0.509804, 1,
1.390947, -0.3916548, 0.6791568, 1, 0, 0.5058824, 1,
1.392633, 0.2537584, 1.054435, 1, 0, 0.4980392, 1,
1.408961, 0.03752377, 1.723112, 1, 0, 0.4901961, 1,
1.409787, 0.9551239, -0.2959664, 1, 0, 0.4862745, 1,
1.410665, 0.4450886, 3.238589, 1, 0, 0.4784314, 1,
1.416348, 1.561535, -0.07288751, 1, 0, 0.4745098, 1,
1.42622, 2.840756, 0.9799381, 1, 0, 0.4666667, 1,
1.432085, 0.3598725, 1.170208, 1, 0, 0.4627451, 1,
1.435385, -1.563747, 3.511024, 1, 0, 0.454902, 1,
1.444973, 0.77403, 1.084576, 1, 0, 0.4509804, 1,
1.470531, -0.2373949, 0.7039744, 1, 0, 0.4431373, 1,
1.474354, -0.04925195, 1.425626, 1, 0, 0.4392157, 1,
1.489976, -0.6082371, 1.422962, 1, 0, 0.4313726, 1,
1.494141, -0.4914434, 0.796375, 1, 0, 0.427451, 1,
1.510955, 0.374707, 1.782558, 1, 0, 0.4196078, 1,
1.52578, 0.7346726, 1.62365, 1, 0, 0.4156863, 1,
1.531823, 0.8293063, 0.7711632, 1, 0, 0.4078431, 1,
1.535785, -0.561919, 1.126356, 1, 0, 0.4039216, 1,
1.539999, 0.9264364, 2.205221, 1, 0, 0.3960784, 1,
1.541375, -0.03993509, 0.6804276, 1, 0, 0.3882353, 1,
1.550091, 0.1740061, 2.456853, 1, 0, 0.3843137, 1,
1.562298, -0.4605234, 1.760075, 1, 0, 0.3764706, 1,
1.577046, -0.674185, 3.613747, 1, 0, 0.372549, 1,
1.577912, -0.2476245, 1.508324, 1, 0, 0.3647059, 1,
1.58267, 0.1587946, 0.8144727, 1, 0, 0.3607843, 1,
1.583257, -1.205665, 2.836142, 1, 0, 0.3529412, 1,
1.598246, -0.9671016, 1.422599, 1, 0, 0.3490196, 1,
1.604204, 0.7055096, 1.316344, 1, 0, 0.3411765, 1,
1.615879, 0.3218571, 0.06125741, 1, 0, 0.3372549, 1,
1.620327, 1.331986, 0.5289398, 1, 0, 0.3294118, 1,
1.662561, 0.0700683, 3.015065, 1, 0, 0.3254902, 1,
1.670117, -0.3400606, 1.804054, 1, 0, 0.3176471, 1,
1.679405, 1.058212, 1.731232, 1, 0, 0.3137255, 1,
1.688668, 0.5892482, 1.371686, 1, 0, 0.3058824, 1,
1.700427, -0.6978205, 2.343804, 1, 0, 0.2980392, 1,
1.706763, 0.5956212, -0.5598692, 1, 0, 0.2941177, 1,
1.716037, -0.3791824, 1.546791, 1, 0, 0.2862745, 1,
1.723048, 0.8416637, 1.692899, 1, 0, 0.282353, 1,
1.735726, -1.522283, 2.119243, 1, 0, 0.2745098, 1,
1.744373, -1.332138, 2.792069, 1, 0, 0.2705882, 1,
1.757033, 0.574975, 2.740589, 1, 0, 0.2627451, 1,
1.757757, -0.3308961, 2.003684, 1, 0, 0.2588235, 1,
1.761466, 0.3995205, 3.804367, 1, 0, 0.2509804, 1,
1.767423, 2.335826, -0.2720149, 1, 0, 0.2470588, 1,
1.767577, 0.05487847, 0.4180486, 1, 0, 0.2392157, 1,
1.786018, 1.488939, 0.09104688, 1, 0, 0.2352941, 1,
1.789317, 2.266007, 1.303393, 1, 0, 0.227451, 1,
1.807986, -0.8436662, 3.96909, 1, 0, 0.2235294, 1,
1.814622, 0.2356251, 0.6439493, 1, 0, 0.2156863, 1,
1.849622, -0.5684041, 1.641871, 1, 0, 0.2117647, 1,
1.856191, -0.7523007, 3.098916, 1, 0, 0.2039216, 1,
1.881648, -1.582932, 2.58385, 1, 0, 0.1960784, 1,
1.914727, 1.163499, 0.8104949, 1, 0, 0.1921569, 1,
1.935161, -1.554977, 4.912371, 1, 0, 0.1843137, 1,
1.943413, -0.7842894, 0.7486218, 1, 0, 0.1803922, 1,
1.944758, -0.6200475, 1.232887, 1, 0, 0.172549, 1,
1.946854, -0.04659458, 2.724694, 1, 0, 0.1686275, 1,
1.958856, 0.2415525, 1.265842, 1, 0, 0.1607843, 1,
1.964184, -0.9872124, 1.014015, 1, 0, 0.1568628, 1,
1.9657, -2.135153, 3.223738, 1, 0, 0.1490196, 1,
1.966052, -0.03045844, -0.04725651, 1, 0, 0.145098, 1,
2.007005, -0.1588394, 1.445684, 1, 0, 0.1372549, 1,
2.008247, 2.55635, 2.219677, 1, 0, 0.1333333, 1,
2.016277, 0.1440662, 1.790629, 1, 0, 0.1254902, 1,
2.034809, 0.2296066, -0.5052034, 1, 0, 0.1215686, 1,
2.042617, -0.674936, 1.606142, 1, 0, 0.1137255, 1,
2.053922, -0.4240902, 2.785398, 1, 0, 0.1098039, 1,
2.065192, -1.109226, 1.54063, 1, 0, 0.1019608, 1,
2.098822, 0.7485104, 1.156685, 1, 0, 0.09411765, 1,
2.10235, 0.9113036, 1.437977, 1, 0, 0.09019608, 1,
2.134294, 2.97897, 0.5196931, 1, 0, 0.08235294, 1,
2.156189, -0.4237174, 0.6292414, 1, 0, 0.07843138, 1,
2.166795, 0.515143, 0.3531045, 1, 0, 0.07058824, 1,
2.173123, 0.5087042, 1.523587, 1, 0, 0.06666667, 1,
2.208799, -1.221692, 0.5325828, 1, 0, 0.05882353, 1,
2.237061, 0.4302806, 2.876398, 1, 0, 0.05490196, 1,
2.257564, -0.5258627, 1.885381, 1, 0, 0.04705882, 1,
2.288868, 0.9595976, 1.020496, 1, 0, 0.04313726, 1,
2.446629, 0.6102558, 1.471299, 1, 0, 0.03529412, 1,
2.476619, 1.132533, 1.809401, 1, 0, 0.03137255, 1,
2.542127, 2.998897, 1.513032, 1, 0, 0.02352941, 1,
2.725195, 0.07622635, 1.019103, 1, 0, 0.01960784, 1,
2.831936, 0.700141, 1.394573, 1, 0, 0.01176471, 1,
2.894409, -0.2166854, 0.3536333, 1, 0, 0.007843138, 1
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
0.06283104, -4.262624, -7.065571, 0, -0.5, 0.5, 0.5,
0.06283104, -4.262624, -7.065571, 1, -0.5, 0.5, 0.5,
0.06283104, -4.262624, -7.065571, 1, 1.5, 0.5, 0.5,
0.06283104, -4.262624, -7.065571, 0, 1.5, 0.5, 0.5
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
-3.728652, 0.1780164, -7.065571, 0, -0.5, 0.5, 0.5,
-3.728652, 0.1780164, -7.065571, 1, -0.5, 0.5, 0.5,
-3.728652, 0.1780164, -7.065571, 1, 1.5, 0.5, 0.5,
-3.728652, 0.1780164, -7.065571, 0, 1.5, 0.5, 0.5
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
-3.728652, -4.262624, 0.2075732, 0, -0.5, 0.5, 0.5,
-3.728652, -4.262624, 0.2075732, 1, -0.5, 0.5, 0.5,
-3.728652, -4.262624, 0.2075732, 1, 1.5, 0.5, 0.5,
-3.728652, -4.262624, 0.2075732, 0, 1.5, 0.5, 0.5
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
-2, -3.237861, -5.387153,
2, -3.237861, -5.387153,
-2, -3.237861, -5.387153,
-2, -3.408655, -5.666889,
-1, -3.237861, -5.387153,
-1, -3.408655, -5.666889,
0, -3.237861, -5.387153,
0, -3.408655, -5.666889,
1, -3.237861, -5.387153,
1, -3.408655, -5.666889,
2, -3.237861, -5.387153,
2, -3.408655, -5.666889
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
-2, -3.750243, -6.226362, 0, -0.5, 0.5, 0.5,
-2, -3.750243, -6.226362, 1, -0.5, 0.5, 0.5,
-2, -3.750243, -6.226362, 1, 1.5, 0.5, 0.5,
-2, -3.750243, -6.226362, 0, 1.5, 0.5, 0.5,
-1, -3.750243, -6.226362, 0, -0.5, 0.5, 0.5,
-1, -3.750243, -6.226362, 1, -0.5, 0.5, 0.5,
-1, -3.750243, -6.226362, 1, 1.5, 0.5, 0.5,
-1, -3.750243, -6.226362, 0, 1.5, 0.5, 0.5,
0, -3.750243, -6.226362, 0, -0.5, 0.5, 0.5,
0, -3.750243, -6.226362, 1, -0.5, 0.5, 0.5,
0, -3.750243, -6.226362, 1, 1.5, 0.5, 0.5,
0, -3.750243, -6.226362, 0, 1.5, 0.5, 0.5,
1, -3.750243, -6.226362, 0, -0.5, 0.5, 0.5,
1, -3.750243, -6.226362, 1, -0.5, 0.5, 0.5,
1, -3.750243, -6.226362, 1, 1.5, 0.5, 0.5,
1, -3.750243, -6.226362, 0, 1.5, 0.5, 0.5,
2, -3.750243, -6.226362, 0, -0.5, 0.5, 0.5,
2, -3.750243, -6.226362, 1, -0.5, 0.5, 0.5,
2, -3.750243, -6.226362, 1, 1.5, 0.5, 0.5,
2, -3.750243, -6.226362, 0, 1.5, 0.5, 0.5
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
-2.853694, -3, -5.387153,
-2.853694, 3, -5.387153,
-2.853694, -3, -5.387153,
-2.999521, -3, -5.666889,
-2.853694, -2, -5.387153,
-2.999521, -2, -5.666889,
-2.853694, -1, -5.387153,
-2.999521, -1, -5.666889,
-2.853694, 0, -5.387153,
-2.999521, 0, -5.666889,
-2.853694, 1, -5.387153,
-2.999521, 1, -5.666889,
-2.853694, 2, -5.387153,
-2.999521, 2, -5.666889,
-2.853694, 3, -5.387153,
-2.999521, 3, -5.666889
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
-3.291173, -3, -6.226362, 0, -0.5, 0.5, 0.5,
-3.291173, -3, -6.226362, 1, -0.5, 0.5, 0.5,
-3.291173, -3, -6.226362, 1, 1.5, 0.5, 0.5,
-3.291173, -3, -6.226362, 0, 1.5, 0.5, 0.5,
-3.291173, -2, -6.226362, 0, -0.5, 0.5, 0.5,
-3.291173, -2, -6.226362, 1, -0.5, 0.5, 0.5,
-3.291173, -2, -6.226362, 1, 1.5, 0.5, 0.5,
-3.291173, -2, -6.226362, 0, 1.5, 0.5, 0.5,
-3.291173, -1, -6.226362, 0, -0.5, 0.5, 0.5,
-3.291173, -1, -6.226362, 1, -0.5, 0.5, 0.5,
-3.291173, -1, -6.226362, 1, 1.5, 0.5, 0.5,
-3.291173, -1, -6.226362, 0, 1.5, 0.5, 0.5,
-3.291173, 0, -6.226362, 0, -0.5, 0.5, 0.5,
-3.291173, 0, -6.226362, 1, -0.5, 0.5, 0.5,
-3.291173, 0, -6.226362, 1, 1.5, 0.5, 0.5,
-3.291173, 0, -6.226362, 0, 1.5, 0.5, 0.5,
-3.291173, 1, -6.226362, 0, -0.5, 0.5, 0.5,
-3.291173, 1, -6.226362, 1, -0.5, 0.5, 0.5,
-3.291173, 1, -6.226362, 1, 1.5, 0.5, 0.5,
-3.291173, 1, -6.226362, 0, 1.5, 0.5, 0.5,
-3.291173, 2, -6.226362, 0, -0.5, 0.5, 0.5,
-3.291173, 2, -6.226362, 1, -0.5, 0.5, 0.5,
-3.291173, 2, -6.226362, 1, 1.5, 0.5, 0.5,
-3.291173, 2, -6.226362, 0, 1.5, 0.5, 0.5,
-3.291173, 3, -6.226362, 0, -0.5, 0.5, 0.5,
-3.291173, 3, -6.226362, 1, -0.5, 0.5, 0.5,
-3.291173, 3, -6.226362, 1, 1.5, 0.5, 0.5,
-3.291173, 3, -6.226362, 0, 1.5, 0.5, 0.5
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
-2.853694, -3.237861, -4,
-2.853694, -3.237861, 4,
-2.853694, -3.237861, -4,
-2.999521, -3.408655, -4,
-2.853694, -3.237861, -2,
-2.999521, -3.408655, -2,
-2.853694, -3.237861, 0,
-2.999521, -3.408655, 0,
-2.853694, -3.237861, 2,
-2.999521, -3.408655, 2,
-2.853694, -3.237861, 4,
-2.999521, -3.408655, 4
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
-3.291173, -3.750243, -4, 0, -0.5, 0.5, 0.5,
-3.291173, -3.750243, -4, 1, -0.5, 0.5, 0.5,
-3.291173, -3.750243, -4, 1, 1.5, 0.5, 0.5,
-3.291173, -3.750243, -4, 0, 1.5, 0.5, 0.5,
-3.291173, -3.750243, -2, 0, -0.5, 0.5, 0.5,
-3.291173, -3.750243, -2, 1, -0.5, 0.5, 0.5,
-3.291173, -3.750243, -2, 1, 1.5, 0.5, 0.5,
-3.291173, -3.750243, -2, 0, 1.5, 0.5, 0.5,
-3.291173, -3.750243, 0, 0, -0.5, 0.5, 0.5,
-3.291173, -3.750243, 0, 1, -0.5, 0.5, 0.5,
-3.291173, -3.750243, 0, 1, 1.5, 0.5, 0.5,
-3.291173, -3.750243, 0, 0, 1.5, 0.5, 0.5,
-3.291173, -3.750243, 2, 0, -0.5, 0.5, 0.5,
-3.291173, -3.750243, 2, 1, -0.5, 0.5, 0.5,
-3.291173, -3.750243, 2, 1, 1.5, 0.5, 0.5,
-3.291173, -3.750243, 2, 0, 1.5, 0.5, 0.5,
-3.291173, -3.750243, 4, 0, -0.5, 0.5, 0.5,
-3.291173, -3.750243, 4, 1, -0.5, 0.5, 0.5,
-3.291173, -3.750243, 4, 1, 1.5, 0.5, 0.5,
-3.291173, -3.750243, 4, 0, 1.5, 0.5, 0.5
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
-2.853694, -3.237861, -5.387153,
-2.853694, 3.593894, -5.387153,
-2.853694, -3.237861, 5.802299,
-2.853694, 3.593894, 5.802299,
-2.853694, -3.237861, -5.387153,
-2.853694, -3.237861, 5.802299,
-2.853694, 3.593894, -5.387153,
-2.853694, 3.593894, 5.802299,
-2.853694, -3.237861, -5.387153,
2.979356, -3.237861, -5.387153,
-2.853694, -3.237861, 5.802299,
2.979356, -3.237861, 5.802299,
-2.853694, 3.593894, -5.387153,
2.979356, 3.593894, -5.387153,
-2.853694, 3.593894, 5.802299,
2.979356, 3.593894, 5.802299,
2.979356, -3.237861, -5.387153,
2.979356, 3.593894, -5.387153,
2.979356, -3.237861, 5.802299,
2.979356, 3.593894, 5.802299,
2.979356, -3.237861, -5.387153,
2.979356, -3.237861, 5.802299,
2.979356, 3.593894, -5.387153,
2.979356, 3.593894, 5.802299
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
var radius = 7.662225;
var distance = 34.09011;
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
mvMatrix.translate( -0.06283104, -0.1780164, -0.2075732 );
mvMatrix.scale( 1.420277, 1.212653, 0.740389 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.09011);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Dilan<-read.table("Dilan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Dilan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Dilan' not found
```

```r
y<-Dilan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Dilan' not found
```

```r
z<-Dilan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Dilan' not found
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
-2.768747, -0.3027961, -2.203974, 0, 0, 1, 1, 1,
-2.756464, -0.1390312, -0.7243983, 1, 0, 0, 1, 1,
-2.731446, -0.8386492, -2.560786, 1, 0, 0, 1, 1,
-2.671121, -0.6576955, -0.7316576, 1, 0, 0, 1, 1,
-2.596945, -0.1086229, -1.617203, 1, 0, 0, 1, 1,
-2.441522, -0.8515147, -0.2672248, 1, 0, 0, 1, 1,
-2.409193, -0.2950828, -3.661148, 0, 0, 0, 1, 1,
-2.394493, -0.1920557, 0.04772956, 0, 0, 0, 1, 1,
-2.385849, 1.200493, -1.732735, 0, 0, 0, 1, 1,
-2.339324, 0.1400345, -1.34031, 0, 0, 0, 1, 1,
-2.311236, -0.6802438, -0.2138621, 0, 0, 0, 1, 1,
-2.27131, 1.681937, -1.11761, 0, 0, 0, 1, 1,
-2.199602, -0.3475435, -1.675728, 0, 0, 0, 1, 1,
-2.173056, -2.015386, -2.809348, 1, 1, 1, 1, 1,
-2.163158, 0.06786117, -0.6551601, 1, 1, 1, 1, 1,
-2.116826, -0.389912, -0.4050758, 1, 1, 1, 1, 1,
-2.086406, -0.1684698, -2.692028, 1, 1, 1, 1, 1,
-2.045979, 0.4943611, -1.262712, 1, 1, 1, 1, 1,
-2.0395, 3.494402, -0.9791135, 1, 1, 1, 1, 1,
-2.035386, 0.04664358, -1.184693, 1, 1, 1, 1, 1,
-2.016623, 0.6735713, -1.685221, 1, 1, 1, 1, 1,
-2.016218, -0.8919186, -1.987718, 1, 1, 1, 1, 1,
-1.996412, -1.24974, -2.54097, 1, 1, 1, 1, 1,
-1.968976, -0.04900163, -1.979039, 1, 1, 1, 1, 1,
-1.952724, -1.366976, -3.546434, 1, 1, 1, 1, 1,
-1.949506, 0.3181227, -0.8070608, 1, 1, 1, 1, 1,
-1.947689, 1.901272, -0.5226502, 1, 1, 1, 1, 1,
-1.942726, -0.7038952, -0.1845483, 1, 1, 1, 1, 1,
-1.933756, 0.3092252, -1.426531, 0, 0, 1, 1, 1,
-1.914627, 0.7668136, -0.9954355, 1, 0, 0, 1, 1,
-1.9042, 1.029078, -0.5632209, 1, 0, 0, 1, 1,
-1.903614, -0.2788744, -2.473325, 1, 0, 0, 1, 1,
-1.8685, -1.163561, -1.063338, 1, 0, 0, 1, 1,
-1.866263, -0.6158644, -0.9515716, 1, 0, 0, 1, 1,
-1.865083, -0.1314014, -1.911821, 0, 0, 0, 1, 1,
-1.857638, 0.08315596, -2.878938, 0, 0, 0, 1, 1,
-1.851402, -0.4531331, -2.044687, 0, 0, 0, 1, 1,
-1.845717, -1.689985, -2.047989, 0, 0, 0, 1, 1,
-1.83351, 0.2237874, -0.2734551, 0, 0, 0, 1, 1,
-1.832151, -0.2689277, -1.755139, 0, 0, 0, 1, 1,
-1.819578, -1.584283, -1.686532, 0, 0, 0, 1, 1,
-1.818596, 1.729249, -0.5946457, 1, 1, 1, 1, 1,
-1.817967, 0.9397851, -0.9180386, 1, 1, 1, 1, 1,
-1.813788, -0.919827, -1.392041, 1, 1, 1, 1, 1,
-1.810776, 0.4561327, -1.219693, 1, 1, 1, 1, 1,
-1.787639, -0.5295162, -3.56026, 1, 1, 1, 1, 1,
-1.770617, -0.5277026, -2.956026, 1, 1, 1, 1, 1,
-1.728844, -0.3044018, -1.605209, 1, 1, 1, 1, 1,
-1.726779, -0.04379945, -2.13875, 1, 1, 1, 1, 1,
-1.683545, -0.9583448, -2.39518, 1, 1, 1, 1, 1,
-1.681355, -0.275407, -1.404463, 1, 1, 1, 1, 1,
-1.653356, -0.8294197, -1.828655, 1, 1, 1, 1, 1,
-1.652817, 0.6112359, -1.000917, 1, 1, 1, 1, 1,
-1.651392, -1.282193, -2.964128, 1, 1, 1, 1, 1,
-1.642757, -0.09365117, -2.398079, 1, 1, 1, 1, 1,
-1.636491, -1.596497, -2.926898, 1, 1, 1, 1, 1,
-1.6256, -0.3733921, -1.757511, 0, 0, 1, 1, 1,
-1.624176, -0.8401149, -2.222506, 1, 0, 0, 1, 1,
-1.606783, -0.5930684, -0.3194361, 1, 0, 0, 1, 1,
-1.575214, -1.125141, -5.113974, 1, 0, 0, 1, 1,
-1.560824, -0.5654959, -1.556633, 1, 0, 0, 1, 1,
-1.556238, 0.389482, -0.7949327, 1, 0, 0, 1, 1,
-1.552169, 0.6235127, -0.9566556, 0, 0, 0, 1, 1,
-1.551396, 1.323072, 0.6188694, 0, 0, 0, 1, 1,
-1.549175, 1.426723, -1.411964, 0, 0, 0, 1, 1,
-1.538893, 0.6750948, -2.524022, 0, 0, 0, 1, 1,
-1.530231, 0.2586978, -0.9480349, 0, 0, 0, 1, 1,
-1.530165, 1.824494, -0.7382392, 0, 0, 0, 1, 1,
-1.525228, 0.9559606, -1.293094, 0, 0, 0, 1, 1,
-1.519917, -2.270992, -2.670947, 1, 1, 1, 1, 1,
-1.511503, -0.2314381, -2.002521, 1, 1, 1, 1, 1,
-1.505704, 0.9368508, -0.5632411, 1, 1, 1, 1, 1,
-1.504781, -0.6931459, -1.429833, 1, 1, 1, 1, 1,
-1.497666, 1.660928, 0.2564846, 1, 1, 1, 1, 1,
-1.495725, 1.292049, -2.38389, 1, 1, 1, 1, 1,
-1.495632, 1.551252, -0.8332477, 1, 1, 1, 1, 1,
-1.494451, 0.754906, -2.162034, 1, 1, 1, 1, 1,
-1.491245, -1.671791, -2.575888, 1, 1, 1, 1, 1,
-1.477197, -0.3261563, -1.28761, 1, 1, 1, 1, 1,
-1.471034, -2.360344, -3.039988, 1, 1, 1, 1, 1,
-1.45766, 1.222671, -1.419679, 1, 1, 1, 1, 1,
-1.452222, 1.798688, -1.508493, 1, 1, 1, 1, 1,
-1.448467, -0.02880482, -1.775799, 1, 1, 1, 1, 1,
-1.448221, -2.13484, -1.895585, 1, 1, 1, 1, 1,
-1.43503, 0.411357, -0.3976291, 0, 0, 1, 1, 1,
-1.425173, 0.1274572, -0.9740364, 1, 0, 0, 1, 1,
-1.42459, -2.15324, -3.147907, 1, 0, 0, 1, 1,
-1.423883, 0.691106, -2.942166, 1, 0, 0, 1, 1,
-1.422411, -0.7084993, -1.170095, 1, 0, 0, 1, 1,
-1.420796, 0.8293584, -2.215875, 1, 0, 0, 1, 1,
-1.41339, 0.8708499, -0.8248784, 0, 0, 0, 1, 1,
-1.395847, -1.020738, -1.932135, 0, 0, 0, 1, 1,
-1.383743, -0.5319263, -2.284028, 0, 0, 0, 1, 1,
-1.382767, -0.4928746, -2.780467, 0, 0, 0, 1, 1,
-1.377329, 1.44224, -0.345734, 0, 0, 0, 1, 1,
-1.370576, -1.331956, -3.937355, 0, 0, 0, 1, 1,
-1.353123, 2.07207, -0.6774864, 0, 0, 0, 1, 1,
-1.342227, -0.7525306, -2.973674, 1, 1, 1, 1, 1,
-1.339335, 1.816122, -2.21523, 1, 1, 1, 1, 1,
-1.338431, 0.1997367, -0.3897284, 1, 1, 1, 1, 1,
-1.337724, -0.4091759, -1.035199, 1, 1, 1, 1, 1,
-1.333104, -0.2425718, -1.95323, 1, 1, 1, 1, 1,
-1.332624, 1.119089, -0.6977242, 1, 1, 1, 1, 1,
-1.331872, -1.148115, -1.69888, 1, 1, 1, 1, 1,
-1.315226, 0.5064744, -0.6381994, 1, 1, 1, 1, 1,
-1.30824, -1.548375, -1.587494, 1, 1, 1, 1, 1,
-1.304504, 0.9247854, -2.885754, 1, 1, 1, 1, 1,
-1.296837, 0.02863048, -0.3083971, 1, 1, 1, 1, 1,
-1.296265, -2.642857, -0.8132878, 1, 1, 1, 1, 1,
-1.296194, 1.505105, -2.48222, 1, 1, 1, 1, 1,
-1.29497, -1.305748, -3.08576, 1, 1, 1, 1, 1,
-1.262589, -0.2204728, -2.102228, 1, 1, 1, 1, 1,
-1.257469, -0.4539185, -1.829081, 0, 0, 1, 1, 1,
-1.252443, 1.280687, -2.156339, 1, 0, 0, 1, 1,
-1.249539, -1.749174, -0.6449283, 1, 0, 0, 1, 1,
-1.246002, -0.2644883, -2.345201, 1, 0, 0, 1, 1,
-1.237411, -1.525686, -2.124662, 1, 0, 0, 1, 1,
-1.234812, -0.3224958, -3.874957, 1, 0, 0, 1, 1,
-1.230569, -0.4667784, -5.2242, 0, 0, 0, 1, 1,
-1.226692, 1.247265, 1.357405, 0, 0, 0, 1, 1,
-1.213344, -0.5627121, -0.4862417, 0, 0, 0, 1, 1,
-1.204486, 1.038092, -1.217292, 0, 0, 0, 1, 1,
-1.199922, -0.5610341, -1.573099, 0, 0, 0, 1, 1,
-1.189816, -2.036962, -2.675945, 0, 0, 0, 1, 1,
-1.188589, 0.09070799, 0.643855, 0, 0, 0, 1, 1,
-1.175974, -0.1733722, -1.834712, 1, 1, 1, 1, 1,
-1.174976, -1.440281, -3.679163, 1, 1, 1, 1, 1,
-1.16904, -0.7985825, -2.085685, 1, 1, 1, 1, 1,
-1.164054, -0.711432, -2.550677, 1, 1, 1, 1, 1,
-1.16215, 0.3555959, -1.274984, 1, 1, 1, 1, 1,
-1.162002, -0.02470355, -0.8313549, 1, 1, 1, 1, 1,
-1.156326, 0.9441308, 0.0173976, 1, 1, 1, 1, 1,
-1.15388, -0.6984547, -3.650556, 1, 1, 1, 1, 1,
-1.152507, -0.152736, -1.649289, 1, 1, 1, 1, 1,
-1.152394, -0.9056271, -2.879226, 1, 1, 1, 1, 1,
-1.138531, 1.099127, -3.033937, 1, 1, 1, 1, 1,
-1.136501, 0.4665089, -0.1253974, 1, 1, 1, 1, 1,
-1.130027, -0.9838818, -2.698871, 1, 1, 1, 1, 1,
-1.129429, -0.7684108, -2.259696, 1, 1, 1, 1, 1,
-1.127302, 0.4728864, -2.603946, 1, 1, 1, 1, 1,
-1.125741, 0.6529509, -0.7061916, 0, 0, 1, 1, 1,
-1.121862, -0.7369482, -0.7696263, 1, 0, 0, 1, 1,
-1.116324, 0.4324732, -2.97708, 1, 0, 0, 1, 1,
-1.115123, 0.1381304, -1.609848, 1, 0, 0, 1, 1,
-1.112907, 0.6257426, 0.7694097, 1, 0, 0, 1, 1,
-1.097989, 1.847765, -1.86758, 1, 0, 0, 1, 1,
-1.094507, -0.2760111, -1.176769, 0, 0, 0, 1, 1,
-1.084861, -1.272713, -1.674547, 0, 0, 0, 1, 1,
-1.068927, 0.9457166, -2.661017, 0, 0, 0, 1, 1,
-1.056264, -0.1807096, -0.5102261, 0, 0, 0, 1, 1,
-1.055789, 0.4438527, -1.507388, 0, 0, 0, 1, 1,
-1.049316, -0.103315, -2.014977, 0, 0, 0, 1, 1,
-1.047977, -1.237337, -1.841317, 0, 0, 0, 1, 1,
-1.041944, -0.2369067, -2.963311, 1, 1, 1, 1, 1,
-1.037024, -0.3785869, -0.946687, 1, 1, 1, 1, 1,
-1.033712, -0.2456908, -1.395484, 1, 1, 1, 1, 1,
-1.022335, 0.7412603, 0.2882022, 1, 1, 1, 1, 1,
-1.021611, 0.168036, -0.6115707, 1, 1, 1, 1, 1,
-0.9999118, 1.644317, -2.468238, 1, 1, 1, 1, 1,
-0.9992005, -0.700348, -1.528768, 1, 1, 1, 1, 1,
-0.9954723, 2.714892, -1.160205, 1, 1, 1, 1, 1,
-0.9910099, 1.44365, -1.505397, 1, 1, 1, 1, 1,
-0.9898272, 1.698912, -1.336281, 1, 1, 1, 1, 1,
-0.9785821, -0.6075207, -1.464522, 1, 1, 1, 1, 1,
-0.9730354, -0.2573162, -1.782254, 1, 1, 1, 1, 1,
-0.9719841, -1.93474, -3.288204, 1, 1, 1, 1, 1,
-0.9715314, 0.3572914, 0.01857458, 1, 1, 1, 1, 1,
-0.9533193, -0.6795835, -2.177019, 1, 1, 1, 1, 1,
-0.9510954, 2.630091, 0.8340896, 0, 0, 1, 1, 1,
-0.9436695, 1.092437, -0.1611728, 1, 0, 0, 1, 1,
-0.9409259, 0.6447791, -0.1760802, 1, 0, 0, 1, 1,
-0.9305007, -1.534743, -3.281342, 1, 0, 0, 1, 1,
-0.9143423, 1.3793, -1.400721, 1, 0, 0, 1, 1,
-0.9114252, 0.01172486, -0.3313679, 1, 0, 0, 1, 1,
-0.9105782, -0.1245274, -1.785622, 0, 0, 0, 1, 1,
-0.9060342, -0.06748012, -1.819522, 0, 0, 0, 1, 1,
-0.9045384, 1.504873, -0.5588536, 0, 0, 0, 1, 1,
-0.9040515, -0.3041992, -2.753829, 0, 0, 0, 1, 1,
-0.8975125, 0.1451433, -1.770703, 0, 0, 0, 1, 1,
-0.8961353, 0.1062637, -2.054104, 0, 0, 0, 1, 1,
-0.8947912, 0.8468467, -2.919642, 0, 0, 0, 1, 1,
-0.888498, 0.1558665, -3.653736, 1, 1, 1, 1, 1,
-0.8859303, -1.053128, -3.082165, 1, 1, 1, 1, 1,
-0.8857565, 1.019181, -1.258291, 1, 1, 1, 1, 1,
-0.8826944, 1.052656, -2.410979, 1, 1, 1, 1, 1,
-0.8765167, -0.8058804, -2.327028, 1, 1, 1, 1, 1,
-0.8684151, 0.1499446, -0.1004332, 1, 1, 1, 1, 1,
-0.8668401, 1.34371, -1.096453, 1, 1, 1, 1, 1,
-0.8630072, -0.675873, -3.610406, 1, 1, 1, 1, 1,
-0.8605332, 0.8147812, -0.2985629, 1, 1, 1, 1, 1,
-0.8594568, -0.1124088, -2.610638, 1, 1, 1, 1, 1,
-0.8587949, 0.9519237, 0.1934011, 1, 1, 1, 1, 1,
-0.8579353, 0.5808148, -2.874791, 1, 1, 1, 1, 1,
-0.8573751, -1.259895, -3.384302, 1, 1, 1, 1, 1,
-0.85456, 0.6339993, -2.310879, 1, 1, 1, 1, 1,
-0.8473961, -2.524542, -3.38709, 1, 1, 1, 1, 1,
-0.8466914, 0.9381959, -0.9489685, 0, 0, 1, 1, 1,
-0.8462139, 0.6253992, -1.943649, 1, 0, 0, 1, 1,
-0.8433249, 0.2445637, -0.7377496, 1, 0, 0, 1, 1,
-0.8355091, 0.5557925, -0.4415861, 1, 0, 0, 1, 1,
-0.8279356, 0.6859272, 0.6844519, 1, 0, 0, 1, 1,
-0.8277121, -1.450852, -4.820701, 1, 0, 0, 1, 1,
-0.8216681, 0.9956955, -0.9426086, 0, 0, 0, 1, 1,
-0.8191418, -0.1732269, -1.597501, 0, 0, 0, 1, 1,
-0.8168575, 0.07104506, -0.148506, 0, 0, 0, 1, 1,
-0.8161268, 1.294527, 0.08604357, 0, 0, 0, 1, 1,
-0.8087849, -0.6359236, -2.218168, 0, 0, 0, 1, 1,
-0.8047677, -0.0752336, -2.752596, 0, 0, 0, 1, 1,
-0.8018146, -0.2750683, -1.008083, 0, 0, 0, 1, 1,
-0.7946662, -0.1785346, -1.069519, 1, 1, 1, 1, 1,
-0.792168, -0.1092619, -2.052852, 1, 1, 1, 1, 1,
-0.7848154, 0.8150223, 0.8148476, 1, 1, 1, 1, 1,
-0.7827513, -0.190096, -2.015307, 1, 1, 1, 1, 1,
-0.7719275, 1.218731, 0.1750142, 1, 1, 1, 1, 1,
-0.7711146, -0.6239023, -1.968526, 1, 1, 1, 1, 1,
-0.7707562, 1.719847, -1.107334, 1, 1, 1, 1, 1,
-0.7689865, 0.5678943, -0.3747331, 1, 1, 1, 1, 1,
-0.7675068, -0.1183145, -0.7317514, 1, 1, 1, 1, 1,
-0.7668803, -0.5390364, -1.390841, 1, 1, 1, 1, 1,
-0.7609718, -2.032978, -3.059459, 1, 1, 1, 1, 1,
-0.7600324, -0.9615102, -3.641826, 1, 1, 1, 1, 1,
-0.7569221, -0.7121454, -2.898266, 1, 1, 1, 1, 1,
-0.7556859, -0.06729793, -4.314307, 1, 1, 1, 1, 1,
-0.753292, 1.869518, -3.197631, 1, 1, 1, 1, 1,
-0.7499021, 0.1401705, 0.3901725, 0, 0, 1, 1, 1,
-0.7470582, 1.694576, 0.793224, 1, 0, 0, 1, 1,
-0.7425483, 0.3327232, -0.597467, 1, 0, 0, 1, 1,
-0.7402956, -0.0568327, -2.426271, 1, 0, 0, 1, 1,
-0.7358745, -1.731938, -2.424214, 1, 0, 0, 1, 1,
-0.7328907, 0.4093961, -2.475766, 1, 0, 0, 1, 1,
-0.7267002, 0.3975867, -1.274138, 0, 0, 0, 1, 1,
-0.726566, 0.3335778, -3.451359, 0, 0, 0, 1, 1,
-0.7253258, 0.8679718, -0.4934943, 0, 0, 0, 1, 1,
-0.7175381, 0.1583136, -0.5288845, 0, 0, 0, 1, 1,
-0.7163957, -0.2174769, -4.107768, 0, 0, 0, 1, 1,
-0.7104483, -0.5287094, -1.541768, 0, 0, 0, 1, 1,
-0.7039845, 1.514992, -1.576078, 0, 0, 0, 1, 1,
-0.7037058, 0.718784, -1.176226, 1, 1, 1, 1, 1,
-0.6998774, -0.6564279, -1.383422, 1, 1, 1, 1, 1,
-0.6993915, 0.286656, -3.132924, 1, 1, 1, 1, 1,
-0.6977792, -0.6335368, -2.405501, 1, 1, 1, 1, 1,
-0.6942602, -0.1315179, -1.634779, 1, 1, 1, 1, 1,
-0.6938034, -0.3854204, -2.747796, 1, 1, 1, 1, 1,
-0.6892541, 0.1922633, -0.9639376, 1, 1, 1, 1, 1,
-0.6789683, -0.09582105, -0.5159815, 1, 1, 1, 1, 1,
-0.6780561, 1.37878, -0.5571394, 1, 1, 1, 1, 1,
-0.6755521, 0.365414, -2.294887, 1, 1, 1, 1, 1,
-0.6727146, 0.5884821, 1.008751, 1, 1, 1, 1, 1,
-0.6696195, -1.998453, -3.082409, 1, 1, 1, 1, 1,
-0.6670778, 0.7141435, -0.5438063, 1, 1, 1, 1, 1,
-0.6631768, 1.293663, -1.326923, 1, 1, 1, 1, 1,
-0.6590048, 1.198422, 0.543712, 1, 1, 1, 1, 1,
-0.6585138, 1.11839, -1.419602, 0, 0, 1, 1, 1,
-0.6580626, 0.9659613, -0.4595672, 1, 0, 0, 1, 1,
-0.6573423, 1.137876, -1.44821, 1, 0, 0, 1, 1,
-0.6531567, 1.054087, -0.5177666, 1, 0, 0, 1, 1,
-0.6490338, 0.448843, -0.164812, 1, 0, 0, 1, 1,
-0.6486598, 0.2302889, -0.2100959, 1, 0, 0, 1, 1,
-0.6480373, -1.080714, -2.716704, 0, 0, 0, 1, 1,
-0.6427763, -0.3665275, -2.20146, 0, 0, 0, 1, 1,
-0.6410919, -0.09485877, -1.112377, 0, 0, 0, 1, 1,
-0.6347213, -1.079918, -1.493781, 0, 0, 0, 1, 1,
-0.6306208, -0.2789248, -1.204142, 0, 0, 0, 1, 1,
-0.6304852, -0.04785649, -1.693311, 0, 0, 0, 1, 1,
-0.6288556, -1.888163, -1.60372, 0, 0, 0, 1, 1,
-0.622582, -0.6087613, -3.117822, 1, 1, 1, 1, 1,
-0.6187919, -1.545414, -3.537717, 1, 1, 1, 1, 1,
-0.6122528, 0.2450965, -0.01895163, 1, 1, 1, 1, 1,
-0.6069158, -1.387173, -2.621986, 1, 1, 1, 1, 1,
-0.6055769, 0.8226717, 1.052113, 1, 1, 1, 1, 1,
-0.6029803, -0.9283409, -3.449279, 1, 1, 1, 1, 1,
-0.6026824, 0.3175174, -0.3041502, 1, 1, 1, 1, 1,
-0.6008617, -0.1922992, -1.844402, 1, 1, 1, 1, 1,
-0.5988628, -1.54009, -2.475192, 1, 1, 1, 1, 1,
-0.5892956, -1.011657, -1.414693, 1, 1, 1, 1, 1,
-0.588354, 1.72894, -0.5679735, 1, 1, 1, 1, 1,
-0.5854473, 0.9841748, -0.6476883, 1, 1, 1, 1, 1,
-0.5831889, -0.8715591, -2.179791, 1, 1, 1, 1, 1,
-0.5831538, -0.6043985, -1.735247, 1, 1, 1, 1, 1,
-0.582579, -0.8853335, -2.519895, 1, 1, 1, 1, 1,
-0.5821197, -1.228373, -3.167309, 0, 0, 1, 1, 1,
-0.580763, 0.6940894, -0.4244388, 1, 0, 0, 1, 1,
-0.5783741, 1.034085, 0.9930797, 1, 0, 0, 1, 1,
-0.5567421, -0.4318404, -1.707556, 1, 0, 0, 1, 1,
-0.5529999, -0.8725356, -4.144264, 1, 0, 0, 1, 1,
-0.5503154, -0.6542009, -2.660931, 1, 0, 0, 1, 1,
-0.5433656, -0.7492391, -4.654186, 0, 0, 0, 1, 1,
-0.5377622, 2.074418, -2.799804, 0, 0, 0, 1, 1,
-0.5278502, -0.02755802, -2.823105, 0, 0, 0, 1, 1,
-0.5270547, -1.102151, -0.9440787, 0, 0, 0, 1, 1,
-0.5263698, 1.121859, 0.06357315, 0, 0, 0, 1, 1,
-0.5260695, 0.6853663, -2.402028, 0, 0, 0, 1, 1,
-0.5253744, 1.317799, -2.3476, 0, 0, 0, 1, 1,
-0.5184866, 0.4430465, -0.382883, 1, 1, 1, 1, 1,
-0.5162188, 0.4591001, -2.275879, 1, 1, 1, 1, 1,
-0.5110934, -1.341542, -3.474911, 1, 1, 1, 1, 1,
-0.5024141, 0.2336875, -0.4404494, 1, 1, 1, 1, 1,
-0.5022941, 0.9824811, 0.4359533, 1, 1, 1, 1, 1,
-0.5007636, -0.4197336, -2.155877, 1, 1, 1, 1, 1,
-0.5001519, 0.5928184, -0.08101184, 1, 1, 1, 1, 1,
-0.4957927, -0.3721526, -1.63754, 1, 1, 1, 1, 1,
-0.49516, -0.3633367, -1.08129, 1, 1, 1, 1, 1,
-0.4911182, -0.1104098, -2.086813, 1, 1, 1, 1, 1,
-0.4888462, 0.1091871, -0.2047443, 1, 1, 1, 1, 1,
-0.4866189, 2.392462, 0.7688242, 1, 1, 1, 1, 1,
-0.4858428, -0.1044214, -0.9751914, 1, 1, 1, 1, 1,
-0.4765312, -0.8959414, -1.913895, 1, 1, 1, 1, 1,
-0.4754777, 1.012033, -3.152218, 1, 1, 1, 1, 1,
-0.470692, -0.3701098, -1.871581, 0, 0, 1, 1, 1,
-0.4603802, 1.064215, -0.3019302, 1, 0, 0, 1, 1,
-0.4577755, -0.2394069, -3.25938, 1, 0, 0, 1, 1,
-0.4530047, 0.4032696, -3.028571, 1, 0, 0, 1, 1,
-0.4506332, -1.110872, -2.977923, 1, 0, 0, 1, 1,
-0.4465537, 0.1653997, -1.910202, 1, 0, 0, 1, 1,
-0.4431834, -0.9676592, -2.609132, 0, 0, 0, 1, 1,
-0.4426113, 0.6309776, -1.593969, 0, 0, 0, 1, 1,
-0.4423684, 0.2297405, -0.8559765, 0, 0, 0, 1, 1,
-0.4420034, 0.49505, -1.980607, 0, 0, 0, 1, 1,
-0.4411252, -0.1093749, -1.653112, 0, 0, 0, 1, 1,
-0.4363463, 0.5967525, -0.8703673, 0, 0, 0, 1, 1,
-0.4311588, 0.3578625, -1.64127, 0, 0, 0, 1, 1,
-0.4276075, 0.4234986, 0.7337379, 1, 1, 1, 1, 1,
-0.4252099, 1.364313, -0.02195739, 1, 1, 1, 1, 1,
-0.4251975, 0.5993384, 0.3671379, 1, 1, 1, 1, 1,
-0.4202772, -1.861661, -3.454876, 1, 1, 1, 1, 1,
-0.4051935, 0.7712875, -3.352695, 1, 1, 1, 1, 1,
-0.4048836, 1.025797, -0.2756371, 1, 1, 1, 1, 1,
-0.4040477, 1.492635, 0.002085427, 1, 1, 1, 1, 1,
-0.4040023, -1.594393, -3.153483, 1, 1, 1, 1, 1,
-0.4014674, 0.8840794, -1.022266, 1, 1, 1, 1, 1,
-0.397278, -0.02858794, -0.7080629, 1, 1, 1, 1, 1,
-0.3950676, 0.6747805, -0.9359408, 1, 1, 1, 1, 1,
-0.3950465, 0.7686486, 0.3616846, 1, 1, 1, 1, 1,
-0.3935076, -0.0229982, -1.548335, 1, 1, 1, 1, 1,
-0.3889012, 0.9256349, -0.1062969, 1, 1, 1, 1, 1,
-0.3868797, 1.536298, -0.2865537, 1, 1, 1, 1, 1,
-0.368855, 0.5580466, -1.650886, 0, 0, 1, 1, 1,
-0.3657526, 0.7556521, -0.8777074, 1, 0, 0, 1, 1,
-0.3656461, 0.2856179, -0.7061285, 1, 0, 0, 1, 1,
-0.3648758, 0.2560128, -1.88802, 1, 0, 0, 1, 1,
-0.3595748, 0.04669992, -2.605806, 1, 0, 0, 1, 1,
-0.3589588, 0.7570608, -0.6556244, 1, 0, 0, 1, 1,
-0.3515377, -0.676373, -2.997052, 0, 0, 0, 1, 1,
-0.3513528, -0.310784, -2.158342, 0, 0, 0, 1, 1,
-0.3513222, -0.7063504, -2.259024, 0, 0, 0, 1, 1,
-0.350427, -0.1325693, -3.064069, 0, 0, 0, 1, 1,
-0.3487643, -0.02636147, -2.489828, 0, 0, 0, 1, 1,
-0.3484868, -0.4219936, -4.636271, 0, 0, 0, 1, 1,
-0.3468782, -0.5604957, -1.57257, 0, 0, 0, 1, 1,
-0.3416548, 1.535215, -0.8647842, 1, 1, 1, 1, 1,
-0.340339, -0.1280751, -2.947136, 1, 1, 1, 1, 1,
-0.339122, 0.6017399, -0.5562696, 1, 1, 1, 1, 1,
-0.3390034, 1.111211, -1.963616, 1, 1, 1, 1, 1,
-0.3387709, 0.3689514, -0.4207762, 1, 1, 1, 1, 1,
-0.3386277, 1.589988, 0.6191349, 1, 1, 1, 1, 1,
-0.3340185, -0.529968, -2.919249, 1, 1, 1, 1, 1,
-0.3333007, 0.4278423, -1.006749, 1, 1, 1, 1, 1,
-0.332101, 0.1499821, -1.342397, 1, 1, 1, 1, 1,
-0.3288805, -2.348681, -2.856225, 1, 1, 1, 1, 1,
-0.3273454, -1.400878, -3.665918, 1, 1, 1, 1, 1,
-0.3269201, 1.777848, 0.8071342, 1, 1, 1, 1, 1,
-0.3247955, 0.4256778, -1.807387, 1, 1, 1, 1, 1,
-0.3223348, 1.975017, -1.212447, 1, 1, 1, 1, 1,
-0.3202335, 0.1693267, -0.4665662, 1, 1, 1, 1, 1,
-0.3166939, -0.9340183, -4.376833, 0, 0, 1, 1, 1,
-0.3126417, 1.020794, 1.341698, 1, 0, 0, 1, 1,
-0.3049663, -2.444762, -2.359152, 1, 0, 0, 1, 1,
-0.3048255, 0.07452199, -1.743972, 1, 0, 0, 1, 1,
-0.3032674, -0.2841418, -1.509453, 1, 0, 0, 1, 1,
-0.3025357, 0.09783455, -1.120782, 1, 0, 0, 1, 1,
-0.300871, -0.8206611, -4.144388, 0, 0, 0, 1, 1,
-0.2997555, 1.220083, 0.1081669, 0, 0, 0, 1, 1,
-0.2991651, 0.3224275, -1.8889, 0, 0, 0, 1, 1,
-0.2978689, -0.4944926, -3.733148, 0, 0, 0, 1, 1,
-0.293007, -0.1064226, -3.085621, 0, 0, 0, 1, 1,
-0.2911179, -1.58367, -1.067399, 0, 0, 0, 1, 1,
-0.2881032, 0.3085103, -3.14169, 0, 0, 0, 1, 1,
-0.2854162, 0.9523894, -1.360971, 1, 1, 1, 1, 1,
-0.2809449, 0.5941702, 0.1046367, 1, 1, 1, 1, 1,
-0.2720709, 0.4624268, -2.229996, 1, 1, 1, 1, 1,
-0.271399, -0.3647736, -3.190191, 1, 1, 1, 1, 1,
-0.2690962, -0.6922342, -3.307748, 1, 1, 1, 1, 1,
-0.2688563, 0.2441986, 1.22972, 1, 1, 1, 1, 1,
-0.2583304, 0.8720307, -0.863831, 1, 1, 1, 1, 1,
-0.25103, -1.386279, -4.010552, 1, 1, 1, 1, 1,
-0.2490526, -0.1003612, -1.028052, 1, 1, 1, 1, 1,
-0.233637, -1.111968, -3.354012, 1, 1, 1, 1, 1,
-0.2296042, -0.211715, -0.1832397, 1, 1, 1, 1, 1,
-0.2271227, 0.6543247, -0.9250923, 1, 1, 1, 1, 1,
-0.2259621, 0.8897317, -0.8792368, 1, 1, 1, 1, 1,
-0.2198647, 0.04871365, -2.132787, 1, 1, 1, 1, 1,
-0.219602, 0.1099149, -1.987301, 1, 1, 1, 1, 1,
-0.2193167, 1.603759, 0.008970429, 0, 0, 1, 1, 1,
-0.2172904, -0.5031742, -3.371097, 1, 0, 0, 1, 1,
-0.212781, 1.380092, -0.00442476, 1, 0, 0, 1, 1,
-0.2106746, 0.6599609, 0.4287313, 1, 0, 0, 1, 1,
-0.2097479, 0.3954356, 0.3414643, 1, 0, 0, 1, 1,
-0.2094741, 0.6546261, -1.908248, 1, 0, 0, 1, 1,
-0.2062119, -0.5355721, -2.910389, 0, 0, 0, 1, 1,
-0.2044094, -0.1355497, -3.552362, 0, 0, 0, 1, 1,
-0.1978147, -0.6269954, -2.246815, 0, 0, 0, 1, 1,
-0.1957363, -1.011024, -3.434357, 0, 0, 0, 1, 1,
-0.1926224, 0.588881, 0.6350336, 0, 0, 0, 1, 1,
-0.1862681, 0.299944, -0.4362998, 0, 0, 0, 1, 1,
-0.1853736, 0.6291973, 1.342561, 0, 0, 0, 1, 1,
-0.1841744, -0.4914445, -1.924082, 1, 1, 1, 1, 1,
-0.1800279, 0.1566111, -1.939497, 1, 1, 1, 1, 1,
-0.1783768, 1.832714, 1.283034, 1, 1, 1, 1, 1,
-0.1753852, -0.0920142, -0.9911055, 1, 1, 1, 1, 1,
-0.1715022, -1.835348, -2.945996, 1, 1, 1, 1, 1,
-0.1697334, 0.3981327, -0.3144822, 1, 1, 1, 1, 1,
-0.1677826, 1.861924, 1.485049, 1, 1, 1, 1, 1,
-0.1669528, 0.2575299, 1.397084, 1, 1, 1, 1, 1,
-0.159617, -0.8887705, -4.064284, 1, 1, 1, 1, 1,
-0.1514559, -0.9624935, -2.414587, 1, 1, 1, 1, 1,
-0.1490505, 0.383839, -1.573971, 1, 1, 1, 1, 1,
-0.1474535, 1.638956, -1.903677, 1, 1, 1, 1, 1,
-0.1448648, 1.889191, 1.614911, 1, 1, 1, 1, 1,
-0.1427944, -1.076036, -3.325444, 1, 1, 1, 1, 1,
-0.1402297, -1.176621, -2.485311, 1, 1, 1, 1, 1,
-0.1368624, -0.1093095, -0.4262275, 0, 0, 1, 1, 1,
-0.1324152, -0.4827971, -2.067319, 1, 0, 0, 1, 1,
-0.1249037, 1.878353, 0.7591739, 1, 0, 0, 1, 1,
-0.1244671, 0.6190957, -0.9637797, 1, 0, 0, 1, 1,
-0.1190969, -0.8027656, -2.155944, 1, 0, 0, 1, 1,
-0.1178173, -1.045604, -2.523158, 1, 0, 0, 1, 1,
-0.1175344, 0.3172921, -0.3540999, 0, 0, 0, 1, 1,
-0.1175078, 1.301993, 0.6339679, 0, 0, 0, 1, 1,
-0.1173118, -1.23, -1.858968, 0, 0, 0, 1, 1,
-0.1169483, 0.5770475, 0.572081, 0, 0, 0, 1, 1,
-0.114173, 2.550275, 0.8364798, 0, 0, 0, 1, 1,
-0.1096952, 1.227082, 0.7072496, 0, 0, 0, 1, 1,
-0.1060135, -0.839495, -2.548652, 0, 0, 0, 1, 1,
-0.1052856, -0.3777221, -2.256157, 1, 1, 1, 1, 1,
-0.1025941, 1.855631, 0.5495318, 1, 1, 1, 1, 1,
-0.1004499, -0.9890031, -2.379221, 1, 1, 1, 1, 1,
-0.09897865, -0.1385177, -2.641517, 1, 1, 1, 1, 1,
-0.09421216, 0.297855, -1.84318, 1, 1, 1, 1, 1,
-0.09391087, 0.4720895, -1.418834, 1, 1, 1, 1, 1,
-0.09007386, -0.09790049, -3.307556, 1, 1, 1, 1, 1,
-0.08609762, -0.8486838, -4.225855, 1, 1, 1, 1, 1,
-0.08556087, 0.9226968, -0.1097118, 1, 1, 1, 1, 1,
-0.08401832, 0.2320896, -0.2078847, 1, 1, 1, 1, 1,
-0.08311503, -0.1278566, -2.280892, 1, 1, 1, 1, 1,
-0.08044078, -0.3756831, -4.308447, 1, 1, 1, 1, 1,
-0.08041634, 0.2275268, 0.2328811, 1, 1, 1, 1, 1,
-0.08021808, -1.015607, -2.743032, 1, 1, 1, 1, 1,
-0.08007254, 0.7654223, 0.3382035, 1, 1, 1, 1, 1,
-0.07276648, 0.06325471, -1.308934, 0, 0, 1, 1, 1,
-0.0722138, -1.040335, -2.481039, 1, 0, 0, 1, 1,
-0.06673232, -0.5317023, -0.3078311, 1, 0, 0, 1, 1,
-0.0642534, -1.424227, -2.94285, 1, 0, 0, 1, 1,
-0.0562649, 0.1458664, -1.130279, 1, 0, 0, 1, 1,
-0.05232549, 1.392914, -0.0774371, 1, 0, 0, 1, 1,
-0.05212533, 0.6605096, 0.5551504, 0, 0, 0, 1, 1,
-0.04610889, -0.981123, -2.273452, 0, 0, 0, 1, 1,
-0.04511143, 1.374241, 0.05653845, 0, 0, 0, 1, 1,
-0.04221812, -0.356777, -4.007679, 0, 0, 0, 1, 1,
-0.03296265, 1.163829, -0.586679, 0, 0, 0, 1, 1,
-0.03294267, 0.3475839, 0.9903855, 0, 0, 0, 1, 1,
-0.03068468, -1.048783, -3.163816, 0, 0, 0, 1, 1,
-0.02455687, -0.4461116, -3.131397, 1, 1, 1, 1, 1,
-0.02288399, 0.4801019, 0.6479815, 1, 1, 1, 1, 1,
-0.02197176, -0.1654445, -4.157485, 1, 1, 1, 1, 1,
-0.02193492, 0.09858304, -2.7955, 1, 1, 1, 1, 1,
-0.01945207, -0.0453959, -4.003014, 1, 1, 1, 1, 1,
-0.01563773, -0.506666, -3.939073, 1, 1, 1, 1, 1,
-0.01494318, 1.442132, 0.5414059, 1, 1, 1, 1, 1,
-0.01426857, -1.446432, -2.602742, 1, 1, 1, 1, 1,
-0.01222755, 0.4088, 0.5835371, 1, 1, 1, 1, 1,
-0.01128803, -1.266843, -3.965536, 1, 1, 1, 1, 1,
-0.009818834, -0.1842236, -2.441024, 1, 1, 1, 1, 1,
-0.007188722, -0.2105612, -3.985053, 1, 1, 1, 1, 1,
-0.006471274, -0.7915368, -2.174072, 1, 1, 1, 1, 1,
-0.001493988, -0.2804865, -3.217195, 1, 1, 1, 1, 1,
0.002100815, -0.308245, 3.497597, 1, 1, 1, 1, 1,
0.002314685, 0.1157551, 1.068377, 0, 0, 1, 1, 1,
0.003286276, -1.766967, 2.563281, 1, 0, 0, 1, 1,
0.01045709, -1.918549, 1.448114, 1, 0, 0, 1, 1,
0.01388774, 0.4425558, -0.1709225, 1, 0, 0, 1, 1,
0.01550708, -2.204427, 4.356631, 1, 0, 0, 1, 1,
0.01731301, -0.350197, 3.744373, 1, 0, 0, 1, 1,
0.01797243, -1.888346, 3.569561, 0, 0, 0, 1, 1,
0.01834032, -0.09404252, 3.404219, 0, 0, 0, 1, 1,
0.02144668, -1.017918, 2.162662, 0, 0, 0, 1, 1,
0.03342617, -0.1821221, 2.259294, 0, 0, 0, 1, 1,
0.03376973, 0.3649097, 0.7698241, 0, 0, 0, 1, 1,
0.03402144, 1.299915, -0.2264586, 0, 0, 0, 1, 1,
0.04131099, -0.1447594, 3.68356, 0, 0, 0, 1, 1,
0.04164553, -0.3829157, 2.261121, 1, 1, 1, 1, 1,
0.04241814, 0.5054091, -0.211233, 1, 1, 1, 1, 1,
0.04953369, 0.8310544, 0.0460619, 1, 1, 1, 1, 1,
0.05212781, -0.8809687, 2.847862, 1, 1, 1, 1, 1,
0.05225315, -1.856447, 1.761752, 1, 1, 1, 1, 1,
0.05502165, 0.2675117, -1.016083, 1, 1, 1, 1, 1,
0.05655662, -0.04575301, -0.1908704, 1, 1, 1, 1, 1,
0.05913273, -0.8536412, 3.6855, 1, 1, 1, 1, 1,
0.06059092, -0.7846164, 3.488223, 1, 1, 1, 1, 1,
0.06403457, 0.8609029, -1.848876, 1, 1, 1, 1, 1,
0.06411458, -0.08009098, 1.994112, 1, 1, 1, 1, 1,
0.06483546, -1.016735, 2.963454, 1, 1, 1, 1, 1,
0.07217404, 0.334191, -1.204908, 1, 1, 1, 1, 1,
0.0764433, 1.828389, 0.08662407, 1, 1, 1, 1, 1,
0.0791617, 0.3156001, 0.7222818, 1, 1, 1, 1, 1,
0.08499707, -0.4409107, 2.691612, 0, 0, 1, 1, 1,
0.08548497, -0.7047842, 4.383317, 1, 0, 0, 1, 1,
0.09081656, 0.2095831, 0.9220092, 1, 0, 0, 1, 1,
0.09094542, -1.15351, 2.967997, 1, 0, 0, 1, 1,
0.09292235, -1.094493, 2.598036, 1, 0, 0, 1, 1,
0.09792955, -0.4187482, 2.313228, 1, 0, 0, 1, 1,
0.1111545, -0.5856465, 2.918428, 0, 0, 0, 1, 1,
0.1126723, 1.385528, 0.758379, 0, 0, 0, 1, 1,
0.1146647, -1.695581, 2.689646, 0, 0, 0, 1, 1,
0.1178534, 0.6524237, -0.1519722, 0, 0, 0, 1, 1,
0.1219121, -1.177999, 2.773958, 0, 0, 0, 1, 1,
0.1219897, -0.6540665, 2.863639, 0, 0, 0, 1, 1,
0.122295, 1.498291, 0.1256072, 0, 0, 0, 1, 1,
0.1246603, -1.961592, 4.803178, 1, 1, 1, 1, 1,
0.1251002, 0.2502735, 1.086488, 1, 1, 1, 1, 1,
0.1258375, -1.083464, 2.677464, 1, 1, 1, 1, 1,
0.1279035, 0.3696637, -0.4838407, 1, 1, 1, 1, 1,
0.1290018, 0.2695634, 0.4200158, 1, 1, 1, 1, 1,
0.1298382, 1.584559, -1.479417, 1, 1, 1, 1, 1,
0.1309694, -0.3345439, 2.249499, 1, 1, 1, 1, 1,
0.1366894, 2.368108, 1.002269, 1, 1, 1, 1, 1,
0.1388501, 0.1492012, -1.165934, 1, 1, 1, 1, 1,
0.1391221, 1.904653, -0.4045619, 1, 1, 1, 1, 1,
0.140887, -0.1189696, 4.059193, 1, 1, 1, 1, 1,
0.1447629, -0.6569718, 3.984686, 1, 1, 1, 1, 1,
0.1475586, -0.7614395, 1.149046, 1, 1, 1, 1, 1,
0.1510813, -1.425773, 2.387625, 1, 1, 1, 1, 1,
0.1542657, 0.7162299, 0.8149287, 1, 1, 1, 1, 1,
0.1549801, 0.07945412, 0.5575345, 0, 0, 1, 1, 1,
0.16079, -1.263907, 1.972075, 1, 0, 0, 1, 1,
0.1617791, 0.0955389, -0.736534, 1, 0, 0, 1, 1,
0.1632586, 1.370873, 1.529743, 1, 0, 0, 1, 1,
0.16692, -1.653461, 2.717262, 1, 0, 0, 1, 1,
0.1705359, -0.79522, 3.566692, 1, 0, 0, 1, 1,
0.1718923, 1.01203, 1.192492, 0, 0, 0, 1, 1,
0.173525, 0.290197, -0.2015686, 0, 0, 0, 1, 1,
0.1751958, 0.03405769, 0.7993762, 0, 0, 0, 1, 1,
0.1786882, -1.132323, 3.262645, 0, 0, 0, 1, 1,
0.1829511, -1.422895, 5.229637, 0, 0, 0, 1, 1,
0.1894603, -0.5147108, 2.068429, 0, 0, 0, 1, 1,
0.1917298, -0.03144337, -0.03915265, 0, 0, 0, 1, 1,
0.1921471, 0.6993148, 0.1754707, 1, 1, 1, 1, 1,
0.1922942, -0.6381274, 4.12177, 1, 1, 1, 1, 1,
0.1948867, -0.8863262, 1.994335, 1, 1, 1, 1, 1,
0.2014782, 1.388995, -0.4231966, 1, 1, 1, 1, 1,
0.2018823, -0.1348899, 3.335596, 1, 1, 1, 1, 1,
0.2024354, 0.4394211, 2.603465, 1, 1, 1, 1, 1,
0.2047818, -1.221054, 4.944506, 1, 1, 1, 1, 1,
0.2050476, -0.4803886, 4.462429, 1, 1, 1, 1, 1,
0.2145417, 0.06371009, 1.000043, 1, 1, 1, 1, 1,
0.2148619, 0.2692068, 1.59737, 1, 1, 1, 1, 1,
0.2153712, 0.5008057, -0.5379038, 1, 1, 1, 1, 1,
0.2203885, -0.3269233, 1.670889, 1, 1, 1, 1, 1,
0.2207393, -1.236671, 2.402117, 1, 1, 1, 1, 1,
0.2290179, -0.2523994, 2.389908, 1, 1, 1, 1, 1,
0.2292863, 2.644645, 1.202931, 1, 1, 1, 1, 1,
0.23121, -0.219893, 3.618343, 0, 0, 1, 1, 1,
0.2345358, 0.1676313, 2.839164, 1, 0, 0, 1, 1,
0.2357963, -0.7885841, 2.510088, 1, 0, 0, 1, 1,
0.2362999, 0.2985653, 2.121735, 1, 0, 0, 1, 1,
0.2413822, 0.09207159, 2.362986, 1, 0, 0, 1, 1,
0.243827, 0.5037246, 1.307199, 1, 0, 0, 1, 1,
0.2444191, 0.2544654, -0.1905335, 0, 0, 0, 1, 1,
0.2450774, -1.491282, 3.838119, 0, 0, 0, 1, 1,
0.2500885, -0.4357486, 2.326712, 0, 0, 0, 1, 1,
0.2531419, -1.211036, 2.199132, 0, 0, 0, 1, 1,
0.2554675, 1.099576, 0.5449146, 0, 0, 0, 1, 1,
0.2559301, 1.340792, 1.49142, 0, 0, 0, 1, 1,
0.2596859, -0.2904459, 1.723193, 0, 0, 0, 1, 1,
0.2607118, 0.02243519, 2.095178, 1, 1, 1, 1, 1,
0.2607413, -0.7931967, 4.429945, 1, 1, 1, 1, 1,
0.2613592, 0.8273813, 1.879447, 1, 1, 1, 1, 1,
0.2666221, 0.1573474, 1.484727, 1, 1, 1, 1, 1,
0.2674692, 1.577515, 0.8400259, 1, 1, 1, 1, 1,
0.2707278, -1.190448, 3.286024, 1, 1, 1, 1, 1,
0.2711264, -0.3273391, 3.375204, 1, 1, 1, 1, 1,
0.2755193, 0.3185844, 0.9934523, 1, 1, 1, 1, 1,
0.2759596, 0.9236107, 0.002666889, 1, 1, 1, 1, 1,
0.2759899, -0.1992863, 1.067707, 1, 1, 1, 1, 1,
0.277117, -0.7932721, 2.329764, 1, 1, 1, 1, 1,
0.2782671, 0.214432, -1.459138, 1, 1, 1, 1, 1,
0.2790824, -1.506872, 1.722567, 1, 1, 1, 1, 1,
0.2793897, 0.8564363, 1.925159, 1, 1, 1, 1, 1,
0.2820776, -0.2603194, 1.280385, 1, 1, 1, 1, 1,
0.2820898, 1.911738, -0.9916838, 0, 0, 1, 1, 1,
0.2831532, -1.418839, 1.68664, 1, 0, 0, 1, 1,
0.2840542, -0.1649655, 1.519966, 1, 0, 0, 1, 1,
0.2849768, 0.3805884, 1.850044, 1, 0, 0, 1, 1,
0.2854415, -0.7284682, 2.264932, 1, 0, 0, 1, 1,
0.286007, -1.13522, 1.661578, 1, 0, 0, 1, 1,
0.2890068, -0.2754661, 0.69561, 0, 0, 0, 1, 1,
0.290778, 0.5361549, 0.5936226, 0, 0, 0, 1, 1,
0.291816, 1.968345, 2.496964, 0, 0, 0, 1, 1,
0.2945632, 0.1359991, 1.472476, 0, 0, 0, 1, 1,
0.3072986, -0.06048908, 1.624907, 0, 0, 0, 1, 1,
0.3093018, 0.3974855, 1.549995, 0, 0, 0, 1, 1,
0.315578, -0.0324598, 3.886281, 0, 0, 0, 1, 1,
0.3160102, -1.598191, 1.234281, 1, 1, 1, 1, 1,
0.3259457, 1.010118, 2.241709, 1, 1, 1, 1, 1,
0.3279094, -1.078132, 1.844432, 1, 1, 1, 1, 1,
0.3283183, -0.8120789, 3.592804, 1, 1, 1, 1, 1,
0.3292275, 1.143401, -1.494327, 1, 1, 1, 1, 1,
0.3318675, 0.2781502, 1.571908, 1, 1, 1, 1, 1,
0.3353062, -0.758296, 3.037653, 1, 1, 1, 1, 1,
0.339543, 1.404985, -0.3870269, 1, 1, 1, 1, 1,
0.3399884, -1.387039, 1.73031, 1, 1, 1, 1, 1,
0.3402066, -0.3503886, 1.016273, 1, 1, 1, 1, 1,
0.3406804, 0.5975788, 0.6452872, 1, 1, 1, 1, 1,
0.3409563, 1.04644, 0.32982, 1, 1, 1, 1, 1,
0.3417527, -0.5621563, 2.205765, 1, 1, 1, 1, 1,
0.3428474, 0.8561395, -0.05017659, 1, 1, 1, 1, 1,
0.3453782, 1.015421, -1.604885, 1, 1, 1, 1, 1,
0.3467439, -3.13837, 4.177034, 0, 0, 1, 1, 1,
0.3475606, -1.316088, 4.995915, 1, 0, 0, 1, 1,
0.3548031, -1.564067, 4.298105, 1, 0, 0, 1, 1,
0.3555708, -0.426789, 0.2395369, 1, 0, 0, 1, 1,
0.3578214, -1.143251, 1.55221, 1, 0, 0, 1, 1,
0.3630989, 1.490425, -0.1373075, 1, 0, 0, 1, 1,
0.3656626, 1.759161, -0.5323403, 0, 0, 0, 1, 1,
0.3696457, -1.472318, 1.562471, 0, 0, 0, 1, 1,
0.3697293, -0.2318713, 1.492033, 0, 0, 0, 1, 1,
0.3753497, 0.5706571, 0.8730273, 0, 0, 0, 1, 1,
0.3780904, -0.779738, 4.227031, 0, 0, 0, 1, 1,
0.3790541, -0.3557223, 3.280784, 0, 0, 0, 1, 1,
0.3798429, -0.6386521, 3.868999, 0, 0, 0, 1, 1,
0.3808563, 0.009241794, 1.127043, 1, 1, 1, 1, 1,
0.3871742, 0.1727444, 1.022365, 1, 1, 1, 1, 1,
0.3879203, -1.241617, 3.225384, 1, 1, 1, 1, 1,
0.3914678, 1.285354, 1.612823, 1, 1, 1, 1, 1,
0.3938507, -0.6843151, 2.009581, 1, 1, 1, 1, 1,
0.3973258, -0.08041216, 1.342918, 1, 1, 1, 1, 1,
0.3998297, -1.783029, 1.266896, 1, 1, 1, 1, 1,
0.4014236, 0.7987961, 0.6335179, 1, 1, 1, 1, 1,
0.4032093, 0.8733201, 2.08321, 1, 1, 1, 1, 1,
0.4056683, 0.07213252, 2.249539, 1, 1, 1, 1, 1,
0.4138127, -0.2272671, 4.113152, 1, 1, 1, 1, 1,
0.4140256, 1.12185, 1.935491, 1, 1, 1, 1, 1,
0.4147979, -1.421353, 3.348122, 1, 1, 1, 1, 1,
0.4179153, -0.3501568, 1.075691, 1, 1, 1, 1, 1,
0.4188335, 0.08853647, 1.866277, 1, 1, 1, 1, 1,
0.4198858, 0.3729979, 0.6802345, 0, 0, 1, 1, 1,
0.4224004, 0.6608156, -0.3072479, 1, 0, 0, 1, 1,
0.4244958, 1.352671, -1.187035, 1, 0, 0, 1, 1,
0.4261357, -0.3162949, 2.408239, 1, 0, 0, 1, 1,
0.4279826, -1.215603, 3.483884, 1, 0, 0, 1, 1,
0.4282398, 2.409651, 0.6960675, 1, 0, 0, 1, 1,
0.4306901, 0.4204866, 2.517612, 0, 0, 0, 1, 1,
0.431865, 0.9041684, -0.6680574, 0, 0, 0, 1, 1,
0.4350666, 0.4670831, 0.3746438, 0, 0, 0, 1, 1,
0.4367304, -2.022606, 4.159178, 0, 0, 0, 1, 1,
0.447796, -0.06312948, 2.335166, 0, 0, 0, 1, 1,
0.4489624, -1.745287, 2.640018, 0, 0, 0, 1, 1,
0.454579, 1.590525, -0.2134695, 0, 0, 0, 1, 1,
0.4549631, -1.1075, 3.004429, 1, 1, 1, 1, 1,
0.4583755, -0.3466424, 1.273263, 1, 1, 1, 1, 1,
0.459204, 1.029064, -1.004469, 1, 1, 1, 1, 1,
0.4600689, -0.4112701, 1.594614, 1, 1, 1, 1, 1,
0.465873, -1.036885, 2.31673, 1, 1, 1, 1, 1,
0.4671673, 0.4872233, -0.2062987, 1, 1, 1, 1, 1,
0.4673341, 2.173352, -1.485779, 1, 1, 1, 1, 1,
0.4679075, 1.077694, -0.6843766, 1, 1, 1, 1, 1,
0.468654, -1.295442, 1.814111, 1, 1, 1, 1, 1,
0.4695241, 2.520858, -0.3644365, 1, 1, 1, 1, 1,
0.4695775, 1.501873, -0.08242721, 1, 1, 1, 1, 1,
0.4771605, -0.02602722, 2.657349, 1, 1, 1, 1, 1,
0.4797376, -0.7414429, 1.156112, 1, 1, 1, 1, 1,
0.4810931, 0.4433485, 2.913384, 1, 1, 1, 1, 1,
0.4822285, -1.246262, 0.7228183, 1, 1, 1, 1, 1,
0.4841079, 0.6188994, 0.382168, 0, 0, 1, 1, 1,
0.4848701, 1.402315, 0.4234191, 1, 0, 0, 1, 1,
0.492982, 1.637188, -0.5039831, 1, 0, 0, 1, 1,
0.4945081, 0.3255937, 2.32743, 1, 0, 0, 1, 1,
0.4952881, 0.2497242, 3.642744, 1, 0, 0, 1, 1,
0.4974314, -0.1423616, 1.737943, 1, 0, 0, 1, 1,
0.5014638, -0.2442357, 2.664325, 0, 0, 0, 1, 1,
0.5069121, 0.2619862, -0.4391304, 0, 0, 0, 1, 1,
0.5079672, -0.5801858, 3.147021, 0, 0, 0, 1, 1,
0.5119805, 1.384712, 0.4655941, 0, 0, 0, 1, 1,
0.5131807, -1.006874, 1.728447, 0, 0, 0, 1, 1,
0.5133073, 0.5553148, 0.2463778, 0, 0, 0, 1, 1,
0.5145389, 0.5502563, -0.4515325, 0, 0, 0, 1, 1,
0.5170151, 0.5723668, 0.5393667, 1, 1, 1, 1, 1,
0.5201163, -0.6054071, -0.117768, 1, 1, 1, 1, 1,
0.5214048, 0.3718233, 1.499508, 1, 1, 1, 1, 1,
0.5240126, -1.194181, 2.95368, 1, 1, 1, 1, 1,
0.5255457, -0.4176609, 2.252209, 1, 1, 1, 1, 1,
0.5289995, 0.2649504, 1.361457, 1, 1, 1, 1, 1,
0.5295181, 0.6940417, 0.6744123, 1, 1, 1, 1, 1,
0.5304486, 0.5907485, -0.04345491, 1, 1, 1, 1, 1,
0.5342482, -0.4153218, 1.454445, 1, 1, 1, 1, 1,
0.5355457, -0.5356142, 2.835122, 1, 1, 1, 1, 1,
0.5487863, 2.3341, -0.5068054, 1, 1, 1, 1, 1,
0.5491026, -0.2719097, 1.958459, 1, 1, 1, 1, 1,
0.5494397, -0.09146088, 0.4614507, 1, 1, 1, 1, 1,
0.5525628, -0.1508827, 2.653406, 1, 1, 1, 1, 1,
0.5574498, -0.04725982, 0.7728479, 1, 1, 1, 1, 1,
0.5593706, -0.3302336, 4.268564, 0, 0, 1, 1, 1,
0.5660724, 0.3249241, 0.5886375, 1, 0, 0, 1, 1,
0.5669625, -0.4542941, 3.269846, 1, 0, 0, 1, 1,
0.5670976, -0.968894, 3.295664, 1, 0, 0, 1, 1,
0.5717166, -1.210168, 2.154395, 1, 0, 0, 1, 1,
0.5746562, -0.7495576, 1.777951, 1, 0, 0, 1, 1,
0.574729, -1.146795, 2.115584, 0, 0, 0, 1, 1,
0.5752636, 0.5441814, 2.735607, 0, 0, 0, 1, 1,
0.5820265, 1.292826, 1.136975, 0, 0, 0, 1, 1,
0.5830999, -0.01875982, 1.301801, 0, 0, 0, 1, 1,
0.5873306, 0.5948152, 2.425678, 0, 0, 0, 1, 1,
0.5876167, 2.285479, 1.095033, 0, 0, 0, 1, 1,
0.5878826, -0.6477351, 0.843492, 0, 0, 0, 1, 1,
0.5934011, -1.183449, 3.900791, 1, 1, 1, 1, 1,
0.5977396, -0.6573971, 2.391995, 1, 1, 1, 1, 1,
0.601974, -1.337511, 3.598481, 1, 1, 1, 1, 1,
0.605212, -0.1725661, 1.993825, 1, 1, 1, 1, 1,
0.6112329, 0.1218337, -0.4481445, 1, 1, 1, 1, 1,
0.61357, -0.8605224, 1.20669, 1, 1, 1, 1, 1,
0.6197503, 0.2306461, -0.03139189, 1, 1, 1, 1, 1,
0.6230971, -0.1104306, 2.383923, 1, 1, 1, 1, 1,
0.6280597, -0.7646136, 2.491299, 1, 1, 1, 1, 1,
0.6286708, -0.9511744, 2.540557, 1, 1, 1, 1, 1,
0.6302906, 0.3912698, -0.6736765, 1, 1, 1, 1, 1,
0.6318772, -1.218657, 0.8999563, 1, 1, 1, 1, 1,
0.6419941, 0.4440852, -0.065398, 1, 1, 1, 1, 1,
0.6438892, 1.28661, -0.7111768, 1, 1, 1, 1, 1,
0.6466624, 1.276704, 0.8213757, 1, 1, 1, 1, 1,
0.6527761, -1.652912, 3.842389, 0, 0, 1, 1, 1,
0.6547242, -1.324059, 3.724395, 1, 0, 0, 1, 1,
0.6548607, -0.420406, 2.820991, 1, 0, 0, 1, 1,
0.6554322, 0.3540302, 2.20515, 1, 0, 0, 1, 1,
0.6607031, 1.520554, -0.1668513, 1, 0, 0, 1, 1,
0.6677889, -0.1540589, 1.409182, 1, 0, 0, 1, 1,
0.6682639, 0.5953803, 0.4884177, 0, 0, 0, 1, 1,
0.6737701, -0.6711582, 2.591562, 0, 0, 0, 1, 1,
0.6756329, 1.000617, 1.148, 0, 0, 0, 1, 1,
0.676174, 0.3297603, 1.0633, 0, 0, 0, 1, 1,
0.6830304, -1.734825, 1.831763, 0, 0, 0, 1, 1,
0.6871774, 0.7714587, 0.1513811, 0, 0, 0, 1, 1,
0.6913716, 1.630185, 1.508682, 0, 0, 0, 1, 1,
0.6973438, 0.1036409, 0.716005, 1, 1, 1, 1, 1,
0.698431, 0.9443148, -0.7220873, 1, 1, 1, 1, 1,
0.7015365, -0.8597195, 2.357547, 1, 1, 1, 1, 1,
0.7069793, -1.968557, 3.24053, 1, 1, 1, 1, 1,
0.7086248, -0.5867569, 2.116862, 1, 1, 1, 1, 1,
0.7174677, 0.2112433, 3.910212, 1, 1, 1, 1, 1,
0.7252556, -0.1282614, 2.122087, 1, 1, 1, 1, 1,
0.726954, -0.4062929, 0.8042892, 1, 1, 1, 1, 1,
0.7288135, -1.343539, 1.740982, 1, 1, 1, 1, 1,
0.7314659, 0.8327887, 0.2926883, 1, 1, 1, 1, 1,
0.7336453, -2.077384, 3.720331, 1, 1, 1, 1, 1,
0.733754, -1.546849, 2.741827, 1, 1, 1, 1, 1,
0.7358182, -0.3441746, 1.747342, 1, 1, 1, 1, 1,
0.7392352, -0.02731618, 0.9504639, 1, 1, 1, 1, 1,
0.7453883, -0.321989, 1.11734, 1, 1, 1, 1, 1,
0.7454883, 0.6837894, 0.4583334, 0, 0, 1, 1, 1,
0.7488473, 0.3095211, 1.820994, 1, 0, 0, 1, 1,
0.7489891, -1.175642, 4.592803, 1, 0, 0, 1, 1,
0.7499632, -1.173344, 1.674417, 1, 0, 0, 1, 1,
0.7544082, 0.7571591, 1.373962, 1, 0, 0, 1, 1,
0.7552015, -0.7069401, 1.106289, 1, 0, 0, 1, 1,
0.7552847, -1.451556, 2.447736, 0, 0, 0, 1, 1,
0.7587056, 1.678969, -0.1920354, 0, 0, 0, 1, 1,
0.7593634, -2.580675, 2.673662, 0, 0, 0, 1, 1,
0.7688153, -0.1542019, 1.956047, 0, 0, 0, 1, 1,
0.7705862, 0.5753452, 1.989502, 0, 0, 0, 1, 1,
0.7707701, 0.4032675, 0.7072549, 0, 0, 0, 1, 1,
0.7718678, -0.1362153, 2.318033, 0, 0, 0, 1, 1,
0.7720448, 0.8645465, 1.13694, 1, 1, 1, 1, 1,
0.7723849, 0.104807, 1.706864, 1, 1, 1, 1, 1,
0.7726079, 1.161403, -0.3731254, 1, 1, 1, 1, 1,
0.7756962, -0.103004, 2.563743, 1, 1, 1, 1, 1,
0.7800115, -1.34367, 1.847149, 1, 1, 1, 1, 1,
0.780355, 0.07804497, -0.2237354, 1, 1, 1, 1, 1,
0.7841628, -1.255798, 1.179299, 1, 1, 1, 1, 1,
0.7896909, -1.303023, 2.680342, 1, 1, 1, 1, 1,
0.7919234, 1.44849, 0.231228, 1, 1, 1, 1, 1,
0.7949592, 0.6499649, 2.013041, 1, 1, 1, 1, 1,
0.7998905, 0.5197058, 1.281449, 1, 1, 1, 1, 1,
0.8093351, 0.4787125, 1.280253, 1, 1, 1, 1, 1,
0.8141529, 0.08209331, 3.478101, 1, 1, 1, 1, 1,
0.815927, -0.287487, 3.31012, 1, 1, 1, 1, 1,
0.8191761, 0.9698754, -1.98009, 1, 1, 1, 1, 1,
0.8202848, 0.03458079, 1.285403, 0, 0, 1, 1, 1,
0.8227075, -1.179789, 1.893078, 1, 0, 0, 1, 1,
0.8264639, -0.7476049, 1.775249, 1, 0, 0, 1, 1,
0.8310825, 0.2858984, 2.374912, 1, 0, 0, 1, 1,
0.8314627, -1.107937, 3.149056, 1, 0, 0, 1, 1,
0.8352507, 0.4959022, 1.73257, 1, 0, 0, 1, 1,
0.8368898, -0.3947677, 1.692238, 0, 0, 0, 1, 1,
0.8410757, 1.202381, 0.3928402, 0, 0, 0, 1, 1,
0.852572, 1.537411, 0.5535579, 0, 0, 0, 1, 1,
0.8594386, -0.8381176, 1.479094, 0, 0, 0, 1, 1,
0.8594808, 0.699692, -1.129395, 0, 0, 0, 1, 1,
0.8600091, -0.6901123, 2.669665, 0, 0, 0, 1, 1,
0.8642591, -0.8056701, 2.217904, 0, 0, 0, 1, 1,
0.8651645, 0.9139999, 0.4181403, 1, 1, 1, 1, 1,
0.8672161, 1.311897, 0.1571323, 1, 1, 1, 1, 1,
0.8693501, -0.1530573, 1.446869, 1, 1, 1, 1, 1,
0.8810799, 0.8122345, 0.7390376, 1, 1, 1, 1, 1,
0.8896448, -0.04627682, 1.703046, 1, 1, 1, 1, 1,
0.891786, -0.9555744, 2.78881, 1, 1, 1, 1, 1,
0.8976144, -0.04778048, 2.625309, 1, 1, 1, 1, 1,
0.8993391, 2.322506, -0.2391001, 1, 1, 1, 1, 1,
0.8997555, -0.7315257, 0.2772529, 1, 1, 1, 1, 1,
0.9020977, -1.003285, 3.342397, 1, 1, 1, 1, 1,
0.9029534, -0.1100864, 3.656597, 1, 1, 1, 1, 1,
0.9100013, 0.9299777, -0.441282, 1, 1, 1, 1, 1,
0.9173063, -0.01080417, 1.877119, 1, 1, 1, 1, 1,
0.9365837, 0.8761792, 1.359342, 1, 1, 1, 1, 1,
0.9401299, -0.9169484, -0.3412415, 1, 1, 1, 1, 1,
0.9450283, 1.433516, 0.837755, 0, 0, 1, 1, 1,
0.9483106, -1.361201, 2.027417, 1, 0, 0, 1, 1,
0.9493281, -0.7801386, 1.206608, 1, 0, 0, 1, 1,
0.9501402, -1.166262, 4.30874, 1, 0, 0, 1, 1,
0.9509896, 0.3051024, 2.337103, 1, 0, 0, 1, 1,
0.9564592, -2.816262, 5.639346, 1, 0, 0, 1, 1,
0.9648543, 0.9518895, 1.737359, 0, 0, 0, 1, 1,
0.9651375, -0.3240319, 2.829767, 0, 0, 0, 1, 1,
0.9667495, -0.6547493, 3.155769, 0, 0, 0, 1, 1,
0.9682209, -1.327526, 3.314288, 0, 0, 0, 1, 1,
0.9705089, -0.3217899, 0.8971691, 0, 0, 0, 1, 1,
0.9724334, -0.7857077, 1.757939, 0, 0, 0, 1, 1,
0.974172, -0.3788588, 2.914183, 0, 0, 0, 1, 1,
0.9779818, -0.1752244, 0.879387, 1, 1, 1, 1, 1,
0.9786057, 0.3426843, -0.05455878, 1, 1, 1, 1, 1,
0.9793465, 0.6625171, 2.046732, 1, 1, 1, 1, 1,
0.9794101, 0.3335949, 1.429595, 1, 1, 1, 1, 1,
0.9812748, -1.127144, 2.583565, 1, 1, 1, 1, 1,
0.9846392, 0.6541687, 2.780143, 1, 1, 1, 1, 1,
0.9857517, 0.6947085, 1.202621, 1, 1, 1, 1, 1,
0.9858276, 1.004867, 1.672354, 1, 1, 1, 1, 1,
0.9863042, 0.2530511, 0.9846997, 1, 1, 1, 1, 1,
0.9875284, -0.3496279, 2.951573, 1, 1, 1, 1, 1,
0.9933709, 0.3406285, -0.1993184, 1, 1, 1, 1, 1,
0.9970851, 0.4497567, 0.1322527, 1, 1, 1, 1, 1,
1.007899, 0.1034994, 1.365249, 1, 1, 1, 1, 1,
1.009694, -1.345375, 3.499289, 1, 1, 1, 1, 1,
1.010082, -0.6597739, 2.39549, 1, 1, 1, 1, 1,
1.012828, -0.1328584, 1.354109, 0, 0, 1, 1, 1,
1.015679, 0.2979803, 0.6059049, 1, 0, 0, 1, 1,
1.028736, -0.415091, 1.641075, 1, 0, 0, 1, 1,
1.035125, -2.070886, 0.5767014, 1, 0, 0, 1, 1,
1.03713, 0.3884588, 1.627493, 1, 0, 0, 1, 1,
1.042679, -0.4415932, 3.490426, 1, 0, 0, 1, 1,
1.045195, -1.459062, 3.209696, 0, 0, 0, 1, 1,
1.075908, -1.868771, 2.264125, 0, 0, 0, 1, 1,
1.0802, -0.191492, 0.2790865, 0, 0, 0, 1, 1,
1.084976, 0.1041589, 2.222764, 0, 0, 0, 1, 1,
1.086422, -0.2793677, 2.051064, 0, 0, 0, 1, 1,
1.094369, -0.3558261, 2.741282, 0, 0, 0, 1, 1,
1.09987, 1.470467, -2.598163, 0, 0, 0, 1, 1,
1.106683, -0.1951501, 3.514206, 1, 1, 1, 1, 1,
1.115611, 1.323679, 0.4034033, 1, 1, 1, 1, 1,
1.118153, -0.3663553, 1.469866, 1, 1, 1, 1, 1,
1.119233, 0.16921, 1.032421, 1, 1, 1, 1, 1,
1.136861, -0.7516684, 2.888016, 1, 1, 1, 1, 1,
1.137115, 2.432013, -1.043604, 1, 1, 1, 1, 1,
1.141285, 0.3406269, 0.4743912, 1, 1, 1, 1, 1,
1.142294, -0.8907807, 2.683353, 1, 1, 1, 1, 1,
1.143303, 0.4217375, 1.85477, 1, 1, 1, 1, 1,
1.14782, 2.096242, 1.470951, 1, 1, 1, 1, 1,
1.158226, 1.595498, 0.7248129, 1, 1, 1, 1, 1,
1.164202, 0.6652211, -0.3838089, 1, 1, 1, 1, 1,
1.165579, 2.378906, 1.103786, 1, 1, 1, 1, 1,
1.169348, -0.9508923, 3.037086, 1, 1, 1, 1, 1,
1.188627, -0.5329813, 3.176785, 1, 1, 1, 1, 1,
1.189771, -0.2149431, 0.6465968, 0, 0, 1, 1, 1,
1.190287, -1.894145, 1.100891, 1, 0, 0, 1, 1,
1.190295, -0.5476217, 2.4092, 1, 0, 0, 1, 1,
1.192975, -1.179282, 3.648902, 1, 0, 0, 1, 1,
1.199585, 0.9250048, 0.912427, 1, 0, 0, 1, 1,
1.200032, 0.6441452, 1.983563, 1, 0, 0, 1, 1,
1.200253, 0.8880278, 0.6019149, 0, 0, 0, 1, 1,
1.200374, 0.2533624, 2.924432, 0, 0, 0, 1, 1,
1.205133, -1.883575, 1.136339, 0, 0, 0, 1, 1,
1.205891, -1.133441, 2.277203, 0, 0, 0, 1, 1,
1.221755, 0.09019808, 1.600372, 0, 0, 0, 1, 1,
1.223542, -0.5610092, 1.169584, 0, 0, 0, 1, 1,
1.223991, -0.811063, 1.098958, 0, 0, 0, 1, 1,
1.224042, 0.1876365, 0.4932047, 1, 1, 1, 1, 1,
1.228383, -0.4377981, 0.4700204, 1, 1, 1, 1, 1,
1.233286, -0.1345882, 3.12567, 1, 1, 1, 1, 1,
1.236603, -2.535622, 5.065445, 1, 1, 1, 1, 1,
1.24303, -1.124518, 3.00396, 1, 1, 1, 1, 1,
1.250002, 1.55429, 1.82979, 1, 1, 1, 1, 1,
1.252861, 0.3189941, 1.057375, 1, 1, 1, 1, 1,
1.257568, 1.402724, 0.5383424, 1, 1, 1, 1, 1,
1.260839, -0.7806077, 1.736739, 1, 1, 1, 1, 1,
1.269485, 0.242005, 1.914066, 1, 1, 1, 1, 1,
1.270618, -1.445918, 1.912642, 1, 1, 1, 1, 1,
1.270762, -0.2811895, 4.000238, 1, 1, 1, 1, 1,
1.274489, 0.1775017, 1.711147, 1, 1, 1, 1, 1,
1.279453, -0.2472408, 3.611327, 1, 1, 1, 1, 1,
1.280876, 0.2065449, 0.2455321, 1, 1, 1, 1, 1,
1.283504, 0.9619252, 0.8641423, 0, 0, 1, 1, 1,
1.285258, -0.6175579, 3.694959, 1, 0, 0, 1, 1,
1.286579, 0.1647428, 1.40081, 1, 0, 0, 1, 1,
1.29703, -1.163829, 3.338859, 1, 0, 0, 1, 1,
1.306, -0.7753276, 2.285809, 1, 0, 0, 1, 1,
1.306231, -1.234917, 2.735502, 1, 0, 0, 1, 1,
1.31434, 1.369346, -0.3114628, 0, 0, 0, 1, 1,
1.323561, -0.5339503, 1.022365, 0, 0, 0, 1, 1,
1.334547, -0.07355069, -0.3941416, 0, 0, 0, 1, 1,
1.335806, 1.347723, 0.8190053, 0, 0, 0, 1, 1,
1.336863, 0.06391313, 0.7331305, 0, 0, 0, 1, 1,
1.337806, 1.683513, -1.3313, 0, 0, 0, 1, 1,
1.342374, 0.9532317, 1.753155, 0, 0, 0, 1, 1,
1.342917, 0.6397187, 2.024419, 1, 1, 1, 1, 1,
1.343069, -0.7766212, 3.229204, 1, 1, 1, 1, 1,
1.355113, -0.1814523, 0.9474458, 1, 1, 1, 1, 1,
1.358199, -0.2452713, 2.273163, 1, 1, 1, 1, 1,
1.37493, 1.684094, 2.702146, 1, 1, 1, 1, 1,
1.376735, -0.7340503, 1.310407, 1, 1, 1, 1, 1,
1.385043, 0.4589963, 0.6216034, 1, 1, 1, 1, 1,
1.390947, -0.3916548, 0.6791568, 1, 1, 1, 1, 1,
1.392633, 0.2537584, 1.054435, 1, 1, 1, 1, 1,
1.408961, 0.03752377, 1.723112, 1, 1, 1, 1, 1,
1.409787, 0.9551239, -0.2959664, 1, 1, 1, 1, 1,
1.410665, 0.4450886, 3.238589, 1, 1, 1, 1, 1,
1.416348, 1.561535, -0.07288751, 1, 1, 1, 1, 1,
1.42622, 2.840756, 0.9799381, 1, 1, 1, 1, 1,
1.432085, 0.3598725, 1.170208, 1, 1, 1, 1, 1,
1.435385, -1.563747, 3.511024, 0, 0, 1, 1, 1,
1.444973, 0.77403, 1.084576, 1, 0, 0, 1, 1,
1.470531, -0.2373949, 0.7039744, 1, 0, 0, 1, 1,
1.474354, -0.04925195, 1.425626, 1, 0, 0, 1, 1,
1.489976, -0.6082371, 1.422962, 1, 0, 0, 1, 1,
1.494141, -0.4914434, 0.796375, 1, 0, 0, 1, 1,
1.510955, 0.374707, 1.782558, 0, 0, 0, 1, 1,
1.52578, 0.7346726, 1.62365, 0, 0, 0, 1, 1,
1.531823, 0.8293063, 0.7711632, 0, 0, 0, 1, 1,
1.535785, -0.561919, 1.126356, 0, 0, 0, 1, 1,
1.539999, 0.9264364, 2.205221, 0, 0, 0, 1, 1,
1.541375, -0.03993509, 0.6804276, 0, 0, 0, 1, 1,
1.550091, 0.1740061, 2.456853, 0, 0, 0, 1, 1,
1.562298, -0.4605234, 1.760075, 1, 1, 1, 1, 1,
1.577046, -0.674185, 3.613747, 1, 1, 1, 1, 1,
1.577912, -0.2476245, 1.508324, 1, 1, 1, 1, 1,
1.58267, 0.1587946, 0.8144727, 1, 1, 1, 1, 1,
1.583257, -1.205665, 2.836142, 1, 1, 1, 1, 1,
1.598246, -0.9671016, 1.422599, 1, 1, 1, 1, 1,
1.604204, 0.7055096, 1.316344, 1, 1, 1, 1, 1,
1.615879, 0.3218571, 0.06125741, 1, 1, 1, 1, 1,
1.620327, 1.331986, 0.5289398, 1, 1, 1, 1, 1,
1.662561, 0.0700683, 3.015065, 1, 1, 1, 1, 1,
1.670117, -0.3400606, 1.804054, 1, 1, 1, 1, 1,
1.679405, 1.058212, 1.731232, 1, 1, 1, 1, 1,
1.688668, 0.5892482, 1.371686, 1, 1, 1, 1, 1,
1.700427, -0.6978205, 2.343804, 1, 1, 1, 1, 1,
1.706763, 0.5956212, -0.5598692, 1, 1, 1, 1, 1,
1.716037, -0.3791824, 1.546791, 0, 0, 1, 1, 1,
1.723048, 0.8416637, 1.692899, 1, 0, 0, 1, 1,
1.735726, -1.522283, 2.119243, 1, 0, 0, 1, 1,
1.744373, -1.332138, 2.792069, 1, 0, 0, 1, 1,
1.757033, 0.574975, 2.740589, 1, 0, 0, 1, 1,
1.757757, -0.3308961, 2.003684, 1, 0, 0, 1, 1,
1.761466, 0.3995205, 3.804367, 0, 0, 0, 1, 1,
1.767423, 2.335826, -0.2720149, 0, 0, 0, 1, 1,
1.767577, 0.05487847, 0.4180486, 0, 0, 0, 1, 1,
1.786018, 1.488939, 0.09104688, 0, 0, 0, 1, 1,
1.789317, 2.266007, 1.303393, 0, 0, 0, 1, 1,
1.807986, -0.8436662, 3.96909, 0, 0, 0, 1, 1,
1.814622, 0.2356251, 0.6439493, 0, 0, 0, 1, 1,
1.849622, -0.5684041, 1.641871, 1, 1, 1, 1, 1,
1.856191, -0.7523007, 3.098916, 1, 1, 1, 1, 1,
1.881648, -1.582932, 2.58385, 1, 1, 1, 1, 1,
1.914727, 1.163499, 0.8104949, 1, 1, 1, 1, 1,
1.935161, -1.554977, 4.912371, 1, 1, 1, 1, 1,
1.943413, -0.7842894, 0.7486218, 1, 1, 1, 1, 1,
1.944758, -0.6200475, 1.232887, 1, 1, 1, 1, 1,
1.946854, -0.04659458, 2.724694, 1, 1, 1, 1, 1,
1.958856, 0.2415525, 1.265842, 1, 1, 1, 1, 1,
1.964184, -0.9872124, 1.014015, 1, 1, 1, 1, 1,
1.9657, -2.135153, 3.223738, 1, 1, 1, 1, 1,
1.966052, -0.03045844, -0.04725651, 1, 1, 1, 1, 1,
2.007005, -0.1588394, 1.445684, 1, 1, 1, 1, 1,
2.008247, 2.55635, 2.219677, 1, 1, 1, 1, 1,
2.016277, 0.1440662, 1.790629, 1, 1, 1, 1, 1,
2.034809, 0.2296066, -0.5052034, 0, 0, 1, 1, 1,
2.042617, -0.674936, 1.606142, 1, 0, 0, 1, 1,
2.053922, -0.4240902, 2.785398, 1, 0, 0, 1, 1,
2.065192, -1.109226, 1.54063, 1, 0, 0, 1, 1,
2.098822, 0.7485104, 1.156685, 1, 0, 0, 1, 1,
2.10235, 0.9113036, 1.437977, 1, 0, 0, 1, 1,
2.134294, 2.97897, 0.5196931, 0, 0, 0, 1, 1,
2.156189, -0.4237174, 0.6292414, 0, 0, 0, 1, 1,
2.166795, 0.515143, 0.3531045, 0, 0, 0, 1, 1,
2.173123, 0.5087042, 1.523587, 0, 0, 0, 1, 1,
2.208799, -1.221692, 0.5325828, 0, 0, 0, 1, 1,
2.237061, 0.4302806, 2.876398, 0, 0, 0, 1, 1,
2.257564, -0.5258627, 1.885381, 0, 0, 0, 1, 1,
2.288868, 0.9595976, 1.020496, 1, 1, 1, 1, 1,
2.446629, 0.6102558, 1.471299, 1, 1, 1, 1, 1,
2.476619, 1.132533, 1.809401, 1, 1, 1, 1, 1,
2.542127, 2.998897, 1.513032, 1, 1, 1, 1, 1,
2.725195, 0.07622635, 1.019103, 1, 1, 1, 1, 1,
2.831936, 0.700141, 1.394573, 1, 1, 1, 1, 1,
2.894409, -0.2166854, 0.3536333, 1, 1, 1, 1, 1
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
var radius = 9.505927;
var distance = 33.38917;
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
mvMatrix.translate( -0.06283104, -0.1780164, -0.2075732 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38917);
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
