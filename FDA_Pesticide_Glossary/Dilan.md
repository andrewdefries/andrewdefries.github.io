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
-3.147641, 0.5819817, -1.414962, 1, 0, 0, 1,
-3.10832, -1.485049, -0.9585469, 1, 0.007843138, 0, 1,
-2.915839, 0.3115333, -2.073814, 1, 0.01176471, 0, 1,
-2.914892, 0.3047744, -1.010737, 1, 0.01960784, 0, 1,
-2.872736, 0.7480924, -1.90028, 1, 0.02352941, 0, 1,
-2.714861, -2.262288, -2.373899, 1, 0.03137255, 0, 1,
-2.607035, 0.1647164, -1.016752, 1, 0.03529412, 0, 1,
-2.578323, 0.2215385, -0.7625855, 1, 0.04313726, 0, 1,
-2.534937, 2.203403, -0.5194005, 1, 0.04705882, 0, 1,
-2.498281, 0.9554173, 1.294012, 1, 0.05490196, 0, 1,
-2.449781, -0.3501402, -1.422222, 1, 0.05882353, 0, 1,
-2.396523, -0.4093903, -1.473141, 1, 0.06666667, 0, 1,
-2.329691, -0.3203209, -2.256663, 1, 0.07058824, 0, 1,
-2.3085, -0.625549, -2.057856, 1, 0.07843138, 0, 1,
-2.260868, 1.170972, -2.072534, 1, 0.08235294, 0, 1,
-2.189341, -1.958673, -3.728296, 1, 0.09019608, 0, 1,
-2.185605, 0.6791908, -0.6314201, 1, 0.09411765, 0, 1,
-2.179147, 1.421276, 0.4728558, 1, 0.1019608, 0, 1,
-2.13812, 1.377504, -0.5588379, 1, 0.1098039, 0, 1,
-2.124334, -0.6240165, -2.419302, 1, 0.1137255, 0, 1,
-2.113052, 0.1541497, -1.537509, 1, 0.1215686, 0, 1,
-2.101703, -2.158754, -1.802384, 1, 0.1254902, 0, 1,
-2.061402, 0.5283645, -0.6876298, 1, 0.1333333, 0, 1,
-2.031074, 0.08717207, -1.58822, 1, 0.1372549, 0, 1,
-2.014655, -0.1455332, -1.612462, 1, 0.145098, 0, 1,
-2.006644, 0.1290107, -0.9529628, 1, 0.1490196, 0, 1,
-1.987739, 0.7862151, -1.845769, 1, 0.1568628, 0, 1,
-1.986951, 0.7173218, -0.3062731, 1, 0.1607843, 0, 1,
-1.946775, 1.226111, -0.3804453, 1, 0.1686275, 0, 1,
-1.923321, 0.6789562, -1.826646, 1, 0.172549, 0, 1,
-1.914071, -0.1749974, -1.350227, 1, 0.1803922, 0, 1,
-1.898484, -1.1916, -2.367556, 1, 0.1843137, 0, 1,
-1.898164, -0.7904966, -3.641122, 1, 0.1921569, 0, 1,
-1.885833, -0.2134934, -2.302618, 1, 0.1960784, 0, 1,
-1.871776, -0.4409043, -2.268449, 1, 0.2039216, 0, 1,
-1.858779, 0.3826869, -2.276352, 1, 0.2117647, 0, 1,
-1.851121, -0.673524, -1.770512, 1, 0.2156863, 0, 1,
-1.833817, 1.871991, -2.090079, 1, 0.2235294, 0, 1,
-1.814416, -0.2706431, -0.9095394, 1, 0.227451, 0, 1,
-1.794001, 1.332399, -0.1988132, 1, 0.2352941, 0, 1,
-1.782059, 1.255086, -2.230108, 1, 0.2392157, 0, 1,
-1.77685, -0.4290767, 0.2072594, 1, 0.2470588, 0, 1,
-1.769144, -0.2103956, -2.248956, 1, 0.2509804, 0, 1,
-1.757109, 0.5032473, 1.167011, 1, 0.2588235, 0, 1,
-1.75166, 0.2182095, -2.632846, 1, 0.2627451, 0, 1,
-1.749195, 0.8531026, -1.335377, 1, 0.2705882, 0, 1,
-1.747253, -1.429587, -0.7924221, 1, 0.2745098, 0, 1,
-1.740069, 0.8946313, -1.716434, 1, 0.282353, 0, 1,
-1.735634, -0.03239157, -2.558108, 1, 0.2862745, 0, 1,
-1.725666, 0.4433776, -2.18033, 1, 0.2941177, 0, 1,
-1.723963, 0.7004918, -3.56184, 1, 0.3019608, 0, 1,
-1.709722, 0.9004902, -0.6177412, 1, 0.3058824, 0, 1,
-1.695251, -0.679368, -3.21787, 1, 0.3137255, 0, 1,
-1.694617, -1.708518, -4.380856, 1, 0.3176471, 0, 1,
-1.684026, 0.1464991, -3.035631, 1, 0.3254902, 0, 1,
-1.681949, -0.9258012, 0.2379947, 1, 0.3294118, 0, 1,
-1.6803, -0.9274237, -2.209318, 1, 0.3372549, 0, 1,
-1.680007, -1.413108, -1.238253, 1, 0.3411765, 0, 1,
-1.665465, 0.6118001, 0.9943672, 1, 0.3490196, 0, 1,
-1.657077, 0.2311718, -1.921441, 1, 0.3529412, 0, 1,
-1.651588, -1.316797, -1.90212, 1, 0.3607843, 0, 1,
-1.645938, 0.2281875, 0.4997796, 1, 0.3647059, 0, 1,
-1.645553, -1.056946, -3.319162, 1, 0.372549, 0, 1,
-1.645343, 0.66303, -2.646321, 1, 0.3764706, 0, 1,
-1.621624, -0.333947, -1.66751, 1, 0.3843137, 0, 1,
-1.619171, 0.70298, -1.78076, 1, 0.3882353, 0, 1,
-1.61363, -1.284367, -3.012428, 1, 0.3960784, 0, 1,
-1.610502, -0.4149064, -2.089385, 1, 0.4039216, 0, 1,
-1.6063, 0.8337029, 1.271826, 1, 0.4078431, 0, 1,
-1.593062, 1.301077, -0.9972572, 1, 0.4156863, 0, 1,
-1.590686, -1.176584, -1.565978, 1, 0.4196078, 0, 1,
-1.580518, -1.082939, -1.780265, 1, 0.427451, 0, 1,
-1.576528, 0.1946741, 0.2619272, 1, 0.4313726, 0, 1,
-1.570235, 1.497285, -0.8750447, 1, 0.4392157, 0, 1,
-1.547771, -0.1088666, -2.77887, 1, 0.4431373, 0, 1,
-1.536971, -0.1057504, -2.592696, 1, 0.4509804, 0, 1,
-1.536368, -1.385043, -0.3067539, 1, 0.454902, 0, 1,
-1.522923, -0.4166878, -3.065745, 1, 0.4627451, 0, 1,
-1.521134, 0.8416482, 0.1631098, 1, 0.4666667, 0, 1,
-1.509973, -0.4750066, -2.721862, 1, 0.4745098, 0, 1,
-1.505815, 0.3144608, -2.140872, 1, 0.4784314, 0, 1,
-1.501003, -0.8363578, -3.44459, 1, 0.4862745, 0, 1,
-1.500596, -0.03537893, -1.779804, 1, 0.4901961, 0, 1,
-1.495745, 0.1539073, -0.4673636, 1, 0.4980392, 0, 1,
-1.493356, -0.311899, -0.3171323, 1, 0.5058824, 0, 1,
-1.489773, 0.7117799, -2.060368, 1, 0.509804, 0, 1,
-1.484085, 1.593668, 0.04667146, 1, 0.5176471, 0, 1,
-1.456074, -0.6963146, -3.397143, 1, 0.5215687, 0, 1,
-1.45546, 0.5397778, -2.011661, 1, 0.5294118, 0, 1,
-1.452959, -1.186561, -1.866581, 1, 0.5333334, 0, 1,
-1.441431, 0.7074823, -1.761149, 1, 0.5411765, 0, 1,
-1.432598, 0.4086556, -1.932827, 1, 0.5450981, 0, 1,
-1.428923, 0.1431171, -1.97873, 1, 0.5529412, 0, 1,
-1.418349, 0.8230979, -0.5113479, 1, 0.5568628, 0, 1,
-1.40431, 0.2791082, -2.868751, 1, 0.5647059, 0, 1,
-1.399961, -0.1596969, -1.057001, 1, 0.5686275, 0, 1,
-1.388665, -0.521345, -3.153439, 1, 0.5764706, 0, 1,
-1.351878, -1.043941, -3.245076, 1, 0.5803922, 0, 1,
-1.348763, 0.7458597, 0.1685151, 1, 0.5882353, 0, 1,
-1.343282, -0.06702467, -2.686528, 1, 0.5921569, 0, 1,
-1.340263, -0.02123866, -3.773156, 1, 0.6, 0, 1,
-1.332755, 2.208077, 0.2025377, 1, 0.6078432, 0, 1,
-1.332314, -0.6808119, -2.743196, 1, 0.6117647, 0, 1,
-1.330822, -0.7279167, -1.680441, 1, 0.6196079, 0, 1,
-1.318699, -1.568808, -2.416416, 1, 0.6235294, 0, 1,
-1.318215, 0.1202743, -2.372808, 1, 0.6313726, 0, 1,
-1.317138, 0.5761856, -0.6232604, 1, 0.6352941, 0, 1,
-1.310091, -0.4144318, -0.6789533, 1, 0.6431373, 0, 1,
-1.306171, 0.225469, -0.5011986, 1, 0.6470588, 0, 1,
-1.297246, -2.041424, -1.88717, 1, 0.654902, 0, 1,
-1.296636, -1.113725, -3.646919, 1, 0.6588235, 0, 1,
-1.296619, 1.077634, -1.188863, 1, 0.6666667, 0, 1,
-1.292038, 0.5075383, -2.112137, 1, 0.6705883, 0, 1,
-1.27961, -0.1857955, -2.478335, 1, 0.6784314, 0, 1,
-1.276654, -1.063431, -1.543381, 1, 0.682353, 0, 1,
-1.268465, -0.9903884, -2.197553, 1, 0.6901961, 0, 1,
-1.267688, 0.8915597, -1.91948, 1, 0.6941177, 0, 1,
-1.254931, 0.6625978, 0.2174474, 1, 0.7019608, 0, 1,
-1.253719, 1.014075, -1.213051, 1, 0.7098039, 0, 1,
-1.245694, 1.201435, -0.2514169, 1, 0.7137255, 0, 1,
-1.244349, -1.43986, -3.618841, 1, 0.7215686, 0, 1,
-1.244023, 0.6653807, -0.6677418, 1, 0.7254902, 0, 1,
-1.242859, 0.6411924, 0.1414547, 1, 0.7333333, 0, 1,
-1.237277, 0.6920299, -1.36396, 1, 0.7372549, 0, 1,
-1.233579, -1.134908, -2.736955, 1, 0.7450981, 0, 1,
-1.230001, 0.5449223, -0.4868313, 1, 0.7490196, 0, 1,
-1.218813, -0.900593, -2.08728, 1, 0.7568628, 0, 1,
-1.217438, -0.2881233, -0.3392405, 1, 0.7607843, 0, 1,
-1.210235, -0.4130414, -0.5780945, 1, 0.7686275, 0, 1,
-1.203194, 0.9619502, 0.7086201, 1, 0.772549, 0, 1,
-1.175708, -0.5298631, -0.7486897, 1, 0.7803922, 0, 1,
-1.165293, -0.2039162, -2.187317, 1, 0.7843137, 0, 1,
-1.164519, -0.2537832, -2.194482, 1, 0.7921569, 0, 1,
-1.163507, 1.122233, -0.1325412, 1, 0.7960784, 0, 1,
-1.162823, 0.3189443, -1.169729, 1, 0.8039216, 0, 1,
-1.147503, -1.928428, -2.166356, 1, 0.8117647, 0, 1,
-1.146446, 0.03470154, -0.7209601, 1, 0.8156863, 0, 1,
-1.145848, 0.9686557, -0.607738, 1, 0.8235294, 0, 1,
-1.145148, -0.26915, -1.819732, 1, 0.827451, 0, 1,
-1.132385, 1.475565, -1.70184, 1, 0.8352941, 0, 1,
-1.127335, -1.761184, -3.972387, 1, 0.8392157, 0, 1,
-1.124373, 0.4515791, -1.09969, 1, 0.8470588, 0, 1,
-1.116955, -0.07950672, -0.4057629, 1, 0.8509804, 0, 1,
-1.114837, 0.3226422, -2.773201, 1, 0.8588235, 0, 1,
-1.11283, -0.08998913, -1.922205, 1, 0.8627451, 0, 1,
-1.104779, -1.209894, -1.450985, 1, 0.8705882, 0, 1,
-1.103001, -1.059055, -1.993564, 1, 0.8745098, 0, 1,
-1.099205, 0.2997389, -2.92587, 1, 0.8823529, 0, 1,
-1.094362, 0.8053324, 0.1825522, 1, 0.8862745, 0, 1,
-1.093285, 1.172286, 1.100818, 1, 0.8941177, 0, 1,
-1.083257, -0.8688099, -3.748292, 1, 0.8980392, 0, 1,
-1.082008, -1.264375, -0.7751392, 1, 0.9058824, 0, 1,
-1.059653, 0.4610395, -2.92608, 1, 0.9137255, 0, 1,
-1.050533, -0.2846118, -2.770638, 1, 0.9176471, 0, 1,
-1.048869, -1.672413, -0.4293404, 1, 0.9254902, 0, 1,
-1.047585, 1.722763, -2.112912, 1, 0.9294118, 0, 1,
-1.045476, -0.7621183, -1.478021, 1, 0.9372549, 0, 1,
-1.044865, -0.7983879, -2.899758, 1, 0.9411765, 0, 1,
-1.041601, -1.037425, -3.042915, 1, 0.9490196, 0, 1,
-1.029256, -0.5898853, -2.558624, 1, 0.9529412, 0, 1,
-1.027227, 0.8418968, -1.424455, 1, 0.9607843, 0, 1,
-1.02546, -0.7262223, -1.625753, 1, 0.9647059, 0, 1,
-1.023749, -0.4829591, -3.26295, 1, 0.972549, 0, 1,
-1.021781, 1.29958, -1.361908, 1, 0.9764706, 0, 1,
-1.014723, 0.2356212, -0.1711651, 1, 0.9843137, 0, 1,
-1.00657, -0.6415725, -1.946969, 1, 0.9882353, 0, 1,
-1.006265, -0.2419032, -1.128341, 1, 0.9960784, 0, 1,
-1.005796, 1.24432, -0.1303474, 0.9960784, 1, 0, 1,
-1.004606, 0.670248, -0.8258372, 0.9921569, 1, 0, 1,
-1.001952, -0.7576724, -2.044589, 0.9843137, 1, 0, 1,
-0.9978921, -0.1969455, -0.4885557, 0.9803922, 1, 0, 1,
-0.9906353, 0.7256299, 1.261505, 0.972549, 1, 0, 1,
-0.9892872, -0.9134516, -3.246202, 0.9686275, 1, 0, 1,
-0.9886882, 1.306443, -1.580104, 0.9607843, 1, 0, 1,
-0.9837299, 0.8223433, 0.07091979, 0.9568627, 1, 0, 1,
-0.9801974, 0.1814288, -0.4550064, 0.9490196, 1, 0, 1,
-0.9792014, 0.06655717, -1.056916, 0.945098, 1, 0, 1,
-0.9719445, 0.1915812, 0.4532555, 0.9372549, 1, 0, 1,
-0.9593399, 1.509752, -0.1306755, 0.9333333, 1, 0, 1,
-0.9543009, -0.2618104, -1.013478, 0.9254902, 1, 0, 1,
-0.9513279, 2.485027, -0.7081967, 0.9215686, 1, 0, 1,
-0.9512741, -0.7301193, -2.312101, 0.9137255, 1, 0, 1,
-0.9505968, 1.968851, 0.5822645, 0.9098039, 1, 0, 1,
-0.9502575, 2.359978, -1.509289, 0.9019608, 1, 0, 1,
-0.9501621, -2.108239, -3.404426, 0.8941177, 1, 0, 1,
-0.9479328, -0.5643169, -1.077619, 0.8901961, 1, 0, 1,
-0.9470993, 0.1201321, -1.583329, 0.8823529, 1, 0, 1,
-0.943758, -0.5186158, -1.769084, 0.8784314, 1, 0, 1,
-0.9392954, -0.7796897, -1.075617, 0.8705882, 1, 0, 1,
-0.9355924, 0.05236588, -0.2709351, 0.8666667, 1, 0, 1,
-0.9344208, -0.7558346, -2.88049, 0.8588235, 1, 0, 1,
-0.929722, -0.06624831, -1.499864, 0.854902, 1, 0, 1,
-0.9280462, -1.490034, -1.82433, 0.8470588, 1, 0, 1,
-0.9211492, 0.3352196, -2.648009, 0.8431373, 1, 0, 1,
-0.9208167, 0.8301288, -1.266868, 0.8352941, 1, 0, 1,
-0.9166918, 0.6064078, -2.17222, 0.8313726, 1, 0, 1,
-0.9153506, -1.068712, -2.690732, 0.8235294, 1, 0, 1,
-0.913808, 0.1889101, -1.429715, 0.8196079, 1, 0, 1,
-0.8991675, 0.4554207, -1.593264, 0.8117647, 1, 0, 1,
-0.8968351, 0.5546587, -0.4913436, 0.8078431, 1, 0, 1,
-0.8943471, 0.7876957, -1.496866, 0.8, 1, 0, 1,
-0.8942227, -1.011287, -1.373814, 0.7921569, 1, 0, 1,
-0.8865607, -1.231652, -2.920139, 0.7882353, 1, 0, 1,
-0.8729395, -0.133036, -1.072893, 0.7803922, 1, 0, 1,
-0.8687231, 0.4625575, 0.9475083, 0.7764706, 1, 0, 1,
-0.8686215, 0.3894749, -1.06316, 0.7686275, 1, 0, 1,
-0.8685198, 0.05419599, 0.3082826, 0.7647059, 1, 0, 1,
-0.8645316, -0.4481398, -5.108446, 0.7568628, 1, 0, 1,
-0.8620327, 1.27964, -0.5174646, 0.7529412, 1, 0, 1,
-0.8603941, -0.4538221, -2.059317, 0.7450981, 1, 0, 1,
-0.8586345, -0.5354165, -1.548829, 0.7411765, 1, 0, 1,
-0.8570207, 1.656915, -0.7550375, 0.7333333, 1, 0, 1,
-0.8547453, 0.6059524, 1.350594, 0.7294118, 1, 0, 1,
-0.8511463, 0.01387491, -2.713981, 0.7215686, 1, 0, 1,
-0.8483303, -0.9244579, -1.837587, 0.7176471, 1, 0, 1,
-0.844819, 1.286138, -0.9376031, 0.7098039, 1, 0, 1,
-0.8401197, -1.293743, -3.814378, 0.7058824, 1, 0, 1,
-0.8391834, 0.4843292, -0.9555809, 0.6980392, 1, 0, 1,
-0.8316356, 0.8625985, -1.809275, 0.6901961, 1, 0, 1,
-0.8297616, -1.200374, -3.313121, 0.6862745, 1, 0, 1,
-0.825428, -0.2541941, -2.309891, 0.6784314, 1, 0, 1,
-0.8246922, -0.53684, -3.883488, 0.6745098, 1, 0, 1,
-0.8217465, 1.462954, 0.7961408, 0.6666667, 1, 0, 1,
-0.8174519, 1.675706, 0.4719875, 0.6627451, 1, 0, 1,
-0.8143108, 0.4915664, -1.672425, 0.654902, 1, 0, 1,
-0.8084453, 0.8780759, -1.115295, 0.6509804, 1, 0, 1,
-0.8025678, -1.769059, -2.999214, 0.6431373, 1, 0, 1,
-0.7996583, 0.9620165, -0.05862234, 0.6392157, 1, 0, 1,
-0.7923595, 2.32157, -0.2964201, 0.6313726, 1, 0, 1,
-0.7915258, 0.4313954, -0.2015321, 0.627451, 1, 0, 1,
-0.7886411, 0.544477, -0.1320919, 0.6196079, 1, 0, 1,
-0.7829645, -0.2851247, -1.088772, 0.6156863, 1, 0, 1,
-0.7818647, 1.393799, -1.89285, 0.6078432, 1, 0, 1,
-0.7797686, -0.01695969, -0.7423979, 0.6039216, 1, 0, 1,
-0.7776583, -0.4191967, -3.524216, 0.5960785, 1, 0, 1,
-0.7746651, -2.272506, -2.054032, 0.5882353, 1, 0, 1,
-0.7711204, 1.620667, -1.535563, 0.5843138, 1, 0, 1,
-0.768761, 0.5897919, -1.841864, 0.5764706, 1, 0, 1,
-0.7681192, 0.2928296, -1.898163, 0.572549, 1, 0, 1,
-0.7634084, 0.2025411, -0.7808173, 0.5647059, 1, 0, 1,
-0.760312, -0.8902441, -5.348391, 0.5607843, 1, 0, 1,
-0.7577379, 0.06800963, -1.815235, 0.5529412, 1, 0, 1,
-0.7539356, -1.464607, -2.617805, 0.5490196, 1, 0, 1,
-0.7529295, -0.6139965, -2.008034, 0.5411765, 1, 0, 1,
-0.7486108, -0.8261325, -3.534904, 0.5372549, 1, 0, 1,
-0.7484752, -0.7132406, -3.547884, 0.5294118, 1, 0, 1,
-0.7472597, 1.595895, -1.512969, 0.5254902, 1, 0, 1,
-0.746794, -1.09435, -2.875906, 0.5176471, 1, 0, 1,
-0.7441779, -0.4807871, -1.755032, 0.5137255, 1, 0, 1,
-0.7432582, -0.5785624, -2.936703, 0.5058824, 1, 0, 1,
-0.7427244, 1.038064, 0.9302803, 0.5019608, 1, 0, 1,
-0.7357955, -0.6927148, -2.272535, 0.4941176, 1, 0, 1,
-0.7354203, 0.489859, -0.4293582, 0.4862745, 1, 0, 1,
-0.730304, 0.8868285, -0.08496757, 0.4823529, 1, 0, 1,
-0.7272286, -0.1595847, -3.154705, 0.4745098, 1, 0, 1,
-0.7263061, -1.382981, -2.577783, 0.4705882, 1, 0, 1,
-0.7195342, 0.5304206, -1.325526, 0.4627451, 1, 0, 1,
-0.7143649, 0.02706201, -1.841315, 0.4588235, 1, 0, 1,
-0.7040521, 1.080572, -1.317672, 0.4509804, 1, 0, 1,
-0.7005889, -0.02198756, -1.281687, 0.4470588, 1, 0, 1,
-0.6987005, 0.7742814, -2.120665, 0.4392157, 1, 0, 1,
-0.6950896, 1.577862, -1.592075, 0.4352941, 1, 0, 1,
-0.6948559, -0.2108027, -1.827839, 0.427451, 1, 0, 1,
-0.6940503, 0.1073129, -0.1595567, 0.4235294, 1, 0, 1,
-0.6897185, -0.8494209, -4.370368, 0.4156863, 1, 0, 1,
-0.686725, -0.510945, -1.900317, 0.4117647, 1, 0, 1,
-0.6866343, 2.321831, 1.271307, 0.4039216, 1, 0, 1,
-0.6843159, 0.260987, -2.112613, 0.3960784, 1, 0, 1,
-0.6725137, -0.6288385, -1.946814, 0.3921569, 1, 0, 1,
-0.6593014, 0.1051127, -0.9074002, 0.3843137, 1, 0, 1,
-0.6581964, -0.3588305, -2.818502, 0.3803922, 1, 0, 1,
-0.6528402, 0.6833115, -0.2005361, 0.372549, 1, 0, 1,
-0.6446633, 1.410465, 1.960605, 0.3686275, 1, 0, 1,
-0.6443527, -0.3472265, -2.215854, 0.3607843, 1, 0, 1,
-0.6415543, 1.143697, -0.04054398, 0.3568628, 1, 0, 1,
-0.6413491, 0.2936884, -0.6288376, 0.3490196, 1, 0, 1,
-0.6337188, 0.7639787, -0.276801, 0.345098, 1, 0, 1,
-0.631022, 0.1859615, -3.301692, 0.3372549, 1, 0, 1,
-0.6260843, -0.5077636, -1.665664, 0.3333333, 1, 0, 1,
-0.6249692, -0.9623012, -2.939133, 0.3254902, 1, 0, 1,
-0.6124875, -0.8848684, -3.46564, 0.3215686, 1, 0, 1,
-0.6122208, -0.7496859, -3.383101, 0.3137255, 1, 0, 1,
-0.6118624, -0.4527977, -2.39492, 0.3098039, 1, 0, 1,
-0.6060066, 1.906777, 0.4007317, 0.3019608, 1, 0, 1,
-0.604826, 0.8272187, -1.691931, 0.2941177, 1, 0, 1,
-0.6039118, -0.6491712, -1.85424, 0.2901961, 1, 0, 1,
-0.5977134, -2.313399, -2.224439, 0.282353, 1, 0, 1,
-0.5952574, -0.7604274, -3.338827, 0.2784314, 1, 0, 1,
-0.590107, -0.1725041, -3.408556, 0.2705882, 1, 0, 1,
-0.5870604, 0.8302113, 0.4369224, 0.2666667, 1, 0, 1,
-0.5868239, -0.3665732, -1.357578, 0.2588235, 1, 0, 1,
-0.5841194, 0.9006895, -1.502654, 0.254902, 1, 0, 1,
-0.5836527, -0.7216486, -2.767492, 0.2470588, 1, 0, 1,
-0.5754012, 0.2048957, -1.306663, 0.2431373, 1, 0, 1,
-0.5713152, 1.555283, 0.05960491, 0.2352941, 1, 0, 1,
-0.569548, -0.08960702, -1.408309, 0.2313726, 1, 0, 1,
-0.5684378, 2.017203, 0.603647, 0.2235294, 1, 0, 1,
-0.5675194, 0.6188741, -1.158868, 0.2196078, 1, 0, 1,
-0.5653976, 0.1513625, -2.913289, 0.2117647, 1, 0, 1,
-0.5642312, -2.316846, -4.001215, 0.2078431, 1, 0, 1,
-0.5636269, -1.164585, -3.486506, 0.2, 1, 0, 1,
-0.5576012, -1.444865, -2.401703, 0.1921569, 1, 0, 1,
-0.5543044, 0.5682775, -1.697661, 0.1882353, 1, 0, 1,
-0.551591, -0.7362459, -1.631789, 0.1803922, 1, 0, 1,
-0.5506721, -0.5265236, -2.390776, 0.1764706, 1, 0, 1,
-0.5479949, -1.066855, -4.128371, 0.1686275, 1, 0, 1,
-0.5459417, -2.616071, -1.489343, 0.1647059, 1, 0, 1,
-0.5405591, -0.2636288, -1.074555, 0.1568628, 1, 0, 1,
-0.5398644, 1.585962, 0.0228496, 0.1529412, 1, 0, 1,
-0.5379782, 1.060875, -1.11639, 0.145098, 1, 0, 1,
-0.5374091, -0.02730809, -1.231275, 0.1411765, 1, 0, 1,
-0.5340921, -0.03357258, -0.3446825, 0.1333333, 1, 0, 1,
-0.5337162, 0.1982307, -0.7275807, 0.1294118, 1, 0, 1,
-0.5262578, 0.09848297, -1.650366, 0.1215686, 1, 0, 1,
-0.5245924, 0.6818112, -0.8723522, 0.1176471, 1, 0, 1,
-0.518387, 0.1296813, -2.209515, 0.1098039, 1, 0, 1,
-0.5070438, -1.612739, -2.136817, 0.1058824, 1, 0, 1,
-0.5066037, -0.05763097, -0.130755, 0.09803922, 1, 0, 1,
-0.5058011, 0.4164315, -1.039747, 0.09019608, 1, 0, 1,
-0.5029396, -0.1606941, -4.069034, 0.08627451, 1, 0, 1,
-0.4983232, 0.4557194, -0.150122, 0.07843138, 1, 0, 1,
-0.4876147, 1.020405, -0.3333004, 0.07450981, 1, 0, 1,
-0.4858693, -0.02546165, -1.808003, 0.06666667, 1, 0, 1,
-0.4851081, 0.8392528, -0.2759978, 0.0627451, 1, 0, 1,
-0.4837458, -0.07169598, -3.262467, 0.05490196, 1, 0, 1,
-0.4827306, 0.1897682, 0.08484815, 0.05098039, 1, 0, 1,
-0.4819571, 1.108511, 0.6530405, 0.04313726, 1, 0, 1,
-0.4789569, 0.175111, -2.951386, 0.03921569, 1, 0, 1,
-0.4761307, -1.730377, -2.151838, 0.03137255, 1, 0, 1,
-0.4739969, -0.09891007, -1.205532, 0.02745098, 1, 0, 1,
-0.4736764, 0.5806024, -1.236429, 0.01960784, 1, 0, 1,
-0.4692184, -0.1031269, -2.302783, 0.01568628, 1, 0, 1,
-0.4691394, 0.3740317, -0.2975965, 0.007843138, 1, 0, 1,
-0.4674691, 0.4683551, -0.3721792, 0.003921569, 1, 0, 1,
-0.4670126, 2.720548, 0.6619229, 0, 1, 0.003921569, 1,
-0.4606124, -1.683813, -2.873997, 0, 1, 0.01176471, 1,
-0.4603195, 1.625118, -0.5518614, 0, 1, 0.01568628, 1,
-0.4599734, 0.385745, -0.3317235, 0, 1, 0.02352941, 1,
-0.4553862, -2.043739, -2.94289, 0, 1, 0.02745098, 1,
-0.4540517, -0.5414925, -3.512143, 0, 1, 0.03529412, 1,
-0.4454486, 0.5431001, -0.800449, 0, 1, 0.03921569, 1,
-0.4363447, -0.2425105, -1.858562, 0, 1, 0.04705882, 1,
-0.4356713, -0.5435892, -1.886274, 0, 1, 0.05098039, 1,
-0.4287677, -0.9013883, -3.767476, 0, 1, 0.05882353, 1,
-0.427624, 0.03132556, -1.56999, 0, 1, 0.0627451, 1,
-0.4214144, -1.484655, -3.045358, 0, 1, 0.07058824, 1,
-0.4157736, 1.217462, 0.2471963, 0, 1, 0.07450981, 1,
-0.4037074, -2.365955, -1.931823, 0, 1, 0.08235294, 1,
-0.4034535, -0.1941753, -1.679299, 0, 1, 0.08627451, 1,
-0.3968478, -1.243024, -2.94072, 0, 1, 0.09411765, 1,
-0.3968266, -0.7852809, -2.839542, 0, 1, 0.1019608, 1,
-0.3937497, -0.9786576, -2.808432, 0, 1, 0.1058824, 1,
-0.3910469, -0.2890143, -2.087851, 0, 1, 0.1137255, 1,
-0.3860033, 1.658519, 0.5751209, 0, 1, 0.1176471, 1,
-0.3859871, 1.36358, -1.143636, 0, 1, 0.1254902, 1,
-0.3848286, -0.2627024, -1.37227, 0, 1, 0.1294118, 1,
-0.3709604, -1.098979, -2.724161, 0, 1, 0.1372549, 1,
-0.3690106, -1.573062, -3.663817, 0, 1, 0.1411765, 1,
-0.3683562, -0.6988571, -4.913185, 0, 1, 0.1490196, 1,
-0.3679705, 1.344914, 0.01024625, 0, 1, 0.1529412, 1,
-0.3641617, 0.2334343, -3.146258, 0, 1, 0.1607843, 1,
-0.3619081, -1.546702, -2.836742, 0, 1, 0.1647059, 1,
-0.3612559, 0.7295215, 1.683109, 0, 1, 0.172549, 1,
-0.3585747, -1.638686, -2.061118, 0, 1, 0.1764706, 1,
-0.3576676, -1.43605, -3.064136, 0, 1, 0.1843137, 1,
-0.3560953, -0.7917605, -2.320313, 0, 1, 0.1882353, 1,
-0.3557281, 1.299017, -1.581509, 0, 1, 0.1960784, 1,
-0.3551107, -0.771045, -0.9493673, 0, 1, 0.2039216, 1,
-0.3549868, -0.599813, -3.553183, 0, 1, 0.2078431, 1,
-0.3541503, -1.010314, -2.763373, 0, 1, 0.2156863, 1,
-0.3485684, -1.114874, -3.378294, 0, 1, 0.2196078, 1,
-0.3443063, -2.62231, -4.823314, 0, 1, 0.227451, 1,
-0.3439091, -0.002783277, -1.484725, 0, 1, 0.2313726, 1,
-0.3413714, 0.6231001, 0.09990682, 0, 1, 0.2392157, 1,
-0.3408787, -0.1267888, -2.223246, 0, 1, 0.2431373, 1,
-0.3382185, 0.6839856, 0.1167467, 0, 1, 0.2509804, 1,
-0.3371704, 0.7119837, -1.734776, 0, 1, 0.254902, 1,
-0.3368589, -1.636612, -4.78192, 0, 1, 0.2627451, 1,
-0.3349373, -1.212303, -2.744308, 0, 1, 0.2666667, 1,
-0.3281461, -1.011201, -3.735571, 0, 1, 0.2745098, 1,
-0.3235257, -0.08410036, -2.021623, 0, 1, 0.2784314, 1,
-0.3203964, -1.978501, -2.276663, 0, 1, 0.2862745, 1,
-0.3196332, 1.423773, -2.504725, 0, 1, 0.2901961, 1,
-0.3152679, -1.069469, -4.359668, 0, 1, 0.2980392, 1,
-0.3080601, -0.9924624, -0.9046881, 0, 1, 0.3058824, 1,
-0.3077888, -0.2115595, -4.850665, 0, 1, 0.3098039, 1,
-0.303148, 0.7328505, -1.850548, 0, 1, 0.3176471, 1,
-0.3030781, 0.5841187, 0.1181381, 0, 1, 0.3215686, 1,
-0.302774, 0.4428053, 0.136501, 0, 1, 0.3294118, 1,
-0.3007485, -1.246814, -1.439805, 0, 1, 0.3333333, 1,
-0.2996666, 0.1725822, 0.5527151, 0, 1, 0.3411765, 1,
-0.2970376, -0.5861637, -2.540993, 0, 1, 0.345098, 1,
-0.2910935, 0.1438509, -2.134929, 0, 1, 0.3529412, 1,
-0.2890259, 0.7370934, -0.7614002, 0, 1, 0.3568628, 1,
-0.2849471, -0.7121345, -2.551296, 0, 1, 0.3647059, 1,
-0.2829657, 1.235789, 0.135398, 0, 1, 0.3686275, 1,
-0.2827749, 1.06455, 0.8251929, 0, 1, 0.3764706, 1,
-0.2772302, -1.939077, -3.301517, 0, 1, 0.3803922, 1,
-0.2737575, -1.375383, -0.4011978, 0, 1, 0.3882353, 1,
-0.2737558, 0.09568675, -0.9819738, 0, 1, 0.3921569, 1,
-0.2714885, -0.4563082, -3.264017, 0, 1, 0.4, 1,
-0.2703463, -0.9887587, -0.7085057, 0, 1, 0.4078431, 1,
-0.2692499, -0.792313, -2.804881, 0, 1, 0.4117647, 1,
-0.2663796, 0.3862347, -1.560538, 0, 1, 0.4196078, 1,
-0.2659011, -1.660798, -3.480245, 0, 1, 0.4235294, 1,
-0.2590678, -1.119603, -3.09542, 0, 1, 0.4313726, 1,
-0.2585615, 2.330564, -0.7824281, 0, 1, 0.4352941, 1,
-0.2584152, -0.6412727, -2.861173, 0, 1, 0.4431373, 1,
-0.2583894, -0.2625446, -1.836782, 0, 1, 0.4470588, 1,
-0.2564812, 0.8404508, 0.5321736, 0, 1, 0.454902, 1,
-0.2457548, 0.6085854, -1.503435, 0, 1, 0.4588235, 1,
-0.2429741, 1.422075, -0.2862863, 0, 1, 0.4666667, 1,
-0.2415449, -0.5947204, -3.325358, 0, 1, 0.4705882, 1,
-0.2391429, 0.6123934, 1.145586, 0, 1, 0.4784314, 1,
-0.2376998, 1.057357, -0.1479577, 0, 1, 0.4823529, 1,
-0.2346275, 1.471821, 0.8549713, 0, 1, 0.4901961, 1,
-0.2292956, -0.6789764, -1.998232, 0, 1, 0.4941176, 1,
-0.2289158, 0.3076352, -0.1518252, 0, 1, 0.5019608, 1,
-0.2234691, 0.4409732, -1.021873, 0, 1, 0.509804, 1,
-0.2195653, 1.059713, -2.529606, 0, 1, 0.5137255, 1,
-0.2192353, -2.083978, -2.61885, 0, 1, 0.5215687, 1,
-0.2147283, -0.7783626, -2.20763, 0, 1, 0.5254902, 1,
-0.1982674, -0.8625239, -2.572856, 0, 1, 0.5333334, 1,
-0.1963474, -0.3300675, -3.699265, 0, 1, 0.5372549, 1,
-0.1935955, -0.5214851, -4.140543, 0, 1, 0.5450981, 1,
-0.1912544, -0.5758218, -2.368745, 0, 1, 0.5490196, 1,
-0.1909063, -0.9396389, -3.088683, 0, 1, 0.5568628, 1,
-0.1861771, 0.1691088, -2.204868, 0, 1, 0.5607843, 1,
-0.1840091, 1.067753, -1.503877, 0, 1, 0.5686275, 1,
-0.1797843, -1.797922, -2.2028, 0, 1, 0.572549, 1,
-0.1781736, -0.8474887, -3.528691, 0, 1, 0.5803922, 1,
-0.1767261, -0.7424852, -2.742115, 0, 1, 0.5843138, 1,
-0.1759069, -0.2854903, -0.5989757, 0, 1, 0.5921569, 1,
-0.1742157, -0.6898442, -2.414307, 0, 1, 0.5960785, 1,
-0.1736767, 3.166862, 0.4723048, 0, 1, 0.6039216, 1,
-0.1707351, 0.4813877, -1.940501, 0, 1, 0.6117647, 1,
-0.1687274, -0.8621096, -3.519583, 0, 1, 0.6156863, 1,
-0.1677263, 0.8120532, -0.9242355, 0, 1, 0.6235294, 1,
-0.1666464, 1.842382, 0.9794659, 0, 1, 0.627451, 1,
-0.1620007, 0.5446481, -0.05171188, 0, 1, 0.6352941, 1,
-0.1619084, 0.156275, -3.069172, 0, 1, 0.6392157, 1,
-0.1581297, -0.6874048, -2.687931, 0, 1, 0.6470588, 1,
-0.1569448, -1.497927, -2.386185, 0, 1, 0.6509804, 1,
-0.1565845, 1.767639, -0.9662463, 0, 1, 0.6588235, 1,
-0.1556, 0.8828329, -1.351402, 0, 1, 0.6627451, 1,
-0.1457229, -0.8140001, -4.053058, 0, 1, 0.6705883, 1,
-0.1355361, -0.9216996, -1.584911, 0, 1, 0.6745098, 1,
-0.1352287, -0.1281545, -3.107362, 0, 1, 0.682353, 1,
-0.1347235, 0.09896161, -2.104129, 0, 1, 0.6862745, 1,
-0.1317617, 0.2200857, 0.6559737, 0, 1, 0.6941177, 1,
-0.1300607, 1.731772, 2.438257, 0, 1, 0.7019608, 1,
-0.129052, -0.0105046, -3.072207, 0, 1, 0.7058824, 1,
-0.127758, -0.8181347, -3.243837, 0, 1, 0.7137255, 1,
-0.1270771, -0.9729058, -1.344189, 0, 1, 0.7176471, 1,
-0.1263307, -2.812994, -2.733881, 0, 1, 0.7254902, 1,
-0.1173174, 0.7103061, -1.160524, 0, 1, 0.7294118, 1,
-0.1170852, 0.09776069, 0.3110677, 0, 1, 0.7372549, 1,
-0.1168088, 1.427807, -0.005101659, 0, 1, 0.7411765, 1,
-0.1157436, 0.696839, -0.03488989, 0, 1, 0.7490196, 1,
-0.1126736, -0.6325847, -3.010226, 0, 1, 0.7529412, 1,
-0.09544098, -0.3245521, -2.220043, 0, 1, 0.7607843, 1,
-0.08982632, -0.6223619, -3.845752, 0, 1, 0.7647059, 1,
-0.08756728, 0.4754761, -1.021926, 0, 1, 0.772549, 1,
-0.08527265, 0.7764229, -0.225743, 0, 1, 0.7764706, 1,
-0.08449255, 0.02425879, -2.167224, 0, 1, 0.7843137, 1,
-0.0827234, 2.950584, 0.37548, 0, 1, 0.7882353, 1,
-0.07877421, 1.636734, 0.6990073, 0, 1, 0.7960784, 1,
-0.07029638, -0.2742035, -2.856474, 0, 1, 0.8039216, 1,
-0.06824885, 0.6287515, -1.016537, 0, 1, 0.8078431, 1,
-0.06235157, -2.047191, -2.075084, 0, 1, 0.8156863, 1,
-0.06007102, 0.06509367, -2.260839, 0, 1, 0.8196079, 1,
-0.05890815, -0.4324692, -3.457775, 0, 1, 0.827451, 1,
-0.05831715, -1.631483, -3.417467, 0, 1, 0.8313726, 1,
-0.05753709, 0.2062283, -0.08947411, 0, 1, 0.8392157, 1,
-0.05679305, 0.4800926, 1.822041, 0, 1, 0.8431373, 1,
-0.0562943, -0.5881414, -1.652426, 0, 1, 0.8509804, 1,
-0.05459476, -0.06042411, -1.545293, 0, 1, 0.854902, 1,
-0.05294225, -1.695195, -2.342403, 0, 1, 0.8627451, 1,
-0.052917, 0.2155363, -0.659683, 0, 1, 0.8666667, 1,
-0.05279688, 0.3107756, -1.674793, 0, 1, 0.8745098, 1,
-0.04845243, 1.326315, -0.8890917, 0, 1, 0.8784314, 1,
-0.0468733, 0.1556422, 1.445641, 0, 1, 0.8862745, 1,
-0.04654269, 0.2618223, -0.5642893, 0, 1, 0.8901961, 1,
-0.04517416, 0.7798935, 0.03829654, 0, 1, 0.8980392, 1,
-0.04452033, 0.2059281, -1.320104, 0, 1, 0.9058824, 1,
-0.04058173, -0.9237003, -2.675253, 0, 1, 0.9098039, 1,
-0.03994653, -0.01928503, -1.513312, 0, 1, 0.9176471, 1,
-0.0393053, 0.1055108, 0.855063, 0, 1, 0.9215686, 1,
-0.03903159, 0.2107977, -0.7830374, 0, 1, 0.9294118, 1,
-0.03843487, 1.97445, -1.007339, 0, 1, 0.9333333, 1,
-0.03343479, -0.1231836, -3.11498, 0, 1, 0.9411765, 1,
-0.03328023, 1.682951, 0.3255472, 0, 1, 0.945098, 1,
-0.02802669, 1.211524, -0.5444995, 0, 1, 0.9529412, 1,
-0.02789462, -0.9669812, -2.329858, 0, 1, 0.9568627, 1,
-0.02516566, -0.7376159, -3.133089, 0, 1, 0.9647059, 1,
-0.02202629, -0.5722097, -5.280345, 0, 1, 0.9686275, 1,
-0.01514117, -0.1341891, -3.529632, 0, 1, 0.9764706, 1,
-0.01240965, -0.458964, -2.766597, 0, 1, 0.9803922, 1,
-0.01219739, 0.834008, 0.08897211, 0, 1, 0.9882353, 1,
-0.01173379, 0.4540066, 0.4794027, 0, 1, 0.9921569, 1,
-0.003073316, -1.364899, -3.667146, 0, 1, 1, 1,
-0.001851192, -0.8004301, -2.990254, 0, 0.9921569, 1, 1,
-0.001303368, -2.374665, -1.050722, 0, 0.9882353, 1, 1,
-0.0003019312, -2.414025, -2.528478, 0, 0.9803922, 1, 1,
0.005278847, -1.254421, 3.343933, 0, 0.9764706, 1, 1,
0.008027415, 0.9372147, 0.7684867, 0, 0.9686275, 1, 1,
0.01149101, 2.129699, -0.5898151, 0, 0.9647059, 1, 1,
0.01706234, 1.072677, 0.02624142, 0, 0.9568627, 1, 1,
0.01754365, 0.9943272, 0.5487062, 0, 0.9529412, 1, 1,
0.02016294, -0.7963039, 2.562267, 0, 0.945098, 1, 1,
0.02096022, -1.539873, 2.602576, 0, 0.9411765, 1, 1,
0.02525873, -1.712859, 2.391083, 0, 0.9333333, 1, 1,
0.02664993, -0.569514, 1.420977, 0, 0.9294118, 1, 1,
0.02670868, 0.7059273, 0.5717303, 0, 0.9215686, 1, 1,
0.02701926, 0.001943569, 1.8784, 0, 0.9176471, 1, 1,
0.02719815, 0.7314964, -0.8737673, 0, 0.9098039, 1, 1,
0.02768295, -0.08048204, 0.9745596, 0, 0.9058824, 1, 1,
0.02788949, 0.9239388, -0.3338672, 0, 0.8980392, 1, 1,
0.02817234, -0.2763734, 3.047195, 0, 0.8901961, 1, 1,
0.03238024, -1.491868, 3.711771, 0, 0.8862745, 1, 1,
0.03581295, -0.7514645, 3.037601, 0, 0.8784314, 1, 1,
0.03740028, 0.871044, -1.063125, 0, 0.8745098, 1, 1,
0.04231338, 1.531391, -0.3097803, 0, 0.8666667, 1, 1,
0.04471501, -0.540064, 2.210593, 0, 0.8627451, 1, 1,
0.04554292, -0.05121264, 3.083709, 0, 0.854902, 1, 1,
0.04814767, -1.197012, 2.802947, 0, 0.8509804, 1, 1,
0.04866213, -1.316857, 3.205923, 0, 0.8431373, 1, 1,
0.0501855, -0.5697321, 3.001574, 0, 0.8392157, 1, 1,
0.05170951, 0.3767837, 1.900478, 0, 0.8313726, 1, 1,
0.05546788, 1.216747, 0.2503706, 0, 0.827451, 1, 1,
0.05743955, -0.2883946, 2.748672, 0, 0.8196079, 1, 1,
0.05906064, -0.6087055, 2.492306, 0, 0.8156863, 1, 1,
0.06540848, -0.3766868, 2.848361, 0, 0.8078431, 1, 1,
0.06554192, 0.9857051, -0.7720724, 0, 0.8039216, 1, 1,
0.06601387, -0.7075761, 4.8333, 0, 0.7960784, 1, 1,
0.06932957, 0.5033349, 0.07519805, 0, 0.7882353, 1, 1,
0.07461436, -0.1804324, 2.095993, 0, 0.7843137, 1, 1,
0.0749227, 0.1622359, 0.2024207, 0, 0.7764706, 1, 1,
0.08797915, -0.9243545, 2.511218, 0, 0.772549, 1, 1,
0.08910235, 0.2304047, -0.03522113, 0, 0.7647059, 1, 1,
0.090227, -1.044867, 4.989984, 0, 0.7607843, 1, 1,
0.09040493, -0.9404611, 5.00805, 0, 0.7529412, 1, 1,
0.09375378, -0.8283703, 3.011267, 0, 0.7490196, 1, 1,
0.09740026, 0.7657806, 0.6133599, 0, 0.7411765, 1, 1,
0.09836903, 0.2441387, 1.282353, 0, 0.7372549, 1, 1,
0.09854309, 0.2248823, -1.15248, 0, 0.7294118, 1, 1,
0.1006649, 0.7869106, 0.4881231, 0, 0.7254902, 1, 1,
0.1010996, 0.02997248, 0.9207573, 0, 0.7176471, 1, 1,
0.1101766, 0.3759776, 0.1184108, 0, 0.7137255, 1, 1,
0.1112992, -1.195261, 2.219857, 0, 0.7058824, 1, 1,
0.1169224, -0.004049666, 3.295019, 0, 0.6980392, 1, 1,
0.1189502, -0.5187278, 2.240893, 0, 0.6941177, 1, 1,
0.121, 0.5011531, 0.2679076, 0, 0.6862745, 1, 1,
0.1217418, -0.8883212, 2.944927, 0, 0.682353, 1, 1,
0.1249962, 0.976629, 0.6490668, 0, 0.6745098, 1, 1,
0.1277202, 0.1202493, 2.743372, 0, 0.6705883, 1, 1,
0.1281003, -0.06790641, 2.333876, 0, 0.6627451, 1, 1,
0.1339406, -0.9292551, 3.263067, 0, 0.6588235, 1, 1,
0.1365559, -0.1773501, 2.540963, 0, 0.6509804, 1, 1,
0.1396528, -0.6381698, 1.560696, 0, 0.6470588, 1, 1,
0.1400072, -0.1417647, 0.9249117, 0, 0.6392157, 1, 1,
0.1448165, 0.1483133, 0.5747113, 0, 0.6352941, 1, 1,
0.1481612, 1.036237, 1.794208, 0, 0.627451, 1, 1,
0.1512875, 0.895001, -0.9878008, 0, 0.6235294, 1, 1,
0.1515846, 1.440165, -1.339646, 0, 0.6156863, 1, 1,
0.1524918, 0.4316046, -0.2606493, 0, 0.6117647, 1, 1,
0.1569552, -0.2960092, 1.812106, 0, 0.6039216, 1, 1,
0.159515, -0.8378554, 2.237085, 0, 0.5960785, 1, 1,
0.16058, -1.362635, 2.712871, 0, 0.5921569, 1, 1,
0.1626922, -0.02640714, 1.275855, 0, 0.5843138, 1, 1,
0.1637751, 1.472462, 0.8435684, 0, 0.5803922, 1, 1,
0.1691874, -0.7383737, 4.094782, 0, 0.572549, 1, 1,
0.1708086, 0.1085801, 1.487292, 0, 0.5686275, 1, 1,
0.1727076, -0.2663483, 0.9818501, 0, 0.5607843, 1, 1,
0.1729397, 0.07995193, 1.92983, 0, 0.5568628, 1, 1,
0.1766287, 0.03787733, 0.4899518, 0, 0.5490196, 1, 1,
0.1827329, 0.5053221, -0.3494524, 0, 0.5450981, 1, 1,
0.1847703, -1.566763, 2.701224, 0, 0.5372549, 1, 1,
0.1847773, 0.2555387, -0.374056, 0, 0.5333334, 1, 1,
0.18879, -1.892141, 3.481593, 0, 0.5254902, 1, 1,
0.1897803, -0.5972176, 1.495149, 0, 0.5215687, 1, 1,
0.1925507, -1.001118, 0.9925447, 0, 0.5137255, 1, 1,
0.1932393, 1.34631, -1.535649, 0, 0.509804, 1, 1,
0.1954974, 2.239258, 0.214607, 0, 0.5019608, 1, 1,
0.196255, -0.2748779, 3.273103, 0, 0.4941176, 1, 1,
0.2033284, -0.08597118, 0.9425725, 0, 0.4901961, 1, 1,
0.2043202, -1.336864, 1.526324, 0, 0.4823529, 1, 1,
0.2078643, 1.012558, 1.648275, 0, 0.4784314, 1, 1,
0.2079983, 3.122259, -2.064234, 0, 0.4705882, 1, 1,
0.2094806, 0.07299528, 0.5792731, 0, 0.4666667, 1, 1,
0.212529, -0.4960128, 2.21451, 0, 0.4588235, 1, 1,
0.2139364, 1.028551, 1.551223, 0, 0.454902, 1, 1,
0.2191745, 0.9076108, 1.919757, 0, 0.4470588, 1, 1,
0.2204831, 0.422748, -0.1724637, 0, 0.4431373, 1, 1,
0.2228844, -0.3938283, 1.655257, 0, 0.4352941, 1, 1,
0.2236034, -1.925086, 2.294009, 0, 0.4313726, 1, 1,
0.2251498, -0.1694373, 0.5234951, 0, 0.4235294, 1, 1,
0.2262988, -0.505878, 2.790212, 0, 0.4196078, 1, 1,
0.2278014, -1.113235, 3.346811, 0, 0.4117647, 1, 1,
0.2352616, -0.2185696, 1.270634, 0, 0.4078431, 1, 1,
0.2359957, 1.232493, -0.500664, 0, 0.4, 1, 1,
0.2369049, -0.8159322, 2.52996, 0, 0.3921569, 1, 1,
0.2392245, 0.764, -0.06431258, 0, 0.3882353, 1, 1,
0.2406609, -0.8956246, 4.10912, 0, 0.3803922, 1, 1,
0.2429747, -2.472619, 3.037085, 0, 0.3764706, 1, 1,
0.2460744, 0.468449, -0.5298848, 0, 0.3686275, 1, 1,
0.2486039, 0.8066443, 0.7080172, 0, 0.3647059, 1, 1,
0.2535075, 0.4878708, 1.41353, 0, 0.3568628, 1, 1,
0.2573566, -0.01026296, 2.099829, 0, 0.3529412, 1, 1,
0.2630628, -0.04325769, 0.8397481, 0, 0.345098, 1, 1,
0.2643295, 0.9000555, 0.6048248, 0, 0.3411765, 1, 1,
0.2650332, 0.4430526, -0.6434106, 0, 0.3333333, 1, 1,
0.267211, -0.4802535, 3.925894, 0, 0.3294118, 1, 1,
0.268462, 0.8564947, -0.07198929, 0, 0.3215686, 1, 1,
0.2688743, 0.01405, 0.6050503, 0, 0.3176471, 1, 1,
0.2691689, 2.159888, 0.6418453, 0, 0.3098039, 1, 1,
0.2695237, 0.211488, 0.3911, 0, 0.3058824, 1, 1,
0.2737785, -0.6926185, 3.548273, 0, 0.2980392, 1, 1,
0.2748146, 0.715121, 0.5863303, 0, 0.2901961, 1, 1,
0.2771667, -0.1281502, 3.817938, 0, 0.2862745, 1, 1,
0.2803991, -0.7410372, 3.495133, 0, 0.2784314, 1, 1,
0.280641, -0.005954859, 2.507736, 0, 0.2745098, 1, 1,
0.2841482, -0.1298838, 2.253495, 0, 0.2666667, 1, 1,
0.2868704, 1.19197, -1.509519, 0, 0.2627451, 1, 1,
0.2891745, -0.480604, 1.743596, 0, 0.254902, 1, 1,
0.2949999, 1.170549, -0.5409121, 0, 0.2509804, 1, 1,
0.2982554, 0.4008236, 0.9221584, 0, 0.2431373, 1, 1,
0.299549, 0.7112659, -1.02494, 0, 0.2392157, 1, 1,
0.3001588, 0.3145537, -0.9816189, 0, 0.2313726, 1, 1,
0.3003053, -0.4763869, 1.999981, 0, 0.227451, 1, 1,
0.3022543, 0.2015797, 0.917555, 0, 0.2196078, 1, 1,
0.3032255, 0.6346201, 0.9466768, 0, 0.2156863, 1, 1,
0.3047549, 0.2407723, 2.581221, 0, 0.2078431, 1, 1,
0.310218, 0.2674652, 1.072521, 0, 0.2039216, 1, 1,
0.3104045, -0.136349, 3.564949, 0, 0.1960784, 1, 1,
0.3133354, -0.04109617, 3.881423, 0, 0.1882353, 1, 1,
0.320123, 1.39968, -0.3648586, 0, 0.1843137, 1, 1,
0.3202181, 0.1662109, 1.46209, 0, 0.1764706, 1, 1,
0.3240658, -1.173645, 2.143212, 0, 0.172549, 1, 1,
0.3291897, -1.235103, 1.915052, 0, 0.1647059, 1, 1,
0.3304063, -1.288845, 2.672331, 0, 0.1607843, 1, 1,
0.3338313, 1.382161, 1.250717, 0, 0.1529412, 1, 1,
0.3353029, 0.4477411, 1.303041, 0, 0.1490196, 1, 1,
0.3355904, 0.8903297, -1.665673, 0, 0.1411765, 1, 1,
0.3370181, -1.979017, 3.014807, 0, 0.1372549, 1, 1,
0.3420041, 0.05341304, 1.66435, 0, 0.1294118, 1, 1,
0.3487215, 0.09018906, 0.4838022, 0, 0.1254902, 1, 1,
0.3504775, 0.485054, 1.020136, 0, 0.1176471, 1, 1,
0.3521421, 1.331202, 1.103574, 0, 0.1137255, 1, 1,
0.3547596, -1.035061, 1.263152, 0, 0.1058824, 1, 1,
0.3617682, -0.2500513, 3.81466, 0, 0.09803922, 1, 1,
0.3629822, -0.1051579, 1.784945, 0, 0.09411765, 1, 1,
0.3635432, 0.2018903, 1.659225, 0, 0.08627451, 1, 1,
0.3690001, -0.5910233, 2.396678, 0, 0.08235294, 1, 1,
0.3722963, 0.2130859, 1.633589, 0, 0.07450981, 1, 1,
0.3727033, -0.5116907, 1.284926, 0, 0.07058824, 1, 1,
0.3771782, -0.1107943, 2.751369, 0, 0.0627451, 1, 1,
0.3830805, 1.158497, 2.132558, 0, 0.05882353, 1, 1,
0.3849204, -1.5402, 1.794994, 0, 0.05098039, 1, 1,
0.3896939, 1.190956, 0.2405008, 0, 0.04705882, 1, 1,
0.3913316, 0.9724994, -0.3473565, 0, 0.03921569, 1, 1,
0.3919251, -0.7927396, 1.908412, 0, 0.03529412, 1, 1,
0.3932061, 0.3927613, 1.22573, 0, 0.02745098, 1, 1,
0.4000218, 2.453178, 0.7877845, 0, 0.02352941, 1, 1,
0.405946, -0.9201801, 4.709288, 0, 0.01568628, 1, 1,
0.4075947, -1.314616, 3.925317, 0, 0.01176471, 1, 1,
0.409724, -0.7525581, 1.758515, 0, 0.003921569, 1, 1,
0.4097295, 0.2397212, 0.1038266, 0.003921569, 0, 1, 1,
0.4134358, 0.6185561, 2.288546, 0.007843138, 0, 1, 1,
0.4214726, 0.6496328, 1.778537, 0.01568628, 0, 1, 1,
0.4247193, -1.584895, 2.170584, 0.01960784, 0, 1, 1,
0.4250861, 0.7289852, 2.39025, 0.02745098, 0, 1, 1,
0.4271696, -0.1725735, 1.939698, 0.03137255, 0, 1, 1,
0.4297794, 1.853123, 0.1690438, 0.03921569, 0, 1, 1,
0.4319546, -0.7451091, 3.253266, 0.04313726, 0, 1, 1,
0.4345491, 0.1592984, 0.8436086, 0.05098039, 0, 1, 1,
0.4361404, -1.818018, 2.886645, 0.05490196, 0, 1, 1,
0.436462, 0.4089714, 2.511044, 0.0627451, 0, 1, 1,
0.4384468, -0.08172573, 0.5075388, 0.06666667, 0, 1, 1,
0.438719, -0.3211031, 1.363137, 0.07450981, 0, 1, 1,
0.441474, 1.177505, 1.361183, 0.07843138, 0, 1, 1,
0.4452762, -0.8639117, 2.83267, 0.08627451, 0, 1, 1,
0.4499493, -1.889901, 2.93554, 0.09019608, 0, 1, 1,
0.4566328, -1.624153, 1.523678, 0.09803922, 0, 1, 1,
0.4603336, -1.190068, 1.072378, 0.1058824, 0, 1, 1,
0.4633792, -0.1581226, 1.954776, 0.1098039, 0, 1, 1,
0.4657958, 0.4959487, 0.2164325, 0.1176471, 0, 1, 1,
0.4663614, 0.1554497, 0.8308259, 0.1215686, 0, 1, 1,
0.4679686, -0.4741298, 1.140136, 0.1294118, 0, 1, 1,
0.4764715, -1.738275, 2.866668, 0.1333333, 0, 1, 1,
0.4845715, 0.3466418, 0.2464364, 0.1411765, 0, 1, 1,
0.4875314, 0.1642248, -0.1407541, 0.145098, 0, 1, 1,
0.4888369, 0.3427679, 2.74424, 0.1529412, 0, 1, 1,
0.4914244, -0.2413404, 2.020335, 0.1568628, 0, 1, 1,
0.4969044, -0.7813576, 2.460379, 0.1647059, 0, 1, 1,
0.4983601, 0.3252887, 1.133665, 0.1686275, 0, 1, 1,
0.4984793, 0.5564215, -0.03400449, 0.1764706, 0, 1, 1,
0.4992985, -0.767803, 2.237202, 0.1803922, 0, 1, 1,
0.4998807, 0.9443074, 0.9852896, 0.1882353, 0, 1, 1,
0.5037841, -2.008098, 4.352047, 0.1921569, 0, 1, 1,
0.5069959, 2.04929, 0.8655517, 0.2, 0, 1, 1,
0.5077674, 0.9226457, 1.493271, 0.2078431, 0, 1, 1,
0.5093332, 0.4036716, -1.040458, 0.2117647, 0, 1, 1,
0.5099442, 0.3725266, -0.4175279, 0.2196078, 0, 1, 1,
0.513671, 1.427308, 1.572511, 0.2235294, 0, 1, 1,
0.5179012, -0.7142065, 2.492716, 0.2313726, 0, 1, 1,
0.518981, 1.053519, 0.5789995, 0.2352941, 0, 1, 1,
0.5207886, -0.6731803, 3.942403, 0.2431373, 0, 1, 1,
0.524034, 1.090688, -0.5561944, 0.2470588, 0, 1, 1,
0.5244065, 1.245899, 0.5042106, 0.254902, 0, 1, 1,
0.5249192, -1.647562, 3.655107, 0.2588235, 0, 1, 1,
0.5272307, -0.70378, 1.831042, 0.2666667, 0, 1, 1,
0.5274271, -1.924018, 2.829398, 0.2705882, 0, 1, 1,
0.5302907, -0.01790603, 2.052221, 0.2784314, 0, 1, 1,
0.5324195, 0.9861166, 1.555421, 0.282353, 0, 1, 1,
0.5338737, 0.1165513, 2.253112, 0.2901961, 0, 1, 1,
0.5478235, 0.4202783, 2.068876, 0.2941177, 0, 1, 1,
0.5478696, -0.5023726, 1.552467, 0.3019608, 0, 1, 1,
0.549379, 1.685473, -0.4288287, 0.3098039, 0, 1, 1,
0.5498774, 0.8052802, -1.402884, 0.3137255, 0, 1, 1,
0.5502183, -1.317633, 2.034746, 0.3215686, 0, 1, 1,
0.556159, -0.773457, 2.383607, 0.3254902, 0, 1, 1,
0.5611376, 1.02493, 1.313085, 0.3333333, 0, 1, 1,
0.563747, 0.2544501, 1.061331, 0.3372549, 0, 1, 1,
0.5654926, 0.03095975, 2.212013, 0.345098, 0, 1, 1,
0.5658813, -0.6485747, 2.97358, 0.3490196, 0, 1, 1,
0.5721451, 2.767205, -0.0008056731, 0.3568628, 0, 1, 1,
0.5734762, -0.7156267, 4.546695, 0.3607843, 0, 1, 1,
0.5765725, -0.1153055, 1.185333, 0.3686275, 0, 1, 1,
0.5772952, 0.2939599, 0.9278401, 0.372549, 0, 1, 1,
0.5809229, 2.139956, 0.7232974, 0.3803922, 0, 1, 1,
0.582104, -1.543732, 3.76274, 0.3843137, 0, 1, 1,
0.5829642, -0.9442192, 2.878931, 0.3921569, 0, 1, 1,
0.5841089, 0.4788679, 0.4510277, 0.3960784, 0, 1, 1,
0.5889498, 1.362004, 0.2848801, 0.4039216, 0, 1, 1,
0.5927134, 0.6397758, 1.713178, 0.4117647, 0, 1, 1,
0.6065285, -0.6971758, 2.414394, 0.4156863, 0, 1, 1,
0.6108506, 0.4384573, 0.7359973, 0.4235294, 0, 1, 1,
0.6115613, -1.432868, 2.964563, 0.427451, 0, 1, 1,
0.6122549, -0.4903911, 2.766105, 0.4352941, 0, 1, 1,
0.6148183, -0.4054929, 2.394963, 0.4392157, 0, 1, 1,
0.6158872, 0.7692369, 0.8152863, 0.4470588, 0, 1, 1,
0.6178568, -1.031474, 3.172484, 0.4509804, 0, 1, 1,
0.6208103, 0.5294294, 0.5002277, 0.4588235, 0, 1, 1,
0.6235061, 1.762908, 0.1663328, 0.4627451, 0, 1, 1,
0.6247994, -0.8006116, 2.499842, 0.4705882, 0, 1, 1,
0.62707, 1.710134, 0.3444257, 0.4745098, 0, 1, 1,
0.6270777, -0.3828499, 2.163135, 0.4823529, 0, 1, 1,
0.6308437, -0.6530593, 2.203114, 0.4862745, 0, 1, 1,
0.634509, 0.6244797, 1.244192, 0.4941176, 0, 1, 1,
0.6387537, -1.015136, 1.496827, 0.5019608, 0, 1, 1,
0.6423911, -0.3177053, 0.8875417, 0.5058824, 0, 1, 1,
0.6493449, 0.5575572, 1.004522, 0.5137255, 0, 1, 1,
0.6523122, 0.03616775, 1.877569, 0.5176471, 0, 1, 1,
0.6547273, 0.869267, -0.1359246, 0.5254902, 0, 1, 1,
0.6577812, 1.469386, -1.537692, 0.5294118, 0, 1, 1,
0.6590943, -0.7544858, 3.721386, 0.5372549, 0, 1, 1,
0.6599506, 0.2504807, 0.6173243, 0.5411765, 0, 1, 1,
0.6631044, -2.197624, 2.494401, 0.5490196, 0, 1, 1,
0.6697796, 0.2675668, 1.480654, 0.5529412, 0, 1, 1,
0.6763263, 0.2579541, 1.069454, 0.5607843, 0, 1, 1,
0.6765825, 1.1049, 1.055061, 0.5647059, 0, 1, 1,
0.6781482, -0.8315813, 1.165622, 0.572549, 0, 1, 1,
0.6798239, 0.444148, 1.430921, 0.5764706, 0, 1, 1,
0.6804595, -2.070208, 2.795618, 0.5843138, 0, 1, 1,
0.6818892, 0.5400788, 1.138577, 0.5882353, 0, 1, 1,
0.6915342, 0.708991, -0.1469204, 0.5960785, 0, 1, 1,
0.6924878, 0.3109807, 1.292763, 0.6039216, 0, 1, 1,
0.6962129, 0.1426066, 2.240121, 0.6078432, 0, 1, 1,
0.7013554, 1.97099, 0.5539417, 0.6156863, 0, 1, 1,
0.7018549, -0.7259032, 3.834406, 0.6196079, 0, 1, 1,
0.7054447, 0.036748, 0.6059271, 0.627451, 0, 1, 1,
0.7057284, 1.528068, -1.269685, 0.6313726, 0, 1, 1,
0.7087356, 0.5226601, 2.235419, 0.6392157, 0, 1, 1,
0.7119648, 1.824754, -0.2921887, 0.6431373, 0, 1, 1,
0.7156357, -0.3392266, 1.31923, 0.6509804, 0, 1, 1,
0.71569, -1.071169, 4.154152, 0.654902, 0, 1, 1,
0.7183139, -2.062039, 3.789225, 0.6627451, 0, 1, 1,
0.7183993, -1.787578, 2.867482, 0.6666667, 0, 1, 1,
0.7197803, 0.3987804, 2.456256, 0.6745098, 0, 1, 1,
0.720311, -0.3292539, 1.880154, 0.6784314, 0, 1, 1,
0.7256506, 0.04972348, 3.087258, 0.6862745, 0, 1, 1,
0.7269819, 0.2603904, 1.381278, 0.6901961, 0, 1, 1,
0.7287604, 2.294367, 0.9089263, 0.6980392, 0, 1, 1,
0.7287894, -0.7775158, 4.370043, 0.7058824, 0, 1, 1,
0.7361224, 0.3580781, 1.597114, 0.7098039, 0, 1, 1,
0.73623, -2.127771, 3.665596, 0.7176471, 0, 1, 1,
0.737819, 0.7238543, 3.031954, 0.7215686, 0, 1, 1,
0.7394754, -1.296364, 2.792939, 0.7294118, 0, 1, 1,
0.7505944, 0.2018568, 2.284196, 0.7333333, 0, 1, 1,
0.7516988, -1.504218, 2.112692, 0.7411765, 0, 1, 1,
0.7525823, -0.2130557, 0.5648869, 0.7450981, 0, 1, 1,
0.7608082, 0.621721, 0.3026201, 0.7529412, 0, 1, 1,
0.7616902, 1.034354, 1.192199, 0.7568628, 0, 1, 1,
0.7631992, -2.289833, 1.990184, 0.7647059, 0, 1, 1,
0.7662923, -0.7365586, 2.235995, 0.7686275, 0, 1, 1,
0.7674734, -0.2720239, 2.775512, 0.7764706, 0, 1, 1,
0.7708963, 0.06172472, 3.495564, 0.7803922, 0, 1, 1,
0.7743189, 1.146429, 1.692155, 0.7882353, 0, 1, 1,
0.7773359, -1.28489, 3.647729, 0.7921569, 0, 1, 1,
0.7813622, -0.09199056, 3.130524, 0.8, 0, 1, 1,
0.7846541, 1.532466, 0.8609456, 0.8078431, 0, 1, 1,
0.7888504, 0.8214203, 0.1838762, 0.8117647, 0, 1, 1,
0.7926632, 1.269966, -1.186629, 0.8196079, 0, 1, 1,
0.8017003, 0.8022749, 1.152579, 0.8235294, 0, 1, 1,
0.8052552, 0.09956163, 1.29086, 0.8313726, 0, 1, 1,
0.8067452, -0.6890495, 2.500894, 0.8352941, 0, 1, 1,
0.8137335, 0.3165442, 1.533265, 0.8431373, 0, 1, 1,
0.8204991, -0.2133157, 2.993136, 0.8470588, 0, 1, 1,
0.8235091, -1.430438, 1.777987, 0.854902, 0, 1, 1,
0.8336665, -0.342819, 1.858554, 0.8588235, 0, 1, 1,
0.8337326, 0.456352, 3.259214, 0.8666667, 0, 1, 1,
0.8360891, 0.1181892, 3.129888, 0.8705882, 0, 1, 1,
0.8422543, 0.2472214, -1.246117, 0.8784314, 0, 1, 1,
0.8456675, 0.8008015, 1.585055, 0.8823529, 0, 1, 1,
0.8458858, 0.7067399, 0.6917815, 0.8901961, 0, 1, 1,
0.8488548, -0.5604269, 1.375977, 0.8941177, 0, 1, 1,
0.8628716, 2.013058, 1.451867, 0.9019608, 0, 1, 1,
0.8651013, -0.2799748, 2.235996, 0.9098039, 0, 1, 1,
0.8690367, 0.2079318, 1.978703, 0.9137255, 0, 1, 1,
0.8762159, 0.01048384, 2.40985, 0.9215686, 0, 1, 1,
0.8764078, -0.4733602, 3.031401, 0.9254902, 0, 1, 1,
0.882563, -0.8850121, 1.732135, 0.9333333, 0, 1, 1,
0.8831779, 1.747456, 0.6176102, 0.9372549, 0, 1, 1,
0.8846893, -0.8445764, 3.803412, 0.945098, 0, 1, 1,
0.8929735, 0.3494093, 3.336566, 0.9490196, 0, 1, 1,
0.8973595, 0.2117139, -0.3250734, 0.9568627, 0, 1, 1,
0.9070696, -0.2283855, 0.3734983, 0.9607843, 0, 1, 1,
0.9186874, 0.5836724, 0.4791552, 0.9686275, 0, 1, 1,
0.9271683, -0.6135558, 1.221291, 0.972549, 0, 1, 1,
0.9274396, -0.4861856, 2.14006, 0.9803922, 0, 1, 1,
0.9370546, -2.247409, 2.293925, 0.9843137, 0, 1, 1,
0.9388415, -0.4254547, 4.400723, 0.9921569, 0, 1, 1,
0.9406486, 1.923803, 1.51064, 0.9960784, 0, 1, 1,
0.9419594, -0.8637414, 0.9137409, 1, 0, 0.9960784, 1,
0.9509336, -0.1047261, 2.382603, 1, 0, 0.9882353, 1,
0.952951, 2.684521, 1.123166, 1, 0, 0.9843137, 1,
0.9537143, -0.5786725, 3.854915, 1, 0, 0.9764706, 1,
0.9555843, -0.5438643, 2.861766, 1, 0, 0.972549, 1,
0.9567353, -0.9058884, 2.759199, 1, 0, 0.9647059, 1,
0.9682565, -0.1478236, 0.5431067, 1, 0, 0.9607843, 1,
0.9702691, 1.419927, 0.1293942, 1, 0, 0.9529412, 1,
0.97311, 0.3151121, -0.7009207, 1, 0, 0.9490196, 1,
0.9747939, 0.775445, 0.8521259, 1, 0, 0.9411765, 1,
0.9755409, -1.369781, 1.606285, 1, 0, 0.9372549, 1,
0.9892337, -1.63655, 2.150448, 1, 0, 0.9294118, 1,
0.9974418, -0.6749365, 3.696488, 1, 0, 0.9254902, 1,
0.9974571, 1.357635, 1.751392, 1, 0, 0.9176471, 1,
1.002358, 1.658768, 1.794272, 1, 0, 0.9137255, 1,
1.00255, -0.05671799, 0.9341062, 1, 0, 0.9058824, 1,
1.003536, -1.186802, 2.974118, 1, 0, 0.9019608, 1,
1.008966, -0.7230898, 2.15811, 1, 0, 0.8941177, 1,
1.019946, 0.9480688, -0.2993774, 1, 0, 0.8862745, 1,
1.020744, 0.2952672, 1.478999, 1, 0, 0.8823529, 1,
1.02078, 1.629889, 0.01473771, 1, 0, 0.8745098, 1,
1.020995, -0.6892444, 2.179229, 1, 0, 0.8705882, 1,
1.023019, 0.07851952, -0.1364876, 1, 0, 0.8627451, 1,
1.023842, -0.1083448, 2.130311, 1, 0, 0.8588235, 1,
1.027034, -0.9927489, 2.239326, 1, 0, 0.8509804, 1,
1.028615, -1.381947, 0.7818418, 1, 0, 0.8470588, 1,
1.04058, -1.556503, 3.889884, 1, 0, 0.8392157, 1,
1.046806, 0.9462019, 0.1293469, 1, 0, 0.8352941, 1,
1.05023, 1.071124, 0.582092, 1, 0, 0.827451, 1,
1.057826, 1.095404, 0.5960155, 1, 0, 0.8235294, 1,
1.063806, -0.4650174, 1.712644, 1, 0, 0.8156863, 1,
1.066402, 1.695927, 0.1361971, 1, 0, 0.8117647, 1,
1.07083, 0.5095819, 1.051217, 1, 0, 0.8039216, 1,
1.08162, 0.3880914, 0.3206503, 1, 0, 0.7960784, 1,
1.086796, -0.8284578, 0.4977363, 1, 0, 0.7921569, 1,
1.090822, -0.8288448, 0.9802565, 1, 0, 0.7843137, 1,
1.091043, 0.04564174, 1.392359, 1, 0, 0.7803922, 1,
1.092569, -0.05858237, 3.319436, 1, 0, 0.772549, 1,
1.094199, -0.1815767, 1.435396, 1, 0, 0.7686275, 1,
1.103876, -0.1334534, 2.555475, 1, 0, 0.7607843, 1,
1.109333, -0.5577773, 2.765118, 1, 0, 0.7568628, 1,
1.113562, 2.205781, 1.114533, 1, 0, 0.7490196, 1,
1.116755, -0.03008936, 0.2740631, 1, 0, 0.7450981, 1,
1.123753, 0.6869439, 2.80964, 1, 0, 0.7372549, 1,
1.124161, 0.6661596, 1.30915, 1, 0, 0.7333333, 1,
1.12524, -1.534935, 2.595335, 1, 0, 0.7254902, 1,
1.130669, 0.9774036, -0.4653935, 1, 0, 0.7215686, 1,
1.138824, -0.4846699, 2.015083, 1, 0, 0.7137255, 1,
1.144194, 1.074374, 1.501299, 1, 0, 0.7098039, 1,
1.145607, -0.2793062, 1.758066, 1, 0, 0.7019608, 1,
1.150718, -0.2946688, 3.776895, 1, 0, 0.6941177, 1,
1.154831, -1.639319, 2.142333, 1, 0, 0.6901961, 1,
1.162736, -0.5683355, 0.8101502, 1, 0, 0.682353, 1,
1.168613, 1.211547, -0.2566878, 1, 0, 0.6784314, 1,
1.17452, 2.607178, 0.04674015, 1, 0, 0.6705883, 1,
1.180617, 1.179635, 0.8337495, 1, 0, 0.6666667, 1,
1.183733, 0.6662979, 0.03670126, 1, 0, 0.6588235, 1,
1.190753, 0.603063, 1.892136, 1, 0, 0.654902, 1,
1.207773, -0.5261032, 2.308057, 1, 0, 0.6470588, 1,
1.230107, -0.7477376, 0.765268, 1, 0, 0.6431373, 1,
1.230957, -0.7597317, 3.702811, 1, 0, 0.6352941, 1,
1.232364, -0.6327583, 2.797196, 1, 0, 0.6313726, 1,
1.241326, -1.080986, 1.508025, 1, 0, 0.6235294, 1,
1.246432, 0.5278938, -0.390972, 1, 0, 0.6196079, 1,
1.2586, -0.1965237, 3.461022, 1, 0, 0.6117647, 1,
1.258716, 1.579535, 2.090835, 1, 0, 0.6078432, 1,
1.262074, -1.234497, 1.81951, 1, 0, 0.6, 1,
1.269613, 0.6279815, 1.615848, 1, 0, 0.5921569, 1,
1.273615, -0.3682695, 0.2738517, 1, 0, 0.5882353, 1,
1.274886, 0.6442437, 0.5295072, 1, 0, 0.5803922, 1,
1.278834, 2.230442, 0.336123, 1, 0, 0.5764706, 1,
1.280059, -0.2199045, 1.375521, 1, 0, 0.5686275, 1,
1.288737, 0.1373892, 0.458867, 1, 0, 0.5647059, 1,
1.289082, 0.24192, 2.016106, 1, 0, 0.5568628, 1,
1.307441, 0.04772397, 3.036239, 1, 0, 0.5529412, 1,
1.308638, 1.061568, 1.915248, 1, 0, 0.5450981, 1,
1.314233, -0.2650977, 0.9298224, 1, 0, 0.5411765, 1,
1.320548, -1.229567, 2.688423, 1, 0, 0.5333334, 1,
1.322901, 1.363527, 0.9917357, 1, 0, 0.5294118, 1,
1.323565, -0.8373931, 2.993683, 1, 0, 0.5215687, 1,
1.324642, -0.2068863, 2.626068, 1, 0, 0.5176471, 1,
1.324801, -0.2406095, 0.3417102, 1, 0, 0.509804, 1,
1.331309, -1.439181, 3.982843, 1, 0, 0.5058824, 1,
1.341166, -0.5890814, 1.587569, 1, 0, 0.4980392, 1,
1.354255, 1.149528, 1.55533, 1, 0, 0.4901961, 1,
1.354303, 0.642441, 1.582592, 1, 0, 0.4862745, 1,
1.35697, 1.628256, 0.4419898, 1, 0, 0.4784314, 1,
1.368346, 0.7541413, 0.2561033, 1, 0, 0.4745098, 1,
1.379619, 1.903806, 2.760653, 1, 0, 0.4666667, 1,
1.381648, 0.4676706, 0.2397902, 1, 0, 0.4627451, 1,
1.386169, -0.979664, 1.049559, 1, 0, 0.454902, 1,
1.388961, -0.1506102, 1.004767, 1, 0, 0.4509804, 1,
1.400793, 1.624842, -0.6747732, 1, 0, 0.4431373, 1,
1.40795, 0.6709815, 1.285459, 1, 0, 0.4392157, 1,
1.429522, -0.520583, -0.2445243, 1, 0, 0.4313726, 1,
1.431304, -2.074192, 3.729939, 1, 0, 0.427451, 1,
1.432363, -0.1251888, 2.213477, 1, 0, 0.4196078, 1,
1.452509, -1.887286, 1.592832, 1, 0, 0.4156863, 1,
1.475546, 1.152777, 0.01185681, 1, 0, 0.4078431, 1,
1.490232, 1.586741, 1.668603, 1, 0, 0.4039216, 1,
1.50289, 0.06540944, 1.946726, 1, 0, 0.3960784, 1,
1.535756, 1.076887, 1.203198, 1, 0, 0.3882353, 1,
1.540066, -1.126643, 1.178739, 1, 0, 0.3843137, 1,
1.557003, -2.386843, 2.082126, 1, 0, 0.3764706, 1,
1.570103, 0.1967436, 2.475311, 1, 0, 0.372549, 1,
1.583525, 0.1131052, 2.891012, 1, 0, 0.3647059, 1,
1.592714, -0.3359881, 2.135972, 1, 0, 0.3607843, 1,
1.608937, -0.7804025, 1.105694, 1, 0, 0.3529412, 1,
1.62775, 2.003599, 0.7660221, 1, 0, 0.3490196, 1,
1.638652, -2.199301, 1.399204, 1, 0, 0.3411765, 1,
1.645454, -0.2981152, 0.9626137, 1, 0, 0.3372549, 1,
1.654203, -0.5508748, 2.395733, 1, 0, 0.3294118, 1,
1.680957, -0.1805185, 2.733354, 1, 0, 0.3254902, 1,
1.694406, 1.396703, 1.083414, 1, 0, 0.3176471, 1,
1.696417, 0.380176, 0.9697667, 1, 0, 0.3137255, 1,
1.697878, -0.2550085, 1.90031, 1, 0, 0.3058824, 1,
1.726192, -2.459464, 2.488848, 1, 0, 0.2980392, 1,
1.733698, 1.729394, -1.003875, 1, 0, 0.2941177, 1,
1.746827, -0.6507308, 1.244206, 1, 0, 0.2862745, 1,
1.755398, 1.838075, -1.150439, 1, 0, 0.282353, 1,
1.756805, 0.5895452, 0.9706532, 1, 0, 0.2745098, 1,
1.758565, -1.483759, 2.372543, 1, 0, 0.2705882, 1,
1.775523, -0.249994, 1.856822, 1, 0, 0.2627451, 1,
1.776312, 0.7033426, 2.818094, 1, 0, 0.2588235, 1,
1.790925, -1.070747, 1.623195, 1, 0, 0.2509804, 1,
1.792956, 0.02992811, -0.1527274, 1, 0, 0.2470588, 1,
1.798897, -0.6045588, 3.419482, 1, 0, 0.2392157, 1,
1.825914, 0.4326853, 1.427004, 1, 0, 0.2352941, 1,
1.863953, 0.4295847, 1.292353, 1, 0, 0.227451, 1,
1.868719, -1.09277, 2.091721, 1, 0, 0.2235294, 1,
1.874069, 0.02358334, 0.6984127, 1, 0, 0.2156863, 1,
1.878167, -0.9277772, 2.210198, 1, 0, 0.2117647, 1,
1.90333, -0.4687765, 1.860922, 1, 0, 0.2039216, 1,
1.923776, -1.459853, 4.347588, 1, 0, 0.1960784, 1,
1.929064, -1.790304, 2.137399, 1, 0, 0.1921569, 1,
1.931944, 0.7961538, 0.8484613, 1, 0, 0.1843137, 1,
1.938786, 1.026238, 2.399448, 1, 0, 0.1803922, 1,
1.947245, 0.2705011, 2.875812, 1, 0, 0.172549, 1,
1.966713, 1.124953, -0.2074566, 1, 0, 0.1686275, 1,
1.976256, 1.493828, 2.088987, 1, 0, 0.1607843, 1,
1.988371, 1.422265, 1.39922, 1, 0, 0.1568628, 1,
2.085055, 0.03002033, 1.136488, 1, 0, 0.1490196, 1,
2.101789, -2.108889, 0.3419102, 1, 0, 0.145098, 1,
2.13427, 1.078055, 2.690538, 1, 0, 0.1372549, 1,
2.168139, 0.2299098, 0.9158928, 1, 0, 0.1333333, 1,
2.169259, 1.08246, 0.4657178, 1, 0, 0.1254902, 1,
2.180932, 0.7853042, 0.4503225, 1, 0, 0.1215686, 1,
2.181443, 0.1247782, 3.091092, 1, 0, 0.1137255, 1,
2.202424, -0.032732, 1.510654, 1, 0, 0.1098039, 1,
2.235129, -0.03901984, 1.185929, 1, 0, 0.1019608, 1,
2.277949, 0.5705423, 2.422287, 1, 0, 0.09411765, 1,
2.278605, 0.276627, 1.779777, 1, 0, 0.09019608, 1,
2.335727, -1.54884, 1.562763, 1, 0, 0.08235294, 1,
2.350994, -1.099779, 2.449487, 1, 0, 0.07843138, 1,
2.354732, 0.7534758, 0.5878257, 1, 0, 0.07058824, 1,
2.367429, 0.1342941, 2.354098, 1, 0, 0.06666667, 1,
2.407217, -0.8618689, 1.9527, 1, 0, 0.05882353, 1,
2.622808, -0.1026392, 1.335853, 1, 0, 0.05490196, 1,
2.645787, -0.1923288, 1.546367, 1, 0, 0.04705882, 1,
2.72452, -0.5642633, -0.355627, 1, 0, 0.04313726, 1,
2.77256, 0.820695, 2.511803, 1, 0, 0.03529412, 1,
2.86742, -1.567513, 0.3959716, 1, 0, 0.03137255, 1,
3.146512, 0.3080092, 1.000218, 1, 0, 0.02352941, 1,
3.280285, -1.552214, 3.41737, 1, 0, 0.01960784, 1,
3.355317, 0.4189309, 1.439936, 1, 0, 0.01176471, 1,
3.774977, 1.429581, 1.742317, 1, 0, 0.007843138, 1
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
0.3136683, -3.826579, -7.103808, 0, -0.5, 0.5, 0.5,
0.3136683, -3.826579, -7.103808, 1, -0.5, 0.5, 0.5,
0.3136683, -3.826579, -7.103808, 1, 1.5, 0.5, 0.5,
0.3136683, -3.826579, -7.103808, 0, 1.5, 0.5, 0.5
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
-4.321024, 0.1769342, -7.103808, 0, -0.5, 0.5, 0.5,
-4.321024, 0.1769342, -7.103808, 1, -0.5, 0.5, 0.5,
-4.321024, 0.1769342, -7.103808, 1, 1.5, 0.5, 0.5,
-4.321024, 0.1769342, -7.103808, 0, 1.5, 0.5, 0.5
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
-4.321024, -3.826579, -0.1701705, 0, -0.5, 0.5, 0.5,
-4.321024, -3.826579, -0.1701705, 1, -0.5, 0.5, 0.5,
-4.321024, -3.826579, -0.1701705, 1, 1.5, 0.5, 0.5,
-4.321024, -3.826579, -0.1701705, 0, 1.5, 0.5, 0.5
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
-3, -2.902691, -5.503737,
3, -2.902691, -5.503737,
-3, -2.902691, -5.503737,
-3, -3.056673, -5.770416,
-2, -2.902691, -5.503737,
-2, -3.056673, -5.770416,
-1, -2.902691, -5.503737,
-1, -3.056673, -5.770416,
0, -2.902691, -5.503737,
0, -3.056673, -5.770416,
1, -2.902691, -5.503737,
1, -3.056673, -5.770416,
2, -2.902691, -5.503737,
2, -3.056673, -5.770416,
3, -2.902691, -5.503737,
3, -3.056673, -5.770416
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
-3, -3.364635, -6.303773, 0, -0.5, 0.5, 0.5,
-3, -3.364635, -6.303773, 1, -0.5, 0.5, 0.5,
-3, -3.364635, -6.303773, 1, 1.5, 0.5, 0.5,
-3, -3.364635, -6.303773, 0, 1.5, 0.5, 0.5,
-2, -3.364635, -6.303773, 0, -0.5, 0.5, 0.5,
-2, -3.364635, -6.303773, 1, -0.5, 0.5, 0.5,
-2, -3.364635, -6.303773, 1, 1.5, 0.5, 0.5,
-2, -3.364635, -6.303773, 0, 1.5, 0.5, 0.5,
-1, -3.364635, -6.303773, 0, -0.5, 0.5, 0.5,
-1, -3.364635, -6.303773, 1, -0.5, 0.5, 0.5,
-1, -3.364635, -6.303773, 1, 1.5, 0.5, 0.5,
-1, -3.364635, -6.303773, 0, 1.5, 0.5, 0.5,
0, -3.364635, -6.303773, 0, -0.5, 0.5, 0.5,
0, -3.364635, -6.303773, 1, -0.5, 0.5, 0.5,
0, -3.364635, -6.303773, 1, 1.5, 0.5, 0.5,
0, -3.364635, -6.303773, 0, 1.5, 0.5, 0.5,
1, -3.364635, -6.303773, 0, -0.5, 0.5, 0.5,
1, -3.364635, -6.303773, 1, -0.5, 0.5, 0.5,
1, -3.364635, -6.303773, 1, 1.5, 0.5, 0.5,
1, -3.364635, -6.303773, 0, 1.5, 0.5, 0.5,
2, -3.364635, -6.303773, 0, -0.5, 0.5, 0.5,
2, -3.364635, -6.303773, 1, -0.5, 0.5, 0.5,
2, -3.364635, -6.303773, 1, 1.5, 0.5, 0.5,
2, -3.364635, -6.303773, 0, 1.5, 0.5, 0.5,
3, -3.364635, -6.303773, 0, -0.5, 0.5, 0.5,
3, -3.364635, -6.303773, 1, -0.5, 0.5, 0.5,
3, -3.364635, -6.303773, 1, 1.5, 0.5, 0.5,
3, -3.364635, -6.303773, 0, 1.5, 0.5, 0.5
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
-3.25148, -2, -5.503737,
-3.25148, 3, -5.503737,
-3.25148, -2, -5.503737,
-3.429737, -2, -5.770416,
-3.25148, -1, -5.503737,
-3.429737, -1, -5.770416,
-3.25148, 0, -5.503737,
-3.429737, 0, -5.770416,
-3.25148, 1, -5.503737,
-3.429737, 1, -5.770416,
-3.25148, 2, -5.503737,
-3.429737, 2, -5.770416,
-3.25148, 3, -5.503737,
-3.429737, 3, -5.770416
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
-3.786252, -2, -6.303773, 0, -0.5, 0.5, 0.5,
-3.786252, -2, -6.303773, 1, -0.5, 0.5, 0.5,
-3.786252, -2, -6.303773, 1, 1.5, 0.5, 0.5,
-3.786252, -2, -6.303773, 0, 1.5, 0.5, 0.5,
-3.786252, -1, -6.303773, 0, -0.5, 0.5, 0.5,
-3.786252, -1, -6.303773, 1, -0.5, 0.5, 0.5,
-3.786252, -1, -6.303773, 1, 1.5, 0.5, 0.5,
-3.786252, -1, -6.303773, 0, 1.5, 0.5, 0.5,
-3.786252, 0, -6.303773, 0, -0.5, 0.5, 0.5,
-3.786252, 0, -6.303773, 1, -0.5, 0.5, 0.5,
-3.786252, 0, -6.303773, 1, 1.5, 0.5, 0.5,
-3.786252, 0, -6.303773, 0, 1.5, 0.5, 0.5,
-3.786252, 1, -6.303773, 0, -0.5, 0.5, 0.5,
-3.786252, 1, -6.303773, 1, -0.5, 0.5, 0.5,
-3.786252, 1, -6.303773, 1, 1.5, 0.5, 0.5,
-3.786252, 1, -6.303773, 0, 1.5, 0.5, 0.5,
-3.786252, 2, -6.303773, 0, -0.5, 0.5, 0.5,
-3.786252, 2, -6.303773, 1, -0.5, 0.5, 0.5,
-3.786252, 2, -6.303773, 1, 1.5, 0.5, 0.5,
-3.786252, 2, -6.303773, 0, 1.5, 0.5, 0.5,
-3.786252, 3, -6.303773, 0, -0.5, 0.5, 0.5,
-3.786252, 3, -6.303773, 1, -0.5, 0.5, 0.5,
-3.786252, 3, -6.303773, 1, 1.5, 0.5, 0.5,
-3.786252, 3, -6.303773, 0, 1.5, 0.5, 0.5
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
-3.25148, -2.902691, -4,
-3.25148, -2.902691, 4,
-3.25148, -2.902691, -4,
-3.429737, -3.056673, -4,
-3.25148, -2.902691, -2,
-3.429737, -3.056673, -2,
-3.25148, -2.902691, 0,
-3.429737, -3.056673, 0,
-3.25148, -2.902691, 2,
-3.429737, -3.056673, 2,
-3.25148, -2.902691, 4,
-3.429737, -3.056673, 4
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
-3.786252, -3.364635, -4, 0, -0.5, 0.5, 0.5,
-3.786252, -3.364635, -4, 1, -0.5, 0.5, 0.5,
-3.786252, -3.364635, -4, 1, 1.5, 0.5, 0.5,
-3.786252, -3.364635, -4, 0, 1.5, 0.5, 0.5,
-3.786252, -3.364635, -2, 0, -0.5, 0.5, 0.5,
-3.786252, -3.364635, -2, 1, -0.5, 0.5, 0.5,
-3.786252, -3.364635, -2, 1, 1.5, 0.5, 0.5,
-3.786252, -3.364635, -2, 0, 1.5, 0.5, 0.5,
-3.786252, -3.364635, 0, 0, -0.5, 0.5, 0.5,
-3.786252, -3.364635, 0, 1, -0.5, 0.5, 0.5,
-3.786252, -3.364635, 0, 1, 1.5, 0.5, 0.5,
-3.786252, -3.364635, 0, 0, 1.5, 0.5, 0.5,
-3.786252, -3.364635, 2, 0, -0.5, 0.5, 0.5,
-3.786252, -3.364635, 2, 1, -0.5, 0.5, 0.5,
-3.786252, -3.364635, 2, 1, 1.5, 0.5, 0.5,
-3.786252, -3.364635, 2, 0, 1.5, 0.5, 0.5,
-3.786252, -3.364635, 4, 0, -0.5, 0.5, 0.5,
-3.786252, -3.364635, 4, 1, -0.5, 0.5, 0.5,
-3.786252, -3.364635, 4, 1, 1.5, 0.5, 0.5,
-3.786252, -3.364635, 4, 0, 1.5, 0.5, 0.5
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
-3.25148, -2.902691, -5.503737,
-3.25148, 3.25656, -5.503737,
-3.25148, -2.902691, 5.163396,
-3.25148, 3.25656, 5.163396,
-3.25148, -2.902691, -5.503737,
-3.25148, -2.902691, 5.163396,
-3.25148, 3.25656, -5.503737,
-3.25148, 3.25656, 5.163396,
-3.25148, -2.902691, -5.503737,
3.878816, -2.902691, -5.503737,
-3.25148, -2.902691, 5.163396,
3.878816, -2.902691, 5.163396,
-3.25148, 3.25656, -5.503737,
3.878816, 3.25656, -5.503737,
-3.25148, 3.25656, 5.163396,
3.878816, 3.25656, 5.163396,
3.878816, -2.902691, -5.503737,
3.878816, 3.25656, -5.503737,
3.878816, -2.902691, 5.163396,
3.878816, 3.25656, 5.163396,
3.878816, -2.902691, -5.503737,
3.878816, -2.902691, 5.163396,
3.878816, 3.25656, -5.503737,
3.878816, 3.25656, 5.163396
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
var radius = 7.599901;
var distance = 33.81282;
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
mvMatrix.translate( -0.3136683, -0.1769342, 0.1701705 );
mvMatrix.scale( 1.152429, 1.334117, 0.7703252 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81282);
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
Dilan<-read.table("Dilan.xyz")
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
-3.147641, 0.5819817, -1.414962, 0, 0, 1, 1, 1,
-3.10832, -1.485049, -0.9585469, 1, 0, 0, 1, 1,
-2.915839, 0.3115333, -2.073814, 1, 0, 0, 1, 1,
-2.914892, 0.3047744, -1.010737, 1, 0, 0, 1, 1,
-2.872736, 0.7480924, -1.90028, 1, 0, 0, 1, 1,
-2.714861, -2.262288, -2.373899, 1, 0, 0, 1, 1,
-2.607035, 0.1647164, -1.016752, 0, 0, 0, 1, 1,
-2.578323, 0.2215385, -0.7625855, 0, 0, 0, 1, 1,
-2.534937, 2.203403, -0.5194005, 0, 0, 0, 1, 1,
-2.498281, 0.9554173, 1.294012, 0, 0, 0, 1, 1,
-2.449781, -0.3501402, -1.422222, 0, 0, 0, 1, 1,
-2.396523, -0.4093903, -1.473141, 0, 0, 0, 1, 1,
-2.329691, -0.3203209, -2.256663, 0, 0, 0, 1, 1,
-2.3085, -0.625549, -2.057856, 1, 1, 1, 1, 1,
-2.260868, 1.170972, -2.072534, 1, 1, 1, 1, 1,
-2.189341, -1.958673, -3.728296, 1, 1, 1, 1, 1,
-2.185605, 0.6791908, -0.6314201, 1, 1, 1, 1, 1,
-2.179147, 1.421276, 0.4728558, 1, 1, 1, 1, 1,
-2.13812, 1.377504, -0.5588379, 1, 1, 1, 1, 1,
-2.124334, -0.6240165, -2.419302, 1, 1, 1, 1, 1,
-2.113052, 0.1541497, -1.537509, 1, 1, 1, 1, 1,
-2.101703, -2.158754, -1.802384, 1, 1, 1, 1, 1,
-2.061402, 0.5283645, -0.6876298, 1, 1, 1, 1, 1,
-2.031074, 0.08717207, -1.58822, 1, 1, 1, 1, 1,
-2.014655, -0.1455332, -1.612462, 1, 1, 1, 1, 1,
-2.006644, 0.1290107, -0.9529628, 1, 1, 1, 1, 1,
-1.987739, 0.7862151, -1.845769, 1, 1, 1, 1, 1,
-1.986951, 0.7173218, -0.3062731, 1, 1, 1, 1, 1,
-1.946775, 1.226111, -0.3804453, 0, 0, 1, 1, 1,
-1.923321, 0.6789562, -1.826646, 1, 0, 0, 1, 1,
-1.914071, -0.1749974, -1.350227, 1, 0, 0, 1, 1,
-1.898484, -1.1916, -2.367556, 1, 0, 0, 1, 1,
-1.898164, -0.7904966, -3.641122, 1, 0, 0, 1, 1,
-1.885833, -0.2134934, -2.302618, 1, 0, 0, 1, 1,
-1.871776, -0.4409043, -2.268449, 0, 0, 0, 1, 1,
-1.858779, 0.3826869, -2.276352, 0, 0, 0, 1, 1,
-1.851121, -0.673524, -1.770512, 0, 0, 0, 1, 1,
-1.833817, 1.871991, -2.090079, 0, 0, 0, 1, 1,
-1.814416, -0.2706431, -0.9095394, 0, 0, 0, 1, 1,
-1.794001, 1.332399, -0.1988132, 0, 0, 0, 1, 1,
-1.782059, 1.255086, -2.230108, 0, 0, 0, 1, 1,
-1.77685, -0.4290767, 0.2072594, 1, 1, 1, 1, 1,
-1.769144, -0.2103956, -2.248956, 1, 1, 1, 1, 1,
-1.757109, 0.5032473, 1.167011, 1, 1, 1, 1, 1,
-1.75166, 0.2182095, -2.632846, 1, 1, 1, 1, 1,
-1.749195, 0.8531026, -1.335377, 1, 1, 1, 1, 1,
-1.747253, -1.429587, -0.7924221, 1, 1, 1, 1, 1,
-1.740069, 0.8946313, -1.716434, 1, 1, 1, 1, 1,
-1.735634, -0.03239157, -2.558108, 1, 1, 1, 1, 1,
-1.725666, 0.4433776, -2.18033, 1, 1, 1, 1, 1,
-1.723963, 0.7004918, -3.56184, 1, 1, 1, 1, 1,
-1.709722, 0.9004902, -0.6177412, 1, 1, 1, 1, 1,
-1.695251, -0.679368, -3.21787, 1, 1, 1, 1, 1,
-1.694617, -1.708518, -4.380856, 1, 1, 1, 1, 1,
-1.684026, 0.1464991, -3.035631, 1, 1, 1, 1, 1,
-1.681949, -0.9258012, 0.2379947, 1, 1, 1, 1, 1,
-1.6803, -0.9274237, -2.209318, 0, 0, 1, 1, 1,
-1.680007, -1.413108, -1.238253, 1, 0, 0, 1, 1,
-1.665465, 0.6118001, 0.9943672, 1, 0, 0, 1, 1,
-1.657077, 0.2311718, -1.921441, 1, 0, 0, 1, 1,
-1.651588, -1.316797, -1.90212, 1, 0, 0, 1, 1,
-1.645938, 0.2281875, 0.4997796, 1, 0, 0, 1, 1,
-1.645553, -1.056946, -3.319162, 0, 0, 0, 1, 1,
-1.645343, 0.66303, -2.646321, 0, 0, 0, 1, 1,
-1.621624, -0.333947, -1.66751, 0, 0, 0, 1, 1,
-1.619171, 0.70298, -1.78076, 0, 0, 0, 1, 1,
-1.61363, -1.284367, -3.012428, 0, 0, 0, 1, 1,
-1.610502, -0.4149064, -2.089385, 0, 0, 0, 1, 1,
-1.6063, 0.8337029, 1.271826, 0, 0, 0, 1, 1,
-1.593062, 1.301077, -0.9972572, 1, 1, 1, 1, 1,
-1.590686, -1.176584, -1.565978, 1, 1, 1, 1, 1,
-1.580518, -1.082939, -1.780265, 1, 1, 1, 1, 1,
-1.576528, 0.1946741, 0.2619272, 1, 1, 1, 1, 1,
-1.570235, 1.497285, -0.8750447, 1, 1, 1, 1, 1,
-1.547771, -0.1088666, -2.77887, 1, 1, 1, 1, 1,
-1.536971, -0.1057504, -2.592696, 1, 1, 1, 1, 1,
-1.536368, -1.385043, -0.3067539, 1, 1, 1, 1, 1,
-1.522923, -0.4166878, -3.065745, 1, 1, 1, 1, 1,
-1.521134, 0.8416482, 0.1631098, 1, 1, 1, 1, 1,
-1.509973, -0.4750066, -2.721862, 1, 1, 1, 1, 1,
-1.505815, 0.3144608, -2.140872, 1, 1, 1, 1, 1,
-1.501003, -0.8363578, -3.44459, 1, 1, 1, 1, 1,
-1.500596, -0.03537893, -1.779804, 1, 1, 1, 1, 1,
-1.495745, 0.1539073, -0.4673636, 1, 1, 1, 1, 1,
-1.493356, -0.311899, -0.3171323, 0, 0, 1, 1, 1,
-1.489773, 0.7117799, -2.060368, 1, 0, 0, 1, 1,
-1.484085, 1.593668, 0.04667146, 1, 0, 0, 1, 1,
-1.456074, -0.6963146, -3.397143, 1, 0, 0, 1, 1,
-1.45546, 0.5397778, -2.011661, 1, 0, 0, 1, 1,
-1.452959, -1.186561, -1.866581, 1, 0, 0, 1, 1,
-1.441431, 0.7074823, -1.761149, 0, 0, 0, 1, 1,
-1.432598, 0.4086556, -1.932827, 0, 0, 0, 1, 1,
-1.428923, 0.1431171, -1.97873, 0, 0, 0, 1, 1,
-1.418349, 0.8230979, -0.5113479, 0, 0, 0, 1, 1,
-1.40431, 0.2791082, -2.868751, 0, 0, 0, 1, 1,
-1.399961, -0.1596969, -1.057001, 0, 0, 0, 1, 1,
-1.388665, -0.521345, -3.153439, 0, 0, 0, 1, 1,
-1.351878, -1.043941, -3.245076, 1, 1, 1, 1, 1,
-1.348763, 0.7458597, 0.1685151, 1, 1, 1, 1, 1,
-1.343282, -0.06702467, -2.686528, 1, 1, 1, 1, 1,
-1.340263, -0.02123866, -3.773156, 1, 1, 1, 1, 1,
-1.332755, 2.208077, 0.2025377, 1, 1, 1, 1, 1,
-1.332314, -0.6808119, -2.743196, 1, 1, 1, 1, 1,
-1.330822, -0.7279167, -1.680441, 1, 1, 1, 1, 1,
-1.318699, -1.568808, -2.416416, 1, 1, 1, 1, 1,
-1.318215, 0.1202743, -2.372808, 1, 1, 1, 1, 1,
-1.317138, 0.5761856, -0.6232604, 1, 1, 1, 1, 1,
-1.310091, -0.4144318, -0.6789533, 1, 1, 1, 1, 1,
-1.306171, 0.225469, -0.5011986, 1, 1, 1, 1, 1,
-1.297246, -2.041424, -1.88717, 1, 1, 1, 1, 1,
-1.296636, -1.113725, -3.646919, 1, 1, 1, 1, 1,
-1.296619, 1.077634, -1.188863, 1, 1, 1, 1, 1,
-1.292038, 0.5075383, -2.112137, 0, 0, 1, 1, 1,
-1.27961, -0.1857955, -2.478335, 1, 0, 0, 1, 1,
-1.276654, -1.063431, -1.543381, 1, 0, 0, 1, 1,
-1.268465, -0.9903884, -2.197553, 1, 0, 0, 1, 1,
-1.267688, 0.8915597, -1.91948, 1, 0, 0, 1, 1,
-1.254931, 0.6625978, 0.2174474, 1, 0, 0, 1, 1,
-1.253719, 1.014075, -1.213051, 0, 0, 0, 1, 1,
-1.245694, 1.201435, -0.2514169, 0, 0, 0, 1, 1,
-1.244349, -1.43986, -3.618841, 0, 0, 0, 1, 1,
-1.244023, 0.6653807, -0.6677418, 0, 0, 0, 1, 1,
-1.242859, 0.6411924, 0.1414547, 0, 0, 0, 1, 1,
-1.237277, 0.6920299, -1.36396, 0, 0, 0, 1, 1,
-1.233579, -1.134908, -2.736955, 0, 0, 0, 1, 1,
-1.230001, 0.5449223, -0.4868313, 1, 1, 1, 1, 1,
-1.218813, -0.900593, -2.08728, 1, 1, 1, 1, 1,
-1.217438, -0.2881233, -0.3392405, 1, 1, 1, 1, 1,
-1.210235, -0.4130414, -0.5780945, 1, 1, 1, 1, 1,
-1.203194, 0.9619502, 0.7086201, 1, 1, 1, 1, 1,
-1.175708, -0.5298631, -0.7486897, 1, 1, 1, 1, 1,
-1.165293, -0.2039162, -2.187317, 1, 1, 1, 1, 1,
-1.164519, -0.2537832, -2.194482, 1, 1, 1, 1, 1,
-1.163507, 1.122233, -0.1325412, 1, 1, 1, 1, 1,
-1.162823, 0.3189443, -1.169729, 1, 1, 1, 1, 1,
-1.147503, -1.928428, -2.166356, 1, 1, 1, 1, 1,
-1.146446, 0.03470154, -0.7209601, 1, 1, 1, 1, 1,
-1.145848, 0.9686557, -0.607738, 1, 1, 1, 1, 1,
-1.145148, -0.26915, -1.819732, 1, 1, 1, 1, 1,
-1.132385, 1.475565, -1.70184, 1, 1, 1, 1, 1,
-1.127335, -1.761184, -3.972387, 0, 0, 1, 1, 1,
-1.124373, 0.4515791, -1.09969, 1, 0, 0, 1, 1,
-1.116955, -0.07950672, -0.4057629, 1, 0, 0, 1, 1,
-1.114837, 0.3226422, -2.773201, 1, 0, 0, 1, 1,
-1.11283, -0.08998913, -1.922205, 1, 0, 0, 1, 1,
-1.104779, -1.209894, -1.450985, 1, 0, 0, 1, 1,
-1.103001, -1.059055, -1.993564, 0, 0, 0, 1, 1,
-1.099205, 0.2997389, -2.92587, 0, 0, 0, 1, 1,
-1.094362, 0.8053324, 0.1825522, 0, 0, 0, 1, 1,
-1.093285, 1.172286, 1.100818, 0, 0, 0, 1, 1,
-1.083257, -0.8688099, -3.748292, 0, 0, 0, 1, 1,
-1.082008, -1.264375, -0.7751392, 0, 0, 0, 1, 1,
-1.059653, 0.4610395, -2.92608, 0, 0, 0, 1, 1,
-1.050533, -0.2846118, -2.770638, 1, 1, 1, 1, 1,
-1.048869, -1.672413, -0.4293404, 1, 1, 1, 1, 1,
-1.047585, 1.722763, -2.112912, 1, 1, 1, 1, 1,
-1.045476, -0.7621183, -1.478021, 1, 1, 1, 1, 1,
-1.044865, -0.7983879, -2.899758, 1, 1, 1, 1, 1,
-1.041601, -1.037425, -3.042915, 1, 1, 1, 1, 1,
-1.029256, -0.5898853, -2.558624, 1, 1, 1, 1, 1,
-1.027227, 0.8418968, -1.424455, 1, 1, 1, 1, 1,
-1.02546, -0.7262223, -1.625753, 1, 1, 1, 1, 1,
-1.023749, -0.4829591, -3.26295, 1, 1, 1, 1, 1,
-1.021781, 1.29958, -1.361908, 1, 1, 1, 1, 1,
-1.014723, 0.2356212, -0.1711651, 1, 1, 1, 1, 1,
-1.00657, -0.6415725, -1.946969, 1, 1, 1, 1, 1,
-1.006265, -0.2419032, -1.128341, 1, 1, 1, 1, 1,
-1.005796, 1.24432, -0.1303474, 1, 1, 1, 1, 1,
-1.004606, 0.670248, -0.8258372, 0, 0, 1, 1, 1,
-1.001952, -0.7576724, -2.044589, 1, 0, 0, 1, 1,
-0.9978921, -0.1969455, -0.4885557, 1, 0, 0, 1, 1,
-0.9906353, 0.7256299, 1.261505, 1, 0, 0, 1, 1,
-0.9892872, -0.9134516, -3.246202, 1, 0, 0, 1, 1,
-0.9886882, 1.306443, -1.580104, 1, 0, 0, 1, 1,
-0.9837299, 0.8223433, 0.07091979, 0, 0, 0, 1, 1,
-0.9801974, 0.1814288, -0.4550064, 0, 0, 0, 1, 1,
-0.9792014, 0.06655717, -1.056916, 0, 0, 0, 1, 1,
-0.9719445, 0.1915812, 0.4532555, 0, 0, 0, 1, 1,
-0.9593399, 1.509752, -0.1306755, 0, 0, 0, 1, 1,
-0.9543009, -0.2618104, -1.013478, 0, 0, 0, 1, 1,
-0.9513279, 2.485027, -0.7081967, 0, 0, 0, 1, 1,
-0.9512741, -0.7301193, -2.312101, 1, 1, 1, 1, 1,
-0.9505968, 1.968851, 0.5822645, 1, 1, 1, 1, 1,
-0.9502575, 2.359978, -1.509289, 1, 1, 1, 1, 1,
-0.9501621, -2.108239, -3.404426, 1, 1, 1, 1, 1,
-0.9479328, -0.5643169, -1.077619, 1, 1, 1, 1, 1,
-0.9470993, 0.1201321, -1.583329, 1, 1, 1, 1, 1,
-0.943758, -0.5186158, -1.769084, 1, 1, 1, 1, 1,
-0.9392954, -0.7796897, -1.075617, 1, 1, 1, 1, 1,
-0.9355924, 0.05236588, -0.2709351, 1, 1, 1, 1, 1,
-0.9344208, -0.7558346, -2.88049, 1, 1, 1, 1, 1,
-0.929722, -0.06624831, -1.499864, 1, 1, 1, 1, 1,
-0.9280462, -1.490034, -1.82433, 1, 1, 1, 1, 1,
-0.9211492, 0.3352196, -2.648009, 1, 1, 1, 1, 1,
-0.9208167, 0.8301288, -1.266868, 1, 1, 1, 1, 1,
-0.9166918, 0.6064078, -2.17222, 1, 1, 1, 1, 1,
-0.9153506, -1.068712, -2.690732, 0, 0, 1, 1, 1,
-0.913808, 0.1889101, -1.429715, 1, 0, 0, 1, 1,
-0.8991675, 0.4554207, -1.593264, 1, 0, 0, 1, 1,
-0.8968351, 0.5546587, -0.4913436, 1, 0, 0, 1, 1,
-0.8943471, 0.7876957, -1.496866, 1, 0, 0, 1, 1,
-0.8942227, -1.011287, -1.373814, 1, 0, 0, 1, 1,
-0.8865607, -1.231652, -2.920139, 0, 0, 0, 1, 1,
-0.8729395, -0.133036, -1.072893, 0, 0, 0, 1, 1,
-0.8687231, 0.4625575, 0.9475083, 0, 0, 0, 1, 1,
-0.8686215, 0.3894749, -1.06316, 0, 0, 0, 1, 1,
-0.8685198, 0.05419599, 0.3082826, 0, 0, 0, 1, 1,
-0.8645316, -0.4481398, -5.108446, 0, 0, 0, 1, 1,
-0.8620327, 1.27964, -0.5174646, 0, 0, 0, 1, 1,
-0.8603941, -0.4538221, -2.059317, 1, 1, 1, 1, 1,
-0.8586345, -0.5354165, -1.548829, 1, 1, 1, 1, 1,
-0.8570207, 1.656915, -0.7550375, 1, 1, 1, 1, 1,
-0.8547453, 0.6059524, 1.350594, 1, 1, 1, 1, 1,
-0.8511463, 0.01387491, -2.713981, 1, 1, 1, 1, 1,
-0.8483303, -0.9244579, -1.837587, 1, 1, 1, 1, 1,
-0.844819, 1.286138, -0.9376031, 1, 1, 1, 1, 1,
-0.8401197, -1.293743, -3.814378, 1, 1, 1, 1, 1,
-0.8391834, 0.4843292, -0.9555809, 1, 1, 1, 1, 1,
-0.8316356, 0.8625985, -1.809275, 1, 1, 1, 1, 1,
-0.8297616, -1.200374, -3.313121, 1, 1, 1, 1, 1,
-0.825428, -0.2541941, -2.309891, 1, 1, 1, 1, 1,
-0.8246922, -0.53684, -3.883488, 1, 1, 1, 1, 1,
-0.8217465, 1.462954, 0.7961408, 1, 1, 1, 1, 1,
-0.8174519, 1.675706, 0.4719875, 1, 1, 1, 1, 1,
-0.8143108, 0.4915664, -1.672425, 0, 0, 1, 1, 1,
-0.8084453, 0.8780759, -1.115295, 1, 0, 0, 1, 1,
-0.8025678, -1.769059, -2.999214, 1, 0, 0, 1, 1,
-0.7996583, 0.9620165, -0.05862234, 1, 0, 0, 1, 1,
-0.7923595, 2.32157, -0.2964201, 1, 0, 0, 1, 1,
-0.7915258, 0.4313954, -0.2015321, 1, 0, 0, 1, 1,
-0.7886411, 0.544477, -0.1320919, 0, 0, 0, 1, 1,
-0.7829645, -0.2851247, -1.088772, 0, 0, 0, 1, 1,
-0.7818647, 1.393799, -1.89285, 0, 0, 0, 1, 1,
-0.7797686, -0.01695969, -0.7423979, 0, 0, 0, 1, 1,
-0.7776583, -0.4191967, -3.524216, 0, 0, 0, 1, 1,
-0.7746651, -2.272506, -2.054032, 0, 0, 0, 1, 1,
-0.7711204, 1.620667, -1.535563, 0, 0, 0, 1, 1,
-0.768761, 0.5897919, -1.841864, 1, 1, 1, 1, 1,
-0.7681192, 0.2928296, -1.898163, 1, 1, 1, 1, 1,
-0.7634084, 0.2025411, -0.7808173, 1, 1, 1, 1, 1,
-0.760312, -0.8902441, -5.348391, 1, 1, 1, 1, 1,
-0.7577379, 0.06800963, -1.815235, 1, 1, 1, 1, 1,
-0.7539356, -1.464607, -2.617805, 1, 1, 1, 1, 1,
-0.7529295, -0.6139965, -2.008034, 1, 1, 1, 1, 1,
-0.7486108, -0.8261325, -3.534904, 1, 1, 1, 1, 1,
-0.7484752, -0.7132406, -3.547884, 1, 1, 1, 1, 1,
-0.7472597, 1.595895, -1.512969, 1, 1, 1, 1, 1,
-0.746794, -1.09435, -2.875906, 1, 1, 1, 1, 1,
-0.7441779, -0.4807871, -1.755032, 1, 1, 1, 1, 1,
-0.7432582, -0.5785624, -2.936703, 1, 1, 1, 1, 1,
-0.7427244, 1.038064, 0.9302803, 1, 1, 1, 1, 1,
-0.7357955, -0.6927148, -2.272535, 1, 1, 1, 1, 1,
-0.7354203, 0.489859, -0.4293582, 0, 0, 1, 1, 1,
-0.730304, 0.8868285, -0.08496757, 1, 0, 0, 1, 1,
-0.7272286, -0.1595847, -3.154705, 1, 0, 0, 1, 1,
-0.7263061, -1.382981, -2.577783, 1, 0, 0, 1, 1,
-0.7195342, 0.5304206, -1.325526, 1, 0, 0, 1, 1,
-0.7143649, 0.02706201, -1.841315, 1, 0, 0, 1, 1,
-0.7040521, 1.080572, -1.317672, 0, 0, 0, 1, 1,
-0.7005889, -0.02198756, -1.281687, 0, 0, 0, 1, 1,
-0.6987005, 0.7742814, -2.120665, 0, 0, 0, 1, 1,
-0.6950896, 1.577862, -1.592075, 0, 0, 0, 1, 1,
-0.6948559, -0.2108027, -1.827839, 0, 0, 0, 1, 1,
-0.6940503, 0.1073129, -0.1595567, 0, 0, 0, 1, 1,
-0.6897185, -0.8494209, -4.370368, 0, 0, 0, 1, 1,
-0.686725, -0.510945, -1.900317, 1, 1, 1, 1, 1,
-0.6866343, 2.321831, 1.271307, 1, 1, 1, 1, 1,
-0.6843159, 0.260987, -2.112613, 1, 1, 1, 1, 1,
-0.6725137, -0.6288385, -1.946814, 1, 1, 1, 1, 1,
-0.6593014, 0.1051127, -0.9074002, 1, 1, 1, 1, 1,
-0.6581964, -0.3588305, -2.818502, 1, 1, 1, 1, 1,
-0.6528402, 0.6833115, -0.2005361, 1, 1, 1, 1, 1,
-0.6446633, 1.410465, 1.960605, 1, 1, 1, 1, 1,
-0.6443527, -0.3472265, -2.215854, 1, 1, 1, 1, 1,
-0.6415543, 1.143697, -0.04054398, 1, 1, 1, 1, 1,
-0.6413491, 0.2936884, -0.6288376, 1, 1, 1, 1, 1,
-0.6337188, 0.7639787, -0.276801, 1, 1, 1, 1, 1,
-0.631022, 0.1859615, -3.301692, 1, 1, 1, 1, 1,
-0.6260843, -0.5077636, -1.665664, 1, 1, 1, 1, 1,
-0.6249692, -0.9623012, -2.939133, 1, 1, 1, 1, 1,
-0.6124875, -0.8848684, -3.46564, 0, 0, 1, 1, 1,
-0.6122208, -0.7496859, -3.383101, 1, 0, 0, 1, 1,
-0.6118624, -0.4527977, -2.39492, 1, 0, 0, 1, 1,
-0.6060066, 1.906777, 0.4007317, 1, 0, 0, 1, 1,
-0.604826, 0.8272187, -1.691931, 1, 0, 0, 1, 1,
-0.6039118, -0.6491712, -1.85424, 1, 0, 0, 1, 1,
-0.5977134, -2.313399, -2.224439, 0, 0, 0, 1, 1,
-0.5952574, -0.7604274, -3.338827, 0, 0, 0, 1, 1,
-0.590107, -0.1725041, -3.408556, 0, 0, 0, 1, 1,
-0.5870604, 0.8302113, 0.4369224, 0, 0, 0, 1, 1,
-0.5868239, -0.3665732, -1.357578, 0, 0, 0, 1, 1,
-0.5841194, 0.9006895, -1.502654, 0, 0, 0, 1, 1,
-0.5836527, -0.7216486, -2.767492, 0, 0, 0, 1, 1,
-0.5754012, 0.2048957, -1.306663, 1, 1, 1, 1, 1,
-0.5713152, 1.555283, 0.05960491, 1, 1, 1, 1, 1,
-0.569548, -0.08960702, -1.408309, 1, 1, 1, 1, 1,
-0.5684378, 2.017203, 0.603647, 1, 1, 1, 1, 1,
-0.5675194, 0.6188741, -1.158868, 1, 1, 1, 1, 1,
-0.5653976, 0.1513625, -2.913289, 1, 1, 1, 1, 1,
-0.5642312, -2.316846, -4.001215, 1, 1, 1, 1, 1,
-0.5636269, -1.164585, -3.486506, 1, 1, 1, 1, 1,
-0.5576012, -1.444865, -2.401703, 1, 1, 1, 1, 1,
-0.5543044, 0.5682775, -1.697661, 1, 1, 1, 1, 1,
-0.551591, -0.7362459, -1.631789, 1, 1, 1, 1, 1,
-0.5506721, -0.5265236, -2.390776, 1, 1, 1, 1, 1,
-0.5479949, -1.066855, -4.128371, 1, 1, 1, 1, 1,
-0.5459417, -2.616071, -1.489343, 1, 1, 1, 1, 1,
-0.5405591, -0.2636288, -1.074555, 1, 1, 1, 1, 1,
-0.5398644, 1.585962, 0.0228496, 0, 0, 1, 1, 1,
-0.5379782, 1.060875, -1.11639, 1, 0, 0, 1, 1,
-0.5374091, -0.02730809, -1.231275, 1, 0, 0, 1, 1,
-0.5340921, -0.03357258, -0.3446825, 1, 0, 0, 1, 1,
-0.5337162, 0.1982307, -0.7275807, 1, 0, 0, 1, 1,
-0.5262578, 0.09848297, -1.650366, 1, 0, 0, 1, 1,
-0.5245924, 0.6818112, -0.8723522, 0, 0, 0, 1, 1,
-0.518387, 0.1296813, -2.209515, 0, 0, 0, 1, 1,
-0.5070438, -1.612739, -2.136817, 0, 0, 0, 1, 1,
-0.5066037, -0.05763097, -0.130755, 0, 0, 0, 1, 1,
-0.5058011, 0.4164315, -1.039747, 0, 0, 0, 1, 1,
-0.5029396, -0.1606941, -4.069034, 0, 0, 0, 1, 1,
-0.4983232, 0.4557194, -0.150122, 0, 0, 0, 1, 1,
-0.4876147, 1.020405, -0.3333004, 1, 1, 1, 1, 1,
-0.4858693, -0.02546165, -1.808003, 1, 1, 1, 1, 1,
-0.4851081, 0.8392528, -0.2759978, 1, 1, 1, 1, 1,
-0.4837458, -0.07169598, -3.262467, 1, 1, 1, 1, 1,
-0.4827306, 0.1897682, 0.08484815, 1, 1, 1, 1, 1,
-0.4819571, 1.108511, 0.6530405, 1, 1, 1, 1, 1,
-0.4789569, 0.175111, -2.951386, 1, 1, 1, 1, 1,
-0.4761307, -1.730377, -2.151838, 1, 1, 1, 1, 1,
-0.4739969, -0.09891007, -1.205532, 1, 1, 1, 1, 1,
-0.4736764, 0.5806024, -1.236429, 1, 1, 1, 1, 1,
-0.4692184, -0.1031269, -2.302783, 1, 1, 1, 1, 1,
-0.4691394, 0.3740317, -0.2975965, 1, 1, 1, 1, 1,
-0.4674691, 0.4683551, -0.3721792, 1, 1, 1, 1, 1,
-0.4670126, 2.720548, 0.6619229, 1, 1, 1, 1, 1,
-0.4606124, -1.683813, -2.873997, 1, 1, 1, 1, 1,
-0.4603195, 1.625118, -0.5518614, 0, 0, 1, 1, 1,
-0.4599734, 0.385745, -0.3317235, 1, 0, 0, 1, 1,
-0.4553862, -2.043739, -2.94289, 1, 0, 0, 1, 1,
-0.4540517, -0.5414925, -3.512143, 1, 0, 0, 1, 1,
-0.4454486, 0.5431001, -0.800449, 1, 0, 0, 1, 1,
-0.4363447, -0.2425105, -1.858562, 1, 0, 0, 1, 1,
-0.4356713, -0.5435892, -1.886274, 0, 0, 0, 1, 1,
-0.4287677, -0.9013883, -3.767476, 0, 0, 0, 1, 1,
-0.427624, 0.03132556, -1.56999, 0, 0, 0, 1, 1,
-0.4214144, -1.484655, -3.045358, 0, 0, 0, 1, 1,
-0.4157736, 1.217462, 0.2471963, 0, 0, 0, 1, 1,
-0.4037074, -2.365955, -1.931823, 0, 0, 0, 1, 1,
-0.4034535, -0.1941753, -1.679299, 0, 0, 0, 1, 1,
-0.3968478, -1.243024, -2.94072, 1, 1, 1, 1, 1,
-0.3968266, -0.7852809, -2.839542, 1, 1, 1, 1, 1,
-0.3937497, -0.9786576, -2.808432, 1, 1, 1, 1, 1,
-0.3910469, -0.2890143, -2.087851, 1, 1, 1, 1, 1,
-0.3860033, 1.658519, 0.5751209, 1, 1, 1, 1, 1,
-0.3859871, 1.36358, -1.143636, 1, 1, 1, 1, 1,
-0.3848286, -0.2627024, -1.37227, 1, 1, 1, 1, 1,
-0.3709604, -1.098979, -2.724161, 1, 1, 1, 1, 1,
-0.3690106, -1.573062, -3.663817, 1, 1, 1, 1, 1,
-0.3683562, -0.6988571, -4.913185, 1, 1, 1, 1, 1,
-0.3679705, 1.344914, 0.01024625, 1, 1, 1, 1, 1,
-0.3641617, 0.2334343, -3.146258, 1, 1, 1, 1, 1,
-0.3619081, -1.546702, -2.836742, 1, 1, 1, 1, 1,
-0.3612559, 0.7295215, 1.683109, 1, 1, 1, 1, 1,
-0.3585747, -1.638686, -2.061118, 1, 1, 1, 1, 1,
-0.3576676, -1.43605, -3.064136, 0, 0, 1, 1, 1,
-0.3560953, -0.7917605, -2.320313, 1, 0, 0, 1, 1,
-0.3557281, 1.299017, -1.581509, 1, 0, 0, 1, 1,
-0.3551107, -0.771045, -0.9493673, 1, 0, 0, 1, 1,
-0.3549868, -0.599813, -3.553183, 1, 0, 0, 1, 1,
-0.3541503, -1.010314, -2.763373, 1, 0, 0, 1, 1,
-0.3485684, -1.114874, -3.378294, 0, 0, 0, 1, 1,
-0.3443063, -2.62231, -4.823314, 0, 0, 0, 1, 1,
-0.3439091, -0.002783277, -1.484725, 0, 0, 0, 1, 1,
-0.3413714, 0.6231001, 0.09990682, 0, 0, 0, 1, 1,
-0.3408787, -0.1267888, -2.223246, 0, 0, 0, 1, 1,
-0.3382185, 0.6839856, 0.1167467, 0, 0, 0, 1, 1,
-0.3371704, 0.7119837, -1.734776, 0, 0, 0, 1, 1,
-0.3368589, -1.636612, -4.78192, 1, 1, 1, 1, 1,
-0.3349373, -1.212303, -2.744308, 1, 1, 1, 1, 1,
-0.3281461, -1.011201, -3.735571, 1, 1, 1, 1, 1,
-0.3235257, -0.08410036, -2.021623, 1, 1, 1, 1, 1,
-0.3203964, -1.978501, -2.276663, 1, 1, 1, 1, 1,
-0.3196332, 1.423773, -2.504725, 1, 1, 1, 1, 1,
-0.3152679, -1.069469, -4.359668, 1, 1, 1, 1, 1,
-0.3080601, -0.9924624, -0.9046881, 1, 1, 1, 1, 1,
-0.3077888, -0.2115595, -4.850665, 1, 1, 1, 1, 1,
-0.303148, 0.7328505, -1.850548, 1, 1, 1, 1, 1,
-0.3030781, 0.5841187, 0.1181381, 1, 1, 1, 1, 1,
-0.302774, 0.4428053, 0.136501, 1, 1, 1, 1, 1,
-0.3007485, -1.246814, -1.439805, 1, 1, 1, 1, 1,
-0.2996666, 0.1725822, 0.5527151, 1, 1, 1, 1, 1,
-0.2970376, -0.5861637, -2.540993, 1, 1, 1, 1, 1,
-0.2910935, 0.1438509, -2.134929, 0, 0, 1, 1, 1,
-0.2890259, 0.7370934, -0.7614002, 1, 0, 0, 1, 1,
-0.2849471, -0.7121345, -2.551296, 1, 0, 0, 1, 1,
-0.2829657, 1.235789, 0.135398, 1, 0, 0, 1, 1,
-0.2827749, 1.06455, 0.8251929, 1, 0, 0, 1, 1,
-0.2772302, -1.939077, -3.301517, 1, 0, 0, 1, 1,
-0.2737575, -1.375383, -0.4011978, 0, 0, 0, 1, 1,
-0.2737558, 0.09568675, -0.9819738, 0, 0, 0, 1, 1,
-0.2714885, -0.4563082, -3.264017, 0, 0, 0, 1, 1,
-0.2703463, -0.9887587, -0.7085057, 0, 0, 0, 1, 1,
-0.2692499, -0.792313, -2.804881, 0, 0, 0, 1, 1,
-0.2663796, 0.3862347, -1.560538, 0, 0, 0, 1, 1,
-0.2659011, -1.660798, -3.480245, 0, 0, 0, 1, 1,
-0.2590678, -1.119603, -3.09542, 1, 1, 1, 1, 1,
-0.2585615, 2.330564, -0.7824281, 1, 1, 1, 1, 1,
-0.2584152, -0.6412727, -2.861173, 1, 1, 1, 1, 1,
-0.2583894, -0.2625446, -1.836782, 1, 1, 1, 1, 1,
-0.2564812, 0.8404508, 0.5321736, 1, 1, 1, 1, 1,
-0.2457548, 0.6085854, -1.503435, 1, 1, 1, 1, 1,
-0.2429741, 1.422075, -0.2862863, 1, 1, 1, 1, 1,
-0.2415449, -0.5947204, -3.325358, 1, 1, 1, 1, 1,
-0.2391429, 0.6123934, 1.145586, 1, 1, 1, 1, 1,
-0.2376998, 1.057357, -0.1479577, 1, 1, 1, 1, 1,
-0.2346275, 1.471821, 0.8549713, 1, 1, 1, 1, 1,
-0.2292956, -0.6789764, -1.998232, 1, 1, 1, 1, 1,
-0.2289158, 0.3076352, -0.1518252, 1, 1, 1, 1, 1,
-0.2234691, 0.4409732, -1.021873, 1, 1, 1, 1, 1,
-0.2195653, 1.059713, -2.529606, 1, 1, 1, 1, 1,
-0.2192353, -2.083978, -2.61885, 0, 0, 1, 1, 1,
-0.2147283, -0.7783626, -2.20763, 1, 0, 0, 1, 1,
-0.1982674, -0.8625239, -2.572856, 1, 0, 0, 1, 1,
-0.1963474, -0.3300675, -3.699265, 1, 0, 0, 1, 1,
-0.1935955, -0.5214851, -4.140543, 1, 0, 0, 1, 1,
-0.1912544, -0.5758218, -2.368745, 1, 0, 0, 1, 1,
-0.1909063, -0.9396389, -3.088683, 0, 0, 0, 1, 1,
-0.1861771, 0.1691088, -2.204868, 0, 0, 0, 1, 1,
-0.1840091, 1.067753, -1.503877, 0, 0, 0, 1, 1,
-0.1797843, -1.797922, -2.2028, 0, 0, 0, 1, 1,
-0.1781736, -0.8474887, -3.528691, 0, 0, 0, 1, 1,
-0.1767261, -0.7424852, -2.742115, 0, 0, 0, 1, 1,
-0.1759069, -0.2854903, -0.5989757, 0, 0, 0, 1, 1,
-0.1742157, -0.6898442, -2.414307, 1, 1, 1, 1, 1,
-0.1736767, 3.166862, 0.4723048, 1, 1, 1, 1, 1,
-0.1707351, 0.4813877, -1.940501, 1, 1, 1, 1, 1,
-0.1687274, -0.8621096, -3.519583, 1, 1, 1, 1, 1,
-0.1677263, 0.8120532, -0.9242355, 1, 1, 1, 1, 1,
-0.1666464, 1.842382, 0.9794659, 1, 1, 1, 1, 1,
-0.1620007, 0.5446481, -0.05171188, 1, 1, 1, 1, 1,
-0.1619084, 0.156275, -3.069172, 1, 1, 1, 1, 1,
-0.1581297, -0.6874048, -2.687931, 1, 1, 1, 1, 1,
-0.1569448, -1.497927, -2.386185, 1, 1, 1, 1, 1,
-0.1565845, 1.767639, -0.9662463, 1, 1, 1, 1, 1,
-0.1556, 0.8828329, -1.351402, 1, 1, 1, 1, 1,
-0.1457229, -0.8140001, -4.053058, 1, 1, 1, 1, 1,
-0.1355361, -0.9216996, -1.584911, 1, 1, 1, 1, 1,
-0.1352287, -0.1281545, -3.107362, 1, 1, 1, 1, 1,
-0.1347235, 0.09896161, -2.104129, 0, 0, 1, 1, 1,
-0.1317617, 0.2200857, 0.6559737, 1, 0, 0, 1, 1,
-0.1300607, 1.731772, 2.438257, 1, 0, 0, 1, 1,
-0.129052, -0.0105046, -3.072207, 1, 0, 0, 1, 1,
-0.127758, -0.8181347, -3.243837, 1, 0, 0, 1, 1,
-0.1270771, -0.9729058, -1.344189, 1, 0, 0, 1, 1,
-0.1263307, -2.812994, -2.733881, 0, 0, 0, 1, 1,
-0.1173174, 0.7103061, -1.160524, 0, 0, 0, 1, 1,
-0.1170852, 0.09776069, 0.3110677, 0, 0, 0, 1, 1,
-0.1168088, 1.427807, -0.005101659, 0, 0, 0, 1, 1,
-0.1157436, 0.696839, -0.03488989, 0, 0, 0, 1, 1,
-0.1126736, -0.6325847, -3.010226, 0, 0, 0, 1, 1,
-0.09544098, -0.3245521, -2.220043, 0, 0, 0, 1, 1,
-0.08982632, -0.6223619, -3.845752, 1, 1, 1, 1, 1,
-0.08756728, 0.4754761, -1.021926, 1, 1, 1, 1, 1,
-0.08527265, 0.7764229, -0.225743, 1, 1, 1, 1, 1,
-0.08449255, 0.02425879, -2.167224, 1, 1, 1, 1, 1,
-0.0827234, 2.950584, 0.37548, 1, 1, 1, 1, 1,
-0.07877421, 1.636734, 0.6990073, 1, 1, 1, 1, 1,
-0.07029638, -0.2742035, -2.856474, 1, 1, 1, 1, 1,
-0.06824885, 0.6287515, -1.016537, 1, 1, 1, 1, 1,
-0.06235157, -2.047191, -2.075084, 1, 1, 1, 1, 1,
-0.06007102, 0.06509367, -2.260839, 1, 1, 1, 1, 1,
-0.05890815, -0.4324692, -3.457775, 1, 1, 1, 1, 1,
-0.05831715, -1.631483, -3.417467, 1, 1, 1, 1, 1,
-0.05753709, 0.2062283, -0.08947411, 1, 1, 1, 1, 1,
-0.05679305, 0.4800926, 1.822041, 1, 1, 1, 1, 1,
-0.0562943, -0.5881414, -1.652426, 1, 1, 1, 1, 1,
-0.05459476, -0.06042411, -1.545293, 0, 0, 1, 1, 1,
-0.05294225, -1.695195, -2.342403, 1, 0, 0, 1, 1,
-0.052917, 0.2155363, -0.659683, 1, 0, 0, 1, 1,
-0.05279688, 0.3107756, -1.674793, 1, 0, 0, 1, 1,
-0.04845243, 1.326315, -0.8890917, 1, 0, 0, 1, 1,
-0.0468733, 0.1556422, 1.445641, 1, 0, 0, 1, 1,
-0.04654269, 0.2618223, -0.5642893, 0, 0, 0, 1, 1,
-0.04517416, 0.7798935, 0.03829654, 0, 0, 0, 1, 1,
-0.04452033, 0.2059281, -1.320104, 0, 0, 0, 1, 1,
-0.04058173, -0.9237003, -2.675253, 0, 0, 0, 1, 1,
-0.03994653, -0.01928503, -1.513312, 0, 0, 0, 1, 1,
-0.0393053, 0.1055108, 0.855063, 0, 0, 0, 1, 1,
-0.03903159, 0.2107977, -0.7830374, 0, 0, 0, 1, 1,
-0.03843487, 1.97445, -1.007339, 1, 1, 1, 1, 1,
-0.03343479, -0.1231836, -3.11498, 1, 1, 1, 1, 1,
-0.03328023, 1.682951, 0.3255472, 1, 1, 1, 1, 1,
-0.02802669, 1.211524, -0.5444995, 1, 1, 1, 1, 1,
-0.02789462, -0.9669812, -2.329858, 1, 1, 1, 1, 1,
-0.02516566, -0.7376159, -3.133089, 1, 1, 1, 1, 1,
-0.02202629, -0.5722097, -5.280345, 1, 1, 1, 1, 1,
-0.01514117, -0.1341891, -3.529632, 1, 1, 1, 1, 1,
-0.01240965, -0.458964, -2.766597, 1, 1, 1, 1, 1,
-0.01219739, 0.834008, 0.08897211, 1, 1, 1, 1, 1,
-0.01173379, 0.4540066, 0.4794027, 1, 1, 1, 1, 1,
-0.003073316, -1.364899, -3.667146, 1, 1, 1, 1, 1,
-0.001851192, -0.8004301, -2.990254, 1, 1, 1, 1, 1,
-0.001303368, -2.374665, -1.050722, 1, 1, 1, 1, 1,
-0.0003019312, -2.414025, -2.528478, 1, 1, 1, 1, 1,
0.005278847, -1.254421, 3.343933, 0, 0, 1, 1, 1,
0.008027415, 0.9372147, 0.7684867, 1, 0, 0, 1, 1,
0.01149101, 2.129699, -0.5898151, 1, 0, 0, 1, 1,
0.01706234, 1.072677, 0.02624142, 1, 0, 0, 1, 1,
0.01754365, 0.9943272, 0.5487062, 1, 0, 0, 1, 1,
0.02016294, -0.7963039, 2.562267, 1, 0, 0, 1, 1,
0.02096022, -1.539873, 2.602576, 0, 0, 0, 1, 1,
0.02525873, -1.712859, 2.391083, 0, 0, 0, 1, 1,
0.02664993, -0.569514, 1.420977, 0, 0, 0, 1, 1,
0.02670868, 0.7059273, 0.5717303, 0, 0, 0, 1, 1,
0.02701926, 0.001943569, 1.8784, 0, 0, 0, 1, 1,
0.02719815, 0.7314964, -0.8737673, 0, 0, 0, 1, 1,
0.02768295, -0.08048204, 0.9745596, 0, 0, 0, 1, 1,
0.02788949, 0.9239388, -0.3338672, 1, 1, 1, 1, 1,
0.02817234, -0.2763734, 3.047195, 1, 1, 1, 1, 1,
0.03238024, -1.491868, 3.711771, 1, 1, 1, 1, 1,
0.03581295, -0.7514645, 3.037601, 1, 1, 1, 1, 1,
0.03740028, 0.871044, -1.063125, 1, 1, 1, 1, 1,
0.04231338, 1.531391, -0.3097803, 1, 1, 1, 1, 1,
0.04471501, -0.540064, 2.210593, 1, 1, 1, 1, 1,
0.04554292, -0.05121264, 3.083709, 1, 1, 1, 1, 1,
0.04814767, -1.197012, 2.802947, 1, 1, 1, 1, 1,
0.04866213, -1.316857, 3.205923, 1, 1, 1, 1, 1,
0.0501855, -0.5697321, 3.001574, 1, 1, 1, 1, 1,
0.05170951, 0.3767837, 1.900478, 1, 1, 1, 1, 1,
0.05546788, 1.216747, 0.2503706, 1, 1, 1, 1, 1,
0.05743955, -0.2883946, 2.748672, 1, 1, 1, 1, 1,
0.05906064, -0.6087055, 2.492306, 1, 1, 1, 1, 1,
0.06540848, -0.3766868, 2.848361, 0, 0, 1, 1, 1,
0.06554192, 0.9857051, -0.7720724, 1, 0, 0, 1, 1,
0.06601387, -0.7075761, 4.8333, 1, 0, 0, 1, 1,
0.06932957, 0.5033349, 0.07519805, 1, 0, 0, 1, 1,
0.07461436, -0.1804324, 2.095993, 1, 0, 0, 1, 1,
0.0749227, 0.1622359, 0.2024207, 1, 0, 0, 1, 1,
0.08797915, -0.9243545, 2.511218, 0, 0, 0, 1, 1,
0.08910235, 0.2304047, -0.03522113, 0, 0, 0, 1, 1,
0.090227, -1.044867, 4.989984, 0, 0, 0, 1, 1,
0.09040493, -0.9404611, 5.00805, 0, 0, 0, 1, 1,
0.09375378, -0.8283703, 3.011267, 0, 0, 0, 1, 1,
0.09740026, 0.7657806, 0.6133599, 0, 0, 0, 1, 1,
0.09836903, 0.2441387, 1.282353, 0, 0, 0, 1, 1,
0.09854309, 0.2248823, -1.15248, 1, 1, 1, 1, 1,
0.1006649, 0.7869106, 0.4881231, 1, 1, 1, 1, 1,
0.1010996, 0.02997248, 0.9207573, 1, 1, 1, 1, 1,
0.1101766, 0.3759776, 0.1184108, 1, 1, 1, 1, 1,
0.1112992, -1.195261, 2.219857, 1, 1, 1, 1, 1,
0.1169224, -0.004049666, 3.295019, 1, 1, 1, 1, 1,
0.1189502, -0.5187278, 2.240893, 1, 1, 1, 1, 1,
0.121, 0.5011531, 0.2679076, 1, 1, 1, 1, 1,
0.1217418, -0.8883212, 2.944927, 1, 1, 1, 1, 1,
0.1249962, 0.976629, 0.6490668, 1, 1, 1, 1, 1,
0.1277202, 0.1202493, 2.743372, 1, 1, 1, 1, 1,
0.1281003, -0.06790641, 2.333876, 1, 1, 1, 1, 1,
0.1339406, -0.9292551, 3.263067, 1, 1, 1, 1, 1,
0.1365559, -0.1773501, 2.540963, 1, 1, 1, 1, 1,
0.1396528, -0.6381698, 1.560696, 1, 1, 1, 1, 1,
0.1400072, -0.1417647, 0.9249117, 0, 0, 1, 1, 1,
0.1448165, 0.1483133, 0.5747113, 1, 0, 0, 1, 1,
0.1481612, 1.036237, 1.794208, 1, 0, 0, 1, 1,
0.1512875, 0.895001, -0.9878008, 1, 0, 0, 1, 1,
0.1515846, 1.440165, -1.339646, 1, 0, 0, 1, 1,
0.1524918, 0.4316046, -0.2606493, 1, 0, 0, 1, 1,
0.1569552, -0.2960092, 1.812106, 0, 0, 0, 1, 1,
0.159515, -0.8378554, 2.237085, 0, 0, 0, 1, 1,
0.16058, -1.362635, 2.712871, 0, 0, 0, 1, 1,
0.1626922, -0.02640714, 1.275855, 0, 0, 0, 1, 1,
0.1637751, 1.472462, 0.8435684, 0, 0, 0, 1, 1,
0.1691874, -0.7383737, 4.094782, 0, 0, 0, 1, 1,
0.1708086, 0.1085801, 1.487292, 0, 0, 0, 1, 1,
0.1727076, -0.2663483, 0.9818501, 1, 1, 1, 1, 1,
0.1729397, 0.07995193, 1.92983, 1, 1, 1, 1, 1,
0.1766287, 0.03787733, 0.4899518, 1, 1, 1, 1, 1,
0.1827329, 0.5053221, -0.3494524, 1, 1, 1, 1, 1,
0.1847703, -1.566763, 2.701224, 1, 1, 1, 1, 1,
0.1847773, 0.2555387, -0.374056, 1, 1, 1, 1, 1,
0.18879, -1.892141, 3.481593, 1, 1, 1, 1, 1,
0.1897803, -0.5972176, 1.495149, 1, 1, 1, 1, 1,
0.1925507, -1.001118, 0.9925447, 1, 1, 1, 1, 1,
0.1932393, 1.34631, -1.535649, 1, 1, 1, 1, 1,
0.1954974, 2.239258, 0.214607, 1, 1, 1, 1, 1,
0.196255, -0.2748779, 3.273103, 1, 1, 1, 1, 1,
0.2033284, -0.08597118, 0.9425725, 1, 1, 1, 1, 1,
0.2043202, -1.336864, 1.526324, 1, 1, 1, 1, 1,
0.2078643, 1.012558, 1.648275, 1, 1, 1, 1, 1,
0.2079983, 3.122259, -2.064234, 0, 0, 1, 1, 1,
0.2094806, 0.07299528, 0.5792731, 1, 0, 0, 1, 1,
0.212529, -0.4960128, 2.21451, 1, 0, 0, 1, 1,
0.2139364, 1.028551, 1.551223, 1, 0, 0, 1, 1,
0.2191745, 0.9076108, 1.919757, 1, 0, 0, 1, 1,
0.2204831, 0.422748, -0.1724637, 1, 0, 0, 1, 1,
0.2228844, -0.3938283, 1.655257, 0, 0, 0, 1, 1,
0.2236034, -1.925086, 2.294009, 0, 0, 0, 1, 1,
0.2251498, -0.1694373, 0.5234951, 0, 0, 0, 1, 1,
0.2262988, -0.505878, 2.790212, 0, 0, 0, 1, 1,
0.2278014, -1.113235, 3.346811, 0, 0, 0, 1, 1,
0.2352616, -0.2185696, 1.270634, 0, 0, 0, 1, 1,
0.2359957, 1.232493, -0.500664, 0, 0, 0, 1, 1,
0.2369049, -0.8159322, 2.52996, 1, 1, 1, 1, 1,
0.2392245, 0.764, -0.06431258, 1, 1, 1, 1, 1,
0.2406609, -0.8956246, 4.10912, 1, 1, 1, 1, 1,
0.2429747, -2.472619, 3.037085, 1, 1, 1, 1, 1,
0.2460744, 0.468449, -0.5298848, 1, 1, 1, 1, 1,
0.2486039, 0.8066443, 0.7080172, 1, 1, 1, 1, 1,
0.2535075, 0.4878708, 1.41353, 1, 1, 1, 1, 1,
0.2573566, -0.01026296, 2.099829, 1, 1, 1, 1, 1,
0.2630628, -0.04325769, 0.8397481, 1, 1, 1, 1, 1,
0.2643295, 0.9000555, 0.6048248, 1, 1, 1, 1, 1,
0.2650332, 0.4430526, -0.6434106, 1, 1, 1, 1, 1,
0.267211, -0.4802535, 3.925894, 1, 1, 1, 1, 1,
0.268462, 0.8564947, -0.07198929, 1, 1, 1, 1, 1,
0.2688743, 0.01405, 0.6050503, 1, 1, 1, 1, 1,
0.2691689, 2.159888, 0.6418453, 1, 1, 1, 1, 1,
0.2695237, 0.211488, 0.3911, 0, 0, 1, 1, 1,
0.2737785, -0.6926185, 3.548273, 1, 0, 0, 1, 1,
0.2748146, 0.715121, 0.5863303, 1, 0, 0, 1, 1,
0.2771667, -0.1281502, 3.817938, 1, 0, 0, 1, 1,
0.2803991, -0.7410372, 3.495133, 1, 0, 0, 1, 1,
0.280641, -0.005954859, 2.507736, 1, 0, 0, 1, 1,
0.2841482, -0.1298838, 2.253495, 0, 0, 0, 1, 1,
0.2868704, 1.19197, -1.509519, 0, 0, 0, 1, 1,
0.2891745, -0.480604, 1.743596, 0, 0, 0, 1, 1,
0.2949999, 1.170549, -0.5409121, 0, 0, 0, 1, 1,
0.2982554, 0.4008236, 0.9221584, 0, 0, 0, 1, 1,
0.299549, 0.7112659, -1.02494, 0, 0, 0, 1, 1,
0.3001588, 0.3145537, -0.9816189, 0, 0, 0, 1, 1,
0.3003053, -0.4763869, 1.999981, 1, 1, 1, 1, 1,
0.3022543, 0.2015797, 0.917555, 1, 1, 1, 1, 1,
0.3032255, 0.6346201, 0.9466768, 1, 1, 1, 1, 1,
0.3047549, 0.2407723, 2.581221, 1, 1, 1, 1, 1,
0.310218, 0.2674652, 1.072521, 1, 1, 1, 1, 1,
0.3104045, -0.136349, 3.564949, 1, 1, 1, 1, 1,
0.3133354, -0.04109617, 3.881423, 1, 1, 1, 1, 1,
0.320123, 1.39968, -0.3648586, 1, 1, 1, 1, 1,
0.3202181, 0.1662109, 1.46209, 1, 1, 1, 1, 1,
0.3240658, -1.173645, 2.143212, 1, 1, 1, 1, 1,
0.3291897, -1.235103, 1.915052, 1, 1, 1, 1, 1,
0.3304063, -1.288845, 2.672331, 1, 1, 1, 1, 1,
0.3338313, 1.382161, 1.250717, 1, 1, 1, 1, 1,
0.3353029, 0.4477411, 1.303041, 1, 1, 1, 1, 1,
0.3355904, 0.8903297, -1.665673, 1, 1, 1, 1, 1,
0.3370181, -1.979017, 3.014807, 0, 0, 1, 1, 1,
0.3420041, 0.05341304, 1.66435, 1, 0, 0, 1, 1,
0.3487215, 0.09018906, 0.4838022, 1, 0, 0, 1, 1,
0.3504775, 0.485054, 1.020136, 1, 0, 0, 1, 1,
0.3521421, 1.331202, 1.103574, 1, 0, 0, 1, 1,
0.3547596, -1.035061, 1.263152, 1, 0, 0, 1, 1,
0.3617682, -0.2500513, 3.81466, 0, 0, 0, 1, 1,
0.3629822, -0.1051579, 1.784945, 0, 0, 0, 1, 1,
0.3635432, 0.2018903, 1.659225, 0, 0, 0, 1, 1,
0.3690001, -0.5910233, 2.396678, 0, 0, 0, 1, 1,
0.3722963, 0.2130859, 1.633589, 0, 0, 0, 1, 1,
0.3727033, -0.5116907, 1.284926, 0, 0, 0, 1, 1,
0.3771782, -0.1107943, 2.751369, 0, 0, 0, 1, 1,
0.3830805, 1.158497, 2.132558, 1, 1, 1, 1, 1,
0.3849204, -1.5402, 1.794994, 1, 1, 1, 1, 1,
0.3896939, 1.190956, 0.2405008, 1, 1, 1, 1, 1,
0.3913316, 0.9724994, -0.3473565, 1, 1, 1, 1, 1,
0.3919251, -0.7927396, 1.908412, 1, 1, 1, 1, 1,
0.3932061, 0.3927613, 1.22573, 1, 1, 1, 1, 1,
0.4000218, 2.453178, 0.7877845, 1, 1, 1, 1, 1,
0.405946, -0.9201801, 4.709288, 1, 1, 1, 1, 1,
0.4075947, -1.314616, 3.925317, 1, 1, 1, 1, 1,
0.409724, -0.7525581, 1.758515, 1, 1, 1, 1, 1,
0.4097295, 0.2397212, 0.1038266, 1, 1, 1, 1, 1,
0.4134358, 0.6185561, 2.288546, 1, 1, 1, 1, 1,
0.4214726, 0.6496328, 1.778537, 1, 1, 1, 1, 1,
0.4247193, -1.584895, 2.170584, 1, 1, 1, 1, 1,
0.4250861, 0.7289852, 2.39025, 1, 1, 1, 1, 1,
0.4271696, -0.1725735, 1.939698, 0, 0, 1, 1, 1,
0.4297794, 1.853123, 0.1690438, 1, 0, 0, 1, 1,
0.4319546, -0.7451091, 3.253266, 1, 0, 0, 1, 1,
0.4345491, 0.1592984, 0.8436086, 1, 0, 0, 1, 1,
0.4361404, -1.818018, 2.886645, 1, 0, 0, 1, 1,
0.436462, 0.4089714, 2.511044, 1, 0, 0, 1, 1,
0.4384468, -0.08172573, 0.5075388, 0, 0, 0, 1, 1,
0.438719, -0.3211031, 1.363137, 0, 0, 0, 1, 1,
0.441474, 1.177505, 1.361183, 0, 0, 0, 1, 1,
0.4452762, -0.8639117, 2.83267, 0, 0, 0, 1, 1,
0.4499493, -1.889901, 2.93554, 0, 0, 0, 1, 1,
0.4566328, -1.624153, 1.523678, 0, 0, 0, 1, 1,
0.4603336, -1.190068, 1.072378, 0, 0, 0, 1, 1,
0.4633792, -0.1581226, 1.954776, 1, 1, 1, 1, 1,
0.4657958, 0.4959487, 0.2164325, 1, 1, 1, 1, 1,
0.4663614, 0.1554497, 0.8308259, 1, 1, 1, 1, 1,
0.4679686, -0.4741298, 1.140136, 1, 1, 1, 1, 1,
0.4764715, -1.738275, 2.866668, 1, 1, 1, 1, 1,
0.4845715, 0.3466418, 0.2464364, 1, 1, 1, 1, 1,
0.4875314, 0.1642248, -0.1407541, 1, 1, 1, 1, 1,
0.4888369, 0.3427679, 2.74424, 1, 1, 1, 1, 1,
0.4914244, -0.2413404, 2.020335, 1, 1, 1, 1, 1,
0.4969044, -0.7813576, 2.460379, 1, 1, 1, 1, 1,
0.4983601, 0.3252887, 1.133665, 1, 1, 1, 1, 1,
0.4984793, 0.5564215, -0.03400449, 1, 1, 1, 1, 1,
0.4992985, -0.767803, 2.237202, 1, 1, 1, 1, 1,
0.4998807, 0.9443074, 0.9852896, 1, 1, 1, 1, 1,
0.5037841, -2.008098, 4.352047, 1, 1, 1, 1, 1,
0.5069959, 2.04929, 0.8655517, 0, 0, 1, 1, 1,
0.5077674, 0.9226457, 1.493271, 1, 0, 0, 1, 1,
0.5093332, 0.4036716, -1.040458, 1, 0, 0, 1, 1,
0.5099442, 0.3725266, -0.4175279, 1, 0, 0, 1, 1,
0.513671, 1.427308, 1.572511, 1, 0, 0, 1, 1,
0.5179012, -0.7142065, 2.492716, 1, 0, 0, 1, 1,
0.518981, 1.053519, 0.5789995, 0, 0, 0, 1, 1,
0.5207886, -0.6731803, 3.942403, 0, 0, 0, 1, 1,
0.524034, 1.090688, -0.5561944, 0, 0, 0, 1, 1,
0.5244065, 1.245899, 0.5042106, 0, 0, 0, 1, 1,
0.5249192, -1.647562, 3.655107, 0, 0, 0, 1, 1,
0.5272307, -0.70378, 1.831042, 0, 0, 0, 1, 1,
0.5274271, -1.924018, 2.829398, 0, 0, 0, 1, 1,
0.5302907, -0.01790603, 2.052221, 1, 1, 1, 1, 1,
0.5324195, 0.9861166, 1.555421, 1, 1, 1, 1, 1,
0.5338737, 0.1165513, 2.253112, 1, 1, 1, 1, 1,
0.5478235, 0.4202783, 2.068876, 1, 1, 1, 1, 1,
0.5478696, -0.5023726, 1.552467, 1, 1, 1, 1, 1,
0.549379, 1.685473, -0.4288287, 1, 1, 1, 1, 1,
0.5498774, 0.8052802, -1.402884, 1, 1, 1, 1, 1,
0.5502183, -1.317633, 2.034746, 1, 1, 1, 1, 1,
0.556159, -0.773457, 2.383607, 1, 1, 1, 1, 1,
0.5611376, 1.02493, 1.313085, 1, 1, 1, 1, 1,
0.563747, 0.2544501, 1.061331, 1, 1, 1, 1, 1,
0.5654926, 0.03095975, 2.212013, 1, 1, 1, 1, 1,
0.5658813, -0.6485747, 2.97358, 1, 1, 1, 1, 1,
0.5721451, 2.767205, -0.0008056731, 1, 1, 1, 1, 1,
0.5734762, -0.7156267, 4.546695, 1, 1, 1, 1, 1,
0.5765725, -0.1153055, 1.185333, 0, 0, 1, 1, 1,
0.5772952, 0.2939599, 0.9278401, 1, 0, 0, 1, 1,
0.5809229, 2.139956, 0.7232974, 1, 0, 0, 1, 1,
0.582104, -1.543732, 3.76274, 1, 0, 0, 1, 1,
0.5829642, -0.9442192, 2.878931, 1, 0, 0, 1, 1,
0.5841089, 0.4788679, 0.4510277, 1, 0, 0, 1, 1,
0.5889498, 1.362004, 0.2848801, 0, 0, 0, 1, 1,
0.5927134, 0.6397758, 1.713178, 0, 0, 0, 1, 1,
0.6065285, -0.6971758, 2.414394, 0, 0, 0, 1, 1,
0.6108506, 0.4384573, 0.7359973, 0, 0, 0, 1, 1,
0.6115613, -1.432868, 2.964563, 0, 0, 0, 1, 1,
0.6122549, -0.4903911, 2.766105, 0, 0, 0, 1, 1,
0.6148183, -0.4054929, 2.394963, 0, 0, 0, 1, 1,
0.6158872, 0.7692369, 0.8152863, 1, 1, 1, 1, 1,
0.6178568, -1.031474, 3.172484, 1, 1, 1, 1, 1,
0.6208103, 0.5294294, 0.5002277, 1, 1, 1, 1, 1,
0.6235061, 1.762908, 0.1663328, 1, 1, 1, 1, 1,
0.6247994, -0.8006116, 2.499842, 1, 1, 1, 1, 1,
0.62707, 1.710134, 0.3444257, 1, 1, 1, 1, 1,
0.6270777, -0.3828499, 2.163135, 1, 1, 1, 1, 1,
0.6308437, -0.6530593, 2.203114, 1, 1, 1, 1, 1,
0.634509, 0.6244797, 1.244192, 1, 1, 1, 1, 1,
0.6387537, -1.015136, 1.496827, 1, 1, 1, 1, 1,
0.6423911, -0.3177053, 0.8875417, 1, 1, 1, 1, 1,
0.6493449, 0.5575572, 1.004522, 1, 1, 1, 1, 1,
0.6523122, 0.03616775, 1.877569, 1, 1, 1, 1, 1,
0.6547273, 0.869267, -0.1359246, 1, 1, 1, 1, 1,
0.6577812, 1.469386, -1.537692, 1, 1, 1, 1, 1,
0.6590943, -0.7544858, 3.721386, 0, 0, 1, 1, 1,
0.6599506, 0.2504807, 0.6173243, 1, 0, 0, 1, 1,
0.6631044, -2.197624, 2.494401, 1, 0, 0, 1, 1,
0.6697796, 0.2675668, 1.480654, 1, 0, 0, 1, 1,
0.6763263, 0.2579541, 1.069454, 1, 0, 0, 1, 1,
0.6765825, 1.1049, 1.055061, 1, 0, 0, 1, 1,
0.6781482, -0.8315813, 1.165622, 0, 0, 0, 1, 1,
0.6798239, 0.444148, 1.430921, 0, 0, 0, 1, 1,
0.6804595, -2.070208, 2.795618, 0, 0, 0, 1, 1,
0.6818892, 0.5400788, 1.138577, 0, 0, 0, 1, 1,
0.6915342, 0.708991, -0.1469204, 0, 0, 0, 1, 1,
0.6924878, 0.3109807, 1.292763, 0, 0, 0, 1, 1,
0.6962129, 0.1426066, 2.240121, 0, 0, 0, 1, 1,
0.7013554, 1.97099, 0.5539417, 1, 1, 1, 1, 1,
0.7018549, -0.7259032, 3.834406, 1, 1, 1, 1, 1,
0.7054447, 0.036748, 0.6059271, 1, 1, 1, 1, 1,
0.7057284, 1.528068, -1.269685, 1, 1, 1, 1, 1,
0.7087356, 0.5226601, 2.235419, 1, 1, 1, 1, 1,
0.7119648, 1.824754, -0.2921887, 1, 1, 1, 1, 1,
0.7156357, -0.3392266, 1.31923, 1, 1, 1, 1, 1,
0.71569, -1.071169, 4.154152, 1, 1, 1, 1, 1,
0.7183139, -2.062039, 3.789225, 1, 1, 1, 1, 1,
0.7183993, -1.787578, 2.867482, 1, 1, 1, 1, 1,
0.7197803, 0.3987804, 2.456256, 1, 1, 1, 1, 1,
0.720311, -0.3292539, 1.880154, 1, 1, 1, 1, 1,
0.7256506, 0.04972348, 3.087258, 1, 1, 1, 1, 1,
0.7269819, 0.2603904, 1.381278, 1, 1, 1, 1, 1,
0.7287604, 2.294367, 0.9089263, 1, 1, 1, 1, 1,
0.7287894, -0.7775158, 4.370043, 0, 0, 1, 1, 1,
0.7361224, 0.3580781, 1.597114, 1, 0, 0, 1, 1,
0.73623, -2.127771, 3.665596, 1, 0, 0, 1, 1,
0.737819, 0.7238543, 3.031954, 1, 0, 0, 1, 1,
0.7394754, -1.296364, 2.792939, 1, 0, 0, 1, 1,
0.7505944, 0.2018568, 2.284196, 1, 0, 0, 1, 1,
0.7516988, -1.504218, 2.112692, 0, 0, 0, 1, 1,
0.7525823, -0.2130557, 0.5648869, 0, 0, 0, 1, 1,
0.7608082, 0.621721, 0.3026201, 0, 0, 0, 1, 1,
0.7616902, 1.034354, 1.192199, 0, 0, 0, 1, 1,
0.7631992, -2.289833, 1.990184, 0, 0, 0, 1, 1,
0.7662923, -0.7365586, 2.235995, 0, 0, 0, 1, 1,
0.7674734, -0.2720239, 2.775512, 0, 0, 0, 1, 1,
0.7708963, 0.06172472, 3.495564, 1, 1, 1, 1, 1,
0.7743189, 1.146429, 1.692155, 1, 1, 1, 1, 1,
0.7773359, -1.28489, 3.647729, 1, 1, 1, 1, 1,
0.7813622, -0.09199056, 3.130524, 1, 1, 1, 1, 1,
0.7846541, 1.532466, 0.8609456, 1, 1, 1, 1, 1,
0.7888504, 0.8214203, 0.1838762, 1, 1, 1, 1, 1,
0.7926632, 1.269966, -1.186629, 1, 1, 1, 1, 1,
0.8017003, 0.8022749, 1.152579, 1, 1, 1, 1, 1,
0.8052552, 0.09956163, 1.29086, 1, 1, 1, 1, 1,
0.8067452, -0.6890495, 2.500894, 1, 1, 1, 1, 1,
0.8137335, 0.3165442, 1.533265, 1, 1, 1, 1, 1,
0.8204991, -0.2133157, 2.993136, 1, 1, 1, 1, 1,
0.8235091, -1.430438, 1.777987, 1, 1, 1, 1, 1,
0.8336665, -0.342819, 1.858554, 1, 1, 1, 1, 1,
0.8337326, 0.456352, 3.259214, 1, 1, 1, 1, 1,
0.8360891, 0.1181892, 3.129888, 0, 0, 1, 1, 1,
0.8422543, 0.2472214, -1.246117, 1, 0, 0, 1, 1,
0.8456675, 0.8008015, 1.585055, 1, 0, 0, 1, 1,
0.8458858, 0.7067399, 0.6917815, 1, 0, 0, 1, 1,
0.8488548, -0.5604269, 1.375977, 1, 0, 0, 1, 1,
0.8628716, 2.013058, 1.451867, 1, 0, 0, 1, 1,
0.8651013, -0.2799748, 2.235996, 0, 0, 0, 1, 1,
0.8690367, 0.2079318, 1.978703, 0, 0, 0, 1, 1,
0.8762159, 0.01048384, 2.40985, 0, 0, 0, 1, 1,
0.8764078, -0.4733602, 3.031401, 0, 0, 0, 1, 1,
0.882563, -0.8850121, 1.732135, 0, 0, 0, 1, 1,
0.8831779, 1.747456, 0.6176102, 0, 0, 0, 1, 1,
0.8846893, -0.8445764, 3.803412, 0, 0, 0, 1, 1,
0.8929735, 0.3494093, 3.336566, 1, 1, 1, 1, 1,
0.8973595, 0.2117139, -0.3250734, 1, 1, 1, 1, 1,
0.9070696, -0.2283855, 0.3734983, 1, 1, 1, 1, 1,
0.9186874, 0.5836724, 0.4791552, 1, 1, 1, 1, 1,
0.9271683, -0.6135558, 1.221291, 1, 1, 1, 1, 1,
0.9274396, -0.4861856, 2.14006, 1, 1, 1, 1, 1,
0.9370546, -2.247409, 2.293925, 1, 1, 1, 1, 1,
0.9388415, -0.4254547, 4.400723, 1, 1, 1, 1, 1,
0.9406486, 1.923803, 1.51064, 1, 1, 1, 1, 1,
0.9419594, -0.8637414, 0.9137409, 1, 1, 1, 1, 1,
0.9509336, -0.1047261, 2.382603, 1, 1, 1, 1, 1,
0.952951, 2.684521, 1.123166, 1, 1, 1, 1, 1,
0.9537143, -0.5786725, 3.854915, 1, 1, 1, 1, 1,
0.9555843, -0.5438643, 2.861766, 1, 1, 1, 1, 1,
0.9567353, -0.9058884, 2.759199, 1, 1, 1, 1, 1,
0.9682565, -0.1478236, 0.5431067, 0, 0, 1, 1, 1,
0.9702691, 1.419927, 0.1293942, 1, 0, 0, 1, 1,
0.97311, 0.3151121, -0.7009207, 1, 0, 0, 1, 1,
0.9747939, 0.775445, 0.8521259, 1, 0, 0, 1, 1,
0.9755409, -1.369781, 1.606285, 1, 0, 0, 1, 1,
0.9892337, -1.63655, 2.150448, 1, 0, 0, 1, 1,
0.9974418, -0.6749365, 3.696488, 0, 0, 0, 1, 1,
0.9974571, 1.357635, 1.751392, 0, 0, 0, 1, 1,
1.002358, 1.658768, 1.794272, 0, 0, 0, 1, 1,
1.00255, -0.05671799, 0.9341062, 0, 0, 0, 1, 1,
1.003536, -1.186802, 2.974118, 0, 0, 0, 1, 1,
1.008966, -0.7230898, 2.15811, 0, 0, 0, 1, 1,
1.019946, 0.9480688, -0.2993774, 0, 0, 0, 1, 1,
1.020744, 0.2952672, 1.478999, 1, 1, 1, 1, 1,
1.02078, 1.629889, 0.01473771, 1, 1, 1, 1, 1,
1.020995, -0.6892444, 2.179229, 1, 1, 1, 1, 1,
1.023019, 0.07851952, -0.1364876, 1, 1, 1, 1, 1,
1.023842, -0.1083448, 2.130311, 1, 1, 1, 1, 1,
1.027034, -0.9927489, 2.239326, 1, 1, 1, 1, 1,
1.028615, -1.381947, 0.7818418, 1, 1, 1, 1, 1,
1.04058, -1.556503, 3.889884, 1, 1, 1, 1, 1,
1.046806, 0.9462019, 0.1293469, 1, 1, 1, 1, 1,
1.05023, 1.071124, 0.582092, 1, 1, 1, 1, 1,
1.057826, 1.095404, 0.5960155, 1, 1, 1, 1, 1,
1.063806, -0.4650174, 1.712644, 1, 1, 1, 1, 1,
1.066402, 1.695927, 0.1361971, 1, 1, 1, 1, 1,
1.07083, 0.5095819, 1.051217, 1, 1, 1, 1, 1,
1.08162, 0.3880914, 0.3206503, 1, 1, 1, 1, 1,
1.086796, -0.8284578, 0.4977363, 0, 0, 1, 1, 1,
1.090822, -0.8288448, 0.9802565, 1, 0, 0, 1, 1,
1.091043, 0.04564174, 1.392359, 1, 0, 0, 1, 1,
1.092569, -0.05858237, 3.319436, 1, 0, 0, 1, 1,
1.094199, -0.1815767, 1.435396, 1, 0, 0, 1, 1,
1.103876, -0.1334534, 2.555475, 1, 0, 0, 1, 1,
1.109333, -0.5577773, 2.765118, 0, 0, 0, 1, 1,
1.113562, 2.205781, 1.114533, 0, 0, 0, 1, 1,
1.116755, -0.03008936, 0.2740631, 0, 0, 0, 1, 1,
1.123753, 0.6869439, 2.80964, 0, 0, 0, 1, 1,
1.124161, 0.6661596, 1.30915, 0, 0, 0, 1, 1,
1.12524, -1.534935, 2.595335, 0, 0, 0, 1, 1,
1.130669, 0.9774036, -0.4653935, 0, 0, 0, 1, 1,
1.138824, -0.4846699, 2.015083, 1, 1, 1, 1, 1,
1.144194, 1.074374, 1.501299, 1, 1, 1, 1, 1,
1.145607, -0.2793062, 1.758066, 1, 1, 1, 1, 1,
1.150718, -0.2946688, 3.776895, 1, 1, 1, 1, 1,
1.154831, -1.639319, 2.142333, 1, 1, 1, 1, 1,
1.162736, -0.5683355, 0.8101502, 1, 1, 1, 1, 1,
1.168613, 1.211547, -0.2566878, 1, 1, 1, 1, 1,
1.17452, 2.607178, 0.04674015, 1, 1, 1, 1, 1,
1.180617, 1.179635, 0.8337495, 1, 1, 1, 1, 1,
1.183733, 0.6662979, 0.03670126, 1, 1, 1, 1, 1,
1.190753, 0.603063, 1.892136, 1, 1, 1, 1, 1,
1.207773, -0.5261032, 2.308057, 1, 1, 1, 1, 1,
1.230107, -0.7477376, 0.765268, 1, 1, 1, 1, 1,
1.230957, -0.7597317, 3.702811, 1, 1, 1, 1, 1,
1.232364, -0.6327583, 2.797196, 1, 1, 1, 1, 1,
1.241326, -1.080986, 1.508025, 0, 0, 1, 1, 1,
1.246432, 0.5278938, -0.390972, 1, 0, 0, 1, 1,
1.2586, -0.1965237, 3.461022, 1, 0, 0, 1, 1,
1.258716, 1.579535, 2.090835, 1, 0, 0, 1, 1,
1.262074, -1.234497, 1.81951, 1, 0, 0, 1, 1,
1.269613, 0.6279815, 1.615848, 1, 0, 0, 1, 1,
1.273615, -0.3682695, 0.2738517, 0, 0, 0, 1, 1,
1.274886, 0.6442437, 0.5295072, 0, 0, 0, 1, 1,
1.278834, 2.230442, 0.336123, 0, 0, 0, 1, 1,
1.280059, -0.2199045, 1.375521, 0, 0, 0, 1, 1,
1.288737, 0.1373892, 0.458867, 0, 0, 0, 1, 1,
1.289082, 0.24192, 2.016106, 0, 0, 0, 1, 1,
1.307441, 0.04772397, 3.036239, 0, 0, 0, 1, 1,
1.308638, 1.061568, 1.915248, 1, 1, 1, 1, 1,
1.314233, -0.2650977, 0.9298224, 1, 1, 1, 1, 1,
1.320548, -1.229567, 2.688423, 1, 1, 1, 1, 1,
1.322901, 1.363527, 0.9917357, 1, 1, 1, 1, 1,
1.323565, -0.8373931, 2.993683, 1, 1, 1, 1, 1,
1.324642, -0.2068863, 2.626068, 1, 1, 1, 1, 1,
1.324801, -0.2406095, 0.3417102, 1, 1, 1, 1, 1,
1.331309, -1.439181, 3.982843, 1, 1, 1, 1, 1,
1.341166, -0.5890814, 1.587569, 1, 1, 1, 1, 1,
1.354255, 1.149528, 1.55533, 1, 1, 1, 1, 1,
1.354303, 0.642441, 1.582592, 1, 1, 1, 1, 1,
1.35697, 1.628256, 0.4419898, 1, 1, 1, 1, 1,
1.368346, 0.7541413, 0.2561033, 1, 1, 1, 1, 1,
1.379619, 1.903806, 2.760653, 1, 1, 1, 1, 1,
1.381648, 0.4676706, 0.2397902, 1, 1, 1, 1, 1,
1.386169, -0.979664, 1.049559, 0, 0, 1, 1, 1,
1.388961, -0.1506102, 1.004767, 1, 0, 0, 1, 1,
1.400793, 1.624842, -0.6747732, 1, 0, 0, 1, 1,
1.40795, 0.6709815, 1.285459, 1, 0, 0, 1, 1,
1.429522, -0.520583, -0.2445243, 1, 0, 0, 1, 1,
1.431304, -2.074192, 3.729939, 1, 0, 0, 1, 1,
1.432363, -0.1251888, 2.213477, 0, 0, 0, 1, 1,
1.452509, -1.887286, 1.592832, 0, 0, 0, 1, 1,
1.475546, 1.152777, 0.01185681, 0, 0, 0, 1, 1,
1.490232, 1.586741, 1.668603, 0, 0, 0, 1, 1,
1.50289, 0.06540944, 1.946726, 0, 0, 0, 1, 1,
1.535756, 1.076887, 1.203198, 0, 0, 0, 1, 1,
1.540066, -1.126643, 1.178739, 0, 0, 0, 1, 1,
1.557003, -2.386843, 2.082126, 1, 1, 1, 1, 1,
1.570103, 0.1967436, 2.475311, 1, 1, 1, 1, 1,
1.583525, 0.1131052, 2.891012, 1, 1, 1, 1, 1,
1.592714, -0.3359881, 2.135972, 1, 1, 1, 1, 1,
1.608937, -0.7804025, 1.105694, 1, 1, 1, 1, 1,
1.62775, 2.003599, 0.7660221, 1, 1, 1, 1, 1,
1.638652, -2.199301, 1.399204, 1, 1, 1, 1, 1,
1.645454, -0.2981152, 0.9626137, 1, 1, 1, 1, 1,
1.654203, -0.5508748, 2.395733, 1, 1, 1, 1, 1,
1.680957, -0.1805185, 2.733354, 1, 1, 1, 1, 1,
1.694406, 1.396703, 1.083414, 1, 1, 1, 1, 1,
1.696417, 0.380176, 0.9697667, 1, 1, 1, 1, 1,
1.697878, -0.2550085, 1.90031, 1, 1, 1, 1, 1,
1.726192, -2.459464, 2.488848, 1, 1, 1, 1, 1,
1.733698, 1.729394, -1.003875, 1, 1, 1, 1, 1,
1.746827, -0.6507308, 1.244206, 0, 0, 1, 1, 1,
1.755398, 1.838075, -1.150439, 1, 0, 0, 1, 1,
1.756805, 0.5895452, 0.9706532, 1, 0, 0, 1, 1,
1.758565, -1.483759, 2.372543, 1, 0, 0, 1, 1,
1.775523, -0.249994, 1.856822, 1, 0, 0, 1, 1,
1.776312, 0.7033426, 2.818094, 1, 0, 0, 1, 1,
1.790925, -1.070747, 1.623195, 0, 0, 0, 1, 1,
1.792956, 0.02992811, -0.1527274, 0, 0, 0, 1, 1,
1.798897, -0.6045588, 3.419482, 0, 0, 0, 1, 1,
1.825914, 0.4326853, 1.427004, 0, 0, 0, 1, 1,
1.863953, 0.4295847, 1.292353, 0, 0, 0, 1, 1,
1.868719, -1.09277, 2.091721, 0, 0, 0, 1, 1,
1.874069, 0.02358334, 0.6984127, 0, 0, 0, 1, 1,
1.878167, -0.9277772, 2.210198, 1, 1, 1, 1, 1,
1.90333, -0.4687765, 1.860922, 1, 1, 1, 1, 1,
1.923776, -1.459853, 4.347588, 1, 1, 1, 1, 1,
1.929064, -1.790304, 2.137399, 1, 1, 1, 1, 1,
1.931944, 0.7961538, 0.8484613, 1, 1, 1, 1, 1,
1.938786, 1.026238, 2.399448, 1, 1, 1, 1, 1,
1.947245, 0.2705011, 2.875812, 1, 1, 1, 1, 1,
1.966713, 1.124953, -0.2074566, 1, 1, 1, 1, 1,
1.976256, 1.493828, 2.088987, 1, 1, 1, 1, 1,
1.988371, 1.422265, 1.39922, 1, 1, 1, 1, 1,
2.085055, 0.03002033, 1.136488, 1, 1, 1, 1, 1,
2.101789, -2.108889, 0.3419102, 1, 1, 1, 1, 1,
2.13427, 1.078055, 2.690538, 1, 1, 1, 1, 1,
2.168139, 0.2299098, 0.9158928, 1, 1, 1, 1, 1,
2.169259, 1.08246, 0.4657178, 1, 1, 1, 1, 1,
2.180932, 0.7853042, 0.4503225, 0, 0, 1, 1, 1,
2.181443, 0.1247782, 3.091092, 1, 0, 0, 1, 1,
2.202424, -0.032732, 1.510654, 1, 0, 0, 1, 1,
2.235129, -0.03901984, 1.185929, 1, 0, 0, 1, 1,
2.277949, 0.5705423, 2.422287, 1, 0, 0, 1, 1,
2.278605, 0.276627, 1.779777, 1, 0, 0, 1, 1,
2.335727, -1.54884, 1.562763, 0, 0, 0, 1, 1,
2.350994, -1.099779, 2.449487, 0, 0, 0, 1, 1,
2.354732, 0.7534758, 0.5878257, 0, 0, 0, 1, 1,
2.367429, 0.1342941, 2.354098, 0, 0, 0, 1, 1,
2.407217, -0.8618689, 1.9527, 0, 0, 0, 1, 1,
2.622808, -0.1026392, 1.335853, 0, 0, 0, 1, 1,
2.645787, -0.1923288, 1.546367, 0, 0, 0, 1, 1,
2.72452, -0.5642633, -0.355627, 1, 1, 1, 1, 1,
2.77256, 0.820695, 2.511803, 1, 1, 1, 1, 1,
2.86742, -1.567513, 0.3959716, 1, 1, 1, 1, 1,
3.146512, 0.3080092, 1.000218, 1, 1, 1, 1, 1,
3.280285, -1.552214, 3.41737, 1, 1, 1, 1, 1,
3.355317, 0.4189309, 1.439936, 1, 1, 1, 1, 1,
3.774977, 1.429581, 1.742317, 1, 1, 1, 1, 1
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
var radius = 9.462124;
var distance = 33.23531;
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
mvMatrix.translate( -0.3136683, -0.1769342, 0.1701705 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.23531);
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
