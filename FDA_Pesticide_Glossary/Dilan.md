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
-3.203515, 0.08818415, -1.755608, 1, 0, 0, 1,
-2.490303, -0.07152838, -0.8486986, 1, 0.007843138, 0, 1,
-2.436537, -0.2625645, -1.96003, 1, 0.01176471, 0, 1,
-2.427808, 1.840617, -2.349713, 1, 0.01960784, 0, 1,
-2.397295, -0.7468067, -1.309853, 1, 0.02352941, 0, 1,
-2.318511, 0.2489298, -2.565099, 1, 0.03137255, 0, 1,
-2.301912, 0.6301464, -0.8955849, 1, 0.03529412, 0, 1,
-2.277466, 0.3167719, -1.497396, 1, 0.04313726, 0, 1,
-2.270502, -0.2556052, -1.067652, 1, 0.04705882, 0, 1,
-2.256339, -0.2447559, -1.922675, 1, 0.05490196, 0, 1,
-2.238207, 0.004719011, -1.268772, 1, 0.05882353, 0, 1,
-2.211622, 0.3499811, -0.9045397, 1, 0.06666667, 0, 1,
-2.200829, 0.09543362, -3.053638, 1, 0.07058824, 0, 1,
-2.098257, -0.353524, -1.082497, 1, 0.07843138, 0, 1,
-2.052549, -1.403241, -2.087357, 1, 0.08235294, 0, 1,
-2.036384, 0.2641631, -2.780642, 1, 0.09019608, 0, 1,
-2.027514, -1.39782, -1.24874, 1, 0.09411765, 0, 1,
-1.996767, 0.5820029, -0.3489546, 1, 0.1019608, 0, 1,
-1.986329, -1.352725, -1.500215, 1, 0.1098039, 0, 1,
-1.984324, 1.137422, 0.1948681, 1, 0.1137255, 0, 1,
-1.978204, -1.366209, -0.9804174, 1, 0.1215686, 0, 1,
-1.975159, 0.7535405, -0.5855142, 1, 0.1254902, 0, 1,
-1.955346, 0.5209932, -1.714637, 1, 0.1333333, 0, 1,
-1.922704, 0.5487213, -1.060236, 1, 0.1372549, 0, 1,
-1.918218, 1.24406, -1.046182, 1, 0.145098, 0, 1,
-1.915657, 0.7904824, -0.6941037, 1, 0.1490196, 0, 1,
-1.91364, 0.0729335, -1.998548, 1, 0.1568628, 0, 1,
-1.895767, -0.07227593, -0.9737436, 1, 0.1607843, 0, 1,
-1.881876, 0.6516876, -1.614933, 1, 0.1686275, 0, 1,
-1.876488, -0.2926374, -2.702402, 1, 0.172549, 0, 1,
-1.869234, 0.5726534, -0.8194953, 1, 0.1803922, 0, 1,
-1.865181, -0.6026722, -0.4415188, 1, 0.1843137, 0, 1,
-1.849015, -0.2207129, -1.548165, 1, 0.1921569, 0, 1,
-1.836425, -0.4003222, -2.361752, 1, 0.1960784, 0, 1,
-1.82286, 1.826156, -0.4522933, 1, 0.2039216, 0, 1,
-1.802382, 0.8224404, -0.004001308, 1, 0.2117647, 0, 1,
-1.794538, -0.3539977, 0.3444776, 1, 0.2156863, 0, 1,
-1.748439, -0.9520751, -2.11051, 1, 0.2235294, 0, 1,
-1.733061, 1.226325, -0.8505653, 1, 0.227451, 0, 1,
-1.731797, 1.448395, -3.224653, 1, 0.2352941, 0, 1,
-1.723031, 0.08996124, -0.9265319, 1, 0.2392157, 0, 1,
-1.720342, -1.526602, -1.862832, 1, 0.2470588, 0, 1,
-1.716091, -0.5381982, -2.181489, 1, 0.2509804, 0, 1,
-1.713361, 0.5783428, -2.182412, 1, 0.2588235, 0, 1,
-1.697889, -1.535518, -1.560297, 1, 0.2627451, 0, 1,
-1.692472, -0.7480943, -2.237767, 1, 0.2705882, 0, 1,
-1.682728, 1.635758, -0.2868281, 1, 0.2745098, 0, 1,
-1.676408, 0.7202743, -0.339582, 1, 0.282353, 0, 1,
-1.671979, -1.022518, -0.2805037, 1, 0.2862745, 0, 1,
-1.662961, 1.597783, -1.398405, 1, 0.2941177, 0, 1,
-1.657652, -0.2368258, -2.87628, 1, 0.3019608, 0, 1,
-1.648916, 1.173225, 0.07846525, 1, 0.3058824, 0, 1,
-1.619316, 0.9131581, -0.7300319, 1, 0.3137255, 0, 1,
-1.616122, -0.3939338, -3.113315, 1, 0.3176471, 0, 1,
-1.610096, 0.579541, -1.974632, 1, 0.3254902, 0, 1,
-1.608767, -0.3798924, -2.095534, 1, 0.3294118, 0, 1,
-1.608452, 0.7938871, -0.07536236, 1, 0.3372549, 0, 1,
-1.607714, -1.197662, -1.807336, 1, 0.3411765, 0, 1,
-1.6006, -1.278133, -1.828944, 1, 0.3490196, 0, 1,
-1.597173, -0.7420138, -1.208529, 1, 0.3529412, 0, 1,
-1.591246, -0.1804914, -1.362281, 1, 0.3607843, 0, 1,
-1.585905, -0.002959757, -2.084002, 1, 0.3647059, 0, 1,
-1.579952, -0.06785168, -2.604904, 1, 0.372549, 0, 1,
-1.570477, -0.219159, -1.343849, 1, 0.3764706, 0, 1,
-1.564235, -1.356089, -2.85, 1, 0.3843137, 0, 1,
-1.560411, 0.5377095, 0.5472503, 1, 0.3882353, 0, 1,
-1.55923, -1.975278, -1.322525, 1, 0.3960784, 0, 1,
-1.556447, 0.4747785, -1.700608, 1, 0.4039216, 0, 1,
-1.555181, -0.2771294, -2.953921, 1, 0.4078431, 0, 1,
-1.551193, -0.8015475, -3.922437, 1, 0.4156863, 0, 1,
-1.549914, -0.4216858, -0.2157313, 1, 0.4196078, 0, 1,
-1.53542, -0.9833732, -0.8700536, 1, 0.427451, 0, 1,
-1.533691, -0.4382324, -2.676309, 1, 0.4313726, 0, 1,
-1.514057, 0.6989986, -2.527405, 1, 0.4392157, 0, 1,
-1.510182, 0.1126137, -2.220981, 1, 0.4431373, 0, 1,
-1.502129, -0.9333897, -1.033349, 1, 0.4509804, 0, 1,
-1.4996, -1.286313, -1.95944, 1, 0.454902, 0, 1,
-1.490442, 0.684054, -1.51965, 1, 0.4627451, 0, 1,
-1.486999, -0.6699824, -2.357625, 1, 0.4666667, 0, 1,
-1.480922, -1.233852, -2.22093, 1, 0.4745098, 0, 1,
-1.47274, 0.5852215, 0.1148321, 1, 0.4784314, 0, 1,
-1.456679, 0.0159145, -3.472975, 1, 0.4862745, 0, 1,
-1.454995, -0.3485097, -1.372185, 1, 0.4901961, 0, 1,
-1.45114, -0.3414401, -1.241408, 1, 0.4980392, 0, 1,
-1.447808, -0.2048776, -2.7572, 1, 0.5058824, 0, 1,
-1.439176, 0.1434481, -2.724155, 1, 0.509804, 0, 1,
-1.436238, 0.4458283, -0.07212608, 1, 0.5176471, 0, 1,
-1.435806, 0.7435803, -1.289666, 1, 0.5215687, 0, 1,
-1.432232, -0.2256899, -2.479535, 1, 0.5294118, 0, 1,
-1.42931, 1.536695, -0.6143736, 1, 0.5333334, 0, 1,
-1.425077, -0.7679465, -2.884074, 1, 0.5411765, 0, 1,
-1.416587, -0.6417893, -2.837311, 1, 0.5450981, 0, 1,
-1.411124, -2.208555, -4.340245, 1, 0.5529412, 0, 1,
-1.402501, -0.1413973, -0.3927006, 1, 0.5568628, 0, 1,
-1.394403, 0.6699988, -2.962913, 1, 0.5647059, 0, 1,
-1.390551, 1.851406, 0.8163525, 1, 0.5686275, 0, 1,
-1.384584, -0.4692666, 0.04490454, 1, 0.5764706, 0, 1,
-1.382321, -0.1882112, -1.860088, 1, 0.5803922, 0, 1,
-1.381221, 0.2529362, -1.613056, 1, 0.5882353, 0, 1,
-1.37886, 0.7680094, -1.535508, 1, 0.5921569, 0, 1,
-1.37665, 0.191457, -1.42275, 1, 0.6, 0, 1,
-1.375718, 0.09015059, -2.415424, 1, 0.6078432, 0, 1,
-1.370986, 0.7412697, -1.111595, 1, 0.6117647, 0, 1,
-1.362271, -0.02182941, -2.676271, 1, 0.6196079, 0, 1,
-1.359861, 0.2475474, -2.113713, 1, 0.6235294, 0, 1,
-1.358394, 0.823107, -1.455417, 1, 0.6313726, 0, 1,
-1.357139, -0.9591742, -3.679118, 1, 0.6352941, 0, 1,
-1.330516, -0.4966407, -2.295801, 1, 0.6431373, 0, 1,
-1.330076, 0.6749571, -3.401119, 1, 0.6470588, 0, 1,
-1.324371, 0.4836879, -1.400284, 1, 0.654902, 0, 1,
-1.322013, 1.37983, -0.8325238, 1, 0.6588235, 0, 1,
-1.321757, -0.4057623, -0.18527, 1, 0.6666667, 0, 1,
-1.321486, -0.5478228, -4.736413, 1, 0.6705883, 0, 1,
-1.310433, 1.065578, -0.2277932, 1, 0.6784314, 0, 1,
-1.305465, -0.3214898, -1.698707, 1, 0.682353, 0, 1,
-1.301265, 0.797376, -1.286243, 1, 0.6901961, 0, 1,
-1.288784, -0.2182414, -2.804544, 1, 0.6941177, 0, 1,
-1.284531, -1.120812, -1.148593, 1, 0.7019608, 0, 1,
-1.282171, -0.06918401, -1.476009, 1, 0.7098039, 0, 1,
-1.274558, -1.323842, -2.58736, 1, 0.7137255, 0, 1,
-1.267491, -0.9463391, -1.438611, 1, 0.7215686, 0, 1,
-1.257311, 0.1957122, -2.668661, 1, 0.7254902, 0, 1,
-1.256951, 0.4206186, -1.783166, 1, 0.7333333, 0, 1,
-1.254506, 1.059446, -0.2105809, 1, 0.7372549, 0, 1,
-1.251955, -0.9861826, -2.547941, 1, 0.7450981, 0, 1,
-1.249245, 0.4211068, -1.45666, 1, 0.7490196, 0, 1,
-1.249214, 0.1073133, -1.362975, 1, 0.7568628, 0, 1,
-1.249209, 0.0287396, -1.661413, 1, 0.7607843, 0, 1,
-1.245481, -1.472179, -3.67678, 1, 0.7686275, 0, 1,
-1.242885, -0.4878108, -1.962243, 1, 0.772549, 0, 1,
-1.242169, -0.3303363, -1.850017, 1, 0.7803922, 0, 1,
-1.241679, 1.595625, -0.2594417, 1, 0.7843137, 0, 1,
-1.241259, -1.164312, -1.9838, 1, 0.7921569, 0, 1,
-1.222049, -0.4501368, -0.6116278, 1, 0.7960784, 0, 1,
-1.219727, -1.220921, -1.258204, 1, 0.8039216, 0, 1,
-1.194907, 0.03529228, -2.184147, 1, 0.8117647, 0, 1,
-1.193416, 1.276095, 0.4898213, 1, 0.8156863, 0, 1,
-1.184348, 0.2011387, -0.1597182, 1, 0.8235294, 0, 1,
-1.176963, -0.8405316, -2.657491, 1, 0.827451, 0, 1,
-1.176313, 0.1736463, 2.075182, 1, 0.8352941, 0, 1,
-1.167143, -1.397963, -3.367616, 1, 0.8392157, 0, 1,
-1.165435, -1.423601, -2.257994, 1, 0.8470588, 0, 1,
-1.164353, -0.2881495, -1.156603, 1, 0.8509804, 0, 1,
-1.160591, -0.2610703, -1.606417, 1, 0.8588235, 0, 1,
-1.151518, -0.159566, -2.276822, 1, 0.8627451, 0, 1,
-1.150688, 0.7960108, 0.02234342, 1, 0.8705882, 0, 1,
-1.150239, -0.1988225, -1.810166, 1, 0.8745098, 0, 1,
-1.149879, 0.1806883, -2.641199, 1, 0.8823529, 0, 1,
-1.145586, -1.33322, -2.751801, 1, 0.8862745, 0, 1,
-1.136221, -1.143777, -4.31828, 1, 0.8941177, 0, 1,
-1.135582, 0.5324889, -2.660985, 1, 0.8980392, 0, 1,
-1.135398, -0.1580902, -1.283809, 1, 0.9058824, 0, 1,
-1.134639, 0.1605106, -1.582265, 1, 0.9137255, 0, 1,
-1.129623, 1.490219, 0.6960963, 1, 0.9176471, 0, 1,
-1.129455, 1.493163, 0.4988656, 1, 0.9254902, 0, 1,
-1.129071, -1.083765, -1.577315, 1, 0.9294118, 0, 1,
-1.119689, -0.1822672, -2.607705, 1, 0.9372549, 0, 1,
-1.114028, -0.7148397, -3.570213, 1, 0.9411765, 0, 1,
-1.108665, 1.777774, -1.105436, 1, 0.9490196, 0, 1,
-1.103215, -0.1830238, -3.622298, 1, 0.9529412, 0, 1,
-1.10288, 0.2253469, -3.887892, 1, 0.9607843, 0, 1,
-1.09955, -0.219714, -2.548223, 1, 0.9647059, 0, 1,
-1.097728, -0.2690166, -1.760358, 1, 0.972549, 0, 1,
-1.097303, 0.6929207, -0.8811765, 1, 0.9764706, 0, 1,
-1.095182, -1.010088, -1.745919, 1, 0.9843137, 0, 1,
-1.094873, 0.8224259, -0.3509825, 1, 0.9882353, 0, 1,
-1.088799, 0.3490424, 0.1396744, 1, 0.9960784, 0, 1,
-1.084136, 1.461526, -0.8787135, 0.9960784, 1, 0, 1,
-1.078564, -0.9344921, -3.389031, 0.9921569, 1, 0, 1,
-1.078341, 0.3080254, -1.896823, 0.9843137, 1, 0, 1,
-1.077565, 1.572177, -1.446755, 0.9803922, 1, 0, 1,
-1.076382, 0.4225947, -2.579558, 0.972549, 1, 0, 1,
-1.067763, 0.4939094, -1.94058, 0.9686275, 1, 0, 1,
-1.065683, 0.2615722, -0.3559208, 0.9607843, 1, 0, 1,
-1.062932, -0.7573007, -2.801078, 0.9568627, 1, 0, 1,
-1.062013, -0.9716011, -2.217861, 0.9490196, 1, 0, 1,
-1.05815, -1.542255, -1.540701, 0.945098, 1, 0, 1,
-1.053404, 0.9971376, -1.393532, 0.9372549, 1, 0, 1,
-1.049007, -1.171252, -2.344744, 0.9333333, 1, 0, 1,
-1.046753, 1.536733, -2.053905, 0.9254902, 1, 0, 1,
-1.045262, 1.106866, -0.04970549, 0.9215686, 1, 0, 1,
-1.042687, -0.9079267, -3.338914, 0.9137255, 1, 0, 1,
-1.040512, -0.7765869, -2.644011, 0.9098039, 1, 0, 1,
-1.040205, -1.252994, -4.523242, 0.9019608, 1, 0, 1,
-1.038225, 0.7438596, -1.701374, 0.8941177, 1, 0, 1,
-1.037769, 0.02503304, -0.2196281, 0.8901961, 1, 0, 1,
-1.033572, -1.136212, -1.993574, 0.8823529, 1, 0, 1,
-1.030041, -0.214422, -1.097851, 0.8784314, 1, 0, 1,
-1.026558, -0.5288833, -2.815305, 0.8705882, 1, 0, 1,
-1.005754, 1.206375, -2.739604, 0.8666667, 1, 0, 1,
-1.002199, -1.100232, -2.819367, 0.8588235, 1, 0, 1,
-1.001311, 0.175717, -1.084742, 0.854902, 1, 0, 1,
-0.9937795, -2.170168, -2.40448, 0.8470588, 1, 0, 1,
-0.9911789, -1.095499, -1.038162, 0.8431373, 1, 0, 1,
-0.9814865, 1.809572, 1.363692, 0.8352941, 1, 0, 1,
-0.9776712, 1.203138, -1.272495, 0.8313726, 1, 0, 1,
-0.9771146, -0.1979661, -1.395289, 0.8235294, 1, 0, 1,
-0.9755414, -0.9288102, -1.222817, 0.8196079, 1, 0, 1,
-0.9708653, 1.397707, -0.6049509, 0.8117647, 1, 0, 1,
-0.9680355, 1.298935, -1.013652, 0.8078431, 1, 0, 1,
-0.9632173, 1.18284, -0.2503569, 0.8, 1, 0, 1,
-0.9599779, -0.04215313, -1.620352, 0.7921569, 1, 0, 1,
-0.9557558, -0.2367391, -1.271381, 0.7882353, 1, 0, 1,
-0.9529323, -0.4609731, 0.5041252, 0.7803922, 1, 0, 1,
-0.9519849, 0.8971276, -0.999272, 0.7764706, 1, 0, 1,
-0.9511247, 0.562086, -1.492194, 0.7686275, 1, 0, 1,
-0.9435378, 1.264705, -1.098768, 0.7647059, 1, 0, 1,
-0.9434831, 0.01136672, -2.298196, 0.7568628, 1, 0, 1,
-0.9418448, 1.586321, 0.1548216, 0.7529412, 1, 0, 1,
-0.9416617, -0.27737, -1.461412, 0.7450981, 1, 0, 1,
-0.9397007, 0.2541322, -1.000537, 0.7411765, 1, 0, 1,
-0.9329289, -1.908334, -2.103159, 0.7333333, 1, 0, 1,
-0.9193157, 0.5411711, -0.4989929, 0.7294118, 1, 0, 1,
-0.9158419, -0.6169592, -2.028161, 0.7215686, 1, 0, 1,
-0.9150932, -1.381845, -2.914635, 0.7176471, 1, 0, 1,
-0.9143475, 0.9412259, -2.817924, 0.7098039, 1, 0, 1,
-0.9120567, -0.09414604, -0.6305724, 0.7058824, 1, 0, 1,
-0.9106801, -0.1704782, -1.713217, 0.6980392, 1, 0, 1,
-0.9095078, 0.8457613, 0.2357339, 0.6901961, 1, 0, 1,
-0.9081969, -0.1679538, -0.9811608, 0.6862745, 1, 0, 1,
-0.9053378, 1.244077, -0.5395285, 0.6784314, 1, 0, 1,
-0.903174, -2.144161, -3.504865, 0.6745098, 1, 0, 1,
-0.8945812, 0.2023046, -2.705822, 0.6666667, 1, 0, 1,
-0.8935363, -0.8077691, -4.238953, 0.6627451, 1, 0, 1,
-0.8837784, 1.207298, 1.657164, 0.654902, 1, 0, 1,
-0.878038, 1.598888, 0.6126219, 0.6509804, 1, 0, 1,
-0.8737591, -1.047209, -2.534082, 0.6431373, 1, 0, 1,
-0.867889, -0.0002931942, -0.5700403, 0.6392157, 1, 0, 1,
-0.863126, 0.9996624, -0.2905693, 0.6313726, 1, 0, 1,
-0.8596153, 1.244231, -0.8136257, 0.627451, 1, 0, 1,
-0.8530173, 0.1528531, -0.7531956, 0.6196079, 1, 0, 1,
-0.852962, -1.229888, -4.005341, 0.6156863, 1, 0, 1,
-0.8512716, -0.2715455, -2.108128, 0.6078432, 1, 0, 1,
-0.8498531, 0.09130538, -0.8648933, 0.6039216, 1, 0, 1,
-0.8494433, -1.333462, -2.417985, 0.5960785, 1, 0, 1,
-0.8455527, 1.064534, -0.2301185, 0.5882353, 1, 0, 1,
-0.8434123, -1.204191, -3.22883, 0.5843138, 1, 0, 1,
-0.8410947, -0.01744003, -0.08882914, 0.5764706, 1, 0, 1,
-0.827559, 1.192803, 0.5052196, 0.572549, 1, 0, 1,
-0.8274598, 0.493829, -2.009339, 0.5647059, 1, 0, 1,
-0.8201999, -0.6645058, -2.063981, 0.5607843, 1, 0, 1,
-0.8196024, 1.088193, -0.213027, 0.5529412, 1, 0, 1,
-0.8169186, -2.469356, -4.80676, 0.5490196, 1, 0, 1,
-0.813415, 0.2619047, -2.688622, 0.5411765, 1, 0, 1,
-0.8121181, 0.3105963, 0.3360115, 0.5372549, 1, 0, 1,
-0.8109304, 0.6144007, -0.5240117, 0.5294118, 1, 0, 1,
-0.8081054, -1.067762, -2.686933, 0.5254902, 1, 0, 1,
-0.7999112, -0.06420895, -2.91869, 0.5176471, 1, 0, 1,
-0.7982029, 0.4909087, 0.6495165, 0.5137255, 1, 0, 1,
-0.7974358, 0.3360568, -1.284839, 0.5058824, 1, 0, 1,
-0.7948078, 0.3975738, 0.09971754, 0.5019608, 1, 0, 1,
-0.78774, -0.604167, -2.224473, 0.4941176, 1, 0, 1,
-0.786663, 0.09868501, 0.265333, 0.4862745, 1, 0, 1,
-0.7858904, -1.726175, 0.06695338, 0.4823529, 1, 0, 1,
-0.7817394, 2.099118, -1.586606, 0.4745098, 1, 0, 1,
-0.7791997, 1.058505, -1.006502, 0.4705882, 1, 0, 1,
-0.7731633, 0.2397519, -0.01241386, 0.4627451, 1, 0, 1,
-0.7716984, -0.2149751, -1.646368, 0.4588235, 1, 0, 1,
-0.7708477, 0.348235, 0.959549, 0.4509804, 1, 0, 1,
-0.7682099, -0.9873167, -2.385041, 0.4470588, 1, 0, 1,
-0.7612472, -0.160781, -0.9606419, 0.4392157, 1, 0, 1,
-0.7557704, -0.3274736, -0.7738824, 0.4352941, 1, 0, 1,
-0.7549503, -1.365488, -2.462927, 0.427451, 1, 0, 1,
-0.7520448, 0.2096334, -2.938996, 0.4235294, 1, 0, 1,
-0.7483073, 1.178934, 1.884091, 0.4156863, 1, 0, 1,
-0.7460531, 0.8580167, -2.619832, 0.4117647, 1, 0, 1,
-0.7449307, 0.3871616, -1.273017, 0.4039216, 1, 0, 1,
-0.7426857, -0.2608491, -1.357851, 0.3960784, 1, 0, 1,
-0.7410362, 0.3729105, 0.4095593, 0.3921569, 1, 0, 1,
-0.7399266, 0.1666682, -2.732284, 0.3843137, 1, 0, 1,
-0.737484, -1.479705, -2.438107, 0.3803922, 1, 0, 1,
-0.7358577, -0.5133015, -3.19259, 0.372549, 1, 0, 1,
-0.7333395, 0.7459671, -0.1380717, 0.3686275, 1, 0, 1,
-0.7271621, -1.082666, -2.068815, 0.3607843, 1, 0, 1,
-0.7179559, 0.1042188, -0.9920954, 0.3568628, 1, 0, 1,
-0.7038139, -1.482241, -5.130935, 0.3490196, 1, 0, 1,
-0.6914538, 0.8671021, -2.286492, 0.345098, 1, 0, 1,
-0.6883967, -0.7937523, -1.751397, 0.3372549, 1, 0, 1,
-0.6882175, 2.023082, 0.6372337, 0.3333333, 1, 0, 1,
-0.670966, -1.149039, -4.761014, 0.3254902, 1, 0, 1,
-0.6699247, 0.144128, -1.730925, 0.3215686, 1, 0, 1,
-0.6658563, -0.330268, -2.109735, 0.3137255, 1, 0, 1,
-0.665602, -0.0377409, -1.499915, 0.3098039, 1, 0, 1,
-0.6576118, -0.8621985, -3.689301, 0.3019608, 1, 0, 1,
-0.6563892, -0.4267991, -1.033392, 0.2941177, 1, 0, 1,
-0.6497048, -0.3992398, -1.217984, 0.2901961, 1, 0, 1,
-0.6484796, -1.473873, -4.344092, 0.282353, 1, 0, 1,
-0.6465822, -0.3844501, -2.773517, 0.2784314, 1, 0, 1,
-0.6433043, -0.8107913, -1.903844, 0.2705882, 1, 0, 1,
-0.6384121, -0.264706, -2.097783, 0.2666667, 1, 0, 1,
-0.6330163, -0.2305073, -2.052853, 0.2588235, 1, 0, 1,
-0.6312923, -1.209672, -4.31621, 0.254902, 1, 0, 1,
-0.631292, 0.4526823, -1.654653, 0.2470588, 1, 0, 1,
-0.6276363, 1.880911, -0.6272693, 0.2431373, 1, 0, 1,
-0.6269816, -1.0005, -1.86429, 0.2352941, 1, 0, 1,
-0.6173187, 0.1928419, -0.6099271, 0.2313726, 1, 0, 1,
-0.6162406, 0.5953532, -0.06692105, 0.2235294, 1, 0, 1,
-0.6137589, 0.5549755, 0.3340004, 0.2196078, 1, 0, 1,
-0.6112251, 0.685613, 0.6497988, 0.2117647, 1, 0, 1,
-0.6106654, -0.1185783, -3.552132, 0.2078431, 1, 0, 1,
-0.6072076, -0.8785149, -3.023179, 0.2, 1, 0, 1,
-0.605453, 0.8138818, -0.7752933, 0.1921569, 1, 0, 1,
-0.6014799, 0.07167976, -0.9083961, 0.1882353, 1, 0, 1,
-0.5982179, -1.707234, -2.290733, 0.1803922, 1, 0, 1,
-0.5949873, -0.1751289, -1.643465, 0.1764706, 1, 0, 1,
-0.5935657, 2.320385, -0.9401671, 0.1686275, 1, 0, 1,
-0.5921035, 0.03326391, -0.3592936, 0.1647059, 1, 0, 1,
-0.5901713, 0.959344, -1.569921, 0.1568628, 1, 0, 1,
-0.5845016, 1.070954, 0.2852717, 0.1529412, 1, 0, 1,
-0.5751183, 0.01023105, -3.2081, 0.145098, 1, 0, 1,
-0.5744723, 2.522661, -1.278655, 0.1411765, 1, 0, 1,
-0.5677186, -0.7052909, -1.86062, 0.1333333, 1, 0, 1,
-0.5632228, 0.8712893, -0.718259, 0.1294118, 1, 0, 1,
-0.5471157, -1.192253, -1.480257, 0.1215686, 1, 0, 1,
-0.5383932, -0.5538763, -2.477582, 0.1176471, 1, 0, 1,
-0.5366349, 1.08686, 0.2890198, 0.1098039, 1, 0, 1,
-0.5359333, -0.6141184, -2.359783, 0.1058824, 1, 0, 1,
-0.530607, -0.2158932, -4.015241, 0.09803922, 1, 0, 1,
-0.5225838, -0.6953366, -2.837005, 0.09019608, 1, 0, 1,
-0.5199078, -0.02208311, -0.4037064, 0.08627451, 1, 0, 1,
-0.51974, 0.02085482, -1.474161, 0.07843138, 1, 0, 1,
-0.5175063, 1.092481, 0.02315001, 0.07450981, 1, 0, 1,
-0.5148463, 0.4378968, -1.463825, 0.06666667, 1, 0, 1,
-0.5136421, -1.465891, -3.081005, 0.0627451, 1, 0, 1,
-0.5120129, 1.184101, 0.7016494, 0.05490196, 1, 0, 1,
-0.5100081, -1.320248, -2.412561, 0.05098039, 1, 0, 1,
-0.507444, 0.2163161, -1.911263, 0.04313726, 1, 0, 1,
-0.5067803, 0.4183731, -2.094787, 0.03921569, 1, 0, 1,
-0.5058803, -0.8295444, -2.708499, 0.03137255, 1, 0, 1,
-0.5030957, -0.1763249, -1.225289, 0.02745098, 1, 0, 1,
-0.499059, -0.2952864, -2.928036, 0.01960784, 1, 0, 1,
-0.4987428, 0.7074276, -0.3318046, 0.01568628, 1, 0, 1,
-0.4901924, 0.4444037, -0.5823619, 0.007843138, 1, 0, 1,
-0.4900019, -1.822165, -3.13799, 0.003921569, 1, 0, 1,
-0.4871019, -0.2302923, -2.266937, 0, 1, 0.003921569, 1,
-0.4846393, 0.8851379, -0.1843955, 0, 1, 0.01176471, 1,
-0.4831241, -0.9870126, -3.124897, 0, 1, 0.01568628, 1,
-0.4814421, -1.30166, -4.818744, 0, 1, 0.02352941, 1,
-0.4807746, 0.2400384, -1.178845, 0, 1, 0.02745098, 1,
-0.4786302, 0.05226838, -1.863757, 0, 1, 0.03529412, 1,
-0.4737149, 0.219758, -1.429576, 0, 1, 0.03921569, 1,
-0.4712288, -1.529238, -1.391873, 0, 1, 0.04705882, 1,
-0.4639596, 0.4205168, -1.923681, 0, 1, 0.05098039, 1,
-0.4634967, -1.190332, -0.9289511, 0, 1, 0.05882353, 1,
-0.4561278, 0.2794586, -1.51177, 0, 1, 0.0627451, 1,
-0.455006, -0.8321671, -1.792876, 0, 1, 0.07058824, 1,
-0.4501379, 0.1314665, -1.786901, 0, 1, 0.07450981, 1,
-0.4447737, 0.2137841, -1.623674, 0, 1, 0.08235294, 1,
-0.4416325, -0.0897509, -1.499804, 0, 1, 0.08627451, 1,
-0.4390137, 0.2352363, -1.211099, 0, 1, 0.09411765, 1,
-0.4323734, -0.6935109, -2.475268, 0, 1, 0.1019608, 1,
-0.4320785, -0.5433283, -2.869746, 0, 1, 0.1058824, 1,
-0.4286818, -1.024686, -3.344897, 0, 1, 0.1137255, 1,
-0.4260459, 0.292708, -1.404994, 0, 1, 0.1176471, 1,
-0.4237548, 1.554415, 1.176259, 0, 1, 0.1254902, 1,
-0.4219886, -0.5748097, -0.3163522, 0, 1, 0.1294118, 1,
-0.4195244, -0.7278798, -1.129524, 0, 1, 0.1372549, 1,
-0.4192672, -0.210416, -2.887577, 0, 1, 0.1411765, 1,
-0.4190581, -1.327642, -3.619979, 0, 1, 0.1490196, 1,
-0.4186108, 0.5412143, -0.3777944, 0, 1, 0.1529412, 1,
-0.4185939, 0.3528814, -0.3123245, 0, 1, 0.1607843, 1,
-0.4143448, -0.2615998, -2.311553, 0, 1, 0.1647059, 1,
-0.4105312, -0.6677711, -3.949945, 0, 1, 0.172549, 1,
-0.4103319, 1.098577, 0.1375523, 0, 1, 0.1764706, 1,
-0.4040846, -0.3203361, -3.795788, 0, 1, 0.1843137, 1,
-0.3972663, -0.9930428, -2.974002, 0, 1, 0.1882353, 1,
-0.3909902, -0.5979259, -3.73398, 0, 1, 0.1960784, 1,
-0.3891313, -0.4987006, -3.422175, 0, 1, 0.2039216, 1,
-0.3879337, 0.6463874, 0.7394495, 0, 1, 0.2078431, 1,
-0.3877601, -0.5153182, -2.306391, 0, 1, 0.2156863, 1,
-0.3869533, 0.454014, -0.02938611, 0, 1, 0.2196078, 1,
-0.3830794, -0.519256, -3.941031, 0, 1, 0.227451, 1,
-0.3799491, 0.9330698, 0.1673517, 0, 1, 0.2313726, 1,
-0.3798344, 1.47112, 0.08107426, 0, 1, 0.2392157, 1,
-0.3786889, -2.247933, -1.276294, 0, 1, 0.2431373, 1,
-0.3769181, -0.2729146, -3.66515, 0, 1, 0.2509804, 1,
-0.3760485, -0.9732456, -3.963616, 0, 1, 0.254902, 1,
-0.3730855, -0.5817619, -2.591484, 0, 1, 0.2627451, 1,
-0.3728381, -0.5547832, -3.314561, 0, 1, 0.2666667, 1,
-0.3723178, 0.5195745, -0.4032735, 0, 1, 0.2745098, 1,
-0.3723046, 0.5346523, -1.577995, 0, 1, 0.2784314, 1,
-0.3708079, 1.352595, -0.03935252, 0, 1, 0.2862745, 1,
-0.3692032, 0.5002342, 0.8352076, 0, 1, 0.2901961, 1,
-0.3687708, -0.1011042, -2.803395, 0, 1, 0.2980392, 1,
-0.3687515, 1.433786, 1.571208, 0, 1, 0.3058824, 1,
-0.3594163, 1.837752, -0.3644514, 0, 1, 0.3098039, 1,
-0.3551708, -0.2036885, 0.2549113, 0, 1, 0.3176471, 1,
-0.3546259, -1.22823, -3.213979, 0, 1, 0.3215686, 1,
-0.3491782, 1.947293, 1.511573, 0, 1, 0.3294118, 1,
-0.3482967, 0.5669131, -0.2002627, 0, 1, 0.3333333, 1,
-0.3453095, 0.09034589, -2.879019, 0, 1, 0.3411765, 1,
-0.3396163, 0.6400183, -1.531493, 0, 1, 0.345098, 1,
-0.3383435, 2.15488, -0.2404496, 0, 1, 0.3529412, 1,
-0.3339062, 0.5403416, 1.08785, 0, 1, 0.3568628, 1,
-0.3287105, -0.3874244, -3.433858, 0, 1, 0.3647059, 1,
-0.3230421, 0.8352437, -1.959962, 0, 1, 0.3686275, 1,
-0.3214893, 0.009051233, -2.45871, 0, 1, 0.3764706, 1,
-0.3201069, -0.7918868, -2.197316, 0, 1, 0.3803922, 1,
-0.316046, 1.844799, 1.138527, 0, 1, 0.3882353, 1,
-0.3150488, 0.08695652, 0.7300158, 0, 1, 0.3921569, 1,
-0.3138641, -0.3133135, -1.738289, 0, 1, 0.4, 1,
-0.3133736, 0.2933302, -1.497764, 0, 1, 0.4078431, 1,
-0.3126768, -0.8490146, -4.125999, 0, 1, 0.4117647, 1,
-0.3098938, -0.9668104, -2.132466, 0, 1, 0.4196078, 1,
-0.3055245, -0.2368442, -2.059751, 0, 1, 0.4235294, 1,
-0.3045605, 1.134879, 0.4190163, 0, 1, 0.4313726, 1,
-0.3041989, 1.789924, 0.2242535, 0, 1, 0.4352941, 1,
-0.302312, -0.7587066, -4.266338, 0, 1, 0.4431373, 1,
-0.2957839, 0.2761904, -0.9230413, 0, 1, 0.4470588, 1,
-0.2932203, -0.5184783, -0.3836777, 0, 1, 0.454902, 1,
-0.2888776, -0.06850121, -2.385815, 0, 1, 0.4588235, 1,
-0.2839953, 0.629608, -1.118486, 0, 1, 0.4666667, 1,
-0.2769296, 0.2113253, -2.451313, 0, 1, 0.4705882, 1,
-0.2768109, 2.169178, -0.6819587, 0, 1, 0.4784314, 1,
-0.2749436, -1.488603, -3.347353, 0, 1, 0.4823529, 1,
-0.2734758, -0.2158066, -1.980332, 0, 1, 0.4901961, 1,
-0.27275, 0.7412173, 0.3240858, 0, 1, 0.4941176, 1,
-0.272379, -1.156641, -3.420766, 0, 1, 0.5019608, 1,
-0.2655264, 2.54225, 0.7498561, 0, 1, 0.509804, 1,
-0.2597951, -0.01290665, -3.664783, 0, 1, 0.5137255, 1,
-0.2555355, 0.1011579, -0.8397158, 0, 1, 0.5215687, 1,
-0.2550297, 0.3801059, -0.0006823221, 0, 1, 0.5254902, 1,
-0.2543899, 0.3585182, 0.6909446, 0, 1, 0.5333334, 1,
-0.2533769, 0.08106074, -1.505934, 0, 1, 0.5372549, 1,
-0.2506381, 0.1398472, -1.282569, 0, 1, 0.5450981, 1,
-0.2497939, 0.6612996, -1.062892, 0, 1, 0.5490196, 1,
-0.2475741, 0.08111684, 0.03087111, 0, 1, 0.5568628, 1,
-0.2460357, -0.7172239, -2.778291, 0, 1, 0.5607843, 1,
-0.2460279, -1.139578, -4.475841, 0, 1, 0.5686275, 1,
-0.2446901, -0.830641, -3.355749, 0, 1, 0.572549, 1,
-0.2444511, 0.9910353, -0.7000257, 0, 1, 0.5803922, 1,
-0.2399791, 2.045519, 0.5193589, 0, 1, 0.5843138, 1,
-0.239692, 1.148201, 0.6890285, 0, 1, 0.5921569, 1,
-0.2374543, 0.0563636, -1.971435, 0, 1, 0.5960785, 1,
-0.237088, -0.3257914, -2.841472, 0, 1, 0.6039216, 1,
-0.2367975, -0.5332865, -2.401672, 0, 1, 0.6117647, 1,
-0.2365771, 0.860405, -0.7772668, 0, 1, 0.6156863, 1,
-0.236059, -0.8118451, -3.926866, 0, 1, 0.6235294, 1,
-0.2323085, 0.3794607, -2.547896, 0, 1, 0.627451, 1,
-0.2305864, -1.603052, -4.482579, 0, 1, 0.6352941, 1,
-0.2269769, -0.06581455, -0.9155492, 0, 1, 0.6392157, 1,
-0.2265731, -0.4073013, -2.577688, 0, 1, 0.6470588, 1,
-0.2255476, -1.859611, -4.572651, 0, 1, 0.6509804, 1,
-0.2247474, -0.9203648, -2.243578, 0, 1, 0.6588235, 1,
-0.2219167, -0.7154608, -5.041801, 0, 1, 0.6627451, 1,
-0.2208967, -0.3810029, -1.600504, 0, 1, 0.6705883, 1,
-0.2195145, -0.8115112, -1.333063, 0, 1, 0.6745098, 1,
-0.2189452, -0.9981583, -2.241869, 0, 1, 0.682353, 1,
-0.2182151, 0.5960323, -0.6743302, 0, 1, 0.6862745, 1,
-0.2164254, -0.805747, -1.893342, 0, 1, 0.6941177, 1,
-0.2069555, 1.476012, -0.6462972, 0, 1, 0.7019608, 1,
-0.2038105, 0.1053724, -1.991693, 0, 1, 0.7058824, 1,
-0.1921166, -1.025606, -3.466368, 0, 1, 0.7137255, 1,
-0.1879234, -0.2063515, -0.1265702, 0, 1, 0.7176471, 1,
-0.1860512, -0.3585366, -0.4498322, 0, 1, 0.7254902, 1,
-0.1799482, 0.3420439, -1.360472, 0, 1, 0.7294118, 1,
-0.1783018, 0.1797983, -0.4837566, 0, 1, 0.7372549, 1,
-0.1760993, -0.9362651, -3.023523, 0, 1, 0.7411765, 1,
-0.1759633, -1.059415, -1.80814, 0, 1, 0.7490196, 1,
-0.1723913, 0.1283256, -3.825705, 0, 1, 0.7529412, 1,
-0.1681432, -0.6771573, -3.89443, 0, 1, 0.7607843, 1,
-0.16467, 1.863603, 0.01709647, 0, 1, 0.7647059, 1,
-0.1588421, 1.409562, 1.20762, 0, 1, 0.772549, 1,
-0.1534848, 0.96492, -0.4292052, 0, 1, 0.7764706, 1,
-0.1519431, -1.125107, -3.907002, 0, 1, 0.7843137, 1,
-0.1503778, 1.095033, 0.6479723, 0, 1, 0.7882353, 1,
-0.1399928, 0.5807316, -0.379449, 0, 1, 0.7960784, 1,
-0.1360203, 0.5889206, -1.642889, 0, 1, 0.8039216, 1,
-0.1284576, 0.08126228, -1.139285, 0, 1, 0.8078431, 1,
-0.1247449, 0.07763589, -1.91309, 0, 1, 0.8156863, 1,
-0.1215311, 0.2639103, -0.5841298, 0, 1, 0.8196079, 1,
-0.119328, -1.103282, -2.052733, 0, 1, 0.827451, 1,
-0.1186548, -0.6838437, -1.478665, 0, 1, 0.8313726, 1,
-0.1161036, -0.4930997, -4.113225, 0, 1, 0.8392157, 1,
-0.1131772, -2.733443, -4.825862, 0, 1, 0.8431373, 1,
-0.1130328, 0.7624149, 0.7282954, 0, 1, 0.8509804, 1,
-0.1121614, 1.615495, -0.5246426, 0, 1, 0.854902, 1,
-0.1112654, 0.3814301, -0.6759914, 0, 1, 0.8627451, 1,
-0.1084547, -1.57792, -3.051554, 0, 1, 0.8666667, 1,
-0.1066871, 1.899841, 0.8514749, 0, 1, 0.8745098, 1,
-0.1028509, -1.981829, -1.259384, 0, 1, 0.8784314, 1,
-0.1027405, 1.350881, 0.1311603, 0, 1, 0.8862745, 1,
-0.09852619, 0.002498997, -0.784116, 0, 1, 0.8901961, 1,
-0.0892456, 0.3731028, -0.4688081, 0, 1, 0.8980392, 1,
-0.0827295, -0.4424944, -2.146374, 0, 1, 0.9058824, 1,
-0.08122078, -1.294324, -3.181762, 0, 1, 0.9098039, 1,
-0.07684709, -0.01569066, -2.523606, 0, 1, 0.9176471, 1,
-0.07569096, 1.801968, -0.1075625, 0, 1, 0.9215686, 1,
-0.07549667, 0.2388715, -0.9991709, 0, 1, 0.9294118, 1,
-0.07192218, -0.5886292, -3.969254, 0, 1, 0.9333333, 1,
-0.07178842, -0.07421588, -2.120912, 0, 1, 0.9411765, 1,
-0.07069284, -0.3714462, -2.474175, 0, 1, 0.945098, 1,
-0.07064465, 0.4009015, -1.475946, 0, 1, 0.9529412, 1,
-0.06916996, 1.226351, -0.300512, 0, 1, 0.9568627, 1,
-0.06775302, 0.5985746, -0.1092735, 0, 1, 0.9647059, 1,
-0.06601136, 2.127949, -1.325191, 0, 1, 0.9686275, 1,
-0.06553055, 0.6237137, 0.4692959, 0, 1, 0.9764706, 1,
-0.05974855, -0.2685319, -1.724177, 0, 1, 0.9803922, 1,
-0.05565947, 0.5210448, 0.3230468, 0, 1, 0.9882353, 1,
-0.05519957, 1.313608, 1.993195, 0, 1, 0.9921569, 1,
-0.05379885, 0.3541789, -2.149956, 0, 1, 1, 1,
-0.05146391, -1.13658, -4.39548, 0, 0.9921569, 1, 1,
-0.04919885, 0.6081988, -1.14172, 0, 0.9882353, 1, 1,
-0.04776661, 0.8962494, -1.169213, 0, 0.9803922, 1, 1,
-0.04640533, -1.481122, -3.944408, 0, 0.9764706, 1, 1,
-0.0429391, 1.374665, 1.408232, 0, 0.9686275, 1, 1,
-0.04232134, 0.4420036, 0.7623899, 0, 0.9647059, 1, 1,
-0.04204408, 0.4073294, 0.4816018, 0, 0.9568627, 1, 1,
-0.04028144, 0.2238156, -0.8781341, 0, 0.9529412, 1, 1,
-0.03816485, 0.8835907, -0.6948053, 0, 0.945098, 1, 1,
-0.03271487, -1.716406, -3.370851, 0, 0.9411765, 1, 1,
-0.0317326, -1.069631, -2.443478, 0, 0.9333333, 1, 1,
-0.02718782, -0.5118868, -1.713694, 0, 0.9294118, 1, 1,
-0.02628434, 0.870226, 1.243943, 0, 0.9215686, 1, 1,
-0.02544123, -0.5165824, -3.498341, 0, 0.9176471, 1, 1,
-0.02400436, 0.1339483, 0.3403699, 0, 0.9098039, 1, 1,
-0.02317181, -0.5800511, -2.01922, 0, 0.9058824, 1, 1,
-0.02264803, 1.329332, -0.01176632, 0, 0.8980392, 1, 1,
-0.01583187, 0.5520312, -0.5616015, 0, 0.8901961, 1, 1,
-0.01500444, 0.2808363, -0.1701068, 0, 0.8862745, 1, 1,
-0.01465648, 0.9335425, -0.7355435, 0, 0.8784314, 1, 1,
-0.01178107, -0.2112203, -3.978283, 0, 0.8745098, 1, 1,
-0.01130835, 0.151942, 2.416486, 0, 0.8666667, 1, 1,
-0.01080603, 0.4354143, -0.6725107, 0, 0.8627451, 1, 1,
-0.01064791, 0.4335276, 1.333039, 0, 0.854902, 1, 1,
-0.008174698, -0.1167974, -2.393945, 0, 0.8509804, 1, 1,
-0.00327159, 0.2869491, 1.747426, 0, 0.8431373, 1, 1,
-0.002642416, -0.9541165, -3.292623, 0, 0.8392157, 1, 1,
0.0002368155, 0.3046672, 1.049451, 0, 0.8313726, 1, 1,
0.007496384, 0.4646949, -0.9546347, 0, 0.827451, 1, 1,
0.01140375, 0.2058794, 1.03351, 0, 0.8196079, 1, 1,
0.0128087, -0.5870447, 2.352886, 0, 0.8156863, 1, 1,
0.01317724, -0.7602424, 1.206445, 0, 0.8078431, 1, 1,
0.01691633, -0.4012448, 2.89579, 0, 0.8039216, 1, 1,
0.02110807, -0.4254086, 3.166565, 0, 0.7960784, 1, 1,
0.02264076, -0.4357117, 1.540449, 0, 0.7882353, 1, 1,
0.0228195, 0.2782135, 1.349767, 0, 0.7843137, 1, 1,
0.02319436, 0.7390553, -1.109324, 0, 0.7764706, 1, 1,
0.02522219, -1.572219, 4.024781, 0, 0.772549, 1, 1,
0.02672354, -0.2006243, 2.619707, 0, 0.7647059, 1, 1,
0.02791139, 1.254622, 1.234253, 0, 0.7607843, 1, 1,
0.03149274, 0.7808424, 1.35302, 0, 0.7529412, 1, 1,
0.03307572, 1.975981, -0.7884369, 0, 0.7490196, 1, 1,
0.03990605, 0.9799661, 0.3271101, 0, 0.7411765, 1, 1,
0.04898361, 1.705209, 0.1765707, 0, 0.7372549, 1, 1,
0.05905821, 0.667619, 0.1145345, 0, 0.7294118, 1, 1,
0.05933731, -0.02045975, 1.406897, 0, 0.7254902, 1, 1,
0.06161675, 1.249961, 0.5478743, 0, 0.7176471, 1, 1,
0.06253378, -0.9301059, 2.928742, 0, 0.7137255, 1, 1,
0.0682295, 0.3463466, 0.5238805, 0, 0.7058824, 1, 1,
0.06860565, 0.5161372, 0.2215568, 0, 0.6980392, 1, 1,
0.06863607, -1.043, 2.443942, 0, 0.6941177, 1, 1,
0.06959601, -0.04763835, 3.84651, 0, 0.6862745, 1, 1,
0.0757644, -0.06711359, 2.335323, 0, 0.682353, 1, 1,
0.07615189, -0.2124287, 1.752424, 0, 0.6745098, 1, 1,
0.07994652, -0.02636785, 1.887845, 0, 0.6705883, 1, 1,
0.08504589, -1.195765, 2.738925, 0, 0.6627451, 1, 1,
0.08574939, -0.1454641, 1.970648, 0, 0.6588235, 1, 1,
0.08729552, 0.5696255, -0.6211553, 0, 0.6509804, 1, 1,
0.08734391, 1.256253, -0.2735945, 0, 0.6470588, 1, 1,
0.09388421, -0.3601302, 2.682314, 0, 0.6392157, 1, 1,
0.107438, 0.9022645, 0.1073248, 0, 0.6352941, 1, 1,
0.1104971, -1.635146, 3.185595, 0, 0.627451, 1, 1,
0.1107539, 0.7750268, 0.1019367, 0, 0.6235294, 1, 1,
0.1107781, -0.1973252, 3.168019, 0, 0.6156863, 1, 1,
0.1108176, -2.395468, 1.257716, 0, 0.6117647, 1, 1,
0.1131592, -0.09273461, 2.395934, 0, 0.6039216, 1, 1,
0.1141855, -0.01289131, 2.117131, 0, 0.5960785, 1, 1,
0.1170907, -0.6035395, 1.910497, 0, 0.5921569, 1, 1,
0.1173009, 0.6247305, -0.02590487, 0, 0.5843138, 1, 1,
0.1210772, 0.1330108, 1.791062, 0, 0.5803922, 1, 1,
0.1215259, -0.4545518, 2.299235, 0, 0.572549, 1, 1,
0.1220657, 0.2183999, -0.1750925, 0, 0.5686275, 1, 1,
0.1228191, 0.1676233, 0.2454112, 0, 0.5607843, 1, 1,
0.1257994, -0.4073732, 3.423598, 0, 0.5568628, 1, 1,
0.1272074, -0.4405666, 2.941721, 0, 0.5490196, 1, 1,
0.1277321, 0.8056133, -0.9544622, 0, 0.5450981, 1, 1,
0.1300568, 0.3961491, -0.7740176, 0, 0.5372549, 1, 1,
0.1305185, 0.1926876, -1.610716, 0, 0.5333334, 1, 1,
0.1306103, -0.5598055, 3.672848, 0, 0.5254902, 1, 1,
0.1307362, -0.1921715, 3.065739, 0, 0.5215687, 1, 1,
0.1412029, 0.7256662, 0.7849573, 0, 0.5137255, 1, 1,
0.1413601, -0.4441769, 3.236985, 0, 0.509804, 1, 1,
0.1423946, -0.1762688, 2.915812, 0, 0.5019608, 1, 1,
0.1434049, 0.03852284, 0.3044258, 0, 0.4941176, 1, 1,
0.1466835, -0.4424137, 3.484267, 0, 0.4901961, 1, 1,
0.1536511, 0.717774, -0.7859483, 0, 0.4823529, 1, 1,
0.1553919, -0.2830206, 2.079141, 0, 0.4784314, 1, 1,
0.1576962, -1.376305, 3.698853, 0, 0.4705882, 1, 1,
0.1592597, -0.242987, 1.54024, 0, 0.4666667, 1, 1,
0.1594349, 1.083747, -0.5415792, 0, 0.4588235, 1, 1,
0.162314, -0.5127597, 2.911671, 0, 0.454902, 1, 1,
0.165993, 0.2485954, 2.044573, 0, 0.4470588, 1, 1,
0.1664591, -0.001278223, 2.024464, 0, 0.4431373, 1, 1,
0.1675456, 0.7745126, -0.9760971, 0, 0.4352941, 1, 1,
0.1880897, 1.930908, 0.1539872, 0, 0.4313726, 1, 1,
0.1883765, 0.2292988, 0.5241627, 0, 0.4235294, 1, 1,
0.1893674, 0.9813771, -0.6767992, 0, 0.4196078, 1, 1,
0.1944907, -0.01706792, 1.78495, 0, 0.4117647, 1, 1,
0.198333, 1.231705, 1.238906, 0, 0.4078431, 1, 1,
0.2058258, -2.156541, 3.745886, 0, 0.4, 1, 1,
0.2080917, 1.213764, 1.725538, 0, 0.3921569, 1, 1,
0.2085914, 0.2275282, 1.06141, 0, 0.3882353, 1, 1,
0.2108516, -0.656863, 2.988724, 0, 0.3803922, 1, 1,
0.2185844, -0.2736826, 1.876813, 0, 0.3764706, 1, 1,
0.2235585, -0.3397407, 3.57168, 0, 0.3686275, 1, 1,
0.2255613, -0.365066, 4.176198, 0, 0.3647059, 1, 1,
0.2273766, -0.09567603, 1.647409, 0, 0.3568628, 1, 1,
0.2285565, 0.09291986, -0.3164006, 0, 0.3529412, 1, 1,
0.2446514, 0.2537055, 0.8031635, 0, 0.345098, 1, 1,
0.2496106, 1.461736, -0.7666259, 0, 0.3411765, 1, 1,
0.2539474, -1.633503, 5.108052, 0, 0.3333333, 1, 1,
0.2561442, 1.535626, 0.987963, 0, 0.3294118, 1, 1,
0.2570305, -1.049442, 1.692811, 0, 0.3215686, 1, 1,
0.2580941, 2.010287, -0.6426411, 0, 0.3176471, 1, 1,
0.2640768, -0.4553488, 3.364795, 0, 0.3098039, 1, 1,
0.2758934, -1.610296, 3.779492, 0, 0.3058824, 1, 1,
0.2774727, 0.5105485, 2.137466, 0, 0.2980392, 1, 1,
0.2801666, -0.4115321, 4.089137, 0, 0.2901961, 1, 1,
0.2876644, -0.1501056, 2.114241, 0, 0.2862745, 1, 1,
0.2899607, -1.899626, 4.015375, 0, 0.2784314, 1, 1,
0.303086, 0.218262, 0.8940516, 0, 0.2745098, 1, 1,
0.3033177, -0.9418489, 1.95546, 0, 0.2666667, 1, 1,
0.3067225, -1.160254, 2.378837, 0, 0.2627451, 1, 1,
0.3162421, -1.994588, 1.585611, 0, 0.254902, 1, 1,
0.3184637, 0.9772027, 0.5325201, 0, 0.2509804, 1, 1,
0.3207625, -0.5745429, 0.4942269, 0, 0.2431373, 1, 1,
0.3231362, -0.2503174, 2.973392, 0, 0.2392157, 1, 1,
0.3238641, 0.1067984, 1.3718, 0, 0.2313726, 1, 1,
0.324997, -0.9368136, 1.207576, 0, 0.227451, 1, 1,
0.3297892, 0.3107705, -0.369525, 0, 0.2196078, 1, 1,
0.3346381, -0.820034, 3.479282, 0, 0.2156863, 1, 1,
0.3392559, -0.4473252, 1.90167, 0, 0.2078431, 1, 1,
0.3427787, 0.2066385, 1.988213, 0, 0.2039216, 1, 1,
0.3513649, -0.4657997, 2.451014, 0, 0.1960784, 1, 1,
0.3523825, 0.5095764, 0.1404142, 0, 0.1882353, 1, 1,
0.3527402, 0.4868729, -0.4710067, 0, 0.1843137, 1, 1,
0.3592111, 0.289735, -0.3550876, 0, 0.1764706, 1, 1,
0.3633555, -0.5037451, 0.4842407, 0, 0.172549, 1, 1,
0.3652623, -0.1664446, 3.172928, 0, 0.1647059, 1, 1,
0.3684062, 0.8246112, 1.029833, 0, 0.1607843, 1, 1,
0.3686652, -0.4797923, 2.188757, 0, 0.1529412, 1, 1,
0.3689218, 0.5189411, 1.901788, 0, 0.1490196, 1, 1,
0.3731277, 0.603591, 1.313157, 0, 0.1411765, 1, 1,
0.3740182, 0.7405187, -0.7173188, 0, 0.1372549, 1, 1,
0.3753933, -1.635728, 2.596416, 0, 0.1294118, 1, 1,
0.3757755, -0.9964046, 2.564119, 0, 0.1254902, 1, 1,
0.376949, 0.7582294, 0.4659414, 0, 0.1176471, 1, 1,
0.3804186, 1.153256, 2.210732, 0, 0.1137255, 1, 1,
0.4003792, -0.2230709, 2.410388, 0, 0.1058824, 1, 1,
0.4031027, -1.43335, 2.554544, 0, 0.09803922, 1, 1,
0.4035231, 0.9219975, 0.9080598, 0, 0.09411765, 1, 1,
0.4043313, 1.310182, 0.6875998, 0, 0.08627451, 1, 1,
0.4052752, -0.7314059, 3.395279, 0, 0.08235294, 1, 1,
0.405901, 0.1900004, 2.078071, 0, 0.07450981, 1, 1,
0.4077288, 1.230218, 0.07416125, 0, 0.07058824, 1, 1,
0.4081012, -1.120153, 5.356622, 0, 0.0627451, 1, 1,
0.4081287, 0.3724256, 0.3925363, 0, 0.05882353, 1, 1,
0.4095954, 1.229263, -0.6465372, 0, 0.05098039, 1, 1,
0.4114147, 1.020297, 0.4001272, 0, 0.04705882, 1, 1,
0.4133232, 0.5146399, 1.896344, 0, 0.03921569, 1, 1,
0.4142668, 0.2886947, 0.3091085, 0, 0.03529412, 1, 1,
0.4164324, -0.05030803, 0.782482, 0, 0.02745098, 1, 1,
0.4245492, -0.6294089, 2.017351, 0, 0.02352941, 1, 1,
0.4262319, -0.4575296, 2.238682, 0, 0.01568628, 1, 1,
0.4263338, 0.4520265, 0.3410605, 0, 0.01176471, 1, 1,
0.4284199, -0.3635805, 2.475095, 0, 0.003921569, 1, 1,
0.4328787, -0.3086675, 0.4879309, 0.003921569, 0, 1, 1,
0.4342509, -0.9535763, 3.325368, 0.007843138, 0, 1, 1,
0.4383722, -0.4840766, 1.879663, 0.01568628, 0, 1, 1,
0.4394575, -1.764418, 2.243361, 0.01960784, 0, 1, 1,
0.4525851, -0.1475575, 1.994366, 0.02745098, 0, 1, 1,
0.4536935, 1.329002, 0.6777587, 0.03137255, 0, 1, 1,
0.4537547, -0.5051247, 1.830358, 0.03921569, 0, 1, 1,
0.4539832, -0.3765869, 3.221948, 0.04313726, 0, 1, 1,
0.4619639, -2.260225, 2.778622, 0.05098039, 0, 1, 1,
0.4623512, -1.461408, 4.122438, 0.05490196, 0, 1, 1,
0.469774, 1.106623, 1.099995, 0.0627451, 0, 1, 1,
0.4724214, -0.585911, 1.828443, 0.06666667, 0, 1, 1,
0.4729716, 1.484118, -0.198936, 0.07450981, 0, 1, 1,
0.4781539, 0.828298, 1.247645, 0.07843138, 0, 1, 1,
0.4787267, 1.7485, 2.236152, 0.08627451, 0, 1, 1,
0.480552, 1.014153, 0.1321844, 0.09019608, 0, 1, 1,
0.4855685, -1.380023, 1.830542, 0.09803922, 0, 1, 1,
0.4950345, 1.512434, 0.6690001, 0.1058824, 0, 1, 1,
0.4992662, -0.9311072, 0.5671946, 0.1098039, 0, 1, 1,
0.503724, -0.6898065, 2.114974, 0.1176471, 0, 1, 1,
0.504021, 0.3244486, 0.2253062, 0.1215686, 0, 1, 1,
0.5110034, 1.629199, 0.3075406, 0.1294118, 0, 1, 1,
0.5141466, -0.01982471, 0.3673194, 0.1333333, 0, 1, 1,
0.5214113, -0.5417968, 4.420073, 0.1411765, 0, 1, 1,
0.5248855, 1.100841, -1.154968, 0.145098, 0, 1, 1,
0.5283788, -0.5897294, 2.920697, 0.1529412, 0, 1, 1,
0.5288671, -1.224184, 2.556107, 0.1568628, 0, 1, 1,
0.5290315, 0.9126059, 0.6799163, 0.1647059, 0, 1, 1,
0.5368925, -0.2412059, -0.2001684, 0.1686275, 0, 1, 1,
0.5377987, 0.3974546, 0.9651975, 0.1764706, 0, 1, 1,
0.5383955, 1.079903, 0.8348679, 0.1803922, 0, 1, 1,
0.5385928, -1.291828, 3.714015, 0.1882353, 0, 1, 1,
0.5443391, 2.645188, 1.012007, 0.1921569, 0, 1, 1,
0.5456344, -0.8915837, 3.48377, 0.2, 0, 1, 1,
0.5459949, -0.4310352, 0.7118578, 0.2078431, 0, 1, 1,
0.5488962, -1.740758, 3.433687, 0.2117647, 0, 1, 1,
0.5510148, 0.06464264, 0.8951141, 0.2196078, 0, 1, 1,
0.5516922, -0.2096621, 2.300915, 0.2235294, 0, 1, 1,
0.5520799, -1.275007, 4.105855, 0.2313726, 0, 1, 1,
0.5527259, -0.09074821, 2.347992, 0.2352941, 0, 1, 1,
0.5552827, -0.2146496, 1.725347, 0.2431373, 0, 1, 1,
0.5582106, 0.1305632, 1.029834, 0.2470588, 0, 1, 1,
0.5586786, 1.364366, 1.289367, 0.254902, 0, 1, 1,
0.5640085, 0.2652724, 1.788898, 0.2588235, 0, 1, 1,
0.5662516, -0.9625942, 3.389296, 0.2666667, 0, 1, 1,
0.5717431, 0.04098215, 1.088189, 0.2705882, 0, 1, 1,
0.5733747, 0.6467246, 1.239717, 0.2784314, 0, 1, 1,
0.5742996, -0.9541086, 2.26117, 0.282353, 0, 1, 1,
0.5743913, 0.1548784, 1.224256, 0.2901961, 0, 1, 1,
0.5778252, 0.8764382, 1.521948, 0.2941177, 0, 1, 1,
0.5790096, -0.9781153, 2.899564, 0.3019608, 0, 1, 1,
0.5829321, 0.7024435, -0.6033495, 0.3098039, 0, 1, 1,
0.5914956, -0.6234662, 2.072567, 0.3137255, 0, 1, 1,
0.5940506, 1.387424, 0.3534135, 0.3215686, 0, 1, 1,
0.5945001, 1.372959, 0.282551, 0.3254902, 0, 1, 1,
0.595803, 0.8775795, 0.3711613, 0.3333333, 0, 1, 1,
0.6004972, 0.7984943, 0.9270734, 0.3372549, 0, 1, 1,
0.6031035, 0.4271329, 1.290425, 0.345098, 0, 1, 1,
0.6069264, 1.559919, 0.3536159, 0.3490196, 0, 1, 1,
0.6076124, 0.207826, 2.047314, 0.3568628, 0, 1, 1,
0.6100666, 0.1812663, 1.399687, 0.3607843, 0, 1, 1,
0.6103221, -0.8324702, 3.637729, 0.3686275, 0, 1, 1,
0.6120835, 1.870807, 0.664538, 0.372549, 0, 1, 1,
0.6123841, -1.076157, 2.035818, 0.3803922, 0, 1, 1,
0.6153792, 0.6024631, -0.003840719, 0.3843137, 0, 1, 1,
0.6174409, 0.4767438, 2.670946, 0.3921569, 0, 1, 1,
0.6186078, 0.4214465, -0.6718999, 0.3960784, 0, 1, 1,
0.6190696, 1.036661, 0.3187611, 0.4039216, 0, 1, 1,
0.6194246, -0.2940438, 1.755881, 0.4117647, 0, 1, 1,
0.6242545, -1.276981, 0.9230414, 0.4156863, 0, 1, 1,
0.6252916, -0.8376784, 1.221296, 0.4235294, 0, 1, 1,
0.6305116, -0.7881484, 1.710088, 0.427451, 0, 1, 1,
0.6345555, -0.8850324, 2.909863, 0.4352941, 0, 1, 1,
0.6357486, 0.8023072, 0.3100584, 0.4392157, 0, 1, 1,
0.6380555, 0.5374412, 0.8153022, 0.4470588, 0, 1, 1,
0.638245, -0.880617, 0.875232, 0.4509804, 0, 1, 1,
0.6397586, 1.372877, -0.6223118, 0.4588235, 0, 1, 1,
0.6418504, -0.6947533, 2.132192, 0.4627451, 0, 1, 1,
0.6482191, 1.369926, 1.898843, 0.4705882, 0, 1, 1,
0.6484891, 1.562145, 1.713593, 0.4745098, 0, 1, 1,
0.6500629, 0.4875627, -0.02243573, 0.4823529, 0, 1, 1,
0.6547469, -1.314387, 2.896543, 0.4862745, 0, 1, 1,
0.6559646, 1.343636, 1.442594, 0.4941176, 0, 1, 1,
0.6591154, 0.02856321, 1.120573, 0.5019608, 0, 1, 1,
0.6591839, 1.279721, 0.5368596, 0.5058824, 0, 1, 1,
0.6653367, -0.1488726, 0.01839424, 0.5137255, 0, 1, 1,
0.6655149, -0.3176721, 1.449556, 0.5176471, 0, 1, 1,
0.6697129, 1.055805, 2.195484, 0.5254902, 0, 1, 1,
0.6718125, -0.343005, 2.52103, 0.5294118, 0, 1, 1,
0.6822153, -0.6012794, 4.879402, 0.5372549, 0, 1, 1,
0.6831415, 2.507625, 2.161869, 0.5411765, 0, 1, 1,
0.6857298, -0.5970414, 3.969477, 0.5490196, 0, 1, 1,
0.6883086, 1.979502, -2.019814, 0.5529412, 0, 1, 1,
0.6907293, -0.6167374, 3.398132, 0.5607843, 0, 1, 1,
0.6918819, 1.240797, 1.513981, 0.5647059, 0, 1, 1,
0.6919784, -1.646122, 2.201724, 0.572549, 0, 1, 1,
0.692987, -1.049572, 1.75067, 0.5764706, 0, 1, 1,
0.6968319, -0.1724206, 2.80921, 0.5843138, 0, 1, 1,
0.6971656, -0.4108697, 2.691088, 0.5882353, 0, 1, 1,
0.6991308, -0.08692362, 0.3231575, 0.5960785, 0, 1, 1,
0.7001073, -0.4017419, 1.441802, 0.6039216, 0, 1, 1,
0.7098019, 0.992703, 0.9436085, 0.6078432, 0, 1, 1,
0.7110081, 0.7983157, 0.7339624, 0.6156863, 0, 1, 1,
0.712783, 1.952495, -2.263962, 0.6196079, 0, 1, 1,
0.7187536, -1.891378, 1.23259, 0.627451, 0, 1, 1,
0.7277771, 0.284434, 1.10903, 0.6313726, 0, 1, 1,
0.7328582, -0.407207, 1.089628, 0.6392157, 0, 1, 1,
0.7331437, -1.137949, 1.777577, 0.6431373, 0, 1, 1,
0.734322, -0.6661445, 2.11295, 0.6509804, 0, 1, 1,
0.7358362, 0.1019432, 2.055392, 0.654902, 0, 1, 1,
0.7398819, 0.08700392, 1.055396, 0.6627451, 0, 1, 1,
0.7421235, -2.335622, 3.853616, 0.6666667, 0, 1, 1,
0.7456409, 1.057699, 0.9512693, 0.6745098, 0, 1, 1,
0.7474421, 0.00415458, 1.650993, 0.6784314, 0, 1, 1,
0.7495312, 0.8500292, 0.8438413, 0.6862745, 0, 1, 1,
0.7498997, -0.5707765, 2.583461, 0.6901961, 0, 1, 1,
0.7511269, 0.2538302, 1.566582, 0.6980392, 0, 1, 1,
0.757201, 1.130529, 2.46479, 0.7058824, 0, 1, 1,
0.7635073, 0.05708573, 0.4011854, 0.7098039, 0, 1, 1,
0.7645246, -0.1517162, 2.545071, 0.7176471, 0, 1, 1,
0.7733735, -0.5878754, 2.266539, 0.7215686, 0, 1, 1,
0.7765586, -1.433256, 0.5579206, 0.7294118, 0, 1, 1,
0.7824516, 1.207566, 0.8117529, 0.7333333, 0, 1, 1,
0.7832001, -0.6263961, 2.2887, 0.7411765, 0, 1, 1,
0.7874494, 1.314087, -0.1102542, 0.7450981, 0, 1, 1,
0.7879459, -1.320998, 2.894066, 0.7529412, 0, 1, 1,
0.7936261, 0.5302125, 3.478487, 0.7568628, 0, 1, 1,
0.7956901, -1.13811, 1.398664, 0.7647059, 0, 1, 1,
0.7984834, 1.039653, -0.4669695, 0.7686275, 0, 1, 1,
0.8162636, -0.41591, 1.085763, 0.7764706, 0, 1, 1,
0.8210282, -1.207289, 1.854656, 0.7803922, 0, 1, 1,
0.8223078, 0.6381791, 1.528265, 0.7882353, 0, 1, 1,
0.8290336, 0.5920467, 1.781839, 0.7921569, 0, 1, 1,
0.8293974, 0.2359625, 2.060793, 0.8, 0, 1, 1,
0.8448597, -0.669776, 1.898959, 0.8078431, 0, 1, 1,
0.8478554, -1.165944, 3.299897, 0.8117647, 0, 1, 1,
0.8479958, 1.21064, 1.782809, 0.8196079, 0, 1, 1,
0.8517171, 1.055931, -0.05413528, 0.8235294, 0, 1, 1,
0.8531319, -0.7781626, 2.707857, 0.8313726, 0, 1, 1,
0.8545251, 0.5248979, 0.1688977, 0.8352941, 0, 1, 1,
0.8545911, -0.7459043, 1.993143, 0.8431373, 0, 1, 1,
0.854911, -0.7743403, 3.055784, 0.8470588, 0, 1, 1,
0.8580675, 0.6479878, 2.201515, 0.854902, 0, 1, 1,
0.8598495, -0.4668413, 1.138724, 0.8588235, 0, 1, 1,
0.8659434, 0.6948471, 0.02289939, 0.8666667, 0, 1, 1,
0.8663558, 1.190313, 1.528863, 0.8705882, 0, 1, 1,
0.868507, 1.238314, 0.2884704, 0.8784314, 0, 1, 1,
0.8718635, 1.4421, -0.04875946, 0.8823529, 0, 1, 1,
0.8774279, -0.3819612, 2.064698, 0.8901961, 0, 1, 1,
0.8790055, 1.022322, 0.9885428, 0.8941177, 0, 1, 1,
0.8852828, -0.6992637, 1.047499, 0.9019608, 0, 1, 1,
0.8875517, -0.1932345, 1.201339, 0.9098039, 0, 1, 1,
0.8892112, -0.7810473, 1.822585, 0.9137255, 0, 1, 1,
0.8914576, 0.04625323, 1.043048, 0.9215686, 0, 1, 1,
0.892665, -0.02705933, 3.072608, 0.9254902, 0, 1, 1,
0.9011669, -1.560018, 1.451996, 0.9333333, 0, 1, 1,
0.903909, -0.4675486, 2.197257, 0.9372549, 0, 1, 1,
0.9076098, 1.182079, 0.4131593, 0.945098, 0, 1, 1,
0.9087583, -0.7396424, 2.955582, 0.9490196, 0, 1, 1,
0.9139801, 2.097398, -1.68462, 0.9568627, 0, 1, 1,
0.9193081, 0.7067081, 0.05081667, 0.9607843, 0, 1, 1,
0.9236202, 0.8511418, 1.551396, 0.9686275, 0, 1, 1,
0.9268559, 0.02895677, 2.35191, 0.972549, 0, 1, 1,
0.9301826, -1.743895, 3.167966, 0.9803922, 0, 1, 1,
0.9380884, -0.4241769, 3.510511, 0.9843137, 0, 1, 1,
0.9412401, 1.045276, 0.217546, 0.9921569, 0, 1, 1,
0.9438211, -0.636721, 4.268377, 0.9960784, 0, 1, 1,
0.9465187, -0.8120077, 1.760706, 1, 0, 0.9960784, 1,
0.9471007, 0.2268327, 2.222489, 1, 0, 0.9882353, 1,
0.9596189, 2.843427, 1.936568, 1, 0, 0.9843137, 1,
0.9597624, 1.019541, 0.06154069, 1, 0, 0.9764706, 1,
0.9649647, -0.230262, 1.701929, 1, 0, 0.972549, 1,
0.9655653, 1.754814, 0.1612723, 1, 0, 0.9647059, 1,
0.9681365, -1.076003, 3.036809, 1, 0, 0.9607843, 1,
0.9695393, 2.388884, -0.9731432, 1, 0, 0.9529412, 1,
0.9781232, 1.336784, 0.2910583, 1, 0, 0.9490196, 1,
0.9783466, -0.986968, 2.339189, 1, 0, 0.9411765, 1,
0.9786115, -0.1868037, 2.497954, 1, 0, 0.9372549, 1,
0.981712, 0.1012397, 2.642294, 1, 0, 0.9294118, 1,
0.9849603, 0.2620424, 2.442307, 1, 0, 0.9254902, 1,
0.9854359, -0.4246085, 1.491819, 1, 0, 0.9176471, 1,
0.9866685, 0.9721061, 2.03208, 1, 0, 0.9137255, 1,
0.9903898, 0.09970054, 2.724457, 1, 0, 0.9058824, 1,
0.993005, 1.166537, -0.06870962, 1, 0, 0.9019608, 1,
0.9986145, -0.268225, 2.682376, 1, 0, 0.8941177, 1,
1.002935, -0.03728449, 1.790042, 1, 0, 0.8862745, 1,
1.006666, 1.412286, -0.5665207, 1, 0, 0.8823529, 1,
1.008959, 0.3622615, 1.046453, 1, 0, 0.8745098, 1,
1.013306, 0.9805444, 1.289125, 1, 0, 0.8705882, 1,
1.013959, -0.9660499, 1.139434, 1, 0, 0.8627451, 1,
1.014822, -0.06552377, -0.3758383, 1, 0, 0.8588235, 1,
1.020843, 0.4552796, -0.1311228, 1, 0, 0.8509804, 1,
1.021501, -0.2164742, 2.504891, 1, 0, 0.8470588, 1,
1.023767, 1.054903, 2.054305, 1, 0, 0.8392157, 1,
1.030642, -0.885165, 0.7259913, 1, 0, 0.8352941, 1,
1.058431, 0.2399496, 1.515199, 1, 0, 0.827451, 1,
1.060366, -0.07359762, 2.18299, 1, 0, 0.8235294, 1,
1.06239, 1.258618, 1.476383, 1, 0, 0.8156863, 1,
1.063366, -1.039637, 1.495673, 1, 0, 0.8117647, 1,
1.066395, 0.7456479, -0.3095911, 1, 0, 0.8039216, 1,
1.068913, -1.061395, 1.89526, 1, 0, 0.7960784, 1,
1.068974, 0.1323702, 0.69162, 1, 0, 0.7921569, 1,
1.080303, 0.05418944, 0.569621, 1, 0, 0.7843137, 1,
1.083802, 1.808847, 0.5206861, 1, 0, 0.7803922, 1,
1.086835, -0.0842352, 1.675999, 1, 0, 0.772549, 1,
1.092633, 1.179324, 0.5575609, 1, 0, 0.7686275, 1,
1.094321, -0.008405692, 1.781193, 1, 0, 0.7607843, 1,
1.105303, 1.109477, -0.64787, 1, 0, 0.7568628, 1,
1.106443, 0.2658161, 1.874355, 1, 0, 0.7490196, 1,
1.119176, -1.776862, 6.191683, 1, 0, 0.7450981, 1,
1.124065, -0.9292797, 1.208846, 1, 0, 0.7372549, 1,
1.124264, 0.3950441, 1.527719, 1, 0, 0.7333333, 1,
1.130241, -0.6827857, 3.250964, 1, 0, 0.7254902, 1,
1.130766, -1.25063, 1.693255, 1, 0, 0.7215686, 1,
1.137512, 0.06969573, 1.217821, 1, 0, 0.7137255, 1,
1.139888, 1.358006, 0.525861, 1, 0, 0.7098039, 1,
1.148446, -2.655547, 1.731609, 1, 0, 0.7019608, 1,
1.148635, 0.03686932, 2.115407, 1, 0, 0.6941177, 1,
1.150399, 0.4439962, 0.02938439, 1, 0, 0.6901961, 1,
1.155796, 0.4483073, 3.790924, 1, 0, 0.682353, 1,
1.16982, -0.4872999, 1.369933, 1, 0, 0.6784314, 1,
1.170609, 0.6812209, 1.870509, 1, 0, 0.6705883, 1,
1.172993, 0.008005358, 0.03946321, 1, 0, 0.6666667, 1,
1.182383, -1.251007, 3.262845, 1, 0, 0.6588235, 1,
1.188248, 0.02751791, 1.504771, 1, 0, 0.654902, 1,
1.198202, 0.1844698, -0.1718465, 1, 0, 0.6470588, 1,
1.203486, 0.9008638, 2.227834, 1, 0, 0.6431373, 1,
1.207355, -0.05124756, 1.691371, 1, 0, 0.6352941, 1,
1.209237, 1.141083, 0.7915771, 1, 0, 0.6313726, 1,
1.210489, 1.664548, 1.113401, 1, 0, 0.6235294, 1,
1.21111, 0.7477114, 0.9602613, 1, 0, 0.6196079, 1,
1.213364, -1.558321, 1.56037, 1, 0, 0.6117647, 1,
1.213495, -0.3181829, 2.058191, 1, 0, 0.6078432, 1,
1.224341, 0.3771609, -0.6363853, 1, 0, 0.6, 1,
1.225828, 1.240577, -1.29002, 1, 0, 0.5921569, 1,
1.233971, -0.3366612, 2.350014, 1, 0, 0.5882353, 1,
1.237599, -1.17775, 0.8257816, 1, 0, 0.5803922, 1,
1.241642, -1.668951, 3.281199, 1, 0, 0.5764706, 1,
1.245095, -1.245019, 0.5116647, 1, 0, 0.5686275, 1,
1.247575, 0.8446553, -0.6490126, 1, 0, 0.5647059, 1,
1.251413, -2.186886, 3.11462, 1, 0, 0.5568628, 1,
1.272231, -0.3427581, 1.332617, 1, 0, 0.5529412, 1,
1.27679, 1.40603, -0.2448102, 1, 0, 0.5450981, 1,
1.278154, -0.5075039, 0.5797207, 1, 0, 0.5411765, 1,
1.287705, -0.474485, 1.472797, 1, 0, 0.5333334, 1,
1.291901, 0.694849, 0.09813001, 1, 0, 0.5294118, 1,
1.292595, -0.2022307, 2.981876, 1, 0, 0.5215687, 1,
1.293884, 0.4576766, 1.048574, 1, 0, 0.5176471, 1,
1.296492, 1.357025, -0.05389491, 1, 0, 0.509804, 1,
1.301004, 0.2958085, 0.9105514, 1, 0, 0.5058824, 1,
1.310999, -0.3306932, 0.6294786, 1, 0, 0.4980392, 1,
1.322374, 2.105872, 0.5795605, 1, 0, 0.4901961, 1,
1.325366, -0.856436, 1.006071, 1, 0, 0.4862745, 1,
1.328442, -1.497828, 3.417272, 1, 0, 0.4784314, 1,
1.335677, -0.4335431, 1.467478, 1, 0, 0.4745098, 1,
1.336965, -0.5885853, 1.041341, 1, 0, 0.4666667, 1,
1.340046, 0.1682495, 1.560646, 1, 0, 0.4627451, 1,
1.345608, 0.04888342, 2.511511, 1, 0, 0.454902, 1,
1.36259, 1.366863, 0.8729998, 1, 0, 0.4509804, 1,
1.3699, -0.5829319, 0.8221276, 1, 0, 0.4431373, 1,
1.378665, 1.291595, -0.1787199, 1, 0, 0.4392157, 1,
1.40469, -1.087186, 4.142548, 1, 0, 0.4313726, 1,
1.417872, -0.9210885, 2.182231, 1, 0, 0.427451, 1,
1.42052, -0.2476831, 1.407408, 1, 0, 0.4196078, 1,
1.423387, 0.3384106, 2.788571, 1, 0, 0.4156863, 1,
1.429469, 1.415329, 2.521658, 1, 0, 0.4078431, 1,
1.430303, -0.4339455, 1.880504, 1, 0, 0.4039216, 1,
1.435189, -0.3011005, 3.278955, 1, 0, 0.3960784, 1,
1.441433, -0.3468045, 0.4719814, 1, 0, 0.3882353, 1,
1.44365, -0.1239955, 2.232124, 1, 0, 0.3843137, 1,
1.448046, -0.5998427, 1.832494, 1, 0, 0.3764706, 1,
1.466132, -0.482915, 2.597915, 1, 0, 0.372549, 1,
1.478653, -1.015465, 1.775348, 1, 0, 0.3647059, 1,
1.495905, -2.000001, 3.85534, 1, 0, 0.3607843, 1,
1.501114, -0.354192, 1.674048, 1, 0, 0.3529412, 1,
1.508785, 0.8850269, 2.475044, 1, 0, 0.3490196, 1,
1.509672, -0.06808356, 2.161942, 1, 0, 0.3411765, 1,
1.518819, -0.1235502, 2.34923, 1, 0, 0.3372549, 1,
1.519129, 0.4797874, 0.5712707, 1, 0, 0.3294118, 1,
1.521268, 1.082248, 1.57663, 1, 0, 0.3254902, 1,
1.521372, 0.8520433, 0.9038876, 1, 0, 0.3176471, 1,
1.527072, -0.1465216, 0.8643401, 1, 0, 0.3137255, 1,
1.528046, 0.2546331, -0.03853795, 1, 0, 0.3058824, 1,
1.531514, 0.1028108, 2.130803, 1, 0, 0.2980392, 1,
1.555805, -0.02517045, 2.225045, 1, 0, 0.2941177, 1,
1.56581, 0.9755484, 2.218882, 1, 0, 0.2862745, 1,
1.586735, -0.9336633, 2.442953, 1, 0, 0.282353, 1,
1.609695, 1.197673, 0.9917394, 1, 0, 0.2745098, 1,
1.627745, 1.120036, 0.7434208, 1, 0, 0.2705882, 1,
1.647648, 0.539821, 1.747386, 1, 0, 0.2627451, 1,
1.650215, -0.344964, 1.040835, 1, 0, 0.2588235, 1,
1.673756, 0.158062, -0.08090365, 1, 0, 0.2509804, 1,
1.68375, 0.1775925, 2.079234, 1, 0, 0.2470588, 1,
1.708061, -0.3936597, 0.3552747, 1, 0, 0.2392157, 1,
1.714375, -0.3082389, 0.03052387, 1, 0, 0.2352941, 1,
1.721347, -0.08552366, 1.384402, 1, 0, 0.227451, 1,
1.730179, 0.04868282, 1.04147, 1, 0, 0.2235294, 1,
1.753886, -0.9051166, -0.06073586, 1, 0, 0.2156863, 1,
1.784171, -1.325725, 2.760229, 1, 0, 0.2117647, 1,
1.798913, 1.347536, 0.9380184, 1, 0, 0.2039216, 1,
1.799629, 1.043952, 1.018421, 1, 0, 0.1960784, 1,
1.805071, 0.4408588, 0.6408122, 1, 0, 0.1921569, 1,
1.830869, 0.7971909, 1.478889, 1, 0, 0.1843137, 1,
1.864639, -0.121684, 2.134014, 1, 0, 0.1803922, 1,
1.894387, -0.1729316, -0.07388049, 1, 0, 0.172549, 1,
1.915744, -0.1487273, 1.947243, 1, 0, 0.1686275, 1,
1.941135, 0.1788834, 2.361544, 1, 0, 0.1607843, 1,
1.949092, -0.004404708, 2.521597, 1, 0, 0.1568628, 1,
1.970205, 1.099283, 0.6344112, 1, 0, 0.1490196, 1,
1.971172, -0.2483593, 2.627837, 1, 0, 0.145098, 1,
2.007725, 1.236994, 0.2351651, 1, 0, 0.1372549, 1,
2.01842, -0.3977951, 2.165055, 1, 0, 0.1333333, 1,
2.040382, 0.7014676, 2.439032, 1, 0, 0.1254902, 1,
2.071671, 0.5383127, 1.387207, 1, 0, 0.1215686, 1,
2.083039, -0.7811581, 4.591306, 1, 0, 0.1137255, 1,
2.093456, 0.04168977, 2.446479, 1, 0, 0.1098039, 1,
2.09474, 0.2133782, -0.4590637, 1, 0, 0.1019608, 1,
2.096242, -1.047807, 2.407544, 1, 0, 0.09411765, 1,
2.113295, 0.9234591, 1.053427, 1, 0, 0.09019608, 1,
2.123669, 1.415835, 1.860456, 1, 0, 0.08235294, 1,
2.131647, 0.1812061, 1.567029, 1, 0, 0.07843138, 1,
2.161988, 0.6057574, -1.244651, 1, 0, 0.07058824, 1,
2.176816, 1.209253, 0.8737622, 1, 0, 0.06666667, 1,
2.204704, -0.855046, 1.348725, 1, 0, 0.05882353, 1,
2.252385, 2.035847, 1.381834, 1, 0, 0.05490196, 1,
2.309736, -0.7084897, 2.980749, 1, 0, 0.04705882, 1,
2.355859, -0.8427744, 0.4193911, 1, 0, 0.04313726, 1,
2.412448, -0.3207188, 0.8080618, 1, 0, 0.03529412, 1,
2.413264, 0.8459619, 2.419261, 1, 0, 0.03137255, 1,
2.456218, 1.580174, 0.1419199, 1, 0, 0.02352941, 1,
2.550766, 0.1258374, 0.9201334, 1, 0, 0.01960784, 1,
2.666264, 0.5270685, 1.587329, 1, 0, 0.01176471, 1,
2.669872, -0.3851503, 2.496487, 1, 0, 0.007843138, 1
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
-0.2668215, -3.678722, -7.050119, 0, -0.5, 0.5, 0.5,
-0.2668215, -3.678722, -7.050119, 1, -0.5, 0.5, 0.5,
-0.2668215, -3.678722, -7.050119, 1, 1.5, 0.5, 0.5,
-0.2668215, -3.678722, -7.050119, 0, 1.5, 0.5, 0.5
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
-4.199055, 0.05499208, -7.050119, 0, -0.5, 0.5, 0.5,
-4.199055, 0.05499208, -7.050119, 1, -0.5, 0.5, 0.5,
-4.199055, 0.05499208, -7.050119, 1, 1.5, 0.5, 0.5,
-4.199055, 0.05499208, -7.050119, 0, 1.5, 0.5, 0.5
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
-4.199055, -3.678722, 0.5303741, 0, -0.5, 0.5, 0.5,
-4.199055, -3.678722, 0.5303741, 1, -0.5, 0.5, 0.5,
-4.199055, -3.678722, 0.5303741, 1, 1.5, 0.5, 0.5,
-4.199055, -3.678722, 0.5303741, 0, 1.5, 0.5, 0.5
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
-3, -2.817096, -5.300775,
2, -2.817096, -5.300775,
-3, -2.817096, -5.300775,
-3, -2.9607, -5.592332,
-2, -2.817096, -5.300775,
-2, -2.9607, -5.592332,
-1, -2.817096, -5.300775,
-1, -2.9607, -5.592332,
0, -2.817096, -5.300775,
0, -2.9607, -5.592332,
1, -2.817096, -5.300775,
1, -2.9607, -5.592332,
2, -2.817096, -5.300775,
2, -2.9607, -5.592332
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
-3, -3.247909, -6.175447, 0, -0.5, 0.5, 0.5,
-3, -3.247909, -6.175447, 1, -0.5, 0.5, 0.5,
-3, -3.247909, -6.175447, 1, 1.5, 0.5, 0.5,
-3, -3.247909, -6.175447, 0, 1.5, 0.5, 0.5,
-2, -3.247909, -6.175447, 0, -0.5, 0.5, 0.5,
-2, -3.247909, -6.175447, 1, -0.5, 0.5, 0.5,
-2, -3.247909, -6.175447, 1, 1.5, 0.5, 0.5,
-2, -3.247909, -6.175447, 0, 1.5, 0.5, 0.5,
-1, -3.247909, -6.175447, 0, -0.5, 0.5, 0.5,
-1, -3.247909, -6.175447, 1, -0.5, 0.5, 0.5,
-1, -3.247909, -6.175447, 1, 1.5, 0.5, 0.5,
-1, -3.247909, -6.175447, 0, 1.5, 0.5, 0.5,
0, -3.247909, -6.175447, 0, -0.5, 0.5, 0.5,
0, -3.247909, -6.175447, 1, -0.5, 0.5, 0.5,
0, -3.247909, -6.175447, 1, 1.5, 0.5, 0.5,
0, -3.247909, -6.175447, 0, 1.5, 0.5, 0.5,
1, -3.247909, -6.175447, 0, -0.5, 0.5, 0.5,
1, -3.247909, -6.175447, 1, -0.5, 0.5, 0.5,
1, -3.247909, -6.175447, 1, 1.5, 0.5, 0.5,
1, -3.247909, -6.175447, 0, 1.5, 0.5, 0.5,
2, -3.247909, -6.175447, 0, -0.5, 0.5, 0.5,
2, -3.247909, -6.175447, 1, -0.5, 0.5, 0.5,
2, -3.247909, -6.175447, 1, 1.5, 0.5, 0.5,
2, -3.247909, -6.175447, 0, 1.5, 0.5, 0.5
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
-3.291616, -2, -5.300775,
-3.291616, 2, -5.300775,
-3.291616, -2, -5.300775,
-3.442856, -2, -5.592332,
-3.291616, -1, -5.300775,
-3.442856, -1, -5.592332,
-3.291616, 0, -5.300775,
-3.442856, 0, -5.592332,
-3.291616, 1, -5.300775,
-3.442856, 1, -5.592332,
-3.291616, 2, -5.300775,
-3.442856, 2, -5.592332
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
-3.745335, -2, -6.175447, 0, -0.5, 0.5, 0.5,
-3.745335, -2, -6.175447, 1, -0.5, 0.5, 0.5,
-3.745335, -2, -6.175447, 1, 1.5, 0.5, 0.5,
-3.745335, -2, -6.175447, 0, 1.5, 0.5, 0.5,
-3.745335, -1, -6.175447, 0, -0.5, 0.5, 0.5,
-3.745335, -1, -6.175447, 1, -0.5, 0.5, 0.5,
-3.745335, -1, -6.175447, 1, 1.5, 0.5, 0.5,
-3.745335, -1, -6.175447, 0, 1.5, 0.5, 0.5,
-3.745335, 0, -6.175447, 0, -0.5, 0.5, 0.5,
-3.745335, 0, -6.175447, 1, -0.5, 0.5, 0.5,
-3.745335, 0, -6.175447, 1, 1.5, 0.5, 0.5,
-3.745335, 0, -6.175447, 0, 1.5, 0.5, 0.5,
-3.745335, 1, -6.175447, 0, -0.5, 0.5, 0.5,
-3.745335, 1, -6.175447, 1, -0.5, 0.5, 0.5,
-3.745335, 1, -6.175447, 1, 1.5, 0.5, 0.5,
-3.745335, 1, -6.175447, 0, 1.5, 0.5, 0.5,
-3.745335, 2, -6.175447, 0, -0.5, 0.5, 0.5,
-3.745335, 2, -6.175447, 1, -0.5, 0.5, 0.5,
-3.745335, 2, -6.175447, 1, 1.5, 0.5, 0.5,
-3.745335, 2, -6.175447, 0, 1.5, 0.5, 0.5
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
-3.291616, -2.817096, -4,
-3.291616, -2.817096, 6,
-3.291616, -2.817096, -4,
-3.442856, -2.9607, -4,
-3.291616, -2.817096, -2,
-3.442856, -2.9607, -2,
-3.291616, -2.817096, 0,
-3.442856, -2.9607, 0,
-3.291616, -2.817096, 2,
-3.442856, -2.9607, 2,
-3.291616, -2.817096, 4,
-3.442856, -2.9607, 4,
-3.291616, -2.817096, 6,
-3.442856, -2.9607, 6
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
"4",
"6"
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
-3.745335, -3.247909, -4, 0, -0.5, 0.5, 0.5,
-3.745335, -3.247909, -4, 1, -0.5, 0.5, 0.5,
-3.745335, -3.247909, -4, 1, 1.5, 0.5, 0.5,
-3.745335, -3.247909, -4, 0, 1.5, 0.5, 0.5,
-3.745335, -3.247909, -2, 0, -0.5, 0.5, 0.5,
-3.745335, -3.247909, -2, 1, -0.5, 0.5, 0.5,
-3.745335, -3.247909, -2, 1, 1.5, 0.5, 0.5,
-3.745335, -3.247909, -2, 0, 1.5, 0.5, 0.5,
-3.745335, -3.247909, 0, 0, -0.5, 0.5, 0.5,
-3.745335, -3.247909, 0, 1, -0.5, 0.5, 0.5,
-3.745335, -3.247909, 0, 1, 1.5, 0.5, 0.5,
-3.745335, -3.247909, 0, 0, 1.5, 0.5, 0.5,
-3.745335, -3.247909, 2, 0, -0.5, 0.5, 0.5,
-3.745335, -3.247909, 2, 1, -0.5, 0.5, 0.5,
-3.745335, -3.247909, 2, 1, 1.5, 0.5, 0.5,
-3.745335, -3.247909, 2, 0, 1.5, 0.5, 0.5,
-3.745335, -3.247909, 4, 0, -0.5, 0.5, 0.5,
-3.745335, -3.247909, 4, 1, -0.5, 0.5, 0.5,
-3.745335, -3.247909, 4, 1, 1.5, 0.5, 0.5,
-3.745335, -3.247909, 4, 0, 1.5, 0.5, 0.5,
-3.745335, -3.247909, 6, 0, -0.5, 0.5, 0.5,
-3.745335, -3.247909, 6, 1, -0.5, 0.5, 0.5,
-3.745335, -3.247909, 6, 1, 1.5, 0.5, 0.5,
-3.745335, -3.247909, 6, 0, 1.5, 0.5, 0.5
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
-3.291616, -2.817096, -5.300775,
-3.291616, 2.92708, -5.300775,
-3.291616, -2.817096, 6.361523,
-3.291616, 2.92708, 6.361523,
-3.291616, -2.817096, -5.300775,
-3.291616, -2.817096, 6.361523,
-3.291616, 2.92708, -5.300775,
-3.291616, 2.92708, 6.361523,
-3.291616, -2.817096, -5.300775,
2.757973, -2.817096, -5.300775,
-3.291616, -2.817096, 6.361523,
2.757973, -2.817096, 6.361523,
-3.291616, 2.92708, -5.300775,
2.757973, 2.92708, -5.300775,
-3.291616, 2.92708, 6.361523,
2.757973, 2.92708, 6.361523,
2.757973, -2.817096, -5.300775,
2.757973, 2.92708, -5.300775,
2.757973, -2.817096, 6.361523,
2.757973, 2.92708, 6.361523,
2.757973, -2.817096, -5.300775,
2.757973, -2.817096, 6.361523,
2.757973, 2.92708, -5.300775,
2.757973, 2.92708, 6.361523
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
var radius = 7.656661;
var distance = 34.06535;
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
mvMatrix.translate( 0.2668215, -0.05499208, -0.5303741 );
mvMatrix.scale( 1.368445, 1.441205, 0.7098543 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.06535);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Dilan<-read.table("Dilan.xyz")
```

```
## Error in read.table("Dilan.xyz"): no lines available in input
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
-3.203515, 0.08818415, -1.755608, 0, 0, 1, 1, 1,
-2.490303, -0.07152838, -0.8486986, 1, 0, 0, 1, 1,
-2.436537, -0.2625645, -1.96003, 1, 0, 0, 1, 1,
-2.427808, 1.840617, -2.349713, 1, 0, 0, 1, 1,
-2.397295, -0.7468067, -1.309853, 1, 0, 0, 1, 1,
-2.318511, 0.2489298, -2.565099, 1, 0, 0, 1, 1,
-2.301912, 0.6301464, -0.8955849, 0, 0, 0, 1, 1,
-2.277466, 0.3167719, -1.497396, 0, 0, 0, 1, 1,
-2.270502, -0.2556052, -1.067652, 0, 0, 0, 1, 1,
-2.256339, -0.2447559, -1.922675, 0, 0, 0, 1, 1,
-2.238207, 0.004719011, -1.268772, 0, 0, 0, 1, 1,
-2.211622, 0.3499811, -0.9045397, 0, 0, 0, 1, 1,
-2.200829, 0.09543362, -3.053638, 0, 0, 0, 1, 1,
-2.098257, -0.353524, -1.082497, 1, 1, 1, 1, 1,
-2.052549, -1.403241, -2.087357, 1, 1, 1, 1, 1,
-2.036384, 0.2641631, -2.780642, 1, 1, 1, 1, 1,
-2.027514, -1.39782, -1.24874, 1, 1, 1, 1, 1,
-1.996767, 0.5820029, -0.3489546, 1, 1, 1, 1, 1,
-1.986329, -1.352725, -1.500215, 1, 1, 1, 1, 1,
-1.984324, 1.137422, 0.1948681, 1, 1, 1, 1, 1,
-1.978204, -1.366209, -0.9804174, 1, 1, 1, 1, 1,
-1.975159, 0.7535405, -0.5855142, 1, 1, 1, 1, 1,
-1.955346, 0.5209932, -1.714637, 1, 1, 1, 1, 1,
-1.922704, 0.5487213, -1.060236, 1, 1, 1, 1, 1,
-1.918218, 1.24406, -1.046182, 1, 1, 1, 1, 1,
-1.915657, 0.7904824, -0.6941037, 1, 1, 1, 1, 1,
-1.91364, 0.0729335, -1.998548, 1, 1, 1, 1, 1,
-1.895767, -0.07227593, -0.9737436, 1, 1, 1, 1, 1,
-1.881876, 0.6516876, -1.614933, 0, 0, 1, 1, 1,
-1.876488, -0.2926374, -2.702402, 1, 0, 0, 1, 1,
-1.869234, 0.5726534, -0.8194953, 1, 0, 0, 1, 1,
-1.865181, -0.6026722, -0.4415188, 1, 0, 0, 1, 1,
-1.849015, -0.2207129, -1.548165, 1, 0, 0, 1, 1,
-1.836425, -0.4003222, -2.361752, 1, 0, 0, 1, 1,
-1.82286, 1.826156, -0.4522933, 0, 0, 0, 1, 1,
-1.802382, 0.8224404, -0.004001308, 0, 0, 0, 1, 1,
-1.794538, -0.3539977, 0.3444776, 0, 0, 0, 1, 1,
-1.748439, -0.9520751, -2.11051, 0, 0, 0, 1, 1,
-1.733061, 1.226325, -0.8505653, 0, 0, 0, 1, 1,
-1.731797, 1.448395, -3.224653, 0, 0, 0, 1, 1,
-1.723031, 0.08996124, -0.9265319, 0, 0, 0, 1, 1,
-1.720342, -1.526602, -1.862832, 1, 1, 1, 1, 1,
-1.716091, -0.5381982, -2.181489, 1, 1, 1, 1, 1,
-1.713361, 0.5783428, -2.182412, 1, 1, 1, 1, 1,
-1.697889, -1.535518, -1.560297, 1, 1, 1, 1, 1,
-1.692472, -0.7480943, -2.237767, 1, 1, 1, 1, 1,
-1.682728, 1.635758, -0.2868281, 1, 1, 1, 1, 1,
-1.676408, 0.7202743, -0.339582, 1, 1, 1, 1, 1,
-1.671979, -1.022518, -0.2805037, 1, 1, 1, 1, 1,
-1.662961, 1.597783, -1.398405, 1, 1, 1, 1, 1,
-1.657652, -0.2368258, -2.87628, 1, 1, 1, 1, 1,
-1.648916, 1.173225, 0.07846525, 1, 1, 1, 1, 1,
-1.619316, 0.9131581, -0.7300319, 1, 1, 1, 1, 1,
-1.616122, -0.3939338, -3.113315, 1, 1, 1, 1, 1,
-1.610096, 0.579541, -1.974632, 1, 1, 1, 1, 1,
-1.608767, -0.3798924, -2.095534, 1, 1, 1, 1, 1,
-1.608452, 0.7938871, -0.07536236, 0, 0, 1, 1, 1,
-1.607714, -1.197662, -1.807336, 1, 0, 0, 1, 1,
-1.6006, -1.278133, -1.828944, 1, 0, 0, 1, 1,
-1.597173, -0.7420138, -1.208529, 1, 0, 0, 1, 1,
-1.591246, -0.1804914, -1.362281, 1, 0, 0, 1, 1,
-1.585905, -0.002959757, -2.084002, 1, 0, 0, 1, 1,
-1.579952, -0.06785168, -2.604904, 0, 0, 0, 1, 1,
-1.570477, -0.219159, -1.343849, 0, 0, 0, 1, 1,
-1.564235, -1.356089, -2.85, 0, 0, 0, 1, 1,
-1.560411, 0.5377095, 0.5472503, 0, 0, 0, 1, 1,
-1.55923, -1.975278, -1.322525, 0, 0, 0, 1, 1,
-1.556447, 0.4747785, -1.700608, 0, 0, 0, 1, 1,
-1.555181, -0.2771294, -2.953921, 0, 0, 0, 1, 1,
-1.551193, -0.8015475, -3.922437, 1, 1, 1, 1, 1,
-1.549914, -0.4216858, -0.2157313, 1, 1, 1, 1, 1,
-1.53542, -0.9833732, -0.8700536, 1, 1, 1, 1, 1,
-1.533691, -0.4382324, -2.676309, 1, 1, 1, 1, 1,
-1.514057, 0.6989986, -2.527405, 1, 1, 1, 1, 1,
-1.510182, 0.1126137, -2.220981, 1, 1, 1, 1, 1,
-1.502129, -0.9333897, -1.033349, 1, 1, 1, 1, 1,
-1.4996, -1.286313, -1.95944, 1, 1, 1, 1, 1,
-1.490442, 0.684054, -1.51965, 1, 1, 1, 1, 1,
-1.486999, -0.6699824, -2.357625, 1, 1, 1, 1, 1,
-1.480922, -1.233852, -2.22093, 1, 1, 1, 1, 1,
-1.47274, 0.5852215, 0.1148321, 1, 1, 1, 1, 1,
-1.456679, 0.0159145, -3.472975, 1, 1, 1, 1, 1,
-1.454995, -0.3485097, -1.372185, 1, 1, 1, 1, 1,
-1.45114, -0.3414401, -1.241408, 1, 1, 1, 1, 1,
-1.447808, -0.2048776, -2.7572, 0, 0, 1, 1, 1,
-1.439176, 0.1434481, -2.724155, 1, 0, 0, 1, 1,
-1.436238, 0.4458283, -0.07212608, 1, 0, 0, 1, 1,
-1.435806, 0.7435803, -1.289666, 1, 0, 0, 1, 1,
-1.432232, -0.2256899, -2.479535, 1, 0, 0, 1, 1,
-1.42931, 1.536695, -0.6143736, 1, 0, 0, 1, 1,
-1.425077, -0.7679465, -2.884074, 0, 0, 0, 1, 1,
-1.416587, -0.6417893, -2.837311, 0, 0, 0, 1, 1,
-1.411124, -2.208555, -4.340245, 0, 0, 0, 1, 1,
-1.402501, -0.1413973, -0.3927006, 0, 0, 0, 1, 1,
-1.394403, 0.6699988, -2.962913, 0, 0, 0, 1, 1,
-1.390551, 1.851406, 0.8163525, 0, 0, 0, 1, 1,
-1.384584, -0.4692666, 0.04490454, 0, 0, 0, 1, 1,
-1.382321, -0.1882112, -1.860088, 1, 1, 1, 1, 1,
-1.381221, 0.2529362, -1.613056, 1, 1, 1, 1, 1,
-1.37886, 0.7680094, -1.535508, 1, 1, 1, 1, 1,
-1.37665, 0.191457, -1.42275, 1, 1, 1, 1, 1,
-1.375718, 0.09015059, -2.415424, 1, 1, 1, 1, 1,
-1.370986, 0.7412697, -1.111595, 1, 1, 1, 1, 1,
-1.362271, -0.02182941, -2.676271, 1, 1, 1, 1, 1,
-1.359861, 0.2475474, -2.113713, 1, 1, 1, 1, 1,
-1.358394, 0.823107, -1.455417, 1, 1, 1, 1, 1,
-1.357139, -0.9591742, -3.679118, 1, 1, 1, 1, 1,
-1.330516, -0.4966407, -2.295801, 1, 1, 1, 1, 1,
-1.330076, 0.6749571, -3.401119, 1, 1, 1, 1, 1,
-1.324371, 0.4836879, -1.400284, 1, 1, 1, 1, 1,
-1.322013, 1.37983, -0.8325238, 1, 1, 1, 1, 1,
-1.321757, -0.4057623, -0.18527, 1, 1, 1, 1, 1,
-1.321486, -0.5478228, -4.736413, 0, 0, 1, 1, 1,
-1.310433, 1.065578, -0.2277932, 1, 0, 0, 1, 1,
-1.305465, -0.3214898, -1.698707, 1, 0, 0, 1, 1,
-1.301265, 0.797376, -1.286243, 1, 0, 0, 1, 1,
-1.288784, -0.2182414, -2.804544, 1, 0, 0, 1, 1,
-1.284531, -1.120812, -1.148593, 1, 0, 0, 1, 1,
-1.282171, -0.06918401, -1.476009, 0, 0, 0, 1, 1,
-1.274558, -1.323842, -2.58736, 0, 0, 0, 1, 1,
-1.267491, -0.9463391, -1.438611, 0, 0, 0, 1, 1,
-1.257311, 0.1957122, -2.668661, 0, 0, 0, 1, 1,
-1.256951, 0.4206186, -1.783166, 0, 0, 0, 1, 1,
-1.254506, 1.059446, -0.2105809, 0, 0, 0, 1, 1,
-1.251955, -0.9861826, -2.547941, 0, 0, 0, 1, 1,
-1.249245, 0.4211068, -1.45666, 1, 1, 1, 1, 1,
-1.249214, 0.1073133, -1.362975, 1, 1, 1, 1, 1,
-1.249209, 0.0287396, -1.661413, 1, 1, 1, 1, 1,
-1.245481, -1.472179, -3.67678, 1, 1, 1, 1, 1,
-1.242885, -0.4878108, -1.962243, 1, 1, 1, 1, 1,
-1.242169, -0.3303363, -1.850017, 1, 1, 1, 1, 1,
-1.241679, 1.595625, -0.2594417, 1, 1, 1, 1, 1,
-1.241259, -1.164312, -1.9838, 1, 1, 1, 1, 1,
-1.222049, -0.4501368, -0.6116278, 1, 1, 1, 1, 1,
-1.219727, -1.220921, -1.258204, 1, 1, 1, 1, 1,
-1.194907, 0.03529228, -2.184147, 1, 1, 1, 1, 1,
-1.193416, 1.276095, 0.4898213, 1, 1, 1, 1, 1,
-1.184348, 0.2011387, -0.1597182, 1, 1, 1, 1, 1,
-1.176963, -0.8405316, -2.657491, 1, 1, 1, 1, 1,
-1.176313, 0.1736463, 2.075182, 1, 1, 1, 1, 1,
-1.167143, -1.397963, -3.367616, 0, 0, 1, 1, 1,
-1.165435, -1.423601, -2.257994, 1, 0, 0, 1, 1,
-1.164353, -0.2881495, -1.156603, 1, 0, 0, 1, 1,
-1.160591, -0.2610703, -1.606417, 1, 0, 0, 1, 1,
-1.151518, -0.159566, -2.276822, 1, 0, 0, 1, 1,
-1.150688, 0.7960108, 0.02234342, 1, 0, 0, 1, 1,
-1.150239, -0.1988225, -1.810166, 0, 0, 0, 1, 1,
-1.149879, 0.1806883, -2.641199, 0, 0, 0, 1, 1,
-1.145586, -1.33322, -2.751801, 0, 0, 0, 1, 1,
-1.136221, -1.143777, -4.31828, 0, 0, 0, 1, 1,
-1.135582, 0.5324889, -2.660985, 0, 0, 0, 1, 1,
-1.135398, -0.1580902, -1.283809, 0, 0, 0, 1, 1,
-1.134639, 0.1605106, -1.582265, 0, 0, 0, 1, 1,
-1.129623, 1.490219, 0.6960963, 1, 1, 1, 1, 1,
-1.129455, 1.493163, 0.4988656, 1, 1, 1, 1, 1,
-1.129071, -1.083765, -1.577315, 1, 1, 1, 1, 1,
-1.119689, -0.1822672, -2.607705, 1, 1, 1, 1, 1,
-1.114028, -0.7148397, -3.570213, 1, 1, 1, 1, 1,
-1.108665, 1.777774, -1.105436, 1, 1, 1, 1, 1,
-1.103215, -0.1830238, -3.622298, 1, 1, 1, 1, 1,
-1.10288, 0.2253469, -3.887892, 1, 1, 1, 1, 1,
-1.09955, -0.219714, -2.548223, 1, 1, 1, 1, 1,
-1.097728, -0.2690166, -1.760358, 1, 1, 1, 1, 1,
-1.097303, 0.6929207, -0.8811765, 1, 1, 1, 1, 1,
-1.095182, -1.010088, -1.745919, 1, 1, 1, 1, 1,
-1.094873, 0.8224259, -0.3509825, 1, 1, 1, 1, 1,
-1.088799, 0.3490424, 0.1396744, 1, 1, 1, 1, 1,
-1.084136, 1.461526, -0.8787135, 1, 1, 1, 1, 1,
-1.078564, -0.9344921, -3.389031, 0, 0, 1, 1, 1,
-1.078341, 0.3080254, -1.896823, 1, 0, 0, 1, 1,
-1.077565, 1.572177, -1.446755, 1, 0, 0, 1, 1,
-1.076382, 0.4225947, -2.579558, 1, 0, 0, 1, 1,
-1.067763, 0.4939094, -1.94058, 1, 0, 0, 1, 1,
-1.065683, 0.2615722, -0.3559208, 1, 0, 0, 1, 1,
-1.062932, -0.7573007, -2.801078, 0, 0, 0, 1, 1,
-1.062013, -0.9716011, -2.217861, 0, 0, 0, 1, 1,
-1.05815, -1.542255, -1.540701, 0, 0, 0, 1, 1,
-1.053404, 0.9971376, -1.393532, 0, 0, 0, 1, 1,
-1.049007, -1.171252, -2.344744, 0, 0, 0, 1, 1,
-1.046753, 1.536733, -2.053905, 0, 0, 0, 1, 1,
-1.045262, 1.106866, -0.04970549, 0, 0, 0, 1, 1,
-1.042687, -0.9079267, -3.338914, 1, 1, 1, 1, 1,
-1.040512, -0.7765869, -2.644011, 1, 1, 1, 1, 1,
-1.040205, -1.252994, -4.523242, 1, 1, 1, 1, 1,
-1.038225, 0.7438596, -1.701374, 1, 1, 1, 1, 1,
-1.037769, 0.02503304, -0.2196281, 1, 1, 1, 1, 1,
-1.033572, -1.136212, -1.993574, 1, 1, 1, 1, 1,
-1.030041, -0.214422, -1.097851, 1, 1, 1, 1, 1,
-1.026558, -0.5288833, -2.815305, 1, 1, 1, 1, 1,
-1.005754, 1.206375, -2.739604, 1, 1, 1, 1, 1,
-1.002199, -1.100232, -2.819367, 1, 1, 1, 1, 1,
-1.001311, 0.175717, -1.084742, 1, 1, 1, 1, 1,
-0.9937795, -2.170168, -2.40448, 1, 1, 1, 1, 1,
-0.9911789, -1.095499, -1.038162, 1, 1, 1, 1, 1,
-0.9814865, 1.809572, 1.363692, 1, 1, 1, 1, 1,
-0.9776712, 1.203138, -1.272495, 1, 1, 1, 1, 1,
-0.9771146, -0.1979661, -1.395289, 0, 0, 1, 1, 1,
-0.9755414, -0.9288102, -1.222817, 1, 0, 0, 1, 1,
-0.9708653, 1.397707, -0.6049509, 1, 0, 0, 1, 1,
-0.9680355, 1.298935, -1.013652, 1, 0, 0, 1, 1,
-0.9632173, 1.18284, -0.2503569, 1, 0, 0, 1, 1,
-0.9599779, -0.04215313, -1.620352, 1, 0, 0, 1, 1,
-0.9557558, -0.2367391, -1.271381, 0, 0, 0, 1, 1,
-0.9529323, -0.4609731, 0.5041252, 0, 0, 0, 1, 1,
-0.9519849, 0.8971276, -0.999272, 0, 0, 0, 1, 1,
-0.9511247, 0.562086, -1.492194, 0, 0, 0, 1, 1,
-0.9435378, 1.264705, -1.098768, 0, 0, 0, 1, 1,
-0.9434831, 0.01136672, -2.298196, 0, 0, 0, 1, 1,
-0.9418448, 1.586321, 0.1548216, 0, 0, 0, 1, 1,
-0.9416617, -0.27737, -1.461412, 1, 1, 1, 1, 1,
-0.9397007, 0.2541322, -1.000537, 1, 1, 1, 1, 1,
-0.9329289, -1.908334, -2.103159, 1, 1, 1, 1, 1,
-0.9193157, 0.5411711, -0.4989929, 1, 1, 1, 1, 1,
-0.9158419, -0.6169592, -2.028161, 1, 1, 1, 1, 1,
-0.9150932, -1.381845, -2.914635, 1, 1, 1, 1, 1,
-0.9143475, 0.9412259, -2.817924, 1, 1, 1, 1, 1,
-0.9120567, -0.09414604, -0.6305724, 1, 1, 1, 1, 1,
-0.9106801, -0.1704782, -1.713217, 1, 1, 1, 1, 1,
-0.9095078, 0.8457613, 0.2357339, 1, 1, 1, 1, 1,
-0.9081969, -0.1679538, -0.9811608, 1, 1, 1, 1, 1,
-0.9053378, 1.244077, -0.5395285, 1, 1, 1, 1, 1,
-0.903174, -2.144161, -3.504865, 1, 1, 1, 1, 1,
-0.8945812, 0.2023046, -2.705822, 1, 1, 1, 1, 1,
-0.8935363, -0.8077691, -4.238953, 1, 1, 1, 1, 1,
-0.8837784, 1.207298, 1.657164, 0, 0, 1, 1, 1,
-0.878038, 1.598888, 0.6126219, 1, 0, 0, 1, 1,
-0.8737591, -1.047209, -2.534082, 1, 0, 0, 1, 1,
-0.867889, -0.0002931942, -0.5700403, 1, 0, 0, 1, 1,
-0.863126, 0.9996624, -0.2905693, 1, 0, 0, 1, 1,
-0.8596153, 1.244231, -0.8136257, 1, 0, 0, 1, 1,
-0.8530173, 0.1528531, -0.7531956, 0, 0, 0, 1, 1,
-0.852962, -1.229888, -4.005341, 0, 0, 0, 1, 1,
-0.8512716, -0.2715455, -2.108128, 0, 0, 0, 1, 1,
-0.8498531, 0.09130538, -0.8648933, 0, 0, 0, 1, 1,
-0.8494433, -1.333462, -2.417985, 0, 0, 0, 1, 1,
-0.8455527, 1.064534, -0.2301185, 0, 0, 0, 1, 1,
-0.8434123, -1.204191, -3.22883, 0, 0, 0, 1, 1,
-0.8410947, -0.01744003, -0.08882914, 1, 1, 1, 1, 1,
-0.827559, 1.192803, 0.5052196, 1, 1, 1, 1, 1,
-0.8274598, 0.493829, -2.009339, 1, 1, 1, 1, 1,
-0.8201999, -0.6645058, -2.063981, 1, 1, 1, 1, 1,
-0.8196024, 1.088193, -0.213027, 1, 1, 1, 1, 1,
-0.8169186, -2.469356, -4.80676, 1, 1, 1, 1, 1,
-0.813415, 0.2619047, -2.688622, 1, 1, 1, 1, 1,
-0.8121181, 0.3105963, 0.3360115, 1, 1, 1, 1, 1,
-0.8109304, 0.6144007, -0.5240117, 1, 1, 1, 1, 1,
-0.8081054, -1.067762, -2.686933, 1, 1, 1, 1, 1,
-0.7999112, -0.06420895, -2.91869, 1, 1, 1, 1, 1,
-0.7982029, 0.4909087, 0.6495165, 1, 1, 1, 1, 1,
-0.7974358, 0.3360568, -1.284839, 1, 1, 1, 1, 1,
-0.7948078, 0.3975738, 0.09971754, 1, 1, 1, 1, 1,
-0.78774, -0.604167, -2.224473, 1, 1, 1, 1, 1,
-0.786663, 0.09868501, 0.265333, 0, 0, 1, 1, 1,
-0.7858904, -1.726175, 0.06695338, 1, 0, 0, 1, 1,
-0.7817394, 2.099118, -1.586606, 1, 0, 0, 1, 1,
-0.7791997, 1.058505, -1.006502, 1, 0, 0, 1, 1,
-0.7731633, 0.2397519, -0.01241386, 1, 0, 0, 1, 1,
-0.7716984, -0.2149751, -1.646368, 1, 0, 0, 1, 1,
-0.7708477, 0.348235, 0.959549, 0, 0, 0, 1, 1,
-0.7682099, -0.9873167, -2.385041, 0, 0, 0, 1, 1,
-0.7612472, -0.160781, -0.9606419, 0, 0, 0, 1, 1,
-0.7557704, -0.3274736, -0.7738824, 0, 0, 0, 1, 1,
-0.7549503, -1.365488, -2.462927, 0, 0, 0, 1, 1,
-0.7520448, 0.2096334, -2.938996, 0, 0, 0, 1, 1,
-0.7483073, 1.178934, 1.884091, 0, 0, 0, 1, 1,
-0.7460531, 0.8580167, -2.619832, 1, 1, 1, 1, 1,
-0.7449307, 0.3871616, -1.273017, 1, 1, 1, 1, 1,
-0.7426857, -0.2608491, -1.357851, 1, 1, 1, 1, 1,
-0.7410362, 0.3729105, 0.4095593, 1, 1, 1, 1, 1,
-0.7399266, 0.1666682, -2.732284, 1, 1, 1, 1, 1,
-0.737484, -1.479705, -2.438107, 1, 1, 1, 1, 1,
-0.7358577, -0.5133015, -3.19259, 1, 1, 1, 1, 1,
-0.7333395, 0.7459671, -0.1380717, 1, 1, 1, 1, 1,
-0.7271621, -1.082666, -2.068815, 1, 1, 1, 1, 1,
-0.7179559, 0.1042188, -0.9920954, 1, 1, 1, 1, 1,
-0.7038139, -1.482241, -5.130935, 1, 1, 1, 1, 1,
-0.6914538, 0.8671021, -2.286492, 1, 1, 1, 1, 1,
-0.6883967, -0.7937523, -1.751397, 1, 1, 1, 1, 1,
-0.6882175, 2.023082, 0.6372337, 1, 1, 1, 1, 1,
-0.670966, -1.149039, -4.761014, 1, 1, 1, 1, 1,
-0.6699247, 0.144128, -1.730925, 0, 0, 1, 1, 1,
-0.6658563, -0.330268, -2.109735, 1, 0, 0, 1, 1,
-0.665602, -0.0377409, -1.499915, 1, 0, 0, 1, 1,
-0.6576118, -0.8621985, -3.689301, 1, 0, 0, 1, 1,
-0.6563892, -0.4267991, -1.033392, 1, 0, 0, 1, 1,
-0.6497048, -0.3992398, -1.217984, 1, 0, 0, 1, 1,
-0.6484796, -1.473873, -4.344092, 0, 0, 0, 1, 1,
-0.6465822, -0.3844501, -2.773517, 0, 0, 0, 1, 1,
-0.6433043, -0.8107913, -1.903844, 0, 0, 0, 1, 1,
-0.6384121, -0.264706, -2.097783, 0, 0, 0, 1, 1,
-0.6330163, -0.2305073, -2.052853, 0, 0, 0, 1, 1,
-0.6312923, -1.209672, -4.31621, 0, 0, 0, 1, 1,
-0.631292, 0.4526823, -1.654653, 0, 0, 0, 1, 1,
-0.6276363, 1.880911, -0.6272693, 1, 1, 1, 1, 1,
-0.6269816, -1.0005, -1.86429, 1, 1, 1, 1, 1,
-0.6173187, 0.1928419, -0.6099271, 1, 1, 1, 1, 1,
-0.6162406, 0.5953532, -0.06692105, 1, 1, 1, 1, 1,
-0.6137589, 0.5549755, 0.3340004, 1, 1, 1, 1, 1,
-0.6112251, 0.685613, 0.6497988, 1, 1, 1, 1, 1,
-0.6106654, -0.1185783, -3.552132, 1, 1, 1, 1, 1,
-0.6072076, -0.8785149, -3.023179, 1, 1, 1, 1, 1,
-0.605453, 0.8138818, -0.7752933, 1, 1, 1, 1, 1,
-0.6014799, 0.07167976, -0.9083961, 1, 1, 1, 1, 1,
-0.5982179, -1.707234, -2.290733, 1, 1, 1, 1, 1,
-0.5949873, -0.1751289, -1.643465, 1, 1, 1, 1, 1,
-0.5935657, 2.320385, -0.9401671, 1, 1, 1, 1, 1,
-0.5921035, 0.03326391, -0.3592936, 1, 1, 1, 1, 1,
-0.5901713, 0.959344, -1.569921, 1, 1, 1, 1, 1,
-0.5845016, 1.070954, 0.2852717, 0, 0, 1, 1, 1,
-0.5751183, 0.01023105, -3.2081, 1, 0, 0, 1, 1,
-0.5744723, 2.522661, -1.278655, 1, 0, 0, 1, 1,
-0.5677186, -0.7052909, -1.86062, 1, 0, 0, 1, 1,
-0.5632228, 0.8712893, -0.718259, 1, 0, 0, 1, 1,
-0.5471157, -1.192253, -1.480257, 1, 0, 0, 1, 1,
-0.5383932, -0.5538763, -2.477582, 0, 0, 0, 1, 1,
-0.5366349, 1.08686, 0.2890198, 0, 0, 0, 1, 1,
-0.5359333, -0.6141184, -2.359783, 0, 0, 0, 1, 1,
-0.530607, -0.2158932, -4.015241, 0, 0, 0, 1, 1,
-0.5225838, -0.6953366, -2.837005, 0, 0, 0, 1, 1,
-0.5199078, -0.02208311, -0.4037064, 0, 0, 0, 1, 1,
-0.51974, 0.02085482, -1.474161, 0, 0, 0, 1, 1,
-0.5175063, 1.092481, 0.02315001, 1, 1, 1, 1, 1,
-0.5148463, 0.4378968, -1.463825, 1, 1, 1, 1, 1,
-0.5136421, -1.465891, -3.081005, 1, 1, 1, 1, 1,
-0.5120129, 1.184101, 0.7016494, 1, 1, 1, 1, 1,
-0.5100081, -1.320248, -2.412561, 1, 1, 1, 1, 1,
-0.507444, 0.2163161, -1.911263, 1, 1, 1, 1, 1,
-0.5067803, 0.4183731, -2.094787, 1, 1, 1, 1, 1,
-0.5058803, -0.8295444, -2.708499, 1, 1, 1, 1, 1,
-0.5030957, -0.1763249, -1.225289, 1, 1, 1, 1, 1,
-0.499059, -0.2952864, -2.928036, 1, 1, 1, 1, 1,
-0.4987428, 0.7074276, -0.3318046, 1, 1, 1, 1, 1,
-0.4901924, 0.4444037, -0.5823619, 1, 1, 1, 1, 1,
-0.4900019, -1.822165, -3.13799, 1, 1, 1, 1, 1,
-0.4871019, -0.2302923, -2.266937, 1, 1, 1, 1, 1,
-0.4846393, 0.8851379, -0.1843955, 1, 1, 1, 1, 1,
-0.4831241, -0.9870126, -3.124897, 0, 0, 1, 1, 1,
-0.4814421, -1.30166, -4.818744, 1, 0, 0, 1, 1,
-0.4807746, 0.2400384, -1.178845, 1, 0, 0, 1, 1,
-0.4786302, 0.05226838, -1.863757, 1, 0, 0, 1, 1,
-0.4737149, 0.219758, -1.429576, 1, 0, 0, 1, 1,
-0.4712288, -1.529238, -1.391873, 1, 0, 0, 1, 1,
-0.4639596, 0.4205168, -1.923681, 0, 0, 0, 1, 1,
-0.4634967, -1.190332, -0.9289511, 0, 0, 0, 1, 1,
-0.4561278, 0.2794586, -1.51177, 0, 0, 0, 1, 1,
-0.455006, -0.8321671, -1.792876, 0, 0, 0, 1, 1,
-0.4501379, 0.1314665, -1.786901, 0, 0, 0, 1, 1,
-0.4447737, 0.2137841, -1.623674, 0, 0, 0, 1, 1,
-0.4416325, -0.0897509, -1.499804, 0, 0, 0, 1, 1,
-0.4390137, 0.2352363, -1.211099, 1, 1, 1, 1, 1,
-0.4323734, -0.6935109, -2.475268, 1, 1, 1, 1, 1,
-0.4320785, -0.5433283, -2.869746, 1, 1, 1, 1, 1,
-0.4286818, -1.024686, -3.344897, 1, 1, 1, 1, 1,
-0.4260459, 0.292708, -1.404994, 1, 1, 1, 1, 1,
-0.4237548, 1.554415, 1.176259, 1, 1, 1, 1, 1,
-0.4219886, -0.5748097, -0.3163522, 1, 1, 1, 1, 1,
-0.4195244, -0.7278798, -1.129524, 1, 1, 1, 1, 1,
-0.4192672, -0.210416, -2.887577, 1, 1, 1, 1, 1,
-0.4190581, -1.327642, -3.619979, 1, 1, 1, 1, 1,
-0.4186108, 0.5412143, -0.3777944, 1, 1, 1, 1, 1,
-0.4185939, 0.3528814, -0.3123245, 1, 1, 1, 1, 1,
-0.4143448, -0.2615998, -2.311553, 1, 1, 1, 1, 1,
-0.4105312, -0.6677711, -3.949945, 1, 1, 1, 1, 1,
-0.4103319, 1.098577, 0.1375523, 1, 1, 1, 1, 1,
-0.4040846, -0.3203361, -3.795788, 0, 0, 1, 1, 1,
-0.3972663, -0.9930428, -2.974002, 1, 0, 0, 1, 1,
-0.3909902, -0.5979259, -3.73398, 1, 0, 0, 1, 1,
-0.3891313, -0.4987006, -3.422175, 1, 0, 0, 1, 1,
-0.3879337, 0.6463874, 0.7394495, 1, 0, 0, 1, 1,
-0.3877601, -0.5153182, -2.306391, 1, 0, 0, 1, 1,
-0.3869533, 0.454014, -0.02938611, 0, 0, 0, 1, 1,
-0.3830794, -0.519256, -3.941031, 0, 0, 0, 1, 1,
-0.3799491, 0.9330698, 0.1673517, 0, 0, 0, 1, 1,
-0.3798344, 1.47112, 0.08107426, 0, 0, 0, 1, 1,
-0.3786889, -2.247933, -1.276294, 0, 0, 0, 1, 1,
-0.3769181, -0.2729146, -3.66515, 0, 0, 0, 1, 1,
-0.3760485, -0.9732456, -3.963616, 0, 0, 0, 1, 1,
-0.3730855, -0.5817619, -2.591484, 1, 1, 1, 1, 1,
-0.3728381, -0.5547832, -3.314561, 1, 1, 1, 1, 1,
-0.3723178, 0.5195745, -0.4032735, 1, 1, 1, 1, 1,
-0.3723046, 0.5346523, -1.577995, 1, 1, 1, 1, 1,
-0.3708079, 1.352595, -0.03935252, 1, 1, 1, 1, 1,
-0.3692032, 0.5002342, 0.8352076, 1, 1, 1, 1, 1,
-0.3687708, -0.1011042, -2.803395, 1, 1, 1, 1, 1,
-0.3687515, 1.433786, 1.571208, 1, 1, 1, 1, 1,
-0.3594163, 1.837752, -0.3644514, 1, 1, 1, 1, 1,
-0.3551708, -0.2036885, 0.2549113, 1, 1, 1, 1, 1,
-0.3546259, -1.22823, -3.213979, 1, 1, 1, 1, 1,
-0.3491782, 1.947293, 1.511573, 1, 1, 1, 1, 1,
-0.3482967, 0.5669131, -0.2002627, 1, 1, 1, 1, 1,
-0.3453095, 0.09034589, -2.879019, 1, 1, 1, 1, 1,
-0.3396163, 0.6400183, -1.531493, 1, 1, 1, 1, 1,
-0.3383435, 2.15488, -0.2404496, 0, 0, 1, 1, 1,
-0.3339062, 0.5403416, 1.08785, 1, 0, 0, 1, 1,
-0.3287105, -0.3874244, -3.433858, 1, 0, 0, 1, 1,
-0.3230421, 0.8352437, -1.959962, 1, 0, 0, 1, 1,
-0.3214893, 0.009051233, -2.45871, 1, 0, 0, 1, 1,
-0.3201069, -0.7918868, -2.197316, 1, 0, 0, 1, 1,
-0.316046, 1.844799, 1.138527, 0, 0, 0, 1, 1,
-0.3150488, 0.08695652, 0.7300158, 0, 0, 0, 1, 1,
-0.3138641, -0.3133135, -1.738289, 0, 0, 0, 1, 1,
-0.3133736, 0.2933302, -1.497764, 0, 0, 0, 1, 1,
-0.3126768, -0.8490146, -4.125999, 0, 0, 0, 1, 1,
-0.3098938, -0.9668104, -2.132466, 0, 0, 0, 1, 1,
-0.3055245, -0.2368442, -2.059751, 0, 0, 0, 1, 1,
-0.3045605, 1.134879, 0.4190163, 1, 1, 1, 1, 1,
-0.3041989, 1.789924, 0.2242535, 1, 1, 1, 1, 1,
-0.302312, -0.7587066, -4.266338, 1, 1, 1, 1, 1,
-0.2957839, 0.2761904, -0.9230413, 1, 1, 1, 1, 1,
-0.2932203, -0.5184783, -0.3836777, 1, 1, 1, 1, 1,
-0.2888776, -0.06850121, -2.385815, 1, 1, 1, 1, 1,
-0.2839953, 0.629608, -1.118486, 1, 1, 1, 1, 1,
-0.2769296, 0.2113253, -2.451313, 1, 1, 1, 1, 1,
-0.2768109, 2.169178, -0.6819587, 1, 1, 1, 1, 1,
-0.2749436, -1.488603, -3.347353, 1, 1, 1, 1, 1,
-0.2734758, -0.2158066, -1.980332, 1, 1, 1, 1, 1,
-0.27275, 0.7412173, 0.3240858, 1, 1, 1, 1, 1,
-0.272379, -1.156641, -3.420766, 1, 1, 1, 1, 1,
-0.2655264, 2.54225, 0.7498561, 1, 1, 1, 1, 1,
-0.2597951, -0.01290665, -3.664783, 1, 1, 1, 1, 1,
-0.2555355, 0.1011579, -0.8397158, 0, 0, 1, 1, 1,
-0.2550297, 0.3801059, -0.0006823221, 1, 0, 0, 1, 1,
-0.2543899, 0.3585182, 0.6909446, 1, 0, 0, 1, 1,
-0.2533769, 0.08106074, -1.505934, 1, 0, 0, 1, 1,
-0.2506381, 0.1398472, -1.282569, 1, 0, 0, 1, 1,
-0.2497939, 0.6612996, -1.062892, 1, 0, 0, 1, 1,
-0.2475741, 0.08111684, 0.03087111, 0, 0, 0, 1, 1,
-0.2460357, -0.7172239, -2.778291, 0, 0, 0, 1, 1,
-0.2460279, -1.139578, -4.475841, 0, 0, 0, 1, 1,
-0.2446901, -0.830641, -3.355749, 0, 0, 0, 1, 1,
-0.2444511, 0.9910353, -0.7000257, 0, 0, 0, 1, 1,
-0.2399791, 2.045519, 0.5193589, 0, 0, 0, 1, 1,
-0.239692, 1.148201, 0.6890285, 0, 0, 0, 1, 1,
-0.2374543, 0.0563636, -1.971435, 1, 1, 1, 1, 1,
-0.237088, -0.3257914, -2.841472, 1, 1, 1, 1, 1,
-0.2367975, -0.5332865, -2.401672, 1, 1, 1, 1, 1,
-0.2365771, 0.860405, -0.7772668, 1, 1, 1, 1, 1,
-0.236059, -0.8118451, -3.926866, 1, 1, 1, 1, 1,
-0.2323085, 0.3794607, -2.547896, 1, 1, 1, 1, 1,
-0.2305864, -1.603052, -4.482579, 1, 1, 1, 1, 1,
-0.2269769, -0.06581455, -0.9155492, 1, 1, 1, 1, 1,
-0.2265731, -0.4073013, -2.577688, 1, 1, 1, 1, 1,
-0.2255476, -1.859611, -4.572651, 1, 1, 1, 1, 1,
-0.2247474, -0.9203648, -2.243578, 1, 1, 1, 1, 1,
-0.2219167, -0.7154608, -5.041801, 1, 1, 1, 1, 1,
-0.2208967, -0.3810029, -1.600504, 1, 1, 1, 1, 1,
-0.2195145, -0.8115112, -1.333063, 1, 1, 1, 1, 1,
-0.2189452, -0.9981583, -2.241869, 1, 1, 1, 1, 1,
-0.2182151, 0.5960323, -0.6743302, 0, 0, 1, 1, 1,
-0.2164254, -0.805747, -1.893342, 1, 0, 0, 1, 1,
-0.2069555, 1.476012, -0.6462972, 1, 0, 0, 1, 1,
-0.2038105, 0.1053724, -1.991693, 1, 0, 0, 1, 1,
-0.1921166, -1.025606, -3.466368, 1, 0, 0, 1, 1,
-0.1879234, -0.2063515, -0.1265702, 1, 0, 0, 1, 1,
-0.1860512, -0.3585366, -0.4498322, 0, 0, 0, 1, 1,
-0.1799482, 0.3420439, -1.360472, 0, 0, 0, 1, 1,
-0.1783018, 0.1797983, -0.4837566, 0, 0, 0, 1, 1,
-0.1760993, -0.9362651, -3.023523, 0, 0, 0, 1, 1,
-0.1759633, -1.059415, -1.80814, 0, 0, 0, 1, 1,
-0.1723913, 0.1283256, -3.825705, 0, 0, 0, 1, 1,
-0.1681432, -0.6771573, -3.89443, 0, 0, 0, 1, 1,
-0.16467, 1.863603, 0.01709647, 1, 1, 1, 1, 1,
-0.1588421, 1.409562, 1.20762, 1, 1, 1, 1, 1,
-0.1534848, 0.96492, -0.4292052, 1, 1, 1, 1, 1,
-0.1519431, -1.125107, -3.907002, 1, 1, 1, 1, 1,
-0.1503778, 1.095033, 0.6479723, 1, 1, 1, 1, 1,
-0.1399928, 0.5807316, -0.379449, 1, 1, 1, 1, 1,
-0.1360203, 0.5889206, -1.642889, 1, 1, 1, 1, 1,
-0.1284576, 0.08126228, -1.139285, 1, 1, 1, 1, 1,
-0.1247449, 0.07763589, -1.91309, 1, 1, 1, 1, 1,
-0.1215311, 0.2639103, -0.5841298, 1, 1, 1, 1, 1,
-0.119328, -1.103282, -2.052733, 1, 1, 1, 1, 1,
-0.1186548, -0.6838437, -1.478665, 1, 1, 1, 1, 1,
-0.1161036, -0.4930997, -4.113225, 1, 1, 1, 1, 1,
-0.1131772, -2.733443, -4.825862, 1, 1, 1, 1, 1,
-0.1130328, 0.7624149, 0.7282954, 1, 1, 1, 1, 1,
-0.1121614, 1.615495, -0.5246426, 0, 0, 1, 1, 1,
-0.1112654, 0.3814301, -0.6759914, 1, 0, 0, 1, 1,
-0.1084547, -1.57792, -3.051554, 1, 0, 0, 1, 1,
-0.1066871, 1.899841, 0.8514749, 1, 0, 0, 1, 1,
-0.1028509, -1.981829, -1.259384, 1, 0, 0, 1, 1,
-0.1027405, 1.350881, 0.1311603, 1, 0, 0, 1, 1,
-0.09852619, 0.002498997, -0.784116, 0, 0, 0, 1, 1,
-0.0892456, 0.3731028, -0.4688081, 0, 0, 0, 1, 1,
-0.0827295, -0.4424944, -2.146374, 0, 0, 0, 1, 1,
-0.08122078, -1.294324, -3.181762, 0, 0, 0, 1, 1,
-0.07684709, -0.01569066, -2.523606, 0, 0, 0, 1, 1,
-0.07569096, 1.801968, -0.1075625, 0, 0, 0, 1, 1,
-0.07549667, 0.2388715, -0.9991709, 0, 0, 0, 1, 1,
-0.07192218, -0.5886292, -3.969254, 1, 1, 1, 1, 1,
-0.07178842, -0.07421588, -2.120912, 1, 1, 1, 1, 1,
-0.07069284, -0.3714462, -2.474175, 1, 1, 1, 1, 1,
-0.07064465, 0.4009015, -1.475946, 1, 1, 1, 1, 1,
-0.06916996, 1.226351, -0.300512, 1, 1, 1, 1, 1,
-0.06775302, 0.5985746, -0.1092735, 1, 1, 1, 1, 1,
-0.06601136, 2.127949, -1.325191, 1, 1, 1, 1, 1,
-0.06553055, 0.6237137, 0.4692959, 1, 1, 1, 1, 1,
-0.05974855, -0.2685319, -1.724177, 1, 1, 1, 1, 1,
-0.05565947, 0.5210448, 0.3230468, 1, 1, 1, 1, 1,
-0.05519957, 1.313608, 1.993195, 1, 1, 1, 1, 1,
-0.05379885, 0.3541789, -2.149956, 1, 1, 1, 1, 1,
-0.05146391, -1.13658, -4.39548, 1, 1, 1, 1, 1,
-0.04919885, 0.6081988, -1.14172, 1, 1, 1, 1, 1,
-0.04776661, 0.8962494, -1.169213, 1, 1, 1, 1, 1,
-0.04640533, -1.481122, -3.944408, 0, 0, 1, 1, 1,
-0.0429391, 1.374665, 1.408232, 1, 0, 0, 1, 1,
-0.04232134, 0.4420036, 0.7623899, 1, 0, 0, 1, 1,
-0.04204408, 0.4073294, 0.4816018, 1, 0, 0, 1, 1,
-0.04028144, 0.2238156, -0.8781341, 1, 0, 0, 1, 1,
-0.03816485, 0.8835907, -0.6948053, 1, 0, 0, 1, 1,
-0.03271487, -1.716406, -3.370851, 0, 0, 0, 1, 1,
-0.0317326, -1.069631, -2.443478, 0, 0, 0, 1, 1,
-0.02718782, -0.5118868, -1.713694, 0, 0, 0, 1, 1,
-0.02628434, 0.870226, 1.243943, 0, 0, 0, 1, 1,
-0.02544123, -0.5165824, -3.498341, 0, 0, 0, 1, 1,
-0.02400436, 0.1339483, 0.3403699, 0, 0, 0, 1, 1,
-0.02317181, -0.5800511, -2.01922, 0, 0, 0, 1, 1,
-0.02264803, 1.329332, -0.01176632, 1, 1, 1, 1, 1,
-0.01583187, 0.5520312, -0.5616015, 1, 1, 1, 1, 1,
-0.01500444, 0.2808363, -0.1701068, 1, 1, 1, 1, 1,
-0.01465648, 0.9335425, -0.7355435, 1, 1, 1, 1, 1,
-0.01178107, -0.2112203, -3.978283, 1, 1, 1, 1, 1,
-0.01130835, 0.151942, 2.416486, 1, 1, 1, 1, 1,
-0.01080603, 0.4354143, -0.6725107, 1, 1, 1, 1, 1,
-0.01064791, 0.4335276, 1.333039, 1, 1, 1, 1, 1,
-0.008174698, -0.1167974, -2.393945, 1, 1, 1, 1, 1,
-0.00327159, 0.2869491, 1.747426, 1, 1, 1, 1, 1,
-0.002642416, -0.9541165, -3.292623, 1, 1, 1, 1, 1,
0.0002368155, 0.3046672, 1.049451, 1, 1, 1, 1, 1,
0.007496384, 0.4646949, -0.9546347, 1, 1, 1, 1, 1,
0.01140375, 0.2058794, 1.03351, 1, 1, 1, 1, 1,
0.0128087, -0.5870447, 2.352886, 1, 1, 1, 1, 1,
0.01317724, -0.7602424, 1.206445, 0, 0, 1, 1, 1,
0.01691633, -0.4012448, 2.89579, 1, 0, 0, 1, 1,
0.02110807, -0.4254086, 3.166565, 1, 0, 0, 1, 1,
0.02264076, -0.4357117, 1.540449, 1, 0, 0, 1, 1,
0.0228195, 0.2782135, 1.349767, 1, 0, 0, 1, 1,
0.02319436, 0.7390553, -1.109324, 1, 0, 0, 1, 1,
0.02522219, -1.572219, 4.024781, 0, 0, 0, 1, 1,
0.02672354, -0.2006243, 2.619707, 0, 0, 0, 1, 1,
0.02791139, 1.254622, 1.234253, 0, 0, 0, 1, 1,
0.03149274, 0.7808424, 1.35302, 0, 0, 0, 1, 1,
0.03307572, 1.975981, -0.7884369, 0, 0, 0, 1, 1,
0.03990605, 0.9799661, 0.3271101, 0, 0, 0, 1, 1,
0.04898361, 1.705209, 0.1765707, 0, 0, 0, 1, 1,
0.05905821, 0.667619, 0.1145345, 1, 1, 1, 1, 1,
0.05933731, -0.02045975, 1.406897, 1, 1, 1, 1, 1,
0.06161675, 1.249961, 0.5478743, 1, 1, 1, 1, 1,
0.06253378, -0.9301059, 2.928742, 1, 1, 1, 1, 1,
0.0682295, 0.3463466, 0.5238805, 1, 1, 1, 1, 1,
0.06860565, 0.5161372, 0.2215568, 1, 1, 1, 1, 1,
0.06863607, -1.043, 2.443942, 1, 1, 1, 1, 1,
0.06959601, -0.04763835, 3.84651, 1, 1, 1, 1, 1,
0.0757644, -0.06711359, 2.335323, 1, 1, 1, 1, 1,
0.07615189, -0.2124287, 1.752424, 1, 1, 1, 1, 1,
0.07994652, -0.02636785, 1.887845, 1, 1, 1, 1, 1,
0.08504589, -1.195765, 2.738925, 1, 1, 1, 1, 1,
0.08574939, -0.1454641, 1.970648, 1, 1, 1, 1, 1,
0.08729552, 0.5696255, -0.6211553, 1, 1, 1, 1, 1,
0.08734391, 1.256253, -0.2735945, 1, 1, 1, 1, 1,
0.09388421, -0.3601302, 2.682314, 0, 0, 1, 1, 1,
0.107438, 0.9022645, 0.1073248, 1, 0, 0, 1, 1,
0.1104971, -1.635146, 3.185595, 1, 0, 0, 1, 1,
0.1107539, 0.7750268, 0.1019367, 1, 0, 0, 1, 1,
0.1107781, -0.1973252, 3.168019, 1, 0, 0, 1, 1,
0.1108176, -2.395468, 1.257716, 1, 0, 0, 1, 1,
0.1131592, -0.09273461, 2.395934, 0, 0, 0, 1, 1,
0.1141855, -0.01289131, 2.117131, 0, 0, 0, 1, 1,
0.1170907, -0.6035395, 1.910497, 0, 0, 0, 1, 1,
0.1173009, 0.6247305, -0.02590487, 0, 0, 0, 1, 1,
0.1210772, 0.1330108, 1.791062, 0, 0, 0, 1, 1,
0.1215259, -0.4545518, 2.299235, 0, 0, 0, 1, 1,
0.1220657, 0.2183999, -0.1750925, 0, 0, 0, 1, 1,
0.1228191, 0.1676233, 0.2454112, 1, 1, 1, 1, 1,
0.1257994, -0.4073732, 3.423598, 1, 1, 1, 1, 1,
0.1272074, -0.4405666, 2.941721, 1, 1, 1, 1, 1,
0.1277321, 0.8056133, -0.9544622, 1, 1, 1, 1, 1,
0.1300568, 0.3961491, -0.7740176, 1, 1, 1, 1, 1,
0.1305185, 0.1926876, -1.610716, 1, 1, 1, 1, 1,
0.1306103, -0.5598055, 3.672848, 1, 1, 1, 1, 1,
0.1307362, -0.1921715, 3.065739, 1, 1, 1, 1, 1,
0.1412029, 0.7256662, 0.7849573, 1, 1, 1, 1, 1,
0.1413601, -0.4441769, 3.236985, 1, 1, 1, 1, 1,
0.1423946, -0.1762688, 2.915812, 1, 1, 1, 1, 1,
0.1434049, 0.03852284, 0.3044258, 1, 1, 1, 1, 1,
0.1466835, -0.4424137, 3.484267, 1, 1, 1, 1, 1,
0.1536511, 0.717774, -0.7859483, 1, 1, 1, 1, 1,
0.1553919, -0.2830206, 2.079141, 1, 1, 1, 1, 1,
0.1576962, -1.376305, 3.698853, 0, 0, 1, 1, 1,
0.1592597, -0.242987, 1.54024, 1, 0, 0, 1, 1,
0.1594349, 1.083747, -0.5415792, 1, 0, 0, 1, 1,
0.162314, -0.5127597, 2.911671, 1, 0, 0, 1, 1,
0.165993, 0.2485954, 2.044573, 1, 0, 0, 1, 1,
0.1664591, -0.001278223, 2.024464, 1, 0, 0, 1, 1,
0.1675456, 0.7745126, -0.9760971, 0, 0, 0, 1, 1,
0.1880897, 1.930908, 0.1539872, 0, 0, 0, 1, 1,
0.1883765, 0.2292988, 0.5241627, 0, 0, 0, 1, 1,
0.1893674, 0.9813771, -0.6767992, 0, 0, 0, 1, 1,
0.1944907, -0.01706792, 1.78495, 0, 0, 0, 1, 1,
0.198333, 1.231705, 1.238906, 0, 0, 0, 1, 1,
0.2058258, -2.156541, 3.745886, 0, 0, 0, 1, 1,
0.2080917, 1.213764, 1.725538, 1, 1, 1, 1, 1,
0.2085914, 0.2275282, 1.06141, 1, 1, 1, 1, 1,
0.2108516, -0.656863, 2.988724, 1, 1, 1, 1, 1,
0.2185844, -0.2736826, 1.876813, 1, 1, 1, 1, 1,
0.2235585, -0.3397407, 3.57168, 1, 1, 1, 1, 1,
0.2255613, -0.365066, 4.176198, 1, 1, 1, 1, 1,
0.2273766, -0.09567603, 1.647409, 1, 1, 1, 1, 1,
0.2285565, 0.09291986, -0.3164006, 1, 1, 1, 1, 1,
0.2446514, 0.2537055, 0.8031635, 1, 1, 1, 1, 1,
0.2496106, 1.461736, -0.7666259, 1, 1, 1, 1, 1,
0.2539474, -1.633503, 5.108052, 1, 1, 1, 1, 1,
0.2561442, 1.535626, 0.987963, 1, 1, 1, 1, 1,
0.2570305, -1.049442, 1.692811, 1, 1, 1, 1, 1,
0.2580941, 2.010287, -0.6426411, 1, 1, 1, 1, 1,
0.2640768, -0.4553488, 3.364795, 1, 1, 1, 1, 1,
0.2758934, -1.610296, 3.779492, 0, 0, 1, 1, 1,
0.2774727, 0.5105485, 2.137466, 1, 0, 0, 1, 1,
0.2801666, -0.4115321, 4.089137, 1, 0, 0, 1, 1,
0.2876644, -0.1501056, 2.114241, 1, 0, 0, 1, 1,
0.2899607, -1.899626, 4.015375, 1, 0, 0, 1, 1,
0.303086, 0.218262, 0.8940516, 1, 0, 0, 1, 1,
0.3033177, -0.9418489, 1.95546, 0, 0, 0, 1, 1,
0.3067225, -1.160254, 2.378837, 0, 0, 0, 1, 1,
0.3162421, -1.994588, 1.585611, 0, 0, 0, 1, 1,
0.3184637, 0.9772027, 0.5325201, 0, 0, 0, 1, 1,
0.3207625, -0.5745429, 0.4942269, 0, 0, 0, 1, 1,
0.3231362, -0.2503174, 2.973392, 0, 0, 0, 1, 1,
0.3238641, 0.1067984, 1.3718, 0, 0, 0, 1, 1,
0.324997, -0.9368136, 1.207576, 1, 1, 1, 1, 1,
0.3297892, 0.3107705, -0.369525, 1, 1, 1, 1, 1,
0.3346381, -0.820034, 3.479282, 1, 1, 1, 1, 1,
0.3392559, -0.4473252, 1.90167, 1, 1, 1, 1, 1,
0.3427787, 0.2066385, 1.988213, 1, 1, 1, 1, 1,
0.3513649, -0.4657997, 2.451014, 1, 1, 1, 1, 1,
0.3523825, 0.5095764, 0.1404142, 1, 1, 1, 1, 1,
0.3527402, 0.4868729, -0.4710067, 1, 1, 1, 1, 1,
0.3592111, 0.289735, -0.3550876, 1, 1, 1, 1, 1,
0.3633555, -0.5037451, 0.4842407, 1, 1, 1, 1, 1,
0.3652623, -0.1664446, 3.172928, 1, 1, 1, 1, 1,
0.3684062, 0.8246112, 1.029833, 1, 1, 1, 1, 1,
0.3686652, -0.4797923, 2.188757, 1, 1, 1, 1, 1,
0.3689218, 0.5189411, 1.901788, 1, 1, 1, 1, 1,
0.3731277, 0.603591, 1.313157, 1, 1, 1, 1, 1,
0.3740182, 0.7405187, -0.7173188, 0, 0, 1, 1, 1,
0.3753933, -1.635728, 2.596416, 1, 0, 0, 1, 1,
0.3757755, -0.9964046, 2.564119, 1, 0, 0, 1, 1,
0.376949, 0.7582294, 0.4659414, 1, 0, 0, 1, 1,
0.3804186, 1.153256, 2.210732, 1, 0, 0, 1, 1,
0.4003792, -0.2230709, 2.410388, 1, 0, 0, 1, 1,
0.4031027, -1.43335, 2.554544, 0, 0, 0, 1, 1,
0.4035231, 0.9219975, 0.9080598, 0, 0, 0, 1, 1,
0.4043313, 1.310182, 0.6875998, 0, 0, 0, 1, 1,
0.4052752, -0.7314059, 3.395279, 0, 0, 0, 1, 1,
0.405901, 0.1900004, 2.078071, 0, 0, 0, 1, 1,
0.4077288, 1.230218, 0.07416125, 0, 0, 0, 1, 1,
0.4081012, -1.120153, 5.356622, 0, 0, 0, 1, 1,
0.4081287, 0.3724256, 0.3925363, 1, 1, 1, 1, 1,
0.4095954, 1.229263, -0.6465372, 1, 1, 1, 1, 1,
0.4114147, 1.020297, 0.4001272, 1, 1, 1, 1, 1,
0.4133232, 0.5146399, 1.896344, 1, 1, 1, 1, 1,
0.4142668, 0.2886947, 0.3091085, 1, 1, 1, 1, 1,
0.4164324, -0.05030803, 0.782482, 1, 1, 1, 1, 1,
0.4245492, -0.6294089, 2.017351, 1, 1, 1, 1, 1,
0.4262319, -0.4575296, 2.238682, 1, 1, 1, 1, 1,
0.4263338, 0.4520265, 0.3410605, 1, 1, 1, 1, 1,
0.4284199, -0.3635805, 2.475095, 1, 1, 1, 1, 1,
0.4328787, -0.3086675, 0.4879309, 1, 1, 1, 1, 1,
0.4342509, -0.9535763, 3.325368, 1, 1, 1, 1, 1,
0.4383722, -0.4840766, 1.879663, 1, 1, 1, 1, 1,
0.4394575, -1.764418, 2.243361, 1, 1, 1, 1, 1,
0.4525851, -0.1475575, 1.994366, 1, 1, 1, 1, 1,
0.4536935, 1.329002, 0.6777587, 0, 0, 1, 1, 1,
0.4537547, -0.5051247, 1.830358, 1, 0, 0, 1, 1,
0.4539832, -0.3765869, 3.221948, 1, 0, 0, 1, 1,
0.4619639, -2.260225, 2.778622, 1, 0, 0, 1, 1,
0.4623512, -1.461408, 4.122438, 1, 0, 0, 1, 1,
0.469774, 1.106623, 1.099995, 1, 0, 0, 1, 1,
0.4724214, -0.585911, 1.828443, 0, 0, 0, 1, 1,
0.4729716, 1.484118, -0.198936, 0, 0, 0, 1, 1,
0.4781539, 0.828298, 1.247645, 0, 0, 0, 1, 1,
0.4787267, 1.7485, 2.236152, 0, 0, 0, 1, 1,
0.480552, 1.014153, 0.1321844, 0, 0, 0, 1, 1,
0.4855685, -1.380023, 1.830542, 0, 0, 0, 1, 1,
0.4950345, 1.512434, 0.6690001, 0, 0, 0, 1, 1,
0.4992662, -0.9311072, 0.5671946, 1, 1, 1, 1, 1,
0.503724, -0.6898065, 2.114974, 1, 1, 1, 1, 1,
0.504021, 0.3244486, 0.2253062, 1, 1, 1, 1, 1,
0.5110034, 1.629199, 0.3075406, 1, 1, 1, 1, 1,
0.5141466, -0.01982471, 0.3673194, 1, 1, 1, 1, 1,
0.5214113, -0.5417968, 4.420073, 1, 1, 1, 1, 1,
0.5248855, 1.100841, -1.154968, 1, 1, 1, 1, 1,
0.5283788, -0.5897294, 2.920697, 1, 1, 1, 1, 1,
0.5288671, -1.224184, 2.556107, 1, 1, 1, 1, 1,
0.5290315, 0.9126059, 0.6799163, 1, 1, 1, 1, 1,
0.5368925, -0.2412059, -0.2001684, 1, 1, 1, 1, 1,
0.5377987, 0.3974546, 0.9651975, 1, 1, 1, 1, 1,
0.5383955, 1.079903, 0.8348679, 1, 1, 1, 1, 1,
0.5385928, -1.291828, 3.714015, 1, 1, 1, 1, 1,
0.5443391, 2.645188, 1.012007, 1, 1, 1, 1, 1,
0.5456344, -0.8915837, 3.48377, 0, 0, 1, 1, 1,
0.5459949, -0.4310352, 0.7118578, 1, 0, 0, 1, 1,
0.5488962, -1.740758, 3.433687, 1, 0, 0, 1, 1,
0.5510148, 0.06464264, 0.8951141, 1, 0, 0, 1, 1,
0.5516922, -0.2096621, 2.300915, 1, 0, 0, 1, 1,
0.5520799, -1.275007, 4.105855, 1, 0, 0, 1, 1,
0.5527259, -0.09074821, 2.347992, 0, 0, 0, 1, 1,
0.5552827, -0.2146496, 1.725347, 0, 0, 0, 1, 1,
0.5582106, 0.1305632, 1.029834, 0, 0, 0, 1, 1,
0.5586786, 1.364366, 1.289367, 0, 0, 0, 1, 1,
0.5640085, 0.2652724, 1.788898, 0, 0, 0, 1, 1,
0.5662516, -0.9625942, 3.389296, 0, 0, 0, 1, 1,
0.5717431, 0.04098215, 1.088189, 0, 0, 0, 1, 1,
0.5733747, 0.6467246, 1.239717, 1, 1, 1, 1, 1,
0.5742996, -0.9541086, 2.26117, 1, 1, 1, 1, 1,
0.5743913, 0.1548784, 1.224256, 1, 1, 1, 1, 1,
0.5778252, 0.8764382, 1.521948, 1, 1, 1, 1, 1,
0.5790096, -0.9781153, 2.899564, 1, 1, 1, 1, 1,
0.5829321, 0.7024435, -0.6033495, 1, 1, 1, 1, 1,
0.5914956, -0.6234662, 2.072567, 1, 1, 1, 1, 1,
0.5940506, 1.387424, 0.3534135, 1, 1, 1, 1, 1,
0.5945001, 1.372959, 0.282551, 1, 1, 1, 1, 1,
0.595803, 0.8775795, 0.3711613, 1, 1, 1, 1, 1,
0.6004972, 0.7984943, 0.9270734, 1, 1, 1, 1, 1,
0.6031035, 0.4271329, 1.290425, 1, 1, 1, 1, 1,
0.6069264, 1.559919, 0.3536159, 1, 1, 1, 1, 1,
0.6076124, 0.207826, 2.047314, 1, 1, 1, 1, 1,
0.6100666, 0.1812663, 1.399687, 1, 1, 1, 1, 1,
0.6103221, -0.8324702, 3.637729, 0, 0, 1, 1, 1,
0.6120835, 1.870807, 0.664538, 1, 0, 0, 1, 1,
0.6123841, -1.076157, 2.035818, 1, 0, 0, 1, 1,
0.6153792, 0.6024631, -0.003840719, 1, 0, 0, 1, 1,
0.6174409, 0.4767438, 2.670946, 1, 0, 0, 1, 1,
0.6186078, 0.4214465, -0.6718999, 1, 0, 0, 1, 1,
0.6190696, 1.036661, 0.3187611, 0, 0, 0, 1, 1,
0.6194246, -0.2940438, 1.755881, 0, 0, 0, 1, 1,
0.6242545, -1.276981, 0.9230414, 0, 0, 0, 1, 1,
0.6252916, -0.8376784, 1.221296, 0, 0, 0, 1, 1,
0.6305116, -0.7881484, 1.710088, 0, 0, 0, 1, 1,
0.6345555, -0.8850324, 2.909863, 0, 0, 0, 1, 1,
0.6357486, 0.8023072, 0.3100584, 0, 0, 0, 1, 1,
0.6380555, 0.5374412, 0.8153022, 1, 1, 1, 1, 1,
0.638245, -0.880617, 0.875232, 1, 1, 1, 1, 1,
0.6397586, 1.372877, -0.6223118, 1, 1, 1, 1, 1,
0.6418504, -0.6947533, 2.132192, 1, 1, 1, 1, 1,
0.6482191, 1.369926, 1.898843, 1, 1, 1, 1, 1,
0.6484891, 1.562145, 1.713593, 1, 1, 1, 1, 1,
0.6500629, 0.4875627, -0.02243573, 1, 1, 1, 1, 1,
0.6547469, -1.314387, 2.896543, 1, 1, 1, 1, 1,
0.6559646, 1.343636, 1.442594, 1, 1, 1, 1, 1,
0.6591154, 0.02856321, 1.120573, 1, 1, 1, 1, 1,
0.6591839, 1.279721, 0.5368596, 1, 1, 1, 1, 1,
0.6653367, -0.1488726, 0.01839424, 1, 1, 1, 1, 1,
0.6655149, -0.3176721, 1.449556, 1, 1, 1, 1, 1,
0.6697129, 1.055805, 2.195484, 1, 1, 1, 1, 1,
0.6718125, -0.343005, 2.52103, 1, 1, 1, 1, 1,
0.6822153, -0.6012794, 4.879402, 0, 0, 1, 1, 1,
0.6831415, 2.507625, 2.161869, 1, 0, 0, 1, 1,
0.6857298, -0.5970414, 3.969477, 1, 0, 0, 1, 1,
0.6883086, 1.979502, -2.019814, 1, 0, 0, 1, 1,
0.6907293, -0.6167374, 3.398132, 1, 0, 0, 1, 1,
0.6918819, 1.240797, 1.513981, 1, 0, 0, 1, 1,
0.6919784, -1.646122, 2.201724, 0, 0, 0, 1, 1,
0.692987, -1.049572, 1.75067, 0, 0, 0, 1, 1,
0.6968319, -0.1724206, 2.80921, 0, 0, 0, 1, 1,
0.6971656, -0.4108697, 2.691088, 0, 0, 0, 1, 1,
0.6991308, -0.08692362, 0.3231575, 0, 0, 0, 1, 1,
0.7001073, -0.4017419, 1.441802, 0, 0, 0, 1, 1,
0.7098019, 0.992703, 0.9436085, 0, 0, 0, 1, 1,
0.7110081, 0.7983157, 0.7339624, 1, 1, 1, 1, 1,
0.712783, 1.952495, -2.263962, 1, 1, 1, 1, 1,
0.7187536, -1.891378, 1.23259, 1, 1, 1, 1, 1,
0.7277771, 0.284434, 1.10903, 1, 1, 1, 1, 1,
0.7328582, -0.407207, 1.089628, 1, 1, 1, 1, 1,
0.7331437, -1.137949, 1.777577, 1, 1, 1, 1, 1,
0.734322, -0.6661445, 2.11295, 1, 1, 1, 1, 1,
0.7358362, 0.1019432, 2.055392, 1, 1, 1, 1, 1,
0.7398819, 0.08700392, 1.055396, 1, 1, 1, 1, 1,
0.7421235, -2.335622, 3.853616, 1, 1, 1, 1, 1,
0.7456409, 1.057699, 0.9512693, 1, 1, 1, 1, 1,
0.7474421, 0.00415458, 1.650993, 1, 1, 1, 1, 1,
0.7495312, 0.8500292, 0.8438413, 1, 1, 1, 1, 1,
0.7498997, -0.5707765, 2.583461, 1, 1, 1, 1, 1,
0.7511269, 0.2538302, 1.566582, 1, 1, 1, 1, 1,
0.757201, 1.130529, 2.46479, 0, 0, 1, 1, 1,
0.7635073, 0.05708573, 0.4011854, 1, 0, 0, 1, 1,
0.7645246, -0.1517162, 2.545071, 1, 0, 0, 1, 1,
0.7733735, -0.5878754, 2.266539, 1, 0, 0, 1, 1,
0.7765586, -1.433256, 0.5579206, 1, 0, 0, 1, 1,
0.7824516, 1.207566, 0.8117529, 1, 0, 0, 1, 1,
0.7832001, -0.6263961, 2.2887, 0, 0, 0, 1, 1,
0.7874494, 1.314087, -0.1102542, 0, 0, 0, 1, 1,
0.7879459, -1.320998, 2.894066, 0, 0, 0, 1, 1,
0.7936261, 0.5302125, 3.478487, 0, 0, 0, 1, 1,
0.7956901, -1.13811, 1.398664, 0, 0, 0, 1, 1,
0.7984834, 1.039653, -0.4669695, 0, 0, 0, 1, 1,
0.8162636, -0.41591, 1.085763, 0, 0, 0, 1, 1,
0.8210282, -1.207289, 1.854656, 1, 1, 1, 1, 1,
0.8223078, 0.6381791, 1.528265, 1, 1, 1, 1, 1,
0.8290336, 0.5920467, 1.781839, 1, 1, 1, 1, 1,
0.8293974, 0.2359625, 2.060793, 1, 1, 1, 1, 1,
0.8448597, -0.669776, 1.898959, 1, 1, 1, 1, 1,
0.8478554, -1.165944, 3.299897, 1, 1, 1, 1, 1,
0.8479958, 1.21064, 1.782809, 1, 1, 1, 1, 1,
0.8517171, 1.055931, -0.05413528, 1, 1, 1, 1, 1,
0.8531319, -0.7781626, 2.707857, 1, 1, 1, 1, 1,
0.8545251, 0.5248979, 0.1688977, 1, 1, 1, 1, 1,
0.8545911, -0.7459043, 1.993143, 1, 1, 1, 1, 1,
0.854911, -0.7743403, 3.055784, 1, 1, 1, 1, 1,
0.8580675, 0.6479878, 2.201515, 1, 1, 1, 1, 1,
0.8598495, -0.4668413, 1.138724, 1, 1, 1, 1, 1,
0.8659434, 0.6948471, 0.02289939, 1, 1, 1, 1, 1,
0.8663558, 1.190313, 1.528863, 0, 0, 1, 1, 1,
0.868507, 1.238314, 0.2884704, 1, 0, 0, 1, 1,
0.8718635, 1.4421, -0.04875946, 1, 0, 0, 1, 1,
0.8774279, -0.3819612, 2.064698, 1, 0, 0, 1, 1,
0.8790055, 1.022322, 0.9885428, 1, 0, 0, 1, 1,
0.8852828, -0.6992637, 1.047499, 1, 0, 0, 1, 1,
0.8875517, -0.1932345, 1.201339, 0, 0, 0, 1, 1,
0.8892112, -0.7810473, 1.822585, 0, 0, 0, 1, 1,
0.8914576, 0.04625323, 1.043048, 0, 0, 0, 1, 1,
0.892665, -0.02705933, 3.072608, 0, 0, 0, 1, 1,
0.9011669, -1.560018, 1.451996, 0, 0, 0, 1, 1,
0.903909, -0.4675486, 2.197257, 0, 0, 0, 1, 1,
0.9076098, 1.182079, 0.4131593, 0, 0, 0, 1, 1,
0.9087583, -0.7396424, 2.955582, 1, 1, 1, 1, 1,
0.9139801, 2.097398, -1.68462, 1, 1, 1, 1, 1,
0.9193081, 0.7067081, 0.05081667, 1, 1, 1, 1, 1,
0.9236202, 0.8511418, 1.551396, 1, 1, 1, 1, 1,
0.9268559, 0.02895677, 2.35191, 1, 1, 1, 1, 1,
0.9301826, -1.743895, 3.167966, 1, 1, 1, 1, 1,
0.9380884, -0.4241769, 3.510511, 1, 1, 1, 1, 1,
0.9412401, 1.045276, 0.217546, 1, 1, 1, 1, 1,
0.9438211, -0.636721, 4.268377, 1, 1, 1, 1, 1,
0.9465187, -0.8120077, 1.760706, 1, 1, 1, 1, 1,
0.9471007, 0.2268327, 2.222489, 1, 1, 1, 1, 1,
0.9596189, 2.843427, 1.936568, 1, 1, 1, 1, 1,
0.9597624, 1.019541, 0.06154069, 1, 1, 1, 1, 1,
0.9649647, -0.230262, 1.701929, 1, 1, 1, 1, 1,
0.9655653, 1.754814, 0.1612723, 1, 1, 1, 1, 1,
0.9681365, -1.076003, 3.036809, 0, 0, 1, 1, 1,
0.9695393, 2.388884, -0.9731432, 1, 0, 0, 1, 1,
0.9781232, 1.336784, 0.2910583, 1, 0, 0, 1, 1,
0.9783466, -0.986968, 2.339189, 1, 0, 0, 1, 1,
0.9786115, -0.1868037, 2.497954, 1, 0, 0, 1, 1,
0.981712, 0.1012397, 2.642294, 1, 0, 0, 1, 1,
0.9849603, 0.2620424, 2.442307, 0, 0, 0, 1, 1,
0.9854359, -0.4246085, 1.491819, 0, 0, 0, 1, 1,
0.9866685, 0.9721061, 2.03208, 0, 0, 0, 1, 1,
0.9903898, 0.09970054, 2.724457, 0, 0, 0, 1, 1,
0.993005, 1.166537, -0.06870962, 0, 0, 0, 1, 1,
0.9986145, -0.268225, 2.682376, 0, 0, 0, 1, 1,
1.002935, -0.03728449, 1.790042, 0, 0, 0, 1, 1,
1.006666, 1.412286, -0.5665207, 1, 1, 1, 1, 1,
1.008959, 0.3622615, 1.046453, 1, 1, 1, 1, 1,
1.013306, 0.9805444, 1.289125, 1, 1, 1, 1, 1,
1.013959, -0.9660499, 1.139434, 1, 1, 1, 1, 1,
1.014822, -0.06552377, -0.3758383, 1, 1, 1, 1, 1,
1.020843, 0.4552796, -0.1311228, 1, 1, 1, 1, 1,
1.021501, -0.2164742, 2.504891, 1, 1, 1, 1, 1,
1.023767, 1.054903, 2.054305, 1, 1, 1, 1, 1,
1.030642, -0.885165, 0.7259913, 1, 1, 1, 1, 1,
1.058431, 0.2399496, 1.515199, 1, 1, 1, 1, 1,
1.060366, -0.07359762, 2.18299, 1, 1, 1, 1, 1,
1.06239, 1.258618, 1.476383, 1, 1, 1, 1, 1,
1.063366, -1.039637, 1.495673, 1, 1, 1, 1, 1,
1.066395, 0.7456479, -0.3095911, 1, 1, 1, 1, 1,
1.068913, -1.061395, 1.89526, 1, 1, 1, 1, 1,
1.068974, 0.1323702, 0.69162, 0, 0, 1, 1, 1,
1.080303, 0.05418944, 0.569621, 1, 0, 0, 1, 1,
1.083802, 1.808847, 0.5206861, 1, 0, 0, 1, 1,
1.086835, -0.0842352, 1.675999, 1, 0, 0, 1, 1,
1.092633, 1.179324, 0.5575609, 1, 0, 0, 1, 1,
1.094321, -0.008405692, 1.781193, 1, 0, 0, 1, 1,
1.105303, 1.109477, -0.64787, 0, 0, 0, 1, 1,
1.106443, 0.2658161, 1.874355, 0, 0, 0, 1, 1,
1.119176, -1.776862, 6.191683, 0, 0, 0, 1, 1,
1.124065, -0.9292797, 1.208846, 0, 0, 0, 1, 1,
1.124264, 0.3950441, 1.527719, 0, 0, 0, 1, 1,
1.130241, -0.6827857, 3.250964, 0, 0, 0, 1, 1,
1.130766, -1.25063, 1.693255, 0, 0, 0, 1, 1,
1.137512, 0.06969573, 1.217821, 1, 1, 1, 1, 1,
1.139888, 1.358006, 0.525861, 1, 1, 1, 1, 1,
1.148446, -2.655547, 1.731609, 1, 1, 1, 1, 1,
1.148635, 0.03686932, 2.115407, 1, 1, 1, 1, 1,
1.150399, 0.4439962, 0.02938439, 1, 1, 1, 1, 1,
1.155796, 0.4483073, 3.790924, 1, 1, 1, 1, 1,
1.16982, -0.4872999, 1.369933, 1, 1, 1, 1, 1,
1.170609, 0.6812209, 1.870509, 1, 1, 1, 1, 1,
1.172993, 0.008005358, 0.03946321, 1, 1, 1, 1, 1,
1.182383, -1.251007, 3.262845, 1, 1, 1, 1, 1,
1.188248, 0.02751791, 1.504771, 1, 1, 1, 1, 1,
1.198202, 0.1844698, -0.1718465, 1, 1, 1, 1, 1,
1.203486, 0.9008638, 2.227834, 1, 1, 1, 1, 1,
1.207355, -0.05124756, 1.691371, 1, 1, 1, 1, 1,
1.209237, 1.141083, 0.7915771, 1, 1, 1, 1, 1,
1.210489, 1.664548, 1.113401, 0, 0, 1, 1, 1,
1.21111, 0.7477114, 0.9602613, 1, 0, 0, 1, 1,
1.213364, -1.558321, 1.56037, 1, 0, 0, 1, 1,
1.213495, -0.3181829, 2.058191, 1, 0, 0, 1, 1,
1.224341, 0.3771609, -0.6363853, 1, 0, 0, 1, 1,
1.225828, 1.240577, -1.29002, 1, 0, 0, 1, 1,
1.233971, -0.3366612, 2.350014, 0, 0, 0, 1, 1,
1.237599, -1.17775, 0.8257816, 0, 0, 0, 1, 1,
1.241642, -1.668951, 3.281199, 0, 0, 0, 1, 1,
1.245095, -1.245019, 0.5116647, 0, 0, 0, 1, 1,
1.247575, 0.8446553, -0.6490126, 0, 0, 0, 1, 1,
1.251413, -2.186886, 3.11462, 0, 0, 0, 1, 1,
1.272231, -0.3427581, 1.332617, 0, 0, 0, 1, 1,
1.27679, 1.40603, -0.2448102, 1, 1, 1, 1, 1,
1.278154, -0.5075039, 0.5797207, 1, 1, 1, 1, 1,
1.287705, -0.474485, 1.472797, 1, 1, 1, 1, 1,
1.291901, 0.694849, 0.09813001, 1, 1, 1, 1, 1,
1.292595, -0.2022307, 2.981876, 1, 1, 1, 1, 1,
1.293884, 0.4576766, 1.048574, 1, 1, 1, 1, 1,
1.296492, 1.357025, -0.05389491, 1, 1, 1, 1, 1,
1.301004, 0.2958085, 0.9105514, 1, 1, 1, 1, 1,
1.310999, -0.3306932, 0.6294786, 1, 1, 1, 1, 1,
1.322374, 2.105872, 0.5795605, 1, 1, 1, 1, 1,
1.325366, -0.856436, 1.006071, 1, 1, 1, 1, 1,
1.328442, -1.497828, 3.417272, 1, 1, 1, 1, 1,
1.335677, -0.4335431, 1.467478, 1, 1, 1, 1, 1,
1.336965, -0.5885853, 1.041341, 1, 1, 1, 1, 1,
1.340046, 0.1682495, 1.560646, 1, 1, 1, 1, 1,
1.345608, 0.04888342, 2.511511, 0, 0, 1, 1, 1,
1.36259, 1.366863, 0.8729998, 1, 0, 0, 1, 1,
1.3699, -0.5829319, 0.8221276, 1, 0, 0, 1, 1,
1.378665, 1.291595, -0.1787199, 1, 0, 0, 1, 1,
1.40469, -1.087186, 4.142548, 1, 0, 0, 1, 1,
1.417872, -0.9210885, 2.182231, 1, 0, 0, 1, 1,
1.42052, -0.2476831, 1.407408, 0, 0, 0, 1, 1,
1.423387, 0.3384106, 2.788571, 0, 0, 0, 1, 1,
1.429469, 1.415329, 2.521658, 0, 0, 0, 1, 1,
1.430303, -0.4339455, 1.880504, 0, 0, 0, 1, 1,
1.435189, -0.3011005, 3.278955, 0, 0, 0, 1, 1,
1.441433, -0.3468045, 0.4719814, 0, 0, 0, 1, 1,
1.44365, -0.1239955, 2.232124, 0, 0, 0, 1, 1,
1.448046, -0.5998427, 1.832494, 1, 1, 1, 1, 1,
1.466132, -0.482915, 2.597915, 1, 1, 1, 1, 1,
1.478653, -1.015465, 1.775348, 1, 1, 1, 1, 1,
1.495905, -2.000001, 3.85534, 1, 1, 1, 1, 1,
1.501114, -0.354192, 1.674048, 1, 1, 1, 1, 1,
1.508785, 0.8850269, 2.475044, 1, 1, 1, 1, 1,
1.509672, -0.06808356, 2.161942, 1, 1, 1, 1, 1,
1.518819, -0.1235502, 2.34923, 1, 1, 1, 1, 1,
1.519129, 0.4797874, 0.5712707, 1, 1, 1, 1, 1,
1.521268, 1.082248, 1.57663, 1, 1, 1, 1, 1,
1.521372, 0.8520433, 0.9038876, 1, 1, 1, 1, 1,
1.527072, -0.1465216, 0.8643401, 1, 1, 1, 1, 1,
1.528046, 0.2546331, -0.03853795, 1, 1, 1, 1, 1,
1.531514, 0.1028108, 2.130803, 1, 1, 1, 1, 1,
1.555805, -0.02517045, 2.225045, 1, 1, 1, 1, 1,
1.56581, 0.9755484, 2.218882, 0, 0, 1, 1, 1,
1.586735, -0.9336633, 2.442953, 1, 0, 0, 1, 1,
1.609695, 1.197673, 0.9917394, 1, 0, 0, 1, 1,
1.627745, 1.120036, 0.7434208, 1, 0, 0, 1, 1,
1.647648, 0.539821, 1.747386, 1, 0, 0, 1, 1,
1.650215, -0.344964, 1.040835, 1, 0, 0, 1, 1,
1.673756, 0.158062, -0.08090365, 0, 0, 0, 1, 1,
1.68375, 0.1775925, 2.079234, 0, 0, 0, 1, 1,
1.708061, -0.3936597, 0.3552747, 0, 0, 0, 1, 1,
1.714375, -0.3082389, 0.03052387, 0, 0, 0, 1, 1,
1.721347, -0.08552366, 1.384402, 0, 0, 0, 1, 1,
1.730179, 0.04868282, 1.04147, 0, 0, 0, 1, 1,
1.753886, -0.9051166, -0.06073586, 0, 0, 0, 1, 1,
1.784171, -1.325725, 2.760229, 1, 1, 1, 1, 1,
1.798913, 1.347536, 0.9380184, 1, 1, 1, 1, 1,
1.799629, 1.043952, 1.018421, 1, 1, 1, 1, 1,
1.805071, 0.4408588, 0.6408122, 1, 1, 1, 1, 1,
1.830869, 0.7971909, 1.478889, 1, 1, 1, 1, 1,
1.864639, -0.121684, 2.134014, 1, 1, 1, 1, 1,
1.894387, -0.1729316, -0.07388049, 1, 1, 1, 1, 1,
1.915744, -0.1487273, 1.947243, 1, 1, 1, 1, 1,
1.941135, 0.1788834, 2.361544, 1, 1, 1, 1, 1,
1.949092, -0.004404708, 2.521597, 1, 1, 1, 1, 1,
1.970205, 1.099283, 0.6344112, 1, 1, 1, 1, 1,
1.971172, -0.2483593, 2.627837, 1, 1, 1, 1, 1,
2.007725, 1.236994, 0.2351651, 1, 1, 1, 1, 1,
2.01842, -0.3977951, 2.165055, 1, 1, 1, 1, 1,
2.040382, 0.7014676, 2.439032, 1, 1, 1, 1, 1,
2.071671, 0.5383127, 1.387207, 0, 0, 1, 1, 1,
2.083039, -0.7811581, 4.591306, 1, 0, 0, 1, 1,
2.093456, 0.04168977, 2.446479, 1, 0, 0, 1, 1,
2.09474, 0.2133782, -0.4590637, 1, 0, 0, 1, 1,
2.096242, -1.047807, 2.407544, 1, 0, 0, 1, 1,
2.113295, 0.9234591, 1.053427, 1, 0, 0, 1, 1,
2.123669, 1.415835, 1.860456, 0, 0, 0, 1, 1,
2.131647, 0.1812061, 1.567029, 0, 0, 0, 1, 1,
2.161988, 0.6057574, -1.244651, 0, 0, 0, 1, 1,
2.176816, 1.209253, 0.8737622, 0, 0, 0, 1, 1,
2.204704, -0.855046, 1.348725, 0, 0, 0, 1, 1,
2.252385, 2.035847, 1.381834, 0, 0, 0, 1, 1,
2.309736, -0.7084897, 2.980749, 0, 0, 0, 1, 1,
2.355859, -0.8427744, 0.4193911, 1, 1, 1, 1, 1,
2.412448, -0.3207188, 0.8080618, 1, 1, 1, 1, 1,
2.413264, 0.8459619, 2.419261, 1, 1, 1, 1, 1,
2.456218, 1.580174, 0.1419199, 1, 1, 1, 1, 1,
2.550766, 0.1258374, 0.9201334, 1, 1, 1, 1, 1,
2.666264, 0.5270685, 1.587329, 1, 1, 1, 1, 1,
2.669872, -0.3851503, 2.496487, 1, 1, 1, 1, 1
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
var radius = 9.476794;
var distance = 33.28684;
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
mvMatrix.translate( 0.2668214, -0.05499208, -0.5303741 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.28684);
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
